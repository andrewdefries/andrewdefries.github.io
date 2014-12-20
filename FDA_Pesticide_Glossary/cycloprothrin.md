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
-3.29844, 0.8768162, -2.59311, 1, 0, 0, 1,
-3.009749, -1.664781, -2.789876, 1, 0.007843138, 0, 1,
-2.958254, 0.06635075, -2.756685, 1, 0.01176471, 0, 1,
-2.792223, 0.2115571, 0.373172, 1, 0.01960784, 0, 1,
-2.726268, -1.310489, -0.2445813, 1, 0.02352941, 0, 1,
-2.591402, 0.4071096, -1.709517, 1, 0.03137255, 0, 1,
-2.432909, 0.1326888, -2.052588, 1, 0.03529412, 0, 1,
-2.389307, 0.2352173, -2.29672, 1, 0.04313726, 0, 1,
-2.318321, -0.5978183, 0.2623346, 1, 0.04705882, 0, 1,
-2.309946, -1.430383, -2.193777, 1, 0.05490196, 0, 1,
-2.305043, -1.070004, -2.05436, 1, 0.05882353, 0, 1,
-2.240009, 0.4142654, -1.236929, 1, 0.06666667, 0, 1,
-2.223562, -0.1722578, -1.381251, 1, 0.07058824, 0, 1,
-2.17751, -0.73589, -2.574217, 1, 0.07843138, 0, 1,
-2.168744, 0.3162443, -1.983075, 1, 0.08235294, 0, 1,
-2.121242, 2.060167, -1.430543, 1, 0.09019608, 0, 1,
-2.10347, 1.532699, -1.93015, 1, 0.09411765, 0, 1,
-2.101841, 0.7424469, -2.814785, 1, 0.1019608, 0, 1,
-2.061053, 0.6307072, -2.107489, 1, 0.1098039, 0, 1,
-2.058012, -0.05607292, -2.275921, 1, 0.1137255, 0, 1,
-2.057621, -0.3409008, -1.342949, 1, 0.1215686, 0, 1,
-2.047405, -1.939674, -3.792739, 1, 0.1254902, 0, 1,
-1.989547, -0.4604833, -1.269304, 1, 0.1333333, 0, 1,
-1.988712, 0.2968646, -2.342171, 1, 0.1372549, 0, 1,
-1.983628, 0.3229792, -0.6334167, 1, 0.145098, 0, 1,
-1.976198, -0.57193, -2.728167, 1, 0.1490196, 0, 1,
-1.974155, 0.8002728, -0.3746028, 1, 0.1568628, 0, 1,
-1.931913, -0.690695, -3.293349, 1, 0.1607843, 0, 1,
-1.929354, 0.8291045, 0.4450718, 1, 0.1686275, 0, 1,
-1.897267, 0.02756468, -2.141654, 1, 0.172549, 0, 1,
-1.890109, -0.4031416, -1.159707, 1, 0.1803922, 0, 1,
-1.851156, -0.8189579, -4.080914, 1, 0.1843137, 0, 1,
-1.844689, 1.325373, 0.1133342, 1, 0.1921569, 0, 1,
-1.840162, -0.1482277, -2.410172, 1, 0.1960784, 0, 1,
-1.820621, -1.036909, -2.77301, 1, 0.2039216, 0, 1,
-1.799659, 0.8079612, -2.519194, 1, 0.2117647, 0, 1,
-1.798957, 1.560583, -1.177063, 1, 0.2156863, 0, 1,
-1.772123, 0.2837688, -1.914044, 1, 0.2235294, 0, 1,
-1.771673, -0.3147244, -2.838618, 1, 0.227451, 0, 1,
-1.730819, -0.6515395, -3.616164, 1, 0.2352941, 0, 1,
-1.728264, 0.3913658, -2.795183, 1, 0.2392157, 0, 1,
-1.726274, 0.8461993, -0.4235028, 1, 0.2470588, 0, 1,
-1.708638, -1.157779, -1.289256, 1, 0.2509804, 0, 1,
-1.708301, -0.8294944, -1.739084, 1, 0.2588235, 0, 1,
-1.707972, -0.3344591, -0.727688, 1, 0.2627451, 0, 1,
-1.689171, -0.8345171, -1.864147, 1, 0.2705882, 0, 1,
-1.684876, -0.7339792, -1.000199, 1, 0.2745098, 0, 1,
-1.681023, 0.3712824, -0.9975221, 1, 0.282353, 0, 1,
-1.678782, 0.6154478, -0.4059076, 1, 0.2862745, 0, 1,
-1.654485, 0.3838146, -2.215588, 1, 0.2941177, 0, 1,
-1.628183, -0.7361458, -2.644621, 1, 0.3019608, 0, 1,
-1.610666, 0.8173376, -1.77066, 1, 0.3058824, 0, 1,
-1.600216, -0.1004042, -1.44675, 1, 0.3137255, 0, 1,
-1.593231, 0.1202657, -0.7189516, 1, 0.3176471, 0, 1,
-1.582645, -0.7991149, -2.348166, 1, 0.3254902, 0, 1,
-1.579291, -0.5553696, -1.116194, 1, 0.3294118, 0, 1,
-1.57516, -1.306979, -2.105515, 1, 0.3372549, 0, 1,
-1.574914, -0.50954, -3.937863, 1, 0.3411765, 0, 1,
-1.558305, 1.21773, -0.4410724, 1, 0.3490196, 0, 1,
-1.553466, 0.5267168, -0.8549269, 1, 0.3529412, 0, 1,
-1.55078, -1.943595, -1.547699, 1, 0.3607843, 0, 1,
-1.548375, 0.9687813, -0.1698191, 1, 0.3647059, 0, 1,
-1.534755, 1.118234, -0.8292891, 1, 0.372549, 0, 1,
-1.534282, 0.6686459, -3.504123, 1, 0.3764706, 0, 1,
-1.533134, 0.975976, -2.650728, 1, 0.3843137, 0, 1,
-1.527534, -0.9716269, -1.06471, 1, 0.3882353, 0, 1,
-1.508574, -0.321886, -0.9561332, 1, 0.3960784, 0, 1,
-1.503628, 0.8990031, -2.335295, 1, 0.4039216, 0, 1,
-1.498337, 0.2413764, -1.159491, 1, 0.4078431, 0, 1,
-1.497404, -2.380898, -1.13671, 1, 0.4156863, 0, 1,
-1.491536, -0.7217523, -0.5071142, 1, 0.4196078, 0, 1,
-1.475342, -0.2496771, -0.3153041, 1, 0.427451, 0, 1,
-1.473621, 0.6621907, -0.6322233, 1, 0.4313726, 0, 1,
-1.461461, -1.614915, -2.105307, 1, 0.4392157, 0, 1,
-1.440295, -0.08657914, -0.3859551, 1, 0.4431373, 0, 1,
-1.435508, 0.1771117, -0.6012611, 1, 0.4509804, 0, 1,
-1.435026, -0.9325427, -0.7599756, 1, 0.454902, 0, 1,
-1.420753, -0.4534307, 0.2701622, 1, 0.4627451, 0, 1,
-1.418707, -0.9862348, -2.809853, 1, 0.4666667, 0, 1,
-1.412301, -0.52959, -2.274707, 1, 0.4745098, 0, 1,
-1.408956, -0.5704443, -2.089135, 1, 0.4784314, 0, 1,
-1.398593, -2.170085, -2.711753, 1, 0.4862745, 0, 1,
-1.391316, 0.09627633, -0.03065475, 1, 0.4901961, 0, 1,
-1.357821, -0.1068639, -2.637874, 1, 0.4980392, 0, 1,
-1.345619, -1.352304, -2.760575, 1, 0.5058824, 0, 1,
-1.331641, 0.7381228, -2.411454, 1, 0.509804, 0, 1,
-1.326275, 0.6160769, -1.910938, 1, 0.5176471, 0, 1,
-1.3253, -0.407182, -1.193337, 1, 0.5215687, 0, 1,
-1.304818, -0.924392, -3.224727, 1, 0.5294118, 0, 1,
-1.300071, 2.524063, 1.094431, 1, 0.5333334, 0, 1,
-1.296793, -0.6458558, -1.031877, 1, 0.5411765, 0, 1,
-1.295446, 0.1018861, -1.443537, 1, 0.5450981, 0, 1,
-1.292829, -0.2232055, -1.840065, 1, 0.5529412, 0, 1,
-1.290337, 0.07506981, 0.629077, 1, 0.5568628, 0, 1,
-1.289777, -1.866412, -3.648335, 1, 0.5647059, 0, 1,
-1.286786, 0.200059, -0.1808095, 1, 0.5686275, 0, 1,
-1.28041, 0.9481384, -0.03958305, 1, 0.5764706, 0, 1,
-1.277837, -1.906274, -1.906437, 1, 0.5803922, 0, 1,
-1.275567, 1.105382, -0.9250469, 1, 0.5882353, 0, 1,
-1.259701, 0.8318904, -1.490707, 1, 0.5921569, 0, 1,
-1.259574, -2.152062, -1.203421, 1, 0.6, 0, 1,
-1.252391, 1.535835, -2.187277, 1, 0.6078432, 0, 1,
-1.249573, 1.92147, 1.450796, 1, 0.6117647, 0, 1,
-1.246086, -0.5706218, -2.255844, 1, 0.6196079, 0, 1,
-1.241199, 2.267675, 0.41966, 1, 0.6235294, 0, 1,
-1.228636, 0.5282457, -0.213418, 1, 0.6313726, 0, 1,
-1.218986, -0.5324078, -1.158017, 1, 0.6352941, 0, 1,
-1.214558, -0.09119032, -0.8075198, 1, 0.6431373, 0, 1,
-1.209152, 1.802223, -1.612164, 1, 0.6470588, 0, 1,
-1.206649, -1.917263, -2.443978, 1, 0.654902, 0, 1,
-1.199958, -1.229721, -3.674209, 1, 0.6588235, 0, 1,
-1.198401, -1.109802, -1.8642, 1, 0.6666667, 0, 1,
-1.185904, 0.5568298, -0.7610869, 1, 0.6705883, 0, 1,
-1.185836, -1.231039, -2.897744, 1, 0.6784314, 0, 1,
-1.178852, -0.714328, -1.805292, 1, 0.682353, 0, 1,
-1.160036, 0.7642696, 0.3783413, 1, 0.6901961, 0, 1,
-1.156456, -2.259893, -2.403017, 1, 0.6941177, 0, 1,
-1.153676, -0.24254, -3.323809, 1, 0.7019608, 0, 1,
-1.1522, -0.6068768, -3.156835, 1, 0.7098039, 0, 1,
-1.151149, -0.776033, -0.7802858, 1, 0.7137255, 0, 1,
-1.149327, 1.045121, -1.081241, 1, 0.7215686, 0, 1,
-1.149267, -0.09548146, -2.005176, 1, 0.7254902, 0, 1,
-1.14169, -0.2531953, -2.909878, 1, 0.7333333, 0, 1,
-1.141352, -0.1253664, -2.539685, 1, 0.7372549, 0, 1,
-1.137934, 0.3172093, -0.1591309, 1, 0.7450981, 0, 1,
-1.125836, 1.562097, -0.9784425, 1, 0.7490196, 0, 1,
-1.123619, -0.9401422, -1.299055, 1, 0.7568628, 0, 1,
-1.111099, -1.778876, -1.137608, 1, 0.7607843, 0, 1,
-1.107146, 0.7557744, 0.2222609, 1, 0.7686275, 0, 1,
-1.103984, 0.4721769, -1.557341, 1, 0.772549, 0, 1,
-1.101183, 0.7542511, -0.1713277, 1, 0.7803922, 0, 1,
-1.099834, 0.6364397, -0.3815347, 1, 0.7843137, 0, 1,
-1.094107, 0.4300713, -0.7736592, 1, 0.7921569, 0, 1,
-1.094103, 1.659958, 0.3407009, 1, 0.7960784, 0, 1,
-1.084386, -1.546689, -2.898343, 1, 0.8039216, 0, 1,
-1.081016, 0.520715, -0.9209126, 1, 0.8117647, 0, 1,
-1.071364, -1.890872, -4.853278, 1, 0.8156863, 0, 1,
-1.066548, -0.3479285, -2.226619, 1, 0.8235294, 0, 1,
-1.062469, -0.8558611, -2.663314, 1, 0.827451, 0, 1,
-1.05925, 3.159944, 0.06533603, 1, 0.8352941, 0, 1,
-1.044324, 1.366193, -0.7935146, 1, 0.8392157, 0, 1,
-1.043212, 0.7642334, -1.083598, 1, 0.8470588, 0, 1,
-1.041378, -0.6745405, -1.458816, 1, 0.8509804, 0, 1,
-1.040802, 0.1649542, -0.1011958, 1, 0.8588235, 0, 1,
-1.032564, -0.435635, -2.704516, 1, 0.8627451, 0, 1,
-1.032134, 1.192112, -0.659053, 1, 0.8705882, 0, 1,
-1.028862, -0.6317339, -3.199527, 1, 0.8745098, 0, 1,
-1.0263, -1.111602, -3.626052, 1, 0.8823529, 0, 1,
-1.026136, 0.4234263, -1.240287, 1, 0.8862745, 0, 1,
-1.023871, -0.8247636, -2.422409, 1, 0.8941177, 0, 1,
-1.008442, 1.001966, -1.595712, 1, 0.8980392, 0, 1,
-1.008114, -1.598453, -3.760308, 1, 0.9058824, 0, 1,
-1.002856, -1.159997, -1.929498, 1, 0.9137255, 0, 1,
-1.000028, 1.16827, -0.9217955, 1, 0.9176471, 0, 1,
-0.9981847, -0.4419845, -2.651854, 1, 0.9254902, 0, 1,
-0.9918623, -0.938722, -2.545883, 1, 0.9294118, 0, 1,
-0.985215, -0.7453558, -0.8956585, 1, 0.9372549, 0, 1,
-0.9839138, -1.83436, -4.360083, 1, 0.9411765, 0, 1,
-0.9829063, -1.088663, -3.430267, 1, 0.9490196, 0, 1,
-0.9737992, -1.054499, -2.944507, 1, 0.9529412, 0, 1,
-0.9713246, 0.7729117, -1.359913, 1, 0.9607843, 0, 1,
-0.9551447, 0.3122011, -2.191713, 1, 0.9647059, 0, 1,
-0.9430801, 0.5123605, -1.237086, 1, 0.972549, 0, 1,
-0.9425942, -0.1749417, -1.817297, 1, 0.9764706, 0, 1,
-0.9399939, -0.4724754, -2.284601, 1, 0.9843137, 0, 1,
-0.9274021, -0.6058536, -2.913116, 1, 0.9882353, 0, 1,
-0.924167, -1.092936, -2.597986, 1, 0.9960784, 0, 1,
-0.9209843, 1.020934, -0.8169542, 0.9960784, 1, 0, 1,
-0.9208031, -0.8895742, -2.868699, 0.9921569, 1, 0, 1,
-0.9170473, 0.2328109, -0.9883997, 0.9843137, 1, 0, 1,
-0.9122292, 0.7133186, -1.742919, 0.9803922, 1, 0, 1,
-0.9056268, -1.074527, -2.769993, 0.972549, 1, 0, 1,
-0.9026574, 0.02984856, -2.761884, 0.9686275, 1, 0, 1,
-0.9019601, 0.4571648, -2.270794, 0.9607843, 1, 0, 1,
-0.9014236, -1.11768, -3.286828, 0.9568627, 1, 0, 1,
-0.8949783, 0.4135384, -2.508889, 0.9490196, 1, 0, 1,
-0.889702, -0.5882855, -3.224401, 0.945098, 1, 0, 1,
-0.8893738, -0.492261, -3.722717, 0.9372549, 1, 0, 1,
-0.8862209, 0.3401774, -2.415594, 0.9333333, 1, 0, 1,
-0.882946, -0.003574005, -1.076505, 0.9254902, 1, 0, 1,
-0.8822675, 0.2931493, -1.844133, 0.9215686, 1, 0, 1,
-0.8811331, 0.03274738, -2.017593, 0.9137255, 1, 0, 1,
-0.879477, -0.04631554, -1.827004, 0.9098039, 1, 0, 1,
-0.8743389, 1.022519, -1.325888, 0.9019608, 1, 0, 1,
-0.8660967, -1.118266, -2.362585, 0.8941177, 1, 0, 1,
-0.8657269, 0.5700791, -0.9383277, 0.8901961, 1, 0, 1,
-0.8564043, 0.6894744, 0.2676331, 0.8823529, 1, 0, 1,
-0.8549638, 0.9439908, -0.4108594, 0.8784314, 1, 0, 1,
-0.851266, 0.77121, -1.82823, 0.8705882, 1, 0, 1,
-0.8486032, 0.6797225, -1.564323, 0.8666667, 1, 0, 1,
-0.84838, -2.029019, -2.120258, 0.8588235, 1, 0, 1,
-0.8471625, -0.5183215, -1.97997, 0.854902, 1, 0, 1,
-0.8421975, 1.595064, -0.4942504, 0.8470588, 1, 0, 1,
-0.841134, -1.166623, -1.582514, 0.8431373, 1, 0, 1,
-0.8358632, 0.1761556, -0.9340947, 0.8352941, 1, 0, 1,
-0.8342816, -2.07763, -1.747195, 0.8313726, 1, 0, 1,
-0.833267, -2.147427, -3.728586, 0.8235294, 1, 0, 1,
-0.8315932, -0.6216094, -2.386063, 0.8196079, 1, 0, 1,
-0.8296174, 0.7186963, -0.1506596, 0.8117647, 1, 0, 1,
-0.828665, 0.8263836, -2.512616, 0.8078431, 1, 0, 1,
-0.8199158, 0.3727956, -1.819166, 0.8, 1, 0, 1,
-0.8168029, -0.5368915, -1.483815, 0.7921569, 1, 0, 1,
-0.8118808, 0.1675804, -2.223004, 0.7882353, 1, 0, 1,
-0.8118545, -2.015715, -3.434398, 0.7803922, 1, 0, 1,
-0.8117396, -1.139385, -2.257414, 0.7764706, 1, 0, 1,
-0.8087298, -0.4080464, -3.031761, 0.7686275, 1, 0, 1,
-0.8084574, 0.9247745, 0.4766449, 0.7647059, 1, 0, 1,
-0.807408, 2.214904, 1.738078, 0.7568628, 1, 0, 1,
-0.8031437, -2.492672, -1.38695, 0.7529412, 1, 0, 1,
-0.8006015, -0.3920006, -1.451854, 0.7450981, 1, 0, 1,
-0.7929608, -1.081868, -0.5947312, 0.7411765, 1, 0, 1,
-0.7871552, -0.1104766, -2.440527, 0.7333333, 1, 0, 1,
-0.7827282, 0.0294966, -2.005293, 0.7294118, 1, 0, 1,
-0.7827008, 0.5332777, 0.6245958, 0.7215686, 1, 0, 1,
-0.7803856, -0.3514134, -2.826171, 0.7176471, 1, 0, 1,
-0.7778814, 1.041651, -1.160102, 0.7098039, 1, 0, 1,
-0.7704386, -0.2560669, -2.576334, 0.7058824, 1, 0, 1,
-0.76432, 1.498356, -1.896449, 0.6980392, 1, 0, 1,
-0.76164, -1.396005, -2.93659, 0.6901961, 1, 0, 1,
-0.7585601, -0.6118292, -1.68972, 0.6862745, 1, 0, 1,
-0.7563992, 1.411196, -0.7030105, 0.6784314, 1, 0, 1,
-0.7509111, -1.314327, -2.706246, 0.6745098, 1, 0, 1,
-0.7506709, -0.7360368, -4.978315, 0.6666667, 1, 0, 1,
-0.7413123, -2.388683, -3.718914, 0.6627451, 1, 0, 1,
-0.7395978, 0.1954786, -0.7515123, 0.654902, 1, 0, 1,
-0.7264394, 1.472749, 0.2842907, 0.6509804, 1, 0, 1,
-0.7245645, 0.6168519, 0.1359582, 0.6431373, 1, 0, 1,
-0.7199947, 0.3966105, -2.024766, 0.6392157, 1, 0, 1,
-0.7196098, 0.4778599, -0.8846527, 0.6313726, 1, 0, 1,
-0.7173338, -0.2475108, -1.986822, 0.627451, 1, 0, 1,
-0.7133693, 0.4890183, -0.9210016, 0.6196079, 1, 0, 1,
-0.7119375, -0.7184145, -2.487196, 0.6156863, 1, 0, 1,
-0.7095954, -1.526896, -1.641085, 0.6078432, 1, 0, 1,
-0.7058325, 0.02939024, -1.049509, 0.6039216, 1, 0, 1,
-0.7056091, 0.7918867, 0.04386643, 0.5960785, 1, 0, 1,
-0.7046753, -0.1713706, -0.2648113, 0.5882353, 1, 0, 1,
-0.7039745, 0.03844807, -2.973498, 0.5843138, 1, 0, 1,
-0.7001874, -0.004677081, -1.536017, 0.5764706, 1, 0, 1,
-0.6988119, 0.285749, -3.319777, 0.572549, 1, 0, 1,
-0.6949922, -0.2102558, -0.9202324, 0.5647059, 1, 0, 1,
-0.6930288, -0.2031026, -1.901057, 0.5607843, 1, 0, 1,
-0.6888829, -1.550602, -2.419294, 0.5529412, 1, 0, 1,
-0.6878566, 1.871086, 0.4876922, 0.5490196, 1, 0, 1,
-0.6869211, -0.8193668, -2.225923, 0.5411765, 1, 0, 1,
-0.6859295, 0.8235745, -0.7878628, 0.5372549, 1, 0, 1,
-0.6857918, 2.401811, 0.3005891, 0.5294118, 1, 0, 1,
-0.6853674, 0.6368344, -0.3708714, 0.5254902, 1, 0, 1,
-0.6847023, 0.1134421, -2.078699, 0.5176471, 1, 0, 1,
-0.6819602, -1.972363, -3.172678, 0.5137255, 1, 0, 1,
-0.6745092, -0.3931568, -1.85771, 0.5058824, 1, 0, 1,
-0.6733045, 0.203526, -1.121531, 0.5019608, 1, 0, 1,
-0.6701786, -0.6756318, -3.245228, 0.4941176, 1, 0, 1,
-0.6700289, -0.6727615, -2.803649, 0.4862745, 1, 0, 1,
-0.6699111, 0.5007294, -0.5526054, 0.4823529, 1, 0, 1,
-0.6640241, -0.2604496, -2.036022, 0.4745098, 1, 0, 1,
-0.659487, -0.03794452, 0.7631749, 0.4705882, 1, 0, 1,
-0.6577415, -0.3514097, -0.920961, 0.4627451, 1, 0, 1,
-0.6529871, 1.517734, 0.210955, 0.4588235, 1, 0, 1,
-0.6518278, -1.052704, -2.265866, 0.4509804, 1, 0, 1,
-0.64994, 1.410874, -0.3975075, 0.4470588, 1, 0, 1,
-0.647429, 0.09409936, -0.7875258, 0.4392157, 1, 0, 1,
-0.6419556, 0.2544643, -2.571115, 0.4352941, 1, 0, 1,
-0.6375303, -1.723231, -2.220785, 0.427451, 1, 0, 1,
-0.6327732, 0.6851001, -2.409481, 0.4235294, 1, 0, 1,
-0.6325937, -0.2756535, -3.00335, 0.4156863, 1, 0, 1,
-0.6279941, 1.906391, 1.797233, 0.4117647, 1, 0, 1,
-0.6233758, -1.142283, -2.368646, 0.4039216, 1, 0, 1,
-0.6194534, -0.4531866, -2.354896, 0.3960784, 1, 0, 1,
-0.6140665, -0.2304465, -1.444896, 0.3921569, 1, 0, 1,
-0.6132223, 0.9523416, 0.01918593, 0.3843137, 1, 0, 1,
-0.6116349, 1.700109, -1.562984, 0.3803922, 1, 0, 1,
-0.6114901, -0.1241468, -2.262156, 0.372549, 1, 0, 1,
-0.6087312, 0.4772892, -2.010617, 0.3686275, 1, 0, 1,
-0.6073885, 0.334299, -1.513062, 0.3607843, 1, 0, 1,
-0.6067324, 0.5013978, -0.7039252, 0.3568628, 1, 0, 1,
-0.5946753, 1.181965, -0.4854697, 0.3490196, 1, 0, 1,
-0.5930063, 1.303038, -0.7275273, 0.345098, 1, 0, 1,
-0.5887387, 0.5900428, -1.842446, 0.3372549, 1, 0, 1,
-0.5829613, -0.7157362, -2.082179, 0.3333333, 1, 0, 1,
-0.581605, 3.587807, -1.190079, 0.3254902, 1, 0, 1,
-0.5814587, 2.667675, -0.5647778, 0.3215686, 1, 0, 1,
-0.5748867, -0.2830821, -2.6076, 0.3137255, 1, 0, 1,
-0.5622372, 0.6115634, -0.5322995, 0.3098039, 1, 0, 1,
-0.5586434, -0.1307317, -1.722855, 0.3019608, 1, 0, 1,
-0.5549366, 1.240525, 0.4061901, 0.2941177, 1, 0, 1,
-0.5537603, 1.593441, -1.88408, 0.2901961, 1, 0, 1,
-0.5497187, -0.3807643, -1.115782, 0.282353, 1, 0, 1,
-0.5496395, 0.9998226, 1.196929, 0.2784314, 1, 0, 1,
-0.5398359, -2.052656, -2.596729, 0.2705882, 1, 0, 1,
-0.5383847, 3.590673, -0.3695408, 0.2666667, 1, 0, 1,
-0.5305199, 1.240919, -1.877228, 0.2588235, 1, 0, 1,
-0.5279126, 0.5318224, -0.8207594, 0.254902, 1, 0, 1,
-0.5242888, -0.9322718, -2.151847, 0.2470588, 1, 0, 1,
-0.5233219, -0.4706919, -2.134354, 0.2431373, 1, 0, 1,
-0.519898, 1.038902, -1.106974, 0.2352941, 1, 0, 1,
-0.5198281, -0.3143788, -1.097777, 0.2313726, 1, 0, 1,
-0.519551, -1.155628, -1.931399, 0.2235294, 1, 0, 1,
-0.5192357, 0.08262172, -0.4056186, 0.2196078, 1, 0, 1,
-0.5173197, 0.5979277, -0.664244, 0.2117647, 1, 0, 1,
-0.5164737, -1.478731, -5.33359, 0.2078431, 1, 0, 1,
-0.5123853, 0.4370779, -0.152018, 0.2, 1, 0, 1,
-0.5117873, 1.435914, -0.57762, 0.1921569, 1, 0, 1,
-0.5046736, 0.2239544, -0.8428209, 0.1882353, 1, 0, 1,
-0.5012292, -1.120836, -3.591685, 0.1803922, 1, 0, 1,
-0.4987849, 1.377148, -1.833653, 0.1764706, 1, 0, 1,
-0.492823, 1.113478, 0.6075682, 0.1686275, 1, 0, 1,
-0.4837965, -0.8253376, -2.008266, 0.1647059, 1, 0, 1,
-0.4826881, -1.252712, -3.797712, 0.1568628, 1, 0, 1,
-0.4807408, -0.3254716, -1.088505, 0.1529412, 1, 0, 1,
-0.4792983, 0.08678693, -0.7124819, 0.145098, 1, 0, 1,
-0.4788685, -0.1994798, -1.84467, 0.1411765, 1, 0, 1,
-0.4749361, -0.7530072, -2.282887, 0.1333333, 1, 0, 1,
-0.4667473, -0.6392509, -1.696786, 0.1294118, 1, 0, 1,
-0.462719, -0.9565333, -1.565143, 0.1215686, 1, 0, 1,
-0.4605706, 2.179819, -0.08281109, 0.1176471, 1, 0, 1,
-0.4557006, 0.7159024, -1.896722, 0.1098039, 1, 0, 1,
-0.4512186, 0.1026692, -1.70012, 0.1058824, 1, 0, 1,
-0.4482855, 1.674536, -0.616531, 0.09803922, 1, 0, 1,
-0.44639, 2.242005, -1.160547, 0.09019608, 1, 0, 1,
-0.4448577, -0.5102503, -2.836691, 0.08627451, 1, 0, 1,
-0.433048, -0.4765147, -0.9264447, 0.07843138, 1, 0, 1,
-0.4325013, 0.5907392, -1.244596, 0.07450981, 1, 0, 1,
-0.4296039, -0.1628287, -1.116193, 0.06666667, 1, 0, 1,
-0.424926, -1.737553, -2.818717, 0.0627451, 1, 0, 1,
-0.4209595, -0.7929943, -3.653673, 0.05490196, 1, 0, 1,
-0.415301, 0.6272252, -2.685908, 0.05098039, 1, 0, 1,
-0.4152646, -0.5943595, -2.267838, 0.04313726, 1, 0, 1,
-0.4110586, -1.285524, -2.280811, 0.03921569, 1, 0, 1,
-0.408803, 1.036314, 1.193858, 0.03137255, 1, 0, 1,
-0.4043326, -0.5956854, -1.559747, 0.02745098, 1, 0, 1,
-0.3996036, 0.2238586, -0.002140341, 0.01960784, 1, 0, 1,
-0.3968042, 1.133627, -1.897886, 0.01568628, 1, 0, 1,
-0.3954129, 1.587935, -0.9781156, 0.007843138, 1, 0, 1,
-0.3943388, 0.3128226, 0.1493921, 0.003921569, 1, 0, 1,
-0.3860848, 0.1599003, -1.976919, 0, 1, 0.003921569, 1,
-0.3858517, 0.4266893, -1.159349, 0, 1, 0.01176471, 1,
-0.3850504, -0.1242938, -1.950074, 0, 1, 0.01568628, 1,
-0.3836703, 1.141139, -0.2231273, 0, 1, 0.02352941, 1,
-0.3824644, -0.7883502, -1.180309, 0, 1, 0.02745098, 1,
-0.3797882, -0.834558, -1.586199, 0, 1, 0.03529412, 1,
-0.3755634, -0.8358691, -3.938139, 0, 1, 0.03921569, 1,
-0.3630265, 0.1411008, 0.3361554, 0, 1, 0.04705882, 1,
-0.3614102, -0.6595802, -1.40734, 0, 1, 0.05098039, 1,
-0.3591517, 0.8155167, 1.703887, 0, 1, 0.05882353, 1,
-0.3586881, 1.151626, -0.584416, 0, 1, 0.0627451, 1,
-0.3488069, -0.6625621, -2.289003, 0, 1, 0.07058824, 1,
-0.3440402, 0.5701581, -0.02447805, 0, 1, 0.07450981, 1,
-0.327403, -1.06204, -4.015755, 0, 1, 0.08235294, 1,
-0.3267559, -1.281641, -1.831738, 0, 1, 0.08627451, 1,
-0.3199069, -0.380816, -2.253754, 0, 1, 0.09411765, 1,
-0.3179934, -0.4295138, -2.351213, 0, 1, 0.1019608, 1,
-0.3173681, -0.8891163, -2.519806, 0, 1, 0.1058824, 1,
-0.316932, 2.293467, -0.2172126, 0, 1, 0.1137255, 1,
-0.3144132, -0.2350784, -3.447732, 0, 1, 0.1176471, 1,
-0.3141695, -0.7478274, -2.056294, 0, 1, 0.1254902, 1,
-0.3128949, 1.520348, 0.4037784, 0, 1, 0.1294118, 1,
-0.3108262, 1.384798, -0.594436, 0, 1, 0.1372549, 1,
-0.3106028, 1.831093, 0.8482873, 0, 1, 0.1411765, 1,
-0.3097931, 0.006805468, -3.724492, 0, 1, 0.1490196, 1,
-0.3082389, 0.8151575, 0.404796, 0, 1, 0.1529412, 1,
-0.3077596, 0.132059, -2.424381, 0, 1, 0.1607843, 1,
-0.3076447, -0.1548449, -2.007285, 0, 1, 0.1647059, 1,
-0.3039831, 0.2941652, -2.03893, 0, 1, 0.172549, 1,
-0.2953807, -0.921193, -3.890919, 0, 1, 0.1764706, 1,
-0.2951632, -1.326848, -4.251327, 0, 1, 0.1843137, 1,
-0.2945289, 0.6808732, -1.6258, 0, 1, 0.1882353, 1,
-0.2930979, 0.7442771, 0.7695966, 0, 1, 0.1960784, 1,
-0.2925191, -0.2525852, -1.993803, 0, 1, 0.2039216, 1,
-0.2913799, 1.444704, -0.773128, 0, 1, 0.2078431, 1,
-0.2863979, -0.6185595, -3.341913, 0, 1, 0.2156863, 1,
-0.2832775, -0.0443508, -1.995293, 0, 1, 0.2196078, 1,
-0.2825944, -0.8181033, -3.007555, 0, 1, 0.227451, 1,
-0.2757216, -0.6199473, -2.81497, 0, 1, 0.2313726, 1,
-0.272719, -1.652362, -3.449951, 0, 1, 0.2392157, 1,
-0.2724781, 0.8684549, -1.345725, 0, 1, 0.2431373, 1,
-0.2711814, -1.39926, -3.016175, 0, 1, 0.2509804, 1,
-0.2692177, 0.260161, -0.3854382, 0, 1, 0.254902, 1,
-0.2640942, -0.1110132, -2.530461, 0, 1, 0.2627451, 1,
-0.2629872, 0.402828, 1.991138, 0, 1, 0.2666667, 1,
-0.262966, -0.7468478, -3.210057, 0, 1, 0.2745098, 1,
-0.2588247, 0.5638156, -0.405599, 0, 1, 0.2784314, 1,
-0.258743, 1.091894, -0.8125606, 0, 1, 0.2862745, 1,
-0.2577893, -1.289658, -2.477721, 0, 1, 0.2901961, 1,
-0.2502164, 1.118236, 0.7347879, 0, 1, 0.2980392, 1,
-0.2466774, 0.337148, -1.37989, 0, 1, 0.3058824, 1,
-0.2457308, 0.4039543, -1.090558, 0, 1, 0.3098039, 1,
-0.2441343, -1.44033, -3.579099, 0, 1, 0.3176471, 1,
-0.2423038, 0.03495485, -2.751807, 0, 1, 0.3215686, 1,
-0.2395513, -1.21453, -3.101055, 0, 1, 0.3294118, 1,
-0.2392667, 0.7764392, -0.627511, 0, 1, 0.3333333, 1,
-0.2314656, -0.374399, -1.553541, 0, 1, 0.3411765, 1,
-0.2251044, 1.029481, 0.2882299, 0, 1, 0.345098, 1,
-0.2244463, 1.012204, -0.1049234, 0, 1, 0.3529412, 1,
-0.221266, 1.564797, 1.095464, 0, 1, 0.3568628, 1,
-0.2058404, -0.5642477, -2.689559, 0, 1, 0.3647059, 1,
-0.202543, -2.072112, -3.150615, 0, 1, 0.3686275, 1,
-0.2021375, -0.1645957, -1.62628, 0, 1, 0.3764706, 1,
-0.2006287, -0.5578407, -1.938132, 0, 1, 0.3803922, 1,
-0.1972756, -1.686815, -2.069238, 0, 1, 0.3882353, 1,
-0.193011, -0.4098813, -2.967041, 0, 1, 0.3921569, 1,
-0.1914104, -1.575699, -4.197035, 0, 1, 0.4, 1,
-0.1912443, -0.1891076, -2.18201, 0, 1, 0.4078431, 1,
-0.1884326, -0.5699658, -3.603989, 0, 1, 0.4117647, 1,
-0.1872471, -0.8661649, -2.947021, 0, 1, 0.4196078, 1,
-0.1860586, 1.185449, 1.346934, 0, 1, 0.4235294, 1,
-0.1827792, 0.5280964, 1.18058, 0, 1, 0.4313726, 1,
-0.1771316, -0.8681281, -3.265318, 0, 1, 0.4352941, 1,
-0.1739836, -0.2031204, -1.693355, 0, 1, 0.4431373, 1,
-0.1735326, 1.825919, -1.869406, 0, 1, 0.4470588, 1,
-0.1716701, 1.253798, -0.3045499, 0, 1, 0.454902, 1,
-0.1695302, -0.6891401, -4.489686, 0, 1, 0.4588235, 1,
-0.1632458, -1.573435, -1.664589, 0, 1, 0.4666667, 1,
-0.1624027, 1.410986, 0.02640647, 0, 1, 0.4705882, 1,
-0.1619081, 0.2583893, -0.3246644, 0, 1, 0.4784314, 1,
-0.1579829, 0.8148595, -0.3631536, 0, 1, 0.4823529, 1,
-0.1558057, -0.4357424, -2.292628, 0, 1, 0.4901961, 1,
-0.151871, -0.2444656, -4.653085, 0, 1, 0.4941176, 1,
-0.1511633, 0.4509532, 0.3859802, 0, 1, 0.5019608, 1,
-0.150646, -1.950972, -3.898729, 0, 1, 0.509804, 1,
-0.1496708, -1.107483, -3.722589, 0, 1, 0.5137255, 1,
-0.1486642, 0.0915082, 1.501344, 0, 1, 0.5215687, 1,
-0.1430865, -0.4448714, -3.063196, 0, 1, 0.5254902, 1,
-0.1400477, -1.598547, -2.821833, 0, 1, 0.5333334, 1,
-0.1304936, 0.1874155, 0.559941, 0, 1, 0.5372549, 1,
-0.122318, 0.1064202, 0.850708, 0, 1, 0.5450981, 1,
-0.1222929, 0.0685244, 0.4439224, 0, 1, 0.5490196, 1,
-0.1213777, 2.037447, 1.395402, 0, 1, 0.5568628, 1,
-0.120901, -0.332966, -4.072828, 0, 1, 0.5607843, 1,
-0.1181188, -0.7645151, -2.951197, 0, 1, 0.5686275, 1,
-0.1175575, -0.8511332, -3.362111, 0, 1, 0.572549, 1,
-0.1148605, 1.345992, -0.2805569, 0, 1, 0.5803922, 1,
-0.1146862, 0.3496115, -1.593859, 0, 1, 0.5843138, 1,
-0.1121496, -0.06052017, 0.007377999, 0, 1, 0.5921569, 1,
-0.1121398, 0.495458, 0.481966, 0, 1, 0.5960785, 1,
-0.1080933, 0.2524553, -0.9014229, 0, 1, 0.6039216, 1,
-0.1067531, 0.7294747, -0.4513122, 0, 1, 0.6117647, 1,
-0.1040142, -0.2937676, -2.54562, 0, 1, 0.6156863, 1,
-0.1021708, -2.197579, -4.569091, 0, 1, 0.6235294, 1,
-0.1000071, -1.849765, -2.658685, 0, 1, 0.627451, 1,
-0.09381102, -0.3193542, -1.995003, 0, 1, 0.6352941, 1,
-0.09378898, 0.5309935, -0.3104209, 0, 1, 0.6392157, 1,
-0.08675288, 1.122577, 1.503868, 0, 1, 0.6470588, 1,
-0.0864826, 0.1563407, -0.343356, 0, 1, 0.6509804, 1,
-0.08282214, 0.06124816, -0.7930341, 0, 1, 0.6588235, 1,
-0.08272607, -0.2779872, -2.705774, 0, 1, 0.6627451, 1,
-0.08206523, 0.5860869, 0.3638076, 0, 1, 0.6705883, 1,
-0.08000628, -0.1389944, -2.88117, 0, 1, 0.6745098, 1,
-0.07879338, -1.531827, -3.723372, 0, 1, 0.682353, 1,
-0.07723901, 2.085808, 0.1740063, 0, 1, 0.6862745, 1,
-0.07652738, 0.6441548, -0.2954324, 0, 1, 0.6941177, 1,
-0.06933375, 0.4137553, 0.8606616, 0, 1, 0.7019608, 1,
-0.06885467, -0.3922414, -5.25408, 0, 1, 0.7058824, 1,
-0.06694563, -0.7164897, -2.637335, 0, 1, 0.7137255, 1,
-0.06607913, 1.032968, -1.735106, 0, 1, 0.7176471, 1,
-0.06603481, -0.669476, -1.236851, 0, 1, 0.7254902, 1,
-0.06491008, 0.5152633, -1.812568, 0, 1, 0.7294118, 1,
-0.05988075, 0.8817122, 1.318629, 0, 1, 0.7372549, 1,
-0.05961159, -1.034177, -4.178489, 0, 1, 0.7411765, 1,
-0.05765378, -1.27844, -3.853504, 0, 1, 0.7490196, 1,
-0.05574342, -0.9057345, -2.553067, 0, 1, 0.7529412, 1,
-0.05009411, -0.2562771, -4.271361, 0, 1, 0.7607843, 1,
-0.04985292, 0.2453628, 1.666712, 0, 1, 0.7647059, 1,
-0.0480122, 0.2313863, -0.1547277, 0, 1, 0.772549, 1,
-0.04657223, -0.5575815, -3.649814, 0, 1, 0.7764706, 1,
-0.04577132, 1.111759, -2.817698, 0, 1, 0.7843137, 1,
-0.04133169, -1.101182, -2.956807, 0, 1, 0.7882353, 1,
-0.03831832, -0.5218788, -3.193594, 0, 1, 0.7960784, 1,
-0.03828579, -0.2456135, -2.432173, 0, 1, 0.8039216, 1,
-0.0357697, -0.007748774, -0.3123749, 0, 1, 0.8078431, 1,
-0.03193125, 1.041455, -1.081502, 0, 1, 0.8156863, 1,
-0.02686151, -0.6913238, -3.742828, 0, 1, 0.8196079, 1,
-0.02602451, 1.465523, -0.2004819, 0, 1, 0.827451, 1,
-0.02168444, 0.04660099, -2.539088, 0, 1, 0.8313726, 1,
-0.01584278, -1.923324, -2.939312, 0, 1, 0.8392157, 1,
-0.01076911, 0.3525505, 0.3952813, 0, 1, 0.8431373, 1,
-0.009576733, 0.741452, 2.375366, 0, 1, 0.8509804, 1,
-0.009446663, 1.525786, -1.502896, 0, 1, 0.854902, 1,
0.001382078, -1.258958, 4.161364, 0, 1, 0.8627451, 1,
0.002232784, -0.9562445, 1.272549, 0, 1, 0.8666667, 1,
0.008984027, -0.0733074, 1.260332, 0, 1, 0.8745098, 1,
0.01290006, 1.467473, 1.244578, 0, 1, 0.8784314, 1,
0.01439897, -1.244519, 3.460142, 0, 1, 0.8862745, 1,
0.01463419, -0.1422474, 2.831319, 0, 1, 0.8901961, 1,
0.02029045, 1.885974, 0.6159523, 0, 1, 0.8980392, 1,
0.03012153, 1.573823, -0.04574154, 0, 1, 0.9058824, 1,
0.03530768, -0.1409571, 4.478728, 0, 1, 0.9098039, 1,
0.03871806, 0.6121375, -0.8119238, 0, 1, 0.9176471, 1,
0.04158008, -1.691012, 3.05319, 0, 1, 0.9215686, 1,
0.04744133, -1.036372, 1.792176, 0, 1, 0.9294118, 1,
0.04816585, 0.3501847, -1.126852, 0, 1, 0.9333333, 1,
0.04870559, -0.6778755, 3.371533, 0, 1, 0.9411765, 1,
0.04984337, -1.504634, 3.474574, 0, 1, 0.945098, 1,
0.04995162, -0.3893349, 3.21146, 0, 1, 0.9529412, 1,
0.06074189, -2.010007, 4.705355, 0, 1, 0.9568627, 1,
0.06231201, 0.03918017, 0.4794473, 0, 1, 0.9647059, 1,
0.06610578, -0.5719146, 1.999211, 0, 1, 0.9686275, 1,
0.066806, -1.929029, 4.355273, 0, 1, 0.9764706, 1,
0.06751054, 2.316832, 0.239315, 0, 1, 0.9803922, 1,
0.07250453, -1.136779, 2.945488, 0, 1, 0.9882353, 1,
0.07448586, 0.6912312, -0.4291279, 0, 1, 0.9921569, 1,
0.07578311, -0.1404071, 1.974449, 0, 1, 1, 1,
0.07712189, -0.4316812, 2.970315, 0, 0.9921569, 1, 1,
0.07794078, -0.02917139, 1.649615, 0, 0.9882353, 1, 1,
0.08008201, -0.6672695, 3.203776, 0, 0.9803922, 1, 1,
0.08483006, 0.8434201, -0.3065161, 0, 0.9764706, 1, 1,
0.08904787, -0.2461995, 4.420663, 0, 0.9686275, 1, 1,
0.09117975, 0.4841715, 0.8825392, 0, 0.9647059, 1, 1,
0.09300253, -0.242663, 4.792689, 0, 0.9568627, 1, 1,
0.09383054, -0.379416, 2.595793, 0, 0.9529412, 1, 1,
0.09546526, -1.904488, 3.469126, 0, 0.945098, 1, 1,
0.09556673, -0.1919096, 4.098055, 0, 0.9411765, 1, 1,
0.09732601, 0.04560244, 2.053474, 0, 0.9333333, 1, 1,
0.098212, -1.709272, 3.71909, 0, 0.9294118, 1, 1,
0.09902066, 0.837919, 0.6203568, 0, 0.9215686, 1, 1,
0.09945552, -1.008508, 2.623203, 0, 0.9176471, 1, 1,
0.1033455, -0.2909045, 2.688059, 0, 0.9098039, 1, 1,
0.1073073, 0.00192935, 0.2677791, 0, 0.9058824, 1, 1,
0.1077627, -1.245154, 2.359267, 0, 0.8980392, 1, 1,
0.110098, -0.8219424, 3.255761, 0, 0.8901961, 1, 1,
0.1104965, 1.019591, -0.1660119, 0, 0.8862745, 1, 1,
0.1109657, -0.6397535, 3.433609, 0, 0.8784314, 1, 1,
0.1193031, 0.04430038, 2.48964, 0, 0.8745098, 1, 1,
0.1195033, -0.2729771, 4.075217, 0, 0.8666667, 1, 1,
0.1257294, 0.3373785, 0.6939504, 0, 0.8627451, 1, 1,
0.1295596, 0.8965556, 0.9729445, 0, 0.854902, 1, 1,
0.133288, 0.4700267, -0.1544022, 0, 0.8509804, 1, 1,
0.1340771, -1.029039, 4.503942, 0, 0.8431373, 1, 1,
0.1356429, -0.2014259, 1.308132, 0, 0.8392157, 1, 1,
0.1365029, 0.8822432, 0.6309835, 0, 0.8313726, 1, 1,
0.1387601, 1.674624, 0.7371809, 0, 0.827451, 1, 1,
0.1409399, -2.253546, 5.350272, 0, 0.8196079, 1, 1,
0.1412325, 0.3340197, -0.3342286, 0, 0.8156863, 1, 1,
0.1416928, -0.7540799, 2.107892, 0, 0.8078431, 1, 1,
0.1476359, 0.1036172, -0.1297719, 0, 0.8039216, 1, 1,
0.152923, -1.062894, 1.983467, 0, 0.7960784, 1, 1,
0.1533729, -1.18873, 3.773158, 0, 0.7882353, 1, 1,
0.1549263, 0.1440687, 3.690168, 0, 0.7843137, 1, 1,
0.1549962, 1.494806, 1.573409, 0, 0.7764706, 1, 1,
0.1552524, -0.7851465, 4.044124, 0, 0.772549, 1, 1,
0.1573071, -0.2169096, 4.04273, 0, 0.7647059, 1, 1,
0.1599786, 0.843062, -0.266107, 0, 0.7607843, 1, 1,
0.1622412, -1.962009, 2.218389, 0, 0.7529412, 1, 1,
0.1642333, -1.666686, 4.137878, 0, 0.7490196, 1, 1,
0.1660567, -0.3382175, 2.685123, 0, 0.7411765, 1, 1,
0.1683271, -0.3147613, 2.852423, 0, 0.7372549, 1, 1,
0.1687876, 1.007547, -1.395031, 0, 0.7294118, 1, 1,
0.1689045, -1.639975, 4.434839, 0, 0.7254902, 1, 1,
0.1692587, 0.3418406, 1.034028, 0, 0.7176471, 1, 1,
0.1699302, 0.0433967, 0.9277441, 0, 0.7137255, 1, 1,
0.1710847, -0.9286389, 2.742098, 0, 0.7058824, 1, 1,
0.1739869, 1.20692, -1.064305, 0, 0.6980392, 1, 1,
0.1741367, 0.04654543, 1.175149, 0, 0.6941177, 1, 1,
0.1747707, 0.4726445, 0.6615061, 0, 0.6862745, 1, 1,
0.176466, -0.6824642, 5.198345, 0, 0.682353, 1, 1,
0.1806481, -1.116487, 4.006254, 0, 0.6745098, 1, 1,
0.1827598, 0.04578901, 0.2796806, 0, 0.6705883, 1, 1,
0.1851782, 1.288683, -1.811202, 0, 0.6627451, 1, 1,
0.187246, -1.214723, 1.772349, 0, 0.6588235, 1, 1,
0.1880633, -0.964569, 2.508743, 0, 0.6509804, 1, 1,
0.1889113, -0.9943835, 3.058772, 0, 0.6470588, 1, 1,
0.1906012, -0.7464007, 3.565497, 0, 0.6392157, 1, 1,
0.1919628, 0.08157257, 2.738826, 0, 0.6352941, 1, 1,
0.1923091, -1.795863, 2.548505, 0, 0.627451, 1, 1,
0.1980905, -0.5371956, 1.371178, 0, 0.6235294, 1, 1,
0.1981822, -0.4908727, 2.062986, 0, 0.6156863, 1, 1,
0.1984119, 0.08469059, -0.282196, 0, 0.6117647, 1, 1,
0.2040444, -1.652249, 2.273985, 0, 0.6039216, 1, 1,
0.2061578, 0.8810585, 1.90956, 0, 0.5960785, 1, 1,
0.206486, 0.02189437, 2.33359, 0, 0.5921569, 1, 1,
0.2085325, 1.889192, 0.7844518, 0, 0.5843138, 1, 1,
0.2097983, 1.972697, -0.3674983, 0, 0.5803922, 1, 1,
0.2122324, -2.406299, 4.288519, 0, 0.572549, 1, 1,
0.2141172, -0.2155537, 2.647284, 0, 0.5686275, 1, 1,
0.2142285, -0.7283605, 1.071735, 0, 0.5607843, 1, 1,
0.2149615, 1.264533, 1.203989, 0, 0.5568628, 1, 1,
0.2182983, -1.548803, 1.958322, 0, 0.5490196, 1, 1,
0.2192099, 1.343018, 0.9248288, 0, 0.5450981, 1, 1,
0.2198934, -0.1167582, 4.2093, 0, 0.5372549, 1, 1,
0.2207302, -0.1918153, 2.124098, 0, 0.5333334, 1, 1,
0.2208006, 1.938339, -0.1541171, 0, 0.5254902, 1, 1,
0.2217946, 0.8822755, -0.05502189, 0, 0.5215687, 1, 1,
0.2279248, -0.2266698, 2.650896, 0, 0.5137255, 1, 1,
0.2301194, 0.7966408, 2.333184, 0, 0.509804, 1, 1,
0.2363191, -0.1033358, 1.575046, 0, 0.5019608, 1, 1,
0.2394681, 0.5561478, 1.639492, 0, 0.4941176, 1, 1,
0.2411682, 0.7473486, -0.8869059, 0, 0.4901961, 1, 1,
0.241919, 1.158844, -0.354717, 0, 0.4823529, 1, 1,
0.242389, 0.5125837, 0.7451085, 0, 0.4784314, 1, 1,
0.2426077, 1.553143, 0.1647992, 0, 0.4705882, 1, 1,
0.2427591, -1.292286, 0.8804172, 0, 0.4666667, 1, 1,
0.2440348, -0.9984323, 3.117089, 0, 0.4588235, 1, 1,
0.2462277, 2.713859, 0.9299017, 0, 0.454902, 1, 1,
0.251019, -1.056321, 2.347098, 0, 0.4470588, 1, 1,
0.2513183, 1.193678, 1.399867, 0, 0.4431373, 1, 1,
0.2520118, 0.9952788, 0.6520352, 0, 0.4352941, 1, 1,
0.2605868, -1.8438, 2.336779, 0, 0.4313726, 1, 1,
0.2609817, 1.16242, -0.2028146, 0, 0.4235294, 1, 1,
0.2650833, 0.9730809, 0.4006985, 0, 0.4196078, 1, 1,
0.2669921, 2.203179, 0.2691376, 0, 0.4117647, 1, 1,
0.2705646, 2.07967, 1.243689, 0, 0.4078431, 1, 1,
0.2718705, -0.1561591, 1.141188, 0, 0.4, 1, 1,
0.280245, 0.3674093, 0.6185796, 0, 0.3921569, 1, 1,
0.2806835, 0.4332029, -0.2840411, 0, 0.3882353, 1, 1,
0.2818347, -1.08761, 3.216003, 0, 0.3803922, 1, 1,
0.2820593, -1.126222, 2.119469, 0, 0.3764706, 1, 1,
0.282273, 0.1212133, 1.209417, 0, 0.3686275, 1, 1,
0.2822869, -2.663257, 2.414066, 0, 0.3647059, 1, 1,
0.2824174, 0.3322888, 1.160111, 0, 0.3568628, 1, 1,
0.283391, 0.3418934, 1.774604, 0, 0.3529412, 1, 1,
0.2840966, 0.7932061, -0.742948, 0, 0.345098, 1, 1,
0.2858022, -0.03459468, 1.289859, 0, 0.3411765, 1, 1,
0.2863141, 1.238909, 1.669343, 0, 0.3333333, 1, 1,
0.2865322, -0.4457187, 3.762054, 0, 0.3294118, 1, 1,
0.287356, 0.1732085, 1.454281, 0, 0.3215686, 1, 1,
0.2930279, 0.9266776, -0.3494242, 0, 0.3176471, 1, 1,
0.2981809, 0.2934984, 1.519034, 0, 0.3098039, 1, 1,
0.2987516, -0.4739828, 2.104759, 0, 0.3058824, 1, 1,
0.3019664, 0.7834328, 1.561006, 0, 0.2980392, 1, 1,
0.3056148, 1.449947, -0.6750293, 0, 0.2901961, 1, 1,
0.3140642, 0.5493789, 1.945076, 0, 0.2862745, 1, 1,
0.3201584, 0.1165687, 0.5283059, 0, 0.2784314, 1, 1,
0.3218262, -2.075734, 3.736407, 0, 0.2745098, 1, 1,
0.3266855, -0.9890307, 2.533374, 0, 0.2666667, 1, 1,
0.3284174, -1.383522, 3.697253, 0, 0.2627451, 1, 1,
0.3305134, -0.1897399, 2.701946, 0, 0.254902, 1, 1,
0.3319298, -0.6698629, 1.947549, 0, 0.2509804, 1, 1,
0.3341233, 1.51654, 0.5359542, 0, 0.2431373, 1, 1,
0.335368, -0.1214549, 2.390514, 0, 0.2392157, 1, 1,
0.3362162, 2.574627, 1.137274, 0, 0.2313726, 1, 1,
0.3370382, 0.5776642, 0.6960714, 0, 0.227451, 1, 1,
0.338154, -0.4628657, 0.8191063, 0, 0.2196078, 1, 1,
0.343704, -0.9288573, 2.229642, 0, 0.2156863, 1, 1,
0.3469733, 0.1798585, 1.531245, 0, 0.2078431, 1, 1,
0.3478996, 0.568005, 0.06027428, 0, 0.2039216, 1, 1,
0.3497671, -0.06552178, 2.508669, 0, 0.1960784, 1, 1,
0.3555291, 0.1505008, 1.273274, 0, 0.1882353, 1, 1,
0.3588182, -1.37673, 5.442725, 0, 0.1843137, 1, 1,
0.3597298, -1.468741, 2.692615, 0, 0.1764706, 1, 1,
0.3672221, 1.079604, 1.116228, 0, 0.172549, 1, 1,
0.3705074, 0.5105054, -0.4572787, 0, 0.1647059, 1, 1,
0.3713728, -1.619964, 3.59028, 0, 0.1607843, 1, 1,
0.3749261, -1.11367, 3.959497, 0, 0.1529412, 1, 1,
0.3807345, -1.634575, 2.495293, 0, 0.1490196, 1, 1,
0.3807816, -1.142457, 5.206589, 0, 0.1411765, 1, 1,
0.3808152, -0.7195258, 3.951136, 0, 0.1372549, 1, 1,
0.3861089, -0.8934786, 3.228007, 0, 0.1294118, 1, 1,
0.3880491, -1.408934, 3.189306, 0, 0.1254902, 1, 1,
0.3896117, -1.988144, 3.624276, 0, 0.1176471, 1, 1,
0.3904209, -0.1495361, 3.296811, 0, 0.1137255, 1, 1,
0.3911059, -1.175554, 3.507527, 0, 0.1058824, 1, 1,
0.3911603, 0.2943441, -0.1129075, 0, 0.09803922, 1, 1,
0.3921477, -0.1173053, 2.096436, 0, 0.09411765, 1, 1,
0.3942398, 0.2231931, 1.94404, 0, 0.08627451, 1, 1,
0.3967259, -1.031537, 1.520927, 0, 0.08235294, 1, 1,
0.3988747, 1.056665, -1.137365, 0, 0.07450981, 1, 1,
0.4007938, -1.779722, 2.042517, 0, 0.07058824, 1, 1,
0.4013254, -1.210606, 2.428959, 0, 0.0627451, 1, 1,
0.4062436, -0.8184088, 3.418775, 0, 0.05882353, 1, 1,
0.4064609, 0.07333478, 2.358096, 0, 0.05098039, 1, 1,
0.4087079, 1.091305, 0.3430651, 0, 0.04705882, 1, 1,
0.4101893, -1.028859, 3.724768, 0, 0.03921569, 1, 1,
0.4111677, -0.8581147, 2.75753, 0, 0.03529412, 1, 1,
0.4156095, -0.2380478, 0.7664623, 0, 0.02745098, 1, 1,
0.4191819, -1.236723, 2.466088, 0, 0.02352941, 1, 1,
0.4193023, -0.9009682, 5.226643, 0, 0.01568628, 1, 1,
0.4199635, -0.4889771, 1.681011, 0, 0.01176471, 1, 1,
0.4252022, 1.032567, -0.1225161, 0, 0.003921569, 1, 1,
0.4320775, -0.207387, 0.9656311, 0.003921569, 0, 1, 1,
0.4400468, 0.4854699, 0.8989139, 0.007843138, 0, 1, 1,
0.4450251, -1.869596, 2.492063, 0.01568628, 0, 1, 1,
0.4485942, 0.05577371, 1.475146, 0.01960784, 0, 1, 1,
0.4526107, 0.7428216, 0.6103675, 0.02745098, 0, 1, 1,
0.4561187, 0.9351555, 0.03921714, 0.03137255, 0, 1, 1,
0.4631535, 0.9942622, 0.9023148, 0.03921569, 0, 1, 1,
0.4645028, -0.1562385, 1.422054, 0.04313726, 0, 1, 1,
0.4649001, 0.2261778, 0.571226, 0.05098039, 0, 1, 1,
0.4667518, -1.250856, 3.749451, 0.05490196, 0, 1, 1,
0.4678438, 0.5429806, 1.715521, 0.0627451, 0, 1, 1,
0.4687576, 0.4061855, 0.5661029, 0.06666667, 0, 1, 1,
0.4699865, 0.4320229, 0.2029984, 0.07450981, 0, 1, 1,
0.4776434, -0.3405662, 2.229697, 0.07843138, 0, 1, 1,
0.4788442, -0.6816357, 3.650068, 0.08627451, 0, 1, 1,
0.4797174, -0.3912472, 2.495143, 0.09019608, 0, 1, 1,
0.4829099, -1.514073, 1.3661, 0.09803922, 0, 1, 1,
0.4854946, -1.686306, 3.13848, 0.1058824, 0, 1, 1,
0.4914939, 1.928847, 0.6497405, 0.1098039, 0, 1, 1,
0.4929057, -0.3037237, 1.974856, 0.1176471, 0, 1, 1,
0.4935057, 1.261321, 0.5365684, 0.1215686, 0, 1, 1,
0.4973833, 0.2112205, -0.489463, 0.1294118, 0, 1, 1,
0.4978729, -0.223705, 2.520586, 0.1333333, 0, 1, 1,
0.4983823, 0.09384735, 1.766323, 0.1411765, 0, 1, 1,
0.505467, 0.9406978, 0.03541103, 0.145098, 0, 1, 1,
0.5065259, -1.42374, 4.399413, 0.1529412, 0, 1, 1,
0.5101117, -0.5070737, 2.230782, 0.1568628, 0, 1, 1,
0.5104297, 0.4398712, 0.1889986, 0.1647059, 0, 1, 1,
0.5117429, -1.211321, 3.070791, 0.1686275, 0, 1, 1,
0.5119482, 0.2053699, 2.396688, 0.1764706, 0, 1, 1,
0.5121118, -0.4217894, 1.112809, 0.1803922, 0, 1, 1,
0.5180687, 1.355806, 1.908922, 0.1882353, 0, 1, 1,
0.5206944, 2.828351, -0.2145684, 0.1921569, 0, 1, 1,
0.5214474, -0.1869069, 2.843154, 0.2, 0, 1, 1,
0.5218858, 1.441714, 0.3855179, 0.2078431, 0, 1, 1,
0.5234731, 0.596884, 0.08658683, 0.2117647, 0, 1, 1,
0.5273655, -0.5391443, 1.769521, 0.2196078, 0, 1, 1,
0.5277789, -1.411592, 2.181909, 0.2235294, 0, 1, 1,
0.528057, 0.2655078, -0.1222032, 0.2313726, 0, 1, 1,
0.5292014, 0.1444179, 0.1539097, 0.2352941, 0, 1, 1,
0.5300987, -0.4573797, 0.4655556, 0.2431373, 0, 1, 1,
0.5327451, -0.8589737, 2.331268, 0.2470588, 0, 1, 1,
0.532874, -0.2366392, 2.069133, 0.254902, 0, 1, 1,
0.5374919, -0.07293367, 1.053214, 0.2588235, 0, 1, 1,
0.5375961, -2.748628, 2.292311, 0.2666667, 0, 1, 1,
0.5379902, -1.813495, 0.8338115, 0.2705882, 0, 1, 1,
0.5394844, 0.484156, 1.615723, 0.2784314, 0, 1, 1,
0.5462463, 1.388459, 0.3109081, 0.282353, 0, 1, 1,
0.5535386, 2.066964, 0.2300432, 0.2901961, 0, 1, 1,
0.5583318, 0.2063904, 1.335231, 0.2941177, 0, 1, 1,
0.5587637, -0.8726785, 4.293442, 0.3019608, 0, 1, 1,
0.5631013, 0.5812504, 1.787043, 0.3098039, 0, 1, 1,
0.5664666, -0.1162353, 0.7730894, 0.3137255, 0, 1, 1,
0.581387, -0.6555021, 2.61656, 0.3215686, 0, 1, 1,
0.5905607, 0.3459826, 2.23756, 0.3254902, 0, 1, 1,
0.5928681, 0.2530861, -1.196719, 0.3333333, 0, 1, 1,
0.5930893, -1.653214, 2.045204, 0.3372549, 0, 1, 1,
0.5968273, -1.016905, 3.611486, 0.345098, 0, 1, 1,
0.5969074, -0.04447701, 2.112031, 0.3490196, 0, 1, 1,
0.5981252, -0.3780537, 1.355877, 0.3568628, 0, 1, 1,
0.6022349, -0.4817142, 1.929592, 0.3607843, 0, 1, 1,
0.6085562, -0.5830734, 4.515367, 0.3686275, 0, 1, 1,
0.6148375, 1.777306, 1.089507, 0.372549, 0, 1, 1,
0.6174121, -0.2788267, 2.048546, 0.3803922, 0, 1, 1,
0.6214188, -0.6875722, 2.505894, 0.3843137, 0, 1, 1,
0.6214321, 1.263219, 1.02137, 0.3921569, 0, 1, 1,
0.623919, -2.35186, 4.057545, 0.3960784, 0, 1, 1,
0.6284429, -0.5551155, 2.678697, 0.4039216, 0, 1, 1,
0.6285235, -1.525473, 2.049694, 0.4117647, 0, 1, 1,
0.629657, 0.06744834, 0.4524601, 0.4156863, 0, 1, 1,
0.638392, 0.1013007, 0.5513062, 0.4235294, 0, 1, 1,
0.6387601, -1.462625, 3.349169, 0.427451, 0, 1, 1,
0.6401029, -0.2676347, 1.470901, 0.4352941, 0, 1, 1,
0.6448614, 0.3549149, -0.5117306, 0.4392157, 0, 1, 1,
0.6455373, 0.4447183, -0.617626, 0.4470588, 0, 1, 1,
0.6504749, 1.593706, -0.4250093, 0.4509804, 0, 1, 1,
0.651169, 1.957032, -0.0409421, 0.4588235, 0, 1, 1,
0.6524715, 0.6651025, -0.25486, 0.4627451, 0, 1, 1,
0.6535257, -1.927641, 2.560323, 0.4705882, 0, 1, 1,
0.6554072, 0.9539523, -0.4387796, 0.4745098, 0, 1, 1,
0.6564586, -0.05940147, 2.015295, 0.4823529, 0, 1, 1,
0.6583204, 0.9364417, 0.1035099, 0.4862745, 0, 1, 1,
0.6618779, 1.43456, 0.2849058, 0.4941176, 0, 1, 1,
0.663485, 0.496616, -0.7871833, 0.5019608, 0, 1, 1,
0.6637886, -0.8234465, 3.26393, 0.5058824, 0, 1, 1,
0.6637979, 0.2237607, 1.778725, 0.5137255, 0, 1, 1,
0.6643887, 0.5825772, -0.2607322, 0.5176471, 0, 1, 1,
0.6647511, -0.6594436, 1.318536, 0.5254902, 0, 1, 1,
0.6652198, -0.05286703, 0.9112664, 0.5294118, 0, 1, 1,
0.6678697, -0.08443965, 0.9719442, 0.5372549, 0, 1, 1,
0.6724953, 0.8202712, -0.1340937, 0.5411765, 0, 1, 1,
0.6781999, -0.2517063, 0.9790508, 0.5490196, 0, 1, 1,
0.6784981, -1.251307, 2.504709, 0.5529412, 0, 1, 1,
0.6787054, -1.57982, 2.941403, 0.5607843, 0, 1, 1,
0.6855804, -1.542784, 3.427545, 0.5647059, 0, 1, 1,
0.6879622, -0.574905, 3.551771, 0.572549, 0, 1, 1,
0.689112, 0.0262841, 1.505032, 0.5764706, 0, 1, 1,
0.6901039, -0.7572725, 2.263088, 0.5843138, 0, 1, 1,
0.6918389, 0.08181036, -0.2015726, 0.5882353, 0, 1, 1,
0.6924438, 2.634241, 0.5731916, 0.5960785, 0, 1, 1,
0.6970268, -1.586182, 2.819242, 0.6039216, 0, 1, 1,
0.6976633, -0.6873197, 2.566459, 0.6078432, 0, 1, 1,
0.7009671, -0.1798505, 1.060929, 0.6156863, 0, 1, 1,
0.7009932, 1.203006, -0.506367, 0.6196079, 0, 1, 1,
0.7020022, 2.108966, 0.688318, 0.627451, 0, 1, 1,
0.7148122, -0.4407056, 2.38536, 0.6313726, 0, 1, 1,
0.7157507, 0.2144028, 1.698773, 0.6392157, 0, 1, 1,
0.7182187, 1.336105, -0.4009247, 0.6431373, 0, 1, 1,
0.7186192, 0.2113396, 1.969983, 0.6509804, 0, 1, 1,
0.7368951, -0.5995484, 2.275239, 0.654902, 0, 1, 1,
0.7441882, 1.079024, -0.9987067, 0.6627451, 0, 1, 1,
0.7456647, 0.4709427, 1.574384, 0.6666667, 0, 1, 1,
0.74664, -0.04424892, 0.9590828, 0.6745098, 0, 1, 1,
0.753634, -0.3615336, 1.399555, 0.6784314, 0, 1, 1,
0.7561983, -1.105471, 0.5571138, 0.6862745, 0, 1, 1,
0.7592696, 1.833946, -0.455486, 0.6901961, 0, 1, 1,
0.7602735, -1.531934, 2.326126, 0.6980392, 0, 1, 1,
0.7615296, 0.2349098, 2.017706, 0.7058824, 0, 1, 1,
0.7623632, -0.08631408, 1.549828, 0.7098039, 0, 1, 1,
0.7714927, 0.1707451, 1.002142, 0.7176471, 0, 1, 1,
0.7746919, 0.2743005, 0.3520726, 0.7215686, 0, 1, 1,
0.7747412, -0.1666003, 2.62515, 0.7294118, 0, 1, 1,
0.7765031, -0.2288804, 3.210254, 0.7333333, 0, 1, 1,
0.7795561, 0.1539034, 2.191088, 0.7411765, 0, 1, 1,
0.779666, -0.1785128, 0.411423, 0.7450981, 0, 1, 1,
0.7877333, -1.125108, 5.762227, 0.7529412, 0, 1, 1,
0.7943461, 0.2875575, 0.2893029, 0.7568628, 0, 1, 1,
0.7953618, 0.4600727, 1.165615, 0.7647059, 0, 1, 1,
0.795703, -1.084959, 1.723097, 0.7686275, 0, 1, 1,
0.7979958, 2.467702, 1.177566, 0.7764706, 0, 1, 1,
0.8040707, -1.615541, 2.125192, 0.7803922, 0, 1, 1,
0.8084617, -0.09651786, 2.964432, 0.7882353, 0, 1, 1,
0.8154684, 1.862755, -1.023294, 0.7921569, 0, 1, 1,
0.8190894, -0.5637944, 3.262461, 0.8, 0, 1, 1,
0.8209175, -0.6163232, 2.987221, 0.8078431, 0, 1, 1,
0.828455, -0.7438403, 1.643816, 0.8117647, 0, 1, 1,
0.8301817, 1.617979, 0.7611498, 0.8196079, 0, 1, 1,
0.8389749, 0.09976147, 1.871985, 0.8235294, 0, 1, 1,
0.8541395, -1.019464, 3.759991, 0.8313726, 0, 1, 1,
0.8628077, 0.5529881, 0.6883587, 0.8352941, 0, 1, 1,
0.8676974, 0.9241366, 0.8129349, 0.8431373, 0, 1, 1,
0.8688068, 0.2495527, 1.638938, 0.8470588, 0, 1, 1,
0.8823363, -0.7430717, 1.570478, 0.854902, 0, 1, 1,
0.8860735, 0.09962624, 2.503475, 0.8588235, 0, 1, 1,
0.8894935, 1.041008, 1.705929, 0.8666667, 0, 1, 1,
0.8917817, -0.5311688, 2.211411, 0.8705882, 0, 1, 1,
0.8924076, 0.6046345, -1.363711, 0.8784314, 0, 1, 1,
0.9009448, -0.43698, 0.4912311, 0.8823529, 0, 1, 1,
0.9012101, 1.903119, 0.3611914, 0.8901961, 0, 1, 1,
0.9034092, 1.35254, 0.02593945, 0.8941177, 0, 1, 1,
0.9091819, 0.5780023, 0.6865876, 0.9019608, 0, 1, 1,
0.917325, 0.4810073, 1.924212, 0.9098039, 0, 1, 1,
0.9234384, 0.2961324, 0.6437774, 0.9137255, 0, 1, 1,
0.9246648, -1.078295, 2.451982, 0.9215686, 0, 1, 1,
0.9284458, -2.078616, 1.296108, 0.9254902, 0, 1, 1,
0.9324528, 1.919225, -0.8899319, 0.9333333, 0, 1, 1,
0.9362382, 0.6546869, 0.9623151, 0.9372549, 0, 1, 1,
0.9409152, 0.7984889, -1.373989, 0.945098, 0, 1, 1,
0.9414302, -0.1735395, 2.244121, 0.9490196, 0, 1, 1,
0.9473385, -0.9132897, 3.23485, 0.9568627, 0, 1, 1,
0.9512835, 1.053743, -0.2324807, 0.9607843, 0, 1, 1,
0.9531142, -0.9853085, 3.397024, 0.9686275, 0, 1, 1,
0.9584684, 0.7948738, 1.590981, 0.972549, 0, 1, 1,
0.9639856, 0.6596809, 1.279029, 0.9803922, 0, 1, 1,
0.9669093, 1.371025, 1.514848, 0.9843137, 0, 1, 1,
0.9771391, 0.69052, 1.643827, 0.9921569, 0, 1, 1,
0.9779533, 0.3052768, 2.445835, 0.9960784, 0, 1, 1,
0.9788286, 1.150661, 0.7718416, 1, 0, 0.9960784, 1,
0.9812722, -0.9697021, 3.441217, 1, 0, 0.9882353, 1,
0.9851298, -0.9700798, 2.265476, 1, 0, 0.9843137, 1,
0.988467, -0.7633283, 3.798054, 1, 0, 0.9764706, 1,
0.9929736, -1.219569, 2.625358, 1, 0, 0.972549, 1,
0.9968919, 0.2748607, 1.778554, 1, 0, 0.9647059, 1,
1.005947, 1.714171, 2.23256, 1, 0, 0.9607843, 1,
1.008763, -1.781504, 3.118638, 1, 0, 0.9529412, 1,
1.014082, -2.378739, 1.818015, 1, 0, 0.9490196, 1,
1.014878, 0.9204481, 1.932065, 1, 0, 0.9411765, 1,
1.01605, 1.398295, 1.877509, 1, 0, 0.9372549, 1,
1.016858, 0.8672464, 0.2220834, 1, 0, 0.9294118, 1,
1.02035, 1.158211, -0.4356345, 1, 0, 0.9254902, 1,
1.024596, -0.554468, 1.791507, 1, 0, 0.9176471, 1,
1.028378, 1.897175, 0.2574227, 1, 0, 0.9137255, 1,
1.03066, 1.323396, 0.3099411, 1, 0, 0.9058824, 1,
1.031021, -0.7622838, 2.260351, 1, 0, 0.9019608, 1,
1.033678, 0.5190649, 0.9099252, 1, 0, 0.8941177, 1,
1.035283, 0.3857557, 2.078823, 1, 0, 0.8862745, 1,
1.038952, -0.002365303, -0.003439467, 1, 0, 0.8823529, 1,
1.043311, 1.585831, 0.7575184, 1, 0, 0.8745098, 1,
1.045756, -0.4957078, 1.427812, 1, 0, 0.8705882, 1,
1.047527, 0.2266351, 2.533038, 1, 0, 0.8627451, 1,
1.054549, -0.3374427, 2.542032, 1, 0, 0.8588235, 1,
1.058484, -1.048712, 2.519229, 1, 0, 0.8509804, 1,
1.059108, -0.6766083, 2.224312, 1, 0, 0.8470588, 1,
1.067033, 0.8328268, 2.178886, 1, 0, 0.8392157, 1,
1.070711, -0.5294604, 1.618205, 1, 0, 0.8352941, 1,
1.082652, -0.8430252, 2.050088, 1, 0, 0.827451, 1,
1.083308, 0.08651705, -0.06906135, 1, 0, 0.8235294, 1,
1.084595, -1.616243, 2.37321, 1, 0, 0.8156863, 1,
1.087715, -0.3418772, 1.90571, 1, 0, 0.8117647, 1,
1.09029, 0.4352532, 0.2823715, 1, 0, 0.8039216, 1,
1.092083, -0.1924557, 1.605981, 1, 0, 0.7960784, 1,
1.093524, -0.2395015, 1.755036, 1, 0, 0.7921569, 1,
1.097801, -0.5355618, 2.531476, 1, 0, 0.7843137, 1,
1.104946, 0.7607209, 1.270549, 1, 0, 0.7803922, 1,
1.105896, 0.9200259, 2.051337, 1, 0, 0.772549, 1,
1.107993, 0.8370506, 0.9976366, 1, 0, 0.7686275, 1,
1.108665, -1.208873, 2.940721, 1, 0, 0.7607843, 1,
1.111427, 1.007987, 1.343433, 1, 0, 0.7568628, 1,
1.11364, -0.9585441, 1.189717, 1, 0, 0.7490196, 1,
1.114561, -0.1182986, 1.710478, 1, 0, 0.7450981, 1,
1.13192, -0.1038229, 0.7766504, 1, 0, 0.7372549, 1,
1.134605, 0.5614319, 1.470065, 1, 0, 0.7333333, 1,
1.139971, 0.1095045, -0.1996414, 1, 0, 0.7254902, 1,
1.141697, 1.236119, 1.077589, 1, 0, 0.7215686, 1,
1.145863, 0.8216956, -0.5193651, 1, 0, 0.7137255, 1,
1.159739, 0.6446076, 0.5451273, 1, 0, 0.7098039, 1,
1.162322, 0.6550742, 1.683211, 1, 0, 0.7019608, 1,
1.175891, 0.4364868, 1.275375, 1, 0, 0.6941177, 1,
1.182986, -0.4847592, 0.2068147, 1, 0, 0.6901961, 1,
1.187923, -2.446637, 1.357052, 1, 0, 0.682353, 1,
1.194057, 0.1000992, 0.7595396, 1, 0, 0.6784314, 1,
1.19804, 0.04756467, 3.118172, 1, 0, 0.6705883, 1,
1.198552, 2.067777, 0.6423529, 1, 0, 0.6666667, 1,
1.199464, -0.8763602, 1.440268, 1, 0, 0.6588235, 1,
1.202215, 0.07033502, 1.393646, 1, 0, 0.654902, 1,
1.206499, -0.1588725, 2.548264, 1, 0, 0.6470588, 1,
1.216858, -0.0241233, 1.404876, 1, 0, 0.6431373, 1,
1.218521, 0.6053898, 3.698885, 1, 0, 0.6352941, 1,
1.226673, 1.05197, 0.02784939, 1, 0, 0.6313726, 1,
1.22795, 1.314139, 1.465879, 1, 0, 0.6235294, 1,
1.229917, -1.579945, 2.838908, 1, 0, 0.6196079, 1,
1.232195, 0.06066291, 3.160101, 1, 0, 0.6117647, 1,
1.232767, 1.338696, 1.80779, 1, 0, 0.6078432, 1,
1.235798, 1.148393, 1.000136, 1, 0, 0.6, 1,
1.242032, -0.5944355, 2.540535, 1, 0, 0.5921569, 1,
1.245703, 1.92375, -0.2581927, 1, 0, 0.5882353, 1,
1.25017, -0.5453317, 2.946758, 1, 0, 0.5803922, 1,
1.258801, -0.4056481, 2.815037, 1, 0, 0.5764706, 1,
1.265842, -3.116786, 3.778767, 1, 0, 0.5686275, 1,
1.287823, -0.6035913, 2.350296, 1, 0, 0.5647059, 1,
1.291714, -1.008684, 2.460279, 1, 0, 0.5568628, 1,
1.292361, -1.091863, 1.297252, 1, 0, 0.5529412, 1,
1.29866, 0.3755116, 1.066242, 1, 0, 0.5450981, 1,
1.299579, 0.2937501, -0.2498927, 1, 0, 0.5411765, 1,
1.31869, -0.4695196, 0.6477512, 1, 0, 0.5333334, 1,
1.324521, -0.1743229, 4.207043, 1, 0, 0.5294118, 1,
1.332563, 1.140714, 0.3695801, 1, 0, 0.5215687, 1,
1.33363, 0.06387112, 2.541446, 1, 0, 0.5176471, 1,
1.342785, -1.275041, 1.520169, 1, 0, 0.509804, 1,
1.342827, -0.1226945, 1.184096, 1, 0, 0.5058824, 1,
1.350831, 1.426211, 0.7480952, 1, 0, 0.4980392, 1,
1.370497, 0.350037, 2.50929, 1, 0, 0.4901961, 1,
1.372278, 0.6530933, -0.4954788, 1, 0, 0.4862745, 1,
1.378711, -0.8911753, 2.190076, 1, 0, 0.4784314, 1,
1.379692, 2.387976, -0.3585799, 1, 0, 0.4745098, 1,
1.385621, 1.012401, 0.586251, 1, 0, 0.4666667, 1,
1.39165, -0.3671917, 1.738179, 1, 0, 0.4627451, 1,
1.398705, 0.1454245, -0.1153011, 1, 0, 0.454902, 1,
1.400043, -1.832111, 2.206855, 1, 0, 0.4509804, 1,
1.400321, 0.5309656, 2.190422, 1, 0, 0.4431373, 1,
1.400823, -2.481956, 3.663878, 1, 0, 0.4392157, 1,
1.417149, -1.481556, 2.494392, 1, 0, 0.4313726, 1,
1.422313, 0.4625407, 1.77993, 1, 0, 0.427451, 1,
1.424678, -0.7557637, 1.499917, 1, 0, 0.4196078, 1,
1.425469, -1.574278, 2.270929, 1, 0, 0.4156863, 1,
1.448392, 0.2095194, 1.659252, 1, 0, 0.4078431, 1,
1.471386, -1.337034, 2.34303, 1, 0, 0.4039216, 1,
1.474315, -0.1103355, 0.09837244, 1, 0, 0.3960784, 1,
1.476227, -1.97113, 2.326811, 1, 0, 0.3882353, 1,
1.479353, -1.040694, 0.6331788, 1, 0, 0.3843137, 1,
1.481054, -0.2058545, 2.174268, 1, 0, 0.3764706, 1,
1.502013, -0.3962184, 0.7065779, 1, 0, 0.372549, 1,
1.533113, 0.02530936, 2.99879, 1, 0, 0.3647059, 1,
1.533813, 0.5159991, 1.541918, 1, 0, 0.3607843, 1,
1.544495, 0.1926986, 1.413863, 1, 0, 0.3529412, 1,
1.553323, 1.916519, 0.4388627, 1, 0, 0.3490196, 1,
1.56428, -0.6953377, 2.308678, 1, 0, 0.3411765, 1,
1.564619, 0.1919442, 2.578784, 1, 0, 0.3372549, 1,
1.586855, -0.2060453, 2.152599, 1, 0, 0.3294118, 1,
1.596716, -2.429232, 3.606948, 1, 0, 0.3254902, 1,
1.601087, 1.706425, 0.4747631, 1, 0, 0.3176471, 1,
1.606052, 0.6341168, 1.993791, 1, 0, 0.3137255, 1,
1.616822, 1.126352, 3.144817, 1, 0, 0.3058824, 1,
1.623947, -0.1521373, 1.484808, 1, 0, 0.2980392, 1,
1.638963, 1.041316, 0.6749477, 1, 0, 0.2941177, 1,
1.641564, 0.8149666, -0.6669048, 1, 0, 0.2862745, 1,
1.642405, 0.07898895, -0.1620934, 1, 0, 0.282353, 1,
1.652487, -1.164839, 1.844109, 1, 0, 0.2745098, 1,
1.665884, -0.813463, 0.2148913, 1, 0, 0.2705882, 1,
1.690624, 1.067553, -0.2697365, 1, 0, 0.2627451, 1,
1.711031, 1.987152, -1.599895, 1, 0, 0.2588235, 1,
1.724805, 1.221884, 0.650265, 1, 0, 0.2509804, 1,
1.726616, 0.2623187, 2.713505, 1, 0, 0.2470588, 1,
1.736489, -1.110225, 3.65276, 1, 0, 0.2392157, 1,
1.752243, 1.260566, 0.006586826, 1, 0, 0.2352941, 1,
1.764288, -1.118774, 2.717354, 1, 0, 0.227451, 1,
1.777864, 2.024215, -0.8893681, 1, 0, 0.2235294, 1,
1.783245, 0.272033, 0.736679, 1, 0, 0.2156863, 1,
1.806132, 0.1886509, 1.287844, 1, 0, 0.2117647, 1,
1.811374, -0.6267884, 2.237701, 1, 0, 0.2039216, 1,
1.840969, 0.1691751, 1.754768, 1, 0, 0.1960784, 1,
1.844151, 0.6485608, -0.004029092, 1, 0, 0.1921569, 1,
1.852529, -0.9969218, 0.5238894, 1, 0, 0.1843137, 1,
1.8548, -0.5475897, 2.631965, 1, 0, 0.1803922, 1,
1.855127, -1.480254, 1.333366, 1, 0, 0.172549, 1,
1.867556, 0.03710423, 2.269548, 1, 0, 0.1686275, 1,
1.948188, 0.02925849, 1.848637, 1, 0, 0.1607843, 1,
1.980163, 0.3830164, 1.498459, 1, 0, 0.1568628, 1,
1.987508, -0.6470374, 2.07025, 1, 0, 0.1490196, 1,
1.997068, -0.8136423, -0.2038317, 1, 0, 0.145098, 1,
1.997182, 0.8079491, 0.5176476, 1, 0, 0.1372549, 1,
2.016846, -0.3560579, 1.686859, 1, 0, 0.1333333, 1,
2.018177, 0.03637863, 3.113444, 1, 0, 0.1254902, 1,
2.050678, 1.332497, 0.5453941, 1, 0, 0.1215686, 1,
2.066477, 0.30002, 3.9776, 1, 0, 0.1137255, 1,
2.066964, -0.3982816, 1.76836, 1, 0, 0.1098039, 1,
2.1575, -0.1850586, 1.354712, 1, 0, 0.1019608, 1,
2.175344, -0.3226326, 0.9005895, 1, 0, 0.09411765, 1,
2.187662, -0.7183423, 1.245861, 1, 0, 0.09019608, 1,
2.231163, 0.4345812, -0.09440228, 1, 0, 0.08235294, 1,
2.243357, -0.4976188, 1.77341, 1, 0, 0.07843138, 1,
2.305936, 0.111167, 0.8638167, 1, 0, 0.07058824, 1,
2.449998, -0.2619453, 2.409909, 1, 0, 0.06666667, 1,
2.460585, -0.1268406, 0.2519865, 1, 0, 0.05882353, 1,
2.475968, 2.170722, 0.9338456, 1, 0, 0.05490196, 1,
2.513365, 0.8759658, -0.3101075, 1, 0, 0.04705882, 1,
2.520549, -1.088365, 1.013764, 1, 0, 0.04313726, 1,
2.521425, -0.9923849, 2.574858, 1, 0, 0.03529412, 1,
2.698604, -0.05674683, 1.517475, 1, 0, 0.03137255, 1,
2.816927, -0.397298, 2.573391, 1, 0, 0.02352941, 1,
2.852969, 0.2104494, 1.073371, 1, 0, 0.01960784, 1,
2.901695, 0.5107564, 1.233545, 1, 0, 0.01176471, 1,
3.007494, -0.1811188, 0.9478909, 1, 0, 0.007843138, 1
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
-0.1454728, -4.253701, -7.214331, 0, -0.5, 0.5, 0.5,
-0.1454728, -4.253701, -7.214331, 1, -0.5, 0.5, 0.5,
-0.1454728, -4.253701, -7.214331, 1, 1.5, 0.5, 0.5,
-0.1454728, -4.253701, -7.214331, 0, 1.5, 0.5, 0.5
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
-4.367296, 0.2369432, -7.214331, 0, -0.5, 0.5, 0.5,
-4.367296, 0.2369432, -7.214331, 1, -0.5, 0.5, 0.5,
-4.367296, 0.2369432, -7.214331, 1, 1.5, 0.5, 0.5,
-4.367296, 0.2369432, -7.214331, 0, 1.5, 0.5, 0.5
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
-4.367296, -4.253701, 0.2143188, 0, -0.5, 0.5, 0.5,
-4.367296, -4.253701, 0.2143188, 1, -0.5, 0.5, 0.5,
-4.367296, -4.253701, 0.2143188, 1, 1.5, 0.5, 0.5,
-4.367296, -4.253701, 0.2143188, 0, 1.5, 0.5, 0.5
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
-3, -3.217398, -5.500027,
3, -3.217398, -5.500027,
-3, -3.217398, -5.500027,
-3, -3.390115, -5.785744,
-2, -3.217398, -5.500027,
-2, -3.390115, -5.785744,
-1, -3.217398, -5.500027,
-1, -3.390115, -5.785744,
0, -3.217398, -5.500027,
0, -3.390115, -5.785744,
1, -3.217398, -5.500027,
1, -3.390115, -5.785744,
2, -3.217398, -5.500027,
2, -3.390115, -5.785744,
3, -3.217398, -5.500027,
3, -3.390115, -5.785744
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
-3, -3.73555, -6.357179, 0, -0.5, 0.5, 0.5,
-3, -3.73555, -6.357179, 1, -0.5, 0.5, 0.5,
-3, -3.73555, -6.357179, 1, 1.5, 0.5, 0.5,
-3, -3.73555, -6.357179, 0, 1.5, 0.5, 0.5,
-2, -3.73555, -6.357179, 0, -0.5, 0.5, 0.5,
-2, -3.73555, -6.357179, 1, -0.5, 0.5, 0.5,
-2, -3.73555, -6.357179, 1, 1.5, 0.5, 0.5,
-2, -3.73555, -6.357179, 0, 1.5, 0.5, 0.5,
-1, -3.73555, -6.357179, 0, -0.5, 0.5, 0.5,
-1, -3.73555, -6.357179, 1, -0.5, 0.5, 0.5,
-1, -3.73555, -6.357179, 1, 1.5, 0.5, 0.5,
-1, -3.73555, -6.357179, 0, 1.5, 0.5, 0.5,
0, -3.73555, -6.357179, 0, -0.5, 0.5, 0.5,
0, -3.73555, -6.357179, 1, -0.5, 0.5, 0.5,
0, -3.73555, -6.357179, 1, 1.5, 0.5, 0.5,
0, -3.73555, -6.357179, 0, 1.5, 0.5, 0.5,
1, -3.73555, -6.357179, 0, -0.5, 0.5, 0.5,
1, -3.73555, -6.357179, 1, -0.5, 0.5, 0.5,
1, -3.73555, -6.357179, 1, 1.5, 0.5, 0.5,
1, -3.73555, -6.357179, 0, 1.5, 0.5, 0.5,
2, -3.73555, -6.357179, 0, -0.5, 0.5, 0.5,
2, -3.73555, -6.357179, 1, -0.5, 0.5, 0.5,
2, -3.73555, -6.357179, 1, 1.5, 0.5, 0.5,
2, -3.73555, -6.357179, 0, 1.5, 0.5, 0.5,
3, -3.73555, -6.357179, 0, -0.5, 0.5, 0.5,
3, -3.73555, -6.357179, 1, -0.5, 0.5, 0.5,
3, -3.73555, -6.357179, 1, 1.5, 0.5, 0.5,
3, -3.73555, -6.357179, 0, 1.5, 0.5, 0.5
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
-3.393029, -3, -5.500027,
-3.393029, 3, -5.500027,
-3.393029, -3, -5.500027,
-3.555407, -3, -5.785744,
-3.393029, -2, -5.500027,
-3.555407, -2, -5.785744,
-3.393029, -1, -5.500027,
-3.555407, -1, -5.785744,
-3.393029, 0, -5.500027,
-3.555407, 0, -5.785744,
-3.393029, 1, -5.500027,
-3.555407, 1, -5.785744,
-3.393029, 2, -5.500027,
-3.555407, 2, -5.785744,
-3.393029, 3, -5.500027,
-3.555407, 3, -5.785744
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
-3.880162, -3, -6.357179, 0, -0.5, 0.5, 0.5,
-3.880162, -3, -6.357179, 1, -0.5, 0.5, 0.5,
-3.880162, -3, -6.357179, 1, 1.5, 0.5, 0.5,
-3.880162, -3, -6.357179, 0, 1.5, 0.5, 0.5,
-3.880162, -2, -6.357179, 0, -0.5, 0.5, 0.5,
-3.880162, -2, -6.357179, 1, -0.5, 0.5, 0.5,
-3.880162, -2, -6.357179, 1, 1.5, 0.5, 0.5,
-3.880162, -2, -6.357179, 0, 1.5, 0.5, 0.5,
-3.880162, -1, -6.357179, 0, -0.5, 0.5, 0.5,
-3.880162, -1, -6.357179, 1, -0.5, 0.5, 0.5,
-3.880162, -1, -6.357179, 1, 1.5, 0.5, 0.5,
-3.880162, -1, -6.357179, 0, 1.5, 0.5, 0.5,
-3.880162, 0, -6.357179, 0, -0.5, 0.5, 0.5,
-3.880162, 0, -6.357179, 1, -0.5, 0.5, 0.5,
-3.880162, 0, -6.357179, 1, 1.5, 0.5, 0.5,
-3.880162, 0, -6.357179, 0, 1.5, 0.5, 0.5,
-3.880162, 1, -6.357179, 0, -0.5, 0.5, 0.5,
-3.880162, 1, -6.357179, 1, -0.5, 0.5, 0.5,
-3.880162, 1, -6.357179, 1, 1.5, 0.5, 0.5,
-3.880162, 1, -6.357179, 0, 1.5, 0.5, 0.5,
-3.880162, 2, -6.357179, 0, -0.5, 0.5, 0.5,
-3.880162, 2, -6.357179, 1, -0.5, 0.5, 0.5,
-3.880162, 2, -6.357179, 1, 1.5, 0.5, 0.5,
-3.880162, 2, -6.357179, 0, 1.5, 0.5, 0.5,
-3.880162, 3, -6.357179, 0, -0.5, 0.5, 0.5,
-3.880162, 3, -6.357179, 1, -0.5, 0.5, 0.5,
-3.880162, 3, -6.357179, 1, 1.5, 0.5, 0.5,
-3.880162, 3, -6.357179, 0, 1.5, 0.5, 0.5
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
-3.393029, -3.217398, -4,
-3.393029, -3.217398, 4,
-3.393029, -3.217398, -4,
-3.555407, -3.390115, -4,
-3.393029, -3.217398, -2,
-3.555407, -3.390115, -2,
-3.393029, -3.217398, 0,
-3.555407, -3.390115, 0,
-3.393029, -3.217398, 2,
-3.555407, -3.390115, 2,
-3.393029, -3.217398, 4,
-3.555407, -3.390115, 4
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
-3.880162, -3.73555, -4, 0, -0.5, 0.5, 0.5,
-3.880162, -3.73555, -4, 1, -0.5, 0.5, 0.5,
-3.880162, -3.73555, -4, 1, 1.5, 0.5, 0.5,
-3.880162, -3.73555, -4, 0, 1.5, 0.5, 0.5,
-3.880162, -3.73555, -2, 0, -0.5, 0.5, 0.5,
-3.880162, -3.73555, -2, 1, -0.5, 0.5, 0.5,
-3.880162, -3.73555, -2, 1, 1.5, 0.5, 0.5,
-3.880162, -3.73555, -2, 0, 1.5, 0.5, 0.5,
-3.880162, -3.73555, 0, 0, -0.5, 0.5, 0.5,
-3.880162, -3.73555, 0, 1, -0.5, 0.5, 0.5,
-3.880162, -3.73555, 0, 1, 1.5, 0.5, 0.5,
-3.880162, -3.73555, 0, 0, 1.5, 0.5, 0.5,
-3.880162, -3.73555, 2, 0, -0.5, 0.5, 0.5,
-3.880162, -3.73555, 2, 1, -0.5, 0.5, 0.5,
-3.880162, -3.73555, 2, 1, 1.5, 0.5, 0.5,
-3.880162, -3.73555, 2, 0, 1.5, 0.5, 0.5,
-3.880162, -3.73555, 4, 0, -0.5, 0.5, 0.5,
-3.880162, -3.73555, 4, 1, -0.5, 0.5, 0.5,
-3.880162, -3.73555, 4, 1, 1.5, 0.5, 0.5,
-3.880162, -3.73555, 4, 0, 1.5, 0.5, 0.5
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
-3.393029, -3.217398, -5.500027,
-3.393029, 3.691285, -5.500027,
-3.393029, -3.217398, 5.928664,
-3.393029, 3.691285, 5.928664,
-3.393029, -3.217398, -5.500027,
-3.393029, -3.217398, 5.928664,
-3.393029, 3.691285, -5.500027,
-3.393029, 3.691285, 5.928664,
-3.393029, -3.217398, -5.500027,
3.102083, -3.217398, -5.500027,
-3.393029, -3.217398, 5.928664,
3.102083, -3.217398, 5.928664,
-3.393029, 3.691285, -5.500027,
3.102083, 3.691285, -5.500027,
-3.393029, 3.691285, 5.928664,
3.102083, 3.691285, 5.928664,
3.102083, -3.217398, -5.500027,
3.102083, 3.691285, -5.500027,
3.102083, -3.217398, 5.928664,
3.102083, 3.691285, 5.928664,
3.102083, -3.217398, -5.500027,
3.102083, -3.217398, 5.928664,
3.102083, 3.691285, -5.500027,
3.102083, 3.691285, 5.928664
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
var radius = 7.929771;
var distance = 35.28045;
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
mvMatrix.translate( 0.1454728, -0.2369432, -0.2143188 );
mvMatrix.scale( 1.320042, 1.241021, 0.7502017 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.28045);
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
cycloprothrin<-read.table("cycloprothrin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-cycloprothrin$V2
```

```
## Error in eval(expr, envir, enclos): object 'cycloprothrin' not found
```

```r
y<-cycloprothrin$V3
```

```
## Error in eval(expr, envir, enclos): object 'cycloprothrin' not found
```

```r
z<-cycloprothrin$V4
```

```
## Error in eval(expr, envir, enclos): object 'cycloprothrin' not found
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
-3.29844, 0.8768162, -2.59311, 0, 0, 1, 1, 1,
-3.009749, -1.664781, -2.789876, 1, 0, 0, 1, 1,
-2.958254, 0.06635075, -2.756685, 1, 0, 0, 1, 1,
-2.792223, 0.2115571, 0.373172, 1, 0, 0, 1, 1,
-2.726268, -1.310489, -0.2445813, 1, 0, 0, 1, 1,
-2.591402, 0.4071096, -1.709517, 1, 0, 0, 1, 1,
-2.432909, 0.1326888, -2.052588, 0, 0, 0, 1, 1,
-2.389307, 0.2352173, -2.29672, 0, 0, 0, 1, 1,
-2.318321, -0.5978183, 0.2623346, 0, 0, 0, 1, 1,
-2.309946, -1.430383, -2.193777, 0, 0, 0, 1, 1,
-2.305043, -1.070004, -2.05436, 0, 0, 0, 1, 1,
-2.240009, 0.4142654, -1.236929, 0, 0, 0, 1, 1,
-2.223562, -0.1722578, -1.381251, 0, 0, 0, 1, 1,
-2.17751, -0.73589, -2.574217, 1, 1, 1, 1, 1,
-2.168744, 0.3162443, -1.983075, 1, 1, 1, 1, 1,
-2.121242, 2.060167, -1.430543, 1, 1, 1, 1, 1,
-2.10347, 1.532699, -1.93015, 1, 1, 1, 1, 1,
-2.101841, 0.7424469, -2.814785, 1, 1, 1, 1, 1,
-2.061053, 0.6307072, -2.107489, 1, 1, 1, 1, 1,
-2.058012, -0.05607292, -2.275921, 1, 1, 1, 1, 1,
-2.057621, -0.3409008, -1.342949, 1, 1, 1, 1, 1,
-2.047405, -1.939674, -3.792739, 1, 1, 1, 1, 1,
-1.989547, -0.4604833, -1.269304, 1, 1, 1, 1, 1,
-1.988712, 0.2968646, -2.342171, 1, 1, 1, 1, 1,
-1.983628, 0.3229792, -0.6334167, 1, 1, 1, 1, 1,
-1.976198, -0.57193, -2.728167, 1, 1, 1, 1, 1,
-1.974155, 0.8002728, -0.3746028, 1, 1, 1, 1, 1,
-1.931913, -0.690695, -3.293349, 1, 1, 1, 1, 1,
-1.929354, 0.8291045, 0.4450718, 0, 0, 1, 1, 1,
-1.897267, 0.02756468, -2.141654, 1, 0, 0, 1, 1,
-1.890109, -0.4031416, -1.159707, 1, 0, 0, 1, 1,
-1.851156, -0.8189579, -4.080914, 1, 0, 0, 1, 1,
-1.844689, 1.325373, 0.1133342, 1, 0, 0, 1, 1,
-1.840162, -0.1482277, -2.410172, 1, 0, 0, 1, 1,
-1.820621, -1.036909, -2.77301, 0, 0, 0, 1, 1,
-1.799659, 0.8079612, -2.519194, 0, 0, 0, 1, 1,
-1.798957, 1.560583, -1.177063, 0, 0, 0, 1, 1,
-1.772123, 0.2837688, -1.914044, 0, 0, 0, 1, 1,
-1.771673, -0.3147244, -2.838618, 0, 0, 0, 1, 1,
-1.730819, -0.6515395, -3.616164, 0, 0, 0, 1, 1,
-1.728264, 0.3913658, -2.795183, 0, 0, 0, 1, 1,
-1.726274, 0.8461993, -0.4235028, 1, 1, 1, 1, 1,
-1.708638, -1.157779, -1.289256, 1, 1, 1, 1, 1,
-1.708301, -0.8294944, -1.739084, 1, 1, 1, 1, 1,
-1.707972, -0.3344591, -0.727688, 1, 1, 1, 1, 1,
-1.689171, -0.8345171, -1.864147, 1, 1, 1, 1, 1,
-1.684876, -0.7339792, -1.000199, 1, 1, 1, 1, 1,
-1.681023, 0.3712824, -0.9975221, 1, 1, 1, 1, 1,
-1.678782, 0.6154478, -0.4059076, 1, 1, 1, 1, 1,
-1.654485, 0.3838146, -2.215588, 1, 1, 1, 1, 1,
-1.628183, -0.7361458, -2.644621, 1, 1, 1, 1, 1,
-1.610666, 0.8173376, -1.77066, 1, 1, 1, 1, 1,
-1.600216, -0.1004042, -1.44675, 1, 1, 1, 1, 1,
-1.593231, 0.1202657, -0.7189516, 1, 1, 1, 1, 1,
-1.582645, -0.7991149, -2.348166, 1, 1, 1, 1, 1,
-1.579291, -0.5553696, -1.116194, 1, 1, 1, 1, 1,
-1.57516, -1.306979, -2.105515, 0, 0, 1, 1, 1,
-1.574914, -0.50954, -3.937863, 1, 0, 0, 1, 1,
-1.558305, 1.21773, -0.4410724, 1, 0, 0, 1, 1,
-1.553466, 0.5267168, -0.8549269, 1, 0, 0, 1, 1,
-1.55078, -1.943595, -1.547699, 1, 0, 0, 1, 1,
-1.548375, 0.9687813, -0.1698191, 1, 0, 0, 1, 1,
-1.534755, 1.118234, -0.8292891, 0, 0, 0, 1, 1,
-1.534282, 0.6686459, -3.504123, 0, 0, 0, 1, 1,
-1.533134, 0.975976, -2.650728, 0, 0, 0, 1, 1,
-1.527534, -0.9716269, -1.06471, 0, 0, 0, 1, 1,
-1.508574, -0.321886, -0.9561332, 0, 0, 0, 1, 1,
-1.503628, 0.8990031, -2.335295, 0, 0, 0, 1, 1,
-1.498337, 0.2413764, -1.159491, 0, 0, 0, 1, 1,
-1.497404, -2.380898, -1.13671, 1, 1, 1, 1, 1,
-1.491536, -0.7217523, -0.5071142, 1, 1, 1, 1, 1,
-1.475342, -0.2496771, -0.3153041, 1, 1, 1, 1, 1,
-1.473621, 0.6621907, -0.6322233, 1, 1, 1, 1, 1,
-1.461461, -1.614915, -2.105307, 1, 1, 1, 1, 1,
-1.440295, -0.08657914, -0.3859551, 1, 1, 1, 1, 1,
-1.435508, 0.1771117, -0.6012611, 1, 1, 1, 1, 1,
-1.435026, -0.9325427, -0.7599756, 1, 1, 1, 1, 1,
-1.420753, -0.4534307, 0.2701622, 1, 1, 1, 1, 1,
-1.418707, -0.9862348, -2.809853, 1, 1, 1, 1, 1,
-1.412301, -0.52959, -2.274707, 1, 1, 1, 1, 1,
-1.408956, -0.5704443, -2.089135, 1, 1, 1, 1, 1,
-1.398593, -2.170085, -2.711753, 1, 1, 1, 1, 1,
-1.391316, 0.09627633, -0.03065475, 1, 1, 1, 1, 1,
-1.357821, -0.1068639, -2.637874, 1, 1, 1, 1, 1,
-1.345619, -1.352304, -2.760575, 0, 0, 1, 1, 1,
-1.331641, 0.7381228, -2.411454, 1, 0, 0, 1, 1,
-1.326275, 0.6160769, -1.910938, 1, 0, 0, 1, 1,
-1.3253, -0.407182, -1.193337, 1, 0, 0, 1, 1,
-1.304818, -0.924392, -3.224727, 1, 0, 0, 1, 1,
-1.300071, 2.524063, 1.094431, 1, 0, 0, 1, 1,
-1.296793, -0.6458558, -1.031877, 0, 0, 0, 1, 1,
-1.295446, 0.1018861, -1.443537, 0, 0, 0, 1, 1,
-1.292829, -0.2232055, -1.840065, 0, 0, 0, 1, 1,
-1.290337, 0.07506981, 0.629077, 0, 0, 0, 1, 1,
-1.289777, -1.866412, -3.648335, 0, 0, 0, 1, 1,
-1.286786, 0.200059, -0.1808095, 0, 0, 0, 1, 1,
-1.28041, 0.9481384, -0.03958305, 0, 0, 0, 1, 1,
-1.277837, -1.906274, -1.906437, 1, 1, 1, 1, 1,
-1.275567, 1.105382, -0.9250469, 1, 1, 1, 1, 1,
-1.259701, 0.8318904, -1.490707, 1, 1, 1, 1, 1,
-1.259574, -2.152062, -1.203421, 1, 1, 1, 1, 1,
-1.252391, 1.535835, -2.187277, 1, 1, 1, 1, 1,
-1.249573, 1.92147, 1.450796, 1, 1, 1, 1, 1,
-1.246086, -0.5706218, -2.255844, 1, 1, 1, 1, 1,
-1.241199, 2.267675, 0.41966, 1, 1, 1, 1, 1,
-1.228636, 0.5282457, -0.213418, 1, 1, 1, 1, 1,
-1.218986, -0.5324078, -1.158017, 1, 1, 1, 1, 1,
-1.214558, -0.09119032, -0.8075198, 1, 1, 1, 1, 1,
-1.209152, 1.802223, -1.612164, 1, 1, 1, 1, 1,
-1.206649, -1.917263, -2.443978, 1, 1, 1, 1, 1,
-1.199958, -1.229721, -3.674209, 1, 1, 1, 1, 1,
-1.198401, -1.109802, -1.8642, 1, 1, 1, 1, 1,
-1.185904, 0.5568298, -0.7610869, 0, 0, 1, 1, 1,
-1.185836, -1.231039, -2.897744, 1, 0, 0, 1, 1,
-1.178852, -0.714328, -1.805292, 1, 0, 0, 1, 1,
-1.160036, 0.7642696, 0.3783413, 1, 0, 0, 1, 1,
-1.156456, -2.259893, -2.403017, 1, 0, 0, 1, 1,
-1.153676, -0.24254, -3.323809, 1, 0, 0, 1, 1,
-1.1522, -0.6068768, -3.156835, 0, 0, 0, 1, 1,
-1.151149, -0.776033, -0.7802858, 0, 0, 0, 1, 1,
-1.149327, 1.045121, -1.081241, 0, 0, 0, 1, 1,
-1.149267, -0.09548146, -2.005176, 0, 0, 0, 1, 1,
-1.14169, -0.2531953, -2.909878, 0, 0, 0, 1, 1,
-1.141352, -0.1253664, -2.539685, 0, 0, 0, 1, 1,
-1.137934, 0.3172093, -0.1591309, 0, 0, 0, 1, 1,
-1.125836, 1.562097, -0.9784425, 1, 1, 1, 1, 1,
-1.123619, -0.9401422, -1.299055, 1, 1, 1, 1, 1,
-1.111099, -1.778876, -1.137608, 1, 1, 1, 1, 1,
-1.107146, 0.7557744, 0.2222609, 1, 1, 1, 1, 1,
-1.103984, 0.4721769, -1.557341, 1, 1, 1, 1, 1,
-1.101183, 0.7542511, -0.1713277, 1, 1, 1, 1, 1,
-1.099834, 0.6364397, -0.3815347, 1, 1, 1, 1, 1,
-1.094107, 0.4300713, -0.7736592, 1, 1, 1, 1, 1,
-1.094103, 1.659958, 0.3407009, 1, 1, 1, 1, 1,
-1.084386, -1.546689, -2.898343, 1, 1, 1, 1, 1,
-1.081016, 0.520715, -0.9209126, 1, 1, 1, 1, 1,
-1.071364, -1.890872, -4.853278, 1, 1, 1, 1, 1,
-1.066548, -0.3479285, -2.226619, 1, 1, 1, 1, 1,
-1.062469, -0.8558611, -2.663314, 1, 1, 1, 1, 1,
-1.05925, 3.159944, 0.06533603, 1, 1, 1, 1, 1,
-1.044324, 1.366193, -0.7935146, 0, 0, 1, 1, 1,
-1.043212, 0.7642334, -1.083598, 1, 0, 0, 1, 1,
-1.041378, -0.6745405, -1.458816, 1, 0, 0, 1, 1,
-1.040802, 0.1649542, -0.1011958, 1, 0, 0, 1, 1,
-1.032564, -0.435635, -2.704516, 1, 0, 0, 1, 1,
-1.032134, 1.192112, -0.659053, 1, 0, 0, 1, 1,
-1.028862, -0.6317339, -3.199527, 0, 0, 0, 1, 1,
-1.0263, -1.111602, -3.626052, 0, 0, 0, 1, 1,
-1.026136, 0.4234263, -1.240287, 0, 0, 0, 1, 1,
-1.023871, -0.8247636, -2.422409, 0, 0, 0, 1, 1,
-1.008442, 1.001966, -1.595712, 0, 0, 0, 1, 1,
-1.008114, -1.598453, -3.760308, 0, 0, 0, 1, 1,
-1.002856, -1.159997, -1.929498, 0, 0, 0, 1, 1,
-1.000028, 1.16827, -0.9217955, 1, 1, 1, 1, 1,
-0.9981847, -0.4419845, -2.651854, 1, 1, 1, 1, 1,
-0.9918623, -0.938722, -2.545883, 1, 1, 1, 1, 1,
-0.985215, -0.7453558, -0.8956585, 1, 1, 1, 1, 1,
-0.9839138, -1.83436, -4.360083, 1, 1, 1, 1, 1,
-0.9829063, -1.088663, -3.430267, 1, 1, 1, 1, 1,
-0.9737992, -1.054499, -2.944507, 1, 1, 1, 1, 1,
-0.9713246, 0.7729117, -1.359913, 1, 1, 1, 1, 1,
-0.9551447, 0.3122011, -2.191713, 1, 1, 1, 1, 1,
-0.9430801, 0.5123605, -1.237086, 1, 1, 1, 1, 1,
-0.9425942, -0.1749417, -1.817297, 1, 1, 1, 1, 1,
-0.9399939, -0.4724754, -2.284601, 1, 1, 1, 1, 1,
-0.9274021, -0.6058536, -2.913116, 1, 1, 1, 1, 1,
-0.924167, -1.092936, -2.597986, 1, 1, 1, 1, 1,
-0.9209843, 1.020934, -0.8169542, 1, 1, 1, 1, 1,
-0.9208031, -0.8895742, -2.868699, 0, 0, 1, 1, 1,
-0.9170473, 0.2328109, -0.9883997, 1, 0, 0, 1, 1,
-0.9122292, 0.7133186, -1.742919, 1, 0, 0, 1, 1,
-0.9056268, -1.074527, -2.769993, 1, 0, 0, 1, 1,
-0.9026574, 0.02984856, -2.761884, 1, 0, 0, 1, 1,
-0.9019601, 0.4571648, -2.270794, 1, 0, 0, 1, 1,
-0.9014236, -1.11768, -3.286828, 0, 0, 0, 1, 1,
-0.8949783, 0.4135384, -2.508889, 0, 0, 0, 1, 1,
-0.889702, -0.5882855, -3.224401, 0, 0, 0, 1, 1,
-0.8893738, -0.492261, -3.722717, 0, 0, 0, 1, 1,
-0.8862209, 0.3401774, -2.415594, 0, 0, 0, 1, 1,
-0.882946, -0.003574005, -1.076505, 0, 0, 0, 1, 1,
-0.8822675, 0.2931493, -1.844133, 0, 0, 0, 1, 1,
-0.8811331, 0.03274738, -2.017593, 1, 1, 1, 1, 1,
-0.879477, -0.04631554, -1.827004, 1, 1, 1, 1, 1,
-0.8743389, 1.022519, -1.325888, 1, 1, 1, 1, 1,
-0.8660967, -1.118266, -2.362585, 1, 1, 1, 1, 1,
-0.8657269, 0.5700791, -0.9383277, 1, 1, 1, 1, 1,
-0.8564043, 0.6894744, 0.2676331, 1, 1, 1, 1, 1,
-0.8549638, 0.9439908, -0.4108594, 1, 1, 1, 1, 1,
-0.851266, 0.77121, -1.82823, 1, 1, 1, 1, 1,
-0.8486032, 0.6797225, -1.564323, 1, 1, 1, 1, 1,
-0.84838, -2.029019, -2.120258, 1, 1, 1, 1, 1,
-0.8471625, -0.5183215, -1.97997, 1, 1, 1, 1, 1,
-0.8421975, 1.595064, -0.4942504, 1, 1, 1, 1, 1,
-0.841134, -1.166623, -1.582514, 1, 1, 1, 1, 1,
-0.8358632, 0.1761556, -0.9340947, 1, 1, 1, 1, 1,
-0.8342816, -2.07763, -1.747195, 1, 1, 1, 1, 1,
-0.833267, -2.147427, -3.728586, 0, 0, 1, 1, 1,
-0.8315932, -0.6216094, -2.386063, 1, 0, 0, 1, 1,
-0.8296174, 0.7186963, -0.1506596, 1, 0, 0, 1, 1,
-0.828665, 0.8263836, -2.512616, 1, 0, 0, 1, 1,
-0.8199158, 0.3727956, -1.819166, 1, 0, 0, 1, 1,
-0.8168029, -0.5368915, -1.483815, 1, 0, 0, 1, 1,
-0.8118808, 0.1675804, -2.223004, 0, 0, 0, 1, 1,
-0.8118545, -2.015715, -3.434398, 0, 0, 0, 1, 1,
-0.8117396, -1.139385, -2.257414, 0, 0, 0, 1, 1,
-0.8087298, -0.4080464, -3.031761, 0, 0, 0, 1, 1,
-0.8084574, 0.9247745, 0.4766449, 0, 0, 0, 1, 1,
-0.807408, 2.214904, 1.738078, 0, 0, 0, 1, 1,
-0.8031437, -2.492672, -1.38695, 0, 0, 0, 1, 1,
-0.8006015, -0.3920006, -1.451854, 1, 1, 1, 1, 1,
-0.7929608, -1.081868, -0.5947312, 1, 1, 1, 1, 1,
-0.7871552, -0.1104766, -2.440527, 1, 1, 1, 1, 1,
-0.7827282, 0.0294966, -2.005293, 1, 1, 1, 1, 1,
-0.7827008, 0.5332777, 0.6245958, 1, 1, 1, 1, 1,
-0.7803856, -0.3514134, -2.826171, 1, 1, 1, 1, 1,
-0.7778814, 1.041651, -1.160102, 1, 1, 1, 1, 1,
-0.7704386, -0.2560669, -2.576334, 1, 1, 1, 1, 1,
-0.76432, 1.498356, -1.896449, 1, 1, 1, 1, 1,
-0.76164, -1.396005, -2.93659, 1, 1, 1, 1, 1,
-0.7585601, -0.6118292, -1.68972, 1, 1, 1, 1, 1,
-0.7563992, 1.411196, -0.7030105, 1, 1, 1, 1, 1,
-0.7509111, -1.314327, -2.706246, 1, 1, 1, 1, 1,
-0.7506709, -0.7360368, -4.978315, 1, 1, 1, 1, 1,
-0.7413123, -2.388683, -3.718914, 1, 1, 1, 1, 1,
-0.7395978, 0.1954786, -0.7515123, 0, 0, 1, 1, 1,
-0.7264394, 1.472749, 0.2842907, 1, 0, 0, 1, 1,
-0.7245645, 0.6168519, 0.1359582, 1, 0, 0, 1, 1,
-0.7199947, 0.3966105, -2.024766, 1, 0, 0, 1, 1,
-0.7196098, 0.4778599, -0.8846527, 1, 0, 0, 1, 1,
-0.7173338, -0.2475108, -1.986822, 1, 0, 0, 1, 1,
-0.7133693, 0.4890183, -0.9210016, 0, 0, 0, 1, 1,
-0.7119375, -0.7184145, -2.487196, 0, 0, 0, 1, 1,
-0.7095954, -1.526896, -1.641085, 0, 0, 0, 1, 1,
-0.7058325, 0.02939024, -1.049509, 0, 0, 0, 1, 1,
-0.7056091, 0.7918867, 0.04386643, 0, 0, 0, 1, 1,
-0.7046753, -0.1713706, -0.2648113, 0, 0, 0, 1, 1,
-0.7039745, 0.03844807, -2.973498, 0, 0, 0, 1, 1,
-0.7001874, -0.004677081, -1.536017, 1, 1, 1, 1, 1,
-0.6988119, 0.285749, -3.319777, 1, 1, 1, 1, 1,
-0.6949922, -0.2102558, -0.9202324, 1, 1, 1, 1, 1,
-0.6930288, -0.2031026, -1.901057, 1, 1, 1, 1, 1,
-0.6888829, -1.550602, -2.419294, 1, 1, 1, 1, 1,
-0.6878566, 1.871086, 0.4876922, 1, 1, 1, 1, 1,
-0.6869211, -0.8193668, -2.225923, 1, 1, 1, 1, 1,
-0.6859295, 0.8235745, -0.7878628, 1, 1, 1, 1, 1,
-0.6857918, 2.401811, 0.3005891, 1, 1, 1, 1, 1,
-0.6853674, 0.6368344, -0.3708714, 1, 1, 1, 1, 1,
-0.6847023, 0.1134421, -2.078699, 1, 1, 1, 1, 1,
-0.6819602, -1.972363, -3.172678, 1, 1, 1, 1, 1,
-0.6745092, -0.3931568, -1.85771, 1, 1, 1, 1, 1,
-0.6733045, 0.203526, -1.121531, 1, 1, 1, 1, 1,
-0.6701786, -0.6756318, -3.245228, 1, 1, 1, 1, 1,
-0.6700289, -0.6727615, -2.803649, 0, 0, 1, 1, 1,
-0.6699111, 0.5007294, -0.5526054, 1, 0, 0, 1, 1,
-0.6640241, -0.2604496, -2.036022, 1, 0, 0, 1, 1,
-0.659487, -0.03794452, 0.7631749, 1, 0, 0, 1, 1,
-0.6577415, -0.3514097, -0.920961, 1, 0, 0, 1, 1,
-0.6529871, 1.517734, 0.210955, 1, 0, 0, 1, 1,
-0.6518278, -1.052704, -2.265866, 0, 0, 0, 1, 1,
-0.64994, 1.410874, -0.3975075, 0, 0, 0, 1, 1,
-0.647429, 0.09409936, -0.7875258, 0, 0, 0, 1, 1,
-0.6419556, 0.2544643, -2.571115, 0, 0, 0, 1, 1,
-0.6375303, -1.723231, -2.220785, 0, 0, 0, 1, 1,
-0.6327732, 0.6851001, -2.409481, 0, 0, 0, 1, 1,
-0.6325937, -0.2756535, -3.00335, 0, 0, 0, 1, 1,
-0.6279941, 1.906391, 1.797233, 1, 1, 1, 1, 1,
-0.6233758, -1.142283, -2.368646, 1, 1, 1, 1, 1,
-0.6194534, -0.4531866, -2.354896, 1, 1, 1, 1, 1,
-0.6140665, -0.2304465, -1.444896, 1, 1, 1, 1, 1,
-0.6132223, 0.9523416, 0.01918593, 1, 1, 1, 1, 1,
-0.6116349, 1.700109, -1.562984, 1, 1, 1, 1, 1,
-0.6114901, -0.1241468, -2.262156, 1, 1, 1, 1, 1,
-0.6087312, 0.4772892, -2.010617, 1, 1, 1, 1, 1,
-0.6073885, 0.334299, -1.513062, 1, 1, 1, 1, 1,
-0.6067324, 0.5013978, -0.7039252, 1, 1, 1, 1, 1,
-0.5946753, 1.181965, -0.4854697, 1, 1, 1, 1, 1,
-0.5930063, 1.303038, -0.7275273, 1, 1, 1, 1, 1,
-0.5887387, 0.5900428, -1.842446, 1, 1, 1, 1, 1,
-0.5829613, -0.7157362, -2.082179, 1, 1, 1, 1, 1,
-0.581605, 3.587807, -1.190079, 1, 1, 1, 1, 1,
-0.5814587, 2.667675, -0.5647778, 0, 0, 1, 1, 1,
-0.5748867, -0.2830821, -2.6076, 1, 0, 0, 1, 1,
-0.5622372, 0.6115634, -0.5322995, 1, 0, 0, 1, 1,
-0.5586434, -0.1307317, -1.722855, 1, 0, 0, 1, 1,
-0.5549366, 1.240525, 0.4061901, 1, 0, 0, 1, 1,
-0.5537603, 1.593441, -1.88408, 1, 0, 0, 1, 1,
-0.5497187, -0.3807643, -1.115782, 0, 0, 0, 1, 1,
-0.5496395, 0.9998226, 1.196929, 0, 0, 0, 1, 1,
-0.5398359, -2.052656, -2.596729, 0, 0, 0, 1, 1,
-0.5383847, 3.590673, -0.3695408, 0, 0, 0, 1, 1,
-0.5305199, 1.240919, -1.877228, 0, 0, 0, 1, 1,
-0.5279126, 0.5318224, -0.8207594, 0, 0, 0, 1, 1,
-0.5242888, -0.9322718, -2.151847, 0, 0, 0, 1, 1,
-0.5233219, -0.4706919, -2.134354, 1, 1, 1, 1, 1,
-0.519898, 1.038902, -1.106974, 1, 1, 1, 1, 1,
-0.5198281, -0.3143788, -1.097777, 1, 1, 1, 1, 1,
-0.519551, -1.155628, -1.931399, 1, 1, 1, 1, 1,
-0.5192357, 0.08262172, -0.4056186, 1, 1, 1, 1, 1,
-0.5173197, 0.5979277, -0.664244, 1, 1, 1, 1, 1,
-0.5164737, -1.478731, -5.33359, 1, 1, 1, 1, 1,
-0.5123853, 0.4370779, -0.152018, 1, 1, 1, 1, 1,
-0.5117873, 1.435914, -0.57762, 1, 1, 1, 1, 1,
-0.5046736, 0.2239544, -0.8428209, 1, 1, 1, 1, 1,
-0.5012292, -1.120836, -3.591685, 1, 1, 1, 1, 1,
-0.4987849, 1.377148, -1.833653, 1, 1, 1, 1, 1,
-0.492823, 1.113478, 0.6075682, 1, 1, 1, 1, 1,
-0.4837965, -0.8253376, -2.008266, 1, 1, 1, 1, 1,
-0.4826881, -1.252712, -3.797712, 1, 1, 1, 1, 1,
-0.4807408, -0.3254716, -1.088505, 0, 0, 1, 1, 1,
-0.4792983, 0.08678693, -0.7124819, 1, 0, 0, 1, 1,
-0.4788685, -0.1994798, -1.84467, 1, 0, 0, 1, 1,
-0.4749361, -0.7530072, -2.282887, 1, 0, 0, 1, 1,
-0.4667473, -0.6392509, -1.696786, 1, 0, 0, 1, 1,
-0.462719, -0.9565333, -1.565143, 1, 0, 0, 1, 1,
-0.4605706, 2.179819, -0.08281109, 0, 0, 0, 1, 1,
-0.4557006, 0.7159024, -1.896722, 0, 0, 0, 1, 1,
-0.4512186, 0.1026692, -1.70012, 0, 0, 0, 1, 1,
-0.4482855, 1.674536, -0.616531, 0, 0, 0, 1, 1,
-0.44639, 2.242005, -1.160547, 0, 0, 0, 1, 1,
-0.4448577, -0.5102503, -2.836691, 0, 0, 0, 1, 1,
-0.433048, -0.4765147, -0.9264447, 0, 0, 0, 1, 1,
-0.4325013, 0.5907392, -1.244596, 1, 1, 1, 1, 1,
-0.4296039, -0.1628287, -1.116193, 1, 1, 1, 1, 1,
-0.424926, -1.737553, -2.818717, 1, 1, 1, 1, 1,
-0.4209595, -0.7929943, -3.653673, 1, 1, 1, 1, 1,
-0.415301, 0.6272252, -2.685908, 1, 1, 1, 1, 1,
-0.4152646, -0.5943595, -2.267838, 1, 1, 1, 1, 1,
-0.4110586, -1.285524, -2.280811, 1, 1, 1, 1, 1,
-0.408803, 1.036314, 1.193858, 1, 1, 1, 1, 1,
-0.4043326, -0.5956854, -1.559747, 1, 1, 1, 1, 1,
-0.3996036, 0.2238586, -0.002140341, 1, 1, 1, 1, 1,
-0.3968042, 1.133627, -1.897886, 1, 1, 1, 1, 1,
-0.3954129, 1.587935, -0.9781156, 1, 1, 1, 1, 1,
-0.3943388, 0.3128226, 0.1493921, 1, 1, 1, 1, 1,
-0.3860848, 0.1599003, -1.976919, 1, 1, 1, 1, 1,
-0.3858517, 0.4266893, -1.159349, 1, 1, 1, 1, 1,
-0.3850504, -0.1242938, -1.950074, 0, 0, 1, 1, 1,
-0.3836703, 1.141139, -0.2231273, 1, 0, 0, 1, 1,
-0.3824644, -0.7883502, -1.180309, 1, 0, 0, 1, 1,
-0.3797882, -0.834558, -1.586199, 1, 0, 0, 1, 1,
-0.3755634, -0.8358691, -3.938139, 1, 0, 0, 1, 1,
-0.3630265, 0.1411008, 0.3361554, 1, 0, 0, 1, 1,
-0.3614102, -0.6595802, -1.40734, 0, 0, 0, 1, 1,
-0.3591517, 0.8155167, 1.703887, 0, 0, 0, 1, 1,
-0.3586881, 1.151626, -0.584416, 0, 0, 0, 1, 1,
-0.3488069, -0.6625621, -2.289003, 0, 0, 0, 1, 1,
-0.3440402, 0.5701581, -0.02447805, 0, 0, 0, 1, 1,
-0.327403, -1.06204, -4.015755, 0, 0, 0, 1, 1,
-0.3267559, -1.281641, -1.831738, 0, 0, 0, 1, 1,
-0.3199069, -0.380816, -2.253754, 1, 1, 1, 1, 1,
-0.3179934, -0.4295138, -2.351213, 1, 1, 1, 1, 1,
-0.3173681, -0.8891163, -2.519806, 1, 1, 1, 1, 1,
-0.316932, 2.293467, -0.2172126, 1, 1, 1, 1, 1,
-0.3144132, -0.2350784, -3.447732, 1, 1, 1, 1, 1,
-0.3141695, -0.7478274, -2.056294, 1, 1, 1, 1, 1,
-0.3128949, 1.520348, 0.4037784, 1, 1, 1, 1, 1,
-0.3108262, 1.384798, -0.594436, 1, 1, 1, 1, 1,
-0.3106028, 1.831093, 0.8482873, 1, 1, 1, 1, 1,
-0.3097931, 0.006805468, -3.724492, 1, 1, 1, 1, 1,
-0.3082389, 0.8151575, 0.404796, 1, 1, 1, 1, 1,
-0.3077596, 0.132059, -2.424381, 1, 1, 1, 1, 1,
-0.3076447, -0.1548449, -2.007285, 1, 1, 1, 1, 1,
-0.3039831, 0.2941652, -2.03893, 1, 1, 1, 1, 1,
-0.2953807, -0.921193, -3.890919, 1, 1, 1, 1, 1,
-0.2951632, -1.326848, -4.251327, 0, 0, 1, 1, 1,
-0.2945289, 0.6808732, -1.6258, 1, 0, 0, 1, 1,
-0.2930979, 0.7442771, 0.7695966, 1, 0, 0, 1, 1,
-0.2925191, -0.2525852, -1.993803, 1, 0, 0, 1, 1,
-0.2913799, 1.444704, -0.773128, 1, 0, 0, 1, 1,
-0.2863979, -0.6185595, -3.341913, 1, 0, 0, 1, 1,
-0.2832775, -0.0443508, -1.995293, 0, 0, 0, 1, 1,
-0.2825944, -0.8181033, -3.007555, 0, 0, 0, 1, 1,
-0.2757216, -0.6199473, -2.81497, 0, 0, 0, 1, 1,
-0.272719, -1.652362, -3.449951, 0, 0, 0, 1, 1,
-0.2724781, 0.8684549, -1.345725, 0, 0, 0, 1, 1,
-0.2711814, -1.39926, -3.016175, 0, 0, 0, 1, 1,
-0.2692177, 0.260161, -0.3854382, 0, 0, 0, 1, 1,
-0.2640942, -0.1110132, -2.530461, 1, 1, 1, 1, 1,
-0.2629872, 0.402828, 1.991138, 1, 1, 1, 1, 1,
-0.262966, -0.7468478, -3.210057, 1, 1, 1, 1, 1,
-0.2588247, 0.5638156, -0.405599, 1, 1, 1, 1, 1,
-0.258743, 1.091894, -0.8125606, 1, 1, 1, 1, 1,
-0.2577893, -1.289658, -2.477721, 1, 1, 1, 1, 1,
-0.2502164, 1.118236, 0.7347879, 1, 1, 1, 1, 1,
-0.2466774, 0.337148, -1.37989, 1, 1, 1, 1, 1,
-0.2457308, 0.4039543, -1.090558, 1, 1, 1, 1, 1,
-0.2441343, -1.44033, -3.579099, 1, 1, 1, 1, 1,
-0.2423038, 0.03495485, -2.751807, 1, 1, 1, 1, 1,
-0.2395513, -1.21453, -3.101055, 1, 1, 1, 1, 1,
-0.2392667, 0.7764392, -0.627511, 1, 1, 1, 1, 1,
-0.2314656, -0.374399, -1.553541, 1, 1, 1, 1, 1,
-0.2251044, 1.029481, 0.2882299, 1, 1, 1, 1, 1,
-0.2244463, 1.012204, -0.1049234, 0, 0, 1, 1, 1,
-0.221266, 1.564797, 1.095464, 1, 0, 0, 1, 1,
-0.2058404, -0.5642477, -2.689559, 1, 0, 0, 1, 1,
-0.202543, -2.072112, -3.150615, 1, 0, 0, 1, 1,
-0.2021375, -0.1645957, -1.62628, 1, 0, 0, 1, 1,
-0.2006287, -0.5578407, -1.938132, 1, 0, 0, 1, 1,
-0.1972756, -1.686815, -2.069238, 0, 0, 0, 1, 1,
-0.193011, -0.4098813, -2.967041, 0, 0, 0, 1, 1,
-0.1914104, -1.575699, -4.197035, 0, 0, 0, 1, 1,
-0.1912443, -0.1891076, -2.18201, 0, 0, 0, 1, 1,
-0.1884326, -0.5699658, -3.603989, 0, 0, 0, 1, 1,
-0.1872471, -0.8661649, -2.947021, 0, 0, 0, 1, 1,
-0.1860586, 1.185449, 1.346934, 0, 0, 0, 1, 1,
-0.1827792, 0.5280964, 1.18058, 1, 1, 1, 1, 1,
-0.1771316, -0.8681281, -3.265318, 1, 1, 1, 1, 1,
-0.1739836, -0.2031204, -1.693355, 1, 1, 1, 1, 1,
-0.1735326, 1.825919, -1.869406, 1, 1, 1, 1, 1,
-0.1716701, 1.253798, -0.3045499, 1, 1, 1, 1, 1,
-0.1695302, -0.6891401, -4.489686, 1, 1, 1, 1, 1,
-0.1632458, -1.573435, -1.664589, 1, 1, 1, 1, 1,
-0.1624027, 1.410986, 0.02640647, 1, 1, 1, 1, 1,
-0.1619081, 0.2583893, -0.3246644, 1, 1, 1, 1, 1,
-0.1579829, 0.8148595, -0.3631536, 1, 1, 1, 1, 1,
-0.1558057, -0.4357424, -2.292628, 1, 1, 1, 1, 1,
-0.151871, -0.2444656, -4.653085, 1, 1, 1, 1, 1,
-0.1511633, 0.4509532, 0.3859802, 1, 1, 1, 1, 1,
-0.150646, -1.950972, -3.898729, 1, 1, 1, 1, 1,
-0.1496708, -1.107483, -3.722589, 1, 1, 1, 1, 1,
-0.1486642, 0.0915082, 1.501344, 0, 0, 1, 1, 1,
-0.1430865, -0.4448714, -3.063196, 1, 0, 0, 1, 1,
-0.1400477, -1.598547, -2.821833, 1, 0, 0, 1, 1,
-0.1304936, 0.1874155, 0.559941, 1, 0, 0, 1, 1,
-0.122318, 0.1064202, 0.850708, 1, 0, 0, 1, 1,
-0.1222929, 0.0685244, 0.4439224, 1, 0, 0, 1, 1,
-0.1213777, 2.037447, 1.395402, 0, 0, 0, 1, 1,
-0.120901, -0.332966, -4.072828, 0, 0, 0, 1, 1,
-0.1181188, -0.7645151, -2.951197, 0, 0, 0, 1, 1,
-0.1175575, -0.8511332, -3.362111, 0, 0, 0, 1, 1,
-0.1148605, 1.345992, -0.2805569, 0, 0, 0, 1, 1,
-0.1146862, 0.3496115, -1.593859, 0, 0, 0, 1, 1,
-0.1121496, -0.06052017, 0.007377999, 0, 0, 0, 1, 1,
-0.1121398, 0.495458, 0.481966, 1, 1, 1, 1, 1,
-0.1080933, 0.2524553, -0.9014229, 1, 1, 1, 1, 1,
-0.1067531, 0.7294747, -0.4513122, 1, 1, 1, 1, 1,
-0.1040142, -0.2937676, -2.54562, 1, 1, 1, 1, 1,
-0.1021708, -2.197579, -4.569091, 1, 1, 1, 1, 1,
-0.1000071, -1.849765, -2.658685, 1, 1, 1, 1, 1,
-0.09381102, -0.3193542, -1.995003, 1, 1, 1, 1, 1,
-0.09378898, 0.5309935, -0.3104209, 1, 1, 1, 1, 1,
-0.08675288, 1.122577, 1.503868, 1, 1, 1, 1, 1,
-0.0864826, 0.1563407, -0.343356, 1, 1, 1, 1, 1,
-0.08282214, 0.06124816, -0.7930341, 1, 1, 1, 1, 1,
-0.08272607, -0.2779872, -2.705774, 1, 1, 1, 1, 1,
-0.08206523, 0.5860869, 0.3638076, 1, 1, 1, 1, 1,
-0.08000628, -0.1389944, -2.88117, 1, 1, 1, 1, 1,
-0.07879338, -1.531827, -3.723372, 1, 1, 1, 1, 1,
-0.07723901, 2.085808, 0.1740063, 0, 0, 1, 1, 1,
-0.07652738, 0.6441548, -0.2954324, 1, 0, 0, 1, 1,
-0.06933375, 0.4137553, 0.8606616, 1, 0, 0, 1, 1,
-0.06885467, -0.3922414, -5.25408, 1, 0, 0, 1, 1,
-0.06694563, -0.7164897, -2.637335, 1, 0, 0, 1, 1,
-0.06607913, 1.032968, -1.735106, 1, 0, 0, 1, 1,
-0.06603481, -0.669476, -1.236851, 0, 0, 0, 1, 1,
-0.06491008, 0.5152633, -1.812568, 0, 0, 0, 1, 1,
-0.05988075, 0.8817122, 1.318629, 0, 0, 0, 1, 1,
-0.05961159, -1.034177, -4.178489, 0, 0, 0, 1, 1,
-0.05765378, -1.27844, -3.853504, 0, 0, 0, 1, 1,
-0.05574342, -0.9057345, -2.553067, 0, 0, 0, 1, 1,
-0.05009411, -0.2562771, -4.271361, 0, 0, 0, 1, 1,
-0.04985292, 0.2453628, 1.666712, 1, 1, 1, 1, 1,
-0.0480122, 0.2313863, -0.1547277, 1, 1, 1, 1, 1,
-0.04657223, -0.5575815, -3.649814, 1, 1, 1, 1, 1,
-0.04577132, 1.111759, -2.817698, 1, 1, 1, 1, 1,
-0.04133169, -1.101182, -2.956807, 1, 1, 1, 1, 1,
-0.03831832, -0.5218788, -3.193594, 1, 1, 1, 1, 1,
-0.03828579, -0.2456135, -2.432173, 1, 1, 1, 1, 1,
-0.0357697, -0.007748774, -0.3123749, 1, 1, 1, 1, 1,
-0.03193125, 1.041455, -1.081502, 1, 1, 1, 1, 1,
-0.02686151, -0.6913238, -3.742828, 1, 1, 1, 1, 1,
-0.02602451, 1.465523, -0.2004819, 1, 1, 1, 1, 1,
-0.02168444, 0.04660099, -2.539088, 1, 1, 1, 1, 1,
-0.01584278, -1.923324, -2.939312, 1, 1, 1, 1, 1,
-0.01076911, 0.3525505, 0.3952813, 1, 1, 1, 1, 1,
-0.009576733, 0.741452, 2.375366, 1, 1, 1, 1, 1,
-0.009446663, 1.525786, -1.502896, 0, 0, 1, 1, 1,
0.001382078, -1.258958, 4.161364, 1, 0, 0, 1, 1,
0.002232784, -0.9562445, 1.272549, 1, 0, 0, 1, 1,
0.008984027, -0.0733074, 1.260332, 1, 0, 0, 1, 1,
0.01290006, 1.467473, 1.244578, 1, 0, 0, 1, 1,
0.01439897, -1.244519, 3.460142, 1, 0, 0, 1, 1,
0.01463419, -0.1422474, 2.831319, 0, 0, 0, 1, 1,
0.02029045, 1.885974, 0.6159523, 0, 0, 0, 1, 1,
0.03012153, 1.573823, -0.04574154, 0, 0, 0, 1, 1,
0.03530768, -0.1409571, 4.478728, 0, 0, 0, 1, 1,
0.03871806, 0.6121375, -0.8119238, 0, 0, 0, 1, 1,
0.04158008, -1.691012, 3.05319, 0, 0, 0, 1, 1,
0.04744133, -1.036372, 1.792176, 0, 0, 0, 1, 1,
0.04816585, 0.3501847, -1.126852, 1, 1, 1, 1, 1,
0.04870559, -0.6778755, 3.371533, 1, 1, 1, 1, 1,
0.04984337, -1.504634, 3.474574, 1, 1, 1, 1, 1,
0.04995162, -0.3893349, 3.21146, 1, 1, 1, 1, 1,
0.06074189, -2.010007, 4.705355, 1, 1, 1, 1, 1,
0.06231201, 0.03918017, 0.4794473, 1, 1, 1, 1, 1,
0.06610578, -0.5719146, 1.999211, 1, 1, 1, 1, 1,
0.066806, -1.929029, 4.355273, 1, 1, 1, 1, 1,
0.06751054, 2.316832, 0.239315, 1, 1, 1, 1, 1,
0.07250453, -1.136779, 2.945488, 1, 1, 1, 1, 1,
0.07448586, 0.6912312, -0.4291279, 1, 1, 1, 1, 1,
0.07578311, -0.1404071, 1.974449, 1, 1, 1, 1, 1,
0.07712189, -0.4316812, 2.970315, 1, 1, 1, 1, 1,
0.07794078, -0.02917139, 1.649615, 1, 1, 1, 1, 1,
0.08008201, -0.6672695, 3.203776, 1, 1, 1, 1, 1,
0.08483006, 0.8434201, -0.3065161, 0, 0, 1, 1, 1,
0.08904787, -0.2461995, 4.420663, 1, 0, 0, 1, 1,
0.09117975, 0.4841715, 0.8825392, 1, 0, 0, 1, 1,
0.09300253, -0.242663, 4.792689, 1, 0, 0, 1, 1,
0.09383054, -0.379416, 2.595793, 1, 0, 0, 1, 1,
0.09546526, -1.904488, 3.469126, 1, 0, 0, 1, 1,
0.09556673, -0.1919096, 4.098055, 0, 0, 0, 1, 1,
0.09732601, 0.04560244, 2.053474, 0, 0, 0, 1, 1,
0.098212, -1.709272, 3.71909, 0, 0, 0, 1, 1,
0.09902066, 0.837919, 0.6203568, 0, 0, 0, 1, 1,
0.09945552, -1.008508, 2.623203, 0, 0, 0, 1, 1,
0.1033455, -0.2909045, 2.688059, 0, 0, 0, 1, 1,
0.1073073, 0.00192935, 0.2677791, 0, 0, 0, 1, 1,
0.1077627, -1.245154, 2.359267, 1, 1, 1, 1, 1,
0.110098, -0.8219424, 3.255761, 1, 1, 1, 1, 1,
0.1104965, 1.019591, -0.1660119, 1, 1, 1, 1, 1,
0.1109657, -0.6397535, 3.433609, 1, 1, 1, 1, 1,
0.1193031, 0.04430038, 2.48964, 1, 1, 1, 1, 1,
0.1195033, -0.2729771, 4.075217, 1, 1, 1, 1, 1,
0.1257294, 0.3373785, 0.6939504, 1, 1, 1, 1, 1,
0.1295596, 0.8965556, 0.9729445, 1, 1, 1, 1, 1,
0.133288, 0.4700267, -0.1544022, 1, 1, 1, 1, 1,
0.1340771, -1.029039, 4.503942, 1, 1, 1, 1, 1,
0.1356429, -0.2014259, 1.308132, 1, 1, 1, 1, 1,
0.1365029, 0.8822432, 0.6309835, 1, 1, 1, 1, 1,
0.1387601, 1.674624, 0.7371809, 1, 1, 1, 1, 1,
0.1409399, -2.253546, 5.350272, 1, 1, 1, 1, 1,
0.1412325, 0.3340197, -0.3342286, 1, 1, 1, 1, 1,
0.1416928, -0.7540799, 2.107892, 0, 0, 1, 1, 1,
0.1476359, 0.1036172, -0.1297719, 1, 0, 0, 1, 1,
0.152923, -1.062894, 1.983467, 1, 0, 0, 1, 1,
0.1533729, -1.18873, 3.773158, 1, 0, 0, 1, 1,
0.1549263, 0.1440687, 3.690168, 1, 0, 0, 1, 1,
0.1549962, 1.494806, 1.573409, 1, 0, 0, 1, 1,
0.1552524, -0.7851465, 4.044124, 0, 0, 0, 1, 1,
0.1573071, -0.2169096, 4.04273, 0, 0, 0, 1, 1,
0.1599786, 0.843062, -0.266107, 0, 0, 0, 1, 1,
0.1622412, -1.962009, 2.218389, 0, 0, 0, 1, 1,
0.1642333, -1.666686, 4.137878, 0, 0, 0, 1, 1,
0.1660567, -0.3382175, 2.685123, 0, 0, 0, 1, 1,
0.1683271, -0.3147613, 2.852423, 0, 0, 0, 1, 1,
0.1687876, 1.007547, -1.395031, 1, 1, 1, 1, 1,
0.1689045, -1.639975, 4.434839, 1, 1, 1, 1, 1,
0.1692587, 0.3418406, 1.034028, 1, 1, 1, 1, 1,
0.1699302, 0.0433967, 0.9277441, 1, 1, 1, 1, 1,
0.1710847, -0.9286389, 2.742098, 1, 1, 1, 1, 1,
0.1739869, 1.20692, -1.064305, 1, 1, 1, 1, 1,
0.1741367, 0.04654543, 1.175149, 1, 1, 1, 1, 1,
0.1747707, 0.4726445, 0.6615061, 1, 1, 1, 1, 1,
0.176466, -0.6824642, 5.198345, 1, 1, 1, 1, 1,
0.1806481, -1.116487, 4.006254, 1, 1, 1, 1, 1,
0.1827598, 0.04578901, 0.2796806, 1, 1, 1, 1, 1,
0.1851782, 1.288683, -1.811202, 1, 1, 1, 1, 1,
0.187246, -1.214723, 1.772349, 1, 1, 1, 1, 1,
0.1880633, -0.964569, 2.508743, 1, 1, 1, 1, 1,
0.1889113, -0.9943835, 3.058772, 1, 1, 1, 1, 1,
0.1906012, -0.7464007, 3.565497, 0, 0, 1, 1, 1,
0.1919628, 0.08157257, 2.738826, 1, 0, 0, 1, 1,
0.1923091, -1.795863, 2.548505, 1, 0, 0, 1, 1,
0.1980905, -0.5371956, 1.371178, 1, 0, 0, 1, 1,
0.1981822, -0.4908727, 2.062986, 1, 0, 0, 1, 1,
0.1984119, 0.08469059, -0.282196, 1, 0, 0, 1, 1,
0.2040444, -1.652249, 2.273985, 0, 0, 0, 1, 1,
0.2061578, 0.8810585, 1.90956, 0, 0, 0, 1, 1,
0.206486, 0.02189437, 2.33359, 0, 0, 0, 1, 1,
0.2085325, 1.889192, 0.7844518, 0, 0, 0, 1, 1,
0.2097983, 1.972697, -0.3674983, 0, 0, 0, 1, 1,
0.2122324, -2.406299, 4.288519, 0, 0, 0, 1, 1,
0.2141172, -0.2155537, 2.647284, 0, 0, 0, 1, 1,
0.2142285, -0.7283605, 1.071735, 1, 1, 1, 1, 1,
0.2149615, 1.264533, 1.203989, 1, 1, 1, 1, 1,
0.2182983, -1.548803, 1.958322, 1, 1, 1, 1, 1,
0.2192099, 1.343018, 0.9248288, 1, 1, 1, 1, 1,
0.2198934, -0.1167582, 4.2093, 1, 1, 1, 1, 1,
0.2207302, -0.1918153, 2.124098, 1, 1, 1, 1, 1,
0.2208006, 1.938339, -0.1541171, 1, 1, 1, 1, 1,
0.2217946, 0.8822755, -0.05502189, 1, 1, 1, 1, 1,
0.2279248, -0.2266698, 2.650896, 1, 1, 1, 1, 1,
0.2301194, 0.7966408, 2.333184, 1, 1, 1, 1, 1,
0.2363191, -0.1033358, 1.575046, 1, 1, 1, 1, 1,
0.2394681, 0.5561478, 1.639492, 1, 1, 1, 1, 1,
0.2411682, 0.7473486, -0.8869059, 1, 1, 1, 1, 1,
0.241919, 1.158844, -0.354717, 1, 1, 1, 1, 1,
0.242389, 0.5125837, 0.7451085, 1, 1, 1, 1, 1,
0.2426077, 1.553143, 0.1647992, 0, 0, 1, 1, 1,
0.2427591, -1.292286, 0.8804172, 1, 0, 0, 1, 1,
0.2440348, -0.9984323, 3.117089, 1, 0, 0, 1, 1,
0.2462277, 2.713859, 0.9299017, 1, 0, 0, 1, 1,
0.251019, -1.056321, 2.347098, 1, 0, 0, 1, 1,
0.2513183, 1.193678, 1.399867, 1, 0, 0, 1, 1,
0.2520118, 0.9952788, 0.6520352, 0, 0, 0, 1, 1,
0.2605868, -1.8438, 2.336779, 0, 0, 0, 1, 1,
0.2609817, 1.16242, -0.2028146, 0, 0, 0, 1, 1,
0.2650833, 0.9730809, 0.4006985, 0, 0, 0, 1, 1,
0.2669921, 2.203179, 0.2691376, 0, 0, 0, 1, 1,
0.2705646, 2.07967, 1.243689, 0, 0, 0, 1, 1,
0.2718705, -0.1561591, 1.141188, 0, 0, 0, 1, 1,
0.280245, 0.3674093, 0.6185796, 1, 1, 1, 1, 1,
0.2806835, 0.4332029, -0.2840411, 1, 1, 1, 1, 1,
0.2818347, -1.08761, 3.216003, 1, 1, 1, 1, 1,
0.2820593, -1.126222, 2.119469, 1, 1, 1, 1, 1,
0.282273, 0.1212133, 1.209417, 1, 1, 1, 1, 1,
0.2822869, -2.663257, 2.414066, 1, 1, 1, 1, 1,
0.2824174, 0.3322888, 1.160111, 1, 1, 1, 1, 1,
0.283391, 0.3418934, 1.774604, 1, 1, 1, 1, 1,
0.2840966, 0.7932061, -0.742948, 1, 1, 1, 1, 1,
0.2858022, -0.03459468, 1.289859, 1, 1, 1, 1, 1,
0.2863141, 1.238909, 1.669343, 1, 1, 1, 1, 1,
0.2865322, -0.4457187, 3.762054, 1, 1, 1, 1, 1,
0.287356, 0.1732085, 1.454281, 1, 1, 1, 1, 1,
0.2930279, 0.9266776, -0.3494242, 1, 1, 1, 1, 1,
0.2981809, 0.2934984, 1.519034, 1, 1, 1, 1, 1,
0.2987516, -0.4739828, 2.104759, 0, 0, 1, 1, 1,
0.3019664, 0.7834328, 1.561006, 1, 0, 0, 1, 1,
0.3056148, 1.449947, -0.6750293, 1, 0, 0, 1, 1,
0.3140642, 0.5493789, 1.945076, 1, 0, 0, 1, 1,
0.3201584, 0.1165687, 0.5283059, 1, 0, 0, 1, 1,
0.3218262, -2.075734, 3.736407, 1, 0, 0, 1, 1,
0.3266855, -0.9890307, 2.533374, 0, 0, 0, 1, 1,
0.3284174, -1.383522, 3.697253, 0, 0, 0, 1, 1,
0.3305134, -0.1897399, 2.701946, 0, 0, 0, 1, 1,
0.3319298, -0.6698629, 1.947549, 0, 0, 0, 1, 1,
0.3341233, 1.51654, 0.5359542, 0, 0, 0, 1, 1,
0.335368, -0.1214549, 2.390514, 0, 0, 0, 1, 1,
0.3362162, 2.574627, 1.137274, 0, 0, 0, 1, 1,
0.3370382, 0.5776642, 0.6960714, 1, 1, 1, 1, 1,
0.338154, -0.4628657, 0.8191063, 1, 1, 1, 1, 1,
0.343704, -0.9288573, 2.229642, 1, 1, 1, 1, 1,
0.3469733, 0.1798585, 1.531245, 1, 1, 1, 1, 1,
0.3478996, 0.568005, 0.06027428, 1, 1, 1, 1, 1,
0.3497671, -0.06552178, 2.508669, 1, 1, 1, 1, 1,
0.3555291, 0.1505008, 1.273274, 1, 1, 1, 1, 1,
0.3588182, -1.37673, 5.442725, 1, 1, 1, 1, 1,
0.3597298, -1.468741, 2.692615, 1, 1, 1, 1, 1,
0.3672221, 1.079604, 1.116228, 1, 1, 1, 1, 1,
0.3705074, 0.5105054, -0.4572787, 1, 1, 1, 1, 1,
0.3713728, -1.619964, 3.59028, 1, 1, 1, 1, 1,
0.3749261, -1.11367, 3.959497, 1, 1, 1, 1, 1,
0.3807345, -1.634575, 2.495293, 1, 1, 1, 1, 1,
0.3807816, -1.142457, 5.206589, 1, 1, 1, 1, 1,
0.3808152, -0.7195258, 3.951136, 0, 0, 1, 1, 1,
0.3861089, -0.8934786, 3.228007, 1, 0, 0, 1, 1,
0.3880491, -1.408934, 3.189306, 1, 0, 0, 1, 1,
0.3896117, -1.988144, 3.624276, 1, 0, 0, 1, 1,
0.3904209, -0.1495361, 3.296811, 1, 0, 0, 1, 1,
0.3911059, -1.175554, 3.507527, 1, 0, 0, 1, 1,
0.3911603, 0.2943441, -0.1129075, 0, 0, 0, 1, 1,
0.3921477, -0.1173053, 2.096436, 0, 0, 0, 1, 1,
0.3942398, 0.2231931, 1.94404, 0, 0, 0, 1, 1,
0.3967259, -1.031537, 1.520927, 0, 0, 0, 1, 1,
0.3988747, 1.056665, -1.137365, 0, 0, 0, 1, 1,
0.4007938, -1.779722, 2.042517, 0, 0, 0, 1, 1,
0.4013254, -1.210606, 2.428959, 0, 0, 0, 1, 1,
0.4062436, -0.8184088, 3.418775, 1, 1, 1, 1, 1,
0.4064609, 0.07333478, 2.358096, 1, 1, 1, 1, 1,
0.4087079, 1.091305, 0.3430651, 1, 1, 1, 1, 1,
0.4101893, -1.028859, 3.724768, 1, 1, 1, 1, 1,
0.4111677, -0.8581147, 2.75753, 1, 1, 1, 1, 1,
0.4156095, -0.2380478, 0.7664623, 1, 1, 1, 1, 1,
0.4191819, -1.236723, 2.466088, 1, 1, 1, 1, 1,
0.4193023, -0.9009682, 5.226643, 1, 1, 1, 1, 1,
0.4199635, -0.4889771, 1.681011, 1, 1, 1, 1, 1,
0.4252022, 1.032567, -0.1225161, 1, 1, 1, 1, 1,
0.4320775, -0.207387, 0.9656311, 1, 1, 1, 1, 1,
0.4400468, 0.4854699, 0.8989139, 1, 1, 1, 1, 1,
0.4450251, -1.869596, 2.492063, 1, 1, 1, 1, 1,
0.4485942, 0.05577371, 1.475146, 1, 1, 1, 1, 1,
0.4526107, 0.7428216, 0.6103675, 1, 1, 1, 1, 1,
0.4561187, 0.9351555, 0.03921714, 0, 0, 1, 1, 1,
0.4631535, 0.9942622, 0.9023148, 1, 0, 0, 1, 1,
0.4645028, -0.1562385, 1.422054, 1, 0, 0, 1, 1,
0.4649001, 0.2261778, 0.571226, 1, 0, 0, 1, 1,
0.4667518, -1.250856, 3.749451, 1, 0, 0, 1, 1,
0.4678438, 0.5429806, 1.715521, 1, 0, 0, 1, 1,
0.4687576, 0.4061855, 0.5661029, 0, 0, 0, 1, 1,
0.4699865, 0.4320229, 0.2029984, 0, 0, 0, 1, 1,
0.4776434, -0.3405662, 2.229697, 0, 0, 0, 1, 1,
0.4788442, -0.6816357, 3.650068, 0, 0, 0, 1, 1,
0.4797174, -0.3912472, 2.495143, 0, 0, 0, 1, 1,
0.4829099, -1.514073, 1.3661, 0, 0, 0, 1, 1,
0.4854946, -1.686306, 3.13848, 0, 0, 0, 1, 1,
0.4914939, 1.928847, 0.6497405, 1, 1, 1, 1, 1,
0.4929057, -0.3037237, 1.974856, 1, 1, 1, 1, 1,
0.4935057, 1.261321, 0.5365684, 1, 1, 1, 1, 1,
0.4973833, 0.2112205, -0.489463, 1, 1, 1, 1, 1,
0.4978729, -0.223705, 2.520586, 1, 1, 1, 1, 1,
0.4983823, 0.09384735, 1.766323, 1, 1, 1, 1, 1,
0.505467, 0.9406978, 0.03541103, 1, 1, 1, 1, 1,
0.5065259, -1.42374, 4.399413, 1, 1, 1, 1, 1,
0.5101117, -0.5070737, 2.230782, 1, 1, 1, 1, 1,
0.5104297, 0.4398712, 0.1889986, 1, 1, 1, 1, 1,
0.5117429, -1.211321, 3.070791, 1, 1, 1, 1, 1,
0.5119482, 0.2053699, 2.396688, 1, 1, 1, 1, 1,
0.5121118, -0.4217894, 1.112809, 1, 1, 1, 1, 1,
0.5180687, 1.355806, 1.908922, 1, 1, 1, 1, 1,
0.5206944, 2.828351, -0.2145684, 1, 1, 1, 1, 1,
0.5214474, -0.1869069, 2.843154, 0, 0, 1, 1, 1,
0.5218858, 1.441714, 0.3855179, 1, 0, 0, 1, 1,
0.5234731, 0.596884, 0.08658683, 1, 0, 0, 1, 1,
0.5273655, -0.5391443, 1.769521, 1, 0, 0, 1, 1,
0.5277789, -1.411592, 2.181909, 1, 0, 0, 1, 1,
0.528057, 0.2655078, -0.1222032, 1, 0, 0, 1, 1,
0.5292014, 0.1444179, 0.1539097, 0, 0, 0, 1, 1,
0.5300987, -0.4573797, 0.4655556, 0, 0, 0, 1, 1,
0.5327451, -0.8589737, 2.331268, 0, 0, 0, 1, 1,
0.532874, -0.2366392, 2.069133, 0, 0, 0, 1, 1,
0.5374919, -0.07293367, 1.053214, 0, 0, 0, 1, 1,
0.5375961, -2.748628, 2.292311, 0, 0, 0, 1, 1,
0.5379902, -1.813495, 0.8338115, 0, 0, 0, 1, 1,
0.5394844, 0.484156, 1.615723, 1, 1, 1, 1, 1,
0.5462463, 1.388459, 0.3109081, 1, 1, 1, 1, 1,
0.5535386, 2.066964, 0.2300432, 1, 1, 1, 1, 1,
0.5583318, 0.2063904, 1.335231, 1, 1, 1, 1, 1,
0.5587637, -0.8726785, 4.293442, 1, 1, 1, 1, 1,
0.5631013, 0.5812504, 1.787043, 1, 1, 1, 1, 1,
0.5664666, -0.1162353, 0.7730894, 1, 1, 1, 1, 1,
0.581387, -0.6555021, 2.61656, 1, 1, 1, 1, 1,
0.5905607, 0.3459826, 2.23756, 1, 1, 1, 1, 1,
0.5928681, 0.2530861, -1.196719, 1, 1, 1, 1, 1,
0.5930893, -1.653214, 2.045204, 1, 1, 1, 1, 1,
0.5968273, -1.016905, 3.611486, 1, 1, 1, 1, 1,
0.5969074, -0.04447701, 2.112031, 1, 1, 1, 1, 1,
0.5981252, -0.3780537, 1.355877, 1, 1, 1, 1, 1,
0.6022349, -0.4817142, 1.929592, 1, 1, 1, 1, 1,
0.6085562, -0.5830734, 4.515367, 0, 0, 1, 1, 1,
0.6148375, 1.777306, 1.089507, 1, 0, 0, 1, 1,
0.6174121, -0.2788267, 2.048546, 1, 0, 0, 1, 1,
0.6214188, -0.6875722, 2.505894, 1, 0, 0, 1, 1,
0.6214321, 1.263219, 1.02137, 1, 0, 0, 1, 1,
0.623919, -2.35186, 4.057545, 1, 0, 0, 1, 1,
0.6284429, -0.5551155, 2.678697, 0, 0, 0, 1, 1,
0.6285235, -1.525473, 2.049694, 0, 0, 0, 1, 1,
0.629657, 0.06744834, 0.4524601, 0, 0, 0, 1, 1,
0.638392, 0.1013007, 0.5513062, 0, 0, 0, 1, 1,
0.6387601, -1.462625, 3.349169, 0, 0, 0, 1, 1,
0.6401029, -0.2676347, 1.470901, 0, 0, 0, 1, 1,
0.6448614, 0.3549149, -0.5117306, 0, 0, 0, 1, 1,
0.6455373, 0.4447183, -0.617626, 1, 1, 1, 1, 1,
0.6504749, 1.593706, -0.4250093, 1, 1, 1, 1, 1,
0.651169, 1.957032, -0.0409421, 1, 1, 1, 1, 1,
0.6524715, 0.6651025, -0.25486, 1, 1, 1, 1, 1,
0.6535257, -1.927641, 2.560323, 1, 1, 1, 1, 1,
0.6554072, 0.9539523, -0.4387796, 1, 1, 1, 1, 1,
0.6564586, -0.05940147, 2.015295, 1, 1, 1, 1, 1,
0.6583204, 0.9364417, 0.1035099, 1, 1, 1, 1, 1,
0.6618779, 1.43456, 0.2849058, 1, 1, 1, 1, 1,
0.663485, 0.496616, -0.7871833, 1, 1, 1, 1, 1,
0.6637886, -0.8234465, 3.26393, 1, 1, 1, 1, 1,
0.6637979, 0.2237607, 1.778725, 1, 1, 1, 1, 1,
0.6643887, 0.5825772, -0.2607322, 1, 1, 1, 1, 1,
0.6647511, -0.6594436, 1.318536, 1, 1, 1, 1, 1,
0.6652198, -0.05286703, 0.9112664, 1, 1, 1, 1, 1,
0.6678697, -0.08443965, 0.9719442, 0, 0, 1, 1, 1,
0.6724953, 0.8202712, -0.1340937, 1, 0, 0, 1, 1,
0.6781999, -0.2517063, 0.9790508, 1, 0, 0, 1, 1,
0.6784981, -1.251307, 2.504709, 1, 0, 0, 1, 1,
0.6787054, -1.57982, 2.941403, 1, 0, 0, 1, 1,
0.6855804, -1.542784, 3.427545, 1, 0, 0, 1, 1,
0.6879622, -0.574905, 3.551771, 0, 0, 0, 1, 1,
0.689112, 0.0262841, 1.505032, 0, 0, 0, 1, 1,
0.6901039, -0.7572725, 2.263088, 0, 0, 0, 1, 1,
0.6918389, 0.08181036, -0.2015726, 0, 0, 0, 1, 1,
0.6924438, 2.634241, 0.5731916, 0, 0, 0, 1, 1,
0.6970268, -1.586182, 2.819242, 0, 0, 0, 1, 1,
0.6976633, -0.6873197, 2.566459, 0, 0, 0, 1, 1,
0.7009671, -0.1798505, 1.060929, 1, 1, 1, 1, 1,
0.7009932, 1.203006, -0.506367, 1, 1, 1, 1, 1,
0.7020022, 2.108966, 0.688318, 1, 1, 1, 1, 1,
0.7148122, -0.4407056, 2.38536, 1, 1, 1, 1, 1,
0.7157507, 0.2144028, 1.698773, 1, 1, 1, 1, 1,
0.7182187, 1.336105, -0.4009247, 1, 1, 1, 1, 1,
0.7186192, 0.2113396, 1.969983, 1, 1, 1, 1, 1,
0.7368951, -0.5995484, 2.275239, 1, 1, 1, 1, 1,
0.7441882, 1.079024, -0.9987067, 1, 1, 1, 1, 1,
0.7456647, 0.4709427, 1.574384, 1, 1, 1, 1, 1,
0.74664, -0.04424892, 0.9590828, 1, 1, 1, 1, 1,
0.753634, -0.3615336, 1.399555, 1, 1, 1, 1, 1,
0.7561983, -1.105471, 0.5571138, 1, 1, 1, 1, 1,
0.7592696, 1.833946, -0.455486, 1, 1, 1, 1, 1,
0.7602735, -1.531934, 2.326126, 1, 1, 1, 1, 1,
0.7615296, 0.2349098, 2.017706, 0, 0, 1, 1, 1,
0.7623632, -0.08631408, 1.549828, 1, 0, 0, 1, 1,
0.7714927, 0.1707451, 1.002142, 1, 0, 0, 1, 1,
0.7746919, 0.2743005, 0.3520726, 1, 0, 0, 1, 1,
0.7747412, -0.1666003, 2.62515, 1, 0, 0, 1, 1,
0.7765031, -0.2288804, 3.210254, 1, 0, 0, 1, 1,
0.7795561, 0.1539034, 2.191088, 0, 0, 0, 1, 1,
0.779666, -0.1785128, 0.411423, 0, 0, 0, 1, 1,
0.7877333, -1.125108, 5.762227, 0, 0, 0, 1, 1,
0.7943461, 0.2875575, 0.2893029, 0, 0, 0, 1, 1,
0.7953618, 0.4600727, 1.165615, 0, 0, 0, 1, 1,
0.795703, -1.084959, 1.723097, 0, 0, 0, 1, 1,
0.7979958, 2.467702, 1.177566, 0, 0, 0, 1, 1,
0.8040707, -1.615541, 2.125192, 1, 1, 1, 1, 1,
0.8084617, -0.09651786, 2.964432, 1, 1, 1, 1, 1,
0.8154684, 1.862755, -1.023294, 1, 1, 1, 1, 1,
0.8190894, -0.5637944, 3.262461, 1, 1, 1, 1, 1,
0.8209175, -0.6163232, 2.987221, 1, 1, 1, 1, 1,
0.828455, -0.7438403, 1.643816, 1, 1, 1, 1, 1,
0.8301817, 1.617979, 0.7611498, 1, 1, 1, 1, 1,
0.8389749, 0.09976147, 1.871985, 1, 1, 1, 1, 1,
0.8541395, -1.019464, 3.759991, 1, 1, 1, 1, 1,
0.8628077, 0.5529881, 0.6883587, 1, 1, 1, 1, 1,
0.8676974, 0.9241366, 0.8129349, 1, 1, 1, 1, 1,
0.8688068, 0.2495527, 1.638938, 1, 1, 1, 1, 1,
0.8823363, -0.7430717, 1.570478, 1, 1, 1, 1, 1,
0.8860735, 0.09962624, 2.503475, 1, 1, 1, 1, 1,
0.8894935, 1.041008, 1.705929, 1, 1, 1, 1, 1,
0.8917817, -0.5311688, 2.211411, 0, 0, 1, 1, 1,
0.8924076, 0.6046345, -1.363711, 1, 0, 0, 1, 1,
0.9009448, -0.43698, 0.4912311, 1, 0, 0, 1, 1,
0.9012101, 1.903119, 0.3611914, 1, 0, 0, 1, 1,
0.9034092, 1.35254, 0.02593945, 1, 0, 0, 1, 1,
0.9091819, 0.5780023, 0.6865876, 1, 0, 0, 1, 1,
0.917325, 0.4810073, 1.924212, 0, 0, 0, 1, 1,
0.9234384, 0.2961324, 0.6437774, 0, 0, 0, 1, 1,
0.9246648, -1.078295, 2.451982, 0, 0, 0, 1, 1,
0.9284458, -2.078616, 1.296108, 0, 0, 0, 1, 1,
0.9324528, 1.919225, -0.8899319, 0, 0, 0, 1, 1,
0.9362382, 0.6546869, 0.9623151, 0, 0, 0, 1, 1,
0.9409152, 0.7984889, -1.373989, 0, 0, 0, 1, 1,
0.9414302, -0.1735395, 2.244121, 1, 1, 1, 1, 1,
0.9473385, -0.9132897, 3.23485, 1, 1, 1, 1, 1,
0.9512835, 1.053743, -0.2324807, 1, 1, 1, 1, 1,
0.9531142, -0.9853085, 3.397024, 1, 1, 1, 1, 1,
0.9584684, 0.7948738, 1.590981, 1, 1, 1, 1, 1,
0.9639856, 0.6596809, 1.279029, 1, 1, 1, 1, 1,
0.9669093, 1.371025, 1.514848, 1, 1, 1, 1, 1,
0.9771391, 0.69052, 1.643827, 1, 1, 1, 1, 1,
0.9779533, 0.3052768, 2.445835, 1, 1, 1, 1, 1,
0.9788286, 1.150661, 0.7718416, 1, 1, 1, 1, 1,
0.9812722, -0.9697021, 3.441217, 1, 1, 1, 1, 1,
0.9851298, -0.9700798, 2.265476, 1, 1, 1, 1, 1,
0.988467, -0.7633283, 3.798054, 1, 1, 1, 1, 1,
0.9929736, -1.219569, 2.625358, 1, 1, 1, 1, 1,
0.9968919, 0.2748607, 1.778554, 1, 1, 1, 1, 1,
1.005947, 1.714171, 2.23256, 0, 0, 1, 1, 1,
1.008763, -1.781504, 3.118638, 1, 0, 0, 1, 1,
1.014082, -2.378739, 1.818015, 1, 0, 0, 1, 1,
1.014878, 0.9204481, 1.932065, 1, 0, 0, 1, 1,
1.01605, 1.398295, 1.877509, 1, 0, 0, 1, 1,
1.016858, 0.8672464, 0.2220834, 1, 0, 0, 1, 1,
1.02035, 1.158211, -0.4356345, 0, 0, 0, 1, 1,
1.024596, -0.554468, 1.791507, 0, 0, 0, 1, 1,
1.028378, 1.897175, 0.2574227, 0, 0, 0, 1, 1,
1.03066, 1.323396, 0.3099411, 0, 0, 0, 1, 1,
1.031021, -0.7622838, 2.260351, 0, 0, 0, 1, 1,
1.033678, 0.5190649, 0.9099252, 0, 0, 0, 1, 1,
1.035283, 0.3857557, 2.078823, 0, 0, 0, 1, 1,
1.038952, -0.002365303, -0.003439467, 1, 1, 1, 1, 1,
1.043311, 1.585831, 0.7575184, 1, 1, 1, 1, 1,
1.045756, -0.4957078, 1.427812, 1, 1, 1, 1, 1,
1.047527, 0.2266351, 2.533038, 1, 1, 1, 1, 1,
1.054549, -0.3374427, 2.542032, 1, 1, 1, 1, 1,
1.058484, -1.048712, 2.519229, 1, 1, 1, 1, 1,
1.059108, -0.6766083, 2.224312, 1, 1, 1, 1, 1,
1.067033, 0.8328268, 2.178886, 1, 1, 1, 1, 1,
1.070711, -0.5294604, 1.618205, 1, 1, 1, 1, 1,
1.082652, -0.8430252, 2.050088, 1, 1, 1, 1, 1,
1.083308, 0.08651705, -0.06906135, 1, 1, 1, 1, 1,
1.084595, -1.616243, 2.37321, 1, 1, 1, 1, 1,
1.087715, -0.3418772, 1.90571, 1, 1, 1, 1, 1,
1.09029, 0.4352532, 0.2823715, 1, 1, 1, 1, 1,
1.092083, -0.1924557, 1.605981, 1, 1, 1, 1, 1,
1.093524, -0.2395015, 1.755036, 0, 0, 1, 1, 1,
1.097801, -0.5355618, 2.531476, 1, 0, 0, 1, 1,
1.104946, 0.7607209, 1.270549, 1, 0, 0, 1, 1,
1.105896, 0.9200259, 2.051337, 1, 0, 0, 1, 1,
1.107993, 0.8370506, 0.9976366, 1, 0, 0, 1, 1,
1.108665, -1.208873, 2.940721, 1, 0, 0, 1, 1,
1.111427, 1.007987, 1.343433, 0, 0, 0, 1, 1,
1.11364, -0.9585441, 1.189717, 0, 0, 0, 1, 1,
1.114561, -0.1182986, 1.710478, 0, 0, 0, 1, 1,
1.13192, -0.1038229, 0.7766504, 0, 0, 0, 1, 1,
1.134605, 0.5614319, 1.470065, 0, 0, 0, 1, 1,
1.139971, 0.1095045, -0.1996414, 0, 0, 0, 1, 1,
1.141697, 1.236119, 1.077589, 0, 0, 0, 1, 1,
1.145863, 0.8216956, -0.5193651, 1, 1, 1, 1, 1,
1.159739, 0.6446076, 0.5451273, 1, 1, 1, 1, 1,
1.162322, 0.6550742, 1.683211, 1, 1, 1, 1, 1,
1.175891, 0.4364868, 1.275375, 1, 1, 1, 1, 1,
1.182986, -0.4847592, 0.2068147, 1, 1, 1, 1, 1,
1.187923, -2.446637, 1.357052, 1, 1, 1, 1, 1,
1.194057, 0.1000992, 0.7595396, 1, 1, 1, 1, 1,
1.19804, 0.04756467, 3.118172, 1, 1, 1, 1, 1,
1.198552, 2.067777, 0.6423529, 1, 1, 1, 1, 1,
1.199464, -0.8763602, 1.440268, 1, 1, 1, 1, 1,
1.202215, 0.07033502, 1.393646, 1, 1, 1, 1, 1,
1.206499, -0.1588725, 2.548264, 1, 1, 1, 1, 1,
1.216858, -0.0241233, 1.404876, 1, 1, 1, 1, 1,
1.218521, 0.6053898, 3.698885, 1, 1, 1, 1, 1,
1.226673, 1.05197, 0.02784939, 1, 1, 1, 1, 1,
1.22795, 1.314139, 1.465879, 0, 0, 1, 1, 1,
1.229917, -1.579945, 2.838908, 1, 0, 0, 1, 1,
1.232195, 0.06066291, 3.160101, 1, 0, 0, 1, 1,
1.232767, 1.338696, 1.80779, 1, 0, 0, 1, 1,
1.235798, 1.148393, 1.000136, 1, 0, 0, 1, 1,
1.242032, -0.5944355, 2.540535, 1, 0, 0, 1, 1,
1.245703, 1.92375, -0.2581927, 0, 0, 0, 1, 1,
1.25017, -0.5453317, 2.946758, 0, 0, 0, 1, 1,
1.258801, -0.4056481, 2.815037, 0, 0, 0, 1, 1,
1.265842, -3.116786, 3.778767, 0, 0, 0, 1, 1,
1.287823, -0.6035913, 2.350296, 0, 0, 0, 1, 1,
1.291714, -1.008684, 2.460279, 0, 0, 0, 1, 1,
1.292361, -1.091863, 1.297252, 0, 0, 0, 1, 1,
1.29866, 0.3755116, 1.066242, 1, 1, 1, 1, 1,
1.299579, 0.2937501, -0.2498927, 1, 1, 1, 1, 1,
1.31869, -0.4695196, 0.6477512, 1, 1, 1, 1, 1,
1.324521, -0.1743229, 4.207043, 1, 1, 1, 1, 1,
1.332563, 1.140714, 0.3695801, 1, 1, 1, 1, 1,
1.33363, 0.06387112, 2.541446, 1, 1, 1, 1, 1,
1.342785, -1.275041, 1.520169, 1, 1, 1, 1, 1,
1.342827, -0.1226945, 1.184096, 1, 1, 1, 1, 1,
1.350831, 1.426211, 0.7480952, 1, 1, 1, 1, 1,
1.370497, 0.350037, 2.50929, 1, 1, 1, 1, 1,
1.372278, 0.6530933, -0.4954788, 1, 1, 1, 1, 1,
1.378711, -0.8911753, 2.190076, 1, 1, 1, 1, 1,
1.379692, 2.387976, -0.3585799, 1, 1, 1, 1, 1,
1.385621, 1.012401, 0.586251, 1, 1, 1, 1, 1,
1.39165, -0.3671917, 1.738179, 1, 1, 1, 1, 1,
1.398705, 0.1454245, -0.1153011, 0, 0, 1, 1, 1,
1.400043, -1.832111, 2.206855, 1, 0, 0, 1, 1,
1.400321, 0.5309656, 2.190422, 1, 0, 0, 1, 1,
1.400823, -2.481956, 3.663878, 1, 0, 0, 1, 1,
1.417149, -1.481556, 2.494392, 1, 0, 0, 1, 1,
1.422313, 0.4625407, 1.77993, 1, 0, 0, 1, 1,
1.424678, -0.7557637, 1.499917, 0, 0, 0, 1, 1,
1.425469, -1.574278, 2.270929, 0, 0, 0, 1, 1,
1.448392, 0.2095194, 1.659252, 0, 0, 0, 1, 1,
1.471386, -1.337034, 2.34303, 0, 0, 0, 1, 1,
1.474315, -0.1103355, 0.09837244, 0, 0, 0, 1, 1,
1.476227, -1.97113, 2.326811, 0, 0, 0, 1, 1,
1.479353, -1.040694, 0.6331788, 0, 0, 0, 1, 1,
1.481054, -0.2058545, 2.174268, 1, 1, 1, 1, 1,
1.502013, -0.3962184, 0.7065779, 1, 1, 1, 1, 1,
1.533113, 0.02530936, 2.99879, 1, 1, 1, 1, 1,
1.533813, 0.5159991, 1.541918, 1, 1, 1, 1, 1,
1.544495, 0.1926986, 1.413863, 1, 1, 1, 1, 1,
1.553323, 1.916519, 0.4388627, 1, 1, 1, 1, 1,
1.56428, -0.6953377, 2.308678, 1, 1, 1, 1, 1,
1.564619, 0.1919442, 2.578784, 1, 1, 1, 1, 1,
1.586855, -0.2060453, 2.152599, 1, 1, 1, 1, 1,
1.596716, -2.429232, 3.606948, 1, 1, 1, 1, 1,
1.601087, 1.706425, 0.4747631, 1, 1, 1, 1, 1,
1.606052, 0.6341168, 1.993791, 1, 1, 1, 1, 1,
1.616822, 1.126352, 3.144817, 1, 1, 1, 1, 1,
1.623947, -0.1521373, 1.484808, 1, 1, 1, 1, 1,
1.638963, 1.041316, 0.6749477, 1, 1, 1, 1, 1,
1.641564, 0.8149666, -0.6669048, 0, 0, 1, 1, 1,
1.642405, 0.07898895, -0.1620934, 1, 0, 0, 1, 1,
1.652487, -1.164839, 1.844109, 1, 0, 0, 1, 1,
1.665884, -0.813463, 0.2148913, 1, 0, 0, 1, 1,
1.690624, 1.067553, -0.2697365, 1, 0, 0, 1, 1,
1.711031, 1.987152, -1.599895, 1, 0, 0, 1, 1,
1.724805, 1.221884, 0.650265, 0, 0, 0, 1, 1,
1.726616, 0.2623187, 2.713505, 0, 0, 0, 1, 1,
1.736489, -1.110225, 3.65276, 0, 0, 0, 1, 1,
1.752243, 1.260566, 0.006586826, 0, 0, 0, 1, 1,
1.764288, -1.118774, 2.717354, 0, 0, 0, 1, 1,
1.777864, 2.024215, -0.8893681, 0, 0, 0, 1, 1,
1.783245, 0.272033, 0.736679, 0, 0, 0, 1, 1,
1.806132, 0.1886509, 1.287844, 1, 1, 1, 1, 1,
1.811374, -0.6267884, 2.237701, 1, 1, 1, 1, 1,
1.840969, 0.1691751, 1.754768, 1, 1, 1, 1, 1,
1.844151, 0.6485608, -0.004029092, 1, 1, 1, 1, 1,
1.852529, -0.9969218, 0.5238894, 1, 1, 1, 1, 1,
1.8548, -0.5475897, 2.631965, 1, 1, 1, 1, 1,
1.855127, -1.480254, 1.333366, 1, 1, 1, 1, 1,
1.867556, 0.03710423, 2.269548, 1, 1, 1, 1, 1,
1.948188, 0.02925849, 1.848637, 1, 1, 1, 1, 1,
1.980163, 0.3830164, 1.498459, 1, 1, 1, 1, 1,
1.987508, -0.6470374, 2.07025, 1, 1, 1, 1, 1,
1.997068, -0.8136423, -0.2038317, 1, 1, 1, 1, 1,
1.997182, 0.8079491, 0.5176476, 1, 1, 1, 1, 1,
2.016846, -0.3560579, 1.686859, 1, 1, 1, 1, 1,
2.018177, 0.03637863, 3.113444, 1, 1, 1, 1, 1,
2.050678, 1.332497, 0.5453941, 0, 0, 1, 1, 1,
2.066477, 0.30002, 3.9776, 1, 0, 0, 1, 1,
2.066964, -0.3982816, 1.76836, 1, 0, 0, 1, 1,
2.1575, -0.1850586, 1.354712, 1, 0, 0, 1, 1,
2.175344, -0.3226326, 0.9005895, 1, 0, 0, 1, 1,
2.187662, -0.7183423, 1.245861, 1, 0, 0, 1, 1,
2.231163, 0.4345812, -0.09440228, 0, 0, 0, 1, 1,
2.243357, -0.4976188, 1.77341, 0, 0, 0, 1, 1,
2.305936, 0.111167, 0.8638167, 0, 0, 0, 1, 1,
2.449998, -0.2619453, 2.409909, 0, 0, 0, 1, 1,
2.460585, -0.1268406, 0.2519865, 0, 0, 0, 1, 1,
2.475968, 2.170722, 0.9338456, 0, 0, 0, 1, 1,
2.513365, 0.8759658, -0.3101075, 0, 0, 0, 1, 1,
2.520549, -1.088365, 1.013764, 1, 1, 1, 1, 1,
2.521425, -0.9923849, 2.574858, 1, 1, 1, 1, 1,
2.698604, -0.05674683, 1.517475, 1, 1, 1, 1, 1,
2.816927, -0.397298, 2.573391, 1, 1, 1, 1, 1,
2.852969, 0.2104494, 1.073371, 1, 1, 1, 1, 1,
2.901695, 0.5107564, 1.233545, 1, 1, 1, 1, 1,
3.007494, -0.1811188, 0.9478909, 1, 1, 1, 1, 1
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
var radius = 9.78179;
var distance = 34.35812;
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
mvMatrix.translate( 0.145473, -0.2369432, -0.2143188 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.35812);
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
