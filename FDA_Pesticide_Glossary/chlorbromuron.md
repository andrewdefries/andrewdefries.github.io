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
-2.964682, 1.336802, -0.7555352, 1, 0, 0, 1,
-2.94178, 0.8514308, -1.777157, 1, 0.007843138, 0, 1,
-2.784948, 0.14323, -2.188632, 1, 0.01176471, 0, 1,
-2.601728, -0.5447797, -1.723673, 1, 0.01960784, 0, 1,
-2.586719, 0.775986, -0.7113687, 1, 0.02352941, 0, 1,
-2.528838, 0.2405523, -1.139703, 1, 0.03137255, 0, 1,
-2.426615, 0.8229052, -1.241487, 1, 0.03529412, 0, 1,
-2.419852, -2.113902, -0.07009993, 1, 0.04313726, 0, 1,
-2.332941, -0.111342, -2.073993, 1, 0.04705882, 0, 1,
-2.299725, -0.23216, -2.888528, 1, 0.05490196, 0, 1,
-2.287803, -0.1098142, -2.520069, 1, 0.05882353, 0, 1,
-2.220473, 0.763671, -1.4931, 1, 0.06666667, 0, 1,
-2.158879, 0.2315231, -2.05911, 1, 0.07058824, 0, 1,
-2.124863, -0.7148222, -1.76884, 1, 0.07843138, 0, 1,
-2.107353, -2.334039, -2.432569, 1, 0.08235294, 0, 1,
-2.094544, -0.5087261, -2.800429, 1, 0.09019608, 0, 1,
-2.089538, -0.842538, -3.751565, 1, 0.09411765, 0, 1,
-2.042714, 1.416203, -2.807601, 1, 0.1019608, 0, 1,
-2.038753, -1.03824, -0.8933283, 1, 0.1098039, 0, 1,
-2.014414, 0.221594, -1.499416, 1, 0.1137255, 0, 1,
-2.008362, -0.7676356, -2.317508, 1, 0.1215686, 0, 1,
-1.986836, 0.307705, -1.881322, 1, 0.1254902, 0, 1,
-1.974438, -0.4352975, -3.035432, 1, 0.1333333, 0, 1,
-1.954207, -0.771768, -1.834059, 1, 0.1372549, 0, 1,
-1.945232, 1.138215, -1.292481, 1, 0.145098, 0, 1,
-1.933438, 0.1710737, -1.649709, 1, 0.1490196, 0, 1,
-1.922815, 0.2131285, -2.254747, 1, 0.1568628, 0, 1,
-1.918349, -1.893164, -1.153684, 1, 0.1607843, 0, 1,
-1.893666, -0.0877566, 0.2545362, 1, 0.1686275, 0, 1,
-1.891603, 1.918972, -0.8395754, 1, 0.172549, 0, 1,
-1.862647, 0.6647353, -0.5606284, 1, 0.1803922, 0, 1,
-1.862222, 1.057659, -0.5113851, 1, 0.1843137, 0, 1,
-1.848411, -2.294777, -1.744029, 1, 0.1921569, 0, 1,
-1.814743, -0.5835464, -2.764848, 1, 0.1960784, 0, 1,
-1.81395, 0.8969818, 0.6537011, 1, 0.2039216, 0, 1,
-1.799849, 0.144615, -1.04335, 1, 0.2117647, 0, 1,
-1.783449, 0.7873033, -1.008639, 1, 0.2156863, 0, 1,
-1.76457, -1.312584, -2.310368, 1, 0.2235294, 0, 1,
-1.76147, 0.4350482, -1.620053, 1, 0.227451, 0, 1,
-1.75616, -1.139463, -0.645233, 1, 0.2352941, 0, 1,
-1.752812, 1.691593, -1.863964, 1, 0.2392157, 0, 1,
-1.739234, 1.381735, -1.789658, 1, 0.2470588, 0, 1,
-1.723436, 0.5893364, -0.6217076, 1, 0.2509804, 0, 1,
-1.722874, -0.5757908, -1.662285, 1, 0.2588235, 0, 1,
-1.711789, -0.08302709, -1.109281, 1, 0.2627451, 0, 1,
-1.698398, 0.6219183, 2.206175, 1, 0.2705882, 0, 1,
-1.691481, -0.1915594, -3.226269, 1, 0.2745098, 0, 1,
-1.686163, -0.3905741, -1.723418, 1, 0.282353, 0, 1,
-1.682963, 0.3909036, -1.484174, 1, 0.2862745, 0, 1,
-1.673303, -0.6987147, -1.366632, 1, 0.2941177, 0, 1,
-1.656525, 1.80192, -1.655422, 1, 0.3019608, 0, 1,
-1.649352, 0.3230095, -1.776904, 1, 0.3058824, 0, 1,
-1.637368, -0.9084329, -4.106097, 1, 0.3137255, 0, 1,
-1.635189, -1.182926, -1.01235, 1, 0.3176471, 0, 1,
-1.619035, -0.486474, -1.624893, 1, 0.3254902, 0, 1,
-1.610792, -0.2629716, -0.3719899, 1, 0.3294118, 0, 1,
-1.609237, -1.327923, -2.315657, 1, 0.3372549, 0, 1,
-1.599595, -0.4722876, -1.591317, 1, 0.3411765, 0, 1,
-1.586702, 0.4335242, -1.599719, 1, 0.3490196, 0, 1,
-1.56599, 0.3263174, -1.287233, 1, 0.3529412, 0, 1,
-1.552934, -0.3709463, -0.8962162, 1, 0.3607843, 0, 1,
-1.548142, -1.343183, -1.354471, 1, 0.3647059, 0, 1,
-1.544692, 0.4023592, -1.738436, 1, 0.372549, 0, 1,
-1.536814, 0.05916505, -2.52422, 1, 0.3764706, 0, 1,
-1.535923, -0.3794682, -2.919237, 1, 0.3843137, 0, 1,
-1.529981, -1.702878, -4.381274, 1, 0.3882353, 0, 1,
-1.525437, 1.265631, 0.7378865, 1, 0.3960784, 0, 1,
-1.502824, -0.2505238, -0.6830863, 1, 0.4039216, 0, 1,
-1.500299, 0.4150081, -0.07827386, 1, 0.4078431, 0, 1,
-1.491845, 1.53068, -1.483744, 1, 0.4156863, 0, 1,
-1.469754, -0.8286838, 0.01168942, 1, 0.4196078, 0, 1,
-1.464205, -1.549826, -3.307717, 1, 0.427451, 0, 1,
-1.463414, -0.07920226, -1.447168, 1, 0.4313726, 0, 1,
-1.45992, 1.264908, -1.50369, 1, 0.4392157, 0, 1,
-1.450102, -1.823146, -2.684454, 1, 0.4431373, 0, 1,
-1.449045, 1.149302, -1.800862, 1, 0.4509804, 0, 1,
-1.438529, -0.6502547, -1.900655, 1, 0.454902, 0, 1,
-1.434106, 0.7846872, -1.042116, 1, 0.4627451, 0, 1,
-1.432766, 0.1369708, -1.877206, 1, 0.4666667, 0, 1,
-1.425783, -0.05646527, -1.288513, 1, 0.4745098, 0, 1,
-1.420715, 1.211734, -0.4508235, 1, 0.4784314, 0, 1,
-1.408942, 1.362188, -3.120293, 1, 0.4862745, 0, 1,
-1.408399, -0.9914911, -4.173113, 1, 0.4901961, 0, 1,
-1.407484, 0.1654317, -1.955312, 1, 0.4980392, 0, 1,
-1.397904, 0.9753591, -1.303126, 1, 0.5058824, 0, 1,
-1.395017, -1.032155, -1.582695, 1, 0.509804, 0, 1,
-1.383278, -0.3799485, -2.00634, 1, 0.5176471, 0, 1,
-1.382045, -1.497726, -2.944023, 1, 0.5215687, 0, 1,
-1.381559, 0.4242465, -0.65076, 1, 0.5294118, 0, 1,
-1.379943, 0.470978, -0.6292161, 1, 0.5333334, 0, 1,
-1.37334, 0.9976335, -1.180894, 1, 0.5411765, 0, 1,
-1.372202, -1.192225, -3.937224, 1, 0.5450981, 0, 1,
-1.369328, 0.3775401, -2.819624, 1, 0.5529412, 0, 1,
-1.36678, -0.3115218, -3.060288, 1, 0.5568628, 0, 1,
-1.364952, 0.5648792, -0.9199246, 1, 0.5647059, 0, 1,
-1.34504, -1.504081, -3.972348, 1, 0.5686275, 0, 1,
-1.344612, 0.3212072, -1.992682, 1, 0.5764706, 0, 1,
-1.344136, -0.5645236, -1.987655, 1, 0.5803922, 0, 1,
-1.331124, 1.140578, 0.6236657, 1, 0.5882353, 0, 1,
-1.329856, -0.4682512, -3.588546, 1, 0.5921569, 0, 1,
-1.32878, 0.7787689, -1.064591, 1, 0.6, 0, 1,
-1.318697, 0.4686528, -1.737545, 1, 0.6078432, 0, 1,
-1.315017, 0.3009311, -1.796269, 1, 0.6117647, 0, 1,
-1.313129, 0.6661748, -1.275112, 1, 0.6196079, 0, 1,
-1.30712, 0.1465242, -0.7092148, 1, 0.6235294, 0, 1,
-1.306491, -0.3717409, -3.556565, 1, 0.6313726, 0, 1,
-1.301711, 1.502512, -0.8306419, 1, 0.6352941, 0, 1,
-1.300638, 0.2439769, -2.284542, 1, 0.6431373, 0, 1,
-1.292569, -0.3930214, -1.813717, 1, 0.6470588, 0, 1,
-1.285455, -1.13746, -4.003621, 1, 0.654902, 0, 1,
-1.284251, -0.8461866, -3.433395, 1, 0.6588235, 0, 1,
-1.280206, -0.4151883, 0.7168148, 1, 0.6666667, 0, 1,
-1.278269, -1.022423, -3.250931, 1, 0.6705883, 0, 1,
-1.271626, -0.798281, -1.496215, 1, 0.6784314, 0, 1,
-1.268965, 0.2648576, 0.7324595, 1, 0.682353, 0, 1,
-1.266138, 0.3903686, 0.6286011, 1, 0.6901961, 0, 1,
-1.264616, 0.2062686, -1.218645, 1, 0.6941177, 0, 1,
-1.254795, -2.128092, -3.269778, 1, 0.7019608, 0, 1,
-1.242978, 0.3613182, -1.246876, 1, 0.7098039, 0, 1,
-1.241322, 0.6657748, -0.1334571, 1, 0.7137255, 0, 1,
-1.231036, -1.083178, -1.239682, 1, 0.7215686, 0, 1,
-1.228558, 2.635477, -0.4104398, 1, 0.7254902, 0, 1,
-1.224355, -0.104684, -2.773238, 1, 0.7333333, 0, 1,
-1.218655, 2.131961, -0.9584381, 1, 0.7372549, 0, 1,
-1.210853, -1.066327, -2.498713, 1, 0.7450981, 0, 1,
-1.201934, -0.4447474, -2.153805, 1, 0.7490196, 0, 1,
-1.19818, 0.2155624, -0.2753781, 1, 0.7568628, 0, 1,
-1.197912, -0.1376573, -0.3857971, 1, 0.7607843, 0, 1,
-1.19319, -0.4396127, -3.009302, 1, 0.7686275, 0, 1,
-1.184864, 0.9876904, -0.3983362, 1, 0.772549, 0, 1,
-1.179232, -0.8878335, -1.653853, 1, 0.7803922, 0, 1,
-1.175347, -0.1532138, -2.137745, 1, 0.7843137, 0, 1,
-1.174223, -1.291047, -1.951237, 1, 0.7921569, 0, 1,
-1.173614, 0.03594667, -0.9125583, 1, 0.7960784, 0, 1,
-1.171756, 1.320219, -2.232455, 1, 0.8039216, 0, 1,
-1.150829, 0.5527202, -1.450646, 1, 0.8117647, 0, 1,
-1.150705, -0.5481476, -1.799239, 1, 0.8156863, 0, 1,
-1.150473, -1.077178, -1.670474, 1, 0.8235294, 0, 1,
-1.149838, -1.509205, -1.939451, 1, 0.827451, 0, 1,
-1.148136, 0.3212457, -0.3990225, 1, 0.8352941, 0, 1,
-1.144064, -1.294026, -1.91646, 1, 0.8392157, 0, 1,
-1.137142, -1.06856, -3.134708, 1, 0.8470588, 0, 1,
-1.13573, -0.1311404, -1.852771, 1, 0.8509804, 0, 1,
-1.128969, -0.2724366, -2.969257, 1, 0.8588235, 0, 1,
-1.117631, 1.413419, 1.117915, 1, 0.8627451, 0, 1,
-1.115456, 0.6778663, -2.052153, 1, 0.8705882, 0, 1,
-1.108549, -0.5677386, -4.581289, 1, 0.8745098, 0, 1,
-1.105786, 1.454637, 0.01654954, 1, 0.8823529, 0, 1,
-1.105495, 0.8436337, -3.193854, 1, 0.8862745, 0, 1,
-1.101574, -0.6298994, -1.613192, 1, 0.8941177, 0, 1,
-1.096579, 0.5568053, -1.546952, 1, 0.8980392, 0, 1,
-1.090802, 2.066944, -0.9957421, 1, 0.9058824, 0, 1,
-1.08534, -0.9042952, -1.399424, 1, 0.9137255, 0, 1,
-1.083512, 1.005041, -1.427457, 1, 0.9176471, 0, 1,
-1.076274, 0.1912979, 0.3268131, 1, 0.9254902, 0, 1,
-1.071191, 1.724228, 0.3209763, 1, 0.9294118, 0, 1,
-1.068294, -0.2903493, -1.155802, 1, 0.9372549, 0, 1,
-1.059354, -1.113167, -3.15269, 1, 0.9411765, 0, 1,
-1.059277, 0.4157777, -2.451569, 1, 0.9490196, 0, 1,
-1.05569, 0.3029847, 0.5740642, 1, 0.9529412, 0, 1,
-1.053943, 1.408584, -0.9411561, 1, 0.9607843, 0, 1,
-1.046755, -0.02213501, -2.432153, 1, 0.9647059, 0, 1,
-1.041357, -0.3426282, -3.185044, 1, 0.972549, 0, 1,
-1.037983, 0.4089113, -1.307632, 1, 0.9764706, 0, 1,
-1.034582, 1.822778, -2.970948, 1, 0.9843137, 0, 1,
-1.031905, 0.8669282, -1.089749, 1, 0.9882353, 0, 1,
-1.029852, -0.09752947, -3.527141, 1, 0.9960784, 0, 1,
-1.026322, -1.203901, -3.212543, 0.9960784, 1, 0, 1,
-1.023287, 0.5019915, -1.972256, 0.9921569, 1, 0, 1,
-1.016302, -0.6896792, -1.274208, 0.9843137, 1, 0, 1,
-1.014743, 1.164747, 0.2905157, 0.9803922, 1, 0, 1,
-1.011102, -1.406191, -2.394892, 0.972549, 1, 0, 1,
-1.008118, 1.212526, -0.3140166, 0.9686275, 1, 0, 1,
-1.005803, -0.5005338, -1.9201, 0.9607843, 1, 0, 1,
-1.000726, 0.4615519, -1.442073, 0.9568627, 1, 0, 1,
-0.99799, -0.007975649, -0.8977613, 0.9490196, 1, 0, 1,
-0.9972675, 0.7039155, -0.8006058, 0.945098, 1, 0, 1,
-0.9950208, 1.099462, -0.7966956, 0.9372549, 1, 0, 1,
-0.9940143, -0.5181488, -0.8393088, 0.9333333, 1, 0, 1,
-0.9925715, 0.04537491, -0.5935888, 0.9254902, 1, 0, 1,
-0.984026, 0.1708041, -0.8241103, 0.9215686, 1, 0, 1,
-0.9792922, -0.3295645, -1.86267, 0.9137255, 1, 0, 1,
-0.976469, -0.2182392, -3.657236, 0.9098039, 1, 0, 1,
-0.9734581, -0.5614302, -2.216418, 0.9019608, 1, 0, 1,
-0.9637975, -0.7605358, -0.9403188, 0.8941177, 1, 0, 1,
-0.958895, -0.7692592, -2.679653, 0.8901961, 1, 0, 1,
-0.9586145, 0.4321825, 1.268272, 0.8823529, 1, 0, 1,
-0.9576409, 0.977421, -1.667216, 0.8784314, 1, 0, 1,
-0.955242, 0.5621077, -3.169958, 0.8705882, 1, 0, 1,
-0.9545419, -0.08338729, -2.963091, 0.8666667, 1, 0, 1,
-0.9536558, 0.3203498, -2.752402, 0.8588235, 1, 0, 1,
-0.9493017, -0.3742675, -1.896004, 0.854902, 1, 0, 1,
-0.9462785, -1.088383, -1.439519, 0.8470588, 1, 0, 1,
-0.9444354, -1.263382, -2.041069, 0.8431373, 1, 0, 1,
-0.9440711, 0.5896169, -2.368608, 0.8352941, 1, 0, 1,
-0.9428851, 0.8176007, -0.4561358, 0.8313726, 1, 0, 1,
-0.933432, 0.1966099, -1.47429, 0.8235294, 1, 0, 1,
-0.9333994, 1.615749, -0.8354365, 0.8196079, 1, 0, 1,
-0.9283809, 0.2878602, -1.702448, 0.8117647, 1, 0, 1,
-0.9235477, -0.06848042, -3.078908, 0.8078431, 1, 0, 1,
-0.9218321, -3.399162e-05, -0.8861607, 0.8, 1, 0, 1,
-0.9213343, -1.022052, -2.968454, 0.7921569, 1, 0, 1,
-0.9206941, -0.2705731, -0.99125, 0.7882353, 1, 0, 1,
-0.9187742, 1.185134, -0.2807363, 0.7803922, 1, 0, 1,
-0.9143124, 0.7325896, 0.1389416, 0.7764706, 1, 0, 1,
-0.9118612, 0.3954085, -1.175068, 0.7686275, 1, 0, 1,
-0.9097287, -1.261571, -4.044835, 0.7647059, 1, 0, 1,
-0.9084106, 0.0404158, -0.4220854, 0.7568628, 1, 0, 1,
-0.9083297, 0.4422089, -0.6420463, 0.7529412, 1, 0, 1,
-0.9060506, -2.389952, -3.302548, 0.7450981, 1, 0, 1,
-0.9003548, 0.397168, -1.575554, 0.7411765, 1, 0, 1,
-0.8978265, 0.9605947, 0.1146804, 0.7333333, 1, 0, 1,
-0.8934122, -0.8786945, -0.4189763, 0.7294118, 1, 0, 1,
-0.8903533, -0.5753595, -3.080118, 0.7215686, 1, 0, 1,
-0.8858858, 1.186295, -0.8501738, 0.7176471, 1, 0, 1,
-0.8789818, -0.7751743, -3.191474, 0.7098039, 1, 0, 1,
-0.8740014, 0.9580891, -1.72556, 0.7058824, 1, 0, 1,
-0.8706072, -1.73901, -3.719421, 0.6980392, 1, 0, 1,
-0.867311, -0.1350364, -1.17657, 0.6901961, 1, 0, 1,
-0.8601669, 0.7349118, 1.292719, 0.6862745, 1, 0, 1,
-0.858043, -2.523539, -3.189582, 0.6784314, 1, 0, 1,
-0.8561977, 0.5519618, -0.514135, 0.6745098, 1, 0, 1,
-0.8527634, -1.409126, -2.065048, 0.6666667, 1, 0, 1,
-0.8524531, -1.019358, -2.159102, 0.6627451, 1, 0, 1,
-0.8522102, -0.04409553, -1.355407, 0.654902, 1, 0, 1,
-0.8482974, -0.7502847, -1.436867, 0.6509804, 1, 0, 1,
-0.8443199, -1.258644, -2.494778, 0.6431373, 1, 0, 1,
-0.8342577, 0.02229504, -1.672423, 0.6392157, 1, 0, 1,
-0.823827, -0.3931629, -1.19337, 0.6313726, 1, 0, 1,
-0.8226395, 0.1256385, 0.6358512, 0.627451, 1, 0, 1,
-0.8201075, 0.3887588, 1.261982, 0.6196079, 1, 0, 1,
-0.8141057, -1.384644, -2.43654, 0.6156863, 1, 0, 1,
-0.8119661, 0.8148694, -0.2555273, 0.6078432, 1, 0, 1,
-0.8082592, -0.362566, -2.331191, 0.6039216, 1, 0, 1,
-0.8063608, -0.3205022, -1.328686, 0.5960785, 1, 0, 1,
-0.8021139, -0.3552357, -4.207067, 0.5882353, 1, 0, 1,
-0.7941633, 1.022617, 0.2398077, 0.5843138, 1, 0, 1,
-0.78719, 2.028435, -1.74691, 0.5764706, 1, 0, 1,
-0.7853301, -0.7339598, -2.703807, 0.572549, 1, 0, 1,
-0.7830979, -2.110453, -3.256137, 0.5647059, 1, 0, 1,
-0.7820063, -0.2256581, -1.986999, 0.5607843, 1, 0, 1,
-0.7768189, -0.3645793, -3.528827, 0.5529412, 1, 0, 1,
-0.7754785, 1.866385, -0.9876706, 0.5490196, 1, 0, 1,
-0.7708451, -0.469375, -0.6865244, 0.5411765, 1, 0, 1,
-0.7698597, -0.9101886, -2.074219, 0.5372549, 1, 0, 1,
-0.7611409, -0.4450289, -1.962382, 0.5294118, 1, 0, 1,
-0.7570567, 2.010162, -1.034584, 0.5254902, 1, 0, 1,
-0.7569134, 0.463399, -1.852967, 0.5176471, 1, 0, 1,
-0.7550818, 1.08955, 0.4881731, 0.5137255, 1, 0, 1,
-0.745197, -1.02007, -3.500572, 0.5058824, 1, 0, 1,
-0.7432662, -1.573896, -2.153349, 0.5019608, 1, 0, 1,
-0.7419943, 0.376252, -0.5624501, 0.4941176, 1, 0, 1,
-0.7396687, -0.125279, -1.367434, 0.4862745, 1, 0, 1,
-0.7302577, -3.039928, -2.382734, 0.4823529, 1, 0, 1,
-0.7295952, -0.1128892, -1.701414, 0.4745098, 1, 0, 1,
-0.7243528, -1.272423, -3.154874, 0.4705882, 1, 0, 1,
-0.7156453, -1.388559, -2.362613, 0.4627451, 1, 0, 1,
-0.7128224, -1.570217, -3.348609, 0.4588235, 1, 0, 1,
-0.7099436, 1.44564, -0.9227182, 0.4509804, 1, 0, 1,
-0.7078641, -0.4427942, -1.316329, 0.4470588, 1, 0, 1,
-0.7068273, 1.835955, 0.6683343, 0.4392157, 1, 0, 1,
-0.7056314, 0.9133577, -1.805357, 0.4352941, 1, 0, 1,
-0.7052845, 0.1157766, 0.08093586, 0.427451, 1, 0, 1,
-0.7041378, -1.090125, -3.601655, 0.4235294, 1, 0, 1,
-0.6876522, 1.098794, 0.4246169, 0.4156863, 1, 0, 1,
-0.6784356, -1.508934, -2.82076, 0.4117647, 1, 0, 1,
-0.6768571, 1.38556, 1.124877, 0.4039216, 1, 0, 1,
-0.6755814, -0.9604927, -3.397541, 0.3960784, 1, 0, 1,
-0.6719283, 0.3448912, 0.0698352, 0.3921569, 1, 0, 1,
-0.6709889, 0.8018432, 0.5657619, 0.3843137, 1, 0, 1,
-0.6687304, -0.1828956, -1.587214, 0.3803922, 1, 0, 1,
-0.6665525, -0.4426605, -1.769335, 0.372549, 1, 0, 1,
-0.6653082, 0.9374238, 0.2056611, 0.3686275, 1, 0, 1,
-0.6633319, -0.2126379, -0.6632898, 0.3607843, 1, 0, 1,
-0.6628962, -0.01144458, -2.613703, 0.3568628, 1, 0, 1,
-0.6581225, -1.126423, -1.233678, 0.3490196, 1, 0, 1,
-0.65782, -1.13796, -3.029999, 0.345098, 1, 0, 1,
-0.655037, 0.8224402, 0.1488683, 0.3372549, 1, 0, 1,
-0.6547098, -1.651133, -3.997254, 0.3333333, 1, 0, 1,
-0.6537356, 2.603872, 0.1888754, 0.3254902, 1, 0, 1,
-0.6492009, -1.076595, -2.88161, 0.3215686, 1, 0, 1,
-0.6454253, 0.8711241, -1.103625, 0.3137255, 1, 0, 1,
-0.633677, -0.5242735, -2.683893, 0.3098039, 1, 0, 1,
-0.6283815, 0.3411431, -2.130415, 0.3019608, 1, 0, 1,
-0.6272454, 0.5456014, -0.9262292, 0.2941177, 1, 0, 1,
-0.6260154, -0.5810692, -1.070429, 0.2901961, 1, 0, 1,
-0.6184308, 0.7743621, -1.163523, 0.282353, 1, 0, 1,
-0.6098105, 0.6569815, -1.46032, 0.2784314, 1, 0, 1,
-0.607785, 0.5734451, -0.5367163, 0.2705882, 1, 0, 1,
-0.604718, 0.1793191, -0.7973427, 0.2666667, 1, 0, 1,
-0.5958684, 0.6109447, 0.885957, 0.2588235, 1, 0, 1,
-0.5926625, -0.7455585, -0.9937249, 0.254902, 1, 0, 1,
-0.5893069, 0.754603, -0.2743954, 0.2470588, 1, 0, 1,
-0.5856682, 0.7326273, 0.3744094, 0.2431373, 1, 0, 1,
-0.5820177, 0.8122416, 0.2236899, 0.2352941, 1, 0, 1,
-0.5819573, -1.033552, -3.193343, 0.2313726, 1, 0, 1,
-0.5798354, -0.1735918, -2.283254, 0.2235294, 1, 0, 1,
-0.5777684, -0.167225, -3.039332, 0.2196078, 1, 0, 1,
-0.5775966, -0.2223651, -2.177506, 0.2117647, 1, 0, 1,
-0.5727449, -0.09656213, -2.241529, 0.2078431, 1, 0, 1,
-0.5677089, -0.2122706, -1.296104, 0.2, 1, 0, 1,
-0.5626942, -0.2080147, -1.764601, 0.1921569, 1, 0, 1,
-0.5600544, -2.006186, -4.027915, 0.1882353, 1, 0, 1,
-0.559841, -1.438259, -1.587101, 0.1803922, 1, 0, 1,
-0.558569, -0.1320309, -0.7978203, 0.1764706, 1, 0, 1,
-0.5584202, 0.8102869, 1.439776, 0.1686275, 1, 0, 1,
-0.5569595, 2.148966, 0.2533957, 0.1647059, 1, 0, 1,
-0.5550839, 1.425511, -0.8944959, 0.1568628, 1, 0, 1,
-0.5490438, 0.7467679, -0.9449854, 0.1529412, 1, 0, 1,
-0.5482895, 0.9129087, -0.9152324, 0.145098, 1, 0, 1,
-0.5424798, 0.5095229, -0.9816967, 0.1411765, 1, 0, 1,
-0.5371434, 1.345639, 1.899949, 0.1333333, 1, 0, 1,
-0.5349558, 0.3902624, -1.830061, 0.1294118, 1, 0, 1,
-0.5279313, -1.308103, -2.507131, 0.1215686, 1, 0, 1,
-0.5274355, -0.7022967, -3.691274, 0.1176471, 1, 0, 1,
-0.5188521, 0.638679, 0.2117168, 0.1098039, 1, 0, 1,
-0.5170028, 1.760746, -1.35049, 0.1058824, 1, 0, 1,
-0.5143592, 0.7958465, -2.335751, 0.09803922, 1, 0, 1,
-0.5126341, -0.638359, -2.658366, 0.09019608, 1, 0, 1,
-0.5097575, 1.53067, -1.559132, 0.08627451, 1, 0, 1,
-0.5089679, -1.479614, -3.636945, 0.07843138, 1, 0, 1,
-0.5057025, -0.2672348, -2.354586, 0.07450981, 1, 0, 1,
-0.5052137, 0.1220446, -1.430936, 0.06666667, 1, 0, 1,
-0.504292, -1.451826, -2.087574, 0.0627451, 1, 0, 1,
-0.497835, 0.4160849, 0.3179985, 0.05490196, 1, 0, 1,
-0.4973979, 0.04603787, -1.31327, 0.05098039, 1, 0, 1,
-0.4965678, -0.4825972, -1.263652, 0.04313726, 1, 0, 1,
-0.4918674, -0.379408, -4.442002, 0.03921569, 1, 0, 1,
-0.4890677, 0.0595715, -2.487285, 0.03137255, 1, 0, 1,
-0.4751695, 0.3312958, -0.07710361, 0.02745098, 1, 0, 1,
-0.4749435, -1.013404, -2.04306, 0.01960784, 1, 0, 1,
-0.4743458, -0.09069392, -1.799975, 0.01568628, 1, 0, 1,
-0.4728583, 0.6778451, -0.2223223, 0.007843138, 1, 0, 1,
-0.469127, -0.8484374, -3.041284, 0.003921569, 1, 0, 1,
-0.4636124, 0.04773769, -0.5110047, 0, 1, 0.003921569, 1,
-0.4619761, -1.260942, -3.216089, 0, 1, 0.01176471, 1,
-0.4573379, -0.914197, -2.820308, 0, 1, 0.01568628, 1,
-0.4524247, -1.095743, -3.944083, 0, 1, 0.02352941, 1,
-0.4515121, -0.2466417, -2.290067, 0, 1, 0.02745098, 1,
-0.4502249, 0.5862746, 0.2689458, 0, 1, 0.03529412, 1,
-0.4498403, -0.6105404, -2.878962, 0, 1, 0.03921569, 1,
-0.4474921, -1.219264, -1.591339, 0, 1, 0.04705882, 1,
-0.4394005, -1.869959, -4.181878, 0, 1, 0.05098039, 1,
-0.4348771, 0.4811551, -1.177114, 0, 1, 0.05882353, 1,
-0.4342416, 0.1173053, -0.9019861, 0, 1, 0.0627451, 1,
-0.432798, 0.6256028, -0.8264222, 0, 1, 0.07058824, 1,
-0.4270021, 1.061721, -0.2414735, 0, 1, 0.07450981, 1,
-0.4186805, 0.7261645, -0.2713711, 0, 1, 0.08235294, 1,
-0.4167807, 1.223362, 0.6822907, 0, 1, 0.08627451, 1,
-0.4163187, -3.720881, -2.917144, 0, 1, 0.09411765, 1,
-0.4123131, 0.1426583, -0.932412, 0, 1, 0.1019608, 1,
-0.4107428, 0.0178861, -2.881463, 0, 1, 0.1058824, 1,
-0.4080463, -0.3499529, -2.649594, 0, 1, 0.1137255, 1,
-0.4073884, 0.6469852, -1.187515, 0, 1, 0.1176471, 1,
-0.400584, 1.415057, -1.471735, 0, 1, 0.1254902, 1,
-0.3996507, 0.6520156, 0.4934031, 0, 1, 0.1294118, 1,
-0.3986137, -0.1526227, -2.641415, 0, 1, 0.1372549, 1,
-0.3922847, -0.6656775, -1.325359, 0, 1, 0.1411765, 1,
-0.3897892, -0.5137728, -1.215136, 0, 1, 0.1490196, 1,
-0.3887481, -0.2057809, -1.459277, 0, 1, 0.1529412, 1,
-0.3827833, 0.9898462, 1.058498, 0, 1, 0.1607843, 1,
-0.3810147, 1.394869, -0.8425435, 0, 1, 0.1647059, 1,
-0.3799074, 0.7822543, 0.1638412, 0, 1, 0.172549, 1,
-0.3783642, -0.4823104, -1.39286, 0, 1, 0.1764706, 1,
-0.3766946, -0.7022573, -2.777144, 0, 1, 0.1843137, 1,
-0.3756961, 0.3369412, -0.6448692, 0, 1, 0.1882353, 1,
-0.3667002, 0.5603198, 0.6574374, 0, 1, 0.1960784, 1,
-0.3653605, -0.3438234, -2.067315, 0, 1, 0.2039216, 1,
-0.3650397, 0.8192555, 1.422502, 0, 1, 0.2078431, 1,
-0.3626176, 0.1367022, -2.434508, 0, 1, 0.2156863, 1,
-0.3619226, -0.3466901, -2.295046, 0, 1, 0.2196078, 1,
-0.3606047, -1.348595, -3.2511, 0, 1, 0.227451, 1,
-0.360077, 1.3269, 0.7808713, 0, 1, 0.2313726, 1,
-0.3566124, -0.8589345, -3.556219, 0, 1, 0.2392157, 1,
-0.3534716, 0.9359397, 0.4083428, 0, 1, 0.2431373, 1,
-0.3429748, -0.7126547, -2.40955, 0, 1, 0.2509804, 1,
-0.3427964, 0.7621585, -0.4224877, 0, 1, 0.254902, 1,
-0.3420889, 1.350538, -0.07961909, 0, 1, 0.2627451, 1,
-0.339755, -0.3374628, -1.817649, 0, 1, 0.2666667, 1,
-0.3390915, 1.69342, 1.503244, 0, 1, 0.2745098, 1,
-0.3326078, -0.0267943, -1.89334, 0, 1, 0.2784314, 1,
-0.3313778, -0.4727806, -2.232903, 0, 1, 0.2862745, 1,
-0.3282031, 1.437993, -1.511117, 0, 1, 0.2901961, 1,
-0.3259949, 0.5350189, 1.306629, 0, 1, 0.2980392, 1,
-0.3181703, -0.01750295, -2.097642, 0, 1, 0.3058824, 1,
-0.3171854, 0.8914732, -0.4354566, 0, 1, 0.3098039, 1,
-0.3164273, 1.842208, 0.264693, 0, 1, 0.3176471, 1,
-0.3153544, -0.5692885, -3.120945, 0, 1, 0.3215686, 1,
-0.3133277, 0.4716136, -0.5788103, 0, 1, 0.3294118, 1,
-0.3126591, -0.01918677, -0.7754307, 0, 1, 0.3333333, 1,
-0.3123589, -0.2369335, -0.9207337, 0, 1, 0.3411765, 1,
-0.3121719, 1.204035, -0.3350799, 0, 1, 0.345098, 1,
-0.3075073, -0.1296908, -2.357178, 0, 1, 0.3529412, 1,
-0.3071553, -0.9677548, -3.889208, 0, 1, 0.3568628, 1,
-0.3048311, 0.9123778, -1.250259, 0, 1, 0.3647059, 1,
-0.3008206, -0.04970423, -3.007551, 0, 1, 0.3686275, 1,
-0.2989705, -0.007101753, -0.2904031, 0, 1, 0.3764706, 1,
-0.2983319, 0.5955806, -1.408416, 0, 1, 0.3803922, 1,
-0.2971008, -0.8889194, -2.345744, 0, 1, 0.3882353, 1,
-0.2930996, 0.3162551, -0.01503289, 0, 1, 0.3921569, 1,
-0.292643, 1.681845, -1.33549, 0, 1, 0.4, 1,
-0.2895345, 0.7694573, 0.5842614, 0, 1, 0.4078431, 1,
-0.2889131, -0.383179, -2.919991, 0, 1, 0.4117647, 1,
-0.2884664, 0.9859863, -1.46595, 0, 1, 0.4196078, 1,
-0.2841005, 1.229215, -1.014556, 0, 1, 0.4235294, 1,
-0.283024, 1.21938, -0.3750732, 0, 1, 0.4313726, 1,
-0.2827576, -0.9002016, -5.185175, 0, 1, 0.4352941, 1,
-0.282315, -1.158042, -2.355241, 0, 1, 0.4431373, 1,
-0.28171, 1.703728, -0.4669128, 0, 1, 0.4470588, 1,
-0.2813153, -0.00185697, -0.06975609, 0, 1, 0.454902, 1,
-0.2806175, -0.02030352, -2.430218, 0, 1, 0.4588235, 1,
-0.2773215, -0.1657245, 0.6282509, 0, 1, 0.4666667, 1,
-0.2691951, -0.4972443, -1.672163, 0, 1, 0.4705882, 1,
-0.2682984, 0.8161471, 1.170199, 0, 1, 0.4784314, 1,
-0.2663689, 0.3453155, 0.6417026, 0, 1, 0.4823529, 1,
-0.2654227, -1.019095, -3.301161, 0, 1, 0.4901961, 1,
-0.2489183, -2.691372, -3.979462, 0, 1, 0.4941176, 1,
-0.2464076, -0.02672062, -2.087545, 0, 1, 0.5019608, 1,
-0.244434, 0.4057268, 1.674616, 0, 1, 0.509804, 1,
-0.2397417, 0.8385854, -0.2170684, 0, 1, 0.5137255, 1,
-0.2355831, 0.6500543, 1.139909, 0, 1, 0.5215687, 1,
-0.2342919, 1.136085, -2.152413, 0, 1, 0.5254902, 1,
-0.2342349, -0.1120666, -1.454484, 0, 1, 0.5333334, 1,
-0.2307629, 0.5517396, -1.30119, 0, 1, 0.5372549, 1,
-0.2291196, -0.334925, -0.7935386, 0, 1, 0.5450981, 1,
-0.2285992, 0.5656535, -1.105755, 0, 1, 0.5490196, 1,
-0.2266273, -1.963261, -2.319052, 0, 1, 0.5568628, 1,
-0.2260887, -0.5582944, -1.748106, 0, 1, 0.5607843, 1,
-0.2250741, -0.4712628, -3.157473, 0, 1, 0.5686275, 1,
-0.2241392, 1.335506, -0.2063836, 0, 1, 0.572549, 1,
-0.2189467, 0.8710063, -0.1911843, 0, 1, 0.5803922, 1,
-0.2182357, 0.08845682, -1.123951, 0, 1, 0.5843138, 1,
-0.2133626, -1.29974, -2.248653, 0, 1, 0.5921569, 1,
-0.2087799, -1.959688, -4.166267, 0, 1, 0.5960785, 1,
-0.2086116, 2.077976, 0.2136248, 0, 1, 0.6039216, 1,
-0.2076464, 0.1321487, -0.8586035, 0, 1, 0.6117647, 1,
-0.2052702, -1.97167, -2.383337, 0, 1, 0.6156863, 1,
-0.2041312, 1.082789, -0.2677023, 0, 1, 0.6235294, 1,
-0.2009911, 1.350306, 2.245604, 0, 1, 0.627451, 1,
-0.1996035, 0.6800137, -2.172944, 0, 1, 0.6352941, 1,
-0.1979564, 1.350784, 0.190449, 0, 1, 0.6392157, 1,
-0.1939431, 0.4831244, -0.7508864, 0, 1, 0.6470588, 1,
-0.1929477, 0.4259315, -1.676343, 0, 1, 0.6509804, 1,
-0.1920012, 0.7155926, 1.070008, 0, 1, 0.6588235, 1,
-0.1895394, 0.09826618, 0.8542325, 0, 1, 0.6627451, 1,
-0.1849954, 0.4681761, 1.23036, 0, 1, 0.6705883, 1,
-0.1846692, -1.268882, -3.494797, 0, 1, 0.6745098, 1,
-0.1805263, 0.8788223, -0.5890412, 0, 1, 0.682353, 1,
-0.1793138, -0.1040213, -0.8147186, 0, 1, 0.6862745, 1,
-0.1773558, 0.4038131, -0.3940376, 0, 1, 0.6941177, 1,
-0.172637, 1.114409, 0.4612515, 0, 1, 0.7019608, 1,
-0.1698527, 0.3039669, -2.612561, 0, 1, 0.7058824, 1,
-0.1697876, 0.5667439, -0.7759556, 0, 1, 0.7137255, 1,
-0.1697625, 0.4173744, -0.7172238, 0, 1, 0.7176471, 1,
-0.168879, 0.3294538, -0.6172176, 0, 1, 0.7254902, 1,
-0.1673828, 0.1846309, -2.90001, 0, 1, 0.7294118, 1,
-0.1672171, 0.7230227, -1.255036, 0, 1, 0.7372549, 1,
-0.1631761, 0.7837939, 0.7527797, 0, 1, 0.7411765, 1,
-0.1591596, -0.1395499, -2.268302, 0, 1, 0.7490196, 1,
-0.15367, -0.4057654, -3.793362, 0, 1, 0.7529412, 1,
-0.1522494, -0.1448691, -1.915286, 0, 1, 0.7607843, 1,
-0.15179, -0.9026713, -3.033439, 0, 1, 0.7647059, 1,
-0.1512918, -0.2962198, -3.447267, 0, 1, 0.772549, 1,
-0.1494049, 0.7191756, -0.03708711, 0, 1, 0.7764706, 1,
-0.1466764, -0.3750606, -2.102161, 0, 1, 0.7843137, 1,
-0.1429746, -0.6078994, -1.490541, 0, 1, 0.7882353, 1,
-0.1396949, -0.4265397, -3.018147, 0, 1, 0.7960784, 1,
-0.1395114, 1.62185, 0.5922608, 0, 1, 0.8039216, 1,
-0.1228825, -0.5567558, -3.801546, 0, 1, 0.8078431, 1,
-0.1084886, 0.1032371, -0.7706781, 0, 1, 0.8156863, 1,
-0.101977, 1.343093, -0.3016084, 0, 1, 0.8196079, 1,
-0.09407797, 0.08973941, -0.2596562, 0, 1, 0.827451, 1,
-0.0930189, -1.511811, -2.813739, 0, 1, 0.8313726, 1,
-0.08717842, 0.5248094, -0.7176847, 0, 1, 0.8392157, 1,
-0.08343682, -0.2754443, -4.851721, 0, 1, 0.8431373, 1,
-0.07971202, -1.734074, -3.734474, 0, 1, 0.8509804, 1,
-0.07619808, -1.364048, -2.962094, 0, 1, 0.854902, 1,
-0.0709029, -1.871992, -3.389506, 0, 1, 0.8627451, 1,
-0.06907574, -0.9227149, -2.783046, 0, 1, 0.8666667, 1,
-0.06673945, 1.723355, -0.9149848, 0, 1, 0.8745098, 1,
-0.06174651, -0.7676277, -2.776087, 0, 1, 0.8784314, 1,
-0.05640697, -1.147769, -3.930867, 0, 1, 0.8862745, 1,
-0.05254521, 0.7582372, -0.8891345, 0, 1, 0.8901961, 1,
-0.05229063, 0.600451, -1.632363, 0, 1, 0.8980392, 1,
-0.05100715, -0.06293223, -2.549663, 0, 1, 0.9058824, 1,
-0.05047119, 1.334091, 0.3848202, 0, 1, 0.9098039, 1,
-0.04808865, -0.2003611, -4.211188, 0, 1, 0.9176471, 1,
-0.04708198, 1.03462, -0.1787742, 0, 1, 0.9215686, 1,
-0.04094531, 0.7586709, 0.7598346, 0, 1, 0.9294118, 1,
-0.0401658, 0.7887005, -0.1905115, 0, 1, 0.9333333, 1,
-0.0397075, -0.8154899, -1.849511, 0, 1, 0.9411765, 1,
-0.03878767, 1.543705, 1.88441, 0, 1, 0.945098, 1,
-0.03807835, -0.259966, -4.55714, 0, 1, 0.9529412, 1,
-0.03653872, 1.919106, 1.65509, 0, 1, 0.9568627, 1,
-0.03425347, -1.29389, -2.876159, 0, 1, 0.9647059, 1,
-0.03266974, -0.5677367, -3.378956, 0, 1, 0.9686275, 1,
-0.03049952, 1.162803, -2.713365, 0, 1, 0.9764706, 1,
-0.02555202, 0.09917704, 1.911935, 0, 1, 0.9803922, 1,
-0.02456436, 1.424127, 1.203186, 0, 1, 0.9882353, 1,
-0.02284867, 0.5264371, -0.9190881, 0, 1, 0.9921569, 1,
-0.022396, -2.661249, -2.546993, 0, 1, 1, 1,
-0.016074, 2.053723, 1.292751, 0, 0.9921569, 1, 1,
-0.01392711, -0.8328671, -3.071883, 0, 0.9882353, 1, 1,
-0.01368526, -2.070678, -3.208478, 0, 0.9803922, 1, 1,
-0.01243917, -0.05287236, -2.234296, 0, 0.9764706, 1, 1,
-0.0120593, 0.9003354, 0.1688571, 0, 0.9686275, 1, 1,
-0.01029112, 1.084035, -0.3869713, 0, 0.9647059, 1, 1,
-0.00998063, 0.8266037, 0.1137082, 0, 0.9568627, 1, 1,
-0.009977764, -0.873547, -3.012362, 0, 0.9529412, 1, 1,
-0.006669391, 1.099995, -0.2824558, 0, 0.945098, 1, 1,
-0.005300914, 0.06839838, 0.3977189, 0, 0.9411765, 1, 1,
-0.004732402, 1.125393, -0.2699922, 0, 0.9333333, 1, 1,
-0.002606702, -0.6313647, -1.628925, 0, 0.9294118, 1, 1,
-0.001509608, 0.2782881, -0.4304771, 0, 0.9215686, 1, 1,
0.002860863, -0.7478256, 3.780002, 0, 0.9176471, 1, 1,
0.003407212, -1.41219, 3.519514, 0, 0.9098039, 1, 1,
0.006590657, -1.075293, 5.317665, 0, 0.9058824, 1, 1,
0.007214508, -0.4191064, 3.788506, 0, 0.8980392, 1, 1,
0.007505109, 0.6304886, -1.171423, 0, 0.8901961, 1, 1,
0.009093968, 1.176448, 0.6551463, 0, 0.8862745, 1, 1,
0.01174248, -1.823372, 3.356244, 0, 0.8784314, 1, 1,
0.01266221, 1.054777, 0.7504066, 0, 0.8745098, 1, 1,
0.01617857, 0.387838, -0.07109524, 0, 0.8666667, 1, 1,
0.01743022, -1.833901, 2.732273, 0, 0.8627451, 1, 1,
0.02097029, -0.3114074, 1.536946, 0, 0.854902, 1, 1,
0.02700784, -2.237367, 2.98177, 0, 0.8509804, 1, 1,
0.02742152, 1.283734, 1.060715, 0, 0.8431373, 1, 1,
0.03023218, 0.4118217, 0.006650005, 0, 0.8392157, 1, 1,
0.037388, 0.9927007, 0.6701648, 0, 0.8313726, 1, 1,
0.03774523, -0.4472347, 2.662349, 0, 0.827451, 1, 1,
0.03866717, 0.8350496, -0.3521309, 0, 0.8196079, 1, 1,
0.04113975, -0.9587832, 4.637528, 0, 0.8156863, 1, 1,
0.04129595, -1.371745, 1.158978, 0, 0.8078431, 1, 1,
0.04491852, -1.004623, 3.331795, 0, 0.8039216, 1, 1,
0.04592443, 0.5540816, 0.04570166, 0, 0.7960784, 1, 1,
0.0535799, -0.4325121, 1.610752, 0, 0.7882353, 1, 1,
0.06246537, 0.7675266, 1.133304, 0, 0.7843137, 1, 1,
0.06658601, -1.004963, 3.985726, 0, 0.7764706, 1, 1,
0.06701606, -1.415846, 3.705915, 0, 0.772549, 1, 1,
0.07323351, -0.4381199, 1.416027, 0, 0.7647059, 1, 1,
0.07540441, -0.4581741, 3.801933, 0, 0.7607843, 1, 1,
0.07597, 0.4652422, 0.4666024, 0, 0.7529412, 1, 1,
0.07735816, -1.195591, 4.667685, 0, 0.7490196, 1, 1,
0.07819717, 1.006554, -0.6471887, 0, 0.7411765, 1, 1,
0.09605645, -0.6121476, 3.311242, 0, 0.7372549, 1, 1,
0.09718156, 1.196422, -0.2563238, 0, 0.7294118, 1, 1,
0.09993843, -1.319009, 6.099087, 0, 0.7254902, 1, 1,
0.1004042, 1.560566, -0.2960061, 0, 0.7176471, 1, 1,
0.1034406, -1.868965, 1.178143, 0, 0.7137255, 1, 1,
0.1038067, 0.3707633, -1.267, 0, 0.7058824, 1, 1,
0.1061485, 0.8872907, 0.5765219, 0, 0.6980392, 1, 1,
0.1080211, -0.4199746, 4.256988, 0, 0.6941177, 1, 1,
0.1092723, -0.7115514, 3.12946, 0, 0.6862745, 1, 1,
0.1101115, 0.09149906, 1.735551, 0, 0.682353, 1, 1,
0.1103444, 1.766286, -0.8950926, 0, 0.6745098, 1, 1,
0.1114976, 1.166159, -0.9851987, 0, 0.6705883, 1, 1,
0.1146563, 0.8548585, -0.3687718, 0, 0.6627451, 1, 1,
0.1190364, -2.021955, 2.557881, 0, 0.6588235, 1, 1,
0.1223877, -0.7705247, 4.404928, 0, 0.6509804, 1, 1,
0.1234072, 0.3859711, 0.3554386, 0, 0.6470588, 1, 1,
0.1247192, 1.232172, -1.479726, 0, 0.6392157, 1, 1,
0.1247999, 0.7107657, 1.578879, 0, 0.6352941, 1, 1,
0.1286332, -1.356119, 2.84305, 0, 0.627451, 1, 1,
0.1385222, -1.913191, 3.594575, 0, 0.6235294, 1, 1,
0.1388923, -0.8520767, 2.627916, 0, 0.6156863, 1, 1,
0.1407377, -1.296113, 1.992912, 0, 0.6117647, 1, 1,
0.1425689, 0.2912868, -0.8605726, 0, 0.6039216, 1, 1,
0.1488522, -0.5311694, 2.637762, 0, 0.5960785, 1, 1,
0.152133, -1.094218, 3.075493, 0, 0.5921569, 1, 1,
0.1528602, 0.246847, 0.461169, 0, 0.5843138, 1, 1,
0.1532881, -0.9661569, 2.926822, 0, 0.5803922, 1, 1,
0.1592922, -0.01648529, 1.452239, 0, 0.572549, 1, 1,
0.160701, 0.2886363, 0.9218991, 0, 0.5686275, 1, 1,
0.1607675, 0.7359794, 0.9510688, 0, 0.5607843, 1, 1,
0.1648204, -0.08531841, 0.152503, 0, 0.5568628, 1, 1,
0.1656751, -1.956065, 3.217515, 0, 0.5490196, 1, 1,
0.1664377, -0.2246078, 1.927815, 0, 0.5450981, 1, 1,
0.1670577, 1.338157, 1.786522, 0, 0.5372549, 1, 1,
0.1683235, -1.065276, 4.130075, 0, 0.5333334, 1, 1,
0.170623, -0.6914708, 3.474296, 0, 0.5254902, 1, 1,
0.1762131, 0.4493731, -0.1087069, 0, 0.5215687, 1, 1,
0.1763837, -1.058146, 3.579203, 0, 0.5137255, 1, 1,
0.1794574, 0.6284001, 1.120523, 0, 0.509804, 1, 1,
0.1818205, 2.240021, 2.359617, 0, 0.5019608, 1, 1,
0.1852016, 1.39377, -1.367122, 0, 0.4941176, 1, 1,
0.1879392, -1.006726, 0.8658283, 0, 0.4901961, 1, 1,
0.1883422, -1.296811, 2.456897, 0, 0.4823529, 1, 1,
0.1981075, -0.8214348, 2.970196, 0, 0.4784314, 1, 1,
0.2008884, -0.06977314, 1.501544, 0, 0.4705882, 1, 1,
0.2059529, -1.03107, 2.567655, 0, 0.4666667, 1, 1,
0.2095726, -0.4130708, 2.717926, 0, 0.4588235, 1, 1,
0.2097083, -1.757537, 3.077343, 0, 0.454902, 1, 1,
0.2098905, -0.07998693, 2.655054, 0, 0.4470588, 1, 1,
0.2118574, 0.1291182, 0.01464525, 0, 0.4431373, 1, 1,
0.213113, 0.7706174, -0.0684169, 0, 0.4352941, 1, 1,
0.2178708, 2.095133, 0.1911456, 0, 0.4313726, 1, 1,
0.2181073, -0.7974788, 2.578418, 0, 0.4235294, 1, 1,
0.2247439, 0.06025869, 0.8786474, 0, 0.4196078, 1, 1,
0.2261606, -0.7999727, 1.585445, 0, 0.4117647, 1, 1,
0.2317649, 0.4399458, 1.087721, 0, 0.4078431, 1, 1,
0.2341709, 0.2414479, 0.9013993, 0, 0.4, 1, 1,
0.241242, -0.2977764, 2.380123, 0, 0.3921569, 1, 1,
0.2427122, -1.035248, 3.746521, 0, 0.3882353, 1, 1,
0.2430526, 0.006233009, 2.603256, 0, 0.3803922, 1, 1,
0.243678, 1.292676, -1.165849, 0, 0.3764706, 1, 1,
0.2466262, 0.5092899, 0.2649657, 0, 0.3686275, 1, 1,
0.2473667, -0.9548061, 4.186331, 0, 0.3647059, 1, 1,
0.2561427, 0.5040815, 1.39199, 0, 0.3568628, 1, 1,
0.257248, -1.881763, 2.238214, 0, 0.3529412, 1, 1,
0.257758, 1.346186, -1.805636, 0, 0.345098, 1, 1,
0.2608834, 0.958725, 1.702215, 0, 0.3411765, 1, 1,
0.2614963, 0.4413146, 2.326292, 0, 0.3333333, 1, 1,
0.2650942, -1.538416, 3.76304, 0, 0.3294118, 1, 1,
0.2689125, -0.4379573, 2.877383, 0, 0.3215686, 1, 1,
0.2697361, 0.8849258, 0.3569646, 0, 0.3176471, 1, 1,
0.2758003, 0.0181269, 0.8162836, 0, 0.3098039, 1, 1,
0.2762364, 0.2370581, 0.6464933, 0, 0.3058824, 1, 1,
0.2787716, -2.269736, 4.387351, 0, 0.2980392, 1, 1,
0.279189, 0.8662913, 0.949389, 0, 0.2901961, 1, 1,
0.2820404, -1.351838, 1.891384, 0, 0.2862745, 1, 1,
0.2858629, -0.5894934, 1.481278, 0, 0.2784314, 1, 1,
0.2918735, -0.7171937, 2.718066, 0, 0.2745098, 1, 1,
0.2936825, 1.521463, 0.0600463, 0, 0.2666667, 1, 1,
0.2941402, 0.8614331, -0.02275964, 0, 0.2627451, 1, 1,
0.2997674, 0.9176478, -0.5666988, 0, 0.254902, 1, 1,
0.3002118, 0.6028656, 0.8175496, 0, 0.2509804, 1, 1,
0.3015864, -0.9288124, 3.385967, 0, 0.2431373, 1, 1,
0.3021452, 0.1053887, 0.9468741, 0, 0.2392157, 1, 1,
0.3022432, 0.0207029, 0.5419897, 0, 0.2313726, 1, 1,
0.3073464, 1.665174, -0.2406466, 0, 0.227451, 1, 1,
0.308053, -0.1964306, 2.885489, 0, 0.2196078, 1, 1,
0.3107249, -0.6526303, 2.566503, 0, 0.2156863, 1, 1,
0.3182313, 3.640002, 0.4000651, 0, 0.2078431, 1, 1,
0.3204938, -1.206177, 0.751881, 0, 0.2039216, 1, 1,
0.3220041, 0.5610323, 0.2322885, 0, 0.1960784, 1, 1,
0.3222381, -0.7395247, 3.523513, 0, 0.1882353, 1, 1,
0.323269, -2.609021, 3.123964, 0, 0.1843137, 1, 1,
0.3263861, -0.4878013, 0.8054468, 0, 0.1764706, 1, 1,
0.3271894, 0.32326, 0.4029766, 0, 0.172549, 1, 1,
0.3282786, 0.6447558, 2.387499, 0, 0.1647059, 1, 1,
0.3284551, -1.166802, 1.612348, 0, 0.1607843, 1, 1,
0.329057, 1.494889, -0.160518, 0, 0.1529412, 1, 1,
0.3371624, 0.697314, 1.268173, 0, 0.1490196, 1, 1,
0.3380871, 0.1317136, -0.2924223, 0, 0.1411765, 1, 1,
0.3391954, 1.452605, 1.159487, 0, 0.1372549, 1, 1,
0.3394888, 0.06247054, 2.273833, 0, 0.1294118, 1, 1,
0.3397886, 0.9955012, 1.554678, 0, 0.1254902, 1, 1,
0.3406546, -0.4218924, 0.1052671, 0, 0.1176471, 1, 1,
0.3422921, 1.829444, 0.4033503, 0, 0.1137255, 1, 1,
0.3434567, -1.005874, 2.645709, 0, 0.1058824, 1, 1,
0.3482384, 0.2681244, 1.739666, 0, 0.09803922, 1, 1,
0.3486013, 0.9190262, -0.3514354, 0, 0.09411765, 1, 1,
0.351169, -0.414144, 2.338837, 0, 0.08627451, 1, 1,
0.3562165, -0.7993699, 0.3447961, 0, 0.08235294, 1, 1,
0.3631475, 1.886305, 0.8105197, 0, 0.07450981, 1, 1,
0.3712901, 0.5455332, -0.9471794, 0, 0.07058824, 1, 1,
0.3718096, 0.7635233, -0.2098892, 0, 0.0627451, 1, 1,
0.3738939, -0.4837477, 3.057315, 0, 0.05882353, 1, 1,
0.3755758, -1.848783, 2.695996, 0, 0.05098039, 1, 1,
0.3787872, -0.09716173, 2.07854, 0, 0.04705882, 1, 1,
0.3798342, 1.187899, -0.05564996, 0, 0.03921569, 1, 1,
0.3867345, -0.9651226, 0.9679878, 0, 0.03529412, 1, 1,
0.3872527, -0.003601531, 1.674408, 0, 0.02745098, 1, 1,
0.3892732, 0.308191, 2.570507, 0, 0.02352941, 1, 1,
0.3949005, 0.4499046, 0.1667257, 0, 0.01568628, 1, 1,
0.4007344, -1.414825, 3.402586, 0, 0.01176471, 1, 1,
0.406268, -1.352018, 2.043988, 0, 0.003921569, 1, 1,
0.4066958, 1.537842, 0.01233521, 0.003921569, 0, 1, 1,
0.4098613, 1.091112, -0.8555526, 0.007843138, 0, 1, 1,
0.4123245, 0.8258503, 0.3246512, 0.01568628, 0, 1, 1,
0.4149426, 0.2416216, 1.878697, 0.01960784, 0, 1, 1,
0.4151165, 0.8849887, 0.6422298, 0.02745098, 0, 1, 1,
0.4151898, 0.6686463, 0.2378438, 0.03137255, 0, 1, 1,
0.4232989, 0.7668788, 0.5714529, 0.03921569, 0, 1, 1,
0.4257513, -0.7908875, 2.297596, 0.04313726, 0, 1, 1,
0.4264252, 1.930248, 0.8548408, 0.05098039, 0, 1, 1,
0.4275392, -0.2841465, 0.6035699, 0.05490196, 0, 1, 1,
0.4279136, -0.2771947, 0.5547173, 0.0627451, 0, 1, 1,
0.4290934, -0.3942285, 2.240601, 0.06666667, 0, 1, 1,
0.4313408, 0.9511541, 0.3047082, 0.07450981, 0, 1, 1,
0.4366339, -1.286117, 2.453307, 0.07843138, 0, 1, 1,
0.4384939, 1.029001, -0.8058356, 0.08627451, 0, 1, 1,
0.4395068, -0.7634844, 1.915107, 0.09019608, 0, 1, 1,
0.4462323, 1.76847, -0.6161973, 0.09803922, 0, 1, 1,
0.4464051, 0.5341473, 1.179832, 0.1058824, 0, 1, 1,
0.4479786, 0.2729536, 0.7960439, 0.1098039, 0, 1, 1,
0.4495878, 0.09891932, -0.294941, 0.1176471, 0, 1, 1,
0.4565568, 1.101129, 0.4872025, 0.1215686, 0, 1, 1,
0.4572379, -0.932131, 4.354473, 0.1294118, 0, 1, 1,
0.4590377, -0.09208639, 0.9311434, 0.1333333, 0, 1, 1,
0.4594221, 0.09555735, 1.074492, 0.1411765, 0, 1, 1,
0.4598469, 1.466367, 1.551822, 0.145098, 0, 1, 1,
0.460216, -1.198034, 3.978814, 0.1529412, 0, 1, 1,
0.4605136, -0.06164588, 2.215004, 0.1568628, 0, 1, 1,
0.4672904, 0.7614233, -0.09686162, 0.1647059, 0, 1, 1,
0.4673529, 1.621795, 0.8038347, 0.1686275, 0, 1, 1,
0.4704731, 1.658727, -0.2066931, 0.1764706, 0, 1, 1,
0.4719402, -0.5531047, 0.7432209, 0.1803922, 0, 1, 1,
0.4740532, 1.118747, -1.718072, 0.1882353, 0, 1, 1,
0.4745039, -0.2004009, 1.108247, 0.1921569, 0, 1, 1,
0.4756014, 0.8717947, 0.9958682, 0.2, 0, 1, 1,
0.4875375, 2.299815, -0.8704947, 0.2078431, 0, 1, 1,
0.4920657, -0.9850549, 2.960134, 0.2117647, 0, 1, 1,
0.496002, 0.08276172, -0.4556935, 0.2196078, 0, 1, 1,
0.4962577, -0.7474051, 0.3487262, 0.2235294, 0, 1, 1,
0.4974685, -0.2116957, 1.775813, 0.2313726, 0, 1, 1,
0.501105, -1.209807, 2.888447, 0.2352941, 0, 1, 1,
0.5070251, -1.463153, 2.661879, 0.2431373, 0, 1, 1,
0.5073655, 0.812146, 1.115748, 0.2470588, 0, 1, 1,
0.5082309, -1.83379, 4.156657, 0.254902, 0, 1, 1,
0.5112008, -0.1048505, 0.8664023, 0.2588235, 0, 1, 1,
0.5171968, 0.3262857, 1.961604, 0.2666667, 0, 1, 1,
0.5180255, -0.2290003, 3.224848, 0.2705882, 0, 1, 1,
0.5181605, 1.577277, 0.04785868, 0.2784314, 0, 1, 1,
0.5227135, 0.0199084, 0.9130745, 0.282353, 0, 1, 1,
0.5252568, -1.92393, 3.505676, 0.2901961, 0, 1, 1,
0.5400687, 1.07447, -0.06234979, 0.2941177, 0, 1, 1,
0.5430276, 0.3269989, -0.2226842, 0.3019608, 0, 1, 1,
0.5431004, 1.024041, -0.3784957, 0.3098039, 0, 1, 1,
0.5495484, -0.03100418, 0.02184041, 0.3137255, 0, 1, 1,
0.5502148, 1.64213, -1.689934, 0.3215686, 0, 1, 1,
0.5603492, -1.37997, 4.085148, 0.3254902, 0, 1, 1,
0.5634328, -0.7188116, 3.290656, 0.3333333, 0, 1, 1,
0.5677541, -1.169673, 3.216796, 0.3372549, 0, 1, 1,
0.5685577, -0.9582965, 1.941402, 0.345098, 0, 1, 1,
0.5816418, -0.8210669, 3.881658, 0.3490196, 0, 1, 1,
0.5836521, -0.1969354, 1.799061, 0.3568628, 0, 1, 1,
0.5868844, -1.614232, 3.201182, 0.3607843, 0, 1, 1,
0.5908055, -0.8005306, 2.809324, 0.3686275, 0, 1, 1,
0.5924582, 0.9623032, -0.06854989, 0.372549, 0, 1, 1,
0.5959638, 1.025527, 1.648295, 0.3803922, 0, 1, 1,
0.5986218, -1.666529, 4.001036, 0.3843137, 0, 1, 1,
0.6019676, -0.1416491, 1.618445, 0.3921569, 0, 1, 1,
0.604707, -0.2792663, 2.394239, 0.3960784, 0, 1, 1,
0.6079753, -0.1762559, 2.951815, 0.4039216, 0, 1, 1,
0.6084647, -1.756217, 1.410476, 0.4117647, 0, 1, 1,
0.6179933, -0.567763, 1.724014, 0.4156863, 0, 1, 1,
0.619215, 1.351187, 0.3850926, 0.4235294, 0, 1, 1,
0.6206351, 0.3484348, 1.520863, 0.427451, 0, 1, 1,
0.623219, 0.1554859, 0.9574209, 0.4352941, 0, 1, 1,
0.6285557, 0.2167096, -0.2765695, 0.4392157, 0, 1, 1,
0.6298532, 1.246473, 0.9561152, 0.4470588, 0, 1, 1,
0.6318098, 0.2186749, 1.69327, 0.4509804, 0, 1, 1,
0.634331, -0.9221568, 3.440319, 0.4588235, 0, 1, 1,
0.6347211, 3.000487, 0.6047747, 0.4627451, 0, 1, 1,
0.6349349, -0.798611, 3.426782, 0.4705882, 0, 1, 1,
0.6387469, -0.6107378, 3.57576, 0.4745098, 0, 1, 1,
0.6438329, 1.164198, 0.9683692, 0.4823529, 0, 1, 1,
0.6442019, 0.8308877, 0.1510747, 0.4862745, 0, 1, 1,
0.6453083, -1.444268, 3.422468, 0.4941176, 0, 1, 1,
0.6495782, 0.8597789, 0.1434719, 0.5019608, 0, 1, 1,
0.6520761, -0.05950403, 3.43158, 0.5058824, 0, 1, 1,
0.6569825, 0.7149555, 1.274413, 0.5137255, 0, 1, 1,
0.6573821, -0.2064201, 2.68608, 0.5176471, 0, 1, 1,
0.6580033, -0.9984917, 2.129017, 0.5254902, 0, 1, 1,
0.6581426, -1.882429, 2.231719, 0.5294118, 0, 1, 1,
0.659882, 1.072352, -0.8781205, 0.5372549, 0, 1, 1,
0.6605179, -0.9890944, 2.110662, 0.5411765, 0, 1, 1,
0.6609696, 0.963632, -1.727369, 0.5490196, 0, 1, 1,
0.6616492, 0.3959076, 1.329192, 0.5529412, 0, 1, 1,
0.663266, 0.03512745, 0.2730838, 0.5607843, 0, 1, 1,
0.6688429, 0.6973324, 0.5816432, 0.5647059, 0, 1, 1,
0.6772721, 0.3309184, 2.408837, 0.572549, 0, 1, 1,
0.6818398, 0.9754811, -1.118612, 0.5764706, 0, 1, 1,
0.686791, 1.918032, 2.885221, 0.5843138, 0, 1, 1,
0.691896, -0.4640578, 0.1694499, 0.5882353, 0, 1, 1,
0.692039, 0.03510973, 1.273135, 0.5960785, 0, 1, 1,
0.6922576, -1.132664, 1.959277, 0.6039216, 0, 1, 1,
0.6963304, 1.241519, 3.361563, 0.6078432, 0, 1, 1,
0.7008435, -0.142891, 3.431957, 0.6156863, 0, 1, 1,
0.701589, 2.335463, 0.8365089, 0.6196079, 0, 1, 1,
0.7037902, -0.03243832, -0.1129525, 0.627451, 0, 1, 1,
0.7050186, -0.9178794, 2.183537, 0.6313726, 0, 1, 1,
0.7074573, -0.4355806, 3.519069, 0.6392157, 0, 1, 1,
0.711414, 0.9413404, 1.967727, 0.6431373, 0, 1, 1,
0.7118834, -0.1069527, -0.1273002, 0.6509804, 0, 1, 1,
0.7123057, 0.286039, 1.190415, 0.654902, 0, 1, 1,
0.7174431, 1.149387, -1.353652, 0.6627451, 0, 1, 1,
0.7224059, -0.4485618, 3.480645, 0.6666667, 0, 1, 1,
0.7260706, 0.9584186, 0.2845954, 0.6745098, 0, 1, 1,
0.7262325, -0.06564912, 1.297465, 0.6784314, 0, 1, 1,
0.7268154, -0.159969, 2.558747, 0.6862745, 0, 1, 1,
0.728734, 0.2817892, 0.3244281, 0.6901961, 0, 1, 1,
0.7330322, 1.337198, -0.6907003, 0.6980392, 0, 1, 1,
0.7340831, 0.4161223, 0.8104328, 0.7058824, 0, 1, 1,
0.7341161, -0.2770995, 0.1010274, 0.7098039, 0, 1, 1,
0.7409158, 2.278724, 0.7020885, 0.7176471, 0, 1, 1,
0.7458692, 0.4048929, 1.487087, 0.7215686, 0, 1, 1,
0.75855, 0.292987, 2.757677, 0.7294118, 0, 1, 1,
0.7674068, -0.302288, 1.481881, 0.7333333, 0, 1, 1,
0.7715302, 0.9431436, 0.6102284, 0.7411765, 0, 1, 1,
0.7744251, 0.5125776, 0.8222346, 0.7450981, 0, 1, 1,
0.7761297, -0.3543556, 3.091931, 0.7529412, 0, 1, 1,
0.7771171, 0.4305743, 2.778574, 0.7568628, 0, 1, 1,
0.7790108, -0.3760627, 1.405892, 0.7647059, 0, 1, 1,
0.7823475, 0.8920009, 0.6520365, 0.7686275, 0, 1, 1,
0.7830926, -1.424408, 2.580328, 0.7764706, 0, 1, 1,
0.7878491, 0.3035861, 2.865851, 0.7803922, 0, 1, 1,
0.7922264, 1.884779, 0.9636124, 0.7882353, 0, 1, 1,
0.7945875, 0.3476843, 0.9872391, 0.7921569, 0, 1, 1,
0.8055435, -1.083175, 2.568997, 0.8, 0, 1, 1,
0.8070087, 0.5214087, 0.4961867, 0.8078431, 0, 1, 1,
0.8095853, -0.4170675, 2.339893, 0.8117647, 0, 1, 1,
0.8114775, -0.3691388, 1.743171, 0.8196079, 0, 1, 1,
0.8133618, 1.762615, 1.202302, 0.8235294, 0, 1, 1,
0.8137901, 1.450773, -0.7674198, 0.8313726, 0, 1, 1,
0.8138715, -1.009038, 1.415776, 0.8352941, 0, 1, 1,
0.8168973, -0.946896, 1.753498, 0.8431373, 0, 1, 1,
0.8176807, 1.053036, 1.253061, 0.8470588, 0, 1, 1,
0.8203427, 0.8804315, 1.141548, 0.854902, 0, 1, 1,
0.8336343, -1.010934, 3.863358, 0.8588235, 0, 1, 1,
0.8367664, 0.8645709, 2.545207, 0.8666667, 0, 1, 1,
0.8389193, 0.1264299, 2.52474, 0.8705882, 0, 1, 1,
0.8420811, 1.220274, 0.7748588, 0.8784314, 0, 1, 1,
0.845618, -0.5708635, 1.599796, 0.8823529, 0, 1, 1,
0.8466412, -0.03923496, 0.9311181, 0.8901961, 0, 1, 1,
0.8499574, 0.4750614, 1.269497, 0.8941177, 0, 1, 1,
0.8535823, 0.3158564, -0.3893756, 0.9019608, 0, 1, 1,
0.8538411, -0.07632721, 3.240317, 0.9098039, 0, 1, 1,
0.8564795, -0.9386716, 1.536155, 0.9137255, 0, 1, 1,
0.8586702, 0.1371484, 3.138492, 0.9215686, 0, 1, 1,
0.8630305, -1.634477, 1.368171, 0.9254902, 0, 1, 1,
0.8687003, 1.964859, 0.4211462, 0.9333333, 0, 1, 1,
0.8824657, 0.4289984, 1.052992, 0.9372549, 0, 1, 1,
0.8869923, -0.03386521, 0.5469504, 0.945098, 0, 1, 1,
0.8988773, -1.267717, 2.260931, 0.9490196, 0, 1, 1,
0.9048788, -0.4771445, 2.548983, 0.9568627, 0, 1, 1,
0.9095667, 0.646304, 0.1069868, 0.9607843, 0, 1, 1,
0.9112098, 0.06447138, 0.1112421, 0.9686275, 0, 1, 1,
0.9189395, 0.590019, 1.660213, 0.972549, 0, 1, 1,
0.9217871, -1.150603, 3.368942, 0.9803922, 0, 1, 1,
0.9289639, -0.6305979, 3.845064, 0.9843137, 0, 1, 1,
0.9301228, -0.208296, 1.968841, 0.9921569, 0, 1, 1,
0.9322106, -0.2387389, 3.350589, 0.9960784, 0, 1, 1,
0.9330089, -0.9319919, 1.893903, 1, 0, 0.9960784, 1,
0.9333186, -1.821536, 0.9176273, 1, 0, 0.9882353, 1,
0.9359298, -1.358445, 4.265079, 1, 0, 0.9843137, 1,
0.9405233, 0.08964898, 1.085757, 1, 0, 0.9764706, 1,
0.9444016, 0.6844798, 0.5796448, 1, 0, 0.972549, 1,
0.9453165, 0.05282233, 1.103563, 1, 0, 0.9647059, 1,
0.9509936, 0.9062661, 1.932962, 1, 0, 0.9607843, 1,
0.9510864, -0.2920514, 1.71009, 1, 0, 0.9529412, 1,
0.9659303, 0.8324378, -0.7409958, 1, 0, 0.9490196, 1,
0.9742154, 1.095749, 1.74488, 1, 0, 0.9411765, 1,
0.9794079, 0.5142877, 0.1055352, 1, 0, 0.9372549, 1,
0.9806001, -0.6276088, 1.7447, 1, 0, 0.9294118, 1,
0.9821463, -0.1494314, 2.941456, 1, 0, 0.9254902, 1,
0.9846364, -0.2695899, 1.189331, 1, 0, 0.9176471, 1,
0.9908127, 1.311459, 1.220784, 1, 0, 0.9137255, 1,
0.9908279, -0.1433268, -0.04070903, 1, 0, 0.9058824, 1,
1.004766, -0.2001005, 1.456626, 1, 0, 0.9019608, 1,
1.012451, -0.3492068, 1.754986, 1, 0, 0.8941177, 1,
1.021601, -0.6445317, 2.872159, 1, 0, 0.8862745, 1,
1.030692, 0.9787389, -0.02556691, 1, 0, 0.8823529, 1,
1.038257, 0.8384827, 1.794166, 1, 0, 0.8745098, 1,
1.039403, -0.3037411, 2.782791, 1, 0, 0.8705882, 1,
1.042215, -0.6100162, 0.3490613, 1, 0, 0.8627451, 1,
1.045122, 0.4234189, 2.489327, 1, 0, 0.8588235, 1,
1.049, -0.1470435, 2.232485, 1, 0, 0.8509804, 1,
1.056774, 0.8406361, 1.069889, 1, 0, 0.8470588, 1,
1.056846, -0.7654799, 1.13059, 1, 0, 0.8392157, 1,
1.05866, 1.091302, 0.8927736, 1, 0, 0.8352941, 1,
1.066758, 0.5382482, 1.288747, 1, 0, 0.827451, 1,
1.06868, 0.2615023, 0.3800224, 1, 0, 0.8235294, 1,
1.069713, 1.11139, 1.948871, 1, 0, 0.8156863, 1,
1.069727, 0.3580628, 0.6876674, 1, 0, 0.8117647, 1,
1.0737, -0.7179061, 2.453115, 1, 0, 0.8039216, 1,
1.07624, -0.1800341, 1.5082, 1, 0, 0.7960784, 1,
1.080603, -0.3908831, 0.8344224, 1, 0, 0.7921569, 1,
1.085413, -0.8408062, 0.7996807, 1, 0, 0.7843137, 1,
1.095249, 0.1627776, 2.66523, 1, 0, 0.7803922, 1,
1.115334, -1.060573, 1.502321, 1, 0, 0.772549, 1,
1.115741, 0.1608853, 1.198177, 1, 0, 0.7686275, 1,
1.116226, -1.854619, 3.424173, 1, 0, 0.7607843, 1,
1.116336, -1.980409, 3.892986, 1, 0, 0.7568628, 1,
1.119663, -0.7257645, 2.023976, 1, 0, 0.7490196, 1,
1.119994, -1.679493, 1.019003, 1, 0, 0.7450981, 1,
1.120725, -0.5283985, 3.395311, 1, 0, 0.7372549, 1,
1.122099, 0.6448234, 2.316919, 1, 0, 0.7333333, 1,
1.1274, 0.4946763, 1.166913, 1, 0, 0.7254902, 1,
1.128973, -0.8874552, 2.184444, 1, 0, 0.7215686, 1,
1.129251, -0.6495633, 0.7900721, 1, 0, 0.7137255, 1,
1.13007, -1.456133, 1.319983, 1, 0, 0.7098039, 1,
1.137903, -0.2441137, 2.026458, 1, 0, 0.7019608, 1,
1.139289, 0.4305859, 0.7505541, 1, 0, 0.6941177, 1,
1.152117, 0.2816678, 1.769054, 1, 0, 0.6901961, 1,
1.154988, 0.02248218, 0.9787596, 1, 0, 0.682353, 1,
1.159348, -1.040907, 0.4612489, 1, 0, 0.6784314, 1,
1.177981, 0.08699428, 0.933803, 1, 0, 0.6705883, 1,
1.195903, 0.6314784, 1.361752, 1, 0, 0.6666667, 1,
1.197553, -0.4362048, 3.539376, 1, 0, 0.6588235, 1,
1.197858, -1.459186, 1.504479, 1, 0, 0.654902, 1,
1.20679, -0.1880817, 2.112182, 1, 0, 0.6470588, 1,
1.209843, 0.1344944, -0.03180128, 1, 0, 0.6431373, 1,
1.216452, -0.4414678, 3.101864, 1, 0, 0.6352941, 1,
1.219044, -0.80494, 0.7071636, 1, 0, 0.6313726, 1,
1.223487, -1.75633, 1.070187, 1, 0, 0.6235294, 1,
1.264281, -0.6639137, 3.984861, 1, 0, 0.6196079, 1,
1.287307, 0.568567, 0.540545, 1, 0, 0.6117647, 1,
1.298066, 0.4377015, 2.426784, 1, 0, 0.6078432, 1,
1.301831, 0.539148, 0.8129866, 1, 0, 0.6, 1,
1.305044, 1.723616, 1.035765, 1, 0, 0.5921569, 1,
1.305582, -0.9114183, 1.501235, 1, 0, 0.5882353, 1,
1.309159, -1.542931, 2.983289, 1, 0, 0.5803922, 1,
1.320662, 2.243423, -0.5036982, 1, 0, 0.5764706, 1,
1.342423, -0.9162633, 2.020473, 1, 0, 0.5686275, 1,
1.343864, 1.9884, 0.3586592, 1, 0, 0.5647059, 1,
1.356144, 0.4606992, 2.316213, 1, 0, 0.5568628, 1,
1.374274, -0.3177563, 0.3472845, 1, 0, 0.5529412, 1,
1.383675, -0.4445194, 0.238566, 1, 0, 0.5450981, 1,
1.391322, -0.5005406, 2.201565, 1, 0, 0.5411765, 1,
1.398093, 1.769251, 1.517284, 1, 0, 0.5333334, 1,
1.403113, 0.6492215, 1.270348, 1, 0, 0.5294118, 1,
1.405265, 0.815905, 3.505046, 1, 0, 0.5215687, 1,
1.408428, -0.2881617, 1.864695, 1, 0, 0.5176471, 1,
1.420484, 1.652753, 1.50622, 1, 0, 0.509804, 1,
1.423877, -0.6188468, 1.653459, 1, 0, 0.5058824, 1,
1.429461, 0.1760369, 1.894276, 1, 0, 0.4980392, 1,
1.433015, -0.4230709, 1.079773, 1, 0, 0.4901961, 1,
1.434904, 0.06866758, 1.91965, 1, 0, 0.4862745, 1,
1.438295, -0.7534319, 1.827031, 1, 0, 0.4784314, 1,
1.440545, 0.3129105, 0.8374774, 1, 0, 0.4745098, 1,
1.448269, 1.284508, 1.19735, 1, 0, 0.4666667, 1,
1.44946, 1.345523, -0.8925148, 1, 0, 0.4627451, 1,
1.453621, 0.2622999, 0.9965114, 1, 0, 0.454902, 1,
1.459868, 0.5090241, 2.657025, 1, 0, 0.4509804, 1,
1.475788, -0.9716938, 2.075685, 1, 0, 0.4431373, 1,
1.487531, -0.3319579, 2.53231, 1, 0, 0.4392157, 1,
1.504584, -0.6941767, 1.817417, 1, 0, 0.4313726, 1,
1.517436, 0.4463584, 1.884074, 1, 0, 0.427451, 1,
1.524735, -0.7797877, 0.2777749, 1, 0, 0.4196078, 1,
1.532015, 0.4392496, 2.119665, 1, 0, 0.4156863, 1,
1.541397, 0.7969124, 1.598039, 1, 0, 0.4078431, 1,
1.551231, -0.2142557, 2.523365, 1, 0, 0.4039216, 1,
1.55942, -0.7314976, 0.7123377, 1, 0, 0.3960784, 1,
1.560971, -0.2826361, 2.307822, 1, 0, 0.3882353, 1,
1.572744, -0.01785444, 1.96397, 1, 0, 0.3843137, 1,
1.573962, 0.9202643, 1.009263, 1, 0, 0.3764706, 1,
1.581016, -0.9720105, 1.789489, 1, 0, 0.372549, 1,
1.585207, -0.1171502, 2.062887, 1, 0, 0.3647059, 1,
1.600634, 1.820338, 1.140802, 1, 0, 0.3607843, 1,
1.603403, 0.7891291, 0.9229633, 1, 0, 0.3529412, 1,
1.604462, -0.7345629, 2.141636, 1, 0, 0.3490196, 1,
1.610375, 1.201997, -0.9871112, 1, 0, 0.3411765, 1,
1.613275, 0.3376879, 0.5385619, 1, 0, 0.3372549, 1,
1.616314, 0.193459, 2.397164, 1, 0, 0.3294118, 1,
1.61725, -1.125809, 1.492257, 1, 0, 0.3254902, 1,
1.635365, 0.6044505, 2.049149, 1, 0, 0.3176471, 1,
1.648474, -0.3482072, 2.161674, 1, 0, 0.3137255, 1,
1.669158, 0.05428134, 2.377697, 1, 0, 0.3058824, 1,
1.669615, 0.08152103, 0.6942615, 1, 0, 0.2980392, 1,
1.6734, -0.1293692, 1.370103, 1, 0, 0.2941177, 1,
1.68747, -0.4226817, 2.026012, 1, 0, 0.2862745, 1,
1.690756, -0.3411207, 2.383672, 1, 0, 0.282353, 1,
1.723646, 0.2347832, -0.2904554, 1, 0, 0.2745098, 1,
1.729684, 1.445784, 1.240362, 1, 0, 0.2705882, 1,
1.7414, -0.2994439, 1.152738, 1, 0, 0.2627451, 1,
1.744726, 2.46172, 0.6231236, 1, 0, 0.2588235, 1,
1.771116, -0.372225, 4.106347, 1, 0, 0.2509804, 1,
1.805832, -0.08573911, 2.1276, 1, 0, 0.2470588, 1,
1.806866, 0.6637262, 1.701901, 1, 0, 0.2392157, 1,
1.816869, 1.715378, 1.199046, 1, 0, 0.2352941, 1,
1.838288, -0.1229069, 0.5446525, 1, 0, 0.227451, 1,
1.838631, 0.0688668, 2.983464, 1, 0, 0.2235294, 1,
1.842218, -1.591165, 3.644039, 1, 0, 0.2156863, 1,
1.851501, -0.1838909, 2.364059, 1, 0, 0.2117647, 1,
1.866898, -0.5327244, 1.59763, 1, 0, 0.2039216, 1,
1.869754, 0.9352561, 1.16116, 1, 0, 0.1960784, 1,
1.880817, 0.2308976, 0.1272469, 1, 0, 0.1921569, 1,
1.882281, 0.1250588, 2.522022, 1, 0, 0.1843137, 1,
1.921745, -0.1595068, 0.7053976, 1, 0, 0.1803922, 1,
1.925002, -2.06298, 3.035333, 1, 0, 0.172549, 1,
1.985319, 0.9464713, 1.616318, 1, 0, 0.1686275, 1,
2.02272, 1.245827, 3.231364, 1, 0, 0.1607843, 1,
2.023144, -0.4075951, 3.585061, 1, 0, 0.1568628, 1,
2.041511, -0.1591808, 0.5868609, 1, 0, 0.1490196, 1,
2.073989, 0.1515235, 2.997104, 1, 0, 0.145098, 1,
2.111354, -1.327715, 3.454156, 1, 0, 0.1372549, 1,
2.118012, 0.5354945, 2.97954, 1, 0, 0.1333333, 1,
2.122512, 0.8230454, 1.960679, 1, 0, 0.1254902, 1,
2.139725, -0.05177683, 2.417715, 1, 0, 0.1215686, 1,
2.146425, -1.380375, 2.955787, 1, 0, 0.1137255, 1,
2.150075, 0.9952922, 1.094618, 1, 0, 0.1098039, 1,
2.157729, -0.8300794, 1.610483, 1, 0, 0.1019608, 1,
2.16285, 0.3811744, 0.04942767, 1, 0, 0.09411765, 1,
2.218158, -1.61333, 1.081728, 1, 0, 0.09019608, 1,
2.249574, 0.06516654, 1.116205, 1, 0, 0.08235294, 1,
2.317789, -0.01637993, 2.427448, 1, 0, 0.07843138, 1,
2.318728, -1.434591, 0.978521, 1, 0, 0.07058824, 1,
2.323614, -0.4746114, 0.4729995, 1, 0, 0.06666667, 1,
2.357231, -1.099996, 4.121546, 1, 0, 0.05882353, 1,
2.371531, -0.5888681, 2.37982, 1, 0, 0.05490196, 1,
2.40769, -1.919111, -1.249006, 1, 0, 0.04705882, 1,
2.434671, 0.1092163, 3.213065, 1, 0, 0.04313726, 1,
2.543163, -1.255659, 2.457633, 1, 0, 0.03529412, 1,
2.631439, 1.156556, 1.3614, 1, 0, 0.03137255, 1,
2.664912, 2.058434, 1.054233, 1, 0, 0.02352941, 1,
2.746086, -0.6772436, 2.449511, 1, 0, 0.01960784, 1,
3.016531, 0.1057842, 2.10511, 1, 0, 0.01176471, 1,
3.228891, 0.3322743, -0.3056539, 1, 0, 0.007843138, 1
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
0.1321045, -4.968551, -7.097857, 0, -0.5, 0.5, 0.5,
0.1321045, -4.968551, -7.097857, 1, -0.5, 0.5, 0.5,
0.1321045, -4.968551, -7.097857, 1, 1.5, 0.5, 0.5,
0.1321045, -4.968551, -7.097857, 0, 1.5, 0.5, 0.5
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
-4.014492, -0.04043913, -7.097857, 0, -0.5, 0.5, 0.5,
-4.014492, -0.04043913, -7.097857, 1, -0.5, 0.5, 0.5,
-4.014492, -0.04043913, -7.097857, 1, 1.5, 0.5, 0.5,
-4.014492, -0.04043913, -7.097857, 0, 1.5, 0.5, 0.5
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
-4.014492, -4.968551, 0.4569561, 0, -0.5, 0.5, 0.5,
-4.014492, -4.968551, 0.4569561, 1, -0.5, 0.5, 0.5,
-4.014492, -4.968551, 0.4569561, 1, 1.5, 0.5, 0.5,
-4.014492, -4.968551, 0.4569561, 0, 1.5, 0.5, 0.5
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
-2, -3.831294, -5.354439,
3, -3.831294, -5.354439,
-2, -3.831294, -5.354439,
-2, -4.020837, -5.645009,
-1, -3.831294, -5.354439,
-1, -4.020837, -5.645009,
0, -3.831294, -5.354439,
0, -4.020837, -5.645009,
1, -3.831294, -5.354439,
1, -4.020837, -5.645009,
2, -3.831294, -5.354439,
2, -4.020837, -5.645009,
3, -3.831294, -5.354439,
3, -4.020837, -5.645009
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
-2, -4.399922, -6.226148, 0, -0.5, 0.5, 0.5,
-2, -4.399922, -6.226148, 1, -0.5, 0.5, 0.5,
-2, -4.399922, -6.226148, 1, 1.5, 0.5, 0.5,
-2, -4.399922, -6.226148, 0, 1.5, 0.5, 0.5,
-1, -4.399922, -6.226148, 0, -0.5, 0.5, 0.5,
-1, -4.399922, -6.226148, 1, -0.5, 0.5, 0.5,
-1, -4.399922, -6.226148, 1, 1.5, 0.5, 0.5,
-1, -4.399922, -6.226148, 0, 1.5, 0.5, 0.5,
0, -4.399922, -6.226148, 0, -0.5, 0.5, 0.5,
0, -4.399922, -6.226148, 1, -0.5, 0.5, 0.5,
0, -4.399922, -6.226148, 1, 1.5, 0.5, 0.5,
0, -4.399922, -6.226148, 0, 1.5, 0.5, 0.5,
1, -4.399922, -6.226148, 0, -0.5, 0.5, 0.5,
1, -4.399922, -6.226148, 1, -0.5, 0.5, 0.5,
1, -4.399922, -6.226148, 1, 1.5, 0.5, 0.5,
1, -4.399922, -6.226148, 0, 1.5, 0.5, 0.5,
2, -4.399922, -6.226148, 0, -0.5, 0.5, 0.5,
2, -4.399922, -6.226148, 1, -0.5, 0.5, 0.5,
2, -4.399922, -6.226148, 1, 1.5, 0.5, 0.5,
2, -4.399922, -6.226148, 0, 1.5, 0.5, 0.5,
3, -4.399922, -6.226148, 0, -0.5, 0.5, 0.5,
3, -4.399922, -6.226148, 1, -0.5, 0.5, 0.5,
3, -4.399922, -6.226148, 1, 1.5, 0.5, 0.5,
3, -4.399922, -6.226148, 0, 1.5, 0.5, 0.5
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
-3.057585, -2, -5.354439,
-3.057585, 2, -5.354439,
-3.057585, -2, -5.354439,
-3.21707, -2, -5.645009,
-3.057585, 0, -5.354439,
-3.21707, 0, -5.645009,
-3.057585, 2, -5.354439,
-3.21707, 2, -5.645009
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
-3.536039, -2, -6.226148, 0, -0.5, 0.5, 0.5,
-3.536039, -2, -6.226148, 1, -0.5, 0.5, 0.5,
-3.536039, -2, -6.226148, 1, 1.5, 0.5, 0.5,
-3.536039, -2, -6.226148, 0, 1.5, 0.5, 0.5,
-3.536039, 0, -6.226148, 0, -0.5, 0.5, 0.5,
-3.536039, 0, -6.226148, 1, -0.5, 0.5, 0.5,
-3.536039, 0, -6.226148, 1, 1.5, 0.5, 0.5,
-3.536039, 0, -6.226148, 0, 1.5, 0.5, 0.5,
-3.536039, 2, -6.226148, 0, -0.5, 0.5, 0.5,
-3.536039, 2, -6.226148, 1, -0.5, 0.5, 0.5,
-3.536039, 2, -6.226148, 1, 1.5, 0.5, 0.5,
-3.536039, 2, -6.226148, 0, 1.5, 0.5, 0.5
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
-3.057585, -3.831294, -4,
-3.057585, -3.831294, 6,
-3.057585, -3.831294, -4,
-3.21707, -4.020837, -4,
-3.057585, -3.831294, -2,
-3.21707, -4.020837, -2,
-3.057585, -3.831294, 0,
-3.21707, -4.020837, 0,
-3.057585, -3.831294, 2,
-3.21707, -4.020837, 2,
-3.057585, -3.831294, 4,
-3.21707, -4.020837, 4,
-3.057585, -3.831294, 6,
-3.21707, -4.020837, 6
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
-3.536039, -4.399922, -4, 0, -0.5, 0.5, 0.5,
-3.536039, -4.399922, -4, 1, -0.5, 0.5, 0.5,
-3.536039, -4.399922, -4, 1, 1.5, 0.5, 0.5,
-3.536039, -4.399922, -4, 0, 1.5, 0.5, 0.5,
-3.536039, -4.399922, -2, 0, -0.5, 0.5, 0.5,
-3.536039, -4.399922, -2, 1, -0.5, 0.5, 0.5,
-3.536039, -4.399922, -2, 1, 1.5, 0.5, 0.5,
-3.536039, -4.399922, -2, 0, 1.5, 0.5, 0.5,
-3.536039, -4.399922, 0, 0, -0.5, 0.5, 0.5,
-3.536039, -4.399922, 0, 1, -0.5, 0.5, 0.5,
-3.536039, -4.399922, 0, 1, 1.5, 0.5, 0.5,
-3.536039, -4.399922, 0, 0, 1.5, 0.5, 0.5,
-3.536039, -4.399922, 2, 0, -0.5, 0.5, 0.5,
-3.536039, -4.399922, 2, 1, -0.5, 0.5, 0.5,
-3.536039, -4.399922, 2, 1, 1.5, 0.5, 0.5,
-3.536039, -4.399922, 2, 0, 1.5, 0.5, 0.5,
-3.536039, -4.399922, 4, 0, -0.5, 0.5, 0.5,
-3.536039, -4.399922, 4, 1, -0.5, 0.5, 0.5,
-3.536039, -4.399922, 4, 1, 1.5, 0.5, 0.5,
-3.536039, -4.399922, 4, 0, 1.5, 0.5, 0.5,
-3.536039, -4.399922, 6, 0, -0.5, 0.5, 0.5,
-3.536039, -4.399922, 6, 1, -0.5, 0.5, 0.5,
-3.536039, -4.399922, 6, 1, 1.5, 0.5, 0.5,
-3.536039, -4.399922, 6, 0, 1.5, 0.5, 0.5
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
-3.057585, -3.831294, -5.354439,
-3.057585, 3.750416, -5.354439,
-3.057585, -3.831294, 6.268351,
-3.057585, 3.750416, 6.268351,
-3.057585, -3.831294, -5.354439,
-3.057585, -3.831294, 6.268351,
-3.057585, 3.750416, -5.354439,
-3.057585, 3.750416, 6.268351,
-3.057585, -3.831294, -5.354439,
3.321794, -3.831294, -5.354439,
-3.057585, -3.831294, 6.268351,
3.321794, -3.831294, 6.268351,
-3.057585, 3.750416, -5.354439,
3.321794, 3.750416, -5.354439,
-3.057585, 3.750416, 6.268351,
3.321794, 3.750416, 6.268351,
3.321794, -3.831294, -5.354439,
3.321794, 3.750416, -5.354439,
3.321794, -3.831294, 6.268351,
3.321794, 3.750416, 6.268351,
3.321794, -3.831294, -5.354439,
3.321794, -3.831294, 6.268351,
3.321794, 3.750416, -5.354439,
3.321794, 3.750416, 6.268351
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
var radius = 8.155547;
var distance = 36.28495;
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
mvMatrix.translate( -0.1321045, 0.04043913, -0.4569561 );
mvMatrix.scale( 1.382256, 1.163054, 0.7586765 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.28495);
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
chlorbromuron<-read.table("chlorbromuron.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-chlorbromuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'chlorbromuron' not found
```

```r
y<-chlorbromuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'chlorbromuron' not found
```

```r
z<-chlorbromuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'chlorbromuron' not found
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
-2.964682, 1.336802, -0.7555352, 0, 0, 1, 1, 1,
-2.94178, 0.8514308, -1.777157, 1, 0, 0, 1, 1,
-2.784948, 0.14323, -2.188632, 1, 0, 0, 1, 1,
-2.601728, -0.5447797, -1.723673, 1, 0, 0, 1, 1,
-2.586719, 0.775986, -0.7113687, 1, 0, 0, 1, 1,
-2.528838, 0.2405523, -1.139703, 1, 0, 0, 1, 1,
-2.426615, 0.8229052, -1.241487, 0, 0, 0, 1, 1,
-2.419852, -2.113902, -0.07009993, 0, 0, 0, 1, 1,
-2.332941, -0.111342, -2.073993, 0, 0, 0, 1, 1,
-2.299725, -0.23216, -2.888528, 0, 0, 0, 1, 1,
-2.287803, -0.1098142, -2.520069, 0, 0, 0, 1, 1,
-2.220473, 0.763671, -1.4931, 0, 0, 0, 1, 1,
-2.158879, 0.2315231, -2.05911, 0, 0, 0, 1, 1,
-2.124863, -0.7148222, -1.76884, 1, 1, 1, 1, 1,
-2.107353, -2.334039, -2.432569, 1, 1, 1, 1, 1,
-2.094544, -0.5087261, -2.800429, 1, 1, 1, 1, 1,
-2.089538, -0.842538, -3.751565, 1, 1, 1, 1, 1,
-2.042714, 1.416203, -2.807601, 1, 1, 1, 1, 1,
-2.038753, -1.03824, -0.8933283, 1, 1, 1, 1, 1,
-2.014414, 0.221594, -1.499416, 1, 1, 1, 1, 1,
-2.008362, -0.7676356, -2.317508, 1, 1, 1, 1, 1,
-1.986836, 0.307705, -1.881322, 1, 1, 1, 1, 1,
-1.974438, -0.4352975, -3.035432, 1, 1, 1, 1, 1,
-1.954207, -0.771768, -1.834059, 1, 1, 1, 1, 1,
-1.945232, 1.138215, -1.292481, 1, 1, 1, 1, 1,
-1.933438, 0.1710737, -1.649709, 1, 1, 1, 1, 1,
-1.922815, 0.2131285, -2.254747, 1, 1, 1, 1, 1,
-1.918349, -1.893164, -1.153684, 1, 1, 1, 1, 1,
-1.893666, -0.0877566, 0.2545362, 0, 0, 1, 1, 1,
-1.891603, 1.918972, -0.8395754, 1, 0, 0, 1, 1,
-1.862647, 0.6647353, -0.5606284, 1, 0, 0, 1, 1,
-1.862222, 1.057659, -0.5113851, 1, 0, 0, 1, 1,
-1.848411, -2.294777, -1.744029, 1, 0, 0, 1, 1,
-1.814743, -0.5835464, -2.764848, 1, 0, 0, 1, 1,
-1.81395, 0.8969818, 0.6537011, 0, 0, 0, 1, 1,
-1.799849, 0.144615, -1.04335, 0, 0, 0, 1, 1,
-1.783449, 0.7873033, -1.008639, 0, 0, 0, 1, 1,
-1.76457, -1.312584, -2.310368, 0, 0, 0, 1, 1,
-1.76147, 0.4350482, -1.620053, 0, 0, 0, 1, 1,
-1.75616, -1.139463, -0.645233, 0, 0, 0, 1, 1,
-1.752812, 1.691593, -1.863964, 0, 0, 0, 1, 1,
-1.739234, 1.381735, -1.789658, 1, 1, 1, 1, 1,
-1.723436, 0.5893364, -0.6217076, 1, 1, 1, 1, 1,
-1.722874, -0.5757908, -1.662285, 1, 1, 1, 1, 1,
-1.711789, -0.08302709, -1.109281, 1, 1, 1, 1, 1,
-1.698398, 0.6219183, 2.206175, 1, 1, 1, 1, 1,
-1.691481, -0.1915594, -3.226269, 1, 1, 1, 1, 1,
-1.686163, -0.3905741, -1.723418, 1, 1, 1, 1, 1,
-1.682963, 0.3909036, -1.484174, 1, 1, 1, 1, 1,
-1.673303, -0.6987147, -1.366632, 1, 1, 1, 1, 1,
-1.656525, 1.80192, -1.655422, 1, 1, 1, 1, 1,
-1.649352, 0.3230095, -1.776904, 1, 1, 1, 1, 1,
-1.637368, -0.9084329, -4.106097, 1, 1, 1, 1, 1,
-1.635189, -1.182926, -1.01235, 1, 1, 1, 1, 1,
-1.619035, -0.486474, -1.624893, 1, 1, 1, 1, 1,
-1.610792, -0.2629716, -0.3719899, 1, 1, 1, 1, 1,
-1.609237, -1.327923, -2.315657, 0, 0, 1, 1, 1,
-1.599595, -0.4722876, -1.591317, 1, 0, 0, 1, 1,
-1.586702, 0.4335242, -1.599719, 1, 0, 0, 1, 1,
-1.56599, 0.3263174, -1.287233, 1, 0, 0, 1, 1,
-1.552934, -0.3709463, -0.8962162, 1, 0, 0, 1, 1,
-1.548142, -1.343183, -1.354471, 1, 0, 0, 1, 1,
-1.544692, 0.4023592, -1.738436, 0, 0, 0, 1, 1,
-1.536814, 0.05916505, -2.52422, 0, 0, 0, 1, 1,
-1.535923, -0.3794682, -2.919237, 0, 0, 0, 1, 1,
-1.529981, -1.702878, -4.381274, 0, 0, 0, 1, 1,
-1.525437, 1.265631, 0.7378865, 0, 0, 0, 1, 1,
-1.502824, -0.2505238, -0.6830863, 0, 0, 0, 1, 1,
-1.500299, 0.4150081, -0.07827386, 0, 0, 0, 1, 1,
-1.491845, 1.53068, -1.483744, 1, 1, 1, 1, 1,
-1.469754, -0.8286838, 0.01168942, 1, 1, 1, 1, 1,
-1.464205, -1.549826, -3.307717, 1, 1, 1, 1, 1,
-1.463414, -0.07920226, -1.447168, 1, 1, 1, 1, 1,
-1.45992, 1.264908, -1.50369, 1, 1, 1, 1, 1,
-1.450102, -1.823146, -2.684454, 1, 1, 1, 1, 1,
-1.449045, 1.149302, -1.800862, 1, 1, 1, 1, 1,
-1.438529, -0.6502547, -1.900655, 1, 1, 1, 1, 1,
-1.434106, 0.7846872, -1.042116, 1, 1, 1, 1, 1,
-1.432766, 0.1369708, -1.877206, 1, 1, 1, 1, 1,
-1.425783, -0.05646527, -1.288513, 1, 1, 1, 1, 1,
-1.420715, 1.211734, -0.4508235, 1, 1, 1, 1, 1,
-1.408942, 1.362188, -3.120293, 1, 1, 1, 1, 1,
-1.408399, -0.9914911, -4.173113, 1, 1, 1, 1, 1,
-1.407484, 0.1654317, -1.955312, 1, 1, 1, 1, 1,
-1.397904, 0.9753591, -1.303126, 0, 0, 1, 1, 1,
-1.395017, -1.032155, -1.582695, 1, 0, 0, 1, 1,
-1.383278, -0.3799485, -2.00634, 1, 0, 0, 1, 1,
-1.382045, -1.497726, -2.944023, 1, 0, 0, 1, 1,
-1.381559, 0.4242465, -0.65076, 1, 0, 0, 1, 1,
-1.379943, 0.470978, -0.6292161, 1, 0, 0, 1, 1,
-1.37334, 0.9976335, -1.180894, 0, 0, 0, 1, 1,
-1.372202, -1.192225, -3.937224, 0, 0, 0, 1, 1,
-1.369328, 0.3775401, -2.819624, 0, 0, 0, 1, 1,
-1.36678, -0.3115218, -3.060288, 0, 0, 0, 1, 1,
-1.364952, 0.5648792, -0.9199246, 0, 0, 0, 1, 1,
-1.34504, -1.504081, -3.972348, 0, 0, 0, 1, 1,
-1.344612, 0.3212072, -1.992682, 0, 0, 0, 1, 1,
-1.344136, -0.5645236, -1.987655, 1, 1, 1, 1, 1,
-1.331124, 1.140578, 0.6236657, 1, 1, 1, 1, 1,
-1.329856, -0.4682512, -3.588546, 1, 1, 1, 1, 1,
-1.32878, 0.7787689, -1.064591, 1, 1, 1, 1, 1,
-1.318697, 0.4686528, -1.737545, 1, 1, 1, 1, 1,
-1.315017, 0.3009311, -1.796269, 1, 1, 1, 1, 1,
-1.313129, 0.6661748, -1.275112, 1, 1, 1, 1, 1,
-1.30712, 0.1465242, -0.7092148, 1, 1, 1, 1, 1,
-1.306491, -0.3717409, -3.556565, 1, 1, 1, 1, 1,
-1.301711, 1.502512, -0.8306419, 1, 1, 1, 1, 1,
-1.300638, 0.2439769, -2.284542, 1, 1, 1, 1, 1,
-1.292569, -0.3930214, -1.813717, 1, 1, 1, 1, 1,
-1.285455, -1.13746, -4.003621, 1, 1, 1, 1, 1,
-1.284251, -0.8461866, -3.433395, 1, 1, 1, 1, 1,
-1.280206, -0.4151883, 0.7168148, 1, 1, 1, 1, 1,
-1.278269, -1.022423, -3.250931, 0, 0, 1, 1, 1,
-1.271626, -0.798281, -1.496215, 1, 0, 0, 1, 1,
-1.268965, 0.2648576, 0.7324595, 1, 0, 0, 1, 1,
-1.266138, 0.3903686, 0.6286011, 1, 0, 0, 1, 1,
-1.264616, 0.2062686, -1.218645, 1, 0, 0, 1, 1,
-1.254795, -2.128092, -3.269778, 1, 0, 0, 1, 1,
-1.242978, 0.3613182, -1.246876, 0, 0, 0, 1, 1,
-1.241322, 0.6657748, -0.1334571, 0, 0, 0, 1, 1,
-1.231036, -1.083178, -1.239682, 0, 0, 0, 1, 1,
-1.228558, 2.635477, -0.4104398, 0, 0, 0, 1, 1,
-1.224355, -0.104684, -2.773238, 0, 0, 0, 1, 1,
-1.218655, 2.131961, -0.9584381, 0, 0, 0, 1, 1,
-1.210853, -1.066327, -2.498713, 0, 0, 0, 1, 1,
-1.201934, -0.4447474, -2.153805, 1, 1, 1, 1, 1,
-1.19818, 0.2155624, -0.2753781, 1, 1, 1, 1, 1,
-1.197912, -0.1376573, -0.3857971, 1, 1, 1, 1, 1,
-1.19319, -0.4396127, -3.009302, 1, 1, 1, 1, 1,
-1.184864, 0.9876904, -0.3983362, 1, 1, 1, 1, 1,
-1.179232, -0.8878335, -1.653853, 1, 1, 1, 1, 1,
-1.175347, -0.1532138, -2.137745, 1, 1, 1, 1, 1,
-1.174223, -1.291047, -1.951237, 1, 1, 1, 1, 1,
-1.173614, 0.03594667, -0.9125583, 1, 1, 1, 1, 1,
-1.171756, 1.320219, -2.232455, 1, 1, 1, 1, 1,
-1.150829, 0.5527202, -1.450646, 1, 1, 1, 1, 1,
-1.150705, -0.5481476, -1.799239, 1, 1, 1, 1, 1,
-1.150473, -1.077178, -1.670474, 1, 1, 1, 1, 1,
-1.149838, -1.509205, -1.939451, 1, 1, 1, 1, 1,
-1.148136, 0.3212457, -0.3990225, 1, 1, 1, 1, 1,
-1.144064, -1.294026, -1.91646, 0, 0, 1, 1, 1,
-1.137142, -1.06856, -3.134708, 1, 0, 0, 1, 1,
-1.13573, -0.1311404, -1.852771, 1, 0, 0, 1, 1,
-1.128969, -0.2724366, -2.969257, 1, 0, 0, 1, 1,
-1.117631, 1.413419, 1.117915, 1, 0, 0, 1, 1,
-1.115456, 0.6778663, -2.052153, 1, 0, 0, 1, 1,
-1.108549, -0.5677386, -4.581289, 0, 0, 0, 1, 1,
-1.105786, 1.454637, 0.01654954, 0, 0, 0, 1, 1,
-1.105495, 0.8436337, -3.193854, 0, 0, 0, 1, 1,
-1.101574, -0.6298994, -1.613192, 0, 0, 0, 1, 1,
-1.096579, 0.5568053, -1.546952, 0, 0, 0, 1, 1,
-1.090802, 2.066944, -0.9957421, 0, 0, 0, 1, 1,
-1.08534, -0.9042952, -1.399424, 0, 0, 0, 1, 1,
-1.083512, 1.005041, -1.427457, 1, 1, 1, 1, 1,
-1.076274, 0.1912979, 0.3268131, 1, 1, 1, 1, 1,
-1.071191, 1.724228, 0.3209763, 1, 1, 1, 1, 1,
-1.068294, -0.2903493, -1.155802, 1, 1, 1, 1, 1,
-1.059354, -1.113167, -3.15269, 1, 1, 1, 1, 1,
-1.059277, 0.4157777, -2.451569, 1, 1, 1, 1, 1,
-1.05569, 0.3029847, 0.5740642, 1, 1, 1, 1, 1,
-1.053943, 1.408584, -0.9411561, 1, 1, 1, 1, 1,
-1.046755, -0.02213501, -2.432153, 1, 1, 1, 1, 1,
-1.041357, -0.3426282, -3.185044, 1, 1, 1, 1, 1,
-1.037983, 0.4089113, -1.307632, 1, 1, 1, 1, 1,
-1.034582, 1.822778, -2.970948, 1, 1, 1, 1, 1,
-1.031905, 0.8669282, -1.089749, 1, 1, 1, 1, 1,
-1.029852, -0.09752947, -3.527141, 1, 1, 1, 1, 1,
-1.026322, -1.203901, -3.212543, 1, 1, 1, 1, 1,
-1.023287, 0.5019915, -1.972256, 0, 0, 1, 1, 1,
-1.016302, -0.6896792, -1.274208, 1, 0, 0, 1, 1,
-1.014743, 1.164747, 0.2905157, 1, 0, 0, 1, 1,
-1.011102, -1.406191, -2.394892, 1, 0, 0, 1, 1,
-1.008118, 1.212526, -0.3140166, 1, 0, 0, 1, 1,
-1.005803, -0.5005338, -1.9201, 1, 0, 0, 1, 1,
-1.000726, 0.4615519, -1.442073, 0, 0, 0, 1, 1,
-0.99799, -0.007975649, -0.8977613, 0, 0, 0, 1, 1,
-0.9972675, 0.7039155, -0.8006058, 0, 0, 0, 1, 1,
-0.9950208, 1.099462, -0.7966956, 0, 0, 0, 1, 1,
-0.9940143, -0.5181488, -0.8393088, 0, 0, 0, 1, 1,
-0.9925715, 0.04537491, -0.5935888, 0, 0, 0, 1, 1,
-0.984026, 0.1708041, -0.8241103, 0, 0, 0, 1, 1,
-0.9792922, -0.3295645, -1.86267, 1, 1, 1, 1, 1,
-0.976469, -0.2182392, -3.657236, 1, 1, 1, 1, 1,
-0.9734581, -0.5614302, -2.216418, 1, 1, 1, 1, 1,
-0.9637975, -0.7605358, -0.9403188, 1, 1, 1, 1, 1,
-0.958895, -0.7692592, -2.679653, 1, 1, 1, 1, 1,
-0.9586145, 0.4321825, 1.268272, 1, 1, 1, 1, 1,
-0.9576409, 0.977421, -1.667216, 1, 1, 1, 1, 1,
-0.955242, 0.5621077, -3.169958, 1, 1, 1, 1, 1,
-0.9545419, -0.08338729, -2.963091, 1, 1, 1, 1, 1,
-0.9536558, 0.3203498, -2.752402, 1, 1, 1, 1, 1,
-0.9493017, -0.3742675, -1.896004, 1, 1, 1, 1, 1,
-0.9462785, -1.088383, -1.439519, 1, 1, 1, 1, 1,
-0.9444354, -1.263382, -2.041069, 1, 1, 1, 1, 1,
-0.9440711, 0.5896169, -2.368608, 1, 1, 1, 1, 1,
-0.9428851, 0.8176007, -0.4561358, 1, 1, 1, 1, 1,
-0.933432, 0.1966099, -1.47429, 0, 0, 1, 1, 1,
-0.9333994, 1.615749, -0.8354365, 1, 0, 0, 1, 1,
-0.9283809, 0.2878602, -1.702448, 1, 0, 0, 1, 1,
-0.9235477, -0.06848042, -3.078908, 1, 0, 0, 1, 1,
-0.9218321, -3.399162e-05, -0.8861607, 1, 0, 0, 1, 1,
-0.9213343, -1.022052, -2.968454, 1, 0, 0, 1, 1,
-0.9206941, -0.2705731, -0.99125, 0, 0, 0, 1, 1,
-0.9187742, 1.185134, -0.2807363, 0, 0, 0, 1, 1,
-0.9143124, 0.7325896, 0.1389416, 0, 0, 0, 1, 1,
-0.9118612, 0.3954085, -1.175068, 0, 0, 0, 1, 1,
-0.9097287, -1.261571, -4.044835, 0, 0, 0, 1, 1,
-0.9084106, 0.0404158, -0.4220854, 0, 0, 0, 1, 1,
-0.9083297, 0.4422089, -0.6420463, 0, 0, 0, 1, 1,
-0.9060506, -2.389952, -3.302548, 1, 1, 1, 1, 1,
-0.9003548, 0.397168, -1.575554, 1, 1, 1, 1, 1,
-0.8978265, 0.9605947, 0.1146804, 1, 1, 1, 1, 1,
-0.8934122, -0.8786945, -0.4189763, 1, 1, 1, 1, 1,
-0.8903533, -0.5753595, -3.080118, 1, 1, 1, 1, 1,
-0.8858858, 1.186295, -0.8501738, 1, 1, 1, 1, 1,
-0.8789818, -0.7751743, -3.191474, 1, 1, 1, 1, 1,
-0.8740014, 0.9580891, -1.72556, 1, 1, 1, 1, 1,
-0.8706072, -1.73901, -3.719421, 1, 1, 1, 1, 1,
-0.867311, -0.1350364, -1.17657, 1, 1, 1, 1, 1,
-0.8601669, 0.7349118, 1.292719, 1, 1, 1, 1, 1,
-0.858043, -2.523539, -3.189582, 1, 1, 1, 1, 1,
-0.8561977, 0.5519618, -0.514135, 1, 1, 1, 1, 1,
-0.8527634, -1.409126, -2.065048, 1, 1, 1, 1, 1,
-0.8524531, -1.019358, -2.159102, 1, 1, 1, 1, 1,
-0.8522102, -0.04409553, -1.355407, 0, 0, 1, 1, 1,
-0.8482974, -0.7502847, -1.436867, 1, 0, 0, 1, 1,
-0.8443199, -1.258644, -2.494778, 1, 0, 0, 1, 1,
-0.8342577, 0.02229504, -1.672423, 1, 0, 0, 1, 1,
-0.823827, -0.3931629, -1.19337, 1, 0, 0, 1, 1,
-0.8226395, 0.1256385, 0.6358512, 1, 0, 0, 1, 1,
-0.8201075, 0.3887588, 1.261982, 0, 0, 0, 1, 1,
-0.8141057, -1.384644, -2.43654, 0, 0, 0, 1, 1,
-0.8119661, 0.8148694, -0.2555273, 0, 0, 0, 1, 1,
-0.8082592, -0.362566, -2.331191, 0, 0, 0, 1, 1,
-0.8063608, -0.3205022, -1.328686, 0, 0, 0, 1, 1,
-0.8021139, -0.3552357, -4.207067, 0, 0, 0, 1, 1,
-0.7941633, 1.022617, 0.2398077, 0, 0, 0, 1, 1,
-0.78719, 2.028435, -1.74691, 1, 1, 1, 1, 1,
-0.7853301, -0.7339598, -2.703807, 1, 1, 1, 1, 1,
-0.7830979, -2.110453, -3.256137, 1, 1, 1, 1, 1,
-0.7820063, -0.2256581, -1.986999, 1, 1, 1, 1, 1,
-0.7768189, -0.3645793, -3.528827, 1, 1, 1, 1, 1,
-0.7754785, 1.866385, -0.9876706, 1, 1, 1, 1, 1,
-0.7708451, -0.469375, -0.6865244, 1, 1, 1, 1, 1,
-0.7698597, -0.9101886, -2.074219, 1, 1, 1, 1, 1,
-0.7611409, -0.4450289, -1.962382, 1, 1, 1, 1, 1,
-0.7570567, 2.010162, -1.034584, 1, 1, 1, 1, 1,
-0.7569134, 0.463399, -1.852967, 1, 1, 1, 1, 1,
-0.7550818, 1.08955, 0.4881731, 1, 1, 1, 1, 1,
-0.745197, -1.02007, -3.500572, 1, 1, 1, 1, 1,
-0.7432662, -1.573896, -2.153349, 1, 1, 1, 1, 1,
-0.7419943, 0.376252, -0.5624501, 1, 1, 1, 1, 1,
-0.7396687, -0.125279, -1.367434, 0, 0, 1, 1, 1,
-0.7302577, -3.039928, -2.382734, 1, 0, 0, 1, 1,
-0.7295952, -0.1128892, -1.701414, 1, 0, 0, 1, 1,
-0.7243528, -1.272423, -3.154874, 1, 0, 0, 1, 1,
-0.7156453, -1.388559, -2.362613, 1, 0, 0, 1, 1,
-0.7128224, -1.570217, -3.348609, 1, 0, 0, 1, 1,
-0.7099436, 1.44564, -0.9227182, 0, 0, 0, 1, 1,
-0.7078641, -0.4427942, -1.316329, 0, 0, 0, 1, 1,
-0.7068273, 1.835955, 0.6683343, 0, 0, 0, 1, 1,
-0.7056314, 0.9133577, -1.805357, 0, 0, 0, 1, 1,
-0.7052845, 0.1157766, 0.08093586, 0, 0, 0, 1, 1,
-0.7041378, -1.090125, -3.601655, 0, 0, 0, 1, 1,
-0.6876522, 1.098794, 0.4246169, 0, 0, 0, 1, 1,
-0.6784356, -1.508934, -2.82076, 1, 1, 1, 1, 1,
-0.6768571, 1.38556, 1.124877, 1, 1, 1, 1, 1,
-0.6755814, -0.9604927, -3.397541, 1, 1, 1, 1, 1,
-0.6719283, 0.3448912, 0.0698352, 1, 1, 1, 1, 1,
-0.6709889, 0.8018432, 0.5657619, 1, 1, 1, 1, 1,
-0.6687304, -0.1828956, -1.587214, 1, 1, 1, 1, 1,
-0.6665525, -0.4426605, -1.769335, 1, 1, 1, 1, 1,
-0.6653082, 0.9374238, 0.2056611, 1, 1, 1, 1, 1,
-0.6633319, -0.2126379, -0.6632898, 1, 1, 1, 1, 1,
-0.6628962, -0.01144458, -2.613703, 1, 1, 1, 1, 1,
-0.6581225, -1.126423, -1.233678, 1, 1, 1, 1, 1,
-0.65782, -1.13796, -3.029999, 1, 1, 1, 1, 1,
-0.655037, 0.8224402, 0.1488683, 1, 1, 1, 1, 1,
-0.6547098, -1.651133, -3.997254, 1, 1, 1, 1, 1,
-0.6537356, 2.603872, 0.1888754, 1, 1, 1, 1, 1,
-0.6492009, -1.076595, -2.88161, 0, 0, 1, 1, 1,
-0.6454253, 0.8711241, -1.103625, 1, 0, 0, 1, 1,
-0.633677, -0.5242735, -2.683893, 1, 0, 0, 1, 1,
-0.6283815, 0.3411431, -2.130415, 1, 0, 0, 1, 1,
-0.6272454, 0.5456014, -0.9262292, 1, 0, 0, 1, 1,
-0.6260154, -0.5810692, -1.070429, 1, 0, 0, 1, 1,
-0.6184308, 0.7743621, -1.163523, 0, 0, 0, 1, 1,
-0.6098105, 0.6569815, -1.46032, 0, 0, 0, 1, 1,
-0.607785, 0.5734451, -0.5367163, 0, 0, 0, 1, 1,
-0.604718, 0.1793191, -0.7973427, 0, 0, 0, 1, 1,
-0.5958684, 0.6109447, 0.885957, 0, 0, 0, 1, 1,
-0.5926625, -0.7455585, -0.9937249, 0, 0, 0, 1, 1,
-0.5893069, 0.754603, -0.2743954, 0, 0, 0, 1, 1,
-0.5856682, 0.7326273, 0.3744094, 1, 1, 1, 1, 1,
-0.5820177, 0.8122416, 0.2236899, 1, 1, 1, 1, 1,
-0.5819573, -1.033552, -3.193343, 1, 1, 1, 1, 1,
-0.5798354, -0.1735918, -2.283254, 1, 1, 1, 1, 1,
-0.5777684, -0.167225, -3.039332, 1, 1, 1, 1, 1,
-0.5775966, -0.2223651, -2.177506, 1, 1, 1, 1, 1,
-0.5727449, -0.09656213, -2.241529, 1, 1, 1, 1, 1,
-0.5677089, -0.2122706, -1.296104, 1, 1, 1, 1, 1,
-0.5626942, -0.2080147, -1.764601, 1, 1, 1, 1, 1,
-0.5600544, -2.006186, -4.027915, 1, 1, 1, 1, 1,
-0.559841, -1.438259, -1.587101, 1, 1, 1, 1, 1,
-0.558569, -0.1320309, -0.7978203, 1, 1, 1, 1, 1,
-0.5584202, 0.8102869, 1.439776, 1, 1, 1, 1, 1,
-0.5569595, 2.148966, 0.2533957, 1, 1, 1, 1, 1,
-0.5550839, 1.425511, -0.8944959, 1, 1, 1, 1, 1,
-0.5490438, 0.7467679, -0.9449854, 0, 0, 1, 1, 1,
-0.5482895, 0.9129087, -0.9152324, 1, 0, 0, 1, 1,
-0.5424798, 0.5095229, -0.9816967, 1, 0, 0, 1, 1,
-0.5371434, 1.345639, 1.899949, 1, 0, 0, 1, 1,
-0.5349558, 0.3902624, -1.830061, 1, 0, 0, 1, 1,
-0.5279313, -1.308103, -2.507131, 1, 0, 0, 1, 1,
-0.5274355, -0.7022967, -3.691274, 0, 0, 0, 1, 1,
-0.5188521, 0.638679, 0.2117168, 0, 0, 0, 1, 1,
-0.5170028, 1.760746, -1.35049, 0, 0, 0, 1, 1,
-0.5143592, 0.7958465, -2.335751, 0, 0, 0, 1, 1,
-0.5126341, -0.638359, -2.658366, 0, 0, 0, 1, 1,
-0.5097575, 1.53067, -1.559132, 0, 0, 0, 1, 1,
-0.5089679, -1.479614, -3.636945, 0, 0, 0, 1, 1,
-0.5057025, -0.2672348, -2.354586, 1, 1, 1, 1, 1,
-0.5052137, 0.1220446, -1.430936, 1, 1, 1, 1, 1,
-0.504292, -1.451826, -2.087574, 1, 1, 1, 1, 1,
-0.497835, 0.4160849, 0.3179985, 1, 1, 1, 1, 1,
-0.4973979, 0.04603787, -1.31327, 1, 1, 1, 1, 1,
-0.4965678, -0.4825972, -1.263652, 1, 1, 1, 1, 1,
-0.4918674, -0.379408, -4.442002, 1, 1, 1, 1, 1,
-0.4890677, 0.0595715, -2.487285, 1, 1, 1, 1, 1,
-0.4751695, 0.3312958, -0.07710361, 1, 1, 1, 1, 1,
-0.4749435, -1.013404, -2.04306, 1, 1, 1, 1, 1,
-0.4743458, -0.09069392, -1.799975, 1, 1, 1, 1, 1,
-0.4728583, 0.6778451, -0.2223223, 1, 1, 1, 1, 1,
-0.469127, -0.8484374, -3.041284, 1, 1, 1, 1, 1,
-0.4636124, 0.04773769, -0.5110047, 1, 1, 1, 1, 1,
-0.4619761, -1.260942, -3.216089, 1, 1, 1, 1, 1,
-0.4573379, -0.914197, -2.820308, 0, 0, 1, 1, 1,
-0.4524247, -1.095743, -3.944083, 1, 0, 0, 1, 1,
-0.4515121, -0.2466417, -2.290067, 1, 0, 0, 1, 1,
-0.4502249, 0.5862746, 0.2689458, 1, 0, 0, 1, 1,
-0.4498403, -0.6105404, -2.878962, 1, 0, 0, 1, 1,
-0.4474921, -1.219264, -1.591339, 1, 0, 0, 1, 1,
-0.4394005, -1.869959, -4.181878, 0, 0, 0, 1, 1,
-0.4348771, 0.4811551, -1.177114, 0, 0, 0, 1, 1,
-0.4342416, 0.1173053, -0.9019861, 0, 0, 0, 1, 1,
-0.432798, 0.6256028, -0.8264222, 0, 0, 0, 1, 1,
-0.4270021, 1.061721, -0.2414735, 0, 0, 0, 1, 1,
-0.4186805, 0.7261645, -0.2713711, 0, 0, 0, 1, 1,
-0.4167807, 1.223362, 0.6822907, 0, 0, 0, 1, 1,
-0.4163187, -3.720881, -2.917144, 1, 1, 1, 1, 1,
-0.4123131, 0.1426583, -0.932412, 1, 1, 1, 1, 1,
-0.4107428, 0.0178861, -2.881463, 1, 1, 1, 1, 1,
-0.4080463, -0.3499529, -2.649594, 1, 1, 1, 1, 1,
-0.4073884, 0.6469852, -1.187515, 1, 1, 1, 1, 1,
-0.400584, 1.415057, -1.471735, 1, 1, 1, 1, 1,
-0.3996507, 0.6520156, 0.4934031, 1, 1, 1, 1, 1,
-0.3986137, -0.1526227, -2.641415, 1, 1, 1, 1, 1,
-0.3922847, -0.6656775, -1.325359, 1, 1, 1, 1, 1,
-0.3897892, -0.5137728, -1.215136, 1, 1, 1, 1, 1,
-0.3887481, -0.2057809, -1.459277, 1, 1, 1, 1, 1,
-0.3827833, 0.9898462, 1.058498, 1, 1, 1, 1, 1,
-0.3810147, 1.394869, -0.8425435, 1, 1, 1, 1, 1,
-0.3799074, 0.7822543, 0.1638412, 1, 1, 1, 1, 1,
-0.3783642, -0.4823104, -1.39286, 1, 1, 1, 1, 1,
-0.3766946, -0.7022573, -2.777144, 0, 0, 1, 1, 1,
-0.3756961, 0.3369412, -0.6448692, 1, 0, 0, 1, 1,
-0.3667002, 0.5603198, 0.6574374, 1, 0, 0, 1, 1,
-0.3653605, -0.3438234, -2.067315, 1, 0, 0, 1, 1,
-0.3650397, 0.8192555, 1.422502, 1, 0, 0, 1, 1,
-0.3626176, 0.1367022, -2.434508, 1, 0, 0, 1, 1,
-0.3619226, -0.3466901, -2.295046, 0, 0, 0, 1, 1,
-0.3606047, -1.348595, -3.2511, 0, 0, 0, 1, 1,
-0.360077, 1.3269, 0.7808713, 0, 0, 0, 1, 1,
-0.3566124, -0.8589345, -3.556219, 0, 0, 0, 1, 1,
-0.3534716, 0.9359397, 0.4083428, 0, 0, 0, 1, 1,
-0.3429748, -0.7126547, -2.40955, 0, 0, 0, 1, 1,
-0.3427964, 0.7621585, -0.4224877, 0, 0, 0, 1, 1,
-0.3420889, 1.350538, -0.07961909, 1, 1, 1, 1, 1,
-0.339755, -0.3374628, -1.817649, 1, 1, 1, 1, 1,
-0.3390915, 1.69342, 1.503244, 1, 1, 1, 1, 1,
-0.3326078, -0.0267943, -1.89334, 1, 1, 1, 1, 1,
-0.3313778, -0.4727806, -2.232903, 1, 1, 1, 1, 1,
-0.3282031, 1.437993, -1.511117, 1, 1, 1, 1, 1,
-0.3259949, 0.5350189, 1.306629, 1, 1, 1, 1, 1,
-0.3181703, -0.01750295, -2.097642, 1, 1, 1, 1, 1,
-0.3171854, 0.8914732, -0.4354566, 1, 1, 1, 1, 1,
-0.3164273, 1.842208, 0.264693, 1, 1, 1, 1, 1,
-0.3153544, -0.5692885, -3.120945, 1, 1, 1, 1, 1,
-0.3133277, 0.4716136, -0.5788103, 1, 1, 1, 1, 1,
-0.3126591, -0.01918677, -0.7754307, 1, 1, 1, 1, 1,
-0.3123589, -0.2369335, -0.9207337, 1, 1, 1, 1, 1,
-0.3121719, 1.204035, -0.3350799, 1, 1, 1, 1, 1,
-0.3075073, -0.1296908, -2.357178, 0, 0, 1, 1, 1,
-0.3071553, -0.9677548, -3.889208, 1, 0, 0, 1, 1,
-0.3048311, 0.9123778, -1.250259, 1, 0, 0, 1, 1,
-0.3008206, -0.04970423, -3.007551, 1, 0, 0, 1, 1,
-0.2989705, -0.007101753, -0.2904031, 1, 0, 0, 1, 1,
-0.2983319, 0.5955806, -1.408416, 1, 0, 0, 1, 1,
-0.2971008, -0.8889194, -2.345744, 0, 0, 0, 1, 1,
-0.2930996, 0.3162551, -0.01503289, 0, 0, 0, 1, 1,
-0.292643, 1.681845, -1.33549, 0, 0, 0, 1, 1,
-0.2895345, 0.7694573, 0.5842614, 0, 0, 0, 1, 1,
-0.2889131, -0.383179, -2.919991, 0, 0, 0, 1, 1,
-0.2884664, 0.9859863, -1.46595, 0, 0, 0, 1, 1,
-0.2841005, 1.229215, -1.014556, 0, 0, 0, 1, 1,
-0.283024, 1.21938, -0.3750732, 1, 1, 1, 1, 1,
-0.2827576, -0.9002016, -5.185175, 1, 1, 1, 1, 1,
-0.282315, -1.158042, -2.355241, 1, 1, 1, 1, 1,
-0.28171, 1.703728, -0.4669128, 1, 1, 1, 1, 1,
-0.2813153, -0.00185697, -0.06975609, 1, 1, 1, 1, 1,
-0.2806175, -0.02030352, -2.430218, 1, 1, 1, 1, 1,
-0.2773215, -0.1657245, 0.6282509, 1, 1, 1, 1, 1,
-0.2691951, -0.4972443, -1.672163, 1, 1, 1, 1, 1,
-0.2682984, 0.8161471, 1.170199, 1, 1, 1, 1, 1,
-0.2663689, 0.3453155, 0.6417026, 1, 1, 1, 1, 1,
-0.2654227, -1.019095, -3.301161, 1, 1, 1, 1, 1,
-0.2489183, -2.691372, -3.979462, 1, 1, 1, 1, 1,
-0.2464076, -0.02672062, -2.087545, 1, 1, 1, 1, 1,
-0.244434, 0.4057268, 1.674616, 1, 1, 1, 1, 1,
-0.2397417, 0.8385854, -0.2170684, 1, 1, 1, 1, 1,
-0.2355831, 0.6500543, 1.139909, 0, 0, 1, 1, 1,
-0.2342919, 1.136085, -2.152413, 1, 0, 0, 1, 1,
-0.2342349, -0.1120666, -1.454484, 1, 0, 0, 1, 1,
-0.2307629, 0.5517396, -1.30119, 1, 0, 0, 1, 1,
-0.2291196, -0.334925, -0.7935386, 1, 0, 0, 1, 1,
-0.2285992, 0.5656535, -1.105755, 1, 0, 0, 1, 1,
-0.2266273, -1.963261, -2.319052, 0, 0, 0, 1, 1,
-0.2260887, -0.5582944, -1.748106, 0, 0, 0, 1, 1,
-0.2250741, -0.4712628, -3.157473, 0, 0, 0, 1, 1,
-0.2241392, 1.335506, -0.2063836, 0, 0, 0, 1, 1,
-0.2189467, 0.8710063, -0.1911843, 0, 0, 0, 1, 1,
-0.2182357, 0.08845682, -1.123951, 0, 0, 0, 1, 1,
-0.2133626, -1.29974, -2.248653, 0, 0, 0, 1, 1,
-0.2087799, -1.959688, -4.166267, 1, 1, 1, 1, 1,
-0.2086116, 2.077976, 0.2136248, 1, 1, 1, 1, 1,
-0.2076464, 0.1321487, -0.8586035, 1, 1, 1, 1, 1,
-0.2052702, -1.97167, -2.383337, 1, 1, 1, 1, 1,
-0.2041312, 1.082789, -0.2677023, 1, 1, 1, 1, 1,
-0.2009911, 1.350306, 2.245604, 1, 1, 1, 1, 1,
-0.1996035, 0.6800137, -2.172944, 1, 1, 1, 1, 1,
-0.1979564, 1.350784, 0.190449, 1, 1, 1, 1, 1,
-0.1939431, 0.4831244, -0.7508864, 1, 1, 1, 1, 1,
-0.1929477, 0.4259315, -1.676343, 1, 1, 1, 1, 1,
-0.1920012, 0.7155926, 1.070008, 1, 1, 1, 1, 1,
-0.1895394, 0.09826618, 0.8542325, 1, 1, 1, 1, 1,
-0.1849954, 0.4681761, 1.23036, 1, 1, 1, 1, 1,
-0.1846692, -1.268882, -3.494797, 1, 1, 1, 1, 1,
-0.1805263, 0.8788223, -0.5890412, 1, 1, 1, 1, 1,
-0.1793138, -0.1040213, -0.8147186, 0, 0, 1, 1, 1,
-0.1773558, 0.4038131, -0.3940376, 1, 0, 0, 1, 1,
-0.172637, 1.114409, 0.4612515, 1, 0, 0, 1, 1,
-0.1698527, 0.3039669, -2.612561, 1, 0, 0, 1, 1,
-0.1697876, 0.5667439, -0.7759556, 1, 0, 0, 1, 1,
-0.1697625, 0.4173744, -0.7172238, 1, 0, 0, 1, 1,
-0.168879, 0.3294538, -0.6172176, 0, 0, 0, 1, 1,
-0.1673828, 0.1846309, -2.90001, 0, 0, 0, 1, 1,
-0.1672171, 0.7230227, -1.255036, 0, 0, 0, 1, 1,
-0.1631761, 0.7837939, 0.7527797, 0, 0, 0, 1, 1,
-0.1591596, -0.1395499, -2.268302, 0, 0, 0, 1, 1,
-0.15367, -0.4057654, -3.793362, 0, 0, 0, 1, 1,
-0.1522494, -0.1448691, -1.915286, 0, 0, 0, 1, 1,
-0.15179, -0.9026713, -3.033439, 1, 1, 1, 1, 1,
-0.1512918, -0.2962198, -3.447267, 1, 1, 1, 1, 1,
-0.1494049, 0.7191756, -0.03708711, 1, 1, 1, 1, 1,
-0.1466764, -0.3750606, -2.102161, 1, 1, 1, 1, 1,
-0.1429746, -0.6078994, -1.490541, 1, 1, 1, 1, 1,
-0.1396949, -0.4265397, -3.018147, 1, 1, 1, 1, 1,
-0.1395114, 1.62185, 0.5922608, 1, 1, 1, 1, 1,
-0.1228825, -0.5567558, -3.801546, 1, 1, 1, 1, 1,
-0.1084886, 0.1032371, -0.7706781, 1, 1, 1, 1, 1,
-0.101977, 1.343093, -0.3016084, 1, 1, 1, 1, 1,
-0.09407797, 0.08973941, -0.2596562, 1, 1, 1, 1, 1,
-0.0930189, -1.511811, -2.813739, 1, 1, 1, 1, 1,
-0.08717842, 0.5248094, -0.7176847, 1, 1, 1, 1, 1,
-0.08343682, -0.2754443, -4.851721, 1, 1, 1, 1, 1,
-0.07971202, -1.734074, -3.734474, 1, 1, 1, 1, 1,
-0.07619808, -1.364048, -2.962094, 0, 0, 1, 1, 1,
-0.0709029, -1.871992, -3.389506, 1, 0, 0, 1, 1,
-0.06907574, -0.9227149, -2.783046, 1, 0, 0, 1, 1,
-0.06673945, 1.723355, -0.9149848, 1, 0, 0, 1, 1,
-0.06174651, -0.7676277, -2.776087, 1, 0, 0, 1, 1,
-0.05640697, -1.147769, -3.930867, 1, 0, 0, 1, 1,
-0.05254521, 0.7582372, -0.8891345, 0, 0, 0, 1, 1,
-0.05229063, 0.600451, -1.632363, 0, 0, 0, 1, 1,
-0.05100715, -0.06293223, -2.549663, 0, 0, 0, 1, 1,
-0.05047119, 1.334091, 0.3848202, 0, 0, 0, 1, 1,
-0.04808865, -0.2003611, -4.211188, 0, 0, 0, 1, 1,
-0.04708198, 1.03462, -0.1787742, 0, 0, 0, 1, 1,
-0.04094531, 0.7586709, 0.7598346, 0, 0, 0, 1, 1,
-0.0401658, 0.7887005, -0.1905115, 1, 1, 1, 1, 1,
-0.0397075, -0.8154899, -1.849511, 1, 1, 1, 1, 1,
-0.03878767, 1.543705, 1.88441, 1, 1, 1, 1, 1,
-0.03807835, -0.259966, -4.55714, 1, 1, 1, 1, 1,
-0.03653872, 1.919106, 1.65509, 1, 1, 1, 1, 1,
-0.03425347, -1.29389, -2.876159, 1, 1, 1, 1, 1,
-0.03266974, -0.5677367, -3.378956, 1, 1, 1, 1, 1,
-0.03049952, 1.162803, -2.713365, 1, 1, 1, 1, 1,
-0.02555202, 0.09917704, 1.911935, 1, 1, 1, 1, 1,
-0.02456436, 1.424127, 1.203186, 1, 1, 1, 1, 1,
-0.02284867, 0.5264371, -0.9190881, 1, 1, 1, 1, 1,
-0.022396, -2.661249, -2.546993, 1, 1, 1, 1, 1,
-0.016074, 2.053723, 1.292751, 1, 1, 1, 1, 1,
-0.01392711, -0.8328671, -3.071883, 1, 1, 1, 1, 1,
-0.01368526, -2.070678, -3.208478, 1, 1, 1, 1, 1,
-0.01243917, -0.05287236, -2.234296, 0, 0, 1, 1, 1,
-0.0120593, 0.9003354, 0.1688571, 1, 0, 0, 1, 1,
-0.01029112, 1.084035, -0.3869713, 1, 0, 0, 1, 1,
-0.00998063, 0.8266037, 0.1137082, 1, 0, 0, 1, 1,
-0.009977764, -0.873547, -3.012362, 1, 0, 0, 1, 1,
-0.006669391, 1.099995, -0.2824558, 1, 0, 0, 1, 1,
-0.005300914, 0.06839838, 0.3977189, 0, 0, 0, 1, 1,
-0.004732402, 1.125393, -0.2699922, 0, 0, 0, 1, 1,
-0.002606702, -0.6313647, -1.628925, 0, 0, 0, 1, 1,
-0.001509608, 0.2782881, -0.4304771, 0, 0, 0, 1, 1,
0.002860863, -0.7478256, 3.780002, 0, 0, 0, 1, 1,
0.003407212, -1.41219, 3.519514, 0, 0, 0, 1, 1,
0.006590657, -1.075293, 5.317665, 0, 0, 0, 1, 1,
0.007214508, -0.4191064, 3.788506, 1, 1, 1, 1, 1,
0.007505109, 0.6304886, -1.171423, 1, 1, 1, 1, 1,
0.009093968, 1.176448, 0.6551463, 1, 1, 1, 1, 1,
0.01174248, -1.823372, 3.356244, 1, 1, 1, 1, 1,
0.01266221, 1.054777, 0.7504066, 1, 1, 1, 1, 1,
0.01617857, 0.387838, -0.07109524, 1, 1, 1, 1, 1,
0.01743022, -1.833901, 2.732273, 1, 1, 1, 1, 1,
0.02097029, -0.3114074, 1.536946, 1, 1, 1, 1, 1,
0.02700784, -2.237367, 2.98177, 1, 1, 1, 1, 1,
0.02742152, 1.283734, 1.060715, 1, 1, 1, 1, 1,
0.03023218, 0.4118217, 0.006650005, 1, 1, 1, 1, 1,
0.037388, 0.9927007, 0.6701648, 1, 1, 1, 1, 1,
0.03774523, -0.4472347, 2.662349, 1, 1, 1, 1, 1,
0.03866717, 0.8350496, -0.3521309, 1, 1, 1, 1, 1,
0.04113975, -0.9587832, 4.637528, 1, 1, 1, 1, 1,
0.04129595, -1.371745, 1.158978, 0, 0, 1, 1, 1,
0.04491852, -1.004623, 3.331795, 1, 0, 0, 1, 1,
0.04592443, 0.5540816, 0.04570166, 1, 0, 0, 1, 1,
0.0535799, -0.4325121, 1.610752, 1, 0, 0, 1, 1,
0.06246537, 0.7675266, 1.133304, 1, 0, 0, 1, 1,
0.06658601, -1.004963, 3.985726, 1, 0, 0, 1, 1,
0.06701606, -1.415846, 3.705915, 0, 0, 0, 1, 1,
0.07323351, -0.4381199, 1.416027, 0, 0, 0, 1, 1,
0.07540441, -0.4581741, 3.801933, 0, 0, 0, 1, 1,
0.07597, 0.4652422, 0.4666024, 0, 0, 0, 1, 1,
0.07735816, -1.195591, 4.667685, 0, 0, 0, 1, 1,
0.07819717, 1.006554, -0.6471887, 0, 0, 0, 1, 1,
0.09605645, -0.6121476, 3.311242, 0, 0, 0, 1, 1,
0.09718156, 1.196422, -0.2563238, 1, 1, 1, 1, 1,
0.09993843, -1.319009, 6.099087, 1, 1, 1, 1, 1,
0.1004042, 1.560566, -0.2960061, 1, 1, 1, 1, 1,
0.1034406, -1.868965, 1.178143, 1, 1, 1, 1, 1,
0.1038067, 0.3707633, -1.267, 1, 1, 1, 1, 1,
0.1061485, 0.8872907, 0.5765219, 1, 1, 1, 1, 1,
0.1080211, -0.4199746, 4.256988, 1, 1, 1, 1, 1,
0.1092723, -0.7115514, 3.12946, 1, 1, 1, 1, 1,
0.1101115, 0.09149906, 1.735551, 1, 1, 1, 1, 1,
0.1103444, 1.766286, -0.8950926, 1, 1, 1, 1, 1,
0.1114976, 1.166159, -0.9851987, 1, 1, 1, 1, 1,
0.1146563, 0.8548585, -0.3687718, 1, 1, 1, 1, 1,
0.1190364, -2.021955, 2.557881, 1, 1, 1, 1, 1,
0.1223877, -0.7705247, 4.404928, 1, 1, 1, 1, 1,
0.1234072, 0.3859711, 0.3554386, 1, 1, 1, 1, 1,
0.1247192, 1.232172, -1.479726, 0, 0, 1, 1, 1,
0.1247999, 0.7107657, 1.578879, 1, 0, 0, 1, 1,
0.1286332, -1.356119, 2.84305, 1, 0, 0, 1, 1,
0.1385222, -1.913191, 3.594575, 1, 0, 0, 1, 1,
0.1388923, -0.8520767, 2.627916, 1, 0, 0, 1, 1,
0.1407377, -1.296113, 1.992912, 1, 0, 0, 1, 1,
0.1425689, 0.2912868, -0.8605726, 0, 0, 0, 1, 1,
0.1488522, -0.5311694, 2.637762, 0, 0, 0, 1, 1,
0.152133, -1.094218, 3.075493, 0, 0, 0, 1, 1,
0.1528602, 0.246847, 0.461169, 0, 0, 0, 1, 1,
0.1532881, -0.9661569, 2.926822, 0, 0, 0, 1, 1,
0.1592922, -0.01648529, 1.452239, 0, 0, 0, 1, 1,
0.160701, 0.2886363, 0.9218991, 0, 0, 0, 1, 1,
0.1607675, 0.7359794, 0.9510688, 1, 1, 1, 1, 1,
0.1648204, -0.08531841, 0.152503, 1, 1, 1, 1, 1,
0.1656751, -1.956065, 3.217515, 1, 1, 1, 1, 1,
0.1664377, -0.2246078, 1.927815, 1, 1, 1, 1, 1,
0.1670577, 1.338157, 1.786522, 1, 1, 1, 1, 1,
0.1683235, -1.065276, 4.130075, 1, 1, 1, 1, 1,
0.170623, -0.6914708, 3.474296, 1, 1, 1, 1, 1,
0.1762131, 0.4493731, -0.1087069, 1, 1, 1, 1, 1,
0.1763837, -1.058146, 3.579203, 1, 1, 1, 1, 1,
0.1794574, 0.6284001, 1.120523, 1, 1, 1, 1, 1,
0.1818205, 2.240021, 2.359617, 1, 1, 1, 1, 1,
0.1852016, 1.39377, -1.367122, 1, 1, 1, 1, 1,
0.1879392, -1.006726, 0.8658283, 1, 1, 1, 1, 1,
0.1883422, -1.296811, 2.456897, 1, 1, 1, 1, 1,
0.1981075, -0.8214348, 2.970196, 1, 1, 1, 1, 1,
0.2008884, -0.06977314, 1.501544, 0, 0, 1, 1, 1,
0.2059529, -1.03107, 2.567655, 1, 0, 0, 1, 1,
0.2095726, -0.4130708, 2.717926, 1, 0, 0, 1, 1,
0.2097083, -1.757537, 3.077343, 1, 0, 0, 1, 1,
0.2098905, -0.07998693, 2.655054, 1, 0, 0, 1, 1,
0.2118574, 0.1291182, 0.01464525, 1, 0, 0, 1, 1,
0.213113, 0.7706174, -0.0684169, 0, 0, 0, 1, 1,
0.2178708, 2.095133, 0.1911456, 0, 0, 0, 1, 1,
0.2181073, -0.7974788, 2.578418, 0, 0, 0, 1, 1,
0.2247439, 0.06025869, 0.8786474, 0, 0, 0, 1, 1,
0.2261606, -0.7999727, 1.585445, 0, 0, 0, 1, 1,
0.2317649, 0.4399458, 1.087721, 0, 0, 0, 1, 1,
0.2341709, 0.2414479, 0.9013993, 0, 0, 0, 1, 1,
0.241242, -0.2977764, 2.380123, 1, 1, 1, 1, 1,
0.2427122, -1.035248, 3.746521, 1, 1, 1, 1, 1,
0.2430526, 0.006233009, 2.603256, 1, 1, 1, 1, 1,
0.243678, 1.292676, -1.165849, 1, 1, 1, 1, 1,
0.2466262, 0.5092899, 0.2649657, 1, 1, 1, 1, 1,
0.2473667, -0.9548061, 4.186331, 1, 1, 1, 1, 1,
0.2561427, 0.5040815, 1.39199, 1, 1, 1, 1, 1,
0.257248, -1.881763, 2.238214, 1, 1, 1, 1, 1,
0.257758, 1.346186, -1.805636, 1, 1, 1, 1, 1,
0.2608834, 0.958725, 1.702215, 1, 1, 1, 1, 1,
0.2614963, 0.4413146, 2.326292, 1, 1, 1, 1, 1,
0.2650942, -1.538416, 3.76304, 1, 1, 1, 1, 1,
0.2689125, -0.4379573, 2.877383, 1, 1, 1, 1, 1,
0.2697361, 0.8849258, 0.3569646, 1, 1, 1, 1, 1,
0.2758003, 0.0181269, 0.8162836, 1, 1, 1, 1, 1,
0.2762364, 0.2370581, 0.6464933, 0, 0, 1, 1, 1,
0.2787716, -2.269736, 4.387351, 1, 0, 0, 1, 1,
0.279189, 0.8662913, 0.949389, 1, 0, 0, 1, 1,
0.2820404, -1.351838, 1.891384, 1, 0, 0, 1, 1,
0.2858629, -0.5894934, 1.481278, 1, 0, 0, 1, 1,
0.2918735, -0.7171937, 2.718066, 1, 0, 0, 1, 1,
0.2936825, 1.521463, 0.0600463, 0, 0, 0, 1, 1,
0.2941402, 0.8614331, -0.02275964, 0, 0, 0, 1, 1,
0.2997674, 0.9176478, -0.5666988, 0, 0, 0, 1, 1,
0.3002118, 0.6028656, 0.8175496, 0, 0, 0, 1, 1,
0.3015864, -0.9288124, 3.385967, 0, 0, 0, 1, 1,
0.3021452, 0.1053887, 0.9468741, 0, 0, 0, 1, 1,
0.3022432, 0.0207029, 0.5419897, 0, 0, 0, 1, 1,
0.3073464, 1.665174, -0.2406466, 1, 1, 1, 1, 1,
0.308053, -0.1964306, 2.885489, 1, 1, 1, 1, 1,
0.3107249, -0.6526303, 2.566503, 1, 1, 1, 1, 1,
0.3182313, 3.640002, 0.4000651, 1, 1, 1, 1, 1,
0.3204938, -1.206177, 0.751881, 1, 1, 1, 1, 1,
0.3220041, 0.5610323, 0.2322885, 1, 1, 1, 1, 1,
0.3222381, -0.7395247, 3.523513, 1, 1, 1, 1, 1,
0.323269, -2.609021, 3.123964, 1, 1, 1, 1, 1,
0.3263861, -0.4878013, 0.8054468, 1, 1, 1, 1, 1,
0.3271894, 0.32326, 0.4029766, 1, 1, 1, 1, 1,
0.3282786, 0.6447558, 2.387499, 1, 1, 1, 1, 1,
0.3284551, -1.166802, 1.612348, 1, 1, 1, 1, 1,
0.329057, 1.494889, -0.160518, 1, 1, 1, 1, 1,
0.3371624, 0.697314, 1.268173, 1, 1, 1, 1, 1,
0.3380871, 0.1317136, -0.2924223, 1, 1, 1, 1, 1,
0.3391954, 1.452605, 1.159487, 0, 0, 1, 1, 1,
0.3394888, 0.06247054, 2.273833, 1, 0, 0, 1, 1,
0.3397886, 0.9955012, 1.554678, 1, 0, 0, 1, 1,
0.3406546, -0.4218924, 0.1052671, 1, 0, 0, 1, 1,
0.3422921, 1.829444, 0.4033503, 1, 0, 0, 1, 1,
0.3434567, -1.005874, 2.645709, 1, 0, 0, 1, 1,
0.3482384, 0.2681244, 1.739666, 0, 0, 0, 1, 1,
0.3486013, 0.9190262, -0.3514354, 0, 0, 0, 1, 1,
0.351169, -0.414144, 2.338837, 0, 0, 0, 1, 1,
0.3562165, -0.7993699, 0.3447961, 0, 0, 0, 1, 1,
0.3631475, 1.886305, 0.8105197, 0, 0, 0, 1, 1,
0.3712901, 0.5455332, -0.9471794, 0, 0, 0, 1, 1,
0.3718096, 0.7635233, -0.2098892, 0, 0, 0, 1, 1,
0.3738939, -0.4837477, 3.057315, 1, 1, 1, 1, 1,
0.3755758, -1.848783, 2.695996, 1, 1, 1, 1, 1,
0.3787872, -0.09716173, 2.07854, 1, 1, 1, 1, 1,
0.3798342, 1.187899, -0.05564996, 1, 1, 1, 1, 1,
0.3867345, -0.9651226, 0.9679878, 1, 1, 1, 1, 1,
0.3872527, -0.003601531, 1.674408, 1, 1, 1, 1, 1,
0.3892732, 0.308191, 2.570507, 1, 1, 1, 1, 1,
0.3949005, 0.4499046, 0.1667257, 1, 1, 1, 1, 1,
0.4007344, -1.414825, 3.402586, 1, 1, 1, 1, 1,
0.406268, -1.352018, 2.043988, 1, 1, 1, 1, 1,
0.4066958, 1.537842, 0.01233521, 1, 1, 1, 1, 1,
0.4098613, 1.091112, -0.8555526, 1, 1, 1, 1, 1,
0.4123245, 0.8258503, 0.3246512, 1, 1, 1, 1, 1,
0.4149426, 0.2416216, 1.878697, 1, 1, 1, 1, 1,
0.4151165, 0.8849887, 0.6422298, 1, 1, 1, 1, 1,
0.4151898, 0.6686463, 0.2378438, 0, 0, 1, 1, 1,
0.4232989, 0.7668788, 0.5714529, 1, 0, 0, 1, 1,
0.4257513, -0.7908875, 2.297596, 1, 0, 0, 1, 1,
0.4264252, 1.930248, 0.8548408, 1, 0, 0, 1, 1,
0.4275392, -0.2841465, 0.6035699, 1, 0, 0, 1, 1,
0.4279136, -0.2771947, 0.5547173, 1, 0, 0, 1, 1,
0.4290934, -0.3942285, 2.240601, 0, 0, 0, 1, 1,
0.4313408, 0.9511541, 0.3047082, 0, 0, 0, 1, 1,
0.4366339, -1.286117, 2.453307, 0, 0, 0, 1, 1,
0.4384939, 1.029001, -0.8058356, 0, 0, 0, 1, 1,
0.4395068, -0.7634844, 1.915107, 0, 0, 0, 1, 1,
0.4462323, 1.76847, -0.6161973, 0, 0, 0, 1, 1,
0.4464051, 0.5341473, 1.179832, 0, 0, 0, 1, 1,
0.4479786, 0.2729536, 0.7960439, 1, 1, 1, 1, 1,
0.4495878, 0.09891932, -0.294941, 1, 1, 1, 1, 1,
0.4565568, 1.101129, 0.4872025, 1, 1, 1, 1, 1,
0.4572379, -0.932131, 4.354473, 1, 1, 1, 1, 1,
0.4590377, -0.09208639, 0.9311434, 1, 1, 1, 1, 1,
0.4594221, 0.09555735, 1.074492, 1, 1, 1, 1, 1,
0.4598469, 1.466367, 1.551822, 1, 1, 1, 1, 1,
0.460216, -1.198034, 3.978814, 1, 1, 1, 1, 1,
0.4605136, -0.06164588, 2.215004, 1, 1, 1, 1, 1,
0.4672904, 0.7614233, -0.09686162, 1, 1, 1, 1, 1,
0.4673529, 1.621795, 0.8038347, 1, 1, 1, 1, 1,
0.4704731, 1.658727, -0.2066931, 1, 1, 1, 1, 1,
0.4719402, -0.5531047, 0.7432209, 1, 1, 1, 1, 1,
0.4740532, 1.118747, -1.718072, 1, 1, 1, 1, 1,
0.4745039, -0.2004009, 1.108247, 1, 1, 1, 1, 1,
0.4756014, 0.8717947, 0.9958682, 0, 0, 1, 1, 1,
0.4875375, 2.299815, -0.8704947, 1, 0, 0, 1, 1,
0.4920657, -0.9850549, 2.960134, 1, 0, 0, 1, 1,
0.496002, 0.08276172, -0.4556935, 1, 0, 0, 1, 1,
0.4962577, -0.7474051, 0.3487262, 1, 0, 0, 1, 1,
0.4974685, -0.2116957, 1.775813, 1, 0, 0, 1, 1,
0.501105, -1.209807, 2.888447, 0, 0, 0, 1, 1,
0.5070251, -1.463153, 2.661879, 0, 0, 0, 1, 1,
0.5073655, 0.812146, 1.115748, 0, 0, 0, 1, 1,
0.5082309, -1.83379, 4.156657, 0, 0, 0, 1, 1,
0.5112008, -0.1048505, 0.8664023, 0, 0, 0, 1, 1,
0.5171968, 0.3262857, 1.961604, 0, 0, 0, 1, 1,
0.5180255, -0.2290003, 3.224848, 0, 0, 0, 1, 1,
0.5181605, 1.577277, 0.04785868, 1, 1, 1, 1, 1,
0.5227135, 0.0199084, 0.9130745, 1, 1, 1, 1, 1,
0.5252568, -1.92393, 3.505676, 1, 1, 1, 1, 1,
0.5400687, 1.07447, -0.06234979, 1, 1, 1, 1, 1,
0.5430276, 0.3269989, -0.2226842, 1, 1, 1, 1, 1,
0.5431004, 1.024041, -0.3784957, 1, 1, 1, 1, 1,
0.5495484, -0.03100418, 0.02184041, 1, 1, 1, 1, 1,
0.5502148, 1.64213, -1.689934, 1, 1, 1, 1, 1,
0.5603492, -1.37997, 4.085148, 1, 1, 1, 1, 1,
0.5634328, -0.7188116, 3.290656, 1, 1, 1, 1, 1,
0.5677541, -1.169673, 3.216796, 1, 1, 1, 1, 1,
0.5685577, -0.9582965, 1.941402, 1, 1, 1, 1, 1,
0.5816418, -0.8210669, 3.881658, 1, 1, 1, 1, 1,
0.5836521, -0.1969354, 1.799061, 1, 1, 1, 1, 1,
0.5868844, -1.614232, 3.201182, 1, 1, 1, 1, 1,
0.5908055, -0.8005306, 2.809324, 0, 0, 1, 1, 1,
0.5924582, 0.9623032, -0.06854989, 1, 0, 0, 1, 1,
0.5959638, 1.025527, 1.648295, 1, 0, 0, 1, 1,
0.5986218, -1.666529, 4.001036, 1, 0, 0, 1, 1,
0.6019676, -0.1416491, 1.618445, 1, 0, 0, 1, 1,
0.604707, -0.2792663, 2.394239, 1, 0, 0, 1, 1,
0.6079753, -0.1762559, 2.951815, 0, 0, 0, 1, 1,
0.6084647, -1.756217, 1.410476, 0, 0, 0, 1, 1,
0.6179933, -0.567763, 1.724014, 0, 0, 0, 1, 1,
0.619215, 1.351187, 0.3850926, 0, 0, 0, 1, 1,
0.6206351, 0.3484348, 1.520863, 0, 0, 0, 1, 1,
0.623219, 0.1554859, 0.9574209, 0, 0, 0, 1, 1,
0.6285557, 0.2167096, -0.2765695, 0, 0, 0, 1, 1,
0.6298532, 1.246473, 0.9561152, 1, 1, 1, 1, 1,
0.6318098, 0.2186749, 1.69327, 1, 1, 1, 1, 1,
0.634331, -0.9221568, 3.440319, 1, 1, 1, 1, 1,
0.6347211, 3.000487, 0.6047747, 1, 1, 1, 1, 1,
0.6349349, -0.798611, 3.426782, 1, 1, 1, 1, 1,
0.6387469, -0.6107378, 3.57576, 1, 1, 1, 1, 1,
0.6438329, 1.164198, 0.9683692, 1, 1, 1, 1, 1,
0.6442019, 0.8308877, 0.1510747, 1, 1, 1, 1, 1,
0.6453083, -1.444268, 3.422468, 1, 1, 1, 1, 1,
0.6495782, 0.8597789, 0.1434719, 1, 1, 1, 1, 1,
0.6520761, -0.05950403, 3.43158, 1, 1, 1, 1, 1,
0.6569825, 0.7149555, 1.274413, 1, 1, 1, 1, 1,
0.6573821, -0.2064201, 2.68608, 1, 1, 1, 1, 1,
0.6580033, -0.9984917, 2.129017, 1, 1, 1, 1, 1,
0.6581426, -1.882429, 2.231719, 1, 1, 1, 1, 1,
0.659882, 1.072352, -0.8781205, 0, 0, 1, 1, 1,
0.6605179, -0.9890944, 2.110662, 1, 0, 0, 1, 1,
0.6609696, 0.963632, -1.727369, 1, 0, 0, 1, 1,
0.6616492, 0.3959076, 1.329192, 1, 0, 0, 1, 1,
0.663266, 0.03512745, 0.2730838, 1, 0, 0, 1, 1,
0.6688429, 0.6973324, 0.5816432, 1, 0, 0, 1, 1,
0.6772721, 0.3309184, 2.408837, 0, 0, 0, 1, 1,
0.6818398, 0.9754811, -1.118612, 0, 0, 0, 1, 1,
0.686791, 1.918032, 2.885221, 0, 0, 0, 1, 1,
0.691896, -0.4640578, 0.1694499, 0, 0, 0, 1, 1,
0.692039, 0.03510973, 1.273135, 0, 0, 0, 1, 1,
0.6922576, -1.132664, 1.959277, 0, 0, 0, 1, 1,
0.6963304, 1.241519, 3.361563, 0, 0, 0, 1, 1,
0.7008435, -0.142891, 3.431957, 1, 1, 1, 1, 1,
0.701589, 2.335463, 0.8365089, 1, 1, 1, 1, 1,
0.7037902, -0.03243832, -0.1129525, 1, 1, 1, 1, 1,
0.7050186, -0.9178794, 2.183537, 1, 1, 1, 1, 1,
0.7074573, -0.4355806, 3.519069, 1, 1, 1, 1, 1,
0.711414, 0.9413404, 1.967727, 1, 1, 1, 1, 1,
0.7118834, -0.1069527, -0.1273002, 1, 1, 1, 1, 1,
0.7123057, 0.286039, 1.190415, 1, 1, 1, 1, 1,
0.7174431, 1.149387, -1.353652, 1, 1, 1, 1, 1,
0.7224059, -0.4485618, 3.480645, 1, 1, 1, 1, 1,
0.7260706, 0.9584186, 0.2845954, 1, 1, 1, 1, 1,
0.7262325, -0.06564912, 1.297465, 1, 1, 1, 1, 1,
0.7268154, -0.159969, 2.558747, 1, 1, 1, 1, 1,
0.728734, 0.2817892, 0.3244281, 1, 1, 1, 1, 1,
0.7330322, 1.337198, -0.6907003, 1, 1, 1, 1, 1,
0.7340831, 0.4161223, 0.8104328, 0, 0, 1, 1, 1,
0.7341161, -0.2770995, 0.1010274, 1, 0, 0, 1, 1,
0.7409158, 2.278724, 0.7020885, 1, 0, 0, 1, 1,
0.7458692, 0.4048929, 1.487087, 1, 0, 0, 1, 1,
0.75855, 0.292987, 2.757677, 1, 0, 0, 1, 1,
0.7674068, -0.302288, 1.481881, 1, 0, 0, 1, 1,
0.7715302, 0.9431436, 0.6102284, 0, 0, 0, 1, 1,
0.7744251, 0.5125776, 0.8222346, 0, 0, 0, 1, 1,
0.7761297, -0.3543556, 3.091931, 0, 0, 0, 1, 1,
0.7771171, 0.4305743, 2.778574, 0, 0, 0, 1, 1,
0.7790108, -0.3760627, 1.405892, 0, 0, 0, 1, 1,
0.7823475, 0.8920009, 0.6520365, 0, 0, 0, 1, 1,
0.7830926, -1.424408, 2.580328, 0, 0, 0, 1, 1,
0.7878491, 0.3035861, 2.865851, 1, 1, 1, 1, 1,
0.7922264, 1.884779, 0.9636124, 1, 1, 1, 1, 1,
0.7945875, 0.3476843, 0.9872391, 1, 1, 1, 1, 1,
0.8055435, -1.083175, 2.568997, 1, 1, 1, 1, 1,
0.8070087, 0.5214087, 0.4961867, 1, 1, 1, 1, 1,
0.8095853, -0.4170675, 2.339893, 1, 1, 1, 1, 1,
0.8114775, -0.3691388, 1.743171, 1, 1, 1, 1, 1,
0.8133618, 1.762615, 1.202302, 1, 1, 1, 1, 1,
0.8137901, 1.450773, -0.7674198, 1, 1, 1, 1, 1,
0.8138715, -1.009038, 1.415776, 1, 1, 1, 1, 1,
0.8168973, -0.946896, 1.753498, 1, 1, 1, 1, 1,
0.8176807, 1.053036, 1.253061, 1, 1, 1, 1, 1,
0.8203427, 0.8804315, 1.141548, 1, 1, 1, 1, 1,
0.8336343, -1.010934, 3.863358, 1, 1, 1, 1, 1,
0.8367664, 0.8645709, 2.545207, 1, 1, 1, 1, 1,
0.8389193, 0.1264299, 2.52474, 0, 0, 1, 1, 1,
0.8420811, 1.220274, 0.7748588, 1, 0, 0, 1, 1,
0.845618, -0.5708635, 1.599796, 1, 0, 0, 1, 1,
0.8466412, -0.03923496, 0.9311181, 1, 0, 0, 1, 1,
0.8499574, 0.4750614, 1.269497, 1, 0, 0, 1, 1,
0.8535823, 0.3158564, -0.3893756, 1, 0, 0, 1, 1,
0.8538411, -0.07632721, 3.240317, 0, 0, 0, 1, 1,
0.8564795, -0.9386716, 1.536155, 0, 0, 0, 1, 1,
0.8586702, 0.1371484, 3.138492, 0, 0, 0, 1, 1,
0.8630305, -1.634477, 1.368171, 0, 0, 0, 1, 1,
0.8687003, 1.964859, 0.4211462, 0, 0, 0, 1, 1,
0.8824657, 0.4289984, 1.052992, 0, 0, 0, 1, 1,
0.8869923, -0.03386521, 0.5469504, 0, 0, 0, 1, 1,
0.8988773, -1.267717, 2.260931, 1, 1, 1, 1, 1,
0.9048788, -0.4771445, 2.548983, 1, 1, 1, 1, 1,
0.9095667, 0.646304, 0.1069868, 1, 1, 1, 1, 1,
0.9112098, 0.06447138, 0.1112421, 1, 1, 1, 1, 1,
0.9189395, 0.590019, 1.660213, 1, 1, 1, 1, 1,
0.9217871, -1.150603, 3.368942, 1, 1, 1, 1, 1,
0.9289639, -0.6305979, 3.845064, 1, 1, 1, 1, 1,
0.9301228, -0.208296, 1.968841, 1, 1, 1, 1, 1,
0.9322106, -0.2387389, 3.350589, 1, 1, 1, 1, 1,
0.9330089, -0.9319919, 1.893903, 1, 1, 1, 1, 1,
0.9333186, -1.821536, 0.9176273, 1, 1, 1, 1, 1,
0.9359298, -1.358445, 4.265079, 1, 1, 1, 1, 1,
0.9405233, 0.08964898, 1.085757, 1, 1, 1, 1, 1,
0.9444016, 0.6844798, 0.5796448, 1, 1, 1, 1, 1,
0.9453165, 0.05282233, 1.103563, 1, 1, 1, 1, 1,
0.9509936, 0.9062661, 1.932962, 0, 0, 1, 1, 1,
0.9510864, -0.2920514, 1.71009, 1, 0, 0, 1, 1,
0.9659303, 0.8324378, -0.7409958, 1, 0, 0, 1, 1,
0.9742154, 1.095749, 1.74488, 1, 0, 0, 1, 1,
0.9794079, 0.5142877, 0.1055352, 1, 0, 0, 1, 1,
0.9806001, -0.6276088, 1.7447, 1, 0, 0, 1, 1,
0.9821463, -0.1494314, 2.941456, 0, 0, 0, 1, 1,
0.9846364, -0.2695899, 1.189331, 0, 0, 0, 1, 1,
0.9908127, 1.311459, 1.220784, 0, 0, 0, 1, 1,
0.9908279, -0.1433268, -0.04070903, 0, 0, 0, 1, 1,
1.004766, -0.2001005, 1.456626, 0, 0, 0, 1, 1,
1.012451, -0.3492068, 1.754986, 0, 0, 0, 1, 1,
1.021601, -0.6445317, 2.872159, 0, 0, 0, 1, 1,
1.030692, 0.9787389, -0.02556691, 1, 1, 1, 1, 1,
1.038257, 0.8384827, 1.794166, 1, 1, 1, 1, 1,
1.039403, -0.3037411, 2.782791, 1, 1, 1, 1, 1,
1.042215, -0.6100162, 0.3490613, 1, 1, 1, 1, 1,
1.045122, 0.4234189, 2.489327, 1, 1, 1, 1, 1,
1.049, -0.1470435, 2.232485, 1, 1, 1, 1, 1,
1.056774, 0.8406361, 1.069889, 1, 1, 1, 1, 1,
1.056846, -0.7654799, 1.13059, 1, 1, 1, 1, 1,
1.05866, 1.091302, 0.8927736, 1, 1, 1, 1, 1,
1.066758, 0.5382482, 1.288747, 1, 1, 1, 1, 1,
1.06868, 0.2615023, 0.3800224, 1, 1, 1, 1, 1,
1.069713, 1.11139, 1.948871, 1, 1, 1, 1, 1,
1.069727, 0.3580628, 0.6876674, 1, 1, 1, 1, 1,
1.0737, -0.7179061, 2.453115, 1, 1, 1, 1, 1,
1.07624, -0.1800341, 1.5082, 1, 1, 1, 1, 1,
1.080603, -0.3908831, 0.8344224, 0, 0, 1, 1, 1,
1.085413, -0.8408062, 0.7996807, 1, 0, 0, 1, 1,
1.095249, 0.1627776, 2.66523, 1, 0, 0, 1, 1,
1.115334, -1.060573, 1.502321, 1, 0, 0, 1, 1,
1.115741, 0.1608853, 1.198177, 1, 0, 0, 1, 1,
1.116226, -1.854619, 3.424173, 1, 0, 0, 1, 1,
1.116336, -1.980409, 3.892986, 0, 0, 0, 1, 1,
1.119663, -0.7257645, 2.023976, 0, 0, 0, 1, 1,
1.119994, -1.679493, 1.019003, 0, 0, 0, 1, 1,
1.120725, -0.5283985, 3.395311, 0, 0, 0, 1, 1,
1.122099, 0.6448234, 2.316919, 0, 0, 0, 1, 1,
1.1274, 0.4946763, 1.166913, 0, 0, 0, 1, 1,
1.128973, -0.8874552, 2.184444, 0, 0, 0, 1, 1,
1.129251, -0.6495633, 0.7900721, 1, 1, 1, 1, 1,
1.13007, -1.456133, 1.319983, 1, 1, 1, 1, 1,
1.137903, -0.2441137, 2.026458, 1, 1, 1, 1, 1,
1.139289, 0.4305859, 0.7505541, 1, 1, 1, 1, 1,
1.152117, 0.2816678, 1.769054, 1, 1, 1, 1, 1,
1.154988, 0.02248218, 0.9787596, 1, 1, 1, 1, 1,
1.159348, -1.040907, 0.4612489, 1, 1, 1, 1, 1,
1.177981, 0.08699428, 0.933803, 1, 1, 1, 1, 1,
1.195903, 0.6314784, 1.361752, 1, 1, 1, 1, 1,
1.197553, -0.4362048, 3.539376, 1, 1, 1, 1, 1,
1.197858, -1.459186, 1.504479, 1, 1, 1, 1, 1,
1.20679, -0.1880817, 2.112182, 1, 1, 1, 1, 1,
1.209843, 0.1344944, -0.03180128, 1, 1, 1, 1, 1,
1.216452, -0.4414678, 3.101864, 1, 1, 1, 1, 1,
1.219044, -0.80494, 0.7071636, 1, 1, 1, 1, 1,
1.223487, -1.75633, 1.070187, 0, 0, 1, 1, 1,
1.264281, -0.6639137, 3.984861, 1, 0, 0, 1, 1,
1.287307, 0.568567, 0.540545, 1, 0, 0, 1, 1,
1.298066, 0.4377015, 2.426784, 1, 0, 0, 1, 1,
1.301831, 0.539148, 0.8129866, 1, 0, 0, 1, 1,
1.305044, 1.723616, 1.035765, 1, 0, 0, 1, 1,
1.305582, -0.9114183, 1.501235, 0, 0, 0, 1, 1,
1.309159, -1.542931, 2.983289, 0, 0, 0, 1, 1,
1.320662, 2.243423, -0.5036982, 0, 0, 0, 1, 1,
1.342423, -0.9162633, 2.020473, 0, 0, 0, 1, 1,
1.343864, 1.9884, 0.3586592, 0, 0, 0, 1, 1,
1.356144, 0.4606992, 2.316213, 0, 0, 0, 1, 1,
1.374274, -0.3177563, 0.3472845, 0, 0, 0, 1, 1,
1.383675, -0.4445194, 0.238566, 1, 1, 1, 1, 1,
1.391322, -0.5005406, 2.201565, 1, 1, 1, 1, 1,
1.398093, 1.769251, 1.517284, 1, 1, 1, 1, 1,
1.403113, 0.6492215, 1.270348, 1, 1, 1, 1, 1,
1.405265, 0.815905, 3.505046, 1, 1, 1, 1, 1,
1.408428, -0.2881617, 1.864695, 1, 1, 1, 1, 1,
1.420484, 1.652753, 1.50622, 1, 1, 1, 1, 1,
1.423877, -0.6188468, 1.653459, 1, 1, 1, 1, 1,
1.429461, 0.1760369, 1.894276, 1, 1, 1, 1, 1,
1.433015, -0.4230709, 1.079773, 1, 1, 1, 1, 1,
1.434904, 0.06866758, 1.91965, 1, 1, 1, 1, 1,
1.438295, -0.7534319, 1.827031, 1, 1, 1, 1, 1,
1.440545, 0.3129105, 0.8374774, 1, 1, 1, 1, 1,
1.448269, 1.284508, 1.19735, 1, 1, 1, 1, 1,
1.44946, 1.345523, -0.8925148, 1, 1, 1, 1, 1,
1.453621, 0.2622999, 0.9965114, 0, 0, 1, 1, 1,
1.459868, 0.5090241, 2.657025, 1, 0, 0, 1, 1,
1.475788, -0.9716938, 2.075685, 1, 0, 0, 1, 1,
1.487531, -0.3319579, 2.53231, 1, 0, 0, 1, 1,
1.504584, -0.6941767, 1.817417, 1, 0, 0, 1, 1,
1.517436, 0.4463584, 1.884074, 1, 0, 0, 1, 1,
1.524735, -0.7797877, 0.2777749, 0, 0, 0, 1, 1,
1.532015, 0.4392496, 2.119665, 0, 0, 0, 1, 1,
1.541397, 0.7969124, 1.598039, 0, 0, 0, 1, 1,
1.551231, -0.2142557, 2.523365, 0, 0, 0, 1, 1,
1.55942, -0.7314976, 0.7123377, 0, 0, 0, 1, 1,
1.560971, -0.2826361, 2.307822, 0, 0, 0, 1, 1,
1.572744, -0.01785444, 1.96397, 0, 0, 0, 1, 1,
1.573962, 0.9202643, 1.009263, 1, 1, 1, 1, 1,
1.581016, -0.9720105, 1.789489, 1, 1, 1, 1, 1,
1.585207, -0.1171502, 2.062887, 1, 1, 1, 1, 1,
1.600634, 1.820338, 1.140802, 1, 1, 1, 1, 1,
1.603403, 0.7891291, 0.9229633, 1, 1, 1, 1, 1,
1.604462, -0.7345629, 2.141636, 1, 1, 1, 1, 1,
1.610375, 1.201997, -0.9871112, 1, 1, 1, 1, 1,
1.613275, 0.3376879, 0.5385619, 1, 1, 1, 1, 1,
1.616314, 0.193459, 2.397164, 1, 1, 1, 1, 1,
1.61725, -1.125809, 1.492257, 1, 1, 1, 1, 1,
1.635365, 0.6044505, 2.049149, 1, 1, 1, 1, 1,
1.648474, -0.3482072, 2.161674, 1, 1, 1, 1, 1,
1.669158, 0.05428134, 2.377697, 1, 1, 1, 1, 1,
1.669615, 0.08152103, 0.6942615, 1, 1, 1, 1, 1,
1.6734, -0.1293692, 1.370103, 1, 1, 1, 1, 1,
1.68747, -0.4226817, 2.026012, 0, 0, 1, 1, 1,
1.690756, -0.3411207, 2.383672, 1, 0, 0, 1, 1,
1.723646, 0.2347832, -0.2904554, 1, 0, 0, 1, 1,
1.729684, 1.445784, 1.240362, 1, 0, 0, 1, 1,
1.7414, -0.2994439, 1.152738, 1, 0, 0, 1, 1,
1.744726, 2.46172, 0.6231236, 1, 0, 0, 1, 1,
1.771116, -0.372225, 4.106347, 0, 0, 0, 1, 1,
1.805832, -0.08573911, 2.1276, 0, 0, 0, 1, 1,
1.806866, 0.6637262, 1.701901, 0, 0, 0, 1, 1,
1.816869, 1.715378, 1.199046, 0, 0, 0, 1, 1,
1.838288, -0.1229069, 0.5446525, 0, 0, 0, 1, 1,
1.838631, 0.0688668, 2.983464, 0, 0, 0, 1, 1,
1.842218, -1.591165, 3.644039, 0, 0, 0, 1, 1,
1.851501, -0.1838909, 2.364059, 1, 1, 1, 1, 1,
1.866898, -0.5327244, 1.59763, 1, 1, 1, 1, 1,
1.869754, 0.9352561, 1.16116, 1, 1, 1, 1, 1,
1.880817, 0.2308976, 0.1272469, 1, 1, 1, 1, 1,
1.882281, 0.1250588, 2.522022, 1, 1, 1, 1, 1,
1.921745, -0.1595068, 0.7053976, 1, 1, 1, 1, 1,
1.925002, -2.06298, 3.035333, 1, 1, 1, 1, 1,
1.985319, 0.9464713, 1.616318, 1, 1, 1, 1, 1,
2.02272, 1.245827, 3.231364, 1, 1, 1, 1, 1,
2.023144, -0.4075951, 3.585061, 1, 1, 1, 1, 1,
2.041511, -0.1591808, 0.5868609, 1, 1, 1, 1, 1,
2.073989, 0.1515235, 2.997104, 1, 1, 1, 1, 1,
2.111354, -1.327715, 3.454156, 1, 1, 1, 1, 1,
2.118012, 0.5354945, 2.97954, 1, 1, 1, 1, 1,
2.122512, 0.8230454, 1.960679, 1, 1, 1, 1, 1,
2.139725, -0.05177683, 2.417715, 0, 0, 1, 1, 1,
2.146425, -1.380375, 2.955787, 1, 0, 0, 1, 1,
2.150075, 0.9952922, 1.094618, 1, 0, 0, 1, 1,
2.157729, -0.8300794, 1.610483, 1, 0, 0, 1, 1,
2.16285, 0.3811744, 0.04942767, 1, 0, 0, 1, 1,
2.218158, -1.61333, 1.081728, 1, 0, 0, 1, 1,
2.249574, 0.06516654, 1.116205, 0, 0, 0, 1, 1,
2.317789, -0.01637993, 2.427448, 0, 0, 0, 1, 1,
2.318728, -1.434591, 0.978521, 0, 0, 0, 1, 1,
2.323614, -0.4746114, 0.4729995, 0, 0, 0, 1, 1,
2.357231, -1.099996, 4.121546, 0, 0, 0, 1, 1,
2.371531, -0.5888681, 2.37982, 0, 0, 0, 1, 1,
2.40769, -1.919111, -1.249006, 0, 0, 0, 1, 1,
2.434671, 0.1092163, 3.213065, 1, 1, 1, 1, 1,
2.543163, -1.255659, 2.457633, 1, 1, 1, 1, 1,
2.631439, 1.156556, 1.3614, 1, 1, 1, 1, 1,
2.664912, 2.058434, 1.054233, 1, 1, 1, 1, 1,
2.746086, -0.6772436, 2.449511, 1, 1, 1, 1, 1,
3.016531, 0.1057842, 2.10511, 1, 1, 1, 1, 1,
3.228891, 0.3322743, -0.3056539, 1, 1, 1, 1, 1
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
var radius = 10.00988;
var distance = 35.1593;
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
mvMatrix.translate( -0.1321044, 0.04043913, -0.4569561 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.1593);
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