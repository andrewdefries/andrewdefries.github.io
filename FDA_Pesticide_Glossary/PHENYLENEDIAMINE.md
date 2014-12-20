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
-3.016141, -0.08692303, -1.454673, 1, 0, 0, 1,
-2.782511, -1.538365, -0.477442, 1, 0.007843138, 0, 1,
-2.625162, 0.9927163, -2.776694, 1, 0.01176471, 0, 1,
-2.545557, 0.7480374, 0.489051, 1, 0.01960784, 0, 1,
-2.501854, 0.3637211, -0.6256143, 1, 0.02352941, 0, 1,
-2.420522, -0.952719, 0.2965986, 1, 0.03137255, 0, 1,
-2.412686, 0.4477671, -1.620937, 1, 0.03529412, 0, 1,
-2.351432, 0.3018902, -1.023674, 1, 0.04313726, 0, 1,
-2.341825, 0.2025122, 0.01547585, 1, 0.04705882, 0, 1,
-2.304747, 0.7870902, 0.2495725, 1, 0.05490196, 0, 1,
-2.292094, -2.210831, -3.986974, 1, 0.05882353, 0, 1,
-2.286384, -0.9636579, -3.719889, 1, 0.06666667, 0, 1,
-2.280146, 0.03408568, -1.420221, 1, 0.07058824, 0, 1,
-2.278447, 0.8964454, -1.002427, 1, 0.07843138, 0, 1,
-2.236823, -0.5731269, -2.094254, 1, 0.08235294, 0, 1,
-2.205802, -0.4421647, -0.5624304, 1, 0.09019608, 0, 1,
-2.202696, 0.2956445, -0.8758229, 1, 0.09411765, 0, 1,
-2.17708, -0.2266196, -2.306689, 1, 0.1019608, 0, 1,
-2.153291, 2.096805, -1.708532, 1, 0.1098039, 0, 1,
-2.151165, -2.337363, -2.446903, 1, 0.1137255, 0, 1,
-2.114768, 0.3211834, 0.09727263, 1, 0.1215686, 0, 1,
-2.108592, 0.3154031, -1.363809, 1, 0.1254902, 0, 1,
-2.100077, -1.059311, -1.513795, 1, 0.1333333, 0, 1,
-2.055214, -0.646692, -3.044078, 1, 0.1372549, 0, 1,
-2.015702, -0.5866168, -0.5917695, 1, 0.145098, 0, 1,
-2.003656, -1.01683, -2.032008, 1, 0.1490196, 0, 1,
-1.993731, 0.08847754, -1.253373, 1, 0.1568628, 0, 1,
-1.992036, 1.149961, -0.7672662, 1, 0.1607843, 0, 1,
-1.977804, 1.759426, -0.7220938, 1, 0.1686275, 0, 1,
-1.962132, -0.1560988, -0.9130777, 1, 0.172549, 0, 1,
-1.912832, -0.1201164, -1.069102, 1, 0.1803922, 0, 1,
-1.911063, -0.5255792, -1.370509, 1, 0.1843137, 0, 1,
-1.891865, -1.656164, -1.678925, 1, 0.1921569, 0, 1,
-1.876629, 0.975303, -1.141811, 1, 0.1960784, 0, 1,
-1.875834, -0.4264315, 0.3598586, 1, 0.2039216, 0, 1,
-1.858895, 0.941673, -2.001148, 1, 0.2117647, 0, 1,
-1.838689, -0.1021731, -1.969548, 1, 0.2156863, 0, 1,
-1.823534, -0.7288831, -3.504598, 1, 0.2235294, 0, 1,
-1.818325, 1.119738, -1.701509, 1, 0.227451, 0, 1,
-1.817252, 0.6662045, 0.558017, 1, 0.2352941, 0, 1,
-1.811338, 0.7359322, -0.2864087, 1, 0.2392157, 0, 1,
-1.799735, -0.6430321, -1.644835, 1, 0.2470588, 0, 1,
-1.79309, -0.400804, -0.05826319, 1, 0.2509804, 0, 1,
-1.783467, -1.931595, -1.782523, 1, 0.2588235, 0, 1,
-1.757733, 0.9591744, -1.415416, 1, 0.2627451, 0, 1,
-1.701694, 0.6715109, -2.585081, 1, 0.2705882, 0, 1,
-1.693651, -2.147411, -2.252994, 1, 0.2745098, 0, 1,
-1.690747, -0.1172448, -1.027373, 1, 0.282353, 0, 1,
-1.686991, -0.5994427, -1.965873, 1, 0.2862745, 0, 1,
-1.671503, -0.6037971, 0.1985141, 1, 0.2941177, 0, 1,
-1.65297, -0.7864767, -0.7661331, 1, 0.3019608, 0, 1,
-1.651394, 0.8535244, 0.1675489, 1, 0.3058824, 0, 1,
-1.638596, 0.6185711, 0.05692559, 1, 0.3137255, 0, 1,
-1.637687, 0.1501033, -3.074456, 1, 0.3176471, 0, 1,
-1.632076, -0.0845262, -1.568665, 1, 0.3254902, 0, 1,
-1.619431, 0.4216908, -3.1959, 1, 0.3294118, 0, 1,
-1.618165, 0.5949092, -2.31359, 1, 0.3372549, 0, 1,
-1.616864, -1.450432, -3.183538, 1, 0.3411765, 0, 1,
-1.615962, -1.681816, -2.162015, 1, 0.3490196, 0, 1,
-1.615193, -0.8228775, -1.654195, 1, 0.3529412, 0, 1,
-1.601407, -1.606242, -1.906736, 1, 0.3607843, 0, 1,
-1.582901, 0.8088337, -1.52207, 1, 0.3647059, 0, 1,
-1.581147, 0.3103377, -1.148258, 1, 0.372549, 0, 1,
-1.568667, 0.4272858, -0.6009713, 1, 0.3764706, 0, 1,
-1.557694, 0.5742424, -1.081293, 1, 0.3843137, 0, 1,
-1.537322, 0.2277794, 1.590762, 1, 0.3882353, 0, 1,
-1.534235, 0.8654379, -1.358215, 1, 0.3960784, 0, 1,
-1.527845, 0.8580847, -1.193568, 1, 0.4039216, 0, 1,
-1.520271, -2.61276, -2.324153, 1, 0.4078431, 0, 1,
-1.510763, -2.480462, -2.622848, 1, 0.4156863, 0, 1,
-1.491257, -1.065936, -2.350663, 1, 0.4196078, 0, 1,
-1.489274, 0.7114173, -0.5240715, 1, 0.427451, 0, 1,
-1.474151, -0.3829801, -1.278213, 1, 0.4313726, 0, 1,
-1.473244, -2.030402, -1.308997, 1, 0.4392157, 0, 1,
-1.463996, -0.3599049, -0.6450129, 1, 0.4431373, 0, 1,
-1.450323, 0.2371629, -1.688307, 1, 0.4509804, 0, 1,
-1.433436, 0.5097465, -0.1186597, 1, 0.454902, 0, 1,
-1.428923, -0.1774747, -0.66937, 1, 0.4627451, 0, 1,
-1.428096, -1.770172, -1.493456, 1, 0.4666667, 0, 1,
-1.427408, 1.222328, -0.3611675, 1, 0.4745098, 0, 1,
-1.426712, -1.180336, -1.196211, 1, 0.4784314, 0, 1,
-1.424348, -0.10127, -0.8686824, 1, 0.4862745, 0, 1,
-1.420132, -0.9831082, -1.598566, 1, 0.4901961, 0, 1,
-1.410977, 0.5212822, -0.8378326, 1, 0.4980392, 0, 1,
-1.410448, 0.009839441, -1.694968, 1, 0.5058824, 0, 1,
-1.405928, -0.3314918, -2.144246, 1, 0.509804, 0, 1,
-1.393791, 0.1469557, -0.5934178, 1, 0.5176471, 0, 1,
-1.390565, -1.748333, -2.963939, 1, 0.5215687, 0, 1,
-1.383137, -0.9196724, -3.796621, 1, 0.5294118, 0, 1,
-1.377143, -0.8279235, -2.882152, 1, 0.5333334, 0, 1,
-1.367397, 1.299621, -0.04844214, 1, 0.5411765, 0, 1,
-1.357283, -0.1911114, -2.161765, 1, 0.5450981, 0, 1,
-1.351013, 2.33267, -0.7020848, 1, 0.5529412, 0, 1,
-1.349707, 1.010209, -2.270247, 1, 0.5568628, 0, 1,
-1.331575, 0.2684844, -0.8371834, 1, 0.5647059, 0, 1,
-1.327863, -0.2529511, -1.014617, 1, 0.5686275, 0, 1,
-1.327332, -1.884217, -2.896226, 1, 0.5764706, 0, 1,
-1.327207, 0.2503375, -1.773815, 1, 0.5803922, 0, 1,
-1.325577, 0.7776772, -1.306345, 1, 0.5882353, 0, 1,
-1.309471, 0.3166976, -1.602425, 1, 0.5921569, 0, 1,
-1.305319, 0.8485885, -0.9628047, 1, 0.6, 0, 1,
-1.300585, -0.6488964, -2.0551, 1, 0.6078432, 0, 1,
-1.295016, -1.552149, -2.592111, 1, 0.6117647, 0, 1,
-1.293814, 0.1203869, -1.594103, 1, 0.6196079, 0, 1,
-1.291863, 0.4734575, -0.8944958, 1, 0.6235294, 0, 1,
-1.289395, -0.3022938, -0.3207547, 1, 0.6313726, 0, 1,
-1.284247, -0.9736222, -1.192033, 1, 0.6352941, 0, 1,
-1.255486, -1.227085, -1.850243, 1, 0.6431373, 0, 1,
-1.252988, -1.228038, -2.651391, 1, 0.6470588, 0, 1,
-1.251229, 1.007846, -0.1572819, 1, 0.654902, 0, 1,
-1.248557, 0.3420299, 0.4370708, 1, 0.6588235, 0, 1,
-1.246007, -0.7669696, -2.240211, 1, 0.6666667, 0, 1,
-1.237893, -0.03348714, -2.030973, 1, 0.6705883, 0, 1,
-1.23558, -0.003330399, -0.134543, 1, 0.6784314, 0, 1,
-1.234637, -0.4137651, -1.75162, 1, 0.682353, 0, 1,
-1.234477, 0.221436, -0.8745496, 1, 0.6901961, 0, 1,
-1.230722, 0.3401867, -1.524296, 1, 0.6941177, 0, 1,
-1.225459, 0.2576956, -1.781815, 1, 0.7019608, 0, 1,
-1.223652, -1.101204, -3.179133, 1, 0.7098039, 0, 1,
-1.200732, 0.2768919, -0.557968, 1, 0.7137255, 0, 1,
-1.198898, 0.237983, -0.42382, 1, 0.7215686, 0, 1,
-1.197343, 1.99562, -0.3833623, 1, 0.7254902, 0, 1,
-1.189005, 1.618941, -0.6427916, 1, 0.7333333, 0, 1,
-1.186494, -0.4572548, -1.849872, 1, 0.7372549, 0, 1,
-1.170891, -0.3161924, -2.632609, 1, 0.7450981, 0, 1,
-1.169854, -2.539073, -2.523384, 1, 0.7490196, 0, 1,
-1.169778, 0.1198462, -1.190149, 1, 0.7568628, 0, 1,
-1.167162, 0.1197477, -1.722073, 1, 0.7607843, 0, 1,
-1.154547, -0.9953399, -1.851259, 1, 0.7686275, 0, 1,
-1.141472, 0.2790516, -1.035057, 1, 0.772549, 0, 1,
-1.141395, -0.6873552, -2.527684, 1, 0.7803922, 0, 1,
-1.13962, 0.9890948, 1.766493, 1, 0.7843137, 0, 1,
-1.136919, -2.668985, -4.324825, 1, 0.7921569, 0, 1,
-1.130539, 0.9223398, -2.285735, 1, 0.7960784, 0, 1,
-1.122619, 0.5018005, -0.8976759, 1, 0.8039216, 0, 1,
-1.12089, -1.384179, -2.648601, 1, 0.8117647, 0, 1,
-1.117172, 0.4049534, -2.30138, 1, 0.8156863, 0, 1,
-1.104425, -0.3079815, -3.174341, 1, 0.8235294, 0, 1,
-1.096964, -0.3280428, -2.404217, 1, 0.827451, 0, 1,
-1.092955, 0.8767747, -1.038366, 1, 0.8352941, 0, 1,
-1.089667, 1.014379, -2.56896, 1, 0.8392157, 0, 1,
-1.087157, -2.315694, -3.21322, 1, 0.8470588, 0, 1,
-1.085647, 0.520756, -0.3814746, 1, 0.8509804, 0, 1,
-1.083302, 0.2306451, -0.4303323, 1, 0.8588235, 0, 1,
-1.082299, 0.395832, -2.807669, 1, 0.8627451, 0, 1,
-1.075658, 0.5219749, -2.311987, 1, 0.8705882, 0, 1,
-1.074137, 0.5446584, -1.388093, 1, 0.8745098, 0, 1,
-1.070877, 0.5781456, -1.371139, 1, 0.8823529, 0, 1,
-1.065106, 1.393228, 0.2738969, 1, 0.8862745, 0, 1,
-1.059919, -0.4433237, -1.3315, 1, 0.8941177, 0, 1,
-1.054789, -0.03589588, -1.830253, 1, 0.8980392, 0, 1,
-1.049163, 0.4144765, -0.8327447, 1, 0.9058824, 0, 1,
-1.045745, -0.3664056, -1.431513, 1, 0.9137255, 0, 1,
-1.039367, -1.134268, -1.329448, 1, 0.9176471, 0, 1,
-1.039162, -0.4834332, -1.825904, 1, 0.9254902, 0, 1,
-1.036409, -1.511376, -3.061835, 1, 0.9294118, 0, 1,
-1.029037, 1.992989, 0.4221692, 1, 0.9372549, 0, 1,
-1.023405, -0.3270869, -1.412455, 1, 0.9411765, 0, 1,
-1.01883, -1.096108, -3.663451, 1, 0.9490196, 0, 1,
-1.017503, -0.9899132, -1.453474, 1, 0.9529412, 0, 1,
-1.017393, -0.295006, -1.533139, 1, 0.9607843, 0, 1,
-1.015024, 1.989945, 0.01667769, 1, 0.9647059, 0, 1,
-1.01462, -0.6239269, -0.7566336, 1, 0.972549, 0, 1,
-1.013541, 0.8118084, -1.315485, 1, 0.9764706, 0, 1,
-1.006129, -1.697924, -0.9730642, 1, 0.9843137, 0, 1,
-1.005627, 0.4671689, -0.6230701, 1, 0.9882353, 0, 1,
-1.001383, 0.4845523, -1.461327, 1, 0.9960784, 0, 1,
-1.001106, -0.02129948, -0.9350864, 0.9960784, 1, 0, 1,
-0.9993475, 0.3413277, -1.0797, 0.9921569, 1, 0, 1,
-0.9988075, 1.440829, -0.9175634, 0.9843137, 1, 0, 1,
-0.9984644, -1.327086, -2.546655, 0.9803922, 1, 0, 1,
-0.992919, -1.204177, -2.664989, 0.972549, 1, 0, 1,
-0.9786332, 0.5547927, 0.4610208, 0.9686275, 1, 0, 1,
-0.9694387, -0.3205511, -2.200896, 0.9607843, 1, 0, 1,
-0.9671965, 2.010576, 0.1544913, 0.9568627, 1, 0, 1,
-0.9560044, 0.3536235, -0.5474132, 0.9490196, 1, 0, 1,
-0.9557863, 1.244969, -2.262258, 0.945098, 1, 0, 1,
-0.9526423, 1.020936, -1.315309, 0.9372549, 1, 0, 1,
-0.9506308, -0.04758863, -0.7339765, 0.9333333, 1, 0, 1,
-0.9505589, 0.7966061, -0.5851972, 0.9254902, 1, 0, 1,
-0.9427845, 0.542284, -1.154107, 0.9215686, 1, 0, 1,
-0.9426507, 0.08466793, -2.423029, 0.9137255, 1, 0, 1,
-0.9420541, -0.6629608, -1.647149, 0.9098039, 1, 0, 1,
-0.9417015, -0.6006255, -1.73601, 0.9019608, 1, 0, 1,
-0.9399861, 1.365947, -1.045634, 0.8941177, 1, 0, 1,
-0.9376307, 0.03003314, -2.890247, 0.8901961, 1, 0, 1,
-0.9369837, -0.08808466, -1.574211, 0.8823529, 1, 0, 1,
-0.9315483, -0.5814319, -2.099469, 0.8784314, 1, 0, 1,
-0.9311586, 1.391961, 0.4284788, 0.8705882, 1, 0, 1,
-0.9297307, 1.253797, 0.231332, 0.8666667, 1, 0, 1,
-0.9251389, 0.8378336, -0.9607096, 0.8588235, 1, 0, 1,
-0.9205435, -0.1107205, -1.394207, 0.854902, 1, 0, 1,
-0.9149597, 0.01360731, -1.289842, 0.8470588, 1, 0, 1,
-0.9137825, 0.04106663, -1.477359, 0.8431373, 1, 0, 1,
-0.9106961, 0.4152941, -0.1614666, 0.8352941, 1, 0, 1,
-0.9096599, 0.9021192, -0.3265038, 0.8313726, 1, 0, 1,
-0.9077919, -1.652632, -3.729212, 0.8235294, 1, 0, 1,
-0.9038279, 1.248409, -1.42777, 0.8196079, 1, 0, 1,
-0.8993207, -0.2429017, -1.364746, 0.8117647, 1, 0, 1,
-0.8929276, -0.04173662, -0.0260364, 0.8078431, 1, 0, 1,
-0.8898588, 0.2717204, -1.117501, 0.8, 1, 0, 1,
-0.8836078, -1.232402, -4.146404, 0.7921569, 1, 0, 1,
-0.8801902, 0.1646529, -1.688197, 0.7882353, 1, 0, 1,
-0.8743063, 0.8219221, -0.9725973, 0.7803922, 1, 0, 1,
-0.8710132, 0.3378885, -2.679811, 0.7764706, 1, 0, 1,
-0.8689494, -0.07677367, -2.279319, 0.7686275, 1, 0, 1,
-0.8682565, -1.283897, -3.732256, 0.7647059, 1, 0, 1,
-0.8641875, 0.7265972, -2.275389, 0.7568628, 1, 0, 1,
-0.8590373, -0.6293288, -2.278293, 0.7529412, 1, 0, 1,
-0.8486242, -0.3705259, -0.9526439, 0.7450981, 1, 0, 1,
-0.8401367, 1.188666, 0.2310083, 0.7411765, 1, 0, 1,
-0.8367027, -0.1633337, -1.96635, 0.7333333, 1, 0, 1,
-0.8361449, 1.597295, -0.7554731, 0.7294118, 1, 0, 1,
-0.8284575, 2.262629, 0.3139757, 0.7215686, 1, 0, 1,
-0.8209773, -0.551127, -1.684062, 0.7176471, 1, 0, 1,
-0.8132381, 0.1705798, -1.859332, 0.7098039, 1, 0, 1,
-0.8113415, -0.4511732, -0.8333582, 0.7058824, 1, 0, 1,
-0.8082364, 0.6842902, -1.274158, 0.6980392, 1, 0, 1,
-0.8082253, -0.7468135, -1.674882, 0.6901961, 1, 0, 1,
-0.8048252, -0.3284883, -3.051953, 0.6862745, 1, 0, 1,
-0.8024116, -1.801369, -3.67885, 0.6784314, 1, 0, 1,
-0.8021575, 1.092715, 0.2193873, 0.6745098, 1, 0, 1,
-0.7927781, 1.766812, -0.3094073, 0.6666667, 1, 0, 1,
-0.7900693, 1.21769, -0.5770816, 0.6627451, 1, 0, 1,
-0.7882181, -0.9805009, -2.457896, 0.654902, 1, 0, 1,
-0.7858532, -0.7295631, -1.683846, 0.6509804, 1, 0, 1,
-0.7856175, 1.49877, -2.679005, 0.6431373, 1, 0, 1,
-0.7835891, 0.9812773, -0.4996478, 0.6392157, 1, 0, 1,
-0.7801417, -2.141872, -2.779015, 0.6313726, 1, 0, 1,
-0.7771342, 0.6405138, -0.04749838, 0.627451, 1, 0, 1,
-0.7743883, 1.521802, 0.2824949, 0.6196079, 1, 0, 1,
-0.7730383, 1.115866, -0.0003247455, 0.6156863, 1, 0, 1,
-0.7690567, -0.5880545, -4.347865, 0.6078432, 1, 0, 1,
-0.7629934, 0.4195721, -0.1444028, 0.6039216, 1, 0, 1,
-0.7577171, 1.067451, -0.808657, 0.5960785, 1, 0, 1,
-0.7555835, -0.01594056, -2.142522, 0.5882353, 1, 0, 1,
-0.7549075, 2.126179, 1.483296, 0.5843138, 1, 0, 1,
-0.7543991, 0.9658998, 0.6940461, 0.5764706, 1, 0, 1,
-0.7536865, -0.3925493, -2.947031, 0.572549, 1, 0, 1,
-0.7401137, -1.370463, -0.5795715, 0.5647059, 1, 0, 1,
-0.7399572, -1.740841, -2.813699, 0.5607843, 1, 0, 1,
-0.7396349, 1.811369, -0.8652849, 0.5529412, 1, 0, 1,
-0.7359129, -0.9483857, -2.852683, 0.5490196, 1, 0, 1,
-0.7350554, 0.5674595, -0.2174195, 0.5411765, 1, 0, 1,
-0.7346009, 1.557437, 0.3517522, 0.5372549, 1, 0, 1,
-0.7316588, -1.997353, -2.613526, 0.5294118, 1, 0, 1,
-0.7307477, -0.5042139, -5.529883, 0.5254902, 1, 0, 1,
-0.7257883, -0.3572993, -1.958679, 0.5176471, 1, 0, 1,
-0.7223797, 1.077875, -0.574841, 0.5137255, 1, 0, 1,
-0.7164035, 1.13322, -0.1855625, 0.5058824, 1, 0, 1,
-0.715742, -0.1663542, -2.04525, 0.5019608, 1, 0, 1,
-0.7116942, -0.9565488, -1.900404, 0.4941176, 1, 0, 1,
-0.7085922, 0.3461646, -0.6274204, 0.4862745, 1, 0, 1,
-0.7071644, -0.7799689, -1.941427, 0.4823529, 1, 0, 1,
-0.7036749, -0.5358238, -1.073895, 0.4745098, 1, 0, 1,
-0.6987606, 1.527537, -0.8266066, 0.4705882, 1, 0, 1,
-0.6979154, 0.3523987, -2.757288, 0.4627451, 1, 0, 1,
-0.694829, -0.8193284, -2.695143, 0.4588235, 1, 0, 1,
-0.6903538, 0.2626117, -1.843006, 0.4509804, 1, 0, 1,
-0.6889241, 0.2593816, -1.626582, 0.4470588, 1, 0, 1,
-0.6832612, 0.8998756, -0.8349781, 0.4392157, 1, 0, 1,
-0.6782885, -1.863775, -2.035024, 0.4352941, 1, 0, 1,
-0.6714582, 0.9239237, -0.1836183, 0.427451, 1, 0, 1,
-0.6527185, -0.5733446, -2.01224, 0.4235294, 1, 0, 1,
-0.6518577, 0.8061759, 0.05199995, 0.4156863, 1, 0, 1,
-0.6488692, -0.525577, -2.165086, 0.4117647, 1, 0, 1,
-0.64854, 1.162613, 0.5181854, 0.4039216, 1, 0, 1,
-0.648488, -1.906314, -3.214722, 0.3960784, 1, 0, 1,
-0.6471334, -0.5019857, -1.429876, 0.3921569, 1, 0, 1,
-0.6449475, -0.5854686, -2.566442, 0.3843137, 1, 0, 1,
-0.6441772, -1.646184, -2.535656, 0.3803922, 1, 0, 1,
-0.642181, -2.760535, -3.90516, 0.372549, 1, 0, 1,
-0.6421569, -0.05603466, -2.064752, 0.3686275, 1, 0, 1,
-0.6375307, 0.3332416, -0.7178313, 0.3607843, 1, 0, 1,
-0.633003, 1.523514, -0.506251, 0.3568628, 1, 0, 1,
-0.6328747, -0.5718445, -0.8948167, 0.3490196, 1, 0, 1,
-0.6273766, 1.150638, -0.7016508, 0.345098, 1, 0, 1,
-0.627005, -1.542447, -2.22758, 0.3372549, 1, 0, 1,
-0.6268111, 0.6962086, -1.778423, 0.3333333, 1, 0, 1,
-0.621465, 0.1736503, -3.083156, 0.3254902, 1, 0, 1,
-0.6208298, -1.464122, -4.002225, 0.3215686, 1, 0, 1,
-0.6183807, -0.5447989, -3.233511, 0.3137255, 1, 0, 1,
-0.6160735, -2.109178, -1.637413, 0.3098039, 1, 0, 1,
-0.6139955, -0.8288167, -3.593928, 0.3019608, 1, 0, 1,
-0.6108005, 0.2551737, -0.5722232, 0.2941177, 1, 0, 1,
-0.6088539, -0.08100022, -1.252027, 0.2901961, 1, 0, 1,
-0.6055606, 0.6432196, 0.577085, 0.282353, 1, 0, 1,
-0.601468, 0.4297396, -0.9124939, 0.2784314, 1, 0, 1,
-0.5999506, 0.01662753, -1.908174, 0.2705882, 1, 0, 1,
-0.5999271, -0.2992132, -0.8236573, 0.2666667, 1, 0, 1,
-0.5982504, -0.9688135, -0.04304862, 0.2588235, 1, 0, 1,
-0.5953026, -1.831236, -2.807787, 0.254902, 1, 0, 1,
-0.5896851, -1.231772, -3.653247, 0.2470588, 1, 0, 1,
-0.5884933, 0.2836618, -0.04986171, 0.2431373, 1, 0, 1,
-0.58271, -0.7159005, -3.920992, 0.2352941, 1, 0, 1,
-0.5810912, 0.4069098, -2.134648, 0.2313726, 1, 0, 1,
-0.5734153, 0.2821876, -0.6267389, 0.2235294, 1, 0, 1,
-0.5726103, 0.5707042, 0.3596162, 0.2196078, 1, 0, 1,
-0.5701141, 0.854983, -1.079906, 0.2117647, 1, 0, 1,
-0.5639102, -0.4547437, -2.179764, 0.2078431, 1, 0, 1,
-0.5618955, -0.7679528, -1.369156, 0.2, 1, 0, 1,
-0.5607328, 0.698639, -0.4503173, 0.1921569, 1, 0, 1,
-0.5604748, 0.2732434, -1.232022, 0.1882353, 1, 0, 1,
-0.5590961, -0.2472853, -1.183771, 0.1803922, 1, 0, 1,
-0.5576753, -0.7185588, -1.084581, 0.1764706, 1, 0, 1,
-0.5527511, 0.7733294, -1.182383, 0.1686275, 1, 0, 1,
-0.5455762, -0.9093909, -2.740686, 0.1647059, 1, 0, 1,
-0.544889, 1.07917, -1.006808, 0.1568628, 1, 0, 1,
-0.5444834, -1.021369, -3.835225, 0.1529412, 1, 0, 1,
-0.5332703, 1.203077, -1.486163, 0.145098, 1, 0, 1,
-0.5330053, -1.597887, -1.230121, 0.1411765, 1, 0, 1,
-0.5220774, -1.14925, -4.668442, 0.1333333, 1, 0, 1,
-0.515624, 1.741934, 0.8282332, 0.1294118, 1, 0, 1,
-0.5153248, 0.9248728, -2.50812, 0.1215686, 1, 0, 1,
-0.5133396, -1.187649, -3.128166, 0.1176471, 1, 0, 1,
-0.5133117, 0.2648198, -2.392454, 0.1098039, 1, 0, 1,
-0.5119093, 0.5080276, 0.1141409, 0.1058824, 1, 0, 1,
-0.5114595, 0.2601084, -1.764317, 0.09803922, 1, 0, 1,
-0.5109155, 0.9944134, -0.5983452, 0.09019608, 1, 0, 1,
-0.510488, -0.03027471, -1.47705, 0.08627451, 1, 0, 1,
-0.5082625, 1.888859, 0.5988127, 0.07843138, 1, 0, 1,
-0.507064, 1.831561, -2.158112, 0.07450981, 1, 0, 1,
-0.5036883, -1.502057, -1.855824, 0.06666667, 1, 0, 1,
-0.5026184, 1.254653, -1.769875, 0.0627451, 1, 0, 1,
-0.5020592, -0.4273293, -1.530338, 0.05490196, 1, 0, 1,
-0.5017107, 2.175301, 0.7561421, 0.05098039, 1, 0, 1,
-0.5010085, 2.357924, -1.109836, 0.04313726, 1, 0, 1,
-0.4993193, 0.3683667, 0.06417852, 0.03921569, 1, 0, 1,
-0.4853775, -2.183902, -3.252245, 0.03137255, 1, 0, 1,
-0.4836365, -0.7442563, -1.399141, 0.02745098, 1, 0, 1,
-0.4831481, 0.97352, -0.09555702, 0.01960784, 1, 0, 1,
-0.473471, 0.007951939, -1.455717, 0.01568628, 1, 0, 1,
-0.4699678, 0.8742886, 0.09668651, 0.007843138, 1, 0, 1,
-0.4674382, 0.6462673, -2.047059, 0.003921569, 1, 0, 1,
-0.4624406, -0.1432406, 0.5375416, 0, 1, 0.003921569, 1,
-0.4525006, -1.043725, -2.956268, 0, 1, 0.01176471, 1,
-0.4501703, -0.06104987, -2.767456, 0, 1, 0.01568628, 1,
-0.4490466, 2.184072, -2.237018, 0, 1, 0.02352941, 1,
-0.4480571, -0.2950671, -3.237619, 0, 1, 0.02745098, 1,
-0.4476714, 2.536557, 0.3109302, 0, 1, 0.03529412, 1,
-0.4457343, -0.9003727, -3.369219, 0, 1, 0.03921569, 1,
-0.4435786, 0.1317859, 0.1715674, 0, 1, 0.04705882, 1,
-0.4397629, 0.4158033, -2.115935, 0, 1, 0.05098039, 1,
-0.4367259, 0.2344704, 0.2243266, 0, 1, 0.05882353, 1,
-0.433779, 0.5356608, 0.04645231, 0, 1, 0.0627451, 1,
-0.431664, -0.05975609, -3.110431, 0, 1, 0.07058824, 1,
-0.4272128, -2.026945, -1.348219, 0, 1, 0.07450981, 1,
-0.4265099, 1.178518, -1.160457, 0, 1, 0.08235294, 1,
-0.4250272, 1.130554, -1.011234, 0, 1, 0.08627451, 1,
-0.4216108, 0.4599196, 0.9747816, 0, 1, 0.09411765, 1,
-0.4211851, -1.285733, -2.26031, 0, 1, 0.1019608, 1,
-0.4210989, -0.2974405, -2.536649, 0, 1, 0.1058824, 1,
-0.4205214, 0.5890513, 0.8231696, 0, 1, 0.1137255, 1,
-0.4164404, -0.8999039, -3.723156, 0, 1, 0.1176471, 1,
-0.4116625, -0.08184771, -3.58294, 0, 1, 0.1254902, 1,
-0.407576, -2.109836, -2.002813, 0, 1, 0.1294118, 1,
-0.4007474, 2.288245, 0.07444088, 0, 1, 0.1372549, 1,
-0.4004118, -2.435275, -2.835597, 0, 1, 0.1411765, 1,
-0.398354, -1.255465, -4.050947, 0, 1, 0.1490196, 1,
-0.390653, 1.795565, -0.9759503, 0, 1, 0.1529412, 1,
-0.3894817, 0.07177224, -0.3492127, 0, 1, 0.1607843, 1,
-0.3859971, 0.9393039, -0.2838734, 0, 1, 0.1647059, 1,
-0.3780628, 1.105883, -0.4673621, 0, 1, 0.172549, 1,
-0.3779068, -0.03540898, -1.533841, 0, 1, 0.1764706, 1,
-0.3710427, -0.3614957, -1.022893, 0, 1, 0.1843137, 1,
-0.3694977, 0.09844851, -2.460268, 0, 1, 0.1882353, 1,
-0.3647066, 0.8005117, 0.9487205, 0, 1, 0.1960784, 1,
-0.3601971, 0.4463318, -1.388269, 0, 1, 0.2039216, 1,
-0.35955, 1.236199, -0.8619286, 0, 1, 0.2078431, 1,
-0.3585328, -0.4804266, -0.4296412, 0, 1, 0.2156863, 1,
-0.3580594, 0.8487945, 0.0657948, 0, 1, 0.2196078, 1,
-0.3496835, -0.2574062, -0.7875215, 0, 1, 0.227451, 1,
-0.3492244, -0.6756589, -2.300598, 0, 1, 0.2313726, 1,
-0.3381652, 0.4347004, -1.32421, 0, 1, 0.2392157, 1,
-0.336823, -0.8636668, -3.315327, 0, 1, 0.2431373, 1,
-0.3359585, 1.090141, 0.6737996, 0, 1, 0.2509804, 1,
-0.335377, 1.180182, 1.50604, 0, 1, 0.254902, 1,
-0.3300695, -0.6825889, -2.082689, 0, 1, 0.2627451, 1,
-0.3247971, 0.6681802, -0.7751225, 0, 1, 0.2666667, 1,
-0.3216466, 2.721965, 0.5121649, 0, 1, 0.2745098, 1,
-0.3209885, -0.9001806, -2.467751, 0, 1, 0.2784314, 1,
-0.3205264, 2.062875, 0.7658923, 0, 1, 0.2862745, 1,
-0.3158834, 0.8473212, -0.4140634, 0, 1, 0.2901961, 1,
-0.3143404, -1.313918, -3.312911, 0, 1, 0.2980392, 1,
-0.311268, -0.1757544, -3.201779, 0, 1, 0.3058824, 1,
-0.3082324, 0.7454225, 1.366192, 0, 1, 0.3098039, 1,
-0.3073889, 1.102601, 0.3164066, 0, 1, 0.3176471, 1,
-0.3061153, 0.2652163, -0.2148355, 0, 1, 0.3215686, 1,
-0.3026938, 0.9371296, -1.511843, 0, 1, 0.3294118, 1,
-0.3022352, 1.623181, -1.963413, 0, 1, 0.3333333, 1,
-0.2973714, 0.5560196, -2.504355, 0, 1, 0.3411765, 1,
-0.292279, 1.895659, 0.0353233, 0, 1, 0.345098, 1,
-0.2901671, 0.4839091, 0.2961882, 0, 1, 0.3529412, 1,
-0.2842751, -1.32389, -3.978681, 0, 1, 0.3568628, 1,
-0.2768534, -1.247841, -1.741663, 0, 1, 0.3647059, 1,
-0.2762512, 1.733636, -1.517071, 0, 1, 0.3686275, 1,
-0.2734993, 1.176886, -0.2040569, 0, 1, 0.3764706, 1,
-0.2643553, -0.03027617, -1.126636, 0, 1, 0.3803922, 1,
-0.2635949, 3.227193, 0.2670748, 0, 1, 0.3882353, 1,
-0.2633838, -0.3827109, -2.774742, 0, 1, 0.3921569, 1,
-0.2587641, -0.166612, -1.481408, 0, 1, 0.4, 1,
-0.2523085, -0.3254926, -0.4452671, 0, 1, 0.4078431, 1,
-0.251117, -0.5234199, -3.264633, 0, 1, 0.4117647, 1,
-0.2499855, -2.581003, -3.665474, 0, 1, 0.4196078, 1,
-0.2433464, 0.4048318, -1.516425, 0, 1, 0.4235294, 1,
-0.2376975, 0.6139377, 0.2175368, 0, 1, 0.4313726, 1,
-0.2352006, 1.000846, 0.5734508, 0, 1, 0.4352941, 1,
-0.2349775, 0.849924, -0.8182641, 0, 1, 0.4431373, 1,
-0.2259601, -1.208203, -3.697109, 0, 1, 0.4470588, 1,
-0.2225854, -0.5338026, -3.132016, 0, 1, 0.454902, 1,
-0.2215269, -2.165929, -2.418356, 0, 1, 0.4588235, 1,
-0.2201749, -0.02603241, -2.457238, 0, 1, 0.4666667, 1,
-0.2189634, 1.100553, -0.3924109, 0, 1, 0.4705882, 1,
-0.2130693, 0.2648622, 0.08586725, 0, 1, 0.4784314, 1,
-0.2078011, 0.6237309, -0.01807426, 0, 1, 0.4823529, 1,
-0.2061408, 0.3424917, -1.317347, 0, 1, 0.4901961, 1,
-0.2037244, 0.9049379, 0.1291521, 0, 1, 0.4941176, 1,
-0.2033923, -1.179484, -1.288433, 0, 1, 0.5019608, 1,
-0.201748, 0.157142, -0.9306787, 0, 1, 0.509804, 1,
-0.1996044, -0.6907425, -4.772869, 0, 1, 0.5137255, 1,
-0.1932476, -1.194234, -2.612372, 0, 1, 0.5215687, 1,
-0.189134, -0.5375628, -2.138967, 0, 1, 0.5254902, 1,
-0.1878064, -0.4092548, -2.737457, 0, 1, 0.5333334, 1,
-0.1868763, 0.5154067, -1.206253, 0, 1, 0.5372549, 1,
-0.1848169, 0.1582791, 0.2529241, 0, 1, 0.5450981, 1,
-0.1792568, 0.3194965, 0.1303863, 0, 1, 0.5490196, 1,
-0.1789034, -1.335188, -3.746681, 0, 1, 0.5568628, 1,
-0.1778238, 0.8310753, -1.183876, 0, 1, 0.5607843, 1,
-0.1731441, 0.6121547, -1.074693, 0, 1, 0.5686275, 1,
-0.1721589, -2.040478, -2.691434, 0, 1, 0.572549, 1,
-0.1708041, -0.460457, -3.996987, 0, 1, 0.5803922, 1,
-0.1693473, -1.462314, -3.952442, 0, 1, 0.5843138, 1,
-0.1652807, -0.2106146, -2.480721, 0, 1, 0.5921569, 1,
-0.1638686, -0.08381909, -1.954436, 0, 1, 0.5960785, 1,
-0.1625078, -0.5500919, -2.675204, 0, 1, 0.6039216, 1,
-0.1588003, -1.350594, -4.094874, 0, 1, 0.6117647, 1,
-0.1557718, 0.1291374, 1.448923, 0, 1, 0.6156863, 1,
-0.1540307, -1.228914, -3.670469, 0, 1, 0.6235294, 1,
-0.1531439, 1.443557, -0.899955, 0, 1, 0.627451, 1,
-0.1530026, 0.1479688, -0.5983241, 0, 1, 0.6352941, 1,
-0.1512756, 0.02587277, -1.825827, 0, 1, 0.6392157, 1,
-0.1502846, -1.374334, -5.260968, 0, 1, 0.6470588, 1,
-0.150137, 0.6040133, 0.7599173, 0, 1, 0.6509804, 1,
-0.1496437, 0.7211106, -0.2091829, 0, 1, 0.6588235, 1,
-0.1494816, -1.173275, -2.678449, 0, 1, 0.6627451, 1,
-0.1479164, 1.007127, -2.609296, 0, 1, 0.6705883, 1,
-0.146318, 0.8142565, -0.01708823, 0, 1, 0.6745098, 1,
-0.1361174, 0.2458655, -0.4543662, 0, 1, 0.682353, 1,
-0.1293802, 0.709645, -0.5812213, 0, 1, 0.6862745, 1,
-0.1259105, 0.3055401, -0.5718268, 0, 1, 0.6941177, 1,
-0.1251975, -0.03539044, -2.231579, 0, 1, 0.7019608, 1,
-0.1218548, -0.7961668, -3.254766, 0, 1, 0.7058824, 1,
-0.1207063, -0.1230885, -2.077402, 0, 1, 0.7137255, 1,
-0.1182641, -0.8282734, -3.305621, 0, 1, 0.7176471, 1,
-0.1181605, -2.275908, -4.482567, 0, 1, 0.7254902, 1,
-0.1129347, -0.4140182, -1.507346, 0, 1, 0.7294118, 1,
-0.1106949, -0.742537, -2.177357, 0, 1, 0.7372549, 1,
-0.1085432, -1.122799, -3.399306, 0, 1, 0.7411765, 1,
-0.107368, 0.4173108, -1.335688, 0, 1, 0.7490196, 1,
-0.1032507, -0.2004802, -2.677852, 0, 1, 0.7529412, 1,
-0.1023402, 0.434766, -0.7907485, 0, 1, 0.7607843, 1,
-0.1009227, -0.6493607, -4.973279, 0, 1, 0.7647059, 1,
-0.1001528, -0.6016171, -4.631835, 0, 1, 0.772549, 1,
-0.09486417, -0.1320038, -2.613262, 0, 1, 0.7764706, 1,
-0.08949551, -0.9582257, -3.09907, 0, 1, 0.7843137, 1,
-0.08922993, 0.7126252, -1.421717, 0, 1, 0.7882353, 1,
-0.08771633, 0.5163456, -0.5969616, 0, 1, 0.7960784, 1,
-0.08733469, -2.043272, -5.141305, 0, 1, 0.8039216, 1,
-0.08508158, -1.823923, -4.574368, 0, 1, 0.8078431, 1,
-0.08498679, -1.335988, -2.382602, 0, 1, 0.8156863, 1,
-0.08405448, 0.3412839, -1.661948, 0, 1, 0.8196079, 1,
-0.08259705, -1.130423, -2.451137, 0, 1, 0.827451, 1,
-0.07535004, 0.9069609, -0.6867945, 0, 1, 0.8313726, 1,
-0.07020467, 0.7436247, -0.5473476, 0, 1, 0.8392157, 1,
-0.06943595, 1.055787, 0.2473643, 0, 1, 0.8431373, 1,
-0.06865582, 0.02638881, -0.4072821, 0, 1, 0.8509804, 1,
-0.0669818, 0.775345, 0.6312358, 0, 1, 0.854902, 1,
-0.06215848, -0.2580236, -2.62724, 0, 1, 0.8627451, 1,
-0.06210822, 0.03657514, -2.765788, 0, 1, 0.8666667, 1,
-0.06182734, 0.5788891, -0.9080836, 0, 1, 0.8745098, 1,
-0.06182338, -0.5063215, -2.515862, 0, 1, 0.8784314, 1,
-0.0596722, -0.9873587, -3.993467, 0, 1, 0.8862745, 1,
-0.05940609, 1.977378, -0.5797441, 0, 1, 0.8901961, 1,
-0.05795207, -0.6234913, -2.550144, 0, 1, 0.8980392, 1,
-0.05411273, -0.4094046, -0.5536143, 0, 1, 0.9058824, 1,
-0.0484109, -0.8136304, -2.955139, 0, 1, 0.9098039, 1,
-0.04567292, -0.2187042, -1.503975, 0, 1, 0.9176471, 1,
-0.04430852, -1.209721, -4.00045, 0, 1, 0.9215686, 1,
-0.04369293, -0.8493793, -3.291904, 0, 1, 0.9294118, 1,
-0.04355501, -0.771917, -4.319376, 0, 1, 0.9333333, 1,
-0.04232571, -0.8281493, -5.574031, 0, 1, 0.9411765, 1,
-0.03951796, -0.7485009, -3.924994, 0, 1, 0.945098, 1,
-0.03600686, 0.8552451, -1.054309, 0, 1, 0.9529412, 1,
-0.03363918, -0.1490911, -2.475044, 0, 1, 0.9568627, 1,
-0.03234871, 0.252806, -0.09563373, 0, 1, 0.9647059, 1,
-0.03213726, -0.6932208, -3.602889, 0, 1, 0.9686275, 1,
-0.03125412, 0.7948065, -1.139428, 0, 1, 0.9764706, 1,
-0.03013382, 0.5459858, -0.4595789, 0, 1, 0.9803922, 1,
-0.0285096, 0.1302585, -1.799688, 0, 1, 0.9882353, 1,
-0.02758141, -0.08041764, -3.143602, 0, 1, 0.9921569, 1,
-0.02624248, 1.423939, 2.273615, 0, 1, 1, 1,
-0.02479146, -0.774767, -2.166132, 0, 0.9921569, 1, 1,
-0.0241156, -0.04703042, -1.758294, 0, 0.9882353, 1, 1,
-0.018583, 0.1375211, -0.3142993, 0, 0.9803922, 1, 1,
-0.015427, -1.022717, -1.265693, 0, 0.9764706, 1, 1,
-0.01224689, 0.1008929, -0.02680714, 0, 0.9686275, 1, 1,
-0.009145148, -0.2925326, -2.676378, 0, 0.9647059, 1, 1,
-0.008377737, -0.8169057, -4.397583, 0, 0.9568627, 1, 1,
-0.007745688, 1.828606, 0.1729273, 0, 0.9529412, 1, 1,
-0.00400515, -1.29129, -4.038002, 0, 0.945098, 1, 1,
-0.002433793, 0.7238431, 1.845053, 0, 0.9411765, 1, 1,
0.005896192, -0.9418152, 4.221531, 0, 0.9333333, 1, 1,
0.006354621, -1.006, 2.372321, 0, 0.9294118, 1, 1,
0.009033005, 1.60804, -1.111846, 0, 0.9215686, 1, 1,
0.00954137, 0.3689388, -1.298517, 0, 0.9176471, 1, 1,
0.009698209, -1.236246, 2.637377, 0, 0.9098039, 1, 1,
0.01119367, -0.3567512, 1.832449, 0, 0.9058824, 1, 1,
0.01200879, -1.524986, 5.175702, 0, 0.8980392, 1, 1,
0.01297762, -0.7207338, 1.196304, 0, 0.8901961, 1, 1,
0.01810961, 0.5351339, 1.165302, 0, 0.8862745, 1, 1,
0.02190949, 0.2926982, 1.676704, 0, 0.8784314, 1, 1,
0.02233294, -1.767084, 3.084823, 0, 0.8745098, 1, 1,
0.02611699, -0.8779278, 2.164422, 0, 0.8666667, 1, 1,
0.02781665, 0.02159002, 0.2968888, 0, 0.8627451, 1, 1,
0.0279516, 0.4994835, 0.5286755, 0, 0.854902, 1, 1,
0.03129693, -0.3747323, 1.425715, 0, 0.8509804, 1, 1,
0.03312895, 1.96631, 0.03188284, 0, 0.8431373, 1, 1,
0.03355858, 1.492294, -0.08120549, 0, 0.8392157, 1, 1,
0.03569483, 0.5586664, 1.145367, 0, 0.8313726, 1, 1,
0.03821862, 0.7884859, 0.1303388, 0, 0.827451, 1, 1,
0.04006019, -0.2121103, 3.653449, 0, 0.8196079, 1, 1,
0.04022193, 0.8434373, -1.62228, 0, 0.8156863, 1, 1,
0.04073108, 1.060326, -1.270641, 0, 0.8078431, 1, 1,
0.04416958, 1.964258, 0.1293713, 0, 0.8039216, 1, 1,
0.04779499, 1.012382, -0.01073993, 0, 0.7960784, 1, 1,
0.04971169, -0.6779397, 3.237223, 0, 0.7882353, 1, 1,
0.05538232, 0.5567977, 0.2092757, 0, 0.7843137, 1, 1,
0.05698382, -0.830609, 2.516277, 0, 0.7764706, 1, 1,
0.0640617, -0.3974767, 3.682108, 0, 0.772549, 1, 1,
0.06874841, 0.07786462, 0.9801734, 0, 0.7647059, 1, 1,
0.06969619, 1.657645, 1.247482, 0, 0.7607843, 1, 1,
0.07321529, 2.018458, -2.941621, 0, 0.7529412, 1, 1,
0.07768803, -1.512028, 3.582388, 0, 0.7490196, 1, 1,
0.07890257, 0.6425763, -0.468921, 0, 0.7411765, 1, 1,
0.08459693, 0.4269033, -0.5269582, 0, 0.7372549, 1, 1,
0.08817895, -0.3389671, 2.342571, 0, 0.7294118, 1, 1,
0.08907266, -0.2501073, 3.3635, 0, 0.7254902, 1, 1,
0.09116079, 0.2783806, 0.03572924, 0, 0.7176471, 1, 1,
0.09174495, -0.3885778, 2.490582, 0, 0.7137255, 1, 1,
0.09582398, 1.450704, -0.7343027, 0, 0.7058824, 1, 1,
0.09607673, -0.3558657, 4.380101, 0, 0.6980392, 1, 1,
0.09674785, 1.020652, 0.4031968, 0, 0.6941177, 1, 1,
0.09746212, -0.06841835, 1.414206, 0, 0.6862745, 1, 1,
0.102212, 0.6566241, 0.4865384, 0, 0.682353, 1, 1,
0.1071856, -0.3040118, 3.010391, 0, 0.6745098, 1, 1,
0.1114226, -0.9218623, 1.356242, 0, 0.6705883, 1, 1,
0.1132923, 1.341962, 0.2630142, 0, 0.6627451, 1, 1,
0.1147536, 0.8473482, 0.483852, 0, 0.6588235, 1, 1,
0.1183656, 0.3881689, -1.614642, 0, 0.6509804, 1, 1,
0.1194583, 0.7321098, 1.133584, 0, 0.6470588, 1, 1,
0.1218062, -0.9281794, 2.238752, 0, 0.6392157, 1, 1,
0.1306685, -0.2081481, 2.864929, 0, 0.6352941, 1, 1,
0.1345674, -0.3170817, 4.033095, 0, 0.627451, 1, 1,
0.1364994, 0.7890976, 1.002452, 0, 0.6235294, 1, 1,
0.1378002, 0.6136201, 0.5890972, 0, 0.6156863, 1, 1,
0.13807, -1.135072, 2.111289, 0, 0.6117647, 1, 1,
0.1457803, 0.2377882, 0.8728005, 0, 0.6039216, 1, 1,
0.146545, 0.6743822, 0.9746563, 0, 0.5960785, 1, 1,
0.1476154, -0.7598779, 3.617601, 0, 0.5921569, 1, 1,
0.1485315, 1.874513, -0.2955346, 0, 0.5843138, 1, 1,
0.1503268, 0.2244462, 1.091577, 0, 0.5803922, 1, 1,
0.1565551, 0.6573868, -1.511037, 0, 0.572549, 1, 1,
0.1579988, 0.2889225, -0.02486518, 0, 0.5686275, 1, 1,
0.1606723, -0.5038455, 3.123184, 0, 0.5607843, 1, 1,
0.1632295, -1.049783, 2.10798, 0, 0.5568628, 1, 1,
0.1638113, -0.6266432, 3.354767, 0, 0.5490196, 1, 1,
0.1648809, 0.8065086, -0.3202652, 0, 0.5450981, 1, 1,
0.1671622, 0.07189311, 2.244996, 0, 0.5372549, 1, 1,
0.1711485, -0.2393198, 0.9911456, 0, 0.5333334, 1, 1,
0.1712855, -0.213907, 3.623731, 0, 0.5254902, 1, 1,
0.1758217, 1.060536, -1.533227, 0, 0.5215687, 1, 1,
0.1778301, 0.07472511, -0.5681983, 0, 0.5137255, 1, 1,
0.1825844, -0.1391717, 0.9336588, 0, 0.509804, 1, 1,
0.1842062, 1.958799, -0.5840614, 0, 0.5019608, 1, 1,
0.188416, 2.513609, 1.080446, 0, 0.4941176, 1, 1,
0.1915596, -0.06262486, 1.629277, 0, 0.4901961, 1, 1,
0.1937586, -1.836823, 4.256844, 0, 0.4823529, 1, 1,
0.1944405, -0.6591048, 3.792511, 0, 0.4784314, 1, 1,
0.1984318, 0.9532996, -0.5227655, 0, 0.4705882, 1, 1,
0.199333, -0.5763007, 4.330345, 0, 0.4666667, 1, 1,
0.2028365, -0.7263374, 2.831387, 0, 0.4588235, 1, 1,
0.203997, -0.06530228, 1.00281, 0, 0.454902, 1, 1,
0.2043714, 0.6794501, -0.3369718, 0, 0.4470588, 1, 1,
0.2074384, -1.111809, 3.239381, 0, 0.4431373, 1, 1,
0.2103322, 0.3807666, 3.774499, 0, 0.4352941, 1, 1,
0.2130294, 0.2742774, -0.424411, 0, 0.4313726, 1, 1,
0.2130605, -0.3565595, 2.481287, 0, 0.4235294, 1, 1,
0.2153687, -1.174644, 2.849135, 0, 0.4196078, 1, 1,
0.2165886, -0.6086059, 2.180538, 0, 0.4117647, 1, 1,
0.2181153, 1.317935, -0.5048697, 0, 0.4078431, 1, 1,
0.2184447, 1.238939, 0.002540405, 0, 0.4, 1, 1,
0.2210925, 0.5675321, 1.284311, 0, 0.3921569, 1, 1,
0.2211071, 0.50948, 0.6046875, 0, 0.3882353, 1, 1,
0.2224624, -0.2962127, 3.597333, 0, 0.3803922, 1, 1,
0.2226269, -0.5714441, 3.16586, 0, 0.3764706, 1, 1,
0.2388301, 1.503047, 1.326908, 0, 0.3686275, 1, 1,
0.2391585, -0.84398, 2.029566, 0, 0.3647059, 1, 1,
0.2391821, 0.4333603, -1.931923, 0, 0.3568628, 1, 1,
0.242627, -0.1304186, 3.665679, 0, 0.3529412, 1, 1,
0.2438234, 1.192163, 0.6600433, 0, 0.345098, 1, 1,
0.2447575, 1.219317, -0.82171, 0, 0.3411765, 1, 1,
0.2460181, 0.9689421, -0.9828759, 0, 0.3333333, 1, 1,
0.2502783, -0.7758388, 4.041133, 0, 0.3294118, 1, 1,
0.2560715, 0.9979351, 1.105084, 0, 0.3215686, 1, 1,
0.2583677, -0.2472664, 3.516666, 0, 0.3176471, 1, 1,
0.2590783, 0.9242963, 1.084572, 0, 0.3098039, 1, 1,
0.2607448, 0.05348435, 3.176311, 0, 0.3058824, 1, 1,
0.2607964, 0.07096345, 0.3995304, 0, 0.2980392, 1, 1,
0.2671222, -0.2866964, 2.082482, 0, 0.2901961, 1, 1,
0.2693531, -0.9394817, 3.44244, 0, 0.2862745, 1, 1,
0.2693966, -1.531386, 1.927607, 0, 0.2784314, 1, 1,
0.2741216, 1.157687, -0.1371287, 0, 0.2745098, 1, 1,
0.2758728, 1.298123, 0.1762823, 0, 0.2666667, 1, 1,
0.276628, 1.223555, -0.4114407, 0, 0.2627451, 1, 1,
0.2791936, 1.18364, -0.8040182, 0, 0.254902, 1, 1,
0.2795026, 0.1325177, 0.5116062, 0, 0.2509804, 1, 1,
0.2861358, 0.6524522, 0.3316642, 0, 0.2431373, 1, 1,
0.2918507, 0.7441926, -0.2644181, 0, 0.2392157, 1, 1,
0.2939262, -0.003416575, 0.6768371, 0, 0.2313726, 1, 1,
0.295842, 1.23575, 0.9600796, 0, 0.227451, 1, 1,
0.2996599, 1.230454, 0.8095786, 0, 0.2196078, 1, 1,
0.3012455, 0.7731317, 0.3234155, 0, 0.2156863, 1, 1,
0.3046279, 0.550651, 0.2879945, 0, 0.2078431, 1, 1,
0.3085376, -0.338172, 2.275951, 0, 0.2039216, 1, 1,
0.3085392, 0.4261026, -0.576454, 0, 0.1960784, 1, 1,
0.3085476, 1.069076, 1.132853, 0, 0.1882353, 1, 1,
0.310663, -0.1248205, 2.46968, 0, 0.1843137, 1, 1,
0.3135186, 0.403448, -2.046595, 0, 0.1764706, 1, 1,
0.3144607, -1.505899, 2.802739, 0, 0.172549, 1, 1,
0.3157157, 2.208034, 0.5715282, 0, 0.1647059, 1, 1,
0.3227936, 0.5145956, 0.8795042, 0, 0.1607843, 1, 1,
0.3276154, -1.233279, 1.602924, 0, 0.1529412, 1, 1,
0.3282604, 0.7669409, -0.4060808, 0, 0.1490196, 1, 1,
0.3312996, 0.3051608, 1.348662, 0, 0.1411765, 1, 1,
0.3327664, -1.672691, 3.504798, 0, 0.1372549, 1, 1,
0.3328111, -0.7744986, 2.718353, 0, 0.1294118, 1, 1,
0.3335758, -0.2204883, 2.229678, 0, 0.1254902, 1, 1,
0.3368167, -0.9564727, 3.578277, 0, 0.1176471, 1, 1,
0.3398507, 1.237936, -0.09979191, 0, 0.1137255, 1, 1,
0.3448492, -0.3977838, 2.363271, 0, 0.1058824, 1, 1,
0.3466984, 0.2877196, 0.4943031, 0, 0.09803922, 1, 1,
0.3481542, -1.225876, 1.990259, 0, 0.09411765, 1, 1,
0.3539114, 0.3316275, 0.5588304, 0, 0.08627451, 1, 1,
0.3539799, -0.5091524, 1.516037, 0, 0.08235294, 1, 1,
0.3548059, -0.3453662, 3.517751, 0, 0.07450981, 1, 1,
0.3587939, -1.740108, 2.725385, 0, 0.07058824, 1, 1,
0.3614607, -0.3814711, 2.068132, 0, 0.0627451, 1, 1,
0.3729333, 0.2513793, -0.05008819, 0, 0.05882353, 1, 1,
0.3735269, -1.490318, 2.045877, 0, 0.05098039, 1, 1,
0.3789924, -0.01490197, 1.646612, 0, 0.04705882, 1, 1,
0.3823688, -1.509073, 1.827145, 0, 0.03921569, 1, 1,
0.3823702, 0.3574061, 2.128658, 0, 0.03529412, 1, 1,
0.3837048, 0.1917379, 2.283797, 0, 0.02745098, 1, 1,
0.3855963, -2.154272, 2.622266, 0, 0.02352941, 1, 1,
0.3955232, -0.6417841, 2.284347, 0, 0.01568628, 1, 1,
0.3984185, -0.6423339, 2.384326, 0, 0.01176471, 1, 1,
0.4039509, 1.020397, 1.750634, 0, 0.003921569, 1, 1,
0.4059835, -0.7551989, 1.020063, 0.003921569, 0, 1, 1,
0.4106271, 0.90485, -0.06590591, 0.007843138, 0, 1, 1,
0.4111179, -0.5598673, 2.657268, 0.01568628, 0, 1, 1,
0.4129506, 0.9902977, 0.4224743, 0.01960784, 0, 1, 1,
0.4136918, 0.1264051, 0.8822049, 0.02745098, 0, 1, 1,
0.4181257, -0.2740486, 2.821258, 0.03137255, 0, 1, 1,
0.4205336, -1.382028, 3.318077, 0.03921569, 0, 1, 1,
0.4206948, -0.6743794, 2.169981, 0.04313726, 0, 1, 1,
0.4236154, 1.757017, 0.9141694, 0.05098039, 0, 1, 1,
0.424807, 1.37096, -0.02979531, 0.05490196, 0, 1, 1,
0.4261074, 0.2049105, 1.969984, 0.0627451, 0, 1, 1,
0.4284783, -0.8184922, 2.122296, 0.06666667, 0, 1, 1,
0.42947, 0.1273952, 0.488685, 0.07450981, 0, 1, 1,
0.4302949, 0.6482005, -0.3146994, 0.07843138, 0, 1, 1,
0.4312935, -0.9882812, 2.939262, 0.08627451, 0, 1, 1,
0.4320618, -2.078796, 3.660754, 0.09019608, 0, 1, 1,
0.4346348, 0.3078951, 1.194496, 0.09803922, 0, 1, 1,
0.4481363, 1.043313, 0.5208102, 0.1058824, 0, 1, 1,
0.4493723, 1.084291, 1.061104, 0.1098039, 0, 1, 1,
0.4506631, -0.2405713, -0.1464489, 0.1176471, 0, 1, 1,
0.4525259, 0.1827261, 0.5156407, 0.1215686, 0, 1, 1,
0.4566584, 0.07371416, 0.4315479, 0.1294118, 0, 1, 1,
0.4577709, 0.08004656, 0.1978992, 0.1333333, 0, 1, 1,
0.4610961, -0.9224668, 3.132083, 0.1411765, 0, 1, 1,
0.4614858, 0.5712355, -0.4490896, 0.145098, 0, 1, 1,
0.461625, -0.4775712, 3.483418, 0.1529412, 0, 1, 1,
0.4641056, 2.21823, -0.5035436, 0.1568628, 0, 1, 1,
0.4642258, 2.04305, -0.7381703, 0.1647059, 0, 1, 1,
0.4691805, -0.2928834, 2.117139, 0.1686275, 0, 1, 1,
0.4762237, 0.4416223, -0.04414754, 0.1764706, 0, 1, 1,
0.4829113, 0.45618, 0.7908031, 0.1803922, 0, 1, 1,
0.4848285, -0.1787952, 2.856341, 0.1882353, 0, 1, 1,
0.4906291, 1.554463, 0.5095546, 0.1921569, 0, 1, 1,
0.491506, -1.074458, 3.738614, 0.2, 0, 1, 1,
0.4924631, -2.080987, 3.109061, 0.2078431, 0, 1, 1,
0.4934268, -0.5004501, 2.755086, 0.2117647, 0, 1, 1,
0.4957558, 0.5269923, 0.4847351, 0.2196078, 0, 1, 1,
0.4970231, -0.6170993, 4.037017, 0.2235294, 0, 1, 1,
0.4989828, -1.004509, 3.0005, 0.2313726, 0, 1, 1,
0.5014099, -0.8265164, 1.503473, 0.2352941, 0, 1, 1,
0.5027696, 1.459352, -2.22474, 0.2431373, 0, 1, 1,
0.5033666, 0.1932647, 2.685215, 0.2470588, 0, 1, 1,
0.5069536, -1.021983, 3.180646, 0.254902, 0, 1, 1,
0.5082555, 0.4346105, 1.263597, 0.2588235, 0, 1, 1,
0.5113032, 1.11527, -1.36798, 0.2666667, 0, 1, 1,
0.5300752, -1.34974, 4.294662, 0.2705882, 0, 1, 1,
0.5301372, -1.093646, 2.343398, 0.2784314, 0, 1, 1,
0.5313105, 2.378983, 1.731726, 0.282353, 0, 1, 1,
0.531351, -0.2426961, 1.104136, 0.2901961, 0, 1, 1,
0.5373135, 1.702946, 1.227021, 0.2941177, 0, 1, 1,
0.5400938, 0.3749418, -0.3472394, 0.3019608, 0, 1, 1,
0.5419856, -1.285147, 2.849359, 0.3098039, 0, 1, 1,
0.5440049, -0.6383952, 1.020799, 0.3137255, 0, 1, 1,
0.5522789, 0.8698652, -0.4084908, 0.3215686, 0, 1, 1,
0.5579381, 0.7433518, 1.738299, 0.3254902, 0, 1, 1,
0.5614651, 2.964409, 0.3773106, 0.3333333, 0, 1, 1,
0.5622435, -2.254344, 3.255702, 0.3372549, 0, 1, 1,
0.5632583, -0.3404395, 3.420456, 0.345098, 0, 1, 1,
0.5654925, -0.6830108, 1.792306, 0.3490196, 0, 1, 1,
0.5678979, 0.2455485, 0.6119862, 0.3568628, 0, 1, 1,
0.5680791, 0.6821727, 1.361451, 0.3607843, 0, 1, 1,
0.578512, -0.7424919, 3.600078, 0.3686275, 0, 1, 1,
0.5785493, 0.6471881, 1.010483, 0.372549, 0, 1, 1,
0.5805965, 0.3689486, 2.397661, 0.3803922, 0, 1, 1,
0.5812511, 0.3297597, 1.113843, 0.3843137, 0, 1, 1,
0.5815755, -0.2756927, 1.914494, 0.3921569, 0, 1, 1,
0.5995933, 0.1515288, -0.5938557, 0.3960784, 0, 1, 1,
0.609557, 0.7325438, 1.558717, 0.4039216, 0, 1, 1,
0.614288, -0.3463275, 3.135962, 0.4117647, 0, 1, 1,
0.6215796, -0.1150749, 2.51447, 0.4156863, 0, 1, 1,
0.6217315, -1.239474, 2.570981, 0.4235294, 0, 1, 1,
0.6247416, -0.3893058, 2.133884, 0.427451, 0, 1, 1,
0.6276624, 0.5454428, 2.015783, 0.4352941, 0, 1, 1,
0.6281188, -0.5105198, 3.222074, 0.4392157, 0, 1, 1,
0.6417359, -1.805509, 3.252723, 0.4470588, 0, 1, 1,
0.6455767, 1.521332, 0.4831471, 0.4509804, 0, 1, 1,
0.6550248, 0.4378975, 0.1830297, 0.4588235, 0, 1, 1,
0.6647945, 1.544665, -0.09209776, 0.4627451, 0, 1, 1,
0.6660801, 0.1937597, 0.7069049, 0.4705882, 0, 1, 1,
0.6679806, -1.14276, 4.081394, 0.4745098, 0, 1, 1,
0.673029, 1.185999, 1.721845, 0.4823529, 0, 1, 1,
0.6740358, 0.7982766, 1.289916, 0.4862745, 0, 1, 1,
0.6740409, 0.136915, 1.470646, 0.4941176, 0, 1, 1,
0.6758656, 0.7432003, 0.6455761, 0.5019608, 0, 1, 1,
0.6838824, -0.8131344, 2.593309, 0.5058824, 0, 1, 1,
0.6862502, -0.5734471, 1.988994, 0.5137255, 0, 1, 1,
0.6889349, 0.2346557, 2.053317, 0.5176471, 0, 1, 1,
0.691034, -0.4951869, 2.994696, 0.5254902, 0, 1, 1,
0.6916938, 0.0287973, -0.7978985, 0.5294118, 0, 1, 1,
0.6985585, -0.02281672, 0.3726108, 0.5372549, 0, 1, 1,
0.7000667, 0.3639511, 0.6961943, 0.5411765, 0, 1, 1,
0.7038978, 0.151321, 1.138916, 0.5490196, 0, 1, 1,
0.7059069, 1.397372, -0.436697, 0.5529412, 0, 1, 1,
0.7092861, -1.729467, 3.130236, 0.5607843, 0, 1, 1,
0.711147, 0.8747429, 2.418503, 0.5647059, 0, 1, 1,
0.7119715, 1.108507, 0.0180096, 0.572549, 0, 1, 1,
0.7135684, -0.9748467, 2.992981, 0.5764706, 0, 1, 1,
0.7156124, -0.132874, 2.299486, 0.5843138, 0, 1, 1,
0.717211, -1.717038, 1.805424, 0.5882353, 0, 1, 1,
0.7204654, -0.5314005, 2.595968, 0.5960785, 0, 1, 1,
0.7272709, -0.0363725, 0.4417352, 0.6039216, 0, 1, 1,
0.7276888, -0.2876641, 3.529035, 0.6078432, 0, 1, 1,
0.7364835, -0.8490514, 1.037921, 0.6156863, 0, 1, 1,
0.7397807, 0.1639074, 2.657228, 0.6196079, 0, 1, 1,
0.7500417, -0.9801111, 2.266457, 0.627451, 0, 1, 1,
0.7536231, 1.947142, 0.7130882, 0.6313726, 0, 1, 1,
0.7551818, 0.254575, 0.3020583, 0.6392157, 0, 1, 1,
0.7562408, -0.973394, 4.299312, 0.6431373, 0, 1, 1,
0.7631378, 0.521692, 0.5718514, 0.6509804, 0, 1, 1,
0.7641448, 1.101956, -1.30055, 0.654902, 0, 1, 1,
0.7666215, -0.1942424, 0.8522953, 0.6627451, 0, 1, 1,
0.7722945, -0.527437, 2.149591, 0.6666667, 0, 1, 1,
0.7811832, 0.9172048, 0.5369946, 0.6745098, 0, 1, 1,
0.7847905, -0.6975476, 2.974667, 0.6784314, 0, 1, 1,
0.7920458, 0.07441571, 1.910345, 0.6862745, 0, 1, 1,
0.7944855, 0.3321272, 0.4729728, 0.6901961, 0, 1, 1,
0.8045645, -0.01850555, 1.658184, 0.6980392, 0, 1, 1,
0.8048261, 0.3520936, 1.205387, 0.7058824, 0, 1, 1,
0.8059016, 1.175292, 1.230626, 0.7098039, 0, 1, 1,
0.8081837, 1.113283, 1.577714, 0.7176471, 0, 1, 1,
0.8142476, -0.829868, 2.230695, 0.7215686, 0, 1, 1,
0.8173656, 0.4623671, -1.388562, 0.7294118, 0, 1, 1,
0.8182735, 1.296944, 0.2943288, 0.7333333, 0, 1, 1,
0.8202518, -0.5972944, 2.327731, 0.7411765, 0, 1, 1,
0.8215653, -0.620686, 1.898699, 0.7450981, 0, 1, 1,
0.8234934, -0.6457986, 2.261112, 0.7529412, 0, 1, 1,
0.8287126, -0.516252, 1.949626, 0.7568628, 0, 1, 1,
0.8466101, 0.0827625, 0.8808732, 0.7647059, 0, 1, 1,
0.8533212, 2.192802, 1.407996, 0.7686275, 0, 1, 1,
0.8556894, 0.9825992, 1.3866, 0.7764706, 0, 1, 1,
0.8594639, -2.5389, 1.241716, 0.7803922, 0, 1, 1,
0.860797, 0.6786425, -0.7089901, 0.7882353, 0, 1, 1,
0.8785589, -0.9367241, 2.887025, 0.7921569, 0, 1, 1,
0.8789586, -1.685381, 2.115669, 0.8, 0, 1, 1,
0.8793879, -0.7441669, 3.400015, 0.8078431, 0, 1, 1,
0.8803352, 0.9367249, 0.438286, 0.8117647, 0, 1, 1,
0.8928083, 0.2768844, 0.9378958, 0.8196079, 0, 1, 1,
0.8928123, -0.1035927, 2.676724, 0.8235294, 0, 1, 1,
0.8934334, 1.513784, -0.6288708, 0.8313726, 0, 1, 1,
0.895261, 0.4301701, -0.08244643, 0.8352941, 0, 1, 1,
0.8953082, 0.2289722, 2.15956, 0.8431373, 0, 1, 1,
0.8982115, 0.9617298, 1.405539, 0.8470588, 0, 1, 1,
0.9014819, -0.3243104, 2.594469, 0.854902, 0, 1, 1,
0.9074873, -2.053163, 4.015562, 0.8588235, 0, 1, 1,
0.9141204, -0.2792667, 1.307312, 0.8666667, 0, 1, 1,
0.9144855, -1.268871, 4.282302, 0.8705882, 0, 1, 1,
0.9210383, -0.3498265, 0.7898104, 0.8784314, 0, 1, 1,
0.9250547, 0.2416087, -0.4649504, 0.8823529, 0, 1, 1,
0.9255552, 2.480952, 1.127018, 0.8901961, 0, 1, 1,
0.9288213, -0.1138823, 1.420242, 0.8941177, 0, 1, 1,
0.932911, 0.8022377, -0.3258252, 0.9019608, 0, 1, 1,
0.933854, -0.7166454, -0.3974512, 0.9098039, 0, 1, 1,
0.9421564, 0.9057298, 2.293164, 0.9137255, 0, 1, 1,
0.9426241, -1.843866, 1.023973, 0.9215686, 0, 1, 1,
0.9474013, 0.3549263, 2.679704, 0.9254902, 0, 1, 1,
0.9661599, 0.04708411, 2.261795, 0.9333333, 0, 1, 1,
0.9809102, 1.008151, 0.9673993, 0.9372549, 0, 1, 1,
0.9913768, -1.632888, 1.808316, 0.945098, 0, 1, 1,
0.9927257, -1.084682, 3.688156, 0.9490196, 0, 1, 1,
0.9990647, 0.6973656, 0.498881, 0.9568627, 0, 1, 1,
0.9997991, 0.08580883, 2.529019, 0.9607843, 0, 1, 1,
1.007061, 0.419271, 1.070696, 0.9686275, 0, 1, 1,
1.007339, -1.037449, 0.2840689, 0.972549, 0, 1, 1,
1.018737, -1.24629, 1.531172, 0.9803922, 0, 1, 1,
1.022383, -1.766627, 3.311481, 0.9843137, 0, 1, 1,
1.026893, -0.7344794, 1.899763, 0.9921569, 0, 1, 1,
1.038295, 1.700302, 0.0647954, 0.9960784, 0, 1, 1,
1.04206, 0.4030123, 1.271555, 1, 0, 0.9960784, 1,
1.04342, 0.6180602, 2.05243, 1, 0, 0.9882353, 1,
1.047796, -0.981432, 3.478176, 1, 0, 0.9843137, 1,
1.053582, -0.04013748, 1.424401, 1, 0, 0.9764706, 1,
1.060156, 1.057079, 0.679996, 1, 0, 0.972549, 1,
1.060816, 1.253602, -0.2166027, 1, 0, 0.9647059, 1,
1.062321, -0.8815802, 1.551846, 1, 0, 0.9607843, 1,
1.062498, -0.7781199, 0.3552759, 1, 0, 0.9529412, 1,
1.063218, -0.5088685, 2.148542, 1, 0, 0.9490196, 1,
1.06369, 0.5967736, 1.300407, 1, 0, 0.9411765, 1,
1.069455, -0.3193211, 2.141902, 1, 0, 0.9372549, 1,
1.071435, 0.05405192, 2.17885, 1, 0, 0.9294118, 1,
1.087135, -0.2129092, 2.14612, 1, 0, 0.9254902, 1,
1.089563, -0.09050543, 1.997834, 1, 0, 0.9176471, 1,
1.094144, -0.3176898, 0.6291273, 1, 0, 0.9137255, 1,
1.094608, -0.9717416, 3.865214, 1, 0, 0.9058824, 1,
1.096208, -0.2553542, 2.668997, 1, 0, 0.9019608, 1,
1.101509, -0.3164496, 1.568442, 1, 0, 0.8941177, 1,
1.10872, 0.09838291, 1.264649, 1, 0, 0.8862745, 1,
1.112064, 1.035577, 1.79128, 1, 0, 0.8823529, 1,
1.116993, -1.751118, 3.327314, 1, 0, 0.8745098, 1,
1.120254, -0.3503648, 2.42454, 1, 0, 0.8705882, 1,
1.124342, 0.4307107, 0.429375, 1, 0, 0.8627451, 1,
1.126721, -0.4072388, 2.456563, 1, 0, 0.8588235, 1,
1.128174, 1.726043, 1.995247, 1, 0, 0.8509804, 1,
1.128987, -0.120681, 2.67908, 1, 0, 0.8470588, 1,
1.135046, -0.05039761, 1.94103, 1, 0, 0.8392157, 1,
1.143182, -0.4137861, 0.9432673, 1, 0, 0.8352941, 1,
1.144567, 0.3544809, 1.708322, 1, 0, 0.827451, 1,
1.146484, 0.8028826, 0.534492, 1, 0, 0.8235294, 1,
1.147082, -0.5703998, 2.944297, 1, 0, 0.8156863, 1,
1.147656, -1.821384, 4.97858, 1, 0, 0.8117647, 1,
1.150941, 1.187463, 1.678775, 1, 0, 0.8039216, 1,
1.157363, 1.733509, 1.056464, 1, 0, 0.7960784, 1,
1.16337, -0.5323509, 1.311207, 1, 0, 0.7921569, 1,
1.169512, 1.676039, -0.321924, 1, 0, 0.7843137, 1,
1.171438, -0.0160496, 1.99564, 1, 0, 0.7803922, 1,
1.175135, -0.9966435, 1.523408, 1, 0, 0.772549, 1,
1.176104, 0.4969274, 1.938983, 1, 0, 0.7686275, 1,
1.177521, 1.303869, 1.430233, 1, 0, 0.7607843, 1,
1.177967, 3.462712, 0.1889337, 1, 0, 0.7568628, 1,
1.179716, -1.566343, 2.372342, 1, 0, 0.7490196, 1,
1.182837, 0.5101803, 2.890553, 1, 0, 0.7450981, 1,
1.209496, -0.2393623, -0.0467272, 1, 0, 0.7372549, 1,
1.212546, -1.784994, 2.445457, 1, 0, 0.7333333, 1,
1.216579, -1.348435, 1.970202, 1, 0, 0.7254902, 1,
1.217276, 0.1345241, 0.8770001, 1, 0, 0.7215686, 1,
1.22047, -0.7127137, 1.656958, 1, 0, 0.7137255, 1,
1.22051, -0.2584525, 0.2053817, 1, 0, 0.7098039, 1,
1.221983, -0.9819757, 3.35603, 1, 0, 0.7019608, 1,
1.223252, -1.65071, 2.8424, 1, 0, 0.6941177, 1,
1.223909, -1.786288, 3.608776, 1, 0, 0.6901961, 1,
1.227583, -0.09136789, 0.08013408, 1, 0, 0.682353, 1,
1.228791, 1.273461, 0.8375635, 1, 0, 0.6784314, 1,
1.232303, -0.7917392, 2.187276, 1, 0, 0.6705883, 1,
1.238217, 0.05172399, 1.270248, 1, 0, 0.6666667, 1,
1.240173, 0.234663, 2.859841, 1, 0, 0.6588235, 1,
1.244827, 0.721241, 0.831239, 1, 0, 0.654902, 1,
1.246688, 1.444625, 1.375466, 1, 0, 0.6470588, 1,
1.249926, -0.1893611, 1.704457, 1, 0, 0.6431373, 1,
1.257659, 0.9867423, 0.8847294, 1, 0, 0.6352941, 1,
1.265686, -1.04937, 4.699162, 1, 0, 0.6313726, 1,
1.266706, -0.8391534, 3.536326, 1, 0, 0.6235294, 1,
1.268447, 1.379106, 0.7971942, 1, 0, 0.6196079, 1,
1.278582, -0.3212069, 2.78261, 1, 0, 0.6117647, 1,
1.281048, 0.1913387, 1.587624, 1, 0, 0.6078432, 1,
1.283621, -0.3404136, 2.244612, 1, 0, 0.6, 1,
1.288151, -0.5138158, 0.7371849, 1, 0, 0.5921569, 1,
1.290053, 1.58483, 0.318609, 1, 0, 0.5882353, 1,
1.293307, -1.047382, -0.2281851, 1, 0, 0.5803922, 1,
1.310015, 0.1511107, 1.353756, 1, 0, 0.5764706, 1,
1.313744, 0.2475988, 1.921395, 1, 0, 0.5686275, 1,
1.32694, 0.7237976, 1.282677, 1, 0, 0.5647059, 1,
1.328014, -0.523614, 1.28695, 1, 0, 0.5568628, 1,
1.339562, 0.4429457, -0.3322571, 1, 0, 0.5529412, 1,
1.341807, 0.1775699, 2.270872, 1, 0, 0.5450981, 1,
1.345158, 0.4106152, 0.7401702, 1, 0, 0.5411765, 1,
1.347202, -0.5162963, 3.241238, 1, 0, 0.5333334, 1,
1.352231, -1.049309, 1.654802, 1, 0, 0.5294118, 1,
1.354843, 0.3443365, 0.306076, 1, 0, 0.5215687, 1,
1.359837, -0.532212, 2.90034, 1, 0, 0.5176471, 1,
1.3619, -0.1876072, 2.973238, 1, 0, 0.509804, 1,
1.36554, 1.725917, 1.430109, 1, 0, 0.5058824, 1,
1.36703, -2.623467, 3.105821, 1, 0, 0.4980392, 1,
1.383579, -0.07771672, 1.675015, 1, 0, 0.4901961, 1,
1.388969, 0.8952608, 0.403076, 1, 0, 0.4862745, 1,
1.390443, -0.3925875, 3.191169, 1, 0, 0.4784314, 1,
1.390503, -0.666616, 2.395942, 1, 0, 0.4745098, 1,
1.394523, 0.5846916, 1.079265, 1, 0, 0.4666667, 1,
1.394751, -0.7568196, 2.149744, 1, 0, 0.4627451, 1,
1.399929, -0.8023118, 1.431832, 1, 0, 0.454902, 1,
1.4076, -0.3776847, 1.927656, 1, 0, 0.4509804, 1,
1.407956, -0.4429466, 2.565682, 1, 0, 0.4431373, 1,
1.414878, -0.9424149, 0.1142137, 1, 0, 0.4392157, 1,
1.419432, -0.107801, -1.100378, 1, 0, 0.4313726, 1,
1.420857, -1.203465, 2.532553, 1, 0, 0.427451, 1,
1.432887, -2.793062, 1.593401, 1, 0, 0.4196078, 1,
1.433501, 0.09562682, 0.1489022, 1, 0, 0.4156863, 1,
1.447298, -0.9070513, 2.987372, 1, 0, 0.4078431, 1,
1.452032, -0.882723, 3.253453, 1, 0, 0.4039216, 1,
1.454037, 0.978632, 1.039601, 1, 0, 0.3960784, 1,
1.4545, -0.192591, 1.737487, 1, 0, 0.3882353, 1,
1.456698, 0.7171736, 0.1183553, 1, 0, 0.3843137, 1,
1.45985, 1.485316, 2.275698, 1, 0, 0.3764706, 1,
1.481068, 0.2419268, 1.763801, 1, 0, 0.372549, 1,
1.483902, 0.05838005, 0.9390707, 1, 0, 0.3647059, 1,
1.497309, -0.9482711, 2.736532, 1, 0, 0.3607843, 1,
1.498854, -0.07550804, 3.222266, 1, 0, 0.3529412, 1,
1.502869, -0.6763716, 1.754068, 1, 0, 0.3490196, 1,
1.502905, 0.2054723, 1.999605, 1, 0, 0.3411765, 1,
1.5044, 0.07981603, 0.7278216, 1, 0, 0.3372549, 1,
1.510113, 1.37153, -0.3874127, 1, 0, 0.3294118, 1,
1.536517, 1.857614, 1.018159, 1, 0, 0.3254902, 1,
1.542851, 0.4055506, 0.9387683, 1, 0, 0.3176471, 1,
1.54662, -1.144571, 1.119491, 1, 0, 0.3137255, 1,
1.557312, 1.28033, 1.959109, 1, 0, 0.3058824, 1,
1.58636, 0.7557838, 2.32414, 1, 0, 0.2980392, 1,
1.589723, 0.17931, 0.7753689, 1, 0, 0.2941177, 1,
1.59296, -0.5283162, -1.777479, 1, 0, 0.2862745, 1,
1.603883, -0.4703625, 0.7146946, 1, 0, 0.282353, 1,
1.614215, 1.054189, 1.190428, 1, 0, 0.2745098, 1,
1.628768, -0.2546678, 0.4134644, 1, 0, 0.2705882, 1,
1.669415, 1.068792, -0.5092722, 1, 0, 0.2627451, 1,
1.669562, -0.2059126, 2.054212, 1, 0, 0.2588235, 1,
1.723136, 0.3946558, 2.241169, 1, 0, 0.2509804, 1,
1.73469, -1.334376, 1.274458, 1, 0, 0.2470588, 1,
1.744208, 1.502635, 1.81704, 1, 0, 0.2392157, 1,
1.746083, 0.8039805, 1.576768, 1, 0, 0.2352941, 1,
1.778179, -1.247129, 3.886097, 1, 0, 0.227451, 1,
1.780667, 0.8678167, 1.46541, 1, 0, 0.2235294, 1,
1.788518, -0.2934652, 1.581465, 1, 0, 0.2156863, 1,
1.822988, -0.2599735, 0.668369, 1, 0, 0.2117647, 1,
1.828295, -1.001176, 1.218253, 1, 0, 0.2039216, 1,
1.835014, 0.2581665, 2.331816, 1, 0, 0.1960784, 1,
1.875073, 0.2906555, 1.341974, 1, 0, 0.1921569, 1,
1.889385, -0.0124391, 3.0485, 1, 0, 0.1843137, 1,
1.895889, -0.08702644, 0.7970032, 1, 0, 0.1803922, 1,
1.906666, -2.923628, 1.94257, 1, 0, 0.172549, 1,
1.91415, 1.0802, 2.125516, 1, 0, 0.1686275, 1,
1.917082, -0.1983783, 2.520855, 1, 0, 0.1607843, 1,
1.94355, 0.29114, 0.8959593, 1, 0, 0.1568628, 1,
1.949332, -1.42708, 0.6067886, 1, 0, 0.1490196, 1,
1.950121, -1.900818, 1.249666, 1, 0, 0.145098, 1,
1.970903, 1.287162, -1.279835, 1, 0, 0.1372549, 1,
1.974979, -0.5490449, 2.192092, 1, 0, 0.1333333, 1,
2.00398, -0.8677555, 2.480179, 1, 0, 0.1254902, 1,
2.040579, 0.7323684, -0.5476809, 1, 0, 0.1215686, 1,
2.046962, -0.225682, 2.551832, 1, 0, 0.1137255, 1,
2.101068, 0.4944784, 2.653333, 1, 0, 0.1098039, 1,
2.130688, -2.171031, 1.928647, 1, 0, 0.1019608, 1,
2.194906, -0.05017202, 0.9644651, 1, 0, 0.09411765, 1,
2.203722, -0.6754102, 1.195172, 1, 0, 0.09019608, 1,
2.205844, -0.9459662, 1.260456, 1, 0, 0.08235294, 1,
2.221302, -1.172962, 2.399987, 1, 0, 0.07843138, 1,
2.246911, -0.703435, 1.5054, 1, 0, 0.07058824, 1,
2.373711, 0.4705374, 1.68202, 1, 0, 0.06666667, 1,
2.397351, -1.354046, 2.353914, 1, 0, 0.05882353, 1,
2.428652, 0.7473629, 2.133703, 1, 0, 0.05490196, 1,
2.46949, 0.8036105, -0.5082114, 1, 0, 0.04705882, 1,
2.48986, 1.887517, 1.566467, 1, 0, 0.04313726, 1,
2.493003, -1.983568, 1.274669, 1, 0, 0.03529412, 1,
2.506568, -0.9425371, 1.769191, 1, 0, 0.03137255, 1,
2.612945, 1.560863, 0.586753, 1, 0, 0.02352941, 1,
2.88207, 0.3375423, 1.481354, 1, 0, 0.01960784, 1,
3.114962, 0.494972, 0.5843825, 1, 0, 0.01176471, 1,
3.253796, 0.9626483, 0.7808497, 1, 0, 0.007843138, 1
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
0.1188273, -4.006113, -7.396111, 0, -0.5, 0.5, 0.5,
0.1188273, -4.006113, -7.396111, 1, -0.5, 0.5, 0.5,
0.1188273, -4.006113, -7.396111, 1, 1.5, 0.5, 0.5,
0.1188273, -4.006113, -7.396111, 0, 1.5, 0.5, 0.5
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
-4.078896, 0.2695419, -7.396111, 0, -0.5, 0.5, 0.5,
-4.078896, 0.2695419, -7.396111, 1, -0.5, 0.5, 0.5,
-4.078896, 0.2695419, -7.396111, 1, 1.5, 0.5, 0.5,
-4.078896, 0.2695419, -7.396111, 0, 1.5, 0.5, 0.5
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
-4.078896, -4.006113, -0.1991646, 0, -0.5, 0.5, 0.5,
-4.078896, -4.006113, -0.1991646, 1, -0.5, 0.5, 0.5,
-4.078896, -4.006113, -0.1991646, 1, 1.5, 0.5, 0.5,
-4.078896, -4.006113, -0.1991646, 0, 1.5, 0.5, 0.5
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
-3, -3.019423, -5.735277,
3, -3.019423, -5.735277,
-3, -3.019423, -5.735277,
-3, -3.183872, -6.012083,
-2, -3.019423, -5.735277,
-2, -3.183872, -6.012083,
-1, -3.019423, -5.735277,
-1, -3.183872, -6.012083,
0, -3.019423, -5.735277,
0, -3.183872, -6.012083,
1, -3.019423, -5.735277,
1, -3.183872, -6.012083,
2, -3.019423, -5.735277,
2, -3.183872, -6.012083,
3, -3.019423, -5.735277,
3, -3.183872, -6.012083
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
-3, -3.512768, -6.565694, 0, -0.5, 0.5, 0.5,
-3, -3.512768, -6.565694, 1, -0.5, 0.5, 0.5,
-3, -3.512768, -6.565694, 1, 1.5, 0.5, 0.5,
-3, -3.512768, -6.565694, 0, 1.5, 0.5, 0.5,
-2, -3.512768, -6.565694, 0, -0.5, 0.5, 0.5,
-2, -3.512768, -6.565694, 1, -0.5, 0.5, 0.5,
-2, -3.512768, -6.565694, 1, 1.5, 0.5, 0.5,
-2, -3.512768, -6.565694, 0, 1.5, 0.5, 0.5,
-1, -3.512768, -6.565694, 0, -0.5, 0.5, 0.5,
-1, -3.512768, -6.565694, 1, -0.5, 0.5, 0.5,
-1, -3.512768, -6.565694, 1, 1.5, 0.5, 0.5,
-1, -3.512768, -6.565694, 0, 1.5, 0.5, 0.5,
0, -3.512768, -6.565694, 0, -0.5, 0.5, 0.5,
0, -3.512768, -6.565694, 1, -0.5, 0.5, 0.5,
0, -3.512768, -6.565694, 1, 1.5, 0.5, 0.5,
0, -3.512768, -6.565694, 0, 1.5, 0.5, 0.5,
1, -3.512768, -6.565694, 0, -0.5, 0.5, 0.5,
1, -3.512768, -6.565694, 1, -0.5, 0.5, 0.5,
1, -3.512768, -6.565694, 1, 1.5, 0.5, 0.5,
1, -3.512768, -6.565694, 0, 1.5, 0.5, 0.5,
2, -3.512768, -6.565694, 0, -0.5, 0.5, 0.5,
2, -3.512768, -6.565694, 1, -0.5, 0.5, 0.5,
2, -3.512768, -6.565694, 1, 1.5, 0.5, 0.5,
2, -3.512768, -6.565694, 0, 1.5, 0.5, 0.5,
3, -3.512768, -6.565694, 0, -0.5, 0.5, 0.5,
3, -3.512768, -6.565694, 1, -0.5, 0.5, 0.5,
3, -3.512768, -6.565694, 1, 1.5, 0.5, 0.5,
3, -3.512768, -6.565694, 0, 1.5, 0.5, 0.5
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
-3.11019, -2, -5.735277,
-3.11019, 3, -5.735277,
-3.11019, -2, -5.735277,
-3.271641, -2, -6.012083,
-3.11019, -1, -5.735277,
-3.271641, -1, -6.012083,
-3.11019, 0, -5.735277,
-3.271641, 0, -6.012083,
-3.11019, 1, -5.735277,
-3.271641, 1, -6.012083,
-3.11019, 2, -5.735277,
-3.271641, 2, -6.012083,
-3.11019, 3, -5.735277,
-3.271641, 3, -6.012083
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
-3.594543, -2, -6.565694, 0, -0.5, 0.5, 0.5,
-3.594543, -2, -6.565694, 1, -0.5, 0.5, 0.5,
-3.594543, -2, -6.565694, 1, 1.5, 0.5, 0.5,
-3.594543, -2, -6.565694, 0, 1.5, 0.5, 0.5,
-3.594543, -1, -6.565694, 0, -0.5, 0.5, 0.5,
-3.594543, -1, -6.565694, 1, -0.5, 0.5, 0.5,
-3.594543, -1, -6.565694, 1, 1.5, 0.5, 0.5,
-3.594543, -1, -6.565694, 0, 1.5, 0.5, 0.5,
-3.594543, 0, -6.565694, 0, -0.5, 0.5, 0.5,
-3.594543, 0, -6.565694, 1, -0.5, 0.5, 0.5,
-3.594543, 0, -6.565694, 1, 1.5, 0.5, 0.5,
-3.594543, 0, -6.565694, 0, 1.5, 0.5, 0.5,
-3.594543, 1, -6.565694, 0, -0.5, 0.5, 0.5,
-3.594543, 1, -6.565694, 1, -0.5, 0.5, 0.5,
-3.594543, 1, -6.565694, 1, 1.5, 0.5, 0.5,
-3.594543, 1, -6.565694, 0, 1.5, 0.5, 0.5,
-3.594543, 2, -6.565694, 0, -0.5, 0.5, 0.5,
-3.594543, 2, -6.565694, 1, -0.5, 0.5, 0.5,
-3.594543, 2, -6.565694, 1, 1.5, 0.5, 0.5,
-3.594543, 2, -6.565694, 0, 1.5, 0.5, 0.5,
-3.594543, 3, -6.565694, 0, -0.5, 0.5, 0.5,
-3.594543, 3, -6.565694, 1, -0.5, 0.5, 0.5,
-3.594543, 3, -6.565694, 1, 1.5, 0.5, 0.5,
-3.594543, 3, -6.565694, 0, 1.5, 0.5, 0.5
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
-3.11019, -3.019423, -4,
-3.11019, -3.019423, 4,
-3.11019, -3.019423, -4,
-3.271641, -3.183872, -4,
-3.11019, -3.019423, -2,
-3.271641, -3.183872, -2,
-3.11019, -3.019423, 0,
-3.271641, -3.183872, 0,
-3.11019, -3.019423, 2,
-3.271641, -3.183872, 2,
-3.11019, -3.019423, 4,
-3.271641, -3.183872, 4
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
-3.594543, -3.512768, -4, 0, -0.5, 0.5, 0.5,
-3.594543, -3.512768, -4, 1, -0.5, 0.5, 0.5,
-3.594543, -3.512768, -4, 1, 1.5, 0.5, 0.5,
-3.594543, -3.512768, -4, 0, 1.5, 0.5, 0.5,
-3.594543, -3.512768, -2, 0, -0.5, 0.5, 0.5,
-3.594543, -3.512768, -2, 1, -0.5, 0.5, 0.5,
-3.594543, -3.512768, -2, 1, 1.5, 0.5, 0.5,
-3.594543, -3.512768, -2, 0, 1.5, 0.5, 0.5,
-3.594543, -3.512768, 0, 0, -0.5, 0.5, 0.5,
-3.594543, -3.512768, 0, 1, -0.5, 0.5, 0.5,
-3.594543, -3.512768, 0, 1, 1.5, 0.5, 0.5,
-3.594543, -3.512768, 0, 0, 1.5, 0.5, 0.5,
-3.594543, -3.512768, 2, 0, -0.5, 0.5, 0.5,
-3.594543, -3.512768, 2, 1, -0.5, 0.5, 0.5,
-3.594543, -3.512768, 2, 1, 1.5, 0.5, 0.5,
-3.594543, -3.512768, 2, 0, 1.5, 0.5, 0.5,
-3.594543, -3.512768, 4, 0, -0.5, 0.5, 0.5,
-3.594543, -3.512768, 4, 1, -0.5, 0.5, 0.5,
-3.594543, -3.512768, 4, 1, 1.5, 0.5, 0.5,
-3.594543, -3.512768, 4, 0, 1.5, 0.5, 0.5
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
-3.11019, -3.019423, -5.735277,
-3.11019, 3.558507, -5.735277,
-3.11019, -3.019423, 5.336948,
-3.11019, 3.558507, 5.336948,
-3.11019, -3.019423, -5.735277,
-3.11019, -3.019423, 5.336948,
-3.11019, 3.558507, -5.735277,
-3.11019, 3.558507, 5.336948,
-3.11019, -3.019423, -5.735277,
3.347845, -3.019423, -5.735277,
-3.11019, -3.019423, 5.336948,
3.347845, -3.019423, 5.336948,
-3.11019, 3.558507, -5.735277,
3.347845, 3.558507, -5.735277,
-3.11019, 3.558507, 5.336948,
3.347845, 3.558507, 5.336948,
3.347845, -3.019423, -5.735277,
3.347845, 3.558507, -5.735277,
3.347845, -3.019423, 5.336948,
3.347845, 3.558507, 5.336948,
3.347845, -3.019423, -5.735277,
3.347845, -3.019423, 5.336948,
3.347845, 3.558507, -5.735277,
3.347845, 3.558507, 5.336948
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
var radius = 7.693205;
var distance = 34.22794;
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
mvMatrix.translate( -0.1188273, -0.2695419, 0.1991646 );
mvMatrix.scale( 1.288015, 1.264538, 0.7512531 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.22794);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
PHENYLENEDIAMINE<-read.table("PHENYLENEDIAMINE.xyz")
```

```
## Error in read.table("PHENYLENEDIAMINE.xyz"): no lines available in input
```

```r
x<-PHENYLENEDIAMINE$V2
```

```
## Error in eval(expr, envir, enclos): object 'PHENYLENEDIAMINE' not found
```

```r
y<-PHENYLENEDIAMINE$V3
```

```
## Error in eval(expr, envir, enclos): object 'PHENYLENEDIAMINE' not found
```

```r
z<-PHENYLENEDIAMINE$V4
```

```
## Error in eval(expr, envir, enclos): object 'PHENYLENEDIAMINE' not found
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
-3.016141, -0.08692303, -1.454673, 0, 0, 1, 1, 1,
-2.782511, -1.538365, -0.477442, 1, 0, 0, 1, 1,
-2.625162, 0.9927163, -2.776694, 1, 0, 0, 1, 1,
-2.545557, 0.7480374, 0.489051, 1, 0, 0, 1, 1,
-2.501854, 0.3637211, -0.6256143, 1, 0, 0, 1, 1,
-2.420522, -0.952719, 0.2965986, 1, 0, 0, 1, 1,
-2.412686, 0.4477671, -1.620937, 0, 0, 0, 1, 1,
-2.351432, 0.3018902, -1.023674, 0, 0, 0, 1, 1,
-2.341825, 0.2025122, 0.01547585, 0, 0, 0, 1, 1,
-2.304747, 0.7870902, 0.2495725, 0, 0, 0, 1, 1,
-2.292094, -2.210831, -3.986974, 0, 0, 0, 1, 1,
-2.286384, -0.9636579, -3.719889, 0, 0, 0, 1, 1,
-2.280146, 0.03408568, -1.420221, 0, 0, 0, 1, 1,
-2.278447, 0.8964454, -1.002427, 1, 1, 1, 1, 1,
-2.236823, -0.5731269, -2.094254, 1, 1, 1, 1, 1,
-2.205802, -0.4421647, -0.5624304, 1, 1, 1, 1, 1,
-2.202696, 0.2956445, -0.8758229, 1, 1, 1, 1, 1,
-2.17708, -0.2266196, -2.306689, 1, 1, 1, 1, 1,
-2.153291, 2.096805, -1.708532, 1, 1, 1, 1, 1,
-2.151165, -2.337363, -2.446903, 1, 1, 1, 1, 1,
-2.114768, 0.3211834, 0.09727263, 1, 1, 1, 1, 1,
-2.108592, 0.3154031, -1.363809, 1, 1, 1, 1, 1,
-2.100077, -1.059311, -1.513795, 1, 1, 1, 1, 1,
-2.055214, -0.646692, -3.044078, 1, 1, 1, 1, 1,
-2.015702, -0.5866168, -0.5917695, 1, 1, 1, 1, 1,
-2.003656, -1.01683, -2.032008, 1, 1, 1, 1, 1,
-1.993731, 0.08847754, -1.253373, 1, 1, 1, 1, 1,
-1.992036, 1.149961, -0.7672662, 1, 1, 1, 1, 1,
-1.977804, 1.759426, -0.7220938, 0, 0, 1, 1, 1,
-1.962132, -0.1560988, -0.9130777, 1, 0, 0, 1, 1,
-1.912832, -0.1201164, -1.069102, 1, 0, 0, 1, 1,
-1.911063, -0.5255792, -1.370509, 1, 0, 0, 1, 1,
-1.891865, -1.656164, -1.678925, 1, 0, 0, 1, 1,
-1.876629, 0.975303, -1.141811, 1, 0, 0, 1, 1,
-1.875834, -0.4264315, 0.3598586, 0, 0, 0, 1, 1,
-1.858895, 0.941673, -2.001148, 0, 0, 0, 1, 1,
-1.838689, -0.1021731, -1.969548, 0, 0, 0, 1, 1,
-1.823534, -0.7288831, -3.504598, 0, 0, 0, 1, 1,
-1.818325, 1.119738, -1.701509, 0, 0, 0, 1, 1,
-1.817252, 0.6662045, 0.558017, 0, 0, 0, 1, 1,
-1.811338, 0.7359322, -0.2864087, 0, 0, 0, 1, 1,
-1.799735, -0.6430321, -1.644835, 1, 1, 1, 1, 1,
-1.79309, -0.400804, -0.05826319, 1, 1, 1, 1, 1,
-1.783467, -1.931595, -1.782523, 1, 1, 1, 1, 1,
-1.757733, 0.9591744, -1.415416, 1, 1, 1, 1, 1,
-1.701694, 0.6715109, -2.585081, 1, 1, 1, 1, 1,
-1.693651, -2.147411, -2.252994, 1, 1, 1, 1, 1,
-1.690747, -0.1172448, -1.027373, 1, 1, 1, 1, 1,
-1.686991, -0.5994427, -1.965873, 1, 1, 1, 1, 1,
-1.671503, -0.6037971, 0.1985141, 1, 1, 1, 1, 1,
-1.65297, -0.7864767, -0.7661331, 1, 1, 1, 1, 1,
-1.651394, 0.8535244, 0.1675489, 1, 1, 1, 1, 1,
-1.638596, 0.6185711, 0.05692559, 1, 1, 1, 1, 1,
-1.637687, 0.1501033, -3.074456, 1, 1, 1, 1, 1,
-1.632076, -0.0845262, -1.568665, 1, 1, 1, 1, 1,
-1.619431, 0.4216908, -3.1959, 1, 1, 1, 1, 1,
-1.618165, 0.5949092, -2.31359, 0, 0, 1, 1, 1,
-1.616864, -1.450432, -3.183538, 1, 0, 0, 1, 1,
-1.615962, -1.681816, -2.162015, 1, 0, 0, 1, 1,
-1.615193, -0.8228775, -1.654195, 1, 0, 0, 1, 1,
-1.601407, -1.606242, -1.906736, 1, 0, 0, 1, 1,
-1.582901, 0.8088337, -1.52207, 1, 0, 0, 1, 1,
-1.581147, 0.3103377, -1.148258, 0, 0, 0, 1, 1,
-1.568667, 0.4272858, -0.6009713, 0, 0, 0, 1, 1,
-1.557694, 0.5742424, -1.081293, 0, 0, 0, 1, 1,
-1.537322, 0.2277794, 1.590762, 0, 0, 0, 1, 1,
-1.534235, 0.8654379, -1.358215, 0, 0, 0, 1, 1,
-1.527845, 0.8580847, -1.193568, 0, 0, 0, 1, 1,
-1.520271, -2.61276, -2.324153, 0, 0, 0, 1, 1,
-1.510763, -2.480462, -2.622848, 1, 1, 1, 1, 1,
-1.491257, -1.065936, -2.350663, 1, 1, 1, 1, 1,
-1.489274, 0.7114173, -0.5240715, 1, 1, 1, 1, 1,
-1.474151, -0.3829801, -1.278213, 1, 1, 1, 1, 1,
-1.473244, -2.030402, -1.308997, 1, 1, 1, 1, 1,
-1.463996, -0.3599049, -0.6450129, 1, 1, 1, 1, 1,
-1.450323, 0.2371629, -1.688307, 1, 1, 1, 1, 1,
-1.433436, 0.5097465, -0.1186597, 1, 1, 1, 1, 1,
-1.428923, -0.1774747, -0.66937, 1, 1, 1, 1, 1,
-1.428096, -1.770172, -1.493456, 1, 1, 1, 1, 1,
-1.427408, 1.222328, -0.3611675, 1, 1, 1, 1, 1,
-1.426712, -1.180336, -1.196211, 1, 1, 1, 1, 1,
-1.424348, -0.10127, -0.8686824, 1, 1, 1, 1, 1,
-1.420132, -0.9831082, -1.598566, 1, 1, 1, 1, 1,
-1.410977, 0.5212822, -0.8378326, 1, 1, 1, 1, 1,
-1.410448, 0.009839441, -1.694968, 0, 0, 1, 1, 1,
-1.405928, -0.3314918, -2.144246, 1, 0, 0, 1, 1,
-1.393791, 0.1469557, -0.5934178, 1, 0, 0, 1, 1,
-1.390565, -1.748333, -2.963939, 1, 0, 0, 1, 1,
-1.383137, -0.9196724, -3.796621, 1, 0, 0, 1, 1,
-1.377143, -0.8279235, -2.882152, 1, 0, 0, 1, 1,
-1.367397, 1.299621, -0.04844214, 0, 0, 0, 1, 1,
-1.357283, -0.1911114, -2.161765, 0, 0, 0, 1, 1,
-1.351013, 2.33267, -0.7020848, 0, 0, 0, 1, 1,
-1.349707, 1.010209, -2.270247, 0, 0, 0, 1, 1,
-1.331575, 0.2684844, -0.8371834, 0, 0, 0, 1, 1,
-1.327863, -0.2529511, -1.014617, 0, 0, 0, 1, 1,
-1.327332, -1.884217, -2.896226, 0, 0, 0, 1, 1,
-1.327207, 0.2503375, -1.773815, 1, 1, 1, 1, 1,
-1.325577, 0.7776772, -1.306345, 1, 1, 1, 1, 1,
-1.309471, 0.3166976, -1.602425, 1, 1, 1, 1, 1,
-1.305319, 0.8485885, -0.9628047, 1, 1, 1, 1, 1,
-1.300585, -0.6488964, -2.0551, 1, 1, 1, 1, 1,
-1.295016, -1.552149, -2.592111, 1, 1, 1, 1, 1,
-1.293814, 0.1203869, -1.594103, 1, 1, 1, 1, 1,
-1.291863, 0.4734575, -0.8944958, 1, 1, 1, 1, 1,
-1.289395, -0.3022938, -0.3207547, 1, 1, 1, 1, 1,
-1.284247, -0.9736222, -1.192033, 1, 1, 1, 1, 1,
-1.255486, -1.227085, -1.850243, 1, 1, 1, 1, 1,
-1.252988, -1.228038, -2.651391, 1, 1, 1, 1, 1,
-1.251229, 1.007846, -0.1572819, 1, 1, 1, 1, 1,
-1.248557, 0.3420299, 0.4370708, 1, 1, 1, 1, 1,
-1.246007, -0.7669696, -2.240211, 1, 1, 1, 1, 1,
-1.237893, -0.03348714, -2.030973, 0, 0, 1, 1, 1,
-1.23558, -0.003330399, -0.134543, 1, 0, 0, 1, 1,
-1.234637, -0.4137651, -1.75162, 1, 0, 0, 1, 1,
-1.234477, 0.221436, -0.8745496, 1, 0, 0, 1, 1,
-1.230722, 0.3401867, -1.524296, 1, 0, 0, 1, 1,
-1.225459, 0.2576956, -1.781815, 1, 0, 0, 1, 1,
-1.223652, -1.101204, -3.179133, 0, 0, 0, 1, 1,
-1.200732, 0.2768919, -0.557968, 0, 0, 0, 1, 1,
-1.198898, 0.237983, -0.42382, 0, 0, 0, 1, 1,
-1.197343, 1.99562, -0.3833623, 0, 0, 0, 1, 1,
-1.189005, 1.618941, -0.6427916, 0, 0, 0, 1, 1,
-1.186494, -0.4572548, -1.849872, 0, 0, 0, 1, 1,
-1.170891, -0.3161924, -2.632609, 0, 0, 0, 1, 1,
-1.169854, -2.539073, -2.523384, 1, 1, 1, 1, 1,
-1.169778, 0.1198462, -1.190149, 1, 1, 1, 1, 1,
-1.167162, 0.1197477, -1.722073, 1, 1, 1, 1, 1,
-1.154547, -0.9953399, -1.851259, 1, 1, 1, 1, 1,
-1.141472, 0.2790516, -1.035057, 1, 1, 1, 1, 1,
-1.141395, -0.6873552, -2.527684, 1, 1, 1, 1, 1,
-1.13962, 0.9890948, 1.766493, 1, 1, 1, 1, 1,
-1.136919, -2.668985, -4.324825, 1, 1, 1, 1, 1,
-1.130539, 0.9223398, -2.285735, 1, 1, 1, 1, 1,
-1.122619, 0.5018005, -0.8976759, 1, 1, 1, 1, 1,
-1.12089, -1.384179, -2.648601, 1, 1, 1, 1, 1,
-1.117172, 0.4049534, -2.30138, 1, 1, 1, 1, 1,
-1.104425, -0.3079815, -3.174341, 1, 1, 1, 1, 1,
-1.096964, -0.3280428, -2.404217, 1, 1, 1, 1, 1,
-1.092955, 0.8767747, -1.038366, 1, 1, 1, 1, 1,
-1.089667, 1.014379, -2.56896, 0, 0, 1, 1, 1,
-1.087157, -2.315694, -3.21322, 1, 0, 0, 1, 1,
-1.085647, 0.520756, -0.3814746, 1, 0, 0, 1, 1,
-1.083302, 0.2306451, -0.4303323, 1, 0, 0, 1, 1,
-1.082299, 0.395832, -2.807669, 1, 0, 0, 1, 1,
-1.075658, 0.5219749, -2.311987, 1, 0, 0, 1, 1,
-1.074137, 0.5446584, -1.388093, 0, 0, 0, 1, 1,
-1.070877, 0.5781456, -1.371139, 0, 0, 0, 1, 1,
-1.065106, 1.393228, 0.2738969, 0, 0, 0, 1, 1,
-1.059919, -0.4433237, -1.3315, 0, 0, 0, 1, 1,
-1.054789, -0.03589588, -1.830253, 0, 0, 0, 1, 1,
-1.049163, 0.4144765, -0.8327447, 0, 0, 0, 1, 1,
-1.045745, -0.3664056, -1.431513, 0, 0, 0, 1, 1,
-1.039367, -1.134268, -1.329448, 1, 1, 1, 1, 1,
-1.039162, -0.4834332, -1.825904, 1, 1, 1, 1, 1,
-1.036409, -1.511376, -3.061835, 1, 1, 1, 1, 1,
-1.029037, 1.992989, 0.4221692, 1, 1, 1, 1, 1,
-1.023405, -0.3270869, -1.412455, 1, 1, 1, 1, 1,
-1.01883, -1.096108, -3.663451, 1, 1, 1, 1, 1,
-1.017503, -0.9899132, -1.453474, 1, 1, 1, 1, 1,
-1.017393, -0.295006, -1.533139, 1, 1, 1, 1, 1,
-1.015024, 1.989945, 0.01667769, 1, 1, 1, 1, 1,
-1.01462, -0.6239269, -0.7566336, 1, 1, 1, 1, 1,
-1.013541, 0.8118084, -1.315485, 1, 1, 1, 1, 1,
-1.006129, -1.697924, -0.9730642, 1, 1, 1, 1, 1,
-1.005627, 0.4671689, -0.6230701, 1, 1, 1, 1, 1,
-1.001383, 0.4845523, -1.461327, 1, 1, 1, 1, 1,
-1.001106, -0.02129948, -0.9350864, 1, 1, 1, 1, 1,
-0.9993475, 0.3413277, -1.0797, 0, 0, 1, 1, 1,
-0.9988075, 1.440829, -0.9175634, 1, 0, 0, 1, 1,
-0.9984644, -1.327086, -2.546655, 1, 0, 0, 1, 1,
-0.992919, -1.204177, -2.664989, 1, 0, 0, 1, 1,
-0.9786332, 0.5547927, 0.4610208, 1, 0, 0, 1, 1,
-0.9694387, -0.3205511, -2.200896, 1, 0, 0, 1, 1,
-0.9671965, 2.010576, 0.1544913, 0, 0, 0, 1, 1,
-0.9560044, 0.3536235, -0.5474132, 0, 0, 0, 1, 1,
-0.9557863, 1.244969, -2.262258, 0, 0, 0, 1, 1,
-0.9526423, 1.020936, -1.315309, 0, 0, 0, 1, 1,
-0.9506308, -0.04758863, -0.7339765, 0, 0, 0, 1, 1,
-0.9505589, 0.7966061, -0.5851972, 0, 0, 0, 1, 1,
-0.9427845, 0.542284, -1.154107, 0, 0, 0, 1, 1,
-0.9426507, 0.08466793, -2.423029, 1, 1, 1, 1, 1,
-0.9420541, -0.6629608, -1.647149, 1, 1, 1, 1, 1,
-0.9417015, -0.6006255, -1.73601, 1, 1, 1, 1, 1,
-0.9399861, 1.365947, -1.045634, 1, 1, 1, 1, 1,
-0.9376307, 0.03003314, -2.890247, 1, 1, 1, 1, 1,
-0.9369837, -0.08808466, -1.574211, 1, 1, 1, 1, 1,
-0.9315483, -0.5814319, -2.099469, 1, 1, 1, 1, 1,
-0.9311586, 1.391961, 0.4284788, 1, 1, 1, 1, 1,
-0.9297307, 1.253797, 0.231332, 1, 1, 1, 1, 1,
-0.9251389, 0.8378336, -0.9607096, 1, 1, 1, 1, 1,
-0.9205435, -0.1107205, -1.394207, 1, 1, 1, 1, 1,
-0.9149597, 0.01360731, -1.289842, 1, 1, 1, 1, 1,
-0.9137825, 0.04106663, -1.477359, 1, 1, 1, 1, 1,
-0.9106961, 0.4152941, -0.1614666, 1, 1, 1, 1, 1,
-0.9096599, 0.9021192, -0.3265038, 1, 1, 1, 1, 1,
-0.9077919, -1.652632, -3.729212, 0, 0, 1, 1, 1,
-0.9038279, 1.248409, -1.42777, 1, 0, 0, 1, 1,
-0.8993207, -0.2429017, -1.364746, 1, 0, 0, 1, 1,
-0.8929276, -0.04173662, -0.0260364, 1, 0, 0, 1, 1,
-0.8898588, 0.2717204, -1.117501, 1, 0, 0, 1, 1,
-0.8836078, -1.232402, -4.146404, 1, 0, 0, 1, 1,
-0.8801902, 0.1646529, -1.688197, 0, 0, 0, 1, 1,
-0.8743063, 0.8219221, -0.9725973, 0, 0, 0, 1, 1,
-0.8710132, 0.3378885, -2.679811, 0, 0, 0, 1, 1,
-0.8689494, -0.07677367, -2.279319, 0, 0, 0, 1, 1,
-0.8682565, -1.283897, -3.732256, 0, 0, 0, 1, 1,
-0.8641875, 0.7265972, -2.275389, 0, 0, 0, 1, 1,
-0.8590373, -0.6293288, -2.278293, 0, 0, 0, 1, 1,
-0.8486242, -0.3705259, -0.9526439, 1, 1, 1, 1, 1,
-0.8401367, 1.188666, 0.2310083, 1, 1, 1, 1, 1,
-0.8367027, -0.1633337, -1.96635, 1, 1, 1, 1, 1,
-0.8361449, 1.597295, -0.7554731, 1, 1, 1, 1, 1,
-0.8284575, 2.262629, 0.3139757, 1, 1, 1, 1, 1,
-0.8209773, -0.551127, -1.684062, 1, 1, 1, 1, 1,
-0.8132381, 0.1705798, -1.859332, 1, 1, 1, 1, 1,
-0.8113415, -0.4511732, -0.8333582, 1, 1, 1, 1, 1,
-0.8082364, 0.6842902, -1.274158, 1, 1, 1, 1, 1,
-0.8082253, -0.7468135, -1.674882, 1, 1, 1, 1, 1,
-0.8048252, -0.3284883, -3.051953, 1, 1, 1, 1, 1,
-0.8024116, -1.801369, -3.67885, 1, 1, 1, 1, 1,
-0.8021575, 1.092715, 0.2193873, 1, 1, 1, 1, 1,
-0.7927781, 1.766812, -0.3094073, 1, 1, 1, 1, 1,
-0.7900693, 1.21769, -0.5770816, 1, 1, 1, 1, 1,
-0.7882181, -0.9805009, -2.457896, 0, 0, 1, 1, 1,
-0.7858532, -0.7295631, -1.683846, 1, 0, 0, 1, 1,
-0.7856175, 1.49877, -2.679005, 1, 0, 0, 1, 1,
-0.7835891, 0.9812773, -0.4996478, 1, 0, 0, 1, 1,
-0.7801417, -2.141872, -2.779015, 1, 0, 0, 1, 1,
-0.7771342, 0.6405138, -0.04749838, 1, 0, 0, 1, 1,
-0.7743883, 1.521802, 0.2824949, 0, 0, 0, 1, 1,
-0.7730383, 1.115866, -0.0003247455, 0, 0, 0, 1, 1,
-0.7690567, -0.5880545, -4.347865, 0, 0, 0, 1, 1,
-0.7629934, 0.4195721, -0.1444028, 0, 0, 0, 1, 1,
-0.7577171, 1.067451, -0.808657, 0, 0, 0, 1, 1,
-0.7555835, -0.01594056, -2.142522, 0, 0, 0, 1, 1,
-0.7549075, 2.126179, 1.483296, 0, 0, 0, 1, 1,
-0.7543991, 0.9658998, 0.6940461, 1, 1, 1, 1, 1,
-0.7536865, -0.3925493, -2.947031, 1, 1, 1, 1, 1,
-0.7401137, -1.370463, -0.5795715, 1, 1, 1, 1, 1,
-0.7399572, -1.740841, -2.813699, 1, 1, 1, 1, 1,
-0.7396349, 1.811369, -0.8652849, 1, 1, 1, 1, 1,
-0.7359129, -0.9483857, -2.852683, 1, 1, 1, 1, 1,
-0.7350554, 0.5674595, -0.2174195, 1, 1, 1, 1, 1,
-0.7346009, 1.557437, 0.3517522, 1, 1, 1, 1, 1,
-0.7316588, -1.997353, -2.613526, 1, 1, 1, 1, 1,
-0.7307477, -0.5042139, -5.529883, 1, 1, 1, 1, 1,
-0.7257883, -0.3572993, -1.958679, 1, 1, 1, 1, 1,
-0.7223797, 1.077875, -0.574841, 1, 1, 1, 1, 1,
-0.7164035, 1.13322, -0.1855625, 1, 1, 1, 1, 1,
-0.715742, -0.1663542, -2.04525, 1, 1, 1, 1, 1,
-0.7116942, -0.9565488, -1.900404, 1, 1, 1, 1, 1,
-0.7085922, 0.3461646, -0.6274204, 0, 0, 1, 1, 1,
-0.7071644, -0.7799689, -1.941427, 1, 0, 0, 1, 1,
-0.7036749, -0.5358238, -1.073895, 1, 0, 0, 1, 1,
-0.6987606, 1.527537, -0.8266066, 1, 0, 0, 1, 1,
-0.6979154, 0.3523987, -2.757288, 1, 0, 0, 1, 1,
-0.694829, -0.8193284, -2.695143, 1, 0, 0, 1, 1,
-0.6903538, 0.2626117, -1.843006, 0, 0, 0, 1, 1,
-0.6889241, 0.2593816, -1.626582, 0, 0, 0, 1, 1,
-0.6832612, 0.8998756, -0.8349781, 0, 0, 0, 1, 1,
-0.6782885, -1.863775, -2.035024, 0, 0, 0, 1, 1,
-0.6714582, 0.9239237, -0.1836183, 0, 0, 0, 1, 1,
-0.6527185, -0.5733446, -2.01224, 0, 0, 0, 1, 1,
-0.6518577, 0.8061759, 0.05199995, 0, 0, 0, 1, 1,
-0.6488692, -0.525577, -2.165086, 1, 1, 1, 1, 1,
-0.64854, 1.162613, 0.5181854, 1, 1, 1, 1, 1,
-0.648488, -1.906314, -3.214722, 1, 1, 1, 1, 1,
-0.6471334, -0.5019857, -1.429876, 1, 1, 1, 1, 1,
-0.6449475, -0.5854686, -2.566442, 1, 1, 1, 1, 1,
-0.6441772, -1.646184, -2.535656, 1, 1, 1, 1, 1,
-0.642181, -2.760535, -3.90516, 1, 1, 1, 1, 1,
-0.6421569, -0.05603466, -2.064752, 1, 1, 1, 1, 1,
-0.6375307, 0.3332416, -0.7178313, 1, 1, 1, 1, 1,
-0.633003, 1.523514, -0.506251, 1, 1, 1, 1, 1,
-0.6328747, -0.5718445, -0.8948167, 1, 1, 1, 1, 1,
-0.6273766, 1.150638, -0.7016508, 1, 1, 1, 1, 1,
-0.627005, -1.542447, -2.22758, 1, 1, 1, 1, 1,
-0.6268111, 0.6962086, -1.778423, 1, 1, 1, 1, 1,
-0.621465, 0.1736503, -3.083156, 1, 1, 1, 1, 1,
-0.6208298, -1.464122, -4.002225, 0, 0, 1, 1, 1,
-0.6183807, -0.5447989, -3.233511, 1, 0, 0, 1, 1,
-0.6160735, -2.109178, -1.637413, 1, 0, 0, 1, 1,
-0.6139955, -0.8288167, -3.593928, 1, 0, 0, 1, 1,
-0.6108005, 0.2551737, -0.5722232, 1, 0, 0, 1, 1,
-0.6088539, -0.08100022, -1.252027, 1, 0, 0, 1, 1,
-0.6055606, 0.6432196, 0.577085, 0, 0, 0, 1, 1,
-0.601468, 0.4297396, -0.9124939, 0, 0, 0, 1, 1,
-0.5999506, 0.01662753, -1.908174, 0, 0, 0, 1, 1,
-0.5999271, -0.2992132, -0.8236573, 0, 0, 0, 1, 1,
-0.5982504, -0.9688135, -0.04304862, 0, 0, 0, 1, 1,
-0.5953026, -1.831236, -2.807787, 0, 0, 0, 1, 1,
-0.5896851, -1.231772, -3.653247, 0, 0, 0, 1, 1,
-0.5884933, 0.2836618, -0.04986171, 1, 1, 1, 1, 1,
-0.58271, -0.7159005, -3.920992, 1, 1, 1, 1, 1,
-0.5810912, 0.4069098, -2.134648, 1, 1, 1, 1, 1,
-0.5734153, 0.2821876, -0.6267389, 1, 1, 1, 1, 1,
-0.5726103, 0.5707042, 0.3596162, 1, 1, 1, 1, 1,
-0.5701141, 0.854983, -1.079906, 1, 1, 1, 1, 1,
-0.5639102, -0.4547437, -2.179764, 1, 1, 1, 1, 1,
-0.5618955, -0.7679528, -1.369156, 1, 1, 1, 1, 1,
-0.5607328, 0.698639, -0.4503173, 1, 1, 1, 1, 1,
-0.5604748, 0.2732434, -1.232022, 1, 1, 1, 1, 1,
-0.5590961, -0.2472853, -1.183771, 1, 1, 1, 1, 1,
-0.5576753, -0.7185588, -1.084581, 1, 1, 1, 1, 1,
-0.5527511, 0.7733294, -1.182383, 1, 1, 1, 1, 1,
-0.5455762, -0.9093909, -2.740686, 1, 1, 1, 1, 1,
-0.544889, 1.07917, -1.006808, 1, 1, 1, 1, 1,
-0.5444834, -1.021369, -3.835225, 0, 0, 1, 1, 1,
-0.5332703, 1.203077, -1.486163, 1, 0, 0, 1, 1,
-0.5330053, -1.597887, -1.230121, 1, 0, 0, 1, 1,
-0.5220774, -1.14925, -4.668442, 1, 0, 0, 1, 1,
-0.515624, 1.741934, 0.8282332, 1, 0, 0, 1, 1,
-0.5153248, 0.9248728, -2.50812, 1, 0, 0, 1, 1,
-0.5133396, -1.187649, -3.128166, 0, 0, 0, 1, 1,
-0.5133117, 0.2648198, -2.392454, 0, 0, 0, 1, 1,
-0.5119093, 0.5080276, 0.1141409, 0, 0, 0, 1, 1,
-0.5114595, 0.2601084, -1.764317, 0, 0, 0, 1, 1,
-0.5109155, 0.9944134, -0.5983452, 0, 0, 0, 1, 1,
-0.510488, -0.03027471, -1.47705, 0, 0, 0, 1, 1,
-0.5082625, 1.888859, 0.5988127, 0, 0, 0, 1, 1,
-0.507064, 1.831561, -2.158112, 1, 1, 1, 1, 1,
-0.5036883, -1.502057, -1.855824, 1, 1, 1, 1, 1,
-0.5026184, 1.254653, -1.769875, 1, 1, 1, 1, 1,
-0.5020592, -0.4273293, -1.530338, 1, 1, 1, 1, 1,
-0.5017107, 2.175301, 0.7561421, 1, 1, 1, 1, 1,
-0.5010085, 2.357924, -1.109836, 1, 1, 1, 1, 1,
-0.4993193, 0.3683667, 0.06417852, 1, 1, 1, 1, 1,
-0.4853775, -2.183902, -3.252245, 1, 1, 1, 1, 1,
-0.4836365, -0.7442563, -1.399141, 1, 1, 1, 1, 1,
-0.4831481, 0.97352, -0.09555702, 1, 1, 1, 1, 1,
-0.473471, 0.007951939, -1.455717, 1, 1, 1, 1, 1,
-0.4699678, 0.8742886, 0.09668651, 1, 1, 1, 1, 1,
-0.4674382, 0.6462673, -2.047059, 1, 1, 1, 1, 1,
-0.4624406, -0.1432406, 0.5375416, 1, 1, 1, 1, 1,
-0.4525006, -1.043725, -2.956268, 1, 1, 1, 1, 1,
-0.4501703, -0.06104987, -2.767456, 0, 0, 1, 1, 1,
-0.4490466, 2.184072, -2.237018, 1, 0, 0, 1, 1,
-0.4480571, -0.2950671, -3.237619, 1, 0, 0, 1, 1,
-0.4476714, 2.536557, 0.3109302, 1, 0, 0, 1, 1,
-0.4457343, -0.9003727, -3.369219, 1, 0, 0, 1, 1,
-0.4435786, 0.1317859, 0.1715674, 1, 0, 0, 1, 1,
-0.4397629, 0.4158033, -2.115935, 0, 0, 0, 1, 1,
-0.4367259, 0.2344704, 0.2243266, 0, 0, 0, 1, 1,
-0.433779, 0.5356608, 0.04645231, 0, 0, 0, 1, 1,
-0.431664, -0.05975609, -3.110431, 0, 0, 0, 1, 1,
-0.4272128, -2.026945, -1.348219, 0, 0, 0, 1, 1,
-0.4265099, 1.178518, -1.160457, 0, 0, 0, 1, 1,
-0.4250272, 1.130554, -1.011234, 0, 0, 0, 1, 1,
-0.4216108, 0.4599196, 0.9747816, 1, 1, 1, 1, 1,
-0.4211851, -1.285733, -2.26031, 1, 1, 1, 1, 1,
-0.4210989, -0.2974405, -2.536649, 1, 1, 1, 1, 1,
-0.4205214, 0.5890513, 0.8231696, 1, 1, 1, 1, 1,
-0.4164404, -0.8999039, -3.723156, 1, 1, 1, 1, 1,
-0.4116625, -0.08184771, -3.58294, 1, 1, 1, 1, 1,
-0.407576, -2.109836, -2.002813, 1, 1, 1, 1, 1,
-0.4007474, 2.288245, 0.07444088, 1, 1, 1, 1, 1,
-0.4004118, -2.435275, -2.835597, 1, 1, 1, 1, 1,
-0.398354, -1.255465, -4.050947, 1, 1, 1, 1, 1,
-0.390653, 1.795565, -0.9759503, 1, 1, 1, 1, 1,
-0.3894817, 0.07177224, -0.3492127, 1, 1, 1, 1, 1,
-0.3859971, 0.9393039, -0.2838734, 1, 1, 1, 1, 1,
-0.3780628, 1.105883, -0.4673621, 1, 1, 1, 1, 1,
-0.3779068, -0.03540898, -1.533841, 1, 1, 1, 1, 1,
-0.3710427, -0.3614957, -1.022893, 0, 0, 1, 1, 1,
-0.3694977, 0.09844851, -2.460268, 1, 0, 0, 1, 1,
-0.3647066, 0.8005117, 0.9487205, 1, 0, 0, 1, 1,
-0.3601971, 0.4463318, -1.388269, 1, 0, 0, 1, 1,
-0.35955, 1.236199, -0.8619286, 1, 0, 0, 1, 1,
-0.3585328, -0.4804266, -0.4296412, 1, 0, 0, 1, 1,
-0.3580594, 0.8487945, 0.0657948, 0, 0, 0, 1, 1,
-0.3496835, -0.2574062, -0.7875215, 0, 0, 0, 1, 1,
-0.3492244, -0.6756589, -2.300598, 0, 0, 0, 1, 1,
-0.3381652, 0.4347004, -1.32421, 0, 0, 0, 1, 1,
-0.336823, -0.8636668, -3.315327, 0, 0, 0, 1, 1,
-0.3359585, 1.090141, 0.6737996, 0, 0, 0, 1, 1,
-0.335377, 1.180182, 1.50604, 0, 0, 0, 1, 1,
-0.3300695, -0.6825889, -2.082689, 1, 1, 1, 1, 1,
-0.3247971, 0.6681802, -0.7751225, 1, 1, 1, 1, 1,
-0.3216466, 2.721965, 0.5121649, 1, 1, 1, 1, 1,
-0.3209885, -0.9001806, -2.467751, 1, 1, 1, 1, 1,
-0.3205264, 2.062875, 0.7658923, 1, 1, 1, 1, 1,
-0.3158834, 0.8473212, -0.4140634, 1, 1, 1, 1, 1,
-0.3143404, -1.313918, -3.312911, 1, 1, 1, 1, 1,
-0.311268, -0.1757544, -3.201779, 1, 1, 1, 1, 1,
-0.3082324, 0.7454225, 1.366192, 1, 1, 1, 1, 1,
-0.3073889, 1.102601, 0.3164066, 1, 1, 1, 1, 1,
-0.3061153, 0.2652163, -0.2148355, 1, 1, 1, 1, 1,
-0.3026938, 0.9371296, -1.511843, 1, 1, 1, 1, 1,
-0.3022352, 1.623181, -1.963413, 1, 1, 1, 1, 1,
-0.2973714, 0.5560196, -2.504355, 1, 1, 1, 1, 1,
-0.292279, 1.895659, 0.0353233, 1, 1, 1, 1, 1,
-0.2901671, 0.4839091, 0.2961882, 0, 0, 1, 1, 1,
-0.2842751, -1.32389, -3.978681, 1, 0, 0, 1, 1,
-0.2768534, -1.247841, -1.741663, 1, 0, 0, 1, 1,
-0.2762512, 1.733636, -1.517071, 1, 0, 0, 1, 1,
-0.2734993, 1.176886, -0.2040569, 1, 0, 0, 1, 1,
-0.2643553, -0.03027617, -1.126636, 1, 0, 0, 1, 1,
-0.2635949, 3.227193, 0.2670748, 0, 0, 0, 1, 1,
-0.2633838, -0.3827109, -2.774742, 0, 0, 0, 1, 1,
-0.2587641, -0.166612, -1.481408, 0, 0, 0, 1, 1,
-0.2523085, -0.3254926, -0.4452671, 0, 0, 0, 1, 1,
-0.251117, -0.5234199, -3.264633, 0, 0, 0, 1, 1,
-0.2499855, -2.581003, -3.665474, 0, 0, 0, 1, 1,
-0.2433464, 0.4048318, -1.516425, 0, 0, 0, 1, 1,
-0.2376975, 0.6139377, 0.2175368, 1, 1, 1, 1, 1,
-0.2352006, 1.000846, 0.5734508, 1, 1, 1, 1, 1,
-0.2349775, 0.849924, -0.8182641, 1, 1, 1, 1, 1,
-0.2259601, -1.208203, -3.697109, 1, 1, 1, 1, 1,
-0.2225854, -0.5338026, -3.132016, 1, 1, 1, 1, 1,
-0.2215269, -2.165929, -2.418356, 1, 1, 1, 1, 1,
-0.2201749, -0.02603241, -2.457238, 1, 1, 1, 1, 1,
-0.2189634, 1.100553, -0.3924109, 1, 1, 1, 1, 1,
-0.2130693, 0.2648622, 0.08586725, 1, 1, 1, 1, 1,
-0.2078011, 0.6237309, -0.01807426, 1, 1, 1, 1, 1,
-0.2061408, 0.3424917, -1.317347, 1, 1, 1, 1, 1,
-0.2037244, 0.9049379, 0.1291521, 1, 1, 1, 1, 1,
-0.2033923, -1.179484, -1.288433, 1, 1, 1, 1, 1,
-0.201748, 0.157142, -0.9306787, 1, 1, 1, 1, 1,
-0.1996044, -0.6907425, -4.772869, 1, 1, 1, 1, 1,
-0.1932476, -1.194234, -2.612372, 0, 0, 1, 1, 1,
-0.189134, -0.5375628, -2.138967, 1, 0, 0, 1, 1,
-0.1878064, -0.4092548, -2.737457, 1, 0, 0, 1, 1,
-0.1868763, 0.5154067, -1.206253, 1, 0, 0, 1, 1,
-0.1848169, 0.1582791, 0.2529241, 1, 0, 0, 1, 1,
-0.1792568, 0.3194965, 0.1303863, 1, 0, 0, 1, 1,
-0.1789034, -1.335188, -3.746681, 0, 0, 0, 1, 1,
-0.1778238, 0.8310753, -1.183876, 0, 0, 0, 1, 1,
-0.1731441, 0.6121547, -1.074693, 0, 0, 0, 1, 1,
-0.1721589, -2.040478, -2.691434, 0, 0, 0, 1, 1,
-0.1708041, -0.460457, -3.996987, 0, 0, 0, 1, 1,
-0.1693473, -1.462314, -3.952442, 0, 0, 0, 1, 1,
-0.1652807, -0.2106146, -2.480721, 0, 0, 0, 1, 1,
-0.1638686, -0.08381909, -1.954436, 1, 1, 1, 1, 1,
-0.1625078, -0.5500919, -2.675204, 1, 1, 1, 1, 1,
-0.1588003, -1.350594, -4.094874, 1, 1, 1, 1, 1,
-0.1557718, 0.1291374, 1.448923, 1, 1, 1, 1, 1,
-0.1540307, -1.228914, -3.670469, 1, 1, 1, 1, 1,
-0.1531439, 1.443557, -0.899955, 1, 1, 1, 1, 1,
-0.1530026, 0.1479688, -0.5983241, 1, 1, 1, 1, 1,
-0.1512756, 0.02587277, -1.825827, 1, 1, 1, 1, 1,
-0.1502846, -1.374334, -5.260968, 1, 1, 1, 1, 1,
-0.150137, 0.6040133, 0.7599173, 1, 1, 1, 1, 1,
-0.1496437, 0.7211106, -0.2091829, 1, 1, 1, 1, 1,
-0.1494816, -1.173275, -2.678449, 1, 1, 1, 1, 1,
-0.1479164, 1.007127, -2.609296, 1, 1, 1, 1, 1,
-0.146318, 0.8142565, -0.01708823, 1, 1, 1, 1, 1,
-0.1361174, 0.2458655, -0.4543662, 1, 1, 1, 1, 1,
-0.1293802, 0.709645, -0.5812213, 0, 0, 1, 1, 1,
-0.1259105, 0.3055401, -0.5718268, 1, 0, 0, 1, 1,
-0.1251975, -0.03539044, -2.231579, 1, 0, 0, 1, 1,
-0.1218548, -0.7961668, -3.254766, 1, 0, 0, 1, 1,
-0.1207063, -0.1230885, -2.077402, 1, 0, 0, 1, 1,
-0.1182641, -0.8282734, -3.305621, 1, 0, 0, 1, 1,
-0.1181605, -2.275908, -4.482567, 0, 0, 0, 1, 1,
-0.1129347, -0.4140182, -1.507346, 0, 0, 0, 1, 1,
-0.1106949, -0.742537, -2.177357, 0, 0, 0, 1, 1,
-0.1085432, -1.122799, -3.399306, 0, 0, 0, 1, 1,
-0.107368, 0.4173108, -1.335688, 0, 0, 0, 1, 1,
-0.1032507, -0.2004802, -2.677852, 0, 0, 0, 1, 1,
-0.1023402, 0.434766, -0.7907485, 0, 0, 0, 1, 1,
-0.1009227, -0.6493607, -4.973279, 1, 1, 1, 1, 1,
-0.1001528, -0.6016171, -4.631835, 1, 1, 1, 1, 1,
-0.09486417, -0.1320038, -2.613262, 1, 1, 1, 1, 1,
-0.08949551, -0.9582257, -3.09907, 1, 1, 1, 1, 1,
-0.08922993, 0.7126252, -1.421717, 1, 1, 1, 1, 1,
-0.08771633, 0.5163456, -0.5969616, 1, 1, 1, 1, 1,
-0.08733469, -2.043272, -5.141305, 1, 1, 1, 1, 1,
-0.08508158, -1.823923, -4.574368, 1, 1, 1, 1, 1,
-0.08498679, -1.335988, -2.382602, 1, 1, 1, 1, 1,
-0.08405448, 0.3412839, -1.661948, 1, 1, 1, 1, 1,
-0.08259705, -1.130423, -2.451137, 1, 1, 1, 1, 1,
-0.07535004, 0.9069609, -0.6867945, 1, 1, 1, 1, 1,
-0.07020467, 0.7436247, -0.5473476, 1, 1, 1, 1, 1,
-0.06943595, 1.055787, 0.2473643, 1, 1, 1, 1, 1,
-0.06865582, 0.02638881, -0.4072821, 1, 1, 1, 1, 1,
-0.0669818, 0.775345, 0.6312358, 0, 0, 1, 1, 1,
-0.06215848, -0.2580236, -2.62724, 1, 0, 0, 1, 1,
-0.06210822, 0.03657514, -2.765788, 1, 0, 0, 1, 1,
-0.06182734, 0.5788891, -0.9080836, 1, 0, 0, 1, 1,
-0.06182338, -0.5063215, -2.515862, 1, 0, 0, 1, 1,
-0.0596722, -0.9873587, -3.993467, 1, 0, 0, 1, 1,
-0.05940609, 1.977378, -0.5797441, 0, 0, 0, 1, 1,
-0.05795207, -0.6234913, -2.550144, 0, 0, 0, 1, 1,
-0.05411273, -0.4094046, -0.5536143, 0, 0, 0, 1, 1,
-0.0484109, -0.8136304, -2.955139, 0, 0, 0, 1, 1,
-0.04567292, -0.2187042, -1.503975, 0, 0, 0, 1, 1,
-0.04430852, -1.209721, -4.00045, 0, 0, 0, 1, 1,
-0.04369293, -0.8493793, -3.291904, 0, 0, 0, 1, 1,
-0.04355501, -0.771917, -4.319376, 1, 1, 1, 1, 1,
-0.04232571, -0.8281493, -5.574031, 1, 1, 1, 1, 1,
-0.03951796, -0.7485009, -3.924994, 1, 1, 1, 1, 1,
-0.03600686, 0.8552451, -1.054309, 1, 1, 1, 1, 1,
-0.03363918, -0.1490911, -2.475044, 1, 1, 1, 1, 1,
-0.03234871, 0.252806, -0.09563373, 1, 1, 1, 1, 1,
-0.03213726, -0.6932208, -3.602889, 1, 1, 1, 1, 1,
-0.03125412, 0.7948065, -1.139428, 1, 1, 1, 1, 1,
-0.03013382, 0.5459858, -0.4595789, 1, 1, 1, 1, 1,
-0.0285096, 0.1302585, -1.799688, 1, 1, 1, 1, 1,
-0.02758141, -0.08041764, -3.143602, 1, 1, 1, 1, 1,
-0.02624248, 1.423939, 2.273615, 1, 1, 1, 1, 1,
-0.02479146, -0.774767, -2.166132, 1, 1, 1, 1, 1,
-0.0241156, -0.04703042, -1.758294, 1, 1, 1, 1, 1,
-0.018583, 0.1375211, -0.3142993, 1, 1, 1, 1, 1,
-0.015427, -1.022717, -1.265693, 0, 0, 1, 1, 1,
-0.01224689, 0.1008929, -0.02680714, 1, 0, 0, 1, 1,
-0.009145148, -0.2925326, -2.676378, 1, 0, 0, 1, 1,
-0.008377737, -0.8169057, -4.397583, 1, 0, 0, 1, 1,
-0.007745688, 1.828606, 0.1729273, 1, 0, 0, 1, 1,
-0.00400515, -1.29129, -4.038002, 1, 0, 0, 1, 1,
-0.002433793, 0.7238431, 1.845053, 0, 0, 0, 1, 1,
0.005896192, -0.9418152, 4.221531, 0, 0, 0, 1, 1,
0.006354621, -1.006, 2.372321, 0, 0, 0, 1, 1,
0.009033005, 1.60804, -1.111846, 0, 0, 0, 1, 1,
0.00954137, 0.3689388, -1.298517, 0, 0, 0, 1, 1,
0.009698209, -1.236246, 2.637377, 0, 0, 0, 1, 1,
0.01119367, -0.3567512, 1.832449, 0, 0, 0, 1, 1,
0.01200879, -1.524986, 5.175702, 1, 1, 1, 1, 1,
0.01297762, -0.7207338, 1.196304, 1, 1, 1, 1, 1,
0.01810961, 0.5351339, 1.165302, 1, 1, 1, 1, 1,
0.02190949, 0.2926982, 1.676704, 1, 1, 1, 1, 1,
0.02233294, -1.767084, 3.084823, 1, 1, 1, 1, 1,
0.02611699, -0.8779278, 2.164422, 1, 1, 1, 1, 1,
0.02781665, 0.02159002, 0.2968888, 1, 1, 1, 1, 1,
0.0279516, 0.4994835, 0.5286755, 1, 1, 1, 1, 1,
0.03129693, -0.3747323, 1.425715, 1, 1, 1, 1, 1,
0.03312895, 1.96631, 0.03188284, 1, 1, 1, 1, 1,
0.03355858, 1.492294, -0.08120549, 1, 1, 1, 1, 1,
0.03569483, 0.5586664, 1.145367, 1, 1, 1, 1, 1,
0.03821862, 0.7884859, 0.1303388, 1, 1, 1, 1, 1,
0.04006019, -0.2121103, 3.653449, 1, 1, 1, 1, 1,
0.04022193, 0.8434373, -1.62228, 1, 1, 1, 1, 1,
0.04073108, 1.060326, -1.270641, 0, 0, 1, 1, 1,
0.04416958, 1.964258, 0.1293713, 1, 0, 0, 1, 1,
0.04779499, 1.012382, -0.01073993, 1, 0, 0, 1, 1,
0.04971169, -0.6779397, 3.237223, 1, 0, 0, 1, 1,
0.05538232, 0.5567977, 0.2092757, 1, 0, 0, 1, 1,
0.05698382, -0.830609, 2.516277, 1, 0, 0, 1, 1,
0.0640617, -0.3974767, 3.682108, 0, 0, 0, 1, 1,
0.06874841, 0.07786462, 0.9801734, 0, 0, 0, 1, 1,
0.06969619, 1.657645, 1.247482, 0, 0, 0, 1, 1,
0.07321529, 2.018458, -2.941621, 0, 0, 0, 1, 1,
0.07768803, -1.512028, 3.582388, 0, 0, 0, 1, 1,
0.07890257, 0.6425763, -0.468921, 0, 0, 0, 1, 1,
0.08459693, 0.4269033, -0.5269582, 0, 0, 0, 1, 1,
0.08817895, -0.3389671, 2.342571, 1, 1, 1, 1, 1,
0.08907266, -0.2501073, 3.3635, 1, 1, 1, 1, 1,
0.09116079, 0.2783806, 0.03572924, 1, 1, 1, 1, 1,
0.09174495, -0.3885778, 2.490582, 1, 1, 1, 1, 1,
0.09582398, 1.450704, -0.7343027, 1, 1, 1, 1, 1,
0.09607673, -0.3558657, 4.380101, 1, 1, 1, 1, 1,
0.09674785, 1.020652, 0.4031968, 1, 1, 1, 1, 1,
0.09746212, -0.06841835, 1.414206, 1, 1, 1, 1, 1,
0.102212, 0.6566241, 0.4865384, 1, 1, 1, 1, 1,
0.1071856, -0.3040118, 3.010391, 1, 1, 1, 1, 1,
0.1114226, -0.9218623, 1.356242, 1, 1, 1, 1, 1,
0.1132923, 1.341962, 0.2630142, 1, 1, 1, 1, 1,
0.1147536, 0.8473482, 0.483852, 1, 1, 1, 1, 1,
0.1183656, 0.3881689, -1.614642, 1, 1, 1, 1, 1,
0.1194583, 0.7321098, 1.133584, 1, 1, 1, 1, 1,
0.1218062, -0.9281794, 2.238752, 0, 0, 1, 1, 1,
0.1306685, -0.2081481, 2.864929, 1, 0, 0, 1, 1,
0.1345674, -0.3170817, 4.033095, 1, 0, 0, 1, 1,
0.1364994, 0.7890976, 1.002452, 1, 0, 0, 1, 1,
0.1378002, 0.6136201, 0.5890972, 1, 0, 0, 1, 1,
0.13807, -1.135072, 2.111289, 1, 0, 0, 1, 1,
0.1457803, 0.2377882, 0.8728005, 0, 0, 0, 1, 1,
0.146545, 0.6743822, 0.9746563, 0, 0, 0, 1, 1,
0.1476154, -0.7598779, 3.617601, 0, 0, 0, 1, 1,
0.1485315, 1.874513, -0.2955346, 0, 0, 0, 1, 1,
0.1503268, 0.2244462, 1.091577, 0, 0, 0, 1, 1,
0.1565551, 0.6573868, -1.511037, 0, 0, 0, 1, 1,
0.1579988, 0.2889225, -0.02486518, 0, 0, 0, 1, 1,
0.1606723, -0.5038455, 3.123184, 1, 1, 1, 1, 1,
0.1632295, -1.049783, 2.10798, 1, 1, 1, 1, 1,
0.1638113, -0.6266432, 3.354767, 1, 1, 1, 1, 1,
0.1648809, 0.8065086, -0.3202652, 1, 1, 1, 1, 1,
0.1671622, 0.07189311, 2.244996, 1, 1, 1, 1, 1,
0.1711485, -0.2393198, 0.9911456, 1, 1, 1, 1, 1,
0.1712855, -0.213907, 3.623731, 1, 1, 1, 1, 1,
0.1758217, 1.060536, -1.533227, 1, 1, 1, 1, 1,
0.1778301, 0.07472511, -0.5681983, 1, 1, 1, 1, 1,
0.1825844, -0.1391717, 0.9336588, 1, 1, 1, 1, 1,
0.1842062, 1.958799, -0.5840614, 1, 1, 1, 1, 1,
0.188416, 2.513609, 1.080446, 1, 1, 1, 1, 1,
0.1915596, -0.06262486, 1.629277, 1, 1, 1, 1, 1,
0.1937586, -1.836823, 4.256844, 1, 1, 1, 1, 1,
0.1944405, -0.6591048, 3.792511, 1, 1, 1, 1, 1,
0.1984318, 0.9532996, -0.5227655, 0, 0, 1, 1, 1,
0.199333, -0.5763007, 4.330345, 1, 0, 0, 1, 1,
0.2028365, -0.7263374, 2.831387, 1, 0, 0, 1, 1,
0.203997, -0.06530228, 1.00281, 1, 0, 0, 1, 1,
0.2043714, 0.6794501, -0.3369718, 1, 0, 0, 1, 1,
0.2074384, -1.111809, 3.239381, 1, 0, 0, 1, 1,
0.2103322, 0.3807666, 3.774499, 0, 0, 0, 1, 1,
0.2130294, 0.2742774, -0.424411, 0, 0, 0, 1, 1,
0.2130605, -0.3565595, 2.481287, 0, 0, 0, 1, 1,
0.2153687, -1.174644, 2.849135, 0, 0, 0, 1, 1,
0.2165886, -0.6086059, 2.180538, 0, 0, 0, 1, 1,
0.2181153, 1.317935, -0.5048697, 0, 0, 0, 1, 1,
0.2184447, 1.238939, 0.002540405, 0, 0, 0, 1, 1,
0.2210925, 0.5675321, 1.284311, 1, 1, 1, 1, 1,
0.2211071, 0.50948, 0.6046875, 1, 1, 1, 1, 1,
0.2224624, -0.2962127, 3.597333, 1, 1, 1, 1, 1,
0.2226269, -0.5714441, 3.16586, 1, 1, 1, 1, 1,
0.2388301, 1.503047, 1.326908, 1, 1, 1, 1, 1,
0.2391585, -0.84398, 2.029566, 1, 1, 1, 1, 1,
0.2391821, 0.4333603, -1.931923, 1, 1, 1, 1, 1,
0.242627, -0.1304186, 3.665679, 1, 1, 1, 1, 1,
0.2438234, 1.192163, 0.6600433, 1, 1, 1, 1, 1,
0.2447575, 1.219317, -0.82171, 1, 1, 1, 1, 1,
0.2460181, 0.9689421, -0.9828759, 1, 1, 1, 1, 1,
0.2502783, -0.7758388, 4.041133, 1, 1, 1, 1, 1,
0.2560715, 0.9979351, 1.105084, 1, 1, 1, 1, 1,
0.2583677, -0.2472664, 3.516666, 1, 1, 1, 1, 1,
0.2590783, 0.9242963, 1.084572, 1, 1, 1, 1, 1,
0.2607448, 0.05348435, 3.176311, 0, 0, 1, 1, 1,
0.2607964, 0.07096345, 0.3995304, 1, 0, 0, 1, 1,
0.2671222, -0.2866964, 2.082482, 1, 0, 0, 1, 1,
0.2693531, -0.9394817, 3.44244, 1, 0, 0, 1, 1,
0.2693966, -1.531386, 1.927607, 1, 0, 0, 1, 1,
0.2741216, 1.157687, -0.1371287, 1, 0, 0, 1, 1,
0.2758728, 1.298123, 0.1762823, 0, 0, 0, 1, 1,
0.276628, 1.223555, -0.4114407, 0, 0, 0, 1, 1,
0.2791936, 1.18364, -0.8040182, 0, 0, 0, 1, 1,
0.2795026, 0.1325177, 0.5116062, 0, 0, 0, 1, 1,
0.2861358, 0.6524522, 0.3316642, 0, 0, 0, 1, 1,
0.2918507, 0.7441926, -0.2644181, 0, 0, 0, 1, 1,
0.2939262, -0.003416575, 0.6768371, 0, 0, 0, 1, 1,
0.295842, 1.23575, 0.9600796, 1, 1, 1, 1, 1,
0.2996599, 1.230454, 0.8095786, 1, 1, 1, 1, 1,
0.3012455, 0.7731317, 0.3234155, 1, 1, 1, 1, 1,
0.3046279, 0.550651, 0.2879945, 1, 1, 1, 1, 1,
0.3085376, -0.338172, 2.275951, 1, 1, 1, 1, 1,
0.3085392, 0.4261026, -0.576454, 1, 1, 1, 1, 1,
0.3085476, 1.069076, 1.132853, 1, 1, 1, 1, 1,
0.310663, -0.1248205, 2.46968, 1, 1, 1, 1, 1,
0.3135186, 0.403448, -2.046595, 1, 1, 1, 1, 1,
0.3144607, -1.505899, 2.802739, 1, 1, 1, 1, 1,
0.3157157, 2.208034, 0.5715282, 1, 1, 1, 1, 1,
0.3227936, 0.5145956, 0.8795042, 1, 1, 1, 1, 1,
0.3276154, -1.233279, 1.602924, 1, 1, 1, 1, 1,
0.3282604, 0.7669409, -0.4060808, 1, 1, 1, 1, 1,
0.3312996, 0.3051608, 1.348662, 1, 1, 1, 1, 1,
0.3327664, -1.672691, 3.504798, 0, 0, 1, 1, 1,
0.3328111, -0.7744986, 2.718353, 1, 0, 0, 1, 1,
0.3335758, -0.2204883, 2.229678, 1, 0, 0, 1, 1,
0.3368167, -0.9564727, 3.578277, 1, 0, 0, 1, 1,
0.3398507, 1.237936, -0.09979191, 1, 0, 0, 1, 1,
0.3448492, -0.3977838, 2.363271, 1, 0, 0, 1, 1,
0.3466984, 0.2877196, 0.4943031, 0, 0, 0, 1, 1,
0.3481542, -1.225876, 1.990259, 0, 0, 0, 1, 1,
0.3539114, 0.3316275, 0.5588304, 0, 0, 0, 1, 1,
0.3539799, -0.5091524, 1.516037, 0, 0, 0, 1, 1,
0.3548059, -0.3453662, 3.517751, 0, 0, 0, 1, 1,
0.3587939, -1.740108, 2.725385, 0, 0, 0, 1, 1,
0.3614607, -0.3814711, 2.068132, 0, 0, 0, 1, 1,
0.3729333, 0.2513793, -0.05008819, 1, 1, 1, 1, 1,
0.3735269, -1.490318, 2.045877, 1, 1, 1, 1, 1,
0.3789924, -0.01490197, 1.646612, 1, 1, 1, 1, 1,
0.3823688, -1.509073, 1.827145, 1, 1, 1, 1, 1,
0.3823702, 0.3574061, 2.128658, 1, 1, 1, 1, 1,
0.3837048, 0.1917379, 2.283797, 1, 1, 1, 1, 1,
0.3855963, -2.154272, 2.622266, 1, 1, 1, 1, 1,
0.3955232, -0.6417841, 2.284347, 1, 1, 1, 1, 1,
0.3984185, -0.6423339, 2.384326, 1, 1, 1, 1, 1,
0.4039509, 1.020397, 1.750634, 1, 1, 1, 1, 1,
0.4059835, -0.7551989, 1.020063, 1, 1, 1, 1, 1,
0.4106271, 0.90485, -0.06590591, 1, 1, 1, 1, 1,
0.4111179, -0.5598673, 2.657268, 1, 1, 1, 1, 1,
0.4129506, 0.9902977, 0.4224743, 1, 1, 1, 1, 1,
0.4136918, 0.1264051, 0.8822049, 1, 1, 1, 1, 1,
0.4181257, -0.2740486, 2.821258, 0, 0, 1, 1, 1,
0.4205336, -1.382028, 3.318077, 1, 0, 0, 1, 1,
0.4206948, -0.6743794, 2.169981, 1, 0, 0, 1, 1,
0.4236154, 1.757017, 0.9141694, 1, 0, 0, 1, 1,
0.424807, 1.37096, -0.02979531, 1, 0, 0, 1, 1,
0.4261074, 0.2049105, 1.969984, 1, 0, 0, 1, 1,
0.4284783, -0.8184922, 2.122296, 0, 0, 0, 1, 1,
0.42947, 0.1273952, 0.488685, 0, 0, 0, 1, 1,
0.4302949, 0.6482005, -0.3146994, 0, 0, 0, 1, 1,
0.4312935, -0.9882812, 2.939262, 0, 0, 0, 1, 1,
0.4320618, -2.078796, 3.660754, 0, 0, 0, 1, 1,
0.4346348, 0.3078951, 1.194496, 0, 0, 0, 1, 1,
0.4481363, 1.043313, 0.5208102, 0, 0, 0, 1, 1,
0.4493723, 1.084291, 1.061104, 1, 1, 1, 1, 1,
0.4506631, -0.2405713, -0.1464489, 1, 1, 1, 1, 1,
0.4525259, 0.1827261, 0.5156407, 1, 1, 1, 1, 1,
0.4566584, 0.07371416, 0.4315479, 1, 1, 1, 1, 1,
0.4577709, 0.08004656, 0.1978992, 1, 1, 1, 1, 1,
0.4610961, -0.9224668, 3.132083, 1, 1, 1, 1, 1,
0.4614858, 0.5712355, -0.4490896, 1, 1, 1, 1, 1,
0.461625, -0.4775712, 3.483418, 1, 1, 1, 1, 1,
0.4641056, 2.21823, -0.5035436, 1, 1, 1, 1, 1,
0.4642258, 2.04305, -0.7381703, 1, 1, 1, 1, 1,
0.4691805, -0.2928834, 2.117139, 1, 1, 1, 1, 1,
0.4762237, 0.4416223, -0.04414754, 1, 1, 1, 1, 1,
0.4829113, 0.45618, 0.7908031, 1, 1, 1, 1, 1,
0.4848285, -0.1787952, 2.856341, 1, 1, 1, 1, 1,
0.4906291, 1.554463, 0.5095546, 1, 1, 1, 1, 1,
0.491506, -1.074458, 3.738614, 0, 0, 1, 1, 1,
0.4924631, -2.080987, 3.109061, 1, 0, 0, 1, 1,
0.4934268, -0.5004501, 2.755086, 1, 0, 0, 1, 1,
0.4957558, 0.5269923, 0.4847351, 1, 0, 0, 1, 1,
0.4970231, -0.6170993, 4.037017, 1, 0, 0, 1, 1,
0.4989828, -1.004509, 3.0005, 1, 0, 0, 1, 1,
0.5014099, -0.8265164, 1.503473, 0, 0, 0, 1, 1,
0.5027696, 1.459352, -2.22474, 0, 0, 0, 1, 1,
0.5033666, 0.1932647, 2.685215, 0, 0, 0, 1, 1,
0.5069536, -1.021983, 3.180646, 0, 0, 0, 1, 1,
0.5082555, 0.4346105, 1.263597, 0, 0, 0, 1, 1,
0.5113032, 1.11527, -1.36798, 0, 0, 0, 1, 1,
0.5300752, -1.34974, 4.294662, 0, 0, 0, 1, 1,
0.5301372, -1.093646, 2.343398, 1, 1, 1, 1, 1,
0.5313105, 2.378983, 1.731726, 1, 1, 1, 1, 1,
0.531351, -0.2426961, 1.104136, 1, 1, 1, 1, 1,
0.5373135, 1.702946, 1.227021, 1, 1, 1, 1, 1,
0.5400938, 0.3749418, -0.3472394, 1, 1, 1, 1, 1,
0.5419856, -1.285147, 2.849359, 1, 1, 1, 1, 1,
0.5440049, -0.6383952, 1.020799, 1, 1, 1, 1, 1,
0.5522789, 0.8698652, -0.4084908, 1, 1, 1, 1, 1,
0.5579381, 0.7433518, 1.738299, 1, 1, 1, 1, 1,
0.5614651, 2.964409, 0.3773106, 1, 1, 1, 1, 1,
0.5622435, -2.254344, 3.255702, 1, 1, 1, 1, 1,
0.5632583, -0.3404395, 3.420456, 1, 1, 1, 1, 1,
0.5654925, -0.6830108, 1.792306, 1, 1, 1, 1, 1,
0.5678979, 0.2455485, 0.6119862, 1, 1, 1, 1, 1,
0.5680791, 0.6821727, 1.361451, 1, 1, 1, 1, 1,
0.578512, -0.7424919, 3.600078, 0, 0, 1, 1, 1,
0.5785493, 0.6471881, 1.010483, 1, 0, 0, 1, 1,
0.5805965, 0.3689486, 2.397661, 1, 0, 0, 1, 1,
0.5812511, 0.3297597, 1.113843, 1, 0, 0, 1, 1,
0.5815755, -0.2756927, 1.914494, 1, 0, 0, 1, 1,
0.5995933, 0.1515288, -0.5938557, 1, 0, 0, 1, 1,
0.609557, 0.7325438, 1.558717, 0, 0, 0, 1, 1,
0.614288, -0.3463275, 3.135962, 0, 0, 0, 1, 1,
0.6215796, -0.1150749, 2.51447, 0, 0, 0, 1, 1,
0.6217315, -1.239474, 2.570981, 0, 0, 0, 1, 1,
0.6247416, -0.3893058, 2.133884, 0, 0, 0, 1, 1,
0.6276624, 0.5454428, 2.015783, 0, 0, 0, 1, 1,
0.6281188, -0.5105198, 3.222074, 0, 0, 0, 1, 1,
0.6417359, -1.805509, 3.252723, 1, 1, 1, 1, 1,
0.6455767, 1.521332, 0.4831471, 1, 1, 1, 1, 1,
0.6550248, 0.4378975, 0.1830297, 1, 1, 1, 1, 1,
0.6647945, 1.544665, -0.09209776, 1, 1, 1, 1, 1,
0.6660801, 0.1937597, 0.7069049, 1, 1, 1, 1, 1,
0.6679806, -1.14276, 4.081394, 1, 1, 1, 1, 1,
0.673029, 1.185999, 1.721845, 1, 1, 1, 1, 1,
0.6740358, 0.7982766, 1.289916, 1, 1, 1, 1, 1,
0.6740409, 0.136915, 1.470646, 1, 1, 1, 1, 1,
0.6758656, 0.7432003, 0.6455761, 1, 1, 1, 1, 1,
0.6838824, -0.8131344, 2.593309, 1, 1, 1, 1, 1,
0.6862502, -0.5734471, 1.988994, 1, 1, 1, 1, 1,
0.6889349, 0.2346557, 2.053317, 1, 1, 1, 1, 1,
0.691034, -0.4951869, 2.994696, 1, 1, 1, 1, 1,
0.6916938, 0.0287973, -0.7978985, 1, 1, 1, 1, 1,
0.6985585, -0.02281672, 0.3726108, 0, 0, 1, 1, 1,
0.7000667, 0.3639511, 0.6961943, 1, 0, 0, 1, 1,
0.7038978, 0.151321, 1.138916, 1, 0, 0, 1, 1,
0.7059069, 1.397372, -0.436697, 1, 0, 0, 1, 1,
0.7092861, -1.729467, 3.130236, 1, 0, 0, 1, 1,
0.711147, 0.8747429, 2.418503, 1, 0, 0, 1, 1,
0.7119715, 1.108507, 0.0180096, 0, 0, 0, 1, 1,
0.7135684, -0.9748467, 2.992981, 0, 0, 0, 1, 1,
0.7156124, -0.132874, 2.299486, 0, 0, 0, 1, 1,
0.717211, -1.717038, 1.805424, 0, 0, 0, 1, 1,
0.7204654, -0.5314005, 2.595968, 0, 0, 0, 1, 1,
0.7272709, -0.0363725, 0.4417352, 0, 0, 0, 1, 1,
0.7276888, -0.2876641, 3.529035, 0, 0, 0, 1, 1,
0.7364835, -0.8490514, 1.037921, 1, 1, 1, 1, 1,
0.7397807, 0.1639074, 2.657228, 1, 1, 1, 1, 1,
0.7500417, -0.9801111, 2.266457, 1, 1, 1, 1, 1,
0.7536231, 1.947142, 0.7130882, 1, 1, 1, 1, 1,
0.7551818, 0.254575, 0.3020583, 1, 1, 1, 1, 1,
0.7562408, -0.973394, 4.299312, 1, 1, 1, 1, 1,
0.7631378, 0.521692, 0.5718514, 1, 1, 1, 1, 1,
0.7641448, 1.101956, -1.30055, 1, 1, 1, 1, 1,
0.7666215, -0.1942424, 0.8522953, 1, 1, 1, 1, 1,
0.7722945, -0.527437, 2.149591, 1, 1, 1, 1, 1,
0.7811832, 0.9172048, 0.5369946, 1, 1, 1, 1, 1,
0.7847905, -0.6975476, 2.974667, 1, 1, 1, 1, 1,
0.7920458, 0.07441571, 1.910345, 1, 1, 1, 1, 1,
0.7944855, 0.3321272, 0.4729728, 1, 1, 1, 1, 1,
0.8045645, -0.01850555, 1.658184, 1, 1, 1, 1, 1,
0.8048261, 0.3520936, 1.205387, 0, 0, 1, 1, 1,
0.8059016, 1.175292, 1.230626, 1, 0, 0, 1, 1,
0.8081837, 1.113283, 1.577714, 1, 0, 0, 1, 1,
0.8142476, -0.829868, 2.230695, 1, 0, 0, 1, 1,
0.8173656, 0.4623671, -1.388562, 1, 0, 0, 1, 1,
0.8182735, 1.296944, 0.2943288, 1, 0, 0, 1, 1,
0.8202518, -0.5972944, 2.327731, 0, 0, 0, 1, 1,
0.8215653, -0.620686, 1.898699, 0, 0, 0, 1, 1,
0.8234934, -0.6457986, 2.261112, 0, 0, 0, 1, 1,
0.8287126, -0.516252, 1.949626, 0, 0, 0, 1, 1,
0.8466101, 0.0827625, 0.8808732, 0, 0, 0, 1, 1,
0.8533212, 2.192802, 1.407996, 0, 0, 0, 1, 1,
0.8556894, 0.9825992, 1.3866, 0, 0, 0, 1, 1,
0.8594639, -2.5389, 1.241716, 1, 1, 1, 1, 1,
0.860797, 0.6786425, -0.7089901, 1, 1, 1, 1, 1,
0.8785589, -0.9367241, 2.887025, 1, 1, 1, 1, 1,
0.8789586, -1.685381, 2.115669, 1, 1, 1, 1, 1,
0.8793879, -0.7441669, 3.400015, 1, 1, 1, 1, 1,
0.8803352, 0.9367249, 0.438286, 1, 1, 1, 1, 1,
0.8928083, 0.2768844, 0.9378958, 1, 1, 1, 1, 1,
0.8928123, -0.1035927, 2.676724, 1, 1, 1, 1, 1,
0.8934334, 1.513784, -0.6288708, 1, 1, 1, 1, 1,
0.895261, 0.4301701, -0.08244643, 1, 1, 1, 1, 1,
0.8953082, 0.2289722, 2.15956, 1, 1, 1, 1, 1,
0.8982115, 0.9617298, 1.405539, 1, 1, 1, 1, 1,
0.9014819, -0.3243104, 2.594469, 1, 1, 1, 1, 1,
0.9074873, -2.053163, 4.015562, 1, 1, 1, 1, 1,
0.9141204, -0.2792667, 1.307312, 1, 1, 1, 1, 1,
0.9144855, -1.268871, 4.282302, 0, 0, 1, 1, 1,
0.9210383, -0.3498265, 0.7898104, 1, 0, 0, 1, 1,
0.9250547, 0.2416087, -0.4649504, 1, 0, 0, 1, 1,
0.9255552, 2.480952, 1.127018, 1, 0, 0, 1, 1,
0.9288213, -0.1138823, 1.420242, 1, 0, 0, 1, 1,
0.932911, 0.8022377, -0.3258252, 1, 0, 0, 1, 1,
0.933854, -0.7166454, -0.3974512, 0, 0, 0, 1, 1,
0.9421564, 0.9057298, 2.293164, 0, 0, 0, 1, 1,
0.9426241, -1.843866, 1.023973, 0, 0, 0, 1, 1,
0.9474013, 0.3549263, 2.679704, 0, 0, 0, 1, 1,
0.9661599, 0.04708411, 2.261795, 0, 0, 0, 1, 1,
0.9809102, 1.008151, 0.9673993, 0, 0, 0, 1, 1,
0.9913768, -1.632888, 1.808316, 0, 0, 0, 1, 1,
0.9927257, -1.084682, 3.688156, 1, 1, 1, 1, 1,
0.9990647, 0.6973656, 0.498881, 1, 1, 1, 1, 1,
0.9997991, 0.08580883, 2.529019, 1, 1, 1, 1, 1,
1.007061, 0.419271, 1.070696, 1, 1, 1, 1, 1,
1.007339, -1.037449, 0.2840689, 1, 1, 1, 1, 1,
1.018737, -1.24629, 1.531172, 1, 1, 1, 1, 1,
1.022383, -1.766627, 3.311481, 1, 1, 1, 1, 1,
1.026893, -0.7344794, 1.899763, 1, 1, 1, 1, 1,
1.038295, 1.700302, 0.0647954, 1, 1, 1, 1, 1,
1.04206, 0.4030123, 1.271555, 1, 1, 1, 1, 1,
1.04342, 0.6180602, 2.05243, 1, 1, 1, 1, 1,
1.047796, -0.981432, 3.478176, 1, 1, 1, 1, 1,
1.053582, -0.04013748, 1.424401, 1, 1, 1, 1, 1,
1.060156, 1.057079, 0.679996, 1, 1, 1, 1, 1,
1.060816, 1.253602, -0.2166027, 1, 1, 1, 1, 1,
1.062321, -0.8815802, 1.551846, 0, 0, 1, 1, 1,
1.062498, -0.7781199, 0.3552759, 1, 0, 0, 1, 1,
1.063218, -0.5088685, 2.148542, 1, 0, 0, 1, 1,
1.06369, 0.5967736, 1.300407, 1, 0, 0, 1, 1,
1.069455, -0.3193211, 2.141902, 1, 0, 0, 1, 1,
1.071435, 0.05405192, 2.17885, 1, 0, 0, 1, 1,
1.087135, -0.2129092, 2.14612, 0, 0, 0, 1, 1,
1.089563, -0.09050543, 1.997834, 0, 0, 0, 1, 1,
1.094144, -0.3176898, 0.6291273, 0, 0, 0, 1, 1,
1.094608, -0.9717416, 3.865214, 0, 0, 0, 1, 1,
1.096208, -0.2553542, 2.668997, 0, 0, 0, 1, 1,
1.101509, -0.3164496, 1.568442, 0, 0, 0, 1, 1,
1.10872, 0.09838291, 1.264649, 0, 0, 0, 1, 1,
1.112064, 1.035577, 1.79128, 1, 1, 1, 1, 1,
1.116993, -1.751118, 3.327314, 1, 1, 1, 1, 1,
1.120254, -0.3503648, 2.42454, 1, 1, 1, 1, 1,
1.124342, 0.4307107, 0.429375, 1, 1, 1, 1, 1,
1.126721, -0.4072388, 2.456563, 1, 1, 1, 1, 1,
1.128174, 1.726043, 1.995247, 1, 1, 1, 1, 1,
1.128987, -0.120681, 2.67908, 1, 1, 1, 1, 1,
1.135046, -0.05039761, 1.94103, 1, 1, 1, 1, 1,
1.143182, -0.4137861, 0.9432673, 1, 1, 1, 1, 1,
1.144567, 0.3544809, 1.708322, 1, 1, 1, 1, 1,
1.146484, 0.8028826, 0.534492, 1, 1, 1, 1, 1,
1.147082, -0.5703998, 2.944297, 1, 1, 1, 1, 1,
1.147656, -1.821384, 4.97858, 1, 1, 1, 1, 1,
1.150941, 1.187463, 1.678775, 1, 1, 1, 1, 1,
1.157363, 1.733509, 1.056464, 1, 1, 1, 1, 1,
1.16337, -0.5323509, 1.311207, 0, 0, 1, 1, 1,
1.169512, 1.676039, -0.321924, 1, 0, 0, 1, 1,
1.171438, -0.0160496, 1.99564, 1, 0, 0, 1, 1,
1.175135, -0.9966435, 1.523408, 1, 0, 0, 1, 1,
1.176104, 0.4969274, 1.938983, 1, 0, 0, 1, 1,
1.177521, 1.303869, 1.430233, 1, 0, 0, 1, 1,
1.177967, 3.462712, 0.1889337, 0, 0, 0, 1, 1,
1.179716, -1.566343, 2.372342, 0, 0, 0, 1, 1,
1.182837, 0.5101803, 2.890553, 0, 0, 0, 1, 1,
1.209496, -0.2393623, -0.0467272, 0, 0, 0, 1, 1,
1.212546, -1.784994, 2.445457, 0, 0, 0, 1, 1,
1.216579, -1.348435, 1.970202, 0, 0, 0, 1, 1,
1.217276, 0.1345241, 0.8770001, 0, 0, 0, 1, 1,
1.22047, -0.7127137, 1.656958, 1, 1, 1, 1, 1,
1.22051, -0.2584525, 0.2053817, 1, 1, 1, 1, 1,
1.221983, -0.9819757, 3.35603, 1, 1, 1, 1, 1,
1.223252, -1.65071, 2.8424, 1, 1, 1, 1, 1,
1.223909, -1.786288, 3.608776, 1, 1, 1, 1, 1,
1.227583, -0.09136789, 0.08013408, 1, 1, 1, 1, 1,
1.228791, 1.273461, 0.8375635, 1, 1, 1, 1, 1,
1.232303, -0.7917392, 2.187276, 1, 1, 1, 1, 1,
1.238217, 0.05172399, 1.270248, 1, 1, 1, 1, 1,
1.240173, 0.234663, 2.859841, 1, 1, 1, 1, 1,
1.244827, 0.721241, 0.831239, 1, 1, 1, 1, 1,
1.246688, 1.444625, 1.375466, 1, 1, 1, 1, 1,
1.249926, -0.1893611, 1.704457, 1, 1, 1, 1, 1,
1.257659, 0.9867423, 0.8847294, 1, 1, 1, 1, 1,
1.265686, -1.04937, 4.699162, 1, 1, 1, 1, 1,
1.266706, -0.8391534, 3.536326, 0, 0, 1, 1, 1,
1.268447, 1.379106, 0.7971942, 1, 0, 0, 1, 1,
1.278582, -0.3212069, 2.78261, 1, 0, 0, 1, 1,
1.281048, 0.1913387, 1.587624, 1, 0, 0, 1, 1,
1.283621, -0.3404136, 2.244612, 1, 0, 0, 1, 1,
1.288151, -0.5138158, 0.7371849, 1, 0, 0, 1, 1,
1.290053, 1.58483, 0.318609, 0, 0, 0, 1, 1,
1.293307, -1.047382, -0.2281851, 0, 0, 0, 1, 1,
1.310015, 0.1511107, 1.353756, 0, 0, 0, 1, 1,
1.313744, 0.2475988, 1.921395, 0, 0, 0, 1, 1,
1.32694, 0.7237976, 1.282677, 0, 0, 0, 1, 1,
1.328014, -0.523614, 1.28695, 0, 0, 0, 1, 1,
1.339562, 0.4429457, -0.3322571, 0, 0, 0, 1, 1,
1.341807, 0.1775699, 2.270872, 1, 1, 1, 1, 1,
1.345158, 0.4106152, 0.7401702, 1, 1, 1, 1, 1,
1.347202, -0.5162963, 3.241238, 1, 1, 1, 1, 1,
1.352231, -1.049309, 1.654802, 1, 1, 1, 1, 1,
1.354843, 0.3443365, 0.306076, 1, 1, 1, 1, 1,
1.359837, -0.532212, 2.90034, 1, 1, 1, 1, 1,
1.3619, -0.1876072, 2.973238, 1, 1, 1, 1, 1,
1.36554, 1.725917, 1.430109, 1, 1, 1, 1, 1,
1.36703, -2.623467, 3.105821, 1, 1, 1, 1, 1,
1.383579, -0.07771672, 1.675015, 1, 1, 1, 1, 1,
1.388969, 0.8952608, 0.403076, 1, 1, 1, 1, 1,
1.390443, -0.3925875, 3.191169, 1, 1, 1, 1, 1,
1.390503, -0.666616, 2.395942, 1, 1, 1, 1, 1,
1.394523, 0.5846916, 1.079265, 1, 1, 1, 1, 1,
1.394751, -0.7568196, 2.149744, 1, 1, 1, 1, 1,
1.399929, -0.8023118, 1.431832, 0, 0, 1, 1, 1,
1.4076, -0.3776847, 1.927656, 1, 0, 0, 1, 1,
1.407956, -0.4429466, 2.565682, 1, 0, 0, 1, 1,
1.414878, -0.9424149, 0.1142137, 1, 0, 0, 1, 1,
1.419432, -0.107801, -1.100378, 1, 0, 0, 1, 1,
1.420857, -1.203465, 2.532553, 1, 0, 0, 1, 1,
1.432887, -2.793062, 1.593401, 0, 0, 0, 1, 1,
1.433501, 0.09562682, 0.1489022, 0, 0, 0, 1, 1,
1.447298, -0.9070513, 2.987372, 0, 0, 0, 1, 1,
1.452032, -0.882723, 3.253453, 0, 0, 0, 1, 1,
1.454037, 0.978632, 1.039601, 0, 0, 0, 1, 1,
1.4545, -0.192591, 1.737487, 0, 0, 0, 1, 1,
1.456698, 0.7171736, 0.1183553, 0, 0, 0, 1, 1,
1.45985, 1.485316, 2.275698, 1, 1, 1, 1, 1,
1.481068, 0.2419268, 1.763801, 1, 1, 1, 1, 1,
1.483902, 0.05838005, 0.9390707, 1, 1, 1, 1, 1,
1.497309, -0.9482711, 2.736532, 1, 1, 1, 1, 1,
1.498854, -0.07550804, 3.222266, 1, 1, 1, 1, 1,
1.502869, -0.6763716, 1.754068, 1, 1, 1, 1, 1,
1.502905, 0.2054723, 1.999605, 1, 1, 1, 1, 1,
1.5044, 0.07981603, 0.7278216, 1, 1, 1, 1, 1,
1.510113, 1.37153, -0.3874127, 1, 1, 1, 1, 1,
1.536517, 1.857614, 1.018159, 1, 1, 1, 1, 1,
1.542851, 0.4055506, 0.9387683, 1, 1, 1, 1, 1,
1.54662, -1.144571, 1.119491, 1, 1, 1, 1, 1,
1.557312, 1.28033, 1.959109, 1, 1, 1, 1, 1,
1.58636, 0.7557838, 2.32414, 1, 1, 1, 1, 1,
1.589723, 0.17931, 0.7753689, 1, 1, 1, 1, 1,
1.59296, -0.5283162, -1.777479, 0, 0, 1, 1, 1,
1.603883, -0.4703625, 0.7146946, 1, 0, 0, 1, 1,
1.614215, 1.054189, 1.190428, 1, 0, 0, 1, 1,
1.628768, -0.2546678, 0.4134644, 1, 0, 0, 1, 1,
1.669415, 1.068792, -0.5092722, 1, 0, 0, 1, 1,
1.669562, -0.2059126, 2.054212, 1, 0, 0, 1, 1,
1.723136, 0.3946558, 2.241169, 0, 0, 0, 1, 1,
1.73469, -1.334376, 1.274458, 0, 0, 0, 1, 1,
1.744208, 1.502635, 1.81704, 0, 0, 0, 1, 1,
1.746083, 0.8039805, 1.576768, 0, 0, 0, 1, 1,
1.778179, -1.247129, 3.886097, 0, 0, 0, 1, 1,
1.780667, 0.8678167, 1.46541, 0, 0, 0, 1, 1,
1.788518, -0.2934652, 1.581465, 0, 0, 0, 1, 1,
1.822988, -0.2599735, 0.668369, 1, 1, 1, 1, 1,
1.828295, -1.001176, 1.218253, 1, 1, 1, 1, 1,
1.835014, 0.2581665, 2.331816, 1, 1, 1, 1, 1,
1.875073, 0.2906555, 1.341974, 1, 1, 1, 1, 1,
1.889385, -0.0124391, 3.0485, 1, 1, 1, 1, 1,
1.895889, -0.08702644, 0.7970032, 1, 1, 1, 1, 1,
1.906666, -2.923628, 1.94257, 1, 1, 1, 1, 1,
1.91415, 1.0802, 2.125516, 1, 1, 1, 1, 1,
1.917082, -0.1983783, 2.520855, 1, 1, 1, 1, 1,
1.94355, 0.29114, 0.8959593, 1, 1, 1, 1, 1,
1.949332, -1.42708, 0.6067886, 1, 1, 1, 1, 1,
1.950121, -1.900818, 1.249666, 1, 1, 1, 1, 1,
1.970903, 1.287162, -1.279835, 1, 1, 1, 1, 1,
1.974979, -0.5490449, 2.192092, 1, 1, 1, 1, 1,
2.00398, -0.8677555, 2.480179, 1, 1, 1, 1, 1,
2.040579, 0.7323684, -0.5476809, 0, 0, 1, 1, 1,
2.046962, -0.225682, 2.551832, 1, 0, 0, 1, 1,
2.101068, 0.4944784, 2.653333, 1, 0, 0, 1, 1,
2.130688, -2.171031, 1.928647, 1, 0, 0, 1, 1,
2.194906, -0.05017202, 0.9644651, 1, 0, 0, 1, 1,
2.203722, -0.6754102, 1.195172, 1, 0, 0, 1, 1,
2.205844, -0.9459662, 1.260456, 0, 0, 0, 1, 1,
2.221302, -1.172962, 2.399987, 0, 0, 0, 1, 1,
2.246911, -0.703435, 1.5054, 0, 0, 0, 1, 1,
2.373711, 0.4705374, 1.68202, 0, 0, 0, 1, 1,
2.397351, -1.354046, 2.353914, 0, 0, 0, 1, 1,
2.428652, 0.7473629, 2.133703, 0, 0, 0, 1, 1,
2.46949, 0.8036105, -0.5082114, 0, 0, 0, 1, 1,
2.48986, 1.887517, 1.566467, 1, 1, 1, 1, 1,
2.493003, -1.983568, 1.274669, 1, 1, 1, 1, 1,
2.506568, -0.9425371, 1.769191, 1, 1, 1, 1, 1,
2.612945, 1.560863, 0.586753, 1, 1, 1, 1, 1,
2.88207, 0.3375423, 1.481354, 1, 1, 1, 1, 1,
3.114962, 0.494972, 0.5843825, 1, 1, 1, 1, 1,
3.253796, 0.9626483, 0.7808497, 1, 1, 1, 1, 1
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
var radius = 9.546553;
var distance = 33.53186;
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
mvMatrix.translate( -0.1188273, -0.269542, 0.1991646 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.53186);
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
