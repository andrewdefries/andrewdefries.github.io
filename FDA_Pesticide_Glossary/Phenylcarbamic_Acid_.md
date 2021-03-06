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
-3.12645, 0.4664845, -1.989959, 1, 0, 0, 1,
-2.963062, 0.3811736, -2.043912, 1, 0.007843138, 0, 1,
-2.94506, -0.4301201, -2.296346, 1, 0.01176471, 0, 1,
-2.736645, -2.621153, -1.438354, 1, 0.01960784, 0, 1,
-2.695371, -1.163597, -1.507945, 1, 0.02352941, 0, 1,
-2.660822, -1.105357, -1.51738, 1, 0.03137255, 0, 1,
-2.603479, -0.9744919, -1.931953, 1, 0.03529412, 0, 1,
-2.592503, 1.234916, -2.264565, 1, 0.04313726, 0, 1,
-2.364255, 0.7146245, -2.206971, 1, 0.04705882, 0, 1,
-2.348515, 0.01719868, -1.171012, 1, 0.05490196, 0, 1,
-2.343045, -0.3960777, -2.538754, 1, 0.05882353, 0, 1,
-2.334196, -1.43541, -1.810383, 1, 0.06666667, 0, 1,
-2.326973, -1.37924, -3.092068, 1, 0.07058824, 0, 1,
-2.315327, 0.5155734, -1.738793, 1, 0.07843138, 0, 1,
-2.300122, 0.919166, -0.04082296, 1, 0.08235294, 0, 1,
-2.204716, 0.5303637, -1.381354, 1, 0.09019608, 0, 1,
-2.196487, -1.921349, -1.643607, 1, 0.09411765, 0, 1,
-2.144683, 0.8991864, -1.422362, 1, 0.1019608, 0, 1,
-2.122416, -0.06069882, -1.073206, 1, 0.1098039, 0, 1,
-2.116204, 1.767806, -1.870216, 1, 0.1137255, 0, 1,
-2.079446, -1.330236, -2.563237, 1, 0.1215686, 0, 1,
-2.068499, -1.194769, -1.952509, 1, 0.1254902, 0, 1,
-2.045802, 0.4762318, -0.7725883, 1, 0.1333333, 0, 1,
-2.027489, -1.608281, -3.268096, 1, 0.1372549, 0, 1,
-2.007783, -0.4147299, -1.832267, 1, 0.145098, 0, 1,
-1.99305, 0.3466309, -0.4845038, 1, 0.1490196, 0, 1,
-1.933105, 0.08599728, -2.387327, 1, 0.1568628, 0, 1,
-1.930958, -1.995937, -1.766454, 1, 0.1607843, 0, 1,
-1.923235, -0.9794399, -2.761402, 1, 0.1686275, 0, 1,
-1.920215, 0.004441146, -1.122736, 1, 0.172549, 0, 1,
-1.906464, 0.4395287, -2.261156, 1, 0.1803922, 0, 1,
-1.898288, 0.8869802, -1.789833, 1, 0.1843137, 0, 1,
-1.872409, 1.107108, -0.4025312, 1, 0.1921569, 0, 1,
-1.863474, 1.195414, -0.4744985, 1, 0.1960784, 0, 1,
-1.853898, -0.1606998, -2.479675, 1, 0.2039216, 0, 1,
-1.848783, 0.2640815, -2.25858, 1, 0.2117647, 0, 1,
-1.824182, 0.9389675, -2.129458, 1, 0.2156863, 0, 1,
-1.786273, 2.621166, -0.9859949, 1, 0.2235294, 0, 1,
-1.786142, 0.2443172, -2.938239, 1, 0.227451, 0, 1,
-1.777887, -0.4294035, -1.358703, 1, 0.2352941, 0, 1,
-1.775341, 1.328516, -0.3385732, 1, 0.2392157, 0, 1,
-1.769968, -1.57967, -2.18135, 1, 0.2470588, 0, 1,
-1.765784, -1.947707, 0.4454099, 1, 0.2509804, 0, 1,
-1.764565, 1.720565, -0.3284724, 1, 0.2588235, 0, 1,
-1.764021, -0.02240828, -1.268202, 1, 0.2627451, 0, 1,
-1.760287, 1.858599, -1.174295, 1, 0.2705882, 0, 1,
-1.750477, -0.3253312, -2.59018, 1, 0.2745098, 0, 1,
-1.742627, 0.34628, -2.460212, 1, 0.282353, 0, 1,
-1.737667, -1.541891, -2.202906, 1, 0.2862745, 0, 1,
-1.735063, 0.8223834, -1.004064, 1, 0.2941177, 0, 1,
-1.707916, -0.08154926, -0.9326853, 1, 0.3019608, 0, 1,
-1.701741, -1.977038, -1.875622, 1, 0.3058824, 0, 1,
-1.688045, 0.3711986, -1.090695, 1, 0.3137255, 0, 1,
-1.686209, -1.294101, -0.6140217, 1, 0.3176471, 0, 1,
-1.684565, -0.7888576, -1.409097, 1, 0.3254902, 0, 1,
-1.681413, 1.426621, -2.867684, 1, 0.3294118, 0, 1,
-1.678824, -1.011761, -1.709232, 1, 0.3372549, 0, 1,
-1.666856, 0.8247088, -1.086796, 1, 0.3411765, 0, 1,
-1.664913, -1.05831, -2.190993, 1, 0.3490196, 0, 1,
-1.661808, 0.4779513, -2.17148, 1, 0.3529412, 0, 1,
-1.651011, -0.2545263, -4.966416, 1, 0.3607843, 0, 1,
-1.64378, 1.790575, -2.593071, 1, 0.3647059, 0, 1,
-1.629441, -0.2228648, -0.40369, 1, 0.372549, 0, 1,
-1.621718, -0.2823947, -0.7516626, 1, 0.3764706, 0, 1,
-1.619554, -0.7211456, -1.550594, 1, 0.3843137, 0, 1,
-1.612351, 1.464074, -0.7060766, 1, 0.3882353, 0, 1,
-1.595932, -1.439397, -2.977982, 1, 0.3960784, 0, 1,
-1.589562, 0.2228587, -0.5742435, 1, 0.4039216, 0, 1,
-1.587485, 0.2142256, -1.289896, 1, 0.4078431, 0, 1,
-1.580626, 0.4594014, -1.289549, 1, 0.4156863, 0, 1,
-1.579549, -0.6621907, -3.01487, 1, 0.4196078, 0, 1,
-1.574188, 0.4521741, -0.5713248, 1, 0.427451, 0, 1,
-1.514376, -0.6611311, -1.783754, 1, 0.4313726, 0, 1,
-1.508493, 0.634519, -2.089172, 1, 0.4392157, 0, 1,
-1.500165, -0.2505072, 0.2016699, 1, 0.4431373, 0, 1,
-1.498093, -0.6405659, -1.355007, 1, 0.4509804, 0, 1,
-1.49641, 0.644663, -0.2886699, 1, 0.454902, 0, 1,
-1.492796, -0.8097045, -1.293952, 1, 0.4627451, 0, 1,
-1.487764, -0.1689508, -0.9260711, 1, 0.4666667, 0, 1,
-1.475573, 0.04447677, 1.820796, 1, 0.4745098, 0, 1,
-1.467175, -0.78317, -2.486295, 1, 0.4784314, 0, 1,
-1.461804, 1.506326, -1.481174, 1, 0.4862745, 0, 1,
-1.450422, -0.2086151, -0.3668002, 1, 0.4901961, 0, 1,
-1.446271, -0.1747285, -2.73086, 1, 0.4980392, 0, 1,
-1.428761, -1.020817, -1.926404, 1, 0.5058824, 0, 1,
-1.409621, -0.919109, 1.058279, 1, 0.509804, 0, 1,
-1.391637, 1.51349, -0.4709494, 1, 0.5176471, 0, 1,
-1.388586, -3.030553, -4.276922, 1, 0.5215687, 0, 1,
-1.352513, 0.4634088, -0.04898567, 1, 0.5294118, 0, 1,
-1.344784, -0.8358189, -3.182904, 1, 0.5333334, 0, 1,
-1.344694, -0.8213347, -0.9816012, 1, 0.5411765, 0, 1,
-1.342958, 1.858156, 0.6175361, 1, 0.5450981, 0, 1,
-1.333301, 0.4665929, -0.5394516, 1, 0.5529412, 0, 1,
-1.324477, -0.3743057, -0.6796948, 1, 0.5568628, 0, 1,
-1.319293, 1.103708, -1.959984, 1, 0.5647059, 0, 1,
-1.303276, -0.3994584, -3.482716, 1, 0.5686275, 0, 1,
-1.302436, 0.2507658, -0.8357135, 1, 0.5764706, 0, 1,
-1.302398, 0.08554792, -1.631588, 1, 0.5803922, 0, 1,
-1.298458, 0.1862711, -3.761696, 1, 0.5882353, 0, 1,
-1.296742, 0.7576222, -0.3091722, 1, 0.5921569, 0, 1,
-1.294219, 2.443254, -0.8015811, 1, 0.6, 0, 1,
-1.287664, -0.258065, -1.176008, 1, 0.6078432, 0, 1,
-1.286544, -0.2840449, -0.7075886, 1, 0.6117647, 0, 1,
-1.28074, -1.787415, -1.373155, 1, 0.6196079, 0, 1,
-1.277834, 1.634154, -1.227782, 1, 0.6235294, 0, 1,
-1.272559, 0.2988602, -0.3613369, 1, 0.6313726, 0, 1,
-1.27099, -0.7244853, -5.635532, 1, 0.6352941, 0, 1,
-1.270123, -0.4717453, -2.390592, 1, 0.6431373, 0, 1,
-1.258262, -1.024526, -3.696332, 1, 0.6470588, 0, 1,
-1.25665, 0.9227565, -0.6245886, 1, 0.654902, 0, 1,
-1.241486, 0.4540199, 0.3563226, 1, 0.6588235, 0, 1,
-1.227805, 0.1918476, -2.790632, 1, 0.6666667, 0, 1,
-1.217673, 1.398365, -1.745508, 1, 0.6705883, 0, 1,
-1.216009, 0.3847796, -0.9628819, 1, 0.6784314, 0, 1,
-1.213229, -0.7023764, -1.540654, 1, 0.682353, 0, 1,
-1.20899, -0.012665, -2.337501, 1, 0.6901961, 0, 1,
-1.207835, -1.08706, -3.284943, 1, 0.6941177, 0, 1,
-1.204448, 0.9025198, -0.4007604, 1, 0.7019608, 0, 1,
-1.196613, -0.8389639, -2.532821, 1, 0.7098039, 0, 1,
-1.184676, -0.5334727, -1.764606, 1, 0.7137255, 0, 1,
-1.176618, -0.9022349, -2.578166, 1, 0.7215686, 0, 1,
-1.167974, 0.6252504, -1.01723, 1, 0.7254902, 0, 1,
-1.165288, -1.106119, -2.774715, 1, 0.7333333, 0, 1,
-1.163026, -0.2697749, -1.292052, 1, 0.7372549, 0, 1,
-1.16301, -1.147468, -3.845044, 1, 0.7450981, 0, 1,
-1.158539, 0.3172605, -3.052877, 1, 0.7490196, 0, 1,
-1.151746, -1.703692, -3.330461, 1, 0.7568628, 0, 1,
-1.14686, 0.6184816, -2.310669, 1, 0.7607843, 0, 1,
-1.146464, -0.2320254, -3.73491, 1, 0.7686275, 0, 1,
-1.143946, -0.5500143, -1.758846, 1, 0.772549, 0, 1,
-1.143279, -0.3387498, 0.5187545, 1, 0.7803922, 0, 1,
-1.142907, 0.002069268, -1.280785, 1, 0.7843137, 0, 1,
-1.125817, -1.115423, -2.370861, 1, 0.7921569, 0, 1,
-1.124311, 0.3480931, -0.8652715, 1, 0.7960784, 0, 1,
-1.121327, -0.007898462, -0.2672909, 1, 0.8039216, 0, 1,
-1.109067, 0.397163, -0.4574632, 1, 0.8117647, 0, 1,
-1.108754, -0.1234343, -4.366851, 1, 0.8156863, 0, 1,
-1.105689, -0.9263825, -2.975171, 1, 0.8235294, 0, 1,
-1.105095, 0.1093369, -1.082544, 1, 0.827451, 0, 1,
-1.103443, -0.8524092, -2.70783, 1, 0.8352941, 0, 1,
-1.102529, -2.065455, -3.950829, 1, 0.8392157, 0, 1,
-1.10003, -0.7233356, -3.42606, 1, 0.8470588, 0, 1,
-1.099742, 0.1226461, 0.0135157, 1, 0.8509804, 0, 1,
-1.095853, -0.8550447, -2.387256, 1, 0.8588235, 0, 1,
-1.094637, 0.6200225, 0.04215664, 1, 0.8627451, 0, 1,
-1.088134, 0.0923414, -1.394041, 1, 0.8705882, 0, 1,
-1.085367, -1.242428, -1.81739, 1, 0.8745098, 0, 1,
-1.083937, 1.415795, -1.272168, 1, 0.8823529, 0, 1,
-1.081127, -1.182959, -0.6171777, 1, 0.8862745, 0, 1,
-1.075201, -0.7849866, -1.709578, 1, 0.8941177, 0, 1,
-1.066766, 1.291499, -0.9589067, 1, 0.8980392, 0, 1,
-1.0661, -1.2023, -1.436168, 1, 0.9058824, 0, 1,
-1.061094, 1.562963, -0.9797526, 1, 0.9137255, 0, 1,
-1.058481, -1.870172, -3.790186, 1, 0.9176471, 0, 1,
-1.037516, -0.4696428, -1.119476, 1, 0.9254902, 0, 1,
-1.035611, 0.5874924, 0.3857539, 1, 0.9294118, 0, 1,
-1.03438, 0.3202195, -2.867229, 1, 0.9372549, 0, 1,
-1.031267, -0.07411153, -2.542592, 1, 0.9411765, 0, 1,
-1.030304, -0.9715977, -3.402015, 1, 0.9490196, 0, 1,
-1.029933, -0.3072776, -1.172218, 1, 0.9529412, 0, 1,
-1.019964, -1.849285, -2.755645, 1, 0.9607843, 0, 1,
-1.016117, -0.9015778, -2.559049, 1, 0.9647059, 0, 1,
-1.014464, 1.489036, -1.558072, 1, 0.972549, 0, 1,
-1.011632, -0.5567868, -1.208658, 1, 0.9764706, 0, 1,
-1.011487, 0.6398037, -0.9647273, 1, 0.9843137, 0, 1,
-1.009926, 1.170753, 0.2048823, 1, 0.9882353, 0, 1,
-1.007811, -0.01075922, -1.527437, 1, 0.9960784, 0, 1,
-1.007583, 0.3612742, -0.8308379, 0.9960784, 1, 0, 1,
-1.005055, 0.6173673, -1.344332, 0.9921569, 1, 0, 1,
-1.004861, 0.14778, 0.2298058, 0.9843137, 1, 0, 1,
-1.004307, 0.6125488, -3.077901, 0.9803922, 1, 0, 1,
-0.9904363, -1.093038, -1.772351, 0.972549, 1, 0, 1,
-0.9887819, 1.075435, 0.5710937, 0.9686275, 1, 0, 1,
-0.9844791, 0.0515342, -3.032134, 0.9607843, 1, 0, 1,
-0.9841964, -0.2566721, 0.4333304, 0.9568627, 1, 0, 1,
-0.9831433, 0.2356033, -2.210747, 0.9490196, 1, 0, 1,
-0.975087, 2.837797, 1.29799, 0.945098, 1, 0, 1,
-0.9661507, 0.1301746, -0.9348632, 0.9372549, 1, 0, 1,
-0.9638355, -0.6700885, -1.135543, 0.9333333, 1, 0, 1,
-0.9634646, -0.328426, -0.4305294, 0.9254902, 1, 0, 1,
-0.9627838, 0.6014462, 0.3401716, 0.9215686, 1, 0, 1,
-0.9600369, 0.3651427, 0.1367117, 0.9137255, 1, 0, 1,
-0.9497082, 0.8501769, -0.1523506, 0.9098039, 1, 0, 1,
-0.9389502, 0.5522904, 0.6933421, 0.9019608, 1, 0, 1,
-0.9320052, -0.3758062, -1.452658, 0.8941177, 1, 0, 1,
-0.9237673, -0.6115361, -3.075415, 0.8901961, 1, 0, 1,
-0.9199604, -0.849691, -3.01927, 0.8823529, 1, 0, 1,
-0.9119699, -1.320461, -2.473417, 0.8784314, 1, 0, 1,
-0.909624, 0.3398215, -1.463965, 0.8705882, 1, 0, 1,
-0.9056222, -0.8716623, -2.714208, 0.8666667, 1, 0, 1,
-0.9047133, 0.6617831, -3.132233, 0.8588235, 1, 0, 1,
-0.8963766, 0.9048793, -0.8716729, 0.854902, 1, 0, 1,
-0.8838289, 0.7263718, -1.632949, 0.8470588, 1, 0, 1,
-0.8756844, -0.7259687, -0.5192626, 0.8431373, 1, 0, 1,
-0.8675328, 1.707194, -1.34978, 0.8352941, 1, 0, 1,
-0.8658042, 0.8027596, 1.958858, 0.8313726, 1, 0, 1,
-0.8628537, 0.4063072, -0.6978549, 0.8235294, 1, 0, 1,
-0.8560387, 0.5863949, 0.1466648, 0.8196079, 1, 0, 1,
-0.8520004, -0.3390408, -1.377472, 0.8117647, 1, 0, 1,
-0.8519177, -0.8916246, -0.3248436, 0.8078431, 1, 0, 1,
-0.8367653, -0.7807765, -1.604682, 0.8, 1, 0, 1,
-0.8340879, 1.595847, -1.194314, 0.7921569, 1, 0, 1,
-0.8262027, 1.130202, 0.2500566, 0.7882353, 1, 0, 1,
-0.8239578, -1.275656, -0.9937729, 0.7803922, 1, 0, 1,
-0.8239328, 0.01984862, -2.276198, 0.7764706, 1, 0, 1,
-0.8218344, -2.171215, -0.8216797, 0.7686275, 1, 0, 1,
-0.8171804, 0.1180052, -1.297241, 0.7647059, 1, 0, 1,
-0.8092725, 1.657794, 0.5921946, 0.7568628, 1, 0, 1,
-0.8048177, -0.08930788, -1.729217, 0.7529412, 1, 0, 1,
-0.8022304, 0.1396385, -1.998947, 0.7450981, 1, 0, 1,
-0.8005528, -0.9967567, -2.720925, 0.7411765, 1, 0, 1,
-0.7973408, 1.331102, -1.936894, 0.7333333, 1, 0, 1,
-0.7947404, 0.6050991, -2.318631, 0.7294118, 1, 0, 1,
-0.7943541, -0.874757, -3.559275, 0.7215686, 1, 0, 1,
-0.7824499, 0.227314, -1.088269, 0.7176471, 1, 0, 1,
-0.7807018, 1.391132, 0.4872549, 0.7098039, 1, 0, 1,
-0.7806169, 1.520419, -0.1072957, 0.7058824, 1, 0, 1,
-0.779946, -0.8833113, -2.608136, 0.6980392, 1, 0, 1,
-0.7796084, 0.4173294, -2.197968, 0.6901961, 1, 0, 1,
-0.7766724, 1.266795, 0.002555602, 0.6862745, 1, 0, 1,
-0.7743728, 0.5400407, -0.05126304, 0.6784314, 1, 0, 1,
-0.7740698, 0.2910394, 0.06023478, 0.6745098, 1, 0, 1,
-0.7698604, 0.9875872, -0.4525315, 0.6666667, 1, 0, 1,
-0.7678144, 2.677069, -1.358193, 0.6627451, 1, 0, 1,
-0.7661099, -1.123385, -1.526644, 0.654902, 1, 0, 1,
-0.7653905, -2.275058, -2.07288, 0.6509804, 1, 0, 1,
-0.759306, -0.534309, -3.032603, 0.6431373, 1, 0, 1,
-0.7506971, 0.4525555, -1.485741, 0.6392157, 1, 0, 1,
-0.7417013, 2.100171, 1.08482, 0.6313726, 1, 0, 1,
-0.7361306, -0.5474886, -1.868772, 0.627451, 1, 0, 1,
-0.7349664, -1.317558, -3.375469, 0.6196079, 1, 0, 1,
-0.7327312, -1.661236, -2.801184, 0.6156863, 1, 0, 1,
-0.7281963, -0.3358825, -1.285032, 0.6078432, 1, 0, 1,
-0.7281817, -0.9071721, -1.540282, 0.6039216, 1, 0, 1,
-0.7223764, -0.4418209, -2.367711, 0.5960785, 1, 0, 1,
-0.7216903, -0.03457491, -2.403496, 0.5882353, 1, 0, 1,
-0.7211305, 0.02137427, -0.6313175, 0.5843138, 1, 0, 1,
-0.7192472, 0.5186874, -1.750853, 0.5764706, 1, 0, 1,
-0.7066969, 0.5450873, -0.8457558, 0.572549, 1, 0, 1,
-0.7042862, -0.1581576, -1.967054, 0.5647059, 1, 0, 1,
-0.7021649, 0.2216904, -1.811526, 0.5607843, 1, 0, 1,
-0.6998709, 1.121173, -1.288218, 0.5529412, 1, 0, 1,
-0.6959756, -0.4883612, -1.819158, 0.5490196, 1, 0, 1,
-0.6951375, 0.1483191, -0.8374401, 0.5411765, 1, 0, 1,
-0.6920609, -1.707505, -1.597878, 0.5372549, 1, 0, 1,
-0.690814, -1.113143, -1.038756, 0.5294118, 1, 0, 1,
-0.6882325, -1.064684, -3.746512, 0.5254902, 1, 0, 1,
-0.6869799, 1.044597, -1.038762, 0.5176471, 1, 0, 1,
-0.6755748, -0.2894249, -2.77857, 0.5137255, 1, 0, 1,
-0.6729603, 0.135768, -1.191735, 0.5058824, 1, 0, 1,
-0.6668115, -0.09976789, -3.208281, 0.5019608, 1, 0, 1,
-0.6652874, -0.3955775, -2.746974, 0.4941176, 1, 0, 1,
-0.6629891, 0.5765305, -0.5054854, 0.4862745, 1, 0, 1,
-0.6627418, -1.323775, -3.141591, 0.4823529, 1, 0, 1,
-0.6595613, 1.498617, -0.8878613, 0.4745098, 1, 0, 1,
-0.6580048, -0.05124251, -0.9227617, 0.4705882, 1, 0, 1,
-0.6553881, 0.8457864, -2.289218, 0.4627451, 1, 0, 1,
-0.6502521, -0.5471531, -3.189337, 0.4588235, 1, 0, 1,
-0.6446579, 0.6102184, -0.8982335, 0.4509804, 1, 0, 1,
-0.6413932, 2.468909, 0.6408488, 0.4470588, 1, 0, 1,
-0.6373728, 1.467593, -0.7459583, 0.4392157, 1, 0, 1,
-0.634428, 0.1486457, -3.023223, 0.4352941, 1, 0, 1,
-0.6342007, -0.7070722, -1.957156, 0.427451, 1, 0, 1,
-0.6340954, 1.089579, -1.202932, 0.4235294, 1, 0, 1,
-0.6282967, 0.4415104, -0.9237982, 0.4156863, 1, 0, 1,
-0.6272687, 1.473577, -0.9184701, 0.4117647, 1, 0, 1,
-0.6199358, 0.2265837, -2.159191, 0.4039216, 1, 0, 1,
-0.6138916, -0.5934335, -2.663767, 0.3960784, 1, 0, 1,
-0.613369, 0.9588279, 0.574869, 0.3921569, 1, 0, 1,
-0.611348, 0.6712568, -1.987444, 0.3843137, 1, 0, 1,
-0.6048752, -0.4963647, -2.738299, 0.3803922, 1, 0, 1,
-0.600929, 1.243808, 0.7850004, 0.372549, 1, 0, 1,
-0.6006448, -0.5748524, -0.683424, 0.3686275, 1, 0, 1,
-0.6000358, -1.016938, -3.214314, 0.3607843, 1, 0, 1,
-0.5995204, 0.7015392, -0.291954, 0.3568628, 1, 0, 1,
-0.5920485, -0.4196036, -2.529946, 0.3490196, 1, 0, 1,
-0.5909843, 0.8969514, 0.001923776, 0.345098, 1, 0, 1,
-0.5899029, 0.3091325, -1.368156, 0.3372549, 1, 0, 1,
-0.5862281, 0.2505292, 0.1207025, 0.3333333, 1, 0, 1,
-0.5861419, 0.2380185, -1.563186, 0.3254902, 1, 0, 1,
-0.5842471, -0.8402744, -2.314064, 0.3215686, 1, 0, 1,
-0.5833523, -1.03206, -2.591825, 0.3137255, 1, 0, 1,
-0.5791784, 0.5824351, -1.747645, 0.3098039, 1, 0, 1,
-0.5775823, 2.68545, -0.1592521, 0.3019608, 1, 0, 1,
-0.576254, -0.550903, -4.286168, 0.2941177, 1, 0, 1,
-0.5648222, -0.3188881, -3.897794, 0.2901961, 1, 0, 1,
-0.5580434, 1.67885, -1.522067, 0.282353, 1, 0, 1,
-0.5510706, -1.274855, -0.3858401, 0.2784314, 1, 0, 1,
-0.5417407, -0.3286234, -1.219329, 0.2705882, 1, 0, 1,
-0.5368111, 0.7347824, 0.7113086, 0.2666667, 1, 0, 1,
-0.5344142, -0.6851801, -4.293718, 0.2588235, 1, 0, 1,
-0.5323133, -2.085524, -2.013852, 0.254902, 1, 0, 1,
-0.530538, -0.1589948, -2.794939, 0.2470588, 1, 0, 1,
-0.528248, 1.371476, 1.171684, 0.2431373, 1, 0, 1,
-0.5270494, 0.6132065, -0.9385723, 0.2352941, 1, 0, 1,
-0.5268971, 0.2597865, -0.1599614, 0.2313726, 1, 0, 1,
-0.5266423, -1.593992, -3.925861, 0.2235294, 1, 0, 1,
-0.5235322, -1.462969, -1.712656, 0.2196078, 1, 0, 1,
-0.523133, -1.275838, -3.291119, 0.2117647, 1, 0, 1,
-0.5190725, 2.033933, -0.3823486, 0.2078431, 1, 0, 1,
-0.5164725, -1.652812, -3.642344, 0.2, 1, 0, 1,
-0.5135447, 2.97777, 1.129567, 0.1921569, 1, 0, 1,
-0.5066948, 0.7939984, -0.6124813, 0.1882353, 1, 0, 1,
-0.5063857, 0.2452182, -1.737918, 0.1803922, 1, 0, 1,
-0.5005775, -0.1928234, -2.954092, 0.1764706, 1, 0, 1,
-0.496323, 0.05493457, -2.852841, 0.1686275, 1, 0, 1,
-0.4943271, 1.362398, 1.069055, 0.1647059, 1, 0, 1,
-0.4928541, -0.8498715, -3.241425, 0.1568628, 1, 0, 1,
-0.4884037, 1.025274, -0.176659, 0.1529412, 1, 0, 1,
-0.486025, 0.699535, -0.9249346, 0.145098, 1, 0, 1,
-0.4837571, -0.443134, -3.379088, 0.1411765, 1, 0, 1,
-0.4837132, -1.751714, -1.182477, 0.1333333, 1, 0, 1,
-0.4820012, -1.686706, -3.243832, 0.1294118, 1, 0, 1,
-0.4803389, 0.2762699, -0.9749826, 0.1215686, 1, 0, 1,
-0.4776488, -0.7933967, -2.944743, 0.1176471, 1, 0, 1,
-0.4706698, 1.350882, -0.2125299, 0.1098039, 1, 0, 1,
-0.4683629, -0.3216074, -1.10785, 0.1058824, 1, 0, 1,
-0.4682775, 0.5660729, 0.2256781, 0.09803922, 1, 0, 1,
-0.4676086, -1.139012, -3.244747, 0.09019608, 1, 0, 1,
-0.4651137, -0.111601, -4.304045, 0.08627451, 1, 0, 1,
-0.4646777, -0.791703, -1.282387, 0.07843138, 1, 0, 1,
-0.4613354, -0.688078, -1.860889, 0.07450981, 1, 0, 1,
-0.4594847, -2.08704, -2.757094, 0.06666667, 1, 0, 1,
-0.4536847, 2.073754, -1.321576, 0.0627451, 1, 0, 1,
-0.4513106, -0.1506796, -2.309493, 0.05490196, 1, 0, 1,
-0.4482967, 0.7840543, -2.73996, 0.05098039, 1, 0, 1,
-0.4445574, -0.6231592, -2.844203, 0.04313726, 1, 0, 1,
-0.4411146, 1.438792, -1.198801, 0.03921569, 1, 0, 1,
-0.4380208, -0.105223, -2.826558, 0.03137255, 1, 0, 1,
-0.4332024, 0.7877331, -1.148059, 0.02745098, 1, 0, 1,
-0.4312246, 0.1221846, -2.363166, 0.01960784, 1, 0, 1,
-0.4306212, 0.5877477, -2.291624, 0.01568628, 1, 0, 1,
-0.4294837, -0.8080786, -1.498492, 0.007843138, 1, 0, 1,
-0.4247731, -0.2288733, -1.264033, 0.003921569, 1, 0, 1,
-0.423895, 0.2722831, -0.2849958, 0, 1, 0.003921569, 1,
-0.4236475, 0.7806647, -0.4908847, 0, 1, 0.01176471, 1,
-0.4236172, -0.1421136, -1.872021, 0, 1, 0.01568628, 1,
-0.4207991, -0.6890647, -1.668816, 0, 1, 0.02352941, 1,
-0.4198253, 1.442042, 1.192012, 0, 1, 0.02745098, 1,
-0.4180265, -0.3086734, -1.31469, 0, 1, 0.03529412, 1,
-0.4167031, 0.806394, -1.376132, 0, 1, 0.03921569, 1,
-0.4141839, 1.156619, -0.2310113, 0, 1, 0.04705882, 1,
-0.40667, -1.268242, -2.772244, 0, 1, 0.05098039, 1,
-0.404353, -0.1542215, -2.991616, 0, 1, 0.05882353, 1,
-0.4032337, 0.3884486, -0.6777104, 0, 1, 0.0627451, 1,
-0.4017733, 0.296131, -1.343378, 0, 1, 0.07058824, 1,
-0.4001648, 0.6528184, -0.7785376, 0, 1, 0.07450981, 1,
-0.3999091, 0.7096607, -0.6161649, 0, 1, 0.08235294, 1,
-0.3962904, -0.2464473, -2.815595, 0, 1, 0.08627451, 1,
-0.391891, -1.140456, -1.469218, 0, 1, 0.09411765, 1,
-0.3824038, -0.6301878, -2.846168, 0, 1, 0.1019608, 1,
-0.3816718, -0.7874159, -1.427905, 0, 1, 0.1058824, 1,
-0.3771778, -0.121541, -2.139672, 0, 1, 0.1137255, 1,
-0.3745371, -1.104655, -2.579229, 0, 1, 0.1176471, 1,
-0.3725502, -0.2274934, -1.196025, 0, 1, 0.1254902, 1,
-0.3719691, 1.667545, -1.475385, 0, 1, 0.1294118, 1,
-0.3703546, 0.2673112, -0.2700619, 0, 1, 0.1372549, 1,
-0.3698138, -1.328521, -2.671571, 0, 1, 0.1411765, 1,
-0.3662827, 1.831693, -0.3762331, 0, 1, 0.1490196, 1,
-0.3645739, -0.03701499, -1.297605, 0, 1, 0.1529412, 1,
-0.3631418, -0.5642701, -3.060285, 0, 1, 0.1607843, 1,
-0.3613496, -0.1649763, -3.416085, 0, 1, 0.1647059, 1,
-0.3611267, -2.523098, -4.626164, 0, 1, 0.172549, 1,
-0.3594556, -0.5626981, -0.5577778, 0, 1, 0.1764706, 1,
-0.358302, -1.252504, -3.274527, 0, 1, 0.1843137, 1,
-0.3572387, -2.503784, -2.33266, 0, 1, 0.1882353, 1,
-0.3543617, 0.1960635, -1.039954, 0, 1, 0.1960784, 1,
-0.3534256, -0.7931135, -2.069655, 0, 1, 0.2039216, 1,
-0.3454946, -0.5118328, -2.358203, 0, 1, 0.2078431, 1,
-0.3423946, -1.574119, -2.842082, 0, 1, 0.2156863, 1,
-0.3364461, -0.2168606, -3.293048, 0, 1, 0.2196078, 1,
-0.334121, -1.037115, -2.579325, 0, 1, 0.227451, 1,
-0.3313309, -1.638901, -3.727868, 0, 1, 0.2313726, 1,
-0.3239878, 0.4143412, -1.0373, 0, 1, 0.2392157, 1,
-0.3218634, -0.2825536, -2.323467, 0, 1, 0.2431373, 1,
-0.3147395, -0.1352501, -2.210301, 0, 1, 0.2509804, 1,
-0.3117177, -0.62089, -1.159143, 0, 1, 0.254902, 1,
-0.309036, 0.7249329, -1.601458, 0, 1, 0.2627451, 1,
-0.3064446, -0.7043272, -6.020357, 0, 1, 0.2666667, 1,
-0.3063128, -0.01975854, -1.975353, 0, 1, 0.2745098, 1,
-0.305665, -0.25221, -1.226107, 0, 1, 0.2784314, 1,
-0.3042453, -0.9889078, -1.373653, 0, 1, 0.2862745, 1,
-0.3015563, 1.5169, 0.06843092, 0, 1, 0.2901961, 1,
-0.3011013, 1.118606, -1.593487, 0, 1, 0.2980392, 1,
-0.3001138, -2.341522, -5.364685, 0, 1, 0.3058824, 1,
-0.2990858, -0.3081895, -4.485389, 0, 1, 0.3098039, 1,
-0.2934837, 1.695762, 0.9905872, 0, 1, 0.3176471, 1,
-0.2923188, 0.9180031, 0.6845809, 0, 1, 0.3215686, 1,
-0.2900609, 0.6845474, 0.6014221, 0, 1, 0.3294118, 1,
-0.2871602, -1.358123, -3.489861, 0, 1, 0.3333333, 1,
-0.2785802, 0.2152192, -0.7393457, 0, 1, 0.3411765, 1,
-0.2751698, 1.013218, -0.2929157, 0, 1, 0.345098, 1,
-0.2715167, 0.09213024, -2.073171, 0, 1, 0.3529412, 1,
-0.2705898, -0.2589796, -1.988287, 0, 1, 0.3568628, 1,
-0.2664287, 0.8051984, -0.100886, 0, 1, 0.3647059, 1,
-0.2621703, -0.1731416, -0.7489547, 0, 1, 0.3686275, 1,
-0.2587956, 1.21272, -0.4773715, 0, 1, 0.3764706, 1,
-0.252918, -0.1479417, -2.691272, 0, 1, 0.3803922, 1,
-0.2392834, 0.3305912, -1.325503, 0, 1, 0.3882353, 1,
-0.237458, -0.09338149, -1.608904, 0, 1, 0.3921569, 1,
-0.2374477, 1.321721, -0.307159, 0, 1, 0.4, 1,
-0.234695, -1.510206, -3.576892, 0, 1, 0.4078431, 1,
-0.2340626, 0.4837937, -0.3218397, 0, 1, 0.4117647, 1,
-0.2311359, -0.3844388, -4.497402, 0, 1, 0.4196078, 1,
-0.2277578, -1.24155, -2.029277, 0, 1, 0.4235294, 1,
-0.2259896, -0.8928303, -0.7729068, 0, 1, 0.4313726, 1,
-0.2171041, -0.4002234, -2.564442, 0, 1, 0.4352941, 1,
-0.2120713, -1.813506, -2.962992, 0, 1, 0.4431373, 1,
-0.2056215, 1.457342, -0.1186232, 0, 1, 0.4470588, 1,
-0.2038621, -0.6625646, -2.286306, 0, 1, 0.454902, 1,
-0.2009823, 0.9662623, 0.8349888, 0, 1, 0.4588235, 1,
-0.195844, 3.317854, 0.04360009, 0, 1, 0.4666667, 1,
-0.1917424, -0.04939015, -1.800289, 0, 1, 0.4705882, 1,
-0.1898557, -1.169717, -4.061708, 0, 1, 0.4784314, 1,
-0.1896996, -1.535943, -4.096373, 0, 1, 0.4823529, 1,
-0.1891402, -0.2072087, -3.164815, 0, 1, 0.4901961, 1,
-0.1887638, 1.772955, 0.2610184, 0, 1, 0.4941176, 1,
-0.1882352, -0.6236975, -2.323335, 0, 1, 0.5019608, 1,
-0.1766132, 1.123643, -0.2697539, 0, 1, 0.509804, 1,
-0.1725978, -0.566669, -0.5626088, 0, 1, 0.5137255, 1,
-0.1718822, 0.08812653, -1.50527, 0, 1, 0.5215687, 1,
-0.1716759, 0.1736097, -1.598718, 0, 1, 0.5254902, 1,
-0.1715623, -0.460862, -2.859108, 0, 1, 0.5333334, 1,
-0.1684824, -0.8275634, -3.348535, 0, 1, 0.5372549, 1,
-0.1653418, 0.2894855, -1.171952, 0, 1, 0.5450981, 1,
-0.164499, 0.9393968, 1.520922, 0, 1, 0.5490196, 1,
-0.1632206, 0.1884545, -0.7004449, 0, 1, 0.5568628, 1,
-0.1607583, -1.37904, -3.830793, 0, 1, 0.5607843, 1,
-0.1583196, 0.683669, 0.733349, 0, 1, 0.5686275, 1,
-0.1570909, -0.5243997, -2.137501, 0, 1, 0.572549, 1,
-0.1563158, -0.3976385, -2.98112, 0, 1, 0.5803922, 1,
-0.1558876, 0.9061507, 0.8722462, 0, 1, 0.5843138, 1,
-0.1488181, -0.603749, -4.593002, 0, 1, 0.5921569, 1,
-0.1456284, -0.7022005, -2.914026, 0, 1, 0.5960785, 1,
-0.144376, 0.9111428, 2.300417, 0, 1, 0.6039216, 1,
-0.1309092, -1.705025, -2.790759, 0, 1, 0.6117647, 1,
-0.1273248, 1.584851, -0.06600557, 0, 1, 0.6156863, 1,
-0.1266313, 1.032864, -2.438302, 0, 1, 0.6235294, 1,
-0.1263095, 0.6593842, 0.37414, 0, 1, 0.627451, 1,
-0.1239589, -0.4008138, -3.740985, 0, 1, 0.6352941, 1,
-0.1239185, 1.21051, 0.3978781, 0, 1, 0.6392157, 1,
-0.1237142, -0.04044686, -2.164503, 0, 1, 0.6470588, 1,
-0.1226374, -0.6265373, -3.747101, 0, 1, 0.6509804, 1,
-0.1181699, -0.3116663, -1.926667, 0, 1, 0.6588235, 1,
-0.1163315, 0.7091407, 0.5259796, 0, 1, 0.6627451, 1,
-0.1144944, 0.3734538, 0.2573661, 0, 1, 0.6705883, 1,
-0.1109677, -0.3927646, -2.17973, 0, 1, 0.6745098, 1,
-0.1096819, 0.4754682, -1.283878, 0, 1, 0.682353, 1,
-0.1094583, -0.8953911, -3.751485, 0, 1, 0.6862745, 1,
-0.1051587, -0.5730229, -3.756194, 0, 1, 0.6941177, 1,
-0.1031612, -0.7805908, -3.961074, 0, 1, 0.7019608, 1,
-0.09707317, 0.345147, 0.3711123, 0, 1, 0.7058824, 1,
-0.09674929, 0.5260901, -0.4490847, 0, 1, 0.7137255, 1,
-0.09673149, 0.08101378, -2.314792, 0, 1, 0.7176471, 1,
-0.09666102, 0.2106819, -1.304243, 0, 1, 0.7254902, 1,
-0.09481464, -1.719436, -3.243279, 0, 1, 0.7294118, 1,
-0.0934863, -0.9301648, -1.651665, 0, 1, 0.7372549, 1,
-0.09274158, -1.25269, -4.130947, 0, 1, 0.7411765, 1,
-0.09179528, 0.5422699, 1.742455, 0, 1, 0.7490196, 1,
-0.09039177, -0.2366594, -2.350065, 0, 1, 0.7529412, 1,
-0.08517636, 0.9329989, 0.8076152, 0, 1, 0.7607843, 1,
-0.08070512, -2.551028, -3.649587, 0, 1, 0.7647059, 1,
-0.07712487, -0.1539514, -1.786234, 0, 1, 0.772549, 1,
-0.07543933, -0.6556659, -2.863847, 0, 1, 0.7764706, 1,
-0.06790941, -0.3778576, -3.33588, 0, 1, 0.7843137, 1,
-0.06748869, -1.443487, -2.875643, 0, 1, 0.7882353, 1,
-0.0672511, 0.6417341, -0.7836838, 0, 1, 0.7960784, 1,
-0.06278881, -0.5531582, -1.313876, 0, 1, 0.8039216, 1,
-0.06092118, -0.5466229, -2.229475, 0, 1, 0.8078431, 1,
-0.05828015, 1.121451, -0.7485084, 0, 1, 0.8156863, 1,
-0.05721977, -0.7311274, -3.31392, 0, 1, 0.8196079, 1,
-0.05373606, 0.8852891, 0.4213206, 0, 1, 0.827451, 1,
-0.05335484, 1.076175, 1.703183, 0, 1, 0.8313726, 1,
-0.05261694, 1.010305, 0.3604115, 0, 1, 0.8392157, 1,
-0.04910318, -0.005324202, -1.877123, 0, 1, 0.8431373, 1,
-0.04548911, -1.468862, -3.24966, 0, 1, 0.8509804, 1,
-0.04335478, -0.2719717, -3.400115, 0, 1, 0.854902, 1,
-0.04018485, 0.4111767, -0.06872191, 0, 1, 0.8627451, 1,
-0.03718678, 1.661634, -0.9032292, 0, 1, 0.8666667, 1,
-0.03261266, 1.790147, -0.3754131, 0, 1, 0.8745098, 1,
-0.03189344, 0.5983675, -0.05326037, 0, 1, 0.8784314, 1,
-0.03090698, -0.8280678, -3.251962, 0, 1, 0.8862745, 1,
-0.02998398, 1.230173, 0.0888482, 0, 1, 0.8901961, 1,
-0.02930473, -0.4395511, -2.890655, 0, 1, 0.8980392, 1,
-0.025789, -1.407371, -0.14652, 0, 1, 0.9058824, 1,
-0.02211531, 0.4449708, -0.4085984, 0, 1, 0.9098039, 1,
-0.02060765, 1.220512, 1.029462, 0, 1, 0.9176471, 1,
-0.02058796, 0.3764821, 0.515802, 0, 1, 0.9215686, 1,
-0.01962781, -1.709924, -3.32148, 0, 1, 0.9294118, 1,
-0.01949601, 0.1602114, 0.5503289, 0, 1, 0.9333333, 1,
-0.01872028, 0.08821695, 0.1800841, 0, 1, 0.9411765, 1,
-0.01789111, -1.050638, -2.531913, 0, 1, 0.945098, 1,
-0.01131471, 0.2720005, 0.3810443, 0, 1, 0.9529412, 1,
-0.00687642, -1.565327, -2.875856, 0, 1, 0.9568627, 1,
-0.006138049, -0.8149278, -3.55962, 0, 1, 0.9647059, 1,
-0.006099541, -0.3487884, -3.563205, 0, 1, 0.9686275, 1,
-0.005136736, 0.4807506, -0.1583514, 0, 1, 0.9764706, 1,
-0.00250792, 0.5159318, 0.01604724, 0, 1, 0.9803922, 1,
0.001535938, -0.7164375, 5.359156, 0, 1, 0.9882353, 1,
0.008135433, 0.4493008, -1.493741, 0, 1, 0.9921569, 1,
0.01076388, 0.4172086, 0.8841705, 0, 1, 1, 1,
0.01263366, -0.6488503, 4.188256, 0, 0.9921569, 1, 1,
0.01379279, -0.1180839, 3.911418, 0, 0.9882353, 1, 1,
0.01645115, -0.005256978, 2.508884, 0, 0.9803922, 1, 1,
0.01667816, -0.01717657, 2.365925, 0, 0.9764706, 1, 1,
0.01727891, 0.02037534, 0.7350144, 0, 0.9686275, 1, 1,
0.01839786, -1.039685, 3.383126, 0, 0.9647059, 1, 1,
0.02578206, 0.4590043, -1.355819, 0, 0.9568627, 1, 1,
0.02884927, 1.309384, 1.039572, 0, 0.9529412, 1, 1,
0.0296152, -1.061448, 2.849302, 0, 0.945098, 1, 1,
0.02967688, -0.3978608, 3.358778, 0, 0.9411765, 1, 1,
0.03051231, 0.3357728, 0.9049962, 0, 0.9333333, 1, 1,
0.03101994, 0.4680434, -0.02116172, 0, 0.9294118, 1, 1,
0.03434369, 0.04533748, 0.9350261, 0, 0.9215686, 1, 1,
0.03618265, 0.727364, -0.1870337, 0, 0.9176471, 1, 1,
0.03680405, -0.5057788, 3.001636, 0, 0.9098039, 1, 1,
0.03709387, 0.1388379, -0.3265238, 0, 0.9058824, 1, 1,
0.03807202, -0.5840649, 4.232957, 0, 0.8980392, 1, 1,
0.03927038, 0.7188085, 0.831946, 0, 0.8901961, 1, 1,
0.03968737, -0.3007969, 2.91582, 0, 0.8862745, 1, 1,
0.03974603, 0.5475507, -0.2011312, 0, 0.8784314, 1, 1,
0.04307144, -1.404638, 2.691322, 0, 0.8745098, 1, 1,
0.04724277, 0.0810813, -0.4128357, 0, 0.8666667, 1, 1,
0.05074563, 2.198753, -1.528111, 0, 0.8627451, 1, 1,
0.05602663, 0.8942714, -0.1820696, 0, 0.854902, 1, 1,
0.05759703, 0.581136, -0.4163953, 0, 0.8509804, 1, 1,
0.0615041, -0.08754049, 2.966019, 0, 0.8431373, 1, 1,
0.06544946, -0.7532864, 2.446592, 0, 0.8392157, 1, 1,
0.06838111, 0.9977528, -1.115478, 0, 0.8313726, 1, 1,
0.06862666, -0.03768265, 4.403476, 0, 0.827451, 1, 1,
0.06901459, -0.9544922, 1.614679, 0, 0.8196079, 1, 1,
0.07199676, -0.5354097, 3.209818, 0, 0.8156863, 1, 1,
0.07684451, -0.2484308, 4.594251, 0, 0.8078431, 1, 1,
0.07793467, -0.2895497, 2.198357, 0, 0.8039216, 1, 1,
0.07825442, -1.722763, 3.940347, 0, 0.7960784, 1, 1,
0.08106367, -0.9241058, 2.813452, 0, 0.7882353, 1, 1,
0.0818856, 1.876132, -0.6299298, 0, 0.7843137, 1, 1,
0.08428343, 1.369482, -0.8911251, 0, 0.7764706, 1, 1,
0.08581161, 1.758772, -0.004373833, 0, 0.772549, 1, 1,
0.08612971, 1.019164, 1.288988, 0, 0.7647059, 1, 1,
0.09099919, 1.599117, -0.9735159, 0, 0.7607843, 1, 1,
0.09107295, 0.6118829, -0.8071083, 0, 0.7529412, 1, 1,
0.09474788, -0.5850401, 1.693836, 0, 0.7490196, 1, 1,
0.09782211, -0.7590776, 1.48846, 0, 0.7411765, 1, 1,
0.1004244, -0.3280824, 4.904443, 0, 0.7372549, 1, 1,
0.1009688, -1.692499, 2.093643, 0, 0.7294118, 1, 1,
0.1025235, 0.2750451, -1.400928, 0, 0.7254902, 1, 1,
0.10465, -0.5748639, 0.6568278, 0, 0.7176471, 1, 1,
0.1051064, 0.3567889, 2.003739, 0, 0.7137255, 1, 1,
0.1053744, -0.02926964, 2.282383, 0, 0.7058824, 1, 1,
0.105853, 1.504722, -0.1928328, 0, 0.6980392, 1, 1,
0.1066259, -1.551141, 4.39721, 0, 0.6941177, 1, 1,
0.1180877, 0.5064333, -0.3138388, 0, 0.6862745, 1, 1,
0.1254193, -1.879953, 1.744927, 0, 0.682353, 1, 1,
0.1255194, -1.919185, 3.599197, 0, 0.6745098, 1, 1,
0.1289447, 0.5997187, -0.6771082, 0, 0.6705883, 1, 1,
0.1344142, 0.03295835, 1.33712, 0, 0.6627451, 1, 1,
0.1349079, -0.3024143, 3.000067, 0, 0.6588235, 1, 1,
0.1390589, 0.4697437, 0.543648, 0, 0.6509804, 1, 1,
0.1400635, 0.492755, -1.620049, 0, 0.6470588, 1, 1,
0.1400838, -0.6321672, 3.01777, 0, 0.6392157, 1, 1,
0.1465723, 0.7303535, 0.2141517, 0, 0.6352941, 1, 1,
0.148442, 1.012849, 2.46712, 0, 0.627451, 1, 1,
0.1556607, 0.7284766, 0.4679907, 0, 0.6235294, 1, 1,
0.1611076, -1.016785, 3.224983, 0, 0.6156863, 1, 1,
0.1618551, 0.2952297, 1.4642, 0, 0.6117647, 1, 1,
0.163769, 2.260032, -1.630897, 0, 0.6039216, 1, 1,
0.1663386, 1.123645, -1.619539, 0, 0.5960785, 1, 1,
0.1664054, 0.9775675, 0.1779578, 0, 0.5921569, 1, 1,
0.1678078, 0.7995213, 1.19019, 0, 0.5843138, 1, 1,
0.1692507, 1.456433, -0.6440828, 0, 0.5803922, 1, 1,
0.1707384, 0.3371226, 0.04058452, 0, 0.572549, 1, 1,
0.1731115, 0.4974106, -0.3581786, 0, 0.5686275, 1, 1,
0.1738181, 1.256658, 0.6224611, 0, 0.5607843, 1, 1,
0.1744351, -0.6186583, 5.031346, 0, 0.5568628, 1, 1,
0.1755606, 0.5654823, 1.02064, 0, 0.5490196, 1, 1,
0.1756465, -0.2896984, 1.975913, 0, 0.5450981, 1, 1,
0.1759418, 0.9706161, -0.5072303, 0, 0.5372549, 1, 1,
0.1793502, 1.124676, -0.3519754, 0, 0.5333334, 1, 1,
0.1793518, 0.8047808, 1.230011, 0, 0.5254902, 1, 1,
0.1842274, -0.7930464, 2.587435, 0, 0.5215687, 1, 1,
0.1868363, -0.09817275, 2.22156, 0, 0.5137255, 1, 1,
0.1917361, 2.170611, -0.2921658, 0, 0.509804, 1, 1,
0.1954766, -1.441024, 2.410034, 0, 0.5019608, 1, 1,
0.1969854, 1.669047, -0.158029, 0, 0.4941176, 1, 1,
0.1985324, 0.9681247, 0.9644433, 0, 0.4901961, 1, 1,
0.2028669, -0.8930742, 4.530285, 0, 0.4823529, 1, 1,
0.2060715, -0.4497108, 2.02357, 0, 0.4784314, 1, 1,
0.2060816, -0.5862386, 2.589839, 0, 0.4705882, 1, 1,
0.2091945, -0.3675943, 1.876167, 0, 0.4666667, 1, 1,
0.2092136, 0.777912, -0.2685043, 0, 0.4588235, 1, 1,
0.2150269, -0.5328786, 2.85346, 0, 0.454902, 1, 1,
0.2193849, -1.829948, 2.82652, 0, 0.4470588, 1, 1,
0.2194336, -0.04865493, -0.03934464, 0, 0.4431373, 1, 1,
0.2204933, -0.7851238, 4.560664, 0, 0.4352941, 1, 1,
0.2257775, -0.3117822, 2.466687, 0, 0.4313726, 1, 1,
0.23173, 1.002925, 1.626941, 0, 0.4235294, 1, 1,
0.2322915, 0.8889418, 0.2093365, 0, 0.4196078, 1, 1,
0.2330912, -0.4072313, 3.272855, 0, 0.4117647, 1, 1,
0.2428472, -1.092903, 3.113437, 0, 0.4078431, 1, 1,
0.2491828, 1.118769, -2.617729, 0, 0.4, 1, 1,
0.2507727, 1.801347, 0.2965375, 0, 0.3921569, 1, 1,
0.2576237, 1.800032, 1.274801, 0, 0.3882353, 1, 1,
0.261617, 0.6835538, 0.1494271, 0, 0.3803922, 1, 1,
0.2656732, 0.2897379, -0.1526065, 0, 0.3764706, 1, 1,
0.2730242, -0.9921575, 3.779134, 0, 0.3686275, 1, 1,
0.2758042, -0.2478781, 0.9118058, 0, 0.3647059, 1, 1,
0.2766981, 0.2901379, 1.24215, 0, 0.3568628, 1, 1,
0.2790967, 1.059298, -0.8270847, 0, 0.3529412, 1, 1,
0.2796977, -0.7082274, 2.658251, 0, 0.345098, 1, 1,
0.2858173, 0.2204417, 2.809635, 0, 0.3411765, 1, 1,
0.2861326, 0.8119756, 1.661807, 0, 0.3333333, 1, 1,
0.2863032, -0.01547867, 0.1981845, 0, 0.3294118, 1, 1,
0.2903668, 1.49509, 1.699791, 0, 0.3215686, 1, 1,
0.2937464, -1.109632, 2.271828, 0, 0.3176471, 1, 1,
0.2938534, 0.3887445, 0.9840469, 0, 0.3098039, 1, 1,
0.2967533, -0.1288462, 2.699185, 0, 0.3058824, 1, 1,
0.2977357, 0.386372, 1.802659, 0, 0.2980392, 1, 1,
0.3003188, 1.150599, 1.954557, 0, 0.2901961, 1, 1,
0.3017084, 1.478191, 1.523377, 0, 0.2862745, 1, 1,
0.3030811, -0.4981066, 2.243937, 0, 0.2784314, 1, 1,
0.3040131, -1.148982, 3.58887, 0, 0.2745098, 1, 1,
0.3059501, -0.7021078, 3.390725, 0, 0.2666667, 1, 1,
0.3084604, 0.8432133, 0.05275016, 0, 0.2627451, 1, 1,
0.3115837, -0.4790815, 2.335419, 0, 0.254902, 1, 1,
0.3151194, 0.02578601, 2.339412, 0, 0.2509804, 1, 1,
0.3165296, -1.846111, 2.538526, 0, 0.2431373, 1, 1,
0.3321985, -0.4175052, 1.582861, 0, 0.2392157, 1, 1,
0.3354759, 0.4672675, 1.258863, 0, 0.2313726, 1, 1,
0.3356115, -2.275947, 1.689891, 0, 0.227451, 1, 1,
0.3360705, -1.698382, 4.855976, 0, 0.2196078, 1, 1,
0.3395848, -0.3581484, 1.646728, 0, 0.2156863, 1, 1,
0.3438305, -1.430526, 3.933861, 0, 0.2078431, 1, 1,
0.3488475, 0.4352078, 3.644422, 0, 0.2039216, 1, 1,
0.351247, 0.02758645, 0.05404654, 0, 0.1960784, 1, 1,
0.3515454, 0.140042, 1.32163, 0, 0.1882353, 1, 1,
0.3526862, -0.9188612, 1.246819, 0, 0.1843137, 1, 1,
0.3584467, 0.1015575, 0.8229681, 0, 0.1764706, 1, 1,
0.3593091, 2.152004, 1.274287, 0, 0.172549, 1, 1,
0.3697655, 0.3601935, 0.4882514, 0, 0.1647059, 1, 1,
0.3698225, -0.8983259, 2.13378, 0, 0.1607843, 1, 1,
0.3746017, 1.130151, 0.3076406, 0, 0.1529412, 1, 1,
0.3759847, 1.132561, 2.446297, 0, 0.1490196, 1, 1,
0.3782312, -0.02677797, 0.9634179, 0, 0.1411765, 1, 1,
0.3794419, -0.6719419, 2.68532, 0, 0.1372549, 1, 1,
0.3821203, -1.795468, 2.582541, 0, 0.1294118, 1, 1,
0.3831309, 0.001627832, 1.066021, 0, 0.1254902, 1, 1,
0.3864978, -1.270673, 2.813828, 0, 0.1176471, 1, 1,
0.3882397, -0.545768, 0.200443, 0, 0.1137255, 1, 1,
0.3882976, -1.629996, 2.580273, 0, 0.1058824, 1, 1,
0.3904803, -0.8728437, 4.57976, 0, 0.09803922, 1, 1,
0.3927833, 0.0002455118, 1.731134, 0, 0.09411765, 1, 1,
0.3930945, -1.852211, 4.376723, 0, 0.08627451, 1, 1,
0.3989946, 2.24238, 1.022055, 0, 0.08235294, 1, 1,
0.402111, -1.626049, 2.247178, 0, 0.07450981, 1, 1,
0.4044388, -0.3990416, 3.319478, 0, 0.07058824, 1, 1,
0.4101998, -0.9118046, 2.830445, 0, 0.0627451, 1, 1,
0.4163286, 0.8850399, -1.223563, 0, 0.05882353, 1, 1,
0.4165069, 0.6905984, -0.909508, 0, 0.05098039, 1, 1,
0.4188567, 0.340795, 0.5085757, 0, 0.04705882, 1, 1,
0.4190614, -2.004897, 2.356798, 0, 0.03921569, 1, 1,
0.4198414, -1.619987, 4.805748, 0, 0.03529412, 1, 1,
0.4213544, -1.247633, 0.7343985, 0, 0.02745098, 1, 1,
0.4243562, 0.7673606, -1.247253, 0, 0.02352941, 1, 1,
0.4250607, 0.2007218, 0.9545422, 0, 0.01568628, 1, 1,
0.426032, -1.189044, 2.604739, 0, 0.01176471, 1, 1,
0.4261204, 0.9746633, 1.286472, 0, 0.003921569, 1, 1,
0.4370037, 0.08500104, 0.8077321, 0.003921569, 0, 1, 1,
0.4375505, 0.8839911, 0.4478355, 0.007843138, 0, 1, 1,
0.4376487, -0.2643212, 2.118128, 0.01568628, 0, 1, 1,
0.442192, -0.8642443, 4.10461, 0.01960784, 0, 1, 1,
0.4472162, 1.72501, -0.1423853, 0.02745098, 0, 1, 1,
0.448832, -0.1926687, 2.772331, 0.03137255, 0, 1, 1,
0.4547478, -0.5481223, 3.381958, 0.03921569, 0, 1, 1,
0.4570496, -1.803045, 3.465054, 0.04313726, 0, 1, 1,
0.4582111, -0.1312829, 0.8179427, 0.05098039, 0, 1, 1,
0.4605263, 1.005601, 0.233634, 0.05490196, 0, 1, 1,
0.4605455, 1.124871, 0.4940587, 0.0627451, 0, 1, 1,
0.4606601, -0.4796639, 2.891972, 0.06666667, 0, 1, 1,
0.4623504, 0.8863671, 1.295875, 0.07450981, 0, 1, 1,
0.4629087, -0.09443593, 3.946341, 0.07843138, 0, 1, 1,
0.4650105, 1.14478, 0.00799157, 0.08627451, 0, 1, 1,
0.467254, 0.1046223, 1.585009, 0.09019608, 0, 1, 1,
0.4672933, 0.4853044, 2.975781, 0.09803922, 0, 1, 1,
0.4758884, -1.673238, 3.582454, 0.1058824, 0, 1, 1,
0.4809405, 0.4564805, 1.55008, 0.1098039, 0, 1, 1,
0.4835869, 1.53301, -0.2738557, 0.1176471, 0, 1, 1,
0.4866533, -0.5463266, 4.361697, 0.1215686, 0, 1, 1,
0.4898461, 0.3190568, 0.5619777, 0.1294118, 0, 1, 1,
0.4971825, -0.06364635, 1.292429, 0.1333333, 0, 1, 1,
0.4978055, -1.436453, 1.817105, 0.1411765, 0, 1, 1,
0.502108, -0.7021288, 1.032765, 0.145098, 0, 1, 1,
0.5051698, 2.621171, 0.8653244, 0.1529412, 0, 1, 1,
0.5066441, -1.852749, 2.746487, 0.1568628, 0, 1, 1,
0.5081484, -2.348274, 2.500875, 0.1647059, 0, 1, 1,
0.5086414, -0.01730095, 1.338878, 0.1686275, 0, 1, 1,
0.5168236, 0.6043046, 0.02131121, 0.1764706, 0, 1, 1,
0.5174324, 1.291968, 0.4560655, 0.1803922, 0, 1, 1,
0.5176637, 0.840781, 1.018501, 0.1882353, 0, 1, 1,
0.51794, -1.686188, 4.811983, 0.1921569, 0, 1, 1,
0.5231933, -1.775289, 3.197068, 0.2, 0, 1, 1,
0.5281387, 0.1695031, 1.621316, 0.2078431, 0, 1, 1,
0.5338804, 0.07105741, 1.805242, 0.2117647, 0, 1, 1,
0.5349072, 1.982054, -0.5489693, 0.2196078, 0, 1, 1,
0.535529, 1.327028, 0.7010683, 0.2235294, 0, 1, 1,
0.5355398, -0.03667356, 3.448752, 0.2313726, 0, 1, 1,
0.5366161, -0.2071313, 2.050193, 0.2352941, 0, 1, 1,
0.5375844, 0.5649812, -0.2740604, 0.2431373, 0, 1, 1,
0.5408136, -0.5922726, 2.880383, 0.2470588, 0, 1, 1,
0.5410219, -0.7613016, 2.765127, 0.254902, 0, 1, 1,
0.5433018, 0.755404, 0.5248312, 0.2588235, 0, 1, 1,
0.5438929, -0.3928174, 1.930239, 0.2666667, 0, 1, 1,
0.5475857, 1.939824, 0.7072135, 0.2705882, 0, 1, 1,
0.5548685, 0.6207948, 0.9790099, 0.2784314, 0, 1, 1,
0.556722, 0.1684574, 1.243476, 0.282353, 0, 1, 1,
0.5570799, -0.3721197, 1.687454, 0.2901961, 0, 1, 1,
0.5588222, -0.4803298, 2.543945, 0.2941177, 0, 1, 1,
0.5701988, -0.1235405, 0.5252779, 0.3019608, 0, 1, 1,
0.5753136, -0.1297399, 2.846756, 0.3098039, 0, 1, 1,
0.5892155, -1.057165, 2.533009, 0.3137255, 0, 1, 1,
0.5899516, 0.7021883, -0.6723368, 0.3215686, 0, 1, 1,
0.5916904, -0.3203517, 2.527546, 0.3254902, 0, 1, 1,
0.5983795, 0.006338334, 0.4316294, 0.3333333, 0, 1, 1,
0.6022153, -0.1547531, 1.168426, 0.3372549, 0, 1, 1,
0.6043454, 1.032135, 0.6615456, 0.345098, 0, 1, 1,
0.6064159, -0.284925, 2.814198, 0.3490196, 0, 1, 1,
0.6137477, -1.508106, 2.955678, 0.3568628, 0, 1, 1,
0.6159006, -1.18249, 1.448799, 0.3607843, 0, 1, 1,
0.62054, 1.186436, 0.170215, 0.3686275, 0, 1, 1,
0.6246688, 0.360337, 1.28224, 0.372549, 0, 1, 1,
0.6256366, 0.07383895, 0.8182676, 0.3803922, 0, 1, 1,
0.6297754, 2.338341, -0.7294849, 0.3843137, 0, 1, 1,
0.6332465, -1.795597, 4.050496, 0.3921569, 0, 1, 1,
0.6349908, 0.7413026, 1.247999, 0.3960784, 0, 1, 1,
0.635294, 0.3771091, 1.379424, 0.4039216, 0, 1, 1,
0.6414611, 0.5630981, 0.67859, 0.4117647, 0, 1, 1,
0.6461471, -0.4914773, 2.449661, 0.4156863, 0, 1, 1,
0.6490927, -0.1921193, 3.623309, 0.4235294, 0, 1, 1,
0.6500928, 0.2372378, -0.5622756, 0.427451, 0, 1, 1,
0.6503672, 0.1684353, 1.409151, 0.4352941, 0, 1, 1,
0.6524366, -0.2236694, 2.755425, 0.4392157, 0, 1, 1,
0.6528301, 0.78078, 1.079872, 0.4470588, 0, 1, 1,
0.6816347, 0.3630447, 2.646098, 0.4509804, 0, 1, 1,
0.6829072, -0.4748003, 1.986166, 0.4588235, 0, 1, 1,
0.683678, -0.8815344, 3.579564, 0.4627451, 0, 1, 1,
0.685035, -1.29204, 3.328534, 0.4705882, 0, 1, 1,
0.6900629, -0.364522, 1.920756, 0.4745098, 0, 1, 1,
0.6947119, -0.2407147, 2.93874, 0.4823529, 0, 1, 1,
0.6952378, -0.02935972, 0.2516031, 0.4862745, 0, 1, 1,
0.6962938, -0.09335557, 1.269827, 0.4941176, 0, 1, 1,
0.6968536, -1.265173, 3.734938, 0.5019608, 0, 1, 1,
0.7020162, -0.7892238, 2.055527, 0.5058824, 0, 1, 1,
0.7029825, -0.6757435, 2.441363, 0.5137255, 0, 1, 1,
0.7060984, -0.4093402, 3.097655, 0.5176471, 0, 1, 1,
0.7071851, 1.909741, 1.106479, 0.5254902, 0, 1, 1,
0.7138848, 0.1523001, 1.043318, 0.5294118, 0, 1, 1,
0.7170278, 0.2380273, 1.952548, 0.5372549, 0, 1, 1,
0.7170553, 0.3352275, -0.545337, 0.5411765, 0, 1, 1,
0.7192406, -1.050228, 3.937078, 0.5490196, 0, 1, 1,
0.7230258, -0.4794533, 2.331487, 0.5529412, 0, 1, 1,
0.7245324, 1.365367, 0.769268, 0.5607843, 0, 1, 1,
0.7323344, -1.457711, 0.5972158, 0.5647059, 0, 1, 1,
0.7357789, 0.6977056, 0.2229935, 0.572549, 0, 1, 1,
0.7372639, -0.1311678, 3.116436, 0.5764706, 0, 1, 1,
0.7400964, 0.8351404, 1.63257, 0.5843138, 0, 1, 1,
0.7403298, -0.0605198, 2.523959, 0.5882353, 0, 1, 1,
0.747574, -0.2620735, 4.210712, 0.5960785, 0, 1, 1,
0.7484686, 0.1574323, 1.836625, 0.6039216, 0, 1, 1,
0.7485213, 0.5688479, 0.7673581, 0.6078432, 0, 1, 1,
0.7527019, -0.74837, 1.010208, 0.6156863, 0, 1, 1,
0.7567717, 0.1340941, 0.3758404, 0.6196079, 0, 1, 1,
0.7638708, -1.718824, 2.489319, 0.627451, 0, 1, 1,
0.7694398, -0.7048807, 2.572933, 0.6313726, 0, 1, 1,
0.7754765, 1.646552, 1.005731, 0.6392157, 0, 1, 1,
0.7769172, -0.5552979, 2.128146, 0.6431373, 0, 1, 1,
0.7784157, -0.1487887, 1.946057, 0.6509804, 0, 1, 1,
0.7800584, 0.04721728, 0.9578804, 0.654902, 0, 1, 1,
0.7827749, 0.4926389, 2.008508, 0.6627451, 0, 1, 1,
0.7838304, 1.802605, 1.648169, 0.6666667, 0, 1, 1,
0.7847618, 0.3811956, 1.054312, 0.6745098, 0, 1, 1,
0.786091, -2.069428, 2.200534, 0.6784314, 0, 1, 1,
0.7868237, -1.803493, 2.236654, 0.6862745, 0, 1, 1,
0.7905936, 0.648126, 2.903074, 0.6901961, 0, 1, 1,
0.802973, -0.162986, 1.736578, 0.6980392, 0, 1, 1,
0.8077105, 0.4816802, 0.04481253, 0.7058824, 0, 1, 1,
0.8081914, 1.389982, -0.5533558, 0.7098039, 0, 1, 1,
0.8084884, 0.5687012, -0.4655899, 0.7176471, 0, 1, 1,
0.8096445, 0.6349149, 1.431095, 0.7215686, 0, 1, 1,
0.8096999, 0.742205, 2.036851, 0.7294118, 0, 1, 1,
0.8112166, -0.9860854, 2.112725, 0.7333333, 0, 1, 1,
0.831407, -0.5646188, 1.741474, 0.7411765, 0, 1, 1,
0.8329132, -0.7062952, 4.141201, 0.7450981, 0, 1, 1,
0.8401642, 0.4905016, 0.3054464, 0.7529412, 0, 1, 1,
0.8421068, -0.9949151, 3.225518, 0.7568628, 0, 1, 1,
0.8433449, 0.5747074, 1.874588, 0.7647059, 0, 1, 1,
0.8470262, -1.062338, 2.505549, 0.7686275, 0, 1, 1,
0.8504905, -0.4709079, 1.461865, 0.7764706, 0, 1, 1,
0.8517358, 0.466377, -0.9934946, 0.7803922, 0, 1, 1,
0.8534095, 1.244033, 0.6055227, 0.7882353, 0, 1, 1,
0.854369, -0.2385771, 0.6420271, 0.7921569, 0, 1, 1,
0.8547109, 0.6449268, 0.7042791, 0.8, 0, 1, 1,
0.8603982, -1.35936, 1.743526, 0.8078431, 0, 1, 1,
0.8608068, -0.1045322, 1.047879, 0.8117647, 0, 1, 1,
0.8625804, -0.4502239, 3.267391, 0.8196079, 0, 1, 1,
0.8657991, -0.9422053, 4.190327, 0.8235294, 0, 1, 1,
0.8793516, -0.9385221, 3.196848, 0.8313726, 0, 1, 1,
0.8796162, -0.1476942, 1.99031, 0.8352941, 0, 1, 1,
0.8815679, 0.7026626, 1.65199, 0.8431373, 0, 1, 1,
0.8839417, -1.445944, 1.821286, 0.8470588, 0, 1, 1,
0.8856572, 0.2202373, 1.250436, 0.854902, 0, 1, 1,
0.8895407, -1.365952, 4.182815, 0.8588235, 0, 1, 1,
0.8912209, 1.073057, -0.2927739, 0.8666667, 0, 1, 1,
0.8967348, -0.9391161, 3.568583, 0.8705882, 0, 1, 1,
0.903745, 1.209209, 1.03016, 0.8784314, 0, 1, 1,
0.9099514, 1.106918, -0.2626443, 0.8823529, 0, 1, 1,
0.9159044, -0.6713728, -0.02417844, 0.8901961, 0, 1, 1,
0.9164501, -0.6584597, 2.383482, 0.8941177, 0, 1, 1,
0.91655, 1.264303, 0.9776976, 0.9019608, 0, 1, 1,
0.9248747, 1.200917, 0.8016897, 0.9098039, 0, 1, 1,
0.926378, 0.5868903, 1.713625, 0.9137255, 0, 1, 1,
0.9295604, -0.5693008, 2.357903, 0.9215686, 0, 1, 1,
0.9309935, 0.06199528, 2.535661, 0.9254902, 0, 1, 1,
0.9401033, -0.3175887, 1.989979, 0.9333333, 0, 1, 1,
0.9403877, -0.1735675, 1.138127, 0.9372549, 0, 1, 1,
0.9408978, 0.5948654, -0.1489491, 0.945098, 0, 1, 1,
0.9481022, -1.140103, 1.549745, 0.9490196, 0, 1, 1,
0.9485011, -0.3957164, 1.344891, 0.9568627, 0, 1, 1,
0.9536806, -0.4295277, 0.9779186, 0.9607843, 0, 1, 1,
0.9544506, -0.1294758, 3.006935, 0.9686275, 0, 1, 1,
0.9564323, 0.7263398, 2.115109, 0.972549, 0, 1, 1,
0.9699716, 1.21279, 2.366158, 0.9803922, 0, 1, 1,
0.9704713, -0.1672824, 2.068884, 0.9843137, 0, 1, 1,
0.9867737, -0.4488275, 2.027439, 0.9921569, 0, 1, 1,
0.9875831, 0.8280206, 1.134775, 0.9960784, 0, 1, 1,
0.9907357, 1.705975, 1.618187, 1, 0, 0.9960784, 1,
0.9927011, 0.7838876, 1.112923, 1, 0, 0.9882353, 1,
0.9961399, -0.4785084, 1.15751, 1, 0, 0.9843137, 1,
1.002705, -1.226238, 1.528287, 1, 0, 0.9764706, 1,
1.00479, 0.8964052, 0.9087192, 1, 0, 0.972549, 1,
1.004893, -0.6761915, 0.9015117, 1, 0, 0.9647059, 1,
1.014919, -0.1928216, 2.996737, 1, 0, 0.9607843, 1,
1.018939, 0.88508, -1.172739, 1, 0, 0.9529412, 1,
1.0194, 0.7125909, 1.673887, 1, 0, 0.9490196, 1,
1.021242, 1.402717, 1.665427, 1, 0, 0.9411765, 1,
1.030812, 1.265926, 0.6632428, 1, 0, 0.9372549, 1,
1.033704, -0.8459632, 1.997464, 1, 0, 0.9294118, 1,
1.03527, -0.240438, 1.617892, 1, 0, 0.9254902, 1,
1.039359, -1.162996, 0.7835259, 1, 0, 0.9176471, 1,
1.043182, -0.1313511, 1.037122, 1, 0, 0.9137255, 1,
1.046227, 0.8168398, 2.445469, 1, 0, 0.9058824, 1,
1.054901, -0.00789415, -0.4329582, 1, 0, 0.9019608, 1,
1.065115, -0.9407948, 2.480527, 1, 0, 0.8941177, 1,
1.06838, -0.7717988, 1.492062, 1, 0, 0.8862745, 1,
1.071123, -1.231246, 2.190765, 1, 0, 0.8823529, 1,
1.072019, -0.9594186, 2.241148, 1, 0, 0.8745098, 1,
1.073378, -0.03060176, 1.248216, 1, 0, 0.8705882, 1,
1.074317, -0.3481041, 3.657316, 1, 0, 0.8627451, 1,
1.075227, 0.3696752, 0.5819972, 1, 0, 0.8588235, 1,
1.084239, 1.436082, 2.129189, 1, 0, 0.8509804, 1,
1.09465, 0.8867421, 2.932776, 1, 0, 0.8470588, 1,
1.09548, -1.09352, 3.76477, 1, 0, 0.8392157, 1,
1.096354, 0.6141649, 2.140679, 1, 0, 0.8352941, 1,
1.099555, 0.8542014, 0.999045, 1, 0, 0.827451, 1,
1.10463, 0.1959863, 0.6028786, 1, 0, 0.8235294, 1,
1.107599, -1.510279, 2.833398, 1, 0, 0.8156863, 1,
1.127413, -1.443882, 1.75982, 1, 0, 0.8117647, 1,
1.127577, 0.2963724, 1.406649, 1, 0, 0.8039216, 1,
1.137459, -0.03097892, 0.6547151, 1, 0, 0.7960784, 1,
1.137845, -0.1234223, 1.26693, 1, 0, 0.7921569, 1,
1.139194, -1.331746, 2.300379, 1, 0, 0.7843137, 1,
1.141952, -1.208783, 1.929015, 1, 0, 0.7803922, 1,
1.144164, 0.05910481, 1.786982, 1, 0, 0.772549, 1,
1.145227, -0.2004282, 3.086679, 1, 0, 0.7686275, 1,
1.147314, 0.6700066, 0.7049459, 1, 0, 0.7607843, 1,
1.152798, 0.7619196, 0.1084467, 1, 0, 0.7568628, 1,
1.153816, 2.011516, 1.962298, 1, 0, 0.7490196, 1,
1.162613, -0.6358331, 2.782967, 1, 0, 0.7450981, 1,
1.166728, -0.20012, 1.192583, 1, 0, 0.7372549, 1,
1.17036, 0.1281981, 2.446678, 1, 0, 0.7333333, 1,
1.172792, 0.1321643, 1.207857, 1, 0, 0.7254902, 1,
1.173558, -1.211158, 0.2045809, 1, 0, 0.7215686, 1,
1.177267, -1.728974, 4.078927, 1, 0, 0.7137255, 1,
1.178855, -0.1051941, 2.341361, 1, 0, 0.7098039, 1,
1.179614, -0.6102075, 2.897234, 1, 0, 0.7019608, 1,
1.185054, -0.01976885, 0.6630149, 1, 0, 0.6941177, 1,
1.185537, -0.8730785, 1.177638, 1, 0, 0.6901961, 1,
1.188606, 0.1836661, 2.02956, 1, 0, 0.682353, 1,
1.191683, -0.1477255, 2.76126, 1, 0, 0.6784314, 1,
1.197002, -0.5516464, 2.066753, 1, 0, 0.6705883, 1,
1.197301, -0.2425525, 3.084634, 1, 0, 0.6666667, 1,
1.198034, -1.239902, 2.473859, 1, 0, 0.6588235, 1,
1.203074, 1.156733, 0.1462914, 1, 0, 0.654902, 1,
1.205517, 2.175208, 0.4040541, 1, 0, 0.6470588, 1,
1.206737, -0.00288545, 0.6375936, 1, 0, 0.6431373, 1,
1.207177, -0.3603863, 0.7282506, 1, 0, 0.6352941, 1,
1.216482, 0.2537655, 3.269943, 1, 0, 0.6313726, 1,
1.226389, -2.080228, 1.731525, 1, 0, 0.6235294, 1,
1.227712, 1.140985, 2.380571, 1, 0, 0.6196079, 1,
1.232554, -0.2962444, 3.900973, 1, 0, 0.6117647, 1,
1.234571, 0.4243546, 3.079324, 1, 0, 0.6078432, 1,
1.248264, -1.521692, 3.384703, 1, 0, 0.6, 1,
1.254281, -3.326138, 2.103185, 1, 0, 0.5921569, 1,
1.257391, -1.02544, 3.80262, 1, 0, 0.5882353, 1,
1.26535, -1.195259, 2.029592, 1, 0, 0.5803922, 1,
1.268918, -0.3360516, 2.396805, 1, 0, 0.5764706, 1,
1.272699, 0.7299523, 1.779163, 1, 0, 0.5686275, 1,
1.280574, -0.5558072, 2.782505, 1, 0, 0.5647059, 1,
1.282922, -1.345306, 2.251153, 1, 0, 0.5568628, 1,
1.284849, -0.7057206, 0.822495, 1, 0, 0.5529412, 1,
1.2882, 1.486973, 1.231409, 1, 0, 0.5450981, 1,
1.288273, -0.1231771, 2.018547, 1, 0, 0.5411765, 1,
1.293182, 1.661256, 1.757036, 1, 0, 0.5333334, 1,
1.297441, 0.5822567, -0.5796593, 1, 0, 0.5294118, 1,
1.302542, -2.034237, 3.071764, 1, 0, 0.5215687, 1,
1.305019, -0.307921, 2.066865, 1, 0, 0.5176471, 1,
1.305465, 0.4067071, 1.528811, 1, 0, 0.509804, 1,
1.312669, -0.01883637, 1.508413, 1, 0, 0.5058824, 1,
1.31916, 0.06574807, 0.9499362, 1, 0, 0.4980392, 1,
1.324163, 0.6988687, 1.301314, 1, 0, 0.4901961, 1,
1.324591, 1.705568, -0.8253415, 1, 0, 0.4862745, 1,
1.325137, -0.008357828, 1.886034, 1, 0, 0.4784314, 1,
1.327803, -0.5055705, 2.063621, 1, 0, 0.4745098, 1,
1.332366, -1.138867, 1.244957, 1, 0, 0.4666667, 1,
1.339435, 0.3258787, 1.093932, 1, 0, 0.4627451, 1,
1.339738, 1.506648, 0.8000506, 1, 0, 0.454902, 1,
1.351927, 0.9838877, 2.28082, 1, 0, 0.4509804, 1,
1.363231, 0.7961746, 0.2090347, 1, 0, 0.4431373, 1,
1.372329, -0.1679847, 0.2259195, 1, 0, 0.4392157, 1,
1.385808, 2.72177, 1.731972, 1, 0, 0.4313726, 1,
1.391148, -0.2832743, 2.334887, 1, 0, 0.427451, 1,
1.391888, 1.11028, 0.4592015, 1, 0, 0.4196078, 1,
1.399695, -0.5457462, 1.024791, 1, 0, 0.4156863, 1,
1.412468, -0.1499188, 3.171439, 1, 0, 0.4078431, 1,
1.419243, -0.1396067, 1.373177, 1, 0, 0.4039216, 1,
1.445285, 0.4123688, 0.3290719, 1, 0, 0.3960784, 1,
1.445807, -0.2078296, 2.570275, 1, 0, 0.3882353, 1,
1.446271, 1.569413, -0.1264888, 1, 0, 0.3843137, 1,
1.447747, -0.422355, 2.17419, 1, 0, 0.3764706, 1,
1.4509, -1.013228, 1.022875, 1, 0, 0.372549, 1,
1.452206, 0.490025, 2.745527, 1, 0, 0.3647059, 1,
1.460369, 0.3605293, 1.152586, 1, 0, 0.3607843, 1,
1.461222, -0.6230987, 0.8503402, 1, 0, 0.3529412, 1,
1.465964, -0.5035684, 0.2759622, 1, 0, 0.3490196, 1,
1.466093, -0.2705353, 2.040292, 1, 0, 0.3411765, 1,
1.477125, 0.1980178, 1.499622, 1, 0, 0.3372549, 1,
1.484223, -0.3567816, 3.622746, 1, 0, 0.3294118, 1,
1.484756, 0.5745911, 0.6838994, 1, 0, 0.3254902, 1,
1.515542, 0.7892808, 1.519509, 1, 0, 0.3176471, 1,
1.519917, -0.8812804, 1.728633, 1, 0, 0.3137255, 1,
1.520469, -0.2209729, 0.3436039, 1, 0, 0.3058824, 1,
1.525939, -0.3148305, 2.955622, 1, 0, 0.2980392, 1,
1.52959, 1.847349, 0.9386322, 1, 0, 0.2941177, 1,
1.531573, -0.802704, 3.263491, 1, 0, 0.2862745, 1,
1.543874, -1.011005, 1.694686, 1, 0, 0.282353, 1,
1.566829, -0.4913491, 4.357986, 1, 0, 0.2745098, 1,
1.567624, 0.0515078, 1.279934, 1, 0, 0.2705882, 1,
1.574402, 0.4003628, 1.23576, 1, 0, 0.2627451, 1,
1.578644, 0.0531204, 1.11904, 1, 0, 0.2588235, 1,
1.602157, -0.9199057, 2.069623, 1, 0, 0.2509804, 1,
1.614155, 0.4663597, 0.339593, 1, 0, 0.2470588, 1,
1.616612, 0.1768157, 0.5220267, 1, 0, 0.2392157, 1,
1.619787, 0.3408032, 1.813396, 1, 0, 0.2352941, 1,
1.624218, 0.9169112, -0.1622582, 1, 0, 0.227451, 1,
1.662653, -0.9637842, 1.423014, 1, 0, 0.2235294, 1,
1.665529, -0.03379648, -1.313286, 1, 0, 0.2156863, 1,
1.666714, 1.041783, -0.5289061, 1, 0, 0.2117647, 1,
1.668271, 0.25189, 1.175875, 1, 0, 0.2039216, 1,
1.700507, 0.328401, 1.821943, 1, 0, 0.1960784, 1,
1.724903, 1.187073, 1.219178, 1, 0, 0.1921569, 1,
1.72907, 0.9675343, 1.317832, 1, 0, 0.1843137, 1,
1.729869, 0.2809058, 1.496027, 1, 0, 0.1803922, 1,
1.731378, -1.467337, 2.391537, 1, 0, 0.172549, 1,
1.758764, -1.165282, 1.659233, 1, 0, 0.1686275, 1,
1.795933, 0.2620344, 1.527837, 1, 0, 0.1607843, 1,
1.876096, -0.2999629, 1.909815, 1, 0, 0.1568628, 1,
1.878485, -1.895772, 1.996625, 1, 0, 0.1490196, 1,
1.889572, 0.4998889, 1.74094, 1, 0, 0.145098, 1,
1.905024, 0.5459563, 2.244568, 1, 0, 0.1372549, 1,
1.927192, -0.01193495, 2.390175, 1, 0, 0.1333333, 1,
1.938538, 0.6145748, 0.3539302, 1, 0, 0.1254902, 1,
1.952698, -0.4183941, 0.5705481, 1, 0, 0.1215686, 1,
1.954362, 2.543504, 1.479653, 1, 0, 0.1137255, 1,
2.005762, -2.180219, 2.689603, 1, 0, 0.1098039, 1,
2.007921, -0.1283691, 1.996857, 1, 0, 0.1019608, 1,
2.01199, -0.5508699, 2.004693, 1, 0, 0.09411765, 1,
2.014021, -1.064812, 0.3457298, 1, 0, 0.09019608, 1,
2.029783, -0.04883317, 1.394298, 1, 0, 0.08235294, 1,
2.061193, -0.9319968, 2.636022, 1, 0, 0.07843138, 1,
2.07494, 0.3117712, 0.7301273, 1, 0, 0.07058824, 1,
2.104841, 0.2356931, 3.151906, 1, 0, 0.06666667, 1,
2.116787, 0.7867939, -1.870779, 1, 0, 0.05882353, 1,
2.123489, 1.461351, -0.2288641, 1, 0, 0.05490196, 1,
2.130459, -1.837898, 1.939724, 1, 0, 0.04705882, 1,
2.163533, -0.5698403, 3.477161, 1, 0, 0.04313726, 1,
2.175098, 0.6191599, 1.848549, 1, 0, 0.03529412, 1,
2.263272, 0.1454122, 0.2406213, 1, 0, 0.03137255, 1,
2.349696, 0.1938319, 3.47006, 1, 0, 0.02352941, 1,
2.382151, -1.491093, 2.310358, 1, 0, 0.01960784, 1,
2.672989, 0.1192325, 0.5147254, 1, 0, 0.01176471, 1,
2.692254, -0.09712674, 2.116676, 1, 0, 0.007843138, 1
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
-0.217098, -4.452295, -7.949184, 0, -0.5, 0.5, 0.5,
-0.217098, -4.452295, -7.949184, 1, -0.5, 0.5, 0.5,
-0.217098, -4.452295, -7.949184, 1, 1.5, 0.5, 0.5,
-0.217098, -4.452295, -7.949184, 0, 1.5, 0.5, 0.5
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
-4.112721, -0.004141927, -7.949184, 0, -0.5, 0.5, 0.5,
-4.112721, -0.004141927, -7.949184, 1, -0.5, 0.5, 0.5,
-4.112721, -0.004141927, -7.949184, 1, 1.5, 0.5, 0.5,
-4.112721, -0.004141927, -7.949184, 0, 1.5, 0.5, 0.5
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
-4.112721, -4.452295, -0.3306005, 0, -0.5, 0.5, 0.5,
-4.112721, -4.452295, -0.3306005, 1, -0.5, 0.5, 0.5,
-4.112721, -4.452295, -0.3306005, 1, 1.5, 0.5, 0.5,
-4.112721, -4.452295, -0.3306005, 0, 1.5, 0.5, 0.5
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
-3, -3.425798, -6.19105,
2, -3.425798, -6.19105,
-3, -3.425798, -6.19105,
-3, -3.596881, -6.484072,
-2, -3.425798, -6.19105,
-2, -3.596881, -6.484072,
-1, -3.425798, -6.19105,
-1, -3.596881, -6.484072,
0, -3.425798, -6.19105,
0, -3.596881, -6.484072,
1, -3.425798, -6.19105,
1, -3.596881, -6.484072,
2, -3.425798, -6.19105,
2, -3.596881, -6.484072
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
-3, -3.939046, -7.070117, 0, -0.5, 0.5, 0.5,
-3, -3.939046, -7.070117, 1, -0.5, 0.5, 0.5,
-3, -3.939046, -7.070117, 1, 1.5, 0.5, 0.5,
-3, -3.939046, -7.070117, 0, 1.5, 0.5, 0.5,
-2, -3.939046, -7.070117, 0, -0.5, 0.5, 0.5,
-2, -3.939046, -7.070117, 1, -0.5, 0.5, 0.5,
-2, -3.939046, -7.070117, 1, 1.5, 0.5, 0.5,
-2, -3.939046, -7.070117, 0, 1.5, 0.5, 0.5,
-1, -3.939046, -7.070117, 0, -0.5, 0.5, 0.5,
-1, -3.939046, -7.070117, 1, -0.5, 0.5, 0.5,
-1, -3.939046, -7.070117, 1, 1.5, 0.5, 0.5,
-1, -3.939046, -7.070117, 0, 1.5, 0.5, 0.5,
0, -3.939046, -7.070117, 0, -0.5, 0.5, 0.5,
0, -3.939046, -7.070117, 1, -0.5, 0.5, 0.5,
0, -3.939046, -7.070117, 1, 1.5, 0.5, 0.5,
0, -3.939046, -7.070117, 0, 1.5, 0.5, 0.5,
1, -3.939046, -7.070117, 0, -0.5, 0.5, 0.5,
1, -3.939046, -7.070117, 1, -0.5, 0.5, 0.5,
1, -3.939046, -7.070117, 1, 1.5, 0.5, 0.5,
1, -3.939046, -7.070117, 0, 1.5, 0.5, 0.5,
2, -3.939046, -7.070117, 0, -0.5, 0.5, 0.5,
2, -3.939046, -7.070117, 1, -0.5, 0.5, 0.5,
2, -3.939046, -7.070117, 1, 1.5, 0.5, 0.5,
2, -3.939046, -7.070117, 0, 1.5, 0.5, 0.5
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
-3.213731, -3, -6.19105,
-3.213731, 3, -6.19105,
-3.213731, -3, -6.19105,
-3.363563, -3, -6.484072,
-3.213731, -2, -6.19105,
-3.363563, -2, -6.484072,
-3.213731, -1, -6.19105,
-3.363563, -1, -6.484072,
-3.213731, 0, -6.19105,
-3.363563, 0, -6.484072,
-3.213731, 1, -6.19105,
-3.363563, 1, -6.484072,
-3.213731, 2, -6.19105,
-3.363563, 2, -6.484072,
-3.213731, 3, -6.19105,
-3.363563, 3, -6.484072
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
-3.663226, -3, -7.070117, 0, -0.5, 0.5, 0.5,
-3.663226, -3, -7.070117, 1, -0.5, 0.5, 0.5,
-3.663226, -3, -7.070117, 1, 1.5, 0.5, 0.5,
-3.663226, -3, -7.070117, 0, 1.5, 0.5, 0.5,
-3.663226, -2, -7.070117, 0, -0.5, 0.5, 0.5,
-3.663226, -2, -7.070117, 1, -0.5, 0.5, 0.5,
-3.663226, -2, -7.070117, 1, 1.5, 0.5, 0.5,
-3.663226, -2, -7.070117, 0, 1.5, 0.5, 0.5,
-3.663226, -1, -7.070117, 0, -0.5, 0.5, 0.5,
-3.663226, -1, -7.070117, 1, -0.5, 0.5, 0.5,
-3.663226, -1, -7.070117, 1, 1.5, 0.5, 0.5,
-3.663226, -1, -7.070117, 0, 1.5, 0.5, 0.5,
-3.663226, 0, -7.070117, 0, -0.5, 0.5, 0.5,
-3.663226, 0, -7.070117, 1, -0.5, 0.5, 0.5,
-3.663226, 0, -7.070117, 1, 1.5, 0.5, 0.5,
-3.663226, 0, -7.070117, 0, 1.5, 0.5, 0.5,
-3.663226, 1, -7.070117, 0, -0.5, 0.5, 0.5,
-3.663226, 1, -7.070117, 1, -0.5, 0.5, 0.5,
-3.663226, 1, -7.070117, 1, 1.5, 0.5, 0.5,
-3.663226, 1, -7.070117, 0, 1.5, 0.5, 0.5,
-3.663226, 2, -7.070117, 0, -0.5, 0.5, 0.5,
-3.663226, 2, -7.070117, 1, -0.5, 0.5, 0.5,
-3.663226, 2, -7.070117, 1, 1.5, 0.5, 0.5,
-3.663226, 2, -7.070117, 0, 1.5, 0.5, 0.5,
-3.663226, 3, -7.070117, 0, -0.5, 0.5, 0.5,
-3.663226, 3, -7.070117, 1, -0.5, 0.5, 0.5,
-3.663226, 3, -7.070117, 1, 1.5, 0.5, 0.5,
-3.663226, 3, -7.070117, 0, 1.5, 0.5, 0.5
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
-3.213731, -3.425798, -6,
-3.213731, -3.425798, 4,
-3.213731, -3.425798, -6,
-3.363563, -3.596881, -6,
-3.213731, -3.425798, -4,
-3.363563, -3.596881, -4,
-3.213731, -3.425798, -2,
-3.363563, -3.596881, -2,
-3.213731, -3.425798, 0,
-3.363563, -3.596881, 0,
-3.213731, -3.425798, 2,
-3.363563, -3.596881, 2,
-3.213731, -3.425798, 4,
-3.363563, -3.596881, 4
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
"-6",
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
-3.663226, -3.939046, -6, 0, -0.5, 0.5, 0.5,
-3.663226, -3.939046, -6, 1, -0.5, 0.5, 0.5,
-3.663226, -3.939046, -6, 1, 1.5, 0.5, 0.5,
-3.663226, -3.939046, -6, 0, 1.5, 0.5, 0.5,
-3.663226, -3.939046, -4, 0, -0.5, 0.5, 0.5,
-3.663226, -3.939046, -4, 1, -0.5, 0.5, 0.5,
-3.663226, -3.939046, -4, 1, 1.5, 0.5, 0.5,
-3.663226, -3.939046, -4, 0, 1.5, 0.5, 0.5,
-3.663226, -3.939046, -2, 0, -0.5, 0.5, 0.5,
-3.663226, -3.939046, -2, 1, -0.5, 0.5, 0.5,
-3.663226, -3.939046, -2, 1, 1.5, 0.5, 0.5,
-3.663226, -3.939046, -2, 0, 1.5, 0.5, 0.5,
-3.663226, -3.939046, 0, 0, -0.5, 0.5, 0.5,
-3.663226, -3.939046, 0, 1, -0.5, 0.5, 0.5,
-3.663226, -3.939046, 0, 1, 1.5, 0.5, 0.5,
-3.663226, -3.939046, 0, 0, 1.5, 0.5, 0.5,
-3.663226, -3.939046, 2, 0, -0.5, 0.5, 0.5,
-3.663226, -3.939046, 2, 1, -0.5, 0.5, 0.5,
-3.663226, -3.939046, 2, 1, 1.5, 0.5, 0.5,
-3.663226, -3.939046, 2, 0, 1.5, 0.5, 0.5,
-3.663226, -3.939046, 4, 0, -0.5, 0.5, 0.5,
-3.663226, -3.939046, 4, 1, -0.5, 0.5, 0.5,
-3.663226, -3.939046, 4, 1, 1.5, 0.5, 0.5,
-3.663226, -3.939046, 4, 0, 1.5, 0.5, 0.5
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
-3.213731, -3.425798, -6.19105,
-3.213731, 3.417514, -6.19105,
-3.213731, -3.425798, 5.529849,
-3.213731, 3.417514, 5.529849,
-3.213731, -3.425798, -6.19105,
-3.213731, -3.425798, 5.529849,
-3.213731, 3.417514, -6.19105,
-3.213731, 3.417514, 5.529849,
-3.213731, -3.425798, -6.19105,
2.779535, -3.425798, -6.19105,
-3.213731, -3.425798, 5.529849,
2.779535, -3.425798, 5.529849,
-3.213731, 3.417514, -6.19105,
2.779535, 3.417514, -6.19105,
-3.213731, 3.417514, 5.529849,
2.779535, 3.417514, 5.529849,
2.779535, -3.425798, -6.19105,
2.779535, 3.417514, -6.19105,
2.779535, -3.425798, 5.529849,
2.779535, 3.417514, 5.529849,
2.779535, -3.425798, -6.19105,
2.779535, -3.425798, 5.529849,
2.779535, 3.417514, -6.19105,
2.779535, 3.417514, 5.529849
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
var radius = 7.922544;
var distance = 35.24829;
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
mvMatrix.translate( 0.217098, 0.004141927, 0.3306005 );
mvMatrix.scale( 1.429273, 1.251735, 0.7308323 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.24829);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Phenylcarbamic_Acid_<-read.table("Phenylcarbamic_Acid_.xyz", skip=1)
x<-Phenylcarbamic_Acid_$V2
y<-Phenylcarbamic_Acid_$V3
z<-Phenylcarbamic_Acid_$V4
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
8, 4, 2, 0, 0, 1, 1, 1,
6, 11, 1, 1, 0, 0, 1, 1,
3, 10, 1, 1, 0, 0, 1, 1,
5, 8, 1, 1, 0, 0, 1, 1,
2, 12, 1, 1, 0, 0, 1, 1,
1, 9, 1, 1, 0, 0, 1, 1,
1, 7, 1, 0, 0, 0, 1, 1,
3, 6, 1, 0, 0, 0, 1, 1,
4, 6, 1, 0, 0, 0, 1, 1,
4, 5, 1, 0, 0, 0, 1, 1,
7, 3, 1, 0, 0, 0, 1, 1,
7, 1, 1, 0, 0, 0, 1, 1,
4, 2, 1, 0, 0, 0, 1, 1,
1, 1, 1, 1, 1, 1, 1, 1,
1, 3, 1, 1, 1, 1, 1, 1
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
var radius = 8.851412;
var distance = 31.09021;
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
mvMatrix.translate( -4.5, -6.5, -1.5 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -31.09021);
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
for (var i = 0; i < 15; i++) {
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
