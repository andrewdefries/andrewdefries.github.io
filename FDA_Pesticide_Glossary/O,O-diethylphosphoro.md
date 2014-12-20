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
-3.043448, -1.639309, -2.01534, 1, 0, 0, 1,
-2.666587, 0.5369598, -2.161104, 1, 0.007843138, 0, 1,
-2.573918, 2.490014, -0.6074829, 1, 0.01176471, 0, 1,
-2.426228, 2.380262, -2.135966, 1, 0.01960784, 0, 1,
-2.405156, -0.06523211, -0.5691122, 1, 0.02352941, 0, 1,
-2.356806, -0.3247613, -2.057532, 1, 0.03137255, 0, 1,
-2.27637, 0.4972179, -0.5162106, 1, 0.03529412, 0, 1,
-2.247616, 1.0955, -1.538182, 1, 0.04313726, 0, 1,
-2.144923, 0.9359748, -2.202815, 1, 0.04705882, 0, 1,
-2.143259, 1.567982, -1.001095, 1, 0.05490196, 0, 1,
-2.102967, -1.930877, -2.788695, 1, 0.05882353, 0, 1,
-2.070422, -0.1972307, -2.185836, 1, 0.06666667, 0, 1,
-2.06263, -0.1761518, -0.9445068, 1, 0.07058824, 0, 1,
-2.025415, -1.18527, -3.495267, 1, 0.07843138, 0, 1,
-2.019549, 0.7341527, -2.726139, 1, 0.08235294, 0, 1,
-1.973429, 0.3463242, -1.23536, 1, 0.09019608, 0, 1,
-1.946436, 0.7853274, 0.3022769, 1, 0.09411765, 0, 1,
-1.936707, -1.165079, -2.697137, 1, 0.1019608, 0, 1,
-1.903292, 0.1284025, -1.985294, 1, 0.1098039, 0, 1,
-1.893953, -1.188113, -2.957588, 1, 0.1137255, 0, 1,
-1.890936, -0.02982646, -2.639268, 1, 0.1215686, 0, 1,
-1.870338, -0.3071541, -1.461391, 1, 0.1254902, 0, 1,
-1.846866, -0.8957573, -0.8400111, 1, 0.1333333, 0, 1,
-1.835796, -1.315012, -2.842287, 1, 0.1372549, 0, 1,
-1.834155, 0.5352512, -2.336976, 1, 0.145098, 0, 1,
-1.820153, -0.866271, -1.444904, 1, 0.1490196, 0, 1,
-1.81157, 0.3171978, -0.926284, 1, 0.1568628, 0, 1,
-1.783218, -0.2657422, -3.191367, 1, 0.1607843, 0, 1,
-1.766388, -0.9795505, -2.500077, 1, 0.1686275, 0, 1,
-1.746214, 1.67981, -0.8464674, 1, 0.172549, 0, 1,
-1.729568, -0.8095053, -0.8390343, 1, 0.1803922, 0, 1,
-1.717306, 0.269381, 0.003678366, 1, 0.1843137, 0, 1,
-1.70766, 0.3693664, -1.117483, 1, 0.1921569, 0, 1,
-1.682826, -1.176426, -3.204714, 1, 0.1960784, 0, 1,
-1.678275, 0.1211807, -0.3021117, 1, 0.2039216, 0, 1,
-1.676511, -0.288541, -1.921214, 1, 0.2117647, 0, 1,
-1.652861, 1.439569, -3.340246, 1, 0.2156863, 0, 1,
-1.642766, 0.894631, -0.2176692, 1, 0.2235294, 0, 1,
-1.615129, -0.1427178, -1.386216, 1, 0.227451, 0, 1,
-1.603639, -1.585694, -1.848617, 1, 0.2352941, 0, 1,
-1.591478, 1.038553, -0.3219834, 1, 0.2392157, 0, 1,
-1.588299, 0.7407568, -0.02422084, 1, 0.2470588, 0, 1,
-1.560607, 1.07993, -2.588585, 1, 0.2509804, 0, 1,
-1.551188, 0.9334628, 0.3531466, 1, 0.2588235, 0, 1,
-1.540605, 0.666873, -1.462756, 1, 0.2627451, 0, 1,
-1.539533, 0.5725799, -1.132345, 1, 0.2705882, 0, 1,
-1.53796, -2.503242, -2.887701, 1, 0.2745098, 0, 1,
-1.533549, -1.034359, -0.7894863, 1, 0.282353, 0, 1,
-1.524548, 0.8542174, -1.158573, 1, 0.2862745, 0, 1,
-1.517291, -0.08354727, -0.5150738, 1, 0.2941177, 0, 1,
-1.512735, -0.9078814, -1.810007, 1, 0.3019608, 0, 1,
-1.511188, 0.6823241, -0.7753514, 1, 0.3058824, 0, 1,
-1.50759, -1.620253, -2.206574, 1, 0.3137255, 0, 1,
-1.504371, -0.1562675, -0.4850526, 1, 0.3176471, 0, 1,
-1.487309, -0.4811043, -0.9753082, 1, 0.3254902, 0, 1,
-1.48458, 0.4041522, 0.4542496, 1, 0.3294118, 0, 1,
-1.476562, -0.306803, -1.881655, 1, 0.3372549, 0, 1,
-1.47286, 0.3042533, 0.4217769, 1, 0.3411765, 0, 1,
-1.458268, 1.190823, -1.515874, 1, 0.3490196, 0, 1,
-1.449222, 0.2171347, -2.4535, 1, 0.3529412, 0, 1,
-1.447402, -0.2702072, -0.7560075, 1, 0.3607843, 0, 1,
-1.438439, -0.4211624, -2.091983, 1, 0.3647059, 0, 1,
-1.435618, -0.6066539, -2.936359, 1, 0.372549, 0, 1,
-1.419707, 0.2712004, -1.353953, 1, 0.3764706, 0, 1,
-1.416943, -1.517148, -1.897818, 1, 0.3843137, 0, 1,
-1.401996, -0.4221248, -3.59269, 1, 0.3882353, 0, 1,
-1.39946, -1.69748, -1.64739, 1, 0.3960784, 0, 1,
-1.391318, -0.7016914, -1.176593, 1, 0.4039216, 0, 1,
-1.390026, 0.07443713, -2.064307, 1, 0.4078431, 0, 1,
-1.387759, 1.017657, -1.790479, 1, 0.4156863, 0, 1,
-1.367613, 1.930698, -0.793969, 1, 0.4196078, 0, 1,
-1.356839, 0.2826191, -1.38987, 1, 0.427451, 0, 1,
-1.353585, 0.6143621, -1.893509, 1, 0.4313726, 0, 1,
-1.347972, 1.025546, -0.6663695, 1, 0.4392157, 0, 1,
-1.344375, 1.518931, -0.4662392, 1, 0.4431373, 0, 1,
-1.33246, -0.07322476, -1.853063, 1, 0.4509804, 0, 1,
-1.327866, 1.452213, -1.789639, 1, 0.454902, 0, 1,
-1.319329, -0.1749474, -1.65977, 1, 0.4627451, 0, 1,
-1.316159, -2.012912, -3.297601, 1, 0.4666667, 0, 1,
-1.311096, -0.8963861, -1.752737, 1, 0.4745098, 0, 1,
-1.303622, 1.270966, -0.8638754, 1, 0.4784314, 0, 1,
-1.302389, -1.008518, -4.310731, 1, 0.4862745, 0, 1,
-1.296452, -0.8388186, -1.766083, 1, 0.4901961, 0, 1,
-1.29126, -0.9355508, -1.28406, 1, 0.4980392, 0, 1,
-1.291191, 0.9970904, -2.056409, 1, 0.5058824, 0, 1,
-1.287066, -0.7041636, -1.981508, 1, 0.509804, 0, 1,
-1.277852, 0.06653296, 0.3989267, 1, 0.5176471, 0, 1,
-1.272189, -0.1608406, -0.6982311, 1, 0.5215687, 0, 1,
-1.270262, 0.6685496, 0.3914016, 1, 0.5294118, 0, 1,
-1.268626, -0.9194966, -0.1007561, 1, 0.5333334, 0, 1,
-1.265457, -0.05772902, 0.08547992, 1, 0.5411765, 0, 1,
-1.260749, -0.9950193, -1.740676, 1, 0.5450981, 0, 1,
-1.257218, 0.2754236, -3.36642, 1, 0.5529412, 0, 1,
-1.249093, -0.1630091, -0.7037749, 1, 0.5568628, 0, 1,
-1.245392, 1.811217, 1.136493, 1, 0.5647059, 0, 1,
-1.242283, 1.450152, 0.02199989, 1, 0.5686275, 0, 1,
-1.241001, 0.7685008, -1.627892, 1, 0.5764706, 0, 1,
-1.239863, 1.64139, -0.6684111, 1, 0.5803922, 0, 1,
-1.235892, -0.9420894, -1.763249, 1, 0.5882353, 0, 1,
-1.234154, -0.9923999, -1.423291, 1, 0.5921569, 0, 1,
-1.225811, -0.809, -3.228191, 1, 0.6, 0, 1,
-1.224415, 0.3448712, -0.09907304, 1, 0.6078432, 0, 1,
-1.216477, -0.6255465, -1.296604, 1, 0.6117647, 0, 1,
-1.205074, 0.0450635, -3.188996, 1, 0.6196079, 0, 1,
-1.204881, 3.079683, -1.23914, 1, 0.6235294, 0, 1,
-1.203724, 0.5070517, -0.9487662, 1, 0.6313726, 0, 1,
-1.194648, -0.5857617, -0.8835019, 1, 0.6352941, 0, 1,
-1.187009, -1.42155, -2.001477, 1, 0.6431373, 0, 1,
-1.186605, 0.6692594, -2.14929, 1, 0.6470588, 0, 1,
-1.185194, 1.020857, -1.153272, 1, 0.654902, 0, 1,
-1.184945, -0.7519525, -1.322913, 1, 0.6588235, 0, 1,
-1.179652, -0.5575954, -2.84606, 1, 0.6666667, 0, 1,
-1.173489, -0.2376584, -2.312733, 1, 0.6705883, 0, 1,
-1.16243, -0.1738223, -1.913087, 1, 0.6784314, 0, 1,
-1.162047, -0.5940164, -2.780404, 1, 0.682353, 0, 1,
-1.161594, -0.004452704, -1.933692, 1, 0.6901961, 0, 1,
-1.158744, 1.189273, -0.967021, 1, 0.6941177, 0, 1,
-1.153534, 1.468022, 0.3136289, 1, 0.7019608, 0, 1,
-1.143543, -0.3980694, -0.251022, 1, 0.7098039, 0, 1,
-1.142489, -0.2260733, 0.3218931, 1, 0.7137255, 0, 1,
-1.141116, -0.3669184, -4.055558, 1, 0.7215686, 0, 1,
-1.138669, -0.9069209, -2.982797, 1, 0.7254902, 0, 1,
-1.129474, 0.4360648, -0.408674, 1, 0.7333333, 0, 1,
-1.116822, 0.1082221, -0.4531529, 1, 0.7372549, 0, 1,
-1.115374, 0.3505759, -2.273576, 1, 0.7450981, 0, 1,
-1.105644, 1.973587, -1.860465, 1, 0.7490196, 0, 1,
-1.102807, -1.291036, -3.320642, 1, 0.7568628, 0, 1,
-1.100356, -0.5213899, -3.43525, 1, 0.7607843, 0, 1,
-1.097698, 1.440965, -1.168784, 1, 0.7686275, 0, 1,
-1.097669, -0.2437315, -4.056667, 1, 0.772549, 0, 1,
-1.096712, -0.2882264, 0.4155116, 1, 0.7803922, 0, 1,
-1.089664, 1.156664, -0.6346594, 1, 0.7843137, 0, 1,
-1.078369, -1.287437, -2.934996, 1, 0.7921569, 0, 1,
-1.078291, 1.241616, -0.5135623, 1, 0.7960784, 0, 1,
-1.073185, 2.788946, -2.015593, 1, 0.8039216, 0, 1,
-1.070863, -0.7030836, -2.180213, 1, 0.8117647, 0, 1,
-1.070855, -0.2313485, -0.6424091, 1, 0.8156863, 0, 1,
-1.06944, -0.9711547, -2.386817, 1, 0.8235294, 0, 1,
-1.06932, -1.019801, -2.482616, 1, 0.827451, 0, 1,
-1.047732, -0.9855147, -1.633017, 1, 0.8352941, 0, 1,
-1.046137, 0.2921905, -0.7575342, 1, 0.8392157, 0, 1,
-1.040158, 0.7174947, -1.147653, 1, 0.8470588, 0, 1,
-1.039188, -0.4344605, -3.262598, 1, 0.8509804, 0, 1,
-1.03785, -1.51154, -2.340519, 1, 0.8588235, 0, 1,
-1.035243, 0.07689703, -0.5273075, 1, 0.8627451, 0, 1,
-1.034554, -1.27758, -1.051889, 1, 0.8705882, 0, 1,
-1.033508, 0.03993166, -1.920021, 1, 0.8745098, 0, 1,
-1.031379, -0.7683005, -1.98772, 1, 0.8823529, 0, 1,
-1.030771, -0.7102509, -1.827038, 1, 0.8862745, 0, 1,
-1.022312, 0.458265, -1.960612, 1, 0.8941177, 0, 1,
-1.021301, -0.03288865, -2.043097, 1, 0.8980392, 0, 1,
-1.021296, 0.4184751, -1.048025, 1, 0.9058824, 0, 1,
-1.017779, -1.880265, -2.79053, 1, 0.9137255, 0, 1,
-1.014678, 0.8592173, -0.6017259, 1, 0.9176471, 0, 1,
-1.014289, 0.2784944, -1.25746, 1, 0.9254902, 0, 1,
-0.9925636, -1.651081, -3.192034, 1, 0.9294118, 0, 1,
-0.9862404, -0.8279477, -2.549485, 1, 0.9372549, 0, 1,
-0.9852122, -0.7224927, -3.423483, 1, 0.9411765, 0, 1,
-0.9804497, 0.06636062, -1.278048, 1, 0.9490196, 0, 1,
-0.9778823, 1.068953, -0.3189591, 1, 0.9529412, 0, 1,
-0.9584462, -0.7030352, -2.624917, 1, 0.9607843, 0, 1,
-0.9583238, 1.111707, -0.1275444, 1, 0.9647059, 0, 1,
-0.9582568, 0.3342505, -0.7473912, 1, 0.972549, 0, 1,
-0.9573796, 0.3093356, -1.431017, 1, 0.9764706, 0, 1,
-0.9450983, -0.6641022, -1.109807, 1, 0.9843137, 0, 1,
-0.9441347, 1.395516, -0.8523022, 1, 0.9882353, 0, 1,
-0.9427595, -0.3089729, -0.9506955, 1, 0.9960784, 0, 1,
-0.9314393, -0.8014374, -0.4892904, 0.9960784, 1, 0, 1,
-0.9215797, -0.3841383, -2.487412, 0.9921569, 1, 0, 1,
-0.9215691, -0.5731701, -2.594896, 0.9843137, 1, 0, 1,
-0.9133045, 0.1463481, -1.819253, 0.9803922, 1, 0, 1,
-0.91056, 0.2297366, -1.584229, 0.972549, 1, 0, 1,
-0.9083143, 0.09901413, -1.660772, 0.9686275, 1, 0, 1,
-0.9053479, -0.04560871, -1.573249, 0.9607843, 1, 0, 1,
-0.9014102, 1.035699, -1.29872, 0.9568627, 1, 0, 1,
-0.8996595, -0.08768646, -0.6797646, 0.9490196, 1, 0, 1,
-0.8992165, 0.03839874, -1.646644, 0.945098, 1, 0, 1,
-0.8895045, 1.132535, -0.4351166, 0.9372549, 1, 0, 1,
-0.8859588, 0.1892385, -0.2238712, 0.9333333, 1, 0, 1,
-0.8809566, -1.190158, -2.987836, 0.9254902, 1, 0, 1,
-0.880448, 0.4620097, -2.898659, 0.9215686, 1, 0, 1,
-0.8774521, -1.703476, -2.132329, 0.9137255, 1, 0, 1,
-0.8728248, -1.045202, -1.317739, 0.9098039, 1, 0, 1,
-0.8705701, 2.080723, -0.1626775, 0.9019608, 1, 0, 1,
-0.8678168, -1.554164, -1.101148, 0.8941177, 1, 0, 1,
-0.8638493, 0.279109, -0.5968188, 0.8901961, 1, 0, 1,
-0.8605552, -0.1860915, -1.046886, 0.8823529, 1, 0, 1,
-0.8603332, -1.058486, -2.154804, 0.8784314, 1, 0, 1,
-0.8544702, 1.095504, 0.05001512, 0.8705882, 1, 0, 1,
-0.8537309, 0.8500354, 0.2537556, 0.8666667, 1, 0, 1,
-0.8537168, -1.464548, -1.012063, 0.8588235, 1, 0, 1,
-0.8494352, 0.2834809, -2.012427, 0.854902, 1, 0, 1,
-0.8474245, -0.5628101, -2.692997, 0.8470588, 1, 0, 1,
-0.8397914, -0.2291987, -2.258008, 0.8431373, 1, 0, 1,
-0.8363488, 0.1308133, -2.226864, 0.8352941, 1, 0, 1,
-0.8340893, -0.9423965, -2.589139, 0.8313726, 1, 0, 1,
-0.8327743, -2.183155, -3.662493, 0.8235294, 1, 0, 1,
-0.8241386, 1.053175, -2.790698, 0.8196079, 1, 0, 1,
-0.8215288, 0.3678409, -0.5333788, 0.8117647, 1, 0, 1,
-0.8176244, 0.3603218, -1.772654, 0.8078431, 1, 0, 1,
-0.8155611, -1.128513, -1.609851, 0.8, 1, 0, 1,
-0.8136479, -0.4059802, -2.152731, 0.7921569, 1, 0, 1,
-0.8106521, 0.4911084, -0.6290232, 0.7882353, 1, 0, 1,
-0.809086, -1.117916, -1.56896, 0.7803922, 1, 0, 1,
-0.7920414, -0.2943971, -1.620981, 0.7764706, 1, 0, 1,
-0.7917976, 1.874028, -0.5600804, 0.7686275, 1, 0, 1,
-0.789968, -0.05207932, -0.8129888, 0.7647059, 1, 0, 1,
-0.7874959, 0.2201841, -2.554926, 0.7568628, 1, 0, 1,
-0.7859067, 0.9170958, -0.1460452, 0.7529412, 1, 0, 1,
-0.7763678, 0.4493641, -2.327745, 0.7450981, 1, 0, 1,
-0.7714862, 0.3308867, -1.183275, 0.7411765, 1, 0, 1,
-0.7680873, -0.4690276, -2.854518, 0.7333333, 1, 0, 1,
-0.7639638, -0.8206376, -3.497167, 0.7294118, 1, 0, 1,
-0.7537408, 0.3499733, -0.7233869, 0.7215686, 1, 0, 1,
-0.7529303, -0.6428608, -1.373796, 0.7176471, 1, 0, 1,
-0.7521868, -1.09779, -2.409307, 0.7098039, 1, 0, 1,
-0.7459125, 0.9841751, -0.7597942, 0.7058824, 1, 0, 1,
-0.7444511, 1.306796, -1.241595, 0.6980392, 1, 0, 1,
-0.7418008, 0.7025278, 2.762815, 0.6901961, 1, 0, 1,
-0.7373497, -0.5216981, -3.817443, 0.6862745, 1, 0, 1,
-0.7371973, 0.2939329, -0.9179332, 0.6784314, 1, 0, 1,
-0.7369376, -0.7090283, -1.241782, 0.6745098, 1, 0, 1,
-0.7362804, -0.5612085, -1.127348, 0.6666667, 1, 0, 1,
-0.7258237, -0.4274418, -0.6320408, 0.6627451, 1, 0, 1,
-0.7204053, -0.5273854, -2.043672, 0.654902, 1, 0, 1,
-0.71872, -0.2405536, -2.848239, 0.6509804, 1, 0, 1,
-0.7171136, 0.8656826, -0.6464146, 0.6431373, 1, 0, 1,
-0.715874, 0.8100236, -0.5014409, 0.6392157, 1, 0, 1,
-0.715273, -0.1252928, -2.755724, 0.6313726, 1, 0, 1,
-0.7146106, 0.03523766, -1.152359, 0.627451, 1, 0, 1,
-0.7125419, 1.173115, -1.803587, 0.6196079, 1, 0, 1,
-0.7114247, -1.756648, -3.929553, 0.6156863, 1, 0, 1,
-0.709538, 1.17456, -2.7155, 0.6078432, 1, 0, 1,
-0.7025064, -0.3226141, -1.136481, 0.6039216, 1, 0, 1,
-0.7020826, -0.4913761, -2.703956, 0.5960785, 1, 0, 1,
-0.6936906, -1.372694, -1.755273, 0.5882353, 1, 0, 1,
-0.6902587, 1.413398, 1.094639, 0.5843138, 1, 0, 1,
-0.6859333, -0.6209306, -1.036609, 0.5764706, 1, 0, 1,
-0.6813474, 1.87032, -0.8858438, 0.572549, 1, 0, 1,
-0.6675616, 0.1381398, -1.223648, 0.5647059, 1, 0, 1,
-0.6597906, -1.030844, -3.41579, 0.5607843, 1, 0, 1,
-0.6497647, -1.688251, -0.7170899, 0.5529412, 1, 0, 1,
-0.6473475, 1.74479, -0.3492376, 0.5490196, 1, 0, 1,
-0.6449705, -0.8214933, -2.075347, 0.5411765, 1, 0, 1,
-0.637584, 1.583588, -0.3207058, 0.5372549, 1, 0, 1,
-0.6353588, 0.09167662, -0.2489664, 0.5294118, 1, 0, 1,
-0.6336553, -0.01327674, -1.355173, 0.5254902, 1, 0, 1,
-0.6328281, 1.43408, 0.2998397, 0.5176471, 1, 0, 1,
-0.6314538, -1.1718, -3.001723, 0.5137255, 1, 0, 1,
-0.6301702, -1.345129, -1.81269, 0.5058824, 1, 0, 1,
-0.6268265, -1.911803, -1.801627, 0.5019608, 1, 0, 1,
-0.6257418, 2.026953, 0.752712, 0.4941176, 1, 0, 1,
-0.6233041, -0.1254825, -2.276029, 0.4862745, 1, 0, 1,
-0.6228904, -0.5541889, -2.949457, 0.4823529, 1, 0, 1,
-0.6226622, 0.8219523, -1.729153, 0.4745098, 1, 0, 1,
-0.6216711, -0.9297766, -3.462994, 0.4705882, 1, 0, 1,
-0.6164225, 0.506013, -0.9111494, 0.4627451, 1, 0, 1,
-0.616172, -0.1891491, -1.30916, 0.4588235, 1, 0, 1,
-0.6081905, -0.5447793, -2.254375, 0.4509804, 1, 0, 1,
-0.6062447, -0.8807284, -1.721946, 0.4470588, 1, 0, 1,
-0.5842316, 0.5798149, -1.827097, 0.4392157, 1, 0, 1,
-0.5815223, 0.8496573, -0.6979832, 0.4352941, 1, 0, 1,
-0.5804186, -1.348739, -2.642183, 0.427451, 1, 0, 1,
-0.5779824, 0.1875836, -0.9965295, 0.4235294, 1, 0, 1,
-0.569968, 0.7916778, -1.262048, 0.4156863, 1, 0, 1,
-0.5672425, -0.9920314, 0.1547136, 0.4117647, 1, 0, 1,
-0.5667232, 0.2871635, -0.1894186, 0.4039216, 1, 0, 1,
-0.5634947, 0.347005, -2.147562, 0.3960784, 1, 0, 1,
-0.559643, 0.06276079, -0.152271, 0.3921569, 1, 0, 1,
-0.5579509, 1.351495, -0.5820773, 0.3843137, 1, 0, 1,
-0.5494862, -0.09421768, -0.8711693, 0.3803922, 1, 0, 1,
-0.5428055, -0.4587164, -2.64495, 0.372549, 1, 0, 1,
-0.5359082, -0.4002378, -2.662372, 0.3686275, 1, 0, 1,
-0.533974, -0.00935338, -3.092309, 0.3607843, 1, 0, 1,
-0.5309007, 0.2011532, 0.2423117, 0.3568628, 1, 0, 1,
-0.5260324, 1.160319, -1.767423, 0.3490196, 1, 0, 1,
-0.5201937, 0.7124385, 0.783972, 0.345098, 1, 0, 1,
-0.5116708, 0.8899498, 0.5793014, 0.3372549, 1, 0, 1,
-0.5095106, -0.3760046, -2.698703, 0.3333333, 1, 0, 1,
-0.505313, 1.034896, -0.09810649, 0.3254902, 1, 0, 1,
-0.5007308, 0.8785186, 0.9609923, 0.3215686, 1, 0, 1,
-0.4981224, -0.09215716, -1.854787, 0.3137255, 1, 0, 1,
-0.4936044, -0.1540367, -3.676422, 0.3098039, 1, 0, 1,
-0.4918619, 0.2306421, -1.297205, 0.3019608, 1, 0, 1,
-0.4904454, 1.29785, -1.134052, 0.2941177, 1, 0, 1,
-0.489229, 0.9736592, -0.2756433, 0.2901961, 1, 0, 1,
-0.4870807, 1.037379, 0.400976, 0.282353, 1, 0, 1,
-0.4861251, 0.5753163, -1.139227, 0.2784314, 1, 0, 1,
-0.479901, 0.01073982, 0.3836011, 0.2705882, 1, 0, 1,
-0.4783288, 0.03076301, -2.437753, 0.2666667, 1, 0, 1,
-0.4767806, 1.196268, -0.6173223, 0.2588235, 1, 0, 1,
-0.4750442, 0.3782495, -0.5389829, 0.254902, 1, 0, 1,
-0.4721265, 1.140255, -0.8710578, 0.2470588, 1, 0, 1,
-0.466358, 0.999411, -1.553787, 0.2431373, 1, 0, 1,
-0.4659724, -1.170923, -2.916877, 0.2352941, 1, 0, 1,
-0.4659108, 0.1022193, 0.5721345, 0.2313726, 1, 0, 1,
-0.4641884, -0.3699418, -2.289691, 0.2235294, 1, 0, 1,
-0.4610151, 1.87212, 0.6391847, 0.2196078, 1, 0, 1,
-0.4598744, 0.4034161, -0.06058635, 0.2117647, 1, 0, 1,
-0.4567573, 0.3535822, 0.2703311, 0.2078431, 1, 0, 1,
-0.4539407, -0.8770559, -3.344425, 0.2, 1, 0, 1,
-0.4509744, -0.706686, -1.383394, 0.1921569, 1, 0, 1,
-0.4435176, 1.122491, -1.839724, 0.1882353, 1, 0, 1,
-0.437549, 1.438818, -0.1373461, 0.1803922, 1, 0, 1,
-0.4375394, 0.1867557, 0.3265904, 0.1764706, 1, 0, 1,
-0.4355369, 0.3782912, 0.3859583, 0.1686275, 1, 0, 1,
-0.432526, -0.2910269, -2.456461, 0.1647059, 1, 0, 1,
-0.4316808, -0.2859793, -2.482327, 0.1568628, 1, 0, 1,
-0.4175531, -1.037852, -1.052583, 0.1529412, 1, 0, 1,
-0.4174701, -2.130314, -2.301902, 0.145098, 1, 0, 1,
-0.4171055, -0.4394226, -2.365525, 0.1411765, 1, 0, 1,
-0.4103392, 0.4866834, -0.2381877, 0.1333333, 1, 0, 1,
-0.405515, 0.3158546, 0.2443033, 0.1294118, 1, 0, 1,
-0.4047889, -2.095418, -3.287948, 0.1215686, 1, 0, 1,
-0.4045219, -1.374426, -2.370783, 0.1176471, 1, 0, 1,
-0.4035954, -2.048464, -3.015294, 0.1098039, 1, 0, 1,
-0.3999439, 0.6571704, 0.4880265, 0.1058824, 1, 0, 1,
-0.3951303, 1.177443, -0.2850074, 0.09803922, 1, 0, 1,
-0.3930397, 1.867438, 0.1776752, 0.09019608, 1, 0, 1,
-0.3888946, 0.3788302, -0.9766347, 0.08627451, 1, 0, 1,
-0.3861502, -1.583523, -2.35714, 0.07843138, 1, 0, 1,
-0.3786203, -0.2431622, -1.935477, 0.07450981, 1, 0, 1,
-0.3780364, 1.163638, -0.2236535, 0.06666667, 1, 0, 1,
-0.3736538, -0.1060239, -1.55183, 0.0627451, 1, 0, 1,
-0.3731641, -0.2594975, -2.108695, 0.05490196, 1, 0, 1,
-0.3717345, -1.413097, -3.518272, 0.05098039, 1, 0, 1,
-0.3716563, -0.1462574, -2.837445, 0.04313726, 1, 0, 1,
-0.3698136, -0.5754986, -2.819656, 0.03921569, 1, 0, 1,
-0.3683324, -0.1988593, -3.297743, 0.03137255, 1, 0, 1,
-0.3670273, 0.6297258, 1.038358, 0.02745098, 1, 0, 1,
-0.3638477, -1.896083, -4.192926, 0.01960784, 1, 0, 1,
-0.3629415, 1.336745, -0.4821991, 0.01568628, 1, 0, 1,
-0.3609049, 0.4724046, -1.92259, 0.007843138, 1, 0, 1,
-0.359648, 1.011203, -0.5343595, 0.003921569, 1, 0, 1,
-0.3554953, -1.064208, -3.841819, 0, 1, 0.003921569, 1,
-0.3499737, -1.186862, -3.382388, 0, 1, 0.01176471, 1,
-0.3499098, 1.82966, 0.1330982, 0, 1, 0.01568628, 1,
-0.3496344, 0.02416115, -0.741788, 0, 1, 0.02352941, 1,
-0.3490297, -0.9822998, -3.823599, 0, 1, 0.02745098, 1,
-0.3488138, -0.7204584, -1.80462, 0, 1, 0.03529412, 1,
-0.3486214, -0.8561341, -1.978782, 0, 1, 0.03921569, 1,
-0.3478436, -0.1788314, -2.61435, 0, 1, 0.04705882, 1,
-0.3422028, -0.7507401, -2.904503, 0, 1, 0.05098039, 1,
-0.3314268, -1.772982, -4.541577, 0, 1, 0.05882353, 1,
-0.3308271, 0.2855327, -2.561047, 0, 1, 0.0627451, 1,
-0.3305528, 2.00879, 2.385774, 0, 1, 0.07058824, 1,
-0.3304636, -0.3551441, -0.5773477, 0, 1, 0.07450981, 1,
-0.3302306, -0.5726167, -2.959207, 0, 1, 0.08235294, 1,
-0.3273837, -0.3858108, -3.087554, 0, 1, 0.08627451, 1,
-0.3269432, 0.3710279, -1.370661, 0, 1, 0.09411765, 1,
-0.322679, 0.09650126, 0.6935018, 0, 1, 0.1019608, 1,
-0.3223341, -1.557672, -3.064916, 0, 1, 0.1058824, 1,
-0.3192652, -0.5067977, -3.783466, 0, 1, 0.1137255, 1,
-0.3187865, 0.6224446, -0.8025889, 0, 1, 0.1176471, 1,
-0.3152333, 0.7617565, -1.181654, 0, 1, 0.1254902, 1,
-0.3121629, 0.9379886, -0.7618467, 0, 1, 0.1294118, 1,
-0.3055904, -1.390211, -3.919653, 0, 1, 0.1372549, 1,
-0.3023597, -0.01321771, -1.161742, 0, 1, 0.1411765, 1,
-0.2945288, -0.09947621, -3.069563, 0, 1, 0.1490196, 1,
-0.2944619, -0.6200311, -2.631752, 0, 1, 0.1529412, 1,
-0.2941442, 0.03734361, -1.676356, 0, 1, 0.1607843, 1,
-0.2936742, -0.4833875, -2.455339, 0, 1, 0.1647059, 1,
-0.2916595, -0.3675277, -1.283519, 0, 1, 0.172549, 1,
-0.2914746, -1.417457, -1.264889, 0, 1, 0.1764706, 1,
-0.2913291, -0.6393789, -3.708843, 0, 1, 0.1843137, 1,
-0.2891389, -0.6145232, -1.682943, 0, 1, 0.1882353, 1,
-0.2840222, 0.8906417, 1.36847, 0, 1, 0.1960784, 1,
-0.2822361, 1.119935, 0.1201712, 0, 1, 0.2039216, 1,
-0.2787525, 0.3702887, -2.433114, 0, 1, 0.2078431, 1,
-0.2783602, 0.4590598, -1.119633, 0, 1, 0.2156863, 1,
-0.2757119, 0.7937732, -2.100409, 0, 1, 0.2196078, 1,
-0.272185, 0.3594563, -0.7648016, 0, 1, 0.227451, 1,
-0.2681987, 1.989445, -0.1124948, 0, 1, 0.2313726, 1,
-0.2672525, 1.856022, -0.4462184, 0, 1, 0.2392157, 1,
-0.2630686, 1.474169, 0.6901869, 0, 1, 0.2431373, 1,
-0.26258, -0.2277067, -2.778517, 0, 1, 0.2509804, 1,
-0.2554447, 0.481058, -0.07917178, 0, 1, 0.254902, 1,
-0.2538565, -0.02785653, -2.6905, 0, 1, 0.2627451, 1,
-0.252874, -0.8024568, -2.02544, 0, 1, 0.2666667, 1,
-0.2525721, 0.816616, 0.01056859, 0, 1, 0.2745098, 1,
-0.251922, -1.337956, -4.085496, 0, 1, 0.2784314, 1,
-0.2505491, 0.5018889, -1.088473, 0, 1, 0.2862745, 1,
-0.2447041, 1.898517, 0.2597899, 0, 1, 0.2901961, 1,
-0.2414481, 0.2714162, -2.392375, 0, 1, 0.2980392, 1,
-0.2406638, -1.352174, -2.076952, 0, 1, 0.3058824, 1,
-0.2345775, 1.186011, -0.6324334, 0, 1, 0.3098039, 1,
-0.2306483, 0.6556461, -1.050063, 0, 1, 0.3176471, 1,
-0.2232728, 0.7383404, -1.185448, 0, 1, 0.3215686, 1,
-0.2215976, 0.5068156, -1.37694, 0, 1, 0.3294118, 1,
-0.2195022, 0.5587003, 0.8744763, 0, 1, 0.3333333, 1,
-0.2186128, -0.4401448, -1.888421, 0, 1, 0.3411765, 1,
-0.2133337, -0.4479324, -3.586024, 0, 1, 0.345098, 1,
-0.2128554, 0.06964623, -0.4756472, 0, 1, 0.3529412, 1,
-0.2125614, 0.5623375, -0.0297056, 0, 1, 0.3568628, 1,
-0.2125041, -0.3974955, -2.151149, 0, 1, 0.3647059, 1,
-0.2098091, -0.8488695, -1.801084, 0, 1, 0.3686275, 1,
-0.2092599, -1.398171, -2.445959, 0, 1, 0.3764706, 1,
-0.2090078, 0.9227009, 0.1655297, 0, 1, 0.3803922, 1,
-0.208662, -1.158327, -3.239605, 0, 1, 0.3882353, 1,
-0.2048199, -0.3674926, -2.901904, 0, 1, 0.3921569, 1,
-0.204683, -0.4887212, -3.519263, 0, 1, 0.4, 1,
-0.2009002, 0.6620721, -1.007196, 0, 1, 0.4078431, 1,
-0.1999262, 1.323501, 0.7712507, 0, 1, 0.4117647, 1,
-0.1968063, 0.3337562, -0.3409107, 0, 1, 0.4196078, 1,
-0.1953375, 0.04920963, -2.05333, 0, 1, 0.4235294, 1,
-0.1934771, 0.324591, 0.3006905, 0, 1, 0.4313726, 1,
-0.1859439, -1.030962, -2.957222, 0, 1, 0.4352941, 1,
-0.1857485, -1.423593, -2.498101, 0, 1, 0.4431373, 1,
-0.1835573, 1.546079, 0.7133468, 0, 1, 0.4470588, 1,
-0.1801315, -0.1655189, -2.518198, 0, 1, 0.454902, 1,
-0.1774524, 1.630344, 0.9577451, 0, 1, 0.4588235, 1,
-0.1773309, 0.3395203, -0.7627583, 0, 1, 0.4666667, 1,
-0.1767322, 0.9746665, 1.915755, 0, 1, 0.4705882, 1,
-0.1758553, 0.2156787, -2.083517, 0, 1, 0.4784314, 1,
-0.1749843, -0.001058471, -1.255068, 0, 1, 0.4823529, 1,
-0.1727839, 1.238887, 0.6743658, 0, 1, 0.4901961, 1,
-0.1700068, 1.09433, -0.9540656, 0, 1, 0.4941176, 1,
-0.1647688, 0.4969384, 0.8460119, 0, 1, 0.5019608, 1,
-0.1614191, -0.7371789, -3.145831, 0, 1, 0.509804, 1,
-0.1575496, 1.493115, 1.416741, 0, 1, 0.5137255, 1,
-0.1553111, 1.302194, -0.6328848, 0, 1, 0.5215687, 1,
-0.1552377, -0.007748019, -2.789336, 0, 1, 0.5254902, 1,
-0.1532634, -0.1521874, -2.094829, 0, 1, 0.5333334, 1,
-0.1501451, -0.7463548, -4.676556, 0, 1, 0.5372549, 1,
-0.1462594, 0.8869302, 1.196914, 0, 1, 0.5450981, 1,
-0.1418102, -0.5659021, -2.754499, 0, 1, 0.5490196, 1,
-0.1408344, 2.812899, 0.7302122, 0, 1, 0.5568628, 1,
-0.1392487, 0.7362254, -2.399499, 0, 1, 0.5607843, 1,
-0.1345465, -1.045188, -4.870038, 0, 1, 0.5686275, 1,
-0.1285242, -0.7124665, -4.724638, 0, 1, 0.572549, 1,
-0.1280041, -0.01032632, -2.079185, 0, 1, 0.5803922, 1,
-0.1244407, 0.08055412, -1.161989, 0, 1, 0.5843138, 1,
-0.1236324, -1.515254, -3.355262, 0, 1, 0.5921569, 1,
-0.1211273, -0.5513602, -2.224319, 0, 1, 0.5960785, 1,
-0.1197134, 0.9703781, -0.2002095, 0, 1, 0.6039216, 1,
-0.1193782, 0.08133835, -3.382194, 0, 1, 0.6117647, 1,
-0.1153231, -1.460599, -4.099107, 0, 1, 0.6156863, 1,
-0.1107488, 0.6330843, -0.2490747, 0, 1, 0.6235294, 1,
-0.11001, 2.11643, 0.5024959, 0, 1, 0.627451, 1,
-0.1095085, 0.9020751, 0.1108771, 0, 1, 0.6352941, 1,
-0.1070118, -0.24999, -1.97377, 0, 1, 0.6392157, 1,
-0.1067093, -0.5735617, -1.590213, 0, 1, 0.6470588, 1,
-0.1037072, -0.303037, -2.463914, 0, 1, 0.6509804, 1,
-0.1036982, -0.2575561, -3.55959, 0, 1, 0.6588235, 1,
-0.1013012, -0.8158717, -3.118266, 0, 1, 0.6627451, 1,
-0.1003769, -0.1732211, -3.007678, 0, 1, 0.6705883, 1,
-0.0990915, 0.3682525, -0.4702818, 0, 1, 0.6745098, 1,
-0.09332927, -0.233221, -3.634793, 0, 1, 0.682353, 1,
-0.09308723, 0.3454253, 0.2444939, 0, 1, 0.6862745, 1,
-0.08869871, -0.2825787, -3.739798, 0, 1, 0.6941177, 1,
-0.08743297, -2.080731, -4.782027, 0, 1, 0.7019608, 1,
-0.08531384, -1.764118, -2.998072, 0, 1, 0.7058824, 1,
-0.08526631, 0.8501688, 0.5957505, 0, 1, 0.7137255, 1,
-0.082284, 0.9520667, 0.363079, 0, 1, 0.7176471, 1,
-0.08204091, -0.9415367, -2.648079, 0, 1, 0.7254902, 1,
-0.07680365, -0.2902381, -3.187269, 0, 1, 0.7294118, 1,
-0.07620157, -1.077231, -3.597318, 0, 1, 0.7372549, 1,
-0.07187903, -1.655652, -4.008944, 0, 1, 0.7411765, 1,
-0.07064247, 2.199295, 0.6015378, 0, 1, 0.7490196, 1,
-0.07011756, -0.6965634, -2.395468, 0, 1, 0.7529412, 1,
-0.06884117, 1.568899, 0.1301947, 0, 1, 0.7607843, 1,
-0.06448855, -0.07218702, -3.136067, 0, 1, 0.7647059, 1,
-0.05743286, 0.6005199, -1.333011, 0, 1, 0.772549, 1,
-0.05438022, 1.283511, -0.6330208, 0, 1, 0.7764706, 1,
-0.05247203, 1.836989, 0.008919939, 0, 1, 0.7843137, 1,
-0.0497238, 1.847818, -0.2163185, 0, 1, 0.7882353, 1,
-0.04474961, 1.37506, -0.1946739, 0, 1, 0.7960784, 1,
-0.04292005, -1.948093, -3.894042, 0, 1, 0.8039216, 1,
-0.04248625, 2.25373, -0.2732962, 0, 1, 0.8078431, 1,
-0.04224152, -0.3245586, -3.994792, 0, 1, 0.8156863, 1,
-0.04052595, 2.580318, 1.232079, 0, 1, 0.8196079, 1,
-0.04004698, 1.774532, 0.2894484, 0, 1, 0.827451, 1,
-0.03842299, 0.06436876, -0.9715854, 0, 1, 0.8313726, 1,
-0.03615139, 0.7418563, 0.2819333, 0, 1, 0.8392157, 1,
-0.02251425, 1.227909, 2.081968, 0, 1, 0.8431373, 1,
-0.0219661, 3.153567, -1.057673, 0, 1, 0.8509804, 1,
-0.02103194, -1.8905, -3.51147, 0, 1, 0.854902, 1,
-0.01985309, 0.2005255, -1.408939, 0, 1, 0.8627451, 1,
-0.01791662, 1.653547, -0.3877344, 0, 1, 0.8666667, 1,
-0.008782204, -0.5117956, -2.324384, 0, 1, 0.8745098, 1,
-0.004836439, 1.493176, -0.703855, 0, 1, 0.8784314, 1,
-0.002672374, -0.0878019, -3.244113, 0, 1, 0.8862745, 1,
0.00502792, 0.3632995, -0.09686811, 0, 1, 0.8901961, 1,
0.01099222, -0.1458242, 2.242603, 0, 1, 0.8980392, 1,
0.01203079, -1.036676, 1.366224, 0, 1, 0.9058824, 1,
0.01208504, 1.096361, 2.316692, 0, 1, 0.9098039, 1,
0.01665828, -0.9087749, 5.245285, 0, 1, 0.9176471, 1,
0.01713539, -1.036888, 3.424139, 0, 1, 0.9215686, 1,
0.01867705, 0.2196924, -0.7979398, 0, 1, 0.9294118, 1,
0.01986706, 0.6647493, 0.08317331, 0, 1, 0.9333333, 1,
0.02028966, -0.6287304, 2.324167, 0, 1, 0.9411765, 1,
0.02082871, -1.38744, 3.439543, 0, 1, 0.945098, 1,
0.02434871, -0.3759296, 3.179018, 0, 1, 0.9529412, 1,
0.02995929, 1.46291, -1.395613, 0, 1, 0.9568627, 1,
0.03084857, 1.71318, -0.5781834, 0, 1, 0.9647059, 1,
0.03112689, -0.8927541, 2.055362, 0, 1, 0.9686275, 1,
0.0373832, 0.3181638, 0.05066662, 0, 1, 0.9764706, 1,
0.04452755, -0.2806315, 2.697738, 0, 1, 0.9803922, 1,
0.04855207, -1.442645, 2.720514, 0, 1, 0.9882353, 1,
0.05507861, 0.905634, 1.757592, 0, 1, 0.9921569, 1,
0.06113631, 0.9885162, -0.08109496, 0, 1, 1, 1,
0.06127941, 1.293198, -0.2557688, 0, 0.9921569, 1, 1,
0.06191261, 0.9042994, -1.157111, 0, 0.9882353, 1, 1,
0.06402665, 0.432168, -0.3974308, 0, 0.9803922, 1, 1,
0.06989182, 0.3106409, 0.7375935, 0, 0.9764706, 1, 1,
0.07005987, -2.134017, 4.307342, 0, 0.9686275, 1, 1,
0.07225312, 0.7674323, 1.536749, 0, 0.9647059, 1, 1,
0.07398221, -0.2436458, 3.568714, 0, 0.9568627, 1, 1,
0.07784195, 1.388601, -0.1008961, 0, 0.9529412, 1, 1,
0.08213134, 0.8743853, -1.183705, 0, 0.945098, 1, 1,
0.08402736, 0.4119279, -0.6459185, 0, 0.9411765, 1, 1,
0.08433491, 0.1199932, 1.848882, 0, 0.9333333, 1, 1,
0.08513176, -0.743202, 3.778461, 0, 0.9294118, 1, 1,
0.0912498, 1.511503, 0.07754046, 0, 0.9215686, 1, 1,
0.0913968, 1.675934, -0.7725021, 0, 0.9176471, 1, 1,
0.09310336, 0.3111121, 1.0073, 0, 0.9098039, 1, 1,
0.0962647, 0.7911153, -0.3656885, 0, 0.9058824, 1, 1,
0.09687202, -0.7017074, 5.051747, 0, 0.8980392, 1, 1,
0.09750707, 1.344602, 0.4287434, 0, 0.8901961, 1, 1,
0.09954118, -0.8496301, 3.721224, 0, 0.8862745, 1, 1,
0.1015437, 1.722265, -0.7073562, 0, 0.8784314, 1, 1,
0.1059619, 0.568661, -0.701223, 0, 0.8745098, 1, 1,
0.1095551, -0.09415127, 0.758388, 0, 0.8666667, 1, 1,
0.121931, 1.259925, 0.08275083, 0, 0.8627451, 1, 1,
0.1222378, 0.453047, -0.5384371, 0, 0.854902, 1, 1,
0.1226667, -0.8210382, 2.166921, 0, 0.8509804, 1, 1,
0.1245653, 0.6309458, 0.4172927, 0, 0.8431373, 1, 1,
0.1258009, 1.845666, -0.2520504, 0, 0.8392157, 1, 1,
0.1308423, -0.03073224, 2.275489, 0, 0.8313726, 1, 1,
0.1313863, 0.9492516, -0.1649741, 0, 0.827451, 1, 1,
0.131734, 0.1976001, 2.404928, 0, 0.8196079, 1, 1,
0.1341506, 0.2862047, 0.5766561, 0, 0.8156863, 1, 1,
0.1392637, -0.04919922, 2.049234, 0, 0.8078431, 1, 1,
0.1419378, 0.1758339, 2.315978, 0, 0.8039216, 1, 1,
0.1422752, 0.7150339, 0.2451786, 0, 0.7960784, 1, 1,
0.1431192, -0.9986494, 3.917413, 0, 0.7882353, 1, 1,
0.1454134, -0.8873093, 2.539935, 0, 0.7843137, 1, 1,
0.1525666, 0.5395306, -0.4786638, 0, 0.7764706, 1, 1,
0.1534046, 1.589973, -0.6539958, 0, 0.772549, 1, 1,
0.1583304, -0.5184308, 2.481742, 0, 0.7647059, 1, 1,
0.1613889, -0.4994694, 3.0966, 0, 0.7607843, 1, 1,
0.1624312, 0.9513081, -0.193074, 0, 0.7529412, 1, 1,
0.1682948, -0.4294347, 1.80861, 0, 0.7490196, 1, 1,
0.1697639, 1.163357, -1.263632, 0, 0.7411765, 1, 1,
0.1710591, 0.3881365, 0.81871, 0, 0.7372549, 1, 1,
0.1740346, 0.1393819, 2.006414, 0, 0.7294118, 1, 1,
0.1803594, 1.509039, -0.3161936, 0, 0.7254902, 1, 1,
0.1822967, -0.1468104, 1.691278, 0, 0.7176471, 1, 1,
0.1881988, 1.12492, -0.1164707, 0, 0.7137255, 1, 1,
0.1883568, 0.03610995, -0.1628467, 0, 0.7058824, 1, 1,
0.1966575, 1.227337, 0.7830142, 0, 0.6980392, 1, 1,
0.1983156, -0.3955877, 2.811635, 0, 0.6941177, 1, 1,
0.1990607, 1.882693, 1.202957, 0, 0.6862745, 1, 1,
0.2005026, 0.2013496, -0.8763987, 0, 0.682353, 1, 1,
0.2086316, 0.3118036, 1.044798, 0, 0.6745098, 1, 1,
0.2117498, -0.3843016, 3.283762, 0, 0.6705883, 1, 1,
0.212154, 1.197749, -1.010831, 0, 0.6627451, 1, 1,
0.2128282, -0.3909939, 1.527506, 0, 0.6588235, 1, 1,
0.2143645, -0.4737848, 3.395435, 0, 0.6509804, 1, 1,
0.2147591, 1.157085, 1.056438, 0, 0.6470588, 1, 1,
0.2187937, -2.237329, 2.751104, 0, 0.6392157, 1, 1,
0.2198559, 0.5680791, 0.391848, 0, 0.6352941, 1, 1,
0.2227999, 0.1956792, 0.6048654, 0, 0.627451, 1, 1,
0.227155, 0.4688117, 0.9409668, 0, 0.6235294, 1, 1,
0.2284599, 0.7815796, -0.06965645, 0, 0.6156863, 1, 1,
0.230888, 1.124323, 0.2790022, 0, 0.6117647, 1, 1,
0.2320129, -1.7448, 3.450443, 0, 0.6039216, 1, 1,
0.2357826, 0.9380818, 0.6287638, 0, 0.5960785, 1, 1,
0.236431, 0.3065231, 0.8182832, 0, 0.5921569, 1, 1,
0.2378608, -0.2817618, 3.364625, 0, 0.5843138, 1, 1,
0.2394995, 0.05171512, 0.79662, 0, 0.5803922, 1, 1,
0.2410144, 0.1841688, 0.8505248, 0, 0.572549, 1, 1,
0.2418438, 1.739075, 0.5796859, 0, 0.5686275, 1, 1,
0.2426068, -0.6466077, 2.587969, 0, 0.5607843, 1, 1,
0.2460938, -1.540154, 1.665556, 0, 0.5568628, 1, 1,
0.2478881, -1.016953, 1.889001, 0, 0.5490196, 1, 1,
0.2500484, 0.05524528, 2.109199, 0, 0.5450981, 1, 1,
0.250814, 0.7185566, 1.402717, 0, 0.5372549, 1, 1,
0.2533576, 1.519681, -0.3512049, 0, 0.5333334, 1, 1,
0.2576524, -1.420877, 1.514213, 0, 0.5254902, 1, 1,
0.2577654, 1.09672, 0.9199844, 0, 0.5215687, 1, 1,
0.2620611, 0.01497683, 1.387807, 0, 0.5137255, 1, 1,
0.2631672, -0.1292641, 2.656071, 0, 0.509804, 1, 1,
0.2642323, -1.097, 4.646438, 0, 0.5019608, 1, 1,
0.2643798, -0.8870653, 1.8169, 0, 0.4941176, 1, 1,
0.2660027, -0.7259175, 3.083473, 0, 0.4901961, 1, 1,
0.2671268, -1.505948, 3.132024, 0, 0.4823529, 1, 1,
0.2692567, -0.9270504, 4.504366, 0, 0.4784314, 1, 1,
0.2754188, 0.8176677, 1.449995, 0, 0.4705882, 1, 1,
0.2765766, -1.336532, 2.447822, 0, 0.4666667, 1, 1,
0.2785904, -0.1617069, 1.715967, 0, 0.4588235, 1, 1,
0.2792428, 1.035467, 1.616371, 0, 0.454902, 1, 1,
0.2806022, -0.4829326, 4.936087, 0, 0.4470588, 1, 1,
0.2949601, -0.7601326, 2.191259, 0, 0.4431373, 1, 1,
0.2962551, 0.4593492, 0.6748903, 0, 0.4352941, 1, 1,
0.2980747, -1.022033, 0.904146, 0, 0.4313726, 1, 1,
0.3001178, 0.1031351, 0.2864645, 0, 0.4235294, 1, 1,
0.30164, -0.4813927, 2.431305, 0, 0.4196078, 1, 1,
0.3027021, -2.637321, 4.218861, 0, 0.4117647, 1, 1,
0.3050922, -0.9184746, 4.006709, 0, 0.4078431, 1, 1,
0.3054098, 1.57972, 0.6226307, 0, 0.4, 1, 1,
0.310012, 0.7249967, 1.477566, 0, 0.3921569, 1, 1,
0.3120293, 0.6185501, 1.971681, 0, 0.3882353, 1, 1,
0.312304, 0.1695244, 2.845048, 0, 0.3803922, 1, 1,
0.3143989, 0.0419571, 2.808709, 0, 0.3764706, 1, 1,
0.3163744, 0.961141, 0.7300748, 0, 0.3686275, 1, 1,
0.3173441, -1.46069, 1.392852, 0, 0.3647059, 1, 1,
0.3256429, -0.04740116, 2.306241, 0, 0.3568628, 1, 1,
0.3275588, 1.528865, -0.05707415, 0, 0.3529412, 1, 1,
0.3311526, 1.964561, 1.787772, 0, 0.345098, 1, 1,
0.331677, 1.493042, -1.597801, 0, 0.3411765, 1, 1,
0.3317275, -1.147356, 4.49427, 0, 0.3333333, 1, 1,
0.3393779, 0.7804394, 0.9775535, 0, 0.3294118, 1, 1,
0.3404826, 0.720242, 1.703188, 0, 0.3215686, 1, 1,
0.3415422, -0.5307102, 2.73888, 0, 0.3176471, 1, 1,
0.3457367, 0.5474109, 0.5565817, 0, 0.3098039, 1, 1,
0.3475346, -0.8854571, 0.8350542, 0, 0.3058824, 1, 1,
0.349436, 0.3715131, 1.541734, 0, 0.2980392, 1, 1,
0.354402, 1.064758, 0.6177141, 0, 0.2901961, 1, 1,
0.3549083, 1.116409, 1.664362, 0, 0.2862745, 1, 1,
0.356645, 0.1775317, 0.6046051, 0, 0.2784314, 1, 1,
0.3585641, 1.404705, -1.874575, 0, 0.2745098, 1, 1,
0.3601725, 0.3856574, 1.113643, 0, 0.2666667, 1, 1,
0.3669039, 1.253448, 2.067593, 0, 0.2627451, 1, 1,
0.3678215, 0.2706081, 1.786938, 0, 0.254902, 1, 1,
0.3695255, -0.8765334, -0.06158374, 0, 0.2509804, 1, 1,
0.3711578, 0.09290121, 1.61596, 0, 0.2431373, 1, 1,
0.3736229, 0.5728837, -0.4516222, 0, 0.2392157, 1, 1,
0.3753195, -0.5195065, 2.256219, 0, 0.2313726, 1, 1,
0.3765456, 0.9579993, 0.09173106, 0, 0.227451, 1, 1,
0.3820659, 0.4809173, -0.448707, 0, 0.2196078, 1, 1,
0.3871115, -1.866473, 3.636221, 0, 0.2156863, 1, 1,
0.3878888, -0.7078161, 2.718056, 0, 0.2078431, 1, 1,
0.3894324, 2.816731, 0.9669353, 0, 0.2039216, 1, 1,
0.3912457, 1.361239, -0.6399664, 0, 0.1960784, 1, 1,
0.3920079, -0.1997233, 0.5693199, 0, 0.1882353, 1, 1,
0.3932169, 0.8904117, -0.08758946, 0, 0.1843137, 1, 1,
0.3941858, 0.009820277, 1.706128, 0, 0.1764706, 1, 1,
0.3949045, 0.6044819, 0.5439994, 0, 0.172549, 1, 1,
0.3968266, 0.8250925, 0.3489653, 0, 0.1647059, 1, 1,
0.4013083, 0.3597581, 0.2956013, 0, 0.1607843, 1, 1,
0.402068, 0.3756416, 1.136486, 0, 0.1529412, 1, 1,
0.4021111, -1.825817, 3.932169, 0, 0.1490196, 1, 1,
0.4041235, 0.6864752, 0.9202, 0, 0.1411765, 1, 1,
0.4047361, 1.194186, 0.76707, 0, 0.1372549, 1, 1,
0.4052875, -1.315961, 3.880256, 0, 0.1294118, 1, 1,
0.4092957, -1.471045, 3.074857, 0, 0.1254902, 1, 1,
0.4099695, -1.468928, 1.219151, 0, 0.1176471, 1, 1,
0.410295, -1.337022, 1.399206, 0, 0.1137255, 1, 1,
0.4103459, -0.2928568, 3.07758, 0, 0.1058824, 1, 1,
0.4174565, 0.3171062, 0.4024432, 0, 0.09803922, 1, 1,
0.4220867, -1.376286, 1.560348, 0, 0.09411765, 1, 1,
0.4323328, 0.1023805, 2.645506, 0, 0.08627451, 1, 1,
0.4411533, -0.8123701, 2.410616, 0, 0.08235294, 1, 1,
0.4415058, 0.6887812, 0.2936209, 0, 0.07450981, 1, 1,
0.4425927, 0.5443982, 0.07615861, 0, 0.07058824, 1, 1,
0.443618, -1.257471, 3.295499, 0, 0.0627451, 1, 1,
0.4442042, 1.004883, 1.754452, 0, 0.05882353, 1, 1,
0.4442604, -1.679119, 0.9138152, 0, 0.05098039, 1, 1,
0.444544, -0.5195439, 1.711804, 0, 0.04705882, 1, 1,
0.44506, 0.6416291, 2.178629, 0, 0.03921569, 1, 1,
0.4497198, 0.1562528, -0.4115893, 0, 0.03529412, 1, 1,
0.4530275, 0.8124081, -0.6187209, 0, 0.02745098, 1, 1,
0.4566777, 1.127755, -0.07584883, 0, 0.02352941, 1, 1,
0.4618056, 0.9565369, -0.2949421, 0, 0.01568628, 1, 1,
0.4646572, -0.8456202, 2.550494, 0, 0.01176471, 1, 1,
0.47098, -1.187792, 3.183089, 0, 0.003921569, 1, 1,
0.4758853, 0.4261918, 0.6720862, 0.003921569, 0, 1, 1,
0.4763397, 0.4833774, -0.8683186, 0.007843138, 0, 1, 1,
0.4785987, -1.913125, 1.006267, 0.01568628, 0, 1, 1,
0.4804752, -1.410317, 5.584841, 0.01960784, 0, 1, 1,
0.4866672, 1.199103, 2.101026, 0.02745098, 0, 1, 1,
0.4878752, 2.933207, -0.6333095, 0.03137255, 0, 1, 1,
0.4908192, -1.001083, 1.584164, 0.03921569, 0, 1, 1,
0.4931765, 0.5175645, 1.09755, 0.04313726, 0, 1, 1,
0.4940038, -0.4991751, 1.539131, 0.05098039, 0, 1, 1,
0.4965675, -2.130675, 3.000071, 0.05490196, 0, 1, 1,
0.4987002, 0.2572973, 2.761758, 0.0627451, 0, 1, 1,
0.5018438, 0.8734498, -0.5368462, 0.06666667, 0, 1, 1,
0.5054069, 1.315294, 1.271312, 0.07450981, 0, 1, 1,
0.5061983, 1.017034, -0.1638535, 0.07843138, 0, 1, 1,
0.5078139, 0.2090335, 0.3751304, 0.08627451, 0, 1, 1,
0.511438, 1.150719, 1.966716, 0.09019608, 0, 1, 1,
0.5141158, -0.2078008, 1.54011, 0.09803922, 0, 1, 1,
0.5141506, -0.2679923, 0.968271, 0.1058824, 0, 1, 1,
0.5152069, 0.6385892, -0.1665071, 0.1098039, 0, 1, 1,
0.5164107, 0.6618147, 0.3780807, 0.1176471, 0, 1, 1,
0.518311, -0.7915214, 2.324983, 0.1215686, 0, 1, 1,
0.5304273, 0.8788078, -0.5697446, 0.1294118, 0, 1, 1,
0.5305373, 1.16968, 0.2870297, 0.1333333, 0, 1, 1,
0.5349669, 1.123636, -0.8068096, 0.1411765, 0, 1, 1,
0.542599, -0.6009198, 2.155953, 0.145098, 0, 1, 1,
0.5433137, -0.5006356, 1.398277, 0.1529412, 0, 1, 1,
0.5475094, -0.1995581, 0.7183022, 0.1568628, 0, 1, 1,
0.5529764, 0.603052, 1.106496, 0.1647059, 0, 1, 1,
0.557458, 0.3956854, -0.7269925, 0.1686275, 0, 1, 1,
0.5616257, 0.466855, 2.585425, 0.1764706, 0, 1, 1,
0.5620796, -0.6142358, 3.835364, 0.1803922, 0, 1, 1,
0.5693414, 0.6567523, 0.6692814, 0.1882353, 0, 1, 1,
0.5713179, 1.371728, -0.5188428, 0.1921569, 0, 1, 1,
0.5725834, 1.233314, 1.599466, 0.2, 0, 1, 1,
0.5730135, 1.006871, 0.9880704, 0.2078431, 0, 1, 1,
0.5730307, 0.960967, -1.64651, 0.2117647, 0, 1, 1,
0.5749882, -0.7888114, 3.713529, 0.2196078, 0, 1, 1,
0.5762757, -0.9787049, 3.695646, 0.2235294, 0, 1, 1,
0.5796549, 2.180264, 0.5499673, 0.2313726, 0, 1, 1,
0.5849541, -0.823399, 2.140508, 0.2352941, 0, 1, 1,
0.5867198, -0.1119089, 2.926502, 0.2431373, 0, 1, 1,
0.5891815, -0.366285, 2.341147, 0.2470588, 0, 1, 1,
0.5924588, -1.063492, 2.315208, 0.254902, 0, 1, 1,
0.5958732, -0.3731589, 1.445203, 0.2588235, 0, 1, 1,
0.5984051, 0.1116432, 2.061852, 0.2666667, 0, 1, 1,
0.6028861, -0.6989804, 3.157772, 0.2705882, 0, 1, 1,
0.606124, 0.1570364, 1.115989, 0.2784314, 0, 1, 1,
0.6085683, -1.190011, 3.055017, 0.282353, 0, 1, 1,
0.6123912, 1.144857, 1.186297, 0.2901961, 0, 1, 1,
0.6216034, -0.6985778, 1.909439, 0.2941177, 0, 1, 1,
0.6219562, 0.5907947, -0.7369661, 0.3019608, 0, 1, 1,
0.6276404, 0.7694495, 2.008023, 0.3098039, 0, 1, 1,
0.6343137, 0.3943534, 1.639503, 0.3137255, 0, 1, 1,
0.6398287, -0.6708188, 1.716421, 0.3215686, 0, 1, 1,
0.6492725, -0.126433, 2.07971, 0.3254902, 0, 1, 1,
0.65093, -0.1282431, 2.355474, 0.3333333, 0, 1, 1,
0.6526991, -1.906333, 3.384477, 0.3372549, 0, 1, 1,
0.6569415, 0.2310982, 0.197326, 0.345098, 0, 1, 1,
0.6578855, -1.582631, 2.217242, 0.3490196, 0, 1, 1,
0.6587908, 1.292845, -0.1144238, 0.3568628, 0, 1, 1,
0.6612523, 0.1807621, 1.317555, 0.3607843, 0, 1, 1,
0.6628368, -0.02268678, 1.494928, 0.3686275, 0, 1, 1,
0.6640573, 1.256383, 0.7318671, 0.372549, 0, 1, 1,
0.6678039, -0.09096252, 3.551585, 0.3803922, 0, 1, 1,
0.6689687, 1.777193, 0.2671882, 0.3843137, 0, 1, 1,
0.6697335, -1.037521, 1.863631, 0.3921569, 0, 1, 1,
0.6701699, -0.171354, 0.9742495, 0.3960784, 0, 1, 1,
0.6752159, -0.6235166, 3.281699, 0.4039216, 0, 1, 1,
0.6801332, 0.07610133, 2.414586, 0.4117647, 0, 1, 1,
0.680997, -0.430375, 2.519465, 0.4156863, 0, 1, 1,
0.681258, -1.402646, 2.493776, 0.4235294, 0, 1, 1,
0.6823047, 1.425499, -0.818092, 0.427451, 0, 1, 1,
0.6836595, -1.38049, 3.370058, 0.4352941, 0, 1, 1,
0.6858749, -2.073151, 1.303738, 0.4392157, 0, 1, 1,
0.6875769, -0.2414182, 1.921751, 0.4470588, 0, 1, 1,
0.6998752, -1.985815, 2.726671, 0.4509804, 0, 1, 1,
0.7032346, 0.5946143, 0.6690431, 0.4588235, 0, 1, 1,
0.7050284, -0.4634849, 3.860138, 0.4627451, 0, 1, 1,
0.7056078, 0.5443401, 0.04468998, 0.4705882, 0, 1, 1,
0.7059094, 0.5312067, 2.040183, 0.4745098, 0, 1, 1,
0.7147112, -0.5647998, 2.227958, 0.4823529, 0, 1, 1,
0.7149615, 1.034614, 1.465216, 0.4862745, 0, 1, 1,
0.7167543, 0.1519765, 1.32355, 0.4941176, 0, 1, 1,
0.7180925, -2.012559, 1.388259, 0.5019608, 0, 1, 1,
0.7185723, -0.9277312, 3.746816, 0.5058824, 0, 1, 1,
0.7223876, -0.02008804, 0.564563, 0.5137255, 0, 1, 1,
0.7224235, 1.911235, 1.32345, 0.5176471, 0, 1, 1,
0.7232993, 0.1559217, 0.8499124, 0.5254902, 0, 1, 1,
0.7270228, 0.3357028, -1.164697, 0.5294118, 0, 1, 1,
0.7286218, 1.292059, 0.4344857, 0.5372549, 0, 1, 1,
0.7360759, -2.227549, 2.00939, 0.5411765, 0, 1, 1,
0.7548281, 0.09376436, 0.9254958, 0.5490196, 0, 1, 1,
0.7548501, -1.72733, 1.248332, 0.5529412, 0, 1, 1,
0.7554168, -1.533427, 3.205129, 0.5607843, 0, 1, 1,
0.7559278, -1.139049, 3.071087, 0.5647059, 0, 1, 1,
0.758341, -0.6899151, 3.207032, 0.572549, 0, 1, 1,
0.7659397, 1.270004, -0.1564626, 0.5764706, 0, 1, 1,
0.7698759, 1.10815, -0.3109996, 0.5843138, 0, 1, 1,
0.7734289, -0.1040939, 0.9178129, 0.5882353, 0, 1, 1,
0.7744679, -0.2259614, 2.75632, 0.5960785, 0, 1, 1,
0.7768632, -0.1695066, 1.474561, 0.6039216, 0, 1, 1,
0.7784843, 0.2964715, 0.8698969, 0.6078432, 0, 1, 1,
0.7790685, 1.921653, 1.320371, 0.6156863, 0, 1, 1,
0.7840891, -0.2092724, 3.621742, 0.6196079, 0, 1, 1,
0.7844219, 2.036224, 1.914345, 0.627451, 0, 1, 1,
0.7867283, 0.9496768, 1.718645, 0.6313726, 0, 1, 1,
0.7874552, -0.6923592, 1.354558, 0.6392157, 0, 1, 1,
0.7896064, -1.294735, 4.015728, 0.6431373, 0, 1, 1,
0.7913811, 0.8592415, 0.7819164, 0.6509804, 0, 1, 1,
0.7920452, -1.610191, 3.315613, 0.654902, 0, 1, 1,
0.7945488, 0.6019209, 0.2772261, 0.6627451, 0, 1, 1,
0.7970482, -0.2227924, 2.515811, 0.6666667, 0, 1, 1,
0.7975769, -0.4004698, 1.974813, 0.6745098, 0, 1, 1,
0.8015501, -0.8102609, 1.753031, 0.6784314, 0, 1, 1,
0.8102691, -1.046381, 2.648565, 0.6862745, 0, 1, 1,
0.8115271, 0.718742, 2.42735, 0.6901961, 0, 1, 1,
0.819514, -0.5841422, 2.160684, 0.6980392, 0, 1, 1,
0.8231626, -0.03820919, 2.310964, 0.7058824, 0, 1, 1,
0.8232415, 0.8439165, 1.930582, 0.7098039, 0, 1, 1,
0.8257188, 1.13167, 0.01168277, 0.7176471, 0, 1, 1,
0.8284457, -0.4724978, 1.39044, 0.7215686, 0, 1, 1,
0.8317171, 1.252583, 0.2864395, 0.7294118, 0, 1, 1,
0.8378675, -0.6795607, 3.057509, 0.7333333, 0, 1, 1,
0.8398787, -0.5784082, 2.293858, 0.7411765, 0, 1, 1,
0.8407841, -1.694267, 3.817106, 0.7450981, 0, 1, 1,
0.8419808, -0.5892755, 1.384094, 0.7529412, 0, 1, 1,
0.8429003, 0.7773176, -0.217768, 0.7568628, 0, 1, 1,
0.8475618, 0.6198198, 0.7114298, 0.7647059, 0, 1, 1,
0.8577968, 0.7556088, 1.634116, 0.7686275, 0, 1, 1,
0.8665082, 0.5494516, 1.451977, 0.7764706, 0, 1, 1,
0.8668327, 0.8267484, 0.4853945, 0.7803922, 0, 1, 1,
0.8675203, -0.252062, 2.224461, 0.7882353, 0, 1, 1,
0.8730018, 1.149584, 1.269181, 0.7921569, 0, 1, 1,
0.8767549, -0.755747, 0.4125815, 0.8, 0, 1, 1,
0.8784364, -0.7799292, 2.473854, 0.8078431, 0, 1, 1,
0.8797117, 0.83086, -0.2591929, 0.8117647, 0, 1, 1,
0.8797434, 0.4484396, 1.602264, 0.8196079, 0, 1, 1,
0.8808982, -0.7122695, 2.487147, 0.8235294, 0, 1, 1,
0.8927114, -0.8527353, 3.984773, 0.8313726, 0, 1, 1,
0.8938158, 0.3416424, 0.5651112, 0.8352941, 0, 1, 1,
0.8995152, -1.202234, 4.144998, 0.8431373, 0, 1, 1,
0.900826, 0.3720396, 0.2557168, 0.8470588, 0, 1, 1,
0.9077421, -0.3958243, 1.511583, 0.854902, 0, 1, 1,
0.9092622, 0.5445272, -0.6884318, 0.8588235, 0, 1, 1,
0.9109258, 0.2814563, 2.283681, 0.8666667, 0, 1, 1,
0.9111705, -2.111772, 3.13638, 0.8705882, 0, 1, 1,
0.911288, -0.3218464, 3.657084, 0.8784314, 0, 1, 1,
0.918295, -0.2792739, 2.325459, 0.8823529, 0, 1, 1,
0.9215032, 0.1836469, -0.3803276, 0.8901961, 0, 1, 1,
0.9238595, 0.8390228, 1.41609, 0.8941177, 0, 1, 1,
0.9248238, 1.092968, 1.438477, 0.9019608, 0, 1, 1,
0.9256902, -0.1852394, 1.639114, 0.9098039, 0, 1, 1,
0.9278611, -1.406794, 1.597448, 0.9137255, 0, 1, 1,
0.9350277, 0.9512019, 0.9555905, 0.9215686, 0, 1, 1,
0.9365975, -0.01297971, 2.023847, 0.9254902, 0, 1, 1,
0.9387481, 1.679736, -0.4813762, 0.9333333, 0, 1, 1,
0.9427753, 1.270932, -0.1611905, 0.9372549, 0, 1, 1,
0.9476032, -0.3554908, 2.19488, 0.945098, 0, 1, 1,
0.9494002, 0.5813719, 2.356777, 0.9490196, 0, 1, 1,
0.9555504, -1.201257, 2.546557, 0.9568627, 0, 1, 1,
0.9646512, 0.3819855, 0.1652447, 0.9607843, 0, 1, 1,
0.9702997, -0.3937847, 2.178679, 0.9686275, 0, 1, 1,
0.9726567, 1.03494, 0.8907727, 0.972549, 0, 1, 1,
0.972842, 0.6598318, 1.072931, 0.9803922, 0, 1, 1,
0.9822942, 1.941602, 0.5372203, 0.9843137, 0, 1, 1,
0.9866204, -0.3519408, 2.495569, 0.9921569, 0, 1, 1,
0.990186, 1.006458, 0.9841717, 0.9960784, 0, 1, 1,
0.9905066, -1.996397, 1.230092, 1, 0, 0.9960784, 1,
0.9934962, -0.7560211, 1.394765, 1, 0, 0.9882353, 1,
1.008618, -0.6065966, 0.8433626, 1, 0, 0.9843137, 1,
1.008734, 0.1817332, 1.906526, 1, 0, 0.9764706, 1,
1.010167, -1.239199, 1.906643, 1, 0, 0.972549, 1,
1.015164, 1.109073, 2.280784, 1, 0, 0.9647059, 1,
1.017553, 0.4276685, 0.7373486, 1, 0, 0.9607843, 1,
1.019462, 0.7010272, -0.5945133, 1, 0, 0.9529412, 1,
1.027585, -0.9291368, 1.842715, 1, 0, 0.9490196, 1,
1.039478, -0.1769488, 0.8731743, 1, 0, 0.9411765, 1,
1.039821, 0.4667107, 1.037078, 1, 0, 0.9372549, 1,
1.043197, 0.531794, 1.083173, 1, 0, 0.9294118, 1,
1.049269, 1.214265, -0.5570035, 1, 0, 0.9254902, 1,
1.055154, -1.304256, 4.212648, 1, 0, 0.9176471, 1,
1.0582, -1.061701, 3.258712, 1, 0, 0.9137255, 1,
1.059297, -2.278709, 1.873913, 1, 0, 0.9058824, 1,
1.063656, 1.364584, 0.9798979, 1, 0, 0.9019608, 1,
1.065456, 1.898081, 0.06656234, 1, 0, 0.8941177, 1,
1.066518, 1.351937, 1.86908, 1, 0, 0.8862745, 1,
1.069241, -0.7930819, 1.29974, 1, 0, 0.8823529, 1,
1.07123, -0.8206273, 2.691686, 1, 0, 0.8745098, 1,
1.073051, -0.3871494, 0.715035, 1, 0, 0.8705882, 1,
1.075525, 0.020276, 2.231583, 1, 0, 0.8627451, 1,
1.080588, -1.138835, 3.742755, 1, 0, 0.8588235, 1,
1.086232, -0.1960976, 1.140449, 1, 0, 0.8509804, 1,
1.092868, -1.184142, 2.449762, 1, 0, 0.8470588, 1,
1.105183, -1.44666, 3.0286, 1, 0, 0.8392157, 1,
1.107158, -1.994899, 2.388757, 1, 0, 0.8352941, 1,
1.108396, -0.7263975, 3.047369, 1, 0, 0.827451, 1,
1.109582, -0.4598149, 0.6137493, 1, 0, 0.8235294, 1,
1.10993, -1.941169, 2.93342, 1, 0, 0.8156863, 1,
1.111965, -0.3399211, -1.363302, 1, 0, 0.8117647, 1,
1.11361, 0.6162224, -0.4605721, 1, 0, 0.8039216, 1,
1.113672, 0.6797023, 2.008552, 1, 0, 0.7960784, 1,
1.125288, 0.5970211, 0.1057082, 1, 0, 0.7921569, 1,
1.126198, 0.1255221, 0.6239548, 1, 0, 0.7843137, 1,
1.12766, -0.4609516, 2.121727, 1, 0, 0.7803922, 1,
1.137549, 0.9223948, 1.618611, 1, 0, 0.772549, 1,
1.144191, -1.204418, 0.7820725, 1, 0, 0.7686275, 1,
1.149083, -1.080234, 2.180494, 1, 0, 0.7607843, 1,
1.150557, 2.404703, 0.1620893, 1, 0, 0.7568628, 1,
1.150903, -0.2825267, -0.1655581, 1, 0, 0.7490196, 1,
1.155175, -1.60172, 2.295624, 1, 0, 0.7450981, 1,
1.159086, 1.008754, 0.5618352, 1, 0, 0.7372549, 1,
1.159303, 1.088443, 0.5749137, 1, 0, 0.7333333, 1,
1.170557, 0.5756643, 1.017589, 1, 0, 0.7254902, 1,
1.176426, -0.4285415, -0.3207922, 1, 0, 0.7215686, 1,
1.176889, -0.1610403, 1.832581, 1, 0, 0.7137255, 1,
1.178367, -0.9859558, 2.610924, 1, 0, 0.7098039, 1,
1.181531, 0.05369554, 3.570903, 1, 0, 0.7019608, 1,
1.191247, -1.375049, 2.73608, 1, 0, 0.6941177, 1,
1.195254, -0.2854953, 3.856231, 1, 0, 0.6901961, 1,
1.198143, 0.3104717, 0.8510646, 1, 0, 0.682353, 1,
1.198471, -1.716384, 1.776502, 1, 0, 0.6784314, 1,
1.202899, 1.230225, -0.7181046, 1, 0, 0.6705883, 1,
1.209722, 1.132702, -0.1630688, 1, 0, 0.6666667, 1,
1.214435, -0.1724333, 0.8241115, 1, 0, 0.6588235, 1,
1.219997, 1.182752, 0.3074934, 1, 0, 0.654902, 1,
1.221876, -1.239166, 2.158599, 1, 0, 0.6470588, 1,
1.226696, 1.412603, -0.3211973, 1, 0, 0.6431373, 1,
1.23388, -0.2836976, 1.022698, 1, 0, 0.6352941, 1,
1.234235, -1.211024, 1.380723, 1, 0, 0.6313726, 1,
1.245185, -1.530822, 2.757687, 1, 0, 0.6235294, 1,
1.255763, 1.189605, 1.467875, 1, 0, 0.6196079, 1,
1.266337, -0.4168216, 2.043753, 1, 0, 0.6117647, 1,
1.269138, -0.091311, 1.229731, 1, 0, 0.6078432, 1,
1.270286, 0.4633562, 0.8867403, 1, 0, 0.6, 1,
1.276929, 0.7707192, 0.3667799, 1, 0, 0.5921569, 1,
1.285834, 1.515494, 1.272795, 1, 0, 0.5882353, 1,
1.297724, 0.1832928, 1.532151, 1, 0, 0.5803922, 1,
1.312178, -0.09825369, 2.12775, 1, 0, 0.5764706, 1,
1.327614, 1.410217, 2.734431, 1, 0, 0.5686275, 1,
1.338244, -1.497789, 3.537165, 1, 0, 0.5647059, 1,
1.340544, -1.46113, 2.131655, 1, 0, 0.5568628, 1,
1.343141, 0.1294383, 1.588827, 1, 0, 0.5529412, 1,
1.351846, -0.03202753, 1.029911, 1, 0, 0.5450981, 1,
1.352952, 0.1399735, 2.718029, 1, 0, 0.5411765, 1,
1.354348, -0.9484612, 2.223216, 1, 0, 0.5333334, 1,
1.357762, 0.07825433, 2.023529, 1, 0, 0.5294118, 1,
1.361019, 0.6350905, 2.805611, 1, 0, 0.5215687, 1,
1.369647, -0.1186611, 2.207946, 1, 0, 0.5176471, 1,
1.371565, 0.4751076, 0.5436308, 1, 0, 0.509804, 1,
1.372741, -0.8718981, 2.324179, 1, 0, 0.5058824, 1,
1.374603, -0.7357721, 3.246208, 1, 0, 0.4980392, 1,
1.384271, -0.2572078, 0.6374771, 1, 0, 0.4901961, 1,
1.387137, 0.1243209, 1.87703, 1, 0, 0.4862745, 1,
1.389407, -0.8334298, 2.422828, 1, 0, 0.4784314, 1,
1.392761, 0.09796359, 2.738318, 1, 0, 0.4745098, 1,
1.393785, -2.593482, 2.345771, 1, 0, 0.4666667, 1,
1.393894, -0.7475598, 1.311351, 1, 0, 0.4627451, 1,
1.400077, -1.025427, 1.714345, 1, 0, 0.454902, 1,
1.412434, -0.6059836, 1.383405, 1, 0, 0.4509804, 1,
1.418127, 1.861183, -0.2209863, 1, 0, 0.4431373, 1,
1.428852, -0.645161, 3.256231, 1, 0, 0.4392157, 1,
1.449431, -0.2255847, 0.7377847, 1, 0, 0.4313726, 1,
1.465646, -1.261096, 2.37778, 1, 0, 0.427451, 1,
1.465907, 0.2087259, 2.047318, 1, 0, 0.4196078, 1,
1.470454, -0.09102908, 2.229938, 1, 0, 0.4156863, 1,
1.472157, -0.4766767, 0.3149801, 1, 0, 0.4078431, 1,
1.478845, 0.8390236, 1.691666, 1, 0, 0.4039216, 1,
1.479648, -0.2597414, 0.7887986, 1, 0, 0.3960784, 1,
1.479817, 0.761303, 0.2308692, 1, 0, 0.3882353, 1,
1.485987, -0.9245679, 0.391932, 1, 0, 0.3843137, 1,
1.48904, 0.5742882, 0.8236857, 1, 0, 0.3764706, 1,
1.495552, 1.946653, 0.1621145, 1, 0, 0.372549, 1,
1.500948, 0.1786218, 1.29903, 1, 0, 0.3647059, 1,
1.501805, 1.03344, 2.060854, 1, 0, 0.3607843, 1,
1.504803, -0.6447434, 2.117643, 1, 0, 0.3529412, 1,
1.508712, 1.009263, 1.206933, 1, 0, 0.3490196, 1,
1.525468, 0.1828797, 0.7898149, 1, 0, 0.3411765, 1,
1.529821, 1.605928, 2.490456, 1, 0, 0.3372549, 1,
1.550756, 0.3576993, 1.453188, 1, 0, 0.3294118, 1,
1.552597, 1.247702, 2.205145, 1, 0, 0.3254902, 1,
1.562211, 0.3222637, 0.1623139, 1, 0, 0.3176471, 1,
1.56414, 1.012973, 2.211999, 1, 0, 0.3137255, 1,
1.567057, 0.4070093, 2.266973, 1, 0, 0.3058824, 1,
1.597359, -0.2651023, 0.3640952, 1, 0, 0.2980392, 1,
1.605419, -0.7256026, 2.551188, 1, 0, 0.2941177, 1,
1.612516, 0.2771463, 1.148489, 1, 0, 0.2862745, 1,
1.620677, -0.6434075, 2.808305, 1, 0, 0.282353, 1,
1.629655, 0.07017897, -0.5382331, 1, 0, 0.2745098, 1,
1.632298, 0.6561367, 0.9937316, 1, 0, 0.2705882, 1,
1.650397, 0.6589846, 1.156959, 1, 0, 0.2627451, 1,
1.662504, 0.1739845, 1.01442, 1, 0, 0.2588235, 1,
1.672236, -0.6488152, 1.401708, 1, 0, 0.2509804, 1,
1.684461, 0.2827248, 0.7431937, 1, 0, 0.2470588, 1,
1.688259, -1.96146, 2.476827, 1, 0, 0.2392157, 1,
1.702988, 1.152821, -0.1551444, 1, 0, 0.2352941, 1,
1.705968, -0.7972449, 3.973823, 1, 0, 0.227451, 1,
1.764585, -0.1484945, 2.410107, 1, 0, 0.2235294, 1,
1.778225, 0.903949, 0.971029, 1, 0, 0.2156863, 1,
1.792971, -0.406946, 2.596036, 1, 0, 0.2117647, 1,
1.797564, 0.5494776, 2.028568, 1, 0, 0.2039216, 1,
1.798453, -1.86817, 1.394377, 1, 0, 0.1960784, 1,
1.799093, 0.2624475, 3.031837, 1, 0, 0.1921569, 1,
1.827641, -1.199654, 2.775009, 1, 0, 0.1843137, 1,
1.832205, -0.3346825, 0.3633904, 1, 0, 0.1803922, 1,
1.832788, -0.1686172, 3.922983, 1, 0, 0.172549, 1,
1.83789, 0.4758915, 1.676279, 1, 0, 0.1686275, 1,
1.878538, 0.3371356, 0.5790608, 1, 0, 0.1607843, 1,
1.8788, 1.975893, 0.09136645, 1, 0, 0.1568628, 1,
1.899536, -2.229718, 2.686369, 1, 0, 0.1490196, 1,
1.944771, 0.08137213, 1.851889, 1, 0, 0.145098, 1,
1.961326, 1.179855, 1.121726, 1, 0, 0.1372549, 1,
1.966757, -0.7664449, 1.555216, 1, 0, 0.1333333, 1,
1.966959, 0.5533679, 1.98599, 1, 0, 0.1254902, 1,
1.98684, 0.7642913, 2.415396, 1, 0, 0.1215686, 1,
2.030823, -0.586781, 3.391286, 1, 0, 0.1137255, 1,
2.086236, 0.6466438, 0.9179822, 1, 0, 0.1098039, 1,
2.107636, 0.9270056, 0.33322, 1, 0, 0.1019608, 1,
2.141519, 0.7304031, 1.052362, 1, 0, 0.09411765, 1,
2.160014, 1.294279, 1.142186, 1, 0, 0.09019608, 1,
2.252954, -1.65968, 2.87686, 1, 0, 0.08235294, 1,
2.276804, -0.1028802, 2.249728, 1, 0, 0.07843138, 1,
2.325053, 0.5348197, 2.713526, 1, 0, 0.07058824, 1,
2.343906, -0.5052184, 1.597152, 1, 0, 0.06666667, 1,
2.527679, 0.7380198, 2.104749, 1, 0, 0.05882353, 1,
2.55715, 0.2158344, 1.193045, 1, 0, 0.05490196, 1,
2.608402, 0.612789, -0.3151036, 1, 0, 0.04705882, 1,
2.705856, 1.30495, 0.3004211, 1, 0, 0.04313726, 1,
2.737906, 0.8214181, 1.682665, 1, 0, 0.03529412, 1,
2.755992, 1.846487, 1.473612, 1, 0, 0.03137255, 1,
2.818403, -1.469356, 3.807536, 1, 0, 0.02352941, 1,
2.877817, 0.08453734, 1.749708, 1, 0, 0.01960784, 1,
3.167938, -0.7843862, 2.750977, 1, 0, 0.01176471, 1,
3.279874, 0.05782482, 2.375985, 1, 0, 0.007843138, 1
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
0.1182129, -3.618876, -6.642139, 0, -0.5, 0.5, 0.5,
0.1182129, -3.618876, -6.642139, 1, -0.5, 0.5, 0.5,
0.1182129, -3.618876, -6.642139, 1, 1.5, 0.5, 0.5,
0.1182129, -3.618876, -6.642139, 0, 1.5, 0.5, 0.5
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
-4.115251, 0.2581228, -6.642139, 0, -0.5, 0.5, 0.5,
-4.115251, 0.2581228, -6.642139, 1, -0.5, 0.5, 0.5,
-4.115251, 0.2581228, -6.642139, 1, 1.5, 0.5, 0.5,
-4.115251, 0.2581228, -6.642139, 0, 1.5, 0.5, 0.5
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
-4.115251, -3.618876, 0.3574016, 0, -0.5, 0.5, 0.5,
-4.115251, -3.618876, 0.3574016, 1, -0.5, 0.5, 0.5,
-4.115251, -3.618876, 0.3574016, 1, 1.5, 0.5, 0.5,
-4.115251, -3.618876, 0.3574016, 0, 1.5, 0.5, 0.5
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
-3, -2.724184, -5.026861,
3, -2.724184, -5.026861,
-3, -2.724184, -5.026861,
-3, -2.8733, -5.296074,
-2, -2.724184, -5.026861,
-2, -2.8733, -5.296074,
-1, -2.724184, -5.026861,
-1, -2.8733, -5.296074,
0, -2.724184, -5.026861,
0, -2.8733, -5.296074,
1, -2.724184, -5.026861,
1, -2.8733, -5.296074,
2, -2.724184, -5.026861,
2, -2.8733, -5.296074,
3, -2.724184, -5.026861,
3, -2.8733, -5.296074
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
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
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
-3, -3.17153, -5.8345, 0, -0.5, 0.5, 0.5,
-3, -3.17153, -5.8345, 1, -0.5, 0.5, 0.5,
-3, -3.17153, -5.8345, 1, 1.5, 0.5, 0.5,
-3, -3.17153, -5.8345, 0, 1.5, 0.5, 0.5,
-2, -3.17153, -5.8345, 0, -0.5, 0.5, 0.5,
-2, -3.17153, -5.8345, 1, -0.5, 0.5, 0.5,
-2, -3.17153, -5.8345, 1, 1.5, 0.5, 0.5,
-2, -3.17153, -5.8345, 0, 1.5, 0.5, 0.5,
-1, -3.17153, -5.8345, 0, -0.5, 0.5, 0.5,
-1, -3.17153, -5.8345, 1, -0.5, 0.5, 0.5,
-1, -3.17153, -5.8345, 1, 1.5, 0.5, 0.5,
-1, -3.17153, -5.8345, 0, 1.5, 0.5, 0.5,
0, -3.17153, -5.8345, 0, -0.5, 0.5, 0.5,
0, -3.17153, -5.8345, 1, -0.5, 0.5, 0.5,
0, -3.17153, -5.8345, 1, 1.5, 0.5, 0.5,
0, -3.17153, -5.8345, 0, 1.5, 0.5, 0.5,
1, -3.17153, -5.8345, 0, -0.5, 0.5, 0.5,
1, -3.17153, -5.8345, 1, -0.5, 0.5, 0.5,
1, -3.17153, -5.8345, 1, 1.5, 0.5, 0.5,
1, -3.17153, -5.8345, 0, 1.5, 0.5, 0.5,
2, -3.17153, -5.8345, 0, -0.5, 0.5, 0.5,
2, -3.17153, -5.8345, 1, -0.5, 0.5, 0.5,
2, -3.17153, -5.8345, 1, 1.5, 0.5, 0.5,
2, -3.17153, -5.8345, 0, 1.5, 0.5, 0.5,
3, -3.17153, -5.8345, 0, -0.5, 0.5, 0.5,
3, -3.17153, -5.8345, 1, -0.5, 0.5, 0.5,
3, -3.17153, -5.8345, 1, 1.5, 0.5, 0.5,
3, -3.17153, -5.8345, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
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
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
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
-3.138298, -2, -5.026861,
-3.138298, 3, -5.026861,
-3.138298, -2, -5.026861,
-3.301123, -2, -5.296074,
-3.138298, -1, -5.026861,
-3.301123, -1, -5.296074,
-3.138298, 0, -5.026861,
-3.301123, 0, -5.296074,
-3.138298, 1, -5.026861,
-3.301123, 1, -5.296074,
-3.138298, 2, -5.026861,
-3.301123, 2, -5.296074,
-3.138298, 3, -5.026861,
-3.301123, 3, -5.296074
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
"-2",
"-1",
"0",
"1",
"2",
"3"
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
-3.626774, -2, -5.8345, 0, -0.5, 0.5, 0.5,
-3.626774, -2, -5.8345, 1, -0.5, 0.5, 0.5,
-3.626774, -2, -5.8345, 1, 1.5, 0.5, 0.5,
-3.626774, -2, -5.8345, 0, 1.5, 0.5, 0.5,
-3.626774, -1, -5.8345, 0, -0.5, 0.5, 0.5,
-3.626774, -1, -5.8345, 1, -0.5, 0.5, 0.5,
-3.626774, -1, -5.8345, 1, 1.5, 0.5, 0.5,
-3.626774, -1, -5.8345, 0, 1.5, 0.5, 0.5,
-3.626774, 0, -5.8345, 0, -0.5, 0.5, 0.5,
-3.626774, 0, -5.8345, 1, -0.5, 0.5, 0.5,
-3.626774, 0, -5.8345, 1, 1.5, 0.5, 0.5,
-3.626774, 0, -5.8345, 0, 1.5, 0.5, 0.5,
-3.626774, 1, -5.8345, 0, -0.5, 0.5, 0.5,
-3.626774, 1, -5.8345, 1, -0.5, 0.5, 0.5,
-3.626774, 1, -5.8345, 1, 1.5, 0.5, 0.5,
-3.626774, 1, -5.8345, 0, 1.5, 0.5, 0.5,
-3.626774, 2, -5.8345, 0, -0.5, 0.5, 0.5,
-3.626774, 2, -5.8345, 1, -0.5, 0.5, 0.5,
-3.626774, 2, -5.8345, 1, 1.5, 0.5, 0.5,
-3.626774, 2, -5.8345, 0, 1.5, 0.5, 0.5,
-3.626774, 3, -5.8345, 0, -0.5, 0.5, 0.5,
-3.626774, 3, -5.8345, 1, -0.5, 0.5, 0.5,
-3.626774, 3, -5.8345, 1, 1.5, 0.5, 0.5,
-3.626774, 3, -5.8345, 0, 1.5, 0.5, 0.5
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
-3.138298, -2.724184, -4,
-3.138298, -2.724184, 4,
-3.138298, -2.724184, -4,
-3.301123, -2.8733, -4,
-3.138298, -2.724184, -2,
-3.301123, -2.8733, -2,
-3.138298, -2.724184, 0,
-3.301123, -2.8733, 0,
-3.138298, -2.724184, 2,
-3.301123, -2.8733, 2,
-3.138298, -2.724184, 4,
-3.301123, -2.8733, 4
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
-3.626774, -3.17153, -4, 0, -0.5, 0.5, 0.5,
-3.626774, -3.17153, -4, 1, -0.5, 0.5, 0.5,
-3.626774, -3.17153, -4, 1, 1.5, 0.5, 0.5,
-3.626774, -3.17153, -4, 0, 1.5, 0.5, 0.5,
-3.626774, -3.17153, -2, 0, -0.5, 0.5, 0.5,
-3.626774, -3.17153, -2, 1, -0.5, 0.5, 0.5,
-3.626774, -3.17153, -2, 1, 1.5, 0.5, 0.5,
-3.626774, -3.17153, -2, 0, 1.5, 0.5, 0.5,
-3.626774, -3.17153, 0, 0, -0.5, 0.5, 0.5,
-3.626774, -3.17153, 0, 1, -0.5, 0.5, 0.5,
-3.626774, -3.17153, 0, 1, 1.5, 0.5, 0.5,
-3.626774, -3.17153, 0, 0, 1.5, 0.5, 0.5,
-3.626774, -3.17153, 2, 0, -0.5, 0.5, 0.5,
-3.626774, -3.17153, 2, 1, -0.5, 0.5, 0.5,
-3.626774, -3.17153, 2, 1, 1.5, 0.5, 0.5,
-3.626774, -3.17153, 2, 0, 1.5, 0.5, 0.5,
-3.626774, -3.17153, 4, 0, -0.5, 0.5, 0.5,
-3.626774, -3.17153, 4, 1, -0.5, 0.5, 0.5,
-3.626774, -3.17153, 4, 1, 1.5, 0.5, 0.5,
-3.626774, -3.17153, 4, 0, 1.5, 0.5, 0.5
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
-3.138298, -2.724184, -5.026861,
-3.138298, 3.24043, -5.026861,
-3.138298, -2.724184, 5.741664,
-3.138298, 3.24043, 5.741664,
-3.138298, -2.724184, -5.026861,
-3.138298, -2.724184, 5.741664,
-3.138298, 3.24043, -5.026861,
-3.138298, 3.24043, 5.741664,
-3.138298, -2.724184, -5.026861,
3.374723, -2.724184, -5.026861,
-3.138298, -2.724184, 5.741664,
3.374723, -2.724184, 5.741664,
-3.138298, 3.24043, -5.026861,
3.374723, 3.24043, -5.026861,
-3.138298, 3.24043, 5.741664,
3.374723, 3.24043, 5.741664,
3.374723, -2.724184, -5.026861,
3.374723, 3.24043, -5.026861,
3.374723, -2.724184, 5.741664,
3.374723, 3.24043, 5.741664,
3.374723, -2.724184, -5.026861,
3.374723, -2.724184, 5.741664,
3.374723, 3.24043, -5.026861,
3.374723, 3.24043, 5.741664
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
var radius = 7.436668;
var distance = 33.08657;
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
mvMatrix.translate( -0.1182129, -0.2581228, -0.3574016 );
mvMatrix.scale( 1.234553, 1.348062, 0.7466827 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.08657);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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


