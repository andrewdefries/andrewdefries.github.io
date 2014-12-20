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
-2.866961, 0.6524453, -1.930598, 1, 0, 0, 1,
-2.866204, 0.3678891, -2.47452, 1, 0.007843138, 0, 1,
-2.812169, 1.104914, -1.918799, 1, 0.01176471, 0, 1,
-2.784234, -0.8168688, -1.825868, 1, 0.01960784, 0, 1,
-2.783173, 0.4963554, -1.040085, 1, 0.02352941, 0, 1,
-2.738778, -0.03515406, -1.620194, 1, 0.03137255, 0, 1,
-2.723789, -0.8596749, -2.498683, 1, 0.03529412, 0, 1,
-2.692802, -0.5167074, -1.127708, 1, 0.04313726, 0, 1,
-2.620962, -1.982009, -2.52268, 1, 0.04705882, 0, 1,
-2.605917, -0.2525768, -2.336879, 1, 0.05490196, 0, 1,
-2.397041, -0.2269066, -1.04006, 1, 0.05882353, 0, 1,
-2.281854, 0.4973961, -1.925018, 1, 0.06666667, 0, 1,
-2.28181, -2.148561, -2.687074, 1, 0.07058824, 0, 1,
-2.27185, 0.8704391, -1.63776, 1, 0.07843138, 0, 1,
-2.256406, -1.587809, -2.621655, 1, 0.08235294, 0, 1,
-2.169543, -0.8725685, -2.559068, 1, 0.09019608, 0, 1,
-2.161654, 0.08852636, -1.995639, 1, 0.09411765, 0, 1,
-2.133958, -0.6751621, -2.356453, 1, 0.1019608, 0, 1,
-2.101829, 0.4386894, -2.576209, 1, 0.1098039, 0, 1,
-2.0632, -1.426526, -2.894151, 1, 0.1137255, 0, 1,
-2.021417, 0.3463521, -0.9033012, 1, 0.1215686, 0, 1,
-1.98336, 1.423817, -1.221152, 1, 0.1254902, 0, 1,
-1.962926, 1.107999, -0.1984319, 1, 0.1333333, 0, 1,
-1.962868, -0.6224881, -1.793081, 1, 0.1372549, 0, 1,
-1.960293, -0.1476331, -2.820974, 1, 0.145098, 0, 1,
-1.937183, -0.1548233, -4.509974, 1, 0.1490196, 0, 1,
-1.93657, 0.1265097, -1.493166, 1, 0.1568628, 0, 1,
-1.92203, 0.5353639, -1.99391, 1, 0.1607843, 0, 1,
-1.916634, 1.399459, 0.03745453, 1, 0.1686275, 0, 1,
-1.896013, -0.1715417, -1.611484, 1, 0.172549, 0, 1,
-1.880111, -0.3331896, -1.568944, 1, 0.1803922, 0, 1,
-1.878131, 1.001471, -1.910183, 1, 0.1843137, 0, 1,
-1.826436, 0.6494344, -3.425853, 1, 0.1921569, 0, 1,
-1.817077, -1.172241, -0.9910357, 1, 0.1960784, 0, 1,
-1.795691, -1.994261, -3.413183, 1, 0.2039216, 0, 1,
-1.795323, -0.05164674, -1.056015, 1, 0.2117647, 0, 1,
-1.790511, 0.05004595, -1.254904, 1, 0.2156863, 0, 1,
-1.781356, -0.8984174, -3.02458, 1, 0.2235294, 0, 1,
-1.775322, 0.4979952, -1.614581, 1, 0.227451, 0, 1,
-1.76843, -0.2389298, -0.3115836, 1, 0.2352941, 0, 1,
-1.76087, 0.07312351, -1.167165, 1, 0.2392157, 0, 1,
-1.759693, 0.7918816, -2.930173, 1, 0.2470588, 0, 1,
-1.751376, 1.214819, -0.3857011, 1, 0.2509804, 0, 1,
-1.741434, -1.283338, -2.25789, 1, 0.2588235, 0, 1,
-1.737867, 0.05787708, -1.254066, 1, 0.2627451, 0, 1,
-1.727938, -1.012812, -3.005023, 1, 0.2705882, 0, 1,
-1.7264, 0.5547929, -1.754299, 1, 0.2745098, 0, 1,
-1.709246, 0.3722127, -1.991358, 1, 0.282353, 0, 1,
-1.706649, -0.2184415, -1.447571, 1, 0.2862745, 0, 1,
-1.704731, 1.552467, -1.284529, 1, 0.2941177, 0, 1,
-1.702885, -0.5862896, -0.2780155, 1, 0.3019608, 0, 1,
-1.688486, -0.4273554, -3.053008, 1, 0.3058824, 0, 1,
-1.685832, 0.8237144, -2.122922, 1, 0.3137255, 0, 1,
-1.67668, 0.1131257, -1.676097, 1, 0.3176471, 0, 1,
-1.662428, 0.5107378, -2.123772, 1, 0.3254902, 0, 1,
-1.661918, 0.2718488, -2.269653, 1, 0.3294118, 0, 1,
-1.657307, -0.4169521, -0.7402647, 1, 0.3372549, 0, 1,
-1.653112, 0.5598728, -1.586867, 1, 0.3411765, 0, 1,
-1.651067, -1.153053, -3.567233, 1, 0.3490196, 0, 1,
-1.644352, 1.1535, -1.580325, 1, 0.3529412, 0, 1,
-1.639175, 0.9900027, -2.637191, 1, 0.3607843, 0, 1,
-1.635591, -0.9468957, -3.019629, 1, 0.3647059, 0, 1,
-1.632569, -0.7668042, -1.861853, 1, 0.372549, 0, 1,
-1.618575, -0.3486369, -2.388773, 1, 0.3764706, 0, 1,
-1.607981, -1.969864, -3.047096, 1, 0.3843137, 0, 1,
-1.606977, 0.901244, -0.05192898, 1, 0.3882353, 0, 1,
-1.603155, 0.6981208, -0.3469733, 1, 0.3960784, 0, 1,
-1.57183, -0.5765662, -1.327322, 1, 0.4039216, 0, 1,
-1.569377, 1.312551, -1.349392, 1, 0.4078431, 0, 1,
-1.564489, 0.509935, -2.681555, 1, 0.4156863, 0, 1,
-1.555246, -1.00876, -2.298021, 1, 0.4196078, 0, 1,
-1.55313, 0.2657022, -0.2748493, 1, 0.427451, 0, 1,
-1.547588, -1.302225, -2.951088, 1, 0.4313726, 0, 1,
-1.542663, 1.06024, -1.107392, 1, 0.4392157, 0, 1,
-1.534476, -1.044876, -1.872966, 1, 0.4431373, 0, 1,
-1.526159, 0.6271072, -2.009159, 1, 0.4509804, 0, 1,
-1.513224, -1.75678, -2.591211, 1, 0.454902, 0, 1,
-1.505421, 0.3081028, -1.062979, 1, 0.4627451, 0, 1,
-1.503499, -0.4418976, -2.785599, 1, 0.4666667, 0, 1,
-1.50123, -2.172399, -3.333582, 1, 0.4745098, 0, 1,
-1.490778, -1.092482, -3.755737, 1, 0.4784314, 0, 1,
-1.488671, 1.323614, -0.9328551, 1, 0.4862745, 0, 1,
-1.476059, -1.748224, -1.975857, 1, 0.4901961, 0, 1,
-1.471501, 0.5080075, -1.187758, 1, 0.4980392, 0, 1,
-1.465832, 0.9778028, -0.3674042, 1, 0.5058824, 0, 1,
-1.455727, -1.823194, -3.051086, 1, 0.509804, 0, 1,
-1.455604, 0.2334428, -0.8654872, 1, 0.5176471, 0, 1,
-1.451808, -1.624195, -2.123566, 1, 0.5215687, 0, 1,
-1.451106, -1.409922, -2.171617, 1, 0.5294118, 0, 1,
-1.448162, -0.6985554, -3.800494, 1, 0.5333334, 0, 1,
-1.44065, 1.600345, -0.496473, 1, 0.5411765, 0, 1,
-1.437732, -1.244715, -2.52004, 1, 0.5450981, 0, 1,
-1.437651, 1.772053, -1.598474, 1, 0.5529412, 0, 1,
-1.424306, -0.270556, -2.72034, 1, 0.5568628, 0, 1,
-1.423646, 0.5946384, 0.1655839, 1, 0.5647059, 0, 1,
-1.41911, -0.6256444, -1.769295, 1, 0.5686275, 0, 1,
-1.411615, 0.9544072, -1.035981, 1, 0.5764706, 0, 1,
-1.401643, 1.247755, -0.764239, 1, 0.5803922, 0, 1,
-1.399427, 1.59229, 0.3413797, 1, 0.5882353, 0, 1,
-1.392664, -1.133921, -2.220878, 1, 0.5921569, 0, 1,
-1.39051, 1.780821, -1.804372, 1, 0.6, 0, 1,
-1.390278, -1.417993, -3.275118, 1, 0.6078432, 0, 1,
-1.387709, -1.428833, -2.443281, 1, 0.6117647, 0, 1,
-1.385167, -1.460879, -1.611096, 1, 0.6196079, 0, 1,
-1.382915, 0.3680301, -0.6128631, 1, 0.6235294, 0, 1,
-1.375632, 0.9176424, -1.771195, 1, 0.6313726, 0, 1,
-1.348993, -1.299983, -2.353673, 1, 0.6352941, 0, 1,
-1.347728, -0.6965613, -2.400042, 1, 0.6431373, 0, 1,
-1.347645, 1.776387, -1.793551, 1, 0.6470588, 0, 1,
-1.343731, 0.9124743, -2.080406, 1, 0.654902, 0, 1,
-1.343601, 1.006143, -0.4551462, 1, 0.6588235, 0, 1,
-1.343123, -0.1006016, -2.406976, 1, 0.6666667, 0, 1,
-1.338157, 2.148513, -0.8879548, 1, 0.6705883, 0, 1,
-1.335916, -1.5841, -1.990169, 1, 0.6784314, 0, 1,
-1.332304, -2.059068, -3.125132, 1, 0.682353, 0, 1,
-1.330485, -0.4211896, -1.795318, 1, 0.6901961, 0, 1,
-1.328903, 0.8277553, -0.05111944, 1, 0.6941177, 0, 1,
-1.325332, -0.9134753, -2.770454, 1, 0.7019608, 0, 1,
-1.316186, -0.3098305, -2.633272, 1, 0.7098039, 0, 1,
-1.302919, 0.1214911, -0.261865, 1, 0.7137255, 0, 1,
-1.302574, 0.8658444, -0.1760859, 1, 0.7215686, 0, 1,
-1.301157, 1.520016, -1.012695, 1, 0.7254902, 0, 1,
-1.297122, -0.1074969, -1.975682, 1, 0.7333333, 0, 1,
-1.286195, 1.419156, -0.9281864, 1, 0.7372549, 0, 1,
-1.28176, 0.386594, -1.427533, 1, 0.7450981, 0, 1,
-1.280005, 0.04945677, -2.231767, 1, 0.7490196, 0, 1,
-1.279384, -0.771414, -0.4170738, 1, 0.7568628, 0, 1,
-1.266292, -0.3630784, -0.2411931, 1, 0.7607843, 0, 1,
-1.2655, 1.226073, -3.309283, 1, 0.7686275, 0, 1,
-1.258915, 1.113794, -1.389294, 1, 0.772549, 0, 1,
-1.257623, 1.328116, -0.247137, 1, 0.7803922, 0, 1,
-1.257444, 0.326502, -1.030499, 1, 0.7843137, 0, 1,
-1.253961, 1.608505, -1.912265, 1, 0.7921569, 0, 1,
-1.246181, 0.2660847, -1.222205, 1, 0.7960784, 0, 1,
-1.241042, 0.9624771, -2.061709, 1, 0.8039216, 0, 1,
-1.240444, -1.565704, -2.735795, 1, 0.8117647, 0, 1,
-1.236151, 0.4198254, -1.571976, 1, 0.8156863, 0, 1,
-1.235614, -0.665382, -2.744566, 1, 0.8235294, 0, 1,
-1.230687, -0.5408915, -1.886551, 1, 0.827451, 0, 1,
-1.230583, 0.4770896, 0.6326987, 1, 0.8352941, 0, 1,
-1.221894, 0.5277274, -1.577074, 1, 0.8392157, 0, 1,
-1.212891, 0.006581733, -1.786922, 1, 0.8470588, 0, 1,
-1.211529, 0.8121659, -0.6209009, 1, 0.8509804, 0, 1,
-1.205243, -0.6455328, -3.656654, 1, 0.8588235, 0, 1,
-1.204528, -0.3824759, 0.07813938, 1, 0.8627451, 0, 1,
-1.194889, 0.0140684, 0.1121251, 1, 0.8705882, 0, 1,
-1.193614, 0.09875283, -1.639083, 1, 0.8745098, 0, 1,
-1.181433, -0.3249607, -1.469981, 1, 0.8823529, 0, 1,
-1.180261, 0.558486, -0.6623595, 1, 0.8862745, 0, 1,
-1.179754, -1.238478, -3.233898, 1, 0.8941177, 0, 1,
-1.178031, 1.056847, -0.1381324, 1, 0.8980392, 0, 1,
-1.176932, -0.8482139, -3.40179, 1, 0.9058824, 0, 1,
-1.16044, 2.21279, -1.780826, 1, 0.9137255, 0, 1,
-1.159619, 0.8623343, -1.398835, 1, 0.9176471, 0, 1,
-1.151824, 1.206186, -0.5505306, 1, 0.9254902, 0, 1,
-1.146186, -0.7059017, -1.528138, 1, 0.9294118, 0, 1,
-1.143561, 0.1792801, -0.4419337, 1, 0.9372549, 0, 1,
-1.134304, -0.1607938, -3.235799, 1, 0.9411765, 0, 1,
-1.131488, 1.597448, 0.5114827, 1, 0.9490196, 0, 1,
-1.129049, 1.231139, -0.8087463, 1, 0.9529412, 0, 1,
-1.12043, -0.5996002, -1.35735, 1, 0.9607843, 0, 1,
-1.118164, 0.1438318, -2.048402, 1, 0.9647059, 0, 1,
-1.11139, -0.6262716, -2.388308, 1, 0.972549, 0, 1,
-1.101341, -0.1238707, -1.448313, 1, 0.9764706, 0, 1,
-1.100599, 0.3118191, -0.406391, 1, 0.9843137, 0, 1,
-1.099072, 0.7792131, -2.226109, 1, 0.9882353, 0, 1,
-1.097604, -0.9160918, -4.634807, 1, 0.9960784, 0, 1,
-1.088429, 1.59977, -0.4560367, 0.9960784, 1, 0, 1,
-1.08521, 0.647782, -2.938008, 0.9921569, 1, 0, 1,
-1.083782, 0.5593695, -0.3800427, 0.9843137, 1, 0, 1,
-1.08276, -0.8619156, -0.07359917, 0.9803922, 1, 0, 1,
-1.082222, -0.02632761, -1.630761, 0.972549, 1, 0, 1,
-1.081741, -1.854191, -2.576243, 0.9686275, 1, 0, 1,
-1.07871, -1.101606, -2.577, 0.9607843, 1, 0, 1,
-1.074644, 0.2509182, -1.419774, 0.9568627, 1, 0, 1,
-1.068026, -0.1560097, -2.534152, 0.9490196, 1, 0, 1,
-1.057571, -0.3413011, -2.127226, 0.945098, 1, 0, 1,
-1.05042, 1.808135, 1.697321, 0.9372549, 1, 0, 1,
-1.046869, -0.8451152, -1.248489, 0.9333333, 1, 0, 1,
-1.044794, -0.5630532, -1.041966, 0.9254902, 1, 0, 1,
-1.043328, -0.6306134, -1.674822, 0.9215686, 1, 0, 1,
-1.030843, -0.1759601, -2.128365, 0.9137255, 1, 0, 1,
-1.026364, -0.4216661, -1.412071, 0.9098039, 1, 0, 1,
-1.025047, -0.4808374, -3.432637, 0.9019608, 1, 0, 1,
-1.022992, -0.07614792, -2.200694, 0.8941177, 1, 0, 1,
-1.009446, -0.5985278, -1.596939, 0.8901961, 1, 0, 1,
-1.006909, -0.7065316, -2.801219, 0.8823529, 1, 0, 1,
-1.004192, -0.8034992, -3.020415, 0.8784314, 1, 0, 1,
-0.9947116, 1.447961, -0.3540059, 0.8705882, 1, 0, 1,
-0.9868228, -1.233705, -1.706791, 0.8666667, 1, 0, 1,
-0.9831837, -0.07585496, -1.90008, 0.8588235, 1, 0, 1,
-0.9812033, -0.1090337, -2.115232, 0.854902, 1, 0, 1,
-0.9760273, 2.21665, 0.7344739, 0.8470588, 1, 0, 1,
-0.9666553, -0.04294005, -1.838555, 0.8431373, 1, 0, 1,
-0.9658056, -0.5860195, -2.869202, 0.8352941, 1, 0, 1,
-0.9590711, -0.6035926, -1.161354, 0.8313726, 1, 0, 1,
-0.9563439, -0.5546897, -2.912235, 0.8235294, 1, 0, 1,
-0.9550372, -0.8254747, -3.10865, 0.8196079, 1, 0, 1,
-0.9537276, -0.06515053, -2.474962, 0.8117647, 1, 0, 1,
-0.9499707, -0.06490824, -2.008771, 0.8078431, 1, 0, 1,
-0.9437332, -2.18265, -3.441426, 0.8, 1, 0, 1,
-0.9348649, 0.4842644, -1.648821, 0.7921569, 1, 0, 1,
-0.925668, -0.7337154, -1.894099, 0.7882353, 1, 0, 1,
-0.9253798, -0.3037862, 0.3516151, 0.7803922, 1, 0, 1,
-0.9242035, 0.4990013, -0.4267812, 0.7764706, 1, 0, 1,
-0.9214938, -0.1539914, -1.007588, 0.7686275, 1, 0, 1,
-0.917408, 0.01021468, -2.963848, 0.7647059, 1, 0, 1,
-0.915034, 0.003176711, -2.103925, 0.7568628, 1, 0, 1,
-0.914169, -0.6444613, -2.644651, 0.7529412, 1, 0, 1,
-0.9126981, -1.339036, -2.786985, 0.7450981, 1, 0, 1,
-0.9111163, -1.644977, -2.149923, 0.7411765, 1, 0, 1,
-0.9068789, 0.1396352, -3.20647, 0.7333333, 1, 0, 1,
-0.8969235, -1.208038, -1.651201, 0.7294118, 1, 0, 1,
-0.8969139, -0.3713318, -2.76234, 0.7215686, 1, 0, 1,
-0.8964418, 0.0637127, -0.05203317, 0.7176471, 1, 0, 1,
-0.8874547, -0.4575, -0.6943054, 0.7098039, 1, 0, 1,
-0.8843084, 0.423592, -0.75282, 0.7058824, 1, 0, 1,
-0.8709444, 0.3606539, -0.8851449, 0.6980392, 1, 0, 1,
-0.8646492, -1.021524, -4.1966, 0.6901961, 1, 0, 1,
-0.863907, 0.1656282, -0.3872799, 0.6862745, 1, 0, 1,
-0.8557895, -0.3426492, 0.5746818, 0.6784314, 1, 0, 1,
-0.8497872, -0.3791097, -0.450354, 0.6745098, 1, 0, 1,
-0.8439357, 0.1061905, -1.09128, 0.6666667, 1, 0, 1,
-0.8425276, -0.1885725, -2.309842, 0.6627451, 1, 0, 1,
-0.8422366, 0.5459565, -2.313812, 0.654902, 1, 0, 1,
-0.8411123, -1.839922, -3.144887, 0.6509804, 1, 0, 1,
-0.8331383, -0.4952048, -1.955722, 0.6431373, 1, 0, 1,
-0.8303567, 1.959978, 0.8478763, 0.6392157, 1, 0, 1,
-0.8299729, -1.627993, -1.740651, 0.6313726, 1, 0, 1,
-0.8287948, 1.891882, -1.376325, 0.627451, 1, 0, 1,
-0.8260294, -0.1318409, -1.273177, 0.6196079, 1, 0, 1,
-0.8228743, -1.42898, -2.90035, 0.6156863, 1, 0, 1,
-0.8213534, 0.7860001, -0.8281311, 0.6078432, 1, 0, 1,
-0.8199749, -1.378497, -1.992532, 0.6039216, 1, 0, 1,
-0.815671, 1.181423, 0.2121673, 0.5960785, 1, 0, 1,
-0.8146878, 0.06417979, -2.435937, 0.5882353, 1, 0, 1,
-0.8141394, 0.09716725, -1.923781, 0.5843138, 1, 0, 1,
-0.8108849, -0.1841466, -1.980253, 0.5764706, 1, 0, 1,
-0.8056372, 0.526738, -2.093041, 0.572549, 1, 0, 1,
-0.7988871, 0.8498012, 1.820438, 0.5647059, 1, 0, 1,
-0.7927401, 0.3350319, -0.8898069, 0.5607843, 1, 0, 1,
-0.7909086, 0.5166522, -0.3019173, 0.5529412, 1, 0, 1,
-0.7889399, -0.733331, -2.654391, 0.5490196, 1, 0, 1,
-0.7844152, 0.2679015, -2.568405, 0.5411765, 1, 0, 1,
-0.7829263, -2.363166, -3.098738, 0.5372549, 1, 0, 1,
-0.7755929, 0.4676468, -1.495116, 0.5294118, 1, 0, 1,
-0.7744086, -0.2026643, -1.357426, 0.5254902, 1, 0, 1,
-0.7734112, 1.316876, -1.185501, 0.5176471, 1, 0, 1,
-0.7727734, -2.351578, -3.241186, 0.5137255, 1, 0, 1,
-0.7693978, 0.04857283, -0.3164423, 0.5058824, 1, 0, 1,
-0.7640594, -1.631235, -1.183406, 0.5019608, 1, 0, 1,
-0.7616546, 0.4325145, 0.2386943, 0.4941176, 1, 0, 1,
-0.7523241, -2.60001, -3.495367, 0.4862745, 1, 0, 1,
-0.7489089, -1.28529, -2.157462, 0.4823529, 1, 0, 1,
-0.7476746, 1.534488, -1.106503, 0.4745098, 1, 0, 1,
-0.7409898, -1.592769, -1.831925, 0.4705882, 1, 0, 1,
-0.7383265, -0.8276092, -1.232021, 0.4627451, 1, 0, 1,
-0.7312652, 1.538255, -0.443436, 0.4588235, 1, 0, 1,
-0.7290871, 0.5146835, -0.3729988, 0.4509804, 1, 0, 1,
-0.7284477, 1.135912, -0.901292, 0.4470588, 1, 0, 1,
-0.726814, 0.3704294, -0.402112, 0.4392157, 1, 0, 1,
-0.724934, 0.6013784, -0.4151668, 0.4352941, 1, 0, 1,
-0.7242392, -0.756233, -1.477839, 0.427451, 1, 0, 1,
-0.7238079, -1.355631, -2.911059, 0.4235294, 1, 0, 1,
-0.7215147, -0.7443366, -1.924109, 0.4156863, 1, 0, 1,
-0.7190633, 2.781449, -1.567092, 0.4117647, 1, 0, 1,
-0.7185462, -0.5185062, -1.954799, 0.4039216, 1, 0, 1,
-0.7181609, 0.9021388, -0.197859, 0.3960784, 1, 0, 1,
-0.7178204, 0.2005195, -2.213402, 0.3921569, 1, 0, 1,
-0.7170528, 0.2746073, -1.736007, 0.3843137, 1, 0, 1,
-0.7158756, 0.838179, -0.6771379, 0.3803922, 1, 0, 1,
-0.7141873, -0.3914618, -2.681614, 0.372549, 1, 0, 1,
-0.7089132, -1.104688, -3.366791, 0.3686275, 1, 0, 1,
-0.7080939, 0.4866098, -0.7562122, 0.3607843, 1, 0, 1,
-0.6923518, 0.07348097, -0.926452, 0.3568628, 1, 0, 1,
-0.682697, 0.7584081, -1.453101, 0.3490196, 1, 0, 1,
-0.6708267, -0.5053989, -1.685821, 0.345098, 1, 0, 1,
-0.6701186, -0.6448793, -3.233613, 0.3372549, 1, 0, 1,
-0.668407, 0.3062102, -2.812994, 0.3333333, 1, 0, 1,
-0.6670122, -0.1182283, -1.859745, 0.3254902, 1, 0, 1,
-0.6669923, 1.325663, -0.4931784, 0.3215686, 1, 0, 1,
-0.6665242, 0.1995757, -0.746007, 0.3137255, 1, 0, 1,
-0.6618764, 0.3396062, -0.2588766, 0.3098039, 1, 0, 1,
-0.658111, -0.6262589, -1.812304, 0.3019608, 1, 0, 1,
-0.6528608, 0.6257768, 0.6373385, 0.2941177, 1, 0, 1,
-0.6514334, 0.8994309, -1.786761, 0.2901961, 1, 0, 1,
-0.6455808, 1.946484, -0.5200245, 0.282353, 1, 0, 1,
-0.6435966, -0.9037903, -3.758602, 0.2784314, 1, 0, 1,
-0.639733, 0.1526719, -1.997469, 0.2705882, 1, 0, 1,
-0.6390139, 0.4206182, -0.5872053, 0.2666667, 1, 0, 1,
-0.6388855, -0.02839372, -0.04260318, 0.2588235, 1, 0, 1,
-0.6385902, 0.6158341, -0.09133937, 0.254902, 1, 0, 1,
-0.6355861, 0.4110646, -0.261298, 0.2470588, 1, 0, 1,
-0.6351056, -0.7412326, -3.070669, 0.2431373, 1, 0, 1,
-0.6350903, -1.770459, -2.696071, 0.2352941, 1, 0, 1,
-0.6256645, -0.1535355, -2.490352, 0.2313726, 1, 0, 1,
-0.6231399, -0.7671477, -3.656188, 0.2235294, 1, 0, 1,
-0.617778, -0.6006621, -2.979761, 0.2196078, 1, 0, 1,
-0.617251, -1.769571, -2.670919, 0.2117647, 1, 0, 1,
-0.6163073, 1.21313, 0.5383803, 0.2078431, 1, 0, 1,
-0.6141564, -0.1821123, -4.279214, 0.2, 1, 0, 1,
-0.6123746, 1.276366, -0.523714, 0.1921569, 1, 0, 1,
-0.6121438, -1.394506, -1.586575, 0.1882353, 1, 0, 1,
-0.6100212, -0.2930718, -1.380977, 0.1803922, 1, 0, 1,
-0.6073986, 1.808197, 1.723197, 0.1764706, 1, 0, 1,
-0.5993176, -0.4682561, -3.1174, 0.1686275, 1, 0, 1,
-0.5937049, 0.4419916, -1.801762, 0.1647059, 1, 0, 1,
-0.5875644, 0.2482249, -1.731017, 0.1568628, 1, 0, 1,
-0.5857649, -0.251926, -1.754981, 0.1529412, 1, 0, 1,
-0.5856783, 1.410544, -0.6128239, 0.145098, 1, 0, 1,
-0.5843915, -0.3585736, -1.045525, 0.1411765, 1, 0, 1,
-0.583978, 1.430388, 1.119837, 0.1333333, 1, 0, 1,
-0.5835735, 0.1741628, 0.05814394, 0.1294118, 1, 0, 1,
-0.5798258, -1.047684, -2.194396, 0.1215686, 1, 0, 1,
-0.5768976, -0.07528862, -1.936191, 0.1176471, 1, 0, 1,
-0.5545844, 2.308912, -1.505821, 0.1098039, 1, 0, 1,
-0.5474573, 0.6256269, -1.064912, 0.1058824, 1, 0, 1,
-0.5452836, -1.421314, -3.662735, 0.09803922, 1, 0, 1,
-0.5397667, 0.04003023, -2.506079, 0.09019608, 1, 0, 1,
-0.5389381, -0.1058119, -1.849096, 0.08627451, 1, 0, 1,
-0.5387905, 0.6695917, -2.018611, 0.07843138, 1, 0, 1,
-0.5364146, -0.5863771, -2.459318, 0.07450981, 1, 0, 1,
-0.5323418, -0.9202434, -1.418797, 0.06666667, 1, 0, 1,
-0.5228981, -0.02320287, -1.420952, 0.0627451, 1, 0, 1,
-0.5224826, -0.5400902, -1.094184, 0.05490196, 1, 0, 1,
-0.52245, -0.1551577, -2.679451, 0.05098039, 1, 0, 1,
-0.5196565, -0.04358199, -0.2036233, 0.04313726, 1, 0, 1,
-0.5194429, 1.105353, -0.4261806, 0.03921569, 1, 0, 1,
-0.5160751, -0.5807402, -2.288928, 0.03137255, 1, 0, 1,
-0.5160399, -0.1528403, -3.248259, 0.02745098, 1, 0, 1,
-0.5146372, 0.9545463, -1.786152, 0.01960784, 1, 0, 1,
-0.5134062, -1.057318, -2.344517, 0.01568628, 1, 0, 1,
-0.5061704, -0.1594389, -1.797873, 0.007843138, 1, 0, 1,
-0.5057592, 1.767516, -0.3285663, 0.003921569, 1, 0, 1,
-0.5057117, -0.3775109, 0.3692639, 0, 1, 0.003921569, 1,
-0.5024142, -1.417668, -3.588264, 0, 1, 0.01176471, 1,
-0.5023253, -1.64573, -0.09443435, 0, 1, 0.01568628, 1,
-0.499296, 0.04704968, -0.6383465, 0, 1, 0.02352941, 1,
-0.4990475, 0.5867384, -0.7579075, 0, 1, 0.02745098, 1,
-0.4923557, 2.248313, -0.5406432, 0, 1, 0.03529412, 1,
-0.4812704, -0.09924164, -0.7044368, 0, 1, 0.03921569, 1,
-0.475411, -0.5886053, -1.627627, 0, 1, 0.04705882, 1,
-0.4652794, 0.1009186, -0.6901259, 0, 1, 0.05098039, 1,
-0.4650841, 1.029449, -0.523514, 0, 1, 0.05882353, 1,
-0.462351, 1.198433, 0.4244884, 0, 1, 0.0627451, 1,
-0.4556913, 0.6063712, -0.04068217, 0, 1, 0.07058824, 1,
-0.4548925, -2.045096, -1.544617, 0, 1, 0.07450981, 1,
-0.4483119, -0.206949, -0.2583967, 0, 1, 0.08235294, 1,
-0.4426088, -1.660036, -1.513733, 0, 1, 0.08627451, 1,
-0.4421592, 0.2693563, 0.03613865, 0, 1, 0.09411765, 1,
-0.4413116, -1.982607, -2.115348, 0, 1, 0.1019608, 1,
-0.435772, 1.008235, 0.8922816, 0, 1, 0.1058824, 1,
-0.4347246, -0.1142735, -3.431485, 0, 1, 0.1137255, 1,
-0.4332778, 1.117617, -1.139928, 0, 1, 0.1176471, 1,
-0.4295416, 0.6202999, 1.741193, 0, 1, 0.1254902, 1,
-0.4238818, 0.4985082, -1.571554, 0, 1, 0.1294118, 1,
-0.4198952, -0.4434118, -1.810989, 0, 1, 0.1372549, 1,
-0.4147849, 0.3448693, -1.264101, 0, 1, 0.1411765, 1,
-0.4096623, -0.04028598, -1.679521, 0, 1, 0.1490196, 1,
-0.4086938, 1.283916, -0.5041702, 0, 1, 0.1529412, 1,
-0.4070541, 0.06707118, -0.6356647, 0, 1, 0.1607843, 1,
-0.4067023, -0.2175248, -1.117798, 0, 1, 0.1647059, 1,
-0.406215, 1.426751, 0.5724874, 0, 1, 0.172549, 1,
-0.4040008, 0.5558611, -1.940459, 0, 1, 0.1764706, 1,
-0.4003289, 1.48195, -1.046533, 0, 1, 0.1843137, 1,
-0.3996603, -0.7609296, -1.831004, 0, 1, 0.1882353, 1,
-0.3959084, -0.524749, -2.70817, 0, 1, 0.1960784, 1,
-0.3944065, 0.2736161, -1.080252, 0, 1, 0.2039216, 1,
-0.3881963, -0.1153285, -1.430514, 0, 1, 0.2078431, 1,
-0.3860052, 0.5711645, -2.822633, 0, 1, 0.2156863, 1,
-0.3803734, 0.2724056, 1.318486, 0, 1, 0.2196078, 1,
-0.3766155, -0.2756034, -2.970875, 0, 1, 0.227451, 1,
-0.3735466, 0.5014306, -0.50502, 0, 1, 0.2313726, 1,
-0.3722901, 0.004085523, 0.2434441, 0, 1, 0.2392157, 1,
-0.367206, -1.263084, -4.725526, 0, 1, 0.2431373, 1,
-0.3656727, -0.2540436, -0.6340819, 0, 1, 0.2509804, 1,
-0.3637339, -1.458346, -3.790147, 0, 1, 0.254902, 1,
-0.3553514, -0.2782847, -3.171944, 0, 1, 0.2627451, 1,
-0.3550084, -0.5854043, -0.7748585, 0, 1, 0.2666667, 1,
-0.3549522, 0.2368467, 0.354962, 0, 1, 0.2745098, 1,
-0.3541467, 0.8669926, -0.5823033, 0, 1, 0.2784314, 1,
-0.3522401, 0.271459, 0.6915296, 0, 1, 0.2862745, 1,
-0.3441144, -1.41606, -3.047198, 0, 1, 0.2901961, 1,
-0.3423683, 0.3105316, 0.8566743, 0, 1, 0.2980392, 1,
-0.341946, 0.2313525, 0.1353497, 0, 1, 0.3058824, 1,
-0.341713, 2.473276, 0.2062751, 0, 1, 0.3098039, 1,
-0.3396335, 1.887286, 0.1686612, 0, 1, 0.3176471, 1,
-0.3386307, 0.4106288, -2.870743, 0, 1, 0.3215686, 1,
-0.3373471, -0.06643277, -1.709015, 0, 1, 0.3294118, 1,
-0.3354653, -1.146385, -1.937655, 0, 1, 0.3333333, 1,
-0.3348689, 0.110409, -1.963726, 0, 1, 0.3411765, 1,
-0.3343329, -1.219537, -2.010492, 0, 1, 0.345098, 1,
-0.3340694, 0.4802794, -0.7572466, 0, 1, 0.3529412, 1,
-0.3279606, -0.1776441, -2.350034, 0, 1, 0.3568628, 1,
-0.3212143, -0.5091649, -2.901413, 0, 1, 0.3647059, 1,
-0.31604, -1.758237, -3.742756, 0, 1, 0.3686275, 1,
-0.3123832, 0.9360458, 1.899074, 0, 1, 0.3764706, 1,
-0.3122769, -1.185719, -2.317226, 0, 1, 0.3803922, 1,
-0.3043913, 0.3336259, -0.7606291, 0, 1, 0.3882353, 1,
-0.2960145, -0.1784899, -3.505974, 0, 1, 0.3921569, 1,
-0.2842681, 0.9312395, -0.4000844, 0, 1, 0.4, 1,
-0.2835835, -0.6617172, -2.713983, 0, 1, 0.4078431, 1,
-0.2829094, 0.8240012, -0.8866866, 0, 1, 0.4117647, 1,
-0.2817413, 0.8620578, 0.6520672, 0, 1, 0.4196078, 1,
-0.2815838, -0.3002223, -0.195616, 0, 1, 0.4235294, 1,
-0.2779096, -0.6421816, -3.168515, 0, 1, 0.4313726, 1,
-0.2760395, -0.5209001, -2.590526, 0, 1, 0.4352941, 1,
-0.2753731, -1.165526, -3.286439, 0, 1, 0.4431373, 1,
-0.2673026, -0.3338324, -2.254004, 0, 1, 0.4470588, 1,
-0.2658115, -2.286033, -4.422644, 0, 1, 0.454902, 1,
-0.2657733, 0.9574535, 1.601023, 0, 1, 0.4588235, 1,
-0.2635976, -1.296636, -4.685505, 0, 1, 0.4666667, 1,
-0.2635537, 2.20326, 0.9211603, 0, 1, 0.4705882, 1,
-0.2634866, 0.3958909, 1.033869, 0, 1, 0.4784314, 1,
-0.2614267, 0.4413038, -1.513108, 0, 1, 0.4823529, 1,
-0.2593709, -0.02366043, -1.456899, 0, 1, 0.4901961, 1,
-0.254963, 0.1698776, -2.338191, 0, 1, 0.4941176, 1,
-0.2512579, 1.762552, 0.09575345, 0, 1, 0.5019608, 1,
-0.2486835, -0.2939375, -2.72797, 0, 1, 0.509804, 1,
-0.2439287, -1.849694, -2.229299, 0, 1, 0.5137255, 1,
-0.2410948, -1.820548, -4.344841, 0, 1, 0.5215687, 1,
-0.2391749, -0.0381178, -1.650148, 0, 1, 0.5254902, 1,
-0.2388036, -0.2390705, -2.788093, 0, 1, 0.5333334, 1,
-0.234419, 0.4005605, 0.9250025, 0, 1, 0.5372549, 1,
-0.2330292, 0.1536326, -0.3297425, 0, 1, 0.5450981, 1,
-0.2323643, -0.6595589, -3.617201, 0, 1, 0.5490196, 1,
-0.2321168, 0.7517057, -1.075325, 0, 1, 0.5568628, 1,
-0.2255872, 1.216375, -1.115489, 0, 1, 0.5607843, 1,
-0.2253235, -1.096498, -2.587539, 0, 1, 0.5686275, 1,
-0.2204481, 1.339357, 0.7407345, 0, 1, 0.572549, 1,
-0.2184662, -1.737582, -3.772348, 0, 1, 0.5803922, 1,
-0.2147734, -0.20276, -2.228533, 0, 1, 0.5843138, 1,
-0.2135043, 1.372524, -0.6069036, 0, 1, 0.5921569, 1,
-0.2122456, 1.462032, -0.4336681, 0, 1, 0.5960785, 1,
-0.2082901, 1.279406, -0.8038396, 0, 1, 0.6039216, 1,
-0.2055875, -1.594815, -4.071992, 0, 1, 0.6117647, 1,
-0.2049836, 1.503125, 1.452091, 0, 1, 0.6156863, 1,
-0.2025041, 0.3851923, 0.0001083658, 0, 1, 0.6235294, 1,
-0.1990856, -0.05041289, -0.844846, 0, 1, 0.627451, 1,
-0.1982246, -0.299203, -2.049395, 0, 1, 0.6352941, 1,
-0.18755, -0.3177176, -1.666305, 0, 1, 0.6392157, 1,
-0.1854233, 0.3921958, -0.3088516, 0, 1, 0.6470588, 1,
-0.18218, 0.8200287, -0.4108518, 0, 1, 0.6509804, 1,
-0.1821561, 2.446698, 0.449331, 0, 1, 0.6588235, 1,
-0.1811709, 0.8841746, 0.2012592, 0, 1, 0.6627451, 1,
-0.1790327, -0.1765074, -2.226766, 0, 1, 0.6705883, 1,
-0.1777018, -0.2460988, -2.977149, 0, 1, 0.6745098, 1,
-0.1764643, -1.076017, -3.536804, 0, 1, 0.682353, 1,
-0.170867, -0.171439, -1.488412, 0, 1, 0.6862745, 1,
-0.1697934, -0.5249456, -2.634689, 0, 1, 0.6941177, 1,
-0.1678324, -0.7540265, -1.74405, 0, 1, 0.7019608, 1,
-0.164911, -1.881146, -3.3951, 0, 1, 0.7058824, 1,
-0.1636754, -0.3972073, -4.254143, 0, 1, 0.7137255, 1,
-0.1602432, -0.7657616, -3.424208, 0, 1, 0.7176471, 1,
-0.1600698, 0.4826763, -0.667451, 0, 1, 0.7254902, 1,
-0.159264, -0.1073649, -1.562948, 0, 1, 0.7294118, 1,
-0.1549035, 0.6116228, -0.7444766, 0, 1, 0.7372549, 1,
-0.1531241, 1.615731, -0.2243834, 0, 1, 0.7411765, 1,
-0.1517612, -0.3108851, -3.505971, 0, 1, 0.7490196, 1,
-0.1500056, -2.567567, -3.439483, 0, 1, 0.7529412, 1,
-0.1489004, 0.2278372, 0.009524954, 0, 1, 0.7607843, 1,
-0.1459144, 1.012883, 1.24316, 0, 1, 0.7647059, 1,
-0.144808, 1.144938, 0.3299449, 0, 1, 0.772549, 1,
-0.1432388, 0.6654009, 1.324471, 0, 1, 0.7764706, 1,
-0.1372867, -1.551269, -3.094816, 0, 1, 0.7843137, 1,
-0.1274601, 1.075073, -1.109055, 0, 1, 0.7882353, 1,
-0.1234072, 0.644637, 0.3973742, 0, 1, 0.7960784, 1,
-0.1232159, -0.4470771, -3.00424, 0, 1, 0.8039216, 1,
-0.1190608, 0.6658244, 0.6460811, 0, 1, 0.8078431, 1,
-0.1183261, 0.5633236, -1.125921, 0, 1, 0.8156863, 1,
-0.1156434, -0.3160855, -3.106486, 0, 1, 0.8196079, 1,
-0.1134128, -1.06334, -4.56645, 0, 1, 0.827451, 1,
-0.1112928, 0.140305, -1.493158, 0, 1, 0.8313726, 1,
-0.1106942, -0.4004708, -2.690085, 0, 1, 0.8392157, 1,
-0.1037643, -2.070859, -5.016598, 0, 1, 0.8431373, 1,
-0.1004337, -1.641966, -3.427844, 0, 1, 0.8509804, 1,
-0.09509695, 0.937279, 0.002639838, 0, 1, 0.854902, 1,
-0.08999904, 4.439085, -0.9536593, 0, 1, 0.8627451, 1,
-0.08610893, -0.4931765, -3.7457, 0, 1, 0.8666667, 1,
-0.08198473, 2.584437, -1.839915, 0, 1, 0.8745098, 1,
-0.07987092, -0.2083277, -2.768496, 0, 1, 0.8784314, 1,
-0.07433659, 0.4900772, 0.2117205, 0, 1, 0.8862745, 1,
-0.07169288, -0.08078022, -3.411259, 0, 1, 0.8901961, 1,
-0.06831869, -0.2216042, -1.039343, 0, 1, 0.8980392, 1,
-0.06704038, 1.411311, -0.5923106, 0, 1, 0.9058824, 1,
-0.06179447, 0.2952109, -2.069248, 0, 1, 0.9098039, 1,
-0.05821144, 1.552274, -0.7898419, 0, 1, 0.9176471, 1,
-0.05703812, 2.031049, -0.6014013, 0, 1, 0.9215686, 1,
-0.05658741, -0.7987947, -3.529925, 0, 1, 0.9294118, 1,
-0.054752, 0.9056497, -1.398064, 0, 1, 0.9333333, 1,
-0.05356623, 0.09259765, 0.1098452, 0, 1, 0.9411765, 1,
-0.05082608, 0.9042859, 1.138875, 0, 1, 0.945098, 1,
-0.04700068, -0.6289147, -3.202902, 0, 1, 0.9529412, 1,
-0.0469477, 1.128367, 0.03872334, 0, 1, 0.9568627, 1,
-0.04551354, -0.03467033, -2.270377, 0, 1, 0.9647059, 1,
-0.04429182, 2.0495, -0.6149266, 0, 1, 0.9686275, 1,
-0.04234263, -2.296872, -2.805896, 0, 1, 0.9764706, 1,
-0.04178953, -2.045887, -2.634328, 0, 1, 0.9803922, 1,
-0.03999092, 0.2024005, 0.3187003, 0, 1, 0.9882353, 1,
-0.03951431, 0.5259411, 1.499018, 0, 1, 0.9921569, 1,
-0.03591754, -0.7019801, -2.770922, 0, 1, 1, 1,
-0.03511741, -1.407821, -3.522552, 0, 0.9921569, 1, 1,
-0.031442, -0.4062348, -4.979804, 0, 0.9882353, 1, 1,
-0.02489027, -0.06514612, -3.390653, 0, 0.9803922, 1, 1,
-0.02083044, -0.5701759, -2.428659, 0, 0.9764706, 1, 1,
-0.01712111, -0.2018698, -1.400492, 0, 0.9686275, 1, 1,
-0.01578127, 1.112615, -0.02709991, 0, 0.9647059, 1, 1,
-0.007959997, 0.1584432, -1.274541, 0, 0.9568627, 1, 1,
-0.007845474, 0.4608245, -0.1317617, 0, 0.9529412, 1, 1,
-0.006800306, 0.9466154, -1.031711, 0, 0.945098, 1, 1,
-0.0005673908, 0.2135078, 0.07498187, 0, 0.9411765, 1, 1,
0.005149598, 1.935646, -1.046962, 0, 0.9333333, 1, 1,
0.01185059, -0.05534292, 3.63377, 0, 0.9294118, 1, 1,
0.0126712, -0.9387595, 3.028397, 0, 0.9215686, 1, 1,
0.01376805, -1.418389, 2.777974, 0, 0.9176471, 1, 1,
0.01518316, 0.7523519, -1.73283, 0, 0.9098039, 1, 1,
0.01562339, -0.177272, 5.095787, 0, 0.9058824, 1, 1,
0.01794393, 1.61445, -0.4681261, 0, 0.8980392, 1, 1,
0.019307, -0.8046362, 2.300139, 0, 0.8901961, 1, 1,
0.02550622, -0.3636288, 3.665546, 0, 0.8862745, 1, 1,
0.02812297, 0.5773581, -0.1419129, 0, 0.8784314, 1, 1,
0.03154717, -0.5958379, 4.358548, 0, 0.8745098, 1, 1,
0.03180043, -1.393893, 2.682882, 0, 0.8666667, 1, 1,
0.03199361, -2.162794, 4.140313, 0, 0.8627451, 1, 1,
0.03252821, 1.491427, -1.124608, 0, 0.854902, 1, 1,
0.03565904, -0.789699, 3.611386, 0, 0.8509804, 1, 1,
0.0375555, 0.4411505, -0.9704938, 0, 0.8431373, 1, 1,
0.04400745, 0.4233634, -0.2132681, 0, 0.8392157, 1, 1,
0.04741229, -0.6180018, 2.52151, 0, 0.8313726, 1, 1,
0.05002294, -1.076242, 2.859318, 0, 0.827451, 1, 1,
0.05437945, -1.014333, 3.288342, 0, 0.8196079, 1, 1,
0.05954345, -0.02289152, 2.302502, 0, 0.8156863, 1, 1,
0.06336495, 0.8495837, -1.121576, 0, 0.8078431, 1, 1,
0.06390691, 1.297088, 0.1791842, 0, 0.8039216, 1, 1,
0.07366486, 0.2982282, 0.8684299, 0, 0.7960784, 1, 1,
0.07668179, 0.5059432, 1.486945, 0, 0.7882353, 1, 1,
0.07764699, -0.09850433, 3.807529, 0, 0.7843137, 1, 1,
0.0787271, -0.791978, 3.349758, 0, 0.7764706, 1, 1,
0.07877772, -0.9082897, 2.989744, 0, 0.772549, 1, 1,
0.08006497, -0.0276158, 2.507443, 0, 0.7647059, 1, 1,
0.08214547, -0.6513588, 4.236841, 0, 0.7607843, 1, 1,
0.08864664, 2.245941, 0.3881058, 0, 0.7529412, 1, 1,
0.08869731, -1.014844, 3.750859, 0, 0.7490196, 1, 1,
0.08953671, -0.6383069, 4.011991, 0, 0.7411765, 1, 1,
0.09484219, -0.0679872, 2.900129, 0, 0.7372549, 1, 1,
0.09603661, 0.8694269, 2.380758, 0, 0.7294118, 1, 1,
0.1009458, 0.1871961, 0.964458, 0, 0.7254902, 1, 1,
0.1029641, 0.6195474, -0.2951249, 0, 0.7176471, 1, 1,
0.1037556, 0.3499719, 1.534391, 0, 0.7137255, 1, 1,
0.1057136, -0.09197825, 1.929121, 0, 0.7058824, 1, 1,
0.1124151, 0.01197133, 1.037392, 0, 0.6980392, 1, 1,
0.1152844, 0.9592792, 0.5044266, 0, 0.6941177, 1, 1,
0.1159832, 0.8088394, -0.6717438, 0, 0.6862745, 1, 1,
0.1265148, -0.6331237, 3.404087, 0, 0.682353, 1, 1,
0.1297704, 0.8065211, 0.2810785, 0, 0.6745098, 1, 1,
0.1334412, -0.4404496, 2.852456, 0, 0.6705883, 1, 1,
0.1346486, -0.663569, 2.571212, 0, 0.6627451, 1, 1,
0.1360267, 0.5607594, -0.2602752, 0, 0.6588235, 1, 1,
0.1362079, 0.2672566, 1.318197, 0, 0.6509804, 1, 1,
0.1396562, -2.005633, 4.710502, 0, 0.6470588, 1, 1,
0.1398662, 0.2411163, 0.8354596, 0, 0.6392157, 1, 1,
0.1437122, 1.085619, 1.257099, 0, 0.6352941, 1, 1,
0.1443014, -0.1845213, 0.8057418, 0, 0.627451, 1, 1,
0.1444227, -0.7357984, 3.678576, 0, 0.6235294, 1, 1,
0.1478465, 0.8874554, 0.1637063, 0, 0.6156863, 1, 1,
0.1533149, -0.230886, 1.610808, 0, 0.6117647, 1, 1,
0.153438, -0.3816413, 2.624363, 0, 0.6039216, 1, 1,
0.1538858, 0.802326, -0.5064861, 0, 0.5960785, 1, 1,
0.1573998, -0.5155663, 3.831186, 0, 0.5921569, 1, 1,
0.1632919, 0.7507585, 0.8877075, 0, 0.5843138, 1, 1,
0.1637364, 1.634077, 0.525258, 0, 0.5803922, 1, 1,
0.1704693, -0.55586, 0.5607108, 0, 0.572549, 1, 1,
0.1723373, 0.7072553, 1.720633, 0, 0.5686275, 1, 1,
0.1747533, -0.2699736, 4.656919, 0, 0.5607843, 1, 1,
0.1781575, -1.133013, 3.332353, 0, 0.5568628, 1, 1,
0.1798718, -0.4310037, 2.262832, 0, 0.5490196, 1, 1,
0.1816312, -0.1922388, 3.131817, 0, 0.5450981, 1, 1,
0.1827569, -0.2146236, 2.406161, 0, 0.5372549, 1, 1,
0.1828386, 0.4104506, 1.539487, 0, 0.5333334, 1, 1,
0.1864331, 0.4252642, 0.1897159, 0, 0.5254902, 1, 1,
0.189467, 0.06598442, -0.792904, 0, 0.5215687, 1, 1,
0.1898162, -0.6339653, 3.72625, 0, 0.5137255, 1, 1,
0.1905352, -0.03492931, 1.220948, 0, 0.509804, 1, 1,
0.1959579, -1.224856, 3.776382, 0, 0.5019608, 1, 1,
0.1994569, 0.6108492, -1.062718, 0, 0.4941176, 1, 1,
0.2067671, 0.1004432, -0.2487767, 0, 0.4901961, 1, 1,
0.2082815, -0.7848619, 1.214431, 0, 0.4823529, 1, 1,
0.2147986, -0.7109851, 3.579681, 0, 0.4784314, 1, 1,
0.2249254, -0.2038105, 0.02120947, 0, 0.4705882, 1, 1,
0.2276023, -0.1380388, 3.18887, 0, 0.4666667, 1, 1,
0.2277778, -1.626259, 2.275791, 0, 0.4588235, 1, 1,
0.2312993, -1.394901, 1.642881, 0, 0.454902, 1, 1,
0.2314953, 0.2943136, 1.858232, 0, 0.4470588, 1, 1,
0.2316909, 0.2948304, 0.9603383, 0, 0.4431373, 1, 1,
0.2351237, -0.1390354, 3.15794, 0, 0.4352941, 1, 1,
0.2361504, 0.7060304, -0.7108504, 0, 0.4313726, 1, 1,
0.2364408, 0.04038458, 1.79522, 0, 0.4235294, 1, 1,
0.2404467, 0.9382851, 1.598464, 0, 0.4196078, 1, 1,
0.2421543, -0.8010253, 2.185105, 0, 0.4117647, 1, 1,
0.2449712, 0.8642184, -0.5316743, 0, 0.4078431, 1, 1,
0.245174, -1.287453, 3.222645, 0, 0.4, 1, 1,
0.2461012, -1.418484, 2.465025, 0, 0.3921569, 1, 1,
0.246891, 0.1669857, -0.3251016, 0, 0.3882353, 1, 1,
0.247182, 1.119031, -0.5311236, 0, 0.3803922, 1, 1,
0.2492526, 2.265226, -0.3324771, 0, 0.3764706, 1, 1,
0.250203, 0.1452601, 1.819858, 0, 0.3686275, 1, 1,
0.2505881, 0.2547908, 1.353639, 0, 0.3647059, 1, 1,
0.2525169, -1.080245, 3.020724, 0, 0.3568628, 1, 1,
0.2535683, -2.404212, 4.347309, 0, 0.3529412, 1, 1,
0.2568795, 0.09011117, 1.412261, 0, 0.345098, 1, 1,
0.2645067, 1.178116, 1.489849, 0, 0.3411765, 1, 1,
0.2647287, -0.1604451, 2.5305, 0, 0.3333333, 1, 1,
0.267785, 0.1434058, 2.209265, 0, 0.3294118, 1, 1,
0.2684147, 0.7658768, 1.831855, 0, 0.3215686, 1, 1,
0.2714447, 0.4510836, 0.539915, 0, 0.3176471, 1, 1,
0.2757669, 0.3240945, -0.4026357, 0, 0.3098039, 1, 1,
0.2770072, -0.1046648, 1.19894, 0, 0.3058824, 1, 1,
0.2781902, -1.722086, 2.759769, 0, 0.2980392, 1, 1,
0.2922728, -0.726517, 3.175343, 0, 0.2901961, 1, 1,
0.2928213, 2.409721, -0.8199869, 0, 0.2862745, 1, 1,
0.2935507, -1.011153, 4.576902, 0, 0.2784314, 1, 1,
0.2984464, -0.8061296, 3.046597, 0, 0.2745098, 1, 1,
0.3003209, 0.1322096, 1.430671, 0, 0.2666667, 1, 1,
0.3014679, -1.556871, 2.55652, 0, 0.2627451, 1, 1,
0.3015482, 0.3802948, 0.5644524, 0, 0.254902, 1, 1,
0.3048187, -1.255661, 3.381557, 0, 0.2509804, 1, 1,
0.3111149, 0.947829, 0.5441952, 0, 0.2431373, 1, 1,
0.3140681, 0.06785198, 1.186346, 0, 0.2392157, 1, 1,
0.3148514, 0.09321551, 2.084079, 0, 0.2313726, 1, 1,
0.3217308, -0.2325237, 2.912585, 0, 0.227451, 1, 1,
0.3222971, -0.1301455, 0.5443837, 0, 0.2196078, 1, 1,
0.3225581, -0.3921225, 2.296691, 0, 0.2156863, 1, 1,
0.3242742, -0.04647888, 1.061921, 0, 0.2078431, 1, 1,
0.325242, 1.466381, -1.28231, 0, 0.2039216, 1, 1,
0.325827, 0.7420993, -0.8640451, 0, 0.1960784, 1, 1,
0.3288534, -0.9482237, 1.367859, 0, 0.1882353, 1, 1,
0.3315836, -0.6701871, 2.992826, 0, 0.1843137, 1, 1,
0.335057, -1.891726, 4.219373, 0, 0.1764706, 1, 1,
0.3432668, -1.01603, 2.718651, 0, 0.172549, 1, 1,
0.344198, 0.1698499, 2.377149, 0, 0.1647059, 1, 1,
0.3526341, 1.376651, 0.400634, 0, 0.1607843, 1, 1,
0.3555639, 0.8910827, 0.4921532, 0, 0.1529412, 1, 1,
0.3579997, 0.4801492, 0.1079653, 0, 0.1490196, 1, 1,
0.3602976, 2.008192, 1.957199, 0, 0.1411765, 1, 1,
0.3659126, -0.09831042, 2.726326, 0, 0.1372549, 1, 1,
0.3664435, 0.9474843, -0.3038164, 0, 0.1294118, 1, 1,
0.3678616, -0.3029571, 2.55865, 0, 0.1254902, 1, 1,
0.3690318, -0.6330448, 3.144738, 0, 0.1176471, 1, 1,
0.3707232, -0.3994527, 4.617983, 0, 0.1137255, 1, 1,
0.3757935, -1.203963, 3.245988, 0, 0.1058824, 1, 1,
0.3759834, -1.372394, 2.412726, 0, 0.09803922, 1, 1,
0.3771638, 1.598381, 0.08913195, 0, 0.09411765, 1, 1,
0.3802419, 0.7570257, 2.307961, 0, 0.08627451, 1, 1,
0.3843833, -0.8752838, 3.91403, 0, 0.08235294, 1, 1,
0.3895691, 0.1890546, 0.4045011, 0, 0.07450981, 1, 1,
0.3936321, -0.7674206, 5.714293, 0, 0.07058824, 1, 1,
0.3960901, -0.3638075, 2.401074, 0, 0.0627451, 1, 1,
0.3972715, 0.7494376, 1.651699, 0, 0.05882353, 1, 1,
0.3972729, -2.294744, 3.305013, 0, 0.05098039, 1, 1,
0.3975014, -2.676015, 1.661842, 0, 0.04705882, 1, 1,
0.4000522, -0.9673858, 3.990476, 0, 0.03921569, 1, 1,
0.4024754, 2.565798, 1.860871, 0, 0.03529412, 1, 1,
0.4027779, 0.04217371, 2.668893, 0, 0.02745098, 1, 1,
0.4031733, 0.2958028, 0.6461321, 0, 0.02352941, 1, 1,
0.4050648, 1.894929, -0.1881987, 0, 0.01568628, 1, 1,
0.4074696, -0.8152637, 1.797525, 0, 0.01176471, 1, 1,
0.4077145, 0.236003, 1.040092, 0, 0.003921569, 1, 1,
0.4097583, -0.2540257, 3.618451, 0.003921569, 0, 1, 1,
0.4117928, 0.7659907, -0.049054, 0.007843138, 0, 1, 1,
0.4137262, 0.01903281, 2.393666, 0.01568628, 0, 1, 1,
0.4153648, 0.6889915, -0.2438169, 0.01960784, 0, 1, 1,
0.4193219, 1.322696, 1.23729, 0.02745098, 0, 1, 1,
0.4250484, 0.0584203, 2.724268, 0.03137255, 0, 1, 1,
0.4298676, -0.8734629, 0.3974839, 0.03921569, 0, 1, 1,
0.4358986, 0.2168302, 0.8778837, 0.04313726, 0, 1, 1,
0.4495438, 1.509378, 0.5439485, 0.05098039, 0, 1, 1,
0.4561961, 0.7337385, -0.2654386, 0.05490196, 0, 1, 1,
0.4571109, 0.4565551, 0.667345, 0.0627451, 0, 1, 1,
0.4580346, 1.33135, -0.2028337, 0.06666667, 0, 1, 1,
0.4583745, -0.2012609, -0.1612219, 0.07450981, 0, 1, 1,
0.4604596, 2.003566, 0.276649, 0.07843138, 0, 1, 1,
0.4637518, 0.0197069, 2.955359, 0.08627451, 0, 1, 1,
0.4689882, 1.649457, 1.141694, 0.09019608, 0, 1, 1,
0.4705768, 1.931673, -1.08829, 0.09803922, 0, 1, 1,
0.4716456, 1.029098, 0.1835261, 0.1058824, 0, 1, 1,
0.4770903, -1.52644, 2.724378, 0.1098039, 0, 1, 1,
0.4821272, 0.06794073, 1.849934, 0.1176471, 0, 1, 1,
0.4823948, -0.1879542, 1.756674, 0.1215686, 0, 1, 1,
0.482589, 0.5147859, 1.67525, 0.1294118, 0, 1, 1,
0.4832724, -0.7458643, 0.8092712, 0.1333333, 0, 1, 1,
0.4931309, 0.6412871, 1.169592, 0.1411765, 0, 1, 1,
0.4953725, 0.4617995, 2.308879, 0.145098, 0, 1, 1,
0.5041077, 0.6882256, -0.09196119, 0.1529412, 0, 1, 1,
0.5050965, 0.9419929, 0.4907431, 0.1568628, 0, 1, 1,
0.5055317, -2.224207, 2.925121, 0.1647059, 0, 1, 1,
0.5066299, 0.8203444, -0.7519893, 0.1686275, 0, 1, 1,
0.5073993, -0.4257656, 4.201407, 0.1764706, 0, 1, 1,
0.5130686, -0.2248082, 1.083215, 0.1803922, 0, 1, 1,
0.5156062, 0.6273273, 0.746086, 0.1882353, 0, 1, 1,
0.5199401, -1.445673, 2.204168, 0.1921569, 0, 1, 1,
0.5211498, -1.193733, 2.238659, 0.2, 0, 1, 1,
0.5301961, -1.340264, 2.449157, 0.2078431, 0, 1, 1,
0.531732, -0.2205728, 1.735849, 0.2117647, 0, 1, 1,
0.5327663, 0.7434883, 0.7563887, 0.2196078, 0, 1, 1,
0.5353097, 0.7545667, -0.1354247, 0.2235294, 0, 1, 1,
0.5455011, -0.2419726, 1.380581, 0.2313726, 0, 1, 1,
0.5463638, -1.1034, 3.510935, 0.2352941, 0, 1, 1,
0.5488274, 1.216772, 0.7097304, 0.2431373, 0, 1, 1,
0.5538777, -0.3651625, 1.381333, 0.2470588, 0, 1, 1,
0.5553939, -0.6375844, 2.226039, 0.254902, 0, 1, 1,
0.5563735, -0.8763251, 3.280791, 0.2588235, 0, 1, 1,
0.5618199, -0.00593032, 0.5023084, 0.2666667, 0, 1, 1,
0.5627055, -0.3301204, 3.547506, 0.2705882, 0, 1, 1,
0.5638395, 0.009126997, 3.272776, 0.2784314, 0, 1, 1,
0.5690725, 0.6238726, 0.4697708, 0.282353, 0, 1, 1,
0.5704264, 1.381051, 0.7616062, 0.2901961, 0, 1, 1,
0.5721742, 0.9177366, -0.7855716, 0.2941177, 0, 1, 1,
0.5785861, -1.408337, 1.261124, 0.3019608, 0, 1, 1,
0.5826858, -0.7237046, 1.507224, 0.3098039, 0, 1, 1,
0.5856472, -0.7571312, 3.113032, 0.3137255, 0, 1, 1,
0.5875179, -1.507155, 3.727169, 0.3215686, 0, 1, 1,
0.5875728, -0.5697743, 3.149765, 0.3254902, 0, 1, 1,
0.5912473, -0.8157446, 3.341423, 0.3333333, 0, 1, 1,
0.591533, 1.990196, -0.8681745, 0.3372549, 0, 1, 1,
0.5945894, -1.947363, 5.067278, 0.345098, 0, 1, 1,
0.5955712, 1.077072, 1.056569, 0.3490196, 0, 1, 1,
0.5973269, -0.1843842, 2.443386, 0.3568628, 0, 1, 1,
0.5981671, 1.036749, 1.709051, 0.3607843, 0, 1, 1,
0.5990023, 3.234933, 0.8880848, 0.3686275, 0, 1, 1,
0.6008253, 1.466713, -0.1033407, 0.372549, 0, 1, 1,
0.606326, -1.522851, 2.385283, 0.3803922, 0, 1, 1,
0.6133806, -0.7454327, 3.161317, 0.3843137, 0, 1, 1,
0.6134744, -1.21867, 3.480899, 0.3921569, 0, 1, 1,
0.6135706, 1.189962, 0.5873088, 0.3960784, 0, 1, 1,
0.613772, 0.004040658, 1.224328, 0.4039216, 0, 1, 1,
0.6146583, -0.9774067, 0.7940969, 0.4117647, 0, 1, 1,
0.6163567, 0.5090463, 1.53757, 0.4156863, 0, 1, 1,
0.6185361, 1.121597, 1.388985, 0.4235294, 0, 1, 1,
0.6220161, -0.804333, 1.69614, 0.427451, 0, 1, 1,
0.6246735, 0.8194444, 0.4663454, 0.4352941, 0, 1, 1,
0.6260903, -1.230234, 2.576157, 0.4392157, 0, 1, 1,
0.6318406, 0.750337, -0.06638879, 0.4470588, 0, 1, 1,
0.6324969, -0.7573451, 2.409599, 0.4509804, 0, 1, 1,
0.6353078, -1.243819, 3.211331, 0.4588235, 0, 1, 1,
0.6401513, 0.1254023, 2.224626, 0.4627451, 0, 1, 1,
0.6413168, 0.1719116, 3.224148, 0.4705882, 0, 1, 1,
0.6516355, -0.6094812, 2.921791, 0.4745098, 0, 1, 1,
0.6541387, 0.6199618, 1.13662, 0.4823529, 0, 1, 1,
0.657265, -1.082603, 2.764969, 0.4862745, 0, 1, 1,
0.6677583, 2.25057, 0.4366967, 0.4941176, 0, 1, 1,
0.6703214, -0.7373697, 4.743071, 0.5019608, 0, 1, 1,
0.6740735, 1.738747, -0.2286921, 0.5058824, 0, 1, 1,
0.6836089, -1.332222, 1.387168, 0.5137255, 0, 1, 1,
0.6861049, -1.002469, 0.9404364, 0.5176471, 0, 1, 1,
0.6863883, -0.7867776, -0.06550751, 0.5254902, 0, 1, 1,
0.6898978, -2.400718, 0.7463348, 0.5294118, 0, 1, 1,
0.6943762, -1.048408, 2.661108, 0.5372549, 0, 1, 1,
0.6982507, -1.169052, 0.9245028, 0.5411765, 0, 1, 1,
0.7002751, 0.3674366, 0.7079572, 0.5490196, 0, 1, 1,
0.7004205, -0.08829269, 2.335877, 0.5529412, 0, 1, 1,
0.7035323, -0.6443328, 2.961525, 0.5607843, 0, 1, 1,
0.7081227, -0.5657864, 1.531588, 0.5647059, 0, 1, 1,
0.7103948, 1.553869, 0.1230418, 0.572549, 0, 1, 1,
0.7122028, -0.2977462, 2.28444, 0.5764706, 0, 1, 1,
0.7132155, 0.7210881, 0.4667782, 0.5843138, 0, 1, 1,
0.7142124, -2.146542, 3.165936, 0.5882353, 0, 1, 1,
0.7248749, -1.747851, 2.829513, 0.5960785, 0, 1, 1,
0.7253213, 0.2555228, -0.3513071, 0.6039216, 0, 1, 1,
0.7299969, -0.1790102, 1.920892, 0.6078432, 0, 1, 1,
0.7303252, -0.06360099, 2.253059, 0.6156863, 0, 1, 1,
0.7310595, 2.285899, 0.802581, 0.6196079, 0, 1, 1,
0.7347282, -0.05691862, 3.16072, 0.627451, 0, 1, 1,
0.7361612, -1.507176, 2.527217, 0.6313726, 0, 1, 1,
0.7427269, 0.2887104, 0.8050107, 0.6392157, 0, 1, 1,
0.7444887, 1.795097, 1.899198, 0.6431373, 0, 1, 1,
0.7540759, -1.19903, 3.257929, 0.6509804, 0, 1, 1,
0.7580249, -1.09595, 5.399023, 0.654902, 0, 1, 1,
0.7583489, -0.9682846, 1.290378, 0.6627451, 0, 1, 1,
0.7600026, 0.7213157, 1.117077, 0.6666667, 0, 1, 1,
0.7668582, -0.2713467, 2.479429, 0.6745098, 0, 1, 1,
0.7673771, -0.9734626, 5.175506, 0.6784314, 0, 1, 1,
0.769319, -1.100422, 2.26004, 0.6862745, 0, 1, 1,
0.7702215, 1.853677, -1.483956, 0.6901961, 0, 1, 1,
0.7814727, 1.992134, 0.365822, 0.6980392, 0, 1, 1,
0.7826658, -0.06643938, 3.315554, 0.7058824, 0, 1, 1,
0.7829536, 1.524866, 0.7479352, 0.7098039, 0, 1, 1,
0.8227655, -0.2555749, 1.017871, 0.7176471, 0, 1, 1,
0.8231659, -0.8099625, 2.303196, 0.7215686, 0, 1, 1,
0.8249892, 0.2762451, 0.3922984, 0.7294118, 0, 1, 1,
0.8277583, 1.89037, 2.059546, 0.7333333, 0, 1, 1,
0.8290612, 0.141668, 1.530966, 0.7411765, 0, 1, 1,
0.8325013, 0.8069428, -1.133729, 0.7450981, 0, 1, 1,
0.8387263, -1.24362, 2.964027, 0.7529412, 0, 1, 1,
0.8438796, -0.04514868, 0.3840797, 0.7568628, 0, 1, 1,
0.8457038, -0.7722037, 3.071426, 0.7647059, 0, 1, 1,
0.8536277, 0.8946005, 1.530402, 0.7686275, 0, 1, 1,
0.8605788, -0.6338388, 3.459868, 0.7764706, 0, 1, 1,
0.8660195, 1.371831, 0.5247523, 0.7803922, 0, 1, 1,
0.8672755, -0.4638702, 1.587167, 0.7882353, 0, 1, 1,
0.8697616, -0.1984248, 3.846288, 0.7921569, 0, 1, 1,
0.8700384, 0.3675775, 1.41413, 0.8, 0, 1, 1,
0.8761955, 0.3662727, 2.610443, 0.8078431, 0, 1, 1,
0.8797009, 1.29311, -0.2913587, 0.8117647, 0, 1, 1,
0.8924233, -0.1202193, 2.376487, 0.8196079, 0, 1, 1,
0.8987148, 0.5600846, 2.07179, 0.8235294, 0, 1, 1,
0.9073472, 0.5746172, -0.7386202, 0.8313726, 0, 1, 1,
0.9098824, 1.689433, 0.6738957, 0.8352941, 0, 1, 1,
0.9099197, -0.1482258, 1.990126, 0.8431373, 0, 1, 1,
0.9160395, -0.9854695, 2.982603, 0.8470588, 0, 1, 1,
0.9221253, -0.2022463, 2.505251, 0.854902, 0, 1, 1,
0.9260952, -0.2972934, 2.540433, 0.8588235, 0, 1, 1,
0.930315, 0.2435644, 1.209858, 0.8666667, 0, 1, 1,
0.9334368, 1.172163, 0.9253435, 0.8705882, 0, 1, 1,
0.9398692, 1.079286, 0.7210649, 0.8784314, 0, 1, 1,
0.9413161, 0.008095754, 1.406177, 0.8823529, 0, 1, 1,
0.9447005, -0.2043486, 1.588059, 0.8901961, 0, 1, 1,
0.9476179, 0.3227362, 2.24589, 0.8941177, 0, 1, 1,
0.9599907, -0.7099597, 2.919143, 0.9019608, 0, 1, 1,
0.9606458, -0.3111761, 2.825688, 0.9098039, 0, 1, 1,
0.9640765, 0.8017557, 1.257899, 0.9137255, 0, 1, 1,
0.9648751, 0.6589262, 2.49364, 0.9215686, 0, 1, 1,
0.9670892, -0.2560413, 1.258401, 0.9254902, 0, 1, 1,
0.9905264, -1.22103, 1.099523, 0.9333333, 0, 1, 1,
0.9968346, 1.143268, 0.8447353, 0.9372549, 0, 1, 1,
0.998553, 2.201638, 2.338293, 0.945098, 0, 1, 1,
0.9996006, -0.3124383, 3.205986, 0.9490196, 0, 1, 1,
1.004273, 0.2123427, 0.7281846, 0.9568627, 0, 1, 1,
1.004724, -1.688768, 1.187938, 0.9607843, 0, 1, 1,
1.009401, 1.209355, 0.1652387, 0.9686275, 0, 1, 1,
1.011321, 1.117876, 1.863946, 0.972549, 0, 1, 1,
1.019528, -0.1765107, 1.215874, 0.9803922, 0, 1, 1,
1.021572, 0.06179443, 1.722809, 0.9843137, 0, 1, 1,
1.030481, -1.55319, 2.15656, 0.9921569, 0, 1, 1,
1.030578, 0.7913737, 0.5415367, 0.9960784, 0, 1, 1,
1.037481, 0.8698308, 1.013732, 1, 0, 0.9960784, 1,
1.041363, -1.080077, 2.354939, 1, 0, 0.9882353, 1,
1.04472, 1.313228, 0.8673539, 1, 0, 0.9843137, 1,
1.045824, -0.6820464, 3.017464, 1, 0, 0.9764706, 1,
1.048905, 0.4277703, 2.004896, 1, 0, 0.972549, 1,
1.050949, -2.338795, 5.660402, 1, 0, 0.9647059, 1,
1.051508, 0.6344431, -0.4739528, 1, 0, 0.9607843, 1,
1.053017, 0.3880652, 0.6301711, 1, 0, 0.9529412, 1,
1.059398, -1.081306, 2.898502, 1, 0, 0.9490196, 1,
1.06004, 2.564866, 1.092656, 1, 0, 0.9411765, 1,
1.066413, 1.649441, 0.1264499, 1, 0, 0.9372549, 1,
1.069785, 0.7622628, 1.072333, 1, 0, 0.9294118, 1,
1.070781, -1.877343, 3.075655, 1, 0, 0.9254902, 1,
1.080559, 0.2190422, -0.2351828, 1, 0, 0.9176471, 1,
1.081504, 0.6008443, -0.198958, 1, 0, 0.9137255, 1,
1.08824, 0.1398146, 2.680784, 1, 0, 0.9058824, 1,
1.096829, 1.217914, 1.606766, 1, 0, 0.9019608, 1,
1.112375, 1.502606, 0.8064494, 1, 0, 0.8941177, 1,
1.113788, -1.125974, 1.510539, 1, 0, 0.8862745, 1,
1.120798, -0.3107432, 1.237611, 1, 0, 0.8823529, 1,
1.128047, 1.115279, 1.203543, 1, 0, 0.8745098, 1,
1.13188, 0.5583794, 2.194546, 1, 0, 0.8705882, 1,
1.132202, -0.6622061, 3.262535, 1, 0, 0.8627451, 1,
1.136393, 0.05643357, 1.041176, 1, 0, 0.8588235, 1,
1.139216, -0.2430658, 2.817472, 1, 0, 0.8509804, 1,
1.148437, 2.065388, 0.4728372, 1, 0, 0.8470588, 1,
1.154136, 0.06739633, 0.974693, 1, 0, 0.8392157, 1,
1.155577, -1.614766, 1.784722, 1, 0, 0.8352941, 1,
1.160726, -0.7111688, 2.076916, 1, 0, 0.827451, 1,
1.160765, -0.3051918, 0.5437813, 1, 0, 0.8235294, 1,
1.162205, 0.2381814, 1.989168, 1, 0, 0.8156863, 1,
1.162975, 0.05627664, 2.071139, 1, 0, 0.8117647, 1,
1.168303, -1.628352, 2.94906, 1, 0, 0.8039216, 1,
1.173454, 0.6564279, 0.8144217, 1, 0, 0.7960784, 1,
1.177628, 0.7772268, 0.6127804, 1, 0, 0.7921569, 1,
1.180774, 1.705194, 0.3053612, 1, 0, 0.7843137, 1,
1.18213, 1.399939, 0.03056103, 1, 0, 0.7803922, 1,
1.182211, -0.09337507, 2.37789, 1, 0, 0.772549, 1,
1.18587, 0.9629666, -0.2485096, 1, 0, 0.7686275, 1,
1.194483, 0.8420383, 1.259333, 1, 0, 0.7607843, 1,
1.20121, 0.215733, 1.30597, 1, 0, 0.7568628, 1,
1.204008, 0.16322, 1.949241, 1, 0, 0.7490196, 1,
1.215359, -0.08343627, 1.701747, 1, 0, 0.7450981, 1,
1.218011, 0.4457029, 1.011908, 1, 0, 0.7372549, 1,
1.227656, 0.5518667, 0.8718091, 1, 0, 0.7333333, 1,
1.229729, 1.223822, 2.853873, 1, 0, 0.7254902, 1,
1.232406, -0.5636697, 2.313303, 1, 0, 0.7215686, 1,
1.23589, 0.1946244, 1.966488, 1, 0, 0.7137255, 1,
1.245683, 0.2343175, 0.3984596, 1, 0, 0.7098039, 1,
1.249131, 2.243008, 0.8846807, 1, 0, 0.7019608, 1,
1.254422, -0.2008569, 0.6526128, 1, 0, 0.6941177, 1,
1.261608, -1.244426, 2.942076, 1, 0, 0.6901961, 1,
1.263039, 1.110996, 1.22458, 1, 0, 0.682353, 1,
1.269947, 0.3619972, 1.071379, 1, 0, 0.6784314, 1,
1.270551, -0.2802158, 0.7591111, 1, 0, 0.6705883, 1,
1.271391, -0.3551996, 1.504988, 1, 0, 0.6666667, 1,
1.276856, -0.0708321, 0.8890404, 1, 0, 0.6588235, 1,
1.27806, -0.6450182, 0.3532203, 1, 0, 0.654902, 1,
1.279721, -0.1695323, 2.461677, 1, 0, 0.6470588, 1,
1.292985, 0.6947718, 3.235939, 1, 0, 0.6431373, 1,
1.297871, 1.401695, 1.371576, 1, 0, 0.6352941, 1,
1.298568, -0.2012398, 1.477093, 1, 0, 0.6313726, 1,
1.298574, -0.4109802, 1.15235, 1, 0, 0.6235294, 1,
1.307051, 0.5293264, 1.055357, 1, 0, 0.6196079, 1,
1.323009, -1.337628, 2.229988, 1, 0, 0.6117647, 1,
1.325513, -1.722388, 2.461591, 1, 0, 0.6078432, 1,
1.329295, 0.7745652, 1.658475, 1, 0, 0.6, 1,
1.331695, -0.9698198, 3.219927, 1, 0, 0.5921569, 1,
1.357892, -1.499515, 1.990969, 1, 0, 0.5882353, 1,
1.36226, 0.2174376, 1.192241, 1, 0, 0.5803922, 1,
1.373604, -0.7084524, 2.775732, 1, 0, 0.5764706, 1,
1.377847, -0.4430115, 0.4640408, 1, 0, 0.5686275, 1,
1.382396, 0.8618231, 0.3434574, 1, 0, 0.5647059, 1,
1.387565, 1.449389, 1.385704, 1, 0, 0.5568628, 1,
1.392478, 2.165008, 0.4642595, 1, 0, 0.5529412, 1,
1.393258, -0.06758603, 1.347267, 1, 0, 0.5450981, 1,
1.397726, 0.8368781, -1.599287, 1, 0, 0.5411765, 1,
1.397801, -1.871887, 2.711822, 1, 0, 0.5333334, 1,
1.398738, 0.8602268, 1.695723, 1, 0, 0.5294118, 1,
1.400772, 0.04592548, 0.7391874, 1, 0, 0.5215687, 1,
1.403995, 0.8369507, 2.363977, 1, 0, 0.5176471, 1,
1.407439, 0.4446565, 0.4130672, 1, 0, 0.509804, 1,
1.411726, -0.5262091, 1.28876, 1, 0, 0.5058824, 1,
1.418243, -0.9830859, 3.545525, 1, 0, 0.4980392, 1,
1.44252, -1.000665, 2.330483, 1, 0, 0.4901961, 1,
1.463002, -0.4272666, 1.781576, 1, 0, 0.4862745, 1,
1.463207, 0.3253322, 1.174662, 1, 0, 0.4784314, 1,
1.469897, -1.988722, 2.976068, 1, 0, 0.4745098, 1,
1.487661, -0.5580286, 1.894711, 1, 0, 0.4666667, 1,
1.489637, 0.4345905, 2.81082, 1, 0, 0.4627451, 1,
1.492151, 0.8922043, -0.7328615, 1, 0, 0.454902, 1,
1.516641, -0.09797075, 2.318244, 1, 0, 0.4509804, 1,
1.521129, 0.5278239, 1.313558, 1, 0, 0.4431373, 1,
1.525913, 0.4296782, 1.86603, 1, 0, 0.4392157, 1,
1.528173, -0.2951868, 2.402874, 1, 0, 0.4313726, 1,
1.52842, -0.09132846, 1.117498, 1, 0, 0.427451, 1,
1.538604, 0.05376455, 0.6184297, 1, 0, 0.4196078, 1,
1.542634, 0.03081227, 2.640555, 1, 0, 0.4156863, 1,
1.544019, 0.8717129, 1.449722, 1, 0, 0.4078431, 1,
1.552059, -0.4126365, 2.205039, 1, 0, 0.4039216, 1,
1.560108, 0.09545936, 2.182993, 1, 0, 0.3960784, 1,
1.566344, 0.3299814, 2.769512, 1, 0, 0.3882353, 1,
1.569049, 1.181434, 1.063225, 1, 0, 0.3843137, 1,
1.583951, -1.17969, 1.12331, 1, 0, 0.3764706, 1,
1.588467, -0.7279086, 3.723738, 1, 0, 0.372549, 1,
1.625432, 1.002578, -0.08259924, 1, 0, 0.3647059, 1,
1.636487, -0.2771972, 1.050941, 1, 0, 0.3607843, 1,
1.637636, -1.85058, 2.48042, 1, 0, 0.3529412, 1,
1.663601, 0.3262943, 0.5632344, 1, 0, 0.3490196, 1,
1.665402, -0.2610578, 2.065216, 1, 0, 0.3411765, 1,
1.677387, 0.3123384, 1.330647, 1, 0, 0.3372549, 1,
1.687179, -1.029125, 1.164227, 1, 0, 0.3294118, 1,
1.6915, -2.025825, 4.107035, 1, 0, 0.3254902, 1,
1.696326, -0.7625784, 3.758317, 1, 0, 0.3176471, 1,
1.697972, 0.6691657, 0.9076534, 1, 0, 0.3137255, 1,
1.708693, 0.6615528, 2.487458, 1, 0, 0.3058824, 1,
1.729029, -0.0304232, 3.154511, 1, 0, 0.2980392, 1,
1.761172, 0.32836, 1.344127, 1, 0, 0.2941177, 1,
1.769782, 0.7116966, 3.490385, 1, 0, 0.2862745, 1,
1.779641, 0.1729673, 1.39825, 1, 0, 0.282353, 1,
1.785349, -1.38595, 3.024909, 1, 0, 0.2745098, 1,
1.787365, -0.5587357, 3.411, 1, 0, 0.2705882, 1,
1.793166, -1.130714, 0.7514341, 1, 0, 0.2627451, 1,
1.794424, -0.2057022, 2.29216, 1, 0, 0.2588235, 1,
1.814536, -0.3693984, 0.3369685, 1, 0, 0.2509804, 1,
1.824353, 0.9160335, 2.379447, 1, 0, 0.2470588, 1,
1.826553, 0.6184362, 1.053394, 1, 0, 0.2392157, 1,
1.831885, 0.2932209, 0.6321113, 1, 0, 0.2352941, 1,
1.882107, 0.9135203, 1.016112, 1, 0, 0.227451, 1,
1.888353, 0.9686288, 3.344809, 1, 0, 0.2235294, 1,
1.898477, -1.491418, 4.132866, 1, 0, 0.2156863, 1,
1.907503, -0.4884727, 1.238094, 1, 0, 0.2117647, 1,
1.924297, 1.714105, 0.6796482, 1, 0, 0.2039216, 1,
1.9299, -0.7543479, 1.856073, 1, 0, 0.1960784, 1,
1.934691, -2.225008, 2.629826, 1, 0, 0.1921569, 1,
1.94658, 0.8971322, -0.7794071, 1, 0, 0.1843137, 1,
1.948478, 0.8549912, 1.983291, 1, 0, 0.1803922, 1,
1.949255, -0.3209947, 3.523669, 1, 0, 0.172549, 1,
1.953162, 0.1878086, -0.5314986, 1, 0, 0.1686275, 1,
1.98998, -1.837887, 2.936591, 1, 0, 0.1607843, 1,
2.012608, 1.23859, 1.067942, 1, 0, 0.1568628, 1,
2.028437, -0.2877035, 1.353886, 1, 0, 0.1490196, 1,
2.032548, -0.1404205, 1.688453, 1, 0, 0.145098, 1,
2.045037, 0.1906133, 2.2691, 1, 0, 0.1372549, 1,
2.05219, 0.6651649, 1.3749, 1, 0, 0.1333333, 1,
2.061153, -1.86694, 3.397275, 1, 0, 0.1254902, 1,
2.067049, 1.18908, 1.349848, 1, 0, 0.1215686, 1,
2.169988, 0.5748702, 1.788275, 1, 0, 0.1137255, 1,
2.186021, 1.212404, 0.5241399, 1, 0, 0.1098039, 1,
2.223355, 0.1416995, 1.486828, 1, 0, 0.1019608, 1,
2.250165, 1.243418, 1.048021, 1, 0, 0.09411765, 1,
2.274175, 0.4679074, 0.2559828, 1, 0, 0.09019608, 1,
2.278505, -0.2763884, 1.02905, 1, 0, 0.08235294, 1,
2.306323, -1.779848, 2.202078, 1, 0, 0.07843138, 1,
2.345798, 0.3120877, 0.2067893, 1, 0, 0.07058824, 1,
2.383075, -1.134878, 1.488071, 1, 0, 0.06666667, 1,
2.391694, -0.09516228, 1.308697, 1, 0, 0.05882353, 1,
2.409205, -0.8403692, 2.32651, 1, 0, 0.05490196, 1,
2.484049, -0.8830777, 1.383847, 1, 0, 0.04705882, 1,
2.558023, -0.4081973, 0.3159468, 1, 0, 0.04313726, 1,
2.654297, 0.7210549, 0.5111316, 1, 0, 0.03529412, 1,
2.836689, 0.8699293, -0.4578393, 1, 0, 0.03137255, 1,
2.848273, 1.794482, 1.049054, 1, 0, 0.02352941, 1,
2.904397, 0.4317368, -0.1841928, 1, 0, 0.01960784, 1,
2.955605, -0.6143218, -0.4115104, 1, 0, 0.01176471, 1,
3.078053, -1.512466, 3.509561, 1, 0, 0.007843138, 1
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
0.1055458, -3.882025, -6.835485, 0, -0.5, 0.5, 0.5,
0.1055458, -3.882025, -6.835485, 1, -0.5, 0.5, 0.5,
0.1055458, -3.882025, -6.835485, 1, 1.5, 0.5, 0.5,
0.1055458, -3.882025, -6.835485, 0, 1.5, 0.5, 0.5
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
-3.874641, 0.8815347, -6.835485, 0, -0.5, 0.5, 0.5,
-3.874641, 0.8815347, -6.835485, 1, -0.5, 0.5, 0.5,
-3.874641, 0.8815347, -6.835485, 1, 1.5, 0.5, 0.5,
-3.874641, 0.8815347, -6.835485, 0, 1.5, 0.5, 0.5
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
-3.874641, -3.882025, 0.3488474, 0, -0.5, 0.5, 0.5,
-3.874641, -3.882025, 0.3488474, 1, -0.5, 0.5, 0.5,
-3.874641, -3.882025, 0.3488474, 1, 1.5, 0.5, 0.5,
-3.874641, -3.882025, 0.3488474, 0, 1.5, 0.5, 0.5
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
-2, -2.782742, -5.177562,
3, -2.782742, -5.177562,
-2, -2.782742, -5.177562,
-2, -2.965955, -5.453882,
-1, -2.782742, -5.177562,
-1, -2.965955, -5.453882,
0, -2.782742, -5.177562,
0, -2.965955, -5.453882,
1, -2.782742, -5.177562,
1, -2.965955, -5.453882,
2, -2.782742, -5.177562,
2, -2.965955, -5.453882,
3, -2.782742, -5.177562,
3, -2.965955, -5.453882
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
-2, -3.332383, -6.006523, 0, -0.5, 0.5, 0.5,
-2, -3.332383, -6.006523, 1, -0.5, 0.5, 0.5,
-2, -3.332383, -6.006523, 1, 1.5, 0.5, 0.5,
-2, -3.332383, -6.006523, 0, 1.5, 0.5, 0.5,
-1, -3.332383, -6.006523, 0, -0.5, 0.5, 0.5,
-1, -3.332383, -6.006523, 1, -0.5, 0.5, 0.5,
-1, -3.332383, -6.006523, 1, 1.5, 0.5, 0.5,
-1, -3.332383, -6.006523, 0, 1.5, 0.5, 0.5,
0, -3.332383, -6.006523, 0, -0.5, 0.5, 0.5,
0, -3.332383, -6.006523, 1, -0.5, 0.5, 0.5,
0, -3.332383, -6.006523, 1, 1.5, 0.5, 0.5,
0, -3.332383, -6.006523, 0, 1.5, 0.5, 0.5,
1, -3.332383, -6.006523, 0, -0.5, 0.5, 0.5,
1, -3.332383, -6.006523, 1, -0.5, 0.5, 0.5,
1, -3.332383, -6.006523, 1, 1.5, 0.5, 0.5,
1, -3.332383, -6.006523, 0, 1.5, 0.5, 0.5,
2, -3.332383, -6.006523, 0, -0.5, 0.5, 0.5,
2, -3.332383, -6.006523, 1, -0.5, 0.5, 0.5,
2, -3.332383, -6.006523, 1, 1.5, 0.5, 0.5,
2, -3.332383, -6.006523, 0, 1.5, 0.5, 0.5,
3, -3.332383, -6.006523, 0, -0.5, 0.5, 0.5,
3, -3.332383, -6.006523, 1, -0.5, 0.5, 0.5,
3, -3.332383, -6.006523, 1, 1.5, 0.5, 0.5,
3, -3.332383, -6.006523, 0, 1.5, 0.5, 0.5
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
-2.956137, -2, -5.177562,
-2.956137, 4, -5.177562,
-2.956137, -2, -5.177562,
-3.109221, -2, -5.453882,
-2.956137, 0, -5.177562,
-3.109221, 0, -5.453882,
-2.956137, 2, -5.177562,
-3.109221, 2, -5.453882,
-2.956137, 4, -5.177562,
-3.109221, 4, -5.453882
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
"2",
"4"
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
-3.415389, -2, -6.006523, 0, -0.5, 0.5, 0.5,
-3.415389, -2, -6.006523, 1, -0.5, 0.5, 0.5,
-3.415389, -2, -6.006523, 1, 1.5, 0.5, 0.5,
-3.415389, -2, -6.006523, 0, 1.5, 0.5, 0.5,
-3.415389, 0, -6.006523, 0, -0.5, 0.5, 0.5,
-3.415389, 0, -6.006523, 1, -0.5, 0.5, 0.5,
-3.415389, 0, -6.006523, 1, 1.5, 0.5, 0.5,
-3.415389, 0, -6.006523, 0, 1.5, 0.5, 0.5,
-3.415389, 2, -6.006523, 0, -0.5, 0.5, 0.5,
-3.415389, 2, -6.006523, 1, -0.5, 0.5, 0.5,
-3.415389, 2, -6.006523, 1, 1.5, 0.5, 0.5,
-3.415389, 2, -6.006523, 0, 1.5, 0.5, 0.5,
-3.415389, 4, -6.006523, 0, -0.5, 0.5, 0.5,
-3.415389, 4, -6.006523, 1, -0.5, 0.5, 0.5,
-3.415389, 4, -6.006523, 1, 1.5, 0.5, 0.5,
-3.415389, 4, -6.006523, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-2.956137, -2.782742, -4,
-2.956137, -2.782742, 4,
-2.956137, -2.782742, -4,
-3.109221, -2.965955, -4,
-2.956137, -2.782742, -2,
-3.109221, -2.965955, -2,
-2.956137, -2.782742, 0,
-3.109221, -2.965955, 0,
-2.956137, -2.782742, 2,
-3.109221, -2.965955, 2,
-2.956137, -2.782742, 4,
-3.109221, -2.965955, 4
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
-3.415389, -3.332383, -4, 0, -0.5, 0.5, 0.5,
-3.415389, -3.332383, -4, 1, -0.5, 0.5, 0.5,
-3.415389, -3.332383, -4, 1, 1.5, 0.5, 0.5,
-3.415389, -3.332383, -4, 0, 1.5, 0.5, 0.5,
-3.415389, -3.332383, -2, 0, -0.5, 0.5, 0.5,
-3.415389, -3.332383, -2, 1, -0.5, 0.5, 0.5,
-3.415389, -3.332383, -2, 1, 1.5, 0.5, 0.5,
-3.415389, -3.332383, -2, 0, 1.5, 0.5, 0.5,
-3.415389, -3.332383, 0, 0, -0.5, 0.5, 0.5,
-3.415389, -3.332383, 0, 1, -0.5, 0.5, 0.5,
-3.415389, -3.332383, 0, 1, 1.5, 0.5, 0.5,
-3.415389, -3.332383, 0, 0, 1.5, 0.5, 0.5,
-3.415389, -3.332383, 2, 0, -0.5, 0.5, 0.5,
-3.415389, -3.332383, 2, 1, -0.5, 0.5, 0.5,
-3.415389, -3.332383, 2, 1, 1.5, 0.5, 0.5,
-3.415389, -3.332383, 2, 0, 1.5, 0.5, 0.5,
-3.415389, -3.332383, 4, 0, -0.5, 0.5, 0.5,
-3.415389, -3.332383, 4, 1, -0.5, 0.5, 0.5,
-3.415389, -3.332383, 4, 1, 1.5, 0.5, 0.5,
-3.415389, -3.332383, 4, 0, 1.5, 0.5, 0.5
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
-2.956137, -2.782742, -5.177562,
-2.956137, 4.545811, -5.177562,
-2.956137, -2.782742, 5.875257,
-2.956137, 4.545811, 5.875257,
-2.956137, -2.782742, -5.177562,
-2.956137, -2.782742, 5.875257,
-2.956137, 4.545811, -5.177562,
-2.956137, 4.545811, 5.875257,
-2.956137, -2.782742, -5.177562,
3.167228, -2.782742, -5.177562,
-2.956137, -2.782742, 5.875257,
3.167228, -2.782742, 5.875257,
-2.956137, 4.545811, -5.177562,
3.167228, 4.545811, -5.177562,
-2.956137, 4.545811, 5.875257,
3.167228, 4.545811, 5.875257,
3.167228, -2.782742, -5.177562,
3.167228, 4.545811, -5.177562,
3.167228, -2.782742, 5.875257,
3.167228, 4.545811, 5.875257,
3.167228, -2.782742, -5.177562,
3.167228, -2.782742, 5.875257,
3.167228, 4.545811, -5.177562,
3.167228, 4.545811, 5.875257
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
var radius = 7.79992;
var distance = 34.70273;
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
mvMatrix.translate( -0.1055458, -0.8815347, -0.3488474 );
mvMatrix.scale( 1.377254, 1.150763, 0.7630115 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.70273);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
Propene<-read.table("Propene.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Propene$V2
```

```
## Error in eval(expr, envir, enclos): object 'Propene' not found
```

```r
y<-Propene$V3
```

```
## Error in eval(expr, envir, enclos): object 'Propene' not found
```

```r
z<-Propene$V4
```

```
## Error in eval(expr, envir, enclos): object 'Propene' not found
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
-2.866961, 0.6524453, -1.930598, 0, 0, 1, 1, 1,
-2.866204, 0.3678891, -2.47452, 1, 0, 0, 1, 1,
-2.812169, 1.104914, -1.918799, 1, 0, 0, 1, 1,
-2.784234, -0.8168688, -1.825868, 1, 0, 0, 1, 1,
-2.783173, 0.4963554, -1.040085, 1, 0, 0, 1, 1,
-2.738778, -0.03515406, -1.620194, 1, 0, 0, 1, 1,
-2.723789, -0.8596749, -2.498683, 0, 0, 0, 1, 1,
-2.692802, -0.5167074, -1.127708, 0, 0, 0, 1, 1,
-2.620962, -1.982009, -2.52268, 0, 0, 0, 1, 1,
-2.605917, -0.2525768, -2.336879, 0, 0, 0, 1, 1,
-2.397041, -0.2269066, -1.04006, 0, 0, 0, 1, 1,
-2.281854, 0.4973961, -1.925018, 0, 0, 0, 1, 1,
-2.28181, -2.148561, -2.687074, 0, 0, 0, 1, 1,
-2.27185, 0.8704391, -1.63776, 1, 1, 1, 1, 1,
-2.256406, -1.587809, -2.621655, 1, 1, 1, 1, 1,
-2.169543, -0.8725685, -2.559068, 1, 1, 1, 1, 1,
-2.161654, 0.08852636, -1.995639, 1, 1, 1, 1, 1,
-2.133958, -0.6751621, -2.356453, 1, 1, 1, 1, 1,
-2.101829, 0.4386894, -2.576209, 1, 1, 1, 1, 1,
-2.0632, -1.426526, -2.894151, 1, 1, 1, 1, 1,
-2.021417, 0.3463521, -0.9033012, 1, 1, 1, 1, 1,
-1.98336, 1.423817, -1.221152, 1, 1, 1, 1, 1,
-1.962926, 1.107999, -0.1984319, 1, 1, 1, 1, 1,
-1.962868, -0.6224881, -1.793081, 1, 1, 1, 1, 1,
-1.960293, -0.1476331, -2.820974, 1, 1, 1, 1, 1,
-1.937183, -0.1548233, -4.509974, 1, 1, 1, 1, 1,
-1.93657, 0.1265097, -1.493166, 1, 1, 1, 1, 1,
-1.92203, 0.5353639, -1.99391, 1, 1, 1, 1, 1,
-1.916634, 1.399459, 0.03745453, 0, 0, 1, 1, 1,
-1.896013, -0.1715417, -1.611484, 1, 0, 0, 1, 1,
-1.880111, -0.3331896, -1.568944, 1, 0, 0, 1, 1,
-1.878131, 1.001471, -1.910183, 1, 0, 0, 1, 1,
-1.826436, 0.6494344, -3.425853, 1, 0, 0, 1, 1,
-1.817077, -1.172241, -0.9910357, 1, 0, 0, 1, 1,
-1.795691, -1.994261, -3.413183, 0, 0, 0, 1, 1,
-1.795323, -0.05164674, -1.056015, 0, 0, 0, 1, 1,
-1.790511, 0.05004595, -1.254904, 0, 0, 0, 1, 1,
-1.781356, -0.8984174, -3.02458, 0, 0, 0, 1, 1,
-1.775322, 0.4979952, -1.614581, 0, 0, 0, 1, 1,
-1.76843, -0.2389298, -0.3115836, 0, 0, 0, 1, 1,
-1.76087, 0.07312351, -1.167165, 0, 0, 0, 1, 1,
-1.759693, 0.7918816, -2.930173, 1, 1, 1, 1, 1,
-1.751376, 1.214819, -0.3857011, 1, 1, 1, 1, 1,
-1.741434, -1.283338, -2.25789, 1, 1, 1, 1, 1,
-1.737867, 0.05787708, -1.254066, 1, 1, 1, 1, 1,
-1.727938, -1.012812, -3.005023, 1, 1, 1, 1, 1,
-1.7264, 0.5547929, -1.754299, 1, 1, 1, 1, 1,
-1.709246, 0.3722127, -1.991358, 1, 1, 1, 1, 1,
-1.706649, -0.2184415, -1.447571, 1, 1, 1, 1, 1,
-1.704731, 1.552467, -1.284529, 1, 1, 1, 1, 1,
-1.702885, -0.5862896, -0.2780155, 1, 1, 1, 1, 1,
-1.688486, -0.4273554, -3.053008, 1, 1, 1, 1, 1,
-1.685832, 0.8237144, -2.122922, 1, 1, 1, 1, 1,
-1.67668, 0.1131257, -1.676097, 1, 1, 1, 1, 1,
-1.662428, 0.5107378, -2.123772, 1, 1, 1, 1, 1,
-1.661918, 0.2718488, -2.269653, 1, 1, 1, 1, 1,
-1.657307, -0.4169521, -0.7402647, 0, 0, 1, 1, 1,
-1.653112, 0.5598728, -1.586867, 1, 0, 0, 1, 1,
-1.651067, -1.153053, -3.567233, 1, 0, 0, 1, 1,
-1.644352, 1.1535, -1.580325, 1, 0, 0, 1, 1,
-1.639175, 0.9900027, -2.637191, 1, 0, 0, 1, 1,
-1.635591, -0.9468957, -3.019629, 1, 0, 0, 1, 1,
-1.632569, -0.7668042, -1.861853, 0, 0, 0, 1, 1,
-1.618575, -0.3486369, -2.388773, 0, 0, 0, 1, 1,
-1.607981, -1.969864, -3.047096, 0, 0, 0, 1, 1,
-1.606977, 0.901244, -0.05192898, 0, 0, 0, 1, 1,
-1.603155, 0.6981208, -0.3469733, 0, 0, 0, 1, 1,
-1.57183, -0.5765662, -1.327322, 0, 0, 0, 1, 1,
-1.569377, 1.312551, -1.349392, 0, 0, 0, 1, 1,
-1.564489, 0.509935, -2.681555, 1, 1, 1, 1, 1,
-1.555246, -1.00876, -2.298021, 1, 1, 1, 1, 1,
-1.55313, 0.2657022, -0.2748493, 1, 1, 1, 1, 1,
-1.547588, -1.302225, -2.951088, 1, 1, 1, 1, 1,
-1.542663, 1.06024, -1.107392, 1, 1, 1, 1, 1,
-1.534476, -1.044876, -1.872966, 1, 1, 1, 1, 1,
-1.526159, 0.6271072, -2.009159, 1, 1, 1, 1, 1,
-1.513224, -1.75678, -2.591211, 1, 1, 1, 1, 1,
-1.505421, 0.3081028, -1.062979, 1, 1, 1, 1, 1,
-1.503499, -0.4418976, -2.785599, 1, 1, 1, 1, 1,
-1.50123, -2.172399, -3.333582, 1, 1, 1, 1, 1,
-1.490778, -1.092482, -3.755737, 1, 1, 1, 1, 1,
-1.488671, 1.323614, -0.9328551, 1, 1, 1, 1, 1,
-1.476059, -1.748224, -1.975857, 1, 1, 1, 1, 1,
-1.471501, 0.5080075, -1.187758, 1, 1, 1, 1, 1,
-1.465832, 0.9778028, -0.3674042, 0, 0, 1, 1, 1,
-1.455727, -1.823194, -3.051086, 1, 0, 0, 1, 1,
-1.455604, 0.2334428, -0.8654872, 1, 0, 0, 1, 1,
-1.451808, -1.624195, -2.123566, 1, 0, 0, 1, 1,
-1.451106, -1.409922, -2.171617, 1, 0, 0, 1, 1,
-1.448162, -0.6985554, -3.800494, 1, 0, 0, 1, 1,
-1.44065, 1.600345, -0.496473, 0, 0, 0, 1, 1,
-1.437732, -1.244715, -2.52004, 0, 0, 0, 1, 1,
-1.437651, 1.772053, -1.598474, 0, 0, 0, 1, 1,
-1.424306, -0.270556, -2.72034, 0, 0, 0, 1, 1,
-1.423646, 0.5946384, 0.1655839, 0, 0, 0, 1, 1,
-1.41911, -0.6256444, -1.769295, 0, 0, 0, 1, 1,
-1.411615, 0.9544072, -1.035981, 0, 0, 0, 1, 1,
-1.401643, 1.247755, -0.764239, 1, 1, 1, 1, 1,
-1.399427, 1.59229, 0.3413797, 1, 1, 1, 1, 1,
-1.392664, -1.133921, -2.220878, 1, 1, 1, 1, 1,
-1.39051, 1.780821, -1.804372, 1, 1, 1, 1, 1,
-1.390278, -1.417993, -3.275118, 1, 1, 1, 1, 1,
-1.387709, -1.428833, -2.443281, 1, 1, 1, 1, 1,
-1.385167, -1.460879, -1.611096, 1, 1, 1, 1, 1,
-1.382915, 0.3680301, -0.6128631, 1, 1, 1, 1, 1,
-1.375632, 0.9176424, -1.771195, 1, 1, 1, 1, 1,
-1.348993, -1.299983, -2.353673, 1, 1, 1, 1, 1,
-1.347728, -0.6965613, -2.400042, 1, 1, 1, 1, 1,
-1.347645, 1.776387, -1.793551, 1, 1, 1, 1, 1,
-1.343731, 0.9124743, -2.080406, 1, 1, 1, 1, 1,
-1.343601, 1.006143, -0.4551462, 1, 1, 1, 1, 1,
-1.343123, -0.1006016, -2.406976, 1, 1, 1, 1, 1,
-1.338157, 2.148513, -0.8879548, 0, 0, 1, 1, 1,
-1.335916, -1.5841, -1.990169, 1, 0, 0, 1, 1,
-1.332304, -2.059068, -3.125132, 1, 0, 0, 1, 1,
-1.330485, -0.4211896, -1.795318, 1, 0, 0, 1, 1,
-1.328903, 0.8277553, -0.05111944, 1, 0, 0, 1, 1,
-1.325332, -0.9134753, -2.770454, 1, 0, 0, 1, 1,
-1.316186, -0.3098305, -2.633272, 0, 0, 0, 1, 1,
-1.302919, 0.1214911, -0.261865, 0, 0, 0, 1, 1,
-1.302574, 0.8658444, -0.1760859, 0, 0, 0, 1, 1,
-1.301157, 1.520016, -1.012695, 0, 0, 0, 1, 1,
-1.297122, -0.1074969, -1.975682, 0, 0, 0, 1, 1,
-1.286195, 1.419156, -0.9281864, 0, 0, 0, 1, 1,
-1.28176, 0.386594, -1.427533, 0, 0, 0, 1, 1,
-1.280005, 0.04945677, -2.231767, 1, 1, 1, 1, 1,
-1.279384, -0.771414, -0.4170738, 1, 1, 1, 1, 1,
-1.266292, -0.3630784, -0.2411931, 1, 1, 1, 1, 1,
-1.2655, 1.226073, -3.309283, 1, 1, 1, 1, 1,
-1.258915, 1.113794, -1.389294, 1, 1, 1, 1, 1,
-1.257623, 1.328116, -0.247137, 1, 1, 1, 1, 1,
-1.257444, 0.326502, -1.030499, 1, 1, 1, 1, 1,
-1.253961, 1.608505, -1.912265, 1, 1, 1, 1, 1,
-1.246181, 0.2660847, -1.222205, 1, 1, 1, 1, 1,
-1.241042, 0.9624771, -2.061709, 1, 1, 1, 1, 1,
-1.240444, -1.565704, -2.735795, 1, 1, 1, 1, 1,
-1.236151, 0.4198254, -1.571976, 1, 1, 1, 1, 1,
-1.235614, -0.665382, -2.744566, 1, 1, 1, 1, 1,
-1.230687, -0.5408915, -1.886551, 1, 1, 1, 1, 1,
-1.230583, 0.4770896, 0.6326987, 1, 1, 1, 1, 1,
-1.221894, 0.5277274, -1.577074, 0, 0, 1, 1, 1,
-1.212891, 0.006581733, -1.786922, 1, 0, 0, 1, 1,
-1.211529, 0.8121659, -0.6209009, 1, 0, 0, 1, 1,
-1.205243, -0.6455328, -3.656654, 1, 0, 0, 1, 1,
-1.204528, -0.3824759, 0.07813938, 1, 0, 0, 1, 1,
-1.194889, 0.0140684, 0.1121251, 1, 0, 0, 1, 1,
-1.193614, 0.09875283, -1.639083, 0, 0, 0, 1, 1,
-1.181433, -0.3249607, -1.469981, 0, 0, 0, 1, 1,
-1.180261, 0.558486, -0.6623595, 0, 0, 0, 1, 1,
-1.179754, -1.238478, -3.233898, 0, 0, 0, 1, 1,
-1.178031, 1.056847, -0.1381324, 0, 0, 0, 1, 1,
-1.176932, -0.8482139, -3.40179, 0, 0, 0, 1, 1,
-1.16044, 2.21279, -1.780826, 0, 0, 0, 1, 1,
-1.159619, 0.8623343, -1.398835, 1, 1, 1, 1, 1,
-1.151824, 1.206186, -0.5505306, 1, 1, 1, 1, 1,
-1.146186, -0.7059017, -1.528138, 1, 1, 1, 1, 1,
-1.143561, 0.1792801, -0.4419337, 1, 1, 1, 1, 1,
-1.134304, -0.1607938, -3.235799, 1, 1, 1, 1, 1,
-1.131488, 1.597448, 0.5114827, 1, 1, 1, 1, 1,
-1.129049, 1.231139, -0.8087463, 1, 1, 1, 1, 1,
-1.12043, -0.5996002, -1.35735, 1, 1, 1, 1, 1,
-1.118164, 0.1438318, -2.048402, 1, 1, 1, 1, 1,
-1.11139, -0.6262716, -2.388308, 1, 1, 1, 1, 1,
-1.101341, -0.1238707, -1.448313, 1, 1, 1, 1, 1,
-1.100599, 0.3118191, -0.406391, 1, 1, 1, 1, 1,
-1.099072, 0.7792131, -2.226109, 1, 1, 1, 1, 1,
-1.097604, -0.9160918, -4.634807, 1, 1, 1, 1, 1,
-1.088429, 1.59977, -0.4560367, 1, 1, 1, 1, 1,
-1.08521, 0.647782, -2.938008, 0, 0, 1, 1, 1,
-1.083782, 0.5593695, -0.3800427, 1, 0, 0, 1, 1,
-1.08276, -0.8619156, -0.07359917, 1, 0, 0, 1, 1,
-1.082222, -0.02632761, -1.630761, 1, 0, 0, 1, 1,
-1.081741, -1.854191, -2.576243, 1, 0, 0, 1, 1,
-1.07871, -1.101606, -2.577, 1, 0, 0, 1, 1,
-1.074644, 0.2509182, -1.419774, 0, 0, 0, 1, 1,
-1.068026, -0.1560097, -2.534152, 0, 0, 0, 1, 1,
-1.057571, -0.3413011, -2.127226, 0, 0, 0, 1, 1,
-1.05042, 1.808135, 1.697321, 0, 0, 0, 1, 1,
-1.046869, -0.8451152, -1.248489, 0, 0, 0, 1, 1,
-1.044794, -0.5630532, -1.041966, 0, 0, 0, 1, 1,
-1.043328, -0.6306134, -1.674822, 0, 0, 0, 1, 1,
-1.030843, -0.1759601, -2.128365, 1, 1, 1, 1, 1,
-1.026364, -0.4216661, -1.412071, 1, 1, 1, 1, 1,
-1.025047, -0.4808374, -3.432637, 1, 1, 1, 1, 1,
-1.022992, -0.07614792, -2.200694, 1, 1, 1, 1, 1,
-1.009446, -0.5985278, -1.596939, 1, 1, 1, 1, 1,
-1.006909, -0.7065316, -2.801219, 1, 1, 1, 1, 1,
-1.004192, -0.8034992, -3.020415, 1, 1, 1, 1, 1,
-0.9947116, 1.447961, -0.3540059, 1, 1, 1, 1, 1,
-0.9868228, -1.233705, -1.706791, 1, 1, 1, 1, 1,
-0.9831837, -0.07585496, -1.90008, 1, 1, 1, 1, 1,
-0.9812033, -0.1090337, -2.115232, 1, 1, 1, 1, 1,
-0.9760273, 2.21665, 0.7344739, 1, 1, 1, 1, 1,
-0.9666553, -0.04294005, -1.838555, 1, 1, 1, 1, 1,
-0.9658056, -0.5860195, -2.869202, 1, 1, 1, 1, 1,
-0.9590711, -0.6035926, -1.161354, 1, 1, 1, 1, 1,
-0.9563439, -0.5546897, -2.912235, 0, 0, 1, 1, 1,
-0.9550372, -0.8254747, -3.10865, 1, 0, 0, 1, 1,
-0.9537276, -0.06515053, -2.474962, 1, 0, 0, 1, 1,
-0.9499707, -0.06490824, -2.008771, 1, 0, 0, 1, 1,
-0.9437332, -2.18265, -3.441426, 1, 0, 0, 1, 1,
-0.9348649, 0.4842644, -1.648821, 1, 0, 0, 1, 1,
-0.925668, -0.7337154, -1.894099, 0, 0, 0, 1, 1,
-0.9253798, -0.3037862, 0.3516151, 0, 0, 0, 1, 1,
-0.9242035, 0.4990013, -0.4267812, 0, 0, 0, 1, 1,
-0.9214938, -0.1539914, -1.007588, 0, 0, 0, 1, 1,
-0.917408, 0.01021468, -2.963848, 0, 0, 0, 1, 1,
-0.915034, 0.003176711, -2.103925, 0, 0, 0, 1, 1,
-0.914169, -0.6444613, -2.644651, 0, 0, 0, 1, 1,
-0.9126981, -1.339036, -2.786985, 1, 1, 1, 1, 1,
-0.9111163, -1.644977, -2.149923, 1, 1, 1, 1, 1,
-0.9068789, 0.1396352, -3.20647, 1, 1, 1, 1, 1,
-0.8969235, -1.208038, -1.651201, 1, 1, 1, 1, 1,
-0.8969139, -0.3713318, -2.76234, 1, 1, 1, 1, 1,
-0.8964418, 0.0637127, -0.05203317, 1, 1, 1, 1, 1,
-0.8874547, -0.4575, -0.6943054, 1, 1, 1, 1, 1,
-0.8843084, 0.423592, -0.75282, 1, 1, 1, 1, 1,
-0.8709444, 0.3606539, -0.8851449, 1, 1, 1, 1, 1,
-0.8646492, -1.021524, -4.1966, 1, 1, 1, 1, 1,
-0.863907, 0.1656282, -0.3872799, 1, 1, 1, 1, 1,
-0.8557895, -0.3426492, 0.5746818, 1, 1, 1, 1, 1,
-0.8497872, -0.3791097, -0.450354, 1, 1, 1, 1, 1,
-0.8439357, 0.1061905, -1.09128, 1, 1, 1, 1, 1,
-0.8425276, -0.1885725, -2.309842, 1, 1, 1, 1, 1,
-0.8422366, 0.5459565, -2.313812, 0, 0, 1, 1, 1,
-0.8411123, -1.839922, -3.144887, 1, 0, 0, 1, 1,
-0.8331383, -0.4952048, -1.955722, 1, 0, 0, 1, 1,
-0.8303567, 1.959978, 0.8478763, 1, 0, 0, 1, 1,
-0.8299729, -1.627993, -1.740651, 1, 0, 0, 1, 1,
-0.8287948, 1.891882, -1.376325, 1, 0, 0, 1, 1,
-0.8260294, -0.1318409, -1.273177, 0, 0, 0, 1, 1,
-0.8228743, -1.42898, -2.90035, 0, 0, 0, 1, 1,
-0.8213534, 0.7860001, -0.8281311, 0, 0, 0, 1, 1,
-0.8199749, -1.378497, -1.992532, 0, 0, 0, 1, 1,
-0.815671, 1.181423, 0.2121673, 0, 0, 0, 1, 1,
-0.8146878, 0.06417979, -2.435937, 0, 0, 0, 1, 1,
-0.8141394, 0.09716725, -1.923781, 0, 0, 0, 1, 1,
-0.8108849, -0.1841466, -1.980253, 1, 1, 1, 1, 1,
-0.8056372, 0.526738, -2.093041, 1, 1, 1, 1, 1,
-0.7988871, 0.8498012, 1.820438, 1, 1, 1, 1, 1,
-0.7927401, 0.3350319, -0.8898069, 1, 1, 1, 1, 1,
-0.7909086, 0.5166522, -0.3019173, 1, 1, 1, 1, 1,
-0.7889399, -0.733331, -2.654391, 1, 1, 1, 1, 1,
-0.7844152, 0.2679015, -2.568405, 1, 1, 1, 1, 1,
-0.7829263, -2.363166, -3.098738, 1, 1, 1, 1, 1,
-0.7755929, 0.4676468, -1.495116, 1, 1, 1, 1, 1,
-0.7744086, -0.2026643, -1.357426, 1, 1, 1, 1, 1,
-0.7734112, 1.316876, -1.185501, 1, 1, 1, 1, 1,
-0.7727734, -2.351578, -3.241186, 1, 1, 1, 1, 1,
-0.7693978, 0.04857283, -0.3164423, 1, 1, 1, 1, 1,
-0.7640594, -1.631235, -1.183406, 1, 1, 1, 1, 1,
-0.7616546, 0.4325145, 0.2386943, 1, 1, 1, 1, 1,
-0.7523241, -2.60001, -3.495367, 0, 0, 1, 1, 1,
-0.7489089, -1.28529, -2.157462, 1, 0, 0, 1, 1,
-0.7476746, 1.534488, -1.106503, 1, 0, 0, 1, 1,
-0.7409898, -1.592769, -1.831925, 1, 0, 0, 1, 1,
-0.7383265, -0.8276092, -1.232021, 1, 0, 0, 1, 1,
-0.7312652, 1.538255, -0.443436, 1, 0, 0, 1, 1,
-0.7290871, 0.5146835, -0.3729988, 0, 0, 0, 1, 1,
-0.7284477, 1.135912, -0.901292, 0, 0, 0, 1, 1,
-0.726814, 0.3704294, -0.402112, 0, 0, 0, 1, 1,
-0.724934, 0.6013784, -0.4151668, 0, 0, 0, 1, 1,
-0.7242392, -0.756233, -1.477839, 0, 0, 0, 1, 1,
-0.7238079, -1.355631, -2.911059, 0, 0, 0, 1, 1,
-0.7215147, -0.7443366, -1.924109, 0, 0, 0, 1, 1,
-0.7190633, 2.781449, -1.567092, 1, 1, 1, 1, 1,
-0.7185462, -0.5185062, -1.954799, 1, 1, 1, 1, 1,
-0.7181609, 0.9021388, -0.197859, 1, 1, 1, 1, 1,
-0.7178204, 0.2005195, -2.213402, 1, 1, 1, 1, 1,
-0.7170528, 0.2746073, -1.736007, 1, 1, 1, 1, 1,
-0.7158756, 0.838179, -0.6771379, 1, 1, 1, 1, 1,
-0.7141873, -0.3914618, -2.681614, 1, 1, 1, 1, 1,
-0.7089132, -1.104688, -3.366791, 1, 1, 1, 1, 1,
-0.7080939, 0.4866098, -0.7562122, 1, 1, 1, 1, 1,
-0.6923518, 0.07348097, -0.926452, 1, 1, 1, 1, 1,
-0.682697, 0.7584081, -1.453101, 1, 1, 1, 1, 1,
-0.6708267, -0.5053989, -1.685821, 1, 1, 1, 1, 1,
-0.6701186, -0.6448793, -3.233613, 1, 1, 1, 1, 1,
-0.668407, 0.3062102, -2.812994, 1, 1, 1, 1, 1,
-0.6670122, -0.1182283, -1.859745, 1, 1, 1, 1, 1,
-0.6669923, 1.325663, -0.4931784, 0, 0, 1, 1, 1,
-0.6665242, 0.1995757, -0.746007, 1, 0, 0, 1, 1,
-0.6618764, 0.3396062, -0.2588766, 1, 0, 0, 1, 1,
-0.658111, -0.6262589, -1.812304, 1, 0, 0, 1, 1,
-0.6528608, 0.6257768, 0.6373385, 1, 0, 0, 1, 1,
-0.6514334, 0.8994309, -1.786761, 1, 0, 0, 1, 1,
-0.6455808, 1.946484, -0.5200245, 0, 0, 0, 1, 1,
-0.6435966, -0.9037903, -3.758602, 0, 0, 0, 1, 1,
-0.639733, 0.1526719, -1.997469, 0, 0, 0, 1, 1,
-0.6390139, 0.4206182, -0.5872053, 0, 0, 0, 1, 1,
-0.6388855, -0.02839372, -0.04260318, 0, 0, 0, 1, 1,
-0.6385902, 0.6158341, -0.09133937, 0, 0, 0, 1, 1,
-0.6355861, 0.4110646, -0.261298, 0, 0, 0, 1, 1,
-0.6351056, -0.7412326, -3.070669, 1, 1, 1, 1, 1,
-0.6350903, -1.770459, -2.696071, 1, 1, 1, 1, 1,
-0.6256645, -0.1535355, -2.490352, 1, 1, 1, 1, 1,
-0.6231399, -0.7671477, -3.656188, 1, 1, 1, 1, 1,
-0.617778, -0.6006621, -2.979761, 1, 1, 1, 1, 1,
-0.617251, -1.769571, -2.670919, 1, 1, 1, 1, 1,
-0.6163073, 1.21313, 0.5383803, 1, 1, 1, 1, 1,
-0.6141564, -0.1821123, -4.279214, 1, 1, 1, 1, 1,
-0.6123746, 1.276366, -0.523714, 1, 1, 1, 1, 1,
-0.6121438, -1.394506, -1.586575, 1, 1, 1, 1, 1,
-0.6100212, -0.2930718, -1.380977, 1, 1, 1, 1, 1,
-0.6073986, 1.808197, 1.723197, 1, 1, 1, 1, 1,
-0.5993176, -0.4682561, -3.1174, 1, 1, 1, 1, 1,
-0.5937049, 0.4419916, -1.801762, 1, 1, 1, 1, 1,
-0.5875644, 0.2482249, -1.731017, 1, 1, 1, 1, 1,
-0.5857649, -0.251926, -1.754981, 0, 0, 1, 1, 1,
-0.5856783, 1.410544, -0.6128239, 1, 0, 0, 1, 1,
-0.5843915, -0.3585736, -1.045525, 1, 0, 0, 1, 1,
-0.583978, 1.430388, 1.119837, 1, 0, 0, 1, 1,
-0.5835735, 0.1741628, 0.05814394, 1, 0, 0, 1, 1,
-0.5798258, -1.047684, -2.194396, 1, 0, 0, 1, 1,
-0.5768976, -0.07528862, -1.936191, 0, 0, 0, 1, 1,
-0.5545844, 2.308912, -1.505821, 0, 0, 0, 1, 1,
-0.5474573, 0.6256269, -1.064912, 0, 0, 0, 1, 1,
-0.5452836, -1.421314, -3.662735, 0, 0, 0, 1, 1,
-0.5397667, 0.04003023, -2.506079, 0, 0, 0, 1, 1,
-0.5389381, -0.1058119, -1.849096, 0, 0, 0, 1, 1,
-0.5387905, 0.6695917, -2.018611, 0, 0, 0, 1, 1,
-0.5364146, -0.5863771, -2.459318, 1, 1, 1, 1, 1,
-0.5323418, -0.9202434, -1.418797, 1, 1, 1, 1, 1,
-0.5228981, -0.02320287, -1.420952, 1, 1, 1, 1, 1,
-0.5224826, -0.5400902, -1.094184, 1, 1, 1, 1, 1,
-0.52245, -0.1551577, -2.679451, 1, 1, 1, 1, 1,
-0.5196565, -0.04358199, -0.2036233, 1, 1, 1, 1, 1,
-0.5194429, 1.105353, -0.4261806, 1, 1, 1, 1, 1,
-0.5160751, -0.5807402, -2.288928, 1, 1, 1, 1, 1,
-0.5160399, -0.1528403, -3.248259, 1, 1, 1, 1, 1,
-0.5146372, 0.9545463, -1.786152, 1, 1, 1, 1, 1,
-0.5134062, -1.057318, -2.344517, 1, 1, 1, 1, 1,
-0.5061704, -0.1594389, -1.797873, 1, 1, 1, 1, 1,
-0.5057592, 1.767516, -0.3285663, 1, 1, 1, 1, 1,
-0.5057117, -0.3775109, 0.3692639, 1, 1, 1, 1, 1,
-0.5024142, -1.417668, -3.588264, 1, 1, 1, 1, 1,
-0.5023253, -1.64573, -0.09443435, 0, 0, 1, 1, 1,
-0.499296, 0.04704968, -0.6383465, 1, 0, 0, 1, 1,
-0.4990475, 0.5867384, -0.7579075, 1, 0, 0, 1, 1,
-0.4923557, 2.248313, -0.5406432, 1, 0, 0, 1, 1,
-0.4812704, -0.09924164, -0.7044368, 1, 0, 0, 1, 1,
-0.475411, -0.5886053, -1.627627, 1, 0, 0, 1, 1,
-0.4652794, 0.1009186, -0.6901259, 0, 0, 0, 1, 1,
-0.4650841, 1.029449, -0.523514, 0, 0, 0, 1, 1,
-0.462351, 1.198433, 0.4244884, 0, 0, 0, 1, 1,
-0.4556913, 0.6063712, -0.04068217, 0, 0, 0, 1, 1,
-0.4548925, -2.045096, -1.544617, 0, 0, 0, 1, 1,
-0.4483119, -0.206949, -0.2583967, 0, 0, 0, 1, 1,
-0.4426088, -1.660036, -1.513733, 0, 0, 0, 1, 1,
-0.4421592, 0.2693563, 0.03613865, 1, 1, 1, 1, 1,
-0.4413116, -1.982607, -2.115348, 1, 1, 1, 1, 1,
-0.435772, 1.008235, 0.8922816, 1, 1, 1, 1, 1,
-0.4347246, -0.1142735, -3.431485, 1, 1, 1, 1, 1,
-0.4332778, 1.117617, -1.139928, 1, 1, 1, 1, 1,
-0.4295416, 0.6202999, 1.741193, 1, 1, 1, 1, 1,
-0.4238818, 0.4985082, -1.571554, 1, 1, 1, 1, 1,
-0.4198952, -0.4434118, -1.810989, 1, 1, 1, 1, 1,
-0.4147849, 0.3448693, -1.264101, 1, 1, 1, 1, 1,
-0.4096623, -0.04028598, -1.679521, 1, 1, 1, 1, 1,
-0.4086938, 1.283916, -0.5041702, 1, 1, 1, 1, 1,
-0.4070541, 0.06707118, -0.6356647, 1, 1, 1, 1, 1,
-0.4067023, -0.2175248, -1.117798, 1, 1, 1, 1, 1,
-0.406215, 1.426751, 0.5724874, 1, 1, 1, 1, 1,
-0.4040008, 0.5558611, -1.940459, 1, 1, 1, 1, 1,
-0.4003289, 1.48195, -1.046533, 0, 0, 1, 1, 1,
-0.3996603, -0.7609296, -1.831004, 1, 0, 0, 1, 1,
-0.3959084, -0.524749, -2.70817, 1, 0, 0, 1, 1,
-0.3944065, 0.2736161, -1.080252, 1, 0, 0, 1, 1,
-0.3881963, -0.1153285, -1.430514, 1, 0, 0, 1, 1,
-0.3860052, 0.5711645, -2.822633, 1, 0, 0, 1, 1,
-0.3803734, 0.2724056, 1.318486, 0, 0, 0, 1, 1,
-0.3766155, -0.2756034, -2.970875, 0, 0, 0, 1, 1,
-0.3735466, 0.5014306, -0.50502, 0, 0, 0, 1, 1,
-0.3722901, 0.004085523, 0.2434441, 0, 0, 0, 1, 1,
-0.367206, -1.263084, -4.725526, 0, 0, 0, 1, 1,
-0.3656727, -0.2540436, -0.6340819, 0, 0, 0, 1, 1,
-0.3637339, -1.458346, -3.790147, 0, 0, 0, 1, 1,
-0.3553514, -0.2782847, -3.171944, 1, 1, 1, 1, 1,
-0.3550084, -0.5854043, -0.7748585, 1, 1, 1, 1, 1,
-0.3549522, 0.2368467, 0.354962, 1, 1, 1, 1, 1,
-0.3541467, 0.8669926, -0.5823033, 1, 1, 1, 1, 1,
-0.3522401, 0.271459, 0.6915296, 1, 1, 1, 1, 1,
-0.3441144, -1.41606, -3.047198, 1, 1, 1, 1, 1,
-0.3423683, 0.3105316, 0.8566743, 1, 1, 1, 1, 1,
-0.341946, 0.2313525, 0.1353497, 1, 1, 1, 1, 1,
-0.341713, 2.473276, 0.2062751, 1, 1, 1, 1, 1,
-0.3396335, 1.887286, 0.1686612, 1, 1, 1, 1, 1,
-0.3386307, 0.4106288, -2.870743, 1, 1, 1, 1, 1,
-0.3373471, -0.06643277, -1.709015, 1, 1, 1, 1, 1,
-0.3354653, -1.146385, -1.937655, 1, 1, 1, 1, 1,
-0.3348689, 0.110409, -1.963726, 1, 1, 1, 1, 1,
-0.3343329, -1.219537, -2.010492, 1, 1, 1, 1, 1,
-0.3340694, 0.4802794, -0.7572466, 0, 0, 1, 1, 1,
-0.3279606, -0.1776441, -2.350034, 1, 0, 0, 1, 1,
-0.3212143, -0.5091649, -2.901413, 1, 0, 0, 1, 1,
-0.31604, -1.758237, -3.742756, 1, 0, 0, 1, 1,
-0.3123832, 0.9360458, 1.899074, 1, 0, 0, 1, 1,
-0.3122769, -1.185719, -2.317226, 1, 0, 0, 1, 1,
-0.3043913, 0.3336259, -0.7606291, 0, 0, 0, 1, 1,
-0.2960145, -0.1784899, -3.505974, 0, 0, 0, 1, 1,
-0.2842681, 0.9312395, -0.4000844, 0, 0, 0, 1, 1,
-0.2835835, -0.6617172, -2.713983, 0, 0, 0, 1, 1,
-0.2829094, 0.8240012, -0.8866866, 0, 0, 0, 1, 1,
-0.2817413, 0.8620578, 0.6520672, 0, 0, 0, 1, 1,
-0.2815838, -0.3002223, -0.195616, 0, 0, 0, 1, 1,
-0.2779096, -0.6421816, -3.168515, 1, 1, 1, 1, 1,
-0.2760395, -0.5209001, -2.590526, 1, 1, 1, 1, 1,
-0.2753731, -1.165526, -3.286439, 1, 1, 1, 1, 1,
-0.2673026, -0.3338324, -2.254004, 1, 1, 1, 1, 1,
-0.2658115, -2.286033, -4.422644, 1, 1, 1, 1, 1,
-0.2657733, 0.9574535, 1.601023, 1, 1, 1, 1, 1,
-0.2635976, -1.296636, -4.685505, 1, 1, 1, 1, 1,
-0.2635537, 2.20326, 0.9211603, 1, 1, 1, 1, 1,
-0.2634866, 0.3958909, 1.033869, 1, 1, 1, 1, 1,
-0.2614267, 0.4413038, -1.513108, 1, 1, 1, 1, 1,
-0.2593709, -0.02366043, -1.456899, 1, 1, 1, 1, 1,
-0.254963, 0.1698776, -2.338191, 1, 1, 1, 1, 1,
-0.2512579, 1.762552, 0.09575345, 1, 1, 1, 1, 1,
-0.2486835, -0.2939375, -2.72797, 1, 1, 1, 1, 1,
-0.2439287, -1.849694, -2.229299, 1, 1, 1, 1, 1,
-0.2410948, -1.820548, -4.344841, 0, 0, 1, 1, 1,
-0.2391749, -0.0381178, -1.650148, 1, 0, 0, 1, 1,
-0.2388036, -0.2390705, -2.788093, 1, 0, 0, 1, 1,
-0.234419, 0.4005605, 0.9250025, 1, 0, 0, 1, 1,
-0.2330292, 0.1536326, -0.3297425, 1, 0, 0, 1, 1,
-0.2323643, -0.6595589, -3.617201, 1, 0, 0, 1, 1,
-0.2321168, 0.7517057, -1.075325, 0, 0, 0, 1, 1,
-0.2255872, 1.216375, -1.115489, 0, 0, 0, 1, 1,
-0.2253235, -1.096498, -2.587539, 0, 0, 0, 1, 1,
-0.2204481, 1.339357, 0.7407345, 0, 0, 0, 1, 1,
-0.2184662, -1.737582, -3.772348, 0, 0, 0, 1, 1,
-0.2147734, -0.20276, -2.228533, 0, 0, 0, 1, 1,
-0.2135043, 1.372524, -0.6069036, 0, 0, 0, 1, 1,
-0.2122456, 1.462032, -0.4336681, 1, 1, 1, 1, 1,
-0.2082901, 1.279406, -0.8038396, 1, 1, 1, 1, 1,
-0.2055875, -1.594815, -4.071992, 1, 1, 1, 1, 1,
-0.2049836, 1.503125, 1.452091, 1, 1, 1, 1, 1,
-0.2025041, 0.3851923, 0.0001083658, 1, 1, 1, 1, 1,
-0.1990856, -0.05041289, -0.844846, 1, 1, 1, 1, 1,
-0.1982246, -0.299203, -2.049395, 1, 1, 1, 1, 1,
-0.18755, -0.3177176, -1.666305, 1, 1, 1, 1, 1,
-0.1854233, 0.3921958, -0.3088516, 1, 1, 1, 1, 1,
-0.18218, 0.8200287, -0.4108518, 1, 1, 1, 1, 1,
-0.1821561, 2.446698, 0.449331, 1, 1, 1, 1, 1,
-0.1811709, 0.8841746, 0.2012592, 1, 1, 1, 1, 1,
-0.1790327, -0.1765074, -2.226766, 1, 1, 1, 1, 1,
-0.1777018, -0.2460988, -2.977149, 1, 1, 1, 1, 1,
-0.1764643, -1.076017, -3.536804, 1, 1, 1, 1, 1,
-0.170867, -0.171439, -1.488412, 0, 0, 1, 1, 1,
-0.1697934, -0.5249456, -2.634689, 1, 0, 0, 1, 1,
-0.1678324, -0.7540265, -1.74405, 1, 0, 0, 1, 1,
-0.164911, -1.881146, -3.3951, 1, 0, 0, 1, 1,
-0.1636754, -0.3972073, -4.254143, 1, 0, 0, 1, 1,
-0.1602432, -0.7657616, -3.424208, 1, 0, 0, 1, 1,
-0.1600698, 0.4826763, -0.667451, 0, 0, 0, 1, 1,
-0.159264, -0.1073649, -1.562948, 0, 0, 0, 1, 1,
-0.1549035, 0.6116228, -0.7444766, 0, 0, 0, 1, 1,
-0.1531241, 1.615731, -0.2243834, 0, 0, 0, 1, 1,
-0.1517612, -0.3108851, -3.505971, 0, 0, 0, 1, 1,
-0.1500056, -2.567567, -3.439483, 0, 0, 0, 1, 1,
-0.1489004, 0.2278372, 0.009524954, 0, 0, 0, 1, 1,
-0.1459144, 1.012883, 1.24316, 1, 1, 1, 1, 1,
-0.144808, 1.144938, 0.3299449, 1, 1, 1, 1, 1,
-0.1432388, 0.6654009, 1.324471, 1, 1, 1, 1, 1,
-0.1372867, -1.551269, -3.094816, 1, 1, 1, 1, 1,
-0.1274601, 1.075073, -1.109055, 1, 1, 1, 1, 1,
-0.1234072, 0.644637, 0.3973742, 1, 1, 1, 1, 1,
-0.1232159, -0.4470771, -3.00424, 1, 1, 1, 1, 1,
-0.1190608, 0.6658244, 0.6460811, 1, 1, 1, 1, 1,
-0.1183261, 0.5633236, -1.125921, 1, 1, 1, 1, 1,
-0.1156434, -0.3160855, -3.106486, 1, 1, 1, 1, 1,
-0.1134128, -1.06334, -4.56645, 1, 1, 1, 1, 1,
-0.1112928, 0.140305, -1.493158, 1, 1, 1, 1, 1,
-0.1106942, -0.4004708, -2.690085, 1, 1, 1, 1, 1,
-0.1037643, -2.070859, -5.016598, 1, 1, 1, 1, 1,
-0.1004337, -1.641966, -3.427844, 1, 1, 1, 1, 1,
-0.09509695, 0.937279, 0.002639838, 0, 0, 1, 1, 1,
-0.08999904, 4.439085, -0.9536593, 1, 0, 0, 1, 1,
-0.08610893, -0.4931765, -3.7457, 1, 0, 0, 1, 1,
-0.08198473, 2.584437, -1.839915, 1, 0, 0, 1, 1,
-0.07987092, -0.2083277, -2.768496, 1, 0, 0, 1, 1,
-0.07433659, 0.4900772, 0.2117205, 1, 0, 0, 1, 1,
-0.07169288, -0.08078022, -3.411259, 0, 0, 0, 1, 1,
-0.06831869, -0.2216042, -1.039343, 0, 0, 0, 1, 1,
-0.06704038, 1.411311, -0.5923106, 0, 0, 0, 1, 1,
-0.06179447, 0.2952109, -2.069248, 0, 0, 0, 1, 1,
-0.05821144, 1.552274, -0.7898419, 0, 0, 0, 1, 1,
-0.05703812, 2.031049, -0.6014013, 0, 0, 0, 1, 1,
-0.05658741, -0.7987947, -3.529925, 0, 0, 0, 1, 1,
-0.054752, 0.9056497, -1.398064, 1, 1, 1, 1, 1,
-0.05356623, 0.09259765, 0.1098452, 1, 1, 1, 1, 1,
-0.05082608, 0.9042859, 1.138875, 1, 1, 1, 1, 1,
-0.04700068, -0.6289147, -3.202902, 1, 1, 1, 1, 1,
-0.0469477, 1.128367, 0.03872334, 1, 1, 1, 1, 1,
-0.04551354, -0.03467033, -2.270377, 1, 1, 1, 1, 1,
-0.04429182, 2.0495, -0.6149266, 1, 1, 1, 1, 1,
-0.04234263, -2.296872, -2.805896, 1, 1, 1, 1, 1,
-0.04178953, -2.045887, -2.634328, 1, 1, 1, 1, 1,
-0.03999092, 0.2024005, 0.3187003, 1, 1, 1, 1, 1,
-0.03951431, 0.5259411, 1.499018, 1, 1, 1, 1, 1,
-0.03591754, -0.7019801, -2.770922, 1, 1, 1, 1, 1,
-0.03511741, -1.407821, -3.522552, 1, 1, 1, 1, 1,
-0.031442, -0.4062348, -4.979804, 1, 1, 1, 1, 1,
-0.02489027, -0.06514612, -3.390653, 1, 1, 1, 1, 1,
-0.02083044, -0.5701759, -2.428659, 0, 0, 1, 1, 1,
-0.01712111, -0.2018698, -1.400492, 1, 0, 0, 1, 1,
-0.01578127, 1.112615, -0.02709991, 1, 0, 0, 1, 1,
-0.007959997, 0.1584432, -1.274541, 1, 0, 0, 1, 1,
-0.007845474, 0.4608245, -0.1317617, 1, 0, 0, 1, 1,
-0.006800306, 0.9466154, -1.031711, 1, 0, 0, 1, 1,
-0.0005673908, 0.2135078, 0.07498187, 0, 0, 0, 1, 1,
0.005149598, 1.935646, -1.046962, 0, 0, 0, 1, 1,
0.01185059, -0.05534292, 3.63377, 0, 0, 0, 1, 1,
0.0126712, -0.9387595, 3.028397, 0, 0, 0, 1, 1,
0.01376805, -1.418389, 2.777974, 0, 0, 0, 1, 1,
0.01518316, 0.7523519, -1.73283, 0, 0, 0, 1, 1,
0.01562339, -0.177272, 5.095787, 0, 0, 0, 1, 1,
0.01794393, 1.61445, -0.4681261, 1, 1, 1, 1, 1,
0.019307, -0.8046362, 2.300139, 1, 1, 1, 1, 1,
0.02550622, -0.3636288, 3.665546, 1, 1, 1, 1, 1,
0.02812297, 0.5773581, -0.1419129, 1, 1, 1, 1, 1,
0.03154717, -0.5958379, 4.358548, 1, 1, 1, 1, 1,
0.03180043, -1.393893, 2.682882, 1, 1, 1, 1, 1,
0.03199361, -2.162794, 4.140313, 1, 1, 1, 1, 1,
0.03252821, 1.491427, -1.124608, 1, 1, 1, 1, 1,
0.03565904, -0.789699, 3.611386, 1, 1, 1, 1, 1,
0.0375555, 0.4411505, -0.9704938, 1, 1, 1, 1, 1,
0.04400745, 0.4233634, -0.2132681, 1, 1, 1, 1, 1,
0.04741229, -0.6180018, 2.52151, 1, 1, 1, 1, 1,
0.05002294, -1.076242, 2.859318, 1, 1, 1, 1, 1,
0.05437945, -1.014333, 3.288342, 1, 1, 1, 1, 1,
0.05954345, -0.02289152, 2.302502, 1, 1, 1, 1, 1,
0.06336495, 0.8495837, -1.121576, 0, 0, 1, 1, 1,
0.06390691, 1.297088, 0.1791842, 1, 0, 0, 1, 1,
0.07366486, 0.2982282, 0.8684299, 1, 0, 0, 1, 1,
0.07668179, 0.5059432, 1.486945, 1, 0, 0, 1, 1,
0.07764699, -0.09850433, 3.807529, 1, 0, 0, 1, 1,
0.0787271, -0.791978, 3.349758, 1, 0, 0, 1, 1,
0.07877772, -0.9082897, 2.989744, 0, 0, 0, 1, 1,
0.08006497, -0.0276158, 2.507443, 0, 0, 0, 1, 1,
0.08214547, -0.6513588, 4.236841, 0, 0, 0, 1, 1,
0.08864664, 2.245941, 0.3881058, 0, 0, 0, 1, 1,
0.08869731, -1.014844, 3.750859, 0, 0, 0, 1, 1,
0.08953671, -0.6383069, 4.011991, 0, 0, 0, 1, 1,
0.09484219, -0.0679872, 2.900129, 0, 0, 0, 1, 1,
0.09603661, 0.8694269, 2.380758, 1, 1, 1, 1, 1,
0.1009458, 0.1871961, 0.964458, 1, 1, 1, 1, 1,
0.1029641, 0.6195474, -0.2951249, 1, 1, 1, 1, 1,
0.1037556, 0.3499719, 1.534391, 1, 1, 1, 1, 1,
0.1057136, -0.09197825, 1.929121, 1, 1, 1, 1, 1,
0.1124151, 0.01197133, 1.037392, 1, 1, 1, 1, 1,
0.1152844, 0.9592792, 0.5044266, 1, 1, 1, 1, 1,
0.1159832, 0.8088394, -0.6717438, 1, 1, 1, 1, 1,
0.1265148, -0.6331237, 3.404087, 1, 1, 1, 1, 1,
0.1297704, 0.8065211, 0.2810785, 1, 1, 1, 1, 1,
0.1334412, -0.4404496, 2.852456, 1, 1, 1, 1, 1,
0.1346486, -0.663569, 2.571212, 1, 1, 1, 1, 1,
0.1360267, 0.5607594, -0.2602752, 1, 1, 1, 1, 1,
0.1362079, 0.2672566, 1.318197, 1, 1, 1, 1, 1,
0.1396562, -2.005633, 4.710502, 1, 1, 1, 1, 1,
0.1398662, 0.2411163, 0.8354596, 0, 0, 1, 1, 1,
0.1437122, 1.085619, 1.257099, 1, 0, 0, 1, 1,
0.1443014, -0.1845213, 0.8057418, 1, 0, 0, 1, 1,
0.1444227, -0.7357984, 3.678576, 1, 0, 0, 1, 1,
0.1478465, 0.8874554, 0.1637063, 1, 0, 0, 1, 1,
0.1533149, -0.230886, 1.610808, 1, 0, 0, 1, 1,
0.153438, -0.3816413, 2.624363, 0, 0, 0, 1, 1,
0.1538858, 0.802326, -0.5064861, 0, 0, 0, 1, 1,
0.1573998, -0.5155663, 3.831186, 0, 0, 0, 1, 1,
0.1632919, 0.7507585, 0.8877075, 0, 0, 0, 1, 1,
0.1637364, 1.634077, 0.525258, 0, 0, 0, 1, 1,
0.1704693, -0.55586, 0.5607108, 0, 0, 0, 1, 1,
0.1723373, 0.7072553, 1.720633, 0, 0, 0, 1, 1,
0.1747533, -0.2699736, 4.656919, 1, 1, 1, 1, 1,
0.1781575, -1.133013, 3.332353, 1, 1, 1, 1, 1,
0.1798718, -0.4310037, 2.262832, 1, 1, 1, 1, 1,
0.1816312, -0.1922388, 3.131817, 1, 1, 1, 1, 1,
0.1827569, -0.2146236, 2.406161, 1, 1, 1, 1, 1,
0.1828386, 0.4104506, 1.539487, 1, 1, 1, 1, 1,
0.1864331, 0.4252642, 0.1897159, 1, 1, 1, 1, 1,
0.189467, 0.06598442, -0.792904, 1, 1, 1, 1, 1,
0.1898162, -0.6339653, 3.72625, 1, 1, 1, 1, 1,
0.1905352, -0.03492931, 1.220948, 1, 1, 1, 1, 1,
0.1959579, -1.224856, 3.776382, 1, 1, 1, 1, 1,
0.1994569, 0.6108492, -1.062718, 1, 1, 1, 1, 1,
0.2067671, 0.1004432, -0.2487767, 1, 1, 1, 1, 1,
0.2082815, -0.7848619, 1.214431, 1, 1, 1, 1, 1,
0.2147986, -0.7109851, 3.579681, 1, 1, 1, 1, 1,
0.2249254, -0.2038105, 0.02120947, 0, 0, 1, 1, 1,
0.2276023, -0.1380388, 3.18887, 1, 0, 0, 1, 1,
0.2277778, -1.626259, 2.275791, 1, 0, 0, 1, 1,
0.2312993, -1.394901, 1.642881, 1, 0, 0, 1, 1,
0.2314953, 0.2943136, 1.858232, 1, 0, 0, 1, 1,
0.2316909, 0.2948304, 0.9603383, 1, 0, 0, 1, 1,
0.2351237, -0.1390354, 3.15794, 0, 0, 0, 1, 1,
0.2361504, 0.7060304, -0.7108504, 0, 0, 0, 1, 1,
0.2364408, 0.04038458, 1.79522, 0, 0, 0, 1, 1,
0.2404467, 0.9382851, 1.598464, 0, 0, 0, 1, 1,
0.2421543, -0.8010253, 2.185105, 0, 0, 0, 1, 1,
0.2449712, 0.8642184, -0.5316743, 0, 0, 0, 1, 1,
0.245174, -1.287453, 3.222645, 0, 0, 0, 1, 1,
0.2461012, -1.418484, 2.465025, 1, 1, 1, 1, 1,
0.246891, 0.1669857, -0.3251016, 1, 1, 1, 1, 1,
0.247182, 1.119031, -0.5311236, 1, 1, 1, 1, 1,
0.2492526, 2.265226, -0.3324771, 1, 1, 1, 1, 1,
0.250203, 0.1452601, 1.819858, 1, 1, 1, 1, 1,
0.2505881, 0.2547908, 1.353639, 1, 1, 1, 1, 1,
0.2525169, -1.080245, 3.020724, 1, 1, 1, 1, 1,
0.2535683, -2.404212, 4.347309, 1, 1, 1, 1, 1,
0.2568795, 0.09011117, 1.412261, 1, 1, 1, 1, 1,
0.2645067, 1.178116, 1.489849, 1, 1, 1, 1, 1,
0.2647287, -0.1604451, 2.5305, 1, 1, 1, 1, 1,
0.267785, 0.1434058, 2.209265, 1, 1, 1, 1, 1,
0.2684147, 0.7658768, 1.831855, 1, 1, 1, 1, 1,
0.2714447, 0.4510836, 0.539915, 1, 1, 1, 1, 1,
0.2757669, 0.3240945, -0.4026357, 1, 1, 1, 1, 1,
0.2770072, -0.1046648, 1.19894, 0, 0, 1, 1, 1,
0.2781902, -1.722086, 2.759769, 1, 0, 0, 1, 1,
0.2922728, -0.726517, 3.175343, 1, 0, 0, 1, 1,
0.2928213, 2.409721, -0.8199869, 1, 0, 0, 1, 1,
0.2935507, -1.011153, 4.576902, 1, 0, 0, 1, 1,
0.2984464, -0.8061296, 3.046597, 1, 0, 0, 1, 1,
0.3003209, 0.1322096, 1.430671, 0, 0, 0, 1, 1,
0.3014679, -1.556871, 2.55652, 0, 0, 0, 1, 1,
0.3015482, 0.3802948, 0.5644524, 0, 0, 0, 1, 1,
0.3048187, -1.255661, 3.381557, 0, 0, 0, 1, 1,
0.3111149, 0.947829, 0.5441952, 0, 0, 0, 1, 1,
0.3140681, 0.06785198, 1.186346, 0, 0, 0, 1, 1,
0.3148514, 0.09321551, 2.084079, 0, 0, 0, 1, 1,
0.3217308, -0.2325237, 2.912585, 1, 1, 1, 1, 1,
0.3222971, -0.1301455, 0.5443837, 1, 1, 1, 1, 1,
0.3225581, -0.3921225, 2.296691, 1, 1, 1, 1, 1,
0.3242742, -0.04647888, 1.061921, 1, 1, 1, 1, 1,
0.325242, 1.466381, -1.28231, 1, 1, 1, 1, 1,
0.325827, 0.7420993, -0.8640451, 1, 1, 1, 1, 1,
0.3288534, -0.9482237, 1.367859, 1, 1, 1, 1, 1,
0.3315836, -0.6701871, 2.992826, 1, 1, 1, 1, 1,
0.335057, -1.891726, 4.219373, 1, 1, 1, 1, 1,
0.3432668, -1.01603, 2.718651, 1, 1, 1, 1, 1,
0.344198, 0.1698499, 2.377149, 1, 1, 1, 1, 1,
0.3526341, 1.376651, 0.400634, 1, 1, 1, 1, 1,
0.3555639, 0.8910827, 0.4921532, 1, 1, 1, 1, 1,
0.3579997, 0.4801492, 0.1079653, 1, 1, 1, 1, 1,
0.3602976, 2.008192, 1.957199, 1, 1, 1, 1, 1,
0.3659126, -0.09831042, 2.726326, 0, 0, 1, 1, 1,
0.3664435, 0.9474843, -0.3038164, 1, 0, 0, 1, 1,
0.3678616, -0.3029571, 2.55865, 1, 0, 0, 1, 1,
0.3690318, -0.6330448, 3.144738, 1, 0, 0, 1, 1,
0.3707232, -0.3994527, 4.617983, 1, 0, 0, 1, 1,
0.3757935, -1.203963, 3.245988, 1, 0, 0, 1, 1,
0.3759834, -1.372394, 2.412726, 0, 0, 0, 1, 1,
0.3771638, 1.598381, 0.08913195, 0, 0, 0, 1, 1,
0.3802419, 0.7570257, 2.307961, 0, 0, 0, 1, 1,
0.3843833, -0.8752838, 3.91403, 0, 0, 0, 1, 1,
0.3895691, 0.1890546, 0.4045011, 0, 0, 0, 1, 1,
0.3936321, -0.7674206, 5.714293, 0, 0, 0, 1, 1,
0.3960901, -0.3638075, 2.401074, 0, 0, 0, 1, 1,
0.3972715, 0.7494376, 1.651699, 1, 1, 1, 1, 1,
0.3972729, -2.294744, 3.305013, 1, 1, 1, 1, 1,
0.3975014, -2.676015, 1.661842, 1, 1, 1, 1, 1,
0.4000522, -0.9673858, 3.990476, 1, 1, 1, 1, 1,
0.4024754, 2.565798, 1.860871, 1, 1, 1, 1, 1,
0.4027779, 0.04217371, 2.668893, 1, 1, 1, 1, 1,
0.4031733, 0.2958028, 0.6461321, 1, 1, 1, 1, 1,
0.4050648, 1.894929, -0.1881987, 1, 1, 1, 1, 1,
0.4074696, -0.8152637, 1.797525, 1, 1, 1, 1, 1,
0.4077145, 0.236003, 1.040092, 1, 1, 1, 1, 1,
0.4097583, -0.2540257, 3.618451, 1, 1, 1, 1, 1,
0.4117928, 0.7659907, -0.049054, 1, 1, 1, 1, 1,
0.4137262, 0.01903281, 2.393666, 1, 1, 1, 1, 1,
0.4153648, 0.6889915, -0.2438169, 1, 1, 1, 1, 1,
0.4193219, 1.322696, 1.23729, 1, 1, 1, 1, 1,
0.4250484, 0.0584203, 2.724268, 0, 0, 1, 1, 1,
0.4298676, -0.8734629, 0.3974839, 1, 0, 0, 1, 1,
0.4358986, 0.2168302, 0.8778837, 1, 0, 0, 1, 1,
0.4495438, 1.509378, 0.5439485, 1, 0, 0, 1, 1,
0.4561961, 0.7337385, -0.2654386, 1, 0, 0, 1, 1,
0.4571109, 0.4565551, 0.667345, 1, 0, 0, 1, 1,
0.4580346, 1.33135, -0.2028337, 0, 0, 0, 1, 1,
0.4583745, -0.2012609, -0.1612219, 0, 0, 0, 1, 1,
0.4604596, 2.003566, 0.276649, 0, 0, 0, 1, 1,
0.4637518, 0.0197069, 2.955359, 0, 0, 0, 1, 1,
0.4689882, 1.649457, 1.141694, 0, 0, 0, 1, 1,
0.4705768, 1.931673, -1.08829, 0, 0, 0, 1, 1,
0.4716456, 1.029098, 0.1835261, 0, 0, 0, 1, 1,
0.4770903, -1.52644, 2.724378, 1, 1, 1, 1, 1,
0.4821272, 0.06794073, 1.849934, 1, 1, 1, 1, 1,
0.4823948, -0.1879542, 1.756674, 1, 1, 1, 1, 1,
0.482589, 0.5147859, 1.67525, 1, 1, 1, 1, 1,
0.4832724, -0.7458643, 0.8092712, 1, 1, 1, 1, 1,
0.4931309, 0.6412871, 1.169592, 1, 1, 1, 1, 1,
0.4953725, 0.4617995, 2.308879, 1, 1, 1, 1, 1,
0.5041077, 0.6882256, -0.09196119, 1, 1, 1, 1, 1,
0.5050965, 0.9419929, 0.4907431, 1, 1, 1, 1, 1,
0.5055317, -2.224207, 2.925121, 1, 1, 1, 1, 1,
0.5066299, 0.8203444, -0.7519893, 1, 1, 1, 1, 1,
0.5073993, -0.4257656, 4.201407, 1, 1, 1, 1, 1,
0.5130686, -0.2248082, 1.083215, 1, 1, 1, 1, 1,
0.5156062, 0.6273273, 0.746086, 1, 1, 1, 1, 1,
0.5199401, -1.445673, 2.204168, 1, 1, 1, 1, 1,
0.5211498, -1.193733, 2.238659, 0, 0, 1, 1, 1,
0.5301961, -1.340264, 2.449157, 1, 0, 0, 1, 1,
0.531732, -0.2205728, 1.735849, 1, 0, 0, 1, 1,
0.5327663, 0.7434883, 0.7563887, 1, 0, 0, 1, 1,
0.5353097, 0.7545667, -0.1354247, 1, 0, 0, 1, 1,
0.5455011, -0.2419726, 1.380581, 1, 0, 0, 1, 1,
0.5463638, -1.1034, 3.510935, 0, 0, 0, 1, 1,
0.5488274, 1.216772, 0.7097304, 0, 0, 0, 1, 1,
0.5538777, -0.3651625, 1.381333, 0, 0, 0, 1, 1,
0.5553939, -0.6375844, 2.226039, 0, 0, 0, 1, 1,
0.5563735, -0.8763251, 3.280791, 0, 0, 0, 1, 1,
0.5618199, -0.00593032, 0.5023084, 0, 0, 0, 1, 1,
0.5627055, -0.3301204, 3.547506, 0, 0, 0, 1, 1,
0.5638395, 0.009126997, 3.272776, 1, 1, 1, 1, 1,
0.5690725, 0.6238726, 0.4697708, 1, 1, 1, 1, 1,
0.5704264, 1.381051, 0.7616062, 1, 1, 1, 1, 1,
0.5721742, 0.9177366, -0.7855716, 1, 1, 1, 1, 1,
0.5785861, -1.408337, 1.261124, 1, 1, 1, 1, 1,
0.5826858, -0.7237046, 1.507224, 1, 1, 1, 1, 1,
0.5856472, -0.7571312, 3.113032, 1, 1, 1, 1, 1,
0.5875179, -1.507155, 3.727169, 1, 1, 1, 1, 1,
0.5875728, -0.5697743, 3.149765, 1, 1, 1, 1, 1,
0.5912473, -0.8157446, 3.341423, 1, 1, 1, 1, 1,
0.591533, 1.990196, -0.8681745, 1, 1, 1, 1, 1,
0.5945894, -1.947363, 5.067278, 1, 1, 1, 1, 1,
0.5955712, 1.077072, 1.056569, 1, 1, 1, 1, 1,
0.5973269, -0.1843842, 2.443386, 1, 1, 1, 1, 1,
0.5981671, 1.036749, 1.709051, 1, 1, 1, 1, 1,
0.5990023, 3.234933, 0.8880848, 0, 0, 1, 1, 1,
0.6008253, 1.466713, -0.1033407, 1, 0, 0, 1, 1,
0.606326, -1.522851, 2.385283, 1, 0, 0, 1, 1,
0.6133806, -0.7454327, 3.161317, 1, 0, 0, 1, 1,
0.6134744, -1.21867, 3.480899, 1, 0, 0, 1, 1,
0.6135706, 1.189962, 0.5873088, 1, 0, 0, 1, 1,
0.613772, 0.004040658, 1.224328, 0, 0, 0, 1, 1,
0.6146583, -0.9774067, 0.7940969, 0, 0, 0, 1, 1,
0.6163567, 0.5090463, 1.53757, 0, 0, 0, 1, 1,
0.6185361, 1.121597, 1.388985, 0, 0, 0, 1, 1,
0.6220161, -0.804333, 1.69614, 0, 0, 0, 1, 1,
0.6246735, 0.8194444, 0.4663454, 0, 0, 0, 1, 1,
0.6260903, -1.230234, 2.576157, 0, 0, 0, 1, 1,
0.6318406, 0.750337, -0.06638879, 1, 1, 1, 1, 1,
0.6324969, -0.7573451, 2.409599, 1, 1, 1, 1, 1,
0.6353078, -1.243819, 3.211331, 1, 1, 1, 1, 1,
0.6401513, 0.1254023, 2.224626, 1, 1, 1, 1, 1,
0.6413168, 0.1719116, 3.224148, 1, 1, 1, 1, 1,
0.6516355, -0.6094812, 2.921791, 1, 1, 1, 1, 1,
0.6541387, 0.6199618, 1.13662, 1, 1, 1, 1, 1,
0.657265, -1.082603, 2.764969, 1, 1, 1, 1, 1,
0.6677583, 2.25057, 0.4366967, 1, 1, 1, 1, 1,
0.6703214, -0.7373697, 4.743071, 1, 1, 1, 1, 1,
0.6740735, 1.738747, -0.2286921, 1, 1, 1, 1, 1,
0.6836089, -1.332222, 1.387168, 1, 1, 1, 1, 1,
0.6861049, -1.002469, 0.9404364, 1, 1, 1, 1, 1,
0.6863883, -0.7867776, -0.06550751, 1, 1, 1, 1, 1,
0.6898978, -2.400718, 0.7463348, 1, 1, 1, 1, 1,
0.6943762, -1.048408, 2.661108, 0, 0, 1, 1, 1,
0.6982507, -1.169052, 0.9245028, 1, 0, 0, 1, 1,
0.7002751, 0.3674366, 0.7079572, 1, 0, 0, 1, 1,
0.7004205, -0.08829269, 2.335877, 1, 0, 0, 1, 1,
0.7035323, -0.6443328, 2.961525, 1, 0, 0, 1, 1,
0.7081227, -0.5657864, 1.531588, 1, 0, 0, 1, 1,
0.7103948, 1.553869, 0.1230418, 0, 0, 0, 1, 1,
0.7122028, -0.2977462, 2.28444, 0, 0, 0, 1, 1,
0.7132155, 0.7210881, 0.4667782, 0, 0, 0, 1, 1,
0.7142124, -2.146542, 3.165936, 0, 0, 0, 1, 1,
0.7248749, -1.747851, 2.829513, 0, 0, 0, 1, 1,
0.7253213, 0.2555228, -0.3513071, 0, 0, 0, 1, 1,
0.7299969, -0.1790102, 1.920892, 0, 0, 0, 1, 1,
0.7303252, -0.06360099, 2.253059, 1, 1, 1, 1, 1,
0.7310595, 2.285899, 0.802581, 1, 1, 1, 1, 1,
0.7347282, -0.05691862, 3.16072, 1, 1, 1, 1, 1,
0.7361612, -1.507176, 2.527217, 1, 1, 1, 1, 1,
0.7427269, 0.2887104, 0.8050107, 1, 1, 1, 1, 1,
0.7444887, 1.795097, 1.899198, 1, 1, 1, 1, 1,
0.7540759, -1.19903, 3.257929, 1, 1, 1, 1, 1,
0.7580249, -1.09595, 5.399023, 1, 1, 1, 1, 1,
0.7583489, -0.9682846, 1.290378, 1, 1, 1, 1, 1,
0.7600026, 0.7213157, 1.117077, 1, 1, 1, 1, 1,
0.7668582, -0.2713467, 2.479429, 1, 1, 1, 1, 1,
0.7673771, -0.9734626, 5.175506, 1, 1, 1, 1, 1,
0.769319, -1.100422, 2.26004, 1, 1, 1, 1, 1,
0.7702215, 1.853677, -1.483956, 1, 1, 1, 1, 1,
0.7814727, 1.992134, 0.365822, 1, 1, 1, 1, 1,
0.7826658, -0.06643938, 3.315554, 0, 0, 1, 1, 1,
0.7829536, 1.524866, 0.7479352, 1, 0, 0, 1, 1,
0.8227655, -0.2555749, 1.017871, 1, 0, 0, 1, 1,
0.8231659, -0.8099625, 2.303196, 1, 0, 0, 1, 1,
0.8249892, 0.2762451, 0.3922984, 1, 0, 0, 1, 1,
0.8277583, 1.89037, 2.059546, 1, 0, 0, 1, 1,
0.8290612, 0.141668, 1.530966, 0, 0, 0, 1, 1,
0.8325013, 0.8069428, -1.133729, 0, 0, 0, 1, 1,
0.8387263, -1.24362, 2.964027, 0, 0, 0, 1, 1,
0.8438796, -0.04514868, 0.3840797, 0, 0, 0, 1, 1,
0.8457038, -0.7722037, 3.071426, 0, 0, 0, 1, 1,
0.8536277, 0.8946005, 1.530402, 0, 0, 0, 1, 1,
0.8605788, -0.6338388, 3.459868, 0, 0, 0, 1, 1,
0.8660195, 1.371831, 0.5247523, 1, 1, 1, 1, 1,
0.8672755, -0.4638702, 1.587167, 1, 1, 1, 1, 1,
0.8697616, -0.1984248, 3.846288, 1, 1, 1, 1, 1,
0.8700384, 0.3675775, 1.41413, 1, 1, 1, 1, 1,
0.8761955, 0.3662727, 2.610443, 1, 1, 1, 1, 1,
0.8797009, 1.29311, -0.2913587, 1, 1, 1, 1, 1,
0.8924233, -0.1202193, 2.376487, 1, 1, 1, 1, 1,
0.8987148, 0.5600846, 2.07179, 1, 1, 1, 1, 1,
0.9073472, 0.5746172, -0.7386202, 1, 1, 1, 1, 1,
0.9098824, 1.689433, 0.6738957, 1, 1, 1, 1, 1,
0.9099197, -0.1482258, 1.990126, 1, 1, 1, 1, 1,
0.9160395, -0.9854695, 2.982603, 1, 1, 1, 1, 1,
0.9221253, -0.2022463, 2.505251, 1, 1, 1, 1, 1,
0.9260952, -0.2972934, 2.540433, 1, 1, 1, 1, 1,
0.930315, 0.2435644, 1.209858, 1, 1, 1, 1, 1,
0.9334368, 1.172163, 0.9253435, 0, 0, 1, 1, 1,
0.9398692, 1.079286, 0.7210649, 1, 0, 0, 1, 1,
0.9413161, 0.008095754, 1.406177, 1, 0, 0, 1, 1,
0.9447005, -0.2043486, 1.588059, 1, 0, 0, 1, 1,
0.9476179, 0.3227362, 2.24589, 1, 0, 0, 1, 1,
0.9599907, -0.7099597, 2.919143, 1, 0, 0, 1, 1,
0.9606458, -0.3111761, 2.825688, 0, 0, 0, 1, 1,
0.9640765, 0.8017557, 1.257899, 0, 0, 0, 1, 1,
0.9648751, 0.6589262, 2.49364, 0, 0, 0, 1, 1,
0.9670892, -0.2560413, 1.258401, 0, 0, 0, 1, 1,
0.9905264, -1.22103, 1.099523, 0, 0, 0, 1, 1,
0.9968346, 1.143268, 0.8447353, 0, 0, 0, 1, 1,
0.998553, 2.201638, 2.338293, 0, 0, 0, 1, 1,
0.9996006, -0.3124383, 3.205986, 1, 1, 1, 1, 1,
1.004273, 0.2123427, 0.7281846, 1, 1, 1, 1, 1,
1.004724, -1.688768, 1.187938, 1, 1, 1, 1, 1,
1.009401, 1.209355, 0.1652387, 1, 1, 1, 1, 1,
1.011321, 1.117876, 1.863946, 1, 1, 1, 1, 1,
1.019528, -0.1765107, 1.215874, 1, 1, 1, 1, 1,
1.021572, 0.06179443, 1.722809, 1, 1, 1, 1, 1,
1.030481, -1.55319, 2.15656, 1, 1, 1, 1, 1,
1.030578, 0.7913737, 0.5415367, 1, 1, 1, 1, 1,
1.037481, 0.8698308, 1.013732, 1, 1, 1, 1, 1,
1.041363, -1.080077, 2.354939, 1, 1, 1, 1, 1,
1.04472, 1.313228, 0.8673539, 1, 1, 1, 1, 1,
1.045824, -0.6820464, 3.017464, 1, 1, 1, 1, 1,
1.048905, 0.4277703, 2.004896, 1, 1, 1, 1, 1,
1.050949, -2.338795, 5.660402, 1, 1, 1, 1, 1,
1.051508, 0.6344431, -0.4739528, 0, 0, 1, 1, 1,
1.053017, 0.3880652, 0.6301711, 1, 0, 0, 1, 1,
1.059398, -1.081306, 2.898502, 1, 0, 0, 1, 1,
1.06004, 2.564866, 1.092656, 1, 0, 0, 1, 1,
1.066413, 1.649441, 0.1264499, 1, 0, 0, 1, 1,
1.069785, 0.7622628, 1.072333, 1, 0, 0, 1, 1,
1.070781, -1.877343, 3.075655, 0, 0, 0, 1, 1,
1.080559, 0.2190422, -0.2351828, 0, 0, 0, 1, 1,
1.081504, 0.6008443, -0.198958, 0, 0, 0, 1, 1,
1.08824, 0.1398146, 2.680784, 0, 0, 0, 1, 1,
1.096829, 1.217914, 1.606766, 0, 0, 0, 1, 1,
1.112375, 1.502606, 0.8064494, 0, 0, 0, 1, 1,
1.113788, -1.125974, 1.510539, 0, 0, 0, 1, 1,
1.120798, -0.3107432, 1.237611, 1, 1, 1, 1, 1,
1.128047, 1.115279, 1.203543, 1, 1, 1, 1, 1,
1.13188, 0.5583794, 2.194546, 1, 1, 1, 1, 1,
1.132202, -0.6622061, 3.262535, 1, 1, 1, 1, 1,
1.136393, 0.05643357, 1.041176, 1, 1, 1, 1, 1,
1.139216, -0.2430658, 2.817472, 1, 1, 1, 1, 1,
1.148437, 2.065388, 0.4728372, 1, 1, 1, 1, 1,
1.154136, 0.06739633, 0.974693, 1, 1, 1, 1, 1,
1.155577, -1.614766, 1.784722, 1, 1, 1, 1, 1,
1.160726, -0.7111688, 2.076916, 1, 1, 1, 1, 1,
1.160765, -0.3051918, 0.5437813, 1, 1, 1, 1, 1,
1.162205, 0.2381814, 1.989168, 1, 1, 1, 1, 1,
1.162975, 0.05627664, 2.071139, 1, 1, 1, 1, 1,
1.168303, -1.628352, 2.94906, 1, 1, 1, 1, 1,
1.173454, 0.6564279, 0.8144217, 1, 1, 1, 1, 1,
1.177628, 0.7772268, 0.6127804, 0, 0, 1, 1, 1,
1.180774, 1.705194, 0.3053612, 1, 0, 0, 1, 1,
1.18213, 1.399939, 0.03056103, 1, 0, 0, 1, 1,
1.182211, -0.09337507, 2.37789, 1, 0, 0, 1, 1,
1.18587, 0.9629666, -0.2485096, 1, 0, 0, 1, 1,
1.194483, 0.8420383, 1.259333, 1, 0, 0, 1, 1,
1.20121, 0.215733, 1.30597, 0, 0, 0, 1, 1,
1.204008, 0.16322, 1.949241, 0, 0, 0, 1, 1,
1.215359, -0.08343627, 1.701747, 0, 0, 0, 1, 1,
1.218011, 0.4457029, 1.011908, 0, 0, 0, 1, 1,
1.227656, 0.5518667, 0.8718091, 0, 0, 0, 1, 1,
1.229729, 1.223822, 2.853873, 0, 0, 0, 1, 1,
1.232406, -0.5636697, 2.313303, 0, 0, 0, 1, 1,
1.23589, 0.1946244, 1.966488, 1, 1, 1, 1, 1,
1.245683, 0.2343175, 0.3984596, 1, 1, 1, 1, 1,
1.249131, 2.243008, 0.8846807, 1, 1, 1, 1, 1,
1.254422, -0.2008569, 0.6526128, 1, 1, 1, 1, 1,
1.261608, -1.244426, 2.942076, 1, 1, 1, 1, 1,
1.263039, 1.110996, 1.22458, 1, 1, 1, 1, 1,
1.269947, 0.3619972, 1.071379, 1, 1, 1, 1, 1,
1.270551, -0.2802158, 0.7591111, 1, 1, 1, 1, 1,
1.271391, -0.3551996, 1.504988, 1, 1, 1, 1, 1,
1.276856, -0.0708321, 0.8890404, 1, 1, 1, 1, 1,
1.27806, -0.6450182, 0.3532203, 1, 1, 1, 1, 1,
1.279721, -0.1695323, 2.461677, 1, 1, 1, 1, 1,
1.292985, 0.6947718, 3.235939, 1, 1, 1, 1, 1,
1.297871, 1.401695, 1.371576, 1, 1, 1, 1, 1,
1.298568, -0.2012398, 1.477093, 1, 1, 1, 1, 1,
1.298574, -0.4109802, 1.15235, 0, 0, 1, 1, 1,
1.307051, 0.5293264, 1.055357, 1, 0, 0, 1, 1,
1.323009, -1.337628, 2.229988, 1, 0, 0, 1, 1,
1.325513, -1.722388, 2.461591, 1, 0, 0, 1, 1,
1.329295, 0.7745652, 1.658475, 1, 0, 0, 1, 1,
1.331695, -0.9698198, 3.219927, 1, 0, 0, 1, 1,
1.357892, -1.499515, 1.990969, 0, 0, 0, 1, 1,
1.36226, 0.2174376, 1.192241, 0, 0, 0, 1, 1,
1.373604, -0.7084524, 2.775732, 0, 0, 0, 1, 1,
1.377847, -0.4430115, 0.4640408, 0, 0, 0, 1, 1,
1.382396, 0.8618231, 0.3434574, 0, 0, 0, 1, 1,
1.387565, 1.449389, 1.385704, 0, 0, 0, 1, 1,
1.392478, 2.165008, 0.4642595, 0, 0, 0, 1, 1,
1.393258, -0.06758603, 1.347267, 1, 1, 1, 1, 1,
1.397726, 0.8368781, -1.599287, 1, 1, 1, 1, 1,
1.397801, -1.871887, 2.711822, 1, 1, 1, 1, 1,
1.398738, 0.8602268, 1.695723, 1, 1, 1, 1, 1,
1.400772, 0.04592548, 0.7391874, 1, 1, 1, 1, 1,
1.403995, 0.8369507, 2.363977, 1, 1, 1, 1, 1,
1.407439, 0.4446565, 0.4130672, 1, 1, 1, 1, 1,
1.411726, -0.5262091, 1.28876, 1, 1, 1, 1, 1,
1.418243, -0.9830859, 3.545525, 1, 1, 1, 1, 1,
1.44252, -1.000665, 2.330483, 1, 1, 1, 1, 1,
1.463002, -0.4272666, 1.781576, 1, 1, 1, 1, 1,
1.463207, 0.3253322, 1.174662, 1, 1, 1, 1, 1,
1.469897, -1.988722, 2.976068, 1, 1, 1, 1, 1,
1.487661, -0.5580286, 1.894711, 1, 1, 1, 1, 1,
1.489637, 0.4345905, 2.81082, 1, 1, 1, 1, 1,
1.492151, 0.8922043, -0.7328615, 0, 0, 1, 1, 1,
1.516641, -0.09797075, 2.318244, 1, 0, 0, 1, 1,
1.521129, 0.5278239, 1.313558, 1, 0, 0, 1, 1,
1.525913, 0.4296782, 1.86603, 1, 0, 0, 1, 1,
1.528173, -0.2951868, 2.402874, 1, 0, 0, 1, 1,
1.52842, -0.09132846, 1.117498, 1, 0, 0, 1, 1,
1.538604, 0.05376455, 0.6184297, 0, 0, 0, 1, 1,
1.542634, 0.03081227, 2.640555, 0, 0, 0, 1, 1,
1.544019, 0.8717129, 1.449722, 0, 0, 0, 1, 1,
1.552059, -0.4126365, 2.205039, 0, 0, 0, 1, 1,
1.560108, 0.09545936, 2.182993, 0, 0, 0, 1, 1,
1.566344, 0.3299814, 2.769512, 0, 0, 0, 1, 1,
1.569049, 1.181434, 1.063225, 0, 0, 0, 1, 1,
1.583951, -1.17969, 1.12331, 1, 1, 1, 1, 1,
1.588467, -0.7279086, 3.723738, 1, 1, 1, 1, 1,
1.625432, 1.002578, -0.08259924, 1, 1, 1, 1, 1,
1.636487, -0.2771972, 1.050941, 1, 1, 1, 1, 1,
1.637636, -1.85058, 2.48042, 1, 1, 1, 1, 1,
1.663601, 0.3262943, 0.5632344, 1, 1, 1, 1, 1,
1.665402, -0.2610578, 2.065216, 1, 1, 1, 1, 1,
1.677387, 0.3123384, 1.330647, 1, 1, 1, 1, 1,
1.687179, -1.029125, 1.164227, 1, 1, 1, 1, 1,
1.6915, -2.025825, 4.107035, 1, 1, 1, 1, 1,
1.696326, -0.7625784, 3.758317, 1, 1, 1, 1, 1,
1.697972, 0.6691657, 0.9076534, 1, 1, 1, 1, 1,
1.708693, 0.6615528, 2.487458, 1, 1, 1, 1, 1,
1.729029, -0.0304232, 3.154511, 1, 1, 1, 1, 1,
1.761172, 0.32836, 1.344127, 1, 1, 1, 1, 1,
1.769782, 0.7116966, 3.490385, 0, 0, 1, 1, 1,
1.779641, 0.1729673, 1.39825, 1, 0, 0, 1, 1,
1.785349, -1.38595, 3.024909, 1, 0, 0, 1, 1,
1.787365, -0.5587357, 3.411, 1, 0, 0, 1, 1,
1.793166, -1.130714, 0.7514341, 1, 0, 0, 1, 1,
1.794424, -0.2057022, 2.29216, 1, 0, 0, 1, 1,
1.814536, -0.3693984, 0.3369685, 0, 0, 0, 1, 1,
1.824353, 0.9160335, 2.379447, 0, 0, 0, 1, 1,
1.826553, 0.6184362, 1.053394, 0, 0, 0, 1, 1,
1.831885, 0.2932209, 0.6321113, 0, 0, 0, 1, 1,
1.882107, 0.9135203, 1.016112, 0, 0, 0, 1, 1,
1.888353, 0.9686288, 3.344809, 0, 0, 0, 1, 1,
1.898477, -1.491418, 4.132866, 0, 0, 0, 1, 1,
1.907503, -0.4884727, 1.238094, 1, 1, 1, 1, 1,
1.924297, 1.714105, 0.6796482, 1, 1, 1, 1, 1,
1.9299, -0.7543479, 1.856073, 1, 1, 1, 1, 1,
1.934691, -2.225008, 2.629826, 1, 1, 1, 1, 1,
1.94658, 0.8971322, -0.7794071, 1, 1, 1, 1, 1,
1.948478, 0.8549912, 1.983291, 1, 1, 1, 1, 1,
1.949255, -0.3209947, 3.523669, 1, 1, 1, 1, 1,
1.953162, 0.1878086, -0.5314986, 1, 1, 1, 1, 1,
1.98998, -1.837887, 2.936591, 1, 1, 1, 1, 1,
2.012608, 1.23859, 1.067942, 1, 1, 1, 1, 1,
2.028437, -0.2877035, 1.353886, 1, 1, 1, 1, 1,
2.032548, -0.1404205, 1.688453, 1, 1, 1, 1, 1,
2.045037, 0.1906133, 2.2691, 1, 1, 1, 1, 1,
2.05219, 0.6651649, 1.3749, 1, 1, 1, 1, 1,
2.061153, -1.86694, 3.397275, 1, 1, 1, 1, 1,
2.067049, 1.18908, 1.349848, 0, 0, 1, 1, 1,
2.169988, 0.5748702, 1.788275, 1, 0, 0, 1, 1,
2.186021, 1.212404, 0.5241399, 1, 0, 0, 1, 1,
2.223355, 0.1416995, 1.486828, 1, 0, 0, 1, 1,
2.250165, 1.243418, 1.048021, 1, 0, 0, 1, 1,
2.274175, 0.4679074, 0.2559828, 1, 0, 0, 1, 1,
2.278505, -0.2763884, 1.02905, 0, 0, 0, 1, 1,
2.306323, -1.779848, 2.202078, 0, 0, 0, 1, 1,
2.345798, 0.3120877, 0.2067893, 0, 0, 0, 1, 1,
2.383075, -1.134878, 1.488071, 0, 0, 0, 1, 1,
2.391694, -0.09516228, 1.308697, 0, 0, 0, 1, 1,
2.409205, -0.8403692, 2.32651, 0, 0, 0, 1, 1,
2.484049, -0.8830777, 1.383847, 0, 0, 0, 1, 1,
2.558023, -0.4081973, 0.3159468, 1, 1, 1, 1, 1,
2.654297, 0.7210549, 0.5111316, 1, 1, 1, 1, 1,
2.836689, 0.8699293, -0.4578393, 1, 1, 1, 1, 1,
2.848273, 1.794482, 1.049054, 1, 1, 1, 1, 1,
2.904397, 0.4317368, -0.1841928, 1, 1, 1, 1, 1,
2.955605, -0.6143218, -0.4115104, 1, 1, 1, 1, 1,
3.078053, -1.512466, 3.509561, 1, 1, 1, 1, 1
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
var radius = 9.656908;
var distance = 33.91948;
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
mvMatrix.translate( -0.1055458, -0.8815347, -0.3488474 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.91948);
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
