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
-3.2704, -1.29943, -1.900403, 1, 0, 0, 1,
-3.213902, -0.01848804, -2.43072, 1, 0.007843138, 0, 1,
-2.800645, -0.5416011, -1.839118, 1, 0.01176471, 0, 1,
-2.786176, 1.917545, -0.2858647, 1, 0.01960784, 0, 1,
-2.721575, 0.823283, -1.110563, 1, 0.02352941, 0, 1,
-2.721066, 1.411621, -2.045929, 1, 0.03137255, 0, 1,
-2.597183, 0.1062267, -2.350629, 1, 0.03529412, 0, 1,
-2.576976, 1.730123, -1.434252, 1, 0.04313726, 0, 1,
-2.57534, -0.6783823, -3.534754, 1, 0.04705882, 0, 1,
-2.562977, 1.287769, -1.438846, 1, 0.05490196, 0, 1,
-2.551769, -0.785339, -4.096884, 1, 0.05882353, 0, 1,
-2.522797, -1.048379, -0.1003264, 1, 0.06666667, 0, 1,
-2.451044, 0.909735, -0.9855143, 1, 0.07058824, 0, 1,
-2.438374, -0.7413313, -1.710656, 1, 0.07843138, 0, 1,
-2.41187, 0.6362618, -1.58001, 1, 0.08235294, 0, 1,
-2.341072, 0.9057858, -2.21779, 1, 0.09019608, 0, 1,
-2.297462, -1.531676, -1.663576, 1, 0.09411765, 0, 1,
-2.249643, -0.464485, -2.918468, 1, 0.1019608, 0, 1,
-2.244423, -0.8578591, -2.837022, 1, 0.1098039, 0, 1,
-2.19442, -0.02617414, -2.785762, 1, 0.1137255, 0, 1,
-2.151889, 0.6322446, -0.7996001, 1, 0.1215686, 0, 1,
-2.140006, 0.06941032, -1.781755, 1, 0.1254902, 0, 1,
-2.110235, -1.400402, -2.193988, 1, 0.1333333, 0, 1,
-2.094219, -0.3211722, -2.738872, 1, 0.1372549, 0, 1,
-2.091569, 0.8193421, -0.1295622, 1, 0.145098, 0, 1,
-2.016848, 0.3780386, -1.623307, 1, 0.1490196, 0, 1,
-2.011669, -0.476652, -2.240335, 1, 0.1568628, 0, 1,
-1.979738, -0.2472118, -1.020384, 1, 0.1607843, 0, 1,
-1.968208, -0.1290855, -0.7170494, 1, 0.1686275, 0, 1,
-1.958279, -0.01277943, -2.641959, 1, 0.172549, 0, 1,
-1.94382, -0.06402211, 0.05537529, 1, 0.1803922, 0, 1,
-1.941904, 0.6267729, -1.839975, 1, 0.1843137, 0, 1,
-1.934687, -0.7465477, -3.187652, 1, 0.1921569, 0, 1,
-1.933981, -0.895678, -0.7000257, 1, 0.1960784, 0, 1,
-1.929091, -0.7167794, -0.366514, 1, 0.2039216, 0, 1,
-1.920517, 1.555701, -0.6051219, 1, 0.2117647, 0, 1,
-1.9041, 1.984087, -0.8228161, 1, 0.2156863, 0, 1,
-1.897782, 0.1638483, -1.803254, 1, 0.2235294, 0, 1,
-1.894418, 0.2330726, -2.279649, 1, 0.227451, 0, 1,
-1.888638, 0.6269197, 1.247539, 1, 0.2352941, 0, 1,
-1.874906, -0.177261, -2.070355, 1, 0.2392157, 0, 1,
-1.873163, -0.8705001, -2.021985, 1, 0.2470588, 0, 1,
-1.829111, -0.2377952, -1.5718, 1, 0.2509804, 0, 1,
-1.826534, 1.136161, -1.445315, 1, 0.2588235, 0, 1,
-1.786999, 2.620021, 0.007521467, 1, 0.2627451, 0, 1,
-1.774881, -1.150375, -3.377548, 1, 0.2705882, 0, 1,
-1.737949, 0.6391227, -2.547722, 1, 0.2745098, 0, 1,
-1.721094, 1.013164, -1.660861, 1, 0.282353, 0, 1,
-1.72043, 1.478331, -1.564429, 1, 0.2862745, 0, 1,
-1.715687, -0.7234223, -2.788765, 1, 0.2941177, 0, 1,
-1.675171, 0.3860005, -1.290411, 1, 0.3019608, 0, 1,
-1.659258, 1.343014, 0.3601591, 1, 0.3058824, 0, 1,
-1.646068, -1.247621, -0.9915357, 1, 0.3137255, 0, 1,
-1.636137, 1.136576, -1.761657, 1, 0.3176471, 0, 1,
-1.620789, -0.4741, -3.039856, 1, 0.3254902, 0, 1,
-1.605559, 0.2189392, -1.803661, 1, 0.3294118, 0, 1,
-1.587681, 0.8028214, -4.216734, 1, 0.3372549, 0, 1,
-1.585715, 0.5909601, -2.132806, 1, 0.3411765, 0, 1,
-1.572275, 0.7056721, 0.2212389, 1, 0.3490196, 0, 1,
-1.563564, 0.7292098, -2.043357, 1, 0.3529412, 0, 1,
-1.559414, 0.5885978, 1.471755, 1, 0.3607843, 0, 1,
-1.548036, -0.2115966, -2.230035, 1, 0.3647059, 0, 1,
-1.546816, 0.1928505, -1.355829, 1, 0.372549, 0, 1,
-1.508059, -0.3718458, -3.308865, 1, 0.3764706, 0, 1,
-1.506668, -1.539783, -3.878857, 1, 0.3843137, 0, 1,
-1.504251, -1.663437, -1.935461, 1, 0.3882353, 0, 1,
-1.474451, 0.8374463, -1.985039, 1, 0.3960784, 0, 1,
-1.467981, 0.1759598, -0.9762629, 1, 0.4039216, 0, 1,
-1.467714, -1.110782, -1.573831, 1, 0.4078431, 0, 1,
-1.465834, -0.1050709, -2.809957, 1, 0.4156863, 0, 1,
-1.464052, 0.9664266, 0.8104458, 1, 0.4196078, 0, 1,
-1.463865, -0.5389325, -2.383971, 1, 0.427451, 0, 1,
-1.462701, 0.3512282, -1.910318, 1, 0.4313726, 0, 1,
-1.459287, -0.2569958, -0.9230622, 1, 0.4392157, 0, 1,
-1.436588, 0.4415147, -2.525777, 1, 0.4431373, 0, 1,
-1.432142, -1.466043, -1.872683, 1, 0.4509804, 0, 1,
-1.423307, 0.0149511, -3.901217, 1, 0.454902, 0, 1,
-1.421777, -0.7650747, -1.073838, 1, 0.4627451, 0, 1,
-1.418954, -0.7977143, -3.488801, 1, 0.4666667, 0, 1,
-1.416698, 0.2163219, -2.57902, 1, 0.4745098, 0, 1,
-1.414469, -0.3373812, -1.625658, 1, 0.4784314, 0, 1,
-1.412755, -0.966417, -0.2144552, 1, 0.4862745, 0, 1,
-1.407846, -0.6119235, -0.3182986, 1, 0.4901961, 0, 1,
-1.392333, -0.809166, -2.101647, 1, 0.4980392, 0, 1,
-1.37435, 0.04470505, -2.667171, 1, 0.5058824, 0, 1,
-1.367481, -0.8726682, -1.717238, 1, 0.509804, 0, 1,
-1.365146, -0.8304746, -4.195851, 1, 0.5176471, 0, 1,
-1.360186, 0.1459455, -1.807503, 1, 0.5215687, 0, 1,
-1.358296, -0.3839469, -1.831029, 1, 0.5294118, 0, 1,
-1.348162, 0.6721801, 0.3106312, 1, 0.5333334, 0, 1,
-1.347753, -0.1665539, -1.131413, 1, 0.5411765, 0, 1,
-1.345504, 0.2267987, -1.137579, 1, 0.5450981, 0, 1,
-1.336275, -0.5611948, -2.958347, 1, 0.5529412, 0, 1,
-1.332501, 0.0965561, -2.260262, 1, 0.5568628, 0, 1,
-1.318377, -0.5743371, -3.255345, 1, 0.5647059, 0, 1,
-1.316999, -0.1422642, -2.249902, 1, 0.5686275, 0, 1,
-1.314661, 0.491791, -2.477462, 1, 0.5764706, 0, 1,
-1.311055, -0.01128967, -1.489519, 1, 0.5803922, 0, 1,
-1.309394, -1.437839, -1.560304, 1, 0.5882353, 0, 1,
-1.292681, -1.0484, -3.203704, 1, 0.5921569, 0, 1,
-1.290208, -0.4173997, -1.992893, 1, 0.6, 0, 1,
-1.289711, -0.7006273, -1.916691, 1, 0.6078432, 0, 1,
-1.286696, -0.9288969, -2.414774, 1, 0.6117647, 0, 1,
-1.280517, -0.5929143, -1.549745, 1, 0.6196079, 0, 1,
-1.276665, 0.7999523, -1.814307, 1, 0.6235294, 0, 1,
-1.275129, 0.5169522, -0.661133, 1, 0.6313726, 0, 1,
-1.27297, -0.5795617, -1.724943, 1, 0.6352941, 0, 1,
-1.271785, -0.8714378, -1.341136, 1, 0.6431373, 0, 1,
-1.271757, -0.4091803, -2.030803, 1, 0.6470588, 0, 1,
-1.262922, -0.2132775, 0.4097011, 1, 0.654902, 0, 1,
-1.260463, -0.8471699, -1.467354, 1, 0.6588235, 0, 1,
-1.259277, 0.3351794, -1.242522, 1, 0.6666667, 0, 1,
-1.259177, -1.225419, -2.319761, 1, 0.6705883, 0, 1,
-1.255419, -0.06735337, -3.784856, 1, 0.6784314, 0, 1,
-1.254279, 0.7061678, -3.16298, 1, 0.682353, 0, 1,
-1.253309, 1.164461, 0.02701491, 1, 0.6901961, 0, 1,
-1.249603, 0.7599615, -1.156779, 1, 0.6941177, 0, 1,
-1.2463, 1.247148, 0.720084, 1, 0.7019608, 0, 1,
-1.243947, 0.4680679, -2.143251, 1, 0.7098039, 0, 1,
-1.242794, 1.21315, 0.04994978, 1, 0.7137255, 0, 1,
-1.23503, 2.311929, -0.7023638, 1, 0.7215686, 0, 1,
-1.228902, 1.730205, -2.310285, 1, 0.7254902, 0, 1,
-1.224702, -1.807364, -1.410477, 1, 0.7333333, 0, 1,
-1.221506, -0.3088152, -2.400985, 1, 0.7372549, 0, 1,
-1.221434, -0.9265869, -1.936249, 1, 0.7450981, 0, 1,
-1.215669, -0.3211708, -1.553681, 1, 0.7490196, 0, 1,
-1.215372, 1.072653, -0.1821445, 1, 0.7568628, 0, 1,
-1.210919, -0.3742536, -1.087745, 1, 0.7607843, 0, 1,
-1.209778, 0.7228094, -0.38687, 1, 0.7686275, 0, 1,
-1.209398, -0.8359031, -2.951398, 1, 0.772549, 0, 1,
-1.208714, -3.049772, -0.8518598, 1, 0.7803922, 0, 1,
-1.20432, 0.518371, -0.31575, 1, 0.7843137, 0, 1,
-1.202044, -0.807582, -0.5973424, 1, 0.7921569, 0, 1,
-1.201498, 0.6699783, -0.6386648, 1, 0.7960784, 0, 1,
-1.199706, 0.08019353, -3.251669, 1, 0.8039216, 0, 1,
-1.196811, 0.5391476, -3.959767, 1, 0.8117647, 0, 1,
-1.190986, 0.2705537, -2.756176, 1, 0.8156863, 0, 1,
-1.178522, 0.7018554, -1.50622, 1, 0.8235294, 0, 1,
-1.169874, 0.3880286, -1.430839, 1, 0.827451, 0, 1,
-1.158632, 0.09471041, -2.590914, 1, 0.8352941, 0, 1,
-1.148498, -0.9436067, -1.606393, 1, 0.8392157, 0, 1,
-1.131923, 0.3633077, -1.761154, 1, 0.8470588, 0, 1,
-1.131101, 0.7971711, 0.6355793, 1, 0.8509804, 0, 1,
-1.129453, 0.1266055, 0.5055561, 1, 0.8588235, 0, 1,
-1.119975, -2.18444, -1.530799, 1, 0.8627451, 0, 1,
-1.112763, 0.3353797, -1.079141, 1, 0.8705882, 0, 1,
-1.112763, 0.5677487, -0.6460274, 1, 0.8745098, 0, 1,
-1.110819, -0.02704667, -0.4892507, 1, 0.8823529, 0, 1,
-1.105138, 0.2486244, -0.9347987, 1, 0.8862745, 0, 1,
-1.105061, -0.3588268, -1.145302, 1, 0.8941177, 0, 1,
-1.104818, -0.4141919, -4.199709, 1, 0.8980392, 0, 1,
-1.099219, 1.50864, -2.454598, 1, 0.9058824, 0, 1,
-1.097838, -1.511265, -2.791517, 1, 0.9137255, 0, 1,
-1.091045, 0.04016125, -1.71142, 1, 0.9176471, 0, 1,
-1.08538, 0.8653146, -1.446044, 1, 0.9254902, 0, 1,
-1.080237, -0.8337405, -1.540798, 1, 0.9294118, 0, 1,
-1.074875, -0.01371675, -1.314373, 1, 0.9372549, 0, 1,
-1.070121, -1.714029, -3.300559, 1, 0.9411765, 0, 1,
-1.057023, -0.3072574, -2.3057, 1, 0.9490196, 0, 1,
-1.05135, -0.6024294, -2.485492, 1, 0.9529412, 0, 1,
-1.050408, 0.1362108, -1.667591, 1, 0.9607843, 0, 1,
-1.043912, 0.2352376, 0.3687781, 1, 0.9647059, 0, 1,
-1.039848, 0.043624, -1.366299, 1, 0.972549, 0, 1,
-1.036873, 1.255153, -2.00943, 1, 0.9764706, 0, 1,
-1.036601, -0.8865828, -3.527485, 1, 0.9843137, 0, 1,
-1.035022, -0.9539717, -2.398483, 1, 0.9882353, 0, 1,
-1.031493, 1.037633, -0.3711289, 1, 0.9960784, 0, 1,
-1.020763, -0.5484689, -3.195685, 0.9960784, 1, 0, 1,
-1.020228, -0.134969, -3.108444, 0.9921569, 1, 0, 1,
-1.013539, -1.149156, -2.492308, 0.9843137, 1, 0, 1,
-1.007157, -0.1937879, -1.218591, 0.9803922, 1, 0, 1,
-1.006235, 0.4094085, -2.209275, 0.972549, 1, 0, 1,
-0.9936529, 0.5199968, 0.9636738, 0.9686275, 1, 0, 1,
-0.9932423, 0.245556, -1.537083, 0.9607843, 1, 0, 1,
-0.9876707, -1.06251, -2.563359, 0.9568627, 1, 0, 1,
-0.9857588, -0.3746254, -2.155512, 0.9490196, 1, 0, 1,
-0.9778699, 1.09145, 0.5555195, 0.945098, 1, 0, 1,
-0.9765826, -0.9835911, -2.470663, 0.9372549, 1, 0, 1,
-0.9756643, 0.89093, -1.106252, 0.9333333, 1, 0, 1,
-0.9479895, -0.1130627, -1.865874, 0.9254902, 1, 0, 1,
-0.9471208, -0.1128527, -2.122597, 0.9215686, 1, 0, 1,
-0.9390551, -0.7167705, -0.378228, 0.9137255, 1, 0, 1,
-0.9389427, 0.6345654, -0.4343436, 0.9098039, 1, 0, 1,
-0.9258268, -1.724594, -1.785112, 0.9019608, 1, 0, 1,
-0.9229162, 0.3766559, -2.013277, 0.8941177, 1, 0, 1,
-0.9166417, -1.51841, -2.193085, 0.8901961, 1, 0, 1,
-0.9134473, 0.9610807, 0.2171306, 0.8823529, 1, 0, 1,
-0.9125669, -0.3436742, -3.219562, 0.8784314, 1, 0, 1,
-0.9089705, 0.8998439, -0.3410244, 0.8705882, 1, 0, 1,
-0.9074414, -2.117619, -1.794254, 0.8666667, 1, 0, 1,
-0.9062969, 1.063092, -0.5700533, 0.8588235, 1, 0, 1,
-0.90176, 1.520842, 0.5235387, 0.854902, 1, 0, 1,
-0.8999264, -0.1748178, -1.608106, 0.8470588, 1, 0, 1,
-0.89727, 1.381948, -0.5085905, 0.8431373, 1, 0, 1,
-0.8962609, -0.25001, -2.274438, 0.8352941, 1, 0, 1,
-0.8957062, 0.356715, -2.756772, 0.8313726, 1, 0, 1,
-0.8948008, 0.8703291, -0.420433, 0.8235294, 1, 0, 1,
-0.8861313, -1.545339, -1.752589, 0.8196079, 1, 0, 1,
-0.8766358, 0.5045251, -2.39509, 0.8117647, 1, 0, 1,
-0.8665062, -1.669068, -4.231131, 0.8078431, 1, 0, 1,
-0.8661821, 0.7500523, -0.8774208, 0.8, 1, 0, 1,
-0.8646479, -0.4923749, -2.104881, 0.7921569, 1, 0, 1,
-0.8634913, -1.148066, -1.593998, 0.7882353, 1, 0, 1,
-0.8556257, -0.9020395, -3.588308, 0.7803922, 1, 0, 1,
-0.8530515, 0.2383288, -1.530758, 0.7764706, 1, 0, 1,
-0.8526746, 0.687887, -0.839753, 0.7686275, 1, 0, 1,
-0.8477171, -0.3136253, -1.83423, 0.7647059, 1, 0, 1,
-0.847603, 0.7894145, -2.188348, 0.7568628, 1, 0, 1,
-0.8417782, -0.114106, -1.365929, 0.7529412, 1, 0, 1,
-0.8347102, -0.7683384, -2.016911, 0.7450981, 1, 0, 1,
-0.8312023, 1.846592, 0.433359, 0.7411765, 1, 0, 1,
-0.8295072, 2.312186, -1.60032, 0.7333333, 1, 0, 1,
-0.8277383, 1.17139, 0.6000085, 0.7294118, 1, 0, 1,
-0.8257767, -0.5099818, -1.416184, 0.7215686, 1, 0, 1,
-0.8215396, -1.483243, -3.267287, 0.7176471, 1, 0, 1,
-0.8192225, -2.537603, -3.332545, 0.7098039, 1, 0, 1,
-0.8158748, -0.8864406, -2.183203, 0.7058824, 1, 0, 1,
-0.8130125, 0.8571435, -0.8300631, 0.6980392, 1, 0, 1,
-0.8117468, -1.576589, -2.043091, 0.6901961, 1, 0, 1,
-0.8086475, -0.4816462, -0.1160236, 0.6862745, 1, 0, 1,
-0.8076292, 1.15413, -1.526469, 0.6784314, 1, 0, 1,
-0.7993174, -1.335959, -2.979779, 0.6745098, 1, 0, 1,
-0.7980803, -0.3688785, -2.404333, 0.6666667, 1, 0, 1,
-0.7979485, -0.3958101, -2.425983, 0.6627451, 1, 0, 1,
-0.7975908, -0.1689266, -2.62199, 0.654902, 1, 0, 1,
-0.7824308, -0.8428685, -5.448269, 0.6509804, 1, 0, 1,
-0.7809879, 0.03876989, -1.968373, 0.6431373, 1, 0, 1,
-0.7788687, -0.884758, -3.181305, 0.6392157, 1, 0, 1,
-0.7785836, -0.03675271, -0.4424442, 0.6313726, 1, 0, 1,
-0.7748148, -0.06297093, -2.38396, 0.627451, 1, 0, 1,
-0.7689309, -1.683738, -4.279892, 0.6196079, 1, 0, 1,
-0.7672864, 1.697458, -0.03398459, 0.6156863, 1, 0, 1,
-0.7636849, 0.5330421, -0.9322885, 0.6078432, 1, 0, 1,
-0.7617592, -1.987927, -2.719748, 0.6039216, 1, 0, 1,
-0.7597494, 0.09691421, -1.193693, 0.5960785, 1, 0, 1,
-0.7584162, 1.854772, -0.6467847, 0.5882353, 1, 0, 1,
-0.7573217, 0.7109368, -0.6943231, 0.5843138, 1, 0, 1,
-0.7502899, 0.2659451, -0.07111349, 0.5764706, 1, 0, 1,
-0.746293, 0.6667567, 0.1660929, 0.572549, 1, 0, 1,
-0.7441953, 1.294181, -0.2330541, 0.5647059, 1, 0, 1,
-0.7437712, 1.887273, -2.202889, 0.5607843, 1, 0, 1,
-0.7435716, -0.5473268, -2.857447, 0.5529412, 1, 0, 1,
-0.7261858, -0.4047881, -2.729722, 0.5490196, 1, 0, 1,
-0.7229755, 0.7801578, -0.1244432, 0.5411765, 1, 0, 1,
-0.7213393, 0.8515815, -1.269393, 0.5372549, 1, 0, 1,
-0.7205198, 0.1686692, -1.25578, 0.5294118, 1, 0, 1,
-0.7172989, -1.624994, -3.081965, 0.5254902, 1, 0, 1,
-0.7124279, -0.3379126, -1.190437, 0.5176471, 1, 0, 1,
-0.7116034, -0.09970511, -3.211259, 0.5137255, 1, 0, 1,
-0.70935, -0.4262999, -3.098236, 0.5058824, 1, 0, 1,
-0.7015649, -0.5265695, -2.594857, 0.5019608, 1, 0, 1,
-0.6995101, -0.02842473, -1.432578, 0.4941176, 1, 0, 1,
-0.6992882, 0.4808441, -0.8483031, 0.4862745, 1, 0, 1,
-0.6989448, 1.74822, 1.090885, 0.4823529, 1, 0, 1,
-0.6989263, 1.276652, -0.6961628, 0.4745098, 1, 0, 1,
-0.6986092, 0.8431202, -0.2838117, 0.4705882, 1, 0, 1,
-0.6974372, 0.6888939, 0.7706692, 0.4627451, 1, 0, 1,
-0.6905805, -0.9782558, -1.790381, 0.4588235, 1, 0, 1,
-0.6842233, -1.423298, -4.857076, 0.4509804, 1, 0, 1,
-0.68038, -1.956004, -4.482929, 0.4470588, 1, 0, 1,
-0.6801092, -0.03727767, -2.663589, 0.4392157, 1, 0, 1,
-0.677823, -1.648323, -0.9424658, 0.4352941, 1, 0, 1,
-0.6774871, -0.826367, -0.1200893, 0.427451, 1, 0, 1,
-0.6773845, 0.9757363, 0.5446437, 0.4235294, 1, 0, 1,
-0.6770048, 1.980507, -1.238339, 0.4156863, 1, 0, 1,
-0.6736163, -0.9039345, -3.280778, 0.4117647, 1, 0, 1,
-0.671998, 0.3115369, 1.201436, 0.4039216, 1, 0, 1,
-0.6649703, -0.6878051, -2.119853, 0.3960784, 1, 0, 1,
-0.6628472, -1.592347, -5.170717, 0.3921569, 1, 0, 1,
-0.6615421, -0.2733202, -1.799337, 0.3843137, 1, 0, 1,
-0.6556545, 0.1231703, -1.631731, 0.3803922, 1, 0, 1,
-0.6506891, -0.5306518, -0.0921952, 0.372549, 1, 0, 1,
-0.641732, -0.4975077, -1.927649, 0.3686275, 1, 0, 1,
-0.637126, 0.2667069, -1.702739, 0.3607843, 1, 0, 1,
-0.6330531, -1.082077, -2.951396, 0.3568628, 1, 0, 1,
-0.6319896, -0.3773483, -1.53875, 0.3490196, 1, 0, 1,
-0.6317095, -0.9666883, -2.680425, 0.345098, 1, 0, 1,
-0.6273082, 1.625405, -0.6145425, 0.3372549, 1, 0, 1,
-0.6257853, 0.1386934, -0.6799124, 0.3333333, 1, 0, 1,
-0.6251264, 1.40858, 0.5668941, 0.3254902, 1, 0, 1,
-0.6180313, 0.5994537, -1.559013, 0.3215686, 1, 0, 1,
-0.6066113, 1.05188, 0.5183294, 0.3137255, 1, 0, 1,
-0.6043902, 0.09626362, -2.088993, 0.3098039, 1, 0, 1,
-0.6025969, -0.4185219, -1.386563, 0.3019608, 1, 0, 1,
-0.600305, -1.106726, -2.642287, 0.2941177, 1, 0, 1,
-0.5962422, -0.277055, -2.065768, 0.2901961, 1, 0, 1,
-0.5938988, -0.9243891, -3.073369, 0.282353, 1, 0, 1,
-0.5935951, -0.6336061, -1.281482, 0.2784314, 1, 0, 1,
-0.5927905, -0.1268509, -0.8030955, 0.2705882, 1, 0, 1,
-0.5908521, -0.06450126, -1.334815, 0.2666667, 1, 0, 1,
-0.5874364, -0.009121671, -2.147085, 0.2588235, 1, 0, 1,
-0.5836667, 1.259967, -2.71851, 0.254902, 1, 0, 1,
-0.5819681, -0.7466776, -1.91693, 0.2470588, 1, 0, 1,
-0.5782627, 0.1548834, -1.325153, 0.2431373, 1, 0, 1,
-0.5746455, -1.790352, -2.298699, 0.2352941, 1, 0, 1,
-0.5725501, -0.6074065, -3.772053, 0.2313726, 1, 0, 1,
-0.5710755, 0.6096717, -0.6076392, 0.2235294, 1, 0, 1,
-0.5691511, 0.1125115, -0.9378491, 0.2196078, 1, 0, 1,
-0.5663343, 1.549237, 0.5943744, 0.2117647, 1, 0, 1,
-0.5643502, -0.5358489, -2.744662, 0.2078431, 1, 0, 1,
-0.5608169, -0.5179597, -1.571363, 0.2, 1, 0, 1,
-0.5597987, 2.079771, -0.04466926, 0.1921569, 1, 0, 1,
-0.5570129, 1.506383, 0.1258184, 0.1882353, 1, 0, 1,
-0.5526366, 0.607857, -2.22189, 0.1803922, 1, 0, 1,
-0.5524417, -0.9118726, -1.180858, 0.1764706, 1, 0, 1,
-0.5517406, 0.5267874, -0.7163494, 0.1686275, 1, 0, 1,
-0.5517284, 1.25853, -1.183457, 0.1647059, 1, 0, 1,
-0.5498006, 0.1679284, 0.05854995, 0.1568628, 1, 0, 1,
-0.5496536, -0.9563895, -3.520195, 0.1529412, 1, 0, 1,
-0.5490707, -0.4629, -1.042856, 0.145098, 1, 0, 1,
-0.5479741, -2.245002, -3.311574, 0.1411765, 1, 0, 1,
-0.5433311, 1.393235, -0.6806079, 0.1333333, 1, 0, 1,
-0.5410586, 0.7873561, 0.6285307, 0.1294118, 1, 0, 1,
-0.540238, -0.4656993, -4.14522, 0.1215686, 1, 0, 1,
-0.5395707, 0.2429601, -1.296355, 0.1176471, 1, 0, 1,
-0.5345021, 0.4904419, 0.4596538, 0.1098039, 1, 0, 1,
-0.5320382, -0.1801029, -2.358004, 0.1058824, 1, 0, 1,
-0.5259027, 0.6693625, -1.174165, 0.09803922, 1, 0, 1,
-0.5173299, -1.61634, -2.619761, 0.09019608, 1, 0, 1,
-0.5144404, -1.898624, -2.845493, 0.08627451, 1, 0, 1,
-0.4979641, -1.449321, -2.428889, 0.07843138, 1, 0, 1,
-0.4893532, 0.1316577, -1.225343, 0.07450981, 1, 0, 1,
-0.489172, 1.746806, 0.2421737, 0.06666667, 1, 0, 1,
-0.4857692, 0.9808141, -2.680782, 0.0627451, 1, 0, 1,
-0.4855295, 0.05913117, -0.4225727, 0.05490196, 1, 0, 1,
-0.4808459, -0.7059563, -2.309951, 0.05098039, 1, 0, 1,
-0.477146, 0.1209848, -2.111372, 0.04313726, 1, 0, 1,
-0.476219, -1.013492, -5.435152, 0.03921569, 1, 0, 1,
-0.4513228, 0.01739227, -0.4635305, 0.03137255, 1, 0, 1,
-0.4439584, 0.1175891, -1.992084, 0.02745098, 1, 0, 1,
-0.4403867, 1.220091, -0.9861605, 0.01960784, 1, 0, 1,
-0.4380996, -0.1814189, -1.789436, 0.01568628, 1, 0, 1,
-0.4359418, -0.05105984, -2.709807, 0.007843138, 1, 0, 1,
-0.4307136, 0.3993165, -0.32548, 0.003921569, 1, 0, 1,
-0.4296051, -0.7410802, -3.958639, 0, 1, 0.003921569, 1,
-0.4291908, -0.3052565, -1.906437, 0, 1, 0.01176471, 1,
-0.427085, 0.06164859, 0.2571526, 0, 1, 0.01568628, 1,
-0.4243019, -0.339458, -4.281035, 0, 1, 0.02352941, 1,
-0.4236746, -0.8251752, -2.861486, 0, 1, 0.02745098, 1,
-0.4236234, -0.326014, -0.7099808, 0, 1, 0.03529412, 1,
-0.4234989, 1.540769, -0.07902499, 0, 1, 0.03921569, 1,
-0.4213093, 0.7009034, -0.4516802, 0, 1, 0.04705882, 1,
-0.4186352, -1.173205, -1.185958, 0, 1, 0.05098039, 1,
-0.4184711, -0.9931875, -2.93187, 0, 1, 0.05882353, 1,
-0.4154636, -0.5699977, -0.2386679, 0, 1, 0.0627451, 1,
-0.4154105, 0.2561228, -2.234447, 0, 1, 0.07058824, 1,
-0.4149697, 0.7675857, -1.31849, 0, 1, 0.07450981, 1,
-0.4147236, 0.03766028, -2.40779, 0, 1, 0.08235294, 1,
-0.410777, 0.8498937, -1.542171, 0, 1, 0.08627451, 1,
-0.4063934, -0.537289, -4.059621, 0, 1, 0.09411765, 1,
-0.4056737, -0.6005668, -2.400971, 0, 1, 0.1019608, 1,
-0.4029795, 0.9023128, -1.131877, 0, 1, 0.1058824, 1,
-0.3994717, -0.4978525, -1.777609, 0, 1, 0.1137255, 1,
-0.3980031, 0.3883379, 0.1413197, 0, 1, 0.1176471, 1,
-0.3968149, 0.7330669, 0.55642, 0, 1, 0.1254902, 1,
-0.3923676, 0.6671215, -0.1533083, 0, 1, 0.1294118, 1,
-0.3919389, -0.1457856, -2.611593, 0, 1, 0.1372549, 1,
-0.3847106, 0.5753018, -0.5672508, 0, 1, 0.1411765, 1,
-0.384194, 0.7963962, -2.0518, 0, 1, 0.1490196, 1,
-0.3836067, 0.2472966, -0.495479, 0, 1, 0.1529412, 1,
-0.3824578, 0.1003835, -1.232916, 0, 1, 0.1607843, 1,
-0.379723, 1.267599, 0.7224779, 0, 1, 0.1647059, 1,
-0.3790223, 0.8604825, -1.121604, 0, 1, 0.172549, 1,
-0.37525, 0.1650216, 0.2322671, 0, 1, 0.1764706, 1,
-0.3747367, -1.03646, -3.870946, 0, 1, 0.1843137, 1,
-0.3732096, -0.5207105, -1.780748, 0, 1, 0.1882353, 1,
-0.3715544, 1.260227, -0.5003204, 0, 1, 0.1960784, 1,
-0.3715485, 0.6685979, -1.310478, 0, 1, 0.2039216, 1,
-0.3646685, 0.6013364, -0.8984381, 0, 1, 0.2078431, 1,
-0.3633365, 0.8696607, -0.01635217, 0, 1, 0.2156863, 1,
-0.3614959, -0.1858631, -2.026234, 0, 1, 0.2196078, 1,
-0.3613022, -0.7380083, -3.269842, 0, 1, 0.227451, 1,
-0.3598137, -0.6268425, -3.662299, 0, 1, 0.2313726, 1,
-0.3552797, 0.406203, -0.4720879, 0, 1, 0.2392157, 1,
-0.3467139, 0.4722038, -0.6978523, 0, 1, 0.2431373, 1,
-0.3466069, 0.6371294, 0.3433304, 0, 1, 0.2509804, 1,
-0.3446758, 0.2563076, 0.7077922, 0, 1, 0.254902, 1,
-0.3423903, 1.207775, 0.8350642, 0, 1, 0.2627451, 1,
-0.3422722, -1.837807, -4.392664, 0, 1, 0.2666667, 1,
-0.3416984, 1.072684, 0.5760498, 0, 1, 0.2745098, 1,
-0.3401695, 1.755736, -0.5128663, 0, 1, 0.2784314, 1,
-0.3387267, -0.1339241, -3.536051, 0, 1, 0.2862745, 1,
-0.3346718, -0.4653221, -3.024632, 0, 1, 0.2901961, 1,
-0.3339131, 1.365605, 0.3069442, 0, 1, 0.2980392, 1,
-0.3303351, -1.201152, -3.551149, 0, 1, 0.3058824, 1,
-0.3302663, 0.6216254, 0.3876754, 0, 1, 0.3098039, 1,
-0.3302257, 0.5666195, -0.4229028, 0, 1, 0.3176471, 1,
-0.3298706, -0.1605877, -1.919376, 0, 1, 0.3215686, 1,
-0.3290062, 0.7752917, -0.04204195, 0, 1, 0.3294118, 1,
-0.3279658, 1.873675, -0.07522339, 0, 1, 0.3333333, 1,
-0.3272513, -1.312778, -2.329229, 0, 1, 0.3411765, 1,
-0.3271343, 1.312769, -0.6029984, 0, 1, 0.345098, 1,
-0.3260141, -2.046121, -1.577857, 0, 1, 0.3529412, 1,
-0.3259854, 0.8446672, -0.6251926, 0, 1, 0.3568628, 1,
-0.3229885, 1.056006, 0.0307641, 0, 1, 0.3647059, 1,
-0.3202175, 0.1620338, -1.643791, 0, 1, 0.3686275, 1,
-0.3194993, 1.024378, -0.1058623, 0, 1, 0.3764706, 1,
-0.3179395, -0.1363601, -2.406318, 0, 1, 0.3803922, 1,
-0.3097296, 0.3862519, -0.8793634, 0, 1, 0.3882353, 1,
-0.3093666, -0.4724575, -3.542103, 0, 1, 0.3921569, 1,
-0.3035704, 1.185379, 1.383764, 0, 1, 0.4, 1,
-0.3005844, -0.8290424, -3.166086, 0, 1, 0.4078431, 1,
-0.2977503, -0.01723818, -1.619762, 0, 1, 0.4117647, 1,
-0.295244, 1.007807, 0.3117792, 0, 1, 0.4196078, 1,
-0.2940447, 0.6427795, 0.6807669, 0, 1, 0.4235294, 1,
-0.2932106, 1.694812, -2.697649, 0, 1, 0.4313726, 1,
-0.2931447, -0.9532831, -2.636892, 0, 1, 0.4352941, 1,
-0.2926957, 1.730793, -0.6113972, 0, 1, 0.4431373, 1,
-0.2920365, -1.727751, -3.500493, 0, 1, 0.4470588, 1,
-0.2910437, -1.285828, -3.44087, 0, 1, 0.454902, 1,
-0.290677, 0.4694308, -0.005608721, 0, 1, 0.4588235, 1,
-0.2906491, 0.5761797, -2.274236, 0, 1, 0.4666667, 1,
-0.2894355, -0.5570871, -2.799562, 0, 1, 0.4705882, 1,
-0.2866985, -0.8221555, -2.044735, 0, 1, 0.4784314, 1,
-0.2775637, -0.06678268, -0.7076862, 0, 1, 0.4823529, 1,
-0.2731755, 2.003783, -0.02625465, 0, 1, 0.4901961, 1,
-0.2725421, -0.6156292, -2.972834, 0, 1, 0.4941176, 1,
-0.2710054, -1.972562, -2.40299, 0, 1, 0.5019608, 1,
-0.2698118, -0.02555175, -1.499626, 0, 1, 0.509804, 1,
-0.2697913, 0.4804613, 0.4871542, 0, 1, 0.5137255, 1,
-0.2647902, 0.6549929, 0.7309002, 0, 1, 0.5215687, 1,
-0.2608321, 0.4481814, 0.06952079, 0, 1, 0.5254902, 1,
-0.2578472, 2.092551, 2.589745, 0, 1, 0.5333334, 1,
-0.2576694, -0.7604332, -4.151274, 0, 1, 0.5372549, 1,
-0.2550808, 0.7980915, -1.01278, 0, 1, 0.5450981, 1,
-0.2505964, 0.3431998, -1.590593, 0, 1, 0.5490196, 1,
-0.2492041, -0.4463904, -2.805013, 0, 1, 0.5568628, 1,
-0.2484517, 0.6620926, -0.1048027, 0, 1, 0.5607843, 1,
-0.2456014, 1.265649, -0.8342128, 0, 1, 0.5686275, 1,
-0.2454482, 0.6703997, -0.4473521, 0, 1, 0.572549, 1,
-0.2416969, 0.7118449, -0.2000956, 0, 1, 0.5803922, 1,
-0.2348873, 0.8967934, -0.1997707, 0, 1, 0.5843138, 1,
-0.2287172, -1.731382, -3.835391, 0, 1, 0.5921569, 1,
-0.2264883, 1.417132, -1.869563, 0, 1, 0.5960785, 1,
-0.226037, -1.310298, -3.957252, 0, 1, 0.6039216, 1,
-0.225617, 0.7537133, 0.2358339, 0, 1, 0.6117647, 1,
-0.2192873, -1.100729, -2.643068, 0, 1, 0.6156863, 1,
-0.1999084, -1.54321, -3.662257, 0, 1, 0.6235294, 1,
-0.1970748, -0.1892659, -2.047327, 0, 1, 0.627451, 1,
-0.1969923, 0.3753054, 0.2580484, 0, 1, 0.6352941, 1,
-0.1851752, 0.6126325, -1.11159, 0, 1, 0.6392157, 1,
-0.1844221, 1.808179, -0.4641018, 0, 1, 0.6470588, 1,
-0.1821104, 0.722547, -0.2945581, 0, 1, 0.6509804, 1,
-0.1790627, 1.905181, -0.4110736, 0, 1, 0.6588235, 1,
-0.1745831, 0.7252922, -0.8760927, 0, 1, 0.6627451, 1,
-0.1739928, -0.360848, -3.471704, 0, 1, 0.6705883, 1,
-0.1733928, -0.09369504, -1.382338, 0, 1, 0.6745098, 1,
-0.1733742, -1.787906, -3.102942, 0, 1, 0.682353, 1,
-0.1729138, -0.7339391, -3.727924, 0, 1, 0.6862745, 1,
-0.1711381, -1.954738, -3.483477, 0, 1, 0.6941177, 1,
-0.1705012, -0.7561942, -3.167985, 0, 1, 0.7019608, 1,
-0.1694132, 1.345807, 0.9028203, 0, 1, 0.7058824, 1,
-0.1637691, 1.049898, 0.1674372, 0, 1, 0.7137255, 1,
-0.1591246, -0.7269364, -4.41835, 0, 1, 0.7176471, 1,
-0.1561522, 0.9864184, -1.003132, 0, 1, 0.7254902, 1,
-0.1554465, 0.2300079, -1.476839, 0, 1, 0.7294118, 1,
-0.1466804, -0.2796589, -1.046418, 0, 1, 0.7372549, 1,
-0.1445918, 1.312045, -0.2374978, 0, 1, 0.7411765, 1,
-0.1294187, 0.6925417, -0.9527941, 0, 1, 0.7490196, 1,
-0.1268263, -0.8038381, -1.709464, 0, 1, 0.7529412, 1,
-0.1260058, -0.209477, -4.703485, 0, 1, 0.7607843, 1,
-0.125794, -1.416241, -4.594175, 0, 1, 0.7647059, 1,
-0.1201013, -1.50914, -2.983017, 0, 1, 0.772549, 1,
-0.1150127, -0.7701165, -4.086519, 0, 1, 0.7764706, 1,
-0.1143137, 1.594607, -1.823866, 0, 1, 0.7843137, 1,
-0.112229, -0.1941491, -2.315926, 0, 1, 0.7882353, 1,
-0.1080251, 0.477175, -1.804131, 0, 1, 0.7960784, 1,
-0.1028885, -0.2975653, -2.883379, 0, 1, 0.8039216, 1,
-0.1008655, -0.7819799, -3.767304, 0, 1, 0.8078431, 1,
-0.09669328, 0.487295, -1.022145, 0, 1, 0.8156863, 1,
-0.0948112, -0.240412, -1.989005, 0, 1, 0.8196079, 1,
-0.09353505, 0.5261116, -1.879835, 0, 1, 0.827451, 1,
-0.08247459, 0.4711962, 0.3610562, 0, 1, 0.8313726, 1,
-0.07913464, -0.7346584, -3.750551, 0, 1, 0.8392157, 1,
-0.07907453, -0.4425647, -4.230489, 0, 1, 0.8431373, 1,
-0.07070693, 0.2403928, -0.4184873, 0, 1, 0.8509804, 1,
-0.06781434, -0.1663459, -4.257132, 0, 1, 0.854902, 1,
-0.06731278, -0.04532041, -2.799127, 0, 1, 0.8627451, 1,
-0.06634884, -1.80351, -4.091231, 0, 1, 0.8666667, 1,
-0.06467602, 0.4931506, 0.4743117, 0, 1, 0.8745098, 1,
-0.06374599, 1.014444, -0.7766227, 0, 1, 0.8784314, 1,
-0.06030545, -0.8234336, -2.470575, 0, 1, 0.8862745, 1,
-0.05995924, -1.436241, -2.738878, 0, 1, 0.8901961, 1,
-0.05622108, 1.642947, 0.2871465, 0, 1, 0.8980392, 1,
-0.0557978, 0.1901108, 0.0003306337, 0, 1, 0.9058824, 1,
-0.05329432, -0.4034887, -2.331155, 0, 1, 0.9098039, 1,
-0.05292789, -1.031095, -4.568518, 0, 1, 0.9176471, 1,
-0.05227723, 0.5457589, -1.89935, 0, 1, 0.9215686, 1,
-0.0521641, 0.8456465, -1.325171, 0, 1, 0.9294118, 1,
-0.05076708, 1.272045, 2.106324, 0, 1, 0.9333333, 1,
-0.04572111, -2.140635, -2.704587, 0, 1, 0.9411765, 1,
-0.0445293, -1.049875, -3.152314, 0, 1, 0.945098, 1,
-0.04319643, -0.1854625, -2.786869, 0, 1, 0.9529412, 1,
-0.03973718, -0.185941, -2.671142, 0, 1, 0.9568627, 1,
-0.03818146, -0.7043664, -3.391474, 0, 1, 0.9647059, 1,
-0.03742865, 1.395422, -0.6510837, 0, 1, 0.9686275, 1,
-0.03694073, 0.400587, 0.6294758, 0, 1, 0.9764706, 1,
-0.03539544, -1.538728, -3.157864, 0, 1, 0.9803922, 1,
-0.03214023, -0.1699858, -1.318143, 0, 1, 0.9882353, 1,
-0.02319144, -1.101403, -3.868223, 0, 1, 0.9921569, 1,
-0.02222333, 0.6502654, -1.035502, 0, 1, 1, 1,
-0.02060951, -0.007664502, -3.179586, 0, 0.9921569, 1, 1,
-0.02055335, 0.1195491, 0.1028589, 0, 0.9882353, 1, 1,
-0.01904277, 1.126115, 0.7284129, 0, 0.9803922, 1, 1,
-0.01830259, 0.3689452, -0.6209706, 0, 0.9764706, 1, 1,
-0.01474072, 1.757221, -0.3153068, 0, 0.9686275, 1, 1,
-0.0141566, -0.04088169, -3.334329, 0, 0.9647059, 1, 1,
-0.01314934, 0.08833176, -0.7614005, 0, 0.9568627, 1, 1,
-0.01164475, 0.1945082, -0.3871683, 0, 0.9529412, 1, 1,
-0.007264308, -0.5867278, -4.03042, 0, 0.945098, 1, 1,
-0.007150383, -0.2126201, -2.659178, 0, 0.9411765, 1, 1,
-0.004733023, 0.02102043, -0.5246696, 0, 0.9333333, 1, 1,
-0.004221973, -0.9667735, -2.179084, 0, 0.9294118, 1, 1,
0.002775919, -0.4621017, 5.283186, 0, 0.9215686, 1, 1,
0.004302483, 0.94938, 0.6353847, 0, 0.9176471, 1, 1,
0.005499559, -1.239462, 3.291024, 0, 0.9098039, 1, 1,
0.007360416, 0.184088, -1.059088, 0, 0.9058824, 1, 1,
0.007851284, -0.02700525, 1.075281, 0, 0.8980392, 1, 1,
0.009675817, 0.3697827, 0.1631984, 0, 0.8901961, 1, 1,
0.009689504, -0.9065753, 4.040876, 0, 0.8862745, 1, 1,
0.01678786, 0.6725041, 0.1304144, 0, 0.8784314, 1, 1,
0.01718671, -0.8934628, 1.976673, 0, 0.8745098, 1, 1,
0.01842233, 0.2153957, 0.8296822, 0, 0.8666667, 1, 1,
0.01976009, -0.1664011, 1.356821, 0, 0.8627451, 1, 1,
0.02055668, -0.5437914, 4.296142, 0, 0.854902, 1, 1,
0.02295145, -0.5365369, 5.168029, 0, 0.8509804, 1, 1,
0.02308807, -1.9821, 1.728213, 0, 0.8431373, 1, 1,
0.02328075, 0.2188427, 1.192887, 0, 0.8392157, 1, 1,
0.03286411, 1.004378, 0.9957284, 0, 0.8313726, 1, 1,
0.03405044, -0.9323087, 4.093135, 0, 0.827451, 1, 1,
0.03427616, -0.3614494, 3.611772, 0, 0.8196079, 1, 1,
0.0367245, -1.038369, 1.298171, 0, 0.8156863, 1, 1,
0.037657, -0.2293525, 2.996383, 0, 0.8078431, 1, 1,
0.03943118, 0.8653123, -1.496426, 0, 0.8039216, 1, 1,
0.04424943, 0.2281369, 0.8894047, 0, 0.7960784, 1, 1,
0.04666349, -0.1672123, 4.518307, 0, 0.7882353, 1, 1,
0.0468798, -0.1704878, 1.754476, 0, 0.7843137, 1, 1,
0.05032786, -1.424708, 5.039026, 0, 0.7764706, 1, 1,
0.05254559, 0.746234, -0.5784014, 0, 0.772549, 1, 1,
0.05363115, 3.340955, 1.411869, 0, 0.7647059, 1, 1,
0.0549938, -0.6787492, 2.876514, 0, 0.7607843, 1, 1,
0.05946203, -1.495658, 2.954302, 0, 0.7529412, 1, 1,
0.06074968, -0.6855517, 3.743268, 0, 0.7490196, 1, 1,
0.06288412, 0.9947352, -1.96295, 0, 0.7411765, 1, 1,
0.07071762, -0.3988782, 1.935533, 0, 0.7372549, 1, 1,
0.07437225, -1.819274, 2.741768, 0, 0.7294118, 1, 1,
0.07532867, -0.7571607, 1.532446, 0, 0.7254902, 1, 1,
0.0771059, -0.85028, 4.27677, 0, 0.7176471, 1, 1,
0.07907644, 0.3654, 0.08492842, 0, 0.7137255, 1, 1,
0.07965259, -0.2381991, 3.928519, 0, 0.7058824, 1, 1,
0.08087234, -1.363156, 3.052422, 0, 0.6980392, 1, 1,
0.08914687, -0.4489924, 2.163929, 0, 0.6941177, 1, 1,
0.08922568, -0.6716832, 1.127317, 0, 0.6862745, 1, 1,
0.09498596, -0.8324184, 2.416416, 0, 0.682353, 1, 1,
0.09595662, 1.748285, -0.3407729, 0, 0.6745098, 1, 1,
0.09791161, 0.2993749, 1.707212, 0, 0.6705883, 1, 1,
0.1028311, -0.2111967, 3.743889, 0, 0.6627451, 1, 1,
0.1031233, 1.037379, -0.1074967, 0, 0.6588235, 1, 1,
0.1035723, -0.5118971, 3.677558, 0, 0.6509804, 1, 1,
0.1071702, -0.6434875, 2.914974, 0, 0.6470588, 1, 1,
0.1082364, -1.385045, 3.182238, 0, 0.6392157, 1, 1,
0.1096569, -0.368128, 3.977791, 0, 0.6352941, 1, 1,
0.1102213, -0.06563731, 2.621001, 0, 0.627451, 1, 1,
0.1103311, 0.2435762, -0.1382837, 0, 0.6235294, 1, 1,
0.1146301, -0.5153439, 1.683486, 0, 0.6156863, 1, 1,
0.1168472, 0.21375, 1.383918, 0, 0.6117647, 1, 1,
0.1205492, -1.911107, 2.975763, 0, 0.6039216, 1, 1,
0.1217959, -0.7166742, 2.217815, 0, 0.5960785, 1, 1,
0.1250313, -0.04381936, 3.543876, 0, 0.5921569, 1, 1,
0.1270167, -0.1619982, 2.392005, 0, 0.5843138, 1, 1,
0.1285991, 0.211145, 0.3753563, 0, 0.5803922, 1, 1,
0.1288241, 0.5859587, 0.1720582, 0, 0.572549, 1, 1,
0.1321853, -1.447581, 2.125221, 0, 0.5686275, 1, 1,
0.1366251, -2.073431, 3.344486, 0, 0.5607843, 1, 1,
0.1383005, -0.5286596, 3.116393, 0, 0.5568628, 1, 1,
0.1386456, -0.8537513, 3.45944, 0, 0.5490196, 1, 1,
0.139363, 0.7430249, -0.4461023, 0, 0.5450981, 1, 1,
0.1532661, -1.09526, 2.30711, 0, 0.5372549, 1, 1,
0.1554423, -0.2922822, 1.806957, 0, 0.5333334, 1, 1,
0.1566002, 0.3389699, 0.1919598, 0, 0.5254902, 1, 1,
0.1582785, -0.1587657, 2.405256, 0, 0.5215687, 1, 1,
0.1594361, -1.610929, 4.600428, 0, 0.5137255, 1, 1,
0.1617777, 0.2931755, -0.928624, 0, 0.509804, 1, 1,
0.1671781, 1.973587, -0.3818244, 0, 0.5019608, 1, 1,
0.1683681, -0.1323967, 3.935765, 0, 0.4941176, 1, 1,
0.1706822, -0.9441506, 3.326785, 0, 0.4901961, 1, 1,
0.17123, -0.812448, 2.572792, 0, 0.4823529, 1, 1,
0.1749219, 1.653173, 1.121831, 0, 0.4784314, 1, 1,
0.1821732, -0.624409, 0.7405902, 0, 0.4705882, 1, 1,
0.1866299, -0.214706, 4.169903, 0, 0.4666667, 1, 1,
0.1915584, 2.417784, 0.2051203, 0, 0.4588235, 1, 1,
0.1959505, -1.007466, 2.938696, 0, 0.454902, 1, 1,
0.1964433, 0.295799, -0.5419652, 0, 0.4470588, 1, 1,
0.2004348, 1.770624, 1.158576, 0, 0.4431373, 1, 1,
0.203786, 0.3623534, 1.368701, 0, 0.4352941, 1, 1,
0.2071277, -0.850159, 3.163867, 0, 0.4313726, 1, 1,
0.2095138, -0.1867429, 2.645281, 0, 0.4235294, 1, 1,
0.2098708, 0.3536643, -0.2102517, 0, 0.4196078, 1, 1,
0.2158243, -0.3671687, 2.715899, 0, 0.4117647, 1, 1,
0.2165271, -0.6836443, 2.487147, 0, 0.4078431, 1, 1,
0.2170118, 0.03844592, 0.5265285, 0, 0.4, 1, 1,
0.218223, 0.08031408, 1.571067, 0, 0.3921569, 1, 1,
0.219581, 0.4655255, 2.664809, 0, 0.3882353, 1, 1,
0.2288669, 0.03087302, 1.536627, 0, 0.3803922, 1, 1,
0.2297202, -1.391178, 4.048001, 0, 0.3764706, 1, 1,
0.233484, 0.7935838, -0.2775124, 0, 0.3686275, 1, 1,
0.2335329, 1.157509, -0.7923395, 0, 0.3647059, 1, 1,
0.234877, -0.1562233, 4.949875, 0, 0.3568628, 1, 1,
0.2360665, -0.406726, 2.163319, 0, 0.3529412, 1, 1,
0.2453679, 0.08558036, 0.3258857, 0, 0.345098, 1, 1,
0.2453736, -1.572552, 2.650797, 0, 0.3411765, 1, 1,
0.2490818, -2.008911, 4.112607, 0, 0.3333333, 1, 1,
0.2506238, 2.342536, -0.6956075, 0, 0.3294118, 1, 1,
0.2534502, -0.2802561, 3.224571, 0, 0.3215686, 1, 1,
0.2542198, -1.565899, 2.203305, 0, 0.3176471, 1, 1,
0.2547499, -0.4481243, 5.412388, 0, 0.3098039, 1, 1,
0.2556176, 0.7371716, -2.047742, 0, 0.3058824, 1, 1,
0.2563908, -2.032922, 3.349644, 0, 0.2980392, 1, 1,
0.2569897, -0.8473014, 2.637046, 0, 0.2901961, 1, 1,
0.2587871, -2.042981, 3.186008, 0, 0.2862745, 1, 1,
0.2609474, -0.7382464, 3.145239, 0, 0.2784314, 1, 1,
0.2653857, -0.8302744, 2.775322, 0, 0.2745098, 1, 1,
0.2664033, 1.059257, -1.949287, 0, 0.2666667, 1, 1,
0.2695103, 0.8175626, -0.6481839, 0, 0.2627451, 1, 1,
0.2710671, -0.3856252, 2.109346, 0, 0.254902, 1, 1,
0.2739159, -1.467398, 3.214839, 0, 0.2509804, 1, 1,
0.2741849, -0.6110813, 1.713497, 0, 0.2431373, 1, 1,
0.2786007, 0.8132434, 0.5251336, 0, 0.2392157, 1, 1,
0.2789652, -1.752605, 3.607594, 0, 0.2313726, 1, 1,
0.2799619, 0.5750846, 0.1612592, 0, 0.227451, 1, 1,
0.2827786, -0.02359797, 2.400873, 0, 0.2196078, 1, 1,
0.2828021, 1.424096, -0.407548, 0, 0.2156863, 1, 1,
0.2836383, -1.112966, 2.686644, 0, 0.2078431, 1, 1,
0.2845378, 0.9619166, -0.1532197, 0, 0.2039216, 1, 1,
0.2860306, -2.127021, 4.473253, 0, 0.1960784, 1, 1,
0.2861229, 0.2278746, 2.516872, 0, 0.1882353, 1, 1,
0.286278, -2.689619, 1.9577, 0, 0.1843137, 1, 1,
0.2879867, -0.3995931, 1.888259, 0, 0.1764706, 1, 1,
0.2916884, 0.3314084, -0.714847, 0, 0.172549, 1, 1,
0.2922691, 0.231628, 1.699198, 0, 0.1647059, 1, 1,
0.2934713, -1.683831, 3.413872, 0, 0.1607843, 1, 1,
0.2949366, 1.195033, 0.8583369, 0, 0.1529412, 1, 1,
0.2951277, 1.2837, -0.2128932, 0, 0.1490196, 1, 1,
0.3030294, 0.7900249, -0.650262, 0, 0.1411765, 1, 1,
0.3046504, -0.281799, 2.682165, 0, 0.1372549, 1, 1,
0.3050648, 0.6025458, 1.565831, 0, 0.1294118, 1, 1,
0.3095081, -0.9570498, 1.406568, 0, 0.1254902, 1, 1,
0.3123332, 1.319362, 1.826326, 0, 0.1176471, 1, 1,
0.3180811, 2.60305, -0.5408093, 0, 0.1137255, 1, 1,
0.3202309, 0.4340102, 1.365993, 0, 0.1058824, 1, 1,
0.3242398, 0.7356581, 0.02539613, 0, 0.09803922, 1, 1,
0.3251202, 0.7086694, 0.5491446, 0, 0.09411765, 1, 1,
0.3274853, 0.2620536, 1.780477, 0, 0.08627451, 1, 1,
0.3283731, 1.234, -0.5520738, 0, 0.08235294, 1, 1,
0.3324422, 1.47049, -0.7965938, 0, 0.07450981, 1, 1,
0.3345167, 1.886205, -0.7618371, 0, 0.07058824, 1, 1,
0.3349676, 0.05157173, 0.6424181, 0, 0.0627451, 1, 1,
0.3364289, -0.5808598, 2.13311, 0, 0.05882353, 1, 1,
0.3370548, -0.8272207, 2.949371, 0, 0.05098039, 1, 1,
0.3406581, 0.1896982, 2.379567, 0, 0.04705882, 1, 1,
0.3439201, 0.5451548, 2.10129, 0, 0.03921569, 1, 1,
0.3467205, -0.2822597, 1.254567, 0, 0.03529412, 1, 1,
0.3476036, 0.9733894, 1.063638, 0, 0.02745098, 1, 1,
0.3624278, -0.7774069, 1.807072, 0, 0.02352941, 1, 1,
0.3661883, 0.7069553, -0.1396492, 0, 0.01568628, 1, 1,
0.367834, -1.040167, 4.893557, 0, 0.01176471, 1, 1,
0.3719134, 0.6175991, 0.3162089, 0, 0.003921569, 1, 1,
0.3770444, -0.1122139, 2.22515, 0.003921569, 0, 1, 1,
0.3770996, 0.9554969, -0.3719244, 0.007843138, 0, 1, 1,
0.3846299, 0.02369737, 2.638546, 0.01568628, 0, 1, 1,
0.3855224, 2.204656, 0.492775, 0.01960784, 0, 1, 1,
0.38558, -0.971854, 4.018182, 0.02745098, 0, 1, 1,
0.3893842, -0.5252567, 1.42588, 0.03137255, 0, 1, 1,
0.3921706, 0.3542243, 1.363176, 0.03921569, 0, 1, 1,
0.3933393, 0.1378079, 1.970623, 0.04313726, 0, 1, 1,
0.3948581, -0.6133075, 2.209777, 0.05098039, 0, 1, 1,
0.3954038, -0.7628096, 3.653859, 0.05490196, 0, 1, 1,
0.4109162, 0.9524134, 2.238019, 0.0627451, 0, 1, 1,
0.4146277, 0.2081534, 0.5277115, 0.06666667, 0, 1, 1,
0.4173666, -0.07044421, 2.399479, 0.07450981, 0, 1, 1,
0.4174888, 1.194242, 1.546248, 0.07843138, 0, 1, 1,
0.4179193, -0.05278558, 1.907187, 0.08627451, 0, 1, 1,
0.4242364, 0.7928341, 1.115268, 0.09019608, 0, 1, 1,
0.4249584, 1.957255, 0.2674223, 0.09803922, 0, 1, 1,
0.4273832, -1.472133, 3.76575, 0.1058824, 0, 1, 1,
0.4300992, -0.7882366, 3.115056, 0.1098039, 0, 1, 1,
0.4356511, -1.300192, 3.6871, 0.1176471, 0, 1, 1,
0.4367716, -1.705793, 1.483472, 0.1215686, 0, 1, 1,
0.4418799, -0.1369968, 2.320385, 0.1294118, 0, 1, 1,
0.4419206, 0.4297603, 0.2068326, 0.1333333, 0, 1, 1,
0.4495531, 0.1573527, 0.2716305, 0.1411765, 0, 1, 1,
0.4526314, -1.004568, 2.007092, 0.145098, 0, 1, 1,
0.4582513, 0.3645461, 1.75134, 0.1529412, 0, 1, 1,
0.4586157, -1.096384, 2.566402, 0.1568628, 0, 1, 1,
0.4598725, -1.890086, 4.147839, 0.1647059, 0, 1, 1,
0.4602118, -0.239696, 3.8754, 0.1686275, 0, 1, 1,
0.4607525, -0.3047671, 3.025464, 0.1764706, 0, 1, 1,
0.4608117, 0.2366346, 1.043988, 0.1803922, 0, 1, 1,
0.4609275, 0.5344847, 0.5592005, 0.1882353, 0, 1, 1,
0.461364, -0.2015316, 0.4633369, 0.1921569, 0, 1, 1,
0.4625232, 1.289092, 0.6870582, 0.2, 0, 1, 1,
0.4630527, -0.4907679, 2.106853, 0.2078431, 0, 1, 1,
0.4650468, 0.8114724, -0.6404352, 0.2117647, 0, 1, 1,
0.4748745, 0.8337346, 1.40484, 0.2196078, 0, 1, 1,
0.4780514, -0.7915462, 1.430782, 0.2235294, 0, 1, 1,
0.4831136, -1.294002, 2.673455, 0.2313726, 0, 1, 1,
0.491529, -1.073869, 1.844328, 0.2352941, 0, 1, 1,
0.4919572, 0.0312927, 0.968759, 0.2431373, 0, 1, 1,
0.4948773, -1.114035, 1.280896, 0.2470588, 0, 1, 1,
0.4955249, 0.7557907, -0.8546398, 0.254902, 0, 1, 1,
0.4971165, -0.3157745, 0.978731, 0.2588235, 0, 1, 1,
0.4977965, 2.021156, -0.4681804, 0.2666667, 0, 1, 1,
0.5076339, -0.2719579, 3.480741, 0.2705882, 0, 1, 1,
0.5173834, -0.691894, 3.282538, 0.2784314, 0, 1, 1,
0.5273615, 1.399126, 0.5776091, 0.282353, 0, 1, 1,
0.5285108, -1.399858, 3.861423, 0.2901961, 0, 1, 1,
0.5301208, 0.6568188, -0.02884429, 0.2941177, 0, 1, 1,
0.5307808, -0.7424908, 3.191128, 0.3019608, 0, 1, 1,
0.5331063, -0.8318818, 3.117989, 0.3098039, 0, 1, 1,
0.5351982, -0.2877971, 0.7653354, 0.3137255, 0, 1, 1,
0.5378995, -0.0008766733, 2.086725, 0.3215686, 0, 1, 1,
0.5474027, 0.6540692, -2.099366, 0.3254902, 0, 1, 1,
0.5489216, -0.06155249, 1.405602, 0.3333333, 0, 1, 1,
0.5522119, 0.2083086, 0.3579347, 0.3372549, 0, 1, 1,
0.5523032, -0.3650672, 1.116124, 0.345098, 0, 1, 1,
0.5559555, -1.759621, 1.771396, 0.3490196, 0, 1, 1,
0.5659005, 1.364763, 1.413417, 0.3568628, 0, 1, 1,
0.5692427, -0.5625929, 3.394704, 0.3607843, 0, 1, 1,
0.5889063, -0.4644568, 3.214994, 0.3686275, 0, 1, 1,
0.5944299, 0.6987847, 0.8692979, 0.372549, 0, 1, 1,
0.5955226, 0.08480846, 1.656166, 0.3803922, 0, 1, 1,
0.5982836, 0.3977293, 0.9275455, 0.3843137, 0, 1, 1,
0.5987002, 0.3673694, 0.387957, 0.3921569, 0, 1, 1,
0.6002462, -1.622913, 1.573007, 0.3960784, 0, 1, 1,
0.6030675, 0.7794384, 1.841385, 0.4039216, 0, 1, 1,
0.6041085, 2.563711, -0.9126857, 0.4117647, 0, 1, 1,
0.608658, 0.4530224, 1.767053, 0.4156863, 0, 1, 1,
0.61336, 2.331433, 1.187178, 0.4235294, 0, 1, 1,
0.6150858, -0.06351355, 1.187952, 0.427451, 0, 1, 1,
0.6151012, -0.03566727, 1.780708, 0.4352941, 0, 1, 1,
0.6163735, 0.1791441, -0.8868226, 0.4392157, 0, 1, 1,
0.6173055, -1.319157, 4.868661, 0.4470588, 0, 1, 1,
0.6184011, 2.230001, 1.496805, 0.4509804, 0, 1, 1,
0.6185086, 1.110018, -1.6268, 0.4588235, 0, 1, 1,
0.6232927, -1.72075, 4.010499, 0.4627451, 0, 1, 1,
0.6337567, -0.5892929, 3.324258, 0.4705882, 0, 1, 1,
0.6366506, 0.4527206, 0.6946039, 0.4745098, 0, 1, 1,
0.6379284, 1.088607, -0.3198916, 0.4823529, 0, 1, 1,
0.6399678, 0.04075821, 0.01765174, 0.4862745, 0, 1, 1,
0.6400306, 0.3414974, 1.49808, 0.4941176, 0, 1, 1,
0.6417647, 0.452857, 2.883658, 0.5019608, 0, 1, 1,
0.6445006, 1.667737, -0.6441197, 0.5058824, 0, 1, 1,
0.646137, 0.04644043, 1.183972, 0.5137255, 0, 1, 1,
0.646624, 1.148092, 1.411744, 0.5176471, 0, 1, 1,
0.6475068, -0.5555773, 4.452336, 0.5254902, 0, 1, 1,
0.6479076, 1.438727, 0.2702427, 0.5294118, 0, 1, 1,
0.6479452, 1.376475, -0.5492709, 0.5372549, 0, 1, 1,
0.6501209, 1.07704, -0.703796, 0.5411765, 0, 1, 1,
0.653654, 1.321351, -0.8915319, 0.5490196, 0, 1, 1,
0.6540024, -0.114545, 1.736564, 0.5529412, 0, 1, 1,
0.6559919, 0.5539434, 0.7512829, 0.5607843, 0, 1, 1,
0.6647605, -1.472761, 3.314898, 0.5647059, 0, 1, 1,
0.6701642, 1.679112, -0.2780526, 0.572549, 0, 1, 1,
0.6713709, 0.6542199, 0.6281779, 0.5764706, 0, 1, 1,
0.6718068, 1.044701, 1.94799, 0.5843138, 0, 1, 1,
0.6743326, 0.3114578, 2.347791, 0.5882353, 0, 1, 1,
0.6820202, -0.4157026, 2.173365, 0.5960785, 0, 1, 1,
0.6839429, -0.08832305, 1.10222, 0.6039216, 0, 1, 1,
0.6868692, 0.4853576, 0.01884934, 0.6078432, 0, 1, 1,
0.6906787, -0.09581013, 0.6058031, 0.6156863, 0, 1, 1,
0.6907227, -0.5925763, 2.546649, 0.6196079, 0, 1, 1,
0.6918676, -0.4801677, 2.855815, 0.627451, 0, 1, 1,
0.6969399, -0.6150353, 2.793751, 0.6313726, 0, 1, 1,
0.7020256, -1.079366, 1.161554, 0.6392157, 0, 1, 1,
0.7102218, 1.791631, 0.3898544, 0.6431373, 0, 1, 1,
0.7149398, 0.6179587, 1.707084, 0.6509804, 0, 1, 1,
0.7163259, -1.7617, 2.277869, 0.654902, 0, 1, 1,
0.7173962, -0.5385262, 1.806464, 0.6627451, 0, 1, 1,
0.7204558, -0.04725228, 2.424831, 0.6666667, 0, 1, 1,
0.7258905, 0.6388469, 1.595161, 0.6745098, 0, 1, 1,
0.7268056, -0.6087573, 2.987808, 0.6784314, 0, 1, 1,
0.7278893, -0.1135622, 0.3854426, 0.6862745, 0, 1, 1,
0.7319642, -0.5449044, 1.273064, 0.6901961, 0, 1, 1,
0.7338974, -0.4760954, 2.188923, 0.6980392, 0, 1, 1,
0.7347714, 0.7938226, -0.2494213, 0.7058824, 0, 1, 1,
0.7380024, -0.01086461, 1.079025, 0.7098039, 0, 1, 1,
0.7396117, 0.5643739, 0.7425559, 0.7176471, 0, 1, 1,
0.7432435, -0.1907022, 1.647238, 0.7215686, 0, 1, 1,
0.7505143, -0.04998749, 1.248957, 0.7294118, 0, 1, 1,
0.7512115, 0.453609, 2.095491, 0.7333333, 0, 1, 1,
0.7527803, -1.221035, 1.990379, 0.7411765, 0, 1, 1,
0.755136, 1.637162, 1.456613, 0.7450981, 0, 1, 1,
0.7564909, -0.3857731, 3.496208, 0.7529412, 0, 1, 1,
0.7568774, 0.6729653, 0.5864932, 0.7568628, 0, 1, 1,
0.7720597, 0.9308482, 1.549613, 0.7647059, 0, 1, 1,
0.7844273, 0.03477211, -0.601146, 0.7686275, 0, 1, 1,
0.7851417, 0.7904637, 0.3062172, 0.7764706, 0, 1, 1,
0.785431, 2.890973, 0.2691085, 0.7803922, 0, 1, 1,
0.7929044, 0.2492969, 0.9053866, 0.7882353, 0, 1, 1,
0.7940511, 0.7604057, -0.3423951, 0.7921569, 0, 1, 1,
0.7942341, -0.6772195, 3.246009, 0.8, 0, 1, 1,
0.7945123, 3.010449, -1.686388, 0.8078431, 0, 1, 1,
0.8069624, -0.0221376, 1.637033, 0.8117647, 0, 1, 1,
0.8112152, -1.207379, 2.972918, 0.8196079, 0, 1, 1,
0.8124728, -1.45057, 0.5815977, 0.8235294, 0, 1, 1,
0.8137811, -1.902503, 3.365063, 0.8313726, 0, 1, 1,
0.8159642, 0.5285469, -0.900821, 0.8352941, 0, 1, 1,
0.8161221, -0.2999204, 0.7425014, 0.8431373, 0, 1, 1,
0.8172836, 0.9112122, 0.9223291, 0.8470588, 0, 1, 1,
0.8205145, -1.109288, 3.346462, 0.854902, 0, 1, 1,
0.8215601, -1.168787, 2.960096, 0.8588235, 0, 1, 1,
0.8233042, 2.149814, 0.04948177, 0.8666667, 0, 1, 1,
0.8374012, 1.078191, 2.642025, 0.8705882, 0, 1, 1,
0.8376188, 0.1177939, 1.086589, 0.8784314, 0, 1, 1,
0.8422886, 0.785071, 1.052113, 0.8823529, 0, 1, 1,
0.8450812, -0.8240105, 1.406044, 0.8901961, 0, 1, 1,
0.8469917, -1.088843, 2.30886, 0.8941177, 0, 1, 1,
0.8477398, -1.762969, 3.367253, 0.9019608, 0, 1, 1,
0.8498735, -0.007698903, 1.941204, 0.9098039, 0, 1, 1,
0.8500839, -0.2462975, 1.011695, 0.9137255, 0, 1, 1,
0.8603937, 0.7354695, -0.6489734, 0.9215686, 0, 1, 1,
0.8822365, -1.068538, 1.511334, 0.9254902, 0, 1, 1,
0.8866241, -1.293939, 2.257542, 0.9333333, 0, 1, 1,
0.8926497, -0.644551, 1.713429, 0.9372549, 0, 1, 1,
0.9006333, 0.3513103, 0.4730683, 0.945098, 0, 1, 1,
0.9012958, 0.06315791, 1.056873, 0.9490196, 0, 1, 1,
0.9123464, 0.08942175, 0.8366425, 0.9568627, 0, 1, 1,
0.9140221, -1.257445, 2.303782, 0.9607843, 0, 1, 1,
0.9181791, 0.2187992, 1.858064, 0.9686275, 0, 1, 1,
0.9183747, -0.1675573, 1.512223, 0.972549, 0, 1, 1,
0.9184129, 0.3814877, 0.2516448, 0.9803922, 0, 1, 1,
0.9186519, -0.01084876, 0.2606481, 0.9843137, 0, 1, 1,
0.919113, -0.9724097, 2.974992, 0.9921569, 0, 1, 1,
0.9194358, 2.207432, 0.2229423, 0.9960784, 0, 1, 1,
0.9299303, -0.1471817, 1.122615, 1, 0, 0.9960784, 1,
0.9305624, -0.07232568, 1.419449, 1, 0, 0.9882353, 1,
0.9344561, -0.7906216, 1.302057, 1, 0, 0.9843137, 1,
0.9378198, -0.7357485, 0.3838483, 1, 0, 0.9764706, 1,
0.9392672, -1.636993, 2.549079, 1, 0, 0.972549, 1,
0.942295, -1.222597, 1.404496, 1, 0, 0.9647059, 1,
0.9438168, 0.5064369, 0.3353048, 1, 0, 0.9607843, 1,
0.9440215, -0.07083958, 0.09980758, 1, 0, 0.9529412, 1,
0.9440652, -1.065032, 1.25481, 1, 0, 0.9490196, 1,
0.9569355, 0.3657736, 1.306195, 1, 0, 0.9411765, 1,
0.9662674, -1.615552, 1.320012, 1, 0, 0.9372549, 1,
0.9783581, -0.2572118, 1.214068, 1, 0, 0.9294118, 1,
0.9799163, -0.9669122, 3.458701, 1, 0, 0.9254902, 1,
0.9862934, -0.9722855, 1.550122, 1, 0, 0.9176471, 1,
0.9864612, -1.680281, 2.702621, 1, 0, 0.9137255, 1,
0.991439, -0.6320261, 4.32349, 1, 0, 0.9058824, 1,
0.9924859, -2.152283, 3.843621, 1, 0, 0.9019608, 1,
0.9932352, -0.5513467, 2.686391, 1, 0, 0.8941177, 1,
0.9953994, 1.138028, 0.9136704, 1, 0, 0.8862745, 1,
1.001636, -0.4390337, 1.627244, 1, 0, 0.8823529, 1,
1.002348, 0.5442232, 1.037944, 1, 0, 0.8745098, 1,
1.006478, -1.379464, 1.359529, 1, 0, 0.8705882, 1,
1.016689, -0.6364596, 2.592939, 1, 0, 0.8627451, 1,
1.021962, 0.5295669, 1.225542, 1, 0, 0.8588235, 1,
1.024403, 0.632397, 2.129061, 1, 0, 0.8509804, 1,
1.039346, -2.455498, 3.1271, 1, 0, 0.8470588, 1,
1.040204, 0.6132344, 2.702417, 1, 0, 0.8392157, 1,
1.043827, 0.3139172, 1.324527, 1, 0, 0.8352941, 1,
1.047116, -1.787467, 1.459745, 1, 0, 0.827451, 1,
1.053407, 0.4037187, 3.196171, 1, 0, 0.8235294, 1,
1.063543, -2.197104, 1.335087, 1, 0, 0.8156863, 1,
1.064492, 0.9791039, 0.1520405, 1, 0, 0.8117647, 1,
1.064497, -0.8192723, 2.341806, 1, 0, 0.8039216, 1,
1.06697, -0.2165483, 1.285126, 1, 0, 0.7960784, 1,
1.077288, 1.961285, -0.2094317, 1, 0, 0.7921569, 1,
1.077338, 0.09196603, 0.4923941, 1, 0, 0.7843137, 1,
1.084435, -0.8505106, 1.463185, 1, 0, 0.7803922, 1,
1.096315, 0.7618304, 1.143946, 1, 0, 0.772549, 1,
1.096669, 0.4616163, 0.5008094, 1, 0, 0.7686275, 1,
1.102971, 1.724159, 0.1017014, 1, 0, 0.7607843, 1,
1.103807, -0.05886574, 2.596581, 1, 0, 0.7568628, 1,
1.114583, 1.224144, 0.1442605, 1, 0, 0.7490196, 1,
1.1214, 0.04255168, 0.26429, 1, 0, 0.7450981, 1,
1.122404, 1.740718, 0.5052863, 1, 0, 0.7372549, 1,
1.12298, -0.5105529, 3.182414, 1, 0, 0.7333333, 1,
1.132498, 1.083543, -0.8816308, 1, 0, 0.7254902, 1,
1.136961, 0.4100769, 0.1084567, 1, 0, 0.7215686, 1,
1.146037, -0.5984303, 1.402785, 1, 0, 0.7137255, 1,
1.147299, 0.1244184, 1.118995, 1, 0, 0.7098039, 1,
1.150444, -1.005166, 3.408076, 1, 0, 0.7019608, 1,
1.159849, 0.07710375, 2.060835, 1, 0, 0.6941177, 1,
1.163171, -2.033376, 0.1995989, 1, 0, 0.6901961, 1,
1.166337, 1.513892, 0.2183906, 1, 0, 0.682353, 1,
1.169639, 1.127739, 1.67648, 1, 0, 0.6784314, 1,
1.176382, -1.073653, 2.66994, 1, 0, 0.6705883, 1,
1.17826, -0.439764, 2.104462, 1, 0, 0.6666667, 1,
1.180268, 1.418344, 1.795581, 1, 0, 0.6588235, 1,
1.194383, 0.2767159, -0.2515271, 1, 0, 0.654902, 1,
1.196521, -0.3166294, 1.598517, 1, 0, 0.6470588, 1,
1.199144, -1.288614, 3.016517, 1, 0, 0.6431373, 1,
1.209206, 1.656037, 1.035226, 1, 0, 0.6352941, 1,
1.209672, -0.2905242, 2.982988, 1, 0, 0.6313726, 1,
1.211261, 0.4626207, 0.2248325, 1, 0, 0.6235294, 1,
1.212456, 1.181471, -0.3243287, 1, 0, 0.6196079, 1,
1.215597, 2.119228, -0.05798127, 1, 0, 0.6117647, 1,
1.215681, 0.4738982, 0.557116, 1, 0, 0.6078432, 1,
1.229348, 1.655468, 2.837164, 1, 0, 0.6, 1,
1.235836, -0.4979786, 2.016842, 1, 0, 0.5921569, 1,
1.240239, 0.6576186, 0.6351523, 1, 0, 0.5882353, 1,
1.246342, -1.341191, 1.166481, 1, 0, 0.5803922, 1,
1.247492, -0.63831, 3.505961, 1, 0, 0.5764706, 1,
1.255817, -0.701721, 3.536858, 1, 0, 0.5686275, 1,
1.257404, -0.3481312, -0.8290966, 1, 0, 0.5647059, 1,
1.274151, 0.1355959, 3.523349, 1, 0, 0.5568628, 1,
1.274808, 0.8289464, 3.156153, 1, 0, 0.5529412, 1,
1.276032, 0.5574661, 1.294764, 1, 0, 0.5450981, 1,
1.302008, -0.2829684, 0.9628374, 1, 0, 0.5411765, 1,
1.304498, 1.464075, 0.5207428, 1, 0, 0.5333334, 1,
1.306651, -0.6166014, 2.999761, 1, 0, 0.5294118, 1,
1.316103, -0.8475881, 4.223025, 1, 0, 0.5215687, 1,
1.317123, 0.03462605, 0.3675165, 1, 0, 0.5176471, 1,
1.317505, -0.5176521, 1.838139, 1, 0, 0.509804, 1,
1.319217, -0.8372426, 3.843212, 1, 0, 0.5058824, 1,
1.321809, -2.149916, 2.455937, 1, 0, 0.4980392, 1,
1.32352, 0.2110178, 0.8070181, 1, 0, 0.4901961, 1,
1.327289, 0.3675974, -0.3232644, 1, 0, 0.4862745, 1,
1.331211, -1.061928, 1.787856, 1, 0, 0.4784314, 1,
1.336344, -0.7498693, 3.26286, 1, 0, 0.4745098, 1,
1.340076, 0.5397086, 0.8115256, 1, 0, 0.4666667, 1,
1.342294, -0.1843303, 0.8670092, 1, 0, 0.4627451, 1,
1.349586, 0.0111397, 1.340433, 1, 0, 0.454902, 1,
1.35424, -1.301458, 1.888715, 1, 0, 0.4509804, 1,
1.357317, -0.2073716, 0.4254404, 1, 0, 0.4431373, 1,
1.362303, 1.714034, 1.896404, 1, 0, 0.4392157, 1,
1.372265, -0.499419, 2.648128, 1, 0, 0.4313726, 1,
1.384802, 0.1351898, 1.829072, 1, 0, 0.427451, 1,
1.427212, -0.2658811, 1.592945, 1, 0, 0.4196078, 1,
1.430344, -0.6900471, 2.33525, 1, 0, 0.4156863, 1,
1.445702, -0.5969542, 0.9739396, 1, 0, 0.4078431, 1,
1.454373, 1.419258, 0.4037466, 1, 0, 0.4039216, 1,
1.456322, 0.7219043, 2.457069, 1, 0, 0.3960784, 1,
1.485941, 1.176648, -0.4331884, 1, 0, 0.3882353, 1,
1.494355, -0.8011337, 1.135653, 1, 0, 0.3843137, 1,
1.494463, -0.4976207, 1.108889, 1, 0, 0.3764706, 1,
1.504505, -1.744242, 2.549843, 1, 0, 0.372549, 1,
1.515275, -0.3082058, 3.072061, 1, 0, 0.3647059, 1,
1.527297, 1.412755, 2.54855, 1, 0, 0.3607843, 1,
1.527946, 0.2704705, 0.8063598, 1, 0, 0.3529412, 1,
1.528945, 0.3040001, 0.4741848, 1, 0, 0.3490196, 1,
1.537127, -2.381199, 3.840818, 1, 0, 0.3411765, 1,
1.542796, 0.3191317, 1.172737, 1, 0, 0.3372549, 1,
1.546762, -2.847714, 2.573538, 1, 0, 0.3294118, 1,
1.59628, -0.5408843, -1.174862, 1, 0, 0.3254902, 1,
1.599305, -0.5414829, 3.9574, 1, 0, 0.3176471, 1,
1.608943, 2.106883, 0.5263644, 1, 0, 0.3137255, 1,
1.613591, 0.8719175, 0.2823862, 1, 0, 0.3058824, 1,
1.626266, 0.1470874, 1.448998, 1, 0, 0.2980392, 1,
1.627421, -1.293873, 2.760904, 1, 0, 0.2941177, 1,
1.6296, -0.3714972, 1.22879, 1, 0, 0.2862745, 1,
1.656095, 1.425985, 1.301375, 1, 0, 0.282353, 1,
1.675063, -0.5965617, 1.59003, 1, 0, 0.2745098, 1,
1.67708, 0.2108463, 0.5292609, 1, 0, 0.2705882, 1,
1.688727, 0.4341451, 0.8538215, 1, 0, 0.2627451, 1,
1.691652, 0.8872495, 0.7437834, 1, 0, 0.2588235, 1,
1.702692, -1.959676, 1.914824, 1, 0, 0.2509804, 1,
1.717588, -1.55346, 2.687463, 1, 0, 0.2470588, 1,
1.719001, 0.3613133, 1.768796, 1, 0, 0.2392157, 1,
1.734493, 0.7335126, 1.632427, 1, 0, 0.2352941, 1,
1.738818, -1.077687, 1.430724, 1, 0, 0.227451, 1,
1.740602, 0.6700482, 2.129028, 1, 0, 0.2235294, 1,
1.755158, 1.129087, 1.36384, 1, 0, 0.2156863, 1,
1.777712, 1.060569, 1.547775, 1, 0, 0.2117647, 1,
1.796255, -1.222002, 2.151326, 1, 0, 0.2039216, 1,
1.81918, 0.6520563, 1.966401, 1, 0, 0.1960784, 1,
1.869775, 0.04012914, 0.7885994, 1, 0, 0.1921569, 1,
1.879864, -1.150638, 2.676521, 1, 0, 0.1843137, 1,
1.885128, 1.79179, 1.733433, 1, 0, 0.1803922, 1,
1.920383, -0.1451751, 1.731689, 1, 0, 0.172549, 1,
1.920418, 0.8251858, 1.603288, 1, 0, 0.1686275, 1,
1.950428, 0.2138748, 1.257688, 1, 0, 0.1607843, 1,
1.967289, 0.325768, 1.549039, 1, 0, 0.1568628, 1,
1.981727, -0.3291047, 2.206906, 1, 0, 0.1490196, 1,
1.986295, 2.081812, 0.592485, 1, 0, 0.145098, 1,
2.029764, 0.3879389, 1.017594, 1, 0, 0.1372549, 1,
2.035902, -0.2462881, 2.498675, 1, 0, 0.1333333, 1,
2.059459, -0.4396102, 1.263879, 1, 0, 0.1254902, 1,
2.062357, 1.334417, -0.5318012, 1, 0, 0.1215686, 1,
2.077507, -0.8150927, 1.834947, 1, 0, 0.1137255, 1,
2.147129, -0.8341759, 0.5250406, 1, 0, 0.1098039, 1,
2.175743, 0.6427563, 2.068544, 1, 0, 0.1019608, 1,
2.186453, 0.1070237, 2.219679, 1, 0, 0.09411765, 1,
2.193033, 0.4810046, 2.145673, 1, 0, 0.09019608, 1,
2.217152, -0.2303169, 1.278913, 1, 0, 0.08235294, 1,
2.235397, 0.09356706, 0.1483244, 1, 0, 0.07843138, 1,
2.263723, 0.04210361, 2.3391, 1, 0, 0.07058824, 1,
2.331445, 1.525908, 0.7407024, 1, 0, 0.06666667, 1,
2.363261, 1.865992, -0.8743982, 1, 0, 0.05882353, 1,
2.477002, -0.07205693, 3.199711, 1, 0, 0.05490196, 1,
2.548211, -0.6335638, 2.429136, 1, 0, 0.04705882, 1,
2.699057, -0.09181868, 0.3658847, 1, 0, 0.04313726, 1,
2.7161, 0.4215814, 0.7604629, 1, 0, 0.03529412, 1,
2.731176, 0.5707415, 1.829819, 1, 0, 0.03137255, 1,
2.801294, -0.4275005, 0.9949773, 1, 0, 0.02352941, 1,
2.877807, 0.7119149, 2.112873, 1, 0, 0.01960784, 1,
3.018634, -0.2390431, 1.565878, 1, 0, 0.01176471, 1,
3.703163, -1.800053, 1.069207, 1, 0, 0.007843138, 1
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
0.2163817, -4.133, -7.28915, 0, -0.5, 0.5, 0.5,
0.2163817, -4.133, -7.28915, 1, -0.5, 0.5, 0.5,
0.2163817, -4.133, -7.28915, 1, 1.5, 0.5, 0.5,
0.2163817, -4.133, -7.28915, 0, 1.5, 0.5, 0.5
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
-4.452419, 0.145592, -7.28915, 0, -0.5, 0.5, 0.5,
-4.452419, 0.145592, -7.28915, 1, -0.5, 0.5, 0.5,
-4.452419, 0.145592, -7.28915, 1, 1.5, 0.5, 0.5,
-4.452419, 0.145592, -7.28915, 0, 1.5, 0.5, 0.5
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
-4.452419, -4.133, -0.01794052, 0, -0.5, 0.5, 0.5,
-4.452419, -4.133, -0.01794052, 1, -0.5, 0.5, 0.5,
-4.452419, -4.133, -0.01794052, 1, 1.5, 0.5, 0.5,
-4.452419, -4.133, -0.01794052, 0, 1.5, 0.5, 0.5
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
-3, -3.145633, -5.611179,
3, -3.145633, -5.611179,
-3, -3.145633, -5.611179,
-3, -3.310194, -5.890841,
-2, -3.145633, -5.611179,
-2, -3.310194, -5.890841,
-1, -3.145633, -5.611179,
-1, -3.310194, -5.890841,
0, -3.145633, -5.611179,
0, -3.310194, -5.890841,
1, -3.145633, -5.611179,
1, -3.310194, -5.890841,
2, -3.145633, -5.611179,
2, -3.310194, -5.890841,
3, -3.145633, -5.611179,
3, -3.310194, -5.890841
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
-3, -3.639316, -6.450164, 0, -0.5, 0.5, 0.5,
-3, -3.639316, -6.450164, 1, -0.5, 0.5, 0.5,
-3, -3.639316, -6.450164, 1, 1.5, 0.5, 0.5,
-3, -3.639316, -6.450164, 0, 1.5, 0.5, 0.5,
-2, -3.639316, -6.450164, 0, -0.5, 0.5, 0.5,
-2, -3.639316, -6.450164, 1, -0.5, 0.5, 0.5,
-2, -3.639316, -6.450164, 1, 1.5, 0.5, 0.5,
-2, -3.639316, -6.450164, 0, 1.5, 0.5, 0.5,
-1, -3.639316, -6.450164, 0, -0.5, 0.5, 0.5,
-1, -3.639316, -6.450164, 1, -0.5, 0.5, 0.5,
-1, -3.639316, -6.450164, 1, 1.5, 0.5, 0.5,
-1, -3.639316, -6.450164, 0, 1.5, 0.5, 0.5,
0, -3.639316, -6.450164, 0, -0.5, 0.5, 0.5,
0, -3.639316, -6.450164, 1, -0.5, 0.5, 0.5,
0, -3.639316, -6.450164, 1, 1.5, 0.5, 0.5,
0, -3.639316, -6.450164, 0, 1.5, 0.5, 0.5,
1, -3.639316, -6.450164, 0, -0.5, 0.5, 0.5,
1, -3.639316, -6.450164, 1, -0.5, 0.5, 0.5,
1, -3.639316, -6.450164, 1, 1.5, 0.5, 0.5,
1, -3.639316, -6.450164, 0, 1.5, 0.5, 0.5,
2, -3.639316, -6.450164, 0, -0.5, 0.5, 0.5,
2, -3.639316, -6.450164, 1, -0.5, 0.5, 0.5,
2, -3.639316, -6.450164, 1, 1.5, 0.5, 0.5,
2, -3.639316, -6.450164, 0, 1.5, 0.5, 0.5,
3, -3.639316, -6.450164, 0, -0.5, 0.5, 0.5,
3, -3.639316, -6.450164, 1, -0.5, 0.5, 0.5,
3, -3.639316, -6.450164, 1, 1.5, 0.5, 0.5,
3, -3.639316, -6.450164, 0, 1.5, 0.5, 0.5
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
-3.375003, -3, -5.611179,
-3.375003, 3, -5.611179,
-3.375003, -3, -5.611179,
-3.554573, -3, -5.890841,
-3.375003, -2, -5.611179,
-3.554573, -2, -5.890841,
-3.375003, -1, -5.611179,
-3.554573, -1, -5.890841,
-3.375003, 0, -5.611179,
-3.554573, 0, -5.890841,
-3.375003, 1, -5.611179,
-3.554573, 1, -5.890841,
-3.375003, 2, -5.611179,
-3.554573, 2, -5.890841,
-3.375003, 3, -5.611179,
-3.554573, 3, -5.890841
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
-3.913711, -3, -6.450164, 0, -0.5, 0.5, 0.5,
-3.913711, -3, -6.450164, 1, -0.5, 0.5, 0.5,
-3.913711, -3, -6.450164, 1, 1.5, 0.5, 0.5,
-3.913711, -3, -6.450164, 0, 1.5, 0.5, 0.5,
-3.913711, -2, -6.450164, 0, -0.5, 0.5, 0.5,
-3.913711, -2, -6.450164, 1, -0.5, 0.5, 0.5,
-3.913711, -2, -6.450164, 1, 1.5, 0.5, 0.5,
-3.913711, -2, -6.450164, 0, 1.5, 0.5, 0.5,
-3.913711, -1, -6.450164, 0, -0.5, 0.5, 0.5,
-3.913711, -1, -6.450164, 1, -0.5, 0.5, 0.5,
-3.913711, -1, -6.450164, 1, 1.5, 0.5, 0.5,
-3.913711, -1, -6.450164, 0, 1.5, 0.5, 0.5,
-3.913711, 0, -6.450164, 0, -0.5, 0.5, 0.5,
-3.913711, 0, -6.450164, 1, -0.5, 0.5, 0.5,
-3.913711, 0, -6.450164, 1, 1.5, 0.5, 0.5,
-3.913711, 0, -6.450164, 0, 1.5, 0.5, 0.5,
-3.913711, 1, -6.450164, 0, -0.5, 0.5, 0.5,
-3.913711, 1, -6.450164, 1, -0.5, 0.5, 0.5,
-3.913711, 1, -6.450164, 1, 1.5, 0.5, 0.5,
-3.913711, 1, -6.450164, 0, 1.5, 0.5, 0.5,
-3.913711, 2, -6.450164, 0, -0.5, 0.5, 0.5,
-3.913711, 2, -6.450164, 1, -0.5, 0.5, 0.5,
-3.913711, 2, -6.450164, 1, 1.5, 0.5, 0.5,
-3.913711, 2, -6.450164, 0, 1.5, 0.5, 0.5,
-3.913711, 3, -6.450164, 0, -0.5, 0.5, 0.5,
-3.913711, 3, -6.450164, 1, -0.5, 0.5, 0.5,
-3.913711, 3, -6.450164, 1, 1.5, 0.5, 0.5,
-3.913711, 3, -6.450164, 0, 1.5, 0.5, 0.5
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
-3.375003, -3.145633, -4,
-3.375003, -3.145633, 4,
-3.375003, -3.145633, -4,
-3.554573, -3.310194, -4,
-3.375003, -3.145633, -2,
-3.554573, -3.310194, -2,
-3.375003, -3.145633, 0,
-3.554573, -3.310194, 0,
-3.375003, -3.145633, 2,
-3.554573, -3.310194, 2,
-3.375003, -3.145633, 4,
-3.554573, -3.310194, 4
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
-3.913711, -3.639316, -4, 0, -0.5, 0.5, 0.5,
-3.913711, -3.639316, -4, 1, -0.5, 0.5, 0.5,
-3.913711, -3.639316, -4, 1, 1.5, 0.5, 0.5,
-3.913711, -3.639316, -4, 0, 1.5, 0.5, 0.5,
-3.913711, -3.639316, -2, 0, -0.5, 0.5, 0.5,
-3.913711, -3.639316, -2, 1, -0.5, 0.5, 0.5,
-3.913711, -3.639316, -2, 1, 1.5, 0.5, 0.5,
-3.913711, -3.639316, -2, 0, 1.5, 0.5, 0.5,
-3.913711, -3.639316, 0, 0, -0.5, 0.5, 0.5,
-3.913711, -3.639316, 0, 1, -0.5, 0.5, 0.5,
-3.913711, -3.639316, 0, 1, 1.5, 0.5, 0.5,
-3.913711, -3.639316, 0, 0, 1.5, 0.5, 0.5,
-3.913711, -3.639316, 2, 0, -0.5, 0.5, 0.5,
-3.913711, -3.639316, 2, 1, -0.5, 0.5, 0.5,
-3.913711, -3.639316, 2, 1, 1.5, 0.5, 0.5,
-3.913711, -3.639316, 2, 0, 1.5, 0.5, 0.5,
-3.913711, -3.639316, 4, 0, -0.5, 0.5, 0.5,
-3.913711, -3.639316, 4, 1, -0.5, 0.5, 0.5,
-3.913711, -3.639316, 4, 1, 1.5, 0.5, 0.5,
-3.913711, -3.639316, 4, 0, 1.5, 0.5, 0.5
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
-3.375003, -3.145633, -5.611179,
-3.375003, 3.436816, -5.611179,
-3.375003, -3.145633, 5.575298,
-3.375003, 3.436816, 5.575298,
-3.375003, -3.145633, -5.611179,
-3.375003, -3.145633, 5.575298,
-3.375003, 3.436816, -5.611179,
-3.375003, 3.436816, 5.575298,
-3.375003, -3.145633, -5.611179,
3.807767, -3.145633, -5.611179,
-3.375003, -3.145633, 5.575298,
3.807767, -3.145633, 5.575298,
-3.375003, 3.436816, -5.611179,
3.807767, 3.436816, -5.611179,
-3.375003, 3.436816, 5.575298,
3.807767, 3.436816, 5.575298,
3.807767, -3.145633, -5.611179,
3.807767, 3.436816, -5.611179,
3.807767, -3.145633, 5.575298,
3.807767, 3.436816, 5.575298,
3.807767, -3.145633, -5.611179,
3.807767, -3.145633, 5.575298,
3.807767, 3.436816, -5.611179,
3.807767, 3.436816, 5.575298
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
var radius = 7.921257;
var distance = 35.24257;
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
mvMatrix.translate( -0.2163817, -0.145592, 0.01794052 );
mvMatrix.scale( 1.192384, 1.301129, 0.7656226 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.24257);
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
copper_arsenate_copp<-read.table("copper_arsenate_copp.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 2 did not have 5 elements
```

```r
x<-copper_arsenate_copp$V2
```

```
## Error in eval(expr, envir, enclos): object 'copper_arsenate_copp' not found
```

```r
y<-copper_arsenate_copp$V3
```

```
## Error in eval(expr, envir, enclos): object 'copper_arsenate_copp' not found
```

```r
z<-copper_arsenate_copp$V4
```

```
## Error in eval(expr, envir, enclos): object 'copper_arsenate_copp' not found
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
-3.2704, -1.29943, -1.900403, 0, 0, 1, 1, 1,
-3.213902, -0.01848804, -2.43072, 1, 0, 0, 1, 1,
-2.800645, -0.5416011, -1.839118, 1, 0, 0, 1, 1,
-2.786176, 1.917545, -0.2858647, 1, 0, 0, 1, 1,
-2.721575, 0.823283, -1.110563, 1, 0, 0, 1, 1,
-2.721066, 1.411621, -2.045929, 1, 0, 0, 1, 1,
-2.597183, 0.1062267, -2.350629, 0, 0, 0, 1, 1,
-2.576976, 1.730123, -1.434252, 0, 0, 0, 1, 1,
-2.57534, -0.6783823, -3.534754, 0, 0, 0, 1, 1,
-2.562977, 1.287769, -1.438846, 0, 0, 0, 1, 1,
-2.551769, -0.785339, -4.096884, 0, 0, 0, 1, 1,
-2.522797, -1.048379, -0.1003264, 0, 0, 0, 1, 1,
-2.451044, 0.909735, -0.9855143, 0, 0, 0, 1, 1,
-2.438374, -0.7413313, -1.710656, 1, 1, 1, 1, 1,
-2.41187, 0.6362618, -1.58001, 1, 1, 1, 1, 1,
-2.341072, 0.9057858, -2.21779, 1, 1, 1, 1, 1,
-2.297462, -1.531676, -1.663576, 1, 1, 1, 1, 1,
-2.249643, -0.464485, -2.918468, 1, 1, 1, 1, 1,
-2.244423, -0.8578591, -2.837022, 1, 1, 1, 1, 1,
-2.19442, -0.02617414, -2.785762, 1, 1, 1, 1, 1,
-2.151889, 0.6322446, -0.7996001, 1, 1, 1, 1, 1,
-2.140006, 0.06941032, -1.781755, 1, 1, 1, 1, 1,
-2.110235, -1.400402, -2.193988, 1, 1, 1, 1, 1,
-2.094219, -0.3211722, -2.738872, 1, 1, 1, 1, 1,
-2.091569, 0.8193421, -0.1295622, 1, 1, 1, 1, 1,
-2.016848, 0.3780386, -1.623307, 1, 1, 1, 1, 1,
-2.011669, -0.476652, -2.240335, 1, 1, 1, 1, 1,
-1.979738, -0.2472118, -1.020384, 1, 1, 1, 1, 1,
-1.968208, -0.1290855, -0.7170494, 0, 0, 1, 1, 1,
-1.958279, -0.01277943, -2.641959, 1, 0, 0, 1, 1,
-1.94382, -0.06402211, 0.05537529, 1, 0, 0, 1, 1,
-1.941904, 0.6267729, -1.839975, 1, 0, 0, 1, 1,
-1.934687, -0.7465477, -3.187652, 1, 0, 0, 1, 1,
-1.933981, -0.895678, -0.7000257, 1, 0, 0, 1, 1,
-1.929091, -0.7167794, -0.366514, 0, 0, 0, 1, 1,
-1.920517, 1.555701, -0.6051219, 0, 0, 0, 1, 1,
-1.9041, 1.984087, -0.8228161, 0, 0, 0, 1, 1,
-1.897782, 0.1638483, -1.803254, 0, 0, 0, 1, 1,
-1.894418, 0.2330726, -2.279649, 0, 0, 0, 1, 1,
-1.888638, 0.6269197, 1.247539, 0, 0, 0, 1, 1,
-1.874906, -0.177261, -2.070355, 0, 0, 0, 1, 1,
-1.873163, -0.8705001, -2.021985, 1, 1, 1, 1, 1,
-1.829111, -0.2377952, -1.5718, 1, 1, 1, 1, 1,
-1.826534, 1.136161, -1.445315, 1, 1, 1, 1, 1,
-1.786999, 2.620021, 0.007521467, 1, 1, 1, 1, 1,
-1.774881, -1.150375, -3.377548, 1, 1, 1, 1, 1,
-1.737949, 0.6391227, -2.547722, 1, 1, 1, 1, 1,
-1.721094, 1.013164, -1.660861, 1, 1, 1, 1, 1,
-1.72043, 1.478331, -1.564429, 1, 1, 1, 1, 1,
-1.715687, -0.7234223, -2.788765, 1, 1, 1, 1, 1,
-1.675171, 0.3860005, -1.290411, 1, 1, 1, 1, 1,
-1.659258, 1.343014, 0.3601591, 1, 1, 1, 1, 1,
-1.646068, -1.247621, -0.9915357, 1, 1, 1, 1, 1,
-1.636137, 1.136576, -1.761657, 1, 1, 1, 1, 1,
-1.620789, -0.4741, -3.039856, 1, 1, 1, 1, 1,
-1.605559, 0.2189392, -1.803661, 1, 1, 1, 1, 1,
-1.587681, 0.8028214, -4.216734, 0, 0, 1, 1, 1,
-1.585715, 0.5909601, -2.132806, 1, 0, 0, 1, 1,
-1.572275, 0.7056721, 0.2212389, 1, 0, 0, 1, 1,
-1.563564, 0.7292098, -2.043357, 1, 0, 0, 1, 1,
-1.559414, 0.5885978, 1.471755, 1, 0, 0, 1, 1,
-1.548036, -0.2115966, -2.230035, 1, 0, 0, 1, 1,
-1.546816, 0.1928505, -1.355829, 0, 0, 0, 1, 1,
-1.508059, -0.3718458, -3.308865, 0, 0, 0, 1, 1,
-1.506668, -1.539783, -3.878857, 0, 0, 0, 1, 1,
-1.504251, -1.663437, -1.935461, 0, 0, 0, 1, 1,
-1.474451, 0.8374463, -1.985039, 0, 0, 0, 1, 1,
-1.467981, 0.1759598, -0.9762629, 0, 0, 0, 1, 1,
-1.467714, -1.110782, -1.573831, 0, 0, 0, 1, 1,
-1.465834, -0.1050709, -2.809957, 1, 1, 1, 1, 1,
-1.464052, 0.9664266, 0.8104458, 1, 1, 1, 1, 1,
-1.463865, -0.5389325, -2.383971, 1, 1, 1, 1, 1,
-1.462701, 0.3512282, -1.910318, 1, 1, 1, 1, 1,
-1.459287, -0.2569958, -0.9230622, 1, 1, 1, 1, 1,
-1.436588, 0.4415147, -2.525777, 1, 1, 1, 1, 1,
-1.432142, -1.466043, -1.872683, 1, 1, 1, 1, 1,
-1.423307, 0.0149511, -3.901217, 1, 1, 1, 1, 1,
-1.421777, -0.7650747, -1.073838, 1, 1, 1, 1, 1,
-1.418954, -0.7977143, -3.488801, 1, 1, 1, 1, 1,
-1.416698, 0.2163219, -2.57902, 1, 1, 1, 1, 1,
-1.414469, -0.3373812, -1.625658, 1, 1, 1, 1, 1,
-1.412755, -0.966417, -0.2144552, 1, 1, 1, 1, 1,
-1.407846, -0.6119235, -0.3182986, 1, 1, 1, 1, 1,
-1.392333, -0.809166, -2.101647, 1, 1, 1, 1, 1,
-1.37435, 0.04470505, -2.667171, 0, 0, 1, 1, 1,
-1.367481, -0.8726682, -1.717238, 1, 0, 0, 1, 1,
-1.365146, -0.8304746, -4.195851, 1, 0, 0, 1, 1,
-1.360186, 0.1459455, -1.807503, 1, 0, 0, 1, 1,
-1.358296, -0.3839469, -1.831029, 1, 0, 0, 1, 1,
-1.348162, 0.6721801, 0.3106312, 1, 0, 0, 1, 1,
-1.347753, -0.1665539, -1.131413, 0, 0, 0, 1, 1,
-1.345504, 0.2267987, -1.137579, 0, 0, 0, 1, 1,
-1.336275, -0.5611948, -2.958347, 0, 0, 0, 1, 1,
-1.332501, 0.0965561, -2.260262, 0, 0, 0, 1, 1,
-1.318377, -0.5743371, -3.255345, 0, 0, 0, 1, 1,
-1.316999, -0.1422642, -2.249902, 0, 0, 0, 1, 1,
-1.314661, 0.491791, -2.477462, 0, 0, 0, 1, 1,
-1.311055, -0.01128967, -1.489519, 1, 1, 1, 1, 1,
-1.309394, -1.437839, -1.560304, 1, 1, 1, 1, 1,
-1.292681, -1.0484, -3.203704, 1, 1, 1, 1, 1,
-1.290208, -0.4173997, -1.992893, 1, 1, 1, 1, 1,
-1.289711, -0.7006273, -1.916691, 1, 1, 1, 1, 1,
-1.286696, -0.9288969, -2.414774, 1, 1, 1, 1, 1,
-1.280517, -0.5929143, -1.549745, 1, 1, 1, 1, 1,
-1.276665, 0.7999523, -1.814307, 1, 1, 1, 1, 1,
-1.275129, 0.5169522, -0.661133, 1, 1, 1, 1, 1,
-1.27297, -0.5795617, -1.724943, 1, 1, 1, 1, 1,
-1.271785, -0.8714378, -1.341136, 1, 1, 1, 1, 1,
-1.271757, -0.4091803, -2.030803, 1, 1, 1, 1, 1,
-1.262922, -0.2132775, 0.4097011, 1, 1, 1, 1, 1,
-1.260463, -0.8471699, -1.467354, 1, 1, 1, 1, 1,
-1.259277, 0.3351794, -1.242522, 1, 1, 1, 1, 1,
-1.259177, -1.225419, -2.319761, 0, 0, 1, 1, 1,
-1.255419, -0.06735337, -3.784856, 1, 0, 0, 1, 1,
-1.254279, 0.7061678, -3.16298, 1, 0, 0, 1, 1,
-1.253309, 1.164461, 0.02701491, 1, 0, 0, 1, 1,
-1.249603, 0.7599615, -1.156779, 1, 0, 0, 1, 1,
-1.2463, 1.247148, 0.720084, 1, 0, 0, 1, 1,
-1.243947, 0.4680679, -2.143251, 0, 0, 0, 1, 1,
-1.242794, 1.21315, 0.04994978, 0, 0, 0, 1, 1,
-1.23503, 2.311929, -0.7023638, 0, 0, 0, 1, 1,
-1.228902, 1.730205, -2.310285, 0, 0, 0, 1, 1,
-1.224702, -1.807364, -1.410477, 0, 0, 0, 1, 1,
-1.221506, -0.3088152, -2.400985, 0, 0, 0, 1, 1,
-1.221434, -0.9265869, -1.936249, 0, 0, 0, 1, 1,
-1.215669, -0.3211708, -1.553681, 1, 1, 1, 1, 1,
-1.215372, 1.072653, -0.1821445, 1, 1, 1, 1, 1,
-1.210919, -0.3742536, -1.087745, 1, 1, 1, 1, 1,
-1.209778, 0.7228094, -0.38687, 1, 1, 1, 1, 1,
-1.209398, -0.8359031, -2.951398, 1, 1, 1, 1, 1,
-1.208714, -3.049772, -0.8518598, 1, 1, 1, 1, 1,
-1.20432, 0.518371, -0.31575, 1, 1, 1, 1, 1,
-1.202044, -0.807582, -0.5973424, 1, 1, 1, 1, 1,
-1.201498, 0.6699783, -0.6386648, 1, 1, 1, 1, 1,
-1.199706, 0.08019353, -3.251669, 1, 1, 1, 1, 1,
-1.196811, 0.5391476, -3.959767, 1, 1, 1, 1, 1,
-1.190986, 0.2705537, -2.756176, 1, 1, 1, 1, 1,
-1.178522, 0.7018554, -1.50622, 1, 1, 1, 1, 1,
-1.169874, 0.3880286, -1.430839, 1, 1, 1, 1, 1,
-1.158632, 0.09471041, -2.590914, 1, 1, 1, 1, 1,
-1.148498, -0.9436067, -1.606393, 0, 0, 1, 1, 1,
-1.131923, 0.3633077, -1.761154, 1, 0, 0, 1, 1,
-1.131101, 0.7971711, 0.6355793, 1, 0, 0, 1, 1,
-1.129453, 0.1266055, 0.5055561, 1, 0, 0, 1, 1,
-1.119975, -2.18444, -1.530799, 1, 0, 0, 1, 1,
-1.112763, 0.3353797, -1.079141, 1, 0, 0, 1, 1,
-1.112763, 0.5677487, -0.6460274, 0, 0, 0, 1, 1,
-1.110819, -0.02704667, -0.4892507, 0, 0, 0, 1, 1,
-1.105138, 0.2486244, -0.9347987, 0, 0, 0, 1, 1,
-1.105061, -0.3588268, -1.145302, 0, 0, 0, 1, 1,
-1.104818, -0.4141919, -4.199709, 0, 0, 0, 1, 1,
-1.099219, 1.50864, -2.454598, 0, 0, 0, 1, 1,
-1.097838, -1.511265, -2.791517, 0, 0, 0, 1, 1,
-1.091045, 0.04016125, -1.71142, 1, 1, 1, 1, 1,
-1.08538, 0.8653146, -1.446044, 1, 1, 1, 1, 1,
-1.080237, -0.8337405, -1.540798, 1, 1, 1, 1, 1,
-1.074875, -0.01371675, -1.314373, 1, 1, 1, 1, 1,
-1.070121, -1.714029, -3.300559, 1, 1, 1, 1, 1,
-1.057023, -0.3072574, -2.3057, 1, 1, 1, 1, 1,
-1.05135, -0.6024294, -2.485492, 1, 1, 1, 1, 1,
-1.050408, 0.1362108, -1.667591, 1, 1, 1, 1, 1,
-1.043912, 0.2352376, 0.3687781, 1, 1, 1, 1, 1,
-1.039848, 0.043624, -1.366299, 1, 1, 1, 1, 1,
-1.036873, 1.255153, -2.00943, 1, 1, 1, 1, 1,
-1.036601, -0.8865828, -3.527485, 1, 1, 1, 1, 1,
-1.035022, -0.9539717, -2.398483, 1, 1, 1, 1, 1,
-1.031493, 1.037633, -0.3711289, 1, 1, 1, 1, 1,
-1.020763, -0.5484689, -3.195685, 1, 1, 1, 1, 1,
-1.020228, -0.134969, -3.108444, 0, 0, 1, 1, 1,
-1.013539, -1.149156, -2.492308, 1, 0, 0, 1, 1,
-1.007157, -0.1937879, -1.218591, 1, 0, 0, 1, 1,
-1.006235, 0.4094085, -2.209275, 1, 0, 0, 1, 1,
-0.9936529, 0.5199968, 0.9636738, 1, 0, 0, 1, 1,
-0.9932423, 0.245556, -1.537083, 1, 0, 0, 1, 1,
-0.9876707, -1.06251, -2.563359, 0, 0, 0, 1, 1,
-0.9857588, -0.3746254, -2.155512, 0, 0, 0, 1, 1,
-0.9778699, 1.09145, 0.5555195, 0, 0, 0, 1, 1,
-0.9765826, -0.9835911, -2.470663, 0, 0, 0, 1, 1,
-0.9756643, 0.89093, -1.106252, 0, 0, 0, 1, 1,
-0.9479895, -0.1130627, -1.865874, 0, 0, 0, 1, 1,
-0.9471208, -0.1128527, -2.122597, 0, 0, 0, 1, 1,
-0.9390551, -0.7167705, -0.378228, 1, 1, 1, 1, 1,
-0.9389427, 0.6345654, -0.4343436, 1, 1, 1, 1, 1,
-0.9258268, -1.724594, -1.785112, 1, 1, 1, 1, 1,
-0.9229162, 0.3766559, -2.013277, 1, 1, 1, 1, 1,
-0.9166417, -1.51841, -2.193085, 1, 1, 1, 1, 1,
-0.9134473, 0.9610807, 0.2171306, 1, 1, 1, 1, 1,
-0.9125669, -0.3436742, -3.219562, 1, 1, 1, 1, 1,
-0.9089705, 0.8998439, -0.3410244, 1, 1, 1, 1, 1,
-0.9074414, -2.117619, -1.794254, 1, 1, 1, 1, 1,
-0.9062969, 1.063092, -0.5700533, 1, 1, 1, 1, 1,
-0.90176, 1.520842, 0.5235387, 1, 1, 1, 1, 1,
-0.8999264, -0.1748178, -1.608106, 1, 1, 1, 1, 1,
-0.89727, 1.381948, -0.5085905, 1, 1, 1, 1, 1,
-0.8962609, -0.25001, -2.274438, 1, 1, 1, 1, 1,
-0.8957062, 0.356715, -2.756772, 1, 1, 1, 1, 1,
-0.8948008, 0.8703291, -0.420433, 0, 0, 1, 1, 1,
-0.8861313, -1.545339, -1.752589, 1, 0, 0, 1, 1,
-0.8766358, 0.5045251, -2.39509, 1, 0, 0, 1, 1,
-0.8665062, -1.669068, -4.231131, 1, 0, 0, 1, 1,
-0.8661821, 0.7500523, -0.8774208, 1, 0, 0, 1, 1,
-0.8646479, -0.4923749, -2.104881, 1, 0, 0, 1, 1,
-0.8634913, -1.148066, -1.593998, 0, 0, 0, 1, 1,
-0.8556257, -0.9020395, -3.588308, 0, 0, 0, 1, 1,
-0.8530515, 0.2383288, -1.530758, 0, 0, 0, 1, 1,
-0.8526746, 0.687887, -0.839753, 0, 0, 0, 1, 1,
-0.8477171, -0.3136253, -1.83423, 0, 0, 0, 1, 1,
-0.847603, 0.7894145, -2.188348, 0, 0, 0, 1, 1,
-0.8417782, -0.114106, -1.365929, 0, 0, 0, 1, 1,
-0.8347102, -0.7683384, -2.016911, 1, 1, 1, 1, 1,
-0.8312023, 1.846592, 0.433359, 1, 1, 1, 1, 1,
-0.8295072, 2.312186, -1.60032, 1, 1, 1, 1, 1,
-0.8277383, 1.17139, 0.6000085, 1, 1, 1, 1, 1,
-0.8257767, -0.5099818, -1.416184, 1, 1, 1, 1, 1,
-0.8215396, -1.483243, -3.267287, 1, 1, 1, 1, 1,
-0.8192225, -2.537603, -3.332545, 1, 1, 1, 1, 1,
-0.8158748, -0.8864406, -2.183203, 1, 1, 1, 1, 1,
-0.8130125, 0.8571435, -0.8300631, 1, 1, 1, 1, 1,
-0.8117468, -1.576589, -2.043091, 1, 1, 1, 1, 1,
-0.8086475, -0.4816462, -0.1160236, 1, 1, 1, 1, 1,
-0.8076292, 1.15413, -1.526469, 1, 1, 1, 1, 1,
-0.7993174, -1.335959, -2.979779, 1, 1, 1, 1, 1,
-0.7980803, -0.3688785, -2.404333, 1, 1, 1, 1, 1,
-0.7979485, -0.3958101, -2.425983, 1, 1, 1, 1, 1,
-0.7975908, -0.1689266, -2.62199, 0, 0, 1, 1, 1,
-0.7824308, -0.8428685, -5.448269, 1, 0, 0, 1, 1,
-0.7809879, 0.03876989, -1.968373, 1, 0, 0, 1, 1,
-0.7788687, -0.884758, -3.181305, 1, 0, 0, 1, 1,
-0.7785836, -0.03675271, -0.4424442, 1, 0, 0, 1, 1,
-0.7748148, -0.06297093, -2.38396, 1, 0, 0, 1, 1,
-0.7689309, -1.683738, -4.279892, 0, 0, 0, 1, 1,
-0.7672864, 1.697458, -0.03398459, 0, 0, 0, 1, 1,
-0.7636849, 0.5330421, -0.9322885, 0, 0, 0, 1, 1,
-0.7617592, -1.987927, -2.719748, 0, 0, 0, 1, 1,
-0.7597494, 0.09691421, -1.193693, 0, 0, 0, 1, 1,
-0.7584162, 1.854772, -0.6467847, 0, 0, 0, 1, 1,
-0.7573217, 0.7109368, -0.6943231, 0, 0, 0, 1, 1,
-0.7502899, 0.2659451, -0.07111349, 1, 1, 1, 1, 1,
-0.746293, 0.6667567, 0.1660929, 1, 1, 1, 1, 1,
-0.7441953, 1.294181, -0.2330541, 1, 1, 1, 1, 1,
-0.7437712, 1.887273, -2.202889, 1, 1, 1, 1, 1,
-0.7435716, -0.5473268, -2.857447, 1, 1, 1, 1, 1,
-0.7261858, -0.4047881, -2.729722, 1, 1, 1, 1, 1,
-0.7229755, 0.7801578, -0.1244432, 1, 1, 1, 1, 1,
-0.7213393, 0.8515815, -1.269393, 1, 1, 1, 1, 1,
-0.7205198, 0.1686692, -1.25578, 1, 1, 1, 1, 1,
-0.7172989, -1.624994, -3.081965, 1, 1, 1, 1, 1,
-0.7124279, -0.3379126, -1.190437, 1, 1, 1, 1, 1,
-0.7116034, -0.09970511, -3.211259, 1, 1, 1, 1, 1,
-0.70935, -0.4262999, -3.098236, 1, 1, 1, 1, 1,
-0.7015649, -0.5265695, -2.594857, 1, 1, 1, 1, 1,
-0.6995101, -0.02842473, -1.432578, 1, 1, 1, 1, 1,
-0.6992882, 0.4808441, -0.8483031, 0, 0, 1, 1, 1,
-0.6989448, 1.74822, 1.090885, 1, 0, 0, 1, 1,
-0.6989263, 1.276652, -0.6961628, 1, 0, 0, 1, 1,
-0.6986092, 0.8431202, -0.2838117, 1, 0, 0, 1, 1,
-0.6974372, 0.6888939, 0.7706692, 1, 0, 0, 1, 1,
-0.6905805, -0.9782558, -1.790381, 1, 0, 0, 1, 1,
-0.6842233, -1.423298, -4.857076, 0, 0, 0, 1, 1,
-0.68038, -1.956004, -4.482929, 0, 0, 0, 1, 1,
-0.6801092, -0.03727767, -2.663589, 0, 0, 0, 1, 1,
-0.677823, -1.648323, -0.9424658, 0, 0, 0, 1, 1,
-0.6774871, -0.826367, -0.1200893, 0, 0, 0, 1, 1,
-0.6773845, 0.9757363, 0.5446437, 0, 0, 0, 1, 1,
-0.6770048, 1.980507, -1.238339, 0, 0, 0, 1, 1,
-0.6736163, -0.9039345, -3.280778, 1, 1, 1, 1, 1,
-0.671998, 0.3115369, 1.201436, 1, 1, 1, 1, 1,
-0.6649703, -0.6878051, -2.119853, 1, 1, 1, 1, 1,
-0.6628472, -1.592347, -5.170717, 1, 1, 1, 1, 1,
-0.6615421, -0.2733202, -1.799337, 1, 1, 1, 1, 1,
-0.6556545, 0.1231703, -1.631731, 1, 1, 1, 1, 1,
-0.6506891, -0.5306518, -0.0921952, 1, 1, 1, 1, 1,
-0.641732, -0.4975077, -1.927649, 1, 1, 1, 1, 1,
-0.637126, 0.2667069, -1.702739, 1, 1, 1, 1, 1,
-0.6330531, -1.082077, -2.951396, 1, 1, 1, 1, 1,
-0.6319896, -0.3773483, -1.53875, 1, 1, 1, 1, 1,
-0.6317095, -0.9666883, -2.680425, 1, 1, 1, 1, 1,
-0.6273082, 1.625405, -0.6145425, 1, 1, 1, 1, 1,
-0.6257853, 0.1386934, -0.6799124, 1, 1, 1, 1, 1,
-0.6251264, 1.40858, 0.5668941, 1, 1, 1, 1, 1,
-0.6180313, 0.5994537, -1.559013, 0, 0, 1, 1, 1,
-0.6066113, 1.05188, 0.5183294, 1, 0, 0, 1, 1,
-0.6043902, 0.09626362, -2.088993, 1, 0, 0, 1, 1,
-0.6025969, -0.4185219, -1.386563, 1, 0, 0, 1, 1,
-0.600305, -1.106726, -2.642287, 1, 0, 0, 1, 1,
-0.5962422, -0.277055, -2.065768, 1, 0, 0, 1, 1,
-0.5938988, -0.9243891, -3.073369, 0, 0, 0, 1, 1,
-0.5935951, -0.6336061, -1.281482, 0, 0, 0, 1, 1,
-0.5927905, -0.1268509, -0.8030955, 0, 0, 0, 1, 1,
-0.5908521, -0.06450126, -1.334815, 0, 0, 0, 1, 1,
-0.5874364, -0.009121671, -2.147085, 0, 0, 0, 1, 1,
-0.5836667, 1.259967, -2.71851, 0, 0, 0, 1, 1,
-0.5819681, -0.7466776, -1.91693, 0, 0, 0, 1, 1,
-0.5782627, 0.1548834, -1.325153, 1, 1, 1, 1, 1,
-0.5746455, -1.790352, -2.298699, 1, 1, 1, 1, 1,
-0.5725501, -0.6074065, -3.772053, 1, 1, 1, 1, 1,
-0.5710755, 0.6096717, -0.6076392, 1, 1, 1, 1, 1,
-0.5691511, 0.1125115, -0.9378491, 1, 1, 1, 1, 1,
-0.5663343, 1.549237, 0.5943744, 1, 1, 1, 1, 1,
-0.5643502, -0.5358489, -2.744662, 1, 1, 1, 1, 1,
-0.5608169, -0.5179597, -1.571363, 1, 1, 1, 1, 1,
-0.5597987, 2.079771, -0.04466926, 1, 1, 1, 1, 1,
-0.5570129, 1.506383, 0.1258184, 1, 1, 1, 1, 1,
-0.5526366, 0.607857, -2.22189, 1, 1, 1, 1, 1,
-0.5524417, -0.9118726, -1.180858, 1, 1, 1, 1, 1,
-0.5517406, 0.5267874, -0.7163494, 1, 1, 1, 1, 1,
-0.5517284, 1.25853, -1.183457, 1, 1, 1, 1, 1,
-0.5498006, 0.1679284, 0.05854995, 1, 1, 1, 1, 1,
-0.5496536, -0.9563895, -3.520195, 0, 0, 1, 1, 1,
-0.5490707, -0.4629, -1.042856, 1, 0, 0, 1, 1,
-0.5479741, -2.245002, -3.311574, 1, 0, 0, 1, 1,
-0.5433311, 1.393235, -0.6806079, 1, 0, 0, 1, 1,
-0.5410586, 0.7873561, 0.6285307, 1, 0, 0, 1, 1,
-0.540238, -0.4656993, -4.14522, 1, 0, 0, 1, 1,
-0.5395707, 0.2429601, -1.296355, 0, 0, 0, 1, 1,
-0.5345021, 0.4904419, 0.4596538, 0, 0, 0, 1, 1,
-0.5320382, -0.1801029, -2.358004, 0, 0, 0, 1, 1,
-0.5259027, 0.6693625, -1.174165, 0, 0, 0, 1, 1,
-0.5173299, -1.61634, -2.619761, 0, 0, 0, 1, 1,
-0.5144404, -1.898624, -2.845493, 0, 0, 0, 1, 1,
-0.4979641, -1.449321, -2.428889, 0, 0, 0, 1, 1,
-0.4893532, 0.1316577, -1.225343, 1, 1, 1, 1, 1,
-0.489172, 1.746806, 0.2421737, 1, 1, 1, 1, 1,
-0.4857692, 0.9808141, -2.680782, 1, 1, 1, 1, 1,
-0.4855295, 0.05913117, -0.4225727, 1, 1, 1, 1, 1,
-0.4808459, -0.7059563, -2.309951, 1, 1, 1, 1, 1,
-0.477146, 0.1209848, -2.111372, 1, 1, 1, 1, 1,
-0.476219, -1.013492, -5.435152, 1, 1, 1, 1, 1,
-0.4513228, 0.01739227, -0.4635305, 1, 1, 1, 1, 1,
-0.4439584, 0.1175891, -1.992084, 1, 1, 1, 1, 1,
-0.4403867, 1.220091, -0.9861605, 1, 1, 1, 1, 1,
-0.4380996, -0.1814189, -1.789436, 1, 1, 1, 1, 1,
-0.4359418, -0.05105984, -2.709807, 1, 1, 1, 1, 1,
-0.4307136, 0.3993165, -0.32548, 1, 1, 1, 1, 1,
-0.4296051, -0.7410802, -3.958639, 1, 1, 1, 1, 1,
-0.4291908, -0.3052565, -1.906437, 1, 1, 1, 1, 1,
-0.427085, 0.06164859, 0.2571526, 0, 0, 1, 1, 1,
-0.4243019, -0.339458, -4.281035, 1, 0, 0, 1, 1,
-0.4236746, -0.8251752, -2.861486, 1, 0, 0, 1, 1,
-0.4236234, -0.326014, -0.7099808, 1, 0, 0, 1, 1,
-0.4234989, 1.540769, -0.07902499, 1, 0, 0, 1, 1,
-0.4213093, 0.7009034, -0.4516802, 1, 0, 0, 1, 1,
-0.4186352, -1.173205, -1.185958, 0, 0, 0, 1, 1,
-0.4184711, -0.9931875, -2.93187, 0, 0, 0, 1, 1,
-0.4154636, -0.5699977, -0.2386679, 0, 0, 0, 1, 1,
-0.4154105, 0.2561228, -2.234447, 0, 0, 0, 1, 1,
-0.4149697, 0.7675857, -1.31849, 0, 0, 0, 1, 1,
-0.4147236, 0.03766028, -2.40779, 0, 0, 0, 1, 1,
-0.410777, 0.8498937, -1.542171, 0, 0, 0, 1, 1,
-0.4063934, -0.537289, -4.059621, 1, 1, 1, 1, 1,
-0.4056737, -0.6005668, -2.400971, 1, 1, 1, 1, 1,
-0.4029795, 0.9023128, -1.131877, 1, 1, 1, 1, 1,
-0.3994717, -0.4978525, -1.777609, 1, 1, 1, 1, 1,
-0.3980031, 0.3883379, 0.1413197, 1, 1, 1, 1, 1,
-0.3968149, 0.7330669, 0.55642, 1, 1, 1, 1, 1,
-0.3923676, 0.6671215, -0.1533083, 1, 1, 1, 1, 1,
-0.3919389, -0.1457856, -2.611593, 1, 1, 1, 1, 1,
-0.3847106, 0.5753018, -0.5672508, 1, 1, 1, 1, 1,
-0.384194, 0.7963962, -2.0518, 1, 1, 1, 1, 1,
-0.3836067, 0.2472966, -0.495479, 1, 1, 1, 1, 1,
-0.3824578, 0.1003835, -1.232916, 1, 1, 1, 1, 1,
-0.379723, 1.267599, 0.7224779, 1, 1, 1, 1, 1,
-0.3790223, 0.8604825, -1.121604, 1, 1, 1, 1, 1,
-0.37525, 0.1650216, 0.2322671, 1, 1, 1, 1, 1,
-0.3747367, -1.03646, -3.870946, 0, 0, 1, 1, 1,
-0.3732096, -0.5207105, -1.780748, 1, 0, 0, 1, 1,
-0.3715544, 1.260227, -0.5003204, 1, 0, 0, 1, 1,
-0.3715485, 0.6685979, -1.310478, 1, 0, 0, 1, 1,
-0.3646685, 0.6013364, -0.8984381, 1, 0, 0, 1, 1,
-0.3633365, 0.8696607, -0.01635217, 1, 0, 0, 1, 1,
-0.3614959, -0.1858631, -2.026234, 0, 0, 0, 1, 1,
-0.3613022, -0.7380083, -3.269842, 0, 0, 0, 1, 1,
-0.3598137, -0.6268425, -3.662299, 0, 0, 0, 1, 1,
-0.3552797, 0.406203, -0.4720879, 0, 0, 0, 1, 1,
-0.3467139, 0.4722038, -0.6978523, 0, 0, 0, 1, 1,
-0.3466069, 0.6371294, 0.3433304, 0, 0, 0, 1, 1,
-0.3446758, 0.2563076, 0.7077922, 0, 0, 0, 1, 1,
-0.3423903, 1.207775, 0.8350642, 1, 1, 1, 1, 1,
-0.3422722, -1.837807, -4.392664, 1, 1, 1, 1, 1,
-0.3416984, 1.072684, 0.5760498, 1, 1, 1, 1, 1,
-0.3401695, 1.755736, -0.5128663, 1, 1, 1, 1, 1,
-0.3387267, -0.1339241, -3.536051, 1, 1, 1, 1, 1,
-0.3346718, -0.4653221, -3.024632, 1, 1, 1, 1, 1,
-0.3339131, 1.365605, 0.3069442, 1, 1, 1, 1, 1,
-0.3303351, -1.201152, -3.551149, 1, 1, 1, 1, 1,
-0.3302663, 0.6216254, 0.3876754, 1, 1, 1, 1, 1,
-0.3302257, 0.5666195, -0.4229028, 1, 1, 1, 1, 1,
-0.3298706, -0.1605877, -1.919376, 1, 1, 1, 1, 1,
-0.3290062, 0.7752917, -0.04204195, 1, 1, 1, 1, 1,
-0.3279658, 1.873675, -0.07522339, 1, 1, 1, 1, 1,
-0.3272513, -1.312778, -2.329229, 1, 1, 1, 1, 1,
-0.3271343, 1.312769, -0.6029984, 1, 1, 1, 1, 1,
-0.3260141, -2.046121, -1.577857, 0, 0, 1, 1, 1,
-0.3259854, 0.8446672, -0.6251926, 1, 0, 0, 1, 1,
-0.3229885, 1.056006, 0.0307641, 1, 0, 0, 1, 1,
-0.3202175, 0.1620338, -1.643791, 1, 0, 0, 1, 1,
-0.3194993, 1.024378, -0.1058623, 1, 0, 0, 1, 1,
-0.3179395, -0.1363601, -2.406318, 1, 0, 0, 1, 1,
-0.3097296, 0.3862519, -0.8793634, 0, 0, 0, 1, 1,
-0.3093666, -0.4724575, -3.542103, 0, 0, 0, 1, 1,
-0.3035704, 1.185379, 1.383764, 0, 0, 0, 1, 1,
-0.3005844, -0.8290424, -3.166086, 0, 0, 0, 1, 1,
-0.2977503, -0.01723818, -1.619762, 0, 0, 0, 1, 1,
-0.295244, 1.007807, 0.3117792, 0, 0, 0, 1, 1,
-0.2940447, 0.6427795, 0.6807669, 0, 0, 0, 1, 1,
-0.2932106, 1.694812, -2.697649, 1, 1, 1, 1, 1,
-0.2931447, -0.9532831, -2.636892, 1, 1, 1, 1, 1,
-0.2926957, 1.730793, -0.6113972, 1, 1, 1, 1, 1,
-0.2920365, -1.727751, -3.500493, 1, 1, 1, 1, 1,
-0.2910437, -1.285828, -3.44087, 1, 1, 1, 1, 1,
-0.290677, 0.4694308, -0.005608721, 1, 1, 1, 1, 1,
-0.2906491, 0.5761797, -2.274236, 1, 1, 1, 1, 1,
-0.2894355, -0.5570871, -2.799562, 1, 1, 1, 1, 1,
-0.2866985, -0.8221555, -2.044735, 1, 1, 1, 1, 1,
-0.2775637, -0.06678268, -0.7076862, 1, 1, 1, 1, 1,
-0.2731755, 2.003783, -0.02625465, 1, 1, 1, 1, 1,
-0.2725421, -0.6156292, -2.972834, 1, 1, 1, 1, 1,
-0.2710054, -1.972562, -2.40299, 1, 1, 1, 1, 1,
-0.2698118, -0.02555175, -1.499626, 1, 1, 1, 1, 1,
-0.2697913, 0.4804613, 0.4871542, 1, 1, 1, 1, 1,
-0.2647902, 0.6549929, 0.7309002, 0, 0, 1, 1, 1,
-0.2608321, 0.4481814, 0.06952079, 1, 0, 0, 1, 1,
-0.2578472, 2.092551, 2.589745, 1, 0, 0, 1, 1,
-0.2576694, -0.7604332, -4.151274, 1, 0, 0, 1, 1,
-0.2550808, 0.7980915, -1.01278, 1, 0, 0, 1, 1,
-0.2505964, 0.3431998, -1.590593, 1, 0, 0, 1, 1,
-0.2492041, -0.4463904, -2.805013, 0, 0, 0, 1, 1,
-0.2484517, 0.6620926, -0.1048027, 0, 0, 0, 1, 1,
-0.2456014, 1.265649, -0.8342128, 0, 0, 0, 1, 1,
-0.2454482, 0.6703997, -0.4473521, 0, 0, 0, 1, 1,
-0.2416969, 0.7118449, -0.2000956, 0, 0, 0, 1, 1,
-0.2348873, 0.8967934, -0.1997707, 0, 0, 0, 1, 1,
-0.2287172, -1.731382, -3.835391, 0, 0, 0, 1, 1,
-0.2264883, 1.417132, -1.869563, 1, 1, 1, 1, 1,
-0.226037, -1.310298, -3.957252, 1, 1, 1, 1, 1,
-0.225617, 0.7537133, 0.2358339, 1, 1, 1, 1, 1,
-0.2192873, -1.100729, -2.643068, 1, 1, 1, 1, 1,
-0.1999084, -1.54321, -3.662257, 1, 1, 1, 1, 1,
-0.1970748, -0.1892659, -2.047327, 1, 1, 1, 1, 1,
-0.1969923, 0.3753054, 0.2580484, 1, 1, 1, 1, 1,
-0.1851752, 0.6126325, -1.11159, 1, 1, 1, 1, 1,
-0.1844221, 1.808179, -0.4641018, 1, 1, 1, 1, 1,
-0.1821104, 0.722547, -0.2945581, 1, 1, 1, 1, 1,
-0.1790627, 1.905181, -0.4110736, 1, 1, 1, 1, 1,
-0.1745831, 0.7252922, -0.8760927, 1, 1, 1, 1, 1,
-0.1739928, -0.360848, -3.471704, 1, 1, 1, 1, 1,
-0.1733928, -0.09369504, -1.382338, 1, 1, 1, 1, 1,
-0.1733742, -1.787906, -3.102942, 1, 1, 1, 1, 1,
-0.1729138, -0.7339391, -3.727924, 0, 0, 1, 1, 1,
-0.1711381, -1.954738, -3.483477, 1, 0, 0, 1, 1,
-0.1705012, -0.7561942, -3.167985, 1, 0, 0, 1, 1,
-0.1694132, 1.345807, 0.9028203, 1, 0, 0, 1, 1,
-0.1637691, 1.049898, 0.1674372, 1, 0, 0, 1, 1,
-0.1591246, -0.7269364, -4.41835, 1, 0, 0, 1, 1,
-0.1561522, 0.9864184, -1.003132, 0, 0, 0, 1, 1,
-0.1554465, 0.2300079, -1.476839, 0, 0, 0, 1, 1,
-0.1466804, -0.2796589, -1.046418, 0, 0, 0, 1, 1,
-0.1445918, 1.312045, -0.2374978, 0, 0, 0, 1, 1,
-0.1294187, 0.6925417, -0.9527941, 0, 0, 0, 1, 1,
-0.1268263, -0.8038381, -1.709464, 0, 0, 0, 1, 1,
-0.1260058, -0.209477, -4.703485, 0, 0, 0, 1, 1,
-0.125794, -1.416241, -4.594175, 1, 1, 1, 1, 1,
-0.1201013, -1.50914, -2.983017, 1, 1, 1, 1, 1,
-0.1150127, -0.7701165, -4.086519, 1, 1, 1, 1, 1,
-0.1143137, 1.594607, -1.823866, 1, 1, 1, 1, 1,
-0.112229, -0.1941491, -2.315926, 1, 1, 1, 1, 1,
-0.1080251, 0.477175, -1.804131, 1, 1, 1, 1, 1,
-0.1028885, -0.2975653, -2.883379, 1, 1, 1, 1, 1,
-0.1008655, -0.7819799, -3.767304, 1, 1, 1, 1, 1,
-0.09669328, 0.487295, -1.022145, 1, 1, 1, 1, 1,
-0.0948112, -0.240412, -1.989005, 1, 1, 1, 1, 1,
-0.09353505, 0.5261116, -1.879835, 1, 1, 1, 1, 1,
-0.08247459, 0.4711962, 0.3610562, 1, 1, 1, 1, 1,
-0.07913464, -0.7346584, -3.750551, 1, 1, 1, 1, 1,
-0.07907453, -0.4425647, -4.230489, 1, 1, 1, 1, 1,
-0.07070693, 0.2403928, -0.4184873, 1, 1, 1, 1, 1,
-0.06781434, -0.1663459, -4.257132, 0, 0, 1, 1, 1,
-0.06731278, -0.04532041, -2.799127, 1, 0, 0, 1, 1,
-0.06634884, -1.80351, -4.091231, 1, 0, 0, 1, 1,
-0.06467602, 0.4931506, 0.4743117, 1, 0, 0, 1, 1,
-0.06374599, 1.014444, -0.7766227, 1, 0, 0, 1, 1,
-0.06030545, -0.8234336, -2.470575, 1, 0, 0, 1, 1,
-0.05995924, -1.436241, -2.738878, 0, 0, 0, 1, 1,
-0.05622108, 1.642947, 0.2871465, 0, 0, 0, 1, 1,
-0.0557978, 0.1901108, 0.0003306337, 0, 0, 0, 1, 1,
-0.05329432, -0.4034887, -2.331155, 0, 0, 0, 1, 1,
-0.05292789, -1.031095, -4.568518, 0, 0, 0, 1, 1,
-0.05227723, 0.5457589, -1.89935, 0, 0, 0, 1, 1,
-0.0521641, 0.8456465, -1.325171, 0, 0, 0, 1, 1,
-0.05076708, 1.272045, 2.106324, 1, 1, 1, 1, 1,
-0.04572111, -2.140635, -2.704587, 1, 1, 1, 1, 1,
-0.0445293, -1.049875, -3.152314, 1, 1, 1, 1, 1,
-0.04319643, -0.1854625, -2.786869, 1, 1, 1, 1, 1,
-0.03973718, -0.185941, -2.671142, 1, 1, 1, 1, 1,
-0.03818146, -0.7043664, -3.391474, 1, 1, 1, 1, 1,
-0.03742865, 1.395422, -0.6510837, 1, 1, 1, 1, 1,
-0.03694073, 0.400587, 0.6294758, 1, 1, 1, 1, 1,
-0.03539544, -1.538728, -3.157864, 1, 1, 1, 1, 1,
-0.03214023, -0.1699858, -1.318143, 1, 1, 1, 1, 1,
-0.02319144, -1.101403, -3.868223, 1, 1, 1, 1, 1,
-0.02222333, 0.6502654, -1.035502, 1, 1, 1, 1, 1,
-0.02060951, -0.007664502, -3.179586, 1, 1, 1, 1, 1,
-0.02055335, 0.1195491, 0.1028589, 1, 1, 1, 1, 1,
-0.01904277, 1.126115, 0.7284129, 1, 1, 1, 1, 1,
-0.01830259, 0.3689452, -0.6209706, 0, 0, 1, 1, 1,
-0.01474072, 1.757221, -0.3153068, 1, 0, 0, 1, 1,
-0.0141566, -0.04088169, -3.334329, 1, 0, 0, 1, 1,
-0.01314934, 0.08833176, -0.7614005, 1, 0, 0, 1, 1,
-0.01164475, 0.1945082, -0.3871683, 1, 0, 0, 1, 1,
-0.007264308, -0.5867278, -4.03042, 1, 0, 0, 1, 1,
-0.007150383, -0.2126201, -2.659178, 0, 0, 0, 1, 1,
-0.004733023, 0.02102043, -0.5246696, 0, 0, 0, 1, 1,
-0.004221973, -0.9667735, -2.179084, 0, 0, 0, 1, 1,
0.002775919, -0.4621017, 5.283186, 0, 0, 0, 1, 1,
0.004302483, 0.94938, 0.6353847, 0, 0, 0, 1, 1,
0.005499559, -1.239462, 3.291024, 0, 0, 0, 1, 1,
0.007360416, 0.184088, -1.059088, 0, 0, 0, 1, 1,
0.007851284, -0.02700525, 1.075281, 1, 1, 1, 1, 1,
0.009675817, 0.3697827, 0.1631984, 1, 1, 1, 1, 1,
0.009689504, -0.9065753, 4.040876, 1, 1, 1, 1, 1,
0.01678786, 0.6725041, 0.1304144, 1, 1, 1, 1, 1,
0.01718671, -0.8934628, 1.976673, 1, 1, 1, 1, 1,
0.01842233, 0.2153957, 0.8296822, 1, 1, 1, 1, 1,
0.01976009, -0.1664011, 1.356821, 1, 1, 1, 1, 1,
0.02055668, -0.5437914, 4.296142, 1, 1, 1, 1, 1,
0.02295145, -0.5365369, 5.168029, 1, 1, 1, 1, 1,
0.02308807, -1.9821, 1.728213, 1, 1, 1, 1, 1,
0.02328075, 0.2188427, 1.192887, 1, 1, 1, 1, 1,
0.03286411, 1.004378, 0.9957284, 1, 1, 1, 1, 1,
0.03405044, -0.9323087, 4.093135, 1, 1, 1, 1, 1,
0.03427616, -0.3614494, 3.611772, 1, 1, 1, 1, 1,
0.0367245, -1.038369, 1.298171, 1, 1, 1, 1, 1,
0.037657, -0.2293525, 2.996383, 0, 0, 1, 1, 1,
0.03943118, 0.8653123, -1.496426, 1, 0, 0, 1, 1,
0.04424943, 0.2281369, 0.8894047, 1, 0, 0, 1, 1,
0.04666349, -0.1672123, 4.518307, 1, 0, 0, 1, 1,
0.0468798, -0.1704878, 1.754476, 1, 0, 0, 1, 1,
0.05032786, -1.424708, 5.039026, 1, 0, 0, 1, 1,
0.05254559, 0.746234, -0.5784014, 0, 0, 0, 1, 1,
0.05363115, 3.340955, 1.411869, 0, 0, 0, 1, 1,
0.0549938, -0.6787492, 2.876514, 0, 0, 0, 1, 1,
0.05946203, -1.495658, 2.954302, 0, 0, 0, 1, 1,
0.06074968, -0.6855517, 3.743268, 0, 0, 0, 1, 1,
0.06288412, 0.9947352, -1.96295, 0, 0, 0, 1, 1,
0.07071762, -0.3988782, 1.935533, 0, 0, 0, 1, 1,
0.07437225, -1.819274, 2.741768, 1, 1, 1, 1, 1,
0.07532867, -0.7571607, 1.532446, 1, 1, 1, 1, 1,
0.0771059, -0.85028, 4.27677, 1, 1, 1, 1, 1,
0.07907644, 0.3654, 0.08492842, 1, 1, 1, 1, 1,
0.07965259, -0.2381991, 3.928519, 1, 1, 1, 1, 1,
0.08087234, -1.363156, 3.052422, 1, 1, 1, 1, 1,
0.08914687, -0.4489924, 2.163929, 1, 1, 1, 1, 1,
0.08922568, -0.6716832, 1.127317, 1, 1, 1, 1, 1,
0.09498596, -0.8324184, 2.416416, 1, 1, 1, 1, 1,
0.09595662, 1.748285, -0.3407729, 1, 1, 1, 1, 1,
0.09791161, 0.2993749, 1.707212, 1, 1, 1, 1, 1,
0.1028311, -0.2111967, 3.743889, 1, 1, 1, 1, 1,
0.1031233, 1.037379, -0.1074967, 1, 1, 1, 1, 1,
0.1035723, -0.5118971, 3.677558, 1, 1, 1, 1, 1,
0.1071702, -0.6434875, 2.914974, 1, 1, 1, 1, 1,
0.1082364, -1.385045, 3.182238, 0, 0, 1, 1, 1,
0.1096569, -0.368128, 3.977791, 1, 0, 0, 1, 1,
0.1102213, -0.06563731, 2.621001, 1, 0, 0, 1, 1,
0.1103311, 0.2435762, -0.1382837, 1, 0, 0, 1, 1,
0.1146301, -0.5153439, 1.683486, 1, 0, 0, 1, 1,
0.1168472, 0.21375, 1.383918, 1, 0, 0, 1, 1,
0.1205492, -1.911107, 2.975763, 0, 0, 0, 1, 1,
0.1217959, -0.7166742, 2.217815, 0, 0, 0, 1, 1,
0.1250313, -0.04381936, 3.543876, 0, 0, 0, 1, 1,
0.1270167, -0.1619982, 2.392005, 0, 0, 0, 1, 1,
0.1285991, 0.211145, 0.3753563, 0, 0, 0, 1, 1,
0.1288241, 0.5859587, 0.1720582, 0, 0, 0, 1, 1,
0.1321853, -1.447581, 2.125221, 0, 0, 0, 1, 1,
0.1366251, -2.073431, 3.344486, 1, 1, 1, 1, 1,
0.1383005, -0.5286596, 3.116393, 1, 1, 1, 1, 1,
0.1386456, -0.8537513, 3.45944, 1, 1, 1, 1, 1,
0.139363, 0.7430249, -0.4461023, 1, 1, 1, 1, 1,
0.1532661, -1.09526, 2.30711, 1, 1, 1, 1, 1,
0.1554423, -0.2922822, 1.806957, 1, 1, 1, 1, 1,
0.1566002, 0.3389699, 0.1919598, 1, 1, 1, 1, 1,
0.1582785, -0.1587657, 2.405256, 1, 1, 1, 1, 1,
0.1594361, -1.610929, 4.600428, 1, 1, 1, 1, 1,
0.1617777, 0.2931755, -0.928624, 1, 1, 1, 1, 1,
0.1671781, 1.973587, -0.3818244, 1, 1, 1, 1, 1,
0.1683681, -0.1323967, 3.935765, 1, 1, 1, 1, 1,
0.1706822, -0.9441506, 3.326785, 1, 1, 1, 1, 1,
0.17123, -0.812448, 2.572792, 1, 1, 1, 1, 1,
0.1749219, 1.653173, 1.121831, 1, 1, 1, 1, 1,
0.1821732, -0.624409, 0.7405902, 0, 0, 1, 1, 1,
0.1866299, -0.214706, 4.169903, 1, 0, 0, 1, 1,
0.1915584, 2.417784, 0.2051203, 1, 0, 0, 1, 1,
0.1959505, -1.007466, 2.938696, 1, 0, 0, 1, 1,
0.1964433, 0.295799, -0.5419652, 1, 0, 0, 1, 1,
0.2004348, 1.770624, 1.158576, 1, 0, 0, 1, 1,
0.203786, 0.3623534, 1.368701, 0, 0, 0, 1, 1,
0.2071277, -0.850159, 3.163867, 0, 0, 0, 1, 1,
0.2095138, -0.1867429, 2.645281, 0, 0, 0, 1, 1,
0.2098708, 0.3536643, -0.2102517, 0, 0, 0, 1, 1,
0.2158243, -0.3671687, 2.715899, 0, 0, 0, 1, 1,
0.2165271, -0.6836443, 2.487147, 0, 0, 0, 1, 1,
0.2170118, 0.03844592, 0.5265285, 0, 0, 0, 1, 1,
0.218223, 0.08031408, 1.571067, 1, 1, 1, 1, 1,
0.219581, 0.4655255, 2.664809, 1, 1, 1, 1, 1,
0.2288669, 0.03087302, 1.536627, 1, 1, 1, 1, 1,
0.2297202, -1.391178, 4.048001, 1, 1, 1, 1, 1,
0.233484, 0.7935838, -0.2775124, 1, 1, 1, 1, 1,
0.2335329, 1.157509, -0.7923395, 1, 1, 1, 1, 1,
0.234877, -0.1562233, 4.949875, 1, 1, 1, 1, 1,
0.2360665, -0.406726, 2.163319, 1, 1, 1, 1, 1,
0.2453679, 0.08558036, 0.3258857, 1, 1, 1, 1, 1,
0.2453736, -1.572552, 2.650797, 1, 1, 1, 1, 1,
0.2490818, -2.008911, 4.112607, 1, 1, 1, 1, 1,
0.2506238, 2.342536, -0.6956075, 1, 1, 1, 1, 1,
0.2534502, -0.2802561, 3.224571, 1, 1, 1, 1, 1,
0.2542198, -1.565899, 2.203305, 1, 1, 1, 1, 1,
0.2547499, -0.4481243, 5.412388, 1, 1, 1, 1, 1,
0.2556176, 0.7371716, -2.047742, 0, 0, 1, 1, 1,
0.2563908, -2.032922, 3.349644, 1, 0, 0, 1, 1,
0.2569897, -0.8473014, 2.637046, 1, 0, 0, 1, 1,
0.2587871, -2.042981, 3.186008, 1, 0, 0, 1, 1,
0.2609474, -0.7382464, 3.145239, 1, 0, 0, 1, 1,
0.2653857, -0.8302744, 2.775322, 1, 0, 0, 1, 1,
0.2664033, 1.059257, -1.949287, 0, 0, 0, 1, 1,
0.2695103, 0.8175626, -0.6481839, 0, 0, 0, 1, 1,
0.2710671, -0.3856252, 2.109346, 0, 0, 0, 1, 1,
0.2739159, -1.467398, 3.214839, 0, 0, 0, 1, 1,
0.2741849, -0.6110813, 1.713497, 0, 0, 0, 1, 1,
0.2786007, 0.8132434, 0.5251336, 0, 0, 0, 1, 1,
0.2789652, -1.752605, 3.607594, 0, 0, 0, 1, 1,
0.2799619, 0.5750846, 0.1612592, 1, 1, 1, 1, 1,
0.2827786, -0.02359797, 2.400873, 1, 1, 1, 1, 1,
0.2828021, 1.424096, -0.407548, 1, 1, 1, 1, 1,
0.2836383, -1.112966, 2.686644, 1, 1, 1, 1, 1,
0.2845378, 0.9619166, -0.1532197, 1, 1, 1, 1, 1,
0.2860306, -2.127021, 4.473253, 1, 1, 1, 1, 1,
0.2861229, 0.2278746, 2.516872, 1, 1, 1, 1, 1,
0.286278, -2.689619, 1.9577, 1, 1, 1, 1, 1,
0.2879867, -0.3995931, 1.888259, 1, 1, 1, 1, 1,
0.2916884, 0.3314084, -0.714847, 1, 1, 1, 1, 1,
0.2922691, 0.231628, 1.699198, 1, 1, 1, 1, 1,
0.2934713, -1.683831, 3.413872, 1, 1, 1, 1, 1,
0.2949366, 1.195033, 0.8583369, 1, 1, 1, 1, 1,
0.2951277, 1.2837, -0.2128932, 1, 1, 1, 1, 1,
0.3030294, 0.7900249, -0.650262, 1, 1, 1, 1, 1,
0.3046504, -0.281799, 2.682165, 0, 0, 1, 1, 1,
0.3050648, 0.6025458, 1.565831, 1, 0, 0, 1, 1,
0.3095081, -0.9570498, 1.406568, 1, 0, 0, 1, 1,
0.3123332, 1.319362, 1.826326, 1, 0, 0, 1, 1,
0.3180811, 2.60305, -0.5408093, 1, 0, 0, 1, 1,
0.3202309, 0.4340102, 1.365993, 1, 0, 0, 1, 1,
0.3242398, 0.7356581, 0.02539613, 0, 0, 0, 1, 1,
0.3251202, 0.7086694, 0.5491446, 0, 0, 0, 1, 1,
0.3274853, 0.2620536, 1.780477, 0, 0, 0, 1, 1,
0.3283731, 1.234, -0.5520738, 0, 0, 0, 1, 1,
0.3324422, 1.47049, -0.7965938, 0, 0, 0, 1, 1,
0.3345167, 1.886205, -0.7618371, 0, 0, 0, 1, 1,
0.3349676, 0.05157173, 0.6424181, 0, 0, 0, 1, 1,
0.3364289, -0.5808598, 2.13311, 1, 1, 1, 1, 1,
0.3370548, -0.8272207, 2.949371, 1, 1, 1, 1, 1,
0.3406581, 0.1896982, 2.379567, 1, 1, 1, 1, 1,
0.3439201, 0.5451548, 2.10129, 1, 1, 1, 1, 1,
0.3467205, -0.2822597, 1.254567, 1, 1, 1, 1, 1,
0.3476036, 0.9733894, 1.063638, 1, 1, 1, 1, 1,
0.3624278, -0.7774069, 1.807072, 1, 1, 1, 1, 1,
0.3661883, 0.7069553, -0.1396492, 1, 1, 1, 1, 1,
0.367834, -1.040167, 4.893557, 1, 1, 1, 1, 1,
0.3719134, 0.6175991, 0.3162089, 1, 1, 1, 1, 1,
0.3770444, -0.1122139, 2.22515, 1, 1, 1, 1, 1,
0.3770996, 0.9554969, -0.3719244, 1, 1, 1, 1, 1,
0.3846299, 0.02369737, 2.638546, 1, 1, 1, 1, 1,
0.3855224, 2.204656, 0.492775, 1, 1, 1, 1, 1,
0.38558, -0.971854, 4.018182, 1, 1, 1, 1, 1,
0.3893842, -0.5252567, 1.42588, 0, 0, 1, 1, 1,
0.3921706, 0.3542243, 1.363176, 1, 0, 0, 1, 1,
0.3933393, 0.1378079, 1.970623, 1, 0, 0, 1, 1,
0.3948581, -0.6133075, 2.209777, 1, 0, 0, 1, 1,
0.3954038, -0.7628096, 3.653859, 1, 0, 0, 1, 1,
0.4109162, 0.9524134, 2.238019, 1, 0, 0, 1, 1,
0.4146277, 0.2081534, 0.5277115, 0, 0, 0, 1, 1,
0.4173666, -0.07044421, 2.399479, 0, 0, 0, 1, 1,
0.4174888, 1.194242, 1.546248, 0, 0, 0, 1, 1,
0.4179193, -0.05278558, 1.907187, 0, 0, 0, 1, 1,
0.4242364, 0.7928341, 1.115268, 0, 0, 0, 1, 1,
0.4249584, 1.957255, 0.2674223, 0, 0, 0, 1, 1,
0.4273832, -1.472133, 3.76575, 0, 0, 0, 1, 1,
0.4300992, -0.7882366, 3.115056, 1, 1, 1, 1, 1,
0.4356511, -1.300192, 3.6871, 1, 1, 1, 1, 1,
0.4367716, -1.705793, 1.483472, 1, 1, 1, 1, 1,
0.4418799, -0.1369968, 2.320385, 1, 1, 1, 1, 1,
0.4419206, 0.4297603, 0.2068326, 1, 1, 1, 1, 1,
0.4495531, 0.1573527, 0.2716305, 1, 1, 1, 1, 1,
0.4526314, -1.004568, 2.007092, 1, 1, 1, 1, 1,
0.4582513, 0.3645461, 1.75134, 1, 1, 1, 1, 1,
0.4586157, -1.096384, 2.566402, 1, 1, 1, 1, 1,
0.4598725, -1.890086, 4.147839, 1, 1, 1, 1, 1,
0.4602118, -0.239696, 3.8754, 1, 1, 1, 1, 1,
0.4607525, -0.3047671, 3.025464, 1, 1, 1, 1, 1,
0.4608117, 0.2366346, 1.043988, 1, 1, 1, 1, 1,
0.4609275, 0.5344847, 0.5592005, 1, 1, 1, 1, 1,
0.461364, -0.2015316, 0.4633369, 1, 1, 1, 1, 1,
0.4625232, 1.289092, 0.6870582, 0, 0, 1, 1, 1,
0.4630527, -0.4907679, 2.106853, 1, 0, 0, 1, 1,
0.4650468, 0.8114724, -0.6404352, 1, 0, 0, 1, 1,
0.4748745, 0.8337346, 1.40484, 1, 0, 0, 1, 1,
0.4780514, -0.7915462, 1.430782, 1, 0, 0, 1, 1,
0.4831136, -1.294002, 2.673455, 1, 0, 0, 1, 1,
0.491529, -1.073869, 1.844328, 0, 0, 0, 1, 1,
0.4919572, 0.0312927, 0.968759, 0, 0, 0, 1, 1,
0.4948773, -1.114035, 1.280896, 0, 0, 0, 1, 1,
0.4955249, 0.7557907, -0.8546398, 0, 0, 0, 1, 1,
0.4971165, -0.3157745, 0.978731, 0, 0, 0, 1, 1,
0.4977965, 2.021156, -0.4681804, 0, 0, 0, 1, 1,
0.5076339, -0.2719579, 3.480741, 0, 0, 0, 1, 1,
0.5173834, -0.691894, 3.282538, 1, 1, 1, 1, 1,
0.5273615, 1.399126, 0.5776091, 1, 1, 1, 1, 1,
0.5285108, -1.399858, 3.861423, 1, 1, 1, 1, 1,
0.5301208, 0.6568188, -0.02884429, 1, 1, 1, 1, 1,
0.5307808, -0.7424908, 3.191128, 1, 1, 1, 1, 1,
0.5331063, -0.8318818, 3.117989, 1, 1, 1, 1, 1,
0.5351982, -0.2877971, 0.7653354, 1, 1, 1, 1, 1,
0.5378995, -0.0008766733, 2.086725, 1, 1, 1, 1, 1,
0.5474027, 0.6540692, -2.099366, 1, 1, 1, 1, 1,
0.5489216, -0.06155249, 1.405602, 1, 1, 1, 1, 1,
0.5522119, 0.2083086, 0.3579347, 1, 1, 1, 1, 1,
0.5523032, -0.3650672, 1.116124, 1, 1, 1, 1, 1,
0.5559555, -1.759621, 1.771396, 1, 1, 1, 1, 1,
0.5659005, 1.364763, 1.413417, 1, 1, 1, 1, 1,
0.5692427, -0.5625929, 3.394704, 1, 1, 1, 1, 1,
0.5889063, -0.4644568, 3.214994, 0, 0, 1, 1, 1,
0.5944299, 0.6987847, 0.8692979, 1, 0, 0, 1, 1,
0.5955226, 0.08480846, 1.656166, 1, 0, 0, 1, 1,
0.5982836, 0.3977293, 0.9275455, 1, 0, 0, 1, 1,
0.5987002, 0.3673694, 0.387957, 1, 0, 0, 1, 1,
0.6002462, -1.622913, 1.573007, 1, 0, 0, 1, 1,
0.6030675, 0.7794384, 1.841385, 0, 0, 0, 1, 1,
0.6041085, 2.563711, -0.9126857, 0, 0, 0, 1, 1,
0.608658, 0.4530224, 1.767053, 0, 0, 0, 1, 1,
0.61336, 2.331433, 1.187178, 0, 0, 0, 1, 1,
0.6150858, -0.06351355, 1.187952, 0, 0, 0, 1, 1,
0.6151012, -0.03566727, 1.780708, 0, 0, 0, 1, 1,
0.6163735, 0.1791441, -0.8868226, 0, 0, 0, 1, 1,
0.6173055, -1.319157, 4.868661, 1, 1, 1, 1, 1,
0.6184011, 2.230001, 1.496805, 1, 1, 1, 1, 1,
0.6185086, 1.110018, -1.6268, 1, 1, 1, 1, 1,
0.6232927, -1.72075, 4.010499, 1, 1, 1, 1, 1,
0.6337567, -0.5892929, 3.324258, 1, 1, 1, 1, 1,
0.6366506, 0.4527206, 0.6946039, 1, 1, 1, 1, 1,
0.6379284, 1.088607, -0.3198916, 1, 1, 1, 1, 1,
0.6399678, 0.04075821, 0.01765174, 1, 1, 1, 1, 1,
0.6400306, 0.3414974, 1.49808, 1, 1, 1, 1, 1,
0.6417647, 0.452857, 2.883658, 1, 1, 1, 1, 1,
0.6445006, 1.667737, -0.6441197, 1, 1, 1, 1, 1,
0.646137, 0.04644043, 1.183972, 1, 1, 1, 1, 1,
0.646624, 1.148092, 1.411744, 1, 1, 1, 1, 1,
0.6475068, -0.5555773, 4.452336, 1, 1, 1, 1, 1,
0.6479076, 1.438727, 0.2702427, 1, 1, 1, 1, 1,
0.6479452, 1.376475, -0.5492709, 0, 0, 1, 1, 1,
0.6501209, 1.07704, -0.703796, 1, 0, 0, 1, 1,
0.653654, 1.321351, -0.8915319, 1, 0, 0, 1, 1,
0.6540024, -0.114545, 1.736564, 1, 0, 0, 1, 1,
0.6559919, 0.5539434, 0.7512829, 1, 0, 0, 1, 1,
0.6647605, -1.472761, 3.314898, 1, 0, 0, 1, 1,
0.6701642, 1.679112, -0.2780526, 0, 0, 0, 1, 1,
0.6713709, 0.6542199, 0.6281779, 0, 0, 0, 1, 1,
0.6718068, 1.044701, 1.94799, 0, 0, 0, 1, 1,
0.6743326, 0.3114578, 2.347791, 0, 0, 0, 1, 1,
0.6820202, -0.4157026, 2.173365, 0, 0, 0, 1, 1,
0.6839429, -0.08832305, 1.10222, 0, 0, 0, 1, 1,
0.6868692, 0.4853576, 0.01884934, 0, 0, 0, 1, 1,
0.6906787, -0.09581013, 0.6058031, 1, 1, 1, 1, 1,
0.6907227, -0.5925763, 2.546649, 1, 1, 1, 1, 1,
0.6918676, -0.4801677, 2.855815, 1, 1, 1, 1, 1,
0.6969399, -0.6150353, 2.793751, 1, 1, 1, 1, 1,
0.7020256, -1.079366, 1.161554, 1, 1, 1, 1, 1,
0.7102218, 1.791631, 0.3898544, 1, 1, 1, 1, 1,
0.7149398, 0.6179587, 1.707084, 1, 1, 1, 1, 1,
0.7163259, -1.7617, 2.277869, 1, 1, 1, 1, 1,
0.7173962, -0.5385262, 1.806464, 1, 1, 1, 1, 1,
0.7204558, -0.04725228, 2.424831, 1, 1, 1, 1, 1,
0.7258905, 0.6388469, 1.595161, 1, 1, 1, 1, 1,
0.7268056, -0.6087573, 2.987808, 1, 1, 1, 1, 1,
0.7278893, -0.1135622, 0.3854426, 1, 1, 1, 1, 1,
0.7319642, -0.5449044, 1.273064, 1, 1, 1, 1, 1,
0.7338974, -0.4760954, 2.188923, 1, 1, 1, 1, 1,
0.7347714, 0.7938226, -0.2494213, 0, 0, 1, 1, 1,
0.7380024, -0.01086461, 1.079025, 1, 0, 0, 1, 1,
0.7396117, 0.5643739, 0.7425559, 1, 0, 0, 1, 1,
0.7432435, -0.1907022, 1.647238, 1, 0, 0, 1, 1,
0.7505143, -0.04998749, 1.248957, 1, 0, 0, 1, 1,
0.7512115, 0.453609, 2.095491, 1, 0, 0, 1, 1,
0.7527803, -1.221035, 1.990379, 0, 0, 0, 1, 1,
0.755136, 1.637162, 1.456613, 0, 0, 0, 1, 1,
0.7564909, -0.3857731, 3.496208, 0, 0, 0, 1, 1,
0.7568774, 0.6729653, 0.5864932, 0, 0, 0, 1, 1,
0.7720597, 0.9308482, 1.549613, 0, 0, 0, 1, 1,
0.7844273, 0.03477211, -0.601146, 0, 0, 0, 1, 1,
0.7851417, 0.7904637, 0.3062172, 0, 0, 0, 1, 1,
0.785431, 2.890973, 0.2691085, 1, 1, 1, 1, 1,
0.7929044, 0.2492969, 0.9053866, 1, 1, 1, 1, 1,
0.7940511, 0.7604057, -0.3423951, 1, 1, 1, 1, 1,
0.7942341, -0.6772195, 3.246009, 1, 1, 1, 1, 1,
0.7945123, 3.010449, -1.686388, 1, 1, 1, 1, 1,
0.8069624, -0.0221376, 1.637033, 1, 1, 1, 1, 1,
0.8112152, -1.207379, 2.972918, 1, 1, 1, 1, 1,
0.8124728, -1.45057, 0.5815977, 1, 1, 1, 1, 1,
0.8137811, -1.902503, 3.365063, 1, 1, 1, 1, 1,
0.8159642, 0.5285469, -0.900821, 1, 1, 1, 1, 1,
0.8161221, -0.2999204, 0.7425014, 1, 1, 1, 1, 1,
0.8172836, 0.9112122, 0.9223291, 1, 1, 1, 1, 1,
0.8205145, -1.109288, 3.346462, 1, 1, 1, 1, 1,
0.8215601, -1.168787, 2.960096, 1, 1, 1, 1, 1,
0.8233042, 2.149814, 0.04948177, 1, 1, 1, 1, 1,
0.8374012, 1.078191, 2.642025, 0, 0, 1, 1, 1,
0.8376188, 0.1177939, 1.086589, 1, 0, 0, 1, 1,
0.8422886, 0.785071, 1.052113, 1, 0, 0, 1, 1,
0.8450812, -0.8240105, 1.406044, 1, 0, 0, 1, 1,
0.8469917, -1.088843, 2.30886, 1, 0, 0, 1, 1,
0.8477398, -1.762969, 3.367253, 1, 0, 0, 1, 1,
0.8498735, -0.007698903, 1.941204, 0, 0, 0, 1, 1,
0.8500839, -0.2462975, 1.011695, 0, 0, 0, 1, 1,
0.8603937, 0.7354695, -0.6489734, 0, 0, 0, 1, 1,
0.8822365, -1.068538, 1.511334, 0, 0, 0, 1, 1,
0.8866241, -1.293939, 2.257542, 0, 0, 0, 1, 1,
0.8926497, -0.644551, 1.713429, 0, 0, 0, 1, 1,
0.9006333, 0.3513103, 0.4730683, 0, 0, 0, 1, 1,
0.9012958, 0.06315791, 1.056873, 1, 1, 1, 1, 1,
0.9123464, 0.08942175, 0.8366425, 1, 1, 1, 1, 1,
0.9140221, -1.257445, 2.303782, 1, 1, 1, 1, 1,
0.9181791, 0.2187992, 1.858064, 1, 1, 1, 1, 1,
0.9183747, -0.1675573, 1.512223, 1, 1, 1, 1, 1,
0.9184129, 0.3814877, 0.2516448, 1, 1, 1, 1, 1,
0.9186519, -0.01084876, 0.2606481, 1, 1, 1, 1, 1,
0.919113, -0.9724097, 2.974992, 1, 1, 1, 1, 1,
0.9194358, 2.207432, 0.2229423, 1, 1, 1, 1, 1,
0.9299303, -0.1471817, 1.122615, 1, 1, 1, 1, 1,
0.9305624, -0.07232568, 1.419449, 1, 1, 1, 1, 1,
0.9344561, -0.7906216, 1.302057, 1, 1, 1, 1, 1,
0.9378198, -0.7357485, 0.3838483, 1, 1, 1, 1, 1,
0.9392672, -1.636993, 2.549079, 1, 1, 1, 1, 1,
0.942295, -1.222597, 1.404496, 1, 1, 1, 1, 1,
0.9438168, 0.5064369, 0.3353048, 0, 0, 1, 1, 1,
0.9440215, -0.07083958, 0.09980758, 1, 0, 0, 1, 1,
0.9440652, -1.065032, 1.25481, 1, 0, 0, 1, 1,
0.9569355, 0.3657736, 1.306195, 1, 0, 0, 1, 1,
0.9662674, -1.615552, 1.320012, 1, 0, 0, 1, 1,
0.9783581, -0.2572118, 1.214068, 1, 0, 0, 1, 1,
0.9799163, -0.9669122, 3.458701, 0, 0, 0, 1, 1,
0.9862934, -0.9722855, 1.550122, 0, 0, 0, 1, 1,
0.9864612, -1.680281, 2.702621, 0, 0, 0, 1, 1,
0.991439, -0.6320261, 4.32349, 0, 0, 0, 1, 1,
0.9924859, -2.152283, 3.843621, 0, 0, 0, 1, 1,
0.9932352, -0.5513467, 2.686391, 0, 0, 0, 1, 1,
0.9953994, 1.138028, 0.9136704, 0, 0, 0, 1, 1,
1.001636, -0.4390337, 1.627244, 1, 1, 1, 1, 1,
1.002348, 0.5442232, 1.037944, 1, 1, 1, 1, 1,
1.006478, -1.379464, 1.359529, 1, 1, 1, 1, 1,
1.016689, -0.6364596, 2.592939, 1, 1, 1, 1, 1,
1.021962, 0.5295669, 1.225542, 1, 1, 1, 1, 1,
1.024403, 0.632397, 2.129061, 1, 1, 1, 1, 1,
1.039346, -2.455498, 3.1271, 1, 1, 1, 1, 1,
1.040204, 0.6132344, 2.702417, 1, 1, 1, 1, 1,
1.043827, 0.3139172, 1.324527, 1, 1, 1, 1, 1,
1.047116, -1.787467, 1.459745, 1, 1, 1, 1, 1,
1.053407, 0.4037187, 3.196171, 1, 1, 1, 1, 1,
1.063543, -2.197104, 1.335087, 1, 1, 1, 1, 1,
1.064492, 0.9791039, 0.1520405, 1, 1, 1, 1, 1,
1.064497, -0.8192723, 2.341806, 1, 1, 1, 1, 1,
1.06697, -0.2165483, 1.285126, 1, 1, 1, 1, 1,
1.077288, 1.961285, -0.2094317, 0, 0, 1, 1, 1,
1.077338, 0.09196603, 0.4923941, 1, 0, 0, 1, 1,
1.084435, -0.8505106, 1.463185, 1, 0, 0, 1, 1,
1.096315, 0.7618304, 1.143946, 1, 0, 0, 1, 1,
1.096669, 0.4616163, 0.5008094, 1, 0, 0, 1, 1,
1.102971, 1.724159, 0.1017014, 1, 0, 0, 1, 1,
1.103807, -0.05886574, 2.596581, 0, 0, 0, 1, 1,
1.114583, 1.224144, 0.1442605, 0, 0, 0, 1, 1,
1.1214, 0.04255168, 0.26429, 0, 0, 0, 1, 1,
1.122404, 1.740718, 0.5052863, 0, 0, 0, 1, 1,
1.12298, -0.5105529, 3.182414, 0, 0, 0, 1, 1,
1.132498, 1.083543, -0.8816308, 0, 0, 0, 1, 1,
1.136961, 0.4100769, 0.1084567, 0, 0, 0, 1, 1,
1.146037, -0.5984303, 1.402785, 1, 1, 1, 1, 1,
1.147299, 0.1244184, 1.118995, 1, 1, 1, 1, 1,
1.150444, -1.005166, 3.408076, 1, 1, 1, 1, 1,
1.159849, 0.07710375, 2.060835, 1, 1, 1, 1, 1,
1.163171, -2.033376, 0.1995989, 1, 1, 1, 1, 1,
1.166337, 1.513892, 0.2183906, 1, 1, 1, 1, 1,
1.169639, 1.127739, 1.67648, 1, 1, 1, 1, 1,
1.176382, -1.073653, 2.66994, 1, 1, 1, 1, 1,
1.17826, -0.439764, 2.104462, 1, 1, 1, 1, 1,
1.180268, 1.418344, 1.795581, 1, 1, 1, 1, 1,
1.194383, 0.2767159, -0.2515271, 1, 1, 1, 1, 1,
1.196521, -0.3166294, 1.598517, 1, 1, 1, 1, 1,
1.199144, -1.288614, 3.016517, 1, 1, 1, 1, 1,
1.209206, 1.656037, 1.035226, 1, 1, 1, 1, 1,
1.209672, -0.2905242, 2.982988, 1, 1, 1, 1, 1,
1.211261, 0.4626207, 0.2248325, 0, 0, 1, 1, 1,
1.212456, 1.181471, -0.3243287, 1, 0, 0, 1, 1,
1.215597, 2.119228, -0.05798127, 1, 0, 0, 1, 1,
1.215681, 0.4738982, 0.557116, 1, 0, 0, 1, 1,
1.229348, 1.655468, 2.837164, 1, 0, 0, 1, 1,
1.235836, -0.4979786, 2.016842, 1, 0, 0, 1, 1,
1.240239, 0.6576186, 0.6351523, 0, 0, 0, 1, 1,
1.246342, -1.341191, 1.166481, 0, 0, 0, 1, 1,
1.247492, -0.63831, 3.505961, 0, 0, 0, 1, 1,
1.255817, -0.701721, 3.536858, 0, 0, 0, 1, 1,
1.257404, -0.3481312, -0.8290966, 0, 0, 0, 1, 1,
1.274151, 0.1355959, 3.523349, 0, 0, 0, 1, 1,
1.274808, 0.8289464, 3.156153, 0, 0, 0, 1, 1,
1.276032, 0.5574661, 1.294764, 1, 1, 1, 1, 1,
1.302008, -0.2829684, 0.9628374, 1, 1, 1, 1, 1,
1.304498, 1.464075, 0.5207428, 1, 1, 1, 1, 1,
1.306651, -0.6166014, 2.999761, 1, 1, 1, 1, 1,
1.316103, -0.8475881, 4.223025, 1, 1, 1, 1, 1,
1.317123, 0.03462605, 0.3675165, 1, 1, 1, 1, 1,
1.317505, -0.5176521, 1.838139, 1, 1, 1, 1, 1,
1.319217, -0.8372426, 3.843212, 1, 1, 1, 1, 1,
1.321809, -2.149916, 2.455937, 1, 1, 1, 1, 1,
1.32352, 0.2110178, 0.8070181, 1, 1, 1, 1, 1,
1.327289, 0.3675974, -0.3232644, 1, 1, 1, 1, 1,
1.331211, -1.061928, 1.787856, 1, 1, 1, 1, 1,
1.336344, -0.7498693, 3.26286, 1, 1, 1, 1, 1,
1.340076, 0.5397086, 0.8115256, 1, 1, 1, 1, 1,
1.342294, -0.1843303, 0.8670092, 1, 1, 1, 1, 1,
1.349586, 0.0111397, 1.340433, 0, 0, 1, 1, 1,
1.35424, -1.301458, 1.888715, 1, 0, 0, 1, 1,
1.357317, -0.2073716, 0.4254404, 1, 0, 0, 1, 1,
1.362303, 1.714034, 1.896404, 1, 0, 0, 1, 1,
1.372265, -0.499419, 2.648128, 1, 0, 0, 1, 1,
1.384802, 0.1351898, 1.829072, 1, 0, 0, 1, 1,
1.427212, -0.2658811, 1.592945, 0, 0, 0, 1, 1,
1.430344, -0.6900471, 2.33525, 0, 0, 0, 1, 1,
1.445702, -0.5969542, 0.9739396, 0, 0, 0, 1, 1,
1.454373, 1.419258, 0.4037466, 0, 0, 0, 1, 1,
1.456322, 0.7219043, 2.457069, 0, 0, 0, 1, 1,
1.485941, 1.176648, -0.4331884, 0, 0, 0, 1, 1,
1.494355, -0.8011337, 1.135653, 0, 0, 0, 1, 1,
1.494463, -0.4976207, 1.108889, 1, 1, 1, 1, 1,
1.504505, -1.744242, 2.549843, 1, 1, 1, 1, 1,
1.515275, -0.3082058, 3.072061, 1, 1, 1, 1, 1,
1.527297, 1.412755, 2.54855, 1, 1, 1, 1, 1,
1.527946, 0.2704705, 0.8063598, 1, 1, 1, 1, 1,
1.528945, 0.3040001, 0.4741848, 1, 1, 1, 1, 1,
1.537127, -2.381199, 3.840818, 1, 1, 1, 1, 1,
1.542796, 0.3191317, 1.172737, 1, 1, 1, 1, 1,
1.546762, -2.847714, 2.573538, 1, 1, 1, 1, 1,
1.59628, -0.5408843, -1.174862, 1, 1, 1, 1, 1,
1.599305, -0.5414829, 3.9574, 1, 1, 1, 1, 1,
1.608943, 2.106883, 0.5263644, 1, 1, 1, 1, 1,
1.613591, 0.8719175, 0.2823862, 1, 1, 1, 1, 1,
1.626266, 0.1470874, 1.448998, 1, 1, 1, 1, 1,
1.627421, -1.293873, 2.760904, 1, 1, 1, 1, 1,
1.6296, -0.3714972, 1.22879, 0, 0, 1, 1, 1,
1.656095, 1.425985, 1.301375, 1, 0, 0, 1, 1,
1.675063, -0.5965617, 1.59003, 1, 0, 0, 1, 1,
1.67708, 0.2108463, 0.5292609, 1, 0, 0, 1, 1,
1.688727, 0.4341451, 0.8538215, 1, 0, 0, 1, 1,
1.691652, 0.8872495, 0.7437834, 1, 0, 0, 1, 1,
1.702692, -1.959676, 1.914824, 0, 0, 0, 1, 1,
1.717588, -1.55346, 2.687463, 0, 0, 0, 1, 1,
1.719001, 0.3613133, 1.768796, 0, 0, 0, 1, 1,
1.734493, 0.7335126, 1.632427, 0, 0, 0, 1, 1,
1.738818, -1.077687, 1.430724, 0, 0, 0, 1, 1,
1.740602, 0.6700482, 2.129028, 0, 0, 0, 1, 1,
1.755158, 1.129087, 1.36384, 0, 0, 0, 1, 1,
1.777712, 1.060569, 1.547775, 1, 1, 1, 1, 1,
1.796255, -1.222002, 2.151326, 1, 1, 1, 1, 1,
1.81918, 0.6520563, 1.966401, 1, 1, 1, 1, 1,
1.869775, 0.04012914, 0.7885994, 1, 1, 1, 1, 1,
1.879864, -1.150638, 2.676521, 1, 1, 1, 1, 1,
1.885128, 1.79179, 1.733433, 1, 1, 1, 1, 1,
1.920383, -0.1451751, 1.731689, 1, 1, 1, 1, 1,
1.920418, 0.8251858, 1.603288, 1, 1, 1, 1, 1,
1.950428, 0.2138748, 1.257688, 1, 1, 1, 1, 1,
1.967289, 0.325768, 1.549039, 1, 1, 1, 1, 1,
1.981727, -0.3291047, 2.206906, 1, 1, 1, 1, 1,
1.986295, 2.081812, 0.592485, 1, 1, 1, 1, 1,
2.029764, 0.3879389, 1.017594, 1, 1, 1, 1, 1,
2.035902, -0.2462881, 2.498675, 1, 1, 1, 1, 1,
2.059459, -0.4396102, 1.263879, 1, 1, 1, 1, 1,
2.062357, 1.334417, -0.5318012, 0, 0, 1, 1, 1,
2.077507, -0.8150927, 1.834947, 1, 0, 0, 1, 1,
2.147129, -0.8341759, 0.5250406, 1, 0, 0, 1, 1,
2.175743, 0.6427563, 2.068544, 1, 0, 0, 1, 1,
2.186453, 0.1070237, 2.219679, 1, 0, 0, 1, 1,
2.193033, 0.4810046, 2.145673, 1, 0, 0, 1, 1,
2.217152, -0.2303169, 1.278913, 0, 0, 0, 1, 1,
2.235397, 0.09356706, 0.1483244, 0, 0, 0, 1, 1,
2.263723, 0.04210361, 2.3391, 0, 0, 0, 1, 1,
2.331445, 1.525908, 0.7407024, 0, 0, 0, 1, 1,
2.363261, 1.865992, -0.8743982, 0, 0, 0, 1, 1,
2.477002, -0.07205693, 3.199711, 0, 0, 0, 1, 1,
2.548211, -0.6335638, 2.429136, 0, 0, 0, 1, 1,
2.699057, -0.09181868, 0.3658847, 1, 1, 1, 1, 1,
2.7161, 0.4215814, 0.7604629, 1, 1, 1, 1, 1,
2.731176, 0.5707415, 1.829819, 1, 1, 1, 1, 1,
2.801294, -0.4275005, 0.9949773, 1, 1, 1, 1, 1,
2.877807, 0.7119149, 2.112873, 1, 1, 1, 1, 1,
3.018634, -0.2390431, 1.565878, 1, 1, 1, 1, 1,
3.703163, -1.800053, 1.069207, 1, 1, 1, 1, 1
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
var radius = 9.78205;
var distance = 34.35904;
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
mvMatrix.translate( -0.2163815, -0.1455922, 0.01794052 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.35904);
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
