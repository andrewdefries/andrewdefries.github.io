---
output:
  html_document:
    self_contained: no
---

```r
library(knitr)
knit_hooks$set(webgl = hook_webgl)
cat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')
```

<script type="text/javascript">
CanvasMatrix4=function(m){if(typeof m=='object'){if("length"in m&&m.length>=16){this.load(m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15]);return}else if(m instanceof CanvasMatrix4){this.load(m);return}}this.makeIdentity()};CanvasMatrix4.prototype.load=function(){if(arguments.length==1&&typeof arguments[0]=='object'){var matrix=arguments[0];if("length"in matrix&&matrix.length==16){this.m11=matrix[0];this.m12=matrix[1];this.m13=matrix[2];this.m14=matrix[3];this.m21=matrix[4];this.m22=matrix[5];this.m23=matrix[6];this.m24=matrix[7];this.m31=matrix[8];this.m32=matrix[9];this.m33=matrix[10];this.m34=matrix[11];this.m41=matrix[12];this.m42=matrix[13];this.m43=matrix[14];this.m44=matrix[15];return}if(arguments[0]instanceof CanvasMatrix4){this.m11=matrix.m11;this.m12=matrix.m12;this.m13=matrix.m13;this.m14=matrix.m14;this.m21=matrix.m21;this.m22=matrix.m22;this.m23=matrix.m23;this.m24=matrix.m24;this.m31=matrix.m31;this.m32=matrix.m32;this.m33=matrix.m33;this.m34=matrix.m34;this.m41=matrix.m41;this.m42=matrix.m42;this.m43=matrix.m43;this.m44=matrix.m44;return}}this.makeIdentity()};CanvasMatrix4.prototype.getAsArray=function(){return[this.m11,this.m12,this.m13,this.m14,this.m21,this.m22,this.m23,this.m24,this.m31,this.m32,this.m33,this.m34,this.m41,this.m42,this.m43,this.m44]};CanvasMatrix4.prototype.getAsWebGLFloatArray=function(){return new WebGLFloatArray(this.getAsArray())};CanvasMatrix4.prototype.makeIdentity=function(){this.m11=1;this.m12=0;this.m13=0;this.m14=0;this.m21=0;this.m22=1;this.m23=0;this.m24=0;this.m31=0;this.m32=0;this.m33=1;this.m34=0;this.m41=0;this.m42=0;this.m43=0;this.m44=1};CanvasMatrix4.prototype.transpose=function(){var tmp=this.m12;this.m12=this.m21;this.m21=tmp;tmp=this.m13;this.m13=this.m31;this.m31=tmp;tmp=this.m14;this.m14=this.m41;this.m41=tmp;tmp=this.m23;this.m23=this.m32;this.m32=tmp;tmp=this.m24;this.m24=this.m42;this.m42=tmp;tmp=this.m34;this.m34=this.m43;this.m43=tmp};CanvasMatrix4.prototype.invert=function(){var det=this._determinant4x4();if(Math.abs(det)<1e-8)return null;this._makeAdjoint();this.m11/=det;this.m12/=det;this.m13/=det;this.m14/=det;this.m21/=det;this.m22/=det;this.m23/=det;this.m24/=det;this.m31/=det;this.m32/=det;this.m33/=det;this.m34/=det;this.m41/=det;this.m42/=det;this.m43/=det;this.m44/=det};CanvasMatrix4.prototype.translate=function(x,y,z){if(x==undefined)x=0;if(y==undefined)y=0;if(z==undefined)z=0;var matrix=new CanvasMatrix4();matrix.m41=x;matrix.m42=y;matrix.m43=z;this.multRight(matrix)};CanvasMatrix4.prototype.scale=function(x,y,z){if(x==undefined)x=1;if(z==undefined){if(y==undefined){y=x;z=x}else z=1}else if(y==undefined)y=x;var matrix=new CanvasMatrix4();matrix.m11=x;matrix.m22=y;matrix.m33=z;this.multRight(matrix)};CanvasMatrix4.prototype.rotate=function(angle,x,y,z){angle=angle/180*Math.PI;angle/=2;var sinA=Math.sin(angle);var cosA=Math.cos(angle);var sinA2=sinA*sinA;var length=Math.sqrt(x*x+y*y+z*z);if(length==0){x=0;y=0;z=1}else if(length!=1){x/=length;y/=length;z/=length}var mat=new CanvasMatrix4();if(x==1&&y==0&&z==0){mat.m11=1;mat.m12=0;mat.m13=0;mat.m21=0;mat.m22=1-2*sinA2;mat.m23=2*sinA*cosA;mat.m31=0;mat.m32=-2*sinA*cosA;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==1&&z==0){mat.m11=1-2*sinA2;mat.m12=0;mat.m13=-2*sinA*cosA;mat.m21=0;mat.m22=1;mat.m23=0;mat.m31=2*sinA*cosA;mat.m32=0;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==0&&z==1){mat.m11=1-2*sinA2;mat.m12=2*sinA*cosA;mat.m13=0;mat.m21=-2*sinA*cosA;mat.m22=1-2*sinA2;mat.m23=0;mat.m31=0;mat.m32=0;mat.m33=1;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else{var x2=x*x;var y2=y*y;var z2=z*z;mat.m11=1-2*(y2+z2)*sinA2;mat.m12=2*(x*y*sinA2+z*sinA*cosA);mat.m13=2*(x*z*sinA2-y*sinA*cosA);mat.m21=2*(y*x*sinA2-z*sinA*cosA);mat.m22=1-2*(z2+x2)*sinA2;mat.m23=2*(y*z*sinA2+x*sinA*cosA);mat.m31=2*(z*x*sinA2+y*sinA*cosA);mat.m32=2*(z*y*sinA2-x*sinA*cosA);mat.m33=1-2*(x2+y2)*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}this.multRight(mat)};CanvasMatrix4.prototype.multRight=function(mat){var m11=(this.m11*mat.m11+this.m12*mat.m21+this.m13*mat.m31+this.m14*mat.m41);var m12=(this.m11*mat.m12+this.m12*mat.m22+this.m13*mat.m32+this.m14*mat.m42);var m13=(this.m11*mat.m13+this.m12*mat.m23+this.m13*mat.m33+this.m14*mat.m43);var m14=(this.m11*mat.m14+this.m12*mat.m24+this.m13*mat.m34+this.m14*mat.m44);var m21=(this.m21*mat.m11+this.m22*mat.m21+this.m23*mat.m31+this.m24*mat.m41);var m22=(this.m21*mat.m12+this.m22*mat.m22+this.m23*mat.m32+this.m24*mat.m42);var m23=(this.m21*mat.m13+this.m22*mat.m23+this.m23*mat.m33+this.m24*mat.m43);var m24=(this.m21*mat.m14+this.m22*mat.m24+this.m23*mat.m34+this.m24*mat.m44);var m31=(this.m31*mat.m11+this.m32*mat.m21+this.m33*mat.m31+this.m34*mat.m41);var m32=(this.m31*mat.m12+this.m32*mat.m22+this.m33*mat.m32+this.m34*mat.m42);var m33=(this.m31*mat.m13+this.m32*mat.m23+this.m33*mat.m33+this.m34*mat.m43);var m34=(this.m31*mat.m14+this.m32*mat.m24+this.m33*mat.m34+this.m34*mat.m44);var m41=(this.m41*mat.m11+this.m42*mat.m21+this.m43*mat.m31+this.m44*mat.m41);var m42=(this.m41*mat.m12+this.m42*mat.m22+this.m43*mat.m32+this.m44*mat.m42);var m43=(this.m41*mat.m13+this.m42*mat.m23+this.m43*mat.m33+this.m44*mat.m43);var m44=(this.m41*mat.m14+this.m42*mat.m24+this.m43*mat.m34+this.m44*mat.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.multLeft=function(mat){var m11=(mat.m11*this.m11+mat.m12*this.m21+mat.m13*this.m31+mat.m14*this.m41);var m12=(mat.m11*this.m12+mat.m12*this.m22+mat.m13*this.m32+mat.m14*this.m42);var m13=(mat.m11*this.m13+mat.m12*this.m23+mat.m13*this.m33+mat.m14*this.m43);var m14=(mat.m11*this.m14+mat.m12*this.m24+mat.m13*this.m34+mat.m14*this.m44);var m21=(mat.m21*this.m11+mat.m22*this.m21+mat.m23*this.m31+mat.m24*this.m41);var m22=(mat.m21*this.m12+mat.m22*this.m22+mat.m23*this.m32+mat.m24*this.m42);var m23=(mat.m21*this.m13+mat.m22*this.m23+mat.m23*this.m33+mat.m24*this.m43);var m24=(mat.m21*this.m14+mat.m22*this.m24+mat.m23*this.m34+mat.m24*this.m44);var m31=(mat.m31*this.m11+mat.m32*this.m21+mat.m33*this.m31+mat.m34*this.m41);var m32=(mat.m31*this.m12+mat.m32*this.m22+mat.m33*this.m32+mat.m34*this.m42);var m33=(mat.m31*this.m13+mat.m32*this.m23+mat.m33*this.m33+mat.m34*this.m43);var m34=(mat.m31*this.m14+mat.m32*this.m24+mat.m33*this.m34+mat.m34*this.m44);var m41=(mat.m41*this.m11+mat.m42*this.m21+mat.m43*this.m31+mat.m44*this.m41);var m42=(mat.m41*this.m12+mat.m42*this.m22+mat.m43*this.m32+mat.m44*this.m42);var m43=(mat.m41*this.m13+mat.m42*this.m23+mat.m43*this.m33+mat.m44*this.m43);var m44=(mat.m41*this.m14+mat.m42*this.m24+mat.m43*this.m34+mat.m44*this.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.ortho=function(left,right,bottom,top,near,far){var tx=(left+right)/(left-right);var ty=(top+bottom)/(top-bottom);var tz=(far+near)/(far-near);var matrix=new CanvasMatrix4();matrix.m11=2/(left-right);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=0;matrix.m32=0;matrix.m33=-2/(far-near);matrix.m34=0;matrix.m41=tx;matrix.m42=ty;matrix.m43=tz;matrix.m44=1;this.multRight(matrix)};CanvasMatrix4.prototype.frustum=function(left,right,bottom,top,near,far){var matrix=new CanvasMatrix4();var A=(right+left)/(right-left);var B=(top+bottom)/(top-bottom);var C=-(far+near)/(far-near);var D=-(2*far*near)/(far-near);matrix.m11=(2*near)/(right-left);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2*near/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=A;matrix.m32=B;matrix.m33=C;matrix.m34=-1;matrix.m41=0;matrix.m42=0;matrix.m43=D;matrix.m44=0;this.multRight(matrix)};CanvasMatrix4.prototype.perspective=function(fovy,aspect,zNear,zFar){var top=Math.tan(fovy*Math.PI/360)*zNear;var bottom=-top;var left=aspect*bottom;var right=aspect*top;this.frustum(left,right,bottom,top,zNear,zFar)};CanvasMatrix4.prototype.lookat=function(eyex,eyey,eyez,centerx,centery,centerz,upx,upy,upz){var matrix=new CanvasMatrix4();var zx=eyex-centerx;var zy=eyey-centery;var zz=eyez-centerz;var mag=Math.sqrt(zx*zx+zy*zy+zz*zz);if(mag){zx/=mag;zy/=mag;zz/=mag}var yx=upx;var yy=upy;var yz=upz;xx=yy*zz-yz*zy;xy=-yx*zz+yz*zx;xz=yx*zy-yy*zx;yx=zy*xz-zz*xy;yy=-zx*xz+zz*xx;yx=zx*xy-zy*xx;mag=Math.sqrt(xx*xx+xy*xy+xz*xz);if(mag){xx/=mag;xy/=mag;xz/=mag}mag=Math.sqrt(yx*yx+yy*yy+yz*yz);if(mag){yx/=mag;yy/=mag;yz/=mag}matrix.m11=xx;matrix.m12=xy;matrix.m13=xz;matrix.m14=0;matrix.m21=yx;matrix.m22=yy;matrix.m23=yz;matrix.m24=0;matrix.m31=zx;matrix.m32=zy;matrix.m33=zz;matrix.m34=0;matrix.m41=0;matrix.m42=0;matrix.m43=0;matrix.m44=1;matrix.translate(-eyex,-eyey,-eyez);this.multRight(matrix)};CanvasMatrix4.prototype._determinant2x2=function(a,b,c,d){return a*d-b*c};CanvasMatrix4.prototype._determinant3x3=function(a1,a2,a3,b1,b2,b3,c1,c2,c3){return a1*this._determinant2x2(b2,b3,c2,c3)-b1*this._determinant2x2(a2,a3,c2,c3)+c1*this._determinant2x2(a2,a3,b2,b3)};CanvasMatrix4.prototype._determinant4x4=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;return a1*this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4)-b1*this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4)+c1*this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4)-d1*this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4)};CanvasMatrix4.prototype._makeAdjoint=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;this.m11=this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4);this.m21=-this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4);this.m31=this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4);this.m41=-this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4);this.m12=-this._determinant3x3(b1,b3,b4,c1,c3,c4,d1,d3,d4);this.m22=this._determinant3x3(a1,a3,a4,c1,c3,c4,d1,d3,d4);this.m32=-this._determinant3x3(a1,a3,a4,b1,b3,b4,d1,d3,d4);this.m42=this._determinant3x3(a1,a3,a4,b1,b3,b4,c1,c3,c4);this.m13=this._determinant3x3(b1,b2,b4,c1,c2,c4,d1,d2,d4);this.m23=-this._determinant3x3(a1,a2,a4,c1,c2,c4,d1,d2,d4);this.m33=this._determinant3x3(a1,a2,a4,b1,b2,b4,d1,d2,d4);this.m43=-this._determinant3x3(a1,a2,a4,b1,b2,b4,c1,c2,c4);this.m14=-this._determinant3x3(b1,b2,b3,c1,c2,c3,d1,d2,d3);this.m24=this._determinant3x3(a1,a2,a3,c1,c2,c3,d1,d2,d3);this.m34=-this._determinant3x3(a1,a2,a3,b1,b2,b3,d1,d2,d3);this.m44=this._determinant3x3(a1,a2,a3,b1,b2,b3,c1,c2,c3)}
</script>

This works fine.


```r
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1000))
```

