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
-2.745579, 1.510137, -1.005372, 1, 0, 0, 1,
-2.666117, -0.4586366, -1.107946, 1, 0.007843138, 0, 1,
-2.640676, -0.7465964, -2.897577, 1, 0.01176471, 0, 1,
-2.587517, -0.06170363, -3.288054, 1, 0.01960784, 0, 1,
-2.572361, -0.08318656, -3.033933, 1, 0.02352941, 0, 1,
-2.535924, 1.553988, -1.007017, 1, 0.03137255, 0, 1,
-2.424419, -0.6392181, -2.119532, 1, 0.03529412, 0, 1,
-2.416522, 1.316159, -3.037145, 1, 0.04313726, 0, 1,
-2.385312, -0.5356609, -0.8200743, 1, 0.04705882, 0, 1,
-2.302431, 1.088593, -0.4693077, 1, 0.05490196, 0, 1,
-2.272589, 0.09275593, 1.208684, 1, 0.05882353, 0, 1,
-2.237668, 1.454741, -0.7723811, 1, 0.06666667, 0, 1,
-2.213201, -2.007986, -2.64837, 1, 0.07058824, 0, 1,
-2.20676, -0.2391415, -2.860891, 1, 0.07843138, 0, 1,
-2.18077, 0.5312062, -0.9181101, 1, 0.08235294, 0, 1,
-2.150088, 1.264598, 2.93499, 1, 0.09019608, 0, 1,
-2.139471, -0.653723, -2.598297, 1, 0.09411765, 0, 1,
-2.10107, 2.145431, -2.372257, 1, 0.1019608, 0, 1,
-2.093681, 0.9053764, -1.711677, 1, 0.1098039, 0, 1,
-2.088356, 0.1336511, -2.347317, 1, 0.1137255, 0, 1,
-2.086453, -0.8072794, -1.274507, 1, 0.1215686, 0, 1,
-2.073918, 0.4516435, -2.702405, 1, 0.1254902, 0, 1,
-2.051363, -0.9983967, -3.063442, 1, 0.1333333, 0, 1,
-2.038277, 1.664135, 0.3238997, 1, 0.1372549, 0, 1,
-2.018772, 1.063422, -1.46184, 1, 0.145098, 0, 1,
-2.011688, -0.2266268, -1.934455, 1, 0.1490196, 0, 1,
-2.010163, 0.2048021, -1.883076, 1, 0.1568628, 0, 1,
-2.002651, -0.2697431, -0.8237589, 1, 0.1607843, 0, 1,
-1.967761, -0.09517767, -2.237884, 1, 0.1686275, 0, 1,
-1.965137, -0.2613219, -2.678573, 1, 0.172549, 0, 1,
-1.963215, -1.075935, -2.421918, 1, 0.1803922, 0, 1,
-1.935338, -0.4272913, -0.1199891, 1, 0.1843137, 0, 1,
-1.928047, 0.08571559, -1.412432, 1, 0.1921569, 0, 1,
-1.911856, 1.003255, -1.825003, 1, 0.1960784, 0, 1,
-1.89522, 0.1764736, -0.9579095, 1, 0.2039216, 0, 1,
-1.873532, -0.7796951, -1.37342, 1, 0.2117647, 0, 1,
-1.867604, 1.019583, -0.4045987, 1, 0.2156863, 0, 1,
-1.856612, -0.03678921, -0.7112882, 1, 0.2235294, 0, 1,
-1.840301, 1.584683, -0.03025916, 1, 0.227451, 0, 1,
-1.839671, 1.314639, -0.8178953, 1, 0.2352941, 0, 1,
-1.815138, -0.9010009, -2.174342, 1, 0.2392157, 0, 1,
-1.797581, -0.3137616, -2.656456, 1, 0.2470588, 0, 1,
-1.774431, 0.6127105, -0.3000269, 1, 0.2509804, 0, 1,
-1.76958, -0.5933494, -2.605524, 1, 0.2588235, 0, 1,
-1.752005, -1.492967, -1.074612, 1, 0.2627451, 0, 1,
-1.74929, -0.7965553, -2.52373, 1, 0.2705882, 0, 1,
-1.747675, -1.75838, -4.581354, 1, 0.2745098, 0, 1,
-1.731718, 0.640875, -1.571319, 1, 0.282353, 0, 1,
-1.720211, -0.2926966, -2.233732, 1, 0.2862745, 0, 1,
-1.716254, 2.527317, -1.484993, 1, 0.2941177, 0, 1,
-1.713067, 0.8052667, -1.694027, 1, 0.3019608, 0, 1,
-1.711309, -0.04787015, -0.4071656, 1, 0.3058824, 0, 1,
-1.704216, 1.033007, -0.8231984, 1, 0.3137255, 0, 1,
-1.703951, 1.669776, -1.284839, 1, 0.3176471, 0, 1,
-1.687048, 0.2528566, -2.331403, 1, 0.3254902, 0, 1,
-1.685016, -1.005048, -1.246204, 1, 0.3294118, 0, 1,
-1.676872, -0.6591045, -0.809712, 1, 0.3372549, 0, 1,
-1.669355, 1.000099, -1.215205, 1, 0.3411765, 0, 1,
-1.651947, -0.4151261, -2.120835, 1, 0.3490196, 0, 1,
-1.651649, -0.3238343, -2.144525, 1, 0.3529412, 0, 1,
-1.64985, -0.2630263, -2.274023, 1, 0.3607843, 0, 1,
-1.625284, -0.2138675, -2.266347, 1, 0.3647059, 0, 1,
-1.619052, -0.5609313, -2.539162, 1, 0.372549, 0, 1,
-1.599339, 0.6309243, -0.4089375, 1, 0.3764706, 0, 1,
-1.597984, -0.5240686, -2.104474, 1, 0.3843137, 0, 1,
-1.59509, 1.196689, 0.07185586, 1, 0.3882353, 0, 1,
-1.589581, -2.433845, -1.332146, 1, 0.3960784, 0, 1,
-1.562465, 1.133947, 0.7641578, 1, 0.4039216, 0, 1,
-1.553194, 0.7285463, -1.73241, 1, 0.4078431, 0, 1,
-1.550693, 0.1305013, -1.969162, 1, 0.4156863, 0, 1,
-1.542263, 0.2876203, -1.695857, 1, 0.4196078, 0, 1,
-1.539535, 0.2232798, -1.07495, 1, 0.427451, 0, 1,
-1.532716, -0.3751948, -3.262208, 1, 0.4313726, 0, 1,
-1.532452, 0.4765288, -2.294073, 1, 0.4392157, 0, 1,
-1.528971, 0.04672971, -2.130028, 1, 0.4431373, 0, 1,
-1.519771, -2.170337, -3.846121, 1, 0.4509804, 0, 1,
-1.513036, -0.7745842, -1.469744, 1, 0.454902, 0, 1,
-1.508885, 1.271672, -0.5333049, 1, 0.4627451, 0, 1,
-1.507086, -0.5121591, -3.118544, 1, 0.4666667, 0, 1,
-1.502459, 0.03170879, -1.647236, 1, 0.4745098, 0, 1,
-1.483205, 1.384587, -2.56242, 1, 0.4784314, 0, 1,
-1.47791, 0.8833631, 0.005304512, 1, 0.4862745, 0, 1,
-1.462955, -1.408319, -2.140128, 1, 0.4901961, 0, 1,
-1.461794, 1.282542, -1.268817, 1, 0.4980392, 0, 1,
-1.459333, -0.4446012, -2.468253, 1, 0.5058824, 0, 1,
-1.453769, -1.196127, -3.835686, 1, 0.509804, 0, 1,
-1.451333, 1.100226, -2.207933, 1, 0.5176471, 0, 1,
-1.442309, -0.5819438, -1.809643, 1, 0.5215687, 0, 1,
-1.437256, -0.9651741, -0.9989091, 1, 0.5294118, 0, 1,
-1.432864, -0.8308054, -0.1819003, 1, 0.5333334, 0, 1,
-1.424138, -1.142174, -1.136283, 1, 0.5411765, 0, 1,
-1.417411, -1.657707, -3.21103, 1, 0.5450981, 0, 1,
-1.402792, 0.3232668, -2.592399, 1, 0.5529412, 0, 1,
-1.402273, 1.202468, -1.130734, 1, 0.5568628, 0, 1,
-1.399243, -0.1927582, -1.514511, 1, 0.5647059, 0, 1,
-1.39499, 0.5327023, -0.1243087, 1, 0.5686275, 0, 1,
-1.392177, 1.425172, 0.9257578, 1, 0.5764706, 0, 1,
-1.3895, 1.211748, -1.080462, 1, 0.5803922, 0, 1,
-1.38413, -0.3893723, -2.019298, 1, 0.5882353, 0, 1,
-1.383551, -0.7574488, -2.132259, 1, 0.5921569, 0, 1,
-1.382131, -0.512022, -2.109502, 1, 0.6, 0, 1,
-1.378307, 1.624462, -1.111774, 1, 0.6078432, 0, 1,
-1.37587, 0.0916615, -1.721622, 1, 0.6117647, 0, 1,
-1.373659, 0.02179523, -2.729035, 1, 0.6196079, 0, 1,
-1.366575, -0.6370715, -3.241224, 1, 0.6235294, 0, 1,
-1.361268, 1.067135, -0.3111127, 1, 0.6313726, 0, 1,
-1.35059, -0.7816875, -2.701293, 1, 0.6352941, 0, 1,
-1.338083, 0.3183825, 2.179591, 1, 0.6431373, 0, 1,
-1.338014, -1.190605, -2.267909, 1, 0.6470588, 0, 1,
-1.332106, -1.693635, -2.051605, 1, 0.654902, 0, 1,
-1.314366, 1.615315, 0.3113261, 1, 0.6588235, 0, 1,
-1.312113, 0.6336644, -1.298571, 1, 0.6666667, 0, 1,
-1.310822, 1.036954, 0.2028664, 1, 0.6705883, 0, 1,
-1.310206, -0.5225629, -2.430471, 1, 0.6784314, 0, 1,
-1.306533, -0.07197828, -0.3050406, 1, 0.682353, 0, 1,
-1.302735, 1.161989, 0.02901994, 1, 0.6901961, 0, 1,
-1.289087, 1.227789, -1.169742, 1, 0.6941177, 0, 1,
-1.275524, 1.015135, -1.142835, 1, 0.7019608, 0, 1,
-1.26491, 1.186408, -1.907316, 1, 0.7098039, 0, 1,
-1.255073, -0.1927713, -2.10256, 1, 0.7137255, 0, 1,
-1.255014, 0.2104219, -1.27017, 1, 0.7215686, 0, 1,
-1.251164, 0.8584001, -0.5924917, 1, 0.7254902, 0, 1,
-1.247839, -0.05244312, -0.7374458, 1, 0.7333333, 0, 1,
-1.243937, 1.428351, 1.059827, 1, 0.7372549, 0, 1,
-1.240076, -0.7300733, 0.4115709, 1, 0.7450981, 0, 1,
-1.236752, -2.033914, -2.343643, 1, 0.7490196, 0, 1,
-1.229595, 1.155095, -0.01397793, 1, 0.7568628, 0, 1,
-1.229411, 0.1763328, -1.172821, 1, 0.7607843, 0, 1,
-1.218051, 2.355629, 1.13047, 1, 0.7686275, 0, 1,
-1.210747, 0.6657102, -0.8333265, 1, 0.772549, 0, 1,
-1.206964, -0.1317188, -0.4274684, 1, 0.7803922, 0, 1,
-1.202358, 2.05705, -1.140072, 1, 0.7843137, 0, 1,
-1.201614, 0.1442148, -2.376638, 1, 0.7921569, 0, 1,
-1.2013, -0.228425, -0.547748, 1, 0.7960784, 0, 1,
-1.196157, 1.05722, 0.07343398, 1, 0.8039216, 0, 1,
-1.194068, 0.05486538, 0.09396082, 1, 0.8117647, 0, 1,
-1.193044, 0.6081562, -0.9473766, 1, 0.8156863, 0, 1,
-1.192002, 0.3105968, -0.6702062, 1, 0.8235294, 0, 1,
-1.183269, -1.163247, -3.563784, 1, 0.827451, 0, 1,
-1.181733, 1.076583, -2.866714, 1, 0.8352941, 0, 1,
-1.178733, -1.033543, -2.684706, 1, 0.8392157, 0, 1,
-1.17397, 0.09063428, -2.254325, 1, 0.8470588, 0, 1,
-1.17274, 1.066686, -1.038702, 1, 0.8509804, 0, 1,
-1.169401, 0.005793918, -1.318595, 1, 0.8588235, 0, 1,
-1.145492, -1.228168, -1.456129, 1, 0.8627451, 0, 1,
-1.13836, 1.204962, -3.373673, 1, 0.8705882, 0, 1,
-1.132701, -0.09154063, -1.798659, 1, 0.8745098, 0, 1,
-1.12333, -1.134711, -2.278442, 1, 0.8823529, 0, 1,
-1.118953, 0.9578449, -1.650159, 1, 0.8862745, 0, 1,
-1.116319, 1.713671, -1.450146, 1, 0.8941177, 0, 1,
-1.111195, -0.02335274, -2.705628, 1, 0.8980392, 0, 1,
-1.10733, 0.4741512, 0.9274381, 1, 0.9058824, 0, 1,
-1.106639, -1.458613, -2.713006, 1, 0.9137255, 0, 1,
-1.102488, -0.2521777, -1.532371, 1, 0.9176471, 0, 1,
-1.100535, 0.9683572, -0.103187, 1, 0.9254902, 0, 1,
-1.099802, 1.153286, -1.114073, 1, 0.9294118, 0, 1,
-1.087511, -0.002869601, -1.573851, 1, 0.9372549, 0, 1,
-1.085809, -0.05837341, -1.689313, 1, 0.9411765, 0, 1,
-1.082727, 1.108179, -0.6396718, 1, 0.9490196, 0, 1,
-1.082159, 0.9210107, -0.6048348, 1, 0.9529412, 0, 1,
-1.077493, -0.6028945, -0.7001034, 1, 0.9607843, 0, 1,
-1.076408, 0.4605044, -0.5347353, 1, 0.9647059, 0, 1,
-1.076118, -1.747713, -3.949775, 1, 0.972549, 0, 1,
-1.073362, 0.3634685, -0.6653682, 1, 0.9764706, 0, 1,
-1.064595, -0.2545582, -1.261471, 1, 0.9843137, 0, 1,
-1.063216, -1.45678, -1.712507, 1, 0.9882353, 0, 1,
-1.054646, -1.025082, -3.62683, 1, 0.9960784, 0, 1,
-1.045399, 0.3917162, -0.6689128, 0.9960784, 1, 0, 1,
-1.038071, 1.46997, -0.1583515, 0.9921569, 1, 0, 1,
-1.032683, -0.2574914, -0.5647349, 0.9843137, 1, 0, 1,
-1.030497, -0.04518775, -2.062181, 0.9803922, 1, 0, 1,
-1.024728, -0.9349062, -5.075012, 0.972549, 1, 0, 1,
-1.023367, -0.8737179, -2.262888, 0.9686275, 1, 0, 1,
-1.021321, 0.8958057, -1.809183, 0.9607843, 1, 0, 1,
-1.019063, -0.1040855, -1.266966, 0.9568627, 1, 0, 1,
-1.014644, -0.6074262, -1.800866, 0.9490196, 1, 0, 1,
-1.000384, 2.004089, -0.2260542, 0.945098, 1, 0, 1,
-1.000309, 0.2314799, -0.3447577, 0.9372549, 1, 0, 1,
-0.997558, -0.2446118, -1.091192, 0.9333333, 1, 0, 1,
-0.9957139, -0.1192871, -1.585533, 0.9254902, 1, 0, 1,
-0.9866992, -1.002931, -2.282339, 0.9215686, 1, 0, 1,
-0.9796808, 0.119939, -1.837939, 0.9137255, 1, 0, 1,
-0.9775496, -0.1026586, -0.9383722, 0.9098039, 1, 0, 1,
-0.9773365, 0.5988432, 1.517402, 0.9019608, 1, 0, 1,
-0.9708593, 0.4175645, -2.91848, 0.8941177, 1, 0, 1,
-0.9666489, 0.6598086, -1.768604, 0.8901961, 1, 0, 1,
-0.9631469, -0.08476408, -2.289827, 0.8823529, 1, 0, 1,
-0.962767, -0.5265121, -0.8530021, 0.8784314, 1, 0, 1,
-0.9552629, 0.8689372, -0.9533017, 0.8705882, 1, 0, 1,
-0.9542133, 0.7941197, -2.203106, 0.8666667, 1, 0, 1,
-0.9527057, 0.03223687, -2.945132, 0.8588235, 1, 0, 1,
-0.9468218, 1.004111, -1.838115, 0.854902, 1, 0, 1,
-0.9465651, -0.1647638, -0.9081149, 0.8470588, 1, 0, 1,
-0.9325052, -0.01766936, -0.4394255, 0.8431373, 1, 0, 1,
-0.9291784, -0.08439057, -3.192955, 0.8352941, 1, 0, 1,
-0.9283218, -0.6822153, -2.007744, 0.8313726, 1, 0, 1,
-0.9246835, 1.459988, -1.411206, 0.8235294, 1, 0, 1,
-0.9154813, -0.6428773, -1.683016, 0.8196079, 1, 0, 1,
-0.913508, -0.1646992, -1.685992, 0.8117647, 1, 0, 1,
-0.9082004, 0.6335249, -2.563533, 0.8078431, 1, 0, 1,
-0.9069064, -0.4211064, -2.001525, 0.8, 1, 0, 1,
-0.9058958, -0.4135924, -2.565917, 0.7921569, 1, 0, 1,
-0.8967557, -0.7609768, -2.199903, 0.7882353, 1, 0, 1,
-0.8932378, 0.05041502, -1.135493, 0.7803922, 1, 0, 1,
-0.89144, -0.1102935, -0.2159695, 0.7764706, 1, 0, 1,
-0.8890147, 2.176697, 0.01510533, 0.7686275, 1, 0, 1,
-0.8889304, -0.05870288, -1.335933, 0.7647059, 1, 0, 1,
-0.8815221, -0.9633372, -2.507003, 0.7568628, 1, 0, 1,
-0.8798684, -0.6755782, -3.638174, 0.7529412, 1, 0, 1,
-0.8740413, 1.296651, -3.101583, 0.7450981, 1, 0, 1,
-0.8729518, 1.867181, 0.2734509, 0.7411765, 1, 0, 1,
-0.8701065, 1.166, -0.9653906, 0.7333333, 1, 0, 1,
-0.8665237, -1.389717, -0.8435618, 0.7294118, 1, 0, 1,
-0.8603776, 0.8840031, -1.441831, 0.7215686, 1, 0, 1,
-0.8455821, 1.020924, -0.206875, 0.7176471, 1, 0, 1,
-0.8413463, -0.103125, -0.6994103, 0.7098039, 1, 0, 1,
-0.836338, -0.5787576, -1.224875, 0.7058824, 1, 0, 1,
-0.8306711, 0.8694416, -1.350016, 0.6980392, 1, 0, 1,
-0.8272812, -0.7735995, -1.468721, 0.6901961, 1, 0, 1,
-0.8227776, -0.05065328, -3.036422, 0.6862745, 1, 0, 1,
-0.8211048, -0.4818211, -0.452699, 0.6784314, 1, 0, 1,
-0.8187778, 0.7698522, -0.299219, 0.6745098, 1, 0, 1,
-0.8099245, 0.4398361, -2.667729, 0.6666667, 1, 0, 1,
-0.8086666, 0.7783565, 0.7766004, 0.6627451, 1, 0, 1,
-0.8062225, -0.05719821, -2.516099, 0.654902, 1, 0, 1,
-0.8050919, 0.7324682, -1.996029, 0.6509804, 1, 0, 1,
-0.8048865, 0.2287174, -1.650175, 0.6431373, 1, 0, 1,
-0.7956964, 0.9234674, -1.392465, 0.6392157, 1, 0, 1,
-0.7916639, 1.043925, 1.979024, 0.6313726, 1, 0, 1,
-0.7914379, -0.3114432, -2.005655, 0.627451, 1, 0, 1,
-0.7899642, -0.7756289, -3.994799, 0.6196079, 1, 0, 1,
-0.7889282, -0.5989374, -1.327792, 0.6156863, 1, 0, 1,
-0.7799338, -0.6143265, -2.773838, 0.6078432, 1, 0, 1,
-0.7706824, -1.848412, -1.790369, 0.6039216, 1, 0, 1,
-0.7700145, 0.3850969, -0.5910966, 0.5960785, 1, 0, 1,
-0.7661037, 0.3192499, -2.648074, 0.5882353, 1, 0, 1,
-0.7636029, -0.3689088, -0.7245368, 0.5843138, 1, 0, 1,
-0.7627864, -0.4614843, -1.710044, 0.5764706, 1, 0, 1,
-0.7625796, -0.3217444, -2.538675, 0.572549, 1, 0, 1,
-0.7479869, 0.524699, -0.5995529, 0.5647059, 1, 0, 1,
-0.7473094, -0.4336375, -1.842841, 0.5607843, 1, 0, 1,
-0.7431537, -1.757375, -3.342576, 0.5529412, 1, 0, 1,
-0.7420801, -0.1994573, -1.881987, 0.5490196, 1, 0, 1,
-0.7401114, 1.139306, -0.02082996, 0.5411765, 1, 0, 1,
-0.7356912, 0.973589, -1.80012, 0.5372549, 1, 0, 1,
-0.7305764, -0.4814896, -2.075001, 0.5294118, 1, 0, 1,
-0.7252761, -0.5219383, -1.015809, 0.5254902, 1, 0, 1,
-0.722458, 0.2529432, -0.7883219, 0.5176471, 1, 0, 1,
-0.704457, 1.318575, -2.7752, 0.5137255, 1, 0, 1,
-0.7025784, -2.573264, -2.168607, 0.5058824, 1, 0, 1,
-0.6988694, -0.4444582, -1.877831, 0.5019608, 1, 0, 1,
-0.6962751, -0.3878661, -2.986394, 0.4941176, 1, 0, 1,
-0.6930746, -1.376968, -2.360976, 0.4862745, 1, 0, 1,
-0.6898413, -0.5708343, -2.022721, 0.4823529, 1, 0, 1,
-0.6821688, -0.2901883, -1.155719, 0.4745098, 1, 0, 1,
-0.6731936, 0.9136029, -1.035663, 0.4705882, 1, 0, 1,
-0.6692118, 0.05566807, -1.792793, 0.4627451, 1, 0, 1,
-0.6647284, -1.857253, -2.325095, 0.4588235, 1, 0, 1,
-0.6585943, 0.1274746, -1.386273, 0.4509804, 1, 0, 1,
-0.6566171, 2.853261, -0.04479824, 0.4470588, 1, 0, 1,
-0.6540667, 1.332498, 0.8798475, 0.4392157, 1, 0, 1,
-0.6531482, -0.7437067, -2.940393, 0.4352941, 1, 0, 1,
-0.6454993, 0.5718551, -2.458521, 0.427451, 1, 0, 1,
-0.6411748, -0.1993033, -1.93396, 0.4235294, 1, 0, 1,
-0.6399587, 0.1285743, -1.085288, 0.4156863, 1, 0, 1,
-0.6361299, 0.4947849, -0.343399, 0.4117647, 1, 0, 1,
-0.6341609, 0.7833816, -0.6212159, 0.4039216, 1, 0, 1,
-0.6341179, -1.9055, -1.579348, 0.3960784, 1, 0, 1,
-0.630488, -0.5120721, -1.491942, 0.3921569, 1, 0, 1,
-0.6278524, -1.191246, -2.660282, 0.3843137, 1, 0, 1,
-0.6253591, -1.538594, -3.217924, 0.3803922, 1, 0, 1,
-0.6250892, 0.9586467, -1.41056, 0.372549, 1, 0, 1,
-0.6247244, -0.8383886, -2.018333, 0.3686275, 1, 0, 1,
-0.6219834, 1.955331, 0.02114311, 0.3607843, 1, 0, 1,
-0.6208564, 1.660902, 1.786172, 0.3568628, 1, 0, 1,
-0.6191381, -0.3332357, -2.414423, 0.3490196, 1, 0, 1,
-0.6178249, -0.06275553, -1.703871, 0.345098, 1, 0, 1,
-0.6120936, 0.3164571, -0.9730198, 0.3372549, 1, 0, 1,
-0.6111399, 0.6348855, -1.2289, 0.3333333, 1, 0, 1,
-0.6048138, 1.60435, 0.6385863, 0.3254902, 1, 0, 1,
-0.6034544, -0.4335345, -3.039023, 0.3215686, 1, 0, 1,
-0.6030546, 0.1778951, -2.230079, 0.3137255, 1, 0, 1,
-0.6022686, 0.08131587, -2.038168, 0.3098039, 1, 0, 1,
-0.5873775, 0.9632866, -1.479434, 0.3019608, 1, 0, 1,
-0.5848938, 0.5007238, 0.1492236, 0.2941177, 1, 0, 1,
-0.5844733, 0.02240342, -1.074837, 0.2901961, 1, 0, 1,
-0.5828606, 1.515796, 0.8865191, 0.282353, 1, 0, 1,
-0.5823036, 0.6757548, -0.8212315, 0.2784314, 1, 0, 1,
-0.5767229, -0.2070387, -2.924317, 0.2705882, 1, 0, 1,
-0.5754313, -0.00556895, -1.911847, 0.2666667, 1, 0, 1,
-0.5685593, -1.031661, -4.135634, 0.2588235, 1, 0, 1,
-0.5648013, 0.7694589, -2.047468, 0.254902, 1, 0, 1,
-0.5601225, 0.8594711, -1.907328, 0.2470588, 1, 0, 1,
-0.559429, -0.2430135, -3.321281, 0.2431373, 1, 0, 1,
-0.5567421, 1.592286, -0.9586966, 0.2352941, 1, 0, 1,
-0.5530521, -0.6963543, -1.845683, 0.2313726, 1, 0, 1,
-0.5506857, -0.172859, -1.195882, 0.2235294, 1, 0, 1,
-0.5499766, 0.5855354, 1.088709, 0.2196078, 1, 0, 1,
-0.549484, -1.638356, -2.666654, 0.2117647, 1, 0, 1,
-0.54831, 0.5500293, -0.6673344, 0.2078431, 1, 0, 1,
-0.5459328, -0.5750847, -1.941262, 0.2, 1, 0, 1,
-0.5360955, 0.1333374, -2.155717, 0.1921569, 1, 0, 1,
-0.5360554, 0.05762384, -2.53711, 0.1882353, 1, 0, 1,
-0.5335094, -0.6202526, -3.372036, 0.1803922, 1, 0, 1,
-0.5238386, 1.293694, -0.04594653, 0.1764706, 1, 0, 1,
-0.5209007, 0.3400947, -0.1888383, 0.1686275, 1, 0, 1,
-0.5094345, 0.05110892, -2.61654, 0.1647059, 1, 0, 1,
-0.5093845, -1.014272, -1.40495, 0.1568628, 1, 0, 1,
-0.5082875, -0.6607417, -2.108743, 0.1529412, 1, 0, 1,
-0.5055337, -0.403908, -2.717579, 0.145098, 1, 0, 1,
-0.5020678, 0.3242882, 0.3922111, 0.1411765, 1, 0, 1,
-0.4885959, -0.6317227, -2.924946, 0.1333333, 1, 0, 1,
-0.4873267, -0.346193, -0.9303522, 0.1294118, 1, 0, 1,
-0.4860919, 0.01526754, -1.399737, 0.1215686, 1, 0, 1,
-0.4827965, 1.604391, -0.09526797, 0.1176471, 1, 0, 1,
-0.4812474, -0.869291, -3.449233, 0.1098039, 1, 0, 1,
-0.4801763, 1.052536, 1.198125, 0.1058824, 1, 0, 1,
-0.4796284, -0.8610715, 1.496612, 0.09803922, 1, 0, 1,
-0.4773206, 0.3074735, -2.30645, 0.09019608, 1, 0, 1,
-0.4759505, 0.322722, -1.903207, 0.08627451, 1, 0, 1,
-0.4746328, -0.09750328, -1.416324, 0.07843138, 1, 0, 1,
-0.4712223, -0.1065492, -2.041137, 0.07450981, 1, 0, 1,
-0.4679281, -1.130289, -2.072039, 0.06666667, 1, 0, 1,
-0.4627259, -0.978587, -3.100476, 0.0627451, 1, 0, 1,
-0.4624821, 0.3932731, 1.057518, 0.05490196, 1, 0, 1,
-0.4616743, 0.1727157, -0.409257, 0.05098039, 1, 0, 1,
-0.4609762, 0.7469112, 1.13201, 0.04313726, 1, 0, 1,
-0.4604882, -0.901807, -2.611343, 0.03921569, 1, 0, 1,
-0.4588328, 0.2686533, -1.168761, 0.03137255, 1, 0, 1,
-0.456891, -0.01084132, -2.691299, 0.02745098, 1, 0, 1,
-0.4538535, 0.4870129, 0.3453785, 0.01960784, 1, 0, 1,
-0.4523899, 0.06963023, -0.7461631, 0.01568628, 1, 0, 1,
-0.4515992, 0.8498982, 1.323312, 0.007843138, 1, 0, 1,
-0.4507145, -1.247236, -2.021176, 0.003921569, 1, 0, 1,
-0.4486962, -2.102037, -3.082664, 0, 1, 0.003921569, 1,
-0.4468671, -1.199885, -3.158032, 0, 1, 0.01176471, 1,
-0.4462314, -1.535105, -2.354592, 0, 1, 0.01568628, 1,
-0.4435076, -0.8774656, -1.659774, 0, 1, 0.02352941, 1,
-0.439508, 0.2935897, -2.284026, 0, 1, 0.02745098, 1,
-0.439265, 0.1937882, 0.03176788, 0, 1, 0.03529412, 1,
-0.4380317, 0.8264015, 0.05439801, 0, 1, 0.03921569, 1,
-0.4363817, 2.26612, -1.119749, 0, 1, 0.04705882, 1,
-0.4357104, -0.6677923, -2.807449, 0, 1, 0.05098039, 1,
-0.4356911, 0.1776702, 0.4554763, 0, 1, 0.05882353, 1,
-0.4321095, 0.1501184, -2.133134, 0, 1, 0.0627451, 1,
-0.4308585, 0.1827589, 0.4613427, 0, 1, 0.07058824, 1,
-0.4255023, -2.385038, -1.953131, 0, 1, 0.07450981, 1,
-0.4211518, 0.01331078, -3.912151, 0, 1, 0.08235294, 1,
-0.4034882, -0.9576192, -2.663465, 0, 1, 0.08627451, 1,
-0.3942089, 1.487758, -1.809998, 0, 1, 0.09411765, 1,
-0.3918881, -0.06713282, -1.513956, 0, 1, 0.1019608, 1,
-0.385209, -0.04547666, -1.991678, 0, 1, 0.1058824, 1,
-0.3851224, -0.1425776, -2.958896, 0, 1, 0.1137255, 1,
-0.3835421, 0.710037, 0.1815782, 0, 1, 0.1176471, 1,
-0.381306, 1.482648, 1.203214, 0, 1, 0.1254902, 1,
-0.3810707, -1.388942, -2.460005, 0, 1, 0.1294118, 1,
-0.376453, -1.084391, -4.182243, 0, 1, 0.1372549, 1,
-0.375065, -0.1772701, -2.677501, 0, 1, 0.1411765, 1,
-0.3734934, 0.6591052, -1.832638, 0, 1, 0.1490196, 1,
-0.3698635, -1.355172, -3.331898, 0, 1, 0.1529412, 1,
-0.3696459, -2.274613, -2.911833, 0, 1, 0.1607843, 1,
-0.3645613, 1.19575, -0.3305443, 0, 1, 0.1647059, 1,
-0.3642757, -1.44689, -3.326305, 0, 1, 0.172549, 1,
-0.3633608, 0.1471379, -1.514785, 0, 1, 0.1764706, 1,
-0.3625554, 0.3751224, -0.9935418, 0, 1, 0.1843137, 1,
-0.3580499, 0.7560662, -0.6833669, 0, 1, 0.1882353, 1,
-0.3574457, -0.2629962, -1.4633, 0, 1, 0.1960784, 1,
-0.3545715, -1.198378, -2.187788, 0, 1, 0.2039216, 1,
-0.3540571, 0.8206656, 0.6932986, 0, 1, 0.2078431, 1,
-0.3512146, 1.083751, -0.6013271, 0, 1, 0.2156863, 1,
-0.3506524, 0.9116297, -1.506865, 0, 1, 0.2196078, 1,
-0.3503639, -0.5912381, -2.054258, 0, 1, 0.227451, 1,
-0.34792, -1.279772, -2.364882, 0, 1, 0.2313726, 1,
-0.3461478, 0.3378688, -1.07312, 0, 1, 0.2392157, 1,
-0.3362435, -1.229152, -2.532846, 0, 1, 0.2431373, 1,
-0.3324379, 0.9175985, 0.1169931, 0, 1, 0.2509804, 1,
-0.3314229, 0.296655, -1.807698, 0, 1, 0.254902, 1,
-0.3298311, -0.927536, -4.283538, 0, 1, 0.2627451, 1,
-0.3282289, 0.02380961, -0.6468621, 0, 1, 0.2666667, 1,
-0.3279333, 0.5849487, -0.7227856, 0, 1, 0.2745098, 1,
-0.3276062, -0.7396885, -2.459895, 0, 1, 0.2784314, 1,
-0.326387, 9.111933e-05, -1.225639, 0, 1, 0.2862745, 1,
-0.3245235, 0.3216846, -0.4612671, 0, 1, 0.2901961, 1,
-0.3205938, 1.107293, -2.218385, 0, 1, 0.2980392, 1,
-0.3162552, -0.8349553, -2.436119, 0, 1, 0.3058824, 1,
-0.3154533, -2.189861, -3.693574, 0, 1, 0.3098039, 1,
-0.31521, 0.06162924, -3.531935, 0, 1, 0.3176471, 1,
-0.314403, 1.817036, 0.5311849, 0, 1, 0.3215686, 1,
-0.3119466, 1.353088, 0.165399, 0, 1, 0.3294118, 1,
-0.309648, 2.035304, -0.01544399, 0, 1, 0.3333333, 1,
-0.3048068, 0.665323, -1.543873, 0, 1, 0.3411765, 1,
-0.299718, -0.4040472, -1.612653, 0, 1, 0.345098, 1,
-0.2982897, -1.008459, -2.38159, 0, 1, 0.3529412, 1,
-0.297888, -0.01460738, -1.390671, 0, 1, 0.3568628, 1,
-0.2960902, -0.1864066, -1.995104, 0, 1, 0.3647059, 1,
-0.2932109, -0.5178708, -3.171487, 0, 1, 0.3686275, 1,
-0.2890462, -0.6439567, -2.676746, 0, 1, 0.3764706, 1,
-0.2840964, -1.055427, -3.640131, 0, 1, 0.3803922, 1,
-0.2833653, 0.1795426, -1.203756, 0, 1, 0.3882353, 1,
-0.2830642, -0.136711, -2.561785, 0, 1, 0.3921569, 1,
-0.2805142, -0.269233, -3.454658, 0, 1, 0.4, 1,
-0.2792631, 0.7533965, -2.429831, 0, 1, 0.4078431, 1,
-0.273076, -0.8323601, -1.417792, 0, 1, 0.4117647, 1,
-0.2667258, 0.5850807, -0.5035533, 0, 1, 0.4196078, 1,
-0.2635688, 0.1821614, -1.325037, 0, 1, 0.4235294, 1,
-0.2620709, 0.3651277, -1.650991, 0, 1, 0.4313726, 1,
-0.2605956, -0.05787792, -2.281091, 0, 1, 0.4352941, 1,
-0.2598374, 0.618341, -0.08119743, 0, 1, 0.4431373, 1,
-0.2592635, -0.4085942, -3.233656, 0, 1, 0.4470588, 1,
-0.2577365, 0.1565463, -0.9326035, 0, 1, 0.454902, 1,
-0.2575142, 0.2204048, -2.206305, 0, 1, 0.4588235, 1,
-0.2574762, -0.2439986, -2.88675, 0, 1, 0.4666667, 1,
-0.2545337, -0.6356621, -2.454547, 0, 1, 0.4705882, 1,
-0.2407797, -0.0589973, -1.475446, 0, 1, 0.4784314, 1,
-0.2395489, 0.9898888, 0.6728612, 0, 1, 0.4823529, 1,
-0.2361834, -2.568487, -3.544344, 0, 1, 0.4901961, 1,
-0.2354438, -0.4507127, -2.231942, 0, 1, 0.4941176, 1,
-0.2332043, -1.030182, -2.744716, 0, 1, 0.5019608, 1,
-0.2315746, -0.462406, -1.866458, 0, 1, 0.509804, 1,
-0.229799, -1.028223, -1.574365, 0, 1, 0.5137255, 1,
-0.2246844, 1.641718, 1.504599, 0, 1, 0.5215687, 1,
-0.2230925, 0.4538792, -0.8213992, 0, 1, 0.5254902, 1,
-0.2224685, -0.4247391, -3.750809, 0, 1, 0.5333334, 1,
-0.2109127, -0.2017374, -2.21838, 0, 1, 0.5372549, 1,
-0.2109091, -2.379599, -3.083101, 0, 1, 0.5450981, 1,
-0.2089168, -1.199813, -2.335185, 0, 1, 0.5490196, 1,
-0.2087945, -0.664804, -2.148495, 0, 1, 0.5568628, 1,
-0.2080836, 0.9201992, -1.780909, 0, 1, 0.5607843, 1,
-0.2022473, -0.9292049, -4.496533, 0, 1, 0.5686275, 1,
-0.2008047, -0.1591015, -2.264831, 0, 1, 0.572549, 1,
-0.1954674, 0.2291657, -1.073497, 0, 1, 0.5803922, 1,
-0.1936587, 0.4281978, -0.8434918, 0, 1, 0.5843138, 1,
-0.1894969, 0.2255545, 0.2717026, 0, 1, 0.5921569, 1,
-0.1877874, -0.1766483, -2.133591, 0, 1, 0.5960785, 1,
-0.1877537, -0.4859321, -2.702642, 0, 1, 0.6039216, 1,
-0.1877018, 0.8087895, -1.55656, 0, 1, 0.6117647, 1,
-0.1871417, 0.06409312, -1.625398, 0, 1, 0.6156863, 1,
-0.1868446, 0.5151029, -1.426221, 0, 1, 0.6235294, 1,
-0.1864477, -1.141591, -1.106857, 0, 1, 0.627451, 1,
-0.1821717, 1.204542, -1.275439, 0, 1, 0.6352941, 1,
-0.1816789, -0.06440028, -3.153749, 0, 1, 0.6392157, 1,
-0.1771469, 1.065405, -1.066759, 0, 1, 0.6470588, 1,
-0.1753148, 0.3302469, -0.212777, 0, 1, 0.6509804, 1,
-0.1746388, 0.7565207, -0.5063398, 0, 1, 0.6588235, 1,
-0.1735893, -0.09490836, -2.090145, 0, 1, 0.6627451, 1,
-0.167441, 0.4015338, -0.1367549, 0, 1, 0.6705883, 1,
-0.1661995, 0.4898433, -0.6200286, 0, 1, 0.6745098, 1,
-0.1618328, 0.2053231, -1.011928, 0, 1, 0.682353, 1,
-0.1602008, 0.2286925, -0.1992236, 0, 1, 0.6862745, 1,
-0.1564046, -0.1278028, -2.37412, 0, 1, 0.6941177, 1,
-0.1562372, -0.8684638, -3.602914, 0, 1, 0.7019608, 1,
-0.1514609, 1.226529, -0.1102476, 0, 1, 0.7058824, 1,
-0.1492844, -0.6680353, -3.486307, 0, 1, 0.7137255, 1,
-0.1491984, 0.9664466, 0.2201244, 0, 1, 0.7176471, 1,
-0.1441906, 1.346895, -0.5262706, 0, 1, 0.7254902, 1,
-0.1406482, -1.679082, -4.414638, 0, 1, 0.7294118, 1,
-0.1397227, 1.172283, 0.2400061, 0, 1, 0.7372549, 1,
-0.1396622, 0.3088497, -0.004035965, 0, 1, 0.7411765, 1,
-0.1384728, -0.9635767, -4.028478, 0, 1, 0.7490196, 1,
-0.1247859, 0.4170771, -0.2863655, 0, 1, 0.7529412, 1,
-0.1233361, 0.4957167, -0.691949, 0, 1, 0.7607843, 1,
-0.1231663, -0.7091112, -3.984522, 0, 1, 0.7647059, 1,
-0.1198347, 0.5595627, 0.9564967, 0, 1, 0.772549, 1,
-0.119758, -0.6049895, -1.19709, 0, 1, 0.7764706, 1,
-0.1170099, 0.8113757, 0.01037126, 0, 1, 0.7843137, 1,
-0.1102093, 0.3324143, -1.365354, 0, 1, 0.7882353, 1,
-0.1097343, -0.4724071, -2.921308, 0, 1, 0.7960784, 1,
-0.1075389, -2.718061, -3.477278, 0, 1, 0.8039216, 1,
-0.10514, -0.6935012, -4.214922, 0, 1, 0.8078431, 1,
-0.1044584, -0.4781693, -3.35493, 0, 1, 0.8156863, 1,
-0.1009711, -1.000551, -3.000844, 0, 1, 0.8196079, 1,
-0.09910528, -1.335413, -4.101442, 0, 1, 0.827451, 1,
-0.09869174, 0.6898153, 0.6856734, 0, 1, 0.8313726, 1,
-0.09065701, 1.543718, 0.2874232, 0, 1, 0.8392157, 1,
-0.08605273, -0.8948984, -3.041646, 0, 1, 0.8431373, 1,
-0.08554478, -0.01687982, -1.411264, 0, 1, 0.8509804, 1,
-0.0840809, -0.2237298, -3.260838, 0, 1, 0.854902, 1,
-0.08405975, 0.3786606, -1.085006, 0, 1, 0.8627451, 1,
-0.08112926, 0.956966, -1.305313, 0, 1, 0.8666667, 1,
-0.08064353, 0.2542233, 0.2346896, 0, 1, 0.8745098, 1,
-0.08010054, 1.888837, -1.237708, 0, 1, 0.8784314, 1,
-0.07318264, -1.556823, -3.113351, 0, 1, 0.8862745, 1,
-0.05819484, 0.1038832, -2.118658, 0, 1, 0.8901961, 1,
-0.05802104, 0.8509987, -1.389435, 0, 1, 0.8980392, 1,
-0.05027189, -1.148615, -2.561568, 0, 1, 0.9058824, 1,
-0.0499506, -1.301509, -4.998811, 0, 1, 0.9098039, 1,
-0.04855035, 0.003359941, 0.1308572, 0, 1, 0.9176471, 1,
-0.04424134, 0.6132957, -1.61774, 0, 1, 0.9215686, 1,
-0.04349539, -1.832033, -2.900587, 0, 1, 0.9294118, 1,
-0.04327038, -1.343959, -2.581541, 0, 1, 0.9333333, 1,
-0.04315897, 0.2263458, -1.638976, 0, 1, 0.9411765, 1,
-0.04267917, -2.27448, -2.808242, 0, 1, 0.945098, 1,
-0.03248904, 1.547043, -0.09866878, 0, 1, 0.9529412, 1,
-0.03223411, 1.25459, -0.6747102, 0, 1, 0.9568627, 1,
-0.0308948, -0.8721158, -3.768584, 0, 1, 0.9647059, 1,
-0.02737026, 0.6965454, 1.646491, 0, 1, 0.9686275, 1,
-0.02590063, -0.1612699, -3.994856, 0, 1, 0.9764706, 1,
-0.02545016, -1.272751, -3.760822, 0, 1, 0.9803922, 1,
-0.01913219, 1.065143, -1.802573, 0, 1, 0.9882353, 1,
-0.01768355, 0.7260177, -1.08478, 0, 1, 0.9921569, 1,
-0.01649767, 0.5242562, -1.532493, 0, 1, 1, 1,
-0.008547865, -0.247899, -3.276114, 0, 0.9921569, 1, 1,
-0.0034241, 1.317476, -0.4318676, 0, 0.9882353, 1, 1,
-0.0006957798, -3.273187, -3.24719, 0, 0.9803922, 1, 1,
-7.546294e-06, 0.4891184, 0.733714, 0, 0.9764706, 1, 1,
0.005022424, 0.1743325, 0.04101421, 0, 0.9686275, 1, 1,
0.006410484, 0.4001679, 1.480131, 0, 0.9647059, 1, 1,
0.007229539, -1.230514, 1.796527, 0, 0.9568627, 1, 1,
0.008223625, 0.2652564, 0.965202, 0, 0.9529412, 1, 1,
0.009909586, -0.2508126, 2.907263, 0, 0.945098, 1, 1,
0.02307332, 1.62692, 0.7296392, 0, 0.9411765, 1, 1,
0.02323912, -0.721703, 3.220675, 0, 0.9333333, 1, 1,
0.02595193, -1.002845, 3.610639, 0, 0.9294118, 1, 1,
0.02914261, -1.195227, 2.77518, 0, 0.9215686, 1, 1,
0.03804893, 0.2483411, 1.089755, 0, 0.9176471, 1, 1,
0.0385837, 0.8919767, -0.3420158, 0, 0.9098039, 1, 1,
0.03987326, 0.6031103, 2.395838, 0, 0.9058824, 1, 1,
0.04007564, -1.273071, 4.30156, 0, 0.8980392, 1, 1,
0.04009435, 0.7771746, 0.3472314, 0, 0.8901961, 1, 1,
0.04940253, 0.4765025, 1.422344, 0, 0.8862745, 1, 1,
0.0556986, 0.5700724, -0.5584716, 0, 0.8784314, 1, 1,
0.05692757, -1.428078, 3.60984, 0, 0.8745098, 1, 1,
0.06371383, -0.02976264, 0.9581552, 0, 0.8666667, 1, 1,
0.06400912, -1.492459, 3.80094, 0, 0.8627451, 1, 1,
0.06990366, -2.613795, 3.623475, 0, 0.854902, 1, 1,
0.06998131, -0.82453, 2.319732, 0, 0.8509804, 1, 1,
0.07056972, -0.4111796, 2.269684, 0, 0.8431373, 1, 1,
0.07065861, -0.8918558, 2.21894, 0, 0.8392157, 1, 1,
0.07156207, 0.6873535, 0.3973711, 0, 0.8313726, 1, 1,
0.07375944, 0.3660012, -0.1710189, 0, 0.827451, 1, 1,
0.07774258, 0.9122728, -1.20311, 0, 0.8196079, 1, 1,
0.07927656, -0.3914903, 3.37612, 0, 0.8156863, 1, 1,
0.08131519, -0.704917, 4.126004, 0, 0.8078431, 1, 1,
0.08458373, 0.3384731, 0.4794678, 0, 0.8039216, 1, 1,
0.08502499, 0.4467075, 0.5377237, 0, 0.7960784, 1, 1,
0.08952454, -0.08590158, 2.828904, 0, 0.7882353, 1, 1,
0.08968303, 0.06439307, -0.4546825, 0, 0.7843137, 1, 1,
0.09138697, -0.8888134, 0.5630109, 0, 0.7764706, 1, 1,
0.09285873, 0.08567565, 2.6104, 0, 0.772549, 1, 1,
0.09589656, -0.4954423, 3.560371, 0, 0.7647059, 1, 1,
0.09596218, 2.144175, 0.8947402, 0, 0.7607843, 1, 1,
0.0965051, 0.680873, 0.9797219, 0, 0.7529412, 1, 1,
0.1016195, 0.9455498, -0.1495053, 0, 0.7490196, 1, 1,
0.1037382, -0.6788428, 2.373032, 0, 0.7411765, 1, 1,
0.1060826, -1.138718, 1.522892, 0, 0.7372549, 1, 1,
0.1061415, -2.201417, 2.393511, 0, 0.7294118, 1, 1,
0.1102844, 0.4154066, -0.8595893, 0, 0.7254902, 1, 1,
0.1127222, 0.1803074, 1.986218, 0, 0.7176471, 1, 1,
0.1224611, -0.2218412, 3.571529, 0, 0.7137255, 1, 1,
0.1231391, 1.355764, 0.3355004, 0, 0.7058824, 1, 1,
0.128852, 0.155981, 0.4464423, 0, 0.6980392, 1, 1,
0.1336114, 0.9430645, 0.01308088, 0, 0.6941177, 1, 1,
0.1356474, 0.204849, 2.099851, 0, 0.6862745, 1, 1,
0.136246, 0.2218422, 1.092418, 0, 0.682353, 1, 1,
0.140686, -0.2316755, 1.631136, 0, 0.6745098, 1, 1,
0.1448303, -0.8004462, 3.801878, 0, 0.6705883, 1, 1,
0.1452715, -0.2845778, 1.688339, 0, 0.6627451, 1, 1,
0.1456209, 0.7985387, 1.464927, 0, 0.6588235, 1, 1,
0.1459794, 1.477117, -0.22898, 0, 0.6509804, 1, 1,
0.1494149, -1.160564, 3.499879, 0, 0.6470588, 1, 1,
0.1519479, -1.223418, 3.316101, 0, 0.6392157, 1, 1,
0.1535838, 1.853739, 0.7322651, 0, 0.6352941, 1, 1,
0.1569901, 1.235722, -1.97944, 0, 0.627451, 1, 1,
0.1574769, -0.5088011, 3.210184, 0, 0.6235294, 1, 1,
0.1632088, -0.7417673, 3.147033, 0, 0.6156863, 1, 1,
0.16495, 0.2018415, 1.115255, 0, 0.6117647, 1, 1,
0.1652831, 1.227163, -0.0441159, 0, 0.6039216, 1, 1,
0.1673725, 1.179868, 0.7524089, 0, 0.5960785, 1, 1,
0.1704286, 0.2667743, -0.3580472, 0, 0.5921569, 1, 1,
0.1742719, -0.2933556, 1.012612, 0, 0.5843138, 1, 1,
0.1765882, 1.188051, 0.8859137, 0, 0.5803922, 1, 1,
0.1850588, -0.9114989, 0.8735623, 0, 0.572549, 1, 1,
0.187851, -0.6406359, 3.224435, 0, 0.5686275, 1, 1,
0.191303, -1.116951, 3.358613, 0, 0.5607843, 1, 1,
0.1964978, -0.7850675, 2.740724, 0, 0.5568628, 1, 1,
0.1965496, -0.6101407, 2.008793, 0, 0.5490196, 1, 1,
0.2031683, -0.9000071, 2.216729, 0, 0.5450981, 1, 1,
0.2040376, 2.019563, -0.4159727, 0, 0.5372549, 1, 1,
0.2043694, 1.452348, -1.338184, 0, 0.5333334, 1, 1,
0.2049635, -0.9391088, 3.122937, 0, 0.5254902, 1, 1,
0.2053548, 0.6558436, 0.3012311, 0, 0.5215687, 1, 1,
0.207105, 1.226874, -2.559107, 0, 0.5137255, 1, 1,
0.2106815, -1.236247, 0.5621357, 0, 0.509804, 1, 1,
0.2137018, 2.190211, 0.5000296, 0, 0.5019608, 1, 1,
0.2169899, 0.1451782, 0.4764702, 0, 0.4941176, 1, 1,
0.2184887, -0.6448755, 3.034401, 0, 0.4901961, 1, 1,
0.2236312, -0.4475852, 3.38619, 0, 0.4823529, 1, 1,
0.2306345, -0.2582631, 1.985075, 0, 0.4784314, 1, 1,
0.2318975, 1.090935, -0.9649728, 0, 0.4705882, 1, 1,
0.2329822, 1.263948, -0.06031515, 0, 0.4666667, 1, 1,
0.2491376, 0.4732755, 1.076688, 0, 0.4588235, 1, 1,
0.2536608, -0.3574594, 2.114445, 0, 0.454902, 1, 1,
0.2559168, -0.33378, 2.453718, 0, 0.4470588, 1, 1,
0.2600015, -1.153403, 3.594949, 0, 0.4431373, 1, 1,
0.2611617, -0.3235623, 1.913082, 0, 0.4352941, 1, 1,
0.2623989, -1.476923, 3.522724, 0, 0.4313726, 1, 1,
0.2665502, -0.3976812, 3.005901, 0, 0.4235294, 1, 1,
0.2671076, -0.2811491, 2.531018, 0, 0.4196078, 1, 1,
0.2693573, 0.5977821, -0.4633117, 0, 0.4117647, 1, 1,
0.2699411, 0.3129094, 1.236924, 0, 0.4078431, 1, 1,
0.2746876, 0.1298738, 1.244347, 0, 0.4, 1, 1,
0.2789317, 0.05785124, 2.176033, 0, 0.3921569, 1, 1,
0.2801337, 1.698631, 0.3997309, 0, 0.3882353, 1, 1,
0.2808203, -0.7947096, 2.763981, 0, 0.3803922, 1, 1,
0.2883323, 0.3185961, 0.6930924, 0, 0.3764706, 1, 1,
0.2893668, -1.017009, 3.456933, 0, 0.3686275, 1, 1,
0.2913642, -0.03601436, 2.456316, 0, 0.3647059, 1, 1,
0.2937618, -0.5939672, 1.655653, 0, 0.3568628, 1, 1,
0.2947208, -0.9201283, 2.297248, 0, 0.3529412, 1, 1,
0.2958355, -0.738331, 3.09519, 0, 0.345098, 1, 1,
0.2982313, 0.9710165, 0.463333, 0, 0.3411765, 1, 1,
0.2995746, 0.001941976, 0.9506714, 0, 0.3333333, 1, 1,
0.3124761, 0.4394365, -0.05195039, 0, 0.3294118, 1, 1,
0.3134769, 1.970754, -0.5529324, 0, 0.3215686, 1, 1,
0.3139473, -1.63111, 4.005047, 0, 0.3176471, 1, 1,
0.3175513, -1.250275, 1.198183, 0, 0.3098039, 1, 1,
0.3203847, -0.02136044, 1.611067, 0, 0.3058824, 1, 1,
0.3231827, 1.156855, 0.2703643, 0, 0.2980392, 1, 1,
0.3322592, -0.7939699, 3.683256, 0, 0.2901961, 1, 1,
0.3326622, -0.03443143, 3.436019, 0, 0.2862745, 1, 1,
0.340959, -0.6220732, 3.952633, 0, 0.2784314, 1, 1,
0.3436406, -1.462477, 0.8271165, 0, 0.2745098, 1, 1,
0.3453458, 0.4226003, -0.6977544, 0, 0.2666667, 1, 1,
0.3513738, 1.541916, 0.7833935, 0, 0.2627451, 1, 1,
0.3540772, 0.3053246, 1.257863, 0, 0.254902, 1, 1,
0.3553741, 0.896682, 1.559095, 0, 0.2509804, 1, 1,
0.3605829, -0.5872958, 2.218728, 0, 0.2431373, 1, 1,
0.3627746, 0.7282397, 0.3247306, 0, 0.2392157, 1, 1,
0.3631456, 0.8108731, 1.596799, 0, 0.2313726, 1, 1,
0.3634157, -0.7497945, 3.268941, 0, 0.227451, 1, 1,
0.366944, 0.2992802, 0.2146149, 0, 0.2196078, 1, 1,
0.368077, 1.423522, -0.1350804, 0, 0.2156863, 1, 1,
0.3685187, -0.4505419, 1.699803, 0, 0.2078431, 1, 1,
0.3708371, 0.9878981, 1.149047, 0, 0.2039216, 1, 1,
0.3737009, -0.08964221, 1.587158, 0, 0.1960784, 1, 1,
0.3787548, -0.5436743, 2.944246, 0, 0.1882353, 1, 1,
0.3817126, 1.025489, 0.3867283, 0, 0.1843137, 1, 1,
0.386563, -0.7015565, 1.530524, 0, 0.1764706, 1, 1,
0.3884214, 0.8372804, 2.031027, 0, 0.172549, 1, 1,
0.3934031, -0.220808, 3.565096, 0, 0.1647059, 1, 1,
0.3934655, -1.937228, 3.72741, 0, 0.1607843, 1, 1,
0.3959234, 1.202025, -0.5263119, 0, 0.1529412, 1, 1,
0.3979093, -0.8424355, 2.96086, 0, 0.1490196, 1, 1,
0.4016739, 0.0004230412, 3.536067, 0, 0.1411765, 1, 1,
0.4035356, -0.8659267, 2.451334, 0, 0.1372549, 1, 1,
0.4052431, 0.6087114, 2.010082, 0, 0.1294118, 1, 1,
0.4064971, -1.046201, 3.493397, 0, 0.1254902, 1, 1,
0.40691, -0.1092131, 2.519676, 0, 0.1176471, 1, 1,
0.4080735, 0.5424191, -0.9006106, 0, 0.1137255, 1, 1,
0.4084086, 0.2849526, 1.847531, 0, 0.1058824, 1, 1,
0.4103304, 1.185152, 0.3549314, 0, 0.09803922, 1, 1,
0.4137214, -0.7090173, 3.184489, 0, 0.09411765, 1, 1,
0.4153643, 0.9212874, 2.242502, 0, 0.08627451, 1, 1,
0.4226132, 1.736583, 2.258741, 0, 0.08235294, 1, 1,
0.4228632, -1.822055, 3.449676, 0, 0.07450981, 1, 1,
0.4247563, 0.4250527, -0.6008804, 0, 0.07058824, 1, 1,
0.4265646, 0.423002, 0.6526708, 0, 0.0627451, 1, 1,
0.4279949, 1.507891, 0.8824042, 0, 0.05882353, 1, 1,
0.4302939, -0.7234901, 4.46316, 0, 0.05098039, 1, 1,
0.4303989, 0.03882909, 1.401039, 0, 0.04705882, 1, 1,
0.433372, -0.6363469, 4.198219, 0, 0.03921569, 1, 1,
0.4390237, -0.2832548, 2.904039, 0, 0.03529412, 1, 1,
0.4412608, 0.1398223, 0.6977342, 0, 0.02745098, 1, 1,
0.4440883, 0.4240695, 0.4942567, 0, 0.02352941, 1, 1,
0.4455777, 0.7061284, 1.068713, 0, 0.01568628, 1, 1,
0.4504489, 0.4462865, 1.125398, 0, 0.01176471, 1, 1,
0.4509988, -1.098573, 1.681366, 0, 0.003921569, 1, 1,
0.4535654, -0.3818358, 4.677025, 0.003921569, 0, 1, 1,
0.4549113, 2.453851, -0.3253738, 0.007843138, 0, 1, 1,
0.4584296, 1.578306, -0.0563389, 0.01568628, 0, 1, 1,
0.4592003, -1.571933, 3.512175, 0.01960784, 0, 1, 1,
0.4610955, -1.107946, 2.777345, 0.02745098, 0, 1, 1,
0.461411, 0.01060214, 1.468083, 0.03137255, 0, 1, 1,
0.4643326, -1.198492, 3.69443, 0.03921569, 0, 1, 1,
0.4717796, 0.2783978, 0.8751911, 0.04313726, 0, 1, 1,
0.4723839, 0.7010548, 0.9866983, 0.05098039, 0, 1, 1,
0.4732702, 0.1838572, -0.8544755, 0.05490196, 0, 1, 1,
0.4750666, -0.2863556, 2.997339, 0.0627451, 0, 1, 1,
0.4761096, 0.609688, 1.689101, 0.06666667, 0, 1, 1,
0.477125, -0.1762409, 3.416811, 0.07450981, 0, 1, 1,
0.4797075, 0.8579285, 0.7355404, 0.07843138, 0, 1, 1,
0.4807587, 1.400434, -0.6908369, 0.08627451, 0, 1, 1,
0.4845052, -0.2166901, 2.141111, 0.09019608, 0, 1, 1,
0.4899553, 1.466768, -0.7886973, 0.09803922, 0, 1, 1,
0.4930996, -0.9961153, 3.54511, 0.1058824, 0, 1, 1,
0.4960005, -0.6173608, 2.181279, 0.1098039, 0, 1, 1,
0.4968714, -1.480214, 2.202796, 0.1176471, 0, 1, 1,
0.4972917, -0.05930857, 1.186474, 0.1215686, 0, 1, 1,
0.4987457, 0.4603491, 0.4029316, 0.1294118, 0, 1, 1,
0.5003341, -0.9223659, 2.39595, 0.1333333, 0, 1, 1,
0.5075735, 0.5948049, 0.3497094, 0.1411765, 0, 1, 1,
0.5119376, 0.428588, -0.3955202, 0.145098, 0, 1, 1,
0.5119394, 0.7764355, 0.2000104, 0.1529412, 0, 1, 1,
0.5165054, 0.8549727, -0.3822185, 0.1568628, 0, 1, 1,
0.5168043, 0.7001976, 1.264533, 0.1647059, 0, 1, 1,
0.5213819, 0.1063897, 0.1244559, 0.1686275, 0, 1, 1,
0.5225971, -0.8871126, 3.201508, 0.1764706, 0, 1, 1,
0.5296997, -0.9939259, 2.243972, 0.1803922, 0, 1, 1,
0.5315192, 1.417525, -0.9043839, 0.1882353, 0, 1, 1,
0.5315673, -0.8780529, 3.419037, 0.1921569, 0, 1, 1,
0.5348681, 0.005587284, 2.908121, 0.2, 0, 1, 1,
0.5353173, 0.9434131, -0.2613217, 0.2078431, 0, 1, 1,
0.5405388, -1.923344, 1.943572, 0.2117647, 0, 1, 1,
0.5407398, 2.166799, -0.3373889, 0.2196078, 0, 1, 1,
0.5448059, 0.7538486, -0.3334517, 0.2235294, 0, 1, 1,
0.5466739, -0.547776, 3.264944, 0.2313726, 0, 1, 1,
0.5476831, 0.1852262, 1.169082, 0.2352941, 0, 1, 1,
0.5503841, 0.2531739, 1.202185, 0.2431373, 0, 1, 1,
0.5520229, -1.405281, 2.591173, 0.2470588, 0, 1, 1,
0.5528736, -0.3317739, -0.1304957, 0.254902, 0, 1, 1,
0.5546371, 0.4748956, 2.462306, 0.2588235, 0, 1, 1,
0.5584946, 0.5709508, 1.207624, 0.2666667, 0, 1, 1,
0.5594943, 0.860707, -0.2240002, 0.2705882, 0, 1, 1,
0.5595575, 0.0281595, 1.536376, 0.2784314, 0, 1, 1,
0.572995, 1.009643, 0.3816457, 0.282353, 0, 1, 1,
0.581226, -0.1491221, 1.035637, 0.2901961, 0, 1, 1,
0.5850592, -1.018788, 4.329943, 0.2941177, 0, 1, 1,
0.5862489, 1.176358, 1.027534, 0.3019608, 0, 1, 1,
0.5896789, -0.1503288, 3.73224, 0.3098039, 0, 1, 1,
0.5911366, -0.4978609, 2.370562, 0.3137255, 0, 1, 1,
0.5921396, -1.12505, 2.194802, 0.3215686, 0, 1, 1,
0.5922817, -0.6633477, 2.444595, 0.3254902, 0, 1, 1,
0.5931412, 1.369332, 0.8482637, 0.3333333, 0, 1, 1,
0.5991569, 1.209702, 0.7816509, 0.3372549, 0, 1, 1,
0.6006923, -1.916914, 1.542682, 0.345098, 0, 1, 1,
0.6023973, -0.7598838, 2.418111, 0.3490196, 0, 1, 1,
0.6056891, -0.8727546, 2.511934, 0.3568628, 0, 1, 1,
0.6087722, -0.08674314, 1.208447, 0.3607843, 0, 1, 1,
0.6091035, 1.196568, -0.5209445, 0.3686275, 0, 1, 1,
0.6101947, 0.7795534, 1.159287, 0.372549, 0, 1, 1,
0.6150419, 0.5250649, 0.5915599, 0.3803922, 0, 1, 1,
0.6170292, -1.240616, 2.704142, 0.3843137, 0, 1, 1,
0.6171091, -0.827364, 2.742585, 0.3921569, 0, 1, 1,
0.6176339, 1.043234, -0.767759, 0.3960784, 0, 1, 1,
0.617834, 1.016493, 0.5363051, 0.4039216, 0, 1, 1,
0.6268852, 1.195925, 0.7224661, 0.4117647, 0, 1, 1,
0.6274027, 1.259808, -1.200141, 0.4156863, 0, 1, 1,
0.6290315, 0.3316455, 1.505417, 0.4235294, 0, 1, 1,
0.635233, 0.6821448, -1.861154, 0.427451, 0, 1, 1,
0.638556, 2.068463, -0.1004289, 0.4352941, 0, 1, 1,
0.6400576, -0.8829234, 1.189689, 0.4392157, 0, 1, 1,
0.6406931, -0.9794151, 3.806788, 0.4470588, 0, 1, 1,
0.6414126, -0.3472042, 2.606355, 0.4509804, 0, 1, 1,
0.6485456, 0.8991822, 1.326066, 0.4588235, 0, 1, 1,
0.6574452, 1.559069, -0.4594056, 0.4627451, 0, 1, 1,
0.6582656, 0.4074334, 2.018188, 0.4705882, 0, 1, 1,
0.6701806, -0.01280931, 1.551414, 0.4745098, 0, 1, 1,
0.6827803, -0.2457132, 2.425799, 0.4823529, 0, 1, 1,
0.6893409, -0.2464778, 2.51861, 0.4862745, 0, 1, 1,
0.690811, 0.1205877, 0.9011847, 0.4941176, 0, 1, 1,
0.6920148, -0.2732338, 0.5421214, 0.5019608, 0, 1, 1,
0.6973085, -0.1405474, 0.3611153, 0.5058824, 0, 1, 1,
0.7023054, 1.154855, -0.6833609, 0.5137255, 0, 1, 1,
0.7135603, -0.825404, 4.035616, 0.5176471, 0, 1, 1,
0.7232901, -0.779467, 2.886681, 0.5254902, 0, 1, 1,
0.7237483, -0.2150798, 2.508382, 0.5294118, 0, 1, 1,
0.7245016, -2.338401, 1.348859, 0.5372549, 0, 1, 1,
0.7253025, 1.148456, 1.163241, 0.5411765, 0, 1, 1,
0.7279648, 0.1352948, 2.157514, 0.5490196, 0, 1, 1,
0.7284943, 0.548153, 1.733906, 0.5529412, 0, 1, 1,
0.7308978, -0.3555383, 2.115132, 0.5607843, 0, 1, 1,
0.7313132, 2.257899, 1.10204, 0.5647059, 0, 1, 1,
0.7391471, 1.354428, 0.3797293, 0.572549, 0, 1, 1,
0.7498882, -0.8009184, 3.70591, 0.5764706, 0, 1, 1,
0.7517561, -0.5431874, 1.490926, 0.5843138, 0, 1, 1,
0.7528228, -2.02361, 3.017813, 0.5882353, 0, 1, 1,
0.7537284, -0.4130447, 1.078356, 0.5960785, 0, 1, 1,
0.7550305, -1.704527, 2.422143, 0.6039216, 0, 1, 1,
0.756692, -0.324975, 3.131948, 0.6078432, 0, 1, 1,
0.7567533, -1.195937, 4.426596, 0.6156863, 0, 1, 1,
0.7593545, -0.7341665, 2.124446, 0.6196079, 0, 1, 1,
0.7730591, 0.335323, 1.40564, 0.627451, 0, 1, 1,
0.7735396, -0.1316177, 2.299676, 0.6313726, 0, 1, 1,
0.7805638, 0.3715662, -0.4151797, 0.6392157, 0, 1, 1,
0.7817171, -1.040274, 2.915645, 0.6431373, 0, 1, 1,
0.7869247, -0.4510445, 1.819648, 0.6509804, 0, 1, 1,
0.7887431, 1.357179, 0.6235273, 0.654902, 0, 1, 1,
0.7909626, -1.692897, 3.117768, 0.6627451, 0, 1, 1,
0.7912435, -0.1781764, 1.463726, 0.6666667, 0, 1, 1,
0.7973285, -0.6660213, 2.264226, 0.6745098, 0, 1, 1,
0.7995006, -1.729084, 0.7238269, 0.6784314, 0, 1, 1,
0.8020616, -1.914905, 3.115975, 0.6862745, 0, 1, 1,
0.8101791, -0.4305049, 1.315481, 0.6901961, 0, 1, 1,
0.8127236, 0.332769, 1.799312, 0.6980392, 0, 1, 1,
0.8188192, -0.2061341, 2.689085, 0.7058824, 0, 1, 1,
0.8189766, -0.7784376, 1.972426, 0.7098039, 0, 1, 1,
0.8228158, -2.529629, 2.100831, 0.7176471, 0, 1, 1,
0.8239294, -0.3997775, 0.4781266, 0.7215686, 0, 1, 1,
0.8242037, -0.391209, 0.6639276, 0.7294118, 0, 1, 1,
0.8270032, -1.466495, 2.638096, 0.7333333, 0, 1, 1,
0.8354654, -1.039777, 3.826715, 0.7411765, 0, 1, 1,
0.8416434, 0.04688428, 4.380482, 0.7450981, 0, 1, 1,
0.8438015, -0.3185086, 3.098201, 0.7529412, 0, 1, 1,
0.8608684, -0.7309017, 2.665751, 0.7568628, 0, 1, 1,
0.8612637, -0.3441058, 1.957839, 0.7647059, 0, 1, 1,
0.8632046, 1.176874, 0.8065082, 0.7686275, 0, 1, 1,
0.8763757, -1.158933, 1.277417, 0.7764706, 0, 1, 1,
0.8906281, 2.013325, 0.1238308, 0.7803922, 0, 1, 1,
0.8988144, 1.387958, -0.3158793, 0.7882353, 0, 1, 1,
0.9006801, -0.3504401, 1.749208, 0.7921569, 0, 1, 1,
0.9018013, -0.4030267, 0.2930419, 0.8, 0, 1, 1,
0.9047282, -0.549598, -0.1287904, 0.8078431, 0, 1, 1,
0.9070007, -0.3787402, 1.487725, 0.8117647, 0, 1, 1,
0.9088145, 0.1463648, 0.6638819, 0.8196079, 0, 1, 1,
0.9089674, 0.9761231, 1.617115, 0.8235294, 0, 1, 1,
0.9108755, 1.365831, 0.4907783, 0.8313726, 0, 1, 1,
0.9116575, 0.7234927, 1.382289, 0.8352941, 0, 1, 1,
0.9158558, 0.02297758, 2.394359, 0.8431373, 0, 1, 1,
0.916199, 0.09650258, 2.030972, 0.8470588, 0, 1, 1,
0.9249534, 1.211298, 0.423146, 0.854902, 0, 1, 1,
0.9254855, 0.02949167, 0.09501132, 0.8588235, 0, 1, 1,
0.9349976, 0.8462456, 1.175286, 0.8666667, 0, 1, 1,
0.9410239, 0.6510876, 0.5632223, 0.8705882, 0, 1, 1,
0.9445652, 1.585562, -0.102876, 0.8784314, 0, 1, 1,
0.9638556, -0.01161371, 2.078128, 0.8823529, 0, 1, 1,
0.9649001, 1.691773, 1.005181, 0.8901961, 0, 1, 1,
0.9665837, 0.4218376, 1.423056, 0.8941177, 0, 1, 1,
0.971748, 0.2727856, 1.008596, 0.9019608, 0, 1, 1,
0.9723721, 1.346671, -0.7124765, 0.9098039, 0, 1, 1,
0.9728428, 0.04658886, 0.04272217, 0.9137255, 0, 1, 1,
0.9820871, -0.09747203, 1.607369, 0.9215686, 0, 1, 1,
0.9880503, -0.7220143, 1.37559, 0.9254902, 0, 1, 1,
0.9935182, 0.4237402, 0.1305723, 0.9333333, 0, 1, 1,
0.9971949, 0.7021556, 1.800039, 0.9372549, 0, 1, 1,
0.9993892, -0.7043909, 2.255305, 0.945098, 0, 1, 1,
0.9994164, -0.09251538, 0.6354324, 0.9490196, 0, 1, 1,
0.9997097, -0.6008338, 4.093728, 0.9568627, 0, 1, 1,
1.000236, 0.2794904, 0.9386002, 0.9607843, 0, 1, 1,
1.004645, -0.3846857, 1.887814, 0.9686275, 0, 1, 1,
1.010272, 0.5516858, 2.02794, 0.972549, 0, 1, 1,
1.012488, 0.08495796, 2.003637, 0.9803922, 0, 1, 1,
1.023667, 2.057366, 0.2241588, 0.9843137, 0, 1, 1,
1.031315, -0.2075327, 3.847928, 0.9921569, 0, 1, 1,
1.031373, -0.3726839, 1.710754, 0.9960784, 0, 1, 1,
1.038203, -1.189503, 0.502431, 1, 0, 0.9960784, 1,
1.040233, 0.5132604, 0.3149453, 1, 0, 0.9882353, 1,
1.041036, -0.5823328, 2.738331, 1, 0, 0.9843137, 1,
1.041885, 0.7758524, 1.910125, 1, 0, 0.9764706, 1,
1.049714, 1.040936, 0.931677, 1, 0, 0.972549, 1,
1.050678, -1.177083, 2.955538, 1, 0, 0.9647059, 1,
1.051558, -0.1427361, 2.741776, 1, 0, 0.9607843, 1,
1.05266, -0.3014694, 2.332529, 1, 0, 0.9529412, 1,
1.052975, -0.0270043, 0.8756425, 1, 0, 0.9490196, 1,
1.058475, -0.1411732, 1.010484, 1, 0, 0.9411765, 1,
1.060011, -0.6251948, 0.4417206, 1, 0, 0.9372549, 1,
1.061897, -0.330921, 1.411556, 1, 0, 0.9294118, 1,
1.066709, -0.9702337, 1.631661, 1, 0, 0.9254902, 1,
1.076308, -0.2708327, 3.153366, 1, 0, 0.9176471, 1,
1.084936, 0.9918419, -0.07959296, 1, 0, 0.9137255, 1,
1.085937, 0.6802258, -0.3502495, 1, 0, 0.9058824, 1,
1.086104, -1.13177, -0.1793325, 1, 0, 0.9019608, 1,
1.087078, 2.176204, 0.1918205, 1, 0, 0.8941177, 1,
1.087226, 0.9048005, -0.710788, 1, 0, 0.8862745, 1,
1.090158, -0.3099312, 2.18479, 1, 0, 0.8823529, 1,
1.090265, 0.874291, -0.5500594, 1, 0, 0.8745098, 1,
1.091652, 0.3027099, 1.22166, 1, 0, 0.8705882, 1,
1.093298, 0.5893318, 3.206538, 1, 0, 0.8627451, 1,
1.095007, -0.3412819, 1.981642, 1, 0, 0.8588235, 1,
1.100672, 0.3850388, 2.599422, 1, 0, 0.8509804, 1,
1.120109, 0.6753235, 0.9171508, 1, 0, 0.8470588, 1,
1.120504, 0.2597885, 1.073138, 1, 0, 0.8392157, 1,
1.123537, -0.03671426, 2.290214, 1, 0, 0.8352941, 1,
1.12798, 0.2637612, 0.4640713, 1, 0, 0.827451, 1,
1.128281, 0.3999152, 1.446811, 1, 0, 0.8235294, 1,
1.131052, 0.1531878, 0.6254997, 1, 0, 0.8156863, 1,
1.136113, 0.717607, 2.633218, 1, 0, 0.8117647, 1,
1.140488, 1.307885, -0.5166751, 1, 0, 0.8039216, 1,
1.145992, 0.2817517, 0.7860544, 1, 0, 0.7960784, 1,
1.149893, -0.7773796, 1.245506, 1, 0, 0.7921569, 1,
1.152576, 0.8094097, 1.275312, 1, 0, 0.7843137, 1,
1.156736, -0.8230582, 1.032395, 1, 0, 0.7803922, 1,
1.165066, -0.09891454, 2.647249, 1, 0, 0.772549, 1,
1.166693, 0.1918025, 1.633523, 1, 0, 0.7686275, 1,
1.167209, 0.3716744, -0.2654277, 1, 0, 0.7607843, 1,
1.172498, -1.877962, 2.359896, 1, 0, 0.7568628, 1,
1.177703, -0.4703484, 1.955394, 1, 0, 0.7490196, 1,
1.189117, -1.14942, 1.645359, 1, 0, 0.7450981, 1,
1.198504, -1.104665, 3.422345, 1, 0, 0.7372549, 1,
1.221886, -0.6775933, 2.143829, 1, 0, 0.7333333, 1,
1.229692, 0.3624458, 2.963135, 1, 0, 0.7254902, 1,
1.235875, 1.386159, 0.7289682, 1, 0, 0.7215686, 1,
1.240915, 0.9008684, 1.11534, 1, 0, 0.7137255, 1,
1.243725, 2.050291, 0.3697687, 1, 0, 0.7098039, 1,
1.248833, -1.821748, 2.054525, 1, 0, 0.7019608, 1,
1.250946, -1.426967, 1.571432, 1, 0, 0.6941177, 1,
1.251384, -0.05473355, 1.153702, 1, 0, 0.6901961, 1,
1.258506, 0.4325747, 4.294179, 1, 0, 0.682353, 1,
1.270879, 1.053415, 0.8082399, 1, 0, 0.6784314, 1,
1.271742, 0.1495615, 0.8167862, 1, 0, 0.6705883, 1,
1.27216, 0.4676378, 0.542055, 1, 0, 0.6666667, 1,
1.272724, -0.1108426, 2.410783, 1, 0, 0.6588235, 1,
1.272729, 0.0346575, -0.1339924, 1, 0, 0.654902, 1,
1.287065, 0.05325245, 1.32227, 1, 0, 0.6470588, 1,
1.291905, 2.235341, -0.9784773, 1, 0, 0.6431373, 1,
1.294097, 0.5719042, 0.369373, 1, 0, 0.6352941, 1,
1.297189, -0.05108928, 2.836964, 1, 0, 0.6313726, 1,
1.307547, 0.4627271, -0.6816531, 1, 0, 0.6235294, 1,
1.314948, 1.022622, 0.3281108, 1, 0, 0.6196079, 1,
1.325966, -0.4380859, 1.552142, 1, 0, 0.6117647, 1,
1.335072, -1.501356, 1.690162, 1, 0, 0.6078432, 1,
1.337112, -1.511287, 2.110552, 1, 0, 0.6, 1,
1.341491, -0.3915055, 2.965433, 1, 0, 0.5921569, 1,
1.342566, -1.237492, 3.222714, 1, 0, 0.5882353, 1,
1.359377, 0.6180509, 0.946595, 1, 0, 0.5803922, 1,
1.367131, 0.1997814, 0.3487786, 1, 0, 0.5764706, 1,
1.368293, 0.1099116, 0.1099978, 1, 0, 0.5686275, 1,
1.37587, 1.521323, -1.514403, 1, 0, 0.5647059, 1,
1.384944, -0.6088568, -1.116557, 1, 0, 0.5568628, 1,
1.395064, 0.2200417, 0.4546489, 1, 0, 0.5529412, 1,
1.399362, 1.817738, 1.534702, 1, 0, 0.5450981, 1,
1.404336, 0.7097995, 0.5898769, 1, 0, 0.5411765, 1,
1.415325, -0.1462249, 0.715928, 1, 0, 0.5333334, 1,
1.417137, -0.8619259, 2.521917, 1, 0, 0.5294118, 1,
1.426133, 1.054294, 2.789588, 1, 0, 0.5215687, 1,
1.429997, 0.05077215, 0.9989239, 1, 0, 0.5176471, 1,
1.439644, -0.4970632, 1.585834, 1, 0, 0.509804, 1,
1.44053, -0.4535405, 2.320141, 1, 0, 0.5058824, 1,
1.444146, -0.2740205, 1.785814, 1, 0, 0.4980392, 1,
1.446524, -0.2782628, 2.553518, 1, 0, 0.4901961, 1,
1.449064, -0.2324831, 1.732422, 1, 0, 0.4862745, 1,
1.47142, -0.2110103, 2.008554, 1, 0, 0.4784314, 1,
1.474245, 0.1565109, 1.156751, 1, 0, 0.4745098, 1,
1.497304, 2.118975, 0.7705994, 1, 0, 0.4666667, 1,
1.497653, 0.8593855, 1.890122, 1, 0, 0.4627451, 1,
1.504247, -0.1147822, 0.9203011, 1, 0, 0.454902, 1,
1.505833, -0.6379994, 2.812828, 1, 0, 0.4509804, 1,
1.506711, -0.5858539, 3.938094, 1, 0, 0.4431373, 1,
1.514424, 0.7267483, 2.263442, 1, 0, 0.4392157, 1,
1.517986, 0.741476, 2.152988, 1, 0, 0.4313726, 1,
1.523692, 1.118242, 0.2886298, 1, 0, 0.427451, 1,
1.533194, 0.7377372, 2.359598, 1, 0, 0.4196078, 1,
1.538805, 0.2172004, 2.033234, 1, 0, 0.4156863, 1,
1.555923, -0.4907603, 2.03739, 1, 0, 0.4078431, 1,
1.570602, 0.6428896, 1.677117, 1, 0, 0.4039216, 1,
1.581465, -0.1885164, 2.012141, 1, 0, 0.3960784, 1,
1.586343, -0.5700515, 3.484659, 1, 0, 0.3882353, 1,
1.59043, -0.8407022, 0.9249082, 1, 0, 0.3843137, 1,
1.597207, 0.1265216, 1.18938, 1, 0, 0.3764706, 1,
1.603824, -0.1562063, 0.7278969, 1, 0, 0.372549, 1,
1.623929, -0.310244, 1.573115, 1, 0, 0.3647059, 1,
1.629367, -0.03531759, 1.483897, 1, 0, 0.3607843, 1,
1.634987, 0.5330275, 1.217514, 1, 0, 0.3529412, 1,
1.644645, -0.8649542, 2.789944, 1, 0, 0.3490196, 1,
1.65337, 0.3578227, 0.6732084, 1, 0, 0.3411765, 1,
1.664501, 1.01807, 0.4927333, 1, 0, 0.3372549, 1,
1.677887, -0.8180584, 2.513085, 1, 0, 0.3294118, 1,
1.705751, -0.9432227, 2.894434, 1, 0, 0.3254902, 1,
1.717755, -0.1971639, 0.7911518, 1, 0, 0.3176471, 1,
1.717982, -0.2378445, 2.235225, 1, 0, 0.3137255, 1,
1.721541, 0.3649657, 2.175285, 1, 0, 0.3058824, 1,
1.723858, -0.5428304, 2.395339, 1, 0, 0.2980392, 1,
1.749676, 1.093201, 0.43174, 1, 0, 0.2941177, 1,
1.765112, -0.3774951, -0.1271593, 1, 0, 0.2862745, 1,
1.791177, -1.341557, 1.426614, 1, 0, 0.282353, 1,
1.791491, -0.6195772, 2.650987, 1, 0, 0.2745098, 1,
1.808996, 0.9351608, 0.7694384, 1, 0, 0.2705882, 1,
1.844609, -0.06651039, 3.349236, 1, 0, 0.2627451, 1,
1.844993, 0.6778425, 0.7613234, 1, 0, 0.2588235, 1,
1.860358, 1.403348, 1.211396, 1, 0, 0.2509804, 1,
1.869348, 0.1878699, 0.3136421, 1, 0, 0.2470588, 1,
1.899458, 0.4035276, 0.5061698, 1, 0, 0.2392157, 1,
1.906698, -1.399089, 3.708897, 1, 0, 0.2352941, 1,
1.916369, 0.2143798, -0.0555502, 1, 0, 0.227451, 1,
1.924678, -0.137152, 2.009427, 1, 0, 0.2235294, 1,
1.928198, -1.412669, 3.222503, 1, 0, 0.2156863, 1,
1.941707, -0.5713546, 0.3125125, 1, 0, 0.2117647, 1,
1.942357, 1.600214, 1.019459, 1, 0, 0.2039216, 1,
1.956965, 1.225333, 2.469112, 1, 0, 0.1960784, 1,
1.960403, -0.5484954, 1.718876, 1, 0, 0.1921569, 1,
1.972547, 0.8094798, 2.250106, 1, 0, 0.1843137, 1,
1.991459, -0.04470491, 0.608447, 1, 0, 0.1803922, 1,
1.992146, -1.872607, 4.970982, 1, 0, 0.172549, 1,
2.003485, 0.9143462, 1.066853, 1, 0, 0.1686275, 1,
2.005085, -0.3431718, 2.935446, 1, 0, 0.1607843, 1,
2.007039, -1.566133, 1.772592, 1, 0, 0.1568628, 1,
2.026406, 1.092498, -0.1834377, 1, 0, 0.1490196, 1,
2.064103, 0.8502598, 2.116517, 1, 0, 0.145098, 1,
2.106538, 2.094287, 0.4435602, 1, 0, 0.1372549, 1,
2.12822, -1.141884, 0.8331091, 1, 0, 0.1333333, 1,
2.151996, 0.450189, -0.1770763, 1, 0, 0.1254902, 1,
2.175211, 1.375376, 1.661559, 1, 0, 0.1215686, 1,
2.182116, 1.471307, -0.3067369, 1, 0, 0.1137255, 1,
2.19219, 0.2479816, 2.931724, 1, 0, 0.1098039, 1,
2.210106, -0.4241895, 1.574634, 1, 0, 0.1019608, 1,
2.236725, -0.1111601, 0.8748319, 1, 0, 0.09411765, 1,
2.246337, -0.03546548, 1.14976, 1, 0, 0.09019608, 1,
2.247686, -0.2925713, 0.9008023, 1, 0, 0.08235294, 1,
2.268795, 0.2791997, 1.170226, 1, 0, 0.07843138, 1,
2.408969, -0.6041574, 2.704116, 1, 0, 0.07058824, 1,
2.409136, 0.388292, 3.162129, 1, 0, 0.06666667, 1,
2.435154, 0.5085686, 1.325712, 1, 0, 0.05882353, 1,
2.442876, 0.3109367, 1.414437, 1, 0, 0.05490196, 1,
2.53015, -0.2707735, 0.7937939, 1, 0, 0.04705882, 1,
2.562946, 0.6582276, 1.221881, 1, 0, 0.04313726, 1,
2.66456, 1.028993, 2.304147, 1, 0, 0.03529412, 1,
2.785372, 0.6174619, -0.4499014, 1, 0, 0.03137255, 1,
2.966674, -0.3052057, 0.2164625, 1, 0, 0.02352941, 1,
3.004897, 1.177841, 0.6726668, 1, 0, 0.01960784, 1,
3.038605, 1.164612, 1.438452, 1, 0, 0.01176471, 1,
3.649999, -0.05591029, 1.936246, 1, 0, 0.007843138, 1
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
0.4522101, -4.31162, -6.777808, 0, -0.5, 0.5, 0.5,
0.4522101, -4.31162, -6.777808, 1, -0.5, 0.5, 0.5,
0.4522101, -4.31162, -6.777808, 1, 1.5, 0.5, 0.5,
0.4522101, -4.31162, -6.777808, 0, 1.5, 0.5, 0.5
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
-3.829629, -0.2099627, -6.777808, 0, -0.5, 0.5, 0.5,
-3.829629, -0.2099627, -6.777808, 1, -0.5, 0.5, 0.5,
-3.829629, -0.2099627, -6.777808, 1, 1.5, 0.5, 0.5,
-3.829629, -0.2099627, -6.777808, 0, 1.5, 0.5, 0.5
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
-3.829629, -4.31162, -0.05201507, 0, -0.5, 0.5, 0.5,
-3.829629, -4.31162, -0.05201507, 1, -0.5, 0.5, 0.5,
-3.829629, -4.31162, -0.05201507, 1, 1.5, 0.5, 0.5,
-3.829629, -4.31162, -0.05201507, 0, 1.5, 0.5, 0.5
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
-2, -3.365083, -5.225702,
3, -3.365083, -5.225702,
-2, -3.365083, -5.225702,
-2, -3.52284, -5.484386,
-1, -3.365083, -5.225702,
-1, -3.52284, -5.484386,
0, -3.365083, -5.225702,
0, -3.52284, -5.484386,
1, -3.365083, -5.225702,
1, -3.52284, -5.484386,
2, -3.365083, -5.225702,
2, -3.52284, -5.484386,
3, -3.365083, -5.225702,
3, -3.52284, -5.484386
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
-2, -3.838351, -6.001755, 0, -0.5, 0.5, 0.5,
-2, -3.838351, -6.001755, 1, -0.5, 0.5, 0.5,
-2, -3.838351, -6.001755, 1, 1.5, 0.5, 0.5,
-2, -3.838351, -6.001755, 0, 1.5, 0.5, 0.5,
-1, -3.838351, -6.001755, 0, -0.5, 0.5, 0.5,
-1, -3.838351, -6.001755, 1, -0.5, 0.5, 0.5,
-1, -3.838351, -6.001755, 1, 1.5, 0.5, 0.5,
-1, -3.838351, -6.001755, 0, 1.5, 0.5, 0.5,
0, -3.838351, -6.001755, 0, -0.5, 0.5, 0.5,
0, -3.838351, -6.001755, 1, -0.5, 0.5, 0.5,
0, -3.838351, -6.001755, 1, 1.5, 0.5, 0.5,
0, -3.838351, -6.001755, 0, 1.5, 0.5, 0.5,
1, -3.838351, -6.001755, 0, -0.5, 0.5, 0.5,
1, -3.838351, -6.001755, 1, -0.5, 0.5, 0.5,
1, -3.838351, -6.001755, 1, 1.5, 0.5, 0.5,
1, -3.838351, -6.001755, 0, 1.5, 0.5, 0.5,
2, -3.838351, -6.001755, 0, -0.5, 0.5, 0.5,
2, -3.838351, -6.001755, 1, -0.5, 0.5, 0.5,
2, -3.838351, -6.001755, 1, 1.5, 0.5, 0.5,
2, -3.838351, -6.001755, 0, 1.5, 0.5, 0.5,
3, -3.838351, -6.001755, 0, -0.5, 0.5, 0.5,
3, -3.838351, -6.001755, 1, -0.5, 0.5, 0.5,
3, -3.838351, -6.001755, 1, 1.5, 0.5, 0.5,
3, -3.838351, -6.001755, 0, 1.5, 0.5, 0.5
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
-2.841512, -3, -5.225702,
-2.841512, 2, -5.225702,
-2.841512, -3, -5.225702,
-3.006199, -3, -5.484386,
-2.841512, -2, -5.225702,
-3.006199, -2, -5.484386,
-2.841512, -1, -5.225702,
-3.006199, -1, -5.484386,
-2.841512, 0, -5.225702,
-3.006199, 0, -5.484386,
-2.841512, 1, -5.225702,
-3.006199, 1, -5.484386,
-2.841512, 2, -5.225702,
-3.006199, 2, -5.484386
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
-3.335571, -3, -6.001755, 0, -0.5, 0.5, 0.5,
-3.335571, -3, -6.001755, 1, -0.5, 0.5, 0.5,
-3.335571, -3, -6.001755, 1, 1.5, 0.5, 0.5,
-3.335571, -3, -6.001755, 0, 1.5, 0.5, 0.5,
-3.335571, -2, -6.001755, 0, -0.5, 0.5, 0.5,
-3.335571, -2, -6.001755, 1, -0.5, 0.5, 0.5,
-3.335571, -2, -6.001755, 1, 1.5, 0.5, 0.5,
-3.335571, -2, -6.001755, 0, 1.5, 0.5, 0.5,
-3.335571, -1, -6.001755, 0, -0.5, 0.5, 0.5,
-3.335571, -1, -6.001755, 1, -0.5, 0.5, 0.5,
-3.335571, -1, -6.001755, 1, 1.5, 0.5, 0.5,
-3.335571, -1, -6.001755, 0, 1.5, 0.5, 0.5,
-3.335571, 0, -6.001755, 0, -0.5, 0.5, 0.5,
-3.335571, 0, -6.001755, 1, -0.5, 0.5, 0.5,
-3.335571, 0, -6.001755, 1, 1.5, 0.5, 0.5,
-3.335571, 0, -6.001755, 0, 1.5, 0.5, 0.5,
-3.335571, 1, -6.001755, 0, -0.5, 0.5, 0.5,
-3.335571, 1, -6.001755, 1, -0.5, 0.5, 0.5,
-3.335571, 1, -6.001755, 1, 1.5, 0.5, 0.5,
-3.335571, 1, -6.001755, 0, 1.5, 0.5, 0.5,
-3.335571, 2, -6.001755, 0, -0.5, 0.5, 0.5,
-3.335571, 2, -6.001755, 1, -0.5, 0.5, 0.5,
-3.335571, 2, -6.001755, 1, 1.5, 0.5, 0.5,
-3.335571, 2, -6.001755, 0, 1.5, 0.5, 0.5
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
-2.841512, -3.365083, -4,
-2.841512, -3.365083, 4,
-2.841512, -3.365083, -4,
-3.006199, -3.52284, -4,
-2.841512, -3.365083, -2,
-3.006199, -3.52284, -2,
-2.841512, -3.365083, 0,
-3.006199, -3.52284, 0,
-2.841512, -3.365083, 2,
-3.006199, -3.52284, 2,
-2.841512, -3.365083, 4,
-3.006199, -3.52284, 4
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
-3.335571, -3.838351, -4, 0, -0.5, 0.5, 0.5,
-3.335571, -3.838351, -4, 1, -0.5, 0.5, 0.5,
-3.335571, -3.838351, -4, 1, 1.5, 0.5, 0.5,
-3.335571, -3.838351, -4, 0, 1.5, 0.5, 0.5,
-3.335571, -3.838351, -2, 0, -0.5, 0.5, 0.5,
-3.335571, -3.838351, -2, 1, -0.5, 0.5, 0.5,
-3.335571, -3.838351, -2, 1, 1.5, 0.5, 0.5,
-3.335571, -3.838351, -2, 0, 1.5, 0.5, 0.5,
-3.335571, -3.838351, 0, 0, -0.5, 0.5, 0.5,
-3.335571, -3.838351, 0, 1, -0.5, 0.5, 0.5,
-3.335571, -3.838351, 0, 1, 1.5, 0.5, 0.5,
-3.335571, -3.838351, 0, 0, 1.5, 0.5, 0.5,
-3.335571, -3.838351, 2, 0, -0.5, 0.5, 0.5,
-3.335571, -3.838351, 2, 1, -0.5, 0.5, 0.5,
-3.335571, -3.838351, 2, 1, 1.5, 0.5, 0.5,
-3.335571, -3.838351, 2, 0, 1.5, 0.5, 0.5,
-3.335571, -3.838351, 4, 0, -0.5, 0.5, 0.5,
-3.335571, -3.838351, 4, 1, -0.5, 0.5, 0.5,
-3.335571, -3.838351, 4, 1, 1.5, 0.5, 0.5,
-3.335571, -3.838351, 4, 0, 1.5, 0.5, 0.5
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
-2.841512, -3.365083, -5.225702,
-2.841512, 2.945158, -5.225702,
-2.841512, -3.365083, 5.121672,
-2.841512, 2.945158, 5.121672,
-2.841512, -3.365083, -5.225702,
-2.841512, -3.365083, 5.121672,
-2.841512, 2.945158, -5.225702,
-2.841512, 2.945158, 5.121672,
-2.841512, -3.365083, -5.225702,
3.745933, -3.365083, -5.225702,
-2.841512, -3.365083, 5.121672,
3.745933, -3.365083, 5.121672,
-2.841512, 2.945158, -5.225702,
3.745933, 2.945158, -5.225702,
-2.841512, 2.945158, 5.121672,
3.745933, 2.945158, 5.121672,
3.745933, -3.365083, -5.225702,
3.745933, 2.945158, -5.225702,
3.745933, -3.365083, 5.121672,
3.745933, 2.945158, 5.121672,
3.745933, -3.365083, -5.225702,
3.745933, -3.365083, 5.121672,
3.745933, 2.945158, -5.225702,
3.745933, 2.945158, 5.121672
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
var radius = 7.365869;
var distance = 32.77158;
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
mvMatrix.translate( -0.4522101, 0.2099627, 0.05201507 );
mvMatrix.scale( 1.208985, 1.262095, 0.7696757 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.77158);
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
chlozolinate<-read.table("chlozolinate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-chlozolinate$V2
```

```
## Error in eval(expr, envir, enclos): object 'chlozolinate' not found
```

```r
y<-chlozolinate$V3
```

```
## Error in eval(expr, envir, enclos): object 'chlozolinate' not found
```

```r
z<-chlozolinate$V4
```

```
## Error in eval(expr, envir, enclos): object 'chlozolinate' not found
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
-2.745579, 1.510137, -1.005372, 0, 0, 1, 1, 1,
-2.666117, -0.4586366, -1.107946, 1, 0, 0, 1, 1,
-2.640676, -0.7465964, -2.897577, 1, 0, 0, 1, 1,
-2.587517, -0.06170363, -3.288054, 1, 0, 0, 1, 1,
-2.572361, -0.08318656, -3.033933, 1, 0, 0, 1, 1,
-2.535924, 1.553988, -1.007017, 1, 0, 0, 1, 1,
-2.424419, -0.6392181, -2.119532, 0, 0, 0, 1, 1,
-2.416522, 1.316159, -3.037145, 0, 0, 0, 1, 1,
-2.385312, -0.5356609, -0.8200743, 0, 0, 0, 1, 1,
-2.302431, 1.088593, -0.4693077, 0, 0, 0, 1, 1,
-2.272589, 0.09275593, 1.208684, 0, 0, 0, 1, 1,
-2.237668, 1.454741, -0.7723811, 0, 0, 0, 1, 1,
-2.213201, -2.007986, -2.64837, 0, 0, 0, 1, 1,
-2.20676, -0.2391415, -2.860891, 1, 1, 1, 1, 1,
-2.18077, 0.5312062, -0.9181101, 1, 1, 1, 1, 1,
-2.150088, 1.264598, 2.93499, 1, 1, 1, 1, 1,
-2.139471, -0.653723, -2.598297, 1, 1, 1, 1, 1,
-2.10107, 2.145431, -2.372257, 1, 1, 1, 1, 1,
-2.093681, 0.9053764, -1.711677, 1, 1, 1, 1, 1,
-2.088356, 0.1336511, -2.347317, 1, 1, 1, 1, 1,
-2.086453, -0.8072794, -1.274507, 1, 1, 1, 1, 1,
-2.073918, 0.4516435, -2.702405, 1, 1, 1, 1, 1,
-2.051363, -0.9983967, -3.063442, 1, 1, 1, 1, 1,
-2.038277, 1.664135, 0.3238997, 1, 1, 1, 1, 1,
-2.018772, 1.063422, -1.46184, 1, 1, 1, 1, 1,
-2.011688, -0.2266268, -1.934455, 1, 1, 1, 1, 1,
-2.010163, 0.2048021, -1.883076, 1, 1, 1, 1, 1,
-2.002651, -0.2697431, -0.8237589, 1, 1, 1, 1, 1,
-1.967761, -0.09517767, -2.237884, 0, 0, 1, 1, 1,
-1.965137, -0.2613219, -2.678573, 1, 0, 0, 1, 1,
-1.963215, -1.075935, -2.421918, 1, 0, 0, 1, 1,
-1.935338, -0.4272913, -0.1199891, 1, 0, 0, 1, 1,
-1.928047, 0.08571559, -1.412432, 1, 0, 0, 1, 1,
-1.911856, 1.003255, -1.825003, 1, 0, 0, 1, 1,
-1.89522, 0.1764736, -0.9579095, 0, 0, 0, 1, 1,
-1.873532, -0.7796951, -1.37342, 0, 0, 0, 1, 1,
-1.867604, 1.019583, -0.4045987, 0, 0, 0, 1, 1,
-1.856612, -0.03678921, -0.7112882, 0, 0, 0, 1, 1,
-1.840301, 1.584683, -0.03025916, 0, 0, 0, 1, 1,
-1.839671, 1.314639, -0.8178953, 0, 0, 0, 1, 1,
-1.815138, -0.9010009, -2.174342, 0, 0, 0, 1, 1,
-1.797581, -0.3137616, -2.656456, 1, 1, 1, 1, 1,
-1.774431, 0.6127105, -0.3000269, 1, 1, 1, 1, 1,
-1.76958, -0.5933494, -2.605524, 1, 1, 1, 1, 1,
-1.752005, -1.492967, -1.074612, 1, 1, 1, 1, 1,
-1.74929, -0.7965553, -2.52373, 1, 1, 1, 1, 1,
-1.747675, -1.75838, -4.581354, 1, 1, 1, 1, 1,
-1.731718, 0.640875, -1.571319, 1, 1, 1, 1, 1,
-1.720211, -0.2926966, -2.233732, 1, 1, 1, 1, 1,
-1.716254, 2.527317, -1.484993, 1, 1, 1, 1, 1,
-1.713067, 0.8052667, -1.694027, 1, 1, 1, 1, 1,
-1.711309, -0.04787015, -0.4071656, 1, 1, 1, 1, 1,
-1.704216, 1.033007, -0.8231984, 1, 1, 1, 1, 1,
-1.703951, 1.669776, -1.284839, 1, 1, 1, 1, 1,
-1.687048, 0.2528566, -2.331403, 1, 1, 1, 1, 1,
-1.685016, -1.005048, -1.246204, 1, 1, 1, 1, 1,
-1.676872, -0.6591045, -0.809712, 0, 0, 1, 1, 1,
-1.669355, 1.000099, -1.215205, 1, 0, 0, 1, 1,
-1.651947, -0.4151261, -2.120835, 1, 0, 0, 1, 1,
-1.651649, -0.3238343, -2.144525, 1, 0, 0, 1, 1,
-1.64985, -0.2630263, -2.274023, 1, 0, 0, 1, 1,
-1.625284, -0.2138675, -2.266347, 1, 0, 0, 1, 1,
-1.619052, -0.5609313, -2.539162, 0, 0, 0, 1, 1,
-1.599339, 0.6309243, -0.4089375, 0, 0, 0, 1, 1,
-1.597984, -0.5240686, -2.104474, 0, 0, 0, 1, 1,
-1.59509, 1.196689, 0.07185586, 0, 0, 0, 1, 1,
-1.589581, -2.433845, -1.332146, 0, 0, 0, 1, 1,
-1.562465, 1.133947, 0.7641578, 0, 0, 0, 1, 1,
-1.553194, 0.7285463, -1.73241, 0, 0, 0, 1, 1,
-1.550693, 0.1305013, -1.969162, 1, 1, 1, 1, 1,
-1.542263, 0.2876203, -1.695857, 1, 1, 1, 1, 1,
-1.539535, 0.2232798, -1.07495, 1, 1, 1, 1, 1,
-1.532716, -0.3751948, -3.262208, 1, 1, 1, 1, 1,
-1.532452, 0.4765288, -2.294073, 1, 1, 1, 1, 1,
-1.528971, 0.04672971, -2.130028, 1, 1, 1, 1, 1,
-1.519771, -2.170337, -3.846121, 1, 1, 1, 1, 1,
-1.513036, -0.7745842, -1.469744, 1, 1, 1, 1, 1,
-1.508885, 1.271672, -0.5333049, 1, 1, 1, 1, 1,
-1.507086, -0.5121591, -3.118544, 1, 1, 1, 1, 1,
-1.502459, 0.03170879, -1.647236, 1, 1, 1, 1, 1,
-1.483205, 1.384587, -2.56242, 1, 1, 1, 1, 1,
-1.47791, 0.8833631, 0.005304512, 1, 1, 1, 1, 1,
-1.462955, -1.408319, -2.140128, 1, 1, 1, 1, 1,
-1.461794, 1.282542, -1.268817, 1, 1, 1, 1, 1,
-1.459333, -0.4446012, -2.468253, 0, 0, 1, 1, 1,
-1.453769, -1.196127, -3.835686, 1, 0, 0, 1, 1,
-1.451333, 1.100226, -2.207933, 1, 0, 0, 1, 1,
-1.442309, -0.5819438, -1.809643, 1, 0, 0, 1, 1,
-1.437256, -0.9651741, -0.9989091, 1, 0, 0, 1, 1,
-1.432864, -0.8308054, -0.1819003, 1, 0, 0, 1, 1,
-1.424138, -1.142174, -1.136283, 0, 0, 0, 1, 1,
-1.417411, -1.657707, -3.21103, 0, 0, 0, 1, 1,
-1.402792, 0.3232668, -2.592399, 0, 0, 0, 1, 1,
-1.402273, 1.202468, -1.130734, 0, 0, 0, 1, 1,
-1.399243, -0.1927582, -1.514511, 0, 0, 0, 1, 1,
-1.39499, 0.5327023, -0.1243087, 0, 0, 0, 1, 1,
-1.392177, 1.425172, 0.9257578, 0, 0, 0, 1, 1,
-1.3895, 1.211748, -1.080462, 1, 1, 1, 1, 1,
-1.38413, -0.3893723, -2.019298, 1, 1, 1, 1, 1,
-1.383551, -0.7574488, -2.132259, 1, 1, 1, 1, 1,
-1.382131, -0.512022, -2.109502, 1, 1, 1, 1, 1,
-1.378307, 1.624462, -1.111774, 1, 1, 1, 1, 1,
-1.37587, 0.0916615, -1.721622, 1, 1, 1, 1, 1,
-1.373659, 0.02179523, -2.729035, 1, 1, 1, 1, 1,
-1.366575, -0.6370715, -3.241224, 1, 1, 1, 1, 1,
-1.361268, 1.067135, -0.3111127, 1, 1, 1, 1, 1,
-1.35059, -0.7816875, -2.701293, 1, 1, 1, 1, 1,
-1.338083, 0.3183825, 2.179591, 1, 1, 1, 1, 1,
-1.338014, -1.190605, -2.267909, 1, 1, 1, 1, 1,
-1.332106, -1.693635, -2.051605, 1, 1, 1, 1, 1,
-1.314366, 1.615315, 0.3113261, 1, 1, 1, 1, 1,
-1.312113, 0.6336644, -1.298571, 1, 1, 1, 1, 1,
-1.310822, 1.036954, 0.2028664, 0, 0, 1, 1, 1,
-1.310206, -0.5225629, -2.430471, 1, 0, 0, 1, 1,
-1.306533, -0.07197828, -0.3050406, 1, 0, 0, 1, 1,
-1.302735, 1.161989, 0.02901994, 1, 0, 0, 1, 1,
-1.289087, 1.227789, -1.169742, 1, 0, 0, 1, 1,
-1.275524, 1.015135, -1.142835, 1, 0, 0, 1, 1,
-1.26491, 1.186408, -1.907316, 0, 0, 0, 1, 1,
-1.255073, -0.1927713, -2.10256, 0, 0, 0, 1, 1,
-1.255014, 0.2104219, -1.27017, 0, 0, 0, 1, 1,
-1.251164, 0.8584001, -0.5924917, 0, 0, 0, 1, 1,
-1.247839, -0.05244312, -0.7374458, 0, 0, 0, 1, 1,
-1.243937, 1.428351, 1.059827, 0, 0, 0, 1, 1,
-1.240076, -0.7300733, 0.4115709, 0, 0, 0, 1, 1,
-1.236752, -2.033914, -2.343643, 1, 1, 1, 1, 1,
-1.229595, 1.155095, -0.01397793, 1, 1, 1, 1, 1,
-1.229411, 0.1763328, -1.172821, 1, 1, 1, 1, 1,
-1.218051, 2.355629, 1.13047, 1, 1, 1, 1, 1,
-1.210747, 0.6657102, -0.8333265, 1, 1, 1, 1, 1,
-1.206964, -0.1317188, -0.4274684, 1, 1, 1, 1, 1,
-1.202358, 2.05705, -1.140072, 1, 1, 1, 1, 1,
-1.201614, 0.1442148, -2.376638, 1, 1, 1, 1, 1,
-1.2013, -0.228425, -0.547748, 1, 1, 1, 1, 1,
-1.196157, 1.05722, 0.07343398, 1, 1, 1, 1, 1,
-1.194068, 0.05486538, 0.09396082, 1, 1, 1, 1, 1,
-1.193044, 0.6081562, -0.9473766, 1, 1, 1, 1, 1,
-1.192002, 0.3105968, -0.6702062, 1, 1, 1, 1, 1,
-1.183269, -1.163247, -3.563784, 1, 1, 1, 1, 1,
-1.181733, 1.076583, -2.866714, 1, 1, 1, 1, 1,
-1.178733, -1.033543, -2.684706, 0, 0, 1, 1, 1,
-1.17397, 0.09063428, -2.254325, 1, 0, 0, 1, 1,
-1.17274, 1.066686, -1.038702, 1, 0, 0, 1, 1,
-1.169401, 0.005793918, -1.318595, 1, 0, 0, 1, 1,
-1.145492, -1.228168, -1.456129, 1, 0, 0, 1, 1,
-1.13836, 1.204962, -3.373673, 1, 0, 0, 1, 1,
-1.132701, -0.09154063, -1.798659, 0, 0, 0, 1, 1,
-1.12333, -1.134711, -2.278442, 0, 0, 0, 1, 1,
-1.118953, 0.9578449, -1.650159, 0, 0, 0, 1, 1,
-1.116319, 1.713671, -1.450146, 0, 0, 0, 1, 1,
-1.111195, -0.02335274, -2.705628, 0, 0, 0, 1, 1,
-1.10733, 0.4741512, 0.9274381, 0, 0, 0, 1, 1,
-1.106639, -1.458613, -2.713006, 0, 0, 0, 1, 1,
-1.102488, -0.2521777, -1.532371, 1, 1, 1, 1, 1,
-1.100535, 0.9683572, -0.103187, 1, 1, 1, 1, 1,
-1.099802, 1.153286, -1.114073, 1, 1, 1, 1, 1,
-1.087511, -0.002869601, -1.573851, 1, 1, 1, 1, 1,
-1.085809, -0.05837341, -1.689313, 1, 1, 1, 1, 1,
-1.082727, 1.108179, -0.6396718, 1, 1, 1, 1, 1,
-1.082159, 0.9210107, -0.6048348, 1, 1, 1, 1, 1,
-1.077493, -0.6028945, -0.7001034, 1, 1, 1, 1, 1,
-1.076408, 0.4605044, -0.5347353, 1, 1, 1, 1, 1,
-1.076118, -1.747713, -3.949775, 1, 1, 1, 1, 1,
-1.073362, 0.3634685, -0.6653682, 1, 1, 1, 1, 1,
-1.064595, -0.2545582, -1.261471, 1, 1, 1, 1, 1,
-1.063216, -1.45678, -1.712507, 1, 1, 1, 1, 1,
-1.054646, -1.025082, -3.62683, 1, 1, 1, 1, 1,
-1.045399, 0.3917162, -0.6689128, 1, 1, 1, 1, 1,
-1.038071, 1.46997, -0.1583515, 0, 0, 1, 1, 1,
-1.032683, -0.2574914, -0.5647349, 1, 0, 0, 1, 1,
-1.030497, -0.04518775, -2.062181, 1, 0, 0, 1, 1,
-1.024728, -0.9349062, -5.075012, 1, 0, 0, 1, 1,
-1.023367, -0.8737179, -2.262888, 1, 0, 0, 1, 1,
-1.021321, 0.8958057, -1.809183, 1, 0, 0, 1, 1,
-1.019063, -0.1040855, -1.266966, 0, 0, 0, 1, 1,
-1.014644, -0.6074262, -1.800866, 0, 0, 0, 1, 1,
-1.000384, 2.004089, -0.2260542, 0, 0, 0, 1, 1,
-1.000309, 0.2314799, -0.3447577, 0, 0, 0, 1, 1,
-0.997558, -0.2446118, -1.091192, 0, 0, 0, 1, 1,
-0.9957139, -0.1192871, -1.585533, 0, 0, 0, 1, 1,
-0.9866992, -1.002931, -2.282339, 0, 0, 0, 1, 1,
-0.9796808, 0.119939, -1.837939, 1, 1, 1, 1, 1,
-0.9775496, -0.1026586, -0.9383722, 1, 1, 1, 1, 1,
-0.9773365, 0.5988432, 1.517402, 1, 1, 1, 1, 1,
-0.9708593, 0.4175645, -2.91848, 1, 1, 1, 1, 1,
-0.9666489, 0.6598086, -1.768604, 1, 1, 1, 1, 1,
-0.9631469, -0.08476408, -2.289827, 1, 1, 1, 1, 1,
-0.962767, -0.5265121, -0.8530021, 1, 1, 1, 1, 1,
-0.9552629, 0.8689372, -0.9533017, 1, 1, 1, 1, 1,
-0.9542133, 0.7941197, -2.203106, 1, 1, 1, 1, 1,
-0.9527057, 0.03223687, -2.945132, 1, 1, 1, 1, 1,
-0.9468218, 1.004111, -1.838115, 1, 1, 1, 1, 1,
-0.9465651, -0.1647638, -0.9081149, 1, 1, 1, 1, 1,
-0.9325052, -0.01766936, -0.4394255, 1, 1, 1, 1, 1,
-0.9291784, -0.08439057, -3.192955, 1, 1, 1, 1, 1,
-0.9283218, -0.6822153, -2.007744, 1, 1, 1, 1, 1,
-0.9246835, 1.459988, -1.411206, 0, 0, 1, 1, 1,
-0.9154813, -0.6428773, -1.683016, 1, 0, 0, 1, 1,
-0.913508, -0.1646992, -1.685992, 1, 0, 0, 1, 1,
-0.9082004, 0.6335249, -2.563533, 1, 0, 0, 1, 1,
-0.9069064, -0.4211064, -2.001525, 1, 0, 0, 1, 1,
-0.9058958, -0.4135924, -2.565917, 1, 0, 0, 1, 1,
-0.8967557, -0.7609768, -2.199903, 0, 0, 0, 1, 1,
-0.8932378, 0.05041502, -1.135493, 0, 0, 0, 1, 1,
-0.89144, -0.1102935, -0.2159695, 0, 0, 0, 1, 1,
-0.8890147, 2.176697, 0.01510533, 0, 0, 0, 1, 1,
-0.8889304, -0.05870288, -1.335933, 0, 0, 0, 1, 1,
-0.8815221, -0.9633372, -2.507003, 0, 0, 0, 1, 1,
-0.8798684, -0.6755782, -3.638174, 0, 0, 0, 1, 1,
-0.8740413, 1.296651, -3.101583, 1, 1, 1, 1, 1,
-0.8729518, 1.867181, 0.2734509, 1, 1, 1, 1, 1,
-0.8701065, 1.166, -0.9653906, 1, 1, 1, 1, 1,
-0.8665237, -1.389717, -0.8435618, 1, 1, 1, 1, 1,
-0.8603776, 0.8840031, -1.441831, 1, 1, 1, 1, 1,
-0.8455821, 1.020924, -0.206875, 1, 1, 1, 1, 1,
-0.8413463, -0.103125, -0.6994103, 1, 1, 1, 1, 1,
-0.836338, -0.5787576, -1.224875, 1, 1, 1, 1, 1,
-0.8306711, 0.8694416, -1.350016, 1, 1, 1, 1, 1,
-0.8272812, -0.7735995, -1.468721, 1, 1, 1, 1, 1,
-0.8227776, -0.05065328, -3.036422, 1, 1, 1, 1, 1,
-0.8211048, -0.4818211, -0.452699, 1, 1, 1, 1, 1,
-0.8187778, 0.7698522, -0.299219, 1, 1, 1, 1, 1,
-0.8099245, 0.4398361, -2.667729, 1, 1, 1, 1, 1,
-0.8086666, 0.7783565, 0.7766004, 1, 1, 1, 1, 1,
-0.8062225, -0.05719821, -2.516099, 0, 0, 1, 1, 1,
-0.8050919, 0.7324682, -1.996029, 1, 0, 0, 1, 1,
-0.8048865, 0.2287174, -1.650175, 1, 0, 0, 1, 1,
-0.7956964, 0.9234674, -1.392465, 1, 0, 0, 1, 1,
-0.7916639, 1.043925, 1.979024, 1, 0, 0, 1, 1,
-0.7914379, -0.3114432, -2.005655, 1, 0, 0, 1, 1,
-0.7899642, -0.7756289, -3.994799, 0, 0, 0, 1, 1,
-0.7889282, -0.5989374, -1.327792, 0, 0, 0, 1, 1,
-0.7799338, -0.6143265, -2.773838, 0, 0, 0, 1, 1,
-0.7706824, -1.848412, -1.790369, 0, 0, 0, 1, 1,
-0.7700145, 0.3850969, -0.5910966, 0, 0, 0, 1, 1,
-0.7661037, 0.3192499, -2.648074, 0, 0, 0, 1, 1,
-0.7636029, -0.3689088, -0.7245368, 0, 0, 0, 1, 1,
-0.7627864, -0.4614843, -1.710044, 1, 1, 1, 1, 1,
-0.7625796, -0.3217444, -2.538675, 1, 1, 1, 1, 1,
-0.7479869, 0.524699, -0.5995529, 1, 1, 1, 1, 1,
-0.7473094, -0.4336375, -1.842841, 1, 1, 1, 1, 1,
-0.7431537, -1.757375, -3.342576, 1, 1, 1, 1, 1,
-0.7420801, -0.1994573, -1.881987, 1, 1, 1, 1, 1,
-0.7401114, 1.139306, -0.02082996, 1, 1, 1, 1, 1,
-0.7356912, 0.973589, -1.80012, 1, 1, 1, 1, 1,
-0.7305764, -0.4814896, -2.075001, 1, 1, 1, 1, 1,
-0.7252761, -0.5219383, -1.015809, 1, 1, 1, 1, 1,
-0.722458, 0.2529432, -0.7883219, 1, 1, 1, 1, 1,
-0.704457, 1.318575, -2.7752, 1, 1, 1, 1, 1,
-0.7025784, -2.573264, -2.168607, 1, 1, 1, 1, 1,
-0.6988694, -0.4444582, -1.877831, 1, 1, 1, 1, 1,
-0.6962751, -0.3878661, -2.986394, 1, 1, 1, 1, 1,
-0.6930746, -1.376968, -2.360976, 0, 0, 1, 1, 1,
-0.6898413, -0.5708343, -2.022721, 1, 0, 0, 1, 1,
-0.6821688, -0.2901883, -1.155719, 1, 0, 0, 1, 1,
-0.6731936, 0.9136029, -1.035663, 1, 0, 0, 1, 1,
-0.6692118, 0.05566807, -1.792793, 1, 0, 0, 1, 1,
-0.6647284, -1.857253, -2.325095, 1, 0, 0, 1, 1,
-0.6585943, 0.1274746, -1.386273, 0, 0, 0, 1, 1,
-0.6566171, 2.853261, -0.04479824, 0, 0, 0, 1, 1,
-0.6540667, 1.332498, 0.8798475, 0, 0, 0, 1, 1,
-0.6531482, -0.7437067, -2.940393, 0, 0, 0, 1, 1,
-0.6454993, 0.5718551, -2.458521, 0, 0, 0, 1, 1,
-0.6411748, -0.1993033, -1.93396, 0, 0, 0, 1, 1,
-0.6399587, 0.1285743, -1.085288, 0, 0, 0, 1, 1,
-0.6361299, 0.4947849, -0.343399, 1, 1, 1, 1, 1,
-0.6341609, 0.7833816, -0.6212159, 1, 1, 1, 1, 1,
-0.6341179, -1.9055, -1.579348, 1, 1, 1, 1, 1,
-0.630488, -0.5120721, -1.491942, 1, 1, 1, 1, 1,
-0.6278524, -1.191246, -2.660282, 1, 1, 1, 1, 1,
-0.6253591, -1.538594, -3.217924, 1, 1, 1, 1, 1,
-0.6250892, 0.9586467, -1.41056, 1, 1, 1, 1, 1,
-0.6247244, -0.8383886, -2.018333, 1, 1, 1, 1, 1,
-0.6219834, 1.955331, 0.02114311, 1, 1, 1, 1, 1,
-0.6208564, 1.660902, 1.786172, 1, 1, 1, 1, 1,
-0.6191381, -0.3332357, -2.414423, 1, 1, 1, 1, 1,
-0.6178249, -0.06275553, -1.703871, 1, 1, 1, 1, 1,
-0.6120936, 0.3164571, -0.9730198, 1, 1, 1, 1, 1,
-0.6111399, 0.6348855, -1.2289, 1, 1, 1, 1, 1,
-0.6048138, 1.60435, 0.6385863, 1, 1, 1, 1, 1,
-0.6034544, -0.4335345, -3.039023, 0, 0, 1, 1, 1,
-0.6030546, 0.1778951, -2.230079, 1, 0, 0, 1, 1,
-0.6022686, 0.08131587, -2.038168, 1, 0, 0, 1, 1,
-0.5873775, 0.9632866, -1.479434, 1, 0, 0, 1, 1,
-0.5848938, 0.5007238, 0.1492236, 1, 0, 0, 1, 1,
-0.5844733, 0.02240342, -1.074837, 1, 0, 0, 1, 1,
-0.5828606, 1.515796, 0.8865191, 0, 0, 0, 1, 1,
-0.5823036, 0.6757548, -0.8212315, 0, 0, 0, 1, 1,
-0.5767229, -0.2070387, -2.924317, 0, 0, 0, 1, 1,
-0.5754313, -0.00556895, -1.911847, 0, 0, 0, 1, 1,
-0.5685593, -1.031661, -4.135634, 0, 0, 0, 1, 1,
-0.5648013, 0.7694589, -2.047468, 0, 0, 0, 1, 1,
-0.5601225, 0.8594711, -1.907328, 0, 0, 0, 1, 1,
-0.559429, -0.2430135, -3.321281, 1, 1, 1, 1, 1,
-0.5567421, 1.592286, -0.9586966, 1, 1, 1, 1, 1,
-0.5530521, -0.6963543, -1.845683, 1, 1, 1, 1, 1,
-0.5506857, -0.172859, -1.195882, 1, 1, 1, 1, 1,
-0.5499766, 0.5855354, 1.088709, 1, 1, 1, 1, 1,
-0.549484, -1.638356, -2.666654, 1, 1, 1, 1, 1,
-0.54831, 0.5500293, -0.6673344, 1, 1, 1, 1, 1,
-0.5459328, -0.5750847, -1.941262, 1, 1, 1, 1, 1,
-0.5360955, 0.1333374, -2.155717, 1, 1, 1, 1, 1,
-0.5360554, 0.05762384, -2.53711, 1, 1, 1, 1, 1,
-0.5335094, -0.6202526, -3.372036, 1, 1, 1, 1, 1,
-0.5238386, 1.293694, -0.04594653, 1, 1, 1, 1, 1,
-0.5209007, 0.3400947, -0.1888383, 1, 1, 1, 1, 1,
-0.5094345, 0.05110892, -2.61654, 1, 1, 1, 1, 1,
-0.5093845, -1.014272, -1.40495, 1, 1, 1, 1, 1,
-0.5082875, -0.6607417, -2.108743, 0, 0, 1, 1, 1,
-0.5055337, -0.403908, -2.717579, 1, 0, 0, 1, 1,
-0.5020678, 0.3242882, 0.3922111, 1, 0, 0, 1, 1,
-0.4885959, -0.6317227, -2.924946, 1, 0, 0, 1, 1,
-0.4873267, -0.346193, -0.9303522, 1, 0, 0, 1, 1,
-0.4860919, 0.01526754, -1.399737, 1, 0, 0, 1, 1,
-0.4827965, 1.604391, -0.09526797, 0, 0, 0, 1, 1,
-0.4812474, -0.869291, -3.449233, 0, 0, 0, 1, 1,
-0.4801763, 1.052536, 1.198125, 0, 0, 0, 1, 1,
-0.4796284, -0.8610715, 1.496612, 0, 0, 0, 1, 1,
-0.4773206, 0.3074735, -2.30645, 0, 0, 0, 1, 1,
-0.4759505, 0.322722, -1.903207, 0, 0, 0, 1, 1,
-0.4746328, -0.09750328, -1.416324, 0, 0, 0, 1, 1,
-0.4712223, -0.1065492, -2.041137, 1, 1, 1, 1, 1,
-0.4679281, -1.130289, -2.072039, 1, 1, 1, 1, 1,
-0.4627259, -0.978587, -3.100476, 1, 1, 1, 1, 1,
-0.4624821, 0.3932731, 1.057518, 1, 1, 1, 1, 1,
-0.4616743, 0.1727157, -0.409257, 1, 1, 1, 1, 1,
-0.4609762, 0.7469112, 1.13201, 1, 1, 1, 1, 1,
-0.4604882, -0.901807, -2.611343, 1, 1, 1, 1, 1,
-0.4588328, 0.2686533, -1.168761, 1, 1, 1, 1, 1,
-0.456891, -0.01084132, -2.691299, 1, 1, 1, 1, 1,
-0.4538535, 0.4870129, 0.3453785, 1, 1, 1, 1, 1,
-0.4523899, 0.06963023, -0.7461631, 1, 1, 1, 1, 1,
-0.4515992, 0.8498982, 1.323312, 1, 1, 1, 1, 1,
-0.4507145, -1.247236, -2.021176, 1, 1, 1, 1, 1,
-0.4486962, -2.102037, -3.082664, 1, 1, 1, 1, 1,
-0.4468671, -1.199885, -3.158032, 1, 1, 1, 1, 1,
-0.4462314, -1.535105, -2.354592, 0, 0, 1, 1, 1,
-0.4435076, -0.8774656, -1.659774, 1, 0, 0, 1, 1,
-0.439508, 0.2935897, -2.284026, 1, 0, 0, 1, 1,
-0.439265, 0.1937882, 0.03176788, 1, 0, 0, 1, 1,
-0.4380317, 0.8264015, 0.05439801, 1, 0, 0, 1, 1,
-0.4363817, 2.26612, -1.119749, 1, 0, 0, 1, 1,
-0.4357104, -0.6677923, -2.807449, 0, 0, 0, 1, 1,
-0.4356911, 0.1776702, 0.4554763, 0, 0, 0, 1, 1,
-0.4321095, 0.1501184, -2.133134, 0, 0, 0, 1, 1,
-0.4308585, 0.1827589, 0.4613427, 0, 0, 0, 1, 1,
-0.4255023, -2.385038, -1.953131, 0, 0, 0, 1, 1,
-0.4211518, 0.01331078, -3.912151, 0, 0, 0, 1, 1,
-0.4034882, -0.9576192, -2.663465, 0, 0, 0, 1, 1,
-0.3942089, 1.487758, -1.809998, 1, 1, 1, 1, 1,
-0.3918881, -0.06713282, -1.513956, 1, 1, 1, 1, 1,
-0.385209, -0.04547666, -1.991678, 1, 1, 1, 1, 1,
-0.3851224, -0.1425776, -2.958896, 1, 1, 1, 1, 1,
-0.3835421, 0.710037, 0.1815782, 1, 1, 1, 1, 1,
-0.381306, 1.482648, 1.203214, 1, 1, 1, 1, 1,
-0.3810707, -1.388942, -2.460005, 1, 1, 1, 1, 1,
-0.376453, -1.084391, -4.182243, 1, 1, 1, 1, 1,
-0.375065, -0.1772701, -2.677501, 1, 1, 1, 1, 1,
-0.3734934, 0.6591052, -1.832638, 1, 1, 1, 1, 1,
-0.3698635, -1.355172, -3.331898, 1, 1, 1, 1, 1,
-0.3696459, -2.274613, -2.911833, 1, 1, 1, 1, 1,
-0.3645613, 1.19575, -0.3305443, 1, 1, 1, 1, 1,
-0.3642757, -1.44689, -3.326305, 1, 1, 1, 1, 1,
-0.3633608, 0.1471379, -1.514785, 1, 1, 1, 1, 1,
-0.3625554, 0.3751224, -0.9935418, 0, 0, 1, 1, 1,
-0.3580499, 0.7560662, -0.6833669, 1, 0, 0, 1, 1,
-0.3574457, -0.2629962, -1.4633, 1, 0, 0, 1, 1,
-0.3545715, -1.198378, -2.187788, 1, 0, 0, 1, 1,
-0.3540571, 0.8206656, 0.6932986, 1, 0, 0, 1, 1,
-0.3512146, 1.083751, -0.6013271, 1, 0, 0, 1, 1,
-0.3506524, 0.9116297, -1.506865, 0, 0, 0, 1, 1,
-0.3503639, -0.5912381, -2.054258, 0, 0, 0, 1, 1,
-0.34792, -1.279772, -2.364882, 0, 0, 0, 1, 1,
-0.3461478, 0.3378688, -1.07312, 0, 0, 0, 1, 1,
-0.3362435, -1.229152, -2.532846, 0, 0, 0, 1, 1,
-0.3324379, 0.9175985, 0.1169931, 0, 0, 0, 1, 1,
-0.3314229, 0.296655, -1.807698, 0, 0, 0, 1, 1,
-0.3298311, -0.927536, -4.283538, 1, 1, 1, 1, 1,
-0.3282289, 0.02380961, -0.6468621, 1, 1, 1, 1, 1,
-0.3279333, 0.5849487, -0.7227856, 1, 1, 1, 1, 1,
-0.3276062, -0.7396885, -2.459895, 1, 1, 1, 1, 1,
-0.326387, 9.111933e-05, -1.225639, 1, 1, 1, 1, 1,
-0.3245235, 0.3216846, -0.4612671, 1, 1, 1, 1, 1,
-0.3205938, 1.107293, -2.218385, 1, 1, 1, 1, 1,
-0.3162552, -0.8349553, -2.436119, 1, 1, 1, 1, 1,
-0.3154533, -2.189861, -3.693574, 1, 1, 1, 1, 1,
-0.31521, 0.06162924, -3.531935, 1, 1, 1, 1, 1,
-0.314403, 1.817036, 0.5311849, 1, 1, 1, 1, 1,
-0.3119466, 1.353088, 0.165399, 1, 1, 1, 1, 1,
-0.309648, 2.035304, -0.01544399, 1, 1, 1, 1, 1,
-0.3048068, 0.665323, -1.543873, 1, 1, 1, 1, 1,
-0.299718, -0.4040472, -1.612653, 1, 1, 1, 1, 1,
-0.2982897, -1.008459, -2.38159, 0, 0, 1, 1, 1,
-0.297888, -0.01460738, -1.390671, 1, 0, 0, 1, 1,
-0.2960902, -0.1864066, -1.995104, 1, 0, 0, 1, 1,
-0.2932109, -0.5178708, -3.171487, 1, 0, 0, 1, 1,
-0.2890462, -0.6439567, -2.676746, 1, 0, 0, 1, 1,
-0.2840964, -1.055427, -3.640131, 1, 0, 0, 1, 1,
-0.2833653, 0.1795426, -1.203756, 0, 0, 0, 1, 1,
-0.2830642, -0.136711, -2.561785, 0, 0, 0, 1, 1,
-0.2805142, -0.269233, -3.454658, 0, 0, 0, 1, 1,
-0.2792631, 0.7533965, -2.429831, 0, 0, 0, 1, 1,
-0.273076, -0.8323601, -1.417792, 0, 0, 0, 1, 1,
-0.2667258, 0.5850807, -0.5035533, 0, 0, 0, 1, 1,
-0.2635688, 0.1821614, -1.325037, 0, 0, 0, 1, 1,
-0.2620709, 0.3651277, -1.650991, 1, 1, 1, 1, 1,
-0.2605956, -0.05787792, -2.281091, 1, 1, 1, 1, 1,
-0.2598374, 0.618341, -0.08119743, 1, 1, 1, 1, 1,
-0.2592635, -0.4085942, -3.233656, 1, 1, 1, 1, 1,
-0.2577365, 0.1565463, -0.9326035, 1, 1, 1, 1, 1,
-0.2575142, 0.2204048, -2.206305, 1, 1, 1, 1, 1,
-0.2574762, -0.2439986, -2.88675, 1, 1, 1, 1, 1,
-0.2545337, -0.6356621, -2.454547, 1, 1, 1, 1, 1,
-0.2407797, -0.0589973, -1.475446, 1, 1, 1, 1, 1,
-0.2395489, 0.9898888, 0.6728612, 1, 1, 1, 1, 1,
-0.2361834, -2.568487, -3.544344, 1, 1, 1, 1, 1,
-0.2354438, -0.4507127, -2.231942, 1, 1, 1, 1, 1,
-0.2332043, -1.030182, -2.744716, 1, 1, 1, 1, 1,
-0.2315746, -0.462406, -1.866458, 1, 1, 1, 1, 1,
-0.229799, -1.028223, -1.574365, 1, 1, 1, 1, 1,
-0.2246844, 1.641718, 1.504599, 0, 0, 1, 1, 1,
-0.2230925, 0.4538792, -0.8213992, 1, 0, 0, 1, 1,
-0.2224685, -0.4247391, -3.750809, 1, 0, 0, 1, 1,
-0.2109127, -0.2017374, -2.21838, 1, 0, 0, 1, 1,
-0.2109091, -2.379599, -3.083101, 1, 0, 0, 1, 1,
-0.2089168, -1.199813, -2.335185, 1, 0, 0, 1, 1,
-0.2087945, -0.664804, -2.148495, 0, 0, 0, 1, 1,
-0.2080836, 0.9201992, -1.780909, 0, 0, 0, 1, 1,
-0.2022473, -0.9292049, -4.496533, 0, 0, 0, 1, 1,
-0.2008047, -0.1591015, -2.264831, 0, 0, 0, 1, 1,
-0.1954674, 0.2291657, -1.073497, 0, 0, 0, 1, 1,
-0.1936587, 0.4281978, -0.8434918, 0, 0, 0, 1, 1,
-0.1894969, 0.2255545, 0.2717026, 0, 0, 0, 1, 1,
-0.1877874, -0.1766483, -2.133591, 1, 1, 1, 1, 1,
-0.1877537, -0.4859321, -2.702642, 1, 1, 1, 1, 1,
-0.1877018, 0.8087895, -1.55656, 1, 1, 1, 1, 1,
-0.1871417, 0.06409312, -1.625398, 1, 1, 1, 1, 1,
-0.1868446, 0.5151029, -1.426221, 1, 1, 1, 1, 1,
-0.1864477, -1.141591, -1.106857, 1, 1, 1, 1, 1,
-0.1821717, 1.204542, -1.275439, 1, 1, 1, 1, 1,
-0.1816789, -0.06440028, -3.153749, 1, 1, 1, 1, 1,
-0.1771469, 1.065405, -1.066759, 1, 1, 1, 1, 1,
-0.1753148, 0.3302469, -0.212777, 1, 1, 1, 1, 1,
-0.1746388, 0.7565207, -0.5063398, 1, 1, 1, 1, 1,
-0.1735893, -0.09490836, -2.090145, 1, 1, 1, 1, 1,
-0.167441, 0.4015338, -0.1367549, 1, 1, 1, 1, 1,
-0.1661995, 0.4898433, -0.6200286, 1, 1, 1, 1, 1,
-0.1618328, 0.2053231, -1.011928, 1, 1, 1, 1, 1,
-0.1602008, 0.2286925, -0.1992236, 0, 0, 1, 1, 1,
-0.1564046, -0.1278028, -2.37412, 1, 0, 0, 1, 1,
-0.1562372, -0.8684638, -3.602914, 1, 0, 0, 1, 1,
-0.1514609, 1.226529, -0.1102476, 1, 0, 0, 1, 1,
-0.1492844, -0.6680353, -3.486307, 1, 0, 0, 1, 1,
-0.1491984, 0.9664466, 0.2201244, 1, 0, 0, 1, 1,
-0.1441906, 1.346895, -0.5262706, 0, 0, 0, 1, 1,
-0.1406482, -1.679082, -4.414638, 0, 0, 0, 1, 1,
-0.1397227, 1.172283, 0.2400061, 0, 0, 0, 1, 1,
-0.1396622, 0.3088497, -0.004035965, 0, 0, 0, 1, 1,
-0.1384728, -0.9635767, -4.028478, 0, 0, 0, 1, 1,
-0.1247859, 0.4170771, -0.2863655, 0, 0, 0, 1, 1,
-0.1233361, 0.4957167, -0.691949, 0, 0, 0, 1, 1,
-0.1231663, -0.7091112, -3.984522, 1, 1, 1, 1, 1,
-0.1198347, 0.5595627, 0.9564967, 1, 1, 1, 1, 1,
-0.119758, -0.6049895, -1.19709, 1, 1, 1, 1, 1,
-0.1170099, 0.8113757, 0.01037126, 1, 1, 1, 1, 1,
-0.1102093, 0.3324143, -1.365354, 1, 1, 1, 1, 1,
-0.1097343, -0.4724071, -2.921308, 1, 1, 1, 1, 1,
-0.1075389, -2.718061, -3.477278, 1, 1, 1, 1, 1,
-0.10514, -0.6935012, -4.214922, 1, 1, 1, 1, 1,
-0.1044584, -0.4781693, -3.35493, 1, 1, 1, 1, 1,
-0.1009711, -1.000551, -3.000844, 1, 1, 1, 1, 1,
-0.09910528, -1.335413, -4.101442, 1, 1, 1, 1, 1,
-0.09869174, 0.6898153, 0.6856734, 1, 1, 1, 1, 1,
-0.09065701, 1.543718, 0.2874232, 1, 1, 1, 1, 1,
-0.08605273, -0.8948984, -3.041646, 1, 1, 1, 1, 1,
-0.08554478, -0.01687982, -1.411264, 1, 1, 1, 1, 1,
-0.0840809, -0.2237298, -3.260838, 0, 0, 1, 1, 1,
-0.08405975, 0.3786606, -1.085006, 1, 0, 0, 1, 1,
-0.08112926, 0.956966, -1.305313, 1, 0, 0, 1, 1,
-0.08064353, 0.2542233, 0.2346896, 1, 0, 0, 1, 1,
-0.08010054, 1.888837, -1.237708, 1, 0, 0, 1, 1,
-0.07318264, -1.556823, -3.113351, 1, 0, 0, 1, 1,
-0.05819484, 0.1038832, -2.118658, 0, 0, 0, 1, 1,
-0.05802104, 0.8509987, -1.389435, 0, 0, 0, 1, 1,
-0.05027189, -1.148615, -2.561568, 0, 0, 0, 1, 1,
-0.0499506, -1.301509, -4.998811, 0, 0, 0, 1, 1,
-0.04855035, 0.003359941, 0.1308572, 0, 0, 0, 1, 1,
-0.04424134, 0.6132957, -1.61774, 0, 0, 0, 1, 1,
-0.04349539, -1.832033, -2.900587, 0, 0, 0, 1, 1,
-0.04327038, -1.343959, -2.581541, 1, 1, 1, 1, 1,
-0.04315897, 0.2263458, -1.638976, 1, 1, 1, 1, 1,
-0.04267917, -2.27448, -2.808242, 1, 1, 1, 1, 1,
-0.03248904, 1.547043, -0.09866878, 1, 1, 1, 1, 1,
-0.03223411, 1.25459, -0.6747102, 1, 1, 1, 1, 1,
-0.0308948, -0.8721158, -3.768584, 1, 1, 1, 1, 1,
-0.02737026, 0.6965454, 1.646491, 1, 1, 1, 1, 1,
-0.02590063, -0.1612699, -3.994856, 1, 1, 1, 1, 1,
-0.02545016, -1.272751, -3.760822, 1, 1, 1, 1, 1,
-0.01913219, 1.065143, -1.802573, 1, 1, 1, 1, 1,
-0.01768355, 0.7260177, -1.08478, 1, 1, 1, 1, 1,
-0.01649767, 0.5242562, -1.532493, 1, 1, 1, 1, 1,
-0.008547865, -0.247899, -3.276114, 1, 1, 1, 1, 1,
-0.0034241, 1.317476, -0.4318676, 1, 1, 1, 1, 1,
-0.0006957798, -3.273187, -3.24719, 1, 1, 1, 1, 1,
-7.546294e-06, 0.4891184, 0.733714, 0, 0, 1, 1, 1,
0.005022424, 0.1743325, 0.04101421, 1, 0, 0, 1, 1,
0.006410484, 0.4001679, 1.480131, 1, 0, 0, 1, 1,
0.007229539, -1.230514, 1.796527, 1, 0, 0, 1, 1,
0.008223625, 0.2652564, 0.965202, 1, 0, 0, 1, 1,
0.009909586, -0.2508126, 2.907263, 1, 0, 0, 1, 1,
0.02307332, 1.62692, 0.7296392, 0, 0, 0, 1, 1,
0.02323912, -0.721703, 3.220675, 0, 0, 0, 1, 1,
0.02595193, -1.002845, 3.610639, 0, 0, 0, 1, 1,
0.02914261, -1.195227, 2.77518, 0, 0, 0, 1, 1,
0.03804893, 0.2483411, 1.089755, 0, 0, 0, 1, 1,
0.0385837, 0.8919767, -0.3420158, 0, 0, 0, 1, 1,
0.03987326, 0.6031103, 2.395838, 0, 0, 0, 1, 1,
0.04007564, -1.273071, 4.30156, 1, 1, 1, 1, 1,
0.04009435, 0.7771746, 0.3472314, 1, 1, 1, 1, 1,
0.04940253, 0.4765025, 1.422344, 1, 1, 1, 1, 1,
0.0556986, 0.5700724, -0.5584716, 1, 1, 1, 1, 1,
0.05692757, -1.428078, 3.60984, 1, 1, 1, 1, 1,
0.06371383, -0.02976264, 0.9581552, 1, 1, 1, 1, 1,
0.06400912, -1.492459, 3.80094, 1, 1, 1, 1, 1,
0.06990366, -2.613795, 3.623475, 1, 1, 1, 1, 1,
0.06998131, -0.82453, 2.319732, 1, 1, 1, 1, 1,
0.07056972, -0.4111796, 2.269684, 1, 1, 1, 1, 1,
0.07065861, -0.8918558, 2.21894, 1, 1, 1, 1, 1,
0.07156207, 0.6873535, 0.3973711, 1, 1, 1, 1, 1,
0.07375944, 0.3660012, -0.1710189, 1, 1, 1, 1, 1,
0.07774258, 0.9122728, -1.20311, 1, 1, 1, 1, 1,
0.07927656, -0.3914903, 3.37612, 1, 1, 1, 1, 1,
0.08131519, -0.704917, 4.126004, 0, 0, 1, 1, 1,
0.08458373, 0.3384731, 0.4794678, 1, 0, 0, 1, 1,
0.08502499, 0.4467075, 0.5377237, 1, 0, 0, 1, 1,
0.08952454, -0.08590158, 2.828904, 1, 0, 0, 1, 1,
0.08968303, 0.06439307, -0.4546825, 1, 0, 0, 1, 1,
0.09138697, -0.8888134, 0.5630109, 1, 0, 0, 1, 1,
0.09285873, 0.08567565, 2.6104, 0, 0, 0, 1, 1,
0.09589656, -0.4954423, 3.560371, 0, 0, 0, 1, 1,
0.09596218, 2.144175, 0.8947402, 0, 0, 0, 1, 1,
0.0965051, 0.680873, 0.9797219, 0, 0, 0, 1, 1,
0.1016195, 0.9455498, -0.1495053, 0, 0, 0, 1, 1,
0.1037382, -0.6788428, 2.373032, 0, 0, 0, 1, 1,
0.1060826, -1.138718, 1.522892, 0, 0, 0, 1, 1,
0.1061415, -2.201417, 2.393511, 1, 1, 1, 1, 1,
0.1102844, 0.4154066, -0.8595893, 1, 1, 1, 1, 1,
0.1127222, 0.1803074, 1.986218, 1, 1, 1, 1, 1,
0.1224611, -0.2218412, 3.571529, 1, 1, 1, 1, 1,
0.1231391, 1.355764, 0.3355004, 1, 1, 1, 1, 1,
0.128852, 0.155981, 0.4464423, 1, 1, 1, 1, 1,
0.1336114, 0.9430645, 0.01308088, 1, 1, 1, 1, 1,
0.1356474, 0.204849, 2.099851, 1, 1, 1, 1, 1,
0.136246, 0.2218422, 1.092418, 1, 1, 1, 1, 1,
0.140686, -0.2316755, 1.631136, 1, 1, 1, 1, 1,
0.1448303, -0.8004462, 3.801878, 1, 1, 1, 1, 1,
0.1452715, -0.2845778, 1.688339, 1, 1, 1, 1, 1,
0.1456209, 0.7985387, 1.464927, 1, 1, 1, 1, 1,
0.1459794, 1.477117, -0.22898, 1, 1, 1, 1, 1,
0.1494149, -1.160564, 3.499879, 1, 1, 1, 1, 1,
0.1519479, -1.223418, 3.316101, 0, 0, 1, 1, 1,
0.1535838, 1.853739, 0.7322651, 1, 0, 0, 1, 1,
0.1569901, 1.235722, -1.97944, 1, 0, 0, 1, 1,
0.1574769, -0.5088011, 3.210184, 1, 0, 0, 1, 1,
0.1632088, -0.7417673, 3.147033, 1, 0, 0, 1, 1,
0.16495, 0.2018415, 1.115255, 1, 0, 0, 1, 1,
0.1652831, 1.227163, -0.0441159, 0, 0, 0, 1, 1,
0.1673725, 1.179868, 0.7524089, 0, 0, 0, 1, 1,
0.1704286, 0.2667743, -0.3580472, 0, 0, 0, 1, 1,
0.1742719, -0.2933556, 1.012612, 0, 0, 0, 1, 1,
0.1765882, 1.188051, 0.8859137, 0, 0, 0, 1, 1,
0.1850588, -0.9114989, 0.8735623, 0, 0, 0, 1, 1,
0.187851, -0.6406359, 3.224435, 0, 0, 0, 1, 1,
0.191303, -1.116951, 3.358613, 1, 1, 1, 1, 1,
0.1964978, -0.7850675, 2.740724, 1, 1, 1, 1, 1,
0.1965496, -0.6101407, 2.008793, 1, 1, 1, 1, 1,
0.2031683, -0.9000071, 2.216729, 1, 1, 1, 1, 1,
0.2040376, 2.019563, -0.4159727, 1, 1, 1, 1, 1,
0.2043694, 1.452348, -1.338184, 1, 1, 1, 1, 1,
0.2049635, -0.9391088, 3.122937, 1, 1, 1, 1, 1,
0.2053548, 0.6558436, 0.3012311, 1, 1, 1, 1, 1,
0.207105, 1.226874, -2.559107, 1, 1, 1, 1, 1,
0.2106815, -1.236247, 0.5621357, 1, 1, 1, 1, 1,
0.2137018, 2.190211, 0.5000296, 1, 1, 1, 1, 1,
0.2169899, 0.1451782, 0.4764702, 1, 1, 1, 1, 1,
0.2184887, -0.6448755, 3.034401, 1, 1, 1, 1, 1,
0.2236312, -0.4475852, 3.38619, 1, 1, 1, 1, 1,
0.2306345, -0.2582631, 1.985075, 1, 1, 1, 1, 1,
0.2318975, 1.090935, -0.9649728, 0, 0, 1, 1, 1,
0.2329822, 1.263948, -0.06031515, 1, 0, 0, 1, 1,
0.2491376, 0.4732755, 1.076688, 1, 0, 0, 1, 1,
0.2536608, -0.3574594, 2.114445, 1, 0, 0, 1, 1,
0.2559168, -0.33378, 2.453718, 1, 0, 0, 1, 1,
0.2600015, -1.153403, 3.594949, 1, 0, 0, 1, 1,
0.2611617, -0.3235623, 1.913082, 0, 0, 0, 1, 1,
0.2623989, -1.476923, 3.522724, 0, 0, 0, 1, 1,
0.2665502, -0.3976812, 3.005901, 0, 0, 0, 1, 1,
0.2671076, -0.2811491, 2.531018, 0, 0, 0, 1, 1,
0.2693573, 0.5977821, -0.4633117, 0, 0, 0, 1, 1,
0.2699411, 0.3129094, 1.236924, 0, 0, 0, 1, 1,
0.2746876, 0.1298738, 1.244347, 0, 0, 0, 1, 1,
0.2789317, 0.05785124, 2.176033, 1, 1, 1, 1, 1,
0.2801337, 1.698631, 0.3997309, 1, 1, 1, 1, 1,
0.2808203, -0.7947096, 2.763981, 1, 1, 1, 1, 1,
0.2883323, 0.3185961, 0.6930924, 1, 1, 1, 1, 1,
0.2893668, -1.017009, 3.456933, 1, 1, 1, 1, 1,
0.2913642, -0.03601436, 2.456316, 1, 1, 1, 1, 1,
0.2937618, -0.5939672, 1.655653, 1, 1, 1, 1, 1,
0.2947208, -0.9201283, 2.297248, 1, 1, 1, 1, 1,
0.2958355, -0.738331, 3.09519, 1, 1, 1, 1, 1,
0.2982313, 0.9710165, 0.463333, 1, 1, 1, 1, 1,
0.2995746, 0.001941976, 0.9506714, 1, 1, 1, 1, 1,
0.3124761, 0.4394365, -0.05195039, 1, 1, 1, 1, 1,
0.3134769, 1.970754, -0.5529324, 1, 1, 1, 1, 1,
0.3139473, -1.63111, 4.005047, 1, 1, 1, 1, 1,
0.3175513, -1.250275, 1.198183, 1, 1, 1, 1, 1,
0.3203847, -0.02136044, 1.611067, 0, 0, 1, 1, 1,
0.3231827, 1.156855, 0.2703643, 1, 0, 0, 1, 1,
0.3322592, -0.7939699, 3.683256, 1, 0, 0, 1, 1,
0.3326622, -0.03443143, 3.436019, 1, 0, 0, 1, 1,
0.340959, -0.6220732, 3.952633, 1, 0, 0, 1, 1,
0.3436406, -1.462477, 0.8271165, 1, 0, 0, 1, 1,
0.3453458, 0.4226003, -0.6977544, 0, 0, 0, 1, 1,
0.3513738, 1.541916, 0.7833935, 0, 0, 0, 1, 1,
0.3540772, 0.3053246, 1.257863, 0, 0, 0, 1, 1,
0.3553741, 0.896682, 1.559095, 0, 0, 0, 1, 1,
0.3605829, -0.5872958, 2.218728, 0, 0, 0, 1, 1,
0.3627746, 0.7282397, 0.3247306, 0, 0, 0, 1, 1,
0.3631456, 0.8108731, 1.596799, 0, 0, 0, 1, 1,
0.3634157, -0.7497945, 3.268941, 1, 1, 1, 1, 1,
0.366944, 0.2992802, 0.2146149, 1, 1, 1, 1, 1,
0.368077, 1.423522, -0.1350804, 1, 1, 1, 1, 1,
0.3685187, -0.4505419, 1.699803, 1, 1, 1, 1, 1,
0.3708371, 0.9878981, 1.149047, 1, 1, 1, 1, 1,
0.3737009, -0.08964221, 1.587158, 1, 1, 1, 1, 1,
0.3787548, -0.5436743, 2.944246, 1, 1, 1, 1, 1,
0.3817126, 1.025489, 0.3867283, 1, 1, 1, 1, 1,
0.386563, -0.7015565, 1.530524, 1, 1, 1, 1, 1,
0.3884214, 0.8372804, 2.031027, 1, 1, 1, 1, 1,
0.3934031, -0.220808, 3.565096, 1, 1, 1, 1, 1,
0.3934655, -1.937228, 3.72741, 1, 1, 1, 1, 1,
0.3959234, 1.202025, -0.5263119, 1, 1, 1, 1, 1,
0.3979093, -0.8424355, 2.96086, 1, 1, 1, 1, 1,
0.4016739, 0.0004230412, 3.536067, 1, 1, 1, 1, 1,
0.4035356, -0.8659267, 2.451334, 0, 0, 1, 1, 1,
0.4052431, 0.6087114, 2.010082, 1, 0, 0, 1, 1,
0.4064971, -1.046201, 3.493397, 1, 0, 0, 1, 1,
0.40691, -0.1092131, 2.519676, 1, 0, 0, 1, 1,
0.4080735, 0.5424191, -0.9006106, 1, 0, 0, 1, 1,
0.4084086, 0.2849526, 1.847531, 1, 0, 0, 1, 1,
0.4103304, 1.185152, 0.3549314, 0, 0, 0, 1, 1,
0.4137214, -0.7090173, 3.184489, 0, 0, 0, 1, 1,
0.4153643, 0.9212874, 2.242502, 0, 0, 0, 1, 1,
0.4226132, 1.736583, 2.258741, 0, 0, 0, 1, 1,
0.4228632, -1.822055, 3.449676, 0, 0, 0, 1, 1,
0.4247563, 0.4250527, -0.6008804, 0, 0, 0, 1, 1,
0.4265646, 0.423002, 0.6526708, 0, 0, 0, 1, 1,
0.4279949, 1.507891, 0.8824042, 1, 1, 1, 1, 1,
0.4302939, -0.7234901, 4.46316, 1, 1, 1, 1, 1,
0.4303989, 0.03882909, 1.401039, 1, 1, 1, 1, 1,
0.433372, -0.6363469, 4.198219, 1, 1, 1, 1, 1,
0.4390237, -0.2832548, 2.904039, 1, 1, 1, 1, 1,
0.4412608, 0.1398223, 0.6977342, 1, 1, 1, 1, 1,
0.4440883, 0.4240695, 0.4942567, 1, 1, 1, 1, 1,
0.4455777, 0.7061284, 1.068713, 1, 1, 1, 1, 1,
0.4504489, 0.4462865, 1.125398, 1, 1, 1, 1, 1,
0.4509988, -1.098573, 1.681366, 1, 1, 1, 1, 1,
0.4535654, -0.3818358, 4.677025, 1, 1, 1, 1, 1,
0.4549113, 2.453851, -0.3253738, 1, 1, 1, 1, 1,
0.4584296, 1.578306, -0.0563389, 1, 1, 1, 1, 1,
0.4592003, -1.571933, 3.512175, 1, 1, 1, 1, 1,
0.4610955, -1.107946, 2.777345, 1, 1, 1, 1, 1,
0.461411, 0.01060214, 1.468083, 0, 0, 1, 1, 1,
0.4643326, -1.198492, 3.69443, 1, 0, 0, 1, 1,
0.4717796, 0.2783978, 0.8751911, 1, 0, 0, 1, 1,
0.4723839, 0.7010548, 0.9866983, 1, 0, 0, 1, 1,
0.4732702, 0.1838572, -0.8544755, 1, 0, 0, 1, 1,
0.4750666, -0.2863556, 2.997339, 1, 0, 0, 1, 1,
0.4761096, 0.609688, 1.689101, 0, 0, 0, 1, 1,
0.477125, -0.1762409, 3.416811, 0, 0, 0, 1, 1,
0.4797075, 0.8579285, 0.7355404, 0, 0, 0, 1, 1,
0.4807587, 1.400434, -0.6908369, 0, 0, 0, 1, 1,
0.4845052, -0.2166901, 2.141111, 0, 0, 0, 1, 1,
0.4899553, 1.466768, -0.7886973, 0, 0, 0, 1, 1,
0.4930996, -0.9961153, 3.54511, 0, 0, 0, 1, 1,
0.4960005, -0.6173608, 2.181279, 1, 1, 1, 1, 1,
0.4968714, -1.480214, 2.202796, 1, 1, 1, 1, 1,
0.4972917, -0.05930857, 1.186474, 1, 1, 1, 1, 1,
0.4987457, 0.4603491, 0.4029316, 1, 1, 1, 1, 1,
0.5003341, -0.9223659, 2.39595, 1, 1, 1, 1, 1,
0.5075735, 0.5948049, 0.3497094, 1, 1, 1, 1, 1,
0.5119376, 0.428588, -0.3955202, 1, 1, 1, 1, 1,
0.5119394, 0.7764355, 0.2000104, 1, 1, 1, 1, 1,
0.5165054, 0.8549727, -0.3822185, 1, 1, 1, 1, 1,
0.5168043, 0.7001976, 1.264533, 1, 1, 1, 1, 1,
0.5213819, 0.1063897, 0.1244559, 1, 1, 1, 1, 1,
0.5225971, -0.8871126, 3.201508, 1, 1, 1, 1, 1,
0.5296997, -0.9939259, 2.243972, 1, 1, 1, 1, 1,
0.5315192, 1.417525, -0.9043839, 1, 1, 1, 1, 1,
0.5315673, -0.8780529, 3.419037, 1, 1, 1, 1, 1,
0.5348681, 0.005587284, 2.908121, 0, 0, 1, 1, 1,
0.5353173, 0.9434131, -0.2613217, 1, 0, 0, 1, 1,
0.5405388, -1.923344, 1.943572, 1, 0, 0, 1, 1,
0.5407398, 2.166799, -0.3373889, 1, 0, 0, 1, 1,
0.5448059, 0.7538486, -0.3334517, 1, 0, 0, 1, 1,
0.5466739, -0.547776, 3.264944, 1, 0, 0, 1, 1,
0.5476831, 0.1852262, 1.169082, 0, 0, 0, 1, 1,
0.5503841, 0.2531739, 1.202185, 0, 0, 0, 1, 1,
0.5520229, -1.405281, 2.591173, 0, 0, 0, 1, 1,
0.5528736, -0.3317739, -0.1304957, 0, 0, 0, 1, 1,
0.5546371, 0.4748956, 2.462306, 0, 0, 0, 1, 1,
0.5584946, 0.5709508, 1.207624, 0, 0, 0, 1, 1,
0.5594943, 0.860707, -0.2240002, 0, 0, 0, 1, 1,
0.5595575, 0.0281595, 1.536376, 1, 1, 1, 1, 1,
0.572995, 1.009643, 0.3816457, 1, 1, 1, 1, 1,
0.581226, -0.1491221, 1.035637, 1, 1, 1, 1, 1,
0.5850592, -1.018788, 4.329943, 1, 1, 1, 1, 1,
0.5862489, 1.176358, 1.027534, 1, 1, 1, 1, 1,
0.5896789, -0.1503288, 3.73224, 1, 1, 1, 1, 1,
0.5911366, -0.4978609, 2.370562, 1, 1, 1, 1, 1,
0.5921396, -1.12505, 2.194802, 1, 1, 1, 1, 1,
0.5922817, -0.6633477, 2.444595, 1, 1, 1, 1, 1,
0.5931412, 1.369332, 0.8482637, 1, 1, 1, 1, 1,
0.5991569, 1.209702, 0.7816509, 1, 1, 1, 1, 1,
0.6006923, -1.916914, 1.542682, 1, 1, 1, 1, 1,
0.6023973, -0.7598838, 2.418111, 1, 1, 1, 1, 1,
0.6056891, -0.8727546, 2.511934, 1, 1, 1, 1, 1,
0.6087722, -0.08674314, 1.208447, 1, 1, 1, 1, 1,
0.6091035, 1.196568, -0.5209445, 0, 0, 1, 1, 1,
0.6101947, 0.7795534, 1.159287, 1, 0, 0, 1, 1,
0.6150419, 0.5250649, 0.5915599, 1, 0, 0, 1, 1,
0.6170292, -1.240616, 2.704142, 1, 0, 0, 1, 1,
0.6171091, -0.827364, 2.742585, 1, 0, 0, 1, 1,
0.6176339, 1.043234, -0.767759, 1, 0, 0, 1, 1,
0.617834, 1.016493, 0.5363051, 0, 0, 0, 1, 1,
0.6268852, 1.195925, 0.7224661, 0, 0, 0, 1, 1,
0.6274027, 1.259808, -1.200141, 0, 0, 0, 1, 1,
0.6290315, 0.3316455, 1.505417, 0, 0, 0, 1, 1,
0.635233, 0.6821448, -1.861154, 0, 0, 0, 1, 1,
0.638556, 2.068463, -0.1004289, 0, 0, 0, 1, 1,
0.6400576, -0.8829234, 1.189689, 0, 0, 0, 1, 1,
0.6406931, -0.9794151, 3.806788, 1, 1, 1, 1, 1,
0.6414126, -0.3472042, 2.606355, 1, 1, 1, 1, 1,
0.6485456, 0.8991822, 1.326066, 1, 1, 1, 1, 1,
0.6574452, 1.559069, -0.4594056, 1, 1, 1, 1, 1,
0.6582656, 0.4074334, 2.018188, 1, 1, 1, 1, 1,
0.6701806, -0.01280931, 1.551414, 1, 1, 1, 1, 1,
0.6827803, -0.2457132, 2.425799, 1, 1, 1, 1, 1,
0.6893409, -0.2464778, 2.51861, 1, 1, 1, 1, 1,
0.690811, 0.1205877, 0.9011847, 1, 1, 1, 1, 1,
0.6920148, -0.2732338, 0.5421214, 1, 1, 1, 1, 1,
0.6973085, -0.1405474, 0.3611153, 1, 1, 1, 1, 1,
0.7023054, 1.154855, -0.6833609, 1, 1, 1, 1, 1,
0.7135603, -0.825404, 4.035616, 1, 1, 1, 1, 1,
0.7232901, -0.779467, 2.886681, 1, 1, 1, 1, 1,
0.7237483, -0.2150798, 2.508382, 1, 1, 1, 1, 1,
0.7245016, -2.338401, 1.348859, 0, 0, 1, 1, 1,
0.7253025, 1.148456, 1.163241, 1, 0, 0, 1, 1,
0.7279648, 0.1352948, 2.157514, 1, 0, 0, 1, 1,
0.7284943, 0.548153, 1.733906, 1, 0, 0, 1, 1,
0.7308978, -0.3555383, 2.115132, 1, 0, 0, 1, 1,
0.7313132, 2.257899, 1.10204, 1, 0, 0, 1, 1,
0.7391471, 1.354428, 0.3797293, 0, 0, 0, 1, 1,
0.7498882, -0.8009184, 3.70591, 0, 0, 0, 1, 1,
0.7517561, -0.5431874, 1.490926, 0, 0, 0, 1, 1,
0.7528228, -2.02361, 3.017813, 0, 0, 0, 1, 1,
0.7537284, -0.4130447, 1.078356, 0, 0, 0, 1, 1,
0.7550305, -1.704527, 2.422143, 0, 0, 0, 1, 1,
0.756692, -0.324975, 3.131948, 0, 0, 0, 1, 1,
0.7567533, -1.195937, 4.426596, 1, 1, 1, 1, 1,
0.7593545, -0.7341665, 2.124446, 1, 1, 1, 1, 1,
0.7730591, 0.335323, 1.40564, 1, 1, 1, 1, 1,
0.7735396, -0.1316177, 2.299676, 1, 1, 1, 1, 1,
0.7805638, 0.3715662, -0.4151797, 1, 1, 1, 1, 1,
0.7817171, -1.040274, 2.915645, 1, 1, 1, 1, 1,
0.7869247, -0.4510445, 1.819648, 1, 1, 1, 1, 1,
0.7887431, 1.357179, 0.6235273, 1, 1, 1, 1, 1,
0.7909626, -1.692897, 3.117768, 1, 1, 1, 1, 1,
0.7912435, -0.1781764, 1.463726, 1, 1, 1, 1, 1,
0.7973285, -0.6660213, 2.264226, 1, 1, 1, 1, 1,
0.7995006, -1.729084, 0.7238269, 1, 1, 1, 1, 1,
0.8020616, -1.914905, 3.115975, 1, 1, 1, 1, 1,
0.8101791, -0.4305049, 1.315481, 1, 1, 1, 1, 1,
0.8127236, 0.332769, 1.799312, 1, 1, 1, 1, 1,
0.8188192, -0.2061341, 2.689085, 0, 0, 1, 1, 1,
0.8189766, -0.7784376, 1.972426, 1, 0, 0, 1, 1,
0.8228158, -2.529629, 2.100831, 1, 0, 0, 1, 1,
0.8239294, -0.3997775, 0.4781266, 1, 0, 0, 1, 1,
0.8242037, -0.391209, 0.6639276, 1, 0, 0, 1, 1,
0.8270032, -1.466495, 2.638096, 1, 0, 0, 1, 1,
0.8354654, -1.039777, 3.826715, 0, 0, 0, 1, 1,
0.8416434, 0.04688428, 4.380482, 0, 0, 0, 1, 1,
0.8438015, -0.3185086, 3.098201, 0, 0, 0, 1, 1,
0.8608684, -0.7309017, 2.665751, 0, 0, 0, 1, 1,
0.8612637, -0.3441058, 1.957839, 0, 0, 0, 1, 1,
0.8632046, 1.176874, 0.8065082, 0, 0, 0, 1, 1,
0.8763757, -1.158933, 1.277417, 0, 0, 0, 1, 1,
0.8906281, 2.013325, 0.1238308, 1, 1, 1, 1, 1,
0.8988144, 1.387958, -0.3158793, 1, 1, 1, 1, 1,
0.9006801, -0.3504401, 1.749208, 1, 1, 1, 1, 1,
0.9018013, -0.4030267, 0.2930419, 1, 1, 1, 1, 1,
0.9047282, -0.549598, -0.1287904, 1, 1, 1, 1, 1,
0.9070007, -0.3787402, 1.487725, 1, 1, 1, 1, 1,
0.9088145, 0.1463648, 0.6638819, 1, 1, 1, 1, 1,
0.9089674, 0.9761231, 1.617115, 1, 1, 1, 1, 1,
0.9108755, 1.365831, 0.4907783, 1, 1, 1, 1, 1,
0.9116575, 0.7234927, 1.382289, 1, 1, 1, 1, 1,
0.9158558, 0.02297758, 2.394359, 1, 1, 1, 1, 1,
0.916199, 0.09650258, 2.030972, 1, 1, 1, 1, 1,
0.9249534, 1.211298, 0.423146, 1, 1, 1, 1, 1,
0.9254855, 0.02949167, 0.09501132, 1, 1, 1, 1, 1,
0.9349976, 0.8462456, 1.175286, 1, 1, 1, 1, 1,
0.9410239, 0.6510876, 0.5632223, 0, 0, 1, 1, 1,
0.9445652, 1.585562, -0.102876, 1, 0, 0, 1, 1,
0.9638556, -0.01161371, 2.078128, 1, 0, 0, 1, 1,
0.9649001, 1.691773, 1.005181, 1, 0, 0, 1, 1,
0.9665837, 0.4218376, 1.423056, 1, 0, 0, 1, 1,
0.971748, 0.2727856, 1.008596, 1, 0, 0, 1, 1,
0.9723721, 1.346671, -0.7124765, 0, 0, 0, 1, 1,
0.9728428, 0.04658886, 0.04272217, 0, 0, 0, 1, 1,
0.9820871, -0.09747203, 1.607369, 0, 0, 0, 1, 1,
0.9880503, -0.7220143, 1.37559, 0, 0, 0, 1, 1,
0.9935182, 0.4237402, 0.1305723, 0, 0, 0, 1, 1,
0.9971949, 0.7021556, 1.800039, 0, 0, 0, 1, 1,
0.9993892, -0.7043909, 2.255305, 0, 0, 0, 1, 1,
0.9994164, -0.09251538, 0.6354324, 1, 1, 1, 1, 1,
0.9997097, -0.6008338, 4.093728, 1, 1, 1, 1, 1,
1.000236, 0.2794904, 0.9386002, 1, 1, 1, 1, 1,
1.004645, -0.3846857, 1.887814, 1, 1, 1, 1, 1,
1.010272, 0.5516858, 2.02794, 1, 1, 1, 1, 1,
1.012488, 0.08495796, 2.003637, 1, 1, 1, 1, 1,
1.023667, 2.057366, 0.2241588, 1, 1, 1, 1, 1,
1.031315, -0.2075327, 3.847928, 1, 1, 1, 1, 1,
1.031373, -0.3726839, 1.710754, 1, 1, 1, 1, 1,
1.038203, -1.189503, 0.502431, 1, 1, 1, 1, 1,
1.040233, 0.5132604, 0.3149453, 1, 1, 1, 1, 1,
1.041036, -0.5823328, 2.738331, 1, 1, 1, 1, 1,
1.041885, 0.7758524, 1.910125, 1, 1, 1, 1, 1,
1.049714, 1.040936, 0.931677, 1, 1, 1, 1, 1,
1.050678, -1.177083, 2.955538, 1, 1, 1, 1, 1,
1.051558, -0.1427361, 2.741776, 0, 0, 1, 1, 1,
1.05266, -0.3014694, 2.332529, 1, 0, 0, 1, 1,
1.052975, -0.0270043, 0.8756425, 1, 0, 0, 1, 1,
1.058475, -0.1411732, 1.010484, 1, 0, 0, 1, 1,
1.060011, -0.6251948, 0.4417206, 1, 0, 0, 1, 1,
1.061897, -0.330921, 1.411556, 1, 0, 0, 1, 1,
1.066709, -0.9702337, 1.631661, 0, 0, 0, 1, 1,
1.076308, -0.2708327, 3.153366, 0, 0, 0, 1, 1,
1.084936, 0.9918419, -0.07959296, 0, 0, 0, 1, 1,
1.085937, 0.6802258, -0.3502495, 0, 0, 0, 1, 1,
1.086104, -1.13177, -0.1793325, 0, 0, 0, 1, 1,
1.087078, 2.176204, 0.1918205, 0, 0, 0, 1, 1,
1.087226, 0.9048005, -0.710788, 0, 0, 0, 1, 1,
1.090158, -0.3099312, 2.18479, 1, 1, 1, 1, 1,
1.090265, 0.874291, -0.5500594, 1, 1, 1, 1, 1,
1.091652, 0.3027099, 1.22166, 1, 1, 1, 1, 1,
1.093298, 0.5893318, 3.206538, 1, 1, 1, 1, 1,
1.095007, -0.3412819, 1.981642, 1, 1, 1, 1, 1,
1.100672, 0.3850388, 2.599422, 1, 1, 1, 1, 1,
1.120109, 0.6753235, 0.9171508, 1, 1, 1, 1, 1,
1.120504, 0.2597885, 1.073138, 1, 1, 1, 1, 1,
1.123537, -0.03671426, 2.290214, 1, 1, 1, 1, 1,
1.12798, 0.2637612, 0.4640713, 1, 1, 1, 1, 1,
1.128281, 0.3999152, 1.446811, 1, 1, 1, 1, 1,
1.131052, 0.1531878, 0.6254997, 1, 1, 1, 1, 1,
1.136113, 0.717607, 2.633218, 1, 1, 1, 1, 1,
1.140488, 1.307885, -0.5166751, 1, 1, 1, 1, 1,
1.145992, 0.2817517, 0.7860544, 1, 1, 1, 1, 1,
1.149893, -0.7773796, 1.245506, 0, 0, 1, 1, 1,
1.152576, 0.8094097, 1.275312, 1, 0, 0, 1, 1,
1.156736, -0.8230582, 1.032395, 1, 0, 0, 1, 1,
1.165066, -0.09891454, 2.647249, 1, 0, 0, 1, 1,
1.166693, 0.1918025, 1.633523, 1, 0, 0, 1, 1,
1.167209, 0.3716744, -0.2654277, 1, 0, 0, 1, 1,
1.172498, -1.877962, 2.359896, 0, 0, 0, 1, 1,
1.177703, -0.4703484, 1.955394, 0, 0, 0, 1, 1,
1.189117, -1.14942, 1.645359, 0, 0, 0, 1, 1,
1.198504, -1.104665, 3.422345, 0, 0, 0, 1, 1,
1.221886, -0.6775933, 2.143829, 0, 0, 0, 1, 1,
1.229692, 0.3624458, 2.963135, 0, 0, 0, 1, 1,
1.235875, 1.386159, 0.7289682, 0, 0, 0, 1, 1,
1.240915, 0.9008684, 1.11534, 1, 1, 1, 1, 1,
1.243725, 2.050291, 0.3697687, 1, 1, 1, 1, 1,
1.248833, -1.821748, 2.054525, 1, 1, 1, 1, 1,
1.250946, -1.426967, 1.571432, 1, 1, 1, 1, 1,
1.251384, -0.05473355, 1.153702, 1, 1, 1, 1, 1,
1.258506, 0.4325747, 4.294179, 1, 1, 1, 1, 1,
1.270879, 1.053415, 0.8082399, 1, 1, 1, 1, 1,
1.271742, 0.1495615, 0.8167862, 1, 1, 1, 1, 1,
1.27216, 0.4676378, 0.542055, 1, 1, 1, 1, 1,
1.272724, -0.1108426, 2.410783, 1, 1, 1, 1, 1,
1.272729, 0.0346575, -0.1339924, 1, 1, 1, 1, 1,
1.287065, 0.05325245, 1.32227, 1, 1, 1, 1, 1,
1.291905, 2.235341, -0.9784773, 1, 1, 1, 1, 1,
1.294097, 0.5719042, 0.369373, 1, 1, 1, 1, 1,
1.297189, -0.05108928, 2.836964, 1, 1, 1, 1, 1,
1.307547, 0.4627271, -0.6816531, 0, 0, 1, 1, 1,
1.314948, 1.022622, 0.3281108, 1, 0, 0, 1, 1,
1.325966, -0.4380859, 1.552142, 1, 0, 0, 1, 1,
1.335072, -1.501356, 1.690162, 1, 0, 0, 1, 1,
1.337112, -1.511287, 2.110552, 1, 0, 0, 1, 1,
1.341491, -0.3915055, 2.965433, 1, 0, 0, 1, 1,
1.342566, -1.237492, 3.222714, 0, 0, 0, 1, 1,
1.359377, 0.6180509, 0.946595, 0, 0, 0, 1, 1,
1.367131, 0.1997814, 0.3487786, 0, 0, 0, 1, 1,
1.368293, 0.1099116, 0.1099978, 0, 0, 0, 1, 1,
1.37587, 1.521323, -1.514403, 0, 0, 0, 1, 1,
1.384944, -0.6088568, -1.116557, 0, 0, 0, 1, 1,
1.395064, 0.2200417, 0.4546489, 0, 0, 0, 1, 1,
1.399362, 1.817738, 1.534702, 1, 1, 1, 1, 1,
1.404336, 0.7097995, 0.5898769, 1, 1, 1, 1, 1,
1.415325, -0.1462249, 0.715928, 1, 1, 1, 1, 1,
1.417137, -0.8619259, 2.521917, 1, 1, 1, 1, 1,
1.426133, 1.054294, 2.789588, 1, 1, 1, 1, 1,
1.429997, 0.05077215, 0.9989239, 1, 1, 1, 1, 1,
1.439644, -0.4970632, 1.585834, 1, 1, 1, 1, 1,
1.44053, -0.4535405, 2.320141, 1, 1, 1, 1, 1,
1.444146, -0.2740205, 1.785814, 1, 1, 1, 1, 1,
1.446524, -0.2782628, 2.553518, 1, 1, 1, 1, 1,
1.449064, -0.2324831, 1.732422, 1, 1, 1, 1, 1,
1.47142, -0.2110103, 2.008554, 1, 1, 1, 1, 1,
1.474245, 0.1565109, 1.156751, 1, 1, 1, 1, 1,
1.497304, 2.118975, 0.7705994, 1, 1, 1, 1, 1,
1.497653, 0.8593855, 1.890122, 1, 1, 1, 1, 1,
1.504247, -0.1147822, 0.9203011, 0, 0, 1, 1, 1,
1.505833, -0.6379994, 2.812828, 1, 0, 0, 1, 1,
1.506711, -0.5858539, 3.938094, 1, 0, 0, 1, 1,
1.514424, 0.7267483, 2.263442, 1, 0, 0, 1, 1,
1.517986, 0.741476, 2.152988, 1, 0, 0, 1, 1,
1.523692, 1.118242, 0.2886298, 1, 0, 0, 1, 1,
1.533194, 0.7377372, 2.359598, 0, 0, 0, 1, 1,
1.538805, 0.2172004, 2.033234, 0, 0, 0, 1, 1,
1.555923, -0.4907603, 2.03739, 0, 0, 0, 1, 1,
1.570602, 0.6428896, 1.677117, 0, 0, 0, 1, 1,
1.581465, -0.1885164, 2.012141, 0, 0, 0, 1, 1,
1.586343, -0.5700515, 3.484659, 0, 0, 0, 1, 1,
1.59043, -0.8407022, 0.9249082, 0, 0, 0, 1, 1,
1.597207, 0.1265216, 1.18938, 1, 1, 1, 1, 1,
1.603824, -0.1562063, 0.7278969, 1, 1, 1, 1, 1,
1.623929, -0.310244, 1.573115, 1, 1, 1, 1, 1,
1.629367, -0.03531759, 1.483897, 1, 1, 1, 1, 1,
1.634987, 0.5330275, 1.217514, 1, 1, 1, 1, 1,
1.644645, -0.8649542, 2.789944, 1, 1, 1, 1, 1,
1.65337, 0.3578227, 0.6732084, 1, 1, 1, 1, 1,
1.664501, 1.01807, 0.4927333, 1, 1, 1, 1, 1,
1.677887, -0.8180584, 2.513085, 1, 1, 1, 1, 1,
1.705751, -0.9432227, 2.894434, 1, 1, 1, 1, 1,
1.717755, -0.1971639, 0.7911518, 1, 1, 1, 1, 1,
1.717982, -0.2378445, 2.235225, 1, 1, 1, 1, 1,
1.721541, 0.3649657, 2.175285, 1, 1, 1, 1, 1,
1.723858, -0.5428304, 2.395339, 1, 1, 1, 1, 1,
1.749676, 1.093201, 0.43174, 1, 1, 1, 1, 1,
1.765112, -0.3774951, -0.1271593, 0, 0, 1, 1, 1,
1.791177, -1.341557, 1.426614, 1, 0, 0, 1, 1,
1.791491, -0.6195772, 2.650987, 1, 0, 0, 1, 1,
1.808996, 0.9351608, 0.7694384, 1, 0, 0, 1, 1,
1.844609, -0.06651039, 3.349236, 1, 0, 0, 1, 1,
1.844993, 0.6778425, 0.7613234, 1, 0, 0, 1, 1,
1.860358, 1.403348, 1.211396, 0, 0, 0, 1, 1,
1.869348, 0.1878699, 0.3136421, 0, 0, 0, 1, 1,
1.899458, 0.4035276, 0.5061698, 0, 0, 0, 1, 1,
1.906698, -1.399089, 3.708897, 0, 0, 0, 1, 1,
1.916369, 0.2143798, -0.0555502, 0, 0, 0, 1, 1,
1.924678, -0.137152, 2.009427, 0, 0, 0, 1, 1,
1.928198, -1.412669, 3.222503, 0, 0, 0, 1, 1,
1.941707, -0.5713546, 0.3125125, 1, 1, 1, 1, 1,
1.942357, 1.600214, 1.019459, 1, 1, 1, 1, 1,
1.956965, 1.225333, 2.469112, 1, 1, 1, 1, 1,
1.960403, -0.5484954, 1.718876, 1, 1, 1, 1, 1,
1.972547, 0.8094798, 2.250106, 1, 1, 1, 1, 1,
1.991459, -0.04470491, 0.608447, 1, 1, 1, 1, 1,
1.992146, -1.872607, 4.970982, 1, 1, 1, 1, 1,
2.003485, 0.9143462, 1.066853, 1, 1, 1, 1, 1,
2.005085, -0.3431718, 2.935446, 1, 1, 1, 1, 1,
2.007039, -1.566133, 1.772592, 1, 1, 1, 1, 1,
2.026406, 1.092498, -0.1834377, 1, 1, 1, 1, 1,
2.064103, 0.8502598, 2.116517, 1, 1, 1, 1, 1,
2.106538, 2.094287, 0.4435602, 1, 1, 1, 1, 1,
2.12822, -1.141884, 0.8331091, 1, 1, 1, 1, 1,
2.151996, 0.450189, -0.1770763, 1, 1, 1, 1, 1,
2.175211, 1.375376, 1.661559, 0, 0, 1, 1, 1,
2.182116, 1.471307, -0.3067369, 1, 0, 0, 1, 1,
2.19219, 0.2479816, 2.931724, 1, 0, 0, 1, 1,
2.210106, -0.4241895, 1.574634, 1, 0, 0, 1, 1,
2.236725, -0.1111601, 0.8748319, 1, 0, 0, 1, 1,
2.246337, -0.03546548, 1.14976, 1, 0, 0, 1, 1,
2.247686, -0.2925713, 0.9008023, 0, 0, 0, 1, 1,
2.268795, 0.2791997, 1.170226, 0, 0, 0, 1, 1,
2.408969, -0.6041574, 2.704116, 0, 0, 0, 1, 1,
2.409136, 0.388292, 3.162129, 0, 0, 0, 1, 1,
2.435154, 0.5085686, 1.325712, 0, 0, 0, 1, 1,
2.442876, 0.3109367, 1.414437, 0, 0, 0, 1, 1,
2.53015, -0.2707735, 0.7937939, 0, 0, 0, 1, 1,
2.562946, 0.6582276, 1.221881, 1, 1, 1, 1, 1,
2.66456, 1.028993, 2.304147, 1, 1, 1, 1, 1,
2.785372, 0.6174619, -0.4499014, 1, 1, 1, 1, 1,
2.966674, -0.3052057, 0.2164625, 1, 1, 1, 1, 1,
3.004897, 1.177841, 0.6726668, 1, 1, 1, 1, 1,
3.038605, 1.164612, 1.438452, 1, 1, 1, 1, 1,
3.649999, -0.05591029, 1.936246, 1, 1, 1, 1, 1
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
var radius = 9.230023;
var distance = 32.42006;
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
mvMatrix.translate( -0.4522099, 0.2099627, 0.05201507 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.42006);
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
