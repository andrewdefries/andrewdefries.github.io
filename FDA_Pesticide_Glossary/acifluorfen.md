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
-3.382386, 3.161365e-05, -0.9842739, 1, 0, 0, 1,
-3.146656, -0.2963533, -1.324353, 1, 0.007843138, 0, 1,
-3.055514, -0.7340041, -3.038881, 1, 0.01176471, 0, 1,
-3.003891, -1.246934, -2.30802, 1, 0.01960784, 0, 1,
-2.914045, 0.967756, -1.206052, 1, 0.02352941, 0, 1,
-2.715488, -0.05230647, -1.765369, 1, 0.03137255, 0, 1,
-2.631918, 0.3823493, -2.019318, 1, 0.03529412, 0, 1,
-2.621322, -0.8851032, -3.860377, 1, 0.04313726, 0, 1,
-2.42568, 1.777575, 0.14488, 1, 0.04705882, 0, 1,
-2.413396, 2.331817, -0.533366, 1, 0.05490196, 0, 1,
-2.378214, -0.7626899, -1.307504, 1, 0.05882353, 0, 1,
-2.377306, -1.898646, -2.414271, 1, 0.06666667, 0, 1,
-2.345386, 0.3403046, -2.004772, 1, 0.07058824, 0, 1,
-2.273909, 0.8259159, -2.241962, 1, 0.07843138, 0, 1,
-2.216224, -1.259903, -1.959141, 1, 0.08235294, 0, 1,
-2.201087, 1.57452, -1.103827, 1, 0.09019608, 0, 1,
-2.17117, -1.457469, -4.675495, 1, 0.09411765, 0, 1,
-2.162733, 0.04154281, -0.9131779, 1, 0.1019608, 0, 1,
-2.130241, 0.1558501, -0.7387246, 1, 0.1098039, 0, 1,
-2.112772, -1.140068, -2.510904, 1, 0.1137255, 0, 1,
-2.09213, 0.0107015, -1.634118, 1, 0.1215686, 0, 1,
-2.089535, 0.31178, -2.913007, 1, 0.1254902, 0, 1,
-2.0867, -0.9279791, -0.9009757, 1, 0.1333333, 0, 1,
-2.075128, -1.012153, -0.5134797, 1, 0.1372549, 0, 1,
-2.027993, 0.7884136, -2.456237, 1, 0.145098, 0, 1,
-2.01673, 0.8395482, -1.302131, 1, 0.1490196, 0, 1,
-2.01481, -1.653533, -1.168838, 1, 0.1568628, 0, 1,
-2.006564, -0.5943272, -1.880099, 1, 0.1607843, 0, 1,
-1.996995, -0.02758348, -2.082837, 1, 0.1686275, 0, 1,
-1.99679, -0.2035879, -3.12018, 1, 0.172549, 0, 1,
-1.987893, -0.5614031, -3.962582, 1, 0.1803922, 0, 1,
-1.986631, -2.088205, -3.593627, 1, 0.1843137, 0, 1,
-1.94828, 0.2352941, -1.909812, 1, 0.1921569, 0, 1,
-1.94264, -1.308992, -1.185016, 1, 0.1960784, 0, 1,
-1.921953, 1.024042, -0.6193896, 1, 0.2039216, 0, 1,
-1.887651, -2.463136, -2.96955, 1, 0.2117647, 0, 1,
-1.884869, 0.48745, -2.720945, 1, 0.2156863, 0, 1,
-1.878014, -0.2371161, -1.253884, 1, 0.2235294, 0, 1,
-1.842942, -0.8856981, -1.887968, 1, 0.227451, 0, 1,
-1.83511, -0.9427122, -2.284504, 1, 0.2352941, 0, 1,
-1.826246, -0.9725971, -1.697026, 1, 0.2392157, 0, 1,
-1.812148, 0.9788717, -1.552229, 1, 0.2470588, 0, 1,
-1.800578, -1.167407, -2.909133, 1, 0.2509804, 0, 1,
-1.786707, -1.438352, -2.065686, 1, 0.2588235, 0, 1,
-1.749809, -0.5191631, -3.313395, 1, 0.2627451, 0, 1,
-1.748096, -1.046843, -0.9255935, 1, 0.2705882, 0, 1,
-1.731083, 0.550019, -2.070228, 1, 0.2745098, 0, 1,
-1.719787, -1.574253, -2.853749, 1, 0.282353, 0, 1,
-1.717199, 0.5746204, -0.6650272, 1, 0.2862745, 0, 1,
-1.714491, -0.1758556, -2.179741, 1, 0.2941177, 0, 1,
-1.711615, -1.038517, -0.7336946, 1, 0.3019608, 0, 1,
-1.70925, 0.1926899, -1.18241, 1, 0.3058824, 0, 1,
-1.708473, 0.6211633, -0.6149158, 1, 0.3137255, 0, 1,
-1.702165, -1.387226, -1.054425, 1, 0.3176471, 0, 1,
-1.695638, 0.8068244, -0.4600446, 1, 0.3254902, 0, 1,
-1.690288, -0.7122801, -2.262999, 1, 0.3294118, 0, 1,
-1.682904, 0.4294417, -0.2073172, 1, 0.3372549, 0, 1,
-1.667273, -1.398936, -3.127816, 1, 0.3411765, 0, 1,
-1.665085, -1.748309, -1.788653, 1, 0.3490196, 0, 1,
-1.619396, 0.6865237, -0.6111486, 1, 0.3529412, 0, 1,
-1.591696, 0.4874255, -3.017446, 1, 0.3607843, 0, 1,
-1.564426, 0.02889483, -3.035636, 1, 0.3647059, 0, 1,
-1.559256, -1.475837, -2.691887, 1, 0.372549, 0, 1,
-1.553375, -0.0910261, -1.646519, 1, 0.3764706, 0, 1,
-1.552964, 0.4347231, -1.179682, 1, 0.3843137, 0, 1,
-1.547091, -0.6216848, -3.10017, 1, 0.3882353, 0, 1,
-1.530601, -1.244916, -2.094722, 1, 0.3960784, 0, 1,
-1.52813, -1.126951, -1.191053, 1, 0.4039216, 0, 1,
-1.520966, -0.09400975, -1.584784, 1, 0.4078431, 0, 1,
-1.518409, 1.105876, -1.106392, 1, 0.4156863, 0, 1,
-1.506905, -0.2739386, -3.27784, 1, 0.4196078, 0, 1,
-1.500142, -2.008723, -2.673864, 1, 0.427451, 0, 1,
-1.491533, -0.7378407, -2.394072, 1, 0.4313726, 0, 1,
-1.483921, -1.218414, -2.567275, 1, 0.4392157, 0, 1,
-1.479501, 0.2780406, -3.109365, 1, 0.4431373, 0, 1,
-1.474035, 0.705708, -1.545551, 1, 0.4509804, 0, 1,
-1.453536, 0.5019154, 0.01156163, 1, 0.454902, 0, 1,
-1.448235, -0.107803, -0.2486329, 1, 0.4627451, 0, 1,
-1.44663, -0.4108629, -2.660894, 1, 0.4666667, 0, 1,
-1.443752, 0.4878206, -1.655699, 1, 0.4745098, 0, 1,
-1.429325, 2.089468, -1.286013, 1, 0.4784314, 0, 1,
-1.424565, 0.410876, -0.3430638, 1, 0.4862745, 0, 1,
-1.415373, 0.6720669, -1.981845, 1, 0.4901961, 0, 1,
-1.412119, -1.188526, -1.569491, 1, 0.4980392, 0, 1,
-1.411017, 0.3100685, -0.2200047, 1, 0.5058824, 0, 1,
-1.402027, -1.978386, -3.233648, 1, 0.509804, 0, 1,
-1.395148, -0.3852046, -1.451884, 1, 0.5176471, 0, 1,
-1.383722, -0.6820922, -2.529958, 1, 0.5215687, 0, 1,
-1.378353, -1.231495, -4.612468, 1, 0.5294118, 0, 1,
-1.37289, 0.7192532, -1.476082, 1, 0.5333334, 0, 1,
-1.367762, -0.3496633, -2.422864, 1, 0.5411765, 0, 1,
-1.361516, -0.8998867, -3.703426, 1, 0.5450981, 0, 1,
-1.358623, -0.006164738, -2.842193, 1, 0.5529412, 0, 1,
-1.356417, 1.748112, -0.1981382, 1, 0.5568628, 0, 1,
-1.350638, 0.3110545, -0.4092931, 1, 0.5647059, 0, 1,
-1.343003, 0.7210697, -0.9680872, 1, 0.5686275, 0, 1,
-1.33466, -0.1000894, -1.564013, 1, 0.5764706, 0, 1,
-1.325381, 0.4511677, -3.329633, 1, 0.5803922, 0, 1,
-1.314005, 0.02846295, -0.1543241, 1, 0.5882353, 0, 1,
-1.289566, -0.09766926, -0.9506337, 1, 0.5921569, 0, 1,
-1.288047, 0.9756697, -0.6234586, 1, 0.6, 0, 1,
-1.277638, -1.448915, -3.757076, 1, 0.6078432, 0, 1,
-1.269971, -0.2793698, -2.186455, 1, 0.6117647, 0, 1,
-1.265667, -0.2127704, -0.9041512, 1, 0.6196079, 0, 1,
-1.263137, 0.1884719, -0.3970351, 1, 0.6235294, 0, 1,
-1.260437, -0.2337245, -0.8406497, 1, 0.6313726, 0, 1,
-1.259305, 1.540176, -1.21763, 1, 0.6352941, 0, 1,
-1.246211, -2.325611, -2.322065, 1, 0.6431373, 0, 1,
-1.211543, -1.184119, -4.659671, 1, 0.6470588, 0, 1,
-1.210737, 0.6928726, -0.570943, 1, 0.654902, 0, 1,
-1.210655, -1.454278, -2.277432, 1, 0.6588235, 0, 1,
-1.205145, 1.054876, 0.2284283, 1, 0.6666667, 0, 1,
-1.199833, 0.1795774, -1.087059, 1, 0.6705883, 0, 1,
-1.196892, 7.529546e-05, -1.262102, 1, 0.6784314, 0, 1,
-1.195484, -0.3292532, -0.7633778, 1, 0.682353, 0, 1,
-1.193651, -0.5570616, -2.787578, 1, 0.6901961, 0, 1,
-1.187722, -0.2670471, -2.439838, 1, 0.6941177, 0, 1,
-1.17382, 0.3718611, -0.6531766, 1, 0.7019608, 0, 1,
-1.172509, 2.489634, -0.9751744, 1, 0.7098039, 0, 1,
-1.165217, -1.198345, -2.068061, 1, 0.7137255, 0, 1,
-1.159943, -0.6660174, -1.885875, 1, 0.7215686, 0, 1,
-1.155167, -1.131728, -3.209164, 1, 0.7254902, 0, 1,
-1.144176, 0.1339564, -1.850201, 1, 0.7333333, 0, 1,
-1.14341, -0.1075498, -0.9326428, 1, 0.7372549, 0, 1,
-1.13674, 1.623277, -0.06298588, 1, 0.7450981, 0, 1,
-1.131644, 1.106946, -1.518526, 1, 0.7490196, 0, 1,
-1.128175, -0.2609855, -1.288746, 1, 0.7568628, 0, 1,
-1.117712, 0.4654861, -0.07497895, 1, 0.7607843, 0, 1,
-1.108409, -0.61009, -1.926563, 1, 0.7686275, 0, 1,
-1.107308, 0.6654517, -2.032081, 1, 0.772549, 0, 1,
-1.102871, 0.9618061, -1.370412, 1, 0.7803922, 0, 1,
-1.097305, 0.3638373, 0.3117154, 1, 0.7843137, 0, 1,
-1.097, 0.2867289, 0.7032957, 1, 0.7921569, 0, 1,
-1.096362, 0.3510178, -1.421686, 1, 0.7960784, 0, 1,
-1.091558, -0.6114222, -4.295044, 1, 0.8039216, 0, 1,
-1.088431, -1.457229, -3.560822, 1, 0.8117647, 0, 1,
-1.086883, 0.2530017, -2.393087, 1, 0.8156863, 0, 1,
-1.08364, 0.899061, -1.159029, 1, 0.8235294, 0, 1,
-1.081534, 1.072023, -2.060895, 1, 0.827451, 0, 1,
-1.081246, 0.1951874, -0.3524769, 1, 0.8352941, 0, 1,
-1.078667, -1.908643, -2.739331, 1, 0.8392157, 0, 1,
-1.070686, -0.9769329, -2.967505, 1, 0.8470588, 0, 1,
-1.0597, 1.490979, -0.7874751, 1, 0.8509804, 0, 1,
-1.059365, -0.4603297, -3.219484, 1, 0.8588235, 0, 1,
-1.046338, -0.5369169, -2.835457, 1, 0.8627451, 0, 1,
-1.037824, 1.416399, 1.303512, 1, 0.8705882, 0, 1,
-1.034658, -0.843693, -2.996982, 1, 0.8745098, 0, 1,
-1.029613, -0.6629043, -2.834229, 1, 0.8823529, 0, 1,
-1.028333, 0.2455824, -1.568698, 1, 0.8862745, 0, 1,
-1.023648, 1.354005, -0.6367232, 1, 0.8941177, 0, 1,
-1.020377, 1.113186, -1.320955, 1, 0.8980392, 0, 1,
-1.017907, 0.5023042, -2.741769, 1, 0.9058824, 0, 1,
-1.013291, -0.497551, -1.119899, 1, 0.9137255, 0, 1,
-1.006573, 0.331322, -2.001351, 1, 0.9176471, 0, 1,
-1.001979, -0.5749521, -1.807253, 1, 0.9254902, 0, 1,
-0.9925743, -0.03090793, -0.5342612, 1, 0.9294118, 0, 1,
-0.9869476, 0.410185, 0.3150006, 1, 0.9372549, 0, 1,
-0.9861871, 1.17297, -0.08620381, 1, 0.9411765, 0, 1,
-0.984435, 2.091997, 0.02255391, 1, 0.9490196, 0, 1,
-0.9688171, -1.834774, -2.132033, 1, 0.9529412, 0, 1,
-0.9589249, -1.271901, -1.688121, 1, 0.9607843, 0, 1,
-0.9562683, 0.5826689, -1.370744, 1, 0.9647059, 0, 1,
-0.9466991, -0.1036504, -1.869035, 1, 0.972549, 0, 1,
-0.946009, -0.08700301, -2.637944, 1, 0.9764706, 0, 1,
-0.9372767, -0.8550923, -2.480893, 1, 0.9843137, 0, 1,
-0.9372414, -0.4750052, -4.262073, 1, 0.9882353, 0, 1,
-0.9372317, -0.5145192, -2.188656, 1, 0.9960784, 0, 1,
-0.9360975, 0.1336941, -1.504843, 0.9960784, 1, 0, 1,
-0.9314566, 0.06256717, -0.2240729, 0.9921569, 1, 0, 1,
-0.9206198, 0.9308143, 0.1093365, 0.9843137, 1, 0, 1,
-0.9180682, 0.3410099, -2.6273, 0.9803922, 1, 0, 1,
-0.9154661, 0.3739915, -0.6781052, 0.972549, 1, 0, 1,
-0.9129835, 1.515223, -0.8048553, 0.9686275, 1, 0, 1,
-0.9104369, -1.528396, -4.949294, 0.9607843, 1, 0, 1,
-0.9100929, -0.2608178, -2.001394, 0.9568627, 1, 0, 1,
-0.9078988, 0.930705, -1.195913, 0.9490196, 1, 0, 1,
-0.8955229, -0.4907444, -1.506479, 0.945098, 1, 0, 1,
-0.8913919, -0.02617193, -1.355489, 0.9372549, 1, 0, 1,
-0.875832, 0.6946869, -1.655707, 0.9333333, 1, 0, 1,
-0.8735892, 0.6430148, -2.277814, 0.9254902, 1, 0, 1,
-0.8699822, 1.678426, -1.498615, 0.9215686, 1, 0, 1,
-0.863894, -1.013672, -3.196477, 0.9137255, 1, 0, 1,
-0.8580767, 0.64511, 0.4901522, 0.9098039, 1, 0, 1,
-0.8530225, -0.3925819, -1.934314, 0.9019608, 1, 0, 1,
-0.8439943, 1.456378, 0.08596252, 0.8941177, 1, 0, 1,
-0.8363313, 0.4030003, -0.3762784, 0.8901961, 1, 0, 1,
-0.8336652, -0.2660518, -2.856325, 0.8823529, 1, 0, 1,
-0.8333051, -0.6381823, -1.795955, 0.8784314, 1, 0, 1,
-0.8282887, 0.7483145, 1.377253, 0.8705882, 1, 0, 1,
-0.8269126, -1.463984, -2.032658, 0.8666667, 1, 0, 1,
-0.8233595, 1.608556, -1.385863, 0.8588235, 1, 0, 1,
-0.8218104, 0.8957119, -1.515818, 0.854902, 1, 0, 1,
-0.8204407, 1.416121, -2.06492, 0.8470588, 1, 0, 1,
-0.818738, 0.07201469, -1.893537, 0.8431373, 1, 0, 1,
-0.8180414, -1.132494, -2.166108, 0.8352941, 1, 0, 1,
-0.8164907, 0.1118677, -1.049493, 0.8313726, 1, 0, 1,
-0.8150043, 0.1149251, -0.2021144, 0.8235294, 1, 0, 1,
-0.8077922, -0.2532378, -3.113555, 0.8196079, 1, 0, 1,
-0.8073854, 2.289564, -0.8125837, 0.8117647, 1, 0, 1,
-0.804951, 0.2887419, -0.435157, 0.8078431, 1, 0, 1,
-0.8000621, -0.156899, -0.0136443, 0.8, 1, 0, 1,
-0.799845, 0.5824052, 0.343268, 0.7921569, 1, 0, 1,
-0.7988816, -0.1037651, -0.9701469, 0.7882353, 1, 0, 1,
-0.7976558, 0.4995828, -0.5869694, 0.7803922, 1, 0, 1,
-0.7937344, -0.6783411, -2.190466, 0.7764706, 1, 0, 1,
-0.790444, -0.4475281, -0.5254501, 0.7686275, 1, 0, 1,
-0.7899563, -1.817407, -2.862732, 0.7647059, 1, 0, 1,
-0.7894507, 0.8002746, -0.003291261, 0.7568628, 1, 0, 1,
-0.7808667, -0.8607739, -0.5005915, 0.7529412, 1, 0, 1,
-0.776945, -0.6086973, -4.517169, 0.7450981, 1, 0, 1,
-0.7701831, -2.004331, -2.549017, 0.7411765, 1, 0, 1,
-0.7673081, 1.726497, -0.6360795, 0.7333333, 1, 0, 1,
-0.7662054, 0.005291638, -2.093366, 0.7294118, 1, 0, 1,
-0.7645534, -2.467635, -2.194785, 0.7215686, 1, 0, 1,
-0.7620686, -1.430907, -2.438484, 0.7176471, 1, 0, 1,
-0.7583467, 1.381631, 0.8416438, 0.7098039, 1, 0, 1,
-0.7520369, -0.7716443, -2.586051, 0.7058824, 1, 0, 1,
-0.7515517, 0.6990748, -1.392318, 0.6980392, 1, 0, 1,
-0.7453899, 0.4048542, -1.566045, 0.6901961, 1, 0, 1,
-0.7420934, -0.3302812, -0.4585232, 0.6862745, 1, 0, 1,
-0.7405393, 0.7606811, 1.719794, 0.6784314, 1, 0, 1,
-0.738246, -0.1357971, -1.514092, 0.6745098, 1, 0, 1,
-0.7380012, -1.197187, -2.635373, 0.6666667, 1, 0, 1,
-0.728764, -0.897365, -2.760977, 0.6627451, 1, 0, 1,
-0.7266268, 0.02438173, 0.025996, 0.654902, 1, 0, 1,
-0.7241263, -0.7823, -1.752924, 0.6509804, 1, 0, 1,
-0.7236958, 0.6001958, -0.4678435, 0.6431373, 1, 0, 1,
-0.7208472, 0.6935468, 0.6000139, 0.6392157, 1, 0, 1,
-0.7162684, 0.2070464, -0.3525812, 0.6313726, 1, 0, 1,
-0.7124635, 0.01581232, -2.815617, 0.627451, 1, 0, 1,
-0.7069841, 1.445807, 0.1060004, 0.6196079, 1, 0, 1,
-0.6968608, -1.73445, -3.500144, 0.6156863, 1, 0, 1,
-0.696419, -1.010392, -2.125309, 0.6078432, 1, 0, 1,
-0.6956179, -1.467443, -1.61205, 0.6039216, 1, 0, 1,
-0.693398, 0.438686, -2.814713, 0.5960785, 1, 0, 1,
-0.6933158, -1.604055, -3.079866, 0.5882353, 1, 0, 1,
-0.6901923, 1.620614, -1.265232, 0.5843138, 1, 0, 1,
-0.6882092, 1.918596, 0.512372, 0.5764706, 1, 0, 1,
-0.6870922, 2.391258, -1.084313, 0.572549, 1, 0, 1,
-0.6870436, -1.924746, -3.515426, 0.5647059, 1, 0, 1,
-0.6856803, -0.2290477, -1.431769, 0.5607843, 1, 0, 1,
-0.6838087, 0.4011671, 1.1297, 0.5529412, 1, 0, 1,
-0.6819161, 0.01682524, -0.5658475, 0.5490196, 1, 0, 1,
-0.6787886, -0.9299584, -2.07761, 0.5411765, 1, 0, 1,
-0.6763384, -0.746239, -2.156069, 0.5372549, 1, 0, 1,
-0.6744801, 0.4790651, -0.4850127, 0.5294118, 1, 0, 1,
-0.6725283, 1.767498, 1.308279, 0.5254902, 1, 0, 1,
-0.6723925, -1.268736, -1.641827, 0.5176471, 1, 0, 1,
-0.6704136, -1.286282, -0.9362496, 0.5137255, 1, 0, 1,
-0.6695965, -0.03147061, -2.716575, 0.5058824, 1, 0, 1,
-0.6587204, 0.1197294, -1.55746, 0.5019608, 1, 0, 1,
-0.6580673, -0.3000049, -2.591861, 0.4941176, 1, 0, 1,
-0.6572176, 1.149001, -1.19366, 0.4862745, 1, 0, 1,
-0.6556601, -2.041877, -4.617157, 0.4823529, 1, 0, 1,
-0.6544852, -0.7595904, -3.086244, 0.4745098, 1, 0, 1,
-0.6540412, -0.2641579, 0.6627087, 0.4705882, 1, 0, 1,
-0.6539279, -0.5036491, -2.114642, 0.4627451, 1, 0, 1,
-0.6533129, 0.9038005, -0.5624074, 0.4588235, 1, 0, 1,
-0.6441723, -0.7683845, -3.695907, 0.4509804, 1, 0, 1,
-0.6425324, -0.5415235, -3.135911, 0.4470588, 1, 0, 1,
-0.6392336, 0.984044, -1.685243, 0.4392157, 1, 0, 1,
-0.6359266, -0.4036524, -3.67258, 0.4352941, 1, 0, 1,
-0.6314219, -0.2733162, -3.506615, 0.427451, 1, 0, 1,
-0.628324, 0.6661471, -0.5438364, 0.4235294, 1, 0, 1,
-0.6279134, 0.3650027, -1.297085, 0.4156863, 1, 0, 1,
-0.6248153, 0.4460005, -0.9469815, 0.4117647, 1, 0, 1,
-0.623157, 0.6466734, -2.266883, 0.4039216, 1, 0, 1,
-0.6169091, 0.1308993, -1.468809, 0.3960784, 1, 0, 1,
-0.608008, 1.872376, 2.340277, 0.3921569, 1, 0, 1,
-0.6078762, -0.7258251, -1.071891, 0.3843137, 1, 0, 1,
-0.6006758, -0.2040188, -0.6980411, 0.3803922, 1, 0, 1,
-0.5973099, -0.7113573, -0.4217292, 0.372549, 1, 0, 1,
-0.5971496, 1.81664, -1.558447, 0.3686275, 1, 0, 1,
-0.5960561, 1.094388, -0.6995189, 0.3607843, 1, 0, 1,
-0.5917801, -0.6195158, -2.679634, 0.3568628, 1, 0, 1,
-0.5905839, 0.3472294, -1.169429, 0.3490196, 1, 0, 1,
-0.5904971, -0.1992989, -2.516932, 0.345098, 1, 0, 1,
-0.5900527, -0.4638417, -1.613714, 0.3372549, 1, 0, 1,
-0.5859588, -0.9872704, -2.50369, 0.3333333, 1, 0, 1,
-0.5825678, -0.5676202, -1.969919, 0.3254902, 1, 0, 1,
-0.5813324, 0.03232575, -2.066144, 0.3215686, 1, 0, 1,
-0.5775631, 1.408751, 0.5363836, 0.3137255, 1, 0, 1,
-0.5594406, -0.7766736, -1.745025, 0.3098039, 1, 0, 1,
-0.5558107, -0.7906925, -1.447649, 0.3019608, 1, 0, 1,
-0.5534994, 0.98176, -1.576377, 0.2941177, 1, 0, 1,
-0.5515637, -0.6893182, -3.601958, 0.2901961, 1, 0, 1,
-0.549403, -0.4105959, -2.292175, 0.282353, 1, 0, 1,
-0.5490642, -1.300339, -1.839367, 0.2784314, 1, 0, 1,
-0.5448293, 1.24904, -0.6651515, 0.2705882, 1, 0, 1,
-0.5403832, 1.074872, -0.0002613093, 0.2666667, 1, 0, 1,
-0.5375714, -1.290981, -1.489981, 0.2588235, 1, 0, 1,
-0.5373387, 0.6949249, -1.552325, 0.254902, 1, 0, 1,
-0.536559, -1.654152, -1.957873, 0.2470588, 1, 0, 1,
-0.5339811, -1.572913, -3.529438, 0.2431373, 1, 0, 1,
-0.5335538, -0.3118275, -2.561359, 0.2352941, 1, 0, 1,
-0.5332795, -1.889484, -3.548642, 0.2313726, 1, 0, 1,
-0.5245082, 1.05429, -1.669575, 0.2235294, 1, 0, 1,
-0.5243874, 0.2521363, -1.357565, 0.2196078, 1, 0, 1,
-0.5230907, 1.293185, -1.340327, 0.2117647, 1, 0, 1,
-0.5224867, 0.8185792, 0.5875595, 0.2078431, 1, 0, 1,
-0.5113962, 0.4956136, -1.113453, 0.2, 1, 0, 1,
-0.5085937, 1.396184, -1.698955, 0.1921569, 1, 0, 1,
-0.5051506, -1.722337, -3.556826, 0.1882353, 1, 0, 1,
-0.5012428, 1.576557, 0.6375348, 0.1803922, 1, 0, 1,
-0.4975536, -0.5161633, -2.829173, 0.1764706, 1, 0, 1,
-0.4974041, 0.8390836, 1.847845, 0.1686275, 1, 0, 1,
-0.4902168, -0.5032927, -1.950344, 0.1647059, 1, 0, 1,
-0.4868727, 1.971045, -1.961463, 0.1568628, 1, 0, 1,
-0.4852479, 0.5452257, -0.5938587, 0.1529412, 1, 0, 1,
-0.4775244, 0.412135, 1.738573, 0.145098, 1, 0, 1,
-0.4775149, -0.1953846, -2.361838, 0.1411765, 1, 0, 1,
-0.4768018, -0.5016188, -1.999272, 0.1333333, 1, 0, 1,
-0.4768003, -1.579638, -2.992196, 0.1294118, 1, 0, 1,
-0.4765046, 0.7507134, -1.267176, 0.1215686, 1, 0, 1,
-0.4714052, 0.4842494, -1.104466, 0.1176471, 1, 0, 1,
-0.4676015, 1.057498, -0.5821538, 0.1098039, 1, 0, 1,
-0.4640289, 0.2033244, -1.811849, 0.1058824, 1, 0, 1,
-0.4588072, 1.206277, 0.7781615, 0.09803922, 1, 0, 1,
-0.4568745, -0.04825519, -2.555207, 0.09019608, 1, 0, 1,
-0.4559088, 2.022496, 1.864011, 0.08627451, 1, 0, 1,
-0.4548358, -1.258257, -1.370501, 0.07843138, 1, 0, 1,
-0.4536633, 1.235023, -0.626054, 0.07450981, 1, 0, 1,
-0.4509892, -0.226757, -1.990446, 0.06666667, 1, 0, 1,
-0.4467099, -0.4891786, -0.09506197, 0.0627451, 1, 0, 1,
-0.4454446, 0.8736231, 0.9792056, 0.05490196, 1, 0, 1,
-0.4446677, -2.224255, -3.127662, 0.05098039, 1, 0, 1,
-0.4443488, 0.2138596, -0.651571, 0.04313726, 1, 0, 1,
-0.4312106, -0.3163527, -1.658459, 0.03921569, 1, 0, 1,
-0.4311207, 0.2742275, -1.470337, 0.03137255, 1, 0, 1,
-0.4259521, 2.506144, -0.1505901, 0.02745098, 1, 0, 1,
-0.4174262, -0.6476087, -2.344966, 0.01960784, 1, 0, 1,
-0.4074883, -1.058295, -1.512954, 0.01568628, 1, 0, 1,
-0.4074443, -0.974824, -3.023557, 0.007843138, 1, 0, 1,
-0.4026143, -0.5336877, -2.903817, 0.003921569, 1, 0, 1,
-0.399321, 0.6939451, -1.164246, 0, 1, 0.003921569, 1,
-0.3977174, 0.6910307, -1.235541, 0, 1, 0.01176471, 1,
-0.3948953, -1.25838, -3.775372, 0, 1, 0.01568628, 1,
-0.3921844, 0.5905477, -1.939817, 0, 1, 0.02352941, 1,
-0.3861919, -0.5977556, -1.669958, 0, 1, 0.02745098, 1,
-0.385449, 0.7750807, 0.6157954, 0, 1, 0.03529412, 1,
-0.3805313, -0.6196978, -0.4674462, 0, 1, 0.03921569, 1,
-0.3786373, 0.6815953, -2.376306, 0, 1, 0.04705882, 1,
-0.3772908, -0.6483415, -2.151114, 0, 1, 0.05098039, 1,
-0.3757395, -0.3126883, -2.085452, 0, 1, 0.05882353, 1,
-0.3721302, 0.6474384, -1.860391, 0, 1, 0.0627451, 1,
-0.3698571, 0.03425673, -2.024231, 0, 1, 0.07058824, 1,
-0.3586545, -1.362232, -2.33049, 0, 1, 0.07450981, 1,
-0.3567068, -1.744553, -2.53916, 0, 1, 0.08235294, 1,
-0.3559353, -0.613687, -3.382388, 0, 1, 0.08627451, 1,
-0.3547363, -1.726694, -3.67819, 0, 1, 0.09411765, 1,
-0.3527852, -0.7083691, -4.333879, 0, 1, 0.1019608, 1,
-0.3517699, -0.6233351, -2.72413, 0, 1, 0.1058824, 1,
-0.3502396, 2.380081, 1.376209, 0, 1, 0.1137255, 1,
-0.3481017, 0.705433, -0.7317129, 0, 1, 0.1176471, 1,
-0.3474718, -1.049688, -2.403195, 0, 1, 0.1254902, 1,
-0.3448928, 1.040388, -0.7173205, 0, 1, 0.1294118, 1,
-0.3348013, 0.4558591, 0.05748391, 0, 1, 0.1372549, 1,
-0.3344757, 2.461259, 2.514861, 0, 1, 0.1411765, 1,
-0.3307246, 1.741839, -0.0607487, 0, 1, 0.1490196, 1,
-0.3303876, -0.1610713, -1.342441, 0, 1, 0.1529412, 1,
-0.324928, -2.714425, -3.398559, 0, 1, 0.1607843, 1,
-0.3228702, -1.906656, -3.714179, 0, 1, 0.1647059, 1,
-0.3149803, -0.6541817, -2.749636, 0, 1, 0.172549, 1,
-0.3112584, -0.860019, -2.083749, 0, 1, 0.1764706, 1,
-0.3107978, 1.207228, -0.4018682, 0, 1, 0.1843137, 1,
-0.3094804, 1.440165, -0.4921967, 0, 1, 0.1882353, 1,
-0.3028482, -0.654996, -3.599279, 0, 1, 0.1960784, 1,
-0.3014594, -0.4712544, -1.047954, 0, 1, 0.2039216, 1,
-0.2963391, -1.106058, -2.460481, 0, 1, 0.2078431, 1,
-0.2944504, 0.07169581, -1.838492, 0, 1, 0.2156863, 1,
-0.2895211, -1.047287, -3.537166, 0, 1, 0.2196078, 1,
-0.2867238, 1.782453, -1.18426, 0, 1, 0.227451, 1,
-0.2847989, -0.8003354, -0.8852372, 0, 1, 0.2313726, 1,
-0.2757807, -1.311132, -4.361812, 0, 1, 0.2392157, 1,
-0.2744995, -0.09891097, -0.5155557, 0, 1, 0.2431373, 1,
-0.2734751, -0.3238372, -2.322728, 0, 1, 0.2509804, 1,
-0.2730296, 0.1710269, -2.514797, 0, 1, 0.254902, 1,
-0.2721768, 0.03433746, -0.3486392, 0, 1, 0.2627451, 1,
-0.271899, 0.8107438, -1.247187, 0, 1, 0.2666667, 1,
-0.2681791, 1.171614, -1.803076, 0, 1, 0.2745098, 1,
-0.2676888, 0.6134081, -0.3553766, 0, 1, 0.2784314, 1,
-0.2612222, -0.01453154, -1.761918, 0, 1, 0.2862745, 1,
-0.2602507, -0.2260574, -2.794607, 0, 1, 0.2901961, 1,
-0.255711, -0.8798152, -3.692569, 0, 1, 0.2980392, 1,
-0.2543815, -0.1656133, -1.152282, 0, 1, 0.3058824, 1,
-0.254127, 1.473651, -0.3973799, 0, 1, 0.3098039, 1,
-0.254036, -0.4458669, -3.996721, 0, 1, 0.3176471, 1,
-0.2520623, 1.041231, -1.781224, 0, 1, 0.3215686, 1,
-0.2469991, -1.075319, -3.924983, 0, 1, 0.3294118, 1,
-0.2461177, 0.2407607, 2.713792, 0, 1, 0.3333333, 1,
-0.2439126, -0.9293678, -1.566296, 0, 1, 0.3411765, 1,
-0.242739, -0.8604993, -2.640667, 0, 1, 0.345098, 1,
-0.2423922, -1.364691, -3.127165, 0, 1, 0.3529412, 1,
-0.2395379, -0.7200686, -4.032242, 0, 1, 0.3568628, 1,
-0.2394272, -0.2523989, -1.291537, 0, 1, 0.3647059, 1,
-0.2368761, -0.4703935, -2.388237, 0, 1, 0.3686275, 1,
-0.2357953, -0.7012796, -2.623122, 0, 1, 0.3764706, 1,
-0.2350895, 1.092716, 0.185278, 0, 1, 0.3803922, 1,
-0.2317368, -0.07852778, -1.814627, 0, 1, 0.3882353, 1,
-0.2305248, -0.4275821, -1.270466, 0, 1, 0.3921569, 1,
-0.228651, -0.1889784, -1.760534, 0, 1, 0.4, 1,
-0.2276, -1.261435, -2.472156, 0, 1, 0.4078431, 1,
-0.2261277, 1.714951, 0.4848106, 0, 1, 0.4117647, 1,
-0.2241556, -0.5965614, -4.174438, 0, 1, 0.4196078, 1,
-0.2224579, -0.3582471, -2.163408, 0, 1, 0.4235294, 1,
-0.2172217, 0.07631399, -2.476341, 0, 1, 0.4313726, 1,
-0.2158279, -0.2788957, -2.981151, 0, 1, 0.4352941, 1,
-0.2104426, 0.33268, -0.1423362, 0, 1, 0.4431373, 1,
-0.2095658, -1.623484, -2.64084, 0, 1, 0.4470588, 1,
-0.2091265, 0.1925285, -0.9088807, 0, 1, 0.454902, 1,
-0.2090174, 0.5632584, -0.3706954, 0, 1, 0.4588235, 1,
-0.2058477, -1.157831, -1.351821, 0, 1, 0.4666667, 1,
-0.2033412, 1.265148, -0.241785, 0, 1, 0.4705882, 1,
-0.1988052, -0.6490825, -4.187453, 0, 1, 0.4784314, 1,
-0.1893635, -1.372125, -2.557385, 0, 1, 0.4823529, 1,
-0.1891703, 0.06944671, -2.336935, 0, 1, 0.4901961, 1,
-0.1823465, 0.1833563, 0.226016, 0, 1, 0.4941176, 1,
-0.1764784, 0.5500318, -1.667892, 0, 1, 0.5019608, 1,
-0.1747881, 0.9599708, -0.7862423, 0, 1, 0.509804, 1,
-0.1678285, -0.8663735, -2.645906, 0, 1, 0.5137255, 1,
-0.1634772, 0.008897848, -2.505857, 0, 1, 0.5215687, 1,
-0.1629944, 0.7821599, -0.6072283, 0, 1, 0.5254902, 1,
-0.1627471, -0.166425, -3.79327, 0, 1, 0.5333334, 1,
-0.160642, -0.05478727, -1.423804, 0, 1, 0.5372549, 1,
-0.1572409, -0.07973874, -1.724869, 0, 1, 0.5450981, 1,
-0.152992, 0.05024223, -1.009163, 0, 1, 0.5490196, 1,
-0.1471118, 0.8415277, -0.1377414, 0, 1, 0.5568628, 1,
-0.1452367, -0.1830833, -2.41718, 0, 1, 0.5607843, 1,
-0.1416627, -0.420099, -2.962934, 0, 1, 0.5686275, 1,
-0.1346344, -0.744067, -3.231843, 0, 1, 0.572549, 1,
-0.1327804, -0.03138054, 0.1694338, 0, 1, 0.5803922, 1,
-0.1323133, -1.042309, -2.519418, 0, 1, 0.5843138, 1,
-0.1309833, -1.086952, -2.237404, 0, 1, 0.5921569, 1,
-0.1251414, 0.4436761, -0.5320688, 0, 1, 0.5960785, 1,
-0.1243175, 0.303645, -0.8159499, 0, 1, 0.6039216, 1,
-0.1243125, 0.3058688, -1.153026, 0, 1, 0.6117647, 1,
-0.1223342, -0.393951, -3.857856, 0, 1, 0.6156863, 1,
-0.1194718, 1.472837, -0.947006, 0, 1, 0.6235294, 1,
-0.114986, 0.9029034, 0.5376292, 0, 1, 0.627451, 1,
-0.1149408, -2.008553, -2.113236, 0, 1, 0.6352941, 1,
-0.1140823, 0.6535618, 1.023675, 0, 1, 0.6392157, 1,
-0.1140247, -0.4219875, -1.754753, 0, 1, 0.6470588, 1,
-0.1036038, 0.3458841, -0.6010736, 0, 1, 0.6509804, 1,
-0.1012148, 1.763768, 0.4858543, 0, 1, 0.6588235, 1,
-0.1009749, -0.06835128, -2.094316, 0, 1, 0.6627451, 1,
-0.1006648, -2.513691, -2.829904, 0, 1, 0.6705883, 1,
-0.09423606, 1.506313, -0.2061159, 0, 1, 0.6745098, 1,
-0.08880014, 0.6329747, -2.391114, 0, 1, 0.682353, 1,
-0.08877241, 0.8630267, -0.3091512, 0, 1, 0.6862745, 1,
-0.08827461, -1.446144, -4.507524, 0, 1, 0.6941177, 1,
-0.08688106, -1.714092, -3.388756, 0, 1, 0.7019608, 1,
-0.08636647, -1.951068, -3.018485, 0, 1, 0.7058824, 1,
-0.08567942, -0.7079543, -2.981663, 0, 1, 0.7137255, 1,
-0.08535089, -1.175331, -2.88229, 0, 1, 0.7176471, 1,
-0.08268179, 0.9712846, 0.9551724, 0, 1, 0.7254902, 1,
-0.08148126, 0.05085545, -0.295463, 0, 1, 0.7294118, 1,
-0.08074234, 0.6497808, 0.1497406, 0, 1, 0.7372549, 1,
-0.08016418, -2.074394, -2.974849, 0, 1, 0.7411765, 1,
-0.07403529, 1.065585, -1.172983, 0, 1, 0.7490196, 1,
-0.07293506, -0.01736782, -2.825748, 0, 1, 0.7529412, 1,
-0.07254264, 0.2652734, -0.3961546, 0, 1, 0.7607843, 1,
-0.07189804, 0.3743896, -0.6053763, 0, 1, 0.7647059, 1,
-0.07069363, 0.6528782, 2.114905, 0, 1, 0.772549, 1,
-0.06980544, 0.1005731, -1.395895, 0, 1, 0.7764706, 1,
-0.06802182, -0.04549414, -0.6981393, 0, 1, 0.7843137, 1,
-0.0600753, -1.83061, -2.658767, 0, 1, 0.7882353, 1,
-0.05794734, -0.9543648, -3.262769, 0, 1, 0.7960784, 1,
-0.05475974, -0.2010824, -3.387894, 0, 1, 0.8039216, 1,
-0.051345, -0.3180846, -2.590754, 0, 1, 0.8078431, 1,
-0.05054459, -0.5257428, -2.050447, 0, 1, 0.8156863, 1,
-0.05000407, -1.605456, -3.741762, 0, 1, 0.8196079, 1,
-0.04635897, 1.467219, -0.6388066, 0, 1, 0.827451, 1,
-0.04255842, 0.4058313, -0.9651408, 0, 1, 0.8313726, 1,
-0.04172616, -0.206351, -1.087271, 0, 1, 0.8392157, 1,
-0.04151124, -0.4148897, -5.071069, 0, 1, 0.8431373, 1,
-0.03925974, 0.2778415, 0.06564659, 0, 1, 0.8509804, 1,
-0.03358217, 1.01066, 0.6260827, 0, 1, 0.854902, 1,
-0.03064725, 0.164598, 1.872014, 0, 1, 0.8627451, 1,
-0.02922956, -0.08360499, -0.6268955, 0, 1, 0.8666667, 1,
-0.02906721, -0.5656021, -2.049588, 0, 1, 0.8745098, 1,
-0.02621618, 0.9281093, 0.4626173, 0, 1, 0.8784314, 1,
-0.02419762, 0.1760663, -0.8066869, 0, 1, 0.8862745, 1,
-0.02379646, -0.316599, -1.696054, 0, 1, 0.8901961, 1,
-0.02316992, 0.4983292, 0.3712594, 0, 1, 0.8980392, 1,
-0.0214386, 0.3060544, 0.2940165, 0, 1, 0.9058824, 1,
-0.01369654, -2.650395, -2.481953, 0, 1, 0.9098039, 1,
-0.01186096, 1.417846, 1.383001, 0, 1, 0.9176471, 1,
-0.004376162, 0.9137529, -0.8623565, 0, 1, 0.9215686, 1,
0.003246217, 0.9332589, 0.8039061, 0, 1, 0.9294118, 1,
0.003464468, 0.2561656, 0.1793559, 0, 1, 0.9333333, 1,
0.003936811, 0.792187, 0.953959, 0, 1, 0.9411765, 1,
0.006429535, -1.107781, 2.105202, 0, 1, 0.945098, 1,
0.007638173, 0.6757053, -0.2470602, 0, 1, 0.9529412, 1,
0.008635929, 1.2341, -1.626206, 0, 1, 0.9568627, 1,
0.01396837, -0.5531163, 2.483688, 0, 1, 0.9647059, 1,
0.02429582, 1.334471, 0.6526327, 0, 1, 0.9686275, 1,
0.03171895, 2.572228, -0.02029902, 0, 1, 0.9764706, 1,
0.03184719, -0.3472496, 1.856203, 0, 1, 0.9803922, 1,
0.03809797, -1.620742, 2.60346, 0, 1, 0.9882353, 1,
0.04215439, -0.435406, 4.846534, 0, 1, 0.9921569, 1,
0.04604781, 0.1682276, -0.4235885, 0, 1, 1, 1,
0.0470613, -1.555676, 1.787213, 0, 0.9921569, 1, 1,
0.04788944, 2.209083, 1.033656, 0, 0.9882353, 1, 1,
0.04874971, 1.67189, 1.214387, 0, 0.9803922, 1, 1,
0.05981752, -0.03437844, 0.9406142, 0, 0.9764706, 1, 1,
0.06035285, -0.9947668, 2.310827, 0, 0.9686275, 1, 1,
0.06101593, -0.8081926, 3.271936, 0, 0.9647059, 1, 1,
0.06488288, 1.723742, -0.7441645, 0, 0.9568627, 1, 1,
0.0680861, -0.5623208, 0.2823515, 0, 0.9529412, 1, 1,
0.07036176, -0.1240134, 3.74843, 0, 0.945098, 1, 1,
0.07225797, 0.8976318, -0.8767753, 0, 0.9411765, 1, 1,
0.07392734, -1.55184, 1.633827, 0, 0.9333333, 1, 1,
0.07515846, 1.347355, 1.158531, 0, 0.9294118, 1, 1,
0.07783733, -0.6884285, 1.491153, 0, 0.9215686, 1, 1,
0.07880703, -0.6739885, 3.263052, 0, 0.9176471, 1, 1,
0.08385655, -1.258236, 2.129901, 0, 0.9098039, 1, 1,
0.08444577, -0.20548, 2.731487, 0, 0.9058824, 1, 1,
0.08559103, -1.352311, 3.489285, 0, 0.8980392, 1, 1,
0.0889136, 0.02953523, 1.408684, 0, 0.8901961, 1, 1,
0.09461763, 0.220837, -0.09428298, 0, 0.8862745, 1, 1,
0.0964529, -1.395577, 2.507021, 0, 0.8784314, 1, 1,
0.1033959, -1.310017, 3.397545, 0, 0.8745098, 1, 1,
0.1073883, 0.389345, -0.4298983, 0, 0.8666667, 1, 1,
0.1094878, -0.2442109, 2.299392, 0, 0.8627451, 1, 1,
0.1095517, -0.9483017, 4.933779, 0, 0.854902, 1, 1,
0.1153702, -0.1936955, 2.326583, 0, 0.8509804, 1, 1,
0.1156477, 1.049269, 1.065897, 0, 0.8431373, 1, 1,
0.1159077, -0.8658086, 3.406104, 0, 0.8392157, 1, 1,
0.1183336, -0.7489661, 2.957926, 0, 0.8313726, 1, 1,
0.1184795, -0.9968654, 2.778681, 0, 0.827451, 1, 1,
0.1243508, 0.5125541, 0.1641827, 0, 0.8196079, 1, 1,
0.1261605, -1.870351, 3.921303, 0, 0.8156863, 1, 1,
0.1276422, -0.655017, 1.92986, 0, 0.8078431, 1, 1,
0.1300942, -0.2932453, 0.7205887, 0, 0.8039216, 1, 1,
0.1308587, 1.144932, 0.425833, 0, 0.7960784, 1, 1,
0.1315592, 0.6088407, 0.4282626, 0, 0.7882353, 1, 1,
0.1351775, -1.089834, 2.399714, 0, 0.7843137, 1, 1,
0.1356942, -0.5418004, 2.724287, 0, 0.7764706, 1, 1,
0.1358518, 1.144761, -0.4738655, 0, 0.772549, 1, 1,
0.1360258, 1.584583, 1.990583, 0, 0.7647059, 1, 1,
0.1374159, -0.6183603, 3.775072, 0, 0.7607843, 1, 1,
0.1396606, -0.616336, 3.906124, 0, 0.7529412, 1, 1,
0.1398658, 0.2884531, 0.5063046, 0, 0.7490196, 1, 1,
0.1417784, 0.4611149, 2.445357, 0, 0.7411765, 1, 1,
0.1467733, -0.7787033, 2.538151, 0, 0.7372549, 1, 1,
0.154984, -0.004664865, 2.370142, 0, 0.7294118, 1, 1,
0.1562659, 1.520133, -0.7390152, 0, 0.7254902, 1, 1,
0.1634292, -0.8391293, 2.579692, 0, 0.7176471, 1, 1,
0.1690604, -0.3028533, 2.574011, 0, 0.7137255, 1, 1,
0.1696795, 1.101273, 2.394742, 0, 0.7058824, 1, 1,
0.1714972, 0.8941879, -0.250736, 0, 0.6980392, 1, 1,
0.1718486, 1.541556, -0.2851748, 0, 0.6941177, 1, 1,
0.1724984, -0.8885409, 2.525836, 0, 0.6862745, 1, 1,
0.172569, 0.2897409, -0.1293952, 0, 0.682353, 1, 1,
0.17691, 0.5057139, -1.406983, 0, 0.6745098, 1, 1,
0.1783188, -0.6637741, 2.433661, 0, 0.6705883, 1, 1,
0.1818152, 0.01011009, 1.229658, 0, 0.6627451, 1, 1,
0.1836788, 1.075724, 0.7858876, 0, 0.6588235, 1, 1,
0.1839388, 1.111747, -0.5546265, 0, 0.6509804, 1, 1,
0.1860565, 0.09803476, 2.420104, 0, 0.6470588, 1, 1,
0.1897468, -1.419542, 2.960712, 0, 0.6392157, 1, 1,
0.1899316, 0.1905639, 2.288665, 0, 0.6352941, 1, 1,
0.1905987, 0.9733146, -0.1013965, 0, 0.627451, 1, 1,
0.1925472, 0.9133075, -1.374515, 0, 0.6235294, 1, 1,
0.1935268, 0.636329, 0.42108, 0, 0.6156863, 1, 1,
0.195436, -0.3081153, 2.614565, 0, 0.6117647, 1, 1,
0.1986128, 0.7776731, 0.002581347, 0, 0.6039216, 1, 1,
0.2033798, 0.1571298, 3.140646, 0, 0.5960785, 1, 1,
0.2045294, 1.31807, 0.9020647, 0, 0.5921569, 1, 1,
0.2067083, -2.295496, 1.051812, 0, 0.5843138, 1, 1,
0.2124474, 0.6524318, -0.4225446, 0, 0.5803922, 1, 1,
0.215253, 0.7821268, 1.83683, 0, 0.572549, 1, 1,
0.2158731, 0.6011441, -2.050328, 0, 0.5686275, 1, 1,
0.2162535, -0.6612656, 0.9152777, 0, 0.5607843, 1, 1,
0.2165916, 0.4469977, -0.304597, 0, 0.5568628, 1, 1,
0.2206851, -1.571013, 2.663114, 0, 0.5490196, 1, 1,
0.2227087, -2.041336, 4.007051, 0, 0.5450981, 1, 1,
0.23327, -1.084855, 3.283795, 0, 0.5372549, 1, 1,
0.2378454, 1.070368, -0.4788178, 0, 0.5333334, 1, 1,
0.2382478, -0.8357541, 1.310736, 0, 0.5254902, 1, 1,
0.2397182, -0.05282699, 3.495488, 0, 0.5215687, 1, 1,
0.240729, 3.192323, -0.232942, 0, 0.5137255, 1, 1,
0.2421143, 0.2293858, -0.171552, 0, 0.509804, 1, 1,
0.2455485, 0.08114506, 0.8414378, 0, 0.5019608, 1, 1,
0.249778, 0.4404889, 1.174538, 0, 0.4941176, 1, 1,
0.2552531, 0.6449161, 0.9990296, 0, 0.4901961, 1, 1,
0.2569628, -0.1335647, 3.309848, 0, 0.4823529, 1, 1,
0.2575829, -1.084404, 2.767022, 0, 0.4784314, 1, 1,
0.267729, -0.2908992, 3.165832, 0, 0.4705882, 1, 1,
0.27295, 0.4674149, 0.9211494, 0, 0.4666667, 1, 1,
0.2750835, 0.8586956, -1.218926, 0, 0.4588235, 1, 1,
0.2761219, 0.2923037, 0.9287809, 0, 0.454902, 1, 1,
0.2810361, -0.996219, 3.085241, 0, 0.4470588, 1, 1,
0.2838674, 0.858789, 1.330399, 0, 0.4431373, 1, 1,
0.2896965, 1.039118, 0.3272022, 0, 0.4352941, 1, 1,
0.2914281, 0.1294251, 1.24963, 0, 0.4313726, 1, 1,
0.2933484, -2.208487, 1.780712, 0, 0.4235294, 1, 1,
0.2953422, -1.056322, 2.423346, 0, 0.4196078, 1, 1,
0.2978846, 0.9045756, 0.7026646, 0, 0.4117647, 1, 1,
0.2989958, -1.164769, 4.80475, 0, 0.4078431, 1, 1,
0.3029487, 0.1925172, -0.2700572, 0, 0.4, 1, 1,
0.3037152, 1.236301, -2.018294, 0, 0.3921569, 1, 1,
0.3093775, -0.9189107, 3.899724, 0, 0.3882353, 1, 1,
0.3095408, -0.8483736, 2.486069, 0, 0.3803922, 1, 1,
0.3104768, 0.02403574, 1.29886, 0, 0.3764706, 1, 1,
0.3131286, -0.3376915, 2.852673, 0, 0.3686275, 1, 1,
0.3201856, 1.107897, -0.5906262, 0, 0.3647059, 1, 1,
0.3208449, -0.647597, 2.046577, 0, 0.3568628, 1, 1,
0.3214867, -0.4058297, 2.117779, 0, 0.3529412, 1, 1,
0.3258805, 1.847409, 1.189102, 0, 0.345098, 1, 1,
0.3271606, 0.8221653, 0.4150664, 0, 0.3411765, 1, 1,
0.3276892, 1.070078, -0.4550156, 0, 0.3333333, 1, 1,
0.3278786, -0.415423, 1.634596, 0, 0.3294118, 1, 1,
0.3280558, -0.5811244, 2.36401, 0, 0.3215686, 1, 1,
0.3289864, 0.4072504, 1.497882, 0, 0.3176471, 1, 1,
0.3327349, -0.8641983, 2.972421, 0, 0.3098039, 1, 1,
0.3336164, 0.8348483, -1.586921, 0, 0.3058824, 1, 1,
0.3340445, 2.324448, 0.5647025, 0, 0.2980392, 1, 1,
0.3352146, -0.07881808, 1.803553, 0, 0.2901961, 1, 1,
0.3380782, 2.017044, -0.1165528, 0, 0.2862745, 1, 1,
0.3435161, 1.163213, 0.5256901, 0, 0.2784314, 1, 1,
0.3466565, -0.6877515, 3.586915, 0, 0.2745098, 1, 1,
0.3473112, -0.7571443, 2.547563, 0, 0.2666667, 1, 1,
0.3484697, 0.4342128, 0.7617733, 0, 0.2627451, 1, 1,
0.3512796, 0.9404948, 0.6832265, 0, 0.254902, 1, 1,
0.3520667, -0.3356844, 1.833361, 0, 0.2509804, 1, 1,
0.3570373, -1.23297, 3.622424, 0, 0.2431373, 1, 1,
0.3574218, 2.23445, 0.2368996, 0, 0.2392157, 1, 1,
0.358054, 1.538676, 0.2999607, 0, 0.2313726, 1, 1,
0.3585828, 0.7124244, -1.142097, 0, 0.227451, 1, 1,
0.3655959, 1.627031, -2.228747, 0, 0.2196078, 1, 1,
0.3680814, 0.9092838, -0.3752189, 0, 0.2156863, 1, 1,
0.3695398, -0.6768611, 2.010023, 0, 0.2078431, 1, 1,
0.3706525, -1.313834, 2.923114, 0, 0.2039216, 1, 1,
0.3711182, 0.6372281, 0.361632, 0, 0.1960784, 1, 1,
0.3730808, -0.4291414, 3.296396, 0, 0.1882353, 1, 1,
0.3735384, 1.153097, 0.7443294, 0, 0.1843137, 1, 1,
0.3753102, 0.6731896, -1.190565, 0, 0.1764706, 1, 1,
0.3761782, -0.5187695, 2.763872, 0, 0.172549, 1, 1,
0.3766473, 1.19708, 0.591557, 0, 0.1647059, 1, 1,
0.3787814, -0.6395648, 2.549009, 0, 0.1607843, 1, 1,
0.3969439, 1.133009, 1.387078, 0, 0.1529412, 1, 1,
0.3998793, -1.419603, 1.850855, 0, 0.1490196, 1, 1,
0.4017311, 1.727444, -0.008946876, 0, 0.1411765, 1, 1,
0.4088858, -0.8540446, 2.525635, 0, 0.1372549, 1, 1,
0.4135745, -1.011346, 3.500501, 0, 0.1294118, 1, 1,
0.4154597, 0.7827776, 0.1242136, 0, 0.1254902, 1, 1,
0.4172152, -0.8704959, 2.727364, 0, 0.1176471, 1, 1,
0.4176017, -2.028071, 2.742613, 0, 0.1137255, 1, 1,
0.4205, -0.5681908, 3.007922, 0, 0.1058824, 1, 1,
0.4206009, -0.4561158, 1.389863, 0, 0.09803922, 1, 1,
0.4271728, 1.196916, 0.7054827, 0, 0.09411765, 1, 1,
0.427399, -0.7885724, 2.646569, 0, 0.08627451, 1, 1,
0.4279854, 1.071873, 2.250604, 0, 0.08235294, 1, 1,
0.4349634, -1.997311, 2.628554, 0, 0.07450981, 1, 1,
0.436216, -0.7388161, 3.33538, 0, 0.07058824, 1, 1,
0.4372864, 0.3406706, 1.597126, 0, 0.0627451, 1, 1,
0.4387922, 0.730885, 1.564613, 0, 0.05882353, 1, 1,
0.4389707, -0.3154438, 0.01852703, 0, 0.05098039, 1, 1,
0.4528737, -0.3317262, 1.853292, 0, 0.04705882, 1, 1,
0.4558834, -0.09236901, 1.995151, 0, 0.03921569, 1, 1,
0.4612929, 0.9943499, 0.3182981, 0, 0.03529412, 1, 1,
0.4725074, 0.7827617, 3.105597, 0, 0.02745098, 1, 1,
0.4805187, -0.1135184, 3.108987, 0, 0.02352941, 1, 1,
0.4824441, -0.4405197, 2.320075, 0, 0.01568628, 1, 1,
0.4841137, 0.6029941, -0.4883684, 0, 0.01176471, 1, 1,
0.485508, -0.7070643, 2.053578, 0, 0.003921569, 1, 1,
0.4866657, -1.814838, 4.452995, 0.003921569, 0, 1, 1,
0.488584, 0.9234821, -0.6356902, 0.007843138, 0, 1, 1,
0.4904291, 0.6971066, 0.03128668, 0.01568628, 0, 1, 1,
0.4992155, 0.2772356, 1.289178, 0.01960784, 0, 1, 1,
0.5070766, -0.1066824, 1.135555, 0.02745098, 0, 1, 1,
0.5142034, 0.9370506, 0.4876189, 0.03137255, 0, 1, 1,
0.5146081, 0.9577332, 2.080177, 0.03921569, 0, 1, 1,
0.5153723, -0.09871791, -0.1948429, 0.04313726, 0, 1, 1,
0.5197638, 0.4003167, 1.080678, 0.05098039, 0, 1, 1,
0.5291191, -0.01834584, 0.4170203, 0.05490196, 0, 1, 1,
0.5310531, 2.518381, 0.2207898, 0.0627451, 0, 1, 1,
0.5357361, -1.443063, 2.302898, 0.06666667, 0, 1, 1,
0.538679, -1.495037, 0.8668101, 0.07450981, 0, 1, 1,
0.5419812, -0.2745736, 3.668618, 0.07843138, 0, 1, 1,
0.5498981, 0.443905, 0.4760513, 0.08627451, 0, 1, 1,
0.5515049, 0.235628, -1.991213, 0.09019608, 0, 1, 1,
0.5540379, 0.6075412, 0.7936397, 0.09803922, 0, 1, 1,
0.5596547, 1.44209, 1.387327, 0.1058824, 0, 1, 1,
0.5613211, -0.5946527, 3.20807, 0.1098039, 0, 1, 1,
0.5639163, 1.678843, 1.182531, 0.1176471, 0, 1, 1,
0.5641479, 0.3615657, -0.1610451, 0.1215686, 0, 1, 1,
0.5650985, 0.0328493, 2.224758, 0.1294118, 0, 1, 1,
0.5658695, 0.7171749, 1.218109, 0.1333333, 0, 1, 1,
0.5661126, 0.1164279, 2.38318, 0.1411765, 0, 1, 1,
0.5674275, -1.453791, 1.790609, 0.145098, 0, 1, 1,
0.5695844, 1.729154, -0.320306, 0.1529412, 0, 1, 1,
0.5710305, -1.361837, 2.068655, 0.1568628, 0, 1, 1,
0.5727128, 0.6363623, 1.02646, 0.1647059, 0, 1, 1,
0.5787896, -0.2178765, 2.842684, 0.1686275, 0, 1, 1,
0.5822358, -1.481471, 3.276957, 0.1764706, 0, 1, 1,
0.5871812, -0.06029669, 1.957292, 0.1803922, 0, 1, 1,
0.5911081, 0.1820385, 2.491297, 0.1882353, 0, 1, 1,
0.5930965, 0.661319, 1.253749, 0.1921569, 0, 1, 1,
0.5954673, -1.14571, 2.406276, 0.2, 0, 1, 1,
0.5966966, -0.8644593, 3.25682, 0.2078431, 0, 1, 1,
0.5971221, -0.5294864, 2.142812, 0.2117647, 0, 1, 1,
0.6004528, -0.1294955, 1.533805, 0.2196078, 0, 1, 1,
0.612389, -1.28232, 3.108244, 0.2235294, 0, 1, 1,
0.6158241, -0.1245676, 1.238793, 0.2313726, 0, 1, 1,
0.6164219, 0.7195252, -0.3152721, 0.2352941, 0, 1, 1,
0.6174728, 2.153202, -0.7476495, 0.2431373, 0, 1, 1,
0.6189229, -0.9072879, 5.092951, 0.2470588, 0, 1, 1,
0.6197736, 0.4016284, 1.432563, 0.254902, 0, 1, 1,
0.620176, 0.6996923, 1.268871, 0.2588235, 0, 1, 1,
0.6211461, -0.9287501, 2.700988, 0.2666667, 0, 1, 1,
0.6215675, 1.756935, 1.591856, 0.2705882, 0, 1, 1,
0.6238391, -0.4148394, 1.665737, 0.2784314, 0, 1, 1,
0.6238874, -1.670818, 3.753873, 0.282353, 0, 1, 1,
0.6246331, 0.02340339, 1.366234, 0.2901961, 0, 1, 1,
0.6266769, 0.4936039, 0.875291, 0.2941177, 0, 1, 1,
0.6280513, 1.050523, 0.6112246, 0.3019608, 0, 1, 1,
0.6323946, -0.2898608, 2.117768, 0.3098039, 0, 1, 1,
0.6342526, 0.3212221, -0.3353168, 0.3137255, 0, 1, 1,
0.6414955, 1.584964, -1.390102, 0.3215686, 0, 1, 1,
0.6449544, -0.2367991, 2.094077, 0.3254902, 0, 1, 1,
0.6449866, -0.201657, 3.029535, 0.3333333, 0, 1, 1,
0.6450363, -0.09521121, 1.906686, 0.3372549, 0, 1, 1,
0.6518877, -0.3040563, 3.379935, 0.345098, 0, 1, 1,
0.6539209, 1.754688, -0.3673157, 0.3490196, 0, 1, 1,
0.6631212, 0.728606, -0.7116481, 0.3568628, 0, 1, 1,
0.6683144, 0.1193624, 1.22944, 0.3607843, 0, 1, 1,
0.6710378, -0.4764284, 2.726767, 0.3686275, 0, 1, 1,
0.6737462, 1.133436, 0.488175, 0.372549, 0, 1, 1,
0.67407, -0.2878137, 0.4323691, 0.3803922, 0, 1, 1,
0.6759717, 2.260592, 0.2495185, 0.3843137, 0, 1, 1,
0.67672, 0.1457588, -1.086956, 0.3921569, 0, 1, 1,
0.677568, -0.9534123, 0.054291, 0.3960784, 0, 1, 1,
0.6796783, 0.2887447, 1.076635, 0.4039216, 0, 1, 1,
0.6819981, -0.5482605, 3.736502, 0.4117647, 0, 1, 1,
0.6879438, -2.634869, 3.135291, 0.4156863, 0, 1, 1,
0.688652, -0.8154811, 2.790238, 0.4235294, 0, 1, 1,
0.6913162, 1.152883, 1.953434, 0.427451, 0, 1, 1,
0.694487, 0.4923864, 0.9532321, 0.4352941, 0, 1, 1,
0.6951894, -0.3285176, 1.69904, 0.4392157, 0, 1, 1,
0.6972383, 0.809019, -1.380571, 0.4470588, 0, 1, 1,
0.6995335, -0.1867738, 1.894544, 0.4509804, 0, 1, 1,
0.7006739, -0.5878513, 3.682459, 0.4588235, 0, 1, 1,
0.7050906, 2.276421, 0.2468267, 0.4627451, 0, 1, 1,
0.7059292, -0.3269676, 3.711609, 0.4705882, 0, 1, 1,
0.7245066, -1.347037, 3.746719, 0.4745098, 0, 1, 1,
0.7269445, 0.1468115, 1.155642, 0.4823529, 0, 1, 1,
0.7270585, -1.358511, 0.5295831, 0.4862745, 0, 1, 1,
0.7279046, 0.3211994, 0.4305152, 0.4941176, 0, 1, 1,
0.7308838, -1.104579, 1.300235, 0.5019608, 0, 1, 1,
0.733003, -0.9520487, 2.407092, 0.5058824, 0, 1, 1,
0.7376072, 0.09127733, 1.582708, 0.5137255, 0, 1, 1,
0.7405308, -1.762508, 4.071116, 0.5176471, 0, 1, 1,
0.7413434, 1.786861, -0.06150102, 0.5254902, 0, 1, 1,
0.7438871, 0.4826902, 1.862867, 0.5294118, 0, 1, 1,
0.746028, 0.4735151, 1.938124, 0.5372549, 0, 1, 1,
0.7482426, 0.9411261, 1.753422, 0.5411765, 0, 1, 1,
0.7485762, 0.1056812, 1.851705, 0.5490196, 0, 1, 1,
0.7520959, 0.4094728, 1.249127, 0.5529412, 0, 1, 1,
0.7534453, 1.704255, 0.6516954, 0.5607843, 0, 1, 1,
0.7622384, -1.394106, 2.421314, 0.5647059, 0, 1, 1,
0.7663274, 0.5775144, 0.4998037, 0.572549, 0, 1, 1,
0.7673873, -0.08673317, 2.045585, 0.5764706, 0, 1, 1,
0.7690632, 0.7754254, 1.006833, 0.5843138, 0, 1, 1,
0.7698056, 2.712903, -0.04411897, 0.5882353, 0, 1, 1,
0.7715788, -0.9828045, 2.510502, 0.5960785, 0, 1, 1,
0.7779083, -2.050504, 4.84947, 0.6039216, 0, 1, 1,
0.7802791, -0.7518457, 2.391893, 0.6078432, 0, 1, 1,
0.7824993, 0.5480313, 0.3396829, 0.6156863, 0, 1, 1,
0.7828133, -0.3238035, 1.503082, 0.6196079, 0, 1, 1,
0.7936391, 0.1132739, 1.981026, 0.627451, 0, 1, 1,
0.7947231, -0.5964342, 1.407794, 0.6313726, 0, 1, 1,
0.7962301, -0.9542436, 1.894867, 0.6392157, 0, 1, 1,
0.7982478, 1.599967, 0.1114969, 0.6431373, 0, 1, 1,
0.798909, 1.611784, 1.85627, 0.6509804, 0, 1, 1,
0.799138, -1.275092, 1.226234, 0.654902, 0, 1, 1,
0.7997402, -0.1668217, 0.5444635, 0.6627451, 0, 1, 1,
0.8042845, 1.031961, 2.113455, 0.6666667, 0, 1, 1,
0.806047, 1.532514, 0.5933256, 0.6745098, 0, 1, 1,
0.8102963, -0.6710082, 2.575166, 0.6784314, 0, 1, 1,
0.8115256, -0.09583931, 1.06991, 0.6862745, 0, 1, 1,
0.8124801, 1.104974, 2.232826, 0.6901961, 0, 1, 1,
0.8200305, 1.502582, 0.6401526, 0.6980392, 0, 1, 1,
0.8222508, 1.475911, 0.9394547, 0.7058824, 0, 1, 1,
0.8230675, -0.3970301, 3.015552, 0.7098039, 0, 1, 1,
0.8296621, 1.795299, 0.07439662, 0.7176471, 0, 1, 1,
0.8299596, 1.183362, 0.1402367, 0.7215686, 0, 1, 1,
0.8327433, -0.7337646, 3.598592, 0.7294118, 0, 1, 1,
0.8354221, 0.3609762, 1.745755, 0.7333333, 0, 1, 1,
0.8366464, 0.3995978, 1.02355, 0.7411765, 0, 1, 1,
0.8380071, -1.126406, 0.586794, 0.7450981, 0, 1, 1,
0.8467721, 0.1113052, 0.07086477, 0.7529412, 0, 1, 1,
0.8479382, -2.167198, 3.047786, 0.7568628, 0, 1, 1,
0.8501677, 0.005858175, 1.951923, 0.7647059, 0, 1, 1,
0.8535683, -0.4526472, 1.145027, 0.7686275, 0, 1, 1,
0.855536, -0.6408008, 1.129107, 0.7764706, 0, 1, 1,
0.8580238, 0.1279883, 1.521194, 0.7803922, 0, 1, 1,
0.8616006, -0.2319159, 1.337877, 0.7882353, 0, 1, 1,
0.8642486, -1.118634, 2.439968, 0.7921569, 0, 1, 1,
0.8701229, 0.08685557, -0.8639239, 0.8, 0, 1, 1,
0.8732316, 0.5928972, 0.6053962, 0.8078431, 0, 1, 1,
0.8765574, 0.04130732, 2.567223, 0.8117647, 0, 1, 1,
0.879001, 2.764333, 0.4708499, 0.8196079, 0, 1, 1,
0.8791817, 0.5195879, -1.38655, 0.8235294, 0, 1, 1,
0.8828175, 1.282738, 1.177601, 0.8313726, 0, 1, 1,
0.884503, 1.173968, 0.4261599, 0.8352941, 0, 1, 1,
0.8859925, 1.705937, 0.3123755, 0.8431373, 0, 1, 1,
0.8900664, -0.6770489, 2.645363, 0.8470588, 0, 1, 1,
0.8904849, -0.09670565, 2.092489, 0.854902, 0, 1, 1,
0.8912656, 0.1819178, -0.06934719, 0.8588235, 0, 1, 1,
0.8922102, -0.345805, 2.163643, 0.8666667, 0, 1, 1,
0.896542, -0.6648934, 2.675256, 0.8705882, 0, 1, 1,
0.9025903, -0.4546137, -0.346577, 0.8784314, 0, 1, 1,
0.9030523, -1.333333, 0.2114113, 0.8823529, 0, 1, 1,
0.9032958, 0.1676399, 1.064434, 0.8901961, 0, 1, 1,
0.9060723, 0.5969248, 2.017664, 0.8941177, 0, 1, 1,
0.9080579, 0.6437393, 0.1743014, 0.9019608, 0, 1, 1,
0.9105486, -0.7446499, 1.782978, 0.9098039, 0, 1, 1,
0.9109719, 1.479193, 2.117558, 0.9137255, 0, 1, 1,
0.9321985, 0.2087377, 1.970189, 0.9215686, 0, 1, 1,
0.9393122, -1.25132, 2.7686, 0.9254902, 0, 1, 1,
0.9489741, -2.075824, 4.626195, 0.9333333, 0, 1, 1,
0.9552178, 0.5213538, 0.6112457, 0.9372549, 0, 1, 1,
0.9561262, 1.775086, 0.2473943, 0.945098, 0, 1, 1,
0.9589355, -0.3970597, 1.034163, 0.9490196, 0, 1, 1,
0.9598013, 1.154769, 0.2199022, 0.9568627, 0, 1, 1,
0.9603993, 0.7742416, 1.981654, 0.9607843, 0, 1, 1,
0.9605165, -0.7558234, 2.563552, 0.9686275, 0, 1, 1,
0.9616402, -0.5340568, 1.514081, 0.972549, 0, 1, 1,
0.9664809, 0.1128618, 0.2815704, 0.9803922, 0, 1, 1,
0.9725012, 0.3750617, 1.771267, 0.9843137, 0, 1, 1,
0.9778987, -0.1644736, 0.3674518, 0.9921569, 0, 1, 1,
0.9832512, 2.352836, -0.2807403, 0.9960784, 0, 1, 1,
0.9855455, -0.1543932, 0.8811494, 1, 0, 0.9960784, 1,
0.9879955, 0.05419926, 3.694575, 1, 0, 0.9882353, 1,
0.9903799, 1.296743, 0.7719653, 1, 0, 0.9843137, 1,
0.9954112, 0.1854934, 3.627109, 1, 0, 0.9764706, 1,
1.013481, -1.216831, 2.583434, 1, 0, 0.972549, 1,
1.018873, -0.1604276, 3.18415, 1, 0, 0.9647059, 1,
1.019709, 1.348064, 0.03105628, 1, 0, 0.9607843, 1,
1.021197, 1.289296, 1.986225, 1, 0, 0.9529412, 1,
1.025965, 0.9015968, 1.33641, 1, 0, 0.9490196, 1,
1.030331, -0.04340892, 0.1501134, 1, 0, 0.9411765, 1,
1.034111, 0.01894675, 1.130326, 1, 0, 0.9372549, 1,
1.035918, 2.025587, 0.09226099, 1, 0, 0.9294118, 1,
1.035963, -1.144467, 1.779698, 1, 0, 0.9254902, 1,
1.038719, 0.284963, 2.565391, 1, 0, 0.9176471, 1,
1.040313, -0.05511575, 0.4467697, 1, 0, 0.9137255, 1,
1.042619, -0.5331855, 1.905678, 1, 0, 0.9058824, 1,
1.046358, 1.313206, -0.3794636, 1, 0, 0.9019608, 1,
1.056916, 1.932805, -0.1685154, 1, 0, 0.8941177, 1,
1.05919, -1.585123, 3.620372, 1, 0, 0.8862745, 1,
1.064478, -0.03148261, 2.489921, 1, 0, 0.8823529, 1,
1.066046, -0.8596954, 1.521704, 1, 0, 0.8745098, 1,
1.071705, 0.1979071, 3.072305, 1, 0, 0.8705882, 1,
1.089154, 1.027636, 0.2882438, 1, 0, 0.8627451, 1,
1.091033, 0.4491372, 0.3817738, 1, 0, 0.8588235, 1,
1.093385, 0.5696189, 1.814739, 1, 0, 0.8509804, 1,
1.094959, -0.1531225, 2.461365, 1, 0, 0.8470588, 1,
1.096006, 0.2914766, 1.239777, 1, 0, 0.8392157, 1,
1.098757, -0.4721899, 2.693782, 1, 0, 0.8352941, 1,
1.112705, -2.283925, 2.648012, 1, 0, 0.827451, 1,
1.118392, -1.345878, 1.680727, 1, 0, 0.8235294, 1,
1.123641, -2.023649, 1.296632, 1, 0, 0.8156863, 1,
1.124498, 0.1549703, 1.501353, 1, 0, 0.8117647, 1,
1.128244, 0.2909358, 0.7891693, 1, 0, 0.8039216, 1,
1.128271, -0.3458034, 0.3964205, 1, 0, 0.7960784, 1,
1.134188, 0.3598811, 1.523337, 1, 0, 0.7921569, 1,
1.1382, 0.0387006, 0.1993098, 1, 0, 0.7843137, 1,
1.140045, -0.1191013, 2.280616, 1, 0, 0.7803922, 1,
1.146879, -0.6040671, 2.989933, 1, 0, 0.772549, 1,
1.16731, -0.5672247, 0.9047084, 1, 0, 0.7686275, 1,
1.169714, -0.637789, 1.759555, 1, 0, 0.7607843, 1,
1.178094, 0.3417174, 1.454345, 1, 0, 0.7568628, 1,
1.180269, 0.3662983, 1.586898, 1, 0, 0.7490196, 1,
1.186629, -0.2313511, 1.69001, 1, 0, 0.7450981, 1,
1.204639, -0.4248269, -0.08539218, 1, 0, 0.7372549, 1,
1.205613, -0.1353302, 2.403919, 1, 0, 0.7333333, 1,
1.207389, -0.2719699, 0.4051901, 1, 0, 0.7254902, 1,
1.211577, -0.9428401, 0.9409672, 1, 0, 0.7215686, 1,
1.212686, 0.1508047, 1.652304, 1, 0, 0.7137255, 1,
1.216442, 2.024613, 0.1242068, 1, 0, 0.7098039, 1,
1.216896, -0.848811, 2.375839, 1, 0, 0.7019608, 1,
1.222962, -0.9698697, 1.854258, 1, 0, 0.6941177, 1,
1.234277, -0.1658266, 0.73406, 1, 0, 0.6901961, 1,
1.238851, -1.242641, 1.170454, 1, 0, 0.682353, 1,
1.249481, -1.378615, 3.286419, 1, 0, 0.6784314, 1,
1.264033, 0.02539044, 0.5973043, 1, 0, 0.6705883, 1,
1.264558, 1.553019, -0.684064, 1, 0, 0.6666667, 1,
1.2749, -0.2596932, 1.990728, 1, 0, 0.6588235, 1,
1.27603, -0.194256, 1.371812, 1, 0, 0.654902, 1,
1.28843, 2.003264, -0.3902595, 1, 0, 0.6470588, 1,
1.289674, 1.413289, 2.35128, 1, 0, 0.6431373, 1,
1.303586, 0.7346796, 0.4334416, 1, 0, 0.6352941, 1,
1.305008, -0.006560962, 2.167666, 1, 0, 0.6313726, 1,
1.306504, -0.3270954, 1.587895, 1, 0, 0.6235294, 1,
1.307825, 2.070124, 0.9932802, 1, 0, 0.6196079, 1,
1.309302, 0.6735495, 2.273558, 1, 0, 0.6117647, 1,
1.310219, -1.167682, 1.749017, 1, 0, 0.6078432, 1,
1.320662, -0.6118342, 1.645655, 1, 0, 0.6, 1,
1.324609, 1.348257, -0.137739, 1, 0, 0.5921569, 1,
1.354601, -1.429389, 2.550964, 1, 0, 0.5882353, 1,
1.359247, -0.2080571, 3.218942, 1, 0, 0.5803922, 1,
1.365442, 0.5811142, 1.351555, 1, 0, 0.5764706, 1,
1.365842, 0.0929599, 1.600638, 1, 0, 0.5686275, 1,
1.366969, -0.2282049, 2.058737, 1, 0, 0.5647059, 1,
1.369517, -0.53402, 1.094438, 1, 0, 0.5568628, 1,
1.369871, 0.4918371, 0.4977883, 1, 0, 0.5529412, 1,
1.374663, 0.4006284, 0.5062561, 1, 0, 0.5450981, 1,
1.376299, 0.2629932, 1.307087, 1, 0, 0.5411765, 1,
1.379137, -0.5708323, 2.348521, 1, 0, 0.5333334, 1,
1.385184, -0.2965534, 2.20439, 1, 0, 0.5294118, 1,
1.386643, 0.3572521, -0.2764403, 1, 0, 0.5215687, 1,
1.39545, -0.623928, 2.62298, 1, 0, 0.5176471, 1,
1.402408, -1.029478, 4.485677, 1, 0, 0.509804, 1,
1.408713, 2.178702, -0.2733234, 1, 0, 0.5058824, 1,
1.418044, 0.4241605, 0.03869582, 1, 0, 0.4980392, 1,
1.418883, 0.2385794, 0.6384667, 1, 0, 0.4901961, 1,
1.426119, -0.5087376, 2.053592, 1, 0, 0.4862745, 1,
1.431408, 0.4733413, 0.4810188, 1, 0, 0.4784314, 1,
1.436325, 0.08871008, 2.737813, 1, 0, 0.4745098, 1,
1.436967, -0.06802023, 1.914159, 1, 0, 0.4666667, 1,
1.442104, 0.09027576, 3.078699, 1, 0, 0.4627451, 1,
1.442749, 0.01451175, 3.321735, 1, 0, 0.454902, 1,
1.452097, -1.595649, 2.534218, 1, 0, 0.4509804, 1,
1.452579, -0.5929926, 3.790356, 1, 0, 0.4431373, 1,
1.458668, -0.4979277, 1.282575, 1, 0, 0.4392157, 1,
1.462212, -1.828831, 2.142867, 1, 0, 0.4313726, 1,
1.477797, -1.320768, 2.770249, 1, 0, 0.427451, 1,
1.49106, -0.6655502, 2.006957, 1, 0, 0.4196078, 1,
1.501546, 1.963264, 0.5706131, 1, 0, 0.4156863, 1,
1.514028, -0.6644896, 2.87082, 1, 0, 0.4078431, 1,
1.535441, -0.5397522, 1.388894, 1, 0, 0.4039216, 1,
1.539166, -0.0902629, 3.590465, 1, 0, 0.3960784, 1,
1.548457, -0.9229001, 2.799402, 1, 0, 0.3882353, 1,
1.549061, 1.710413, 0.3173016, 1, 0, 0.3843137, 1,
1.550434, -0.572672, 2.419359, 1, 0, 0.3764706, 1,
1.553587, -0.1993282, 3.261044, 1, 0, 0.372549, 1,
1.553788, 0.7751727, 1.473535, 1, 0, 0.3647059, 1,
1.564862, 1.347464, -0.4239836, 1, 0, 0.3607843, 1,
1.566983, -1.338489, 2.284381, 1, 0, 0.3529412, 1,
1.573644, -0.839589, 2.379174, 1, 0, 0.3490196, 1,
1.582555, -0.9167864, 3.4477, 1, 0, 0.3411765, 1,
1.591938, -1.24847, 3.340168, 1, 0, 0.3372549, 1,
1.601199, -0.7340721, 1.799207, 1, 0, 0.3294118, 1,
1.622667, 0.3878828, 1.903105, 1, 0, 0.3254902, 1,
1.636068, 1.249581, 0.6634706, 1, 0, 0.3176471, 1,
1.639441, -1.054182, 1.491797, 1, 0, 0.3137255, 1,
1.66745, -0.09696243, 0.6122067, 1, 0, 0.3058824, 1,
1.672123, -1.51867, 2.589098, 1, 0, 0.2980392, 1,
1.683781, 1.323771, -0.4414295, 1, 0, 0.2941177, 1,
1.688923, -0.3890269, 2.563545, 1, 0, 0.2862745, 1,
1.696812, 0.3035783, 3.441253, 1, 0, 0.282353, 1,
1.70524, -0.2252144, 2.759975, 1, 0, 0.2745098, 1,
1.711288, -0.04440195, 2.321913, 1, 0, 0.2705882, 1,
1.715812, 0.6496978, 0.8250392, 1, 0, 0.2627451, 1,
1.720908, -1.740919, 2.044143, 1, 0, 0.2588235, 1,
1.726738, -1.004292, 2.467285, 1, 0, 0.2509804, 1,
1.736452, -1.194881, 3.034801, 1, 0, 0.2470588, 1,
1.766317, 1.20619, -0.4604688, 1, 0, 0.2392157, 1,
1.776403, 1.143077, 0.09404024, 1, 0, 0.2352941, 1,
1.795725, 1.063551, 0.02180047, 1, 0, 0.227451, 1,
1.80373, 1.460885, 1.684268, 1, 0, 0.2235294, 1,
1.813492, 1.168351, 0.6172238, 1, 0, 0.2156863, 1,
1.833022, 0.6697756, -2.103936, 1, 0, 0.2117647, 1,
1.839858, 1.56851, 1.234009, 1, 0, 0.2039216, 1,
1.852405, 0.8423925, 2.42283, 1, 0, 0.1960784, 1,
1.853686, -1.674489, 2.867404, 1, 0, 0.1921569, 1,
1.875983, -0.8486993, 1.647696, 1, 0, 0.1843137, 1,
1.899395, 0.5791097, 2.555144, 1, 0, 0.1803922, 1,
1.907786, -1.284197, 1.599282, 1, 0, 0.172549, 1,
1.929247, -0.5509346, 2.070502, 1, 0, 0.1686275, 1,
1.932743, -0.3287037, 2.32498, 1, 0, 0.1607843, 1,
1.955752, -0.9708057, 2.782838, 1, 0, 0.1568628, 1,
2.001767, 0.2705755, 0.5744895, 1, 0, 0.1490196, 1,
2.023228, 0.9363684, 0.02813354, 1, 0, 0.145098, 1,
2.067739, 1.633341, 1.727612, 1, 0, 0.1372549, 1,
2.095784, -0.3924964, 1.629096, 1, 0, 0.1333333, 1,
2.101437, -0.005485766, 1.288268, 1, 0, 0.1254902, 1,
2.107531, 0.3924154, 1.089213, 1, 0, 0.1215686, 1,
2.123056, 0.3179126, 1.687519, 1, 0, 0.1137255, 1,
2.183592, -1.530619, 1.854889, 1, 0, 0.1098039, 1,
2.215102, -0.2262486, 4.488698, 1, 0, 0.1019608, 1,
2.240541, 1.41693, 1.353504, 1, 0, 0.09411765, 1,
2.269371, -0.3140179, 1.615186, 1, 0, 0.09019608, 1,
2.277959, -0.6807314, 0.6775948, 1, 0, 0.08235294, 1,
2.295059, -0.1533785, 0.7797667, 1, 0, 0.07843138, 1,
2.3057, 0.4238192, 1.297819, 1, 0, 0.07058824, 1,
2.315658, 0.5672342, -0.5192502, 1, 0, 0.06666667, 1,
2.34397, -0.1485554, 2.075123, 1, 0, 0.05882353, 1,
2.392978, -0.630833, 3.388217, 1, 0, 0.05490196, 1,
2.425668, 1.424556, 1.7308, 1, 0, 0.04705882, 1,
2.441621, 0.2906536, 0.3596401, 1, 0, 0.04313726, 1,
2.483933, 0.4049263, 1.447899, 1, 0, 0.03529412, 1,
2.500486, -0.3596, 2.440899, 1, 0, 0.03137255, 1,
2.549735, 0.1174698, 0.4171603, 1, 0, 0.02352941, 1,
2.584212, -1.200601, 2.174169, 1, 0, 0.01960784, 1,
2.589566, 0.05575894, 0.8511721, 1, 0, 0.01176471, 1,
3.029516, -0.1324652, 2.082912, 1, 0, 0.007843138, 1
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
-0.1764355, -3.715618, -6.79387, 0, -0.5, 0.5, 0.5,
-0.1764355, -3.715618, -6.79387, 1, -0.5, 0.5, 0.5,
-0.1764355, -3.715618, -6.79387, 1, 1.5, 0.5, 0.5,
-0.1764355, -3.715618, -6.79387, 0, 1.5, 0.5, 0.5
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
-4.469204, 0.2389492, -6.79387, 0, -0.5, 0.5, 0.5,
-4.469204, 0.2389492, -6.79387, 1, -0.5, 0.5, 0.5,
-4.469204, 0.2389492, -6.79387, 1, 1.5, 0.5, 0.5,
-4.469204, 0.2389492, -6.79387, 0, 1.5, 0.5, 0.5
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
-4.469204, -3.715618, 0.01094127, 0, -0.5, 0.5, 0.5,
-4.469204, -3.715618, 0.01094127, 1, -0.5, 0.5, 0.5,
-4.469204, -3.715618, 0.01094127, 1, 1.5, 0.5, 0.5,
-4.469204, -3.715618, 0.01094127, 0, 1.5, 0.5, 0.5
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
-3, -2.803026, -5.223529,
3, -2.803026, -5.223529,
-3, -2.803026, -5.223529,
-3, -2.955125, -5.485252,
-2, -2.803026, -5.223529,
-2, -2.955125, -5.485252,
-1, -2.803026, -5.223529,
-1, -2.955125, -5.485252,
0, -2.803026, -5.223529,
0, -2.955125, -5.485252,
1, -2.803026, -5.223529,
1, -2.955125, -5.485252,
2, -2.803026, -5.223529,
2, -2.955125, -5.485252,
3, -2.803026, -5.223529,
3, -2.955125, -5.485252
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
-3, -3.259322, -6.008699, 0, -0.5, 0.5, 0.5,
-3, -3.259322, -6.008699, 1, -0.5, 0.5, 0.5,
-3, -3.259322, -6.008699, 1, 1.5, 0.5, 0.5,
-3, -3.259322, -6.008699, 0, 1.5, 0.5, 0.5,
-2, -3.259322, -6.008699, 0, -0.5, 0.5, 0.5,
-2, -3.259322, -6.008699, 1, -0.5, 0.5, 0.5,
-2, -3.259322, -6.008699, 1, 1.5, 0.5, 0.5,
-2, -3.259322, -6.008699, 0, 1.5, 0.5, 0.5,
-1, -3.259322, -6.008699, 0, -0.5, 0.5, 0.5,
-1, -3.259322, -6.008699, 1, -0.5, 0.5, 0.5,
-1, -3.259322, -6.008699, 1, 1.5, 0.5, 0.5,
-1, -3.259322, -6.008699, 0, 1.5, 0.5, 0.5,
0, -3.259322, -6.008699, 0, -0.5, 0.5, 0.5,
0, -3.259322, -6.008699, 1, -0.5, 0.5, 0.5,
0, -3.259322, -6.008699, 1, 1.5, 0.5, 0.5,
0, -3.259322, -6.008699, 0, 1.5, 0.5, 0.5,
1, -3.259322, -6.008699, 0, -0.5, 0.5, 0.5,
1, -3.259322, -6.008699, 1, -0.5, 0.5, 0.5,
1, -3.259322, -6.008699, 1, 1.5, 0.5, 0.5,
1, -3.259322, -6.008699, 0, 1.5, 0.5, 0.5,
2, -3.259322, -6.008699, 0, -0.5, 0.5, 0.5,
2, -3.259322, -6.008699, 1, -0.5, 0.5, 0.5,
2, -3.259322, -6.008699, 1, 1.5, 0.5, 0.5,
2, -3.259322, -6.008699, 0, 1.5, 0.5, 0.5,
3, -3.259322, -6.008699, 0, -0.5, 0.5, 0.5,
3, -3.259322, -6.008699, 1, -0.5, 0.5, 0.5,
3, -3.259322, -6.008699, 1, 1.5, 0.5, 0.5,
3, -3.259322, -6.008699, 0, 1.5, 0.5, 0.5
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
-3.478565, -2, -5.223529,
-3.478565, 3, -5.223529,
-3.478565, -2, -5.223529,
-3.643672, -2, -5.485252,
-3.478565, -1, -5.223529,
-3.643672, -1, -5.485252,
-3.478565, 0, -5.223529,
-3.643672, 0, -5.485252,
-3.478565, 1, -5.223529,
-3.643672, 1, -5.485252,
-3.478565, 2, -5.223529,
-3.643672, 2, -5.485252,
-3.478565, 3, -5.223529,
-3.643672, 3, -5.485252
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
-3.973884, -2, -6.008699, 0, -0.5, 0.5, 0.5,
-3.973884, -2, -6.008699, 1, -0.5, 0.5, 0.5,
-3.973884, -2, -6.008699, 1, 1.5, 0.5, 0.5,
-3.973884, -2, -6.008699, 0, 1.5, 0.5, 0.5,
-3.973884, -1, -6.008699, 0, -0.5, 0.5, 0.5,
-3.973884, -1, -6.008699, 1, -0.5, 0.5, 0.5,
-3.973884, -1, -6.008699, 1, 1.5, 0.5, 0.5,
-3.973884, -1, -6.008699, 0, 1.5, 0.5, 0.5,
-3.973884, 0, -6.008699, 0, -0.5, 0.5, 0.5,
-3.973884, 0, -6.008699, 1, -0.5, 0.5, 0.5,
-3.973884, 0, -6.008699, 1, 1.5, 0.5, 0.5,
-3.973884, 0, -6.008699, 0, 1.5, 0.5, 0.5,
-3.973884, 1, -6.008699, 0, -0.5, 0.5, 0.5,
-3.973884, 1, -6.008699, 1, -0.5, 0.5, 0.5,
-3.973884, 1, -6.008699, 1, 1.5, 0.5, 0.5,
-3.973884, 1, -6.008699, 0, 1.5, 0.5, 0.5,
-3.973884, 2, -6.008699, 0, -0.5, 0.5, 0.5,
-3.973884, 2, -6.008699, 1, -0.5, 0.5, 0.5,
-3.973884, 2, -6.008699, 1, 1.5, 0.5, 0.5,
-3.973884, 2, -6.008699, 0, 1.5, 0.5, 0.5,
-3.973884, 3, -6.008699, 0, -0.5, 0.5, 0.5,
-3.973884, 3, -6.008699, 1, -0.5, 0.5, 0.5,
-3.973884, 3, -6.008699, 1, 1.5, 0.5, 0.5,
-3.973884, 3, -6.008699, 0, 1.5, 0.5, 0.5
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
-3.478565, -2.803026, -4,
-3.478565, -2.803026, 4,
-3.478565, -2.803026, -4,
-3.643672, -2.955125, -4,
-3.478565, -2.803026, -2,
-3.643672, -2.955125, -2,
-3.478565, -2.803026, 0,
-3.643672, -2.955125, 0,
-3.478565, -2.803026, 2,
-3.643672, -2.955125, 2,
-3.478565, -2.803026, 4,
-3.643672, -2.955125, 4
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
-3.973884, -3.259322, -4, 0, -0.5, 0.5, 0.5,
-3.973884, -3.259322, -4, 1, -0.5, 0.5, 0.5,
-3.973884, -3.259322, -4, 1, 1.5, 0.5, 0.5,
-3.973884, -3.259322, -4, 0, 1.5, 0.5, 0.5,
-3.973884, -3.259322, -2, 0, -0.5, 0.5, 0.5,
-3.973884, -3.259322, -2, 1, -0.5, 0.5, 0.5,
-3.973884, -3.259322, -2, 1, 1.5, 0.5, 0.5,
-3.973884, -3.259322, -2, 0, 1.5, 0.5, 0.5,
-3.973884, -3.259322, 0, 0, -0.5, 0.5, 0.5,
-3.973884, -3.259322, 0, 1, -0.5, 0.5, 0.5,
-3.973884, -3.259322, 0, 1, 1.5, 0.5, 0.5,
-3.973884, -3.259322, 0, 0, 1.5, 0.5, 0.5,
-3.973884, -3.259322, 2, 0, -0.5, 0.5, 0.5,
-3.973884, -3.259322, 2, 1, -0.5, 0.5, 0.5,
-3.973884, -3.259322, 2, 1, 1.5, 0.5, 0.5,
-3.973884, -3.259322, 2, 0, 1.5, 0.5, 0.5,
-3.973884, -3.259322, 4, 0, -0.5, 0.5, 0.5,
-3.973884, -3.259322, 4, 1, -0.5, 0.5, 0.5,
-3.973884, -3.259322, 4, 1, 1.5, 0.5, 0.5,
-3.973884, -3.259322, 4, 0, 1.5, 0.5, 0.5
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
-3.478565, -2.803026, -5.223529,
-3.478565, 3.280924, -5.223529,
-3.478565, -2.803026, 5.245411,
-3.478565, 3.280924, 5.245411,
-3.478565, -2.803026, -5.223529,
-3.478565, -2.803026, 5.245411,
-3.478565, 3.280924, -5.223529,
-3.478565, 3.280924, 5.245411,
-3.478565, -2.803026, -5.223529,
3.125694, -2.803026, -5.223529,
-3.478565, -2.803026, 5.245411,
3.125694, -2.803026, 5.245411,
-3.478565, 3.280924, -5.223529,
3.125694, 3.280924, -5.223529,
-3.478565, 3.280924, 5.245411,
3.125694, 3.280924, 5.245411,
3.125694, -2.803026, -5.223529,
3.125694, 3.280924, -5.223529,
3.125694, -2.803026, 5.245411,
3.125694, 3.280924, 5.245411,
3.125694, -2.803026, -5.223529,
3.125694, -2.803026, 5.245411,
3.125694, 3.280924, -5.223529,
3.125694, 3.280924, 5.245411
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
var radius = 7.364856;
var distance = 32.76708;
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
mvMatrix.translate( 0.1764355, -0.2389492, -0.01094127 );
mvMatrix.scale( 1.205741, 1.308858, 0.7606335 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.76708);
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
acifluorfen<-read.table("acifluorfen.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-acifluorfen$V2
```

```
## Error in eval(expr, envir, enclos): object 'acifluorfen' not found
```

```r
y<-acifluorfen$V3
```

```
## Error in eval(expr, envir, enclos): object 'acifluorfen' not found
```

```r
z<-acifluorfen$V4
```

```
## Error in eval(expr, envir, enclos): object 'acifluorfen' not found
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
-3.382386, 3.161365e-05, -0.9842739, 0, 0, 1, 1, 1,
-3.146656, -0.2963533, -1.324353, 1, 0, 0, 1, 1,
-3.055514, -0.7340041, -3.038881, 1, 0, 0, 1, 1,
-3.003891, -1.246934, -2.30802, 1, 0, 0, 1, 1,
-2.914045, 0.967756, -1.206052, 1, 0, 0, 1, 1,
-2.715488, -0.05230647, -1.765369, 1, 0, 0, 1, 1,
-2.631918, 0.3823493, -2.019318, 0, 0, 0, 1, 1,
-2.621322, -0.8851032, -3.860377, 0, 0, 0, 1, 1,
-2.42568, 1.777575, 0.14488, 0, 0, 0, 1, 1,
-2.413396, 2.331817, -0.533366, 0, 0, 0, 1, 1,
-2.378214, -0.7626899, -1.307504, 0, 0, 0, 1, 1,
-2.377306, -1.898646, -2.414271, 0, 0, 0, 1, 1,
-2.345386, 0.3403046, -2.004772, 0, 0, 0, 1, 1,
-2.273909, 0.8259159, -2.241962, 1, 1, 1, 1, 1,
-2.216224, -1.259903, -1.959141, 1, 1, 1, 1, 1,
-2.201087, 1.57452, -1.103827, 1, 1, 1, 1, 1,
-2.17117, -1.457469, -4.675495, 1, 1, 1, 1, 1,
-2.162733, 0.04154281, -0.9131779, 1, 1, 1, 1, 1,
-2.130241, 0.1558501, -0.7387246, 1, 1, 1, 1, 1,
-2.112772, -1.140068, -2.510904, 1, 1, 1, 1, 1,
-2.09213, 0.0107015, -1.634118, 1, 1, 1, 1, 1,
-2.089535, 0.31178, -2.913007, 1, 1, 1, 1, 1,
-2.0867, -0.9279791, -0.9009757, 1, 1, 1, 1, 1,
-2.075128, -1.012153, -0.5134797, 1, 1, 1, 1, 1,
-2.027993, 0.7884136, -2.456237, 1, 1, 1, 1, 1,
-2.01673, 0.8395482, -1.302131, 1, 1, 1, 1, 1,
-2.01481, -1.653533, -1.168838, 1, 1, 1, 1, 1,
-2.006564, -0.5943272, -1.880099, 1, 1, 1, 1, 1,
-1.996995, -0.02758348, -2.082837, 0, 0, 1, 1, 1,
-1.99679, -0.2035879, -3.12018, 1, 0, 0, 1, 1,
-1.987893, -0.5614031, -3.962582, 1, 0, 0, 1, 1,
-1.986631, -2.088205, -3.593627, 1, 0, 0, 1, 1,
-1.94828, 0.2352941, -1.909812, 1, 0, 0, 1, 1,
-1.94264, -1.308992, -1.185016, 1, 0, 0, 1, 1,
-1.921953, 1.024042, -0.6193896, 0, 0, 0, 1, 1,
-1.887651, -2.463136, -2.96955, 0, 0, 0, 1, 1,
-1.884869, 0.48745, -2.720945, 0, 0, 0, 1, 1,
-1.878014, -0.2371161, -1.253884, 0, 0, 0, 1, 1,
-1.842942, -0.8856981, -1.887968, 0, 0, 0, 1, 1,
-1.83511, -0.9427122, -2.284504, 0, 0, 0, 1, 1,
-1.826246, -0.9725971, -1.697026, 0, 0, 0, 1, 1,
-1.812148, 0.9788717, -1.552229, 1, 1, 1, 1, 1,
-1.800578, -1.167407, -2.909133, 1, 1, 1, 1, 1,
-1.786707, -1.438352, -2.065686, 1, 1, 1, 1, 1,
-1.749809, -0.5191631, -3.313395, 1, 1, 1, 1, 1,
-1.748096, -1.046843, -0.9255935, 1, 1, 1, 1, 1,
-1.731083, 0.550019, -2.070228, 1, 1, 1, 1, 1,
-1.719787, -1.574253, -2.853749, 1, 1, 1, 1, 1,
-1.717199, 0.5746204, -0.6650272, 1, 1, 1, 1, 1,
-1.714491, -0.1758556, -2.179741, 1, 1, 1, 1, 1,
-1.711615, -1.038517, -0.7336946, 1, 1, 1, 1, 1,
-1.70925, 0.1926899, -1.18241, 1, 1, 1, 1, 1,
-1.708473, 0.6211633, -0.6149158, 1, 1, 1, 1, 1,
-1.702165, -1.387226, -1.054425, 1, 1, 1, 1, 1,
-1.695638, 0.8068244, -0.4600446, 1, 1, 1, 1, 1,
-1.690288, -0.7122801, -2.262999, 1, 1, 1, 1, 1,
-1.682904, 0.4294417, -0.2073172, 0, 0, 1, 1, 1,
-1.667273, -1.398936, -3.127816, 1, 0, 0, 1, 1,
-1.665085, -1.748309, -1.788653, 1, 0, 0, 1, 1,
-1.619396, 0.6865237, -0.6111486, 1, 0, 0, 1, 1,
-1.591696, 0.4874255, -3.017446, 1, 0, 0, 1, 1,
-1.564426, 0.02889483, -3.035636, 1, 0, 0, 1, 1,
-1.559256, -1.475837, -2.691887, 0, 0, 0, 1, 1,
-1.553375, -0.0910261, -1.646519, 0, 0, 0, 1, 1,
-1.552964, 0.4347231, -1.179682, 0, 0, 0, 1, 1,
-1.547091, -0.6216848, -3.10017, 0, 0, 0, 1, 1,
-1.530601, -1.244916, -2.094722, 0, 0, 0, 1, 1,
-1.52813, -1.126951, -1.191053, 0, 0, 0, 1, 1,
-1.520966, -0.09400975, -1.584784, 0, 0, 0, 1, 1,
-1.518409, 1.105876, -1.106392, 1, 1, 1, 1, 1,
-1.506905, -0.2739386, -3.27784, 1, 1, 1, 1, 1,
-1.500142, -2.008723, -2.673864, 1, 1, 1, 1, 1,
-1.491533, -0.7378407, -2.394072, 1, 1, 1, 1, 1,
-1.483921, -1.218414, -2.567275, 1, 1, 1, 1, 1,
-1.479501, 0.2780406, -3.109365, 1, 1, 1, 1, 1,
-1.474035, 0.705708, -1.545551, 1, 1, 1, 1, 1,
-1.453536, 0.5019154, 0.01156163, 1, 1, 1, 1, 1,
-1.448235, -0.107803, -0.2486329, 1, 1, 1, 1, 1,
-1.44663, -0.4108629, -2.660894, 1, 1, 1, 1, 1,
-1.443752, 0.4878206, -1.655699, 1, 1, 1, 1, 1,
-1.429325, 2.089468, -1.286013, 1, 1, 1, 1, 1,
-1.424565, 0.410876, -0.3430638, 1, 1, 1, 1, 1,
-1.415373, 0.6720669, -1.981845, 1, 1, 1, 1, 1,
-1.412119, -1.188526, -1.569491, 1, 1, 1, 1, 1,
-1.411017, 0.3100685, -0.2200047, 0, 0, 1, 1, 1,
-1.402027, -1.978386, -3.233648, 1, 0, 0, 1, 1,
-1.395148, -0.3852046, -1.451884, 1, 0, 0, 1, 1,
-1.383722, -0.6820922, -2.529958, 1, 0, 0, 1, 1,
-1.378353, -1.231495, -4.612468, 1, 0, 0, 1, 1,
-1.37289, 0.7192532, -1.476082, 1, 0, 0, 1, 1,
-1.367762, -0.3496633, -2.422864, 0, 0, 0, 1, 1,
-1.361516, -0.8998867, -3.703426, 0, 0, 0, 1, 1,
-1.358623, -0.006164738, -2.842193, 0, 0, 0, 1, 1,
-1.356417, 1.748112, -0.1981382, 0, 0, 0, 1, 1,
-1.350638, 0.3110545, -0.4092931, 0, 0, 0, 1, 1,
-1.343003, 0.7210697, -0.9680872, 0, 0, 0, 1, 1,
-1.33466, -0.1000894, -1.564013, 0, 0, 0, 1, 1,
-1.325381, 0.4511677, -3.329633, 1, 1, 1, 1, 1,
-1.314005, 0.02846295, -0.1543241, 1, 1, 1, 1, 1,
-1.289566, -0.09766926, -0.9506337, 1, 1, 1, 1, 1,
-1.288047, 0.9756697, -0.6234586, 1, 1, 1, 1, 1,
-1.277638, -1.448915, -3.757076, 1, 1, 1, 1, 1,
-1.269971, -0.2793698, -2.186455, 1, 1, 1, 1, 1,
-1.265667, -0.2127704, -0.9041512, 1, 1, 1, 1, 1,
-1.263137, 0.1884719, -0.3970351, 1, 1, 1, 1, 1,
-1.260437, -0.2337245, -0.8406497, 1, 1, 1, 1, 1,
-1.259305, 1.540176, -1.21763, 1, 1, 1, 1, 1,
-1.246211, -2.325611, -2.322065, 1, 1, 1, 1, 1,
-1.211543, -1.184119, -4.659671, 1, 1, 1, 1, 1,
-1.210737, 0.6928726, -0.570943, 1, 1, 1, 1, 1,
-1.210655, -1.454278, -2.277432, 1, 1, 1, 1, 1,
-1.205145, 1.054876, 0.2284283, 1, 1, 1, 1, 1,
-1.199833, 0.1795774, -1.087059, 0, 0, 1, 1, 1,
-1.196892, 7.529546e-05, -1.262102, 1, 0, 0, 1, 1,
-1.195484, -0.3292532, -0.7633778, 1, 0, 0, 1, 1,
-1.193651, -0.5570616, -2.787578, 1, 0, 0, 1, 1,
-1.187722, -0.2670471, -2.439838, 1, 0, 0, 1, 1,
-1.17382, 0.3718611, -0.6531766, 1, 0, 0, 1, 1,
-1.172509, 2.489634, -0.9751744, 0, 0, 0, 1, 1,
-1.165217, -1.198345, -2.068061, 0, 0, 0, 1, 1,
-1.159943, -0.6660174, -1.885875, 0, 0, 0, 1, 1,
-1.155167, -1.131728, -3.209164, 0, 0, 0, 1, 1,
-1.144176, 0.1339564, -1.850201, 0, 0, 0, 1, 1,
-1.14341, -0.1075498, -0.9326428, 0, 0, 0, 1, 1,
-1.13674, 1.623277, -0.06298588, 0, 0, 0, 1, 1,
-1.131644, 1.106946, -1.518526, 1, 1, 1, 1, 1,
-1.128175, -0.2609855, -1.288746, 1, 1, 1, 1, 1,
-1.117712, 0.4654861, -0.07497895, 1, 1, 1, 1, 1,
-1.108409, -0.61009, -1.926563, 1, 1, 1, 1, 1,
-1.107308, 0.6654517, -2.032081, 1, 1, 1, 1, 1,
-1.102871, 0.9618061, -1.370412, 1, 1, 1, 1, 1,
-1.097305, 0.3638373, 0.3117154, 1, 1, 1, 1, 1,
-1.097, 0.2867289, 0.7032957, 1, 1, 1, 1, 1,
-1.096362, 0.3510178, -1.421686, 1, 1, 1, 1, 1,
-1.091558, -0.6114222, -4.295044, 1, 1, 1, 1, 1,
-1.088431, -1.457229, -3.560822, 1, 1, 1, 1, 1,
-1.086883, 0.2530017, -2.393087, 1, 1, 1, 1, 1,
-1.08364, 0.899061, -1.159029, 1, 1, 1, 1, 1,
-1.081534, 1.072023, -2.060895, 1, 1, 1, 1, 1,
-1.081246, 0.1951874, -0.3524769, 1, 1, 1, 1, 1,
-1.078667, -1.908643, -2.739331, 0, 0, 1, 1, 1,
-1.070686, -0.9769329, -2.967505, 1, 0, 0, 1, 1,
-1.0597, 1.490979, -0.7874751, 1, 0, 0, 1, 1,
-1.059365, -0.4603297, -3.219484, 1, 0, 0, 1, 1,
-1.046338, -0.5369169, -2.835457, 1, 0, 0, 1, 1,
-1.037824, 1.416399, 1.303512, 1, 0, 0, 1, 1,
-1.034658, -0.843693, -2.996982, 0, 0, 0, 1, 1,
-1.029613, -0.6629043, -2.834229, 0, 0, 0, 1, 1,
-1.028333, 0.2455824, -1.568698, 0, 0, 0, 1, 1,
-1.023648, 1.354005, -0.6367232, 0, 0, 0, 1, 1,
-1.020377, 1.113186, -1.320955, 0, 0, 0, 1, 1,
-1.017907, 0.5023042, -2.741769, 0, 0, 0, 1, 1,
-1.013291, -0.497551, -1.119899, 0, 0, 0, 1, 1,
-1.006573, 0.331322, -2.001351, 1, 1, 1, 1, 1,
-1.001979, -0.5749521, -1.807253, 1, 1, 1, 1, 1,
-0.9925743, -0.03090793, -0.5342612, 1, 1, 1, 1, 1,
-0.9869476, 0.410185, 0.3150006, 1, 1, 1, 1, 1,
-0.9861871, 1.17297, -0.08620381, 1, 1, 1, 1, 1,
-0.984435, 2.091997, 0.02255391, 1, 1, 1, 1, 1,
-0.9688171, -1.834774, -2.132033, 1, 1, 1, 1, 1,
-0.9589249, -1.271901, -1.688121, 1, 1, 1, 1, 1,
-0.9562683, 0.5826689, -1.370744, 1, 1, 1, 1, 1,
-0.9466991, -0.1036504, -1.869035, 1, 1, 1, 1, 1,
-0.946009, -0.08700301, -2.637944, 1, 1, 1, 1, 1,
-0.9372767, -0.8550923, -2.480893, 1, 1, 1, 1, 1,
-0.9372414, -0.4750052, -4.262073, 1, 1, 1, 1, 1,
-0.9372317, -0.5145192, -2.188656, 1, 1, 1, 1, 1,
-0.9360975, 0.1336941, -1.504843, 1, 1, 1, 1, 1,
-0.9314566, 0.06256717, -0.2240729, 0, 0, 1, 1, 1,
-0.9206198, 0.9308143, 0.1093365, 1, 0, 0, 1, 1,
-0.9180682, 0.3410099, -2.6273, 1, 0, 0, 1, 1,
-0.9154661, 0.3739915, -0.6781052, 1, 0, 0, 1, 1,
-0.9129835, 1.515223, -0.8048553, 1, 0, 0, 1, 1,
-0.9104369, -1.528396, -4.949294, 1, 0, 0, 1, 1,
-0.9100929, -0.2608178, -2.001394, 0, 0, 0, 1, 1,
-0.9078988, 0.930705, -1.195913, 0, 0, 0, 1, 1,
-0.8955229, -0.4907444, -1.506479, 0, 0, 0, 1, 1,
-0.8913919, -0.02617193, -1.355489, 0, 0, 0, 1, 1,
-0.875832, 0.6946869, -1.655707, 0, 0, 0, 1, 1,
-0.8735892, 0.6430148, -2.277814, 0, 0, 0, 1, 1,
-0.8699822, 1.678426, -1.498615, 0, 0, 0, 1, 1,
-0.863894, -1.013672, -3.196477, 1, 1, 1, 1, 1,
-0.8580767, 0.64511, 0.4901522, 1, 1, 1, 1, 1,
-0.8530225, -0.3925819, -1.934314, 1, 1, 1, 1, 1,
-0.8439943, 1.456378, 0.08596252, 1, 1, 1, 1, 1,
-0.8363313, 0.4030003, -0.3762784, 1, 1, 1, 1, 1,
-0.8336652, -0.2660518, -2.856325, 1, 1, 1, 1, 1,
-0.8333051, -0.6381823, -1.795955, 1, 1, 1, 1, 1,
-0.8282887, 0.7483145, 1.377253, 1, 1, 1, 1, 1,
-0.8269126, -1.463984, -2.032658, 1, 1, 1, 1, 1,
-0.8233595, 1.608556, -1.385863, 1, 1, 1, 1, 1,
-0.8218104, 0.8957119, -1.515818, 1, 1, 1, 1, 1,
-0.8204407, 1.416121, -2.06492, 1, 1, 1, 1, 1,
-0.818738, 0.07201469, -1.893537, 1, 1, 1, 1, 1,
-0.8180414, -1.132494, -2.166108, 1, 1, 1, 1, 1,
-0.8164907, 0.1118677, -1.049493, 1, 1, 1, 1, 1,
-0.8150043, 0.1149251, -0.2021144, 0, 0, 1, 1, 1,
-0.8077922, -0.2532378, -3.113555, 1, 0, 0, 1, 1,
-0.8073854, 2.289564, -0.8125837, 1, 0, 0, 1, 1,
-0.804951, 0.2887419, -0.435157, 1, 0, 0, 1, 1,
-0.8000621, -0.156899, -0.0136443, 1, 0, 0, 1, 1,
-0.799845, 0.5824052, 0.343268, 1, 0, 0, 1, 1,
-0.7988816, -0.1037651, -0.9701469, 0, 0, 0, 1, 1,
-0.7976558, 0.4995828, -0.5869694, 0, 0, 0, 1, 1,
-0.7937344, -0.6783411, -2.190466, 0, 0, 0, 1, 1,
-0.790444, -0.4475281, -0.5254501, 0, 0, 0, 1, 1,
-0.7899563, -1.817407, -2.862732, 0, 0, 0, 1, 1,
-0.7894507, 0.8002746, -0.003291261, 0, 0, 0, 1, 1,
-0.7808667, -0.8607739, -0.5005915, 0, 0, 0, 1, 1,
-0.776945, -0.6086973, -4.517169, 1, 1, 1, 1, 1,
-0.7701831, -2.004331, -2.549017, 1, 1, 1, 1, 1,
-0.7673081, 1.726497, -0.6360795, 1, 1, 1, 1, 1,
-0.7662054, 0.005291638, -2.093366, 1, 1, 1, 1, 1,
-0.7645534, -2.467635, -2.194785, 1, 1, 1, 1, 1,
-0.7620686, -1.430907, -2.438484, 1, 1, 1, 1, 1,
-0.7583467, 1.381631, 0.8416438, 1, 1, 1, 1, 1,
-0.7520369, -0.7716443, -2.586051, 1, 1, 1, 1, 1,
-0.7515517, 0.6990748, -1.392318, 1, 1, 1, 1, 1,
-0.7453899, 0.4048542, -1.566045, 1, 1, 1, 1, 1,
-0.7420934, -0.3302812, -0.4585232, 1, 1, 1, 1, 1,
-0.7405393, 0.7606811, 1.719794, 1, 1, 1, 1, 1,
-0.738246, -0.1357971, -1.514092, 1, 1, 1, 1, 1,
-0.7380012, -1.197187, -2.635373, 1, 1, 1, 1, 1,
-0.728764, -0.897365, -2.760977, 1, 1, 1, 1, 1,
-0.7266268, 0.02438173, 0.025996, 0, 0, 1, 1, 1,
-0.7241263, -0.7823, -1.752924, 1, 0, 0, 1, 1,
-0.7236958, 0.6001958, -0.4678435, 1, 0, 0, 1, 1,
-0.7208472, 0.6935468, 0.6000139, 1, 0, 0, 1, 1,
-0.7162684, 0.2070464, -0.3525812, 1, 0, 0, 1, 1,
-0.7124635, 0.01581232, -2.815617, 1, 0, 0, 1, 1,
-0.7069841, 1.445807, 0.1060004, 0, 0, 0, 1, 1,
-0.6968608, -1.73445, -3.500144, 0, 0, 0, 1, 1,
-0.696419, -1.010392, -2.125309, 0, 0, 0, 1, 1,
-0.6956179, -1.467443, -1.61205, 0, 0, 0, 1, 1,
-0.693398, 0.438686, -2.814713, 0, 0, 0, 1, 1,
-0.6933158, -1.604055, -3.079866, 0, 0, 0, 1, 1,
-0.6901923, 1.620614, -1.265232, 0, 0, 0, 1, 1,
-0.6882092, 1.918596, 0.512372, 1, 1, 1, 1, 1,
-0.6870922, 2.391258, -1.084313, 1, 1, 1, 1, 1,
-0.6870436, -1.924746, -3.515426, 1, 1, 1, 1, 1,
-0.6856803, -0.2290477, -1.431769, 1, 1, 1, 1, 1,
-0.6838087, 0.4011671, 1.1297, 1, 1, 1, 1, 1,
-0.6819161, 0.01682524, -0.5658475, 1, 1, 1, 1, 1,
-0.6787886, -0.9299584, -2.07761, 1, 1, 1, 1, 1,
-0.6763384, -0.746239, -2.156069, 1, 1, 1, 1, 1,
-0.6744801, 0.4790651, -0.4850127, 1, 1, 1, 1, 1,
-0.6725283, 1.767498, 1.308279, 1, 1, 1, 1, 1,
-0.6723925, -1.268736, -1.641827, 1, 1, 1, 1, 1,
-0.6704136, -1.286282, -0.9362496, 1, 1, 1, 1, 1,
-0.6695965, -0.03147061, -2.716575, 1, 1, 1, 1, 1,
-0.6587204, 0.1197294, -1.55746, 1, 1, 1, 1, 1,
-0.6580673, -0.3000049, -2.591861, 1, 1, 1, 1, 1,
-0.6572176, 1.149001, -1.19366, 0, 0, 1, 1, 1,
-0.6556601, -2.041877, -4.617157, 1, 0, 0, 1, 1,
-0.6544852, -0.7595904, -3.086244, 1, 0, 0, 1, 1,
-0.6540412, -0.2641579, 0.6627087, 1, 0, 0, 1, 1,
-0.6539279, -0.5036491, -2.114642, 1, 0, 0, 1, 1,
-0.6533129, 0.9038005, -0.5624074, 1, 0, 0, 1, 1,
-0.6441723, -0.7683845, -3.695907, 0, 0, 0, 1, 1,
-0.6425324, -0.5415235, -3.135911, 0, 0, 0, 1, 1,
-0.6392336, 0.984044, -1.685243, 0, 0, 0, 1, 1,
-0.6359266, -0.4036524, -3.67258, 0, 0, 0, 1, 1,
-0.6314219, -0.2733162, -3.506615, 0, 0, 0, 1, 1,
-0.628324, 0.6661471, -0.5438364, 0, 0, 0, 1, 1,
-0.6279134, 0.3650027, -1.297085, 0, 0, 0, 1, 1,
-0.6248153, 0.4460005, -0.9469815, 1, 1, 1, 1, 1,
-0.623157, 0.6466734, -2.266883, 1, 1, 1, 1, 1,
-0.6169091, 0.1308993, -1.468809, 1, 1, 1, 1, 1,
-0.608008, 1.872376, 2.340277, 1, 1, 1, 1, 1,
-0.6078762, -0.7258251, -1.071891, 1, 1, 1, 1, 1,
-0.6006758, -0.2040188, -0.6980411, 1, 1, 1, 1, 1,
-0.5973099, -0.7113573, -0.4217292, 1, 1, 1, 1, 1,
-0.5971496, 1.81664, -1.558447, 1, 1, 1, 1, 1,
-0.5960561, 1.094388, -0.6995189, 1, 1, 1, 1, 1,
-0.5917801, -0.6195158, -2.679634, 1, 1, 1, 1, 1,
-0.5905839, 0.3472294, -1.169429, 1, 1, 1, 1, 1,
-0.5904971, -0.1992989, -2.516932, 1, 1, 1, 1, 1,
-0.5900527, -0.4638417, -1.613714, 1, 1, 1, 1, 1,
-0.5859588, -0.9872704, -2.50369, 1, 1, 1, 1, 1,
-0.5825678, -0.5676202, -1.969919, 1, 1, 1, 1, 1,
-0.5813324, 0.03232575, -2.066144, 0, 0, 1, 1, 1,
-0.5775631, 1.408751, 0.5363836, 1, 0, 0, 1, 1,
-0.5594406, -0.7766736, -1.745025, 1, 0, 0, 1, 1,
-0.5558107, -0.7906925, -1.447649, 1, 0, 0, 1, 1,
-0.5534994, 0.98176, -1.576377, 1, 0, 0, 1, 1,
-0.5515637, -0.6893182, -3.601958, 1, 0, 0, 1, 1,
-0.549403, -0.4105959, -2.292175, 0, 0, 0, 1, 1,
-0.5490642, -1.300339, -1.839367, 0, 0, 0, 1, 1,
-0.5448293, 1.24904, -0.6651515, 0, 0, 0, 1, 1,
-0.5403832, 1.074872, -0.0002613093, 0, 0, 0, 1, 1,
-0.5375714, -1.290981, -1.489981, 0, 0, 0, 1, 1,
-0.5373387, 0.6949249, -1.552325, 0, 0, 0, 1, 1,
-0.536559, -1.654152, -1.957873, 0, 0, 0, 1, 1,
-0.5339811, -1.572913, -3.529438, 1, 1, 1, 1, 1,
-0.5335538, -0.3118275, -2.561359, 1, 1, 1, 1, 1,
-0.5332795, -1.889484, -3.548642, 1, 1, 1, 1, 1,
-0.5245082, 1.05429, -1.669575, 1, 1, 1, 1, 1,
-0.5243874, 0.2521363, -1.357565, 1, 1, 1, 1, 1,
-0.5230907, 1.293185, -1.340327, 1, 1, 1, 1, 1,
-0.5224867, 0.8185792, 0.5875595, 1, 1, 1, 1, 1,
-0.5113962, 0.4956136, -1.113453, 1, 1, 1, 1, 1,
-0.5085937, 1.396184, -1.698955, 1, 1, 1, 1, 1,
-0.5051506, -1.722337, -3.556826, 1, 1, 1, 1, 1,
-0.5012428, 1.576557, 0.6375348, 1, 1, 1, 1, 1,
-0.4975536, -0.5161633, -2.829173, 1, 1, 1, 1, 1,
-0.4974041, 0.8390836, 1.847845, 1, 1, 1, 1, 1,
-0.4902168, -0.5032927, -1.950344, 1, 1, 1, 1, 1,
-0.4868727, 1.971045, -1.961463, 1, 1, 1, 1, 1,
-0.4852479, 0.5452257, -0.5938587, 0, 0, 1, 1, 1,
-0.4775244, 0.412135, 1.738573, 1, 0, 0, 1, 1,
-0.4775149, -0.1953846, -2.361838, 1, 0, 0, 1, 1,
-0.4768018, -0.5016188, -1.999272, 1, 0, 0, 1, 1,
-0.4768003, -1.579638, -2.992196, 1, 0, 0, 1, 1,
-0.4765046, 0.7507134, -1.267176, 1, 0, 0, 1, 1,
-0.4714052, 0.4842494, -1.104466, 0, 0, 0, 1, 1,
-0.4676015, 1.057498, -0.5821538, 0, 0, 0, 1, 1,
-0.4640289, 0.2033244, -1.811849, 0, 0, 0, 1, 1,
-0.4588072, 1.206277, 0.7781615, 0, 0, 0, 1, 1,
-0.4568745, -0.04825519, -2.555207, 0, 0, 0, 1, 1,
-0.4559088, 2.022496, 1.864011, 0, 0, 0, 1, 1,
-0.4548358, -1.258257, -1.370501, 0, 0, 0, 1, 1,
-0.4536633, 1.235023, -0.626054, 1, 1, 1, 1, 1,
-0.4509892, -0.226757, -1.990446, 1, 1, 1, 1, 1,
-0.4467099, -0.4891786, -0.09506197, 1, 1, 1, 1, 1,
-0.4454446, 0.8736231, 0.9792056, 1, 1, 1, 1, 1,
-0.4446677, -2.224255, -3.127662, 1, 1, 1, 1, 1,
-0.4443488, 0.2138596, -0.651571, 1, 1, 1, 1, 1,
-0.4312106, -0.3163527, -1.658459, 1, 1, 1, 1, 1,
-0.4311207, 0.2742275, -1.470337, 1, 1, 1, 1, 1,
-0.4259521, 2.506144, -0.1505901, 1, 1, 1, 1, 1,
-0.4174262, -0.6476087, -2.344966, 1, 1, 1, 1, 1,
-0.4074883, -1.058295, -1.512954, 1, 1, 1, 1, 1,
-0.4074443, -0.974824, -3.023557, 1, 1, 1, 1, 1,
-0.4026143, -0.5336877, -2.903817, 1, 1, 1, 1, 1,
-0.399321, 0.6939451, -1.164246, 1, 1, 1, 1, 1,
-0.3977174, 0.6910307, -1.235541, 1, 1, 1, 1, 1,
-0.3948953, -1.25838, -3.775372, 0, 0, 1, 1, 1,
-0.3921844, 0.5905477, -1.939817, 1, 0, 0, 1, 1,
-0.3861919, -0.5977556, -1.669958, 1, 0, 0, 1, 1,
-0.385449, 0.7750807, 0.6157954, 1, 0, 0, 1, 1,
-0.3805313, -0.6196978, -0.4674462, 1, 0, 0, 1, 1,
-0.3786373, 0.6815953, -2.376306, 1, 0, 0, 1, 1,
-0.3772908, -0.6483415, -2.151114, 0, 0, 0, 1, 1,
-0.3757395, -0.3126883, -2.085452, 0, 0, 0, 1, 1,
-0.3721302, 0.6474384, -1.860391, 0, 0, 0, 1, 1,
-0.3698571, 0.03425673, -2.024231, 0, 0, 0, 1, 1,
-0.3586545, -1.362232, -2.33049, 0, 0, 0, 1, 1,
-0.3567068, -1.744553, -2.53916, 0, 0, 0, 1, 1,
-0.3559353, -0.613687, -3.382388, 0, 0, 0, 1, 1,
-0.3547363, -1.726694, -3.67819, 1, 1, 1, 1, 1,
-0.3527852, -0.7083691, -4.333879, 1, 1, 1, 1, 1,
-0.3517699, -0.6233351, -2.72413, 1, 1, 1, 1, 1,
-0.3502396, 2.380081, 1.376209, 1, 1, 1, 1, 1,
-0.3481017, 0.705433, -0.7317129, 1, 1, 1, 1, 1,
-0.3474718, -1.049688, -2.403195, 1, 1, 1, 1, 1,
-0.3448928, 1.040388, -0.7173205, 1, 1, 1, 1, 1,
-0.3348013, 0.4558591, 0.05748391, 1, 1, 1, 1, 1,
-0.3344757, 2.461259, 2.514861, 1, 1, 1, 1, 1,
-0.3307246, 1.741839, -0.0607487, 1, 1, 1, 1, 1,
-0.3303876, -0.1610713, -1.342441, 1, 1, 1, 1, 1,
-0.324928, -2.714425, -3.398559, 1, 1, 1, 1, 1,
-0.3228702, -1.906656, -3.714179, 1, 1, 1, 1, 1,
-0.3149803, -0.6541817, -2.749636, 1, 1, 1, 1, 1,
-0.3112584, -0.860019, -2.083749, 1, 1, 1, 1, 1,
-0.3107978, 1.207228, -0.4018682, 0, 0, 1, 1, 1,
-0.3094804, 1.440165, -0.4921967, 1, 0, 0, 1, 1,
-0.3028482, -0.654996, -3.599279, 1, 0, 0, 1, 1,
-0.3014594, -0.4712544, -1.047954, 1, 0, 0, 1, 1,
-0.2963391, -1.106058, -2.460481, 1, 0, 0, 1, 1,
-0.2944504, 0.07169581, -1.838492, 1, 0, 0, 1, 1,
-0.2895211, -1.047287, -3.537166, 0, 0, 0, 1, 1,
-0.2867238, 1.782453, -1.18426, 0, 0, 0, 1, 1,
-0.2847989, -0.8003354, -0.8852372, 0, 0, 0, 1, 1,
-0.2757807, -1.311132, -4.361812, 0, 0, 0, 1, 1,
-0.2744995, -0.09891097, -0.5155557, 0, 0, 0, 1, 1,
-0.2734751, -0.3238372, -2.322728, 0, 0, 0, 1, 1,
-0.2730296, 0.1710269, -2.514797, 0, 0, 0, 1, 1,
-0.2721768, 0.03433746, -0.3486392, 1, 1, 1, 1, 1,
-0.271899, 0.8107438, -1.247187, 1, 1, 1, 1, 1,
-0.2681791, 1.171614, -1.803076, 1, 1, 1, 1, 1,
-0.2676888, 0.6134081, -0.3553766, 1, 1, 1, 1, 1,
-0.2612222, -0.01453154, -1.761918, 1, 1, 1, 1, 1,
-0.2602507, -0.2260574, -2.794607, 1, 1, 1, 1, 1,
-0.255711, -0.8798152, -3.692569, 1, 1, 1, 1, 1,
-0.2543815, -0.1656133, -1.152282, 1, 1, 1, 1, 1,
-0.254127, 1.473651, -0.3973799, 1, 1, 1, 1, 1,
-0.254036, -0.4458669, -3.996721, 1, 1, 1, 1, 1,
-0.2520623, 1.041231, -1.781224, 1, 1, 1, 1, 1,
-0.2469991, -1.075319, -3.924983, 1, 1, 1, 1, 1,
-0.2461177, 0.2407607, 2.713792, 1, 1, 1, 1, 1,
-0.2439126, -0.9293678, -1.566296, 1, 1, 1, 1, 1,
-0.242739, -0.8604993, -2.640667, 1, 1, 1, 1, 1,
-0.2423922, -1.364691, -3.127165, 0, 0, 1, 1, 1,
-0.2395379, -0.7200686, -4.032242, 1, 0, 0, 1, 1,
-0.2394272, -0.2523989, -1.291537, 1, 0, 0, 1, 1,
-0.2368761, -0.4703935, -2.388237, 1, 0, 0, 1, 1,
-0.2357953, -0.7012796, -2.623122, 1, 0, 0, 1, 1,
-0.2350895, 1.092716, 0.185278, 1, 0, 0, 1, 1,
-0.2317368, -0.07852778, -1.814627, 0, 0, 0, 1, 1,
-0.2305248, -0.4275821, -1.270466, 0, 0, 0, 1, 1,
-0.228651, -0.1889784, -1.760534, 0, 0, 0, 1, 1,
-0.2276, -1.261435, -2.472156, 0, 0, 0, 1, 1,
-0.2261277, 1.714951, 0.4848106, 0, 0, 0, 1, 1,
-0.2241556, -0.5965614, -4.174438, 0, 0, 0, 1, 1,
-0.2224579, -0.3582471, -2.163408, 0, 0, 0, 1, 1,
-0.2172217, 0.07631399, -2.476341, 1, 1, 1, 1, 1,
-0.2158279, -0.2788957, -2.981151, 1, 1, 1, 1, 1,
-0.2104426, 0.33268, -0.1423362, 1, 1, 1, 1, 1,
-0.2095658, -1.623484, -2.64084, 1, 1, 1, 1, 1,
-0.2091265, 0.1925285, -0.9088807, 1, 1, 1, 1, 1,
-0.2090174, 0.5632584, -0.3706954, 1, 1, 1, 1, 1,
-0.2058477, -1.157831, -1.351821, 1, 1, 1, 1, 1,
-0.2033412, 1.265148, -0.241785, 1, 1, 1, 1, 1,
-0.1988052, -0.6490825, -4.187453, 1, 1, 1, 1, 1,
-0.1893635, -1.372125, -2.557385, 1, 1, 1, 1, 1,
-0.1891703, 0.06944671, -2.336935, 1, 1, 1, 1, 1,
-0.1823465, 0.1833563, 0.226016, 1, 1, 1, 1, 1,
-0.1764784, 0.5500318, -1.667892, 1, 1, 1, 1, 1,
-0.1747881, 0.9599708, -0.7862423, 1, 1, 1, 1, 1,
-0.1678285, -0.8663735, -2.645906, 1, 1, 1, 1, 1,
-0.1634772, 0.008897848, -2.505857, 0, 0, 1, 1, 1,
-0.1629944, 0.7821599, -0.6072283, 1, 0, 0, 1, 1,
-0.1627471, -0.166425, -3.79327, 1, 0, 0, 1, 1,
-0.160642, -0.05478727, -1.423804, 1, 0, 0, 1, 1,
-0.1572409, -0.07973874, -1.724869, 1, 0, 0, 1, 1,
-0.152992, 0.05024223, -1.009163, 1, 0, 0, 1, 1,
-0.1471118, 0.8415277, -0.1377414, 0, 0, 0, 1, 1,
-0.1452367, -0.1830833, -2.41718, 0, 0, 0, 1, 1,
-0.1416627, -0.420099, -2.962934, 0, 0, 0, 1, 1,
-0.1346344, -0.744067, -3.231843, 0, 0, 0, 1, 1,
-0.1327804, -0.03138054, 0.1694338, 0, 0, 0, 1, 1,
-0.1323133, -1.042309, -2.519418, 0, 0, 0, 1, 1,
-0.1309833, -1.086952, -2.237404, 0, 0, 0, 1, 1,
-0.1251414, 0.4436761, -0.5320688, 1, 1, 1, 1, 1,
-0.1243175, 0.303645, -0.8159499, 1, 1, 1, 1, 1,
-0.1243125, 0.3058688, -1.153026, 1, 1, 1, 1, 1,
-0.1223342, -0.393951, -3.857856, 1, 1, 1, 1, 1,
-0.1194718, 1.472837, -0.947006, 1, 1, 1, 1, 1,
-0.114986, 0.9029034, 0.5376292, 1, 1, 1, 1, 1,
-0.1149408, -2.008553, -2.113236, 1, 1, 1, 1, 1,
-0.1140823, 0.6535618, 1.023675, 1, 1, 1, 1, 1,
-0.1140247, -0.4219875, -1.754753, 1, 1, 1, 1, 1,
-0.1036038, 0.3458841, -0.6010736, 1, 1, 1, 1, 1,
-0.1012148, 1.763768, 0.4858543, 1, 1, 1, 1, 1,
-0.1009749, -0.06835128, -2.094316, 1, 1, 1, 1, 1,
-0.1006648, -2.513691, -2.829904, 1, 1, 1, 1, 1,
-0.09423606, 1.506313, -0.2061159, 1, 1, 1, 1, 1,
-0.08880014, 0.6329747, -2.391114, 1, 1, 1, 1, 1,
-0.08877241, 0.8630267, -0.3091512, 0, 0, 1, 1, 1,
-0.08827461, -1.446144, -4.507524, 1, 0, 0, 1, 1,
-0.08688106, -1.714092, -3.388756, 1, 0, 0, 1, 1,
-0.08636647, -1.951068, -3.018485, 1, 0, 0, 1, 1,
-0.08567942, -0.7079543, -2.981663, 1, 0, 0, 1, 1,
-0.08535089, -1.175331, -2.88229, 1, 0, 0, 1, 1,
-0.08268179, 0.9712846, 0.9551724, 0, 0, 0, 1, 1,
-0.08148126, 0.05085545, -0.295463, 0, 0, 0, 1, 1,
-0.08074234, 0.6497808, 0.1497406, 0, 0, 0, 1, 1,
-0.08016418, -2.074394, -2.974849, 0, 0, 0, 1, 1,
-0.07403529, 1.065585, -1.172983, 0, 0, 0, 1, 1,
-0.07293506, -0.01736782, -2.825748, 0, 0, 0, 1, 1,
-0.07254264, 0.2652734, -0.3961546, 0, 0, 0, 1, 1,
-0.07189804, 0.3743896, -0.6053763, 1, 1, 1, 1, 1,
-0.07069363, 0.6528782, 2.114905, 1, 1, 1, 1, 1,
-0.06980544, 0.1005731, -1.395895, 1, 1, 1, 1, 1,
-0.06802182, -0.04549414, -0.6981393, 1, 1, 1, 1, 1,
-0.0600753, -1.83061, -2.658767, 1, 1, 1, 1, 1,
-0.05794734, -0.9543648, -3.262769, 1, 1, 1, 1, 1,
-0.05475974, -0.2010824, -3.387894, 1, 1, 1, 1, 1,
-0.051345, -0.3180846, -2.590754, 1, 1, 1, 1, 1,
-0.05054459, -0.5257428, -2.050447, 1, 1, 1, 1, 1,
-0.05000407, -1.605456, -3.741762, 1, 1, 1, 1, 1,
-0.04635897, 1.467219, -0.6388066, 1, 1, 1, 1, 1,
-0.04255842, 0.4058313, -0.9651408, 1, 1, 1, 1, 1,
-0.04172616, -0.206351, -1.087271, 1, 1, 1, 1, 1,
-0.04151124, -0.4148897, -5.071069, 1, 1, 1, 1, 1,
-0.03925974, 0.2778415, 0.06564659, 1, 1, 1, 1, 1,
-0.03358217, 1.01066, 0.6260827, 0, 0, 1, 1, 1,
-0.03064725, 0.164598, 1.872014, 1, 0, 0, 1, 1,
-0.02922956, -0.08360499, -0.6268955, 1, 0, 0, 1, 1,
-0.02906721, -0.5656021, -2.049588, 1, 0, 0, 1, 1,
-0.02621618, 0.9281093, 0.4626173, 1, 0, 0, 1, 1,
-0.02419762, 0.1760663, -0.8066869, 1, 0, 0, 1, 1,
-0.02379646, -0.316599, -1.696054, 0, 0, 0, 1, 1,
-0.02316992, 0.4983292, 0.3712594, 0, 0, 0, 1, 1,
-0.0214386, 0.3060544, 0.2940165, 0, 0, 0, 1, 1,
-0.01369654, -2.650395, -2.481953, 0, 0, 0, 1, 1,
-0.01186096, 1.417846, 1.383001, 0, 0, 0, 1, 1,
-0.004376162, 0.9137529, -0.8623565, 0, 0, 0, 1, 1,
0.003246217, 0.9332589, 0.8039061, 0, 0, 0, 1, 1,
0.003464468, 0.2561656, 0.1793559, 1, 1, 1, 1, 1,
0.003936811, 0.792187, 0.953959, 1, 1, 1, 1, 1,
0.006429535, -1.107781, 2.105202, 1, 1, 1, 1, 1,
0.007638173, 0.6757053, -0.2470602, 1, 1, 1, 1, 1,
0.008635929, 1.2341, -1.626206, 1, 1, 1, 1, 1,
0.01396837, -0.5531163, 2.483688, 1, 1, 1, 1, 1,
0.02429582, 1.334471, 0.6526327, 1, 1, 1, 1, 1,
0.03171895, 2.572228, -0.02029902, 1, 1, 1, 1, 1,
0.03184719, -0.3472496, 1.856203, 1, 1, 1, 1, 1,
0.03809797, -1.620742, 2.60346, 1, 1, 1, 1, 1,
0.04215439, -0.435406, 4.846534, 1, 1, 1, 1, 1,
0.04604781, 0.1682276, -0.4235885, 1, 1, 1, 1, 1,
0.0470613, -1.555676, 1.787213, 1, 1, 1, 1, 1,
0.04788944, 2.209083, 1.033656, 1, 1, 1, 1, 1,
0.04874971, 1.67189, 1.214387, 1, 1, 1, 1, 1,
0.05981752, -0.03437844, 0.9406142, 0, 0, 1, 1, 1,
0.06035285, -0.9947668, 2.310827, 1, 0, 0, 1, 1,
0.06101593, -0.8081926, 3.271936, 1, 0, 0, 1, 1,
0.06488288, 1.723742, -0.7441645, 1, 0, 0, 1, 1,
0.0680861, -0.5623208, 0.2823515, 1, 0, 0, 1, 1,
0.07036176, -0.1240134, 3.74843, 1, 0, 0, 1, 1,
0.07225797, 0.8976318, -0.8767753, 0, 0, 0, 1, 1,
0.07392734, -1.55184, 1.633827, 0, 0, 0, 1, 1,
0.07515846, 1.347355, 1.158531, 0, 0, 0, 1, 1,
0.07783733, -0.6884285, 1.491153, 0, 0, 0, 1, 1,
0.07880703, -0.6739885, 3.263052, 0, 0, 0, 1, 1,
0.08385655, -1.258236, 2.129901, 0, 0, 0, 1, 1,
0.08444577, -0.20548, 2.731487, 0, 0, 0, 1, 1,
0.08559103, -1.352311, 3.489285, 1, 1, 1, 1, 1,
0.0889136, 0.02953523, 1.408684, 1, 1, 1, 1, 1,
0.09461763, 0.220837, -0.09428298, 1, 1, 1, 1, 1,
0.0964529, -1.395577, 2.507021, 1, 1, 1, 1, 1,
0.1033959, -1.310017, 3.397545, 1, 1, 1, 1, 1,
0.1073883, 0.389345, -0.4298983, 1, 1, 1, 1, 1,
0.1094878, -0.2442109, 2.299392, 1, 1, 1, 1, 1,
0.1095517, -0.9483017, 4.933779, 1, 1, 1, 1, 1,
0.1153702, -0.1936955, 2.326583, 1, 1, 1, 1, 1,
0.1156477, 1.049269, 1.065897, 1, 1, 1, 1, 1,
0.1159077, -0.8658086, 3.406104, 1, 1, 1, 1, 1,
0.1183336, -0.7489661, 2.957926, 1, 1, 1, 1, 1,
0.1184795, -0.9968654, 2.778681, 1, 1, 1, 1, 1,
0.1243508, 0.5125541, 0.1641827, 1, 1, 1, 1, 1,
0.1261605, -1.870351, 3.921303, 1, 1, 1, 1, 1,
0.1276422, -0.655017, 1.92986, 0, 0, 1, 1, 1,
0.1300942, -0.2932453, 0.7205887, 1, 0, 0, 1, 1,
0.1308587, 1.144932, 0.425833, 1, 0, 0, 1, 1,
0.1315592, 0.6088407, 0.4282626, 1, 0, 0, 1, 1,
0.1351775, -1.089834, 2.399714, 1, 0, 0, 1, 1,
0.1356942, -0.5418004, 2.724287, 1, 0, 0, 1, 1,
0.1358518, 1.144761, -0.4738655, 0, 0, 0, 1, 1,
0.1360258, 1.584583, 1.990583, 0, 0, 0, 1, 1,
0.1374159, -0.6183603, 3.775072, 0, 0, 0, 1, 1,
0.1396606, -0.616336, 3.906124, 0, 0, 0, 1, 1,
0.1398658, 0.2884531, 0.5063046, 0, 0, 0, 1, 1,
0.1417784, 0.4611149, 2.445357, 0, 0, 0, 1, 1,
0.1467733, -0.7787033, 2.538151, 0, 0, 0, 1, 1,
0.154984, -0.004664865, 2.370142, 1, 1, 1, 1, 1,
0.1562659, 1.520133, -0.7390152, 1, 1, 1, 1, 1,
0.1634292, -0.8391293, 2.579692, 1, 1, 1, 1, 1,
0.1690604, -0.3028533, 2.574011, 1, 1, 1, 1, 1,
0.1696795, 1.101273, 2.394742, 1, 1, 1, 1, 1,
0.1714972, 0.8941879, -0.250736, 1, 1, 1, 1, 1,
0.1718486, 1.541556, -0.2851748, 1, 1, 1, 1, 1,
0.1724984, -0.8885409, 2.525836, 1, 1, 1, 1, 1,
0.172569, 0.2897409, -0.1293952, 1, 1, 1, 1, 1,
0.17691, 0.5057139, -1.406983, 1, 1, 1, 1, 1,
0.1783188, -0.6637741, 2.433661, 1, 1, 1, 1, 1,
0.1818152, 0.01011009, 1.229658, 1, 1, 1, 1, 1,
0.1836788, 1.075724, 0.7858876, 1, 1, 1, 1, 1,
0.1839388, 1.111747, -0.5546265, 1, 1, 1, 1, 1,
0.1860565, 0.09803476, 2.420104, 1, 1, 1, 1, 1,
0.1897468, -1.419542, 2.960712, 0, 0, 1, 1, 1,
0.1899316, 0.1905639, 2.288665, 1, 0, 0, 1, 1,
0.1905987, 0.9733146, -0.1013965, 1, 0, 0, 1, 1,
0.1925472, 0.9133075, -1.374515, 1, 0, 0, 1, 1,
0.1935268, 0.636329, 0.42108, 1, 0, 0, 1, 1,
0.195436, -0.3081153, 2.614565, 1, 0, 0, 1, 1,
0.1986128, 0.7776731, 0.002581347, 0, 0, 0, 1, 1,
0.2033798, 0.1571298, 3.140646, 0, 0, 0, 1, 1,
0.2045294, 1.31807, 0.9020647, 0, 0, 0, 1, 1,
0.2067083, -2.295496, 1.051812, 0, 0, 0, 1, 1,
0.2124474, 0.6524318, -0.4225446, 0, 0, 0, 1, 1,
0.215253, 0.7821268, 1.83683, 0, 0, 0, 1, 1,
0.2158731, 0.6011441, -2.050328, 0, 0, 0, 1, 1,
0.2162535, -0.6612656, 0.9152777, 1, 1, 1, 1, 1,
0.2165916, 0.4469977, -0.304597, 1, 1, 1, 1, 1,
0.2206851, -1.571013, 2.663114, 1, 1, 1, 1, 1,
0.2227087, -2.041336, 4.007051, 1, 1, 1, 1, 1,
0.23327, -1.084855, 3.283795, 1, 1, 1, 1, 1,
0.2378454, 1.070368, -0.4788178, 1, 1, 1, 1, 1,
0.2382478, -0.8357541, 1.310736, 1, 1, 1, 1, 1,
0.2397182, -0.05282699, 3.495488, 1, 1, 1, 1, 1,
0.240729, 3.192323, -0.232942, 1, 1, 1, 1, 1,
0.2421143, 0.2293858, -0.171552, 1, 1, 1, 1, 1,
0.2455485, 0.08114506, 0.8414378, 1, 1, 1, 1, 1,
0.249778, 0.4404889, 1.174538, 1, 1, 1, 1, 1,
0.2552531, 0.6449161, 0.9990296, 1, 1, 1, 1, 1,
0.2569628, -0.1335647, 3.309848, 1, 1, 1, 1, 1,
0.2575829, -1.084404, 2.767022, 1, 1, 1, 1, 1,
0.267729, -0.2908992, 3.165832, 0, 0, 1, 1, 1,
0.27295, 0.4674149, 0.9211494, 1, 0, 0, 1, 1,
0.2750835, 0.8586956, -1.218926, 1, 0, 0, 1, 1,
0.2761219, 0.2923037, 0.9287809, 1, 0, 0, 1, 1,
0.2810361, -0.996219, 3.085241, 1, 0, 0, 1, 1,
0.2838674, 0.858789, 1.330399, 1, 0, 0, 1, 1,
0.2896965, 1.039118, 0.3272022, 0, 0, 0, 1, 1,
0.2914281, 0.1294251, 1.24963, 0, 0, 0, 1, 1,
0.2933484, -2.208487, 1.780712, 0, 0, 0, 1, 1,
0.2953422, -1.056322, 2.423346, 0, 0, 0, 1, 1,
0.2978846, 0.9045756, 0.7026646, 0, 0, 0, 1, 1,
0.2989958, -1.164769, 4.80475, 0, 0, 0, 1, 1,
0.3029487, 0.1925172, -0.2700572, 0, 0, 0, 1, 1,
0.3037152, 1.236301, -2.018294, 1, 1, 1, 1, 1,
0.3093775, -0.9189107, 3.899724, 1, 1, 1, 1, 1,
0.3095408, -0.8483736, 2.486069, 1, 1, 1, 1, 1,
0.3104768, 0.02403574, 1.29886, 1, 1, 1, 1, 1,
0.3131286, -0.3376915, 2.852673, 1, 1, 1, 1, 1,
0.3201856, 1.107897, -0.5906262, 1, 1, 1, 1, 1,
0.3208449, -0.647597, 2.046577, 1, 1, 1, 1, 1,
0.3214867, -0.4058297, 2.117779, 1, 1, 1, 1, 1,
0.3258805, 1.847409, 1.189102, 1, 1, 1, 1, 1,
0.3271606, 0.8221653, 0.4150664, 1, 1, 1, 1, 1,
0.3276892, 1.070078, -0.4550156, 1, 1, 1, 1, 1,
0.3278786, -0.415423, 1.634596, 1, 1, 1, 1, 1,
0.3280558, -0.5811244, 2.36401, 1, 1, 1, 1, 1,
0.3289864, 0.4072504, 1.497882, 1, 1, 1, 1, 1,
0.3327349, -0.8641983, 2.972421, 1, 1, 1, 1, 1,
0.3336164, 0.8348483, -1.586921, 0, 0, 1, 1, 1,
0.3340445, 2.324448, 0.5647025, 1, 0, 0, 1, 1,
0.3352146, -0.07881808, 1.803553, 1, 0, 0, 1, 1,
0.3380782, 2.017044, -0.1165528, 1, 0, 0, 1, 1,
0.3435161, 1.163213, 0.5256901, 1, 0, 0, 1, 1,
0.3466565, -0.6877515, 3.586915, 1, 0, 0, 1, 1,
0.3473112, -0.7571443, 2.547563, 0, 0, 0, 1, 1,
0.3484697, 0.4342128, 0.7617733, 0, 0, 0, 1, 1,
0.3512796, 0.9404948, 0.6832265, 0, 0, 0, 1, 1,
0.3520667, -0.3356844, 1.833361, 0, 0, 0, 1, 1,
0.3570373, -1.23297, 3.622424, 0, 0, 0, 1, 1,
0.3574218, 2.23445, 0.2368996, 0, 0, 0, 1, 1,
0.358054, 1.538676, 0.2999607, 0, 0, 0, 1, 1,
0.3585828, 0.7124244, -1.142097, 1, 1, 1, 1, 1,
0.3655959, 1.627031, -2.228747, 1, 1, 1, 1, 1,
0.3680814, 0.9092838, -0.3752189, 1, 1, 1, 1, 1,
0.3695398, -0.6768611, 2.010023, 1, 1, 1, 1, 1,
0.3706525, -1.313834, 2.923114, 1, 1, 1, 1, 1,
0.3711182, 0.6372281, 0.361632, 1, 1, 1, 1, 1,
0.3730808, -0.4291414, 3.296396, 1, 1, 1, 1, 1,
0.3735384, 1.153097, 0.7443294, 1, 1, 1, 1, 1,
0.3753102, 0.6731896, -1.190565, 1, 1, 1, 1, 1,
0.3761782, -0.5187695, 2.763872, 1, 1, 1, 1, 1,
0.3766473, 1.19708, 0.591557, 1, 1, 1, 1, 1,
0.3787814, -0.6395648, 2.549009, 1, 1, 1, 1, 1,
0.3969439, 1.133009, 1.387078, 1, 1, 1, 1, 1,
0.3998793, -1.419603, 1.850855, 1, 1, 1, 1, 1,
0.4017311, 1.727444, -0.008946876, 1, 1, 1, 1, 1,
0.4088858, -0.8540446, 2.525635, 0, 0, 1, 1, 1,
0.4135745, -1.011346, 3.500501, 1, 0, 0, 1, 1,
0.4154597, 0.7827776, 0.1242136, 1, 0, 0, 1, 1,
0.4172152, -0.8704959, 2.727364, 1, 0, 0, 1, 1,
0.4176017, -2.028071, 2.742613, 1, 0, 0, 1, 1,
0.4205, -0.5681908, 3.007922, 1, 0, 0, 1, 1,
0.4206009, -0.4561158, 1.389863, 0, 0, 0, 1, 1,
0.4271728, 1.196916, 0.7054827, 0, 0, 0, 1, 1,
0.427399, -0.7885724, 2.646569, 0, 0, 0, 1, 1,
0.4279854, 1.071873, 2.250604, 0, 0, 0, 1, 1,
0.4349634, -1.997311, 2.628554, 0, 0, 0, 1, 1,
0.436216, -0.7388161, 3.33538, 0, 0, 0, 1, 1,
0.4372864, 0.3406706, 1.597126, 0, 0, 0, 1, 1,
0.4387922, 0.730885, 1.564613, 1, 1, 1, 1, 1,
0.4389707, -0.3154438, 0.01852703, 1, 1, 1, 1, 1,
0.4528737, -0.3317262, 1.853292, 1, 1, 1, 1, 1,
0.4558834, -0.09236901, 1.995151, 1, 1, 1, 1, 1,
0.4612929, 0.9943499, 0.3182981, 1, 1, 1, 1, 1,
0.4725074, 0.7827617, 3.105597, 1, 1, 1, 1, 1,
0.4805187, -0.1135184, 3.108987, 1, 1, 1, 1, 1,
0.4824441, -0.4405197, 2.320075, 1, 1, 1, 1, 1,
0.4841137, 0.6029941, -0.4883684, 1, 1, 1, 1, 1,
0.485508, -0.7070643, 2.053578, 1, 1, 1, 1, 1,
0.4866657, -1.814838, 4.452995, 1, 1, 1, 1, 1,
0.488584, 0.9234821, -0.6356902, 1, 1, 1, 1, 1,
0.4904291, 0.6971066, 0.03128668, 1, 1, 1, 1, 1,
0.4992155, 0.2772356, 1.289178, 1, 1, 1, 1, 1,
0.5070766, -0.1066824, 1.135555, 1, 1, 1, 1, 1,
0.5142034, 0.9370506, 0.4876189, 0, 0, 1, 1, 1,
0.5146081, 0.9577332, 2.080177, 1, 0, 0, 1, 1,
0.5153723, -0.09871791, -0.1948429, 1, 0, 0, 1, 1,
0.5197638, 0.4003167, 1.080678, 1, 0, 0, 1, 1,
0.5291191, -0.01834584, 0.4170203, 1, 0, 0, 1, 1,
0.5310531, 2.518381, 0.2207898, 1, 0, 0, 1, 1,
0.5357361, -1.443063, 2.302898, 0, 0, 0, 1, 1,
0.538679, -1.495037, 0.8668101, 0, 0, 0, 1, 1,
0.5419812, -0.2745736, 3.668618, 0, 0, 0, 1, 1,
0.5498981, 0.443905, 0.4760513, 0, 0, 0, 1, 1,
0.5515049, 0.235628, -1.991213, 0, 0, 0, 1, 1,
0.5540379, 0.6075412, 0.7936397, 0, 0, 0, 1, 1,
0.5596547, 1.44209, 1.387327, 0, 0, 0, 1, 1,
0.5613211, -0.5946527, 3.20807, 1, 1, 1, 1, 1,
0.5639163, 1.678843, 1.182531, 1, 1, 1, 1, 1,
0.5641479, 0.3615657, -0.1610451, 1, 1, 1, 1, 1,
0.5650985, 0.0328493, 2.224758, 1, 1, 1, 1, 1,
0.5658695, 0.7171749, 1.218109, 1, 1, 1, 1, 1,
0.5661126, 0.1164279, 2.38318, 1, 1, 1, 1, 1,
0.5674275, -1.453791, 1.790609, 1, 1, 1, 1, 1,
0.5695844, 1.729154, -0.320306, 1, 1, 1, 1, 1,
0.5710305, -1.361837, 2.068655, 1, 1, 1, 1, 1,
0.5727128, 0.6363623, 1.02646, 1, 1, 1, 1, 1,
0.5787896, -0.2178765, 2.842684, 1, 1, 1, 1, 1,
0.5822358, -1.481471, 3.276957, 1, 1, 1, 1, 1,
0.5871812, -0.06029669, 1.957292, 1, 1, 1, 1, 1,
0.5911081, 0.1820385, 2.491297, 1, 1, 1, 1, 1,
0.5930965, 0.661319, 1.253749, 1, 1, 1, 1, 1,
0.5954673, -1.14571, 2.406276, 0, 0, 1, 1, 1,
0.5966966, -0.8644593, 3.25682, 1, 0, 0, 1, 1,
0.5971221, -0.5294864, 2.142812, 1, 0, 0, 1, 1,
0.6004528, -0.1294955, 1.533805, 1, 0, 0, 1, 1,
0.612389, -1.28232, 3.108244, 1, 0, 0, 1, 1,
0.6158241, -0.1245676, 1.238793, 1, 0, 0, 1, 1,
0.6164219, 0.7195252, -0.3152721, 0, 0, 0, 1, 1,
0.6174728, 2.153202, -0.7476495, 0, 0, 0, 1, 1,
0.6189229, -0.9072879, 5.092951, 0, 0, 0, 1, 1,
0.6197736, 0.4016284, 1.432563, 0, 0, 0, 1, 1,
0.620176, 0.6996923, 1.268871, 0, 0, 0, 1, 1,
0.6211461, -0.9287501, 2.700988, 0, 0, 0, 1, 1,
0.6215675, 1.756935, 1.591856, 0, 0, 0, 1, 1,
0.6238391, -0.4148394, 1.665737, 1, 1, 1, 1, 1,
0.6238874, -1.670818, 3.753873, 1, 1, 1, 1, 1,
0.6246331, 0.02340339, 1.366234, 1, 1, 1, 1, 1,
0.6266769, 0.4936039, 0.875291, 1, 1, 1, 1, 1,
0.6280513, 1.050523, 0.6112246, 1, 1, 1, 1, 1,
0.6323946, -0.2898608, 2.117768, 1, 1, 1, 1, 1,
0.6342526, 0.3212221, -0.3353168, 1, 1, 1, 1, 1,
0.6414955, 1.584964, -1.390102, 1, 1, 1, 1, 1,
0.6449544, -0.2367991, 2.094077, 1, 1, 1, 1, 1,
0.6449866, -0.201657, 3.029535, 1, 1, 1, 1, 1,
0.6450363, -0.09521121, 1.906686, 1, 1, 1, 1, 1,
0.6518877, -0.3040563, 3.379935, 1, 1, 1, 1, 1,
0.6539209, 1.754688, -0.3673157, 1, 1, 1, 1, 1,
0.6631212, 0.728606, -0.7116481, 1, 1, 1, 1, 1,
0.6683144, 0.1193624, 1.22944, 1, 1, 1, 1, 1,
0.6710378, -0.4764284, 2.726767, 0, 0, 1, 1, 1,
0.6737462, 1.133436, 0.488175, 1, 0, 0, 1, 1,
0.67407, -0.2878137, 0.4323691, 1, 0, 0, 1, 1,
0.6759717, 2.260592, 0.2495185, 1, 0, 0, 1, 1,
0.67672, 0.1457588, -1.086956, 1, 0, 0, 1, 1,
0.677568, -0.9534123, 0.054291, 1, 0, 0, 1, 1,
0.6796783, 0.2887447, 1.076635, 0, 0, 0, 1, 1,
0.6819981, -0.5482605, 3.736502, 0, 0, 0, 1, 1,
0.6879438, -2.634869, 3.135291, 0, 0, 0, 1, 1,
0.688652, -0.8154811, 2.790238, 0, 0, 0, 1, 1,
0.6913162, 1.152883, 1.953434, 0, 0, 0, 1, 1,
0.694487, 0.4923864, 0.9532321, 0, 0, 0, 1, 1,
0.6951894, -0.3285176, 1.69904, 0, 0, 0, 1, 1,
0.6972383, 0.809019, -1.380571, 1, 1, 1, 1, 1,
0.6995335, -0.1867738, 1.894544, 1, 1, 1, 1, 1,
0.7006739, -0.5878513, 3.682459, 1, 1, 1, 1, 1,
0.7050906, 2.276421, 0.2468267, 1, 1, 1, 1, 1,
0.7059292, -0.3269676, 3.711609, 1, 1, 1, 1, 1,
0.7245066, -1.347037, 3.746719, 1, 1, 1, 1, 1,
0.7269445, 0.1468115, 1.155642, 1, 1, 1, 1, 1,
0.7270585, -1.358511, 0.5295831, 1, 1, 1, 1, 1,
0.7279046, 0.3211994, 0.4305152, 1, 1, 1, 1, 1,
0.7308838, -1.104579, 1.300235, 1, 1, 1, 1, 1,
0.733003, -0.9520487, 2.407092, 1, 1, 1, 1, 1,
0.7376072, 0.09127733, 1.582708, 1, 1, 1, 1, 1,
0.7405308, -1.762508, 4.071116, 1, 1, 1, 1, 1,
0.7413434, 1.786861, -0.06150102, 1, 1, 1, 1, 1,
0.7438871, 0.4826902, 1.862867, 1, 1, 1, 1, 1,
0.746028, 0.4735151, 1.938124, 0, 0, 1, 1, 1,
0.7482426, 0.9411261, 1.753422, 1, 0, 0, 1, 1,
0.7485762, 0.1056812, 1.851705, 1, 0, 0, 1, 1,
0.7520959, 0.4094728, 1.249127, 1, 0, 0, 1, 1,
0.7534453, 1.704255, 0.6516954, 1, 0, 0, 1, 1,
0.7622384, -1.394106, 2.421314, 1, 0, 0, 1, 1,
0.7663274, 0.5775144, 0.4998037, 0, 0, 0, 1, 1,
0.7673873, -0.08673317, 2.045585, 0, 0, 0, 1, 1,
0.7690632, 0.7754254, 1.006833, 0, 0, 0, 1, 1,
0.7698056, 2.712903, -0.04411897, 0, 0, 0, 1, 1,
0.7715788, -0.9828045, 2.510502, 0, 0, 0, 1, 1,
0.7779083, -2.050504, 4.84947, 0, 0, 0, 1, 1,
0.7802791, -0.7518457, 2.391893, 0, 0, 0, 1, 1,
0.7824993, 0.5480313, 0.3396829, 1, 1, 1, 1, 1,
0.7828133, -0.3238035, 1.503082, 1, 1, 1, 1, 1,
0.7936391, 0.1132739, 1.981026, 1, 1, 1, 1, 1,
0.7947231, -0.5964342, 1.407794, 1, 1, 1, 1, 1,
0.7962301, -0.9542436, 1.894867, 1, 1, 1, 1, 1,
0.7982478, 1.599967, 0.1114969, 1, 1, 1, 1, 1,
0.798909, 1.611784, 1.85627, 1, 1, 1, 1, 1,
0.799138, -1.275092, 1.226234, 1, 1, 1, 1, 1,
0.7997402, -0.1668217, 0.5444635, 1, 1, 1, 1, 1,
0.8042845, 1.031961, 2.113455, 1, 1, 1, 1, 1,
0.806047, 1.532514, 0.5933256, 1, 1, 1, 1, 1,
0.8102963, -0.6710082, 2.575166, 1, 1, 1, 1, 1,
0.8115256, -0.09583931, 1.06991, 1, 1, 1, 1, 1,
0.8124801, 1.104974, 2.232826, 1, 1, 1, 1, 1,
0.8200305, 1.502582, 0.6401526, 1, 1, 1, 1, 1,
0.8222508, 1.475911, 0.9394547, 0, 0, 1, 1, 1,
0.8230675, -0.3970301, 3.015552, 1, 0, 0, 1, 1,
0.8296621, 1.795299, 0.07439662, 1, 0, 0, 1, 1,
0.8299596, 1.183362, 0.1402367, 1, 0, 0, 1, 1,
0.8327433, -0.7337646, 3.598592, 1, 0, 0, 1, 1,
0.8354221, 0.3609762, 1.745755, 1, 0, 0, 1, 1,
0.8366464, 0.3995978, 1.02355, 0, 0, 0, 1, 1,
0.8380071, -1.126406, 0.586794, 0, 0, 0, 1, 1,
0.8467721, 0.1113052, 0.07086477, 0, 0, 0, 1, 1,
0.8479382, -2.167198, 3.047786, 0, 0, 0, 1, 1,
0.8501677, 0.005858175, 1.951923, 0, 0, 0, 1, 1,
0.8535683, -0.4526472, 1.145027, 0, 0, 0, 1, 1,
0.855536, -0.6408008, 1.129107, 0, 0, 0, 1, 1,
0.8580238, 0.1279883, 1.521194, 1, 1, 1, 1, 1,
0.8616006, -0.2319159, 1.337877, 1, 1, 1, 1, 1,
0.8642486, -1.118634, 2.439968, 1, 1, 1, 1, 1,
0.8701229, 0.08685557, -0.8639239, 1, 1, 1, 1, 1,
0.8732316, 0.5928972, 0.6053962, 1, 1, 1, 1, 1,
0.8765574, 0.04130732, 2.567223, 1, 1, 1, 1, 1,
0.879001, 2.764333, 0.4708499, 1, 1, 1, 1, 1,
0.8791817, 0.5195879, -1.38655, 1, 1, 1, 1, 1,
0.8828175, 1.282738, 1.177601, 1, 1, 1, 1, 1,
0.884503, 1.173968, 0.4261599, 1, 1, 1, 1, 1,
0.8859925, 1.705937, 0.3123755, 1, 1, 1, 1, 1,
0.8900664, -0.6770489, 2.645363, 1, 1, 1, 1, 1,
0.8904849, -0.09670565, 2.092489, 1, 1, 1, 1, 1,
0.8912656, 0.1819178, -0.06934719, 1, 1, 1, 1, 1,
0.8922102, -0.345805, 2.163643, 1, 1, 1, 1, 1,
0.896542, -0.6648934, 2.675256, 0, 0, 1, 1, 1,
0.9025903, -0.4546137, -0.346577, 1, 0, 0, 1, 1,
0.9030523, -1.333333, 0.2114113, 1, 0, 0, 1, 1,
0.9032958, 0.1676399, 1.064434, 1, 0, 0, 1, 1,
0.9060723, 0.5969248, 2.017664, 1, 0, 0, 1, 1,
0.9080579, 0.6437393, 0.1743014, 1, 0, 0, 1, 1,
0.9105486, -0.7446499, 1.782978, 0, 0, 0, 1, 1,
0.9109719, 1.479193, 2.117558, 0, 0, 0, 1, 1,
0.9321985, 0.2087377, 1.970189, 0, 0, 0, 1, 1,
0.9393122, -1.25132, 2.7686, 0, 0, 0, 1, 1,
0.9489741, -2.075824, 4.626195, 0, 0, 0, 1, 1,
0.9552178, 0.5213538, 0.6112457, 0, 0, 0, 1, 1,
0.9561262, 1.775086, 0.2473943, 0, 0, 0, 1, 1,
0.9589355, -0.3970597, 1.034163, 1, 1, 1, 1, 1,
0.9598013, 1.154769, 0.2199022, 1, 1, 1, 1, 1,
0.9603993, 0.7742416, 1.981654, 1, 1, 1, 1, 1,
0.9605165, -0.7558234, 2.563552, 1, 1, 1, 1, 1,
0.9616402, -0.5340568, 1.514081, 1, 1, 1, 1, 1,
0.9664809, 0.1128618, 0.2815704, 1, 1, 1, 1, 1,
0.9725012, 0.3750617, 1.771267, 1, 1, 1, 1, 1,
0.9778987, -0.1644736, 0.3674518, 1, 1, 1, 1, 1,
0.9832512, 2.352836, -0.2807403, 1, 1, 1, 1, 1,
0.9855455, -0.1543932, 0.8811494, 1, 1, 1, 1, 1,
0.9879955, 0.05419926, 3.694575, 1, 1, 1, 1, 1,
0.9903799, 1.296743, 0.7719653, 1, 1, 1, 1, 1,
0.9954112, 0.1854934, 3.627109, 1, 1, 1, 1, 1,
1.013481, -1.216831, 2.583434, 1, 1, 1, 1, 1,
1.018873, -0.1604276, 3.18415, 1, 1, 1, 1, 1,
1.019709, 1.348064, 0.03105628, 0, 0, 1, 1, 1,
1.021197, 1.289296, 1.986225, 1, 0, 0, 1, 1,
1.025965, 0.9015968, 1.33641, 1, 0, 0, 1, 1,
1.030331, -0.04340892, 0.1501134, 1, 0, 0, 1, 1,
1.034111, 0.01894675, 1.130326, 1, 0, 0, 1, 1,
1.035918, 2.025587, 0.09226099, 1, 0, 0, 1, 1,
1.035963, -1.144467, 1.779698, 0, 0, 0, 1, 1,
1.038719, 0.284963, 2.565391, 0, 0, 0, 1, 1,
1.040313, -0.05511575, 0.4467697, 0, 0, 0, 1, 1,
1.042619, -0.5331855, 1.905678, 0, 0, 0, 1, 1,
1.046358, 1.313206, -0.3794636, 0, 0, 0, 1, 1,
1.056916, 1.932805, -0.1685154, 0, 0, 0, 1, 1,
1.05919, -1.585123, 3.620372, 0, 0, 0, 1, 1,
1.064478, -0.03148261, 2.489921, 1, 1, 1, 1, 1,
1.066046, -0.8596954, 1.521704, 1, 1, 1, 1, 1,
1.071705, 0.1979071, 3.072305, 1, 1, 1, 1, 1,
1.089154, 1.027636, 0.2882438, 1, 1, 1, 1, 1,
1.091033, 0.4491372, 0.3817738, 1, 1, 1, 1, 1,
1.093385, 0.5696189, 1.814739, 1, 1, 1, 1, 1,
1.094959, -0.1531225, 2.461365, 1, 1, 1, 1, 1,
1.096006, 0.2914766, 1.239777, 1, 1, 1, 1, 1,
1.098757, -0.4721899, 2.693782, 1, 1, 1, 1, 1,
1.112705, -2.283925, 2.648012, 1, 1, 1, 1, 1,
1.118392, -1.345878, 1.680727, 1, 1, 1, 1, 1,
1.123641, -2.023649, 1.296632, 1, 1, 1, 1, 1,
1.124498, 0.1549703, 1.501353, 1, 1, 1, 1, 1,
1.128244, 0.2909358, 0.7891693, 1, 1, 1, 1, 1,
1.128271, -0.3458034, 0.3964205, 1, 1, 1, 1, 1,
1.134188, 0.3598811, 1.523337, 0, 0, 1, 1, 1,
1.1382, 0.0387006, 0.1993098, 1, 0, 0, 1, 1,
1.140045, -0.1191013, 2.280616, 1, 0, 0, 1, 1,
1.146879, -0.6040671, 2.989933, 1, 0, 0, 1, 1,
1.16731, -0.5672247, 0.9047084, 1, 0, 0, 1, 1,
1.169714, -0.637789, 1.759555, 1, 0, 0, 1, 1,
1.178094, 0.3417174, 1.454345, 0, 0, 0, 1, 1,
1.180269, 0.3662983, 1.586898, 0, 0, 0, 1, 1,
1.186629, -0.2313511, 1.69001, 0, 0, 0, 1, 1,
1.204639, -0.4248269, -0.08539218, 0, 0, 0, 1, 1,
1.205613, -0.1353302, 2.403919, 0, 0, 0, 1, 1,
1.207389, -0.2719699, 0.4051901, 0, 0, 0, 1, 1,
1.211577, -0.9428401, 0.9409672, 0, 0, 0, 1, 1,
1.212686, 0.1508047, 1.652304, 1, 1, 1, 1, 1,
1.216442, 2.024613, 0.1242068, 1, 1, 1, 1, 1,
1.216896, -0.848811, 2.375839, 1, 1, 1, 1, 1,
1.222962, -0.9698697, 1.854258, 1, 1, 1, 1, 1,
1.234277, -0.1658266, 0.73406, 1, 1, 1, 1, 1,
1.238851, -1.242641, 1.170454, 1, 1, 1, 1, 1,
1.249481, -1.378615, 3.286419, 1, 1, 1, 1, 1,
1.264033, 0.02539044, 0.5973043, 1, 1, 1, 1, 1,
1.264558, 1.553019, -0.684064, 1, 1, 1, 1, 1,
1.2749, -0.2596932, 1.990728, 1, 1, 1, 1, 1,
1.27603, -0.194256, 1.371812, 1, 1, 1, 1, 1,
1.28843, 2.003264, -0.3902595, 1, 1, 1, 1, 1,
1.289674, 1.413289, 2.35128, 1, 1, 1, 1, 1,
1.303586, 0.7346796, 0.4334416, 1, 1, 1, 1, 1,
1.305008, -0.006560962, 2.167666, 1, 1, 1, 1, 1,
1.306504, -0.3270954, 1.587895, 0, 0, 1, 1, 1,
1.307825, 2.070124, 0.9932802, 1, 0, 0, 1, 1,
1.309302, 0.6735495, 2.273558, 1, 0, 0, 1, 1,
1.310219, -1.167682, 1.749017, 1, 0, 0, 1, 1,
1.320662, -0.6118342, 1.645655, 1, 0, 0, 1, 1,
1.324609, 1.348257, -0.137739, 1, 0, 0, 1, 1,
1.354601, -1.429389, 2.550964, 0, 0, 0, 1, 1,
1.359247, -0.2080571, 3.218942, 0, 0, 0, 1, 1,
1.365442, 0.5811142, 1.351555, 0, 0, 0, 1, 1,
1.365842, 0.0929599, 1.600638, 0, 0, 0, 1, 1,
1.366969, -0.2282049, 2.058737, 0, 0, 0, 1, 1,
1.369517, -0.53402, 1.094438, 0, 0, 0, 1, 1,
1.369871, 0.4918371, 0.4977883, 0, 0, 0, 1, 1,
1.374663, 0.4006284, 0.5062561, 1, 1, 1, 1, 1,
1.376299, 0.2629932, 1.307087, 1, 1, 1, 1, 1,
1.379137, -0.5708323, 2.348521, 1, 1, 1, 1, 1,
1.385184, -0.2965534, 2.20439, 1, 1, 1, 1, 1,
1.386643, 0.3572521, -0.2764403, 1, 1, 1, 1, 1,
1.39545, -0.623928, 2.62298, 1, 1, 1, 1, 1,
1.402408, -1.029478, 4.485677, 1, 1, 1, 1, 1,
1.408713, 2.178702, -0.2733234, 1, 1, 1, 1, 1,
1.418044, 0.4241605, 0.03869582, 1, 1, 1, 1, 1,
1.418883, 0.2385794, 0.6384667, 1, 1, 1, 1, 1,
1.426119, -0.5087376, 2.053592, 1, 1, 1, 1, 1,
1.431408, 0.4733413, 0.4810188, 1, 1, 1, 1, 1,
1.436325, 0.08871008, 2.737813, 1, 1, 1, 1, 1,
1.436967, -0.06802023, 1.914159, 1, 1, 1, 1, 1,
1.442104, 0.09027576, 3.078699, 1, 1, 1, 1, 1,
1.442749, 0.01451175, 3.321735, 0, 0, 1, 1, 1,
1.452097, -1.595649, 2.534218, 1, 0, 0, 1, 1,
1.452579, -0.5929926, 3.790356, 1, 0, 0, 1, 1,
1.458668, -0.4979277, 1.282575, 1, 0, 0, 1, 1,
1.462212, -1.828831, 2.142867, 1, 0, 0, 1, 1,
1.477797, -1.320768, 2.770249, 1, 0, 0, 1, 1,
1.49106, -0.6655502, 2.006957, 0, 0, 0, 1, 1,
1.501546, 1.963264, 0.5706131, 0, 0, 0, 1, 1,
1.514028, -0.6644896, 2.87082, 0, 0, 0, 1, 1,
1.535441, -0.5397522, 1.388894, 0, 0, 0, 1, 1,
1.539166, -0.0902629, 3.590465, 0, 0, 0, 1, 1,
1.548457, -0.9229001, 2.799402, 0, 0, 0, 1, 1,
1.549061, 1.710413, 0.3173016, 0, 0, 0, 1, 1,
1.550434, -0.572672, 2.419359, 1, 1, 1, 1, 1,
1.553587, -0.1993282, 3.261044, 1, 1, 1, 1, 1,
1.553788, 0.7751727, 1.473535, 1, 1, 1, 1, 1,
1.564862, 1.347464, -0.4239836, 1, 1, 1, 1, 1,
1.566983, -1.338489, 2.284381, 1, 1, 1, 1, 1,
1.573644, -0.839589, 2.379174, 1, 1, 1, 1, 1,
1.582555, -0.9167864, 3.4477, 1, 1, 1, 1, 1,
1.591938, -1.24847, 3.340168, 1, 1, 1, 1, 1,
1.601199, -0.7340721, 1.799207, 1, 1, 1, 1, 1,
1.622667, 0.3878828, 1.903105, 1, 1, 1, 1, 1,
1.636068, 1.249581, 0.6634706, 1, 1, 1, 1, 1,
1.639441, -1.054182, 1.491797, 1, 1, 1, 1, 1,
1.66745, -0.09696243, 0.6122067, 1, 1, 1, 1, 1,
1.672123, -1.51867, 2.589098, 1, 1, 1, 1, 1,
1.683781, 1.323771, -0.4414295, 1, 1, 1, 1, 1,
1.688923, -0.3890269, 2.563545, 0, 0, 1, 1, 1,
1.696812, 0.3035783, 3.441253, 1, 0, 0, 1, 1,
1.70524, -0.2252144, 2.759975, 1, 0, 0, 1, 1,
1.711288, -0.04440195, 2.321913, 1, 0, 0, 1, 1,
1.715812, 0.6496978, 0.8250392, 1, 0, 0, 1, 1,
1.720908, -1.740919, 2.044143, 1, 0, 0, 1, 1,
1.726738, -1.004292, 2.467285, 0, 0, 0, 1, 1,
1.736452, -1.194881, 3.034801, 0, 0, 0, 1, 1,
1.766317, 1.20619, -0.4604688, 0, 0, 0, 1, 1,
1.776403, 1.143077, 0.09404024, 0, 0, 0, 1, 1,
1.795725, 1.063551, 0.02180047, 0, 0, 0, 1, 1,
1.80373, 1.460885, 1.684268, 0, 0, 0, 1, 1,
1.813492, 1.168351, 0.6172238, 0, 0, 0, 1, 1,
1.833022, 0.6697756, -2.103936, 1, 1, 1, 1, 1,
1.839858, 1.56851, 1.234009, 1, 1, 1, 1, 1,
1.852405, 0.8423925, 2.42283, 1, 1, 1, 1, 1,
1.853686, -1.674489, 2.867404, 1, 1, 1, 1, 1,
1.875983, -0.8486993, 1.647696, 1, 1, 1, 1, 1,
1.899395, 0.5791097, 2.555144, 1, 1, 1, 1, 1,
1.907786, -1.284197, 1.599282, 1, 1, 1, 1, 1,
1.929247, -0.5509346, 2.070502, 1, 1, 1, 1, 1,
1.932743, -0.3287037, 2.32498, 1, 1, 1, 1, 1,
1.955752, -0.9708057, 2.782838, 1, 1, 1, 1, 1,
2.001767, 0.2705755, 0.5744895, 1, 1, 1, 1, 1,
2.023228, 0.9363684, 0.02813354, 1, 1, 1, 1, 1,
2.067739, 1.633341, 1.727612, 1, 1, 1, 1, 1,
2.095784, -0.3924964, 1.629096, 1, 1, 1, 1, 1,
2.101437, -0.005485766, 1.288268, 1, 1, 1, 1, 1,
2.107531, 0.3924154, 1.089213, 0, 0, 1, 1, 1,
2.123056, 0.3179126, 1.687519, 1, 0, 0, 1, 1,
2.183592, -1.530619, 1.854889, 1, 0, 0, 1, 1,
2.215102, -0.2262486, 4.488698, 1, 0, 0, 1, 1,
2.240541, 1.41693, 1.353504, 1, 0, 0, 1, 1,
2.269371, -0.3140179, 1.615186, 1, 0, 0, 1, 1,
2.277959, -0.6807314, 0.6775948, 0, 0, 0, 1, 1,
2.295059, -0.1533785, 0.7797667, 0, 0, 0, 1, 1,
2.3057, 0.4238192, 1.297819, 0, 0, 0, 1, 1,
2.315658, 0.5672342, -0.5192502, 0, 0, 0, 1, 1,
2.34397, -0.1485554, 2.075123, 0, 0, 0, 1, 1,
2.392978, -0.630833, 3.388217, 0, 0, 0, 1, 1,
2.425668, 1.424556, 1.7308, 0, 0, 0, 1, 1,
2.441621, 0.2906536, 0.3596401, 1, 1, 1, 1, 1,
2.483933, 0.4049263, 1.447899, 1, 1, 1, 1, 1,
2.500486, -0.3596, 2.440899, 1, 1, 1, 1, 1,
2.549735, 0.1174698, 0.4171603, 1, 1, 1, 1, 1,
2.584212, -1.200601, 2.174169, 1, 1, 1, 1, 1,
2.589566, 0.05575894, 0.8511721, 1, 1, 1, 1, 1,
3.029516, -0.1324652, 2.082912, 1, 1, 1, 1, 1
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
var radius = 9.223618;
var distance = 32.39757;
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
mvMatrix.translate( 0.1764355, -0.2389491, -0.01094127 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.39757);
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
