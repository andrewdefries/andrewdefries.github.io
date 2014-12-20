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
-2.997119, -1.398155, -0.4680775, 1, 0, 0, 1,
-2.79809, 0.01840219, -0.4669596, 1, 0.007843138, 0, 1,
-2.775043, 0.5320865, -0.709141, 1, 0.01176471, 0, 1,
-2.708957, -1.355612, -2.01597, 1, 0.01960784, 0, 1,
-2.548345, -1.562056, -2.946981, 1, 0.02352941, 0, 1,
-2.52001, -1.378237, -2.3274, 1, 0.03137255, 0, 1,
-2.365474, 0.2894426, -1.075155, 1, 0.03529412, 0, 1,
-2.258824, 0.614334, 0.3510017, 1, 0.04313726, 0, 1,
-2.203693, 0.0672975, -2.059645, 1, 0.04705882, 0, 1,
-2.155114, -1.104254, -0.4674592, 1, 0.05490196, 0, 1,
-2.148551, 1.390161, -1.389579, 1, 0.05882353, 0, 1,
-2.106276, 1.498685, -1.097267, 1, 0.06666667, 0, 1,
-2.106214, -1.440015, -2.61475, 1, 0.07058824, 0, 1,
-2.105404, 2.326088, -0.6702009, 1, 0.07843138, 0, 1,
-1.978966, 0.5360457, -2.365906, 1, 0.08235294, 0, 1,
-1.972754, -0.7630648, 0.575866, 1, 0.09019608, 0, 1,
-1.951333, 0.7369475, -1.101307, 1, 0.09411765, 0, 1,
-1.92983, 0.1904343, -2.563312, 1, 0.1019608, 0, 1,
-1.925231, -0.3093975, 0.3032326, 1, 0.1098039, 0, 1,
-1.847156, 0.7422592, 0.5293415, 1, 0.1137255, 0, 1,
-1.825754, -0.7737554, -3.693621, 1, 0.1215686, 0, 1,
-1.804329, -1.088114, -1.242505, 1, 0.1254902, 0, 1,
-1.755261, -0.6225225, -1.276702, 1, 0.1333333, 0, 1,
-1.753152, 0.9173468, -2.145886, 1, 0.1372549, 0, 1,
-1.75223, 1.574134, -1.665492, 1, 0.145098, 0, 1,
-1.731184, -1.728796, -2.492878, 1, 0.1490196, 0, 1,
-1.729227, 0.9190184, -1.520499, 1, 0.1568628, 0, 1,
-1.705553, -0.06033067, -2.51026, 1, 0.1607843, 0, 1,
-1.704818, 0.3783005, -3.494537, 1, 0.1686275, 0, 1,
-1.660762, 0.3216783, -3.791656, 1, 0.172549, 0, 1,
-1.65274, 0.8435169, -2.431293, 1, 0.1803922, 0, 1,
-1.647761, -1.117917, -2.583457, 1, 0.1843137, 0, 1,
-1.64236, 0.1993981, -1.534504, 1, 0.1921569, 0, 1,
-1.6331, 1.049534, -0.2950228, 1, 0.1960784, 0, 1,
-1.628155, 0.03020146, 1.051097, 1, 0.2039216, 0, 1,
-1.623629, -0.05629279, -0.04052362, 1, 0.2117647, 0, 1,
-1.616754, 0.1027538, -2.368711, 1, 0.2156863, 0, 1,
-1.614434, -0.6627081, -2.032574, 1, 0.2235294, 0, 1,
-1.610856, -1.135573, -1.80082, 1, 0.227451, 0, 1,
-1.60883, 0.4094985, -2.03161, 1, 0.2352941, 0, 1,
-1.596191, 0.07834873, -1.086075, 1, 0.2392157, 0, 1,
-1.589447, -1.984333, -2.336191, 1, 0.2470588, 0, 1,
-1.578967, 0.9147899, -0.6372178, 1, 0.2509804, 0, 1,
-1.552448, -0.2105792, 0.2498677, 1, 0.2588235, 0, 1,
-1.547934, -0.1759111, -0.7889419, 1, 0.2627451, 0, 1,
-1.530629, -0.1339508, -0.362586, 1, 0.2705882, 0, 1,
-1.515088, 0.1893287, -2.645568, 1, 0.2745098, 0, 1,
-1.513114, -0.2159612, -0.4811885, 1, 0.282353, 0, 1,
-1.512018, 0.1915298, -0.3046355, 1, 0.2862745, 0, 1,
-1.495089, -0.5117795, -1.890305, 1, 0.2941177, 0, 1,
-1.478565, 0.6541613, -0.6620795, 1, 0.3019608, 0, 1,
-1.465655, -2.085154, -3.883137, 1, 0.3058824, 0, 1,
-1.462874, -0.3735375, -0.02647478, 1, 0.3137255, 0, 1,
-1.455223, -0.6165198, -2.542763, 1, 0.3176471, 0, 1,
-1.437433, -2.633435, -3.392511, 1, 0.3254902, 0, 1,
-1.436321, 0.0270108, -2.15578, 1, 0.3294118, 0, 1,
-1.429735, 0.6215551, -1.637374, 1, 0.3372549, 0, 1,
-1.421067, -0.3951376, -3.128502, 1, 0.3411765, 0, 1,
-1.40814, -0.1924225, -0.7697902, 1, 0.3490196, 0, 1,
-1.397896, 0.3497351, -0.8534825, 1, 0.3529412, 0, 1,
-1.39655, -0.3745574, -1.565729, 1, 0.3607843, 0, 1,
-1.395525, -0.2908112, 0.1880334, 1, 0.3647059, 0, 1,
-1.390302, -1.201094, -2.626767, 1, 0.372549, 0, 1,
-1.37919, 0.1476649, -2.231191, 1, 0.3764706, 0, 1,
-1.377235, 0.07694446, -1.525656, 1, 0.3843137, 0, 1,
-1.364193, -0.2944946, -2.50748, 1, 0.3882353, 0, 1,
-1.359671, -0.4567409, -1.809412, 1, 0.3960784, 0, 1,
-1.358726, 1.002518, -1.43489, 1, 0.4039216, 0, 1,
-1.355571, 1.65722, -1.198056, 1, 0.4078431, 0, 1,
-1.342605, -0.3147782, -0.9688396, 1, 0.4156863, 0, 1,
-1.340146, 1.824112, -0.6053836, 1, 0.4196078, 0, 1,
-1.334035, 0.5181403, -0.09904101, 1, 0.427451, 0, 1,
-1.323109, 0.3541949, -1.505843, 1, 0.4313726, 0, 1,
-1.321307, -1.316435, -1.127515, 1, 0.4392157, 0, 1,
-1.317101, 0.9774703, 0.6128558, 1, 0.4431373, 0, 1,
-1.316587, 0.6069772, -1.758, 1, 0.4509804, 0, 1,
-1.314716, 1.235541, -0.237828, 1, 0.454902, 0, 1,
-1.303332, -1.801091, -2.725155, 1, 0.4627451, 0, 1,
-1.27666, 1.025811, -1.628356, 1, 0.4666667, 0, 1,
-1.275129, -2.003047, -3.64799, 1, 0.4745098, 0, 1,
-1.270133, 0.4818132, 0.7062647, 1, 0.4784314, 0, 1,
-1.269267, -0.1805277, -1.850333, 1, 0.4862745, 0, 1,
-1.265313, 1.735727, -2.764385, 1, 0.4901961, 0, 1,
-1.263944, -0.3241624, -2.197842, 1, 0.4980392, 0, 1,
-1.256077, -1.46216, -1.728389, 1, 0.5058824, 0, 1,
-1.245342, 0.3947206, -0.9964871, 1, 0.509804, 0, 1,
-1.229503, -1.064659, -1.797323, 1, 0.5176471, 0, 1,
-1.218972, -0.4180487, 0.000752452, 1, 0.5215687, 0, 1,
-1.203455, -0.7710006, -1.422601, 1, 0.5294118, 0, 1,
-1.196617, 0.9040611, -0.886478, 1, 0.5333334, 0, 1,
-1.196087, 0.651729, -0.9915561, 1, 0.5411765, 0, 1,
-1.188541, 1.066494, -0.3352818, 1, 0.5450981, 0, 1,
-1.176225, -0.2735529, -3.628869, 1, 0.5529412, 0, 1,
-1.163731, -0.5310056, -0.7236129, 1, 0.5568628, 0, 1,
-1.16069, 0.1270594, -1.098955, 1, 0.5647059, 0, 1,
-1.148291, -1.662544, -1.733068, 1, 0.5686275, 0, 1,
-1.145476, 2.095859, -0.9585326, 1, 0.5764706, 0, 1,
-1.138751, -0.5685296, -0.1653959, 1, 0.5803922, 0, 1,
-1.138007, 0.6198698, -1.961663, 1, 0.5882353, 0, 1,
-1.12903, -1.179197, -0.4910898, 1, 0.5921569, 0, 1,
-1.122907, -1.218951, -2.552883, 1, 0.6, 0, 1,
-1.121659, -0.3486951, -1.115861, 1, 0.6078432, 0, 1,
-1.108454, 0.3636179, 0.7180948, 1, 0.6117647, 0, 1,
-1.104047, -1.725629, -3.657109, 1, 0.6196079, 0, 1,
-1.100926, 0.2702053, -0.8390428, 1, 0.6235294, 0, 1,
-1.099038, 1.912598, -0.3402509, 1, 0.6313726, 0, 1,
-1.090432, 0.5490629, -0.396942, 1, 0.6352941, 0, 1,
-1.087779, -0.1461099, -1.390048, 1, 0.6431373, 0, 1,
-1.082633, -0.03339716, -2.485396, 1, 0.6470588, 0, 1,
-1.081771, 0.6574061, -0.2458636, 1, 0.654902, 0, 1,
-1.078819, 0.5085002, -0.2230066, 1, 0.6588235, 0, 1,
-1.076571, 0.01365024, -0.9410171, 1, 0.6666667, 0, 1,
-1.074457, 1.424491, -1.721131, 1, 0.6705883, 0, 1,
-1.064685, 0.4090542, -2.739716, 1, 0.6784314, 0, 1,
-1.060075, 1.309478, -0.8386517, 1, 0.682353, 0, 1,
-1.056368, 0.1776706, -1.117116, 1, 0.6901961, 0, 1,
-1.050247, -0.9954149, -3.27101, 1, 0.6941177, 0, 1,
-1.045817, -0.8618526, -1.682513, 1, 0.7019608, 0, 1,
-1.040254, 0.4413362, -2.28931, 1, 0.7098039, 0, 1,
-1.038291, 0.7869348, 0.187191, 1, 0.7137255, 0, 1,
-1.032088, 0.07539797, -1.947264, 1, 0.7215686, 0, 1,
-1.025946, 0.6362742, -0.3426731, 1, 0.7254902, 0, 1,
-1.022871, 0.2528764, -0.1087962, 1, 0.7333333, 0, 1,
-1.017682, -0.7242617, -1.712439, 1, 0.7372549, 0, 1,
-1.017395, 0.01037261, -1.374593, 1, 0.7450981, 0, 1,
-1.015596, -0.6643643, -1.351599, 1, 0.7490196, 0, 1,
-1.011961, -0.388539, -0.2017022, 1, 0.7568628, 0, 1,
-1.010381, -0.4305115, -2.974294, 1, 0.7607843, 0, 1,
-1.008786, -0.3749301, -3.054618, 1, 0.7686275, 0, 1,
-1.008253, 0.443982, -0.4735101, 1, 0.772549, 0, 1,
-1.00731, 0.2086954, 0.449659, 1, 0.7803922, 0, 1,
-1.005761, 0.8074795, -1.231494, 1, 0.7843137, 0, 1,
-1.003377, 0.1708545, -1.489237, 1, 0.7921569, 0, 1,
-0.9981521, -0.2346421, -2.795399, 1, 0.7960784, 0, 1,
-0.9936913, -0.3236689, -3.45809, 1, 0.8039216, 0, 1,
-0.9920776, -1.133067, -2.919971, 1, 0.8117647, 0, 1,
-0.9865947, -0.1414896, -1.288185, 1, 0.8156863, 0, 1,
-0.9848769, -0.9264083, -1.064253, 1, 0.8235294, 0, 1,
-0.9843211, 0.6848312, -0.2924899, 1, 0.827451, 0, 1,
-0.9834988, 0.5663269, -1.123093, 1, 0.8352941, 0, 1,
-0.9833114, -0.8219865, -1.582817, 1, 0.8392157, 0, 1,
-0.9760141, 0.4143419, -1.366281, 1, 0.8470588, 0, 1,
-0.9624732, -1.023034, -1.096212, 1, 0.8509804, 0, 1,
-0.9617668, -0.4051167, -3.030264, 1, 0.8588235, 0, 1,
-0.9545811, -0.7746227, -1.878869, 1, 0.8627451, 0, 1,
-0.9522251, -0.6084338, -1.670453, 1, 0.8705882, 0, 1,
-0.9482668, -1.611664, -1.26937, 1, 0.8745098, 0, 1,
-0.9418299, -1.593435, -2.138827, 1, 0.8823529, 0, 1,
-0.9377298, -0.6700384, -1.537724, 1, 0.8862745, 0, 1,
-0.9330353, 1.075939, -0.3114222, 1, 0.8941177, 0, 1,
-0.9329543, 1.500625, 0.7683036, 1, 0.8980392, 0, 1,
-0.9299886, 1.288501, -0.2518936, 1, 0.9058824, 0, 1,
-0.9282372, -1.868865, -2.743372, 1, 0.9137255, 0, 1,
-0.9274045, -0.1442695, -2.957184, 1, 0.9176471, 0, 1,
-0.9259577, -0.8984637, -0.538074, 1, 0.9254902, 0, 1,
-0.921807, 0.5800759, -0.7652622, 1, 0.9294118, 0, 1,
-0.9195099, 0.5930778, -2.740926, 1, 0.9372549, 0, 1,
-0.9133587, -0.7356727, -4.070725, 1, 0.9411765, 0, 1,
-0.8998691, 0.887927, -0.8823601, 1, 0.9490196, 0, 1,
-0.8964306, -0.1347938, -0.4865549, 1, 0.9529412, 0, 1,
-0.8909193, 0.06109052, -2.484551, 1, 0.9607843, 0, 1,
-0.883954, -0.7716816, -2.167753, 1, 0.9647059, 0, 1,
-0.8819474, 0.1937053, -2.323118, 1, 0.972549, 0, 1,
-0.8818277, 0.2870611, -1.764743, 1, 0.9764706, 0, 1,
-0.8779522, 0.3802354, -0.5605469, 1, 0.9843137, 0, 1,
-0.8606882, -0.4909821, -1.427029, 1, 0.9882353, 0, 1,
-0.8602532, -1.440071, -2.777688, 1, 0.9960784, 0, 1,
-0.853834, -1.664438, -2.947053, 0.9960784, 1, 0, 1,
-0.8513179, -1.445616, -2.093699, 0.9921569, 1, 0, 1,
-0.847407, -0.7573984, -1.192816, 0.9843137, 1, 0, 1,
-0.8467295, -0.3105325, -2.325207, 0.9803922, 1, 0, 1,
-0.842738, -0.4083688, -0.9748588, 0.972549, 1, 0, 1,
-0.8427232, -0.5663617, -2.441932, 0.9686275, 1, 0, 1,
-0.8423606, -0.4359751, -3.62764, 0.9607843, 1, 0, 1,
-0.8311742, 1.495239, -0.2930642, 0.9568627, 1, 0, 1,
-0.8291258, 0.6732171, -3.747426, 0.9490196, 1, 0, 1,
-0.8242533, 0.8638921, -0.328042, 0.945098, 1, 0, 1,
-0.8180079, 1.01523, -1.801333, 0.9372549, 1, 0, 1,
-0.8164226, 0.4925705, -2.064478, 0.9333333, 1, 0, 1,
-0.8078173, 0.6641452, -1.387924, 0.9254902, 1, 0, 1,
-0.8032081, 0.74858, -0.9042318, 0.9215686, 1, 0, 1,
-0.8029931, -0.2935754, -0.9964522, 0.9137255, 1, 0, 1,
-0.794975, -0.6469647, -1.00141, 0.9098039, 1, 0, 1,
-0.7940867, 1.300543, -1.328337, 0.9019608, 1, 0, 1,
-0.7931615, -0.4151021, -1.006791, 0.8941177, 1, 0, 1,
-0.7893019, -1.794381, -2.946678, 0.8901961, 1, 0, 1,
-0.7789433, 1.547291, -0.4238867, 0.8823529, 1, 0, 1,
-0.7733169, -0.3917547, -0.745603, 0.8784314, 1, 0, 1,
-0.7641774, -2.129522, -2.087837, 0.8705882, 1, 0, 1,
-0.7629469, -0.2670732, 0.538902, 0.8666667, 1, 0, 1,
-0.7602317, 0.4921922, -1.504805, 0.8588235, 1, 0, 1,
-0.7595291, -1.454896, -1.614704, 0.854902, 1, 0, 1,
-0.7574809, -0.1733234, -2.187861, 0.8470588, 1, 0, 1,
-0.7530934, -0.7525786, -1.787593, 0.8431373, 1, 0, 1,
-0.7520546, -1.247373, -2.889477, 0.8352941, 1, 0, 1,
-0.7482532, -0.2182941, -0.9449285, 0.8313726, 1, 0, 1,
-0.748161, -0.9060837, -2.589561, 0.8235294, 1, 0, 1,
-0.7473086, 0.257873, -2.096979, 0.8196079, 1, 0, 1,
-0.7466453, -0.208155, -0.1116576, 0.8117647, 1, 0, 1,
-0.7461284, -0.6936131, -3.570673, 0.8078431, 1, 0, 1,
-0.744993, 0.2675319, -0.6397055, 0.8, 1, 0, 1,
-0.7278614, -0.2570848, -2.150693, 0.7921569, 1, 0, 1,
-0.7245559, 0.9313467, -0.2968094, 0.7882353, 1, 0, 1,
-0.7213944, -1.477313, -3.781753, 0.7803922, 1, 0, 1,
-0.7193494, -0.1089177, -1.688771, 0.7764706, 1, 0, 1,
-0.7069435, 0.5361483, -1.774177, 0.7686275, 1, 0, 1,
-0.7030799, 0.7113042, 0.7240785, 0.7647059, 1, 0, 1,
-0.7015686, 1.706421, 2.158316, 0.7568628, 1, 0, 1,
-0.701449, 0.9068519, -1.278398, 0.7529412, 1, 0, 1,
-0.6961508, 0.515211, -0.6639017, 0.7450981, 1, 0, 1,
-0.6924905, -1.326539, -3.44208, 0.7411765, 1, 0, 1,
-0.6912323, -0.1664167, -0.8013456, 0.7333333, 1, 0, 1,
-0.6904344, -2.173219, -3.300132, 0.7294118, 1, 0, 1,
-0.68666, -1.315001, -3.501658, 0.7215686, 1, 0, 1,
-0.6851752, 1.82188, -1.355973, 0.7176471, 1, 0, 1,
-0.684245, 0.2334224, -1.373471, 0.7098039, 1, 0, 1,
-0.6660459, 2.212758, -0.9579735, 0.7058824, 1, 0, 1,
-0.6656225, -0.115485, -0.7949675, 0.6980392, 1, 0, 1,
-0.6622656, 0.8357448, -2.493777, 0.6901961, 1, 0, 1,
-0.6605015, 0.7721429, -0.1238157, 0.6862745, 1, 0, 1,
-0.6488764, 2.037311, 0.4799851, 0.6784314, 1, 0, 1,
-0.6473774, -1.896935, -1.235579, 0.6745098, 1, 0, 1,
-0.6473266, 1.018975, -0.1209096, 0.6666667, 1, 0, 1,
-0.6445879, -1.200575, -1.539986, 0.6627451, 1, 0, 1,
-0.6428798, 1.274416, -1.04853, 0.654902, 1, 0, 1,
-0.6425468, -1.018386, -2.008507, 0.6509804, 1, 0, 1,
-0.6401849, 3.163416, -1.070132, 0.6431373, 1, 0, 1,
-0.6313691, 0.1102392, -1.87099, 0.6392157, 1, 0, 1,
-0.631203, -0.3063883, -2.743449, 0.6313726, 1, 0, 1,
-0.6246018, -1.244823, -0.03606005, 0.627451, 1, 0, 1,
-0.6206266, -0.6655537, -2.328453, 0.6196079, 1, 0, 1,
-0.6143714, -0.1833976, -2.822614, 0.6156863, 1, 0, 1,
-0.6102375, -1.182572, -2.224101, 0.6078432, 1, 0, 1,
-0.5921869, 1.244133, 1.169315, 0.6039216, 1, 0, 1,
-0.5906795, -0.8351393, -2.873556, 0.5960785, 1, 0, 1,
-0.5884951, 1.025987, -2.199472, 0.5882353, 1, 0, 1,
-0.5883554, 1.708729, -1.026639, 0.5843138, 1, 0, 1,
-0.5831003, -0.7584953, -2.145639, 0.5764706, 1, 0, 1,
-0.5813667, 1.122245, -1.566691, 0.572549, 1, 0, 1,
-0.5796478, 0.5381002, -1.242958, 0.5647059, 1, 0, 1,
-0.5742355, -0.8343387, -1.029575, 0.5607843, 1, 0, 1,
-0.5723131, 0.8250313, -1.572672, 0.5529412, 1, 0, 1,
-0.562547, 1.202207, -1.461451, 0.5490196, 1, 0, 1,
-0.5616811, -1.977966, -3.958101, 0.5411765, 1, 0, 1,
-0.5567401, 0.3986284, -0.7167838, 0.5372549, 1, 0, 1,
-0.5557674, -0.340685, -1.038033, 0.5294118, 1, 0, 1,
-0.5547233, -0.6250783, -2.753752, 0.5254902, 1, 0, 1,
-0.5486538, -1.198825, -2.847002, 0.5176471, 1, 0, 1,
-0.5398977, 0.01789613, -1.699666, 0.5137255, 1, 0, 1,
-0.5333229, -0.5703526, -3.34169, 0.5058824, 1, 0, 1,
-0.5328259, 0.979609, -1.204758, 0.5019608, 1, 0, 1,
-0.530501, -1.545067, -2.799107, 0.4941176, 1, 0, 1,
-0.5290427, -1.383561, -2.2394, 0.4862745, 1, 0, 1,
-0.5273404, 1.631744, -1.483309, 0.4823529, 1, 0, 1,
-0.5259259, -0.8261076, -4.132577, 0.4745098, 1, 0, 1,
-0.525796, -0.2223744, -2.189218, 0.4705882, 1, 0, 1,
-0.5237813, -0.6187848, -4.161057, 0.4627451, 1, 0, 1,
-0.5197104, 1.246514, -0.531756, 0.4588235, 1, 0, 1,
-0.5149351, -0.499411, -3.655687, 0.4509804, 1, 0, 1,
-0.51288, -0.2091667, -2.236421, 0.4470588, 1, 0, 1,
-0.5125797, -0.8771503, -4.110825, 0.4392157, 1, 0, 1,
-0.5104902, 0.5564563, -1.642021, 0.4352941, 1, 0, 1,
-0.5086167, -0.07680033, -2.608609, 0.427451, 1, 0, 1,
-0.5030235, 0.01246014, -2.105599, 0.4235294, 1, 0, 1,
-0.5004519, -0.9283711, -3.642984, 0.4156863, 1, 0, 1,
-0.499345, 0.9093524, 0.03250669, 0.4117647, 1, 0, 1,
-0.4985811, 0.08978317, -1.200152, 0.4039216, 1, 0, 1,
-0.4946027, -0.5536219, -1.985173, 0.3960784, 1, 0, 1,
-0.4935445, 1.674517, -0.2957921, 0.3921569, 1, 0, 1,
-0.4928354, 0.7345537, -1.205148, 0.3843137, 1, 0, 1,
-0.491978, -0.03675895, -2.162004, 0.3803922, 1, 0, 1,
-0.4911021, 0.1523841, -1.690525, 0.372549, 1, 0, 1,
-0.4897267, -1.527375, -3.127495, 0.3686275, 1, 0, 1,
-0.4844412, 0.683051, 0.1291101, 0.3607843, 1, 0, 1,
-0.4839267, -0.9464173, -3.118196, 0.3568628, 1, 0, 1,
-0.4830717, 0.7926225, -0.3094834, 0.3490196, 1, 0, 1,
-0.4785565, 2.349361, -1.421664, 0.345098, 1, 0, 1,
-0.4753831, 0.5502288, -2.327061, 0.3372549, 1, 0, 1,
-0.4719411, 1.078037, 0.1406264, 0.3333333, 1, 0, 1,
-0.4662563, -1.588306, -0.9183117, 0.3254902, 1, 0, 1,
-0.4632649, 1.174673, -2.104735, 0.3215686, 1, 0, 1,
-0.4521407, -0.4748921, -3.544267, 0.3137255, 1, 0, 1,
-0.448441, -1.254431, -2.936869, 0.3098039, 1, 0, 1,
-0.4471925, 1.441267, 0.05987146, 0.3019608, 1, 0, 1,
-0.4465919, 0.5937499, -1.477265, 0.2941177, 1, 0, 1,
-0.4455578, 0.2593708, -1.0368, 0.2901961, 1, 0, 1,
-0.4395809, -1.512829, -2.12145, 0.282353, 1, 0, 1,
-0.4354741, 1.162821, -0.9959827, 0.2784314, 1, 0, 1,
-0.4328599, 1.014434, -0.06567704, 0.2705882, 1, 0, 1,
-0.4310983, -0.9692919, -3.221285, 0.2666667, 1, 0, 1,
-0.4297312, -0.6510321, -3.593336, 0.2588235, 1, 0, 1,
-0.427884, 0.3316033, 0.5377865, 0.254902, 1, 0, 1,
-0.4225116, 0.9894658, 0.05856826, 0.2470588, 1, 0, 1,
-0.4192864, 0.1591771, -3.348652, 0.2431373, 1, 0, 1,
-0.4185826, -0.516699, -1.200991, 0.2352941, 1, 0, 1,
-0.4171511, 0.07725734, -0.01714239, 0.2313726, 1, 0, 1,
-0.4155159, -0.3879578, -3.269701, 0.2235294, 1, 0, 1,
-0.4094447, 0.06928547, 0.2372299, 0.2196078, 1, 0, 1,
-0.4076706, -0.4714752, -3.451208, 0.2117647, 1, 0, 1,
-0.4072246, 0.6918362, -0.3843855, 0.2078431, 1, 0, 1,
-0.4047474, 1.232723, -0.9691877, 0.2, 1, 0, 1,
-0.39333, 0.5745002, -1.849534, 0.1921569, 1, 0, 1,
-0.3919213, -0.6203075, -1.289801, 0.1882353, 1, 0, 1,
-0.3882027, -0.2872029, -1.132625, 0.1803922, 1, 0, 1,
-0.3868448, 1.078443, 0.21387, 0.1764706, 1, 0, 1,
-0.3830479, 0.2938084, 0.1128779, 0.1686275, 1, 0, 1,
-0.3783114, 0.1363013, -0.9571257, 0.1647059, 1, 0, 1,
-0.377506, -0.5477666, -3.901347, 0.1568628, 1, 0, 1,
-0.3690935, -1.074356, -2.532571, 0.1529412, 1, 0, 1,
-0.3685339, 0.7632016, 0.6550021, 0.145098, 1, 0, 1,
-0.3678653, 1.29792, 0.04321588, 0.1411765, 1, 0, 1,
-0.3676141, 1.207835, -0.4190601, 0.1333333, 1, 0, 1,
-0.3629649, 0.09409995, -2.546252, 0.1294118, 1, 0, 1,
-0.3595578, 0.2340819, -0.8580688, 0.1215686, 1, 0, 1,
-0.35924, 0.8913423, 0.9583718, 0.1176471, 1, 0, 1,
-0.3588173, 1.31692, -0.5829534, 0.1098039, 1, 0, 1,
-0.3583786, -0.5942104, -3.26965, 0.1058824, 1, 0, 1,
-0.3566507, -0.1846251, -1.782025, 0.09803922, 1, 0, 1,
-0.3549311, 0.6219806, -1.383347, 0.09019608, 1, 0, 1,
-0.3514129, -1.018054, -2.128174, 0.08627451, 1, 0, 1,
-0.3472629, 0.3351056, -0.280181, 0.07843138, 1, 0, 1,
-0.3432918, -0.268048, -2.983891, 0.07450981, 1, 0, 1,
-0.3413005, 0.9404252, -0.07600972, 0.06666667, 1, 0, 1,
-0.3375428, 1.090382, -0.3481904, 0.0627451, 1, 0, 1,
-0.3367422, -1.303445, -2.447724, 0.05490196, 1, 0, 1,
-0.3345921, -0.493584, -0.6381174, 0.05098039, 1, 0, 1,
-0.3314196, 0.3745001, -1.183925, 0.04313726, 1, 0, 1,
-0.331108, 0.4978434, -0.4655707, 0.03921569, 1, 0, 1,
-0.3296614, -0.2530105, -0.8298638, 0.03137255, 1, 0, 1,
-0.328681, -0.2739268, -3.009063, 0.02745098, 1, 0, 1,
-0.3238234, 0.4947463, -1.478448, 0.01960784, 1, 0, 1,
-0.3224313, -0.3498416, -2.496157, 0.01568628, 1, 0, 1,
-0.3212065, -1.610377, -4.156665, 0.007843138, 1, 0, 1,
-0.3157065, 0.3239106, -1.378345, 0.003921569, 1, 0, 1,
-0.3140054, 0.5216535, 0.0735068, 0, 1, 0.003921569, 1,
-0.3136653, -1.940173, -2.041431, 0, 1, 0.01176471, 1,
-0.3085201, 1.589403, 0.01589143, 0, 1, 0.01568628, 1,
-0.3079809, 0.01280671, -3.579573, 0, 1, 0.02352941, 1,
-0.3037384, 1.726261, 0.6632173, 0, 1, 0.02745098, 1,
-0.2985768, -0.8392242, -1.686061, 0, 1, 0.03529412, 1,
-0.2982244, 0.8277121, 0.06943426, 0, 1, 0.03921569, 1,
-0.2970284, -0.1756845, -1.132711, 0, 1, 0.04705882, 1,
-0.2908194, 0.9497164, -0.4128523, 0, 1, 0.05098039, 1,
-0.2837868, -0.9613606, -1.553149, 0, 1, 0.05882353, 1,
-0.2827543, -0.8714654, -2.840394, 0, 1, 0.0627451, 1,
-0.2814666, -0.1160403, -1.293267, 0, 1, 0.07058824, 1,
-0.278938, -0.02651719, -1.904176, 0, 1, 0.07450981, 1,
-0.2752149, 0.1783122, -0.558701, 0, 1, 0.08235294, 1,
-0.2738257, -2.060416, -4.419303, 0, 1, 0.08627451, 1,
-0.2685371, 1.62745, -0.1762482, 0, 1, 0.09411765, 1,
-0.2669468, 0.5584128, 0.3376233, 0, 1, 0.1019608, 1,
-0.2608128, -0.9735972, -2.22961, 0, 1, 0.1058824, 1,
-0.254834, 0.6295625, 0.04206522, 0, 1, 0.1137255, 1,
-0.2539706, -0.6206349, -2.34392, 0, 1, 0.1176471, 1,
-0.2520712, -1.821063, -1.711927, 0, 1, 0.1254902, 1,
-0.2515311, -0.9236186, -3.072778, 0, 1, 0.1294118, 1,
-0.250925, -0.6714635, -2.387383, 0, 1, 0.1372549, 1,
-0.2487659, 0.133993, -0.9987062, 0, 1, 0.1411765, 1,
-0.2473836, 1.104093, -0.0582505, 0, 1, 0.1490196, 1,
-0.2462613, 0.3643581, 0.9882647, 0, 1, 0.1529412, 1,
-0.2449214, 1.37938, 0.06193226, 0, 1, 0.1607843, 1,
-0.2410218, 1.016107, -0.1039612, 0, 1, 0.1647059, 1,
-0.2369359, -0.3434539, -2.281661, 0, 1, 0.172549, 1,
-0.2358273, 1.281106, -0.8499939, 0, 1, 0.1764706, 1,
-0.2342079, 1.412429, -0.643513, 0, 1, 0.1843137, 1,
-0.2315223, -0.4781111, -2.397262, 0, 1, 0.1882353, 1,
-0.2280402, -1.033721, -3.968639, 0, 1, 0.1960784, 1,
-0.2262491, -0.6751911, -2.86429, 0, 1, 0.2039216, 1,
-0.2237504, -0.7935688, -3.305019, 0, 1, 0.2078431, 1,
-0.2221534, -0.9130114, -2.722463, 0, 1, 0.2156863, 1,
-0.219654, 0.5499016, -0.7990634, 0, 1, 0.2196078, 1,
-0.2175625, 1.170716, -1.127691, 0, 1, 0.227451, 1,
-0.2168674, -0.3631208, -1.828084, 0, 1, 0.2313726, 1,
-0.2112227, -0.1835701, -3.20264, 0, 1, 0.2392157, 1,
-0.2093278, 0.2920189, -1.227711, 0, 1, 0.2431373, 1,
-0.2072528, -0.2863016, -2.125994, 0, 1, 0.2509804, 1,
-0.2026369, 0.4250636, -1.008212, 0, 1, 0.254902, 1,
-0.1953608, 0.2418247, -1.928521, 0, 1, 0.2627451, 1,
-0.1927279, 0.6235167, -2.731426, 0, 1, 0.2666667, 1,
-0.1916616, 1.151498, 1.011672, 0, 1, 0.2745098, 1,
-0.1911446, -0.4325193, -3.101091, 0, 1, 0.2784314, 1,
-0.1887949, -2.080676, -3.786091, 0, 1, 0.2862745, 1,
-0.187563, 0.4102522, -0.2453754, 0, 1, 0.2901961, 1,
-0.1855497, -0.4112484, -4.209422, 0, 1, 0.2980392, 1,
-0.1838276, -0.4234659, -3.221866, 0, 1, 0.3058824, 1,
-0.1825628, -0.4002059, -0.8756386, 0, 1, 0.3098039, 1,
-0.1813546, -0.02166593, -1.823271, 0, 1, 0.3176471, 1,
-0.1808309, -0.8476266, -3.563826, 0, 1, 0.3215686, 1,
-0.1791004, -0.08057149, -1.092836, 0, 1, 0.3294118, 1,
-0.175507, -0.4769358, -3.392527, 0, 1, 0.3333333, 1,
-0.1720252, -1.352012, -3.275077, 0, 1, 0.3411765, 1,
-0.1706388, 1.310169, 0.345031, 0, 1, 0.345098, 1,
-0.1682828, 0.830671, 0.4247602, 0, 1, 0.3529412, 1,
-0.1680349, 0.8197247, 0.0223201, 0, 1, 0.3568628, 1,
-0.1677492, 0.4926266, -0.1042133, 0, 1, 0.3647059, 1,
-0.1640863, 0.281073, -0.7846887, 0, 1, 0.3686275, 1,
-0.163308, -0.8709052, -2.751554, 0, 1, 0.3764706, 1,
-0.163074, -0.4911994, -2.762874, 0, 1, 0.3803922, 1,
-0.162178, -0.7950304, -2.877067, 0, 1, 0.3882353, 1,
-0.1600773, 1.933364, 2.282438, 0, 1, 0.3921569, 1,
-0.1591456, 1.003232, -0.870941, 0, 1, 0.4, 1,
-0.1574735, 1.290978, -0.8450814, 0, 1, 0.4078431, 1,
-0.1573358, 0.9794072, 0.8583947, 0, 1, 0.4117647, 1,
-0.1535662, -0.6777737, -4.183036, 0, 1, 0.4196078, 1,
-0.1529451, 0.9705127, -0.1780516, 0, 1, 0.4235294, 1,
-0.1519883, 0.3248336, -0.1070546, 0, 1, 0.4313726, 1,
-0.1482915, -0.872075, -1.812814, 0, 1, 0.4352941, 1,
-0.1440612, 2.665112, 0.4878849, 0, 1, 0.4431373, 1,
-0.1436182, 1.918501, -0.4727596, 0, 1, 0.4470588, 1,
-0.1385703, 0.9740813, 1.042686, 0, 1, 0.454902, 1,
-0.1374227, 0.985732, -1.156318, 0, 1, 0.4588235, 1,
-0.1294306, 0.9122481, 0.6981019, 0, 1, 0.4666667, 1,
-0.1258165, -0.9325954, -2.679947, 0, 1, 0.4705882, 1,
-0.1242945, 1.593821, 0.6291954, 0, 1, 0.4784314, 1,
-0.1223224, 1.291025, -0.761407, 0, 1, 0.4823529, 1,
-0.1188303, 0.2041017, -2.101798, 0, 1, 0.4901961, 1,
-0.1186566, -2.061106, -4.516878, 0, 1, 0.4941176, 1,
-0.1142246, 0.4072539, -0.02099942, 0, 1, 0.5019608, 1,
-0.1111849, 0.2110885, -0.9131944, 0, 1, 0.509804, 1,
-0.1111718, 0.4381661, -0.6225898, 0, 1, 0.5137255, 1,
-0.1093038, 1.281422, -0.06159385, 0, 1, 0.5215687, 1,
-0.1078017, -0.3086676, -1.68589, 0, 1, 0.5254902, 1,
-0.1064123, 0.007497082, -2.267908, 0, 1, 0.5333334, 1,
-0.106091, 0.4204969, 0.2380712, 0, 1, 0.5372549, 1,
-0.1034418, 0.3145275, 0.2931826, 0, 1, 0.5450981, 1,
-0.1006507, -0.4786434, -2.935084, 0, 1, 0.5490196, 1,
-0.1005688, 0.8400297, 1.057512, 0, 1, 0.5568628, 1,
-0.09930901, -0.4602349, -3.414459, 0, 1, 0.5607843, 1,
-0.09745573, -0.1566728, -3.564664, 0, 1, 0.5686275, 1,
-0.09416398, 0.262549, 0.5408928, 0, 1, 0.572549, 1,
-0.09407115, 0.7217709, 0.5294173, 0, 1, 0.5803922, 1,
-0.09317207, -0.09526826, -3.441012, 0, 1, 0.5843138, 1,
-0.09277886, -0.991223, -1.026432, 0, 1, 0.5921569, 1,
-0.08847552, 1.428281, 1.321496, 0, 1, 0.5960785, 1,
-0.08759804, -0.7851964, -3.737398, 0, 1, 0.6039216, 1,
-0.08227403, 0.1806774, -0.475516, 0, 1, 0.6117647, 1,
-0.08146235, 1.275736, 0.4726519, 0, 1, 0.6156863, 1,
-0.08142905, -0.6862862, -2.148052, 0, 1, 0.6235294, 1,
-0.07753474, 1.785691, 0.772193, 0, 1, 0.627451, 1,
-0.07719227, -1.061121, -2.762348, 0, 1, 0.6352941, 1,
-0.0755167, 1.857056, -1.584781, 0, 1, 0.6392157, 1,
-0.07548062, -0.6249974, -3.326728, 0, 1, 0.6470588, 1,
-0.05239228, 0.8432395, 0.4426607, 0, 1, 0.6509804, 1,
-0.05210173, -0.4007635, -2.554176, 0, 1, 0.6588235, 1,
-0.05188319, 0.9450599, 1.879698, 0, 1, 0.6627451, 1,
-0.05179159, -0.8717257, -2.711936, 0, 1, 0.6705883, 1,
-0.04403269, 0.2442405, -0.950798, 0, 1, 0.6745098, 1,
-0.04321123, -0.5376952, -2.563712, 0, 1, 0.682353, 1,
-0.04316441, 0.2271162, -0.0473882, 0, 1, 0.6862745, 1,
-0.04214173, 1.09505, 1.072804, 0, 1, 0.6941177, 1,
-0.03850042, 0.09283255, -0.6024527, 0, 1, 0.7019608, 1,
-0.03244236, -1.845281, -4.530702, 0, 1, 0.7058824, 1,
-0.03024312, -0.2748181, -1.475181, 0, 1, 0.7137255, 1,
-0.02982409, -1.133435, -4.652582, 0, 1, 0.7176471, 1,
-0.02811556, 0.210469, -0.7656723, 0, 1, 0.7254902, 1,
-0.0219994, 0.7753652, -0.8644691, 0, 1, 0.7294118, 1,
-0.01982121, 0.4502509, 1.237413, 0, 1, 0.7372549, 1,
-0.01171828, -0.08264912, -2.300562, 0, 1, 0.7411765, 1,
-0.005922887, 0.1310249, -1.288508, 0, 1, 0.7490196, 1,
-0.00561484, 0.7420653, 0.006767067, 0, 1, 0.7529412, 1,
-0.00504639, -1.25706, -2.650264, 0, 1, 0.7607843, 1,
-0.004949766, 2.716301, -1.08537, 0, 1, 0.7647059, 1,
-0.0009427338, -1.297789, -1.936603, 0, 1, 0.772549, 1,
-4.990668e-05, -0.002191632, -2.187779, 0, 1, 0.7764706, 1,
0.002169647, 0.6286781, 0.3046296, 0, 1, 0.7843137, 1,
0.003285625, 0.3783724, 0.255802, 0, 1, 0.7882353, 1,
0.00713166, -0.1800651, 3.243708, 0, 1, 0.7960784, 1,
0.007223549, -1.943363, 2.259305, 0, 1, 0.8039216, 1,
0.01655116, -0.3603759, 1.468204, 0, 1, 0.8078431, 1,
0.01970085, -0.7803193, 4.865251, 0, 1, 0.8156863, 1,
0.02120335, 0.8901377, -0.8361247, 0, 1, 0.8196079, 1,
0.021214, -0.04713756, 4.49368, 0, 1, 0.827451, 1,
0.02133056, 0.7738406, -2.024365, 0, 1, 0.8313726, 1,
0.02502118, 0.3980553, -0.3454836, 0, 1, 0.8392157, 1,
0.02538149, -0.2315781, 4.297066, 0, 1, 0.8431373, 1,
0.02678093, 0.6339391, 0.2536172, 0, 1, 0.8509804, 1,
0.02911749, 1.21911, -1.742528, 0, 1, 0.854902, 1,
0.02982512, -1.199512, 2.614991, 0, 1, 0.8627451, 1,
0.03070886, 1.009914, -0.3397282, 0, 1, 0.8666667, 1,
0.03372155, 0.1143341, 0.8631443, 0, 1, 0.8745098, 1,
0.03632389, 0.167905, -0.7785141, 0, 1, 0.8784314, 1,
0.03705629, 0.3266729, 0.7868037, 0, 1, 0.8862745, 1,
0.03791476, -0.470562, 2.8368, 0, 1, 0.8901961, 1,
0.04071749, 1.360143, -0.5583348, 0, 1, 0.8980392, 1,
0.04719054, -0.3728609, 2.810111, 0, 1, 0.9058824, 1,
0.0492002, 0.4699565, -1.021798, 0, 1, 0.9098039, 1,
0.05540716, 1.314791, 0.118591, 0, 1, 0.9176471, 1,
0.05740589, 1.04083, 0.2564489, 0, 1, 0.9215686, 1,
0.05941325, 0.4425685, 0.1853122, 0, 1, 0.9294118, 1,
0.06003217, 0.1110388, 1.734133, 0, 1, 0.9333333, 1,
0.06090459, 1.68012, 0.1080113, 0, 1, 0.9411765, 1,
0.06611042, -0.7138689, 3.693045, 0, 1, 0.945098, 1,
0.06949935, -0.8926852, 3.496071, 0, 1, 0.9529412, 1,
0.0713032, 0.1181781, 0.4405392, 0, 1, 0.9568627, 1,
0.07223403, 0.5023552, 1.458199, 0, 1, 0.9647059, 1,
0.07494124, 1.010602, -0.9895622, 0, 1, 0.9686275, 1,
0.07790552, -1.121708, 2.869578, 0, 1, 0.9764706, 1,
0.07852902, 0.239276, 1.706614, 0, 1, 0.9803922, 1,
0.08024383, -1.633678, 3.598347, 0, 1, 0.9882353, 1,
0.08094937, 0.01876181, 1.011966, 0, 1, 0.9921569, 1,
0.08528578, 1.000865, -0.6054249, 0, 1, 1, 1,
0.09019356, 1.199934, -0.4146839, 0, 0.9921569, 1, 1,
0.09151684, 1.279905, -0.1673182, 0, 0.9882353, 1, 1,
0.09232211, -1.24288, 1.609376, 0, 0.9803922, 1, 1,
0.0943863, -1.919848, 2.346677, 0, 0.9764706, 1, 1,
0.09453599, 1.168515, 2.562776, 0, 0.9686275, 1, 1,
0.0977775, -0.2375168, 1.684622, 0, 0.9647059, 1, 1,
0.1022316, -1.156801, 3.781452, 0, 0.9568627, 1, 1,
0.1035312, 0.1759439, 0.422602, 0, 0.9529412, 1, 1,
0.1064844, -0.9851581, 4.291609, 0, 0.945098, 1, 1,
0.1083833, -1.030871, 3.242068, 0, 0.9411765, 1, 1,
0.1105141, -0.1832082, 2.785074, 0, 0.9333333, 1, 1,
0.1106939, 0.02612295, 2.698479, 0, 0.9294118, 1, 1,
0.1146697, -1.590775, 0.07180685, 0, 0.9215686, 1, 1,
0.1164831, -1.50483, 3.76634, 0, 0.9176471, 1, 1,
0.117367, 1.918744, -0.9137193, 0, 0.9098039, 1, 1,
0.1192191, -0.05285795, 2.560106, 0, 0.9058824, 1, 1,
0.1194356, -0.9822962, 2.946672, 0, 0.8980392, 1, 1,
0.1215754, 0.05132354, 0.002232004, 0, 0.8901961, 1, 1,
0.1232533, 0.006394735, 1.052063, 0, 0.8862745, 1, 1,
0.124311, -1.444301, 3.913682, 0, 0.8784314, 1, 1,
0.1248942, 1.212243, -0.7153606, 0, 0.8745098, 1, 1,
0.1295488, -0.0004636942, 2.997434, 0, 0.8666667, 1, 1,
0.1300001, 0.1003147, -0.2558239, 0, 0.8627451, 1, 1,
0.1303588, 1.703134, -0.1018508, 0, 0.854902, 1, 1,
0.1386368, -0.3397785, 3.117209, 0, 0.8509804, 1, 1,
0.1423299, 0.4770726, 1.204311, 0, 0.8431373, 1, 1,
0.1479924, 2.170093, 1.192864, 0, 0.8392157, 1, 1,
0.1489259, -0.5376809, 2.65789, 0, 0.8313726, 1, 1,
0.1502257, -0.7321441, 2.550514, 0, 0.827451, 1, 1,
0.1508989, 1.392815, 0.8651182, 0, 0.8196079, 1, 1,
0.1550588, -1.405486, 3.023013, 0, 0.8156863, 1, 1,
0.1552405, 0.7609299, 1.024278, 0, 0.8078431, 1, 1,
0.1558925, 0.9457154, 1.211502, 0, 0.8039216, 1, 1,
0.1565011, -0.9296989, 1.950186, 0, 0.7960784, 1, 1,
0.157363, 0.887502, -0.9869643, 0, 0.7882353, 1, 1,
0.1625554, -2.030123, 3.735177, 0, 0.7843137, 1, 1,
0.166712, 0.110965, 2.172524, 0, 0.7764706, 1, 1,
0.1667777, 1.490326, -0.2627713, 0, 0.772549, 1, 1,
0.1715818, -1.08987, 3.156053, 0, 0.7647059, 1, 1,
0.1760203, -0.06861795, 1.251006, 0, 0.7607843, 1, 1,
0.178194, 0.0666376, 0.5167944, 0, 0.7529412, 1, 1,
0.1798721, -0.1212086, 0.2906893, 0, 0.7490196, 1, 1,
0.1810164, 0.1571198, 0.04798457, 0, 0.7411765, 1, 1,
0.1823705, 0.3090112, 1.216193, 0, 0.7372549, 1, 1,
0.1834259, -0.2024409, 0.6558436, 0, 0.7294118, 1, 1,
0.1836321, -0.5385885, 3.064133, 0, 0.7254902, 1, 1,
0.1844674, 0.09929024, 1.342329, 0, 0.7176471, 1, 1,
0.1862237, -0.6309648, 3.792985, 0, 0.7137255, 1, 1,
0.1895867, -0.1326905, 1.153807, 0, 0.7058824, 1, 1,
0.1917763, -1.701358, 2.407127, 0, 0.6980392, 1, 1,
0.1931518, -0.4673207, 0.9139518, 0, 0.6941177, 1, 1,
0.1950259, -0.3671337, 2.644783, 0, 0.6862745, 1, 1,
0.2012213, -0.5352645, 3.760539, 0, 0.682353, 1, 1,
0.2012646, -0.4886333, 1.053334, 0, 0.6745098, 1, 1,
0.201527, 2.292746, -0.5990928, 0, 0.6705883, 1, 1,
0.2038891, -0.9214039, 0.871029, 0, 0.6627451, 1, 1,
0.2051579, -0.4801145, 3.944675, 0, 0.6588235, 1, 1,
0.2101956, -0.3035178, 3.20265, 0, 0.6509804, 1, 1,
0.2136932, -2.150287, 3.631685, 0, 0.6470588, 1, 1,
0.2145613, 0.8198978, -0.1881768, 0, 0.6392157, 1, 1,
0.2147365, 1.096809, -1.043096, 0, 0.6352941, 1, 1,
0.2166823, 0.7350195, 0.8995695, 0, 0.627451, 1, 1,
0.2224632, 0.791002, 1.821128, 0, 0.6235294, 1, 1,
0.2240178, -0.00164055, 1.575603, 0, 0.6156863, 1, 1,
0.2267807, 0.9745805, -0.2023038, 0, 0.6117647, 1, 1,
0.2325522, -0.2542841, 2.568719, 0, 0.6039216, 1, 1,
0.2394437, 0.02604506, 2.299471, 0, 0.5960785, 1, 1,
0.2396238, -1.527603, 2.741894, 0, 0.5921569, 1, 1,
0.2397366, -0.8952092, 2.932283, 0, 0.5843138, 1, 1,
0.2467825, 1.099444, 0.7283821, 0, 0.5803922, 1, 1,
0.2470607, -1.201031, 1.68333, 0, 0.572549, 1, 1,
0.248569, 0.6290897, -0.2495209, 0, 0.5686275, 1, 1,
0.2547175, -0.8316627, 3.593035, 0, 0.5607843, 1, 1,
0.2555019, 0.9333968, -1.184764, 0, 0.5568628, 1, 1,
0.2562089, 0.8144563, 1.594453, 0, 0.5490196, 1, 1,
0.2570851, 0.6372219, 0.576188, 0, 0.5450981, 1, 1,
0.260657, 0.6888837, 0.7981746, 0, 0.5372549, 1, 1,
0.261116, 0.3513975, -0.340497, 0, 0.5333334, 1, 1,
0.2681357, 0.5300744, 2.451894, 0, 0.5254902, 1, 1,
0.2748685, 0.732953, -0.5091048, 0, 0.5215687, 1, 1,
0.2802536, -1.409678, 2.039099, 0, 0.5137255, 1, 1,
0.2808248, -0.3421132, 2.562472, 0, 0.509804, 1, 1,
0.2811786, -1.220678, 1.578273, 0, 0.5019608, 1, 1,
0.2843283, 1.356754, 1.326062, 0, 0.4941176, 1, 1,
0.2843355, 0.5762904, 0.02833074, 0, 0.4901961, 1, 1,
0.2847367, 0.3259241, -0.07786303, 0, 0.4823529, 1, 1,
0.2869859, -1.298257, 2.186164, 0, 0.4784314, 1, 1,
0.2927729, 0.2838421, -0.2141365, 0, 0.4705882, 1, 1,
0.2943337, 0.7593903, 0.5194883, 0, 0.4666667, 1, 1,
0.2992006, 1.141587, -0.2444585, 0, 0.4588235, 1, 1,
0.3003223, -1.166878, 2.397788, 0, 0.454902, 1, 1,
0.3008212, -0.03149721, 2.723989, 0, 0.4470588, 1, 1,
0.3088569, -0.1501965, 3.329732, 0, 0.4431373, 1, 1,
0.3098929, 0.2779769, -0.04302384, 0, 0.4352941, 1, 1,
0.3125999, -1.043411, 3.985548, 0, 0.4313726, 1, 1,
0.3127207, 2.041586, 1.21056, 0, 0.4235294, 1, 1,
0.3167244, -2.074211, 2.865383, 0, 0.4196078, 1, 1,
0.3187805, 0.7824595, 0.6047254, 0, 0.4117647, 1, 1,
0.3191277, 0.866104, 1.125706, 0, 0.4078431, 1, 1,
0.3199012, 0.8492496, 1.54493, 0, 0.4, 1, 1,
0.3218771, -1.447513, 1.855735, 0, 0.3921569, 1, 1,
0.3246647, -0.5170587, 3.581151, 0, 0.3882353, 1, 1,
0.3254339, -0.2982592, 2.154864, 0, 0.3803922, 1, 1,
0.3265951, -1.777725, 4.185569, 0, 0.3764706, 1, 1,
0.3277412, 0.6470197, 0.5198385, 0, 0.3686275, 1, 1,
0.3321213, 0.1741719, 0.3584677, 0, 0.3647059, 1, 1,
0.3324519, 0.2675382, 0.2372064, 0, 0.3568628, 1, 1,
0.3338026, -0.9201432, 3.477894, 0, 0.3529412, 1, 1,
0.3411619, -1.216287, 3.154308, 0, 0.345098, 1, 1,
0.3457078, -0.5383335, 3.345778, 0, 0.3411765, 1, 1,
0.3458737, -0.7097239, 3.027274, 0, 0.3333333, 1, 1,
0.3494354, 0.6462713, -0.008143029, 0, 0.3294118, 1, 1,
0.3524712, -1.546149, 2.826467, 0, 0.3215686, 1, 1,
0.3527137, 0.6428758, -1.432369, 0, 0.3176471, 1, 1,
0.3546562, 1.675745, 0.1832904, 0, 0.3098039, 1, 1,
0.3567675, -0.217898, 2.25914, 0, 0.3058824, 1, 1,
0.3569624, -0.3632559, 3.379174, 0, 0.2980392, 1, 1,
0.3587856, -0.4751627, 2.434949, 0, 0.2901961, 1, 1,
0.3642466, 1.058459, 0.8885654, 0, 0.2862745, 1, 1,
0.3648452, -0.497611, 2.31678, 0, 0.2784314, 1, 1,
0.3662354, 1.503985, 1.420838, 0, 0.2745098, 1, 1,
0.3702752, -0.02633312, 1.271772, 0, 0.2666667, 1, 1,
0.3713205, 0.6588615, 0.5764298, 0, 0.2627451, 1, 1,
0.373274, 1.695522, 0.0284404, 0, 0.254902, 1, 1,
0.3736686, 0.1986093, 0.8812819, 0, 0.2509804, 1, 1,
0.3747428, -0.9301846, 1.884101, 0, 0.2431373, 1, 1,
0.3770278, 1.678933, 2.309871, 0, 0.2392157, 1, 1,
0.377701, -1.132156, 4.468989, 0, 0.2313726, 1, 1,
0.3798528, 1.350914, -1.993338, 0, 0.227451, 1, 1,
0.3830829, 1.118417, 0.3451709, 0, 0.2196078, 1, 1,
0.3831928, -0.8949326, 1.277002, 0, 0.2156863, 1, 1,
0.385385, -1.576694, 2.601979, 0, 0.2078431, 1, 1,
0.3874144, 0.6642054, 1.372113, 0, 0.2039216, 1, 1,
0.3875136, -0.7459614, 1.883006, 0, 0.1960784, 1, 1,
0.387863, 1.454429, -0.2064175, 0, 0.1882353, 1, 1,
0.3912465, -0.5785376, 1.098331, 0, 0.1843137, 1, 1,
0.3937933, 0.15076, 1.367179, 0, 0.1764706, 1, 1,
0.396197, -0.7774807, 4.485838, 0, 0.172549, 1, 1,
0.3963161, -0.8482364, 2.565233, 0, 0.1647059, 1, 1,
0.3995805, -1.444218, 2.946954, 0, 0.1607843, 1, 1,
0.4029484, -0.4489743, 1.284185, 0, 0.1529412, 1, 1,
0.4034734, -0.1208436, 2.024645, 0, 0.1490196, 1, 1,
0.403731, 1.159518, 1.771441, 0, 0.1411765, 1, 1,
0.4050133, -0.09603094, 0.3814304, 0, 0.1372549, 1, 1,
0.4062041, -0.6480532, 1.315304, 0, 0.1294118, 1, 1,
0.4071788, -0.4141944, 2.186202, 0, 0.1254902, 1, 1,
0.4086682, 1.989158, -0.5854985, 0, 0.1176471, 1, 1,
0.4101535, -1.679748, 2.434677, 0, 0.1137255, 1, 1,
0.4104179, -0.2339328, 1.355025, 0, 0.1058824, 1, 1,
0.4110244, -0.1820075, 1.916448, 0, 0.09803922, 1, 1,
0.4111476, 1.10048, -0.07218741, 0, 0.09411765, 1, 1,
0.4166714, -0.4723391, 1.911092, 0, 0.08627451, 1, 1,
0.4198907, 0.1953623, 0.1523867, 0, 0.08235294, 1, 1,
0.4215856, 1.046499, 0.7874594, 0, 0.07450981, 1, 1,
0.4227675, 0.1842151, 1.832749, 0, 0.07058824, 1, 1,
0.4267021, -1.123205, 2.446969, 0, 0.0627451, 1, 1,
0.4292014, -0.9149141, 2.824968, 0, 0.05882353, 1, 1,
0.4361323, 0.51513, -0.4150333, 0, 0.05098039, 1, 1,
0.4376225, -1.618329, 3.630795, 0, 0.04705882, 1, 1,
0.4412396, -1.12276, 1.696698, 0, 0.03921569, 1, 1,
0.4423381, 0.02499578, 2.21095, 0, 0.03529412, 1, 1,
0.4427632, 0.09537393, 1.796095, 0, 0.02745098, 1, 1,
0.4443046, -0.5338079, 1.070642, 0, 0.02352941, 1, 1,
0.4458548, -0.453727, 2.072037, 0, 0.01568628, 1, 1,
0.4470313, 0.1420476, -1.255816, 0, 0.01176471, 1, 1,
0.4503342, 0.4706218, 0.6836794, 0, 0.003921569, 1, 1,
0.4661155, -0.1425039, 0.9330187, 0.003921569, 0, 1, 1,
0.4713923, 1.147399, -0.7061384, 0.007843138, 0, 1, 1,
0.4715503, -0.8186629, 1.704608, 0.01568628, 0, 1, 1,
0.4737322, 0.05061917, 2.520674, 0.01960784, 0, 1, 1,
0.4739181, -0.7395641, 3.978894, 0.02745098, 0, 1, 1,
0.4804237, -1.058512, 3.511974, 0.03137255, 0, 1, 1,
0.4817386, 0.1500709, 1.263716, 0.03921569, 0, 1, 1,
0.4860957, 2.049224, 1.400157, 0.04313726, 0, 1, 1,
0.4877675, 0.5643852, 1.761832, 0.05098039, 0, 1, 1,
0.4908555, -1.638722, 3.4093, 0.05490196, 0, 1, 1,
0.4934653, 0.2852549, 0.003516473, 0.0627451, 0, 1, 1,
0.4955604, -0.2285329, 1.982994, 0.06666667, 0, 1, 1,
0.4985434, -0.6489804, 3.119245, 0.07450981, 0, 1, 1,
0.5022181, 1.498085, -0.2942319, 0.07843138, 0, 1, 1,
0.5044728, 0.4337644, 1.673142, 0.08627451, 0, 1, 1,
0.5060601, 2.199192, 1.603695, 0.09019608, 0, 1, 1,
0.5111055, -1.312991, 3.501703, 0.09803922, 0, 1, 1,
0.5141371, 0.005118912, -0.127213, 0.1058824, 0, 1, 1,
0.5217958, 0.4888276, 0.5212464, 0.1098039, 0, 1, 1,
0.5270748, 0.1216139, 2.672953, 0.1176471, 0, 1, 1,
0.5309589, -0.9374182, 0.971819, 0.1215686, 0, 1, 1,
0.537255, 2.137426, -0.7314612, 0.1294118, 0, 1, 1,
0.5374674, 0.6128162, -0.3997037, 0.1333333, 0, 1, 1,
0.5440075, -0.03658691, 0.7894698, 0.1411765, 0, 1, 1,
0.5453038, 1.646466, 1.196671, 0.145098, 0, 1, 1,
0.5474688, 0.3422115, 1.498043, 0.1529412, 0, 1, 1,
0.5566857, -0.4590972, 1.420546, 0.1568628, 0, 1, 1,
0.5570112, -0.7709008, 5.10561, 0.1647059, 0, 1, 1,
0.5575956, 0.6771858, -0.4370628, 0.1686275, 0, 1, 1,
0.5597173, 0.8068771, 0.2410394, 0.1764706, 0, 1, 1,
0.561634, -0.3439519, 1.881589, 0.1803922, 0, 1, 1,
0.5620733, -0.7934473, 2.067979, 0.1882353, 0, 1, 1,
0.563243, 1.093066, -0.8949556, 0.1921569, 0, 1, 1,
0.5702009, -0.4281208, 2.579601, 0.2, 0, 1, 1,
0.5713179, -0.7756433, 2.895406, 0.2078431, 0, 1, 1,
0.5736586, -0.1132587, 0.5671242, 0.2117647, 0, 1, 1,
0.5736893, 2.248745, -0.4265517, 0.2196078, 0, 1, 1,
0.5784612, 0.8899665, 1.164529, 0.2235294, 0, 1, 1,
0.5809596, -0.4029815, 3.242149, 0.2313726, 0, 1, 1,
0.5905223, -1.665094, 1.885445, 0.2352941, 0, 1, 1,
0.5918016, 1.459947, 1.542439, 0.2431373, 0, 1, 1,
0.5947362, 0.5445836, 2.210733, 0.2470588, 0, 1, 1,
0.5970833, 0.005567362, 3.355453, 0.254902, 0, 1, 1,
0.5997233, -0.8993442, 1.656692, 0.2588235, 0, 1, 1,
0.603997, -1.401138, 0.6667851, 0.2666667, 0, 1, 1,
0.6147928, 0.6384594, -0.3525502, 0.2705882, 0, 1, 1,
0.6196647, -0.01474796, 0.7920276, 0.2784314, 0, 1, 1,
0.620231, -0.4314381, 3.356962, 0.282353, 0, 1, 1,
0.6249273, 0.2963271, 2.622581, 0.2901961, 0, 1, 1,
0.6253887, -0.7310252, 1.721052, 0.2941177, 0, 1, 1,
0.6293145, -2.095847, 2.883228, 0.3019608, 0, 1, 1,
0.6310654, 0.421652, 1.472037, 0.3098039, 0, 1, 1,
0.6313473, -1.324646, 3.81703, 0.3137255, 0, 1, 1,
0.6422229, 0.004343146, 1.701057, 0.3215686, 0, 1, 1,
0.6486987, -0.7231982, 1.879948, 0.3254902, 0, 1, 1,
0.6523322, -0.9123614, 2.008854, 0.3333333, 0, 1, 1,
0.6528229, -1.682968, 5.009155, 0.3372549, 0, 1, 1,
0.6568418, -1.528391, 3.512859, 0.345098, 0, 1, 1,
0.6582401, 0.3289376, -0.3044862, 0.3490196, 0, 1, 1,
0.6608683, -2.293486, 1.641029, 0.3568628, 0, 1, 1,
0.6627619, 0.262496, 0.533845, 0.3607843, 0, 1, 1,
0.6645001, 0.4793507, -0.09999312, 0.3686275, 0, 1, 1,
0.6690853, 0.7775455, -1.079723, 0.372549, 0, 1, 1,
0.670867, 2.296056, 0.9967312, 0.3803922, 0, 1, 1,
0.6730283, 1.354504, 0.2469347, 0.3843137, 0, 1, 1,
0.6745272, -0.3553606, 2.861952, 0.3921569, 0, 1, 1,
0.6805242, -0.8456848, 1.915954, 0.3960784, 0, 1, 1,
0.6826454, -0.3543348, 1.821438, 0.4039216, 0, 1, 1,
0.6842389, 0.3857801, 0.2182858, 0.4117647, 0, 1, 1,
0.686204, 0.699966, 0.8804393, 0.4156863, 0, 1, 1,
0.6884444, -0.5482804, 1.620468, 0.4235294, 0, 1, 1,
0.6897939, -0.04976923, 1.873041, 0.427451, 0, 1, 1,
0.7001224, -0.6381995, 2.862566, 0.4352941, 0, 1, 1,
0.7010652, -0.06758883, 0.4488304, 0.4392157, 0, 1, 1,
0.7051474, 0.156719, 2.091709, 0.4470588, 0, 1, 1,
0.7202747, 0.9921297, 0.02309068, 0.4509804, 0, 1, 1,
0.7229773, 0.3305366, 1.693899, 0.4588235, 0, 1, 1,
0.7252218, 0.4223339, 1.862766, 0.4627451, 0, 1, 1,
0.7300081, -0.9142419, 2.826872, 0.4705882, 0, 1, 1,
0.7330674, -0.08491423, 2.224024, 0.4745098, 0, 1, 1,
0.7336874, 1.454336, -0.07634263, 0.4823529, 0, 1, 1,
0.7336926, -0.9703253, 3.329674, 0.4862745, 0, 1, 1,
0.7360553, 0.7600703, 0.4369242, 0.4941176, 0, 1, 1,
0.74279, -0.710871, 3.400232, 0.5019608, 0, 1, 1,
0.7448241, 0.4733202, -0.3364257, 0.5058824, 0, 1, 1,
0.7457745, -1.797189, 4.015636, 0.5137255, 0, 1, 1,
0.7495592, -2.355546, 1.501712, 0.5176471, 0, 1, 1,
0.756677, -0.2565221, 2.271808, 0.5254902, 0, 1, 1,
0.7616538, -2.072881, 2.095222, 0.5294118, 0, 1, 1,
0.7687455, -0.12102, 2.469455, 0.5372549, 0, 1, 1,
0.7726025, -1.973093, 3.385075, 0.5411765, 0, 1, 1,
0.7738927, -0.5592058, 1.45745, 0.5490196, 0, 1, 1,
0.7752101, 0.4639516, -1.327734, 0.5529412, 0, 1, 1,
0.7753037, -0.01095277, 3.029755, 0.5607843, 0, 1, 1,
0.7787815, 0.1568559, 1.058771, 0.5647059, 0, 1, 1,
0.7797792, 0.03864513, -0.2173732, 0.572549, 0, 1, 1,
0.7818301, 1.134935, 1.698575, 0.5764706, 0, 1, 1,
0.7842801, -0.01493975, 0.1217145, 0.5843138, 0, 1, 1,
0.7854811, -0.02535757, 1.648615, 0.5882353, 0, 1, 1,
0.7889575, 0.01481756, 2.334902, 0.5960785, 0, 1, 1,
0.7933522, 0.3444669, 0.3506549, 0.6039216, 0, 1, 1,
0.7939095, 0.4651219, 0.2110406, 0.6078432, 0, 1, 1,
0.8031875, 1.207876, -1.807777, 0.6156863, 0, 1, 1,
0.8050096, 0.8215439, 0.8601696, 0.6196079, 0, 1, 1,
0.8125789, -0.9802077, 2.296068, 0.627451, 0, 1, 1,
0.8206013, 1.725147, 1.31492, 0.6313726, 0, 1, 1,
0.8280549, -0.1115054, 1.945577, 0.6392157, 0, 1, 1,
0.834534, -1.732047, 1.827435, 0.6431373, 0, 1, 1,
0.8411354, 0.3897507, 2.774842, 0.6509804, 0, 1, 1,
0.8429499, 1.417563, 1.166717, 0.654902, 0, 1, 1,
0.8459303, 0.6317602, 1.676893, 0.6627451, 0, 1, 1,
0.8479152, -0.1063462, 2.191324, 0.6666667, 0, 1, 1,
0.8519079, 0.7306897, -0.04896885, 0.6745098, 0, 1, 1,
0.8522268, 0.5006492, 1.681914, 0.6784314, 0, 1, 1,
0.8584424, -2.021211, 2.032015, 0.6862745, 0, 1, 1,
0.8589017, -0.4576365, 2.375091, 0.6901961, 0, 1, 1,
0.8593606, 2.404826, 1.34258, 0.6980392, 0, 1, 1,
0.8637151, 0.1755048, 2.024485, 0.7058824, 0, 1, 1,
0.8676348, 0.4600735, 0.9851567, 0.7098039, 0, 1, 1,
0.870409, 0.7946711, 2.033357, 0.7176471, 0, 1, 1,
0.8788826, 0.6385092, 2.577033, 0.7215686, 0, 1, 1,
0.8800361, 1.179558, 1.495187, 0.7294118, 0, 1, 1,
0.885803, 0.1550704, 2.303422, 0.7333333, 0, 1, 1,
0.8871464, -0.4033814, 2.78585, 0.7411765, 0, 1, 1,
0.8879681, -0.33459, 2.598096, 0.7450981, 0, 1, 1,
0.8962387, 1.704833, -0.6098388, 0.7529412, 0, 1, 1,
0.9024903, -0.3379215, 0.6915281, 0.7568628, 0, 1, 1,
0.9225776, -0.0791572, 3.5981, 0.7647059, 0, 1, 1,
0.923474, 1.186352, 0.4340363, 0.7686275, 0, 1, 1,
0.9276039, 1.225059, -0.9509256, 0.7764706, 0, 1, 1,
0.9345498, 0.0770338, 3.674642, 0.7803922, 0, 1, 1,
0.9369059, 1.329257, 0.410923, 0.7882353, 0, 1, 1,
0.9369427, -0.1453412, 1.633523, 0.7921569, 0, 1, 1,
0.9408763, 0.4477495, 0.9827842, 0.8, 0, 1, 1,
0.9420389, 0.6792862, 2.794427, 0.8078431, 0, 1, 1,
0.9425622, 0.03755246, 1.464781, 0.8117647, 0, 1, 1,
0.9427805, -1.685735, 2.245286, 0.8196079, 0, 1, 1,
0.9477903, 0.9933634, 0.60423, 0.8235294, 0, 1, 1,
0.9498129, -0.08179007, 3.289605, 0.8313726, 0, 1, 1,
0.9499203, -1.575866, 2.707144, 0.8352941, 0, 1, 1,
0.9603435, -0.4735885, 2.141921, 0.8431373, 0, 1, 1,
0.960805, -1.063675, 4.36895, 0.8470588, 0, 1, 1,
0.9611254, -0.9756555, 2.380333, 0.854902, 0, 1, 1,
0.9640846, 1.03664, 2.330314, 0.8588235, 0, 1, 1,
0.9648505, 0.3816806, 1.489221, 0.8666667, 0, 1, 1,
0.96671, -0.4105522, 2.569199, 0.8705882, 0, 1, 1,
0.9726624, -0.4902469, 1.158317, 0.8784314, 0, 1, 1,
0.9794322, 0.5339114, -0.01636928, 0.8823529, 0, 1, 1,
0.9821801, 1.118185, 1.568676, 0.8901961, 0, 1, 1,
0.9834772, 0.741325, 0.7205204, 0.8941177, 0, 1, 1,
0.9846028, -1.452801, 2.529891, 0.9019608, 0, 1, 1,
0.9850537, -0.5128285, 1.654668, 0.9098039, 0, 1, 1,
0.9867547, -1.325567, 1.07012, 0.9137255, 0, 1, 1,
0.9872462, -0.7367597, 3.780128, 0.9215686, 0, 1, 1,
0.9892754, 0.1198039, 2.886047, 0.9254902, 0, 1, 1,
0.9926669, -0.8212784, 3.972866, 0.9333333, 0, 1, 1,
0.9977067, 0.8094004, 1.41619, 0.9372549, 0, 1, 1,
1.0018, 2.165961, -0.3309242, 0.945098, 0, 1, 1,
1.002492, 0.4422839, 2.330137, 0.9490196, 0, 1, 1,
1.009305, 0.5881257, 1.691161, 0.9568627, 0, 1, 1,
1.011022, -0.441633, 2.075349, 0.9607843, 0, 1, 1,
1.019863, 1.020262, 0.03767064, 0.9686275, 0, 1, 1,
1.020243, -1.713121, 1.661669, 0.972549, 0, 1, 1,
1.021045, 0.4840349, 2.41092, 0.9803922, 0, 1, 1,
1.026766, -0.5602762, 2.708015, 0.9843137, 0, 1, 1,
1.029303, -1.234959, -0.1905352, 0.9921569, 0, 1, 1,
1.040392, -1.209177, 3.165104, 0.9960784, 0, 1, 1,
1.045616, -0.7028791, 2.181333, 1, 0, 0.9960784, 1,
1.05525, -0.8141951, 2.800428, 1, 0, 0.9882353, 1,
1.06054, 0.7117079, -0.6565628, 1, 0, 0.9843137, 1,
1.061429, 1.266494, 2.160915, 1, 0, 0.9764706, 1,
1.063114, 0.8189872, 1.293067, 1, 0, 0.972549, 1,
1.065682, 2.874206, -0.2276585, 1, 0, 0.9647059, 1,
1.065719, -0.8889061, 1.573094, 1, 0, 0.9607843, 1,
1.07422, 0.183043, 2.606973, 1, 0, 0.9529412, 1,
1.077481, -0.2401257, 3.542964, 1, 0, 0.9490196, 1,
1.081602, -1.11766, 3.470845, 1, 0, 0.9411765, 1,
1.083066, -0.09022707, 2.28542, 1, 0, 0.9372549, 1,
1.088562, 1.401719, 0.3727078, 1, 0, 0.9294118, 1,
1.091517, -0.2592316, 4.525703, 1, 0, 0.9254902, 1,
1.100045, 1.311721, 0.05388388, 1, 0, 0.9176471, 1,
1.102313, -1.688469, 2.239512, 1, 0, 0.9137255, 1,
1.102382, -0.8211829, 1.756953, 1, 0, 0.9058824, 1,
1.107271, 0.6678662, 1.569246, 1, 0, 0.9019608, 1,
1.113341, -1.238335, 1.546298, 1, 0, 0.8941177, 1,
1.116436, 0.6466466, 1.308852, 1, 0, 0.8862745, 1,
1.118528, -0.5737925, 1.731644, 1, 0, 0.8823529, 1,
1.118651, -0.1926499, 3.165447, 1, 0, 0.8745098, 1,
1.123416, 0.9791002, 1.741576, 1, 0, 0.8705882, 1,
1.124789, -0.07368843, 2.026641, 1, 0, 0.8627451, 1,
1.126032, 1.465456, 1.492527, 1, 0, 0.8588235, 1,
1.126357, -0.799143, 1.859514, 1, 0, 0.8509804, 1,
1.126898, 0.2133188, 3.06681, 1, 0, 0.8470588, 1,
1.127691, -0.6707509, 1.170253, 1, 0, 0.8392157, 1,
1.129287, 0.01140085, 1.420603, 1, 0, 0.8352941, 1,
1.131193, 0.5009374, 1.065238, 1, 0, 0.827451, 1,
1.135909, -1.210242, 3.233405, 1, 0, 0.8235294, 1,
1.139719, -1.779379, 2.82872, 1, 0, 0.8156863, 1,
1.142116, 0.5107622, 1.605753, 1, 0, 0.8117647, 1,
1.142256, 0.160657, -0.6198304, 1, 0, 0.8039216, 1,
1.143067, 1.489896, 0.6597929, 1, 0, 0.7960784, 1,
1.147464, -0.8010878, 1.142307, 1, 0, 0.7921569, 1,
1.152732, -1.95536, 4.255824, 1, 0, 0.7843137, 1,
1.159107, 1.35758, 0.5914081, 1, 0, 0.7803922, 1,
1.163876, -0.4939925, 2.694286, 1, 0, 0.772549, 1,
1.179719, -1.950359, 2.775164, 1, 0, 0.7686275, 1,
1.181391, -0.4323643, 1.703422, 1, 0, 0.7607843, 1,
1.18518, 1.414742, -0.2411958, 1, 0, 0.7568628, 1,
1.189796, 0.08882302, 2.686256, 1, 0, 0.7490196, 1,
1.196435, -1.973934, 2.400964, 1, 0, 0.7450981, 1,
1.19793, 1.142129, 2.330107, 1, 0, 0.7372549, 1,
1.199587, 0.9431884, 1.412291, 1, 0, 0.7333333, 1,
1.204875, 1.503363, 0.01623165, 1, 0, 0.7254902, 1,
1.205464, -0.3280081, 3.106655, 1, 0, 0.7215686, 1,
1.211956, -0.6213366, 1.115855, 1, 0, 0.7137255, 1,
1.218421, 0.5393326, 2.204026, 1, 0, 0.7098039, 1,
1.223767, -0.1237903, 0.4485514, 1, 0, 0.7019608, 1,
1.231397, 0.7340752, 0.689518, 1, 0, 0.6941177, 1,
1.233504, -0.3594429, 3.160002, 1, 0, 0.6901961, 1,
1.236583, 1.071743, 1.708337, 1, 0, 0.682353, 1,
1.246405, -1.004215, 2.697094, 1, 0, 0.6784314, 1,
1.248552, -0.1824273, 1.319482, 1, 0, 0.6705883, 1,
1.260724, 1.160828, 0.1404966, 1, 0, 0.6666667, 1,
1.2626, 1.648765, 1.145685, 1, 0, 0.6588235, 1,
1.285994, -0.04944688, -0.02155861, 1, 0, 0.654902, 1,
1.290855, -0.2993487, 2.770855, 1, 0, 0.6470588, 1,
1.295299, 0.5008343, 0.1232606, 1, 0, 0.6431373, 1,
1.296294, 0.6325015, 0.1899954, 1, 0, 0.6352941, 1,
1.29937, -1.698712, 2.446669, 1, 0, 0.6313726, 1,
1.30002, -0.05369574, 0.3233676, 1, 0, 0.6235294, 1,
1.304123, -1.651363, 3.367155, 1, 0, 0.6196079, 1,
1.311383, 0.8196601, 2.152451, 1, 0, 0.6117647, 1,
1.315197, -0.3043937, 2.801541, 1, 0, 0.6078432, 1,
1.322278, 0.280993, -0.3685474, 1, 0, 0.6, 1,
1.335171, -0.3397334, 2.14602, 1, 0, 0.5921569, 1,
1.349713, 0.6670671, 1.690205, 1, 0, 0.5882353, 1,
1.367883, 0.1550049, 0.50022, 1, 0, 0.5803922, 1,
1.369658, -2.001055, 4.354038, 1, 0, 0.5764706, 1,
1.369804, -0.3969601, 1.399099, 1, 0, 0.5686275, 1,
1.37176, -1.21819, 2.735011, 1, 0, 0.5647059, 1,
1.372662, -1.470908, 1.984979, 1, 0, 0.5568628, 1,
1.380763, -0.1433299, -0.8616552, 1, 0, 0.5529412, 1,
1.385644, -0.7244143, 0.4668235, 1, 0, 0.5450981, 1,
1.399573, -0.6657277, 2.2371, 1, 0, 0.5411765, 1,
1.40016, -1.189955, 3.35067, 1, 0, 0.5333334, 1,
1.402643, 2.014899, 0.5079334, 1, 0, 0.5294118, 1,
1.415381, -0.4899411, 1.0382, 1, 0, 0.5215687, 1,
1.416474, -1.862171, 3.542917, 1, 0, 0.5176471, 1,
1.418074, -0.6921936, 1.52165, 1, 0, 0.509804, 1,
1.418389, 0.9579497, 0.02217513, 1, 0, 0.5058824, 1,
1.440067, -0.7999003, 2.314343, 1, 0, 0.4980392, 1,
1.446708, -0.02811463, 3.272862, 1, 0, 0.4901961, 1,
1.466246, -0.2581905, 2.303516, 1, 0, 0.4862745, 1,
1.467183, 0.01954215, 0.9808972, 1, 0, 0.4784314, 1,
1.475667, -1.946081, 3.16515, 1, 0, 0.4745098, 1,
1.481985, 1.232106, 1.263967, 1, 0, 0.4666667, 1,
1.492556, 1.313562, 0.6888434, 1, 0, 0.4627451, 1,
1.496434, -1.533516, 3.14491, 1, 0, 0.454902, 1,
1.499399, 0.8677623, 0.4509102, 1, 0, 0.4509804, 1,
1.503515, 0.04341947, 4.137065, 1, 0, 0.4431373, 1,
1.503977, 1.474174, 0.2301846, 1, 0, 0.4392157, 1,
1.510475, 0.3480169, 2.624997, 1, 0, 0.4313726, 1,
1.514029, -1.973269, 2.320152, 1, 0, 0.427451, 1,
1.530664, -0.451368, 2.428348, 1, 0, 0.4196078, 1,
1.532917, -0.4944392, 1.919445, 1, 0, 0.4156863, 1,
1.552168, -0.6377676, 3.450248, 1, 0, 0.4078431, 1,
1.560206, -1.040871, 1.110994, 1, 0, 0.4039216, 1,
1.572197, 1.053221, 2.25886, 1, 0, 0.3960784, 1,
1.575129, -1.666015, 1.37749, 1, 0, 0.3882353, 1,
1.602108, 1.02515, 1.120283, 1, 0, 0.3843137, 1,
1.606908, -2.017314, 2.607718, 1, 0, 0.3764706, 1,
1.61421, 0.4522236, 1.175244, 1, 0, 0.372549, 1,
1.618562, -0.2005052, 2.74755, 1, 0, 0.3647059, 1,
1.619051, 0.2566729, -0.05213889, 1, 0, 0.3607843, 1,
1.620668, 0.311518, 0.7175782, 1, 0, 0.3529412, 1,
1.631395, -0.271632, 3.352087, 1, 0, 0.3490196, 1,
1.643903, -2.565461, 2.165747, 1, 0, 0.3411765, 1,
1.657591, -3.5139, 2.809015, 1, 0, 0.3372549, 1,
1.690965, 1.204753, 1.478209, 1, 0, 0.3294118, 1,
1.703463, -1.537711, 2.684151, 1, 0, 0.3254902, 1,
1.718591, -0.2513738, 2.389218, 1, 0, 0.3176471, 1,
1.721586, 0.6305476, 1.577807, 1, 0, 0.3137255, 1,
1.744709, 0.5467768, 0.0453194, 1, 0, 0.3058824, 1,
1.757566, -0.9758457, 1.501717, 1, 0, 0.2980392, 1,
1.769374, 1.427978, 0.1893222, 1, 0, 0.2941177, 1,
1.775957, 0.8401623, 0.9781819, 1, 0, 0.2862745, 1,
1.781328, 0.694047, 0.4604891, 1, 0, 0.282353, 1,
1.803718, 0.4507313, 0.1827951, 1, 0, 0.2745098, 1,
1.807205, 0.8392166, 0.2505747, 1, 0, 0.2705882, 1,
1.827688, 2.815802, 0.9835712, 1, 0, 0.2627451, 1,
1.827717, 0.9012161, 2.43687, 1, 0, 0.2588235, 1,
1.830714, 1.189126, 1.627334, 1, 0, 0.2509804, 1,
1.838787, 0.02390333, 3.33367, 1, 0, 0.2470588, 1,
1.839443, 1.110183, 0.6449112, 1, 0, 0.2392157, 1,
1.845152, -0.2611871, 0.9680647, 1, 0, 0.2352941, 1,
1.85999, 0.5892082, 2.470815, 1, 0, 0.227451, 1,
1.86766, 2.04265, 2.065975, 1, 0, 0.2235294, 1,
1.869339, 0.4660022, 2.678882, 1, 0, 0.2156863, 1,
1.88338, -0.5850798, 1.67254, 1, 0, 0.2117647, 1,
1.931394, -0.444478, 2.632541, 1, 0, 0.2039216, 1,
1.935092, 3.143943, -0.4582697, 1, 0, 0.1960784, 1,
1.94654, -0.2032354, 1.547143, 1, 0, 0.1921569, 1,
1.954337, -1.080024, 1.700354, 1, 0, 0.1843137, 1,
1.966598, -1.20704, 2.443718, 1, 0, 0.1803922, 1,
1.968921, 1.872231, 2.291579, 1, 0, 0.172549, 1,
1.974527, 1.534474, 0.4429958, 1, 0, 0.1686275, 1,
1.983727, 0.1087101, 0.7640668, 1, 0, 0.1607843, 1,
1.9892, -1.289342, 1.890606, 1, 0, 0.1568628, 1,
2.000195, 0.147765, 1.997862, 1, 0, 0.1490196, 1,
2.009885, -0.2889096, 2.364655, 1, 0, 0.145098, 1,
2.052961, 1.780283, 1.590251, 1, 0, 0.1372549, 1,
2.05412, 0.1045328, 2.565337, 1, 0, 0.1333333, 1,
2.059469, -0.7804735, 1.900077, 1, 0, 0.1254902, 1,
2.119411, -1.339371, 2.039169, 1, 0, 0.1215686, 1,
2.128627, -1.196388, 3.174625, 1, 0, 0.1137255, 1,
2.128919, -0.8330051, 1.519475, 1, 0, 0.1098039, 1,
2.147886, 1.613755, 1.548841, 1, 0, 0.1019608, 1,
2.210761, -0.03900724, 1.169532, 1, 0, 0.09411765, 1,
2.232033, 1.267988, -2.934554, 1, 0, 0.09019608, 1,
2.267999, -2.251894, 4.300739, 1, 0, 0.08235294, 1,
2.290719, 0.8759395, 3.448584, 1, 0, 0.07843138, 1,
2.32059, -1.768549, 0.4102846, 1, 0, 0.07058824, 1,
2.344288, 0.5128323, -0.5205562, 1, 0, 0.06666667, 1,
2.40575, 1.588081, 0.6781774, 1, 0, 0.05882353, 1,
2.457699, 1.274441, 2.108509, 1, 0, 0.05490196, 1,
2.495627, 3.054286, 0.1684373, 1, 0, 0.04705882, 1,
2.498653, 0.373114, 0.8190129, 1, 0, 0.04313726, 1,
2.52915, 0.8949845, 2.001317, 1, 0, 0.03529412, 1,
2.557684, -0.8851579, 1.303648, 1, 0, 0.03137255, 1,
2.603588, -0.5603948, 0.01216928, 1, 0, 0.02352941, 1,
2.682146, 1.341214, 0.668636, 1, 0, 0.01960784, 1,
3.089933, 1.051716, 2.221916, 1, 0, 0.01176471, 1,
3.09841, -0.5670252, 3.273451, 1, 0, 0.007843138, 1
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
0.05064511, -4.645705, -6.306596, 0, -0.5, 0.5, 0.5,
0.05064511, -4.645705, -6.306596, 1, -0.5, 0.5, 0.5,
0.05064511, -4.645705, -6.306596, 1, 1.5, 0.5, 0.5,
0.05064511, -4.645705, -6.306596, 0, 1.5, 0.5, 0.5
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
-4.030312, -0.1752422, -6.306596, 0, -0.5, 0.5, 0.5,
-4.030312, -0.1752422, -6.306596, 1, -0.5, 0.5, 0.5,
-4.030312, -0.1752422, -6.306596, 1, 1.5, 0.5, 0.5,
-4.030312, -0.1752422, -6.306596, 0, 1.5, 0.5, 0.5
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
-4.030312, -4.645705, 0.2265141, 0, -0.5, 0.5, 0.5,
-4.030312, -4.645705, 0.2265141, 1, -0.5, 0.5, 0.5,
-4.030312, -4.645705, 0.2265141, 1, 1.5, 0.5, 0.5,
-4.030312, -4.645705, 0.2265141, 0, 1.5, 0.5, 0.5
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
-2, -3.61406, -4.798955,
3, -3.61406, -4.798955,
-2, -3.61406, -4.798955,
-2, -3.786001, -5.050229,
-1, -3.61406, -4.798955,
-1, -3.786001, -5.050229,
0, -3.61406, -4.798955,
0, -3.786001, -5.050229,
1, -3.61406, -4.798955,
1, -3.786001, -5.050229,
2, -3.61406, -4.798955,
2, -3.786001, -5.050229,
3, -3.61406, -4.798955,
3, -3.786001, -5.050229
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
-2, -4.129882, -5.552775, 0, -0.5, 0.5, 0.5,
-2, -4.129882, -5.552775, 1, -0.5, 0.5, 0.5,
-2, -4.129882, -5.552775, 1, 1.5, 0.5, 0.5,
-2, -4.129882, -5.552775, 0, 1.5, 0.5, 0.5,
-1, -4.129882, -5.552775, 0, -0.5, 0.5, 0.5,
-1, -4.129882, -5.552775, 1, -0.5, 0.5, 0.5,
-1, -4.129882, -5.552775, 1, 1.5, 0.5, 0.5,
-1, -4.129882, -5.552775, 0, 1.5, 0.5, 0.5,
0, -4.129882, -5.552775, 0, -0.5, 0.5, 0.5,
0, -4.129882, -5.552775, 1, -0.5, 0.5, 0.5,
0, -4.129882, -5.552775, 1, 1.5, 0.5, 0.5,
0, -4.129882, -5.552775, 0, 1.5, 0.5, 0.5,
1, -4.129882, -5.552775, 0, -0.5, 0.5, 0.5,
1, -4.129882, -5.552775, 1, -0.5, 0.5, 0.5,
1, -4.129882, -5.552775, 1, 1.5, 0.5, 0.5,
1, -4.129882, -5.552775, 0, 1.5, 0.5, 0.5,
2, -4.129882, -5.552775, 0, -0.5, 0.5, 0.5,
2, -4.129882, -5.552775, 1, -0.5, 0.5, 0.5,
2, -4.129882, -5.552775, 1, 1.5, 0.5, 0.5,
2, -4.129882, -5.552775, 0, 1.5, 0.5, 0.5,
3, -4.129882, -5.552775, 0, -0.5, 0.5, 0.5,
3, -4.129882, -5.552775, 1, -0.5, 0.5, 0.5,
3, -4.129882, -5.552775, 1, 1.5, 0.5, 0.5,
3, -4.129882, -5.552775, 0, 1.5, 0.5, 0.5
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
-3.088552, -3, -4.798955,
-3.088552, 3, -4.798955,
-3.088552, -3, -4.798955,
-3.245512, -3, -5.050229,
-3.088552, -2, -4.798955,
-3.245512, -2, -5.050229,
-3.088552, -1, -4.798955,
-3.245512, -1, -5.050229,
-3.088552, 0, -4.798955,
-3.245512, 0, -5.050229,
-3.088552, 1, -4.798955,
-3.245512, 1, -5.050229,
-3.088552, 2, -4.798955,
-3.245512, 2, -5.050229,
-3.088552, 3, -4.798955,
-3.245512, 3, -5.050229
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
-3.559432, -3, -5.552775, 0, -0.5, 0.5, 0.5,
-3.559432, -3, -5.552775, 1, -0.5, 0.5, 0.5,
-3.559432, -3, -5.552775, 1, 1.5, 0.5, 0.5,
-3.559432, -3, -5.552775, 0, 1.5, 0.5, 0.5,
-3.559432, -2, -5.552775, 0, -0.5, 0.5, 0.5,
-3.559432, -2, -5.552775, 1, -0.5, 0.5, 0.5,
-3.559432, -2, -5.552775, 1, 1.5, 0.5, 0.5,
-3.559432, -2, -5.552775, 0, 1.5, 0.5, 0.5,
-3.559432, -1, -5.552775, 0, -0.5, 0.5, 0.5,
-3.559432, -1, -5.552775, 1, -0.5, 0.5, 0.5,
-3.559432, -1, -5.552775, 1, 1.5, 0.5, 0.5,
-3.559432, -1, -5.552775, 0, 1.5, 0.5, 0.5,
-3.559432, 0, -5.552775, 0, -0.5, 0.5, 0.5,
-3.559432, 0, -5.552775, 1, -0.5, 0.5, 0.5,
-3.559432, 0, -5.552775, 1, 1.5, 0.5, 0.5,
-3.559432, 0, -5.552775, 0, 1.5, 0.5, 0.5,
-3.559432, 1, -5.552775, 0, -0.5, 0.5, 0.5,
-3.559432, 1, -5.552775, 1, -0.5, 0.5, 0.5,
-3.559432, 1, -5.552775, 1, 1.5, 0.5, 0.5,
-3.559432, 1, -5.552775, 0, 1.5, 0.5, 0.5,
-3.559432, 2, -5.552775, 0, -0.5, 0.5, 0.5,
-3.559432, 2, -5.552775, 1, -0.5, 0.5, 0.5,
-3.559432, 2, -5.552775, 1, 1.5, 0.5, 0.5,
-3.559432, 2, -5.552775, 0, 1.5, 0.5, 0.5,
-3.559432, 3, -5.552775, 0, -0.5, 0.5, 0.5,
-3.559432, 3, -5.552775, 1, -0.5, 0.5, 0.5,
-3.559432, 3, -5.552775, 1, 1.5, 0.5, 0.5,
-3.559432, 3, -5.552775, 0, 1.5, 0.5, 0.5
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
-3.088552, -3.61406, -4,
-3.088552, -3.61406, 4,
-3.088552, -3.61406, -4,
-3.245512, -3.786001, -4,
-3.088552, -3.61406, -2,
-3.245512, -3.786001, -2,
-3.088552, -3.61406, 0,
-3.245512, -3.786001, 0,
-3.088552, -3.61406, 2,
-3.245512, -3.786001, 2,
-3.088552, -3.61406, 4,
-3.245512, -3.786001, 4
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
-3.559432, -4.129882, -4, 0, -0.5, 0.5, 0.5,
-3.559432, -4.129882, -4, 1, -0.5, 0.5, 0.5,
-3.559432, -4.129882, -4, 1, 1.5, 0.5, 0.5,
-3.559432, -4.129882, -4, 0, 1.5, 0.5, 0.5,
-3.559432, -4.129882, -2, 0, -0.5, 0.5, 0.5,
-3.559432, -4.129882, -2, 1, -0.5, 0.5, 0.5,
-3.559432, -4.129882, -2, 1, 1.5, 0.5, 0.5,
-3.559432, -4.129882, -2, 0, 1.5, 0.5, 0.5,
-3.559432, -4.129882, 0, 0, -0.5, 0.5, 0.5,
-3.559432, -4.129882, 0, 1, -0.5, 0.5, 0.5,
-3.559432, -4.129882, 0, 1, 1.5, 0.5, 0.5,
-3.559432, -4.129882, 0, 0, 1.5, 0.5, 0.5,
-3.559432, -4.129882, 2, 0, -0.5, 0.5, 0.5,
-3.559432, -4.129882, 2, 1, -0.5, 0.5, 0.5,
-3.559432, -4.129882, 2, 1, 1.5, 0.5, 0.5,
-3.559432, -4.129882, 2, 0, 1.5, 0.5, 0.5,
-3.559432, -4.129882, 4, 0, -0.5, 0.5, 0.5,
-3.559432, -4.129882, 4, 1, -0.5, 0.5, 0.5,
-3.559432, -4.129882, 4, 1, 1.5, 0.5, 0.5,
-3.559432, -4.129882, 4, 0, 1.5, 0.5, 0.5
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
-3.088552, -3.61406, -4.798955,
-3.088552, 3.263575, -4.798955,
-3.088552, -3.61406, 5.251983,
-3.088552, 3.263575, 5.251983,
-3.088552, -3.61406, -4.798955,
-3.088552, -3.61406, 5.251983,
-3.088552, 3.263575, -4.798955,
-3.088552, 3.263575, 5.251983,
-3.088552, -3.61406, -4.798955,
3.189843, -3.61406, -4.798955,
-3.088552, -3.61406, 5.251983,
3.189843, -3.61406, 5.251983,
-3.088552, 3.263575, -4.798955,
3.189843, 3.263575, -4.798955,
-3.088552, 3.263575, 5.251983,
3.189843, 3.263575, 5.251983,
3.189843, -3.61406, -4.798955,
3.189843, 3.263575, -4.798955,
3.189843, -3.61406, 5.251983,
3.189843, 3.263575, 5.251983,
3.189843, -3.61406, -4.798955,
3.189843, -3.61406, 5.251983,
3.189843, 3.263575, -4.798955,
3.189843, 3.263575, 5.251983
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
var radius = 7.316537;
var distance = 32.5521;
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
mvMatrix.translate( -0.05064511, 0.1752422, -0.2265141 );
mvMatrix.scale( 1.260001, 1.150218, 0.7870691 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.5521);
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
Ziram<-read.table("Ziram.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Ziram$V2
```

```
## Error in eval(expr, envir, enclos): object 'Ziram' not found
```

```r
y<-Ziram$V3
```

```
## Error in eval(expr, envir, enclos): object 'Ziram' not found
```

```r
z<-Ziram$V4
```

```
## Error in eval(expr, envir, enclos): object 'Ziram' not found
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
-2.997119, -1.398155, -0.4680775, 0, 0, 1, 1, 1,
-2.79809, 0.01840219, -0.4669596, 1, 0, 0, 1, 1,
-2.775043, 0.5320865, -0.709141, 1, 0, 0, 1, 1,
-2.708957, -1.355612, -2.01597, 1, 0, 0, 1, 1,
-2.548345, -1.562056, -2.946981, 1, 0, 0, 1, 1,
-2.52001, -1.378237, -2.3274, 1, 0, 0, 1, 1,
-2.365474, 0.2894426, -1.075155, 0, 0, 0, 1, 1,
-2.258824, 0.614334, 0.3510017, 0, 0, 0, 1, 1,
-2.203693, 0.0672975, -2.059645, 0, 0, 0, 1, 1,
-2.155114, -1.104254, -0.4674592, 0, 0, 0, 1, 1,
-2.148551, 1.390161, -1.389579, 0, 0, 0, 1, 1,
-2.106276, 1.498685, -1.097267, 0, 0, 0, 1, 1,
-2.106214, -1.440015, -2.61475, 0, 0, 0, 1, 1,
-2.105404, 2.326088, -0.6702009, 1, 1, 1, 1, 1,
-1.978966, 0.5360457, -2.365906, 1, 1, 1, 1, 1,
-1.972754, -0.7630648, 0.575866, 1, 1, 1, 1, 1,
-1.951333, 0.7369475, -1.101307, 1, 1, 1, 1, 1,
-1.92983, 0.1904343, -2.563312, 1, 1, 1, 1, 1,
-1.925231, -0.3093975, 0.3032326, 1, 1, 1, 1, 1,
-1.847156, 0.7422592, 0.5293415, 1, 1, 1, 1, 1,
-1.825754, -0.7737554, -3.693621, 1, 1, 1, 1, 1,
-1.804329, -1.088114, -1.242505, 1, 1, 1, 1, 1,
-1.755261, -0.6225225, -1.276702, 1, 1, 1, 1, 1,
-1.753152, 0.9173468, -2.145886, 1, 1, 1, 1, 1,
-1.75223, 1.574134, -1.665492, 1, 1, 1, 1, 1,
-1.731184, -1.728796, -2.492878, 1, 1, 1, 1, 1,
-1.729227, 0.9190184, -1.520499, 1, 1, 1, 1, 1,
-1.705553, -0.06033067, -2.51026, 1, 1, 1, 1, 1,
-1.704818, 0.3783005, -3.494537, 0, 0, 1, 1, 1,
-1.660762, 0.3216783, -3.791656, 1, 0, 0, 1, 1,
-1.65274, 0.8435169, -2.431293, 1, 0, 0, 1, 1,
-1.647761, -1.117917, -2.583457, 1, 0, 0, 1, 1,
-1.64236, 0.1993981, -1.534504, 1, 0, 0, 1, 1,
-1.6331, 1.049534, -0.2950228, 1, 0, 0, 1, 1,
-1.628155, 0.03020146, 1.051097, 0, 0, 0, 1, 1,
-1.623629, -0.05629279, -0.04052362, 0, 0, 0, 1, 1,
-1.616754, 0.1027538, -2.368711, 0, 0, 0, 1, 1,
-1.614434, -0.6627081, -2.032574, 0, 0, 0, 1, 1,
-1.610856, -1.135573, -1.80082, 0, 0, 0, 1, 1,
-1.60883, 0.4094985, -2.03161, 0, 0, 0, 1, 1,
-1.596191, 0.07834873, -1.086075, 0, 0, 0, 1, 1,
-1.589447, -1.984333, -2.336191, 1, 1, 1, 1, 1,
-1.578967, 0.9147899, -0.6372178, 1, 1, 1, 1, 1,
-1.552448, -0.2105792, 0.2498677, 1, 1, 1, 1, 1,
-1.547934, -0.1759111, -0.7889419, 1, 1, 1, 1, 1,
-1.530629, -0.1339508, -0.362586, 1, 1, 1, 1, 1,
-1.515088, 0.1893287, -2.645568, 1, 1, 1, 1, 1,
-1.513114, -0.2159612, -0.4811885, 1, 1, 1, 1, 1,
-1.512018, 0.1915298, -0.3046355, 1, 1, 1, 1, 1,
-1.495089, -0.5117795, -1.890305, 1, 1, 1, 1, 1,
-1.478565, 0.6541613, -0.6620795, 1, 1, 1, 1, 1,
-1.465655, -2.085154, -3.883137, 1, 1, 1, 1, 1,
-1.462874, -0.3735375, -0.02647478, 1, 1, 1, 1, 1,
-1.455223, -0.6165198, -2.542763, 1, 1, 1, 1, 1,
-1.437433, -2.633435, -3.392511, 1, 1, 1, 1, 1,
-1.436321, 0.0270108, -2.15578, 1, 1, 1, 1, 1,
-1.429735, 0.6215551, -1.637374, 0, 0, 1, 1, 1,
-1.421067, -0.3951376, -3.128502, 1, 0, 0, 1, 1,
-1.40814, -0.1924225, -0.7697902, 1, 0, 0, 1, 1,
-1.397896, 0.3497351, -0.8534825, 1, 0, 0, 1, 1,
-1.39655, -0.3745574, -1.565729, 1, 0, 0, 1, 1,
-1.395525, -0.2908112, 0.1880334, 1, 0, 0, 1, 1,
-1.390302, -1.201094, -2.626767, 0, 0, 0, 1, 1,
-1.37919, 0.1476649, -2.231191, 0, 0, 0, 1, 1,
-1.377235, 0.07694446, -1.525656, 0, 0, 0, 1, 1,
-1.364193, -0.2944946, -2.50748, 0, 0, 0, 1, 1,
-1.359671, -0.4567409, -1.809412, 0, 0, 0, 1, 1,
-1.358726, 1.002518, -1.43489, 0, 0, 0, 1, 1,
-1.355571, 1.65722, -1.198056, 0, 0, 0, 1, 1,
-1.342605, -0.3147782, -0.9688396, 1, 1, 1, 1, 1,
-1.340146, 1.824112, -0.6053836, 1, 1, 1, 1, 1,
-1.334035, 0.5181403, -0.09904101, 1, 1, 1, 1, 1,
-1.323109, 0.3541949, -1.505843, 1, 1, 1, 1, 1,
-1.321307, -1.316435, -1.127515, 1, 1, 1, 1, 1,
-1.317101, 0.9774703, 0.6128558, 1, 1, 1, 1, 1,
-1.316587, 0.6069772, -1.758, 1, 1, 1, 1, 1,
-1.314716, 1.235541, -0.237828, 1, 1, 1, 1, 1,
-1.303332, -1.801091, -2.725155, 1, 1, 1, 1, 1,
-1.27666, 1.025811, -1.628356, 1, 1, 1, 1, 1,
-1.275129, -2.003047, -3.64799, 1, 1, 1, 1, 1,
-1.270133, 0.4818132, 0.7062647, 1, 1, 1, 1, 1,
-1.269267, -0.1805277, -1.850333, 1, 1, 1, 1, 1,
-1.265313, 1.735727, -2.764385, 1, 1, 1, 1, 1,
-1.263944, -0.3241624, -2.197842, 1, 1, 1, 1, 1,
-1.256077, -1.46216, -1.728389, 0, 0, 1, 1, 1,
-1.245342, 0.3947206, -0.9964871, 1, 0, 0, 1, 1,
-1.229503, -1.064659, -1.797323, 1, 0, 0, 1, 1,
-1.218972, -0.4180487, 0.000752452, 1, 0, 0, 1, 1,
-1.203455, -0.7710006, -1.422601, 1, 0, 0, 1, 1,
-1.196617, 0.9040611, -0.886478, 1, 0, 0, 1, 1,
-1.196087, 0.651729, -0.9915561, 0, 0, 0, 1, 1,
-1.188541, 1.066494, -0.3352818, 0, 0, 0, 1, 1,
-1.176225, -0.2735529, -3.628869, 0, 0, 0, 1, 1,
-1.163731, -0.5310056, -0.7236129, 0, 0, 0, 1, 1,
-1.16069, 0.1270594, -1.098955, 0, 0, 0, 1, 1,
-1.148291, -1.662544, -1.733068, 0, 0, 0, 1, 1,
-1.145476, 2.095859, -0.9585326, 0, 0, 0, 1, 1,
-1.138751, -0.5685296, -0.1653959, 1, 1, 1, 1, 1,
-1.138007, 0.6198698, -1.961663, 1, 1, 1, 1, 1,
-1.12903, -1.179197, -0.4910898, 1, 1, 1, 1, 1,
-1.122907, -1.218951, -2.552883, 1, 1, 1, 1, 1,
-1.121659, -0.3486951, -1.115861, 1, 1, 1, 1, 1,
-1.108454, 0.3636179, 0.7180948, 1, 1, 1, 1, 1,
-1.104047, -1.725629, -3.657109, 1, 1, 1, 1, 1,
-1.100926, 0.2702053, -0.8390428, 1, 1, 1, 1, 1,
-1.099038, 1.912598, -0.3402509, 1, 1, 1, 1, 1,
-1.090432, 0.5490629, -0.396942, 1, 1, 1, 1, 1,
-1.087779, -0.1461099, -1.390048, 1, 1, 1, 1, 1,
-1.082633, -0.03339716, -2.485396, 1, 1, 1, 1, 1,
-1.081771, 0.6574061, -0.2458636, 1, 1, 1, 1, 1,
-1.078819, 0.5085002, -0.2230066, 1, 1, 1, 1, 1,
-1.076571, 0.01365024, -0.9410171, 1, 1, 1, 1, 1,
-1.074457, 1.424491, -1.721131, 0, 0, 1, 1, 1,
-1.064685, 0.4090542, -2.739716, 1, 0, 0, 1, 1,
-1.060075, 1.309478, -0.8386517, 1, 0, 0, 1, 1,
-1.056368, 0.1776706, -1.117116, 1, 0, 0, 1, 1,
-1.050247, -0.9954149, -3.27101, 1, 0, 0, 1, 1,
-1.045817, -0.8618526, -1.682513, 1, 0, 0, 1, 1,
-1.040254, 0.4413362, -2.28931, 0, 0, 0, 1, 1,
-1.038291, 0.7869348, 0.187191, 0, 0, 0, 1, 1,
-1.032088, 0.07539797, -1.947264, 0, 0, 0, 1, 1,
-1.025946, 0.6362742, -0.3426731, 0, 0, 0, 1, 1,
-1.022871, 0.2528764, -0.1087962, 0, 0, 0, 1, 1,
-1.017682, -0.7242617, -1.712439, 0, 0, 0, 1, 1,
-1.017395, 0.01037261, -1.374593, 0, 0, 0, 1, 1,
-1.015596, -0.6643643, -1.351599, 1, 1, 1, 1, 1,
-1.011961, -0.388539, -0.2017022, 1, 1, 1, 1, 1,
-1.010381, -0.4305115, -2.974294, 1, 1, 1, 1, 1,
-1.008786, -0.3749301, -3.054618, 1, 1, 1, 1, 1,
-1.008253, 0.443982, -0.4735101, 1, 1, 1, 1, 1,
-1.00731, 0.2086954, 0.449659, 1, 1, 1, 1, 1,
-1.005761, 0.8074795, -1.231494, 1, 1, 1, 1, 1,
-1.003377, 0.1708545, -1.489237, 1, 1, 1, 1, 1,
-0.9981521, -0.2346421, -2.795399, 1, 1, 1, 1, 1,
-0.9936913, -0.3236689, -3.45809, 1, 1, 1, 1, 1,
-0.9920776, -1.133067, -2.919971, 1, 1, 1, 1, 1,
-0.9865947, -0.1414896, -1.288185, 1, 1, 1, 1, 1,
-0.9848769, -0.9264083, -1.064253, 1, 1, 1, 1, 1,
-0.9843211, 0.6848312, -0.2924899, 1, 1, 1, 1, 1,
-0.9834988, 0.5663269, -1.123093, 1, 1, 1, 1, 1,
-0.9833114, -0.8219865, -1.582817, 0, 0, 1, 1, 1,
-0.9760141, 0.4143419, -1.366281, 1, 0, 0, 1, 1,
-0.9624732, -1.023034, -1.096212, 1, 0, 0, 1, 1,
-0.9617668, -0.4051167, -3.030264, 1, 0, 0, 1, 1,
-0.9545811, -0.7746227, -1.878869, 1, 0, 0, 1, 1,
-0.9522251, -0.6084338, -1.670453, 1, 0, 0, 1, 1,
-0.9482668, -1.611664, -1.26937, 0, 0, 0, 1, 1,
-0.9418299, -1.593435, -2.138827, 0, 0, 0, 1, 1,
-0.9377298, -0.6700384, -1.537724, 0, 0, 0, 1, 1,
-0.9330353, 1.075939, -0.3114222, 0, 0, 0, 1, 1,
-0.9329543, 1.500625, 0.7683036, 0, 0, 0, 1, 1,
-0.9299886, 1.288501, -0.2518936, 0, 0, 0, 1, 1,
-0.9282372, -1.868865, -2.743372, 0, 0, 0, 1, 1,
-0.9274045, -0.1442695, -2.957184, 1, 1, 1, 1, 1,
-0.9259577, -0.8984637, -0.538074, 1, 1, 1, 1, 1,
-0.921807, 0.5800759, -0.7652622, 1, 1, 1, 1, 1,
-0.9195099, 0.5930778, -2.740926, 1, 1, 1, 1, 1,
-0.9133587, -0.7356727, -4.070725, 1, 1, 1, 1, 1,
-0.8998691, 0.887927, -0.8823601, 1, 1, 1, 1, 1,
-0.8964306, -0.1347938, -0.4865549, 1, 1, 1, 1, 1,
-0.8909193, 0.06109052, -2.484551, 1, 1, 1, 1, 1,
-0.883954, -0.7716816, -2.167753, 1, 1, 1, 1, 1,
-0.8819474, 0.1937053, -2.323118, 1, 1, 1, 1, 1,
-0.8818277, 0.2870611, -1.764743, 1, 1, 1, 1, 1,
-0.8779522, 0.3802354, -0.5605469, 1, 1, 1, 1, 1,
-0.8606882, -0.4909821, -1.427029, 1, 1, 1, 1, 1,
-0.8602532, -1.440071, -2.777688, 1, 1, 1, 1, 1,
-0.853834, -1.664438, -2.947053, 1, 1, 1, 1, 1,
-0.8513179, -1.445616, -2.093699, 0, 0, 1, 1, 1,
-0.847407, -0.7573984, -1.192816, 1, 0, 0, 1, 1,
-0.8467295, -0.3105325, -2.325207, 1, 0, 0, 1, 1,
-0.842738, -0.4083688, -0.9748588, 1, 0, 0, 1, 1,
-0.8427232, -0.5663617, -2.441932, 1, 0, 0, 1, 1,
-0.8423606, -0.4359751, -3.62764, 1, 0, 0, 1, 1,
-0.8311742, 1.495239, -0.2930642, 0, 0, 0, 1, 1,
-0.8291258, 0.6732171, -3.747426, 0, 0, 0, 1, 1,
-0.8242533, 0.8638921, -0.328042, 0, 0, 0, 1, 1,
-0.8180079, 1.01523, -1.801333, 0, 0, 0, 1, 1,
-0.8164226, 0.4925705, -2.064478, 0, 0, 0, 1, 1,
-0.8078173, 0.6641452, -1.387924, 0, 0, 0, 1, 1,
-0.8032081, 0.74858, -0.9042318, 0, 0, 0, 1, 1,
-0.8029931, -0.2935754, -0.9964522, 1, 1, 1, 1, 1,
-0.794975, -0.6469647, -1.00141, 1, 1, 1, 1, 1,
-0.7940867, 1.300543, -1.328337, 1, 1, 1, 1, 1,
-0.7931615, -0.4151021, -1.006791, 1, 1, 1, 1, 1,
-0.7893019, -1.794381, -2.946678, 1, 1, 1, 1, 1,
-0.7789433, 1.547291, -0.4238867, 1, 1, 1, 1, 1,
-0.7733169, -0.3917547, -0.745603, 1, 1, 1, 1, 1,
-0.7641774, -2.129522, -2.087837, 1, 1, 1, 1, 1,
-0.7629469, -0.2670732, 0.538902, 1, 1, 1, 1, 1,
-0.7602317, 0.4921922, -1.504805, 1, 1, 1, 1, 1,
-0.7595291, -1.454896, -1.614704, 1, 1, 1, 1, 1,
-0.7574809, -0.1733234, -2.187861, 1, 1, 1, 1, 1,
-0.7530934, -0.7525786, -1.787593, 1, 1, 1, 1, 1,
-0.7520546, -1.247373, -2.889477, 1, 1, 1, 1, 1,
-0.7482532, -0.2182941, -0.9449285, 1, 1, 1, 1, 1,
-0.748161, -0.9060837, -2.589561, 0, 0, 1, 1, 1,
-0.7473086, 0.257873, -2.096979, 1, 0, 0, 1, 1,
-0.7466453, -0.208155, -0.1116576, 1, 0, 0, 1, 1,
-0.7461284, -0.6936131, -3.570673, 1, 0, 0, 1, 1,
-0.744993, 0.2675319, -0.6397055, 1, 0, 0, 1, 1,
-0.7278614, -0.2570848, -2.150693, 1, 0, 0, 1, 1,
-0.7245559, 0.9313467, -0.2968094, 0, 0, 0, 1, 1,
-0.7213944, -1.477313, -3.781753, 0, 0, 0, 1, 1,
-0.7193494, -0.1089177, -1.688771, 0, 0, 0, 1, 1,
-0.7069435, 0.5361483, -1.774177, 0, 0, 0, 1, 1,
-0.7030799, 0.7113042, 0.7240785, 0, 0, 0, 1, 1,
-0.7015686, 1.706421, 2.158316, 0, 0, 0, 1, 1,
-0.701449, 0.9068519, -1.278398, 0, 0, 0, 1, 1,
-0.6961508, 0.515211, -0.6639017, 1, 1, 1, 1, 1,
-0.6924905, -1.326539, -3.44208, 1, 1, 1, 1, 1,
-0.6912323, -0.1664167, -0.8013456, 1, 1, 1, 1, 1,
-0.6904344, -2.173219, -3.300132, 1, 1, 1, 1, 1,
-0.68666, -1.315001, -3.501658, 1, 1, 1, 1, 1,
-0.6851752, 1.82188, -1.355973, 1, 1, 1, 1, 1,
-0.684245, 0.2334224, -1.373471, 1, 1, 1, 1, 1,
-0.6660459, 2.212758, -0.9579735, 1, 1, 1, 1, 1,
-0.6656225, -0.115485, -0.7949675, 1, 1, 1, 1, 1,
-0.6622656, 0.8357448, -2.493777, 1, 1, 1, 1, 1,
-0.6605015, 0.7721429, -0.1238157, 1, 1, 1, 1, 1,
-0.6488764, 2.037311, 0.4799851, 1, 1, 1, 1, 1,
-0.6473774, -1.896935, -1.235579, 1, 1, 1, 1, 1,
-0.6473266, 1.018975, -0.1209096, 1, 1, 1, 1, 1,
-0.6445879, -1.200575, -1.539986, 1, 1, 1, 1, 1,
-0.6428798, 1.274416, -1.04853, 0, 0, 1, 1, 1,
-0.6425468, -1.018386, -2.008507, 1, 0, 0, 1, 1,
-0.6401849, 3.163416, -1.070132, 1, 0, 0, 1, 1,
-0.6313691, 0.1102392, -1.87099, 1, 0, 0, 1, 1,
-0.631203, -0.3063883, -2.743449, 1, 0, 0, 1, 1,
-0.6246018, -1.244823, -0.03606005, 1, 0, 0, 1, 1,
-0.6206266, -0.6655537, -2.328453, 0, 0, 0, 1, 1,
-0.6143714, -0.1833976, -2.822614, 0, 0, 0, 1, 1,
-0.6102375, -1.182572, -2.224101, 0, 0, 0, 1, 1,
-0.5921869, 1.244133, 1.169315, 0, 0, 0, 1, 1,
-0.5906795, -0.8351393, -2.873556, 0, 0, 0, 1, 1,
-0.5884951, 1.025987, -2.199472, 0, 0, 0, 1, 1,
-0.5883554, 1.708729, -1.026639, 0, 0, 0, 1, 1,
-0.5831003, -0.7584953, -2.145639, 1, 1, 1, 1, 1,
-0.5813667, 1.122245, -1.566691, 1, 1, 1, 1, 1,
-0.5796478, 0.5381002, -1.242958, 1, 1, 1, 1, 1,
-0.5742355, -0.8343387, -1.029575, 1, 1, 1, 1, 1,
-0.5723131, 0.8250313, -1.572672, 1, 1, 1, 1, 1,
-0.562547, 1.202207, -1.461451, 1, 1, 1, 1, 1,
-0.5616811, -1.977966, -3.958101, 1, 1, 1, 1, 1,
-0.5567401, 0.3986284, -0.7167838, 1, 1, 1, 1, 1,
-0.5557674, -0.340685, -1.038033, 1, 1, 1, 1, 1,
-0.5547233, -0.6250783, -2.753752, 1, 1, 1, 1, 1,
-0.5486538, -1.198825, -2.847002, 1, 1, 1, 1, 1,
-0.5398977, 0.01789613, -1.699666, 1, 1, 1, 1, 1,
-0.5333229, -0.5703526, -3.34169, 1, 1, 1, 1, 1,
-0.5328259, 0.979609, -1.204758, 1, 1, 1, 1, 1,
-0.530501, -1.545067, -2.799107, 1, 1, 1, 1, 1,
-0.5290427, -1.383561, -2.2394, 0, 0, 1, 1, 1,
-0.5273404, 1.631744, -1.483309, 1, 0, 0, 1, 1,
-0.5259259, -0.8261076, -4.132577, 1, 0, 0, 1, 1,
-0.525796, -0.2223744, -2.189218, 1, 0, 0, 1, 1,
-0.5237813, -0.6187848, -4.161057, 1, 0, 0, 1, 1,
-0.5197104, 1.246514, -0.531756, 1, 0, 0, 1, 1,
-0.5149351, -0.499411, -3.655687, 0, 0, 0, 1, 1,
-0.51288, -0.2091667, -2.236421, 0, 0, 0, 1, 1,
-0.5125797, -0.8771503, -4.110825, 0, 0, 0, 1, 1,
-0.5104902, 0.5564563, -1.642021, 0, 0, 0, 1, 1,
-0.5086167, -0.07680033, -2.608609, 0, 0, 0, 1, 1,
-0.5030235, 0.01246014, -2.105599, 0, 0, 0, 1, 1,
-0.5004519, -0.9283711, -3.642984, 0, 0, 0, 1, 1,
-0.499345, 0.9093524, 0.03250669, 1, 1, 1, 1, 1,
-0.4985811, 0.08978317, -1.200152, 1, 1, 1, 1, 1,
-0.4946027, -0.5536219, -1.985173, 1, 1, 1, 1, 1,
-0.4935445, 1.674517, -0.2957921, 1, 1, 1, 1, 1,
-0.4928354, 0.7345537, -1.205148, 1, 1, 1, 1, 1,
-0.491978, -0.03675895, -2.162004, 1, 1, 1, 1, 1,
-0.4911021, 0.1523841, -1.690525, 1, 1, 1, 1, 1,
-0.4897267, -1.527375, -3.127495, 1, 1, 1, 1, 1,
-0.4844412, 0.683051, 0.1291101, 1, 1, 1, 1, 1,
-0.4839267, -0.9464173, -3.118196, 1, 1, 1, 1, 1,
-0.4830717, 0.7926225, -0.3094834, 1, 1, 1, 1, 1,
-0.4785565, 2.349361, -1.421664, 1, 1, 1, 1, 1,
-0.4753831, 0.5502288, -2.327061, 1, 1, 1, 1, 1,
-0.4719411, 1.078037, 0.1406264, 1, 1, 1, 1, 1,
-0.4662563, -1.588306, -0.9183117, 1, 1, 1, 1, 1,
-0.4632649, 1.174673, -2.104735, 0, 0, 1, 1, 1,
-0.4521407, -0.4748921, -3.544267, 1, 0, 0, 1, 1,
-0.448441, -1.254431, -2.936869, 1, 0, 0, 1, 1,
-0.4471925, 1.441267, 0.05987146, 1, 0, 0, 1, 1,
-0.4465919, 0.5937499, -1.477265, 1, 0, 0, 1, 1,
-0.4455578, 0.2593708, -1.0368, 1, 0, 0, 1, 1,
-0.4395809, -1.512829, -2.12145, 0, 0, 0, 1, 1,
-0.4354741, 1.162821, -0.9959827, 0, 0, 0, 1, 1,
-0.4328599, 1.014434, -0.06567704, 0, 0, 0, 1, 1,
-0.4310983, -0.9692919, -3.221285, 0, 0, 0, 1, 1,
-0.4297312, -0.6510321, -3.593336, 0, 0, 0, 1, 1,
-0.427884, 0.3316033, 0.5377865, 0, 0, 0, 1, 1,
-0.4225116, 0.9894658, 0.05856826, 0, 0, 0, 1, 1,
-0.4192864, 0.1591771, -3.348652, 1, 1, 1, 1, 1,
-0.4185826, -0.516699, -1.200991, 1, 1, 1, 1, 1,
-0.4171511, 0.07725734, -0.01714239, 1, 1, 1, 1, 1,
-0.4155159, -0.3879578, -3.269701, 1, 1, 1, 1, 1,
-0.4094447, 0.06928547, 0.2372299, 1, 1, 1, 1, 1,
-0.4076706, -0.4714752, -3.451208, 1, 1, 1, 1, 1,
-0.4072246, 0.6918362, -0.3843855, 1, 1, 1, 1, 1,
-0.4047474, 1.232723, -0.9691877, 1, 1, 1, 1, 1,
-0.39333, 0.5745002, -1.849534, 1, 1, 1, 1, 1,
-0.3919213, -0.6203075, -1.289801, 1, 1, 1, 1, 1,
-0.3882027, -0.2872029, -1.132625, 1, 1, 1, 1, 1,
-0.3868448, 1.078443, 0.21387, 1, 1, 1, 1, 1,
-0.3830479, 0.2938084, 0.1128779, 1, 1, 1, 1, 1,
-0.3783114, 0.1363013, -0.9571257, 1, 1, 1, 1, 1,
-0.377506, -0.5477666, -3.901347, 1, 1, 1, 1, 1,
-0.3690935, -1.074356, -2.532571, 0, 0, 1, 1, 1,
-0.3685339, 0.7632016, 0.6550021, 1, 0, 0, 1, 1,
-0.3678653, 1.29792, 0.04321588, 1, 0, 0, 1, 1,
-0.3676141, 1.207835, -0.4190601, 1, 0, 0, 1, 1,
-0.3629649, 0.09409995, -2.546252, 1, 0, 0, 1, 1,
-0.3595578, 0.2340819, -0.8580688, 1, 0, 0, 1, 1,
-0.35924, 0.8913423, 0.9583718, 0, 0, 0, 1, 1,
-0.3588173, 1.31692, -0.5829534, 0, 0, 0, 1, 1,
-0.3583786, -0.5942104, -3.26965, 0, 0, 0, 1, 1,
-0.3566507, -0.1846251, -1.782025, 0, 0, 0, 1, 1,
-0.3549311, 0.6219806, -1.383347, 0, 0, 0, 1, 1,
-0.3514129, -1.018054, -2.128174, 0, 0, 0, 1, 1,
-0.3472629, 0.3351056, -0.280181, 0, 0, 0, 1, 1,
-0.3432918, -0.268048, -2.983891, 1, 1, 1, 1, 1,
-0.3413005, 0.9404252, -0.07600972, 1, 1, 1, 1, 1,
-0.3375428, 1.090382, -0.3481904, 1, 1, 1, 1, 1,
-0.3367422, -1.303445, -2.447724, 1, 1, 1, 1, 1,
-0.3345921, -0.493584, -0.6381174, 1, 1, 1, 1, 1,
-0.3314196, 0.3745001, -1.183925, 1, 1, 1, 1, 1,
-0.331108, 0.4978434, -0.4655707, 1, 1, 1, 1, 1,
-0.3296614, -0.2530105, -0.8298638, 1, 1, 1, 1, 1,
-0.328681, -0.2739268, -3.009063, 1, 1, 1, 1, 1,
-0.3238234, 0.4947463, -1.478448, 1, 1, 1, 1, 1,
-0.3224313, -0.3498416, -2.496157, 1, 1, 1, 1, 1,
-0.3212065, -1.610377, -4.156665, 1, 1, 1, 1, 1,
-0.3157065, 0.3239106, -1.378345, 1, 1, 1, 1, 1,
-0.3140054, 0.5216535, 0.0735068, 1, 1, 1, 1, 1,
-0.3136653, -1.940173, -2.041431, 1, 1, 1, 1, 1,
-0.3085201, 1.589403, 0.01589143, 0, 0, 1, 1, 1,
-0.3079809, 0.01280671, -3.579573, 1, 0, 0, 1, 1,
-0.3037384, 1.726261, 0.6632173, 1, 0, 0, 1, 1,
-0.2985768, -0.8392242, -1.686061, 1, 0, 0, 1, 1,
-0.2982244, 0.8277121, 0.06943426, 1, 0, 0, 1, 1,
-0.2970284, -0.1756845, -1.132711, 1, 0, 0, 1, 1,
-0.2908194, 0.9497164, -0.4128523, 0, 0, 0, 1, 1,
-0.2837868, -0.9613606, -1.553149, 0, 0, 0, 1, 1,
-0.2827543, -0.8714654, -2.840394, 0, 0, 0, 1, 1,
-0.2814666, -0.1160403, -1.293267, 0, 0, 0, 1, 1,
-0.278938, -0.02651719, -1.904176, 0, 0, 0, 1, 1,
-0.2752149, 0.1783122, -0.558701, 0, 0, 0, 1, 1,
-0.2738257, -2.060416, -4.419303, 0, 0, 0, 1, 1,
-0.2685371, 1.62745, -0.1762482, 1, 1, 1, 1, 1,
-0.2669468, 0.5584128, 0.3376233, 1, 1, 1, 1, 1,
-0.2608128, -0.9735972, -2.22961, 1, 1, 1, 1, 1,
-0.254834, 0.6295625, 0.04206522, 1, 1, 1, 1, 1,
-0.2539706, -0.6206349, -2.34392, 1, 1, 1, 1, 1,
-0.2520712, -1.821063, -1.711927, 1, 1, 1, 1, 1,
-0.2515311, -0.9236186, -3.072778, 1, 1, 1, 1, 1,
-0.250925, -0.6714635, -2.387383, 1, 1, 1, 1, 1,
-0.2487659, 0.133993, -0.9987062, 1, 1, 1, 1, 1,
-0.2473836, 1.104093, -0.0582505, 1, 1, 1, 1, 1,
-0.2462613, 0.3643581, 0.9882647, 1, 1, 1, 1, 1,
-0.2449214, 1.37938, 0.06193226, 1, 1, 1, 1, 1,
-0.2410218, 1.016107, -0.1039612, 1, 1, 1, 1, 1,
-0.2369359, -0.3434539, -2.281661, 1, 1, 1, 1, 1,
-0.2358273, 1.281106, -0.8499939, 1, 1, 1, 1, 1,
-0.2342079, 1.412429, -0.643513, 0, 0, 1, 1, 1,
-0.2315223, -0.4781111, -2.397262, 1, 0, 0, 1, 1,
-0.2280402, -1.033721, -3.968639, 1, 0, 0, 1, 1,
-0.2262491, -0.6751911, -2.86429, 1, 0, 0, 1, 1,
-0.2237504, -0.7935688, -3.305019, 1, 0, 0, 1, 1,
-0.2221534, -0.9130114, -2.722463, 1, 0, 0, 1, 1,
-0.219654, 0.5499016, -0.7990634, 0, 0, 0, 1, 1,
-0.2175625, 1.170716, -1.127691, 0, 0, 0, 1, 1,
-0.2168674, -0.3631208, -1.828084, 0, 0, 0, 1, 1,
-0.2112227, -0.1835701, -3.20264, 0, 0, 0, 1, 1,
-0.2093278, 0.2920189, -1.227711, 0, 0, 0, 1, 1,
-0.2072528, -0.2863016, -2.125994, 0, 0, 0, 1, 1,
-0.2026369, 0.4250636, -1.008212, 0, 0, 0, 1, 1,
-0.1953608, 0.2418247, -1.928521, 1, 1, 1, 1, 1,
-0.1927279, 0.6235167, -2.731426, 1, 1, 1, 1, 1,
-0.1916616, 1.151498, 1.011672, 1, 1, 1, 1, 1,
-0.1911446, -0.4325193, -3.101091, 1, 1, 1, 1, 1,
-0.1887949, -2.080676, -3.786091, 1, 1, 1, 1, 1,
-0.187563, 0.4102522, -0.2453754, 1, 1, 1, 1, 1,
-0.1855497, -0.4112484, -4.209422, 1, 1, 1, 1, 1,
-0.1838276, -0.4234659, -3.221866, 1, 1, 1, 1, 1,
-0.1825628, -0.4002059, -0.8756386, 1, 1, 1, 1, 1,
-0.1813546, -0.02166593, -1.823271, 1, 1, 1, 1, 1,
-0.1808309, -0.8476266, -3.563826, 1, 1, 1, 1, 1,
-0.1791004, -0.08057149, -1.092836, 1, 1, 1, 1, 1,
-0.175507, -0.4769358, -3.392527, 1, 1, 1, 1, 1,
-0.1720252, -1.352012, -3.275077, 1, 1, 1, 1, 1,
-0.1706388, 1.310169, 0.345031, 1, 1, 1, 1, 1,
-0.1682828, 0.830671, 0.4247602, 0, 0, 1, 1, 1,
-0.1680349, 0.8197247, 0.0223201, 1, 0, 0, 1, 1,
-0.1677492, 0.4926266, -0.1042133, 1, 0, 0, 1, 1,
-0.1640863, 0.281073, -0.7846887, 1, 0, 0, 1, 1,
-0.163308, -0.8709052, -2.751554, 1, 0, 0, 1, 1,
-0.163074, -0.4911994, -2.762874, 1, 0, 0, 1, 1,
-0.162178, -0.7950304, -2.877067, 0, 0, 0, 1, 1,
-0.1600773, 1.933364, 2.282438, 0, 0, 0, 1, 1,
-0.1591456, 1.003232, -0.870941, 0, 0, 0, 1, 1,
-0.1574735, 1.290978, -0.8450814, 0, 0, 0, 1, 1,
-0.1573358, 0.9794072, 0.8583947, 0, 0, 0, 1, 1,
-0.1535662, -0.6777737, -4.183036, 0, 0, 0, 1, 1,
-0.1529451, 0.9705127, -0.1780516, 0, 0, 0, 1, 1,
-0.1519883, 0.3248336, -0.1070546, 1, 1, 1, 1, 1,
-0.1482915, -0.872075, -1.812814, 1, 1, 1, 1, 1,
-0.1440612, 2.665112, 0.4878849, 1, 1, 1, 1, 1,
-0.1436182, 1.918501, -0.4727596, 1, 1, 1, 1, 1,
-0.1385703, 0.9740813, 1.042686, 1, 1, 1, 1, 1,
-0.1374227, 0.985732, -1.156318, 1, 1, 1, 1, 1,
-0.1294306, 0.9122481, 0.6981019, 1, 1, 1, 1, 1,
-0.1258165, -0.9325954, -2.679947, 1, 1, 1, 1, 1,
-0.1242945, 1.593821, 0.6291954, 1, 1, 1, 1, 1,
-0.1223224, 1.291025, -0.761407, 1, 1, 1, 1, 1,
-0.1188303, 0.2041017, -2.101798, 1, 1, 1, 1, 1,
-0.1186566, -2.061106, -4.516878, 1, 1, 1, 1, 1,
-0.1142246, 0.4072539, -0.02099942, 1, 1, 1, 1, 1,
-0.1111849, 0.2110885, -0.9131944, 1, 1, 1, 1, 1,
-0.1111718, 0.4381661, -0.6225898, 1, 1, 1, 1, 1,
-0.1093038, 1.281422, -0.06159385, 0, 0, 1, 1, 1,
-0.1078017, -0.3086676, -1.68589, 1, 0, 0, 1, 1,
-0.1064123, 0.007497082, -2.267908, 1, 0, 0, 1, 1,
-0.106091, 0.4204969, 0.2380712, 1, 0, 0, 1, 1,
-0.1034418, 0.3145275, 0.2931826, 1, 0, 0, 1, 1,
-0.1006507, -0.4786434, -2.935084, 1, 0, 0, 1, 1,
-0.1005688, 0.8400297, 1.057512, 0, 0, 0, 1, 1,
-0.09930901, -0.4602349, -3.414459, 0, 0, 0, 1, 1,
-0.09745573, -0.1566728, -3.564664, 0, 0, 0, 1, 1,
-0.09416398, 0.262549, 0.5408928, 0, 0, 0, 1, 1,
-0.09407115, 0.7217709, 0.5294173, 0, 0, 0, 1, 1,
-0.09317207, -0.09526826, -3.441012, 0, 0, 0, 1, 1,
-0.09277886, -0.991223, -1.026432, 0, 0, 0, 1, 1,
-0.08847552, 1.428281, 1.321496, 1, 1, 1, 1, 1,
-0.08759804, -0.7851964, -3.737398, 1, 1, 1, 1, 1,
-0.08227403, 0.1806774, -0.475516, 1, 1, 1, 1, 1,
-0.08146235, 1.275736, 0.4726519, 1, 1, 1, 1, 1,
-0.08142905, -0.6862862, -2.148052, 1, 1, 1, 1, 1,
-0.07753474, 1.785691, 0.772193, 1, 1, 1, 1, 1,
-0.07719227, -1.061121, -2.762348, 1, 1, 1, 1, 1,
-0.0755167, 1.857056, -1.584781, 1, 1, 1, 1, 1,
-0.07548062, -0.6249974, -3.326728, 1, 1, 1, 1, 1,
-0.05239228, 0.8432395, 0.4426607, 1, 1, 1, 1, 1,
-0.05210173, -0.4007635, -2.554176, 1, 1, 1, 1, 1,
-0.05188319, 0.9450599, 1.879698, 1, 1, 1, 1, 1,
-0.05179159, -0.8717257, -2.711936, 1, 1, 1, 1, 1,
-0.04403269, 0.2442405, -0.950798, 1, 1, 1, 1, 1,
-0.04321123, -0.5376952, -2.563712, 1, 1, 1, 1, 1,
-0.04316441, 0.2271162, -0.0473882, 0, 0, 1, 1, 1,
-0.04214173, 1.09505, 1.072804, 1, 0, 0, 1, 1,
-0.03850042, 0.09283255, -0.6024527, 1, 0, 0, 1, 1,
-0.03244236, -1.845281, -4.530702, 1, 0, 0, 1, 1,
-0.03024312, -0.2748181, -1.475181, 1, 0, 0, 1, 1,
-0.02982409, -1.133435, -4.652582, 1, 0, 0, 1, 1,
-0.02811556, 0.210469, -0.7656723, 0, 0, 0, 1, 1,
-0.0219994, 0.7753652, -0.8644691, 0, 0, 0, 1, 1,
-0.01982121, 0.4502509, 1.237413, 0, 0, 0, 1, 1,
-0.01171828, -0.08264912, -2.300562, 0, 0, 0, 1, 1,
-0.005922887, 0.1310249, -1.288508, 0, 0, 0, 1, 1,
-0.00561484, 0.7420653, 0.006767067, 0, 0, 0, 1, 1,
-0.00504639, -1.25706, -2.650264, 0, 0, 0, 1, 1,
-0.004949766, 2.716301, -1.08537, 1, 1, 1, 1, 1,
-0.0009427338, -1.297789, -1.936603, 1, 1, 1, 1, 1,
-4.990668e-05, -0.002191632, -2.187779, 1, 1, 1, 1, 1,
0.002169647, 0.6286781, 0.3046296, 1, 1, 1, 1, 1,
0.003285625, 0.3783724, 0.255802, 1, 1, 1, 1, 1,
0.00713166, -0.1800651, 3.243708, 1, 1, 1, 1, 1,
0.007223549, -1.943363, 2.259305, 1, 1, 1, 1, 1,
0.01655116, -0.3603759, 1.468204, 1, 1, 1, 1, 1,
0.01970085, -0.7803193, 4.865251, 1, 1, 1, 1, 1,
0.02120335, 0.8901377, -0.8361247, 1, 1, 1, 1, 1,
0.021214, -0.04713756, 4.49368, 1, 1, 1, 1, 1,
0.02133056, 0.7738406, -2.024365, 1, 1, 1, 1, 1,
0.02502118, 0.3980553, -0.3454836, 1, 1, 1, 1, 1,
0.02538149, -0.2315781, 4.297066, 1, 1, 1, 1, 1,
0.02678093, 0.6339391, 0.2536172, 1, 1, 1, 1, 1,
0.02911749, 1.21911, -1.742528, 0, 0, 1, 1, 1,
0.02982512, -1.199512, 2.614991, 1, 0, 0, 1, 1,
0.03070886, 1.009914, -0.3397282, 1, 0, 0, 1, 1,
0.03372155, 0.1143341, 0.8631443, 1, 0, 0, 1, 1,
0.03632389, 0.167905, -0.7785141, 1, 0, 0, 1, 1,
0.03705629, 0.3266729, 0.7868037, 1, 0, 0, 1, 1,
0.03791476, -0.470562, 2.8368, 0, 0, 0, 1, 1,
0.04071749, 1.360143, -0.5583348, 0, 0, 0, 1, 1,
0.04719054, -0.3728609, 2.810111, 0, 0, 0, 1, 1,
0.0492002, 0.4699565, -1.021798, 0, 0, 0, 1, 1,
0.05540716, 1.314791, 0.118591, 0, 0, 0, 1, 1,
0.05740589, 1.04083, 0.2564489, 0, 0, 0, 1, 1,
0.05941325, 0.4425685, 0.1853122, 0, 0, 0, 1, 1,
0.06003217, 0.1110388, 1.734133, 1, 1, 1, 1, 1,
0.06090459, 1.68012, 0.1080113, 1, 1, 1, 1, 1,
0.06611042, -0.7138689, 3.693045, 1, 1, 1, 1, 1,
0.06949935, -0.8926852, 3.496071, 1, 1, 1, 1, 1,
0.0713032, 0.1181781, 0.4405392, 1, 1, 1, 1, 1,
0.07223403, 0.5023552, 1.458199, 1, 1, 1, 1, 1,
0.07494124, 1.010602, -0.9895622, 1, 1, 1, 1, 1,
0.07790552, -1.121708, 2.869578, 1, 1, 1, 1, 1,
0.07852902, 0.239276, 1.706614, 1, 1, 1, 1, 1,
0.08024383, -1.633678, 3.598347, 1, 1, 1, 1, 1,
0.08094937, 0.01876181, 1.011966, 1, 1, 1, 1, 1,
0.08528578, 1.000865, -0.6054249, 1, 1, 1, 1, 1,
0.09019356, 1.199934, -0.4146839, 1, 1, 1, 1, 1,
0.09151684, 1.279905, -0.1673182, 1, 1, 1, 1, 1,
0.09232211, -1.24288, 1.609376, 1, 1, 1, 1, 1,
0.0943863, -1.919848, 2.346677, 0, 0, 1, 1, 1,
0.09453599, 1.168515, 2.562776, 1, 0, 0, 1, 1,
0.0977775, -0.2375168, 1.684622, 1, 0, 0, 1, 1,
0.1022316, -1.156801, 3.781452, 1, 0, 0, 1, 1,
0.1035312, 0.1759439, 0.422602, 1, 0, 0, 1, 1,
0.1064844, -0.9851581, 4.291609, 1, 0, 0, 1, 1,
0.1083833, -1.030871, 3.242068, 0, 0, 0, 1, 1,
0.1105141, -0.1832082, 2.785074, 0, 0, 0, 1, 1,
0.1106939, 0.02612295, 2.698479, 0, 0, 0, 1, 1,
0.1146697, -1.590775, 0.07180685, 0, 0, 0, 1, 1,
0.1164831, -1.50483, 3.76634, 0, 0, 0, 1, 1,
0.117367, 1.918744, -0.9137193, 0, 0, 0, 1, 1,
0.1192191, -0.05285795, 2.560106, 0, 0, 0, 1, 1,
0.1194356, -0.9822962, 2.946672, 1, 1, 1, 1, 1,
0.1215754, 0.05132354, 0.002232004, 1, 1, 1, 1, 1,
0.1232533, 0.006394735, 1.052063, 1, 1, 1, 1, 1,
0.124311, -1.444301, 3.913682, 1, 1, 1, 1, 1,
0.1248942, 1.212243, -0.7153606, 1, 1, 1, 1, 1,
0.1295488, -0.0004636942, 2.997434, 1, 1, 1, 1, 1,
0.1300001, 0.1003147, -0.2558239, 1, 1, 1, 1, 1,
0.1303588, 1.703134, -0.1018508, 1, 1, 1, 1, 1,
0.1386368, -0.3397785, 3.117209, 1, 1, 1, 1, 1,
0.1423299, 0.4770726, 1.204311, 1, 1, 1, 1, 1,
0.1479924, 2.170093, 1.192864, 1, 1, 1, 1, 1,
0.1489259, -0.5376809, 2.65789, 1, 1, 1, 1, 1,
0.1502257, -0.7321441, 2.550514, 1, 1, 1, 1, 1,
0.1508989, 1.392815, 0.8651182, 1, 1, 1, 1, 1,
0.1550588, -1.405486, 3.023013, 1, 1, 1, 1, 1,
0.1552405, 0.7609299, 1.024278, 0, 0, 1, 1, 1,
0.1558925, 0.9457154, 1.211502, 1, 0, 0, 1, 1,
0.1565011, -0.9296989, 1.950186, 1, 0, 0, 1, 1,
0.157363, 0.887502, -0.9869643, 1, 0, 0, 1, 1,
0.1625554, -2.030123, 3.735177, 1, 0, 0, 1, 1,
0.166712, 0.110965, 2.172524, 1, 0, 0, 1, 1,
0.1667777, 1.490326, -0.2627713, 0, 0, 0, 1, 1,
0.1715818, -1.08987, 3.156053, 0, 0, 0, 1, 1,
0.1760203, -0.06861795, 1.251006, 0, 0, 0, 1, 1,
0.178194, 0.0666376, 0.5167944, 0, 0, 0, 1, 1,
0.1798721, -0.1212086, 0.2906893, 0, 0, 0, 1, 1,
0.1810164, 0.1571198, 0.04798457, 0, 0, 0, 1, 1,
0.1823705, 0.3090112, 1.216193, 0, 0, 0, 1, 1,
0.1834259, -0.2024409, 0.6558436, 1, 1, 1, 1, 1,
0.1836321, -0.5385885, 3.064133, 1, 1, 1, 1, 1,
0.1844674, 0.09929024, 1.342329, 1, 1, 1, 1, 1,
0.1862237, -0.6309648, 3.792985, 1, 1, 1, 1, 1,
0.1895867, -0.1326905, 1.153807, 1, 1, 1, 1, 1,
0.1917763, -1.701358, 2.407127, 1, 1, 1, 1, 1,
0.1931518, -0.4673207, 0.9139518, 1, 1, 1, 1, 1,
0.1950259, -0.3671337, 2.644783, 1, 1, 1, 1, 1,
0.2012213, -0.5352645, 3.760539, 1, 1, 1, 1, 1,
0.2012646, -0.4886333, 1.053334, 1, 1, 1, 1, 1,
0.201527, 2.292746, -0.5990928, 1, 1, 1, 1, 1,
0.2038891, -0.9214039, 0.871029, 1, 1, 1, 1, 1,
0.2051579, -0.4801145, 3.944675, 1, 1, 1, 1, 1,
0.2101956, -0.3035178, 3.20265, 1, 1, 1, 1, 1,
0.2136932, -2.150287, 3.631685, 1, 1, 1, 1, 1,
0.2145613, 0.8198978, -0.1881768, 0, 0, 1, 1, 1,
0.2147365, 1.096809, -1.043096, 1, 0, 0, 1, 1,
0.2166823, 0.7350195, 0.8995695, 1, 0, 0, 1, 1,
0.2224632, 0.791002, 1.821128, 1, 0, 0, 1, 1,
0.2240178, -0.00164055, 1.575603, 1, 0, 0, 1, 1,
0.2267807, 0.9745805, -0.2023038, 1, 0, 0, 1, 1,
0.2325522, -0.2542841, 2.568719, 0, 0, 0, 1, 1,
0.2394437, 0.02604506, 2.299471, 0, 0, 0, 1, 1,
0.2396238, -1.527603, 2.741894, 0, 0, 0, 1, 1,
0.2397366, -0.8952092, 2.932283, 0, 0, 0, 1, 1,
0.2467825, 1.099444, 0.7283821, 0, 0, 0, 1, 1,
0.2470607, -1.201031, 1.68333, 0, 0, 0, 1, 1,
0.248569, 0.6290897, -0.2495209, 0, 0, 0, 1, 1,
0.2547175, -0.8316627, 3.593035, 1, 1, 1, 1, 1,
0.2555019, 0.9333968, -1.184764, 1, 1, 1, 1, 1,
0.2562089, 0.8144563, 1.594453, 1, 1, 1, 1, 1,
0.2570851, 0.6372219, 0.576188, 1, 1, 1, 1, 1,
0.260657, 0.6888837, 0.7981746, 1, 1, 1, 1, 1,
0.261116, 0.3513975, -0.340497, 1, 1, 1, 1, 1,
0.2681357, 0.5300744, 2.451894, 1, 1, 1, 1, 1,
0.2748685, 0.732953, -0.5091048, 1, 1, 1, 1, 1,
0.2802536, -1.409678, 2.039099, 1, 1, 1, 1, 1,
0.2808248, -0.3421132, 2.562472, 1, 1, 1, 1, 1,
0.2811786, -1.220678, 1.578273, 1, 1, 1, 1, 1,
0.2843283, 1.356754, 1.326062, 1, 1, 1, 1, 1,
0.2843355, 0.5762904, 0.02833074, 1, 1, 1, 1, 1,
0.2847367, 0.3259241, -0.07786303, 1, 1, 1, 1, 1,
0.2869859, -1.298257, 2.186164, 1, 1, 1, 1, 1,
0.2927729, 0.2838421, -0.2141365, 0, 0, 1, 1, 1,
0.2943337, 0.7593903, 0.5194883, 1, 0, 0, 1, 1,
0.2992006, 1.141587, -0.2444585, 1, 0, 0, 1, 1,
0.3003223, -1.166878, 2.397788, 1, 0, 0, 1, 1,
0.3008212, -0.03149721, 2.723989, 1, 0, 0, 1, 1,
0.3088569, -0.1501965, 3.329732, 1, 0, 0, 1, 1,
0.3098929, 0.2779769, -0.04302384, 0, 0, 0, 1, 1,
0.3125999, -1.043411, 3.985548, 0, 0, 0, 1, 1,
0.3127207, 2.041586, 1.21056, 0, 0, 0, 1, 1,
0.3167244, -2.074211, 2.865383, 0, 0, 0, 1, 1,
0.3187805, 0.7824595, 0.6047254, 0, 0, 0, 1, 1,
0.3191277, 0.866104, 1.125706, 0, 0, 0, 1, 1,
0.3199012, 0.8492496, 1.54493, 0, 0, 0, 1, 1,
0.3218771, -1.447513, 1.855735, 1, 1, 1, 1, 1,
0.3246647, -0.5170587, 3.581151, 1, 1, 1, 1, 1,
0.3254339, -0.2982592, 2.154864, 1, 1, 1, 1, 1,
0.3265951, -1.777725, 4.185569, 1, 1, 1, 1, 1,
0.3277412, 0.6470197, 0.5198385, 1, 1, 1, 1, 1,
0.3321213, 0.1741719, 0.3584677, 1, 1, 1, 1, 1,
0.3324519, 0.2675382, 0.2372064, 1, 1, 1, 1, 1,
0.3338026, -0.9201432, 3.477894, 1, 1, 1, 1, 1,
0.3411619, -1.216287, 3.154308, 1, 1, 1, 1, 1,
0.3457078, -0.5383335, 3.345778, 1, 1, 1, 1, 1,
0.3458737, -0.7097239, 3.027274, 1, 1, 1, 1, 1,
0.3494354, 0.6462713, -0.008143029, 1, 1, 1, 1, 1,
0.3524712, -1.546149, 2.826467, 1, 1, 1, 1, 1,
0.3527137, 0.6428758, -1.432369, 1, 1, 1, 1, 1,
0.3546562, 1.675745, 0.1832904, 1, 1, 1, 1, 1,
0.3567675, -0.217898, 2.25914, 0, 0, 1, 1, 1,
0.3569624, -0.3632559, 3.379174, 1, 0, 0, 1, 1,
0.3587856, -0.4751627, 2.434949, 1, 0, 0, 1, 1,
0.3642466, 1.058459, 0.8885654, 1, 0, 0, 1, 1,
0.3648452, -0.497611, 2.31678, 1, 0, 0, 1, 1,
0.3662354, 1.503985, 1.420838, 1, 0, 0, 1, 1,
0.3702752, -0.02633312, 1.271772, 0, 0, 0, 1, 1,
0.3713205, 0.6588615, 0.5764298, 0, 0, 0, 1, 1,
0.373274, 1.695522, 0.0284404, 0, 0, 0, 1, 1,
0.3736686, 0.1986093, 0.8812819, 0, 0, 0, 1, 1,
0.3747428, -0.9301846, 1.884101, 0, 0, 0, 1, 1,
0.3770278, 1.678933, 2.309871, 0, 0, 0, 1, 1,
0.377701, -1.132156, 4.468989, 0, 0, 0, 1, 1,
0.3798528, 1.350914, -1.993338, 1, 1, 1, 1, 1,
0.3830829, 1.118417, 0.3451709, 1, 1, 1, 1, 1,
0.3831928, -0.8949326, 1.277002, 1, 1, 1, 1, 1,
0.385385, -1.576694, 2.601979, 1, 1, 1, 1, 1,
0.3874144, 0.6642054, 1.372113, 1, 1, 1, 1, 1,
0.3875136, -0.7459614, 1.883006, 1, 1, 1, 1, 1,
0.387863, 1.454429, -0.2064175, 1, 1, 1, 1, 1,
0.3912465, -0.5785376, 1.098331, 1, 1, 1, 1, 1,
0.3937933, 0.15076, 1.367179, 1, 1, 1, 1, 1,
0.396197, -0.7774807, 4.485838, 1, 1, 1, 1, 1,
0.3963161, -0.8482364, 2.565233, 1, 1, 1, 1, 1,
0.3995805, -1.444218, 2.946954, 1, 1, 1, 1, 1,
0.4029484, -0.4489743, 1.284185, 1, 1, 1, 1, 1,
0.4034734, -0.1208436, 2.024645, 1, 1, 1, 1, 1,
0.403731, 1.159518, 1.771441, 1, 1, 1, 1, 1,
0.4050133, -0.09603094, 0.3814304, 0, 0, 1, 1, 1,
0.4062041, -0.6480532, 1.315304, 1, 0, 0, 1, 1,
0.4071788, -0.4141944, 2.186202, 1, 0, 0, 1, 1,
0.4086682, 1.989158, -0.5854985, 1, 0, 0, 1, 1,
0.4101535, -1.679748, 2.434677, 1, 0, 0, 1, 1,
0.4104179, -0.2339328, 1.355025, 1, 0, 0, 1, 1,
0.4110244, -0.1820075, 1.916448, 0, 0, 0, 1, 1,
0.4111476, 1.10048, -0.07218741, 0, 0, 0, 1, 1,
0.4166714, -0.4723391, 1.911092, 0, 0, 0, 1, 1,
0.4198907, 0.1953623, 0.1523867, 0, 0, 0, 1, 1,
0.4215856, 1.046499, 0.7874594, 0, 0, 0, 1, 1,
0.4227675, 0.1842151, 1.832749, 0, 0, 0, 1, 1,
0.4267021, -1.123205, 2.446969, 0, 0, 0, 1, 1,
0.4292014, -0.9149141, 2.824968, 1, 1, 1, 1, 1,
0.4361323, 0.51513, -0.4150333, 1, 1, 1, 1, 1,
0.4376225, -1.618329, 3.630795, 1, 1, 1, 1, 1,
0.4412396, -1.12276, 1.696698, 1, 1, 1, 1, 1,
0.4423381, 0.02499578, 2.21095, 1, 1, 1, 1, 1,
0.4427632, 0.09537393, 1.796095, 1, 1, 1, 1, 1,
0.4443046, -0.5338079, 1.070642, 1, 1, 1, 1, 1,
0.4458548, -0.453727, 2.072037, 1, 1, 1, 1, 1,
0.4470313, 0.1420476, -1.255816, 1, 1, 1, 1, 1,
0.4503342, 0.4706218, 0.6836794, 1, 1, 1, 1, 1,
0.4661155, -0.1425039, 0.9330187, 1, 1, 1, 1, 1,
0.4713923, 1.147399, -0.7061384, 1, 1, 1, 1, 1,
0.4715503, -0.8186629, 1.704608, 1, 1, 1, 1, 1,
0.4737322, 0.05061917, 2.520674, 1, 1, 1, 1, 1,
0.4739181, -0.7395641, 3.978894, 1, 1, 1, 1, 1,
0.4804237, -1.058512, 3.511974, 0, 0, 1, 1, 1,
0.4817386, 0.1500709, 1.263716, 1, 0, 0, 1, 1,
0.4860957, 2.049224, 1.400157, 1, 0, 0, 1, 1,
0.4877675, 0.5643852, 1.761832, 1, 0, 0, 1, 1,
0.4908555, -1.638722, 3.4093, 1, 0, 0, 1, 1,
0.4934653, 0.2852549, 0.003516473, 1, 0, 0, 1, 1,
0.4955604, -0.2285329, 1.982994, 0, 0, 0, 1, 1,
0.4985434, -0.6489804, 3.119245, 0, 0, 0, 1, 1,
0.5022181, 1.498085, -0.2942319, 0, 0, 0, 1, 1,
0.5044728, 0.4337644, 1.673142, 0, 0, 0, 1, 1,
0.5060601, 2.199192, 1.603695, 0, 0, 0, 1, 1,
0.5111055, -1.312991, 3.501703, 0, 0, 0, 1, 1,
0.5141371, 0.005118912, -0.127213, 0, 0, 0, 1, 1,
0.5217958, 0.4888276, 0.5212464, 1, 1, 1, 1, 1,
0.5270748, 0.1216139, 2.672953, 1, 1, 1, 1, 1,
0.5309589, -0.9374182, 0.971819, 1, 1, 1, 1, 1,
0.537255, 2.137426, -0.7314612, 1, 1, 1, 1, 1,
0.5374674, 0.6128162, -0.3997037, 1, 1, 1, 1, 1,
0.5440075, -0.03658691, 0.7894698, 1, 1, 1, 1, 1,
0.5453038, 1.646466, 1.196671, 1, 1, 1, 1, 1,
0.5474688, 0.3422115, 1.498043, 1, 1, 1, 1, 1,
0.5566857, -0.4590972, 1.420546, 1, 1, 1, 1, 1,
0.5570112, -0.7709008, 5.10561, 1, 1, 1, 1, 1,
0.5575956, 0.6771858, -0.4370628, 1, 1, 1, 1, 1,
0.5597173, 0.8068771, 0.2410394, 1, 1, 1, 1, 1,
0.561634, -0.3439519, 1.881589, 1, 1, 1, 1, 1,
0.5620733, -0.7934473, 2.067979, 1, 1, 1, 1, 1,
0.563243, 1.093066, -0.8949556, 1, 1, 1, 1, 1,
0.5702009, -0.4281208, 2.579601, 0, 0, 1, 1, 1,
0.5713179, -0.7756433, 2.895406, 1, 0, 0, 1, 1,
0.5736586, -0.1132587, 0.5671242, 1, 0, 0, 1, 1,
0.5736893, 2.248745, -0.4265517, 1, 0, 0, 1, 1,
0.5784612, 0.8899665, 1.164529, 1, 0, 0, 1, 1,
0.5809596, -0.4029815, 3.242149, 1, 0, 0, 1, 1,
0.5905223, -1.665094, 1.885445, 0, 0, 0, 1, 1,
0.5918016, 1.459947, 1.542439, 0, 0, 0, 1, 1,
0.5947362, 0.5445836, 2.210733, 0, 0, 0, 1, 1,
0.5970833, 0.005567362, 3.355453, 0, 0, 0, 1, 1,
0.5997233, -0.8993442, 1.656692, 0, 0, 0, 1, 1,
0.603997, -1.401138, 0.6667851, 0, 0, 0, 1, 1,
0.6147928, 0.6384594, -0.3525502, 0, 0, 0, 1, 1,
0.6196647, -0.01474796, 0.7920276, 1, 1, 1, 1, 1,
0.620231, -0.4314381, 3.356962, 1, 1, 1, 1, 1,
0.6249273, 0.2963271, 2.622581, 1, 1, 1, 1, 1,
0.6253887, -0.7310252, 1.721052, 1, 1, 1, 1, 1,
0.6293145, -2.095847, 2.883228, 1, 1, 1, 1, 1,
0.6310654, 0.421652, 1.472037, 1, 1, 1, 1, 1,
0.6313473, -1.324646, 3.81703, 1, 1, 1, 1, 1,
0.6422229, 0.004343146, 1.701057, 1, 1, 1, 1, 1,
0.6486987, -0.7231982, 1.879948, 1, 1, 1, 1, 1,
0.6523322, -0.9123614, 2.008854, 1, 1, 1, 1, 1,
0.6528229, -1.682968, 5.009155, 1, 1, 1, 1, 1,
0.6568418, -1.528391, 3.512859, 1, 1, 1, 1, 1,
0.6582401, 0.3289376, -0.3044862, 1, 1, 1, 1, 1,
0.6608683, -2.293486, 1.641029, 1, 1, 1, 1, 1,
0.6627619, 0.262496, 0.533845, 1, 1, 1, 1, 1,
0.6645001, 0.4793507, -0.09999312, 0, 0, 1, 1, 1,
0.6690853, 0.7775455, -1.079723, 1, 0, 0, 1, 1,
0.670867, 2.296056, 0.9967312, 1, 0, 0, 1, 1,
0.6730283, 1.354504, 0.2469347, 1, 0, 0, 1, 1,
0.6745272, -0.3553606, 2.861952, 1, 0, 0, 1, 1,
0.6805242, -0.8456848, 1.915954, 1, 0, 0, 1, 1,
0.6826454, -0.3543348, 1.821438, 0, 0, 0, 1, 1,
0.6842389, 0.3857801, 0.2182858, 0, 0, 0, 1, 1,
0.686204, 0.699966, 0.8804393, 0, 0, 0, 1, 1,
0.6884444, -0.5482804, 1.620468, 0, 0, 0, 1, 1,
0.6897939, -0.04976923, 1.873041, 0, 0, 0, 1, 1,
0.7001224, -0.6381995, 2.862566, 0, 0, 0, 1, 1,
0.7010652, -0.06758883, 0.4488304, 0, 0, 0, 1, 1,
0.7051474, 0.156719, 2.091709, 1, 1, 1, 1, 1,
0.7202747, 0.9921297, 0.02309068, 1, 1, 1, 1, 1,
0.7229773, 0.3305366, 1.693899, 1, 1, 1, 1, 1,
0.7252218, 0.4223339, 1.862766, 1, 1, 1, 1, 1,
0.7300081, -0.9142419, 2.826872, 1, 1, 1, 1, 1,
0.7330674, -0.08491423, 2.224024, 1, 1, 1, 1, 1,
0.7336874, 1.454336, -0.07634263, 1, 1, 1, 1, 1,
0.7336926, -0.9703253, 3.329674, 1, 1, 1, 1, 1,
0.7360553, 0.7600703, 0.4369242, 1, 1, 1, 1, 1,
0.74279, -0.710871, 3.400232, 1, 1, 1, 1, 1,
0.7448241, 0.4733202, -0.3364257, 1, 1, 1, 1, 1,
0.7457745, -1.797189, 4.015636, 1, 1, 1, 1, 1,
0.7495592, -2.355546, 1.501712, 1, 1, 1, 1, 1,
0.756677, -0.2565221, 2.271808, 1, 1, 1, 1, 1,
0.7616538, -2.072881, 2.095222, 1, 1, 1, 1, 1,
0.7687455, -0.12102, 2.469455, 0, 0, 1, 1, 1,
0.7726025, -1.973093, 3.385075, 1, 0, 0, 1, 1,
0.7738927, -0.5592058, 1.45745, 1, 0, 0, 1, 1,
0.7752101, 0.4639516, -1.327734, 1, 0, 0, 1, 1,
0.7753037, -0.01095277, 3.029755, 1, 0, 0, 1, 1,
0.7787815, 0.1568559, 1.058771, 1, 0, 0, 1, 1,
0.7797792, 0.03864513, -0.2173732, 0, 0, 0, 1, 1,
0.7818301, 1.134935, 1.698575, 0, 0, 0, 1, 1,
0.7842801, -0.01493975, 0.1217145, 0, 0, 0, 1, 1,
0.7854811, -0.02535757, 1.648615, 0, 0, 0, 1, 1,
0.7889575, 0.01481756, 2.334902, 0, 0, 0, 1, 1,
0.7933522, 0.3444669, 0.3506549, 0, 0, 0, 1, 1,
0.7939095, 0.4651219, 0.2110406, 0, 0, 0, 1, 1,
0.8031875, 1.207876, -1.807777, 1, 1, 1, 1, 1,
0.8050096, 0.8215439, 0.8601696, 1, 1, 1, 1, 1,
0.8125789, -0.9802077, 2.296068, 1, 1, 1, 1, 1,
0.8206013, 1.725147, 1.31492, 1, 1, 1, 1, 1,
0.8280549, -0.1115054, 1.945577, 1, 1, 1, 1, 1,
0.834534, -1.732047, 1.827435, 1, 1, 1, 1, 1,
0.8411354, 0.3897507, 2.774842, 1, 1, 1, 1, 1,
0.8429499, 1.417563, 1.166717, 1, 1, 1, 1, 1,
0.8459303, 0.6317602, 1.676893, 1, 1, 1, 1, 1,
0.8479152, -0.1063462, 2.191324, 1, 1, 1, 1, 1,
0.8519079, 0.7306897, -0.04896885, 1, 1, 1, 1, 1,
0.8522268, 0.5006492, 1.681914, 1, 1, 1, 1, 1,
0.8584424, -2.021211, 2.032015, 1, 1, 1, 1, 1,
0.8589017, -0.4576365, 2.375091, 1, 1, 1, 1, 1,
0.8593606, 2.404826, 1.34258, 1, 1, 1, 1, 1,
0.8637151, 0.1755048, 2.024485, 0, 0, 1, 1, 1,
0.8676348, 0.4600735, 0.9851567, 1, 0, 0, 1, 1,
0.870409, 0.7946711, 2.033357, 1, 0, 0, 1, 1,
0.8788826, 0.6385092, 2.577033, 1, 0, 0, 1, 1,
0.8800361, 1.179558, 1.495187, 1, 0, 0, 1, 1,
0.885803, 0.1550704, 2.303422, 1, 0, 0, 1, 1,
0.8871464, -0.4033814, 2.78585, 0, 0, 0, 1, 1,
0.8879681, -0.33459, 2.598096, 0, 0, 0, 1, 1,
0.8962387, 1.704833, -0.6098388, 0, 0, 0, 1, 1,
0.9024903, -0.3379215, 0.6915281, 0, 0, 0, 1, 1,
0.9225776, -0.0791572, 3.5981, 0, 0, 0, 1, 1,
0.923474, 1.186352, 0.4340363, 0, 0, 0, 1, 1,
0.9276039, 1.225059, -0.9509256, 0, 0, 0, 1, 1,
0.9345498, 0.0770338, 3.674642, 1, 1, 1, 1, 1,
0.9369059, 1.329257, 0.410923, 1, 1, 1, 1, 1,
0.9369427, -0.1453412, 1.633523, 1, 1, 1, 1, 1,
0.9408763, 0.4477495, 0.9827842, 1, 1, 1, 1, 1,
0.9420389, 0.6792862, 2.794427, 1, 1, 1, 1, 1,
0.9425622, 0.03755246, 1.464781, 1, 1, 1, 1, 1,
0.9427805, -1.685735, 2.245286, 1, 1, 1, 1, 1,
0.9477903, 0.9933634, 0.60423, 1, 1, 1, 1, 1,
0.9498129, -0.08179007, 3.289605, 1, 1, 1, 1, 1,
0.9499203, -1.575866, 2.707144, 1, 1, 1, 1, 1,
0.9603435, -0.4735885, 2.141921, 1, 1, 1, 1, 1,
0.960805, -1.063675, 4.36895, 1, 1, 1, 1, 1,
0.9611254, -0.9756555, 2.380333, 1, 1, 1, 1, 1,
0.9640846, 1.03664, 2.330314, 1, 1, 1, 1, 1,
0.9648505, 0.3816806, 1.489221, 1, 1, 1, 1, 1,
0.96671, -0.4105522, 2.569199, 0, 0, 1, 1, 1,
0.9726624, -0.4902469, 1.158317, 1, 0, 0, 1, 1,
0.9794322, 0.5339114, -0.01636928, 1, 0, 0, 1, 1,
0.9821801, 1.118185, 1.568676, 1, 0, 0, 1, 1,
0.9834772, 0.741325, 0.7205204, 1, 0, 0, 1, 1,
0.9846028, -1.452801, 2.529891, 1, 0, 0, 1, 1,
0.9850537, -0.5128285, 1.654668, 0, 0, 0, 1, 1,
0.9867547, -1.325567, 1.07012, 0, 0, 0, 1, 1,
0.9872462, -0.7367597, 3.780128, 0, 0, 0, 1, 1,
0.9892754, 0.1198039, 2.886047, 0, 0, 0, 1, 1,
0.9926669, -0.8212784, 3.972866, 0, 0, 0, 1, 1,
0.9977067, 0.8094004, 1.41619, 0, 0, 0, 1, 1,
1.0018, 2.165961, -0.3309242, 0, 0, 0, 1, 1,
1.002492, 0.4422839, 2.330137, 1, 1, 1, 1, 1,
1.009305, 0.5881257, 1.691161, 1, 1, 1, 1, 1,
1.011022, -0.441633, 2.075349, 1, 1, 1, 1, 1,
1.019863, 1.020262, 0.03767064, 1, 1, 1, 1, 1,
1.020243, -1.713121, 1.661669, 1, 1, 1, 1, 1,
1.021045, 0.4840349, 2.41092, 1, 1, 1, 1, 1,
1.026766, -0.5602762, 2.708015, 1, 1, 1, 1, 1,
1.029303, -1.234959, -0.1905352, 1, 1, 1, 1, 1,
1.040392, -1.209177, 3.165104, 1, 1, 1, 1, 1,
1.045616, -0.7028791, 2.181333, 1, 1, 1, 1, 1,
1.05525, -0.8141951, 2.800428, 1, 1, 1, 1, 1,
1.06054, 0.7117079, -0.6565628, 1, 1, 1, 1, 1,
1.061429, 1.266494, 2.160915, 1, 1, 1, 1, 1,
1.063114, 0.8189872, 1.293067, 1, 1, 1, 1, 1,
1.065682, 2.874206, -0.2276585, 1, 1, 1, 1, 1,
1.065719, -0.8889061, 1.573094, 0, 0, 1, 1, 1,
1.07422, 0.183043, 2.606973, 1, 0, 0, 1, 1,
1.077481, -0.2401257, 3.542964, 1, 0, 0, 1, 1,
1.081602, -1.11766, 3.470845, 1, 0, 0, 1, 1,
1.083066, -0.09022707, 2.28542, 1, 0, 0, 1, 1,
1.088562, 1.401719, 0.3727078, 1, 0, 0, 1, 1,
1.091517, -0.2592316, 4.525703, 0, 0, 0, 1, 1,
1.100045, 1.311721, 0.05388388, 0, 0, 0, 1, 1,
1.102313, -1.688469, 2.239512, 0, 0, 0, 1, 1,
1.102382, -0.8211829, 1.756953, 0, 0, 0, 1, 1,
1.107271, 0.6678662, 1.569246, 0, 0, 0, 1, 1,
1.113341, -1.238335, 1.546298, 0, 0, 0, 1, 1,
1.116436, 0.6466466, 1.308852, 0, 0, 0, 1, 1,
1.118528, -0.5737925, 1.731644, 1, 1, 1, 1, 1,
1.118651, -0.1926499, 3.165447, 1, 1, 1, 1, 1,
1.123416, 0.9791002, 1.741576, 1, 1, 1, 1, 1,
1.124789, -0.07368843, 2.026641, 1, 1, 1, 1, 1,
1.126032, 1.465456, 1.492527, 1, 1, 1, 1, 1,
1.126357, -0.799143, 1.859514, 1, 1, 1, 1, 1,
1.126898, 0.2133188, 3.06681, 1, 1, 1, 1, 1,
1.127691, -0.6707509, 1.170253, 1, 1, 1, 1, 1,
1.129287, 0.01140085, 1.420603, 1, 1, 1, 1, 1,
1.131193, 0.5009374, 1.065238, 1, 1, 1, 1, 1,
1.135909, -1.210242, 3.233405, 1, 1, 1, 1, 1,
1.139719, -1.779379, 2.82872, 1, 1, 1, 1, 1,
1.142116, 0.5107622, 1.605753, 1, 1, 1, 1, 1,
1.142256, 0.160657, -0.6198304, 1, 1, 1, 1, 1,
1.143067, 1.489896, 0.6597929, 1, 1, 1, 1, 1,
1.147464, -0.8010878, 1.142307, 0, 0, 1, 1, 1,
1.152732, -1.95536, 4.255824, 1, 0, 0, 1, 1,
1.159107, 1.35758, 0.5914081, 1, 0, 0, 1, 1,
1.163876, -0.4939925, 2.694286, 1, 0, 0, 1, 1,
1.179719, -1.950359, 2.775164, 1, 0, 0, 1, 1,
1.181391, -0.4323643, 1.703422, 1, 0, 0, 1, 1,
1.18518, 1.414742, -0.2411958, 0, 0, 0, 1, 1,
1.189796, 0.08882302, 2.686256, 0, 0, 0, 1, 1,
1.196435, -1.973934, 2.400964, 0, 0, 0, 1, 1,
1.19793, 1.142129, 2.330107, 0, 0, 0, 1, 1,
1.199587, 0.9431884, 1.412291, 0, 0, 0, 1, 1,
1.204875, 1.503363, 0.01623165, 0, 0, 0, 1, 1,
1.205464, -0.3280081, 3.106655, 0, 0, 0, 1, 1,
1.211956, -0.6213366, 1.115855, 1, 1, 1, 1, 1,
1.218421, 0.5393326, 2.204026, 1, 1, 1, 1, 1,
1.223767, -0.1237903, 0.4485514, 1, 1, 1, 1, 1,
1.231397, 0.7340752, 0.689518, 1, 1, 1, 1, 1,
1.233504, -0.3594429, 3.160002, 1, 1, 1, 1, 1,
1.236583, 1.071743, 1.708337, 1, 1, 1, 1, 1,
1.246405, -1.004215, 2.697094, 1, 1, 1, 1, 1,
1.248552, -0.1824273, 1.319482, 1, 1, 1, 1, 1,
1.260724, 1.160828, 0.1404966, 1, 1, 1, 1, 1,
1.2626, 1.648765, 1.145685, 1, 1, 1, 1, 1,
1.285994, -0.04944688, -0.02155861, 1, 1, 1, 1, 1,
1.290855, -0.2993487, 2.770855, 1, 1, 1, 1, 1,
1.295299, 0.5008343, 0.1232606, 1, 1, 1, 1, 1,
1.296294, 0.6325015, 0.1899954, 1, 1, 1, 1, 1,
1.29937, -1.698712, 2.446669, 1, 1, 1, 1, 1,
1.30002, -0.05369574, 0.3233676, 0, 0, 1, 1, 1,
1.304123, -1.651363, 3.367155, 1, 0, 0, 1, 1,
1.311383, 0.8196601, 2.152451, 1, 0, 0, 1, 1,
1.315197, -0.3043937, 2.801541, 1, 0, 0, 1, 1,
1.322278, 0.280993, -0.3685474, 1, 0, 0, 1, 1,
1.335171, -0.3397334, 2.14602, 1, 0, 0, 1, 1,
1.349713, 0.6670671, 1.690205, 0, 0, 0, 1, 1,
1.367883, 0.1550049, 0.50022, 0, 0, 0, 1, 1,
1.369658, -2.001055, 4.354038, 0, 0, 0, 1, 1,
1.369804, -0.3969601, 1.399099, 0, 0, 0, 1, 1,
1.37176, -1.21819, 2.735011, 0, 0, 0, 1, 1,
1.372662, -1.470908, 1.984979, 0, 0, 0, 1, 1,
1.380763, -0.1433299, -0.8616552, 0, 0, 0, 1, 1,
1.385644, -0.7244143, 0.4668235, 1, 1, 1, 1, 1,
1.399573, -0.6657277, 2.2371, 1, 1, 1, 1, 1,
1.40016, -1.189955, 3.35067, 1, 1, 1, 1, 1,
1.402643, 2.014899, 0.5079334, 1, 1, 1, 1, 1,
1.415381, -0.4899411, 1.0382, 1, 1, 1, 1, 1,
1.416474, -1.862171, 3.542917, 1, 1, 1, 1, 1,
1.418074, -0.6921936, 1.52165, 1, 1, 1, 1, 1,
1.418389, 0.9579497, 0.02217513, 1, 1, 1, 1, 1,
1.440067, -0.7999003, 2.314343, 1, 1, 1, 1, 1,
1.446708, -0.02811463, 3.272862, 1, 1, 1, 1, 1,
1.466246, -0.2581905, 2.303516, 1, 1, 1, 1, 1,
1.467183, 0.01954215, 0.9808972, 1, 1, 1, 1, 1,
1.475667, -1.946081, 3.16515, 1, 1, 1, 1, 1,
1.481985, 1.232106, 1.263967, 1, 1, 1, 1, 1,
1.492556, 1.313562, 0.6888434, 1, 1, 1, 1, 1,
1.496434, -1.533516, 3.14491, 0, 0, 1, 1, 1,
1.499399, 0.8677623, 0.4509102, 1, 0, 0, 1, 1,
1.503515, 0.04341947, 4.137065, 1, 0, 0, 1, 1,
1.503977, 1.474174, 0.2301846, 1, 0, 0, 1, 1,
1.510475, 0.3480169, 2.624997, 1, 0, 0, 1, 1,
1.514029, -1.973269, 2.320152, 1, 0, 0, 1, 1,
1.530664, -0.451368, 2.428348, 0, 0, 0, 1, 1,
1.532917, -0.4944392, 1.919445, 0, 0, 0, 1, 1,
1.552168, -0.6377676, 3.450248, 0, 0, 0, 1, 1,
1.560206, -1.040871, 1.110994, 0, 0, 0, 1, 1,
1.572197, 1.053221, 2.25886, 0, 0, 0, 1, 1,
1.575129, -1.666015, 1.37749, 0, 0, 0, 1, 1,
1.602108, 1.02515, 1.120283, 0, 0, 0, 1, 1,
1.606908, -2.017314, 2.607718, 1, 1, 1, 1, 1,
1.61421, 0.4522236, 1.175244, 1, 1, 1, 1, 1,
1.618562, -0.2005052, 2.74755, 1, 1, 1, 1, 1,
1.619051, 0.2566729, -0.05213889, 1, 1, 1, 1, 1,
1.620668, 0.311518, 0.7175782, 1, 1, 1, 1, 1,
1.631395, -0.271632, 3.352087, 1, 1, 1, 1, 1,
1.643903, -2.565461, 2.165747, 1, 1, 1, 1, 1,
1.657591, -3.5139, 2.809015, 1, 1, 1, 1, 1,
1.690965, 1.204753, 1.478209, 1, 1, 1, 1, 1,
1.703463, -1.537711, 2.684151, 1, 1, 1, 1, 1,
1.718591, -0.2513738, 2.389218, 1, 1, 1, 1, 1,
1.721586, 0.6305476, 1.577807, 1, 1, 1, 1, 1,
1.744709, 0.5467768, 0.0453194, 1, 1, 1, 1, 1,
1.757566, -0.9758457, 1.501717, 1, 1, 1, 1, 1,
1.769374, 1.427978, 0.1893222, 1, 1, 1, 1, 1,
1.775957, 0.8401623, 0.9781819, 0, 0, 1, 1, 1,
1.781328, 0.694047, 0.4604891, 1, 0, 0, 1, 1,
1.803718, 0.4507313, 0.1827951, 1, 0, 0, 1, 1,
1.807205, 0.8392166, 0.2505747, 1, 0, 0, 1, 1,
1.827688, 2.815802, 0.9835712, 1, 0, 0, 1, 1,
1.827717, 0.9012161, 2.43687, 1, 0, 0, 1, 1,
1.830714, 1.189126, 1.627334, 0, 0, 0, 1, 1,
1.838787, 0.02390333, 3.33367, 0, 0, 0, 1, 1,
1.839443, 1.110183, 0.6449112, 0, 0, 0, 1, 1,
1.845152, -0.2611871, 0.9680647, 0, 0, 0, 1, 1,
1.85999, 0.5892082, 2.470815, 0, 0, 0, 1, 1,
1.86766, 2.04265, 2.065975, 0, 0, 0, 1, 1,
1.869339, 0.4660022, 2.678882, 0, 0, 0, 1, 1,
1.88338, -0.5850798, 1.67254, 1, 1, 1, 1, 1,
1.931394, -0.444478, 2.632541, 1, 1, 1, 1, 1,
1.935092, 3.143943, -0.4582697, 1, 1, 1, 1, 1,
1.94654, -0.2032354, 1.547143, 1, 1, 1, 1, 1,
1.954337, -1.080024, 1.700354, 1, 1, 1, 1, 1,
1.966598, -1.20704, 2.443718, 1, 1, 1, 1, 1,
1.968921, 1.872231, 2.291579, 1, 1, 1, 1, 1,
1.974527, 1.534474, 0.4429958, 1, 1, 1, 1, 1,
1.983727, 0.1087101, 0.7640668, 1, 1, 1, 1, 1,
1.9892, -1.289342, 1.890606, 1, 1, 1, 1, 1,
2.000195, 0.147765, 1.997862, 1, 1, 1, 1, 1,
2.009885, -0.2889096, 2.364655, 1, 1, 1, 1, 1,
2.052961, 1.780283, 1.590251, 1, 1, 1, 1, 1,
2.05412, 0.1045328, 2.565337, 1, 1, 1, 1, 1,
2.059469, -0.7804735, 1.900077, 1, 1, 1, 1, 1,
2.119411, -1.339371, 2.039169, 0, 0, 1, 1, 1,
2.128627, -1.196388, 3.174625, 1, 0, 0, 1, 1,
2.128919, -0.8330051, 1.519475, 1, 0, 0, 1, 1,
2.147886, 1.613755, 1.548841, 1, 0, 0, 1, 1,
2.210761, -0.03900724, 1.169532, 1, 0, 0, 1, 1,
2.232033, 1.267988, -2.934554, 1, 0, 0, 1, 1,
2.267999, -2.251894, 4.300739, 0, 0, 0, 1, 1,
2.290719, 0.8759395, 3.448584, 0, 0, 0, 1, 1,
2.32059, -1.768549, 0.4102846, 0, 0, 0, 1, 1,
2.344288, 0.5128323, -0.5205562, 0, 0, 0, 1, 1,
2.40575, 1.588081, 0.6781774, 0, 0, 0, 1, 1,
2.457699, 1.274441, 2.108509, 0, 0, 0, 1, 1,
2.495627, 3.054286, 0.1684373, 0, 0, 0, 1, 1,
2.498653, 0.373114, 0.8190129, 1, 1, 1, 1, 1,
2.52915, 0.8949845, 2.001317, 1, 1, 1, 1, 1,
2.557684, -0.8851579, 1.303648, 1, 1, 1, 1, 1,
2.603588, -0.5603948, 0.01216928, 1, 1, 1, 1, 1,
2.682146, 1.341214, 0.668636, 1, 1, 1, 1, 1,
3.089933, 1.051716, 2.221916, 1, 1, 1, 1, 1,
3.09841, -0.5670252, 3.273451, 1, 1, 1, 1, 1
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
var radius = 9.188268;
var distance = 32.2734;
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
mvMatrix.translate( -0.05064511, 0.1752419, -0.2265141 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.2734);
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
