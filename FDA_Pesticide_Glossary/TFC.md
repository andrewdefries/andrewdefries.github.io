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
-3.320949, -0.4617109, -1.943699, 1, 0, 0, 1,
-3.198331, 1.421573, -1.78119, 1, 0.007843138, 0, 1,
-2.598518, 0.3480181, -2.48976, 1, 0.01176471, 0, 1,
-2.509548, -0.1298018, -0.8346248, 1, 0.01960784, 0, 1,
-2.390491, 0.7444093, -2.117087, 1, 0.02352941, 0, 1,
-2.322463, -0.2253786, -3.180663, 1, 0.03137255, 0, 1,
-2.316803, 0.8925326, -0.9287257, 1, 0.03529412, 0, 1,
-2.271056, 1.322151, -1.81206, 1, 0.04313726, 0, 1,
-2.2699, -0.9654382, -2.67572, 1, 0.04705882, 0, 1,
-2.222266, -0.02272702, -1.694343, 1, 0.05490196, 0, 1,
-2.134257, 1.263416, -0.8106961, 1, 0.05882353, 0, 1,
-2.045531, -1.558825, -3.64907, 1, 0.06666667, 0, 1,
-2.031153, 0.2757174, -0.2402619, 1, 0.07058824, 0, 1,
-2.012302, -0.3084113, -0.2415193, 1, 0.07843138, 0, 1,
-2.005982, -0.3171993, -1.381524, 1, 0.08235294, 0, 1,
-2.000936, -0.207745, -0.8338953, 1, 0.09019608, 0, 1,
-1.997357, 0.7578403, -0.2850477, 1, 0.09411765, 0, 1,
-1.985695, -1.007538, -1.038508, 1, 0.1019608, 0, 1,
-1.967858, 2.319731, -1.161, 1, 0.1098039, 0, 1,
-1.962135, -0.9235142, -2.514832, 1, 0.1137255, 0, 1,
-1.918371, 0.8437716, -0.006450676, 1, 0.1215686, 0, 1,
-1.9104, -2.60837, -2.563115, 1, 0.1254902, 0, 1,
-1.889989, -0.1781945, -3.140868, 1, 0.1333333, 0, 1,
-1.886971, 1.411284, -1.650424, 1, 0.1372549, 0, 1,
-1.88484, 0.2151682, -1.814127, 1, 0.145098, 0, 1,
-1.855833, 0.2008754, -0.5832201, 1, 0.1490196, 0, 1,
-1.850866, 0.4282248, -0.4934393, 1, 0.1568628, 0, 1,
-1.847014, -1.656419, -1.256555, 1, 0.1607843, 0, 1,
-1.826087, 1.58174, -0.5191321, 1, 0.1686275, 0, 1,
-1.817191, -0.8856468, -2.121762, 1, 0.172549, 0, 1,
-1.80724, -1.161323, -1.956602, 1, 0.1803922, 0, 1,
-1.791344, -0.5432785, -2.626136, 1, 0.1843137, 0, 1,
-1.758008, -0.1629055, -2.553314, 1, 0.1921569, 0, 1,
-1.750675, 1.423597, -1.924648, 1, 0.1960784, 0, 1,
-1.727502, -1.739458, -2.68724, 1, 0.2039216, 0, 1,
-1.725388, 0.8638163, 0.07887676, 1, 0.2117647, 0, 1,
-1.719777, -0.9695135, -2.209468, 1, 0.2156863, 0, 1,
-1.714892, -0.9269637, -0.7701352, 1, 0.2235294, 0, 1,
-1.71353, 2.02824, -0.06218508, 1, 0.227451, 0, 1,
-1.705566, 0.4682371, 0.04528061, 1, 0.2352941, 0, 1,
-1.697253, -0.5108091, -1.169371, 1, 0.2392157, 0, 1,
-1.67903, -0.6491664, -2.104514, 1, 0.2470588, 0, 1,
-1.676637, 1.208367, -1.463241, 1, 0.2509804, 0, 1,
-1.66494, -0.5466053, -2.486489, 1, 0.2588235, 0, 1,
-1.66147, -0.8066761, -1.994855, 1, 0.2627451, 0, 1,
-1.650944, -0.7995504, -2.791877, 1, 0.2705882, 0, 1,
-1.620946, 0.002316806, -1.790229, 1, 0.2745098, 0, 1,
-1.620834, 0.7812304, -1.306633, 1, 0.282353, 0, 1,
-1.619307, 1.085319, 0.1409295, 1, 0.2862745, 0, 1,
-1.617767, 0.8317276, -1.790156, 1, 0.2941177, 0, 1,
-1.616465, 1.696895, -1.863619, 1, 0.3019608, 0, 1,
-1.614103, 0.02550251, -2.640224, 1, 0.3058824, 0, 1,
-1.596705, -0.1584636, -3.088177, 1, 0.3137255, 0, 1,
-1.586611, 0.1391793, -2.546429, 1, 0.3176471, 0, 1,
-1.586086, -0.2746128, -2.505166, 1, 0.3254902, 0, 1,
-1.57744, 0.465619, 0.04598914, 1, 0.3294118, 0, 1,
-1.577395, -2.499843, -2.771262, 1, 0.3372549, 0, 1,
-1.556728, 0.08998112, -2.107877, 1, 0.3411765, 0, 1,
-1.519228, -0.6742052, -1.176767, 1, 0.3490196, 0, 1,
-1.517815, -0.8876969, -1.20365, 1, 0.3529412, 0, 1,
-1.499326, 1.64418, -3.156398, 1, 0.3607843, 0, 1,
-1.493906, -0.7108456, -2.272696, 1, 0.3647059, 0, 1,
-1.491678, -1.270986, -2.862116, 1, 0.372549, 0, 1,
-1.465902, -0.9929565, -2.068002, 1, 0.3764706, 0, 1,
-1.464685, 0.8468257, -0.9049451, 1, 0.3843137, 0, 1,
-1.455334, 0.07218494, -1.897004, 1, 0.3882353, 0, 1,
-1.438244, 3.117991, 1.056669, 1, 0.3960784, 0, 1,
-1.427449, -0.4160908, 0.144355, 1, 0.4039216, 0, 1,
-1.425773, 0.2729401, -0.5571437, 1, 0.4078431, 0, 1,
-1.407246, -1.028076, -1.206349, 1, 0.4156863, 0, 1,
-1.40641, -0.2563536, -3.384219, 1, 0.4196078, 0, 1,
-1.401741, -2.295432, -4.081396, 1, 0.427451, 0, 1,
-1.400521, -0.002398898, -1.90809, 1, 0.4313726, 0, 1,
-1.395906, -0.7767613, -2.121623, 1, 0.4392157, 0, 1,
-1.390474, 0.7749044, -0.8817865, 1, 0.4431373, 0, 1,
-1.390313, -0.5881129, -1.269835, 1, 0.4509804, 0, 1,
-1.378184, 1.062772, -1.570294, 1, 0.454902, 0, 1,
-1.377841, -1.058408, -2.385714, 1, 0.4627451, 0, 1,
-1.36659, 0.9174958, 0.6785054, 1, 0.4666667, 0, 1,
-1.360399, 0.6194395, -1.032701, 1, 0.4745098, 0, 1,
-1.359597, 0.1307325, -0.4092209, 1, 0.4784314, 0, 1,
-1.35949, -0.3236005, -2.051479, 1, 0.4862745, 0, 1,
-1.357217, -1.859157, -2.082443, 1, 0.4901961, 0, 1,
-1.348778, -0.1330666, 0.2416901, 1, 0.4980392, 0, 1,
-1.347098, 0.3011678, -1.931797, 1, 0.5058824, 0, 1,
-1.332742, -0.7956463, -2.421152, 1, 0.509804, 0, 1,
-1.326055, -3.092137, -3.564992, 1, 0.5176471, 0, 1,
-1.321093, -2.215003, -2.144407, 1, 0.5215687, 0, 1,
-1.317377, 0.1472614, -2.06771, 1, 0.5294118, 0, 1,
-1.311925, -0.2089604, -1.726411, 1, 0.5333334, 0, 1,
-1.311636, -0.7506596, -1.626083, 1, 0.5411765, 0, 1,
-1.308558, -0.7617432, -3.331438, 1, 0.5450981, 0, 1,
-1.276059, -0.1977345, -1.855209, 1, 0.5529412, 0, 1,
-1.273931, -0.5318191, -3.229948, 1, 0.5568628, 0, 1,
-1.273846, -0.08640429, -1.922954, 1, 0.5647059, 0, 1,
-1.269979, 0.3010169, -1.754129, 1, 0.5686275, 0, 1,
-1.260927, -0.7509441, -1.28246, 1, 0.5764706, 0, 1,
-1.255756, -1.347766, 0.5584782, 1, 0.5803922, 0, 1,
-1.253523, 0.6640546, -1.657944, 1, 0.5882353, 0, 1,
-1.253187, 0.4833885, -1.12892, 1, 0.5921569, 0, 1,
-1.252837, -0.6772115, -2.229271, 1, 0.6, 0, 1,
-1.248843, 2.909938, -1.601857, 1, 0.6078432, 0, 1,
-1.247289, 0.1322176, -0.590418, 1, 0.6117647, 0, 1,
-1.24613, -0.5523931, -2.24996, 1, 0.6196079, 0, 1,
-1.238858, 1.239052, 1.003978, 1, 0.6235294, 0, 1,
-1.236983, -1.779016, -3.725526, 1, 0.6313726, 0, 1,
-1.234387, 0.610714, -0.1193582, 1, 0.6352941, 0, 1,
-1.2253, -1.537153, -3.046977, 1, 0.6431373, 0, 1,
-1.223605, -0.2646527, -0.6014748, 1, 0.6470588, 0, 1,
-1.2216, -2.380735, -2.833761, 1, 0.654902, 0, 1,
-1.216745, -0.4539351, -1.414582, 1, 0.6588235, 0, 1,
-1.213452, 0.6538669, -1.280594, 1, 0.6666667, 0, 1,
-1.210922, 0.1799245, -1.861702, 1, 0.6705883, 0, 1,
-1.207766, -1.570916, -2.382461, 1, 0.6784314, 0, 1,
-1.202099, 2.034378, -1.011054, 1, 0.682353, 0, 1,
-1.18261, -1.581742, -3.439715, 1, 0.6901961, 0, 1,
-1.15796, -2.423393, -2.361567, 1, 0.6941177, 0, 1,
-1.156736, 0.364843, -0.5690607, 1, 0.7019608, 0, 1,
-1.151593, -0.7360578, -0.1567141, 1, 0.7098039, 0, 1,
-1.137382, -1.963776, -3.542023, 1, 0.7137255, 0, 1,
-1.134227, 0.6376216, -0.7052983, 1, 0.7215686, 0, 1,
-1.128654, 0.4801302, -3.404959, 1, 0.7254902, 0, 1,
-1.116564, -1.879826, -2.28929, 1, 0.7333333, 0, 1,
-1.106123, 0.07496466, -0.8662736, 1, 0.7372549, 0, 1,
-1.103493, 0.4261398, -2.797554, 1, 0.7450981, 0, 1,
-1.103383, -1.109841, -3.632751, 1, 0.7490196, 0, 1,
-1.10091, -0.8539506, -2.434869, 1, 0.7568628, 0, 1,
-1.084547, 0.02485835, -1.12491, 1, 0.7607843, 0, 1,
-1.073106, -0.6781815, -3.028212, 1, 0.7686275, 0, 1,
-1.069543, 0.7827771, -0.6050022, 1, 0.772549, 0, 1,
-1.060793, 1.406818, 0.182243, 1, 0.7803922, 0, 1,
-1.056027, -0.3601366, -1.876178, 1, 0.7843137, 0, 1,
-1.046379, -1.192953, -3.271302, 1, 0.7921569, 0, 1,
-1.045645, 1.957648, -0.4806148, 1, 0.7960784, 0, 1,
-1.045485, -0.5245556, -1.589171, 1, 0.8039216, 0, 1,
-1.037571, -1.364355, -4.870089, 1, 0.8117647, 0, 1,
-1.035389, -0.5938783, -0.3258215, 1, 0.8156863, 0, 1,
-1.032917, -0.3476974, -0.8261222, 1, 0.8235294, 0, 1,
-1.029418, -0.1114163, -1.194025, 1, 0.827451, 0, 1,
-1.015318, 0.03539405, -1.055882, 1, 0.8352941, 0, 1,
-1.014818, -0.08108231, -1.860383, 1, 0.8392157, 0, 1,
-1.013592, -0.5599584, -1.769935, 1, 0.8470588, 0, 1,
-1.008171, 0.6450254, -1.291539, 1, 0.8509804, 0, 1,
-1.006247, -0.7014289, -3.399601, 1, 0.8588235, 0, 1,
-1.002785, -0.5236179, -3.230406, 1, 0.8627451, 0, 1,
-0.9978483, -1.064304, -2.505217, 1, 0.8705882, 0, 1,
-0.9925543, -0.3505497, -2.050467, 1, 0.8745098, 0, 1,
-0.9905637, -0.6886938, -2.353417, 1, 0.8823529, 0, 1,
-0.9887913, -0.205807, -2.879237, 1, 0.8862745, 0, 1,
-0.9858336, -0.07661265, -1.783093, 1, 0.8941177, 0, 1,
-0.9824098, 0.3943186, -1.049817, 1, 0.8980392, 0, 1,
-0.9812314, 0.09324494, -2.539014, 1, 0.9058824, 0, 1,
-0.9772987, -0.2604416, -3.215816, 1, 0.9137255, 0, 1,
-0.9745816, -1.212135, -1.767046, 1, 0.9176471, 0, 1,
-0.9663658, -0.2156985, -3.335451, 1, 0.9254902, 0, 1,
-0.9641452, 0.1876094, -2.580379, 1, 0.9294118, 0, 1,
-0.9587253, 0.5533386, -1.672792, 1, 0.9372549, 0, 1,
-0.9584581, 0.05947908, -0.5371943, 1, 0.9411765, 0, 1,
-0.9550483, 1.725049, -0.07185883, 1, 0.9490196, 0, 1,
-0.9531782, -0.4310176, -1.076376, 1, 0.9529412, 0, 1,
-0.9502832, -0.6424896, -1.990263, 1, 0.9607843, 0, 1,
-0.9497422, 0.2026435, -3.040252, 1, 0.9647059, 0, 1,
-0.9444475, 1.844811, 0.5629407, 1, 0.972549, 0, 1,
-0.9414421, 1.138159, -0.8846381, 1, 0.9764706, 0, 1,
-0.9370658, 0.8166114, 0.4590213, 1, 0.9843137, 0, 1,
-0.9363043, -1.198493, -3.851988, 1, 0.9882353, 0, 1,
-0.9228666, -0.10879, -1.123753, 1, 0.9960784, 0, 1,
-0.9177462, -1.124606, -2.42046, 0.9960784, 1, 0, 1,
-0.916705, -0.1962775, -1.52969, 0.9921569, 1, 0, 1,
-0.9161046, -0.06033508, -2.328954, 0.9843137, 1, 0, 1,
-0.9149203, 0.5074729, 0.4306632, 0.9803922, 1, 0, 1,
-0.9113215, -0.0984448, -1.772239, 0.972549, 1, 0, 1,
-0.9099508, 0.01034663, -0.8031439, 0.9686275, 1, 0, 1,
-0.9091166, -0.07630922, -1.436761, 0.9607843, 1, 0, 1,
-0.9059585, -1.560389, -1.40638, 0.9568627, 1, 0, 1,
-0.8967084, -1.006854, -1.990019, 0.9490196, 1, 0, 1,
-0.8890598, 0.2162999, -0.8195148, 0.945098, 1, 0, 1,
-0.8756536, -0.1306909, -0.5544898, 0.9372549, 1, 0, 1,
-0.8745369, 0.615867, -1.193121, 0.9333333, 1, 0, 1,
-0.8692037, -1.681561, -3.336008, 0.9254902, 1, 0, 1,
-0.8666839, -2.636053, -3.828123, 0.9215686, 1, 0, 1,
-0.8633, -2.371159, -2.540684, 0.9137255, 1, 0, 1,
-0.8614467, -0.3217238, -0.563786, 0.9098039, 1, 0, 1,
-0.8583925, -0.3062268, -1.427666, 0.9019608, 1, 0, 1,
-0.8546717, -0.4016177, -2.298321, 0.8941177, 1, 0, 1,
-0.8545448, 1.681928, 0.04235056, 0.8901961, 1, 0, 1,
-0.8492807, 1.994999, -0.4159611, 0.8823529, 1, 0, 1,
-0.8483101, -0.9957565, -2.10486, 0.8784314, 1, 0, 1,
-0.8477352, 0.4941002, 0.6465751, 0.8705882, 1, 0, 1,
-0.8469758, 1.903189, 0.02156845, 0.8666667, 1, 0, 1,
-0.8469105, -0.2369453, -2.626498, 0.8588235, 1, 0, 1,
-0.8457399, -0.07501654, -3.315821, 0.854902, 1, 0, 1,
-0.8456841, -0.9488385, -2.091429, 0.8470588, 1, 0, 1,
-0.8416919, 0.6651306, -1.179532, 0.8431373, 1, 0, 1,
-0.8416137, -0.7454198, -2.608421, 0.8352941, 1, 0, 1,
-0.8388713, -2.683652, -5.311451, 0.8313726, 1, 0, 1,
-0.8349436, 0.396717, -1.876898, 0.8235294, 1, 0, 1,
-0.8337402, 0.5197371, -0.09587354, 0.8196079, 1, 0, 1,
-0.8334759, 1.25583, -0.2834675, 0.8117647, 1, 0, 1,
-0.8331869, -0.1455226, -2.309273, 0.8078431, 1, 0, 1,
-0.8282093, 0.3240441, -0.4712679, 0.8, 1, 0, 1,
-0.8216866, -0.6931478, -3.413923, 0.7921569, 1, 0, 1,
-0.817128, 0.7024111, 0.6614628, 0.7882353, 1, 0, 1,
-0.8156663, -0.4425453, -1.256045, 0.7803922, 1, 0, 1,
-0.8084133, -0.551268, -2.160484, 0.7764706, 1, 0, 1,
-0.8047336, 0.6872536, -0.7512086, 0.7686275, 1, 0, 1,
-0.7949212, -0.430483, -0.7705114, 0.7647059, 1, 0, 1,
-0.7944709, 0.6043969, -0.6043155, 0.7568628, 1, 0, 1,
-0.7929956, 1.297529, -1.858149, 0.7529412, 1, 0, 1,
-0.7884131, -1.16599, -4.222125, 0.7450981, 1, 0, 1,
-0.7861203, -2.046605, -2.259119, 0.7411765, 1, 0, 1,
-0.7854258, 0.9020954, -1.7447, 0.7333333, 1, 0, 1,
-0.7846491, -0.536215, -3.923326, 0.7294118, 1, 0, 1,
-0.7760906, -1.021367, -3.048015, 0.7215686, 1, 0, 1,
-0.7755091, 1.000179, -0.07014158, 0.7176471, 1, 0, 1,
-0.7749216, -0.4451236, -2.404721, 0.7098039, 1, 0, 1,
-0.7683386, 0.9753544, -2.980835, 0.7058824, 1, 0, 1,
-0.7634786, 1.903538, 0.5018204, 0.6980392, 1, 0, 1,
-0.7572858, -0.1730608, -0.4648834, 0.6901961, 1, 0, 1,
-0.7552972, 0.70823, 0.3633067, 0.6862745, 1, 0, 1,
-0.7513691, -2.748999, -1.732621, 0.6784314, 1, 0, 1,
-0.7513441, -0.9532402, -4.556063, 0.6745098, 1, 0, 1,
-0.751277, 1.11459, 0.8880615, 0.6666667, 1, 0, 1,
-0.7507292, 1.158872, -1.520126, 0.6627451, 1, 0, 1,
-0.7502648, 0.3243905, -2.009661, 0.654902, 1, 0, 1,
-0.7447326, 1.968394, 0.4112412, 0.6509804, 1, 0, 1,
-0.7440475, -0.961535, -2.496293, 0.6431373, 1, 0, 1,
-0.7368065, -0.1470266, -0.662944, 0.6392157, 1, 0, 1,
-0.7362554, 0.06696079, -2.182101, 0.6313726, 1, 0, 1,
-0.7310627, 0.306051, -1.089544, 0.627451, 1, 0, 1,
-0.7296644, -0.1517714, -0.6964855, 0.6196079, 1, 0, 1,
-0.7287421, -0.303667, -2.422767, 0.6156863, 1, 0, 1,
-0.7198678, 0.317573, -2.18541, 0.6078432, 1, 0, 1,
-0.7164978, -0.4181492, -2.650173, 0.6039216, 1, 0, 1,
-0.711183, -0.2838458, -1.242922, 0.5960785, 1, 0, 1,
-0.7089581, 0.7893617, -0.592317, 0.5882353, 1, 0, 1,
-0.7082251, -0.7733446, -1.387203, 0.5843138, 1, 0, 1,
-0.7070236, 1.373643, -1.629317, 0.5764706, 1, 0, 1,
-0.7046376, -1.108471, -2.188576, 0.572549, 1, 0, 1,
-0.70244, 1.232467, 0.6310863, 0.5647059, 1, 0, 1,
-0.7018809, -0.05585283, -0.6319264, 0.5607843, 1, 0, 1,
-0.7011302, 0.4915835, -0.4486, 0.5529412, 1, 0, 1,
-0.7009007, 0.2885906, -1.584171, 0.5490196, 1, 0, 1,
-0.685079, 1.577132, -2.930047, 0.5411765, 1, 0, 1,
-0.6842504, -0.4965102, -0.7117308, 0.5372549, 1, 0, 1,
-0.682078, -0.3990728, -0.6374629, 0.5294118, 1, 0, 1,
-0.6815817, 1.213583, -0.7632196, 0.5254902, 1, 0, 1,
-0.680544, -0.8520286, -1.593568, 0.5176471, 1, 0, 1,
-0.6736614, 0.735165, -2.346728, 0.5137255, 1, 0, 1,
-0.6735236, 0.1189165, -1.912398, 0.5058824, 1, 0, 1,
-0.6717802, -0.4705896, -2.308001, 0.5019608, 1, 0, 1,
-0.6643438, 1.307472, -0.7338518, 0.4941176, 1, 0, 1,
-0.6609568, 0.6862586, -1.148157, 0.4862745, 1, 0, 1,
-0.6587265, -1.098793, -3.538708, 0.4823529, 1, 0, 1,
-0.6537815, 1.753709, -0.09341773, 0.4745098, 1, 0, 1,
-0.6491621, 2.133081, -0.7196429, 0.4705882, 1, 0, 1,
-0.6491185, -1.495867, -4.764408, 0.4627451, 1, 0, 1,
-0.6463192, -1.078944, -1.942994, 0.4588235, 1, 0, 1,
-0.6457162, -1.50126, -2.695327, 0.4509804, 1, 0, 1,
-0.6394363, 0.5533172, -0.3290111, 0.4470588, 1, 0, 1,
-0.6392983, -1.165203, -1.130317, 0.4392157, 1, 0, 1,
-0.6378047, -0.1121133, 0.01385662, 0.4352941, 1, 0, 1,
-0.6300142, -0.1312768, -3.292048, 0.427451, 1, 0, 1,
-0.6286146, 0.6269081, -2.548096, 0.4235294, 1, 0, 1,
-0.627062, -0.3564651, -0.1764746, 0.4156863, 1, 0, 1,
-0.6258008, -1.053527, -4.197635, 0.4117647, 1, 0, 1,
-0.6236094, 0.4273458, -1.523415, 0.4039216, 1, 0, 1,
-0.6227257, 1.32208, -0.5680375, 0.3960784, 1, 0, 1,
-0.6224654, -1.401146, -1.973814, 0.3921569, 1, 0, 1,
-0.6188424, 0.1643073, -0.1583392, 0.3843137, 1, 0, 1,
-0.6183605, 1.091727, 0.003591363, 0.3803922, 1, 0, 1,
-0.6182731, 0.4404308, -0.7445584, 0.372549, 1, 0, 1,
-0.6180627, -0.2568062, -1.709548, 0.3686275, 1, 0, 1,
-0.6160789, 1.252658, -0.02823665, 0.3607843, 1, 0, 1,
-0.6105477, -0.7497953, -2.015165, 0.3568628, 1, 0, 1,
-0.607092, -0.4080924, -1.486427, 0.3490196, 1, 0, 1,
-0.6066342, 1.879507, -2.046963, 0.345098, 1, 0, 1,
-0.6053925, -1.00347, -2.336016, 0.3372549, 1, 0, 1,
-0.6042381, 0.4846446, 0.4558858, 0.3333333, 1, 0, 1,
-0.6023804, 0.482721, -1.302286, 0.3254902, 1, 0, 1,
-0.6020625, -0.8085786, -1.901872, 0.3215686, 1, 0, 1,
-0.600154, -0.9419067, -1.98567, 0.3137255, 1, 0, 1,
-0.5998411, 1.003587, -1.869995, 0.3098039, 1, 0, 1,
-0.5980611, -1.820939, -1.533373, 0.3019608, 1, 0, 1,
-0.5971718, -1.032113, -3.360069, 0.2941177, 1, 0, 1,
-0.5930429, -0.5722246, -2.264561, 0.2901961, 1, 0, 1,
-0.5871727, -1.211683, -1.156341, 0.282353, 1, 0, 1,
-0.5870748, -1.641615, -0.730249, 0.2784314, 1, 0, 1,
-0.5827891, -0.6253552, -2.669395, 0.2705882, 1, 0, 1,
-0.5788082, 0.2029383, -2.416856, 0.2666667, 1, 0, 1,
-0.5719664, 1.400355, 0.02854104, 0.2588235, 1, 0, 1,
-0.5677888, 0.5791709, -2.939494, 0.254902, 1, 0, 1,
-0.5677399, -0.7546894, -2.61125, 0.2470588, 1, 0, 1,
-0.5610853, 0.1005477, -0.2974283, 0.2431373, 1, 0, 1,
-0.5575543, 0.4379663, -2.098453, 0.2352941, 1, 0, 1,
-0.5538296, -0.5378746, -4.299084, 0.2313726, 1, 0, 1,
-0.5520558, -1.002115, -0.1829578, 0.2235294, 1, 0, 1,
-0.5503352, 0.2317078, -0.8452802, 0.2196078, 1, 0, 1,
-0.5446483, -0.3815649, -0.6065776, 0.2117647, 1, 0, 1,
-0.5445974, 0.9516159, -0.6678368, 0.2078431, 1, 0, 1,
-0.5428489, 0.6121016, 0.3774188, 0.2, 1, 0, 1,
-0.5332662, 0.1837495, -0.4351087, 0.1921569, 1, 0, 1,
-0.5329457, -1.327225, -3.507128, 0.1882353, 1, 0, 1,
-0.5310883, -0.5162221, -2.394959, 0.1803922, 1, 0, 1,
-0.5303978, -1.421141, -3.020765, 0.1764706, 1, 0, 1,
-0.52653, -0.4859262, -2.312905, 0.1686275, 1, 0, 1,
-0.5249068, 0.1083782, -0.6295539, 0.1647059, 1, 0, 1,
-0.5234686, 0.7686694, -2.068617, 0.1568628, 1, 0, 1,
-0.5211441, -0.5033032, -2.258981, 0.1529412, 1, 0, 1,
-0.5198556, 0.241145, -1.044743, 0.145098, 1, 0, 1,
-0.518694, -0.4427052, -2.912235, 0.1411765, 1, 0, 1,
-0.5184127, -0.8982602, -1.434096, 0.1333333, 1, 0, 1,
-0.5156494, 1.723029, -1.377334, 0.1294118, 1, 0, 1,
-0.5151031, -0.9854047, -2.480419, 0.1215686, 1, 0, 1,
-0.513085, 0.9526844, -0.02554051, 0.1176471, 1, 0, 1,
-0.5124767, 0.09944081, -1.621474, 0.1098039, 1, 0, 1,
-0.5093069, 0.4836212, 0.06937812, 0.1058824, 1, 0, 1,
-0.5041215, -1.982689, -3.255655, 0.09803922, 1, 0, 1,
-0.502849, 0.9739708, -0.5739031, 0.09019608, 1, 0, 1,
-0.5012817, -1.163578, -1.216426, 0.08627451, 1, 0, 1,
-0.4978122, 1.986198, -0.3482631, 0.07843138, 1, 0, 1,
-0.4897546, 0.3806789, -2.023566, 0.07450981, 1, 0, 1,
-0.4852521, 2.859519, -0.900969, 0.06666667, 1, 0, 1,
-0.4837922, -0.595345, -3.670578, 0.0627451, 1, 0, 1,
-0.4789247, 0.9267606, -0.2114076, 0.05490196, 1, 0, 1,
-0.4784076, -0.1241817, -1.546424, 0.05098039, 1, 0, 1,
-0.4771551, -1.008286, -3.988744, 0.04313726, 1, 0, 1,
-0.4770322, 1.581171, -0.951966, 0.03921569, 1, 0, 1,
-0.4754598, 0.733154, -0.6343859, 0.03137255, 1, 0, 1,
-0.475431, -0.7724715, -2.564853, 0.02745098, 1, 0, 1,
-0.4749638, -0.9577816, -2.225104, 0.01960784, 1, 0, 1,
-0.4720418, 0.5087335, -1.061809, 0.01568628, 1, 0, 1,
-0.4685943, -1.532962, -3.063366, 0.007843138, 1, 0, 1,
-0.4666288, 0.358498, -1.907962, 0.003921569, 1, 0, 1,
-0.4615769, 0.5511274, -0.02014669, 0, 1, 0.003921569, 1,
-0.4603856, 0.5249075, -0.9546167, 0, 1, 0.01176471, 1,
-0.4580119, 0.9333608, -0.208653, 0, 1, 0.01568628, 1,
-0.4571123, 0.1234783, -0.4874321, 0, 1, 0.02352941, 1,
-0.4554781, 0.5131151, -0.5648663, 0, 1, 0.02745098, 1,
-0.4526511, -0.111404, -3.235485, 0, 1, 0.03529412, 1,
-0.4461428, -0.2388026, -1.32445, 0, 1, 0.03921569, 1,
-0.4458497, 0.957469, -1.102764, 0, 1, 0.04705882, 1,
-0.4440899, 0.08822917, 0.7360271, 0, 1, 0.05098039, 1,
-0.4435647, -0.6736849, -1.944222, 0, 1, 0.05882353, 1,
-0.4388016, -0.03965479, -4.460673, 0, 1, 0.0627451, 1,
-0.4383361, -0.8336346, -3.012574, 0, 1, 0.07058824, 1,
-0.4374339, 1.591668, -0.9926344, 0, 1, 0.07450981, 1,
-0.4366708, -1.188362, -2.32205, 0, 1, 0.08235294, 1,
-0.4347981, -0.513851, -2.249906, 0, 1, 0.08627451, 1,
-0.434586, 0.7549734, -0.5025518, 0, 1, 0.09411765, 1,
-0.4333903, -1.001779, -3.400192, 0, 1, 0.1019608, 1,
-0.430856, 0.1187695, -1.092834, 0, 1, 0.1058824, 1,
-0.4252667, -0.1942574, -3.645525, 0, 1, 0.1137255, 1,
-0.4190952, -0.8083966, -3.389577, 0, 1, 0.1176471, 1,
-0.408841, -2.245684, -4.160954, 0, 1, 0.1254902, 1,
-0.404494, -0.08587278, -1.559699, 0, 1, 0.1294118, 1,
-0.402049, 1.260998, -0.8582165, 0, 1, 0.1372549, 1,
-0.4019762, -1.621089, -3.939234, 0, 1, 0.1411765, 1,
-0.4010132, 0.02202032, -1.925166, 0, 1, 0.1490196, 1,
-0.3994646, 0.6773765, -1.011145, 0, 1, 0.1529412, 1,
-0.3969118, 0.7896322, -0.7071458, 0, 1, 0.1607843, 1,
-0.3945332, 0.1382223, -2.716974, 0, 1, 0.1647059, 1,
-0.3874111, 0.370404, -0.585511, 0, 1, 0.172549, 1,
-0.3849796, -0.2966894, -2.030711, 0, 1, 0.1764706, 1,
-0.3747639, -1.33456, -3.707433, 0, 1, 0.1843137, 1,
-0.371024, 1.490681, -1.656612, 0, 1, 0.1882353, 1,
-0.3709641, -0.01766518, -2.459887, 0, 1, 0.1960784, 1,
-0.362977, -0.5700353, -3.286984, 0, 1, 0.2039216, 1,
-0.3579035, -0.9173083, -1.878182, 0, 1, 0.2078431, 1,
-0.3563302, 0.9865109, 1.479182, 0, 1, 0.2156863, 1,
-0.3562257, 1.584382, -1.46507, 0, 1, 0.2196078, 1,
-0.35382, -1.473557, -2.025729, 0, 1, 0.227451, 1,
-0.3467292, 0.0247262, -1.744675, 0, 1, 0.2313726, 1,
-0.3403448, 0.1118979, -1.834622, 0, 1, 0.2392157, 1,
-0.3327011, 2.498548, -0.07960089, 0, 1, 0.2431373, 1,
-0.3265617, -0.6853018, -1.500142, 0, 1, 0.2509804, 1,
-0.3258258, -0.1412911, -3.475399, 0, 1, 0.254902, 1,
-0.3253398, 0.2813262, -0.7354849, 0, 1, 0.2627451, 1,
-0.321546, -0.3082041, -3.14848, 0, 1, 0.2666667, 1,
-0.3137116, 0.3854405, 0.3896382, 0, 1, 0.2745098, 1,
-0.3042208, -0.889283, -4.222253, 0, 1, 0.2784314, 1,
-0.3019502, 0.83714, -0.8507128, 0, 1, 0.2862745, 1,
-0.2973175, 1.515342, -0.7232505, 0, 1, 0.2901961, 1,
-0.2964365, -0.8052809, -2.505685, 0, 1, 0.2980392, 1,
-0.2928562, -0.8636199, -1.413334, 0, 1, 0.3058824, 1,
-0.2836883, -1.028055, -3.622118, 0, 1, 0.3098039, 1,
-0.2816896, 0.8651525, -1.029256, 0, 1, 0.3176471, 1,
-0.2796769, -1.482535, -4.439211, 0, 1, 0.3215686, 1,
-0.2741966, 1.161579, 0.4016061, 0, 1, 0.3294118, 1,
-0.2688524, -0.6243756, -2.735072, 0, 1, 0.3333333, 1,
-0.2682151, 0.867021, 1.324796, 0, 1, 0.3411765, 1,
-0.2663831, -0.6969991, -3.617251, 0, 1, 0.345098, 1,
-0.2570058, 0.47806, -1.410673, 0, 1, 0.3529412, 1,
-0.2534926, -1.258899, -3.063809, 0, 1, 0.3568628, 1,
-0.2516378, -1.627155, -2.966312, 0, 1, 0.3647059, 1,
-0.2509264, -1.318468, -3.204663, 0, 1, 0.3686275, 1,
-0.2508208, -1.631883, -4.788479, 0, 1, 0.3764706, 1,
-0.249992, -0.07533028, -2.796079, 0, 1, 0.3803922, 1,
-0.2492535, 0.9237921, -0.8834468, 0, 1, 0.3882353, 1,
-0.246479, 0.5819015, 0.2940263, 0, 1, 0.3921569, 1,
-0.2452124, -1.248572, -2.577818, 0, 1, 0.4, 1,
-0.2393012, -1.673334, -1.940305, 0, 1, 0.4078431, 1,
-0.2387722, 0.9409557, -0.7672659, 0, 1, 0.4117647, 1,
-0.2386332, -0.2621897, -1.527581, 0, 1, 0.4196078, 1,
-0.2380816, -0.750708, -2.616353, 0, 1, 0.4235294, 1,
-0.2307235, 0.3754739, 1.285782, 0, 1, 0.4313726, 1,
-0.228541, -0.6236902, -2.832917, 0, 1, 0.4352941, 1,
-0.2276267, 0.9973063, 0.754483, 0, 1, 0.4431373, 1,
-0.2248782, -0.5037009, -2.805192, 0, 1, 0.4470588, 1,
-0.2231041, 0.8178492, 1.343661, 0, 1, 0.454902, 1,
-0.2189531, -1.343329, -3.774329, 0, 1, 0.4588235, 1,
-0.2167009, -1.822921, -3.518656, 0, 1, 0.4666667, 1,
-0.2159486, 1.568415, 0.7232347, 0, 1, 0.4705882, 1,
-0.2118749, 0.5747478, -0.04103279, 0, 1, 0.4784314, 1,
-0.2116237, 0.1496446, -1.444441, 0, 1, 0.4823529, 1,
-0.2046988, -0.8232679, -2.430703, 0, 1, 0.4901961, 1,
-0.2020679, 0.08796839, -1.29264, 0, 1, 0.4941176, 1,
-0.2016779, -0.06531766, -2.087351, 0, 1, 0.5019608, 1,
-0.2011596, 0.8357786, 0.2861491, 0, 1, 0.509804, 1,
-0.1998609, -1.391631, -2.734289, 0, 1, 0.5137255, 1,
-0.1974584, -1.089317, -2.527258, 0, 1, 0.5215687, 1,
-0.1946962, 1.961251, -0.4978345, 0, 1, 0.5254902, 1,
-0.1939206, 0.1003617, 0.1200691, 0, 1, 0.5333334, 1,
-0.1908165, 1.478216, 1.426923, 0, 1, 0.5372549, 1,
-0.1879468, 0.5079939, 1.042524, 0, 1, 0.5450981, 1,
-0.1864694, 0.2312386, -0.8007205, 0, 1, 0.5490196, 1,
-0.186252, -2.33284, -1.99377, 0, 1, 0.5568628, 1,
-0.1828002, -2.355411, -3.077133, 0, 1, 0.5607843, 1,
-0.1797109, 2.145437, 0.8389766, 0, 1, 0.5686275, 1,
-0.175938, -0.6394042, -4.81354, 0, 1, 0.572549, 1,
-0.1724696, -2.686226, -2.54515, 0, 1, 0.5803922, 1,
-0.1722599, 0.7976785, 1.269117, 0, 1, 0.5843138, 1,
-0.1710459, -1.282319, -2.860189, 0, 1, 0.5921569, 1,
-0.1697964, -0.2603464, -2.322391, 0, 1, 0.5960785, 1,
-0.1649922, 0.3923768, -2.57994, 0, 1, 0.6039216, 1,
-0.1635077, -0.4854556, -2.341475, 0, 1, 0.6117647, 1,
-0.1610291, -0.9905047, -2.549706, 0, 1, 0.6156863, 1,
-0.1584541, 0.3853574, -0.5241585, 0, 1, 0.6235294, 1,
-0.1577059, 0.418153, -1.2911, 0, 1, 0.627451, 1,
-0.1526717, -0.6665451, -2.630121, 0, 1, 0.6352941, 1,
-0.1521739, -0.1319708, -3.107061, 0, 1, 0.6392157, 1,
-0.1520936, 0.04575784, -0.8445019, 0, 1, 0.6470588, 1,
-0.1417568, -0.7218031, -2.741403, 0, 1, 0.6509804, 1,
-0.1407334, -0.7689121, -3.070239, 0, 1, 0.6588235, 1,
-0.1399574, 0.2942854, -0.3404316, 0, 1, 0.6627451, 1,
-0.1310647, 1.0176, 0.38252, 0, 1, 0.6705883, 1,
-0.1302676, -0.1498965, -3.849016, 0, 1, 0.6745098, 1,
-0.1277755, 0.4036265, 0.9016855, 0, 1, 0.682353, 1,
-0.1259152, -0.3204519, -2.439237, 0, 1, 0.6862745, 1,
-0.1243363, -2.049743, -2.65847, 0, 1, 0.6941177, 1,
-0.1242113, -0.5305962, -4.015541, 0, 1, 0.7019608, 1,
-0.1199694, -1.143155, -1.693666, 0, 1, 0.7058824, 1,
-0.1191192, -0.04703289, -3.191243, 0, 1, 0.7137255, 1,
-0.1169645, 0.8966433, -0.4856677, 0, 1, 0.7176471, 1,
-0.115035, 0.2044778, -0.1108404, 0, 1, 0.7254902, 1,
-0.1134649, 0.5890247, -2.175329, 0, 1, 0.7294118, 1,
-0.1102456, 1.81204, -1.035705, 0, 1, 0.7372549, 1,
-0.1101229, -0.5783722, -3.184907, 0, 1, 0.7411765, 1,
-0.1075763, -1.15021, -4.25249, 0, 1, 0.7490196, 1,
-0.1065153, -0.7646121, -1.814912, 0, 1, 0.7529412, 1,
-0.1000669, -0.784471, -3.249104, 0, 1, 0.7607843, 1,
-0.09994555, 2.299556, 0.5997353, 0, 1, 0.7647059, 1,
-0.09983966, -0.804738, -2.848521, 0, 1, 0.772549, 1,
-0.09769198, -0.2169386, -1.739221, 0, 1, 0.7764706, 1,
-0.09704909, 0.4048615, 1.012647, 0, 1, 0.7843137, 1,
-0.09231998, -0.5901318, -3.65815, 0, 1, 0.7882353, 1,
-0.09204395, -0.7370446, -1.617214, 0, 1, 0.7960784, 1,
-0.09178428, 2.471001, -0.3748797, 0, 1, 0.8039216, 1,
-0.09146235, 0.04466128, -1.590521, 0, 1, 0.8078431, 1,
-0.0877974, -0.5675152, -4.297775, 0, 1, 0.8156863, 1,
-0.0875613, 1.033309, -0.6881478, 0, 1, 0.8196079, 1,
-0.08418746, -0.06244585, -1.910256, 0, 1, 0.827451, 1,
-0.08346462, 0.7016834, 2.363846, 0, 1, 0.8313726, 1,
-0.0832474, 1.363019, 0.1008397, 0, 1, 0.8392157, 1,
-0.07861339, 1.552695, -1.241312, 0, 1, 0.8431373, 1,
-0.07639205, -0.1210044, -2.194184, 0, 1, 0.8509804, 1,
-0.07138339, 0.9207675, -0.5039302, 0, 1, 0.854902, 1,
-0.07084768, -0.6832873, -2.712243, 0, 1, 0.8627451, 1,
-0.07041389, 1.325997, -0.1386037, 0, 1, 0.8666667, 1,
-0.06928401, 0.5917277, -0.9531828, 0, 1, 0.8745098, 1,
-0.06842139, -1.499421, -4.045916, 0, 1, 0.8784314, 1,
-0.06829739, -0.8239614, -2.931301, 0, 1, 0.8862745, 1,
-0.06802285, -1.979107, -5.402439, 0, 1, 0.8901961, 1,
-0.06506376, -0.00723539, -1.276096, 0, 1, 0.8980392, 1,
-0.06257128, -1.126776, -3.816117, 0, 1, 0.9058824, 1,
-0.05932835, 0.6569582, -0.2838849, 0, 1, 0.9098039, 1,
-0.0570548, -0.8180094, -1.930042, 0, 1, 0.9176471, 1,
-0.05061784, -1.468856, -4.062007, 0, 1, 0.9215686, 1,
-0.04970771, -1.235656, -2.211773, 0, 1, 0.9294118, 1,
-0.04668312, 0.04870681, -1.396283, 0, 1, 0.9333333, 1,
-0.03827685, -0.4561191, -3.972827, 0, 1, 0.9411765, 1,
-0.03626789, 1.047879, 1.424397, 0, 1, 0.945098, 1,
-0.03375195, -1.476561, -2.857577, 0, 1, 0.9529412, 1,
-0.03318527, -1.479206, -1.113687, 0, 1, 0.9568627, 1,
-0.03005891, -0.7589658, -3.163306, 0, 1, 0.9647059, 1,
-0.02975981, 0.6192473, 0.4324089, 0, 1, 0.9686275, 1,
-0.0268455, -1.325994, -3.049107, 0, 1, 0.9764706, 1,
-0.02644314, 0.5501409, 1.131501, 0, 1, 0.9803922, 1,
-0.0256038, 1.175105, 0.4161203, 0, 1, 0.9882353, 1,
-0.02365492, -0.2807216, -3.410769, 0, 1, 0.9921569, 1,
-0.01427362, -1.22981, -4.163985, 0, 1, 1, 1,
-0.01389596, 0.06038266, -2.121638, 0, 0.9921569, 1, 1,
-0.009600463, -1.041782, -3.440296, 0, 0.9882353, 1, 1,
-0.009185561, 0.7641628, -0.3172628, 0, 0.9803922, 1, 1,
-0.005414776, -1.040196, -4.307389, 0, 0.9764706, 1, 1,
-0.002492433, -0.1211356, -4.288474, 0, 0.9686275, 1, 1,
0.00352674, -0.8397076, 3.532314, 0, 0.9647059, 1, 1,
0.007690597, 0.6709077, -0.7516882, 0, 0.9568627, 1, 1,
0.009658735, 0.05937668, 0.6401829, 0, 0.9529412, 1, 1,
0.01178604, 1.045868, 0.04158881, 0, 0.945098, 1, 1,
0.01218964, -1.356283, 2.809779, 0, 0.9411765, 1, 1,
0.01387276, 0.9351847, 0.8269307, 0, 0.9333333, 1, 1,
0.01390198, -2.263042, 4.511074, 0, 0.9294118, 1, 1,
0.01557833, -1.182268, 3.857968, 0, 0.9215686, 1, 1,
0.01590899, -0.4780507, 3.525386, 0, 0.9176471, 1, 1,
0.01601016, 0.4615348, 0.4365806, 0, 0.9098039, 1, 1,
0.01852719, 0.0003884082, 2.196074, 0, 0.9058824, 1, 1,
0.0206056, 0.4408081, -0.05728929, 0, 0.8980392, 1, 1,
0.02062002, -0.736502, 3.084087, 0, 0.8901961, 1, 1,
0.02200832, 0.1202612, -1.46022, 0, 0.8862745, 1, 1,
0.02201587, -4.854575e-05, 0.4393735, 0, 0.8784314, 1, 1,
0.02383713, 2.964395, -0.2454432, 0, 0.8745098, 1, 1,
0.02628165, 0.6164511, -1.574693, 0, 0.8666667, 1, 1,
0.02697919, -1.040198, 4.758333, 0, 0.8627451, 1, 1,
0.02775032, 0.0899395, 1.297801, 0, 0.854902, 1, 1,
0.0355458, -1.025977, 3.271177, 0, 0.8509804, 1, 1,
0.03606848, -0.7548761, 3.522856, 0, 0.8431373, 1, 1,
0.04130349, 0.7340503, 0.3173806, 0, 0.8392157, 1, 1,
0.04250313, -1.430758, 1.754681, 0, 0.8313726, 1, 1,
0.04564797, -0.9690892, 3.093915, 0, 0.827451, 1, 1,
0.04740525, 1.120127, 0.04127631, 0, 0.8196079, 1, 1,
0.05479974, -0.481311, 4.055746, 0, 0.8156863, 1, 1,
0.05759558, 0.4587498, 1.076856, 0, 0.8078431, 1, 1,
0.05876503, -0.2895024, 3.320071, 0, 0.8039216, 1, 1,
0.05935034, 0.5248376, 1.279877, 0, 0.7960784, 1, 1,
0.06441215, 2.130706, 0.8050758, 0, 0.7882353, 1, 1,
0.06442468, -1.185414, 3.656198, 0, 0.7843137, 1, 1,
0.07139243, -1.060925, 3.16795, 0, 0.7764706, 1, 1,
0.0745845, -0.773827, 4.579846, 0, 0.772549, 1, 1,
0.07596177, 1.378265, -0.6610718, 0, 0.7647059, 1, 1,
0.07622658, 0.2831703, 2.593798, 0, 0.7607843, 1, 1,
0.07973683, 1.377112, 1.381106, 0, 0.7529412, 1, 1,
0.08683004, -0.9015729, 4.025346, 0, 0.7490196, 1, 1,
0.08698646, 1.229193, 1.229041, 0, 0.7411765, 1, 1,
0.09195977, -0.4478165, 2.498523, 0, 0.7372549, 1, 1,
0.09889296, -0.05895983, 3.07534, 0, 0.7294118, 1, 1,
0.09973608, -0.5795398, 2.968876, 0, 0.7254902, 1, 1,
0.1004877, 0.2032642, 1.129567, 0, 0.7176471, 1, 1,
0.1050654, 0.6456292, -2.20861, 0, 0.7137255, 1, 1,
0.105211, -1.087253, 2.771816, 0, 0.7058824, 1, 1,
0.1083942, -0.6373636, 3.217406, 0, 0.6980392, 1, 1,
0.1095262, 1.396139, 0.1040095, 0, 0.6941177, 1, 1,
0.1203808, -0.247732, 3.409757, 0, 0.6862745, 1, 1,
0.1226324, 1.276905, 0.06232403, 0, 0.682353, 1, 1,
0.1261248, 0.3838618, -0.2792273, 0, 0.6745098, 1, 1,
0.1270381, 0.4120357, 1.840657, 0, 0.6705883, 1, 1,
0.1285915, -1.649492, 3.819393, 0, 0.6627451, 1, 1,
0.1310437, 0.2129089, 0.280921, 0, 0.6588235, 1, 1,
0.134652, -0.7059161, 2.992189, 0, 0.6509804, 1, 1,
0.1349006, -0.246613, 3.775419, 0, 0.6470588, 1, 1,
0.1387201, -0.199112, 1.880722, 0, 0.6392157, 1, 1,
0.1428374, 2.208601, -1.007201, 0, 0.6352941, 1, 1,
0.1430161, 0.0879335, 0.8859065, 0, 0.627451, 1, 1,
0.1484196, 0.8418591, -2.165063, 0, 0.6235294, 1, 1,
0.1522682, 0.2989404, -0.2829807, 0, 0.6156863, 1, 1,
0.1534269, -0.1842463, 3.115518, 0, 0.6117647, 1, 1,
0.1586953, 0.9022186, 2.086009, 0, 0.6039216, 1, 1,
0.1641173, -0.6259112, 3.660429, 0, 0.5960785, 1, 1,
0.1664151, -0.28436, 3.27726, 0, 0.5921569, 1, 1,
0.1671487, 0.925129, 0.6775973, 0, 0.5843138, 1, 1,
0.16902, -0.536198, 4.396738, 0, 0.5803922, 1, 1,
0.1696265, -0.7051548, 1.769363, 0, 0.572549, 1, 1,
0.1747778, 0.8456986, 1.794339, 0, 0.5686275, 1, 1,
0.1783797, -0.1992122, 1.967376, 0, 0.5607843, 1, 1,
0.1806433, 0.08952434, 0.7025512, 0, 0.5568628, 1, 1,
0.181645, -2.063464, 1.724788, 0, 0.5490196, 1, 1,
0.1862163, -2.922623, 4.915196, 0, 0.5450981, 1, 1,
0.1871475, 0.08000941, 0.01627297, 0, 0.5372549, 1, 1,
0.1886837, -0.2808129, 1.455681, 0, 0.5333334, 1, 1,
0.1914743, -0.3911519, 1.461042, 0, 0.5254902, 1, 1,
0.1931754, -1.020761, 1.437821, 0, 0.5215687, 1, 1,
0.1937426, -1.299902, 2.185096, 0, 0.5137255, 1, 1,
0.1945578, -0.0584401, 3.219988, 0, 0.509804, 1, 1,
0.1966345, 0.06434233, -0.2691838, 0, 0.5019608, 1, 1,
0.1978034, -0.9922293, 4.625807, 0, 0.4941176, 1, 1,
0.2084593, 0.6712903, 0.2022021, 0, 0.4901961, 1, 1,
0.2153496, 1.378231, -0.5222206, 0, 0.4823529, 1, 1,
0.215878, 0.9458993, -0.4544472, 0, 0.4784314, 1, 1,
0.2176473, -0.2242233, 3.345602, 0, 0.4705882, 1, 1,
0.2185926, 1.45326, -1.498225, 0, 0.4666667, 1, 1,
0.2210491, -2.360672, 4.738791, 0, 0.4588235, 1, 1,
0.2214078, 1.138398, 0.8967913, 0, 0.454902, 1, 1,
0.233756, -0.4910282, 3.044132, 0, 0.4470588, 1, 1,
0.2350632, 0.7408035, -0.466911, 0, 0.4431373, 1, 1,
0.2364424, 0.3835961, 0.4771956, 0, 0.4352941, 1, 1,
0.2366843, -0.1688179, 2.145099, 0, 0.4313726, 1, 1,
0.2373182, -1.535585, 2.600859, 0, 0.4235294, 1, 1,
0.2377206, 0.02203841, 3.87185, 0, 0.4196078, 1, 1,
0.239068, 1.632147, -1.073866, 0, 0.4117647, 1, 1,
0.2398289, -0.1853267, 1.989365, 0, 0.4078431, 1, 1,
0.2412693, 0.6537078, 0.4596637, 0, 0.4, 1, 1,
0.2481192, -1.944933, 2.862636, 0, 0.3921569, 1, 1,
0.2500857, 0.1668842, -0.9087515, 0, 0.3882353, 1, 1,
0.253505, -1.022066, 2.057279, 0, 0.3803922, 1, 1,
0.2580082, 0.5116622, 1.790156, 0, 0.3764706, 1, 1,
0.2582659, 0.3257382, 1.761076, 0, 0.3686275, 1, 1,
0.2593282, 0.04851327, 2.594031, 0, 0.3647059, 1, 1,
0.2602831, 1.032354, 0.09404295, 0, 0.3568628, 1, 1,
0.260834, 0.3455048, 0.4706621, 0, 0.3529412, 1, 1,
0.2616268, -1.285854, 2.501866, 0, 0.345098, 1, 1,
0.2635343, -0.1539062, 1.492524, 0, 0.3411765, 1, 1,
0.2664515, -1.619492, 2.413848, 0, 0.3333333, 1, 1,
0.2664697, -0.3536631, 1.913974, 0, 0.3294118, 1, 1,
0.2773733, 0.292417, 1.212154, 0, 0.3215686, 1, 1,
0.2775786, 0.7023749, 0.9903513, 0, 0.3176471, 1, 1,
0.2775869, -0.5310882, 1.670777, 0, 0.3098039, 1, 1,
0.2928553, 0.7256229, 1.05764, 0, 0.3058824, 1, 1,
0.2931086, -0.3559548, 4.508114, 0, 0.2980392, 1, 1,
0.2959298, 0.6529981, 0.4269305, 0, 0.2901961, 1, 1,
0.2971028, -0.7340744, 2.184029, 0, 0.2862745, 1, 1,
0.309005, 1.738539, -0.7069782, 0, 0.2784314, 1, 1,
0.3111381, 1.546435, -0.3338344, 0, 0.2745098, 1, 1,
0.3136933, 0.08302567, 1.431188, 0, 0.2666667, 1, 1,
0.3139561, -0.9834218, 3.254909, 0, 0.2627451, 1, 1,
0.3141925, 0.2463639, 1.382779, 0, 0.254902, 1, 1,
0.3171667, -0.6664844, 0.9823086, 0, 0.2509804, 1, 1,
0.3211078, -1.033475, 3.275465, 0, 0.2431373, 1, 1,
0.3238777, -2.011215, 1.28801, 0, 0.2392157, 1, 1,
0.3297776, 0.1281208, 1.896541, 0, 0.2313726, 1, 1,
0.3297916, 0.7020019, -0.3012112, 0, 0.227451, 1, 1,
0.3318474, -1.327773, 4.12869, 0, 0.2196078, 1, 1,
0.3459831, -0.8904778, 2.466523, 0, 0.2156863, 1, 1,
0.3558, -0.4635235, 1.984758, 0, 0.2078431, 1, 1,
0.3611362, -0.5549538, 3.092251, 0, 0.2039216, 1, 1,
0.3716896, -0.2753929, 3.024683, 0, 0.1960784, 1, 1,
0.3761459, 0.0756556, 0.3643323, 0, 0.1882353, 1, 1,
0.3765431, 1.379347, 1.152393, 0, 0.1843137, 1, 1,
0.3774223, 0.759185, 0.5484066, 0, 0.1764706, 1, 1,
0.3781988, 0.5797306, 0.6146589, 0, 0.172549, 1, 1,
0.3786718, -0.4677477, 3.54707, 0, 0.1647059, 1, 1,
0.3801136, 0.1386842, -2.045746, 0, 0.1607843, 1, 1,
0.3801295, -0.435912, 0.6999926, 0, 0.1529412, 1, 1,
0.3817075, -0.04484423, 1.580881, 0, 0.1490196, 1, 1,
0.3823607, -0.8455436, 3.514921, 0, 0.1411765, 1, 1,
0.3874265, 1.332648, 1.757811, 0, 0.1372549, 1, 1,
0.3906026, 2.509398, -0.3131456, 0, 0.1294118, 1, 1,
0.393046, 0.8654115, 0.6390938, 0, 0.1254902, 1, 1,
0.4015611, 0.7372705, 0.3211822, 0, 0.1176471, 1, 1,
0.4085564, -0.9434004, 2.227488, 0, 0.1137255, 1, 1,
0.4093692, -0.09457775, 2.142205, 0, 0.1058824, 1, 1,
0.4131366, -0.1278588, 2.423151, 0, 0.09803922, 1, 1,
0.4142801, 1.559349, 1.787013, 0, 0.09411765, 1, 1,
0.415222, -0.5159445, 1.823878, 0, 0.08627451, 1, 1,
0.4209543, -0.7652926, 2.273221, 0, 0.08235294, 1, 1,
0.4231694, -1.871599, 3.010865, 0, 0.07450981, 1, 1,
0.4244606, -1.944686, 4.539343, 0, 0.07058824, 1, 1,
0.4281449, -0.727539, 2.817058, 0, 0.0627451, 1, 1,
0.4357336, 0.07761214, 1.503283, 0, 0.05882353, 1, 1,
0.4357902, -1.089824, 2.72065, 0, 0.05098039, 1, 1,
0.4369697, 0.8712786, -0.4923503, 0, 0.04705882, 1, 1,
0.4403171, 3.190475, 2.288301, 0, 0.03921569, 1, 1,
0.4409659, 0.3683829, -0.04056966, 0, 0.03529412, 1, 1,
0.4441416, -0.7095648, 3.30599, 0, 0.02745098, 1, 1,
0.444797, -1.238882, 2.976221, 0, 0.02352941, 1, 1,
0.4448703, -0.1495672, 2.227277, 0, 0.01568628, 1, 1,
0.4467795, -0.4764686, 1.603786, 0, 0.01176471, 1, 1,
0.4518758, -0.3960868, 3.18205, 0, 0.003921569, 1, 1,
0.4562193, -0.7018916, 3.000444, 0.003921569, 0, 1, 1,
0.4596973, -0.1694542, 1.620099, 0.007843138, 0, 1, 1,
0.4599029, -0.3987826, 2.676588, 0.01568628, 0, 1, 1,
0.4607747, -1.241198, 0.3971451, 0.01960784, 0, 1, 1,
0.4641293, -0.6698897, 3.414177, 0.02745098, 0, 1, 1,
0.4649413, -2.232353, 1.949438, 0.03137255, 0, 1, 1,
0.4706439, 0.4096694, 0.7305422, 0.03921569, 0, 1, 1,
0.4744982, 0.2256465, 1.328162, 0.04313726, 0, 1, 1,
0.4745262, 0.1866507, 1.887691, 0.05098039, 0, 1, 1,
0.4745898, 0.2557844, 1.79027, 0.05490196, 0, 1, 1,
0.4819883, 0.3286541, 0.1616054, 0.0627451, 0, 1, 1,
0.4860838, 0.8380803, 0.2989273, 0.06666667, 0, 1, 1,
0.4918994, 0.2458148, 1.197502, 0.07450981, 0, 1, 1,
0.4925028, -0.2772541, 0.7716079, 0.07843138, 0, 1, 1,
0.4957122, 0.01565146, 1.484707, 0.08627451, 0, 1, 1,
0.5008345, -0.7413909, 0.9078946, 0.09019608, 0, 1, 1,
0.5028697, -1.100459, 2.795906, 0.09803922, 0, 1, 1,
0.5040767, 1.231912, 1.125252, 0.1058824, 0, 1, 1,
0.5057002, -0.1233648, 2.966694, 0.1098039, 0, 1, 1,
0.5058759, -0.6226462, 1.425764, 0.1176471, 0, 1, 1,
0.5073345, -0.3436653, 2.516867, 0.1215686, 0, 1, 1,
0.5100783, 0.08362951, 1.726022, 0.1294118, 0, 1, 1,
0.5120288, -1.064784, 2.11679, 0.1333333, 0, 1, 1,
0.5136664, -0.2590337, 1.221256, 0.1411765, 0, 1, 1,
0.5143078, -0.09767649, 0.5704513, 0.145098, 0, 1, 1,
0.5149156, 1.292113, 0.97163, 0.1529412, 0, 1, 1,
0.5201373, 0.2814514, -0.06772891, 0.1568628, 0, 1, 1,
0.5204825, -0.3010183, 2.608257, 0.1647059, 0, 1, 1,
0.5238279, -0.2529486, 0.3932772, 0.1686275, 0, 1, 1,
0.5256416, -0.09790283, 0.9154174, 0.1764706, 0, 1, 1,
0.5323172, 0.5836716, 1.232655, 0.1803922, 0, 1, 1,
0.5346841, -1.188348, 3.666792, 0.1882353, 0, 1, 1,
0.5364063, -0.1858176, 2.41445, 0.1921569, 0, 1, 1,
0.5413143, 0.2575208, 1.489502, 0.2, 0, 1, 1,
0.5413832, -0.2090287, 3.05419, 0.2078431, 0, 1, 1,
0.5423926, -0.8622288, 3.784526, 0.2117647, 0, 1, 1,
0.5426838, 0.6681606, 0.9029781, 0.2196078, 0, 1, 1,
0.5450137, -0.2755268, 0.69553, 0.2235294, 0, 1, 1,
0.5480127, -1.07015, 1.997689, 0.2313726, 0, 1, 1,
0.5504215, -0.06602534, 1.056613, 0.2352941, 0, 1, 1,
0.552027, -0.9889969, 2.721193, 0.2431373, 0, 1, 1,
0.5543421, -1.35671, 2.33254, 0.2470588, 0, 1, 1,
0.556646, 0.5217389, 0.8698081, 0.254902, 0, 1, 1,
0.559138, 0.1731421, 0.4692738, 0.2588235, 0, 1, 1,
0.5622129, 2.734417, 0.9824048, 0.2666667, 0, 1, 1,
0.5629247, 0.5601115, 0.1547781, 0.2705882, 0, 1, 1,
0.5684687, -0.01657581, 0.8169762, 0.2784314, 0, 1, 1,
0.5718352, 0.469934, 1.87553, 0.282353, 0, 1, 1,
0.5754982, 1.673548, 0.9518047, 0.2901961, 0, 1, 1,
0.5771953, -0.2778665, 2.538471, 0.2941177, 0, 1, 1,
0.5799571, -1.728233, 3.718839, 0.3019608, 0, 1, 1,
0.5907713, -0.1278316, 2.729232, 0.3098039, 0, 1, 1,
0.5925452, -1.789936, 4.719358, 0.3137255, 0, 1, 1,
0.5947259, -0.611223, 3.259683, 0.3215686, 0, 1, 1,
0.5949872, -1.721529, 2.02436, 0.3254902, 0, 1, 1,
0.5955367, 1.427146, 0.3850665, 0.3333333, 0, 1, 1,
0.5987665, 0.1069293, 0.1716479, 0.3372549, 0, 1, 1,
0.6008025, 0.2796804, 0.7353302, 0.345098, 0, 1, 1,
0.6069347, -2.246733, 3.569906, 0.3490196, 0, 1, 1,
0.6079407, -0.7986851, 2.673432, 0.3568628, 0, 1, 1,
0.6115818, -0.6379246, 3.802873, 0.3607843, 0, 1, 1,
0.6191613, 0.3017139, 2.729306, 0.3686275, 0, 1, 1,
0.6307204, -0.8830413, 2.503934, 0.372549, 0, 1, 1,
0.6342124, -0.7645018, 2.097786, 0.3803922, 0, 1, 1,
0.6342637, -0.6699384, 2.751804, 0.3843137, 0, 1, 1,
0.6371421, -1.643868, 3.724045, 0.3921569, 0, 1, 1,
0.6396074, -0.3162438, 0.7882158, 0.3960784, 0, 1, 1,
0.6417002, 1.120774, 2.542301, 0.4039216, 0, 1, 1,
0.6429301, 1.451607, 2.068883, 0.4117647, 0, 1, 1,
0.6447982, 0.1044708, 0.2687201, 0.4156863, 0, 1, 1,
0.647789, -0.2754606, 1.119741, 0.4235294, 0, 1, 1,
0.6489109, -0.1742513, 2.023274, 0.427451, 0, 1, 1,
0.6490471, 1.691147, -1.34674, 0.4352941, 0, 1, 1,
0.6552906, -0.3587926, 1.475649, 0.4392157, 0, 1, 1,
0.6560773, -1.426254, 1.843671, 0.4470588, 0, 1, 1,
0.6562889, 0.5995478, 1.312208, 0.4509804, 0, 1, 1,
0.657386, -1.00314, 2.598679, 0.4588235, 0, 1, 1,
0.6599507, 0.993575, 1.314745, 0.4627451, 0, 1, 1,
0.6624782, -1.761493, 3.47854, 0.4705882, 0, 1, 1,
0.6624933, 1.025297, 1.332459, 0.4745098, 0, 1, 1,
0.6664606, -0.6719114, 4.197613, 0.4823529, 0, 1, 1,
0.6679808, -2.109061, 2.712667, 0.4862745, 0, 1, 1,
0.6708727, -0.6054717, 0.1312676, 0.4941176, 0, 1, 1,
0.6715459, 0.3238434, 1.542721, 0.5019608, 0, 1, 1,
0.6761133, -2.020577, 3.030633, 0.5058824, 0, 1, 1,
0.6828409, -0.4379312, 1.944826, 0.5137255, 0, 1, 1,
0.6871032, -0.6198417, 2.19995, 0.5176471, 0, 1, 1,
0.6880449, 0.4145109, 1.509908, 0.5254902, 0, 1, 1,
0.6901268, 0.10982, 0.733797, 0.5294118, 0, 1, 1,
0.6917532, 0.7168466, 1.70865, 0.5372549, 0, 1, 1,
0.6933976, -1.067673, 1.397827, 0.5411765, 0, 1, 1,
0.6952859, -0.8200899, 2.849332, 0.5490196, 0, 1, 1,
0.6966628, -1.157421, 0.9931749, 0.5529412, 0, 1, 1,
0.6975874, -0.7693303, 0.9639909, 0.5607843, 0, 1, 1,
0.6993597, -1.276484, 3.476568, 0.5647059, 0, 1, 1,
0.7042258, -1.016683, 3.334248, 0.572549, 0, 1, 1,
0.7046015, -1.062852, 2.737452, 0.5764706, 0, 1, 1,
0.7064135, -0.5314626, 1.340916, 0.5843138, 0, 1, 1,
0.7166709, 1.808296, -0.3201366, 0.5882353, 0, 1, 1,
0.7200324, -0.4320005, 3.581601, 0.5960785, 0, 1, 1,
0.7231654, -1.313678, 2.785277, 0.6039216, 0, 1, 1,
0.7276844, -0.6169761, 4.59608, 0.6078432, 0, 1, 1,
0.7279573, -0.02509382, 0.7417669, 0.6156863, 0, 1, 1,
0.7345865, 1.65756, 0.2430414, 0.6196079, 0, 1, 1,
0.737635, -0.402952, 0.8120824, 0.627451, 0, 1, 1,
0.7395989, -0.1605348, 1.367332, 0.6313726, 0, 1, 1,
0.7428739, 0.3448488, 0.6132507, 0.6392157, 0, 1, 1,
0.7446239, 0.6011887, 2.512265, 0.6431373, 0, 1, 1,
0.7447997, 0.7012682, 2.554569, 0.6509804, 0, 1, 1,
0.753537, 0.4998319, 1.102805, 0.654902, 0, 1, 1,
0.7547736, -0.1967904, 3.369531, 0.6627451, 0, 1, 1,
0.7575751, -0.8224967, 3.713454, 0.6666667, 0, 1, 1,
0.7577894, -2.651864, 4.048563, 0.6745098, 0, 1, 1,
0.7630244, -1.470926, 2.393511, 0.6784314, 0, 1, 1,
0.7667085, 1.039128, -0.8288255, 0.6862745, 0, 1, 1,
0.7722839, 1.189158, -0.7359242, 0.6901961, 0, 1, 1,
0.7794555, 1.093041, -0.04101871, 0.6980392, 0, 1, 1,
0.7949823, 1.071048, 0.5745907, 0.7058824, 0, 1, 1,
0.795849, -0.1854555, 2.06395, 0.7098039, 0, 1, 1,
0.7967584, -1.026479, 2.162686, 0.7176471, 0, 1, 1,
0.7978526, -0.3792706, 2.809069, 0.7215686, 0, 1, 1,
0.7993993, -1.459806, 2.955706, 0.7294118, 0, 1, 1,
0.8006648, -1.453686, 1.379395, 0.7333333, 0, 1, 1,
0.8074259, -1.435889, 2.709088, 0.7411765, 0, 1, 1,
0.8195575, 0.3990992, -0.6926617, 0.7450981, 0, 1, 1,
0.8344738, -1.686084, 3.613177, 0.7529412, 0, 1, 1,
0.8411688, -0.1528445, 1.166424, 0.7568628, 0, 1, 1,
0.841391, -0.4982105, 2.941896, 0.7647059, 0, 1, 1,
0.84212, 0.1890397, 3.175616, 0.7686275, 0, 1, 1,
0.8434875, 0.5278956, 2.164773, 0.7764706, 0, 1, 1,
0.8562364, -0.4968775, 1.052323, 0.7803922, 0, 1, 1,
0.8598832, 0.3319055, 1.123781, 0.7882353, 0, 1, 1,
0.8682916, 1.08789, 0.7897401, 0.7921569, 0, 1, 1,
0.8696402, 0.530734, 1.776829, 0.8, 0, 1, 1,
0.8733363, 0.6224219, 0.5229013, 0.8078431, 0, 1, 1,
0.8798055, -0.9111736, 1.644101, 0.8117647, 0, 1, 1,
0.8857808, -0.2604383, 3.696347, 0.8196079, 0, 1, 1,
0.8866547, 0.4199728, 1.083993, 0.8235294, 0, 1, 1,
0.8893039, -1.438379, 2.255401, 0.8313726, 0, 1, 1,
0.8907034, 1.67206, 0.5575724, 0.8352941, 0, 1, 1,
0.8907535, 1.66947, -0.1381016, 0.8431373, 0, 1, 1,
0.8925096, 0.3693048, 1.103131, 0.8470588, 0, 1, 1,
0.8949712, 1.18231, -0.4308741, 0.854902, 0, 1, 1,
0.8963298, -2.278118, 1.893094, 0.8588235, 0, 1, 1,
0.8984627, 0.1878707, 0.4947166, 0.8666667, 0, 1, 1,
0.9024974, -0.2667533, 2.481692, 0.8705882, 0, 1, 1,
0.9044558, -0.4334635, 2.459558, 0.8784314, 0, 1, 1,
0.9092126, -0.2213375, 0.6379541, 0.8823529, 0, 1, 1,
0.911366, -1.409845, 4.252788, 0.8901961, 0, 1, 1,
0.9136469, 0.779159, 0.7924342, 0.8941177, 0, 1, 1,
0.9137963, -0.3706484, 1.936131, 0.9019608, 0, 1, 1,
0.9211251, -0.1347845, 2.520926, 0.9098039, 0, 1, 1,
0.9263665, -0.2418325, 1.082035, 0.9137255, 0, 1, 1,
0.9276707, -1.143356, 1.918529, 0.9215686, 0, 1, 1,
0.9345613, -0.2763378, 2.621636, 0.9254902, 0, 1, 1,
0.9352952, 0.2057578, 2.935756, 0.9333333, 0, 1, 1,
0.9416809, 2.557556, 2.223278, 0.9372549, 0, 1, 1,
0.9428012, 0.3731079, 2.367823, 0.945098, 0, 1, 1,
0.95124, -0.6381664, 1.899315, 0.9490196, 0, 1, 1,
0.9513073, -0.4783648, 0.6870205, 0.9568627, 0, 1, 1,
0.9659314, -0.3700082, 3.543854, 0.9607843, 0, 1, 1,
0.9672283, -0.1283317, 1.191615, 0.9686275, 0, 1, 1,
0.9722546, -0.4739007, 3.964366, 0.972549, 0, 1, 1,
0.9735561, 0.8770552, 0.7987627, 0.9803922, 0, 1, 1,
0.9796479, 0.8605835, 0.8895652, 0.9843137, 0, 1, 1,
0.989268, -0.2527647, 1.024885, 0.9921569, 0, 1, 1,
0.9896373, -0.2423106, 1.114547, 0.9960784, 0, 1, 1,
0.999905, -1.335678, 1.892443, 1, 0, 0.9960784, 1,
1.001024, -1.109116, 2.186463, 1, 0, 0.9882353, 1,
1.001083, 1.246646, 0.2513529, 1, 0, 0.9843137, 1,
1.00747, -0.1340394, 1.828516, 1, 0, 0.9764706, 1,
1.012905, 1.413567, 2.870022, 1, 0, 0.972549, 1,
1.013369, 0.660284, 1.139123, 1, 0, 0.9647059, 1,
1.015208, -0.4402134, 2.295423, 1, 0, 0.9607843, 1,
1.016537, 1.104057, -0.9196328, 1, 0, 0.9529412, 1,
1.02237, 0.405805, 1.690639, 1, 0, 0.9490196, 1,
1.023449, -0.03623727, 1.674923, 1, 0, 0.9411765, 1,
1.027432, 0.9668379, 0.6574336, 1, 0, 0.9372549, 1,
1.029591, 0.9316223, 1.715814, 1, 0, 0.9294118, 1,
1.030478, -0.2063835, 1.910391, 1, 0, 0.9254902, 1,
1.030738, 0.7087833, 1.557879, 1, 0, 0.9176471, 1,
1.044638, 1.964628, 1.90577, 1, 0, 0.9137255, 1,
1.04965, 0.4863489, 1.569439, 1, 0, 0.9058824, 1,
1.055006, 0.7376673, -0.548049, 1, 0, 0.9019608, 1,
1.060388, -0.8681962, 3.092557, 1, 0, 0.8941177, 1,
1.067584, 0.5264549, 2.673791, 1, 0, 0.8862745, 1,
1.071094, 0.7215385, 0.2305173, 1, 0, 0.8823529, 1,
1.077451, -1.050049, 2.846723, 1, 0, 0.8745098, 1,
1.084933, -0.6909818, 0.8269631, 1, 0, 0.8705882, 1,
1.090848, -0.4686664, 1.241169, 1, 0, 0.8627451, 1,
1.094263, -1.249483, 1.900232, 1, 0, 0.8588235, 1,
1.094726, -2.3399, 3.290253, 1, 0, 0.8509804, 1,
1.09639, 0.4684734, 1.130381, 1, 0, 0.8470588, 1,
1.097381, -0.09743652, 2.129358, 1, 0, 0.8392157, 1,
1.101145, 1.138388, 1.261319, 1, 0, 0.8352941, 1,
1.102074, 1.45841, -1.094015, 1, 0, 0.827451, 1,
1.10248, -1.142967, 3.122535, 1, 0, 0.8235294, 1,
1.115298, -1.454357, 0.8713066, 1, 0, 0.8156863, 1,
1.116675, -1.464395, 2.798957, 1, 0, 0.8117647, 1,
1.123133, 0.7339057, 0.719828, 1, 0, 0.8039216, 1,
1.12613, -1.051264, 2.543941, 1, 0, 0.7960784, 1,
1.126669, 0.07593628, 2.649644, 1, 0, 0.7921569, 1,
1.154783, 0.5224205, 0.8078226, 1, 0, 0.7843137, 1,
1.159474, 1.886497, 0.05076906, 1, 0, 0.7803922, 1,
1.162801, 0.5237362, 0.6626143, 1, 0, 0.772549, 1,
1.164528, 1.403196, 1.606279, 1, 0, 0.7686275, 1,
1.165526, -0.1212771, 0.7647408, 1, 0, 0.7607843, 1,
1.172232, 1.619845, 0.4256444, 1, 0, 0.7568628, 1,
1.172836, -1.571789, 3.109978, 1, 0, 0.7490196, 1,
1.187809, -0.3463229, 0.4041711, 1, 0, 0.7450981, 1,
1.195381, -0.4717211, 0.3488868, 1, 0, 0.7372549, 1,
1.20338, 1.55786, -0.3492782, 1, 0, 0.7333333, 1,
1.205269, -2.006345, 2.558249, 1, 0, 0.7254902, 1,
1.213004, 0.1145955, 1.738254, 1, 0, 0.7215686, 1,
1.21853, 0.914475, 0.007742934, 1, 0, 0.7137255, 1,
1.222754, -2.024588, 2.552757, 1, 0, 0.7098039, 1,
1.226222, 1.045753, 1.195709, 1, 0, 0.7019608, 1,
1.228247, 1.134056, 0.3064001, 1, 0, 0.6941177, 1,
1.251961, 1.087292, 0.7235317, 1, 0, 0.6901961, 1,
1.25478, -0.8441513, 3.190686, 1, 0, 0.682353, 1,
1.255556, -0.00742426, 0.887099, 1, 0, 0.6784314, 1,
1.257226, -0.507668, 2.422646, 1, 0, 0.6705883, 1,
1.259203, -0.1299859, 2.784032, 1, 0, 0.6666667, 1,
1.262477, 0.3045573, 0.894573, 1, 0, 0.6588235, 1,
1.280464, -0.4734859, 0.7474941, 1, 0, 0.654902, 1,
1.28305, -1.37671, 0.3055987, 1, 0, 0.6470588, 1,
1.284952, 1.083335, 2.938745, 1, 0, 0.6431373, 1,
1.288006, -1.506159, 0.8487008, 1, 0, 0.6352941, 1,
1.298863, -1.480034, 1.945964, 1, 0, 0.6313726, 1,
1.308812, -0.4416979, 1.661318, 1, 0, 0.6235294, 1,
1.313148, 1.228655, 0.8795916, 1, 0, 0.6196079, 1,
1.324337, -0.04487376, 2.59963, 1, 0, 0.6117647, 1,
1.328491, -0.7741867, 2.385896, 1, 0, 0.6078432, 1,
1.340049, 1.13691, 2.522146, 1, 0, 0.6, 1,
1.34475, 0.8232729, 2.891339, 1, 0, 0.5921569, 1,
1.345046, 0.5833812, 1.802574, 1, 0, 0.5882353, 1,
1.345075, 1.320997, 1.966034, 1, 0, 0.5803922, 1,
1.345078, -0.162361, 1.464594, 1, 0, 0.5764706, 1,
1.350685, -0.5840079, 3.840692, 1, 0, 0.5686275, 1,
1.372557, 0.05645532, 0.2662117, 1, 0, 0.5647059, 1,
1.376884, 1.478521, 1.212005, 1, 0, 0.5568628, 1,
1.380273, -0.3884944, 2.828038, 1, 0, 0.5529412, 1,
1.382043, 0.137869, 1.868025, 1, 0, 0.5450981, 1,
1.384298, -0.571849, 1.518442, 1, 0, 0.5411765, 1,
1.385694, 0.3327395, 1.83234, 1, 0, 0.5333334, 1,
1.390654, -0.8335182, 2.053808, 1, 0, 0.5294118, 1,
1.395547, -0.1680817, 3.47694, 1, 0, 0.5215687, 1,
1.398777, -0.9537055, 0.8661137, 1, 0, 0.5176471, 1,
1.401831, 1.175551, 0.7468311, 1, 0, 0.509804, 1,
1.403424, 1.060693, 0.5497317, 1, 0, 0.5058824, 1,
1.414336, 1.377855, 1.101359, 1, 0, 0.4980392, 1,
1.418375, -0.05675663, 2.33196, 1, 0, 0.4901961, 1,
1.425102, 0.1049067, 1.971871, 1, 0, 0.4862745, 1,
1.428114, 2.214664, 0.9131434, 1, 0, 0.4784314, 1,
1.439157, 0.2844073, 0.8868732, 1, 0, 0.4745098, 1,
1.452836, -0.8818715, 2.256995, 1, 0, 0.4666667, 1,
1.453093, -0.3153697, 3.118178, 1, 0, 0.4627451, 1,
1.458012, 1.229341, -0.2291262, 1, 0, 0.454902, 1,
1.460599, 0.6276865, -0.3602634, 1, 0, 0.4509804, 1,
1.461707, 0.1821357, 2.512342, 1, 0, 0.4431373, 1,
1.465997, -1.102893, 3.482188, 1, 0, 0.4392157, 1,
1.471707, 2.905543, -0.6733233, 1, 0, 0.4313726, 1,
1.481779, 0.2206855, 1.231843, 1, 0, 0.427451, 1,
1.487192, -1.140312, 3.008813, 1, 0, 0.4196078, 1,
1.504837, 1.924269, 0.9510378, 1, 0, 0.4156863, 1,
1.507762, -0.8614889, 3.454123, 1, 0, 0.4078431, 1,
1.516133, 0.788201, -0.06585482, 1, 0, 0.4039216, 1,
1.53437, 0.6406401, 0.8367874, 1, 0, 0.3960784, 1,
1.542308, -0.39498, 1.592746, 1, 0, 0.3882353, 1,
1.577577, -0.9098331, 2.150892, 1, 0, 0.3843137, 1,
1.579474, 0.3808388, 1.459559, 1, 0, 0.3764706, 1,
1.579966, 1.063663, -0.5748816, 1, 0, 0.372549, 1,
1.583828, -0.86877, 1.242171, 1, 0, 0.3647059, 1,
1.607393, 0.04515913, 1.217205, 1, 0, 0.3607843, 1,
1.610474, -0.6440954, 0.6374785, 1, 0, 0.3529412, 1,
1.631243, 0.9202439, 2.389559, 1, 0, 0.3490196, 1,
1.641616, -1.434277, 2.20327, 1, 0, 0.3411765, 1,
1.642469, 0.213203, 1.219401, 1, 0, 0.3372549, 1,
1.666948, -1.038601, 1.808636, 1, 0, 0.3294118, 1,
1.667538, -0.9051844, 1.723012, 1, 0, 0.3254902, 1,
1.676875, 1.460964, 2.492821, 1, 0, 0.3176471, 1,
1.683264, -1.275571, 1.692674, 1, 0, 0.3137255, 1,
1.685345, -1.03988, 1.37263, 1, 0, 0.3058824, 1,
1.690971, 0.2837247, 2.026946, 1, 0, 0.2980392, 1,
1.722138, 0.9190972, 2.459363, 1, 0, 0.2941177, 1,
1.728468, -0.2643066, 0.008280762, 1, 0, 0.2862745, 1,
1.729573, 0.3026655, 1.887497, 1, 0, 0.282353, 1,
1.736979, -0.3179275, 2.241135, 1, 0, 0.2745098, 1,
1.74855, -0.1688541, 0.9172432, 1, 0, 0.2705882, 1,
1.757608, -0.8917186, 1.549168, 1, 0, 0.2627451, 1,
1.794328, -0.5989338, 2.793687, 1, 0, 0.2588235, 1,
1.822547, -0.08900577, 1.827527, 1, 0, 0.2509804, 1,
1.824603, -1.29238, 2.851202, 1, 0, 0.2470588, 1,
1.855682, 1.645488, 2.381768, 1, 0, 0.2392157, 1,
1.880548, -0.6541462, 1.007009, 1, 0, 0.2352941, 1,
1.886785, 0.3600416, 3.712669, 1, 0, 0.227451, 1,
1.919627, 0.2902195, 0.2749458, 1, 0, 0.2235294, 1,
1.956882, 0.2315619, 1.979988, 1, 0, 0.2156863, 1,
1.958642, 0.9017524, 0.2101279, 1, 0, 0.2117647, 1,
1.971401, 0.1850659, 0.596525, 1, 0, 0.2039216, 1,
1.986452, 0.1395213, 0.06003397, 1, 0, 0.1960784, 1,
1.992093, -0.8221369, 0.3286197, 1, 0, 0.1921569, 1,
2.000208, 0.8706618, 1.883129, 1, 0, 0.1843137, 1,
2.010688, -0.5642944, 2.810262, 1, 0, 0.1803922, 1,
2.016347, 0.3008944, 1.313665, 1, 0, 0.172549, 1,
2.025664, 2.088154, 2.180943, 1, 0, 0.1686275, 1,
2.032951, 1.897079, 1.089877, 1, 0, 0.1607843, 1,
2.038115, 0.05959439, 2.327928, 1, 0, 0.1568628, 1,
2.089845, 0.03358755, 1.945372, 1, 0, 0.1490196, 1,
2.098325, 0.4044524, 2.417995, 1, 0, 0.145098, 1,
2.100964, -0.473649, 2.577751, 1, 0, 0.1372549, 1,
2.158621, -1.263904, 1.691151, 1, 0, 0.1333333, 1,
2.175359, 0.7132292, 1.406148, 1, 0, 0.1254902, 1,
2.188726, 0.5353175, 1.586438, 1, 0, 0.1215686, 1,
2.195768, 0.7527426, 0.9796851, 1, 0, 0.1137255, 1,
2.208305, -0.794407, 2.403133, 1, 0, 0.1098039, 1,
2.254396, -0.799691, 2.754696, 1, 0, 0.1019608, 1,
2.257, -0.009739105, 0.1978716, 1, 0, 0.09411765, 1,
2.287518, -0.549871, 0.008186899, 1, 0, 0.09019608, 1,
2.288195, -0.7029311, 1.183413, 1, 0, 0.08235294, 1,
2.296576, -0.2643243, 1.913299, 1, 0, 0.07843138, 1,
2.304132, 0.787087, 2.846573, 1, 0, 0.07058824, 1,
2.313045, 1.529506, -0.5759848, 1, 0, 0.06666667, 1,
2.356786, 2.239454, 0.5020966, 1, 0, 0.05882353, 1,
2.356889, -1.378301, 1.219812, 1, 0, 0.05490196, 1,
2.357143, 0.6061041, 1.485724, 1, 0, 0.04705882, 1,
2.358884, 0.7314245, 1.951686, 1, 0, 0.04313726, 1,
2.370944, 0.4065677, 2.877112, 1, 0, 0.03529412, 1,
2.447631, -1.630202, 2.176073, 1, 0, 0.03137255, 1,
2.559172, 3.001015, 2.147465, 1, 0, 0.02352941, 1,
2.665642, -1.431406, 3.161686, 1, 0, 0.01960784, 1,
2.687607, -0.7210767, 1.263411, 1, 0, 0.01176471, 1,
2.811629, 0.07364524, 1.976316, 1, 0, 0.007843138, 1
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
-0.2546599, -4.15704, -7.151278, 0, -0.5, 0.5, 0.5,
-0.2546599, -4.15704, -7.151278, 1, -0.5, 0.5, 0.5,
-0.2546599, -4.15704, -7.151278, 1, 1.5, 0.5, 0.5,
-0.2546599, -4.15704, -7.151278, 0, 1.5, 0.5, 0.5
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
-4.360421, 0.04916871, -7.151278, 0, -0.5, 0.5, 0.5,
-4.360421, 0.04916871, -7.151278, 1, -0.5, 0.5, 0.5,
-4.360421, 0.04916871, -7.151278, 1, 1.5, 0.5, 0.5,
-4.360421, 0.04916871, -7.151278, 0, 1.5, 0.5, 0.5
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
-4.360421, -4.15704, -0.2436213, 0, -0.5, 0.5, 0.5,
-4.360421, -4.15704, -0.2436213, 1, -0.5, 0.5, 0.5,
-4.360421, -4.15704, -0.2436213, 1, 1.5, 0.5, 0.5,
-4.360421, -4.15704, -0.2436213, 0, 1.5, 0.5, 0.5
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
-3, -3.186377, -5.557203,
2, -3.186377, -5.557203,
-3, -3.186377, -5.557203,
-3, -3.348154, -5.822882,
-2, -3.186377, -5.557203,
-2, -3.348154, -5.822882,
-1, -3.186377, -5.557203,
-1, -3.348154, -5.822882,
0, -3.186377, -5.557203,
0, -3.348154, -5.822882,
1, -3.186377, -5.557203,
1, -3.348154, -5.822882,
2, -3.186377, -5.557203,
2, -3.348154, -5.822882
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
-3, -3.671708, -6.35424, 0, -0.5, 0.5, 0.5,
-3, -3.671708, -6.35424, 1, -0.5, 0.5, 0.5,
-3, -3.671708, -6.35424, 1, 1.5, 0.5, 0.5,
-3, -3.671708, -6.35424, 0, 1.5, 0.5, 0.5,
-2, -3.671708, -6.35424, 0, -0.5, 0.5, 0.5,
-2, -3.671708, -6.35424, 1, -0.5, 0.5, 0.5,
-2, -3.671708, -6.35424, 1, 1.5, 0.5, 0.5,
-2, -3.671708, -6.35424, 0, 1.5, 0.5, 0.5,
-1, -3.671708, -6.35424, 0, -0.5, 0.5, 0.5,
-1, -3.671708, -6.35424, 1, -0.5, 0.5, 0.5,
-1, -3.671708, -6.35424, 1, 1.5, 0.5, 0.5,
-1, -3.671708, -6.35424, 0, 1.5, 0.5, 0.5,
0, -3.671708, -6.35424, 0, -0.5, 0.5, 0.5,
0, -3.671708, -6.35424, 1, -0.5, 0.5, 0.5,
0, -3.671708, -6.35424, 1, 1.5, 0.5, 0.5,
0, -3.671708, -6.35424, 0, 1.5, 0.5, 0.5,
1, -3.671708, -6.35424, 0, -0.5, 0.5, 0.5,
1, -3.671708, -6.35424, 1, -0.5, 0.5, 0.5,
1, -3.671708, -6.35424, 1, 1.5, 0.5, 0.5,
1, -3.671708, -6.35424, 0, 1.5, 0.5, 0.5,
2, -3.671708, -6.35424, 0, -0.5, 0.5, 0.5,
2, -3.671708, -6.35424, 1, -0.5, 0.5, 0.5,
2, -3.671708, -6.35424, 1, 1.5, 0.5, 0.5,
2, -3.671708, -6.35424, 0, 1.5, 0.5, 0.5
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
-3.412937, -3, -5.557203,
-3.412937, 3, -5.557203,
-3.412937, -3, -5.557203,
-3.570851, -3, -5.822882,
-3.412937, -2, -5.557203,
-3.570851, -2, -5.822882,
-3.412937, -1, -5.557203,
-3.570851, -1, -5.822882,
-3.412937, 0, -5.557203,
-3.570851, 0, -5.822882,
-3.412937, 1, -5.557203,
-3.570851, 1, -5.822882,
-3.412937, 2, -5.557203,
-3.570851, 2, -5.822882,
-3.412937, 3, -5.557203,
-3.570851, 3, -5.822882
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
-3.886679, -3, -6.35424, 0, -0.5, 0.5, 0.5,
-3.886679, -3, -6.35424, 1, -0.5, 0.5, 0.5,
-3.886679, -3, -6.35424, 1, 1.5, 0.5, 0.5,
-3.886679, -3, -6.35424, 0, 1.5, 0.5, 0.5,
-3.886679, -2, -6.35424, 0, -0.5, 0.5, 0.5,
-3.886679, -2, -6.35424, 1, -0.5, 0.5, 0.5,
-3.886679, -2, -6.35424, 1, 1.5, 0.5, 0.5,
-3.886679, -2, -6.35424, 0, 1.5, 0.5, 0.5,
-3.886679, -1, -6.35424, 0, -0.5, 0.5, 0.5,
-3.886679, -1, -6.35424, 1, -0.5, 0.5, 0.5,
-3.886679, -1, -6.35424, 1, 1.5, 0.5, 0.5,
-3.886679, -1, -6.35424, 0, 1.5, 0.5, 0.5,
-3.886679, 0, -6.35424, 0, -0.5, 0.5, 0.5,
-3.886679, 0, -6.35424, 1, -0.5, 0.5, 0.5,
-3.886679, 0, -6.35424, 1, 1.5, 0.5, 0.5,
-3.886679, 0, -6.35424, 0, 1.5, 0.5, 0.5,
-3.886679, 1, -6.35424, 0, -0.5, 0.5, 0.5,
-3.886679, 1, -6.35424, 1, -0.5, 0.5, 0.5,
-3.886679, 1, -6.35424, 1, 1.5, 0.5, 0.5,
-3.886679, 1, -6.35424, 0, 1.5, 0.5, 0.5,
-3.886679, 2, -6.35424, 0, -0.5, 0.5, 0.5,
-3.886679, 2, -6.35424, 1, -0.5, 0.5, 0.5,
-3.886679, 2, -6.35424, 1, 1.5, 0.5, 0.5,
-3.886679, 2, -6.35424, 0, 1.5, 0.5, 0.5,
-3.886679, 3, -6.35424, 0, -0.5, 0.5, 0.5,
-3.886679, 3, -6.35424, 1, -0.5, 0.5, 0.5,
-3.886679, 3, -6.35424, 1, 1.5, 0.5, 0.5,
-3.886679, 3, -6.35424, 0, 1.5, 0.5, 0.5
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
-3.412937, -3.186377, -4,
-3.412937, -3.186377, 4,
-3.412937, -3.186377, -4,
-3.570851, -3.348154, -4,
-3.412937, -3.186377, -2,
-3.570851, -3.348154, -2,
-3.412937, -3.186377, 0,
-3.570851, -3.348154, 0,
-3.412937, -3.186377, 2,
-3.570851, -3.348154, 2,
-3.412937, -3.186377, 4,
-3.570851, -3.348154, 4
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
-3.886679, -3.671708, -4, 0, -0.5, 0.5, 0.5,
-3.886679, -3.671708, -4, 1, -0.5, 0.5, 0.5,
-3.886679, -3.671708, -4, 1, 1.5, 0.5, 0.5,
-3.886679, -3.671708, -4, 0, 1.5, 0.5, 0.5,
-3.886679, -3.671708, -2, 0, -0.5, 0.5, 0.5,
-3.886679, -3.671708, -2, 1, -0.5, 0.5, 0.5,
-3.886679, -3.671708, -2, 1, 1.5, 0.5, 0.5,
-3.886679, -3.671708, -2, 0, 1.5, 0.5, 0.5,
-3.886679, -3.671708, 0, 0, -0.5, 0.5, 0.5,
-3.886679, -3.671708, 0, 1, -0.5, 0.5, 0.5,
-3.886679, -3.671708, 0, 1, 1.5, 0.5, 0.5,
-3.886679, -3.671708, 0, 0, 1.5, 0.5, 0.5,
-3.886679, -3.671708, 2, 0, -0.5, 0.5, 0.5,
-3.886679, -3.671708, 2, 1, -0.5, 0.5, 0.5,
-3.886679, -3.671708, 2, 1, 1.5, 0.5, 0.5,
-3.886679, -3.671708, 2, 0, 1.5, 0.5, 0.5,
-3.886679, -3.671708, 4, 0, -0.5, 0.5, 0.5,
-3.886679, -3.671708, 4, 1, -0.5, 0.5, 0.5,
-3.886679, -3.671708, 4, 1, 1.5, 0.5, 0.5,
-3.886679, -3.671708, 4, 0, 1.5, 0.5, 0.5
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
-3.412937, -3.186377, -5.557203,
-3.412937, 3.284714, -5.557203,
-3.412937, -3.186377, 5.069961,
-3.412937, 3.284714, 5.069961,
-3.412937, -3.186377, -5.557203,
-3.412937, -3.186377, 5.069961,
-3.412937, 3.284714, -5.557203,
-3.412937, 3.284714, 5.069961,
-3.412937, -3.186377, -5.557203,
2.903617, -3.186377, -5.557203,
-3.412937, -3.186377, 5.069961,
2.903617, -3.186377, 5.069961,
-3.412937, 3.284714, -5.557203,
2.903617, 3.284714, -5.557203,
-3.412937, 3.284714, 5.069961,
2.903617, 3.284714, 5.069961,
2.903617, -3.186377, -5.557203,
2.903617, 3.284714, -5.557203,
2.903617, -3.186377, 5.069961,
2.903617, 3.284714, 5.069961,
2.903617, -3.186377, -5.557203,
2.903617, -3.186377, 5.069961,
2.903617, 3.284714, -5.557203,
2.903617, 3.284714, 5.069961
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
var radius = 7.451096;
var distance = 33.15076;
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
mvMatrix.translate( 0.2546599, -0.04916871, 0.2436213 );
mvMatrix.scale( 1.275422, 1.244963, 0.7580829 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.15076);
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
TFC<-read.table("TFC.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-TFC$V2
```

```
## Error in eval(expr, envir, enclos): object 'TFC' not found
```

```r
y<-TFC$V3
```

```
## Error in eval(expr, envir, enclos): object 'TFC' not found
```

```r
z<-TFC$V4
```

```
## Error in eval(expr, envir, enclos): object 'TFC' not found
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
-3.320949, -0.4617109, -1.943699, 0, 0, 1, 1, 1,
-3.198331, 1.421573, -1.78119, 1, 0, 0, 1, 1,
-2.598518, 0.3480181, -2.48976, 1, 0, 0, 1, 1,
-2.509548, -0.1298018, -0.8346248, 1, 0, 0, 1, 1,
-2.390491, 0.7444093, -2.117087, 1, 0, 0, 1, 1,
-2.322463, -0.2253786, -3.180663, 1, 0, 0, 1, 1,
-2.316803, 0.8925326, -0.9287257, 0, 0, 0, 1, 1,
-2.271056, 1.322151, -1.81206, 0, 0, 0, 1, 1,
-2.2699, -0.9654382, -2.67572, 0, 0, 0, 1, 1,
-2.222266, -0.02272702, -1.694343, 0, 0, 0, 1, 1,
-2.134257, 1.263416, -0.8106961, 0, 0, 0, 1, 1,
-2.045531, -1.558825, -3.64907, 0, 0, 0, 1, 1,
-2.031153, 0.2757174, -0.2402619, 0, 0, 0, 1, 1,
-2.012302, -0.3084113, -0.2415193, 1, 1, 1, 1, 1,
-2.005982, -0.3171993, -1.381524, 1, 1, 1, 1, 1,
-2.000936, -0.207745, -0.8338953, 1, 1, 1, 1, 1,
-1.997357, 0.7578403, -0.2850477, 1, 1, 1, 1, 1,
-1.985695, -1.007538, -1.038508, 1, 1, 1, 1, 1,
-1.967858, 2.319731, -1.161, 1, 1, 1, 1, 1,
-1.962135, -0.9235142, -2.514832, 1, 1, 1, 1, 1,
-1.918371, 0.8437716, -0.006450676, 1, 1, 1, 1, 1,
-1.9104, -2.60837, -2.563115, 1, 1, 1, 1, 1,
-1.889989, -0.1781945, -3.140868, 1, 1, 1, 1, 1,
-1.886971, 1.411284, -1.650424, 1, 1, 1, 1, 1,
-1.88484, 0.2151682, -1.814127, 1, 1, 1, 1, 1,
-1.855833, 0.2008754, -0.5832201, 1, 1, 1, 1, 1,
-1.850866, 0.4282248, -0.4934393, 1, 1, 1, 1, 1,
-1.847014, -1.656419, -1.256555, 1, 1, 1, 1, 1,
-1.826087, 1.58174, -0.5191321, 0, 0, 1, 1, 1,
-1.817191, -0.8856468, -2.121762, 1, 0, 0, 1, 1,
-1.80724, -1.161323, -1.956602, 1, 0, 0, 1, 1,
-1.791344, -0.5432785, -2.626136, 1, 0, 0, 1, 1,
-1.758008, -0.1629055, -2.553314, 1, 0, 0, 1, 1,
-1.750675, 1.423597, -1.924648, 1, 0, 0, 1, 1,
-1.727502, -1.739458, -2.68724, 0, 0, 0, 1, 1,
-1.725388, 0.8638163, 0.07887676, 0, 0, 0, 1, 1,
-1.719777, -0.9695135, -2.209468, 0, 0, 0, 1, 1,
-1.714892, -0.9269637, -0.7701352, 0, 0, 0, 1, 1,
-1.71353, 2.02824, -0.06218508, 0, 0, 0, 1, 1,
-1.705566, 0.4682371, 0.04528061, 0, 0, 0, 1, 1,
-1.697253, -0.5108091, -1.169371, 0, 0, 0, 1, 1,
-1.67903, -0.6491664, -2.104514, 1, 1, 1, 1, 1,
-1.676637, 1.208367, -1.463241, 1, 1, 1, 1, 1,
-1.66494, -0.5466053, -2.486489, 1, 1, 1, 1, 1,
-1.66147, -0.8066761, -1.994855, 1, 1, 1, 1, 1,
-1.650944, -0.7995504, -2.791877, 1, 1, 1, 1, 1,
-1.620946, 0.002316806, -1.790229, 1, 1, 1, 1, 1,
-1.620834, 0.7812304, -1.306633, 1, 1, 1, 1, 1,
-1.619307, 1.085319, 0.1409295, 1, 1, 1, 1, 1,
-1.617767, 0.8317276, -1.790156, 1, 1, 1, 1, 1,
-1.616465, 1.696895, -1.863619, 1, 1, 1, 1, 1,
-1.614103, 0.02550251, -2.640224, 1, 1, 1, 1, 1,
-1.596705, -0.1584636, -3.088177, 1, 1, 1, 1, 1,
-1.586611, 0.1391793, -2.546429, 1, 1, 1, 1, 1,
-1.586086, -0.2746128, -2.505166, 1, 1, 1, 1, 1,
-1.57744, 0.465619, 0.04598914, 1, 1, 1, 1, 1,
-1.577395, -2.499843, -2.771262, 0, 0, 1, 1, 1,
-1.556728, 0.08998112, -2.107877, 1, 0, 0, 1, 1,
-1.519228, -0.6742052, -1.176767, 1, 0, 0, 1, 1,
-1.517815, -0.8876969, -1.20365, 1, 0, 0, 1, 1,
-1.499326, 1.64418, -3.156398, 1, 0, 0, 1, 1,
-1.493906, -0.7108456, -2.272696, 1, 0, 0, 1, 1,
-1.491678, -1.270986, -2.862116, 0, 0, 0, 1, 1,
-1.465902, -0.9929565, -2.068002, 0, 0, 0, 1, 1,
-1.464685, 0.8468257, -0.9049451, 0, 0, 0, 1, 1,
-1.455334, 0.07218494, -1.897004, 0, 0, 0, 1, 1,
-1.438244, 3.117991, 1.056669, 0, 0, 0, 1, 1,
-1.427449, -0.4160908, 0.144355, 0, 0, 0, 1, 1,
-1.425773, 0.2729401, -0.5571437, 0, 0, 0, 1, 1,
-1.407246, -1.028076, -1.206349, 1, 1, 1, 1, 1,
-1.40641, -0.2563536, -3.384219, 1, 1, 1, 1, 1,
-1.401741, -2.295432, -4.081396, 1, 1, 1, 1, 1,
-1.400521, -0.002398898, -1.90809, 1, 1, 1, 1, 1,
-1.395906, -0.7767613, -2.121623, 1, 1, 1, 1, 1,
-1.390474, 0.7749044, -0.8817865, 1, 1, 1, 1, 1,
-1.390313, -0.5881129, -1.269835, 1, 1, 1, 1, 1,
-1.378184, 1.062772, -1.570294, 1, 1, 1, 1, 1,
-1.377841, -1.058408, -2.385714, 1, 1, 1, 1, 1,
-1.36659, 0.9174958, 0.6785054, 1, 1, 1, 1, 1,
-1.360399, 0.6194395, -1.032701, 1, 1, 1, 1, 1,
-1.359597, 0.1307325, -0.4092209, 1, 1, 1, 1, 1,
-1.35949, -0.3236005, -2.051479, 1, 1, 1, 1, 1,
-1.357217, -1.859157, -2.082443, 1, 1, 1, 1, 1,
-1.348778, -0.1330666, 0.2416901, 1, 1, 1, 1, 1,
-1.347098, 0.3011678, -1.931797, 0, 0, 1, 1, 1,
-1.332742, -0.7956463, -2.421152, 1, 0, 0, 1, 1,
-1.326055, -3.092137, -3.564992, 1, 0, 0, 1, 1,
-1.321093, -2.215003, -2.144407, 1, 0, 0, 1, 1,
-1.317377, 0.1472614, -2.06771, 1, 0, 0, 1, 1,
-1.311925, -0.2089604, -1.726411, 1, 0, 0, 1, 1,
-1.311636, -0.7506596, -1.626083, 0, 0, 0, 1, 1,
-1.308558, -0.7617432, -3.331438, 0, 0, 0, 1, 1,
-1.276059, -0.1977345, -1.855209, 0, 0, 0, 1, 1,
-1.273931, -0.5318191, -3.229948, 0, 0, 0, 1, 1,
-1.273846, -0.08640429, -1.922954, 0, 0, 0, 1, 1,
-1.269979, 0.3010169, -1.754129, 0, 0, 0, 1, 1,
-1.260927, -0.7509441, -1.28246, 0, 0, 0, 1, 1,
-1.255756, -1.347766, 0.5584782, 1, 1, 1, 1, 1,
-1.253523, 0.6640546, -1.657944, 1, 1, 1, 1, 1,
-1.253187, 0.4833885, -1.12892, 1, 1, 1, 1, 1,
-1.252837, -0.6772115, -2.229271, 1, 1, 1, 1, 1,
-1.248843, 2.909938, -1.601857, 1, 1, 1, 1, 1,
-1.247289, 0.1322176, -0.590418, 1, 1, 1, 1, 1,
-1.24613, -0.5523931, -2.24996, 1, 1, 1, 1, 1,
-1.238858, 1.239052, 1.003978, 1, 1, 1, 1, 1,
-1.236983, -1.779016, -3.725526, 1, 1, 1, 1, 1,
-1.234387, 0.610714, -0.1193582, 1, 1, 1, 1, 1,
-1.2253, -1.537153, -3.046977, 1, 1, 1, 1, 1,
-1.223605, -0.2646527, -0.6014748, 1, 1, 1, 1, 1,
-1.2216, -2.380735, -2.833761, 1, 1, 1, 1, 1,
-1.216745, -0.4539351, -1.414582, 1, 1, 1, 1, 1,
-1.213452, 0.6538669, -1.280594, 1, 1, 1, 1, 1,
-1.210922, 0.1799245, -1.861702, 0, 0, 1, 1, 1,
-1.207766, -1.570916, -2.382461, 1, 0, 0, 1, 1,
-1.202099, 2.034378, -1.011054, 1, 0, 0, 1, 1,
-1.18261, -1.581742, -3.439715, 1, 0, 0, 1, 1,
-1.15796, -2.423393, -2.361567, 1, 0, 0, 1, 1,
-1.156736, 0.364843, -0.5690607, 1, 0, 0, 1, 1,
-1.151593, -0.7360578, -0.1567141, 0, 0, 0, 1, 1,
-1.137382, -1.963776, -3.542023, 0, 0, 0, 1, 1,
-1.134227, 0.6376216, -0.7052983, 0, 0, 0, 1, 1,
-1.128654, 0.4801302, -3.404959, 0, 0, 0, 1, 1,
-1.116564, -1.879826, -2.28929, 0, 0, 0, 1, 1,
-1.106123, 0.07496466, -0.8662736, 0, 0, 0, 1, 1,
-1.103493, 0.4261398, -2.797554, 0, 0, 0, 1, 1,
-1.103383, -1.109841, -3.632751, 1, 1, 1, 1, 1,
-1.10091, -0.8539506, -2.434869, 1, 1, 1, 1, 1,
-1.084547, 0.02485835, -1.12491, 1, 1, 1, 1, 1,
-1.073106, -0.6781815, -3.028212, 1, 1, 1, 1, 1,
-1.069543, 0.7827771, -0.6050022, 1, 1, 1, 1, 1,
-1.060793, 1.406818, 0.182243, 1, 1, 1, 1, 1,
-1.056027, -0.3601366, -1.876178, 1, 1, 1, 1, 1,
-1.046379, -1.192953, -3.271302, 1, 1, 1, 1, 1,
-1.045645, 1.957648, -0.4806148, 1, 1, 1, 1, 1,
-1.045485, -0.5245556, -1.589171, 1, 1, 1, 1, 1,
-1.037571, -1.364355, -4.870089, 1, 1, 1, 1, 1,
-1.035389, -0.5938783, -0.3258215, 1, 1, 1, 1, 1,
-1.032917, -0.3476974, -0.8261222, 1, 1, 1, 1, 1,
-1.029418, -0.1114163, -1.194025, 1, 1, 1, 1, 1,
-1.015318, 0.03539405, -1.055882, 1, 1, 1, 1, 1,
-1.014818, -0.08108231, -1.860383, 0, 0, 1, 1, 1,
-1.013592, -0.5599584, -1.769935, 1, 0, 0, 1, 1,
-1.008171, 0.6450254, -1.291539, 1, 0, 0, 1, 1,
-1.006247, -0.7014289, -3.399601, 1, 0, 0, 1, 1,
-1.002785, -0.5236179, -3.230406, 1, 0, 0, 1, 1,
-0.9978483, -1.064304, -2.505217, 1, 0, 0, 1, 1,
-0.9925543, -0.3505497, -2.050467, 0, 0, 0, 1, 1,
-0.9905637, -0.6886938, -2.353417, 0, 0, 0, 1, 1,
-0.9887913, -0.205807, -2.879237, 0, 0, 0, 1, 1,
-0.9858336, -0.07661265, -1.783093, 0, 0, 0, 1, 1,
-0.9824098, 0.3943186, -1.049817, 0, 0, 0, 1, 1,
-0.9812314, 0.09324494, -2.539014, 0, 0, 0, 1, 1,
-0.9772987, -0.2604416, -3.215816, 0, 0, 0, 1, 1,
-0.9745816, -1.212135, -1.767046, 1, 1, 1, 1, 1,
-0.9663658, -0.2156985, -3.335451, 1, 1, 1, 1, 1,
-0.9641452, 0.1876094, -2.580379, 1, 1, 1, 1, 1,
-0.9587253, 0.5533386, -1.672792, 1, 1, 1, 1, 1,
-0.9584581, 0.05947908, -0.5371943, 1, 1, 1, 1, 1,
-0.9550483, 1.725049, -0.07185883, 1, 1, 1, 1, 1,
-0.9531782, -0.4310176, -1.076376, 1, 1, 1, 1, 1,
-0.9502832, -0.6424896, -1.990263, 1, 1, 1, 1, 1,
-0.9497422, 0.2026435, -3.040252, 1, 1, 1, 1, 1,
-0.9444475, 1.844811, 0.5629407, 1, 1, 1, 1, 1,
-0.9414421, 1.138159, -0.8846381, 1, 1, 1, 1, 1,
-0.9370658, 0.8166114, 0.4590213, 1, 1, 1, 1, 1,
-0.9363043, -1.198493, -3.851988, 1, 1, 1, 1, 1,
-0.9228666, -0.10879, -1.123753, 1, 1, 1, 1, 1,
-0.9177462, -1.124606, -2.42046, 1, 1, 1, 1, 1,
-0.916705, -0.1962775, -1.52969, 0, 0, 1, 1, 1,
-0.9161046, -0.06033508, -2.328954, 1, 0, 0, 1, 1,
-0.9149203, 0.5074729, 0.4306632, 1, 0, 0, 1, 1,
-0.9113215, -0.0984448, -1.772239, 1, 0, 0, 1, 1,
-0.9099508, 0.01034663, -0.8031439, 1, 0, 0, 1, 1,
-0.9091166, -0.07630922, -1.436761, 1, 0, 0, 1, 1,
-0.9059585, -1.560389, -1.40638, 0, 0, 0, 1, 1,
-0.8967084, -1.006854, -1.990019, 0, 0, 0, 1, 1,
-0.8890598, 0.2162999, -0.8195148, 0, 0, 0, 1, 1,
-0.8756536, -0.1306909, -0.5544898, 0, 0, 0, 1, 1,
-0.8745369, 0.615867, -1.193121, 0, 0, 0, 1, 1,
-0.8692037, -1.681561, -3.336008, 0, 0, 0, 1, 1,
-0.8666839, -2.636053, -3.828123, 0, 0, 0, 1, 1,
-0.8633, -2.371159, -2.540684, 1, 1, 1, 1, 1,
-0.8614467, -0.3217238, -0.563786, 1, 1, 1, 1, 1,
-0.8583925, -0.3062268, -1.427666, 1, 1, 1, 1, 1,
-0.8546717, -0.4016177, -2.298321, 1, 1, 1, 1, 1,
-0.8545448, 1.681928, 0.04235056, 1, 1, 1, 1, 1,
-0.8492807, 1.994999, -0.4159611, 1, 1, 1, 1, 1,
-0.8483101, -0.9957565, -2.10486, 1, 1, 1, 1, 1,
-0.8477352, 0.4941002, 0.6465751, 1, 1, 1, 1, 1,
-0.8469758, 1.903189, 0.02156845, 1, 1, 1, 1, 1,
-0.8469105, -0.2369453, -2.626498, 1, 1, 1, 1, 1,
-0.8457399, -0.07501654, -3.315821, 1, 1, 1, 1, 1,
-0.8456841, -0.9488385, -2.091429, 1, 1, 1, 1, 1,
-0.8416919, 0.6651306, -1.179532, 1, 1, 1, 1, 1,
-0.8416137, -0.7454198, -2.608421, 1, 1, 1, 1, 1,
-0.8388713, -2.683652, -5.311451, 1, 1, 1, 1, 1,
-0.8349436, 0.396717, -1.876898, 0, 0, 1, 1, 1,
-0.8337402, 0.5197371, -0.09587354, 1, 0, 0, 1, 1,
-0.8334759, 1.25583, -0.2834675, 1, 0, 0, 1, 1,
-0.8331869, -0.1455226, -2.309273, 1, 0, 0, 1, 1,
-0.8282093, 0.3240441, -0.4712679, 1, 0, 0, 1, 1,
-0.8216866, -0.6931478, -3.413923, 1, 0, 0, 1, 1,
-0.817128, 0.7024111, 0.6614628, 0, 0, 0, 1, 1,
-0.8156663, -0.4425453, -1.256045, 0, 0, 0, 1, 1,
-0.8084133, -0.551268, -2.160484, 0, 0, 0, 1, 1,
-0.8047336, 0.6872536, -0.7512086, 0, 0, 0, 1, 1,
-0.7949212, -0.430483, -0.7705114, 0, 0, 0, 1, 1,
-0.7944709, 0.6043969, -0.6043155, 0, 0, 0, 1, 1,
-0.7929956, 1.297529, -1.858149, 0, 0, 0, 1, 1,
-0.7884131, -1.16599, -4.222125, 1, 1, 1, 1, 1,
-0.7861203, -2.046605, -2.259119, 1, 1, 1, 1, 1,
-0.7854258, 0.9020954, -1.7447, 1, 1, 1, 1, 1,
-0.7846491, -0.536215, -3.923326, 1, 1, 1, 1, 1,
-0.7760906, -1.021367, -3.048015, 1, 1, 1, 1, 1,
-0.7755091, 1.000179, -0.07014158, 1, 1, 1, 1, 1,
-0.7749216, -0.4451236, -2.404721, 1, 1, 1, 1, 1,
-0.7683386, 0.9753544, -2.980835, 1, 1, 1, 1, 1,
-0.7634786, 1.903538, 0.5018204, 1, 1, 1, 1, 1,
-0.7572858, -0.1730608, -0.4648834, 1, 1, 1, 1, 1,
-0.7552972, 0.70823, 0.3633067, 1, 1, 1, 1, 1,
-0.7513691, -2.748999, -1.732621, 1, 1, 1, 1, 1,
-0.7513441, -0.9532402, -4.556063, 1, 1, 1, 1, 1,
-0.751277, 1.11459, 0.8880615, 1, 1, 1, 1, 1,
-0.7507292, 1.158872, -1.520126, 1, 1, 1, 1, 1,
-0.7502648, 0.3243905, -2.009661, 0, 0, 1, 1, 1,
-0.7447326, 1.968394, 0.4112412, 1, 0, 0, 1, 1,
-0.7440475, -0.961535, -2.496293, 1, 0, 0, 1, 1,
-0.7368065, -0.1470266, -0.662944, 1, 0, 0, 1, 1,
-0.7362554, 0.06696079, -2.182101, 1, 0, 0, 1, 1,
-0.7310627, 0.306051, -1.089544, 1, 0, 0, 1, 1,
-0.7296644, -0.1517714, -0.6964855, 0, 0, 0, 1, 1,
-0.7287421, -0.303667, -2.422767, 0, 0, 0, 1, 1,
-0.7198678, 0.317573, -2.18541, 0, 0, 0, 1, 1,
-0.7164978, -0.4181492, -2.650173, 0, 0, 0, 1, 1,
-0.711183, -0.2838458, -1.242922, 0, 0, 0, 1, 1,
-0.7089581, 0.7893617, -0.592317, 0, 0, 0, 1, 1,
-0.7082251, -0.7733446, -1.387203, 0, 0, 0, 1, 1,
-0.7070236, 1.373643, -1.629317, 1, 1, 1, 1, 1,
-0.7046376, -1.108471, -2.188576, 1, 1, 1, 1, 1,
-0.70244, 1.232467, 0.6310863, 1, 1, 1, 1, 1,
-0.7018809, -0.05585283, -0.6319264, 1, 1, 1, 1, 1,
-0.7011302, 0.4915835, -0.4486, 1, 1, 1, 1, 1,
-0.7009007, 0.2885906, -1.584171, 1, 1, 1, 1, 1,
-0.685079, 1.577132, -2.930047, 1, 1, 1, 1, 1,
-0.6842504, -0.4965102, -0.7117308, 1, 1, 1, 1, 1,
-0.682078, -0.3990728, -0.6374629, 1, 1, 1, 1, 1,
-0.6815817, 1.213583, -0.7632196, 1, 1, 1, 1, 1,
-0.680544, -0.8520286, -1.593568, 1, 1, 1, 1, 1,
-0.6736614, 0.735165, -2.346728, 1, 1, 1, 1, 1,
-0.6735236, 0.1189165, -1.912398, 1, 1, 1, 1, 1,
-0.6717802, -0.4705896, -2.308001, 1, 1, 1, 1, 1,
-0.6643438, 1.307472, -0.7338518, 1, 1, 1, 1, 1,
-0.6609568, 0.6862586, -1.148157, 0, 0, 1, 1, 1,
-0.6587265, -1.098793, -3.538708, 1, 0, 0, 1, 1,
-0.6537815, 1.753709, -0.09341773, 1, 0, 0, 1, 1,
-0.6491621, 2.133081, -0.7196429, 1, 0, 0, 1, 1,
-0.6491185, -1.495867, -4.764408, 1, 0, 0, 1, 1,
-0.6463192, -1.078944, -1.942994, 1, 0, 0, 1, 1,
-0.6457162, -1.50126, -2.695327, 0, 0, 0, 1, 1,
-0.6394363, 0.5533172, -0.3290111, 0, 0, 0, 1, 1,
-0.6392983, -1.165203, -1.130317, 0, 0, 0, 1, 1,
-0.6378047, -0.1121133, 0.01385662, 0, 0, 0, 1, 1,
-0.6300142, -0.1312768, -3.292048, 0, 0, 0, 1, 1,
-0.6286146, 0.6269081, -2.548096, 0, 0, 0, 1, 1,
-0.627062, -0.3564651, -0.1764746, 0, 0, 0, 1, 1,
-0.6258008, -1.053527, -4.197635, 1, 1, 1, 1, 1,
-0.6236094, 0.4273458, -1.523415, 1, 1, 1, 1, 1,
-0.6227257, 1.32208, -0.5680375, 1, 1, 1, 1, 1,
-0.6224654, -1.401146, -1.973814, 1, 1, 1, 1, 1,
-0.6188424, 0.1643073, -0.1583392, 1, 1, 1, 1, 1,
-0.6183605, 1.091727, 0.003591363, 1, 1, 1, 1, 1,
-0.6182731, 0.4404308, -0.7445584, 1, 1, 1, 1, 1,
-0.6180627, -0.2568062, -1.709548, 1, 1, 1, 1, 1,
-0.6160789, 1.252658, -0.02823665, 1, 1, 1, 1, 1,
-0.6105477, -0.7497953, -2.015165, 1, 1, 1, 1, 1,
-0.607092, -0.4080924, -1.486427, 1, 1, 1, 1, 1,
-0.6066342, 1.879507, -2.046963, 1, 1, 1, 1, 1,
-0.6053925, -1.00347, -2.336016, 1, 1, 1, 1, 1,
-0.6042381, 0.4846446, 0.4558858, 1, 1, 1, 1, 1,
-0.6023804, 0.482721, -1.302286, 1, 1, 1, 1, 1,
-0.6020625, -0.8085786, -1.901872, 0, 0, 1, 1, 1,
-0.600154, -0.9419067, -1.98567, 1, 0, 0, 1, 1,
-0.5998411, 1.003587, -1.869995, 1, 0, 0, 1, 1,
-0.5980611, -1.820939, -1.533373, 1, 0, 0, 1, 1,
-0.5971718, -1.032113, -3.360069, 1, 0, 0, 1, 1,
-0.5930429, -0.5722246, -2.264561, 1, 0, 0, 1, 1,
-0.5871727, -1.211683, -1.156341, 0, 0, 0, 1, 1,
-0.5870748, -1.641615, -0.730249, 0, 0, 0, 1, 1,
-0.5827891, -0.6253552, -2.669395, 0, 0, 0, 1, 1,
-0.5788082, 0.2029383, -2.416856, 0, 0, 0, 1, 1,
-0.5719664, 1.400355, 0.02854104, 0, 0, 0, 1, 1,
-0.5677888, 0.5791709, -2.939494, 0, 0, 0, 1, 1,
-0.5677399, -0.7546894, -2.61125, 0, 0, 0, 1, 1,
-0.5610853, 0.1005477, -0.2974283, 1, 1, 1, 1, 1,
-0.5575543, 0.4379663, -2.098453, 1, 1, 1, 1, 1,
-0.5538296, -0.5378746, -4.299084, 1, 1, 1, 1, 1,
-0.5520558, -1.002115, -0.1829578, 1, 1, 1, 1, 1,
-0.5503352, 0.2317078, -0.8452802, 1, 1, 1, 1, 1,
-0.5446483, -0.3815649, -0.6065776, 1, 1, 1, 1, 1,
-0.5445974, 0.9516159, -0.6678368, 1, 1, 1, 1, 1,
-0.5428489, 0.6121016, 0.3774188, 1, 1, 1, 1, 1,
-0.5332662, 0.1837495, -0.4351087, 1, 1, 1, 1, 1,
-0.5329457, -1.327225, -3.507128, 1, 1, 1, 1, 1,
-0.5310883, -0.5162221, -2.394959, 1, 1, 1, 1, 1,
-0.5303978, -1.421141, -3.020765, 1, 1, 1, 1, 1,
-0.52653, -0.4859262, -2.312905, 1, 1, 1, 1, 1,
-0.5249068, 0.1083782, -0.6295539, 1, 1, 1, 1, 1,
-0.5234686, 0.7686694, -2.068617, 1, 1, 1, 1, 1,
-0.5211441, -0.5033032, -2.258981, 0, 0, 1, 1, 1,
-0.5198556, 0.241145, -1.044743, 1, 0, 0, 1, 1,
-0.518694, -0.4427052, -2.912235, 1, 0, 0, 1, 1,
-0.5184127, -0.8982602, -1.434096, 1, 0, 0, 1, 1,
-0.5156494, 1.723029, -1.377334, 1, 0, 0, 1, 1,
-0.5151031, -0.9854047, -2.480419, 1, 0, 0, 1, 1,
-0.513085, 0.9526844, -0.02554051, 0, 0, 0, 1, 1,
-0.5124767, 0.09944081, -1.621474, 0, 0, 0, 1, 1,
-0.5093069, 0.4836212, 0.06937812, 0, 0, 0, 1, 1,
-0.5041215, -1.982689, -3.255655, 0, 0, 0, 1, 1,
-0.502849, 0.9739708, -0.5739031, 0, 0, 0, 1, 1,
-0.5012817, -1.163578, -1.216426, 0, 0, 0, 1, 1,
-0.4978122, 1.986198, -0.3482631, 0, 0, 0, 1, 1,
-0.4897546, 0.3806789, -2.023566, 1, 1, 1, 1, 1,
-0.4852521, 2.859519, -0.900969, 1, 1, 1, 1, 1,
-0.4837922, -0.595345, -3.670578, 1, 1, 1, 1, 1,
-0.4789247, 0.9267606, -0.2114076, 1, 1, 1, 1, 1,
-0.4784076, -0.1241817, -1.546424, 1, 1, 1, 1, 1,
-0.4771551, -1.008286, -3.988744, 1, 1, 1, 1, 1,
-0.4770322, 1.581171, -0.951966, 1, 1, 1, 1, 1,
-0.4754598, 0.733154, -0.6343859, 1, 1, 1, 1, 1,
-0.475431, -0.7724715, -2.564853, 1, 1, 1, 1, 1,
-0.4749638, -0.9577816, -2.225104, 1, 1, 1, 1, 1,
-0.4720418, 0.5087335, -1.061809, 1, 1, 1, 1, 1,
-0.4685943, -1.532962, -3.063366, 1, 1, 1, 1, 1,
-0.4666288, 0.358498, -1.907962, 1, 1, 1, 1, 1,
-0.4615769, 0.5511274, -0.02014669, 1, 1, 1, 1, 1,
-0.4603856, 0.5249075, -0.9546167, 1, 1, 1, 1, 1,
-0.4580119, 0.9333608, -0.208653, 0, 0, 1, 1, 1,
-0.4571123, 0.1234783, -0.4874321, 1, 0, 0, 1, 1,
-0.4554781, 0.5131151, -0.5648663, 1, 0, 0, 1, 1,
-0.4526511, -0.111404, -3.235485, 1, 0, 0, 1, 1,
-0.4461428, -0.2388026, -1.32445, 1, 0, 0, 1, 1,
-0.4458497, 0.957469, -1.102764, 1, 0, 0, 1, 1,
-0.4440899, 0.08822917, 0.7360271, 0, 0, 0, 1, 1,
-0.4435647, -0.6736849, -1.944222, 0, 0, 0, 1, 1,
-0.4388016, -0.03965479, -4.460673, 0, 0, 0, 1, 1,
-0.4383361, -0.8336346, -3.012574, 0, 0, 0, 1, 1,
-0.4374339, 1.591668, -0.9926344, 0, 0, 0, 1, 1,
-0.4366708, -1.188362, -2.32205, 0, 0, 0, 1, 1,
-0.4347981, -0.513851, -2.249906, 0, 0, 0, 1, 1,
-0.434586, 0.7549734, -0.5025518, 1, 1, 1, 1, 1,
-0.4333903, -1.001779, -3.400192, 1, 1, 1, 1, 1,
-0.430856, 0.1187695, -1.092834, 1, 1, 1, 1, 1,
-0.4252667, -0.1942574, -3.645525, 1, 1, 1, 1, 1,
-0.4190952, -0.8083966, -3.389577, 1, 1, 1, 1, 1,
-0.408841, -2.245684, -4.160954, 1, 1, 1, 1, 1,
-0.404494, -0.08587278, -1.559699, 1, 1, 1, 1, 1,
-0.402049, 1.260998, -0.8582165, 1, 1, 1, 1, 1,
-0.4019762, -1.621089, -3.939234, 1, 1, 1, 1, 1,
-0.4010132, 0.02202032, -1.925166, 1, 1, 1, 1, 1,
-0.3994646, 0.6773765, -1.011145, 1, 1, 1, 1, 1,
-0.3969118, 0.7896322, -0.7071458, 1, 1, 1, 1, 1,
-0.3945332, 0.1382223, -2.716974, 1, 1, 1, 1, 1,
-0.3874111, 0.370404, -0.585511, 1, 1, 1, 1, 1,
-0.3849796, -0.2966894, -2.030711, 1, 1, 1, 1, 1,
-0.3747639, -1.33456, -3.707433, 0, 0, 1, 1, 1,
-0.371024, 1.490681, -1.656612, 1, 0, 0, 1, 1,
-0.3709641, -0.01766518, -2.459887, 1, 0, 0, 1, 1,
-0.362977, -0.5700353, -3.286984, 1, 0, 0, 1, 1,
-0.3579035, -0.9173083, -1.878182, 1, 0, 0, 1, 1,
-0.3563302, 0.9865109, 1.479182, 1, 0, 0, 1, 1,
-0.3562257, 1.584382, -1.46507, 0, 0, 0, 1, 1,
-0.35382, -1.473557, -2.025729, 0, 0, 0, 1, 1,
-0.3467292, 0.0247262, -1.744675, 0, 0, 0, 1, 1,
-0.3403448, 0.1118979, -1.834622, 0, 0, 0, 1, 1,
-0.3327011, 2.498548, -0.07960089, 0, 0, 0, 1, 1,
-0.3265617, -0.6853018, -1.500142, 0, 0, 0, 1, 1,
-0.3258258, -0.1412911, -3.475399, 0, 0, 0, 1, 1,
-0.3253398, 0.2813262, -0.7354849, 1, 1, 1, 1, 1,
-0.321546, -0.3082041, -3.14848, 1, 1, 1, 1, 1,
-0.3137116, 0.3854405, 0.3896382, 1, 1, 1, 1, 1,
-0.3042208, -0.889283, -4.222253, 1, 1, 1, 1, 1,
-0.3019502, 0.83714, -0.8507128, 1, 1, 1, 1, 1,
-0.2973175, 1.515342, -0.7232505, 1, 1, 1, 1, 1,
-0.2964365, -0.8052809, -2.505685, 1, 1, 1, 1, 1,
-0.2928562, -0.8636199, -1.413334, 1, 1, 1, 1, 1,
-0.2836883, -1.028055, -3.622118, 1, 1, 1, 1, 1,
-0.2816896, 0.8651525, -1.029256, 1, 1, 1, 1, 1,
-0.2796769, -1.482535, -4.439211, 1, 1, 1, 1, 1,
-0.2741966, 1.161579, 0.4016061, 1, 1, 1, 1, 1,
-0.2688524, -0.6243756, -2.735072, 1, 1, 1, 1, 1,
-0.2682151, 0.867021, 1.324796, 1, 1, 1, 1, 1,
-0.2663831, -0.6969991, -3.617251, 1, 1, 1, 1, 1,
-0.2570058, 0.47806, -1.410673, 0, 0, 1, 1, 1,
-0.2534926, -1.258899, -3.063809, 1, 0, 0, 1, 1,
-0.2516378, -1.627155, -2.966312, 1, 0, 0, 1, 1,
-0.2509264, -1.318468, -3.204663, 1, 0, 0, 1, 1,
-0.2508208, -1.631883, -4.788479, 1, 0, 0, 1, 1,
-0.249992, -0.07533028, -2.796079, 1, 0, 0, 1, 1,
-0.2492535, 0.9237921, -0.8834468, 0, 0, 0, 1, 1,
-0.246479, 0.5819015, 0.2940263, 0, 0, 0, 1, 1,
-0.2452124, -1.248572, -2.577818, 0, 0, 0, 1, 1,
-0.2393012, -1.673334, -1.940305, 0, 0, 0, 1, 1,
-0.2387722, 0.9409557, -0.7672659, 0, 0, 0, 1, 1,
-0.2386332, -0.2621897, -1.527581, 0, 0, 0, 1, 1,
-0.2380816, -0.750708, -2.616353, 0, 0, 0, 1, 1,
-0.2307235, 0.3754739, 1.285782, 1, 1, 1, 1, 1,
-0.228541, -0.6236902, -2.832917, 1, 1, 1, 1, 1,
-0.2276267, 0.9973063, 0.754483, 1, 1, 1, 1, 1,
-0.2248782, -0.5037009, -2.805192, 1, 1, 1, 1, 1,
-0.2231041, 0.8178492, 1.343661, 1, 1, 1, 1, 1,
-0.2189531, -1.343329, -3.774329, 1, 1, 1, 1, 1,
-0.2167009, -1.822921, -3.518656, 1, 1, 1, 1, 1,
-0.2159486, 1.568415, 0.7232347, 1, 1, 1, 1, 1,
-0.2118749, 0.5747478, -0.04103279, 1, 1, 1, 1, 1,
-0.2116237, 0.1496446, -1.444441, 1, 1, 1, 1, 1,
-0.2046988, -0.8232679, -2.430703, 1, 1, 1, 1, 1,
-0.2020679, 0.08796839, -1.29264, 1, 1, 1, 1, 1,
-0.2016779, -0.06531766, -2.087351, 1, 1, 1, 1, 1,
-0.2011596, 0.8357786, 0.2861491, 1, 1, 1, 1, 1,
-0.1998609, -1.391631, -2.734289, 1, 1, 1, 1, 1,
-0.1974584, -1.089317, -2.527258, 0, 0, 1, 1, 1,
-0.1946962, 1.961251, -0.4978345, 1, 0, 0, 1, 1,
-0.1939206, 0.1003617, 0.1200691, 1, 0, 0, 1, 1,
-0.1908165, 1.478216, 1.426923, 1, 0, 0, 1, 1,
-0.1879468, 0.5079939, 1.042524, 1, 0, 0, 1, 1,
-0.1864694, 0.2312386, -0.8007205, 1, 0, 0, 1, 1,
-0.186252, -2.33284, -1.99377, 0, 0, 0, 1, 1,
-0.1828002, -2.355411, -3.077133, 0, 0, 0, 1, 1,
-0.1797109, 2.145437, 0.8389766, 0, 0, 0, 1, 1,
-0.175938, -0.6394042, -4.81354, 0, 0, 0, 1, 1,
-0.1724696, -2.686226, -2.54515, 0, 0, 0, 1, 1,
-0.1722599, 0.7976785, 1.269117, 0, 0, 0, 1, 1,
-0.1710459, -1.282319, -2.860189, 0, 0, 0, 1, 1,
-0.1697964, -0.2603464, -2.322391, 1, 1, 1, 1, 1,
-0.1649922, 0.3923768, -2.57994, 1, 1, 1, 1, 1,
-0.1635077, -0.4854556, -2.341475, 1, 1, 1, 1, 1,
-0.1610291, -0.9905047, -2.549706, 1, 1, 1, 1, 1,
-0.1584541, 0.3853574, -0.5241585, 1, 1, 1, 1, 1,
-0.1577059, 0.418153, -1.2911, 1, 1, 1, 1, 1,
-0.1526717, -0.6665451, -2.630121, 1, 1, 1, 1, 1,
-0.1521739, -0.1319708, -3.107061, 1, 1, 1, 1, 1,
-0.1520936, 0.04575784, -0.8445019, 1, 1, 1, 1, 1,
-0.1417568, -0.7218031, -2.741403, 1, 1, 1, 1, 1,
-0.1407334, -0.7689121, -3.070239, 1, 1, 1, 1, 1,
-0.1399574, 0.2942854, -0.3404316, 1, 1, 1, 1, 1,
-0.1310647, 1.0176, 0.38252, 1, 1, 1, 1, 1,
-0.1302676, -0.1498965, -3.849016, 1, 1, 1, 1, 1,
-0.1277755, 0.4036265, 0.9016855, 1, 1, 1, 1, 1,
-0.1259152, -0.3204519, -2.439237, 0, 0, 1, 1, 1,
-0.1243363, -2.049743, -2.65847, 1, 0, 0, 1, 1,
-0.1242113, -0.5305962, -4.015541, 1, 0, 0, 1, 1,
-0.1199694, -1.143155, -1.693666, 1, 0, 0, 1, 1,
-0.1191192, -0.04703289, -3.191243, 1, 0, 0, 1, 1,
-0.1169645, 0.8966433, -0.4856677, 1, 0, 0, 1, 1,
-0.115035, 0.2044778, -0.1108404, 0, 0, 0, 1, 1,
-0.1134649, 0.5890247, -2.175329, 0, 0, 0, 1, 1,
-0.1102456, 1.81204, -1.035705, 0, 0, 0, 1, 1,
-0.1101229, -0.5783722, -3.184907, 0, 0, 0, 1, 1,
-0.1075763, -1.15021, -4.25249, 0, 0, 0, 1, 1,
-0.1065153, -0.7646121, -1.814912, 0, 0, 0, 1, 1,
-0.1000669, -0.784471, -3.249104, 0, 0, 0, 1, 1,
-0.09994555, 2.299556, 0.5997353, 1, 1, 1, 1, 1,
-0.09983966, -0.804738, -2.848521, 1, 1, 1, 1, 1,
-0.09769198, -0.2169386, -1.739221, 1, 1, 1, 1, 1,
-0.09704909, 0.4048615, 1.012647, 1, 1, 1, 1, 1,
-0.09231998, -0.5901318, -3.65815, 1, 1, 1, 1, 1,
-0.09204395, -0.7370446, -1.617214, 1, 1, 1, 1, 1,
-0.09178428, 2.471001, -0.3748797, 1, 1, 1, 1, 1,
-0.09146235, 0.04466128, -1.590521, 1, 1, 1, 1, 1,
-0.0877974, -0.5675152, -4.297775, 1, 1, 1, 1, 1,
-0.0875613, 1.033309, -0.6881478, 1, 1, 1, 1, 1,
-0.08418746, -0.06244585, -1.910256, 1, 1, 1, 1, 1,
-0.08346462, 0.7016834, 2.363846, 1, 1, 1, 1, 1,
-0.0832474, 1.363019, 0.1008397, 1, 1, 1, 1, 1,
-0.07861339, 1.552695, -1.241312, 1, 1, 1, 1, 1,
-0.07639205, -0.1210044, -2.194184, 1, 1, 1, 1, 1,
-0.07138339, 0.9207675, -0.5039302, 0, 0, 1, 1, 1,
-0.07084768, -0.6832873, -2.712243, 1, 0, 0, 1, 1,
-0.07041389, 1.325997, -0.1386037, 1, 0, 0, 1, 1,
-0.06928401, 0.5917277, -0.9531828, 1, 0, 0, 1, 1,
-0.06842139, -1.499421, -4.045916, 1, 0, 0, 1, 1,
-0.06829739, -0.8239614, -2.931301, 1, 0, 0, 1, 1,
-0.06802285, -1.979107, -5.402439, 0, 0, 0, 1, 1,
-0.06506376, -0.00723539, -1.276096, 0, 0, 0, 1, 1,
-0.06257128, -1.126776, -3.816117, 0, 0, 0, 1, 1,
-0.05932835, 0.6569582, -0.2838849, 0, 0, 0, 1, 1,
-0.0570548, -0.8180094, -1.930042, 0, 0, 0, 1, 1,
-0.05061784, -1.468856, -4.062007, 0, 0, 0, 1, 1,
-0.04970771, -1.235656, -2.211773, 0, 0, 0, 1, 1,
-0.04668312, 0.04870681, -1.396283, 1, 1, 1, 1, 1,
-0.03827685, -0.4561191, -3.972827, 1, 1, 1, 1, 1,
-0.03626789, 1.047879, 1.424397, 1, 1, 1, 1, 1,
-0.03375195, -1.476561, -2.857577, 1, 1, 1, 1, 1,
-0.03318527, -1.479206, -1.113687, 1, 1, 1, 1, 1,
-0.03005891, -0.7589658, -3.163306, 1, 1, 1, 1, 1,
-0.02975981, 0.6192473, 0.4324089, 1, 1, 1, 1, 1,
-0.0268455, -1.325994, -3.049107, 1, 1, 1, 1, 1,
-0.02644314, 0.5501409, 1.131501, 1, 1, 1, 1, 1,
-0.0256038, 1.175105, 0.4161203, 1, 1, 1, 1, 1,
-0.02365492, -0.2807216, -3.410769, 1, 1, 1, 1, 1,
-0.01427362, -1.22981, -4.163985, 1, 1, 1, 1, 1,
-0.01389596, 0.06038266, -2.121638, 1, 1, 1, 1, 1,
-0.009600463, -1.041782, -3.440296, 1, 1, 1, 1, 1,
-0.009185561, 0.7641628, -0.3172628, 1, 1, 1, 1, 1,
-0.005414776, -1.040196, -4.307389, 0, 0, 1, 1, 1,
-0.002492433, -0.1211356, -4.288474, 1, 0, 0, 1, 1,
0.00352674, -0.8397076, 3.532314, 1, 0, 0, 1, 1,
0.007690597, 0.6709077, -0.7516882, 1, 0, 0, 1, 1,
0.009658735, 0.05937668, 0.6401829, 1, 0, 0, 1, 1,
0.01178604, 1.045868, 0.04158881, 1, 0, 0, 1, 1,
0.01218964, -1.356283, 2.809779, 0, 0, 0, 1, 1,
0.01387276, 0.9351847, 0.8269307, 0, 0, 0, 1, 1,
0.01390198, -2.263042, 4.511074, 0, 0, 0, 1, 1,
0.01557833, -1.182268, 3.857968, 0, 0, 0, 1, 1,
0.01590899, -0.4780507, 3.525386, 0, 0, 0, 1, 1,
0.01601016, 0.4615348, 0.4365806, 0, 0, 0, 1, 1,
0.01852719, 0.0003884082, 2.196074, 0, 0, 0, 1, 1,
0.0206056, 0.4408081, -0.05728929, 1, 1, 1, 1, 1,
0.02062002, -0.736502, 3.084087, 1, 1, 1, 1, 1,
0.02200832, 0.1202612, -1.46022, 1, 1, 1, 1, 1,
0.02201587, -4.854575e-05, 0.4393735, 1, 1, 1, 1, 1,
0.02383713, 2.964395, -0.2454432, 1, 1, 1, 1, 1,
0.02628165, 0.6164511, -1.574693, 1, 1, 1, 1, 1,
0.02697919, -1.040198, 4.758333, 1, 1, 1, 1, 1,
0.02775032, 0.0899395, 1.297801, 1, 1, 1, 1, 1,
0.0355458, -1.025977, 3.271177, 1, 1, 1, 1, 1,
0.03606848, -0.7548761, 3.522856, 1, 1, 1, 1, 1,
0.04130349, 0.7340503, 0.3173806, 1, 1, 1, 1, 1,
0.04250313, -1.430758, 1.754681, 1, 1, 1, 1, 1,
0.04564797, -0.9690892, 3.093915, 1, 1, 1, 1, 1,
0.04740525, 1.120127, 0.04127631, 1, 1, 1, 1, 1,
0.05479974, -0.481311, 4.055746, 1, 1, 1, 1, 1,
0.05759558, 0.4587498, 1.076856, 0, 0, 1, 1, 1,
0.05876503, -0.2895024, 3.320071, 1, 0, 0, 1, 1,
0.05935034, 0.5248376, 1.279877, 1, 0, 0, 1, 1,
0.06441215, 2.130706, 0.8050758, 1, 0, 0, 1, 1,
0.06442468, -1.185414, 3.656198, 1, 0, 0, 1, 1,
0.07139243, -1.060925, 3.16795, 1, 0, 0, 1, 1,
0.0745845, -0.773827, 4.579846, 0, 0, 0, 1, 1,
0.07596177, 1.378265, -0.6610718, 0, 0, 0, 1, 1,
0.07622658, 0.2831703, 2.593798, 0, 0, 0, 1, 1,
0.07973683, 1.377112, 1.381106, 0, 0, 0, 1, 1,
0.08683004, -0.9015729, 4.025346, 0, 0, 0, 1, 1,
0.08698646, 1.229193, 1.229041, 0, 0, 0, 1, 1,
0.09195977, -0.4478165, 2.498523, 0, 0, 0, 1, 1,
0.09889296, -0.05895983, 3.07534, 1, 1, 1, 1, 1,
0.09973608, -0.5795398, 2.968876, 1, 1, 1, 1, 1,
0.1004877, 0.2032642, 1.129567, 1, 1, 1, 1, 1,
0.1050654, 0.6456292, -2.20861, 1, 1, 1, 1, 1,
0.105211, -1.087253, 2.771816, 1, 1, 1, 1, 1,
0.1083942, -0.6373636, 3.217406, 1, 1, 1, 1, 1,
0.1095262, 1.396139, 0.1040095, 1, 1, 1, 1, 1,
0.1203808, -0.247732, 3.409757, 1, 1, 1, 1, 1,
0.1226324, 1.276905, 0.06232403, 1, 1, 1, 1, 1,
0.1261248, 0.3838618, -0.2792273, 1, 1, 1, 1, 1,
0.1270381, 0.4120357, 1.840657, 1, 1, 1, 1, 1,
0.1285915, -1.649492, 3.819393, 1, 1, 1, 1, 1,
0.1310437, 0.2129089, 0.280921, 1, 1, 1, 1, 1,
0.134652, -0.7059161, 2.992189, 1, 1, 1, 1, 1,
0.1349006, -0.246613, 3.775419, 1, 1, 1, 1, 1,
0.1387201, -0.199112, 1.880722, 0, 0, 1, 1, 1,
0.1428374, 2.208601, -1.007201, 1, 0, 0, 1, 1,
0.1430161, 0.0879335, 0.8859065, 1, 0, 0, 1, 1,
0.1484196, 0.8418591, -2.165063, 1, 0, 0, 1, 1,
0.1522682, 0.2989404, -0.2829807, 1, 0, 0, 1, 1,
0.1534269, -0.1842463, 3.115518, 1, 0, 0, 1, 1,
0.1586953, 0.9022186, 2.086009, 0, 0, 0, 1, 1,
0.1641173, -0.6259112, 3.660429, 0, 0, 0, 1, 1,
0.1664151, -0.28436, 3.27726, 0, 0, 0, 1, 1,
0.1671487, 0.925129, 0.6775973, 0, 0, 0, 1, 1,
0.16902, -0.536198, 4.396738, 0, 0, 0, 1, 1,
0.1696265, -0.7051548, 1.769363, 0, 0, 0, 1, 1,
0.1747778, 0.8456986, 1.794339, 0, 0, 0, 1, 1,
0.1783797, -0.1992122, 1.967376, 1, 1, 1, 1, 1,
0.1806433, 0.08952434, 0.7025512, 1, 1, 1, 1, 1,
0.181645, -2.063464, 1.724788, 1, 1, 1, 1, 1,
0.1862163, -2.922623, 4.915196, 1, 1, 1, 1, 1,
0.1871475, 0.08000941, 0.01627297, 1, 1, 1, 1, 1,
0.1886837, -0.2808129, 1.455681, 1, 1, 1, 1, 1,
0.1914743, -0.3911519, 1.461042, 1, 1, 1, 1, 1,
0.1931754, -1.020761, 1.437821, 1, 1, 1, 1, 1,
0.1937426, -1.299902, 2.185096, 1, 1, 1, 1, 1,
0.1945578, -0.0584401, 3.219988, 1, 1, 1, 1, 1,
0.1966345, 0.06434233, -0.2691838, 1, 1, 1, 1, 1,
0.1978034, -0.9922293, 4.625807, 1, 1, 1, 1, 1,
0.2084593, 0.6712903, 0.2022021, 1, 1, 1, 1, 1,
0.2153496, 1.378231, -0.5222206, 1, 1, 1, 1, 1,
0.215878, 0.9458993, -0.4544472, 1, 1, 1, 1, 1,
0.2176473, -0.2242233, 3.345602, 0, 0, 1, 1, 1,
0.2185926, 1.45326, -1.498225, 1, 0, 0, 1, 1,
0.2210491, -2.360672, 4.738791, 1, 0, 0, 1, 1,
0.2214078, 1.138398, 0.8967913, 1, 0, 0, 1, 1,
0.233756, -0.4910282, 3.044132, 1, 0, 0, 1, 1,
0.2350632, 0.7408035, -0.466911, 1, 0, 0, 1, 1,
0.2364424, 0.3835961, 0.4771956, 0, 0, 0, 1, 1,
0.2366843, -0.1688179, 2.145099, 0, 0, 0, 1, 1,
0.2373182, -1.535585, 2.600859, 0, 0, 0, 1, 1,
0.2377206, 0.02203841, 3.87185, 0, 0, 0, 1, 1,
0.239068, 1.632147, -1.073866, 0, 0, 0, 1, 1,
0.2398289, -0.1853267, 1.989365, 0, 0, 0, 1, 1,
0.2412693, 0.6537078, 0.4596637, 0, 0, 0, 1, 1,
0.2481192, -1.944933, 2.862636, 1, 1, 1, 1, 1,
0.2500857, 0.1668842, -0.9087515, 1, 1, 1, 1, 1,
0.253505, -1.022066, 2.057279, 1, 1, 1, 1, 1,
0.2580082, 0.5116622, 1.790156, 1, 1, 1, 1, 1,
0.2582659, 0.3257382, 1.761076, 1, 1, 1, 1, 1,
0.2593282, 0.04851327, 2.594031, 1, 1, 1, 1, 1,
0.2602831, 1.032354, 0.09404295, 1, 1, 1, 1, 1,
0.260834, 0.3455048, 0.4706621, 1, 1, 1, 1, 1,
0.2616268, -1.285854, 2.501866, 1, 1, 1, 1, 1,
0.2635343, -0.1539062, 1.492524, 1, 1, 1, 1, 1,
0.2664515, -1.619492, 2.413848, 1, 1, 1, 1, 1,
0.2664697, -0.3536631, 1.913974, 1, 1, 1, 1, 1,
0.2773733, 0.292417, 1.212154, 1, 1, 1, 1, 1,
0.2775786, 0.7023749, 0.9903513, 1, 1, 1, 1, 1,
0.2775869, -0.5310882, 1.670777, 1, 1, 1, 1, 1,
0.2928553, 0.7256229, 1.05764, 0, 0, 1, 1, 1,
0.2931086, -0.3559548, 4.508114, 1, 0, 0, 1, 1,
0.2959298, 0.6529981, 0.4269305, 1, 0, 0, 1, 1,
0.2971028, -0.7340744, 2.184029, 1, 0, 0, 1, 1,
0.309005, 1.738539, -0.7069782, 1, 0, 0, 1, 1,
0.3111381, 1.546435, -0.3338344, 1, 0, 0, 1, 1,
0.3136933, 0.08302567, 1.431188, 0, 0, 0, 1, 1,
0.3139561, -0.9834218, 3.254909, 0, 0, 0, 1, 1,
0.3141925, 0.2463639, 1.382779, 0, 0, 0, 1, 1,
0.3171667, -0.6664844, 0.9823086, 0, 0, 0, 1, 1,
0.3211078, -1.033475, 3.275465, 0, 0, 0, 1, 1,
0.3238777, -2.011215, 1.28801, 0, 0, 0, 1, 1,
0.3297776, 0.1281208, 1.896541, 0, 0, 0, 1, 1,
0.3297916, 0.7020019, -0.3012112, 1, 1, 1, 1, 1,
0.3318474, -1.327773, 4.12869, 1, 1, 1, 1, 1,
0.3459831, -0.8904778, 2.466523, 1, 1, 1, 1, 1,
0.3558, -0.4635235, 1.984758, 1, 1, 1, 1, 1,
0.3611362, -0.5549538, 3.092251, 1, 1, 1, 1, 1,
0.3716896, -0.2753929, 3.024683, 1, 1, 1, 1, 1,
0.3761459, 0.0756556, 0.3643323, 1, 1, 1, 1, 1,
0.3765431, 1.379347, 1.152393, 1, 1, 1, 1, 1,
0.3774223, 0.759185, 0.5484066, 1, 1, 1, 1, 1,
0.3781988, 0.5797306, 0.6146589, 1, 1, 1, 1, 1,
0.3786718, -0.4677477, 3.54707, 1, 1, 1, 1, 1,
0.3801136, 0.1386842, -2.045746, 1, 1, 1, 1, 1,
0.3801295, -0.435912, 0.6999926, 1, 1, 1, 1, 1,
0.3817075, -0.04484423, 1.580881, 1, 1, 1, 1, 1,
0.3823607, -0.8455436, 3.514921, 1, 1, 1, 1, 1,
0.3874265, 1.332648, 1.757811, 0, 0, 1, 1, 1,
0.3906026, 2.509398, -0.3131456, 1, 0, 0, 1, 1,
0.393046, 0.8654115, 0.6390938, 1, 0, 0, 1, 1,
0.4015611, 0.7372705, 0.3211822, 1, 0, 0, 1, 1,
0.4085564, -0.9434004, 2.227488, 1, 0, 0, 1, 1,
0.4093692, -0.09457775, 2.142205, 1, 0, 0, 1, 1,
0.4131366, -0.1278588, 2.423151, 0, 0, 0, 1, 1,
0.4142801, 1.559349, 1.787013, 0, 0, 0, 1, 1,
0.415222, -0.5159445, 1.823878, 0, 0, 0, 1, 1,
0.4209543, -0.7652926, 2.273221, 0, 0, 0, 1, 1,
0.4231694, -1.871599, 3.010865, 0, 0, 0, 1, 1,
0.4244606, -1.944686, 4.539343, 0, 0, 0, 1, 1,
0.4281449, -0.727539, 2.817058, 0, 0, 0, 1, 1,
0.4357336, 0.07761214, 1.503283, 1, 1, 1, 1, 1,
0.4357902, -1.089824, 2.72065, 1, 1, 1, 1, 1,
0.4369697, 0.8712786, -0.4923503, 1, 1, 1, 1, 1,
0.4403171, 3.190475, 2.288301, 1, 1, 1, 1, 1,
0.4409659, 0.3683829, -0.04056966, 1, 1, 1, 1, 1,
0.4441416, -0.7095648, 3.30599, 1, 1, 1, 1, 1,
0.444797, -1.238882, 2.976221, 1, 1, 1, 1, 1,
0.4448703, -0.1495672, 2.227277, 1, 1, 1, 1, 1,
0.4467795, -0.4764686, 1.603786, 1, 1, 1, 1, 1,
0.4518758, -0.3960868, 3.18205, 1, 1, 1, 1, 1,
0.4562193, -0.7018916, 3.000444, 1, 1, 1, 1, 1,
0.4596973, -0.1694542, 1.620099, 1, 1, 1, 1, 1,
0.4599029, -0.3987826, 2.676588, 1, 1, 1, 1, 1,
0.4607747, -1.241198, 0.3971451, 1, 1, 1, 1, 1,
0.4641293, -0.6698897, 3.414177, 1, 1, 1, 1, 1,
0.4649413, -2.232353, 1.949438, 0, 0, 1, 1, 1,
0.4706439, 0.4096694, 0.7305422, 1, 0, 0, 1, 1,
0.4744982, 0.2256465, 1.328162, 1, 0, 0, 1, 1,
0.4745262, 0.1866507, 1.887691, 1, 0, 0, 1, 1,
0.4745898, 0.2557844, 1.79027, 1, 0, 0, 1, 1,
0.4819883, 0.3286541, 0.1616054, 1, 0, 0, 1, 1,
0.4860838, 0.8380803, 0.2989273, 0, 0, 0, 1, 1,
0.4918994, 0.2458148, 1.197502, 0, 0, 0, 1, 1,
0.4925028, -0.2772541, 0.7716079, 0, 0, 0, 1, 1,
0.4957122, 0.01565146, 1.484707, 0, 0, 0, 1, 1,
0.5008345, -0.7413909, 0.9078946, 0, 0, 0, 1, 1,
0.5028697, -1.100459, 2.795906, 0, 0, 0, 1, 1,
0.5040767, 1.231912, 1.125252, 0, 0, 0, 1, 1,
0.5057002, -0.1233648, 2.966694, 1, 1, 1, 1, 1,
0.5058759, -0.6226462, 1.425764, 1, 1, 1, 1, 1,
0.5073345, -0.3436653, 2.516867, 1, 1, 1, 1, 1,
0.5100783, 0.08362951, 1.726022, 1, 1, 1, 1, 1,
0.5120288, -1.064784, 2.11679, 1, 1, 1, 1, 1,
0.5136664, -0.2590337, 1.221256, 1, 1, 1, 1, 1,
0.5143078, -0.09767649, 0.5704513, 1, 1, 1, 1, 1,
0.5149156, 1.292113, 0.97163, 1, 1, 1, 1, 1,
0.5201373, 0.2814514, -0.06772891, 1, 1, 1, 1, 1,
0.5204825, -0.3010183, 2.608257, 1, 1, 1, 1, 1,
0.5238279, -0.2529486, 0.3932772, 1, 1, 1, 1, 1,
0.5256416, -0.09790283, 0.9154174, 1, 1, 1, 1, 1,
0.5323172, 0.5836716, 1.232655, 1, 1, 1, 1, 1,
0.5346841, -1.188348, 3.666792, 1, 1, 1, 1, 1,
0.5364063, -0.1858176, 2.41445, 1, 1, 1, 1, 1,
0.5413143, 0.2575208, 1.489502, 0, 0, 1, 1, 1,
0.5413832, -0.2090287, 3.05419, 1, 0, 0, 1, 1,
0.5423926, -0.8622288, 3.784526, 1, 0, 0, 1, 1,
0.5426838, 0.6681606, 0.9029781, 1, 0, 0, 1, 1,
0.5450137, -0.2755268, 0.69553, 1, 0, 0, 1, 1,
0.5480127, -1.07015, 1.997689, 1, 0, 0, 1, 1,
0.5504215, -0.06602534, 1.056613, 0, 0, 0, 1, 1,
0.552027, -0.9889969, 2.721193, 0, 0, 0, 1, 1,
0.5543421, -1.35671, 2.33254, 0, 0, 0, 1, 1,
0.556646, 0.5217389, 0.8698081, 0, 0, 0, 1, 1,
0.559138, 0.1731421, 0.4692738, 0, 0, 0, 1, 1,
0.5622129, 2.734417, 0.9824048, 0, 0, 0, 1, 1,
0.5629247, 0.5601115, 0.1547781, 0, 0, 0, 1, 1,
0.5684687, -0.01657581, 0.8169762, 1, 1, 1, 1, 1,
0.5718352, 0.469934, 1.87553, 1, 1, 1, 1, 1,
0.5754982, 1.673548, 0.9518047, 1, 1, 1, 1, 1,
0.5771953, -0.2778665, 2.538471, 1, 1, 1, 1, 1,
0.5799571, -1.728233, 3.718839, 1, 1, 1, 1, 1,
0.5907713, -0.1278316, 2.729232, 1, 1, 1, 1, 1,
0.5925452, -1.789936, 4.719358, 1, 1, 1, 1, 1,
0.5947259, -0.611223, 3.259683, 1, 1, 1, 1, 1,
0.5949872, -1.721529, 2.02436, 1, 1, 1, 1, 1,
0.5955367, 1.427146, 0.3850665, 1, 1, 1, 1, 1,
0.5987665, 0.1069293, 0.1716479, 1, 1, 1, 1, 1,
0.6008025, 0.2796804, 0.7353302, 1, 1, 1, 1, 1,
0.6069347, -2.246733, 3.569906, 1, 1, 1, 1, 1,
0.6079407, -0.7986851, 2.673432, 1, 1, 1, 1, 1,
0.6115818, -0.6379246, 3.802873, 1, 1, 1, 1, 1,
0.6191613, 0.3017139, 2.729306, 0, 0, 1, 1, 1,
0.6307204, -0.8830413, 2.503934, 1, 0, 0, 1, 1,
0.6342124, -0.7645018, 2.097786, 1, 0, 0, 1, 1,
0.6342637, -0.6699384, 2.751804, 1, 0, 0, 1, 1,
0.6371421, -1.643868, 3.724045, 1, 0, 0, 1, 1,
0.6396074, -0.3162438, 0.7882158, 1, 0, 0, 1, 1,
0.6417002, 1.120774, 2.542301, 0, 0, 0, 1, 1,
0.6429301, 1.451607, 2.068883, 0, 0, 0, 1, 1,
0.6447982, 0.1044708, 0.2687201, 0, 0, 0, 1, 1,
0.647789, -0.2754606, 1.119741, 0, 0, 0, 1, 1,
0.6489109, -0.1742513, 2.023274, 0, 0, 0, 1, 1,
0.6490471, 1.691147, -1.34674, 0, 0, 0, 1, 1,
0.6552906, -0.3587926, 1.475649, 0, 0, 0, 1, 1,
0.6560773, -1.426254, 1.843671, 1, 1, 1, 1, 1,
0.6562889, 0.5995478, 1.312208, 1, 1, 1, 1, 1,
0.657386, -1.00314, 2.598679, 1, 1, 1, 1, 1,
0.6599507, 0.993575, 1.314745, 1, 1, 1, 1, 1,
0.6624782, -1.761493, 3.47854, 1, 1, 1, 1, 1,
0.6624933, 1.025297, 1.332459, 1, 1, 1, 1, 1,
0.6664606, -0.6719114, 4.197613, 1, 1, 1, 1, 1,
0.6679808, -2.109061, 2.712667, 1, 1, 1, 1, 1,
0.6708727, -0.6054717, 0.1312676, 1, 1, 1, 1, 1,
0.6715459, 0.3238434, 1.542721, 1, 1, 1, 1, 1,
0.6761133, -2.020577, 3.030633, 1, 1, 1, 1, 1,
0.6828409, -0.4379312, 1.944826, 1, 1, 1, 1, 1,
0.6871032, -0.6198417, 2.19995, 1, 1, 1, 1, 1,
0.6880449, 0.4145109, 1.509908, 1, 1, 1, 1, 1,
0.6901268, 0.10982, 0.733797, 1, 1, 1, 1, 1,
0.6917532, 0.7168466, 1.70865, 0, 0, 1, 1, 1,
0.6933976, -1.067673, 1.397827, 1, 0, 0, 1, 1,
0.6952859, -0.8200899, 2.849332, 1, 0, 0, 1, 1,
0.6966628, -1.157421, 0.9931749, 1, 0, 0, 1, 1,
0.6975874, -0.7693303, 0.9639909, 1, 0, 0, 1, 1,
0.6993597, -1.276484, 3.476568, 1, 0, 0, 1, 1,
0.7042258, -1.016683, 3.334248, 0, 0, 0, 1, 1,
0.7046015, -1.062852, 2.737452, 0, 0, 0, 1, 1,
0.7064135, -0.5314626, 1.340916, 0, 0, 0, 1, 1,
0.7166709, 1.808296, -0.3201366, 0, 0, 0, 1, 1,
0.7200324, -0.4320005, 3.581601, 0, 0, 0, 1, 1,
0.7231654, -1.313678, 2.785277, 0, 0, 0, 1, 1,
0.7276844, -0.6169761, 4.59608, 0, 0, 0, 1, 1,
0.7279573, -0.02509382, 0.7417669, 1, 1, 1, 1, 1,
0.7345865, 1.65756, 0.2430414, 1, 1, 1, 1, 1,
0.737635, -0.402952, 0.8120824, 1, 1, 1, 1, 1,
0.7395989, -0.1605348, 1.367332, 1, 1, 1, 1, 1,
0.7428739, 0.3448488, 0.6132507, 1, 1, 1, 1, 1,
0.7446239, 0.6011887, 2.512265, 1, 1, 1, 1, 1,
0.7447997, 0.7012682, 2.554569, 1, 1, 1, 1, 1,
0.753537, 0.4998319, 1.102805, 1, 1, 1, 1, 1,
0.7547736, -0.1967904, 3.369531, 1, 1, 1, 1, 1,
0.7575751, -0.8224967, 3.713454, 1, 1, 1, 1, 1,
0.7577894, -2.651864, 4.048563, 1, 1, 1, 1, 1,
0.7630244, -1.470926, 2.393511, 1, 1, 1, 1, 1,
0.7667085, 1.039128, -0.8288255, 1, 1, 1, 1, 1,
0.7722839, 1.189158, -0.7359242, 1, 1, 1, 1, 1,
0.7794555, 1.093041, -0.04101871, 1, 1, 1, 1, 1,
0.7949823, 1.071048, 0.5745907, 0, 0, 1, 1, 1,
0.795849, -0.1854555, 2.06395, 1, 0, 0, 1, 1,
0.7967584, -1.026479, 2.162686, 1, 0, 0, 1, 1,
0.7978526, -0.3792706, 2.809069, 1, 0, 0, 1, 1,
0.7993993, -1.459806, 2.955706, 1, 0, 0, 1, 1,
0.8006648, -1.453686, 1.379395, 1, 0, 0, 1, 1,
0.8074259, -1.435889, 2.709088, 0, 0, 0, 1, 1,
0.8195575, 0.3990992, -0.6926617, 0, 0, 0, 1, 1,
0.8344738, -1.686084, 3.613177, 0, 0, 0, 1, 1,
0.8411688, -0.1528445, 1.166424, 0, 0, 0, 1, 1,
0.841391, -0.4982105, 2.941896, 0, 0, 0, 1, 1,
0.84212, 0.1890397, 3.175616, 0, 0, 0, 1, 1,
0.8434875, 0.5278956, 2.164773, 0, 0, 0, 1, 1,
0.8562364, -0.4968775, 1.052323, 1, 1, 1, 1, 1,
0.8598832, 0.3319055, 1.123781, 1, 1, 1, 1, 1,
0.8682916, 1.08789, 0.7897401, 1, 1, 1, 1, 1,
0.8696402, 0.530734, 1.776829, 1, 1, 1, 1, 1,
0.8733363, 0.6224219, 0.5229013, 1, 1, 1, 1, 1,
0.8798055, -0.9111736, 1.644101, 1, 1, 1, 1, 1,
0.8857808, -0.2604383, 3.696347, 1, 1, 1, 1, 1,
0.8866547, 0.4199728, 1.083993, 1, 1, 1, 1, 1,
0.8893039, -1.438379, 2.255401, 1, 1, 1, 1, 1,
0.8907034, 1.67206, 0.5575724, 1, 1, 1, 1, 1,
0.8907535, 1.66947, -0.1381016, 1, 1, 1, 1, 1,
0.8925096, 0.3693048, 1.103131, 1, 1, 1, 1, 1,
0.8949712, 1.18231, -0.4308741, 1, 1, 1, 1, 1,
0.8963298, -2.278118, 1.893094, 1, 1, 1, 1, 1,
0.8984627, 0.1878707, 0.4947166, 1, 1, 1, 1, 1,
0.9024974, -0.2667533, 2.481692, 0, 0, 1, 1, 1,
0.9044558, -0.4334635, 2.459558, 1, 0, 0, 1, 1,
0.9092126, -0.2213375, 0.6379541, 1, 0, 0, 1, 1,
0.911366, -1.409845, 4.252788, 1, 0, 0, 1, 1,
0.9136469, 0.779159, 0.7924342, 1, 0, 0, 1, 1,
0.9137963, -0.3706484, 1.936131, 1, 0, 0, 1, 1,
0.9211251, -0.1347845, 2.520926, 0, 0, 0, 1, 1,
0.9263665, -0.2418325, 1.082035, 0, 0, 0, 1, 1,
0.9276707, -1.143356, 1.918529, 0, 0, 0, 1, 1,
0.9345613, -0.2763378, 2.621636, 0, 0, 0, 1, 1,
0.9352952, 0.2057578, 2.935756, 0, 0, 0, 1, 1,
0.9416809, 2.557556, 2.223278, 0, 0, 0, 1, 1,
0.9428012, 0.3731079, 2.367823, 0, 0, 0, 1, 1,
0.95124, -0.6381664, 1.899315, 1, 1, 1, 1, 1,
0.9513073, -0.4783648, 0.6870205, 1, 1, 1, 1, 1,
0.9659314, -0.3700082, 3.543854, 1, 1, 1, 1, 1,
0.9672283, -0.1283317, 1.191615, 1, 1, 1, 1, 1,
0.9722546, -0.4739007, 3.964366, 1, 1, 1, 1, 1,
0.9735561, 0.8770552, 0.7987627, 1, 1, 1, 1, 1,
0.9796479, 0.8605835, 0.8895652, 1, 1, 1, 1, 1,
0.989268, -0.2527647, 1.024885, 1, 1, 1, 1, 1,
0.9896373, -0.2423106, 1.114547, 1, 1, 1, 1, 1,
0.999905, -1.335678, 1.892443, 1, 1, 1, 1, 1,
1.001024, -1.109116, 2.186463, 1, 1, 1, 1, 1,
1.001083, 1.246646, 0.2513529, 1, 1, 1, 1, 1,
1.00747, -0.1340394, 1.828516, 1, 1, 1, 1, 1,
1.012905, 1.413567, 2.870022, 1, 1, 1, 1, 1,
1.013369, 0.660284, 1.139123, 1, 1, 1, 1, 1,
1.015208, -0.4402134, 2.295423, 0, 0, 1, 1, 1,
1.016537, 1.104057, -0.9196328, 1, 0, 0, 1, 1,
1.02237, 0.405805, 1.690639, 1, 0, 0, 1, 1,
1.023449, -0.03623727, 1.674923, 1, 0, 0, 1, 1,
1.027432, 0.9668379, 0.6574336, 1, 0, 0, 1, 1,
1.029591, 0.9316223, 1.715814, 1, 0, 0, 1, 1,
1.030478, -0.2063835, 1.910391, 0, 0, 0, 1, 1,
1.030738, 0.7087833, 1.557879, 0, 0, 0, 1, 1,
1.044638, 1.964628, 1.90577, 0, 0, 0, 1, 1,
1.04965, 0.4863489, 1.569439, 0, 0, 0, 1, 1,
1.055006, 0.7376673, -0.548049, 0, 0, 0, 1, 1,
1.060388, -0.8681962, 3.092557, 0, 0, 0, 1, 1,
1.067584, 0.5264549, 2.673791, 0, 0, 0, 1, 1,
1.071094, 0.7215385, 0.2305173, 1, 1, 1, 1, 1,
1.077451, -1.050049, 2.846723, 1, 1, 1, 1, 1,
1.084933, -0.6909818, 0.8269631, 1, 1, 1, 1, 1,
1.090848, -0.4686664, 1.241169, 1, 1, 1, 1, 1,
1.094263, -1.249483, 1.900232, 1, 1, 1, 1, 1,
1.094726, -2.3399, 3.290253, 1, 1, 1, 1, 1,
1.09639, 0.4684734, 1.130381, 1, 1, 1, 1, 1,
1.097381, -0.09743652, 2.129358, 1, 1, 1, 1, 1,
1.101145, 1.138388, 1.261319, 1, 1, 1, 1, 1,
1.102074, 1.45841, -1.094015, 1, 1, 1, 1, 1,
1.10248, -1.142967, 3.122535, 1, 1, 1, 1, 1,
1.115298, -1.454357, 0.8713066, 1, 1, 1, 1, 1,
1.116675, -1.464395, 2.798957, 1, 1, 1, 1, 1,
1.123133, 0.7339057, 0.719828, 1, 1, 1, 1, 1,
1.12613, -1.051264, 2.543941, 1, 1, 1, 1, 1,
1.126669, 0.07593628, 2.649644, 0, 0, 1, 1, 1,
1.154783, 0.5224205, 0.8078226, 1, 0, 0, 1, 1,
1.159474, 1.886497, 0.05076906, 1, 0, 0, 1, 1,
1.162801, 0.5237362, 0.6626143, 1, 0, 0, 1, 1,
1.164528, 1.403196, 1.606279, 1, 0, 0, 1, 1,
1.165526, -0.1212771, 0.7647408, 1, 0, 0, 1, 1,
1.172232, 1.619845, 0.4256444, 0, 0, 0, 1, 1,
1.172836, -1.571789, 3.109978, 0, 0, 0, 1, 1,
1.187809, -0.3463229, 0.4041711, 0, 0, 0, 1, 1,
1.195381, -0.4717211, 0.3488868, 0, 0, 0, 1, 1,
1.20338, 1.55786, -0.3492782, 0, 0, 0, 1, 1,
1.205269, -2.006345, 2.558249, 0, 0, 0, 1, 1,
1.213004, 0.1145955, 1.738254, 0, 0, 0, 1, 1,
1.21853, 0.914475, 0.007742934, 1, 1, 1, 1, 1,
1.222754, -2.024588, 2.552757, 1, 1, 1, 1, 1,
1.226222, 1.045753, 1.195709, 1, 1, 1, 1, 1,
1.228247, 1.134056, 0.3064001, 1, 1, 1, 1, 1,
1.251961, 1.087292, 0.7235317, 1, 1, 1, 1, 1,
1.25478, -0.8441513, 3.190686, 1, 1, 1, 1, 1,
1.255556, -0.00742426, 0.887099, 1, 1, 1, 1, 1,
1.257226, -0.507668, 2.422646, 1, 1, 1, 1, 1,
1.259203, -0.1299859, 2.784032, 1, 1, 1, 1, 1,
1.262477, 0.3045573, 0.894573, 1, 1, 1, 1, 1,
1.280464, -0.4734859, 0.7474941, 1, 1, 1, 1, 1,
1.28305, -1.37671, 0.3055987, 1, 1, 1, 1, 1,
1.284952, 1.083335, 2.938745, 1, 1, 1, 1, 1,
1.288006, -1.506159, 0.8487008, 1, 1, 1, 1, 1,
1.298863, -1.480034, 1.945964, 1, 1, 1, 1, 1,
1.308812, -0.4416979, 1.661318, 0, 0, 1, 1, 1,
1.313148, 1.228655, 0.8795916, 1, 0, 0, 1, 1,
1.324337, -0.04487376, 2.59963, 1, 0, 0, 1, 1,
1.328491, -0.7741867, 2.385896, 1, 0, 0, 1, 1,
1.340049, 1.13691, 2.522146, 1, 0, 0, 1, 1,
1.34475, 0.8232729, 2.891339, 1, 0, 0, 1, 1,
1.345046, 0.5833812, 1.802574, 0, 0, 0, 1, 1,
1.345075, 1.320997, 1.966034, 0, 0, 0, 1, 1,
1.345078, -0.162361, 1.464594, 0, 0, 0, 1, 1,
1.350685, -0.5840079, 3.840692, 0, 0, 0, 1, 1,
1.372557, 0.05645532, 0.2662117, 0, 0, 0, 1, 1,
1.376884, 1.478521, 1.212005, 0, 0, 0, 1, 1,
1.380273, -0.3884944, 2.828038, 0, 0, 0, 1, 1,
1.382043, 0.137869, 1.868025, 1, 1, 1, 1, 1,
1.384298, -0.571849, 1.518442, 1, 1, 1, 1, 1,
1.385694, 0.3327395, 1.83234, 1, 1, 1, 1, 1,
1.390654, -0.8335182, 2.053808, 1, 1, 1, 1, 1,
1.395547, -0.1680817, 3.47694, 1, 1, 1, 1, 1,
1.398777, -0.9537055, 0.8661137, 1, 1, 1, 1, 1,
1.401831, 1.175551, 0.7468311, 1, 1, 1, 1, 1,
1.403424, 1.060693, 0.5497317, 1, 1, 1, 1, 1,
1.414336, 1.377855, 1.101359, 1, 1, 1, 1, 1,
1.418375, -0.05675663, 2.33196, 1, 1, 1, 1, 1,
1.425102, 0.1049067, 1.971871, 1, 1, 1, 1, 1,
1.428114, 2.214664, 0.9131434, 1, 1, 1, 1, 1,
1.439157, 0.2844073, 0.8868732, 1, 1, 1, 1, 1,
1.452836, -0.8818715, 2.256995, 1, 1, 1, 1, 1,
1.453093, -0.3153697, 3.118178, 1, 1, 1, 1, 1,
1.458012, 1.229341, -0.2291262, 0, 0, 1, 1, 1,
1.460599, 0.6276865, -0.3602634, 1, 0, 0, 1, 1,
1.461707, 0.1821357, 2.512342, 1, 0, 0, 1, 1,
1.465997, -1.102893, 3.482188, 1, 0, 0, 1, 1,
1.471707, 2.905543, -0.6733233, 1, 0, 0, 1, 1,
1.481779, 0.2206855, 1.231843, 1, 0, 0, 1, 1,
1.487192, -1.140312, 3.008813, 0, 0, 0, 1, 1,
1.504837, 1.924269, 0.9510378, 0, 0, 0, 1, 1,
1.507762, -0.8614889, 3.454123, 0, 0, 0, 1, 1,
1.516133, 0.788201, -0.06585482, 0, 0, 0, 1, 1,
1.53437, 0.6406401, 0.8367874, 0, 0, 0, 1, 1,
1.542308, -0.39498, 1.592746, 0, 0, 0, 1, 1,
1.577577, -0.9098331, 2.150892, 0, 0, 0, 1, 1,
1.579474, 0.3808388, 1.459559, 1, 1, 1, 1, 1,
1.579966, 1.063663, -0.5748816, 1, 1, 1, 1, 1,
1.583828, -0.86877, 1.242171, 1, 1, 1, 1, 1,
1.607393, 0.04515913, 1.217205, 1, 1, 1, 1, 1,
1.610474, -0.6440954, 0.6374785, 1, 1, 1, 1, 1,
1.631243, 0.9202439, 2.389559, 1, 1, 1, 1, 1,
1.641616, -1.434277, 2.20327, 1, 1, 1, 1, 1,
1.642469, 0.213203, 1.219401, 1, 1, 1, 1, 1,
1.666948, -1.038601, 1.808636, 1, 1, 1, 1, 1,
1.667538, -0.9051844, 1.723012, 1, 1, 1, 1, 1,
1.676875, 1.460964, 2.492821, 1, 1, 1, 1, 1,
1.683264, -1.275571, 1.692674, 1, 1, 1, 1, 1,
1.685345, -1.03988, 1.37263, 1, 1, 1, 1, 1,
1.690971, 0.2837247, 2.026946, 1, 1, 1, 1, 1,
1.722138, 0.9190972, 2.459363, 1, 1, 1, 1, 1,
1.728468, -0.2643066, 0.008280762, 0, 0, 1, 1, 1,
1.729573, 0.3026655, 1.887497, 1, 0, 0, 1, 1,
1.736979, -0.3179275, 2.241135, 1, 0, 0, 1, 1,
1.74855, -0.1688541, 0.9172432, 1, 0, 0, 1, 1,
1.757608, -0.8917186, 1.549168, 1, 0, 0, 1, 1,
1.794328, -0.5989338, 2.793687, 1, 0, 0, 1, 1,
1.822547, -0.08900577, 1.827527, 0, 0, 0, 1, 1,
1.824603, -1.29238, 2.851202, 0, 0, 0, 1, 1,
1.855682, 1.645488, 2.381768, 0, 0, 0, 1, 1,
1.880548, -0.6541462, 1.007009, 0, 0, 0, 1, 1,
1.886785, 0.3600416, 3.712669, 0, 0, 0, 1, 1,
1.919627, 0.2902195, 0.2749458, 0, 0, 0, 1, 1,
1.956882, 0.2315619, 1.979988, 0, 0, 0, 1, 1,
1.958642, 0.9017524, 0.2101279, 1, 1, 1, 1, 1,
1.971401, 0.1850659, 0.596525, 1, 1, 1, 1, 1,
1.986452, 0.1395213, 0.06003397, 1, 1, 1, 1, 1,
1.992093, -0.8221369, 0.3286197, 1, 1, 1, 1, 1,
2.000208, 0.8706618, 1.883129, 1, 1, 1, 1, 1,
2.010688, -0.5642944, 2.810262, 1, 1, 1, 1, 1,
2.016347, 0.3008944, 1.313665, 1, 1, 1, 1, 1,
2.025664, 2.088154, 2.180943, 1, 1, 1, 1, 1,
2.032951, 1.897079, 1.089877, 1, 1, 1, 1, 1,
2.038115, 0.05959439, 2.327928, 1, 1, 1, 1, 1,
2.089845, 0.03358755, 1.945372, 1, 1, 1, 1, 1,
2.098325, 0.4044524, 2.417995, 1, 1, 1, 1, 1,
2.100964, -0.473649, 2.577751, 1, 1, 1, 1, 1,
2.158621, -1.263904, 1.691151, 1, 1, 1, 1, 1,
2.175359, 0.7132292, 1.406148, 1, 1, 1, 1, 1,
2.188726, 0.5353175, 1.586438, 0, 0, 1, 1, 1,
2.195768, 0.7527426, 0.9796851, 1, 0, 0, 1, 1,
2.208305, -0.794407, 2.403133, 1, 0, 0, 1, 1,
2.254396, -0.799691, 2.754696, 1, 0, 0, 1, 1,
2.257, -0.009739105, 0.1978716, 1, 0, 0, 1, 1,
2.287518, -0.549871, 0.008186899, 1, 0, 0, 1, 1,
2.288195, -0.7029311, 1.183413, 0, 0, 0, 1, 1,
2.296576, -0.2643243, 1.913299, 0, 0, 0, 1, 1,
2.304132, 0.787087, 2.846573, 0, 0, 0, 1, 1,
2.313045, 1.529506, -0.5759848, 0, 0, 0, 1, 1,
2.356786, 2.239454, 0.5020966, 0, 0, 0, 1, 1,
2.356889, -1.378301, 1.219812, 0, 0, 0, 1, 1,
2.357143, 0.6061041, 1.485724, 0, 0, 0, 1, 1,
2.358884, 0.7314245, 1.951686, 1, 1, 1, 1, 1,
2.370944, 0.4065677, 2.877112, 1, 1, 1, 1, 1,
2.447631, -1.630202, 2.176073, 1, 1, 1, 1, 1,
2.559172, 3.001015, 2.147465, 1, 1, 1, 1, 1,
2.665642, -1.431406, 3.161686, 1, 1, 1, 1, 1,
2.687607, -0.7210767, 1.263411, 1, 1, 1, 1, 1,
2.811629, 0.07364524, 1.976316, 1, 1, 1, 1, 1
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
var radius = 9.308896;
var distance = 32.6971;
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
mvMatrix.translate( 0.2546599, -0.04916859, 0.2436213 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.6971);
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
