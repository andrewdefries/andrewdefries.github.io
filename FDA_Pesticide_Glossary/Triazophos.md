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
-3.414684, -0.5452247, -1.65579, 1, 0, 0, 1,
-2.978965, 0.7595772, -3.123179, 1, 0.007843138, 0, 1,
-2.976005, 0.8227243, -1.060872, 1, 0.01176471, 0, 1,
-2.919921, 0.4043863, -0.8285179, 1, 0.01960784, 0, 1,
-2.866655, -1.029856, -2.800447, 1, 0.02352941, 0, 1,
-2.52117, 1.825516, -0.2968741, 1, 0.03137255, 0, 1,
-2.494015, 0.02972614, -2.494841, 1, 0.03529412, 0, 1,
-2.376592, 1.764481, -0.7382258, 1, 0.04313726, 0, 1,
-2.326314, 0.5025438, 0.636745, 1, 0.04705882, 0, 1,
-2.251281, 0.7893069, -2.797525, 1, 0.05490196, 0, 1,
-2.240492, 0.7867262, -2.402575, 1, 0.05882353, 0, 1,
-2.222316, 0.5753819, -1.410499, 1, 0.06666667, 0, 1,
-2.196533, 0.5613247, -2.258777, 1, 0.07058824, 0, 1,
-2.170523, -0.1781086, -0.5453804, 1, 0.07843138, 0, 1,
-2.165187, 0.1291956, -1.840009, 1, 0.08235294, 0, 1,
-2.098364, -0.3766657, -1.786111, 1, 0.09019608, 0, 1,
-2.067235, -1.440214, -2.392578, 1, 0.09411765, 0, 1,
-2.058707, -1.064291, -1.693552, 1, 0.1019608, 0, 1,
-2.016225, -0.2817727, -2.499154, 1, 0.1098039, 0, 1,
-1.947789, 0.2178638, -3.656634, 1, 0.1137255, 0, 1,
-1.945455, 0.3743222, -0.9429592, 1, 0.1215686, 0, 1,
-1.942356, -0.5496047, -1.339548, 1, 0.1254902, 0, 1,
-1.924845, 0.4712699, -1.460055, 1, 0.1333333, 0, 1,
-1.89127, 2.039007, -1.370968, 1, 0.1372549, 0, 1,
-1.878814, -0.346662, -0.647324, 1, 0.145098, 0, 1,
-1.87151, 1.052238, -0.8960059, 1, 0.1490196, 0, 1,
-1.851345, 0.7257251, -1.334026, 1, 0.1568628, 0, 1,
-1.850082, -0.2009038, -2.557725, 1, 0.1607843, 0, 1,
-1.828736, 0.1356603, -3.273318, 1, 0.1686275, 0, 1,
-1.782935, 0.3571387, -1.854612, 1, 0.172549, 0, 1,
-1.769535, -0.8909058, -2.025496, 1, 0.1803922, 0, 1,
-1.767935, 1.835865, -1.020523, 1, 0.1843137, 0, 1,
-1.762379, 0.1962299, -1.093359, 1, 0.1921569, 0, 1,
-1.749888, 1.912264, -0.4128873, 1, 0.1960784, 0, 1,
-1.74546, 0.7539617, -1.750934, 1, 0.2039216, 0, 1,
-1.736285, 1.109747, 0.09174236, 1, 0.2117647, 0, 1,
-1.73478, -0.6013236, -3.527843, 1, 0.2156863, 0, 1,
-1.712147, 0.5385235, -2.146293, 1, 0.2235294, 0, 1,
-1.708167, -0.07682823, -1.714459, 1, 0.227451, 0, 1,
-1.703467, 1.342365, -2.891602, 1, 0.2352941, 0, 1,
-1.696799, 0.3643305, -1.238417, 1, 0.2392157, 0, 1,
-1.667554, -0.05683818, -0.4998325, 1, 0.2470588, 0, 1,
-1.65924, 1.45207, -0.1992884, 1, 0.2509804, 0, 1,
-1.654568, 0.3028084, -1.468783, 1, 0.2588235, 0, 1,
-1.642382, -1.092931, -2.083781, 1, 0.2627451, 0, 1,
-1.640515, -0.09825222, 0.7593566, 1, 0.2705882, 0, 1,
-1.63916, 1.337591, -2.552312, 1, 0.2745098, 0, 1,
-1.637757, 0.9791601, -1.531481, 1, 0.282353, 0, 1,
-1.630753, 1.056958, -1.804004, 1, 0.2862745, 0, 1,
-1.613105, 1.674717, -0.3328905, 1, 0.2941177, 0, 1,
-1.608407, 1.412001, -0.8262576, 1, 0.3019608, 0, 1,
-1.607501, 0.7673506, -2.2157, 1, 0.3058824, 0, 1,
-1.607131, -0.7855887, -2.185891, 1, 0.3137255, 0, 1,
-1.601493, -0.1300312, -1.883799, 1, 0.3176471, 0, 1,
-1.600864, -1.538691, -3.085934, 1, 0.3254902, 0, 1,
-1.592534, 0.7109075, -2.799294, 1, 0.3294118, 0, 1,
-1.591062, 0.7603295, -2.756145, 1, 0.3372549, 0, 1,
-1.575276, -0.2374622, -3.211755, 1, 0.3411765, 0, 1,
-1.556405, -1.970337, -2.836754, 1, 0.3490196, 0, 1,
-1.553155, 1.012776, -0.4843162, 1, 0.3529412, 0, 1,
-1.550265, 0.3730209, -1.105109, 1, 0.3607843, 0, 1,
-1.5426, 1.312673, -0.7722403, 1, 0.3647059, 0, 1,
-1.541981, 1.376309, -1.713144, 1, 0.372549, 0, 1,
-1.526693, -0.2300367, -0.7409096, 1, 0.3764706, 0, 1,
-1.525486, 1.357535, -0.0563121, 1, 0.3843137, 0, 1,
-1.520149, 0.09574191, -1.130443, 1, 0.3882353, 0, 1,
-1.519633, 0.6290421, -2.067412, 1, 0.3960784, 0, 1,
-1.507386, 0.01644848, -2.371528, 1, 0.4039216, 0, 1,
-1.505616, -0.1152719, -1.559153, 1, 0.4078431, 0, 1,
-1.50455, 1.052405, -1.13641, 1, 0.4156863, 0, 1,
-1.50417, -1.200851, -2.751243, 1, 0.4196078, 0, 1,
-1.495603, -0.1689325, -1.823787, 1, 0.427451, 0, 1,
-1.487597, -0.6884143, -0.907254, 1, 0.4313726, 0, 1,
-1.480987, 0.2912341, -1.530681, 1, 0.4392157, 0, 1,
-1.467383, -0.5830222, -2.440552, 1, 0.4431373, 0, 1,
-1.454254, -0.2937147, -2.913071, 1, 0.4509804, 0, 1,
-1.448978, 2.255526, -1.094723, 1, 0.454902, 0, 1,
-1.428103, -0.7365501, -1.552878, 1, 0.4627451, 0, 1,
-1.426933, 0.3387079, -2.346463, 1, 0.4666667, 0, 1,
-1.383975, -1.483143, -2.534248, 1, 0.4745098, 0, 1,
-1.370934, -0.7190071, -0.4632768, 1, 0.4784314, 0, 1,
-1.363299, 1.712038, -1.663339, 1, 0.4862745, 0, 1,
-1.363099, -0.05635313, -1.737918, 1, 0.4901961, 0, 1,
-1.344284, 0.001774288, -0.5253903, 1, 0.4980392, 0, 1,
-1.326124, -0.1172649, -3.803871, 1, 0.5058824, 0, 1,
-1.309218, 0.6494945, -0.6298289, 1, 0.509804, 0, 1,
-1.308355, -0.110739, -1.037393, 1, 0.5176471, 0, 1,
-1.299252, -0.004479905, -2.529344, 1, 0.5215687, 0, 1,
-1.285573, 1.327478, -1.397732, 1, 0.5294118, 0, 1,
-1.282504, -0.4717254, -1.85098, 1, 0.5333334, 0, 1,
-1.282166, 1.026805, -1.051222, 1, 0.5411765, 0, 1,
-1.280772, -1.046355, -2.742032, 1, 0.5450981, 0, 1,
-1.27863, -0.5019719, -0.2127316, 1, 0.5529412, 0, 1,
-1.275285, -0.796565, -3.122204, 1, 0.5568628, 0, 1,
-1.267737, -1.232526, -2.075459, 1, 0.5647059, 0, 1,
-1.264566, -0.3476415, -3.889433, 1, 0.5686275, 0, 1,
-1.259983, -1.471703, -2.614306, 1, 0.5764706, 0, 1,
-1.254409, 0.3616703, 0.5694264, 1, 0.5803922, 0, 1,
-1.238501, 0.6559623, -1.273255, 1, 0.5882353, 0, 1,
-1.232174, 2.114467, 0.7123814, 1, 0.5921569, 0, 1,
-1.224584, -0.1259649, -0.4229741, 1, 0.6, 0, 1,
-1.213723, -0.697482, -3.222098, 1, 0.6078432, 0, 1,
-1.211012, -0.9012489, -1.2326, 1, 0.6117647, 0, 1,
-1.208372, 0.6067896, -0.4389922, 1, 0.6196079, 0, 1,
-1.208171, -0.8148326, -2.255881, 1, 0.6235294, 0, 1,
-1.203947, -1.337464, -1.382611, 1, 0.6313726, 0, 1,
-1.194988, 1.256497, -1.199901, 1, 0.6352941, 0, 1,
-1.154455, 0.8756595, -0.5165027, 1, 0.6431373, 0, 1,
-1.153672, -0.5335765, -1.61564, 1, 0.6470588, 0, 1,
-1.145887, 1.350149, -1.127747, 1, 0.654902, 0, 1,
-1.144011, 0.850733, -2.951891, 1, 0.6588235, 0, 1,
-1.143216, 1.160338, -1.233754, 1, 0.6666667, 0, 1,
-1.132592, -1.641021, -3.835237, 1, 0.6705883, 0, 1,
-1.131494, -1.601702, -3.594408, 1, 0.6784314, 0, 1,
-1.126713, 0.196606, -3.375698, 1, 0.682353, 0, 1,
-1.122435, -0.2874461, -1.416385, 1, 0.6901961, 0, 1,
-1.122348, 0.8801239, -0.6184045, 1, 0.6941177, 0, 1,
-1.121437, -0.6076965, -0.3071576, 1, 0.7019608, 0, 1,
-1.119298, -0.8592388, -0.8852856, 1, 0.7098039, 0, 1,
-1.118971, 0.5586876, -2.29916, 1, 0.7137255, 0, 1,
-1.118223, -1.466649, -3.110235, 1, 0.7215686, 0, 1,
-1.113358, -0.8117152, -1.832653, 1, 0.7254902, 0, 1,
-1.109394, 0.8363728, -2.072193, 1, 0.7333333, 0, 1,
-1.108945, -1.500987, -2.954244, 1, 0.7372549, 0, 1,
-1.091287, -0.1718205, -0.9916959, 1, 0.7450981, 0, 1,
-1.083477, -0.7901011, -0.2975627, 1, 0.7490196, 0, 1,
-1.073261, 0.6237847, -1.046128, 1, 0.7568628, 0, 1,
-1.072122, -0.9160432, -2.447975, 1, 0.7607843, 0, 1,
-1.069331, -0.1033995, -2.614227, 1, 0.7686275, 0, 1,
-1.056732, 0.0946511, -1.063344, 1, 0.772549, 0, 1,
-1.050483, -0.377422, -2.048976, 1, 0.7803922, 0, 1,
-1.049701, 0.8192457, 0.2471688, 1, 0.7843137, 0, 1,
-1.045246, 0.9604908, -1.248866, 1, 0.7921569, 0, 1,
-1.04332, 0.01360522, -1.708868, 1, 0.7960784, 0, 1,
-1.039863, -0.1744253, -2.878815, 1, 0.8039216, 0, 1,
-1.031845, -0.8175619, -1.950363, 1, 0.8117647, 0, 1,
-1.028028, -1.259999, -0.647806, 1, 0.8156863, 0, 1,
-1.021721, 0.8081371, 0.141187, 1, 0.8235294, 0, 1,
-1.020842, 1.163068, -0.7290931, 1, 0.827451, 0, 1,
-1.017713, -0.3300005, -3.024059, 1, 0.8352941, 0, 1,
-1.012068, -1.243424, -4.391002, 1, 0.8392157, 0, 1,
-1.00952, 1.318469, 0.2865066, 1, 0.8470588, 0, 1,
-1.008325, 0.5919002, -1.134125, 1, 0.8509804, 0, 1,
-1.005617, -0.7610333, -2.898799, 1, 0.8588235, 0, 1,
-1.000256, -0.6420325, -1.158791, 1, 0.8627451, 0, 1,
-0.99824, 2.149353, -1.020303, 1, 0.8705882, 0, 1,
-0.9954969, 1.513065, -0.3511732, 1, 0.8745098, 0, 1,
-0.9950213, -0.07308355, -2.017375, 1, 0.8823529, 0, 1,
-0.9832549, -0.6534331, -0.9755235, 1, 0.8862745, 0, 1,
-0.9819845, 0.345526, -1.303184, 1, 0.8941177, 0, 1,
-0.9778954, 1.934024, -2.023965, 1, 0.8980392, 0, 1,
-0.9736686, -1.586217, -2.488105, 1, 0.9058824, 0, 1,
-0.9707935, 0.2677561, -0.01632713, 1, 0.9137255, 0, 1,
-0.9706542, -0.1036677, -1.725277, 1, 0.9176471, 0, 1,
-0.9679486, -0.9196481, -3.556951, 1, 0.9254902, 0, 1,
-0.9668464, 0.8429207, -0.08949563, 1, 0.9294118, 0, 1,
-0.9566245, 0.6637722, 0.8798051, 1, 0.9372549, 0, 1,
-0.9525735, 0.8318542, -0.8301373, 1, 0.9411765, 0, 1,
-0.9493052, -1.250269, -2.598824, 1, 0.9490196, 0, 1,
-0.9387366, 0.6261716, -2.081768, 1, 0.9529412, 0, 1,
-0.9363465, -1.794884, -0.9433714, 1, 0.9607843, 0, 1,
-0.9346017, -0.6371958, -1.322999, 1, 0.9647059, 0, 1,
-0.9306682, -0.2841478, -0.5149974, 1, 0.972549, 0, 1,
-0.9256436, 0.7028904, -0.7443303, 1, 0.9764706, 0, 1,
-0.9229202, 0.171592, -2.089162, 1, 0.9843137, 0, 1,
-0.9221699, -0.6170418, -1.230211, 1, 0.9882353, 0, 1,
-0.915798, -0.4682583, -1.489522, 1, 0.9960784, 0, 1,
-0.9127524, 0.5741627, -1.873274, 0.9960784, 1, 0, 1,
-0.9042425, 0.2003634, -1.331067, 0.9921569, 1, 0, 1,
-0.901196, 0.2803663, -1.776936, 0.9843137, 1, 0, 1,
-0.8985993, -1.348151, -2.708179, 0.9803922, 1, 0, 1,
-0.8963786, 0.3807723, -0.90745, 0.972549, 1, 0, 1,
-0.8891377, -1.321291, -0.6908873, 0.9686275, 1, 0, 1,
-0.8877816, -1.230754, -3.876997, 0.9607843, 1, 0, 1,
-0.8839588, 0.07490455, -0.5115286, 0.9568627, 1, 0, 1,
-0.8675508, -0.5250373, -1.812485, 0.9490196, 1, 0, 1,
-0.8637577, -0.1563599, -2.729335, 0.945098, 1, 0, 1,
-0.8635156, -1.244478, -1.248461, 0.9372549, 1, 0, 1,
-0.8632059, 0.7485056, -0.7615737, 0.9333333, 1, 0, 1,
-0.8629059, 0.7232838, -2.196264, 0.9254902, 1, 0, 1,
-0.8596758, 1.592234, -0.592774, 0.9215686, 1, 0, 1,
-0.8491526, 2.289247, -0.6508375, 0.9137255, 1, 0, 1,
-0.8488231, 0.2924969, -1.878691, 0.9098039, 1, 0, 1,
-0.845472, -0.6109124, -1.174434, 0.9019608, 1, 0, 1,
-0.8452495, 0.3495055, -1.081858, 0.8941177, 1, 0, 1,
-0.8443135, 0.2685133, -1.504998, 0.8901961, 1, 0, 1,
-0.8436764, -1.409755, -2.379783, 0.8823529, 1, 0, 1,
-0.8419685, 0.9326822, -0.9230675, 0.8784314, 1, 0, 1,
-0.8380492, 0.4269523, -2.310532, 0.8705882, 1, 0, 1,
-0.8341447, -0.1476767, -1.960971, 0.8666667, 1, 0, 1,
-0.8299991, 0.7481238, -1.190857, 0.8588235, 1, 0, 1,
-0.8213466, -0.4422681, -0.5962481, 0.854902, 1, 0, 1,
-0.8177994, 0.9427593, -1.10731, 0.8470588, 1, 0, 1,
-0.8159337, 0.7014699, -1.189588, 0.8431373, 1, 0, 1,
-0.8131639, -2.167793, -3.685935, 0.8352941, 1, 0, 1,
-0.8062449, 0.3277537, 0.2577725, 0.8313726, 1, 0, 1,
-0.8051218, -1.405609, -2.652715, 0.8235294, 1, 0, 1,
-0.7959774, 0.8103102, -2.574246, 0.8196079, 1, 0, 1,
-0.7897572, -0.6229962, -2.620458, 0.8117647, 1, 0, 1,
-0.7886717, -1.497663, -1.379509, 0.8078431, 1, 0, 1,
-0.787484, -2.234797, -3.756268, 0.8, 1, 0, 1,
-0.7869214, -1.598289, -3.772032, 0.7921569, 1, 0, 1,
-0.7847803, -1.746036, -1.162744, 0.7882353, 1, 0, 1,
-0.7843261, -1.642495, -2.286589, 0.7803922, 1, 0, 1,
-0.7836069, 1.186592, -1.316763, 0.7764706, 1, 0, 1,
-0.7827252, 1.098473, 0.2943774, 0.7686275, 1, 0, 1,
-0.780702, 0.02180322, -0.8450484, 0.7647059, 1, 0, 1,
-0.7782749, 0.2868839, -0.9028738, 0.7568628, 1, 0, 1,
-0.7778012, 0.380927, -1.889198, 0.7529412, 1, 0, 1,
-0.7733614, 0.01434913, -0.140107, 0.7450981, 1, 0, 1,
-0.7698876, 0.174412, -1.705897, 0.7411765, 1, 0, 1,
-0.7695255, 1.187588, 0.1777226, 0.7333333, 1, 0, 1,
-0.7687977, 0.927437, -0.3761729, 0.7294118, 1, 0, 1,
-0.7668588, -1.532636, -2.266826, 0.7215686, 1, 0, 1,
-0.7638333, 2.006319, -2.77198, 0.7176471, 1, 0, 1,
-0.7634284, -0.6778862, -1.574051, 0.7098039, 1, 0, 1,
-0.7539194, -1.203093, -3.405835, 0.7058824, 1, 0, 1,
-0.7494559, -0.5012271, -0.5444091, 0.6980392, 1, 0, 1,
-0.74721, -0.2231651, -2.025555, 0.6901961, 1, 0, 1,
-0.7464159, 1.150434, 0.3420782, 0.6862745, 1, 0, 1,
-0.7381137, -0.4468408, -2.255245, 0.6784314, 1, 0, 1,
-0.7350475, -0.06276978, -1.296132, 0.6745098, 1, 0, 1,
-0.7347251, 0.1888755, -0.8181928, 0.6666667, 1, 0, 1,
-0.7335483, 1.714147, -0.5932757, 0.6627451, 1, 0, 1,
-0.7192519, -1.921216, -3.264143, 0.654902, 1, 0, 1,
-0.7189927, 0.3744984, -0.1080492, 0.6509804, 1, 0, 1,
-0.7184481, -0.7691439, -1.767062, 0.6431373, 1, 0, 1,
-0.7162674, -0.8686469, -2.912333, 0.6392157, 1, 0, 1,
-0.715596, -2.72801, -2.581887, 0.6313726, 1, 0, 1,
-0.7145734, 0.0552296, -0.1195943, 0.627451, 1, 0, 1,
-0.7109659, 0.2642994, -0.4590417, 0.6196079, 1, 0, 1,
-0.7077789, 0.4118593, -1.068697, 0.6156863, 1, 0, 1,
-0.7009515, -0.8612163, -1.928817, 0.6078432, 1, 0, 1,
-0.7004505, -0.258731, -2.119876, 0.6039216, 1, 0, 1,
-0.6989756, 1.744241, 0.1435118, 0.5960785, 1, 0, 1,
-0.6927566, -1.937678, -5.093711, 0.5882353, 1, 0, 1,
-0.6906963, 0.1544752, -1.935039, 0.5843138, 1, 0, 1,
-0.6903055, 0.0009850237, -0.6885363, 0.5764706, 1, 0, 1,
-0.6884443, -0.4033298, -4.109799, 0.572549, 1, 0, 1,
-0.6884321, 0.03996918, -3.012411, 0.5647059, 1, 0, 1,
-0.6879848, 0.6427503, 0.4131346, 0.5607843, 1, 0, 1,
-0.6847514, -1.819975, -1.22593, 0.5529412, 1, 0, 1,
-0.6833239, -1.792043, -2.664412, 0.5490196, 1, 0, 1,
-0.6820015, -0.1526073, -2.009618, 0.5411765, 1, 0, 1,
-0.6780044, 0.003367159, -0.3975394, 0.5372549, 1, 0, 1,
-0.6728384, -2.604903, -3.781223, 0.5294118, 1, 0, 1,
-0.6698527, -0.4641462, -2.599899, 0.5254902, 1, 0, 1,
-0.6696404, 0.7621989, -0.2025007, 0.5176471, 1, 0, 1,
-0.669314, 1.084571, 0.09448675, 0.5137255, 1, 0, 1,
-0.6563303, -1.267716, -2.445438, 0.5058824, 1, 0, 1,
-0.6554576, 0.5070494, -1.496004, 0.5019608, 1, 0, 1,
-0.6521948, -2.322809, -2.800038, 0.4941176, 1, 0, 1,
-0.6499925, -0.9124021, -3.865395, 0.4862745, 1, 0, 1,
-0.6469199, -0.9245553, -3.203511, 0.4823529, 1, 0, 1,
-0.6430058, -0.4164702, -2.2101, 0.4745098, 1, 0, 1,
-0.6421579, -0.6985718, -2.198458, 0.4705882, 1, 0, 1,
-0.6410989, -0.3135536, -3.483788, 0.4627451, 1, 0, 1,
-0.635245, 0.3533383, -0.07831682, 0.4588235, 1, 0, 1,
-0.6313809, -1.029435, -4.133894, 0.4509804, 1, 0, 1,
-0.629207, 0.4124236, -0.5811725, 0.4470588, 1, 0, 1,
-0.6278595, 1.640286, 0.2808895, 0.4392157, 1, 0, 1,
-0.623837, 1.298574, -0.3988606, 0.4352941, 1, 0, 1,
-0.622725, -1.873888, -2.829507, 0.427451, 1, 0, 1,
-0.6214076, 0.5919244, -1.320882, 0.4235294, 1, 0, 1,
-0.618295, -0.7208382, -2.679402, 0.4156863, 1, 0, 1,
-0.6117629, -0.0001109022, -3.890757, 0.4117647, 1, 0, 1,
-0.6090397, -1.104593, -3.025545, 0.4039216, 1, 0, 1,
-0.5930042, 0.5275819, 0.2721361, 0.3960784, 1, 0, 1,
-0.592818, -0.1156256, -0.4800585, 0.3921569, 1, 0, 1,
-0.5927839, 1.739012, -0.7857562, 0.3843137, 1, 0, 1,
-0.5917648, -1.317968, -3.384314, 0.3803922, 1, 0, 1,
-0.5910445, -0.7260433, -2.041564, 0.372549, 1, 0, 1,
-0.5910332, -0.7408498, -0.3186634, 0.3686275, 1, 0, 1,
-0.5907645, -0.8553517, -1.50349, 0.3607843, 1, 0, 1,
-0.5905212, 0.3954451, -0.2552677, 0.3568628, 1, 0, 1,
-0.5897403, 0.3536028, -0.7115427, 0.3490196, 1, 0, 1,
-0.5844582, -1.326407, -2.907118, 0.345098, 1, 0, 1,
-0.583721, 1.988948, -0.2781156, 0.3372549, 1, 0, 1,
-0.5813686, -0.9358831, -0.6518725, 0.3333333, 1, 0, 1,
-0.5779408, 0.6608522, 0.01081861, 0.3254902, 1, 0, 1,
-0.5750616, 0.4682249, -2.354999, 0.3215686, 1, 0, 1,
-0.5736176, -0.9520407, -0.5785345, 0.3137255, 1, 0, 1,
-0.5729048, -0.2023615, -1.555963, 0.3098039, 1, 0, 1,
-0.572492, -0.8940328, -5.221514, 0.3019608, 1, 0, 1,
-0.5656073, 0.002492187, -2.408134, 0.2941177, 1, 0, 1,
-0.5653943, -0.8183677, -1.485484, 0.2901961, 1, 0, 1,
-0.5615053, 0.4172674, -1.076687, 0.282353, 1, 0, 1,
-0.5598564, 1.061157, -1.671361, 0.2784314, 1, 0, 1,
-0.5521526, -0.05069597, -0.6391851, 0.2705882, 1, 0, 1,
-0.5478063, 1.253683, -0.1767384, 0.2666667, 1, 0, 1,
-0.5467996, -0.8531784, -2.889527, 0.2588235, 1, 0, 1,
-0.5441942, 1.274525, 0.02212206, 0.254902, 1, 0, 1,
-0.5380766, 0.1801677, -0.9429322, 0.2470588, 1, 0, 1,
-0.5374625, -1.478625, -3.385162, 0.2431373, 1, 0, 1,
-0.5310747, 1.165182, -0.5444847, 0.2352941, 1, 0, 1,
-0.5281228, 0.04460859, -0.5054964, 0.2313726, 1, 0, 1,
-0.526545, 0.5494487, -1.315704, 0.2235294, 1, 0, 1,
-0.5250517, 0.2501998, -1.215814, 0.2196078, 1, 0, 1,
-0.524138, -1.858694, -5.766303, 0.2117647, 1, 0, 1,
-0.5236473, -1.996555, -3.013098, 0.2078431, 1, 0, 1,
-0.5160815, -0.7909075, -1.457464, 0.2, 1, 0, 1,
-0.5130017, 0.02056819, -1.695398, 0.1921569, 1, 0, 1,
-0.5096284, 0.1179519, -1.922105, 0.1882353, 1, 0, 1,
-0.5085323, -0.0523151, -1.179782, 0.1803922, 1, 0, 1,
-0.5023362, -0.2490054, -1.295622, 0.1764706, 1, 0, 1,
-0.500043, 1.405824, -0.5896576, 0.1686275, 1, 0, 1,
-0.497787, 1.779198, 0.1944285, 0.1647059, 1, 0, 1,
-0.489522, -1.191472, -3.625481, 0.1568628, 1, 0, 1,
-0.4889055, -1.062259, -0.8878122, 0.1529412, 1, 0, 1,
-0.4774994, -0.8712527, -1.413769, 0.145098, 1, 0, 1,
-0.4746695, -1.795781, -1.487092, 0.1411765, 1, 0, 1,
-0.47449, 0.788532, -0.439735, 0.1333333, 1, 0, 1,
-0.4727319, 0.5115996, -0.8172218, 0.1294118, 1, 0, 1,
-0.4668089, 0.4807755, 0.3628673, 0.1215686, 1, 0, 1,
-0.4652147, 0.3488137, -0.8339465, 0.1176471, 1, 0, 1,
-0.4650228, 0.8438744, -1.535593, 0.1098039, 1, 0, 1,
-0.4632343, -0.4996153, -3.130406, 0.1058824, 1, 0, 1,
-0.4622467, 0.09280421, -0.6464911, 0.09803922, 1, 0, 1,
-0.4602556, 0.3735555, -0.9048941, 0.09019608, 1, 0, 1,
-0.453248, -0.4954548, -1.875651, 0.08627451, 1, 0, 1,
-0.4531072, 1.136438, -1.757602, 0.07843138, 1, 0, 1,
-0.4519659, 0.3101177, -1.276362, 0.07450981, 1, 0, 1,
-0.449559, -0.6156881, -4.754831, 0.06666667, 1, 0, 1,
-0.4460824, 0.5239838, -1.50254, 0.0627451, 1, 0, 1,
-0.4420516, -0.04336601, -2.232247, 0.05490196, 1, 0, 1,
-0.4402569, -2.604405, -3.133043, 0.05098039, 1, 0, 1,
-0.439739, -0.1338377, -1.724106, 0.04313726, 1, 0, 1,
-0.4354822, -0.7058804, -1.303308, 0.03921569, 1, 0, 1,
-0.4338294, -0.9565027, -2.91597, 0.03137255, 1, 0, 1,
-0.4335634, 0.4419763, -1.377643, 0.02745098, 1, 0, 1,
-0.4270152, 1.596586, 0.6031704, 0.01960784, 1, 0, 1,
-0.4264199, 0.946417, -0.3152412, 0.01568628, 1, 0, 1,
-0.4217466, 1.530368, -0.5165744, 0.007843138, 1, 0, 1,
-0.4214011, 0.7887722, -1.568443, 0.003921569, 1, 0, 1,
-0.418316, -0.01034268, -2.545958, 0, 1, 0.003921569, 1,
-0.4133388, 0.7515869, 0.4845951, 0, 1, 0.01176471, 1,
-0.4075947, -1.258812, -3.975268, 0, 1, 0.01568628, 1,
-0.402875, -0.8463352, -1.793802, 0, 1, 0.02352941, 1,
-0.4005024, -2.407268, -4.02743, 0, 1, 0.02745098, 1,
-0.3992797, 0.512075, -0.7510458, 0, 1, 0.03529412, 1,
-0.3975272, 0.4129265, 0.3170605, 0, 1, 0.03921569, 1,
-0.3961378, 0.4770696, -1.958594, 0, 1, 0.04705882, 1,
-0.395896, -1.573472, -2.941056, 0, 1, 0.05098039, 1,
-0.395108, 0.7491841, -1.733234, 0, 1, 0.05882353, 1,
-0.3947891, 1.002916, 1.164013, 0, 1, 0.0627451, 1,
-0.39478, -0.09725085, -0.6154836, 0, 1, 0.07058824, 1,
-0.3930825, -1.686434, -2.809716, 0, 1, 0.07450981, 1,
-0.3904543, -0.5417504, -0.5970463, 0, 1, 0.08235294, 1,
-0.3889735, 0.0428891, -1.609904, 0, 1, 0.08627451, 1,
-0.3871018, 0.3540505, -0.5407088, 0, 1, 0.09411765, 1,
-0.3869339, 0.5442015, -1.246643, 0, 1, 0.1019608, 1,
-0.3821058, -0.2361881, -1.879511, 0, 1, 0.1058824, 1,
-0.381629, 2.172046, -1.915777, 0, 1, 0.1137255, 1,
-0.3761329, -0.7771292, -2.732524, 0, 1, 0.1176471, 1,
-0.3706647, 0.485699, -0.4650096, 0, 1, 0.1254902, 1,
-0.3704293, -1.452252, -3.739094, 0, 1, 0.1294118, 1,
-0.3701434, 0.2677063, 1.154219, 0, 1, 0.1372549, 1,
-0.3678939, -0.09168442, -1.86457, 0, 1, 0.1411765, 1,
-0.3673583, -0.323551, -2.731885, 0, 1, 0.1490196, 1,
-0.3638704, 0.10194, -2.212628, 0, 1, 0.1529412, 1,
-0.3615503, -0.4545721, -1.090258, 0, 1, 0.1607843, 1,
-0.3609663, 1.441943, 0.7357153, 0, 1, 0.1647059, 1,
-0.359906, -1.178495, -2.702177, 0, 1, 0.172549, 1,
-0.357756, 0.5807757, 0.5718998, 0, 1, 0.1764706, 1,
-0.3565142, 2.297251, 0.4250742, 0, 1, 0.1843137, 1,
-0.3563313, 0.1692702, -1.14358, 0, 1, 0.1882353, 1,
-0.3557876, 1.281528, 0.4023843, 0, 1, 0.1960784, 1,
-0.3554879, 0.5018653, -1.465868, 0, 1, 0.2039216, 1,
-0.3525668, -0.3660073, -0.7812851, 0, 1, 0.2078431, 1,
-0.3524126, -1.561394, -2.395847, 0, 1, 0.2156863, 1,
-0.3512074, 1.71742, -0.2611459, 0, 1, 0.2196078, 1,
-0.3510425, -0.04657019, -1.390597, 0, 1, 0.227451, 1,
-0.3510309, -0.1984874, -2.380557, 0, 1, 0.2313726, 1,
-0.3494424, 0.220898, 0.05837305, 0, 1, 0.2392157, 1,
-0.3481486, -0.646397, -2.756532, 0, 1, 0.2431373, 1,
-0.3454387, 1.881157, -0.8812853, 0, 1, 0.2509804, 1,
-0.3449372, -1.283585, -2.973474, 0, 1, 0.254902, 1,
-0.3411708, -0.1448849, -0.9005177, 0, 1, 0.2627451, 1,
-0.3401919, 0.5148212, 0.1223476, 0, 1, 0.2666667, 1,
-0.3310102, 0.5842602, 0.6861633, 0, 1, 0.2745098, 1,
-0.3243503, -1.013849, -2.670288, 0, 1, 0.2784314, 1,
-0.3234011, -1.42215, -2.245528, 0, 1, 0.2862745, 1,
-0.3200383, 0.752055, -0.9347135, 0, 1, 0.2901961, 1,
-0.312702, 0.4251783, -2.20189, 0, 1, 0.2980392, 1,
-0.311566, -1.798622, -4.385817, 0, 1, 0.3058824, 1,
-0.3103249, 0.4841286, -0.03151152, 0, 1, 0.3098039, 1,
-0.3072867, 3.298287, -2.601035, 0, 1, 0.3176471, 1,
-0.3014155, 0.6113539, 1.499943, 0, 1, 0.3215686, 1,
-0.2989532, 0.9972871, 0.2177673, 0, 1, 0.3294118, 1,
-0.2976333, -2.129638, -2.69791, 0, 1, 0.3333333, 1,
-0.2941155, -1.45231, -2.465479, 0, 1, 0.3411765, 1,
-0.2936706, 1.579282, -0.04244635, 0, 1, 0.345098, 1,
-0.2913179, -0.7772357, -2.487898, 0, 1, 0.3529412, 1,
-0.289429, 0.2309269, -0.3530372, 0, 1, 0.3568628, 1,
-0.2865382, 0.05216071, -0.5782432, 0, 1, 0.3647059, 1,
-0.2855757, -0.1984776, -2.696108, 0, 1, 0.3686275, 1,
-0.2849089, -1.572595, -2.08538, 0, 1, 0.3764706, 1,
-0.2847088, -1.037712, -4.14202, 0, 1, 0.3803922, 1,
-0.2843257, 1.113135, 0.7081786, 0, 1, 0.3882353, 1,
-0.2822935, 0.8418227, -1.10354, 0, 1, 0.3921569, 1,
-0.2820702, -0.1136417, -2.02395, 0, 1, 0.4, 1,
-0.2812872, 1.127188, -0.2414517, 0, 1, 0.4078431, 1,
-0.2785419, -0.6383108, -2.507667, 0, 1, 0.4117647, 1,
-0.2745847, -0.7259938, -1.174195, 0, 1, 0.4196078, 1,
-0.2712888, -0.1057651, -2.014158, 0, 1, 0.4235294, 1,
-0.2703948, 2.378392, -0.09707092, 0, 1, 0.4313726, 1,
-0.2698829, -0.5192813, -2.276471, 0, 1, 0.4352941, 1,
-0.2665576, 0.7533419, 0.9406627, 0, 1, 0.4431373, 1,
-0.2653826, 0.7044654, -0.1189972, 0, 1, 0.4470588, 1,
-0.2650753, -1.013789, -1.915717, 0, 1, 0.454902, 1,
-0.2620419, -1.063199, -2.270988, 0, 1, 0.4588235, 1,
-0.2607709, -0.06493513, -1.296673, 0, 1, 0.4666667, 1,
-0.2593142, -0.2281798, -2.878979, 0, 1, 0.4705882, 1,
-0.2591809, 0.215552, -1.199286, 0, 1, 0.4784314, 1,
-0.2557105, -1.936821, -3.097531, 0, 1, 0.4823529, 1,
-0.2539279, -1.75589, -4.615336, 0, 1, 0.4901961, 1,
-0.2522714, 0.5510778, -0.3739876, 0, 1, 0.4941176, 1,
-0.2494392, 0.05225078, -1.822848, 0, 1, 0.5019608, 1,
-0.2491514, -0.3297049, -1.682754, 0, 1, 0.509804, 1,
-0.240125, -0.8954467, -2.166418, 0, 1, 0.5137255, 1,
-0.2387084, -1.669828, -0.9370416, 0, 1, 0.5215687, 1,
-0.2356156, -0.228703, -2.884689, 0, 1, 0.5254902, 1,
-0.2331603, 0.639003, -0.7813699, 0, 1, 0.5333334, 1,
-0.2324556, 1.230013, -0.7113757, 0, 1, 0.5372549, 1,
-0.2324346, 0.4675306, -0.03543038, 0, 1, 0.5450981, 1,
-0.2318399, 1.953816, -1.58522, 0, 1, 0.5490196, 1,
-0.23068, 0.3473621, -0.4902374, 0, 1, 0.5568628, 1,
-0.2279178, 0.1253558, -3.101829, 0, 1, 0.5607843, 1,
-0.2254574, -0.4590668, -2.577094, 0, 1, 0.5686275, 1,
-0.2180382, 1.460005, -0.7284839, 0, 1, 0.572549, 1,
-0.2154602, 0.9285747, -0.6963987, 0, 1, 0.5803922, 1,
-0.2133499, 0.1755681, -0.2142043, 0, 1, 0.5843138, 1,
-0.2131633, -0.3100866, -3.147998, 0, 1, 0.5921569, 1,
-0.2118231, -0.6201065, -0.8895219, 0, 1, 0.5960785, 1,
-0.2087524, 0.5862916, 1.042874, 0, 1, 0.6039216, 1,
-0.2085961, -2.03532, -2.109964, 0, 1, 0.6117647, 1,
-0.2079235, 1.777175, -0.2522431, 0, 1, 0.6156863, 1,
-0.206117, -0.6727893, -2.286949, 0, 1, 0.6235294, 1,
-0.2041866, 0.5336225, -0.8179817, 0, 1, 0.627451, 1,
-0.2023585, -0.7304206, -0.403928, 0, 1, 0.6352941, 1,
-0.1996231, -0.5235136, -2.335384, 0, 1, 0.6392157, 1,
-0.1988203, 0.649139, -0.4156195, 0, 1, 0.6470588, 1,
-0.1967263, -1.688802, -4.500277, 0, 1, 0.6509804, 1,
-0.1965497, 2.11354, 1.608124, 0, 1, 0.6588235, 1,
-0.1920601, 0.4018019, -0.514917, 0, 1, 0.6627451, 1,
-0.1886678, -1.616038, -4.254615, 0, 1, 0.6705883, 1,
-0.1884846, -0.6786733, -1.76402, 0, 1, 0.6745098, 1,
-0.1862164, 1.334118, 1.135795, 0, 1, 0.682353, 1,
-0.1841883, -0.117985, -1.536355, 0, 1, 0.6862745, 1,
-0.1807365, -0.02605987, -0.9309518, 0, 1, 0.6941177, 1,
-0.1791052, 0.1927653, -0.7434426, 0, 1, 0.7019608, 1,
-0.1781028, 1.604084, 1.014108, 0, 1, 0.7058824, 1,
-0.1780669, 1.280149, 0.9023524, 0, 1, 0.7137255, 1,
-0.1742721, -0.2718063, -2.449183, 0, 1, 0.7176471, 1,
-0.1674633, -1.257973, -4.789864, 0, 1, 0.7254902, 1,
-0.1654528, -0.2603059, -5.502146, 0, 1, 0.7294118, 1,
-0.1600093, -0.6044114, -2.398036, 0, 1, 0.7372549, 1,
-0.1587794, -1.533412, -3.297837, 0, 1, 0.7411765, 1,
-0.1586472, 0.562414, -0.1599578, 0, 1, 0.7490196, 1,
-0.1554086, 0.4325107, -0.852231, 0, 1, 0.7529412, 1,
-0.152725, -0.2477215, -1.525278, 0, 1, 0.7607843, 1,
-0.1522726, -0.6711193, -3.1548, 0, 1, 0.7647059, 1,
-0.1516603, -1.559388, -1.878848, 0, 1, 0.772549, 1,
-0.1480193, -0.358868, -3.57638, 0, 1, 0.7764706, 1,
-0.1474601, -1.09554, -4.805488, 0, 1, 0.7843137, 1,
-0.1471781, -0.6182946, -2.296983, 0, 1, 0.7882353, 1,
-0.1458616, -1.477948, -1.760739, 0, 1, 0.7960784, 1,
-0.1387103, -1.950735, -4.284897, 0, 1, 0.8039216, 1,
-0.1358843, 0.2620313, -0.6214749, 0, 1, 0.8078431, 1,
-0.1339099, -1.010378, -3.418608, 0, 1, 0.8156863, 1,
-0.1337817, 0.3639197, -0.2286547, 0, 1, 0.8196079, 1,
-0.1331857, 0.523655, -0.5013466, 0, 1, 0.827451, 1,
-0.1324084, 1.875235, -0.3284693, 0, 1, 0.8313726, 1,
-0.1303792, 0.2511618, 0.8342175, 0, 1, 0.8392157, 1,
-0.1299536, -1.495392, -2.332767, 0, 1, 0.8431373, 1,
-0.1296259, -0.664013, -4.714998, 0, 1, 0.8509804, 1,
-0.1281997, -0.7753571, -3.639516, 0, 1, 0.854902, 1,
-0.1246185, 1.041297, -0.9665985, 0, 1, 0.8627451, 1,
-0.1210341, -1.370109, -2.444751, 0, 1, 0.8666667, 1,
-0.1168246, 0.3758413, -1.52258, 0, 1, 0.8745098, 1,
-0.1161274, -0.766289, -3.074865, 0, 1, 0.8784314, 1,
-0.1159671, 0.656222, 0.4205905, 0, 1, 0.8862745, 1,
-0.1158412, 0.4637606, 0.06196075, 0, 1, 0.8901961, 1,
-0.1102358, -0.169639, -3.094541, 0, 1, 0.8980392, 1,
-0.106468, 0.5335686, -0.1443263, 0, 1, 0.9058824, 1,
-0.1044339, -0.4461804, -0.8369597, 0, 1, 0.9098039, 1,
-0.09203368, 2.714636, -0.9987502, 0, 1, 0.9176471, 1,
-0.08357087, 0.6571634, 1.031556, 0, 1, 0.9215686, 1,
-0.08029851, -0.1498142, -2.18051, 0, 1, 0.9294118, 1,
-0.07540372, 0.9844378, 0.7417128, 0, 1, 0.9333333, 1,
-0.07469145, 0.1970882, 2.148998, 0, 1, 0.9411765, 1,
-0.07410448, -0.4953829, -3.865654, 0, 1, 0.945098, 1,
-0.07175443, -0.3019567, -2.198579, 0, 1, 0.9529412, 1,
-0.07012448, -0.6855179, -2.809294, 0, 1, 0.9568627, 1,
-0.06994515, 0.1129832, -2.136149, 0, 1, 0.9647059, 1,
-0.06885506, -0.4064726, -2.597937, 0, 1, 0.9686275, 1,
-0.06393818, 1.245307, 1.440798, 0, 1, 0.9764706, 1,
-0.06349503, -1.014867, -3.11696, 0, 1, 0.9803922, 1,
-0.05925008, -0.8599457, -0.9064444, 0, 1, 0.9882353, 1,
-0.05839489, 0.6130012, -0.05734999, 0, 1, 0.9921569, 1,
-0.05801622, 1.269165, -2.126348, 0, 1, 1, 1,
-0.04092943, -1.170721, -2.188338, 0, 0.9921569, 1, 1,
-0.04015437, -1.297295, -3.217718, 0, 0.9882353, 1, 1,
-0.03840103, 1.442804, -0.325537, 0, 0.9803922, 1, 1,
-0.03808541, 0.4311429, -0.979367, 0, 0.9764706, 1, 1,
-0.03764012, -0.4174861, -1.265208, 0, 0.9686275, 1, 1,
-0.03689468, -0.07782912, -2.044156, 0, 0.9647059, 1, 1,
-0.03679171, 0.9727401, -1.080709, 0, 0.9568627, 1, 1,
-0.03531148, 0.192412, 0.4492473, 0, 0.9529412, 1, 1,
-0.03476236, 0.6287221, 0.3946613, 0, 0.945098, 1, 1,
-0.03007269, -0.3283345, -2.301118, 0, 0.9411765, 1, 1,
-0.02403202, 1.224235, 1.351328, 0, 0.9333333, 1, 1,
-0.02364634, 1.629772, -0.01734246, 0, 0.9294118, 1, 1,
-0.01636678, 0.3476573, 1.251949, 0, 0.9215686, 1, 1,
-0.0150422, 0.2812273, -0.0707036, 0, 0.9176471, 1, 1,
-0.009203533, -0.5841648, -3.761087, 0, 0.9098039, 1, 1,
-0.00402991, 2.744914, 0.1754497, 0, 0.9058824, 1, 1,
-0.003319862, 0.5860391, 1.085419, 0, 0.8980392, 1, 1,
-0.001393177, -0.8120208, -1.098477, 0, 0.8901961, 1, 1,
0.0006089545, 0.05973915, -0.998597, 0, 0.8862745, 1, 1,
0.0007699676, -0.4385301, 3.557296, 0, 0.8784314, 1, 1,
0.006140217, -0.1081923, 2.855239, 0, 0.8745098, 1, 1,
0.00967365, 0.3751673, 2.198571, 0, 0.8666667, 1, 1,
0.009831106, -0.4686629, 2.775326, 0, 0.8627451, 1, 1,
0.01105065, -0.8109102, 2.707247, 0, 0.854902, 1, 1,
0.01313538, 1.53914, -0.5977951, 0, 0.8509804, 1, 1,
0.02054647, 0.1358902, -0.9371942, 0, 0.8431373, 1, 1,
0.02094544, 1.123085, -0.0100707, 0, 0.8392157, 1, 1,
0.02103972, -0.06819732, 2.266871, 0, 0.8313726, 1, 1,
0.02249478, 0.2693598, 0.002064167, 0, 0.827451, 1, 1,
0.02405586, 0.035641, 0.1667903, 0, 0.8196079, 1, 1,
0.0291853, -0.3639297, 1.394963, 0, 0.8156863, 1, 1,
0.02929753, 0.6061392, 0.7226678, 0, 0.8078431, 1, 1,
0.03065117, 0.02979828, 0.6101135, 0, 0.8039216, 1, 1,
0.03430589, -0.5087238, 1.782846, 0, 0.7960784, 1, 1,
0.0374128, 1.202534, -0.007644375, 0, 0.7882353, 1, 1,
0.03949707, 0.4676605, 0.1110799, 0, 0.7843137, 1, 1,
0.03969524, -0.8277102, 4.977884, 0, 0.7764706, 1, 1,
0.03971298, 2.135461, 1.106297, 0, 0.772549, 1, 1,
0.043279, -1.277328, 2.777212, 0, 0.7647059, 1, 1,
0.05379022, -0.7329514, 4.333628, 0, 0.7607843, 1, 1,
0.06358555, -0.6376312, 3.306987, 0, 0.7529412, 1, 1,
0.07280343, 0.5666177, -0.692893, 0, 0.7490196, 1, 1,
0.0737354, 0.106785, -1.025547, 0, 0.7411765, 1, 1,
0.0789526, -1.247099, 4.930786, 0, 0.7372549, 1, 1,
0.07949241, -0.7056121, 4.218884, 0, 0.7294118, 1, 1,
0.08019254, 1.73163, 0.2360352, 0, 0.7254902, 1, 1,
0.08239228, 0.4314409, -0.5022734, 0, 0.7176471, 1, 1,
0.08317978, 0.01636387, 1.214501, 0, 0.7137255, 1, 1,
0.08348674, -0.9828055, 1.107543, 0, 0.7058824, 1, 1,
0.0842977, 0.4430026, 1.472681, 0, 0.6980392, 1, 1,
0.08529595, -1.78863, 2.395969, 0, 0.6941177, 1, 1,
0.08543162, -0.9667623, 3.196584, 0, 0.6862745, 1, 1,
0.08743881, 0.03110129, 1.231158, 0, 0.682353, 1, 1,
0.0880575, -0.4055296, 3.077821, 0, 0.6745098, 1, 1,
0.08985803, 0.3173264, -0.3293227, 0, 0.6705883, 1, 1,
0.09149653, 0.06408814, 0.8729883, 0, 0.6627451, 1, 1,
0.09424141, 0.6373881, 1.389547, 0, 0.6588235, 1, 1,
0.09585221, 0.5669919, 0.3004245, 0, 0.6509804, 1, 1,
0.09674861, 0.2649985, -1.304295, 0, 0.6470588, 1, 1,
0.09820408, 1.124555, 0.0009143264, 0, 0.6392157, 1, 1,
0.1011738, 0.37087, -0.7430926, 0, 0.6352941, 1, 1,
0.1088567, 0.007049448, 1.22605, 0, 0.627451, 1, 1,
0.1156408, 0.3169803, -1.07677, 0, 0.6235294, 1, 1,
0.1166145, 0.8067634, -0.2421549, 0, 0.6156863, 1, 1,
0.1186033, -1.503426, 3.788126, 0, 0.6117647, 1, 1,
0.1217089, -0.03510353, 1.803244, 0, 0.6039216, 1, 1,
0.1235555, 1.761437, -0.520182, 0, 0.5960785, 1, 1,
0.1300226, -0.6342588, 4.471581, 0, 0.5921569, 1, 1,
0.131463, 0.5223635, -2.181746, 0, 0.5843138, 1, 1,
0.1335383, 1.299081, -0.6352013, 0, 0.5803922, 1, 1,
0.1341902, 0.6738548, 0.7286224, 0, 0.572549, 1, 1,
0.1352531, 0.3208818, 0.4775768, 0, 0.5686275, 1, 1,
0.1372977, -0.693081, 2.002545, 0, 0.5607843, 1, 1,
0.1388995, -0.3896528, 4.117971, 0, 0.5568628, 1, 1,
0.1402603, 3.856363, -0.9949794, 0, 0.5490196, 1, 1,
0.1413083, 0.6092259, -1.140025, 0, 0.5450981, 1, 1,
0.1465767, -0.4098991, 3.330197, 0, 0.5372549, 1, 1,
0.1466205, 1.800403, 0.6977716, 0, 0.5333334, 1, 1,
0.1497507, 0.8645748, -2.349978, 0, 0.5254902, 1, 1,
0.1504281, 1.257863, -0.9414602, 0, 0.5215687, 1, 1,
0.1505138, -0.2759638, 2.666602, 0, 0.5137255, 1, 1,
0.1507408, 0.6175806, 0.3498374, 0, 0.509804, 1, 1,
0.1524979, 0.2452862, -0.2869305, 0, 0.5019608, 1, 1,
0.1552703, 0.5008844, -0.3560793, 0, 0.4941176, 1, 1,
0.1561854, 0.4336186, -1.15411, 0, 0.4901961, 1, 1,
0.1663243, -1.528307, 3.912591, 0, 0.4823529, 1, 1,
0.1664826, 1.324585, -2.111006, 0, 0.4784314, 1, 1,
0.1669447, 1.204101, 1.598404, 0, 0.4705882, 1, 1,
0.168135, -1.236572, 1.984808, 0, 0.4666667, 1, 1,
0.1745293, -0.342299, 3.710827, 0, 0.4588235, 1, 1,
0.177793, -0.09512424, 1.843159, 0, 0.454902, 1, 1,
0.1834523, -1.172426, 3.791484, 0, 0.4470588, 1, 1,
0.1837785, -0.3540551, 1.952374, 0, 0.4431373, 1, 1,
0.1851853, -0.29025, 2.902288, 0, 0.4352941, 1, 1,
0.185522, -0.6775245, 3.804988, 0, 0.4313726, 1, 1,
0.1868178, 1.250308, -0.3037069, 0, 0.4235294, 1, 1,
0.1899669, -2.014011, 2.988439, 0, 0.4196078, 1, 1,
0.1914099, -1.671975, 3.19535, 0, 0.4117647, 1, 1,
0.1917309, -0.3179308, 2.093835, 0, 0.4078431, 1, 1,
0.1950866, -0.9880435, 3.625523, 0, 0.4, 1, 1,
0.2164667, 0.6456672, -0.3542657, 0, 0.3921569, 1, 1,
0.2171992, 0.2165966, 0.7063931, 0, 0.3882353, 1, 1,
0.2177123, -2.007257, 3.577798, 0, 0.3803922, 1, 1,
0.2179376, 0.18013, 0.4745635, 0, 0.3764706, 1, 1,
0.2220919, 0.6128379, 0.7266651, 0, 0.3686275, 1, 1,
0.22456, 0.3480468, 1.132627, 0, 0.3647059, 1, 1,
0.2284879, -1.286274, 3.153297, 0, 0.3568628, 1, 1,
0.2323119, -1.355413, 2.290535, 0, 0.3529412, 1, 1,
0.2325758, 0.4878549, 0.7036405, 0, 0.345098, 1, 1,
0.2332118, -1.02334, 3.35973, 0, 0.3411765, 1, 1,
0.2348786, 1.743013, -0.4520557, 0, 0.3333333, 1, 1,
0.2386326, 0.02266339, 1.413346, 0, 0.3294118, 1, 1,
0.2420422, -1.722348, 2.784135, 0, 0.3215686, 1, 1,
0.2442466, -0.3175032, 3.235966, 0, 0.3176471, 1, 1,
0.2485466, -0.2699295, 1.577215, 0, 0.3098039, 1, 1,
0.2528616, 1.566736, -1.21164, 0, 0.3058824, 1, 1,
0.256154, 1.357658, 0.1688069, 0, 0.2980392, 1, 1,
0.2581982, -0.3113353, 3.933836, 0, 0.2901961, 1, 1,
0.2584504, 0.002654693, 0.6722196, 0, 0.2862745, 1, 1,
0.2632643, -0.2920181, 2.274337, 0, 0.2784314, 1, 1,
0.2634313, -0.3077594, 4.177755, 0, 0.2745098, 1, 1,
0.2654339, 0.5934042, -0.6576, 0, 0.2666667, 1, 1,
0.2659881, 1.643265, 0.468921, 0, 0.2627451, 1, 1,
0.270599, -1.17619, 3.074316, 0, 0.254902, 1, 1,
0.2724608, 0.5679598, -1.608483, 0, 0.2509804, 1, 1,
0.2740831, 0.4834451, 1.583793, 0, 0.2431373, 1, 1,
0.2793322, 0.9600411, -1.03827, 0, 0.2392157, 1, 1,
0.2793537, 0.05690964, 0.3650056, 0, 0.2313726, 1, 1,
0.2806191, -0.1918362, 1.61026, 0, 0.227451, 1, 1,
0.2823029, 0.4179141, 0.3054166, 0, 0.2196078, 1, 1,
0.2827862, 0.8559623, 0.244666, 0, 0.2156863, 1, 1,
0.282929, -0.0349596, 1.883721, 0, 0.2078431, 1, 1,
0.2855898, -0.3676937, 1.925139, 0, 0.2039216, 1, 1,
0.2947587, -2.205657, 2.835034, 0, 0.1960784, 1, 1,
0.3017434, -0.8341424, 2.579885, 0, 0.1882353, 1, 1,
0.3054708, 0.9200337, 0.2714279, 0, 0.1843137, 1, 1,
0.3064533, -0.3208221, 1.433947, 0, 0.1764706, 1, 1,
0.3091303, 1.445046, -0.00460497, 0, 0.172549, 1, 1,
0.3096562, 1.326938, -2.258944, 0, 0.1647059, 1, 1,
0.3118392, 0.511636, -1.029756, 0, 0.1607843, 1, 1,
0.3137726, 0.5146949, 1.573274, 0, 0.1529412, 1, 1,
0.3182484, 1.324377, -0.2190337, 0, 0.1490196, 1, 1,
0.3192463, -0.8374644, 2.612871, 0, 0.1411765, 1, 1,
0.3196643, 1.475073, -0.9030734, 0, 0.1372549, 1, 1,
0.3238997, -1.799948, 2.483623, 0, 0.1294118, 1, 1,
0.3261733, -0.3538483, 1.959499, 0, 0.1254902, 1, 1,
0.3339761, 2.193964, 0.1054314, 0, 0.1176471, 1, 1,
0.3368746, -0.1003941, 2.775594, 0, 0.1137255, 1, 1,
0.3424778, -0.6588176, 2.478008, 0, 0.1058824, 1, 1,
0.3442432, 0.1463387, 0.6618978, 0, 0.09803922, 1, 1,
0.3478597, -2.17786, 3.158019, 0, 0.09411765, 1, 1,
0.3521475, -0.6748753, 3.209274, 0, 0.08627451, 1, 1,
0.3567741, -1.146381, 2.86025, 0, 0.08235294, 1, 1,
0.3617004, 0.5480291, -1.074967, 0, 0.07450981, 1, 1,
0.3655138, -1.675275, 2.48761, 0, 0.07058824, 1, 1,
0.3668993, 1.169891, -0.2944447, 0, 0.0627451, 1, 1,
0.3763819, -0.3303992, 2.616992, 0, 0.05882353, 1, 1,
0.3764212, -0.1363296, 0.8254651, 0, 0.05098039, 1, 1,
0.3905617, 0.5384009, -0.5246391, 0, 0.04705882, 1, 1,
0.3907388, 1.198332, 0.03116611, 0, 0.03921569, 1, 1,
0.3913704, 1.807766, -1.291217, 0, 0.03529412, 1, 1,
0.3985092, -0.3128524, 2.087447, 0, 0.02745098, 1, 1,
0.3993114, -0.9244205, 1.632473, 0, 0.02352941, 1, 1,
0.4031307, -1.659681, 1.952716, 0, 0.01568628, 1, 1,
0.4042673, -1.564934, 2.563401, 0, 0.01176471, 1, 1,
0.406637, -1.109713, 2.823421, 0, 0.003921569, 1, 1,
0.415517, 0.07723884, 3.56298, 0.003921569, 0, 1, 1,
0.4267911, -2.204536, 3.196483, 0.007843138, 0, 1, 1,
0.428436, 0.55046, 1.577015, 0.01568628, 0, 1, 1,
0.4293338, -0.693113, 3.668986, 0.01960784, 0, 1, 1,
0.4299808, 0.4922321, 0.5640774, 0.02745098, 0, 1, 1,
0.4304998, -1.095724, 3.105336, 0.03137255, 0, 1, 1,
0.4326082, -0.8477284, 0.4281281, 0.03921569, 0, 1, 1,
0.4404023, -1.318281, 1.284899, 0.04313726, 0, 1, 1,
0.4410402, 0.07648832, 1.765907, 0.05098039, 0, 1, 1,
0.4413648, -0.1691217, 2.979888, 0.05490196, 0, 1, 1,
0.4460684, 0.652139, 2.315749, 0.0627451, 0, 1, 1,
0.451964, 0.5286253, 2.445831, 0.06666667, 0, 1, 1,
0.4541786, -0.1427442, 2.557946, 0.07450981, 0, 1, 1,
0.4556353, -0.590571, 3.304545, 0.07843138, 0, 1, 1,
0.4562793, -0.6113835, 1.527832, 0.08627451, 0, 1, 1,
0.4572649, 1.109719, 0.1083738, 0.09019608, 0, 1, 1,
0.4576896, 1.240893, 2.453971, 0.09803922, 0, 1, 1,
0.4620048, 0.6326436, 1.591983, 0.1058824, 0, 1, 1,
0.4654735, 0.2041552, 2.054824, 0.1098039, 0, 1, 1,
0.4671512, -0.263741, 2.235458, 0.1176471, 0, 1, 1,
0.4692169, -0.3568062, 2.227093, 0.1215686, 0, 1, 1,
0.4718205, -0.6650096, 3.710756, 0.1294118, 0, 1, 1,
0.473869, 1.095383, 1.040488, 0.1333333, 0, 1, 1,
0.475279, -0.2899454, 1.704681, 0.1411765, 0, 1, 1,
0.4762726, -0.2272918, 2.342963, 0.145098, 0, 1, 1,
0.4771647, -1.913167, 3.495301, 0.1529412, 0, 1, 1,
0.4861002, 2.085044, 0.8779294, 0.1568628, 0, 1, 1,
0.4922176, -2.024808, 3.304048, 0.1647059, 0, 1, 1,
0.4946009, -1.846381, 3.239792, 0.1686275, 0, 1, 1,
0.4970319, 1.345525, -1.177994, 0.1764706, 0, 1, 1,
0.4982515, -0.7259575, 0.7295319, 0.1803922, 0, 1, 1,
0.4990361, -0.7128547, 0.5041586, 0.1882353, 0, 1, 1,
0.5011098, -1.847248, 2.666093, 0.1921569, 0, 1, 1,
0.5020632, -0.01160008, 1.36352, 0.2, 0, 1, 1,
0.5041233, 0.4850191, 0.3642387, 0.2078431, 0, 1, 1,
0.5082116, -0.9213462, 2.172734, 0.2117647, 0, 1, 1,
0.5086973, -0.1917105, 2.055625, 0.2196078, 0, 1, 1,
0.5103748, -0.4342176, 2.620904, 0.2235294, 0, 1, 1,
0.5108361, 2.688546, -0.1594701, 0.2313726, 0, 1, 1,
0.5176577, -0.3431491, 2.049135, 0.2352941, 0, 1, 1,
0.5317085, -0.06999108, 1.054064, 0.2431373, 0, 1, 1,
0.5323816, 1.34169, 0.9497624, 0.2470588, 0, 1, 1,
0.5344524, -0.7159617, 3.41989, 0.254902, 0, 1, 1,
0.5417129, 0.3591765, 0.3880327, 0.2588235, 0, 1, 1,
0.5423798, 0.7128217, 0.4056213, 0.2666667, 0, 1, 1,
0.5432382, 1.091992, 2.751724, 0.2705882, 0, 1, 1,
0.544349, 2.157865, 1.187687, 0.2784314, 0, 1, 1,
0.5454101, -0.06465281, 3.278333, 0.282353, 0, 1, 1,
0.5459104, 1.096341, 0.5961794, 0.2901961, 0, 1, 1,
0.5506624, -0.4309161, 2.57795, 0.2941177, 0, 1, 1,
0.5539271, -0.4537911, 2.505392, 0.3019608, 0, 1, 1,
0.5546502, 0.07888067, 1.766833, 0.3098039, 0, 1, 1,
0.5562721, 0.1144731, 1.952561, 0.3137255, 0, 1, 1,
0.5588518, -0.9069899, 1.067831, 0.3215686, 0, 1, 1,
0.5588647, 0.4421222, 2.610042, 0.3254902, 0, 1, 1,
0.5604022, 0.7555678, 0.9022984, 0.3333333, 0, 1, 1,
0.5664161, -1.000406, 1.202035, 0.3372549, 0, 1, 1,
0.5675622, -1.598656, 2.127729, 0.345098, 0, 1, 1,
0.5677675, 0.6612175, -0.01407364, 0.3490196, 0, 1, 1,
0.5711377, -0.2000433, 1.338373, 0.3568628, 0, 1, 1,
0.575356, 0.8594819, -0.1698887, 0.3607843, 0, 1, 1,
0.5787898, 1.025725, 0.6504807, 0.3686275, 0, 1, 1,
0.5802372, -0.9783298, 2.040222, 0.372549, 0, 1, 1,
0.5816833, 0.1667598, 1.459625, 0.3803922, 0, 1, 1,
0.5827312, -0.1201984, 0.9758782, 0.3843137, 0, 1, 1,
0.5839522, -1.798465, 3.519722, 0.3921569, 0, 1, 1,
0.5848727, 0.5037932, 0.9568066, 0.3960784, 0, 1, 1,
0.5884557, 0.7178808, 2.530304, 0.4039216, 0, 1, 1,
0.5894194, 1.287734, 0.3392841, 0.4117647, 0, 1, 1,
0.5904492, 0.3775159, 0.7430192, 0.4156863, 0, 1, 1,
0.5942196, 1.174066, 1.235533, 0.4235294, 0, 1, 1,
0.5943212, -1.243935, 2.655733, 0.427451, 0, 1, 1,
0.5953828, 0.8059363, 1.626153, 0.4352941, 0, 1, 1,
0.5988495, 0.3633789, -0.5882198, 0.4392157, 0, 1, 1,
0.6001822, 1.578933, 3.541692, 0.4470588, 0, 1, 1,
0.6071519, 0.2929116, 0.4689665, 0.4509804, 0, 1, 1,
0.6094479, 0.2222152, 0.8270553, 0.4588235, 0, 1, 1,
0.6095144, 1.463025, 1.242543, 0.4627451, 0, 1, 1,
0.6118112, -1.771395, 3.370403, 0.4705882, 0, 1, 1,
0.6136062, -1.294916, 2.570794, 0.4745098, 0, 1, 1,
0.6166795, -0.6561475, 0.8915911, 0.4823529, 0, 1, 1,
0.6182005, -0.3488224, 2.296239, 0.4862745, 0, 1, 1,
0.6183206, 1.311148, -1.775482, 0.4941176, 0, 1, 1,
0.621476, -2.071931, 4.212186, 0.5019608, 0, 1, 1,
0.6226904, -0.5428389, 2.17695, 0.5058824, 0, 1, 1,
0.6253244, -1.774257, 4.136376, 0.5137255, 0, 1, 1,
0.6269757, -1.168249, 3.670509, 0.5176471, 0, 1, 1,
0.6320532, 1.183745, -0.3353371, 0.5254902, 0, 1, 1,
0.6328538, 1.039729, 0.4404645, 0.5294118, 0, 1, 1,
0.6485201, 0.1006985, -0.1673339, 0.5372549, 0, 1, 1,
0.6601939, 0.6054587, 1.389733, 0.5411765, 0, 1, 1,
0.6612604, -0.02827029, 1.951735, 0.5490196, 0, 1, 1,
0.6615233, 0.3281794, 0.5662438, 0.5529412, 0, 1, 1,
0.6721395, -1.349859, 1.533285, 0.5607843, 0, 1, 1,
0.6825284, -0.3558819, 1.772905, 0.5647059, 0, 1, 1,
0.6893113, 2.334331, 1.778879, 0.572549, 0, 1, 1,
0.6930566, 0.8459942, -0.1709822, 0.5764706, 0, 1, 1,
0.6940605, 0.2747813, 0.9567171, 0.5843138, 0, 1, 1,
0.6946747, -0.4396552, 0.7893088, 0.5882353, 0, 1, 1,
0.6982896, 0.9281887, -1.270469, 0.5960785, 0, 1, 1,
0.7002729, -0.9490102, 3.29723, 0.6039216, 0, 1, 1,
0.7026755, 0.7804941, 1.092297, 0.6078432, 0, 1, 1,
0.708505, 0.2818424, 1.063148, 0.6156863, 0, 1, 1,
0.7167524, 0.3825814, 2.782627, 0.6196079, 0, 1, 1,
0.7236272, 0.1869088, 3.307266, 0.627451, 0, 1, 1,
0.7252845, -2.121864, 2.040913, 0.6313726, 0, 1, 1,
0.7257733, 1.128832, 0.6841006, 0.6392157, 0, 1, 1,
0.7267467, 0.03809916, 1.440284, 0.6431373, 0, 1, 1,
0.7310919, -0.3919721, 2.414115, 0.6509804, 0, 1, 1,
0.7324488, -0.9811888, 4.380049, 0.654902, 0, 1, 1,
0.7413235, -0.8669252, 3.187881, 0.6627451, 0, 1, 1,
0.7444699, -0.9717909, 3.645655, 0.6666667, 0, 1, 1,
0.7567881, -0.8860108, 1.585984, 0.6745098, 0, 1, 1,
0.7592854, 0.3830163, 1.113031, 0.6784314, 0, 1, 1,
0.7606416, 0.4213061, 0.5298297, 0.6862745, 0, 1, 1,
0.7652025, 0.524706, 0.09664102, 0.6901961, 0, 1, 1,
0.7669927, -0.1750692, 2.052799, 0.6980392, 0, 1, 1,
0.7690124, 0.3488619, 0.9831677, 0.7058824, 0, 1, 1,
0.7697003, -1.222222, 2.598414, 0.7098039, 0, 1, 1,
0.7756604, -0.05091264, 2.118322, 0.7176471, 0, 1, 1,
0.7777209, 0.8850711, 0.8000513, 0.7215686, 0, 1, 1,
0.7813173, -0.7137622, 2.532787, 0.7294118, 0, 1, 1,
0.7890074, -0.2957163, 3.516251, 0.7333333, 0, 1, 1,
0.8000106, -0.1104616, 0.7142849, 0.7411765, 0, 1, 1,
0.8009182, -0.9657874, 2.00152, 0.7450981, 0, 1, 1,
0.8040059, -0.4898849, 2.109371, 0.7529412, 0, 1, 1,
0.8139237, 0.8712391, 1.077204, 0.7568628, 0, 1, 1,
0.8216001, -1.209365, 2.094728, 0.7647059, 0, 1, 1,
0.8228248, -1.026539, 2.575259, 0.7686275, 0, 1, 1,
0.8271903, 0.7041154, 1.59612, 0.7764706, 0, 1, 1,
0.8273227, 1.230258, 1.867655, 0.7803922, 0, 1, 1,
0.8298117, -1.101581, 2.245045, 0.7882353, 0, 1, 1,
0.8322964, 1.773946, 0.2462849, 0.7921569, 0, 1, 1,
0.8397421, 0.2724643, -0.6910914, 0.8, 0, 1, 1,
0.8434428, 1.143199, 1.359701, 0.8078431, 0, 1, 1,
0.8439247, -1.038766, 3.756142, 0.8117647, 0, 1, 1,
0.8484577, -1.81335, 1.636676, 0.8196079, 0, 1, 1,
0.8560976, -0.03177312, 0.951198, 0.8235294, 0, 1, 1,
0.8619811, -0.0112598, 1.341892, 0.8313726, 0, 1, 1,
0.8641993, -0.1043062, 1.807841, 0.8352941, 0, 1, 1,
0.8662927, -0.3957924, 0.7055448, 0.8431373, 0, 1, 1,
0.8701046, -0.4406665, 1.289057, 0.8470588, 0, 1, 1,
0.8719519, 1.341854, 0.7629835, 0.854902, 0, 1, 1,
0.8774877, -0.1366252, 1.827991, 0.8588235, 0, 1, 1,
0.8778605, -1.501651, 4.154473, 0.8666667, 0, 1, 1,
0.8841476, -0.7574945, 4.37286, 0.8705882, 0, 1, 1,
0.8865917, 1.238777, 0.06341416, 0.8784314, 0, 1, 1,
0.8874963, -0.725985, 4.152245, 0.8823529, 0, 1, 1,
0.8896935, -1.655669, 2.663176, 0.8901961, 0, 1, 1,
0.8937514, 1.848806, -0.6766119, 0.8941177, 0, 1, 1,
0.8944274, 0.4744525, 2.492013, 0.9019608, 0, 1, 1,
0.8949152, -1.411687, 0.8541243, 0.9098039, 0, 1, 1,
0.896304, 0.05659514, 3.35692, 0.9137255, 0, 1, 1,
0.8994994, -1.451439, 2.83503, 0.9215686, 0, 1, 1,
0.9029655, -0.4015592, 2.914802, 0.9254902, 0, 1, 1,
0.9030001, -0.3245871, 3.259482, 0.9333333, 0, 1, 1,
0.9061353, -0.3271356, 1.562106, 0.9372549, 0, 1, 1,
0.9176493, 1.008733, 0.8974388, 0.945098, 0, 1, 1,
0.9228791, 1.11286, 1.521534, 0.9490196, 0, 1, 1,
0.9322634, 0.337419, 0.7462959, 0.9568627, 0, 1, 1,
0.9327782, 0.7550179, -1.407883, 0.9607843, 0, 1, 1,
0.9360051, 0.09565859, 0.9604521, 0.9686275, 0, 1, 1,
0.9492448, -0.6536222, 2.315755, 0.972549, 0, 1, 1,
0.9511349, 1.545436, 1.293263, 0.9803922, 0, 1, 1,
0.9599822, 0.5232317, -0.9236867, 0.9843137, 0, 1, 1,
0.9605572, -0.6829773, 2.59133, 0.9921569, 0, 1, 1,
0.9609289, 1.741992, -0.3962552, 0.9960784, 0, 1, 1,
0.9662744, -0.4743973, 0.7811506, 1, 0, 0.9960784, 1,
0.9726046, 0.08284707, 0.8571948, 1, 0, 0.9882353, 1,
0.9754644, -0.4794308, -0.09767189, 1, 0, 0.9843137, 1,
0.9816107, -0.07703973, 0.476438, 1, 0, 0.9764706, 1,
0.9821391, -0.03239795, 1.827687, 1, 0, 0.972549, 1,
0.9855734, -1.366409, 3.213677, 1, 0, 0.9647059, 1,
0.9882734, -0.1642101, 1.370765, 1, 0, 0.9607843, 1,
0.9914597, 1.121499, 1.025759, 1, 0, 0.9529412, 1,
0.9929276, -0.2354056, 2.862633, 1, 0, 0.9490196, 1,
0.9990719, -2.249331, 2.678525, 1, 0, 0.9411765, 1,
1.000559, -0.0272355, 2.789552, 1, 0, 0.9372549, 1,
1.003113, -1.025231, 2.158431, 1, 0, 0.9294118, 1,
1.003762, -0.8090654, 1.452836, 1, 0, 0.9254902, 1,
1.005497, -1.658744, 1.255476, 1, 0, 0.9176471, 1,
1.007352, 0.8659813, 1.644253, 1, 0, 0.9137255, 1,
1.01212, -0.5327106, 2.3035, 1, 0, 0.9058824, 1,
1.035402, 0.2230992, 2.320117, 1, 0, 0.9019608, 1,
1.03556, -0.8995451, 0.8859268, 1, 0, 0.8941177, 1,
1.037637, -1.687143, 2.889128, 1, 0, 0.8862745, 1,
1.053005, 0.2831908, 1.322797, 1, 0, 0.8823529, 1,
1.056868, -0.7297474, 3.318279, 1, 0, 0.8745098, 1,
1.065528, -0.312797, -0.06538235, 1, 0, 0.8705882, 1,
1.065996, -1.381187, 0.9671852, 1, 0, 0.8627451, 1,
1.066859, 1.64481, 1.927563, 1, 0, 0.8588235, 1,
1.067676, 1.017516, -0.1238043, 1, 0, 0.8509804, 1,
1.068027, 0.7832202, 3.031358, 1, 0, 0.8470588, 1,
1.072367, 0.2652762, 1.456396, 1, 0, 0.8392157, 1,
1.08464, 0.7076877, 0.8504336, 1, 0, 0.8352941, 1,
1.086463, 1.411853, 0.4164107, 1, 0, 0.827451, 1,
1.097254, -1.105886, 3.053984, 1, 0, 0.8235294, 1,
1.10367, 0.01580657, 1.741903, 1, 0, 0.8156863, 1,
1.112179, 0.06917913, 1.510986, 1, 0, 0.8117647, 1,
1.116433, -0.4010881, 2.518461, 1, 0, 0.8039216, 1,
1.121708, -1.491039, 3.298403, 1, 0, 0.7960784, 1,
1.153884, -1.386236, 1.806088, 1, 0, 0.7921569, 1,
1.156383, 0.1180274, 1.226483, 1, 0, 0.7843137, 1,
1.157857, -0.1207217, 2.02472, 1, 0, 0.7803922, 1,
1.160926, 0.3164708, -0.5000564, 1, 0, 0.772549, 1,
1.170043, 1.433373, 1.016654, 1, 0, 0.7686275, 1,
1.17318, 0.3276349, 2.504237, 1, 0, 0.7607843, 1,
1.18061, 0.6279866, 1.813454, 1, 0, 0.7568628, 1,
1.18255, 0.2328006, 0.562162, 1, 0, 0.7490196, 1,
1.184238, -0.03141402, 1.138217, 1, 0, 0.7450981, 1,
1.191641, 0.3430881, -0.4924987, 1, 0, 0.7372549, 1,
1.195686, -0.3769422, 2.413895, 1, 0, 0.7333333, 1,
1.202847, -0.2592549, 1.302163, 1, 0, 0.7254902, 1,
1.206043, -0.09392478, -0.2601361, 1, 0, 0.7215686, 1,
1.207409, -0.4134647, 1.231318, 1, 0, 0.7137255, 1,
1.217559, 0.2147813, 1.360946, 1, 0, 0.7098039, 1,
1.223769, -0.1128659, 2.650693, 1, 0, 0.7019608, 1,
1.224417, 1.901365, 1.210747, 1, 0, 0.6941177, 1,
1.224556, 1.185991, 1.159746, 1, 0, 0.6901961, 1,
1.227536, 1.529567, 2.263536, 1, 0, 0.682353, 1,
1.236321, 0.1434532, 2.738826, 1, 0, 0.6784314, 1,
1.239905, 1.804783, 0.6639434, 1, 0, 0.6705883, 1,
1.242273, 0.9753671, 2.876244, 1, 0, 0.6666667, 1,
1.247668, -0.1170049, 2.338663, 1, 0, 0.6588235, 1,
1.248786, 2.684542, 0.3313775, 1, 0, 0.654902, 1,
1.251798, -1.298724, 2.483144, 1, 0, 0.6470588, 1,
1.262851, -0.8861808, 3.426518, 1, 0, 0.6431373, 1,
1.264061, -0.4049156, 3.396537, 1, 0, 0.6352941, 1,
1.26585, 0.2105951, 0.6522319, 1, 0, 0.6313726, 1,
1.267099, 1.736696, -0.4364802, 1, 0, 0.6235294, 1,
1.270642, -1.360826, 1.951533, 1, 0, 0.6196079, 1,
1.275438, 0.4832638, 1.86013, 1, 0, 0.6117647, 1,
1.281098, -0.4617701, 0.2605267, 1, 0, 0.6078432, 1,
1.290213, 0.2190318, 2.136102, 1, 0, 0.6, 1,
1.290651, 1.209466, -0.1262787, 1, 0, 0.5921569, 1,
1.292017, 0.5219083, 2.449138, 1, 0, 0.5882353, 1,
1.295063, 0.04320641, 1.374492, 1, 0, 0.5803922, 1,
1.297146, -1.506398, 2.425275, 1, 0, 0.5764706, 1,
1.297759, 1.64768, -0.4012245, 1, 0, 0.5686275, 1,
1.304979, 0.06159165, 2.90499, 1, 0, 0.5647059, 1,
1.305266, 1.974859, 1.384206, 1, 0, 0.5568628, 1,
1.321409, -0.9282223, 1.704544, 1, 0, 0.5529412, 1,
1.32879, -1.835793, 3.055405, 1, 0, 0.5450981, 1,
1.330433, -0.5073728, 2.643137, 1, 0, 0.5411765, 1,
1.33978, -0.227225, 3.13523, 1, 0, 0.5333334, 1,
1.340815, -0.6285595, 2.71933, 1, 0, 0.5294118, 1,
1.349132, -0.4316002, 2.045074, 1, 0, 0.5215687, 1,
1.355857, -0.4755264, 1.441221, 1, 0, 0.5176471, 1,
1.367466, 1.691643, 0.9387525, 1, 0, 0.509804, 1,
1.368927, -1.617524, 3.481075, 1, 0, 0.5058824, 1,
1.373792, 0.1146438, 2.830392, 1, 0, 0.4980392, 1,
1.374977, -0.8063283, 1.794562, 1, 0, 0.4901961, 1,
1.385161, -0.121552, 1.147476, 1, 0, 0.4862745, 1,
1.395302, -0.6402853, 2.282346, 1, 0, 0.4784314, 1,
1.400096, 0.8626669, 0.7550684, 1, 0, 0.4745098, 1,
1.403791, -0.0834635, 1.910399, 1, 0, 0.4666667, 1,
1.404379, -1.298757, 1.339266, 1, 0, 0.4627451, 1,
1.409006, 0.328348, 1.900643, 1, 0, 0.454902, 1,
1.421523, 0.3571098, 1.614079, 1, 0, 0.4509804, 1,
1.427966, -1.39643, 1.766827, 1, 0, 0.4431373, 1,
1.454714, -0.3584092, 1.324504, 1, 0, 0.4392157, 1,
1.459369, 0.2429982, 2.594264, 1, 0, 0.4313726, 1,
1.45967, 0.05919072, 3.048874, 1, 0, 0.427451, 1,
1.464517, 1.263236, 1.329412, 1, 0, 0.4196078, 1,
1.48685, 0.03541617, 1.345787, 1, 0, 0.4156863, 1,
1.488014, -0.5587624, 3.42259, 1, 0, 0.4078431, 1,
1.492018, 0.9556404, 1.06251, 1, 0, 0.4039216, 1,
1.496138, -1.774123, 2.746102, 1, 0, 0.3960784, 1,
1.502914, -0.3830837, 1.207224, 1, 0, 0.3882353, 1,
1.514334, 0.04445598, 1.949347, 1, 0, 0.3843137, 1,
1.515962, -0.3965824, 0.9673116, 1, 0, 0.3764706, 1,
1.529364, -2.324419, 2.370756, 1, 0, 0.372549, 1,
1.53572, -0.2979693, 2.0258, 1, 0, 0.3647059, 1,
1.542014, 0.111679, 1.946724, 1, 0, 0.3607843, 1,
1.546671, -0.02578081, 1.178395, 1, 0, 0.3529412, 1,
1.560939, -2.454669, 4.199014, 1, 0, 0.3490196, 1,
1.599078, 0.3520538, 1.218586, 1, 0, 0.3411765, 1,
1.599792, 0.1970331, 0.9041092, 1, 0, 0.3372549, 1,
1.603262, 0.6759024, 1.350581, 1, 0, 0.3294118, 1,
1.609261, 0.04823193, 0.6676088, 1, 0, 0.3254902, 1,
1.613777, -1.135577, 2.655598, 1, 0, 0.3176471, 1,
1.621104, -0.5974307, 2.439911, 1, 0, 0.3137255, 1,
1.624692, 0.6459951, 0.2480701, 1, 0, 0.3058824, 1,
1.644319, 0.01438488, 1.190457, 1, 0, 0.2980392, 1,
1.644589, -0.765834, 2.261534, 1, 0, 0.2941177, 1,
1.664918, 0.140936, 2.787847, 1, 0, 0.2862745, 1,
1.675376, -1.109153, 0.6580536, 1, 0, 0.282353, 1,
1.681905, -0.6332404, 2.229288, 1, 0, 0.2745098, 1,
1.685801, 1.453097, -0.231044, 1, 0, 0.2705882, 1,
1.687402, 0.9393968, 2.631341, 1, 0, 0.2627451, 1,
1.691772, -0.7184852, -0.6780537, 1, 0, 0.2588235, 1,
1.695336, 0.07034036, 1.014539, 1, 0, 0.2509804, 1,
1.715049, -0.967065, 3.098315, 1, 0, 0.2470588, 1,
1.723487, 0.25048, 1.071573, 1, 0, 0.2392157, 1,
1.749088, -0.2317658, 1.930452, 1, 0, 0.2352941, 1,
1.749099, -1.971021, 3.278815, 1, 0, 0.227451, 1,
1.75344, -0.5626349, 2.474195, 1, 0, 0.2235294, 1,
1.755788, 0.8912188, -0.3529996, 1, 0, 0.2156863, 1,
1.785583, -0.335862, 2.03666, 1, 0, 0.2117647, 1,
1.788769, -0.8896805, 2.273149, 1, 0, 0.2039216, 1,
1.801785, 0.8435931, 2.779668, 1, 0, 0.1960784, 1,
1.803484, -0.7266141, 3.973099, 1, 0, 0.1921569, 1,
1.818916, 0.4651541, 1.241483, 1, 0, 0.1843137, 1,
1.823146, 0.4255972, 1.165285, 1, 0, 0.1803922, 1,
1.826263, -0.7968993, 1.692542, 1, 0, 0.172549, 1,
1.835156, -0.3015554, 1.133999, 1, 0, 0.1686275, 1,
1.837462, 1.888795, 0.3574418, 1, 0, 0.1607843, 1,
1.860778, -0.8923905, 1.298718, 1, 0, 0.1568628, 1,
1.869961, 0.2729219, 2.526486, 1, 0, 0.1490196, 1,
1.885014, 0.408769, 0.5108045, 1, 0, 0.145098, 1,
1.889319, 0.2206332, 2.081465, 1, 0, 0.1372549, 1,
1.904245, -2.036499, 3.35401, 1, 0, 0.1333333, 1,
1.971509, -1.220638, 2.328854, 1, 0, 0.1254902, 1,
1.978037, -1.663929, 3.896425, 1, 0, 0.1215686, 1,
2.010458, -1.906719, 2.166543, 1, 0, 0.1137255, 1,
2.081577, -0.66756, 1.434678, 1, 0, 0.1098039, 1,
2.106755, 1.382459, 2.216817, 1, 0, 0.1019608, 1,
2.129163, 0.3882616, 2.298313, 1, 0, 0.09411765, 1,
2.219812, 0.03062711, 1.258993, 1, 0, 0.09019608, 1,
2.26661, -0.1931485, 1.510421, 1, 0, 0.08235294, 1,
2.277307, 0.1306546, 2.396842, 1, 0, 0.07843138, 1,
2.284216, 1.338843, 0.8021554, 1, 0, 0.07058824, 1,
2.299783, -0.7179406, 1.772661, 1, 0, 0.06666667, 1,
2.308857, 0.3349909, 0.511957, 1, 0, 0.05882353, 1,
2.337809, -0.01155161, 2.463593, 1, 0, 0.05490196, 1,
2.438237, 0.2636265, 1.828681, 1, 0, 0.04705882, 1,
2.450705, -0.7142314, 2.632034, 1, 0, 0.04313726, 1,
2.458793, 0.9256045, 1.584226, 1, 0, 0.03529412, 1,
2.481454, -1.267376, 2.67709, 1, 0, 0.03137255, 1,
2.494668, 1.655056, 0.6487903, 1, 0, 0.02352941, 1,
2.521267, -0.3070626, 1.992948, 1, 0, 0.01960784, 1,
2.603121, -1.718528, 2.644783, 1, 0, 0.01176471, 1,
2.80421, 0.05502072, 0.7600217, 1, 0, 0.007843138, 1
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
-0.3052371, -3.844061, -7.587442, 0, -0.5, 0.5, 0.5,
-0.3052371, -3.844061, -7.587442, 1, -0.5, 0.5, 0.5,
-0.3052371, -3.844061, -7.587442, 1, 1.5, 0.5, 0.5,
-0.3052371, -3.844061, -7.587442, 0, 1.5, 0.5, 0.5
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
-4.468787, 0.5641764, -7.587442, 0, -0.5, 0.5, 0.5,
-4.468787, 0.5641764, -7.587442, 1, -0.5, 0.5, 0.5,
-4.468787, 0.5641764, -7.587442, 1, 1.5, 0.5, 0.5,
-4.468787, 0.5641764, -7.587442, 0, 1.5, 0.5, 0.5
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
-4.468787, -3.844061, -0.3942094, 0, -0.5, 0.5, 0.5,
-4.468787, -3.844061, -0.3942094, 1, -0.5, 0.5, 0.5,
-4.468787, -3.844061, -0.3942094, 1, 1.5, 0.5, 0.5,
-4.468787, -3.844061, -0.3942094, 0, 1.5, 0.5, 0.5
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
-3, -2.826776, -5.927465,
2, -2.826776, -5.927465,
-3, -2.826776, -5.927465,
-3, -2.996323, -6.204128,
-2, -2.826776, -5.927465,
-2, -2.996323, -6.204128,
-1, -2.826776, -5.927465,
-1, -2.996323, -6.204128,
0, -2.826776, -5.927465,
0, -2.996323, -6.204128,
1, -2.826776, -5.927465,
1, -2.996323, -6.204128,
2, -2.826776, -5.927465,
2, -2.996323, -6.204128
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
-3, -3.335418, -6.757454, 0, -0.5, 0.5, 0.5,
-3, -3.335418, -6.757454, 1, -0.5, 0.5, 0.5,
-3, -3.335418, -6.757454, 1, 1.5, 0.5, 0.5,
-3, -3.335418, -6.757454, 0, 1.5, 0.5, 0.5,
-2, -3.335418, -6.757454, 0, -0.5, 0.5, 0.5,
-2, -3.335418, -6.757454, 1, -0.5, 0.5, 0.5,
-2, -3.335418, -6.757454, 1, 1.5, 0.5, 0.5,
-2, -3.335418, -6.757454, 0, 1.5, 0.5, 0.5,
-1, -3.335418, -6.757454, 0, -0.5, 0.5, 0.5,
-1, -3.335418, -6.757454, 1, -0.5, 0.5, 0.5,
-1, -3.335418, -6.757454, 1, 1.5, 0.5, 0.5,
-1, -3.335418, -6.757454, 0, 1.5, 0.5, 0.5,
0, -3.335418, -6.757454, 0, -0.5, 0.5, 0.5,
0, -3.335418, -6.757454, 1, -0.5, 0.5, 0.5,
0, -3.335418, -6.757454, 1, 1.5, 0.5, 0.5,
0, -3.335418, -6.757454, 0, 1.5, 0.5, 0.5,
1, -3.335418, -6.757454, 0, -0.5, 0.5, 0.5,
1, -3.335418, -6.757454, 1, -0.5, 0.5, 0.5,
1, -3.335418, -6.757454, 1, 1.5, 0.5, 0.5,
1, -3.335418, -6.757454, 0, 1.5, 0.5, 0.5,
2, -3.335418, -6.757454, 0, -0.5, 0.5, 0.5,
2, -3.335418, -6.757454, 1, -0.5, 0.5, 0.5,
2, -3.335418, -6.757454, 1, 1.5, 0.5, 0.5,
2, -3.335418, -6.757454, 0, 1.5, 0.5, 0.5
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
-3.507967, -2, -5.927465,
-3.507967, 3, -5.927465,
-3.507967, -2, -5.927465,
-3.668104, -2, -6.204128,
-3.507967, -1, -5.927465,
-3.668104, -1, -6.204128,
-3.507967, 0, -5.927465,
-3.668104, 0, -6.204128,
-3.507967, 1, -5.927465,
-3.668104, 1, -6.204128,
-3.507967, 2, -5.927465,
-3.668104, 2, -6.204128,
-3.507967, 3, -5.927465,
-3.668104, 3, -6.204128
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
-3.988377, -2, -6.757454, 0, -0.5, 0.5, 0.5,
-3.988377, -2, -6.757454, 1, -0.5, 0.5, 0.5,
-3.988377, -2, -6.757454, 1, 1.5, 0.5, 0.5,
-3.988377, -2, -6.757454, 0, 1.5, 0.5, 0.5,
-3.988377, -1, -6.757454, 0, -0.5, 0.5, 0.5,
-3.988377, -1, -6.757454, 1, -0.5, 0.5, 0.5,
-3.988377, -1, -6.757454, 1, 1.5, 0.5, 0.5,
-3.988377, -1, -6.757454, 0, 1.5, 0.5, 0.5,
-3.988377, 0, -6.757454, 0, -0.5, 0.5, 0.5,
-3.988377, 0, -6.757454, 1, -0.5, 0.5, 0.5,
-3.988377, 0, -6.757454, 1, 1.5, 0.5, 0.5,
-3.988377, 0, -6.757454, 0, 1.5, 0.5, 0.5,
-3.988377, 1, -6.757454, 0, -0.5, 0.5, 0.5,
-3.988377, 1, -6.757454, 1, -0.5, 0.5, 0.5,
-3.988377, 1, -6.757454, 1, 1.5, 0.5, 0.5,
-3.988377, 1, -6.757454, 0, 1.5, 0.5, 0.5,
-3.988377, 2, -6.757454, 0, -0.5, 0.5, 0.5,
-3.988377, 2, -6.757454, 1, -0.5, 0.5, 0.5,
-3.988377, 2, -6.757454, 1, 1.5, 0.5, 0.5,
-3.988377, 2, -6.757454, 0, 1.5, 0.5, 0.5,
-3.988377, 3, -6.757454, 0, -0.5, 0.5, 0.5,
-3.988377, 3, -6.757454, 1, -0.5, 0.5, 0.5,
-3.988377, 3, -6.757454, 1, 1.5, 0.5, 0.5,
-3.988377, 3, -6.757454, 0, 1.5, 0.5, 0.5
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
-3.507967, -2.826776, -4,
-3.507967, -2.826776, 4,
-3.507967, -2.826776, -4,
-3.668104, -2.996323, -4,
-3.507967, -2.826776, -2,
-3.668104, -2.996323, -2,
-3.507967, -2.826776, 0,
-3.668104, -2.996323, 0,
-3.507967, -2.826776, 2,
-3.668104, -2.996323, 2,
-3.507967, -2.826776, 4,
-3.668104, -2.996323, 4
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
-3.988377, -3.335418, -4, 0, -0.5, 0.5, 0.5,
-3.988377, -3.335418, -4, 1, -0.5, 0.5, 0.5,
-3.988377, -3.335418, -4, 1, 1.5, 0.5, 0.5,
-3.988377, -3.335418, -4, 0, 1.5, 0.5, 0.5,
-3.988377, -3.335418, -2, 0, -0.5, 0.5, 0.5,
-3.988377, -3.335418, -2, 1, -0.5, 0.5, 0.5,
-3.988377, -3.335418, -2, 1, 1.5, 0.5, 0.5,
-3.988377, -3.335418, -2, 0, 1.5, 0.5, 0.5,
-3.988377, -3.335418, 0, 0, -0.5, 0.5, 0.5,
-3.988377, -3.335418, 0, 1, -0.5, 0.5, 0.5,
-3.988377, -3.335418, 0, 1, 1.5, 0.5, 0.5,
-3.988377, -3.335418, 0, 0, 1.5, 0.5, 0.5,
-3.988377, -3.335418, 2, 0, -0.5, 0.5, 0.5,
-3.988377, -3.335418, 2, 1, -0.5, 0.5, 0.5,
-3.988377, -3.335418, 2, 1, 1.5, 0.5, 0.5,
-3.988377, -3.335418, 2, 0, 1.5, 0.5, 0.5,
-3.988377, -3.335418, 4, 0, -0.5, 0.5, 0.5,
-3.988377, -3.335418, 4, 1, -0.5, 0.5, 0.5,
-3.988377, -3.335418, 4, 1, 1.5, 0.5, 0.5,
-3.988377, -3.335418, 4, 0, 1.5, 0.5, 0.5
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
-3.507967, -2.826776, -5.927465,
-3.507967, 3.955128, -5.927465,
-3.507967, -2.826776, 5.139047,
-3.507967, 3.955128, 5.139047,
-3.507967, -2.826776, -5.927465,
-3.507967, -2.826776, 5.139047,
-3.507967, 3.955128, -5.927465,
-3.507967, 3.955128, 5.139047,
-3.507967, -2.826776, -5.927465,
2.897493, -2.826776, -5.927465,
-3.507967, -2.826776, 5.139047,
2.897493, -2.826776, 5.139047,
-3.507967, 3.955128, -5.927465,
2.897493, 3.955128, -5.927465,
-3.507967, 3.955128, 5.139047,
2.897493, 3.955128, 5.139047,
2.897493, -2.826776, -5.927465,
2.897493, 3.955128, -5.927465,
2.897493, -2.826776, 5.139047,
2.897493, 3.955128, 5.139047,
2.897493, -2.826776, -5.927465,
2.897493, -2.826776, 5.139047,
2.897493, 3.955128, -5.927465,
2.897493, 3.955128, 5.139047
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
var radius = 7.728746;
var distance = 34.38606;
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
mvMatrix.translate( 0.3052371, -0.5641764, 0.3942094 );
mvMatrix.scale( 1.304585, 1.232172, 0.7551134 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.38606);
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
Triazophos<-read.table("Triazophos.xyz")
```

```
## Error in read.table("Triazophos.xyz"): no lines available in input
```

```r
x<-Triazophos$V2
```

```
## Error in eval(expr, envir, enclos): object 'Triazophos' not found
```

```r
y<-Triazophos$V3
```

```
## Error in eval(expr, envir, enclos): object 'Triazophos' not found
```

```r
z<-Triazophos$V4
```

```
## Error in eval(expr, envir, enclos): object 'Triazophos' not found
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
-3.414684, -0.5452247, -1.65579, 0, 0, 1, 1, 1,
-2.978965, 0.7595772, -3.123179, 1, 0, 0, 1, 1,
-2.976005, 0.8227243, -1.060872, 1, 0, 0, 1, 1,
-2.919921, 0.4043863, -0.8285179, 1, 0, 0, 1, 1,
-2.866655, -1.029856, -2.800447, 1, 0, 0, 1, 1,
-2.52117, 1.825516, -0.2968741, 1, 0, 0, 1, 1,
-2.494015, 0.02972614, -2.494841, 0, 0, 0, 1, 1,
-2.376592, 1.764481, -0.7382258, 0, 0, 0, 1, 1,
-2.326314, 0.5025438, 0.636745, 0, 0, 0, 1, 1,
-2.251281, 0.7893069, -2.797525, 0, 0, 0, 1, 1,
-2.240492, 0.7867262, -2.402575, 0, 0, 0, 1, 1,
-2.222316, 0.5753819, -1.410499, 0, 0, 0, 1, 1,
-2.196533, 0.5613247, -2.258777, 0, 0, 0, 1, 1,
-2.170523, -0.1781086, -0.5453804, 1, 1, 1, 1, 1,
-2.165187, 0.1291956, -1.840009, 1, 1, 1, 1, 1,
-2.098364, -0.3766657, -1.786111, 1, 1, 1, 1, 1,
-2.067235, -1.440214, -2.392578, 1, 1, 1, 1, 1,
-2.058707, -1.064291, -1.693552, 1, 1, 1, 1, 1,
-2.016225, -0.2817727, -2.499154, 1, 1, 1, 1, 1,
-1.947789, 0.2178638, -3.656634, 1, 1, 1, 1, 1,
-1.945455, 0.3743222, -0.9429592, 1, 1, 1, 1, 1,
-1.942356, -0.5496047, -1.339548, 1, 1, 1, 1, 1,
-1.924845, 0.4712699, -1.460055, 1, 1, 1, 1, 1,
-1.89127, 2.039007, -1.370968, 1, 1, 1, 1, 1,
-1.878814, -0.346662, -0.647324, 1, 1, 1, 1, 1,
-1.87151, 1.052238, -0.8960059, 1, 1, 1, 1, 1,
-1.851345, 0.7257251, -1.334026, 1, 1, 1, 1, 1,
-1.850082, -0.2009038, -2.557725, 1, 1, 1, 1, 1,
-1.828736, 0.1356603, -3.273318, 0, 0, 1, 1, 1,
-1.782935, 0.3571387, -1.854612, 1, 0, 0, 1, 1,
-1.769535, -0.8909058, -2.025496, 1, 0, 0, 1, 1,
-1.767935, 1.835865, -1.020523, 1, 0, 0, 1, 1,
-1.762379, 0.1962299, -1.093359, 1, 0, 0, 1, 1,
-1.749888, 1.912264, -0.4128873, 1, 0, 0, 1, 1,
-1.74546, 0.7539617, -1.750934, 0, 0, 0, 1, 1,
-1.736285, 1.109747, 0.09174236, 0, 0, 0, 1, 1,
-1.73478, -0.6013236, -3.527843, 0, 0, 0, 1, 1,
-1.712147, 0.5385235, -2.146293, 0, 0, 0, 1, 1,
-1.708167, -0.07682823, -1.714459, 0, 0, 0, 1, 1,
-1.703467, 1.342365, -2.891602, 0, 0, 0, 1, 1,
-1.696799, 0.3643305, -1.238417, 0, 0, 0, 1, 1,
-1.667554, -0.05683818, -0.4998325, 1, 1, 1, 1, 1,
-1.65924, 1.45207, -0.1992884, 1, 1, 1, 1, 1,
-1.654568, 0.3028084, -1.468783, 1, 1, 1, 1, 1,
-1.642382, -1.092931, -2.083781, 1, 1, 1, 1, 1,
-1.640515, -0.09825222, 0.7593566, 1, 1, 1, 1, 1,
-1.63916, 1.337591, -2.552312, 1, 1, 1, 1, 1,
-1.637757, 0.9791601, -1.531481, 1, 1, 1, 1, 1,
-1.630753, 1.056958, -1.804004, 1, 1, 1, 1, 1,
-1.613105, 1.674717, -0.3328905, 1, 1, 1, 1, 1,
-1.608407, 1.412001, -0.8262576, 1, 1, 1, 1, 1,
-1.607501, 0.7673506, -2.2157, 1, 1, 1, 1, 1,
-1.607131, -0.7855887, -2.185891, 1, 1, 1, 1, 1,
-1.601493, -0.1300312, -1.883799, 1, 1, 1, 1, 1,
-1.600864, -1.538691, -3.085934, 1, 1, 1, 1, 1,
-1.592534, 0.7109075, -2.799294, 1, 1, 1, 1, 1,
-1.591062, 0.7603295, -2.756145, 0, 0, 1, 1, 1,
-1.575276, -0.2374622, -3.211755, 1, 0, 0, 1, 1,
-1.556405, -1.970337, -2.836754, 1, 0, 0, 1, 1,
-1.553155, 1.012776, -0.4843162, 1, 0, 0, 1, 1,
-1.550265, 0.3730209, -1.105109, 1, 0, 0, 1, 1,
-1.5426, 1.312673, -0.7722403, 1, 0, 0, 1, 1,
-1.541981, 1.376309, -1.713144, 0, 0, 0, 1, 1,
-1.526693, -0.2300367, -0.7409096, 0, 0, 0, 1, 1,
-1.525486, 1.357535, -0.0563121, 0, 0, 0, 1, 1,
-1.520149, 0.09574191, -1.130443, 0, 0, 0, 1, 1,
-1.519633, 0.6290421, -2.067412, 0, 0, 0, 1, 1,
-1.507386, 0.01644848, -2.371528, 0, 0, 0, 1, 1,
-1.505616, -0.1152719, -1.559153, 0, 0, 0, 1, 1,
-1.50455, 1.052405, -1.13641, 1, 1, 1, 1, 1,
-1.50417, -1.200851, -2.751243, 1, 1, 1, 1, 1,
-1.495603, -0.1689325, -1.823787, 1, 1, 1, 1, 1,
-1.487597, -0.6884143, -0.907254, 1, 1, 1, 1, 1,
-1.480987, 0.2912341, -1.530681, 1, 1, 1, 1, 1,
-1.467383, -0.5830222, -2.440552, 1, 1, 1, 1, 1,
-1.454254, -0.2937147, -2.913071, 1, 1, 1, 1, 1,
-1.448978, 2.255526, -1.094723, 1, 1, 1, 1, 1,
-1.428103, -0.7365501, -1.552878, 1, 1, 1, 1, 1,
-1.426933, 0.3387079, -2.346463, 1, 1, 1, 1, 1,
-1.383975, -1.483143, -2.534248, 1, 1, 1, 1, 1,
-1.370934, -0.7190071, -0.4632768, 1, 1, 1, 1, 1,
-1.363299, 1.712038, -1.663339, 1, 1, 1, 1, 1,
-1.363099, -0.05635313, -1.737918, 1, 1, 1, 1, 1,
-1.344284, 0.001774288, -0.5253903, 1, 1, 1, 1, 1,
-1.326124, -0.1172649, -3.803871, 0, 0, 1, 1, 1,
-1.309218, 0.6494945, -0.6298289, 1, 0, 0, 1, 1,
-1.308355, -0.110739, -1.037393, 1, 0, 0, 1, 1,
-1.299252, -0.004479905, -2.529344, 1, 0, 0, 1, 1,
-1.285573, 1.327478, -1.397732, 1, 0, 0, 1, 1,
-1.282504, -0.4717254, -1.85098, 1, 0, 0, 1, 1,
-1.282166, 1.026805, -1.051222, 0, 0, 0, 1, 1,
-1.280772, -1.046355, -2.742032, 0, 0, 0, 1, 1,
-1.27863, -0.5019719, -0.2127316, 0, 0, 0, 1, 1,
-1.275285, -0.796565, -3.122204, 0, 0, 0, 1, 1,
-1.267737, -1.232526, -2.075459, 0, 0, 0, 1, 1,
-1.264566, -0.3476415, -3.889433, 0, 0, 0, 1, 1,
-1.259983, -1.471703, -2.614306, 0, 0, 0, 1, 1,
-1.254409, 0.3616703, 0.5694264, 1, 1, 1, 1, 1,
-1.238501, 0.6559623, -1.273255, 1, 1, 1, 1, 1,
-1.232174, 2.114467, 0.7123814, 1, 1, 1, 1, 1,
-1.224584, -0.1259649, -0.4229741, 1, 1, 1, 1, 1,
-1.213723, -0.697482, -3.222098, 1, 1, 1, 1, 1,
-1.211012, -0.9012489, -1.2326, 1, 1, 1, 1, 1,
-1.208372, 0.6067896, -0.4389922, 1, 1, 1, 1, 1,
-1.208171, -0.8148326, -2.255881, 1, 1, 1, 1, 1,
-1.203947, -1.337464, -1.382611, 1, 1, 1, 1, 1,
-1.194988, 1.256497, -1.199901, 1, 1, 1, 1, 1,
-1.154455, 0.8756595, -0.5165027, 1, 1, 1, 1, 1,
-1.153672, -0.5335765, -1.61564, 1, 1, 1, 1, 1,
-1.145887, 1.350149, -1.127747, 1, 1, 1, 1, 1,
-1.144011, 0.850733, -2.951891, 1, 1, 1, 1, 1,
-1.143216, 1.160338, -1.233754, 1, 1, 1, 1, 1,
-1.132592, -1.641021, -3.835237, 0, 0, 1, 1, 1,
-1.131494, -1.601702, -3.594408, 1, 0, 0, 1, 1,
-1.126713, 0.196606, -3.375698, 1, 0, 0, 1, 1,
-1.122435, -0.2874461, -1.416385, 1, 0, 0, 1, 1,
-1.122348, 0.8801239, -0.6184045, 1, 0, 0, 1, 1,
-1.121437, -0.6076965, -0.3071576, 1, 0, 0, 1, 1,
-1.119298, -0.8592388, -0.8852856, 0, 0, 0, 1, 1,
-1.118971, 0.5586876, -2.29916, 0, 0, 0, 1, 1,
-1.118223, -1.466649, -3.110235, 0, 0, 0, 1, 1,
-1.113358, -0.8117152, -1.832653, 0, 0, 0, 1, 1,
-1.109394, 0.8363728, -2.072193, 0, 0, 0, 1, 1,
-1.108945, -1.500987, -2.954244, 0, 0, 0, 1, 1,
-1.091287, -0.1718205, -0.9916959, 0, 0, 0, 1, 1,
-1.083477, -0.7901011, -0.2975627, 1, 1, 1, 1, 1,
-1.073261, 0.6237847, -1.046128, 1, 1, 1, 1, 1,
-1.072122, -0.9160432, -2.447975, 1, 1, 1, 1, 1,
-1.069331, -0.1033995, -2.614227, 1, 1, 1, 1, 1,
-1.056732, 0.0946511, -1.063344, 1, 1, 1, 1, 1,
-1.050483, -0.377422, -2.048976, 1, 1, 1, 1, 1,
-1.049701, 0.8192457, 0.2471688, 1, 1, 1, 1, 1,
-1.045246, 0.9604908, -1.248866, 1, 1, 1, 1, 1,
-1.04332, 0.01360522, -1.708868, 1, 1, 1, 1, 1,
-1.039863, -0.1744253, -2.878815, 1, 1, 1, 1, 1,
-1.031845, -0.8175619, -1.950363, 1, 1, 1, 1, 1,
-1.028028, -1.259999, -0.647806, 1, 1, 1, 1, 1,
-1.021721, 0.8081371, 0.141187, 1, 1, 1, 1, 1,
-1.020842, 1.163068, -0.7290931, 1, 1, 1, 1, 1,
-1.017713, -0.3300005, -3.024059, 1, 1, 1, 1, 1,
-1.012068, -1.243424, -4.391002, 0, 0, 1, 1, 1,
-1.00952, 1.318469, 0.2865066, 1, 0, 0, 1, 1,
-1.008325, 0.5919002, -1.134125, 1, 0, 0, 1, 1,
-1.005617, -0.7610333, -2.898799, 1, 0, 0, 1, 1,
-1.000256, -0.6420325, -1.158791, 1, 0, 0, 1, 1,
-0.99824, 2.149353, -1.020303, 1, 0, 0, 1, 1,
-0.9954969, 1.513065, -0.3511732, 0, 0, 0, 1, 1,
-0.9950213, -0.07308355, -2.017375, 0, 0, 0, 1, 1,
-0.9832549, -0.6534331, -0.9755235, 0, 0, 0, 1, 1,
-0.9819845, 0.345526, -1.303184, 0, 0, 0, 1, 1,
-0.9778954, 1.934024, -2.023965, 0, 0, 0, 1, 1,
-0.9736686, -1.586217, -2.488105, 0, 0, 0, 1, 1,
-0.9707935, 0.2677561, -0.01632713, 0, 0, 0, 1, 1,
-0.9706542, -0.1036677, -1.725277, 1, 1, 1, 1, 1,
-0.9679486, -0.9196481, -3.556951, 1, 1, 1, 1, 1,
-0.9668464, 0.8429207, -0.08949563, 1, 1, 1, 1, 1,
-0.9566245, 0.6637722, 0.8798051, 1, 1, 1, 1, 1,
-0.9525735, 0.8318542, -0.8301373, 1, 1, 1, 1, 1,
-0.9493052, -1.250269, -2.598824, 1, 1, 1, 1, 1,
-0.9387366, 0.6261716, -2.081768, 1, 1, 1, 1, 1,
-0.9363465, -1.794884, -0.9433714, 1, 1, 1, 1, 1,
-0.9346017, -0.6371958, -1.322999, 1, 1, 1, 1, 1,
-0.9306682, -0.2841478, -0.5149974, 1, 1, 1, 1, 1,
-0.9256436, 0.7028904, -0.7443303, 1, 1, 1, 1, 1,
-0.9229202, 0.171592, -2.089162, 1, 1, 1, 1, 1,
-0.9221699, -0.6170418, -1.230211, 1, 1, 1, 1, 1,
-0.915798, -0.4682583, -1.489522, 1, 1, 1, 1, 1,
-0.9127524, 0.5741627, -1.873274, 1, 1, 1, 1, 1,
-0.9042425, 0.2003634, -1.331067, 0, 0, 1, 1, 1,
-0.901196, 0.2803663, -1.776936, 1, 0, 0, 1, 1,
-0.8985993, -1.348151, -2.708179, 1, 0, 0, 1, 1,
-0.8963786, 0.3807723, -0.90745, 1, 0, 0, 1, 1,
-0.8891377, -1.321291, -0.6908873, 1, 0, 0, 1, 1,
-0.8877816, -1.230754, -3.876997, 1, 0, 0, 1, 1,
-0.8839588, 0.07490455, -0.5115286, 0, 0, 0, 1, 1,
-0.8675508, -0.5250373, -1.812485, 0, 0, 0, 1, 1,
-0.8637577, -0.1563599, -2.729335, 0, 0, 0, 1, 1,
-0.8635156, -1.244478, -1.248461, 0, 0, 0, 1, 1,
-0.8632059, 0.7485056, -0.7615737, 0, 0, 0, 1, 1,
-0.8629059, 0.7232838, -2.196264, 0, 0, 0, 1, 1,
-0.8596758, 1.592234, -0.592774, 0, 0, 0, 1, 1,
-0.8491526, 2.289247, -0.6508375, 1, 1, 1, 1, 1,
-0.8488231, 0.2924969, -1.878691, 1, 1, 1, 1, 1,
-0.845472, -0.6109124, -1.174434, 1, 1, 1, 1, 1,
-0.8452495, 0.3495055, -1.081858, 1, 1, 1, 1, 1,
-0.8443135, 0.2685133, -1.504998, 1, 1, 1, 1, 1,
-0.8436764, -1.409755, -2.379783, 1, 1, 1, 1, 1,
-0.8419685, 0.9326822, -0.9230675, 1, 1, 1, 1, 1,
-0.8380492, 0.4269523, -2.310532, 1, 1, 1, 1, 1,
-0.8341447, -0.1476767, -1.960971, 1, 1, 1, 1, 1,
-0.8299991, 0.7481238, -1.190857, 1, 1, 1, 1, 1,
-0.8213466, -0.4422681, -0.5962481, 1, 1, 1, 1, 1,
-0.8177994, 0.9427593, -1.10731, 1, 1, 1, 1, 1,
-0.8159337, 0.7014699, -1.189588, 1, 1, 1, 1, 1,
-0.8131639, -2.167793, -3.685935, 1, 1, 1, 1, 1,
-0.8062449, 0.3277537, 0.2577725, 1, 1, 1, 1, 1,
-0.8051218, -1.405609, -2.652715, 0, 0, 1, 1, 1,
-0.7959774, 0.8103102, -2.574246, 1, 0, 0, 1, 1,
-0.7897572, -0.6229962, -2.620458, 1, 0, 0, 1, 1,
-0.7886717, -1.497663, -1.379509, 1, 0, 0, 1, 1,
-0.787484, -2.234797, -3.756268, 1, 0, 0, 1, 1,
-0.7869214, -1.598289, -3.772032, 1, 0, 0, 1, 1,
-0.7847803, -1.746036, -1.162744, 0, 0, 0, 1, 1,
-0.7843261, -1.642495, -2.286589, 0, 0, 0, 1, 1,
-0.7836069, 1.186592, -1.316763, 0, 0, 0, 1, 1,
-0.7827252, 1.098473, 0.2943774, 0, 0, 0, 1, 1,
-0.780702, 0.02180322, -0.8450484, 0, 0, 0, 1, 1,
-0.7782749, 0.2868839, -0.9028738, 0, 0, 0, 1, 1,
-0.7778012, 0.380927, -1.889198, 0, 0, 0, 1, 1,
-0.7733614, 0.01434913, -0.140107, 1, 1, 1, 1, 1,
-0.7698876, 0.174412, -1.705897, 1, 1, 1, 1, 1,
-0.7695255, 1.187588, 0.1777226, 1, 1, 1, 1, 1,
-0.7687977, 0.927437, -0.3761729, 1, 1, 1, 1, 1,
-0.7668588, -1.532636, -2.266826, 1, 1, 1, 1, 1,
-0.7638333, 2.006319, -2.77198, 1, 1, 1, 1, 1,
-0.7634284, -0.6778862, -1.574051, 1, 1, 1, 1, 1,
-0.7539194, -1.203093, -3.405835, 1, 1, 1, 1, 1,
-0.7494559, -0.5012271, -0.5444091, 1, 1, 1, 1, 1,
-0.74721, -0.2231651, -2.025555, 1, 1, 1, 1, 1,
-0.7464159, 1.150434, 0.3420782, 1, 1, 1, 1, 1,
-0.7381137, -0.4468408, -2.255245, 1, 1, 1, 1, 1,
-0.7350475, -0.06276978, -1.296132, 1, 1, 1, 1, 1,
-0.7347251, 0.1888755, -0.8181928, 1, 1, 1, 1, 1,
-0.7335483, 1.714147, -0.5932757, 1, 1, 1, 1, 1,
-0.7192519, -1.921216, -3.264143, 0, 0, 1, 1, 1,
-0.7189927, 0.3744984, -0.1080492, 1, 0, 0, 1, 1,
-0.7184481, -0.7691439, -1.767062, 1, 0, 0, 1, 1,
-0.7162674, -0.8686469, -2.912333, 1, 0, 0, 1, 1,
-0.715596, -2.72801, -2.581887, 1, 0, 0, 1, 1,
-0.7145734, 0.0552296, -0.1195943, 1, 0, 0, 1, 1,
-0.7109659, 0.2642994, -0.4590417, 0, 0, 0, 1, 1,
-0.7077789, 0.4118593, -1.068697, 0, 0, 0, 1, 1,
-0.7009515, -0.8612163, -1.928817, 0, 0, 0, 1, 1,
-0.7004505, -0.258731, -2.119876, 0, 0, 0, 1, 1,
-0.6989756, 1.744241, 0.1435118, 0, 0, 0, 1, 1,
-0.6927566, -1.937678, -5.093711, 0, 0, 0, 1, 1,
-0.6906963, 0.1544752, -1.935039, 0, 0, 0, 1, 1,
-0.6903055, 0.0009850237, -0.6885363, 1, 1, 1, 1, 1,
-0.6884443, -0.4033298, -4.109799, 1, 1, 1, 1, 1,
-0.6884321, 0.03996918, -3.012411, 1, 1, 1, 1, 1,
-0.6879848, 0.6427503, 0.4131346, 1, 1, 1, 1, 1,
-0.6847514, -1.819975, -1.22593, 1, 1, 1, 1, 1,
-0.6833239, -1.792043, -2.664412, 1, 1, 1, 1, 1,
-0.6820015, -0.1526073, -2.009618, 1, 1, 1, 1, 1,
-0.6780044, 0.003367159, -0.3975394, 1, 1, 1, 1, 1,
-0.6728384, -2.604903, -3.781223, 1, 1, 1, 1, 1,
-0.6698527, -0.4641462, -2.599899, 1, 1, 1, 1, 1,
-0.6696404, 0.7621989, -0.2025007, 1, 1, 1, 1, 1,
-0.669314, 1.084571, 0.09448675, 1, 1, 1, 1, 1,
-0.6563303, -1.267716, -2.445438, 1, 1, 1, 1, 1,
-0.6554576, 0.5070494, -1.496004, 1, 1, 1, 1, 1,
-0.6521948, -2.322809, -2.800038, 1, 1, 1, 1, 1,
-0.6499925, -0.9124021, -3.865395, 0, 0, 1, 1, 1,
-0.6469199, -0.9245553, -3.203511, 1, 0, 0, 1, 1,
-0.6430058, -0.4164702, -2.2101, 1, 0, 0, 1, 1,
-0.6421579, -0.6985718, -2.198458, 1, 0, 0, 1, 1,
-0.6410989, -0.3135536, -3.483788, 1, 0, 0, 1, 1,
-0.635245, 0.3533383, -0.07831682, 1, 0, 0, 1, 1,
-0.6313809, -1.029435, -4.133894, 0, 0, 0, 1, 1,
-0.629207, 0.4124236, -0.5811725, 0, 0, 0, 1, 1,
-0.6278595, 1.640286, 0.2808895, 0, 0, 0, 1, 1,
-0.623837, 1.298574, -0.3988606, 0, 0, 0, 1, 1,
-0.622725, -1.873888, -2.829507, 0, 0, 0, 1, 1,
-0.6214076, 0.5919244, -1.320882, 0, 0, 0, 1, 1,
-0.618295, -0.7208382, -2.679402, 0, 0, 0, 1, 1,
-0.6117629, -0.0001109022, -3.890757, 1, 1, 1, 1, 1,
-0.6090397, -1.104593, -3.025545, 1, 1, 1, 1, 1,
-0.5930042, 0.5275819, 0.2721361, 1, 1, 1, 1, 1,
-0.592818, -0.1156256, -0.4800585, 1, 1, 1, 1, 1,
-0.5927839, 1.739012, -0.7857562, 1, 1, 1, 1, 1,
-0.5917648, -1.317968, -3.384314, 1, 1, 1, 1, 1,
-0.5910445, -0.7260433, -2.041564, 1, 1, 1, 1, 1,
-0.5910332, -0.7408498, -0.3186634, 1, 1, 1, 1, 1,
-0.5907645, -0.8553517, -1.50349, 1, 1, 1, 1, 1,
-0.5905212, 0.3954451, -0.2552677, 1, 1, 1, 1, 1,
-0.5897403, 0.3536028, -0.7115427, 1, 1, 1, 1, 1,
-0.5844582, -1.326407, -2.907118, 1, 1, 1, 1, 1,
-0.583721, 1.988948, -0.2781156, 1, 1, 1, 1, 1,
-0.5813686, -0.9358831, -0.6518725, 1, 1, 1, 1, 1,
-0.5779408, 0.6608522, 0.01081861, 1, 1, 1, 1, 1,
-0.5750616, 0.4682249, -2.354999, 0, 0, 1, 1, 1,
-0.5736176, -0.9520407, -0.5785345, 1, 0, 0, 1, 1,
-0.5729048, -0.2023615, -1.555963, 1, 0, 0, 1, 1,
-0.572492, -0.8940328, -5.221514, 1, 0, 0, 1, 1,
-0.5656073, 0.002492187, -2.408134, 1, 0, 0, 1, 1,
-0.5653943, -0.8183677, -1.485484, 1, 0, 0, 1, 1,
-0.5615053, 0.4172674, -1.076687, 0, 0, 0, 1, 1,
-0.5598564, 1.061157, -1.671361, 0, 0, 0, 1, 1,
-0.5521526, -0.05069597, -0.6391851, 0, 0, 0, 1, 1,
-0.5478063, 1.253683, -0.1767384, 0, 0, 0, 1, 1,
-0.5467996, -0.8531784, -2.889527, 0, 0, 0, 1, 1,
-0.5441942, 1.274525, 0.02212206, 0, 0, 0, 1, 1,
-0.5380766, 0.1801677, -0.9429322, 0, 0, 0, 1, 1,
-0.5374625, -1.478625, -3.385162, 1, 1, 1, 1, 1,
-0.5310747, 1.165182, -0.5444847, 1, 1, 1, 1, 1,
-0.5281228, 0.04460859, -0.5054964, 1, 1, 1, 1, 1,
-0.526545, 0.5494487, -1.315704, 1, 1, 1, 1, 1,
-0.5250517, 0.2501998, -1.215814, 1, 1, 1, 1, 1,
-0.524138, -1.858694, -5.766303, 1, 1, 1, 1, 1,
-0.5236473, -1.996555, -3.013098, 1, 1, 1, 1, 1,
-0.5160815, -0.7909075, -1.457464, 1, 1, 1, 1, 1,
-0.5130017, 0.02056819, -1.695398, 1, 1, 1, 1, 1,
-0.5096284, 0.1179519, -1.922105, 1, 1, 1, 1, 1,
-0.5085323, -0.0523151, -1.179782, 1, 1, 1, 1, 1,
-0.5023362, -0.2490054, -1.295622, 1, 1, 1, 1, 1,
-0.500043, 1.405824, -0.5896576, 1, 1, 1, 1, 1,
-0.497787, 1.779198, 0.1944285, 1, 1, 1, 1, 1,
-0.489522, -1.191472, -3.625481, 1, 1, 1, 1, 1,
-0.4889055, -1.062259, -0.8878122, 0, 0, 1, 1, 1,
-0.4774994, -0.8712527, -1.413769, 1, 0, 0, 1, 1,
-0.4746695, -1.795781, -1.487092, 1, 0, 0, 1, 1,
-0.47449, 0.788532, -0.439735, 1, 0, 0, 1, 1,
-0.4727319, 0.5115996, -0.8172218, 1, 0, 0, 1, 1,
-0.4668089, 0.4807755, 0.3628673, 1, 0, 0, 1, 1,
-0.4652147, 0.3488137, -0.8339465, 0, 0, 0, 1, 1,
-0.4650228, 0.8438744, -1.535593, 0, 0, 0, 1, 1,
-0.4632343, -0.4996153, -3.130406, 0, 0, 0, 1, 1,
-0.4622467, 0.09280421, -0.6464911, 0, 0, 0, 1, 1,
-0.4602556, 0.3735555, -0.9048941, 0, 0, 0, 1, 1,
-0.453248, -0.4954548, -1.875651, 0, 0, 0, 1, 1,
-0.4531072, 1.136438, -1.757602, 0, 0, 0, 1, 1,
-0.4519659, 0.3101177, -1.276362, 1, 1, 1, 1, 1,
-0.449559, -0.6156881, -4.754831, 1, 1, 1, 1, 1,
-0.4460824, 0.5239838, -1.50254, 1, 1, 1, 1, 1,
-0.4420516, -0.04336601, -2.232247, 1, 1, 1, 1, 1,
-0.4402569, -2.604405, -3.133043, 1, 1, 1, 1, 1,
-0.439739, -0.1338377, -1.724106, 1, 1, 1, 1, 1,
-0.4354822, -0.7058804, -1.303308, 1, 1, 1, 1, 1,
-0.4338294, -0.9565027, -2.91597, 1, 1, 1, 1, 1,
-0.4335634, 0.4419763, -1.377643, 1, 1, 1, 1, 1,
-0.4270152, 1.596586, 0.6031704, 1, 1, 1, 1, 1,
-0.4264199, 0.946417, -0.3152412, 1, 1, 1, 1, 1,
-0.4217466, 1.530368, -0.5165744, 1, 1, 1, 1, 1,
-0.4214011, 0.7887722, -1.568443, 1, 1, 1, 1, 1,
-0.418316, -0.01034268, -2.545958, 1, 1, 1, 1, 1,
-0.4133388, 0.7515869, 0.4845951, 1, 1, 1, 1, 1,
-0.4075947, -1.258812, -3.975268, 0, 0, 1, 1, 1,
-0.402875, -0.8463352, -1.793802, 1, 0, 0, 1, 1,
-0.4005024, -2.407268, -4.02743, 1, 0, 0, 1, 1,
-0.3992797, 0.512075, -0.7510458, 1, 0, 0, 1, 1,
-0.3975272, 0.4129265, 0.3170605, 1, 0, 0, 1, 1,
-0.3961378, 0.4770696, -1.958594, 1, 0, 0, 1, 1,
-0.395896, -1.573472, -2.941056, 0, 0, 0, 1, 1,
-0.395108, 0.7491841, -1.733234, 0, 0, 0, 1, 1,
-0.3947891, 1.002916, 1.164013, 0, 0, 0, 1, 1,
-0.39478, -0.09725085, -0.6154836, 0, 0, 0, 1, 1,
-0.3930825, -1.686434, -2.809716, 0, 0, 0, 1, 1,
-0.3904543, -0.5417504, -0.5970463, 0, 0, 0, 1, 1,
-0.3889735, 0.0428891, -1.609904, 0, 0, 0, 1, 1,
-0.3871018, 0.3540505, -0.5407088, 1, 1, 1, 1, 1,
-0.3869339, 0.5442015, -1.246643, 1, 1, 1, 1, 1,
-0.3821058, -0.2361881, -1.879511, 1, 1, 1, 1, 1,
-0.381629, 2.172046, -1.915777, 1, 1, 1, 1, 1,
-0.3761329, -0.7771292, -2.732524, 1, 1, 1, 1, 1,
-0.3706647, 0.485699, -0.4650096, 1, 1, 1, 1, 1,
-0.3704293, -1.452252, -3.739094, 1, 1, 1, 1, 1,
-0.3701434, 0.2677063, 1.154219, 1, 1, 1, 1, 1,
-0.3678939, -0.09168442, -1.86457, 1, 1, 1, 1, 1,
-0.3673583, -0.323551, -2.731885, 1, 1, 1, 1, 1,
-0.3638704, 0.10194, -2.212628, 1, 1, 1, 1, 1,
-0.3615503, -0.4545721, -1.090258, 1, 1, 1, 1, 1,
-0.3609663, 1.441943, 0.7357153, 1, 1, 1, 1, 1,
-0.359906, -1.178495, -2.702177, 1, 1, 1, 1, 1,
-0.357756, 0.5807757, 0.5718998, 1, 1, 1, 1, 1,
-0.3565142, 2.297251, 0.4250742, 0, 0, 1, 1, 1,
-0.3563313, 0.1692702, -1.14358, 1, 0, 0, 1, 1,
-0.3557876, 1.281528, 0.4023843, 1, 0, 0, 1, 1,
-0.3554879, 0.5018653, -1.465868, 1, 0, 0, 1, 1,
-0.3525668, -0.3660073, -0.7812851, 1, 0, 0, 1, 1,
-0.3524126, -1.561394, -2.395847, 1, 0, 0, 1, 1,
-0.3512074, 1.71742, -0.2611459, 0, 0, 0, 1, 1,
-0.3510425, -0.04657019, -1.390597, 0, 0, 0, 1, 1,
-0.3510309, -0.1984874, -2.380557, 0, 0, 0, 1, 1,
-0.3494424, 0.220898, 0.05837305, 0, 0, 0, 1, 1,
-0.3481486, -0.646397, -2.756532, 0, 0, 0, 1, 1,
-0.3454387, 1.881157, -0.8812853, 0, 0, 0, 1, 1,
-0.3449372, -1.283585, -2.973474, 0, 0, 0, 1, 1,
-0.3411708, -0.1448849, -0.9005177, 1, 1, 1, 1, 1,
-0.3401919, 0.5148212, 0.1223476, 1, 1, 1, 1, 1,
-0.3310102, 0.5842602, 0.6861633, 1, 1, 1, 1, 1,
-0.3243503, -1.013849, -2.670288, 1, 1, 1, 1, 1,
-0.3234011, -1.42215, -2.245528, 1, 1, 1, 1, 1,
-0.3200383, 0.752055, -0.9347135, 1, 1, 1, 1, 1,
-0.312702, 0.4251783, -2.20189, 1, 1, 1, 1, 1,
-0.311566, -1.798622, -4.385817, 1, 1, 1, 1, 1,
-0.3103249, 0.4841286, -0.03151152, 1, 1, 1, 1, 1,
-0.3072867, 3.298287, -2.601035, 1, 1, 1, 1, 1,
-0.3014155, 0.6113539, 1.499943, 1, 1, 1, 1, 1,
-0.2989532, 0.9972871, 0.2177673, 1, 1, 1, 1, 1,
-0.2976333, -2.129638, -2.69791, 1, 1, 1, 1, 1,
-0.2941155, -1.45231, -2.465479, 1, 1, 1, 1, 1,
-0.2936706, 1.579282, -0.04244635, 1, 1, 1, 1, 1,
-0.2913179, -0.7772357, -2.487898, 0, 0, 1, 1, 1,
-0.289429, 0.2309269, -0.3530372, 1, 0, 0, 1, 1,
-0.2865382, 0.05216071, -0.5782432, 1, 0, 0, 1, 1,
-0.2855757, -0.1984776, -2.696108, 1, 0, 0, 1, 1,
-0.2849089, -1.572595, -2.08538, 1, 0, 0, 1, 1,
-0.2847088, -1.037712, -4.14202, 1, 0, 0, 1, 1,
-0.2843257, 1.113135, 0.7081786, 0, 0, 0, 1, 1,
-0.2822935, 0.8418227, -1.10354, 0, 0, 0, 1, 1,
-0.2820702, -0.1136417, -2.02395, 0, 0, 0, 1, 1,
-0.2812872, 1.127188, -0.2414517, 0, 0, 0, 1, 1,
-0.2785419, -0.6383108, -2.507667, 0, 0, 0, 1, 1,
-0.2745847, -0.7259938, -1.174195, 0, 0, 0, 1, 1,
-0.2712888, -0.1057651, -2.014158, 0, 0, 0, 1, 1,
-0.2703948, 2.378392, -0.09707092, 1, 1, 1, 1, 1,
-0.2698829, -0.5192813, -2.276471, 1, 1, 1, 1, 1,
-0.2665576, 0.7533419, 0.9406627, 1, 1, 1, 1, 1,
-0.2653826, 0.7044654, -0.1189972, 1, 1, 1, 1, 1,
-0.2650753, -1.013789, -1.915717, 1, 1, 1, 1, 1,
-0.2620419, -1.063199, -2.270988, 1, 1, 1, 1, 1,
-0.2607709, -0.06493513, -1.296673, 1, 1, 1, 1, 1,
-0.2593142, -0.2281798, -2.878979, 1, 1, 1, 1, 1,
-0.2591809, 0.215552, -1.199286, 1, 1, 1, 1, 1,
-0.2557105, -1.936821, -3.097531, 1, 1, 1, 1, 1,
-0.2539279, -1.75589, -4.615336, 1, 1, 1, 1, 1,
-0.2522714, 0.5510778, -0.3739876, 1, 1, 1, 1, 1,
-0.2494392, 0.05225078, -1.822848, 1, 1, 1, 1, 1,
-0.2491514, -0.3297049, -1.682754, 1, 1, 1, 1, 1,
-0.240125, -0.8954467, -2.166418, 1, 1, 1, 1, 1,
-0.2387084, -1.669828, -0.9370416, 0, 0, 1, 1, 1,
-0.2356156, -0.228703, -2.884689, 1, 0, 0, 1, 1,
-0.2331603, 0.639003, -0.7813699, 1, 0, 0, 1, 1,
-0.2324556, 1.230013, -0.7113757, 1, 0, 0, 1, 1,
-0.2324346, 0.4675306, -0.03543038, 1, 0, 0, 1, 1,
-0.2318399, 1.953816, -1.58522, 1, 0, 0, 1, 1,
-0.23068, 0.3473621, -0.4902374, 0, 0, 0, 1, 1,
-0.2279178, 0.1253558, -3.101829, 0, 0, 0, 1, 1,
-0.2254574, -0.4590668, -2.577094, 0, 0, 0, 1, 1,
-0.2180382, 1.460005, -0.7284839, 0, 0, 0, 1, 1,
-0.2154602, 0.9285747, -0.6963987, 0, 0, 0, 1, 1,
-0.2133499, 0.1755681, -0.2142043, 0, 0, 0, 1, 1,
-0.2131633, -0.3100866, -3.147998, 0, 0, 0, 1, 1,
-0.2118231, -0.6201065, -0.8895219, 1, 1, 1, 1, 1,
-0.2087524, 0.5862916, 1.042874, 1, 1, 1, 1, 1,
-0.2085961, -2.03532, -2.109964, 1, 1, 1, 1, 1,
-0.2079235, 1.777175, -0.2522431, 1, 1, 1, 1, 1,
-0.206117, -0.6727893, -2.286949, 1, 1, 1, 1, 1,
-0.2041866, 0.5336225, -0.8179817, 1, 1, 1, 1, 1,
-0.2023585, -0.7304206, -0.403928, 1, 1, 1, 1, 1,
-0.1996231, -0.5235136, -2.335384, 1, 1, 1, 1, 1,
-0.1988203, 0.649139, -0.4156195, 1, 1, 1, 1, 1,
-0.1967263, -1.688802, -4.500277, 1, 1, 1, 1, 1,
-0.1965497, 2.11354, 1.608124, 1, 1, 1, 1, 1,
-0.1920601, 0.4018019, -0.514917, 1, 1, 1, 1, 1,
-0.1886678, -1.616038, -4.254615, 1, 1, 1, 1, 1,
-0.1884846, -0.6786733, -1.76402, 1, 1, 1, 1, 1,
-0.1862164, 1.334118, 1.135795, 1, 1, 1, 1, 1,
-0.1841883, -0.117985, -1.536355, 0, 0, 1, 1, 1,
-0.1807365, -0.02605987, -0.9309518, 1, 0, 0, 1, 1,
-0.1791052, 0.1927653, -0.7434426, 1, 0, 0, 1, 1,
-0.1781028, 1.604084, 1.014108, 1, 0, 0, 1, 1,
-0.1780669, 1.280149, 0.9023524, 1, 0, 0, 1, 1,
-0.1742721, -0.2718063, -2.449183, 1, 0, 0, 1, 1,
-0.1674633, -1.257973, -4.789864, 0, 0, 0, 1, 1,
-0.1654528, -0.2603059, -5.502146, 0, 0, 0, 1, 1,
-0.1600093, -0.6044114, -2.398036, 0, 0, 0, 1, 1,
-0.1587794, -1.533412, -3.297837, 0, 0, 0, 1, 1,
-0.1586472, 0.562414, -0.1599578, 0, 0, 0, 1, 1,
-0.1554086, 0.4325107, -0.852231, 0, 0, 0, 1, 1,
-0.152725, -0.2477215, -1.525278, 0, 0, 0, 1, 1,
-0.1522726, -0.6711193, -3.1548, 1, 1, 1, 1, 1,
-0.1516603, -1.559388, -1.878848, 1, 1, 1, 1, 1,
-0.1480193, -0.358868, -3.57638, 1, 1, 1, 1, 1,
-0.1474601, -1.09554, -4.805488, 1, 1, 1, 1, 1,
-0.1471781, -0.6182946, -2.296983, 1, 1, 1, 1, 1,
-0.1458616, -1.477948, -1.760739, 1, 1, 1, 1, 1,
-0.1387103, -1.950735, -4.284897, 1, 1, 1, 1, 1,
-0.1358843, 0.2620313, -0.6214749, 1, 1, 1, 1, 1,
-0.1339099, -1.010378, -3.418608, 1, 1, 1, 1, 1,
-0.1337817, 0.3639197, -0.2286547, 1, 1, 1, 1, 1,
-0.1331857, 0.523655, -0.5013466, 1, 1, 1, 1, 1,
-0.1324084, 1.875235, -0.3284693, 1, 1, 1, 1, 1,
-0.1303792, 0.2511618, 0.8342175, 1, 1, 1, 1, 1,
-0.1299536, -1.495392, -2.332767, 1, 1, 1, 1, 1,
-0.1296259, -0.664013, -4.714998, 1, 1, 1, 1, 1,
-0.1281997, -0.7753571, -3.639516, 0, 0, 1, 1, 1,
-0.1246185, 1.041297, -0.9665985, 1, 0, 0, 1, 1,
-0.1210341, -1.370109, -2.444751, 1, 0, 0, 1, 1,
-0.1168246, 0.3758413, -1.52258, 1, 0, 0, 1, 1,
-0.1161274, -0.766289, -3.074865, 1, 0, 0, 1, 1,
-0.1159671, 0.656222, 0.4205905, 1, 0, 0, 1, 1,
-0.1158412, 0.4637606, 0.06196075, 0, 0, 0, 1, 1,
-0.1102358, -0.169639, -3.094541, 0, 0, 0, 1, 1,
-0.106468, 0.5335686, -0.1443263, 0, 0, 0, 1, 1,
-0.1044339, -0.4461804, -0.8369597, 0, 0, 0, 1, 1,
-0.09203368, 2.714636, -0.9987502, 0, 0, 0, 1, 1,
-0.08357087, 0.6571634, 1.031556, 0, 0, 0, 1, 1,
-0.08029851, -0.1498142, -2.18051, 0, 0, 0, 1, 1,
-0.07540372, 0.9844378, 0.7417128, 1, 1, 1, 1, 1,
-0.07469145, 0.1970882, 2.148998, 1, 1, 1, 1, 1,
-0.07410448, -0.4953829, -3.865654, 1, 1, 1, 1, 1,
-0.07175443, -0.3019567, -2.198579, 1, 1, 1, 1, 1,
-0.07012448, -0.6855179, -2.809294, 1, 1, 1, 1, 1,
-0.06994515, 0.1129832, -2.136149, 1, 1, 1, 1, 1,
-0.06885506, -0.4064726, -2.597937, 1, 1, 1, 1, 1,
-0.06393818, 1.245307, 1.440798, 1, 1, 1, 1, 1,
-0.06349503, -1.014867, -3.11696, 1, 1, 1, 1, 1,
-0.05925008, -0.8599457, -0.9064444, 1, 1, 1, 1, 1,
-0.05839489, 0.6130012, -0.05734999, 1, 1, 1, 1, 1,
-0.05801622, 1.269165, -2.126348, 1, 1, 1, 1, 1,
-0.04092943, -1.170721, -2.188338, 1, 1, 1, 1, 1,
-0.04015437, -1.297295, -3.217718, 1, 1, 1, 1, 1,
-0.03840103, 1.442804, -0.325537, 1, 1, 1, 1, 1,
-0.03808541, 0.4311429, -0.979367, 0, 0, 1, 1, 1,
-0.03764012, -0.4174861, -1.265208, 1, 0, 0, 1, 1,
-0.03689468, -0.07782912, -2.044156, 1, 0, 0, 1, 1,
-0.03679171, 0.9727401, -1.080709, 1, 0, 0, 1, 1,
-0.03531148, 0.192412, 0.4492473, 1, 0, 0, 1, 1,
-0.03476236, 0.6287221, 0.3946613, 1, 0, 0, 1, 1,
-0.03007269, -0.3283345, -2.301118, 0, 0, 0, 1, 1,
-0.02403202, 1.224235, 1.351328, 0, 0, 0, 1, 1,
-0.02364634, 1.629772, -0.01734246, 0, 0, 0, 1, 1,
-0.01636678, 0.3476573, 1.251949, 0, 0, 0, 1, 1,
-0.0150422, 0.2812273, -0.0707036, 0, 0, 0, 1, 1,
-0.009203533, -0.5841648, -3.761087, 0, 0, 0, 1, 1,
-0.00402991, 2.744914, 0.1754497, 0, 0, 0, 1, 1,
-0.003319862, 0.5860391, 1.085419, 1, 1, 1, 1, 1,
-0.001393177, -0.8120208, -1.098477, 1, 1, 1, 1, 1,
0.0006089545, 0.05973915, -0.998597, 1, 1, 1, 1, 1,
0.0007699676, -0.4385301, 3.557296, 1, 1, 1, 1, 1,
0.006140217, -0.1081923, 2.855239, 1, 1, 1, 1, 1,
0.00967365, 0.3751673, 2.198571, 1, 1, 1, 1, 1,
0.009831106, -0.4686629, 2.775326, 1, 1, 1, 1, 1,
0.01105065, -0.8109102, 2.707247, 1, 1, 1, 1, 1,
0.01313538, 1.53914, -0.5977951, 1, 1, 1, 1, 1,
0.02054647, 0.1358902, -0.9371942, 1, 1, 1, 1, 1,
0.02094544, 1.123085, -0.0100707, 1, 1, 1, 1, 1,
0.02103972, -0.06819732, 2.266871, 1, 1, 1, 1, 1,
0.02249478, 0.2693598, 0.002064167, 1, 1, 1, 1, 1,
0.02405586, 0.035641, 0.1667903, 1, 1, 1, 1, 1,
0.0291853, -0.3639297, 1.394963, 1, 1, 1, 1, 1,
0.02929753, 0.6061392, 0.7226678, 0, 0, 1, 1, 1,
0.03065117, 0.02979828, 0.6101135, 1, 0, 0, 1, 1,
0.03430589, -0.5087238, 1.782846, 1, 0, 0, 1, 1,
0.0374128, 1.202534, -0.007644375, 1, 0, 0, 1, 1,
0.03949707, 0.4676605, 0.1110799, 1, 0, 0, 1, 1,
0.03969524, -0.8277102, 4.977884, 1, 0, 0, 1, 1,
0.03971298, 2.135461, 1.106297, 0, 0, 0, 1, 1,
0.043279, -1.277328, 2.777212, 0, 0, 0, 1, 1,
0.05379022, -0.7329514, 4.333628, 0, 0, 0, 1, 1,
0.06358555, -0.6376312, 3.306987, 0, 0, 0, 1, 1,
0.07280343, 0.5666177, -0.692893, 0, 0, 0, 1, 1,
0.0737354, 0.106785, -1.025547, 0, 0, 0, 1, 1,
0.0789526, -1.247099, 4.930786, 0, 0, 0, 1, 1,
0.07949241, -0.7056121, 4.218884, 1, 1, 1, 1, 1,
0.08019254, 1.73163, 0.2360352, 1, 1, 1, 1, 1,
0.08239228, 0.4314409, -0.5022734, 1, 1, 1, 1, 1,
0.08317978, 0.01636387, 1.214501, 1, 1, 1, 1, 1,
0.08348674, -0.9828055, 1.107543, 1, 1, 1, 1, 1,
0.0842977, 0.4430026, 1.472681, 1, 1, 1, 1, 1,
0.08529595, -1.78863, 2.395969, 1, 1, 1, 1, 1,
0.08543162, -0.9667623, 3.196584, 1, 1, 1, 1, 1,
0.08743881, 0.03110129, 1.231158, 1, 1, 1, 1, 1,
0.0880575, -0.4055296, 3.077821, 1, 1, 1, 1, 1,
0.08985803, 0.3173264, -0.3293227, 1, 1, 1, 1, 1,
0.09149653, 0.06408814, 0.8729883, 1, 1, 1, 1, 1,
0.09424141, 0.6373881, 1.389547, 1, 1, 1, 1, 1,
0.09585221, 0.5669919, 0.3004245, 1, 1, 1, 1, 1,
0.09674861, 0.2649985, -1.304295, 1, 1, 1, 1, 1,
0.09820408, 1.124555, 0.0009143264, 0, 0, 1, 1, 1,
0.1011738, 0.37087, -0.7430926, 1, 0, 0, 1, 1,
0.1088567, 0.007049448, 1.22605, 1, 0, 0, 1, 1,
0.1156408, 0.3169803, -1.07677, 1, 0, 0, 1, 1,
0.1166145, 0.8067634, -0.2421549, 1, 0, 0, 1, 1,
0.1186033, -1.503426, 3.788126, 1, 0, 0, 1, 1,
0.1217089, -0.03510353, 1.803244, 0, 0, 0, 1, 1,
0.1235555, 1.761437, -0.520182, 0, 0, 0, 1, 1,
0.1300226, -0.6342588, 4.471581, 0, 0, 0, 1, 1,
0.131463, 0.5223635, -2.181746, 0, 0, 0, 1, 1,
0.1335383, 1.299081, -0.6352013, 0, 0, 0, 1, 1,
0.1341902, 0.6738548, 0.7286224, 0, 0, 0, 1, 1,
0.1352531, 0.3208818, 0.4775768, 0, 0, 0, 1, 1,
0.1372977, -0.693081, 2.002545, 1, 1, 1, 1, 1,
0.1388995, -0.3896528, 4.117971, 1, 1, 1, 1, 1,
0.1402603, 3.856363, -0.9949794, 1, 1, 1, 1, 1,
0.1413083, 0.6092259, -1.140025, 1, 1, 1, 1, 1,
0.1465767, -0.4098991, 3.330197, 1, 1, 1, 1, 1,
0.1466205, 1.800403, 0.6977716, 1, 1, 1, 1, 1,
0.1497507, 0.8645748, -2.349978, 1, 1, 1, 1, 1,
0.1504281, 1.257863, -0.9414602, 1, 1, 1, 1, 1,
0.1505138, -0.2759638, 2.666602, 1, 1, 1, 1, 1,
0.1507408, 0.6175806, 0.3498374, 1, 1, 1, 1, 1,
0.1524979, 0.2452862, -0.2869305, 1, 1, 1, 1, 1,
0.1552703, 0.5008844, -0.3560793, 1, 1, 1, 1, 1,
0.1561854, 0.4336186, -1.15411, 1, 1, 1, 1, 1,
0.1663243, -1.528307, 3.912591, 1, 1, 1, 1, 1,
0.1664826, 1.324585, -2.111006, 1, 1, 1, 1, 1,
0.1669447, 1.204101, 1.598404, 0, 0, 1, 1, 1,
0.168135, -1.236572, 1.984808, 1, 0, 0, 1, 1,
0.1745293, -0.342299, 3.710827, 1, 0, 0, 1, 1,
0.177793, -0.09512424, 1.843159, 1, 0, 0, 1, 1,
0.1834523, -1.172426, 3.791484, 1, 0, 0, 1, 1,
0.1837785, -0.3540551, 1.952374, 1, 0, 0, 1, 1,
0.1851853, -0.29025, 2.902288, 0, 0, 0, 1, 1,
0.185522, -0.6775245, 3.804988, 0, 0, 0, 1, 1,
0.1868178, 1.250308, -0.3037069, 0, 0, 0, 1, 1,
0.1899669, -2.014011, 2.988439, 0, 0, 0, 1, 1,
0.1914099, -1.671975, 3.19535, 0, 0, 0, 1, 1,
0.1917309, -0.3179308, 2.093835, 0, 0, 0, 1, 1,
0.1950866, -0.9880435, 3.625523, 0, 0, 0, 1, 1,
0.2164667, 0.6456672, -0.3542657, 1, 1, 1, 1, 1,
0.2171992, 0.2165966, 0.7063931, 1, 1, 1, 1, 1,
0.2177123, -2.007257, 3.577798, 1, 1, 1, 1, 1,
0.2179376, 0.18013, 0.4745635, 1, 1, 1, 1, 1,
0.2220919, 0.6128379, 0.7266651, 1, 1, 1, 1, 1,
0.22456, 0.3480468, 1.132627, 1, 1, 1, 1, 1,
0.2284879, -1.286274, 3.153297, 1, 1, 1, 1, 1,
0.2323119, -1.355413, 2.290535, 1, 1, 1, 1, 1,
0.2325758, 0.4878549, 0.7036405, 1, 1, 1, 1, 1,
0.2332118, -1.02334, 3.35973, 1, 1, 1, 1, 1,
0.2348786, 1.743013, -0.4520557, 1, 1, 1, 1, 1,
0.2386326, 0.02266339, 1.413346, 1, 1, 1, 1, 1,
0.2420422, -1.722348, 2.784135, 1, 1, 1, 1, 1,
0.2442466, -0.3175032, 3.235966, 1, 1, 1, 1, 1,
0.2485466, -0.2699295, 1.577215, 1, 1, 1, 1, 1,
0.2528616, 1.566736, -1.21164, 0, 0, 1, 1, 1,
0.256154, 1.357658, 0.1688069, 1, 0, 0, 1, 1,
0.2581982, -0.3113353, 3.933836, 1, 0, 0, 1, 1,
0.2584504, 0.002654693, 0.6722196, 1, 0, 0, 1, 1,
0.2632643, -0.2920181, 2.274337, 1, 0, 0, 1, 1,
0.2634313, -0.3077594, 4.177755, 1, 0, 0, 1, 1,
0.2654339, 0.5934042, -0.6576, 0, 0, 0, 1, 1,
0.2659881, 1.643265, 0.468921, 0, 0, 0, 1, 1,
0.270599, -1.17619, 3.074316, 0, 0, 0, 1, 1,
0.2724608, 0.5679598, -1.608483, 0, 0, 0, 1, 1,
0.2740831, 0.4834451, 1.583793, 0, 0, 0, 1, 1,
0.2793322, 0.9600411, -1.03827, 0, 0, 0, 1, 1,
0.2793537, 0.05690964, 0.3650056, 0, 0, 0, 1, 1,
0.2806191, -0.1918362, 1.61026, 1, 1, 1, 1, 1,
0.2823029, 0.4179141, 0.3054166, 1, 1, 1, 1, 1,
0.2827862, 0.8559623, 0.244666, 1, 1, 1, 1, 1,
0.282929, -0.0349596, 1.883721, 1, 1, 1, 1, 1,
0.2855898, -0.3676937, 1.925139, 1, 1, 1, 1, 1,
0.2947587, -2.205657, 2.835034, 1, 1, 1, 1, 1,
0.3017434, -0.8341424, 2.579885, 1, 1, 1, 1, 1,
0.3054708, 0.9200337, 0.2714279, 1, 1, 1, 1, 1,
0.3064533, -0.3208221, 1.433947, 1, 1, 1, 1, 1,
0.3091303, 1.445046, -0.00460497, 1, 1, 1, 1, 1,
0.3096562, 1.326938, -2.258944, 1, 1, 1, 1, 1,
0.3118392, 0.511636, -1.029756, 1, 1, 1, 1, 1,
0.3137726, 0.5146949, 1.573274, 1, 1, 1, 1, 1,
0.3182484, 1.324377, -0.2190337, 1, 1, 1, 1, 1,
0.3192463, -0.8374644, 2.612871, 1, 1, 1, 1, 1,
0.3196643, 1.475073, -0.9030734, 0, 0, 1, 1, 1,
0.3238997, -1.799948, 2.483623, 1, 0, 0, 1, 1,
0.3261733, -0.3538483, 1.959499, 1, 0, 0, 1, 1,
0.3339761, 2.193964, 0.1054314, 1, 0, 0, 1, 1,
0.3368746, -0.1003941, 2.775594, 1, 0, 0, 1, 1,
0.3424778, -0.6588176, 2.478008, 1, 0, 0, 1, 1,
0.3442432, 0.1463387, 0.6618978, 0, 0, 0, 1, 1,
0.3478597, -2.17786, 3.158019, 0, 0, 0, 1, 1,
0.3521475, -0.6748753, 3.209274, 0, 0, 0, 1, 1,
0.3567741, -1.146381, 2.86025, 0, 0, 0, 1, 1,
0.3617004, 0.5480291, -1.074967, 0, 0, 0, 1, 1,
0.3655138, -1.675275, 2.48761, 0, 0, 0, 1, 1,
0.3668993, 1.169891, -0.2944447, 0, 0, 0, 1, 1,
0.3763819, -0.3303992, 2.616992, 1, 1, 1, 1, 1,
0.3764212, -0.1363296, 0.8254651, 1, 1, 1, 1, 1,
0.3905617, 0.5384009, -0.5246391, 1, 1, 1, 1, 1,
0.3907388, 1.198332, 0.03116611, 1, 1, 1, 1, 1,
0.3913704, 1.807766, -1.291217, 1, 1, 1, 1, 1,
0.3985092, -0.3128524, 2.087447, 1, 1, 1, 1, 1,
0.3993114, -0.9244205, 1.632473, 1, 1, 1, 1, 1,
0.4031307, -1.659681, 1.952716, 1, 1, 1, 1, 1,
0.4042673, -1.564934, 2.563401, 1, 1, 1, 1, 1,
0.406637, -1.109713, 2.823421, 1, 1, 1, 1, 1,
0.415517, 0.07723884, 3.56298, 1, 1, 1, 1, 1,
0.4267911, -2.204536, 3.196483, 1, 1, 1, 1, 1,
0.428436, 0.55046, 1.577015, 1, 1, 1, 1, 1,
0.4293338, -0.693113, 3.668986, 1, 1, 1, 1, 1,
0.4299808, 0.4922321, 0.5640774, 1, 1, 1, 1, 1,
0.4304998, -1.095724, 3.105336, 0, 0, 1, 1, 1,
0.4326082, -0.8477284, 0.4281281, 1, 0, 0, 1, 1,
0.4404023, -1.318281, 1.284899, 1, 0, 0, 1, 1,
0.4410402, 0.07648832, 1.765907, 1, 0, 0, 1, 1,
0.4413648, -0.1691217, 2.979888, 1, 0, 0, 1, 1,
0.4460684, 0.652139, 2.315749, 1, 0, 0, 1, 1,
0.451964, 0.5286253, 2.445831, 0, 0, 0, 1, 1,
0.4541786, -0.1427442, 2.557946, 0, 0, 0, 1, 1,
0.4556353, -0.590571, 3.304545, 0, 0, 0, 1, 1,
0.4562793, -0.6113835, 1.527832, 0, 0, 0, 1, 1,
0.4572649, 1.109719, 0.1083738, 0, 0, 0, 1, 1,
0.4576896, 1.240893, 2.453971, 0, 0, 0, 1, 1,
0.4620048, 0.6326436, 1.591983, 0, 0, 0, 1, 1,
0.4654735, 0.2041552, 2.054824, 1, 1, 1, 1, 1,
0.4671512, -0.263741, 2.235458, 1, 1, 1, 1, 1,
0.4692169, -0.3568062, 2.227093, 1, 1, 1, 1, 1,
0.4718205, -0.6650096, 3.710756, 1, 1, 1, 1, 1,
0.473869, 1.095383, 1.040488, 1, 1, 1, 1, 1,
0.475279, -0.2899454, 1.704681, 1, 1, 1, 1, 1,
0.4762726, -0.2272918, 2.342963, 1, 1, 1, 1, 1,
0.4771647, -1.913167, 3.495301, 1, 1, 1, 1, 1,
0.4861002, 2.085044, 0.8779294, 1, 1, 1, 1, 1,
0.4922176, -2.024808, 3.304048, 1, 1, 1, 1, 1,
0.4946009, -1.846381, 3.239792, 1, 1, 1, 1, 1,
0.4970319, 1.345525, -1.177994, 1, 1, 1, 1, 1,
0.4982515, -0.7259575, 0.7295319, 1, 1, 1, 1, 1,
0.4990361, -0.7128547, 0.5041586, 1, 1, 1, 1, 1,
0.5011098, -1.847248, 2.666093, 1, 1, 1, 1, 1,
0.5020632, -0.01160008, 1.36352, 0, 0, 1, 1, 1,
0.5041233, 0.4850191, 0.3642387, 1, 0, 0, 1, 1,
0.5082116, -0.9213462, 2.172734, 1, 0, 0, 1, 1,
0.5086973, -0.1917105, 2.055625, 1, 0, 0, 1, 1,
0.5103748, -0.4342176, 2.620904, 1, 0, 0, 1, 1,
0.5108361, 2.688546, -0.1594701, 1, 0, 0, 1, 1,
0.5176577, -0.3431491, 2.049135, 0, 0, 0, 1, 1,
0.5317085, -0.06999108, 1.054064, 0, 0, 0, 1, 1,
0.5323816, 1.34169, 0.9497624, 0, 0, 0, 1, 1,
0.5344524, -0.7159617, 3.41989, 0, 0, 0, 1, 1,
0.5417129, 0.3591765, 0.3880327, 0, 0, 0, 1, 1,
0.5423798, 0.7128217, 0.4056213, 0, 0, 0, 1, 1,
0.5432382, 1.091992, 2.751724, 0, 0, 0, 1, 1,
0.544349, 2.157865, 1.187687, 1, 1, 1, 1, 1,
0.5454101, -0.06465281, 3.278333, 1, 1, 1, 1, 1,
0.5459104, 1.096341, 0.5961794, 1, 1, 1, 1, 1,
0.5506624, -0.4309161, 2.57795, 1, 1, 1, 1, 1,
0.5539271, -0.4537911, 2.505392, 1, 1, 1, 1, 1,
0.5546502, 0.07888067, 1.766833, 1, 1, 1, 1, 1,
0.5562721, 0.1144731, 1.952561, 1, 1, 1, 1, 1,
0.5588518, -0.9069899, 1.067831, 1, 1, 1, 1, 1,
0.5588647, 0.4421222, 2.610042, 1, 1, 1, 1, 1,
0.5604022, 0.7555678, 0.9022984, 1, 1, 1, 1, 1,
0.5664161, -1.000406, 1.202035, 1, 1, 1, 1, 1,
0.5675622, -1.598656, 2.127729, 1, 1, 1, 1, 1,
0.5677675, 0.6612175, -0.01407364, 1, 1, 1, 1, 1,
0.5711377, -0.2000433, 1.338373, 1, 1, 1, 1, 1,
0.575356, 0.8594819, -0.1698887, 1, 1, 1, 1, 1,
0.5787898, 1.025725, 0.6504807, 0, 0, 1, 1, 1,
0.5802372, -0.9783298, 2.040222, 1, 0, 0, 1, 1,
0.5816833, 0.1667598, 1.459625, 1, 0, 0, 1, 1,
0.5827312, -0.1201984, 0.9758782, 1, 0, 0, 1, 1,
0.5839522, -1.798465, 3.519722, 1, 0, 0, 1, 1,
0.5848727, 0.5037932, 0.9568066, 1, 0, 0, 1, 1,
0.5884557, 0.7178808, 2.530304, 0, 0, 0, 1, 1,
0.5894194, 1.287734, 0.3392841, 0, 0, 0, 1, 1,
0.5904492, 0.3775159, 0.7430192, 0, 0, 0, 1, 1,
0.5942196, 1.174066, 1.235533, 0, 0, 0, 1, 1,
0.5943212, -1.243935, 2.655733, 0, 0, 0, 1, 1,
0.5953828, 0.8059363, 1.626153, 0, 0, 0, 1, 1,
0.5988495, 0.3633789, -0.5882198, 0, 0, 0, 1, 1,
0.6001822, 1.578933, 3.541692, 1, 1, 1, 1, 1,
0.6071519, 0.2929116, 0.4689665, 1, 1, 1, 1, 1,
0.6094479, 0.2222152, 0.8270553, 1, 1, 1, 1, 1,
0.6095144, 1.463025, 1.242543, 1, 1, 1, 1, 1,
0.6118112, -1.771395, 3.370403, 1, 1, 1, 1, 1,
0.6136062, -1.294916, 2.570794, 1, 1, 1, 1, 1,
0.6166795, -0.6561475, 0.8915911, 1, 1, 1, 1, 1,
0.6182005, -0.3488224, 2.296239, 1, 1, 1, 1, 1,
0.6183206, 1.311148, -1.775482, 1, 1, 1, 1, 1,
0.621476, -2.071931, 4.212186, 1, 1, 1, 1, 1,
0.6226904, -0.5428389, 2.17695, 1, 1, 1, 1, 1,
0.6253244, -1.774257, 4.136376, 1, 1, 1, 1, 1,
0.6269757, -1.168249, 3.670509, 1, 1, 1, 1, 1,
0.6320532, 1.183745, -0.3353371, 1, 1, 1, 1, 1,
0.6328538, 1.039729, 0.4404645, 1, 1, 1, 1, 1,
0.6485201, 0.1006985, -0.1673339, 0, 0, 1, 1, 1,
0.6601939, 0.6054587, 1.389733, 1, 0, 0, 1, 1,
0.6612604, -0.02827029, 1.951735, 1, 0, 0, 1, 1,
0.6615233, 0.3281794, 0.5662438, 1, 0, 0, 1, 1,
0.6721395, -1.349859, 1.533285, 1, 0, 0, 1, 1,
0.6825284, -0.3558819, 1.772905, 1, 0, 0, 1, 1,
0.6893113, 2.334331, 1.778879, 0, 0, 0, 1, 1,
0.6930566, 0.8459942, -0.1709822, 0, 0, 0, 1, 1,
0.6940605, 0.2747813, 0.9567171, 0, 0, 0, 1, 1,
0.6946747, -0.4396552, 0.7893088, 0, 0, 0, 1, 1,
0.6982896, 0.9281887, -1.270469, 0, 0, 0, 1, 1,
0.7002729, -0.9490102, 3.29723, 0, 0, 0, 1, 1,
0.7026755, 0.7804941, 1.092297, 0, 0, 0, 1, 1,
0.708505, 0.2818424, 1.063148, 1, 1, 1, 1, 1,
0.7167524, 0.3825814, 2.782627, 1, 1, 1, 1, 1,
0.7236272, 0.1869088, 3.307266, 1, 1, 1, 1, 1,
0.7252845, -2.121864, 2.040913, 1, 1, 1, 1, 1,
0.7257733, 1.128832, 0.6841006, 1, 1, 1, 1, 1,
0.7267467, 0.03809916, 1.440284, 1, 1, 1, 1, 1,
0.7310919, -0.3919721, 2.414115, 1, 1, 1, 1, 1,
0.7324488, -0.9811888, 4.380049, 1, 1, 1, 1, 1,
0.7413235, -0.8669252, 3.187881, 1, 1, 1, 1, 1,
0.7444699, -0.9717909, 3.645655, 1, 1, 1, 1, 1,
0.7567881, -0.8860108, 1.585984, 1, 1, 1, 1, 1,
0.7592854, 0.3830163, 1.113031, 1, 1, 1, 1, 1,
0.7606416, 0.4213061, 0.5298297, 1, 1, 1, 1, 1,
0.7652025, 0.524706, 0.09664102, 1, 1, 1, 1, 1,
0.7669927, -0.1750692, 2.052799, 1, 1, 1, 1, 1,
0.7690124, 0.3488619, 0.9831677, 0, 0, 1, 1, 1,
0.7697003, -1.222222, 2.598414, 1, 0, 0, 1, 1,
0.7756604, -0.05091264, 2.118322, 1, 0, 0, 1, 1,
0.7777209, 0.8850711, 0.8000513, 1, 0, 0, 1, 1,
0.7813173, -0.7137622, 2.532787, 1, 0, 0, 1, 1,
0.7890074, -0.2957163, 3.516251, 1, 0, 0, 1, 1,
0.8000106, -0.1104616, 0.7142849, 0, 0, 0, 1, 1,
0.8009182, -0.9657874, 2.00152, 0, 0, 0, 1, 1,
0.8040059, -0.4898849, 2.109371, 0, 0, 0, 1, 1,
0.8139237, 0.8712391, 1.077204, 0, 0, 0, 1, 1,
0.8216001, -1.209365, 2.094728, 0, 0, 0, 1, 1,
0.8228248, -1.026539, 2.575259, 0, 0, 0, 1, 1,
0.8271903, 0.7041154, 1.59612, 0, 0, 0, 1, 1,
0.8273227, 1.230258, 1.867655, 1, 1, 1, 1, 1,
0.8298117, -1.101581, 2.245045, 1, 1, 1, 1, 1,
0.8322964, 1.773946, 0.2462849, 1, 1, 1, 1, 1,
0.8397421, 0.2724643, -0.6910914, 1, 1, 1, 1, 1,
0.8434428, 1.143199, 1.359701, 1, 1, 1, 1, 1,
0.8439247, -1.038766, 3.756142, 1, 1, 1, 1, 1,
0.8484577, -1.81335, 1.636676, 1, 1, 1, 1, 1,
0.8560976, -0.03177312, 0.951198, 1, 1, 1, 1, 1,
0.8619811, -0.0112598, 1.341892, 1, 1, 1, 1, 1,
0.8641993, -0.1043062, 1.807841, 1, 1, 1, 1, 1,
0.8662927, -0.3957924, 0.7055448, 1, 1, 1, 1, 1,
0.8701046, -0.4406665, 1.289057, 1, 1, 1, 1, 1,
0.8719519, 1.341854, 0.7629835, 1, 1, 1, 1, 1,
0.8774877, -0.1366252, 1.827991, 1, 1, 1, 1, 1,
0.8778605, -1.501651, 4.154473, 1, 1, 1, 1, 1,
0.8841476, -0.7574945, 4.37286, 0, 0, 1, 1, 1,
0.8865917, 1.238777, 0.06341416, 1, 0, 0, 1, 1,
0.8874963, -0.725985, 4.152245, 1, 0, 0, 1, 1,
0.8896935, -1.655669, 2.663176, 1, 0, 0, 1, 1,
0.8937514, 1.848806, -0.6766119, 1, 0, 0, 1, 1,
0.8944274, 0.4744525, 2.492013, 1, 0, 0, 1, 1,
0.8949152, -1.411687, 0.8541243, 0, 0, 0, 1, 1,
0.896304, 0.05659514, 3.35692, 0, 0, 0, 1, 1,
0.8994994, -1.451439, 2.83503, 0, 0, 0, 1, 1,
0.9029655, -0.4015592, 2.914802, 0, 0, 0, 1, 1,
0.9030001, -0.3245871, 3.259482, 0, 0, 0, 1, 1,
0.9061353, -0.3271356, 1.562106, 0, 0, 0, 1, 1,
0.9176493, 1.008733, 0.8974388, 0, 0, 0, 1, 1,
0.9228791, 1.11286, 1.521534, 1, 1, 1, 1, 1,
0.9322634, 0.337419, 0.7462959, 1, 1, 1, 1, 1,
0.9327782, 0.7550179, -1.407883, 1, 1, 1, 1, 1,
0.9360051, 0.09565859, 0.9604521, 1, 1, 1, 1, 1,
0.9492448, -0.6536222, 2.315755, 1, 1, 1, 1, 1,
0.9511349, 1.545436, 1.293263, 1, 1, 1, 1, 1,
0.9599822, 0.5232317, -0.9236867, 1, 1, 1, 1, 1,
0.9605572, -0.6829773, 2.59133, 1, 1, 1, 1, 1,
0.9609289, 1.741992, -0.3962552, 1, 1, 1, 1, 1,
0.9662744, -0.4743973, 0.7811506, 1, 1, 1, 1, 1,
0.9726046, 0.08284707, 0.8571948, 1, 1, 1, 1, 1,
0.9754644, -0.4794308, -0.09767189, 1, 1, 1, 1, 1,
0.9816107, -0.07703973, 0.476438, 1, 1, 1, 1, 1,
0.9821391, -0.03239795, 1.827687, 1, 1, 1, 1, 1,
0.9855734, -1.366409, 3.213677, 1, 1, 1, 1, 1,
0.9882734, -0.1642101, 1.370765, 0, 0, 1, 1, 1,
0.9914597, 1.121499, 1.025759, 1, 0, 0, 1, 1,
0.9929276, -0.2354056, 2.862633, 1, 0, 0, 1, 1,
0.9990719, -2.249331, 2.678525, 1, 0, 0, 1, 1,
1.000559, -0.0272355, 2.789552, 1, 0, 0, 1, 1,
1.003113, -1.025231, 2.158431, 1, 0, 0, 1, 1,
1.003762, -0.8090654, 1.452836, 0, 0, 0, 1, 1,
1.005497, -1.658744, 1.255476, 0, 0, 0, 1, 1,
1.007352, 0.8659813, 1.644253, 0, 0, 0, 1, 1,
1.01212, -0.5327106, 2.3035, 0, 0, 0, 1, 1,
1.035402, 0.2230992, 2.320117, 0, 0, 0, 1, 1,
1.03556, -0.8995451, 0.8859268, 0, 0, 0, 1, 1,
1.037637, -1.687143, 2.889128, 0, 0, 0, 1, 1,
1.053005, 0.2831908, 1.322797, 1, 1, 1, 1, 1,
1.056868, -0.7297474, 3.318279, 1, 1, 1, 1, 1,
1.065528, -0.312797, -0.06538235, 1, 1, 1, 1, 1,
1.065996, -1.381187, 0.9671852, 1, 1, 1, 1, 1,
1.066859, 1.64481, 1.927563, 1, 1, 1, 1, 1,
1.067676, 1.017516, -0.1238043, 1, 1, 1, 1, 1,
1.068027, 0.7832202, 3.031358, 1, 1, 1, 1, 1,
1.072367, 0.2652762, 1.456396, 1, 1, 1, 1, 1,
1.08464, 0.7076877, 0.8504336, 1, 1, 1, 1, 1,
1.086463, 1.411853, 0.4164107, 1, 1, 1, 1, 1,
1.097254, -1.105886, 3.053984, 1, 1, 1, 1, 1,
1.10367, 0.01580657, 1.741903, 1, 1, 1, 1, 1,
1.112179, 0.06917913, 1.510986, 1, 1, 1, 1, 1,
1.116433, -0.4010881, 2.518461, 1, 1, 1, 1, 1,
1.121708, -1.491039, 3.298403, 1, 1, 1, 1, 1,
1.153884, -1.386236, 1.806088, 0, 0, 1, 1, 1,
1.156383, 0.1180274, 1.226483, 1, 0, 0, 1, 1,
1.157857, -0.1207217, 2.02472, 1, 0, 0, 1, 1,
1.160926, 0.3164708, -0.5000564, 1, 0, 0, 1, 1,
1.170043, 1.433373, 1.016654, 1, 0, 0, 1, 1,
1.17318, 0.3276349, 2.504237, 1, 0, 0, 1, 1,
1.18061, 0.6279866, 1.813454, 0, 0, 0, 1, 1,
1.18255, 0.2328006, 0.562162, 0, 0, 0, 1, 1,
1.184238, -0.03141402, 1.138217, 0, 0, 0, 1, 1,
1.191641, 0.3430881, -0.4924987, 0, 0, 0, 1, 1,
1.195686, -0.3769422, 2.413895, 0, 0, 0, 1, 1,
1.202847, -0.2592549, 1.302163, 0, 0, 0, 1, 1,
1.206043, -0.09392478, -0.2601361, 0, 0, 0, 1, 1,
1.207409, -0.4134647, 1.231318, 1, 1, 1, 1, 1,
1.217559, 0.2147813, 1.360946, 1, 1, 1, 1, 1,
1.223769, -0.1128659, 2.650693, 1, 1, 1, 1, 1,
1.224417, 1.901365, 1.210747, 1, 1, 1, 1, 1,
1.224556, 1.185991, 1.159746, 1, 1, 1, 1, 1,
1.227536, 1.529567, 2.263536, 1, 1, 1, 1, 1,
1.236321, 0.1434532, 2.738826, 1, 1, 1, 1, 1,
1.239905, 1.804783, 0.6639434, 1, 1, 1, 1, 1,
1.242273, 0.9753671, 2.876244, 1, 1, 1, 1, 1,
1.247668, -0.1170049, 2.338663, 1, 1, 1, 1, 1,
1.248786, 2.684542, 0.3313775, 1, 1, 1, 1, 1,
1.251798, -1.298724, 2.483144, 1, 1, 1, 1, 1,
1.262851, -0.8861808, 3.426518, 1, 1, 1, 1, 1,
1.264061, -0.4049156, 3.396537, 1, 1, 1, 1, 1,
1.26585, 0.2105951, 0.6522319, 1, 1, 1, 1, 1,
1.267099, 1.736696, -0.4364802, 0, 0, 1, 1, 1,
1.270642, -1.360826, 1.951533, 1, 0, 0, 1, 1,
1.275438, 0.4832638, 1.86013, 1, 0, 0, 1, 1,
1.281098, -0.4617701, 0.2605267, 1, 0, 0, 1, 1,
1.290213, 0.2190318, 2.136102, 1, 0, 0, 1, 1,
1.290651, 1.209466, -0.1262787, 1, 0, 0, 1, 1,
1.292017, 0.5219083, 2.449138, 0, 0, 0, 1, 1,
1.295063, 0.04320641, 1.374492, 0, 0, 0, 1, 1,
1.297146, -1.506398, 2.425275, 0, 0, 0, 1, 1,
1.297759, 1.64768, -0.4012245, 0, 0, 0, 1, 1,
1.304979, 0.06159165, 2.90499, 0, 0, 0, 1, 1,
1.305266, 1.974859, 1.384206, 0, 0, 0, 1, 1,
1.321409, -0.9282223, 1.704544, 0, 0, 0, 1, 1,
1.32879, -1.835793, 3.055405, 1, 1, 1, 1, 1,
1.330433, -0.5073728, 2.643137, 1, 1, 1, 1, 1,
1.33978, -0.227225, 3.13523, 1, 1, 1, 1, 1,
1.340815, -0.6285595, 2.71933, 1, 1, 1, 1, 1,
1.349132, -0.4316002, 2.045074, 1, 1, 1, 1, 1,
1.355857, -0.4755264, 1.441221, 1, 1, 1, 1, 1,
1.367466, 1.691643, 0.9387525, 1, 1, 1, 1, 1,
1.368927, -1.617524, 3.481075, 1, 1, 1, 1, 1,
1.373792, 0.1146438, 2.830392, 1, 1, 1, 1, 1,
1.374977, -0.8063283, 1.794562, 1, 1, 1, 1, 1,
1.385161, -0.121552, 1.147476, 1, 1, 1, 1, 1,
1.395302, -0.6402853, 2.282346, 1, 1, 1, 1, 1,
1.400096, 0.8626669, 0.7550684, 1, 1, 1, 1, 1,
1.403791, -0.0834635, 1.910399, 1, 1, 1, 1, 1,
1.404379, -1.298757, 1.339266, 1, 1, 1, 1, 1,
1.409006, 0.328348, 1.900643, 0, 0, 1, 1, 1,
1.421523, 0.3571098, 1.614079, 1, 0, 0, 1, 1,
1.427966, -1.39643, 1.766827, 1, 0, 0, 1, 1,
1.454714, -0.3584092, 1.324504, 1, 0, 0, 1, 1,
1.459369, 0.2429982, 2.594264, 1, 0, 0, 1, 1,
1.45967, 0.05919072, 3.048874, 1, 0, 0, 1, 1,
1.464517, 1.263236, 1.329412, 0, 0, 0, 1, 1,
1.48685, 0.03541617, 1.345787, 0, 0, 0, 1, 1,
1.488014, -0.5587624, 3.42259, 0, 0, 0, 1, 1,
1.492018, 0.9556404, 1.06251, 0, 0, 0, 1, 1,
1.496138, -1.774123, 2.746102, 0, 0, 0, 1, 1,
1.502914, -0.3830837, 1.207224, 0, 0, 0, 1, 1,
1.514334, 0.04445598, 1.949347, 0, 0, 0, 1, 1,
1.515962, -0.3965824, 0.9673116, 1, 1, 1, 1, 1,
1.529364, -2.324419, 2.370756, 1, 1, 1, 1, 1,
1.53572, -0.2979693, 2.0258, 1, 1, 1, 1, 1,
1.542014, 0.111679, 1.946724, 1, 1, 1, 1, 1,
1.546671, -0.02578081, 1.178395, 1, 1, 1, 1, 1,
1.560939, -2.454669, 4.199014, 1, 1, 1, 1, 1,
1.599078, 0.3520538, 1.218586, 1, 1, 1, 1, 1,
1.599792, 0.1970331, 0.9041092, 1, 1, 1, 1, 1,
1.603262, 0.6759024, 1.350581, 1, 1, 1, 1, 1,
1.609261, 0.04823193, 0.6676088, 1, 1, 1, 1, 1,
1.613777, -1.135577, 2.655598, 1, 1, 1, 1, 1,
1.621104, -0.5974307, 2.439911, 1, 1, 1, 1, 1,
1.624692, 0.6459951, 0.2480701, 1, 1, 1, 1, 1,
1.644319, 0.01438488, 1.190457, 1, 1, 1, 1, 1,
1.644589, -0.765834, 2.261534, 1, 1, 1, 1, 1,
1.664918, 0.140936, 2.787847, 0, 0, 1, 1, 1,
1.675376, -1.109153, 0.6580536, 1, 0, 0, 1, 1,
1.681905, -0.6332404, 2.229288, 1, 0, 0, 1, 1,
1.685801, 1.453097, -0.231044, 1, 0, 0, 1, 1,
1.687402, 0.9393968, 2.631341, 1, 0, 0, 1, 1,
1.691772, -0.7184852, -0.6780537, 1, 0, 0, 1, 1,
1.695336, 0.07034036, 1.014539, 0, 0, 0, 1, 1,
1.715049, -0.967065, 3.098315, 0, 0, 0, 1, 1,
1.723487, 0.25048, 1.071573, 0, 0, 0, 1, 1,
1.749088, -0.2317658, 1.930452, 0, 0, 0, 1, 1,
1.749099, -1.971021, 3.278815, 0, 0, 0, 1, 1,
1.75344, -0.5626349, 2.474195, 0, 0, 0, 1, 1,
1.755788, 0.8912188, -0.3529996, 0, 0, 0, 1, 1,
1.785583, -0.335862, 2.03666, 1, 1, 1, 1, 1,
1.788769, -0.8896805, 2.273149, 1, 1, 1, 1, 1,
1.801785, 0.8435931, 2.779668, 1, 1, 1, 1, 1,
1.803484, -0.7266141, 3.973099, 1, 1, 1, 1, 1,
1.818916, 0.4651541, 1.241483, 1, 1, 1, 1, 1,
1.823146, 0.4255972, 1.165285, 1, 1, 1, 1, 1,
1.826263, -0.7968993, 1.692542, 1, 1, 1, 1, 1,
1.835156, -0.3015554, 1.133999, 1, 1, 1, 1, 1,
1.837462, 1.888795, 0.3574418, 1, 1, 1, 1, 1,
1.860778, -0.8923905, 1.298718, 1, 1, 1, 1, 1,
1.869961, 0.2729219, 2.526486, 1, 1, 1, 1, 1,
1.885014, 0.408769, 0.5108045, 1, 1, 1, 1, 1,
1.889319, 0.2206332, 2.081465, 1, 1, 1, 1, 1,
1.904245, -2.036499, 3.35401, 1, 1, 1, 1, 1,
1.971509, -1.220638, 2.328854, 1, 1, 1, 1, 1,
1.978037, -1.663929, 3.896425, 0, 0, 1, 1, 1,
2.010458, -1.906719, 2.166543, 1, 0, 0, 1, 1,
2.081577, -0.66756, 1.434678, 1, 0, 0, 1, 1,
2.106755, 1.382459, 2.216817, 1, 0, 0, 1, 1,
2.129163, 0.3882616, 2.298313, 1, 0, 0, 1, 1,
2.219812, 0.03062711, 1.258993, 1, 0, 0, 1, 1,
2.26661, -0.1931485, 1.510421, 0, 0, 0, 1, 1,
2.277307, 0.1306546, 2.396842, 0, 0, 0, 1, 1,
2.284216, 1.338843, 0.8021554, 0, 0, 0, 1, 1,
2.299783, -0.7179406, 1.772661, 0, 0, 0, 1, 1,
2.308857, 0.3349909, 0.511957, 0, 0, 0, 1, 1,
2.337809, -0.01155161, 2.463593, 0, 0, 0, 1, 1,
2.438237, 0.2636265, 1.828681, 0, 0, 0, 1, 1,
2.450705, -0.7142314, 2.632034, 1, 1, 1, 1, 1,
2.458793, 0.9256045, 1.584226, 1, 1, 1, 1, 1,
2.481454, -1.267376, 2.67709, 1, 1, 1, 1, 1,
2.494668, 1.655056, 0.6487903, 1, 1, 1, 1, 1,
2.521267, -0.3070626, 1.992948, 1, 1, 1, 1, 1,
2.603121, -1.718528, 2.644783, 1, 1, 1, 1, 1,
2.80421, 0.05502072, 0.7600217, 1, 1, 1, 1, 1
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
var radius = 9.58415;
var distance = 33.66392;
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
mvMatrix.translate( 0.3052372, -0.5641764, 0.3942094 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.66392);
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
