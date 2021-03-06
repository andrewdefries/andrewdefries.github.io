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
-3.316425, 0.4902325, -1.367056, 1, 0, 0, 1,
-3.279455, 0.7113643, -0.6609166, 1, 0.007843138, 0, 1,
-2.654583, -1.139303, -1.902178, 1, 0.01176471, 0, 1,
-2.514867, 0.5178676, -3.136229, 1, 0.01960784, 0, 1,
-2.479242, 0.740545, -1.098607, 1, 0.02352941, 0, 1,
-2.462189, 2.190157, 0.3261059, 1, 0.03137255, 0, 1,
-2.243638, -0.02889621, 0.4437242, 1, 0.03529412, 0, 1,
-2.226855, 0.08631326, -2.021324, 1, 0.04313726, 0, 1,
-2.225551, 0.5992907, -1.352252, 1, 0.04705882, 0, 1,
-2.195771, -0.7288316, -2.633448, 1, 0.05490196, 0, 1,
-2.149405, 0.8780853, -0.9987578, 1, 0.05882353, 0, 1,
-2.114362, -0.3649685, -1.357834, 1, 0.06666667, 0, 1,
-2.082756, 0.1203117, 0.1638899, 1, 0.07058824, 0, 1,
-2.061129, -0.4797601, 1.163502, 1, 0.07843138, 0, 1,
-2.043751, 0.9231322, -1.687181, 1, 0.08235294, 0, 1,
-2.041298, 0.6057466, -2.220663, 1, 0.09019608, 0, 1,
-2.032374, 0.19957, -0.35184, 1, 0.09411765, 0, 1,
-1.970916, -0.739661, -2.091791, 1, 0.1019608, 0, 1,
-1.947114, 2.638407, -1.63676, 1, 0.1098039, 0, 1,
-1.946571, -2.372229, -2.423794, 1, 0.1137255, 0, 1,
-1.942267, 1.986278, 1.134556, 1, 0.1215686, 0, 1,
-1.94033, -0.8975763, -1.829541, 1, 0.1254902, 0, 1,
-1.937802, -0.1278162, -1.660445, 1, 0.1333333, 0, 1,
-1.932284, -0.9939781, -2.293484, 1, 0.1372549, 0, 1,
-1.929245, -1.616997, -1.517652, 1, 0.145098, 0, 1,
-1.92923, 1.233273, -2.248302, 1, 0.1490196, 0, 1,
-1.916337, -0.5289489, -3.08716, 1, 0.1568628, 0, 1,
-1.839434, -0.954737, -2.242328, 1, 0.1607843, 0, 1,
-1.809113, 0.2026777, -1.220703, 1, 0.1686275, 0, 1,
-1.805409, -0.7365533, -0.01671368, 1, 0.172549, 0, 1,
-1.761316, -0.986316, -1.369471, 1, 0.1803922, 0, 1,
-1.757885, -1.100494, -2.216172, 1, 0.1843137, 0, 1,
-1.75696, -0.7070113, -0.8391165, 1, 0.1921569, 0, 1,
-1.748015, -1.723908, -1.591314, 1, 0.1960784, 0, 1,
-1.742816, 0.3896907, -1.237714, 1, 0.2039216, 0, 1,
-1.724408, 0.5595393, -0.8006456, 1, 0.2117647, 0, 1,
-1.721229, -0.4506501, -1.779632, 1, 0.2156863, 0, 1,
-1.715078, 0.3364561, -2.104543, 1, 0.2235294, 0, 1,
-1.713154, 0.0356666, -2.292683, 1, 0.227451, 0, 1,
-1.711648, 1.51451, -1.700344, 1, 0.2352941, 0, 1,
-1.697908, -0.5390159, -1.346844, 1, 0.2392157, 0, 1,
-1.679718, 2.369686, -0.4226389, 1, 0.2470588, 0, 1,
-1.673246, -0.2817937, -3.686039, 1, 0.2509804, 0, 1,
-1.663072, 0.5097639, -1.607542, 1, 0.2588235, 0, 1,
-1.661091, 0.4818214, 0.5569925, 1, 0.2627451, 0, 1,
-1.646479, 0.6545022, -1.440654, 1, 0.2705882, 0, 1,
-1.632485, -0.09544034, -2.036917, 1, 0.2745098, 0, 1,
-1.626501, -0.7430589, -0.4786736, 1, 0.282353, 0, 1,
-1.619429, -0.7729063, -3.392919, 1, 0.2862745, 0, 1,
-1.616471, -0.1313671, -0.799885, 1, 0.2941177, 0, 1,
-1.604976, -0.3270981, -1.31381, 1, 0.3019608, 0, 1,
-1.602724, -0.3859519, -1.425697, 1, 0.3058824, 0, 1,
-1.569771, -0.8724578, -2.210843, 1, 0.3137255, 0, 1,
-1.541496, 1.169041, -1.755309, 1, 0.3176471, 0, 1,
-1.54111, 1.636105, -1.239062, 1, 0.3254902, 0, 1,
-1.537781, 1.505945, -1.301021, 1, 0.3294118, 0, 1,
-1.53571, 0.04494502, -2.146845, 1, 0.3372549, 0, 1,
-1.529256, 0.5534755, -1.683815, 1, 0.3411765, 0, 1,
-1.519311, -1.611971, -1.629112, 1, 0.3490196, 0, 1,
-1.51381, -1.969755, -1.527112, 1, 0.3529412, 0, 1,
-1.512322, 1.393883, 0.3370577, 1, 0.3607843, 0, 1,
-1.503178, -1.183158, -1.658433, 1, 0.3647059, 0, 1,
-1.494748, -1.491038, -2.721189, 1, 0.372549, 0, 1,
-1.493645, -0.9353855, -2.019058, 1, 0.3764706, 0, 1,
-1.485617, 0.8811743, -1.895023, 1, 0.3843137, 0, 1,
-1.485399, -0.9733964, -1.629653, 1, 0.3882353, 0, 1,
-1.485332, -0.9116467, -3.532028, 1, 0.3960784, 0, 1,
-1.47429, 0.6723592, 1.557955, 1, 0.4039216, 0, 1,
-1.473054, -2.606753, -2.365257, 1, 0.4078431, 0, 1,
-1.449872, 0.3118099, -0.3645945, 1, 0.4156863, 0, 1,
-1.446022, 0.7057308, -1.84615, 1, 0.4196078, 0, 1,
-1.445338, -0.8553007, -1.617418, 1, 0.427451, 0, 1,
-1.436959, 0.9192107, 0.1683959, 1, 0.4313726, 0, 1,
-1.43141, -0.9675254, -2.696705, 1, 0.4392157, 0, 1,
-1.422248, 0.6024819, -0.01944874, 1, 0.4431373, 0, 1,
-1.415196, 0.0336691, 0.1124803, 1, 0.4509804, 0, 1,
-1.398746, 0.4633857, -0.5810726, 1, 0.454902, 0, 1,
-1.394351, 0.09421724, -1.324044, 1, 0.4627451, 0, 1,
-1.383987, 0.6262227, -1.281026, 1, 0.4666667, 0, 1,
-1.38039, 0.2201247, -0.2192208, 1, 0.4745098, 0, 1,
-1.379573, 0.1145401, -1.433558, 1, 0.4784314, 0, 1,
-1.375018, -1.554005, -1.860676, 1, 0.4862745, 0, 1,
-1.371939, 0.7719661, -0.1300178, 1, 0.4901961, 0, 1,
-1.365354, 0.3378174, -1.131208, 1, 0.4980392, 0, 1,
-1.359243, 1.058832, -0.621776, 1, 0.5058824, 0, 1,
-1.358979, 1.145249, -1.437212, 1, 0.509804, 0, 1,
-1.35776, -0.9582933, -3.080282, 1, 0.5176471, 0, 1,
-1.352313, -0.8529477, -0.9633382, 1, 0.5215687, 0, 1,
-1.350516, 0.07172045, -1.023947, 1, 0.5294118, 0, 1,
-1.346784, 0.7301078, -2.23111, 1, 0.5333334, 0, 1,
-1.343091, 1.248764, -0.3149182, 1, 0.5411765, 0, 1,
-1.336285, -1.077045, -1.630431, 1, 0.5450981, 0, 1,
-1.330172, -1.010268, -3.778564, 1, 0.5529412, 0, 1,
-1.315413, 0.8431447, -0.6148839, 1, 0.5568628, 0, 1,
-1.313656, 0.1777701, -1.73202, 1, 0.5647059, 0, 1,
-1.310054, 1.944106, 0.03538575, 1, 0.5686275, 0, 1,
-1.309448, 0.8773475, -0.9730386, 1, 0.5764706, 0, 1,
-1.298033, 1.720562, 0.2614055, 1, 0.5803922, 0, 1,
-1.274305, -0.3071097, -2.516176, 1, 0.5882353, 0, 1,
-1.27196, 1.690157, -0.3016384, 1, 0.5921569, 0, 1,
-1.270563, 1.370991, -0.7414181, 1, 0.6, 0, 1,
-1.264185, 1.713469, 1.050716, 1, 0.6078432, 0, 1,
-1.263858, -0.1339324, -2.003872, 1, 0.6117647, 0, 1,
-1.260965, 0.365214, -1.382529, 1, 0.6196079, 0, 1,
-1.25179, 0.9267709, -2.268455, 1, 0.6235294, 0, 1,
-1.250816, -0.6651006, -2.351262, 1, 0.6313726, 0, 1,
-1.249757, 0.4256164, -0.1292073, 1, 0.6352941, 0, 1,
-1.245459, 0.3176826, -1.075322, 1, 0.6431373, 0, 1,
-1.244005, -0.6042272, -1.537793, 1, 0.6470588, 0, 1,
-1.241479, -0.3573551, -2.636054, 1, 0.654902, 0, 1,
-1.235778, 1.902917, -1.785373, 1, 0.6588235, 0, 1,
-1.231935, 0.1171019, -1.649691, 1, 0.6666667, 0, 1,
-1.222553, -0.2068601, -3.605335, 1, 0.6705883, 0, 1,
-1.219337, -0.8887339, -1.25683, 1, 0.6784314, 0, 1,
-1.200481, -0.3162865, -1.997732, 1, 0.682353, 0, 1,
-1.195909, 0.1175665, -2.384319, 1, 0.6901961, 0, 1,
-1.195012, 1.561157, -0.3599987, 1, 0.6941177, 0, 1,
-1.187796, 0.2055009, -0.6593169, 1, 0.7019608, 0, 1,
-1.181532, -1.089824, -2.19975, 1, 0.7098039, 0, 1,
-1.179684, 0.5859604, -2.59259, 1, 0.7137255, 0, 1,
-1.176257, 0.286882, -3.190451, 1, 0.7215686, 0, 1,
-1.169997, -0.5739452, -0.7132992, 1, 0.7254902, 0, 1,
-1.16622, -1.49459, -1.546226, 1, 0.7333333, 0, 1,
-1.159433, 0.1190822, -1.905524, 1, 0.7372549, 0, 1,
-1.147362, 0.2984559, 0.3422437, 1, 0.7450981, 0, 1,
-1.144204, 0.5299081, -0.8749949, 1, 0.7490196, 0, 1,
-1.143748, 0.4070205, 0.2155634, 1, 0.7568628, 0, 1,
-1.141794, 0.6626742, -1.307275, 1, 0.7607843, 0, 1,
-1.119968, 0.3926814, -0.9445918, 1, 0.7686275, 0, 1,
-1.114263, -0.6561769, -3.63449, 1, 0.772549, 0, 1,
-1.103333, -0.5705878, -1.869907, 1, 0.7803922, 0, 1,
-1.075728, -1.652732, -2.188015, 1, 0.7843137, 0, 1,
-1.074915, 0.6067641, -2.760128, 1, 0.7921569, 0, 1,
-1.073895, 1.236449, -1.558232, 1, 0.7960784, 0, 1,
-1.072744, 0.3768664, -0.5104278, 1, 0.8039216, 0, 1,
-1.071825, -1.007749, -2.391103, 1, 0.8117647, 0, 1,
-1.066949, 0.5871888, -2.222895, 1, 0.8156863, 0, 1,
-1.058976, 1.391771, -2.248952, 1, 0.8235294, 0, 1,
-1.051365, -0.4526193, -3.30895, 1, 0.827451, 0, 1,
-1.05134, -1.118175, -2.992665, 1, 0.8352941, 0, 1,
-1.046555, -0.5927424, -2.084229, 1, 0.8392157, 0, 1,
-1.045322, 1.015963, -0.8604564, 1, 0.8470588, 0, 1,
-1.043946, 1.050104, -1.32707, 1, 0.8509804, 0, 1,
-1.043476, -2.023859, -1.091161, 1, 0.8588235, 0, 1,
-1.040567, -1.532245, -2.37501, 1, 0.8627451, 0, 1,
-1.036677, -0.7924148, -1.317443, 1, 0.8705882, 0, 1,
-1.035768, 0.2643687, -1.959603, 1, 0.8745098, 0, 1,
-1.034782, -0.7799517, -2.732219, 1, 0.8823529, 0, 1,
-1.031641, 1.116581, -1.989344, 1, 0.8862745, 0, 1,
-1.029743, -1.386963, -0.5801435, 1, 0.8941177, 0, 1,
-1.026015, -1.104964, -2.403961, 1, 0.8980392, 0, 1,
-1.023676, 0.07539164, -1.324169, 1, 0.9058824, 0, 1,
-1.02306, 0.543007, -0.3600041, 1, 0.9137255, 0, 1,
-1.020015, 0.3444183, -1.690933, 1, 0.9176471, 0, 1,
-1.019504, 1.140247, -1.172048, 1, 0.9254902, 0, 1,
-1.017021, -0.9788267, -2.206277, 1, 0.9294118, 0, 1,
-1.006156, -0.05562471, -0.1790955, 1, 0.9372549, 0, 1,
-1.00562, 0.9492696, -1.09202, 1, 0.9411765, 0, 1,
-1.003813, -0.6214641, -1.852602, 1, 0.9490196, 0, 1,
-1.001835, 0.7397051, 1.02986, 1, 0.9529412, 0, 1,
-1.000997, 0.7650172, 0.3144507, 1, 0.9607843, 0, 1,
-0.9982049, 0.5392043, -1.662823, 1, 0.9647059, 0, 1,
-0.9936836, 0.9684659, -1.075942, 1, 0.972549, 0, 1,
-0.9885961, 0.06305606, -0.4812301, 1, 0.9764706, 0, 1,
-0.9882508, 0.4334167, -0.02807473, 1, 0.9843137, 0, 1,
-0.9781274, -0.0426752, -3.236461, 1, 0.9882353, 0, 1,
-0.9636421, -1.221734, -0.8962886, 1, 0.9960784, 0, 1,
-0.9596429, -0.4858372, -1.743888, 0.9960784, 1, 0, 1,
-0.9541178, 0.4076544, -0.7676377, 0.9921569, 1, 0, 1,
-0.9520149, -0.1284004, -1.784755, 0.9843137, 1, 0, 1,
-0.9456633, 0.8109925, 0.7947835, 0.9803922, 1, 0, 1,
-0.9443471, 0.9166129, -0.6653066, 0.972549, 1, 0, 1,
-0.9427321, -0.3452813, -3.101302, 0.9686275, 1, 0, 1,
-0.9422361, -0.2226185, -2.930537, 0.9607843, 1, 0, 1,
-0.9411894, -1.233377, -2.939019, 0.9568627, 1, 0, 1,
-0.933786, 0.6705059, -1.848282, 0.9490196, 1, 0, 1,
-0.923393, -0.07975639, -1.273576, 0.945098, 1, 0, 1,
-0.9232944, 0.7393453, -2.258444, 0.9372549, 1, 0, 1,
-0.9204995, -1.244171, -0.8140466, 0.9333333, 1, 0, 1,
-0.9188534, 1.089316, 0.1090488, 0.9254902, 1, 0, 1,
-0.9140503, 0.0765892, -2.440431, 0.9215686, 1, 0, 1,
-0.9034338, -0.07160344, -2.039948, 0.9137255, 1, 0, 1,
-0.9011474, 0.2165232, -1.033095, 0.9098039, 1, 0, 1,
-0.8984949, 1.097225, -0.5300425, 0.9019608, 1, 0, 1,
-0.8946782, 0.5571858, -1.129599, 0.8941177, 1, 0, 1,
-0.8934072, 0.1086135, -1.963912, 0.8901961, 1, 0, 1,
-0.8916922, 0.6576488, 0.05065116, 0.8823529, 1, 0, 1,
-0.8857231, -0.8581271, -2.741154, 0.8784314, 1, 0, 1,
-0.8674081, 1.111555, -1.059433, 0.8705882, 1, 0, 1,
-0.8655983, -0.5732783, -2.924955, 0.8666667, 1, 0, 1,
-0.8599291, -0.637483, -2.898318, 0.8588235, 1, 0, 1,
-0.8555435, 0.1391527, 0.4070076, 0.854902, 1, 0, 1,
-0.8537347, -0.9705961, -3.23846, 0.8470588, 1, 0, 1,
-0.8480249, -1.937083, -3.255777, 0.8431373, 1, 0, 1,
-0.8361449, 1.084763, -0.4982537, 0.8352941, 1, 0, 1,
-0.834185, 0.7131233, -2.830286, 0.8313726, 1, 0, 1,
-0.833268, 1.131546, -0.3078529, 0.8235294, 1, 0, 1,
-0.8329528, -0.9131105, -1.59461, 0.8196079, 1, 0, 1,
-0.8329504, 0.1108544, 0.2470085, 0.8117647, 1, 0, 1,
-0.8328797, -0.8850248, -0.5292927, 0.8078431, 1, 0, 1,
-0.8303812, 0.8615485, -1.312622, 0.8, 1, 0, 1,
-0.8276798, 0.4737495, 0.5275128, 0.7921569, 1, 0, 1,
-0.8218523, -0.5402815, -1.964748, 0.7882353, 1, 0, 1,
-0.8216416, -0.2735606, -1.643319, 0.7803922, 1, 0, 1,
-0.8141308, -0.7181049, -0.659484, 0.7764706, 1, 0, 1,
-0.8122972, 1.535193, -2.513423, 0.7686275, 1, 0, 1,
-0.8094406, -0.2891033, -1.0275, 0.7647059, 1, 0, 1,
-0.8092492, 0.1057085, -1.634371, 0.7568628, 1, 0, 1,
-0.8019174, -0.2748329, -2.759795, 0.7529412, 1, 0, 1,
-0.7921991, 1.085648, 1.606873, 0.7450981, 1, 0, 1,
-0.7903823, 2.555106, -0.5516911, 0.7411765, 1, 0, 1,
-0.7851846, 0.444868, -1.367744, 0.7333333, 1, 0, 1,
-0.7825599, -0.1921761, -2.38618, 0.7294118, 1, 0, 1,
-0.7810501, -2.59541, -3.788774, 0.7215686, 1, 0, 1,
-0.7800732, -0.4626041, -0.8530355, 0.7176471, 1, 0, 1,
-0.7779914, -0.05120321, -2.917784, 0.7098039, 1, 0, 1,
-0.7757244, 2.173117, -2.085579, 0.7058824, 1, 0, 1,
-0.7738099, -1.216138, -3.648532, 0.6980392, 1, 0, 1,
-0.7674677, -0.4499177, -1.100503, 0.6901961, 1, 0, 1,
-0.7666701, -1.009101, -3.650614, 0.6862745, 1, 0, 1,
-0.7634733, -0.09174157, -2.058151, 0.6784314, 1, 0, 1,
-0.7634703, -0.7385739, -2.591352, 0.6745098, 1, 0, 1,
-0.7600294, 0.1415343, -0.7684998, 0.6666667, 1, 0, 1,
-0.7597693, 0.3815543, -2.704684, 0.6627451, 1, 0, 1,
-0.7596629, 0.1474108, -0.8051702, 0.654902, 1, 0, 1,
-0.758566, -0.9739113, -1.765517, 0.6509804, 1, 0, 1,
-0.7562041, -0.4949865, -1.813327, 0.6431373, 1, 0, 1,
-0.7534689, -1.768892, -3.818827, 0.6392157, 1, 0, 1,
-0.7514669, -0.3944598, -2.577521, 0.6313726, 1, 0, 1,
-0.7446824, 0.3464305, 0.03561494, 0.627451, 1, 0, 1,
-0.7415574, -1.063959, -0.5765012, 0.6196079, 1, 0, 1,
-0.7347953, 0.7839713, -1.803977, 0.6156863, 1, 0, 1,
-0.7346784, 0.06515312, 0.115836, 0.6078432, 1, 0, 1,
-0.7328978, 0.3941368, -0.3282998, 0.6039216, 1, 0, 1,
-0.7288169, -0.4228288, -1.199479, 0.5960785, 1, 0, 1,
-0.7283583, -0.7807426, -1.454112, 0.5882353, 1, 0, 1,
-0.726078, 2.026958, 0.0749092, 0.5843138, 1, 0, 1,
-0.7228178, -0.1511514, -2.372052, 0.5764706, 1, 0, 1,
-0.7226745, -1.01153, -4.208687, 0.572549, 1, 0, 1,
-0.7225634, 0.2567276, -0.03338075, 0.5647059, 1, 0, 1,
-0.7218377, 1.577963, -1.310295, 0.5607843, 1, 0, 1,
-0.7217484, 0.4166581, -0.1000999, 0.5529412, 1, 0, 1,
-0.7191907, -0.4323696, -1.047233, 0.5490196, 1, 0, 1,
-0.7181231, -0.06383949, -1.56948, 0.5411765, 1, 0, 1,
-0.7167475, 0.188146, 0.6312475, 0.5372549, 1, 0, 1,
-0.7166512, 1.032143, -0.2949725, 0.5294118, 1, 0, 1,
-0.7145736, 0.219015, -1.246733, 0.5254902, 1, 0, 1,
-0.708961, -0.3503743, -3.687719, 0.5176471, 1, 0, 1,
-0.7042268, 1.343989, -0.1127709, 0.5137255, 1, 0, 1,
-0.7035986, 0.554574, -1.745217, 0.5058824, 1, 0, 1,
-0.7014239, 0.7676162, -0.7248414, 0.5019608, 1, 0, 1,
-0.6945746, 0.07655311, -1.556725, 0.4941176, 1, 0, 1,
-0.69323, 0.6024255, -0.4448643, 0.4862745, 1, 0, 1,
-0.6925026, -0.2607672, -0.4851511, 0.4823529, 1, 0, 1,
-0.6924383, 0.6310181, -0.895954, 0.4745098, 1, 0, 1,
-0.6794144, 2.367473, -0.9140306, 0.4705882, 1, 0, 1,
-0.678191, -1.124512, -2.881121, 0.4627451, 1, 0, 1,
-0.6762583, -0.463495, -2.516851, 0.4588235, 1, 0, 1,
-0.6734155, -0.9607335, -3.245414, 0.4509804, 1, 0, 1,
-0.6711649, 1.458375, -0.001734929, 0.4470588, 1, 0, 1,
-0.6676345, 0.4145383, -0.5192412, 0.4392157, 1, 0, 1,
-0.6658526, 0.4056902, -0.523718, 0.4352941, 1, 0, 1,
-0.6657694, 0.7199612, -1.169666, 0.427451, 1, 0, 1,
-0.6652833, -0.8816404, -1.668965, 0.4235294, 1, 0, 1,
-0.6635273, -0.9053153, -4.227874, 0.4156863, 1, 0, 1,
-0.6625941, -0.1100685, -0.05551114, 0.4117647, 1, 0, 1,
-0.6573998, 0.3562595, -0.4011595, 0.4039216, 1, 0, 1,
-0.6556273, 0.8267021, -0.3533414, 0.3960784, 1, 0, 1,
-0.6545534, -0.01789135, -2.616383, 0.3921569, 1, 0, 1,
-0.6528768, 0.1151453, -1.603912, 0.3843137, 1, 0, 1,
-0.649158, -1.277434, -3.251768, 0.3803922, 1, 0, 1,
-0.6481068, 0.2310491, -1.535583, 0.372549, 1, 0, 1,
-0.6451405, -0.1353058, -1.143399, 0.3686275, 1, 0, 1,
-0.6424334, 0.7466987, 0.4024621, 0.3607843, 1, 0, 1,
-0.6323863, -0.01469135, -1.813693, 0.3568628, 1, 0, 1,
-0.6319321, -0.5338947, -3.80817, 0.3490196, 1, 0, 1,
-0.6305947, -0.7222995, -1.490138, 0.345098, 1, 0, 1,
-0.6283156, -0.05471551, -0.6375464, 0.3372549, 1, 0, 1,
-0.628073, 1.347726, -0.411647, 0.3333333, 1, 0, 1,
-0.6155298, 0.2422894, -0.9590728, 0.3254902, 1, 0, 1,
-0.6141006, 0.9532408, -1.828671, 0.3215686, 1, 0, 1,
-0.6109859, 0.3672745, -1.713072, 0.3137255, 1, 0, 1,
-0.6044351, 0.07410612, -1.287263, 0.3098039, 1, 0, 1,
-0.6036506, 1.18775, -0.9253022, 0.3019608, 1, 0, 1,
-0.6007736, 0.06518523, -2.571376, 0.2941177, 1, 0, 1,
-0.5948867, -0.03591574, -1.57829, 0.2901961, 1, 0, 1,
-0.5900358, 0.3412083, -0.6769716, 0.282353, 1, 0, 1,
-0.5878694, -0.03576153, -2.895556, 0.2784314, 1, 0, 1,
-0.5848091, -1.57927, -2.357865, 0.2705882, 1, 0, 1,
-0.5747471, -0.1935144, -0.6330287, 0.2666667, 1, 0, 1,
-0.5725572, -1.314868, -3.645419, 0.2588235, 1, 0, 1,
-0.5692268, -0.8322971, -2.517072, 0.254902, 1, 0, 1,
-0.5644409, 1.063334, 0.6318642, 0.2470588, 1, 0, 1,
-0.5592831, 0.9049414, -0.08153007, 0.2431373, 1, 0, 1,
-0.555285, 0.1016146, -1.935089, 0.2352941, 1, 0, 1,
-0.5550503, -0.6686658, -2.179214, 0.2313726, 1, 0, 1,
-0.5549965, 0.3640559, -0.5301634, 0.2235294, 1, 0, 1,
-0.5539858, 0.5812108, 0.4246362, 0.2196078, 1, 0, 1,
-0.5453421, -0.6955616, 0.4025229, 0.2117647, 1, 0, 1,
-0.5449941, 0.6012937, -0.1517313, 0.2078431, 1, 0, 1,
-0.5357174, 0.1742272, -0.6635227, 0.2, 1, 0, 1,
-0.5316821, 0.738829, -1.946392, 0.1921569, 1, 0, 1,
-0.5313593, -0.7567054, -3.802833, 0.1882353, 1, 0, 1,
-0.5281684, -0.1656321, -2.626677, 0.1803922, 1, 0, 1,
-0.5256034, 1.736227, -1.133332, 0.1764706, 1, 0, 1,
-0.5237265, 0.2333245, -1.89366, 0.1686275, 1, 0, 1,
-0.5231744, 0.7892367, -0.1271197, 0.1647059, 1, 0, 1,
-0.5192766, 0.04968188, -0.2064697, 0.1568628, 1, 0, 1,
-0.5192553, -0.7894309, -2.869033, 0.1529412, 1, 0, 1,
-0.5136753, -1.365894, -3.350017, 0.145098, 1, 0, 1,
-0.4985736, -2.081694, -1.920642, 0.1411765, 1, 0, 1,
-0.4946706, 0.724614, -1.178167, 0.1333333, 1, 0, 1,
-0.4944956, 1.8865, -0.01205547, 0.1294118, 1, 0, 1,
-0.4906673, -0.3756428, -0.8653277, 0.1215686, 1, 0, 1,
-0.488317, 0.8178089, -0.09910175, 0.1176471, 1, 0, 1,
-0.4873477, -0.8006179, -2.589836, 0.1098039, 1, 0, 1,
-0.4852795, -1.364807, -2.843257, 0.1058824, 1, 0, 1,
-0.4718357, 0.1158875, -1.875986, 0.09803922, 1, 0, 1,
-0.4662205, -1.695673, -3.521302, 0.09019608, 1, 0, 1,
-0.4644105, 0.8447343, -1.154725, 0.08627451, 1, 0, 1,
-0.4625371, 0.1093302, -1.685657, 0.07843138, 1, 0, 1,
-0.4612654, -0.9184017, -2.470105, 0.07450981, 1, 0, 1,
-0.4609682, 0.1484222, -1.734626, 0.06666667, 1, 0, 1,
-0.4596681, 0.3080008, -1.397002, 0.0627451, 1, 0, 1,
-0.4587768, -0.7374339, -3.641443, 0.05490196, 1, 0, 1,
-0.4578251, 1.191043, -1.22197, 0.05098039, 1, 0, 1,
-0.4540388, 0.5734886, -0.3337192, 0.04313726, 1, 0, 1,
-0.4522791, -0.129891, -1.97712, 0.03921569, 1, 0, 1,
-0.4487665, 1.289389, 0.4662669, 0.03137255, 1, 0, 1,
-0.4483538, -0.5336481, -3.398827, 0.02745098, 1, 0, 1,
-0.44646, -0.7404965, -2.834613, 0.01960784, 1, 0, 1,
-0.435233, 1.348815, -1.483138, 0.01568628, 1, 0, 1,
-0.4348266, -1.140865, -1.345919, 0.007843138, 1, 0, 1,
-0.4303131, -0.7836143, -2.688934, 0.003921569, 1, 0, 1,
-0.4290782, 0.9808975, -1.813631, 0, 1, 0.003921569, 1,
-0.4260291, 0.5315107, 0.05143838, 0, 1, 0.01176471, 1,
-0.4205447, 1.6498, 1.063529, 0, 1, 0.01568628, 1,
-0.4196702, 0.2093002, 0.4608065, 0, 1, 0.02352941, 1,
-0.4175123, -0.6887605, -1.788783, 0, 1, 0.02745098, 1,
-0.4152779, -2.044885, -3.919838, 0, 1, 0.03529412, 1,
-0.4120921, 1.060204, -0.3798226, 0, 1, 0.03921569, 1,
-0.4120584, 1.055564, -1.187174, 0, 1, 0.04705882, 1,
-0.4112453, -0.8027733, -2.078322, 0, 1, 0.05098039, 1,
-0.4054201, 1.779172, 0.008454189, 0, 1, 0.05882353, 1,
-0.4043852, -0.1197944, -3.111856, 0, 1, 0.0627451, 1,
-0.4029446, -0.2068443, -3.608866, 0, 1, 0.07058824, 1,
-0.4011292, -0.8099581, -3.870146, 0, 1, 0.07450981, 1,
-0.3979597, -1.204252, -1.700808, 0, 1, 0.08235294, 1,
-0.3979181, 0.6229596, -1.949224, 0, 1, 0.08627451, 1,
-0.3978175, -0.7130752, -1.97881, 0, 1, 0.09411765, 1,
-0.3917369, -1.351719, -4.449583, 0, 1, 0.1019608, 1,
-0.388005, -0.04926054, -2.055435, 0, 1, 0.1058824, 1,
-0.3868312, 0.4783306, 1.723498, 0, 1, 0.1137255, 1,
-0.3863035, -2.007037, -1.919374, 0, 1, 0.1176471, 1,
-0.38349, 1.103678, 0.4276303, 0, 1, 0.1254902, 1,
-0.3834319, -0.8867407, -2.553008, 0, 1, 0.1294118, 1,
-0.3814255, -0.3587296, -1.807456, 0, 1, 0.1372549, 1,
-0.378211, 0.3214476, 0.5898492, 0, 1, 0.1411765, 1,
-0.374415, 0.1480977, -2.908582, 0, 1, 0.1490196, 1,
-0.3701581, -0.4729541, -3.207983, 0, 1, 0.1529412, 1,
-0.3685192, -0.3200794, -3.581565, 0, 1, 0.1607843, 1,
-0.3635174, 1.082538, -0.2238064, 0, 1, 0.1647059, 1,
-0.3616265, -0.5462847, -3.160002, 0, 1, 0.172549, 1,
-0.354475, -1.798507, -3.016188, 0, 1, 0.1764706, 1,
-0.3541553, -0.1430361, -2.652556, 0, 1, 0.1843137, 1,
-0.3511254, -0.4298889, -1.447507, 0, 1, 0.1882353, 1,
-0.34977, 0.7489465, 0.06178194, 0, 1, 0.1960784, 1,
-0.3497214, -1.545087, -3.12997, 0, 1, 0.2039216, 1,
-0.3479291, -0.3966884, -1.64083, 0, 1, 0.2078431, 1,
-0.345534, -0.5844994, -1.946491, 0, 1, 0.2156863, 1,
-0.3443468, 0.5817745, -0.1813753, 0, 1, 0.2196078, 1,
-0.3434151, 0.7770908, -0.4034241, 0, 1, 0.227451, 1,
-0.3399876, -0.3893846, -2.957724, 0, 1, 0.2313726, 1,
-0.333857, 1.725435, 1.336615, 0, 1, 0.2392157, 1,
-0.3315769, -0.6392815, -2.252344, 0, 1, 0.2431373, 1,
-0.3311562, 3.266905, -2.110575, 0, 1, 0.2509804, 1,
-0.3308485, -0.2043912, -2.071292, 0, 1, 0.254902, 1,
-0.3308211, 0.1509516, -0.04267975, 0, 1, 0.2627451, 1,
-0.328174, 0.8300646, -0.8628927, 0, 1, 0.2666667, 1,
-0.3257312, -0.1810096, -1.549773, 0, 1, 0.2745098, 1,
-0.3238881, -0.8965329, -2.667092, 0, 1, 0.2784314, 1,
-0.3221647, -0.3170846, -3.311126, 0, 1, 0.2862745, 1,
-0.3220995, -0.6792621, -0.7906629, 0, 1, 0.2901961, 1,
-0.3220406, -1.470079, -3.205017, 0, 1, 0.2980392, 1,
-0.3177246, 0.03379143, -1.979813, 0, 1, 0.3058824, 1,
-0.3169783, -1.01993, -2.746147, 0, 1, 0.3098039, 1,
-0.3078301, 0.6928072, -1.535117, 0, 1, 0.3176471, 1,
-0.3043099, -0.2988879, -3.098114, 0, 1, 0.3215686, 1,
-0.3022977, -1.840998, -4.381207, 0, 1, 0.3294118, 1,
-0.3013169, -0.9651515, -2.03632, 0, 1, 0.3333333, 1,
-0.2986154, -0.06928581, -1.112249, 0, 1, 0.3411765, 1,
-0.2972567, 0.01575595, -2.158493, 0, 1, 0.345098, 1,
-0.2887779, 0.112778, -2.303702, 0, 1, 0.3529412, 1,
-0.2859193, 1.514089, -0.1083191, 0, 1, 0.3568628, 1,
-0.2820177, 1.316837, 0.7425388, 0, 1, 0.3647059, 1,
-0.2818281, -0.08938125, -1.560743, 0, 1, 0.3686275, 1,
-0.2746793, 0.810185, -2.331502, 0, 1, 0.3764706, 1,
-0.2730505, 1.245441, -0.06928171, 0, 1, 0.3803922, 1,
-0.2706682, -0.7991023, -2.269653, 0, 1, 0.3882353, 1,
-0.2694681, -0.5226161, -1.891984, 0, 1, 0.3921569, 1,
-0.2691339, 0.4655544, -0.8841469, 0, 1, 0.4, 1,
-0.2673603, 0.4641328, 0.1236933, 0, 1, 0.4078431, 1,
-0.2669256, -1.47431, -1.069944, 0, 1, 0.4117647, 1,
-0.2602969, -1.31845, -3.007018, 0, 1, 0.4196078, 1,
-0.260063, 0.9406154, 1.902297, 0, 1, 0.4235294, 1,
-0.2565916, 2.081018, 0.1225253, 0, 1, 0.4313726, 1,
-0.2545122, -0.2709349, -3.653957, 0, 1, 0.4352941, 1,
-0.2522703, -1.81831, -2.405814, 0, 1, 0.4431373, 1,
-0.2521676, -1.548336, -2.186983, 0, 1, 0.4470588, 1,
-0.2493489, -0.9333692, -4.168845, 0, 1, 0.454902, 1,
-0.2481255, -0.2183775, -3.099704, 0, 1, 0.4588235, 1,
-0.2476046, 0.2955067, -1.091838, 0, 1, 0.4666667, 1,
-0.2442176, 0.2180939, 1.070742, 0, 1, 0.4705882, 1,
-0.241688, -0.9659247, -0.2392519, 0, 1, 0.4784314, 1,
-0.2397568, 0.472012, -1.076911, 0, 1, 0.4823529, 1,
-0.2394757, 2.4321, 1.23191, 0, 1, 0.4901961, 1,
-0.218399, 0.7793242, 1.052601, 0, 1, 0.4941176, 1,
-0.215528, -1.120108, -3.837999, 0, 1, 0.5019608, 1,
-0.2141227, -0.154491, -2.823058, 0, 1, 0.509804, 1,
-0.210466, 0.3260549, -1.207861, 0, 1, 0.5137255, 1,
-0.2034966, -0.1681747, -1.997899, 0, 1, 0.5215687, 1,
-0.1992643, -2.415165, -2.72056, 0, 1, 0.5254902, 1,
-0.1988169, 0.05420915, -2.625307, 0, 1, 0.5333334, 1,
-0.198323, -3.162711, -5.109101, 0, 1, 0.5372549, 1,
-0.1927156, -1.166904, -4.551957, 0, 1, 0.5450981, 1,
-0.1882791, 1.142131, -1.496858, 0, 1, 0.5490196, 1,
-0.183186, 0.2054999, 0.5423465, 0, 1, 0.5568628, 1,
-0.17864, 0.2528338, -0.5560992, 0, 1, 0.5607843, 1,
-0.1776015, 0.6442723, -0.6576667, 0, 1, 0.5686275, 1,
-0.1724051, -0.02462862, -2.350361, 0, 1, 0.572549, 1,
-0.1612109, -1.982514, -3.565395, 0, 1, 0.5803922, 1,
-0.1589233, -1.483217, -1.28644, 0, 1, 0.5843138, 1,
-0.1582308, -0.4054249, -1.34531, 0, 1, 0.5921569, 1,
-0.157621, -0.6886671, -3.121872, 0, 1, 0.5960785, 1,
-0.1572482, -0.2775496, -1.709201, 0, 1, 0.6039216, 1,
-0.1497328, -0.305598, -1.819024, 0, 1, 0.6117647, 1,
-0.1496989, -0.392891, -3.01757, 0, 1, 0.6156863, 1,
-0.1468994, -1.425246, -2.982924, 0, 1, 0.6235294, 1,
-0.1445862, -1.150319, -4.196419, 0, 1, 0.627451, 1,
-0.1405882, -3.625065, -1.68528, 0, 1, 0.6352941, 1,
-0.1358675, 0.8706263, -0.5995952, 0, 1, 0.6392157, 1,
-0.1354459, -1.895091, -2.000725, 0, 1, 0.6470588, 1,
-0.1354154, 1.78261, 0.4767838, 0, 1, 0.6509804, 1,
-0.1332352, -2.206418, -3.931093, 0, 1, 0.6588235, 1,
-0.1330094, 1.103663, -0.9255687, 0, 1, 0.6627451, 1,
-0.1293264, -0.8081644, -3.277901, 0, 1, 0.6705883, 1,
-0.1279907, -0.6621608, -2.552478, 0, 1, 0.6745098, 1,
-0.1267439, 0.1769112, -2.680579, 0, 1, 0.682353, 1,
-0.1264711, -0.7816496, -3.595237, 0, 1, 0.6862745, 1,
-0.1260495, -0.3986343, -4.492033, 0, 1, 0.6941177, 1,
-0.1194951, 1.076872, -0.6952024, 0, 1, 0.7019608, 1,
-0.113441, -0.6221983, -4.255737, 0, 1, 0.7058824, 1,
-0.1110971, -0.4306236, -4.962457, 0, 1, 0.7137255, 1,
-0.1106475, -0.06264593, -1.879535, 0, 1, 0.7176471, 1,
-0.1104996, -0.1589016, -2.379318, 0, 1, 0.7254902, 1,
-0.1081225, -1.934406, -3.327727, 0, 1, 0.7294118, 1,
-0.1064925, 0.3786105, 1.048273, 0, 1, 0.7372549, 1,
-0.1039435, -1.466764, -3.836706, 0, 1, 0.7411765, 1,
-0.102441, -0.7272896, -3.695262, 0, 1, 0.7490196, 1,
-0.09997557, -0.6345043, -2.398217, 0, 1, 0.7529412, 1,
-0.09921922, 0.6745225, -0.2608501, 0, 1, 0.7607843, 1,
-0.09833477, 0.09478039, -0.6314909, 0, 1, 0.7647059, 1,
-0.09668274, 2.161775, 0.4434334, 0, 1, 0.772549, 1,
-0.09586883, 0.8581122, 0.4836834, 0, 1, 0.7764706, 1,
-0.09517017, -0.00967042, -1.58089, 0, 1, 0.7843137, 1,
-0.08102749, 0.307058, 0.4497596, 0, 1, 0.7882353, 1,
-0.07850809, -1.266922, -2.69314, 0, 1, 0.7960784, 1,
-0.07421033, 0.254495, -0.6159256, 0, 1, 0.8039216, 1,
-0.07259613, -2.541701, -3.017179, 0, 1, 0.8078431, 1,
-0.0699033, 0.9174765, -1.158595, 0, 1, 0.8156863, 1,
-0.0691999, 2.089664, -1.111452, 0, 1, 0.8196079, 1,
-0.06393186, -0.7823316, -5.11005, 0, 1, 0.827451, 1,
-0.06393076, 0.6513751, 1.367568, 0, 1, 0.8313726, 1,
-0.06298035, -0.4193593, -3.488024, 0, 1, 0.8392157, 1,
-0.06266837, -0.1127761, -0.9108617, 0, 1, 0.8431373, 1,
-0.06216571, 0.3198275, 1.330446, 0, 1, 0.8509804, 1,
-0.06138562, -1.470146, -2.562577, 0, 1, 0.854902, 1,
-0.06092583, -0.232349, -4.148031, 0, 1, 0.8627451, 1,
-0.05991276, -0.2659544, -1.931973, 0, 1, 0.8666667, 1,
-0.05613019, 1.541475, 0.1313009, 0, 1, 0.8745098, 1,
-0.05083625, -0.439985, -3.931527, 0, 1, 0.8784314, 1,
-0.04873444, 1.224607, -2.103925, 0, 1, 0.8862745, 1,
-0.04870981, -0.193119, -4.073564, 0, 1, 0.8901961, 1,
-0.04830703, 2.432415, -1.102118, 0, 1, 0.8980392, 1,
-0.04622259, 0.1138069, -0.1664317, 0, 1, 0.9058824, 1,
-0.04548947, -1.337783, -3.123035, 0, 1, 0.9098039, 1,
-0.04465896, 1.136738, 0.3892975, 0, 1, 0.9176471, 1,
-0.0432977, 0.3839637, 0.4495298, 0, 1, 0.9215686, 1,
-0.03264441, 2.082426, -2.263692, 0, 1, 0.9294118, 1,
-0.03058148, 1.672151, -0.05598311, 0, 1, 0.9333333, 1,
-0.02881039, -2.163918, -2.389726, 0, 1, 0.9411765, 1,
-0.02880389, -0.1917688, -1.780462, 0, 1, 0.945098, 1,
-0.02849146, -0.317664, -3.617364, 0, 1, 0.9529412, 1,
-0.02723558, -0.8124632, -4.46459, 0, 1, 0.9568627, 1,
-0.02693448, -0.5746968, -2.905457, 0, 1, 0.9647059, 1,
-0.02511342, -0.8318162, -1.192789, 0, 1, 0.9686275, 1,
-0.02307205, 0.6088816, -0.005714175, 0, 1, 0.9764706, 1,
-0.02221772, 3.399947, 0.7988106, 0, 1, 0.9803922, 1,
-0.02078999, -0.2603232, -5.341181, 0, 1, 0.9882353, 1,
-0.0156845, 1.224203, 0.3153191, 0, 1, 0.9921569, 1,
-0.01447009, -1.023748, -2.719543, 0, 1, 1, 1,
-0.01002399, -0.6307154, -2.665664, 0, 0.9921569, 1, 1,
-0.00964311, -0.7020051, -3.755831, 0, 0.9882353, 1, 1,
-0.00857344, 0.3065973, -0.5544994, 0, 0.9803922, 1, 1,
-0.005869794, 0.5853157, -2.529814, 0, 0.9764706, 1, 1,
-0.003945952, 1.14324, -1.630283, 0, 0.9686275, 1, 1,
-0.003011138, 1.968677, 1.334521, 0, 0.9647059, 1, 1,
-0.0001248431, -0.3451779, -3.084076, 0, 0.9568627, 1, 1,
0.004123586, -0.7202274, 1.659477, 0, 0.9529412, 1, 1,
0.005538107, -1.763542, 2.368995, 0, 0.945098, 1, 1,
0.005777427, 0.3619296, 0.5699133, 0, 0.9411765, 1, 1,
0.01012239, -0.432232, 4.592165, 0, 0.9333333, 1, 1,
0.0180242, -0.3769094, 2.007966, 0, 0.9294118, 1, 1,
0.01820398, -1.065066, 2.996948, 0, 0.9215686, 1, 1,
0.02212761, -0.5730852, 5.35051, 0, 0.9176471, 1, 1,
0.0248148, -0.1961614, 3.940985, 0, 0.9098039, 1, 1,
0.02671172, 0.4224681, 0.08615859, 0, 0.9058824, 1, 1,
0.03165571, 0.09388899, -0.6004463, 0, 0.8980392, 1, 1,
0.03288757, -1.157024, 3.060782, 0, 0.8901961, 1, 1,
0.03895785, 1.330309, -0.5004371, 0, 0.8862745, 1, 1,
0.0396107, 0.1042924, 0.3635913, 0, 0.8784314, 1, 1,
0.0417256, 0.3432455, 0.561974, 0, 0.8745098, 1, 1,
0.04242387, -0.9344034, 2.487966, 0, 0.8666667, 1, 1,
0.04368409, -1.377056, 3.327065, 0, 0.8627451, 1, 1,
0.04583479, 0.9356421, -0.6334524, 0, 0.854902, 1, 1,
0.04594356, -0.6270092, 3.592879, 0, 0.8509804, 1, 1,
0.04682384, 0.843858, -1.704746, 0, 0.8431373, 1, 1,
0.04858607, 0.2599298, 0.831913, 0, 0.8392157, 1, 1,
0.04951508, -0.136014, 2.109923, 0, 0.8313726, 1, 1,
0.05654148, 0.6895916, -0.08732285, 0, 0.827451, 1, 1,
0.06313971, 1.140593, -0.2335376, 0, 0.8196079, 1, 1,
0.06658552, -0.3564781, 2.529971, 0, 0.8156863, 1, 1,
0.06694756, -0.04953118, 2.906097, 0, 0.8078431, 1, 1,
0.06719885, -0.183678, 1.559888, 0, 0.8039216, 1, 1,
0.0676233, 1.061676, -1.454254, 0, 0.7960784, 1, 1,
0.06909965, 0.3506485, 1.178922, 0, 0.7882353, 1, 1,
0.07421611, 0.4906018, 2.672697, 0, 0.7843137, 1, 1,
0.07810337, 0.006409553, 1.130085, 0, 0.7764706, 1, 1,
0.07918011, -0.8062591, 2.919641, 0, 0.772549, 1, 1,
0.08645938, -0.1855035, 2.179026, 0, 0.7647059, 1, 1,
0.08657266, -2.356474, 2.19836, 0, 0.7607843, 1, 1,
0.09081242, -1.196918, 2.566866, 0, 0.7529412, 1, 1,
0.09616687, 0.2080793, 0.5254301, 0, 0.7490196, 1, 1,
0.09699721, -0.1525722, 4.933292, 0, 0.7411765, 1, 1,
0.09717774, 0.4771249, -0.2516293, 0, 0.7372549, 1, 1,
0.10003, 1.119364, -2.26493, 0, 0.7294118, 1, 1,
0.1054565, -1.843546, 2.686123, 0, 0.7254902, 1, 1,
0.1111458, 0.8582013, 0.6062439, 0, 0.7176471, 1, 1,
0.1114001, 0.5964982, -0.2267421, 0, 0.7137255, 1, 1,
0.1128613, -1.780077, 3.935609, 0, 0.7058824, 1, 1,
0.1168994, 0.6915497, 0.7757274, 0, 0.6980392, 1, 1,
0.1179271, -0.459968, 2.9104, 0, 0.6941177, 1, 1,
0.1222769, -0.3117554, 1.57347, 0, 0.6862745, 1, 1,
0.1266014, -0.7440639, 2.478926, 0, 0.682353, 1, 1,
0.1324722, 1.564659, 1.599927, 0, 0.6745098, 1, 1,
0.1351579, 0.03575231, 1.025957, 0, 0.6705883, 1, 1,
0.1357611, 0.7245846, 0.6052645, 0, 0.6627451, 1, 1,
0.1443088, 1.710579, 0.9152339, 0, 0.6588235, 1, 1,
0.1446213, -1.840338, 3.441325, 0, 0.6509804, 1, 1,
0.1493464, -1.175885, 1.377184, 0, 0.6470588, 1, 1,
0.1500404, 0.2281331, 0.3354323, 0, 0.6392157, 1, 1,
0.1536916, -0.04194983, 2.953283, 0, 0.6352941, 1, 1,
0.1540477, -1.185005, 3.142463, 0, 0.627451, 1, 1,
0.1545519, 1.41958, 1.629514, 0, 0.6235294, 1, 1,
0.1560862, 0.955822, -0.7247959, 0, 0.6156863, 1, 1,
0.159255, 1.654232, 0.4243882, 0, 0.6117647, 1, 1,
0.1639653, -0.4905859, 3.464582, 0, 0.6039216, 1, 1,
0.1647477, 0.1176332, 2.022983, 0, 0.5960785, 1, 1,
0.1651532, -0.02464218, 2.141112, 0, 0.5921569, 1, 1,
0.1664271, 0.1282332, -0.06826963, 0, 0.5843138, 1, 1,
0.1667753, -0.7052273, 3.340691, 0, 0.5803922, 1, 1,
0.1676953, -1.071229, 4.217731, 0, 0.572549, 1, 1,
0.1680142, -0.9979168, 1.036114, 0, 0.5686275, 1, 1,
0.1687915, 0.2539647, 1.288654, 0, 0.5607843, 1, 1,
0.1711818, -0.1688724, 1.271752, 0, 0.5568628, 1, 1,
0.1732056, -0.4509202, 1.896368, 0, 0.5490196, 1, 1,
0.1779163, 1.149118, -0.2717953, 0, 0.5450981, 1, 1,
0.178981, -1.761962, 1.815103, 0, 0.5372549, 1, 1,
0.1812333, -0.1498307, 0.51888, 0, 0.5333334, 1, 1,
0.1814631, 0.6900093, -0.8389296, 0, 0.5254902, 1, 1,
0.1824037, -0.3144624, 2.974518, 0, 0.5215687, 1, 1,
0.1826512, -1.226215, 2.757277, 0, 0.5137255, 1, 1,
0.2003361, 1.36968, -1.117978, 0, 0.509804, 1, 1,
0.2017128, 1.026733, 0.4953046, 0, 0.5019608, 1, 1,
0.203113, -0.07447911, 3.486581, 0, 0.4941176, 1, 1,
0.2043717, 0.2830713, 0.7509828, 0, 0.4901961, 1, 1,
0.2047292, -0.4163753, 3.825409, 0, 0.4823529, 1, 1,
0.2138799, -0.03065764, 2.041133, 0, 0.4784314, 1, 1,
0.2186681, 1.075956, 0.6792384, 0, 0.4705882, 1, 1,
0.2187477, 0.8379437, 1.403446, 0, 0.4666667, 1, 1,
0.2206869, 1.410724, -0.2197636, 0, 0.4588235, 1, 1,
0.2211633, -0.7426842, 3.222797, 0, 0.454902, 1, 1,
0.2300615, 0.2528463, -0.3665972, 0, 0.4470588, 1, 1,
0.2303956, 0.5120212, 0.6848726, 0, 0.4431373, 1, 1,
0.241552, 2.054701, 0.07259332, 0, 0.4352941, 1, 1,
0.2478043, 0.09174927, 1.572456, 0, 0.4313726, 1, 1,
0.2523901, -0.2434861, 1.625208, 0, 0.4235294, 1, 1,
0.2535065, 0.5633143, -0.9159347, 0, 0.4196078, 1, 1,
0.2552062, -0.2823133, 0.6667446, 0, 0.4117647, 1, 1,
0.2572053, 1.604632, 1.147322, 0, 0.4078431, 1, 1,
0.2643999, -0.7296718, 2.64207, 0, 0.4, 1, 1,
0.2657944, 0.006607682, 1.491761, 0, 0.3921569, 1, 1,
0.2695716, -2.581116, 2.189602, 0, 0.3882353, 1, 1,
0.2714513, 1.17463, 0.4274988, 0, 0.3803922, 1, 1,
0.2732017, 0.6879693, -0.01365364, 0, 0.3764706, 1, 1,
0.2780237, -0.7502468, 3.726101, 0, 0.3686275, 1, 1,
0.2789949, -0.06450861, 2.656487, 0, 0.3647059, 1, 1,
0.2823402, -0.7814952, 1.61828, 0, 0.3568628, 1, 1,
0.283539, -0.2109917, 1.642045, 0, 0.3529412, 1, 1,
0.2904958, 0.005326746, 2.694528, 0, 0.345098, 1, 1,
0.2911777, -0.002722191, 2.177922, 0, 0.3411765, 1, 1,
0.2932069, 0.2887669, 0.339628, 0, 0.3333333, 1, 1,
0.2949614, -0.008096527, 3.705444, 0, 0.3294118, 1, 1,
0.2979903, -0.6906538, 1.947104, 0, 0.3215686, 1, 1,
0.2985274, -0.2115359, 5.346652, 0, 0.3176471, 1, 1,
0.2999101, -0.3729146, 3.95499, 0, 0.3098039, 1, 1,
0.3047492, 0.4896633, 0.2979089, 0, 0.3058824, 1, 1,
0.3065782, 0.2741942, 0.7395675, 0, 0.2980392, 1, 1,
0.3066655, -0.5710202, 4.583394, 0, 0.2901961, 1, 1,
0.3086149, 0.8949078, 0.1374637, 0, 0.2862745, 1, 1,
0.3117472, 0.161577, 2.443993, 0, 0.2784314, 1, 1,
0.3129011, -1.643937, 2.829823, 0, 0.2745098, 1, 1,
0.3154069, -0.03280384, -0.7914611, 0, 0.2666667, 1, 1,
0.3206943, -1.017846, 2.692015, 0, 0.2627451, 1, 1,
0.3336784, -0.1047994, 2.175905, 0, 0.254902, 1, 1,
0.3363704, 1.331245, 0.9076023, 0, 0.2509804, 1, 1,
0.3458768, -0.4898879, 2.758325, 0, 0.2431373, 1, 1,
0.3495947, -1.308516, 2.808464, 0, 0.2392157, 1, 1,
0.3516303, -0.2161352, 2.777496, 0, 0.2313726, 1, 1,
0.356408, -0.8096752, 2.984269, 0, 0.227451, 1, 1,
0.3567334, -0.3845004, 2.096998, 0, 0.2196078, 1, 1,
0.3621158, -0.7909408, 2.540927, 0, 0.2156863, 1, 1,
0.3635605, 0.5036332, 2.077305, 0, 0.2078431, 1, 1,
0.364026, 0.08550591, 1.025, 0, 0.2039216, 1, 1,
0.3717485, 0.08775817, 1.570952, 0, 0.1960784, 1, 1,
0.3741107, -0.7935399, 4.172793, 0, 0.1882353, 1, 1,
0.3837951, 0.1206548, 0.07863523, 0, 0.1843137, 1, 1,
0.38697, -0.05050966, 0.8831456, 0, 0.1764706, 1, 1,
0.3900175, -0.1944766, 0.2510926, 0, 0.172549, 1, 1,
0.3935789, -0.3008111, 3.48043, 0, 0.1647059, 1, 1,
0.3995526, -0.3816819, 2.886189, 0, 0.1607843, 1, 1,
0.4013357, 1.814908, 2.630347, 0, 0.1529412, 1, 1,
0.4024652, -0.7182532, 1.952086, 0, 0.1490196, 1, 1,
0.4028302, -1.527226, 1.854962, 0, 0.1411765, 1, 1,
0.4087724, 1.480134, -0.7457931, 0, 0.1372549, 1, 1,
0.4114747, 0.3137035, 0.5048784, 0, 0.1294118, 1, 1,
0.4139097, -1.135218, 3.366458, 0, 0.1254902, 1, 1,
0.416119, -0.4199927, 3.363159, 0, 0.1176471, 1, 1,
0.4174909, -1.087077, 2.794023, 0, 0.1137255, 1, 1,
0.4194825, -0.8281814, 1.275171, 0, 0.1058824, 1, 1,
0.4195328, 0.5976298, -0.05213972, 0, 0.09803922, 1, 1,
0.4211736, 1.003439, -0.1937327, 0, 0.09411765, 1, 1,
0.4220334, -0.206984, 4.416255, 0, 0.08627451, 1, 1,
0.4231904, -0.6984608, 2.228284, 0, 0.08235294, 1, 1,
0.4254272, 0.1431038, 1.263117, 0, 0.07450981, 1, 1,
0.4287743, -0.1598019, 1.936961, 0, 0.07058824, 1, 1,
0.4302038, -1.532551, 1.976949, 0, 0.0627451, 1, 1,
0.4338335, -2.353176, 1.778646, 0, 0.05882353, 1, 1,
0.4371325, -1.337021, 3.174482, 0, 0.05098039, 1, 1,
0.4375784, 0.4835308, 2.745852, 0, 0.04705882, 1, 1,
0.4376768, -1.016207, 2.827486, 0, 0.03921569, 1, 1,
0.4386216, 0.1639428, 1.054898, 0, 0.03529412, 1, 1,
0.4411061, -0.1717531, 1.880184, 0, 0.02745098, 1, 1,
0.4428027, 0.147991, -0.2533961, 0, 0.02352941, 1, 1,
0.4464505, -0.01381006, 3.016323, 0, 0.01568628, 1, 1,
0.4514995, -1.820296, 3.259959, 0, 0.01176471, 1, 1,
0.451583, -0.1331529, 2.288734, 0, 0.003921569, 1, 1,
0.4539927, 1.330228, -0.0790114, 0.003921569, 0, 1, 1,
0.4571565, 0.9183464, -1.047155, 0.007843138, 0, 1, 1,
0.4598832, -0.5280666, 2.249601, 0.01568628, 0, 1, 1,
0.4605601, 0.1104681, 1.219098, 0.01960784, 0, 1, 1,
0.4613044, -0.3623217, 1.849434, 0.02745098, 0, 1, 1,
0.4617954, 0.9119868, 0.1223628, 0.03137255, 0, 1, 1,
0.4633037, 1.440354, 3.050405, 0.03921569, 0, 1, 1,
0.4640587, -0.8276664, 3.306194, 0.04313726, 0, 1, 1,
0.4651307, -0.9152977, 3.865012, 0.05098039, 0, 1, 1,
0.46546, -0.3821947, 2.649847, 0.05490196, 0, 1, 1,
0.4665192, 0.251102, 2.952514, 0.0627451, 0, 1, 1,
0.4673465, 0.03577461, 1.179539, 0.06666667, 0, 1, 1,
0.470839, 2.239655, -0.9027754, 0.07450981, 0, 1, 1,
0.4711001, -1.239855, 1.999429, 0.07843138, 0, 1, 1,
0.4727249, 1.113096, 0.9582991, 0.08627451, 0, 1, 1,
0.4780566, -0.3541043, 2.239299, 0.09019608, 0, 1, 1,
0.478561, -0.0695568, 2.62574, 0.09803922, 0, 1, 1,
0.4865862, -0.869297, 3.415197, 0.1058824, 0, 1, 1,
0.4880015, 0.0707125, 0.6775533, 0.1098039, 0, 1, 1,
0.4922471, -0.5105146, 0.9247693, 0.1176471, 0, 1, 1,
0.4925619, -0.0517804, 2.057412, 0.1215686, 0, 1, 1,
0.4940932, -0.6712195, 2.768811, 0.1294118, 0, 1, 1,
0.4942923, -1.481273, 3.604059, 0.1333333, 0, 1, 1,
0.4948797, 1.014582, 0.1568412, 0.1411765, 0, 1, 1,
0.4960758, -0.5063943, 2.302045, 0.145098, 0, 1, 1,
0.4967633, -0.7381029, 1.119558, 0.1529412, 0, 1, 1,
0.4973022, -0.08354351, 3.040152, 0.1568628, 0, 1, 1,
0.5021247, 1.178435, 1.13717, 0.1647059, 0, 1, 1,
0.5022473, 1.152778, 1.605918, 0.1686275, 0, 1, 1,
0.5030916, -0.3233105, 3.015166, 0.1764706, 0, 1, 1,
0.506208, 0.2837766, 2.20242, 0.1803922, 0, 1, 1,
0.5122344, -1.076805, 2.19103, 0.1882353, 0, 1, 1,
0.5150415, 1.852901, 1.054372, 0.1921569, 0, 1, 1,
0.5216808, -0.4975936, 2.017758, 0.2, 0, 1, 1,
0.5227875, 0.5201932, -0.2033498, 0.2078431, 0, 1, 1,
0.5247321, 0.368768, 1.500728, 0.2117647, 0, 1, 1,
0.5253592, 0.8662114, -0.441802, 0.2196078, 0, 1, 1,
0.5260536, 0.231129, 2.425529, 0.2235294, 0, 1, 1,
0.5271097, -0.5668229, -1.729601, 0.2313726, 0, 1, 1,
0.5349631, 1.020217, 0.7359687, 0.2352941, 0, 1, 1,
0.5373172, 0.2971323, 0.9548021, 0.2431373, 0, 1, 1,
0.5385415, 1.429458, 1.657537, 0.2470588, 0, 1, 1,
0.5386617, -1.935358, 2.445723, 0.254902, 0, 1, 1,
0.5387774, -1.09145, 3.959212, 0.2588235, 0, 1, 1,
0.5394691, 0.477381, 1.564762, 0.2666667, 0, 1, 1,
0.5424719, -1.825668, 3.998446, 0.2705882, 0, 1, 1,
0.5451077, -0.2470481, 0.8622188, 0.2784314, 0, 1, 1,
0.5452252, -0.2538706, 1.545314, 0.282353, 0, 1, 1,
0.5459129, 0.04614592, 0.8531207, 0.2901961, 0, 1, 1,
0.5480283, -0.6569323, 3.170953, 0.2941177, 0, 1, 1,
0.5486029, 0.7173368, 1.077668, 0.3019608, 0, 1, 1,
0.5515481, -0.7991033, 2.015636, 0.3098039, 0, 1, 1,
0.5516798, 0.6472775, 2.691407, 0.3137255, 0, 1, 1,
0.5528458, 0.5278161, 2.028153, 0.3215686, 0, 1, 1,
0.5539451, 1.103534, 0.9613841, 0.3254902, 0, 1, 1,
0.5550151, -0.553088, 3.369534, 0.3333333, 0, 1, 1,
0.5575279, -0.6966587, 2.048598, 0.3372549, 0, 1, 1,
0.5594152, -1.268046, 1.38751, 0.345098, 0, 1, 1,
0.5608572, 0.03803314, 0.4949548, 0.3490196, 0, 1, 1,
0.5622095, 0.5962018, 0.9192143, 0.3568628, 0, 1, 1,
0.5673305, -0.8791155, 2.21636, 0.3607843, 0, 1, 1,
0.5724397, 2.141998, 1.903958, 0.3686275, 0, 1, 1,
0.5736442, -1.0556, 2.08238, 0.372549, 0, 1, 1,
0.5798943, -0.5900434, 2.046618, 0.3803922, 0, 1, 1,
0.5810212, 0.9908265, -0.08407982, 0.3843137, 0, 1, 1,
0.5897068, -1.031996, 1.362891, 0.3921569, 0, 1, 1,
0.5962303, -0.01220462, 1.580455, 0.3960784, 0, 1, 1,
0.5984253, -1.239579, 1.965663, 0.4039216, 0, 1, 1,
0.5985822, -0.06432064, 1.11686, 0.4117647, 0, 1, 1,
0.5989455, -0.2283719, 1.496207, 0.4156863, 0, 1, 1,
0.6008491, -1.146136, 2.617248, 0.4235294, 0, 1, 1,
0.6034434, -0.8609055, 1.787781, 0.427451, 0, 1, 1,
0.604603, -0.5872124, 0.3083053, 0.4352941, 0, 1, 1,
0.6053276, 0.279426, 2.179267, 0.4392157, 0, 1, 1,
0.6055776, 1.051239, 1.47769, 0.4470588, 0, 1, 1,
0.6056662, -0.7052428, 1.801013, 0.4509804, 0, 1, 1,
0.6076286, -0.775672, 3.538023, 0.4588235, 0, 1, 1,
0.616595, 0.5535614, 2.585351, 0.4627451, 0, 1, 1,
0.6169705, 0.6164495, 3.559571, 0.4705882, 0, 1, 1,
0.6174904, 1.07583, 1.705681, 0.4745098, 0, 1, 1,
0.6178283, 0.2305152, 1.540148, 0.4823529, 0, 1, 1,
0.6196562, 1.042022, -0.2709367, 0.4862745, 0, 1, 1,
0.6215345, -1.441539, 2.272957, 0.4941176, 0, 1, 1,
0.6236311, 1.046375, 0.09498467, 0.5019608, 0, 1, 1,
0.6250187, 1.32463, 1.189514, 0.5058824, 0, 1, 1,
0.6253211, -1.027838, 2.828152, 0.5137255, 0, 1, 1,
0.6254976, 1.246971, 0.6215934, 0.5176471, 0, 1, 1,
0.6344689, 0.8748299, 0.3664813, 0.5254902, 0, 1, 1,
0.6373717, 0.8587917, -1.538062, 0.5294118, 0, 1, 1,
0.6434669, 1.253866, 1.577358, 0.5372549, 0, 1, 1,
0.6490222, -0.7592981, 3.50447, 0.5411765, 0, 1, 1,
0.6533512, -0.05503584, 0.8731627, 0.5490196, 0, 1, 1,
0.6581662, 0.4161022, 2.092832, 0.5529412, 0, 1, 1,
0.6694568, 1.666044, 0.8401449, 0.5607843, 0, 1, 1,
0.6702935, 0.1639782, 3.820011, 0.5647059, 0, 1, 1,
0.6739184, 0.03938791, 1.447381, 0.572549, 0, 1, 1,
0.6740668, -0.03317688, 1.53525, 0.5764706, 0, 1, 1,
0.6772532, 0.6992841, 0.2037649, 0.5843138, 0, 1, 1,
0.6903597, 2.291742, 0.3463695, 0.5882353, 0, 1, 1,
0.6995522, 0.5741941, 1.881162, 0.5960785, 0, 1, 1,
0.699587, -0.1942514, 2.389127, 0.6039216, 0, 1, 1,
0.713498, -0.8574057, 2.833026, 0.6078432, 0, 1, 1,
0.7146938, 0.181618, 1.311324, 0.6156863, 0, 1, 1,
0.7215805, 0.3117653, -0.1610177, 0.6196079, 0, 1, 1,
0.7233778, 0.8336627, 0.6159209, 0.627451, 0, 1, 1,
0.7235352, -0.08930028, 1.43583, 0.6313726, 0, 1, 1,
0.7257318, 1.271919, 1.911604, 0.6392157, 0, 1, 1,
0.7334179, -0.8528432, 2.754013, 0.6431373, 0, 1, 1,
0.7343069, 0.2277799, 0.4015406, 0.6509804, 0, 1, 1,
0.7351846, 0.8822792, -0.5883556, 0.654902, 0, 1, 1,
0.7394879, 0.2391799, 1.943977, 0.6627451, 0, 1, 1,
0.7496198, -0.4644539, 3.018485, 0.6666667, 0, 1, 1,
0.7539618, -1.143571, 4.01077, 0.6745098, 0, 1, 1,
0.7569267, -0.8740664, 1.918044, 0.6784314, 0, 1, 1,
0.757468, 1.947434, 0.6755424, 0.6862745, 0, 1, 1,
0.7583793, -0.3827482, 0.4433801, 0.6901961, 0, 1, 1,
0.7608274, -0.8933377, 2.550056, 0.6980392, 0, 1, 1,
0.7627816, -1.733744, 3.257099, 0.7058824, 0, 1, 1,
0.7706906, 0.08139622, 0.3660013, 0.7098039, 0, 1, 1,
0.7724141, 1.948594, 0.3925607, 0.7176471, 0, 1, 1,
0.7742193, -1.32562, 2.293307, 0.7215686, 0, 1, 1,
0.7792159, -0.1453397, 1.698082, 0.7294118, 0, 1, 1,
0.7861887, -1.666232, 1.460334, 0.7333333, 0, 1, 1,
0.7869126, 0.7813721, 0.2466757, 0.7411765, 0, 1, 1,
0.7909818, -0.5085507, 0.664696, 0.7450981, 0, 1, 1,
0.7924442, 0.07235324, 2.464074, 0.7529412, 0, 1, 1,
0.7950984, 0.3344558, 2.274955, 0.7568628, 0, 1, 1,
0.7972468, 0.4192757, 2.281551, 0.7647059, 0, 1, 1,
0.8045225, -0.334314, 2.567876, 0.7686275, 0, 1, 1,
0.807025, -0.5577497, 1.913876, 0.7764706, 0, 1, 1,
0.8119767, -0.4848597, 1.701708, 0.7803922, 0, 1, 1,
0.8179099, 0.7877998, 2.045463, 0.7882353, 0, 1, 1,
0.8233241, 0.8039735, 0.3998101, 0.7921569, 0, 1, 1,
0.8274307, 0.756036, 1.876181, 0.8, 0, 1, 1,
0.8360066, -0.9681576, 2.466106, 0.8078431, 0, 1, 1,
0.8407124, -0.3781603, 2.254763, 0.8117647, 0, 1, 1,
0.8472426, -0.6566876, 3.408057, 0.8196079, 0, 1, 1,
0.851087, -1.118051, 3.533461, 0.8235294, 0, 1, 1,
0.8520111, -1.287778, 3.428468, 0.8313726, 0, 1, 1,
0.8576244, 0.7013867, 0.292639, 0.8352941, 0, 1, 1,
0.8581015, -0.3791553, 1.660282, 0.8431373, 0, 1, 1,
0.8581722, -1.111078, 1.950027, 0.8470588, 0, 1, 1,
0.8599757, 0.600831, 0.4761353, 0.854902, 0, 1, 1,
0.8616278, 0.4327442, 1.199186, 0.8588235, 0, 1, 1,
0.8618422, -1.891808, 0.9798152, 0.8666667, 0, 1, 1,
0.8637375, -0.1292726, 2.274202, 0.8705882, 0, 1, 1,
0.8684596, 0.307973, 1.752029, 0.8784314, 0, 1, 1,
0.8728786, 0.05053588, 1.530822, 0.8823529, 0, 1, 1,
0.8814397, -0.06492423, 1.794433, 0.8901961, 0, 1, 1,
0.8823565, -1.027319, 2.738251, 0.8941177, 0, 1, 1,
0.8841677, 0.09135003, -0.2257037, 0.9019608, 0, 1, 1,
0.8863041, 0.1698708, 2.380008, 0.9098039, 0, 1, 1,
0.8885282, -0.9050394, 3.29898, 0.9137255, 0, 1, 1,
0.8917039, -0.4383253, 1.673749, 0.9215686, 0, 1, 1,
0.8928906, -3.115341, 5.312422, 0.9254902, 0, 1, 1,
0.8939165, -0.6100288, 3.641162, 0.9333333, 0, 1, 1,
0.8955235, 0.8758548, 0.7016112, 0.9372549, 0, 1, 1,
0.8970194, 1.349228, 0.9433097, 0.945098, 0, 1, 1,
0.9073429, -1.747396, 1.967455, 0.9490196, 0, 1, 1,
0.9118195, -1.756908, 3.589148, 0.9568627, 0, 1, 1,
0.9150375, -0.7372722, 3.678606, 0.9607843, 0, 1, 1,
0.9199559, -0.8805854, 2.63335, 0.9686275, 0, 1, 1,
0.9262289, 1.96383, 1.985215, 0.972549, 0, 1, 1,
0.9393013, -1.310674, 2.1236, 0.9803922, 0, 1, 1,
0.9477966, -0.8493618, 0.5913211, 0.9843137, 0, 1, 1,
0.9572188, -0.2089023, 1.797841, 0.9921569, 0, 1, 1,
0.9584201, 0.5466725, 0.4106367, 0.9960784, 0, 1, 1,
0.9598288, 0.9825422, 1.003462, 1, 0, 0.9960784, 1,
0.9725978, -1.522557, 1.003593, 1, 0, 0.9882353, 1,
0.9774632, 1.332574, 2.655218, 1, 0, 0.9843137, 1,
0.9780524, 0.2085146, 1.896932, 1, 0, 0.9764706, 1,
0.9801423, -1.640921, 3.086777, 1, 0, 0.972549, 1,
0.9829316, -0.126359, 1.118014, 1, 0, 0.9647059, 1,
0.9861689, -0.2038755, 3.152134, 1, 0, 0.9607843, 1,
0.9878933, -0.8117717, 3.544174, 1, 0, 0.9529412, 1,
0.9886739, 0.7753693, 0.3988472, 1, 0, 0.9490196, 1,
0.9936104, 0.5844431, -0.02398568, 1, 0, 0.9411765, 1,
1.000264, 1.520814, 1.321789, 1, 0, 0.9372549, 1,
1.00029, -0.2403591, 2.37098, 1, 0, 0.9294118, 1,
1.010154, -1.185709, 2.420904, 1, 0, 0.9254902, 1,
1.013337, 0.1360623, 2.38458, 1, 0, 0.9176471, 1,
1.031734, -0.9464558, 2.212829, 1, 0, 0.9137255, 1,
1.033609, -1.622822, 3.032744, 1, 0, 0.9058824, 1,
1.046289, 0.6793276, 2.22367, 1, 0, 0.9019608, 1,
1.060229, 0.1704971, 2.087224, 1, 0, 0.8941177, 1,
1.060359, 1.643255, 1.264144, 1, 0, 0.8862745, 1,
1.06372, 0.4288744, 0.4918524, 1, 0, 0.8823529, 1,
1.069469, -0.7081667, 1.957221, 1, 0, 0.8745098, 1,
1.084789, 0.4747191, 3.004399, 1, 0, 0.8705882, 1,
1.088273, 0.6624631, 1.979036, 1, 0, 0.8627451, 1,
1.095326, 0.9310488, -0.1160356, 1, 0, 0.8588235, 1,
1.097884, -0.304551, 1.903979, 1, 0, 0.8509804, 1,
1.098465, -0.1947802, 2.347847, 1, 0, 0.8470588, 1,
1.105982, -0.2765292, 1.74495, 1, 0, 0.8392157, 1,
1.113332, -1.330163, 1.751909, 1, 0, 0.8352941, 1,
1.119197, -0.2487497, 2.657386, 1, 0, 0.827451, 1,
1.12168, 0.5991098, 0.5401934, 1, 0, 0.8235294, 1,
1.122359, 1.173964, -0.4744308, 1, 0, 0.8156863, 1,
1.123237, -1.424991, 3.791155, 1, 0, 0.8117647, 1,
1.143919, -1.066524, 2.388661, 1, 0, 0.8039216, 1,
1.146551, 1.031926, 1.577224, 1, 0, 0.7960784, 1,
1.151885, -1.171572, 3.285452, 1, 0, 0.7921569, 1,
1.152489, 0.3370699, 2.745731, 1, 0, 0.7843137, 1,
1.161604, -0.8050829, 2.379826, 1, 0, 0.7803922, 1,
1.175167, -0.1867763, 2.901924, 1, 0, 0.772549, 1,
1.180655, 1.584518, 1.950087, 1, 0, 0.7686275, 1,
1.181125, -0.5719794, 2.445708, 1, 0, 0.7607843, 1,
1.18616, -0.2105497, 3.397915, 1, 0, 0.7568628, 1,
1.188015, -0.126254, -1.257854, 1, 0, 0.7490196, 1,
1.191399, -0.8067935, 2.737853, 1, 0, 0.7450981, 1,
1.195997, 1.234541, -0.1609048, 1, 0, 0.7372549, 1,
1.19646, -0.08080383, 2.247238, 1, 0, 0.7333333, 1,
1.203354, 1.768082, 0.373523, 1, 0, 0.7254902, 1,
1.204977, -0.5652508, 3.92161, 1, 0, 0.7215686, 1,
1.207842, 0.7337707, -0.6892221, 1, 0, 0.7137255, 1,
1.207874, 0.7580436, -0.6756791, 1, 0, 0.7098039, 1,
1.213587, -0.5745983, 1.441225, 1, 0, 0.7019608, 1,
1.21427, -1.107468, 3.011309, 1, 0, 0.6941177, 1,
1.220235, -0.2425916, 2.041766, 1, 0, 0.6901961, 1,
1.222478, 0.3751577, 0.7324713, 1, 0, 0.682353, 1,
1.228267, -0.7312455, 2.136053, 1, 0, 0.6784314, 1,
1.23015, 0.9988712, -1.273284, 1, 0, 0.6705883, 1,
1.234607, 0.2580969, 1.546925, 1, 0, 0.6666667, 1,
1.263338, -0.4415699, 2.073405, 1, 0, 0.6588235, 1,
1.269627, 1.803547, 0.8997748, 1, 0, 0.654902, 1,
1.298785, 1.149134, 2.967839, 1, 0, 0.6470588, 1,
1.306925, -1.036921, 2.578367, 1, 0, 0.6431373, 1,
1.310062, 0.2844643, 1.078322, 1, 0, 0.6352941, 1,
1.316506, -0.1559247, 2.079768, 1, 0, 0.6313726, 1,
1.330087, 0.1973156, 0.6250745, 1, 0, 0.6235294, 1,
1.331459, -1.002847, 2.179931, 1, 0, 0.6196079, 1,
1.331663, -0.3246892, 1.825648, 1, 0, 0.6117647, 1,
1.335704, -2.331089, 2.69723, 1, 0, 0.6078432, 1,
1.347545, -0.9810162, 3.120982, 1, 0, 0.6, 1,
1.353276, -0.00630013, 0.975816, 1, 0, 0.5921569, 1,
1.353891, -0.1947321, 0.6927088, 1, 0, 0.5882353, 1,
1.359983, -0.2328808, 2.573105, 1, 0, 0.5803922, 1,
1.366696, -1.707466, 0.4872774, 1, 0, 0.5764706, 1,
1.373664, 0.1653145, 0.598927, 1, 0, 0.5686275, 1,
1.379423, 1.823536, 0.7515785, 1, 0, 0.5647059, 1,
1.381139, -0.5808158, 2.786409, 1, 0, 0.5568628, 1,
1.388953, -0.8068127, 1.973624, 1, 0, 0.5529412, 1,
1.39912, -0.259075, 2.772084, 1, 0, 0.5450981, 1,
1.400782, 0.7650242, 0.8015933, 1, 0, 0.5411765, 1,
1.409279, 0.5971651, 2.254265, 1, 0, 0.5333334, 1,
1.410549, 0.09993121, 2.002079, 1, 0, 0.5294118, 1,
1.426576, -0.8733559, 3.712964, 1, 0, 0.5215687, 1,
1.434477, -0.4161542, 2.501822, 1, 0, 0.5176471, 1,
1.440007, 0.8230625, 1.398175, 1, 0, 0.509804, 1,
1.440331, 0.2590766, 1.118926, 1, 0, 0.5058824, 1,
1.444098, 1.196367, 0.2242032, 1, 0, 0.4980392, 1,
1.448843, 0.9403387, 1.131534, 1, 0, 0.4901961, 1,
1.452151, 1.405945, 0.01174105, 1, 0, 0.4862745, 1,
1.452865, 0.5480658, 1.082709, 1, 0, 0.4784314, 1,
1.46451, -0.7705294, 2.046582, 1, 0, 0.4745098, 1,
1.468184, 1.04817, 1.07609, 1, 0, 0.4666667, 1,
1.470963, -0.7837048, 1.624681, 1, 0, 0.4627451, 1,
1.474711, -0.1135694, 3.145219, 1, 0, 0.454902, 1,
1.489567, -2.425518, 2.786401, 1, 0, 0.4509804, 1,
1.49254, 0.2482003, 2.079783, 1, 0, 0.4431373, 1,
1.500496, 0.233321, 1.827484, 1, 0, 0.4392157, 1,
1.503121, 0.4839392, 2.278708, 1, 0, 0.4313726, 1,
1.507065, -0.8469414, 1.943446, 1, 0, 0.427451, 1,
1.522862, -0.08978841, -0.3389331, 1, 0, 0.4196078, 1,
1.525625, -0.6718491, 3.77335, 1, 0, 0.4156863, 1,
1.529329, 0.05550281, 0.4008045, 1, 0, 0.4078431, 1,
1.531389, 0.02339453, 1.561847, 1, 0, 0.4039216, 1,
1.535854, 0.8835919, 1.011337, 1, 0, 0.3960784, 1,
1.541565, 0.7963359, 0.4233592, 1, 0, 0.3882353, 1,
1.546435, -0.212595, 1.113631, 1, 0, 0.3843137, 1,
1.562232, 0.5911132, 0.5911566, 1, 0, 0.3764706, 1,
1.571581, 0.9219497, 0.08145885, 1, 0, 0.372549, 1,
1.589288, -0.4922191, 1.809759, 1, 0, 0.3647059, 1,
1.598998, 1.079697, 0.8857183, 1, 0, 0.3607843, 1,
1.605294, 1.732052, 0.8490143, 1, 0, 0.3529412, 1,
1.625962, -0.8990712, 1.940961, 1, 0, 0.3490196, 1,
1.644474, 0.9783629, -0.3163372, 1, 0, 0.3411765, 1,
1.655397, 0.1021567, 0.1987526, 1, 0, 0.3372549, 1,
1.657571, 0.7396033, -0.6335879, 1, 0, 0.3294118, 1,
1.679434, -1.073772, 1.874793, 1, 0, 0.3254902, 1,
1.686048, 0.9812326, 1.298808, 1, 0, 0.3176471, 1,
1.690013, 1.036873, 1.261743, 1, 0, 0.3137255, 1,
1.700897, -0.06254484, 1.529894, 1, 0, 0.3058824, 1,
1.714416, -1.990833, 2.845183, 1, 0, 0.2980392, 1,
1.718829, -0.295811, 1.948483, 1, 0, 0.2941177, 1,
1.719605, 0.4138008, 0.3556739, 1, 0, 0.2862745, 1,
1.731437, -0.9444532, 1.482689, 1, 0, 0.282353, 1,
1.747237, -0.5951442, 1.536814, 1, 0, 0.2745098, 1,
1.747429, -0.5125125, 2.222438, 1, 0, 0.2705882, 1,
1.754427, -1.183623, -0.5332787, 1, 0, 0.2627451, 1,
1.764724, -1.137626, 1.146792, 1, 0, 0.2588235, 1,
1.769764, 0.2236353, 1.339265, 1, 0, 0.2509804, 1,
1.78033, 0.1228899, 2.927548, 1, 0, 0.2470588, 1,
1.788334, -0.381096, 0.5399198, 1, 0, 0.2392157, 1,
1.827277, 0.4556063, 0.9787199, 1, 0, 0.2352941, 1,
1.829841, 0.3542924, 0.9585738, 1, 0, 0.227451, 1,
1.849279, -0.1267112, 1.191794, 1, 0, 0.2235294, 1,
1.850959, -0.5145025, -0.007775797, 1, 0, 0.2156863, 1,
1.852709, -0.4463246, 3.673109, 1, 0, 0.2117647, 1,
1.867239, 0.7804587, 1.024389, 1, 0, 0.2039216, 1,
1.881456, -0.3590247, 3.074636, 1, 0, 0.1960784, 1,
1.881582, -2.445574, 3.412631, 1, 0, 0.1921569, 1,
1.904433, 0.04572888, 2.48187, 1, 0, 0.1843137, 1,
1.929972, 0.969829, -0.6730549, 1, 0, 0.1803922, 1,
1.937331, 0.7819297, 2.722928, 1, 0, 0.172549, 1,
1.943944, 0.7157299, 0.6684296, 1, 0, 0.1686275, 1,
1.980878, 0.01555811, 1.794163, 1, 0, 0.1607843, 1,
2.010079, -1.787117, 4.301983, 1, 0, 0.1568628, 1,
2.041984, 0.6797208, 1.775424, 1, 0, 0.1490196, 1,
2.054821, 0.8148544, 0.7177359, 1, 0, 0.145098, 1,
2.134643, 1.380655, 0.7984044, 1, 0, 0.1372549, 1,
2.137007, -0.7842202, 1.692379, 1, 0, 0.1333333, 1,
2.141458, 0.2660612, 2.500429, 1, 0, 0.1254902, 1,
2.161089, 2.130136, 0.07888487, 1, 0, 0.1215686, 1,
2.213505, -0.1779335, 1.823232, 1, 0, 0.1137255, 1,
2.263439, -0.2093574, 0.8001735, 1, 0, 0.1098039, 1,
2.268666, 1.110096, 0.4722157, 1, 0, 0.1019608, 1,
2.276257, 0.8882403, 1.046558, 1, 0, 0.09411765, 1,
2.395979, -0.1342007, 1.560985, 1, 0, 0.09019608, 1,
2.401589, 0.7191976, 1.270331, 1, 0, 0.08235294, 1,
2.418033, 1.960116, 1.554967, 1, 0, 0.07843138, 1,
2.439542, -1.588468, 2.726019, 1, 0, 0.07058824, 1,
2.443447, -0.1110218, 0.9278894, 1, 0, 0.06666667, 1,
2.450864, 1.210004, 1.011762, 1, 0, 0.05882353, 1,
2.491013, -0.2672453, 1.12743, 1, 0, 0.05490196, 1,
2.502898, -0.8593711, 1.898771, 1, 0, 0.04705882, 1,
2.55447, 0.3525256, 2.148892, 1, 0, 0.04313726, 1,
2.555456, 0.5414082, 0.9312924, 1, 0, 0.03529412, 1,
2.624885, 1.047848, 1.089477, 1, 0, 0.03137255, 1,
2.627919, -0.1964283, 2.247621, 1, 0, 0.02352941, 1,
2.87294, 0.1087351, 1.469914, 1, 0, 0.01960784, 1,
3.456091, 0.6250646, 1.697371, 1, 0, 0.01176471, 1,
3.5746, -1.073265, 0.5264211, 1, 0, 0.007843138, 1
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
0.1290879, -4.815805, -7.153422, 0, -0.5, 0.5, 0.5,
0.1290879, -4.815805, -7.153422, 1, -0.5, 0.5, 0.5,
0.1290879, -4.815805, -7.153422, 1, 1.5, 0.5, 0.5,
0.1290879, -4.815805, -7.153422, 0, 1.5, 0.5, 0.5
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
-4.484453, -0.1125591, -7.153422, 0, -0.5, 0.5, 0.5,
-4.484453, -0.1125591, -7.153422, 1, -0.5, 0.5, 0.5,
-4.484453, -0.1125591, -7.153422, 1, 1.5, 0.5, 0.5,
-4.484453, -0.1125591, -7.153422, 0, 1.5, 0.5, 0.5
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
-4.484453, -4.815805, 0.004664421, 0, -0.5, 0.5, 0.5,
-4.484453, -4.815805, 0.004664421, 1, -0.5, 0.5, 0.5,
-4.484453, -4.815805, 0.004664421, 1, 1.5, 0.5, 0.5,
-4.484453, -4.815805, 0.004664421, 0, 1.5, 0.5, 0.5
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
-3, -3.730441, -5.501556,
3, -3.730441, -5.501556,
-3, -3.730441, -5.501556,
-3, -3.911335, -5.776867,
-2, -3.730441, -5.501556,
-2, -3.911335, -5.776867,
-1, -3.730441, -5.501556,
-1, -3.911335, -5.776867,
0, -3.730441, -5.501556,
0, -3.911335, -5.776867,
1, -3.730441, -5.501556,
1, -3.911335, -5.776867,
2, -3.730441, -5.501556,
2, -3.911335, -5.776867,
3, -3.730441, -5.501556,
3, -3.911335, -5.776867
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
-3, -4.273123, -6.327489, 0, -0.5, 0.5, 0.5,
-3, -4.273123, -6.327489, 1, -0.5, 0.5, 0.5,
-3, -4.273123, -6.327489, 1, 1.5, 0.5, 0.5,
-3, -4.273123, -6.327489, 0, 1.5, 0.5, 0.5,
-2, -4.273123, -6.327489, 0, -0.5, 0.5, 0.5,
-2, -4.273123, -6.327489, 1, -0.5, 0.5, 0.5,
-2, -4.273123, -6.327489, 1, 1.5, 0.5, 0.5,
-2, -4.273123, -6.327489, 0, 1.5, 0.5, 0.5,
-1, -4.273123, -6.327489, 0, -0.5, 0.5, 0.5,
-1, -4.273123, -6.327489, 1, -0.5, 0.5, 0.5,
-1, -4.273123, -6.327489, 1, 1.5, 0.5, 0.5,
-1, -4.273123, -6.327489, 0, 1.5, 0.5, 0.5,
0, -4.273123, -6.327489, 0, -0.5, 0.5, 0.5,
0, -4.273123, -6.327489, 1, -0.5, 0.5, 0.5,
0, -4.273123, -6.327489, 1, 1.5, 0.5, 0.5,
0, -4.273123, -6.327489, 0, 1.5, 0.5, 0.5,
1, -4.273123, -6.327489, 0, -0.5, 0.5, 0.5,
1, -4.273123, -6.327489, 1, -0.5, 0.5, 0.5,
1, -4.273123, -6.327489, 1, 1.5, 0.5, 0.5,
1, -4.273123, -6.327489, 0, 1.5, 0.5, 0.5,
2, -4.273123, -6.327489, 0, -0.5, 0.5, 0.5,
2, -4.273123, -6.327489, 1, -0.5, 0.5, 0.5,
2, -4.273123, -6.327489, 1, 1.5, 0.5, 0.5,
2, -4.273123, -6.327489, 0, 1.5, 0.5, 0.5,
3, -4.273123, -6.327489, 0, -0.5, 0.5, 0.5,
3, -4.273123, -6.327489, 1, -0.5, 0.5, 0.5,
3, -4.273123, -6.327489, 1, 1.5, 0.5, 0.5,
3, -4.273123, -6.327489, 0, 1.5, 0.5, 0.5
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
-3.41979, -2, -5.501556,
-3.41979, 2, -5.501556,
-3.41979, -2, -5.501556,
-3.597234, -2, -5.776867,
-3.41979, 0, -5.501556,
-3.597234, 0, -5.776867,
-3.41979, 2, -5.501556,
-3.597234, 2, -5.776867
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
"0",
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
-3.952122, -2, -6.327489, 0, -0.5, 0.5, 0.5,
-3.952122, -2, -6.327489, 1, -0.5, 0.5, 0.5,
-3.952122, -2, -6.327489, 1, 1.5, 0.5, 0.5,
-3.952122, -2, -6.327489, 0, 1.5, 0.5, 0.5,
-3.952122, 0, -6.327489, 0, -0.5, 0.5, 0.5,
-3.952122, 0, -6.327489, 1, -0.5, 0.5, 0.5,
-3.952122, 0, -6.327489, 1, 1.5, 0.5, 0.5,
-3.952122, 0, -6.327489, 0, 1.5, 0.5, 0.5,
-3.952122, 2, -6.327489, 0, -0.5, 0.5, 0.5,
-3.952122, 2, -6.327489, 1, -0.5, 0.5, 0.5,
-3.952122, 2, -6.327489, 1, 1.5, 0.5, 0.5,
-3.952122, 2, -6.327489, 0, 1.5, 0.5, 0.5
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
-3.41979, -3.730441, -4,
-3.41979, -3.730441, 4,
-3.41979, -3.730441, -4,
-3.597234, -3.911335, -4,
-3.41979, -3.730441, -2,
-3.597234, -3.911335, -2,
-3.41979, -3.730441, 0,
-3.597234, -3.911335, 0,
-3.41979, -3.730441, 2,
-3.597234, -3.911335, 2,
-3.41979, -3.730441, 4,
-3.597234, -3.911335, 4
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
-3.952122, -4.273123, -4, 0, -0.5, 0.5, 0.5,
-3.952122, -4.273123, -4, 1, -0.5, 0.5, 0.5,
-3.952122, -4.273123, -4, 1, 1.5, 0.5, 0.5,
-3.952122, -4.273123, -4, 0, 1.5, 0.5, 0.5,
-3.952122, -4.273123, -2, 0, -0.5, 0.5, 0.5,
-3.952122, -4.273123, -2, 1, -0.5, 0.5, 0.5,
-3.952122, -4.273123, -2, 1, 1.5, 0.5, 0.5,
-3.952122, -4.273123, -2, 0, 1.5, 0.5, 0.5,
-3.952122, -4.273123, 0, 0, -0.5, 0.5, 0.5,
-3.952122, -4.273123, 0, 1, -0.5, 0.5, 0.5,
-3.952122, -4.273123, 0, 1, 1.5, 0.5, 0.5,
-3.952122, -4.273123, 0, 0, 1.5, 0.5, 0.5,
-3.952122, -4.273123, 2, 0, -0.5, 0.5, 0.5,
-3.952122, -4.273123, 2, 1, -0.5, 0.5, 0.5,
-3.952122, -4.273123, 2, 1, 1.5, 0.5, 0.5,
-3.952122, -4.273123, 2, 0, 1.5, 0.5, 0.5,
-3.952122, -4.273123, 4, 0, -0.5, 0.5, 0.5,
-3.952122, -4.273123, 4, 1, -0.5, 0.5, 0.5,
-3.952122, -4.273123, 4, 1, 1.5, 0.5, 0.5,
-3.952122, -4.273123, 4, 0, 1.5, 0.5, 0.5
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
-3.41979, -3.730441, -5.501556,
-3.41979, 3.505322, -5.501556,
-3.41979, -3.730441, 5.510885,
-3.41979, 3.505322, 5.510885,
-3.41979, -3.730441, -5.501556,
-3.41979, -3.730441, 5.510885,
-3.41979, 3.505322, -5.501556,
-3.41979, 3.505322, 5.510885,
-3.41979, -3.730441, -5.501556,
3.677966, -3.730441, -5.501556,
-3.41979, -3.730441, 5.510885,
3.677966, -3.730441, 5.510885,
-3.41979, 3.505322, -5.501556,
3.677966, 3.505322, -5.501556,
-3.41979, 3.505322, 5.510885,
3.677966, 3.505322, 5.510885,
3.677966, -3.730441, -5.501556,
3.677966, 3.505322, -5.501556,
3.677966, -3.730441, 5.510885,
3.677966, 3.505322, 5.510885,
3.677966, -3.730441, -5.501556,
3.677966, -3.730441, 5.510885,
3.677966, 3.505322, -5.501556,
3.677966, 3.505322, 5.510885
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
var radius = 7.992037;
var distance = 35.55747;
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
mvMatrix.translate( -0.1290879, 0.1125591, -0.004664421 );
mvMatrix.scale( 1.217448, 1.194227, 0.7846714 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.55747);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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


