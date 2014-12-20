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
-3.004862, 0.2557813, -1.339686, 1, 0, 0, 1,
-2.758658, -0.9932847, -3.074526, 1, 0.007843138, 0, 1,
-2.647675, 2.59183, 0.5203272, 1, 0.01176471, 0, 1,
-2.6459, -0.4602357, -3.438483, 1, 0.01960784, 0, 1,
-2.45769, 0.6067733, -2.456548, 1, 0.02352941, 0, 1,
-2.445279, -0.3617545, -3.775454, 1, 0.03137255, 0, 1,
-2.42549, 0.09467016, -2.703991, 1, 0.03529412, 0, 1,
-2.376508, 0.4580891, -2.670081, 1, 0.04313726, 0, 1,
-2.334471, -0.7047334, -2.669637, 1, 0.04705882, 0, 1,
-2.314937, -0.5257112, -1.800244, 1, 0.05490196, 0, 1,
-2.276016, -0.4035724, -1.946753, 1, 0.05882353, 0, 1,
-2.271994, -1.56833, -1.050837, 1, 0.06666667, 0, 1,
-2.226466, -2.296291, -1.626071, 1, 0.07058824, 0, 1,
-2.126699, 0.8326414, -0.2101609, 1, 0.07843138, 0, 1,
-2.084702, -0.3974746, -1.549579, 1, 0.08235294, 0, 1,
-2.074261, 0.8973758, -0.3712702, 1, 0.09019608, 0, 1,
-2.067622, 0.03465573, -1.054031, 1, 0.09411765, 0, 1,
-2.052728, -1.090768, -3.021523, 1, 0.1019608, 0, 1,
-2.032486, 0.8446783, -1.653813, 1, 0.1098039, 0, 1,
-2.024314, 0.9878783, -2.214185, 1, 0.1137255, 0, 1,
-1.995841, -2.701223, -3.069314, 1, 0.1215686, 0, 1,
-1.980973, -1.096343, -1.54863, 1, 0.1254902, 0, 1,
-1.945982, -0.144078, -2.920611, 1, 0.1333333, 0, 1,
-1.940382, -0.2560267, -0.9896525, 1, 0.1372549, 0, 1,
-1.922525, 0.9845255, -2.194909, 1, 0.145098, 0, 1,
-1.922384, 0.09004837, -1.64812, 1, 0.1490196, 0, 1,
-1.882052, -0.4392858, -1.461237, 1, 0.1568628, 0, 1,
-1.865744, 0.6555097, -1.242475, 1, 0.1607843, 0, 1,
-1.843863, 0.7173549, -2.013181, 1, 0.1686275, 0, 1,
-1.84291, -0.676538, -2.53867, 1, 0.172549, 0, 1,
-1.834069, -0.5917856, -1.667103, 1, 0.1803922, 0, 1,
-1.826075, -1.247646, -3.414422, 1, 0.1843137, 0, 1,
-1.82237, 0.3178437, -1.801277, 1, 0.1921569, 0, 1,
-1.808258, -0.9197966, -2.457664, 1, 0.1960784, 0, 1,
-1.803888, -0.09526062, -2.577172, 1, 0.2039216, 0, 1,
-1.801266, -1.280066, -2.025542, 1, 0.2117647, 0, 1,
-1.795413, 1.730439, 0.4269714, 1, 0.2156863, 0, 1,
-1.793078, 0.0206468, -1.135908, 1, 0.2235294, 0, 1,
-1.778135, -0.1367439, 0.6715651, 1, 0.227451, 0, 1,
-1.760759, 0.7327813, -1.388017, 1, 0.2352941, 0, 1,
-1.737293, -1.137633, -2.333671, 1, 0.2392157, 0, 1,
-1.716269, -0.6912394, -0.004766478, 1, 0.2470588, 0, 1,
-1.71522, -0.8572593, -2.438333, 1, 0.2509804, 0, 1,
-1.70966, 1.480241, -2.218412, 1, 0.2588235, 0, 1,
-1.680378, -0.4494392, -2.988129, 1, 0.2627451, 0, 1,
-1.678019, 0.09199265, -2.554569, 1, 0.2705882, 0, 1,
-1.673672, -0.7261696, -0.8343659, 1, 0.2745098, 0, 1,
-1.661274, -0.1790023, -0.2105037, 1, 0.282353, 0, 1,
-1.660311, 1.085001, -0.7618016, 1, 0.2862745, 0, 1,
-1.654403, 0.9286008, -1.49964, 1, 0.2941177, 0, 1,
-1.630707, 1.624496, -0.06629872, 1, 0.3019608, 0, 1,
-1.622434, -0.2218732, -1.197661, 1, 0.3058824, 0, 1,
-1.621567, 0.3059961, -1.237003, 1, 0.3137255, 0, 1,
-1.60768, -0.0798052, -2.521702, 1, 0.3176471, 0, 1,
-1.601388, 0.09992591, 0.3819684, 1, 0.3254902, 0, 1,
-1.571337, 0.221211, -0.4455498, 1, 0.3294118, 0, 1,
-1.546842, -0.8284045, -3.932307, 1, 0.3372549, 0, 1,
-1.54042, -0.5641449, -2.861917, 1, 0.3411765, 0, 1,
-1.539207, 0.3589607, -0.3748288, 1, 0.3490196, 0, 1,
-1.538399, -0.2391694, -3.288361, 1, 0.3529412, 0, 1,
-1.53707, 1.079065, -2.006088, 1, 0.3607843, 0, 1,
-1.518113, 0.5467578, -1.492124, 1, 0.3647059, 0, 1,
-1.516214, 0.1888853, 0.009494314, 1, 0.372549, 0, 1,
-1.516079, 0.2184007, 0.5057178, 1, 0.3764706, 0, 1,
-1.50387, -0.1641473, -2.561905, 1, 0.3843137, 0, 1,
-1.488537, -0.3773804, -3.49701, 1, 0.3882353, 0, 1,
-1.481856, -0.4882661, -0.9311548, 1, 0.3960784, 0, 1,
-1.480146, -0.5435768, -0.2376298, 1, 0.4039216, 0, 1,
-1.455889, 0.799821, -3.873446, 1, 0.4078431, 0, 1,
-1.443739, 2.364613, 1.964972, 1, 0.4156863, 0, 1,
-1.439228, -1.958947, -2.913217, 1, 0.4196078, 0, 1,
-1.430314, -1.193368, -2.667686, 1, 0.427451, 0, 1,
-1.42938, -0.6163688, -2.01604, 1, 0.4313726, 0, 1,
-1.425036, 0.4721415, -0.9284437, 1, 0.4392157, 0, 1,
-1.424217, 0.724822, -0.8852009, 1, 0.4431373, 0, 1,
-1.3719, 0.752384, -0.8497189, 1, 0.4509804, 0, 1,
-1.36789, -1.079207, -2.370029, 1, 0.454902, 0, 1,
-1.361254, -0.02635445, -1.838203, 1, 0.4627451, 0, 1,
-1.360871, -0.2963954, -1.925956, 1, 0.4666667, 0, 1,
-1.360747, 0.5025967, 0.6202855, 1, 0.4745098, 0, 1,
-1.357137, -0.3215206, -2.16146, 1, 0.4784314, 0, 1,
-1.346555, 0.08209222, -1.126471, 1, 0.4862745, 0, 1,
-1.345976, -0.4983011, -1.787848, 1, 0.4901961, 0, 1,
-1.344358, -1.05636, -3.494954, 1, 0.4980392, 0, 1,
-1.331944, -0.1604338, -1.594223, 1, 0.5058824, 0, 1,
-1.330171, 0.1020298, -0.5677874, 1, 0.509804, 0, 1,
-1.327942, -0.8899509, -2.645546, 1, 0.5176471, 0, 1,
-1.326005, 0.666059, 0.6015955, 1, 0.5215687, 0, 1,
-1.317854, 1.098078, -0.8212486, 1, 0.5294118, 0, 1,
-1.317169, 0.3456076, -1.636225, 1, 0.5333334, 0, 1,
-1.315851, 2.729237, -1.361148, 1, 0.5411765, 0, 1,
-1.305003, -0.9117301, -1.867714, 1, 0.5450981, 0, 1,
-1.294999, -0.6464638, -2.81256, 1, 0.5529412, 0, 1,
-1.285831, -0.8978058, -4.153215, 1, 0.5568628, 0, 1,
-1.284503, 1.41502, 0.5519781, 1, 0.5647059, 0, 1,
-1.2815, -0.2521006, -2.637733, 1, 0.5686275, 0, 1,
-1.269695, -0.378475, -2.991789, 1, 0.5764706, 0, 1,
-1.269052, -1.397834, -1.460442, 1, 0.5803922, 0, 1,
-1.268946, -0.4158028, -2.885294, 1, 0.5882353, 0, 1,
-1.266958, -0.1184995, -1.870679, 1, 0.5921569, 0, 1,
-1.254039, 0.8044894, -1.992149, 1, 0.6, 0, 1,
-1.241495, -0.9238325, -1.230365, 1, 0.6078432, 0, 1,
-1.23702, 1.323516, 0.05788442, 1, 0.6117647, 0, 1,
-1.235625, 0.06848893, -1.886491, 1, 0.6196079, 0, 1,
-1.228483, -0.2136732, -2.244905, 1, 0.6235294, 0, 1,
-1.227873, 0.9548799, -1.410411, 1, 0.6313726, 0, 1,
-1.217116, -0.8990051, -0.5109468, 1, 0.6352941, 0, 1,
-1.211557, -0.4685175, -4.457092, 1, 0.6431373, 0, 1,
-1.208166, 0.9230845, 0.507251, 1, 0.6470588, 0, 1,
-1.204177, -0.7483239, -0.4030825, 1, 0.654902, 0, 1,
-1.194188, 1.02205, 0.4431025, 1, 0.6588235, 0, 1,
-1.186606, -0.04414489, -0.1551649, 1, 0.6666667, 0, 1,
-1.185011, -0.2332388, -0.1383471, 1, 0.6705883, 0, 1,
-1.179099, -1.248588, -2.435712, 1, 0.6784314, 0, 1,
-1.170784, 1.829277, -0.8004846, 1, 0.682353, 0, 1,
-1.16231, 0.3074527, -1.706629, 1, 0.6901961, 0, 1,
-1.156768, -0.5128782, -0.8974512, 1, 0.6941177, 0, 1,
-1.153055, 0.114725, -1.252346, 1, 0.7019608, 0, 1,
-1.147196, 1.293783, -0.4932164, 1, 0.7098039, 0, 1,
-1.144626, 0.2358944, -1.641489, 1, 0.7137255, 0, 1,
-1.143346, -0.9419735, -2.306263, 1, 0.7215686, 0, 1,
-1.13713, -0.4517527, -2.161153, 1, 0.7254902, 0, 1,
-1.133322, 1.483694, -0.8978527, 1, 0.7333333, 0, 1,
-1.13074, 1.309972, -0.1710718, 1, 0.7372549, 0, 1,
-1.130346, 0.404401, -2.276566, 1, 0.7450981, 0, 1,
-1.129183, 0.1295264, -2.144211, 1, 0.7490196, 0, 1,
-1.126011, 1.119884, 0.0189679, 1, 0.7568628, 0, 1,
-1.119606, 0.02653855, 0.2996958, 1, 0.7607843, 0, 1,
-1.102076, -2.043716, -3.950952, 1, 0.7686275, 0, 1,
-1.094553, 0.3330581, -0.7587012, 1, 0.772549, 0, 1,
-1.082355, 0.8354044, 0.8609904, 1, 0.7803922, 0, 1,
-1.081165, -0.6028447, -2.556239, 1, 0.7843137, 0, 1,
-1.07693, 0.3712645, -0.7231907, 1, 0.7921569, 0, 1,
-1.074167, 0.1248407, -1.060613, 1, 0.7960784, 0, 1,
-1.064335, 0.6677857, -1.217462, 1, 0.8039216, 0, 1,
-1.060349, 1.721695, -1.934131, 1, 0.8117647, 0, 1,
-1.054846, 0.6351195, -3.540845, 1, 0.8156863, 0, 1,
-1.045195, -0.554722, -2.239153, 1, 0.8235294, 0, 1,
-1.044295, 0.04392122, -1.014119, 1, 0.827451, 0, 1,
-1.044159, -0.3268083, -2.240736, 1, 0.8352941, 0, 1,
-1.041442, -1.085541, -2.071366, 1, 0.8392157, 0, 1,
-1.037508, 0.84137, -2.212108, 1, 0.8470588, 0, 1,
-1.030237, -1.440286, -1.34591, 1, 0.8509804, 0, 1,
-1.028126, -1.197217, -2.105211, 1, 0.8588235, 0, 1,
-1.02385, -0.6999649, -2.759736, 1, 0.8627451, 0, 1,
-1.019078, 1.182886, -0.8862393, 1, 0.8705882, 0, 1,
-1.01282, 0.526962, -1.479133, 1, 0.8745098, 0, 1,
-1.006466, -1.30975, -3.762277, 1, 0.8823529, 0, 1,
-1.005826, 0.07296886, -1.898688, 1, 0.8862745, 0, 1,
-1.001069, -0.2814611, -1.258854, 1, 0.8941177, 0, 1,
-0.9880991, 0.8836553, -0.5478587, 1, 0.8980392, 0, 1,
-0.9780028, -1.462082, -1.294564, 1, 0.9058824, 0, 1,
-0.9768395, -0.4336967, -4.05382, 1, 0.9137255, 0, 1,
-0.9755408, 1.256976, 1.075534, 1, 0.9176471, 0, 1,
-0.9703424, 0.6166454, -0.1449752, 1, 0.9254902, 0, 1,
-0.9695488, -0.185692, -0.9690391, 1, 0.9294118, 0, 1,
-0.9648175, -0.2217744, -0.2246917, 1, 0.9372549, 0, 1,
-0.9583566, -0.6899471, -2.757798, 1, 0.9411765, 0, 1,
-0.9565966, 0.1659998, -1.427009, 1, 0.9490196, 0, 1,
-0.956567, 0.6877254, -2.05896, 1, 0.9529412, 0, 1,
-0.954091, 1.206906, -0.2510526, 1, 0.9607843, 0, 1,
-0.9539484, 1.128172, -0.628241, 1, 0.9647059, 0, 1,
-0.950422, 0.1922334, -2.256396, 1, 0.972549, 0, 1,
-0.9428783, 0.4773792, -0.9037517, 1, 0.9764706, 0, 1,
-0.9416956, -0.6640144, -1.371111, 1, 0.9843137, 0, 1,
-0.9398867, -1.020995, -2.808769, 1, 0.9882353, 0, 1,
-0.9383391, -0.1770965, -0.702481, 1, 0.9960784, 0, 1,
-0.9374924, -0.1126964, -3.170747, 0.9960784, 1, 0, 1,
-0.931603, 0.4587537, -0.3943915, 0.9921569, 1, 0, 1,
-0.9314782, -0.1789557, -3.04012, 0.9843137, 1, 0, 1,
-0.9294564, -0.7986987, -2.092425, 0.9803922, 1, 0, 1,
-0.9228783, 0.8949609, -2.512579, 0.972549, 1, 0, 1,
-0.921977, -0.8744478, -1.589168, 0.9686275, 1, 0, 1,
-0.9176533, -0.6274088, -3.826077, 0.9607843, 1, 0, 1,
-0.9176113, 1.206135, -1.315971, 0.9568627, 1, 0, 1,
-0.9055402, 0.08233988, -0.07091598, 0.9490196, 1, 0, 1,
-0.897834, 0.3100249, -2.007882, 0.945098, 1, 0, 1,
-0.8904979, -0.2882808, -1.105358, 0.9372549, 1, 0, 1,
-0.8883137, 0.3026541, -1.13607, 0.9333333, 1, 0, 1,
-0.8876924, -2.120207, -3.654736, 0.9254902, 1, 0, 1,
-0.8871164, -1.081312, -2.556095, 0.9215686, 1, 0, 1,
-0.8852217, -0.3989889, -2.480824, 0.9137255, 1, 0, 1,
-0.8808463, -0.1668392, -2.734884, 0.9098039, 1, 0, 1,
-0.8768253, -0.5589384, -2.132941, 0.9019608, 1, 0, 1,
-0.8718591, 0.4190828, -0.6632057, 0.8941177, 1, 0, 1,
-0.8713489, 1.284467, -0.4924718, 0.8901961, 1, 0, 1,
-0.8640367, 0.3240503, -1.291878, 0.8823529, 1, 0, 1,
-0.8634543, -0.5880327, -1.13194, 0.8784314, 1, 0, 1,
-0.8625758, -1.034045, -3.662236, 0.8705882, 1, 0, 1,
-0.8615022, -1.367136, -3.24141, 0.8666667, 1, 0, 1,
-0.8613961, -1.954721, -4.923878, 0.8588235, 1, 0, 1,
-0.8603602, -1.351169, -2.391653, 0.854902, 1, 0, 1,
-0.8573792, -0.4923219, -2.628024, 0.8470588, 1, 0, 1,
-0.8570646, 1.346901, -1.441108, 0.8431373, 1, 0, 1,
-0.8551165, -1.873638, -1.321823, 0.8352941, 1, 0, 1,
-0.8541711, 0.5453483, -0.2073126, 0.8313726, 1, 0, 1,
-0.8529661, -1.29637, -2.024976, 0.8235294, 1, 0, 1,
-0.8517761, 0.0410848, -1.027463, 0.8196079, 1, 0, 1,
-0.8504116, 1.270621, -0.5365611, 0.8117647, 1, 0, 1,
-0.8462481, -1.428357, -3.944289, 0.8078431, 1, 0, 1,
-0.8388261, -0.3718362, -1.949365, 0.8, 1, 0, 1,
-0.8362666, 0.2053705, -2.471618, 0.7921569, 1, 0, 1,
-0.8352859, 0.239303, 0.4810262, 0.7882353, 1, 0, 1,
-0.821484, 0.6708464, -1.645417, 0.7803922, 1, 0, 1,
-0.8195264, 0.5188583, -0.6870403, 0.7764706, 1, 0, 1,
-0.8194262, -1.802198, -2.402117, 0.7686275, 1, 0, 1,
-0.8160805, -0.1192408, -1.337583, 0.7647059, 1, 0, 1,
-0.8121779, 1.48834, -0.9039879, 0.7568628, 1, 0, 1,
-0.8100968, 2.244933, 0.08229099, 0.7529412, 1, 0, 1,
-0.8082013, 0.1333107, -0.4878291, 0.7450981, 1, 0, 1,
-0.8056183, -1.90356, -4.601994, 0.7411765, 1, 0, 1,
-0.7999923, 0.5193291, -1.565908, 0.7333333, 1, 0, 1,
-0.7997599, 1.304807, -0.005391756, 0.7294118, 1, 0, 1,
-0.7992537, 1.010332, -1.356578, 0.7215686, 1, 0, 1,
-0.7900093, 0.5972868, -1.491157, 0.7176471, 1, 0, 1,
-0.7884862, 1.220394, -0.8977277, 0.7098039, 1, 0, 1,
-0.7869728, 0.447761, -2.888532, 0.7058824, 1, 0, 1,
-0.783528, -1.618042, -1.806724, 0.6980392, 1, 0, 1,
-0.776155, 0.3788885, 0.4002858, 0.6901961, 1, 0, 1,
-0.7744357, 0.4869438, -1.172743, 0.6862745, 1, 0, 1,
-0.7621725, -0.928134, -2.285139, 0.6784314, 1, 0, 1,
-0.7609783, 0.08282322, -0.4760855, 0.6745098, 1, 0, 1,
-0.7508093, 0.5321456, -1.543428, 0.6666667, 1, 0, 1,
-0.7478569, -0.8580444, -2.189153, 0.6627451, 1, 0, 1,
-0.7477783, -0.1434297, -1.519901, 0.654902, 1, 0, 1,
-0.7471814, -1.487494, -4.607182, 0.6509804, 1, 0, 1,
-0.7407514, 0.2815812, -1.923006, 0.6431373, 1, 0, 1,
-0.7339618, 0.7352335, 0.3129764, 0.6392157, 1, 0, 1,
-0.7330644, 1.139035, 1.600984, 0.6313726, 1, 0, 1,
-0.7279959, -1.34232, -2.523653, 0.627451, 1, 0, 1,
-0.7216307, 0.7139541, -1.444234, 0.6196079, 1, 0, 1,
-0.7178994, -0.2561218, -0.5704723, 0.6156863, 1, 0, 1,
-0.7141497, 0.1804576, -1.927239, 0.6078432, 1, 0, 1,
-0.7127101, -1.485454, -2.992887, 0.6039216, 1, 0, 1,
-0.7097478, -0.6206347, -2.824448, 0.5960785, 1, 0, 1,
-0.7078316, -0.1818087, -1.904381, 0.5882353, 1, 0, 1,
-0.7075635, 0.02377738, -2.210141, 0.5843138, 1, 0, 1,
-0.6999862, 0.3116301, -1.948961, 0.5764706, 1, 0, 1,
-0.6999137, 0.1855, -1.829881, 0.572549, 1, 0, 1,
-0.6980925, -1.541494, -1.765187, 0.5647059, 1, 0, 1,
-0.6976107, -0.209561, -1.607027, 0.5607843, 1, 0, 1,
-0.6918933, -0.183911, -1.263785, 0.5529412, 1, 0, 1,
-0.6913083, 0.1916171, -2.685856, 0.5490196, 1, 0, 1,
-0.6904148, 1.475622, -1.339507, 0.5411765, 1, 0, 1,
-0.6891145, -0.8426524, -1.997238, 0.5372549, 1, 0, 1,
-0.6853475, 0.149251, -1.3057, 0.5294118, 1, 0, 1,
-0.6833884, 0.2978349, 0.1472595, 0.5254902, 1, 0, 1,
-0.6811189, -0.3036265, -1.856437, 0.5176471, 1, 0, 1,
-0.675118, 1.138539, -0.3320523, 0.5137255, 1, 0, 1,
-0.6743264, -0.6055257, -2.359076, 0.5058824, 1, 0, 1,
-0.6730057, 0.2739844, -1.772817, 0.5019608, 1, 0, 1,
-0.6698431, -1.226985, -3.321957, 0.4941176, 1, 0, 1,
-0.6682256, -1.300033, -3.696256, 0.4862745, 1, 0, 1,
-0.6621853, -1.744513, -2.762527, 0.4823529, 1, 0, 1,
-0.6489934, 1.169216, -0.7852845, 0.4745098, 1, 0, 1,
-0.6447692, 0.4618129, -2.136332, 0.4705882, 1, 0, 1,
-0.6422595, 0.2682291, -0.7027102, 0.4627451, 1, 0, 1,
-0.6306067, 1.162361, -1.626928, 0.4588235, 1, 0, 1,
-0.6296757, 0.6126512, -0.8450482, 0.4509804, 1, 0, 1,
-0.6270708, 1.314958, -0.4635736, 0.4470588, 1, 0, 1,
-0.6223466, -0.3117442, -2.668973, 0.4392157, 1, 0, 1,
-0.6183258, -1.327222, -2.917145, 0.4352941, 1, 0, 1,
-0.6131128, -1.460065, -3.1742, 0.427451, 1, 0, 1,
-0.6111282, 0.6608552, -0.4312518, 0.4235294, 1, 0, 1,
-0.609118, 0.4337225, -2.61262, 0.4156863, 1, 0, 1,
-0.5967078, -0.1904391, -1.183756, 0.4117647, 1, 0, 1,
-0.5962882, -0.4262049, -3.198941, 0.4039216, 1, 0, 1,
-0.5936444, 1.747202, 0.2330599, 0.3960784, 1, 0, 1,
-0.5916868, 1.151403, -1.013603, 0.3921569, 1, 0, 1,
-0.5883574, 0.2451628, -0.5457268, 0.3843137, 1, 0, 1,
-0.5846213, -0.9503758, -0.5950737, 0.3803922, 1, 0, 1,
-0.5837436, 0.1409427, -1.028973, 0.372549, 1, 0, 1,
-0.5832682, 0.8701989, 0.5551538, 0.3686275, 1, 0, 1,
-0.5770757, -0.7829635, -1.894783, 0.3607843, 1, 0, 1,
-0.5743181, 0.42387, -1.660715, 0.3568628, 1, 0, 1,
-0.5729508, 1.543959, 0.524921, 0.3490196, 1, 0, 1,
-0.5673785, -1.237309, -2.546541, 0.345098, 1, 0, 1,
-0.5654255, 0.544789, -0.3711687, 0.3372549, 1, 0, 1,
-0.5595333, 1.094235, -0.8878325, 0.3333333, 1, 0, 1,
-0.5593875, -0.09268329, -2.200418, 0.3254902, 1, 0, 1,
-0.5578307, -0.8134273, -2.591449, 0.3215686, 1, 0, 1,
-0.5559248, 0.1374958, -1.301578, 0.3137255, 1, 0, 1,
-0.5519793, -0.6343744, -1.460628, 0.3098039, 1, 0, 1,
-0.5504708, 0.8116667, -0.9116496, 0.3019608, 1, 0, 1,
-0.5489292, -1.112239, -0.9321018, 0.2941177, 1, 0, 1,
-0.5436605, -0.8927227, -0.8840852, 0.2901961, 1, 0, 1,
-0.5419495, 0.09562821, -1.349025, 0.282353, 1, 0, 1,
-0.5407769, -0.168988, 0.5171592, 0.2784314, 1, 0, 1,
-0.5392573, -2.566524, -2.338959, 0.2705882, 1, 0, 1,
-0.5357397, -0.733157, -2.644076, 0.2666667, 1, 0, 1,
-0.5350666, -1.407476, -4.648623, 0.2588235, 1, 0, 1,
-0.5324333, 0.3869839, -1.996416, 0.254902, 1, 0, 1,
-0.5241911, 0.4288166, -1.262773, 0.2470588, 1, 0, 1,
-0.5214444, -0.3119329, -2.534261, 0.2431373, 1, 0, 1,
-0.5203771, 0.3991428, 0.5886443, 0.2352941, 1, 0, 1,
-0.5180901, -2.44261, -2.664491, 0.2313726, 1, 0, 1,
-0.5175174, 1.06824, 0.695557, 0.2235294, 1, 0, 1,
-0.5123259, -1.234759, -2.683732, 0.2196078, 1, 0, 1,
-0.5105636, -0.35806, -2.51893, 0.2117647, 1, 0, 1,
-0.5082579, -0.7350124, -3.018382, 0.2078431, 1, 0, 1,
-0.507666, -0.8798457, -2.136843, 0.2, 1, 0, 1,
-0.5069649, -0.4382224, -2.903024, 0.1921569, 1, 0, 1,
-0.5065409, 2.094172, 0.7102947, 0.1882353, 1, 0, 1,
-0.5054535, -0.07437385, -1.660676, 0.1803922, 1, 0, 1,
-0.5020369, -1.225348, -2.412957, 0.1764706, 1, 0, 1,
-0.4995346, -0.02815043, -2.538161, 0.1686275, 1, 0, 1,
-0.4987984, -0.689133, -4.2132, 0.1647059, 1, 0, 1,
-0.498783, -0.5805323, -3.119547, 0.1568628, 1, 0, 1,
-0.4985225, 1.163221, -0.1257115, 0.1529412, 1, 0, 1,
-0.4962894, 0.3425552, -2.103543, 0.145098, 1, 0, 1,
-0.4951579, 0.3400518, -0.8127993, 0.1411765, 1, 0, 1,
-0.4929255, 0.427815, -1.768906, 0.1333333, 1, 0, 1,
-0.4885831, -1.540095, -2.145765, 0.1294118, 1, 0, 1,
-0.488349, 1.436162, -2.265839, 0.1215686, 1, 0, 1,
-0.4820947, 0.528174, 0.2623163, 0.1176471, 1, 0, 1,
-0.4624861, 0.3784919, 0.2464251, 0.1098039, 1, 0, 1,
-0.4608037, -0.1731913, -2.804848, 0.1058824, 1, 0, 1,
-0.4582838, 0.386713, -0.390386, 0.09803922, 1, 0, 1,
-0.457711, 0.3011619, -0.7535346, 0.09019608, 1, 0, 1,
-0.4546614, -0.5291276, -1.42486, 0.08627451, 1, 0, 1,
-0.4522998, -0.01390728, -1.070542, 0.07843138, 1, 0, 1,
-0.4517138, 0.3569008, 0.2895343, 0.07450981, 1, 0, 1,
-0.4487397, -1.375119, -3.73311, 0.06666667, 1, 0, 1,
-0.447493, 0.7961935, -0.3744993, 0.0627451, 1, 0, 1,
-0.4383696, 0.09961939, -1.249466, 0.05490196, 1, 0, 1,
-0.4346358, -0.9895959, -0.9122378, 0.05098039, 1, 0, 1,
-0.4317359, -0.1820638, -1.49649, 0.04313726, 1, 0, 1,
-0.4282734, 0.8628978, -0.740054, 0.03921569, 1, 0, 1,
-0.4282561, -0.3703164, -1.131503, 0.03137255, 1, 0, 1,
-0.4279065, 0.1391905, -0.6366625, 0.02745098, 1, 0, 1,
-0.4263158, 1.80123, -0.4098571, 0.01960784, 1, 0, 1,
-0.4260665, 1.611064, -1.216323, 0.01568628, 1, 0, 1,
-0.4209503, 1.42119, 0.4972304, 0.007843138, 1, 0, 1,
-0.4192817, -0.4065642, -1.700844, 0.003921569, 1, 0, 1,
-0.4178497, 1.133109, -0.253482, 0, 1, 0.003921569, 1,
-0.4151985, -0.9178029, -3.652478, 0, 1, 0.01176471, 1,
-0.4089469, -1.052265, -3.515463, 0, 1, 0.01568628, 1,
-0.4079982, 0.6175035, 0.2082326, 0, 1, 0.02352941, 1,
-0.4058786, -0.3943532, -3.502906, 0, 1, 0.02745098, 1,
-0.4049161, -1.776895, -2.344273, 0, 1, 0.03529412, 1,
-0.404031, 0.9164342, -0.5880371, 0, 1, 0.03921569, 1,
-0.4036323, 0.3265046, -0.1338013, 0, 1, 0.04705882, 1,
-0.4020122, 1.289205, -0.6471236, 0, 1, 0.05098039, 1,
-0.4018134, -0.4067311, -3.076837, 0, 1, 0.05882353, 1,
-0.4004802, -0.0520817, -0.8783878, 0, 1, 0.0627451, 1,
-0.3974135, 0.757212, 0.5517085, 0, 1, 0.07058824, 1,
-0.3941325, -1.553106, -2.813117, 0, 1, 0.07450981, 1,
-0.3917564, -0.8798893, -2.321882, 0, 1, 0.08235294, 1,
-0.3899946, 0.4857331, -2.070617, 0, 1, 0.08627451, 1,
-0.3829832, 0.3422225, -0.1435698, 0, 1, 0.09411765, 1,
-0.3781294, 0.2782615, -1.02186, 0, 1, 0.1019608, 1,
-0.3749159, 0.3303064, -0.3717218, 0, 1, 0.1058824, 1,
-0.3712585, -0.1306877, -3.075339, 0, 1, 0.1137255, 1,
-0.3695018, 0.2739519, -1.471971, 0, 1, 0.1176471, 1,
-0.364345, 0.6371612, 0.1066096, 0, 1, 0.1254902, 1,
-0.3602212, 0.3475517, -0.1013264, 0, 1, 0.1294118, 1,
-0.3592584, 0.3509552, 0.7053611, 0, 1, 0.1372549, 1,
-0.3585167, 1.094548, -0.08265934, 0, 1, 0.1411765, 1,
-0.3575026, 0.9574563, -0.6116726, 0, 1, 0.1490196, 1,
-0.355671, 0.6195558, -1.107797, 0, 1, 0.1529412, 1,
-0.3528927, 0.07099937, -3.210328, 0, 1, 0.1607843, 1,
-0.3496858, -0.1251796, -3.394778, 0, 1, 0.1647059, 1,
-0.3460488, -0.895073, -2.658817, 0, 1, 0.172549, 1,
-0.3382075, 0.136811, -2.20476, 0, 1, 0.1764706, 1,
-0.3374628, -0.750882, -0.9293094, 0, 1, 0.1843137, 1,
-0.336652, 0.8906715, -1.161434, 0, 1, 0.1882353, 1,
-0.3347718, -1.432369, -2.477387, 0, 1, 0.1960784, 1,
-0.3293283, 0.4806163, -1.049932, 0, 1, 0.2039216, 1,
-0.3281089, 0.3236393, -1.22743, 0, 1, 0.2078431, 1,
-0.3204769, -1.873392, -3.603769, 0, 1, 0.2156863, 1,
-0.3182676, -0.6287556, -3.857392, 0, 1, 0.2196078, 1,
-0.3176362, -0.8165304, -2.363127, 0, 1, 0.227451, 1,
-0.3115873, -1.588379, -3.260836, 0, 1, 0.2313726, 1,
-0.3110902, 1.413111, -0.9928173, 0, 1, 0.2392157, 1,
-0.3085832, 0.38605, -1.064806, 0, 1, 0.2431373, 1,
-0.3085746, 0.311702, 1.338439, 0, 1, 0.2509804, 1,
-0.3066048, 0.2542025, -0.9911848, 0, 1, 0.254902, 1,
-0.3060662, -0.8053893, -5.022526, 0, 1, 0.2627451, 1,
-0.305983, -0.001153252, -1.920512, 0, 1, 0.2666667, 1,
-0.3052136, -0.257545, -0.5839484, 0, 1, 0.2745098, 1,
-0.3049863, -1.006937, -2.966331, 0, 1, 0.2784314, 1,
-0.3020209, 0.009632302, -2.711553, 0, 1, 0.2862745, 1,
-0.2990282, -1.274601, -1.334291, 0, 1, 0.2901961, 1,
-0.2957936, 0.02867628, -1.135487, 0, 1, 0.2980392, 1,
-0.2946192, -1.021795, -3.238736, 0, 1, 0.3058824, 1,
-0.2915274, -1.394421, -3.434571, 0, 1, 0.3098039, 1,
-0.2907865, 0.6272269, -1.374048, 0, 1, 0.3176471, 1,
-0.2896156, 1.189465, 0.9391282, 0, 1, 0.3215686, 1,
-0.2889904, 0.2655929, -1.169982, 0, 1, 0.3294118, 1,
-0.2869794, 1.197389, -0.2970314, 0, 1, 0.3333333, 1,
-0.2863602, -0.2648183, -2.279111, 0, 1, 0.3411765, 1,
-0.2853599, -0.7548612, -2.740286, 0, 1, 0.345098, 1,
-0.2845556, -1.031684, -2.47668, 0, 1, 0.3529412, 1,
-0.283189, -0.9817933, -3.772966, 0, 1, 0.3568628, 1,
-0.281574, 0.1060723, -0.7578555, 0, 1, 0.3647059, 1,
-0.2807029, 1.360235, -0.3131202, 0, 1, 0.3686275, 1,
-0.2801908, 1.338152, -0.1150891, 0, 1, 0.3764706, 1,
-0.2760001, 0.7171936, -0.8689951, 0, 1, 0.3803922, 1,
-0.2679825, 0.4669667, 0.4682306, 0, 1, 0.3882353, 1,
-0.2666396, 0.6159163, -1.043595, 0, 1, 0.3921569, 1,
-0.2658599, 1.048383, 1.662756, 0, 1, 0.4, 1,
-0.2605416, -1.300162, -2.078469, 0, 1, 0.4078431, 1,
-0.2543287, 0.9759113, -1.531345, 0, 1, 0.4117647, 1,
-0.2543043, -0.3263142, -2.925488, 0, 1, 0.4196078, 1,
-0.2510826, -0.7598234, -3.385772, 0, 1, 0.4235294, 1,
-0.2510811, -1.401281, -3.757512, 0, 1, 0.4313726, 1,
-0.2500969, -1.899487, -1.653597, 0, 1, 0.4352941, 1,
-0.2480437, -0.06625678, -2.503204, 0, 1, 0.4431373, 1,
-0.2475475, 0.2121781, -0.7541279, 0, 1, 0.4470588, 1,
-0.2456486, 0.06690811, -0.9938684, 0, 1, 0.454902, 1,
-0.2443177, 0.1914946, 0.4515654, 0, 1, 0.4588235, 1,
-0.2440379, 0.3944978, -0.7537153, 0, 1, 0.4666667, 1,
-0.2398221, 1.225669, 0.8861973, 0, 1, 0.4705882, 1,
-0.2379695, 0.3030207, -1.027636, 0, 1, 0.4784314, 1,
-0.2356238, 1.462196, 0.2292526, 0, 1, 0.4823529, 1,
-0.2339197, 0.1137576, -1.01452, 0, 1, 0.4901961, 1,
-0.232118, 0.1993502, 1.406584, 0, 1, 0.4941176, 1,
-0.2264977, 0.8048931, -0.5978907, 0, 1, 0.5019608, 1,
-0.2261179, -1.521304, -2.497163, 0, 1, 0.509804, 1,
-0.22308, 0.5977151, -1.340729, 0, 1, 0.5137255, 1,
-0.2227459, 0.472781, 0.2248922, 0, 1, 0.5215687, 1,
-0.2220955, 0.07265195, -2.878478, 0, 1, 0.5254902, 1,
-0.2213347, 1.398866, -1.014255, 0, 1, 0.5333334, 1,
-0.2202151, -0.009637347, -0.4874913, 0, 1, 0.5372549, 1,
-0.2162974, -0.09160269, -1.375407, 0, 1, 0.5450981, 1,
-0.215637, -0.094067, -1.449616, 0, 1, 0.5490196, 1,
-0.2151296, -0.6836128, -3.459235, 0, 1, 0.5568628, 1,
-0.2145415, 0.1511061, -2.52812, 0, 1, 0.5607843, 1,
-0.2123377, -0.9343295, -3.264246, 0, 1, 0.5686275, 1,
-0.2110837, 1.46988, -0.585122, 0, 1, 0.572549, 1,
-0.2092261, -0.1765068, -2.386234, 0, 1, 0.5803922, 1,
-0.2088054, -0.8311937, -3.093575, 0, 1, 0.5843138, 1,
-0.2044051, 1.326514, 0.5233587, 0, 1, 0.5921569, 1,
-0.2023356, 0.3780369, -1.527956, 0, 1, 0.5960785, 1,
-0.1987639, -0.4366745, -3.216058, 0, 1, 0.6039216, 1,
-0.1981499, 0.7038264, -0.4804792, 0, 1, 0.6117647, 1,
-0.1942509, -0.1366179, -2.632921, 0, 1, 0.6156863, 1,
-0.1841203, 1.345307, 0.2613093, 0, 1, 0.6235294, 1,
-0.1837593, 0.7451324, -2.25166, 0, 1, 0.627451, 1,
-0.1784875, -0.3162926, -2.37294, 0, 1, 0.6352941, 1,
-0.1773047, 0.08901644, -0.4548076, 0, 1, 0.6392157, 1,
-0.1771205, -1.426054, -3.392498, 0, 1, 0.6470588, 1,
-0.1743212, -1.186324, -2.802031, 0, 1, 0.6509804, 1,
-0.1718601, 0.8798117, 1.123514, 0, 1, 0.6588235, 1,
-0.1703222, -0.6030711, -3.948667, 0, 1, 0.6627451, 1,
-0.1674145, 0.8217731, 0.07537131, 0, 1, 0.6705883, 1,
-0.1641899, -0.4441104, -1.060431, 0, 1, 0.6745098, 1,
-0.161249, 0.7230365, -1.819269, 0, 1, 0.682353, 1,
-0.160997, 0.1245405, -1.572813, 0, 1, 0.6862745, 1,
-0.1601774, -1.122575, -2.826327, 0, 1, 0.6941177, 1,
-0.1594151, -1.148705, -1.867008, 0, 1, 0.7019608, 1,
-0.1576536, -0.5878308, -1.161435, 0, 1, 0.7058824, 1,
-0.1561713, 1.734509, 1.366903, 0, 1, 0.7137255, 1,
-0.1554771, 0.2796635, -2.509557, 0, 1, 0.7176471, 1,
-0.1532609, -2.181622, -0.5519007, 0, 1, 0.7254902, 1,
-0.1530806, -0.8844326, -3.533178, 0, 1, 0.7294118, 1,
-0.1517097, 1.093679, -0.5986694, 0, 1, 0.7372549, 1,
-0.1492398, -0.05085644, -2.651313, 0, 1, 0.7411765, 1,
-0.1482553, 0.05629189, -0.7027317, 0, 1, 0.7490196, 1,
-0.1481141, 0.8517278, 0.7551042, 0, 1, 0.7529412, 1,
-0.147614, -2.054643, -3.409131, 0, 1, 0.7607843, 1,
-0.1427635, -0.3837714, -2.609624, 0, 1, 0.7647059, 1,
-0.142755, 1.379613, 1.936754, 0, 1, 0.772549, 1,
-0.1416915, -0.1407488, -3.057572, 0, 1, 0.7764706, 1,
-0.1412543, 1.381676, -0.7279982, 0, 1, 0.7843137, 1,
-0.1359237, -1.017889, -2.802262, 0, 1, 0.7882353, 1,
-0.1339111, 2.28754, 2.220945, 0, 1, 0.7960784, 1,
-0.1325372, 0.1786367, -2.354737, 0, 1, 0.8039216, 1,
-0.1298028, 0.7651979, 0.8185318, 0, 1, 0.8078431, 1,
-0.129747, 1.205753, 0.001077535, 0, 1, 0.8156863, 1,
-0.1282599, -0.4560978, -1.899477, 0, 1, 0.8196079, 1,
-0.125767, 0.653146, -0.3364328, 0, 1, 0.827451, 1,
-0.1241621, -1.267552, -4.381857, 0, 1, 0.8313726, 1,
-0.1220012, -0.5672469, -2.524097, 0, 1, 0.8392157, 1,
-0.1200195, -0.8427734, -3.131964, 0, 1, 0.8431373, 1,
-0.117976, -0.4237008, -4.353287, 0, 1, 0.8509804, 1,
-0.1177312, -3.87115, -3.601509, 0, 1, 0.854902, 1,
-0.11562, 0.01494116, -1.413114, 0, 1, 0.8627451, 1,
-0.1141035, 1.28793, -1.673608, 0, 1, 0.8666667, 1,
-0.1124883, 0.7487736, 2.130016, 0, 1, 0.8745098, 1,
-0.1114663, -0.1946971, -2.158177, 0, 1, 0.8784314, 1,
-0.1094378, -1.007453, -2.16909, 0, 1, 0.8862745, 1,
-0.09973823, -0.3809442, -2.13388, 0, 1, 0.8901961, 1,
-0.09788503, 1.106955, -0.3915959, 0, 1, 0.8980392, 1,
-0.09671579, 0.2549284, -0.6135859, 0, 1, 0.9058824, 1,
-0.09528411, -0.3224267, -3.429178, 0, 1, 0.9098039, 1,
-0.09353842, -0.1873425, -2.39871, 0, 1, 0.9176471, 1,
-0.09094134, -1.712256, -1.072385, 0, 1, 0.9215686, 1,
-0.089933, -2.087199, -3.814835, 0, 1, 0.9294118, 1,
-0.0896941, -1.700959, -1.733891, 0, 1, 0.9333333, 1,
-0.08880654, 2.057124, 0.8118364, 0, 1, 0.9411765, 1,
-0.08834943, 1.007435, 0.1252432, 0, 1, 0.945098, 1,
-0.08508587, -0.6012627, -3.74075, 0, 1, 0.9529412, 1,
-0.08438082, -0.01357422, -1.289433, 0, 1, 0.9568627, 1,
-0.08423643, -0.3471431, -4.788627, 0, 1, 0.9647059, 1,
-0.08282202, -0.2584952, -3.08773, 0, 1, 0.9686275, 1,
-0.08039834, -0.7795512, -4.099975, 0, 1, 0.9764706, 1,
-0.07947911, 0.7683538, 1.011479, 0, 1, 0.9803922, 1,
-0.06420123, 0.7810999, -2.157554, 0, 1, 0.9882353, 1,
-0.06276169, -0.721778, -2.165578, 0, 1, 0.9921569, 1,
-0.06169729, -0.09261441, -2.212563, 0, 1, 1, 1,
-0.06053915, 1.12919, -2.200292, 0, 0.9921569, 1, 1,
-0.05845566, 1.729026, -0.1864312, 0, 0.9882353, 1, 1,
-0.04691319, 0.4455978, -2.632928, 0, 0.9803922, 1, 1,
-0.04457586, 0.9188999, -0.9159085, 0, 0.9764706, 1, 1,
-0.04199491, -0.9706675, -2.74359, 0, 0.9686275, 1, 1,
-0.03812003, -0.4219236, -2.197448, 0, 0.9647059, 1, 1,
-0.03488754, -0.1465071, -1.055097, 0, 0.9568627, 1, 1,
-0.03253302, -1.662771, -3.042038, 0, 0.9529412, 1, 1,
-0.03189007, -0.37057, -3.013447, 0, 0.945098, 1, 1,
-0.02797664, 0.5172575, -0.08958894, 0, 0.9411765, 1, 1,
-0.02584935, 0.2960697, -1.466065, 0, 0.9333333, 1, 1,
-0.02474946, -1.383697, -3.351917, 0, 0.9294118, 1, 1,
-0.02460349, -0.02789319, -2.463174, 0, 0.9215686, 1, 1,
-0.02275084, 0.3192977, 0.1153975, 0, 0.9176471, 1, 1,
-0.02269416, 1.527112, 1.263368, 0, 0.9098039, 1, 1,
-0.01637389, -0.1920877, -1.367298, 0, 0.9058824, 1, 1,
-0.01469219, -0.726505, -4.856052, 0, 0.8980392, 1, 1,
-0.01410197, -0.06588289, -3.290563, 0, 0.8901961, 1, 1,
-0.007164777, 0.428482, 0.2500181, 0, 0.8862745, 1, 1,
-0.006609907, 1.135873, -0.01540006, 0, 0.8784314, 1, 1,
-0.002096397, 1.653803, 0.8434317, 0, 0.8745098, 1, 1,
0.00211011, 0.3000779, -0.3654253, 0, 0.8666667, 1, 1,
0.002450274, -0.8251078, 2.130359, 0, 0.8627451, 1, 1,
0.003298606, 0.3907999, 0.5332763, 0, 0.854902, 1, 1,
0.00387605, -0.6994974, 3.323727, 0, 0.8509804, 1, 1,
0.005389454, -0.8688055, 1.841723, 0, 0.8431373, 1, 1,
0.006317008, -1.826178, 1.693049, 0, 0.8392157, 1, 1,
0.006611615, -1.019547, 4.00302, 0, 0.8313726, 1, 1,
0.007222588, -0.2333457, 2.915965, 0, 0.827451, 1, 1,
0.007379576, -1.213654, 4.220465, 0, 0.8196079, 1, 1,
0.009125427, 0.9906424, -0.2048193, 0, 0.8156863, 1, 1,
0.01025713, 1.283669, -1.18839, 0, 0.8078431, 1, 1,
0.01142145, -0.8158261, 3.552011, 0, 0.8039216, 1, 1,
0.01221606, -0.2990259, 4.387924, 0, 0.7960784, 1, 1,
0.0131348, 1.01644, -1.218976, 0, 0.7882353, 1, 1,
0.0139422, -1.365484, 1.000589, 0, 0.7843137, 1, 1,
0.01468346, -0.3314971, 3.163895, 0, 0.7764706, 1, 1,
0.01568513, 0.2554166, 0.6698461, 0, 0.772549, 1, 1,
0.01704972, 0.390523, -0.01166324, 0, 0.7647059, 1, 1,
0.01805451, 0.5513886, -0.2497388, 0, 0.7607843, 1, 1,
0.01841723, -0.3308357, 5.098413, 0, 0.7529412, 1, 1,
0.02256159, -1.36319, 2.315355, 0, 0.7490196, 1, 1,
0.02278661, 0.5056968, 1.055886, 0, 0.7411765, 1, 1,
0.02300874, 0.8013258, 1.170092, 0, 0.7372549, 1, 1,
0.02494595, -0.09965394, 1.428676, 0, 0.7294118, 1, 1,
0.02644681, -0.9926981, 3.589198, 0, 0.7254902, 1, 1,
0.03568251, -2.132191, 3.691505, 0, 0.7176471, 1, 1,
0.04472527, -1.156357, 3.797091, 0, 0.7137255, 1, 1,
0.04604402, -1.272424, 2.007528, 0, 0.7058824, 1, 1,
0.05844351, -0.6230842, 1.949537, 0, 0.6980392, 1, 1,
0.06038186, -0.6793755, 3.955827, 0, 0.6941177, 1, 1,
0.06263334, -0.5019863, 5.045865, 0, 0.6862745, 1, 1,
0.06864361, -0.02250815, 1.562955, 0, 0.682353, 1, 1,
0.07262387, -1.033396, 2.643232, 0, 0.6745098, 1, 1,
0.07880288, -0.2628251, 1.319329, 0, 0.6705883, 1, 1,
0.08178546, 1.840641, -1.408087, 0, 0.6627451, 1, 1,
0.08339773, -0.2898616, 4.671723, 0, 0.6588235, 1, 1,
0.08350895, -0.9633542, 3.547885, 0, 0.6509804, 1, 1,
0.08484292, -0.02537795, 1.944282, 0, 0.6470588, 1, 1,
0.08526736, -0.7847782, 2.281249, 0, 0.6392157, 1, 1,
0.08575606, -0.003955469, 0.7807246, 0, 0.6352941, 1, 1,
0.08911028, 0.09648779, 0.2742445, 0, 0.627451, 1, 1,
0.09378603, 0.3819711, 1.407081, 0, 0.6235294, 1, 1,
0.0946122, -1.047412, 4.080345, 0, 0.6156863, 1, 1,
0.09610863, -0.869024, 3.008449, 0, 0.6117647, 1, 1,
0.09687388, 0.548062, 0.9206354, 0, 0.6039216, 1, 1,
0.1072357, 0.7267452, -1.881989, 0, 0.5960785, 1, 1,
0.1075394, -1.279238, 3.146555, 0, 0.5921569, 1, 1,
0.1093359, -0.148421, 3.044521, 0, 0.5843138, 1, 1,
0.1104411, 0.2552895, 1.534941, 0, 0.5803922, 1, 1,
0.1142643, -0.1966584, 4.300832, 0, 0.572549, 1, 1,
0.1190487, -0.1743203, 2.814429, 0, 0.5686275, 1, 1,
0.119339, -1.560611, 1.209144, 0, 0.5607843, 1, 1,
0.1202562, -0.4602429, 1.659666, 0, 0.5568628, 1, 1,
0.1204125, -1.099764, 4.085079, 0, 0.5490196, 1, 1,
0.1230461, 1.159479, -0.1069439, 0, 0.5450981, 1, 1,
0.1248252, 0.2260157, 0.67478, 0, 0.5372549, 1, 1,
0.1258881, 0.4755775, 1.729824, 0, 0.5333334, 1, 1,
0.1271162, 0.1283351, 0.1278771, 0, 0.5254902, 1, 1,
0.129077, -0.241562, 2.896249, 0, 0.5215687, 1, 1,
0.1297648, 0.9874501, -0.1653572, 0, 0.5137255, 1, 1,
0.1297792, 0.174658, 0.4707578, 0, 0.509804, 1, 1,
0.1335825, 0.5729678, 0.2219388, 0, 0.5019608, 1, 1,
0.1354181, -1.458974, 3.18212, 0, 0.4941176, 1, 1,
0.1383633, 2.180043, -1.01253, 0, 0.4901961, 1, 1,
0.1391819, -0.8500339, 3.794283, 0, 0.4823529, 1, 1,
0.1398471, -1.508512, 2.205464, 0, 0.4784314, 1, 1,
0.1446864, -0.1627328, 0.2680206, 0, 0.4705882, 1, 1,
0.1467847, -0.8976387, 2.604837, 0, 0.4666667, 1, 1,
0.1470924, 1.119536, 1.099064, 0, 0.4588235, 1, 1,
0.1538954, 1.13774, -0.7783796, 0, 0.454902, 1, 1,
0.1572855, -0.5249856, 2.83219, 0, 0.4470588, 1, 1,
0.1598149, -1.293572, 4.123671, 0, 0.4431373, 1, 1,
0.1604456, 0.4189212, 1.275326, 0, 0.4352941, 1, 1,
0.1615936, 0.2915667, 0.6513649, 0, 0.4313726, 1, 1,
0.1621841, -0.6206506, 3.090953, 0, 0.4235294, 1, 1,
0.163085, 0.04042231, 1.650286, 0, 0.4196078, 1, 1,
0.163648, -0.03404889, 1.187543, 0, 0.4117647, 1, 1,
0.1697839, -1.118196, 1.592698, 0, 0.4078431, 1, 1,
0.1699353, 0.8652346, 0.4969825, 0, 0.4, 1, 1,
0.1738056, -0.7857815, 2.593691, 0, 0.3921569, 1, 1,
0.1768525, -0.02400991, 0.477541, 0, 0.3882353, 1, 1,
0.1800161, 0.283089, 0.7808237, 0, 0.3803922, 1, 1,
0.1839176, -1.183852, 3.877983, 0, 0.3764706, 1, 1,
0.1846073, -0.07783217, 2.838003, 0, 0.3686275, 1, 1,
0.197415, 0.7240236, 2.509676, 0, 0.3647059, 1, 1,
0.1999284, 1.009931, -0.01107019, 0, 0.3568628, 1, 1,
0.2004693, 0.7117978, -1.235741, 0, 0.3529412, 1, 1,
0.2013027, -0.3732205, 4.474907, 0, 0.345098, 1, 1,
0.2013305, 0.4045281, 0.5921578, 0, 0.3411765, 1, 1,
0.2015516, -1.345354, 3.06325, 0, 0.3333333, 1, 1,
0.202409, 0.8834289, -0.7014708, 0, 0.3294118, 1, 1,
0.2033659, -1.336581, 2.6421, 0, 0.3215686, 1, 1,
0.2039253, -0.6643371, 2.139095, 0, 0.3176471, 1, 1,
0.2056123, -1.327789, 3.016663, 0, 0.3098039, 1, 1,
0.2139402, -1.182904, 3.922064, 0, 0.3058824, 1, 1,
0.2184626, -0.9147687, 3.058727, 0, 0.2980392, 1, 1,
0.2197388, 0.6884498, 1.022208, 0, 0.2901961, 1, 1,
0.2205683, 0.470196, 2.073978, 0, 0.2862745, 1, 1,
0.2219185, 0.8295987, 1.293954, 0, 0.2784314, 1, 1,
0.2223699, -0.8424549, 2.723161, 0, 0.2745098, 1, 1,
0.2235122, 1.260358, 1.038786, 0, 0.2666667, 1, 1,
0.2270973, -0.5046144, 2.02214, 0, 0.2627451, 1, 1,
0.2292919, -0.9857569, 1.645627, 0, 0.254902, 1, 1,
0.2313122, -1.535342, 2.675056, 0, 0.2509804, 1, 1,
0.2329464, 0.2007194, 0.3956587, 0, 0.2431373, 1, 1,
0.2358391, -1.284312, 1.90565, 0, 0.2392157, 1, 1,
0.2361465, -0.7367616, 3.437585, 0, 0.2313726, 1, 1,
0.2405796, 1.050374, 1.524079, 0, 0.227451, 1, 1,
0.2440618, 0.5325727, -0.6066583, 0, 0.2196078, 1, 1,
0.2448508, 0.3304141, 0.7996231, 0, 0.2156863, 1, 1,
0.2484037, -0.9776802, 2.780215, 0, 0.2078431, 1, 1,
0.2506626, 1.016913, 0.9693916, 0, 0.2039216, 1, 1,
0.2511573, 0.7656623, 1.807156, 0, 0.1960784, 1, 1,
0.2525886, 1.911252, 0.1506426, 0, 0.1882353, 1, 1,
0.2535317, -0.4318798, 3.484044, 0, 0.1843137, 1, 1,
0.2560034, 1.2864, 0.3767675, 0, 0.1764706, 1, 1,
0.2593533, 0.2442981, 0.6980348, 0, 0.172549, 1, 1,
0.2602879, 1.15039, 0.4993063, 0, 0.1647059, 1, 1,
0.2615036, 0.653365, -0.1288204, 0, 0.1607843, 1, 1,
0.2634213, -0.1446533, 0.8350025, 0, 0.1529412, 1, 1,
0.2653812, -1.843811, 3.582797, 0, 0.1490196, 1, 1,
0.2660022, 1.113419, 0.246526, 0, 0.1411765, 1, 1,
0.2694347, 0.3811675, 3.411979, 0, 0.1372549, 1, 1,
0.2746069, -1.187975, 3.68386, 0, 0.1294118, 1, 1,
0.276876, 1.402487, 0.0545698, 0, 0.1254902, 1, 1,
0.2788201, -0.1467243, 2.701503, 0, 0.1176471, 1, 1,
0.2790295, -0.1312176, 1.68072, 0, 0.1137255, 1, 1,
0.2791437, 2.11923, 0.496612, 0, 0.1058824, 1, 1,
0.2843347, 0.08651626, 2.151447, 0, 0.09803922, 1, 1,
0.2885666, 0.008747883, -1.17379, 0, 0.09411765, 1, 1,
0.2898733, -0.07327665, 1.17436, 0, 0.08627451, 1, 1,
0.29454, -0.8639405, 4.360507, 0, 0.08235294, 1, 1,
0.2964255, -0.8109011, -1.362423, 0, 0.07450981, 1, 1,
0.3006543, -1.055147, 2.636855, 0, 0.07058824, 1, 1,
0.3039426, 0.6873052, 1.656592, 0, 0.0627451, 1, 1,
0.3058697, 0.2374763, -1.66432, 0, 0.05882353, 1, 1,
0.3077189, -0.0140788, 1.061967, 0, 0.05098039, 1, 1,
0.3086037, 1.245367, 1.547976, 0, 0.04705882, 1, 1,
0.3158307, 2.672386, -0.07176042, 0, 0.03921569, 1, 1,
0.3200158, 0.08098481, 0.7197857, 0, 0.03529412, 1, 1,
0.3215733, -0.7833375, 0.2508127, 0, 0.02745098, 1, 1,
0.3245068, -1.560194, 3.846285, 0, 0.02352941, 1, 1,
0.3280339, -0.674207, 2.214911, 0, 0.01568628, 1, 1,
0.3307326, -0.6809162, 2.934626, 0, 0.01176471, 1, 1,
0.3364475, 0.390804, -0.2545982, 0, 0.003921569, 1, 1,
0.3464704, -0.1763959, 1.107043, 0.003921569, 0, 1, 1,
0.3497413, -1.470489, 1.405779, 0.007843138, 0, 1, 1,
0.3567858, 0.8736459, 0.773358, 0.01568628, 0, 1, 1,
0.357125, 0.4290634, 0.05590402, 0.01960784, 0, 1, 1,
0.3580778, -0.1084586, 0.8854244, 0.02745098, 0, 1, 1,
0.3594503, -1.149772, 3.775997, 0.03137255, 0, 1, 1,
0.3661347, -0.2760199, 2.65026, 0.03921569, 0, 1, 1,
0.3669928, 0.2144948, 0.8355687, 0.04313726, 0, 1, 1,
0.3703487, -0.7301548, -0.1375125, 0.05098039, 0, 1, 1,
0.3719971, 0.05685676, 0.04534273, 0.05490196, 0, 1, 1,
0.3728431, -1.069576, 1.014278, 0.0627451, 0, 1, 1,
0.3822999, -0.4771989, 1.620543, 0.06666667, 0, 1, 1,
0.3845865, 0.6551387, -0.2139909, 0.07450981, 0, 1, 1,
0.3883649, 2.140042, 0.6805691, 0.07843138, 0, 1, 1,
0.3933151, -0.5194888, 1.031916, 0.08627451, 0, 1, 1,
0.3936655, -0.3898326, 3.743796, 0.09019608, 0, 1, 1,
0.3954535, -1.499929, 3.59812, 0.09803922, 0, 1, 1,
0.4027315, 1.589975, -2.224005, 0.1058824, 0, 1, 1,
0.4050781, 0.1957025, -0.4114362, 0.1098039, 0, 1, 1,
0.4066251, -1.408166, 3.928952, 0.1176471, 0, 1, 1,
0.4070219, -0.4109312, 2.489617, 0.1215686, 0, 1, 1,
0.4144855, 0.872413, 1.559008, 0.1294118, 0, 1, 1,
0.4145972, 0.7269741, 0.390827, 0.1333333, 0, 1, 1,
0.4209712, 0.3191954, 2.357869, 0.1411765, 0, 1, 1,
0.4229489, -0.5827835, 1.265665, 0.145098, 0, 1, 1,
0.4232975, 1.274993, 0.6498022, 0.1529412, 0, 1, 1,
0.4254129, -0.5148653, 2.940431, 0.1568628, 0, 1, 1,
0.4275151, -0.8299002, 2.23903, 0.1647059, 0, 1, 1,
0.4294389, 0.7944007, 0.5927246, 0.1686275, 0, 1, 1,
0.4326538, -0.02696856, 1.673914, 0.1764706, 0, 1, 1,
0.4342456, 0.4807436, 1.43054, 0.1803922, 0, 1, 1,
0.4395103, -1.123378, 1.231428, 0.1882353, 0, 1, 1,
0.4483799, -0.7948157, 1.691204, 0.1921569, 0, 1, 1,
0.4534672, 1.584097, 1.435155, 0.2, 0, 1, 1,
0.4569696, -0.06301124, 2.163619, 0.2078431, 0, 1, 1,
0.4604033, -0.7135, 3.111612, 0.2117647, 0, 1, 1,
0.461569, 0.433732, 1.416813, 0.2196078, 0, 1, 1,
0.470829, 0.7107416, -0.3138602, 0.2235294, 0, 1, 1,
0.4769318, -0.7315983, 2.815661, 0.2313726, 0, 1, 1,
0.4770735, -1.591134, 2.575158, 0.2352941, 0, 1, 1,
0.4815585, -0.3353495, 2.513833, 0.2431373, 0, 1, 1,
0.4816204, -0.1903154, 1.716242, 0.2470588, 0, 1, 1,
0.4838927, 0.3129083, 1.386699, 0.254902, 0, 1, 1,
0.4928502, 0.3018959, 1.647168, 0.2588235, 0, 1, 1,
0.4929424, 0.4004778, 0.8292856, 0.2666667, 0, 1, 1,
0.4955009, -0.7992905, 3.367333, 0.2705882, 0, 1, 1,
0.4966754, 0.2985618, 0.1243587, 0.2784314, 0, 1, 1,
0.4977545, 0.9889256, 0.6025875, 0.282353, 0, 1, 1,
0.4985658, -0.6462758, 0.4030455, 0.2901961, 0, 1, 1,
0.5021326, -0.4989591, 3.59224, 0.2941177, 0, 1, 1,
0.5043598, 1.555166, -0.7122761, 0.3019608, 0, 1, 1,
0.5178286, 1.115147, 0.1170994, 0.3098039, 0, 1, 1,
0.5188242, -0.3493737, 3.285712, 0.3137255, 0, 1, 1,
0.5251707, -0.1522056, 1.92182, 0.3215686, 0, 1, 1,
0.5274045, -0.1875935, 2.098902, 0.3254902, 0, 1, 1,
0.5294072, -0.2217896, 0.4193693, 0.3333333, 0, 1, 1,
0.5302699, -2.880992, 3.042848, 0.3372549, 0, 1, 1,
0.5353903, 0.3084221, 0.6468862, 0.345098, 0, 1, 1,
0.5464058, -1.31768, 2.427566, 0.3490196, 0, 1, 1,
0.5465186, 0.7555439, 0.2391912, 0.3568628, 0, 1, 1,
0.548315, 0.7757801, 2.630198, 0.3607843, 0, 1, 1,
0.5561149, 2.568834, -1.145056, 0.3686275, 0, 1, 1,
0.5566499, -1.582715, 0.8996438, 0.372549, 0, 1, 1,
0.5610923, -0.7381727, 1.778943, 0.3803922, 0, 1, 1,
0.5612479, -0.001419625, 0.2348398, 0.3843137, 0, 1, 1,
0.5624999, 0.4016063, -0.5043601, 0.3921569, 0, 1, 1,
0.5630919, 0.3003398, -0.3997676, 0.3960784, 0, 1, 1,
0.5668026, -1.554682, 2.819459, 0.4039216, 0, 1, 1,
0.5674666, 0.6675141, 0.3233484, 0.4117647, 0, 1, 1,
0.5690559, 0.6193495, 1.128406, 0.4156863, 0, 1, 1,
0.5702307, -0.3458454, 2.766219, 0.4235294, 0, 1, 1,
0.5726738, 0.6089066, 1.145039, 0.427451, 0, 1, 1,
0.5747634, 0.4296468, 0.8499853, 0.4352941, 0, 1, 1,
0.5764851, -0.9895054, 2.613727, 0.4392157, 0, 1, 1,
0.582833, -1.82494, 3.222562, 0.4470588, 0, 1, 1,
0.5866789, 0.9813947, 0.526925, 0.4509804, 0, 1, 1,
0.5895634, -0.3896019, 2.591736, 0.4588235, 0, 1, 1,
0.5906693, 1.429669, -0.4516888, 0.4627451, 0, 1, 1,
0.5908262, 0.2408996, 1.775614, 0.4705882, 0, 1, 1,
0.5922171, -0.5791887, 2.110121, 0.4745098, 0, 1, 1,
0.5938026, 0.7629947, 1.48317, 0.4823529, 0, 1, 1,
0.5944676, -0.3933361, 3.279767, 0.4862745, 0, 1, 1,
0.5951925, 0.968631, 0.416411, 0.4941176, 0, 1, 1,
0.5962921, 1.550591, 0.3160584, 0.5019608, 0, 1, 1,
0.5976916, 0.6837697, 0.6300088, 0.5058824, 0, 1, 1,
0.6000031, 0.288116, 3.142276, 0.5137255, 0, 1, 1,
0.600356, 0.06989843, 0.4726214, 0.5176471, 0, 1, 1,
0.6008905, 1.422658, 1.418075, 0.5254902, 0, 1, 1,
0.6052743, 0.09360895, 1.668142, 0.5294118, 0, 1, 1,
0.6075092, 0.4457539, 1.657422, 0.5372549, 0, 1, 1,
0.6145411, 0.9506437, 1.996787, 0.5411765, 0, 1, 1,
0.6176843, 0.004894754, 0.07096142, 0.5490196, 0, 1, 1,
0.6178007, 0.09137691, 1.624375, 0.5529412, 0, 1, 1,
0.6181427, 0.5248397, 2.006481, 0.5607843, 0, 1, 1,
0.6182034, 0.9646509, 0.5902378, 0.5647059, 0, 1, 1,
0.6193479, -0.8697907, 2.381027, 0.572549, 0, 1, 1,
0.6198371, 0.3297355, 1.051299, 0.5764706, 0, 1, 1,
0.6229973, 0.1953647, 1.090467, 0.5843138, 0, 1, 1,
0.629533, 0.7386471, 0.4996295, 0.5882353, 0, 1, 1,
0.6297901, 0.1480595, 1.003583, 0.5960785, 0, 1, 1,
0.6372929, -0.4826986, 3.418525, 0.6039216, 0, 1, 1,
0.6414449, 0.2933475, 2.710804, 0.6078432, 0, 1, 1,
0.6428581, 0.05815266, 1.89461, 0.6156863, 0, 1, 1,
0.6429556, 1.468854, 2.129596, 0.6196079, 0, 1, 1,
0.6445774, 0.2391629, -0.02698927, 0.627451, 0, 1, 1,
0.6498095, 3.271817, 2.000366, 0.6313726, 0, 1, 1,
0.6539962, -0.5904658, 2.441998, 0.6392157, 0, 1, 1,
0.6593176, -0.05864431, 2.796359, 0.6431373, 0, 1, 1,
0.6688297, 0.6817771, 0.6921085, 0.6509804, 0, 1, 1,
0.6730896, -0.3667391, 2.334135, 0.654902, 0, 1, 1,
0.6753219, 1.257729, 0.1297501, 0.6627451, 0, 1, 1,
0.6807028, 1.578997, 0.820008, 0.6666667, 0, 1, 1,
0.6807752, 1.254493, -0.69537, 0.6745098, 0, 1, 1,
0.6809346, -0.9312257, 2.77706, 0.6784314, 0, 1, 1,
0.6872498, -1.149152, 1.22462, 0.6862745, 0, 1, 1,
0.6885617, 0.5668766, 2.488548, 0.6901961, 0, 1, 1,
0.6918201, 0.3764721, -0.03067598, 0.6980392, 0, 1, 1,
0.7026355, 0.2671452, 2.204132, 0.7058824, 0, 1, 1,
0.7028009, 1.069282, 0.9355833, 0.7098039, 0, 1, 1,
0.7202838, -0.2618856, 1.835346, 0.7176471, 0, 1, 1,
0.7215845, -0.0303424, 1.216602, 0.7215686, 0, 1, 1,
0.721999, -1.31425, 2.263741, 0.7294118, 0, 1, 1,
0.7253708, 1.327476, -1.535765, 0.7333333, 0, 1, 1,
0.7300974, 1.225123, -0.4227588, 0.7411765, 0, 1, 1,
0.733609, 0.2861444, 1.679536, 0.7450981, 0, 1, 1,
0.7410855, -0.08256635, 1.897212, 0.7529412, 0, 1, 1,
0.7442669, -1.095324, 2.607608, 0.7568628, 0, 1, 1,
0.7454217, 0.9492894, 0.4241412, 0.7647059, 0, 1, 1,
0.7543761, 0.05006188, 0.1461464, 0.7686275, 0, 1, 1,
0.7560859, -0.4559319, 0.6230524, 0.7764706, 0, 1, 1,
0.7588986, 0.8162834, 1.575797, 0.7803922, 0, 1, 1,
0.7599895, -0.7225495, 4.02391, 0.7882353, 0, 1, 1,
0.7604195, -1.549448, 3.114347, 0.7921569, 0, 1, 1,
0.765055, -1.359342, 3.174063, 0.8, 0, 1, 1,
0.7681473, -0.02544876, 2.332842, 0.8078431, 0, 1, 1,
0.7770802, 1.010385, -0.06968413, 0.8117647, 0, 1, 1,
0.7776638, 0.255858, 1.457301, 0.8196079, 0, 1, 1,
0.7791635, 1.307531, 1.422472, 0.8235294, 0, 1, 1,
0.7809607, -0.8510752, 1.67092, 0.8313726, 0, 1, 1,
0.7932265, 0.08038684, 1.999255, 0.8352941, 0, 1, 1,
0.7998018, 0.1688019, 1.078711, 0.8431373, 0, 1, 1,
0.804345, 0.8130603, 0.723772, 0.8470588, 0, 1, 1,
0.8096772, 0.5041685, 1.116565, 0.854902, 0, 1, 1,
0.8099875, -0.7546612, 2.115019, 0.8588235, 0, 1, 1,
0.8155605, 1.082453, 0.770989, 0.8666667, 0, 1, 1,
0.8157273, 0.9956481, 0.02833786, 0.8705882, 0, 1, 1,
0.8160926, 0.1896029, 0.2523084, 0.8784314, 0, 1, 1,
0.8194054, -0.9388372, 1.915745, 0.8823529, 0, 1, 1,
0.8209316, 0.631764, 1.213501, 0.8901961, 0, 1, 1,
0.8237174, 0.974115, 0.4898624, 0.8941177, 0, 1, 1,
0.8299991, 2.032294, 2.444606, 0.9019608, 0, 1, 1,
0.8312256, 2.076081, 0.9481637, 0.9098039, 0, 1, 1,
0.8338589, 0.8964925, -0.03214208, 0.9137255, 0, 1, 1,
0.8347258, 0.4856851, 0.4151127, 0.9215686, 0, 1, 1,
0.839904, -0.6015922, 1.365422, 0.9254902, 0, 1, 1,
0.8426312, -0.4889924, 2.247036, 0.9333333, 0, 1, 1,
0.8641756, 0.8069864, -0.7782094, 0.9372549, 0, 1, 1,
0.8660911, 1.919648, 0.7529874, 0.945098, 0, 1, 1,
0.8693089, 1.102249, 1.327927, 0.9490196, 0, 1, 1,
0.8787344, -1.985292, 2.836209, 0.9568627, 0, 1, 1,
0.885426, -0.6188458, 3.799177, 0.9607843, 0, 1, 1,
0.8859128, -0.3603876, 3.011211, 0.9686275, 0, 1, 1,
0.8918834, 1.108535, 0.4722813, 0.972549, 0, 1, 1,
0.8919578, -0.4487339, 0.9714825, 0.9803922, 0, 1, 1,
0.9079583, 0.5763128, 1.527406, 0.9843137, 0, 1, 1,
0.9096946, -0.6202346, 2.571889, 0.9921569, 0, 1, 1,
0.9184175, 0.963979, 1.772299, 0.9960784, 0, 1, 1,
0.9294885, 0.4205593, 0.8317635, 1, 0, 0.9960784, 1,
0.9352472, -2.371918, 1.882458, 1, 0, 0.9882353, 1,
0.9368805, -1.252019, 3.994725, 1, 0, 0.9843137, 1,
0.9436454, -0.3490601, 3.005574, 1, 0, 0.9764706, 1,
0.947397, 0.6196805, 1.703625, 1, 0, 0.972549, 1,
0.9494469, -0.1894909, 3.208002, 1, 0, 0.9647059, 1,
0.9542105, 0.751582, 1.854384, 1, 0, 0.9607843, 1,
0.9587208, -1.410451, 2.944199, 1, 0, 0.9529412, 1,
0.960594, -0.08686019, 1.980274, 1, 0, 0.9490196, 1,
0.9734295, 0.9485773, 2.01948, 1, 0, 0.9411765, 1,
0.9746682, 1.346292, 0.5593824, 1, 0, 0.9372549, 1,
0.9761029, -0.4833041, 2.357784, 1, 0, 0.9294118, 1,
0.9778596, -2.116694, 0.11739, 1, 0, 0.9254902, 1,
0.9854166, 0.4367585, 0.3745091, 1, 0, 0.9176471, 1,
0.9939084, -1.719111, 3.337679, 1, 0, 0.9137255, 1,
0.9958328, 0.7619309, 0.6356462, 1, 0, 0.9058824, 1,
0.9980156, 1.050896, 0.10684, 1, 0, 0.9019608, 1,
1.000213, 0.4456648, 0.2264987, 1, 0, 0.8941177, 1,
1.007257, 1.471936, -0.9591302, 1, 0, 0.8862745, 1,
1.012404, 0.07870669, 2.429175, 1, 0, 0.8823529, 1,
1.013776, -1.109318, 0.931657, 1, 0, 0.8745098, 1,
1.017459, 1.421943, 0.4762411, 1, 0, 0.8705882, 1,
1.017856, -1.093372, 2.990022, 1, 0, 0.8627451, 1,
1.019885, 1.017883, -0.1837828, 1, 0, 0.8588235, 1,
1.034387, -0.09121224, 1.635044, 1, 0, 0.8509804, 1,
1.034813, 0.3224553, 1.811002, 1, 0, 0.8470588, 1,
1.039122, 0.9536835, -0.01877929, 1, 0, 0.8392157, 1,
1.045505, -0.09026816, 0.7922284, 1, 0, 0.8352941, 1,
1.04682, 0.3738159, 2.823809, 1, 0, 0.827451, 1,
1.060424, 0.1836091, 2.378282, 1, 0, 0.8235294, 1,
1.064787, -0.5439251, 2.279539, 1, 0, 0.8156863, 1,
1.066117, 0.08765943, 1.638303, 1, 0, 0.8117647, 1,
1.068785, -0.1044058, 1.222211, 1, 0, 0.8039216, 1,
1.070818, 0.3169665, 2.052961, 1, 0, 0.7960784, 1,
1.071234, -0.1578699, 2.285156, 1, 0, 0.7921569, 1,
1.074111, -0.4338227, 0.7080815, 1, 0, 0.7843137, 1,
1.07585, 0.4885543, -0.4960089, 1, 0, 0.7803922, 1,
1.077057, 2.537824, 0.9152707, 1, 0, 0.772549, 1,
1.078146, -0.4027926, 1.725787, 1, 0, 0.7686275, 1,
1.079089, 0.4901372, 1.177398, 1, 0, 0.7607843, 1,
1.083459, 0.1140987, 3.14232, 1, 0, 0.7568628, 1,
1.08616, -1.458285, 1.659122, 1, 0, 0.7490196, 1,
1.090493, 0.5671219, 0.483583, 1, 0, 0.7450981, 1,
1.09111, -1.282696, 2.03021, 1, 0, 0.7372549, 1,
1.091523, -1.289227, 1.809338, 1, 0, 0.7333333, 1,
1.092894, -2.360488, 2.987458, 1, 0, 0.7254902, 1,
1.098523, -1.131367, 3.279628, 1, 0, 0.7215686, 1,
1.109859, 1.229574, 0.6545189, 1, 0, 0.7137255, 1,
1.110874, 0.5574682, 0.8482869, 1, 0, 0.7098039, 1,
1.11531, -0.04847025, 2.065143, 1, 0, 0.7019608, 1,
1.118359, -0.618917, 2.416234, 1, 0, 0.6941177, 1,
1.11849, -1.822015, 2.774415, 1, 0, 0.6901961, 1,
1.12884, 1.293209, 0.1763608, 1, 0, 0.682353, 1,
1.135953, 0.8321642, 1.651334, 1, 0, 0.6784314, 1,
1.147692, 0.4153237, 2.387078, 1, 0, 0.6705883, 1,
1.149732, 0.7416724, 1.909522, 1, 0, 0.6666667, 1,
1.149976, 0.8023016, -0.02352253, 1, 0, 0.6588235, 1,
1.152968, -0.9794735, 2.640008, 1, 0, 0.654902, 1,
1.156247, -0.7441616, 2.801568, 1, 0, 0.6470588, 1,
1.167225, 0.6010063, 1.259191, 1, 0, 0.6431373, 1,
1.172984, 3.250175, 1.38581, 1, 0, 0.6352941, 1,
1.175195, -1.613864, 2.099358, 1, 0, 0.6313726, 1,
1.181196, -0.2500886, 1.021756, 1, 0, 0.6235294, 1,
1.187711, -0.6853029, 2.746713, 1, 0, 0.6196079, 1,
1.189384, 0.6154739, 0.2095569, 1, 0, 0.6117647, 1,
1.192929, -0.01519558, 1.135853, 1, 0, 0.6078432, 1,
1.200841, 0.6561851, 1.225214, 1, 0, 0.6, 1,
1.203961, -2.317555, 1.709513, 1, 0, 0.5921569, 1,
1.212104, 0.6345645, 1.292405, 1, 0, 0.5882353, 1,
1.21679, 0.5229253, -0.3570058, 1, 0, 0.5803922, 1,
1.217937, -0.9910299, 2.010793, 1, 0, 0.5764706, 1,
1.223508, -1.013439, 2.58697, 1, 0, 0.5686275, 1,
1.23234, 0.9101517, -0.06545743, 1, 0, 0.5647059, 1,
1.235267, 1.146404, -1.665059, 1, 0, 0.5568628, 1,
1.241649, -0.03304481, 1.171917, 1, 0, 0.5529412, 1,
1.26231, 0.5559269, 2.319513, 1, 0, 0.5450981, 1,
1.277519, 0.7410815, 0.8943039, 1, 0, 0.5411765, 1,
1.281906, 1.295536, 2.024373, 1, 0, 0.5333334, 1,
1.287907, 1.023799, -0.8721289, 1, 0, 0.5294118, 1,
1.298835, -0.3599112, 0.2826937, 1, 0, 0.5215687, 1,
1.306347, -0.6990803, 2.016864, 1, 0, 0.5176471, 1,
1.30881, -0.2833662, 1.46781, 1, 0, 0.509804, 1,
1.317727, 0.868638, -0.4699548, 1, 0, 0.5058824, 1,
1.317907, -0.8238249, 2.088758, 1, 0, 0.4980392, 1,
1.326679, -0.516796, 2.039368, 1, 0, 0.4901961, 1,
1.329182, -1.263327, 4.848752, 1, 0, 0.4862745, 1,
1.335949, 0.759943, 3.076315, 1, 0, 0.4784314, 1,
1.336183, 0.2340403, 2.383205, 1, 0, 0.4745098, 1,
1.336487, 1.193379, 1.367889, 1, 0, 0.4666667, 1,
1.342906, 0.4806817, 1.263762, 1, 0, 0.4627451, 1,
1.342961, 0.02907574, 2.631411, 1, 0, 0.454902, 1,
1.357979, 1.157529, 1.396562, 1, 0, 0.4509804, 1,
1.365412, 0.709465, -0.8729045, 1, 0, 0.4431373, 1,
1.373465, 1.67262, -0.1995627, 1, 0, 0.4392157, 1,
1.373875, 1.803216, 0.9290583, 1, 0, 0.4313726, 1,
1.390391, 0.2464638, 1.350592, 1, 0, 0.427451, 1,
1.39825, -0.2135992, 0.9578532, 1, 0, 0.4196078, 1,
1.404397, -2.084952, 1.813968, 1, 0, 0.4156863, 1,
1.414899, 0.1941659, -0.7891333, 1, 0, 0.4078431, 1,
1.439995, 0.5321645, 0.2348124, 1, 0, 0.4039216, 1,
1.466146, -0.4649575, 1.02115, 1, 0, 0.3960784, 1,
1.466233, 0.1377635, 2.538079, 1, 0, 0.3882353, 1,
1.477162, 0.3639044, 1.051374, 1, 0, 0.3843137, 1,
1.477278, -1.048419, 0.5586008, 1, 0, 0.3764706, 1,
1.480582, 0.07370797, 1.247697, 1, 0, 0.372549, 1,
1.489068, -0.1302334, 1.688281, 1, 0, 0.3647059, 1,
1.507296, 1.212079, 1.801394, 1, 0, 0.3607843, 1,
1.513556, 0.3033087, 0.4059002, 1, 0, 0.3529412, 1,
1.527508, 0.6878408, 0.4890899, 1, 0, 0.3490196, 1,
1.529172, 2.273223, -0.2310271, 1, 0, 0.3411765, 1,
1.567286, 1.334096, 1.065861, 1, 0, 0.3372549, 1,
1.579199, 1.312313, 0.6788024, 1, 0, 0.3294118, 1,
1.582638, -0.6355123, 0.6764175, 1, 0, 0.3254902, 1,
1.594213, -0.8845707, 3.165584, 1, 0, 0.3176471, 1,
1.600017, -0.1305791, 0.3863704, 1, 0, 0.3137255, 1,
1.617186, 1.703203, -0.1982473, 1, 0, 0.3058824, 1,
1.622716, -0.7538638, 1.183157, 1, 0, 0.2980392, 1,
1.628682, 0.8362913, 1.046534, 1, 0, 0.2941177, 1,
1.656975, 0.3418968, 0.9807721, 1, 0, 0.2862745, 1,
1.662403, 0.2427634, 0.2792481, 1, 0, 0.282353, 1,
1.664133, -0.5199332, 1.183195, 1, 0, 0.2745098, 1,
1.666795, 0.03520474, 2.773291, 1, 0, 0.2705882, 1,
1.67374, 1.495726, 1.641315, 1, 0, 0.2627451, 1,
1.673793, 0.9085993, 0.4275238, 1, 0, 0.2588235, 1,
1.67405, -0.2717921, 2.745849, 1, 0, 0.2509804, 1,
1.68338, 0.8334436, 0.6169533, 1, 0, 0.2470588, 1,
1.687259, 0.4021393, 1.702226, 1, 0, 0.2392157, 1,
1.700398, -0.008938512, 4.031312, 1, 0, 0.2352941, 1,
1.716395, -0.6910087, 2.803559, 1, 0, 0.227451, 1,
1.716401, -0.06319343, 0.79682, 1, 0, 0.2235294, 1,
1.725915, 0.9425241, 1.704949, 1, 0, 0.2156863, 1,
1.734993, 1.244057, 1.752708, 1, 0, 0.2117647, 1,
1.745632, -1.624761, 0.2687839, 1, 0, 0.2039216, 1,
1.774736, -0.1087223, 0.4064726, 1, 0, 0.1960784, 1,
1.777139, -0.3976005, 2.654777, 1, 0, 0.1921569, 1,
1.788415, -0.4119854, 2.995981, 1, 0, 0.1843137, 1,
1.798662, 0.10594, 0.6894811, 1, 0, 0.1803922, 1,
1.802257, 1.250104, 2.291283, 1, 0, 0.172549, 1,
1.809308, 1.277514, 0.1680454, 1, 0, 0.1686275, 1,
1.818305, 0.2655622, 0.944823, 1, 0, 0.1607843, 1,
1.848661, 0.3837586, 1.290343, 1, 0, 0.1568628, 1,
1.898972, -0.8155265, 2.037851, 1, 0, 0.1490196, 1,
1.93531, -1.097288, 2.249148, 1, 0, 0.145098, 1,
1.958798, 1.599963, 2.343242, 1, 0, 0.1372549, 1,
1.967026, 0.576223, 1.017726, 1, 0, 0.1333333, 1,
1.96714, 0.485817, 0.9011588, 1, 0, 0.1254902, 1,
1.983673, 0.3751157, -0.1448361, 1, 0, 0.1215686, 1,
1.995003, -0.1758727, 3.014671, 1, 0, 0.1137255, 1,
1.996128, 0.4057578, 1.583889, 1, 0, 0.1098039, 1,
2.018405, 1.076129, 2.392343, 1, 0, 0.1019608, 1,
2.031138, 1.244728, 2.733717, 1, 0, 0.09411765, 1,
2.034167, -1.648101, 1.799331, 1, 0, 0.09019608, 1,
2.04169, -0.001286049, 1.497352, 1, 0, 0.08235294, 1,
2.099777, 0.9648424, 2.091578, 1, 0, 0.07843138, 1,
2.122493, 0.4891309, 0.3396184, 1, 0, 0.07058824, 1,
2.160494, 0.7435974, 0.2670824, 1, 0, 0.06666667, 1,
2.169249, -1.806705, 1.200207, 1, 0, 0.05882353, 1,
2.199424, 0.2326231, 1.008211, 1, 0, 0.05490196, 1,
2.21141, -1.549493, 3.148643, 1, 0, 0.04705882, 1,
2.440138, -1.025511, 0.3270599, 1, 0, 0.04313726, 1,
2.48175, -0.2897269, 1.022967, 1, 0, 0.03529412, 1,
2.483668, 0.9775248, 1.285089, 1, 0, 0.03137255, 1,
2.873876, 0.5117506, 1.171358, 1, 0, 0.02352941, 1,
2.898351, 1.198933, -0.649764, 1, 0, 0.01960784, 1,
3.018225, 1.076714, 1.756207, 1, 0, 0.01176471, 1,
3.413387, 0.3854129, 1.260176, 1, 0, 0.007843138, 1
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
0.2042626, -5.081883, -6.738025, 0, -0.5, 0.5, 0.5,
0.2042626, -5.081883, -6.738025, 1, -0.5, 0.5, 0.5,
0.2042626, -5.081883, -6.738025, 1, 1.5, 0.5, 0.5,
0.2042626, -5.081883, -6.738025, 0, 1.5, 0.5, 0.5
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
-4.092755, -0.2996662, -6.738025, 0, -0.5, 0.5, 0.5,
-4.092755, -0.2996662, -6.738025, 1, -0.5, 0.5, 0.5,
-4.092755, -0.2996662, -6.738025, 1, 1.5, 0.5, 0.5,
-4.092755, -0.2996662, -6.738025, 0, 1.5, 0.5, 0.5
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
-4.092755, -5.081883, 0.03794336, 0, -0.5, 0.5, 0.5,
-4.092755, -5.081883, 0.03794336, 1, -0.5, 0.5, 0.5,
-4.092755, -5.081883, 0.03794336, 1, 1.5, 0.5, 0.5,
-4.092755, -5.081883, 0.03794336, 0, 1.5, 0.5, 0.5
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
-3, -3.978294, -5.17434,
3, -3.978294, -5.17434,
-3, -3.978294, -5.17434,
-3, -4.162226, -5.434954,
-2, -3.978294, -5.17434,
-2, -4.162226, -5.434954,
-1, -3.978294, -5.17434,
-1, -4.162226, -5.434954,
0, -3.978294, -5.17434,
0, -4.162226, -5.434954,
1, -3.978294, -5.17434,
1, -4.162226, -5.434954,
2, -3.978294, -5.17434,
2, -4.162226, -5.434954,
3, -3.978294, -5.17434,
3, -4.162226, -5.434954
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
-3, -4.530088, -5.956182, 0, -0.5, 0.5, 0.5,
-3, -4.530088, -5.956182, 1, -0.5, 0.5, 0.5,
-3, -4.530088, -5.956182, 1, 1.5, 0.5, 0.5,
-3, -4.530088, -5.956182, 0, 1.5, 0.5, 0.5,
-2, -4.530088, -5.956182, 0, -0.5, 0.5, 0.5,
-2, -4.530088, -5.956182, 1, -0.5, 0.5, 0.5,
-2, -4.530088, -5.956182, 1, 1.5, 0.5, 0.5,
-2, -4.530088, -5.956182, 0, 1.5, 0.5, 0.5,
-1, -4.530088, -5.956182, 0, -0.5, 0.5, 0.5,
-1, -4.530088, -5.956182, 1, -0.5, 0.5, 0.5,
-1, -4.530088, -5.956182, 1, 1.5, 0.5, 0.5,
-1, -4.530088, -5.956182, 0, 1.5, 0.5, 0.5,
0, -4.530088, -5.956182, 0, -0.5, 0.5, 0.5,
0, -4.530088, -5.956182, 1, -0.5, 0.5, 0.5,
0, -4.530088, -5.956182, 1, 1.5, 0.5, 0.5,
0, -4.530088, -5.956182, 0, 1.5, 0.5, 0.5,
1, -4.530088, -5.956182, 0, -0.5, 0.5, 0.5,
1, -4.530088, -5.956182, 1, -0.5, 0.5, 0.5,
1, -4.530088, -5.956182, 1, 1.5, 0.5, 0.5,
1, -4.530088, -5.956182, 0, 1.5, 0.5, 0.5,
2, -4.530088, -5.956182, 0, -0.5, 0.5, 0.5,
2, -4.530088, -5.956182, 1, -0.5, 0.5, 0.5,
2, -4.530088, -5.956182, 1, 1.5, 0.5, 0.5,
2, -4.530088, -5.956182, 0, 1.5, 0.5, 0.5,
3, -4.530088, -5.956182, 0, -0.5, 0.5, 0.5,
3, -4.530088, -5.956182, 1, -0.5, 0.5, 0.5,
3, -4.530088, -5.956182, 1, 1.5, 0.5, 0.5,
3, -4.530088, -5.956182, 0, 1.5, 0.5, 0.5
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
-3.101135, -2, -5.17434,
-3.101135, 2, -5.17434,
-3.101135, -2, -5.17434,
-3.266406, -2, -5.434954,
-3.101135, 0, -5.17434,
-3.266406, 0, -5.434954,
-3.101135, 2, -5.17434,
-3.266406, 2, -5.434954
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
-3.596945, -2, -5.956182, 0, -0.5, 0.5, 0.5,
-3.596945, -2, -5.956182, 1, -0.5, 0.5, 0.5,
-3.596945, -2, -5.956182, 1, 1.5, 0.5, 0.5,
-3.596945, -2, -5.956182, 0, 1.5, 0.5, 0.5,
-3.596945, 0, -5.956182, 0, -0.5, 0.5, 0.5,
-3.596945, 0, -5.956182, 1, -0.5, 0.5, 0.5,
-3.596945, 0, -5.956182, 1, 1.5, 0.5, 0.5,
-3.596945, 0, -5.956182, 0, 1.5, 0.5, 0.5,
-3.596945, 2, -5.956182, 0, -0.5, 0.5, 0.5,
-3.596945, 2, -5.956182, 1, -0.5, 0.5, 0.5,
-3.596945, 2, -5.956182, 1, 1.5, 0.5, 0.5,
-3.596945, 2, -5.956182, 0, 1.5, 0.5, 0.5
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
-3.101135, -3.978294, -4,
-3.101135, -3.978294, 4,
-3.101135, -3.978294, -4,
-3.266406, -4.162226, -4,
-3.101135, -3.978294, -2,
-3.266406, -4.162226, -2,
-3.101135, -3.978294, 0,
-3.266406, -4.162226, 0,
-3.101135, -3.978294, 2,
-3.266406, -4.162226, 2,
-3.101135, -3.978294, 4,
-3.266406, -4.162226, 4
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
-3.596945, -4.530088, -4, 0, -0.5, 0.5, 0.5,
-3.596945, -4.530088, -4, 1, -0.5, 0.5, 0.5,
-3.596945, -4.530088, -4, 1, 1.5, 0.5, 0.5,
-3.596945, -4.530088, -4, 0, 1.5, 0.5, 0.5,
-3.596945, -4.530088, -2, 0, -0.5, 0.5, 0.5,
-3.596945, -4.530088, -2, 1, -0.5, 0.5, 0.5,
-3.596945, -4.530088, -2, 1, 1.5, 0.5, 0.5,
-3.596945, -4.530088, -2, 0, 1.5, 0.5, 0.5,
-3.596945, -4.530088, 0, 0, -0.5, 0.5, 0.5,
-3.596945, -4.530088, 0, 1, -0.5, 0.5, 0.5,
-3.596945, -4.530088, 0, 1, 1.5, 0.5, 0.5,
-3.596945, -4.530088, 0, 0, 1.5, 0.5, 0.5,
-3.596945, -4.530088, 2, 0, -0.5, 0.5, 0.5,
-3.596945, -4.530088, 2, 1, -0.5, 0.5, 0.5,
-3.596945, -4.530088, 2, 1, 1.5, 0.5, 0.5,
-3.596945, -4.530088, 2, 0, 1.5, 0.5, 0.5,
-3.596945, -4.530088, 4, 0, -0.5, 0.5, 0.5,
-3.596945, -4.530088, 4, 1, -0.5, 0.5, 0.5,
-3.596945, -4.530088, 4, 1, 1.5, 0.5, 0.5,
-3.596945, -4.530088, 4, 0, 1.5, 0.5, 0.5
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
-3.101135, -3.978294, -5.17434,
-3.101135, 3.378962, -5.17434,
-3.101135, -3.978294, 5.250226,
-3.101135, 3.378962, 5.250226,
-3.101135, -3.978294, -5.17434,
-3.101135, -3.978294, 5.250226,
-3.101135, 3.378962, -5.17434,
-3.101135, 3.378962, 5.250226,
-3.101135, -3.978294, -5.17434,
3.509661, -3.978294, -5.17434,
-3.101135, -3.978294, 5.250226,
3.509661, -3.978294, 5.250226,
-3.101135, 3.378962, -5.17434,
3.509661, 3.378962, -5.17434,
-3.101135, 3.378962, 5.250226,
3.509661, 3.378962, 5.250226,
3.509661, -3.978294, -5.17434,
3.509661, 3.378962, -5.17434,
3.509661, -3.978294, 5.250226,
3.509661, 3.378962, 5.250226,
3.509661, -3.978294, -5.17434,
3.509661, -3.978294, 5.250226,
3.509661, 3.378962, -5.17434,
3.509661, 3.378962, 5.250226
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
var radius = 7.673423;
var distance = 34.13992;
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
mvMatrix.translate( -0.2042626, 0.2996662, -0.03794336 );
mvMatrix.scale( 1.255016, 1.127683, 0.7958753 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.13992);
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


