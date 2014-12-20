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
-2.855918, 0.02731232, -2.095475, 1, 0, 0, 1,
-2.571208, -1.259008, -2.757669, 1, 0.007843138, 0, 1,
-2.448648, 0.239795, -1.172734, 1, 0.01176471, 0, 1,
-2.432874, 0.5336867, -3.085169, 1, 0.01960784, 0, 1,
-2.361892, 0.267257, -0.9851941, 1, 0.02352941, 0, 1,
-2.343621, 0.4474138, -0.3651001, 1, 0.03137255, 0, 1,
-2.311656, 0.3851055, -1.871351, 1, 0.03529412, 0, 1,
-2.309517, 0.1587463, -0.9541171, 1, 0.04313726, 0, 1,
-2.283994, -0.8383918, -2.575222, 1, 0.04705882, 0, 1,
-2.267386, -0.3655033, -0.1217897, 1, 0.05490196, 0, 1,
-2.261359, 0.1885105, 0.5167864, 1, 0.05882353, 0, 1,
-2.229871, -1.507397, -2.571226, 1, 0.06666667, 0, 1,
-2.192497, 1.877432, -1.713431, 1, 0.07058824, 0, 1,
-2.183969, -0.9283322, -2.03754, 1, 0.07843138, 0, 1,
-2.170253, -0.6296301, -3.943, 1, 0.08235294, 0, 1,
-2.167224, 0.0275686, -1.349374, 1, 0.09019608, 0, 1,
-2.115283, 0.08526155, -2.280401, 1, 0.09411765, 0, 1,
-2.100385, -0.1024619, -1.490968, 1, 0.1019608, 0, 1,
-2.046988, 1.327425, 0.3781095, 1, 0.1098039, 0, 1,
-2.006706, 0.1543996, -3.111816, 1, 0.1137255, 0, 1,
-1.999876, 0.5367827, -2.286912, 1, 0.1215686, 0, 1,
-1.988262, 1.049974, -1.96958, 1, 0.1254902, 0, 1,
-1.968414, 0.0478363, -3.643469, 1, 0.1333333, 0, 1,
-1.964835, -0.7785332, -2.188678, 1, 0.1372549, 0, 1,
-1.954157, 0.7758859, -1.689992, 1, 0.145098, 0, 1,
-1.946055, -0.862346, -2.412236, 1, 0.1490196, 0, 1,
-1.910654, 1.292502, -2.702213, 1, 0.1568628, 0, 1,
-1.90154, 1.020509, -1.751665, 1, 0.1607843, 0, 1,
-1.894607, -1.016046, -0.9694259, 1, 0.1686275, 0, 1,
-1.886028, 0.2402611, -3.077638, 1, 0.172549, 0, 1,
-1.874675, 2.015832, -1.374144, 1, 0.1803922, 0, 1,
-1.87337, -1.635692, 0.8253903, 1, 0.1843137, 0, 1,
-1.859607, 0.1400563, -2.43235, 1, 0.1921569, 0, 1,
-1.849669, 0.5976368, -4.123561, 1, 0.1960784, 0, 1,
-1.845414, 0.1002675, -2.933714, 1, 0.2039216, 0, 1,
-1.83135, -0.8484997, -1.95657, 1, 0.2117647, 0, 1,
-1.82217, -0.2844909, -1.30498, 1, 0.2156863, 0, 1,
-1.810784, 0.3936201, -1.702873, 1, 0.2235294, 0, 1,
-1.81007, 1.076735, -1.581942, 1, 0.227451, 0, 1,
-1.799937, -0.05149743, -1.439382, 1, 0.2352941, 0, 1,
-1.786723, 0.352775, -1.315693, 1, 0.2392157, 0, 1,
-1.785385, -0.315677, -2.17994, 1, 0.2470588, 0, 1,
-1.784998, 0.01156662, -0.8535348, 1, 0.2509804, 0, 1,
-1.778793, -0.4256944, -2.503856, 1, 0.2588235, 0, 1,
-1.74847, 1.224257, -0.4261751, 1, 0.2627451, 0, 1,
-1.746339, 0.872744, 0.09930538, 1, 0.2705882, 0, 1,
-1.731834, 0.3625265, -0.8755506, 1, 0.2745098, 0, 1,
-1.719455, 1.64933, -0.898799, 1, 0.282353, 0, 1,
-1.717362, 0.7622272, -3.269988, 1, 0.2862745, 0, 1,
-1.708273, 0.1819168, -2.487287, 1, 0.2941177, 0, 1,
-1.694642, -0.614014, -1.964713, 1, 0.3019608, 0, 1,
-1.677561, 0.2327994, -1.058563, 1, 0.3058824, 0, 1,
-1.67301, -0.4317141, -1.796388, 1, 0.3137255, 0, 1,
-1.67125, -0.1212085, -2.132677, 1, 0.3176471, 0, 1,
-1.659162, -0.2383543, -1.698652, 1, 0.3254902, 0, 1,
-1.631565, -0.8278399, -2.032391, 1, 0.3294118, 0, 1,
-1.625943, 0.4572078, -1.354174, 1, 0.3372549, 0, 1,
-1.61709, -2.442689, -2.165105, 1, 0.3411765, 0, 1,
-1.616197, 0.8231583, -0.9151464, 1, 0.3490196, 0, 1,
-1.600431, -2.084743, -2.351631, 1, 0.3529412, 0, 1,
-1.598385, -1.402742, -1.44389, 1, 0.3607843, 0, 1,
-1.595642, -0.7751543, -2.086568, 1, 0.3647059, 0, 1,
-1.585901, 1.191548, -1.07321, 1, 0.372549, 0, 1,
-1.574714, 0.1766261, -0.6318864, 1, 0.3764706, 0, 1,
-1.572571, 0.2698531, -2.957162, 1, 0.3843137, 0, 1,
-1.562703, -1.176776, -1.105185, 1, 0.3882353, 0, 1,
-1.561932, -0.2001968, -1.321735, 1, 0.3960784, 0, 1,
-1.543408, -0.6064966, -1.278069, 1, 0.4039216, 0, 1,
-1.538378, -0.6722483, -3.340129, 1, 0.4078431, 0, 1,
-1.536899, -3.312679, -4.474366, 1, 0.4156863, 0, 1,
-1.512929, 2.036277, 0.2217504, 1, 0.4196078, 0, 1,
-1.512678, -0.3720404, -2.108258, 1, 0.427451, 0, 1,
-1.509073, 0.1332783, 0.3931669, 1, 0.4313726, 0, 1,
-1.508684, -1.011403, -3.661829, 1, 0.4392157, 0, 1,
-1.497332, 0.4075613, -0.9911969, 1, 0.4431373, 0, 1,
-1.496807, 0.3230051, -2.00346, 1, 0.4509804, 0, 1,
-1.496413, 0.4839663, -1.218002, 1, 0.454902, 0, 1,
-1.487306, -1.608999, -2.655371, 1, 0.4627451, 0, 1,
-1.482793, 0.7821828, 0.3066477, 1, 0.4666667, 0, 1,
-1.466387, -0.01961774, -1.260524, 1, 0.4745098, 0, 1,
-1.457977, 0.9979665, -2.182093, 1, 0.4784314, 0, 1,
-1.456547, -0.4766121, -1.473631, 1, 0.4862745, 0, 1,
-1.448497, 1.323185, 0.08040135, 1, 0.4901961, 0, 1,
-1.445505, -0.4065814, 0.04908288, 1, 0.4980392, 0, 1,
-1.441985, 0.9653468, 0.9466863, 1, 0.5058824, 0, 1,
-1.434598, -2.056412, -1.546716, 1, 0.509804, 0, 1,
-1.430531, 0.8759919, -0.8951846, 1, 0.5176471, 0, 1,
-1.41926, 0.9554384, -2.839176, 1, 0.5215687, 0, 1,
-1.416039, 0.5881795, -1.261635, 1, 0.5294118, 0, 1,
-1.414784, -0.4038534, -1.0165, 1, 0.5333334, 0, 1,
-1.403704, -0.1282546, -1.68919, 1, 0.5411765, 0, 1,
-1.401558, 2.794418, 0.31923, 1, 0.5450981, 0, 1,
-1.395119, 0.2513485, -0.7271531, 1, 0.5529412, 0, 1,
-1.38591, -0.1814118, -2.676688, 1, 0.5568628, 0, 1,
-1.38572, 0.04829052, -0.6025553, 1, 0.5647059, 0, 1,
-1.37811, 0.1838218, -1.206081, 1, 0.5686275, 0, 1,
-1.377491, -0.9631772, -3.102155, 1, 0.5764706, 0, 1,
-1.37521, -1.542084, -2.875997, 1, 0.5803922, 0, 1,
-1.371234, -1.141285, -3.013345, 1, 0.5882353, 0, 1,
-1.367335, 1.337906, 2.345772, 1, 0.5921569, 0, 1,
-1.360082, 0.8310786, -2.075778, 1, 0.6, 0, 1,
-1.35891, -1.694521, -3.318787, 1, 0.6078432, 0, 1,
-1.355107, 0.07928023, -1.393335, 1, 0.6117647, 0, 1,
-1.34261, 1.752973, -0.0153086, 1, 0.6196079, 0, 1,
-1.32213, -0.5179839, -2.18551, 1, 0.6235294, 0, 1,
-1.320008, -0.2515675, -1.56353, 1, 0.6313726, 0, 1,
-1.315782, 1.38014, -2.419405, 1, 0.6352941, 0, 1,
-1.299557, 0.9491836, -1.512755, 1, 0.6431373, 0, 1,
-1.298954, 0.5147535, -2.445407, 1, 0.6470588, 0, 1,
-1.29488, -1.130828, -1.586126, 1, 0.654902, 0, 1,
-1.293005, -0.1032544, -1.708986, 1, 0.6588235, 0, 1,
-1.286839, -0.1234611, -1.190567, 1, 0.6666667, 0, 1,
-1.282424, 2.259785, 1.041281, 1, 0.6705883, 0, 1,
-1.281743, -0.08988199, -2.007341, 1, 0.6784314, 0, 1,
-1.27909, 0.62341, -0.685711, 1, 0.682353, 0, 1,
-1.275813, -0.2398539, -1.539493, 1, 0.6901961, 0, 1,
-1.271764, -0.6230254, -1.942688, 1, 0.6941177, 0, 1,
-1.271002, 2.305629, 0.005278639, 1, 0.7019608, 0, 1,
-1.265234, -0.9927059, -3.634372, 1, 0.7098039, 0, 1,
-1.263917, -0.3665605, -1.621684, 1, 0.7137255, 0, 1,
-1.260715, -1.370062, -1.078514, 1, 0.7215686, 0, 1,
-1.232929, 0.244024, -0.8554801, 1, 0.7254902, 0, 1,
-1.229965, 0.287308, -1.31558, 1, 0.7333333, 0, 1,
-1.222962, 0.3348044, -1.912913, 1, 0.7372549, 0, 1,
-1.196215, -0.6696348, -1.182162, 1, 0.7450981, 0, 1,
-1.190852, -0.3406542, -0.8491884, 1, 0.7490196, 0, 1,
-1.189398, -1.093808, -2.977917, 1, 0.7568628, 0, 1,
-1.187339, -1.099606, -1.765024, 1, 0.7607843, 0, 1,
-1.185921, 0.5132033, -0.8275076, 1, 0.7686275, 0, 1,
-1.185085, 0.7972927, -2.025944, 1, 0.772549, 0, 1,
-1.161908, -1.236903, -1.974971, 1, 0.7803922, 0, 1,
-1.155556, -1.235417, -3.023593, 1, 0.7843137, 0, 1,
-1.143368, 0.1521577, -1.533772, 1, 0.7921569, 0, 1,
-1.142575, -0.4006142, -1.482082, 1, 0.7960784, 0, 1,
-1.136307, 0.5524858, -1.094864, 1, 0.8039216, 0, 1,
-1.116704, 1.533941, -0.03377352, 1, 0.8117647, 0, 1,
-1.115048, 1.193317, -2.515886, 1, 0.8156863, 0, 1,
-1.103722, 1.482106, -0.01579442, 1, 0.8235294, 0, 1,
-1.103022, 0.8474696, -0.9570773, 1, 0.827451, 0, 1,
-1.102417, -0.2353007, -1.773038, 1, 0.8352941, 0, 1,
-1.098597, -0.1780132, -2.736092, 1, 0.8392157, 0, 1,
-1.094938, -1.758837, -3.212137, 1, 0.8470588, 0, 1,
-1.084927, -1.260253, -2.696519, 1, 0.8509804, 0, 1,
-1.076234, -0.8387929, -0.09176037, 1, 0.8588235, 0, 1,
-1.073923, -0.9098688, -1.741522, 1, 0.8627451, 0, 1,
-1.073572, -0.2564565, -0.3951855, 1, 0.8705882, 0, 1,
-1.070716, 0.3042626, 0.07609583, 1, 0.8745098, 0, 1,
-1.066869, 0.2213791, -1.819998, 1, 0.8823529, 0, 1,
-1.064753, 0.5442035, -1.589858, 1, 0.8862745, 0, 1,
-1.061565, -0.1946373, -1.365696, 1, 0.8941177, 0, 1,
-1.05705, 0.3929558, -2.034487, 1, 0.8980392, 0, 1,
-1.046358, 1.005819, -0.1946767, 1, 0.9058824, 0, 1,
-1.039029, -0.2086839, -1.493845, 1, 0.9137255, 0, 1,
-1.038398, -1.619741, -2.731166, 1, 0.9176471, 0, 1,
-1.037572, -0.9007878, -1.484063, 1, 0.9254902, 0, 1,
-1.02808, -0.6973222, -3.234075, 1, 0.9294118, 0, 1,
-1.019119, 0.09403044, -1.610187, 1, 0.9372549, 0, 1,
-1.018636, 1.487087, 1.096149, 1, 0.9411765, 0, 1,
-1.016862, 0.3892885, -1.876997, 1, 0.9490196, 0, 1,
-1.015005, -1.71829, -3.092467, 1, 0.9529412, 0, 1,
-1.006117, -0.1637453, -2.268343, 1, 0.9607843, 0, 1,
-1.003604, 0.6341413, -1.502526, 1, 0.9647059, 0, 1,
-1.002432, -0.8581432, -2.95862, 1, 0.972549, 0, 1,
-0.9978998, -0.7767767, -1.281794, 1, 0.9764706, 0, 1,
-0.9927747, -0.7615854, -0.3906566, 1, 0.9843137, 0, 1,
-0.9917125, -0.5054198, -0.6549776, 1, 0.9882353, 0, 1,
-0.989876, 0.1878888, -0.8997443, 1, 0.9960784, 0, 1,
-0.9897925, -0.6539465, -0.06611942, 0.9960784, 1, 0, 1,
-0.9886534, -1.633933, -2.698862, 0.9921569, 1, 0, 1,
-0.9869342, 1.010874, -1.87062, 0.9843137, 1, 0, 1,
-0.9701431, -0.807443, -2.280707, 0.9803922, 1, 0, 1,
-0.9628011, 0.1541905, -1.508588, 0.972549, 1, 0, 1,
-0.951674, -1.759834, -1.671718, 0.9686275, 1, 0, 1,
-0.9464501, -0.4632272, -1.063138, 0.9607843, 1, 0, 1,
-0.9388545, -0.0601417, -2.950292, 0.9568627, 1, 0, 1,
-0.9383485, 0.5653933, -1.283381, 0.9490196, 1, 0, 1,
-0.9360008, 0.6269693, -2.162437, 0.945098, 1, 0, 1,
-0.9292831, 0.4029197, 0.2600297, 0.9372549, 1, 0, 1,
-0.9288189, 2.637465, 1.70298, 0.9333333, 1, 0, 1,
-0.9285964, 1.424498, 0.0301736, 0.9254902, 1, 0, 1,
-0.92795, 1.428272, -1.917282, 0.9215686, 1, 0, 1,
-0.92516, -1.305735, -4.337023, 0.9137255, 1, 0, 1,
-0.9225644, 0.5924456, -1.923331, 0.9098039, 1, 0, 1,
-0.9147351, -1.126407, -1.293578, 0.9019608, 1, 0, 1,
-0.9097645, -0.06960934, -0.595499, 0.8941177, 1, 0, 1,
-0.9073502, -2.171183, -1.739131, 0.8901961, 1, 0, 1,
-0.9067997, 0.4155838, -1.10186, 0.8823529, 1, 0, 1,
-0.8991094, 0.1910897, -1.929429, 0.8784314, 1, 0, 1,
-0.8978256, 0.03755279, -1.99156, 0.8705882, 1, 0, 1,
-0.8964661, 0.5889085, -0.8013697, 0.8666667, 1, 0, 1,
-0.8961794, -1.512997, -3.070242, 0.8588235, 1, 0, 1,
-0.892097, 0.2884808, -1.677703, 0.854902, 1, 0, 1,
-0.891081, -0.287087, -2.206795, 0.8470588, 1, 0, 1,
-0.8909204, 0.2795532, -1.390884, 0.8431373, 1, 0, 1,
-0.8905954, 0.8825486, -0.8604053, 0.8352941, 1, 0, 1,
-0.8889295, -0.01134049, -0.1085913, 0.8313726, 1, 0, 1,
-0.8812012, -0.2386966, -1.953533, 0.8235294, 1, 0, 1,
-0.8751791, 0.8543804, -1.056362, 0.8196079, 1, 0, 1,
-0.8701428, 1.161908, 0.1238342, 0.8117647, 1, 0, 1,
-0.8601531, 0.4354435, -1.516534, 0.8078431, 1, 0, 1,
-0.8591414, 2.107944, 0.1615449, 0.8, 1, 0, 1,
-0.8557791, -1.537681, -1.236524, 0.7921569, 1, 0, 1,
-0.8554674, -0.2299575, -2.94816, 0.7882353, 1, 0, 1,
-0.8426903, 1.377264, 1.053315, 0.7803922, 1, 0, 1,
-0.8397292, 1.314865, -0.8573979, 0.7764706, 1, 0, 1,
-0.8386247, 1.198747, -0.282178, 0.7686275, 1, 0, 1,
-0.8385568, 0.7813059, -0.546324, 0.7647059, 1, 0, 1,
-0.8378138, 0.9479609, -2.754291, 0.7568628, 1, 0, 1,
-0.8351221, 0.481163, -1.204819, 0.7529412, 1, 0, 1,
-0.8331646, -0.8586867, -2.503393, 0.7450981, 1, 0, 1,
-0.8327177, 0.06455933, -2.707566, 0.7411765, 1, 0, 1,
-0.8307893, -0.0005389572, -0.3744207, 0.7333333, 1, 0, 1,
-0.830759, -1.59846, -3.132427, 0.7294118, 1, 0, 1,
-0.8298407, -0.7110963, -3.196673, 0.7215686, 1, 0, 1,
-0.8246322, 1.525978, -0.379133, 0.7176471, 1, 0, 1,
-0.8245312, -0.1204099, -1.647872, 0.7098039, 1, 0, 1,
-0.8172291, -0.8041335, -3.86702, 0.7058824, 1, 0, 1,
-0.8162345, -0.7977248, -3.287014, 0.6980392, 1, 0, 1,
-0.8144405, 1.588473, -0.6367618, 0.6901961, 1, 0, 1,
-0.8062342, 1.513467, -0.3166747, 0.6862745, 1, 0, 1,
-0.8050363, 0.6306355, -0.4220475, 0.6784314, 1, 0, 1,
-0.79963, 0.8658987, -0.4154039, 0.6745098, 1, 0, 1,
-0.7938048, -0.09485729, -1.165843, 0.6666667, 1, 0, 1,
-0.7917521, 1.193544, 0.8263155, 0.6627451, 1, 0, 1,
-0.7847117, 0.9564995, -1.263162, 0.654902, 1, 0, 1,
-0.7825184, -0.2801496, -1.772145, 0.6509804, 1, 0, 1,
-0.7800372, 0.6125311, -2.098895, 0.6431373, 1, 0, 1,
-0.7761126, -0.1543749, -1.740172, 0.6392157, 1, 0, 1,
-0.7743049, 0.2499822, -0.03468057, 0.6313726, 1, 0, 1,
-0.7740796, -0.1410321, -2.395829, 0.627451, 1, 0, 1,
-0.7739041, -2.002017, -2.694041, 0.6196079, 1, 0, 1,
-0.7711725, -2.687047, -2.517576, 0.6156863, 1, 0, 1,
-0.7681052, -1.967769, -1.10813, 0.6078432, 1, 0, 1,
-0.7626463, -1.14909, -2.455888, 0.6039216, 1, 0, 1,
-0.7619219, 1.282675, -1.010455, 0.5960785, 1, 0, 1,
-0.759634, -0.346047, -1.697847, 0.5882353, 1, 0, 1,
-0.7532478, 0.7426351, -0.3567503, 0.5843138, 1, 0, 1,
-0.7522781, -0.3013372, -2.198107, 0.5764706, 1, 0, 1,
-0.7481872, 1.370832, 1.522747, 0.572549, 1, 0, 1,
-0.7461147, 1.225175, -0.20077, 0.5647059, 1, 0, 1,
-0.744309, -0.3949519, 0.003964642, 0.5607843, 1, 0, 1,
-0.7399681, 1.288103, -2.375641, 0.5529412, 1, 0, 1,
-0.7394486, 0.2073336, -1.405128, 0.5490196, 1, 0, 1,
-0.7336668, 0.176542, -1.226463, 0.5411765, 1, 0, 1,
-0.7314575, -0.5485535, -2.396708, 0.5372549, 1, 0, 1,
-0.730787, -0.7937943, -2.641685, 0.5294118, 1, 0, 1,
-0.7279145, 0.873094, -0.352783, 0.5254902, 1, 0, 1,
-0.7271131, 0.4532574, -1.45145, 0.5176471, 1, 0, 1,
-0.7259443, -2.240949, -3.162088, 0.5137255, 1, 0, 1,
-0.7213179, -0.766803, -0.8690756, 0.5058824, 1, 0, 1,
-0.7197925, -0.2676589, -2.580038, 0.5019608, 1, 0, 1,
-0.7178167, 0.5303053, -0.6318707, 0.4941176, 1, 0, 1,
-0.717182, 1.346573, -1.09372, 0.4862745, 1, 0, 1,
-0.7143967, 0.7297961, -1.533364, 0.4823529, 1, 0, 1,
-0.7088753, 1.417896, 0.1478089, 0.4745098, 1, 0, 1,
-0.7068597, -0.08201771, 0.3577129, 0.4705882, 1, 0, 1,
-0.7061438, -2.175454, -3.733814, 0.4627451, 1, 0, 1,
-0.6953751, 1.112214, 1.02013, 0.4588235, 1, 0, 1,
-0.6947972, 1.257905, 1.182239, 0.4509804, 1, 0, 1,
-0.686535, 1.58418, 0.3607394, 0.4470588, 1, 0, 1,
-0.6835428, 1.686298, -0.7224044, 0.4392157, 1, 0, 1,
-0.6776397, -1.014669, -1.91524, 0.4352941, 1, 0, 1,
-0.6762289, -1.230737, -1.710448, 0.427451, 1, 0, 1,
-0.6746863, -0.8243128, -2.71306, 0.4235294, 1, 0, 1,
-0.6722811, 1.48013, 0.5038037, 0.4156863, 1, 0, 1,
-0.6679328, 1.537032, -0.1488744, 0.4117647, 1, 0, 1,
-0.6678373, 1.023345, -1.368482, 0.4039216, 1, 0, 1,
-0.6653903, -0.5571881, -0.4464011, 0.3960784, 1, 0, 1,
-0.6651101, -0.6555898, -1.77614, 0.3921569, 1, 0, 1,
-0.6605116, 0.2820637, -0.7980015, 0.3843137, 1, 0, 1,
-0.6595947, -1.273782, -2.558127, 0.3803922, 1, 0, 1,
-0.6552009, 0.6964211, -1.962613, 0.372549, 1, 0, 1,
-0.6542548, -0.4819722, -1.096536, 0.3686275, 1, 0, 1,
-0.6541755, 0.6165337, -1.560659, 0.3607843, 1, 0, 1,
-0.6490141, 0.4565336, -1.553085, 0.3568628, 1, 0, 1,
-0.6409832, 0.2935445, -0.4351339, 0.3490196, 1, 0, 1,
-0.6379502, 2.456169, -1.070962, 0.345098, 1, 0, 1,
-0.6369914, -0.3540761, -2.473552, 0.3372549, 1, 0, 1,
-0.6349255, 0.2304597, -2.232426, 0.3333333, 1, 0, 1,
-0.6328206, -0.3971436, -2.26106, 0.3254902, 1, 0, 1,
-0.6303868, -0.9494883, -2.650345, 0.3215686, 1, 0, 1,
-0.6264831, 0.361307, -0.9631818, 0.3137255, 1, 0, 1,
-0.6246222, 0.9258841, -1.459182, 0.3098039, 1, 0, 1,
-0.6187749, 0.7213611, -3.003047, 0.3019608, 1, 0, 1,
-0.6164427, -0.8426768, -0.7169595, 0.2941177, 1, 0, 1,
-0.6152924, -0.3647361, -2.400885, 0.2901961, 1, 0, 1,
-0.614062, 1.569062, 1.446647, 0.282353, 1, 0, 1,
-0.606814, 2.075753, 0.7033862, 0.2784314, 1, 0, 1,
-0.6064354, -1.457497, -3.195318, 0.2705882, 1, 0, 1,
-0.6058657, -0.7958462, -2.668946, 0.2666667, 1, 0, 1,
-0.6053697, 0.3845075, -2.510092, 0.2588235, 1, 0, 1,
-0.5996419, -1.971491, -1.839664, 0.254902, 1, 0, 1,
-0.592492, 1.297021, -1.415356, 0.2470588, 1, 0, 1,
-0.5893295, -0.1855478, -1.354786, 0.2431373, 1, 0, 1,
-0.5859752, -1.041695, -2.680647, 0.2352941, 1, 0, 1,
-0.5833603, 0.2299011, 0.8468654, 0.2313726, 1, 0, 1,
-0.5789148, -0.01270547, -1.824202, 0.2235294, 1, 0, 1,
-0.5752413, 0.1002124, -2.779067, 0.2196078, 1, 0, 1,
-0.5692574, 0.4591781, -0.509399, 0.2117647, 1, 0, 1,
-0.5667049, 0.9354171, -0.2725016, 0.2078431, 1, 0, 1,
-0.5643831, 0.2231923, -0.2327527, 0.2, 1, 0, 1,
-0.561901, 1.218829, -0.09718034, 0.1921569, 1, 0, 1,
-0.5616978, 0.7826611, -0.826956, 0.1882353, 1, 0, 1,
-0.5591936, -0.6075454, -3.506962, 0.1803922, 1, 0, 1,
-0.5579734, -0.8297902, -3.763727, 0.1764706, 1, 0, 1,
-0.5578268, 0.9737648, -1.75438, 0.1686275, 1, 0, 1,
-0.5571942, 1.27035, -0.3633547, 0.1647059, 1, 0, 1,
-0.549514, 2.403151, 0.2435272, 0.1568628, 1, 0, 1,
-0.5477291, -0.8680543, -3.164631, 0.1529412, 1, 0, 1,
-0.5459293, -0.2803756, -1.349519, 0.145098, 1, 0, 1,
-0.5442545, -0.1270877, -0.1315066, 0.1411765, 1, 0, 1,
-0.5419086, 0.9444916, 0.6027031, 0.1333333, 1, 0, 1,
-0.5413547, 1.454785, 0.2769921, 0.1294118, 1, 0, 1,
-0.5413272, -1.751871, -3.612071, 0.1215686, 1, 0, 1,
-0.5351738, -0.2181919, -2.486593, 0.1176471, 1, 0, 1,
-0.5275035, 0.8935782, -0.9291607, 0.1098039, 1, 0, 1,
-0.5260282, 2.290448, -0.1660233, 0.1058824, 1, 0, 1,
-0.5248482, 0.7558315, -0.8402434, 0.09803922, 1, 0, 1,
-0.5235958, -0.7430064, -3.130912, 0.09019608, 1, 0, 1,
-0.5206399, -0.8402818, -3.090503, 0.08627451, 1, 0, 1,
-0.5167534, 1.429138, -0.8831756, 0.07843138, 1, 0, 1,
-0.5165741, 2.354937, -0.697047, 0.07450981, 1, 0, 1,
-0.5049382, 0.9146399, -1.309663, 0.06666667, 1, 0, 1,
-0.5048072, 0.8709489, -0.5871041, 0.0627451, 1, 0, 1,
-0.5025102, 0.6485304, 0.4216417, 0.05490196, 1, 0, 1,
-0.501707, -0.2153746, -3.542514, 0.05098039, 1, 0, 1,
-0.4997267, -0.2859525, -0.1919235, 0.04313726, 1, 0, 1,
-0.4918005, -0.7303745, -1.290857, 0.03921569, 1, 0, 1,
-0.4899182, 0.7265819, 0.1527406, 0.03137255, 1, 0, 1,
-0.4864285, -0.1238482, -1.848323, 0.02745098, 1, 0, 1,
-0.4859959, 1.754308, -0.1069227, 0.01960784, 1, 0, 1,
-0.4833713, -0.1851239, -1.27647, 0.01568628, 1, 0, 1,
-0.4821329, 1.065216, 1.225748, 0.007843138, 1, 0, 1,
-0.4817277, -0.664436, -0.7606668, 0.003921569, 1, 0, 1,
-0.4807106, 1.094486, 0.1408868, 0, 1, 0.003921569, 1,
-0.4772995, -1.720785, -2.133012, 0, 1, 0.01176471, 1,
-0.4734666, -0.8345239, -2.218938, 0, 1, 0.01568628, 1,
-0.4672473, 1.899358, 1.169876, 0, 1, 0.02352941, 1,
-0.4669979, 1.613393, -0.12291, 0, 1, 0.02745098, 1,
-0.4648654, -1.648811, -1.020565, 0, 1, 0.03529412, 1,
-0.4639761, -0.4118358, -1.902798, 0, 1, 0.03921569, 1,
-0.4591791, -3.04502, -2.87644, 0, 1, 0.04705882, 1,
-0.4565985, -0.8187625, -2.496722, 0, 1, 0.05098039, 1,
-0.4560174, -1.262731, -1.231953, 0, 1, 0.05882353, 1,
-0.4427779, -0.2473809, -3.365767, 0, 1, 0.0627451, 1,
-0.4409708, 1.391101, -0.5154257, 0, 1, 0.07058824, 1,
-0.4378636, 0.7213559, -1.415461, 0, 1, 0.07450981, 1,
-0.4344912, 0.01199557, -1.837502, 0, 1, 0.08235294, 1,
-0.4338815, 0.3969645, 0.1630216, 0, 1, 0.08627451, 1,
-0.4295322, 0.2534955, 1.221344, 0, 1, 0.09411765, 1,
-0.4292462, -0.3604697, -1.133195, 0, 1, 0.1019608, 1,
-0.4287123, -0.8652686, -1.468148, 0, 1, 0.1058824, 1,
-0.4281947, -0.558063, -1.700546, 0, 1, 0.1137255, 1,
-0.4090703, -0.6260851, -2.021615, 0, 1, 0.1176471, 1,
-0.4038897, -1.617054, -2.274437, 0, 1, 0.1254902, 1,
-0.4030084, 1.02948, -0.850934, 0, 1, 0.1294118, 1,
-0.4018835, -1.61363, -2.562191, 0, 1, 0.1372549, 1,
-0.4018418, -1.446155, -1.752478, 0, 1, 0.1411765, 1,
-0.3978035, 0.6295536, -0.311261, 0, 1, 0.1490196, 1,
-0.3928758, 1.710837, 0.3730833, 0, 1, 0.1529412, 1,
-0.3882784, -1.056613, -2.709493, 0, 1, 0.1607843, 1,
-0.3808928, -0.1663383, -0.641768, 0, 1, 0.1647059, 1,
-0.3787484, 0.4602807, -1.439401, 0, 1, 0.172549, 1,
-0.3755369, -0.6059118, -2.777141, 0, 1, 0.1764706, 1,
-0.3723217, -0.9287547, -1.559264, 0, 1, 0.1843137, 1,
-0.3715836, -0.6322017, -3.455821, 0, 1, 0.1882353, 1,
-0.3675146, 0.9657626, 0.121466, 0, 1, 0.1960784, 1,
-0.3628851, 0.2120257, -2.449608, 0, 1, 0.2039216, 1,
-0.3603348, 1.709674, -0.7260743, 0, 1, 0.2078431, 1,
-0.3592556, 0.1658592, -1.245191, 0, 1, 0.2156863, 1,
-0.3588507, -0.2204608, -3.417887, 0, 1, 0.2196078, 1,
-0.3559622, 0.1722755, -1.339941, 0, 1, 0.227451, 1,
-0.3558593, -0.1581243, -2.924182, 0, 1, 0.2313726, 1,
-0.349571, 0.1712316, -0.6054615, 0, 1, 0.2392157, 1,
-0.3469998, -0.3036273, -0.5298074, 0, 1, 0.2431373, 1,
-0.3444998, 0.1277885, -2.806126, 0, 1, 0.2509804, 1,
-0.3434815, -0.1874456, -2.89835, 0, 1, 0.254902, 1,
-0.3414605, -1.37133, -2.236849, 0, 1, 0.2627451, 1,
-0.3397043, 0.5053633, 0.3119532, 0, 1, 0.2666667, 1,
-0.3246453, 0.5912893, -0.9874839, 0, 1, 0.2745098, 1,
-0.3230173, 0.3284299, -0.6500853, 0, 1, 0.2784314, 1,
-0.3200941, -1.600763, -2.366494, 0, 1, 0.2862745, 1,
-0.3128537, -0.3604252, -2.943482, 0, 1, 0.2901961, 1,
-0.309017, 1.391224, -0.7019466, 0, 1, 0.2980392, 1,
-0.304389, -2.416998, -1.683496, 0, 1, 0.3058824, 1,
-0.2973761, -1.055544, -4.286932, 0, 1, 0.3098039, 1,
-0.2972406, 2.25234, 1.120369, 0, 1, 0.3176471, 1,
-0.2954938, 0.913532, -0.550011, 0, 1, 0.3215686, 1,
-0.2920753, 0.1492265, -0.807707, 0, 1, 0.3294118, 1,
-0.291842, 0.08303639, -2.741987, 0, 1, 0.3333333, 1,
-0.2882454, 1.180674, -1.060948, 0, 1, 0.3411765, 1,
-0.2879202, 0.7777994, 0.3950269, 0, 1, 0.345098, 1,
-0.2863043, -0.4798825, -2.457303, 0, 1, 0.3529412, 1,
-0.2826605, -1.969851, -2.579406, 0, 1, 0.3568628, 1,
-0.2788056, 0.2700997, -0.9445126, 0, 1, 0.3647059, 1,
-0.2686312, -0.5709372, -4.02969, 0, 1, 0.3686275, 1,
-0.2652805, 0.2508219, 0.174349, 0, 1, 0.3764706, 1,
-0.2598907, -0.6546623, -2.387905, 0, 1, 0.3803922, 1,
-0.2555995, -0.3811075, -3.719713, 0, 1, 0.3882353, 1,
-0.2515028, 0.7404853, -0.9664331, 0, 1, 0.3921569, 1,
-0.2507037, 0.1760236, -0.630124, 0, 1, 0.4, 1,
-0.2421013, -0.2030804, -1.57318, 0, 1, 0.4078431, 1,
-0.2373878, -0.9721972, -4.571974, 0, 1, 0.4117647, 1,
-0.2355544, -0.6054339, -3.046364, 0, 1, 0.4196078, 1,
-0.2330004, -0.4257931, -4.078444, 0, 1, 0.4235294, 1,
-0.2324434, 0.5864547, -3.070343, 0, 1, 0.4313726, 1,
-0.2279803, 0.7934979, -1.781999, 0, 1, 0.4352941, 1,
-0.2261038, 1.183551, -1.533369, 0, 1, 0.4431373, 1,
-0.2249382, -0.022197, -2.119823, 0, 1, 0.4470588, 1,
-0.2203928, -0.3637795, -2.072901, 0, 1, 0.454902, 1,
-0.2201171, -0.7866818, -2.60674, 0, 1, 0.4588235, 1,
-0.2191964, -0.5310771, -3.111919, 0, 1, 0.4666667, 1,
-0.2153266, -0.8640348, -3.466211, 0, 1, 0.4705882, 1,
-0.2148159, 0.009691133, -1.910031, 0, 1, 0.4784314, 1,
-0.214809, 0.3519464, -1.463207, 0, 1, 0.4823529, 1,
-0.2107644, 0.2235598, 1.073143, 0, 1, 0.4901961, 1,
-0.2090138, 0.6292888, -2.113293, 0, 1, 0.4941176, 1,
-0.2089023, 0.9920338, 1.567792, 0, 1, 0.5019608, 1,
-0.204468, 0.6993742, -1.671443, 0, 1, 0.509804, 1,
-0.204206, 1.272622, 0.2588544, 0, 1, 0.5137255, 1,
-0.2030344, 1.524986, -0.380795, 0, 1, 0.5215687, 1,
-0.1940292, -1.054164, -2.645627, 0, 1, 0.5254902, 1,
-0.1930151, -0.4807023, -2.614579, 0, 1, 0.5333334, 1,
-0.1897547, 0.4458355, 0.1025566, 0, 1, 0.5372549, 1,
-0.1896847, -1.827437, -1.664821, 0, 1, 0.5450981, 1,
-0.1889437, -0.482071, -1.681724, 0, 1, 0.5490196, 1,
-0.1783312, 2.128972, -0.7340255, 0, 1, 0.5568628, 1,
-0.1731582, -0.05962909, -2.98126, 0, 1, 0.5607843, 1,
-0.1724611, -1.194277, -3.161725, 0, 1, 0.5686275, 1,
-0.1717361, -1.427917, -3.269979, 0, 1, 0.572549, 1,
-0.1686896, -0.7226627, -4.238416, 0, 1, 0.5803922, 1,
-0.1684431, -0.418561, -2.718773, 0, 1, 0.5843138, 1,
-0.1683417, 0.7368001, -0.04301479, 0, 1, 0.5921569, 1,
-0.1662241, -0.7683999, -1.548994, 0, 1, 0.5960785, 1,
-0.1632007, -0.3272327, -1.570707, 0, 1, 0.6039216, 1,
-0.1613487, 1.536108, 0.314269, 0, 1, 0.6117647, 1,
-0.1609747, 1.450045, -0.4327913, 0, 1, 0.6156863, 1,
-0.156839, 1.080602, -1.15781, 0, 1, 0.6235294, 1,
-0.1562233, 0.2739806, 0.279436, 0, 1, 0.627451, 1,
-0.1539151, 0.06189622, -1.431757, 0, 1, 0.6352941, 1,
-0.1538502, 0.1255057, -1.162307, 0, 1, 0.6392157, 1,
-0.1492753, -1.413702, -2.025999, 0, 1, 0.6470588, 1,
-0.1430536, -0.160279, -2.75589, 0, 1, 0.6509804, 1,
-0.1413916, 1.297729, -0.3628241, 0, 1, 0.6588235, 1,
-0.1403389, -0.1414702, -2.003303, 0, 1, 0.6627451, 1,
-0.1388806, 0.3668307, -1.767317, 0, 1, 0.6705883, 1,
-0.1359373, -1.31303, -4.019507, 0, 1, 0.6745098, 1,
-0.1341244, 1.086868, -0.648515, 0, 1, 0.682353, 1,
-0.1322665, 0.6082398, -0.7393292, 0, 1, 0.6862745, 1,
-0.1318292, 1.175073, 0.7772462, 0, 1, 0.6941177, 1,
-0.1263329, -0.1841386, -2.815344, 0, 1, 0.7019608, 1,
-0.1257426, -0.2506853, -3.566505, 0, 1, 0.7058824, 1,
-0.1255736, -0.5102015, -1.588967, 0, 1, 0.7137255, 1,
-0.1243971, -0.1297737, -4.094296, 0, 1, 0.7176471, 1,
-0.1239937, -0.9896673, -0.6467524, 0, 1, 0.7254902, 1,
-0.1117522, -1.375858, -2.572637, 0, 1, 0.7294118, 1,
-0.1047995, 0.7111912, -0.3293828, 0, 1, 0.7372549, 1,
-0.1038144, 0.5140932, -0.513201, 0, 1, 0.7411765, 1,
-0.1008192, -1.083646, -2.13262, 0, 1, 0.7490196, 1,
-0.09958201, 1.73123, -1.450631, 0, 1, 0.7529412, 1,
-0.09762132, -0.6937426, -3.964725, 0, 1, 0.7607843, 1,
-0.09330063, -0.3576843, -3.508731, 0, 1, 0.7647059, 1,
-0.09086192, -0.581223, -3.731563, 0, 1, 0.772549, 1,
-0.08921532, -0.1848831, -3.138007, 0, 1, 0.7764706, 1,
-0.08616838, -0.7629335, -2.764342, 0, 1, 0.7843137, 1,
-0.08212212, 0.01726957, -1.051017, 0, 1, 0.7882353, 1,
-0.08193839, -0.02341211, -1.796816, 0, 1, 0.7960784, 1,
-0.07919342, 0.8003017, 0.3962016, 0, 1, 0.8039216, 1,
-0.07884783, -0.5044699, -2.677016, 0, 1, 0.8078431, 1,
-0.07549455, 1.65533, 2.27703, 0, 1, 0.8156863, 1,
-0.07282732, 0.2833777, -0.6133336, 0, 1, 0.8196079, 1,
-0.07163174, 1.475464, -0.8617357, 0, 1, 0.827451, 1,
-0.06779019, 0.07910734, -3.484493, 0, 1, 0.8313726, 1,
-0.06413189, -1.50717, -3.186639, 0, 1, 0.8392157, 1,
-0.06045537, 0.5346518, -0.434038, 0, 1, 0.8431373, 1,
-0.05802743, 0.6057649, 0.9439529, 0, 1, 0.8509804, 1,
-0.05504055, 1.039931, -0.265551, 0, 1, 0.854902, 1,
-0.0497354, 0.5490862, -0.003654129, 0, 1, 0.8627451, 1,
-0.04727563, -0.137029, -0.546576, 0, 1, 0.8666667, 1,
-0.04449435, -0.6355081, -3.39318, 0, 1, 0.8745098, 1,
-0.04275233, -0.1211414, -2.573371, 0, 1, 0.8784314, 1,
-0.04013582, -1.419266, -3.988231, 0, 1, 0.8862745, 1,
-0.0377985, 0.1109342, 0.643335, 0, 1, 0.8901961, 1,
-0.03145939, 0.5003946, -2.120228, 0, 1, 0.8980392, 1,
-0.02334815, 0.8137028, 0.5004855, 0, 1, 0.9058824, 1,
-0.02288095, 0.2973674, 0.4540583, 0, 1, 0.9098039, 1,
-0.01625957, 0.5189169, -1.354721, 0, 1, 0.9176471, 1,
-0.01458238, -0.5921932, -3.752728, 0, 1, 0.9215686, 1,
-0.006338018, -1.319528, -1.125554, 0, 1, 0.9294118, 1,
-0.005059802, -0.1163384, -2.472338, 0, 1, 0.9333333, 1,
-0.003841406, 0.9944282, 2.177123, 0, 1, 0.9411765, 1,
-0.003699762, -1.485822, -3.178504, 0, 1, 0.945098, 1,
0.005851949, -2.3476, 2.718278, 0, 1, 0.9529412, 1,
0.006710259, 1.120751, -0.8415184, 0, 1, 0.9568627, 1,
0.00876117, 0.6674157, -0.489169, 0, 1, 0.9647059, 1,
0.008993056, 0.5133529, -0.2397767, 0, 1, 0.9686275, 1,
0.01209012, 2.266299, -0.838074, 0, 1, 0.9764706, 1,
0.0128149, -1.926043, 4.560476, 0, 1, 0.9803922, 1,
0.01456346, 0.1515025, -0.5597128, 0, 1, 0.9882353, 1,
0.01531935, 1.135964, -0.8519792, 0, 1, 0.9921569, 1,
0.02157986, 0.08281483, 0.7108589, 0, 1, 1, 1,
0.02166042, -0.1213675, 1.736162, 0, 0.9921569, 1, 1,
0.0287331, 0.4461283, 0.8462372, 0, 0.9882353, 1, 1,
0.02885751, 0.5604056, -0.205301, 0, 0.9803922, 1, 1,
0.02922941, 0.4797702, 0.6306027, 0, 0.9764706, 1, 1,
0.03437815, -1.525692, 2.702796, 0, 0.9686275, 1, 1,
0.03472696, -0.5830529, 2.155742, 0, 0.9647059, 1, 1,
0.03647852, 1.006685, -2.117392, 0, 0.9568627, 1, 1,
0.04147558, 0.1637559, 0.6139706, 0, 0.9529412, 1, 1,
0.04512745, -0.8209236, 2.606705, 0, 0.945098, 1, 1,
0.04642568, 1.204302, 0.6130275, 0, 0.9411765, 1, 1,
0.04749201, 1.477416, -0.08554985, 0, 0.9333333, 1, 1,
0.05186528, -1.287552, 3.367563, 0, 0.9294118, 1, 1,
0.05683239, -0.485695, 3.850211, 0, 0.9215686, 1, 1,
0.06045197, 0.2132266, -0.8402708, 0, 0.9176471, 1, 1,
0.06466535, -0.3482354, 2.060687, 0, 0.9098039, 1, 1,
0.06579628, 0.3752359, 0.8189765, 0, 0.9058824, 1, 1,
0.06583302, 0.7517276, -0.09637886, 0, 0.8980392, 1, 1,
0.06662025, -1.373002, 3.284069, 0, 0.8901961, 1, 1,
0.06673129, 0.3866087, 0.8397463, 0, 0.8862745, 1, 1,
0.06756397, -0.9550561, 3.48167, 0, 0.8784314, 1, 1,
0.07686143, -1.1383, 2.662787, 0, 0.8745098, 1, 1,
0.0825549, -0.05237921, 3.037354, 0, 0.8666667, 1, 1,
0.08262885, 0.3170127, -0.1359859, 0, 0.8627451, 1, 1,
0.08762047, -0.3460865, 1.547115, 0, 0.854902, 1, 1,
0.09071785, -1.209238, 2.903819, 0, 0.8509804, 1, 1,
0.09274273, 0.8219789, -0.01347751, 0, 0.8431373, 1, 1,
0.1000932, 0.7824243, 1.507745, 0, 0.8392157, 1, 1,
0.1024302, 1.110781, 1.015086, 0, 0.8313726, 1, 1,
0.1038087, -0.6309869, 4.366182, 0, 0.827451, 1, 1,
0.1084745, -1.955303, 1.348749, 0, 0.8196079, 1, 1,
0.1093176, -0.2111664, 0.8145851, 0, 0.8156863, 1, 1,
0.1110786, 0.898463, 0.5668483, 0, 0.8078431, 1, 1,
0.1139962, -0.3300009, 5.341188, 0, 0.8039216, 1, 1,
0.1141659, -0.6033011, 4.394056, 0, 0.7960784, 1, 1,
0.1142869, 0.8598053, 0.3438561, 0, 0.7882353, 1, 1,
0.1145228, 0.7078754, -0.3292828, 0, 0.7843137, 1, 1,
0.115584, 0.5898057, 1.075349, 0, 0.7764706, 1, 1,
0.116473, -1.039197, 1.485694, 0, 0.772549, 1, 1,
0.1184177, 1.093976, 0.02793465, 0, 0.7647059, 1, 1,
0.119664, -1.435286, 3.743666, 0, 0.7607843, 1, 1,
0.122099, -0.4731296, 4.158895, 0, 0.7529412, 1, 1,
0.1298196, 0.06879696, 1.352826, 0, 0.7490196, 1, 1,
0.131826, 0.3584606, 0.1213053, 0, 0.7411765, 1, 1,
0.1336295, 0.5531946, 0.5905629, 0, 0.7372549, 1, 1,
0.136542, 0.7326944, -0.4446128, 0, 0.7294118, 1, 1,
0.1388146, -0.2074863, 3.447576, 0, 0.7254902, 1, 1,
0.1407557, 0.4363136, -0.3380138, 0, 0.7176471, 1, 1,
0.1437378, -0.04927022, 2.183091, 0, 0.7137255, 1, 1,
0.1452679, -0.9480919, 2.350493, 0, 0.7058824, 1, 1,
0.1507983, -0.9118993, 3.269133, 0, 0.6980392, 1, 1,
0.1527946, -1.182038, 3.760903, 0, 0.6941177, 1, 1,
0.1588115, 0.9591898, 3.436029, 0, 0.6862745, 1, 1,
0.1590792, 0.6563457, 1.116908, 0, 0.682353, 1, 1,
0.1594101, 0.6636837, -1.009458, 0, 0.6745098, 1, 1,
0.1618975, -0.3502064, 1.675478, 0, 0.6705883, 1, 1,
0.1636513, -0.6425637, 2.961035, 0, 0.6627451, 1, 1,
0.1652726, -1.401825, 2.241516, 0, 0.6588235, 1, 1,
0.1660119, -0.8222721, 3.149917, 0, 0.6509804, 1, 1,
0.1681334, -1.221837, 2.748019, 0, 0.6470588, 1, 1,
0.1763729, 0.1989408, 0.7117565, 0, 0.6392157, 1, 1,
0.1804819, 0.08821987, 1.834628, 0, 0.6352941, 1, 1,
0.1832673, -0.4633327, 2.712039, 0, 0.627451, 1, 1,
0.1852859, 0.901961, 0.7225848, 0, 0.6235294, 1, 1,
0.1880544, 0.9325399, 1.469491, 0, 0.6156863, 1, 1,
0.1890356, 0.199151, 2.292298, 0, 0.6117647, 1, 1,
0.193875, 0.09593047, -0.3258249, 0, 0.6039216, 1, 1,
0.1942952, 0.4203872, 1.153131, 0, 0.5960785, 1, 1,
0.1965653, -1.859904, 2.263743, 0, 0.5921569, 1, 1,
0.197215, -0.1161837, 2.324496, 0, 0.5843138, 1, 1,
0.200045, -0.197514, 1.886653, 0, 0.5803922, 1, 1,
0.2020087, 0.3695757, -1.229692, 0, 0.572549, 1, 1,
0.2033141, 0.7237181, 1.83892, 0, 0.5686275, 1, 1,
0.20335, 0.7779009, 0.1244459, 0, 0.5607843, 1, 1,
0.2052315, 0.02797003, 1.524428, 0, 0.5568628, 1, 1,
0.2086956, -0.595754, 3.705107, 0, 0.5490196, 1, 1,
0.2112084, 0.2742345, 1.37011, 0, 0.5450981, 1, 1,
0.2131934, -0.5964803, 2.784026, 0, 0.5372549, 1, 1,
0.2135563, 1.633634, 2.168761, 0, 0.5333334, 1, 1,
0.2144084, -0.633369, 3.889868, 0, 0.5254902, 1, 1,
0.2165374, -0.5601414, 2.261474, 0, 0.5215687, 1, 1,
0.216958, -0.2423601, 1.224608, 0, 0.5137255, 1, 1,
0.2175667, -0.1755653, 2.479616, 0, 0.509804, 1, 1,
0.2225878, 0.9997481, 0.7144625, 0, 0.5019608, 1, 1,
0.2272036, 0.580031, -0.7672235, 0, 0.4941176, 1, 1,
0.2274394, -0.9023542, 2.413353, 0, 0.4901961, 1, 1,
0.2342742, -1.035828, 2.205731, 0, 0.4823529, 1, 1,
0.2382683, -0.827024, 1.700672, 0, 0.4784314, 1, 1,
0.2409168, 0.6211185, 2.55376, 0, 0.4705882, 1, 1,
0.2415026, 1.782279, 0.639491, 0, 0.4666667, 1, 1,
0.242125, -0.05479431, 0.5509177, 0, 0.4588235, 1, 1,
0.2452963, -0.7872658, 2.593319, 0, 0.454902, 1, 1,
0.2455106, 1.147812, 0.02058858, 0, 0.4470588, 1, 1,
0.2489513, 0.7168494, 0.2456219, 0, 0.4431373, 1, 1,
0.257891, 0.07544224, 0.3509742, 0, 0.4352941, 1, 1,
0.2579987, 0.5675517, 1.065943, 0, 0.4313726, 1, 1,
0.2592947, 0.4781779, 1.54864, 0, 0.4235294, 1, 1,
0.2616952, 1.336618, 1.825064, 0, 0.4196078, 1, 1,
0.26265, 0.3769168, 2.427623, 0, 0.4117647, 1, 1,
0.2637064, 0.3045444, 0.8856782, 0, 0.4078431, 1, 1,
0.2660362, 1.236693, -1.575697, 0, 0.4, 1, 1,
0.2837074, -0.8429042, 3.245787, 0, 0.3921569, 1, 1,
0.2907968, 0.9550204, 1.412677, 0, 0.3882353, 1, 1,
0.2912812, -0.7233186, 1.896197, 0, 0.3803922, 1, 1,
0.3117276, 0.5942193, 0.9316683, 0, 0.3764706, 1, 1,
0.3173109, -0.1389705, 2.01996, 0, 0.3686275, 1, 1,
0.3189822, 1.91771, 0.1637648, 0, 0.3647059, 1, 1,
0.3203875, -0.3145847, 2.6128, 0, 0.3568628, 1, 1,
0.321155, -0.2204841, 1.847196, 0, 0.3529412, 1, 1,
0.3216861, -0.712109, 2.369425, 0, 0.345098, 1, 1,
0.3240429, -0.6266212, 0.5237072, 0, 0.3411765, 1, 1,
0.3257886, 0.01920413, 2.367962, 0, 0.3333333, 1, 1,
0.3297235, 0.9051086, 0.6555572, 0, 0.3294118, 1, 1,
0.3313474, 0.7222624, -0.5390423, 0, 0.3215686, 1, 1,
0.3314596, 0.6626657, 1.279501, 0, 0.3176471, 1, 1,
0.3349832, -0.351269, 1.55661, 0, 0.3098039, 1, 1,
0.3365817, 0.1235185, 1.58931, 0, 0.3058824, 1, 1,
0.3425784, 0.4562751, 1.409105, 0, 0.2980392, 1, 1,
0.3428535, -0.6038682, 2.477582, 0, 0.2901961, 1, 1,
0.3437881, -0.350911, 2.370192, 0, 0.2862745, 1, 1,
0.3469475, 0.950653, 1.100467, 0, 0.2784314, 1, 1,
0.3511848, 0.04873397, 1.769864, 0, 0.2745098, 1, 1,
0.3517437, -1.05877, 3.039146, 0, 0.2666667, 1, 1,
0.355935, -0.7235464, 3.048388, 0, 0.2627451, 1, 1,
0.3607967, 0.09253903, 0.8197252, 0, 0.254902, 1, 1,
0.3622029, 0.3654382, 0.3398667, 0, 0.2509804, 1, 1,
0.3683806, 2.569798, -1.136046, 0, 0.2431373, 1, 1,
0.3685758, 1.36196, -1.219295, 0, 0.2392157, 1, 1,
0.3720926, -2.139782, 1.461257, 0, 0.2313726, 1, 1,
0.3726933, 2.595576, -1.705718, 0, 0.227451, 1, 1,
0.3745758, -0.07062119, 2.348439, 0, 0.2196078, 1, 1,
0.3813615, -1.351598, 1.958708, 0, 0.2156863, 1, 1,
0.3866708, 0.9994724, -0.03618811, 0, 0.2078431, 1, 1,
0.3869856, -1.650275, 4.287395, 0, 0.2039216, 1, 1,
0.390685, 0.8519541, 0.4350734, 0, 0.1960784, 1, 1,
0.3924523, -1.066755, 3.010066, 0, 0.1882353, 1, 1,
0.3975336, -1.323452, 2.333242, 0, 0.1843137, 1, 1,
0.4124256, 0.7068854, -0.4192426, 0, 0.1764706, 1, 1,
0.4184867, 0.0518001, -0.5571828, 0, 0.172549, 1, 1,
0.4187137, -1.333899, 2.628761, 0, 0.1647059, 1, 1,
0.4196584, 1.006075, 0.1589778, 0, 0.1607843, 1, 1,
0.4212284, 1.143013, 0.7808596, 0, 0.1529412, 1, 1,
0.4217361, 1.083829, -1.800373, 0, 0.1490196, 1, 1,
0.4225062, -0.6967772, 1.611131, 0, 0.1411765, 1, 1,
0.4227465, -1.068234, 1.850207, 0, 0.1372549, 1, 1,
0.4245865, 0.3368333, 0.6609982, 0, 0.1294118, 1, 1,
0.4246728, 0.4891893, 1.491788, 0, 0.1254902, 1, 1,
0.4257571, -0.2300775, 2.608253, 0, 0.1176471, 1, 1,
0.4271844, 0.05661881, -0.7309643, 0, 0.1137255, 1, 1,
0.4300478, -1.2738, 2.384014, 0, 0.1058824, 1, 1,
0.430721, -1.546512, 3.441456, 0, 0.09803922, 1, 1,
0.4361455, 1.465203, 0.6455066, 0, 0.09411765, 1, 1,
0.4385895, 0.04858639, 1.127676, 0, 0.08627451, 1, 1,
0.4386008, -1.870139, 2.267152, 0, 0.08235294, 1, 1,
0.4398977, 0.173182, 0.5333181, 0, 0.07450981, 1, 1,
0.4430458, 0.9285492, 0.6887239, 0, 0.07058824, 1, 1,
0.4451543, -1.372113, 1.785278, 0, 0.0627451, 1, 1,
0.4454086, -1.439492, 5.257202, 0, 0.05882353, 1, 1,
0.4498288, -0.5633743, 2.466967, 0, 0.05098039, 1, 1,
0.4504433, -0.8420375, 1.702986, 0, 0.04705882, 1, 1,
0.452941, -0.3098179, 2.410782, 0, 0.03921569, 1, 1,
0.453557, 0.8242334, 0.5631642, 0, 0.03529412, 1, 1,
0.4551221, -0.7598609, 3.581879, 0, 0.02745098, 1, 1,
0.4558321, -2.796962, 4.411787, 0, 0.02352941, 1, 1,
0.4565593, -0.9959735, 1.140225, 0, 0.01568628, 1, 1,
0.4611023, 0.1072977, 1.252065, 0, 0.01176471, 1, 1,
0.465447, -0.3414594, 3.533677, 0, 0.003921569, 1, 1,
0.4662772, -0.8129297, 3.172039, 0.003921569, 0, 1, 1,
0.4670599, -0.5113232, 2.655824, 0.007843138, 0, 1, 1,
0.4677133, -1.342644, 1.801489, 0.01568628, 0, 1, 1,
0.4688627, -0.9471286, 3.524693, 0.01960784, 0, 1, 1,
0.4733943, -0.7582887, 4.298827, 0.02745098, 0, 1, 1,
0.4749641, -0.7197571, 1.645326, 0.03137255, 0, 1, 1,
0.4752237, -0.09265631, 0.6549908, 0.03921569, 0, 1, 1,
0.4768235, 0.5702415, 1.795946, 0.04313726, 0, 1, 1,
0.4783268, 0.002971396, 2.2895, 0.05098039, 0, 1, 1,
0.480563, -1.47881, 2.611021, 0.05490196, 0, 1, 1,
0.4885654, 0.1493571, 2.536558, 0.0627451, 0, 1, 1,
0.4900839, -1.234035, 1.115017, 0.06666667, 0, 1, 1,
0.497128, 1.234106, -0.9573877, 0.07450981, 0, 1, 1,
0.4980265, -0.3283058, 2.570274, 0.07843138, 0, 1, 1,
0.5004367, -0.03897323, 1.056881, 0.08627451, 0, 1, 1,
0.502937, -0.4978718, 2.148085, 0.09019608, 0, 1, 1,
0.5107668, -0.502134, 1.092517, 0.09803922, 0, 1, 1,
0.5129607, -0.3440256, 1.681076, 0.1058824, 0, 1, 1,
0.5132666, -0.675743, 2.113344, 0.1098039, 0, 1, 1,
0.5221824, 1.113802, 0.9568155, 0.1176471, 0, 1, 1,
0.5232682, -1.35634, 1.121396, 0.1215686, 0, 1, 1,
0.5233986, -1.222168, 2.257736, 0.1294118, 0, 1, 1,
0.5240954, 0.4816376, 0.8353801, 0.1333333, 0, 1, 1,
0.5247375, 1.072373, 0.1684191, 0.1411765, 0, 1, 1,
0.5272666, 0.9202877, -0.638228, 0.145098, 0, 1, 1,
0.5322676, -2.093251, 5.907501, 0.1529412, 0, 1, 1,
0.5326892, 0.7404276, -0.9066563, 0.1568628, 0, 1, 1,
0.5334679, -0.2115294, 2.769023, 0.1647059, 0, 1, 1,
0.5351717, -1.588557, 4.015064, 0.1686275, 0, 1, 1,
0.5363667, 0.7671418, -1.381025, 0.1764706, 0, 1, 1,
0.5415438, 0.0750865, 1.72333, 0.1803922, 0, 1, 1,
0.5466202, 0.9017276, -0.05889537, 0.1882353, 0, 1, 1,
0.5541059, 0.1778824, 1.319834, 0.1921569, 0, 1, 1,
0.5655139, -0.4605766, 2.039626, 0.2, 0, 1, 1,
0.5695815, 0.3136294, 1.673406, 0.2078431, 0, 1, 1,
0.5702691, -1.550885, 1.694633, 0.2117647, 0, 1, 1,
0.5747108, 0.2293574, 0.001082611, 0.2196078, 0, 1, 1,
0.5784318, -0.7616695, 3.552875, 0.2235294, 0, 1, 1,
0.5795072, 0.09970938, 2.49534, 0.2313726, 0, 1, 1,
0.5905751, -0.09110655, 4.026989, 0.2352941, 0, 1, 1,
0.5933024, -0.6634645, 2.597627, 0.2431373, 0, 1, 1,
0.5993752, 1.360497, -0.450907, 0.2470588, 0, 1, 1,
0.6077895, -0.517369, 2.497716, 0.254902, 0, 1, 1,
0.6083235, -1.02604, 1.439851, 0.2588235, 0, 1, 1,
0.6083464, 0.4525993, 1.737143, 0.2666667, 0, 1, 1,
0.6097829, 0.188238, 1.702874, 0.2705882, 0, 1, 1,
0.6109813, -0.3057072, 0.08786794, 0.2784314, 0, 1, 1,
0.6110663, -0.853686, 3.241193, 0.282353, 0, 1, 1,
0.6131563, 0.1573897, 1.688395, 0.2901961, 0, 1, 1,
0.6167493, 0.2840917, 1.722756, 0.2941177, 0, 1, 1,
0.618997, -1.194969, 1.286676, 0.3019608, 0, 1, 1,
0.6190127, -0.2550857, 0.7102038, 0.3098039, 0, 1, 1,
0.6235657, 1.00164, 0.5314548, 0.3137255, 0, 1, 1,
0.6288511, 1.710089, -0.7242523, 0.3215686, 0, 1, 1,
0.6291826, 0.7620115, 0.6643954, 0.3254902, 0, 1, 1,
0.6317749, -0.7733095, 2.844269, 0.3333333, 0, 1, 1,
0.6362657, -0.2422927, 1.913712, 0.3372549, 0, 1, 1,
0.6444663, -0.5364396, 2.654088, 0.345098, 0, 1, 1,
0.6508601, 0.6577926, 1.385408, 0.3490196, 0, 1, 1,
0.6512476, 0.7864675, 1.190027, 0.3568628, 0, 1, 1,
0.6523255, -0.583284, 1.601032, 0.3607843, 0, 1, 1,
0.6553443, 1.228634, 1.968614, 0.3686275, 0, 1, 1,
0.6559705, 0.3610609, 1.600665, 0.372549, 0, 1, 1,
0.6566743, -1.027035, 0.5272652, 0.3803922, 0, 1, 1,
0.660448, 0.3316811, 0.02103657, 0.3843137, 0, 1, 1,
0.6634818, 0.7866297, 0.2230371, 0.3921569, 0, 1, 1,
0.6647065, 2.194238, 0.3319873, 0.3960784, 0, 1, 1,
0.6651539, 1.45207, 1.378125, 0.4039216, 0, 1, 1,
0.6657982, -0.7465038, 3.999142, 0.4117647, 0, 1, 1,
0.6799394, -0.5072798, 3.66601, 0.4156863, 0, 1, 1,
0.6800419, -0.2329218, 3.387125, 0.4235294, 0, 1, 1,
0.6804706, -1.187725, 0.3262699, 0.427451, 0, 1, 1,
0.680985, -0.2964309, 3.11419, 0.4352941, 0, 1, 1,
0.6817521, 1.438315, -0.7659104, 0.4392157, 0, 1, 1,
0.6838616, 0.5752887, 0.06943641, 0.4470588, 0, 1, 1,
0.6873154, -1.146339, 1.189532, 0.4509804, 0, 1, 1,
0.688124, 0.9349024, 1.621601, 0.4588235, 0, 1, 1,
0.689459, -2.383153, 1.852138, 0.4627451, 0, 1, 1,
0.6951342, -0.3574057, 1.507774, 0.4705882, 0, 1, 1,
0.6953598, -0.98499, 2.078496, 0.4745098, 0, 1, 1,
0.6966683, -0.4963197, 2.804523, 0.4823529, 0, 1, 1,
0.6988007, -0.3659296, 0.0130667, 0.4862745, 0, 1, 1,
0.6995973, 1.539716, 0.1482103, 0.4941176, 0, 1, 1,
0.7007728, -0.103529, 1.683686, 0.5019608, 0, 1, 1,
0.7026911, 0.9621049, 0.20589, 0.5058824, 0, 1, 1,
0.7074999, 1.233859, 0.1823749, 0.5137255, 0, 1, 1,
0.7076722, -1.685926, 2.928653, 0.5176471, 0, 1, 1,
0.7117128, -2.03992, 4.249862, 0.5254902, 0, 1, 1,
0.7147666, -0.2076803, 0.993705, 0.5294118, 0, 1, 1,
0.724468, 1.989012, 1.078394, 0.5372549, 0, 1, 1,
0.7255419, -1.355885, 2.070668, 0.5411765, 0, 1, 1,
0.7269756, -0.2070086, 3.836834, 0.5490196, 0, 1, 1,
0.7275962, 2.41774, 0.8427081, 0.5529412, 0, 1, 1,
0.7317261, 0.1775746, 2.891281, 0.5607843, 0, 1, 1,
0.7320475, 0.3983847, 1.405534, 0.5647059, 0, 1, 1,
0.7342643, -0.195731, 2.395957, 0.572549, 0, 1, 1,
0.7362487, -1.236625, 3.838202, 0.5764706, 0, 1, 1,
0.7372838, 1.095276, 1.123052, 0.5843138, 0, 1, 1,
0.7379895, 0.6961589, 0.2948976, 0.5882353, 0, 1, 1,
0.7413744, -1.823074, 4.071067, 0.5960785, 0, 1, 1,
0.742174, -0.1715718, 0.1727798, 0.6039216, 0, 1, 1,
0.7528785, 0.7017111, -0.6525467, 0.6078432, 0, 1, 1,
0.7529443, -0.3144134, 2.033995, 0.6156863, 0, 1, 1,
0.765172, -1.166838, 1.888481, 0.6196079, 0, 1, 1,
0.7706502, -0.07155708, 2.952687, 0.627451, 0, 1, 1,
0.7744421, -0.08334509, 1.072104, 0.6313726, 0, 1, 1,
0.7787082, 1.151655, 0.7781728, 0.6392157, 0, 1, 1,
0.7816634, 0.06242513, 1.290355, 0.6431373, 0, 1, 1,
0.7830153, 1.885684, 0.6934414, 0.6509804, 0, 1, 1,
0.7849274, -1.499809, 3.050464, 0.654902, 0, 1, 1,
0.7855125, 1.213916, -0.01191717, 0.6627451, 0, 1, 1,
0.7898837, 1.519658, 0.2210814, 0.6666667, 0, 1, 1,
0.791132, 0.2421982, 1.935968, 0.6745098, 0, 1, 1,
0.791494, -0.5208321, 2.566303, 0.6784314, 0, 1, 1,
0.7937219, -0.3124092, 3.378502, 0.6862745, 0, 1, 1,
0.7941399, -0.4434402, 2.467134, 0.6901961, 0, 1, 1,
0.7949392, -0.5857703, 2.711704, 0.6980392, 0, 1, 1,
0.7969472, -0.6289846, 1.992977, 0.7058824, 0, 1, 1,
0.7973742, 1.529108, 0.1130562, 0.7098039, 0, 1, 1,
0.800885, -1.1332, 2.390496, 0.7176471, 0, 1, 1,
0.8077565, -0.06808067, 1.107672, 0.7215686, 0, 1, 1,
0.8108326, -0.9748175, 2.47824, 0.7294118, 0, 1, 1,
0.8195457, 0.5165387, -0.4959305, 0.7333333, 0, 1, 1,
0.8200719, 0.1223437, 0.9190706, 0.7411765, 0, 1, 1,
0.8277552, 0.09827583, 0.3453102, 0.7450981, 0, 1, 1,
0.8305525, -1.123145, 3.299839, 0.7529412, 0, 1, 1,
0.8308709, 1.734497, 1.164478, 0.7568628, 0, 1, 1,
0.834986, 1.31283, 0.9703537, 0.7647059, 0, 1, 1,
0.8404337, 1.190417, -0.2827149, 0.7686275, 0, 1, 1,
0.8429975, -1.606663, 3.477994, 0.7764706, 0, 1, 1,
0.844318, -0.02754549, -0.1694905, 0.7803922, 0, 1, 1,
0.8450144, -1.247787, 1.856913, 0.7882353, 0, 1, 1,
0.8475564, 0.01466319, 0.111288, 0.7921569, 0, 1, 1,
0.8492706, 0.1393311, 0.8241782, 0.8, 0, 1, 1,
0.8525655, -1.350114, 2.581568, 0.8078431, 0, 1, 1,
0.8622684, -0.6782296, 2.598191, 0.8117647, 0, 1, 1,
0.8641576, -0.5606843, 1.309634, 0.8196079, 0, 1, 1,
0.8649995, -0.7426098, 2.845814, 0.8235294, 0, 1, 1,
0.8674359, 0.1033827, 0.6264306, 0.8313726, 0, 1, 1,
0.8712667, -3.165274, 1.83184, 0.8352941, 0, 1, 1,
0.8780035, -1.643772, 1.078123, 0.8431373, 0, 1, 1,
0.8812973, -1.026968, 3.81729, 0.8470588, 0, 1, 1,
0.9099624, 0.5886123, 2.679496, 0.854902, 0, 1, 1,
0.9115559, 0.09452625, 1.92678, 0.8588235, 0, 1, 1,
0.9124323, -1.484105, 1.582208, 0.8666667, 0, 1, 1,
0.9156234, 0.7592347, -0.3268395, 0.8705882, 0, 1, 1,
0.9159176, -1.097134, 2.159862, 0.8784314, 0, 1, 1,
0.9194208, -0.1509825, 2.884632, 0.8823529, 0, 1, 1,
0.9228158, -1.302189, 3.369625, 0.8901961, 0, 1, 1,
0.9289442, 1.250418, 0.912335, 0.8941177, 0, 1, 1,
0.9315901, -1.229107, 3.455707, 0.9019608, 0, 1, 1,
0.9345282, 2.9038, 2.253577, 0.9098039, 0, 1, 1,
0.9379651, -0.04117401, 2.523281, 0.9137255, 0, 1, 1,
0.9395433, -1.024094, 2.004328, 0.9215686, 0, 1, 1,
0.9438154, 0.1897209, 2.950145, 0.9254902, 0, 1, 1,
0.9448858, 0.9259218, 2.047684, 0.9333333, 0, 1, 1,
0.9497328, -1.066583, 2.671346, 0.9372549, 0, 1, 1,
0.958639, 0.6731595, 3.266886, 0.945098, 0, 1, 1,
0.9587244, -0.8009198, 1.839833, 0.9490196, 0, 1, 1,
0.9589997, -1.189328, 2.793318, 0.9568627, 0, 1, 1,
0.9627211, -0.02225344, 2.028754, 0.9607843, 0, 1, 1,
0.9672579, 0.5266261, 0.2254068, 0.9686275, 0, 1, 1,
0.9684771, -0.03477521, 1.957852, 0.972549, 0, 1, 1,
0.9690748, -1.316215, 1.042989, 0.9803922, 0, 1, 1,
0.9767026, 0.760671, 2.191983, 0.9843137, 0, 1, 1,
0.9783117, -2.652439, 5.136664, 0.9921569, 0, 1, 1,
0.9803745, -1.381895, 2.716152, 0.9960784, 0, 1, 1,
0.9868666, 0.6883733, 1.510057, 1, 0, 0.9960784, 1,
0.9890385, 1.269013, 1.767321, 1, 0, 0.9882353, 1,
0.9987579, 0.6882613, 0.872298, 1, 0, 0.9843137, 1,
0.9994548, 1.319866, 1.001044, 1, 0, 0.9764706, 1,
1.001059, -0.1751712, 3.556873, 1, 0, 0.972549, 1,
1.004545, -0.2928283, 3.495633, 1, 0, 0.9647059, 1,
1.007655, -0.8129129, 2.278172, 1, 0, 0.9607843, 1,
1.012074, 0.5381344, -0.07068627, 1, 0, 0.9529412, 1,
1.017376, 0.6655592, -0.3933433, 1, 0, 0.9490196, 1,
1.024003, -0.7579249, 1.016203, 1, 0, 0.9411765, 1,
1.024507, 1.149083, 2.194818, 1, 0, 0.9372549, 1,
1.027728, 2.306836, 1.029966, 1, 0, 0.9294118, 1,
1.034299, 0.609741, 1.342848, 1, 0, 0.9254902, 1,
1.037301, -0.1688505, 2.666546, 1, 0, 0.9176471, 1,
1.041788, -0.3724503, 2.49894, 1, 0, 0.9137255, 1,
1.048699, 0.3958779, 0.4505439, 1, 0, 0.9058824, 1,
1.051097, -0.162044, 2.330682, 1, 0, 0.9019608, 1,
1.059898, -3.141604, 2.934299, 1, 0, 0.8941177, 1,
1.05998, -1.865951, 2.685752, 1, 0, 0.8862745, 1,
1.061062, -0.5817313, 2.667087, 1, 0, 0.8823529, 1,
1.065752, -0.2913411, 1.082765, 1, 0, 0.8745098, 1,
1.069314, 0.1004693, 0.7683742, 1, 0, 0.8705882, 1,
1.075183, 2.117863, 0.9207423, 1, 0, 0.8627451, 1,
1.075273, -0.5861372, 3.201923, 1, 0, 0.8588235, 1,
1.075839, 0.1933249, 1.106503, 1, 0, 0.8509804, 1,
1.080986, -0.3362759, 1.403297, 1, 0, 0.8470588, 1,
1.086867, 1.281488, -0.000945997, 1, 0, 0.8392157, 1,
1.097924, -1.344719, 1.821739, 1, 0, 0.8352941, 1,
1.098545, 0.2951733, 2.913413, 1, 0, 0.827451, 1,
1.10574, 1.882187, -1.305209, 1, 0, 0.8235294, 1,
1.110347, 0.4394616, 0.9395503, 1, 0, 0.8156863, 1,
1.113628, -0.5465616, 3.107629, 1, 0, 0.8117647, 1,
1.114758, -1.727782, 1.990418, 1, 0, 0.8039216, 1,
1.117582, 2.294469, -0.3654655, 1, 0, 0.7960784, 1,
1.118201, 0.04996404, 3.964238, 1, 0, 0.7921569, 1,
1.121938, -1.671513, 2.142982, 1, 0, 0.7843137, 1,
1.127974, 0.4120489, 2.905031, 1, 0, 0.7803922, 1,
1.130256, 0.2288159, 1.479538, 1, 0, 0.772549, 1,
1.130474, 1.382628, -0.7468562, 1, 0, 0.7686275, 1,
1.133288, 0.1181319, 0.6939775, 1, 0, 0.7607843, 1,
1.134628, -0.4928909, 0.9879452, 1, 0, 0.7568628, 1,
1.136926, 0.8902405, 0.6246513, 1, 0, 0.7490196, 1,
1.137634, 1.58019, 0.104574, 1, 0, 0.7450981, 1,
1.139089, 0.3389399, 0.7336864, 1, 0, 0.7372549, 1,
1.151551, 0.9713182, 0.3432026, 1, 0, 0.7333333, 1,
1.159497, -1.115807, 1.766153, 1, 0, 0.7254902, 1,
1.163258, 0.7819884, 1.752721, 1, 0, 0.7215686, 1,
1.168656, -1.397633, 3.786558, 1, 0, 0.7137255, 1,
1.183187, 1.766347, 1.433638, 1, 0, 0.7098039, 1,
1.188808, -0.4236032, 1.367868, 1, 0, 0.7019608, 1,
1.190845, -0.09653708, 3.074089, 1, 0, 0.6941177, 1,
1.191236, 0.04468174, 1.484544, 1, 0, 0.6901961, 1,
1.191286, -0.07807594, 0.6348659, 1, 0, 0.682353, 1,
1.200474, 1.691374, -0.2969862, 1, 0, 0.6784314, 1,
1.200695, -1.189566, 3.710523, 1, 0, 0.6705883, 1,
1.20331, 0.2376713, 1.543928, 1, 0, 0.6666667, 1,
1.207171, 1.251679, 1.846627, 1, 0, 0.6588235, 1,
1.218959, -1.798436, 1.18537, 1, 0, 0.654902, 1,
1.226045, -1.826171, 3.584002, 1, 0, 0.6470588, 1,
1.226279, 1.815757, -0.5337436, 1, 0, 0.6431373, 1,
1.226468, 0.09506578, 1.316773, 1, 0, 0.6352941, 1,
1.232475, -0.3393911, 4.041444, 1, 0, 0.6313726, 1,
1.234353, -0.3450179, 2.603136, 1, 0, 0.6235294, 1,
1.236903, 0.6101156, 2.133021, 1, 0, 0.6196079, 1,
1.241474, -2.534228, 2.961231, 1, 0, 0.6117647, 1,
1.251983, -1.036974, 2.119477, 1, 0, 0.6078432, 1,
1.254872, -0.403536, 2.831463, 1, 0, 0.6, 1,
1.263614, 0.2141394, 0.5611352, 1, 0, 0.5921569, 1,
1.266196, -0.9020835, 1.058011, 1, 0, 0.5882353, 1,
1.271142, 0.1506968, 1.448337, 1, 0, 0.5803922, 1,
1.292951, 0.5134308, 1.261559, 1, 0, 0.5764706, 1,
1.304186, -2.999742, 4.262229, 1, 0, 0.5686275, 1,
1.311274, 0.4415331, 2.191591, 1, 0, 0.5647059, 1,
1.31392, 0.9158683, 2.393548, 1, 0, 0.5568628, 1,
1.320377, -0.09947344, 2.19725, 1, 0, 0.5529412, 1,
1.323156, -0.3527244, 2.512732, 1, 0, 0.5450981, 1,
1.337816, 0.04173556, -1.916068, 1, 0, 0.5411765, 1,
1.338833, -1.428318, 3.274939, 1, 0, 0.5333334, 1,
1.340831, 0.5915046, 2.140863, 1, 0, 0.5294118, 1,
1.363057, -3.284292, 2.490168, 1, 0, 0.5215687, 1,
1.364374, 0.8849855, 0.1996258, 1, 0, 0.5176471, 1,
1.364604, 0.5771915, 0.7484863, 1, 0, 0.509804, 1,
1.371759, 1.862389, 0.1635459, 1, 0, 0.5058824, 1,
1.374853, 1.848667, 1.590118, 1, 0, 0.4980392, 1,
1.376511, 1.146773, 0.357157, 1, 0, 0.4901961, 1,
1.387132, -1.006987, 2.344585, 1, 0, 0.4862745, 1,
1.404473, -0.2845655, 2.153941, 1, 0, 0.4784314, 1,
1.407859, -1.17983, 4.662772, 1, 0, 0.4745098, 1,
1.409821, 0.7651696, -0.6822097, 1, 0, 0.4666667, 1,
1.429044, 0.3105823, 2.992855, 1, 0, 0.4627451, 1,
1.438209, -1.052338, 0.4465934, 1, 0, 0.454902, 1,
1.443233, -3.39863, 3.969379, 1, 0, 0.4509804, 1,
1.457188, 2.497241, 3.225499, 1, 0, 0.4431373, 1,
1.464594, -0.4126925, 2.287609, 1, 0, 0.4392157, 1,
1.476416, -0.9970706, 2.657237, 1, 0, 0.4313726, 1,
1.477715, -0.2802395, -0.05239346, 1, 0, 0.427451, 1,
1.482725, 2.293302, 0.9310014, 1, 0, 0.4196078, 1,
1.501372, -0.6474129, 1.426362, 1, 0, 0.4156863, 1,
1.508821, 0.5017612, 0.3058872, 1, 0, 0.4078431, 1,
1.513945, 0.8846804, 1.080003, 1, 0, 0.4039216, 1,
1.526524, 1.352752, 2.057294, 1, 0, 0.3960784, 1,
1.532234, -1.528303, 1.693205, 1, 0, 0.3882353, 1,
1.549727, -0.7468915, 1.467685, 1, 0, 0.3843137, 1,
1.550017, -0.0195417, 2.3639, 1, 0, 0.3764706, 1,
1.555771, 1.066426, 0.2842924, 1, 0, 0.372549, 1,
1.565445, 0.7791195, 0.5852794, 1, 0, 0.3647059, 1,
1.566721, -0.1309849, 1.563907, 1, 0, 0.3607843, 1,
1.572113, 0.9321504, 1.44316, 1, 0, 0.3529412, 1,
1.575857, 0.1143215, 1.826731, 1, 0, 0.3490196, 1,
1.580915, -0.2686002, 1.884437, 1, 0, 0.3411765, 1,
1.584468, -0.9955389, 0.3362733, 1, 0, 0.3372549, 1,
1.592212, 0.1993824, 1.25545, 1, 0, 0.3294118, 1,
1.594143, -1.788959, 1.456992, 1, 0, 0.3254902, 1,
1.597287, -0.9704584, 1.592633, 1, 0, 0.3176471, 1,
1.610708, 0.3364441, 2.432983, 1, 0, 0.3137255, 1,
1.613117, -0.9672257, 2.308049, 1, 0, 0.3058824, 1,
1.618107, 1.325736, 0.8060159, 1, 0, 0.2980392, 1,
1.628397, -0.7688594, 0.261052, 1, 0, 0.2941177, 1,
1.636117, 1.723632, 1.157029, 1, 0, 0.2862745, 1,
1.681683, 0.6794282, 1.529742, 1, 0, 0.282353, 1,
1.68236, 1.208955, 0.7927139, 1, 0, 0.2745098, 1,
1.688796, 0.4157764, 2.917715, 1, 0, 0.2705882, 1,
1.69437, 0.5204589, 2.20882, 1, 0, 0.2627451, 1,
1.696787, 1.218416, 1.268364, 1, 0, 0.2588235, 1,
1.706123, 0.8370388, 0.2247309, 1, 0, 0.2509804, 1,
1.745505, -1.021559, 1.287874, 1, 0, 0.2470588, 1,
1.755492, -1.265816, 2.539107, 1, 0, 0.2392157, 1,
1.759555, 1.920603, 1.415273, 1, 0, 0.2352941, 1,
1.774681, -0.6687478, 2.349164, 1, 0, 0.227451, 1,
1.791077, 0.8583203, 1.651641, 1, 0, 0.2235294, 1,
1.807119, -0.9654434, 1.913173, 1, 0, 0.2156863, 1,
1.810745, -0.9388504, 3.752293, 1, 0, 0.2117647, 1,
1.811118, -1.123992, 2.963918, 1, 0, 0.2039216, 1,
1.851125, 0.8797822, -0.9371568, 1, 0, 0.1960784, 1,
1.851558, -0.6413547, 2.654909, 1, 0, 0.1921569, 1,
1.851639, 0.8054982, 1.029283, 1, 0, 0.1843137, 1,
1.872937, 0.7429909, 2.505341, 1, 0, 0.1803922, 1,
1.876075, -0.05316197, 3.152923, 1, 0, 0.172549, 1,
1.877852, 1.033223, 1.525338, 1, 0, 0.1686275, 1,
1.88105, -0.5384402, 1.748751, 1, 0, 0.1607843, 1,
1.893864, 0.6490337, 0.3367429, 1, 0, 0.1568628, 1,
1.91484, -1.282332, 2.369638, 1, 0, 0.1490196, 1,
1.929381, 0.1161903, 2.298289, 1, 0, 0.145098, 1,
1.931246, -1.854799, 1.495319, 1, 0, 0.1372549, 1,
1.939599, 2.832596, 0.1606383, 1, 0, 0.1333333, 1,
1.941647, -0.3173717, 2.76976, 1, 0, 0.1254902, 1,
1.948617, -1.111319, 0.937043, 1, 0, 0.1215686, 1,
1.959424, -1.549566, 2.037769, 1, 0, 0.1137255, 1,
1.961359, 1.503335, 0.788869, 1, 0, 0.1098039, 1,
1.988958, 0.4832318, 1.311998, 1, 0, 0.1019608, 1,
2.000757, -0.7386559, 2.885072, 1, 0, 0.09411765, 1,
2.015713, -3.086416, 2.486993, 1, 0, 0.09019608, 1,
2.052588, 0.3991098, 0.4080547, 1, 0, 0.08235294, 1,
2.074221, -0.1060355, 0.4258921, 1, 0, 0.07843138, 1,
2.170688, -0.1246665, 3.206084, 1, 0, 0.07058824, 1,
2.23359, -0.2243235, 3.713803, 1, 0, 0.06666667, 1,
2.284557, 0.3635654, 0.8170239, 1, 0, 0.05882353, 1,
2.29661, -1.233706, 2.239288, 1, 0, 0.05490196, 1,
2.457407, -0.9382284, 1.675308, 1, 0, 0.04705882, 1,
2.483081, 1.463879, 2.528201, 1, 0, 0.04313726, 1,
2.516339, -1.774565, 1.941075, 1, 0, 0.03529412, 1,
2.632571, -1.593486, 2.300521, 1, 0, 0.03137255, 1,
2.703438, 0.6526874, 2.49024, 1, 0, 0.02352941, 1,
2.823655, -0.7253078, 4.321654, 1, 0, 0.01960784, 1,
2.862966, -0.6125308, 0.7653024, 1, 0, 0.01176471, 1,
3.120611, -1.243242, 2.069716, 1, 0, 0.007843138, 1
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
0.1323466, -4.466892, -6.348245, 0, -0.5, 0.5, 0.5,
0.1323466, -4.466892, -6.348245, 1, -0.5, 0.5, 0.5,
0.1323466, -4.466892, -6.348245, 1, 1.5, 0.5, 0.5,
0.1323466, -4.466892, -6.348245, 0, 1.5, 0.5, 0.5
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
-3.868939, -0.2474153, -6.348245, 0, -0.5, 0.5, 0.5,
-3.868939, -0.2474153, -6.348245, 1, -0.5, 0.5, 0.5,
-3.868939, -0.2474153, -6.348245, 1, 1.5, 0.5, 0.5,
-3.868939, -0.2474153, -6.348245, 0, 1.5, 0.5, 0.5
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
-3.868939, -4.466892, 0.6677635, 0, -0.5, 0.5, 0.5,
-3.868939, -4.466892, 0.6677635, 1, -0.5, 0.5, 0.5,
-3.868939, -4.466892, 0.6677635, 1, 1.5, 0.5, 0.5,
-3.868939, -4.466892, 0.6677635, 0, 1.5, 0.5, 0.5
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
-2, -3.493167, -4.729167,
3, -3.493167, -4.729167,
-2, -3.493167, -4.729167,
-2, -3.655454, -4.999013,
-1, -3.493167, -4.729167,
-1, -3.655454, -4.999013,
0, -3.493167, -4.729167,
0, -3.655454, -4.999013,
1, -3.493167, -4.729167,
1, -3.655454, -4.999013,
2, -3.493167, -4.729167,
2, -3.655454, -4.999013,
3, -3.493167, -4.729167,
3, -3.655454, -4.999013
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
-2, -3.980029, -5.538706, 0, -0.5, 0.5, 0.5,
-2, -3.980029, -5.538706, 1, -0.5, 0.5, 0.5,
-2, -3.980029, -5.538706, 1, 1.5, 0.5, 0.5,
-2, -3.980029, -5.538706, 0, 1.5, 0.5, 0.5,
-1, -3.980029, -5.538706, 0, -0.5, 0.5, 0.5,
-1, -3.980029, -5.538706, 1, -0.5, 0.5, 0.5,
-1, -3.980029, -5.538706, 1, 1.5, 0.5, 0.5,
-1, -3.980029, -5.538706, 0, 1.5, 0.5, 0.5,
0, -3.980029, -5.538706, 0, -0.5, 0.5, 0.5,
0, -3.980029, -5.538706, 1, -0.5, 0.5, 0.5,
0, -3.980029, -5.538706, 1, 1.5, 0.5, 0.5,
0, -3.980029, -5.538706, 0, 1.5, 0.5, 0.5,
1, -3.980029, -5.538706, 0, -0.5, 0.5, 0.5,
1, -3.980029, -5.538706, 1, -0.5, 0.5, 0.5,
1, -3.980029, -5.538706, 1, 1.5, 0.5, 0.5,
1, -3.980029, -5.538706, 0, 1.5, 0.5, 0.5,
2, -3.980029, -5.538706, 0, -0.5, 0.5, 0.5,
2, -3.980029, -5.538706, 1, -0.5, 0.5, 0.5,
2, -3.980029, -5.538706, 1, 1.5, 0.5, 0.5,
2, -3.980029, -5.538706, 0, 1.5, 0.5, 0.5,
3, -3.980029, -5.538706, 0, -0.5, 0.5, 0.5,
3, -3.980029, -5.538706, 1, -0.5, 0.5, 0.5,
3, -3.980029, -5.538706, 1, 1.5, 0.5, 0.5,
3, -3.980029, -5.538706, 0, 1.5, 0.5, 0.5
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
-2.945566, -3, -4.729167,
-2.945566, 2, -4.729167,
-2.945566, -3, -4.729167,
-3.099461, -3, -4.999013,
-2.945566, -2, -4.729167,
-3.099461, -2, -4.999013,
-2.945566, -1, -4.729167,
-3.099461, -1, -4.999013,
-2.945566, 0, -4.729167,
-3.099461, 0, -4.999013,
-2.945566, 1, -4.729167,
-3.099461, 1, -4.999013,
-2.945566, 2, -4.729167,
-3.099461, 2, -4.999013
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
-3.407253, -3, -5.538706, 0, -0.5, 0.5, 0.5,
-3.407253, -3, -5.538706, 1, -0.5, 0.5, 0.5,
-3.407253, -3, -5.538706, 1, 1.5, 0.5, 0.5,
-3.407253, -3, -5.538706, 0, 1.5, 0.5, 0.5,
-3.407253, -2, -5.538706, 0, -0.5, 0.5, 0.5,
-3.407253, -2, -5.538706, 1, -0.5, 0.5, 0.5,
-3.407253, -2, -5.538706, 1, 1.5, 0.5, 0.5,
-3.407253, -2, -5.538706, 0, 1.5, 0.5, 0.5,
-3.407253, -1, -5.538706, 0, -0.5, 0.5, 0.5,
-3.407253, -1, -5.538706, 1, -0.5, 0.5, 0.5,
-3.407253, -1, -5.538706, 1, 1.5, 0.5, 0.5,
-3.407253, -1, -5.538706, 0, 1.5, 0.5, 0.5,
-3.407253, 0, -5.538706, 0, -0.5, 0.5, 0.5,
-3.407253, 0, -5.538706, 1, -0.5, 0.5, 0.5,
-3.407253, 0, -5.538706, 1, 1.5, 0.5, 0.5,
-3.407253, 0, -5.538706, 0, 1.5, 0.5, 0.5,
-3.407253, 1, -5.538706, 0, -0.5, 0.5, 0.5,
-3.407253, 1, -5.538706, 1, -0.5, 0.5, 0.5,
-3.407253, 1, -5.538706, 1, 1.5, 0.5, 0.5,
-3.407253, 1, -5.538706, 0, 1.5, 0.5, 0.5,
-3.407253, 2, -5.538706, 0, -0.5, 0.5, 0.5,
-3.407253, 2, -5.538706, 1, -0.5, 0.5, 0.5,
-3.407253, 2, -5.538706, 1, 1.5, 0.5, 0.5,
-3.407253, 2, -5.538706, 0, 1.5, 0.5, 0.5
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
-2.945566, -3.493167, -4,
-2.945566, -3.493167, 4,
-2.945566, -3.493167, -4,
-3.099461, -3.655454, -4,
-2.945566, -3.493167, -2,
-3.099461, -3.655454, -2,
-2.945566, -3.493167, 0,
-3.099461, -3.655454, 0,
-2.945566, -3.493167, 2,
-3.099461, -3.655454, 2,
-2.945566, -3.493167, 4,
-3.099461, -3.655454, 4
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
-3.407253, -3.980029, -4, 0, -0.5, 0.5, 0.5,
-3.407253, -3.980029, -4, 1, -0.5, 0.5, 0.5,
-3.407253, -3.980029, -4, 1, 1.5, 0.5, 0.5,
-3.407253, -3.980029, -4, 0, 1.5, 0.5, 0.5,
-3.407253, -3.980029, -2, 0, -0.5, 0.5, 0.5,
-3.407253, -3.980029, -2, 1, -0.5, 0.5, 0.5,
-3.407253, -3.980029, -2, 1, 1.5, 0.5, 0.5,
-3.407253, -3.980029, -2, 0, 1.5, 0.5, 0.5,
-3.407253, -3.980029, 0, 0, -0.5, 0.5, 0.5,
-3.407253, -3.980029, 0, 1, -0.5, 0.5, 0.5,
-3.407253, -3.980029, 0, 1, 1.5, 0.5, 0.5,
-3.407253, -3.980029, 0, 0, 1.5, 0.5, 0.5,
-3.407253, -3.980029, 2, 0, -0.5, 0.5, 0.5,
-3.407253, -3.980029, 2, 1, -0.5, 0.5, 0.5,
-3.407253, -3.980029, 2, 1, 1.5, 0.5, 0.5,
-3.407253, -3.980029, 2, 0, 1.5, 0.5, 0.5,
-3.407253, -3.980029, 4, 0, -0.5, 0.5, 0.5,
-3.407253, -3.980029, 4, 1, -0.5, 0.5, 0.5,
-3.407253, -3.980029, 4, 1, 1.5, 0.5, 0.5,
-3.407253, -3.980029, 4, 0, 1.5, 0.5, 0.5
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
-2.945566, -3.493167, -4.729167,
-2.945566, 2.998336, -4.729167,
-2.945566, -3.493167, 6.064693,
-2.945566, 2.998336, 6.064693,
-2.945566, -3.493167, -4.729167,
-2.945566, -3.493167, 6.064693,
-2.945566, 2.998336, -4.729167,
-2.945566, 2.998336, 6.064693,
-2.945566, -3.493167, -4.729167,
3.210259, -3.493167, -4.729167,
-2.945566, -3.493167, 6.064693,
3.210259, -3.493167, 6.064693,
-2.945566, 2.998336, -4.729167,
3.210259, 2.998336, -4.729167,
-2.945566, 2.998336, 6.064693,
3.210259, 2.998336, 6.064693,
3.210259, -3.493167, -4.729167,
3.210259, 2.998336, -4.729167,
3.210259, -3.493167, 6.064693,
3.210259, 2.998336, 6.064693,
3.210259, -3.493167, -4.729167,
3.210259, -3.493167, 6.064693,
3.210259, 2.998336, -4.729167,
3.210259, 2.998336, 6.064693
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
var radius = 7.486042;
var distance = 33.30625;
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
mvMatrix.translate( -0.1323466, 0.2474153, -0.6677635 );
mvMatrix.scale( 1.314861, 1.246869, 0.7498759 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.30625);
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
bromadiolone<-read.table("bromadiolone.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-bromadiolone$V2
```

```
## Error in eval(expr, envir, enclos): object 'bromadiolone' not found
```

```r
y<-bromadiolone$V3
```

```
## Error in eval(expr, envir, enclos): object 'bromadiolone' not found
```

```r
z<-bromadiolone$V4
```

```
## Error in eval(expr, envir, enclos): object 'bromadiolone' not found
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
-2.855918, 0.02731232, -2.095475, 0, 0, 1, 1, 1,
-2.571208, -1.259008, -2.757669, 1, 0, 0, 1, 1,
-2.448648, 0.239795, -1.172734, 1, 0, 0, 1, 1,
-2.432874, 0.5336867, -3.085169, 1, 0, 0, 1, 1,
-2.361892, 0.267257, -0.9851941, 1, 0, 0, 1, 1,
-2.343621, 0.4474138, -0.3651001, 1, 0, 0, 1, 1,
-2.311656, 0.3851055, -1.871351, 0, 0, 0, 1, 1,
-2.309517, 0.1587463, -0.9541171, 0, 0, 0, 1, 1,
-2.283994, -0.8383918, -2.575222, 0, 0, 0, 1, 1,
-2.267386, -0.3655033, -0.1217897, 0, 0, 0, 1, 1,
-2.261359, 0.1885105, 0.5167864, 0, 0, 0, 1, 1,
-2.229871, -1.507397, -2.571226, 0, 0, 0, 1, 1,
-2.192497, 1.877432, -1.713431, 0, 0, 0, 1, 1,
-2.183969, -0.9283322, -2.03754, 1, 1, 1, 1, 1,
-2.170253, -0.6296301, -3.943, 1, 1, 1, 1, 1,
-2.167224, 0.0275686, -1.349374, 1, 1, 1, 1, 1,
-2.115283, 0.08526155, -2.280401, 1, 1, 1, 1, 1,
-2.100385, -0.1024619, -1.490968, 1, 1, 1, 1, 1,
-2.046988, 1.327425, 0.3781095, 1, 1, 1, 1, 1,
-2.006706, 0.1543996, -3.111816, 1, 1, 1, 1, 1,
-1.999876, 0.5367827, -2.286912, 1, 1, 1, 1, 1,
-1.988262, 1.049974, -1.96958, 1, 1, 1, 1, 1,
-1.968414, 0.0478363, -3.643469, 1, 1, 1, 1, 1,
-1.964835, -0.7785332, -2.188678, 1, 1, 1, 1, 1,
-1.954157, 0.7758859, -1.689992, 1, 1, 1, 1, 1,
-1.946055, -0.862346, -2.412236, 1, 1, 1, 1, 1,
-1.910654, 1.292502, -2.702213, 1, 1, 1, 1, 1,
-1.90154, 1.020509, -1.751665, 1, 1, 1, 1, 1,
-1.894607, -1.016046, -0.9694259, 0, 0, 1, 1, 1,
-1.886028, 0.2402611, -3.077638, 1, 0, 0, 1, 1,
-1.874675, 2.015832, -1.374144, 1, 0, 0, 1, 1,
-1.87337, -1.635692, 0.8253903, 1, 0, 0, 1, 1,
-1.859607, 0.1400563, -2.43235, 1, 0, 0, 1, 1,
-1.849669, 0.5976368, -4.123561, 1, 0, 0, 1, 1,
-1.845414, 0.1002675, -2.933714, 0, 0, 0, 1, 1,
-1.83135, -0.8484997, -1.95657, 0, 0, 0, 1, 1,
-1.82217, -0.2844909, -1.30498, 0, 0, 0, 1, 1,
-1.810784, 0.3936201, -1.702873, 0, 0, 0, 1, 1,
-1.81007, 1.076735, -1.581942, 0, 0, 0, 1, 1,
-1.799937, -0.05149743, -1.439382, 0, 0, 0, 1, 1,
-1.786723, 0.352775, -1.315693, 0, 0, 0, 1, 1,
-1.785385, -0.315677, -2.17994, 1, 1, 1, 1, 1,
-1.784998, 0.01156662, -0.8535348, 1, 1, 1, 1, 1,
-1.778793, -0.4256944, -2.503856, 1, 1, 1, 1, 1,
-1.74847, 1.224257, -0.4261751, 1, 1, 1, 1, 1,
-1.746339, 0.872744, 0.09930538, 1, 1, 1, 1, 1,
-1.731834, 0.3625265, -0.8755506, 1, 1, 1, 1, 1,
-1.719455, 1.64933, -0.898799, 1, 1, 1, 1, 1,
-1.717362, 0.7622272, -3.269988, 1, 1, 1, 1, 1,
-1.708273, 0.1819168, -2.487287, 1, 1, 1, 1, 1,
-1.694642, -0.614014, -1.964713, 1, 1, 1, 1, 1,
-1.677561, 0.2327994, -1.058563, 1, 1, 1, 1, 1,
-1.67301, -0.4317141, -1.796388, 1, 1, 1, 1, 1,
-1.67125, -0.1212085, -2.132677, 1, 1, 1, 1, 1,
-1.659162, -0.2383543, -1.698652, 1, 1, 1, 1, 1,
-1.631565, -0.8278399, -2.032391, 1, 1, 1, 1, 1,
-1.625943, 0.4572078, -1.354174, 0, 0, 1, 1, 1,
-1.61709, -2.442689, -2.165105, 1, 0, 0, 1, 1,
-1.616197, 0.8231583, -0.9151464, 1, 0, 0, 1, 1,
-1.600431, -2.084743, -2.351631, 1, 0, 0, 1, 1,
-1.598385, -1.402742, -1.44389, 1, 0, 0, 1, 1,
-1.595642, -0.7751543, -2.086568, 1, 0, 0, 1, 1,
-1.585901, 1.191548, -1.07321, 0, 0, 0, 1, 1,
-1.574714, 0.1766261, -0.6318864, 0, 0, 0, 1, 1,
-1.572571, 0.2698531, -2.957162, 0, 0, 0, 1, 1,
-1.562703, -1.176776, -1.105185, 0, 0, 0, 1, 1,
-1.561932, -0.2001968, -1.321735, 0, 0, 0, 1, 1,
-1.543408, -0.6064966, -1.278069, 0, 0, 0, 1, 1,
-1.538378, -0.6722483, -3.340129, 0, 0, 0, 1, 1,
-1.536899, -3.312679, -4.474366, 1, 1, 1, 1, 1,
-1.512929, 2.036277, 0.2217504, 1, 1, 1, 1, 1,
-1.512678, -0.3720404, -2.108258, 1, 1, 1, 1, 1,
-1.509073, 0.1332783, 0.3931669, 1, 1, 1, 1, 1,
-1.508684, -1.011403, -3.661829, 1, 1, 1, 1, 1,
-1.497332, 0.4075613, -0.9911969, 1, 1, 1, 1, 1,
-1.496807, 0.3230051, -2.00346, 1, 1, 1, 1, 1,
-1.496413, 0.4839663, -1.218002, 1, 1, 1, 1, 1,
-1.487306, -1.608999, -2.655371, 1, 1, 1, 1, 1,
-1.482793, 0.7821828, 0.3066477, 1, 1, 1, 1, 1,
-1.466387, -0.01961774, -1.260524, 1, 1, 1, 1, 1,
-1.457977, 0.9979665, -2.182093, 1, 1, 1, 1, 1,
-1.456547, -0.4766121, -1.473631, 1, 1, 1, 1, 1,
-1.448497, 1.323185, 0.08040135, 1, 1, 1, 1, 1,
-1.445505, -0.4065814, 0.04908288, 1, 1, 1, 1, 1,
-1.441985, 0.9653468, 0.9466863, 0, 0, 1, 1, 1,
-1.434598, -2.056412, -1.546716, 1, 0, 0, 1, 1,
-1.430531, 0.8759919, -0.8951846, 1, 0, 0, 1, 1,
-1.41926, 0.9554384, -2.839176, 1, 0, 0, 1, 1,
-1.416039, 0.5881795, -1.261635, 1, 0, 0, 1, 1,
-1.414784, -0.4038534, -1.0165, 1, 0, 0, 1, 1,
-1.403704, -0.1282546, -1.68919, 0, 0, 0, 1, 1,
-1.401558, 2.794418, 0.31923, 0, 0, 0, 1, 1,
-1.395119, 0.2513485, -0.7271531, 0, 0, 0, 1, 1,
-1.38591, -0.1814118, -2.676688, 0, 0, 0, 1, 1,
-1.38572, 0.04829052, -0.6025553, 0, 0, 0, 1, 1,
-1.37811, 0.1838218, -1.206081, 0, 0, 0, 1, 1,
-1.377491, -0.9631772, -3.102155, 0, 0, 0, 1, 1,
-1.37521, -1.542084, -2.875997, 1, 1, 1, 1, 1,
-1.371234, -1.141285, -3.013345, 1, 1, 1, 1, 1,
-1.367335, 1.337906, 2.345772, 1, 1, 1, 1, 1,
-1.360082, 0.8310786, -2.075778, 1, 1, 1, 1, 1,
-1.35891, -1.694521, -3.318787, 1, 1, 1, 1, 1,
-1.355107, 0.07928023, -1.393335, 1, 1, 1, 1, 1,
-1.34261, 1.752973, -0.0153086, 1, 1, 1, 1, 1,
-1.32213, -0.5179839, -2.18551, 1, 1, 1, 1, 1,
-1.320008, -0.2515675, -1.56353, 1, 1, 1, 1, 1,
-1.315782, 1.38014, -2.419405, 1, 1, 1, 1, 1,
-1.299557, 0.9491836, -1.512755, 1, 1, 1, 1, 1,
-1.298954, 0.5147535, -2.445407, 1, 1, 1, 1, 1,
-1.29488, -1.130828, -1.586126, 1, 1, 1, 1, 1,
-1.293005, -0.1032544, -1.708986, 1, 1, 1, 1, 1,
-1.286839, -0.1234611, -1.190567, 1, 1, 1, 1, 1,
-1.282424, 2.259785, 1.041281, 0, 0, 1, 1, 1,
-1.281743, -0.08988199, -2.007341, 1, 0, 0, 1, 1,
-1.27909, 0.62341, -0.685711, 1, 0, 0, 1, 1,
-1.275813, -0.2398539, -1.539493, 1, 0, 0, 1, 1,
-1.271764, -0.6230254, -1.942688, 1, 0, 0, 1, 1,
-1.271002, 2.305629, 0.005278639, 1, 0, 0, 1, 1,
-1.265234, -0.9927059, -3.634372, 0, 0, 0, 1, 1,
-1.263917, -0.3665605, -1.621684, 0, 0, 0, 1, 1,
-1.260715, -1.370062, -1.078514, 0, 0, 0, 1, 1,
-1.232929, 0.244024, -0.8554801, 0, 0, 0, 1, 1,
-1.229965, 0.287308, -1.31558, 0, 0, 0, 1, 1,
-1.222962, 0.3348044, -1.912913, 0, 0, 0, 1, 1,
-1.196215, -0.6696348, -1.182162, 0, 0, 0, 1, 1,
-1.190852, -0.3406542, -0.8491884, 1, 1, 1, 1, 1,
-1.189398, -1.093808, -2.977917, 1, 1, 1, 1, 1,
-1.187339, -1.099606, -1.765024, 1, 1, 1, 1, 1,
-1.185921, 0.5132033, -0.8275076, 1, 1, 1, 1, 1,
-1.185085, 0.7972927, -2.025944, 1, 1, 1, 1, 1,
-1.161908, -1.236903, -1.974971, 1, 1, 1, 1, 1,
-1.155556, -1.235417, -3.023593, 1, 1, 1, 1, 1,
-1.143368, 0.1521577, -1.533772, 1, 1, 1, 1, 1,
-1.142575, -0.4006142, -1.482082, 1, 1, 1, 1, 1,
-1.136307, 0.5524858, -1.094864, 1, 1, 1, 1, 1,
-1.116704, 1.533941, -0.03377352, 1, 1, 1, 1, 1,
-1.115048, 1.193317, -2.515886, 1, 1, 1, 1, 1,
-1.103722, 1.482106, -0.01579442, 1, 1, 1, 1, 1,
-1.103022, 0.8474696, -0.9570773, 1, 1, 1, 1, 1,
-1.102417, -0.2353007, -1.773038, 1, 1, 1, 1, 1,
-1.098597, -0.1780132, -2.736092, 0, 0, 1, 1, 1,
-1.094938, -1.758837, -3.212137, 1, 0, 0, 1, 1,
-1.084927, -1.260253, -2.696519, 1, 0, 0, 1, 1,
-1.076234, -0.8387929, -0.09176037, 1, 0, 0, 1, 1,
-1.073923, -0.9098688, -1.741522, 1, 0, 0, 1, 1,
-1.073572, -0.2564565, -0.3951855, 1, 0, 0, 1, 1,
-1.070716, 0.3042626, 0.07609583, 0, 0, 0, 1, 1,
-1.066869, 0.2213791, -1.819998, 0, 0, 0, 1, 1,
-1.064753, 0.5442035, -1.589858, 0, 0, 0, 1, 1,
-1.061565, -0.1946373, -1.365696, 0, 0, 0, 1, 1,
-1.05705, 0.3929558, -2.034487, 0, 0, 0, 1, 1,
-1.046358, 1.005819, -0.1946767, 0, 0, 0, 1, 1,
-1.039029, -0.2086839, -1.493845, 0, 0, 0, 1, 1,
-1.038398, -1.619741, -2.731166, 1, 1, 1, 1, 1,
-1.037572, -0.9007878, -1.484063, 1, 1, 1, 1, 1,
-1.02808, -0.6973222, -3.234075, 1, 1, 1, 1, 1,
-1.019119, 0.09403044, -1.610187, 1, 1, 1, 1, 1,
-1.018636, 1.487087, 1.096149, 1, 1, 1, 1, 1,
-1.016862, 0.3892885, -1.876997, 1, 1, 1, 1, 1,
-1.015005, -1.71829, -3.092467, 1, 1, 1, 1, 1,
-1.006117, -0.1637453, -2.268343, 1, 1, 1, 1, 1,
-1.003604, 0.6341413, -1.502526, 1, 1, 1, 1, 1,
-1.002432, -0.8581432, -2.95862, 1, 1, 1, 1, 1,
-0.9978998, -0.7767767, -1.281794, 1, 1, 1, 1, 1,
-0.9927747, -0.7615854, -0.3906566, 1, 1, 1, 1, 1,
-0.9917125, -0.5054198, -0.6549776, 1, 1, 1, 1, 1,
-0.989876, 0.1878888, -0.8997443, 1, 1, 1, 1, 1,
-0.9897925, -0.6539465, -0.06611942, 1, 1, 1, 1, 1,
-0.9886534, -1.633933, -2.698862, 0, 0, 1, 1, 1,
-0.9869342, 1.010874, -1.87062, 1, 0, 0, 1, 1,
-0.9701431, -0.807443, -2.280707, 1, 0, 0, 1, 1,
-0.9628011, 0.1541905, -1.508588, 1, 0, 0, 1, 1,
-0.951674, -1.759834, -1.671718, 1, 0, 0, 1, 1,
-0.9464501, -0.4632272, -1.063138, 1, 0, 0, 1, 1,
-0.9388545, -0.0601417, -2.950292, 0, 0, 0, 1, 1,
-0.9383485, 0.5653933, -1.283381, 0, 0, 0, 1, 1,
-0.9360008, 0.6269693, -2.162437, 0, 0, 0, 1, 1,
-0.9292831, 0.4029197, 0.2600297, 0, 0, 0, 1, 1,
-0.9288189, 2.637465, 1.70298, 0, 0, 0, 1, 1,
-0.9285964, 1.424498, 0.0301736, 0, 0, 0, 1, 1,
-0.92795, 1.428272, -1.917282, 0, 0, 0, 1, 1,
-0.92516, -1.305735, -4.337023, 1, 1, 1, 1, 1,
-0.9225644, 0.5924456, -1.923331, 1, 1, 1, 1, 1,
-0.9147351, -1.126407, -1.293578, 1, 1, 1, 1, 1,
-0.9097645, -0.06960934, -0.595499, 1, 1, 1, 1, 1,
-0.9073502, -2.171183, -1.739131, 1, 1, 1, 1, 1,
-0.9067997, 0.4155838, -1.10186, 1, 1, 1, 1, 1,
-0.8991094, 0.1910897, -1.929429, 1, 1, 1, 1, 1,
-0.8978256, 0.03755279, -1.99156, 1, 1, 1, 1, 1,
-0.8964661, 0.5889085, -0.8013697, 1, 1, 1, 1, 1,
-0.8961794, -1.512997, -3.070242, 1, 1, 1, 1, 1,
-0.892097, 0.2884808, -1.677703, 1, 1, 1, 1, 1,
-0.891081, -0.287087, -2.206795, 1, 1, 1, 1, 1,
-0.8909204, 0.2795532, -1.390884, 1, 1, 1, 1, 1,
-0.8905954, 0.8825486, -0.8604053, 1, 1, 1, 1, 1,
-0.8889295, -0.01134049, -0.1085913, 1, 1, 1, 1, 1,
-0.8812012, -0.2386966, -1.953533, 0, 0, 1, 1, 1,
-0.8751791, 0.8543804, -1.056362, 1, 0, 0, 1, 1,
-0.8701428, 1.161908, 0.1238342, 1, 0, 0, 1, 1,
-0.8601531, 0.4354435, -1.516534, 1, 0, 0, 1, 1,
-0.8591414, 2.107944, 0.1615449, 1, 0, 0, 1, 1,
-0.8557791, -1.537681, -1.236524, 1, 0, 0, 1, 1,
-0.8554674, -0.2299575, -2.94816, 0, 0, 0, 1, 1,
-0.8426903, 1.377264, 1.053315, 0, 0, 0, 1, 1,
-0.8397292, 1.314865, -0.8573979, 0, 0, 0, 1, 1,
-0.8386247, 1.198747, -0.282178, 0, 0, 0, 1, 1,
-0.8385568, 0.7813059, -0.546324, 0, 0, 0, 1, 1,
-0.8378138, 0.9479609, -2.754291, 0, 0, 0, 1, 1,
-0.8351221, 0.481163, -1.204819, 0, 0, 0, 1, 1,
-0.8331646, -0.8586867, -2.503393, 1, 1, 1, 1, 1,
-0.8327177, 0.06455933, -2.707566, 1, 1, 1, 1, 1,
-0.8307893, -0.0005389572, -0.3744207, 1, 1, 1, 1, 1,
-0.830759, -1.59846, -3.132427, 1, 1, 1, 1, 1,
-0.8298407, -0.7110963, -3.196673, 1, 1, 1, 1, 1,
-0.8246322, 1.525978, -0.379133, 1, 1, 1, 1, 1,
-0.8245312, -0.1204099, -1.647872, 1, 1, 1, 1, 1,
-0.8172291, -0.8041335, -3.86702, 1, 1, 1, 1, 1,
-0.8162345, -0.7977248, -3.287014, 1, 1, 1, 1, 1,
-0.8144405, 1.588473, -0.6367618, 1, 1, 1, 1, 1,
-0.8062342, 1.513467, -0.3166747, 1, 1, 1, 1, 1,
-0.8050363, 0.6306355, -0.4220475, 1, 1, 1, 1, 1,
-0.79963, 0.8658987, -0.4154039, 1, 1, 1, 1, 1,
-0.7938048, -0.09485729, -1.165843, 1, 1, 1, 1, 1,
-0.7917521, 1.193544, 0.8263155, 1, 1, 1, 1, 1,
-0.7847117, 0.9564995, -1.263162, 0, 0, 1, 1, 1,
-0.7825184, -0.2801496, -1.772145, 1, 0, 0, 1, 1,
-0.7800372, 0.6125311, -2.098895, 1, 0, 0, 1, 1,
-0.7761126, -0.1543749, -1.740172, 1, 0, 0, 1, 1,
-0.7743049, 0.2499822, -0.03468057, 1, 0, 0, 1, 1,
-0.7740796, -0.1410321, -2.395829, 1, 0, 0, 1, 1,
-0.7739041, -2.002017, -2.694041, 0, 0, 0, 1, 1,
-0.7711725, -2.687047, -2.517576, 0, 0, 0, 1, 1,
-0.7681052, -1.967769, -1.10813, 0, 0, 0, 1, 1,
-0.7626463, -1.14909, -2.455888, 0, 0, 0, 1, 1,
-0.7619219, 1.282675, -1.010455, 0, 0, 0, 1, 1,
-0.759634, -0.346047, -1.697847, 0, 0, 0, 1, 1,
-0.7532478, 0.7426351, -0.3567503, 0, 0, 0, 1, 1,
-0.7522781, -0.3013372, -2.198107, 1, 1, 1, 1, 1,
-0.7481872, 1.370832, 1.522747, 1, 1, 1, 1, 1,
-0.7461147, 1.225175, -0.20077, 1, 1, 1, 1, 1,
-0.744309, -0.3949519, 0.003964642, 1, 1, 1, 1, 1,
-0.7399681, 1.288103, -2.375641, 1, 1, 1, 1, 1,
-0.7394486, 0.2073336, -1.405128, 1, 1, 1, 1, 1,
-0.7336668, 0.176542, -1.226463, 1, 1, 1, 1, 1,
-0.7314575, -0.5485535, -2.396708, 1, 1, 1, 1, 1,
-0.730787, -0.7937943, -2.641685, 1, 1, 1, 1, 1,
-0.7279145, 0.873094, -0.352783, 1, 1, 1, 1, 1,
-0.7271131, 0.4532574, -1.45145, 1, 1, 1, 1, 1,
-0.7259443, -2.240949, -3.162088, 1, 1, 1, 1, 1,
-0.7213179, -0.766803, -0.8690756, 1, 1, 1, 1, 1,
-0.7197925, -0.2676589, -2.580038, 1, 1, 1, 1, 1,
-0.7178167, 0.5303053, -0.6318707, 1, 1, 1, 1, 1,
-0.717182, 1.346573, -1.09372, 0, 0, 1, 1, 1,
-0.7143967, 0.7297961, -1.533364, 1, 0, 0, 1, 1,
-0.7088753, 1.417896, 0.1478089, 1, 0, 0, 1, 1,
-0.7068597, -0.08201771, 0.3577129, 1, 0, 0, 1, 1,
-0.7061438, -2.175454, -3.733814, 1, 0, 0, 1, 1,
-0.6953751, 1.112214, 1.02013, 1, 0, 0, 1, 1,
-0.6947972, 1.257905, 1.182239, 0, 0, 0, 1, 1,
-0.686535, 1.58418, 0.3607394, 0, 0, 0, 1, 1,
-0.6835428, 1.686298, -0.7224044, 0, 0, 0, 1, 1,
-0.6776397, -1.014669, -1.91524, 0, 0, 0, 1, 1,
-0.6762289, -1.230737, -1.710448, 0, 0, 0, 1, 1,
-0.6746863, -0.8243128, -2.71306, 0, 0, 0, 1, 1,
-0.6722811, 1.48013, 0.5038037, 0, 0, 0, 1, 1,
-0.6679328, 1.537032, -0.1488744, 1, 1, 1, 1, 1,
-0.6678373, 1.023345, -1.368482, 1, 1, 1, 1, 1,
-0.6653903, -0.5571881, -0.4464011, 1, 1, 1, 1, 1,
-0.6651101, -0.6555898, -1.77614, 1, 1, 1, 1, 1,
-0.6605116, 0.2820637, -0.7980015, 1, 1, 1, 1, 1,
-0.6595947, -1.273782, -2.558127, 1, 1, 1, 1, 1,
-0.6552009, 0.6964211, -1.962613, 1, 1, 1, 1, 1,
-0.6542548, -0.4819722, -1.096536, 1, 1, 1, 1, 1,
-0.6541755, 0.6165337, -1.560659, 1, 1, 1, 1, 1,
-0.6490141, 0.4565336, -1.553085, 1, 1, 1, 1, 1,
-0.6409832, 0.2935445, -0.4351339, 1, 1, 1, 1, 1,
-0.6379502, 2.456169, -1.070962, 1, 1, 1, 1, 1,
-0.6369914, -0.3540761, -2.473552, 1, 1, 1, 1, 1,
-0.6349255, 0.2304597, -2.232426, 1, 1, 1, 1, 1,
-0.6328206, -0.3971436, -2.26106, 1, 1, 1, 1, 1,
-0.6303868, -0.9494883, -2.650345, 0, 0, 1, 1, 1,
-0.6264831, 0.361307, -0.9631818, 1, 0, 0, 1, 1,
-0.6246222, 0.9258841, -1.459182, 1, 0, 0, 1, 1,
-0.6187749, 0.7213611, -3.003047, 1, 0, 0, 1, 1,
-0.6164427, -0.8426768, -0.7169595, 1, 0, 0, 1, 1,
-0.6152924, -0.3647361, -2.400885, 1, 0, 0, 1, 1,
-0.614062, 1.569062, 1.446647, 0, 0, 0, 1, 1,
-0.606814, 2.075753, 0.7033862, 0, 0, 0, 1, 1,
-0.6064354, -1.457497, -3.195318, 0, 0, 0, 1, 1,
-0.6058657, -0.7958462, -2.668946, 0, 0, 0, 1, 1,
-0.6053697, 0.3845075, -2.510092, 0, 0, 0, 1, 1,
-0.5996419, -1.971491, -1.839664, 0, 0, 0, 1, 1,
-0.592492, 1.297021, -1.415356, 0, 0, 0, 1, 1,
-0.5893295, -0.1855478, -1.354786, 1, 1, 1, 1, 1,
-0.5859752, -1.041695, -2.680647, 1, 1, 1, 1, 1,
-0.5833603, 0.2299011, 0.8468654, 1, 1, 1, 1, 1,
-0.5789148, -0.01270547, -1.824202, 1, 1, 1, 1, 1,
-0.5752413, 0.1002124, -2.779067, 1, 1, 1, 1, 1,
-0.5692574, 0.4591781, -0.509399, 1, 1, 1, 1, 1,
-0.5667049, 0.9354171, -0.2725016, 1, 1, 1, 1, 1,
-0.5643831, 0.2231923, -0.2327527, 1, 1, 1, 1, 1,
-0.561901, 1.218829, -0.09718034, 1, 1, 1, 1, 1,
-0.5616978, 0.7826611, -0.826956, 1, 1, 1, 1, 1,
-0.5591936, -0.6075454, -3.506962, 1, 1, 1, 1, 1,
-0.5579734, -0.8297902, -3.763727, 1, 1, 1, 1, 1,
-0.5578268, 0.9737648, -1.75438, 1, 1, 1, 1, 1,
-0.5571942, 1.27035, -0.3633547, 1, 1, 1, 1, 1,
-0.549514, 2.403151, 0.2435272, 1, 1, 1, 1, 1,
-0.5477291, -0.8680543, -3.164631, 0, 0, 1, 1, 1,
-0.5459293, -0.2803756, -1.349519, 1, 0, 0, 1, 1,
-0.5442545, -0.1270877, -0.1315066, 1, 0, 0, 1, 1,
-0.5419086, 0.9444916, 0.6027031, 1, 0, 0, 1, 1,
-0.5413547, 1.454785, 0.2769921, 1, 0, 0, 1, 1,
-0.5413272, -1.751871, -3.612071, 1, 0, 0, 1, 1,
-0.5351738, -0.2181919, -2.486593, 0, 0, 0, 1, 1,
-0.5275035, 0.8935782, -0.9291607, 0, 0, 0, 1, 1,
-0.5260282, 2.290448, -0.1660233, 0, 0, 0, 1, 1,
-0.5248482, 0.7558315, -0.8402434, 0, 0, 0, 1, 1,
-0.5235958, -0.7430064, -3.130912, 0, 0, 0, 1, 1,
-0.5206399, -0.8402818, -3.090503, 0, 0, 0, 1, 1,
-0.5167534, 1.429138, -0.8831756, 0, 0, 0, 1, 1,
-0.5165741, 2.354937, -0.697047, 1, 1, 1, 1, 1,
-0.5049382, 0.9146399, -1.309663, 1, 1, 1, 1, 1,
-0.5048072, 0.8709489, -0.5871041, 1, 1, 1, 1, 1,
-0.5025102, 0.6485304, 0.4216417, 1, 1, 1, 1, 1,
-0.501707, -0.2153746, -3.542514, 1, 1, 1, 1, 1,
-0.4997267, -0.2859525, -0.1919235, 1, 1, 1, 1, 1,
-0.4918005, -0.7303745, -1.290857, 1, 1, 1, 1, 1,
-0.4899182, 0.7265819, 0.1527406, 1, 1, 1, 1, 1,
-0.4864285, -0.1238482, -1.848323, 1, 1, 1, 1, 1,
-0.4859959, 1.754308, -0.1069227, 1, 1, 1, 1, 1,
-0.4833713, -0.1851239, -1.27647, 1, 1, 1, 1, 1,
-0.4821329, 1.065216, 1.225748, 1, 1, 1, 1, 1,
-0.4817277, -0.664436, -0.7606668, 1, 1, 1, 1, 1,
-0.4807106, 1.094486, 0.1408868, 1, 1, 1, 1, 1,
-0.4772995, -1.720785, -2.133012, 1, 1, 1, 1, 1,
-0.4734666, -0.8345239, -2.218938, 0, 0, 1, 1, 1,
-0.4672473, 1.899358, 1.169876, 1, 0, 0, 1, 1,
-0.4669979, 1.613393, -0.12291, 1, 0, 0, 1, 1,
-0.4648654, -1.648811, -1.020565, 1, 0, 0, 1, 1,
-0.4639761, -0.4118358, -1.902798, 1, 0, 0, 1, 1,
-0.4591791, -3.04502, -2.87644, 1, 0, 0, 1, 1,
-0.4565985, -0.8187625, -2.496722, 0, 0, 0, 1, 1,
-0.4560174, -1.262731, -1.231953, 0, 0, 0, 1, 1,
-0.4427779, -0.2473809, -3.365767, 0, 0, 0, 1, 1,
-0.4409708, 1.391101, -0.5154257, 0, 0, 0, 1, 1,
-0.4378636, 0.7213559, -1.415461, 0, 0, 0, 1, 1,
-0.4344912, 0.01199557, -1.837502, 0, 0, 0, 1, 1,
-0.4338815, 0.3969645, 0.1630216, 0, 0, 0, 1, 1,
-0.4295322, 0.2534955, 1.221344, 1, 1, 1, 1, 1,
-0.4292462, -0.3604697, -1.133195, 1, 1, 1, 1, 1,
-0.4287123, -0.8652686, -1.468148, 1, 1, 1, 1, 1,
-0.4281947, -0.558063, -1.700546, 1, 1, 1, 1, 1,
-0.4090703, -0.6260851, -2.021615, 1, 1, 1, 1, 1,
-0.4038897, -1.617054, -2.274437, 1, 1, 1, 1, 1,
-0.4030084, 1.02948, -0.850934, 1, 1, 1, 1, 1,
-0.4018835, -1.61363, -2.562191, 1, 1, 1, 1, 1,
-0.4018418, -1.446155, -1.752478, 1, 1, 1, 1, 1,
-0.3978035, 0.6295536, -0.311261, 1, 1, 1, 1, 1,
-0.3928758, 1.710837, 0.3730833, 1, 1, 1, 1, 1,
-0.3882784, -1.056613, -2.709493, 1, 1, 1, 1, 1,
-0.3808928, -0.1663383, -0.641768, 1, 1, 1, 1, 1,
-0.3787484, 0.4602807, -1.439401, 1, 1, 1, 1, 1,
-0.3755369, -0.6059118, -2.777141, 1, 1, 1, 1, 1,
-0.3723217, -0.9287547, -1.559264, 0, 0, 1, 1, 1,
-0.3715836, -0.6322017, -3.455821, 1, 0, 0, 1, 1,
-0.3675146, 0.9657626, 0.121466, 1, 0, 0, 1, 1,
-0.3628851, 0.2120257, -2.449608, 1, 0, 0, 1, 1,
-0.3603348, 1.709674, -0.7260743, 1, 0, 0, 1, 1,
-0.3592556, 0.1658592, -1.245191, 1, 0, 0, 1, 1,
-0.3588507, -0.2204608, -3.417887, 0, 0, 0, 1, 1,
-0.3559622, 0.1722755, -1.339941, 0, 0, 0, 1, 1,
-0.3558593, -0.1581243, -2.924182, 0, 0, 0, 1, 1,
-0.349571, 0.1712316, -0.6054615, 0, 0, 0, 1, 1,
-0.3469998, -0.3036273, -0.5298074, 0, 0, 0, 1, 1,
-0.3444998, 0.1277885, -2.806126, 0, 0, 0, 1, 1,
-0.3434815, -0.1874456, -2.89835, 0, 0, 0, 1, 1,
-0.3414605, -1.37133, -2.236849, 1, 1, 1, 1, 1,
-0.3397043, 0.5053633, 0.3119532, 1, 1, 1, 1, 1,
-0.3246453, 0.5912893, -0.9874839, 1, 1, 1, 1, 1,
-0.3230173, 0.3284299, -0.6500853, 1, 1, 1, 1, 1,
-0.3200941, -1.600763, -2.366494, 1, 1, 1, 1, 1,
-0.3128537, -0.3604252, -2.943482, 1, 1, 1, 1, 1,
-0.309017, 1.391224, -0.7019466, 1, 1, 1, 1, 1,
-0.304389, -2.416998, -1.683496, 1, 1, 1, 1, 1,
-0.2973761, -1.055544, -4.286932, 1, 1, 1, 1, 1,
-0.2972406, 2.25234, 1.120369, 1, 1, 1, 1, 1,
-0.2954938, 0.913532, -0.550011, 1, 1, 1, 1, 1,
-0.2920753, 0.1492265, -0.807707, 1, 1, 1, 1, 1,
-0.291842, 0.08303639, -2.741987, 1, 1, 1, 1, 1,
-0.2882454, 1.180674, -1.060948, 1, 1, 1, 1, 1,
-0.2879202, 0.7777994, 0.3950269, 1, 1, 1, 1, 1,
-0.2863043, -0.4798825, -2.457303, 0, 0, 1, 1, 1,
-0.2826605, -1.969851, -2.579406, 1, 0, 0, 1, 1,
-0.2788056, 0.2700997, -0.9445126, 1, 0, 0, 1, 1,
-0.2686312, -0.5709372, -4.02969, 1, 0, 0, 1, 1,
-0.2652805, 0.2508219, 0.174349, 1, 0, 0, 1, 1,
-0.2598907, -0.6546623, -2.387905, 1, 0, 0, 1, 1,
-0.2555995, -0.3811075, -3.719713, 0, 0, 0, 1, 1,
-0.2515028, 0.7404853, -0.9664331, 0, 0, 0, 1, 1,
-0.2507037, 0.1760236, -0.630124, 0, 0, 0, 1, 1,
-0.2421013, -0.2030804, -1.57318, 0, 0, 0, 1, 1,
-0.2373878, -0.9721972, -4.571974, 0, 0, 0, 1, 1,
-0.2355544, -0.6054339, -3.046364, 0, 0, 0, 1, 1,
-0.2330004, -0.4257931, -4.078444, 0, 0, 0, 1, 1,
-0.2324434, 0.5864547, -3.070343, 1, 1, 1, 1, 1,
-0.2279803, 0.7934979, -1.781999, 1, 1, 1, 1, 1,
-0.2261038, 1.183551, -1.533369, 1, 1, 1, 1, 1,
-0.2249382, -0.022197, -2.119823, 1, 1, 1, 1, 1,
-0.2203928, -0.3637795, -2.072901, 1, 1, 1, 1, 1,
-0.2201171, -0.7866818, -2.60674, 1, 1, 1, 1, 1,
-0.2191964, -0.5310771, -3.111919, 1, 1, 1, 1, 1,
-0.2153266, -0.8640348, -3.466211, 1, 1, 1, 1, 1,
-0.2148159, 0.009691133, -1.910031, 1, 1, 1, 1, 1,
-0.214809, 0.3519464, -1.463207, 1, 1, 1, 1, 1,
-0.2107644, 0.2235598, 1.073143, 1, 1, 1, 1, 1,
-0.2090138, 0.6292888, -2.113293, 1, 1, 1, 1, 1,
-0.2089023, 0.9920338, 1.567792, 1, 1, 1, 1, 1,
-0.204468, 0.6993742, -1.671443, 1, 1, 1, 1, 1,
-0.204206, 1.272622, 0.2588544, 1, 1, 1, 1, 1,
-0.2030344, 1.524986, -0.380795, 0, 0, 1, 1, 1,
-0.1940292, -1.054164, -2.645627, 1, 0, 0, 1, 1,
-0.1930151, -0.4807023, -2.614579, 1, 0, 0, 1, 1,
-0.1897547, 0.4458355, 0.1025566, 1, 0, 0, 1, 1,
-0.1896847, -1.827437, -1.664821, 1, 0, 0, 1, 1,
-0.1889437, -0.482071, -1.681724, 1, 0, 0, 1, 1,
-0.1783312, 2.128972, -0.7340255, 0, 0, 0, 1, 1,
-0.1731582, -0.05962909, -2.98126, 0, 0, 0, 1, 1,
-0.1724611, -1.194277, -3.161725, 0, 0, 0, 1, 1,
-0.1717361, -1.427917, -3.269979, 0, 0, 0, 1, 1,
-0.1686896, -0.7226627, -4.238416, 0, 0, 0, 1, 1,
-0.1684431, -0.418561, -2.718773, 0, 0, 0, 1, 1,
-0.1683417, 0.7368001, -0.04301479, 0, 0, 0, 1, 1,
-0.1662241, -0.7683999, -1.548994, 1, 1, 1, 1, 1,
-0.1632007, -0.3272327, -1.570707, 1, 1, 1, 1, 1,
-0.1613487, 1.536108, 0.314269, 1, 1, 1, 1, 1,
-0.1609747, 1.450045, -0.4327913, 1, 1, 1, 1, 1,
-0.156839, 1.080602, -1.15781, 1, 1, 1, 1, 1,
-0.1562233, 0.2739806, 0.279436, 1, 1, 1, 1, 1,
-0.1539151, 0.06189622, -1.431757, 1, 1, 1, 1, 1,
-0.1538502, 0.1255057, -1.162307, 1, 1, 1, 1, 1,
-0.1492753, -1.413702, -2.025999, 1, 1, 1, 1, 1,
-0.1430536, -0.160279, -2.75589, 1, 1, 1, 1, 1,
-0.1413916, 1.297729, -0.3628241, 1, 1, 1, 1, 1,
-0.1403389, -0.1414702, -2.003303, 1, 1, 1, 1, 1,
-0.1388806, 0.3668307, -1.767317, 1, 1, 1, 1, 1,
-0.1359373, -1.31303, -4.019507, 1, 1, 1, 1, 1,
-0.1341244, 1.086868, -0.648515, 1, 1, 1, 1, 1,
-0.1322665, 0.6082398, -0.7393292, 0, 0, 1, 1, 1,
-0.1318292, 1.175073, 0.7772462, 1, 0, 0, 1, 1,
-0.1263329, -0.1841386, -2.815344, 1, 0, 0, 1, 1,
-0.1257426, -0.2506853, -3.566505, 1, 0, 0, 1, 1,
-0.1255736, -0.5102015, -1.588967, 1, 0, 0, 1, 1,
-0.1243971, -0.1297737, -4.094296, 1, 0, 0, 1, 1,
-0.1239937, -0.9896673, -0.6467524, 0, 0, 0, 1, 1,
-0.1117522, -1.375858, -2.572637, 0, 0, 0, 1, 1,
-0.1047995, 0.7111912, -0.3293828, 0, 0, 0, 1, 1,
-0.1038144, 0.5140932, -0.513201, 0, 0, 0, 1, 1,
-0.1008192, -1.083646, -2.13262, 0, 0, 0, 1, 1,
-0.09958201, 1.73123, -1.450631, 0, 0, 0, 1, 1,
-0.09762132, -0.6937426, -3.964725, 0, 0, 0, 1, 1,
-0.09330063, -0.3576843, -3.508731, 1, 1, 1, 1, 1,
-0.09086192, -0.581223, -3.731563, 1, 1, 1, 1, 1,
-0.08921532, -0.1848831, -3.138007, 1, 1, 1, 1, 1,
-0.08616838, -0.7629335, -2.764342, 1, 1, 1, 1, 1,
-0.08212212, 0.01726957, -1.051017, 1, 1, 1, 1, 1,
-0.08193839, -0.02341211, -1.796816, 1, 1, 1, 1, 1,
-0.07919342, 0.8003017, 0.3962016, 1, 1, 1, 1, 1,
-0.07884783, -0.5044699, -2.677016, 1, 1, 1, 1, 1,
-0.07549455, 1.65533, 2.27703, 1, 1, 1, 1, 1,
-0.07282732, 0.2833777, -0.6133336, 1, 1, 1, 1, 1,
-0.07163174, 1.475464, -0.8617357, 1, 1, 1, 1, 1,
-0.06779019, 0.07910734, -3.484493, 1, 1, 1, 1, 1,
-0.06413189, -1.50717, -3.186639, 1, 1, 1, 1, 1,
-0.06045537, 0.5346518, -0.434038, 1, 1, 1, 1, 1,
-0.05802743, 0.6057649, 0.9439529, 1, 1, 1, 1, 1,
-0.05504055, 1.039931, -0.265551, 0, 0, 1, 1, 1,
-0.0497354, 0.5490862, -0.003654129, 1, 0, 0, 1, 1,
-0.04727563, -0.137029, -0.546576, 1, 0, 0, 1, 1,
-0.04449435, -0.6355081, -3.39318, 1, 0, 0, 1, 1,
-0.04275233, -0.1211414, -2.573371, 1, 0, 0, 1, 1,
-0.04013582, -1.419266, -3.988231, 1, 0, 0, 1, 1,
-0.0377985, 0.1109342, 0.643335, 0, 0, 0, 1, 1,
-0.03145939, 0.5003946, -2.120228, 0, 0, 0, 1, 1,
-0.02334815, 0.8137028, 0.5004855, 0, 0, 0, 1, 1,
-0.02288095, 0.2973674, 0.4540583, 0, 0, 0, 1, 1,
-0.01625957, 0.5189169, -1.354721, 0, 0, 0, 1, 1,
-0.01458238, -0.5921932, -3.752728, 0, 0, 0, 1, 1,
-0.006338018, -1.319528, -1.125554, 0, 0, 0, 1, 1,
-0.005059802, -0.1163384, -2.472338, 1, 1, 1, 1, 1,
-0.003841406, 0.9944282, 2.177123, 1, 1, 1, 1, 1,
-0.003699762, -1.485822, -3.178504, 1, 1, 1, 1, 1,
0.005851949, -2.3476, 2.718278, 1, 1, 1, 1, 1,
0.006710259, 1.120751, -0.8415184, 1, 1, 1, 1, 1,
0.00876117, 0.6674157, -0.489169, 1, 1, 1, 1, 1,
0.008993056, 0.5133529, -0.2397767, 1, 1, 1, 1, 1,
0.01209012, 2.266299, -0.838074, 1, 1, 1, 1, 1,
0.0128149, -1.926043, 4.560476, 1, 1, 1, 1, 1,
0.01456346, 0.1515025, -0.5597128, 1, 1, 1, 1, 1,
0.01531935, 1.135964, -0.8519792, 1, 1, 1, 1, 1,
0.02157986, 0.08281483, 0.7108589, 1, 1, 1, 1, 1,
0.02166042, -0.1213675, 1.736162, 1, 1, 1, 1, 1,
0.0287331, 0.4461283, 0.8462372, 1, 1, 1, 1, 1,
0.02885751, 0.5604056, -0.205301, 1, 1, 1, 1, 1,
0.02922941, 0.4797702, 0.6306027, 0, 0, 1, 1, 1,
0.03437815, -1.525692, 2.702796, 1, 0, 0, 1, 1,
0.03472696, -0.5830529, 2.155742, 1, 0, 0, 1, 1,
0.03647852, 1.006685, -2.117392, 1, 0, 0, 1, 1,
0.04147558, 0.1637559, 0.6139706, 1, 0, 0, 1, 1,
0.04512745, -0.8209236, 2.606705, 1, 0, 0, 1, 1,
0.04642568, 1.204302, 0.6130275, 0, 0, 0, 1, 1,
0.04749201, 1.477416, -0.08554985, 0, 0, 0, 1, 1,
0.05186528, -1.287552, 3.367563, 0, 0, 0, 1, 1,
0.05683239, -0.485695, 3.850211, 0, 0, 0, 1, 1,
0.06045197, 0.2132266, -0.8402708, 0, 0, 0, 1, 1,
0.06466535, -0.3482354, 2.060687, 0, 0, 0, 1, 1,
0.06579628, 0.3752359, 0.8189765, 0, 0, 0, 1, 1,
0.06583302, 0.7517276, -0.09637886, 1, 1, 1, 1, 1,
0.06662025, -1.373002, 3.284069, 1, 1, 1, 1, 1,
0.06673129, 0.3866087, 0.8397463, 1, 1, 1, 1, 1,
0.06756397, -0.9550561, 3.48167, 1, 1, 1, 1, 1,
0.07686143, -1.1383, 2.662787, 1, 1, 1, 1, 1,
0.0825549, -0.05237921, 3.037354, 1, 1, 1, 1, 1,
0.08262885, 0.3170127, -0.1359859, 1, 1, 1, 1, 1,
0.08762047, -0.3460865, 1.547115, 1, 1, 1, 1, 1,
0.09071785, -1.209238, 2.903819, 1, 1, 1, 1, 1,
0.09274273, 0.8219789, -0.01347751, 1, 1, 1, 1, 1,
0.1000932, 0.7824243, 1.507745, 1, 1, 1, 1, 1,
0.1024302, 1.110781, 1.015086, 1, 1, 1, 1, 1,
0.1038087, -0.6309869, 4.366182, 1, 1, 1, 1, 1,
0.1084745, -1.955303, 1.348749, 1, 1, 1, 1, 1,
0.1093176, -0.2111664, 0.8145851, 1, 1, 1, 1, 1,
0.1110786, 0.898463, 0.5668483, 0, 0, 1, 1, 1,
0.1139962, -0.3300009, 5.341188, 1, 0, 0, 1, 1,
0.1141659, -0.6033011, 4.394056, 1, 0, 0, 1, 1,
0.1142869, 0.8598053, 0.3438561, 1, 0, 0, 1, 1,
0.1145228, 0.7078754, -0.3292828, 1, 0, 0, 1, 1,
0.115584, 0.5898057, 1.075349, 1, 0, 0, 1, 1,
0.116473, -1.039197, 1.485694, 0, 0, 0, 1, 1,
0.1184177, 1.093976, 0.02793465, 0, 0, 0, 1, 1,
0.119664, -1.435286, 3.743666, 0, 0, 0, 1, 1,
0.122099, -0.4731296, 4.158895, 0, 0, 0, 1, 1,
0.1298196, 0.06879696, 1.352826, 0, 0, 0, 1, 1,
0.131826, 0.3584606, 0.1213053, 0, 0, 0, 1, 1,
0.1336295, 0.5531946, 0.5905629, 0, 0, 0, 1, 1,
0.136542, 0.7326944, -0.4446128, 1, 1, 1, 1, 1,
0.1388146, -0.2074863, 3.447576, 1, 1, 1, 1, 1,
0.1407557, 0.4363136, -0.3380138, 1, 1, 1, 1, 1,
0.1437378, -0.04927022, 2.183091, 1, 1, 1, 1, 1,
0.1452679, -0.9480919, 2.350493, 1, 1, 1, 1, 1,
0.1507983, -0.9118993, 3.269133, 1, 1, 1, 1, 1,
0.1527946, -1.182038, 3.760903, 1, 1, 1, 1, 1,
0.1588115, 0.9591898, 3.436029, 1, 1, 1, 1, 1,
0.1590792, 0.6563457, 1.116908, 1, 1, 1, 1, 1,
0.1594101, 0.6636837, -1.009458, 1, 1, 1, 1, 1,
0.1618975, -0.3502064, 1.675478, 1, 1, 1, 1, 1,
0.1636513, -0.6425637, 2.961035, 1, 1, 1, 1, 1,
0.1652726, -1.401825, 2.241516, 1, 1, 1, 1, 1,
0.1660119, -0.8222721, 3.149917, 1, 1, 1, 1, 1,
0.1681334, -1.221837, 2.748019, 1, 1, 1, 1, 1,
0.1763729, 0.1989408, 0.7117565, 0, 0, 1, 1, 1,
0.1804819, 0.08821987, 1.834628, 1, 0, 0, 1, 1,
0.1832673, -0.4633327, 2.712039, 1, 0, 0, 1, 1,
0.1852859, 0.901961, 0.7225848, 1, 0, 0, 1, 1,
0.1880544, 0.9325399, 1.469491, 1, 0, 0, 1, 1,
0.1890356, 0.199151, 2.292298, 1, 0, 0, 1, 1,
0.193875, 0.09593047, -0.3258249, 0, 0, 0, 1, 1,
0.1942952, 0.4203872, 1.153131, 0, 0, 0, 1, 1,
0.1965653, -1.859904, 2.263743, 0, 0, 0, 1, 1,
0.197215, -0.1161837, 2.324496, 0, 0, 0, 1, 1,
0.200045, -0.197514, 1.886653, 0, 0, 0, 1, 1,
0.2020087, 0.3695757, -1.229692, 0, 0, 0, 1, 1,
0.2033141, 0.7237181, 1.83892, 0, 0, 0, 1, 1,
0.20335, 0.7779009, 0.1244459, 1, 1, 1, 1, 1,
0.2052315, 0.02797003, 1.524428, 1, 1, 1, 1, 1,
0.2086956, -0.595754, 3.705107, 1, 1, 1, 1, 1,
0.2112084, 0.2742345, 1.37011, 1, 1, 1, 1, 1,
0.2131934, -0.5964803, 2.784026, 1, 1, 1, 1, 1,
0.2135563, 1.633634, 2.168761, 1, 1, 1, 1, 1,
0.2144084, -0.633369, 3.889868, 1, 1, 1, 1, 1,
0.2165374, -0.5601414, 2.261474, 1, 1, 1, 1, 1,
0.216958, -0.2423601, 1.224608, 1, 1, 1, 1, 1,
0.2175667, -0.1755653, 2.479616, 1, 1, 1, 1, 1,
0.2225878, 0.9997481, 0.7144625, 1, 1, 1, 1, 1,
0.2272036, 0.580031, -0.7672235, 1, 1, 1, 1, 1,
0.2274394, -0.9023542, 2.413353, 1, 1, 1, 1, 1,
0.2342742, -1.035828, 2.205731, 1, 1, 1, 1, 1,
0.2382683, -0.827024, 1.700672, 1, 1, 1, 1, 1,
0.2409168, 0.6211185, 2.55376, 0, 0, 1, 1, 1,
0.2415026, 1.782279, 0.639491, 1, 0, 0, 1, 1,
0.242125, -0.05479431, 0.5509177, 1, 0, 0, 1, 1,
0.2452963, -0.7872658, 2.593319, 1, 0, 0, 1, 1,
0.2455106, 1.147812, 0.02058858, 1, 0, 0, 1, 1,
0.2489513, 0.7168494, 0.2456219, 1, 0, 0, 1, 1,
0.257891, 0.07544224, 0.3509742, 0, 0, 0, 1, 1,
0.2579987, 0.5675517, 1.065943, 0, 0, 0, 1, 1,
0.2592947, 0.4781779, 1.54864, 0, 0, 0, 1, 1,
0.2616952, 1.336618, 1.825064, 0, 0, 0, 1, 1,
0.26265, 0.3769168, 2.427623, 0, 0, 0, 1, 1,
0.2637064, 0.3045444, 0.8856782, 0, 0, 0, 1, 1,
0.2660362, 1.236693, -1.575697, 0, 0, 0, 1, 1,
0.2837074, -0.8429042, 3.245787, 1, 1, 1, 1, 1,
0.2907968, 0.9550204, 1.412677, 1, 1, 1, 1, 1,
0.2912812, -0.7233186, 1.896197, 1, 1, 1, 1, 1,
0.3117276, 0.5942193, 0.9316683, 1, 1, 1, 1, 1,
0.3173109, -0.1389705, 2.01996, 1, 1, 1, 1, 1,
0.3189822, 1.91771, 0.1637648, 1, 1, 1, 1, 1,
0.3203875, -0.3145847, 2.6128, 1, 1, 1, 1, 1,
0.321155, -0.2204841, 1.847196, 1, 1, 1, 1, 1,
0.3216861, -0.712109, 2.369425, 1, 1, 1, 1, 1,
0.3240429, -0.6266212, 0.5237072, 1, 1, 1, 1, 1,
0.3257886, 0.01920413, 2.367962, 1, 1, 1, 1, 1,
0.3297235, 0.9051086, 0.6555572, 1, 1, 1, 1, 1,
0.3313474, 0.7222624, -0.5390423, 1, 1, 1, 1, 1,
0.3314596, 0.6626657, 1.279501, 1, 1, 1, 1, 1,
0.3349832, -0.351269, 1.55661, 1, 1, 1, 1, 1,
0.3365817, 0.1235185, 1.58931, 0, 0, 1, 1, 1,
0.3425784, 0.4562751, 1.409105, 1, 0, 0, 1, 1,
0.3428535, -0.6038682, 2.477582, 1, 0, 0, 1, 1,
0.3437881, -0.350911, 2.370192, 1, 0, 0, 1, 1,
0.3469475, 0.950653, 1.100467, 1, 0, 0, 1, 1,
0.3511848, 0.04873397, 1.769864, 1, 0, 0, 1, 1,
0.3517437, -1.05877, 3.039146, 0, 0, 0, 1, 1,
0.355935, -0.7235464, 3.048388, 0, 0, 0, 1, 1,
0.3607967, 0.09253903, 0.8197252, 0, 0, 0, 1, 1,
0.3622029, 0.3654382, 0.3398667, 0, 0, 0, 1, 1,
0.3683806, 2.569798, -1.136046, 0, 0, 0, 1, 1,
0.3685758, 1.36196, -1.219295, 0, 0, 0, 1, 1,
0.3720926, -2.139782, 1.461257, 0, 0, 0, 1, 1,
0.3726933, 2.595576, -1.705718, 1, 1, 1, 1, 1,
0.3745758, -0.07062119, 2.348439, 1, 1, 1, 1, 1,
0.3813615, -1.351598, 1.958708, 1, 1, 1, 1, 1,
0.3866708, 0.9994724, -0.03618811, 1, 1, 1, 1, 1,
0.3869856, -1.650275, 4.287395, 1, 1, 1, 1, 1,
0.390685, 0.8519541, 0.4350734, 1, 1, 1, 1, 1,
0.3924523, -1.066755, 3.010066, 1, 1, 1, 1, 1,
0.3975336, -1.323452, 2.333242, 1, 1, 1, 1, 1,
0.4124256, 0.7068854, -0.4192426, 1, 1, 1, 1, 1,
0.4184867, 0.0518001, -0.5571828, 1, 1, 1, 1, 1,
0.4187137, -1.333899, 2.628761, 1, 1, 1, 1, 1,
0.4196584, 1.006075, 0.1589778, 1, 1, 1, 1, 1,
0.4212284, 1.143013, 0.7808596, 1, 1, 1, 1, 1,
0.4217361, 1.083829, -1.800373, 1, 1, 1, 1, 1,
0.4225062, -0.6967772, 1.611131, 1, 1, 1, 1, 1,
0.4227465, -1.068234, 1.850207, 0, 0, 1, 1, 1,
0.4245865, 0.3368333, 0.6609982, 1, 0, 0, 1, 1,
0.4246728, 0.4891893, 1.491788, 1, 0, 0, 1, 1,
0.4257571, -0.2300775, 2.608253, 1, 0, 0, 1, 1,
0.4271844, 0.05661881, -0.7309643, 1, 0, 0, 1, 1,
0.4300478, -1.2738, 2.384014, 1, 0, 0, 1, 1,
0.430721, -1.546512, 3.441456, 0, 0, 0, 1, 1,
0.4361455, 1.465203, 0.6455066, 0, 0, 0, 1, 1,
0.4385895, 0.04858639, 1.127676, 0, 0, 0, 1, 1,
0.4386008, -1.870139, 2.267152, 0, 0, 0, 1, 1,
0.4398977, 0.173182, 0.5333181, 0, 0, 0, 1, 1,
0.4430458, 0.9285492, 0.6887239, 0, 0, 0, 1, 1,
0.4451543, -1.372113, 1.785278, 0, 0, 0, 1, 1,
0.4454086, -1.439492, 5.257202, 1, 1, 1, 1, 1,
0.4498288, -0.5633743, 2.466967, 1, 1, 1, 1, 1,
0.4504433, -0.8420375, 1.702986, 1, 1, 1, 1, 1,
0.452941, -0.3098179, 2.410782, 1, 1, 1, 1, 1,
0.453557, 0.8242334, 0.5631642, 1, 1, 1, 1, 1,
0.4551221, -0.7598609, 3.581879, 1, 1, 1, 1, 1,
0.4558321, -2.796962, 4.411787, 1, 1, 1, 1, 1,
0.4565593, -0.9959735, 1.140225, 1, 1, 1, 1, 1,
0.4611023, 0.1072977, 1.252065, 1, 1, 1, 1, 1,
0.465447, -0.3414594, 3.533677, 1, 1, 1, 1, 1,
0.4662772, -0.8129297, 3.172039, 1, 1, 1, 1, 1,
0.4670599, -0.5113232, 2.655824, 1, 1, 1, 1, 1,
0.4677133, -1.342644, 1.801489, 1, 1, 1, 1, 1,
0.4688627, -0.9471286, 3.524693, 1, 1, 1, 1, 1,
0.4733943, -0.7582887, 4.298827, 1, 1, 1, 1, 1,
0.4749641, -0.7197571, 1.645326, 0, 0, 1, 1, 1,
0.4752237, -0.09265631, 0.6549908, 1, 0, 0, 1, 1,
0.4768235, 0.5702415, 1.795946, 1, 0, 0, 1, 1,
0.4783268, 0.002971396, 2.2895, 1, 0, 0, 1, 1,
0.480563, -1.47881, 2.611021, 1, 0, 0, 1, 1,
0.4885654, 0.1493571, 2.536558, 1, 0, 0, 1, 1,
0.4900839, -1.234035, 1.115017, 0, 0, 0, 1, 1,
0.497128, 1.234106, -0.9573877, 0, 0, 0, 1, 1,
0.4980265, -0.3283058, 2.570274, 0, 0, 0, 1, 1,
0.5004367, -0.03897323, 1.056881, 0, 0, 0, 1, 1,
0.502937, -0.4978718, 2.148085, 0, 0, 0, 1, 1,
0.5107668, -0.502134, 1.092517, 0, 0, 0, 1, 1,
0.5129607, -0.3440256, 1.681076, 0, 0, 0, 1, 1,
0.5132666, -0.675743, 2.113344, 1, 1, 1, 1, 1,
0.5221824, 1.113802, 0.9568155, 1, 1, 1, 1, 1,
0.5232682, -1.35634, 1.121396, 1, 1, 1, 1, 1,
0.5233986, -1.222168, 2.257736, 1, 1, 1, 1, 1,
0.5240954, 0.4816376, 0.8353801, 1, 1, 1, 1, 1,
0.5247375, 1.072373, 0.1684191, 1, 1, 1, 1, 1,
0.5272666, 0.9202877, -0.638228, 1, 1, 1, 1, 1,
0.5322676, -2.093251, 5.907501, 1, 1, 1, 1, 1,
0.5326892, 0.7404276, -0.9066563, 1, 1, 1, 1, 1,
0.5334679, -0.2115294, 2.769023, 1, 1, 1, 1, 1,
0.5351717, -1.588557, 4.015064, 1, 1, 1, 1, 1,
0.5363667, 0.7671418, -1.381025, 1, 1, 1, 1, 1,
0.5415438, 0.0750865, 1.72333, 1, 1, 1, 1, 1,
0.5466202, 0.9017276, -0.05889537, 1, 1, 1, 1, 1,
0.5541059, 0.1778824, 1.319834, 1, 1, 1, 1, 1,
0.5655139, -0.4605766, 2.039626, 0, 0, 1, 1, 1,
0.5695815, 0.3136294, 1.673406, 1, 0, 0, 1, 1,
0.5702691, -1.550885, 1.694633, 1, 0, 0, 1, 1,
0.5747108, 0.2293574, 0.001082611, 1, 0, 0, 1, 1,
0.5784318, -0.7616695, 3.552875, 1, 0, 0, 1, 1,
0.5795072, 0.09970938, 2.49534, 1, 0, 0, 1, 1,
0.5905751, -0.09110655, 4.026989, 0, 0, 0, 1, 1,
0.5933024, -0.6634645, 2.597627, 0, 0, 0, 1, 1,
0.5993752, 1.360497, -0.450907, 0, 0, 0, 1, 1,
0.6077895, -0.517369, 2.497716, 0, 0, 0, 1, 1,
0.6083235, -1.02604, 1.439851, 0, 0, 0, 1, 1,
0.6083464, 0.4525993, 1.737143, 0, 0, 0, 1, 1,
0.6097829, 0.188238, 1.702874, 0, 0, 0, 1, 1,
0.6109813, -0.3057072, 0.08786794, 1, 1, 1, 1, 1,
0.6110663, -0.853686, 3.241193, 1, 1, 1, 1, 1,
0.6131563, 0.1573897, 1.688395, 1, 1, 1, 1, 1,
0.6167493, 0.2840917, 1.722756, 1, 1, 1, 1, 1,
0.618997, -1.194969, 1.286676, 1, 1, 1, 1, 1,
0.6190127, -0.2550857, 0.7102038, 1, 1, 1, 1, 1,
0.6235657, 1.00164, 0.5314548, 1, 1, 1, 1, 1,
0.6288511, 1.710089, -0.7242523, 1, 1, 1, 1, 1,
0.6291826, 0.7620115, 0.6643954, 1, 1, 1, 1, 1,
0.6317749, -0.7733095, 2.844269, 1, 1, 1, 1, 1,
0.6362657, -0.2422927, 1.913712, 1, 1, 1, 1, 1,
0.6444663, -0.5364396, 2.654088, 1, 1, 1, 1, 1,
0.6508601, 0.6577926, 1.385408, 1, 1, 1, 1, 1,
0.6512476, 0.7864675, 1.190027, 1, 1, 1, 1, 1,
0.6523255, -0.583284, 1.601032, 1, 1, 1, 1, 1,
0.6553443, 1.228634, 1.968614, 0, 0, 1, 1, 1,
0.6559705, 0.3610609, 1.600665, 1, 0, 0, 1, 1,
0.6566743, -1.027035, 0.5272652, 1, 0, 0, 1, 1,
0.660448, 0.3316811, 0.02103657, 1, 0, 0, 1, 1,
0.6634818, 0.7866297, 0.2230371, 1, 0, 0, 1, 1,
0.6647065, 2.194238, 0.3319873, 1, 0, 0, 1, 1,
0.6651539, 1.45207, 1.378125, 0, 0, 0, 1, 1,
0.6657982, -0.7465038, 3.999142, 0, 0, 0, 1, 1,
0.6799394, -0.5072798, 3.66601, 0, 0, 0, 1, 1,
0.6800419, -0.2329218, 3.387125, 0, 0, 0, 1, 1,
0.6804706, -1.187725, 0.3262699, 0, 0, 0, 1, 1,
0.680985, -0.2964309, 3.11419, 0, 0, 0, 1, 1,
0.6817521, 1.438315, -0.7659104, 0, 0, 0, 1, 1,
0.6838616, 0.5752887, 0.06943641, 1, 1, 1, 1, 1,
0.6873154, -1.146339, 1.189532, 1, 1, 1, 1, 1,
0.688124, 0.9349024, 1.621601, 1, 1, 1, 1, 1,
0.689459, -2.383153, 1.852138, 1, 1, 1, 1, 1,
0.6951342, -0.3574057, 1.507774, 1, 1, 1, 1, 1,
0.6953598, -0.98499, 2.078496, 1, 1, 1, 1, 1,
0.6966683, -0.4963197, 2.804523, 1, 1, 1, 1, 1,
0.6988007, -0.3659296, 0.0130667, 1, 1, 1, 1, 1,
0.6995973, 1.539716, 0.1482103, 1, 1, 1, 1, 1,
0.7007728, -0.103529, 1.683686, 1, 1, 1, 1, 1,
0.7026911, 0.9621049, 0.20589, 1, 1, 1, 1, 1,
0.7074999, 1.233859, 0.1823749, 1, 1, 1, 1, 1,
0.7076722, -1.685926, 2.928653, 1, 1, 1, 1, 1,
0.7117128, -2.03992, 4.249862, 1, 1, 1, 1, 1,
0.7147666, -0.2076803, 0.993705, 1, 1, 1, 1, 1,
0.724468, 1.989012, 1.078394, 0, 0, 1, 1, 1,
0.7255419, -1.355885, 2.070668, 1, 0, 0, 1, 1,
0.7269756, -0.2070086, 3.836834, 1, 0, 0, 1, 1,
0.7275962, 2.41774, 0.8427081, 1, 0, 0, 1, 1,
0.7317261, 0.1775746, 2.891281, 1, 0, 0, 1, 1,
0.7320475, 0.3983847, 1.405534, 1, 0, 0, 1, 1,
0.7342643, -0.195731, 2.395957, 0, 0, 0, 1, 1,
0.7362487, -1.236625, 3.838202, 0, 0, 0, 1, 1,
0.7372838, 1.095276, 1.123052, 0, 0, 0, 1, 1,
0.7379895, 0.6961589, 0.2948976, 0, 0, 0, 1, 1,
0.7413744, -1.823074, 4.071067, 0, 0, 0, 1, 1,
0.742174, -0.1715718, 0.1727798, 0, 0, 0, 1, 1,
0.7528785, 0.7017111, -0.6525467, 0, 0, 0, 1, 1,
0.7529443, -0.3144134, 2.033995, 1, 1, 1, 1, 1,
0.765172, -1.166838, 1.888481, 1, 1, 1, 1, 1,
0.7706502, -0.07155708, 2.952687, 1, 1, 1, 1, 1,
0.7744421, -0.08334509, 1.072104, 1, 1, 1, 1, 1,
0.7787082, 1.151655, 0.7781728, 1, 1, 1, 1, 1,
0.7816634, 0.06242513, 1.290355, 1, 1, 1, 1, 1,
0.7830153, 1.885684, 0.6934414, 1, 1, 1, 1, 1,
0.7849274, -1.499809, 3.050464, 1, 1, 1, 1, 1,
0.7855125, 1.213916, -0.01191717, 1, 1, 1, 1, 1,
0.7898837, 1.519658, 0.2210814, 1, 1, 1, 1, 1,
0.791132, 0.2421982, 1.935968, 1, 1, 1, 1, 1,
0.791494, -0.5208321, 2.566303, 1, 1, 1, 1, 1,
0.7937219, -0.3124092, 3.378502, 1, 1, 1, 1, 1,
0.7941399, -0.4434402, 2.467134, 1, 1, 1, 1, 1,
0.7949392, -0.5857703, 2.711704, 1, 1, 1, 1, 1,
0.7969472, -0.6289846, 1.992977, 0, 0, 1, 1, 1,
0.7973742, 1.529108, 0.1130562, 1, 0, 0, 1, 1,
0.800885, -1.1332, 2.390496, 1, 0, 0, 1, 1,
0.8077565, -0.06808067, 1.107672, 1, 0, 0, 1, 1,
0.8108326, -0.9748175, 2.47824, 1, 0, 0, 1, 1,
0.8195457, 0.5165387, -0.4959305, 1, 0, 0, 1, 1,
0.8200719, 0.1223437, 0.9190706, 0, 0, 0, 1, 1,
0.8277552, 0.09827583, 0.3453102, 0, 0, 0, 1, 1,
0.8305525, -1.123145, 3.299839, 0, 0, 0, 1, 1,
0.8308709, 1.734497, 1.164478, 0, 0, 0, 1, 1,
0.834986, 1.31283, 0.9703537, 0, 0, 0, 1, 1,
0.8404337, 1.190417, -0.2827149, 0, 0, 0, 1, 1,
0.8429975, -1.606663, 3.477994, 0, 0, 0, 1, 1,
0.844318, -0.02754549, -0.1694905, 1, 1, 1, 1, 1,
0.8450144, -1.247787, 1.856913, 1, 1, 1, 1, 1,
0.8475564, 0.01466319, 0.111288, 1, 1, 1, 1, 1,
0.8492706, 0.1393311, 0.8241782, 1, 1, 1, 1, 1,
0.8525655, -1.350114, 2.581568, 1, 1, 1, 1, 1,
0.8622684, -0.6782296, 2.598191, 1, 1, 1, 1, 1,
0.8641576, -0.5606843, 1.309634, 1, 1, 1, 1, 1,
0.8649995, -0.7426098, 2.845814, 1, 1, 1, 1, 1,
0.8674359, 0.1033827, 0.6264306, 1, 1, 1, 1, 1,
0.8712667, -3.165274, 1.83184, 1, 1, 1, 1, 1,
0.8780035, -1.643772, 1.078123, 1, 1, 1, 1, 1,
0.8812973, -1.026968, 3.81729, 1, 1, 1, 1, 1,
0.9099624, 0.5886123, 2.679496, 1, 1, 1, 1, 1,
0.9115559, 0.09452625, 1.92678, 1, 1, 1, 1, 1,
0.9124323, -1.484105, 1.582208, 1, 1, 1, 1, 1,
0.9156234, 0.7592347, -0.3268395, 0, 0, 1, 1, 1,
0.9159176, -1.097134, 2.159862, 1, 0, 0, 1, 1,
0.9194208, -0.1509825, 2.884632, 1, 0, 0, 1, 1,
0.9228158, -1.302189, 3.369625, 1, 0, 0, 1, 1,
0.9289442, 1.250418, 0.912335, 1, 0, 0, 1, 1,
0.9315901, -1.229107, 3.455707, 1, 0, 0, 1, 1,
0.9345282, 2.9038, 2.253577, 0, 0, 0, 1, 1,
0.9379651, -0.04117401, 2.523281, 0, 0, 0, 1, 1,
0.9395433, -1.024094, 2.004328, 0, 0, 0, 1, 1,
0.9438154, 0.1897209, 2.950145, 0, 0, 0, 1, 1,
0.9448858, 0.9259218, 2.047684, 0, 0, 0, 1, 1,
0.9497328, -1.066583, 2.671346, 0, 0, 0, 1, 1,
0.958639, 0.6731595, 3.266886, 0, 0, 0, 1, 1,
0.9587244, -0.8009198, 1.839833, 1, 1, 1, 1, 1,
0.9589997, -1.189328, 2.793318, 1, 1, 1, 1, 1,
0.9627211, -0.02225344, 2.028754, 1, 1, 1, 1, 1,
0.9672579, 0.5266261, 0.2254068, 1, 1, 1, 1, 1,
0.9684771, -0.03477521, 1.957852, 1, 1, 1, 1, 1,
0.9690748, -1.316215, 1.042989, 1, 1, 1, 1, 1,
0.9767026, 0.760671, 2.191983, 1, 1, 1, 1, 1,
0.9783117, -2.652439, 5.136664, 1, 1, 1, 1, 1,
0.9803745, -1.381895, 2.716152, 1, 1, 1, 1, 1,
0.9868666, 0.6883733, 1.510057, 1, 1, 1, 1, 1,
0.9890385, 1.269013, 1.767321, 1, 1, 1, 1, 1,
0.9987579, 0.6882613, 0.872298, 1, 1, 1, 1, 1,
0.9994548, 1.319866, 1.001044, 1, 1, 1, 1, 1,
1.001059, -0.1751712, 3.556873, 1, 1, 1, 1, 1,
1.004545, -0.2928283, 3.495633, 1, 1, 1, 1, 1,
1.007655, -0.8129129, 2.278172, 0, 0, 1, 1, 1,
1.012074, 0.5381344, -0.07068627, 1, 0, 0, 1, 1,
1.017376, 0.6655592, -0.3933433, 1, 0, 0, 1, 1,
1.024003, -0.7579249, 1.016203, 1, 0, 0, 1, 1,
1.024507, 1.149083, 2.194818, 1, 0, 0, 1, 1,
1.027728, 2.306836, 1.029966, 1, 0, 0, 1, 1,
1.034299, 0.609741, 1.342848, 0, 0, 0, 1, 1,
1.037301, -0.1688505, 2.666546, 0, 0, 0, 1, 1,
1.041788, -0.3724503, 2.49894, 0, 0, 0, 1, 1,
1.048699, 0.3958779, 0.4505439, 0, 0, 0, 1, 1,
1.051097, -0.162044, 2.330682, 0, 0, 0, 1, 1,
1.059898, -3.141604, 2.934299, 0, 0, 0, 1, 1,
1.05998, -1.865951, 2.685752, 0, 0, 0, 1, 1,
1.061062, -0.5817313, 2.667087, 1, 1, 1, 1, 1,
1.065752, -0.2913411, 1.082765, 1, 1, 1, 1, 1,
1.069314, 0.1004693, 0.7683742, 1, 1, 1, 1, 1,
1.075183, 2.117863, 0.9207423, 1, 1, 1, 1, 1,
1.075273, -0.5861372, 3.201923, 1, 1, 1, 1, 1,
1.075839, 0.1933249, 1.106503, 1, 1, 1, 1, 1,
1.080986, -0.3362759, 1.403297, 1, 1, 1, 1, 1,
1.086867, 1.281488, -0.000945997, 1, 1, 1, 1, 1,
1.097924, -1.344719, 1.821739, 1, 1, 1, 1, 1,
1.098545, 0.2951733, 2.913413, 1, 1, 1, 1, 1,
1.10574, 1.882187, -1.305209, 1, 1, 1, 1, 1,
1.110347, 0.4394616, 0.9395503, 1, 1, 1, 1, 1,
1.113628, -0.5465616, 3.107629, 1, 1, 1, 1, 1,
1.114758, -1.727782, 1.990418, 1, 1, 1, 1, 1,
1.117582, 2.294469, -0.3654655, 1, 1, 1, 1, 1,
1.118201, 0.04996404, 3.964238, 0, 0, 1, 1, 1,
1.121938, -1.671513, 2.142982, 1, 0, 0, 1, 1,
1.127974, 0.4120489, 2.905031, 1, 0, 0, 1, 1,
1.130256, 0.2288159, 1.479538, 1, 0, 0, 1, 1,
1.130474, 1.382628, -0.7468562, 1, 0, 0, 1, 1,
1.133288, 0.1181319, 0.6939775, 1, 0, 0, 1, 1,
1.134628, -0.4928909, 0.9879452, 0, 0, 0, 1, 1,
1.136926, 0.8902405, 0.6246513, 0, 0, 0, 1, 1,
1.137634, 1.58019, 0.104574, 0, 0, 0, 1, 1,
1.139089, 0.3389399, 0.7336864, 0, 0, 0, 1, 1,
1.151551, 0.9713182, 0.3432026, 0, 0, 0, 1, 1,
1.159497, -1.115807, 1.766153, 0, 0, 0, 1, 1,
1.163258, 0.7819884, 1.752721, 0, 0, 0, 1, 1,
1.168656, -1.397633, 3.786558, 1, 1, 1, 1, 1,
1.183187, 1.766347, 1.433638, 1, 1, 1, 1, 1,
1.188808, -0.4236032, 1.367868, 1, 1, 1, 1, 1,
1.190845, -0.09653708, 3.074089, 1, 1, 1, 1, 1,
1.191236, 0.04468174, 1.484544, 1, 1, 1, 1, 1,
1.191286, -0.07807594, 0.6348659, 1, 1, 1, 1, 1,
1.200474, 1.691374, -0.2969862, 1, 1, 1, 1, 1,
1.200695, -1.189566, 3.710523, 1, 1, 1, 1, 1,
1.20331, 0.2376713, 1.543928, 1, 1, 1, 1, 1,
1.207171, 1.251679, 1.846627, 1, 1, 1, 1, 1,
1.218959, -1.798436, 1.18537, 1, 1, 1, 1, 1,
1.226045, -1.826171, 3.584002, 1, 1, 1, 1, 1,
1.226279, 1.815757, -0.5337436, 1, 1, 1, 1, 1,
1.226468, 0.09506578, 1.316773, 1, 1, 1, 1, 1,
1.232475, -0.3393911, 4.041444, 1, 1, 1, 1, 1,
1.234353, -0.3450179, 2.603136, 0, 0, 1, 1, 1,
1.236903, 0.6101156, 2.133021, 1, 0, 0, 1, 1,
1.241474, -2.534228, 2.961231, 1, 0, 0, 1, 1,
1.251983, -1.036974, 2.119477, 1, 0, 0, 1, 1,
1.254872, -0.403536, 2.831463, 1, 0, 0, 1, 1,
1.263614, 0.2141394, 0.5611352, 1, 0, 0, 1, 1,
1.266196, -0.9020835, 1.058011, 0, 0, 0, 1, 1,
1.271142, 0.1506968, 1.448337, 0, 0, 0, 1, 1,
1.292951, 0.5134308, 1.261559, 0, 0, 0, 1, 1,
1.304186, -2.999742, 4.262229, 0, 0, 0, 1, 1,
1.311274, 0.4415331, 2.191591, 0, 0, 0, 1, 1,
1.31392, 0.9158683, 2.393548, 0, 0, 0, 1, 1,
1.320377, -0.09947344, 2.19725, 0, 0, 0, 1, 1,
1.323156, -0.3527244, 2.512732, 1, 1, 1, 1, 1,
1.337816, 0.04173556, -1.916068, 1, 1, 1, 1, 1,
1.338833, -1.428318, 3.274939, 1, 1, 1, 1, 1,
1.340831, 0.5915046, 2.140863, 1, 1, 1, 1, 1,
1.363057, -3.284292, 2.490168, 1, 1, 1, 1, 1,
1.364374, 0.8849855, 0.1996258, 1, 1, 1, 1, 1,
1.364604, 0.5771915, 0.7484863, 1, 1, 1, 1, 1,
1.371759, 1.862389, 0.1635459, 1, 1, 1, 1, 1,
1.374853, 1.848667, 1.590118, 1, 1, 1, 1, 1,
1.376511, 1.146773, 0.357157, 1, 1, 1, 1, 1,
1.387132, -1.006987, 2.344585, 1, 1, 1, 1, 1,
1.404473, -0.2845655, 2.153941, 1, 1, 1, 1, 1,
1.407859, -1.17983, 4.662772, 1, 1, 1, 1, 1,
1.409821, 0.7651696, -0.6822097, 1, 1, 1, 1, 1,
1.429044, 0.3105823, 2.992855, 1, 1, 1, 1, 1,
1.438209, -1.052338, 0.4465934, 0, 0, 1, 1, 1,
1.443233, -3.39863, 3.969379, 1, 0, 0, 1, 1,
1.457188, 2.497241, 3.225499, 1, 0, 0, 1, 1,
1.464594, -0.4126925, 2.287609, 1, 0, 0, 1, 1,
1.476416, -0.9970706, 2.657237, 1, 0, 0, 1, 1,
1.477715, -0.2802395, -0.05239346, 1, 0, 0, 1, 1,
1.482725, 2.293302, 0.9310014, 0, 0, 0, 1, 1,
1.501372, -0.6474129, 1.426362, 0, 0, 0, 1, 1,
1.508821, 0.5017612, 0.3058872, 0, 0, 0, 1, 1,
1.513945, 0.8846804, 1.080003, 0, 0, 0, 1, 1,
1.526524, 1.352752, 2.057294, 0, 0, 0, 1, 1,
1.532234, -1.528303, 1.693205, 0, 0, 0, 1, 1,
1.549727, -0.7468915, 1.467685, 0, 0, 0, 1, 1,
1.550017, -0.0195417, 2.3639, 1, 1, 1, 1, 1,
1.555771, 1.066426, 0.2842924, 1, 1, 1, 1, 1,
1.565445, 0.7791195, 0.5852794, 1, 1, 1, 1, 1,
1.566721, -0.1309849, 1.563907, 1, 1, 1, 1, 1,
1.572113, 0.9321504, 1.44316, 1, 1, 1, 1, 1,
1.575857, 0.1143215, 1.826731, 1, 1, 1, 1, 1,
1.580915, -0.2686002, 1.884437, 1, 1, 1, 1, 1,
1.584468, -0.9955389, 0.3362733, 1, 1, 1, 1, 1,
1.592212, 0.1993824, 1.25545, 1, 1, 1, 1, 1,
1.594143, -1.788959, 1.456992, 1, 1, 1, 1, 1,
1.597287, -0.9704584, 1.592633, 1, 1, 1, 1, 1,
1.610708, 0.3364441, 2.432983, 1, 1, 1, 1, 1,
1.613117, -0.9672257, 2.308049, 1, 1, 1, 1, 1,
1.618107, 1.325736, 0.8060159, 1, 1, 1, 1, 1,
1.628397, -0.7688594, 0.261052, 1, 1, 1, 1, 1,
1.636117, 1.723632, 1.157029, 0, 0, 1, 1, 1,
1.681683, 0.6794282, 1.529742, 1, 0, 0, 1, 1,
1.68236, 1.208955, 0.7927139, 1, 0, 0, 1, 1,
1.688796, 0.4157764, 2.917715, 1, 0, 0, 1, 1,
1.69437, 0.5204589, 2.20882, 1, 0, 0, 1, 1,
1.696787, 1.218416, 1.268364, 1, 0, 0, 1, 1,
1.706123, 0.8370388, 0.2247309, 0, 0, 0, 1, 1,
1.745505, -1.021559, 1.287874, 0, 0, 0, 1, 1,
1.755492, -1.265816, 2.539107, 0, 0, 0, 1, 1,
1.759555, 1.920603, 1.415273, 0, 0, 0, 1, 1,
1.774681, -0.6687478, 2.349164, 0, 0, 0, 1, 1,
1.791077, 0.8583203, 1.651641, 0, 0, 0, 1, 1,
1.807119, -0.9654434, 1.913173, 0, 0, 0, 1, 1,
1.810745, -0.9388504, 3.752293, 1, 1, 1, 1, 1,
1.811118, -1.123992, 2.963918, 1, 1, 1, 1, 1,
1.851125, 0.8797822, -0.9371568, 1, 1, 1, 1, 1,
1.851558, -0.6413547, 2.654909, 1, 1, 1, 1, 1,
1.851639, 0.8054982, 1.029283, 1, 1, 1, 1, 1,
1.872937, 0.7429909, 2.505341, 1, 1, 1, 1, 1,
1.876075, -0.05316197, 3.152923, 1, 1, 1, 1, 1,
1.877852, 1.033223, 1.525338, 1, 1, 1, 1, 1,
1.88105, -0.5384402, 1.748751, 1, 1, 1, 1, 1,
1.893864, 0.6490337, 0.3367429, 1, 1, 1, 1, 1,
1.91484, -1.282332, 2.369638, 1, 1, 1, 1, 1,
1.929381, 0.1161903, 2.298289, 1, 1, 1, 1, 1,
1.931246, -1.854799, 1.495319, 1, 1, 1, 1, 1,
1.939599, 2.832596, 0.1606383, 1, 1, 1, 1, 1,
1.941647, -0.3173717, 2.76976, 1, 1, 1, 1, 1,
1.948617, -1.111319, 0.937043, 0, 0, 1, 1, 1,
1.959424, -1.549566, 2.037769, 1, 0, 0, 1, 1,
1.961359, 1.503335, 0.788869, 1, 0, 0, 1, 1,
1.988958, 0.4832318, 1.311998, 1, 0, 0, 1, 1,
2.000757, -0.7386559, 2.885072, 1, 0, 0, 1, 1,
2.015713, -3.086416, 2.486993, 1, 0, 0, 1, 1,
2.052588, 0.3991098, 0.4080547, 0, 0, 0, 1, 1,
2.074221, -0.1060355, 0.4258921, 0, 0, 0, 1, 1,
2.170688, -0.1246665, 3.206084, 0, 0, 0, 1, 1,
2.23359, -0.2243235, 3.713803, 0, 0, 0, 1, 1,
2.284557, 0.3635654, 0.8170239, 0, 0, 0, 1, 1,
2.29661, -1.233706, 2.239288, 0, 0, 0, 1, 1,
2.457407, -0.9382284, 1.675308, 0, 0, 0, 1, 1,
2.483081, 1.463879, 2.528201, 1, 1, 1, 1, 1,
2.516339, -1.774565, 1.941075, 1, 1, 1, 1, 1,
2.632571, -1.593486, 2.300521, 1, 1, 1, 1, 1,
2.703438, 0.6526874, 2.49024, 1, 1, 1, 1, 1,
2.823655, -0.7253078, 4.321654, 1, 1, 1, 1, 1,
2.862966, -0.6125308, 0.7653024, 1, 1, 1, 1, 1,
3.120611, -1.243242, 2.069716, 1, 1, 1, 1, 1
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
var radius = 9.338551;
var distance = 32.80126;
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
mvMatrix.translate( -0.1323467, 0.2474153, -0.6677635 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.80126);
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