<canvas id="testgltextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** points object 7 ****** -->
<script id="testglvshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
gl_PointSize = 3.;
vCol = aCol;
}
</script>
<script id="testglfshader7" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 9 ****** -->
<script id="testglvshader9" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader9" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 10 ****** -->
<script id="testglvshader10" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader10" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 11 ****** -->
<script id="testglvshader11" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader11" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 12 ****** -->
<script id="testglvshader12" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader12" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 13 ****** -->
<script id="testglvshader13" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader13" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 14 ****** -->
<script id="testglvshader14" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader14" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 15 ****** -->
<script id="testglvshader15" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader15" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 16 ****** -->
<script id="testglvshader16" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader16" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 17 ****** -->
<script id="testglvshader17" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader17" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 18 ****** -->
<script id="testglvshader18" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader18" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testglwebGLStart() {
var debug = function(msg) {
document.getElementById("testgldebug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testglcanvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 1;
zoom[1] = 1;
fov[1] = 30;
userMatrix[1] = new CanvasMatrix4();
userMatrix[1].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
ctx.font = textHeight+"px "+fontFamily;
canvasX = 1;
var widths = [];
for (var i = 0; i < text.length; i++)  {
widths[i] = ctx.measureText(text[i]).width;
canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
}	  
canvasX = getPowerOfTwo(canvasX);
var offset = 2*textHeight; // offset to first baseline
var skip = 2*textHeight;   // skip between baselines	  
canvasY = getPowerOfTwo(offset + text.length*skip);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.fillStyle = backgroundColour;
ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
ctx.fillStyle = textColour;
ctx.textAlign = "left";
ctx.textBaseline = "alphabetic";
ctx.font = textHeight+"px "+fontFamily;
for(var i = 0; i < text.length; i++) {
textY = i*skip + offset;
ctx.fillText(text[i], 0,  textY);
}
return {canvasX:canvasX, canvasY:canvasY,
widths:widths, textHeight:textHeight,
offset:offset, skip:skip};
}
// ****** points object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "testglvshader7" ));
gl.attachShader(prog7, getShader( gl, "testglfshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
-3.732104, 1.293005, -1.045174, 1, 0, 0, 1,
-3.43752, -1.692822, -2.615483, 1, 0.007843138, 0, 1,
-3.24769, 0.4898947, -0.978554, 1, 0.01176471, 0, 1,
-3.125842, -0.1279385, -0.8617955, 1, 0.01960784, 0, 1,
-2.783905, -0.2596599, -1.266679, 1, 0.02352941, 0, 1,
-2.769474, -1.058633, -3.855694, 1, 0.03137255, 0, 1,
-2.62125, -0.474323, -1.449019, 1, 0.03529412, 0, 1,
-2.602595, -1.347752, -0.5272567, 1, 0.04313726, 0, 1,
-2.48368, 1.8585, -2.07055, 1, 0.04705882, 0, 1,
-2.467664, 0.7585472, -1.634478, 1, 0.05490196, 0, 1,
-2.443741, -0.04544566, -0.8063167, 1, 0.05882353, 0, 1,
-2.387074, 0.1621208, -0.6794519, 1, 0.06666667, 0, 1,
-2.378865, -0.08737475, -0.5533242, 1, 0.07058824, 0, 1,
-2.370409, -0.8264526, -1.482352, 1, 0.07843138, 0, 1,
-2.295803, 0.305778, -1.759735, 1, 0.08235294, 0, 1,
-2.290555, 0.489797, -0.4415269, 1, 0.09019608, 0, 1,
-2.280529, 2.210207, -2.301761, 1, 0.09411765, 0, 1,
-2.258151, -0.429045, -2.888831, 1, 0.1019608, 0, 1,
-2.236493, 1.21485, -0.1783622, 1, 0.1098039, 0, 1,
-2.090197, 0.1831336, 0.2191661, 1, 0.1137255, 0, 1,
-2.064411, 0.1508969, 0.08536188, 1, 0.1215686, 0, 1,
-2.051122, -0.8297631, -2.093166, 1, 0.1254902, 0, 1,
-2.04075, -1.193511, -2.321553, 1, 0.1333333, 0, 1,
-2.030038, 1.179897, 0.07151888, 1, 0.1372549, 0, 1,
-2.000504, -0.1193886, -1.835349, 1, 0.145098, 0, 1,
-1.976754, 1.431784, -0.7147856, 1, 0.1490196, 0, 1,
-1.964302, 0.346433, -0.2787743, 1, 0.1568628, 0, 1,
-1.963853, 0.06014502, -3.025743, 1, 0.1607843, 0, 1,
-1.948371, -1.360536, -3.423053, 1, 0.1686275, 0, 1,
-1.931859, 0.1545733, 0.5648456, 1, 0.172549, 0, 1,
-1.911698, 1.507292, -2.355807, 1, 0.1803922, 0, 1,
-1.909398, -0.3078621, -2.824192, 1, 0.1843137, 0, 1,
-1.882082, -0.500832, -1.881351, 1, 0.1921569, 0, 1,
-1.876735, -0.4492264, -2.694219, 1, 0.1960784, 0, 1,
-1.871543, -0.7142028, -3.286834, 1, 0.2039216, 0, 1,
-1.855112, 0.4830045, -0.6112071, 1, 0.2117647, 0, 1,
-1.813201, -0.2432307, -1.408943, 1, 0.2156863, 0, 1,
-1.806973, -0.5161402, -2.65534, 1, 0.2235294, 0, 1,
-1.779408, -0.1031424, -1.311531, 1, 0.227451, 0, 1,
-1.777361, -0.4472547, -1.973937, 1, 0.2352941, 0, 1,
-1.774209, -1.164351, -2.366554, 1, 0.2392157, 0, 1,
-1.773895, -0.19546, -2.64967, 1, 0.2470588, 0, 1,
-1.771552, -0.6014337, -2.222254, 1, 0.2509804, 0, 1,
-1.766602, 0.7224508, -0.7760979, 1, 0.2588235, 0, 1,
-1.765607, -0.0818353, -1.118609, 1, 0.2627451, 0, 1,
-1.741844, -1.869436, -2.611225, 1, 0.2705882, 0, 1,
-1.727313, 0.1046055, -1.829678, 1, 0.2745098, 0, 1,
-1.713859, 1.095546, 0.117097, 1, 0.282353, 0, 1,
-1.698256, 1.044019, -1.349049, 1, 0.2862745, 0, 1,
-1.69726, 1.912346, -1.414387, 1, 0.2941177, 0, 1,
-1.694225, -0.03318293, -2.238504, 1, 0.3019608, 0, 1,
-1.686243, -3.086427, -2.075618, 1, 0.3058824, 0, 1,
-1.673992, 0.0611626, -1.511298, 1, 0.3137255, 0, 1,
-1.667649, -0.5496158, -1.51593, 1, 0.3176471, 0, 1,
-1.663917, -0.009836163, -2.876545, 1, 0.3254902, 0, 1,
-1.658226, 0.1240184, -1.161956, 1, 0.3294118, 0, 1,
-1.622756, 0.006841851, -2.57719, 1, 0.3372549, 0, 1,
-1.617523, 0.8937036, -0.9259052, 1, 0.3411765, 0, 1,
-1.615511, -0.4461138, -0.423595, 1, 0.3490196, 0, 1,
-1.58514, 0.5452342, -0.3239515, 1, 0.3529412, 0, 1,
-1.572842, -0.8561775, -3.583549, 1, 0.3607843, 0, 1,
-1.571025, -1.102899, -2.895702, 1, 0.3647059, 0, 1,
-1.566623, -0.05252626, -0.6170889, 1, 0.372549, 0, 1,
-1.561617, 1.434052, -3.247503, 1, 0.3764706, 0, 1,
-1.561268, 0.05870547, -0.5198281, 1, 0.3843137, 0, 1,
-1.555922, 0.9181446, 0.2406046, 1, 0.3882353, 0, 1,
-1.549296, -1.080636, -1.436082, 1, 0.3960784, 0, 1,
-1.534016, -0.6964616, -1.059807, 1, 0.4039216, 0, 1,
-1.525468, 2.150234, -3.521559, 1, 0.4078431, 0, 1,
-1.519562, 1.597238, 1.439213, 1, 0.4156863, 0, 1,
-1.509317, 1.62921, -1.122039, 1, 0.4196078, 0, 1,
-1.489628, -1.983972, -1.966111, 1, 0.427451, 0, 1,
-1.476192, -0.378852, -2.453094, 1, 0.4313726, 0, 1,
-1.470076, 1.271863, -0.441089, 1, 0.4392157, 0, 1,
-1.468306, -0.4153671, -2.084265, 1, 0.4431373, 0, 1,
-1.453005, 0.8281826, -0.4632901, 1, 0.4509804, 0, 1,
-1.441171, -0.01360801, -1.920308, 1, 0.454902, 0, 1,
-1.439179, 0.4862044, -1.128051, 1, 0.4627451, 0, 1,
-1.436983, -1.288944, -2.157434, 1, 0.4666667, 0, 1,
-1.435987, -0.7298957, -2.585646, 1, 0.4745098, 0, 1,
-1.433108, 0.0768834, -0.77398, 1, 0.4784314, 0, 1,
-1.431416, -2.946182, -2.820851, 1, 0.4862745, 0, 1,
-1.429736, 1.60765, -0.8525687, 1, 0.4901961, 0, 1,
-1.418949, 0.01668493, -1.871415, 1, 0.4980392, 0, 1,
-1.409394, -0.6506684, -3.160449, 1, 0.5058824, 0, 1,
-1.390325, 0.5193502, -1.737211, 1, 0.509804, 0, 1,
-1.387019, 0.8901398, -1.53366, 1, 0.5176471, 0, 1,
-1.384013, -0.9289302, -1.518236, 1, 0.5215687, 0, 1,
-1.372378, 1.708927, -0.268188, 1, 0.5294118, 0, 1,
-1.365068, 1.031044, -0.4503387, 1, 0.5333334, 0, 1,
-1.355618, 1.220119, 0.0752657, 1, 0.5411765, 0, 1,
-1.350433, -0.003626119, -1.130358, 1, 0.5450981, 0, 1,
-1.335229, -1.283649, -1.469901, 1, 0.5529412, 0, 1,
-1.322788, 0.5887566, -1.237674, 1, 0.5568628, 0, 1,
-1.321451, -0.6329819, -1.941199, 1, 0.5647059, 0, 1,
-1.32064, 0.02331345, -0.8405964, 1, 0.5686275, 0, 1,
-1.312203, 0.4504555, -1.447007, 1, 0.5764706, 0, 1,
-1.310244, 0.1733407, -3.164134, 1, 0.5803922, 0, 1,
-1.299927, -0.007373675, -1.484873, 1, 0.5882353, 0, 1,
-1.297579, -0.3584413, -3.820208, 1, 0.5921569, 0, 1,
-1.296719, 1.191885, -1.508757, 1, 0.6, 0, 1,
-1.284842, 0.9287969, 0.1064024, 1, 0.6078432, 0, 1,
-1.283274, -1.646367, -4.26885, 1, 0.6117647, 0, 1,
-1.282477, -2.139492, -2.448606, 1, 0.6196079, 0, 1,
-1.281173, 0.4213311, -1.494821, 1, 0.6235294, 0, 1,
-1.261875, -0.1312199, -2.50503, 1, 0.6313726, 0, 1,
-1.253002, 0.2373147, -2.463684, 1, 0.6352941, 0, 1,
-1.250626, -0.7141551, -1.968035, 1, 0.6431373, 0, 1,
-1.24771, 2.142183, -0.1208554, 1, 0.6470588, 0, 1,
-1.24604, -0.2745951, -0.6320175, 1, 0.654902, 0, 1,
-1.244336, 0.7433899, -0.3654805, 1, 0.6588235, 0, 1,
-1.243682, 0.06226934, -1.108491, 1, 0.6666667, 0, 1,
-1.238537, 0.1589163, -1.020732, 1, 0.6705883, 0, 1,
-1.235942, 1.786639, -2.531817, 1, 0.6784314, 0, 1,
-1.230345, -0.1540869, -1.40146, 1, 0.682353, 0, 1,
-1.227287, 0.179215, -1.383867, 1, 0.6901961, 0, 1,
-1.226283, 0.4041034, -0.7951302, 1, 0.6941177, 0, 1,
-1.224237, 1.566618, -0.8304827, 1, 0.7019608, 0, 1,
-1.218678, -1.083339, -3.928185, 1, 0.7098039, 0, 1,
-1.217725, 0.7417307, 0.331347, 1, 0.7137255, 0, 1,
-1.215991, -1.254646, -2.012238, 1, 0.7215686, 0, 1,
-1.214438, 0.123844, -0.770781, 1, 0.7254902, 0, 1,
-1.211772, -1.858781, -1.764271, 1, 0.7333333, 0, 1,
-1.207021, -0.5521869, -2.898649, 1, 0.7372549, 0, 1,
-1.203357, -2.601521, -2.162266, 1, 0.7450981, 0, 1,
-1.200514, 1.413714, -1.494289, 1, 0.7490196, 0, 1,
-1.197366, 0.5336275, -1.877884, 1, 0.7568628, 0, 1,
-1.192171, -0.3011047, -2.939391, 1, 0.7607843, 0, 1,
-1.190161, -0.7779669, -1.867135, 1, 0.7686275, 0, 1,
-1.170066, -2.316678, -2.896799, 1, 0.772549, 0, 1,
-1.167209, -1.199605, -2.238125, 1, 0.7803922, 0, 1,
-1.156269, -0.04529335, -0.4271147, 1, 0.7843137, 0, 1,
-1.145934, -0.4939823, -1.533062, 1, 0.7921569, 0, 1,
-1.143366, -1.366929, -1.403057, 1, 0.7960784, 0, 1,
-1.142317, -0.5029945, -1.456401, 1, 0.8039216, 0, 1,
-1.1375, -0.543137, -1.591478, 1, 0.8117647, 0, 1,
-1.136938, -0.1340447, -2.271927, 1, 0.8156863, 0, 1,
-1.127316, 0.7398476, -1.085477, 1, 0.8235294, 0, 1,
-1.125521, -1.433515, -3.458153, 1, 0.827451, 0, 1,
-1.107759, -2.971891, -1.7835, 1, 0.8352941, 0, 1,
-1.094363, 0.2948385, -1.145628, 1, 0.8392157, 0, 1,
-1.091822, -0.7393523, -3.15669, 1, 0.8470588, 0, 1,
-1.087725, 0.7206286, 0.9466215, 1, 0.8509804, 0, 1,
-1.076533, 0.3700268, -0.9564345, 1, 0.8588235, 0, 1,
-1.07167, 0.448948, -0.9630043, 1, 0.8627451, 0, 1,
-1.071603, -0.5150232, -2.643936, 1, 0.8705882, 0, 1,
-1.071549, -0.06957737, -1.904093, 1, 0.8745098, 0, 1,
-1.063729, -0.3338327, -2.643499, 1, 0.8823529, 0, 1,
-1.058897, -1.768031, -2.271345, 1, 0.8862745, 0, 1,
-1.053946, 0.4553589, -1.096283, 1, 0.8941177, 0, 1,
-1.051281, 1.116477, 1.05186, 1, 0.8980392, 0, 1,
-1.051256, -1.771111, -3.522042, 1, 0.9058824, 0, 1,
-1.050828, 1.69777, 0.435186, 1, 0.9137255, 0, 1,
-1.048577, -1.613417, -3.065816, 1, 0.9176471, 0, 1,
-1.048147, -2.315899, -3.108732, 1, 0.9254902, 0, 1,
-1.044252, -0.2356429, -2.068483, 1, 0.9294118, 0, 1,
-1.039377, 1.046791, -0.7607906, 1, 0.9372549, 0, 1,
-1.034007, 0.03781818, 1.174556, 1, 0.9411765, 0, 1,
-1.032431, 0.8439129, -0.5826468, 1, 0.9490196, 0, 1,
-1.032325, -1.339653, -2.070683, 1, 0.9529412, 0, 1,
-1.031376, -0.952289, -1.975232, 1, 0.9607843, 0, 1,
-1.029453, 0.5613989, -0.7631414, 1, 0.9647059, 0, 1,
-1.020968, -0.7264875, -2.509465, 1, 0.972549, 0, 1,
-1.018475, 0.2934518, -3.294597, 1, 0.9764706, 0, 1,
-1.016835, -2.046157, -3.600954, 1, 0.9843137, 0, 1,
-1.01492, -1.415562, -4.288145, 1, 0.9882353, 0, 1,
-1.008512, 0.1183866, -2.125781, 1, 0.9960784, 0, 1,
-1.005154, 0.7107757, -1.42458, 0.9960784, 1, 0, 1,
-0.9982743, -0.06657367, -1.018438, 0.9921569, 1, 0, 1,
-0.9977754, 0.3709827, -1.892501, 0.9843137, 1, 0, 1,
-0.9969816, 0.05707587, -0.8127353, 0.9803922, 1, 0, 1,
-0.991497, 0.3582587, -1.132122, 0.972549, 1, 0, 1,
-0.9875677, -1.487866, -4.003507, 0.9686275, 1, 0, 1,
-0.9855144, -0.4184852, -1.23477, 0.9607843, 1, 0, 1,
-0.9691647, -0.1781003, -2.06584, 0.9568627, 1, 0, 1,
-0.9675415, -0.1611732, -0.4064507, 0.9490196, 1, 0, 1,
-0.9569041, -2.509843, -1.642293, 0.945098, 1, 0, 1,
-0.9562647, -0.2333206, -1.635927, 0.9372549, 1, 0, 1,
-0.9451636, -0.2343753, -2.409804, 0.9333333, 1, 0, 1,
-0.9369852, -2.05475, -3.47093, 0.9254902, 1, 0, 1,
-0.9364062, -1.504872, -3.524633, 0.9215686, 1, 0, 1,
-0.926374, 1.907918, -1.463452, 0.9137255, 1, 0, 1,
-0.9257971, -0.2991604, 0.5167446, 0.9098039, 1, 0, 1,
-0.9254074, 0.2883515, -1.737497, 0.9019608, 1, 0, 1,
-0.9203303, 0.6748667, 0.03134254, 0.8941177, 1, 0, 1,
-0.9135207, -0.06486927, -2.012697, 0.8901961, 1, 0, 1,
-0.9125181, 0.1194299, -0.6730849, 0.8823529, 1, 0, 1,
-0.902382, 0.2676929, -0.7124063, 0.8784314, 1, 0, 1,
-0.9021422, -0.7173478, -3.82969, 0.8705882, 1, 0, 1,
-0.9011577, -1.024377, -2.060679, 0.8666667, 1, 0, 1,
-0.9006751, -0.2398243, -0.8961795, 0.8588235, 1, 0, 1,
-0.8937176, 0.4399846, -1.42309, 0.854902, 1, 0, 1,
-0.890758, -1.804992, -2.217509, 0.8470588, 1, 0, 1,
-0.8891135, -1.03829, -1.626944, 0.8431373, 1, 0, 1,
-0.8865584, 0.9921679, -3.308306, 0.8352941, 1, 0, 1,
-0.8782209, 0.6562685, -0.4987923, 0.8313726, 1, 0, 1,
-0.8740616, 0.1515534, -0.2371189, 0.8235294, 1, 0, 1,
-0.8611422, -1.573581, -3.099345, 0.8196079, 1, 0, 1,
-0.8549929, 0.7836962, -1.680157, 0.8117647, 1, 0, 1,
-0.8508994, 0.6665519, -2.121872, 0.8078431, 1, 0, 1,
-0.8496247, 0.4125678, -1.416665, 0.8, 1, 0, 1,
-0.8475974, -0.8886923, -1.715362, 0.7921569, 1, 0, 1,
-0.8462245, -0.5234792, -3.150572, 0.7882353, 1, 0, 1,
-0.8409379, -0.5506781, -1.690869, 0.7803922, 1, 0, 1,
-0.8393913, 1.410911, 0.3475752, 0.7764706, 1, 0, 1,
-0.8393528, 0.03592626, -2.739612, 0.7686275, 1, 0, 1,
-0.8362754, -0.01889122, -1.598931, 0.7647059, 1, 0, 1,
-0.8273419, -0.09662615, -2.474743, 0.7568628, 1, 0, 1,
-0.8272074, 0.07116131, -2.727903, 0.7529412, 1, 0, 1,
-0.8236852, 0.5085802, -0.8669674, 0.7450981, 1, 0, 1,
-0.8187785, 0.2425341, -2.757423, 0.7411765, 1, 0, 1,
-0.8161328, 0.3831131, -1.2371, 0.7333333, 1, 0, 1,
-0.8158028, -0.9852376, -2.160376, 0.7294118, 1, 0, 1,
-0.8144868, -2.855564, 0.4147644, 0.7215686, 1, 0, 1,
-0.8139428, -0.3945364, -2.237756, 0.7176471, 1, 0, 1,
-0.8054103, 0.5257779, -0.9427274, 0.7098039, 1, 0, 1,
-0.8003958, 0.8368224, -2.001454, 0.7058824, 1, 0, 1,
-0.798604, -0.5640078, -2.789325, 0.6980392, 1, 0, 1,
-0.7891752, 0.1102309, -1.211659, 0.6901961, 1, 0, 1,
-0.7855638, 0.0873881, -2.25579, 0.6862745, 1, 0, 1,
-0.7765827, 0.3303665, -2.886035, 0.6784314, 1, 0, 1,
-0.7755499, -0.68177, -3.064297, 0.6745098, 1, 0, 1,
-0.7741815, -0.2309231, -0.4721905, 0.6666667, 1, 0, 1,
-0.76924, -0.9741524, -2.534402, 0.6627451, 1, 0, 1,
-0.7677253, 0.3943995, -2.264652, 0.654902, 1, 0, 1,
-0.7659341, -0.359539, -2.223723, 0.6509804, 1, 0, 1,
-0.7646315, -0.1572169, -0.5485894, 0.6431373, 1, 0, 1,
-0.763368, -1.310371, -3.20108, 0.6392157, 1, 0, 1,
-0.7542133, -1.787887, -4.246257, 0.6313726, 1, 0, 1,
-0.7521153, 1.194923, 0.7065508, 0.627451, 1, 0, 1,
-0.7499588, 0.6527096, -0.4405896, 0.6196079, 1, 0, 1,
-0.7435449, 0.6935911, -0.3786285, 0.6156863, 1, 0, 1,
-0.7398086, -0.2405822, -2.118295, 0.6078432, 1, 0, 1,
-0.732576, 0.8479438, -1.446049, 0.6039216, 1, 0, 1,
-0.731118, 0.7363452, -1.61217, 0.5960785, 1, 0, 1,
-0.7164489, 0.7600342, -0.9379468, 0.5882353, 1, 0, 1,
-0.7156562, 0.6278774, -0.547071, 0.5843138, 1, 0, 1,
-0.7150334, -0.7559868, -2.757418, 0.5764706, 1, 0, 1,
-0.7118899, 2.156368, 0.09162088, 0.572549, 1, 0, 1,
-0.7037972, -1.294665, -0.4154844, 0.5647059, 1, 0, 1,
-0.6966749, -2.126866, -1.634952, 0.5607843, 1, 0, 1,
-0.696311, 0.5639051, 0.2284049, 0.5529412, 1, 0, 1,
-0.6945673, -0.2671399, -2.983348, 0.5490196, 1, 0, 1,
-0.6917655, 0.4535086, 0.3306101, 0.5411765, 1, 0, 1,
-0.6904146, 0.8768927, -0.746101, 0.5372549, 1, 0, 1,
-0.6899465, 0.5569128, -0.7538173, 0.5294118, 1, 0, 1,
-0.6841326, -0.9993826, -0.2228696, 0.5254902, 1, 0, 1,
-0.6808419, 1.84914, -0.715822, 0.5176471, 1, 0, 1,
-0.6799035, 1.722562, -1.883025, 0.5137255, 1, 0, 1,
-0.6754678, 0.04635961, -0.2324841, 0.5058824, 1, 0, 1,
-0.6748597, 0.03290276, -0.5556955, 0.5019608, 1, 0, 1,
-0.6745583, -0.03134428, -0.3647917, 0.4941176, 1, 0, 1,
-0.6728715, -0.579223, -0.8333347, 0.4862745, 1, 0, 1,
-0.6726522, 0.6942817, -1.739342, 0.4823529, 1, 0, 1,
-0.6725587, -0.1313371, -1.055277, 0.4745098, 1, 0, 1,
-0.6698222, 1.062159, -0.06331161, 0.4705882, 1, 0, 1,
-0.6696664, 0.3209639, -3.15309, 0.4627451, 1, 0, 1,
-0.6632408, -1.211589, -3.139271, 0.4588235, 1, 0, 1,
-0.6538236, -1.169476, -3.923607, 0.4509804, 1, 0, 1,
-0.6492108, 0.5780842, 0.5999961, 0.4470588, 1, 0, 1,
-0.6491607, 0.9407253, 0.2539886, 0.4392157, 1, 0, 1,
-0.6442631, 0.2872663, -0.3695201, 0.4352941, 1, 0, 1,
-0.6413364, 0.680409, -0.6846257, 0.427451, 1, 0, 1,
-0.6412752, -0.9939381, -4.809005, 0.4235294, 1, 0, 1,
-0.6391499, 0.5835414, -1.988144, 0.4156863, 1, 0, 1,
-0.638765, -0.3906739, 0.3120854, 0.4117647, 1, 0, 1,
-0.6314191, 0.617579, 0.3123146, 0.4039216, 1, 0, 1,
-0.6312857, 0.6094207, -1.552495, 0.3960784, 1, 0, 1,
-0.6292397, -1.86872, -3.49042, 0.3921569, 1, 0, 1,
-0.626869, -0.447753, -1.160027, 0.3843137, 1, 0, 1,
-0.6239767, 0.6383609, -0.7787432, 0.3803922, 1, 0, 1,
-0.6224919, 0.877362, -0.6918587, 0.372549, 1, 0, 1,
-0.6157296, 0.293642, -0.3801254, 0.3686275, 1, 0, 1,
-0.6133414, 0.8733608, -1.352563, 0.3607843, 1, 0, 1,
-0.6058294, 0.04096086, -1.973118, 0.3568628, 1, 0, 1,
-0.6053435, 0.380778, -0.008613593, 0.3490196, 1, 0, 1,
-0.6028494, 1.560622, -0.4195562, 0.345098, 1, 0, 1,
-0.6027681, -0.1390371, -2.860784, 0.3372549, 1, 0, 1,
-0.5920183, 0.8609235, -0.0762817, 0.3333333, 1, 0, 1,
-0.5868647, 1.233052, -0.7235451, 0.3254902, 1, 0, 1,
-0.5845143, -1.511978, -2.731104, 0.3215686, 1, 0, 1,
-0.5773838, 1.480667, -1.020132, 0.3137255, 1, 0, 1,
-0.5769846, -0.9765269, -0.7545168, 0.3098039, 1, 0, 1,
-0.5728765, 0.07817372, -1.534366, 0.3019608, 1, 0, 1,
-0.571949, -0.3242968, -1.310917, 0.2941177, 1, 0, 1,
-0.5641229, -1.590309, -2.434348, 0.2901961, 1, 0, 1,
-0.5633906, 0.6813546, -1.19574, 0.282353, 1, 0, 1,
-0.5603666, 1.184816, -0.8942143, 0.2784314, 1, 0, 1,
-0.5582706, -1.128739, -2.269699, 0.2705882, 1, 0, 1,
-0.5581965, 1.24188, -1.286077, 0.2666667, 1, 0, 1,
-0.5581858, 0.2730861, -2.597572, 0.2588235, 1, 0, 1,
-0.5475058, 1.141252, 2.565984, 0.254902, 1, 0, 1,
-0.5465069, -1.700566, -2.691148, 0.2470588, 1, 0, 1,
-0.5392931, 1.105809, -0.305088, 0.2431373, 1, 0, 1,
-0.5372635, -0.1833837, -2.35375, 0.2352941, 1, 0, 1,
-0.5361342, 0.03312324, -0.8187533, 0.2313726, 1, 0, 1,
-0.5315598, -1.9771, -2.897718, 0.2235294, 1, 0, 1,
-0.5313017, 0.305708, -1.957166, 0.2196078, 1, 0, 1,
-0.5273526, 1.079004, 0.04189949, 0.2117647, 1, 0, 1,
-0.5229919, -0.6075651, -2.134861, 0.2078431, 1, 0, 1,
-0.5219576, -0.6347163, -2.381363, 0.2, 1, 0, 1,
-0.5201454, -1.232389, -1.943231, 0.1921569, 1, 0, 1,
-0.5145867, 0.2919107, 0.1316064, 0.1882353, 1, 0, 1,
-0.5130828, 0.5076987, -0.7382672, 0.1803922, 1, 0, 1,
-0.5123795, 0.2877275, -2.804225, 0.1764706, 1, 0, 1,
-0.512367, 0.3775677, -2.205181, 0.1686275, 1, 0, 1,
-0.5119292, -1.331552, -3.813977, 0.1647059, 1, 0, 1,
-0.5110471, -0.1262922, -1.191058, 0.1568628, 1, 0, 1,
-0.5067512, -2.046257, -2.706846, 0.1529412, 1, 0, 1,
-0.5052548, -0.5172554, -2.293597, 0.145098, 1, 0, 1,
-0.5038831, -0.8893812, -2.06923, 0.1411765, 1, 0, 1,
-0.50281, -0.04292443, -1.666891, 0.1333333, 1, 0, 1,
-0.5021104, 0.4299816, -2.755585, 0.1294118, 1, 0, 1,
-0.5010601, 0.188533, -0.8530216, 0.1215686, 1, 0, 1,
-0.5004433, -0.9538767, -1.314937, 0.1176471, 1, 0, 1,
-0.500384, 1.98174, -1.027397, 0.1098039, 1, 0, 1,
-0.4926189, 0.4981385, -0.09686276, 0.1058824, 1, 0, 1,
-0.4917133, -0.5333227, -2.508937, 0.09803922, 1, 0, 1,
-0.4903948, -0.3958004, -3.492145, 0.09019608, 1, 0, 1,
-0.4901702, -0.6999334, -2.677525, 0.08627451, 1, 0, 1,
-0.4837705, 1.850329, 0.4681345, 0.07843138, 1, 0, 1,
-0.4830751, -0.0971264, -1.438568, 0.07450981, 1, 0, 1,
-0.4795357, 0.7636315, 0.03711861, 0.06666667, 1, 0, 1,
-0.4703595, 2.45796, 0.1262604, 0.0627451, 1, 0, 1,
-0.467742, 1.236718, 1.060395, 0.05490196, 1, 0, 1,
-0.4657396, 0.02153731, -0.9993163, 0.05098039, 1, 0, 1,
-0.4612347, -1.652313, -2.121079, 0.04313726, 1, 0, 1,
-0.4607154, -0.635074, -2.997997, 0.03921569, 1, 0, 1,
-0.4602719, -0.3718948, -3.065966, 0.03137255, 1, 0, 1,
-0.4589342, 0.6935902, 0.5852334, 0.02745098, 1, 0, 1,
-0.4545534, -0.741965, -2.677104, 0.01960784, 1, 0, 1,
-0.4520488, -1.240721, -2.863035, 0.01568628, 1, 0, 1,
-0.4518048, -0.5590288, -2.591677, 0.007843138, 1, 0, 1,
-0.4503573, 1.331174, 0.1942619, 0.003921569, 1, 0, 1,
-0.449486, -0.3648058, -2.751316, 0, 1, 0.003921569, 1,
-0.4489241, -0.3139999, -2.009088, 0, 1, 0.01176471, 1,
-0.4484825, 0.01270177, -0.6618813, 0, 1, 0.01568628, 1,
-0.448465, 0.5658463, 1.211354, 0, 1, 0.02352941, 1,
-0.4412816, 0.5934399, -1.490362, 0, 1, 0.02745098, 1,
-0.4388072, 0.5101308, -1.329132, 0, 1, 0.03529412, 1,
-0.4313538, -0.4754045, -0.8032399, 0, 1, 0.03921569, 1,
-0.4286024, -0.4536438, -2.63184, 0, 1, 0.04705882, 1,
-0.4232195, -0.01391898, -0.6331046, 0, 1, 0.05098039, 1,
-0.4129516, 1.548497, -0.9365505, 0, 1, 0.05882353, 1,
-0.4114351, -0.4721107, -2.513722, 0, 1, 0.0627451, 1,
-0.4054988, 1.129437, -0.1846389, 0, 1, 0.07058824, 1,
-0.4049042, -0.4320154, -1.087322, 0, 1, 0.07450981, 1,
-0.4038306, 0.8416668, -0.7165269, 0, 1, 0.08235294, 1,
-0.3969204, 0.2284335, -0.2919739, 0, 1, 0.08627451, 1,
-0.3950346, 0.6500783, -2.007952, 0, 1, 0.09411765, 1,
-0.3912725, 0.4664166, 1.126032, 0, 1, 0.1019608, 1,
-0.3832556, 1.946254, -1.152644, 0, 1, 0.1058824, 1,
-0.3829859, -0.8880358, -2.512192, 0, 1, 0.1137255, 1,
-0.3796663, 0.458237, -0.4924411, 0, 1, 0.1176471, 1,
-0.3781432, 0.02564106, -3.65464, 0, 1, 0.1254902, 1,
-0.3766616, 1.628348, -0.630021, 0, 1, 0.1294118, 1,
-0.3743222, 0.8276482, -0.3655427, 0, 1, 0.1372549, 1,
-0.3709221, 0.8914175, -1.549917, 0, 1, 0.1411765, 1,
-0.3704982, -0.7642511, -2.698463, 0, 1, 0.1490196, 1,
-0.3688476, -2.301799, -2.837363, 0, 1, 0.1529412, 1,
-0.3584558, 1.165002, 0.1256606, 0, 1, 0.1607843, 1,
-0.3573516, -0.9058666, -2.395906, 0, 1, 0.1647059, 1,
-0.3573318, 0.5685904, -0.8962334, 0, 1, 0.172549, 1,
-0.3556473, -1.043952, -2.997893, 0, 1, 0.1764706, 1,
-0.3547789, -0.780363, -2.477411, 0, 1, 0.1843137, 1,
-0.3543272, -0.4610395, -1.994966, 0, 1, 0.1882353, 1,
-0.3531977, 1.426841, -0.2098496, 0, 1, 0.1960784, 1,
-0.3501905, 0.3545335, -1.173768, 0, 1, 0.2039216, 1,
-0.3477721, 0.4606561, -0.5433328, 0, 1, 0.2078431, 1,
-0.346559, 1.500262, -1.581733, 0, 1, 0.2156863, 1,
-0.3422422, 1.845833, 1.148711, 0, 1, 0.2196078, 1,
-0.3344395, -0.8367866, -3.33822, 0, 1, 0.227451, 1,
-0.3323067, -0.181503, -1.948006, 0, 1, 0.2313726, 1,
-0.3313153, -1.298366, -1.823408, 0, 1, 0.2392157, 1,
-0.3272281, -0.5167562, -3.509254, 0, 1, 0.2431373, 1,
-0.3217258, -0.3922288, -4.144877, 0, 1, 0.2509804, 1,
-0.3202613, 0.8291708, -0.3495857, 0, 1, 0.254902, 1,
-0.3165846, 1.510483, -0.05330325, 0, 1, 0.2627451, 1,
-0.3163584, 0.09965632, -1.821952, 0, 1, 0.2666667, 1,
-0.3132261, -0.6286602, -4.801271, 0, 1, 0.2745098, 1,
-0.3114267, 1.424176, -0.2282231, 0, 1, 0.2784314, 1,
-0.3100205, -1.305154, -0.7957261, 0, 1, 0.2862745, 1,
-0.3095332, -0.1345586, -1.882564, 0, 1, 0.2901961, 1,
-0.3085262, -0.05699159, -2.057726, 0, 1, 0.2980392, 1,
-0.3071997, 0.4031123, -1.211697, 0, 1, 0.3058824, 1,
-0.3001093, -0.8055695, -3.026848, 0, 1, 0.3098039, 1,
-0.2993242, -0.4591706, -3.993096, 0, 1, 0.3176471, 1,
-0.2975695, -0.5013177, -2.900203, 0, 1, 0.3215686, 1,
-0.296375, 0.9910896, 0.2932014, 0, 1, 0.3294118, 1,
-0.295652, 0.2830439, 0.130071, 0, 1, 0.3333333, 1,
-0.292156, 0.184603, -1.09822, 0, 1, 0.3411765, 1,
-0.2891243, -1.562332, -2.617918, 0, 1, 0.345098, 1,
-0.288969, 0.6387063, -1.152498, 0, 1, 0.3529412, 1,
-0.2854959, -0.3481267, -2.702351, 0, 1, 0.3568628, 1,
-0.2853472, -0.1745146, -2.40313, 0, 1, 0.3647059, 1,
-0.2840113, -1.402389, -4.096837, 0, 1, 0.3686275, 1,
-0.2762644, -1.378399, -1.728843, 0, 1, 0.3764706, 1,
-0.2639616, 1.182564, -2.204616, 0, 1, 0.3803922, 1,
-0.2627564, -0.2731388, -2.842607, 0, 1, 0.3882353, 1,
-0.2623514, -0.8755797, -2.429105, 0, 1, 0.3921569, 1,
-0.2565116, -1.674029, -3.907438, 0, 1, 0.4, 1,
-0.2512703, -1.441905, -3.479625, 0, 1, 0.4078431, 1,
-0.2500914, -0.191211, -1.896138, 0, 1, 0.4117647, 1,
-0.249835, 0.2246504, -1.854403, 0, 1, 0.4196078, 1,
-0.2472926, -1.727305, -3.085613, 0, 1, 0.4235294, 1,
-0.2445971, -2.159407, -2.628515, 0, 1, 0.4313726, 1,
-0.2379406, -0.04566405, -1.160738, 0, 1, 0.4352941, 1,
-0.2272362, 0.07482467, -1.332463, 0, 1, 0.4431373, 1,
-0.2245673, -2.190837, -0.9645057, 0, 1, 0.4470588, 1,
-0.2178422, 0.6283002, 0.7964119, 0, 1, 0.454902, 1,
-0.2148221, 0.03327091, -0.3913158, 0, 1, 0.4588235, 1,
-0.2146728, -1.04442, -2.584467, 0, 1, 0.4666667, 1,
-0.2059788, 0.5213603, -0.5954341, 0, 1, 0.4705882, 1,
-0.2054471, 1.922182, -1.094026, 0, 1, 0.4784314, 1,
-0.2048339, 0.5503381, 0.7944455, 0, 1, 0.4823529, 1,
-0.2014116, 1.062497, 0.5751595, 0, 1, 0.4901961, 1,
-0.1996386, 0.8682123, -0.6371431, 0, 1, 0.4941176, 1,
-0.1843725, 1.224775, -0.02502314, 0, 1, 0.5019608, 1,
-0.1833164, -0.4811399, -2.908957, 0, 1, 0.509804, 1,
-0.1812705, -0.8563519, -2.443712, 0, 1, 0.5137255, 1,
-0.180764, -1.801381, -2.670302, 0, 1, 0.5215687, 1,
-0.177677, 0.7043703, -0.2144466, 0, 1, 0.5254902, 1,
-0.1733948, -1.630058, -4.115973, 0, 1, 0.5333334, 1,
-0.1685432, -1.269131, -3.50272, 0, 1, 0.5372549, 1,
-0.1684582, 1.286605, 1.233688, 0, 1, 0.5450981, 1,
-0.1677433, -1.725518, -3.435346, 0, 1, 0.5490196, 1,
-0.1674021, 1.363856, -0.7296556, 0, 1, 0.5568628, 1,
-0.1638961, -0.6088172, -3.68354, 0, 1, 0.5607843, 1,
-0.1594478, 0.4536786, -0.8787741, 0, 1, 0.5686275, 1,
-0.1576233, 0.0632677, -2.479587, 0, 1, 0.572549, 1,
-0.1572648, -0.3631527, -2.233328, 0, 1, 0.5803922, 1,
-0.1564515, 0.1510764, 0.6170958, 0, 1, 0.5843138, 1,
-0.1534051, 0.7339231, -1.400495, 0, 1, 0.5921569, 1,
-0.1523537, 0.4296261, 0.2813987, 0, 1, 0.5960785, 1,
-0.1482192, -1.003153, -3.521847, 0, 1, 0.6039216, 1,
-0.1481866, -0.1325799, -4.641429, 0, 1, 0.6117647, 1,
-0.1462325, -0.03019473, -2.360511, 0, 1, 0.6156863, 1,
-0.1461939, 0.2885744, 0.3118909, 0, 1, 0.6235294, 1,
-0.1454649, 0.4259591, -0.8630517, 0, 1, 0.627451, 1,
-0.143622, -0.2142092, -1.405146, 0, 1, 0.6352941, 1,
-0.1429736, -1.391346, -3.731852, 0, 1, 0.6392157, 1,
-0.1416535, 1.200335, 0.3426352, 0, 1, 0.6470588, 1,
-0.1375702, 0.1566652, -0.489758, 0, 1, 0.6509804, 1,
-0.1370681, 2.981522, -0.1822637, 0, 1, 0.6588235, 1,
-0.1362325, -1.747442, -3.093949, 0, 1, 0.6627451, 1,
-0.1336613, 0.9831177, 0.3751049, 0, 1, 0.6705883, 1,
-0.1311766, 2.193317, -1.621829, 0, 1, 0.6745098, 1,
-0.1287945, 0.3628364, -0.03863672, 0, 1, 0.682353, 1,
-0.1274945, 0.7378113, -0.07628077, 0, 1, 0.6862745, 1,
-0.124489, -0.3956219, -3.550905, 0, 1, 0.6941177, 1,
-0.1243118, -0.1399056, -1.42473, 0, 1, 0.7019608, 1,
-0.1207481, 1.621954, 0.4309793, 0, 1, 0.7058824, 1,
-0.1203172, -0.3038529, -1.549944, 0, 1, 0.7137255, 1,
-0.119394, -0.9950234, -4.257911, 0, 1, 0.7176471, 1,
-0.115566, 0.2909423, 0.5889776, 0, 1, 0.7254902, 1,
-0.115081, -0.6310341, -2.068408, 0, 1, 0.7294118, 1,
-0.1071107, -0.448406, -3.370418, 0, 1, 0.7372549, 1,
-0.1070249, -0.728909, -3.836177, 0, 1, 0.7411765, 1,
-0.1069186, -0.2909731, -4.142797, 0, 1, 0.7490196, 1,
-0.1022558, 0.876408, -1.006078, 0, 1, 0.7529412, 1,
-0.1000564, -0.8822858, -1.94114, 0, 1, 0.7607843, 1,
-0.09604941, -0.7927499, -5.016013, 0, 1, 0.7647059, 1,
-0.09343182, 0.0293143, -1.714242, 0, 1, 0.772549, 1,
-0.09225427, -1.4306, -3.187187, 0, 1, 0.7764706, 1,
-0.08818436, 1.098446, 1.568205, 0, 1, 0.7843137, 1,
-0.08312593, 1.302845, -0.3811561, 0, 1, 0.7882353, 1,
-0.06824122, 1.261135, 2.104186, 0, 1, 0.7960784, 1,
-0.06696786, -0.4167535, -3.740997, 0, 1, 0.8039216, 1,
-0.06321078, 0.4608859, -2.316379, 0, 1, 0.8078431, 1,
-0.06293197, 1.063873, 0.07018331, 0, 1, 0.8156863, 1,
-0.05955028, 0.8045895, -0.5296663, 0, 1, 0.8196079, 1,
-0.05558924, -0.02049973, -2.461012, 0, 1, 0.827451, 1,
-0.05349422, -0.04238996, -3.411592, 0, 1, 0.8313726, 1,
-0.05080629, 1.322467, 0.2539558, 0, 1, 0.8392157, 1,
-0.04850112, -1.977715, -1.791497, 0, 1, 0.8431373, 1,
-0.04314336, -0.4328739, -1.903575, 0, 1, 0.8509804, 1,
-0.03935609, 0.7295417, -0.3840628, 0, 1, 0.854902, 1,
-0.0391841, 0.3441364, -0.09142172, 0, 1, 0.8627451, 1,
-0.03759521, -0.7744005, -3.533023, 0, 1, 0.8666667, 1,
-0.03637025, -0.3941039, -2.463625, 0, 1, 0.8745098, 1,
-0.0362942, -0.9138063, -1.789277, 0, 1, 0.8784314, 1,
-0.03556214, -1.161649, -4.036427, 0, 1, 0.8862745, 1,
-0.03513093, 0.4523071, -0.285056, 0, 1, 0.8901961, 1,
-0.03502417, -0.04137519, -1.034193, 0, 1, 0.8980392, 1,
-0.03328874, -0.162835, -4.764765, 0, 1, 0.9058824, 1,
-0.02781781, 0.3297934, -1.224517, 0, 1, 0.9098039, 1,
-0.02395516, -0.6341872, -2.550005, 0, 1, 0.9176471, 1,
-0.02222882, 1.311375, -0.4444357, 0, 1, 0.9215686, 1,
-0.01535389, 1.557823, 0.5098758, 0, 1, 0.9294118, 1,
-0.01520715, -1.857786, -2.199889, 0, 1, 0.9333333, 1,
-0.01252696, -0.1296285, -3.192756, 0, 1, 0.9411765, 1,
-0.008291709, -0.1010905, -2.874129, 0, 1, 0.945098, 1,
-0.007663476, -0.5106109, -3.793603, 0, 1, 0.9529412, 1,
-0.006766257, 1.727752, 0.2460474, 0, 1, 0.9568627, 1,
-0.004374833, -0.7585655, -3.476137, 0, 1, 0.9647059, 1,
-0.003811321, 1.143354, -1.024729, 0, 1, 0.9686275, 1,
-0.002316368, 1.446295, -1.701443, 0, 1, 0.9764706, 1,
-0.0021617, -0.09753377, -1.980318, 0, 1, 0.9803922, 1,
-0.0003639892, -0.1882315, -3.134693, 0, 1, 0.9882353, 1,
0.005696576, 0.1124552, 0.2131176, 0, 1, 0.9921569, 1,
0.00583384, -0.2936175, 3.392165, 0, 1, 1, 1,
0.00608632, 0.7170596, -0.3646115, 0, 0.9921569, 1, 1,
0.007083723, 0.3662515, -0.3333662, 0, 0.9882353, 1, 1,
0.008842506, 0.6184136, -1.081048, 0, 0.9803922, 1, 1,
0.009260723, 1.179168, 0.3137834, 0, 0.9764706, 1, 1,
0.0127152, 1.111063, -0.6300157, 0, 0.9686275, 1, 1,
0.0156816, -0.4994616, 1.449806, 0, 0.9647059, 1, 1,
0.01609022, 0.9917062, -0.3461803, 0, 0.9568627, 1, 1,
0.01744291, -0.3928779, 1.875954, 0, 0.9529412, 1, 1,
0.02612216, -1.519932, 3.373264, 0, 0.945098, 1, 1,
0.03201396, -0.6224967, 3.491118, 0, 0.9411765, 1, 1,
0.04272164, 0.09363247, -1.06223, 0, 0.9333333, 1, 1,
0.04796816, -0.1170241, 4.974417, 0, 0.9294118, 1, 1,
0.04836887, 0.5171035, 0.4856227, 0, 0.9215686, 1, 1,
0.05063923, 1.479362, 1.798888, 0, 0.9176471, 1, 1,
0.0529071, 1.739333, -0.6934634, 0, 0.9098039, 1, 1,
0.05577967, 0.978754, 1.190567, 0, 0.9058824, 1, 1,
0.05641492, 0.4849032, -1.136895, 0, 0.8980392, 1, 1,
0.05874539, -0.3068445, 3.176342, 0, 0.8901961, 1, 1,
0.06087778, -0.03356575, 2.465735, 0, 0.8862745, 1, 1,
0.06123865, -0.2481708, 1.351855, 0, 0.8784314, 1, 1,
0.06630927, 0.03962592, 1.495575, 0, 0.8745098, 1, 1,
0.06648557, 1.494443, 0.1632678, 0, 0.8666667, 1, 1,
0.0698728, 1.026122, -0.3751091, 0, 0.8627451, 1, 1,
0.07079364, 0.2085244, -0.4736995, 0, 0.854902, 1, 1,
0.07253647, -1.889484, 2.44894, 0, 0.8509804, 1, 1,
0.07315542, -1.394164, 3.535208, 0, 0.8431373, 1, 1,
0.07597215, 0.01477246, 0.8600628, 0, 0.8392157, 1, 1,
0.07673804, 1.546965, 0.2929979, 0, 0.8313726, 1, 1,
0.07698288, -1.159383, 3.236806, 0, 0.827451, 1, 1,
0.07709171, -1.443298, 3.647071, 0, 0.8196079, 1, 1,
0.08148529, -0.6804769, 2.065224, 0, 0.8156863, 1, 1,
0.09143855, -1.264776, 3.929069, 0, 0.8078431, 1, 1,
0.09424488, 0.5002241, -1.249882, 0, 0.8039216, 1, 1,
0.09472098, 0.7990363, 0.8569152, 0, 0.7960784, 1, 1,
0.09704071, -1.049691, 4.092988, 0, 0.7882353, 1, 1,
0.09771662, -1.129286, 1.396271, 0, 0.7843137, 1, 1,
0.09792504, 1.114643, 0.5718209, 0, 0.7764706, 1, 1,
0.1042374, -0.2644033, 2.247056, 0, 0.772549, 1, 1,
0.1042556, -0.04302296, 1.529965, 0, 0.7647059, 1, 1,
0.1083544, 0.3840347, 0.4244477, 0, 0.7607843, 1, 1,
0.1112417, -0.8188859, 1.190928, 0, 0.7529412, 1, 1,
0.1118805, -1.706002, 1.915381, 0, 0.7490196, 1, 1,
0.1120126, -0.29272, 3.875144, 0, 0.7411765, 1, 1,
0.1137769, -0.6209444, 3.265237, 0, 0.7372549, 1, 1,
0.1160608, 0.4480095, -0.3996455, 0, 0.7294118, 1, 1,
0.1194859, -1.310095, 1.105735, 0, 0.7254902, 1, 1,
0.1242985, -1.909799, 2.375987, 0, 0.7176471, 1, 1,
0.1273753, -0.3658251, 2.33139, 0, 0.7137255, 1, 1,
0.1289808, -0.789438, 3.398195, 0, 0.7058824, 1, 1,
0.1365903, -0.2364783, 3.255183, 0, 0.6980392, 1, 1,
0.1384373, 0.9819801, 0.5608428, 0, 0.6941177, 1, 1,
0.1427744, -1.090141, 2.960547, 0, 0.6862745, 1, 1,
0.1481082, 0.1342606, 1.803603, 0, 0.682353, 1, 1,
0.1504816, 1.527169, 0.4906237, 0, 0.6745098, 1, 1,
0.1548922, -0.6693029, 3.351452, 0, 0.6705883, 1, 1,
0.1575503, -0.07598554, 1.898242, 0, 0.6627451, 1, 1,
0.1580191, 1.91569, 1.058643, 0, 0.6588235, 1, 1,
0.1590559, -1.325683, 2.642266, 0, 0.6509804, 1, 1,
0.1615369, 0.9466239, -0.9725261, 0, 0.6470588, 1, 1,
0.1689877, -0.0988532, 1.171837, 0, 0.6392157, 1, 1,
0.1720443, -0.6673793, 4.999491, 0, 0.6352941, 1, 1,
0.1738159, 1.909757, 0.6565844, 0, 0.627451, 1, 1,
0.17647, 0.5099568, -1.801552, 0, 0.6235294, 1, 1,
0.1816368, 2.632412, -0.7239738, 0, 0.6156863, 1, 1,
0.1826551, 1.878756, 1.999537, 0, 0.6117647, 1, 1,
0.1866075, 0.7990025, 0.4160475, 0, 0.6039216, 1, 1,
0.1885754, 1.354775, -0.5943239, 0, 0.5960785, 1, 1,
0.1896245, 0.8512772, 1.76259, 0, 0.5921569, 1, 1,
0.1923516, -0.989568, 3.497577, 0, 0.5843138, 1, 1,
0.2015706, 0.4617949, 0.569903, 0, 0.5803922, 1, 1,
0.2048845, -0.9856964, 3.409357, 0, 0.572549, 1, 1,
0.2061547, -0.05934689, 1.909443, 0, 0.5686275, 1, 1,
0.2065362, 1.580758, -0.06276343, 0, 0.5607843, 1, 1,
0.2075043, -0.4813699, 3.510065, 0, 0.5568628, 1, 1,
0.2076106, 1.775944, 0.4786233, 0, 0.5490196, 1, 1,
0.2082511, 1.700555, -0.856258, 0, 0.5450981, 1, 1,
0.2137191, 1.633836, -0.05304974, 0, 0.5372549, 1, 1,
0.2213287, 0.08698282, 0.729103, 0, 0.5333334, 1, 1,
0.2281606, 0.9814202, -0.6175966, 0, 0.5254902, 1, 1,
0.2287927, -1.228483, 4.327524, 0, 0.5215687, 1, 1,
0.2294664, 0.08113307, 1.579032, 0, 0.5137255, 1, 1,
0.2311518, -0.02277624, 0.9051198, 0, 0.509804, 1, 1,
0.2326453, -0.2503019, 3.269852, 0, 0.5019608, 1, 1,
0.2332135, 0.1680975, 1.913806, 0, 0.4941176, 1, 1,
0.2346737, -1.035923, 3.382121, 0, 0.4901961, 1, 1,
0.2360167, -1.843608, 3.562752, 0, 0.4823529, 1, 1,
0.2380391, 0.4749163, 0.4188936, 0, 0.4784314, 1, 1,
0.246025, 0.218005, 1.306601, 0, 0.4705882, 1, 1,
0.2461827, 0.4356287, 0.5813697, 0, 0.4666667, 1, 1,
0.2496651, 0.09417925, 0.09460535, 0, 0.4588235, 1, 1,
0.2523665, -0.4478159, 2.949189, 0, 0.454902, 1, 1,
0.2536115, 1.448802, 0.02396382, 0, 0.4470588, 1, 1,
0.2545463, 1.109732, 0.06284303, 0, 0.4431373, 1, 1,
0.2583344, 1.021309, -0.5462182, 0, 0.4352941, 1, 1,
0.2616394, -0.9396279, 4.648938, 0, 0.4313726, 1, 1,
0.2629893, 1.842267, -1.575288, 0, 0.4235294, 1, 1,
0.2639205, 0.8750952, 1.226795, 0, 0.4196078, 1, 1,
0.2641415, 1.545892, 1.275599, 0, 0.4117647, 1, 1,
0.2645935, -0.9529305, 3.608865, 0, 0.4078431, 1, 1,
0.2682572, -1.064171, 2.853543, 0, 0.4, 1, 1,
0.2696927, -0.0939524, 2.721753, 0, 0.3921569, 1, 1,
0.2710899, 0.5572832, -0.9348708, 0, 0.3882353, 1, 1,
0.272134, 0.687885, 0.7258825, 0, 0.3803922, 1, 1,
0.2735208, 0.0353533, 1.863096, 0, 0.3764706, 1, 1,
0.2784149, -0.5681065, 1.217959, 0, 0.3686275, 1, 1,
0.2794786, 1.163016, 1.671537, 0, 0.3647059, 1, 1,
0.2831479, 2.383988, -1.096435, 0, 0.3568628, 1, 1,
0.2837361, 1.508407, 0.7573215, 0, 0.3529412, 1, 1,
0.2870255, 1.339709, 0.838504, 0, 0.345098, 1, 1,
0.287129, 0.1659902, 0.5662633, 0, 0.3411765, 1, 1,
0.2881322, -0.485231, 2.824905, 0, 0.3333333, 1, 1,
0.2885906, -0.721112, 2.732177, 0, 0.3294118, 1, 1,
0.2960057, -0.8135582, 1.745798, 0, 0.3215686, 1, 1,
0.2982488, -0.04837056, 1.638893, 0, 0.3176471, 1, 1,
0.3006376, 0.6057492, 0.3231973, 0, 0.3098039, 1, 1,
0.3008433, -0.9006005, 3.302717, 0, 0.3058824, 1, 1,
0.305371, 1.313126, -0.371794, 0, 0.2980392, 1, 1,
0.3065588, 2.040267, -0.2519285, 0, 0.2901961, 1, 1,
0.3080102, -1.034423, 1.837573, 0, 0.2862745, 1, 1,
0.3096533, -0.3686775, 5.147636, 0, 0.2784314, 1, 1,
0.3100384, -0.002478388, -0.1708865, 0, 0.2745098, 1, 1,
0.3100404, -0.1171092, 3.609462, 0, 0.2666667, 1, 1,
0.3163635, 2.404964, 1.110837, 0, 0.2627451, 1, 1,
0.3195004, -1.076615, 1.199836, 0, 0.254902, 1, 1,
0.3196869, -0.3657803, 1.790067, 0, 0.2509804, 1, 1,
0.3202327, -0.6429613, 4.520576, 0, 0.2431373, 1, 1,
0.321212, -0.140758, 1.77768, 0, 0.2392157, 1, 1,
0.3223389, 0.530612, 1.587337, 0, 0.2313726, 1, 1,
0.3241158, 1.158131, -0.1186153, 0, 0.227451, 1, 1,
0.3284141, 1.734517, 1.461801, 0, 0.2196078, 1, 1,
0.3301116, -0.3853047, 2.490929, 0, 0.2156863, 1, 1,
0.3302689, 0.1489252, 0.0426357, 0, 0.2078431, 1, 1,
0.3364829, 0.6458199, -0.5303476, 0, 0.2039216, 1, 1,
0.3380686, -0.2713357, 2.77198, 0, 0.1960784, 1, 1,
0.3462338, -0.3569526, 1.531504, 0, 0.1882353, 1, 1,
0.3502742, 0.5223237, 0.77209, 0, 0.1843137, 1, 1,
0.3517929, -0.6763159, 1.409912, 0, 0.1764706, 1, 1,
0.3522768, 1.071884, 1.340815, 0, 0.172549, 1, 1,
0.3542508, 0.4174242, 0.6391243, 0, 0.1647059, 1, 1,
0.358155, -0.8787842, 3.639062, 0, 0.1607843, 1, 1,
0.359802, -0.01346891, 1.486119, 0, 0.1529412, 1, 1,
0.361419, -0.3870929, 2.390598, 0, 0.1490196, 1, 1,
0.3631425, 0.07842816, 1.543373, 0, 0.1411765, 1, 1,
0.3672824, -0.1733968, 3.332539, 0, 0.1372549, 1, 1,
0.3673349, -1.630421, 3.088864, 0, 0.1294118, 1, 1,
0.3676232, -0.0226964, 3.895967, 0, 0.1254902, 1, 1,
0.3678434, 0.06013704, 0.261162, 0, 0.1176471, 1, 1,
0.3680328, -1.743698, 4.025353, 0, 0.1137255, 1, 1,
0.3689161, -0.4669156, 1.906977, 0, 0.1058824, 1, 1,
0.3721081, 1.129714, 2.277676, 0, 0.09803922, 1, 1,
0.3736012, 1.960962, 1.20946, 0, 0.09411765, 1, 1,
0.3750579, -1.255679, 3.189274, 0, 0.08627451, 1, 1,
0.3755424, 1.461244, 1.199693, 0, 0.08235294, 1, 1,
0.3761346, -0.3156646, 0.924391, 0, 0.07450981, 1, 1,
0.3771321, 1.096268, 1.369099, 0, 0.07058824, 1, 1,
0.3815967, -1.500695, 4.153763, 0, 0.0627451, 1, 1,
0.3861774, -0.9950085, 5.154764, 0, 0.05882353, 1, 1,
0.386433, 0.3375943, 0.6030645, 0, 0.05098039, 1, 1,
0.3868796, 1.468803, 0.2460318, 0, 0.04705882, 1, 1,
0.3919438, -0.792576, 1.563295, 0, 0.03921569, 1, 1,
0.3933628, 0.2762304, -0.6389236, 0, 0.03529412, 1, 1,
0.3956342, -0.6804605, 2.773972, 0, 0.02745098, 1, 1,
0.3968582, 0.3884262, 1.025654, 0, 0.02352941, 1, 1,
0.3970008, -0.1035671, 1.656331, 0, 0.01568628, 1, 1,
0.4051899, 0.3984052, -0.838986, 0, 0.01176471, 1, 1,
0.4058389, -0.04388988, 2.307438, 0, 0.003921569, 1, 1,
0.4063145, -0.4590408, 2.404341, 0.003921569, 0, 1, 1,
0.407654, 2.751754, 2.167597, 0.007843138, 0, 1, 1,
0.4149447, 0.3166645, 0.7932463, 0.01568628, 0, 1, 1,
0.4203637, 0.6417659, 0.1075042, 0.01960784, 0, 1, 1,
0.4236017, 0.4851482, -0.1289286, 0.02745098, 0, 1, 1,
0.4271823, 0.5944832, 0.8861002, 0.03137255, 0, 1, 1,
0.4301783, 0.7504845, 1.329463, 0.03921569, 0, 1, 1,
0.4303503, 2.264745, 0.02140348, 0.04313726, 0, 1, 1,
0.4329319, 0.8418148, 1.551164, 0.05098039, 0, 1, 1,
0.4340468, -1.796907, 2.886376, 0.05490196, 0, 1, 1,
0.4361666, 1.921984, 0.9834498, 0.0627451, 0, 1, 1,
0.4364064, 1.322353, -0.9624916, 0.06666667, 0, 1, 1,
0.4379393, 0.1220392, 0.7489399, 0.07450981, 0, 1, 1,
0.4384862, -1.7279, 0.9594932, 0.07843138, 0, 1, 1,
0.4409817, 0.6069279, -2.046205, 0.08627451, 0, 1, 1,
0.4417457, 1.177601, 0.8937591, 0.09019608, 0, 1, 1,
0.4444618, 1.034281, 1.262926, 0.09803922, 0, 1, 1,
0.4462385, 0.7555225, -0.8551276, 0.1058824, 0, 1, 1,
0.4493814, -1.316239, 2.390388, 0.1098039, 0, 1, 1,
0.4516998, -1.455226, 1.855052, 0.1176471, 0, 1, 1,
0.4539432, -0.4726403, 3.352569, 0.1215686, 0, 1, 1,
0.457361, 0.8987193, -0.7183661, 0.1294118, 0, 1, 1,
0.4594807, -0.9701416, 2.376436, 0.1333333, 0, 1, 1,
0.4610527, -0.5784347, 1.999691, 0.1411765, 0, 1, 1,
0.461273, 0.1295704, -0.3230076, 0.145098, 0, 1, 1,
0.4619454, 0.6496108, 1.424554, 0.1529412, 0, 1, 1,
0.4647471, 0.8792423, 1.822206, 0.1568628, 0, 1, 1,
0.4648262, 1.767859, -0.5787386, 0.1647059, 0, 1, 1,
0.4660697, 0.5948536, 0.3061956, 0.1686275, 0, 1, 1,
0.467357, -1.683612, 3.768972, 0.1764706, 0, 1, 1,
0.4700113, 2.214577, -0.1107279, 0.1803922, 0, 1, 1,
0.4742205, 0.2792437, -0.1678938, 0.1882353, 0, 1, 1,
0.4762281, -1.510682, 3.036089, 0.1921569, 0, 1, 1,
0.4857752, 0.004530035, 0.9072387, 0.2, 0, 1, 1,
0.4860396, 0.3854415, -0.007767865, 0.2078431, 0, 1, 1,
0.4983883, -0.5922763, 3.66672, 0.2117647, 0, 1, 1,
0.5063214, -0.4339218, 0.6802182, 0.2196078, 0, 1, 1,
0.5074534, -0.4724163, 2.906696, 0.2235294, 0, 1, 1,
0.5075929, -0.1409449, 1.649008, 0.2313726, 0, 1, 1,
0.5084822, 1.991461, 0.6017833, 0.2352941, 0, 1, 1,
0.5192995, -0.4725013, 3.444425, 0.2431373, 0, 1, 1,
0.5249037, 0.3367531, 1.526162, 0.2470588, 0, 1, 1,
0.5307757, -0.175416, 1.581758, 0.254902, 0, 1, 1,
0.5325391, 0.137282, 0.1453616, 0.2588235, 0, 1, 1,
0.5368844, 0.321113, 1.536889, 0.2666667, 0, 1, 1,
0.5407758, 0.3100879, 0.7658249, 0.2705882, 0, 1, 1,
0.5480514, -0.3057186, 3.647086, 0.2784314, 0, 1, 1,
0.5504569, 0.2322771, 0.6554712, 0.282353, 0, 1, 1,
0.5507973, 0.7761054, -0.07149516, 0.2901961, 0, 1, 1,
0.5533043, 0.6818473, 0.1176351, 0.2941177, 0, 1, 1,
0.5576112, -0.4620735, 2.364701, 0.3019608, 0, 1, 1,
0.5576242, 0.8604105, 1.233154, 0.3098039, 0, 1, 1,
0.5592673, 0.2532434, 1.061563, 0.3137255, 0, 1, 1,
0.5629808, 1.050462, 1.63997, 0.3215686, 0, 1, 1,
0.5656866, 0.5613561, 0.03457223, 0.3254902, 0, 1, 1,
0.5667975, -0.1817096, 1.97116, 0.3333333, 0, 1, 1,
0.5717573, 1.32308, 0.2508352, 0.3372549, 0, 1, 1,
0.5757349, 0.0248882, 1.66786, 0.345098, 0, 1, 1,
0.5806018, 1.191519, -0.5468321, 0.3490196, 0, 1, 1,
0.5821428, -0.4949209, 2.364572, 0.3568628, 0, 1, 1,
0.5875777, 0.07270987, 3.101256, 0.3607843, 0, 1, 1,
0.5891426, -0.4289641, 2.776463, 0.3686275, 0, 1, 1,
0.589529, -0.05346336, 3.345885, 0.372549, 0, 1, 1,
0.5913502, 1.244424, 0.08672815, 0.3803922, 0, 1, 1,
0.5929158, 0.8971658, 0.03589945, 0.3843137, 0, 1, 1,
0.5967072, 1.233619, 0.8766312, 0.3921569, 0, 1, 1,
0.6044731, -0.05872208, 1.236346, 0.3960784, 0, 1, 1,
0.610489, -0.1552269, 2.484556, 0.4039216, 0, 1, 1,
0.6210009, -0.1264988, 1.352496, 0.4117647, 0, 1, 1,
0.6222892, 1.538789, 1.264675, 0.4156863, 0, 1, 1,
0.6269106, 0.2971903, 0.765837, 0.4235294, 0, 1, 1,
0.6283573, -1.218611, 3.84572, 0.427451, 0, 1, 1,
0.6333839, 1.49525, 1.373361, 0.4352941, 0, 1, 1,
0.6390578, 0.6508133, 0.9339235, 0.4392157, 0, 1, 1,
0.6413012, 1.291742, -0.2271251, 0.4470588, 0, 1, 1,
0.647453, -0.2611533, 0.7183791, 0.4509804, 0, 1, 1,
0.6487653, -0.6469877, 2.845753, 0.4588235, 0, 1, 1,
0.6488427, 1.370543, 0.4444412, 0.4627451, 0, 1, 1,
0.6558164, 1.473139, -0.05999369, 0.4705882, 0, 1, 1,
0.6580695, 0.8834814, 0.1035403, 0.4745098, 0, 1, 1,
0.6585098, -0.7619308, 3.175409, 0.4823529, 0, 1, 1,
0.6636548, -0.5136461, 3.870049, 0.4862745, 0, 1, 1,
0.6662106, 1.082276, -0.2583446, 0.4941176, 0, 1, 1,
0.6762024, -0.4507342, 3.02809, 0.5019608, 0, 1, 1,
0.6837478, -1.964789, 4.371105, 0.5058824, 0, 1, 1,
0.6876147, -0.2022796, 0.8493706, 0.5137255, 0, 1, 1,
0.6894599, 0.4463567, 1.637086, 0.5176471, 0, 1, 1,
0.6932855, 1.426174, -0.1023135, 0.5254902, 0, 1, 1,
0.6939014, -0.7568238, 1.931312, 0.5294118, 0, 1, 1,
0.6947877, 1.121073, 0.0976144, 0.5372549, 0, 1, 1,
0.6978062, -1.408659, 2.937505, 0.5411765, 0, 1, 1,
0.7039638, -0.3469821, 2.329505, 0.5490196, 0, 1, 1,
0.7051774, -1.269106, 2.6579, 0.5529412, 0, 1, 1,
0.7090205, 0.9097036, 2.359574, 0.5607843, 0, 1, 1,
0.7128589, -0.7310358, 2.47092, 0.5647059, 0, 1, 1,
0.7144066, 1.067413, -0.2479558, 0.572549, 0, 1, 1,
0.7183936, 1.139647, 0.3903134, 0.5764706, 0, 1, 1,
0.7192563, 0.5134096, 0.9095381, 0.5843138, 0, 1, 1,
0.725902, -1.898564, 1.935923, 0.5882353, 0, 1, 1,
0.7334577, 1.077901, 0.3996163, 0.5960785, 0, 1, 1,
0.7347782, -0.02193331, 1.603181, 0.6039216, 0, 1, 1,
0.7355132, -0.3885815, 4.579339, 0.6078432, 0, 1, 1,
0.7363527, 1.434654, 0.06772567, 0.6156863, 0, 1, 1,
0.7365878, 1.057475, 1.187417, 0.6196079, 0, 1, 1,
0.7407593, 0.8708746, 3.513517, 0.627451, 0, 1, 1,
0.7423556, 1.049469, 0.2347281, 0.6313726, 0, 1, 1,
0.7458449, -0.4815882, 2.424625, 0.6392157, 0, 1, 1,
0.752719, -0.5809894, 0.8218649, 0.6431373, 0, 1, 1,
0.7550868, -1.585776, 3.838354, 0.6509804, 0, 1, 1,
0.7555421, -1.119654, 1.098466, 0.654902, 0, 1, 1,
0.7567572, 0.3434147, 1.726155, 0.6627451, 0, 1, 1,
0.7601463, -1.093922, 3.21731, 0.6666667, 0, 1, 1,
0.7653839, -0.2647507, 2.120498, 0.6745098, 0, 1, 1,
0.7662857, 0.4333668, 0.9203399, 0.6784314, 0, 1, 1,
0.7698802, -2.194866, 2.338396, 0.6862745, 0, 1, 1,
0.7699612, 1.192536, 3.214873, 0.6901961, 0, 1, 1,
0.7764362, 1.421819, 1.290422, 0.6980392, 0, 1, 1,
0.7768586, -0.8282158, 2.083821, 0.7058824, 0, 1, 1,
0.7776911, -0.1314317, 1.203388, 0.7098039, 0, 1, 1,
0.7791534, -0.4037426, 4.554471, 0.7176471, 0, 1, 1,
0.784844, -0.2492157, 2.115254, 0.7215686, 0, 1, 1,
0.78541, -1.884753, 1.076303, 0.7294118, 0, 1, 1,
0.7897217, 1.170906, -0.5610996, 0.7333333, 0, 1, 1,
0.790258, -2.606911, 1.039492, 0.7411765, 0, 1, 1,
0.7940592, 0.5423543, 1.284302, 0.7450981, 0, 1, 1,
0.7979534, -1.157687, 1.052935, 0.7529412, 0, 1, 1,
0.8000142, -1.172222, 4.390743, 0.7568628, 0, 1, 1,
0.8033856, 0.1312621, 0.4769157, 0.7647059, 0, 1, 1,
0.8061537, -0.4447127, 3.875415, 0.7686275, 0, 1, 1,
0.8066766, 2.679539, 1.485184, 0.7764706, 0, 1, 1,
0.8085698, -0.1397893, 1.998965, 0.7803922, 0, 1, 1,
0.8109536, 1.334481, -0.1885485, 0.7882353, 0, 1, 1,
0.8128809, -0.2747621, 2.898501, 0.7921569, 0, 1, 1,
0.8162457, -0.194082, 3.061899, 0.8, 0, 1, 1,
0.8277896, -0.1438052, 1.850409, 0.8078431, 0, 1, 1,
0.8291023, -0.4167021, 3.600019, 0.8117647, 0, 1, 1,
0.8297613, -0.9083815, 1.73401, 0.8196079, 0, 1, 1,
0.8300386, -0.9849176, 2.311641, 0.8235294, 0, 1, 1,
0.8386855, 1.360673, -0.6707207, 0.8313726, 0, 1, 1,
0.8445807, -0.3914289, 1.833379, 0.8352941, 0, 1, 1,
0.8472963, -0.9242511, 1.686478, 0.8431373, 0, 1, 1,
0.8513994, 0.5382074, 1.618361, 0.8470588, 0, 1, 1,
0.8521318, -1.089463, 1.931273, 0.854902, 0, 1, 1,
0.8554658, 0.282103, 0.2880563, 0.8588235, 0, 1, 1,
0.8583431, 0.6777884, 1.897394, 0.8666667, 0, 1, 1,
0.8690243, 1.109576, -0.5501162, 0.8705882, 0, 1, 1,
0.8699577, 0.2804608, 2.601704, 0.8784314, 0, 1, 1,
0.8822516, 1.183824, 1.092507, 0.8823529, 0, 1, 1,
0.8848132, 0.6987547, 0.3055528, 0.8901961, 0, 1, 1,
0.8911155, -0.5357956, 3.130324, 0.8941177, 0, 1, 1,
0.8929631, 1.256707, 0.4973129, 0.9019608, 0, 1, 1,
0.9014258, -0.6696841, 1.748537, 0.9098039, 0, 1, 1,
0.9038681, 0.7949613, 2.391321, 0.9137255, 0, 1, 1,
0.9063618, 0.465925, 3.488243, 0.9215686, 0, 1, 1,
0.9111822, 1.667313, 0.6609742, 0.9254902, 0, 1, 1,
0.9126985, -0.7366932, 0.5897455, 0.9333333, 0, 1, 1,
0.9150798, 2.261649, 0.9137338, 0.9372549, 0, 1, 1,
0.9158062, -0.765078, 1.965723, 0.945098, 0, 1, 1,
0.9189912, 0.3062872, 4.264647, 0.9490196, 0, 1, 1,
0.921571, -0.02464059, 4.138929, 0.9568627, 0, 1, 1,
0.9289335, -0.7741603, 1.880849, 0.9607843, 0, 1, 1,
0.9289581, -0.466806, 2.337152, 0.9686275, 0, 1, 1,
0.9318968, 1.49436, -0.8098766, 0.972549, 0, 1, 1,
0.9320169, -2.17783, 2.289852, 0.9803922, 0, 1, 1,
0.9342968, 1.321344, 1.716601, 0.9843137, 0, 1, 1,
0.9348595, -0.7134041, 2.469264, 0.9921569, 0, 1, 1,
0.9368412, -0.9591969, 2.309804, 0.9960784, 0, 1, 1,
0.9415021, -1.397672, 2.218895, 1, 0, 0.9960784, 1,
0.9479195, -0.6932871, 1.610799, 1, 0, 0.9882353, 1,
0.9516242, 0.1734088, 0.9732447, 1, 0, 0.9843137, 1,
0.9532933, 1.459144, 0.7516934, 1, 0, 0.9764706, 1,
0.9590766, -0.6213405, 2.371288, 1, 0, 0.972549, 1,
0.9613584, 1.715019, 1.117045, 1, 0, 0.9647059, 1,
0.9689913, 0.3453508, 2.132902, 1, 0, 0.9607843, 1,
0.9743479, -0.4443127, 3.277911, 1, 0, 0.9529412, 1,
0.97466, -1.989099, 2.920452, 1, 0, 0.9490196, 1,
0.9914727, -1.04389, 2.362618, 1, 0, 0.9411765, 1,
0.9966432, 1.091739, -1.145239, 1, 0, 0.9372549, 1,
0.9969648, -0.3441607, 0.6002139, 1, 0, 0.9294118, 1,
1.000731, -0.4197506, 2.353597, 1, 0, 0.9254902, 1,
1.005358, -0.9528361, -0.01697514, 1, 0, 0.9176471, 1,
1.005919, 0.9781941, 0.02180839, 1, 0, 0.9137255, 1,
1.006233, -0.9342417, 2.074041, 1, 0, 0.9058824, 1,
1.006975, 0.4049621, 0.5579527, 1, 0, 0.9019608, 1,
1.007223, 0.02579515, 0.988404, 1, 0, 0.8941177, 1,
1.017316, -0.6252236, 2.482801, 1, 0, 0.8862745, 1,
1.022262, 0.2519774, -0.08078574, 1, 0, 0.8823529, 1,
1.033158, 1.845362, -0.1104241, 1, 0, 0.8745098, 1,
1.049032, 0.7882537, 0.9424067, 1, 0, 0.8705882, 1,
1.056817, 0.76833, -0.1387235, 1, 0, 0.8627451, 1,
1.057503, -0.2546889, 0.4812023, 1, 0, 0.8588235, 1,
1.065871, -1.657172, 0.743148, 1, 0, 0.8509804, 1,
1.067446, -1.103798, 1.2656, 1, 0, 0.8470588, 1,
1.070207, -0.9208676, 1.688451, 1, 0, 0.8392157, 1,
1.076702, -0.5924429, 1.791367, 1, 0, 0.8352941, 1,
1.076863, 2.254827, 1.272601, 1, 0, 0.827451, 1,
1.076903, 0.3670801, 1.297369, 1, 0, 0.8235294, 1,
1.077465, -1.402826, 2.305224, 1, 0, 0.8156863, 1,
1.079353, -1.083012, 1.98967, 1, 0, 0.8117647, 1,
1.083687, 0.8299559, 1.217317, 1, 0, 0.8039216, 1,
1.083923, 0.9065888, -0.1695646, 1, 0, 0.7960784, 1,
1.084555, -1.618336, 1.537513, 1, 0, 0.7921569, 1,
1.085477, 2.19088, 1.895084, 1, 0, 0.7843137, 1,
1.086665, -1.362475, 2.063039, 1, 0, 0.7803922, 1,
1.087117, 0.7392712, 1.535659, 1, 0, 0.772549, 1,
1.099463, -1.132674, 1.052715, 1, 0, 0.7686275, 1,
1.103058, -1.366935, 1.893208, 1, 0, 0.7607843, 1,
1.103063, -0.4143057, 1.885341, 1, 0, 0.7568628, 1,
1.115283, -0.549808, 2.734656, 1, 0, 0.7490196, 1,
1.121034, 0.01422268, 1.790626, 1, 0, 0.7450981, 1,
1.130008, 0.206421, 1.53964, 1, 0, 0.7372549, 1,
1.139446, -0.3347465, 2.753617, 1, 0, 0.7333333, 1,
1.142839, 0.1662429, 2.649922, 1, 0, 0.7254902, 1,
1.144015, 0.07653125, 0.9986775, 1, 0, 0.7215686, 1,
1.144116, -0.327927, 1.809205, 1, 0, 0.7137255, 1,
1.149898, -1.493752, 1.661002, 1, 0, 0.7098039, 1,
1.15601, 0.1902568, 2.29606, 1, 0, 0.7019608, 1,
1.160433, -0.5661052, 2.287215, 1, 0, 0.6941177, 1,
1.175684, -0.7848947, 1.41233, 1, 0, 0.6901961, 1,
1.184318, -0.4899267, 2.791641, 1, 0, 0.682353, 1,
1.188739, 0.6084189, 1.02648, 1, 0, 0.6784314, 1,
1.195969, -0.2685148, 2.66654, 1, 0, 0.6705883, 1,
1.20467, -0.4088847, 1.707851, 1, 0, 0.6666667, 1,
1.207746, -0.360763, 2.350476, 1, 0, 0.6588235, 1,
1.208699, 0.9871689, 1.647424, 1, 0, 0.654902, 1,
1.21251, 2.350936, 0.1629505, 1, 0, 0.6470588, 1,
1.223738, -0.3922859, 2.841102, 1, 0, 0.6431373, 1,
1.2322, -0.3480861, 1.349438, 1, 0, 0.6352941, 1,
1.2355, -0.0831641, 0.1425858, 1, 0, 0.6313726, 1,
1.24374, -0.7756544, 3.070016, 1, 0, 0.6235294, 1,
1.250382, 2.266664, 1.702705, 1, 0, 0.6196079, 1,
1.253674, -1.390093, 2.05844, 1, 0, 0.6117647, 1,
1.254317, -1.245331, 4.435019, 1, 0, 0.6078432, 1,
1.258965, -1.956995, 0.9809774, 1, 0, 0.6, 1,
1.265408, 0.4015596, -0.7014325, 1, 0, 0.5921569, 1,
1.270014, 0.5499775, 0.3984965, 1, 0, 0.5882353, 1,
1.277417, -0.9030783, 3.405369, 1, 0, 0.5803922, 1,
1.285535, -0.3449816, 2.255157, 1, 0, 0.5764706, 1,
1.294526, 0.07735335, 2.714703, 1, 0, 0.5686275, 1,
1.296022, -0.1486961, 2.171848, 1, 0, 0.5647059, 1,
1.301529, 0.1327328, 2.639791, 1, 0, 0.5568628, 1,
1.303676, -0.6352463, 1.633673, 1, 0, 0.5529412, 1,
1.307338, 1.307494, 1.486581, 1, 0, 0.5450981, 1,
1.310079, 0.03033812, 1.166625, 1, 0, 0.5411765, 1,
1.312493, -0.3073451, 3.454396, 1, 0, 0.5333334, 1,
1.327234, -0.5404491, 2.733846, 1, 0, 0.5294118, 1,
1.328536, -1.196886, 4.435634, 1, 0, 0.5215687, 1,
1.335487, -0.1328243, 1.101439, 1, 0, 0.5176471, 1,
1.34354, 0.9303161, 1.861034, 1, 0, 0.509804, 1,
1.366254, -1.325959, 0.2579748, 1, 0, 0.5058824, 1,
1.37096, -1.525527, 1.911049, 1, 0, 0.4980392, 1,
1.387577, 0.3386371, 1.750893, 1, 0, 0.4901961, 1,
1.390728, 1.265528, 1.507895, 1, 0, 0.4862745, 1,
1.395356, -2.258545, 0.5777732, 1, 0, 0.4784314, 1,
1.405727, 1.090245, 1.841399, 1, 0, 0.4745098, 1,
1.413935, -0.4167251, 2.749326, 1, 0, 0.4666667, 1,
1.434679, 0.1035366, 1.16674, 1, 0, 0.4627451, 1,
1.436335, -2.537369, 2.904667, 1, 0, 0.454902, 1,
1.461859, -0.9046769, 0.7445431, 1, 0, 0.4509804, 1,
1.475634, 0.4794912, 1.30445, 1, 0, 0.4431373, 1,
1.478462, -1.091074, -0.592407, 1, 0, 0.4392157, 1,
1.482393, 0.4335927, 1.227422, 1, 0, 0.4313726, 1,
1.484939, -0.3162977, 2.54074, 1, 0, 0.427451, 1,
1.485155, -1.70973, 2.55622, 1, 0, 0.4196078, 1,
1.496732, -0.2753063, -0.5452096, 1, 0, 0.4156863, 1,
1.498166, -0.4302472, 3.017597, 1, 0, 0.4078431, 1,
1.503204, 0.4313804, 2.256015, 1, 0, 0.4039216, 1,
1.507409, 0.249356, 1.563165, 1, 0, 0.3960784, 1,
1.507736, 1.537039, -0.945327, 1, 0, 0.3882353, 1,
1.514012, -0.06564543, -0.8896329, 1, 0, 0.3843137, 1,
1.5178, -0.12403, 2.602177, 1, 0, 0.3764706, 1,
1.528708, 0.5170207, 1.15037, 1, 0, 0.372549, 1,
1.539676, 1.10564, 2.28476, 1, 0, 0.3647059, 1,
1.554545, 0.7123456, 1.192015, 1, 0, 0.3607843, 1,
1.558815, -0.4948855, 1.849105, 1, 0, 0.3529412, 1,
1.567982, -1.383931, 2.700721, 1, 0, 0.3490196, 1,
1.587054, 0.208659, 3.254413, 1, 0, 0.3411765, 1,
1.587932, -0.6351998, 2.013804, 1, 0, 0.3372549, 1,
1.592801, -0.4955555, 2.987511, 1, 0, 0.3294118, 1,
1.615191, 0.10225, 2.315316, 1, 0, 0.3254902, 1,
1.632971, 0.2468257, 2.084147, 1, 0, 0.3176471, 1,
1.638662, 1.659599, 1.664024, 1, 0, 0.3137255, 1,
1.650141, 1.452353, 1.661599, 1, 0, 0.3058824, 1,
1.656519, -2.232399, 3.778824, 1, 0, 0.2980392, 1,
1.675302, -0.02500376, 2.783488, 1, 0, 0.2941177, 1,
1.679201, -1.541933, 3.738287, 1, 0, 0.2862745, 1,
1.686875, 0.8943595, 3.334774, 1, 0, 0.282353, 1,
1.691445, -0.6761413, 1.79058, 1, 0, 0.2745098, 1,
1.694665, -0.4564711, 2.276376, 1, 0, 0.2705882, 1,
1.69882, -0.4045479, 3.080499, 1, 0, 0.2627451, 1,
1.772052, 0.947985, 3.168069, 1, 0, 0.2588235, 1,
1.788237, 1.432201, 1.046598, 1, 0, 0.2509804, 1,
1.812224, 1.451159, 1.416429, 1, 0, 0.2470588, 1,
1.832275, -1.149182, 3.580669, 1, 0, 0.2392157, 1,
1.83586, -1.1401, -1.003517, 1, 0, 0.2352941, 1,
1.839573, -0.4162738, -0.03823445, 1, 0, 0.227451, 1,
1.844986, -0.4760553, 0.6128637, 1, 0, 0.2235294, 1,
1.847634, 0.5626606, 1.305953, 1, 0, 0.2156863, 1,
1.890866, 1.217533, 1.826918, 1, 0, 0.2117647, 1,
1.891024, 0.2004914, 2.029519, 1, 0, 0.2039216, 1,
1.900903, 0.3467183, 2.039384, 1, 0, 0.1960784, 1,
1.904249, 0.1304711, 0.9507352, 1, 0, 0.1921569, 1,
1.910641, -0.0990983, 0.05761071, 1, 0, 0.1843137, 1,
1.913465, 2.432771, -2.544094, 1, 0, 0.1803922, 1,
1.92017, -2.496099, 0.7252731, 1, 0, 0.172549, 1,
1.930967, -0.4548854, 1.821933, 1, 0, 0.1686275, 1,
1.946122, -0.4028276, -0.198483, 1, 0, 0.1607843, 1,
1.949744, 0.8604302, 1.89252, 1, 0, 0.1568628, 1,
1.967451, 0.05194227, 1.722752, 1, 0, 0.1490196, 1,
1.969773, -1.301856, 1.441801, 1, 0, 0.145098, 1,
1.998541, -0.226899, 2.970179, 1, 0, 0.1372549, 1,
2.002239, -0.004031953, 1.777771, 1, 0, 0.1333333, 1,
2.021255, -0.2877279, -0.1082003, 1, 0, 0.1254902, 1,
2.025192, -1.606788, 1.642339, 1, 0, 0.1215686, 1,
2.070588, -0.56784, 3.23794, 1, 0, 0.1137255, 1,
2.092231, 1.254663, 1.202805, 1, 0, 0.1098039, 1,
2.096715, -0.5348577, 3.686517, 1, 0, 0.1019608, 1,
2.09928, 0.3682347, 1.974382, 1, 0, 0.09411765, 1,
2.120965, 0.6465646, 1.019502, 1, 0, 0.09019608, 1,
2.161456, 2.435502, 1.180933, 1, 0, 0.08235294, 1,
2.179152, 0.1792722, 2.211717, 1, 0, 0.07843138, 1,
2.276386, 0.5225044, -0.5444593, 1, 0, 0.07058824, 1,
2.276756, -0.3384733, 1.98239, 1, 0, 0.06666667, 1,
2.310425, 1.400101, 1.361207, 1, 0, 0.05882353, 1,
2.329597, 0.3580844, 0.8854086, 1, 0, 0.05490196, 1,
2.351439, 1.748981, 0.7276121, 1, 0, 0.04705882, 1,
2.380387, 1.332602, 2.135392, 1, 0, 0.04313726, 1,
2.501813, 1.588174, 0.6182653, 1, 0, 0.03529412, 1,
2.543416, 0.1112719, 1.039302, 1, 0, 0.03137255, 1,
2.579575, -1.942463, 0.8645542, 1, 0, 0.02352941, 1,
2.598515, 1.189832, 1.769737, 1, 0, 0.01960784, 1,
2.925292, 0.4447984, 0.6611095, 1, 0, 0.01176471, 1,
3.279533, 0.6646658, -0.329021, 1, 0, 0.007843138, 1
]);
var buf7 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
// ****** text object 9 ******
var prog9  = gl.createProgram();
gl.attachShader(prog9, getShader( gl, "testglvshader9" ));
gl.attachShader(prog9, getShader( gl, "testglfshader9" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog9, 0, "aPos");
gl.bindAttribLocation(prog9, 1, "aCol");
gl.linkProgram(prog9);
var texts = [
"x"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX9 = texinfo.canvasX;
var canvasY9 = texinfo.canvasY;
var ofsLoc9 = gl.getAttribLocation(prog9, "aOfs");
var texture9 = gl.createTexture();
var texLoc9 = gl.getAttribLocation(prog9, "aTexcoord");
var sampler9 = gl.getUniformLocation(prog9,"uSampler");
handleLoadedTexture(texture9, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-0.2262855, -4.114944, -6.73996, 0, -0.5, 0.5, 0.5,
-0.2262855, -4.114944, -6.73996, 1, -0.5, 0.5, 0.5,
-0.2262855, -4.114944, -6.73996, 1, 1.5, 0.5, 0.5,
-0.2262855, -4.114944, -6.73996, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf9 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf9 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc9 = gl.getUniformLocation(prog9,"mvMatrix");
var prMatLoc9 = gl.getUniformLocation(prog9,"prMatrix");
var textScaleLoc9 = gl.getUniformLocation(prog9,"textScale");
// ****** text object 10 ******
var prog10  = gl.createProgram();
gl.attachShader(prog10, getShader( gl, "testglvshader10" ));
gl.attachShader(prog10, getShader( gl, "testglfshader10" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog10, 0, "aPos");
gl.bindAttribLocation(prog10, 1, "aCol");
gl.linkProgram(prog10);
var texts = [
"y"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX10 = texinfo.canvasX;
var canvasY10 = texinfo.canvasY;
var ofsLoc10 = gl.getAttribLocation(prog10, "aOfs");
var texture10 = gl.createTexture();
var texLoc10 = gl.getAttribLocation(prog10, "aTexcoord");
var sampler10 = gl.getUniformLocation(prog10,"uSampler");
handleLoadedTexture(texture10, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.920576, -0.05245256, -6.73996, 0, -0.5, 0.5, 0.5,
-4.920576, -0.05245256, -6.73996, 1, -0.5, 0.5, 0.5,
-4.920576, -0.05245256, -6.73996, 1, 1.5, 0.5, 0.5,
-4.920576, -0.05245256, -6.73996, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf10 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf10 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc10 = gl.getUniformLocation(prog10,"mvMatrix");
var prMatLoc10 = gl.getUniformLocation(prog10,"prMatrix");
var textScaleLoc10 = gl.getUniformLocation(prog10,"textScale");
// ****** text object 11 ******
var prog11  = gl.createProgram();
gl.attachShader(prog11, getShader( gl, "testglvshader11" ));
gl.attachShader(prog11, getShader( gl, "testglfshader11" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog11, 0, "aPos");
gl.bindAttribLocation(prog11, 1, "aCol");
gl.linkProgram(prog11);
var texts = [
"z"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX11 = texinfo.canvasX;
var canvasY11 = texinfo.canvasY;
var ofsLoc11 = gl.getAttribLocation(prog11, "aOfs");
var texture11 = gl.createTexture();
var texLoc11 = gl.getAttribLocation(prog11, "aTexcoord");
var sampler11 = gl.getUniformLocation(prog11,"uSampler");
handleLoadedTexture(texture11, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.920576, -4.114944, 0.06937551, 0, -0.5, 0.5, 0.5,
-4.920576, -4.114944, 0.06937551, 1, -0.5, 0.5, 0.5,
-4.920576, -4.114944, 0.06937551, 1, 1.5, 0.5, 0.5,
-4.920576, -4.114944, 0.06937551, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf11 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf11 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc11 = gl.getUniformLocation(prog11,"mvMatrix");
var prMatLoc11 = gl.getUniformLocation(prog11,"prMatrix");
var textScaleLoc11 = gl.getUniformLocation(prog11,"textScale");
// ****** lines object 12 ******
var prog12  = gl.createProgram();
gl.attachShader(prog12, getShader( gl, "testglvshader12" ));
gl.attachShader(prog12, getShader( gl, "testglfshader12" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog12, 0, "aPos");
gl.bindAttribLocation(prog12, 1, "aCol");
gl.linkProgram(prog12);
var v=new Float32Array([
-2, -3.177446, -5.168575,
2, -3.177446, -5.168575,
-2, -3.177446, -5.168575,
-2, -3.333696, -5.430472,
0, -3.177446, -5.168575,
0, -3.333696, -5.430472,
2, -3.177446, -5.168575,
2, -3.333696, -5.430472
]);
var buf12 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc12 = gl.getUniformLocation(prog12,"mvMatrix");
var prMatLoc12 = gl.getUniformLocation(prog12,"prMatrix");
// ****** text object 13 ******
var prog13  = gl.createProgram();
gl.attachShader(prog13, getShader( gl, "testglvshader13" ));
gl.attachShader(prog13, getShader( gl, "testglfshader13" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog13, 0, "aPos");
gl.bindAttribLocation(prog13, 1, "aCol");
gl.linkProgram(prog13);
var texts = [
"-2",
"0",
"2"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX13 = texinfo.canvasX;
var canvasY13 = texinfo.canvasY;
var ofsLoc13 = gl.getAttribLocation(prog13, "aOfs");
var texture13 = gl.createTexture();
var texLoc13 = gl.getAttribLocation(prog13, "aTexcoord");
var sampler13 = gl.getUniformLocation(prog13,"uSampler");
handleLoadedTexture(texture13, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-2, -3.646196, -5.954268, 0, -0.5, 0.5, 0.5,
-2, -3.646196, -5.954268, 1, -0.5, 0.5, 0.5,
-2, -3.646196, -5.954268, 1, 1.5, 0.5, 0.5,
-2, -3.646196, -5.954268, 0, 1.5, 0.5, 0.5,
0, -3.646196, -5.954268, 0, -0.5, 0.5, 0.5,
0, -3.646196, -5.954268, 1, -0.5, 0.5, 0.5,
0, -3.646196, -5.954268, 1, 1.5, 0.5, 0.5,
0, -3.646196, -5.954268, 0, 1.5, 0.5, 0.5,
2, -3.646196, -5.954268, 0, -0.5, 0.5, 0.5,
2, -3.646196, -5.954268, 1, -0.5, 0.5, 0.5,
2, -3.646196, -5.954268, 1, 1.5, 0.5, 0.5,
2, -3.646196, -5.954268, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11
]);
var buf13 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf13 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc13 = gl.getUniformLocation(prog13,"mvMatrix");
var prMatLoc13 = gl.getUniformLocation(prog13,"prMatrix");
var textScaleLoc13 = gl.getUniformLocation(prog13,"textScale");
// ****** lines object 14 ******
var prog14  = gl.createProgram();
gl.attachShader(prog14, getShader( gl, "testglvshader14" ));
gl.attachShader(prog14, getShader( gl, "testglfshader14" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog14, 0, "aPos");
gl.bindAttribLocation(prog14, 1, "aCol");
gl.linkProgram(prog14);
var v=new Float32Array([
-3.837278, -3, -5.168575,
-3.837278, 2, -5.168575,
-3.837278, -3, -5.168575,
-4.017828, -3, -5.430472,
-3.837278, -2, -5.168575,
-4.017828, -2, -5.430472,
-3.837278, -1, -5.168575,
-4.017828, -1, -5.430472,
-3.837278, 0, -5.168575,
-4.017828, 0, -5.430472,
-3.837278, 1, -5.168575,
-4.017828, 1, -5.430472,
-3.837278, 2, -5.168575,
-4.017828, 2, -5.430472
]);
var buf14 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc14 = gl.getUniformLocation(prog14,"mvMatrix");
var prMatLoc14 = gl.getUniformLocation(prog14,"prMatrix");
// ****** text object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testglvshader15" ));
gl.attachShader(prog15, getShader( gl, "testglfshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX15 = texinfo.canvasX;
var canvasY15 = texinfo.canvasY;
var ofsLoc15 = gl.getAttribLocation(prog15, "aOfs");
var texture15 = gl.createTexture();
var texLoc15 = gl.getAttribLocation(prog15, "aTexcoord");
var sampler15 = gl.getUniformLocation(prog15,"uSampler");
handleLoadedTexture(texture15, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.378927, -3, -5.954268, 0, -0.5, 0.5, 0.5,
-4.378927, -3, -5.954268, 1, -0.5, 0.5, 0.5,
-4.378927, -3, -5.954268, 1, 1.5, 0.5, 0.5,
-4.378927, -3, -5.954268, 0, 1.5, 0.5, 0.5,
-4.378927, -2, -5.954268, 0, -0.5, 0.5, 0.5,
-4.378927, -2, -5.954268, 1, -0.5, 0.5, 0.5,
-4.378927, -2, -5.954268, 1, 1.5, 0.5, 0.5,
-4.378927, -2, -5.954268, 0, 1.5, 0.5, 0.5,
-4.378927, -1, -5.954268, 0, -0.5, 0.5, 0.5,
-4.378927, -1, -5.954268, 1, -0.5, 0.5, 0.5,
-4.378927, -1, -5.954268, 1, 1.5, 0.5, 0.5,
-4.378927, -1, -5.954268, 0, 1.5, 0.5, 0.5,
-4.378927, 0, -5.954268, 0, -0.5, 0.5, 0.5,
-4.378927, 0, -5.954268, 1, -0.5, 0.5, 0.5,
-4.378927, 0, -5.954268, 1, 1.5, 0.5, 0.5,
-4.378927, 0, -5.954268, 0, 1.5, 0.5, 0.5,
-4.378927, 1, -5.954268, 0, -0.5, 0.5, 0.5,
-4.378927, 1, -5.954268, 1, -0.5, 0.5, 0.5,
-4.378927, 1, -5.954268, 1, 1.5, 0.5, 0.5,
-4.378927, 1, -5.954268, 0, 1.5, 0.5, 0.5,
-4.378927, 2, -5.954268, 0, -0.5, 0.5, 0.5,
-4.378927, 2, -5.954268, 1, -0.5, 0.5, 0.5,
-4.378927, 2, -5.954268, 1, 1.5, 0.5, 0.5,
-4.378927, 2, -5.954268, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23
]);
var buf15 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf15 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var textScaleLoc15 = gl.getUniformLocation(prog15,"textScale");
// ****** lines object 16 ******
var prog16  = gl.createProgram();
gl.attachShader(prog16, getShader( gl, "testglvshader16" ));
gl.attachShader(prog16, getShader( gl, "testglfshader16" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog16, 0, "aPos");
gl.bindAttribLocation(prog16, 1, "aCol");
gl.linkProgram(prog16);
var v=new Float32Array([
-3.837278, -3.177446, -4,
-3.837278, -3.177446, 4,
-3.837278, -3.177446, -4,
-4.017828, -3.333696, -4,
-3.837278, -3.177446, -2,
-4.017828, -3.333696, -2,
-3.837278, -3.177446, 0,
-4.017828, -3.333696, 0,
-3.837278, -3.177446, 2,
-4.017828, -3.333696, 2,
-3.837278, -3.177446, 4,
-4.017828, -3.333696, 4
]);
var buf16 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc16 = gl.getUniformLocation(prog16,"mvMatrix");
var prMatLoc16 = gl.getUniformLocation(prog16,"prMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testglvshader17" ));
gl.attachShader(prog17, getShader( gl, "testglfshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
"-4",
"-2",
"0",
"2",
"4"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.378927, -3.646196, -4, 0, -0.5, 0.5, 0.5,
-4.378927, -3.646196, -4, 1, -0.5, 0.5, 0.5,
-4.378927, -3.646196, -4, 1, 1.5, 0.5, 0.5,
-4.378927, -3.646196, -4, 0, 1.5, 0.5, 0.5,
-4.378927, -3.646196, -2, 0, -0.5, 0.5, 0.5,
-4.378927, -3.646196, -2, 1, -0.5, 0.5, 0.5,
-4.378927, -3.646196, -2, 1, 1.5, 0.5, 0.5,
-4.378927, -3.646196, -2, 0, 1.5, 0.5, 0.5,
-4.378927, -3.646196, 0, 0, -0.5, 0.5, 0.5,
-4.378927, -3.646196, 0, 1, -0.5, 0.5, 0.5,
-4.378927, -3.646196, 0, 1, 1.5, 0.5, 0.5,
-4.378927, -3.646196, 0, 0, 1.5, 0.5, 0.5,
-4.378927, -3.646196, 2, 0, -0.5, 0.5, 0.5,
-4.378927, -3.646196, 2, 1, -0.5, 0.5, 0.5,
-4.378927, -3.646196, 2, 1, 1.5, 0.5, 0.5,
-4.378927, -3.646196, 2, 0, 1.5, 0.5, 0.5,
-4.378927, -3.646196, 4, 0, -0.5, 0.5, 0.5,
-4.378927, -3.646196, 4, 1, -0.5, 0.5, 0.5,
-4.378927, -3.646196, 4, 1, 1.5, 0.5, 0.5,
-4.378927, -3.646196, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf17 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf17 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
var textScaleLoc17 = gl.getUniformLocation(prog17,"textScale");
// ****** lines object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testglvshader18" ));
gl.attachShader(prog18, getShader( gl, "testglfshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var v=new Float32Array([
-3.837278, -3.177446, -5.168575,
-3.837278, 3.072541, -5.168575,
-3.837278, -3.177446, 5.307326,
-3.837278, 3.072541, 5.307326,
-3.837278, -3.177446, -5.168575,
-3.837278, -3.177446, 5.307326,
-3.837278, 3.072541, -5.168575,
-3.837278, 3.072541, 5.307326,
-3.837278, -3.177446, -5.168575,
3.384707, -3.177446, -5.168575,
-3.837278, -3.177446, 5.307326,
3.384707, -3.177446, 5.307326,
-3.837278, 3.072541, -5.168575,
3.384707, 3.072541, -5.168575,
-3.837278, 3.072541, 5.307326,
3.384707, 3.072541, 5.307326,
3.384707, -3.177446, -5.168575,
3.384707, 3.072541, -5.168575,
3.384707, -3.177446, 5.307326,
3.384707, 3.072541, 5.307326,
3.384707, -3.177446, -5.168575,
3.384707, -3.177446, 5.307326,
3.384707, 3.072541, -5.168575,
3.384707, 3.072541, 5.307326
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 1 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 7.569802;
var distance = 33.6789;
var t = tan(fov[1]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[1], hlen*aspect*zoom[1], 
-hlen*zoom[1], hlen*zoom[1], near, far);
else  
prMatrix.frustum(-hlen*zoom[1], hlen*zoom[1], 
-hlen*zoom[1]/aspect, hlen*zoom[1]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.2262855, 0.05245256, -0.06937551 );
mvMatrix.scale( 1.133292, 1.309541, 0.7812806 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.6789);
// ****** points object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.POINTS, 0, 1000);
// ****** text object 9 *******
gl.useProgram(prog9);
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.uniformMatrix4fv( prMatLoc9, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc9, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc9, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc9 );
gl.vertexAttribPointer(texLoc9, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture9);
gl.uniform1i( sampler9, 0);
gl.enableVertexAttribArray( ofsLoc9 );
gl.vertexAttribPointer(ofsLoc9, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 10 *******
gl.useProgram(prog10);
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.uniformMatrix4fv( prMatLoc10, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc10, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc10, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc10 );
gl.vertexAttribPointer(texLoc10, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture10);
gl.uniform1i( sampler10, 0);
gl.enableVertexAttribArray( ofsLoc10 );
gl.vertexAttribPointer(ofsLoc10, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 11 *******
gl.useProgram(prog11);
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.uniformMatrix4fv( prMatLoc11, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc11, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc11, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc11 );
gl.vertexAttribPointer(texLoc11, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture11);
gl.uniform1i( sampler11, 0);
gl.enableVertexAttribArray( ofsLoc11 );
gl.vertexAttribPointer(ofsLoc11, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 12 *******
gl.useProgram(prog12);
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.uniformMatrix4fv( prMatLoc12, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc12, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 8);
// ****** text object 13 *******
gl.useProgram(prog13);
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.uniformMatrix4fv( prMatLoc13, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc13, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc13, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc13 );
gl.vertexAttribPointer(texLoc13, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture13);
gl.uniform1i( sampler13, 0);
gl.enableVertexAttribArray( ofsLoc13 );
gl.vertexAttribPointer(ofsLoc13, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
// ****** lines object 14 *******
gl.useProgram(prog14);
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.uniformMatrix4fv( prMatLoc14, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc14, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 14);
// ****** text object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc15, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc15 );
gl.vertexAttribPointer(texLoc15, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture15);
gl.uniform1i( sampler15, 0);
gl.enableVertexAttribArray( ofsLoc15 );
gl.vertexAttribPointer(ofsLoc15, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
// ****** lines object 16 *******
gl.useProgram(prog16);
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.uniformMatrix4fv( prMatLoc16, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc16, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc17 );
gl.vertexAttribPointer(texLoc17, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture17);
gl.uniform1i( sampler17, 0);
gl.enableVertexAttribArray( ofsLoc17 );
gl.vertexAttribPointer(ofsLoc17, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
1: 0
};
var vpy0 = {
1: 0
};
var vpWidths = {
1: 504
};
var vpHeights = {
1: 504
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(1);
return(1);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testglcanvas" width="1" height="1"></canvas> 
<p id="testgldebug">
You must enable Javascript to view this page properly.</p>
<script>testglwebGLStart();</script>

The following a 3D image is of Atrazine rendered from the 3D conformer file derived from here (http://pubchem.ncbi.nlm.nih.gov/compound/2256). The atoms are represented as spheres Nitrogen as blue, carbon as black, hydrogen as white, and chlorine as blue.


```r
open3d()
```

```
## glX 
##   2
```

```r
Prallethrin<-read.table("Prallethrin.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Prallethrin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Prallethrin' not found
```

```r
y<-Prallethrin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Prallethrin' not found
```

```r
z<-Prallethrin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Prallethrin' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgl2textureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-3.732104, 1.293005, -1.045174, 0, 0, 1, 1, 1,
-3.43752, -1.692822, -2.615483, 1, 0, 0, 1, 1,
-3.24769, 0.4898947, -0.978554, 1, 0, 0, 1, 1,
-3.125842, -0.1279385, -0.8617955, 1, 0, 0, 1, 1,
-2.783905, -0.2596599, -1.266679, 1, 0, 0, 1, 1,
-2.769474, -1.058633, -3.855694, 1, 0, 0, 1, 1,
-2.62125, -0.474323, -1.449019, 0, 0, 0, 1, 1,
-2.602595, -1.347752, -0.5272567, 0, 0, 0, 1, 1,
-2.48368, 1.8585, -2.07055, 0, 0, 0, 1, 1,
-2.467664, 0.7585472, -1.634478, 0, 0, 0, 1, 1,
-2.443741, -0.04544566, -0.8063167, 0, 0, 0, 1, 1,
-2.387074, 0.1621208, -0.6794519, 0, 0, 0, 1, 1,
-2.378865, -0.08737475, -0.5533242, 0, 0, 0, 1, 1,
-2.370409, -0.8264526, -1.482352, 1, 1, 1, 1, 1,
-2.295803, 0.305778, -1.759735, 1, 1, 1, 1, 1,
-2.290555, 0.489797, -0.4415269, 1, 1, 1, 1, 1,
-2.280529, 2.210207, -2.301761, 1, 1, 1, 1, 1,
-2.258151, -0.429045, -2.888831, 1, 1, 1, 1, 1,
-2.236493, 1.21485, -0.1783622, 1, 1, 1, 1, 1,
-2.090197, 0.1831336, 0.2191661, 1, 1, 1, 1, 1,
-2.064411, 0.1508969, 0.08536188, 1, 1, 1, 1, 1,
-2.051122, -0.8297631, -2.093166, 1, 1, 1, 1, 1,
-2.04075, -1.193511, -2.321553, 1, 1, 1, 1, 1,
-2.030038, 1.179897, 0.07151888, 1, 1, 1, 1, 1,
-2.000504, -0.1193886, -1.835349, 1, 1, 1, 1, 1,
-1.976754, 1.431784, -0.7147856, 1, 1, 1, 1, 1,
-1.964302, 0.346433, -0.2787743, 1, 1, 1, 1, 1,
-1.963853, 0.06014502, -3.025743, 1, 1, 1, 1, 1,
-1.948371, -1.360536, -3.423053, 0, 0, 1, 1, 1,
-1.931859, 0.1545733, 0.5648456, 1, 0, 0, 1, 1,
-1.911698, 1.507292, -2.355807, 1, 0, 0, 1, 1,
-1.909398, -0.3078621, -2.824192, 1, 0, 0, 1, 1,
-1.882082, -0.500832, -1.881351, 1, 0, 0, 1, 1,
-1.876735, -0.4492264, -2.694219, 1, 0, 0, 1, 1,
-1.871543, -0.7142028, -3.286834, 0, 0, 0, 1, 1,
-1.855112, 0.4830045, -0.6112071, 0, 0, 0, 1, 1,
-1.813201, -0.2432307, -1.408943, 0, 0, 0, 1, 1,
-1.806973, -0.5161402, -2.65534, 0, 0, 0, 1, 1,
-1.779408, -0.1031424, -1.311531, 0, 0, 0, 1, 1,
-1.777361, -0.4472547, -1.973937, 0, 0, 0, 1, 1,
-1.774209, -1.164351, -2.366554, 0, 0, 0, 1, 1,
-1.773895, -0.19546, -2.64967, 1, 1, 1, 1, 1,
-1.771552, -0.6014337, -2.222254, 1, 1, 1, 1, 1,
-1.766602, 0.7224508, -0.7760979, 1, 1, 1, 1, 1,
-1.765607, -0.0818353, -1.118609, 1, 1, 1, 1, 1,
-1.741844, -1.869436, -2.611225, 1, 1, 1, 1, 1,
-1.727313, 0.1046055, -1.829678, 1, 1, 1, 1, 1,
-1.713859, 1.095546, 0.117097, 1, 1, 1, 1, 1,
-1.698256, 1.044019, -1.349049, 1, 1, 1, 1, 1,
-1.69726, 1.912346, -1.414387, 1, 1, 1, 1, 1,
-1.694225, -0.03318293, -2.238504, 1, 1, 1, 1, 1,
-1.686243, -3.086427, -2.075618, 1, 1, 1, 1, 1,
-1.673992, 0.0611626, -1.511298, 1, 1, 1, 1, 1,
-1.667649, -0.5496158, -1.51593, 1, 1, 1, 1, 1,
-1.663917, -0.009836163, -2.876545, 1, 1, 1, 1, 1,
-1.658226, 0.1240184, -1.161956, 1, 1, 1, 1, 1,
-1.622756, 0.006841851, -2.57719, 0, 0, 1, 1, 1,
-1.617523, 0.8937036, -0.9259052, 1, 0, 0, 1, 1,
-1.615511, -0.4461138, -0.423595, 1, 0, 0, 1, 1,
-1.58514, 0.5452342, -0.3239515, 1, 0, 0, 1, 1,
-1.572842, -0.8561775, -3.583549, 1, 0, 0, 1, 1,
-1.571025, -1.102899, -2.895702, 1, 0, 0, 1, 1,
-1.566623, -0.05252626, -0.6170889, 0, 0, 0, 1, 1,
-1.561617, 1.434052, -3.247503, 0, 0, 0, 1, 1,
-1.561268, 0.05870547, -0.5198281, 0, 0, 0, 1, 1,
-1.555922, 0.9181446, 0.2406046, 0, 0, 0, 1, 1,
-1.549296, -1.080636, -1.436082, 0, 0, 0, 1, 1,
-1.534016, -0.6964616, -1.059807, 0, 0, 0, 1, 1,
-1.525468, 2.150234, -3.521559, 0, 0, 0, 1, 1,
-1.519562, 1.597238, 1.439213, 1, 1, 1, 1, 1,
-1.509317, 1.62921, -1.122039, 1, 1, 1, 1, 1,
-1.489628, -1.983972, -1.966111, 1, 1, 1, 1, 1,
-1.476192, -0.378852, -2.453094, 1, 1, 1, 1, 1,
-1.470076, 1.271863, -0.441089, 1, 1, 1, 1, 1,
-1.468306, -0.4153671, -2.084265, 1, 1, 1, 1, 1,
-1.453005, 0.8281826, -0.4632901, 1, 1, 1, 1, 1,
-1.441171, -0.01360801, -1.920308, 1, 1, 1, 1, 1,
-1.439179, 0.4862044, -1.128051, 1, 1, 1, 1, 1,
-1.436983, -1.288944, -2.157434, 1, 1, 1, 1, 1,
-1.435987, -0.7298957, -2.585646, 1, 1, 1, 1, 1,
-1.433108, 0.0768834, -0.77398, 1, 1, 1, 1, 1,
-1.431416, -2.946182, -2.820851, 1, 1, 1, 1, 1,
-1.429736, 1.60765, -0.8525687, 1, 1, 1, 1, 1,
-1.418949, 0.01668493, -1.871415, 1, 1, 1, 1, 1,
-1.409394, -0.6506684, -3.160449, 0, 0, 1, 1, 1,
-1.390325, 0.5193502, -1.737211, 1, 0, 0, 1, 1,
-1.387019, 0.8901398, -1.53366, 1, 0, 0, 1, 1,
-1.384013, -0.9289302, -1.518236, 1, 0, 0, 1, 1,
-1.372378, 1.708927, -0.268188, 1, 0, 0, 1, 1,
-1.365068, 1.031044, -0.4503387, 1, 0, 0, 1, 1,
-1.355618, 1.220119, 0.0752657, 0, 0, 0, 1, 1,
-1.350433, -0.003626119, -1.130358, 0, 0, 0, 1, 1,
-1.335229, -1.283649, -1.469901, 0, 0, 0, 1, 1,
-1.322788, 0.5887566, -1.237674, 0, 0, 0, 1, 1,
-1.321451, -0.6329819, -1.941199, 0, 0, 0, 1, 1,
-1.32064, 0.02331345, -0.8405964, 0, 0, 0, 1, 1,
-1.312203, 0.4504555, -1.447007, 0, 0, 0, 1, 1,
-1.310244, 0.1733407, -3.164134, 1, 1, 1, 1, 1,
-1.299927, -0.007373675, -1.484873, 1, 1, 1, 1, 1,
-1.297579, -0.3584413, -3.820208, 1, 1, 1, 1, 1,
-1.296719, 1.191885, -1.508757, 1, 1, 1, 1, 1,
-1.284842, 0.9287969, 0.1064024, 1, 1, 1, 1, 1,
-1.283274, -1.646367, -4.26885, 1, 1, 1, 1, 1,
-1.282477, -2.139492, -2.448606, 1, 1, 1, 1, 1,
-1.281173, 0.4213311, -1.494821, 1, 1, 1, 1, 1,
-1.261875, -0.1312199, -2.50503, 1, 1, 1, 1, 1,
-1.253002, 0.2373147, -2.463684, 1, 1, 1, 1, 1,
-1.250626, -0.7141551, -1.968035, 1, 1, 1, 1, 1,
-1.24771, 2.142183, -0.1208554, 1, 1, 1, 1, 1,
-1.24604, -0.2745951, -0.6320175, 1, 1, 1, 1, 1,
-1.244336, 0.7433899, -0.3654805, 1, 1, 1, 1, 1,
-1.243682, 0.06226934, -1.108491, 1, 1, 1, 1, 1,
-1.238537, 0.1589163, -1.020732, 0, 0, 1, 1, 1,
-1.235942, 1.786639, -2.531817, 1, 0, 0, 1, 1,
-1.230345, -0.1540869, -1.40146, 1, 0, 0, 1, 1,
-1.227287, 0.179215, -1.383867, 1, 0, 0, 1, 1,
-1.226283, 0.4041034, -0.7951302, 1, 0, 0, 1, 1,
-1.224237, 1.566618, -0.8304827, 1, 0, 0, 1, 1,
-1.218678, -1.083339, -3.928185, 0, 0, 0, 1, 1,
-1.217725, 0.7417307, 0.331347, 0, 0, 0, 1, 1,
-1.215991, -1.254646, -2.012238, 0, 0, 0, 1, 1,
-1.214438, 0.123844, -0.770781, 0, 0, 0, 1, 1,
-1.211772, -1.858781, -1.764271, 0, 0, 0, 1, 1,
-1.207021, -0.5521869, -2.898649, 0, 0, 0, 1, 1,
-1.203357, -2.601521, -2.162266, 0, 0, 0, 1, 1,
-1.200514, 1.413714, -1.494289, 1, 1, 1, 1, 1,
-1.197366, 0.5336275, -1.877884, 1, 1, 1, 1, 1,
-1.192171, -0.3011047, -2.939391, 1, 1, 1, 1, 1,
-1.190161, -0.7779669, -1.867135, 1, 1, 1, 1, 1,
-1.170066, -2.316678, -2.896799, 1, 1, 1, 1, 1,
-1.167209, -1.199605, -2.238125, 1, 1, 1, 1, 1,
-1.156269, -0.04529335, -0.4271147, 1, 1, 1, 1, 1,
-1.145934, -0.4939823, -1.533062, 1, 1, 1, 1, 1,
-1.143366, -1.366929, -1.403057, 1, 1, 1, 1, 1,
-1.142317, -0.5029945, -1.456401, 1, 1, 1, 1, 1,
-1.1375, -0.543137, -1.591478, 1, 1, 1, 1, 1,
-1.136938, -0.1340447, -2.271927, 1, 1, 1, 1, 1,
-1.127316, 0.7398476, -1.085477, 1, 1, 1, 1, 1,
-1.125521, -1.433515, -3.458153, 1, 1, 1, 1, 1,
-1.107759, -2.971891, -1.7835, 1, 1, 1, 1, 1,
-1.094363, 0.2948385, -1.145628, 0, 0, 1, 1, 1,
-1.091822, -0.7393523, -3.15669, 1, 0, 0, 1, 1,
-1.087725, 0.7206286, 0.9466215, 1, 0, 0, 1, 1,
-1.076533, 0.3700268, -0.9564345, 1, 0, 0, 1, 1,
-1.07167, 0.448948, -0.9630043, 1, 0, 0, 1, 1,
-1.071603, -0.5150232, -2.643936, 1, 0, 0, 1, 1,
-1.071549, -0.06957737, -1.904093, 0, 0, 0, 1, 1,
-1.063729, -0.3338327, -2.643499, 0, 0, 0, 1, 1,
-1.058897, -1.768031, -2.271345, 0, 0, 0, 1, 1,
-1.053946, 0.4553589, -1.096283, 0, 0, 0, 1, 1,
-1.051281, 1.116477, 1.05186, 0, 0, 0, 1, 1,
-1.051256, -1.771111, -3.522042, 0, 0, 0, 1, 1,
-1.050828, 1.69777, 0.435186, 0, 0, 0, 1, 1,
-1.048577, -1.613417, -3.065816, 1, 1, 1, 1, 1,
-1.048147, -2.315899, -3.108732, 1, 1, 1, 1, 1,
-1.044252, -0.2356429, -2.068483, 1, 1, 1, 1, 1,
-1.039377, 1.046791, -0.7607906, 1, 1, 1, 1, 1,
-1.034007, 0.03781818, 1.174556, 1, 1, 1, 1, 1,
-1.032431, 0.8439129, -0.5826468, 1, 1, 1, 1, 1,
-1.032325, -1.339653, -2.070683, 1, 1, 1, 1, 1,
-1.031376, -0.952289, -1.975232, 1, 1, 1, 1, 1,
-1.029453, 0.5613989, -0.7631414, 1, 1, 1, 1, 1,
-1.020968, -0.7264875, -2.509465, 1, 1, 1, 1, 1,
-1.018475, 0.2934518, -3.294597, 1, 1, 1, 1, 1,
-1.016835, -2.046157, -3.600954, 1, 1, 1, 1, 1,
-1.01492, -1.415562, -4.288145, 1, 1, 1, 1, 1,
-1.008512, 0.1183866, -2.125781, 1, 1, 1, 1, 1,
-1.005154, 0.7107757, -1.42458, 1, 1, 1, 1, 1,
-0.9982743, -0.06657367, -1.018438, 0, 0, 1, 1, 1,
-0.9977754, 0.3709827, -1.892501, 1, 0, 0, 1, 1,
-0.9969816, 0.05707587, -0.8127353, 1, 0, 0, 1, 1,
-0.991497, 0.3582587, -1.132122, 1, 0, 0, 1, 1,
-0.9875677, -1.487866, -4.003507, 1, 0, 0, 1, 1,
-0.9855144, -0.4184852, -1.23477, 1, 0, 0, 1, 1,
-0.9691647, -0.1781003, -2.06584, 0, 0, 0, 1, 1,
-0.9675415, -0.1611732, -0.4064507, 0, 0, 0, 1, 1,
-0.9569041, -2.509843, -1.642293, 0, 0, 0, 1, 1,
-0.9562647, -0.2333206, -1.635927, 0, 0, 0, 1, 1,
-0.9451636, -0.2343753, -2.409804, 0, 0, 0, 1, 1,
-0.9369852, -2.05475, -3.47093, 0, 0, 0, 1, 1,
-0.9364062, -1.504872, -3.524633, 0, 0, 0, 1, 1,
-0.926374, 1.907918, -1.463452, 1, 1, 1, 1, 1,
-0.9257971, -0.2991604, 0.5167446, 1, 1, 1, 1, 1,
-0.9254074, 0.2883515, -1.737497, 1, 1, 1, 1, 1,
-0.9203303, 0.6748667, 0.03134254, 1, 1, 1, 1, 1,
-0.9135207, -0.06486927, -2.012697, 1, 1, 1, 1, 1,
-0.9125181, 0.1194299, -0.6730849, 1, 1, 1, 1, 1,
-0.902382, 0.2676929, -0.7124063, 1, 1, 1, 1, 1,
-0.9021422, -0.7173478, -3.82969, 1, 1, 1, 1, 1,
-0.9011577, -1.024377, -2.060679, 1, 1, 1, 1, 1,
-0.9006751, -0.2398243, -0.8961795, 1, 1, 1, 1, 1,
-0.8937176, 0.4399846, -1.42309, 1, 1, 1, 1, 1,
-0.890758, -1.804992, -2.217509, 1, 1, 1, 1, 1,
-0.8891135, -1.03829, -1.626944, 1, 1, 1, 1, 1,
-0.8865584, 0.9921679, -3.308306, 1, 1, 1, 1, 1,
-0.8782209, 0.6562685, -0.4987923, 1, 1, 1, 1, 1,
-0.8740616, 0.1515534, -0.2371189, 0, 0, 1, 1, 1,
-0.8611422, -1.573581, -3.099345, 1, 0, 0, 1, 1,
-0.8549929, 0.7836962, -1.680157, 1, 0, 0, 1, 1,
-0.8508994, 0.6665519, -2.121872, 1, 0, 0, 1, 1,
-0.8496247, 0.4125678, -1.416665, 1, 0, 0, 1, 1,
-0.8475974, -0.8886923, -1.715362, 1, 0, 0, 1, 1,
-0.8462245, -0.5234792, -3.150572, 0, 0, 0, 1, 1,
-0.8409379, -0.5506781, -1.690869, 0, 0, 0, 1, 1,
-0.8393913, 1.410911, 0.3475752, 0, 0, 0, 1, 1,
-0.8393528, 0.03592626, -2.739612, 0, 0, 0, 1, 1,
-0.8362754, -0.01889122, -1.598931, 0, 0, 0, 1, 1,
-0.8273419, -0.09662615, -2.474743, 0, 0, 0, 1, 1,
-0.8272074, 0.07116131, -2.727903, 0, 0, 0, 1, 1,
-0.8236852, 0.5085802, -0.8669674, 1, 1, 1, 1, 1,
-0.8187785, 0.2425341, -2.757423, 1, 1, 1, 1, 1,
-0.8161328, 0.3831131, -1.2371, 1, 1, 1, 1, 1,
-0.8158028, -0.9852376, -2.160376, 1, 1, 1, 1, 1,
-0.8144868, -2.855564, 0.4147644, 1, 1, 1, 1, 1,
-0.8139428, -0.3945364, -2.237756, 1, 1, 1, 1, 1,
-0.8054103, 0.5257779, -0.9427274, 1, 1, 1, 1, 1,
-0.8003958, 0.8368224, -2.001454, 1, 1, 1, 1, 1,
-0.798604, -0.5640078, -2.789325, 1, 1, 1, 1, 1,
-0.7891752, 0.1102309, -1.211659, 1, 1, 1, 1, 1,
-0.7855638, 0.0873881, -2.25579, 1, 1, 1, 1, 1,
-0.7765827, 0.3303665, -2.886035, 1, 1, 1, 1, 1,
-0.7755499, -0.68177, -3.064297, 1, 1, 1, 1, 1,
-0.7741815, -0.2309231, -0.4721905, 1, 1, 1, 1, 1,
-0.76924, -0.9741524, -2.534402, 1, 1, 1, 1, 1,
-0.7677253, 0.3943995, -2.264652, 0, 0, 1, 1, 1,
-0.7659341, -0.359539, -2.223723, 1, 0, 0, 1, 1,
-0.7646315, -0.1572169, -0.5485894, 1, 0, 0, 1, 1,
-0.763368, -1.310371, -3.20108, 1, 0, 0, 1, 1,
-0.7542133, -1.787887, -4.246257, 1, 0, 0, 1, 1,
-0.7521153, 1.194923, 0.7065508, 1, 0, 0, 1, 1,
-0.7499588, 0.6527096, -0.4405896, 0, 0, 0, 1, 1,
-0.7435449, 0.6935911, -0.3786285, 0, 0, 0, 1, 1,
-0.7398086, -0.2405822, -2.118295, 0, 0, 0, 1, 1,
-0.732576, 0.8479438, -1.446049, 0, 0, 0, 1, 1,
-0.731118, 0.7363452, -1.61217, 0, 0, 0, 1, 1,
-0.7164489, 0.7600342, -0.9379468, 0, 0, 0, 1, 1,
-0.7156562, 0.6278774, -0.547071, 0, 0, 0, 1, 1,
-0.7150334, -0.7559868, -2.757418, 1, 1, 1, 1, 1,
-0.7118899, 2.156368, 0.09162088, 1, 1, 1, 1, 1,
-0.7037972, -1.294665, -0.4154844, 1, 1, 1, 1, 1,
-0.6966749, -2.126866, -1.634952, 1, 1, 1, 1, 1,
-0.696311, 0.5639051, 0.2284049, 1, 1, 1, 1, 1,
-0.6945673, -0.2671399, -2.983348, 1, 1, 1, 1, 1,
-0.6917655, 0.4535086, 0.3306101, 1, 1, 1, 1, 1,
-0.6904146, 0.8768927, -0.746101, 1, 1, 1, 1, 1,
-0.6899465, 0.5569128, -0.7538173, 1, 1, 1, 1, 1,
-0.6841326, -0.9993826, -0.2228696, 1, 1, 1, 1, 1,
-0.6808419, 1.84914, -0.715822, 1, 1, 1, 1, 1,
-0.6799035, 1.722562, -1.883025, 1, 1, 1, 1, 1,
-0.6754678, 0.04635961, -0.2324841, 1, 1, 1, 1, 1,
-0.6748597, 0.03290276, -0.5556955, 1, 1, 1, 1, 1,
-0.6745583, -0.03134428, -0.3647917, 1, 1, 1, 1, 1,
-0.6728715, -0.579223, -0.8333347, 0, 0, 1, 1, 1,
-0.6726522, 0.6942817, -1.739342, 1, 0, 0, 1, 1,
-0.6725587, -0.1313371, -1.055277, 1, 0, 0, 1, 1,
-0.6698222, 1.062159, -0.06331161, 1, 0, 0, 1, 1,
-0.6696664, 0.3209639, -3.15309, 1, 0, 0, 1, 1,
-0.6632408, -1.211589, -3.139271, 1, 0, 0, 1, 1,
-0.6538236, -1.169476, -3.923607, 0, 0, 0, 1, 1,
-0.6492108, 0.5780842, 0.5999961, 0, 0, 0, 1, 1,
-0.6491607, 0.9407253, 0.2539886, 0, 0, 0, 1, 1,
-0.6442631, 0.2872663, -0.3695201, 0, 0, 0, 1, 1,
-0.6413364, 0.680409, -0.6846257, 0, 0, 0, 1, 1,
-0.6412752, -0.9939381, -4.809005, 0, 0, 0, 1, 1,
-0.6391499, 0.5835414, -1.988144, 0, 0, 0, 1, 1,
-0.638765, -0.3906739, 0.3120854, 1, 1, 1, 1, 1,
-0.6314191, 0.617579, 0.3123146, 1, 1, 1, 1, 1,
-0.6312857, 0.6094207, -1.552495, 1, 1, 1, 1, 1,
-0.6292397, -1.86872, -3.49042, 1, 1, 1, 1, 1,
-0.626869, -0.447753, -1.160027, 1, 1, 1, 1, 1,
-0.6239767, 0.6383609, -0.7787432, 1, 1, 1, 1, 1,
-0.6224919, 0.877362, -0.6918587, 1, 1, 1, 1, 1,
-0.6157296, 0.293642, -0.3801254, 1, 1, 1, 1, 1,
-0.6133414, 0.8733608, -1.352563, 1, 1, 1, 1, 1,
-0.6058294, 0.04096086, -1.973118, 1, 1, 1, 1, 1,
-0.6053435, 0.380778, -0.008613593, 1, 1, 1, 1, 1,
-0.6028494, 1.560622, -0.4195562, 1, 1, 1, 1, 1,
-0.6027681, -0.1390371, -2.860784, 1, 1, 1, 1, 1,
-0.5920183, 0.8609235, -0.0762817, 1, 1, 1, 1, 1,
-0.5868647, 1.233052, -0.7235451, 1, 1, 1, 1, 1,
-0.5845143, -1.511978, -2.731104, 0, 0, 1, 1, 1,
-0.5773838, 1.480667, -1.020132, 1, 0, 0, 1, 1,
-0.5769846, -0.9765269, -0.7545168, 1, 0, 0, 1, 1,
-0.5728765, 0.07817372, -1.534366, 1, 0, 0, 1, 1,
-0.571949, -0.3242968, -1.310917, 1, 0, 0, 1, 1,
-0.5641229, -1.590309, -2.434348, 1, 0, 0, 1, 1,
-0.5633906, 0.6813546, -1.19574, 0, 0, 0, 1, 1,
-0.5603666, 1.184816, -0.8942143, 0, 0, 0, 1, 1,
-0.5582706, -1.128739, -2.269699, 0, 0, 0, 1, 1,
-0.5581965, 1.24188, -1.286077, 0, 0, 0, 1, 1,
-0.5581858, 0.2730861, -2.597572, 0, 0, 0, 1, 1,
-0.5475058, 1.141252, 2.565984, 0, 0, 0, 1, 1,
-0.5465069, -1.700566, -2.691148, 0, 0, 0, 1, 1,
-0.5392931, 1.105809, -0.305088, 1, 1, 1, 1, 1,
-0.5372635, -0.1833837, -2.35375, 1, 1, 1, 1, 1,
-0.5361342, 0.03312324, -0.8187533, 1, 1, 1, 1, 1,
-0.5315598, -1.9771, -2.897718, 1, 1, 1, 1, 1,
-0.5313017, 0.305708, -1.957166, 1, 1, 1, 1, 1,
-0.5273526, 1.079004, 0.04189949, 1, 1, 1, 1, 1,
-0.5229919, -0.6075651, -2.134861, 1, 1, 1, 1, 1,
-0.5219576, -0.6347163, -2.381363, 1, 1, 1, 1, 1,
-0.5201454, -1.232389, -1.943231, 1, 1, 1, 1, 1,
-0.5145867, 0.2919107, 0.1316064, 1, 1, 1, 1, 1,
-0.5130828, 0.5076987, -0.7382672, 1, 1, 1, 1, 1,
-0.5123795, 0.2877275, -2.804225, 1, 1, 1, 1, 1,
-0.512367, 0.3775677, -2.205181, 1, 1, 1, 1, 1,
-0.5119292, -1.331552, -3.813977, 1, 1, 1, 1, 1,
-0.5110471, -0.1262922, -1.191058, 1, 1, 1, 1, 1,
-0.5067512, -2.046257, -2.706846, 0, 0, 1, 1, 1,
-0.5052548, -0.5172554, -2.293597, 1, 0, 0, 1, 1,
-0.5038831, -0.8893812, -2.06923, 1, 0, 0, 1, 1,
-0.50281, -0.04292443, -1.666891, 1, 0, 0, 1, 1,
-0.5021104, 0.4299816, -2.755585, 1, 0, 0, 1, 1,
-0.5010601, 0.188533, -0.8530216, 1, 0, 0, 1, 1,
-0.5004433, -0.9538767, -1.314937, 0, 0, 0, 1, 1,
-0.500384, 1.98174, -1.027397, 0, 0, 0, 1, 1,
-0.4926189, 0.4981385, -0.09686276, 0, 0, 0, 1, 1,
-0.4917133, -0.5333227, -2.508937, 0, 0, 0, 1, 1,
-0.4903948, -0.3958004, -3.492145, 0, 0, 0, 1, 1,
-0.4901702, -0.6999334, -2.677525, 0, 0, 0, 1, 1,
-0.4837705, 1.850329, 0.4681345, 0, 0, 0, 1, 1,
-0.4830751, -0.0971264, -1.438568, 1, 1, 1, 1, 1,
-0.4795357, 0.7636315, 0.03711861, 1, 1, 1, 1, 1,
-0.4703595, 2.45796, 0.1262604, 1, 1, 1, 1, 1,
-0.467742, 1.236718, 1.060395, 1, 1, 1, 1, 1,
-0.4657396, 0.02153731, -0.9993163, 1, 1, 1, 1, 1,
-0.4612347, -1.652313, -2.121079, 1, 1, 1, 1, 1,
-0.4607154, -0.635074, -2.997997, 1, 1, 1, 1, 1,
-0.4602719, -0.3718948, -3.065966, 1, 1, 1, 1, 1,
-0.4589342, 0.6935902, 0.5852334, 1, 1, 1, 1, 1,
-0.4545534, -0.741965, -2.677104, 1, 1, 1, 1, 1,
-0.4520488, -1.240721, -2.863035, 1, 1, 1, 1, 1,
-0.4518048, -0.5590288, -2.591677, 1, 1, 1, 1, 1,
-0.4503573, 1.331174, 0.1942619, 1, 1, 1, 1, 1,
-0.449486, -0.3648058, -2.751316, 1, 1, 1, 1, 1,
-0.4489241, -0.3139999, -2.009088, 1, 1, 1, 1, 1,
-0.4484825, 0.01270177, -0.6618813, 0, 0, 1, 1, 1,
-0.448465, 0.5658463, 1.211354, 1, 0, 0, 1, 1,
-0.4412816, 0.5934399, -1.490362, 1, 0, 0, 1, 1,
-0.4388072, 0.5101308, -1.329132, 1, 0, 0, 1, 1,
-0.4313538, -0.4754045, -0.8032399, 1, 0, 0, 1, 1,
-0.4286024, -0.4536438, -2.63184, 1, 0, 0, 1, 1,
-0.4232195, -0.01391898, -0.6331046, 0, 0, 0, 1, 1,
-0.4129516, 1.548497, -0.9365505, 0, 0, 0, 1, 1,
-0.4114351, -0.4721107, -2.513722, 0, 0, 0, 1, 1,
-0.4054988, 1.129437, -0.1846389, 0, 0, 0, 1, 1,
-0.4049042, -0.4320154, -1.087322, 0, 0, 0, 1, 1,
-0.4038306, 0.8416668, -0.7165269, 0, 0, 0, 1, 1,
-0.3969204, 0.2284335, -0.2919739, 0, 0, 0, 1, 1,
-0.3950346, 0.6500783, -2.007952, 1, 1, 1, 1, 1,
-0.3912725, 0.4664166, 1.126032, 1, 1, 1, 1, 1,
-0.3832556, 1.946254, -1.152644, 1, 1, 1, 1, 1,
-0.3829859, -0.8880358, -2.512192, 1, 1, 1, 1, 1,
-0.3796663, 0.458237, -0.4924411, 1, 1, 1, 1, 1,
-0.3781432, 0.02564106, -3.65464, 1, 1, 1, 1, 1,
-0.3766616, 1.628348, -0.630021, 1, 1, 1, 1, 1,
-0.3743222, 0.8276482, -0.3655427, 1, 1, 1, 1, 1,
-0.3709221, 0.8914175, -1.549917, 1, 1, 1, 1, 1,
-0.3704982, -0.7642511, -2.698463, 1, 1, 1, 1, 1,
-0.3688476, -2.301799, -2.837363, 1, 1, 1, 1, 1,
-0.3584558, 1.165002, 0.1256606, 1, 1, 1, 1, 1,
-0.3573516, -0.9058666, -2.395906, 1, 1, 1, 1, 1,
-0.3573318, 0.5685904, -0.8962334, 1, 1, 1, 1, 1,
-0.3556473, -1.043952, -2.997893, 1, 1, 1, 1, 1,
-0.3547789, -0.780363, -2.477411, 0, 0, 1, 1, 1,
-0.3543272, -0.4610395, -1.994966, 1, 0, 0, 1, 1,
-0.3531977, 1.426841, -0.2098496, 1, 0, 0, 1, 1,
-0.3501905, 0.3545335, -1.173768, 1, 0, 0, 1, 1,
-0.3477721, 0.4606561, -0.5433328, 1, 0, 0, 1, 1,
-0.346559, 1.500262, -1.581733, 1, 0, 0, 1, 1,
-0.3422422, 1.845833, 1.148711, 0, 0, 0, 1, 1,
-0.3344395, -0.8367866, -3.33822, 0, 0, 0, 1, 1,
-0.3323067, -0.181503, -1.948006, 0, 0, 0, 1, 1,
-0.3313153, -1.298366, -1.823408, 0, 0, 0, 1, 1,
-0.3272281, -0.5167562, -3.509254, 0, 0, 0, 1, 1,
-0.3217258, -0.3922288, -4.144877, 0, 0, 0, 1, 1,
-0.3202613, 0.8291708, -0.3495857, 0, 0, 0, 1, 1,
-0.3165846, 1.510483, -0.05330325, 1, 1, 1, 1, 1,
-0.3163584, 0.09965632, -1.821952, 1, 1, 1, 1, 1,
-0.3132261, -0.6286602, -4.801271, 1, 1, 1, 1, 1,
-0.3114267, 1.424176, -0.2282231, 1, 1, 1, 1, 1,
-0.3100205, -1.305154, -0.7957261, 1, 1, 1, 1, 1,
-0.3095332, -0.1345586, -1.882564, 1, 1, 1, 1, 1,
-0.3085262, -0.05699159, -2.057726, 1, 1, 1, 1, 1,
-0.3071997, 0.4031123, -1.211697, 1, 1, 1, 1, 1,
-0.3001093, -0.8055695, -3.026848, 1, 1, 1, 1, 1,
-0.2993242, -0.4591706, -3.993096, 1, 1, 1, 1, 1,
-0.2975695, -0.5013177, -2.900203, 1, 1, 1, 1, 1,
-0.296375, 0.9910896, 0.2932014, 1, 1, 1, 1, 1,
-0.295652, 0.2830439, 0.130071, 1, 1, 1, 1, 1,
-0.292156, 0.184603, -1.09822, 1, 1, 1, 1, 1,
-0.2891243, -1.562332, -2.617918, 1, 1, 1, 1, 1,
-0.288969, 0.6387063, -1.152498, 0, 0, 1, 1, 1,
-0.2854959, -0.3481267, -2.702351, 1, 0, 0, 1, 1,
-0.2853472, -0.1745146, -2.40313, 1, 0, 0, 1, 1,
-0.2840113, -1.402389, -4.096837, 1, 0, 0, 1, 1,
-0.2762644, -1.378399, -1.728843, 1, 0, 0, 1, 1,
-0.2639616, 1.182564, -2.204616, 1, 0, 0, 1, 1,
-0.2627564, -0.2731388, -2.842607, 0, 0, 0, 1, 1,
-0.2623514, -0.8755797, -2.429105, 0, 0, 0, 1, 1,
-0.2565116, -1.674029, -3.907438, 0, 0, 0, 1, 1,
-0.2512703, -1.441905, -3.479625, 0, 0, 0, 1, 1,
-0.2500914, -0.191211, -1.896138, 0, 0, 0, 1, 1,
-0.249835, 0.2246504, -1.854403, 0, 0, 0, 1, 1,
-0.2472926, -1.727305, -3.085613, 0, 0, 0, 1, 1,
-0.2445971, -2.159407, -2.628515, 1, 1, 1, 1, 1,
-0.2379406, -0.04566405, -1.160738, 1, 1, 1, 1, 1,
-0.2272362, 0.07482467, -1.332463, 1, 1, 1, 1, 1,
-0.2245673, -2.190837, -0.9645057, 1, 1, 1, 1, 1,
-0.2178422, 0.6283002, 0.7964119, 1, 1, 1, 1, 1,
-0.2148221, 0.03327091, -0.3913158, 1, 1, 1, 1, 1,
-0.2146728, -1.04442, -2.584467, 1, 1, 1, 1, 1,
-0.2059788, 0.5213603, -0.5954341, 1, 1, 1, 1, 1,
-0.2054471, 1.922182, -1.094026, 1, 1, 1, 1, 1,
-0.2048339, 0.5503381, 0.7944455, 1, 1, 1, 1, 1,
-0.2014116, 1.062497, 0.5751595, 1, 1, 1, 1, 1,
-0.1996386, 0.8682123, -0.6371431, 1, 1, 1, 1, 1,
-0.1843725, 1.224775, -0.02502314, 1, 1, 1, 1, 1,
-0.1833164, -0.4811399, -2.908957, 1, 1, 1, 1, 1,
-0.1812705, -0.8563519, -2.443712, 1, 1, 1, 1, 1,
-0.180764, -1.801381, -2.670302, 0, 0, 1, 1, 1,
-0.177677, 0.7043703, -0.2144466, 1, 0, 0, 1, 1,
-0.1733948, -1.630058, -4.115973, 1, 0, 0, 1, 1,
-0.1685432, -1.269131, -3.50272, 1, 0, 0, 1, 1,
-0.1684582, 1.286605, 1.233688, 1, 0, 0, 1, 1,
-0.1677433, -1.725518, -3.435346, 1, 0, 0, 1, 1,
-0.1674021, 1.363856, -0.7296556, 0, 0, 0, 1, 1,
-0.1638961, -0.6088172, -3.68354, 0, 0, 0, 1, 1,
-0.1594478, 0.4536786, -0.8787741, 0, 0, 0, 1, 1,
-0.1576233, 0.0632677, -2.479587, 0, 0, 0, 1, 1,
-0.1572648, -0.3631527, -2.233328, 0, 0, 0, 1, 1,
-0.1564515, 0.1510764, 0.6170958, 0, 0, 0, 1, 1,
-0.1534051, 0.7339231, -1.400495, 0, 0, 0, 1, 1,
-0.1523537, 0.4296261, 0.2813987, 1, 1, 1, 1, 1,
-0.1482192, -1.003153, -3.521847, 1, 1, 1, 1, 1,
-0.1481866, -0.1325799, -4.641429, 1, 1, 1, 1, 1,
-0.1462325, -0.03019473, -2.360511, 1, 1, 1, 1, 1,
-0.1461939, 0.2885744, 0.3118909, 1, 1, 1, 1, 1,
-0.1454649, 0.4259591, -0.8630517, 1, 1, 1, 1, 1,
-0.143622, -0.2142092, -1.405146, 1, 1, 1, 1, 1,
-0.1429736, -1.391346, -3.731852, 1, 1, 1, 1, 1,
-0.1416535, 1.200335, 0.3426352, 1, 1, 1, 1, 1,
-0.1375702, 0.1566652, -0.489758, 1, 1, 1, 1, 1,
-0.1370681, 2.981522, -0.1822637, 1, 1, 1, 1, 1,
-0.1362325, -1.747442, -3.093949, 1, 1, 1, 1, 1,
-0.1336613, 0.9831177, 0.3751049, 1, 1, 1, 1, 1,
-0.1311766, 2.193317, -1.621829, 1, 1, 1, 1, 1,
-0.1287945, 0.3628364, -0.03863672, 1, 1, 1, 1, 1,
-0.1274945, 0.7378113, -0.07628077, 0, 0, 1, 1, 1,
-0.124489, -0.3956219, -3.550905, 1, 0, 0, 1, 1,
-0.1243118, -0.1399056, -1.42473, 1, 0, 0, 1, 1,
-0.1207481, 1.621954, 0.4309793, 1, 0, 0, 1, 1,
-0.1203172, -0.3038529, -1.549944, 1, 0, 0, 1, 1,
-0.119394, -0.9950234, -4.257911, 1, 0, 0, 1, 1,
-0.115566, 0.2909423, 0.5889776, 0, 0, 0, 1, 1,
-0.115081, -0.6310341, -2.068408, 0, 0, 0, 1, 1,
-0.1071107, -0.448406, -3.370418, 0, 0, 0, 1, 1,
-0.1070249, -0.728909, -3.836177, 0, 0, 0, 1, 1,
-0.1069186, -0.2909731, -4.142797, 0, 0, 0, 1, 1,
-0.1022558, 0.876408, -1.006078, 0, 0, 0, 1, 1,
-0.1000564, -0.8822858, -1.94114, 0, 0, 0, 1, 1,
-0.09604941, -0.7927499, -5.016013, 1, 1, 1, 1, 1,
-0.09343182, 0.0293143, -1.714242, 1, 1, 1, 1, 1,
-0.09225427, -1.4306, -3.187187, 1, 1, 1, 1, 1,
-0.08818436, 1.098446, 1.568205, 1, 1, 1, 1, 1,
-0.08312593, 1.302845, -0.3811561, 1, 1, 1, 1, 1,
-0.06824122, 1.261135, 2.104186, 1, 1, 1, 1, 1,
-0.06696786, -0.4167535, -3.740997, 1, 1, 1, 1, 1,
-0.06321078, 0.4608859, -2.316379, 1, 1, 1, 1, 1,
-0.06293197, 1.063873, 0.07018331, 1, 1, 1, 1, 1,
-0.05955028, 0.8045895, -0.5296663, 1, 1, 1, 1, 1,
-0.05558924, -0.02049973, -2.461012, 1, 1, 1, 1, 1,
-0.05349422, -0.04238996, -3.411592, 1, 1, 1, 1, 1,
-0.05080629, 1.322467, 0.2539558, 1, 1, 1, 1, 1,
-0.04850112, -1.977715, -1.791497, 1, 1, 1, 1, 1,
-0.04314336, -0.4328739, -1.903575, 1, 1, 1, 1, 1,
-0.03935609, 0.7295417, -0.3840628, 0, 0, 1, 1, 1,
-0.0391841, 0.3441364, -0.09142172, 1, 0, 0, 1, 1,
-0.03759521, -0.7744005, -3.533023, 1, 0, 0, 1, 1,
-0.03637025, -0.3941039, -2.463625, 1, 0, 0, 1, 1,
-0.0362942, -0.9138063, -1.789277, 1, 0, 0, 1, 1,
-0.03556214, -1.161649, -4.036427, 1, 0, 0, 1, 1,
-0.03513093, 0.4523071, -0.285056, 0, 0, 0, 1, 1,
-0.03502417, -0.04137519, -1.034193, 0, 0, 0, 1, 1,
-0.03328874, -0.162835, -4.764765, 0, 0, 0, 1, 1,
-0.02781781, 0.3297934, -1.224517, 0, 0, 0, 1, 1,
-0.02395516, -0.6341872, -2.550005, 0, 0, 0, 1, 1,
-0.02222882, 1.311375, -0.4444357, 0, 0, 0, 1, 1,
-0.01535389, 1.557823, 0.5098758, 0, 0, 0, 1, 1,
-0.01520715, -1.857786, -2.199889, 1, 1, 1, 1, 1,
-0.01252696, -0.1296285, -3.192756, 1, 1, 1, 1, 1,
-0.008291709, -0.1010905, -2.874129, 1, 1, 1, 1, 1,
-0.007663476, -0.5106109, -3.793603, 1, 1, 1, 1, 1,
-0.006766257, 1.727752, 0.2460474, 1, 1, 1, 1, 1,
-0.004374833, -0.7585655, -3.476137, 1, 1, 1, 1, 1,
-0.003811321, 1.143354, -1.024729, 1, 1, 1, 1, 1,
-0.002316368, 1.446295, -1.701443, 1, 1, 1, 1, 1,
-0.0021617, -0.09753377, -1.980318, 1, 1, 1, 1, 1,
-0.0003639892, -0.1882315, -3.134693, 1, 1, 1, 1, 1,
0.005696576, 0.1124552, 0.2131176, 1, 1, 1, 1, 1,
0.00583384, -0.2936175, 3.392165, 1, 1, 1, 1, 1,
0.00608632, 0.7170596, -0.3646115, 1, 1, 1, 1, 1,
0.007083723, 0.3662515, -0.3333662, 1, 1, 1, 1, 1,
0.008842506, 0.6184136, -1.081048, 1, 1, 1, 1, 1,
0.009260723, 1.179168, 0.3137834, 0, 0, 1, 1, 1,
0.0127152, 1.111063, -0.6300157, 1, 0, 0, 1, 1,
0.0156816, -0.4994616, 1.449806, 1, 0, 0, 1, 1,
0.01609022, 0.9917062, -0.3461803, 1, 0, 0, 1, 1,
0.01744291, -0.3928779, 1.875954, 1, 0, 0, 1, 1,
0.02612216, -1.519932, 3.373264, 1, 0, 0, 1, 1,
0.03201396, -0.6224967, 3.491118, 0, 0, 0, 1, 1,
0.04272164, 0.09363247, -1.06223, 0, 0, 0, 1, 1,
0.04796816, -0.1170241, 4.974417, 0, 0, 0, 1, 1,
0.04836887, 0.5171035, 0.4856227, 0, 0, 0, 1, 1,
0.05063923, 1.479362, 1.798888, 0, 0, 0, 1, 1,
0.0529071, 1.739333, -0.6934634, 0, 0, 0, 1, 1,
0.05577967, 0.978754, 1.190567, 0, 0, 0, 1, 1,
0.05641492, 0.4849032, -1.136895, 1, 1, 1, 1, 1,
0.05874539, -0.3068445, 3.176342, 1, 1, 1, 1, 1,
0.06087778, -0.03356575, 2.465735, 1, 1, 1, 1, 1,
0.06123865, -0.2481708, 1.351855, 1, 1, 1, 1, 1,
0.06630927, 0.03962592, 1.495575, 1, 1, 1, 1, 1,
0.06648557, 1.494443, 0.1632678, 1, 1, 1, 1, 1,
0.0698728, 1.026122, -0.3751091, 1, 1, 1, 1, 1,
0.07079364, 0.2085244, -0.4736995, 1, 1, 1, 1, 1,
0.07253647, -1.889484, 2.44894, 1, 1, 1, 1, 1,
0.07315542, -1.394164, 3.535208, 1, 1, 1, 1, 1,
0.07597215, 0.01477246, 0.8600628, 1, 1, 1, 1, 1,
0.07673804, 1.546965, 0.2929979, 1, 1, 1, 1, 1,
0.07698288, -1.159383, 3.236806, 1, 1, 1, 1, 1,
0.07709171, -1.443298, 3.647071, 1, 1, 1, 1, 1,
0.08148529, -0.6804769, 2.065224, 1, 1, 1, 1, 1,
0.09143855, -1.264776, 3.929069, 0, 0, 1, 1, 1,
0.09424488, 0.5002241, -1.249882, 1, 0, 0, 1, 1,
0.09472098, 0.7990363, 0.8569152, 1, 0, 0, 1, 1,
0.09704071, -1.049691, 4.092988, 1, 0, 0, 1, 1,
0.09771662, -1.129286, 1.396271, 1, 0, 0, 1, 1,
0.09792504, 1.114643, 0.5718209, 1, 0, 0, 1, 1,
0.1042374, -0.2644033, 2.247056, 0, 0, 0, 1, 1,
0.1042556, -0.04302296, 1.529965, 0, 0, 0, 1, 1,
0.1083544, 0.3840347, 0.4244477, 0, 0, 0, 1, 1,
0.1112417, -0.8188859, 1.190928, 0, 0, 0, 1, 1,
0.1118805, -1.706002, 1.915381, 0, 0, 0, 1, 1,
0.1120126, -0.29272, 3.875144, 0, 0, 0, 1, 1,
0.1137769, -0.6209444, 3.265237, 0, 0, 0, 1, 1,
0.1160608, 0.4480095, -0.3996455, 1, 1, 1, 1, 1,
0.1194859, -1.310095, 1.105735, 1, 1, 1, 1, 1,
0.1242985, -1.909799, 2.375987, 1, 1, 1, 1, 1,
0.1273753, -0.3658251, 2.33139, 1, 1, 1, 1, 1,
0.1289808, -0.789438, 3.398195, 1, 1, 1, 1, 1,
0.1365903, -0.2364783, 3.255183, 1, 1, 1, 1, 1,
0.1384373, 0.9819801, 0.5608428, 1, 1, 1, 1, 1,
0.1427744, -1.090141, 2.960547, 1, 1, 1, 1, 1,
0.1481082, 0.1342606, 1.803603, 1, 1, 1, 1, 1,
0.1504816, 1.527169, 0.4906237, 1, 1, 1, 1, 1,
0.1548922, -0.6693029, 3.351452, 1, 1, 1, 1, 1,
0.1575503, -0.07598554, 1.898242, 1, 1, 1, 1, 1,
0.1580191, 1.91569, 1.058643, 1, 1, 1, 1, 1,
0.1590559, -1.325683, 2.642266, 1, 1, 1, 1, 1,
0.1615369, 0.9466239, -0.9725261, 1, 1, 1, 1, 1,
0.1689877, -0.0988532, 1.171837, 0, 0, 1, 1, 1,
0.1720443, -0.6673793, 4.999491, 1, 0, 0, 1, 1,
0.1738159, 1.909757, 0.6565844, 1, 0, 0, 1, 1,
0.17647, 0.5099568, -1.801552, 1, 0, 0, 1, 1,
0.1816368, 2.632412, -0.7239738, 1, 0, 0, 1, 1,
0.1826551, 1.878756, 1.999537, 1, 0, 0, 1, 1,
0.1866075, 0.7990025, 0.4160475, 0, 0, 0, 1, 1,
0.1885754, 1.354775, -0.5943239, 0, 0, 0, 1, 1,
0.1896245, 0.8512772, 1.76259, 0, 0, 0, 1, 1,
0.1923516, -0.989568, 3.497577, 0, 0, 0, 1, 1,
0.2015706, 0.4617949, 0.569903, 0, 0, 0, 1, 1,
0.2048845, -0.9856964, 3.409357, 0, 0, 0, 1, 1,
0.2061547, -0.05934689, 1.909443, 0, 0, 0, 1, 1,
0.2065362, 1.580758, -0.06276343, 1, 1, 1, 1, 1,
0.2075043, -0.4813699, 3.510065, 1, 1, 1, 1, 1,
0.2076106, 1.775944, 0.4786233, 1, 1, 1, 1, 1,
0.2082511, 1.700555, -0.856258, 1, 1, 1, 1, 1,
0.2137191, 1.633836, -0.05304974, 1, 1, 1, 1, 1,
0.2213287, 0.08698282, 0.729103, 1, 1, 1, 1, 1,
0.2281606, 0.9814202, -0.6175966, 1, 1, 1, 1, 1,
0.2287927, -1.228483, 4.327524, 1, 1, 1, 1, 1,
0.2294664, 0.08113307, 1.579032, 1, 1, 1, 1, 1,
0.2311518, -0.02277624, 0.9051198, 1, 1, 1, 1, 1,
0.2326453, -0.2503019, 3.269852, 1, 1, 1, 1, 1,
0.2332135, 0.1680975, 1.913806, 1, 1, 1, 1, 1,
0.2346737, -1.035923, 3.382121, 1, 1, 1, 1, 1,
0.2360167, -1.843608, 3.562752, 1, 1, 1, 1, 1,
0.2380391, 0.4749163, 0.4188936, 1, 1, 1, 1, 1,
0.246025, 0.218005, 1.306601, 0, 0, 1, 1, 1,
0.2461827, 0.4356287, 0.5813697, 1, 0, 0, 1, 1,
0.2496651, 0.09417925, 0.09460535, 1, 0, 0, 1, 1,
0.2523665, -0.4478159, 2.949189, 1, 0, 0, 1, 1,
0.2536115, 1.448802, 0.02396382, 1, 0, 0, 1, 1,
0.2545463, 1.109732, 0.06284303, 1, 0, 0, 1, 1,
0.2583344, 1.021309, -0.5462182, 0, 0, 0, 1, 1,
0.2616394, -0.9396279, 4.648938, 0, 0, 0, 1, 1,
0.2629893, 1.842267, -1.575288, 0, 0, 0, 1, 1,
0.2639205, 0.8750952, 1.226795, 0, 0, 0, 1, 1,
0.2641415, 1.545892, 1.275599, 0, 0, 0, 1, 1,
0.2645935, -0.9529305, 3.608865, 0, 0, 0, 1, 1,
0.2682572, -1.064171, 2.853543, 0, 0, 0, 1, 1,
0.2696927, -0.0939524, 2.721753, 1, 1, 1, 1, 1,
0.2710899, 0.5572832, -0.9348708, 1, 1, 1, 1, 1,
0.272134, 0.687885, 0.7258825, 1, 1, 1, 1, 1,
0.2735208, 0.0353533, 1.863096, 1, 1, 1, 1, 1,
0.2784149, -0.5681065, 1.217959, 1, 1, 1, 1, 1,
0.2794786, 1.163016, 1.671537, 1, 1, 1, 1, 1,
0.2831479, 2.383988, -1.096435, 1, 1, 1, 1, 1,
0.2837361, 1.508407, 0.7573215, 1, 1, 1, 1, 1,
0.2870255, 1.339709, 0.838504, 1, 1, 1, 1, 1,
0.287129, 0.1659902, 0.5662633, 1, 1, 1, 1, 1,
0.2881322, -0.485231, 2.824905, 1, 1, 1, 1, 1,
0.2885906, -0.721112, 2.732177, 1, 1, 1, 1, 1,
0.2960057, -0.8135582, 1.745798, 1, 1, 1, 1, 1,
0.2982488, -0.04837056, 1.638893, 1, 1, 1, 1, 1,
0.3006376, 0.6057492, 0.3231973, 1, 1, 1, 1, 1,
0.3008433, -0.9006005, 3.302717, 0, 0, 1, 1, 1,
0.305371, 1.313126, -0.371794, 1, 0, 0, 1, 1,
0.3065588, 2.040267, -0.2519285, 1, 0, 0, 1, 1,
0.3080102, -1.034423, 1.837573, 1, 0, 0, 1, 1,
0.3096533, -0.3686775, 5.147636, 1, 0, 0, 1, 1,
0.3100384, -0.002478388, -0.1708865, 1, 0, 0, 1, 1,
0.3100404, -0.1171092, 3.609462, 0, 0, 0, 1, 1,
0.3163635, 2.404964, 1.110837, 0, 0, 0, 1, 1,
0.3195004, -1.076615, 1.199836, 0, 0, 0, 1, 1,
0.3196869, -0.3657803, 1.790067, 0, 0, 0, 1, 1,
0.3202327, -0.6429613, 4.520576, 0, 0, 0, 1, 1,
0.321212, -0.140758, 1.77768, 0, 0, 0, 1, 1,
0.3223389, 0.530612, 1.587337, 0, 0, 0, 1, 1,
0.3241158, 1.158131, -0.1186153, 1, 1, 1, 1, 1,
0.3284141, 1.734517, 1.461801, 1, 1, 1, 1, 1,
0.3301116, -0.3853047, 2.490929, 1, 1, 1, 1, 1,
0.3302689, 0.1489252, 0.0426357, 1, 1, 1, 1, 1,
0.3364829, 0.6458199, -0.5303476, 1, 1, 1, 1, 1,
0.3380686, -0.2713357, 2.77198, 1, 1, 1, 1, 1,
0.3462338, -0.3569526, 1.531504, 1, 1, 1, 1, 1,
0.3502742, 0.5223237, 0.77209, 1, 1, 1, 1, 1,
0.3517929, -0.6763159, 1.409912, 1, 1, 1, 1, 1,
0.3522768, 1.071884, 1.340815, 1, 1, 1, 1, 1,
0.3542508, 0.4174242, 0.6391243, 1, 1, 1, 1, 1,
0.358155, -0.8787842, 3.639062, 1, 1, 1, 1, 1,
0.359802, -0.01346891, 1.486119, 1, 1, 1, 1, 1,
0.361419, -0.3870929, 2.390598, 1, 1, 1, 1, 1,
0.3631425, 0.07842816, 1.543373, 1, 1, 1, 1, 1,
0.3672824, -0.1733968, 3.332539, 0, 0, 1, 1, 1,
0.3673349, -1.630421, 3.088864, 1, 0, 0, 1, 1,
0.3676232, -0.0226964, 3.895967, 1, 0, 0, 1, 1,
0.3678434, 0.06013704, 0.261162, 1, 0, 0, 1, 1,
0.3680328, -1.743698, 4.025353, 1, 0, 0, 1, 1,
0.3689161, -0.4669156, 1.906977, 1, 0, 0, 1, 1,
0.3721081, 1.129714, 2.277676, 0, 0, 0, 1, 1,
0.3736012, 1.960962, 1.20946, 0, 0, 0, 1, 1,
0.3750579, -1.255679, 3.189274, 0, 0, 0, 1, 1,
0.3755424, 1.461244, 1.199693, 0, 0, 0, 1, 1,
0.3761346, -0.3156646, 0.924391, 0, 0, 0, 1, 1,
0.3771321, 1.096268, 1.369099, 0, 0, 0, 1, 1,
0.3815967, -1.500695, 4.153763, 0, 0, 0, 1, 1,
0.3861774, -0.9950085, 5.154764, 1, 1, 1, 1, 1,
0.386433, 0.3375943, 0.6030645, 1, 1, 1, 1, 1,
0.3868796, 1.468803, 0.2460318, 1, 1, 1, 1, 1,
0.3919438, -0.792576, 1.563295, 1, 1, 1, 1, 1,
0.3933628, 0.2762304, -0.6389236, 1, 1, 1, 1, 1,
0.3956342, -0.6804605, 2.773972, 1, 1, 1, 1, 1,
0.3968582, 0.3884262, 1.025654, 1, 1, 1, 1, 1,
0.3970008, -0.1035671, 1.656331, 1, 1, 1, 1, 1,
0.4051899, 0.3984052, -0.838986, 1, 1, 1, 1, 1,
0.4058389, -0.04388988, 2.307438, 1, 1, 1, 1, 1,
0.4063145, -0.4590408, 2.404341, 1, 1, 1, 1, 1,
0.407654, 2.751754, 2.167597, 1, 1, 1, 1, 1,
0.4149447, 0.3166645, 0.7932463, 1, 1, 1, 1, 1,
0.4203637, 0.6417659, 0.1075042, 1, 1, 1, 1, 1,
0.4236017, 0.4851482, -0.1289286, 1, 1, 1, 1, 1,
0.4271823, 0.5944832, 0.8861002, 0, 0, 1, 1, 1,
0.4301783, 0.7504845, 1.329463, 1, 0, 0, 1, 1,
0.4303503, 2.264745, 0.02140348, 1, 0, 0, 1, 1,
0.4329319, 0.8418148, 1.551164, 1, 0, 0, 1, 1,
0.4340468, -1.796907, 2.886376, 1, 0, 0, 1, 1,
0.4361666, 1.921984, 0.9834498, 1, 0, 0, 1, 1,
0.4364064, 1.322353, -0.9624916, 0, 0, 0, 1, 1,
0.4379393, 0.1220392, 0.7489399, 0, 0, 0, 1, 1,
0.4384862, -1.7279, 0.9594932, 0, 0, 0, 1, 1,
0.4409817, 0.6069279, -2.046205, 0, 0, 0, 1, 1,
0.4417457, 1.177601, 0.8937591, 0, 0, 0, 1, 1,
0.4444618, 1.034281, 1.262926, 0, 0, 0, 1, 1,
0.4462385, 0.7555225, -0.8551276, 0, 0, 0, 1, 1,
0.4493814, -1.316239, 2.390388, 1, 1, 1, 1, 1,
0.4516998, -1.455226, 1.855052, 1, 1, 1, 1, 1,
0.4539432, -0.4726403, 3.352569, 1, 1, 1, 1, 1,
0.457361, 0.8987193, -0.7183661, 1, 1, 1, 1, 1,
0.4594807, -0.9701416, 2.376436, 1, 1, 1, 1, 1,
0.4610527, -0.5784347, 1.999691, 1, 1, 1, 1, 1,
0.461273, 0.1295704, -0.3230076, 1, 1, 1, 1, 1,
0.4619454, 0.6496108, 1.424554, 1, 1, 1, 1, 1,
0.4647471, 0.8792423, 1.822206, 1, 1, 1, 1, 1,
0.4648262, 1.767859, -0.5787386, 1, 1, 1, 1, 1,
0.4660697, 0.5948536, 0.3061956, 1, 1, 1, 1, 1,
0.467357, -1.683612, 3.768972, 1, 1, 1, 1, 1,
0.4700113, 2.214577, -0.1107279, 1, 1, 1, 1, 1,
0.4742205, 0.2792437, -0.1678938, 1, 1, 1, 1, 1,
0.4762281, -1.510682, 3.036089, 1, 1, 1, 1, 1,
0.4857752, 0.004530035, 0.9072387, 0, 0, 1, 1, 1,
0.4860396, 0.3854415, -0.007767865, 1, 0, 0, 1, 1,
0.4983883, -0.5922763, 3.66672, 1, 0, 0, 1, 1,
0.5063214, -0.4339218, 0.6802182, 1, 0, 0, 1, 1,
0.5074534, -0.4724163, 2.906696, 1, 0, 0, 1, 1,
0.5075929, -0.1409449, 1.649008, 1, 0, 0, 1, 1,
0.5084822, 1.991461, 0.6017833, 0, 0, 0, 1, 1,
0.5192995, -0.4725013, 3.444425, 0, 0, 0, 1, 1,
0.5249037, 0.3367531, 1.526162, 0, 0, 0, 1, 1,
0.5307757, -0.175416, 1.581758, 0, 0, 0, 1, 1,
0.5325391, 0.137282, 0.1453616, 0, 0, 0, 1, 1,
0.5368844, 0.321113, 1.536889, 0, 0, 0, 1, 1,
0.5407758, 0.3100879, 0.7658249, 0, 0, 0, 1, 1,
0.5480514, -0.3057186, 3.647086, 1, 1, 1, 1, 1,
0.5504569, 0.2322771, 0.6554712, 1, 1, 1, 1, 1,
0.5507973, 0.7761054, -0.07149516, 1, 1, 1, 1, 1,
0.5533043, 0.6818473, 0.1176351, 1, 1, 1, 1, 1,
0.5576112, -0.4620735, 2.364701, 1, 1, 1, 1, 1,
0.5576242, 0.8604105, 1.233154, 1, 1, 1, 1, 1,
0.5592673, 0.2532434, 1.061563, 1, 1, 1, 1, 1,
0.5629808, 1.050462, 1.63997, 1, 1, 1, 1, 1,
0.5656866, 0.5613561, 0.03457223, 1, 1, 1, 1, 1,
0.5667975, -0.1817096, 1.97116, 1, 1, 1, 1, 1,
0.5717573, 1.32308, 0.2508352, 1, 1, 1, 1, 1,
0.5757349, 0.0248882, 1.66786, 1, 1, 1, 1, 1,
0.5806018, 1.191519, -0.5468321, 1, 1, 1, 1, 1,
0.5821428, -0.4949209, 2.364572, 1, 1, 1, 1, 1,
0.5875777, 0.07270987, 3.101256, 1, 1, 1, 1, 1,
0.5891426, -0.4289641, 2.776463, 0, 0, 1, 1, 1,
0.589529, -0.05346336, 3.345885, 1, 0, 0, 1, 1,
0.5913502, 1.244424, 0.08672815, 1, 0, 0, 1, 1,
0.5929158, 0.8971658, 0.03589945, 1, 0, 0, 1, 1,
0.5967072, 1.233619, 0.8766312, 1, 0, 0, 1, 1,
0.6044731, -0.05872208, 1.236346, 1, 0, 0, 1, 1,
0.610489, -0.1552269, 2.484556, 0, 0, 0, 1, 1,
0.6210009, -0.1264988, 1.352496, 0, 0, 0, 1, 1,
0.6222892, 1.538789, 1.264675, 0, 0, 0, 1, 1,
0.6269106, 0.2971903, 0.765837, 0, 0, 0, 1, 1,
0.6283573, -1.218611, 3.84572, 0, 0, 0, 1, 1,
0.6333839, 1.49525, 1.373361, 0, 0, 0, 1, 1,
0.6390578, 0.6508133, 0.9339235, 0, 0, 0, 1, 1,
0.6413012, 1.291742, -0.2271251, 1, 1, 1, 1, 1,
0.647453, -0.2611533, 0.7183791, 1, 1, 1, 1, 1,
0.6487653, -0.6469877, 2.845753, 1, 1, 1, 1, 1,
0.6488427, 1.370543, 0.4444412, 1, 1, 1, 1, 1,
0.6558164, 1.473139, -0.05999369, 1, 1, 1, 1, 1,
0.6580695, 0.8834814, 0.1035403, 1, 1, 1, 1, 1,
0.6585098, -0.7619308, 3.175409, 1, 1, 1, 1, 1,
0.6636548, -0.5136461, 3.870049, 1, 1, 1, 1, 1,
0.6662106, 1.082276, -0.2583446, 1, 1, 1, 1, 1,
0.6762024, -0.4507342, 3.02809, 1, 1, 1, 1, 1,
0.6837478, -1.964789, 4.371105, 1, 1, 1, 1, 1,
0.6876147, -0.2022796, 0.8493706, 1, 1, 1, 1, 1,
0.6894599, 0.4463567, 1.637086, 1, 1, 1, 1, 1,
0.6932855, 1.426174, -0.1023135, 1, 1, 1, 1, 1,
0.6939014, -0.7568238, 1.931312, 1, 1, 1, 1, 1,
0.6947877, 1.121073, 0.0976144, 0, 0, 1, 1, 1,
0.6978062, -1.408659, 2.937505, 1, 0, 0, 1, 1,
0.7039638, -0.3469821, 2.329505, 1, 0, 0, 1, 1,
0.7051774, -1.269106, 2.6579, 1, 0, 0, 1, 1,
0.7090205, 0.9097036, 2.359574, 1, 0, 0, 1, 1,
0.7128589, -0.7310358, 2.47092, 1, 0, 0, 1, 1,
0.7144066, 1.067413, -0.2479558, 0, 0, 0, 1, 1,
0.7183936, 1.139647, 0.3903134, 0, 0, 0, 1, 1,
0.7192563, 0.5134096, 0.9095381, 0, 0, 0, 1, 1,
0.725902, -1.898564, 1.935923, 0, 0, 0, 1, 1,
0.7334577, 1.077901, 0.3996163, 0, 0, 0, 1, 1,
0.7347782, -0.02193331, 1.603181, 0, 0, 0, 1, 1,
0.7355132, -0.3885815, 4.579339, 0, 0, 0, 1, 1,
0.7363527, 1.434654, 0.06772567, 1, 1, 1, 1, 1,
0.7365878, 1.057475, 1.187417, 1, 1, 1, 1, 1,
0.7407593, 0.8708746, 3.513517, 1, 1, 1, 1, 1,
0.7423556, 1.049469, 0.2347281, 1, 1, 1, 1, 1,
0.7458449, -0.4815882, 2.424625, 1, 1, 1, 1, 1,
0.752719, -0.5809894, 0.8218649, 1, 1, 1, 1, 1,
0.7550868, -1.585776, 3.838354, 1, 1, 1, 1, 1,
0.7555421, -1.119654, 1.098466, 1, 1, 1, 1, 1,
0.7567572, 0.3434147, 1.726155, 1, 1, 1, 1, 1,
0.7601463, -1.093922, 3.21731, 1, 1, 1, 1, 1,
0.7653839, -0.2647507, 2.120498, 1, 1, 1, 1, 1,
0.7662857, 0.4333668, 0.9203399, 1, 1, 1, 1, 1,
0.7698802, -2.194866, 2.338396, 1, 1, 1, 1, 1,
0.7699612, 1.192536, 3.214873, 1, 1, 1, 1, 1,
0.7764362, 1.421819, 1.290422, 1, 1, 1, 1, 1,
0.7768586, -0.8282158, 2.083821, 0, 0, 1, 1, 1,
0.7776911, -0.1314317, 1.203388, 1, 0, 0, 1, 1,
0.7791534, -0.4037426, 4.554471, 1, 0, 0, 1, 1,
0.784844, -0.2492157, 2.115254, 1, 0, 0, 1, 1,
0.78541, -1.884753, 1.076303, 1, 0, 0, 1, 1,
0.7897217, 1.170906, -0.5610996, 1, 0, 0, 1, 1,
0.790258, -2.606911, 1.039492, 0, 0, 0, 1, 1,
0.7940592, 0.5423543, 1.284302, 0, 0, 0, 1, 1,
0.7979534, -1.157687, 1.052935, 0, 0, 0, 1, 1,
0.8000142, -1.172222, 4.390743, 0, 0, 0, 1, 1,
0.8033856, 0.1312621, 0.4769157, 0, 0, 0, 1, 1,
0.8061537, -0.4447127, 3.875415, 0, 0, 0, 1, 1,
0.8066766, 2.679539, 1.485184, 0, 0, 0, 1, 1,
0.8085698, -0.1397893, 1.998965, 1, 1, 1, 1, 1,
0.8109536, 1.334481, -0.1885485, 1, 1, 1, 1, 1,
0.8128809, -0.2747621, 2.898501, 1, 1, 1, 1, 1,
0.8162457, -0.194082, 3.061899, 1, 1, 1, 1, 1,
0.8277896, -0.1438052, 1.850409, 1, 1, 1, 1, 1,
0.8291023, -0.4167021, 3.600019, 1, 1, 1, 1, 1,
0.8297613, -0.9083815, 1.73401, 1, 1, 1, 1, 1,
0.8300386, -0.9849176, 2.311641, 1, 1, 1, 1, 1,
0.8386855, 1.360673, -0.6707207, 1, 1, 1, 1, 1,
0.8445807, -0.3914289, 1.833379, 1, 1, 1, 1, 1,
0.8472963, -0.9242511, 1.686478, 1, 1, 1, 1, 1,
0.8513994, 0.5382074, 1.618361, 1, 1, 1, 1, 1,
0.8521318, -1.089463, 1.931273, 1, 1, 1, 1, 1,
0.8554658, 0.282103, 0.2880563, 1, 1, 1, 1, 1,
0.8583431, 0.6777884, 1.897394, 1, 1, 1, 1, 1,
0.8690243, 1.109576, -0.5501162, 0, 0, 1, 1, 1,
0.8699577, 0.2804608, 2.601704, 1, 0, 0, 1, 1,
0.8822516, 1.183824, 1.092507, 1, 0, 0, 1, 1,
0.8848132, 0.6987547, 0.3055528, 1, 0, 0, 1, 1,
0.8911155, -0.5357956, 3.130324, 1, 0, 0, 1, 1,
0.8929631, 1.256707, 0.4973129, 1, 0, 0, 1, 1,
0.9014258, -0.6696841, 1.748537, 0, 0, 0, 1, 1,
0.9038681, 0.7949613, 2.391321, 0, 0, 0, 1, 1,
0.9063618, 0.465925, 3.488243, 0, 0, 0, 1, 1,
0.9111822, 1.667313, 0.6609742, 0, 0, 0, 1, 1,
0.9126985, -0.7366932, 0.5897455, 0, 0, 0, 1, 1,
0.9150798, 2.261649, 0.9137338, 0, 0, 0, 1, 1,
0.9158062, -0.765078, 1.965723, 0, 0, 0, 1, 1,
0.9189912, 0.3062872, 4.264647, 1, 1, 1, 1, 1,
0.921571, -0.02464059, 4.138929, 1, 1, 1, 1, 1,
0.9289335, -0.7741603, 1.880849, 1, 1, 1, 1, 1,
0.9289581, -0.466806, 2.337152, 1, 1, 1, 1, 1,
0.9318968, 1.49436, -0.8098766, 1, 1, 1, 1, 1,
0.9320169, -2.17783, 2.289852, 1, 1, 1, 1, 1,
0.9342968, 1.321344, 1.716601, 1, 1, 1, 1, 1,
0.9348595, -0.7134041, 2.469264, 1, 1, 1, 1, 1,
0.9368412, -0.9591969, 2.309804, 1, 1, 1, 1, 1,
0.9415021, -1.397672, 2.218895, 1, 1, 1, 1, 1,
0.9479195, -0.6932871, 1.610799, 1, 1, 1, 1, 1,
0.9516242, 0.1734088, 0.9732447, 1, 1, 1, 1, 1,
0.9532933, 1.459144, 0.7516934, 1, 1, 1, 1, 1,
0.9590766, -0.6213405, 2.371288, 1, 1, 1, 1, 1,
0.9613584, 1.715019, 1.117045, 1, 1, 1, 1, 1,
0.9689913, 0.3453508, 2.132902, 0, 0, 1, 1, 1,
0.9743479, -0.4443127, 3.277911, 1, 0, 0, 1, 1,
0.97466, -1.989099, 2.920452, 1, 0, 0, 1, 1,
0.9914727, -1.04389, 2.362618, 1, 0, 0, 1, 1,
0.9966432, 1.091739, -1.145239, 1, 0, 0, 1, 1,
0.9969648, -0.3441607, 0.6002139, 1, 0, 0, 1, 1,
1.000731, -0.4197506, 2.353597, 0, 0, 0, 1, 1,
1.005358, -0.9528361, -0.01697514, 0, 0, 0, 1, 1,
1.005919, 0.9781941, 0.02180839, 0, 0, 0, 1, 1,
1.006233, -0.9342417, 2.074041, 0, 0, 0, 1, 1,
1.006975, 0.4049621, 0.5579527, 0, 0, 0, 1, 1,
1.007223, 0.02579515, 0.988404, 0, 0, 0, 1, 1,
1.017316, -0.6252236, 2.482801, 0, 0, 0, 1, 1,
1.022262, 0.2519774, -0.08078574, 1, 1, 1, 1, 1,
1.033158, 1.845362, -0.1104241, 1, 1, 1, 1, 1,
1.049032, 0.7882537, 0.9424067, 1, 1, 1, 1, 1,
1.056817, 0.76833, -0.1387235, 1, 1, 1, 1, 1,
1.057503, -0.2546889, 0.4812023, 1, 1, 1, 1, 1,
1.065871, -1.657172, 0.743148, 1, 1, 1, 1, 1,
1.067446, -1.103798, 1.2656, 1, 1, 1, 1, 1,
1.070207, -0.9208676, 1.688451, 1, 1, 1, 1, 1,
1.076702, -0.5924429, 1.791367, 1, 1, 1, 1, 1,
1.076863, 2.254827, 1.272601, 1, 1, 1, 1, 1,
1.076903, 0.3670801, 1.297369, 1, 1, 1, 1, 1,
1.077465, -1.402826, 2.305224, 1, 1, 1, 1, 1,
1.079353, -1.083012, 1.98967, 1, 1, 1, 1, 1,
1.083687, 0.8299559, 1.217317, 1, 1, 1, 1, 1,
1.083923, 0.9065888, -0.1695646, 1, 1, 1, 1, 1,
1.084555, -1.618336, 1.537513, 0, 0, 1, 1, 1,
1.085477, 2.19088, 1.895084, 1, 0, 0, 1, 1,
1.086665, -1.362475, 2.063039, 1, 0, 0, 1, 1,
1.087117, 0.7392712, 1.535659, 1, 0, 0, 1, 1,
1.099463, -1.132674, 1.052715, 1, 0, 0, 1, 1,
1.103058, -1.366935, 1.893208, 1, 0, 0, 1, 1,
1.103063, -0.4143057, 1.885341, 0, 0, 0, 1, 1,
1.115283, -0.549808, 2.734656, 0, 0, 0, 1, 1,
1.121034, 0.01422268, 1.790626, 0, 0, 0, 1, 1,
1.130008, 0.206421, 1.53964, 0, 0, 0, 1, 1,
1.139446, -0.3347465, 2.753617, 0, 0, 0, 1, 1,
1.142839, 0.1662429, 2.649922, 0, 0, 0, 1, 1,
1.144015, 0.07653125, 0.9986775, 0, 0, 0, 1, 1,
1.144116, -0.327927, 1.809205, 1, 1, 1, 1, 1,
1.149898, -1.493752, 1.661002, 1, 1, 1, 1, 1,
1.15601, 0.1902568, 2.29606, 1, 1, 1, 1, 1,
1.160433, -0.5661052, 2.287215, 1, 1, 1, 1, 1,
1.175684, -0.7848947, 1.41233, 1, 1, 1, 1, 1,
1.184318, -0.4899267, 2.791641, 1, 1, 1, 1, 1,
1.188739, 0.6084189, 1.02648, 1, 1, 1, 1, 1,
1.195969, -0.2685148, 2.66654, 1, 1, 1, 1, 1,
1.20467, -0.4088847, 1.707851, 1, 1, 1, 1, 1,
1.207746, -0.360763, 2.350476, 1, 1, 1, 1, 1,
1.208699, 0.9871689, 1.647424, 1, 1, 1, 1, 1,
1.21251, 2.350936, 0.1629505, 1, 1, 1, 1, 1,
1.223738, -0.3922859, 2.841102, 1, 1, 1, 1, 1,
1.2322, -0.3480861, 1.349438, 1, 1, 1, 1, 1,
1.2355, -0.0831641, 0.1425858, 1, 1, 1, 1, 1,
1.24374, -0.7756544, 3.070016, 0, 0, 1, 1, 1,
1.250382, 2.266664, 1.702705, 1, 0, 0, 1, 1,
1.253674, -1.390093, 2.05844, 1, 0, 0, 1, 1,
1.254317, -1.245331, 4.435019, 1, 0, 0, 1, 1,
1.258965, -1.956995, 0.9809774, 1, 0, 0, 1, 1,
1.265408, 0.4015596, -0.7014325, 1, 0, 0, 1, 1,
1.270014, 0.5499775, 0.3984965, 0, 0, 0, 1, 1,
1.277417, -0.9030783, 3.405369, 0, 0, 0, 1, 1,
1.285535, -0.3449816, 2.255157, 0, 0, 0, 1, 1,
1.294526, 0.07735335, 2.714703, 0, 0, 0, 1, 1,
1.296022, -0.1486961, 2.171848, 0, 0, 0, 1, 1,
1.301529, 0.1327328, 2.639791, 0, 0, 0, 1, 1,
1.303676, -0.6352463, 1.633673, 0, 0, 0, 1, 1,
1.307338, 1.307494, 1.486581, 1, 1, 1, 1, 1,
1.310079, 0.03033812, 1.166625, 1, 1, 1, 1, 1,
1.312493, -0.3073451, 3.454396, 1, 1, 1, 1, 1,
1.327234, -0.5404491, 2.733846, 1, 1, 1, 1, 1,
1.328536, -1.196886, 4.435634, 1, 1, 1, 1, 1,
1.335487, -0.1328243, 1.101439, 1, 1, 1, 1, 1,
1.34354, 0.9303161, 1.861034, 1, 1, 1, 1, 1,
1.366254, -1.325959, 0.2579748, 1, 1, 1, 1, 1,
1.37096, -1.525527, 1.911049, 1, 1, 1, 1, 1,
1.387577, 0.3386371, 1.750893, 1, 1, 1, 1, 1,
1.390728, 1.265528, 1.507895, 1, 1, 1, 1, 1,
1.395356, -2.258545, 0.5777732, 1, 1, 1, 1, 1,
1.405727, 1.090245, 1.841399, 1, 1, 1, 1, 1,
1.413935, -0.4167251, 2.749326, 1, 1, 1, 1, 1,
1.434679, 0.1035366, 1.16674, 1, 1, 1, 1, 1,
1.436335, -2.537369, 2.904667, 0, 0, 1, 1, 1,
1.461859, -0.9046769, 0.7445431, 1, 0, 0, 1, 1,
1.475634, 0.4794912, 1.30445, 1, 0, 0, 1, 1,
1.478462, -1.091074, -0.592407, 1, 0, 0, 1, 1,
1.482393, 0.4335927, 1.227422, 1, 0, 0, 1, 1,
1.484939, -0.3162977, 2.54074, 1, 0, 0, 1, 1,
1.485155, -1.70973, 2.55622, 0, 0, 0, 1, 1,
1.496732, -0.2753063, -0.5452096, 0, 0, 0, 1, 1,
1.498166, -0.4302472, 3.017597, 0, 0, 0, 1, 1,
1.503204, 0.4313804, 2.256015, 0, 0, 0, 1, 1,
1.507409, 0.249356, 1.563165, 0, 0, 0, 1, 1,
1.507736, 1.537039, -0.945327, 0, 0, 0, 1, 1,
1.514012, -0.06564543, -0.8896329, 0, 0, 0, 1, 1,
1.5178, -0.12403, 2.602177, 1, 1, 1, 1, 1,
1.528708, 0.5170207, 1.15037, 1, 1, 1, 1, 1,
1.539676, 1.10564, 2.28476, 1, 1, 1, 1, 1,
1.554545, 0.7123456, 1.192015, 1, 1, 1, 1, 1,
1.558815, -0.4948855, 1.849105, 1, 1, 1, 1, 1,
1.567982, -1.383931, 2.700721, 1, 1, 1, 1, 1,
1.587054, 0.208659, 3.254413, 1, 1, 1, 1, 1,
1.587932, -0.6351998, 2.013804, 1, 1, 1, 1, 1,
1.592801, -0.4955555, 2.987511, 1, 1, 1, 1, 1,
1.615191, 0.10225, 2.315316, 1, 1, 1, 1, 1,
1.632971, 0.2468257, 2.084147, 1, 1, 1, 1, 1,
1.638662, 1.659599, 1.664024, 1, 1, 1, 1, 1,
1.650141, 1.452353, 1.661599, 1, 1, 1, 1, 1,
1.656519, -2.232399, 3.778824, 1, 1, 1, 1, 1,
1.675302, -0.02500376, 2.783488, 1, 1, 1, 1, 1,
1.679201, -1.541933, 3.738287, 0, 0, 1, 1, 1,
1.686875, 0.8943595, 3.334774, 1, 0, 0, 1, 1,
1.691445, -0.6761413, 1.79058, 1, 0, 0, 1, 1,
1.694665, -0.4564711, 2.276376, 1, 0, 0, 1, 1,
1.69882, -0.4045479, 3.080499, 1, 0, 0, 1, 1,
1.772052, 0.947985, 3.168069, 1, 0, 0, 1, 1,
1.788237, 1.432201, 1.046598, 0, 0, 0, 1, 1,
1.812224, 1.451159, 1.416429, 0, 0, 0, 1, 1,
1.832275, -1.149182, 3.580669, 0, 0, 0, 1, 1,
1.83586, -1.1401, -1.003517, 0, 0, 0, 1, 1,
1.839573, -0.4162738, -0.03823445, 0, 0, 0, 1, 1,
1.844986, -0.4760553, 0.6128637, 0, 0, 0, 1, 1,
1.847634, 0.5626606, 1.305953, 0, 0, 0, 1, 1,
1.890866, 1.217533, 1.826918, 1, 1, 1, 1, 1,
1.891024, 0.2004914, 2.029519, 1, 1, 1, 1, 1,
1.900903, 0.3467183, 2.039384, 1, 1, 1, 1, 1,
1.904249, 0.1304711, 0.9507352, 1, 1, 1, 1, 1,
1.910641, -0.0990983, 0.05761071, 1, 1, 1, 1, 1,
1.913465, 2.432771, -2.544094, 1, 1, 1, 1, 1,
1.92017, -2.496099, 0.7252731, 1, 1, 1, 1, 1,
1.930967, -0.4548854, 1.821933, 1, 1, 1, 1, 1,
1.946122, -0.4028276, -0.198483, 1, 1, 1, 1, 1,
1.949744, 0.8604302, 1.89252, 1, 1, 1, 1, 1,
1.967451, 0.05194227, 1.722752, 1, 1, 1, 1, 1,
1.969773, -1.301856, 1.441801, 1, 1, 1, 1, 1,
1.998541, -0.226899, 2.970179, 1, 1, 1, 1, 1,
2.002239, -0.004031953, 1.777771, 1, 1, 1, 1, 1,
2.021255, -0.2877279, -0.1082003, 1, 1, 1, 1, 1,
2.025192, -1.606788, 1.642339, 0, 0, 1, 1, 1,
2.070588, -0.56784, 3.23794, 1, 0, 0, 1, 1,
2.092231, 1.254663, 1.202805, 1, 0, 0, 1, 1,
2.096715, -0.5348577, 3.686517, 1, 0, 0, 1, 1,
2.09928, 0.3682347, 1.974382, 1, 0, 0, 1, 1,
2.120965, 0.6465646, 1.019502, 1, 0, 0, 1, 1,
2.161456, 2.435502, 1.180933, 0, 0, 0, 1, 1,
2.179152, 0.1792722, 2.211717, 0, 0, 0, 1, 1,
2.276386, 0.5225044, -0.5444593, 0, 0, 0, 1, 1,
2.276756, -0.3384733, 1.98239, 0, 0, 0, 1, 1,
2.310425, 1.400101, 1.361207, 0, 0, 0, 1, 1,
2.329597, 0.3580844, 0.8854086, 0, 0, 0, 1, 1,
2.351439, 1.748981, 0.7276121, 0, 0, 0, 1, 1,
2.380387, 1.332602, 2.135392, 1, 1, 1, 1, 1,
2.501813, 1.588174, 0.6182653, 1, 1, 1, 1, 1,
2.543416, 0.1112719, 1.039302, 1, 1, 1, 1, 1,
2.579575, -1.942463, 0.8645542, 1, 1, 1, 1, 1,
2.598515, 1.189832, 1.769737, 1, 1, 1, 1, 1,
2.925292, 0.4447984, 0.6611095, 1, 1, 1, 1, 1,
3.279533, 0.6646658, -0.329021, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 9.437417;
var distance = 33.14853;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.2262855, 0.05245256, -0.06937551 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.14853);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>
