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
-3.14406, -0.7988296, -1.259818, 1, 0, 0, 1,
-3.062265, 0.3550012, -1.114269, 1, 0.007843138, 0, 1,
-3.036134, -0.9211504, -2.044864, 1, 0.01176471, 0, 1,
-2.828481, 0.1971585, -1.561088, 1, 0.01960784, 0, 1,
-2.727594, 1.02859, 1.333538, 1, 0.02352941, 0, 1,
-2.704959, -0.1772008, -1.943333, 1, 0.03137255, 0, 1,
-2.681719, -0.1634114, -3.825238, 1, 0.03529412, 0, 1,
-2.652365, 1.406725, -1.235892, 1, 0.04313726, 0, 1,
-2.487081, 0.9368905, -1.475258, 1, 0.04705882, 0, 1,
-2.469669, 0.2724206, -2.202458, 1, 0.05490196, 0, 1,
-2.411157, -0.3306631, -0.1774544, 1, 0.05882353, 0, 1,
-2.363446, -0.4966099, -1.200283, 1, 0.06666667, 0, 1,
-2.25615, 0.6158504, -0.4676197, 1, 0.07058824, 0, 1,
-2.239979, 0.1347233, -0.8616584, 1, 0.07843138, 0, 1,
-2.218296, 0.05970882, -0.01647106, 1, 0.08235294, 0, 1,
-2.207911, 0.7595192, 0.5908234, 1, 0.09019608, 0, 1,
-2.130321, -0.009161732, -1.013805, 1, 0.09411765, 0, 1,
-2.129332, 0.9712975, 0.2084456, 1, 0.1019608, 0, 1,
-2.126178, -0.8318937, -0.4144152, 1, 0.1098039, 0, 1,
-2.083473, 1.226829, -1.487292, 1, 0.1137255, 0, 1,
-2.082183, -1.161961, -2.158972, 1, 0.1215686, 0, 1,
-2.069031, -1.989787, -1.630839, 1, 0.1254902, 0, 1,
-2.066783, -0.08970757, -0.2331128, 1, 0.1333333, 0, 1,
-1.973739, 0.9666943, -0.3811449, 1, 0.1372549, 0, 1,
-1.947196, -1.026189, -1.710027, 1, 0.145098, 0, 1,
-1.943053, 1.304378, -1.190595, 1, 0.1490196, 0, 1,
-1.930141, -0.4281896, -1.43623, 1, 0.1568628, 0, 1,
-1.882124, 2.380296, -1.321738, 1, 0.1607843, 0, 1,
-1.863726, 0.4128492, -0.3942477, 1, 0.1686275, 0, 1,
-1.829133, -0.8688656, -2.030924, 1, 0.172549, 0, 1,
-1.825325, 0.5552505, -0.5572076, 1, 0.1803922, 0, 1,
-1.806528, 0.7834674, -2.286636, 1, 0.1843137, 0, 1,
-1.797395, -1.708663, -0.8618494, 1, 0.1921569, 0, 1,
-1.782853, 0.1949166, -1.391811, 1, 0.1960784, 0, 1,
-1.763413, -0.5020325, -2.451895, 1, 0.2039216, 0, 1,
-1.758774, 0.2884971, -2.293122, 1, 0.2117647, 0, 1,
-1.73792, 0.1194097, -1.772138, 1, 0.2156863, 0, 1,
-1.728214, -0.3299102, -2.322341, 1, 0.2235294, 0, 1,
-1.723515, 0.7384402, -1.360754, 1, 0.227451, 0, 1,
-1.709898, 0.4732042, -1.481134, 1, 0.2352941, 0, 1,
-1.689042, 1.851699, -2.413551, 1, 0.2392157, 0, 1,
-1.654065, 0.02487366, -2.543947, 1, 0.2470588, 0, 1,
-1.641775, 0.3627412, -2.020016, 1, 0.2509804, 0, 1,
-1.633025, -1.013359, -3.027835, 1, 0.2588235, 0, 1,
-1.629912, -1.621216, -0.9009603, 1, 0.2627451, 0, 1,
-1.628285, 0.06146133, -1.473139, 1, 0.2705882, 0, 1,
-1.621034, 1.7085, -0.6792706, 1, 0.2745098, 0, 1,
-1.618935, 0.03574935, -2.159518, 1, 0.282353, 0, 1,
-1.610599, 0.9725187, -0.7974271, 1, 0.2862745, 0, 1,
-1.608317, 0.1629269, -2.0351, 1, 0.2941177, 0, 1,
-1.595699, -0.4696081, -2.039675, 1, 0.3019608, 0, 1,
-1.574704, 1.010612, -1.815208, 1, 0.3058824, 0, 1,
-1.564368, 0.008978556, -2.541546, 1, 0.3137255, 0, 1,
-1.559583, 0.6738892, -0.1197181, 1, 0.3176471, 0, 1,
-1.557469, -0.328379, -0.2562709, 1, 0.3254902, 0, 1,
-1.542104, 0.4488132, -1.119535, 1, 0.3294118, 0, 1,
-1.533144, -0.5421801, -2.656501, 1, 0.3372549, 0, 1,
-1.521471, 1.618193, -0.3565103, 1, 0.3411765, 0, 1,
-1.5034, 1.511336, -2.120188, 1, 0.3490196, 0, 1,
-1.503146, -2.81804, -2.411738, 1, 0.3529412, 0, 1,
-1.48813, -0.4885243, -2.597806, 1, 0.3607843, 0, 1,
-1.478961, -0.001260086, -0.3349316, 1, 0.3647059, 0, 1,
-1.473953, 0.5039756, -2.119616, 1, 0.372549, 0, 1,
-1.458736, -0.9020302, -1.853552, 1, 0.3764706, 0, 1,
-1.44436, 0.1526799, -2.251708, 1, 0.3843137, 0, 1,
-1.433716, 1.317042, -1.483972, 1, 0.3882353, 0, 1,
-1.425529, -0.3363826, -2.249387, 1, 0.3960784, 0, 1,
-1.424995, 0.3625121, -1.433094, 1, 0.4039216, 0, 1,
-1.42467, -1.278655, -2.371168, 1, 0.4078431, 0, 1,
-1.418505, -0.5340197, -0.9727352, 1, 0.4156863, 0, 1,
-1.407644, -1.123157, -2.493511, 1, 0.4196078, 0, 1,
-1.405424, -0.4504562, -1.576064, 1, 0.427451, 0, 1,
-1.401138, 1.447239, -1.294395, 1, 0.4313726, 0, 1,
-1.399127, -0.2834276, -1.068376, 1, 0.4392157, 0, 1,
-1.397721, 0.2990295, -0.5924943, 1, 0.4431373, 0, 1,
-1.392857, 2.193193, -1.293454, 1, 0.4509804, 0, 1,
-1.388979, -0.9609626, -1.35311, 1, 0.454902, 0, 1,
-1.37842, -0.146638, -1.234735, 1, 0.4627451, 0, 1,
-1.378377, -0.989455, -2.504005, 1, 0.4666667, 0, 1,
-1.376829, -1.680069, -1.497985, 1, 0.4745098, 0, 1,
-1.370448, -1.517024, -3.994079, 1, 0.4784314, 0, 1,
-1.351419, 0.2656784, -1.676668, 1, 0.4862745, 0, 1,
-1.346328, -0.006980862, -1.794581, 1, 0.4901961, 0, 1,
-1.33907, 0.4173453, -1.109462, 1, 0.4980392, 0, 1,
-1.334925, 0.7591132, -1.403211, 1, 0.5058824, 0, 1,
-1.332225, 0.6588028, -1.615399, 1, 0.509804, 0, 1,
-1.318998, -1.113127, -4.492007, 1, 0.5176471, 0, 1,
-1.315976, -0.3104167, -1.81236, 1, 0.5215687, 0, 1,
-1.315016, 0.4777218, -0.5588757, 1, 0.5294118, 0, 1,
-1.30512, 0.3514995, -2.463963, 1, 0.5333334, 0, 1,
-1.303693, -2.211751, -3.058846, 1, 0.5411765, 0, 1,
-1.301018, 1.266291, -2.417584, 1, 0.5450981, 0, 1,
-1.300523, -0.5343999, -1.007242, 1, 0.5529412, 0, 1,
-1.299828, 1.417689, -0.2825221, 1, 0.5568628, 0, 1,
-1.297374, -0.4317914, -3.066008, 1, 0.5647059, 0, 1,
-1.283767, -0.2964698, -1.524835, 1, 0.5686275, 0, 1,
-1.273004, -2.111824, -2.840806, 1, 0.5764706, 0, 1,
-1.271536, -0.1351983, -0.4239148, 1, 0.5803922, 0, 1,
-1.267348, 1.102061, 0.2610371, 1, 0.5882353, 0, 1,
-1.264012, 0.1242236, -0.5650094, 1, 0.5921569, 0, 1,
-1.25892, -0.009125026, -1.174297, 1, 0.6, 0, 1,
-1.258098, -0.9564956, -2.458296, 1, 0.6078432, 0, 1,
-1.243308, -1.555541, -1.974452, 1, 0.6117647, 0, 1,
-1.235942, -0.4402961, -0.9891165, 1, 0.6196079, 0, 1,
-1.227716, -0.01918806, -1.575111, 1, 0.6235294, 0, 1,
-1.225972, -1.39442, -1.207978, 1, 0.6313726, 0, 1,
-1.22582, -1.339073, -3.482357, 1, 0.6352941, 0, 1,
-1.219901, 0.8818645, -0.627194, 1, 0.6431373, 0, 1,
-1.213342, -1.906052, -2.761909, 1, 0.6470588, 0, 1,
-1.203754, -0.1144735, -1.603428, 1, 0.654902, 0, 1,
-1.199768, 1.526153, -0.9156614, 1, 0.6588235, 0, 1,
-1.19532, -0.3536415, -3.301782, 1, 0.6666667, 0, 1,
-1.194426, 0.8388858, -0.3754695, 1, 0.6705883, 0, 1,
-1.194188, -2.540443, -3.485281, 1, 0.6784314, 0, 1,
-1.193066, 0.8667534, -1.262491, 1, 0.682353, 0, 1,
-1.190347, -1.285195, -2.341305, 1, 0.6901961, 0, 1,
-1.174899, 1.456877, 0.6352444, 1, 0.6941177, 0, 1,
-1.174361, -1.213279, -2.423635, 1, 0.7019608, 0, 1,
-1.17398, 0.5303144, -0.255987, 1, 0.7098039, 0, 1,
-1.172967, 0.9406561, -0.9465401, 1, 0.7137255, 0, 1,
-1.171848, -0.3437159, -4.0346, 1, 0.7215686, 0, 1,
-1.170124, 0.2082738, -0.4674636, 1, 0.7254902, 0, 1,
-1.169039, 0.4030028, -0.8963421, 1, 0.7333333, 0, 1,
-1.167629, -2.084905, -3.677737, 1, 0.7372549, 0, 1,
-1.159457, -1.523313, -3.232483, 1, 0.7450981, 0, 1,
-1.150427, -0.6765031, -2.397601, 1, 0.7490196, 0, 1,
-1.148692, -0.432423, -1.644424, 1, 0.7568628, 0, 1,
-1.147369, -1.141344, -3.18461, 1, 0.7607843, 0, 1,
-1.137216, -1.535666, -4.241211, 1, 0.7686275, 0, 1,
-1.135221, -0.8165901, -0.9252808, 1, 0.772549, 0, 1,
-1.127705, 0.1692524, -0.6683363, 1, 0.7803922, 0, 1,
-1.120698, -1.999935, -2.880219, 1, 0.7843137, 0, 1,
-1.119532, -1.766159, -2.626997, 1, 0.7921569, 0, 1,
-1.118793, 1.246841, 0.35173, 1, 0.7960784, 0, 1,
-1.117233, -0.7726865, -2.766059, 1, 0.8039216, 0, 1,
-1.11306, 0.9051671, -1.415603, 1, 0.8117647, 0, 1,
-1.107017, -0.208628, -1.112924, 1, 0.8156863, 0, 1,
-1.104221, 0.6333226, -0.5618246, 1, 0.8235294, 0, 1,
-1.087936, -0.8399096, -3.158992, 1, 0.827451, 0, 1,
-1.08147, -1.392841, -2.721892, 1, 0.8352941, 0, 1,
-1.072235, 1.34214, 0.9754316, 1, 0.8392157, 0, 1,
-1.070505, -0.07244091, -2.712925, 1, 0.8470588, 0, 1,
-1.062754, -0.2704698, -2.238574, 1, 0.8509804, 0, 1,
-1.05726, 1.306774, -0.6823493, 1, 0.8588235, 0, 1,
-1.057159, 1.57971, -0.2461465, 1, 0.8627451, 0, 1,
-1.056326, 0.5503956, -0.5481651, 1, 0.8705882, 0, 1,
-1.054519, 1.428724, -0.8681051, 1, 0.8745098, 0, 1,
-1.045646, -0.0716667, -1.694914, 1, 0.8823529, 0, 1,
-1.041769, 1.689043, -1.577608, 1, 0.8862745, 0, 1,
-1.038083, 0.7396622, -1.744169, 1, 0.8941177, 0, 1,
-1.029482, 0.5434777, -1.961998, 1, 0.8980392, 0, 1,
-1.025977, -0.1647639, -2.627794, 1, 0.9058824, 0, 1,
-1.024692, -1.740831, -1.734287, 1, 0.9137255, 0, 1,
-1.024623, -1.772758, -2.432188, 1, 0.9176471, 0, 1,
-1.022574, -0.3288702, -0.4301593, 1, 0.9254902, 0, 1,
-1.022228, -0.1588827, -0.6991446, 1, 0.9294118, 0, 1,
-1.020597, -0.7928197, -3.032175, 1, 0.9372549, 0, 1,
-1.018939, 0.4279891, -1.887483, 1, 0.9411765, 0, 1,
-1.011073, 0.1063105, -1.31336, 1, 0.9490196, 0, 1,
-1.005187, -0.2278914, -3.20614, 1, 0.9529412, 0, 1,
-1.004455, -0.3925372, -1.536263, 1, 0.9607843, 0, 1,
-0.9981377, -0.3228086, -2.87434, 1, 0.9647059, 0, 1,
-0.9946215, 0.08871566, -1.11436, 1, 0.972549, 0, 1,
-0.9816874, 0.1996643, -2.158868, 1, 0.9764706, 0, 1,
-0.9676263, -0.5239593, -1.431342, 1, 0.9843137, 0, 1,
-0.9652718, 0.0817593, -4.231418, 1, 0.9882353, 0, 1,
-0.9581743, 0.7865281, -2.000033, 1, 0.9960784, 0, 1,
-0.9572445, -0.5548504, -3.533238, 0.9960784, 1, 0, 1,
-0.9565102, 1.261833, 1.287781, 0.9921569, 1, 0, 1,
-0.9513603, -1.473665, -0.9926422, 0.9843137, 1, 0, 1,
-0.9327606, 1.377164, -1.328202, 0.9803922, 1, 0, 1,
-0.9317768, 0.4197545, -1.90957, 0.972549, 1, 0, 1,
-0.9277777, 0.3709817, -0.3187196, 0.9686275, 1, 0, 1,
-0.9243295, -1.210725, -2.244838, 0.9607843, 1, 0, 1,
-0.9226062, 0.1650005, -2.597883, 0.9568627, 1, 0, 1,
-0.9050701, 0.3542998, -1.368751, 0.9490196, 1, 0, 1,
-0.9036077, 1.040623, -2.052618, 0.945098, 1, 0, 1,
-0.9035378, 1.449286, -0.8099324, 0.9372549, 1, 0, 1,
-0.8987834, 0.5377433, -2.72661, 0.9333333, 1, 0, 1,
-0.8897952, 0.006417745, -2.165954, 0.9254902, 1, 0, 1,
-0.8892644, -0.7300336, -1.948093, 0.9215686, 1, 0, 1,
-0.8868585, 1.018951, -0.9603092, 0.9137255, 1, 0, 1,
-0.8860598, -0.4963191, -0.6599522, 0.9098039, 1, 0, 1,
-0.8859533, 0.3445124, -1.228082, 0.9019608, 1, 0, 1,
-0.8738906, 1.224655, -1.968536, 0.8941177, 1, 0, 1,
-0.8702067, -0.04075259, -2.286954, 0.8901961, 1, 0, 1,
-0.8636238, -0.7320732, -2.190577, 0.8823529, 1, 0, 1,
-0.8631393, -0.8589842, -3.007838, 0.8784314, 1, 0, 1,
-0.8607446, 1.024223, 0.1312629, 0.8705882, 1, 0, 1,
-0.85499, -0.386782, -2.020482, 0.8666667, 1, 0, 1,
-0.8517087, -0.003618825, -4.372846, 0.8588235, 1, 0, 1,
-0.8506861, -0.1536607, -0.4850142, 0.854902, 1, 0, 1,
-0.8466446, 2.058606, -0.2762981, 0.8470588, 1, 0, 1,
-0.8455262, 1.070462, -0.6559464, 0.8431373, 1, 0, 1,
-0.8428802, 1.474984, -0.7969297, 0.8352941, 1, 0, 1,
-0.8426899, -0.3266013, -2.870184, 0.8313726, 1, 0, 1,
-0.8372211, 0.422375, -0.2594378, 0.8235294, 1, 0, 1,
-0.8359239, 0.2794287, -2.197138, 0.8196079, 1, 0, 1,
-0.8355138, 0.7320912, 0.06099182, 0.8117647, 1, 0, 1,
-0.8325909, 2.69765, -0.08328469, 0.8078431, 1, 0, 1,
-0.8324147, -1.944086, -2.670134, 0.8, 1, 0, 1,
-0.8320675, 0.6801653, -0.109603, 0.7921569, 1, 0, 1,
-0.830671, 1.370186, -0.07522357, 0.7882353, 1, 0, 1,
-0.8300218, -2.220384, -2.671121, 0.7803922, 1, 0, 1,
-0.8288545, 0.6951397, -1.13494, 0.7764706, 1, 0, 1,
-0.8267099, 1.813, 1.080366, 0.7686275, 1, 0, 1,
-0.8230292, -0.5006859, -2.49211, 0.7647059, 1, 0, 1,
-0.8219147, 1.617956, 0.9451755, 0.7568628, 1, 0, 1,
-0.8163098, 0.7576559, -1.486678, 0.7529412, 1, 0, 1,
-0.8131711, -0.5003573, -0.1033369, 0.7450981, 1, 0, 1,
-0.8100454, 0.6177149, -2.506714, 0.7411765, 1, 0, 1,
-0.80885, -1.217237, -1.914614, 0.7333333, 1, 0, 1,
-0.802337, -0.4554053, -3.08347, 0.7294118, 1, 0, 1,
-0.8017165, -0.4202175, -0.8911447, 0.7215686, 1, 0, 1,
-0.7977894, -2.1496, -4.435658, 0.7176471, 1, 0, 1,
-0.7974936, -1.026403, -3.712259, 0.7098039, 1, 0, 1,
-0.7973182, 0.9498211, 0.05003199, 0.7058824, 1, 0, 1,
-0.7972112, -1.88831, -1.984491, 0.6980392, 1, 0, 1,
-0.7903193, -0.4146406, -1.105838, 0.6901961, 1, 0, 1,
-0.7875438, -1.085926, -1.730275, 0.6862745, 1, 0, 1,
-0.7860628, -0.591285, -1.9735, 0.6784314, 1, 0, 1,
-0.7772747, -0.790538, -2.26926, 0.6745098, 1, 0, 1,
-0.7710549, -1.19422, -1.795706, 0.6666667, 1, 0, 1,
-0.7697878, -0.6154404, -1.809626, 0.6627451, 1, 0, 1,
-0.7649478, -1.656722, -1.123199, 0.654902, 1, 0, 1,
-0.7624181, 0.9520516, -0.9575666, 0.6509804, 1, 0, 1,
-0.7605631, 2.002043, 0.4505886, 0.6431373, 1, 0, 1,
-0.7573925, -0.5941209, -1.507346, 0.6392157, 1, 0, 1,
-0.7504144, 0.2039629, -1.671755, 0.6313726, 1, 0, 1,
-0.7455707, -1.890806, -2.850036, 0.627451, 1, 0, 1,
-0.7407597, -1.320407, -1.94157, 0.6196079, 1, 0, 1,
-0.7380505, 1.370678, -0.09182344, 0.6156863, 1, 0, 1,
-0.7352229, 0.4111796, -1.60513, 0.6078432, 1, 0, 1,
-0.7320761, -0.3412564, -1.117799, 0.6039216, 1, 0, 1,
-0.7314839, -0.8116617, -1.764178, 0.5960785, 1, 0, 1,
-0.7302241, -1.291489, -3.62458, 0.5882353, 1, 0, 1,
-0.7289707, -0.989255, -2.867571, 0.5843138, 1, 0, 1,
-0.7254239, -1.499202, -3.598234, 0.5764706, 1, 0, 1,
-0.7251298, -1.366594, -2.878151, 0.572549, 1, 0, 1,
-0.7223415, 1.990841, -0.1572201, 0.5647059, 1, 0, 1,
-0.7199351, 0.05566926, -2.210267, 0.5607843, 1, 0, 1,
-0.7156389, -0.138576, -1.501754, 0.5529412, 1, 0, 1,
-0.7067981, 0.2532187, -3.588023, 0.5490196, 1, 0, 1,
-0.700285, -0.6884501, -3.841294, 0.5411765, 1, 0, 1,
-0.6953564, -0.7291232, -2.607396, 0.5372549, 1, 0, 1,
-0.6870691, -1.802892, -1.437163, 0.5294118, 1, 0, 1,
-0.6865742, -0.4153054, -1.669001, 0.5254902, 1, 0, 1,
-0.6785465, 1.192251, -1.975346, 0.5176471, 1, 0, 1,
-0.6783563, -0.1901743, -2.042999, 0.5137255, 1, 0, 1,
-0.6782823, 1.18111, 0.1221495, 0.5058824, 1, 0, 1,
-0.6776851, -0.03188651, -1.10713, 0.5019608, 1, 0, 1,
-0.6767279, -0.5351008, -3.226287, 0.4941176, 1, 0, 1,
-0.6764424, 1.38239, -1.2753, 0.4862745, 1, 0, 1,
-0.6726954, 0.06630847, -0.3224505, 0.4823529, 1, 0, 1,
-0.6673033, 0.7532866, -0.8645149, 0.4745098, 1, 0, 1,
-0.6665649, 0.2724323, -2.380073, 0.4705882, 1, 0, 1,
-0.6653549, -1.033476, -2.175919, 0.4627451, 1, 0, 1,
-0.663212, -2.815015, -2.561534, 0.4588235, 1, 0, 1,
-0.6617394, 0.6894909, -1.182532, 0.4509804, 1, 0, 1,
-0.6594049, 0.7218736, -1.116118, 0.4470588, 1, 0, 1,
-0.6497197, 0.9629017, -0.7214826, 0.4392157, 1, 0, 1,
-0.6496307, 0.03275047, -1.777702, 0.4352941, 1, 0, 1,
-0.6483825, -0.08933879, -2.12259, 0.427451, 1, 0, 1,
-0.6473135, -1.150102, -0.8399467, 0.4235294, 1, 0, 1,
-0.6438685, -0.9164544, -2.016243, 0.4156863, 1, 0, 1,
-0.6436225, 0.04598266, -1.530385, 0.4117647, 1, 0, 1,
-0.6384117, -2.434272, -1.648606, 0.4039216, 1, 0, 1,
-0.6376426, -0.6768759, -1.290302, 0.3960784, 1, 0, 1,
-0.6300211, 1.576574, 0.2131709, 0.3921569, 1, 0, 1,
-0.6246108, -0.06981629, -1.975261, 0.3843137, 1, 0, 1,
-0.6240733, 0.7278374, 0.4552328, 0.3803922, 1, 0, 1,
-0.6199528, -0.001502962, -1.031657, 0.372549, 1, 0, 1,
-0.6169649, 1.054149, -2.410485, 0.3686275, 1, 0, 1,
-0.611801, 0.6314625, 0.2452638, 0.3607843, 1, 0, 1,
-0.6091967, 0.7273584, -1.724453, 0.3568628, 1, 0, 1,
-0.5949168, -0.7082354, -1.801907, 0.3490196, 1, 0, 1,
-0.5909375, 0.8465372, -1.877085, 0.345098, 1, 0, 1,
-0.58764, 0.1302284, -0.6962752, 0.3372549, 1, 0, 1,
-0.5852514, -0.7730125, -0.1142244, 0.3333333, 1, 0, 1,
-0.5819443, 0.7621112, -1.004293, 0.3254902, 1, 0, 1,
-0.5758703, -0.672385, -0.2187076, 0.3215686, 1, 0, 1,
-0.5740659, 1.076579, -1.086393, 0.3137255, 1, 0, 1,
-0.5739297, 0.4644916, -1.236564, 0.3098039, 1, 0, 1,
-0.5713707, 0.8960972, -1.650485, 0.3019608, 1, 0, 1,
-0.5708177, 1.463043, 0.1389558, 0.2941177, 1, 0, 1,
-0.5688668, -0.6156338, -3.158665, 0.2901961, 1, 0, 1,
-0.5618155, -0.8820702, -3.696384, 0.282353, 1, 0, 1,
-0.5560526, 1.005596, -0.4078174, 0.2784314, 1, 0, 1,
-0.5546809, -1.135598, -2.105052, 0.2705882, 1, 0, 1,
-0.5477459, 0.3703325, -0.6113808, 0.2666667, 1, 0, 1,
-0.5396819, -0.3032603, -2.817903, 0.2588235, 1, 0, 1,
-0.5378404, -1.448732, -3.377934, 0.254902, 1, 0, 1,
-0.5372168, 0.3192366, -1.282415, 0.2470588, 1, 0, 1,
-0.5319135, -0.9254587, -2.154047, 0.2431373, 1, 0, 1,
-0.5282671, 0.6583044, -1.328918, 0.2352941, 1, 0, 1,
-0.5230873, -0.3370723, -3.908734, 0.2313726, 1, 0, 1,
-0.5170938, -0.129025, -2.563512, 0.2235294, 1, 0, 1,
-0.5151486, -0.3671471, -2.780386, 0.2196078, 1, 0, 1,
-0.5129522, -1.861507, -3.776489, 0.2117647, 1, 0, 1,
-0.5097154, -0.441193, -3.259882, 0.2078431, 1, 0, 1,
-0.5085462, -0.2380098, -2.779519, 0.2, 1, 0, 1,
-0.5064899, -0.6623837, -2.784478, 0.1921569, 1, 0, 1,
-0.5061026, 1.268304, -2.290667, 0.1882353, 1, 0, 1,
-0.5028527, 0.5555681, -0.5229152, 0.1803922, 1, 0, 1,
-0.4968729, -1.249676, -2.652455, 0.1764706, 1, 0, 1,
-0.4947127, -0.9385619, -1.671798, 0.1686275, 1, 0, 1,
-0.4946727, 0.6693829, 0.7752622, 0.1647059, 1, 0, 1,
-0.4911236, 1.672634, 1.258881, 0.1568628, 1, 0, 1,
-0.4877322, -0.1485823, -0.537253, 0.1529412, 1, 0, 1,
-0.4875251, 0.5707478, -0.8601673, 0.145098, 1, 0, 1,
-0.4816048, -0.06173269, -0.5203652, 0.1411765, 1, 0, 1,
-0.4810062, -1.114705, -2.258688, 0.1333333, 1, 0, 1,
-0.4795251, 0.01387075, 0.1489673, 0.1294118, 1, 0, 1,
-0.4774565, -0.3919139, -0.9444083, 0.1215686, 1, 0, 1,
-0.474557, -1.340831, -1.447992, 0.1176471, 1, 0, 1,
-0.4731129, -1.088348, -2.051419, 0.1098039, 1, 0, 1,
-0.4697467, -0.7952873, -2.967818, 0.1058824, 1, 0, 1,
-0.4688298, 0.2585718, -1.449314, 0.09803922, 1, 0, 1,
-0.4681392, -1.074695, -2.361205, 0.09019608, 1, 0, 1,
-0.4667152, 0.4940875, 0.9389268, 0.08627451, 1, 0, 1,
-0.4631868, -1.184894, -4.440711, 0.07843138, 1, 0, 1,
-0.46057, 2.960569, 0.4933725, 0.07450981, 1, 0, 1,
-0.4605659, 1.811641, -0.478651, 0.06666667, 1, 0, 1,
-0.4542264, -0.9190945, -2.336096, 0.0627451, 1, 0, 1,
-0.4438514, -0.5193962, -1.945605, 0.05490196, 1, 0, 1,
-0.439503, 0.7435667, -1.058758, 0.05098039, 1, 0, 1,
-0.4380704, -0.1143879, -1.893943, 0.04313726, 1, 0, 1,
-0.4344541, 1.204247, -1.480182, 0.03921569, 1, 0, 1,
-0.4332768, 0.6914695, -0.7718222, 0.03137255, 1, 0, 1,
-0.4330323, -1.597271, -1.091015, 0.02745098, 1, 0, 1,
-0.4328783, -0.9322603, -3.921739, 0.01960784, 1, 0, 1,
-0.4323675, 0.1165418, -0.3157205, 0.01568628, 1, 0, 1,
-0.4302164, -1.053027, -0.2847428, 0.007843138, 1, 0, 1,
-0.423472, 1.6078, -2.864429, 0.003921569, 1, 0, 1,
-0.4212685, 0.3133661, -2.842616, 0, 1, 0.003921569, 1,
-0.4155615, 0.667618, 0.7881071, 0, 1, 0.01176471, 1,
-0.4141776, 2.37136, -0.715614, 0, 1, 0.01568628, 1,
-0.4066342, 0.8616154, -1.969181, 0, 1, 0.02352941, 1,
-0.4066336, 0.7409838, -1.976508, 0, 1, 0.02745098, 1,
-0.4056819, 1.242383, 1.501359, 0, 1, 0.03529412, 1,
-0.4054982, 0.8406453, -1.646221, 0, 1, 0.03921569, 1,
-0.4054731, -1.453083, -3.631204, 0, 1, 0.04705882, 1,
-0.4037023, -0.1292941, -0.4567514, 0, 1, 0.05098039, 1,
-0.4035731, -1.036778, -3.601853, 0, 1, 0.05882353, 1,
-0.4030653, -0.8381488, -2.66024, 0, 1, 0.0627451, 1,
-0.4025075, -0.3590597, -0.8412841, 0, 1, 0.07058824, 1,
-0.4006108, -0.1030832, -2.699931, 0, 1, 0.07450981, 1,
-0.4000373, -0.3400412, -2.867471, 0, 1, 0.08235294, 1,
-0.391838, 0.119458, -2.007905, 0, 1, 0.08627451, 1,
-0.3887703, 1.242832, -0.375064, 0, 1, 0.09411765, 1,
-0.388315, -0.4440023, -5.284818, 0, 1, 0.1019608, 1,
-0.3881091, 0.2125891, -0.9224502, 0, 1, 0.1058824, 1,
-0.3835684, -1.096977, -2.922653, 0, 1, 0.1137255, 1,
-0.3771312, 1.72239, -0.352156, 0, 1, 0.1176471, 1,
-0.3744225, -0.1983859, -1.462304, 0, 1, 0.1254902, 1,
-0.3705585, -0.5104543, -1.996413, 0, 1, 0.1294118, 1,
-0.3677374, 0.8053163, 0.2188733, 0, 1, 0.1372549, 1,
-0.3626654, -0.833122, -3.723321, 0, 1, 0.1411765, 1,
-0.3608556, -0.9925668, -2.698552, 0, 1, 0.1490196, 1,
-0.3557928, -1.275981, -2.635955, 0, 1, 0.1529412, 1,
-0.3520039, 0.0115003, -2.799915, 0, 1, 0.1607843, 1,
-0.3504409, 1.010401, -0.2461939, 0, 1, 0.1647059, 1,
-0.3495918, 1.831704, -1.206908, 0, 1, 0.172549, 1,
-0.3440796, 0.2805763, -0.4636596, 0, 1, 0.1764706, 1,
-0.3435486, 0.9287603, 0.2023727, 0, 1, 0.1843137, 1,
-0.3418273, 2.087418, 1.001452, 0, 1, 0.1882353, 1,
-0.3408846, 2.334194, -1.338572, 0, 1, 0.1960784, 1,
-0.33171, -1.595701, -3.947682, 0, 1, 0.2039216, 1,
-0.3306823, 1.729632, 0.001289287, 0, 1, 0.2078431, 1,
-0.3260272, 0.02176043, -2.516815, 0, 1, 0.2156863, 1,
-0.321985, -0.1472269, -2.253772, 0, 1, 0.2196078, 1,
-0.3219555, 1.403818, -0.9756776, 0, 1, 0.227451, 1,
-0.3185728, -0.7970901, -3.536702, 0, 1, 0.2313726, 1,
-0.3148089, 1.574939, -1.250839, 0, 1, 0.2392157, 1,
-0.3141713, 0.03547972, 1.176741, 0, 1, 0.2431373, 1,
-0.3119758, -0.3416117, -2.0045, 0, 1, 0.2509804, 1,
-0.3080891, -0.9007638, -2.447838, 0, 1, 0.254902, 1,
-0.3041463, 0.4617475, -1.382093, 0, 1, 0.2627451, 1,
-0.3035583, 0.1553798, -0.4598191, 0, 1, 0.2666667, 1,
-0.2997664, -0.8273091, -4.138155, 0, 1, 0.2745098, 1,
-0.2997259, 0.2622593, -0.998612, 0, 1, 0.2784314, 1,
-0.2986425, 1.074957, -0.9791118, 0, 1, 0.2862745, 1,
-0.2972514, -0.4049047, -4.171381, 0, 1, 0.2901961, 1,
-0.2972352, -1.052236, -4.129014, 0, 1, 0.2980392, 1,
-0.2915578, -1.405149, -2.209985, 0, 1, 0.3058824, 1,
-0.2818461, 1.090287, 0.7231382, 0, 1, 0.3098039, 1,
-0.2813753, 0.2786295, -0.140817, 0, 1, 0.3176471, 1,
-0.27913, -0.1326703, -0.7016034, 0, 1, 0.3215686, 1,
-0.2788379, -1.31621, -2.731658, 0, 1, 0.3294118, 1,
-0.2759162, -0.5629881, -1.875996, 0, 1, 0.3333333, 1,
-0.2747746, -0.3524391, -2.329283, 0, 1, 0.3411765, 1,
-0.2739708, 0.5391238, -1.00222, 0, 1, 0.345098, 1,
-0.272422, 0.6008332, 1.327516, 0, 1, 0.3529412, 1,
-0.267031, 1.442287, -2.182244, 0, 1, 0.3568628, 1,
-0.2654681, -0.2652112, -1.249345, 0, 1, 0.3647059, 1,
-0.2637359, -0.1250786, -1.927907, 0, 1, 0.3686275, 1,
-0.2636637, -0.7262189, -4.665858, 0, 1, 0.3764706, 1,
-0.2623924, 0.8538595, 0.1126012, 0, 1, 0.3803922, 1,
-0.2623093, -0.5092786, -2.833746, 0, 1, 0.3882353, 1,
-0.2579188, 0.7939235, -1.874818, 0, 1, 0.3921569, 1,
-0.2570192, 0.6533867, -0.001616823, 0, 1, 0.4, 1,
-0.2516852, -0.7061787, -4.640353, 0, 1, 0.4078431, 1,
-0.245611, 1.269201, -2.373238, 0, 1, 0.4117647, 1,
-0.2455797, 0.01875465, -2.744236, 0, 1, 0.4196078, 1,
-0.2426309, 0.4529793, -1.227938, 0, 1, 0.4235294, 1,
-0.2396824, -0.3744265, -1.0995, 0, 1, 0.4313726, 1,
-0.2380131, -1.237625, -1.55671, 0, 1, 0.4352941, 1,
-0.2329894, -1.657824, -1.581013, 0, 1, 0.4431373, 1,
-0.2295786, 0.1564682, -1.070215, 0, 1, 0.4470588, 1,
-0.2254183, 1.118937, -1.700817, 0, 1, 0.454902, 1,
-0.2251009, -0.4168821, -4.089148, 0, 1, 0.4588235, 1,
-0.2232129, 1.565954, 0.5296584, 0, 1, 0.4666667, 1,
-0.2193512, 1.286158, 1.484229, 0, 1, 0.4705882, 1,
-0.2173279, 0.5230613, -0.5816641, 0, 1, 0.4784314, 1,
-0.215822, 0.3435377, 0.01355165, 0, 1, 0.4823529, 1,
-0.2134865, -0.2014637, -1.228028, 0, 1, 0.4901961, 1,
-0.2107158, 1.147855, -2.200279, 0, 1, 0.4941176, 1,
-0.2039432, 0.1844295, -1.349119, 0, 1, 0.5019608, 1,
-0.2007548, 0.7841068, -0.3847435, 0, 1, 0.509804, 1,
-0.2000372, -0.2936887, -3.001626, 0, 1, 0.5137255, 1,
-0.1999021, -1.121485, -3.501242, 0, 1, 0.5215687, 1,
-0.1996062, 1.015659, 0.2263602, 0, 1, 0.5254902, 1,
-0.199246, -0.3099286, -2.91603, 0, 1, 0.5333334, 1,
-0.1985468, 0.2908209, -0.6865038, 0, 1, 0.5372549, 1,
-0.1957411, 0.269499, -2.209599, 0, 1, 0.5450981, 1,
-0.1935495, 1.112903, 2.054792, 0, 1, 0.5490196, 1,
-0.1927591, 0.9871352, 0.9172909, 0, 1, 0.5568628, 1,
-0.1846988, -1.577672, -4.060521, 0, 1, 0.5607843, 1,
-0.1771111, 0.1002706, 0.04276828, 0, 1, 0.5686275, 1,
-0.1707582, 1.413143, 0.5903358, 0, 1, 0.572549, 1,
-0.1696495, 1.21888, 1.752502, 0, 1, 0.5803922, 1,
-0.166781, 0.9275036, -0.4062909, 0, 1, 0.5843138, 1,
-0.1651193, -0.3078827, -2.440879, 0, 1, 0.5921569, 1,
-0.1634271, -0.7951587, -3.675548, 0, 1, 0.5960785, 1,
-0.1597268, 0.409872, -1.610059, 0, 1, 0.6039216, 1,
-0.1577724, 0.6784146, -0.04084243, 0, 1, 0.6117647, 1,
-0.1539246, 0.4633133, -0.2817717, 0, 1, 0.6156863, 1,
-0.1491389, -1.669612, -4.24945, 0, 1, 0.6235294, 1,
-0.1474296, 2.079076, -0.650897, 0, 1, 0.627451, 1,
-0.1461223, 0.371938, -2.718631, 0, 1, 0.6352941, 1,
-0.1459361, 0.7124739, -0.7419077, 0, 1, 0.6392157, 1,
-0.144983, -0.8153208, -2.574179, 0, 1, 0.6470588, 1,
-0.1412342, -0.7676747, -3.894041, 0, 1, 0.6509804, 1,
-0.1390154, 0.08544986, -1.142311, 0, 1, 0.6588235, 1,
-0.1374306, -0.266873, -2.489757, 0, 1, 0.6627451, 1,
-0.1329464, -1.206734, -3.301146, 0, 1, 0.6705883, 1,
-0.130757, 0.8060191, -0.9378068, 0, 1, 0.6745098, 1,
-0.1295415, 0.3995981, -1.42157, 0, 1, 0.682353, 1,
-0.1261937, 0.2747351, 0.002552787, 0, 1, 0.6862745, 1,
-0.1236368, -1.205467, -3.136226, 0, 1, 0.6941177, 1,
-0.1210194, 0.501893, 0.7675592, 0, 1, 0.7019608, 1,
-0.1209772, -0.5912505, -6.217352, 0, 1, 0.7058824, 1,
-0.1188238, -0.2105495, -2.608012, 0, 1, 0.7137255, 1,
-0.1183612, 0.7982911, -2.607407, 0, 1, 0.7176471, 1,
-0.1155555, -0.2826692, -2.632476, 0, 1, 0.7254902, 1,
-0.1131186, 1.072861, -0.3245286, 0, 1, 0.7294118, 1,
-0.1063602, -1.279779, -3.370286, 0, 1, 0.7372549, 1,
-0.1059048, 0.3700417, -1.501498, 0, 1, 0.7411765, 1,
-0.1045781, -0.7238734, -4.295862, 0, 1, 0.7490196, 1,
-0.1010014, 1.083603, -0.6821519, 0, 1, 0.7529412, 1,
-0.09367155, -0.7446706, -2.654446, 0, 1, 0.7607843, 1,
-0.09087783, 0.3440519, 0.6988867, 0, 1, 0.7647059, 1,
-0.08765855, 1.387888, -1.36725, 0, 1, 0.772549, 1,
-0.08541968, -0.6600324, -2.926676, 0, 1, 0.7764706, 1,
-0.08510375, -0.8333623, -4.099405, 0, 1, 0.7843137, 1,
-0.08493604, 1.114579, 0.6667743, 0, 1, 0.7882353, 1,
-0.08233301, 1.283599, -0.08806081, 0, 1, 0.7960784, 1,
-0.07685614, 0.9786857, -0.7720975, 0, 1, 0.8039216, 1,
-0.07602216, 1.071347, 1.099099, 0, 1, 0.8078431, 1,
-0.07396191, 1.789245, -0.2957102, 0, 1, 0.8156863, 1,
-0.07331377, -0.03978854, -3.894682, 0, 1, 0.8196079, 1,
-0.07287921, 0.603444, -1.256253, 0, 1, 0.827451, 1,
-0.07227372, -1.383925, -2.299095, 0, 1, 0.8313726, 1,
-0.07192166, -0.9516826, -2.686312, 0, 1, 0.8392157, 1,
-0.0675552, 0.1779197, 0.9998697, 0, 1, 0.8431373, 1,
-0.06482615, -0.06682572, -4.166428, 0, 1, 0.8509804, 1,
-0.06482614, 0.1094949, 0.8012709, 0, 1, 0.854902, 1,
-0.0645783, 0.09781686, 0.682038, 0, 1, 0.8627451, 1,
-0.06419775, 0.1343308, -1.058265, 0, 1, 0.8666667, 1,
-0.06177172, -0.8567904, -2.597651, 0, 1, 0.8745098, 1,
-0.06129478, 0.1088195, 0.3298084, 0, 1, 0.8784314, 1,
-0.05846735, -0.5995088, -4.21589, 0, 1, 0.8862745, 1,
-0.05828037, 1.233959, -0.3015974, 0, 1, 0.8901961, 1,
-0.05207909, 1.330112, -1.103933, 0, 1, 0.8980392, 1,
-0.05206087, 1.34505, -1.550599, 0, 1, 0.9058824, 1,
-0.0505471, 3.011743, -1.422233, 0, 1, 0.9098039, 1,
-0.05054106, -0.6863943, -3.520409, 0, 1, 0.9176471, 1,
-0.04814568, 0.06677071, -0.6510628, 0, 1, 0.9215686, 1,
-0.04520352, -0.5725542, -2.386537, 0, 1, 0.9294118, 1,
-0.04475644, 1.001289, 0.7453463, 0, 1, 0.9333333, 1,
-0.04375327, -0.5055431, -5.562724, 0, 1, 0.9411765, 1,
-0.03942923, 0.8400906, -0.6192878, 0, 1, 0.945098, 1,
-0.03747323, 0.7872691, 0.6209483, 0, 1, 0.9529412, 1,
-0.03589782, 1.546302, 0.4122034, 0, 1, 0.9568627, 1,
-0.034767, 0.9385499, 0.2662328, 0, 1, 0.9647059, 1,
-0.03421725, 1.721609, -0.804038, 0, 1, 0.9686275, 1,
-0.03375327, 1.342804, 0.2715605, 0, 1, 0.9764706, 1,
-0.0321345, -0.9938893, -3.813888, 0, 1, 0.9803922, 1,
-0.02972743, -1.978693, -4.668696, 0, 1, 0.9882353, 1,
-0.0282761, 0.4551806, -0.3151166, 0, 1, 0.9921569, 1,
-0.026225, -0.1906383, -2.248394, 0, 1, 1, 1,
-0.01599406, -0.1596632, -5.397925, 0, 0.9921569, 1, 1,
-0.008701573, 0.0972518, 0.9458154, 0, 0.9882353, 1, 1,
-0.007703893, 0.09407715, -0.1873818, 0, 0.9803922, 1, 1,
-0.005676076, -0.2372312, -2.991056, 0, 0.9764706, 1, 1,
-0.0007886623, 0.0112728, -0.622214, 0, 0.9686275, 1, 1,
7.910834e-05, 1.591112, -0.3816029, 0, 0.9647059, 1, 1,
0.0042062, -0.4674422, 4.592711, 0, 0.9568627, 1, 1,
0.004856133, 0.2851528, -1.090994, 0, 0.9529412, 1, 1,
0.008016662, 1.432533, -0.936805, 0, 0.945098, 1, 1,
0.008122973, -0.1429897, 2.067392, 0, 0.9411765, 1, 1,
0.009841088, 1.40251, 2.067405, 0, 0.9333333, 1, 1,
0.01185428, 0.2898792, -0.450892, 0, 0.9294118, 1, 1,
0.01255827, 1.132934, -0.451152, 0, 0.9215686, 1, 1,
0.01409854, -1.012038, 1.856106, 0, 0.9176471, 1, 1,
0.01866276, 1.075308, 1.412658, 0, 0.9098039, 1, 1,
0.0186747, -0.2312902, 1.781391, 0, 0.9058824, 1, 1,
0.02082944, -0.2993876, 3.722194, 0, 0.8980392, 1, 1,
0.02205575, 1.53174, -0.1812027, 0, 0.8901961, 1, 1,
0.02469848, 1.049305, 0.4441043, 0, 0.8862745, 1, 1,
0.02734302, -0.5422416, 2.597144, 0, 0.8784314, 1, 1,
0.02759999, 0.9219379, -0.4620971, 0, 0.8745098, 1, 1,
0.0286886, -0.4732974, 2.973088, 0, 0.8666667, 1, 1,
0.02924872, 1.398981, -1.220029, 0, 0.8627451, 1, 1,
0.02940159, 0.7186518, 1.498283, 0, 0.854902, 1, 1,
0.03345516, -1.092672, 5.650859, 0, 0.8509804, 1, 1,
0.03380956, 0.938909, 0.06290608, 0, 0.8431373, 1, 1,
0.03528066, 0.8791466, -1.125107, 0, 0.8392157, 1, 1,
0.03752321, -0.5094927, 2.04861, 0, 0.8313726, 1, 1,
0.04102651, -0.837451, 3.589296, 0, 0.827451, 1, 1,
0.04123766, 1.263786, 0.5283656, 0, 0.8196079, 1, 1,
0.0469931, 0.7938957, 0.9027382, 0, 0.8156863, 1, 1,
0.04791884, 0.5291778, -1.589845, 0, 0.8078431, 1, 1,
0.05048452, -1.952886, 3.949802, 0, 0.8039216, 1, 1,
0.05127425, 1.24464, -0.06600237, 0, 0.7960784, 1, 1,
0.05261511, -0.3290882, 2.531728, 0, 0.7882353, 1, 1,
0.05307654, 0.02180549, 1.344672, 0, 0.7843137, 1, 1,
0.055629, 1.398377, -1.172107, 0, 0.7764706, 1, 1,
0.0574344, -1.145295, 3.894047, 0, 0.772549, 1, 1,
0.05974963, 0.3014795, 0.08905011, 0, 0.7647059, 1, 1,
0.06046733, -0.2369276, 3.071144, 0, 0.7607843, 1, 1,
0.06142518, 0.6363245, 0.4818611, 0, 0.7529412, 1, 1,
0.06397207, -0.7221035, 2.962253, 0, 0.7490196, 1, 1,
0.06462863, -0.4980738, 3.202913, 0, 0.7411765, 1, 1,
0.06592875, -0.8519155, 4.340189, 0, 0.7372549, 1, 1,
0.06610972, -0.7233478, 2.682365, 0, 0.7294118, 1, 1,
0.06691483, -0.7047833, 1.468426, 0, 0.7254902, 1, 1,
0.07257356, -0.4897782, 0.874792, 0, 0.7176471, 1, 1,
0.07288756, -0.9515253, 3.584319, 0, 0.7137255, 1, 1,
0.0764512, 0.6009827, -0.1968552, 0, 0.7058824, 1, 1,
0.07732763, -1.063471, 6.106188, 0, 0.6980392, 1, 1,
0.07926919, -0.3698145, 2.571229, 0, 0.6941177, 1, 1,
0.08537699, -1.031539, 1.555454, 0, 0.6862745, 1, 1,
0.08621505, 0.7698951, 1.75012, 0, 0.682353, 1, 1,
0.08699702, -0.4123606, 2.921913, 0, 0.6745098, 1, 1,
0.08825441, -0.44892, 2.58325, 0, 0.6705883, 1, 1,
0.08980564, -0.1318631, 0.5635694, 0, 0.6627451, 1, 1,
0.09056509, 2.048167, -1.236618, 0, 0.6588235, 1, 1,
0.09536539, -1.115103, 2.851307, 0, 0.6509804, 1, 1,
0.1040895, 0.41484, 0.6487325, 0, 0.6470588, 1, 1,
0.1055663, -0.2239565, 2.976271, 0, 0.6392157, 1, 1,
0.1058695, 0.3222096, 0.2197835, 0, 0.6352941, 1, 1,
0.1063085, 0.2222587, 0.6467335, 0, 0.627451, 1, 1,
0.108823, -1.137557, 2.531957, 0, 0.6235294, 1, 1,
0.1094772, 0.04712848, -0.5038518, 0, 0.6156863, 1, 1,
0.1097433, 1.76711, 0.1937442, 0, 0.6117647, 1, 1,
0.1126859, 0.3627408, 2.099969, 0, 0.6039216, 1, 1,
0.1141864, -0.293472, 3.034561, 0, 0.5960785, 1, 1,
0.1156516, 0.2414219, 0.2218492, 0, 0.5921569, 1, 1,
0.117855, 0.767701, -0.5201719, 0, 0.5843138, 1, 1,
0.1187577, -0.3471898, 3.651285, 0, 0.5803922, 1, 1,
0.1191696, -0.6362375, 3.3732, 0, 0.572549, 1, 1,
0.1250171, -0.03102111, 1.933224, 0, 0.5686275, 1, 1,
0.1272624, -0.2173623, 1.992746, 0, 0.5607843, 1, 1,
0.1281925, -1.493156, 5.580759, 0, 0.5568628, 1, 1,
0.1289624, 0.1391311, 0.8502972, 0, 0.5490196, 1, 1,
0.1350924, -0.009516855, 1.707164, 0, 0.5450981, 1, 1,
0.1386585, 1.363451, -1.164926, 0, 0.5372549, 1, 1,
0.1395888, 1.596814, -2.370807, 0, 0.5333334, 1, 1,
0.1418374, -0.4370305, 2.534607, 0, 0.5254902, 1, 1,
0.1434364, 1.33865, 0.03292832, 0, 0.5215687, 1, 1,
0.1440978, 0.5661612, 0.0791627, 0, 0.5137255, 1, 1,
0.144828, 0.4500574, -0.3722201, 0, 0.509804, 1, 1,
0.145157, -0.1940935, 1.94801, 0, 0.5019608, 1, 1,
0.151707, -0.1169273, 1.668486, 0, 0.4941176, 1, 1,
0.1525657, -0.4389056, 3.210157, 0, 0.4901961, 1, 1,
0.1527061, -0.3892251, 3.104466, 0, 0.4823529, 1, 1,
0.1569784, 2.207982, -0.7697325, 0, 0.4784314, 1, 1,
0.1572985, -0.6392096, 4.419961, 0, 0.4705882, 1, 1,
0.1587499, -0.6373098, 3.865443, 0, 0.4666667, 1, 1,
0.160192, -1.652037, 2.90521, 0, 0.4588235, 1, 1,
0.1654405, 0.9006378, 0.3044865, 0, 0.454902, 1, 1,
0.1670181, 1.067839, 0.9765238, 0, 0.4470588, 1, 1,
0.1681838, -0.5736579, 2.612144, 0, 0.4431373, 1, 1,
0.1707548, 1.434548, -1.056702, 0, 0.4352941, 1, 1,
0.1720766, 0.0230177, -0.6904612, 0, 0.4313726, 1, 1,
0.1731521, -1.501587, 4.013316, 0, 0.4235294, 1, 1,
0.1732234, -0.3681214, 3.964924, 0, 0.4196078, 1, 1,
0.1735032, -0.7313694, 2.979733, 0, 0.4117647, 1, 1,
0.1762161, -0.7617943, 3.544925, 0, 0.4078431, 1, 1,
0.1779919, 1.04152, 0.4068836, 0, 0.4, 1, 1,
0.1793964, -0.9012174, 5.111596, 0, 0.3921569, 1, 1,
0.1838035, -1.282889, 2.867604, 0, 0.3882353, 1, 1,
0.1851698, -0.4064327, 3.588829, 0, 0.3803922, 1, 1,
0.1874528, 0.3108366, -0.02621554, 0, 0.3764706, 1, 1,
0.1896596, 0.4627149, 0.3043962, 0, 0.3686275, 1, 1,
0.190925, -0.02740612, 3.015794, 0, 0.3647059, 1, 1,
0.1916934, -0.07153421, 2.631701, 0, 0.3568628, 1, 1,
0.1919747, 0.4366899, -0.457046, 0, 0.3529412, 1, 1,
0.1946694, -0.5410246, 3.186725, 0, 0.345098, 1, 1,
0.19842, -0.01928478, 0.6450917, 0, 0.3411765, 1, 1,
0.2067371, 0.3378362, 1.039988, 0, 0.3333333, 1, 1,
0.208308, -0.3007964, 2.327825, 0, 0.3294118, 1, 1,
0.2131978, 0.03052815, 1.568192, 0, 0.3215686, 1, 1,
0.2143635, -2.244127, 3.586673, 0, 0.3176471, 1, 1,
0.2165824, 1.051217, 1.137736, 0, 0.3098039, 1, 1,
0.221157, 1.290803, -0.6197556, 0, 0.3058824, 1, 1,
0.22432, -0.1485795, 1.410513, 0, 0.2980392, 1, 1,
0.2264419, 0.2263794, -0.0004011663, 0, 0.2901961, 1, 1,
0.2271927, -0.740623, 3.045772, 0, 0.2862745, 1, 1,
0.2379627, 0.7836843, -0.2557663, 0, 0.2784314, 1, 1,
0.23979, 1.73517, 0.9560788, 0, 0.2745098, 1, 1,
0.2402433, 1.120329, 0.9614174, 0, 0.2666667, 1, 1,
0.2413371, 0.8787925, -0.9072972, 0, 0.2627451, 1, 1,
0.2467171, -1.353447, 2.579901, 0, 0.254902, 1, 1,
0.2478729, -0.4098107, 3.497377, 0, 0.2509804, 1, 1,
0.2521883, 1.001936, 0.6808475, 0, 0.2431373, 1, 1,
0.253423, 0.4064837, 1.736936, 0, 0.2392157, 1, 1,
0.2555357, -0.2340677, 2.778645, 0, 0.2313726, 1, 1,
0.2564251, 1.628406, -1.832996, 0, 0.227451, 1, 1,
0.2565193, -1.605199, 1.315224, 0, 0.2196078, 1, 1,
0.2574642, -0.519824, 4.918002, 0, 0.2156863, 1, 1,
0.2592922, 0.1035852, 2.172365, 0, 0.2078431, 1, 1,
0.2625919, 1.009226, 0.8577583, 0, 0.2039216, 1, 1,
0.2635861, 0.7428392, 1.663104, 0, 0.1960784, 1, 1,
0.2637886, 0.6344717, 1.366702, 0, 0.1882353, 1, 1,
0.2741793, 0.9884219, 0.7864439, 0, 0.1843137, 1, 1,
0.2771179, 0.4047032, 2.044887, 0, 0.1764706, 1, 1,
0.2802196, -0.4992443, 0.3118404, 0, 0.172549, 1, 1,
0.2870984, 1.90571, -0.3134115, 0, 0.1647059, 1, 1,
0.2877536, 1.49295, -1.352132, 0, 0.1607843, 1, 1,
0.2903428, -0.6752645, 2.487247, 0, 0.1529412, 1, 1,
0.2936524, -0.6068673, 2.820689, 0, 0.1490196, 1, 1,
0.2969695, -1.571344, 2.365555, 0, 0.1411765, 1, 1,
0.2999496, -0.353473, 3.143174, 0, 0.1372549, 1, 1,
0.3033181, 0.1720475, 1.036077, 0, 0.1294118, 1, 1,
0.3077912, -0.1199789, -0.6768424, 0, 0.1254902, 1, 1,
0.3108886, 0.3089426, 1.812129, 0, 0.1176471, 1, 1,
0.3135626, 0.0202428, 2.820707, 0, 0.1137255, 1, 1,
0.3156264, 0.5867515, 0.02600395, 0, 0.1058824, 1, 1,
0.3156975, -3.277049, 3.151532, 0, 0.09803922, 1, 1,
0.3185471, -0.2254543, 1.510434, 0, 0.09411765, 1, 1,
0.3300034, -0.5808711, 2.999763, 0, 0.08627451, 1, 1,
0.3333666, -1.323208, 3.479328, 0, 0.08235294, 1, 1,
0.3405215, -1.047805, 3.521118, 0, 0.07450981, 1, 1,
0.3422768, -0.7752602, 0.4627153, 0, 0.07058824, 1, 1,
0.3487823, 0.3615938, 0.5983229, 0, 0.0627451, 1, 1,
0.3487945, 1.646502, -0.8900366, 0, 0.05882353, 1, 1,
0.3489653, -0.1079833, 2.798886, 0, 0.05098039, 1, 1,
0.3496093, 1.37551, -0.4754725, 0, 0.04705882, 1, 1,
0.357522, -0.1893461, 3.30271, 0, 0.03921569, 1, 1,
0.3590228, 0.681368, 1.385947, 0, 0.03529412, 1, 1,
0.359511, -0.1575683, 1.643703, 0, 0.02745098, 1, 1,
0.3648416, 0.6557432, -0.5426174, 0, 0.02352941, 1, 1,
0.3654151, 1.005822, 1.422229, 0, 0.01568628, 1, 1,
0.3707702, 0.2555802, -1.207849, 0, 0.01176471, 1, 1,
0.3868291, -0.4041847, 2.434966, 0, 0.003921569, 1, 1,
0.3909766, -0.9494023, 2.483884, 0.003921569, 0, 1, 1,
0.3959839, 0.1072332, 1.183408, 0.007843138, 0, 1, 1,
0.3964957, 0.9785429, 1.073658, 0.01568628, 0, 1, 1,
0.4028226, 0.1701495, 0.9447793, 0.01960784, 0, 1, 1,
0.4042251, 0.8554902, 0.7796507, 0.02745098, 0, 1, 1,
0.4083943, 0.5552678, 0.4007812, 0.03137255, 0, 1, 1,
0.4092545, -1.476588, 4.51944, 0.03921569, 0, 1, 1,
0.4149907, 0.2382136, 1.88607, 0.04313726, 0, 1, 1,
0.4174421, 0.4407373, 0.5857528, 0.05098039, 0, 1, 1,
0.4192763, 1.249629, 3.295148, 0.05490196, 0, 1, 1,
0.4284622, -0.4215831, 3.390157, 0.0627451, 0, 1, 1,
0.4340738, -0.3308076, 2.764369, 0.06666667, 0, 1, 1,
0.434404, 2.172774, 1.461102, 0.07450981, 0, 1, 1,
0.4377757, -0.4365386, 2.651804, 0.07843138, 0, 1, 1,
0.4399063, -1.053977, 2.542309, 0.08627451, 0, 1, 1,
0.4434213, -1.55848, 3.640043, 0.09019608, 0, 1, 1,
0.4448926, 0.3387697, -0.03441514, 0.09803922, 0, 1, 1,
0.4577587, -0.3867947, 3.60592, 0.1058824, 0, 1, 1,
0.458773, -0.3002969, 2.76007, 0.1098039, 0, 1, 1,
0.4600022, -0.6069761, 2.499616, 0.1176471, 0, 1, 1,
0.4614573, -0.2205958, 3.035844, 0.1215686, 0, 1, 1,
0.4638278, 0.03966936, -0.6904159, 0.1294118, 0, 1, 1,
0.4667563, 0.6870958, 0.5366223, 0.1333333, 0, 1, 1,
0.4678774, 0.4696611, -0.2109338, 0.1411765, 0, 1, 1,
0.4681299, 0.3170528, 4.142969, 0.145098, 0, 1, 1,
0.4704915, 1.50972, -0.2158889, 0.1529412, 0, 1, 1,
0.470984, 0.3205112, 3.905866, 0.1568628, 0, 1, 1,
0.4725217, -0.5552245, 3.186846, 0.1647059, 0, 1, 1,
0.4732078, -0.008809171, 1.966862, 0.1686275, 0, 1, 1,
0.4736147, -0.2360203, 1.274589, 0.1764706, 0, 1, 1,
0.480396, 0.8717646, -0.1157348, 0.1803922, 0, 1, 1,
0.4838833, 1.054367, -1.51792, 0.1882353, 0, 1, 1,
0.4851993, 0.6120135, 1.969905, 0.1921569, 0, 1, 1,
0.4874531, 0.3513417, 2.946712, 0.2, 0, 1, 1,
0.4887734, -0.2942432, 3.281946, 0.2078431, 0, 1, 1,
0.5035808, 0.05823406, 0.535755, 0.2117647, 0, 1, 1,
0.5074661, -0.4185399, 3.679559, 0.2196078, 0, 1, 1,
0.5103828, -0.4490492, 0.4155604, 0.2235294, 0, 1, 1,
0.5137846, 0.07759115, 1.656243, 0.2313726, 0, 1, 1,
0.5142378, 1.62071, -1.140039, 0.2352941, 0, 1, 1,
0.5145077, 0.3850822, 0.334167, 0.2431373, 0, 1, 1,
0.5158593, 1.452463, 1.918609, 0.2470588, 0, 1, 1,
0.5218225, 2.51146, -2.281936, 0.254902, 0, 1, 1,
0.52274, -0.2263611, 2.712358, 0.2588235, 0, 1, 1,
0.5360338, -0.2023132, 3.560013, 0.2666667, 0, 1, 1,
0.5361667, 1.588178, -1.515732, 0.2705882, 0, 1, 1,
0.5361955, -0.4589033, 4.335783, 0.2784314, 0, 1, 1,
0.544072, -0.334734, 2.213323, 0.282353, 0, 1, 1,
0.5465933, -0.5391258, 2.330441, 0.2901961, 0, 1, 1,
0.5524409, -0.5901309, 3.879842, 0.2941177, 0, 1, 1,
0.5569876, -0.9419297, 4.320159, 0.3019608, 0, 1, 1,
0.5587389, 0.2693129, 0.09739065, 0.3098039, 0, 1, 1,
0.5617463, -0.5519856, 1.873794, 0.3137255, 0, 1, 1,
0.5675265, -0.2077924, 3.076792, 0.3215686, 0, 1, 1,
0.5689984, -0.9597138, 3.678093, 0.3254902, 0, 1, 1,
0.574698, -1.039392, 2.303503, 0.3333333, 0, 1, 1,
0.5752736, 0.91537, 2.169643, 0.3372549, 0, 1, 1,
0.5817553, 0.2205761, -0.7469503, 0.345098, 0, 1, 1,
0.5843091, -0.923465, 4.143778, 0.3490196, 0, 1, 1,
0.5944669, 2.596366, 0.6238547, 0.3568628, 0, 1, 1,
0.5960434, -1.835752, 1.63938, 0.3607843, 0, 1, 1,
0.5972757, -0.06681937, 2.266609, 0.3686275, 0, 1, 1,
0.5995622, -1.828857, 3.989641, 0.372549, 0, 1, 1,
0.6030693, 0.3803136, 1.890483, 0.3803922, 0, 1, 1,
0.6097719, -2.306892, 4.851437, 0.3843137, 0, 1, 1,
0.6116887, 0.03400946, 1.187038, 0.3921569, 0, 1, 1,
0.6173887, 1.1057, 0.870171, 0.3960784, 0, 1, 1,
0.6269276, 0.05732485, 1.61027, 0.4039216, 0, 1, 1,
0.6272351, 0.2447195, 1.245996, 0.4117647, 0, 1, 1,
0.6282366, -0.5431538, 2.863996, 0.4156863, 0, 1, 1,
0.6283764, 0.9177383, -0.3017597, 0.4235294, 0, 1, 1,
0.6303974, -1.453406, 2.492846, 0.427451, 0, 1, 1,
0.6367872, -1.203909, 1.375219, 0.4352941, 0, 1, 1,
0.6369503, -0.7704149, 3.122896, 0.4392157, 0, 1, 1,
0.6501235, -1.686929, 0.8960234, 0.4470588, 0, 1, 1,
0.6581227, -1.756394, 3.281764, 0.4509804, 0, 1, 1,
0.6634827, -0.1374215, 1.517082, 0.4588235, 0, 1, 1,
0.6659006, 2.916216, 1.08982, 0.4627451, 0, 1, 1,
0.6659766, 0.01894641, 1.381054, 0.4705882, 0, 1, 1,
0.6723091, -0.4097074, 2.376098, 0.4745098, 0, 1, 1,
0.6753982, -1.191899, 3.239874, 0.4823529, 0, 1, 1,
0.67552, 0.1474008, 2.235905, 0.4862745, 0, 1, 1,
0.6767792, -0.5237987, 1.890629, 0.4941176, 0, 1, 1,
0.6782503, -1.410143, 2.471708, 0.5019608, 0, 1, 1,
0.6783451, -1.013195, 2.273986, 0.5058824, 0, 1, 1,
0.6833591, 0.5714771, 0.8723501, 0.5137255, 0, 1, 1,
0.6871778, 1.093704, 2.981283, 0.5176471, 0, 1, 1,
0.6920269, 0.4274069, 2.981448, 0.5254902, 0, 1, 1,
0.6929812, -0.009341629, 2.185588, 0.5294118, 0, 1, 1,
0.6945397, 0.5004432, 0.5521473, 0.5372549, 0, 1, 1,
0.7044325, -1.810331, 2.656749, 0.5411765, 0, 1, 1,
0.7055751, 0.5258055, 0.4160951, 0.5490196, 0, 1, 1,
0.7079664, -1.251876, 2.697133, 0.5529412, 0, 1, 1,
0.7094918, 0.2308885, 2.295031, 0.5607843, 0, 1, 1,
0.7146322, 1.147093, 0.2162517, 0.5647059, 0, 1, 1,
0.7179808, 0.529838, 0.3054935, 0.572549, 0, 1, 1,
0.7208226, -0.08053405, 1.259242, 0.5764706, 0, 1, 1,
0.7267098, 0.1209847, 1.961337, 0.5843138, 0, 1, 1,
0.7276812, 0.0464197, 0.9212704, 0.5882353, 0, 1, 1,
0.7314589, 1.435532, 0.5211524, 0.5960785, 0, 1, 1,
0.7397648, -0.4216617, 3.812245, 0.6039216, 0, 1, 1,
0.7413055, -0.6941773, 2.371749, 0.6078432, 0, 1, 1,
0.7430122, -0.01446175, 1.930167, 0.6156863, 0, 1, 1,
0.744971, 0.02748627, 1.553887, 0.6196079, 0, 1, 1,
0.747925, 0.2683252, 1.281043, 0.627451, 0, 1, 1,
0.7523416, 0.6901512, -0.01494004, 0.6313726, 0, 1, 1,
0.7651491, -0.075212, 2.043423, 0.6392157, 0, 1, 1,
0.7670291, -0.8999915, 3.991311, 0.6431373, 0, 1, 1,
0.7694066, -0.3974605, 2.939961, 0.6509804, 0, 1, 1,
0.7713537, -1.361335, 2.485798, 0.654902, 0, 1, 1,
0.7787318, -0.132367, 3.440381, 0.6627451, 0, 1, 1,
0.7817031, -0.5675317, 3.447515, 0.6666667, 0, 1, 1,
0.79578, -0.9021102, 2.367009, 0.6745098, 0, 1, 1,
0.7970766, -0.03764176, 1.568378, 0.6784314, 0, 1, 1,
0.7999753, 0.4529274, 0.2088865, 0.6862745, 0, 1, 1,
0.8035708, -0.9750946, 2.338647, 0.6901961, 0, 1, 1,
0.8043303, -0.03531745, 0.528715, 0.6980392, 0, 1, 1,
0.8109248, 1.782996, 0.8592181, 0.7058824, 0, 1, 1,
0.8156788, -0.02261679, 2.33709, 0.7098039, 0, 1, 1,
0.8177325, 1.159301, 1.083247, 0.7176471, 0, 1, 1,
0.8235437, -1.48436, 1.864485, 0.7215686, 0, 1, 1,
0.8304564, -1.041389, 1.672296, 0.7294118, 0, 1, 1,
0.8320336, -1.918715, 3.004708, 0.7333333, 0, 1, 1,
0.8322569, -0.3227699, 1.385597, 0.7411765, 0, 1, 1,
0.8350347, -0.2638778, 1.973039, 0.7450981, 0, 1, 1,
0.8395405, -1.827673, 3.295245, 0.7529412, 0, 1, 1,
0.8430886, 1.559781, 0.4666653, 0.7568628, 0, 1, 1,
0.8445557, 1.703467, 1.809756, 0.7647059, 0, 1, 1,
0.8476768, 0.2977821, 2.112821, 0.7686275, 0, 1, 1,
0.8530697, -1.370345, 3.386093, 0.7764706, 0, 1, 1,
0.8533921, 1.344425, 1.039479, 0.7803922, 0, 1, 1,
0.8569335, 0.4008424, 1.224455, 0.7882353, 0, 1, 1,
0.8599287, 0.6745468, 0.1706898, 0.7921569, 0, 1, 1,
0.865018, 0.4630272, 0.6306564, 0.8, 0, 1, 1,
0.8786882, -1.222485, 1.139211, 0.8078431, 0, 1, 1,
0.8787314, 0.7033468, 0.5628272, 0.8117647, 0, 1, 1,
0.8821316, -2.091523, 2.299719, 0.8196079, 0, 1, 1,
0.8835294, 0.02158995, 1.514171, 0.8235294, 0, 1, 1,
0.8862651, -1.214833, 2.812292, 0.8313726, 0, 1, 1,
0.8872507, -0.8686574, 2.899068, 0.8352941, 0, 1, 1,
0.8879337, -1.30856, 2.646609, 0.8431373, 0, 1, 1,
0.890017, 0.5870925, -0.6065665, 0.8470588, 0, 1, 1,
0.8962921, 1.43848, 1.755438, 0.854902, 0, 1, 1,
0.8991829, 1.207895, 0.3297572, 0.8588235, 0, 1, 1,
0.9017813, -0.8124841, 2.821799, 0.8666667, 0, 1, 1,
0.902029, -0.8137736, 2.907885, 0.8705882, 0, 1, 1,
0.9027269, -0.5954257, 2.026343, 0.8784314, 0, 1, 1,
0.9053199, -0.2061824, 1.033336, 0.8823529, 0, 1, 1,
0.9074574, 0.9716482, 0.4921931, 0.8901961, 0, 1, 1,
0.913127, 1.313064, 0.3056716, 0.8941177, 0, 1, 1,
0.9161465, -0.2650269, 2.688689, 0.9019608, 0, 1, 1,
0.9176382, -1.952435, 0.8974543, 0.9098039, 0, 1, 1,
0.9238941, 2.444899, 0.2561417, 0.9137255, 0, 1, 1,
0.9249387, 0.3619835, 0.3226021, 0.9215686, 0, 1, 1,
0.9414138, -0.6745986, 2.887869, 0.9254902, 0, 1, 1,
0.9418716, -0.6052248, 0.9697365, 0.9333333, 0, 1, 1,
0.9472892, 0.1848277, 1.716724, 0.9372549, 0, 1, 1,
0.95214, 1.101676, 0.3290064, 0.945098, 0, 1, 1,
0.9554517, 0.4604574, 0.2453144, 0.9490196, 0, 1, 1,
0.9692745, -0.09548946, 1.309134, 0.9568627, 0, 1, 1,
0.9707454, -0.3980364, 1.180508, 0.9607843, 0, 1, 1,
0.9720172, 2.313304, 0.06575031, 0.9686275, 0, 1, 1,
0.9734441, 0.9678301, 3.292477, 0.972549, 0, 1, 1,
0.9738949, 0.5782754, 0.794519, 0.9803922, 0, 1, 1,
0.9750905, -0.04314849, -0.1683316, 0.9843137, 0, 1, 1,
0.975404, 1.021897, -0.5540271, 0.9921569, 0, 1, 1,
0.9764759, 0.7625749, 0.4297553, 0.9960784, 0, 1, 1,
0.9776427, -0.5143244, 2.948007, 1, 0, 0.9960784, 1,
0.9852459, 0.6997874, -1.900307, 1, 0, 0.9882353, 1,
0.996153, -1.040465, 4.846658, 1, 0, 0.9843137, 1,
0.9964573, 0.2355288, 1.602966, 1, 0, 0.9764706, 1,
1.006748, -0.3360457, 1.219184, 1, 0, 0.972549, 1,
1.009341, -0.8977388, 1.630521, 1, 0, 0.9647059, 1,
1.020189, -0.518657, 2.927981, 1, 0, 0.9607843, 1,
1.020482, -0.3880024, 3.083122, 1, 0, 0.9529412, 1,
1.032428, 0.6326929, 1.552688, 1, 0, 0.9490196, 1,
1.03545, 0.03889599, 1.659432, 1, 0, 0.9411765, 1,
1.038864, 0.1563386, 1.654821, 1, 0, 0.9372549, 1,
1.041214, -0.2661616, 3.275253, 1, 0, 0.9294118, 1,
1.041926, -1.038353, 2.483119, 1, 0, 0.9254902, 1,
1.043522, -0.424962, 1.583169, 1, 0, 0.9176471, 1,
1.052204, 0.1700769, 0.4729601, 1, 0, 0.9137255, 1,
1.063592, -1.023709, 3.50135, 1, 0, 0.9058824, 1,
1.068696, -1.419059, 1.753762, 1, 0, 0.9019608, 1,
1.073234, 0.009889886, 1.17328, 1, 0, 0.8941177, 1,
1.075074, -0.1529802, 2.36939, 1, 0, 0.8862745, 1,
1.076573, 1.810422, 0.641533, 1, 0, 0.8823529, 1,
1.08081, 1.204731, 1.005691, 1, 0, 0.8745098, 1,
1.08243, -1.3465, 2.815596, 1, 0, 0.8705882, 1,
1.084522, 0.323799, 2.149869, 1, 0, 0.8627451, 1,
1.084864, 1.386957, 1.890396, 1, 0, 0.8588235, 1,
1.086265, -1.046527, 1.889974, 1, 0, 0.8509804, 1,
1.101496, -1.904223, 3.227479, 1, 0, 0.8470588, 1,
1.107874, -0.3862899, 2.604011, 1, 0, 0.8392157, 1,
1.108606, -0.8876686, 2.665034, 1, 0, 0.8352941, 1,
1.114451, 0.6237105, 1.889261, 1, 0, 0.827451, 1,
1.122133, -0.05152821, 0.5965793, 1, 0, 0.8235294, 1,
1.123185, -0.5499219, 1.444632, 1, 0, 0.8156863, 1,
1.126017, -0.5179058, 2.251023, 1, 0, 0.8117647, 1,
1.127192, 0.2042545, 1.725625, 1, 0, 0.8039216, 1,
1.131734, -0.1554844, 1.958433, 1, 0, 0.7960784, 1,
1.133252, 0.77693, 1.146884, 1, 0, 0.7921569, 1,
1.137129, 1.161972, 1.000055, 1, 0, 0.7843137, 1,
1.141148, -0.8977965, 4.118874, 1, 0, 0.7803922, 1,
1.149597, -1.337506, 2.95838, 1, 0, 0.772549, 1,
1.149646, -1.830988, 1.756983, 1, 0, 0.7686275, 1,
1.151682, 2.019253, 0.7276795, 1, 0, 0.7607843, 1,
1.151972, -1.077947, 2.502496, 1, 0, 0.7568628, 1,
1.160884, 1.469151, -0.3759924, 1, 0, 0.7490196, 1,
1.16272, 0.2044855, 3.105168, 1, 0, 0.7450981, 1,
1.164512, -0.6215835, 2.880511, 1, 0, 0.7372549, 1,
1.164891, -0.5021074, 3.701921, 1, 0, 0.7333333, 1,
1.167, 1.543311, -0.7886509, 1, 0, 0.7254902, 1,
1.179698, -1.07308, 3.32318, 1, 0, 0.7215686, 1,
1.181257, 0.8772093, 1.137173, 1, 0, 0.7137255, 1,
1.193326, 1.768965, 0.7649827, 1, 0, 0.7098039, 1,
1.205465, 0.3422321, 0.4175658, 1, 0, 0.7019608, 1,
1.221186, -0.1565015, 1.437955, 1, 0, 0.6941177, 1,
1.226061, 0.2916833, 3.010323, 1, 0, 0.6901961, 1,
1.227153, 0.5771008, 1.547713, 1, 0, 0.682353, 1,
1.237168, -0.1308749, 2.829911, 1, 0, 0.6784314, 1,
1.240207, -0.1701169, 2.208565, 1, 0, 0.6705883, 1,
1.246134, 0.4221164, -0.01869314, 1, 0, 0.6666667, 1,
1.258092, 0.2909787, 1.701937, 1, 0, 0.6588235, 1,
1.268867, -1.707365, 5.23757, 1, 0, 0.654902, 1,
1.287476, 0.2143325, 0.9387503, 1, 0, 0.6470588, 1,
1.294441, -0.3504883, 1.628394, 1, 0, 0.6431373, 1,
1.295254, 0.6365696, 2.181461, 1, 0, 0.6352941, 1,
1.301506, -0.08982885, 0.9905508, 1, 0, 0.6313726, 1,
1.303431, -0.181568, 1.746044, 1, 0, 0.6235294, 1,
1.313856, 0.08209191, 2.940103, 1, 0, 0.6196079, 1,
1.331063, 1.095026, -0.4479446, 1, 0, 0.6117647, 1,
1.339158, -0.5733696, 1.426789, 1, 0, 0.6078432, 1,
1.345818, -1.121235, 1.611731, 1, 0, 0.6, 1,
1.346907, -0.459093, 4.408848, 1, 0, 0.5921569, 1,
1.34937, 0.1558431, 0.4594478, 1, 0, 0.5882353, 1,
1.351185, 0.1985568, 2.522531, 1, 0, 0.5803922, 1,
1.365314, 0.5828139, 1.236604, 1, 0, 0.5764706, 1,
1.366536, 1.955156, 1.266074, 1, 0, 0.5686275, 1,
1.369551, 1.159784, 1.095838, 1, 0, 0.5647059, 1,
1.371561, 0.2859477, 1.577548, 1, 0, 0.5568628, 1,
1.372927, -0.1565949, 1.37592, 1, 0, 0.5529412, 1,
1.375567, 1.556336, 0.4480306, 1, 0, 0.5450981, 1,
1.400842, -0.6322005, 2.238452, 1, 0, 0.5411765, 1,
1.410211, 0.825544, 0.7915049, 1, 0, 0.5333334, 1,
1.420627, -1.286151, 2.761565, 1, 0, 0.5294118, 1,
1.421985, -0.5876035, 3.194878, 1, 0, 0.5215687, 1,
1.427176, 0.7208149, 2.030846, 1, 0, 0.5176471, 1,
1.42872, -0.9183509, 2.741678, 1, 0, 0.509804, 1,
1.429524, -0.2108179, 2.746636, 1, 0, 0.5058824, 1,
1.431158, -1.454561, 1.789003, 1, 0, 0.4980392, 1,
1.432119, 0.07508908, 0.8484412, 1, 0, 0.4901961, 1,
1.437338, 0.802027, 0.4382133, 1, 0, 0.4862745, 1,
1.438595, 0.1735713, 2.147379, 1, 0, 0.4784314, 1,
1.439614, 0.6795828, 1.647563, 1, 0, 0.4745098, 1,
1.441626, 0.1545801, 1.638221, 1, 0, 0.4666667, 1,
1.442696, -0.5545616, 3.799834, 1, 0, 0.4627451, 1,
1.450713, -0.8696946, 3.977879, 1, 0, 0.454902, 1,
1.453682, 0.6777465, 1.118632, 1, 0, 0.4509804, 1,
1.462585, -0.3096214, 2.439251, 1, 0, 0.4431373, 1,
1.465591, 0.4075429, 0.001868549, 1, 0, 0.4392157, 1,
1.466854, 0.0364519, 3.580588, 1, 0, 0.4313726, 1,
1.466884, 0.2362066, 1.899652, 1, 0, 0.427451, 1,
1.47734, 0.299124, 0.634731, 1, 0, 0.4196078, 1,
1.499536, -0.4683469, 2.633819, 1, 0, 0.4156863, 1,
1.506648, 0.3963418, 2.256598, 1, 0, 0.4078431, 1,
1.511842, -0.7937392, 1.320781, 1, 0, 0.4039216, 1,
1.512754, -0.765783, 2.124999, 1, 0, 0.3960784, 1,
1.513668, -0.9196942, 2.240434, 1, 0, 0.3882353, 1,
1.523367, -0.6269782, 2.239137, 1, 0, 0.3843137, 1,
1.529156, -0.2937277, 0.7669298, 1, 0, 0.3764706, 1,
1.53524, 0.2007835, 3.176969, 1, 0, 0.372549, 1,
1.552618, 0.7102335, 1.691942, 1, 0, 0.3647059, 1,
1.558599, -0.8082574, 1.328038, 1, 0, 0.3607843, 1,
1.5693, -0.3310974, 0.05352762, 1, 0, 0.3529412, 1,
1.590209, 0.1368558, -0.3548331, 1, 0, 0.3490196, 1,
1.590291, -1.624051, 0.6042495, 1, 0, 0.3411765, 1,
1.592551, 1.594532, -1.15421, 1, 0, 0.3372549, 1,
1.597684, 0.1088371, 1.967244, 1, 0, 0.3294118, 1,
1.600249, 0.07206357, -0.4396016, 1, 0, 0.3254902, 1,
1.61535, -1.007574, 1.698311, 1, 0, 0.3176471, 1,
1.620835, 0.2080988, 2.075417, 1, 0, 0.3137255, 1,
1.625373, -0.1649163, 1.43651, 1, 0, 0.3058824, 1,
1.630112, 1.208418, 0.2819987, 1, 0, 0.2980392, 1,
1.631209, -0.7981346, 3.120354, 1, 0, 0.2941177, 1,
1.638721, -1.605129, 0.8113284, 1, 0, 0.2862745, 1,
1.639269, 1.115384, 1.725793, 1, 0, 0.282353, 1,
1.641834, 1.798244, 0.2717058, 1, 0, 0.2745098, 1,
1.647816, 1.117001, 1.324225, 1, 0, 0.2705882, 1,
1.648416, -0.1911063, 0.7763048, 1, 0, 0.2627451, 1,
1.655561, 0.360324, 0.6246889, 1, 0, 0.2588235, 1,
1.65592, 1.289649, 1.551888, 1, 0, 0.2509804, 1,
1.660197, 0.9300039, 0.8155916, 1, 0, 0.2470588, 1,
1.664463, 0.144657, 2.451846, 1, 0, 0.2392157, 1,
1.70322, 0.5758538, 2.574771, 1, 0, 0.2352941, 1,
1.724552, 0.8860719, 1.628633, 1, 0, 0.227451, 1,
1.737491, 1.129281, -1.662516, 1, 0, 0.2235294, 1,
1.748806, 1.037451, 2.443837, 1, 0, 0.2156863, 1,
1.762345, -0.05919873, 0.485756, 1, 0, 0.2117647, 1,
1.795251, -0.4009506, 2.751617, 1, 0, 0.2039216, 1,
1.799283, 0.04474777, 2.368202, 1, 0, 0.1960784, 1,
1.807852, 1.597591, 0.1476842, 1, 0, 0.1921569, 1,
1.817533, 0.4062803, 1.104318, 1, 0, 0.1843137, 1,
1.820762, 1.214578, 0.8288713, 1, 0, 0.1803922, 1,
1.821653, -1.234134, 1.806268, 1, 0, 0.172549, 1,
1.825594, -1.226603, 1.368721, 1, 0, 0.1686275, 1,
1.85479, -0.08549012, 1.678996, 1, 0, 0.1607843, 1,
1.856295, -2.293001, 1.995973, 1, 0, 0.1568628, 1,
1.877097, -0.5612422, 2.990527, 1, 0, 0.1490196, 1,
1.88089, -0.283204, 3.098574, 1, 0, 0.145098, 1,
1.880919, -0.2441055, 2.490542, 1, 0, 0.1372549, 1,
1.937071, 0.8654789, 3.249826, 1, 0, 0.1333333, 1,
1.949675, -0.2579678, 0.06840441, 1, 0, 0.1254902, 1,
1.99007, 1.197799, 2.476649, 1, 0, 0.1215686, 1,
2.006802, 2.194669, 0.06724326, 1, 0, 0.1137255, 1,
2.073842, -0.8677333, 4.175593, 1, 0, 0.1098039, 1,
2.090661, 1.751785, 1.199554, 1, 0, 0.1019608, 1,
2.0964, 0.8012949, 0.6971451, 1, 0, 0.09411765, 1,
2.105334, -0.4870109, 1.672601, 1, 0, 0.09019608, 1,
2.106268, 1.147362, 0.3836536, 1, 0, 0.08235294, 1,
2.143183, 0.5744979, 0.8211851, 1, 0, 0.07843138, 1,
2.209994, -0.9439241, 3.211864, 1, 0, 0.07058824, 1,
2.303304, -0.01449196, 1.953768, 1, 0, 0.06666667, 1,
2.401226, -0.4181534, 1.935847, 1, 0, 0.05882353, 1,
2.410805, 0.4089445, 1.068676, 1, 0, 0.05490196, 1,
2.424442, 0.3676742, 0.9275844, 1, 0, 0.04705882, 1,
2.438662, 0.05195376, 1.544325, 1, 0, 0.04313726, 1,
2.45479, -1.941041, 0.8543512, 1, 0, 0.03529412, 1,
2.486875, -0.4163946, 2.377705, 1, 0, 0.03137255, 1,
2.498593, -1.676095, 2.865428, 1, 0, 0.02352941, 1,
2.634694, 0.4349951, 2.0935, 1, 0, 0.01960784, 1,
2.744558, 0.319197, 1.926979, 1, 0, 0.01176471, 1,
2.759045, -0.9574749, 1.794458, 1, 0, 0.007843138, 1
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
-0.1925076, -4.342999, -8.306192, 0, -0.5, 0.5, 0.5,
-0.1925076, -4.342999, -8.306192, 1, -0.5, 0.5, 0.5,
-0.1925076, -4.342999, -8.306192, 1, 1.5, 0.5, 0.5,
-0.1925076, -4.342999, -8.306192, 0, 1.5, 0.5, 0.5
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
-4.144637, -0.1326529, -8.306192, 0, -0.5, 0.5, 0.5,
-4.144637, -0.1326529, -8.306192, 1, -0.5, 0.5, 0.5,
-4.144637, -0.1326529, -8.306192, 1, 1.5, 0.5, 0.5,
-4.144637, -0.1326529, -8.306192, 0, 1.5, 0.5, 0.5
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
-4.144637, -4.342999, -0.05558228, 0, -0.5, 0.5, 0.5,
-4.144637, -4.342999, -0.05558228, 1, -0.5, 0.5, 0.5,
-4.144637, -4.342999, -0.05558228, 1, 1.5, 0.5, 0.5,
-4.144637, -4.342999, -0.05558228, 0, 1.5, 0.5, 0.5
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
-3, -3.371381, -6.402205,
2, -3.371381, -6.402205,
-3, -3.371381, -6.402205,
-3, -3.533317, -6.719537,
-2, -3.371381, -6.402205,
-2, -3.533317, -6.719537,
-1, -3.371381, -6.402205,
-1, -3.533317, -6.719537,
0, -3.371381, -6.402205,
0, -3.533317, -6.719537,
1, -3.371381, -6.402205,
1, -3.533317, -6.719537,
2, -3.371381, -6.402205,
2, -3.533317, -6.719537
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
-3, -3.85719, -7.354199, 0, -0.5, 0.5, 0.5,
-3, -3.85719, -7.354199, 1, -0.5, 0.5, 0.5,
-3, -3.85719, -7.354199, 1, 1.5, 0.5, 0.5,
-3, -3.85719, -7.354199, 0, 1.5, 0.5, 0.5,
-2, -3.85719, -7.354199, 0, -0.5, 0.5, 0.5,
-2, -3.85719, -7.354199, 1, -0.5, 0.5, 0.5,
-2, -3.85719, -7.354199, 1, 1.5, 0.5, 0.5,
-2, -3.85719, -7.354199, 0, 1.5, 0.5, 0.5,
-1, -3.85719, -7.354199, 0, -0.5, 0.5, 0.5,
-1, -3.85719, -7.354199, 1, -0.5, 0.5, 0.5,
-1, -3.85719, -7.354199, 1, 1.5, 0.5, 0.5,
-1, -3.85719, -7.354199, 0, 1.5, 0.5, 0.5,
0, -3.85719, -7.354199, 0, -0.5, 0.5, 0.5,
0, -3.85719, -7.354199, 1, -0.5, 0.5, 0.5,
0, -3.85719, -7.354199, 1, 1.5, 0.5, 0.5,
0, -3.85719, -7.354199, 0, 1.5, 0.5, 0.5,
1, -3.85719, -7.354199, 0, -0.5, 0.5, 0.5,
1, -3.85719, -7.354199, 1, -0.5, 0.5, 0.5,
1, -3.85719, -7.354199, 1, 1.5, 0.5, 0.5,
1, -3.85719, -7.354199, 0, 1.5, 0.5, 0.5,
2, -3.85719, -7.354199, 0, -0.5, 0.5, 0.5,
2, -3.85719, -7.354199, 1, -0.5, 0.5, 0.5,
2, -3.85719, -7.354199, 1, 1.5, 0.5, 0.5,
2, -3.85719, -7.354199, 0, 1.5, 0.5, 0.5
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
-3.232607, -3, -6.402205,
-3.232607, 3, -6.402205,
-3.232607, -3, -6.402205,
-3.384612, -3, -6.719537,
-3.232607, -2, -6.402205,
-3.384612, -2, -6.719537,
-3.232607, -1, -6.402205,
-3.384612, -1, -6.719537,
-3.232607, 0, -6.402205,
-3.384612, 0, -6.719537,
-3.232607, 1, -6.402205,
-3.384612, 1, -6.719537,
-3.232607, 2, -6.402205,
-3.384612, 2, -6.719537,
-3.232607, 3, -6.402205,
-3.384612, 3, -6.719537
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
-3.688622, -3, -7.354199, 0, -0.5, 0.5, 0.5,
-3.688622, -3, -7.354199, 1, -0.5, 0.5, 0.5,
-3.688622, -3, -7.354199, 1, 1.5, 0.5, 0.5,
-3.688622, -3, -7.354199, 0, 1.5, 0.5, 0.5,
-3.688622, -2, -7.354199, 0, -0.5, 0.5, 0.5,
-3.688622, -2, -7.354199, 1, -0.5, 0.5, 0.5,
-3.688622, -2, -7.354199, 1, 1.5, 0.5, 0.5,
-3.688622, -2, -7.354199, 0, 1.5, 0.5, 0.5,
-3.688622, -1, -7.354199, 0, -0.5, 0.5, 0.5,
-3.688622, -1, -7.354199, 1, -0.5, 0.5, 0.5,
-3.688622, -1, -7.354199, 1, 1.5, 0.5, 0.5,
-3.688622, -1, -7.354199, 0, 1.5, 0.5, 0.5,
-3.688622, 0, -7.354199, 0, -0.5, 0.5, 0.5,
-3.688622, 0, -7.354199, 1, -0.5, 0.5, 0.5,
-3.688622, 0, -7.354199, 1, 1.5, 0.5, 0.5,
-3.688622, 0, -7.354199, 0, 1.5, 0.5, 0.5,
-3.688622, 1, -7.354199, 0, -0.5, 0.5, 0.5,
-3.688622, 1, -7.354199, 1, -0.5, 0.5, 0.5,
-3.688622, 1, -7.354199, 1, 1.5, 0.5, 0.5,
-3.688622, 1, -7.354199, 0, 1.5, 0.5, 0.5,
-3.688622, 2, -7.354199, 0, -0.5, 0.5, 0.5,
-3.688622, 2, -7.354199, 1, -0.5, 0.5, 0.5,
-3.688622, 2, -7.354199, 1, 1.5, 0.5, 0.5,
-3.688622, 2, -7.354199, 0, 1.5, 0.5, 0.5,
-3.688622, 3, -7.354199, 0, -0.5, 0.5, 0.5,
-3.688622, 3, -7.354199, 1, -0.5, 0.5, 0.5,
-3.688622, 3, -7.354199, 1, 1.5, 0.5, 0.5,
-3.688622, 3, -7.354199, 0, 1.5, 0.5, 0.5
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
-3.232607, -3.371381, -6,
-3.232607, -3.371381, 6,
-3.232607, -3.371381, -6,
-3.384612, -3.533317, -6,
-3.232607, -3.371381, -4,
-3.384612, -3.533317, -4,
-3.232607, -3.371381, -2,
-3.384612, -3.533317, -2,
-3.232607, -3.371381, 0,
-3.384612, -3.533317, 0,
-3.232607, -3.371381, 2,
-3.384612, -3.533317, 2,
-3.232607, -3.371381, 4,
-3.384612, -3.533317, 4,
-3.232607, -3.371381, 6,
-3.384612, -3.533317, 6
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
"4",
"6"
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
-3.688622, -3.85719, -6, 0, -0.5, 0.5, 0.5,
-3.688622, -3.85719, -6, 1, -0.5, 0.5, 0.5,
-3.688622, -3.85719, -6, 1, 1.5, 0.5, 0.5,
-3.688622, -3.85719, -6, 0, 1.5, 0.5, 0.5,
-3.688622, -3.85719, -4, 0, -0.5, 0.5, 0.5,
-3.688622, -3.85719, -4, 1, -0.5, 0.5, 0.5,
-3.688622, -3.85719, -4, 1, 1.5, 0.5, 0.5,
-3.688622, -3.85719, -4, 0, 1.5, 0.5, 0.5,
-3.688622, -3.85719, -2, 0, -0.5, 0.5, 0.5,
-3.688622, -3.85719, -2, 1, -0.5, 0.5, 0.5,
-3.688622, -3.85719, -2, 1, 1.5, 0.5, 0.5,
-3.688622, -3.85719, -2, 0, 1.5, 0.5, 0.5,
-3.688622, -3.85719, 0, 0, -0.5, 0.5, 0.5,
-3.688622, -3.85719, 0, 1, -0.5, 0.5, 0.5,
-3.688622, -3.85719, 0, 1, 1.5, 0.5, 0.5,
-3.688622, -3.85719, 0, 0, 1.5, 0.5, 0.5,
-3.688622, -3.85719, 2, 0, -0.5, 0.5, 0.5,
-3.688622, -3.85719, 2, 1, -0.5, 0.5, 0.5,
-3.688622, -3.85719, 2, 1, 1.5, 0.5, 0.5,
-3.688622, -3.85719, 2, 0, 1.5, 0.5, 0.5,
-3.688622, -3.85719, 4, 0, -0.5, 0.5, 0.5,
-3.688622, -3.85719, 4, 1, -0.5, 0.5, 0.5,
-3.688622, -3.85719, 4, 1, 1.5, 0.5, 0.5,
-3.688622, -3.85719, 4, 0, 1.5, 0.5, 0.5,
-3.688622, -3.85719, 6, 0, -0.5, 0.5, 0.5,
-3.688622, -3.85719, 6, 1, -0.5, 0.5, 0.5,
-3.688622, -3.85719, 6, 1, 1.5, 0.5, 0.5,
-3.688622, -3.85719, 6, 0, 1.5, 0.5, 0.5
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
-3.232607, -3.371381, -6.402205,
-3.232607, 3.106075, -6.402205,
-3.232607, -3.371381, 6.291041,
-3.232607, 3.106075, 6.291041,
-3.232607, -3.371381, -6.402205,
-3.232607, -3.371381, 6.291041,
-3.232607, 3.106075, -6.402205,
-3.232607, 3.106075, 6.291041,
-3.232607, -3.371381, -6.402205,
2.847591, -3.371381, -6.402205,
-3.232607, -3.371381, 6.291041,
2.847591, -3.371381, 6.291041,
-3.232607, 3.106075, -6.402205,
2.847591, 3.106075, -6.402205,
-3.232607, 3.106075, 6.291041,
2.847591, 3.106075, 6.291041,
2.847591, -3.371381, -6.402205,
2.847591, 3.106075, -6.402205,
2.847591, -3.371381, 6.291041,
2.847591, 3.106075, 6.291041,
2.847591, -3.371381, -6.402205,
2.847591, -3.371381, 6.291041,
2.847591, 3.106075, -6.402205,
2.847591, 3.106075, 6.291041
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
var radius = 8.273163;
var distance = 36.80823;
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
mvMatrix.translate( 0.1925076, 0.1326529, 0.05558228 );
mvMatrix.scale( 1.471187, 1.38096, 0.7047138 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.80823);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
azafenidin<-read.table("azafenidin.xyz")
```

```
## Error in read.table("azafenidin.xyz"): no lines available in input
```

```r
x<-azafenidin$V2
```

```
## Error in eval(expr, envir, enclos): object 'azafenidin' not found
```

```r
y<-azafenidin$V3
```

```
## Error in eval(expr, envir, enclos): object 'azafenidin' not found
```

```r
z<-azafenidin$V4
```

```
## Error in eval(expr, envir, enclos): object 'azafenidin' not found
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
-3.14406, -0.7988296, -1.259818, 0, 0, 1, 1, 1,
-3.062265, 0.3550012, -1.114269, 1, 0, 0, 1, 1,
-3.036134, -0.9211504, -2.044864, 1, 0, 0, 1, 1,
-2.828481, 0.1971585, -1.561088, 1, 0, 0, 1, 1,
-2.727594, 1.02859, 1.333538, 1, 0, 0, 1, 1,
-2.704959, -0.1772008, -1.943333, 1, 0, 0, 1, 1,
-2.681719, -0.1634114, -3.825238, 0, 0, 0, 1, 1,
-2.652365, 1.406725, -1.235892, 0, 0, 0, 1, 1,
-2.487081, 0.9368905, -1.475258, 0, 0, 0, 1, 1,
-2.469669, 0.2724206, -2.202458, 0, 0, 0, 1, 1,
-2.411157, -0.3306631, -0.1774544, 0, 0, 0, 1, 1,
-2.363446, -0.4966099, -1.200283, 0, 0, 0, 1, 1,
-2.25615, 0.6158504, -0.4676197, 0, 0, 0, 1, 1,
-2.239979, 0.1347233, -0.8616584, 1, 1, 1, 1, 1,
-2.218296, 0.05970882, -0.01647106, 1, 1, 1, 1, 1,
-2.207911, 0.7595192, 0.5908234, 1, 1, 1, 1, 1,
-2.130321, -0.009161732, -1.013805, 1, 1, 1, 1, 1,
-2.129332, 0.9712975, 0.2084456, 1, 1, 1, 1, 1,
-2.126178, -0.8318937, -0.4144152, 1, 1, 1, 1, 1,
-2.083473, 1.226829, -1.487292, 1, 1, 1, 1, 1,
-2.082183, -1.161961, -2.158972, 1, 1, 1, 1, 1,
-2.069031, -1.989787, -1.630839, 1, 1, 1, 1, 1,
-2.066783, -0.08970757, -0.2331128, 1, 1, 1, 1, 1,
-1.973739, 0.9666943, -0.3811449, 1, 1, 1, 1, 1,
-1.947196, -1.026189, -1.710027, 1, 1, 1, 1, 1,
-1.943053, 1.304378, -1.190595, 1, 1, 1, 1, 1,
-1.930141, -0.4281896, -1.43623, 1, 1, 1, 1, 1,
-1.882124, 2.380296, -1.321738, 1, 1, 1, 1, 1,
-1.863726, 0.4128492, -0.3942477, 0, 0, 1, 1, 1,
-1.829133, -0.8688656, -2.030924, 1, 0, 0, 1, 1,
-1.825325, 0.5552505, -0.5572076, 1, 0, 0, 1, 1,
-1.806528, 0.7834674, -2.286636, 1, 0, 0, 1, 1,
-1.797395, -1.708663, -0.8618494, 1, 0, 0, 1, 1,
-1.782853, 0.1949166, -1.391811, 1, 0, 0, 1, 1,
-1.763413, -0.5020325, -2.451895, 0, 0, 0, 1, 1,
-1.758774, 0.2884971, -2.293122, 0, 0, 0, 1, 1,
-1.73792, 0.1194097, -1.772138, 0, 0, 0, 1, 1,
-1.728214, -0.3299102, -2.322341, 0, 0, 0, 1, 1,
-1.723515, 0.7384402, -1.360754, 0, 0, 0, 1, 1,
-1.709898, 0.4732042, -1.481134, 0, 0, 0, 1, 1,
-1.689042, 1.851699, -2.413551, 0, 0, 0, 1, 1,
-1.654065, 0.02487366, -2.543947, 1, 1, 1, 1, 1,
-1.641775, 0.3627412, -2.020016, 1, 1, 1, 1, 1,
-1.633025, -1.013359, -3.027835, 1, 1, 1, 1, 1,
-1.629912, -1.621216, -0.9009603, 1, 1, 1, 1, 1,
-1.628285, 0.06146133, -1.473139, 1, 1, 1, 1, 1,
-1.621034, 1.7085, -0.6792706, 1, 1, 1, 1, 1,
-1.618935, 0.03574935, -2.159518, 1, 1, 1, 1, 1,
-1.610599, 0.9725187, -0.7974271, 1, 1, 1, 1, 1,
-1.608317, 0.1629269, -2.0351, 1, 1, 1, 1, 1,
-1.595699, -0.4696081, -2.039675, 1, 1, 1, 1, 1,
-1.574704, 1.010612, -1.815208, 1, 1, 1, 1, 1,
-1.564368, 0.008978556, -2.541546, 1, 1, 1, 1, 1,
-1.559583, 0.6738892, -0.1197181, 1, 1, 1, 1, 1,
-1.557469, -0.328379, -0.2562709, 1, 1, 1, 1, 1,
-1.542104, 0.4488132, -1.119535, 1, 1, 1, 1, 1,
-1.533144, -0.5421801, -2.656501, 0, 0, 1, 1, 1,
-1.521471, 1.618193, -0.3565103, 1, 0, 0, 1, 1,
-1.5034, 1.511336, -2.120188, 1, 0, 0, 1, 1,
-1.503146, -2.81804, -2.411738, 1, 0, 0, 1, 1,
-1.48813, -0.4885243, -2.597806, 1, 0, 0, 1, 1,
-1.478961, -0.001260086, -0.3349316, 1, 0, 0, 1, 1,
-1.473953, 0.5039756, -2.119616, 0, 0, 0, 1, 1,
-1.458736, -0.9020302, -1.853552, 0, 0, 0, 1, 1,
-1.44436, 0.1526799, -2.251708, 0, 0, 0, 1, 1,
-1.433716, 1.317042, -1.483972, 0, 0, 0, 1, 1,
-1.425529, -0.3363826, -2.249387, 0, 0, 0, 1, 1,
-1.424995, 0.3625121, -1.433094, 0, 0, 0, 1, 1,
-1.42467, -1.278655, -2.371168, 0, 0, 0, 1, 1,
-1.418505, -0.5340197, -0.9727352, 1, 1, 1, 1, 1,
-1.407644, -1.123157, -2.493511, 1, 1, 1, 1, 1,
-1.405424, -0.4504562, -1.576064, 1, 1, 1, 1, 1,
-1.401138, 1.447239, -1.294395, 1, 1, 1, 1, 1,
-1.399127, -0.2834276, -1.068376, 1, 1, 1, 1, 1,
-1.397721, 0.2990295, -0.5924943, 1, 1, 1, 1, 1,
-1.392857, 2.193193, -1.293454, 1, 1, 1, 1, 1,
-1.388979, -0.9609626, -1.35311, 1, 1, 1, 1, 1,
-1.37842, -0.146638, -1.234735, 1, 1, 1, 1, 1,
-1.378377, -0.989455, -2.504005, 1, 1, 1, 1, 1,
-1.376829, -1.680069, -1.497985, 1, 1, 1, 1, 1,
-1.370448, -1.517024, -3.994079, 1, 1, 1, 1, 1,
-1.351419, 0.2656784, -1.676668, 1, 1, 1, 1, 1,
-1.346328, -0.006980862, -1.794581, 1, 1, 1, 1, 1,
-1.33907, 0.4173453, -1.109462, 1, 1, 1, 1, 1,
-1.334925, 0.7591132, -1.403211, 0, 0, 1, 1, 1,
-1.332225, 0.6588028, -1.615399, 1, 0, 0, 1, 1,
-1.318998, -1.113127, -4.492007, 1, 0, 0, 1, 1,
-1.315976, -0.3104167, -1.81236, 1, 0, 0, 1, 1,
-1.315016, 0.4777218, -0.5588757, 1, 0, 0, 1, 1,
-1.30512, 0.3514995, -2.463963, 1, 0, 0, 1, 1,
-1.303693, -2.211751, -3.058846, 0, 0, 0, 1, 1,
-1.301018, 1.266291, -2.417584, 0, 0, 0, 1, 1,
-1.300523, -0.5343999, -1.007242, 0, 0, 0, 1, 1,
-1.299828, 1.417689, -0.2825221, 0, 0, 0, 1, 1,
-1.297374, -0.4317914, -3.066008, 0, 0, 0, 1, 1,
-1.283767, -0.2964698, -1.524835, 0, 0, 0, 1, 1,
-1.273004, -2.111824, -2.840806, 0, 0, 0, 1, 1,
-1.271536, -0.1351983, -0.4239148, 1, 1, 1, 1, 1,
-1.267348, 1.102061, 0.2610371, 1, 1, 1, 1, 1,
-1.264012, 0.1242236, -0.5650094, 1, 1, 1, 1, 1,
-1.25892, -0.009125026, -1.174297, 1, 1, 1, 1, 1,
-1.258098, -0.9564956, -2.458296, 1, 1, 1, 1, 1,
-1.243308, -1.555541, -1.974452, 1, 1, 1, 1, 1,
-1.235942, -0.4402961, -0.9891165, 1, 1, 1, 1, 1,
-1.227716, -0.01918806, -1.575111, 1, 1, 1, 1, 1,
-1.225972, -1.39442, -1.207978, 1, 1, 1, 1, 1,
-1.22582, -1.339073, -3.482357, 1, 1, 1, 1, 1,
-1.219901, 0.8818645, -0.627194, 1, 1, 1, 1, 1,
-1.213342, -1.906052, -2.761909, 1, 1, 1, 1, 1,
-1.203754, -0.1144735, -1.603428, 1, 1, 1, 1, 1,
-1.199768, 1.526153, -0.9156614, 1, 1, 1, 1, 1,
-1.19532, -0.3536415, -3.301782, 1, 1, 1, 1, 1,
-1.194426, 0.8388858, -0.3754695, 0, 0, 1, 1, 1,
-1.194188, -2.540443, -3.485281, 1, 0, 0, 1, 1,
-1.193066, 0.8667534, -1.262491, 1, 0, 0, 1, 1,
-1.190347, -1.285195, -2.341305, 1, 0, 0, 1, 1,
-1.174899, 1.456877, 0.6352444, 1, 0, 0, 1, 1,
-1.174361, -1.213279, -2.423635, 1, 0, 0, 1, 1,
-1.17398, 0.5303144, -0.255987, 0, 0, 0, 1, 1,
-1.172967, 0.9406561, -0.9465401, 0, 0, 0, 1, 1,
-1.171848, -0.3437159, -4.0346, 0, 0, 0, 1, 1,
-1.170124, 0.2082738, -0.4674636, 0, 0, 0, 1, 1,
-1.169039, 0.4030028, -0.8963421, 0, 0, 0, 1, 1,
-1.167629, -2.084905, -3.677737, 0, 0, 0, 1, 1,
-1.159457, -1.523313, -3.232483, 0, 0, 0, 1, 1,
-1.150427, -0.6765031, -2.397601, 1, 1, 1, 1, 1,
-1.148692, -0.432423, -1.644424, 1, 1, 1, 1, 1,
-1.147369, -1.141344, -3.18461, 1, 1, 1, 1, 1,
-1.137216, -1.535666, -4.241211, 1, 1, 1, 1, 1,
-1.135221, -0.8165901, -0.9252808, 1, 1, 1, 1, 1,
-1.127705, 0.1692524, -0.6683363, 1, 1, 1, 1, 1,
-1.120698, -1.999935, -2.880219, 1, 1, 1, 1, 1,
-1.119532, -1.766159, -2.626997, 1, 1, 1, 1, 1,
-1.118793, 1.246841, 0.35173, 1, 1, 1, 1, 1,
-1.117233, -0.7726865, -2.766059, 1, 1, 1, 1, 1,
-1.11306, 0.9051671, -1.415603, 1, 1, 1, 1, 1,
-1.107017, -0.208628, -1.112924, 1, 1, 1, 1, 1,
-1.104221, 0.6333226, -0.5618246, 1, 1, 1, 1, 1,
-1.087936, -0.8399096, -3.158992, 1, 1, 1, 1, 1,
-1.08147, -1.392841, -2.721892, 1, 1, 1, 1, 1,
-1.072235, 1.34214, 0.9754316, 0, 0, 1, 1, 1,
-1.070505, -0.07244091, -2.712925, 1, 0, 0, 1, 1,
-1.062754, -0.2704698, -2.238574, 1, 0, 0, 1, 1,
-1.05726, 1.306774, -0.6823493, 1, 0, 0, 1, 1,
-1.057159, 1.57971, -0.2461465, 1, 0, 0, 1, 1,
-1.056326, 0.5503956, -0.5481651, 1, 0, 0, 1, 1,
-1.054519, 1.428724, -0.8681051, 0, 0, 0, 1, 1,
-1.045646, -0.0716667, -1.694914, 0, 0, 0, 1, 1,
-1.041769, 1.689043, -1.577608, 0, 0, 0, 1, 1,
-1.038083, 0.7396622, -1.744169, 0, 0, 0, 1, 1,
-1.029482, 0.5434777, -1.961998, 0, 0, 0, 1, 1,
-1.025977, -0.1647639, -2.627794, 0, 0, 0, 1, 1,
-1.024692, -1.740831, -1.734287, 0, 0, 0, 1, 1,
-1.024623, -1.772758, -2.432188, 1, 1, 1, 1, 1,
-1.022574, -0.3288702, -0.4301593, 1, 1, 1, 1, 1,
-1.022228, -0.1588827, -0.6991446, 1, 1, 1, 1, 1,
-1.020597, -0.7928197, -3.032175, 1, 1, 1, 1, 1,
-1.018939, 0.4279891, -1.887483, 1, 1, 1, 1, 1,
-1.011073, 0.1063105, -1.31336, 1, 1, 1, 1, 1,
-1.005187, -0.2278914, -3.20614, 1, 1, 1, 1, 1,
-1.004455, -0.3925372, -1.536263, 1, 1, 1, 1, 1,
-0.9981377, -0.3228086, -2.87434, 1, 1, 1, 1, 1,
-0.9946215, 0.08871566, -1.11436, 1, 1, 1, 1, 1,
-0.9816874, 0.1996643, -2.158868, 1, 1, 1, 1, 1,
-0.9676263, -0.5239593, -1.431342, 1, 1, 1, 1, 1,
-0.9652718, 0.0817593, -4.231418, 1, 1, 1, 1, 1,
-0.9581743, 0.7865281, -2.000033, 1, 1, 1, 1, 1,
-0.9572445, -0.5548504, -3.533238, 1, 1, 1, 1, 1,
-0.9565102, 1.261833, 1.287781, 0, 0, 1, 1, 1,
-0.9513603, -1.473665, -0.9926422, 1, 0, 0, 1, 1,
-0.9327606, 1.377164, -1.328202, 1, 0, 0, 1, 1,
-0.9317768, 0.4197545, -1.90957, 1, 0, 0, 1, 1,
-0.9277777, 0.3709817, -0.3187196, 1, 0, 0, 1, 1,
-0.9243295, -1.210725, -2.244838, 1, 0, 0, 1, 1,
-0.9226062, 0.1650005, -2.597883, 0, 0, 0, 1, 1,
-0.9050701, 0.3542998, -1.368751, 0, 0, 0, 1, 1,
-0.9036077, 1.040623, -2.052618, 0, 0, 0, 1, 1,
-0.9035378, 1.449286, -0.8099324, 0, 0, 0, 1, 1,
-0.8987834, 0.5377433, -2.72661, 0, 0, 0, 1, 1,
-0.8897952, 0.006417745, -2.165954, 0, 0, 0, 1, 1,
-0.8892644, -0.7300336, -1.948093, 0, 0, 0, 1, 1,
-0.8868585, 1.018951, -0.9603092, 1, 1, 1, 1, 1,
-0.8860598, -0.4963191, -0.6599522, 1, 1, 1, 1, 1,
-0.8859533, 0.3445124, -1.228082, 1, 1, 1, 1, 1,
-0.8738906, 1.224655, -1.968536, 1, 1, 1, 1, 1,
-0.8702067, -0.04075259, -2.286954, 1, 1, 1, 1, 1,
-0.8636238, -0.7320732, -2.190577, 1, 1, 1, 1, 1,
-0.8631393, -0.8589842, -3.007838, 1, 1, 1, 1, 1,
-0.8607446, 1.024223, 0.1312629, 1, 1, 1, 1, 1,
-0.85499, -0.386782, -2.020482, 1, 1, 1, 1, 1,
-0.8517087, -0.003618825, -4.372846, 1, 1, 1, 1, 1,
-0.8506861, -0.1536607, -0.4850142, 1, 1, 1, 1, 1,
-0.8466446, 2.058606, -0.2762981, 1, 1, 1, 1, 1,
-0.8455262, 1.070462, -0.6559464, 1, 1, 1, 1, 1,
-0.8428802, 1.474984, -0.7969297, 1, 1, 1, 1, 1,
-0.8426899, -0.3266013, -2.870184, 1, 1, 1, 1, 1,
-0.8372211, 0.422375, -0.2594378, 0, 0, 1, 1, 1,
-0.8359239, 0.2794287, -2.197138, 1, 0, 0, 1, 1,
-0.8355138, 0.7320912, 0.06099182, 1, 0, 0, 1, 1,
-0.8325909, 2.69765, -0.08328469, 1, 0, 0, 1, 1,
-0.8324147, -1.944086, -2.670134, 1, 0, 0, 1, 1,
-0.8320675, 0.6801653, -0.109603, 1, 0, 0, 1, 1,
-0.830671, 1.370186, -0.07522357, 0, 0, 0, 1, 1,
-0.8300218, -2.220384, -2.671121, 0, 0, 0, 1, 1,
-0.8288545, 0.6951397, -1.13494, 0, 0, 0, 1, 1,
-0.8267099, 1.813, 1.080366, 0, 0, 0, 1, 1,
-0.8230292, -0.5006859, -2.49211, 0, 0, 0, 1, 1,
-0.8219147, 1.617956, 0.9451755, 0, 0, 0, 1, 1,
-0.8163098, 0.7576559, -1.486678, 0, 0, 0, 1, 1,
-0.8131711, -0.5003573, -0.1033369, 1, 1, 1, 1, 1,
-0.8100454, 0.6177149, -2.506714, 1, 1, 1, 1, 1,
-0.80885, -1.217237, -1.914614, 1, 1, 1, 1, 1,
-0.802337, -0.4554053, -3.08347, 1, 1, 1, 1, 1,
-0.8017165, -0.4202175, -0.8911447, 1, 1, 1, 1, 1,
-0.7977894, -2.1496, -4.435658, 1, 1, 1, 1, 1,
-0.7974936, -1.026403, -3.712259, 1, 1, 1, 1, 1,
-0.7973182, 0.9498211, 0.05003199, 1, 1, 1, 1, 1,
-0.7972112, -1.88831, -1.984491, 1, 1, 1, 1, 1,
-0.7903193, -0.4146406, -1.105838, 1, 1, 1, 1, 1,
-0.7875438, -1.085926, -1.730275, 1, 1, 1, 1, 1,
-0.7860628, -0.591285, -1.9735, 1, 1, 1, 1, 1,
-0.7772747, -0.790538, -2.26926, 1, 1, 1, 1, 1,
-0.7710549, -1.19422, -1.795706, 1, 1, 1, 1, 1,
-0.7697878, -0.6154404, -1.809626, 1, 1, 1, 1, 1,
-0.7649478, -1.656722, -1.123199, 0, 0, 1, 1, 1,
-0.7624181, 0.9520516, -0.9575666, 1, 0, 0, 1, 1,
-0.7605631, 2.002043, 0.4505886, 1, 0, 0, 1, 1,
-0.7573925, -0.5941209, -1.507346, 1, 0, 0, 1, 1,
-0.7504144, 0.2039629, -1.671755, 1, 0, 0, 1, 1,
-0.7455707, -1.890806, -2.850036, 1, 0, 0, 1, 1,
-0.7407597, -1.320407, -1.94157, 0, 0, 0, 1, 1,
-0.7380505, 1.370678, -0.09182344, 0, 0, 0, 1, 1,
-0.7352229, 0.4111796, -1.60513, 0, 0, 0, 1, 1,
-0.7320761, -0.3412564, -1.117799, 0, 0, 0, 1, 1,
-0.7314839, -0.8116617, -1.764178, 0, 0, 0, 1, 1,
-0.7302241, -1.291489, -3.62458, 0, 0, 0, 1, 1,
-0.7289707, -0.989255, -2.867571, 0, 0, 0, 1, 1,
-0.7254239, -1.499202, -3.598234, 1, 1, 1, 1, 1,
-0.7251298, -1.366594, -2.878151, 1, 1, 1, 1, 1,
-0.7223415, 1.990841, -0.1572201, 1, 1, 1, 1, 1,
-0.7199351, 0.05566926, -2.210267, 1, 1, 1, 1, 1,
-0.7156389, -0.138576, -1.501754, 1, 1, 1, 1, 1,
-0.7067981, 0.2532187, -3.588023, 1, 1, 1, 1, 1,
-0.700285, -0.6884501, -3.841294, 1, 1, 1, 1, 1,
-0.6953564, -0.7291232, -2.607396, 1, 1, 1, 1, 1,
-0.6870691, -1.802892, -1.437163, 1, 1, 1, 1, 1,
-0.6865742, -0.4153054, -1.669001, 1, 1, 1, 1, 1,
-0.6785465, 1.192251, -1.975346, 1, 1, 1, 1, 1,
-0.6783563, -0.1901743, -2.042999, 1, 1, 1, 1, 1,
-0.6782823, 1.18111, 0.1221495, 1, 1, 1, 1, 1,
-0.6776851, -0.03188651, -1.10713, 1, 1, 1, 1, 1,
-0.6767279, -0.5351008, -3.226287, 1, 1, 1, 1, 1,
-0.6764424, 1.38239, -1.2753, 0, 0, 1, 1, 1,
-0.6726954, 0.06630847, -0.3224505, 1, 0, 0, 1, 1,
-0.6673033, 0.7532866, -0.8645149, 1, 0, 0, 1, 1,
-0.6665649, 0.2724323, -2.380073, 1, 0, 0, 1, 1,
-0.6653549, -1.033476, -2.175919, 1, 0, 0, 1, 1,
-0.663212, -2.815015, -2.561534, 1, 0, 0, 1, 1,
-0.6617394, 0.6894909, -1.182532, 0, 0, 0, 1, 1,
-0.6594049, 0.7218736, -1.116118, 0, 0, 0, 1, 1,
-0.6497197, 0.9629017, -0.7214826, 0, 0, 0, 1, 1,
-0.6496307, 0.03275047, -1.777702, 0, 0, 0, 1, 1,
-0.6483825, -0.08933879, -2.12259, 0, 0, 0, 1, 1,
-0.6473135, -1.150102, -0.8399467, 0, 0, 0, 1, 1,
-0.6438685, -0.9164544, -2.016243, 0, 0, 0, 1, 1,
-0.6436225, 0.04598266, -1.530385, 1, 1, 1, 1, 1,
-0.6384117, -2.434272, -1.648606, 1, 1, 1, 1, 1,
-0.6376426, -0.6768759, -1.290302, 1, 1, 1, 1, 1,
-0.6300211, 1.576574, 0.2131709, 1, 1, 1, 1, 1,
-0.6246108, -0.06981629, -1.975261, 1, 1, 1, 1, 1,
-0.6240733, 0.7278374, 0.4552328, 1, 1, 1, 1, 1,
-0.6199528, -0.001502962, -1.031657, 1, 1, 1, 1, 1,
-0.6169649, 1.054149, -2.410485, 1, 1, 1, 1, 1,
-0.611801, 0.6314625, 0.2452638, 1, 1, 1, 1, 1,
-0.6091967, 0.7273584, -1.724453, 1, 1, 1, 1, 1,
-0.5949168, -0.7082354, -1.801907, 1, 1, 1, 1, 1,
-0.5909375, 0.8465372, -1.877085, 1, 1, 1, 1, 1,
-0.58764, 0.1302284, -0.6962752, 1, 1, 1, 1, 1,
-0.5852514, -0.7730125, -0.1142244, 1, 1, 1, 1, 1,
-0.5819443, 0.7621112, -1.004293, 1, 1, 1, 1, 1,
-0.5758703, -0.672385, -0.2187076, 0, 0, 1, 1, 1,
-0.5740659, 1.076579, -1.086393, 1, 0, 0, 1, 1,
-0.5739297, 0.4644916, -1.236564, 1, 0, 0, 1, 1,
-0.5713707, 0.8960972, -1.650485, 1, 0, 0, 1, 1,
-0.5708177, 1.463043, 0.1389558, 1, 0, 0, 1, 1,
-0.5688668, -0.6156338, -3.158665, 1, 0, 0, 1, 1,
-0.5618155, -0.8820702, -3.696384, 0, 0, 0, 1, 1,
-0.5560526, 1.005596, -0.4078174, 0, 0, 0, 1, 1,
-0.5546809, -1.135598, -2.105052, 0, 0, 0, 1, 1,
-0.5477459, 0.3703325, -0.6113808, 0, 0, 0, 1, 1,
-0.5396819, -0.3032603, -2.817903, 0, 0, 0, 1, 1,
-0.5378404, -1.448732, -3.377934, 0, 0, 0, 1, 1,
-0.5372168, 0.3192366, -1.282415, 0, 0, 0, 1, 1,
-0.5319135, -0.9254587, -2.154047, 1, 1, 1, 1, 1,
-0.5282671, 0.6583044, -1.328918, 1, 1, 1, 1, 1,
-0.5230873, -0.3370723, -3.908734, 1, 1, 1, 1, 1,
-0.5170938, -0.129025, -2.563512, 1, 1, 1, 1, 1,
-0.5151486, -0.3671471, -2.780386, 1, 1, 1, 1, 1,
-0.5129522, -1.861507, -3.776489, 1, 1, 1, 1, 1,
-0.5097154, -0.441193, -3.259882, 1, 1, 1, 1, 1,
-0.5085462, -0.2380098, -2.779519, 1, 1, 1, 1, 1,
-0.5064899, -0.6623837, -2.784478, 1, 1, 1, 1, 1,
-0.5061026, 1.268304, -2.290667, 1, 1, 1, 1, 1,
-0.5028527, 0.5555681, -0.5229152, 1, 1, 1, 1, 1,
-0.4968729, -1.249676, -2.652455, 1, 1, 1, 1, 1,
-0.4947127, -0.9385619, -1.671798, 1, 1, 1, 1, 1,
-0.4946727, 0.6693829, 0.7752622, 1, 1, 1, 1, 1,
-0.4911236, 1.672634, 1.258881, 1, 1, 1, 1, 1,
-0.4877322, -0.1485823, -0.537253, 0, 0, 1, 1, 1,
-0.4875251, 0.5707478, -0.8601673, 1, 0, 0, 1, 1,
-0.4816048, -0.06173269, -0.5203652, 1, 0, 0, 1, 1,
-0.4810062, -1.114705, -2.258688, 1, 0, 0, 1, 1,
-0.4795251, 0.01387075, 0.1489673, 1, 0, 0, 1, 1,
-0.4774565, -0.3919139, -0.9444083, 1, 0, 0, 1, 1,
-0.474557, -1.340831, -1.447992, 0, 0, 0, 1, 1,
-0.4731129, -1.088348, -2.051419, 0, 0, 0, 1, 1,
-0.4697467, -0.7952873, -2.967818, 0, 0, 0, 1, 1,
-0.4688298, 0.2585718, -1.449314, 0, 0, 0, 1, 1,
-0.4681392, -1.074695, -2.361205, 0, 0, 0, 1, 1,
-0.4667152, 0.4940875, 0.9389268, 0, 0, 0, 1, 1,
-0.4631868, -1.184894, -4.440711, 0, 0, 0, 1, 1,
-0.46057, 2.960569, 0.4933725, 1, 1, 1, 1, 1,
-0.4605659, 1.811641, -0.478651, 1, 1, 1, 1, 1,
-0.4542264, -0.9190945, -2.336096, 1, 1, 1, 1, 1,
-0.4438514, -0.5193962, -1.945605, 1, 1, 1, 1, 1,
-0.439503, 0.7435667, -1.058758, 1, 1, 1, 1, 1,
-0.4380704, -0.1143879, -1.893943, 1, 1, 1, 1, 1,
-0.4344541, 1.204247, -1.480182, 1, 1, 1, 1, 1,
-0.4332768, 0.6914695, -0.7718222, 1, 1, 1, 1, 1,
-0.4330323, -1.597271, -1.091015, 1, 1, 1, 1, 1,
-0.4328783, -0.9322603, -3.921739, 1, 1, 1, 1, 1,
-0.4323675, 0.1165418, -0.3157205, 1, 1, 1, 1, 1,
-0.4302164, -1.053027, -0.2847428, 1, 1, 1, 1, 1,
-0.423472, 1.6078, -2.864429, 1, 1, 1, 1, 1,
-0.4212685, 0.3133661, -2.842616, 1, 1, 1, 1, 1,
-0.4155615, 0.667618, 0.7881071, 1, 1, 1, 1, 1,
-0.4141776, 2.37136, -0.715614, 0, 0, 1, 1, 1,
-0.4066342, 0.8616154, -1.969181, 1, 0, 0, 1, 1,
-0.4066336, 0.7409838, -1.976508, 1, 0, 0, 1, 1,
-0.4056819, 1.242383, 1.501359, 1, 0, 0, 1, 1,
-0.4054982, 0.8406453, -1.646221, 1, 0, 0, 1, 1,
-0.4054731, -1.453083, -3.631204, 1, 0, 0, 1, 1,
-0.4037023, -0.1292941, -0.4567514, 0, 0, 0, 1, 1,
-0.4035731, -1.036778, -3.601853, 0, 0, 0, 1, 1,
-0.4030653, -0.8381488, -2.66024, 0, 0, 0, 1, 1,
-0.4025075, -0.3590597, -0.8412841, 0, 0, 0, 1, 1,
-0.4006108, -0.1030832, -2.699931, 0, 0, 0, 1, 1,
-0.4000373, -0.3400412, -2.867471, 0, 0, 0, 1, 1,
-0.391838, 0.119458, -2.007905, 0, 0, 0, 1, 1,
-0.3887703, 1.242832, -0.375064, 1, 1, 1, 1, 1,
-0.388315, -0.4440023, -5.284818, 1, 1, 1, 1, 1,
-0.3881091, 0.2125891, -0.9224502, 1, 1, 1, 1, 1,
-0.3835684, -1.096977, -2.922653, 1, 1, 1, 1, 1,
-0.3771312, 1.72239, -0.352156, 1, 1, 1, 1, 1,
-0.3744225, -0.1983859, -1.462304, 1, 1, 1, 1, 1,
-0.3705585, -0.5104543, -1.996413, 1, 1, 1, 1, 1,
-0.3677374, 0.8053163, 0.2188733, 1, 1, 1, 1, 1,
-0.3626654, -0.833122, -3.723321, 1, 1, 1, 1, 1,
-0.3608556, -0.9925668, -2.698552, 1, 1, 1, 1, 1,
-0.3557928, -1.275981, -2.635955, 1, 1, 1, 1, 1,
-0.3520039, 0.0115003, -2.799915, 1, 1, 1, 1, 1,
-0.3504409, 1.010401, -0.2461939, 1, 1, 1, 1, 1,
-0.3495918, 1.831704, -1.206908, 1, 1, 1, 1, 1,
-0.3440796, 0.2805763, -0.4636596, 1, 1, 1, 1, 1,
-0.3435486, 0.9287603, 0.2023727, 0, 0, 1, 1, 1,
-0.3418273, 2.087418, 1.001452, 1, 0, 0, 1, 1,
-0.3408846, 2.334194, -1.338572, 1, 0, 0, 1, 1,
-0.33171, -1.595701, -3.947682, 1, 0, 0, 1, 1,
-0.3306823, 1.729632, 0.001289287, 1, 0, 0, 1, 1,
-0.3260272, 0.02176043, -2.516815, 1, 0, 0, 1, 1,
-0.321985, -0.1472269, -2.253772, 0, 0, 0, 1, 1,
-0.3219555, 1.403818, -0.9756776, 0, 0, 0, 1, 1,
-0.3185728, -0.7970901, -3.536702, 0, 0, 0, 1, 1,
-0.3148089, 1.574939, -1.250839, 0, 0, 0, 1, 1,
-0.3141713, 0.03547972, 1.176741, 0, 0, 0, 1, 1,
-0.3119758, -0.3416117, -2.0045, 0, 0, 0, 1, 1,
-0.3080891, -0.9007638, -2.447838, 0, 0, 0, 1, 1,
-0.3041463, 0.4617475, -1.382093, 1, 1, 1, 1, 1,
-0.3035583, 0.1553798, -0.4598191, 1, 1, 1, 1, 1,
-0.2997664, -0.8273091, -4.138155, 1, 1, 1, 1, 1,
-0.2997259, 0.2622593, -0.998612, 1, 1, 1, 1, 1,
-0.2986425, 1.074957, -0.9791118, 1, 1, 1, 1, 1,
-0.2972514, -0.4049047, -4.171381, 1, 1, 1, 1, 1,
-0.2972352, -1.052236, -4.129014, 1, 1, 1, 1, 1,
-0.2915578, -1.405149, -2.209985, 1, 1, 1, 1, 1,
-0.2818461, 1.090287, 0.7231382, 1, 1, 1, 1, 1,
-0.2813753, 0.2786295, -0.140817, 1, 1, 1, 1, 1,
-0.27913, -0.1326703, -0.7016034, 1, 1, 1, 1, 1,
-0.2788379, -1.31621, -2.731658, 1, 1, 1, 1, 1,
-0.2759162, -0.5629881, -1.875996, 1, 1, 1, 1, 1,
-0.2747746, -0.3524391, -2.329283, 1, 1, 1, 1, 1,
-0.2739708, 0.5391238, -1.00222, 1, 1, 1, 1, 1,
-0.272422, 0.6008332, 1.327516, 0, 0, 1, 1, 1,
-0.267031, 1.442287, -2.182244, 1, 0, 0, 1, 1,
-0.2654681, -0.2652112, -1.249345, 1, 0, 0, 1, 1,
-0.2637359, -0.1250786, -1.927907, 1, 0, 0, 1, 1,
-0.2636637, -0.7262189, -4.665858, 1, 0, 0, 1, 1,
-0.2623924, 0.8538595, 0.1126012, 1, 0, 0, 1, 1,
-0.2623093, -0.5092786, -2.833746, 0, 0, 0, 1, 1,
-0.2579188, 0.7939235, -1.874818, 0, 0, 0, 1, 1,
-0.2570192, 0.6533867, -0.001616823, 0, 0, 0, 1, 1,
-0.2516852, -0.7061787, -4.640353, 0, 0, 0, 1, 1,
-0.245611, 1.269201, -2.373238, 0, 0, 0, 1, 1,
-0.2455797, 0.01875465, -2.744236, 0, 0, 0, 1, 1,
-0.2426309, 0.4529793, -1.227938, 0, 0, 0, 1, 1,
-0.2396824, -0.3744265, -1.0995, 1, 1, 1, 1, 1,
-0.2380131, -1.237625, -1.55671, 1, 1, 1, 1, 1,
-0.2329894, -1.657824, -1.581013, 1, 1, 1, 1, 1,
-0.2295786, 0.1564682, -1.070215, 1, 1, 1, 1, 1,
-0.2254183, 1.118937, -1.700817, 1, 1, 1, 1, 1,
-0.2251009, -0.4168821, -4.089148, 1, 1, 1, 1, 1,
-0.2232129, 1.565954, 0.5296584, 1, 1, 1, 1, 1,
-0.2193512, 1.286158, 1.484229, 1, 1, 1, 1, 1,
-0.2173279, 0.5230613, -0.5816641, 1, 1, 1, 1, 1,
-0.215822, 0.3435377, 0.01355165, 1, 1, 1, 1, 1,
-0.2134865, -0.2014637, -1.228028, 1, 1, 1, 1, 1,
-0.2107158, 1.147855, -2.200279, 1, 1, 1, 1, 1,
-0.2039432, 0.1844295, -1.349119, 1, 1, 1, 1, 1,
-0.2007548, 0.7841068, -0.3847435, 1, 1, 1, 1, 1,
-0.2000372, -0.2936887, -3.001626, 1, 1, 1, 1, 1,
-0.1999021, -1.121485, -3.501242, 0, 0, 1, 1, 1,
-0.1996062, 1.015659, 0.2263602, 1, 0, 0, 1, 1,
-0.199246, -0.3099286, -2.91603, 1, 0, 0, 1, 1,
-0.1985468, 0.2908209, -0.6865038, 1, 0, 0, 1, 1,
-0.1957411, 0.269499, -2.209599, 1, 0, 0, 1, 1,
-0.1935495, 1.112903, 2.054792, 1, 0, 0, 1, 1,
-0.1927591, 0.9871352, 0.9172909, 0, 0, 0, 1, 1,
-0.1846988, -1.577672, -4.060521, 0, 0, 0, 1, 1,
-0.1771111, 0.1002706, 0.04276828, 0, 0, 0, 1, 1,
-0.1707582, 1.413143, 0.5903358, 0, 0, 0, 1, 1,
-0.1696495, 1.21888, 1.752502, 0, 0, 0, 1, 1,
-0.166781, 0.9275036, -0.4062909, 0, 0, 0, 1, 1,
-0.1651193, -0.3078827, -2.440879, 0, 0, 0, 1, 1,
-0.1634271, -0.7951587, -3.675548, 1, 1, 1, 1, 1,
-0.1597268, 0.409872, -1.610059, 1, 1, 1, 1, 1,
-0.1577724, 0.6784146, -0.04084243, 1, 1, 1, 1, 1,
-0.1539246, 0.4633133, -0.2817717, 1, 1, 1, 1, 1,
-0.1491389, -1.669612, -4.24945, 1, 1, 1, 1, 1,
-0.1474296, 2.079076, -0.650897, 1, 1, 1, 1, 1,
-0.1461223, 0.371938, -2.718631, 1, 1, 1, 1, 1,
-0.1459361, 0.7124739, -0.7419077, 1, 1, 1, 1, 1,
-0.144983, -0.8153208, -2.574179, 1, 1, 1, 1, 1,
-0.1412342, -0.7676747, -3.894041, 1, 1, 1, 1, 1,
-0.1390154, 0.08544986, -1.142311, 1, 1, 1, 1, 1,
-0.1374306, -0.266873, -2.489757, 1, 1, 1, 1, 1,
-0.1329464, -1.206734, -3.301146, 1, 1, 1, 1, 1,
-0.130757, 0.8060191, -0.9378068, 1, 1, 1, 1, 1,
-0.1295415, 0.3995981, -1.42157, 1, 1, 1, 1, 1,
-0.1261937, 0.2747351, 0.002552787, 0, 0, 1, 1, 1,
-0.1236368, -1.205467, -3.136226, 1, 0, 0, 1, 1,
-0.1210194, 0.501893, 0.7675592, 1, 0, 0, 1, 1,
-0.1209772, -0.5912505, -6.217352, 1, 0, 0, 1, 1,
-0.1188238, -0.2105495, -2.608012, 1, 0, 0, 1, 1,
-0.1183612, 0.7982911, -2.607407, 1, 0, 0, 1, 1,
-0.1155555, -0.2826692, -2.632476, 0, 0, 0, 1, 1,
-0.1131186, 1.072861, -0.3245286, 0, 0, 0, 1, 1,
-0.1063602, -1.279779, -3.370286, 0, 0, 0, 1, 1,
-0.1059048, 0.3700417, -1.501498, 0, 0, 0, 1, 1,
-0.1045781, -0.7238734, -4.295862, 0, 0, 0, 1, 1,
-0.1010014, 1.083603, -0.6821519, 0, 0, 0, 1, 1,
-0.09367155, -0.7446706, -2.654446, 0, 0, 0, 1, 1,
-0.09087783, 0.3440519, 0.6988867, 1, 1, 1, 1, 1,
-0.08765855, 1.387888, -1.36725, 1, 1, 1, 1, 1,
-0.08541968, -0.6600324, -2.926676, 1, 1, 1, 1, 1,
-0.08510375, -0.8333623, -4.099405, 1, 1, 1, 1, 1,
-0.08493604, 1.114579, 0.6667743, 1, 1, 1, 1, 1,
-0.08233301, 1.283599, -0.08806081, 1, 1, 1, 1, 1,
-0.07685614, 0.9786857, -0.7720975, 1, 1, 1, 1, 1,
-0.07602216, 1.071347, 1.099099, 1, 1, 1, 1, 1,
-0.07396191, 1.789245, -0.2957102, 1, 1, 1, 1, 1,
-0.07331377, -0.03978854, -3.894682, 1, 1, 1, 1, 1,
-0.07287921, 0.603444, -1.256253, 1, 1, 1, 1, 1,
-0.07227372, -1.383925, -2.299095, 1, 1, 1, 1, 1,
-0.07192166, -0.9516826, -2.686312, 1, 1, 1, 1, 1,
-0.0675552, 0.1779197, 0.9998697, 1, 1, 1, 1, 1,
-0.06482615, -0.06682572, -4.166428, 1, 1, 1, 1, 1,
-0.06482614, 0.1094949, 0.8012709, 0, 0, 1, 1, 1,
-0.0645783, 0.09781686, 0.682038, 1, 0, 0, 1, 1,
-0.06419775, 0.1343308, -1.058265, 1, 0, 0, 1, 1,
-0.06177172, -0.8567904, -2.597651, 1, 0, 0, 1, 1,
-0.06129478, 0.1088195, 0.3298084, 1, 0, 0, 1, 1,
-0.05846735, -0.5995088, -4.21589, 1, 0, 0, 1, 1,
-0.05828037, 1.233959, -0.3015974, 0, 0, 0, 1, 1,
-0.05207909, 1.330112, -1.103933, 0, 0, 0, 1, 1,
-0.05206087, 1.34505, -1.550599, 0, 0, 0, 1, 1,
-0.0505471, 3.011743, -1.422233, 0, 0, 0, 1, 1,
-0.05054106, -0.6863943, -3.520409, 0, 0, 0, 1, 1,
-0.04814568, 0.06677071, -0.6510628, 0, 0, 0, 1, 1,
-0.04520352, -0.5725542, -2.386537, 0, 0, 0, 1, 1,
-0.04475644, 1.001289, 0.7453463, 1, 1, 1, 1, 1,
-0.04375327, -0.5055431, -5.562724, 1, 1, 1, 1, 1,
-0.03942923, 0.8400906, -0.6192878, 1, 1, 1, 1, 1,
-0.03747323, 0.7872691, 0.6209483, 1, 1, 1, 1, 1,
-0.03589782, 1.546302, 0.4122034, 1, 1, 1, 1, 1,
-0.034767, 0.9385499, 0.2662328, 1, 1, 1, 1, 1,
-0.03421725, 1.721609, -0.804038, 1, 1, 1, 1, 1,
-0.03375327, 1.342804, 0.2715605, 1, 1, 1, 1, 1,
-0.0321345, -0.9938893, -3.813888, 1, 1, 1, 1, 1,
-0.02972743, -1.978693, -4.668696, 1, 1, 1, 1, 1,
-0.0282761, 0.4551806, -0.3151166, 1, 1, 1, 1, 1,
-0.026225, -0.1906383, -2.248394, 1, 1, 1, 1, 1,
-0.01599406, -0.1596632, -5.397925, 1, 1, 1, 1, 1,
-0.008701573, 0.0972518, 0.9458154, 1, 1, 1, 1, 1,
-0.007703893, 0.09407715, -0.1873818, 1, 1, 1, 1, 1,
-0.005676076, -0.2372312, -2.991056, 0, 0, 1, 1, 1,
-0.0007886623, 0.0112728, -0.622214, 1, 0, 0, 1, 1,
7.910834e-05, 1.591112, -0.3816029, 1, 0, 0, 1, 1,
0.0042062, -0.4674422, 4.592711, 1, 0, 0, 1, 1,
0.004856133, 0.2851528, -1.090994, 1, 0, 0, 1, 1,
0.008016662, 1.432533, -0.936805, 1, 0, 0, 1, 1,
0.008122973, -0.1429897, 2.067392, 0, 0, 0, 1, 1,
0.009841088, 1.40251, 2.067405, 0, 0, 0, 1, 1,
0.01185428, 0.2898792, -0.450892, 0, 0, 0, 1, 1,
0.01255827, 1.132934, -0.451152, 0, 0, 0, 1, 1,
0.01409854, -1.012038, 1.856106, 0, 0, 0, 1, 1,
0.01866276, 1.075308, 1.412658, 0, 0, 0, 1, 1,
0.0186747, -0.2312902, 1.781391, 0, 0, 0, 1, 1,
0.02082944, -0.2993876, 3.722194, 1, 1, 1, 1, 1,
0.02205575, 1.53174, -0.1812027, 1, 1, 1, 1, 1,
0.02469848, 1.049305, 0.4441043, 1, 1, 1, 1, 1,
0.02734302, -0.5422416, 2.597144, 1, 1, 1, 1, 1,
0.02759999, 0.9219379, -0.4620971, 1, 1, 1, 1, 1,
0.0286886, -0.4732974, 2.973088, 1, 1, 1, 1, 1,
0.02924872, 1.398981, -1.220029, 1, 1, 1, 1, 1,
0.02940159, 0.7186518, 1.498283, 1, 1, 1, 1, 1,
0.03345516, -1.092672, 5.650859, 1, 1, 1, 1, 1,
0.03380956, 0.938909, 0.06290608, 1, 1, 1, 1, 1,
0.03528066, 0.8791466, -1.125107, 1, 1, 1, 1, 1,
0.03752321, -0.5094927, 2.04861, 1, 1, 1, 1, 1,
0.04102651, -0.837451, 3.589296, 1, 1, 1, 1, 1,
0.04123766, 1.263786, 0.5283656, 1, 1, 1, 1, 1,
0.0469931, 0.7938957, 0.9027382, 1, 1, 1, 1, 1,
0.04791884, 0.5291778, -1.589845, 0, 0, 1, 1, 1,
0.05048452, -1.952886, 3.949802, 1, 0, 0, 1, 1,
0.05127425, 1.24464, -0.06600237, 1, 0, 0, 1, 1,
0.05261511, -0.3290882, 2.531728, 1, 0, 0, 1, 1,
0.05307654, 0.02180549, 1.344672, 1, 0, 0, 1, 1,
0.055629, 1.398377, -1.172107, 1, 0, 0, 1, 1,
0.0574344, -1.145295, 3.894047, 0, 0, 0, 1, 1,
0.05974963, 0.3014795, 0.08905011, 0, 0, 0, 1, 1,
0.06046733, -0.2369276, 3.071144, 0, 0, 0, 1, 1,
0.06142518, 0.6363245, 0.4818611, 0, 0, 0, 1, 1,
0.06397207, -0.7221035, 2.962253, 0, 0, 0, 1, 1,
0.06462863, -0.4980738, 3.202913, 0, 0, 0, 1, 1,
0.06592875, -0.8519155, 4.340189, 0, 0, 0, 1, 1,
0.06610972, -0.7233478, 2.682365, 1, 1, 1, 1, 1,
0.06691483, -0.7047833, 1.468426, 1, 1, 1, 1, 1,
0.07257356, -0.4897782, 0.874792, 1, 1, 1, 1, 1,
0.07288756, -0.9515253, 3.584319, 1, 1, 1, 1, 1,
0.0764512, 0.6009827, -0.1968552, 1, 1, 1, 1, 1,
0.07732763, -1.063471, 6.106188, 1, 1, 1, 1, 1,
0.07926919, -0.3698145, 2.571229, 1, 1, 1, 1, 1,
0.08537699, -1.031539, 1.555454, 1, 1, 1, 1, 1,
0.08621505, 0.7698951, 1.75012, 1, 1, 1, 1, 1,
0.08699702, -0.4123606, 2.921913, 1, 1, 1, 1, 1,
0.08825441, -0.44892, 2.58325, 1, 1, 1, 1, 1,
0.08980564, -0.1318631, 0.5635694, 1, 1, 1, 1, 1,
0.09056509, 2.048167, -1.236618, 1, 1, 1, 1, 1,
0.09536539, -1.115103, 2.851307, 1, 1, 1, 1, 1,
0.1040895, 0.41484, 0.6487325, 1, 1, 1, 1, 1,
0.1055663, -0.2239565, 2.976271, 0, 0, 1, 1, 1,
0.1058695, 0.3222096, 0.2197835, 1, 0, 0, 1, 1,
0.1063085, 0.2222587, 0.6467335, 1, 0, 0, 1, 1,
0.108823, -1.137557, 2.531957, 1, 0, 0, 1, 1,
0.1094772, 0.04712848, -0.5038518, 1, 0, 0, 1, 1,
0.1097433, 1.76711, 0.1937442, 1, 0, 0, 1, 1,
0.1126859, 0.3627408, 2.099969, 0, 0, 0, 1, 1,
0.1141864, -0.293472, 3.034561, 0, 0, 0, 1, 1,
0.1156516, 0.2414219, 0.2218492, 0, 0, 0, 1, 1,
0.117855, 0.767701, -0.5201719, 0, 0, 0, 1, 1,
0.1187577, -0.3471898, 3.651285, 0, 0, 0, 1, 1,
0.1191696, -0.6362375, 3.3732, 0, 0, 0, 1, 1,
0.1250171, -0.03102111, 1.933224, 0, 0, 0, 1, 1,
0.1272624, -0.2173623, 1.992746, 1, 1, 1, 1, 1,
0.1281925, -1.493156, 5.580759, 1, 1, 1, 1, 1,
0.1289624, 0.1391311, 0.8502972, 1, 1, 1, 1, 1,
0.1350924, -0.009516855, 1.707164, 1, 1, 1, 1, 1,
0.1386585, 1.363451, -1.164926, 1, 1, 1, 1, 1,
0.1395888, 1.596814, -2.370807, 1, 1, 1, 1, 1,
0.1418374, -0.4370305, 2.534607, 1, 1, 1, 1, 1,
0.1434364, 1.33865, 0.03292832, 1, 1, 1, 1, 1,
0.1440978, 0.5661612, 0.0791627, 1, 1, 1, 1, 1,
0.144828, 0.4500574, -0.3722201, 1, 1, 1, 1, 1,
0.145157, -0.1940935, 1.94801, 1, 1, 1, 1, 1,
0.151707, -0.1169273, 1.668486, 1, 1, 1, 1, 1,
0.1525657, -0.4389056, 3.210157, 1, 1, 1, 1, 1,
0.1527061, -0.3892251, 3.104466, 1, 1, 1, 1, 1,
0.1569784, 2.207982, -0.7697325, 1, 1, 1, 1, 1,
0.1572985, -0.6392096, 4.419961, 0, 0, 1, 1, 1,
0.1587499, -0.6373098, 3.865443, 1, 0, 0, 1, 1,
0.160192, -1.652037, 2.90521, 1, 0, 0, 1, 1,
0.1654405, 0.9006378, 0.3044865, 1, 0, 0, 1, 1,
0.1670181, 1.067839, 0.9765238, 1, 0, 0, 1, 1,
0.1681838, -0.5736579, 2.612144, 1, 0, 0, 1, 1,
0.1707548, 1.434548, -1.056702, 0, 0, 0, 1, 1,
0.1720766, 0.0230177, -0.6904612, 0, 0, 0, 1, 1,
0.1731521, -1.501587, 4.013316, 0, 0, 0, 1, 1,
0.1732234, -0.3681214, 3.964924, 0, 0, 0, 1, 1,
0.1735032, -0.7313694, 2.979733, 0, 0, 0, 1, 1,
0.1762161, -0.7617943, 3.544925, 0, 0, 0, 1, 1,
0.1779919, 1.04152, 0.4068836, 0, 0, 0, 1, 1,
0.1793964, -0.9012174, 5.111596, 1, 1, 1, 1, 1,
0.1838035, -1.282889, 2.867604, 1, 1, 1, 1, 1,
0.1851698, -0.4064327, 3.588829, 1, 1, 1, 1, 1,
0.1874528, 0.3108366, -0.02621554, 1, 1, 1, 1, 1,
0.1896596, 0.4627149, 0.3043962, 1, 1, 1, 1, 1,
0.190925, -0.02740612, 3.015794, 1, 1, 1, 1, 1,
0.1916934, -0.07153421, 2.631701, 1, 1, 1, 1, 1,
0.1919747, 0.4366899, -0.457046, 1, 1, 1, 1, 1,
0.1946694, -0.5410246, 3.186725, 1, 1, 1, 1, 1,
0.19842, -0.01928478, 0.6450917, 1, 1, 1, 1, 1,
0.2067371, 0.3378362, 1.039988, 1, 1, 1, 1, 1,
0.208308, -0.3007964, 2.327825, 1, 1, 1, 1, 1,
0.2131978, 0.03052815, 1.568192, 1, 1, 1, 1, 1,
0.2143635, -2.244127, 3.586673, 1, 1, 1, 1, 1,
0.2165824, 1.051217, 1.137736, 1, 1, 1, 1, 1,
0.221157, 1.290803, -0.6197556, 0, 0, 1, 1, 1,
0.22432, -0.1485795, 1.410513, 1, 0, 0, 1, 1,
0.2264419, 0.2263794, -0.0004011663, 1, 0, 0, 1, 1,
0.2271927, -0.740623, 3.045772, 1, 0, 0, 1, 1,
0.2379627, 0.7836843, -0.2557663, 1, 0, 0, 1, 1,
0.23979, 1.73517, 0.9560788, 1, 0, 0, 1, 1,
0.2402433, 1.120329, 0.9614174, 0, 0, 0, 1, 1,
0.2413371, 0.8787925, -0.9072972, 0, 0, 0, 1, 1,
0.2467171, -1.353447, 2.579901, 0, 0, 0, 1, 1,
0.2478729, -0.4098107, 3.497377, 0, 0, 0, 1, 1,
0.2521883, 1.001936, 0.6808475, 0, 0, 0, 1, 1,
0.253423, 0.4064837, 1.736936, 0, 0, 0, 1, 1,
0.2555357, -0.2340677, 2.778645, 0, 0, 0, 1, 1,
0.2564251, 1.628406, -1.832996, 1, 1, 1, 1, 1,
0.2565193, -1.605199, 1.315224, 1, 1, 1, 1, 1,
0.2574642, -0.519824, 4.918002, 1, 1, 1, 1, 1,
0.2592922, 0.1035852, 2.172365, 1, 1, 1, 1, 1,
0.2625919, 1.009226, 0.8577583, 1, 1, 1, 1, 1,
0.2635861, 0.7428392, 1.663104, 1, 1, 1, 1, 1,
0.2637886, 0.6344717, 1.366702, 1, 1, 1, 1, 1,
0.2741793, 0.9884219, 0.7864439, 1, 1, 1, 1, 1,
0.2771179, 0.4047032, 2.044887, 1, 1, 1, 1, 1,
0.2802196, -0.4992443, 0.3118404, 1, 1, 1, 1, 1,
0.2870984, 1.90571, -0.3134115, 1, 1, 1, 1, 1,
0.2877536, 1.49295, -1.352132, 1, 1, 1, 1, 1,
0.2903428, -0.6752645, 2.487247, 1, 1, 1, 1, 1,
0.2936524, -0.6068673, 2.820689, 1, 1, 1, 1, 1,
0.2969695, -1.571344, 2.365555, 1, 1, 1, 1, 1,
0.2999496, -0.353473, 3.143174, 0, 0, 1, 1, 1,
0.3033181, 0.1720475, 1.036077, 1, 0, 0, 1, 1,
0.3077912, -0.1199789, -0.6768424, 1, 0, 0, 1, 1,
0.3108886, 0.3089426, 1.812129, 1, 0, 0, 1, 1,
0.3135626, 0.0202428, 2.820707, 1, 0, 0, 1, 1,
0.3156264, 0.5867515, 0.02600395, 1, 0, 0, 1, 1,
0.3156975, -3.277049, 3.151532, 0, 0, 0, 1, 1,
0.3185471, -0.2254543, 1.510434, 0, 0, 0, 1, 1,
0.3300034, -0.5808711, 2.999763, 0, 0, 0, 1, 1,
0.3333666, -1.323208, 3.479328, 0, 0, 0, 1, 1,
0.3405215, -1.047805, 3.521118, 0, 0, 0, 1, 1,
0.3422768, -0.7752602, 0.4627153, 0, 0, 0, 1, 1,
0.3487823, 0.3615938, 0.5983229, 0, 0, 0, 1, 1,
0.3487945, 1.646502, -0.8900366, 1, 1, 1, 1, 1,
0.3489653, -0.1079833, 2.798886, 1, 1, 1, 1, 1,
0.3496093, 1.37551, -0.4754725, 1, 1, 1, 1, 1,
0.357522, -0.1893461, 3.30271, 1, 1, 1, 1, 1,
0.3590228, 0.681368, 1.385947, 1, 1, 1, 1, 1,
0.359511, -0.1575683, 1.643703, 1, 1, 1, 1, 1,
0.3648416, 0.6557432, -0.5426174, 1, 1, 1, 1, 1,
0.3654151, 1.005822, 1.422229, 1, 1, 1, 1, 1,
0.3707702, 0.2555802, -1.207849, 1, 1, 1, 1, 1,
0.3868291, -0.4041847, 2.434966, 1, 1, 1, 1, 1,
0.3909766, -0.9494023, 2.483884, 1, 1, 1, 1, 1,
0.3959839, 0.1072332, 1.183408, 1, 1, 1, 1, 1,
0.3964957, 0.9785429, 1.073658, 1, 1, 1, 1, 1,
0.4028226, 0.1701495, 0.9447793, 1, 1, 1, 1, 1,
0.4042251, 0.8554902, 0.7796507, 1, 1, 1, 1, 1,
0.4083943, 0.5552678, 0.4007812, 0, 0, 1, 1, 1,
0.4092545, -1.476588, 4.51944, 1, 0, 0, 1, 1,
0.4149907, 0.2382136, 1.88607, 1, 0, 0, 1, 1,
0.4174421, 0.4407373, 0.5857528, 1, 0, 0, 1, 1,
0.4192763, 1.249629, 3.295148, 1, 0, 0, 1, 1,
0.4284622, -0.4215831, 3.390157, 1, 0, 0, 1, 1,
0.4340738, -0.3308076, 2.764369, 0, 0, 0, 1, 1,
0.434404, 2.172774, 1.461102, 0, 0, 0, 1, 1,
0.4377757, -0.4365386, 2.651804, 0, 0, 0, 1, 1,
0.4399063, -1.053977, 2.542309, 0, 0, 0, 1, 1,
0.4434213, -1.55848, 3.640043, 0, 0, 0, 1, 1,
0.4448926, 0.3387697, -0.03441514, 0, 0, 0, 1, 1,
0.4577587, -0.3867947, 3.60592, 0, 0, 0, 1, 1,
0.458773, -0.3002969, 2.76007, 1, 1, 1, 1, 1,
0.4600022, -0.6069761, 2.499616, 1, 1, 1, 1, 1,
0.4614573, -0.2205958, 3.035844, 1, 1, 1, 1, 1,
0.4638278, 0.03966936, -0.6904159, 1, 1, 1, 1, 1,
0.4667563, 0.6870958, 0.5366223, 1, 1, 1, 1, 1,
0.4678774, 0.4696611, -0.2109338, 1, 1, 1, 1, 1,
0.4681299, 0.3170528, 4.142969, 1, 1, 1, 1, 1,
0.4704915, 1.50972, -0.2158889, 1, 1, 1, 1, 1,
0.470984, 0.3205112, 3.905866, 1, 1, 1, 1, 1,
0.4725217, -0.5552245, 3.186846, 1, 1, 1, 1, 1,
0.4732078, -0.008809171, 1.966862, 1, 1, 1, 1, 1,
0.4736147, -0.2360203, 1.274589, 1, 1, 1, 1, 1,
0.480396, 0.8717646, -0.1157348, 1, 1, 1, 1, 1,
0.4838833, 1.054367, -1.51792, 1, 1, 1, 1, 1,
0.4851993, 0.6120135, 1.969905, 1, 1, 1, 1, 1,
0.4874531, 0.3513417, 2.946712, 0, 0, 1, 1, 1,
0.4887734, -0.2942432, 3.281946, 1, 0, 0, 1, 1,
0.5035808, 0.05823406, 0.535755, 1, 0, 0, 1, 1,
0.5074661, -0.4185399, 3.679559, 1, 0, 0, 1, 1,
0.5103828, -0.4490492, 0.4155604, 1, 0, 0, 1, 1,
0.5137846, 0.07759115, 1.656243, 1, 0, 0, 1, 1,
0.5142378, 1.62071, -1.140039, 0, 0, 0, 1, 1,
0.5145077, 0.3850822, 0.334167, 0, 0, 0, 1, 1,
0.5158593, 1.452463, 1.918609, 0, 0, 0, 1, 1,
0.5218225, 2.51146, -2.281936, 0, 0, 0, 1, 1,
0.52274, -0.2263611, 2.712358, 0, 0, 0, 1, 1,
0.5360338, -0.2023132, 3.560013, 0, 0, 0, 1, 1,
0.5361667, 1.588178, -1.515732, 0, 0, 0, 1, 1,
0.5361955, -0.4589033, 4.335783, 1, 1, 1, 1, 1,
0.544072, -0.334734, 2.213323, 1, 1, 1, 1, 1,
0.5465933, -0.5391258, 2.330441, 1, 1, 1, 1, 1,
0.5524409, -0.5901309, 3.879842, 1, 1, 1, 1, 1,
0.5569876, -0.9419297, 4.320159, 1, 1, 1, 1, 1,
0.5587389, 0.2693129, 0.09739065, 1, 1, 1, 1, 1,
0.5617463, -0.5519856, 1.873794, 1, 1, 1, 1, 1,
0.5675265, -0.2077924, 3.076792, 1, 1, 1, 1, 1,
0.5689984, -0.9597138, 3.678093, 1, 1, 1, 1, 1,
0.574698, -1.039392, 2.303503, 1, 1, 1, 1, 1,
0.5752736, 0.91537, 2.169643, 1, 1, 1, 1, 1,
0.5817553, 0.2205761, -0.7469503, 1, 1, 1, 1, 1,
0.5843091, -0.923465, 4.143778, 1, 1, 1, 1, 1,
0.5944669, 2.596366, 0.6238547, 1, 1, 1, 1, 1,
0.5960434, -1.835752, 1.63938, 1, 1, 1, 1, 1,
0.5972757, -0.06681937, 2.266609, 0, 0, 1, 1, 1,
0.5995622, -1.828857, 3.989641, 1, 0, 0, 1, 1,
0.6030693, 0.3803136, 1.890483, 1, 0, 0, 1, 1,
0.6097719, -2.306892, 4.851437, 1, 0, 0, 1, 1,
0.6116887, 0.03400946, 1.187038, 1, 0, 0, 1, 1,
0.6173887, 1.1057, 0.870171, 1, 0, 0, 1, 1,
0.6269276, 0.05732485, 1.61027, 0, 0, 0, 1, 1,
0.6272351, 0.2447195, 1.245996, 0, 0, 0, 1, 1,
0.6282366, -0.5431538, 2.863996, 0, 0, 0, 1, 1,
0.6283764, 0.9177383, -0.3017597, 0, 0, 0, 1, 1,
0.6303974, -1.453406, 2.492846, 0, 0, 0, 1, 1,
0.6367872, -1.203909, 1.375219, 0, 0, 0, 1, 1,
0.6369503, -0.7704149, 3.122896, 0, 0, 0, 1, 1,
0.6501235, -1.686929, 0.8960234, 1, 1, 1, 1, 1,
0.6581227, -1.756394, 3.281764, 1, 1, 1, 1, 1,
0.6634827, -0.1374215, 1.517082, 1, 1, 1, 1, 1,
0.6659006, 2.916216, 1.08982, 1, 1, 1, 1, 1,
0.6659766, 0.01894641, 1.381054, 1, 1, 1, 1, 1,
0.6723091, -0.4097074, 2.376098, 1, 1, 1, 1, 1,
0.6753982, -1.191899, 3.239874, 1, 1, 1, 1, 1,
0.67552, 0.1474008, 2.235905, 1, 1, 1, 1, 1,
0.6767792, -0.5237987, 1.890629, 1, 1, 1, 1, 1,
0.6782503, -1.410143, 2.471708, 1, 1, 1, 1, 1,
0.6783451, -1.013195, 2.273986, 1, 1, 1, 1, 1,
0.6833591, 0.5714771, 0.8723501, 1, 1, 1, 1, 1,
0.6871778, 1.093704, 2.981283, 1, 1, 1, 1, 1,
0.6920269, 0.4274069, 2.981448, 1, 1, 1, 1, 1,
0.6929812, -0.009341629, 2.185588, 1, 1, 1, 1, 1,
0.6945397, 0.5004432, 0.5521473, 0, 0, 1, 1, 1,
0.7044325, -1.810331, 2.656749, 1, 0, 0, 1, 1,
0.7055751, 0.5258055, 0.4160951, 1, 0, 0, 1, 1,
0.7079664, -1.251876, 2.697133, 1, 0, 0, 1, 1,
0.7094918, 0.2308885, 2.295031, 1, 0, 0, 1, 1,
0.7146322, 1.147093, 0.2162517, 1, 0, 0, 1, 1,
0.7179808, 0.529838, 0.3054935, 0, 0, 0, 1, 1,
0.7208226, -0.08053405, 1.259242, 0, 0, 0, 1, 1,
0.7267098, 0.1209847, 1.961337, 0, 0, 0, 1, 1,
0.7276812, 0.0464197, 0.9212704, 0, 0, 0, 1, 1,
0.7314589, 1.435532, 0.5211524, 0, 0, 0, 1, 1,
0.7397648, -0.4216617, 3.812245, 0, 0, 0, 1, 1,
0.7413055, -0.6941773, 2.371749, 0, 0, 0, 1, 1,
0.7430122, -0.01446175, 1.930167, 1, 1, 1, 1, 1,
0.744971, 0.02748627, 1.553887, 1, 1, 1, 1, 1,
0.747925, 0.2683252, 1.281043, 1, 1, 1, 1, 1,
0.7523416, 0.6901512, -0.01494004, 1, 1, 1, 1, 1,
0.7651491, -0.075212, 2.043423, 1, 1, 1, 1, 1,
0.7670291, -0.8999915, 3.991311, 1, 1, 1, 1, 1,
0.7694066, -0.3974605, 2.939961, 1, 1, 1, 1, 1,
0.7713537, -1.361335, 2.485798, 1, 1, 1, 1, 1,
0.7787318, -0.132367, 3.440381, 1, 1, 1, 1, 1,
0.7817031, -0.5675317, 3.447515, 1, 1, 1, 1, 1,
0.79578, -0.9021102, 2.367009, 1, 1, 1, 1, 1,
0.7970766, -0.03764176, 1.568378, 1, 1, 1, 1, 1,
0.7999753, 0.4529274, 0.2088865, 1, 1, 1, 1, 1,
0.8035708, -0.9750946, 2.338647, 1, 1, 1, 1, 1,
0.8043303, -0.03531745, 0.528715, 1, 1, 1, 1, 1,
0.8109248, 1.782996, 0.8592181, 0, 0, 1, 1, 1,
0.8156788, -0.02261679, 2.33709, 1, 0, 0, 1, 1,
0.8177325, 1.159301, 1.083247, 1, 0, 0, 1, 1,
0.8235437, -1.48436, 1.864485, 1, 0, 0, 1, 1,
0.8304564, -1.041389, 1.672296, 1, 0, 0, 1, 1,
0.8320336, -1.918715, 3.004708, 1, 0, 0, 1, 1,
0.8322569, -0.3227699, 1.385597, 0, 0, 0, 1, 1,
0.8350347, -0.2638778, 1.973039, 0, 0, 0, 1, 1,
0.8395405, -1.827673, 3.295245, 0, 0, 0, 1, 1,
0.8430886, 1.559781, 0.4666653, 0, 0, 0, 1, 1,
0.8445557, 1.703467, 1.809756, 0, 0, 0, 1, 1,
0.8476768, 0.2977821, 2.112821, 0, 0, 0, 1, 1,
0.8530697, -1.370345, 3.386093, 0, 0, 0, 1, 1,
0.8533921, 1.344425, 1.039479, 1, 1, 1, 1, 1,
0.8569335, 0.4008424, 1.224455, 1, 1, 1, 1, 1,
0.8599287, 0.6745468, 0.1706898, 1, 1, 1, 1, 1,
0.865018, 0.4630272, 0.6306564, 1, 1, 1, 1, 1,
0.8786882, -1.222485, 1.139211, 1, 1, 1, 1, 1,
0.8787314, 0.7033468, 0.5628272, 1, 1, 1, 1, 1,
0.8821316, -2.091523, 2.299719, 1, 1, 1, 1, 1,
0.8835294, 0.02158995, 1.514171, 1, 1, 1, 1, 1,
0.8862651, -1.214833, 2.812292, 1, 1, 1, 1, 1,
0.8872507, -0.8686574, 2.899068, 1, 1, 1, 1, 1,
0.8879337, -1.30856, 2.646609, 1, 1, 1, 1, 1,
0.890017, 0.5870925, -0.6065665, 1, 1, 1, 1, 1,
0.8962921, 1.43848, 1.755438, 1, 1, 1, 1, 1,
0.8991829, 1.207895, 0.3297572, 1, 1, 1, 1, 1,
0.9017813, -0.8124841, 2.821799, 1, 1, 1, 1, 1,
0.902029, -0.8137736, 2.907885, 0, 0, 1, 1, 1,
0.9027269, -0.5954257, 2.026343, 1, 0, 0, 1, 1,
0.9053199, -0.2061824, 1.033336, 1, 0, 0, 1, 1,
0.9074574, 0.9716482, 0.4921931, 1, 0, 0, 1, 1,
0.913127, 1.313064, 0.3056716, 1, 0, 0, 1, 1,
0.9161465, -0.2650269, 2.688689, 1, 0, 0, 1, 1,
0.9176382, -1.952435, 0.8974543, 0, 0, 0, 1, 1,
0.9238941, 2.444899, 0.2561417, 0, 0, 0, 1, 1,
0.9249387, 0.3619835, 0.3226021, 0, 0, 0, 1, 1,
0.9414138, -0.6745986, 2.887869, 0, 0, 0, 1, 1,
0.9418716, -0.6052248, 0.9697365, 0, 0, 0, 1, 1,
0.9472892, 0.1848277, 1.716724, 0, 0, 0, 1, 1,
0.95214, 1.101676, 0.3290064, 0, 0, 0, 1, 1,
0.9554517, 0.4604574, 0.2453144, 1, 1, 1, 1, 1,
0.9692745, -0.09548946, 1.309134, 1, 1, 1, 1, 1,
0.9707454, -0.3980364, 1.180508, 1, 1, 1, 1, 1,
0.9720172, 2.313304, 0.06575031, 1, 1, 1, 1, 1,
0.9734441, 0.9678301, 3.292477, 1, 1, 1, 1, 1,
0.9738949, 0.5782754, 0.794519, 1, 1, 1, 1, 1,
0.9750905, -0.04314849, -0.1683316, 1, 1, 1, 1, 1,
0.975404, 1.021897, -0.5540271, 1, 1, 1, 1, 1,
0.9764759, 0.7625749, 0.4297553, 1, 1, 1, 1, 1,
0.9776427, -0.5143244, 2.948007, 1, 1, 1, 1, 1,
0.9852459, 0.6997874, -1.900307, 1, 1, 1, 1, 1,
0.996153, -1.040465, 4.846658, 1, 1, 1, 1, 1,
0.9964573, 0.2355288, 1.602966, 1, 1, 1, 1, 1,
1.006748, -0.3360457, 1.219184, 1, 1, 1, 1, 1,
1.009341, -0.8977388, 1.630521, 1, 1, 1, 1, 1,
1.020189, -0.518657, 2.927981, 0, 0, 1, 1, 1,
1.020482, -0.3880024, 3.083122, 1, 0, 0, 1, 1,
1.032428, 0.6326929, 1.552688, 1, 0, 0, 1, 1,
1.03545, 0.03889599, 1.659432, 1, 0, 0, 1, 1,
1.038864, 0.1563386, 1.654821, 1, 0, 0, 1, 1,
1.041214, -0.2661616, 3.275253, 1, 0, 0, 1, 1,
1.041926, -1.038353, 2.483119, 0, 0, 0, 1, 1,
1.043522, -0.424962, 1.583169, 0, 0, 0, 1, 1,
1.052204, 0.1700769, 0.4729601, 0, 0, 0, 1, 1,
1.063592, -1.023709, 3.50135, 0, 0, 0, 1, 1,
1.068696, -1.419059, 1.753762, 0, 0, 0, 1, 1,
1.073234, 0.009889886, 1.17328, 0, 0, 0, 1, 1,
1.075074, -0.1529802, 2.36939, 0, 0, 0, 1, 1,
1.076573, 1.810422, 0.641533, 1, 1, 1, 1, 1,
1.08081, 1.204731, 1.005691, 1, 1, 1, 1, 1,
1.08243, -1.3465, 2.815596, 1, 1, 1, 1, 1,
1.084522, 0.323799, 2.149869, 1, 1, 1, 1, 1,
1.084864, 1.386957, 1.890396, 1, 1, 1, 1, 1,
1.086265, -1.046527, 1.889974, 1, 1, 1, 1, 1,
1.101496, -1.904223, 3.227479, 1, 1, 1, 1, 1,
1.107874, -0.3862899, 2.604011, 1, 1, 1, 1, 1,
1.108606, -0.8876686, 2.665034, 1, 1, 1, 1, 1,
1.114451, 0.6237105, 1.889261, 1, 1, 1, 1, 1,
1.122133, -0.05152821, 0.5965793, 1, 1, 1, 1, 1,
1.123185, -0.5499219, 1.444632, 1, 1, 1, 1, 1,
1.126017, -0.5179058, 2.251023, 1, 1, 1, 1, 1,
1.127192, 0.2042545, 1.725625, 1, 1, 1, 1, 1,
1.131734, -0.1554844, 1.958433, 1, 1, 1, 1, 1,
1.133252, 0.77693, 1.146884, 0, 0, 1, 1, 1,
1.137129, 1.161972, 1.000055, 1, 0, 0, 1, 1,
1.141148, -0.8977965, 4.118874, 1, 0, 0, 1, 1,
1.149597, -1.337506, 2.95838, 1, 0, 0, 1, 1,
1.149646, -1.830988, 1.756983, 1, 0, 0, 1, 1,
1.151682, 2.019253, 0.7276795, 1, 0, 0, 1, 1,
1.151972, -1.077947, 2.502496, 0, 0, 0, 1, 1,
1.160884, 1.469151, -0.3759924, 0, 0, 0, 1, 1,
1.16272, 0.2044855, 3.105168, 0, 0, 0, 1, 1,
1.164512, -0.6215835, 2.880511, 0, 0, 0, 1, 1,
1.164891, -0.5021074, 3.701921, 0, 0, 0, 1, 1,
1.167, 1.543311, -0.7886509, 0, 0, 0, 1, 1,
1.179698, -1.07308, 3.32318, 0, 0, 0, 1, 1,
1.181257, 0.8772093, 1.137173, 1, 1, 1, 1, 1,
1.193326, 1.768965, 0.7649827, 1, 1, 1, 1, 1,
1.205465, 0.3422321, 0.4175658, 1, 1, 1, 1, 1,
1.221186, -0.1565015, 1.437955, 1, 1, 1, 1, 1,
1.226061, 0.2916833, 3.010323, 1, 1, 1, 1, 1,
1.227153, 0.5771008, 1.547713, 1, 1, 1, 1, 1,
1.237168, -0.1308749, 2.829911, 1, 1, 1, 1, 1,
1.240207, -0.1701169, 2.208565, 1, 1, 1, 1, 1,
1.246134, 0.4221164, -0.01869314, 1, 1, 1, 1, 1,
1.258092, 0.2909787, 1.701937, 1, 1, 1, 1, 1,
1.268867, -1.707365, 5.23757, 1, 1, 1, 1, 1,
1.287476, 0.2143325, 0.9387503, 1, 1, 1, 1, 1,
1.294441, -0.3504883, 1.628394, 1, 1, 1, 1, 1,
1.295254, 0.6365696, 2.181461, 1, 1, 1, 1, 1,
1.301506, -0.08982885, 0.9905508, 1, 1, 1, 1, 1,
1.303431, -0.181568, 1.746044, 0, 0, 1, 1, 1,
1.313856, 0.08209191, 2.940103, 1, 0, 0, 1, 1,
1.331063, 1.095026, -0.4479446, 1, 0, 0, 1, 1,
1.339158, -0.5733696, 1.426789, 1, 0, 0, 1, 1,
1.345818, -1.121235, 1.611731, 1, 0, 0, 1, 1,
1.346907, -0.459093, 4.408848, 1, 0, 0, 1, 1,
1.34937, 0.1558431, 0.4594478, 0, 0, 0, 1, 1,
1.351185, 0.1985568, 2.522531, 0, 0, 0, 1, 1,
1.365314, 0.5828139, 1.236604, 0, 0, 0, 1, 1,
1.366536, 1.955156, 1.266074, 0, 0, 0, 1, 1,
1.369551, 1.159784, 1.095838, 0, 0, 0, 1, 1,
1.371561, 0.2859477, 1.577548, 0, 0, 0, 1, 1,
1.372927, -0.1565949, 1.37592, 0, 0, 0, 1, 1,
1.375567, 1.556336, 0.4480306, 1, 1, 1, 1, 1,
1.400842, -0.6322005, 2.238452, 1, 1, 1, 1, 1,
1.410211, 0.825544, 0.7915049, 1, 1, 1, 1, 1,
1.420627, -1.286151, 2.761565, 1, 1, 1, 1, 1,
1.421985, -0.5876035, 3.194878, 1, 1, 1, 1, 1,
1.427176, 0.7208149, 2.030846, 1, 1, 1, 1, 1,
1.42872, -0.9183509, 2.741678, 1, 1, 1, 1, 1,
1.429524, -0.2108179, 2.746636, 1, 1, 1, 1, 1,
1.431158, -1.454561, 1.789003, 1, 1, 1, 1, 1,
1.432119, 0.07508908, 0.8484412, 1, 1, 1, 1, 1,
1.437338, 0.802027, 0.4382133, 1, 1, 1, 1, 1,
1.438595, 0.1735713, 2.147379, 1, 1, 1, 1, 1,
1.439614, 0.6795828, 1.647563, 1, 1, 1, 1, 1,
1.441626, 0.1545801, 1.638221, 1, 1, 1, 1, 1,
1.442696, -0.5545616, 3.799834, 1, 1, 1, 1, 1,
1.450713, -0.8696946, 3.977879, 0, 0, 1, 1, 1,
1.453682, 0.6777465, 1.118632, 1, 0, 0, 1, 1,
1.462585, -0.3096214, 2.439251, 1, 0, 0, 1, 1,
1.465591, 0.4075429, 0.001868549, 1, 0, 0, 1, 1,
1.466854, 0.0364519, 3.580588, 1, 0, 0, 1, 1,
1.466884, 0.2362066, 1.899652, 1, 0, 0, 1, 1,
1.47734, 0.299124, 0.634731, 0, 0, 0, 1, 1,
1.499536, -0.4683469, 2.633819, 0, 0, 0, 1, 1,
1.506648, 0.3963418, 2.256598, 0, 0, 0, 1, 1,
1.511842, -0.7937392, 1.320781, 0, 0, 0, 1, 1,
1.512754, -0.765783, 2.124999, 0, 0, 0, 1, 1,
1.513668, -0.9196942, 2.240434, 0, 0, 0, 1, 1,
1.523367, -0.6269782, 2.239137, 0, 0, 0, 1, 1,
1.529156, -0.2937277, 0.7669298, 1, 1, 1, 1, 1,
1.53524, 0.2007835, 3.176969, 1, 1, 1, 1, 1,
1.552618, 0.7102335, 1.691942, 1, 1, 1, 1, 1,
1.558599, -0.8082574, 1.328038, 1, 1, 1, 1, 1,
1.5693, -0.3310974, 0.05352762, 1, 1, 1, 1, 1,
1.590209, 0.1368558, -0.3548331, 1, 1, 1, 1, 1,
1.590291, -1.624051, 0.6042495, 1, 1, 1, 1, 1,
1.592551, 1.594532, -1.15421, 1, 1, 1, 1, 1,
1.597684, 0.1088371, 1.967244, 1, 1, 1, 1, 1,
1.600249, 0.07206357, -0.4396016, 1, 1, 1, 1, 1,
1.61535, -1.007574, 1.698311, 1, 1, 1, 1, 1,
1.620835, 0.2080988, 2.075417, 1, 1, 1, 1, 1,
1.625373, -0.1649163, 1.43651, 1, 1, 1, 1, 1,
1.630112, 1.208418, 0.2819987, 1, 1, 1, 1, 1,
1.631209, -0.7981346, 3.120354, 1, 1, 1, 1, 1,
1.638721, -1.605129, 0.8113284, 0, 0, 1, 1, 1,
1.639269, 1.115384, 1.725793, 1, 0, 0, 1, 1,
1.641834, 1.798244, 0.2717058, 1, 0, 0, 1, 1,
1.647816, 1.117001, 1.324225, 1, 0, 0, 1, 1,
1.648416, -0.1911063, 0.7763048, 1, 0, 0, 1, 1,
1.655561, 0.360324, 0.6246889, 1, 0, 0, 1, 1,
1.65592, 1.289649, 1.551888, 0, 0, 0, 1, 1,
1.660197, 0.9300039, 0.8155916, 0, 0, 0, 1, 1,
1.664463, 0.144657, 2.451846, 0, 0, 0, 1, 1,
1.70322, 0.5758538, 2.574771, 0, 0, 0, 1, 1,
1.724552, 0.8860719, 1.628633, 0, 0, 0, 1, 1,
1.737491, 1.129281, -1.662516, 0, 0, 0, 1, 1,
1.748806, 1.037451, 2.443837, 0, 0, 0, 1, 1,
1.762345, -0.05919873, 0.485756, 1, 1, 1, 1, 1,
1.795251, -0.4009506, 2.751617, 1, 1, 1, 1, 1,
1.799283, 0.04474777, 2.368202, 1, 1, 1, 1, 1,
1.807852, 1.597591, 0.1476842, 1, 1, 1, 1, 1,
1.817533, 0.4062803, 1.104318, 1, 1, 1, 1, 1,
1.820762, 1.214578, 0.8288713, 1, 1, 1, 1, 1,
1.821653, -1.234134, 1.806268, 1, 1, 1, 1, 1,
1.825594, -1.226603, 1.368721, 1, 1, 1, 1, 1,
1.85479, -0.08549012, 1.678996, 1, 1, 1, 1, 1,
1.856295, -2.293001, 1.995973, 1, 1, 1, 1, 1,
1.877097, -0.5612422, 2.990527, 1, 1, 1, 1, 1,
1.88089, -0.283204, 3.098574, 1, 1, 1, 1, 1,
1.880919, -0.2441055, 2.490542, 1, 1, 1, 1, 1,
1.937071, 0.8654789, 3.249826, 1, 1, 1, 1, 1,
1.949675, -0.2579678, 0.06840441, 1, 1, 1, 1, 1,
1.99007, 1.197799, 2.476649, 0, 0, 1, 1, 1,
2.006802, 2.194669, 0.06724326, 1, 0, 0, 1, 1,
2.073842, -0.8677333, 4.175593, 1, 0, 0, 1, 1,
2.090661, 1.751785, 1.199554, 1, 0, 0, 1, 1,
2.0964, 0.8012949, 0.6971451, 1, 0, 0, 1, 1,
2.105334, -0.4870109, 1.672601, 1, 0, 0, 1, 1,
2.106268, 1.147362, 0.3836536, 0, 0, 0, 1, 1,
2.143183, 0.5744979, 0.8211851, 0, 0, 0, 1, 1,
2.209994, -0.9439241, 3.211864, 0, 0, 0, 1, 1,
2.303304, -0.01449196, 1.953768, 0, 0, 0, 1, 1,
2.401226, -0.4181534, 1.935847, 0, 0, 0, 1, 1,
2.410805, 0.4089445, 1.068676, 0, 0, 0, 1, 1,
2.424442, 0.3676742, 0.9275844, 0, 0, 0, 1, 1,
2.438662, 0.05195376, 1.544325, 1, 1, 1, 1, 1,
2.45479, -1.941041, 0.8543512, 1, 1, 1, 1, 1,
2.486875, -0.4163946, 2.377705, 1, 1, 1, 1, 1,
2.498593, -1.676095, 2.865428, 1, 1, 1, 1, 1,
2.634694, 0.4349951, 2.0935, 1, 1, 1, 1, 1,
2.744558, 0.319197, 1.926979, 1, 1, 1, 1, 1,
2.759045, -0.9574749, 1.794458, 1, 1, 1, 1, 1
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
var radius = 10.08657;
var distance = 35.42865;
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
mvMatrix.translate( 0.1925076, 0.132653, 0.05558228 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.42865);
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
