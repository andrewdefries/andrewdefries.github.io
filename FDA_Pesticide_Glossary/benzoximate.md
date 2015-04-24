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
-3.120012, -0.09370607, -2.31357, 1, 0, 0, 1,
-3.069639, -1.212461, -1.381495, 1, 0.007843138, 0, 1,
-2.9482, 0.8660212, 0.02065189, 1, 0.01176471, 0, 1,
-2.696129, 0.4313646, -1.235812, 1, 0.01960784, 0, 1,
-2.574974, -0.2517523, -2.499396, 1, 0.02352941, 0, 1,
-2.573821, -1.039622, -0.8766237, 1, 0.03137255, 0, 1,
-2.548079, -1.22495, -2.362255, 1, 0.03529412, 0, 1,
-2.48366, -0.3978613, 0.1598057, 1, 0.04313726, 0, 1,
-2.435617, 0.7622975, -1.735082, 1, 0.04705882, 0, 1,
-2.408559, -2.272485, -3.827542, 1, 0.05490196, 0, 1,
-2.34123, 0.1899018, -1.924579, 1, 0.05882353, 0, 1,
-2.324448, 0.4266518, -0.09041274, 1, 0.06666667, 0, 1,
-2.288566, -0.4278201, -1.966711, 1, 0.07058824, 0, 1,
-2.216659, 0.2091592, -1.13763, 1, 0.07843138, 0, 1,
-2.126793, -0.1783685, -1.708726, 1, 0.08235294, 0, 1,
-2.072525, 1.134489, -2.333793, 1, 0.09019608, 0, 1,
-2.067048, 1.569399, -0.4607436, 1, 0.09411765, 0, 1,
-2.049706, -0.3496099, -2.007872, 1, 0.1019608, 0, 1,
-2.022786, 0.9274498, -1.649737, 1, 0.1098039, 0, 1,
-2.019004, -1.615221, -3.854645, 1, 0.1137255, 0, 1,
-1.990892, 1.362866, -2.138999, 1, 0.1215686, 0, 1,
-1.986675, -0.0806433, -1.675325, 1, 0.1254902, 0, 1,
-1.948531, 1.640514, -1.822735, 1, 0.1333333, 0, 1,
-1.944888, 0.8380596, -1.105074, 1, 0.1372549, 0, 1,
-1.939018, 1.204158, -0.9079753, 1, 0.145098, 0, 1,
-1.937304, -1.187469, -1.913427, 1, 0.1490196, 0, 1,
-1.93498, 0.952562, -0.6826633, 1, 0.1568628, 0, 1,
-1.921028, 0.0161009, -1.39641, 1, 0.1607843, 0, 1,
-1.917883, 0.6901136, 0.6769027, 1, 0.1686275, 0, 1,
-1.912675, -1.341566, -0.7523895, 1, 0.172549, 0, 1,
-1.911958, -1.582263, -1.989619, 1, 0.1803922, 0, 1,
-1.909395, 2.4853, 0.09169823, 1, 0.1843137, 0, 1,
-1.900169, 0.1244231, -0.8084123, 1, 0.1921569, 0, 1,
-1.880802, -1.021569, -1.220028, 1, 0.1960784, 0, 1,
-1.855021, -1.424159, -1.665074, 1, 0.2039216, 0, 1,
-1.78308, -1.381438, -1.917715, 1, 0.2117647, 0, 1,
-1.778316, 0.04657363, -2.940494, 1, 0.2156863, 0, 1,
-1.765259, 0.4997974, -3.090734, 1, 0.2235294, 0, 1,
-1.74777, -1.099172, -2.574369, 1, 0.227451, 0, 1,
-1.719969, -0.1452355, -3.190949, 1, 0.2352941, 0, 1,
-1.689629, 0.4246311, -1.319009, 1, 0.2392157, 0, 1,
-1.684591, -0.7567749, -2.907293, 1, 0.2470588, 0, 1,
-1.684221, 2.013015, -1.137519, 1, 0.2509804, 0, 1,
-1.683262, -0.6387115, -0.6267831, 1, 0.2588235, 0, 1,
-1.669272, -0.1795401, -2.99824, 1, 0.2627451, 0, 1,
-1.660154, 0.7837332, -1.26849, 1, 0.2705882, 0, 1,
-1.652053, -0.882095, -1.249224, 1, 0.2745098, 0, 1,
-1.622232, -0.7330204, -2.648299, 1, 0.282353, 0, 1,
-1.611484, -0.02625223, -1.405965, 1, 0.2862745, 0, 1,
-1.607477, -0.9666461, -2.542711, 1, 0.2941177, 0, 1,
-1.600003, -0.9020695, -2.212162, 1, 0.3019608, 0, 1,
-1.555984, -0.5795704, 0.1940958, 1, 0.3058824, 0, 1,
-1.542834, -0.9662992, -0.4130259, 1, 0.3137255, 0, 1,
-1.535281, -1.135655, -2.853121, 1, 0.3176471, 0, 1,
-1.532896, 1.390249, -0.01479963, 1, 0.3254902, 0, 1,
-1.509791, -0.002139197, -1.908235, 1, 0.3294118, 0, 1,
-1.504187, -2.124613, -0.5060212, 1, 0.3372549, 0, 1,
-1.49781, -0.2901857, -2.11684, 1, 0.3411765, 0, 1,
-1.491147, -0.6142622, -0.5325109, 1, 0.3490196, 0, 1,
-1.487331, 1.011155, -1.043905, 1, 0.3529412, 0, 1,
-1.476607, 0.3730447, -1.895153, 1, 0.3607843, 0, 1,
-1.475345, -0.1006073, -1.721847, 1, 0.3647059, 0, 1,
-1.450214, -1.204155, -1.299198, 1, 0.372549, 0, 1,
-1.448744, -0.432313, -3.05446, 1, 0.3764706, 0, 1,
-1.435256, -1.28623, -1.577209, 1, 0.3843137, 0, 1,
-1.423843, 2.109042, -0.4140928, 1, 0.3882353, 0, 1,
-1.415753, 0.5049348, -0.5788844, 1, 0.3960784, 0, 1,
-1.414726, -0.2924819, -1.827294, 1, 0.4039216, 0, 1,
-1.411007, 1.640834, -0.2749439, 1, 0.4078431, 0, 1,
-1.408579, 1.565302, -1.261929, 1, 0.4156863, 0, 1,
-1.400758, 1.612602, -0.3342068, 1, 0.4196078, 0, 1,
-1.384041, 1.370339, -2.434793, 1, 0.427451, 0, 1,
-1.383262, 0.3977896, -1.5065, 1, 0.4313726, 0, 1,
-1.381449, 0.3999489, -3.153465, 1, 0.4392157, 0, 1,
-1.374955, 1.609914, 0.3452512, 1, 0.4431373, 0, 1,
-1.370617, 0.6244641, 1.017446, 1, 0.4509804, 0, 1,
-1.368576, -0.5050388, -2.310588, 1, 0.454902, 0, 1,
-1.355094, 0.97619, -0.6972855, 1, 0.4627451, 0, 1,
-1.344085, 0.5378182, 0.5297155, 1, 0.4666667, 0, 1,
-1.341721, -0.6014895, -1.762976, 1, 0.4745098, 0, 1,
-1.341492, -0.5897473, -0.6185642, 1, 0.4784314, 0, 1,
-1.332541, -0.07896928, -2.371642, 1, 0.4862745, 0, 1,
-1.331477, -0.1360776, -1.994648, 1, 0.4901961, 0, 1,
-1.31664, 1.375394, -0.5725201, 1, 0.4980392, 0, 1,
-1.314395, -0.6189972, 0.8088292, 1, 0.5058824, 0, 1,
-1.307014, -0.06062919, -1.307012, 1, 0.509804, 0, 1,
-1.301642, -0.610604, -1.618925, 1, 0.5176471, 0, 1,
-1.300066, -0.08922103, -2.117517, 1, 0.5215687, 0, 1,
-1.284632, 0.2454785, -3.43625, 1, 0.5294118, 0, 1,
-1.271864, -0.01209522, -2.7658, 1, 0.5333334, 0, 1,
-1.265, 0.2713675, -1.237159, 1, 0.5411765, 0, 1,
-1.262394, 0.3797046, -1.392888, 1, 0.5450981, 0, 1,
-1.259874, -1.18502, -2.621045, 1, 0.5529412, 0, 1,
-1.259073, 0.5594452, -1.347842, 1, 0.5568628, 0, 1,
-1.252205, 0.1509886, -3.334867, 1, 0.5647059, 0, 1,
-1.246367, 0.005858262, -1.46825, 1, 0.5686275, 0, 1,
-1.24195, -0.7081522, -1.067257, 1, 0.5764706, 0, 1,
-1.236152, -1.989023, -1.31533, 1, 0.5803922, 0, 1,
-1.232314, -0.154457, -0.2616999, 1, 0.5882353, 0, 1,
-1.229135, 0.5601717, -0.6160344, 1, 0.5921569, 0, 1,
-1.227382, -0.1428525, -1.029867, 1, 0.6, 0, 1,
-1.226672, -1.01613, -0.7429117, 1, 0.6078432, 0, 1,
-1.218948, 0.2430359, -2.232724, 1, 0.6117647, 0, 1,
-1.218245, -0.6594571, -2.133882, 1, 0.6196079, 0, 1,
-1.217762, -0.6130633, -0.5155352, 1, 0.6235294, 0, 1,
-1.216314, -0.08444197, -1.8429, 1, 0.6313726, 0, 1,
-1.208257, -0.2671216, -1.761476, 1, 0.6352941, 0, 1,
-1.207217, -1.168712, -2.764528, 1, 0.6431373, 0, 1,
-1.205555, 0.6408384, -1.132119, 1, 0.6470588, 0, 1,
-1.199517, 0.03898603, -1.56994, 1, 0.654902, 0, 1,
-1.196822, 0.02420675, -1.149643, 1, 0.6588235, 0, 1,
-1.194817, 1.342414, -1.015321, 1, 0.6666667, 0, 1,
-1.190242, 0.6290922, -3.609619, 1, 0.6705883, 0, 1,
-1.183652, 1.117778, -0.5631486, 1, 0.6784314, 0, 1,
-1.178828, 1.510745, -0.3118542, 1, 0.682353, 0, 1,
-1.17623, 0.7796521, -0.5295559, 1, 0.6901961, 0, 1,
-1.176044, -0.4549979, -1.576258, 1, 0.6941177, 0, 1,
-1.173402, -0.8511264, -2.186213, 1, 0.7019608, 0, 1,
-1.170892, 1.040377, -0.6941074, 1, 0.7098039, 0, 1,
-1.149249, -0.01209746, -0.477088, 1, 0.7137255, 0, 1,
-1.137422, -2.044416, 0.1565967, 1, 0.7215686, 0, 1,
-1.118795, 1.592327, -0.5571235, 1, 0.7254902, 0, 1,
-1.106119, 0.04554506, -2.269957, 1, 0.7333333, 0, 1,
-1.104619, 0.03089543, -2.01861, 1, 0.7372549, 0, 1,
-1.101536, -1.339763, -0.4586416, 1, 0.7450981, 0, 1,
-1.099988, 0.08462515, -2.353022, 1, 0.7490196, 0, 1,
-1.096782, 0.02070073, -1.791407, 1, 0.7568628, 0, 1,
-1.096557, 1.360492, -0.7592675, 1, 0.7607843, 0, 1,
-1.095332, -1.942751, -1.865005, 1, 0.7686275, 0, 1,
-1.094746, -1.52073, -3.044266, 1, 0.772549, 0, 1,
-1.08892, -0.3247141, -2.653162, 1, 0.7803922, 0, 1,
-1.08598, -0.1006615, -1.69456, 1, 0.7843137, 0, 1,
-1.070379, 0.9037795, -0.524667, 1, 0.7921569, 0, 1,
-1.068977, -0.2112976, -1.637083, 1, 0.7960784, 0, 1,
-1.061911, 1.732844, -0.8052865, 1, 0.8039216, 0, 1,
-1.061416, -0.6959336, -2.841402, 1, 0.8117647, 0, 1,
-1.060786, -0.3246783, -1.117537, 1, 0.8156863, 0, 1,
-1.052036, -0.2250161, -1.993055, 1, 0.8235294, 0, 1,
-1.051706, -0.2769643, -1.239992, 1, 0.827451, 0, 1,
-1.04111, -0.7348496, -3.253016, 1, 0.8352941, 0, 1,
-1.036021, 0.4681914, -1.767618, 1, 0.8392157, 0, 1,
-1.034325, 0.0771401, 0.2918196, 1, 0.8470588, 0, 1,
-1.022765, -0.008577052, -2.486565, 1, 0.8509804, 0, 1,
-1.019909, -0.5956091, -2.93064, 1, 0.8588235, 0, 1,
-1.016439, -0.9990669, -3.557115, 1, 0.8627451, 0, 1,
-1.01316, 0.3036563, -1.841721, 1, 0.8705882, 0, 1,
-1.007483, 0.1747308, -1.497696, 1, 0.8745098, 0, 1,
-0.9963092, -0.8303322, -2.36582, 1, 0.8823529, 0, 1,
-0.9943627, -0.3985996, -2.122208, 1, 0.8862745, 0, 1,
-0.9918789, 1.606065, -1.053157, 1, 0.8941177, 0, 1,
-0.9803588, -0.1665876, -2.091829, 1, 0.8980392, 0, 1,
-0.9801552, 0.1233022, -1.294115, 1, 0.9058824, 0, 1,
-0.9760744, -0.06582341, -4.162082, 1, 0.9137255, 0, 1,
-0.9715236, -0.348294, -2.758271, 1, 0.9176471, 0, 1,
-0.9658192, 1.930627, 0.5684637, 1, 0.9254902, 0, 1,
-0.9600353, -0.1892429, -0.8577742, 1, 0.9294118, 0, 1,
-0.9592899, 0.8715402, 0.4742973, 1, 0.9372549, 0, 1,
-0.9579105, 1.235416, -1.303968, 1, 0.9411765, 0, 1,
-0.9564049, -0.0008230217, -1.812216, 1, 0.9490196, 0, 1,
-0.9501081, -2.524387, -4.377941, 1, 0.9529412, 0, 1,
-0.9457172, 0.3299983, -0.3157809, 1, 0.9607843, 0, 1,
-0.9381921, -1.230737, -2.767205, 1, 0.9647059, 0, 1,
-0.9361319, 1.150953, -0.8856683, 1, 0.972549, 0, 1,
-0.9348962, -1.036756, -1.720677, 1, 0.9764706, 0, 1,
-0.9297374, -0.1516595, -2.196579, 1, 0.9843137, 0, 1,
-0.9287574, -1.085412, -1.80377, 1, 0.9882353, 0, 1,
-0.923217, 1.364016, 0.6003246, 1, 0.9960784, 0, 1,
-0.9205955, -1.035898, -3.399647, 0.9960784, 1, 0, 1,
-0.917288, -0.6659421, -1.952447, 0.9921569, 1, 0, 1,
-0.9171813, -0.5920773, -1.495805, 0.9843137, 1, 0, 1,
-0.9136468, -0.6950074, -2.87713, 0.9803922, 1, 0, 1,
-0.9108886, -0.5114153, -2.898793, 0.972549, 1, 0, 1,
-0.9074395, -0.08455244, -1.854275, 0.9686275, 1, 0, 1,
-0.905542, 0.2616413, -0.8569206, 0.9607843, 1, 0, 1,
-0.9040373, 0.2933206, -1.100552, 0.9568627, 1, 0, 1,
-0.8984401, -0.8761876, -2.713048, 0.9490196, 1, 0, 1,
-0.8929026, 0.7204503, -1.711019, 0.945098, 1, 0, 1,
-0.8892017, -1.104174, -2.713924, 0.9372549, 1, 0, 1,
-0.8777601, 0.9991067, 0.6493354, 0.9333333, 1, 0, 1,
-0.8737507, -0.5930835, -2.292375, 0.9254902, 1, 0, 1,
-0.8690024, -0.529089, -1.99136, 0.9215686, 1, 0, 1,
-0.867021, 1.263919, -1.437422, 0.9137255, 1, 0, 1,
-0.8571001, -0.009744849, -1.775178, 0.9098039, 1, 0, 1,
-0.8447084, -1.139059, -2.712454, 0.9019608, 1, 0, 1,
-0.8425296, 1.226905, -1.643992, 0.8941177, 1, 0, 1,
-0.8418601, 0.09992429, -3.4419, 0.8901961, 1, 0, 1,
-0.8399079, 0.7405078, -1.35014, 0.8823529, 1, 0, 1,
-0.8357586, -0.05861472, -2.290408, 0.8784314, 1, 0, 1,
-0.8317532, -0.04745876, -2.14396, 0.8705882, 1, 0, 1,
-0.8265433, 0.5358716, -1.467137, 0.8666667, 1, 0, 1,
-0.8250664, 1.585266, 0.5773041, 0.8588235, 1, 0, 1,
-0.8231723, 0.6667628, -0.7911503, 0.854902, 1, 0, 1,
-0.8226903, 0.01792783, -1.694821, 0.8470588, 1, 0, 1,
-0.8218775, -0.4725058, -2.843208, 0.8431373, 1, 0, 1,
-0.8209059, 0.0868307, -2.441671, 0.8352941, 1, 0, 1,
-0.8125694, -0.517791, -0.7196751, 0.8313726, 1, 0, 1,
-0.8088958, -0.7758771, -2.128501, 0.8235294, 1, 0, 1,
-0.8069206, 0.320364, -2.008554, 0.8196079, 1, 0, 1,
-0.8064643, -0.3993717, -2.184219, 0.8117647, 1, 0, 1,
-0.8037965, -0.3419337, -2.534663, 0.8078431, 1, 0, 1,
-0.8020375, -1.167585, -1.545133, 0.8, 1, 0, 1,
-0.7992821, 0.5500163, -0.7030403, 0.7921569, 1, 0, 1,
-0.7928355, 0.323869, -0.8269914, 0.7882353, 1, 0, 1,
-0.7926441, 0.7409632, -1.850312, 0.7803922, 1, 0, 1,
-0.7918953, 0.5036084, -0.6623769, 0.7764706, 1, 0, 1,
-0.7913129, -0.6463881, -1.248151, 0.7686275, 1, 0, 1,
-0.7896783, -1.108579, -2.967618, 0.7647059, 1, 0, 1,
-0.7871467, -0.8569944, -1.978519, 0.7568628, 1, 0, 1,
-0.7855721, 1.898927, -2.556692, 0.7529412, 1, 0, 1,
-0.7760912, -1.768093, -3.636039, 0.7450981, 1, 0, 1,
-0.7685263, 1.211699, -0.4569774, 0.7411765, 1, 0, 1,
-0.7640657, 0.1628636, -0.9066615, 0.7333333, 1, 0, 1,
-0.761845, 0.6447591, -1.746075, 0.7294118, 1, 0, 1,
-0.7443899, -0.01138912, -0.7377728, 0.7215686, 1, 0, 1,
-0.7407689, -0.6253937, -1.566773, 0.7176471, 1, 0, 1,
-0.7349692, -0.7188097, -3.343101, 0.7098039, 1, 0, 1,
-0.7300864, -0.35436, -2.245125, 0.7058824, 1, 0, 1,
-0.7271563, -0.5933661, -2.28319, 0.6980392, 1, 0, 1,
-0.7254797, -0.03963386, -0.9502677, 0.6901961, 1, 0, 1,
-0.7143458, 0.8858292, -1.486638, 0.6862745, 1, 0, 1,
-0.7095816, 0.6879155, -1.319823, 0.6784314, 1, 0, 1,
-0.7072796, 0.6528658, -1.484737, 0.6745098, 1, 0, 1,
-0.7065049, 2.420024, -0.1409823, 0.6666667, 1, 0, 1,
-0.7064324, 1.273274, -0.2573687, 0.6627451, 1, 0, 1,
-0.7032548, -0.05725556, 2.158824, 0.654902, 1, 0, 1,
-0.7016736, 0.05281065, -3.482908, 0.6509804, 1, 0, 1,
-0.6943614, 1.250707, -1.668144, 0.6431373, 1, 0, 1,
-0.6871515, -0.05327369, -2.549063, 0.6392157, 1, 0, 1,
-0.6866395, -1.69277, -3.205274, 0.6313726, 1, 0, 1,
-0.6848596, -0.982136, -1.950795, 0.627451, 1, 0, 1,
-0.6848544, -0.448842, -1.250512, 0.6196079, 1, 0, 1,
-0.6825913, -0.8614013, -2.768518, 0.6156863, 1, 0, 1,
-0.676194, -1.037272, -1.353462, 0.6078432, 1, 0, 1,
-0.6744298, 0.04177058, -1.466199, 0.6039216, 1, 0, 1,
-0.6696222, -1.445637, -3.128829, 0.5960785, 1, 0, 1,
-0.6690513, -0.4079643, -0.6321698, 0.5882353, 1, 0, 1,
-0.6643349, 1.533716, -0.6630077, 0.5843138, 1, 0, 1,
-0.6554948, -0.4676162, -4.158934, 0.5764706, 1, 0, 1,
-0.6553047, 0.69765, 1.074893, 0.572549, 1, 0, 1,
-0.6535194, -0.2929204, -1.959935, 0.5647059, 1, 0, 1,
-0.6486012, 0.9084856, 0.5971694, 0.5607843, 1, 0, 1,
-0.6453503, 1.215473, -1.205859, 0.5529412, 1, 0, 1,
-0.6422808, -2.3338, -2.054496, 0.5490196, 1, 0, 1,
-0.6319352, -2.039886, -1.606721, 0.5411765, 1, 0, 1,
-0.6305583, -1.329387, -3.667099, 0.5372549, 1, 0, 1,
-0.6282681, -0.6071457, -0.3770327, 0.5294118, 1, 0, 1,
-0.6250654, -1.755074, -2.358225, 0.5254902, 1, 0, 1,
-0.6247992, -1.574301, -3.287797, 0.5176471, 1, 0, 1,
-0.6187493, 0.601781, -0.2247212, 0.5137255, 1, 0, 1,
-0.6130373, 1.28781, -0.8644036, 0.5058824, 1, 0, 1,
-0.6059726, 0.8822871, 0.8935983, 0.5019608, 1, 0, 1,
-0.6025471, 0.7438169, 0.2653006, 0.4941176, 1, 0, 1,
-0.600978, -0.316356, -1.924523, 0.4862745, 1, 0, 1,
-0.5944999, 0.2859616, -1.191034, 0.4823529, 1, 0, 1,
-0.5917687, 0.646485, -1.366284, 0.4745098, 1, 0, 1,
-0.5835105, -1.498165, -2.361737, 0.4705882, 1, 0, 1,
-0.5812283, 0.2566272, 0.5327019, 0.4627451, 1, 0, 1,
-0.5807478, -0.7232016, -2.308461, 0.4588235, 1, 0, 1,
-0.5682844, 0.1439487, 0.833568, 0.4509804, 1, 0, 1,
-0.5682413, -0.431561, -1.42339, 0.4470588, 1, 0, 1,
-0.5654982, 2.578978, -0.6472685, 0.4392157, 1, 0, 1,
-0.5637043, 1.098152, -0.973253, 0.4352941, 1, 0, 1,
-0.5578831, -0.06247195, -1.769434, 0.427451, 1, 0, 1,
-0.5570345, 0.3151262, -1.810178, 0.4235294, 1, 0, 1,
-0.5563167, -1.395768, -3.257311, 0.4156863, 1, 0, 1,
-0.5513363, -0.2852439, -1.964142, 0.4117647, 1, 0, 1,
-0.5499292, -0.2979507, -2.065713, 0.4039216, 1, 0, 1,
-0.5472688, 1.832659, 0.8050492, 0.3960784, 1, 0, 1,
-0.5469006, -1.144398, -2.724125, 0.3921569, 1, 0, 1,
-0.5437202, -2.697488, -2.27879, 0.3843137, 1, 0, 1,
-0.5346547, 0.4077283, -1.241449, 0.3803922, 1, 0, 1,
-0.5336358, 1.140335, 0.6453536, 0.372549, 1, 0, 1,
-0.5298046, -2.084094, -3.287912, 0.3686275, 1, 0, 1,
-0.5269678, 0.06160544, -3.200486, 0.3607843, 1, 0, 1,
-0.5268545, -0.4984522, -2.450834, 0.3568628, 1, 0, 1,
-0.5253192, 0.2689559, -1.63212, 0.3490196, 1, 0, 1,
-0.5243743, -1.045827, -2.378986, 0.345098, 1, 0, 1,
-0.5231097, 0.5532622, -2.504586, 0.3372549, 1, 0, 1,
-0.5212552, 1.163212, -1.747323, 0.3333333, 1, 0, 1,
-0.5174332, 1.434587, 0.9959188, 0.3254902, 1, 0, 1,
-0.5163636, 0.5696796, -0.0007713996, 0.3215686, 1, 0, 1,
-0.514191, 1.65668, -0.1920743, 0.3137255, 1, 0, 1,
-0.5132545, 0.4577431, 0.5570739, 0.3098039, 1, 0, 1,
-0.5100178, 1.953823, -0.8374869, 0.3019608, 1, 0, 1,
-0.5022718, 0.05842597, -2.248047, 0.2941177, 1, 0, 1,
-0.4980431, -0.6544805, -2.716616, 0.2901961, 1, 0, 1,
-0.4964892, 0.2295242, -2.675128, 0.282353, 1, 0, 1,
-0.4925927, 0.9341967, -0.288562, 0.2784314, 1, 0, 1,
-0.4901377, 1.076206, -0.7125011, 0.2705882, 1, 0, 1,
-0.4840769, 0.0613522, -1.583943, 0.2666667, 1, 0, 1,
-0.4840758, 0.7845967, -1.884526, 0.2588235, 1, 0, 1,
-0.4782103, -0.35657, -1.462066, 0.254902, 1, 0, 1,
-0.4749964, 0.1019012, -0.7592235, 0.2470588, 1, 0, 1,
-0.4743182, -0.0767245, 0.1521399, 0.2431373, 1, 0, 1,
-0.4699299, -1.347758, -5.740596, 0.2352941, 1, 0, 1,
-0.4617303, 0.4192154, -2.063417, 0.2313726, 1, 0, 1,
-0.4604784, -1.977305, -4.058834, 0.2235294, 1, 0, 1,
-0.4561124, 1.819823, 0.187538, 0.2196078, 1, 0, 1,
-0.4545329, -0.2864616, -1.907634, 0.2117647, 1, 0, 1,
-0.4523885, 1.584718, -1.269489, 0.2078431, 1, 0, 1,
-0.4470396, -1.071534, -2.621437, 0.2, 1, 0, 1,
-0.4444672, 1.183191, -1.95219, 0.1921569, 1, 0, 1,
-0.4386295, 0.5214086, -0.882983, 0.1882353, 1, 0, 1,
-0.4364633, -1.425231, -2.014874, 0.1803922, 1, 0, 1,
-0.4310274, -2.963119, -2.862433, 0.1764706, 1, 0, 1,
-0.4309106, -0.2593597, -2.402248, 0.1686275, 1, 0, 1,
-0.4256026, 0.1814152, -0.208665, 0.1647059, 1, 0, 1,
-0.4229594, -0.06945357, -2.174039, 0.1568628, 1, 0, 1,
-0.4221711, 0.385144, -2.025448, 0.1529412, 1, 0, 1,
-0.420741, -0.07106224, -2.018021, 0.145098, 1, 0, 1,
-0.4174856, -1.179222, -3.014096, 0.1411765, 1, 0, 1,
-0.4149609, -1.266964, -3.034762, 0.1333333, 1, 0, 1,
-0.4134607, 1.164799, -2.834739, 0.1294118, 1, 0, 1,
-0.4115023, -2.887194, -4.106547, 0.1215686, 1, 0, 1,
-0.4108112, -2.239448, -1.85073, 0.1176471, 1, 0, 1,
-0.4063444, 1.224817, -1.112737, 0.1098039, 1, 0, 1,
-0.40342, -0.8593284, -3.214979, 0.1058824, 1, 0, 1,
-0.4033398, 1.48083, 1.438813, 0.09803922, 1, 0, 1,
-0.4002873, -1.113779, -1.864368, 0.09019608, 1, 0, 1,
-0.393158, -0.4638055, -2.914375, 0.08627451, 1, 0, 1,
-0.3900335, -1.302057, -3.502601, 0.07843138, 1, 0, 1,
-0.3874815, -0.08959575, -3.269166, 0.07450981, 1, 0, 1,
-0.3864891, -0.4460742, -2.564732, 0.06666667, 1, 0, 1,
-0.375509, -0.4299989, -4.470101, 0.0627451, 1, 0, 1,
-0.3693752, -0.1335171, -3.71294, 0.05490196, 1, 0, 1,
-0.3686999, -0.779397, -2.255556, 0.05098039, 1, 0, 1,
-0.365739, -0.2485759, -2.932703, 0.04313726, 1, 0, 1,
-0.3636375, 0.4866966, -0.8320192, 0.03921569, 1, 0, 1,
-0.3621783, 0.4479705, -1.292503, 0.03137255, 1, 0, 1,
-0.3602189, 1.352568, 0.325102, 0.02745098, 1, 0, 1,
-0.3546428, -0.6445175, -3.585279, 0.01960784, 1, 0, 1,
-0.3544214, 1.067584, -0.1368133, 0.01568628, 1, 0, 1,
-0.3504147, 0.3261842, 1.540533, 0.007843138, 1, 0, 1,
-0.3484754, -0.1732043, -1.63046, 0.003921569, 1, 0, 1,
-0.3473093, -0.729046, -3.802641, 0, 1, 0.003921569, 1,
-0.3404971, 1.054485, 0.02109271, 0, 1, 0.01176471, 1,
-0.3400233, 1.497271, -0.9774792, 0, 1, 0.01568628, 1,
-0.3395482, 1.020898, -1.123067, 0, 1, 0.02352941, 1,
-0.3395264, -1.403883, -2.919286, 0, 1, 0.02745098, 1,
-0.3369594, -1.099934, -3.347506, 0, 1, 0.03529412, 1,
-0.3356068, 0.5496861, -0.5642157, 0, 1, 0.03921569, 1,
-0.3355004, -0.001499468, -1.085704, 0, 1, 0.04705882, 1,
-0.3330506, -0.3043199, -1.684313, 0, 1, 0.05098039, 1,
-0.3311794, 0.7595114, 0.5932868, 0, 1, 0.05882353, 1,
-0.3301086, 0.2939074, 0.09060533, 0, 1, 0.0627451, 1,
-0.3298524, -0.01221376, -1.278042, 0, 1, 0.07058824, 1,
-0.3286671, 0.7902764, -1.438406, 0, 1, 0.07450981, 1,
-0.327549, -0.6368636, -2.114277, 0, 1, 0.08235294, 1,
-0.3264682, 0.9981608, 0.1172075, 0, 1, 0.08627451, 1,
-0.3254859, -0.894862, -3.728321, 0, 1, 0.09411765, 1,
-0.3240605, 1.280107, 1.029501, 0, 1, 0.1019608, 1,
-0.3234531, -0.6225095, -2.810953, 0, 1, 0.1058824, 1,
-0.3233811, -0.4171443, -2.345965, 0, 1, 0.1137255, 1,
-0.3170302, 1.162633, 0.8881529, 0, 1, 0.1176471, 1,
-0.3110712, 0.3498449, -0.9994481, 0, 1, 0.1254902, 1,
-0.3074355, -2.138729, -3.340334, 0, 1, 0.1294118, 1,
-0.306479, -1.220448, -3.160914, 0, 1, 0.1372549, 1,
-0.3039846, -0.595897, -2.514886, 0, 1, 0.1411765, 1,
-0.3036574, -1.110343, -2.212122, 0, 1, 0.1490196, 1,
-0.3026915, -2.433721, -2.325067, 0, 1, 0.1529412, 1,
-0.3024625, -0.1186425, -0.01532561, 0, 1, 0.1607843, 1,
-0.3008201, -1.809301, -2.613742, 0, 1, 0.1647059, 1,
-0.2950608, -1.092308, -2.082452, 0, 1, 0.172549, 1,
-0.2949338, 1.76013, -2.649073, 0, 1, 0.1764706, 1,
-0.2916518, -0.4130234, -1.660574, 0, 1, 0.1843137, 1,
-0.2916283, -0.159922, -2.811625, 0, 1, 0.1882353, 1,
-0.2906506, 0.3148611, -1.343721, 0, 1, 0.1960784, 1,
-0.285626, 0.5945298, -0.3156455, 0, 1, 0.2039216, 1,
-0.2833387, -1.205007, -3.33784, 0, 1, 0.2078431, 1,
-0.2782824, -0.1192297, -3.348932, 0, 1, 0.2156863, 1,
-0.2764962, 0.2008501, -0.3617201, 0, 1, 0.2196078, 1,
-0.268149, -1.767611, -4.147005, 0, 1, 0.227451, 1,
-0.2652998, -0.3850588, -3.446708, 0, 1, 0.2313726, 1,
-0.2640806, 1.291359, 0.2099425, 0, 1, 0.2392157, 1,
-0.2536079, 0.8795618, -0.2207659, 0, 1, 0.2431373, 1,
-0.2505515, 1.101929, -0.7213082, 0, 1, 0.2509804, 1,
-0.2492859, 0.09511054, -1.821949, 0, 1, 0.254902, 1,
-0.24826, 0.1116566, -0.3399235, 0, 1, 0.2627451, 1,
-0.2477565, 0.7050052, -2.19891, 0, 1, 0.2666667, 1,
-0.2460948, 0.5160135, -1.947276, 0, 1, 0.2745098, 1,
-0.2441139, 0.5829799, -0.3582386, 0, 1, 0.2784314, 1,
-0.2411847, 0.3043161, 0.6197132, 0, 1, 0.2862745, 1,
-0.2403937, -1.030759, -3.314861, 0, 1, 0.2901961, 1,
-0.2399876, -0.26022, -1.822936, 0, 1, 0.2980392, 1,
-0.239861, 1.444431, 0.7853653, 0, 1, 0.3058824, 1,
-0.2398577, -0.9538692, -1.979601, 0, 1, 0.3098039, 1,
-0.2380254, -0.983897, -3.667652, 0, 1, 0.3176471, 1,
-0.2336145, 0.1438807, -1.928172, 0, 1, 0.3215686, 1,
-0.2285728, -0.4963861, -2.467492, 0, 1, 0.3294118, 1,
-0.228048, 1.44272, -0.07964133, 0, 1, 0.3333333, 1,
-0.2279072, -0.3947978, -5.068485, 0, 1, 0.3411765, 1,
-0.2250019, 0.8503463, -1.267473, 0, 1, 0.345098, 1,
-0.2246147, 0.8932514, -0.852011, 0, 1, 0.3529412, 1,
-0.2215001, -0.5269945, -3.217695, 0, 1, 0.3568628, 1,
-0.221349, -0.03145942, -2.480172, 0, 1, 0.3647059, 1,
-0.2171953, 2.639318, -1.142716, 0, 1, 0.3686275, 1,
-0.2146848, 1.17514, -1.207306, 0, 1, 0.3764706, 1,
-0.2136209, -1.06626, -2.398516, 0, 1, 0.3803922, 1,
-0.2045077, -1.906229, -2.564377, 0, 1, 0.3882353, 1,
-0.1980347, -0.1422798, -2.661045, 0, 1, 0.3921569, 1,
-0.1943912, 0.9888567, 1.309458, 0, 1, 0.4, 1,
-0.1934516, -1.281812, -2.716168, 0, 1, 0.4078431, 1,
-0.1913838, 0.338815, -0.3726083, 0, 1, 0.4117647, 1,
-0.1910465, -2.007875, -3.681329, 0, 1, 0.4196078, 1,
-0.1801311, 0.8500258, 0.3648002, 0, 1, 0.4235294, 1,
-0.1780057, 1.721606, 0.6551822, 0, 1, 0.4313726, 1,
-0.1659268, 0.6036564, 0.4047189, 0, 1, 0.4352941, 1,
-0.165081, -0.5810047, -2.466057, 0, 1, 0.4431373, 1,
-0.1650418, -1.651426, -2.982988, 0, 1, 0.4470588, 1,
-0.1529247, -1.581067, -1.397395, 0, 1, 0.454902, 1,
-0.1482814, -0.558385, -3.207963, 0, 1, 0.4588235, 1,
-0.1479356, 0.4494781, -0.2037762, 0, 1, 0.4666667, 1,
-0.1460466, 0.8255406, 0.1636437, 0, 1, 0.4705882, 1,
-0.1459954, 0.7934071, -0.6021461, 0, 1, 0.4784314, 1,
-0.1453796, 0.6383632, 0.08669566, 0, 1, 0.4823529, 1,
-0.1453042, 0.6664984, 0.7012156, 0, 1, 0.4901961, 1,
-0.1436149, 1.630024, -0.03753921, 0, 1, 0.4941176, 1,
-0.136831, 0.7731047, -1.081676, 0, 1, 0.5019608, 1,
-0.1350369, -0.7465668, -3.177556, 0, 1, 0.509804, 1,
-0.1304158, -0.3987514, -3.570594, 0, 1, 0.5137255, 1,
-0.1265057, 0.3281175, -0.5507789, 0, 1, 0.5215687, 1,
-0.1234663, 0.4282619, -1.174791, 0, 1, 0.5254902, 1,
-0.121124, 0.2623796, -0.9154626, 0, 1, 0.5333334, 1,
-0.1197676, -1.821464, -1.574292, 0, 1, 0.5372549, 1,
-0.1165734, 1.997765, 1.277501, 0, 1, 0.5450981, 1,
-0.1155887, 0.09103589, -1.285111, 0, 1, 0.5490196, 1,
-0.1141327, -1.64924, -4.389229, 0, 1, 0.5568628, 1,
-0.110371, 0.2674518, -1.503672, 0, 1, 0.5607843, 1,
-0.1093209, -0.9010553, -4.33921, 0, 1, 0.5686275, 1,
-0.1073022, -1.688297, -3.07826, 0, 1, 0.572549, 1,
-0.1052828, 0.1822227, -1.479885, 0, 1, 0.5803922, 1,
-0.09842366, -0.8388168, -2.879642, 0, 1, 0.5843138, 1,
-0.09715751, -0.4854088, -2.313792, 0, 1, 0.5921569, 1,
-0.09027757, 0.5683654, -1.391473, 0, 1, 0.5960785, 1,
-0.08872208, 0.3393647, 0.6304851, 0, 1, 0.6039216, 1,
-0.0867698, -0.3429568, -1.994463, 0, 1, 0.6117647, 1,
-0.08337164, 1.448822, 0.3640532, 0, 1, 0.6156863, 1,
-0.08287726, 2.424377, 0.9794582, 0, 1, 0.6235294, 1,
-0.08250521, 0.9572756, 0.5180556, 0, 1, 0.627451, 1,
-0.08042708, 1.960669, 1.22532, 0, 1, 0.6352941, 1,
-0.0803883, -1.35213, -2.428454, 0, 1, 0.6392157, 1,
-0.0800635, 0.08720614, -0.3780386, 0, 1, 0.6470588, 1,
-0.07823708, 0.3219198, -0.6566143, 0, 1, 0.6509804, 1,
-0.07681766, -0.3973919, -4.948169, 0, 1, 0.6588235, 1,
-0.07627826, -0.9312243, -3.427133, 0, 1, 0.6627451, 1,
-0.07617468, -0.5529083, -2.304955, 0, 1, 0.6705883, 1,
-0.07538047, 0.5356845, 0.06047648, 0, 1, 0.6745098, 1,
-0.07452278, 0.3012499, -2.607307, 0, 1, 0.682353, 1,
-0.07198808, 2.263473, 1.293148, 0, 1, 0.6862745, 1,
-0.06913577, -1.422083, -2.953513, 0, 1, 0.6941177, 1,
-0.06814638, -1.59651, -3.003397, 0, 1, 0.7019608, 1,
-0.06497201, -2.197863, -1.997722, 0, 1, 0.7058824, 1,
-0.0647961, 0.07479664, -0.1348815, 0, 1, 0.7137255, 1,
-0.06334006, -0.1668153, -1.749789, 0, 1, 0.7176471, 1,
-0.05935591, -1.254911, -3.154255, 0, 1, 0.7254902, 1,
-0.05803164, -1.524087, -3.298608, 0, 1, 0.7294118, 1,
-0.05711253, -0.1263187, -3.251076, 0, 1, 0.7372549, 1,
-0.05508343, -1.159906, -3.410563, 0, 1, 0.7411765, 1,
-0.04981549, -1.469969, -2.946888, 0, 1, 0.7490196, 1,
-0.04979824, 0.4703959, -1.295076, 0, 1, 0.7529412, 1,
-0.04843148, -0.1758917, -2.652943, 0, 1, 0.7607843, 1,
-0.04595624, 0.2709998, -0.5611703, 0, 1, 0.7647059, 1,
-0.04527784, -1.564826, -2.981517, 0, 1, 0.772549, 1,
-0.04337101, 0.8611184, 1.233443, 0, 1, 0.7764706, 1,
-0.04061686, 1.675146, 1.222778, 0, 1, 0.7843137, 1,
-0.03808855, -0.005828794, -2.087602, 0, 1, 0.7882353, 1,
-0.03514223, -0.9896891, -2.744292, 0, 1, 0.7960784, 1,
-0.03451395, 0.9405495, 1.805216, 0, 1, 0.8039216, 1,
-0.03435555, 0.05307904, -0.155194, 0, 1, 0.8078431, 1,
-0.03121166, 0.5076406, 0.2981144, 0, 1, 0.8156863, 1,
-0.02752209, -2.336988, -3.820263, 0, 1, 0.8196079, 1,
-0.02616164, -0.5082726, -2.890725, 0, 1, 0.827451, 1,
-0.02367644, 1.68587, 0.4614078, 0, 1, 0.8313726, 1,
-0.02314798, 0.9019927, -1.023686, 0, 1, 0.8392157, 1,
-0.01833687, -0.9283203, -1.13984, 0, 1, 0.8431373, 1,
-0.01729572, -0.7405245, -3.656635, 0, 1, 0.8509804, 1,
-0.01375532, 0.7365609, 0.1379845, 0, 1, 0.854902, 1,
-0.01328196, 0.3745869, 1.334051, 0, 1, 0.8627451, 1,
-0.01289919, 0.7604974, -0.7936913, 0, 1, 0.8666667, 1,
-0.008027303, -0.7258421, -2.442207, 0, 1, 0.8745098, 1,
-0.005509459, 0.4536609, 0.678767, 0, 1, 0.8784314, 1,
-0.004153793, -1.321736, -3.523878, 0, 1, 0.8862745, 1,
-0.003280142, -0.3805158, -4.329732, 0, 1, 0.8901961, 1,
-0.0002051684, 0.145896, -0.3389582, 0, 1, 0.8980392, 1,
0.004449291, 0.9941133, -1.207734, 0, 1, 0.9058824, 1,
0.005972702, 0.170934, 0.5867516, 0, 1, 0.9098039, 1,
0.007332768, -1.8375, 2.563892, 0, 1, 0.9176471, 1,
0.008344368, 0.2443255, -0.8754554, 0, 1, 0.9215686, 1,
0.009076538, 1.908401, -1.142834, 0, 1, 0.9294118, 1,
0.01079642, -0.5055748, 2.197327, 0, 1, 0.9333333, 1,
0.01306241, -1.551437, 3.112564, 0, 1, 0.9411765, 1,
0.01347816, -0.6749163, 3.976843, 0, 1, 0.945098, 1,
0.01742564, -0.5542622, 3.122423, 0, 1, 0.9529412, 1,
0.01931285, 0.8284477, 1.23128, 0, 1, 0.9568627, 1,
0.0260376, 0.311841, 0.5262666, 0, 1, 0.9647059, 1,
0.02814876, 0.1468575, -0.09098181, 0, 1, 0.9686275, 1,
0.02851636, -0.5840801, 1.73924, 0, 1, 0.9764706, 1,
0.02977573, -0.2862873, 2.792741, 0, 1, 0.9803922, 1,
0.03040883, 0.0940304, -0.2119558, 0, 1, 0.9882353, 1,
0.03047448, -0.6021741, 2.165388, 0, 1, 0.9921569, 1,
0.03064962, 0.07235038, 0.3230581, 0, 1, 1, 1,
0.03493741, -0.813705, 3.300555, 0, 0.9921569, 1, 1,
0.04021103, -0.7444759, 1.493752, 0, 0.9882353, 1, 1,
0.04513208, -0.057848, 2.595711, 0, 0.9803922, 1, 1,
0.05080868, -0.6219014, 2.052331, 0, 0.9764706, 1, 1,
0.05179515, 0.4353958, -1.349409, 0, 0.9686275, 1, 1,
0.05362372, 0.9418176, 1.249232, 0, 0.9647059, 1, 1,
0.05519261, -1.105568, 2.01434, 0, 0.9568627, 1, 1,
0.05827583, 0.7021371, 2.036916, 0, 0.9529412, 1, 1,
0.05944957, -0.7052296, 1.529979, 0, 0.945098, 1, 1,
0.06161275, -0.02701147, 2.904138, 0, 0.9411765, 1, 1,
0.06323395, 0.315291, 0.5397331, 0, 0.9333333, 1, 1,
0.06336825, -1.278596, 1.900496, 0, 0.9294118, 1, 1,
0.06496141, 1.602311, -2.010185, 0, 0.9215686, 1, 1,
0.0705936, 0.1938208, -1.760292, 0, 0.9176471, 1, 1,
0.0742345, 0.1341567, 1.72943, 0, 0.9098039, 1, 1,
0.0759441, 1.103953, -0.2590629, 0, 0.9058824, 1, 1,
0.08105773, -1.583075, 3.558093, 0, 0.8980392, 1, 1,
0.0846221, 1.870222, -0.1545064, 0, 0.8901961, 1, 1,
0.08795786, 2.0171, 0.9384906, 0, 0.8862745, 1, 1,
0.09142304, 1.018246, 1.164733, 0, 0.8784314, 1, 1,
0.09454557, 0.2828426, -1.007098, 0, 0.8745098, 1, 1,
0.09741893, -0.6748544, 3.41164, 0, 0.8666667, 1, 1,
0.09831968, -0.8937062, 3.295258, 0, 0.8627451, 1, 1,
0.1009173, 0.6389288, -0.6644256, 0, 0.854902, 1, 1,
0.1078545, 1.616716, -0.002061041, 0, 0.8509804, 1, 1,
0.1128797, -0.5402896, 1.982228, 0, 0.8431373, 1, 1,
0.1132562, 1.207781, -0.4955284, 0, 0.8392157, 1, 1,
0.1169747, 0.6850706, 0.6819741, 0, 0.8313726, 1, 1,
0.1172568, 1.328507, 1.764488, 0, 0.827451, 1, 1,
0.1197358, 0.1611761, 0.1624099, 0, 0.8196079, 1, 1,
0.1274085, -1.28136, 4.563185, 0, 0.8156863, 1, 1,
0.1286101, -2.227915, 3.601078, 0, 0.8078431, 1, 1,
0.1356871, -0.4985345, 4.062644, 0, 0.8039216, 1, 1,
0.1381321, 0.5455034, 1.185871, 0, 0.7960784, 1, 1,
0.1411203, 0.05293595, 1.291755, 0, 0.7882353, 1, 1,
0.1455889, -0.0600157, 2.241406, 0, 0.7843137, 1, 1,
0.146954, -1.297357, 4.077392, 0, 0.7764706, 1, 1,
0.1508148, 1.051275, 0.3969389, 0, 0.772549, 1, 1,
0.1586924, -0.3559083, 2.57511, 0, 0.7647059, 1, 1,
0.1624652, 2.114199, 0.6632705, 0, 0.7607843, 1, 1,
0.169585, 0.4491685, -0.2352032, 0, 0.7529412, 1, 1,
0.1717674, 1.473185, 0.3363191, 0, 0.7490196, 1, 1,
0.1749817, -0.01638994, 2.041734, 0, 0.7411765, 1, 1,
0.1802893, 1.447827, 1.80447, 0, 0.7372549, 1, 1,
0.1868754, 1.34251, -0.4296304, 0, 0.7294118, 1, 1,
0.1881573, -0.283711, 1.119236, 0, 0.7254902, 1, 1,
0.1899117, -0.2067657, 3.285426, 0, 0.7176471, 1, 1,
0.1914799, -1.035572, 2.66902, 0, 0.7137255, 1, 1,
0.1967117, -0.6975901, 3.899801, 0, 0.7058824, 1, 1,
0.1980693, -0.5378389, 3.170395, 0, 0.6980392, 1, 1,
0.1982078, 0.1208173, -0.3214045, 0, 0.6941177, 1, 1,
0.2027626, 0.3073981, -0.8421692, 0, 0.6862745, 1, 1,
0.2055703, -0.2261344, 2.589951, 0, 0.682353, 1, 1,
0.2093961, -0.5448999, 4.892474, 0, 0.6745098, 1, 1,
0.2128801, -0.7542006, 3.865543, 0, 0.6705883, 1, 1,
0.2129988, 0.1556536, 1.69497, 0, 0.6627451, 1, 1,
0.216168, 0.2534844, 1.683874, 0, 0.6588235, 1, 1,
0.222574, -0.9038676, 4.289397, 0, 0.6509804, 1, 1,
0.2239147, 0.2813538, 0.6305994, 0, 0.6470588, 1, 1,
0.2250564, -0.6282427, 3.429969, 0, 0.6392157, 1, 1,
0.2263372, 0.3566095, 1.589466, 0, 0.6352941, 1, 1,
0.2266575, -0.09644075, 1.650694, 0, 0.627451, 1, 1,
0.2275018, -1.548404, 3.156087, 0, 0.6235294, 1, 1,
0.2293897, -2.251245, 2.334568, 0, 0.6156863, 1, 1,
0.2326811, -0.4839783, 2.12858, 0, 0.6117647, 1, 1,
0.2346511, 0.2491031, 0.8522086, 0, 0.6039216, 1, 1,
0.2348314, 1.06377, 2.693778, 0, 0.5960785, 1, 1,
0.2390954, -0.3718122, 4.133469, 0, 0.5921569, 1, 1,
0.2440233, -1.480061, 2.223394, 0, 0.5843138, 1, 1,
0.2449876, 0.1730617, 1.383361, 0, 0.5803922, 1, 1,
0.2459951, -1.034585, 2.474216, 0, 0.572549, 1, 1,
0.2475402, -0.4321154, 2.351037, 0, 0.5686275, 1, 1,
0.2509746, -0.8977228, 2.431104, 0, 0.5607843, 1, 1,
0.2513924, -0.7343754, 2.127468, 0, 0.5568628, 1, 1,
0.2520569, -0.09320653, 2.360858, 0, 0.5490196, 1, 1,
0.2551277, 0.5280592, 0.9653307, 0, 0.5450981, 1, 1,
0.2559428, 0.72351, -0.001759341, 0, 0.5372549, 1, 1,
0.2612545, 1.014056, 0.6420439, 0, 0.5333334, 1, 1,
0.2659849, -0.3254922, 3.904797, 0, 0.5254902, 1, 1,
0.2691402, 0.2659231, 1.215845, 0, 0.5215687, 1, 1,
0.2697907, 1.351213, 0.331975, 0, 0.5137255, 1, 1,
0.2711088, 1.915503, 0.6220557, 0, 0.509804, 1, 1,
0.277478, -0.1389905, 2.39992, 0, 0.5019608, 1, 1,
0.2778066, 1.066252, 0.4101317, 0, 0.4941176, 1, 1,
0.2779512, -0.4420681, 3.072449, 0, 0.4901961, 1, 1,
0.2913175, -0.0469096, 1.940394, 0, 0.4823529, 1, 1,
0.2913902, -1.120274, 3.440309, 0, 0.4784314, 1, 1,
0.2936475, -0.08204357, 2.430887, 0, 0.4705882, 1, 1,
0.2949454, -0.6296573, 2.972449, 0, 0.4666667, 1, 1,
0.3002086, 1.4419, 1.054754, 0, 0.4588235, 1, 1,
0.3024728, -0.3938232, 1.711911, 0, 0.454902, 1, 1,
0.3038178, 1.629783, 0.02759019, 0, 0.4470588, 1, 1,
0.3062224, -0.8028826, 3.454327, 0, 0.4431373, 1, 1,
0.3077116, -0.7105922, 0.9335334, 0, 0.4352941, 1, 1,
0.3127672, 1.316771, -0.03323048, 0, 0.4313726, 1, 1,
0.3131856, -0.4849103, 0.8185786, 0, 0.4235294, 1, 1,
0.3132428, -1.266772, 2.591428, 0, 0.4196078, 1, 1,
0.3140062, -0.6158122, 2.335224, 0, 0.4117647, 1, 1,
0.3173916, 0.314728, 1.828064, 0, 0.4078431, 1, 1,
0.3183654, -0.4084411, 2.045952, 0, 0.4, 1, 1,
0.3195828, 1.563658, -0.113166, 0, 0.3921569, 1, 1,
0.3218704, 0.684291, 1.012364, 0, 0.3882353, 1, 1,
0.3237224, -1.024771, 2.581899, 0, 0.3803922, 1, 1,
0.3239448, 0.1408931, 0.5637789, 0, 0.3764706, 1, 1,
0.3246602, -0.8843372, 2.872491, 0, 0.3686275, 1, 1,
0.325735, 0.6296604, -1.202568, 0, 0.3647059, 1, 1,
0.3289722, -0.4316161, 1.931153, 0, 0.3568628, 1, 1,
0.3334617, -0.4138082, 2.239134, 0, 0.3529412, 1, 1,
0.3372288, -0.9862279, 2.1222, 0, 0.345098, 1, 1,
0.339202, -0.9813291, 2.645547, 0, 0.3411765, 1, 1,
0.3425165, 0.4271747, -1.108984, 0, 0.3333333, 1, 1,
0.3445961, -0.03989509, 1.007912, 0, 0.3294118, 1, 1,
0.3461724, 0.3421221, 1.803563, 0, 0.3215686, 1, 1,
0.3487024, 0.6520063, 0.05599653, 0, 0.3176471, 1, 1,
0.352336, 0.4293571, 0.2933294, 0, 0.3098039, 1, 1,
0.3523542, -1.169514, 2.923167, 0, 0.3058824, 1, 1,
0.3577342, -0.1770935, 2.766683, 0, 0.2980392, 1, 1,
0.3609595, 1.230214, -0.1194059, 0, 0.2901961, 1, 1,
0.3626937, -0.3987411, 2.214087, 0, 0.2862745, 1, 1,
0.3641906, -1.897285, 3.386869, 0, 0.2784314, 1, 1,
0.3684787, -0.8833345, 2.443352, 0, 0.2745098, 1, 1,
0.372719, 0.5658127, 1.182558, 0, 0.2666667, 1, 1,
0.3742477, 0.9814408, 0.5174385, 0, 0.2627451, 1, 1,
0.3743569, -0.968559, 2.38535, 0, 0.254902, 1, 1,
0.3760542, 1.157389, -0.9556465, 0, 0.2509804, 1, 1,
0.3777303, -1.835285, 2.447432, 0, 0.2431373, 1, 1,
0.385704, -1.189269, 1.901154, 0, 0.2392157, 1, 1,
0.3922292, 0.1680181, 1.954211, 0, 0.2313726, 1, 1,
0.3988392, -0.5374015, 2.740546, 0, 0.227451, 1, 1,
0.4002226, -0.5303507, 2.479509, 0, 0.2196078, 1, 1,
0.4015206, 0.4400088, -0.3978452, 0, 0.2156863, 1, 1,
0.401824, 1.565017, 1.174578, 0, 0.2078431, 1, 1,
0.402217, 0.818077, -0.01949457, 0, 0.2039216, 1, 1,
0.4027519, -0.8302361, 1.749475, 0, 0.1960784, 1, 1,
0.4043049, 0.05855764, -0.756789, 0, 0.1882353, 1, 1,
0.40981, 0.7505366, 1.459472, 0, 0.1843137, 1, 1,
0.4099807, 0.415048, -1.470097, 0, 0.1764706, 1, 1,
0.4157348, 0.08250653, 0.6441461, 0, 0.172549, 1, 1,
0.4195484, 0.1198198, 1.773866, 0, 0.1647059, 1, 1,
0.4206043, 0.3574001, -0.2713236, 0, 0.1607843, 1, 1,
0.4272831, 0.1082437, 3.058496, 0, 0.1529412, 1, 1,
0.4327377, -0.5592278, 3.616945, 0, 0.1490196, 1, 1,
0.4345462, 0.1780182, 1.837663, 0, 0.1411765, 1, 1,
0.4351092, -2.810981, 1.943574, 0, 0.1372549, 1, 1,
0.4353048, 2.137085, 0.5348045, 0, 0.1294118, 1, 1,
0.4358612, -0.2872484, 2.904616, 0, 0.1254902, 1, 1,
0.4372348, 1.90714, 0.4992712, 0, 0.1176471, 1, 1,
0.4402195, 0.6830888, 0.1720738, 0, 0.1137255, 1, 1,
0.4404494, 0.2558754, -0.2332997, 0, 0.1058824, 1, 1,
0.4409979, -0.01315043, 2.134178, 0, 0.09803922, 1, 1,
0.4519046, 0.8461909, 0.5204282, 0, 0.09411765, 1, 1,
0.4536661, 1.31689, 0.2148047, 0, 0.08627451, 1, 1,
0.4537665, 1.603837, -0.4356855, 0, 0.08235294, 1, 1,
0.4567129, 0.6057609, -1.530167, 0, 0.07450981, 1, 1,
0.4568094, -1.134205, 2.22034, 0, 0.07058824, 1, 1,
0.4580485, -0.06333717, -0.3551985, 0, 0.0627451, 1, 1,
0.4582344, -0.3015908, 2.748767, 0, 0.05882353, 1, 1,
0.4639686, 1.057999, 1.359566, 0, 0.05098039, 1, 1,
0.4639904, 1.437133, -1.142997, 0, 0.04705882, 1, 1,
0.4642368, 0.3659498, 1.690052, 0, 0.03921569, 1, 1,
0.4671116, -0.2946329, 1.749011, 0, 0.03529412, 1, 1,
0.467133, 0.1875886, 2.240565, 0, 0.02745098, 1, 1,
0.4695325, 0.5017685, -0.4742071, 0, 0.02352941, 1, 1,
0.4697233, 0.06029638, 1.626327, 0, 0.01568628, 1, 1,
0.4753928, 0.1085249, 2.911639, 0, 0.01176471, 1, 1,
0.4780691, -0.09389678, 3.327403, 0, 0.003921569, 1, 1,
0.4837217, -0.2902112, 2.156399, 0.003921569, 0, 1, 1,
0.4864631, 0.07657879, 2.485955, 0.007843138, 0, 1, 1,
0.487312, 1.475495, 1.138593, 0.01568628, 0, 1, 1,
0.4912154, -0.7802237, 3.716281, 0.01960784, 0, 1, 1,
0.4915313, 0.5934127, 1.222374, 0.02745098, 0, 1, 1,
0.492748, 0.410028, -0.6490796, 0.03137255, 0, 1, 1,
0.4940954, -0.1320201, 0.90714, 0.03921569, 0, 1, 1,
0.4960593, 0.2194745, 1.220341, 0.04313726, 0, 1, 1,
0.4990306, 0.8050329, 2.073173, 0.05098039, 0, 1, 1,
0.5052146, -0.4112274, 1.674127, 0.05490196, 0, 1, 1,
0.5088989, 0.3318957, 1.008099, 0.0627451, 0, 1, 1,
0.5113616, -0.07011911, 2.208008, 0.06666667, 0, 1, 1,
0.5144195, -0.4088022, 3.352408, 0.07450981, 0, 1, 1,
0.5146815, -0.3855733, 3.263982, 0.07843138, 0, 1, 1,
0.5197799, 0.9827169, -0.6194332, 0.08627451, 0, 1, 1,
0.5218653, -0.2054745, 0.2340311, 0.09019608, 0, 1, 1,
0.5236878, -0.9031039, 3.128467, 0.09803922, 0, 1, 1,
0.5248677, -0.05988426, 3.737343, 0.1058824, 0, 1, 1,
0.5249032, 2.840261, -1.026138, 0.1098039, 0, 1, 1,
0.5255851, -1.094225, 1.540324, 0.1176471, 0, 1, 1,
0.5266335, 0.3535364, 0.6738816, 0.1215686, 0, 1, 1,
0.5541897, -0.7128175, 2.962478, 0.1294118, 0, 1, 1,
0.5567296, 0.7189311, 1.616755, 0.1333333, 0, 1, 1,
0.5591414, -1.017866, 3.709343, 0.1411765, 0, 1, 1,
0.5643589, -2.806882, 3.759202, 0.145098, 0, 1, 1,
0.5686563, 0.3539387, 0.7205261, 0.1529412, 0, 1, 1,
0.5748293, 1.019964, 0.6937776, 0.1568628, 0, 1, 1,
0.5776711, -0.9550382, 2.562391, 0.1647059, 0, 1, 1,
0.5792829, -0.7903169, 2.858492, 0.1686275, 0, 1, 1,
0.579574, -0.4352968, 2.271199, 0.1764706, 0, 1, 1,
0.5801663, 0.3853949, 0.9895861, 0.1803922, 0, 1, 1,
0.5835671, -1.274576, 1.534354, 0.1882353, 0, 1, 1,
0.5867872, 0.7833636, -0.1055752, 0.1921569, 0, 1, 1,
0.5870404, -0.04094585, 2.546783, 0.2, 0, 1, 1,
0.5893248, 1.540989, -1.341739, 0.2078431, 0, 1, 1,
0.5911804, -0.7454213, 3.280124, 0.2117647, 0, 1, 1,
0.5921018, 1.435862, 0.3783495, 0.2196078, 0, 1, 1,
0.6015348, 0.009688397, 1.968327, 0.2235294, 0, 1, 1,
0.6022142, -0.8445557, 2.438618, 0.2313726, 0, 1, 1,
0.6040331, -0.477196, 1.053722, 0.2352941, 0, 1, 1,
0.6203343, -0.4913891, 3.522146, 0.2431373, 0, 1, 1,
0.6211466, 0.8405495, 0.4263509, 0.2470588, 0, 1, 1,
0.6228504, -0.3981627, 3.666866, 0.254902, 0, 1, 1,
0.6242711, 0.2354667, 0.04064235, 0.2588235, 0, 1, 1,
0.6254393, 1.03029, 0.001771727, 0.2666667, 0, 1, 1,
0.625936, 0.5768747, 1.472322, 0.2705882, 0, 1, 1,
0.62611, 0.4665, 0.6566679, 0.2784314, 0, 1, 1,
0.6270576, 0.5052372, 2.143193, 0.282353, 0, 1, 1,
0.6372313, 0.3378108, 1.179336, 0.2901961, 0, 1, 1,
0.6389757, 0.5355576, -0.968338, 0.2941177, 0, 1, 1,
0.649506, 0.01373411, 1.156896, 0.3019608, 0, 1, 1,
0.6553189, -1.75856, 3.220927, 0.3098039, 0, 1, 1,
0.6589949, 1.243338, 1.044021, 0.3137255, 0, 1, 1,
0.6596228, -0.01352265, 1.826781, 0.3215686, 0, 1, 1,
0.6683467, 0.4004563, 1.187022, 0.3254902, 0, 1, 1,
0.6691561, -0.4102863, -0.6911855, 0.3333333, 0, 1, 1,
0.6709575, 1.296398, -1.884562, 0.3372549, 0, 1, 1,
0.6724369, 0.2931267, 0.8747323, 0.345098, 0, 1, 1,
0.6749499, 1.313264, 1.976297, 0.3490196, 0, 1, 1,
0.6785318, 1.890375, 0.6576068, 0.3568628, 0, 1, 1,
0.6787804, 1.898133, 1.283644, 0.3607843, 0, 1, 1,
0.6798413, 0.05656891, 0.7930775, 0.3686275, 0, 1, 1,
0.6841807, 1.432106, 0.7230734, 0.372549, 0, 1, 1,
0.6849744, -0.2087017, 1.386894, 0.3803922, 0, 1, 1,
0.6911019, -0.3592207, 2.911284, 0.3843137, 0, 1, 1,
0.69374, 0.893144, -0.3274885, 0.3921569, 0, 1, 1,
0.6983991, -0.9530609, 4.209195, 0.3960784, 0, 1, 1,
0.6999297, 1.431834, 0.6267369, 0.4039216, 0, 1, 1,
0.7040167, -0.4012082, 2.019029, 0.4117647, 0, 1, 1,
0.7104838, -0.194194, 3.49243, 0.4156863, 0, 1, 1,
0.7114779, -1.065511, 2.850618, 0.4235294, 0, 1, 1,
0.7179199, -0.4701097, 1.602892, 0.427451, 0, 1, 1,
0.7195634, 0.6209091, 2.084219, 0.4352941, 0, 1, 1,
0.7196512, 0.05829455, 1.503849, 0.4392157, 0, 1, 1,
0.720337, 0.2496762, 1.764647, 0.4470588, 0, 1, 1,
0.7203666, 0.3669943, 1.502225, 0.4509804, 0, 1, 1,
0.7206181, 0.7809392, 0.2541342, 0.4588235, 0, 1, 1,
0.7290505, -0.3815683, 1.048401, 0.4627451, 0, 1, 1,
0.7359087, -1.89433, 2.433168, 0.4705882, 0, 1, 1,
0.7404954, 1.570379, -1.664158, 0.4745098, 0, 1, 1,
0.740781, -2.169666, 2.488096, 0.4823529, 0, 1, 1,
0.7438483, -1.632069, 1.905244, 0.4862745, 0, 1, 1,
0.7453173, 1.197648, 0.3993363, 0.4941176, 0, 1, 1,
0.7457156, -2.45325, 2.197192, 0.5019608, 0, 1, 1,
0.746534, -0.1177059, 1.593429, 0.5058824, 0, 1, 1,
0.7535148, 0.92691, 0.9409009, 0.5137255, 0, 1, 1,
0.7667007, 0.3087843, 1.04626, 0.5176471, 0, 1, 1,
0.7719161, 0.08607687, -0.4800515, 0.5254902, 0, 1, 1,
0.774583, -1.171155, 1.196809, 0.5294118, 0, 1, 1,
0.7755536, -1.131983, 3.374712, 0.5372549, 0, 1, 1,
0.77693, -0.267569, 0.3479596, 0.5411765, 0, 1, 1,
0.7771975, 0.09964205, 0.7397467, 0.5490196, 0, 1, 1,
0.7917209, 0.6683975, 0.6932256, 0.5529412, 0, 1, 1,
0.7919694, 0.7533007, -0.0469677, 0.5607843, 0, 1, 1,
0.7924672, 0.1814747, 1.682102, 0.5647059, 0, 1, 1,
0.793973, 0.3663471, 2.431309, 0.572549, 0, 1, 1,
0.7997581, -0.9087066, 3.154524, 0.5764706, 0, 1, 1,
0.8004444, 0.1330036, 0.3911585, 0.5843138, 0, 1, 1,
0.8066376, 1.125541, -0.007943515, 0.5882353, 0, 1, 1,
0.807159, 1.135029, 0.5729975, 0.5960785, 0, 1, 1,
0.807421, -0.961648, 2.148464, 0.6039216, 0, 1, 1,
0.8110809, -0.5702064, 2.006097, 0.6078432, 0, 1, 1,
0.8194457, -0.1139813, 0.9196821, 0.6156863, 0, 1, 1,
0.8208044, -0.2290919, 0.5896876, 0.6196079, 0, 1, 1,
0.82231, -0.3943734, 1.64867, 0.627451, 0, 1, 1,
0.8233408, 0.9017727, 0.7843405, 0.6313726, 0, 1, 1,
0.823495, -0.9652492, 2.147649, 0.6392157, 0, 1, 1,
0.8284554, 0.03054664, 1.530102, 0.6431373, 0, 1, 1,
0.8299266, 0.7715792, 1.97422, 0.6509804, 0, 1, 1,
0.8324056, 0.2168588, 2.140778, 0.654902, 0, 1, 1,
0.8329625, -1.124721, 3.888746, 0.6627451, 0, 1, 1,
0.8335685, -1.397522, 1.845594, 0.6666667, 0, 1, 1,
0.8359639, -0.2529011, 1.933319, 0.6745098, 0, 1, 1,
0.8367616, -0.3174079, 4.099803, 0.6784314, 0, 1, 1,
0.8371398, -1.144091, 3.286683, 0.6862745, 0, 1, 1,
0.8377886, -1.912734, 1.55509, 0.6901961, 0, 1, 1,
0.8401788, 0.7865361, -0.326396, 0.6980392, 0, 1, 1,
0.8432121, -1.598058, 1.332802, 0.7058824, 0, 1, 1,
0.8458534, 0.3913397, 1.52827, 0.7098039, 0, 1, 1,
0.8481802, -1.141704, 2.430807, 0.7176471, 0, 1, 1,
0.8538816, -0.300438, 2.625608, 0.7215686, 0, 1, 1,
0.855055, 1.673533, 0.5136977, 0.7294118, 0, 1, 1,
0.8577088, 0.8628469, 2.687862, 0.7333333, 0, 1, 1,
0.8593062, 0.2940935, 1.375253, 0.7411765, 0, 1, 1,
0.8640739, -0.4440454, 1.195678, 0.7450981, 0, 1, 1,
0.8657324, -2.730661, 2.218542, 0.7529412, 0, 1, 1,
0.8670336, 0.3696105, 2.34734, 0.7568628, 0, 1, 1,
0.8713766, 0.412634, 0.3859162, 0.7647059, 0, 1, 1,
0.8737652, -1.459088, 2.398019, 0.7686275, 0, 1, 1,
0.8766435, 0.3895686, 0.3362598, 0.7764706, 0, 1, 1,
0.8803641, 0.412011, 2.581587, 0.7803922, 0, 1, 1,
0.8817097, -0.1181873, 2.095934, 0.7882353, 0, 1, 1,
0.8817353, 1.609121, 1.01815, 0.7921569, 0, 1, 1,
0.8852912, 1.424397, 0.2958821, 0.8, 0, 1, 1,
0.8874988, -0.5046511, 1.974898, 0.8078431, 0, 1, 1,
0.891152, 0.5957406, 0.866371, 0.8117647, 0, 1, 1,
0.8996904, 0.1822868, 0.3620072, 0.8196079, 0, 1, 1,
0.906279, -1.709854, 3.183936, 0.8235294, 0, 1, 1,
0.9088159, -1.554174, 2.856614, 0.8313726, 0, 1, 1,
0.90992, -0.7052448, 1.34405, 0.8352941, 0, 1, 1,
0.910652, 0.7576476, 0.8897732, 0.8431373, 0, 1, 1,
0.912734, -0.00442182, 1.728985, 0.8470588, 0, 1, 1,
0.9165474, -0.2551156, 1.037702, 0.854902, 0, 1, 1,
0.9174852, -0.2722517, -0.3255102, 0.8588235, 0, 1, 1,
0.9179894, -1.847361, 1.221234, 0.8666667, 0, 1, 1,
0.922765, -0.06824967, 1.320788, 0.8705882, 0, 1, 1,
0.9237427, 1.229189, 0.9560886, 0.8784314, 0, 1, 1,
0.9262227, 0.3398719, 1.31407, 0.8823529, 0, 1, 1,
0.9324853, -0.8548605, 3.06882, 0.8901961, 0, 1, 1,
0.9331166, 2.015522, 1.914205, 0.8941177, 0, 1, 1,
0.9433566, 0.2372179, 0.7871867, 0.9019608, 0, 1, 1,
0.943639, 1.398957, 1.048919, 0.9098039, 0, 1, 1,
0.9460197, 0.9775415, -0.6065149, 0.9137255, 0, 1, 1,
0.946672, 2.34047, -1.196898, 0.9215686, 0, 1, 1,
0.9503763, 0.3589822, 1.198752, 0.9254902, 0, 1, 1,
0.9511818, -1.286282, 4.249275, 0.9333333, 0, 1, 1,
0.9537733, -0.8102965, 0.9472045, 0.9372549, 0, 1, 1,
0.9654069, -0.2161352, 1.972485, 0.945098, 0, 1, 1,
0.9714789, -0.3620428, 3.152882, 0.9490196, 0, 1, 1,
0.9715253, -0.1784362, 1.969359, 0.9568627, 0, 1, 1,
0.9854161, -0.2879273, 1.689033, 0.9607843, 0, 1, 1,
0.9884852, -0.2146551, 0.9315905, 0.9686275, 0, 1, 1,
0.9903206, 1.308964, 1.002182, 0.972549, 0, 1, 1,
0.9947518, -1.786892, 2.568631, 0.9803922, 0, 1, 1,
0.9959736, 0.8715131, 1.740502, 0.9843137, 0, 1, 1,
1.000206, 0.1011189, 1.495245, 0.9921569, 0, 1, 1,
1.007294, -1.558747, 4.357437, 0.9960784, 0, 1, 1,
1.009237, 1.589928, 0.8779186, 1, 0, 0.9960784, 1,
1.012433, -0.4293025, 2.600518, 1, 0, 0.9882353, 1,
1.015567, -0.3522729, 1.980407, 1, 0, 0.9843137, 1,
1.02601, -1.018714, 3.845966, 1, 0, 0.9764706, 1,
1.031079, 0.583576, 1.320269, 1, 0, 0.972549, 1,
1.050795, -0.8005701, 2.480597, 1, 0, 0.9647059, 1,
1.052023, 1.380731, 0.3561778, 1, 0, 0.9607843, 1,
1.058855, 1.359561, 0.6578512, 1, 0, 0.9529412, 1,
1.071725, 0.2144027, 2.723614, 1, 0, 0.9490196, 1,
1.072157, -0.6204616, 2.387298, 1, 0, 0.9411765, 1,
1.072909, 0.3724521, -0.1232857, 1, 0, 0.9372549, 1,
1.088562, -0.7883481, 2.574983, 1, 0, 0.9294118, 1,
1.089647, 0.1267484, 1.487969, 1, 0, 0.9254902, 1,
1.091054, -0.7181497, 2.72486, 1, 0, 0.9176471, 1,
1.09598, -0.01023844, 2.906592, 1, 0, 0.9137255, 1,
1.100474, 0.02744986, 1.814751, 1, 0, 0.9058824, 1,
1.108042, 1.151273, 1.360273, 1, 0, 0.9019608, 1,
1.108074, -0.3002789, 0.1501901, 1, 0, 0.8941177, 1,
1.110811, 0.2874051, 2.290232, 1, 0, 0.8862745, 1,
1.111096, -2.089573, 3.374165, 1, 0, 0.8823529, 1,
1.114816, -0.8621036, 2.414535, 1, 0, 0.8745098, 1,
1.115374, -0.3657866, 2.194728, 1, 0, 0.8705882, 1,
1.124171, -1.009599, 2.178084, 1, 0, 0.8627451, 1,
1.133792, -0.3941827, 0.0636731, 1, 0, 0.8588235, 1,
1.151096, 0.3797139, 0.5731114, 1, 0, 0.8509804, 1,
1.156109, 1.070134, 1.097481, 1, 0, 0.8470588, 1,
1.156245, -0.143251, 3.388703, 1, 0, 0.8392157, 1,
1.161218, 1.539492, -0.6888822, 1, 0, 0.8352941, 1,
1.161748, 0.1124523, 1.786616, 1, 0, 0.827451, 1,
1.169364, -0.1086848, 1.737461, 1, 0, 0.8235294, 1,
1.177631, -0.6101486, 2.927506, 1, 0, 0.8156863, 1,
1.185253, -1.956098, 0.8526954, 1, 0, 0.8117647, 1,
1.187248, -0.3000885, 1.569569, 1, 0, 0.8039216, 1,
1.199999, 0.4470536, 0.6408705, 1, 0, 0.7960784, 1,
1.203222, 0.002110281, 0.865256, 1, 0, 0.7921569, 1,
1.209876, 0.144874, 1.255339, 1, 0, 0.7843137, 1,
1.211677, 1.122341, 1.39913, 1, 0, 0.7803922, 1,
1.216618, -1.467064, 2.868915, 1, 0, 0.772549, 1,
1.225471, 0.6456738, 2.686141, 1, 0, 0.7686275, 1,
1.228606, 1.533411, 0.796645, 1, 0, 0.7607843, 1,
1.22955, -0.6538425, 4.455367, 1, 0, 0.7568628, 1,
1.231343, 1.644186, 2.110384, 1, 0, 0.7490196, 1,
1.242682, -0.5433448, 0.8930227, 1, 0, 0.7450981, 1,
1.242755, 0.1812143, 1.277781, 1, 0, 0.7372549, 1,
1.243569, 0.3483931, 1.708505, 1, 0, 0.7333333, 1,
1.250934, -0.02904874, 0.9114532, 1, 0, 0.7254902, 1,
1.260527, 0.333169, 1.085675, 1, 0, 0.7215686, 1,
1.262315, 0.5914267, 1.300764, 1, 0, 0.7137255, 1,
1.266127, 1.364081, 1.073182, 1, 0, 0.7098039, 1,
1.269248, 2.48154, -0.05084018, 1, 0, 0.7019608, 1,
1.270423, 0.5877826, 2.805747, 1, 0, 0.6941177, 1,
1.271907, -0.7582888, -0.5315434, 1, 0, 0.6901961, 1,
1.275483, -0.3816298, 0.855756, 1, 0, 0.682353, 1,
1.288933, -0.4922245, 2.880375, 1, 0, 0.6784314, 1,
1.289453, 0.5550988, -0.2254975, 1, 0, 0.6705883, 1,
1.30605, 0.7513572, 1.77264, 1, 0, 0.6666667, 1,
1.31135, -0.7178626, 1.370852, 1, 0, 0.6588235, 1,
1.31584, 0.7286882, 1.04984, 1, 0, 0.654902, 1,
1.3161, 0.4373919, 1.386923, 1, 0, 0.6470588, 1,
1.319075, 1.833857, 1.376005, 1, 0, 0.6431373, 1,
1.319167, 0.05545648, 2.387789, 1, 0, 0.6352941, 1,
1.319614, -0.7099177, 2.802996, 1, 0, 0.6313726, 1,
1.346441, 1.177118, 1.892669, 1, 0, 0.6235294, 1,
1.347597, 0.1944739, 0.1942235, 1, 0, 0.6196079, 1,
1.354876, 0.9744441, 1.275277, 1, 0, 0.6117647, 1,
1.3598, -1.908954, 2.667019, 1, 0, 0.6078432, 1,
1.360897, -0.1990505, 2.010138, 1, 0, 0.6, 1,
1.362386, -0.7262636, 1.994417, 1, 0, 0.5921569, 1,
1.36521, 1.520413, 0.2352257, 1, 0, 0.5882353, 1,
1.372685, -0.9517334, 1.748101, 1, 0, 0.5803922, 1,
1.379544, 0.1092005, -1.165382, 1, 0, 0.5764706, 1,
1.387054, 1.080507, -1.140546, 1, 0, 0.5686275, 1,
1.388437, 0.1107776, 0.63285, 1, 0, 0.5647059, 1,
1.409962, 0.157328, 1.246277, 1, 0, 0.5568628, 1,
1.411647, -1.661519, 1.879004, 1, 0, 0.5529412, 1,
1.41627, 1.48209, 1.367301, 1, 0, 0.5450981, 1,
1.431409, 0.1717941, 1.523803, 1, 0, 0.5411765, 1,
1.433706, -0.5556694, 1.081227, 1, 0, 0.5333334, 1,
1.436547, 1.24278, 0.1152636, 1, 0, 0.5294118, 1,
1.440602, 1.128999, 1.762338, 1, 0, 0.5215687, 1,
1.447637, -0.2947313, 2.36385, 1, 0, 0.5176471, 1,
1.455318, 0.8959377, 1.029948, 1, 0, 0.509804, 1,
1.457541, -0.909034, 2.628652, 1, 0, 0.5058824, 1,
1.466379, 0.2009996, 1.825501, 1, 0, 0.4980392, 1,
1.482192, 1.269688, 1.727814, 1, 0, 0.4901961, 1,
1.490112, -0.1420606, 1.46594, 1, 0, 0.4862745, 1,
1.490175, 1.678532, -2.540221, 1, 0, 0.4784314, 1,
1.501833, 0.0007416042, 3.769534, 1, 0, 0.4745098, 1,
1.519949, -0.3659638, 0.8734626, 1, 0, 0.4666667, 1,
1.520361, 1.118525, 0.826964, 1, 0, 0.4627451, 1,
1.5238, 2.300713, 0.3073434, 1, 0, 0.454902, 1,
1.52502, -1.200007, 2.889627, 1, 0, 0.4509804, 1,
1.527725, -0.9834737, 1.986638, 1, 0, 0.4431373, 1,
1.535075, -0.9508381, 2.603128, 1, 0, 0.4392157, 1,
1.538882, -0.3231035, 1.449318, 1, 0, 0.4313726, 1,
1.544492, -1.209736, 2.033249, 1, 0, 0.427451, 1,
1.56326, 0.1798245, 2.938958, 1, 0, 0.4196078, 1,
1.576357, -0.3143272, 2.690661, 1, 0, 0.4156863, 1,
1.577915, 0.5392032, 0.3920808, 1, 0, 0.4078431, 1,
1.581294, -0.9865028, 0.6630865, 1, 0, 0.4039216, 1,
1.582497, 0.2892362, 2.938478, 1, 0, 0.3960784, 1,
1.583794, 0.5688349, 0.7106838, 1, 0, 0.3882353, 1,
1.595543, -0.5573986, 0.7879358, 1, 0, 0.3843137, 1,
1.60851, 0.8972055, -0.4644481, 1, 0, 0.3764706, 1,
1.611267, -1.203684, 1.560099, 1, 0, 0.372549, 1,
1.612784, -0.2218053, -0.07153364, 1, 0, 0.3647059, 1,
1.615754, -0.5263044, 2.570334, 1, 0, 0.3607843, 1,
1.626428, 0.7262505, 1.710741, 1, 0, 0.3529412, 1,
1.627308, -1.511749, 0.9296538, 1, 0, 0.3490196, 1,
1.630992, 0.9365799, 2.278341, 1, 0, 0.3411765, 1,
1.636382, 0.4741719, 1.610768, 1, 0, 0.3372549, 1,
1.656871, 1.353654, 1.155813, 1, 0, 0.3294118, 1,
1.665023, 0.1864119, 1.771359, 1, 0, 0.3254902, 1,
1.690555, 0.8844278, -0.2061104, 1, 0, 0.3176471, 1,
1.693324, -1.957934, 2.600734, 1, 0, 0.3137255, 1,
1.702734, 0.7253093, 0.7729443, 1, 0, 0.3058824, 1,
1.72043, -0.6471863, 1.496941, 1, 0, 0.2980392, 1,
1.723257, 0.02460271, 3.467682, 1, 0, 0.2941177, 1,
1.732629, -1.570429, 1.808791, 1, 0, 0.2862745, 1,
1.739902, -0.4140078, 2.238886, 1, 0, 0.282353, 1,
1.743114, -1.671636, 1.490755, 1, 0, 0.2745098, 1,
1.745657, 0.4739127, 1.287435, 1, 0, 0.2705882, 1,
1.765782, 0.2632328, -0.4540025, 1, 0, 0.2627451, 1,
1.773662, 0.4347395, 1.926338, 1, 0, 0.2588235, 1,
1.776255, -0.07008147, 1.571641, 1, 0, 0.2509804, 1,
1.791317, -0.1563494, 0.5505345, 1, 0, 0.2470588, 1,
1.807043, 0.9470855, -0.03788578, 1, 0, 0.2392157, 1,
1.812342, -1.760889, 1.508574, 1, 0, 0.2352941, 1,
1.820643, -0.9347498, -0.1773181, 1, 0, 0.227451, 1,
1.84056, -0.01250235, 0.2362069, 1, 0, 0.2235294, 1,
1.850293, -1.526107, 1.651659, 1, 0, 0.2156863, 1,
1.854022, -2.021141, 2.692453, 1, 0, 0.2117647, 1,
1.858536, 0.9998636, -0.5656946, 1, 0, 0.2039216, 1,
1.870197, 0.1441913, 2.750227, 1, 0, 0.1960784, 1,
1.881856, 0.8138934, 1.83717, 1, 0, 0.1921569, 1,
1.8886, 0.0367936, 1.621251, 1, 0, 0.1843137, 1,
1.88983, 0.2530824, 1.132079, 1, 0, 0.1803922, 1,
1.895384, -1.804618, -0.3915767, 1, 0, 0.172549, 1,
1.896235, -0.1372259, 1.198277, 1, 0, 0.1686275, 1,
1.903805, -1.359049, 1.887181, 1, 0, 0.1607843, 1,
1.914376, 0.6365911, 2.878506, 1, 0, 0.1568628, 1,
1.920753, -0.1632037, 0.8020915, 1, 0, 0.1490196, 1,
1.948537, -0.247655, 0.1264635, 1, 0, 0.145098, 1,
1.950768, -0.3954643, 3.099506, 1, 0, 0.1372549, 1,
1.954832, 0.4422041, 2.100629, 1, 0, 0.1333333, 1,
1.968708, 1.6279, 1.202255, 1, 0, 0.1254902, 1,
1.974519, 2.343755, 0.02123205, 1, 0, 0.1215686, 1,
2.005404, 1.786575, 1.219295, 1, 0, 0.1137255, 1,
2.037846, 1.297656, 0.4452393, 1, 0, 0.1098039, 1,
2.043659, 0.4113718, 1.017557, 1, 0, 0.1019608, 1,
2.086038, -1.305694, 2.273826, 1, 0, 0.09411765, 1,
2.168517, 0.5520468, 1.288934, 1, 0, 0.09019608, 1,
2.198232, -0.4757499, 2.297906, 1, 0, 0.08235294, 1,
2.378657, -0.0683705, 3.066486, 1, 0, 0.07843138, 1,
2.420493, -0.3665316, 1.400671, 1, 0, 0.07058824, 1,
2.421001, 0.5849403, 1.466008, 1, 0, 0.06666667, 1,
2.452011, 0.4168734, 3.733174, 1, 0, 0.05882353, 1,
2.657345, 1.142014, 1.102584, 1, 0, 0.05490196, 1,
2.740764, -0.4583372, 2.137248, 1, 0, 0.04705882, 1,
2.742004, -0.6372544, 0.1064146, 1, 0, 0.04313726, 1,
2.751877, 1.609128, -0.1157367, 1, 0, 0.03529412, 1,
2.969965, -0.6736385, 3.634371, 1, 0, 0.03137255, 1,
2.980061, 0.7371945, 0.8149318, 1, 0, 0.02352941, 1,
3.035328, 1.056232, -0.01175775, 1, 0, 0.01960784, 1,
3.252838, 0.002477781, 2.078367, 1, 0, 0.01176471, 1,
3.470854, 0.09046268, 0.7371105, 1, 0, 0.007843138, 1
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
0.1754212, -3.946792, -7.542901, 0, -0.5, 0.5, 0.5,
0.1754212, -3.946792, -7.542901, 1, -0.5, 0.5, 0.5,
0.1754212, -3.946792, -7.542901, 1, 1.5, 0.5, 0.5,
0.1754212, -3.946792, -7.542901, 0, 1.5, 0.5, 0.5
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
-4.237163, -0.06142914, -7.542901, 0, -0.5, 0.5, 0.5,
-4.237163, -0.06142914, -7.542901, 1, -0.5, 0.5, 0.5,
-4.237163, -0.06142914, -7.542901, 1, 1.5, 0.5, 0.5,
-4.237163, -0.06142914, -7.542901, 0, 1.5, 0.5, 0.5
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
-4.237163, -3.946792, -0.4240611, 0, -0.5, 0.5, 0.5,
-4.237163, -3.946792, -0.4240611, 1, -0.5, 0.5, 0.5,
-4.237163, -3.946792, -0.4240611, 1, 1.5, 0.5, 0.5,
-4.237163, -3.946792, -0.4240611, 0, 1.5, 0.5, 0.5
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
-3, -3.050169, -5.900092,
3, -3.050169, -5.900092,
-3, -3.050169, -5.900092,
-3, -3.199606, -6.173893,
-2, -3.050169, -5.900092,
-2, -3.199606, -6.173893,
-1, -3.050169, -5.900092,
-1, -3.199606, -6.173893,
0, -3.050169, -5.900092,
0, -3.199606, -6.173893,
1, -3.050169, -5.900092,
1, -3.199606, -6.173893,
2, -3.050169, -5.900092,
2, -3.199606, -6.173893,
3, -3.050169, -5.900092,
3, -3.199606, -6.173893
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
-3, -3.498481, -6.721497, 0, -0.5, 0.5, 0.5,
-3, -3.498481, -6.721497, 1, -0.5, 0.5, 0.5,
-3, -3.498481, -6.721497, 1, 1.5, 0.5, 0.5,
-3, -3.498481, -6.721497, 0, 1.5, 0.5, 0.5,
-2, -3.498481, -6.721497, 0, -0.5, 0.5, 0.5,
-2, -3.498481, -6.721497, 1, -0.5, 0.5, 0.5,
-2, -3.498481, -6.721497, 1, 1.5, 0.5, 0.5,
-2, -3.498481, -6.721497, 0, 1.5, 0.5, 0.5,
-1, -3.498481, -6.721497, 0, -0.5, 0.5, 0.5,
-1, -3.498481, -6.721497, 1, -0.5, 0.5, 0.5,
-1, -3.498481, -6.721497, 1, 1.5, 0.5, 0.5,
-1, -3.498481, -6.721497, 0, 1.5, 0.5, 0.5,
0, -3.498481, -6.721497, 0, -0.5, 0.5, 0.5,
0, -3.498481, -6.721497, 1, -0.5, 0.5, 0.5,
0, -3.498481, -6.721497, 1, 1.5, 0.5, 0.5,
0, -3.498481, -6.721497, 0, 1.5, 0.5, 0.5,
1, -3.498481, -6.721497, 0, -0.5, 0.5, 0.5,
1, -3.498481, -6.721497, 1, -0.5, 0.5, 0.5,
1, -3.498481, -6.721497, 1, 1.5, 0.5, 0.5,
1, -3.498481, -6.721497, 0, 1.5, 0.5, 0.5,
2, -3.498481, -6.721497, 0, -0.5, 0.5, 0.5,
2, -3.498481, -6.721497, 1, -0.5, 0.5, 0.5,
2, -3.498481, -6.721497, 1, 1.5, 0.5, 0.5,
2, -3.498481, -6.721497, 0, 1.5, 0.5, 0.5,
3, -3.498481, -6.721497, 0, -0.5, 0.5, 0.5,
3, -3.498481, -6.721497, 1, -0.5, 0.5, 0.5,
3, -3.498481, -6.721497, 1, 1.5, 0.5, 0.5,
3, -3.498481, -6.721497, 0, 1.5, 0.5, 0.5
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
-3.218874, -2, -5.900092,
-3.218874, 2, -5.900092,
-3.218874, -2, -5.900092,
-3.388589, -2, -6.173893,
-3.218874, -1, -5.900092,
-3.388589, -1, -6.173893,
-3.218874, 0, -5.900092,
-3.388589, 0, -6.173893,
-3.218874, 1, -5.900092,
-3.388589, 1, -6.173893,
-3.218874, 2, -5.900092,
-3.388589, 2, -6.173893
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
-3.728019, -2, -6.721497, 0, -0.5, 0.5, 0.5,
-3.728019, -2, -6.721497, 1, -0.5, 0.5, 0.5,
-3.728019, -2, -6.721497, 1, 1.5, 0.5, 0.5,
-3.728019, -2, -6.721497, 0, 1.5, 0.5, 0.5,
-3.728019, -1, -6.721497, 0, -0.5, 0.5, 0.5,
-3.728019, -1, -6.721497, 1, -0.5, 0.5, 0.5,
-3.728019, -1, -6.721497, 1, 1.5, 0.5, 0.5,
-3.728019, -1, -6.721497, 0, 1.5, 0.5, 0.5,
-3.728019, 0, -6.721497, 0, -0.5, 0.5, 0.5,
-3.728019, 0, -6.721497, 1, -0.5, 0.5, 0.5,
-3.728019, 0, -6.721497, 1, 1.5, 0.5, 0.5,
-3.728019, 0, -6.721497, 0, 1.5, 0.5, 0.5,
-3.728019, 1, -6.721497, 0, -0.5, 0.5, 0.5,
-3.728019, 1, -6.721497, 1, -0.5, 0.5, 0.5,
-3.728019, 1, -6.721497, 1, 1.5, 0.5, 0.5,
-3.728019, 1, -6.721497, 0, 1.5, 0.5, 0.5,
-3.728019, 2, -6.721497, 0, -0.5, 0.5, 0.5,
-3.728019, 2, -6.721497, 1, -0.5, 0.5, 0.5,
-3.728019, 2, -6.721497, 1, 1.5, 0.5, 0.5,
-3.728019, 2, -6.721497, 0, 1.5, 0.5, 0.5
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
-3.218874, -3.050169, -4,
-3.218874, -3.050169, 4,
-3.218874, -3.050169, -4,
-3.388589, -3.199606, -4,
-3.218874, -3.050169, -2,
-3.388589, -3.199606, -2,
-3.218874, -3.050169, 0,
-3.388589, -3.199606, 0,
-3.218874, -3.050169, 2,
-3.388589, -3.199606, 2,
-3.218874, -3.050169, 4,
-3.388589, -3.199606, 4
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
-3.728019, -3.498481, -4, 0, -0.5, 0.5, 0.5,
-3.728019, -3.498481, -4, 1, -0.5, 0.5, 0.5,
-3.728019, -3.498481, -4, 1, 1.5, 0.5, 0.5,
-3.728019, -3.498481, -4, 0, 1.5, 0.5, 0.5,
-3.728019, -3.498481, -2, 0, -0.5, 0.5, 0.5,
-3.728019, -3.498481, -2, 1, -0.5, 0.5, 0.5,
-3.728019, -3.498481, -2, 1, 1.5, 0.5, 0.5,
-3.728019, -3.498481, -2, 0, 1.5, 0.5, 0.5,
-3.728019, -3.498481, 0, 0, -0.5, 0.5, 0.5,
-3.728019, -3.498481, 0, 1, -0.5, 0.5, 0.5,
-3.728019, -3.498481, 0, 1, 1.5, 0.5, 0.5,
-3.728019, -3.498481, 0, 0, 1.5, 0.5, 0.5,
-3.728019, -3.498481, 2, 0, -0.5, 0.5, 0.5,
-3.728019, -3.498481, 2, 1, -0.5, 0.5, 0.5,
-3.728019, -3.498481, 2, 1, 1.5, 0.5, 0.5,
-3.728019, -3.498481, 2, 0, 1.5, 0.5, 0.5,
-3.728019, -3.498481, 4, 0, -0.5, 0.5, 0.5,
-3.728019, -3.498481, 4, 1, -0.5, 0.5, 0.5,
-3.728019, -3.498481, 4, 1, 1.5, 0.5, 0.5,
-3.728019, -3.498481, 4, 0, 1.5, 0.5, 0.5
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
-3.218874, -3.050169, -5.900092,
-3.218874, 2.927311, -5.900092,
-3.218874, -3.050169, 5.05197,
-3.218874, 2.927311, 5.05197,
-3.218874, -3.050169, -5.900092,
-3.218874, -3.050169, 5.05197,
-3.218874, 2.927311, -5.900092,
-3.218874, 2.927311, 5.05197,
-3.218874, -3.050169, -5.900092,
3.569717, -3.050169, -5.900092,
-3.218874, -3.050169, 5.05197,
3.569717, -3.050169, 5.05197,
-3.218874, 2.927311, -5.900092,
3.569717, 2.927311, -5.900092,
-3.218874, 2.927311, 5.05197,
3.569717, 2.927311, 5.05197,
3.569717, -3.050169, -5.900092,
3.569717, 2.927311, -5.900092,
3.569717, -3.050169, 5.05197,
3.569717, 2.927311, 5.05197,
3.569717, -3.050169, -5.900092,
3.569717, -3.050169, 5.05197,
3.569717, 2.927311, -5.900092,
3.569717, 2.927311, 5.05197
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
var radius = 7.584835;
var distance = 33.74579;
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
mvMatrix.translate( -0.1754212, 0.06142914, 0.4240611 );
mvMatrix.scale( 1.208037, 1.371961, 0.7487971 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.74579);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
benzoximate<-read.table("benzoximate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-benzoximate$V2
```

```
## Error in eval(expr, envir, enclos): object 'benzoximate' not found
```

```r
y<-benzoximate$V3
```

```
## Error in eval(expr, envir, enclos): object 'benzoximate' not found
```

```r
z<-benzoximate$V4
```

```
## Error in eval(expr, envir, enclos): object 'benzoximate' not found
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
-3.120012, -0.09370607, -2.31357, 0, 0, 1, 1, 1,
-3.069639, -1.212461, -1.381495, 1, 0, 0, 1, 1,
-2.9482, 0.8660212, 0.02065189, 1, 0, 0, 1, 1,
-2.696129, 0.4313646, -1.235812, 1, 0, 0, 1, 1,
-2.574974, -0.2517523, -2.499396, 1, 0, 0, 1, 1,
-2.573821, -1.039622, -0.8766237, 1, 0, 0, 1, 1,
-2.548079, -1.22495, -2.362255, 0, 0, 0, 1, 1,
-2.48366, -0.3978613, 0.1598057, 0, 0, 0, 1, 1,
-2.435617, 0.7622975, -1.735082, 0, 0, 0, 1, 1,
-2.408559, -2.272485, -3.827542, 0, 0, 0, 1, 1,
-2.34123, 0.1899018, -1.924579, 0, 0, 0, 1, 1,
-2.324448, 0.4266518, -0.09041274, 0, 0, 0, 1, 1,
-2.288566, -0.4278201, -1.966711, 0, 0, 0, 1, 1,
-2.216659, 0.2091592, -1.13763, 1, 1, 1, 1, 1,
-2.126793, -0.1783685, -1.708726, 1, 1, 1, 1, 1,
-2.072525, 1.134489, -2.333793, 1, 1, 1, 1, 1,
-2.067048, 1.569399, -0.4607436, 1, 1, 1, 1, 1,
-2.049706, -0.3496099, -2.007872, 1, 1, 1, 1, 1,
-2.022786, 0.9274498, -1.649737, 1, 1, 1, 1, 1,
-2.019004, -1.615221, -3.854645, 1, 1, 1, 1, 1,
-1.990892, 1.362866, -2.138999, 1, 1, 1, 1, 1,
-1.986675, -0.0806433, -1.675325, 1, 1, 1, 1, 1,
-1.948531, 1.640514, -1.822735, 1, 1, 1, 1, 1,
-1.944888, 0.8380596, -1.105074, 1, 1, 1, 1, 1,
-1.939018, 1.204158, -0.9079753, 1, 1, 1, 1, 1,
-1.937304, -1.187469, -1.913427, 1, 1, 1, 1, 1,
-1.93498, 0.952562, -0.6826633, 1, 1, 1, 1, 1,
-1.921028, 0.0161009, -1.39641, 1, 1, 1, 1, 1,
-1.917883, 0.6901136, 0.6769027, 0, 0, 1, 1, 1,
-1.912675, -1.341566, -0.7523895, 1, 0, 0, 1, 1,
-1.911958, -1.582263, -1.989619, 1, 0, 0, 1, 1,
-1.909395, 2.4853, 0.09169823, 1, 0, 0, 1, 1,
-1.900169, 0.1244231, -0.8084123, 1, 0, 0, 1, 1,
-1.880802, -1.021569, -1.220028, 1, 0, 0, 1, 1,
-1.855021, -1.424159, -1.665074, 0, 0, 0, 1, 1,
-1.78308, -1.381438, -1.917715, 0, 0, 0, 1, 1,
-1.778316, 0.04657363, -2.940494, 0, 0, 0, 1, 1,
-1.765259, 0.4997974, -3.090734, 0, 0, 0, 1, 1,
-1.74777, -1.099172, -2.574369, 0, 0, 0, 1, 1,
-1.719969, -0.1452355, -3.190949, 0, 0, 0, 1, 1,
-1.689629, 0.4246311, -1.319009, 0, 0, 0, 1, 1,
-1.684591, -0.7567749, -2.907293, 1, 1, 1, 1, 1,
-1.684221, 2.013015, -1.137519, 1, 1, 1, 1, 1,
-1.683262, -0.6387115, -0.6267831, 1, 1, 1, 1, 1,
-1.669272, -0.1795401, -2.99824, 1, 1, 1, 1, 1,
-1.660154, 0.7837332, -1.26849, 1, 1, 1, 1, 1,
-1.652053, -0.882095, -1.249224, 1, 1, 1, 1, 1,
-1.622232, -0.7330204, -2.648299, 1, 1, 1, 1, 1,
-1.611484, -0.02625223, -1.405965, 1, 1, 1, 1, 1,
-1.607477, -0.9666461, -2.542711, 1, 1, 1, 1, 1,
-1.600003, -0.9020695, -2.212162, 1, 1, 1, 1, 1,
-1.555984, -0.5795704, 0.1940958, 1, 1, 1, 1, 1,
-1.542834, -0.9662992, -0.4130259, 1, 1, 1, 1, 1,
-1.535281, -1.135655, -2.853121, 1, 1, 1, 1, 1,
-1.532896, 1.390249, -0.01479963, 1, 1, 1, 1, 1,
-1.509791, -0.002139197, -1.908235, 1, 1, 1, 1, 1,
-1.504187, -2.124613, -0.5060212, 0, 0, 1, 1, 1,
-1.49781, -0.2901857, -2.11684, 1, 0, 0, 1, 1,
-1.491147, -0.6142622, -0.5325109, 1, 0, 0, 1, 1,
-1.487331, 1.011155, -1.043905, 1, 0, 0, 1, 1,
-1.476607, 0.3730447, -1.895153, 1, 0, 0, 1, 1,
-1.475345, -0.1006073, -1.721847, 1, 0, 0, 1, 1,
-1.450214, -1.204155, -1.299198, 0, 0, 0, 1, 1,
-1.448744, -0.432313, -3.05446, 0, 0, 0, 1, 1,
-1.435256, -1.28623, -1.577209, 0, 0, 0, 1, 1,
-1.423843, 2.109042, -0.4140928, 0, 0, 0, 1, 1,
-1.415753, 0.5049348, -0.5788844, 0, 0, 0, 1, 1,
-1.414726, -0.2924819, -1.827294, 0, 0, 0, 1, 1,
-1.411007, 1.640834, -0.2749439, 0, 0, 0, 1, 1,
-1.408579, 1.565302, -1.261929, 1, 1, 1, 1, 1,
-1.400758, 1.612602, -0.3342068, 1, 1, 1, 1, 1,
-1.384041, 1.370339, -2.434793, 1, 1, 1, 1, 1,
-1.383262, 0.3977896, -1.5065, 1, 1, 1, 1, 1,
-1.381449, 0.3999489, -3.153465, 1, 1, 1, 1, 1,
-1.374955, 1.609914, 0.3452512, 1, 1, 1, 1, 1,
-1.370617, 0.6244641, 1.017446, 1, 1, 1, 1, 1,
-1.368576, -0.5050388, -2.310588, 1, 1, 1, 1, 1,
-1.355094, 0.97619, -0.6972855, 1, 1, 1, 1, 1,
-1.344085, 0.5378182, 0.5297155, 1, 1, 1, 1, 1,
-1.341721, -0.6014895, -1.762976, 1, 1, 1, 1, 1,
-1.341492, -0.5897473, -0.6185642, 1, 1, 1, 1, 1,
-1.332541, -0.07896928, -2.371642, 1, 1, 1, 1, 1,
-1.331477, -0.1360776, -1.994648, 1, 1, 1, 1, 1,
-1.31664, 1.375394, -0.5725201, 1, 1, 1, 1, 1,
-1.314395, -0.6189972, 0.8088292, 0, 0, 1, 1, 1,
-1.307014, -0.06062919, -1.307012, 1, 0, 0, 1, 1,
-1.301642, -0.610604, -1.618925, 1, 0, 0, 1, 1,
-1.300066, -0.08922103, -2.117517, 1, 0, 0, 1, 1,
-1.284632, 0.2454785, -3.43625, 1, 0, 0, 1, 1,
-1.271864, -0.01209522, -2.7658, 1, 0, 0, 1, 1,
-1.265, 0.2713675, -1.237159, 0, 0, 0, 1, 1,
-1.262394, 0.3797046, -1.392888, 0, 0, 0, 1, 1,
-1.259874, -1.18502, -2.621045, 0, 0, 0, 1, 1,
-1.259073, 0.5594452, -1.347842, 0, 0, 0, 1, 1,
-1.252205, 0.1509886, -3.334867, 0, 0, 0, 1, 1,
-1.246367, 0.005858262, -1.46825, 0, 0, 0, 1, 1,
-1.24195, -0.7081522, -1.067257, 0, 0, 0, 1, 1,
-1.236152, -1.989023, -1.31533, 1, 1, 1, 1, 1,
-1.232314, -0.154457, -0.2616999, 1, 1, 1, 1, 1,
-1.229135, 0.5601717, -0.6160344, 1, 1, 1, 1, 1,
-1.227382, -0.1428525, -1.029867, 1, 1, 1, 1, 1,
-1.226672, -1.01613, -0.7429117, 1, 1, 1, 1, 1,
-1.218948, 0.2430359, -2.232724, 1, 1, 1, 1, 1,
-1.218245, -0.6594571, -2.133882, 1, 1, 1, 1, 1,
-1.217762, -0.6130633, -0.5155352, 1, 1, 1, 1, 1,
-1.216314, -0.08444197, -1.8429, 1, 1, 1, 1, 1,
-1.208257, -0.2671216, -1.761476, 1, 1, 1, 1, 1,
-1.207217, -1.168712, -2.764528, 1, 1, 1, 1, 1,
-1.205555, 0.6408384, -1.132119, 1, 1, 1, 1, 1,
-1.199517, 0.03898603, -1.56994, 1, 1, 1, 1, 1,
-1.196822, 0.02420675, -1.149643, 1, 1, 1, 1, 1,
-1.194817, 1.342414, -1.015321, 1, 1, 1, 1, 1,
-1.190242, 0.6290922, -3.609619, 0, 0, 1, 1, 1,
-1.183652, 1.117778, -0.5631486, 1, 0, 0, 1, 1,
-1.178828, 1.510745, -0.3118542, 1, 0, 0, 1, 1,
-1.17623, 0.7796521, -0.5295559, 1, 0, 0, 1, 1,
-1.176044, -0.4549979, -1.576258, 1, 0, 0, 1, 1,
-1.173402, -0.8511264, -2.186213, 1, 0, 0, 1, 1,
-1.170892, 1.040377, -0.6941074, 0, 0, 0, 1, 1,
-1.149249, -0.01209746, -0.477088, 0, 0, 0, 1, 1,
-1.137422, -2.044416, 0.1565967, 0, 0, 0, 1, 1,
-1.118795, 1.592327, -0.5571235, 0, 0, 0, 1, 1,
-1.106119, 0.04554506, -2.269957, 0, 0, 0, 1, 1,
-1.104619, 0.03089543, -2.01861, 0, 0, 0, 1, 1,
-1.101536, -1.339763, -0.4586416, 0, 0, 0, 1, 1,
-1.099988, 0.08462515, -2.353022, 1, 1, 1, 1, 1,
-1.096782, 0.02070073, -1.791407, 1, 1, 1, 1, 1,
-1.096557, 1.360492, -0.7592675, 1, 1, 1, 1, 1,
-1.095332, -1.942751, -1.865005, 1, 1, 1, 1, 1,
-1.094746, -1.52073, -3.044266, 1, 1, 1, 1, 1,
-1.08892, -0.3247141, -2.653162, 1, 1, 1, 1, 1,
-1.08598, -0.1006615, -1.69456, 1, 1, 1, 1, 1,
-1.070379, 0.9037795, -0.524667, 1, 1, 1, 1, 1,
-1.068977, -0.2112976, -1.637083, 1, 1, 1, 1, 1,
-1.061911, 1.732844, -0.8052865, 1, 1, 1, 1, 1,
-1.061416, -0.6959336, -2.841402, 1, 1, 1, 1, 1,
-1.060786, -0.3246783, -1.117537, 1, 1, 1, 1, 1,
-1.052036, -0.2250161, -1.993055, 1, 1, 1, 1, 1,
-1.051706, -0.2769643, -1.239992, 1, 1, 1, 1, 1,
-1.04111, -0.7348496, -3.253016, 1, 1, 1, 1, 1,
-1.036021, 0.4681914, -1.767618, 0, 0, 1, 1, 1,
-1.034325, 0.0771401, 0.2918196, 1, 0, 0, 1, 1,
-1.022765, -0.008577052, -2.486565, 1, 0, 0, 1, 1,
-1.019909, -0.5956091, -2.93064, 1, 0, 0, 1, 1,
-1.016439, -0.9990669, -3.557115, 1, 0, 0, 1, 1,
-1.01316, 0.3036563, -1.841721, 1, 0, 0, 1, 1,
-1.007483, 0.1747308, -1.497696, 0, 0, 0, 1, 1,
-0.9963092, -0.8303322, -2.36582, 0, 0, 0, 1, 1,
-0.9943627, -0.3985996, -2.122208, 0, 0, 0, 1, 1,
-0.9918789, 1.606065, -1.053157, 0, 0, 0, 1, 1,
-0.9803588, -0.1665876, -2.091829, 0, 0, 0, 1, 1,
-0.9801552, 0.1233022, -1.294115, 0, 0, 0, 1, 1,
-0.9760744, -0.06582341, -4.162082, 0, 0, 0, 1, 1,
-0.9715236, -0.348294, -2.758271, 1, 1, 1, 1, 1,
-0.9658192, 1.930627, 0.5684637, 1, 1, 1, 1, 1,
-0.9600353, -0.1892429, -0.8577742, 1, 1, 1, 1, 1,
-0.9592899, 0.8715402, 0.4742973, 1, 1, 1, 1, 1,
-0.9579105, 1.235416, -1.303968, 1, 1, 1, 1, 1,
-0.9564049, -0.0008230217, -1.812216, 1, 1, 1, 1, 1,
-0.9501081, -2.524387, -4.377941, 1, 1, 1, 1, 1,
-0.9457172, 0.3299983, -0.3157809, 1, 1, 1, 1, 1,
-0.9381921, -1.230737, -2.767205, 1, 1, 1, 1, 1,
-0.9361319, 1.150953, -0.8856683, 1, 1, 1, 1, 1,
-0.9348962, -1.036756, -1.720677, 1, 1, 1, 1, 1,
-0.9297374, -0.1516595, -2.196579, 1, 1, 1, 1, 1,
-0.9287574, -1.085412, -1.80377, 1, 1, 1, 1, 1,
-0.923217, 1.364016, 0.6003246, 1, 1, 1, 1, 1,
-0.9205955, -1.035898, -3.399647, 1, 1, 1, 1, 1,
-0.917288, -0.6659421, -1.952447, 0, 0, 1, 1, 1,
-0.9171813, -0.5920773, -1.495805, 1, 0, 0, 1, 1,
-0.9136468, -0.6950074, -2.87713, 1, 0, 0, 1, 1,
-0.9108886, -0.5114153, -2.898793, 1, 0, 0, 1, 1,
-0.9074395, -0.08455244, -1.854275, 1, 0, 0, 1, 1,
-0.905542, 0.2616413, -0.8569206, 1, 0, 0, 1, 1,
-0.9040373, 0.2933206, -1.100552, 0, 0, 0, 1, 1,
-0.8984401, -0.8761876, -2.713048, 0, 0, 0, 1, 1,
-0.8929026, 0.7204503, -1.711019, 0, 0, 0, 1, 1,
-0.8892017, -1.104174, -2.713924, 0, 0, 0, 1, 1,
-0.8777601, 0.9991067, 0.6493354, 0, 0, 0, 1, 1,
-0.8737507, -0.5930835, -2.292375, 0, 0, 0, 1, 1,
-0.8690024, -0.529089, -1.99136, 0, 0, 0, 1, 1,
-0.867021, 1.263919, -1.437422, 1, 1, 1, 1, 1,
-0.8571001, -0.009744849, -1.775178, 1, 1, 1, 1, 1,
-0.8447084, -1.139059, -2.712454, 1, 1, 1, 1, 1,
-0.8425296, 1.226905, -1.643992, 1, 1, 1, 1, 1,
-0.8418601, 0.09992429, -3.4419, 1, 1, 1, 1, 1,
-0.8399079, 0.7405078, -1.35014, 1, 1, 1, 1, 1,
-0.8357586, -0.05861472, -2.290408, 1, 1, 1, 1, 1,
-0.8317532, -0.04745876, -2.14396, 1, 1, 1, 1, 1,
-0.8265433, 0.5358716, -1.467137, 1, 1, 1, 1, 1,
-0.8250664, 1.585266, 0.5773041, 1, 1, 1, 1, 1,
-0.8231723, 0.6667628, -0.7911503, 1, 1, 1, 1, 1,
-0.8226903, 0.01792783, -1.694821, 1, 1, 1, 1, 1,
-0.8218775, -0.4725058, -2.843208, 1, 1, 1, 1, 1,
-0.8209059, 0.0868307, -2.441671, 1, 1, 1, 1, 1,
-0.8125694, -0.517791, -0.7196751, 1, 1, 1, 1, 1,
-0.8088958, -0.7758771, -2.128501, 0, 0, 1, 1, 1,
-0.8069206, 0.320364, -2.008554, 1, 0, 0, 1, 1,
-0.8064643, -0.3993717, -2.184219, 1, 0, 0, 1, 1,
-0.8037965, -0.3419337, -2.534663, 1, 0, 0, 1, 1,
-0.8020375, -1.167585, -1.545133, 1, 0, 0, 1, 1,
-0.7992821, 0.5500163, -0.7030403, 1, 0, 0, 1, 1,
-0.7928355, 0.323869, -0.8269914, 0, 0, 0, 1, 1,
-0.7926441, 0.7409632, -1.850312, 0, 0, 0, 1, 1,
-0.7918953, 0.5036084, -0.6623769, 0, 0, 0, 1, 1,
-0.7913129, -0.6463881, -1.248151, 0, 0, 0, 1, 1,
-0.7896783, -1.108579, -2.967618, 0, 0, 0, 1, 1,
-0.7871467, -0.8569944, -1.978519, 0, 0, 0, 1, 1,
-0.7855721, 1.898927, -2.556692, 0, 0, 0, 1, 1,
-0.7760912, -1.768093, -3.636039, 1, 1, 1, 1, 1,
-0.7685263, 1.211699, -0.4569774, 1, 1, 1, 1, 1,
-0.7640657, 0.1628636, -0.9066615, 1, 1, 1, 1, 1,
-0.761845, 0.6447591, -1.746075, 1, 1, 1, 1, 1,
-0.7443899, -0.01138912, -0.7377728, 1, 1, 1, 1, 1,
-0.7407689, -0.6253937, -1.566773, 1, 1, 1, 1, 1,
-0.7349692, -0.7188097, -3.343101, 1, 1, 1, 1, 1,
-0.7300864, -0.35436, -2.245125, 1, 1, 1, 1, 1,
-0.7271563, -0.5933661, -2.28319, 1, 1, 1, 1, 1,
-0.7254797, -0.03963386, -0.9502677, 1, 1, 1, 1, 1,
-0.7143458, 0.8858292, -1.486638, 1, 1, 1, 1, 1,
-0.7095816, 0.6879155, -1.319823, 1, 1, 1, 1, 1,
-0.7072796, 0.6528658, -1.484737, 1, 1, 1, 1, 1,
-0.7065049, 2.420024, -0.1409823, 1, 1, 1, 1, 1,
-0.7064324, 1.273274, -0.2573687, 1, 1, 1, 1, 1,
-0.7032548, -0.05725556, 2.158824, 0, 0, 1, 1, 1,
-0.7016736, 0.05281065, -3.482908, 1, 0, 0, 1, 1,
-0.6943614, 1.250707, -1.668144, 1, 0, 0, 1, 1,
-0.6871515, -0.05327369, -2.549063, 1, 0, 0, 1, 1,
-0.6866395, -1.69277, -3.205274, 1, 0, 0, 1, 1,
-0.6848596, -0.982136, -1.950795, 1, 0, 0, 1, 1,
-0.6848544, -0.448842, -1.250512, 0, 0, 0, 1, 1,
-0.6825913, -0.8614013, -2.768518, 0, 0, 0, 1, 1,
-0.676194, -1.037272, -1.353462, 0, 0, 0, 1, 1,
-0.6744298, 0.04177058, -1.466199, 0, 0, 0, 1, 1,
-0.6696222, -1.445637, -3.128829, 0, 0, 0, 1, 1,
-0.6690513, -0.4079643, -0.6321698, 0, 0, 0, 1, 1,
-0.6643349, 1.533716, -0.6630077, 0, 0, 0, 1, 1,
-0.6554948, -0.4676162, -4.158934, 1, 1, 1, 1, 1,
-0.6553047, 0.69765, 1.074893, 1, 1, 1, 1, 1,
-0.6535194, -0.2929204, -1.959935, 1, 1, 1, 1, 1,
-0.6486012, 0.9084856, 0.5971694, 1, 1, 1, 1, 1,
-0.6453503, 1.215473, -1.205859, 1, 1, 1, 1, 1,
-0.6422808, -2.3338, -2.054496, 1, 1, 1, 1, 1,
-0.6319352, -2.039886, -1.606721, 1, 1, 1, 1, 1,
-0.6305583, -1.329387, -3.667099, 1, 1, 1, 1, 1,
-0.6282681, -0.6071457, -0.3770327, 1, 1, 1, 1, 1,
-0.6250654, -1.755074, -2.358225, 1, 1, 1, 1, 1,
-0.6247992, -1.574301, -3.287797, 1, 1, 1, 1, 1,
-0.6187493, 0.601781, -0.2247212, 1, 1, 1, 1, 1,
-0.6130373, 1.28781, -0.8644036, 1, 1, 1, 1, 1,
-0.6059726, 0.8822871, 0.8935983, 1, 1, 1, 1, 1,
-0.6025471, 0.7438169, 0.2653006, 1, 1, 1, 1, 1,
-0.600978, -0.316356, -1.924523, 0, 0, 1, 1, 1,
-0.5944999, 0.2859616, -1.191034, 1, 0, 0, 1, 1,
-0.5917687, 0.646485, -1.366284, 1, 0, 0, 1, 1,
-0.5835105, -1.498165, -2.361737, 1, 0, 0, 1, 1,
-0.5812283, 0.2566272, 0.5327019, 1, 0, 0, 1, 1,
-0.5807478, -0.7232016, -2.308461, 1, 0, 0, 1, 1,
-0.5682844, 0.1439487, 0.833568, 0, 0, 0, 1, 1,
-0.5682413, -0.431561, -1.42339, 0, 0, 0, 1, 1,
-0.5654982, 2.578978, -0.6472685, 0, 0, 0, 1, 1,
-0.5637043, 1.098152, -0.973253, 0, 0, 0, 1, 1,
-0.5578831, -0.06247195, -1.769434, 0, 0, 0, 1, 1,
-0.5570345, 0.3151262, -1.810178, 0, 0, 0, 1, 1,
-0.5563167, -1.395768, -3.257311, 0, 0, 0, 1, 1,
-0.5513363, -0.2852439, -1.964142, 1, 1, 1, 1, 1,
-0.5499292, -0.2979507, -2.065713, 1, 1, 1, 1, 1,
-0.5472688, 1.832659, 0.8050492, 1, 1, 1, 1, 1,
-0.5469006, -1.144398, -2.724125, 1, 1, 1, 1, 1,
-0.5437202, -2.697488, -2.27879, 1, 1, 1, 1, 1,
-0.5346547, 0.4077283, -1.241449, 1, 1, 1, 1, 1,
-0.5336358, 1.140335, 0.6453536, 1, 1, 1, 1, 1,
-0.5298046, -2.084094, -3.287912, 1, 1, 1, 1, 1,
-0.5269678, 0.06160544, -3.200486, 1, 1, 1, 1, 1,
-0.5268545, -0.4984522, -2.450834, 1, 1, 1, 1, 1,
-0.5253192, 0.2689559, -1.63212, 1, 1, 1, 1, 1,
-0.5243743, -1.045827, -2.378986, 1, 1, 1, 1, 1,
-0.5231097, 0.5532622, -2.504586, 1, 1, 1, 1, 1,
-0.5212552, 1.163212, -1.747323, 1, 1, 1, 1, 1,
-0.5174332, 1.434587, 0.9959188, 1, 1, 1, 1, 1,
-0.5163636, 0.5696796, -0.0007713996, 0, 0, 1, 1, 1,
-0.514191, 1.65668, -0.1920743, 1, 0, 0, 1, 1,
-0.5132545, 0.4577431, 0.5570739, 1, 0, 0, 1, 1,
-0.5100178, 1.953823, -0.8374869, 1, 0, 0, 1, 1,
-0.5022718, 0.05842597, -2.248047, 1, 0, 0, 1, 1,
-0.4980431, -0.6544805, -2.716616, 1, 0, 0, 1, 1,
-0.4964892, 0.2295242, -2.675128, 0, 0, 0, 1, 1,
-0.4925927, 0.9341967, -0.288562, 0, 0, 0, 1, 1,
-0.4901377, 1.076206, -0.7125011, 0, 0, 0, 1, 1,
-0.4840769, 0.0613522, -1.583943, 0, 0, 0, 1, 1,
-0.4840758, 0.7845967, -1.884526, 0, 0, 0, 1, 1,
-0.4782103, -0.35657, -1.462066, 0, 0, 0, 1, 1,
-0.4749964, 0.1019012, -0.7592235, 0, 0, 0, 1, 1,
-0.4743182, -0.0767245, 0.1521399, 1, 1, 1, 1, 1,
-0.4699299, -1.347758, -5.740596, 1, 1, 1, 1, 1,
-0.4617303, 0.4192154, -2.063417, 1, 1, 1, 1, 1,
-0.4604784, -1.977305, -4.058834, 1, 1, 1, 1, 1,
-0.4561124, 1.819823, 0.187538, 1, 1, 1, 1, 1,
-0.4545329, -0.2864616, -1.907634, 1, 1, 1, 1, 1,
-0.4523885, 1.584718, -1.269489, 1, 1, 1, 1, 1,
-0.4470396, -1.071534, -2.621437, 1, 1, 1, 1, 1,
-0.4444672, 1.183191, -1.95219, 1, 1, 1, 1, 1,
-0.4386295, 0.5214086, -0.882983, 1, 1, 1, 1, 1,
-0.4364633, -1.425231, -2.014874, 1, 1, 1, 1, 1,
-0.4310274, -2.963119, -2.862433, 1, 1, 1, 1, 1,
-0.4309106, -0.2593597, -2.402248, 1, 1, 1, 1, 1,
-0.4256026, 0.1814152, -0.208665, 1, 1, 1, 1, 1,
-0.4229594, -0.06945357, -2.174039, 1, 1, 1, 1, 1,
-0.4221711, 0.385144, -2.025448, 0, 0, 1, 1, 1,
-0.420741, -0.07106224, -2.018021, 1, 0, 0, 1, 1,
-0.4174856, -1.179222, -3.014096, 1, 0, 0, 1, 1,
-0.4149609, -1.266964, -3.034762, 1, 0, 0, 1, 1,
-0.4134607, 1.164799, -2.834739, 1, 0, 0, 1, 1,
-0.4115023, -2.887194, -4.106547, 1, 0, 0, 1, 1,
-0.4108112, -2.239448, -1.85073, 0, 0, 0, 1, 1,
-0.4063444, 1.224817, -1.112737, 0, 0, 0, 1, 1,
-0.40342, -0.8593284, -3.214979, 0, 0, 0, 1, 1,
-0.4033398, 1.48083, 1.438813, 0, 0, 0, 1, 1,
-0.4002873, -1.113779, -1.864368, 0, 0, 0, 1, 1,
-0.393158, -0.4638055, -2.914375, 0, 0, 0, 1, 1,
-0.3900335, -1.302057, -3.502601, 0, 0, 0, 1, 1,
-0.3874815, -0.08959575, -3.269166, 1, 1, 1, 1, 1,
-0.3864891, -0.4460742, -2.564732, 1, 1, 1, 1, 1,
-0.375509, -0.4299989, -4.470101, 1, 1, 1, 1, 1,
-0.3693752, -0.1335171, -3.71294, 1, 1, 1, 1, 1,
-0.3686999, -0.779397, -2.255556, 1, 1, 1, 1, 1,
-0.365739, -0.2485759, -2.932703, 1, 1, 1, 1, 1,
-0.3636375, 0.4866966, -0.8320192, 1, 1, 1, 1, 1,
-0.3621783, 0.4479705, -1.292503, 1, 1, 1, 1, 1,
-0.3602189, 1.352568, 0.325102, 1, 1, 1, 1, 1,
-0.3546428, -0.6445175, -3.585279, 1, 1, 1, 1, 1,
-0.3544214, 1.067584, -0.1368133, 1, 1, 1, 1, 1,
-0.3504147, 0.3261842, 1.540533, 1, 1, 1, 1, 1,
-0.3484754, -0.1732043, -1.63046, 1, 1, 1, 1, 1,
-0.3473093, -0.729046, -3.802641, 1, 1, 1, 1, 1,
-0.3404971, 1.054485, 0.02109271, 1, 1, 1, 1, 1,
-0.3400233, 1.497271, -0.9774792, 0, 0, 1, 1, 1,
-0.3395482, 1.020898, -1.123067, 1, 0, 0, 1, 1,
-0.3395264, -1.403883, -2.919286, 1, 0, 0, 1, 1,
-0.3369594, -1.099934, -3.347506, 1, 0, 0, 1, 1,
-0.3356068, 0.5496861, -0.5642157, 1, 0, 0, 1, 1,
-0.3355004, -0.001499468, -1.085704, 1, 0, 0, 1, 1,
-0.3330506, -0.3043199, -1.684313, 0, 0, 0, 1, 1,
-0.3311794, 0.7595114, 0.5932868, 0, 0, 0, 1, 1,
-0.3301086, 0.2939074, 0.09060533, 0, 0, 0, 1, 1,
-0.3298524, -0.01221376, -1.278042, 0, 0, 0, 1, 1,
-0.3286671, 0.7902764, -1.438406, 0, 0, 0, 1, 1,
-0.327549, -0.6368636, -2.114277, 0, 0, 0, 1, 1,
-0.3264682, 0.9981608, 0.1172075, 0, 0, 0, 1, 1,
-0.3254859, -0.894862, -3.728321, 1, 1, 1, 1, 1,
-0.3240605, 1.280107, 1.029501, 1, 1, 1, 1, 1,
-0.3234531, -0.6225095, -2.810953, 1, 1, 1, 1, 1,
-0.3233811, -0.4171443, -2.345965, 1, 1, 1, 1, 1,
-0.3170302, 1.162633, 0.8881529, 1, 1, 1, 1, 1,
-0.3110712, 0.3498449, -0.9994481, 1, 1, 1, 1, 1,
-0.3074355, -2.138729, -3.340334, 1, 1, 1, 1, 1,
-0.306479, -1.220448, -3.160914, 1, 1, 1, 1, 1,
-0.3039846, -0.595897, -2.514886, 1, 1, 1, 1, 1,
-0.3036574, -1.110343, -2.212122, 1, 1, 1, 1, 1,
-0.3026915, -2.433721, -2.325067, 1, 1, 1, 1, 1,
-0.3024625, -0.1186425, -0.01532561, 1, 1, 1, 1, 1,
-0.3008201, -1.809301, -2.613742, 1, 1, 1, 1, 1,
-0.2950608, -1.092308, -2.082452, 1, 1, 1, 1, 1,
-0.2949338, 1.76013, -2.649073, 1, 1, 1, 1, 1,
-0.2916518, -0.4130234, -1.660574, 0, 0, 1, 1, 1,
-0.2916283, -0.159922, -2.811625, 1, 0, 0, 1, 1,
-0.2906506, 0.3148611, -1.343721, 1, 0, 0, 1, 1,
-0.285626, 0.5945298, -0.3156455, 1, 0, 0, 1, 1,
-0.2833387, -1.205007, -3.33784, 1, 0, 0, 1, 1,
-0.2782824, -0.1192297, -3.348932, 1, 0, 0, 1, 1,
-0.2764962, 0.2008501, -0.3617201, 0, 0, 0, 1, 1,
-0.268149, -1.767611, -4.147005, 0, 0, 0, 1, 1,
-0.2652998, -0.3850588, -3.446708, 0, 0, 0, 1, 1,
-0.2640806, 1.291359, 0.2099425, 0, 0, 0, 1, 1,
-0.2536079, 0.8795618, -0.2207659, 0, 0, 0, 1, 1,
-0.2505515, 1.101929, -0.7213082, 0, 0, 0, 1, 1,
-0.2492859, 0.09511054, -1.821949, 0, 0, 0, 1, 1,
-0.24826, 0.1116566, -0.3399235, 1, 1, 1, 1, 1,
-0.2477565, 0.7050052, -2.19891, 1, 1, 1, 1, 1,
-0.2460948, 0.5160135, -1.947276, 1, 1, 1, 1, 1,
-0.2441139, 0.5829799, -0.3582386, 1, 1, 1, 1, 1,
-0.2411847, 0.3043161, 0.6197132, 1, 1, 1, 1, 1,
-0.2403937, -1.030759, -3.314861, 1, 1, 1, 1, 1,
-0.2399876, -0.26022, -1.822936, 1, 1, 1, 1, 1,
-0.239861, 1.444431, 0.7853653, 1, 1, 1, 1, 1,
-0.2398577, -0.9538692, -1.979601, 1, 1, 1, 1, 1,
-0.2380254, -0.983897, -3.667652, 1, 1, 1, 1, 1,
-0.2336145, 0.1438807, -1.928172, 1, 1, 1, 1, 1,
-0.2285728, -0.4963861, -2.467492, 1, 1, 1, 1, 1,
-0.228048, 1.44272, -0.07964133, 1, 1, 1, 1, 1,
-0.2279072, -0.3947978, -5.068485, 1, 1, 1, 1, 1,
-0.2250019, 0.8503463, -1.267473, 1, 1, 1, 1, 1,
-0.2246147, 0.8932514, -0.852011, 0, 0, 1, 1, 1,
-0.2215001, -0.5269945, -3.217695, 1, 0, 0, 1, 1,
-0.221349, -0.03145942, -2.480172, 1, 0, 0, 1, 1,
-0.2171953, 2.639318, -1.142716, 1, 0, 0, 1, 1,
-0.2146848, 1.17514, -1.207306, 1, 0, 0, 1, 1,
-0.2136209, -1.06626, -2.398516, 1, 0, 0, 1, 1,
-0.2045077, -1.906229, -2.564377, 0, 0, 0, 1, 1,
-0.1980347, -0.1422798, -2.661045, 0, 0, 0, 1, 1,
-0.1943912, 0.9888567, 1.309458, 0, 0, 0, 1, 1,
-0.1934516, -1.281812, -2.716168, 0, 0, 0, 1, 1,
-0.1913838, 0.338815, -0.3726083, 0, 0, 0, 1, 1,
-0.1910465, -2.007875, -3.681329, 0, 0, 0, 1, 1,
-0.1801311, 0.8500258, 0.3648002, 0, 0, 0, 1, 1,
-0.1780057, 1.721606, 0.6551822, 1, 1, 1, 1, 1,
-0.1659268, 0.6036564, 0.4047189, 1, 1, 1, 1, 1,
-0.165081, -0.5810047, -2.466057, 1, 1, 1, 1, 1,
-0.1650418, -1.651426, -2.982988, 1, 1, 1, 1, 1,
-0.1529247, -1.581067, -1.397395, 1, 1, 1, 1, 1,
-0.1482814, -0.558385, -3.207963, 1, 1, 1, 1, 1,
-0.1479356, 0.4494781, -0.2037762, 1, 1, 1, 1, 1,
-0.1460466, 0.8255406, 0.1636437, 1, 1, 1, 1, 1,
-0.1459954, 0.7934071, -0.6021461, 1, 1, 1, 1, 1,
-0.1453796, 0.6383632, 0.08669566, 1, 1, 1, 1, 1,
-0.1453042, 0.6664984, 0.7012156, 1, 1, 1, 1, 1,
-0.1436149, 1.630024, -0.03753921, 1, 1, 1, 1, 1,
-0.136831, 0.7731047, -1.081676, 1, 1, 1, 1, 1,
-0.1350369, -0.7465668, -3.177556, 1, 1, 1, 1, 1,
-0.1304158, -0.3987514, -3.570594, 1, 1, 1, 1, 1,
-0.1265057, 0.3281175, -0.5507789, 0, 0, 1, 1, 1,
-0.1234663, 0.4282619, -1.174791, 1, 0, 0, 1, 1,
-0.121124, 0.2623796, -0.9154626, 1, 0, 0, 1, 1,
-0.1197676, -1.821464, -1.574292, 1, 0, 0, 1, 1,
-0.1165734, 1.997765, 1.277501, 1, 0, 0, 1, 1,
-0.1155887, 0.09103589, -1.285111, 1, 0, 0, 1, 1,
-0.1141327, -1.64924, -4.389229, 0, 0, 0, 1, 1,
-0.110371, 0.2674518, -1.503672, 0, 0, 0, 1, 1,
-0.1093209, -0.9010553, -4.33921, 0, 0, 0, 1, 1,
-0.1073022, -1.688297, -3.07826, 0, 0, 0, 1, 1,
-0.1052828, 0.1822227, -1.479885, 0, 0, 0, 1, 1,
-0.09842366, -0.8388168, -2.879642, 0, 0, 0, 1, 1,
-0.09715751, -0.4854088, -2.313792, 0, 0, 0, 1, 1,
-0.09027757, 0.5683654, -1.391473, 1, 1, 1, 1, 1,
-0.08872208, 0.3393647, 0.6304851, 1, 1, 1, 1, 1,
-0.0867698, -0.3429568, -1.994463, 1, 1, 1, 1, 1,
-0.08337164, 1.448822, 0.3640532, 1, 1, 1, 1, 1,
-0.08287726, 2.424377, 0.9794582, 1, 1, 1, 1, 1,
-0.08250521, 0.9572756, 0.5180556, 1, 1, 1, 1, 1,
-0.08042708, 1.960669, 1.22532, 1, 1, 1, 1, 1,
-0.0803883, -1.35213, -2.428454, 1, 1, 1, 1, 1,
-0.0800635, 0.08720614, -0.3780386, 1, 1, 1, 1, 1,
-0.07823708, 0.3219198, -0.6566143, 1, 1, 1, 1, 1,
-0.07681766, -0.3973919, -4.948169, 1, 1, 1, 1, 1,
-0.07627826, -0.9312243, -3.427133, 1, 1, 1, 1, 1,
-0.07617468, -0.5529083, -2.304955, 1, 1, 1, 1, 1,
-0.07538047, 0.5356845, 0.06047648, 1, 1, 1, 1, 1,
-0.07452278, 0.3012499, -2.607307, 1, 1, 1, 1, 1,
-0.07198808, 2.263473, 1.293148, 0, 0, 1, 1, 1,
-0.06913577, -1.422083, -2.953513, 1, 0, 0, 1, 1,
-0.06814638, -1.59651, -3.003397, 1, 0, 0, 1, 1,
-0.06497201, -2.197863, -1.997722, 1, 0, 0, 1, 1,
-0.0647961, 0.07479664, -0.1348815, 1, 0, 0, 1, 1,
-0.06334006, -0.1668153, -1.749789, 1, 0, 0, 1, 1,
-0.05935591, -1.254911, -3.154255, 0, 0, 0, 1, 1,
-0.05803164, -1.524087, -3.298608, 0, 0, 0, 1, 1,
-0.05711253, -0.1263187, -3.251076, 0, 0, 0, 1, 1,
-0.05508343, -1.159906, -3.410563, 0, 0, 0, 1, 1,
-0.04981549, -1.469969, -2.946888, 0, 0, 0, 1, 1,
-0.04979824, 0.4703959, -1.295076, 0, 0, 0, 1, 1,
-0.04843148, -0.1758917, -2.652943, 0, 0, 0, 1, 1,
-0.04595624, 0.2709998, -0.5611703, 1, 1, 1, 1, 1,
-0.04527784, -1.564826, -2.981517, 1, 1, 1, 1, 1,
-0.04337101, 0.8611184, 1.233443, 1, 1, 1, 1, 1,
-0.04061686, 1.675146, 1.222778, 1, 1, 1, 1, 1,
-0.03808855, -0.005828794, -2.087602, 1, 1, 1, 1, 1,
-0.03514223, -0.9896891, -2.744292, 1, 1, 1, 1, 1,
-0.03451395, 0.9405495, 1.805216, 1, 1, 1, 1, 1,
-0.03435555, 0.05307904, -0.155194, 1, 1, 1, 1, 1,
-0.03121166, 0.5076406, 0.2981144, 1, 1, 1, 1, 1,
-0.02752209, -2.336988, -3.820263, 1, 1, 1, 1, 1,
-0.02616164, -0.5082726, -2.890725, 1, 1, 1, 1, 1,
-0.02367644, 1.68587, 0.4614078, 1, 1, 1, 1, 1,
-0.02314798, 0.9019927, -1.023686, 1, 1, 1, 1, 1,
-0.01833687, -0.9283203, -1.13984, 1, 1, 1, 1, 1,
-0.01729572, -0.7405245, -3.656635, 1, 1, 1, 1, 1,
-0.01375532, 0.7365609, 0.1379845, 0, 0, 1, 1, 1,
-0.01328196, 0.3745869, 1.334051, 1, 0, 0, 1, 1,
-0.01289919, 0.7604974, -0.7936913, 1, 0, 0, 1, 1,
-0.008027303, -0.7258421, -2.442207, 1, 0, 0, 1, 1,
-0.005509459, 0.4536609, 0.678767, 1, 0, 0, 1, 1,
-0.004153793, -1.321736, -3.523878, 1, 0, 0, 1, 1,
-0.003280142, -0.3805158, -4.329732, 0, 0, 0, 1, 1,
-0.0002051684, 0.145896, -0.3389582, 0, 0, 0, 1, 1,
0.004449291, 0.9941133, -1.207734, 0, 0, 0, 1, 1,
0.005972702, 0.170934, 0.5867516, 0, 0, 0, 1, 1,
0.007332768, -1.8375, 2.563892, 0, 0, 0, 1, 1,
0.008344368, 0.2443255, -0.8754554, 0, 0, 0, 1, 1,
0.009076538, 1.908401, -1.142834, 0, 0, 0, 1, 1,
0.01079642, -0.5055748, 2.197327, 1, 1, 1, 1, 1,
0.01306241, -1.551437, 3.112564, 1, 1, 1, 1, 1,
0.01347816, -0.6749163, 3.976843, 1, 1, 1, 1, 1,
0.01742564, -0.5542622, 3.122423, 1, 1, 1, 1, 1,
0.01931285, 0.8284477, 1.23128, 1, 1, 1, 1, 1,
0.0260376, 0.311841, 0.5262666, 1, 1, 1, 1, 1,
0.02814876, 0.1468575, -0.09098181, 1, 1, 1, 1, 1,
0.02851636, -0.5840801, 1.73924, 1, 1, 1, 1, 1,
0.02977573, -0.2862873, 2.792741, 1, 1, 1, 1, 1,
0.03040883, 0.0940304, -0.2119558, 1, 1, 1, 1, 1,
0.03047448, -0.6021741, 2.165388, 1, 1, 1, 1, 1,
0.03064962, 0.07235038, 0.3230581, 1, 1, 1, 1, 1,
0.03493741, -0.813705, 3.300555, 1, 1, 1, 1, 1,
0.04021103, -0.7444759, 1.493752, 1, 1, 1, 1, 1,
0.04513208, -0.057848, 2.595711, 1, 1, 1, 1, 1,
0.05080868, -0.6219014, 2.052331, 0, 0, 1, 1, 1,
0.05179515, 0.4353958, -1.349409, 1, 0, 0, 1, 1,
0.05362372, 0.9418176, 1.249232, 1, 0, 0, 1, 1,
0.05519261, -1.105568, 2.01434, 1, 0, 0, 1, 1,
0.05827583, 0.7021371, 2.036916, 1, 0, 0, 1, 1,
0.05944957, -0.7052296, 1.529979, 1, 0, 0, 1, 1,
0.06161275, -0.02701147, 2.904138, 0, 0, 0, 1, 1,
0.06323395, 0.315291, 0.5397331, 0, 0, 0, 1, 1,
0.06336825, -1.278596, 1.900496, 0, 0, 0, 1, 1,
0.06496141, 1.602311, -2.010185, 0, 0, 0, 1, 1,
0.0705936, 0.1938208, -1.760292, 0, 0, 0, 1, 1,
0.0742345, 0.1341567, 1.72943, 0, 0, 0, 1, 1,
0.0759441, 1.103953, -0.2590629, 0, 0, 0, 1, 1,
0.08105773, -1.583075, 3.558093, 1, 1, 1, 1, 1,
0.0846221, 1.870222, -0.1545064, 1, 1, 1, 1, 1,
0.08795786, 2.0171, 0.9384906, 1, 1, 1, 1, 1,
0.09142304, 1.018246, 1.164733, 1, 1, 1, 1, 1,
0.09454557, 0.2828426, -1.007098, 1, 1, 1, 1, 1,
0.09741893, -0.6748544, 3.41164, 1, 1, 1, 1, 1,
0.09831968, -0.8937062, 3.295258, 1, 1, 1, 1, 1,
0.1009173, 0.6389288, -0.6644256, 1, 1, 1, 1, 1,
0.1078545, 1.616716, -0.002061041, 1, 1, 1, 1, 1,
0.1128797, -0.5402896, 1.982228, 1, 1, 1, 1, 1,
0.1132562, 1.207781, -0.4955284, 1, 1, 1, 1, 1,
0.1169747, 0.6850706, 0.6819741, 1, 1, 1, 1, 1,
0.1172568, 1.328507, 1.764488, 1, 1, 1, 1, 1,
0.1197358, 0.1611761, 0.1624099, 1, 1, 1, 1, 1,
0.1274085, -1.28136, 4.563185, 1, 1, 1, 1, 1,
0.1286101, -2.227915, 3.601078, 0, 0, 1, 1, 1,
0.1356871, -0.4985345, 4.062644, 1, 0, 0, 1, 1,
0.1381321, 0.5455034, 1.185871, 1, 0, 0, 1, 1,
0.1411203, 0.05293595, 1.291755, 1, 0, 0, 1, 1,
0.1455889, -0.0600157, 2.241406, 1, 0, 0, 1, 1,
0.146954, -1.297357, 4.077392, 1, 0, 0, 1, 1,
0.1508148, 1.051275, 0.3969389, 0, 0, 0, 1, 1,
0.1586924, -0.3559083, 2.57511, 0, 0, 0, 1, 1,
0.1624652, 2.114199, 0.6632705, 0, 0, 0, 1, 1,
0.169585, 0.4491685, -0.2352032, 0, 0, 0, 1, 1,
0.1717674, 1.473185, 0.3363191, 0, 0, 0, 1, 1,
0.1749817, -0.01638994, 2.041734, 0, 0, 0, 1, 1,
0.1802893, 1.447827, 1.80447, 0, 0, 0, 1, 1,
0.1868754, 1.34251, -0.4296304, 1, 1, 1, 1, 1,
0.1881573, -0.283711, 1.119236, 1, 1, 1, 1, 1,
0.1899117, -0.2067657, 3.285426, 1, 1, 1, 1, 1,
0.1914799, -1.035572, 2.66902, 1, 1, 1, 1, 1,
0.1967117, -0.6975901, 3.899801, 1, 1, 1, 1, 1,
0.1980693, -0.5378389, 3.170395, 1, 1, 1, 1, 1,
0.1982078, 0.1208173, -0.3214045, 1, 1, 1, 1, 1,
0.2027626, 0.3073981, -0.8421692, 1, 1, 1, 1, 1,
0.2055703, -0.2261344, 2.589951, 1, 1, 1, 1, 1,
0.2093961, -0.5448999, 4.892474, 1, 1, 1, 1, 1,
0.2128801, -0.7542006, 3.865543, 1, 1, 1, 1, 1,
0.2129988, 0.1556536, 1.69497, 1, 1, 1, 1, 1,
0.216168, 0.2534844, 1.683874, 1, 1, 1, 1, 1,
0.222574, -0.9038676, 4.289397, 1, 1, 1, 1, 1,
0.2239147, 0.2813538, 0.6305994, 1, 1, 1, 1, 1,
0.2250564, -0.6282427, 3.429969, 0, 0, 1, 1, 1,
0.2263372, 0.3566095, 1.589466, 1, 0, 0, 1, 1,
0.2266575, -0.09644075, 1.650694, 1, 0, 0, 1, 1,
0.2275018, -1.548404, 3.156087, 1, 0, 0, 1, 1,
0.2293897, -2.251245, 2.334568, 1, 0, 0, 1, 1,
0.2326811, -0.4839783, 2.12858, 1, 0, 0, 1, 1,
0.2346511, 0.2491031, 0.8522086, 0, 0, 0, 1, 1,
0.2348314, 1.06377, 2.693778, 0, 0, 0, 1, 1,
0.2390954, -0.3718122, 4.133469, 0, 0, 0, 1, 1,
0.2440233, -1.480061, 2.223394, 0, 0, 0, 1, 1,
0.2449876, 0.1730617, 1.383361, 0, 0, 0, 1, 1,
0.2459951, -1.034585, 2.474216, 0, 0, 0, 1, 1,
0.2475402, -0.4321154, 2.351037, 0, 0, 0, 1, 1,
0.2509746, -0.8977228, 2.431104, 1, 1, 1, 1, 1,
0.2513924, -0.7343754, 2.127468, 1, 1, 1, 1, 1,
0.2520569, -0.09320653, 2.360858, 1, 1, 1, 1, 1,
0.2551277, 0.5280592, 0.9653307, 1, 1, 1, 1, 1,
0.2559428, 0.72351, -0.001759341, 1, 1, 1, 1, 1,
0.2612545, 1.014056, 0.6420439, 1, 1, 1, 1, 1,
0.2659849, -0.3254922, 3.904797, 1, 1, 1, 1, 1,
0.2691402, 0.2659231, 1.215845, 1, 1, 1, 1, 1,
0.2697907, 1.351213, 0.331975, 1, 1, 1, 1, 1,
0.2711088, 1.915503, 0.6220557, 1, 1, 1, 1, 1,
0.277478, -0.1389905, 2.39992, 1, 1, 1, 1, 1,
0.2778066, 1.066252, 0.4101317, 1, 1, 1, 1, 1,
0.2779512, -0.4420681, 3.072449, 1, 1, 1, 1, 1,
0.2913175, -0.0469096, 1.940394, 1, 1, 1, 1, 1,
0.2913902, -1.120274, 3.440309, 1, 1, 1, 1, 1,
0.2936475, -0.08204357, 2.430887, 0, 0, 1, 1, 1,
0.2949454, -0.6296573, 2.972449, 1, 0, 0, 1, 1,
0.3002086, 1.4419, 1.054754, 1, 0, 0, 1, 1,
0.3024728, -0.3938232, 1.711911, 1, 0, 0, 1, 1,
0.3038178, 1.629783, 0.02759019, 1, 0, 0, 1, 1,
0.3062224, -0.8028826, 3.454327, 1, 0, 0, 1, 1,
0.3077116, -0.7105922, 0.9335334, 0, 0, 0, 1, 1,
0.3127672, 1.316771, -0.03323048, 0, 0, 0, 1, 1,
0.3131856, -0.4849103, 0.8185786, 0, 0, 0, 1, 1,
0.3132428, -1.266772, 2.591428, 0, 0, 0, 1, 1,
0.3140062, -0.6158122, 2.335224, 0, 0, 0, 1, 1,
0.3173916, 0.314728, 1.828064, 0, 0, 0, 1, 1,
0.3183654, -0.4084411, 2.045952, 0, 0, 0, 1, 1,
0.3195828, 1.563658, -0.113166, 1, 1, 1, 1, 1,
0.3218704, 0.684291, 1.012364, 1, 1, 1, 1, 1,
0.3237224, -1.024771, 2.581899, 1, 1, 1, 1, 1,
0.3239448, 0.1408931, 0.5637789, 1, 1, 1, 1, 1,
0.3246602, -0.8843372, 2.872491, 1, 1, 1, 1, 1,
0.325735, 0.6296604, -1.202568, 1, 1, 1, 1, 1,
0.3289722, -0.4316161, 1.931153, 1, 1, 1, 1, 1,
0.3334617, -0.4138082, 2.239134, 1, 1, 1, 1, 1,
0.3372288, -0.9862279, 2.1222, 1, 1, 1, 1, 1,
0.339202, -0.9813291, 2.645547, 1, 1, 1, 1, 1,
0.3425165, 0.4271747, -1.108984, 1, 1, 1, 1, 1,
0.3445961, -0.03989509, 1.007912, 1, 1, 1, 1, 1,
0.3461724, 0.3421221, 1.803563, 1, 1, 1, 1, 1,
0.3487024, 0.6520063, 0.05599653, 1, 1, 1, 1, 1,
0.352336, 0.4293571, 0.2933294, 1, 1, 1, 1, 1,
0.3523542, -1.169514, 2.923167, 0, 0, 1, 1, 1,
0.3577342, -0.1770935, 2.766683, 1, 0, 0, 1, 1,
0.3609595, 1.230214, -0.1194059, 1, 0, 0, 1, 1,
0.3626937, -0.3987411, 2.214087, 1, 0, 0, 1, 1,
0.3641906, -1.897285, 3.386869, 1, 0, 0, 1, 1,
0.3684787, -0.8833345, 2.443352, 1, 0, 0, 1, 1,
0.372719, 0.5658127, 1.182558, 0, 0, 0, 1, 1,
0.3742477, 0.9814408, 0.5174385, 0, 0, 0, 1, 1,
0.3743569, -0.968559, 2.38535, 0, 0, 0, 1, 1,
0.3760542, 1.157389, -0.9556465, 0, 0, 0, 1, 1,
0.3777303, -1.835285, 2.447432, 0, 0, 0, 1, 1,
0.385704, -1.189269, 1.901154, 0, 0, 0, 1, 1,
0.3922292, 0.1680181, 1.954211, 0, 0, 0, 1, 1,
0.3988392, -0.5374015, 2.740546, 1, 1, 1, 1, 1,
0.4002226, -0.5303507, 2.479509, 1, 1, 1, 1, 1,
0.4015206, 0.4400088, -0.3978452, 1, 1, 1, 1, 1,
0.401824, 1.565017, 1.174578, 1, 1, 1, 1, 1,
0.402217, 0.818077, -0.01949457, 1, 1, 1, 1, 1,
0.4027519, -0.8302361, 1.749475, 1, 1, 1, 1, 1,
0.4043049, 0.05855764, -0.756789, 1, 1, 1, 1, 1,
0.40981, 0.7505366, 1.459472, 1, 1, 1, 1, 1,
0.4099807, 0.415048, -1.470097, 1, 1, 1, 1, 1,
0.4157348, 0.08250653, 0.6441461, 1, 1, 1, 1, 1,
0.4195484, 0.1198198, 1.773866, 1, 1, 1, 1, 1,
0.4206043, 0.3574001, -0.2713236, 1, 1, 1, 1, 1,
0.4272831, 0.1082437, 3.058496, 1, 1, 1, 1, 1,
0.4327377, -0.5592278, 3.616945, 1, 1, 1, 1, 1,
0.4345462, 0.1780182, 1.837663, 1, 1, 1, 1, 1,
0.4351092, -2.810981, 1.943574, 0, 0, 1, 1, 1,
0.4353048, 2.137085, 0.5348045, 1, 0, 0, 1, 1,
0.4358612, -0.2872484, 2.904616, 1, 0, 0, 1, 1,
0.4372348, 1.90714, 0.4992712, 1, 0, 0, 1, 1,
0.4402195, 0.6830888, 0.1720738, 1, 0, 0, 1, 1,
0.4404494, 0.2558754, -0.2332997, 1, 0, 0, 1, 1,
0.4409979, -0.01315043, 2.134178, 0, 0, 0, 1, 1,
0.4519046, 0.8461909, 0.5204282, 0, 0, 0, 1, 1,
0.4536661, 1.31689, 0.2148047, 0, 0, 0, 1, 1,
0.4537665, 1.603837, -0.4356855, 0, 0, 0, 1, 1,
0.4567129, 0.6057609, -1.530167, 0, 0, 0, 1, 1,
0.4568094, -1.134205, 2.22034, 0, 0, 0, 1, 1,
0.4580485, -0.06333717, -0.3551985, 0, 0, 0, 1, 1,
0.4582344, -0.3015908, 2.748767, 1, 1, 1, 1, 1,
0.4639686, 1.057999, 1.359566, 1, 1, 1, 1, 1,
0.4639904, 1.437133, -1.142997, 1, 1, 1, 1, 1,
0.4642368, 0.3659498, 1.690052, 1, 1, 1, 1, 1,
0.4671116, -0.2946329, 1.749011, 1, 1, 1, 1, 1,
0.467133, 0.1875886, 2.240565, 1, 1, 1, 1, 1,
0.4695325, 0.5017685, -0.4742071, 1, 1, 1, 1, 1,
0.4697233, 0.06029638, 1.626327, 1, 1, 1, 1, 1,
0.4753928, 0.1085249, 2.911639, 1, 1, 1, 1, 1,
0.4780691, -0.09389678, 3.327403, 1, 1, 1, 1, 1,
0.4837217, -0.2902112, 2.156399, 1, 1, 1, 1, 1,
0.4864631, 0.07657879, 2.485955, 1, 1, 1, 1, 1,
0.487312, 1.475495, 1.138593, 1, 1, 1, 1, 1,
0.4912154, -0.7802237, 3.716281, 1, 1, 1, 1, 1,
0.4915313, 0.5934127, 1.222374, 1, 1, 1, 1, 1,
0.492748, 0.410028, -0.6490796, 0, 0, 1, 1, 1,
0.4940954, -0.1320201, 0.90714, 1, 0, 0, 1, 1,
0.4960593, 0.2194745, 1.220341, 1, 0, 0, 1, 1,
0.4990306, 0.8050329, 2.073173, 1, 0, 0, 1, 1,
0.5052146, -0.4112274, 1.674127, 1, 0, 0, 1, 1,
0.5088989, 0.3318957, 1.008099, 1, 0, 0, 1, 1,
0.5113616, -0.07011911, 2.208008, 0, 0, 0, 1, 1,
0.5144195, -0.4088022, 3.352408, 0, 0, 0, 1, 1,
0.5146815, -0.3855733, 3.263982, 0, 0, 0, 1, 1,
0.5197799, 0.9827169, -0.6194332, 0, 0, 0, 1, 1,
0.5218653, -0.2054745, 0.2340311, 0, 0, 0, 1, 1,
0.5236878, -0.9031039, 3.128467, 0, 0, 0, 1, 1,
0.5248677, -0.05988426, 3.737343, 0, 0, 0, 1, 1,
0.5249032, 2.840261, -1.026138, 1, 1, 1, 1, 1,
0.5255851, -1.094225, 1.540324, 1, 1, 1, 1, 1,
0.5266335, 0.3535364, 0.6738816, 1, 1, 1, 1, 1,
0.5541897, -0.7128175, 2.962478, 1, 1, 1, 1, 1,
0.5567296, 0.7189311, 1.616755, 1, 1, 1, 1, 1,
0.5591414, -1.017866, 3.709343, 1, 1, 1, 1, 1,
0.5643589, -2.806882, 3.759202, 1, 1, 1, 1, 1,
0.5686563, 0.3539387, 0.7205261, 1, 1, 1, 1, 1,
0.5748293, 1.019964, 0.6937776, 1, 1, 1, 1, 1,
0.5776711, -0.9550382, 2.562391, 1, 1, 1, 1, 1,
0.5792829, -0.7903169, 2.858492, 1, 1, 1, 1, 1,
0.579574, -0.4352968, 2.271199, 1, 1, 1, 1, 1,
0.5801663, 0.3853949, 0.9895861, 1, 1, 1, 1, 1,
0.5835671, -1.274576, 1.534354, 1, 1, 1, 1, 1,
0.5867872, 0.7833636, -0.1055752, 1, 1, 1, 1, 1,
0.5870404, -0.04094585, 2.546783, 0, 0, 1, 1, 1,
0.5893248, 1.540989, -1.341739, 1, 0, 0, 1, 1,
0.5911804, -0.7454213, 3.280124, 1, 0, 0, 1, 1,
0.5921018, 1.435862, 0.3783495, 1, 0, 0, 1, 1,
0.6015348, 0.009688397, 1.968327, 1, 0, 0, 1, 1,
0.6022142, -0.8445557, 2.438618, 1, 0, 0, 1, 1,
0.6040331, -0.477196, 1.053722, 0, 0, 0, 1, 1,
0.6203343, -0.4913891, 3.522146, 0, 0, 0, 1, 1,
0.6211466, 0.8405495, 0.4263509, 0, 0, 0, 1, 1,
0.6228504, -0.3981627, 3.666866, 0, 0, 0, 1, 1,
0.6242711, 0.2354667, 0.04064235, 0, 0, 0, 1, 1,
0.6254393, 1.03029, 0.001771727, 0, 0, 0, 1, 1,
0.625936, 0.5768747, 1.472322, 0, 0, 0, 1, 1,
0.62611, 0.4665, 0.6566679, 1, 1, 1, 1, 1,
0.6270576, 0.5052372, 2.143193, 1, 1, 1, 1, 1,
0.6372313, 0.3378108, 1.179336, 1, 1, 1, 1, 1,
0.6389757, 0.5355576, -0.968338, 1, 1, 1, 1, 1,
0.649506, 0.01373411, 1.156896, 1, 1, 1, 1, 1,
0.6553189, -1.75856, 3.220927, 1, 1, 1, 1, 1,
0.6589949, 1.243338, 1.044021, 1, 1, 1, 1, 1,
0.6596228, -0.01352265, 1.826781, 1, 1, 1, 1, 1,
0.6683467, 0.4004563, 1.187022, 1, 1, 1, 1, 1,
0.6691561, -0.4102863, -0.6911855, 1, 1, 1, 1, 1,
0.6709575, 1.296398, -1.884562, 1, 1, 1, 1, 1,
0.6724369, 0.2931267, 0.8747323, 1, 1, 1, 1, 1,
0.6749499, 1.313264, 1.976297, 1, 1, 1, 1, 1,
0.6785318, 1.890375, 0.6576068, 1, 1, 1, 1, 1,
0.6787804, 1.898133, 1.283644, 1, 1, 1, 1, 1,
0.6798413, 0.05656891, 0.7930775, 0, 0, 1, 1, 1,
0.6841807, 1.432106, 0.7230734, 1, 0, 0, 1, 1,
0.6849744, -0.2087017, 1.386894, 1, 0, 0, 1, 1,
0.6911019, -0.3592207, 2.911284, 1, 0, 0, 1, 1,
0.69374, 0.893144, -0.3274885, 1, 0, 0, 1, 1,
0.6983991, -0.9530609, 4.209195, 1, 0, 0, 1, 1,
0.6999297, 1.431834, 0.6267369, 0, 0, 0, 1, 1,
0.7040167, -0.4012082, 2.019029, 0, 0, 0, 1, 1,
0.7104838, -0.194194, 3.49243, 0, 0, 0, 1, 1,
0.7114779, -1.065511, 2.850618, 0, 0, 0, 1, 1,
0.7179199, -0.4701097, 1.602892, 0, 0, 0, 1, 1,
0.7195634, 0.6209091, 2.084219, 0, 0, 0, 1, 1,
0.7196512, 0.05829455, 1.503849, 0, 0, 0, 1, 1,
0.720337, 0.2496762, 1.764647, 1, 1, 1, 1, 1,
0.7203666, 0.3669943, 1.502225, 1, 1, 1, 1, 1,
0.7206181, 0.7809392, 0.2541342, 1, 1, 1, 1, 1,
0.7290505, -0.3815683, 1.048401, 1, 1, 1, 1, 1,
0.7359087, -1.89433, 2.433168, 1, 1, 1, 1, 1,
0.7404954, 1.570379, -1.664158, 1, 1, 1, 1, 1,
0.740781, -2.169666, 2.488096, 1, 1, 1, 1, 1,
0.7438483, -1.632069, 1.905244, 1, 1, 1, 1, 1,
0.7453173, 1.197648, 0.3993363, 1, 1, 1, 1, 1,
0.7457156, -2.45325, 2.197192, 1, 1, 1, 1, 1,
0.746534, -0.1177059, 1.593429, 1, 1, 1, 1, 1,
0.7535148, 0.92691, 0.9409009, 1, 1, 1, 1, 1,
0.7667007, 0.3087843, 1.04626, 1, 1, 1, 1, 1,
0.7719161, 0.08607687, -0.4800515, 1, 1, 1, 1, 1,
0.774583, -1.171155, 1.196809, 1, 1, 1, 1, 1,
0.7755536, -1.131983, 3.374712, 0, 0, 1, 1, 1,
0.77693, -0.267569, 0.3479596, 1, 0, 0, 1, 1,
0.7771975, 0.09964205, 0.7397467, 1, 0, 0, 1, 1,
0.7917209, 0.6683975, 0.6932256, 1, 0, 0, 1, 1,
0.7919694, 0.7533007, -0.0469677, 1, 0, 0, 1, 1,
0.7924672, 0.1814747, 1.682102, 1, 0, 0, 1, 1,
0.793973, 0.3663471, 2.431309, 0, 0, 0, 1, 1,
0.7997581, -0.9087066, 3.154524, 0, 0, 0, 1, 1,
0.8004444, 0.1330036, 0.3911585, 0, 0, 0, 1, 1,
0.8066376, 1.125541, -0.007943515, 0, 0, 0, 1, 1,
0.807159, 1.135029, 0.5729975, 0, 0, 0, 1, 1,
0.807421, -0.961648, 2.148464, 0, 0, 0, 1, 1,
0.8110809, -0.5702064, 2.006097, 0, 0, 0, 1, 1,
0.8194457, -0.1139813, 0.9196821, 1, 1, 1, 1, 1,
0.8208044, -0.2290919, 0.5896876, 1, 1, 1, 1, 1,
0.82231, -0.3943734, 1.64867, 1, 1, 1, 1, 1,
0.8233408, 0.9017727, 0.7843405, 1, 1, 1, 1, 1,
0.823495, -0.9652492, 2.147649, 1, 1, 1, 1, 1,
0.8284554, 0.03054664, 1.530102, 1, 1, 1, 1, 1,
0.8299266, 0.7715792, 1.97422, 1, 1, 1, 1, 1,
0.8324056, 0.2168588, 2.140778, 1, 1, 1, 1, 1,
0.8329625, -1.124721, 3.888746, 1, 1, 1, 1, 1,
0.8335685, -1.397522, 1.845594, 1, 1, 1, 1, 1,
0.8359639, -0.2529011, 1.933319, 1, 1, 1, 1, 1,
0.8367616, -0.3174079, 4.099803, 1, 1, 1, 1, 1,
0.8371398, -1.144091, 3.286683, 1, 1, 1, 1, 1,
0.8377886, -1.912734, 1.55509, 1, 1, 1, 1, 1,
0.8401788, 0.7865361, -0.326396, 1, 1, 1, 1, 1,
0.8432121, -1.598058, 1.332802, 0, 0, 1, 1, 1,
0.8458534, 0.3913397, 1.52827, 1, 0, 0, 1, 1,
0.8481802, -1.141704, 2.430807, 1, 0, 0, 1, 1,
0.8538816, -0.300438, 2.625608, 1, 0, 0, 1, 1,
0.855055, 1.673533, 0.5136977, 1, 0, 0, 1, 1,
0.8577088, 0.8628469, 2.687862, 1, 0, 0, 1, 1,
0.8593062, 0.2940935, 1.375253, 0, 0, 0, 1, 1,
0.8640739, -0.4440454, 1.195678, 0, 0, 0, 1, 1,
0.8657324, -2.730661, 2.218542, 0, 0, 0, 1, 1,
0.8670336, 0.3696105, 2.34734, 0, 0, 0, 1, 1,
0.8713766, 0.412634, 0.3859162, 0, 0, 0, 1, 1,
0.8737652, -1.459088, 2.398019, 0, 0, 0, 1, 1,
0.8766435, 0.3895686, 0.3362598, 0, 0, 0, 1, 1,
0.8803641, 0.412011, 2.581587, 1, 1, 1, 1, 1,
0.8817097, -0.1181873, 2.095934, 1, 1, 1, 1, 1,
0.8817353, 1.609121, 1.01815, 1, 1, 1, 1, 1,
0.8852912, 1.424397, 0.2958821, 1, 1, 1, 1, 1,
0.8874988, -0.5046511, 1.974898, 1, 1, 1, 1, 1,
0.891152, 0.5957406, 0.866371, 1, 1, 1, 1, 1,
0.8996904, 0.1822868, 0.3620072, 1, 1, 1, 1, 1,
0.906279, -1.709854, 3.183936, 1, 1, 1, 1, 1,
0.9088159, -1.554174, 2.856614, 1, 1, 1, 1, 1,
0.90992, -0.7052448, 1.34405, 1, 1, 1, 1, 1,
0.910652, 0.7576476, 0.8897732, 1, 1, 1, 1, 1,
0.912734, -0.00442182, 1.728985, 1, 1, 1, 1, 1,
0.9165474, -0.2551156, 1.037702, 1, 1, 1, 1, 1,
0.9174852, -0.2722517, -0.3255102, 1, 1, 1, 1, 1,
0.9179894, -1.847361, 1.221234, 1, 1, 1, 1, 1,
0.922765, -0.06824967, 1.320788, 0, 0, 1, 1, 1,
0.9237427, 1.229189, 0.9560886, 1, 0, 0, 1, 1,
0.9262227, 0.3398719, 1.31407, 1, 0, 0, 1, 1,
0.9324853, -0.8548605, 3.06882, 1, 0, 0, 1, 1,
0.9331166, 2.015522, 1.914205, 1, 0, 0, 1, 1,
0.9433566, 0.2372179, 0.7871867, 1, 0, 0, 1, 1,
0.943639, 1.398957, 1.048919, 0, 0, 0, 1, 1,
0.9460197, 0.9775415, -0.6065149, 0, 0, 0, 1, 1,
0.946672, 2.34047, -1.196898, 0, 0, 0, 1, 1,
0.9503763, 0.3589822, 1.198752, 0, 0, 0, 1, 1,
0.9511818, -1.286282, 4.249275, 0, 0, 0, 1, 1,
0.9537733, -0.8102965, 0.9472045, 0, 0, 0, 1, 1,
0.9654069, -0.2161352, 1.972485, 0, 0, 0, 1, 1,
0.9714789, -0.3620428, 3.152882, 1, 1, 1, 1, 1,
0.9715253, -0.1784362, 1.969359, 1, 1, 1, 1, 1,
0.9854161, -0.2879273, 1.689033, 1, 1, 1, 1, 1,
0.9884852, -0.2146551, 0.9315905, 1, 1, 1, 1, 1,
0.9903206, 1.308964, 1.002182, 1, 1, 1, 1, 1,
0.9947518, -1.786892, 2.568631, 1, 1, 1, 1, 1,
0.9959736, 0.8715131, 1.740502, 1, 1, 1, 1, 1,
1.000206, 0.1011189, 1.495245, 1, 1, 1, 1, 1,
1.007294, -1.558747, 4.357437, 1, 1, 1, 1, 1,
1.009237, 1.589928, 0.8779186, 1, 1, 1, 1, 1,
1.012433, -0.4293025, 2.600518, 1, 1, 1, 1, 1,
1.015567, -0.3522729, 1.980407, 1, 1, 1, 1, 1,
1.02601, -1.018714, 3.845966, 1, 1, 1, 1, 1,
1.031079, 0.583576, 1.320269, 1, 1, 1, 1, 1,
1.050795, -0.8005701, 2.480597, 1, 1, 1, 1, 1,
1.052023, 1.380731, 0.3561778, 0, 0, 1, 1, 1,
1.058855, 1.359561, 0.6578512, 1, 0, 0, 1, 1,
1.071725, 0.2144027, 2.723614, 1, 0, 0, 1, 1,
1.072157, -0.6204616, 2.387298, 1, 0, 0, 1, 1,
1.072909, 0.3724521, -0.1232857, 1, 0, 0, 1, 1,
1.088562, -0.7883481, 2.574983, 1, 0, 0, 1, 1,
1.089647, 0.1267484, 1.487969, 0, 0, 0, 1, 1,
1.091054, -0.7181497, 2.72486, 0, 0, 0, 1, 1,
1.09598, -0.01023844, 2.906592, 0, 0, 0, 1, 1,
1.100474, 0.02744986, 1.814751, 0, 0, 0, 1, 1,
1.108042, 1.151273, 1.360273, 0, 0, 0, 1, 1,
1.108074, -0.3002789, 0.1501901, 0, 0, 0, 1, 1,
1.110811, 0.2874051, 2.290232, 0, 0, 0, 1, 1,
1.111096, -2.089573, 3.374165, 1, 1, 1, 1, 1,
1.114816, -0.8621036, 2.414535, 1, 1, 1, 1, 1,
1.115374, -0.3657866, 2.194728, 1, 1, 1, 1, 1,
1.124171, -1.009599, 2.178084, 1, 1, 1, 1, 1,
1.133792, -0.3941827, 0.0636731, 1, 1, 1, 1, 1,
1.151096, 0.3797139, 0.5731114, 1, 1, 1, 1, 1,
1.156109, 1.070134, 1.097481, 1, 1, 1, 1, 1,
1.156245, -0.143251, 3.388703, 1, 1, 1, 1, 1,
1.161218, 1.539492, -0.6888822, 1, 1, 1, 1, 1,
1.161748, 0.1124523, 1.786616, 1, 1, 1, 1, 1,
1.169364, -0.1086848, 1.737461, 1, 1, 1, 1, 1,
1.177631, -0.6101486, 2.927506, 1, 1, 1, 1, 1,
1.185253, -1.956098, 0.8526954, 1, 1, 1, 1, 1,
1.187248, -0.3000885, 1.569569, 1, 1, 1, 1, 1,
1.199999, 0.4470536, 0.6408705, 1, 1, 1, 1, 1,
1.203222, 0.002110281, 0.865256, 0, 0, 1, 1, 1,
1.209876, 0.144874, 1.255339, 1, 0, 0, 1, 1,
1.211677, 1.122341, 1.39913, 1, 0, 0, 1, 1,
1.216618, -1.467064, 2.868915, 1, 0, 0, 1, 1,
1.225471, 0.6456738, 2.686141, 1, 0, 0, 1, 1,
1.228606, 1.533411, 0.796645, 1, 0, 0, 1, 1,
1.22955, -0.6538425, 4.455367, 0, 0, 0, 1, 1,
1.231343, 1.644186, 2.110384, 0, 0, 0, 1, 1,
1.242682, -0.5433448, 0.8930227, 0, 0, 0, 1, 1,
1.242755, 0.1812143, 1.277781, 0, 0, 0, 1, 1,
1.243569, 0.3483931, 1.708505, 0, 0, 0, 1, 1,
1.250934, -0.02904874, 0.9114532, 0, 0, 0, 1, 1,
1.260527, 0.333169, 1.085675, 0, 0, 0, 1, 1,
1.262315, 0.5914267, 1.300764, 1, 1, 1, 1, 1,
1.266127, 1.364081, 1.073182, 1, 1, 1, 1, 1,
1.269248, 2.48154, -0.05084018, 1, 1, 1, 1, 1,
1.270423, 0.5877826, 2.805747, 1, 1, 1, 1, 1,
1.271907, -0.7582888, -0.5315434, 1, 1, 1, 1, 1,
1.275483, -0.3816298, 0.855756, 1, 1, 1, 1, 1,
1.288933, -0.4922245, 2.880375, 1, 1, 1, 1, 1,
1.289453, 0.5550988, -0.2254975, 1, 1, 1, 1, 1,
1.30605, 0.7513572, 1.77264, 1, 1, 1, 1, 1,
1.31135, -0.7178626, 1.370852, 1, 1, 1, 1, 1,
1.31584, 0.7286882, 1.04984, 1, 1, 1, 1, 1,
1.3161, 0.4373919, 1.386923, 1, 1, 1, 1, 1,
1.319075, 1.833857, 1.376005, 1, 1, 1, 1, 1,
1.319167, 0.05545648, 2.387789, 1, 1, 1, 1, 1,
1.319614, -0.7099177, 2.802996, 1, 1, 1, 1, 1,
1.346441, 1.177118, 1.892669, 0, 0, 1, 1, 1,
1.347597, 0.1944739, 0.1942235, 1, 0, 0, 1, 1,
1.354876, 0.9744441, 1.275277, 1, 0, 0, 1, 1,
1.3598, -1.908954, 2.667019, 1, 0, 0, 1, 1,
1.360897, -0.1990505, 2.010138, 1, 0, 0, 1, 1,
1.362386, -0.7262636, 1.994417, 1, 0, 0, 1, 1,
1.36521, 1.520413, 0.2352257, 0, 0, 0, 1, 1,
1.372685, -0.9517334, 1.748101, 0, 0, 0, 1, 1,
1.379544, 0.1092005, -1.165382, 0, 0, 0, 1, 1,
1.387054, 1.080507, -1.140546, 0, 0, 0, 1, 1,
1.388437, 0.1107776, 0.63285, 0, 0, 0, 1, 1,
1.409962, 0.157328, 1.246277, 0, 0, 0, 1, 1,
1.411647, -1.661519, 1.879004, 0, 0, 0, 1, 1,
1.41627, 1.48209, 1.367301, 1, 1, 1, 1, 1,
1.431409, 0.1717941, 1.523803, 1, 1, 1, 1, 1,
1.433706, -0.5556694, 1.081227, 1, 1, 1, 1, 1,
1.436547, 1.24278, 0.1152636, 1, 1, 1, 1, 1,
1.440602, 1.128999, 1.762338, 1, 1, 1, 1, 1,
1.447637, -0.2947313, 2.36385, 1, 1, 1, 1, 1,
1.455318, 0.8959377, 1.029948, 1, 1, 1, 1, 1,
1.457541, -0.909034, 2.628652, 1, 1, 1, 1, 1,
1.466379, 0.2009996, 1.825501, 1, 1, 1, 1, 1,
1.482192, 1.269688, 1.727814, 1, 1, 1, 1, 1,
1.490112, -0.1420606, 1.46594, 1, 1, 1, 1, 1,
1.490175, 1.678532, -2.540221, 1, 1, 1, 1, 1,
1.501833, 0.0007416042, 3.769534, 1, 1, 1, 1, 1,
1.519949, -0.3659638, 0.8734626, 1, 1, 1, 1, 1,
1.520361, 1.118525, 0.826964, 1, 1, 1, 1, 1,
1.5238, 2.300713, 0.3073434, 0, 0, 1, 1, 1,
1.52502, -1.200007, 2.889627, 1, 0, 0, 1, 1,
1.527725, -0.9834737, 1.986638, 1, 0, 0, 1, 1,
1.535075, -0.9508381, 2.603128, 1, 0, 0, 1, 1,
1.538882, -0.3231035, 1.449318, 1, 0, 0, 1, 1,
1.544492, -1.209736, 2.033249, 1, 0, 0, 1, 1,
1.56326, 0.1798245, 2.938958, 0, 0, 0, 1, 1,
1.576357, -0.3143272, 2.690661, 0, 0, 0, 1, 1,
1.577915, 0.5392032, 0.3920808, 0, 0, 0, 1, 1,
1.581294, -0.9865028, 0.6630865, 0, 0, 0, 1, 1,
1.582497, 0.2892362, 2.938478, 0, 0, 0, 1, 1,
1.583794, 0.5688349, 0.7106838, 0, 0, 0, 1, 1,
1.595543, -0.5573986, 0.7879358, 0, 0, 0, 1, 1,
1.60851, 0.8972055, -0.4644481, 1, 1, 1, 1, 1,
1.611267, -1.203684, 1.560099, 1, 1, 1, 1, 1,
1.612784, -0.2218053, -0.07153364, 1, 1, 1, 1, 1,
1.615754, -0.5263044, 2.570334, 1, 1, 1, 1, 1,
1.626428, 0.7262505, 1.710741, 1, 1, 1, 1, 1,
1.627308, -1.511749, 0.9296538, 1, 1, 1, 1, 1,
1.630992, 0.9365799, 2.278341, 1, 1, 1, 1, 1,
1.636382, 0.4741719, 1.610768, 1, 1, 1, 1, 1,
1.656871, 1.353654, 1.155813, 1, 1, 1, 1, 1,
1.665023, 0.1864119, 1.771359, 1, 1, 1, 1, 1,
1.690555, 0.8844278, -0.2061104, 1, 1, 1, 1, 1,
1.693324, -1.957934, 2.600734, 1, 1, 1, 1, 1,
1.702734, 0.7253093, 0.7729443, 1, 1, 1, 1, 1,
1.72043, -0.6471863, 1.496941, 1, 1, 1, 1, 1,
1.723257, 0.02460271, 3.467682, 1, 1, 1, 1, 1,
1.732629, -1.570429, 1.808791, 0, 0, 1, 1, 1,
1.739902, -0.4140078, 2.238886, 1, 0, 0, 1, 1,
1.743114, -1.671636, 1.490755, 1, 0, 0, 1, 1,
1.745657, 0.4739127, 1.287435, 1, 0, 0, 1, 1,
1.765782, 0.2632328, -0.4540025, 1, 0, 0, 1, 1,
1.773662, 0.4347395, 1.926338, 1, 0, 0, 1, 1,
1.776255, -0.07008147, 1.571641, 0, 0, 0, 1, 1,
1.791317, -0.1563494, 0.5505345, 0, 0, 0, 1, 1,
1.807043, 0.9470855, -0.03788578, 0, 0, 0, 1, 1,
1.812342, -1.760889, 1.508574, 0, 0, 0, 1, 1,
1.820643, -0.9347498, -0.1773181, 0, 0, 0, 1, 1,
1.84056, -0.01250235, 0.2362069, 0, 0, 0, 1, 1,
1.850293, -1.526107, 1.651659, 0, 0, 0, 1, 1,
1.854022, -2.021141, 2.692453, 1, 1, 1, 1, 1,
1.858536, 0.9998636, -0.5656946, 1, 1, 1, 1, 1,
1.870197, 0.1441913, 2.750227, 1, 1, 1, 1, 1,
1.881856, 0.8138934, 1.83717, 1, 1, 1, 1, 1,
1.8886, 0.0367936, 1.621251, 1, 1, 1, 1, 1,
1.88983, 0.2530824, 1.132079, 1, 1, 1, 1, 1,
1.895384, -1.804618, -0.3915767, 1, 1, 1, 1, 1,
1.896235, -0.1372259, 1.198277, 1, 1, 1, 1, 1,
1.903805, -1.359049, 1.887181, 1, 1, 1, 1, 1,
1.914376, 0.6365911, 2.878506, 1, 1, 1, 1, 1,
1.920753, -0.1632037, 0.8020915, 1, 1, 1, 1, 1,
1.948537, -0.247655, 0.1264635, 1, 1, 1, 1, 1,
1.950768, -0.3954643, 3.099506, 1, 1, 1, 1, 1,
1.954832, 0.4422041, 2.100629, 1, 1, 1, 1, 1,
1.968708, 1.6279, 1.202255, 1, 1, 1, 1, 1,
1.974519, 2.343755, 0.02123205, 0, 0, 1, 1, 1,
2.005404, 1.786575, 1.219295, 1, 0, 0, 1, 1,
2.037846, 1.297656, 0.4452393, 1, 0, 0, 1, 1,
2.043659, 0.4113718, 1.017557, 1, 0, 0, 1, 1,
2.086038, -1.305694, 2.273826, 1, 0, 0, 1, 1,
2.168517, 0.5520468, 1.288934, 1, 0, 0, 1, 1,
2.198232, -0.4757499, 2.297906, 0, 0, 0, 1, 1,
2.378657, -0.0683705, 3.066486, 0, 0, 0, 1, 1,
2.420493, -0.3665316, 1.400671, 0, 0, 0, 1, 1,
2.421001, 0.5849403, 1.466008, 0, 0, 0, 1, 1,
2.452011, 0.4168734, 3.733174, 0, 0, 0, 1, 1,
2.657345, 1.142014, 1.102584, 0, 0, 0, 1, 1,
2.740764, -0.4583372, 2.137248, 0, 0, 0, 1, 1,
2.742004, -0.6372544, 0.1064146, 1, 1, 1, 1, 1,
2.751877, 1.609128, -0.1157367, 1, 1, 1, 1, 1,
2.969965, -0.6736385, 3.634371, 1, 1, 1, 1, 1,
2.980061, 0.7371945, 0.8149318, 1, 1, 1, 1, 1,
3.035328, 1.056232, -0.01175775, 1, 1, 1, 1, 1,
3.252838, 0.002477781, 2.078367, 1, 1, 1, 1, 1,
3.470854, 0.09046268, 0.7371105, 1, 1, 1, 1, 1
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
var radius = 9.435188;
var distance = 33.14069;
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
mvMatrix.translate( -0.1754212, 0.06142914, 0.4240611 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.14069);
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