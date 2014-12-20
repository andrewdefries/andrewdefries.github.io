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
-3.21732, -0.1727517, -1.437665, 1, 0, 0, 1,
-3.166931, 0.5959592, 0.07595189, 1, 0.007843138, 0, 1,
-3.026938, -0.7767331, -2.443011, 1, 0.01176471, 0, 1,
-3.016026, -0.445743, -4.016369, 1, 0.01960784, 0, 1,
-2.96645, 0.3853981, -0.3140507, 1, 0.02352941, 0, 1,
-2.957904, -0.4635595, -1.74744, 1, 0.03137255, 0, 1,
-2.880672, -1.111774, -1.453994, 1, 0.03529412, 0, 1,
-2.855522, -1.450491, -1.262949, 1, 0.04313726, 0, 1,
-2.701723, -1.381855, -2.14905, 1, 0.04705882, 0, 1,
-2.558992, 1.800931, -0.8843291, 1, 0.05490196, 0, 1,
-2.542522, -1.83121, -2.433084, 1, 0.05882353, 0, 1,
-2.528421, -0.4414232, -0.7832657, 1, 0.06666667, 0, 1,
-2.514031, 0.7012685, -0.1953476, 1, 0.07058824, 0, 1,
-2.334701, -0.7310055, -2.34888, 1, 0.07843138, 0, 1,
-2.282312, -1.225828, -0.5920658, 1, 0.08235294, 0, 1,
-2.219988, 0.592292, -1.218594, 1, 0.09019608, 0, 1,
-2.211358, 0.4299334, -2.464705, 1, 0.09411765, 0, 1,
-2.203068, -0.4399662, -1.403819, 1, 0.1019608, 0, 1,
-2.164673, 0.229201, -1.602866, 1, 0.1098039, 0, 1,
-2.104851, 0.909867, -0.9344787, 1, 0.1137255, 0, 1,
-2.097636, 0.4165488, -2.19175, 1, 0.1215686, 0, 1,
-2.077201, 0.350119, -0.04630971, 1, 0.1254902, 0, 1,
-2.027114, -1.274825, -2.022982, 1, 0.1333333, 0, 1,
-1.9991, -0.8390807, -2.811322, 1, 0.1372549, 0, 1,
-1.987233, 0.0728264, -2.77458, 1, 0.145098, 0, 1,
-1.9861, 0.2225118, -2.009246, 1, 0.1490196, 0, 1,
-1.953849, -0.698765, -2.70147, 1, 0.1568628, 0, 1,
-1.911972, -0.4282853, -1.561625, 1, 0.1607843, 0, 1,
-1.905081, -0.05907972, -2.140802, 1, 0.1686275, 0, 1,
-1.882303, -0.3575157, -2.603435, 1, 0.172549, 0, 1,
-1.865651, 0.3527806, -1.765345, 1, 0.1803922, 0, 1,
-1.845829, 0.836065, -1.242879, 1, 0.1843137, 0, 1,
-1.823835, 1.482458, -0.9989867, 1, 0.1921569, 0, 1,
-1.815311, -1.927579, -1.129854, 1, 0.1960784, 0, 1,
-1.813245, 2.042166, -0.5591375, 1, 0.2039216, 0, 1,
-1.793112, -0.7761813, -1.012532, 1, 0.2117647, 0, 1,
-1.789756, -1.125225, -2.903644, 1, 0.2156863, 0, 1,
-1.784219, 0.845751, -1.829404, 1, 0.2235294, 0, 1,
-1.775457, -1.202195, -2.206106, 1, 0.227451, 0, 1,
-1.775448, -0.2928796, -1.676017, 1, 0.2352941, 0, 1,
-1.771647, 1.800873, -0.1762686, 1, 0.2392157, 0, 1,
-1.766125, -0.5861579, -3.15949, 1, 0.2470588, 0, 1,
-1.765951, 1.992245, -0.7144881, 1, 0.2509804, 0, 1,
-1.764191, -0.3093964, -3.247379, 1, 0.2588235, 0, 1,
-1.742339, -2.664951, -0.1101506, 1, 0.2627451, 0, 1,
-1.733975, 1.299774, 0.8924297, 1, 0.2705882, 0, 1,
-1.732572, 0.3094596, -2.691365, 1, 0.2745098, 0, 1,
-1.731007, -0.6032935, -3.968666, 1, 0.282353, 0, 1,
-1.713385, 0.3014733, -2.093087, 1, 0.2862745, 0, 1,
-1.70689, 0.6349391, -0.5587553, 1, 0.2941177, 0, 1,
-1.69134, -1.619406, -3.813915, 1, 0.3019608, 0, 1,
-1.685489, -0.6104306, -2.629064, 1, 0.3058824, 0, 1,
-1.676076, -0.2868013, -2.391941, 1, 0.3137255, 0, 1,
-1.67408, 0.6010438, -0.7498586, 1, 0.3176471, 0, 1,
-1.662912, -0.3815811, -1.737955, 1, 0.3254902, 0, 1,
-1.660771, 0.7106697, -1.244254, 1, 0.3294118, 0, 1,
-1.641704, 1.663536, -0.5002468, 1, 0.3372549, 0, 1,
-1.629121, -0.09886231, -1.058197, 1, 0.3411765, 0, 1,
-1.614158, 0.5438492, -1.269934, 1, 0.3490196, 0, 1,
-1.583624, 0.1572802, -0.2533328, 1, 0.3529412, 0, 1,
-1.575579, 0.1308163, -2.091156, 1, 0.3607843, 0, 1,
-1.565524, -1.23327, -2.414664, 1, 0.3647059, 0, 1,
-1.565065, -1.129527, -4.235103, 1, 0.372549, 0, 1,
-1.55422, -2.57111, -1.112876, 1, 0.3764706, 0, 1,
-1.53741, -1.585292, -1.219036, 1, 0.3843137, 0, 1,
-1.533162, 0.7219917, -1.368368, 1, 0.3882353, 0, 1,
-1.525872, 0.4610063, -0.4899743, 1, 0.3960784, 0, 1,
-1.515761, 1.166239, -0.9208524, 1, 0.4039216, 0, 1,
-1.511218, 0.03578463, -0.9877425, 1, 0.4078431, 0, 1,
-1.505805, 1.111106, -1.07607, 1, 0.4156863, 0, 1,
-1.501987, -0.1855447, -1.131074, 1, 0.4196078, 0, 1,
-1.490765, -0.4066237, -0.3483722, 1, 0.427451, 0, 1,
-1.483281, 0.822057, -1.589027, 1, 0.4313726, 0, 1,
-1.468011, 0.4890001, -0.4165337, 1, 0.4392157, 0, 1,
-1.467829, -0.0195142, -2.145442, 1, 0.4431373, 0, 1,
-1.447683, -0.4404881, -3.606082, 1, 0.4509804, 0, 1,
-1.436346, -0.1525564, -1.900058, 1, 0.454902, 0, 1,
-1.43386, -1.400997, -2.560804, 1, 0.4627451, 0, 1,
-1.432177, 0.001004997, -0.7931163, 1, 0.4666667, 0, 1,
-1.429539, 0.1574598, -0.236764, 1, 0.4745098, 0, 1,
-1.428201, -1.228292, -2.234825, 1, 0.4784314, 0, 1,
-1.420318, 1.090404, -0.3780109, 1, 0.4862745, 0, 1,
-1.419834, 1.727639, -1.776152, 1, 0.4901961, 0, 1,
-1.414497, 0.9268064, -0.7735083, 1, 0.4980392, 0, 1,
-1.38932, 1.017573, -0.7517037, 1, 0.5058824, 0, 1,
-1.351686, -0.2195641, -2.343198, 1, 0.509804, 0, 1,
-1.344653, 1.755975, -0.9471812, 1, 0.5176471, 0, 1,
-1.333227, 1.998913, -1.50965, 1, 0.5215687, 0, 1,
-1.324274, 0.5727473, -1.101317, 1, 0.5294118, 0, 1,
-1.320522, -0.6136343, -2.405785, 1, 0.5333334, 0, 1,
-1.31586, -0.1200282, -3.647915, 1, 0.5411765, 0, 1,
-1.314145, 1.224014, 1.517366, 1, 0.5450981, 0, 1,
-1.312447, 1.266659, -1.171453, 1, 0.5529412, 0, 1,
-1.305028, 1.96767, -1.00616, 1, 0.5568628, 0, 1,
-1.302849, -0.01245479, -2.531475, 1, 0.5647059, 0, 1,
-1.299469, 0.3790336, -2.051045, 1, 0.5686275, 0, 1,
-1.290003, 2.309313, -0.8834973, 1, 0.5764706, 0, 1,
-1.288441, -0.5576234, -3.154469, 1, 0.5803922, 0, 1,
-1.277477, 1.80879, -0.4770127, 1, 0.5882353, 0, 1,
-1.276485, 0.2541937, -0.3677047, 1, 0.5921569, 0, 1,
-1.265973, -0.6700872, -1.146332, 1, 0.6, 0, 1,
-1.2576, 0.7012947, -1.681691, 1, 0.6078432, 0, 1,
-1.247475, 0.006497778, -2.169996, 1, 0.6117647, 0, 1,
-1.24606, -0.974538, -3.334854, 1, 0.6196079, 0, 1,
-1.244456, 0.5144626, -1.624461, 1, 0.6235294, 0, 1,
-1.23971, -1.81057, -2.45979, 1, 0.6313726, 0, 1,
-1.235965, -0.6291333, -4.608601, 1, 0.6352941, 0, 1,
-1.235616, 1.872379, 1.499712, 1, 0.6431373, 0, 1,
-1.21828, 1.397926, 0.1403856, 1, 0.6470588, 0, 1,
-1.213626, 1.762275, -0.5392117, 1, 0.654902, 0, 1,
-1.211986, -0.8968741, -2.363779, 1, 0.6588235, 0, 1,
-1.211663, -0.7408903, -1.534164, 1, 0.6666667, 0, 1,
-1.204901, -0.6795839, -2.555217, 1, 0.6705883, 0, 1,
-1.199841, -0.6206432, -3.122368, 1, 0.6784314, 0, 1,
-1.198204, -1.461713, -3.799136, 1, 0.682353, 0, 1,
-1.195169, 2.022843, 0.9717048, 1, 0.6901961, 0, 1,
-1.193722, 0.5141211, -3.534606, 1, 0.6941177, 0, 1,
-1.191355, -1.214127, -1.251609, 1, 0.7019608, 0, 1,
-1.184915, 2.179961, 0.6590551, 1, 0.7098039, 0, 1,
-1.183161, 2.174526, -1.100514, 1, 0.7137255, 0, 1,
-1.181962, -1.091261, -2.114779, 1, 0.7215686, 0, 1,
-1.17716, -0.8345975, -3.10072, 1, 0.7254902, 0, 1,
-1.170312, -0.2270341, -2.236162, 1, 0.7333333, 0, 1,
-1.161079, -0.3100466, -1.328671, 1, 0.7372549, 0, 1,
-1.158761, 1.968156, -0.2322428, 1, 0.7450981, 0, 1,
-1.15541, 0.9738991, 0.1173749, 1, 0.7490196, 0, 1,
-1.151913, -1.019649, -3.150618, 1, 0.7568628, 0, 1,
-1.148365, -1.708458, -3.471879, 1, 0.7607843, 0, 1,
-1.142138, -0.006524651, -0.8364097, 1, 0.7686275, 0, 1,
-1.140693, 1.033213, -2.156571, 1, 0.772549, 0, 1,
-1.139894, -0.6685773, -2.683817, 1, 0.7803922, 0, 1,
-1.136597, -0.8864285, -1.966721, 1, 0.7843137, 0, 1,
-1.131329, -1.28176, -4.146125, 1, 0.7921569, 0, 1,
-1.118245, -0.6328807, -2.691782, 1, 0.7960784, 0, 1,
-1.11728, -0.1542222, -1.417777, 1, 0.8039216, 0, 1,
-1.105039, -1.69476, -1.241289, 1, 0.8117647, 0, 1,
-1.103518, -1.665192, -2.540759, 1, 0.8156863, 0, 1,
-1.101972, -1.115805, -3.518424, 1, 0.8235294, 0, 1,
-1.099438, -0.6970625, -3.48004, 1, 0.827451, 0, 1,
-1.099068, 0.1805691, -1.596716, 1, 0.8352941, 0, 1,
-1.097817, 1.382077, -2.981557, 1, 0.8392157, 0, 1,
-1.084851, -1.236762, -3.439528, 1, 0.8470588, 0, 1,
-1.084435, 0.5747489, -1.372726, 1, 0.8509804, 0, 1,
-1.07503, -0.3870091, -2.337335, 1, 0.8588235, 0, 1,
-1.070637, 1.103447, 0.7158768, 1, 0.8627451, 0, 1,
-1.069771, 0.3838012, -2.024408, 1, 0.8705882, 0, 1,
-1.067495, -0.5237871, -0.5727296, 1, 0.8745098, 0, 1,
-1.061681, 0.05802999, -1.690777, 1, 0.8823529, 0, 1,
-1.050995, 0.3278716, -1.676574, 1, 0.8862745, 0, 1,
-1.048556, 0.0008015545, -1.970784, 1, 0.8941177, 0, 1,
-1.04771, 0.9174699, -0.5574062, 1, 0.8980392, 0, 1,
-1.041306, 0.8057471, 0.2365805, 1, 0.9058824, 0, 1,
-1.033693, -0.1679934, -1.862008, 1, 0.9137255, 0, 1,
-1.032365, 1.248319, -1.223015, 1, 0.9176471, 0, 1,
-1.030653, 1.472419, 0.943468, 1, 0.9254902, 0, 1,
-1.027138, -0.7507465, -2.571114, 1, 0.9294118, 0, 1,
-1.025664, 0.4009606, -0.8625333, 1, 0.9372549, 0, 1,
-1.023938, -0.7046968, -1.304174, 1, 0.9411765, 0, 1,
-1.022175, 0.4926147, -0.4462897, 1, 0.9490196, 0, 1,
-1.013188, -0.9472392, -2.244295, 1, 0.9529412, 0, 1,
-1.012177, -0.1353714, -1.530145, 1, 0.9607843, 0, 1,
-1.011842, -0.947242, -2.899703, 1, 0.9647059, 0, 1,
-0.9988244, -0.881627, -2.560277, 1, 0.972549, 0, 1,
-0.989673, 0.3170855, -1.581905, 1, 0.9764706, 0, 1,
-0.9883848, 1.038246, -1.08883, 1, 0.9843137, 0, 1,
-0.9792813, 0.8232412, -0.5276945, 1, 0.9882353, 0, 1,
-0.9720724, -1.641417, -3.801069, 1, 0.9960784, 0, 1,
-0.9694102, 0.6590742, -1.869252, 0.9960784, 1, 0, 1,
-0.9667636, -0.1750872, -2.629506, 0.9921569, 1, 0, 1,
-0.956261, -0.08256988, -2.06884, 0.9843137, 1, 0, 1,
-0.9554696, -1.28731, -2.207123, 0.9803922, 1, 0, 1,
-0.952765, 0.5966122, -0.8565595, 0.972549, 1, 0, 1,
-0.9518292, 0.9171254, -1.294525, 0.9686275, 1, 0, 1,
-0.9282079, -1.592347, -4.166818, 0.9607843, 1, 0, 1,
-0.9273075, 0.4879539, -3.294244, 0.9568627, 1, 0, 1,
-0.9243637, 1.708895, -0.09753683, 0.9490196, 1, 0, 1,
-0.9201701, -0.8301567, -3.407984, 0.945098, 1, 0, 1,
-0.9070147, -0.9991518, -1.55764, 0.9372549, 1, 0, 1,
-0.9063054, -1.067381, -1.5062, 0.9333333, 1, 0, 1,
-0.9034826, -1.512469, -3.798216, 0.9254902, 1, 0, 1,
-0.9025573, -0.1277279, -2.143495, 0.9215686, 1, 0, 1,
-0.9022388, 0.07155915, -1.94474, 0.9137255, 1, 0, 1,
-0.901026, 0.4943038, -0.2117374, 0.9098039, 1, 0, 1,
-0.8918426, 0.02933361, -3.127699, 0.9019608, 1, 0, 1,
-0.8898422, -0.2375883, -1.401302, 0.8941177, 1, 0, 1,
-0.8895226, 0.6344951, 0.3564261, 0.8901961, 1, 0, 1,
-0.8871886, -0.7252856, -1.127934, 0.8823529, 1, 0, 1,
-0.8827886, 0.9272504, 0.3348186, 0.8784314, 1, 0, 1,
-0.8805923, -0.09326615, -0.4884942, 0.8705882, 1, 0, 1,
-0.8802207, 0.1221668, -0.9141077, 0.8666667, 1, 0, 1,
-0.87981, -1.154473, -2.805322, 0.8588235, 1, 0, 1,
-0.8793148, 0.4494951, 1.533741, 0.854902, 1, 0, 1,
-0.8738371, 1.46732, -0.399002, 0.8470588, 1, 0, 1,
-0.8675401, -0.5524793, -1.461007, 0.8431373, 1, 0, 1,
-0.8613923, -0.7507725, -2.412738, 0.8352941, 1, 0, 1,
-0.8592095, 0.3058124, -1.497113, 0.8313726, 1, 0, 1,
-0.8568117, -0.2888759, -2.706605, 0.8235294, 1, 0, 1,
-0.8563151, 0.3143977, -1.476269, 0.8196079, 1, 0, 1,
-0.8441975, -0.3548076, -1.994751, 0.8117647, 1, 0, 1,
-0.8419534, -0.957488, -1.736282, 0.8078431, 1, 0, 1,
-0.8393523, -0.3991098, -2.570413, 0.8, 1, 0, 1,
-0.8374388, -0.100382, -1.243626, 0.7921569, 1, 0, 1,
-0.8331714, -0.2034627, -1.645308, 0.7882353, 1, 0, 1,
-0.8328487, -1.881856, -2.643937, 0.7803922, 1, 0, 1,
-0.8324835, 0.7058578, -1.273411, 0.7764706, 1, 0, 1,
-0.8321073, -0.3937337, -2.465475, 0.7686275, 1, 0, 1,
-0.8245195, -1.181031, -0.974632, 0.7647059, 1, 0, 1,
-0.8199611, 0.8643771, -0.6817693, 0.7568628, 1, 0, 1,
-0.8184263, -0.1990899, -2.163322, 0.7529412, 1, 0, 1,
-0.8109091, 0.5846715, -0.9087784, 0.7450981, 1, 0, 1,
-0.8073493, 0.4123443, -3.355032, 0.7411765, 1, 0, 1,
-0.7991993, -1.45337, -1.565512, 0.7333333, 1, 0, 1,
-0.7989247, -0.2733579, -1.177446, 0.7294118, 1, 0, 1,
-0.7969957, -0.4869278, -2.485248, 0.7215686, 1, 0, 1,
-0.7966861, -0.4441192, -3.596854, 0.7176471, 1, 0, 1,
-0.7956094, 0.1851401, -1.576397, 0.7098039, 1, 0, 1,
-0.792344, -0.3438134, -3.043203, 0.7058824, 1, 0, 1,
-0.7920218, -1.97683, -2.699843, 0.6980392, 1, 0, 1,
-0.7900336, -0.3784448, -3.846483, 0.6901961, 1, 0, 1,
-0.7889812, 0.4818628, -0.4901127, 0.6862745, 1, 0, 1,
-0.7833059, 0.5920816, 0.3964121, 0.6784314, 1, 0, 1,
-0.7824547, 1.175254, 0.553887, 0.6745098, 1, 0, 1,
-0.7819383, 2.215642, 1.627618, 0.6666667, 1, 0, 1,
-0.7776247, -0.5914869, -1.963174, 0.6627451, 1, 0, 1,
-0.7664976, 0.3806873, -1.851553, 0.654902, 1, 0, 1,
-0.7618451, -0.3825019, -2.370427, 0.6509804, 1, 0, 1,
-0.7601683, -1.776509, -3.329768, 0.6431373, 1, 0, 1,
-0.7596616, 0.8693898, -0.74512, 0.6392157, 1, 0, 1,
-0.7545294, 0.376512, -2.179723, 0.6313726, 1, 0, 1,
-0.7437015, 0.6538894, -0.1239636, 0.627451, 1, 0, 1,
-0.7391236, -0.9261217, -1.989995, 0.6196079, 1, 0, 1,
-0.7375649, -0.918976, -1.46144, 0.6156863, 1, 0, 1,
-0.7341962, -0.1647493, -2.434337, 0.6078432, 1, 0, 1,
-0.7260572, 0.7626594, -0.196402, 0.6039216, 1, 0, 1,
-0.7198491, 0.2641011, -1.566842, 0.5960785, 1, 0, 1,
-0.7195663, -0.07424788, -0.7616208, 0.5882353, 1, 0, 1,
-0.7145363, -0.5603582, -3.830659, 0.5843138, 1, 0, 1,
-0.7140256, -1.586338, -3.441458, 0.5764706, 1, 0, 1,
-0.7120598, 0.6217229, -0.486753, 0.572549, 1, 0, 1,
-0.7067861, -0.02998174, -0.4229048, 0.5647059, 1, 0, 1,
-0.7000048, 0.2633379, 0.1350783, 0.5607843, 1, 0, 1,
-0.6984159, -1.545195, -3.454945, 0.5529412, 1, 0, 1,
-0.6967285, 0.003588341, -1.96062, 0.5490196, 1, 0, 1,
-0.6951682, -0.281893, -2.685225, 0.5411765, 1, 0, 1,
-0.6935945, -0.05513369, -2.707687, 0.5372549, 1, 0, 1,
-0.6917806, 1.720941, -0.3789148, 0.5294118, 1, 0, 1,
-0.6910689, 0.2694936, -1.06251, 0.5254902, 1, 0, 1,
-0.6883572, -0.2945247, 0.1157777, 0.5176471, 1, 0, 1,
-0.6875597, 0.1179376, -1.857015, 0.5137255, 1, 0, 1,
-0.6863602, 0.3821011, 0.515689, 0.5058824, 1, 0, 1,
-0.6858381, -0.5435363, -0.7292314, 0.5019608, 1, 0, 1,
-0.6820443, -1.140022, -2.683977, 0.4941176, 1, 0, 1,
-0.6816992, -2.286664, -1.126624, 0.4862745, 1, 0, 1,
-0.6802685, 0.9099562, 0.4291854, 0.4823529, 1, 0, 1,
-0.6760499, 0.4739279, 0.5181466, 0.4745098, 1, 0, 1,
-0.6748762, -0.5241573, -1.511901, 0.4705882, 1, 0, 1,
-0.6734579, 1.181637, -1.011725, 0.4627451, 1, 0, 1,
-0.6703097, 0.731321, 0.1774197, 0.4588235, 1, 0, 1,
-0.6683542, -0.811235, -0.3314561, 0.4509804, 1, 0, 1,
-0.663206, -0.008149796, -0.8854226, 0.4470588, 1, 0, 1,
-0.6612244, 1.271296, 0.5568706, 0.4392157, 1, 0, 1,
-0.6520339, -1.304499, -3.222775, 0.4352941, 1, 0, 1,
-0.6476414, 1.203836, -1.977614, 0.427451, 1, 0, 1,
-0.6445969, 0.05649587, -3.468557, 0.4235294, 1, 0, 1,
-0.6426414, -0.3090688, -3.285222, 0.4156863, 1, 0, 1,
-0.6408679, -2.459984, -2.600782, 0.4117647, 1, 0, 1,
-0.6407777, 0.4317497, -0.9844379, 0.4039216, 1, 0, 1,
-0.6402527, -0.1240996, -2.928564, 0.3960784, 1, 0, 1,
-0.6401223, -0.09300267, -2.721637, 0.3921569, 1, 0, 1,
-0.6382523, -0.6375979, -3.23016, 0.3843137, 1, 0, 1,
-0.6382361, -0.04694902, 0.592571, 0.3803922, 1, 0, 1,
-0.6361628, -1.131262, -2.027877, 0.372549, 1, 0, 1,
-0.6358588, -1.466546, -3.642769, 0.3686275, 1, 0, 1,
-0.6330007, -1.390511, -2.541951, 0.3607843, 1, 0, 1,
-0.6300965, -0.2401117, -1.474031, 0.3568628, 1, 0, 1,
-0.6262197, 0.6446527, -1.325714, 0.3490196, 1, 0, 1,
-0.6250458, -0.1038498, -3.165716, 0.345098, 1, 0, 1,
-0.6223365, -1.124936, -2.447051, 0.3372549, 1, 0, 1,
-0.6223209, -0.005862603, -2.023675, 0.3333333, 1, 0, 1,
-0.6211502, -0.2338146, -0.7194187, 0.3254902, 1, 0, 1,
-0.6153855, -0.3186638, -2.878011, 0.3215686, 1, 0, 1,
-0.6143425, -0.5421287, -1.007844, 0.3137255, 1, 0, 1,
-0.6084753, 1.506733, -0.2781975, 0.3098039, 1, 0, 1,
-0.6058703, -0.05175232, 0.1173676, 0.3019608, 1, 0, 1,
-0.603862, -0.5144066, -1.466684, 0.2941177, 1, 0, 1,
-0.6034864, 2.487858, 0.2580126, 0.2901961, 1, 0, 1,
-0.5989791, -1.228684, -4.930256, 0.282353, 1, 0, 1,
-0.5930532, 0.77648, -0.5711384, 0.2784314, 1, 0, 1,
-0.5920158, -0.1876842, -1.903476, 0.2705882, 1, 0, 1,
-0.5907313, -0.3553302, -3.146424, 0.2666667, 1, 0, 1,
-0.5874038, 0.4403162, -1.398215, 0.2588235, 1, 0, 1,
-0.586378, 0.546845, -0.6892961, 0.254902, 1, 0, 1,
-0.5820076, -0.3009038, -3.822779, 0.2470588, 1, 0, 1,
-0.5799672, -0.1567393, -0.777145, 0.2431373, 1, 0, 1,
-0.579191, -1.202518, -0.09429217, 0.2352941, 1, 0, 1,
-0.578245, -0.07433718, -2.456327, 0.2313726, 1, 0, 1,
-0.5752047, 0.6516444, -2.179119, 0.2235294, 1, 0, 1,
-0.5741981, -0.2999093, -3.630202, 0.2196078, 1, 0, 1,
-0.5733346, -0.88313, -2.135118, 0.2117647, 1, 0, 1,
-0.5720381, -0.3833369, -1.866081, 0.2078431, 1, 0, 1,
-0.5680045, 0.05189688, 0.7470133, 0.2, 1, 0, 1,
-0.5676905, -1.32872, -2.772512, 0.1921569, 1, 0, 1,
-0.566747, 0.8776322, -1.699694, 0.1882353, 1, 0, 1,
-0.5595438, 0.2929052, -2.49838, 0.1803922, 1, 0, 1,
-0.5516834, 1.012394, -1.240633, 0.1764706, 1, 0, 1,
-0.5513119, -1.204202, -3.203934, 0.1686275, 1, 0, 1,
-0.5444456, -0.9512616, -1.520278, 0.1647059, 1, 0, 1,
-0.5386519, 0.3019297, -0.05373374, 0.1568628, 1, 0, 1,
-0.5367659, -0.8740907, -2.687698, 0.1529412, 1, 0, 1,
-0.5329832, 1.292149, -0.2019963, 0.145098, 1, 0, 1,
-0.5316826, -0.7237974, -2.034438, 0.1411765, 1, 0, 1,
-0.5300739, 1.157095, 0.2582218, 0.1333333, 1, 0, 1,
-0.5293153, -1.730374, -4.6177, 0.1294118, 1, 0, 1,
-0.5246507, 0.9866586, -0.7315464, 0.1215686, 1, 0, 1,
-0.5230107, 0.142416, -0.1217034, 0.1176471, 1, 0, 1,
-0.5145072, 0.4150895, 0.04161335, 0.1098039, 1, 0, 1,
-0.5102831, -0.7138988, -2.104442, 0.1058824, 1, 0, 1,
-0.5102171, -1.48756, -3.43766, 0.09803922, 1, 0, 1,
-0.5083187, -0.7408431, -3.158327, 0.09019608, 1, 0, 1,
-0.5061446, -0.6019083, -2.654979, 0.08627451, 1, 0, 1,
-0.5029107, 1.653615, -1.201868, 0.07843138, 1, 0, 1,
-0.5026454, 0.360992, 0.2446368, 0.07450981, 1, 0, 1,
-0.4973122, 0.3559476, -2.207566, 0.06666667, 1, 0, 1,
-0.490084, -1.664668, -2.215487, 0.0627451, 1, 0, 1,
-0.4875841, -1.224894, -2.548119, 0.05490196, 1, 0, 1,
-0.486866, -0.6920785, -3.157451, 0.05098039, 1, 0, 1,
-0.4633556, 1.152571, -1.400358, 0.04313726, 1, 0, 1,
-0.4629477, 1.976594, 0.3555815, 0.03921569, 1, 0, 1,
-0.4607804, -0.4944185, -2.541725, 0.03137255, 1, 0, 1,
-0.4592402, -1.7322, -3.858221, 0.02745098, 1, 0, 1,
-0.4586323, 0.7898996, -0.8535557, 0.01960784, 1, 0, 1,
-0.456784, 1.440242, -0.5496256, 0.01568628, 1, 0, 1,
-0.4457122, -1.324031, -3.598868, 0.007843138, 1, 0, 1,
-0.4405805, -0.1384729, -0.195379, 0.003921569, 1, 0, 1,
-0.4387331, -0.1431038, -0.5723451, 0, 1, 0.003921569, 1,
-0.4342626, 0.4638395, -1.833336, 0, 1, 0.01176471, 1,
-0.4300385, -1.228253, -4.154732, 0, 1, 0.01568628, 1,
-0.4228081, 0.9934978, -0.9398901, 0, 1, 0.02352941, 1,
-0.4223886, -0.3345086, -1.349852, 0, 1, 0.02745098, 1,
-0.4193527, 0.06532748, -2.289728, 0, 1, 0.03529412, 1,
-0.4186172, -1.161084, -5.011101, 0, 1, 0.03921569, 1,
-0.4167651, 1.210631, -2.292165, 0, 1, 0.04705882, 1,
-0.4102789, 0.2160321, -0.4533062, 0, 1, 0.05098039, 1,
-0.4086821, 0.4994261, 0.7814214, 0, 1, 0.05882353, 1,
-0.4085124, 1.030879, 0.04772589, 0, 1, 0.0627451, 1,
-0.4062736, -1.359042, -2.09288, 0, 1, 0.07058824, 1,
-0.4061239, -1.418634, -2.056976, 0, 1, 0.07450981, 1,
-0.4026596, 1.354488, -0.001692143, 0, 1, 0.08235294, 1,
-0.4020267, -1.339409, -3.795657, 0, 1, 0.08627451, 1,
-0.4018088, 1.230312, -2.971967, 0, 1, 0.09411765, 1,
-0.4009265, -0.4342449, -1.529705, 0, 1, 0.1019608, 1,
-0.4008976, 1.148448, -0.2990801, 0, 1, 0.1058824, 1,
-0.3990381, 1.137469, 1.284743, 0, 1, 0.1137255, 1,
-0.3980026, -0.5512416, -1.810094, 0, 1, 0.1176471, 1,
-0.3968779, -0.3515651, -3.494834, 0, 1, 0.1254902, 1,
-0.3954973, -0.5621606, -3.070932, 0, 1, 0.1294118, 1,
-0.3918594, 1.021536, 0.7492652, 0, 1, 0.1372549, 1,
-0.3918253, 1.06285, 2.075527, 0, 1, 0.1411765, 1,
-0.3892172, 0.1250233, -1.86626, 0, 1, 0.1490196, 1,
-0.3810274, 0.2923838, -1.874966, 0, 1, 0.1529412, 1,
-0.3786668, 0.7758599, -1.023273, 0, 1, 0.1607843, 1,
-0.3777181, 0.8016568, -1.063683, 0, 1, 0.1647059, 1,
-0.376586, 0.5621369, 0.6076339, 0, 1, 0.172549, 1,
-0.3683489, -0.9863451, -2.991769, 0, 1, 0.1764706, 1,
-0.3668985, 0.3117634, -0.8442527, 0, 1, 0.1843137, 1,
-0.3641563, 2.88473, 1.236205, 0, 1, 0.1882353, 1,
-0.359455, -1.324648, -3.73473, 0, 1, 0.1960784, 1,
-0.358918, -1.320997, -3.625694, 0, 1, 0.2039216, 1,
-0.3575959, -0.6733845, -1.736053, 0, 1, 0.2078431, 1,
-0.3564273, -0.239166, -1.549659, 0, 1, 0.2156863, 1,
-0.3547926, -1.796503, -3.275476, 0, 1, 0.2196078, 1,
-0.3530351, -0.2539697, -2.808259, 0, 1, 0.227451, 1,
-0.3517797, 0.4506004, 1.005268, 0, 1, 0.2313726, 1,
-0.34979, -0.6036668, -3.13972, 0, 1, 0.2392157, 1,
-0.3451152, 0.4837425, -0.1854136, 0, 1, 0.2431373, 1,
-0.343217, -0.8287783, -1.770286, 0, 1, 0.2509804, 1,
-0.338158, 0.3372728, -0.03479226, 0, 1, 0.254902, 1,
-0.3295034, 0.7600205, -1.227197, 0, 1, 0.2627451, 1,
-0.3289863, -0.8930396, -4.313354, 0, 1, 0.2666667, 1,
-0.3288742, 0.2735215, 0.2486684, 0, 1, 0.2745098, 1,
-0.3286716, -1.646039, -2.348587, 0, 1, 0.2784314, 1,
-0.3259592, 0.3543876, -0.4787742, 0, 1, 0.2862745, 1,
-0.325733, 1.631768, -0.644684, 0, 1, 0.2901961, 1,
-0.3254861, 0.04001604, -1.412642, 0, 1, 0.2980392, 1,
-0.3246285, 0.965599, 1.382119, 0, 1, 0.3058824, 1,
-0.3200891, -2.08211, -2.387696, 0, 1, 0.3098039, 1,
-0.3158602, -0.617704, -3.344865, 0, 1, 0.3176471, 1,
-0.3134308, 0.9156408, -0.4562131, 0, 1, 0.3215686, 1,
-0.312962, -0.8294727, -1.555318, 0, 1, 0.3294118, 1,
-0.3115186, 0.4464121, -0.6692551, 0, 1, 0.3333333, 1,
-0.3114978, 3.016242, -0.9575341, 0, 1, 0.3411765, 1,
-0.3097667, -1.298644, -2.895347, 0, 1, 0.345098, 1,
-0.3085087, 1.602957, -0.1273959, 0, 1, 0.3529412, 1,
-0.3083061, 1.317482, 0.1362787, 0, 1, 0.3568628, 1,
-0.307137, -1.738223, -2.393597, 0, 1, 0.3647059, 1,
-0.3065916, 0.2363013, -1.042465, 0, 1, 0.3686275, 1,
-0.3009459, 1.76014, -2.50281, 0, 1, 0.3764706, 1,
-0.2989905, 0.5254796, -0.689615, 0, 1, 0.3803922, 1,
-0.2975079, -0.883673, -3.948685, 0, 1, 0.3882353, 1,
-0.2970686, -0.9192253, -3.460307, 0, 1, 0.3921569, 1,
-0.296055, 0.3618214, -1.137371, 0, 1, 0.4, 1,
-0.294424, 0.03904499, -1.535908, 0, 1, 0.4078431, 1,
-0.2850823, -0.8212169, -2.21382, 0, 1, 0.4117647, 1,
-0.2769639, 0.7118996, -1.089635, 0, 1, 0.4196078, 1,
-0.2751054, -0.8992711, -3.961636, 0, 1, 0.4235294, 1,
-0.2743936, -1.680026, -1.905906, 0, 1, 0.4313726, 1,
-0.2733867, 0.01478018, -0.6331372, 0, 1, 0.4352941, 1,
-0.2730808, -0.3627099, -4.498595, 0, 1, 0.4431373, 1,
-0.2680935, 1.613259, -2.908781, 0, 1, 0.4470588, 1,
-0.2644569, -0.05466678, -2.048199, 0, 1, 0.454902, 1,
-0.2506417, 0.4410692, -1.396947, 0, 1, 0.4588235, 1,
-0.2504741, 2.925218, 1.317723, 0, 1, 0.4666667, 1,
-0.2480664, -0.8276897, -3.109462, 0, 1, 0.4705882, 1,
-0.2461762, 0.7189931, -0.7018993, 0, 1, 0.4784314, 1,
-0.2453578, 0.42759, -0.8360339, 0, 1, 0.4823529, 1,
-0.2360985, -0.7789105, -1.01698, 0, 1, 0.4901961, 1,
-0.2334944, 0.6679895, -1.450929, 0, 1, 0.4941176, 1,
-0.2325161, 0.330677, 0.3979945, 0, 1, 0.5019608, 1,
-0.2295585, 1.769546, -1.244387, 0, 1, 0.509804, 1,
-0.2273515, 0.3867434, 0.009374737, 0, 1, 0.5137255, 1,
-0.2263965, -1.559496, -2.180499, 0, 1, 0.5215687, 1,
-0.2226231, -0.4785358, -4.186954, 0, 1, 0.5254902, 1,
-0.2213235, -1.249419, -3.928914, 0, 1, 0.5333334, 1,
-0.2210616, -2.265831, -3.00395, 0, 1, 0.5372549, 1,
-0.2208575, -0.3876565, -3.703737, 0, 1, 0.5450981, 1,
-0.2156727, -0.1111946, -2.253318, 0, 1, 0.5490196, 1,
-0.2151735, -0.2401834, -3.604824, 0, 1, 0.5568628, 1,
-0.2151733, 2.25888, 1.748031, 0, 1, 0.5607843, 1,
-0.2061373, 1.512828, -0.8131507, 0, 1, 0.5686275, 1,
-0.201869, 0.7262069, 0.06543264, 0, 1, 0.572549, 1,
-0.1975351, 0.2611324, -1.521152, 0, 1, 0.5803922, 1,
-0.1949168, 1.557639, 0.4495301, 0, 1, 0.5843138, 1,
-0.193766, -0.01790963, -2.306977, 0, 1, 0.5921569, 1,
-0.1935675, 0.01987792, -2.523695, 0, 1, 0.5960785, 1,
-0.1880803, 0.08091955, -0.5521992, 0, 1, 0.6039216, 1,
-0.1867155, 0.333927, -0.4884001, 0, 1, 0.6117647, 1,
-0.1851483, 0.4122318, -0.4311528, 0, 1, 0.6156863, 1,
-0.1803417, 0.2037722, -1.302438, 0, 1, 0.6235294, 1,
-0.1756192, 1.937491, 0.81508, 0, 1, 0.627451, 1,
-0.174109, 0.1874696, -1.439978, 0, 1, 0.6352941, 1,
-0.1728899, 0.8619155, -1.67768, 0, 1, 0.6392157, 1,
-0.1686164, 0.7207853, 1.200582, 0, 1, 0.6470588, 1,
-0.1684448, 0.6907248, -0.3109964, 0, 1, 0.6509804, 1,
-0.1657893, 1.393727, 0.5929778, 0, 1, 0.6588235, 1,
-0.1636548, 1.383394, -1.286376, 0, 1, 0.6627451, 1,
-0.1613823, 1.654495, -0.4076245, 0, 1, 0.6705883, 1,
-0.1607134, -1.957221, -2.475491, 0, 1, 0.6745098, 1,
-0.1550189, 1.499804, -0.613186, 0, 1, 0.682353, 1,
-0.1540061, 1.143074, 0.5880134, 0, 1, 0.6862745, 1,
-0.1517138, 0.7303008, -1.307765, 0, 1, 0.6941177, 1,
-0.1384855, -1.838898, -3.611523, 0, 1, 0.7019608, 1,
-0.1384141, -0.8767394, -4.800899, 0, 1, 0.7058824, 1,
-0.1300831, 0.2285206, -0.6016339, 0, 1, 0.7137255, 1,
-0.1287691, 0.5493899, -0.3789754, 0, 1, 0.7176471, 1,
-0.1245082, 0.02750803, -1.358988, 0, 1, 0.7254902, 1,
-0.119825, -0.2921435, -3.003473, 0, 1, 0.7294118, 1,
-0.1195459, 0.1589697, -1.223569, 0, 1, 0.7372549, 1,
-0.1104963, -1.398197, -3.454068, 0, 1, 0.7411765, 1,
-0.1103326, -0.5667716, -4.555894, 0, 1, 0.7490196, 1,
-0.107139, -2.040238, -3.063591, 0, 1, 0.7529412, 1,
-0.1053078, 0.3529266, -0.8608093, 0, 1, 0.7607843, 1,
-0.08946093, -0.9135794, -2.240411, 0, 1, 0.7647059, 1,
-0.08681889, 1.398398, 1.473307, 0, 1, 0.772549, 1,
-0.08277794, -1.331547, -5.199329, 0, 1, 0.7764706, 1,
-0.08277646, 1.209397, -0.666886, 0, 1, 0.7843137, 1,
-0.07909252, 0.2918059, 1.15733, 0, 1, 0.7882353, 1,
-0.07757437, 0.1357769, -0.1463487, 0, 1, 0.7960784, 1,
-0.07618592, 0.04958034, -1.72296, 0, 1, 0.8039216, 1,
-0.07332554, 0.0324861, -0.4108407, 0, 1, 0.8078431, 1,
-0.07078131, -1.159936, -3.763101, 0, 1, 0.8156863, 1,
-0.06946779, 1.572063, 1.624372, 0, 1, 0.8196079, 1,
-0.06852236, -1.293243, -3.777809, 0, 1, 0.827451, 1,
-0.06117119, 1.158672, 0.7550843, 0, 1, 0.8313726, 1,
-0.05904985, -0.9704064, -4.760777, 0, 1, 0.8392157, 1,
-0.05713909, -1.210691, -1.460821, 0, 1, 0.8431373, 1,
-0.05688503, -0.5150928, -2.099153, 0, 1, 0.8509804, 1,
-0.05648137, 0.4536438, 0.2951643, 0, 1, 0.854902, 1,
-0.05546982, -0.1241937, -2.806251, 0, 1, 0.8627451, 1,
-0.05311428, -0.2148243, -2.12956, 0, 1, 0.8666667, 1,
-0.05163693, -0.9640027, -3.114143, 0, 1, 0.8745098, 1,
-0.04510358, 0.7653917, 2.215937, 0, 1, 0.8784314, 1,
-0.04312426, 0.1511846, 1.088225, 0, 1, 0.8862745, 1,
-0.04303472, -0.2438256, -3.637506, 0, 1, 0.8901961, 1,
-0.04174158, -1.398888, -3.252393, 0, 1, 0.8980392, 1,
-0.03957987, 0.8083873, 0.1794614, 0, 1, 0.9058824, 1,
-0.03919381, 0.8253509, 0.0401504, 0, 1, 0.9098039, 1,
-0.03870461, -0.4912785, -2.436677, 0, 1, 0.9176471, 1,
-0.03862009, 1.536351, -0.5989588, 0, 1, 0.9215686, 1,
-0.0343321, 0.7286186, -0.1228936, 0, 1, 0.9294118, 1,
-0.02634372, 0.5065662, 1.022607, 0, 1, 0.9333333, 1,
-0.02552716, -0.2639656, -4.513304, 0, 1, 0.9411765, 1,
-0.02511456, 1.444499, -0.05759306, 0, 1, 0.945098, 1,
-0.02427882, -0.1403615, -4.479398, 0, 1, 0.9529412, 1,
-0.02198379, -0.9659051, -3.476465, 0, 1, 0.9568627, 1,
-0.02180725, 1.418622, 1.661815, 0, 1, 0.9647059, 1,
-0.02042746, 0.02200462, -0.08527373, 0, 1, 0.9686275, 1,
-0.02030521, -0.4354592, -1.294245, 0, 1, 0.9764706, 1,
-0.01697371, -0.05494872, -3.179971, 0, 1, 0.9803922, 1,
-0.011087, 0.5856832, -1.573659, 0, 1, 0.9882353, 1,
-0.006772313, 1.588811, -0.2025598, 0, 1, 0.9921569, 1,
-0.003102296, 1.994079, 0.3280665, 0, 1, 1, 1,
-0.002517761, -0.4478321, -1.508136, 0, 0.9921569, 1, 1,
-0.0009900535, 0.3743752, -0.6768224, 0, 0.9882353, 1, 1,
-0.000113568, -0.5541367, -1.078108, 0, 0.9803922, 1, 1,
0.001829442, -0.2665581, 4.252045, 0, 0.9764706, 1, 1,
0.007914997, 2.947953, 0.1231966, 0, 0.9686275, 1, 1,
0.01845663, 1.726916, 0.6320226, 0, 0.9647059, 1, 1,
0.02034619, -0.7429447, 3.540394, 0, 0.9568627, 1, 1,
0.02338752, -0.8820965, 2.431402, 0, 0.9529412, 1, 1,
0.02492473, 1.184635, 0.2369235, 0, 0.945098, 1, 1,
0.02975372, -0.04010629, 2.162768, 0, 0.9411765, 1, 1,
0.03309725, 2.13794, 0.2032928, 0, 0.9333333, 1, 1,
0.03483791, -1.892021, 2.088246, 0, 0.9294118, 1, 1,
0.03558752, 1.006792, 1.365335, 0, 0.9215686, 1, 1,
0.03607468, 0.1355293, 1.373562, 0, 0.9176471, 1, 1,
0.0369763, 0.1813868, 1.955154, 0, 0.9098039, 1, 1,
0.03823197, 0.5961841, -0.8400179, 0, 0.9058824, 1, 1,
0.03913268, -0.6964152, 4.026436, 0, 0.8980392, 1, 1,
0.03976708, 1.180129, 0.495577, 0, 0.8901961, 1, 1,
0.0426677, 1.082716, 1.555879, 0, 0.8862745, 1, 1,
0.04272675, -0.3514134, 2.167755, 0, 0.8784314, 1, 1,
0.04296375, 1.114, -1.7001, 0, 0.8745098, 1, 1,
0.04401463, 0.6549584, 0.4962197, 0, 0.8666667, 1, 1,
0.04846096, -1.211852, 3.618163, 0, 0.8627451, 1, 1,
0.05498673, -0.1005328, 3.77999, 0, 0.854902, 1, 1,
0.06463671, -2.335422, 2.879816, 0, 0.8509804, 1, 1,
0.07209218, -1.442256, 4.325888, 0, 0.8431373, 1, 1,
0.07293221, -1.022661, 2.848165, 0, 0.8392157, 1, 1,
0.07318248, 0.7089063, 0.5158247, 0, 0.8313726, 1, 1,
0.07762646, -0.4633091, 3.539297, 0, 0.827451, 1, 1,
0.0802152, -0.9631554, 4.068349, 0, 0.8196079, 1, 1,
0.0837103, -0.2700199, 3.292537, 0, 0.8156863, 1, 1,
0.08424414, -1.728823, 1.608061, 0, 0.8078431, 1, 1,
0.08446912, 1.06996, 0.6915946, 0, 0.8039216, 1, 1,
0.08462103, -0.6663211, 2.288109, 0, 0.7960784, 1, 1,
0.08699811, 2.147619, 0.7744337, 0, 0.7882353, 1, 1,
0.08807273, -0.246123, 0.52269, 0, 0.7843137, 1, 1,
0.08811654, 0.2554537, -0.1585533, 0, 0.7764706, 1, 1,
0.08958691, 0.5352597, 1.150032, 0, 0.772549, 1, 1,
0.09430971, -1.117242, 1.429381, 0, 0.7647059, 1, 1,
0.09910145, -0.07531669, 2.16567, 0, 0.7607843, 1, 1,
0.1008034, -0.6218798, 3.549476, 0, 0.7529412, 1, 1,
0.1026294, 0.06642432, 1.530172, 0, 0.7490196, 1, 1,
0.1036275, -0.5891412, 4.298413, 0, 0.7411765, 1, 1,
0.1055714, 2.296441, -0.5092232, 0, 0.7372549, 1, 1,
0.1069954, -0.7738016, 1.786726, 0, 0.7294118, 1, 1,
0.1096075, 1.497051, 1.916641, 0, 0.7254902, 1, 1,
0.1121421, -1.157808, 3.595923, 0, 0.7176471, 1, 1,
0.11215, -1.029095, 4.432325, 0, 0.7137255, 1, 1,
0.1132387, -0.4024312, 1.001755, 0, 0.7058824, 1, 1,
0.1166684, 1.269529, 0.2606851, 0, 0.6980392, 1, 1,
0.1172467, 0.926585, -0.5392566, 0, 0.6941177, 1, 1,
0.1203431, 0.5420846, 2.404363, 0, 0.6862745, 1, 1,
0.1207277, 0.09102086, 0.3720046, 0, 0.682353, 1, 1,
0.1260428, 0.01353128, 3.138103, 0, 0.6745098, 1, 1,
0.1297605, -1.223036, 3.19896, 0, 0.6705883, 1, 1,
0.1303321, -2.077564, 2.219453, 0, 0.6627451, 1, 1,
0.1338522, 0.253403, 1.642559, 0, 0.6588235, 1, 1,
0.1363605, 0.8299884, 1.143462, 0, 0.6509804, 1, 1,
0.136363, -0.4470404, 3.487452, 0, 0.6470588, 1, 1,
0.1408426, 0.114074, 1.868882, 0, 0.6392157, 1, 1,
0.1411755, -0.4157827, 1.03986, 0, 0.6352941, 1, 1,
0.1415974, 1.709733, 0.07367413, 0, 0.627451, 1, 1,
0.1421006, 0.4756663, -0.7800878, 0, 0.6235294, 1, 1,
0.1468125, -0.02481086, 1.596132, 0, 0.6156863, 1, 1,
0.147839, 0.8781831, 0.4513693, 0, 0.6117647, 1, 1,
0.1519905, 2.202569, 0.823824, 0, 0.6039216, 1, 1,
0.1530513, -0.8620305, 4.753764, 0, 0.5960785, 1, 1,
0.1558245, -0.8576009, 2.332452, 0, 0.5921569, 1, 1,
0.1613185, -1.200031, 3.817657, 0, 0.5843138, 1, 1,
0.1615665, -0.4334149, 3.569009, 0, 0.5803922, 1, 1,
0.1659461, -0.515961, 2.782439, 0, 0.572549, 1, 1,
0.1661648, 0.7487336, -0.8720503, 0, 0.5686275, 1, 1,
0.167372, 0.1465823, -0.2979554, 0, 0.5607843, 1, 1,
0.1682297, -0.3383402, 3.277036, 0, 0.5568628, 1, 1,
0.1687149, -1.138972, 3.749337, 0, 0.5490196, 1, 1,
0.1716729, -0.6307344, 4.05353, 0, 0.5450981, 1, 1,
0.1830325, 1.672754, 1.081452, 0, 0.5372549, 1, 1,
0.1864215, 0.3011982, 0.5863543, 0, 0.5333334, 1, 1,
0.1868556, 0.4918207, 0.1793923, 0, 0.5254902, 1, 1,
0.1894842, -1.056267, 2.644608, 0, 0.5215687, 1, 1,
0.1919471, -1.424435, 2.541173, 0, 0.5137255, 1, 1,
0.1925732, -1.232343, 4.360924, 0, 0.509804, 1, 1,
0.1953461, -2.006262, 4.705211, 0, 0.5019608, 1, 1,
0.196573, 2.211264, 0.5924138, 0, 0.4941176, 1, 1,
0.2001356, -0.5764371, 3.577247, 0, 0.4901961, 1, 1,
0.2030006, 0.05988841, 2.209962, 0, 0.4823529, 1, 1,
0.2067663, -1.225803, 2.54887, 0, 0.4784314, 1, 1,
0.2132239, -0.5230613, 3.20212, 0, 0.4705882, 1, 1,
0.213463, 1.43778, 0.4178074, 0, 0.4666667, 1, 1,
0.21365, -0.3320828, 3.856122, 0, 0.4588235, 1, 1,
0.2154019, 0.5791897, -0.3740206, 0, 0.454902, 1, 1,
0.2165764, -0.1483067, 2.366849, 0, 0.4470588, 1, 1,
0.2266303, 0.7793465, -0.8339085, 0, 0.4431373, 1, 1,
0.2268564, 0.415897, 0.572824, 0, 0.4352941, 1, 1,
0.2275275, 0.240834, 0.6874277, 0, 0.4313726, 1, 1,
0.2280627, 0.8253739, 0.244637, 0, 0.4235294, 1, 1,
0.2300881, -0.5323028, 2.267108, 0, 0.4196078, 1, 1,
0.2329294, -0.3732839, 3.270549, 0, 0.4117647, 1, 1,
0.2366839, -0.01037467, 1.006804, 0, 0.4078431, 1, 1,
0.2387207, 1.509861, -2.064482, 0, 0.4, 1, 1,
0.2410897, -1.570832, 2.621208, 0, 0.3921569, 1, 1,
0.2437428, 0.1519084, 2.147115, 0, 0.3882353, 1, 1,
0.2443196, 0.716323, 0.1236183, 0, 0.3803922, 1, 1,
0.2446838, 1.258824, 0.7148932, 0, 0.3764706, 1, 1,
0.2455422, -1.892804, 2.726846, 0, 0.3686275, 1, 1,
0.2484501, -0.1389043, 2.340571, 0, 0.3647059, 1, 1,
0.2526745, 1.71838, 1.810093, 0, 0.3568628, 1, 1,
0.2540424, 0.8962517, -0.08865312, 0, 0.3529412, 1, 1,
0.2544236, -0.9382824, 4.480783, 0, 0.345098, 1, 1,
0.2595998, 0.9950059, -0.2218347, 0, 0.3411765, 1, 1,
0.2671521, 0.0451319, 1.680277, 0, 0.3333333, 1, 1,
0.2707954, 0.9295232, 0.05274511, 0, 0.3294118, 1, 1,
0.2731386, -0.6663404, 3.100717, 0, 0.3215686, 1, 1,
0.2745962, -0.1303862, 1.299295, 0, 0.3176471, 1, 1,
0.2753488, -0.8718293, 3.659262, 0, 0.3098039, 1, 1,
0.2772673, 0.7577996, 1.541258, 0, 0.3058824, 1, 1,
0.2796477, -0.8338679, 3.233995, 0, 0.2980392, 1, 1,
0.2802148, -0.7361494, 3.509553, 0, 0.2901961, 1, 1,
0.2827659, 0.5701157, -0.8974976, 0, 0.2862745, 1, 1,
0.2844307, 0.3375003, 0.8848041, 0, 0.2784314, 1, 1,
0.2930942, 0.9001585, 1.161703, 0, 0.2745098, 1, 1,
0.2937443, 0.1464429, 0.6152883, 0, 0.2666667, 1, 1,
0.2938016, 0.9610022, -0.7296239, 0, 0.2627451, 1, 1,
0.2948712, -0.05837338, 2.875212, 0, 0.254902, 1, 1,
0.2952898, 0.02842564, 2.334042, 0, 0.2509804, 1, 1,
0.3068427, 0.2522767, -0.08478474, 0, 0.2431373, 1, 1,
0.3092061, -0.582584, 3.041844, 0, 0.2392157, 1, 1,
0.3148166, -0.6133618, 2.830947, 0, 0.2313726, 1, 1,
0.316977, 1.455682, 0.07011458, 0, 0.227451, 1, 1,
0.3215141, 0.868279, -1.18387, 0, 0.2196078, 1, 1,
0.32267, 1.060236, 0.9831944, 0, 0.2156863, 1, 1,
0.323904, -1.240843, 2.857106, 0, 0.2078431, 1, 1,
0.3282448, -1.8365, 4.958911, 0, 0.2039216, 1, 1,
0.3350507, 0.09594508, 1.359733, 0, 0.1960784, 1, 1,
0.3395168, -1.229017, 2.684799, 0, 0.1882353, 1, 1,
0.3402708, 0.3131202, 2.292029, 0, 0.1843137, 1, 1,
0.3404097, -0.7164149, 2.005903, 0, 0.1764706, 1, 1,
0.3418801, -0.4150281, 1.832839, 0, 0.172549, 1, 1,
0.3460275, -1.941679, 1.401285, 0, 0.1647059, 1, 1,
0.3475954, -1.466651, 3.28295, 0, 0.1607843, 1, 1,
0.3519458, -0.8149016, 3.406121, 0, 0.1529412, 1, 1,
0.3540584, 0.2967301, 0.9781945, 0, 0.1490196, 1, 1,
0.3553297, -0.04986299, 1.611742, 0, 0.1411765, 1, 1,
0.3554266, -0.01810503, 1.000599, 0, 0.1372549, 1, 1,
0.3593828, 0.05186008, 3.580447, 0, 0.1294118, 1, 1,
0.3676015, -0.1882349, 2.774496, 0, 0.1254902, 1, 1,
0.368962, 0.4461233, 0.1464869, 0, 0.1176471, 1, 1,
0.3714935, 0.1612302, 1.044606, 0, 0.1137255, 1, 1,
0.373897, 0.9176673, -0.3809607, 0, 0.1058824, 1, 1,
0.375781, 0.6422833, 2.16923, 0, 0.09803922, 1, 1,
0.3809948, 0.8338423, 0.5278994, 0, 0.09411765, 1, 1,
0.384889, 0.2763469, -0.3480938, 0, 0.08627451, 1, 1,
0.3929357, 0.2712714, 0.8128572, 0, 0.08235294, 1, 1,
0.3943464, -1.028434, 1.795723, 0, 0.07450981, 1, 1,
0.3974779, 1.087161, 0.9416149, 0, 0.07058824, 1, 1,
0.4055487, 0.08692648, 1.221005, 0, 0.0627451, 1, 1,
0.4057124, 2.120234, 1.572101, 0, 0.05882353, 1, 1,
0.4078713, 1.092833, -0.06598537, 0, 0.05098039, 1, 1,
0.4079517, -0.05165797, 1.541719, 0, 0.04705882, 1, 1,
0.412381, -0.4771924, 2.416907, 0, 0.03921569, 1, 1,
0.4166725, 0.5400494, 1.539753, 0, 0.03529412, 1, 1,
0.4320242, 0.4612372, 0.5756076, 0, 0.02745098, 1, 1,
0.4322796, -0.4861824, 4.221768, 0, 0.02352941, 1, 1,
0.4329283, 0.533954, 2.504901, 0, 0.01568628, 1, 1,
0.4358577, -0.5915624, 3.399519, 0, 0.01176471, 1, 1,
0.436267, 0.121759, 0.07136299, 0, 0.003921569, 1, 1,
0.4525914, 0.5292001, 0.7257603, 0.003921569, 0, 1, 1,
0.4526944, -0.8333121, 2.285201, 0.007843138, 0, 1, 1,
0.4551861, -0.7583023, 3.287146, 0.01568628, 0, 1, 1,
0.455542, 0.09013912, 1.402369, 0.01960784, 0, 1, 1,
0.459936, 0.08116432, 3.093407, 0.02745098, 0, 1, 1,
0.4635701, -1.032004, 2.557263, 0.03137255, 0, 1, 1,
0.4639418, 2.286704, 0.7913462, 0.03921569, 0, 1, 1,
0.4663588, -1.229109, 2.539032, 0.04313726, 0, 1, 1,
0.4689317, -0.5971485, 4.065853, 0.05098039, 0, 1, 1,
0.4820561, -0.8496448, 2.921046, 0.05490196, 0, 1, 1,
0.4823938, -0.6275193, 1.878414, 0.0627451, 0, 1, 1,
0.4842361, -0.8240104, 4.886144, 0.06666667, 0, 1, 1,
0.4877666, -0.5102865, 2.826029, 0.07450981, 0, 1, 1,
0.4884025, 0.2180909, 0.6638535, 0.07843138, 0, 1, 1,
0.490638, 0.3887577, 2.562845, 0.08627451, 0, 1, 1,
0.4910848, -0.9124662, 2.6739, 0.09019608, 0, 1, 1,
0.4925237, -0.2812336, 2.108892, 0.09803922, 0, 1, 1,
0.4960739, 0.3509325, 0.6891771, 0.1058824, 0, 1, 1,
0.4963088, -2.257344, 4.434261, 0.1098039, 0, 1, 1,
0.4973666, 1.341704, 2.003213, 0.1176471, 0, 1, 1,
0.4985577, -0.5281789, 2.803359, 0.1215686, 0, 1, 1,
0.4999233, 0.05314453, 1.873708, 0.1294118, 0, 1, 1,
0.5002993, -0.54762, 4.093083, 0.1333333, 0, 1, 1,
0.501326, 0.5177183, 1.408559, 0.1411765, 0, 1, 1,
0.5016679, -0.665282, 2.000514, 0.145098, 0, 1, 1,
0.5032258, 0.9997569, 0.006364331, 0.1529412, 0, 1, 1,
0.5049846, 1.149142, -0.6134719, 0.1568628, 0, 1, 1,
0.5092001, -0.3038949, 1.429564, 0.1647059, 0, 1, 1,
0.5097194, -0.9524271, 2.175417, 0.1686275, 0, 1, 1,
0.5102407, -1.435453, 3.181412, 0.1764706, 0, 1, 1,
0.5102822, -0.7783484, 2.060371, 0.1803922, 0, 1, 1,
0.5121489, 0.2494971, 0.4706288, 0.1882353, 0, 1, 1,
0.5152587, 0.404907, 1.608077, 0.1921569, 0, 1, 1,
0.5214564, 0.05406475, 1.844899, 0.2, 0, 1, 1,
0.5222105, 0.9276114, 0.5064312, 0.2078431, 0, 1, 1,
0.5258098, 0.5602894, -0.3397594, 0.2117647, 0, 1, 1,
0.5267246, -1.803456, 3.801024, 0.2196078, 0, 1, 1,
0.5301107, -0.09097394, 1.518482, 0.2235294, 0, 1, 1,
0.538357, 1.582022, 0.3189699, 0.2313726, 0, 1, 1,
0.5431922, -1.237623, 2.432837, 0.2352941, 0, 1, 1,
0.5435514, 1.040173, 1.090701, 0.2431373, 0, 1, 1,
0.5486321, -1.295458, 2.784452, 0.2470588, 0, 1, 1,
0.5496172, 0.7524316, -0.3066379, 0.254902, 0, 1, 1,
0.5530476, -2.385766, 2.814302, 0.2588235, 0, 1, 1,
0.5548852, -9.484437e-05, 2.859454, 0.2666667, 0, 1, 1,
0.5549978, 0.4936867, 0.5593019, 0.2705882, 0, 1, 1,
0.5608435, -1.634343, 3.157872, 0.2784314, 0, 1, 1,
0.5609664, -0.1672801, 2.176728, 0.282353, 0, 1, 1,
0.5611188, 0.01035196, 2.434145, 0.2901961, 0, 1, 1,
0.5621915, 0.6035313, 0.8710113, 0.2941177, 0, 1, 1,
0.5712438, 1.712659, -1.020791, 0.3019608, 0, 1, 1,
0.5718976, -0.5447146, 3.454139, 0.3098039, 0, 1, 1,
0.5730224, 0.137219, 2.057827, 0.3137255, 0, 1, 1,
0.5764239, 0.5757265, 0.9548043, 0.3215686, 0, 1, 1,
0.5836592, -1.818095, 3.742588, 0.3254902, 0, 1, 1,
0.5848622, -1.398325, 2.367032, 0.3333333, 0, 1, 1,
0.5908924, 0.097706, 0.998899, 0.3372549, 0, 1, 1,
0.5925418, 0.5290371, 0.669112, 0.345098, 0, 1, 1,
0.5936299, 0.2923962, 2.667413, 0.3490196, 0, 1, 1,
0.5936925, -0.9389911, 2.010165, 0.3568628, 0, 1, 1,
0.5976208, 0.4880819, 2.009131, 0.3607843, 0, 1, 1,
0.6004367, 1.808678, -0.0602708, 0.3686275, 0, 1, 1,
0.6015384, 0.2947788, 1.386447, 0.372549, 0, 1, 1,
0.6036811, -0.8014163, 1.767311, 0.3803922, 0, 1, 1,
0.6061818, 0.09297593, 0.8211523, 0.3843137, 0, 1, 1,
0.6076369, -0.1339686, 2.246625, 0.3921569, 0, 1, 1,
0.6101714, 0.6841912, 2.476022, 0.3960784, 0, 1, 1,
0.6103761, -0.3528285, 0.1225642, 0.4039216, 0, 1, 1,
0.6119685, 0.4640611, -0.5605051, 0.4117647, 0, 1, 1,
0.6123126, 0.4446904, 0.1944322, 0.4156863, 0, 1, 1,
0.6141658, -0.04114289, 2.615323, 0.4235294, 0, 1, 1,
0.616623, 0.6489951, -0.007188669, 0.427451, 0, 1, 1,
0.616837, 0.696609, -0.5667478, 0.4352941, 0, 1, 1,
0.6168612, 0.6289083, -0.2113859, 0.4392157, 0, 1, 1,
0.6179441, -0.4000683, 2.234682, 0.4470588, 0, 1, 1,
0.6180688, 0.1083324, 0.6843526, 0.4509804, 0, 1, 1,
0.618286, 0.06681278, 2.491234, 0.4588235, 0, 1, 1,
0.6227097, -2.324352, 2.132648, 0.4627451, 0, 1, 1,
0.6253236, -2.253246, 1.745504, 0.4705882, 0, 1, 1,
0.6290026, -0.09021099, 1.640471, 0.4745098, 0, 1, 1,
0.6323605, -2.099046, 3.261631, 0.4823529, 0, 1, 1,
0.634219, 3.157431, 2.316887, 0.4862745, 0, 1, 1,
0.6412216, 0.9904566, -0.2003166, 0.4941176, 0, 1, 1,
0.6422663, -0.10125, 0.5175014, 0.5019608, 0, 1, 1,
0.6479064, -0.01636364, 3.755134, 0.5058824, 0, 1, 1,
0.6492652, -0.7304363, 2.324134, 0.5137255, 0, 1, 1,
0.6506858, 2.118683, -0.1667007, 0.5176471, 0, 1, 1,
0.650719, 0.9043707, 0.7985439, 0.5254902, 0, 1, 1,
0.6517025, -0.9780589, 3.749322, 0.5294118, 0, 1, 1,
0.6565261, -0.950012, 1.224003, 0.5372549, 0, 1, 1,
0.6576935, 0.1630019, 2.984057, 0.5411765, 0, 1, 1,
0.6610832, 0.3450002, 0.5136156, 0.5490196, 0, 1, 1,
0.6613562, -0.7792592, 1.019454, 0.5529412, 0, 1, 1,
0.6621122, -0.4784488, 2.473215, 0.5607843, 0, 1, 1,
0.6741899, 0.9386716, 0.9248275, 0.5647059, 0, 1, 1,
0.6745616, -0.4880675, 0.9974974, 0.572549, 0, 1, 1,
0.6758996, -1.512825, 1.879228, 0.5764706, 0, 1, 1,
0.6789224, -0.04028064, 0.9466885, 0.5843138, 0, 1, 1,
0.6804932, 0.8053542, 0.698072, 0.5882353, 0, 1, 1,
0.6826361, 0.02740472, 1.881182, 0.5960785, 0, 1, 1,
0.6998423, -1.025501, 1.958268, 0.6039216, 0, 1, 1,
0.7058824, -0.1288158, 3.619628, 0.6078432, 0, 1, 1,
0.710988, 0.4084509, 3.574395, 0.6156863, 0, 1, 1,
0.7111803, -0.7293664, 3.087459, 0.6196079, 0, 1, 1,
0.716383, -1.186498, 2.350093, 0.627451, 0, 1, 1,
0.7167739, 0.7025672, -0.2452929, 0.6313726, 0, 1, 1,
0.7267408, -0.0757106, 2.308109, 0.6392157, 0, 1, 1,
0.7283987, 1.441444, 1.036014, 0.6431373, 0, 1, 1,
0.7311454, 1.404479, 0.6883374, 0.6509804, 0, 1, 1,
0.737469, 0.6242576, 0.636661, 0.654902, 0, 1, 1,
0.7416757, 0.4086654, 0.04281146, 0.6627451, 0, 1, 1,
0.7459992, -1.742465, 1.940891, 0.6666667, 0, 1, 1,
0.7475672, 0.817508, 1.676434, 0.6745098, 0, 1, 1,
0.7501376, 1.036277, 2.267601, 0.6784314, 0, 1, 1,
0.7543217, -0.09107856, -1.756314, 0.6862745, 0, 1, 1,
0.7594734, -1.841575, 0.8902057, 0.6901961, 0, 1, 1,
0.7665548, -0.9266509, 2.842668, 0.6980392, 0, 1, 1,
0.7694234, 0.4579122, 0.7404302, 0.7058824, 0, 1, 1,
0.7705382, -0.6610456, 2.166874, 0.7098039, 0, 1, 1,
0.7797813, 1.765585, -0.3478856, 0.7176471, 0, 1, 1,
0.7885588, -0.2153494, 2.099321, 0.7215686, 0, 1, 1,
0.7934909, 0.4993665, 0.7938027, 0.7294118, 0, 1, 1,
0.7956477, 1.48196, 0.1688742, 0.7333333, 0, 1, 1,
0.8066115, -0.5032996, 2.124279, 0.7411765, 0, 1, 1,
0.8085253, 0.3086438, 1.820782, 0.7450981, 0, 1, 1,
0.8088651, -0.588755, 0.7399836, 0.7529412, 0, 1, 1,
0.8095726, -0.9490683, 0.6258121, 0.7568628, 0, 1, 1,
0.8097363, 0.3171032, 1.352037, 0.7647059, 0, 1, 1,
0.8106047, 0.3645691, 1.010279, 0.7686275, 0, 1, 1,
0.8153616, -0.08192094, 1.187677, 0.7764706, 0, 1, 1,
0.8194892, 0.09678892, 1.36028, 0.7803922, 0, 1, 1,
0.8202789, -1.044535, 2.089717, 0.7882353, 0, 1, 1,
0.8227776, 0.1551042, 1.135611, 0.7921569, 0, 1, 1,
0.8390971, -0.4396523, 2.670433, 0.8, 0, 1, 1,
0.840722, 2.356094, -1.541879, 0.8078431, 0, 1, 1,
0.8427716, -1.018248, 2.696784, 0.8117647, 0, 1, 1,
0.8433842, -1.055403, 2.434228, 0.8196079, 0, 1, 1,
0.8443939, -0.09134462, 3.016116, 0.8235294, 0, 1, 1,
0.8482567, -0.9419678, 1.014159, 0.8313726, 0, 1, 1,
0.8494865, -0.8865314, 2.827674, 0.8352941, 0, 1, 1,
0.8525708, -1.629718, 2.947345, 0.8431373, 0, 1, 1,
0.8547768, 0.1029946, 1.684266, 0.8470588, 0, 1, 1,
0.8556453, 0.2002064, 0.7048394, 0.854902, 0, 1, 1,
0.8562384, 0.5894719, 2.043211, 0.8588235, 0, 1, 1,
0.8563882, -1.466028, 3.088891, 0.8666667, 0, 1, 1,
0.8616074, 0.4380888, 0.05205572, 0.8705882, 0, 1, 1,
0.8620672, -1.679991, 1.850029, 0.8784314, 0, 1, 1,
0.8641334, 0.4022939, 0.504227, 0.8823529, 0, 1, 1,
0.8682396, -0.9749189, 3.260098, 0.8901961, 0, 1, 1,
0.8701667, -0.5848818, 1.661549, 0.8941177, 0, 1, 1,
0.8711371, -0.1020456, 2.636643, 0.9019608, 0, 1, 1,
0.8719166, 0.1502628, 2.166026, 0.9098039, 0, 1, 1,
0.8737427, -0.5528508, 0.6970639, 0.9137255, 0, 1, 1,
0.8913114, -1.150863, 1.461428, 0.9215686, 0, 1, 1,
0.8931698, -1.408691, 2.56051, 0.9254902, 0, 1, 1,
0.8953894, -0.9913944, 3.326836, 0.9333333, 0, 1, 1,
0.9023429, 1.679305, 1.843515, 0.9372549, 0, 1, 1,
0.9024731, -0.475416, 2.466469, 0.945098, 0, 1, 1,
0.9078299, -0.7527124, 3.435506, 0.9490196, 0, 1, 1,
0.9125192, -0.07488891, 0.8534765, 0.9568627, 0, 1, 1,
0.9133664, -1.081325, 4.090253, 0.9607843, 0, 1, 1,
0.9181252, -0.6400295, 1.620384, 0.9686275, 0, 1, 1,
0.9228207, 0.1959952, 2.918026, 0.972549, 0, 1, 1,
0.9267448, 0.1917331, 1.360528, 0.9803922, 0, 1, 1,
0.9281055, 0.3604786, 0.6192759, 0.9843137, 0, 1, 1,
0.9291854, 0.8549109, 1.909952, 0.9921569, 0, 1, 1,
0.9394806, -0.4233422, 1.281234, 0.9960784, 0, 1, 1,
0.9441415, -0.3445079, 0.8791648, 1, 0, 0.9960784, 1,
0.9452637, 1.83068, 1.424587, 1, 0, 0.9882353, 1,
0.946463, -0.3691062, 1.484966, 1, 0, 0.9843137, 1,
0.9619654, 1.822463, -0.7180216, 1, 0, 0.9764706, 1,
0.9639803, 0.6083482, 0.967368, 1, 0, 0.972549, 1,
0.9640951, 2.584943, 1.709644, 1, 0, 0.9647059, 1,
0.968172, -1.543132, 3.216691, 1, 0, 0.9607843, 1,
0.9710398, 0.2764466, 1.548317, 1, 0, 0.9529412, 1,
0.9819719, -0.3542348, 2.494085, 1, 0, 0.9490196, 1,
0.9829863, 1.196993, 0.6234356, 1, 0, 0.9411765, 1,
0.9945048, -1.201513, 1.44707, 1, 0, 0.9372549, 1,
1.010892, 0.1142379, 1.103693, 1, 0, 0.9294118, 1,
1.017801, 0.5276328, 2.847673, 1, 0, 0.9254902, 1,
1.019017, 0.272247, -0.1843341, 1, 0, 0.9176471, 1,
1.019963, 0.1996597, 0.3862938, 1, 0, 0.9137255, 1,
1.021596, 0.5568712, 0.6551489, 1, 0, 0.9058824, 1,
1.021639, -1.219789, 2.041653, 1, 0, 0.9019608, 1,
1.026763, 0.8987494, 1.267123, 1, 0, 0.8941177, 1,
1.02729, -0.9464001, 1.153054, 1, 0, 0.8862745, 1,
1.029707, 1.761489, 0.5991597, 1, 0, 0.8823529, 1,
1.031243, -0.432891, 2.891207, 1, 0, 0.8745098, 1,
1.031912, 1.179882, 1.302952, 1, 0, 0.8705882, 1,
1.041014, -1.175675, 1.107478, 1, 0, 0.8627451, 1,
1.045293, 0.5975641, 0.6513368, 1, 0, 0.8588235, 1,
1.047472, 1.49384, 1.785348, 1, 0, 0.8509804, 1,
1.050895, 1.087974, 0.4173886, 1, 0, 0.8470588, 1,
1.052479, 1.546298, 0.6764921, 1, 0, 0.8392157, 1,
1.05599, -0.2038452, 2.31883, 1, 0, 0.8352941, 1,
1.071578, -1.667585, 2.68994, 1, 0, 0.827451, 1,
1.077751, 0.279915, 0.4099969, 1, 0, 0.8235294, 1,
1.079906, -1.226009, 2.113595, 1, 0, 0.8156863, 1,
1.081525, 0.2383875, 1.565159, 1, 0, 0.8117647, 1,
1.082384, -0.3942616, 0.8680866, 1, 0, 0.8039216, 1,
1.083601, 0.734412, -0.2292717, 1, 0, 0.7960784, 1,
1.087123, -1.813165, 3.531527, 1, 0, 0.7921569, 1,
1.089635, -0.1686027, 2.405625, 1, 0, 0.7843137, 1,
1.094996, 1.066044, 0.2010124, 1, 0, 0.7803922, 1,
1.099446, 0.3270713, 1.74437, 1, 0, 0.772549, 1,
1.104293, 1.841222, 0.4742621, 1, 0, 0.7686275, 1,
1.105071, -0.7821283, 1.09852, 1, 0, 0.7607843, 1,
1.11447, -1.49951, 1.875405, 1, 0, 0.7568628, 1,
1.115653, 0.5764318, 0.1559195, 1, 0, 0.7490196, 1,
1.125597, -0.4156432, 1.097324, 1, 0, 0.7450981, 1,
1.126068, 0.4371408, 2.473521, 1, 0, 0.7372549, 1,
1.129452, -1.000548, 0.4992945, 1, 0, 0.7333333, 1,
1.146267, -1.519411, 3.91853, 1, 0, 0.7254902, 1,
1.148827, -0.3331196, 1.820414, 1, 0, 0.7215686, 1,
1.150529, 0.4496819, 2.488743, 1, 0, 0.7137255, 1,
1.152556, -0.07763667, 1.435131, 1, 0, 0.7098039, 1,
1.154162, 0.6533175, 0.9421858, 1, 0, 0.7019608, 1,
1.169988, -0.7680326, 2.241693, 1, 0, 0.6941177, 1,
1.190807, -0.4021475, 2.621068, 1, 0, 0.6901961, 1,
1.193665, -0.9054698, 1.949682, 1, 0, 0.682353, 1,
1.197811, 1.948552, 2.70866, 1, 0, 0.6784314, 1,
1.200568, -0.9830544, 3.218587, 1, 0, 0.6705883, 1,
1.201543, 1.345195, 1.288702, 1, 0, 0.6666667, 1,
1.203387, 0.1375102, 0.0707275, 1, 0, 0.6588235, 1,
1.204471, -0.4358327, -1.540373, 1, 0, 0.654902, 1,
1.205553, -0.6710205, 2.314461, 1, 0, 0.6470588, 1,
1.213183, 0.2662597, 2.68192, 1, 0, 0.6431373, 1,
1.216396, -0.1220624, 1.984242, 1, 0, 0.6352941, 1,
1.239252, 0.3605614, 1.496479, 1, 0, 0.6313726, 1,
1.24728, 2.088864, 1.130911, 1, 0, 0.6235294, 1,
1.248956, 0.7304958, 1.555362, 1, 0, 0.6196079, 1,
1.257287, -0.5434641, 2.501168, 1, 0, 0.6117647, 1,
1.257601, 0.0897043, 0.9498257, 1, 0, 0.6078432, 1,
1.260944, 0.01767043, 0.1931027, 1, 0, 0.6, 1,
1.268647, 0.8163474, 1.534582, 1, 0, 0.5921569, 1,
1.270157, -2.797405, 3.540745, 1, 0, 0.5882353, 1,
1.278118, -0.1472833, 1.474743, 1, 0, 0.5803922, 1,
1.280066, 0.6209498, 0.9025291, 1, 0, 0.5764706, 1,
1.28244, 0.5168214, -0.15287, 1, 0, 0.5686275, 1,
1.285199, 0.179852, 0.1098808, 1, 0, 0.5647059, 1,
1.288116, 1.198545, -0.7813415, 1, 0, 0.5568628, 1,
1.295367, 1.306944, -0.04800506, 1, 0, 0.5529412, 1,
1.29831, 1.361097, -0.2496523, 1, 0, 0.5450981, 1,
1.300488, -0.2009913, 2.689876, 1, 0, 0.5411765, 1,
1.318565, 1.236334, -0.5976996, 1, 0, 0.5333334, 1,
1.321442, -0.6834314, 1.306681, 1, 0, 0.5294118, 1,
1.329429, -0.2637703, 1.10934, 1, 0, 0.5215687, 1,
1.330669, -0.5201113, 3.232476, 1, 0, 0.5176471, 1,
1.338141, -0.7369593, 1.305755, 1, 0, 0.509804, 1,
1.339969, -1.782957, 2.140451, 1, 0, 0.5058824, 1,
1.367261, -1.226058, 1.902303, 1, 0, 0.4980392, 1,
1.374258, 0.7276631, 1.491454, 1, 0, 0.4901961, 1,
1.376765, -0.4557278, 1.248442, 1, 0, 0.4862745, 1,
1.378353, 1.881053, -1.10264, 1, 0, 0.4784314, 1,
1.394263, -0.2144075, 1.830179, 1, 0, 0.4745098, 1,
1.40049, 0.1092602, 2.612745, 1, 0, 0.4666667, 1,
1.408945, -0.3392634, 2.180057, 1, 0, 0.4627451, 1,
1.413971, -1.037552, 2.319922, 1, 0, 0.454902, 1,
1.420229, 0.6451777, 2.149743, 1, 0, 0.4509804, 1,
1.424998, 0.1955834, 0.7941729, 1, 0, 0.4431373, 1,
1.425092, 0.4599547, -1.0128, 1, 0, 0.4392157, 1,
1.429522, 0.7982605, -1.396003, 1, 0, 0.4313726, 1,
1.429589, -0.8028543, 3.550544, 1, 0, 0.427451, 1,
1.431649, 1.989417, 0.7699196, 1, 0, 0.4196078, 1,
1.441926, 0.8755068, 1.240754, 1, 0, 0.4156863, 1,
1.446748, -1.192358, 0.7502064, 1, 0, 0.4078431, 1,
1.478268, 0.6724772, 2.068947, 1, 0, 0.4039216, 1,
1.494533, -1.783073, 1.956757, 1, 0, 0.3960784, 1,
1.494691, -0.9192339, 1.529203, 1, 0, 0.3882353, 1,
1.502667, -0.2252101, 1.036073, 1, 0, 0.3843137, 1,
1.504379, 2.963039, -0.3969603, 1, 0, 0.3764706, 1,
1.507808, -0.809094, 1.595802, 1, 0, 0.372549, 1,
1.515649, -0.5736683, 2.125071, 1, 0, 0.3647059, 1,
1.532412, -0.6605901, 3.314362, 1, 0, 0.3607843, 1,
1.54583, -0.01792115, 1.192134, 1, 0, 0.3529412, 1,
1.586085, 0.1307226, 1.495088, 1, 0, 0.3490196, 1,
1.590988, -1.646154, 2.519875, 1, 0, 0.3411765, 1,
1.59565, -2.755623, 2.960254, 1, 0, 0.3372549, 1,
1.601299, -0.1947214, 1.64271, 1, 0, 0.3294118, 1,
1.60668, 0.1822905, 1.299306, 1, 0, 0.3254902, 1,
1.635512, 1.288061, 0.8898112, 1, 0, 0.3176471, 1,
1.640853, -0.06345284, 2.414271, 1, 0, 0.3137255, 1,
1.643947, -0.7155427, 0.3278408, 1, 0, 0.3058824, 1,
1.656914, -0.4226233, 3.725036, 1, 0, 0.2980392, 1,
1.661974, 0.6702923, 3.063267, 1, 0, 0.2941177, 1,
1.664689, -0.2454457, 1.632093, 1, 0, 0.2862745, 1,
1.682021, 0.02775789, 1.315033, 1, 0, 0.282353, 1,
1.712944, 1.433322, -0.33094, 1, 0, 0.2745098, 1,
1.728764, 0.8943886, 1.456483, 1, 0, 0.2705882, 1,
1.731647, 0.4351456, 1.976893, 1, 0, 0.2627451, 1,
1.736718, -0.1891976, 1.517816, 1, 0, 0.2588235, 1,
1.746818, 1.655742, 1.218614, 1, 0, 0.2509804, 1,
1.751023, 0.3174162, 1.164871, 1, 0, 0.2470588, 1,
1.751698, 1.101387, 2.601416, 1, 0, 0.2392157, 1,
1.771953, -1.53015, 2.845937, 1, 0, 0.2352941, 1,
1.807451, -0.3719816, 2.138336, 1, 0, 0.227451, 1,
1.812963, 0.8952236, 1.247395, 1, 0, 0.2235294, 1,
1.823322, 0.07014422, -1.307191, 1, 0, 0.2156863, 1,
1.8283, -0.1366229, 3.044514, 1, 0, 0.2117647, 1,
1.829091, -0.3010085, 1.589385, 1, 0, 0.2039216, 1,
1.858539, 0.5142049, 1.455592, 1, 0, 0.1960784, 1,
1.862145, 0.02092342, 2.928009, 1, 0, 0.1921569, 1,
1.868482, -0.700604, 1.500374, 1, 0, 0.1843137, 1,
1.887967, -1.406391, 2.634094, 1, 0, 0.1803922, 1,
1.894424, -0.7897713, 2.248565, 1, 0, 0.172549, 1,
1.897519, -0.770162, 1.954393, 1, 0, 0.1686275, 1,
1.918353, 0.01352443, 2.476654, 1, 0, 0.1607843, 1,
1.922983, 0.4967941, 2.899, 1, 0, 0.1568628, 1,
1.925071, -0.5795724, 1.219887, 1, 0, 0.1490196, 1,
1.928084, 0.7779185, 0.3399481, 1, 0, 0.145098, 1,
1.949112, 0.8407851, -0.5654623, 1, 0, 0.1372549, 1,
2.047146, -0.4449408, 0.3799702, 1, 0, 0.1333333, 1,
2.054416, -0.4641313, 0.6884624, 1, 0, 0.1254902, 1,
2.068946, -0.4587755, 1.846635, 1, 0, 0.1215686, 1,
2.072765, 0.4639591, 1.51467, 1, 0, 0.1137255, 1,
2.101815, 1.817749, -0.5325149, 1, 0, 0.1098039, 1,
2.111073, 0.1257291, 0.468598, 1, 0, 0.1019608, 1,
2.155086, 0.5555071, 1.201792, 1, 0, 0.09411765, 1,
2.193734, 0.3477847, 0.04758302, 1, 0, 0.09019608, 1,
2.228463, 1.351972, 2.497786, 1, 0, 0.08235294, 1,
2.260484, 0.4413387, 1.326968, 1, 0, 0.07843138, 1,
2.287092, -1.454038, 2.860019, 1, 0, 0.07058824, 1,
2.303823, -1.599788, 2.214292, 1, 0, 0.06666667, 1,
2.32901, 0.9946664, 2.447732, 1, 0, 0.05882353, 1,
2.39948, -1.239166, 1.099136, 1, 0, 0.05490196, 1,
2.40137, 1.114393, -1.546876, 1, 0, 0.04705882, 1,
2.458847, 1.000107, 2.606392, 1, 0, 0.04313726, 1,
2.543047, -0.7850661, 1.329565, 1, 0, 0.03529412, 1,
2.674458, -0.1541169, 1.630511, 1, 0, 0.03137255, 1,
2.772872, -0.2834323, 2.531498, 1, 0, 0.02352941, 1,
2.88995, -0.3980314, 1.898032, 1, 0, 0.01960784, 1,
3.260386, 0.3027757, -0.3788311, 1, 0, 0.01176471, 1,
3.599276, 0.1117158, 0.9879088, 1, 0, 0.007843138, 1
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
0.1909781, -3.806749, -6.921151, 0, -0.5, 0.5, 0.5,
0.1909781, -3.806749, -6.921151, 1, -0.5, 0.5, 0.5,
0.1909781, -3.806749, -6.921151, 1, 1.5, 0.5, 0.5,
0.1909781, -3.806749, -6.921151, 0, 1.5, 0.5, 0.5
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
-4.372733, 0.1800132, -6.921151, 0, -0.5, 0.5, 0.5,
-4.372733, 0.1800132, -6.921151, 1, -0.5, 0.5, 0.5,
-4.372733, 0.1800132, -6.921151, 1, 1.5, 0.5, 0.5,
-4.372733, 0.1800132, -6.921151, 0, 1.5, 0.5, 0.5
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
-4.372733, -3.806749, -0.1202087, 0, -0.5, 0.5, 0.5,
-4.372733, -3.806749, -0.1202087, 1, -0.5, 0.5, 0.5,
-4.372733, -3.806749, -0.1202087, 1, 1.5, 0.5, 0.5,
-4.372733, -3.806749, -0.1202087, 0, 1.5, 0.5, 0.5
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
-3, -2.886727, -5.351703,
3, -2.886727, -5.351703,
-3, -2.886727, -5.351703,
-3, -3.040064, -5.613277,
-2, -2.886727, -5.351703,
-2, -3.040064, -5.613277,
-1, -2.886727, -5.351703,
-1, -3.040064, -5.613277,
0, -2.886727, -5.351703,
0, -3.040064, -5.613277,
1, -2.886727, -5.351703,
1, -3.040064, -5.613277,
2, -2.886727, -5.351703,
2, -3.040064, -5.613277,
3, -2.886727, -5.351703,
3, -3.040064, -5.613277
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
-3, -3.346738, -6.136426, 0, -0.5, 0.5, 0.5,
-3, -3.346738, -6.136426, 1, -0.5, 0.5, 0.5,
-3, -3.346738, -6.136426, 1, 1.5, 0.5, 0.5,
-3, -3.346738, -6.136426, 0, 1.5, 0.5, 0.5,
-2, -3.346738, -6.136426, 0, -0.5, 0.5, 0.5,
-2, -3.346738, -6.136426, 1, -0.5, 0.5, 0.5,
-2, -3.346738, -6.136426, 1, 1.5, 0.5, 0.5,
-2, -3.346738, -6.136426, 0, 1.5, 0.5, 0.5,
-1, -3.346738, -6.136426, 0, -0.5, 0.5, 0.5,
-1, -3.346738, -6.136426, 1, -0.5, 0.5, 0.5,
-1, -3.346738, -6.136426, 1, 1.5, 0.5, 0.5,
-1, -3.346738, -6.136426, 0, 1.5, 0.5, 0.5,
0, -3.346738, -6.136426, 0, -0.5, 0.5, 0.5,
0, -3.346738, -6.136426, 1, -0.5, 0.5, 0.5,
0, -3.346738, -6.136426, 1, 1.5, 0.5, 0.5,
0, -3.346738, -6.136426, 0, 1.5, 0.5, 0.5,
1, -3.346738, -6.136426, 0, -0.5, 0.5, 0.5,
1, -3.346738, -6.136426, 1, -0.5, 0.5, 0.5,
1, -3.346738, -6.136426, 1, 1.5, 0.5, 0.5,
1, -3.346738, -6.136426, 0, 1.5, 0.5, 0.5,
2, -3.346738, -6.136426, 0, -0.5, 0.5, 0.5,
2, -3.346738, -6.136426, 1, -0.5, 0.5, 0.5,
2, -3.346738, -6.136426, 1, 1.5, 0.5, 0.5,
2, -3.346738, -6.136426, 0, 1.5, 0.5, 0.5,
3, -3.346738, -6.136426, 0, -0.5, 0.5, 0.5,
3, -3.346738, -6.136426, 1, -0.5, 0.5, 0.5,
3, -3.346738, -6.136426, 1, 1.5, 0.5, 0.5,
3, -3.346738, -6.136426, 0, 1.5, 0.5, 0.5
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
-3.319569, -2, -5.351703,
-3.319569, 3, -5.351703,
-3.319569, -2, -5.351703,
-3.495096, -2, -5.613277,
-3.319569, -1, -5.351703,
-3.495096, -1, -5.613277,
-3.319569, 0, -5.351703,
-3.495096, 0, -5.613277,
-3.319569, 1, -5.351703,
-3.495096, 1, -5.613277,
-3.319569, 2, -5.351703,
-3.495096, 2, -5.613277,
-3.319569, 3, -5.351703,
-3.495096, 3, -5.613277
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
-3.846151, -2, -6.136426, 0, -0.5, 0.5, 0.5,
-3.846151, -2, -6.136426, 1, -0.5, 0.5, 0.5,
-3.846151, -2, -6.136426, 1, 1.5, 0.5, 0.5,
-3.846151, -2, -6.136426, 0, 1.5, 0.5, 0.5,
-3.846151, -1, -6.136426, 0, -0.5, 0.5, 0.5,
-3.846151, -1, -6.136426, 1, -0.5, 0.5, 0.5,
-3.846151, -1, -6.136426, 1, 1.5, 0.5, 0.5,
-3.846151, -1, -6.136426, 0, 1.5, 0.5, 0.5,
-3.846151, 0, -6.136426, 0, -0.5, 0.5, 0.5,
-3.846151, 0, -6.136426, 1, -0.5, 0.5, 0.5,
-3.846151, 0, -6.136426, 1, 1.5, 0.5, 0.5,
-3.846151, 0, -6.136426, 0, 1.5, 0.5, 0.5,
-3.846151, 1, -6.136426, 0, -0.5, 0.5, 0.5,
-3.846151, 1, -6.136426, 1, -0.5, 0.5, 0.5,
-3.846151, 1, -6.136426, 1, 1.5, 0.5, 0.5,
-3.846151, 1, -6.136426, 0, 1.5, 0.5, 0.5,
-3.846151, 2, -6.136426, 0, -0.5, 0.5, 0.5,
-3.846151, 2, -6.136426, 1, -0.5, 0.5, 0.5,
-3.846151, 2, -6.136426, 1, 1.5, 0.5, 0.5,
-3.846151, 2, -6.136426, 0, 1.5, 0.5, 0.5,
-3.846151, 3, -6.136426, 0, -0.5, 0.5, 0.5,
-3.846151, 3, -6.136426, 1, -0.5, 0.5, 0.5,
-3.846151, 3, -6.136426, 1, 1.5, 0.5, 0.5,
-3.846151, 3, -6.136426, 0, 1.5, 0.5, 0.5
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
-3.319569, -2.886727, -4,
-3.319569, -2.886727, 4,
-3.319569, -2.886727, -4,
-3.495096, -3.040064, -4,
-3.319569, -2.886727, -2,
-3.495096, -3.040064, -2,
-3.319569, -2.886727, 0,
-3.495096, -3.040064, 0,
-3.319569, -2.886727, 2,
-3.495096, -3.040064, 2,
-3.319569, -2.886727, 4,
-3.495096, -3.040064, 4
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
-3.846151, -3.346738, -4, 0, -0.5, 0.5, 0.5,
-3.846151, -3.346738, -4, 1, -0.5, 0.5, 0.5,
-3.846151, -3.346738, -4, 1, 1.5, 0.5, 0.5,
-3.846151, -3.346738, -4, 0, 1.5, 0.5, 0.5,
-3.846151, -3.346738, -2, 0, -0.5, 0.5, 0.5,
-3.846151, -3.346738, -2, 1, -0.5, 0.5, 0.5,
-3.846151, -3.346738, -2, 1, 1.5, 0.5, 0.5,
-3.846151, -3.346738, -2, 0, 1.5, 0.5, 0.5,
-3.846151, -3.346738, 0, 0, -0.5, 0.5, 0.5,
-3.846151, -3.346738, 0, 1, -0.5, 0.5, 0.5,
-3.846151, -3.346738, 0, 1, 1.5, 0.5, 0.5,
-3.846151, -3.346738, 0, 0, 1.5, 0.5, 0.5,
-3.846151, -3.346738, 2, 0, -0.5, 0.5, 0.5,
-3.846151, -3.346738, 2, 1, -0.5, 0.5, 0.5,
-3.846151, -3.346738, 2, 1, 1.5, 0.5, 0.5,
-3.846151, -3.346738, 2, 0, 1.5, 0.5, 0.5,
-3.846151, -3.346738, 4, 0, -0.5, 0.5, 0.5,
-3.846151, -3.346738, 4, 1, -0.5, 0.5, 0.5,
-3.846151, -3.346738, 4, 1, 1.5, 0.5, 0.5,
-3.846151, -3.346738, 4, 0, 1.5, 0.5, 0.5
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
-3.319569, -2.886727, -5.351703,
-3.319569, 3.246754, -5.351703,
-3.319569, -2.886727, 5.111285,
-3.319569, 3.246754, 5.111285,
-3.319569, -2.886727, -5.351703,
-3.319569, -2.886727, 5.111285,
-3.319569, 3.246754, -5.351703,
-3.319569, 3.246754, 5.111285,
-3.319569, -2.886727, -5.351703,
3.701525, -2.886727, -5.351703,
-3.319569, -2.886727, 5.111285,
3.701525, -2.886727, 5.111285,
-3.319569, 3.246754, -5.351703,
3.701525, 3.246754, -5.351703,
-3.319569, 3.246754, 5.111285,
3.701525, 3.246754, 5.111285,
3.701525, -2.886727, -5.351703,
3.701525, 3.246754, -5.351703,
3.701525, -2.886727, 5.111285,
3.701525, 3.246754, 5.111285,
3.701525, -2.886727, -5.351703,
3.701525, -2.886727, 5.111285,
3.701525, 3.246754, -5.351703,
3.701525, 3.246754, 5.111285
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
var radius = 7.483152;
var distance = 33.29338;
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
mvMatrix.translate( -0.1909781, -0.1800132, 0.1202087 );
mvMatrix.scale( 1.152375, 1.319142, 0.7732906 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.29338);
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


