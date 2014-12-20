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
-3.269542, 0.05235694, -3.085515, 1, 0, 0, 1,
-2.809033, 1.3596, -0.08392624, 1, 0.007843138, 0, 1,
-2.751981, 1.034148, -0.5209327, 1, 0.01176471, 0, 1,
-2.449692, 0.2756546, -1.169404, 1, 0.01960784, 0, 1,
-2.384783, -1.118409, -3.020739, 1, 0.02352941, 0, 1,
-2.306204, -0.3645632, -1.255779, 1, 0.03137255, 0, 1,
-2.225082, -0.115179, -1.469158, 1, 0.03529412, 0, 1,
-2.206318, -1.092335, 0.5146847, 1, 0.04313726, 0, 1,
-2.186809, 0.4516516, -1.271578, 1, 0.04705882, 0, 1,
-2.143991, 0.396614, -1.96804, 1, 0.05490196, 0, 1,
-2.136482, -1.039592, -2.260234, 1, 0.05882353, 0, 1,
-2.130288, -1.177806, -1.61117, 1, 0.06666667, 0, 1,
-2.115529, -0.03260249, -2.660867, 1, 0.07058824, 0, 1,
-1.999061, -0.4145333, -1.710877, 1, 0.07843138, 0, 1,
-1.995077, 1.298628, 1.088512, 1, 0.08235294, 0, 1,
-1.992378, 0.04338368, -1.569304, 1, 0.09019608, 0, 1,
-1.935251, -0.9866362, 0.1718111, 1, 0.09411765, 0, 1,
-1.91293, 0.5240275, -1.39538, 1, 0.1019608, 0, 1,
-1.886886, 0.7927482, 0.7842483, 1, 0.1098039, 0, 1,
-1.886792, 0.9278503, -1.137995, 1, 0.1137255, 0, 1,
-1.885061, -0.8139682, -2.861697, 1, 0.1215686, 0, 1,
-1.87741, -0.9198573, -2.53033, 1, 0.1254902, 0, 1,
-1.828106, -0.519, -4.116373, 1, 0.1333333, 0, 1,
-1.809808, -2.224975, -2.317984, 1, 0.1372549, 0, 1,
-1.794466, 0.3760939, -1.179911, 1, 0.145098, 0, 1,
-1.785947, -0.01323816, -3.403836, 1, 0.1490196, 0, 1,
-1.785169, -2.109273, -2.180618, 1, 0.1568628, 0, 1,
-1.760483, -1.371979, -1.991896, 1, 0.1607843, 0, 1,
-1.747437, 0.541109, -2.07249, 1, 0.1686275, 0, 1,
-1.747154, 0.3993101, 0.0153552, 1, 0.172549, 0, 1,
-1.742596, -1.231677, -0.7591978, 1, 0.1803922, 0, 1,
-1.740569, 1.279448, -2.469519, 1, 0.1843137, 0, 1,
-1.730335, -0.8256528, -0.2972229, 1, 0.1921569, 0, 1,
-1.721223, 0.06379505, -2.273741, 1, 0.1960784, 0, 1,
-1.711877, -0.3805581, -1.254286, 1, 0.2039216, 0, 1,
-1.70696, 0.007899552, -2.802944, 1, 0.2117647, 0, 1,
-1.704697, 0.2991416, -0.2163366, 1, 0.2156863, 0, 1,
-1.702931, 0.2721675, -2.830456, 1, 0.2235294, 0, 1,
-1.681568, 0.4097562, -1.416833, 1, 0.227451, 0, 1,
-1.681537, 0.6709066, -1.006946, 1, 0.2352941, 0, 1,
-1.66656, 1.171257, -0.1525722, 1, 0.2392157, 0, 1,
-1.661643, -1.357257, -2.604972, 1, 0.2470588, 0, 1,
-1.640682, -1.023293, -3.155099, 1, 0.2509804, 0, 1,
-1.616185, -1.108654, -2.738483, 1, 0.2588235, 0, 1,
-1.604858, 0.8238985, 0.4061264, 1, 0.2627451, 0, 1,
-1.589329, 0.5682133, -1.967416, 1, 0.2705882, 0, 1,
-1.588444, 0.610832, -2.309179, 1, 0.2745098, 0, 1,
-1.586528, 0.9081253, -1.631586, 1, 0.282353, 0, 1,
-1.584635, -0.7876993, -0.1482697, 1, 0.2862745, 0, 1,
-1.573222, -0.1515141, -2.230181, 1, 0.2941177, 0, 1,
-1.571315, 0.2460309, -1.176694, 1, 0.3019608, 0, 1,
-1.55736, -0.2198845, -2.708304, 1, 0.3058824, 0, 1,
-1.543914, 1.050528, -0.5205685, 1, 0.3137255, 0, 1,
-1.521039, 0.02390654, -3.10041, 1, 0.3176471, 0, 1,
-1.519866, -1.800845, -1.162763, 1, 0.3254902, 0, 1,
-1.503979, 0.01637178, -1.773212, 1, 0.3294118, 0, 1,
-1.492863, 0.18422, -2.595922, 1, 0.3372549, 0, 1,
-1.491607, -0.1179104, 0.7805237, 1, 0.3411765, 0, 1,
-1.479099, -0.1137205, 2.571849, 1, 0.3490196, 0, 1,
-1.479062, 1.136962, -0.9327536, 1, 0.3529412, 0, 1,
-1.453618, 1.584311, 0.5516545, 1, 0.3607843, 0, 1,
-1.453468, 1.745412, 0.4269744, 1, 0.3647059, 0, 1,
-1.452152, 1.592126, -0.4466344, 1, 0.372549, 0, 1,
-1.447157, -0.0884506, -0.7754179, 1, 0.3764706, 0, 1,
-1.446988, -0.4397577, -1.710465, 1, 0.3843137, 0, 1,
-1.434824, 0.8310338, -0.8724687, 1, 0.3882353, 0, 1,
-1.430728, 0.2687902, -0.6267738, 1, 0.3960784, 0, 1,
-1.422622, -0.6787326, -2.408253, 1, 0.4039216, 0, 1,
-1.420664, 0.218859, -0.9251333, 1, 0.4078431, 0, 1,
-1.413449, -1.514318, -2.459373, 1, 0.4156863, 0, 1,
-1.413401, 0.2006239, -1.021006, 1, 0.4196078, 0, 1,
-1.39387, -1.330123, -2.136379, 1, 0.427451, 0, 1,
-1.389243, 0.9786248, -3.236773, 1, 0.4313726, 0, 1,
-1.368646, 2.096113, -2.536182, 1, 0.4392157, 0, 1,
-1.36397, -0.660904, -1.600446, 1, 0.4431373, 0, 1,
-1.352452, 2.410521, 0.9457772, 1, 0.4509804, 0, 1,
-1.34502, 1.602963, 0.2899816, 1, 0.454902, 0, 1,
-1.341644, -0.01291015, -2.015559, 1, 0.4627451, 0, 1,
-1.338952, 1.668001, 0.4676307, 1, 0.4666667, 0, 1,
-1.324557, 1.264016, -1.01864, 1, 0.4745098, 0, 1,
-1.319743, 0.2386085, -2.304639, 1, 0.4784314, 0, 1,
-1.30598, -1.310052, -2.663459, 1, 0.4862745, 0, 1,
-1.305302, 0.7474166, -2.391223, 1, 0.4901961, 0, 1,
-1.296661, -1.414919, -3.52962, 1, 0.4980392, 0, 1,
-1.290943, -0.5146898, -2.523226, 1, 0.5058824, 0, 1,
-1.290796, 0.8942329, 0.7495946, 1, 0.509804, 0, 1,
-1.284982, 0.5864578, -1.267452, 1, 0.5176471, 0, 1,
-1.279147, 0.1777561, -0.9922557, 1, 0.5215687, 0, 1,
-1.251305, -0.02194165, -2.323091, 1, 0.5294118, 0, 1,
-1.239397, -1.796306, -2.420629, 1, 0.5333334, 0, 1,
-1.238815, -0.4097178, -1.471351, 1, 0.5411765, 0, 1,
-1.228627, 0.1478311, -1.437073, 1, 0.5450981, 0, 1,
-1.226825, -0.06325322, -1.366564, 1, 0.5529412, 0, 1,
-1.221082, -0.1090524, -1.319321, 1, 0.5568628, 0, 1,
-1.214131, 0.6212378, -0.1450377, 1, 0.5647059, 0, 1,
-1.210369, -0.2811673, -3.390681, 1, 0.5686275, 0, 1,
-1.208533, 1.183268, -1.041389, 1, 0.5764706, 0, 1,
-1.204766, 0.4841418, -0.6887144, 1, 0.5803922, 0, 1,
-1.188413, 0.09257393, -1.805583, 1, 0.5882353, 0, 1,
-1.172531, 1.024673, -0.6198755, 1, 0.5921569, 0, 1,
-1.171423, 0.1270257, -1.059982, 1, 0.6, 0, 1,
-1.166517, -0.2807799, -2.000739, 1, 0.6078432, 0, 1,
-1.159959, -0.7122526, -0.152683, 1, 0.6117647, 0, 1,
-1.155208, -0.100122, -1.24479, 1, 0.6196079, 0, 1,
-1.146651, -0.209583, -2.324736, 1, 0.6235294, 0, 1,
-1.146167, 2.000779, 0.187889, 1, 0.6313726, 0, 1,
-1.14436, -0.4381743, -2.764454, 1, 0.6352941, 0, 1,
-1.138871, 0.4946925, -0.6414951, 1, 0.6431373, 0, 1,
-1.137004, -0.003887709, -1.856199, 1, 0.6470588, 0, 1,
-1.135821, -0.9009082, -2.575969, 1, 0.654902, 0, 1,
-1.135749, 1.151996, -0.681487, 1, 0.6588235, 0, 1,
-1.129334, -0.278581, -1.309812, 1, 0.6666667, 0, 1,
-1.125851, 0.9435868, -1.371064, 1, 0.6705883, 0, 1,
-1.123728, -0.1049222, -1.739675, 1, 0.6784314, 0, 1,
-1.119701, 1.898591, -0.6822079, 1, 0.682353, 0, 1,
-1.119068, 0.2877115, 0.03593805, 1, 0.6901961, 0, 1,
-1.115655, 1.482241, -2.225231, 1, 0.6941177, 0, 1,
-1.110455, 0.0910043, 0.05498739, 1, 0.7019608, 0, 1,
-1.10584, -1.585472, -2.308817, 1, 0.7098039, 0, 1,
-1.101734, -0.910087, -1.814449, 1, 0.7137255, 0, 1,
-1.100225, 0.01861591, -2.601874, 1, 0.7215686, 0, 1,
-1.099523, -0.6485806, -2.136986, 1, 0.7254902, 0, 1,
-1.094455, -1.306161, -3.749236, 1, 0.7333333, 0, 1,
-1.087452, 0.5314916, -1.304258, 1, 0.7372549, 0, 1,
-1.085466, 0.0638211, -0.6158872, 1, 0.7450981, 0, 1,
-1.083727, 2.484245, 1.158396, 1, 0.7490196, 0, 1,
-1.08357, 0.6762905, -0.7312554, 1, 0.7568628, 0, 1,
-1.081985, 1.040797, -1.299375, 1, 0.7607843, 0, 1,
-1.072471, 0.1076526, -1.314664, 1, 0.7686275, 0, 1,
-1.07127, 1.510144, -0.8735108, 1, 0.772549, 0, 1,
-1.067477, -0.6193999, -0.1227723, 1, 0.7803922, 0, 1,
-1.066511, -2.448297, -3.170378, 1, 0.7843137, 0, 1,
-1.062911, -0.8432215, -3.699832, 1, 0.7921569, 0, 1,
-1.060132, -1.791875, -1.094706, 1, 0.7960784, 0, 1,
-1.055903, 1.063558, -1.270872, 1, 0.8039216, 0, 1,
-1.045968, -0.002453578, -3.418141, 1, 0.8117647, 0, 1,
-1.044453, -0.04019188, 0.1069005, 1, 0.8156863, 0, 1,
-1.04418, -0.02343017, -1.7607, 1, 0.8235294, 0, 1,
-1.04349, 1.282547, -0.8008475, 1, 0.827451, 0, 1,
-1.043158, -0.626665, -1.800611, 1, 0.8352941, 0, 1,
-1.039798, 1.145459, -1.499147, 1, 0.8392157, 0, 1,
-1.039136, -1.783745, -2.040833, 1, 0.8470588, 0, 1,
-1.037138, 0.3269783, -1.129929, 1, 0.8509804, 0, 1,
-1.034405, -0.1173749, -1.88184, 1, 0.8588235, 0, 1,
-1.021168, -0.7586162, -3.515163, 1, 0.8627451, 0, 1,
-1.020299, -1.634016, -3.768081, 1, 0.8705882, 0, 1,
-1.015354, -0.6953624, -2.932486, 1, 0.8745098, 0, 1,
-1.014155, 0.7433965, 0.2350117, 1, 0.8823529, 0, 1,
-1.01314, -1.731269, -2.632291, 1, 0.8862745, 0, 1,
-1.012542, 0.9114032, -0.9668375, 1, 0.8941177, 0, 1,
-1.010427, 0.2017676, -1.504832, 1, 0.8980392, 0, 1,
-1.00703, 2.071911, -2.330008, 1, 0.9058824, 0, 1,
-0.9922196, 0.2132137, -1.512654, 1, 0.9137255, 0, 1,
-0.987448, 1.422278, 0.4519299, 1, 0.9176471, 0, 1,
-0.978276, 0.823077, -2.024435, 1, 0.9254902, 0, 1,
-0.9763452, 0.4616941, -1.780377, 1, 0.9294118, 0, 1,
-0.9728703, 1.201354, -0.9062966, 1, 0.9372549, 0, 1,
-0.972813, -0.4434822, -2.445532, 1, 0.9411765, 0, 1,
-0.971104, -0.4216045, -3.104089, 1, 0.9490196, 0, 1,
-0.9693226, -0.5367684, -1.96338, 1, 0.9529412, 0, 1,
-0.9604498, 0.266588, 0.4111813, 1, 0.9607843, 0, 1,
-0.9504406, -1.219761, -2.084674, 1, 0.9647059, 0, 1,
-0.9477329, -0.5150732, -0.5751482, 1, 0.972549, 0, 1,
-0.9466668, -0.5628442, -2.452437, 1, 0.9764706, 0, 1,
-0.9466084, 2.208594, -0.74905, 1, 0.9843137, 0, 1,
-0.9457244, 1.209701, 1.597336, 1, 0.9882353, 0, 1,
-0.9404565, -0.01051885, -1.246965, 1, 0.9960784, 0, 1,
-0.9390596, 0.7389709, 0.1286541, 0.9960784, 1, 0, 1,
-0.9375125, -0.5504622, -1.334256, 0.9921569, 1, 0, 1,
-0.9335151, 0.2048491, -2.08388, 0.9843137, 1, 0, 1,
-0.9239825, -0.3200612, -0.4683038, 0.9803922, 1, 0, 1,
-0.9231999, 0.2371535, -0.4906311, 0.972549, 1, 0, 1,
-0.9151058, -0.9773065, -2.699841, 0.9686275, 1, 0, 1,
-0.9099035, 0.3214654, -0.8536946, 0.9607843, 1, 0, 1,
-0.9087021, 0.4748173, -0.8160492, 0.9568627, 1, 0, 1,
-0.9070377, -0.1071761, -1.885955, 0.9490196, 1, 0, 1,
-0.9022103, -0.8773799, -1.817736, 0.945098, 1, 0, 1,
-0.8997758, -0.1356279, -0.3609279, 0.9372549, 1, 0, 1,
-0.8992994, 1.361447, 0.5299413, 0.9333333, 1, 0, 1,
-0.8946242, 1.238131, 0.7904809, 0.9254902, 1, 0, 1,
-0.8930817, -0.8992539, -3.682919, 0.9215686, 1, 0, 1,
-0.8859624, -0.08523226, -3.987082, 0.9137255, 1, 0, 1,
-0.8824337, 0.8305025, -0.9030089, 0.9098039, 1, 0, 1,
-0.8713545, 0.2717916, -1.659476, 0.9019608, 1, 0, 1,
-0.8630036, 0.5481993, -1.88755, 0.8941177, 1, 0, 1,
-0.8564562, -0.4814065, -1.75187, 0.8901961, 1, 0, 1,
-0.8561907, 0.752605, 0.9788248, 0.8823529, 1, 0, 1,
-0.8554099, 0.1007637, -0.8095383, 0.8784314, 1, 0, 1,
-0.8533583, 0.2913641, -0.1986051, 0.8705882, 1, 0, 1,
-0.85309, 0.1335579, -1.996438, 0.8666667, 1, 0, 1,
-0.8491812, 1.208995, -0.389911, 0.8588235, 1, 0, 1,
-0.8488378, 0.7342708, -0.6163463, 0.854902, 1, 0, 1,
-0.8472065, -1.504711, -2.05308, 0.8470588, 1, 0, 1,
-0.8387915, -0.4424794, -0.7079135, 0.8431373, 1, 0, 1,
-0.8383268, 1.386648, 1.03147, 0.8352941, 1, 0, 1,
-0.8312718, -0.34509, -3.342697, 0.8313726, 1, 0, 1,
-0.8311551, -1.455466, -3.104737, 0.8235294, 1, 0, 1,
-0.8124552, -1.009987, -3.296982, 0.8196079, 1, 0, 1,
-0.8099963, 1.618704, -1.476316, 0.8117647, 1, 0, 1,
-0.8083416, -1.295975, -2.235234, 0.8078431, 1, 0, 1,
-0.8080204, -0.2654878, -0.6112361, 0.8, 1, 0, 1,
-0.8062283, -0.2890516, -1.317018, 0.7921569, 1, 0, 1,
-0.79872, 0.5345515, -1.894742, 0.7882353, 1, 0, 1,
-0.7924218, 0.4537618, -1.305497, 0.7803922, 1, 0, 1,
-0.792224, 1.929571, 0.5954115, 0.7764706, 1, 0, 1,
-0.7922072, -1.466948, -3.627096, 0.7686275, 1, 0, 1,
-0.7907166, 0.6658685, -1.322255, 0.7647059, 1, 0, 1,
-0.7905859, -1.826511, -3.029666, 0.7568628, 1, 0, 1,
-0.7830397, 0.9682724, -1.368344, 0.7529412, 1, 0, 1,
-0.7783117, -1.873892, -3.107814, 0.7450981, 1, 0, 1,
-0.7717537, -1.11653, -1.341763, 0.7411765, 1, 0, 1,
-0.7717258, -0.5972102, -3.740576, 0.7333333, 1, 0, 1,
-0.7698638, 1.36967, -1.948267, 0.7294118, 1, 0, 1,
-0.7675411, 0.1039265, -1.982337, 0.7215686, 1, 0, 1,
-0.7643058, -0.1545835, -2.428945, 0.7176471, 1, 0, 1,
-0.7635102, -1.168232, -2.315817, 0.7098039, 1, 0, 1,
-0.7612594, -1.237703, -1.17526, 0.7058824, 1, 0, 1,
-0.7588797, -0.7917505, -4.33151, 0.6980392, 1, 0, 1,
-0.7585151, 1.079139, 0.2400952, 0.6901961, 1, 0, 1,
-0.7581323, -0.2022257, -1.139383, 0.6862745, 1, 0, 1,
-0.7526628, -1.085637, -3.065704, 0.6784314, 1, 0, 1,
-0.7515759, -1.653244, -1.147268, 0.6745098, 1, 0, 1,
-0.7492768, -0.315778, -3.511848, 0.6666667, 1, 0, 1,
-0.7486848, -0.6272907, -1.277263, 0.6627451, 1, 0, 1,
-0.7485147, -1.261613, -1.259092, 0.654902, 1, 0, 1,
-0.7425832, -0.3320314, -2.962002, 0.6509804, 1, 0, 1,
-0.7415721, -0.191654, -3.1863, 0.6431373, 1, 0, 1,
-0.7328433, 0.4937627, -1.878041, 0.6392157, 1, 0, 1,
-0.7318513, 0.1538699, -2.457178, 0.6313726, 1, 0, 1,
-0.7298263, -0.4033565, -3.162452, 0.627451, 1, 0, 1,
-0.7293324, 0.8652474, -1.275808, 0.6196079, 1, 0, 1,
-0.7243139, -1.042423, -3.326904, 0.6156863, 1, 0, 1,
-0.7150311, -0.03285388, -3.543334, 0.6078432, 1, 0, 1,
-0.7095237, -0.9295309, -1.677397, 0.6039216, 1, 0, 1,
-0.7061499, -0.9771221, -2.840615, 0.5960785, 1, 0, 1,
-0.7031349, -0.5219932, -3.403563, 0.5882353, 1, 0, 1,
-0.6997876, 1.409698, -0.07662554, 0.5843138, 1, 0, 1,
-0.6992575, 0.9445569, -1.225561, 0.5764706, 1, 0, 1,
-0.6968808, 0.6133392, -1.641668, 0.572549, 1, 0, 1,
-0.6958772, -1.252702, -3.321179, 0.5647059, 1, 0, 1,
-0.6805277, 0.3190209, -0.7915783, 0.5607843, 1, 0, 1,
-0.6793314, 0.6323355, -1.848504, 0.5529412, 1, 0, 1,
-0.6759006, 1.029934, -2.041493, 0.5490196, 1, 0, 1,
-0.6699482, 0.4697562, -1.801896, 0.5411765, 1, 0, 1,
-0.6677316, 0.1588838, -0.8100367, 0.5372549, 1, 0, 1,
-0.6667365, -2.232689, -3.147803, 0.5294118, 1, 0, 1,
-0.6626807, -1.552425, -3.416566, 0.5254902, 1, 0, 1,
-0.6618924, 0.5752385, -0.9852743, 0.5176471, 1, 0, 1,
-0.661239, -0.2522702, -0.5243353, 0.5137255, 1, 0, 1,
-0.6527641, -0.78602, -0.9169854, 0.5058824, 1, 0, 1,
-0.6502767, -1.204768, -4.59632, 0.5019608, 1, 0, 1,
-0.6493314, 0.2574016, -0.1504147, 0.4941176, 1, 0, 1,
-0.6490999, -1.246062, -3.295878, 0.4862745, 1, 0, 1,
-0.6444788, -1.233929, -2.534774, 0.4823529, 1, 0, 1,
-0.6411521, -1.791041, -3.264536, 0.4745098, 1, 0, 1,
-0.6395556, -0.5357459, -2.091303, 0.4705882, 1, 0, 1,
-0.6391195, 0.569622, -0.4352465, 0.4627451, 1, 0, 1,
-0.6344451, -0.5623312, -1.544684, 0.4588235, 1, 0, 1,
-0.6317877, -0.1646578, -0.5026274, 0.4509804, 1, 0, 1,
-0.6317016, -0.9646807, -2.464869, 0.4470588, 1, 0, 1,
-0.6302868, -1.318833, -2.51781, 0.4392157, 1, 0, 1,
-0.6300118, -1.041058, -2.849, 0.4352941, 1, 0, 1,
-0.6290379, -1.596877, -2.626024, 0.427451, 1, 0, 1,
-0.6140725, 1.665095, 0.9771097, 0.4235294, 1, 0, 1,
-0.6136492, -0.3969242, -1.901745, 0.4156863, 1, 0, 1,
-0.6115211, 0.6156756, -0.5484672, 0.4117647, 1, 0, 1,
-0.6107896, 1.490151, -0.1044641, 0.4039216, 1, 0, 1,
-0.6031274, 0.3342863, -1.655382, 0.3960784, 1, 0, 1,
-0.6023695, 0.446576, -0.8687854, 0.3921569, 1, 0, 1,
-0.6000061, -0.526064, -1.939397, 0.3843137, 1, 0, 1,
-0.5897524, 0.8929684, -0.1142074, 0.3803922, 1, 0, 1,
-0.5893458, 0.8440989, -1.180388, 0.372549, 1, 0, 1,
-0.586341, -0.7544798, -1.658564, 0.3686275, 1, 0, 1,
-0.58361, -0.9936675, -2.904133, 0.3607843, 1, 0, 1,
-0.5816968, 0.7362459, -1.515085, 0.3568628, 1, 0, 1,
-0.5810874, -0.7872071, -1.596743, 0.3490196, 1, 0, 1,
-0.5794052, 0.6619296, -0.4882682, 0.345098, 1, 0, 1,
-0.5783769, 0.06976484, -1.414075, 0.3372549, 1, 0, 1,
-0.5735726, 1.059827, -1.684649, 0.3333333, 1, 0, 1,
-0.5734817, -1.869457, -2.29912, 0.3254902, 1, 0, 1,
-0.5685149, 0.3994177, -3.215187, 0.3215686, 1, 0, 1,
-0.5679816, 0.1332855, -0.2143069, 0.3137255, 1, 0, 1,
-0.5627829, -2.433424, -3.751814, 0.3098039, 1, 0, 1,
-0.5587026, -0.2851356, -0.6333495, 0.3019608, 1, 0, 1,
-0.5522034, 1.184476, 0.8968779, 0.2941177, 1, 0, 1,
-0.5513594, -1.042804, -2.204924, 0.2901961, 1, 0, 1,
-0.5404203, -0.48112, -2.081089, 0.282353, 1, 0, 1,
-0.5397156, -0.2722693, -2.411594, 0.2784314, 1, 0, 1,
-0.5354354, 0.1875557, 0.9689522, 0.2705882, 1, 0, 1,
-0.5349889, -0.3053394, -0.6456404, 0.2666667, 1, 0, 1,
-0.533273, -0.6880645, -2.450535, 0.2588235, 1, 0, 1,
-0.5316709, 0.4801403, -0.8631467, 0.254902, 1, 0, 1,
-0.5308354, -0.2812052, -1.028828, 0.2470588, 1, 0, 1,
-0.5293052, -1.845173, -2.610103, 0.2431373, 1, 0, 1,
-0.5247513, 0.5326363, -1.473146, 0.2352941, 1, 0, 1,
-0.5204181, -0.6752434, -2.10049, 0.2313726, 1, 0, 1,
-0.5167701, 2.06709, -0.5348892, 0.2235294, 1, 0, 1,
-0.5140685, -1.339251, -3.114032, 0.2196078, 1, 0, 1,
-0.5128253, 2.106779, -0.4063299, 0.2117647, 1, 0, 1,
-0.509035, 0.5856987, 0.9470124, 0.2078431, 1, 0, 1,
-0.5051724, -0.24876, -2.193387, 0.2, 1, 0, 1,
-0.5036133, 1.610329, -0.718188, 0.1921569, 1, 0, 1,
-0.4991715, -0.4224203, -2.261952, 0.1882353, 1, 0, 1,
-0.4960089, -1.339157, -2.171559, 0.1803922, 1, 0, 1,
-0.4945454, -0.3763189, -2.201741, 0.1764706, 1, 0, 1,
-0.487365, 0.6761756, -0.8582405, 0.1686275, 1, 0, 1,
-0.4872488, 0.121447, -2.971255, 0.1647059, 1, 0, 1,
-0.4871879, 0.3739363, -1.066727, 0.1568628, 1, 0, 1,
-0.4846896, -1.174662, -2.579301, 0.1529412, 1, 0, 1,
-0.4802155, -0.7289875, -2.831378, 0.145098, 1, 0, 1,
-0.4786066, 0.6731195, -0.6111291, 0.1411765, 1, 0, 1,
-0.4771096, 0.1202217, 0.1875597, 0.1333333, 1, 0, 1,
-0.4751806, -0.3785037, -3.12287, 0.1294118, 1, 0, 1,
-0.4648803, 0.6751708, -0.556817, 0.1215686, 1, 0, 1,
-0.4636542, -0.8938396, -1.409726, 0.1176471, 1, 0, 1,
-0.4608783, -0.7495814, -0.6062565, 0.1098039, 1, 0, 1,
-0.4601975, -1.944999, -2.926268, 0.1058824, 1, 0, 1,
-0.4561507, -0.6184605, -2.344144, 0.09803922, 1, 0, 1,
-0.4544104, 2.33509, -0.5908231, 0.09019608, 1, 0, 1,
-0.4444965, -0.5544066, -1.124277, 0.08627451, 1, 0, 1,
-0.4418345, -0.2138071, -0.7286692, 0.07843138, 1, 0, 1,
-0.4405359, -1.54413, -1.850245, 0.07450981, 1, 0, 1,
-0.4401841, -0.08901483, -2.218914, 0.06666667, 1, 0, 1,
-0.4351024, 1.672417, -0.6627282, 0.0627451, 1, 0, 1,
-0.4327153, -0.02745455, -2.662077, 0.05490196, 1, 0, 1,
-0.4326918, -1.070026, -4.386399, 0.05098039, 1, 0, 1,
-0.432674, -0.5765062, -1.88357, 0.04313726, 1, 0, 1,
-0.4315303, 0.6683733, -0.4766555, 0.03921569, 1, 0, 1,
-0.4310102, 2.175197, -0.2492081, 0.03137255, 1, 0, 1,
-0.4289375, 0.2101889, -0.3537175, 0.02745098, 1, 0, 1,
-0.4201235, 1.175967, -1.748749, 0.01960784, 1, 0, 1,
-0.418722, -0.8791516, -2.83225, 0.01568628, 1, 0, 1,
-0.4153697, 0.3751118, 0.1085601, 0.007843138, 1, 0, 1,
-0.4143173, -0.9026856, -2.128374, 0.003921569, 1, 0, 1,
-0.4133393, -1.700967, -1.228352, 0, 1, 0.003921569, 1,
-0.4020447, 0.5447338, -1.112753, 0, 1, 0.01176471, 1,
-0.3975241, 0.6330361, -0.711513, 0, 1, 0.01568628, 1,
-0.3972189, -0.6172052, -2.649468, 0, 1, 0.02352941, 1,
-0.3970996, -0.0963835, -2.390338, 0, 1, 0.02745098, 1,
-0.393802, -0.03182923, -0.5508851, 0, 1, 0.03529412, 1,
-0.393267, 0.2538396, -0.7212262, 0, 1, 0.03921569, 1,
-0.3927105, 0.1713624, -1.393479, 0, 1, 0.04705882, 1,
-0.3824474, 0.6174782, -0.6846648, 0, 1, 0.05098039, 1,
-0.3788234, 2.426967, -2.77914, 0, 1, 0.05882353, 1,
-0.3780535, -1.105866, -2.633823, 0, 1, 0.0627451, 1,
-0.3690702, 0.9404559, 1.54981, 0, 1, 0.07058824, 1,
-0.3688599, 0.03428759, -3.258323, 0, 1, 0.07450981, 1,
-0.36763, -0.708478, -1.692978, 0, 1, 0.08235294, 1,
-0.3584182, -0.7773468, -2.302555, 0, 1, 0.08627451, 1,
-0.3554109, 1.200097, -1.054583, 0, 1, 0.09411765, 1,
-0.3481867, 0.6311188, -0.3646457, 0, 1, 0.1019608, 1,
-0.3475567, 0.4792531, 1.314882, 0, 1, 0.1058824, 1,
-0.3451828, -0.07902253, -0.8288228, 0, 1, 0.1137255, 1,
-0.3445599, -0.3905821, -2.550997, 0, 1, 0.1176471, 1,
-0.3442849, -0.7469715, -1.939957, 0, 1, 0.1254902, 1,
-0.3432716, -0.3479531, -2.197613, 0, 1, 0.1294118, 1,
-0.3428656, -2.499046, -3.140091, 0, 1, 0.1372549, 1,
-0.3402025, 0.5862638, -0.1104705, 0, 1, 0.1411765, 1,
-0.3398737, -0.7506186, -1.912551, 0, 1, 0.1490196, 1,
-0.3393337, -0.6630546, -2.551101, 0, 1, 0.1529412, 1,
-0.3349935, 0.1764217, -2.467665, 0, 1, 0.1607843, 1,
-0.3290796, -1.039391, -2.029451, 0, 1, 0.1647059, 1,
-0.3273737, 1.447678, 0.5023293, 0, 1, 0.172549, 1,
-0.326835, 2.074136, -0.6041974, 0, 1, 0.1764706, 1,
-0.3217705, -0.8095881, -3.363945, 0, 1, 0.1843137, 1,
-0.3215969, -1.034072, -2.627048, 0, 1, 0.1882353, 1,
-0.318153, -0.3270327, -1.392316, 0, 1, 0.1960784, 1,
-0.3178043, -1.466605, -3.723938, 0, 1, 0.2039216, 1,
-0.3172333, 0.5726571, -2.525413, 0, 1, 0.2078431, 1,
-0.3126596, -1.095029, -2.888956, 0, 1, 0.2156863, 1,
-0.3124841, -0.03350268, -1.356426, 0, 1, 0.2196078, 1,
-0.310096, 0.1411476, -1.256774, 0, 1, 0.227451, 1,
-0.3097069, 0.7216827, -2.235065, 0, 1, 0.2313726, 1,
-0.3034209, -0.1657062, -0.428955, 0, 1, 0.2392157, 1,
-0.3013408, -1.340357, -3.019078, 0, 1, 0.2431373, 1,
-0.3012308, -1.316561, -3.656961, 0, 1, 0.2509804, 1,
-0.3000504, -0.4261307, -4.203145, 0, 1, 0.254902, 1,
-0.2998971, -0.5696133, -2.668324, 0, 1, 0.2627451, 1,
-0.2977337, 0.8296293, 0.103123, 0, 1, 0.2666667, 1,
-0.2963198, -1.425029, -2.70679, 0, 1, 0.2745098, 1,
-0.2951375, -0.4598562, -3.398703, 0, 1, 0.2784314, 1,
-0.294482, -0.5047113, -3.187333, 0, 1, 0.2862745, 1,
-0.2907234, -0.8652785, -2.721508, 0, 1, 0.2901961, 1,
-0.2903318, -0.5321566, -2.20709, 0, 1, 0.2980392, 1,
-0.2861829, 0.3972133, -1.168433, 0, 1, 0.3058824, 1,
-0.2858593, 1.403244, -0.9400516, 0, 1, 0.3098039, 1,
-0.2838183, 1.492095, -1.541577, 0, 1, 0.3176471, 1,
-0.2836232, 0.02743812, -1.02108, 0, 1, 0.3215686, 1,
-0.2814116, 0.6395706, 0.1672159, 0, 1, 0.3294118, 1,
-0.2770438, 1.418924, -0.1473612, 0, 1, 0.3333333, 1,
-0.2764339, 0.5614683, 0.5713781, 0, 1, 0.3411765, 1,
-0.2737963, 0.759212, -0.5189077, 0, 1, 0.345098, 1,
-0.2713644, -0.5095527, -2.996771, 0, 1, 0.3529412, 1,
-0.2654309, 0.09401198, -0.9374304, 0, 1, 0.3568628, 1,
-0.2643074, -0.430856, -2.034884, 0, 1, 0.3647059, 1,
-0.2636787, 0.4480805, -0.301234, 0, 1, 0.3686275, 1,
-0.2607906, -0.700635, -1.250001, 0, 1, 0.3764706, 1,
-0.2514363, -1.291185, -3.129037, 0, 1, 0.3803922, 1,
-0.242998, 0.4601843, -0.7466391, 0, 1, 0.3882353, 1,
-0.2412532, -0.546793, -2.282537, 0, 1, 0.3921569, 1,
-0.2402605, 2.262525, 0.8514773, 0, 1, 0.4, 1,
-0.2399487, 0.1894323, 0.4065611, 0, 1, 0.4078431, 1,
-0.2392843, 0.1889484, -0.1598891, 0, 1, 0.4117647, 1,
-0.2385245, 1.635072, 0.7983553, 0, 1, 0.4196078, 1,
-0.2371912, 0.3592175, -2.034503, 0, 1, 0.4235294, 1,
-0.2369384, 1.523829, -0.9971722, 0, 1, 0.4313726, 1,
-0.2332253, 0.09415206, -1.134676, 0, 1, 0.4352941, 1,
-0.2263968, 0.1342386, -1.521733, 0, 1, 0.4431373, 1,
-0.2226205, -0.1016231, -0.9663331, 0, 1, 0.4470588, 1,
-0.2213458, -0.385627, -2.552658, 0, 1, 0.454902, 1,
-0.2205918, -0.6896669, -3.649458, 0, 1, 0.4588235, 1,
-0.2188787, 0.6360183, -2.009745, 0, 1, 0.4666667, 1,
-0.2188496, -0.1924188, -1.582557, 0, 1, 0.4705882, 1,
-0.2186166, -0.8538805, -2.198445, 0, 1, 0.4784314, 1,
-0.2180577, -1.099762, -3.153377, 0, 1, 0.4823529, 1,
-0.2125632, -0.3925885, -2.536462, 0, 1, 0.4901961, 1,
-0.212299, 2.253106, 0.3233767, 0, 1, 0.4941176, 1,
-0.206258, 0.2623518, -0.837364, 0, 1, 0.5019608, 1,
-0.201782, -0.6703474, -3.027216, 0, 1, 0.509804, 1,
-0.2006159, 0.8582071, 2.083201, 0, 1, 0.5137255, 1,
-0.1992575, -1.143494, -2.254181, 0, 1, 0.5215687, 1,
-0.1975704, -0.474745, -3.022533, 0, 1, 0.5254902, 1,
-0.196655, -0.5861959, -3.591203, 0, 1, 0.5333334, 1,
-0.190678, 0.8729874, 0.3596569, 0, 1, 0.5372549, 1,
-0.1869659, -0.8552248, -1.385986, 0, 1, 0.5450981, 1,
-0.1819535, -0.8296722, -2.962992, 0, 1, 0.5490196, 1,
-0.1817024, 1.164124, 0.6256492, 0, 1, 0.5568628, 1,
-0.1789837, -0.3431133, -0.9109133, 0, 1, 0.5607843, 1,
-0.1781253, 0.7707226, 0.8637704, 0, 1, 0.5686275, 1,
-0.1755676, 0.1600024, 0.1715051, 0, 1, 0.572549, 1,
-0.1734891, 1.163532, -0.2684964, 0, 1, 0.5803922, 1,
-0.1708462, 1.392918, -0.3061995, 0, 1, 0.5843138, 1,
-0.1705894, -1.893672, -4.356815, 0, 1, 0.5921569, 1,
-0.1664029, -1.141412, -3.664217, 0, 1, 0.5960785, 1,
-0.164861, 0.600949, -1.493307, 0, 1, 0.6039216, 1,
-0.1639027, -0.516852, -3.537202, 0, 1, 0.6117647, 1,
-0.1590429, 0.1491093, -0.3917183, 0, 1, 0.6156863, 1,
-0.1588674, -0.6065071, -4.198659, 0, 1, 0.6235294, 1,
-0.1577266, -0.2812287, -2.225799, 0, 1, 0.627451, 1,
-0.1558769, -0.9887608, -4.682606, 0, 1, 0.6352941, 1,
-0.155166, -0.06973337, -4.019013, 0, 1, 0.6392157, 1,
-0.1504789, -1.064396, -4.478145, 0, 1, 0.6470588, 1,
-0.1500903, -0.6400318, -2.808992, 0, 1, 0.6509804, 1,
-0.1476049, -0.4378617, -2.607302, 0, 1, 0.6588235, 1,
-0.1463483, 1.1117, 0.008964095, 0, 1, 0.6627451, 1,
-0.1431072, 0.6280653, -0.1806401, 0, 1, 0.6705883, 1,
-0.1415061, -0.2854802, -2.933549, 0, 1, 0.6745098, 1,
-0.1408208, -1.089164, -4.040143, 0, 1, 0.682353, 1,
-0.1395353, -1.714221, -3.715473, 0, 1, 0.6862745, 1,
-0.136157, 0.3843875, 0.5250045, 0, 1, 0.6941177, 1,
-0.1358315, 0.1138398, 1.184039, 0, 1, 0.7019608, 1,
-0.1354475, 0.0804118, -3.242518, 0, 1, 0.7058824, 1,
-0.1350648, -0.3452978, -3.182678, 0, 1, 0.7137255, 1,
-0.1348103, 0.3168665, 1.330526, 0, 1, 0.7176471, 1,
-0.1324024, 1.029863, 0.2935811, 0, 1, 0.7254902, 1,
-0.1311032, 1.255615, -0.9863579, 0, 1, 0.7294118, 1,
-0.129569, 0.4762199, -2.541011, 0, 1, 0.7372549, 1,
-0.1270861, 0.5895668, -0.5065759, 0, 1, 0.7411765, 1,
-0.1261222, -0.6305676, -1.069659, 0, 1, 0.7490196, 1,
-0.125833, 0.7522653, 1.632136, 0, 1, 0.7529412, 1,
-0.124816, -1.075726, -1.550224, 0, 1, 0.7607843, 1,
-0.12145, -1.528519, -3.231404, 0, 1, 0.7647059, 1,
-0.1165375, 1.198756, 0.236441, 0, 1, 0.772549, 1,
-0.1146591, -0.08266684, -1.535617, 0, 1, 0.7764706, 1,
-0.1118629, 0.3915389, -1.866848, 0, 1, 0.7843137, 1,
-0.1100776, 0.126525, 0.4126262, 0, 1, 0.7882353, 1,
-0.1095482, -0.4591799, -2.18279, 0, 1, 0.7960784, 1,
-0.1085138, -1.444984, -4.092224, 0, 1, 0.8039216, 1,
-0.1055766, 1.979289, -0.1910302, 0, 1, 0.8078431, 1,
-0.08937228, -1.349374, -3.947605, 0, 1, 0.8156863, 1,
-0.08687537, -0.1498789, -3.825588, 0, 1, 0.8196079, 1,
-0.08490589, -1.729414, -3.236444, 0, 1, 0.827451, 1,
-0.08467852, -1.92551, -6.270708, 0, 1, 0.8313726, 1,
-0.08427406, 0.5182801, 0.156824, 0, 1, 0.8392157, 1,
-0.08393268, 1.40878, -0.03703909, 0, 1, 0.8431373, 1,
-0.08119189, 1.363697, -0.6308469, 0, 1, 0.8509804, 1,
-0.08031204, -0.3709763, -2.586715, 0, 1, 0.854902, 1,
-0.07829837, -0.09344314, -1.250066, 0, 1, 0.8627451, 1,
-0.07820687, 0.006937184, -2.08639, 0, 1, 0.8666667, 1,
-0.07797947, -0.7788066, -3.145604, 0, 1, 0.8745098, 1,
-0.0769182, 0.0439438, -1.469051, 0, 1, 0.8784314, 1,
-0.07111285, 0.6931897, 0.02882575, 0, 1, 0.8862745, 1,
-0.06858644, 0.3643913, -0.4295023, 0, 1, 0.8901961, 1,
-0.06244708, -1.276611, -3.29776, 0, 1, 0.8980392, 1,
-0.06092974, 1.153139, 0.1645216, 0, 1, 0.9058824, 1,
-0.06067171, 0.1874295, -1.913833, 0, 1, 0.9098039, 1,
-0.06019438, -0.9641559, -4.578846, 0, 1, 0.9176471, 1,
-0.05977539, 1.011841, 0.9691251, 0, 1, 0.9215686, 1,
-0.05109983, 0.1013286, -0.0887544, 0, 1, 0.9294118, 1,
-0.04955682, 0.2128206, 1.23428, 0, 1, 0.9333333, 1,
-0.04893034, -1.052433, -3.579921, 0, 1, 0.9411765, 1,
-0.04794821, 0.4395937, 0.993826, 0, 1, 0.945098, 1,
-0.04614203, 1.757863, 0.7558722, 0, 1, 0.9529412, 1,
-0.04433759, 0.246883, 1.354893, 0, 1, 0.9568627, 1,
-0.04158604, -0.05483716, -2.616713, 0, 1, 0.9647059, 1,
-0.0402542, 1.269841, -0.4239089, 0, 1, 0.9686275, 1,
-0.03095688, 0.7351065, 0.6713884, 0, 1, 0.9764706, 1,
-0.03054324, -1.25367, -2.69562, 0, 1, 0.9803922, 1,
-0.02948387, -0.8918737, -4.609939, 0, 1, 0.9882353, 1,
-0.0292066, -1.107809, -2.722907, 0, 1, 0.9921569, 1,
-0.02859369, 0.2951732, -0.8354124, 0, 1, 1, 1,
-0.0182064, 1.593405, -2.287683, 0, 0.9921569, 1, 1,
-0.01541607, 0.7102506, 0.7073771, 0, 0.9882353, 1, 1,
-0.01539942, 0.1577313, -0.2729102, 0, 0.9803922, 1, 1,
-0.01434248, -0.2848323, -4.755062, 0, 0.9764706, 1, 1,
-0.01386105, 1.378397, 0.6671909, 0, 0.9686275, 1, 1,
-0.01358952, 0.4748401, 0.5885159, 0, 0.9647059, 1, 1,
-0.00710452, -0.3709318, -1.438468, 0, 0.9568627, 1, 1,
-0.002962758, -0.5437951, -2.033047, 0, 0.9529412, 1, 1,
-0.002645567, 1.00575, -0.147435, 0, 0.945098, 1, 1,
-0.002506349, -0.5728295, -3.234465, 0, 0.9411765, 1, 1,
-0.0008390389, -0.3815117, -1.280944, 0, 0.9333333, 1, 1,
-0.0007363746, -0.3918025, -4.048759, 0, 0.9294118, 1, 1,
0.002311844, 0.7394892, -1.386911, 0, 0.9215686, 1, 1,
0.003130613, -0.6179134, 2.916082, 0, 0.9176471, 1, 1,
0.005804616, 0.4278468, 0.3658473, 0, 0.9098039, 1, 1,
0.008705666, 1.588148, -1.179716, 0, 0.9058824, 1, 1,
0.009699276, 0.1337964, 0.8290948, 0, 0.8980392, 1, 1,
0.01240693, -0.2519462, 1.826671, 0, 0.8901961, 1, 1,
0.01450096, -1.217654, 1.720983, 0, 0.8862745, 1, 1,
0.02412674, 1.115128, 1.169137, 0, 0.8784314, 1, 1,
0.02668447, 0.2727634, 0.6680517, 0, 0.8745098, 1, 1,
0.027492, -0.6468914, 3.013557, 0, 0.8666667, 1, 1,
0.03138665, 1.789993, -0.831027, 0, 0.8627451, 1, 1,
0.03371412, 1.120312, -0.227988, 0, 0.854902, 1, 1,
0.03785851, -0.04385538, 2.671024, 0, 0.8509804, 1, 1,
0.04427326, -0.2439895, 3.091184, 0, 0.8431373, 1, 1,
0.04435769, -0.5688688, 2.556042, 0, 0.8392157, 1, 1,
0.04471255, -0.3283721, 3.140258, 0, 0.8313726, 1, 1,
0.05872672, 1.826181, 1.316873, 0, 0.827451, 1, 1,
0.06123683, -0.498994, 5.158509, 0, 0.8196079, 1, 1,
0.06219235, -0.3150396, 3.240808, 0, 0.8156863, 1, 1,
0.06529716, -2.526769, 4.546626, 0, 0.8078431, 1, 1,
0.0656697, 1.482038, -0.009809586, 0, 0.8039216, 1, 1,
0.06886047, 0.065813, -0.5584894, 0, 0.7960784, 1, 1,
0.07248043, 0.5426731, -0.8514238, 0, 0.7882353, 1, 1,
0.07325583, -0.03858636, 3.872544, 0, 0.7843137, 1, 1,
0.07336086, 0.540669, -0.8315372, 0, 0.7764706, 1, 1,
0.07607656, -1.36059, 2.430375, 0, 0.772549, 1, 1,
0.07628324, -0.2141573, 3.999587, 0, 0.7647059, 1, 1,
0.08750127, 0.2566238, 0.9150423, 0, 0.7607843, 1, 1,
0.09235442, -1.185257, 4.544213, 0, 0.7529412, 1, 1,
0.09858014, -1.91142, 1.142216, 0, 0.7490196, 1, 1,
0.0986858, -0.9072363, 4.78067, 0, 0.7411765, 1, 1,
0.1025525, -0.4327002, 4.538347, 0, 0.7372549, 1, 1,
0.1045712, 0.2253275, 1.072096, 0, 0.7294118, 1, 1,
0.1074659, -0.6353348, 2.740298, 0, 0.7254902, 1, 1,
0.1112541, -1.791111, 2.758529, 0, 0.7176471, 1, 1,
0.1116914, 0.0212997, 1.357274, 0, 0.7137255, 1, 1,
0.1131008, 0.3154856, -0.7903457, 0, 0.7058824, 1, 1,
0.1163179, 0.1674216, 1.070667, 0, 0.6980392, 1, 1,
0.1202333, 0.2505346, 0.7714241, 0, 0.6941177, 1, 1,
0.1263988, 0.8036655, 0.4083067, 0, 0.6862745, 1, 1,
0.1264199, -2.356055, 3.583353, 0, 0.682353, 1, 1,
0.1289544, 1.107372, -0.08511357, 0, 0.6745098, 1, 1,
0.1370007, -0.5910527, 1.809634, 0, 0.6705883, 1, 1,
0.1380715, -1.330585, 4.073125, 0, 0.6627451, 1, 1,
0.1416376, 0.8263505, 0.1201419, 0, 0.6588235, 1, 1,
0.1520213, 0.6011192, -1.629834, 0, 0.6509804, 1, 1,
0.1611359, 1.601086, 0.2245966, 0, 0.6470588, 1, 1,
0.1625945, -0.1630893, 1.245046, 0, 0.6392157, 1, 1,
0.1669319, 0.4032193, 0.822087, 0, 0.6352941, 1, 1,
0.169532, 0.4860263, -0.5574899, 0, 0.627451, 1, 1,
0.1767584, -0.02649194, 2.693009, 0, 0.6235294, 1, 1,
0.1787929, 0.325325, 0.8914669, 0, 0.6156863, 1, 1,
0.1801367, 2.29731, 0.006127902, 0, 0.6117647, 1, 1,
0.1812491, -0.3747158, 3.93289, 0, 0.6039216, 1, 1,
0.1832351, -0.5170161, 3.13811, 0, 0.5960785, 1, 1,
0.1882875, 0.6527954, 2.105371, 0, 0.5921569, 1, 1,
0.1912593, -0.4637567, 2.280393, 0, 0.5843138, 1, 1,
0.1916805, 1.944754, 1.781475, 0, 0.5803922, 1, 1,
0.1939301, -0.2516642, 0.9278848, 0, 0.572549, 1, 1,
0.1991487, 1.483255, 0.9567504, 0, 0.5686275, 1, 1,
0.2000651, -0.7108091, 4.742959, 0, 0.5607843, 1, 1,
0.2009524, 0.1289727, 0.5736755, 0, 0.5568628, 1, 1,
0.2063959, 0.8814166, 0.1619884, 0, 0.5490196, 1, 1,
0.2068095, -0.3021616, 3.414807, 0, 0.5450981, 1, 1,
0.2132729, -0.00793557, 3.484018, 0, 0.5372549, 1, 1,
0.2182304, -0.1050464, 2.183884, 0, 0.5333334, 1, 1,
0.2222988, 1.506811, 0.04678421, 0, 0.5254902, 1, 1,
0.2255071, 0.6776388, 0.1665265, 0, 0.5215687, 1, 1,
0.2282056, 1.869408, 0.4063571, 0, 0.5137255, 1, 1,
0.2296696, 1.419834, 0.5576424, 0, 0.509804, 1, 1,
0.2312067, -0.3449389, 3.406355, 0, 0.5019608, 1, 1,
0.2339208, -0.3583764, 3.911368, 0, 0.4941176, 1, 1,
0.236508, 1.309886, -0.4177403, 0, 0.4901961, 1, 1,
0.2371469, 0.63906, -0.5825983, 0, 0.4823529, 1, 1,
0.2411489, 1.339926, 0.008402952, 0, 0.4784314, 1, 1,
0.2474836, -1.631263, 1.010718, 0, 0.4705882, 1, 1,
0.247743, -0.3442264, 1.554143, 0, 0.4666667, 1, 1,
0.2578394, -1.274197, 2.248464, 0, 0.4588235, 1, 1,
0.2596891, -0.9797227, 3.069697, 0, 0.454902, 1, 1,
0.2597039, 0.546265, -1.046629, 0, 0.4470588, 1, 1,
0.2600675, -0.3496988, 2.341011, 0, 0.4431373, 1, 1,
0.2610655, 0.1162769, 0.6350591, 0, 0.4352941, 1, 1,
0.2615047, -0.7866236, 2.580706, 0, 0.4313726, 1, 1,
0.2628675, 1.190062, 1.37402, 0, 0.4235294, 1, 1,
0.2718377, -0.5886804, 3.266087, 0, 0.4196078, 1, 1,
0.2729087, -0.4006915, 2.714517, 0, 0.4117647, 1, 1,
0.2740459, 1.029272, 0.2609112, 0, 0.4078431, 1, 1,
0.2774166, 0.4839399, -0.5279757, 0, 0.4, 1, 1,
0.278285, 1.765364, -0.1943809, 0, 0.3921569, 1, 1,
0.280772, -0.4828912, 3.012236, 0, 0.3882353, 1, 1,
0.2820185, -0.9310309, 3.194271, 0, 0.3803922, 1, 1,
0.2831676, 0.3790487, -0.6622598, 0, 0.3764706, 1, 1,
0.28444, -1.06819, 4.851574, 0, 0.3686275, 1, 1,
0.2869616, -0.07766052, 1.975804, 0, 0.3647059, 1, 1,
0.2889908, -0.1552085, 1.741608, 0, 0.3568628, 1, 1,
0.2973689, -0.5960473, 2.853788, 0, 0.3529412, 1, 1,
0.2979847, -0.3687495, 1.53189, 0, 0.345098, 1, 1,
0.2983578, -0.8348333, 1.535092, 0, 0.3411765, 1, 1,
0.2987049, -0.04627199, 2.78285, 0, 0.3333333, 1, 1,
0.3016061, 0.007061141, 3.24599, 0, 0.3294118, 1, 1,
0.3025995, -0.3574947, 2.761682, 0, 0.3215686, 1, 1,
0.3032449, -1.785804, 3.978756, 0, 0.3176471, 1, 1,
0.3040546, 0.455837, 0.5983562, 0, 0.3098039, 1, 1,
0.310156, 2.15112, 0.8547255, 0, 0.3058824, 1, 1,
0.3106099, 1.440584, -0.1752785, 0, 0.2980392, 1, 1,
0.3110604, -0.09162237, 1.476666, 0, 0.2901961, 1, 1,
0.3122406, 1.070109, 0.5553957, 0, 0.2862745, 1, 1,
0.3124803, -1.885448, 3.050659, 0, 0.2784314, 1, 1,
0.3167909, 0.140405, 2.331763, 0, 0.2745098, 1, 1,
0.3169077, -0.746965, 1.333923, 0, 0.2666667, 1, 1,
0.3375151, -1.214337, 3.384676, 0, 0.2627451, 1, 1,
0.3471592, 0.8299155, 1.80929, 0, 0.254902, 1, 1,
0.3519793, -0.05628071, 2.482836, 0, 0.2509804, 1, 1,
0.3536549, -2.228522, 2.918843, 0, 0.2431373, 1, 1,
0.3589826, -0.589941, 2.265201, 0, 0.2392157, 1, 1,
0.3617082, -0.9233616, 3.659363, 0, 0.2313726, 1, 1,
0.3638974, 0.1478504, 1.991275, 0, 0.227451, 1, 1,
0.3640314, -0.6809683, 2.810314, 0, 0.2196078, 1, 1,
0.3649589, -1.252836, 4.687982, 0, 0.2156863, 1, 1,
0.3652345, 1.092076, 0.7992436, 0, 0.2078431, 1, 1,
0.3652964, 0.05947132, 1.42799, 0, 0.2039216, 1, 1,
0.3706125, 2.198328, -1.022621, 0, 0.1960784, 1, 1,
0.3706476, -2.338046, 3.773684, 0, 0.1882353, 1, 1,
0.3710547, 1.349588, -0.03617056, 0, 0.1843137, 1, 1,
0.3719732, -0.3891319, 1.333905, 0, 0.1764706, 1, 1,
0.3733156, -0.1112972, 1.167795, 0, 0.172549, 1, 1,
0.3754001, -2.006477, 4.18372, 0, 0.1647059, 1, 1,
0.3755856, 0.190927, 0.8204818, 0, 0.1607843, 1, 1,
0.3788745, 0.5445104, 1.207565, 0, 0.1529412, 1, 1,
0.379544, 0.6684144, 0.2910314, 0, 0.1490196, 1, 1,
0.3817498, -0.5326729, 1.52384, 0, 0.1411765, 1, 1,
0.3909845, -0.7802178, 1.345052, 0, 0.1372549, 1, 1,
0.393207, -0.1679719, 1.145681, 0, 0.1294118, 1, 1,
0.3990755, -0.1998442, -0.5482507, 0, 0.1254902, 1, 1,
0.406378, 0.734617, 0.9807688, 0, 0.1176471, 1, 1,
0.4085442, -0.431881, 1.469719, 0, 0.1137255, 1, 1,
0.4136836, 0.8065094, -0.9594366, 0, 0.1058824, 1, 1,
0.4139247, 2.085509, -0.9474351, 0, 0.09803922, 1, 1,
0.4140273, -1.83772, 2.534717, 0, 0.09411765, 1, 1,
0.4166244, 0.6000752, 2.185952, 0, 0.08627451, 1, 1,
0.4198025, 1.233962, 0.3176673, 0, 0.08235294, 1, 1,
0.4201066, 0.9225865, 1.475528, 0, 0.07450981, 1, 1,
0.4239744, 0.9805705, 1.476192, 0, 0.07058824, 1, 1,
0.4257717, -0.4854526, 0.6860954, 0, 0.0627451, 1, 1,
0.4288702, -0.4687151, 3.565465, 0, 0.05882353, 1, 1,
0.4301911, 0.3570619, 2.725197, 0, 0.05098039, 1, 1,
0.4376378, -0.5007744, 1.474216, 0, 0.04705882, 1, 1,
0.4380787, -0.2629403, 1.93936, 0, 0.03921569, 1, 1,
0.4468368, 0.3936883, 0.03001818, 0, 0.03529412, 1, 1,
0.4472803, -1.586137, 3.833608, 0, 0.02745098, 1, 1,
0.4476563, 0.1777621, 1.887726, 0, 0.02352941, 1, 1,
0.449602, 0.5505163, 2.111227, 0, 0.01568628, 1, 1,
0.4542129, -1.515206, 4.066126, 0, 0.01176471, 1, 1,
0.454802, -1.309167, 1.749346, 0, 0.003921569, 1, 1,
0.4551803, -0.8227303, 1.639521, 0.003921569, 0, 1, 1,
0.4563005, -1.581619, 2.699931, 0.007843138, 0, 1, 1,
0.4564688, 0.8096194, 1.005568, 0.01568628, 0, 1, 1,
0.4590209, -0.04826387, 2.252651, 0.01960784, 0, 1, 1,
0.4634238, -0.3800289, 2.096827, 0.02745098, 0, 1, 1,
0.4644937, 0.9378856, -2.403564, 0.03137255, 0, 1, 1,
0.4660884, -0.5951347, 3.619534, 0.03921569, 0, 1, 1,
0.4671898, 0.4882212, 1.297398, 0.04313726, 0, 1, 1,
0.4728434, -1.672195, 2.924181, 0.05098039, 0, 1, 1,
0.4733919, 0.28221, 1.116109, 0.05490196, 0, 1, 1,
0.4741859, 0.08159647, 2.044367, 0.0627451, 0, 1, 1,
0.4817728, 0.6095422, 0.105508, 0.06666667, 0, 1, 1,
0.4821803, -0.7801509, 1.263896, 0.07450981, 0, 1, 1,
0.4861729, -0.5529688, 3.128041, 0.07843138, 0, 1, 1,
0.4903673, 0.3597158, -0.5870711, 0.08627451, 0, 1, 1,
0.491066, -0.2549498, 3.40589, 0.09019608, 0, 1, 1,
0.4971182, 1.474359, 1.071443, 0.09803922, 0, 1, 1,
0.4972006, -1.098535, 3.34937, 0.1058824, 0, 1, 1,
0.5040952, -0.8176156, 4.252498, 0.1098039, 0, 1, 1,
0.5112158, -1.511288, 2.919455, 0.1176471, 0, 1, 1,
0.5126281, -0.3678306, 3.950056, 0.1215686, 0, 1, 1,
0.5154511, -0.3538652, 2.008236, 0.1294118, 0, 1, 1,
0.5195987, -0.449423, 2.482598, 0.1333333, 0, 1, 1,
0.5201281, 1.177873, 1.766954, 0.1411765, 0, 1, 1,
0.5238296, -0.6986026, 1.748561, 0.145098, 0, 1, 1,
0.5254586, 0.2346115, 1.745251, 0.1529412, 0, 1, 1,
0.526798, -1.43541, 1.651277, 0.1568628, 0, 1, 1,
0.526805, -1.309794, 0.9273129, 0.1647059, 0, 1, 1,
0.5277365, 0.3111463, 0.8211648, 0.1686275, 0, 1, 1,
0.531082, -1.579017, 4.006351, 0.1764706, 0, 1, 1,
0.531242, 1.252302, 0.539225, 0.1803922, 0, 1, 1,
0.5313302, -0.4237005, 1.868951, 0.1882353, 0, 1, 1,
0.5329574, 1.590736, -1.176246, 0.1921569, 0, 1, 1,
0.5342242, 1.842109, -0.271357, 0.2, 0, 1, 1,
0.5353195, 1.014032, -1.885461, 0.2078431, 0, 1, 1,
0.5431626, 0.5740372, 1.54047, 0.2117647, 0, 1, 1,
0.5463262, -0.5710537, 3.27316, 0.2196078, 0, 1, 1,
0.5495969, -0.09716651, 3.08672, 0.2235294, 0, 1, 1,
0.5517096, -0.0634674, 1.059225, 0.2313726, 0, 1, 1,
0.5548485, 0.4684424, 1.829788, 0.2352941, 0, 1, 1,
0.5549042, 0.3354039, 0.6918781, 0.2431373, 0, 1, 1,
0.556971, 0.01352465, 2.510142, 0.2470588, 0, 1, 1,
0.5570063, 0.1356469, 1.07056, 0.254902, 0, 1, 1,
0.5640742, 0.2520189, 1.092216, 0.2588235, 0, 1, 1,
0.5644706, 1.277536, -1.316304, 0.2666667, 0, 1, 1,
0.5650728, -0.387752, 2.077747, 0.2705882, 0, 1, 1,
0.5661571, 0.9874486, 1.176748, 0.2784314, 0, 1, 1,
0.568651, 0.6120626, -0.1366377, 0.282353, 0, 1, 1,
0.5764192, 0.1056429, 1.974692, 0.2901961, 0, 1, 1,
0.5774686, 0.1126184, 3.215352, 0.2941177, 0, 1, 1,
0.578037, 0.4075264, 1.191221, 0.3019608, 0, 1, 1,
0.5804361, -1.145838, 3.02572, 0.3098039, 0, 1, 1,
0.5804443, 1.067194, 1.830008, 0.3137255, 0, 1, 1,
0.5811647, 1.319339, 0.9549647, 0.3215686, 0, 1, 1,
0.5812251, 1.279992, -0.03618346, 0.3254902, 0, 1, 1,
0.5910796, -0.8805074, 3.109961, 0.3333333, 0, 1, 1,
0.5925879, -0.9289814, 0.7833732, 0.3372549, 0, 1, 1,
0.5932977, 1.032258, 0.2578542, 0.345098, 0, 1, 1,
0.5951418, 0.3092594, 2.591335, 0.3490196, 0, 1, 1,
0.5960866, 0.6104037, 1.548811, 0.3568628, 0, 1, 1,
0.598403, -0.9653065, 1.591235, 0.3607843, 0, 1, 1,
0.5995833, -1.06106, 3.341269, 0.3686275, 0, 1, 1,
0.6023721, 0.6719946, -0.1920733, 0.372549, 0, 1, 1,
0.6031598, 1.325275, 2.108555, 0.3803922, 0, 1, 1,
0.6043221, 1.973493, -0.3992242, 0.3843137, 0, 1, 1,
0.6078166, 1.503659, 1.795909, 0.3921569, 0, 1, 1,
0.6182922, -0.01202184, 0.9909723, 0.3960784, 0, 1, 1,
0.6183087, 0.6132193, 0.09775224, 0.4039216, 0, 1, 1,
0.6218209, 0.4015216, -0.1271918, 0.4117647, 0, 1, 1,
0.623363, 0.1775842, 1.537124, 0.4156863, 0, 1, 1,
0.6277232, -0.4269271, 1.513873, 0.4235294, 0, 1, 1,
0.62914, 1.60684, -0.01803566, 0.427451, 0, 1, 1,
0.6312827, 0.3019611, 1.527257, 0.4352941, 0, 1, 1,
0.6337286, -0.5965186, 1.832237, 0.4392157, 0, 1, 1,
0.6338848, -1.565407, 4.955713, 0.4470588, 0, 1, 1,
0.6347838, -0.3774872, 1.062854, 0.4509804, 0, 1, 1,
0.6390142, 0.3119676, 0.7505252, 0.4588235, 0, 1, 1,
0.6418912, 0.77553, 1.247389, 0.4627451, 0, 1, 1,
0.6447054, 1.199257, 0.5179261, 0.4705882, 0, 1, 1,
0.6454017, 0.1756186, 1.866233, 0.4745098, 0, 1, 1,
0.646946, 0.8601023, 1.432826, 0.4823529, 0, 1, 1,
0.6496568, -0.6648721, 4.729682, 0.4862745, 0, 1, 1,
0.6725349, 0.09405667, 1.706616, 0.4941176, 0, 1, 1,
0.6742827, 1.131836, 0.958385, 0.5019608, 0, 1, 1,
0.6748271, -0.5793631, 3.030779, 0.5058824, 0, 1, 1,
0.6790674, -1.030293, 2.578681, 0.5137255, 0, 1, 1,
0.6907225, 0.06981667, 0.4256721, 0.5176471, 0, 1, 1,
0.6911436, 0.08612244, 2.832951, 0.5254902, 0, 1, 1,
0.6941845, 1.52202, 1.117594, 0.5294118, 0, 1, 1,
0.6979437, -0.5840251, 1.139891, 0.5372549, 0, 1, 1,
0.7029743, 0.2813272, -0.9874439, 0.5411765, 0, 1, 1,
0.7032934, 1.018131, -0.2018594, 0.5490196, 0, 1, 1,
0.7091924, -0.9110411, 2.877841, 0.5529412, 0, 1, 1,
0.7140949, 0.6544521, 3.231124, 0.5607843, 0, 1, 1,
0.7149521, 0.7088437, 0.2275667, 0.5647059, 0, 1, 1,
0.7179596, 0.1430346, 1.275368, 0.572549, 0, 1, 1,
0.7187539, -0.1594078, 2.98474, 0.5764706, 0, 1, 1,
0.7194473, -0.3867875, 0.957313, 0.5843138, 0, 1, 1,
0.7195573, 0.5505263, 0.6868174, 0.5882353, 0, 1, 1,
0.7267177, 1.4685, 0.6038269, 0.5960785, 0, 1, 1,
0.7275978, 0.9113297, 1.075993, 0.6039216, 0, 1, 1,
0.7316085, -0.2063178, 1.480234, 0.6078432, 0, 1, 1,
0.7359056, 0.8500563, -0.4220777, 0.6156863, 0, 1, 1,
0.7408799, 0.5256828, 1.782055, 0.6196079, 0, 1, 1,
0.7471289, -0.1049376, 0.355048, 0.627451, 0, 1, 1,
0.7480596, -1.446364, 5.008517, 0.6313726, 0, 1, 1,
0.7498661, 1.600013, 0.4538562, 0.6392157, 0, 1, 1,
0.7551889, 0.6538926, 0.9220048, 0.6431373, 0, 1, 1,
0.7646619, -1.725124, 3.109213, 0.6509804, 0, 1, 1,
0.7657516, -1.791265, 1.500416, 0.654902, 0, 1, 1,
0.7667136, 0.7557555, 2.687955, 0.6627451, 0, 1, 1,
0.7696013, 0.6684635, 0.6231119, 0.6666667, 0, 1, 1,
0.7872002, 0.3117358, 2.166806, 0.6745098, 0, 1, 1,
0.7880754, -0.226692, 0.6992684, 0.6784314, 0, 1, 1,
0.7924438, -1.224462, 3.474445, 0.6862745, 0, 1, 1,
0.7929168, -1.794898, 1.956264, 0.6901961, 0, 1, 1,
0.7942443, 0.3964855, 1.596197, 0.6980392, 0, 1, 1,
0.7963821, 2.033497, 1.465389, 0.7058824, 0, 1, 1,
0.7976964, -0.4561389, 0.7997731, 0.7098039, 0, 1, 1,
0.8046783, -0.2570158, 1.792403, 0.7176471, 0, 1, 1,
0.8061467, -1.480449, 3.700297, 0.7215686, 0, 1, 1,
0.8069208, 0.2155211, 2.028517, 0.7294118, 0, 1, 1,
0.810217, -0.8867002, 3.599501, 0.7333333, 0, 1, 1,
0.8144091, 0.2527323, 2.976333, 0.7411765, 0, 1, 1,
0.8155051, 0.1921176, -0.2382465, 0.7450981, 0, 1, 1,
0.8184577, 0.4031337, 0.7900703, 0.7529412, 0, 1, 1,
0.8210491, 0.6916505, 0.2464171, 0.7568628, 0, 1, 1,
0.8226269, -0.4856203, 1.729473, 0.7647059, 0, 1, 1,
0.8234329, -0.3954594, 1.069867, 0.7686275, 0, 1, 1,
0.8259615, 2.559277, 1.19842, 0.7764706, 0, 1, 1,
0.8291103, -0.4895193, 3.205725, 0.7803922, 0, 1, 1,
0.8307979, -0.7807159, 3.212675, 0.7882353, 0, 1, 1,
0.8317043, 0.6783885, 1.083402, 0.7921569, 0, 1, 1,
0.8323526, 0.9951137, 0.1476245, 0.8, 0, 1, 1,
0.8335275, 0.2878034, 2.701505, 0.8078431, 0, 1, 1,
0.8354666, -1.039243, 3.503247, 0.8117647, 0, 1, 1,
0.8364932, 0.3459744, 0.9991157, 0.8196079, 0, 1, 1,
0.8394713, 0.9440148, 0.9120029, 0.8235294, 0, 1, 1,
0.8432545, -0.7523878, 1.161873, 0.8313726, 0, 1, 1,
0.8463969, 0.4138013, 0.2623388, 0.8352941, 0, 1, 1,
0.8503745, -0.7382714, 3.93124, 0.8431373, 0, 1, 1,
0.8504345, -1.410989, 2.210709, 0.8470588, 0, 1, 1,
0.8525507, -1.049168, 1.698332, 0.854902, 0, 1, 1,
0.8621341, 0.3694757, 1.808154, 0.8588235, 0, 1, 1,
0.8640574, 0.05008902, 1.435825, 0.8666667, 0, 1, 1,
0.8703935, 0.4257472, 0.4434944, 0.8705882, 0, 1, 1,
0.8706812, 1.557848, 0.5055552, 0.8784314, 0, 1, 1,
0.8797475, -1.617733, 3.033827, 0.8823529, 0, 1, 1,
0.8867649, -0.2270487, 0.5780794, 0.8901961, 0, 1, 1,
0.8898118, -1.134949, 3.345521, 0.8941177, 0, 1, 1,
0.8919023, 1.105757, 0.2937302, 0.9019608, 0, 1, 1,
0.8921121, -0.5675437, 0.9528592, 0.9098039, 0, 1, 1,
0.8927344, -0.6887387, 0.5993519, 0.9137255, 0, 1, 1,
0.892853, -1.875042, 2.363379, 0.9215686, 0, 1, 1,
0.8976391, 1.161374, 1.347342, 0.9254902, 0, 1, 1,
0.899905, -0.4185618, 2.370627, 0.9333333, 0, 1, 1,
0.9016947, -0.4145375, 1.178104, 0.9372549, 0, 1, 1,
0.9023585, 0.1990373, 0.01333224, 0.945098, 0, 1, 1,
0.9031533, 2.014058, 0.9179059, 0.9490196, 0, 1, 1,
0.9055814, 0.2159323, 0.7269479, 0.9568627, 0, 1, 1,
0.9203544, -1.377853, 2.114423, 0.9607843, 0, 1, 1,
0.9314167, -0.6987006, 0.9182587, 0.9686275, 0, 1, 1,
0.9331929, -1.582143, 3.026791, 0.972549, 0, 1, 1,
0.9400863, -0.1080527, 1.416985, 0.9803922, 0, 1, 1,
0.9523813, -0.7809246, 1.234709, 0.9843137, 0, 1, 1,
0.9600157, 1.042369, 1.192143, 0.9921569, 0, 1, 1,
0.9626139, -0.9636452, 1.160519, 0.9960784, 0, 1, 1,
0.9683538, -0.1705271, 2.540331, 1, 0, 0.9960784, 1,
0.9749584, -1.159559, 2.233684, 1, 0, 0.9882353, 1,
0.9762056, 0.7647578, -1.74333, 1, 0, 0.9843137, 1,
0.9772033, 1.506803, 1.044187, 1, 0, 0.9764706, 1,
0.9794529, -2.21342, 3.599852, 1, 0, 0.972549, 1,
0.981604, -0.4604734, 1.408408, 1, 0, 0.9647059, 1,
0.9856982, -1.008091, 3.693859, 1, 0, 0.9607843, 1,
0.9916052, 1.792521, 2.813215, 1, 0, 0.9529412, 1,
0.9918286, 0.2932913, 0.1905575, 1, 0, 0.9490196, 1,
0.9942412, -0.288431, 3.983962, 1, 0, 0.9411765, 1,
0.9964045, -2.112949, 1.473455, 1, 0, 0.9372549, 1,
0.9972795, 0.2714314, 1.68568, 1, 0, 0.9294118, 1,
0.9997879, 0.3760715, 1.351363, 1, 0, 0.9254902, 1,
1.001048, 0.8378327, 0.136271, 1, 0, 0.9176471, 1,
1.00178, 0.01166346, 2.528037, 1, 0, 0.9137255, 1,
1.003089, -0.2416783, 2.131504, 1, 0, 0.9058824, 1,
1.00763, 1.37453, 0.9020081, 1, 0, 0.9019608, 1,
1.015671, 0.8985087, 1.966991, 1, 0, 0.8941177, 1,
1.021375, -1.06312, 0.8148001, 1, 0, 0.8862745, 1,
1.025768, -0.5649077, 2.308066, 1, 0, 0.8823529, 1,
1.028657, 1.192168, 1.758386, 1, 0, 0.8745098, 1,
1.049931, 0.5097617, 1.884104, 1, 0, 0.8705882, 1,
1.050991, 0.6762231, 1.830613, 1, 0, 0.8627451, 1,
1.070019, 0.03547337, 2.116933, 1, 0, 0.8588235, 1,
1.078495, 0.8556811, 1.378633, 1, 0, 0.8509804, 1,
1.082186, -0.8000268, 2.696407, 1, 0, 0.8470588, 1,
1.085617, -0.2278135, 2.403052, 1, 0, 0.8392157, 1,
1.090051, -0.8370498, 3.222598, 1, 0, 0.8352941, 1,
1.091163, 1.159471, 1.425001, 1, 0, 0.827451, 1,
1.09271, -1.714719, 3.186112, 1, 0, 0.8235294, 1,
1.095279, 1.777723, -0.534497, 1, 0, 0.8156863, 1,
1.099382, -0.4749275, 2.178826, 1, 0, 0.8117647, 1,
1.108035, 1.038488, 0.4939148, 1, 0, 0.8039216, 1,
1.109392, 0.007625549, 0.5032337, 1, 0, 0.7960784, 1,
1.115071, -0.2958573, 1.486777, 1, 0, 0.7921569, 1,
1.118977, 1.158998, 0.8534961, 1, 0, 0.7843137, 1,
1.122276, 0.6236408, 1.449514, 1, 0, 0.7803922, 1,
1.128933, -0.976864, 1.668312, 1, 0, 0.772549, 1,
1.130124, 0.2773751, 1.426841, 1, 0, 0.7686275, 1,
1.131518, 0.1509906, 1.867779, 1, 0, 0.7607843, 1,
1.134684, -0.5505834, 2.584143, 1, 0, 0.7568628, 1,
1.134959, 0.1131874, 4.138483, 1, 0, 0.7490196, 1,
1.135424, -1.850539, 1.082074, 1, 0, 0.7450981, 1,
1.144012, 0.8309837, 0.855027, 1, 0, 0.7372549, 1,
1.14839, 0.3682806, 0.7564186, 1, 0, 0.7333333, 1,
1.149509, 0.6950139, 0.2074492, 1, 0, 0.7254902, 1,
1.149871, 0.6866024, 1.816825, 1, 0, 0.7215686, 1,
1.151821, -0.5894808, 2.745228, 1, 0, 0.7137255, 1,
1.155787, -0.504775, 1.407313, 1, 0, 0.7098039, 1,
1.156606, -1.451639, 5.042182, 1, 0, 0.7019608, 1,
1.16356, 1.103948, -1.445075, 1, 0, 0.6941177, 1,
1.16374, -0.574176, 1.473405, 1, 0, 0.6901961, 1,
1.171408, -0.8495274, 2.529304, 1, 0, 0.682353, 1,
1.174999, -0.5105963, 2.022029, 1, 0, 0.6784314, 1,
1.176476, -0.9319398, 1.447591, 1, 0, 0.6705883, 1,
1.178476, 1.71334, 0.9042686, 1, 0, 0.6666667, 1,
1.180132, -0.536226, 1.847464, 1, 0, 0.6588235, 1,
1.188826, -0.1241353, 2.822229, 1, 0, 0.654902, 1,
1.19098, 0.392478, 2.331091, 1, 0, 0.6470588, 1,
1.191192, -1.190513, 1.559239, 1, 0, 0.6431373, 1,
1.194001, 1.569815, -0.3375787, 1, 0, 0.6352941, 1,
1.202402, 0.5548193, 0.7469388, 1, 0, 0.6313726, 1,
1.202556, -0.5922586, 2.035318, 1, 0, 0.6235294, 1,
1.202866, -0.3841493, 0.1167691, 1, 0, 0.6196079, 1,
1.20317, 0.2040292, 3.758061, 1, 0, 0.6117647, 1,
1.207466, -0.6755489, 3.230576, 1, 0, 0.6078432, 1,
1.218625, -0.03399968, 2.276949, 1, 0, 0.6, 1,
1.234072, -1.087678, 2.751253, 1, 0, 0.5921569, 1,
1.236671, -0.2733082, 1.380142, 1, 0, 0.5882353, 1,
1.243632, -0.2119503, 3.527416, 1, 0, 0.5803922, 1,
1.250733, 0.3342476, 0.2714797, 1, 0, 0.5764706, 1,
1.259939, 0.4392901, 2.19511, 1, 0, 0.5686275, 1,
1.267333, -0.4260758, 0.7005004, 1, 0, 0.5647059, 1,
1.269061, 0.2759513, 1.061891, 1, 0, 0.5568628, 1,
1.28163, -0.1837612, 2.017929, 1, 0, 0.5529412, 1,
1.284738, 0.9439616, 0.03703983, 1, 0, 0.5450981, 1,
1.297169, 1.601492, 0.2740818, 1, 0, 0.5411765, 1,
1.303417, -1.150317, 1.728971, 1, 0, 0.5333334, 1,
1.303762, 1.54626, 1.439036, 1, 0, 0.5294118, 1,
1.326015, -1.510102, 0.5540759, 1, 0, 0.5215687, 1,
1.330204, -1.004494, 2.142856, 1, 0, 0.5176471, 1,
1.339892, -0.4068748, 2.091493, 1, 0, 0.509804, 1,
1.34139, 0.1070319, 1.441703, 1, 0, 0.5058824, 1,
1.368924, 0.2219717, 2.664891, 1, 0, 0.4980392, 1,
1.375884, -0.6962351, 1.735175, 1, 0, 0.4901961, 1,
1.381294, -1.021858, 2.483636, 1, 0, 0.4862745, 1,
1.382514, -1.635789, 1.241088, 1, 0, 0.4784314, 1,
1.386289, 1.424577, 1.521785, 1, 0, 0.4745098, 1,
1.387245, -0.6215339, 2.225832, 1, 0, 0.4666667, 1,
1.387278, 0.2721345, 0.81844, 1, 0, 0.4627451, 1,
1.389752, -0.2106762, 1.174139, 1, 0, 0.454902, 1,
1.391115, 0.8570761, -0.2880335, 1, 0, 0.4509804, 1,
1.394529, 1.540209, 1.010807, 1, 0, 0.4431373, 1,
1.398285, 1.877076, -0.1899056, 1, 0, 0.4392157, 1,
1.412518, 0.05149715, 1.012604, 1, 0, 0.4313726, 1,
1.414763, -1.648702, 2.399211, 1, 0, 0.427451, 1,
1.41735, 0.6551882, -0.5726618, 1, 0, 0.4196078, 1,
1.42974, -1.463215, 1.945566, 1, 0, 0.4156863, 1,
1.433715, -0.3617311, 0.2967259, 1, 0, 0.4078431, 1,
1.43622, 0.8058155, 1.251436, 1, 0, 0.4039216, 1,
1.436991, -0.5631943, 1.955844, 1, 0, 0.3960784, 1,
1.452867, -1.905027, 2.821743, 1, 0, 0.3882353, 1,
1.478142, -0.3597078, 3.59369, 1, 0, 0.3843137, 1,
1.48368, 1.02538, 1.462185, 1, 0, 0.3764706, 1,
1.484369, -0.3683212, 2.700482, 1, 0, 0.372549, 1,
1.48974, 1.417616, 2.754652, 1, 0, 0.3647059, 1,
1.493167, -0.9253826, 3.147093, 1, 0, 0.3607843, 1,
1.508683, -0.3620949, 0.8401881, 1, 0, 0.3529412, 1,
1.509562, -0.1146251, 2.179235, 1, 0, 0.3490196, 1,
1.512165, 0.1475161, 0.579429, 1, 0, 0.3411765, 1,
1.524617, 0.06508244, 2.614742, 1, 0, 0.3372549, 1,
1.526052, -1.0317, 2.344852, 1, 0, 0.3294118, 1,
1.534793, -2.730424, 0.7401699, 1, 0, 0.3254902, 1,
1.53959, 0.590652, 1.460083, 1, 0, 0.3176471, 1,
1.556361, -1.233691, 2.304827, 1, 0, 0.3137255, 1,
1.562615, -1.039328, 3.985628, 1, 0, 0.3058824, 1,
1.585259, -1.803867, 2.040988, 1, 0, 0.2980392, 1,
1.585663, 0.04754419, 1.806451, 1, 0, 0.2941177, 1,
1.599866, -0.2261234, 1.316124, 1, 0, 0.2862745, 1,
1.600204, 0.4759586, 1.22126, 1, 0, 0.282353, 1,
1.601979, -0.4217083, 2.61388, 1, 0, 0.2745098, 1,
1.62816, -1.121499, 2.304851, 1, 0, 0.2705882, 1,
1.63901, -0.7733123, 2.180872, 1, 0, 0.2627451, 1,
1.644987, 0.7387473, 2.369623, 1, 0, 0.2588235, 1,
1.650675, -0.2979417, 0.2138893, 1, 0, 0.2509804, 1,
1.654698, -0.484613, 2.561476, 1, 0, 0.2470588, 1,
1.654749, -1.010285, 3.038808, 1, 0, 0.2392157, 1,
1.661194, 0.3228937, 0.8449218, 1, 0, 0.2352941, 1,
1.668058, -0.2092656, 0.2980348, 1, 0, 0.227451, 1,
1.671784, -1.944432, 0.9281243, 1, 0, 0.2235294, 1,
1.672042, 0.6677985, 3.181769, 1, 0, 0.2156863, 1,
1.696177, 0.7435578, 1.625645, 1, 0, 0.2117647, 1,
1.701063, -0.6949171, 1.61321, 1, 0, 0.2039216, 1,
1.743309, -0.7832025, 3.164715, 1, 0, 0.1960784, 1,
1.777714, -0.4262938, 2.646571, 1, 0, 0.1921569, 1,
1.798454, 0.4706653, 1.999012, 1, 0, 0.1843137, 1,
1.807956, 0.3699772, 3.010848, 1, 0, 0.1803922, 1,
1.851448, -1.232116, 2.768542, 1, 0, 0.172549, 1,
1.875805, 0.3703628, 0.9006238, 1, 0, 0.1686275, 1,
1.882333, 0.01103444, 1.642344, 1, 0, 0.1607843, 1,
1.893703, -0.3289381, 0.0872078, 1, 0, 0.1568628, 1,
1.910672, -0.4574955, 2.740821, 1, 0, 0.1490196, 1,
1.971403, -1.147052, 2.240407, 1, 0, 0.145098, 1,
1.987713, -0.09051569, 1.348402, 1, 0, 0.1372549, 1,
2.026506, 0.1157104, 0.9114934, 1, 0, 0.1333333, 1,
2.03505, -0.9962453, 1.869642, 1, 0, 0.1254902, 1,
2.066674, -0.5858709, 2.68693, 1, 0, 0.1215686, 1,
2.072623, 0.8506284, 2.340663, 1, 0, 0.1137255, 1,
2.179808, 0.3644103, 2.671858, 1, 0, 0.1098039, 1,
2.188586, 0.7054873, 1.479481, 1, 0, 0.1019608, 1,
2.214759, 0.2202989, 1.211916, 1, 0, 0.09411765, 1,
2.246872, 1.127901, -0.1012281, 1, 0, 0.09019608, 1,
2.258771, 0.3844373, 0.7306786, 1, 0, 0.08235294, 1,
2.286487, 1.743563, -0.9660592, 1, 0, 0.07843138, 1,
2.452238, -2.492992, 2.511704, 1, 0, 0.07058824, 1,
2.485529, 0.04723507, 1.646834, 1, 0, 0.06666667, 1,
2.564189, 0.8979177, -0.7240454, 1, 0, 0.05882353, 1,
2.643645, 0.2143063, 1.999342, 1, 0, 0.05490196, 1,
2.650243, -0.3700088, 0.3287887, 1, 0, 0.04705882, 1,
2.676325, -0.8449578, 1.774119, 1, 0, 0.04313726, 1,
2.921306, 0.1834065, 2.244491, 1, 0, 0.03529412, 1,
3.028165, -0.2024545, 0.5862721, 1, 0, 0.03137255, 1,
3.072756, 0.5433289, 1.416329, 1, 0, 0.02352941, 1,
3.170628, -0.05961336, 0.6489355, 1, 0, 0.01960784, 1,
3.245051, -0.07598552, 0.2789088, 1, 0, 0.01176471, 1,
3.671581, 1.545421, 1.174834, 1, 0, 0.007843138, 1
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
0.2010195, -3.627028, -8.20796, 0, -0.5, 0.5, 0.5,
0.2010195, -3.627028, -8.20796, 1, -0.5, 0.5, 0.5,
0.2010195, -3.627028, -8.20796, 1, 1.5, 0.5, 0.5,
0.2010195, -3.627028, -8.20796, 0, 1.5, 0.5, 0.5
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
-4.446062, -0.08557343, -8.20796, 0, -0.5, 0.5, 0.5,
-4.446062, -0.08557343, -8.20796, 1, -0.5, 0.5, 0.5,
-4.446062, -0.08557343, -8.20796, 1, 1.5, 0.5, 0.5,
-4.446062, -0.08557343, -8.20796, 0, 1.5, 0.5, 0.5
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
-4.446062, -3.627028, -0.5560997, 0, -0.5, 0.5, 0.5,
-4.446062, -3.627028, -0.5560997, 1, -0.5, 0.5, 0.5,
-4.446062, -3.627028, -0.5560997, 1, 1.5, 0.5, 0.5,
-4.446062, -3.627028, -0.5560997, 0, 1.5, 0.5, 0.5
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
-3, -2.809769, -6.442146,
3, -2.809769, -6.442146,
-3, -2.809769, -6.442146,
-3, -2.945979, -6.736449,
-2, -2.809769, -6.442146,
-2, -2.945979, -6.736449,
-1, -2.809769, -6.442146,
-1, -2.945979, -6.736449,
0, -2.809769, -6.442146,
0, -2.945979, -6.736449,
1, -2.809769, -6.442146,
1, -2.945979, -6.736449,
2, -2.809769, -6.442146,
2, -2.945979, -6.736449,
3, -2.809769, -6.442146,
3, -2.945979, -6.736449
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
-3, -3.218399, -7.325053, 0, -0.5, 0.5, 0.5,
-3, -3.218399, -7.325053, 1, -0.5, 0.5, 0.5,
-3, -3.218399, -7.325053, 1, 1.5, 0.5, 0.5,
-3, -3.218399, -7.325053, 0, 1.5, 0.5, 0.5,
-2, -3.218399, -7.325053, 0, -0.5, 0.5, 0.5,
-2, -3.218399, -7.325053, 1, -0.5, 0.5, 0.5,
-2, -3.218399, -7.325053, 1, 1.5, 0.5, 0.5,
-2, -3.218399, -7.325053, 0, 1.5, 0.5, 0.5,
-1, -3.218399, -7.325053, 0, -0.5, 0.5, 0.5,
-1, -3.218399, -7.325053, 1, -0.5, 0.5, 0.5,
-1, -3.218399, -7.325053, 1, 1.5, 0.5, 0.5,
-1, -3.218399, -7.325053, 0, 1.5, 0.5, 0.5,
0, -3.218399, -7.325053, 0, -0.5, 0.5, 0.5,
0, -3.218399, -7.325053, 1, -0.5, 0.5, 0.5,
0, -3.218399, -7.325053, 1, 1.5, 0.5, 0.5,
0, -3.218399, -7.325053, 0, 1.5, 0.5, 0.5,
1, -3.218399, -7.325053, 0, -0.5, 0.5, 0.5,
1, -3.218399, -7.325053, 1, -0.5, 0.5, 0.5,
1, -3.218399, -7.325053, 1, 1.5, 0.5, 0.5,
1, -3.218399, -7.325053, 0, 1.5, 0.5, 0.5,
2, -3.218399, -7.325053, 0, -0.5, 0.5, 0.5,
2, -3.218399, -7.325053, 1, -0.5, 0.5, 0.5,
2, -3.218399, -7.325053, 1, 1.5, 0.5, 0.5,
2, -3.218399, -7.325053, 0, 1.5, 0.5, 0.5,
3, -3.218399, -7.325053, 0, -0.5, 0.5, 0.5,
3, -3.218399, -7.325053, 1, -0.5, 0.5, 0.5,
3, -3.218399, -7.325053, 1, 1.5, 0.5, 0.5,
3, -3.218399, -7.325053, 0, 1.5, 0.5, 0.5
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
-3.373658, -2, -6.442146,
-3.373658, 2, -6.442146,
-3.373658, -2, -6.442146,
-3.552392, -2, -6.736449,
-3.373658, -1, -6.442146,
-3.552392, -1, -6.736449,
-3.373658, 0, -6.442146,
-3.552392, 0, -6.736449,
-3.373658, 1, -6.442146,
-3.552392, 1, -6.736449,
-3.373658, 2, -6.442146,
-3.552392, 2, -6.736449
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
-3.90986, -2, -7.325053, 0, -0.5, 0.5, 0.5,
-3.90986, -2, -7.325053, 1, -0.5, 0.5, 0.5,
-3.90986, -2, -7.325053, 1, 1.5, 0.5, 0.5,
-3.90986, -2, -7.325053, 0, 1.5, 0.5, 0.5,
-3.90986, -1, -7.325053, 0, -0.5, 0.5, 0.5,
-3.90986, -1, -7.325053, 1, -0.5, 0.5, 0.5,
-3.90986, -1, -7.325053, 1, 1.5, 0.5, 0.5,
-3.90986, -1, -7.325053, 0, 1.5, 0.5, 0.5,
-3.90986, 0, -7.325053, 0, -0.5, 0.5, 0.5,
-3.90986, 0, -7.325053, 1, -0.5, 0.5, 0.5,
-3.90986, 0, -7.325053, 1, 1.5, 0.5, 0.5,
-3.90986, 0, -7.325053, 0, 1.5, 0.5, 0.5,
-3.90986, 1, -7.325053, 0, -0.5, 0.5, 0.5,
-3.90986, 1, -7.325053, 1, -0.5, 0.5, 0.5,
-3.90986, 1, -7.325053, 1, 1.5, 0.5, 0.5,
-3.90986, 1, -7.325053, 0, 1.5, 0.5, 0.5,
-3.90986, 2, -7.325053, 0, -0.5, 0.5, 0.5,
-3.90986, 2, -7.325053, 1, -0.5, 0.5, 0.5,
-3.90986, 2, -7.325053, 1, 1.5, 0.5, 0.5,
-3.90986, 2, -7.325053, 0, 1.5, 0.5, 0.5
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
-3.373658, -2.809769, -6,
-3.373658, -2.809769, 4,
-3.373658, -2.809769, -6,
-3.552392, -2.945979, -6,
-3.373658, -2.809769, -4,
-3.552392, -2.945979, -4,
-3.373658, -2.809769, -2,
-3.552392, -2.945979, -2,
-3.373658, -2.809769, 0,
-3.552392, -2.945979, 0,
-3.373658, -2.809769, 2,
-3.552392, -2.945979, 2,
-3.373658, -2.809769, 4,
-3.552392, -2.945979, 4
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
-3.90986, -3.218399, -6, 0, -0.5, 0.5, 0.5,
-3.90986, -3.218399, -6, 1, -0.5, 0.5, 0.5,
-3.90986, -3.218399, -6, 1, 1.5, 0.5, 0.5,
-3.90986, -3.218399, -6, 0, 1.5, 0.5, 0.5,
-3.90986, -3.218399, -4, 0, -0.5, 0.5, 0.5,
-3.90986, -3.218399, -4, 1, -0.5, 0.5, 0.5,
-3.90986, -3.218399, -4, 1, 1.5, 0.5, 0.5,
-3.90986, -3.218399, -4, 0, 1.5, 0.5, 0.5,
-3.90986, -3.218399, -2, 0, -0.5, 0.5, 0.5,
-3.90986, -3.218399, -2, 1, -0.5, 0.5, 0.5,
-3.90986, -3.218399, -2, 1, 1.5, 0.5, 0.5,
-3.90986, -3.218399, -2, 0, 1.5, 0.5, 0.5,
-3.90986, -3.218399, 0, 0, -0.5, 0.5, 0.5,
-3.90986, -3.218399, 0, 1, -0.5, 0.5, 0.5,
-3.90986, -3.218399, 0, 1, 1.5, 0.5, 0.5,
-3.90986, -3.218399, 0, 0, 1.5, 0.5, 0.5,
-3.90986, -3.218399, 2, 0, -0.5, 0.5, 0.5,
-3.90986, -3.218399, 2, 1, -0.5, 0.5, 0.5,
-3.90986, -3.218399, 2, 1, 1.5, 0.5, 0.5,
-3.90986, -3.218399, 2, 0, 1.5, 0.5, 0.5,
-3.90986, -3.218399, 4, 0, -0.5, 0.5, 0.5,
-3.90986, -3.218399, 4, 1, -0.5, 0.5, 0.5,
-3.90986, -3.218399, 4, 1, 1.5, 0.5, 0.5,
-3.90986, -3.218399, 4, 0, 1.5, 0.5, 0.5
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
-3.373658, -2.809769, -6.442146,
-3.373658, 2.638622, -6.442146,
-3.373658, -2.809769, 5.329947,
-3.373658, 2.638622, 5.329947,
-3.373658, -2.809769, -6.442146,
-3.373658, -2.809769, 5.329947,
-3.373658, 2.638622, -6.442146,
-3.373658, 2.638622, 5.329947,
-3.373658, -2.809769, -6.442146,
3.775697, -2.809769, -6.442146,
-3.373658, -2.809769, 5.329947,
3.775697, -2.809769, 5.329947,
-3.373658, 2.638622, -6.442146,
3.775697, 2.638622, -6.442146,
-3.373658, 2.638622, 5.329947,
3.775697, 2.638622, 5.329947,
3.775697, -2.809769, -6.442146,
3.775697, 2.638622, -6.442146,
3.775697, -2.809769, 5.329947,
3.775697, 2.638622, 5.329947,
3.775697, -2.809769, -6.442146,
3.775697, -2.809769, 5.329947,
3.775697, 2.638622, -6.442146,
3.775697, 2.638622, 5.329947
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
var radius = 7.909052;
var distance = 35.18827;
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
mvMatrix.translate( -0.2010195, 0.08557343, 0.5560997 );
mvMatrix.scale( 1.196111, 1.569531, 0.7264147 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.18827);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
cafenstrole<-read.table("cafenstrole.xyz")
```

```
## Error in read.table("cafenstrole.xyz"): no lines available in input
```

```r
x<-cafenstrole$V2
```

```
## Error in eval(expr, envir, enclos): object 'cafenstrole' not found
```

```r
y<-cafenstrole$V3
```

```
## Error in eval(expr, envir, enclos): object 'cafenstrole' not found
```

```r
z<-cafenstrole$V4
```

```
## Error in eval(expr, envir, enclos): object 'cafenstrole' not found
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
-3.269542, 0.05235694, -3.085515, 0, 0, 1, 1, 1,
-2.809033, 1.3596, -0.08392624, 1, 0, 0, 1, 1,
-2.751981, 1.034148, -0.5209327, 1, 0, 0, 1, 1,
-2.449692, 0.2756546, -1.169404, 1, 0, 0, 1, 1,
-2.384783, -1.118409, -3.020739, 1, 0, 0, 1, 1,
-2.306204, -0.3645632, -1.255779, 1, 0, 0, 1, 1,
-2.225082, -0.115179, -1.469158, 0, 0, 0, 1, 1,
-2.206318, -1.092335, 0.5146847, 0, 0, 0, 1, 1,
-2.186809, 0.4516516, -1.271578, 0, 0, 0, 1, 1,
-2.143991, 0.396614, -1.96804, 0, 0, 0, 1, 1,
-2.136482, -1.039592, -2.260234, 0, 0, 0, 1, 1,
-2.130288, -1.177806, -1.61117, 0, 0, 0, 1, 1,
-2.115529, -0.03260249, -2.660867, 0, 0, 0, 1, 1,
-1.999061, -0.4145333, -1.710877, 1, 1, 1, 1, 1,
-1.995077, 1.298628, 1.088512, 1, 1, 1, 1, 1,
-1.992378, 0.04338368, -1.569304, 1, 1, 1, 1, 1,
-1.935251, -0.9866362, 0.1718111, 1, 1, 1, 1, 1,
-1.91293, 0.5240275, -1.39538, 1, 1, 1, 1, 1,
-1.886886, 0.7927482, 0.7842483, 1, 1, 1, 1, 1,
-1.886792, 0.9278503, -1.137995, 1, 1, 1, 1, 1,
-1.885061, -0.8139682, -2.861697, 1, 1, 1, 1, 1,
-1.87741, -0.9198573, -2.53033, 1, 1, 1, 1, 1,
-1.828106, -0.519, -4.116373, 1, 1, 1, 1, 1,
-1.809808, -2.224975, -2.317984, 1, 1, 1, 1, 1,
-1.794466, 0.3760939, -1.179911, 1, 1, 1, 1, 1,
-1.785947, -0.01323816, -3.403836, 1, 1, 1, 1, 1,
-1.785169, -2.109273, -2.180618, 1, 1, 1, 1, 1,
-1.760483, -1.371979, -1.991896, 1, 1, 1, 1, 1,
-1.747437, 0.541109, -2.07249, 0, 0, 1, 1, 1,
-1.747154, 0.3993101, 0.0153552, 1, 0, 0, 1, 1,
-1.742596, -1.231677, -0.7591978, 1, 0, 0, 1, 1,
-1.740569, 1.279448, -2.469519, 1, 0, 0, 1, 1,
-1.730335, -0.8256528, -0.2972229, 1, 0, 0, 1, 1,
-1.721223, 0.06379505, -2.273741, 1, 0, 0, 1, 1,
-1.711877, -0.3805581, -1.254286, 0, 0, 0, 1, 1,
-1.70696, 0.007899552, -2.802944, 0, 0, 0, 1, 1,
-1.704697, 0.2991416, -0.2163366, 0, 0, 0, 1, 1,
-1.702931, 0.2721675, -2.830456, 0, 0, 0, 1, 1,
-1.681568, 0.4097562, -1.416833, 0, 0, 0, 1, 1,
-1.681537, 0.6709066, -1.006946, 0, 0, 0, 1, 1,
-1.66656, 1.171257, -0.1525722, 0, 0, 0, 1, 1,
-1.661643, -1.357257, -2.604972, 1, 1, 1, 1, 1,
-1.640682, -1.023293, -3.155099, 1, 1, 1, 1, 1,
-1.616185, -1.108654, -2.738483, 1, 1, 1, 1, 1,
-1.604858, 0.8238985, 0.4061264, 1, 1, 1, 1, 1,
-1.589329, 0.5682133, -1.967416, 1, 1, 1, 1, 1,
-1.588444, 0.610832, -2.309179, 1, 1, 1, 1, 1,
-1.586528, 0.9081253, -1.631586, 1, 1, 1, 1, 1,
-1.584635, -0.7876993, -0.1482697, 1, 1, 1, 1, 1,
-1.573222, -0.1515141, -2.230181, 1, 1, 1, 1, 1,
-1.571315, 0.2460309, -1.176694, 1, 1, 1, 1, 1,
-1.55736, -0.2198845, -2.708304, 1, 1, 1, 1, 1,
-1.543914, 1.050528, -0.5205685, 1, 1, 1, 1, 1,
-1.521039, 0.02390654, -3.10041, 1, 1, 1, 1, 1,
-1.519866, -1.800845, -1.162763, 1, 1, 1, 1, 1,
-1.503979, 0.01637178, -1.773212, 1, 1, 1, 1, 1,
-1.492863, 0.18422, -2.595922, 0, 0, 1, 1, 1,
-1.491607, -0.1179104, 0.7805237, 1, 0, 0, 1, 1,
-1.479099, -0.1137205, 2.571849, 1, 0, 0, 1, 1,
-1.479062, 1.136962, -0.9327536, 1, 0, 0, 1, 1,
-1.453618, 1.584311, 0.5516545, 1, 0, 0, 1, 1,
-1.453468, 1.745412, 0.4269744, 1, 0, 0, 1, 1,
-1.452152, 1.592126, -0.4466344, 0, 0, 0, 1, 1,
-1.447157, -0.0884506, -0.7754179, 0, 0, 0, 1, 1,
-1.446988, -0.4397577, -1.710465, 0, 0, 0, 1, 1,
-1.434824, 0.8310338, -0.8724687, 0, 0, 0, 1, 1,
-1.430728, 0.2687902, -0.6267738, 0, 0, 0, 1, 1,
-1.422622, -0.6787326, -2.408253, 0, 0, 0, 1, 1,
-1.420664, 0.218859, -0.9251333, 0, 0, 0, 1, 1,
-1.413449, -1.514318, -2.459373, 1, 1, 1, 1, 1,
-1.413401, 0.2006239, -1.021006, 1, 1, 1, 1, 1,
-1.39387, -1.330123, -2.136379, 1, 1, 1, 1, 1,
-1.389243, 0.9786248, -3.236773, 1, 1, 1, 1, 1,
-1.368646, 2.096113, -2.536182, 1, 1, 1, 1, 1,
-1.36397, -0.660904, -1.600446, 1, 1, 1, 1, 1,
-1.352452, 2.410521, 0.9457772, 1, 1, 1, 1, 1,
-1.34502, 1.602963, 0.2899816, 1, 1, 1, 1, 1,
-1.341644, -0.01291015, -2.015559, 1, 1, 1, 1, 1,
-1.338952, 1.668001, 0.4676307, 1, 1, 1, 1, 1,
-1.324557, 1.264016, -1.01864, 1, 1, 1, 1, 1,
-1.319743, 0.2386085, -2.304639, 1, 1, 1, 1, 1,
-1.30598, -1.310052, -2.663459, 1, 1, 1, 1, 1,
-1.305302, 0.7474166, -2.391223, 1, 1, 1, 1, 1,
-1.296661, -1.414919, -3.52962, 1, 1, 1, 1, 1,
-1.290943, -0.5146898, -2.523226, 0, 0, 1, 1, 1,
-1.290796, 0.8942329, 0.7495946, 1, 0, 0, 1, 1,
-1.284982, 0.5864578, -1.267452, 1, 0, 0, 1, 1,
-1.279147, 0.1777561, -0.9922557, 1, 0, 0, 1, 1,
-1.251305, -0.02194165, -2.323091, 1, 0, 0, 1, 1,
-1.239397, -1.796306, -2.420629, 1, 0, 0, 1, 1,
-1.238815, -0.4097178, -1.471351, 0, 0, 0, 1, 1,
-1.228627, 0.1478311, -1.437073, 0, 0, 0, 1, 1,
-1.226825, -0.06325322, -1.366564, 0, 0, 0, 1, 1,
-1.221082, -0.1090524, -1.319321, 0, 0, 0, 1, 1,
-1.214131, 0.6212378, -0.1450377, 0, 0, 0, 1, 1,
-1.210369, -0.2811673, -3.390681, 0, 0, 0, 1, 1,
-1.208533, 1.183268, -1.041389, 0, 0, 0, 1, 1,
-1.204766, 0.4841418, -0.6887144, 1, 1, 1, 1, 1,
-1.188413, 0.09257393, -1.805583, 1, 1, 1, 1, 1,
-1.172531, 1.024673, -0.6198755, 1, 1, 1, 1, 1,
-1.171423, 0.1270257, -1.059982, 1, 1, 1, 1, 1,
-1.166517, -0.2807799, -2.000739, 1, 1, 1, 1, 1,
-1.159959, -0.7122526, -0.152683, 1, 1, 1, 1, 1,
-1.155208, -0.100122, -1.24479, 1, 1, 1, 1, 1,
-1.146651, -0.209583, -2.324736, 1, 1, 1, 1, 1,
-1.146167, 2.000779, 0.187889, 1, 1, 1, 1, 1,
-1.14436, -0.4381743, -2.764454, 1, 1, 1, 1, 1,
-1.138871, 0.4946925, -0.6414951, 1, 1, 1, 1, 1,
-1.137004, -0.003887709, -1.856199, 1, 1, 1, 1, 1,
-1.135821, -0.9009082, -2.575969, 1, 1, 1, 1, 1,
-1.135749, 1.151996, -0.681487, 1, 1, 1, 1, 1,
-1.129334, -0.278581, -1.309812, 1, 1, 1, 1, 1,
-1.125851, 0.9435868, -1.371064, 0, 0, 1, 1, 1,
-1.123728, -0.1049222, -1.739675, 1, 0, 0, 1, 1,
-1.119701, 1.898591, -0.6822079, 1, 0, 0, 1, 1,
-1.119068, 0.2877115, 0.03593805, 1, 0, 0, 1, 1,
-1.115655, 1.482241, -2.225231, 1, 0, 0, 1, 1,
-1.110455, 0.0910043, 0.05498739, 1, 0, 0, 1, 1,
-1.10584, -1.585472, -2.308817, 0, 0, 0, 1, 1,
-1.101734, -0.910087, -1.814449, 0, 0, 0, 1, 1,
-1.100225, 0.01861591, -2.601874, 0, 0, 0, 1, 1,
-1.099523, -0.6485806, -2.136986, 0, 0, 0, 1, 1,
-1.094455, -1.306161, -3.749236, 0, 0, 0, 1, 1,
-1.087452, 0.5314916, -1.304258, 0, 0, 0, 1, 1,
-1.085466, 0.0638211, -0.6158872, 0, 0, 0, 1, 1,
-1.083727, 2.484245, 1.158396, 1, 1, 1, 1, 1,
-1.08357, 0.6762905, -0.7312554, 1, 1, 1, 1, 1,
-1.081985, 1.040797, -1.299375, 1, 1, 1, 1, 1,
-1.072471, 0.1076526, -1.314664, 1, 1, 1, 1, 1,
-1.07127, 1.510144, -0.8735108, 1, 1, 1, 1, 1,
-1.067477, -0.6193999, -0.1227723, 1, 1, 1, 1, 1,
-1.066511, -2.448297, -3.170378, 1, 1, 1, 1, 1,
-1.062911, -0.8432215, -3.699832, 1, 1, 1, 1, 1,
-1.060132, -1.791875, -1.094706, 1, 1, 1, 1, 1,
-1.055903, 1.063558, -1.270872, 1, 1, 1, 1, 1,
-1.045968, -0.002453578, -3.418141, 1, 1, 1, 1, 1,
-1.044453, -0.04019188, 0.1069005, 1, 1, 1, 1, 1,
-1.04418, -0.02343017, -1.7607, 1, 1, 1, 1, 1,
-1.04349, 1.282547, -0.8008475, 1, 1, 1, 1, 1,
-1.043158, -0.626665, -1.800611, 1, 1, 1, 1, 1,
-1.039798, 1.145459, -1.499147, 0, 0, 1, 1, 1,
-1.039136, -1.783745, -2.040833, 1, 0, 0, 1, 1,
-1.037138, 0.3269783, -1.129929, 1, 0, 0, 1, 1,
-1.034405, -0.1173749, -1.88184, 1, 0, 0, 1, 1,
-1.021168, -0.7586162, -3.515163, 1, 0, 0, 1, 1,
-1.020299, -1.634016, -3.768081, 1, 0, 0, 1, 1,
-1.015354, -0.6953624, -2.932486, 0, 0, 0, 1, 1,
-1.014155, 0.7433965, 0.2350117, 0, 0, 0, 1, 1,
-1.01314, -1.731269, -2.632291, 0, 0, 0, 1, 1,
-1.012542, 0.9114032, -0.9668375, 0, 0, 0, 1, 1,
-1.010427, 0.2017676, -1.504832, 0, 0, 0, 1, 1,
-1.00703, 2.071911, -2.330008, 0, 0, 0, 1, 1,
-0.9922196, 0.2132137, -1.512654, 0, 0, 0, 1, 1,
-0.987448, 1.422278, 0.4519299, 1, 1, 1, 1, 1,
-0.978276, 0.823077, -2.024435, 1, 1, 1, 1, 1,
-0.9763452, 0.4616941, -1.780377, 1, 1, 1, 1, 1,
-0.9728703, 1.201354, -0.9062966, 1, 1, 1, 1, 1,
-0.972813, -0.4434822, -2.445532, 1, 1, 1, 1, 1,
-0.971104, -0.4216045, -3.104089, 1, 1, 1, 1, 1,
-0.9693226, -0.5367684, -1.96338, 1, 1, 1, 1, 1,
-0.9604498, 0.266588, 0.4111813, 1, 1, 1, 1, 1,
-0.9504406, -1.219761, -2.084674, 1, 1, 1, 1, 1,
-0.9477329, -0.5150732, -0.5751482, 1, 1, 1, 1, 1,
-0.9466668, -0.5628442, -2.452437, 1, 1, 1, 1, 1,
-0.9466084, 2.208594, -0.74905, 1, 1, 1, 1, 1,
-0.9457244, 1.209701, 1.597336, 1, 1, 1, 1, 1,
-0.9404565, -0.01051885, -1.246965, 1, 1, 1, 1, 1,
-0.9390596, 0.7389709, 0.1286541, 1, 1, 1, 1, 1,
-0.9375125, -0.5504622, -1.334256, 0, 0, 1, 1, 1,
-0.9335151, 0.2048491, -2.08388, 1, 0, 0, 1, 1,
-0.9239825, -0.3200612, -0.4683038, 1, 0, 0, 1, 1,
-0.9231999, 0.2371535, -0.4906311, 1, 0, 0, 1, 1,
-0.9151058, -0.9773065, -2.699841, 1, 0, 0, 1, 1,
-0.9099035, 0.3214654, -0.8536946, 1, 0, 0, 1, 1,
-0.9087021, 0.4748173, -0.8160492, 0, 0, 0, 1, 1,
-0.9070377, -0.1071761, -1.885955, 0, 0, 0, 1, 1,
-0.9022103, -0.8773799, -1.817736, 0, 0, 0, 1, 1,
-0.8997758, -0.1356279, -0.3609279, 0, 0, 0, 1, 1,
-0.8992994, 1.361447, 0.5299413, 0, 0, 0, 1, 1,
-0.8946242, 1.238131, 0.7904809, 0, 0, 0, 1, 1,
-0.8930817, -0.8992539, -3.682919, 0, 0, 0, 1, 1,
-0.8859624, -0.08523226, -3.987082, 1, 1, 1, 1, 1,
-0.8824337, 0.8305025, -0.9030089, 1, 1, 1, 1, 1,
-0.8713545, 0.2717916, -1.659476, 1, 1, 1, 1, 1,
-0.8630036, 0.5481993, -1.88755, 1, 1, 1, 1, 1,
-0.8564562, -0.4814065, -1.75187, 1, 1, 1, 1, 1,
-0.8561907, 0.752605, 0.9788248, 1, 1, 1, 1, 1,
-0.8554099, 0.1007637, -0.8095383, 1, 1, 1, 1, 1,
-0.8533583, 0.2913641, -0.1986051, 1, 1, 1, 1, 1,
-0.85309, 0.1335579, -1.996438, 1, 1, 1, 1, 1,
-0.8491812, 1.208995, -0.389911, 1, 1, 1, 1, 1,
-0.8488378, 0.7342708, -0.6163463, 1, 1, 1, 1, 1,
-0.8472065, -1.504711, -2.05308, 1, 1, 1, 1, 1,
-0.8387915, -0.4424794, -0.7079135, 1, 1, 1, 1, 1,
-0.8383268, 1.386648, 1.03147, 1, 1, 1, 1, 1,
-0.8312718, -0.34509, -3.342697, 1, 1, 1, 1, 1,
-0.8311551, -1.455466, -3.104737, 0, 0, 1, 1, 1,
-0.8124552, -1.009987, -3.296982, 1, 0, 0, 1, 1,
-0.8099963, 1.618704, -1.476316, 1, 0, 0, 1, 1,
-0.8083416, -1.295975, -2.235234, 1, 0, 0, 1, 1,
-0.8080204, -0.2654878, -0.6112361, 1, 0, 0, 1, 1,
-0.8062283, -0.2890516, -1.317018, 1, 0, 0, 1, 1,
-0.79872, 0.5345515, -1.894742, 0, 0, 0, 1, 1,
-0.7924218, 0.4537618, -1.305497, 0, 0, 0, 1, 1,
-0.792224, 1.929571, 0.5954115, 0, 0, 0, 1, 1,
-0.7922072, -1.466948, -3.627096, 0, 0, 0, 1, 1,
-0.7907166, 0.6658685, -1.322255, 0, 0, 0, 1, 1,
-0.7905859, -1.826511, -3.029666, 0, 0, 0, 1, 1,
-0.7830397, 0.9682724, -1.368344, 0, 0, 0, 1, 1,
-0.7783117, -1.873892, -3.107814, 1, 1, 1, 1, 1,
-0.7717537, -1.11653, -1.341763, 1, 1, 1, 1, 1,
-0.7717258, -0.5972102, -3.740576, 1, 1, 1, 1, 1,
-0.7698638, 1.36967, -1.948267, 1, 1, 1, 1, 1,
-0.7675411, 0.1039265, -1.982337, 1, 1, 1, 1, 1,
-0.7643058, -0.1545835, -2.428945, 1, 1, 1, 1, 1,
-0.7635102, -1.168232, -2.315817, 1, 1, 1, 1, 1,
-0.7612594, -1.237703, -1.17526, 1, 1, 1, 1, 1,
-0.7588797, -0.7917505, -4.33151, 1, 1, 1, 1, 1,
-0.7585151, 1.079139, 0.2400952, 1, 1, 1, 1, 1,
-0.7581323, -0.2022257, -1.139383, 1, 1, 1, 1, 1,
-0.7526628, -1.085637, -3.065704, 1, 1, 1, 1, 1,
-0.7515759, -1.653244, -1.147268, 1, 1, 1, 1, 1,
-0.7492768, -0.315778, -3.511848, 1, 1, 1, 1, 1,
-0.7486848, -0.6272907, -1.277263, 1, 1, 1, 1, 1,
-0.7485147, -1.261613, -1.259092, 0, 0, 1, 1, 1,
-0.7425832, -0.3320314, -2.962002, 1, 0, 0, 1, 1,
-0.7415721, -0.191654, -3.1863, 1, 0, 0, 1, 1,
-0.7328433, 0.4937627, -1.878041, 1, 0, 0, 1, 1,
-0.7318513, 0.1538699, -2.457178, 1, 0, 0, 1, 1,
-0.7298263, -0.4033565, -3.162452, 1, 0, 0, 1, 1,
-0.7293324, 0.8652474, -1.275808, 0, 0, 0, 1, 1,
-0.7243139, -1.042423, -3.326904, 0, 0, 0, 1, 1,
-0.7150311, -0.03285388, -3.543334, 0, 0, 0, 1, 1,
-0.7095237, -0.9295309, -1.677397, 0, 0, 0, 1, 1,
-0.7061499, -0.9771221, -2.840615, 0, 0, 0, 1, 1,
-0.7031349, -0.5219932, -3.403563, 0, 0, 0, 1, 1,
-0.6997876, 1.409698, -0.07662554, 0, 0, 0, 1, 1,
-0.6992575, 0.9445569, -1.225561, 1, 1, 1, 1, 1,
-0.6968808, 0.6133392, -1.641668, 1, 1, 1, 1, 1,
-0.6958772, -1.252702, -3.321179, 1, 1, 1, 1, 1,
-0.6805277, 0.3190209, -0.7915783, 1, 1, 1, 1, 1,
-0.6793314, 0.6323355, -1.848504, 1, 1, 1, 1, 1,
-0.6759006, 1.029934, -2.041493, 1, 1, 1, 1, 1,
-0.6699482, 0.4697562, -1.801896, 1, 1, 1, 1, 1,
-0.6677316, 0.1588838, -0.8100367, 1, 1, 1, 1, 1,
-0.6667365, -2.232689, -3.147803, 1, 1, 1, 1, 1,
-0.6626807, -1.552425, -3.416566, 1, 1, 1, 1, 1,
-0.6618924, 0.5752385, -0.9852743, 1, 1, 1, 1, 1,
-0.661239, -0.2522702, -0.5243353, 1, 1, 1, 1, 1,
-0.6527641, -0.78602, -0.9169854, 1, 1, 1, 1, 1,
-0.6502767, -1.204768, -4.59632, 1, 1, 1, 1, 1,
-0.6493314, 0.2574016, -0.1504147, 1, 1, 1, 1, 1,
-0.6490999, -1.246062, -3.295878, 0, 0, 1, 1, 1,
-0.6444788, -1.233929, -2.534774, 1, 0, 0, 1, 1,
-0.6411521, -1.791041, -3.264536, 1, 0, 0, 1, 1,
-0.6395556, -0.5357459, -2.091303, 1, 0, 0, 1, 1,
-0.6391195, 0.569622, -0.4352465, 1, 0, 0, 1, 1,
-0.6344451, -0.5623312, -1.544684, 1, 0, 0, 1, 1,
-0.6317877, -0.1646578, -0.5026274, 0, 0, 0, 1, 1,
-0.6317016, -0.9646807, -2.464869, 0, 0, 0, 1, 1,
-0.6302868, -1.318833, -2.51781, 0, 0, 0, 1, 1,
-0.6300118, -1.041058, -2.849, 0, 0, 0, 1, 1,
-0.6290379, -1.596877, -2.626024, 0, 0, 0, 1, 1,
-0.6140725, 1.665095, 0.9771097, 0, 0, 0, 1, 1,
-0.6136492, -0.3969242, -1.901745, 0, 0, 0, 1, 1,
-0.6115211, 0.6156756, -0.5484672, 1, 1, 1, 1, 1,
-0.6107896, 1.490151, -0.1044641, 1, 1, 1, 1, 1,
-0.6031274, 0.3342863, -1.655382, 1, 1, 1, 1, 1,
-0.6023695, 0.446576, -0.8687854, 1, 1, 1, 1, 1,
-0.6000061, -0.526064, -1.939397, 1, 1, 1, 1, 1,
-0.5897524, 0.8929684, -0.1142074, 1, 1, 1, 1, 1,
-0.5893458, 0.8440989, -1.180388, 1, 1, 1, 1, 1,
-0.586341, -0.7544798, -1.658564, 1, 1, 1, 1, 1,
-0.58361, -0.9936675, -2.904133, 1, 1, 1, 1, 1,
-0.5816968, 0.7362459, -1.515085, 1, 1, 1, 1, 1,
-0.5810874, -0.7872071, -1.596743, 1, 1, 1, 1, 1,
-0.5794052, 0.6619296, -0.4882682, 1, 1, 1, 1, 1,
-0.5783769, 0.06976484, -1.414075, 1, 1, 1, 1, 1,
-0.5735726, 1.059827, -1.684649, 1, 1, 1, 1, 1,
-0.5734817, -1.869457, -2.29912, 1, 1, 1, 1, 1,
-0.5685149, 0.3994177, -3.215187, 0, 0, 1, 1, 1,
-0.5679816, 0.1332855, -0.2143069, 1, 0, 0, 1, 1,
-0.5627829, -2.433424, -3.751814, 1, 0, 0, 1, 1,
-0.5587026, -0.2851356, -0.6333495, 1, 0, 0, 1, 1,
-0.5522034, 1.184476, 0.8968779, 1, 0, 0, 1, 1,
-0.5513594, -1.042804, -2.204924, 1, 0, 0, 1, 1,
-0.5404203, -0.48112, -2.081089, 0, 0, 0, 1, 1,
-0.5397156, -0.2722693, -2.411594, 0, 0, 0, 1, 1,
-0.5354354, 0.1875557, 0.9689522, 0, 0, 0, 1, 1,
-0.5349889, -0.3053394, -0.6456404, 0, 0, 0, 1, 1,
-0.533273, -0.6880645, -2.450535, 0, 0, 0, 1, 1,
-0.5316709, 0.4801403, -0.8631467, 0, 0, 0, 1, 1,
-0.5308354, -0.2812052, -1.028828, 0, 0, 0, 1, 1,
-0.5293052, -1.845173, -2.610103, 1, 1, 1, 1, 1,
-0.5247513, 0.5326363, -1.473146, 1, 1, 1, 1, 1,
-0.5204181, -0.6752434, -2.10049, 1, 1, 1, 1, 1,
-0.5167701, 2.06709, -0.5348892, 1, 1, 1, 1, 1,
-0.5140685, -1.339251, -3.114032, 1, 1, 1, 1, 1,
-0.5128253, 2.106779, -0.4063299, 1, 1, 1, 1, 1,
-0.509035, 0.5856987, 0.9470124, 1, 1, 1, 1, 1,
-0.5051724, -0.24876, -2.193387, 1, 1, 1, 1, 1,
-0.5036133, 1.610329, -0.718188, 1, 1, 1, 1, 1,
-0.4991715, -0.4224203, -2.261952, 1, 1, 1, 1, 1,
-0.4960089, -1.339157, -2.171559, 1, 1, 1, 1, 1,
-0.4945454, -0.3763189, -2.201741, 1, 1, 1, 1, 1,
-0.487365, 0.6761756, -0.8582405, 1, 1, 1, 1, 1,
-0.4872488, 0.121447, -2.971255, 1, 1, 1, 1, 1,
-0.4871879, 0.3739363, -1.066727, 1, 1, 1, 1, 1,
-0.4846896, -1.174662, -2.579301, 0, 0, 1, 1, 1,
-0.4802155, -0.7289875, -2.831378, 1, 0, 0, 1, 1,
-0.4786066, 0.6731195, -0.6111291, 1, 0, 0, 1, 1,
-0.4771096, 0.1202217, 0.1875597, 1, 0, 0, 1, 1,
-0.4751806, -0.3785037, -3.12287, 1, 0, 0, 1, 1,
-0.4648803, 0.6751708, -0.556817, 1, 0, 0, 1, 1,
-0.4636542, -0.8938396, -1.409726, 0, 0, 0, 1, 1,
-0.4608783, -0.7495814, -0.6062565, 0, 0, 0, 1, 1,
-0.4601975, -1.944999, -2.926268, 0, 0, 0, 1, 1,
-0.4561507, -0.6184605, -2.344144, 0, 0, 0, 1, 1,
-0.4544104, 2.33509, -0.5908231, 0, 0, 0, 1, 1,
-0.4444965, -0.5544066, -1.124277, 0, 0, 0, 1, 1,
-0.4418345, -0.2138071, -0.7286692, 0, 0, 0, 1, 1,
-0.4405359, -1.54413, -1.850245, 1, 1, 1, 1, 1,
-0.4401841, -0.08901483, -2.218914, 1, 1, 1, 1, 1,
-0.4351024, 1.672417, -0.6627282, 1, 1, 1, 1, 1,
-0.4327153, -0.02745455, -2.662077, 1, 1, 1, 1, 1,
-0.4326918, -1.070026, -4.386399, 1, 1, 1, 1, 1,
-0.432674, -0.5765062, -1.88357, 1, 1, 1, 1, 1,
-0.4315303, 0.6683733, -0.4766555, 1, 1, 1, 1, 1,
-0.4310102, 2.175197, -0.2492081, 1, 1, 1, 1, 1,
-0.4289375, 0.2101889, -0.3537175, 1, 1, 1, 1, 1,
-0.4201235, 1.175967, -1.748749, 1, 1, 1, 1, 1,
-0.418722, -0.8791516, -2.83225, 1, 1, 1, 1, 1,
-0.4153697, 0.3751118, 0.1085601, 1, 1, 1, 1, 1,
-0.4143173, -0.9026856, -2.128374, 1, 1, 1, 1, 1,
-0.4133393, -1.700967, -1.228352, 1, 1, 1, 1, 1,
-0.4020447, 0.5447338, -1.112753, 1, 1, 1, 1, 1,
-0.3975241, 0.6330361, -0.711513, 0, 0, 1, 1, 1,
-0.3972189, -0.6172052, -2.649468, 1, 0, 0, 1, 1,
-0.3970996, -0.0963835, -2.390338, 1, 0, 0, 1, 1,
-0.393802, -0.03182923, -0.5508851, 1, 0, 0, 1, 1,
-0.393267, 0.2538396, -0.7212262, 1, 0, 0, 1, 1,
-0.3927105, 0.1713624, -1.393479, 1, 0, 0, 1, 1,
-0.3824474, 0.6174782, -0.6846648, 0, 0, 0, 1, 1,
-0.3788234, 2.426967, -2.77914, 0, 0, 0, 1, 1,
-0.3780535, -1.105866, -2.633823, 0, 0, 0, 1, 1,
-0.3690702, 0.9404559, 1.54981, 0, 0, 0, 1, 1,
-0.3688599, 0.03428759, -3.258323, 0, 0, 0, 1, 1,
-0.36763, -0.708478, -1.692978, 0, 0, 0, 1, 1,
-0.3584182, -0.7773468, -2.302555, 0, 0, 0, 1, 1,
-0.3554109, 1.200097, -1.054583, 1, 1, 1, 1, 1,
-0.3481867, 0.6311188, -0.3646457, 1, 1, 1, 1, 1,
-0.3475567, 0.4792531, 1.314882, 1, 1, 1, 1, 1,
-0.3451828, -0.07902253, -0.8288228, 1, 1, 1, 1, 1,
-0.3445599, -0.3905821, -2.550997, 1, 1, 1, 1, 1,
-0.3442849, -0.7469715, -1.939957, 1, 1, 1, 1, 1,
-0.3432716, -0.3479531, -2.197613, 1, 1, 1, 1, 1,
-0.3428656, -2.499046, -3.140091, 1, 1, 1, 1, 1,
-0.3402025, 0.5862638, -0.1104705, 1, 1, 1, 1, 1,
-0.3398737, -0.7506186, -1.912551, 1, 1, 1, 1, 1,
-0.3393337, -0.6630546, -2.551101, 1, 1, 1, 1, 1,
-0.3349935, 0.1764217, -2.467665, 1, 1, 1, 1, 1,
-0.3290796, -1.039391, -2.029451, 1, 1, 1, 1, 1,
-0.3273737, 1.447678, 0.5023293, 1, 1, 1, 1, 1,
-0.326835, 2.074136, -0.6041974, 1, 1, 1, 1, 1,
-0.3217705, -0.8095881, -3.363945, 0, 0, 1, 1, 1,
-0.3215969, -1.034072, -2.627048, 1, 0, 0, 1, 1,
-0.318153, -0.3270327, -1.392316, 1, 0, 0, 1, 1,
-0.3178043, -1.466605, -3.723938, 1, 0, 0, 1, 1,
-0.3172333, 0.5726571, -2.525413, 1, 0, 0, 1, 1,
-0.3126596, -1.095029, -2.888956, 1, 0, 0, 1, 1,
-0.3124841, -0.03350268, -1.356426, 0, 0, 0, 1, 1,
-0.310096, 0.1411476, -1.256774, 0, 0, 0, 1, 1,
-0.3097069, 0.7216827, -2.235065, 0, 0, 0, 1, 1,
-0.3034209, -0.1657062, -0.428955, 0, 0, 0, 1, 1,
-0.3013408, -1.340357, -3.019078, 0, 0, 0, 1, 1,
-0.3012308, -1.316561, -3.656961, 0, 0, 0, 1, 1,
-0.3000504, -0.4261307, -4.203145, 0, 0, 0, 1, 1,
-0.2998971, -0.5696133, -2.668324, 1, 1, 1, 1, 1,
-0.2977337, 0.8296293, 0.103123, 1, 1, 1, 1, 1,
-0.2963198, -1.425029, -2.70679, 1, 1, 1, 1, 1,
-0.2951375, -0.4598562, -3.398703, 1, 1, 1, 1, 1,
-0.294482, -0.5047113, -3.187333, 1, 1, 1, 1, 1,
-0.2907234, -0.8652785, -2.721508, 1, 1, 1, 1, 1,
-0.2903318, -0.5321566, -2.20709, 1, 1, 1, 1, 1,
-0.2861829, 0.3972133, -1.168433, 1, 1, 1, 1, 1,
-0.2858593, 1.403244, -0.9400516, 1, 1, 1, 1, 1,
-0.2838183, 1.492095, -1.541577, 1, 1, 1, 1, 1,
-0.2836232, 0.02743812, -1.02108, 1, 1, 1, 1, 1,
-0.2814116, 0.6395706, 0.1672159, 1, 1, 1, 1, 1,
-0.2770438, 1.418924, -0.1473612, 1, 1, 1, 1, 1,
-0.2764339, 0.5614683, 0.5713781, 1, 1, 1, 1, 1,
-0.2737963, 0.759212, -0.5189077, 1, 1, 1, 1, 1,
-0.2713644, -0.5095527, -2.996771, 0, 0, 1, 1, 1,
-0.2654309, 0.09401198, -0.9374304, 1, 0, 0, 1, 1,
-0.2643074, -0.430856, -2.034884, 1, 0, 0, 1, 1,
-0.2636787, 0.4480805, -0.301234, 1, 0, 0, 1, 1,
-0.2607906, -0.700635, -1.250001, 1, 0, 0, 1, 1,
-0.2514363, -1.291185, -3.129037, 1, 0, 0, 1, 1,
-0.242998, 0.4601843, -0.7466391, 0, 0, 0, 1, 1,
-0.2412532, -0.546793, -2.282537, 0, 0, 0, 1, 1,
-0.2402605, 2.262525, 0.8514773, 0, 0, 0, 1, 1,
-0.2399487, 0.1894323, 0.4065611, 0, 0, 0, 1, 1,
-0.2392843, 0.1889484, -0.1598891, 0, 0, 0, 1, 1,
-0.2385245, 1.635072, 0.7983553, 0, 0, 0, 1, 1,
-0.2371912, 0.3592175, -2.034503, 0, 0, 0, 1, 1,
-0.2369384, 1.523829, -0.9971722, 1, 1, 1, 1, 1,
-0.2332253, 0.09415206, -1.134676, 1, 1, 1, 1, 1,
-0.2263968, 0.1342386, -1.521733, 1, 1, 1, 1, 1,
-0.2226205, -0.1016231, -0.9663331, 1, 1, 1, 1, 1,
-0.2213458, -0.385627, -2.552658, 1, 1, 1, 1, 1,
-0.2205918, -0.6896669, -3.649458, 1, 1, 1, 1, 1,
-0.2188787, 0.6360183, -2.009745, 1, 1, 1, 1, 1,
-0.2188496, -0.1924188, -1.582557, 1, 1, 1, 1, 1,
-0.2186166, -0.8538805, -2.198445, 1, 1, 1, 1, 1,
-0.2180577, -1.099762, -3.153377, 1, 1, 1, 1, 1,
-0.2125632, -0.3925885, -2.536462, 1, 1, 1, 1, 1,
-0.212299, 2.253106, 0.3233767, 1, 1, 1, 1, 1,
-0.206258, 0.2623518, -0.837364, 1, 1, 1, 1, 1,
-0.201782, -0.6703474, -3.027216, 1, 1, 1, 1, 1,
-0.2006159, 0.8582071, 2.083201, 1, 1, 1, 1, 1,
-0.1992575, -1.143494, -2.254181, 0, 0, 1, 1, 1,
-0.1975704, -0.474745, -3.022533, 1, 0, 0, 1, 1,
-0.196655, -0.5861959, -3.591203, 1, 0, 0, 1, 1,
-0.190678, 0.8729874, 0.3596569, 1, 0, 0, 1, 1,
-0.1869659, -0.8552248, -1.385986, 1, 0, 0, 1, 1,
-0.1819535, -0.8296722, -2.962992, 1, 0, 0, 1, 1,
-0.1817024, 1.164124, 0.6256492, 0, 0, 0, 1, 1,
-0.1789837, -0.3431133, -0.9109133, 0, 0, 0, 1, 1,
-0.1781253, 0.7707226, 0.8637704, 0, 0, 0, 1, 1,
-0.1755676, 0.1600024, 0.1715051, 0, 0, 0, 1, 1,
-0.1734891, 1.163532, -0.2684964, 0, 0, 0, 1, 1,
-0.1708462, 1.392918, -0.3061995, 0, 0, 0, 1, 1,
-0.1705894, -1.893672, -4.356815, 0, 0, 0, 1, 1,
-0.1664029, -1.141412, -3.664217, 1, 1, 1, 1, 1,
-0.164861, 0.600949, -1.493307, 1, 1, 1, 1, 1,
-0.1639027, -0.516852, -3.537202, 1, 1, 1, 1, 1,
-0.1590429, 0.1491093, -0.3917183, 1, 1, 1, 1, 1,
-0.1588674, -0.6065071, -4.198659, 1, 1, 1, 1, 1,
-0.1577266, -0.2812287, -2.225799, 1, 1, 1, 1, 1,
-0.1558769, -0.9887608, -4.682606, 1, 1, 1, 1, 1,
-0.155166, -0.06973337, -4.019013, 1, 1, 1, 1, 1,
-0.1504789, -1.064396, -4.478145, 1, 1, 1, 1, 1,
-0.1500903, -0.6400318, -2.808992, 1, 1, 1, 1, 1,
-0.1476049, -0.4378617, -2.607302, 1, 1, 1, 1, 1,
-0.1463483, 1.1117, 0.008964095, 1, 1, 1, 1, 1,
-0.1431072, 0.6280653, -0.1806401, 1, 1, 1, 1, 1,
-0.1415061, -0.2854802, -2.933549, 1, 1, 1, 1, 1,
-0.1408208, -1.089164, -4.040143, 1, 1, 1, 1, 1,
-0.1395353, -1.714221, -3.715473, 0, 0, 1, 1, 1,
-0.136157, 0.3843875, 0.5250045, 1, 0, 0, 1, 1,
-0.1358315, 0.1138398, 1.184039, 1, 0, 0, 1, 1,
-0.1354475, 0.0804118, -3.242518, 1, 0, 0, 1, 1,
-0.1350648, -0.3452978, -3.182678, 1, 0, 0, 1, 1,
-0.1348103, 0.3168665, 1.330526, 1, 0, 0, 1, 1,
-0.1324024, 1.029863, 0.2935811, 0, 0, 0, 1, 1,
-0.1311032, 1.255615, -0.9863579, 0, 0, 0, 1, 1,
-0.129569, 0.4762199, -2.541011, 0, 0, 0, 1, 1,
-0.1270861, 0.5895668, -0.5065759, 0, 0, 0, 1, 1,
-0.1261222, -0.6305676, -1.069659, 0, 0, 0, 1, 1,
-0.125833, 0.7522653, 1.632136, 0, 0, 0, 1, 1,
-0.124816, -1.075726, -1.550224, 0, 0, 0, 1, 1,
-0.12145, -1.528519, -3.231404, 1, 1, 1, 1, 1,
-0.1165375, 1.198756, 0.236441, 1, 1, 1, 1, 1,
-0.1146591, -0.08266684, -1.535617, 1, 1, 1, 1, 1,
-0.1118629, 0.3915389, -1.866848, 1, 1, 1, 1, 1,
-0.1100776, 0.126525, 0.4126262, 1, 1, 1, 1, 1,
-0.1095482, -0.4591799, -2.18279, 1, 1, 1, 1, 1,
-0.1085138, -1.444984, -4.092224, 1, 1, 1, 1, 1,
-0.1055766, 1.979289, -0.1910302, 1, 1, 1, 1, 1,
-0.08937228, -1.349374, -3.947605, 1, 1, 1, 1, 1,
-0.08687537, -0.1498789, -3.825588, 1, 1, 1, 1, 1,
-0.08490589, -1.729414, -3.236444, 1, 1, 1, 1, 1,
-0.08467852, -1.92551, -6.270708, 1, 1, 1, 1, 1,
-0.08427406, 0.5182801, 0.156824, 1, 1, 1, 1, 1,
-0.08393268, 1.40878, -0.03703909, 1, 1, 1, 1, 1,
-0.08119189, 1.363697, -0.6308469, 1, 1, 1, 1, 1,
-0.08031204, -0.3709763, -2.586715, 0, 0, 1, 1, 1,
-0.07829837, -0.09344314, -1.250066, 1, 0, 0, 1, 1,
-0.07820687, 0.006937184, -2.08639, 1, 0, 0, 1, 1,
-0.07797947, -0.7788066, -3.145604, 1, 0, 0, 1, 1,
-0.0769182, 0.0439438, -1.469051, 1, 0, 0, 1, 1,
-0.07111285, 0.6931897, 0.02882575, 1, 0, 0, 1, 1,
-0.06858644, 0.3643913, -0.4295023, 0, 0, 0, 1, 1,
-0.06244708, -1.276611, -3.29776, 0, 0, 0, 1, 1,
-0.06092974, 1.153139, 0.1645216, 0, 0, 0, 1, 1,
-0.06067171, 0.1874295, -1.913833, 0, 0, 0, 1, 1,
-0.06019438, -0.9641559, -4.578846, 0, 0, 0, 1, 1,
-0.05977539, 1.011841, 0.9691251, 0, 0, 0, 1, 1,
-0.05109983, 0.1013286, -0.0887544, 0, 0, 0, 1, 1,
-0.04955682, 0.2128206, 1.23428, 1, 1, 1, 1, 1,
-0.04893034, -1.052433, -3.579921, 1, 1, 1, 1, 1,
-0.04794821, 0.4395937, 0.993826, 1, 1, 1, 1, 1,
-0.04614203, 1.757863, 0.7558722, 1, 1, 1, 1, 1,
-0.04433759, 0.246883, 1.354893, 1, 1, 1, 1, 1,
-0.04158604, -0.05483716, -2.616713, 1, 1, 1, 1, 1,
-0.0402542, 1.269841, -0.4239089, 1, 1, 1, 1, 1,
-0.03095688, 0.7351065, 0.6713884, 1, 1, 1, 1, 1,
-0.03054324, -1.25367, -2.69562, 1, 1, 1, 1, 1,
-0.02948387, -0.8918737, -4.609939, 1, 1, 1, 1, 1,
-0.0292066, -1.107809, -2.722907, 1, 1, 1, 1, 1,
-0.02859369, 0.2951732, -0.8354124, 1, 1, 1, 1, 1,
-0.0182064, 1.593405, -2.287683, 1, 1, 1, 1, 1,
-0.01541607, 0.7102506, 0.7073771, 1, 1, 1, 1, 1,
-0.01539942, 0.1577313, -0.2729102, 1, 1, 1, 1, 1,
-0.01434248, -0.2848323, -4.755062, 0, 0, 1, 1, 1,
-0.01386105, 1.378397, 0.6671909, 1, 0, 0, 1, 1,
-0.01358952, 0.4748401, 0.5885159, 1, 0, 0, 1, 1,
-0.00710452, -0.3709318, -1.438468, 1, 0, 0, 1, 1,
-0.002962758, -0.5437951, -2.033047, 1, 0, 0, 1, 1,
-0.002645567, 1.00575, -0.147435, 1, 0, 0, 1, 1,
-0.002506349, -0.5728295, -3.234465, 0, 0, 0, 1, 1,
-0.0008390389, -0.3815117, -1.280944, 0, 0, 0, 1, 1,
-0.0007363746, -0.3918025, -4.048759, 0, 0, 0, 1, 1,
0.002311844, 0.7394892, -1.386911, 0, 0, 0, 1, 1,
0.003130613, -0.6179134, 2.916082, 0, 0, 0, 1, 1,
0.005804616, 0.4278468, 0.3658473, 0, 0, 0, 1, 1,
0.008705666, 1.588148, -1.179716, 0, 0, 0, 1, 1,
0.009699276, 0.1337964, 0.8290948, 1, 1, 1, 1, 1,
0.01240693, -0.2519462, 1.826671, 1, 1, 1, 1, 1,
0.01450096, -1.217654, 1.720983, 1, 1, 1, 1, 1,
0.02412674, 1.115128, 1.169137, 1, 1, 1, 1, 1,
0.02668447, 0.2727634, 0.6680517, 1, 1, 1, 1, 1,
0.027492, -0.6468914, 3.013557, 1, 1, 1, 1, 1,
0.03138665, 1.789993, -0.831027, 1, 1, 1, 1, 1,
0.03371412, 1.120312, -0.227988, 1, 1, 1, 1, 1,
0.03785851, -0.04385538, 2.671024, 1, 1, 1, 1, 1,
0.04427326, -0.2439895, 3.091184, 1, 1, 1, 1, 1,
0.04435769, -0.5688688, 2.556042, 1, 1, 1, 1, 1,
0.04471255, -0.3283721, 3.140258, 1, 1, 1, 1, 1,
0.05872672, 1.826181, 1.316873, 1, 1, 1, 1, 1,
0.06123683, -0.498994, 5.158509, 1, 1, 1, 1, 1,
0.06219235, -0.3150396, 3.240808, 1, 1, 1, 1, 1,
0.06529716, -2.526769, 4.546626, 0, 0, 1, 1, 1,
0.0656697, 1.482038, -0.009809586, 1, 0, 0, 1, 1,
0.06886047, 0.065813, -0.5584894, 1, 0, 0, 1, 1,
0.07248043, 0.5426731, -0.8514238, 1, 0, 0, 1, 1,
0.07325583, -0.03858636, 3.872544, 1, 0, 0, 1, 1,
0.07336086, 0.540669, -0.8315372, 1, 0, 0, 1, 1,
0.07607656, -1.36059, 2.430375, 0, 0, 0, 1, 1,
0.07628324, -0.2141573, 3.999587, 0, 0, 0, 1, 1,
0.08750127, 0.2566238, 0.9150423, 0, 0, 0, 1, 1,
0.09235442, -1.185257, 4.544213, 0, 0, 0, 1, 1,
0.09858014, -1.91142, 1.142216, 0, 0, 0, 1, 1,
0.0986858, -0.9072363, 4.78067, 0, 0, 0, 1, 1,
0.1025525, -0.4327002, 4.538347, 0, 0, 0, 1, 1,
0.1045712, 0.2253275, 1.072096, 1, 1, 1, 1, 1,
0.1074659, -0.6353348, 2.740298, 1, 1, 1, 1, 1,
0.1112541, -1.791111, 2.758529, 1, 1, 1, 1, 1,
0.1116914, 0.0212997, 1.357274, 1, 1, 1, 1, 1,
0.1131008, 0.3154856, -0.7903457, 1, 1, 1, 1, 1,
0.1163179, 0.1674216, 1.070667, 1, 1, 1, 1, 1,
0.1202333, 0.2505346, 0.7714241, 1, 1, 1, 1, 1,
0.1263988, 0.8036655, 0.4083067, 1, 1, 1, 1, 1,
0.1264199, -2.356055, 3.583353, 1, 1, 1, 1, 1,
0.1289544, 1.107372, -0.08511357, 1, 1, 1, 1, 1,
0.1370007, -0.5910527, 1.809634, 1, 1, 1, 1, 1,
0.1380715, -1.330585, 4.073125, 1, 1, 1, 1, 1,
0.1416376, 0.8263505, 0.1201419, 1, 1, 1, 1, 1,
0.1520213, 0.6011192, -1.629834, 1, 1, 1, 1, 1,
0.1611359, 1.601086, 0.2245966, 1, 1, 1, 1, 1,
0.1625945, -0.1630893, 1.245046, 0, 0, 1, 1, 1,
0.1669319, 0.4032193, 0.822087, 1, 0, 0, 1, 1,
0.169532, 0.4860263, -0.5574899, 1, 0, 0, 1, 1,
0.1767584, -0.02649194, 2.693009, 1, 0, 0, 1, 1,
0.1787929, 0.325325, 0.8914669, 1, 0, 0, 1, 1,
0.1801367, 2.29731, 0.006127902, 1, 0, 0, 1, 1,
0.1812491, -0.3747158, 3.93289, 0, 0, 0, 1, 1,
0.1832351, -0.5170161, 3.13811, 0, 0, 0, 1, 1,
0.1882875, 0.6527954, 2.105371, 0, 0, 0, 1, 1,
0.1912593, -0.4637567, 2.280393, 0, 0, 0, 1, 1,
0.1916805, 1.944754, 1.781475, 0, 0, 0, 1, 1,
0.1939301, -0.2516642, 0.9278848, 0, 0, 0, 1, 1,
0.1991487, 1.483255, 0.9567504, 0, 0, 0, 1, 1,
0.2000651, -0.7108091, 4.742959, 1, 1, 1, 1, 1,
0.2009524, 0.1289727, 0.5736755, 1, 1, 1, 1, 1,
0.2063959, 0.8814166, 0.1619884, 1, 1, 1, 1, 1,
0.2068095, -0.3021616, 3.414807, 1, 1, 1, 1, 1,
0.2132729, -0.00793557, 3.484018, 1, 1, 1, 1, 1,
0.2182304, -0.1050464, 2.183884, 1, 1, 1, 1, 1,
0.2222988, 1.506811, 0.04678421, 1, 1, 1, 1, 1,
0.2255071, 0.6776388, 0.1665265, 1, 1, 1, 1, 1,
0.2282056, 1.869408, 0.4063571, 1, 1, 1, 1, 1,
0.2296696, 1.419834, 0.5576424, 1, 1, 1, 1, 1,
0.2312067, -0.3449389, 3.406355, 1, 1, 1, 1, 1,
0.2339208, -0.3583764, 3.911368, 1, 1, 1, 1, 1,
0.236508, 1.309886, -0.4177403, 1, 1, 1, 1, 1,
0.2371469, 0.63906, -0.5825983, 1, 1, 1, 1, 1,
0.2411489, 1.339926, 0.008402952, 1, 1, 1, 1, 1,
0.2474836, -1.631263, 1.010718, 0, 0, 1, 1, 1,
0.247743, -0.3442264, 1.554143, 1, 0, 0, 1, 1,
0.2578394, -1.274197, 2.248464, 1, 0, 0, 1, 1,
0.2596891, -0.9797227, 3.069697, 1, 0, 0, 1, 1,
0.2597039, 0.546265, -1.046629, 1, 0, 0, 1, 1,
0.2600675, -0.3496988, 2.341011, 1, 0, 0, 1, 1,
0.2610655, 0.1162769, 0.6350591, 0, 0, 0, 1, 1,
0.2615047, -0.7866236, 2.580706, 0, 0, 0, 1, 1,
0.2628675, 1.190062, 1.37402, 0, 0, 0, 1, 1,
0.2718377, -0.5886804, 3.266087, 0, 0, 0, 1, 1,
0.2729087, -0.4006915, 2.714517, 0, 0, 0, 1, 1,
0.2740459, 1.029272, 0.2609112, 0, 0, 0, 1, 1,
0.2774166, 0.4839399, -0.5279757, 0, 0, 0, 1, 1,
0.278285, 1.765364, -0.1943809, 1, 1, 1, 1, 1,
0.280772, -0.4828912, 3.012236, 1, 1, 1, 1, 1,
0.2820185, -0.9310309, 3.194271, 1, 1, 1, 1, 1,
0.2831676, 0.3790487, -0.6622598, 1, 1, 1, 1, 1,
0.28444, -1.06819, 4.851574, 1, 1, 1, 1, 1,
0.2869616, -0.07766052, 1.975804, 1, 1, 1, 1, 1,
0.2889908, -0.1552085, 1.741608, 1, 1, 1, 1, 1,
0.2973689, -0.5960473, 2.853788, 1, 1, 1, 1, 1,
0.2979847, -0.3687495, 1.53189, 1, 1, 1, 1, 1,
0.2983578, -0.8348333, 1.535092, 1, 1, 1, 1, 1,
0.2987049, -0.04627199, 2.78285, 1, 1, 1, 1, 1,
0.3016061, 0.007061141, 3.24599, 1, 1, 1, 1, 1,
0.3025995, -0.3574947, 2.761682, 1, 1, 1, 1, 1,
0.3032449, -1.785804, 3.978756, 1, 1, 1, 1, 1,
0.3040546, 0.455837, 0.5983562, 1, 1, 1, 1, 1,
0.310156, 2.15112, 0.8547255, 0, 0, 1, 1, 1,
0.3106099, 1.440584, -0.1752785, 1, 0, 0, 1, 1,
0.3110604, -0.09162237, 1.476666, 1, 0, 0, 1, 1,
0.3122406, 1.070109, 0.5553957, 1, 0, 0, 1, 1,
0.3124803, -1.885448, 3.050659, 1, 0, 0, 1, 1,
0.3167909, 0.140405, 2.331763, 1, 0, 0, 1, 1,
0.3169077, -0.746965, 1.333923, 0, 0, 0, 1, 1,
0.3375151, -1.214337, 3.384676, 0, 0, 0, 1, 1,
0.3471592, 0.8299155, 1.80929, 0, 0, 0, 1, 1,
0.3519793, -0.05628071, 2.482836, 0, 0, 0, 1, 1,
0.3536549, -2.228522, 2.918843, 0, 0, 0, 1, 1,
0.3589826, -0.589941, 2.265201, 0, 0, 0, 1, 1,
0.3617082, -0.9233616, 3.659363, 0, 0, 0, 1, 1,
0.3638974, 0.1478504, 1.991275, 1, 1, 1, 1, 1,
0.3640314, -0.6809683, 2.810314, 1, 1, 1, 1, 1,
0.3649589, -1.252836, 4.687982, 1, 1, 1, 1, 1,
0.3652345, 1.092076, 0.7992436, 1, 1, 1, 1, 1,
0.3652964, 0.05947132, 1.42799, 1, 1, 1, 1, 1,
0.3706125, 2.198328, -1.022621, 1, 1, 1, 1, 1,
0.3706476, -2.338046, 3.773684, 1, 1, 1, 1, 1,
0.3710547, 1.349588, -0.03617056, 1, 1, 1, 1, 1,
0.3719732, -0.3891319, 1.333905, 1, 1, 1, 1, 1,
0.3733156, -0.1112972, 1.167795, 1, 1, 1, 1, 1,
0.3754001, -2.006477, 4.18372, 1, 1, 1, 1, 1,
0.3755856, 0.190927, 0.8204818, 1, 1, 1, 1, 1,
0.3788745, 0.5445104, 1.207565, 1, 1, 1, 1, 1,
0.379544, 0.6684144, 0.2910314, 1, 1, 1, 1, 1,
0.3817498, -0.5326729, 1.52384, 1, 1, 1, 1, 1,
0.3909845, -0.7802178, 1.345052, 0, 0, 1, 1, 1,
0.393207, -0.1679719, 1.145681, 1, 0, 0, 1, 1,
0.3990755, -0.1998442, -0.5482507, 1, 0, 0, 1, 1,
0.406378, 0.734617, 0.9807688, 1, 0, 0, 1, 1,
0.4085442, -0.431881, 1.469719, 1, 0, 0, 1, 1,
0.4136836, 0.8065094, -0.9594366, 1, 0, 0, 1, 1,
0.4139247, 2.085509, -0.9474351, 0, 0, 0, 1, 1,
0.4140273, -1.83772, 2.534717, 0, 0, 0, 1, 1,
0.4166244, 0.6000752, 2.185952, 0, 0, 0, 1, 1,
0.4198025, 1.233962, 0.3176673, 0, 0, 0, 1, 1,
0.4201066, 0.9225865, 1.475528, 0, 0, 0, 1, 1,
0.4239744, 0.9805705, 1.476192, 0, 0, 0, 1, 1,
0.4257717, -0.4854526, 0.6860954, 0, 0, 0, 1, 1,
0.4288702, -0.4687151, 3.565465, 1, 1, 1, 1, 1,
0.4301911, 0.3570619, 2.725197, 1, 1, 1, 1, 1,
0.4376378, -0.5007744, 1.474216, 1, 1, 1, 1, 1,
0.4380787, -0.2629403, 1.93936, 1, 1, 1, 1, 1,
0.4468368, 0.3936883, 0.03001818, 1, 1, 1, 1, 1,
0.4472803, -1.586137, 3.833608, 1, 1, 1, 1, 1,
0.4476563, 0.1777621, 1.887726, 1, 1, 1, 1, 1,
0.449602, 0.5505163, 2.111227, 1, 1, 1, 1, 1,
0.4542129, -1.515206, 4.066126, 1, 1, 1, 1, 1,
0.454802, -1.309167, 1.749346, 1, 1, 1, 1, 1,
0.4551803, -0.8227303, 1.639521, 1, 1, 1, 1, 1,
0.4563005, -1.581619, 2.699931, 1, 1, 1, 1, 1,
0.4564688, 0.8096194, 1.005568, 1, 1, 1, 1, 1,
0.4590209, -0.04826387, 2.252651, 1, 1, 1, 1, 1,
0.4634238, -0.3800289, 2.096827, 1, 1, 1, 1, 1,
0.4644937, 0.9378856, -2.403564, 0, 0, 1, 1, 1,
0.4660884, -0.5951347, 3.619534, 1, 0, 0, 1, 1,
0.4671898, 0.4882212, 1.297398, 1, 0, 0, 1, 1,
0.4728434, -1.672195, 2.924181, 1, 0, 0, 1, 1,
0.4733919, 0.28221, 1.116109, 1, 0, 0, 1, 1,
0.4741859, 0.08159647, 2.044367, 1, 0, 0, 1, 1,
0.4817728, 0.6095422, 0.105508, 0, 0, 0, 1, 1,
0.4821803, -0.7801509, 1.263896, 0, 0, 0, 1, 1,
0.4861729, -0.5529688, 3.128041, 0, 0, 0, 1, 1,
0.4903673, 0.3597158, -0.5870711, 0, 0, 0, 1, 1,
0.491066, -0.2549498, 3.40589, 0, 0, 0, 1, 1,
0.4971182, 1.474359, 1.071443, 0, 0, 0, 1, 1,
0.4972006, -1.098535, 3.34937, 0, 0, 0, 1, 1,
0.5040952, -0.8176156, 4.252498, 1, 1, 1, 1, 1,
0.5112158, -1.511288, 2.919455, 1, 1, 1, 1, 1,
0.5126281, -0.3678306, 3.950056, 1, 1, 1, 1, 1,
0.5154511, -0.3538652, 2.008236, 1, 1, 1, 1, 1,
0.5195987, -0.449423, 2.482598, 1, 1, 1, 1, 1,
0.5201281, 1.177873, 1.766954, 1, 1, 1, 1, 1,
0.5238296, -0.6986026, 1.748561, 1, 1, 1, 1, 1,
0.5254586, 0.2346115, 1.745251, 1, 1, 1, 1, 1,
0.526798, -1.43541, 1.651277, 1, 1, 1, 1, 1,
0.526805, -1.309794, 0.9273129, 1, 1, 1, 1, 1,
0.5277365, 0.3111463, 0.8211648, 1, 1, 1, 1, 1,
0.531082, -1.579017, 4.006351, 1, 1, 1, 1, 1,
0.531242, 1.252302, 0.539225, 1, 1, 1, 1, 1,
0.5313302, -0.4237005, 1.868951, 1, 1, 1, 1, 1,
0.5329574, 1.590736, -1.176246, 1, 1, 1, 1, 1,
0.5342242, 1.842109, -0.271357, 0, 0, 1, 1, 1,
0.5353195, 1.014032, -1.885461, 1, 0, 0, 1, 1,
0.5431626, 0.5740372, 1.54047, 1, 0, 0, 1, 1,
0.5463262, -0.5710537, 3.27316, 1, 0, 0, 1, 1,
0.5495969, -0.09716651, 3.08672, 1, 0, 0, 1, 1,
0.5517096, -0.0634674, 1.059225, 1, 0, 0, 1, 1,
0.5548485, 0.4684424, 1.829788, 0, 0, 0, 1, 1,
0.5549042, 0.3354039, 0.6918781, 0, 0, 0, 1, 1,
0.556971, 0.01352465, 2.510142, 0, 0, 0, 1, 1,
0.5570063, 0.1356469, 1.07056, 0, 0, 0, 1, 1,
0.5640742, 0.2520189, 1.092216, 0, 0, 0, 1, 1,
0.5644706, 1.277536, -1.316304, 0, 0, 0, 1, 1,
0.5650728, -0.387752, 2.077747, 0, 0, 0, 1, 1,
0.5661571, 0.9874486, 1.176748, 1, 1, 1, 1, 1,
0.568651, 0.6120626, -0.1366377, 1, 1, 1, 1, 1,
0.5764192, 0.1056429, 1.974692, 1, 1, 1, 1, 1,
0.5774686, 0.1126184, 3.215352, 1, 1, 1, 1, 1,
0.578037, 0.4075264, 1.191221, 1, 1, 1, 1, 1,
0.5804361, -1.145838, 3.02572, 1, 1, 1, 1, 1,
0.5804443, 1.067194, 1.830008, 1, 1, 1, 1, 1,
0.5811647, 1.319339, 0.9549647, 1, 1, 1, 1, 1,
0.5812251, 1.279992, -0.03618346, 1, 1, 1, 1, 1,
0.5910796, -0.8805074, 3.109961, 1, 1, 1, 1, 1,
0.5925879, -0.9289814, 0.7833732, 1, 1, 1, 1, 1,
0.5932977, 1.032258, 0.2578542, 1, 1, 1, 1, 1,
0.5951418, 0.3092594, 2.591335, 1, 1, 1, 1, 1,
0.5960866, 0.6104037, 1.548811, 1, 1, 1, 1, 1,
0.598403, -0.9653065, 1.591235, 1, 1, 1, 1, 1,
0.5995833, -1.06106, 3.341269, 0, 0, 1, 1, 1,
0.6023721, 0.6719946, -0.1920733, 1, 0, 0, 1, 1,
0.6031598, 1.325275, 2.108555, 1, 0, 0, 1, 1,
0.6043221, 1.973493, -0.3992242, 1, 0, 0, 1, 1,
0.6078166, 1.503659, 1.795909, 1, 0, 0, 1, 1,
0.6182922, -0.01202184, 0.9909723, 1, 0, 0, 1, 1,
0.6183087, 0.6132193, 0.09775224, 0, 0, 0, 1, 1,
0.6218209, 0.4015216, -0.1271918, 0, 0, 0, 1, 1,
0.623363, 0.1775842, 1.537124, 0, 0, 0, 1, 1,
0.6277232, -0.4269271, 1.513873, 0, 0, 0, 1, 1,
0.62914, 1.60684, -0.01803566, 0, 0, 0, 1, 1,
0.6312827, 0.3019611, 1.527257, 0, 0, 0, 1, 1,
0.6337286, -0.5965186, 1.832237, 0, 0, 0, 1, 1,
0.6338848, -1.565407, 4.955713, 1, 1, 1, 1, 1,
0.6347838, -0.3774872, 1.062854, 1, 1, 1, 1, 1,
0.6390142, 0.3119676, 0.7505252, 1, 1, 1, 1, 1,
0.6418912, 0.77553, 1.247389, 1, 1, 1, 1, 1,
0.6447054, 1.199257, 0.5179261, 1, 1, 1, 1, 1,
0.6454017, 0.1756186, 1.866233, 1, 1, 1, 1, 1,
0.646946, 0.8601023, 1.432826, 1, 1, 1, 1, 1,
0.6496568, -0.6648721, 4.729682, 1, 1, 1, 1, 1,
0.6725349, 0.09405667, 1.706616, 1, 1, 1, 1, 1,
0.6742827, 1.131836, 0.958385, 1, 1, 1, 1, 1,
0.6748271, -0.5793631, 3.030779, 1, 1, 1, 1, 1,
0.6790674, -1.030293, 2.578681, 1, 1, 1, 1, 1,
0.6907225, 0.06981667, 0.4256721, 1, 1, 1, 1, 1,
0.6911436, 0.08612244, 2.832951, 1, 1, 1, 1, 1,
0.6941845, 1.52202, 1.117594, 1, 1, 1, 1, 1,
0.6979437, -0.5840251, 1.139891, 0, 0, 1, 1, 1,
0.7029743, 0.2813272, -0.9874439, 1, 0, 0, 1, 1,
0.7032934, 1.018131, -0.2018594, 1, 0, 0, 1, 1,
0.7091924, -0.9110411, 2.877841, 1, 0, 0, 1, 1,
0.7140949, 0.6544521, 3.231124, 1, 0, 0, 1, 1,
0.7149521, 0.7088437, 0.2275667, 1, 0, 0, 1, 1,
0.7179596, 0.1430346, 1.275368, 0, 0, 0, 1, 1,
0.7187539, -0.1594078, 2.98474, 0, 0, 0, 1, 1,
0.7194473, -0.3867875, 0.957313, 0, 0, 0, 1, 1,
0.7195573, 0.5505263, 0.6868174, 0, 0, 0, 1, 1,
0.7267177, 1.4685, 0.6038269, 0, 0, 0, 1, 1,
0.7275978, 0.9113297, 1.075993, 0, 0, 0, 1, 1,
0.7316085, -0.2063178, 1.480234, 0, 0, 0, 1, 1,
0.7359056, 0.8500563, -0.4220777, 1, 1, 1, 1, 1,
0.7408799, 0.5256828, 1.782055, 1, 1, 1, 1, 1,
0.7471289, -0.1049376, 0.355048, 1, 1, 1, 1, 1,
0.7480596, -1.446364, 5.008517, 1, 1, 1, 1, 1,
0.7498661, 1.600013, 0.4538562, 1, 1, 1, 1, 1,
0.7551889, 0.6538926, 0.9220048, 1, 1, 1, 1, 1,
0.7646619, -1.725124, 3.109213, 1, 1, 1, 1, 1,
0.7657516, -1.791265, 1.500416, 1, 1, 1, 1, 1,
0.7667136, 0.7557555, 2.687955, 1, 1, 1, 1, 1,
0.7696013, 0.6684635, 0.6231119, 1, 1, 1, 1, 1,
0.7872002, 0.3117358, 2.166806, 1, 1, 1, 1, 1,
0.7880754, -0.226692, 0.6992684, 1, 1, 1, 1, 1,
0.7924438, -1.224462, 3.474445, 1, 1, 1, 1, 1,
0.7929168, -1.794898, 1.956264, 1, 1, 1, 1, 1,
0.7942443, 0.3964855, 1.596197, 1, 1, 1, 1, 1,
0.7963821, 2.033497, 1.465389, 0, 0, 1, 1, 1,
0.7976964, -0.4561389, 0.7997731, 1, 0, 0, 1, 1,
0.8046783, -0.2570158, 1.792403, 1, 0, 0, 1, 1,
0.8061467, -1.480449, 3.700297, 1, 0, 0, 1, 1,
0.8069208, 0.2155211, 2.028517, 1, 0, 0, 1, 1,
0.810217, -0.8867002, 3.599501, 1, 0, 0, 1, 1,
0.8144091, 0.2527323, 2.976333, 0, 0, 0, 1, 1,
0.8155051, 0.1921176, -0.2382465, 0, 0, 0, 1, 1,
0.8184577, 0.4031337, 0.7900703, 0, 0, 0, 1, 1,
0.8210491, 0.6916505, 0.2464171, 0, 0, 0, 1, 1,
0.8226269, -0.4856203, 1.729473, 0, 0, 0, 1, 1,
0.8234329, -0.3954594, 1.069867, 0, 0, 0, 1, 1,
0.8259615, 2.559277, 1.19842, 0, 0, 0, 1, 1,
0.8291103, -0.4895193, 3.205725, 1, 1, 1, 1, 1,
0.8307979, -0.7807159, 3.212675, 1, 1, 1, 1, 1,
0.8317043, 0.6783885, 1.083402, 1, 1, 1, 1, 1,
0.8323526, 0.9951137, 0.1476245, 1, 1, 1, 1, 1,
0.8335275, 0.2878034, 2.701505, 1, 1, 1, 1, 1,
0.8354666, -1.039243, 3.503247, 1, 1, 1, 1, 1,
0.8364932, 0.3459744, 0.9991157, 1, 1, 1, 1, 1,
0.8394713, 0.9440148, 0.9120029, 1, 1, 1, 1, 1,
0.8432545, -0.7523878, 1.161873, 1, 1, 1, 1, 1,
0.8463969, 0.4138013, 0.2623388, 1, 1, 1, 1, 1,
0.8503745, -0.7382714, 3.93124, 1, 1, 1, 1, 1,
0.8504345, -1.410989, 2.210709, 1, 1, 1, 1, 1,
0.8525507, -1.049168, 1.698332, 1, 1, 1, 1, 1,
0.8621341, 0.3694757, 1.808154, 1, 1, 1, 1, 1,
0.8640574, 0.05008902, 1.435825, 1, 1, 1, 1, 1,
0.8703935, 0.4257472, 0.4434944, 0, 0, 1, 1, 1,
0.8706812, 1.557848, 0.5055552, 1, 0, 0, 1, 1,
0.8797475, -1.617733, 3.033827, 1, 0, 0, 1, 1,
0.8867649, -0.2270487, 0.5780794, 1, 0, 0, 1, 1,
0.8898118, -1.134949, 3.345521, 1, 0, 0, 1, 1,
0.8919023, 1.105757, 0.2937302, 1, 0, 0, 1, 1,
0.8921121, -0.5675437, 0.9528592, 0, 0, 0, 1, 1,
0.8927344, -0.6887387, 0.5993519, 0, 0, 0, 1, 1,
0.892853, -1.875042, 2.363379, 0, 0, 0, 1, 1,
0.8976391, 1.161374, 1.347342, 0, 0, 0, 1, 1,
0.899905, -0.4185618, 2.370627, 0, 0, 0, 1, 1,
0.9016947, -0.4145375, 1.178104, 0, 0, 0, 1, 1,
0.9023585, 0.1990373, 0.01333224, 0, 0, 0, 1, 1,
0.9031533, 2.014058, 0.9179059, 1, 1, 1, 1, 1,
0.9055814, 0.2159323, 0.7269479, 1, 1, 1, 1, 1,
0.9203544, -1.377853, 2.114423, 1, 1, 1, 1, 1,
0.9314167, -0.6987006, 0.9182587, 1, 1, 1, 1, 1,
0.9331929, -1.582143, 3.026791, 1, 1, 1, 1, 1,
0.9400863, -0.1080527, 1.416985, 1, 1, 1, 1, 1,
0.9523813, -0.7809246, 1.234709, 1, 1, 1, 1, 1,
0.9600157, 1.042369, 1.192143, 1, 1, 1, 1, 1,
0.9626139, -0.9636452, 1.160519, 1, 1, 1, 1, 1,
0.9683538, -0.1705271, 2.540331, 1, 1, 1, 1, 1,
0.9749584, -1.159559, 2.233684, 1, 1, 1, 1, 1,
0.9762056, 0.7647578, -1.74333, 1, 1, 1, 1, 1,
0.9772033, 1.506803, 1.044187, 1, 1, 1, 1, 1,
0.9794529, -2.21342, 3.599852, 1, 1, 1, 1, 1,
0.981604, -0.4604734, 1.408408, 1, 1, 1, 1, 1,
0.9856982, -1.008091, 3.693859, 0, 0, 1, 1, 1,
0.9916052, 1.792521, 2.813215, 1, 0, 0, 1, 1,
0.9918286, 0.2932913, 0.1905575, 1, 0, 0, 1, 1,
0.9942412, -0.288431, 3.983962, 1, 0, 0, 1, 1,
0.9964045, -2.112949, 1.473455, 1, 0, 0, 1, 1,
0.9972795, 0.2714314, 1.68568, 1, 0, 0, 1, 1,
0.9997879, 0.3760715, 1.351363, 0, 0, 0, 1, 1,
1.001048, 0.8378327, 0.136271, 0, 0, 0, 1, 1,
1.00178, 0.01166346, 2.528037, 0, 0, 0, 1, 1,
1.003089, -0.2416783, 2.131504, 0, 0, 0, 1, 1,
1.00763, 1.37453, 0.9020081, 0, 0, 0, 1, 1,
1.015671, 0.8985087, 1.966991, 0, 0, 0, 1, 1,
1.021375, -1.06312, 0.8148001, 0, 0, 0, 1, 1,
1.025768, -0.5649077, 2.308066, 1, 1, 1, 1, 1,
1.028657, 1.192168, 1.758386, 1, 1, 1, 1, 1,
1.049931, 0.5097617, 1.884104, 1, 1, 1, 1, 1,
1.050991, 0.6762231, 1.830613, 1, 1, 1, 1, 1,
1.070019, 0.03547337, 2.116933, 1, 1, 1, 1, 1,
1.078495, 0.8556811, 1.378633, 1, 1, 1, 1, 1,
1.082186, -0.8000268, 2.696407, 1, 1, 1, 1, 1,
1.085617, -0.2278135, 2.403052, 1, 1, 1, 1, 1,
1.090051, -0.8370498, 3.222598, 1, 1, 1, 1, 1,
1.091163, 1.159471, 1.425001, 1, 1, 1, 1, 1,
1.09271, -1.714719, 3.186112, 1, 1, 1, 1, 1,
1.095279, 1.777723, -0.534497, 1, 1, 1, 1, 1,
1.099382, -0.4749275, 2.178826, 1, 1, 1, 1, 1,
1.108035, 1.038488, 0.4939148, 1, 1, 1, 1, 1,
1.109392, 0.007625549, 0.5032337, 1, 1, 1, 1, 1,
1.115071, -0.2958573, 1.486777, 0, 0, 1, 1, 1,
1.118977, 1.158998, 0.8534961, 1, 0, 0, 1, 1,
1.122276, 0.6236408, 1.449514, 1, 0, 0, 1, 1,
1.128933, -0.976864, 1.668312, 1, 0, 0, 1, 1,
1.130124, 0.2773751, 1.426841, 1, 0, 0, 1, 1,
1.131518, 0.1509906, 1.867779, 1, 0, 0, 1, 1,
1.134684, -0.5505834, 2.584143, 0, 0, 0, 1, 1,
1.134959, 0.1131874, 4.138483, 0, 0, 0, 1, 1,
1.135424, -1.850539, 1.082074, 0, 0, 0, 1, 1,
1.144012, 0.8309837, 0.855027, 0, 0, 0, 1, 1,
1.14839, 0.3682806, 0.7564186, 0, 0, 0, 1, 1,
1.149509, 0.6950139, 0.2074492, 0, 0, 0, 1, 1,
1.149871, 0.6866024, 1.816825, 0, 0, 0, 1, 1,
1.151821, -0.5894808, 2.745228, 1, 1, 1, 1, 1,
1.155787, -0.504775, 1.407313, 1, 1, 1, 1, 1,
1.156606, -1.451639, 5.042182, 1, 1, 1, 1, 1,
1.16356, 1.103948, -1.445075, 1, 1, 1, 1, 1,
1.16374, -0.574176, 1.473405, 1, 1, 1, 1, 1,
1.171408, -0.8495274, 2.529304, 1, 1, 1, 1, 1,
1.174999, -0.5105963, 2.022029, 1, 1, 1, 1, 1,
1.176476, -0.9319398, 1.447591, 1, 1, 1, 1, 1,
1.178476, 1.71334, 0.9042686, 1, 1, 1, 1, 1,
1.180132, -0.536226, 1.847464, 1, 1, 1, 1, 1,
1.188826, -0.1241353, 2.822229, 1, 1, 1, 1, 1,
1.19098, 0.392478, 2.331091, 1, 1, 1, 1, 1,
1.191192, -1.190513, 1.559239, 1, 1, 1, 1, 1,
1.194001, 1.569815, -0.3375787, 1, 1, 1, 1, 1,
1.202402, 0.5548193, 0.7469388, 1, 1, 1, 1, 1,
1.202556, -0.5922586, 2.035318, 0, 0, 1, 1, 1,
1.202866, -0.3841493, 0.1167691, 1, 0, 0, 1, 1,
1.20317, 0.2040292, 3.758061, 1, 0, 0, 1, 1,
1.207466, -0.6755489, 3.230576, 1, 0, 0, 1, 1,
1.218625, -0.03399968, 2.276949, 1, 0, 0, 1, 1,
1.234072, -1.087678, 2.751253, 1, 0, 0, 1, 1,
1.236671, -0.2733082, 1.380142, 0, 0, 0, 1, 1,
1.243632, -0.2119503, 3.527416, 0, 0, 0, 1, 1,
1.250733, 0.3342476, 0.2714797, 0, 0, 0, 1, 1,
1.259939, 0.4392901, 2.19511, 0, 0, 0, 1, 1,
1.267333, -0.4260758, 0.7005004, 0, 0, 0, 1, 1,
1.269061, 0.2759513, 1.061891, 0, 0, 0, 1, 1,
1.28163, -0.1837612, 2.017929, 0, 0, 0, 1, 1,
1.284738, 0.9439616, 0.03703983, 1, 1, 1, 1, 1,
1.297169, 1.601492, 0.2740818, 1, 1, 1, 1, 1,
1.303417, -1.150317, 1.728971, 1, 1, 1, 1, 1,
1.303762, 1.54626, 1.439036, 1, 1, 1, 1, 1,
1.326015, -1.510102, 0.5540759, 1, 1, 1, 1, 1,
1.330204, -1.004494, 2.142856, 1, 1, 1, 1, 1,
1.339892, -0.4068748, 2.091493, 1, 1, 1, 1, 1,
1.34139, 0.1070319, 1.441703, 1, 1, 1, 1, 1,
1.368924, 0.2219717, 2.664891, 1, 1, 1, 1, 1,
1.375884, -0.6962351, 1.735175, 1, 1, 1, 1, 1,
1.381294, -1.021858, 2.483636, 1, 1, 1, 1, 1,
1.382514, -1.635789, 1.241088, 1, 1, 1, 1, 1,
1.386289, 1.424577, 1.521785, 1, 1, 1, 1, 1,
1.387245, -0.6215339, 2.225832, 1, 1, 1, 1, 1,
1.387278, 0.2721345, 0.81844, 1, 1, 1, 1, 1,
1.389752, -0.2106762, 1.174139, 0, 0, 1, 1, 1,
1.391115, 0.8570761, -0.2880335, 1, 0, 0, 1, 1,
1.394529, 1.540209, 1.010807, 1, 0, 0, 1, 1,
1.398285, 1.877076, -0.1899056, 1, 0, 0, 1, 1,
1.412518, 0.05149715, 1.012604, 1, 0, 0, 1, 1,
1.414763, -1.648702, 2.399211, 1, 0, 0, 1, 1,
1.41735, 0.6551882, -0.5726618, 0, 0, 0, 1, 1,
1.42974, -1.463215, 1.945566, 0, 0, 0, 1, 1,
1.433715, -0.3617311, 0.2967259, 0, 0, 0, 1, 1,
1.43622, 0.8058155, 1.251436, 0, 0, 0, 1, 1,
1.436991, -0.5631943, 1.955844, 0, 0, 0, 1, 1,
1.452867, -1.905027, 2.821743, 0, 0, 0, 1, 1,
1.478142, -0.3597078, 3.59369, 0, 0, 0, 1, 1,
1.48368, 1.02538, 1.462185, 1, 1, 1, 1, 1,
1.484369, -0.3683212, 2.700482, 1, 1, 1, 1, 1,
1.48974, 1.417616, 2.754652, 1, 1, 1, 1, 1,
1.493167, -0.9253826, 3.147093, 1, 1, 1, 1, 1,
1.508683, -0.3620949, 0.8401881, 1, 1, 1, 1, 1,
1.509562, -0.1146251, 2.179235, 1, 1, 1, 1, 1,
1.512165, 0.1475161, 0.579429, 1, 1, 1, 1, 1,
1.524617, 0.06508244, 2.614742, 1, 1, 1, 1, 1,
1.526052, -1.0317, 2.344852, 1, 1, 1, 1, 1,
1.534793, -2.730424, 0.7401699, 1, 1, 1, 1, 1,
1.53959, 0.590652, 1.460083, 1, 1, 1, 1, 1,
1.556361, -1.233691, 2.304827, 1, 1, 1, 1, 1,
1.562615, -1.039328, 3.985628, 1, 1, 1, 1, 1,
1.585259, -1.803867, 2.040988, 1, 1, 1, 1, 1,
1.585663, 0.04754419, 1.806451, 1, 1, 1, 1, 1,
1.599866, -0.2261234, 1.316124, 0, 0, 1, 1, 1,
1.600204, 0.4759586, 1.22126, 1, 0, 0, 1, 1,
1.601979, -0.4217083, 2.61388, 1, 0, 0, 1, 1,
1.62816, -1.121499, 2.304851, 1, 0, 0, 1, 1,
1.63901, -0.7733123, 2.180872, 1, 0, 0, 1, 1,
1.644987, 0.7387473, 2.369623, 1, 0, 0, 1, 1,
1.650675, -0.2979417, 0.2138893, 0, 0, 0, 1, 1,
1.654698, -0.484613, 2.561476, 0, 0, 0, 1, 1,
1.654749, -1.010285, 3.038808, 0, 0, 0, 1, 1,
1.661194, 0.3228937, 0.8449218, 0, 0, 0, 1, 1,
1.668058, -0.2092656, 0.2980348, 0, 0, 0, 1, 1,
1.671784, -1.944432, 0.9281243, 0, 0, 0, 1, 1,
1.672042, 0.6677985, 3.181769, 0, 0, 0, 1, 1,
1.696177, 0.7435578, 1.625645, 1, 1, 1, 1, 1,
1.701063, -0.6949171, 1.61321, 1, 1, 1, 1, 1,
1.743309, -0.7832025, 3.164715, 1, 1, 1, 1, 1,
1.777714, -0.4262938, 2.646571, 1, 1, 1, 1, 1,
1.798454, 0.4706653, 1.999012, 1, 1, 1, 1, 1,
1.807956, 0.3699772, 3.010848, 1, 1, 1, 1, 1,
1.851448, -1.232116, 2.768542, 1, 1, 1, 1, 1,
1.875805, 0.3703628, 0.9006238, 1, 1, 1, 1, 1,
1.882333, 0.01103444, 1.642344, 1, 1, 1, 1, 1,
1.893703, -0.3289381, 0.0872078, 1, 1, 1, 1, 1,
1.910672, -0.4574955, 2.740821, 1, 1, 1, 1, 1,
1.971403, -1.147052, 2.240407, 1, 1, 1, 1, 1,
1.987713, -0.09051569, 1.348402, 1, 1, 1, 1, 1,
2.026506, 0.1157104, 0.9114934, 1, 1, 1, 1, 1,
2.03505, -0.9962453, 1.869642, 1, 1, 1, 1, 1,
2.066674, -0.5858709, 2.68693, 0, 0, 1, 1, 1,
2.072623, 0.8506284, 2.340663, 1, 0, 0, 1, 1,
2.179808, 0.3644103, 2.671858, 1, 0, 0, 1, 1,
2.188586, 0.7054873, 1.479481, 1, 0, 0, 1, 1,
2.214759, 0.2202989, 1.211916, 1, 0, 0, 1, 1,
2.246872, 1.127901, -0.1012281, 1, 0, 0, 1, 1,
2.258771, 0.3844373, 0.7306786, 0, 0, 0, 1, 1,
2.286487, 1.743563, -0.9660592, 0, 0, 0, 1, 1,
2.452238, -2.492992, 2.511704, 0, 0, 0, 1, 1,
2.485529, 0.04723507, 1.646834, 0, 0, 0, 1, 1,
2.564189, 0.8979177, -0.7240454, 0, 0, 0, 1, 1,
2.643645, 0.2143063, 1.999342, 0, 0, 0, 1, 1,
2.650243, -0.3700088, 0.3287887, 0, 0, 0, 1, 1,
2.676325, -0.8449578, 1.774119, 1, 1, 1, 1, 1,
2.921306, 0.1834065, 2.244491, 1, 1, 1, 1, 1,
3.028165, -0.2024545, 0.5862721, 1, 1, 1, 1, 1,
3.072756, 0.5433289, 1.416329, 1, 1, 1, 1, 1,
3.170628, -0.05961336, 0.6489355, 1, 1, 1, 1, 1,
3.245051, -0.07598552, 0.2789088, 1, 1, 1, 1, 1,
3.671581, 1.545421, 1.174834, 1, 1, 1, 1, 1
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
var radius = 9.737132;
var distance = 34.20126;
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
mvMatrix.translate( -0.2010193, 0.08557343, 0.5560997 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.20126);
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
