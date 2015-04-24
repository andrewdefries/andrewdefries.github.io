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
-3.639169, -0.01720243, -1.726384, 1, 0, 0, 1,
-3.060531, 0.5403677, -1.306168, 1, 0.007843138, 0, 1,
-3.033378, 0.5745097, -0.9257869, 1, 0.01176471, 0, 1,
-2.894897, 0.3422419, -1.466791, 1, 0.01960784, 0, 1,
-2.639727, 0.330399, -3.655771, 1, 0.02352941, 0, 1,
-2.518137, 0.5844829, 0.2108135, 1, 0.03137255, 0, 1,
-2.505415, -1.515053, -1.221684, 1, 0.03529412, 0, 1,
-2.449515, 1.06011, -0.8489256, 1, 0.04313726, 0, 1,
-2.358495, -0.5968134, -2.079973, 1, 0.04705882, 0, 1,
-2.355749, -0.6334991, -0.6934545, 1, 0.05490196, 0, 1,
-2.319265, -1.83771, -1.588462, 1, 0.05882353, 0, 1,
-2.299444, 0.6712681, -1.981386, 1, 0.06666667, 0, 1,
-2.297367, -0.1022133, -1.627265, 1, 0.07058824, 0, 1,
-2.291378, 1.696403, -2.964884, 1, 0.07843138, 0, 1,
-2.250714, 1.626606, -0.5146681, 1, 0.08235294, 0, 1,
-2.193686, -0.1854378, -1.447718, 1, 0.09019608, 0, 1,
-2.173736, 1.054719, 0.3851087, 1, 0.09411765, 0, 1,
-2.171433, -1.375836, -1.637841, 1, 0.1019608, 0, 1,
-2.170753, 0.873708, -1.507425, 1, 0.1098039, 0, 1,
-2.137169, -0.9148277, 1.102269, 1, 0.1137255, 0, 1,
-2.096369, 0.5525447, 0.05581845, 1, 0.1215686, 0, 1,
-2.081887, -0.9132453, -0.6726671, 1, 0.1254902, 0, 1,
-2.062932, 0.4234925, -0.9215631, 1, 0.1333333, 0, 1,
-2.052162, 0.5493594, -2.686451, 1, 0.1372549, 0, 1,
-2.026833, 1.529218, -0.303899, 1, 0.145098, 0, 1,
-2.007692, 0.7380812, -0.7598469, 1, 0.1490196, 0, 1,
-1.987621, -1.335801, -3.041271, 1, 0.1568628, 0, 1,
-1.965845, -0.5206946, -1.707725, 1, 0.1607843, 0, 1,
-1.934595, -0.3425019, -1.06734, 1, 0.1686275, 0, 1,
-1.921241, -0.3558715, -0.8896383, 1, 0.172549, 0, 1,
-1.904042, 0.370465, -1.362802, 1, 0.1803922, 0, 1,
-1.903738, 0.1161987, -1.00968, 1, 0.1843137, 0, 1,
-1.900626, 2.086415, 2.28918, 1, 0.1921569, 0, 1,
-1.899485, -0.8616815, -1.577835, 1, 0.1960784, 0, 1,
-1.869131, -0.4313033, -4.046287, 1, 0.2039216, 0, 1,
-1.868816, 0.3265644, -0.3581494, 1, 0.2117647, 0, 1,
-1.854758, -0.7995628, -1.638027, 1, 0.2156863, 0, 1,
-1.851323, -0.6445521, -1.357564, 1, 0.2235294, 0, 1,
-1.838282, 1.50746, -1.17353, 1, 0.227451, 0, 1,
-1.81496, 1.550673, -1.889259, 1, 0.2352941, 0, 1,
-1.806122, 0.8143906, -1.499865, 1, 0.2392157, 0, 1,
-1.794185, 0.8964397, -1.692686, 1, 0.2470588, 0, 1,
-1.79019, 0.04303315, -1.633851, 1, 0.2509804, 0, 1,
-1.788801, 0.7363915, -1.990032, 1, 0.2588235, 0, 1,
-1.77714, -0.4091505, -0.6952244, 1, 0.2627451, 0, 1,
-1.774408, 0.1327854, -2.170897, 1, 0.2705882, 0, 1,
-1.753101, -0.6010684, -1.249694, 1, 0.2745098, 0, 1,
-1.750464, -1.53732, -1.216784, 1, 0.282353, 0, 1,
-1.746856, 0.4929785, -2.627322, 1, 0.2862745, 0, 1,
-1.745012, 0.3097929, -0.7579809, 1, 0.2941177, 0, 1,
-1.724978, 1.382821, -0.3272963, 1, 0.3019608, 0, 1,
-1.716645, -0.1697467, -1.121422, 1, 0.3058824, 0, 1,
-1.7085, -1.213588, -2.538005, 1, 0.3137255, 0, 1,
-1.704857, 0.5158696, -2.034915, 1, 0.3176471, 0, 1,
-1.698983, -0.987982, -1.795951, 1, 0.3254902, 0, 1,
-1.683291, -0.8195366, -1.059764, 1, 0.3294118, 0, 1,
-1.675179, -1.426013, -2.54557, 1, 0.3372549, 0, 1,
-1.668388, -0.7184078, -1.916398, 1, 0.3411765, 0, 1,
-1.663092, 0.8879042, -1.838693, 1, 0.3490196, 0, 1,
-1.658681, 0.7051936, -1.953026, 1, 0.3529412, 0, 1,
-1.636441, 1.002448, -1.166328, 1, 0.3607843, 0, 1,
-1.631978, 0.3834363, -2.830176, 1, 0.3647059, 0, 1,
-1.630045, 1.595159, -2.47045, 1, 0.372549, 0, 1,
-1.621988, -0.9211572, -3.48217, 1, 0.3764706, 0, 1,
-1.616637, -0.1619769, -2.412776, 1, 0.3843137, 0, 1,
-1.614665, -0.03569643, -1.177846, 1, 0.3882353, 0, 1,
-1.613927, -0.1179683, 0.27541, 1, 0.3960784, 0, 1,
-1.610137, -0.4721634, -2.55533, 1, 0.4039216, 0, 1,
-1.609938, -1.443892, -3.403663, 1, 0.4078431, 0, 1,
-1.606817, 1.089749, -1.912471, 1, 0.4156863, 0, 1,
-1.604862, 1.246732, 0.5949464, 1, 0.4196078, 0, 1,
-1.597287, -0.6932608, -1.167917, 1, 0.427451, 0, 1,
-1.585413, -0.2031367, -2.584161, 1, 0.4313726, 0, 1,
-1.57004, -0.2997666, -2.531766, 1, 0.4392157, 0, 1,
-1.547359, -0.9466525, -2.830137, 1, 0.4431373, 0, 1,
-1.539983, -0.939821, -1.679578, 1, 0.4509804, 0, 1,
-1.534387, -0.6392413, -4.52288, 1, 0.454902, 0, 1,
-1.529566, 0.006712064, -2.392488, 1, 0.4627451, 0, 1,
-1.5269, -0.1747913, -1.637551, 1, 0.4666667, 0, 1,
-1.519444, 0.3689264, -1.584712, 1, 0.4745098, 0, 1,
-1.495488, 0.6273052, -0.1651792, 1, 0.4784314, 0, 1,
-1.491088, 0.7666119, -0.9391522, 1, 0.4862745, 0, 1,
-1.483453, -0.7698739, -1.380237, 1, 0.4901961, 0, 1,
-1.46779, 0.7376526, 0.199145, 1, 0.4980392, 0, 1,
-1.460257, -1.07058, -3.158109, 1, 0.5058824, 0, 1,
-1.458951, -0.7238814, -1.994841, 1, 0.509804, 0, 1,
-1.453145, 0.7428277, -2.208791, 1, 0.5176471, 0, 1,
-1.452508, -0.7712855, -1.09606, 1, 0.5215687, 0, 1,
-1.448956, 0.3938835, 0.6776869, 1, 0.5294118, 0, 1,
-1.443338, -0.6165485, -1.936222, 1, 0.5333334, 0, 1,
-1.442536, -0.5683535, -2.643093, 1, 0.5411765, 0, 1,
-1.43736, 0.3277209, -1.701115, 1, 0.5450981, 0, 1,
-1.434135, -0.8246855, -2.252387, 1, 0.5529412, 0, 1,
-1.423482, 0.6401338, -2.749505, 1, 0.5568628, 0, 1,
-1.421228, -0.01827925, -0.04937065, 1, 0.5647059, 0, 1,
-1.405705, -0.08952331, -2.319693, 1, 0.5686275, 0, 1,
-1.399873, 0.9992854, -0.9628435, 1, 0.5764706, 0, 1,
-1.396683, 0.7319111, -0.6387593, 1, 0.5803922, 0, 1,
-1.390955, 0.9253677, -1.126807, 1, 0.5882353, 0, 1,
-1.378282, -1.791326, -2.872108, 1, 0.5921569, 0, 1,
-1.37794, 0.5234463, -1.815357, 1, 0.6, 0, 1,
-1.37306, 2.521522, -0.5122608, 1, 0.6078432, 0, 1,
-1.371018, 0.4500213, -1.143678, 1, 0.6117647, 0, 1,
-1.362998, 1.666031, -0.9766529, 1, 0.6196079, 0, 1,
-1.356231, -1.780648, -0.01776664, 1, 0.6235294, 0, 1,
-1.354541, -2.353802, -0.4157758, 1, 0.6313726, 0, 1,
-1.348794, -0.8578258, -3.00547, 1, 0.6352941, 0, 1,
-1.346559, -0.5451264, -1.578865, 1, 0.6431373, 0, 1,
-1.343897, -1.001506, -1.221368, 1, 0.6470588, 0, 1,
-1.341686, 0.4987268, 0.0163677, 1, 0.654902, 0, 1,
-1.337805, -1.155832, -3.962307, 1, 0.6588235, 0, 1,
-1.332694, -1.085553, -1.333642, 1, 0.6666667, 0, 1,
-1.329508, -0.6711659, -3.295712, 1, 0.6705883, 0, 1,
-1.322593, -1.213315, -1.891123, 1, 0.6784314, 0, 1,
-1.32153, 0.3934827, -1.150067, 1, 0.682353, 0, 1,
-1.318237, 0.2197323, -0.6767306, 1, 0.6901961, 0, 1,
-1.301791, -0.3113323, -1.972166, 1, 0.6941177, 0, 1,
-1.292945, -0.33053, -1.338956, 1, 0.7019608, 0, 1,
-1.29103, -0.5611278, -0.694017, 1, 0.7098039, 0, 1,
-1.279595, -0.2694572, -3.23439, 1, 0.7137255, 0, 1,
-1.27024, 1.627516, -0.03651986, 1, 0.7215686, 0, 1,
-1.266805, -1.152312, -3.006068, 1, 0.7254902, 0, 1,
-1.252124, 0.8080801, -0.5796063, 1, 0.7333333, 0, 1,
-1.247599, -1.205312, -2.75231, 1, 0.7372549, 0, 1,
-1.243029, -0.5940737, -1.737815, 1, 0.7450981, 0, 1,
-1.241646, 1.695506, -0.6899616, 1, 0.7490196, 0, 1,
-1.237662, 0.224036, -1.757404, 1, 0.7568628, 0, 1,
-1.233066, 1.046325, -1.281277, 1, 0.7607843, 0, 1,
-1.229476, -0.3786362, -1.126718, 1, 0.7686275, 0, 1,
-1.223765, -1.278753, -3.367027, 1, 0.772549, 0, 1,
-1.204872, 1.88564, 0.2278278, 1, 0.7803922, 0, 1,
-1.203897, 0.5299853, -0.7889122, 1, 0.7843137, 0, 1,
-1.198254, 0.5502964, -0.6140993, 1, 0.7921569, 0, 1,
-1.196374, 0.8522668, -0.8940793, 1, 0.7960784, 0, 1,
-1.195855, -1.572095, -1.423433, 1, 0.8039216, 0, 1,
-1.190087, -0.3335853, -0.7993727, 1, 0.8117647, 0, 1,
-1.189284, 1.507977, 0.5862418, 1, 0.8156863, 0, 1,
-1.182992, -2.122284, -2.941267, 1, 0.8235294, 0, 1,
-1.174631, 0.2784328, 0.2911244, 1, 0.827451, 0, 1,
-1.165922, 0.4019677, -2.542676, 1, 0.8352941, 0, 1,
-1.163472, 0.1921609, -1.247511, 1, 0.8392157, 0, 1,
-1.147112, 1.069449, -0.3485666, 1, 0.8470588, 0, 1,
-1.138807, -0.5452489, -2.708015, 1, 0.8509804, 0, 1,
-1.127481, -1.837264, -3.987463, 1, 0.8588235, 0, 1,
-1.123964, 2.00314, -0.9568358, 1, 0.8627451, 0, 1,
-1.123582, -1.275329, -1.900192, 1, 0.8705882, 0, 1,
-1.122832, 0.8247727, -1.384919, 1, 0.8745098, 0, 1,
-1.114721, -0.05659818, -1.300558, 1, 0.8823529, 0, 1,
-1.109479, -0.3259278, -2.993578, 1, 0.8862745, 0, 1,
-1.104108, 0.7271559, 0.7039744, 1, 0.8941177, 0, 1,
-1.101601, 1.300598, -2.20156, 1, 0.8980392, 0, 1,
-1.097758, 0.9020215, -3.142538, 1, 0.9058824, 0, 1,
-1.093487, 0.05831452, -0.2544206, 1, 0.9137255, 0, 1,
-1.089828, 0.3684335, -0.98136, 1, 0.9176471, 0, 1,
-1.086065, 0.2800618, -0.3751074, 1, 0.9254902, 0, 1,
-1.085247, 0.59443, -1.095966, 1, 0.9294118, 0, 1,
-1.084719, -0.8382179, -1.159241, 1, 0.9372549, 0, 1,
-1.082115, 0.7377753, -0.9550137, 1, 0.9411765, 0, 1,
-1.08185, -1.156218, -2.41337, 1, 0.9490196, 0, 1,
-1.080925, 1.070984, -0.9134961, 1, 0.9529412, 0, 1,
-1.080907, 2.249771, 0.5926482, 1, 0.9607843, 0, 1,
-1.074006, 0.7457972, 0.5347129, 1, 0.9647059, 0, 1,
-1.07093, 0.0655916, -0.9491751, 1, 0.972549, 0, 1,
-1.069931, 0.6777392, 0.7191392, 1, 0.9764706, 0, 1,
-1.069833, 0.4526961, -1.56518, 1, 0.9843137, 0, 1,
-1.066489, 1.274, 0.4335541, 1, 0.9882353, 0, 1,
-1.065023, -1.88017, -3.069126, 1, 0.9960784, 0, 1,
-1.063432, 0.04555216, -0.2084878, 0.9960784, 1, 0, 1,
-1.061024, -1.695485, -1.723721, 0.9921569, 1, 0, 1,
-1.060593, -0.7452399, -1.308286, 0.9843137, 1, 0, 1,
-1.053555, 0.8538043, -1.012151, 0.9803922, 1, 0, 1,
-1.047454, 0.1644059, -1.972355, 0.972549, 1, 0, 1,
-1.045451, 0.3547241, -1.091634, 0.9686275, 1, 0, 1,
-1.04502, 1.358769, -2.740971, 0.9607843, 1, 0, 1,
-1.034843, 0.3529192, -1.457281, 0.9568627, 1, 0, 1,
-1.027342, 0.5458193, 0.1243493, 0.9490196, 1, 0, 1,
-1.020345, 0.183691, -1.721723, 0.945098, 1, 0, 1,
-1.018998, -0.0752397, -2.125171, 0.9372549, 1, 0, 1,
-1.006759, -0.3049119, -1.042371, 0.9333333, 1, 0, 1,
-1.005142, 1.01854, -2.002734, 0.9254902, 1, 0, 1,
-1.002393, 1.594146, -2.578534, 0.9215686, 1, 0, 1,
-1.001198, -1.90937, -3.2186, 0.9137255, 1, 0, 1,
-1.000034, 0.1500811, -1.34472, 0.9098039, 1, 0, 1,
-0.9994059, -1.618069, -4.214753, 0.9019608, 1, 0, 1,
-0.995155, -0.03854172, -1.935244, 0.8941177, 1, 0, 1,
-0.9925146, 0.9047609, -0.5533833, 0.8901961, 1, 0, 1,
-0.9903157, 0.4218599, -1.025849, 0.8823529, 1, 0, 1,
-0.9894958, -0.009475243, -2.033032, 0.8784314, 1, 0, 1,
-0.9863751, -1.179588, -3.542858, 0.8705882, 1, 0, 1,
-0.9760004, 0.358731, 0.2777124, 0.8666667, 1, 0, 1,
-0.9637844, -1.073899, -4.041992, 0.8588235, 1, 0, 1,
-0.9519452, -1.12459, -4.511633, 0.854902, 1, 0, 1,
-0.9472875, 0.4222172, -1.31105, 0.8470588, 1, 0, 1,
-0.9449083, -0.7707902, -2.139544, 0.8431373, 1, 0, 1,
-0.941834, -2.108895, -1.45445, 0.8352941, 1, 0, 1,
-0.9398544, 0.630609, -0.7251682, 0.8313726, 1, 0, 1,
-0.9385202, 0.7372594, 1.647051, 0.8235294, 1, 0, 1,
-0.9381715, 0.06415621, 0.1264852, 0.8196079, 1, 0, 1,
-0.9293442, -0.3119221, -2.270742, 0.8117647, 1, 0, 1,
-0.9286239, -0.04648531, -2.760463, 0.8078431, 1, 0, 1,
-0.9282078, -0.5761188, -0.8873137, 0.8, 1, 0, 1,
-0.9273586, 0.4552158, -0.2158976, 0.7921569, 1, 0, 1,
-0.9239917, 0.8072039, -1.657038, 0.7882353, 1, 0, 1,
-0.9188083, 0.8053962, -0.1555477, 0.7803922, 1, 0, 1,
-0.9169859, -0.2572072, -1.945529, 0.7764706, 1, 0, 1,
-0.9114423, -0.844742, -2.619576, 0.7686275, 1, 0, 1,
-0.9096439, 0.7713515, -1.317609, 0.7647059, 1, 0, 1,
-0.9092287, 0.4006985, -1.397945, 0.7568628, 1, 0, 1,
-0.9041724, 0.4023719, -2.019699, 0.7529412, 1, 0, 1,
-0.8914822, 0.8461726, -0.5915653, 0.7450981, 1, 0, 1,
-0.8807753, -0.4937076, -2.230403, 0.7411765, 1, 0, 1,
-0.8799415, 1.121384, 0.334744, 0.7333333, 1, 0, 1,
-0.8744405, -0.4609718, -2.347822, 0.7294118, 1, 0, 1,
-0.8740484, 0.3765461, -2.929867, 0.7215686, 1, 0, 1,
-0.8701642, 1.146209, -1.834291, 0.7176471, 1, 0, 1,
-0.8683518, 0.2594738, -1.88362, 0.7098039, 1, 0, 1,
-0.861903, 0.1260281, -1.162646, 0.7058824, 1, 0, 1,
-0.8571066, 1.746033, -1.044055, 0.6980392, 1, 0, 1,
-0.8549673, 0.3005101, -1.526427, 0.6901961, 1, 0, 1,
-0.8547772, 0.4035287, -1.593415, 0.6862745, 1, 0, 1,
-0.8534892, -1.183784, -3.399615, 0.6784314, 1, 0, 1,
-0.8509465, 1.35717, 0.3258671, 0.6745098, 1, 0, 1,
-0.8376186, 1.547965, -0.5861581, 0.6666667, 1, 0, 1,
-0.8346633, -0.7807248, -2.522992, 0.6627451, 1, 0, 1,
-0.8316163, 0.1841996, -1.754988, 0.654902, 1, 0, 1,
-0.8183212, 0.2514449, -0.4481483, 0.6509804, 1, 0, 1,
-0.8152942, -1.473362, -3.766349, 0.6431373, 1, 0, 1,
-0.8118244, 0.9472704, -0.5672469, 0.6392157, 1, 0, 1,
-0.8074516, 0.01204828, -1.227451, 0.6313726, 1, 0, 1,
-0.7993417, -0.03578126, -0.976474, 0.627451, 1, 0, 1,
-0.7992783, 0.2097695, -0.8184234, 0.6196079, 1, 0, 1,
-0.7956888, 0.2528694, 0.2486768, 0.6156863, 1, 0, 1,
-0.7902865, 1.288296, -1.047855, 0.6078432, 1, 0, 1,
-0.7786998, -0.5937888, -3.220297, 0.6039216, 1, 0, 1,
-0.7773993, -0.4821579, -1.845947, 0.5960785, 1, 0, 1,
-0.7772759, 0.762933, 0.2389195, 0.5882353, 1, 0, 1,
-0.7755217, 1.368784, 0.5812579, 0.5843138, 1, 0, 1,
-0.7682021, -0.6910428, -1.489884, 0.5764706, 1, 0, 1,
-0.7614558, -0.3965228, -0.9193347, 0.572549, 1, 0, 1,
-0.7609424, 1.019899, 1.189295, 0.5647059, 1, 0, 1,
-0.7600201, -0.1456407, -3.137424, 0.5607843, 1, 0, 1,
-0.7576116, 1.078913, 1.231202, 0.5529412, 1, 0, 1,
-0.7513273, 0.9488699, -1.951239, 0.5490196, 1, 0, 1,
-0.7459542, -0.369198, -1.700125, 0.5411765, 1, 0, 1,
-0.7452239, 2.044694, -1.588813, 0.5372549, 1, 0, 1,
-0.7421175, 0.4890772, -0.7018754, 0.5294118, 1, 0, 1,
-0.7409796, -1.006683, -3.87708, 0.5254902, 1, 0, 1,
-0.7387605, 0.2528183, -0.3627108, 0.5176471, 1, 0, 1,
-0.7386891, -0.2685055, -1.960809, 0.5137255, 1, 0, 1,
-0.7366377, 0.870437, -3.705258, 0.5058824, 1, 0, 1,
-0.7306758, -0.1242896, -1.853925, 0.5019608, 1, 0, 1,
-0.7295981, 1.562393, 0.151672, 0.4941176, 1, 0, 1,
-0.7281789, -0.2067451, -1.212843, 0.4862745, 1, 0, 1,
-0.7256262, 0.6399555, -0.272424, 0.4823529, 1, 0, 1,
-0.72454, -0.2747358, -3.45712, 0.4745098, 1, 0, 1,
-0.7210769, 1.639252, 1.067621, 0.4705882, 1, 0, 1,
-0.7196609, -1.669748, -2.901545, 0.4627451, 1, 0, 1,
-0.7149939, -0.1260889, -1.581328, 0.4588235, 1, 0, 1,
-0.7145554, -0.4184856, -3.383836, 0.4509804, 1, 0, 1,
-0.7119246, 0.4773497, -0.7013485, 0.4470588, 1, 0, 1,
-0.7114299, -0.1379918, -2.146079, 0.4392157, 1, 0, 1,
-0.7046167, 0.5576841, -1.277975, 0.4352941, 1, 0, 1,
-0.7044767, 0.5234537, 0.5012548, 0.427451, 1, 0, 1,
-0.6980499, -0.6524771, -2.069805, 0.4235294, 1, 0, 1,
-0.6959001, -0.284338, -2.133198, 0.4156863, 1, 0, 1,
-0.6944119, 0.1731041, -0.2726542, 0.4117647, 1, 0, 1,
-0.6931724, -1.211949, -3.677491, 0.4039216, 1, 0, 1,
-0.6872246, 0.7398826, -0.5748382, 0.3960784, 1, 0, 1,
-0.6825571, -0.02867004, -1.037906, 0.3921569, 1, 0, 1,
-0.680407, 0.07173276, -1.269722, 0.3843137, 1, 0, 1,
-0.6709073, 0.3374104, -0.5325129, 0.3803922, 1, 0, 1,
-0.6634157, 0.05566007, -0.161219, 0.372549, 1, 0, 1,
-0.6618, 0.1428398, -1.422146, 0.3686275, 1, 0, 1,
-0.6610346, -0.3920085, -1.988428, 0.3607843, 1, 0, 1,
-0.6580465, 0.05031417, -1.038362, 0.3568628, 1, 0, 1,
-0.6563251, -0.7496598, -2.454112, 0.3490196, 1, 0, 1,
-0.6522201, 1.500633, -0.6188387, 0.345098, 1, 0, 1,
-0.6516682, 0.6707301, -0.7964463, 0.3372549, 1, 0, 1,
-0.6514755, 0.1393793, -1.396456, 0.3333333, 1, 0, 1,
-0.6461061, 0.5296646, -0.9301812, 0.3254902, 1, 0, 1,
-0.6446356, -0.5318356, 0.3071846, 0.3215686, 1, 0, 1,
-0.6416986, 1.196026, 0.6492047, 0.3137255, 1, 0, 1,
-0.6300293, 0.6239265, -1.788617, 0.3098039, 1, 0, 1,
-0.6282081, -0.2722554, -0.809885, 0.3019608, 1, 0, 1,
-0.6245005, -0.9900462, -2.624145, 0.2941177, 1, 0, 1,
-0.6226255, -1.805313, -1.159553, 0.2901961, 1, 0, 1,
-0.6226084, 0.9783067, -2.652838, 0.282353, 1, 0, 1,
-0.6206344, -0.3317405, -3.826743, 0.2784314, 1, 0, 1,
-0.6156335, -0.3262596, -1.623505, 0.2705882, 1, 0, 1,
-0.6136907, -0.8488806, -2.819179, 0.2666667, 1, 0, 1,
-0.6083803, -0.202622, -3.490844, 0.2588235, 1, 0, 1,
-0.605703, -0.1966698, -1.999184, 0.254902, 1, 0, 1,
-0.5988926, 0.6390343, -1.278204, 0.2470588, 1, 0, 1,
-0.5939419, 1.303429, -0.6566464, 0.2431373, 1, 0, 1,
-0.5845367, 1.410323, 0.6898341, 0.2352941, 1, 0, 1,
-0.5832723, 1.122065, -0.4221783, 0.2313726, 1, 0, 1,
-0.5826881, 0.1084679, -1.972922, 0.2235294, 1, 0, 1,
-0.5790657, -0.1133433, -4.063051, 0.2196078, 1, 0, 1,
-0.5747893, 0.6883807, 0.7551422, 0.2117647, 1, 0, 1,
-0.5746157, 1.337266, 0.572589, 0.2078431, 1, 0, 1,
-0.5728431, 1.767261, -1.149557, 0.2, 1, 0, 1,
-0.5719474, 0.4591837, 0.5005784, 0.1921569, 1, 0, 1,
-0.5684222, -0.6114908, -3.024232, 0.1882353, 1, 0, 1,
-0.567283, 0.225389, -2.171354, 0.1803922, 1, 0, 1,
-0.5623822, 0.4783886, 0.02796254, 0.1764706, 1, 0, 1,
-0.5569423, 2.190021, -1.172256, 0.1686275, 1, 0, 1,
-0.5560124, -0.7975149, -2.54682, 0.1647059, 1, 0, 1,
-0.5555155, 0.4965625, -3.055021, 0.1568628, 1, 0, 1,
-0.5515797, 1.290529, -1.2933, 0.1529412, 1, 0, 1,
-0.5481395, 0.1061231, -1.948669, 0.145098, 1, 0, 1,
-0.5459626, -0.6123876, -3.411369, 0.1411765, 1, 0, 1,
-0.5448838, 1.150983, 2.119255, 0.1333333, 1, 0, 1,
-0.5442103, -1.395095, -2.653318, 0.1294118, 1, 0, 1,
-0.5433213, -0.2476985, -1.753851, 0.1215686, 1, 0, 1,
-0.5419264, -0.1368192, -1.355492, 0.1176471, 1, 0, 1,
-0.5412556, -0.4158183, -2.889264, 0.1098039, 1, 0, 1,
-0.5364896, 0.4455675, -0.6202465, 0.1058824, 1, 0, 1,
-0.5252644, 1.084945, -0.7332317, 0.09803922, 1, 0, 1,
-0.5230434, -0.3498113, -2.191199, 0.09019608, 1, 0, 1,
-0.5215854, 0.1369058, -0.5646356, 0.08627451, 1, 0, 1,
-0.5058811, -0.9160838, -3.317389, 0.07843138, 1, 0, 1,
-0.50583, 1.370113, -1.611638, 0.07450981, 1, 0, 1,
-0.5049182, 1.076712, -1.354241, 0.06666667, 1, 0, 1,
-0.5012552, -0.8306001, -2.221833, 0.0627451, 1, 0, 1,
-0.4984869, -1.650272, -2.261059, 0.05490196, 1, 0, 1,
-0.4970101, 0.1002941, -1.442263, 0.05098039, 1, 0, 1,
-0.4959698, 0.3945851, 1.572191, 0.04313726, 1, 0, 1,
-0.4949478, -0.7635568, -3.450071, 0.03921569, 1, 0, 1,
-0.4944065, -0.4554592, -1.552308, 0.03137255, 1, 0, 1,
-0.493708, 0.3569004, -1.892728, 0.02745098, 1, 0, 1,
-0.4916425, 0.3754556, -0.2307092, 0.01960784, 1, 0, 1,
-0.4912133, 0.01391081, -2.002884, 0.01568628, 1, 0, 1,
-0.4910553, -0.2516022, -1.559885, 0.007843138, 1, 0, 1,
-0.4910045, -0.108472, -1.847383, 0.003921569, 1, 0, 1,
-0.4899376, -0.5001626, -2.113543, 0, 1, 0.003921569, 1,
-0.4895704, -0.5622923, -1.338164, 0, 1, 0.01176471, 1,
-0.4861144, 0.630676, 0.3813822, 0, 1, 0.01568628, 1,
-0.4788195, 0.9161376, 0.5353736, 0, 1, 0.02352941, 1,
-0.4692262, 0.6569739, -0.5734684, 0, 1, 0.02745098, 1,
-0.4683795, 0.7977982, -1.267023, 0, 1, 0.03529412, 1,
-0.4682541, -1.259002, -4.82495, 0, 1, 0.03921569, 1,
-0.4625223, -1.33528, -2.848945, 0, 1, 0.04705882, 1,
-0.4615637, 1.482602, -1.788905, 0, 1, 0.05098039, 1,
-0.4601973, -0.6594586, -1.187648, 0, 1, 0.05882353, 1,
-0.4595957, 0.9434658, 0.0802466, 0, 1, 0.0627451, 1,
-0.4585266, 1.994598, -2.309348, 0, 1, 0.07058824, 1,
-0.4577093, -0.07055611, -1.392305, 0, 1, 0.07450981, 1,
-0.4564644, 0.611416, -0.7000946, 0, 1, 0.08235294, 1,
-0.4550717, 0.1897286, -1.844898, 0, 1, 0.08627451, 1,
-0.4548931, -0.2047915, -1.341365, 0, 1, 0.09411765, 1,
-0.4471171, 0.6226398, -1.000443, 0, 1, 0.1019608, 1,
-0.4439202, -0.7271785, -2.028062, 0, 1, 0.1058824, 1,
-0.4435564, -0.2074415, -3.160934, 0, 1, 0.1137255, 1,
-0.4408689, -1.099788, -4.228536, 0, 1, 0.1176471, 1,
-0.4366011, -0.1609804, -1.44238, 0, 1, 0.1254902, 1,
-0.4350972, 1.218122, -0.9555584, 0, 1, 0.1294118, 1,
-0.4349588, 1.418968, -0.2080074, 0, 1, 0.1372549, 1,
-0.4348642, 0.2681071, -1.772157, 0, 1, 0.1411765, 1,
-0.428835, -0.1933262, -3.434598, 0, 1, 0.1490196, 1,
-0.4274465, -1.632337, -3.033244, 0, 1, 0.1529412, 1,
-0.4263063, -0.09691813, 0.1462812, 0, 1, 0.1607843, 1,
-0.4193377, -0.5386136, -1.238613, 0, 1, 0.1647059, 1,
-0.4180437, 0.6314204, -0.4869063, 0, 1, 0.172549, 1,
-0.4151478, -0.880284, -3.254938, 0, 1, 0.1764706, 1,
-0.4139351, 1.818167, 0.4134635, 0, 1, 0.1843137, 1,
-0.4134049, -1.656864, -1.138861, 0, 1, 0.1882353, 1,
-0.4107768, 0.9336807, -1.40461, 0, 1, 0.1960784, 1,
-0.4072741, 0.1445968, 0.001153125, 0, 1, 0.2039216, 1,
-0.4072722, 0.1015828, -0.6506432, 0, 1, 0.2078431, 1,
-0.4063754, -0.9135527, -3.366149, 0, 1, 0.2156863, 1,
-0.4039738, -1.825252, -3.45851, 0, 1, 0.2196078, 1,
-0.4007123, -1.714529, -2.394141, 0, 1, 0.227451, 1,
-0.3915517, 0.7813295, -0.7504553, 0, 1, 0.2313726, 1,
-0.3869928, 0.7295871, -0.5267065, 0, 1, 0.2392157, 1,
-0.384597, 0.3760138, -0.7755172, 0, 1, 0.2431373, 1,
-0.3840883, 1.918136, 0.607551, 0, 1, 0.2509804, 1,
-0.382305, -1.226643, -2.486686, 0, 1, 0.254902, 1,
-0.3781461, -1.818206, -3.091132, 0, 1, 0.2627451, 1,
-0.3701286, 0.4272331, 0.6358542, 0, 1, 0.2666667, 1,
-0.3687941, 0.279294, -0.0230434, 0, 1, 0.2745098, 1,
-0.3681176, 0.4669228, -1.5016, 0, 1, 0.2784314, 1,
-0.3653002, -1.437675, 0.01437643, 0, 1, 0.2862745, 1,
-0.3633337, 1.407589, -1.938059, 0, 1, 0.2901961, 1,
-0.3632896, -0.4685292, -2.371703, 0, 1, 0.2980392, 1,
-0.3630708, -1.847045, -2.002512, 0, 1, 0.3058824, 1,
-0.3627003, 0.4131029, -0.6469695, 0, 1, 0.3098039, 1,
-0.362468, -1.012371, -3.136513, 0, 1, 0.3176471, 1,
-0.3538076, -1.159216, -2.533493, 0, 1, 0.3215686, 1,
-0.3514717, -0.01847812, -1.214988, 0, 1, 0.3294118, 1,
-0.3512255, 0.7902205, -0.09198876, 0, 1, 0.3333333, 1,
-0.3442391, -0.8790041, -2.653566, 0, 1, 0.3411765, 1,
-0.343593, -0.5516826, -1.021995, 0, 1, 0.345098, 1,
-0.3362522, 1.430827, -0.5631715, 0, 1, 0.3529412, 1,
-0.3336644, 0.1875357, -1.869986, 0, 1, 0.3568628, 1,
-0.3334489, 0.5624186, -0.5011778, 0, 1, 0.3647059, 1,
-0.3318061, 2.397746, 0.04019972, 0, 1, 0.3686275, 1,
-0.3286442, -1.196799, -1.802544, 0, 1, 0.3764706, 1,
-0.3256065, -0.7857041, -2.334294, 0, 1, 0.3803922, 1,
-0.3235807, -0.620898, -2.587632, 0, 1, 0.3882353, 1,
-0.3228236, 0.563298, 0.7089318, 0, 1, 0.3921569, 1,
-0.319609, 0.2810688, 0.6631014, 0, 1, 0.4, 1,
-0.3175117, -0.07009857, -1.096284, 0, 1, 0.4078431, 1,
-0.3147993, -0.5129526, -2.248662, 0, 1, 0.4117647, 1,
-0.3100159, 0.4763862, 0.2595837, 0, 1, 0.4196078, 1,
-0.3047018, -0.9518186, -4.357128, 0, 1, 0.4235294, 1,
-0.3020758, 1.344873, -0.006980554, 0, 1, 0.4313726, 1,
-0.3017903, 0.1502481, 0.2696667, 0, 1, 0.4352941, 1,
-0.2909859, -0.9341916, -1.306277, 0, 1, 0.4431373, 1,
-0.2894067, 0.6756384, 0.1807204, 0, 1, 0.4470588, 1,
-0.288885, 0.4171129, -0.6048919, 0, 1, 0.454902, 1,
-0.2879654, 0.8457438, -1.067309, 0, 1, 0.4588235, 1,
-0.2875998, 0.4569887, -1.182435, 0, 1, 0.4666667, 1,
-0.28526, -0.171121, -1.802472, 0, 1, 0.4705882, 1,
-0.2846875, -0.5843023, -3.303932, 0, 1, 0.4784314, 1,
-0.2823607, 1.074403, -0.3787096, 0, 1, 0.4823529, 1,
-0.2821653, 1.195572, 1.105486, 0, 1, 0.4901961, 1,
-0.2802133, 0.1288457, 0.5481088, 0, 1, 0.4941176, 1,
-0.2797827, 0.6147099, -0.3187459, 0, 1, 0.5019608, 1,
-0.2787678, 0.8077373, 1.89459, 0, 1, 0.509804, 1,
-0.2773453, -0.1247906, -3.60281, 0, 1, 0.5137255, 1,
-0.2772215, 0.4902099, -0.3357452, 0, 1, 0.5215687, 1,
-0.2732514, 0.5535622, -0.3858741, 0, 1, 0.5254902, 1,
-0.270791, 0.5847855, 0.8689472, 0, 1, 0.5333334, 1,
-0.2706213, 1.535597, 1.027715, 0, 1, 0.5372549, 1,
-0.2631806, -1.770658, -2.738026, 0, 1, 0.5450981, 1,
-0.2615874, -0.4347852, -3.190174, 0, 1, 0.5490196, 1,
-0.2603691, 0.630321, 0.6672352, 0, 1, 0.5568628, 1,
-0.2578911, -1.487115, -3.052294, 0, 1, 0.5607843, 1,
-0.2483605, -0.2510048, -3.335682, 0, 1, 0.5686275, 1,
-0.2451262, 0.7322084, -1.453562, 0, 1, 0.572549, 1,
-0.2438791, -0.1527288, -0.6825781, 0, 1, 0.5803922, 1,
-0.2406766, 0.3362654, 0.02153678, 0, 1, 0.5843138, 1,
-0.2393213, -0.5471988, -2.362185, 0, 1, 0.5921569, 1,
-0.2391401, -0.9620953, -4.50422, 0, 1, 0.5960785, 1,
-0.2357498, 0.3556944, 1.156473, 0, 1, 0.6039216, 1,
-0.23528, -0.626474, -2.270579, 0, 1, 0.6117647, 1,
-0.2336841, 0.1661072, -1.149811, 0, 1, 0.6156863, 1,
-0.2322768, -1.967493, -4.512539, 0, 1, 0.6235294, 1,
-0.2307366, 0.8773738, -1.581242, 0, 1, 0.627451, 1,
-0.2295787, 0.9340808, 1.374727, 0, 1, 0.6352941, 1,
-0.2282066, -0.8146393, -1.256128, 0, 1, 0.6392157, 1,
-0.2258704, -0.6929072, -3.429202, 0, 1, 0.6470588, 1,
-0.2247493, -1.45731, -3.565189, 0, 1, 0.6509804, 1,
-0.2206852, 1.110489, 1.162986, 0, 1, 0.6588235, 1,
-0.2201722, -0.2336116, -2.485383, 0, 1, 0.6627451, 1,
-0.2194492, -0.4501416, -1.205091, 0, 1, 0.6705883, 1,
-0.2184462, 0.3501687, -0.6241585, 0, 1, 0.6745098, 1,
-0.2151594, 0.5702131, -0.1390115, 0, 1, 0.682353, 1,
-0.206567, 0.8074645, -1.487201, 0, 1, 0.6862745, 1,
-0.2034126, 1.0997, -1.158891, 0, 1, 0.6941177, 1,
-0.1938862, -0.7209479, -4.364198, 0, 1, 0.7019608, 1,
-0.1839926, 0.5640555, 0.09434178, 0, 1, 0.7058824, 1,
-0.1838006, 0.9257935, 0.5351102, 0, 1, 0.7137255, 1,
-0.175427, -0.8793492, -4.283628, 0, 1, 0.7176471, 1,
-0.1688163, -0.6616857, -2.553345, 0, 1, 0.7254902, 1,
-0.1684975, 0.3067169, -1.772406, 0, 1, 0.7294118, 1,
-0.167361, -0.6262829, -2.893595, 0, 1, 0.7372549, 1,
-0.1649295, -0.7042373, -3.518514, 0, 1, 0.7411765, 1,
-0.163676, -0.7637569, -3.649324, 0, 1, 0.7490196, 1,
-0.1633221, 1.098012, 0.7193727, 0, 1, 0.7529412, 1,
-0.1624184, -0.569153, -0.5862616, 0, 1, 0.7607843, 1,
-0.1615837, -1.747074, -3.017173, 0, 1, 0.7647059, 1,
-0.1609599, -0.5062951, -4.483181, 0, 1, 0.772549, 1,
-0.1608659, 1.057001, 0.4670189, 0, 1, 0.7764706, 1,
-0.1537061, -2.131697, -3.073622, 0, 1, 0.7843137, 1,
-0.1510005, -0.01548308, -1.961683, 0, 1, 0.7882353, 1,
-0.149391, 0.14367, -1.378801, 0, 1, 0.7960784, 1,
-0.1483159, -1.760554, -4.567503, 0, 1, 0.8039216, 1,
-0.1469041, -0.5624308, -3.42835, 0, 1, 0.8078431, 1,
-0.1458405, 1.039252, -0.6561261, 0, 1, 0.8156863, 1,
-0.1454503, -1.895528, -3.708853, 0, 1, 0.8196079, 1,
-0.1442014, 0.6726193, -0.7011955, 0, 1, 0.827451, 1,
-0.1356103, 1.159814, -0.7704121, 0, 1, 0.8313726, 1,
-0.1335329, -1.700148, -2.04366, 0, 1, 0.8392157, 1,
-0.1315851, 0.182034, 1.522665, 0, 1, 0.8431373, 1,
-0.1284082, -0.509323, -5.211101, 0, 1, 0.8509804, 1,
-0.1244342, -1.258073, -1.996458, 0, 1, 0.854902, 1,
-0.1240146, 0.2776675, -1.170314, 0, 1, 0.8627451, 1,
-0.122574, 0.189484, -0.6185756, 0, 1, 0.8666667, 1,
-0.1222462, -0.1286846, -0.4260757, 0, 1, 0.8745098, 1,
-0.1197946, -1.857226, -3.728265, 0, 1, 0.8784314, 1,
-0.1192428, -1.4614, -1.634804, 0, 1, 0.8862745, 1,
-0.1185063, -1.215851, -3.062518, 0, 1, 0.8901961, 1,
-0.1168836, 0.6954756, -1.375842, 0, 1, 0.8980392, 1,
-0.1163715, -0.0701877, -2.54605, 0, 1, 0.9058824, 1,
-0.1154453, -0.3244407, -2.418811, 0, 1, 0.9098039, 1,
-0.1139073, -1.077404, -1.813787, 0, 1, 0.9176471, 1,
-0.1112518, 0.1721839, 0.6303409, 0, 1, 0.9215686, 1,
-0.1051549, -1.878501, -4.007215, 0, 1, 0.9294118, 1,
-0.1029318, 1.271966, -0.02817438, 0, 1, 0.9333333, 1,
-0.09535278, -2.388656, -3.703939, 0, 1, 0.9411765, 1,
-0.09521957, -0.1648073, -2.095202, 0, 1, 0.945098, 1,
-0.09280737, -0.1057447, -2.090751, 0, 1, 0.9529412, 1,
-0.09250253, 0.4334202, -1.375798, 0, 1, 0.9568627, 1,
-0.08990002, 0.4705733, 1.331604, 0, 1, 0.9647059, 1,
-0.08982972, -0.08566196, -3.307329, 0, 1, 0.9686275, 1,
-0.08766239, 0.5934802, 0.8448544, 0, 1, 0.9764706, 1,
-0.08756889, -0.3911003, -3.369457, 0, 1, 0.9803922, 1,
-0.08636986, 0.4853607, -1.079076, 0, 1, 0.9882353, 1,
-0.0854372, -0.7201827, -4.134984, 0, 1, 0.9921569, 1,
-0.08498906, 0.7854335, 1.135192, 0, 1, 1, 1,
-0.07957207, 0.8073512, -0.9096566, 0, 0.9921569, 1, 1,
-0.07634776, -1.729168, -1.930411, 0, 0.9882353, 1, 1,
-0.07606267, -0.1757536, -2.623853, 0, 0.9803922, 1, 1,
-0.06973042, 0.2029542, 0.364655, 0, 0.9764706, 1, 1,
-0.06733027, 0.845583, 0.4075519, 0, 0.9686275, 1, 1,
-0.06628704, 0.1245353, -1.457002, 0, 0.9647059, 1, 1,
-0.06628019, 0.1248805, 0.6107372, 0, 0.9568627, 1, 1,
-0.06252592, -0.1953001, -3.362403, 0, 0.9529412, 1, 1,
-0.05808156, 0.2534518, -1.296219, 0, 0.945098, 1, 1,
-0.05567317, 0.1092292, -2.705347, 0, 0.9411765, 1, 1,
-0.05519525, 0.8177153, 0.7195886, 0, 0.9333333, 1, 1,
-0.05363009, 0.248962, 1.435742, 0, 0.9294118, 1, 1,
-0.05102263, -0.3962876, -3.563028, 0, 0.9215686, 1, 1,
-0.05024893, -0.003744304, -1.848244, 0, 0.9176471, 1, 1,
-0.04725603, 0.6023163, -0.14552, 0, 0.9098039, 1, 1,
-0.04361908, 0.06898928, -0.2484329, 0, 0.9058824, 1, 1,
-0.03980482, -1.213407, -2.427857, 0, 0.8980392, 1, 1,
-0.03310968, 1.038825, -0.8113319, 0, 0.8901961, 1, 1,
-0.03274586, 0.7026354, -1.101796, 0, 0.8862745, 1, 1,
-0.02465578, 0.313015, 1.471833, 0, 0.8784314, 1, 1,
-0.02293494, 0.8559829, 0.671374, 0, 0.8745098, 1, 1,
-0.02291914, -1.674018, -2.611828, 0, 0.8666667, 1, 1,
-0.01409415, -0.1687683, -3.217531, 0, 0.8627451, 1, 1,
-0.003835837, 0.3527825, 0.04939778, 0, 0.854902, 1, 1,
-0.0006600706, -0.06351364, -2.45052, 0, 0.8509804, 1, 1,
0.001325352, 0.2477721, 0.441161, 0, 0.8431373, 1, 1,
0.001856554, 1.544287, 0.3552936, 0, 0.8392157, 1, 1,
0.002980398, -1.441908, 0.8202937, 0, 0.8313726, 1, 1,
0.004373504, 0.3528036, -0.1818801, 0, 0.827451, 1, 1,
0.004742877, 2.009018, -1.304412, 0, 0.8196079, 1, 1,
0.008355866, 0.9456096, 1.232037, 0, 0.8156863, 1, 1,
0.009971483, 1.50997, -1.603806, 0, 0.8078431, 1, 1,
0.0153513, 0.1375522, -0.3438309, 0, 0.8039216, 1, 1,
0.01654804, 1.470196, 0.8717236, 0, 0.7960784, 1, 1,
0.02019624, 0.1708175, -0.799242, 0, 0.7882353, 1, 1,
0.02082997, -0.4819165, 4.229639, 0, 0.7843137, 1, 1,
0.02098044, 0.2942687, 0.187025, 0, 0.7764706, 1, 1,
0.02448773, 0.830461, -0.2121882, 0, 0.772549, 1, 1,
0.02893333, -0.02962257, 3.670873, 0, 0.7647059, 1, 1,
0.03313917, 0.8036253, -0.4629254, 0, 0.7607843, 1, 1,
0.03583175, -0.06223606, 2.91272, 0, 0.7529412, 1, 1,
0.03951862, 1.468001, -0.2724156, 0, 0.7490196, 1, 1,
0.03993024, 1.745174, -0.8430067, 0, 0.7411765, 1, 1,
0.04328382, -1.501678, 2.053125, 0, 0.7372549, 1, 1,
0.05327662, -1.004403, 0.4683216, 0, 0.7294118, 1, 1,
0.05527508, -0.184544, 3.63858, 0, 0.7254902, 1, 1,
0.0622016, 1.426432, -0.1008959, 0, 0.7176471, 1, 1,
0.06240527, -0.05730111, 2.903938, 0, 0.7137255, 1, 1,
0.06798785, 2.201424, 0.1298288, 0, 0.7058824, 1, 1,
0.08059217, -0.08881666, 1.907149, 0, 0.6980392, 1, 1,
0.08121803, -0.7226095, 3.596627, 0, 0.6941177, 1, 1,
0.08245406, 0.06433494, 1.199147, 0, 0.6862745, 1, 1,
0.08829334, 2.344692, 0.339553, 0, 0.682353, 1, 1,
0.09142044, -1.119562, 3.502846, 0, 0.6745098, 1, 1,
0.0919157, -0.9854399, 3.768248, 0, 0.6705883, 1, 1,
0.09305666, 1.590232, -1.762008, 0, 0.6627451, 1, 1,
0.0953633, 0.6119885, -0.8245323, 0, 0.6588235, 1, 1,
0.09627796, -1.26139, 3.66611, 0, 0.6509804, 1, 1,
0.09658418, 0.6705854, 0.5145579, 0, 0.6470588, 1, 1,
0.09676494, 1.968305, 0.35417, 0, 0.6392157, 1, 1,
0.09882181, -0.6739032, 3.861079, 0, 0.6352941, 1, 1,
0.09976377, -0.7418637, 2.783838, 0, 0.627451, 1, 1,
0.1038226, -1.654711, 3.764663, 0, 0.6235294, 1, 1,
0.1056828, -0.2997169, 2.228789, 0, 0.6156863, 1, 1,
0.1124307, -0.1366266, 2.79528, 0, 0.6117647, 1, 1,
0.1134076, -1.392413, 3.565651, 0, 0.6039216, 1, 1,
0.1220004, 0.5900011, -0.6663672, 0, 0.5960785, 1, 1,
0.124314, -1.865093, 1.967305, 0, 0.5921569, 1, 1,
0.1250411, -0.6219193, 1.843089, 0, 0.5843138, 1, 1,
0.1287329, -0.9306665, 3.659776, 0, 0.5803922, 1, 1,
0.1294898, 0.7635542, -1.403016, 0, 0.572549, 1, 1,
0.1334109, -0.8403392, 3.067539, 0, 0.5686275, 1, 1,
0.1343094, 0.6564879, 0.1215364, 0, 0.5607843, 1, 1,
0.1370156, 0.741847, 0.5177938, 0, 0.5568628, 1, 1,
0.1396365, -0.06942637, 1.708191, 0, 0.5490196, 1, 1,
0.1411441, -0.4425554, -0.07735756, 0, 0.5450981, 1, 1,
0.1442315, 0.4272501, -1.527879, 0, 0.5372549, 1, 1,
0.1461522, -0.00619848, 1.46556, 0, 0.5333334, 1, 1,
0.146219, -1.156599, 3.948654, 0, 0.5254902, 1, 1,
0.1571614, 0.4733773, 0.6662487, 0, 0.5215687, 1, 1,
0.1585113, -0.2481064, 1.124917, 0, 0.5137255, 1, 1,
0.1585536, -1.146792, 3.462217, 0, 0.509804, 1, 1,
0.159626, 0.7399591, 1.322798, 0, 0.5019608, 1, 1,
0.1662755, -0.05152103, 3.386698, 0, 0.4941176, 1, 1,
0.169476, 0.9427121, -0.766447, 0, 0.4901961, 1, 1,
0.1711009, 1.140202, 0.4698168, 0, 0.4823529, 1, 1,
0.1723188, -1.637999, 3.001614, 0, 0.4784314, 1, 1,
0.1724054, 0.441125, 0.35668, 0, 0.4705882, 1, 1,
0.1756272, -1.162342, 4.018007, 0, 0.4666667, 1, 1,
0.1784788, 1.436274, 0.2656816, 0, 0.4588235, 1, 1,
0.179401, 0.9878539, 0.6976262, 0, 0.454902, 1, 1,
0.1799932, -0.8207676, 3.301108, 0, 0.4470588, 1, 1,
0.1800269, 1.692525, 2.336105, 0, 0.4431373, 1, 1,
0.1822551, 0.5925713, 1.050202, 0, 0.4352941, 1, 1,
0.183599, 0.4966919, 1.306412, 0, 0.4313726, 1, 1,
0.1896418, -0.2861752, 2.27866, 0, 0.4235294, 1, 1,
0.1942297, 0.2214606, 1.839859, 0, 0.4196078, 1, 1,
0.198431, -0.9088256, 3.774368, 0, 0.4117647, 1, 1,
0.2089003, 1.866956, -1.322263, 0, 0.4078431, 1, 1,
0.2155715, 1.372448, -0.06012869, 0, 0.4, 1, 1,
0.2177396, 0.3242531, 0.134051, 0, 0.3921569, 1, 1,
0.2183326, -0.03016476, 1.999589, 0, 0.3882353, 1, 1,
0.2234419, 2.146545, -0.1229055, 0, 0.3803922, 1, 1,
0.2250685, 2.316853, -1.214955, 0, 0.3764706, 1, 1,
0.2262425, 1.024088, -0.643068, 0, 0.3686275, 1, 1,
0.2314145, 1.366298, -1.365993, 0, 0.3647059, 1, 1,
0.2322459, -1.383621, 2.742253, 0, 0.3568628, 1, 1,
0.2334733, -0.6399743, 2.858829, 0, 0.3529412, 1, 1,
0.2357107, -0.8841707, 1.506156, 0, 0.345098, 1, 1,
0.2372914, 0.685572, -0.1182846, 0, 0.3411765, 1, 1,
0.2387281, 0.811097, -0.6248551, 0, 0.3333333, 1, 1,
0.2392486, 1.021636, 0.05179086, 0, 0.3294118, 1, 1,
0.2407032, -0.5322348, 2.711084, 0, 0.3215686, 1, 1,
0.2456019, 1.491487, 0.00571682, 0, 0.3176471, 1, 1,
0.2480282, -0.3788908, 0.8859133, 0, 0.3098039, 1, 1,
0.2497818, 0.3705519, 0.1564027, 0, 0.3058824, 1, 1,
0.2506501, 0.2785446, 0.3928881, 0, 0.2980392, 1, 1,
0.2536933, 0.327896, -1.37011, 0, 0.2901961, 1, 1,
0.2546156, -1.234067, 4.40105, 0, 0.2862745, 1, 1,
0.2589531, 0.4824123, 0.284152, 0, 0.2784314, 1, 1,
0.2651036, 0.3749081, -0.03922221, 0, 0.2745098, 1, 1,
0.2671371, 0.9380921, 1.129302, 0, 0.2666667, 1, 1,
0.270899, -0.1178845, 1.051361, 0, 0.2627451, 1, 1,
0.2728293, -0.2243484, 3.228985, 0, 0.254902, 1, 1,
0.2739821, -1.288981, 4.334888, 0, 0.2509804, 1, 1,
0.2790436, -1.77742, 2.220573, 0, 0.2431373, 1, 1,
0.2890181, 0.4793188, -0.5867931, 0, 0.2392157, 1, 1,
0.2942897, -1.528157, 2.329404, 0, 0.2313726, 1, 1,
0.2958129, -1.018015, 0.9088289, 0, 0.227451, 1, 1,
0.2961009, 0.7860532, -0.8643661, 0, 0.2196078, 1, 1,
0.2983947, 0.8920132, 1.43468, 0, 0.2156863, 1, 1,
0.3015111, 0.957597, 2.230371, 0, 0.2078431, 1, 1,
0.3019855, 0.2945663, 1.891784, 0, 0.2039216, 1, 1,
0.3076123, -0.01082558, 1.931893, 0, 0.1960784, 1, 1,
0.3095479, -0.1689173, 0.8181098, 0, 0.1882353, 1, 1,
0.3133011, 1.331677, 1.190659, 0, 0.1843137, 1, 1,
0.314999, -0.5884236, 2.432177, 0, 0.1764706, 1, 1,
0.3204843, -0.9177657, 4.007004, 0, 0.172549, 1, 1,
0.321696, 1.204719, 1.523372, 0, 0.1647059, 1, 1,
0.3224274, -0.05433008, 2.159333, 0, 0.1607843, 1, 1,
0.3227537, 1.340245, 1.417141, 0, 0.1529412, 1, 1,
0.329261, 0.1813082, -0.008823161, 0, 0.1490196, 1, 1,
0.3337517, -1.822146, 1.783991, 0, 0.1411765, 1, 1,
0.3343793, 0.3092151, 1.424961, 0, 0.1372549, 1, 1,
0.3361456, -1.043855, 1.652979, 0, 0.1294118, 1, 1,
0.3362455, 1.545087, 0.68532, 0, 0.1254902, 1, 1,
0.3436275, 0.01709419, 1.065015, 0, 0.1176471, 1, 1,
0.3439784, 0.2121293, 2.545284, 0, 0.1137255, 1, 1,
0.3450218, 0.03571445, 1.506892, 0, 0.1058824, 1, 1,
0.3469089, 0.1048552, 0.9430673, 0, 0.09803922, 1, 1,
0.3543638, -0.2422996, 2.669333, 0, 0.09411765, 1, 1,
0.3548467, 1.424741, -0.8509457, 0, 0.08627451, 1, 1,
0.3573855, -0.6785634, 3.436574, 0, 0.08235294, 1, 1,
0.3599957, 1.313287, 0.4812725, 0, 0.07450981, 1, 1,
0.3612644, -0.8210434, 2.663427, 0, 0.07058824, 1, 1,
0.3737273, -1.170095, 3.226329, 0, 0.0627451, 1, 1,
0.3744955, 1.848513, -1.005446, 0, 0.05882353, 1, 1,
0.3751653, -1.110138, 2.864287, 0, 0.05098039, 1, 1,
0.3784266, -1.011827, -0.1315876, 0, 0.04705882, 1, 1,
0.3805502, 0.9541475, 1.851113, 0, 0.03921569, 1, 1,
0.3832066, -1.648582, 2.848668, 0, 0.03529412, 1, 1,
0.383387, -1.787886, 4.472905, 0, 0.02745098, 1, 1,
0.3835995, -0.8986665, 3.76288, 0, 0.02352941, 1, 1,
0.3857753, -1.29065, 2.155449, 0, 0.01568628, 1, 1,
0.3860588, -1.01377, 0.7851916, 0, 0.01176471, 1, 1,
0.3977968, 0.2586566, -1.08246, 0, 0.003921569, 1, 1,
0.4098894, 0.4074914, 2.407229, 0.003921569, 0, 1, 1,
0.4100599, 0.1180798, 2.341063, 0.007843138, 0, 1, 1,
0.4127568, 0.871618, -1.29598, 0.01568628, 0, 1, 1,
0.4140903, 0.3201742, 1.651976, 0.01960784, 0, 1, 1,
0.4171384, 0.6055084, 0.7436018, 0.02745098, 0, 1, 1,
0.42053, -1.14089, 1.03394, 0.03137255, 0, 1, 1,
0.4324544, -0.5217075, 3.486576, 0.03921569, 0, 1, 1,
0.4359168, -0.5959731, 1.533521, 0.04313726, 0, 1, 1,
0.4378518, 1.490009, 1.002211, 0.05098039, 0, 1, 1,
0.4384054, 1.157655, 0.4389056, 0.05490196, 0, 1, 1,
0.4390154, 0.9507504, -0.0166214, 0.0627451, 0, 1, 1,
0.4412324, -0.8092326, 1.641891, 0.06666667, 0, 1, 1,
0.4431089, -1.351285, 5.385251, 0.07450981, 0, 1, 1,
0.4602215, -0.3122443, 0.37778, 0.07843138, 0, 1, 1,
0.4607812, -1.479142, 4.094884, 0.08627451, 0, 1, 1,
0.4611853, 0.6993488, 0.01165746, 0.09019608, 0, 1, 1,
0.4640075, 0.7821297, 0.4533816, 0.09803922, 0, 1, 1,
0.4674208, 0.1754849, 1.677696, 0.1058824, 0, 1, 1,
0.4690921, -0.3600485, 1.937738, 0.1098039, 0, 1, 1,
0.4720283, 0.7874566, -1.94857, 0.1176471, 0, 1, 1,
0.4740718, 0.8122364, -0.08939468, 0.1215686, 0, 1, 1,
0.4774536, -0.1548506, 1.190404, 0.1294118, 0, 1, 1,
0.4848123, 2.073476, 0.01619697, 0.1333333, 0, 1, 1,
0.4861803, -0.3398173, 1.06214, 0.1411765, 0, 1, 1,
0.4873233, -0.4896574, 1.790152, 0.145098, 0, 1, 1,
0.4878622, -0.3636166, 1.025378, 0.1529412, 0, 1, 1,
0.4966083, 0.3439957, -0.1443767, 0.1568628, 0, 1, 1,
0.4968523, 2.385753, 0.6716664, 0.1647059, 0, 1, 1,
0.4978357, -1.058263, 0.9953121, 0.1686275, 0, 1, 1,
0.501999, -1.180121, 1.652195, 0.1764706, 0, 1, 1,
0.5058756, -0.7723277, 3.481906, 0.1803922, 0, 1, 1,
0.5073827, -0.3061068, 3.038433, 0.1882353, 0, 1, 1,
0.509918, -0.1643864, 1.948796, 0.1921569, 0, 1, 1,
0.52087, -0.375348, 2.12328, 0.2, 0, 1, 1,
0.5217081, 2.353378, 0.7126962, 0.2078431, 0, 1, 1,
0.5254063, -1.554323, 1.77376, 0.2117647, 0, 1, 1,
0.5281639, -0.5931495, 3.264853, 0.2196078, 0, 1, 1,
0.5281972, -0.03487274, -0.2147343, 0.2235294, 0, 1, 1,
0.5295447, 0.6622226, 0.933721, 0.2313726, 0, 1, 1,
0.5330601, 0.3601302, -0.08720829, 0.2352941, 0, 1, 1,
0.5339736, 0.9871369, 1.009032, 0.2431373, 0, 1, 1,
0.5345244, 1.130364, 0.8977725, 0.2470588, 0, 1, 1,
0.5351734, -0.3689036, 1.512246, 0.254902, 0, 1, 1,
0.5356088, -0.1199603, 1.504869, 0.2588235, 0, 1, 1,
0.5385486, 1.511439, 1.497075, 0.2666667, 0, 1, 1,
0.5415707, 0.4630204, -0.9211604, 0.2705882, 0, 1, 1,
0.5462783, -0.9727652, 2.85539, 0.2784314, 0, 1, 1,
0.5488361, 0.8144319, -0.7809408, 0.282353, 0, 1, 1,
0.5507441, -1.723864, 2.674609, 0.2901961, 0, 1, 1,
0.5511475, -1.235888, 3.840924, 0.2941177, 0, 1, 1,
0.5548577, -1.399426, 2.760613, 0.3019608, 0, 1, 1,
0.5583566, 0.4994961, 0.3332932, 0.3098039, 0, 1, 1,
0.5629614, 2.108238, -0.01088661, 0.3137255, 0, 1, 1,
0.5632956, 1.74988, -0.1043797, 0.3215686, 0, 1, 1,
0.5700034, 1.708871, 0.7324772, 0.3254902, 0, 1, 1,
0.5722162, 1.094143, -1.911046, 0.3333333, 0, 1, 1,
0.5722677, -1.191569, 2.534258, 0.3372549, 0, 1, 1,
0.5822412, 0.4340381, 1.694182, 0.345098, 0, 1, 1,
0.5827074, 0.7904689, 0.1614324, 0.3490196, 0, 1, 1,
0.5838279, 0.6760131, 1.498447, 0.3568628, 0, 1, 1,
0.5840867, 1.940473, 0.05064293, 0.3607843, 0, 1, 1,
0.5868573, -0.1452791, 1.228312, 0.3686275, 0, 1, 1,
0.5935643, 1.245203, 0.02928946, 0.372549, 0, 1, 1,
0.594236, -0.6072869, 2.24488, 0.3803922, 0, 1, 1,
0.5985727, -1.763463, 1.135054, 0.3843137, 0, 1, 1,
0.6124647, -1.730771, 2.42079, 0.3921569, 0, 1, 1,
0.6126912, -0.1694371, 3.328959, 0.3960784, 0, 1, 1,
0.6141175, 0.940555, 0.2336678, 0.4039216, 0, 1, 1,
0.6228558, 1.098252, 0.8362598, 0.4117647, 0, 1, 1,
0.6286182, -0.4261658, 1.419761, 0.4156863, 0, 1, 1,
0.6290305, -0.04666021, -0.5156845, 0.4235294, 0, 1, 1,
0.6327198, -0.3999208, 0.9253828, 0.427451, 0, 1, 1,
0.6354408, -0.6646981, 2.674258, 0.4352941, 0, 1, 1,
0.6374694, -1.068847, 2.238838, 0.4392157, 0, 1, 1,
0.6428681, -2.051359, 4.688757, 0.4470588, 0, 1, 1,
0.6439065, 0.08732102, 2.237691, 0.4509804, 0, 1, 1,
0.651662, -0.4808516, 2.788516, 0.4588235, 0, 1, 1,
0.6556116, 1.673833, -0.3892854, 0.4627451, 0, 1, 1,
0.6559835, -0.7753353, 2.938946, 0.4705882, 0, 1, 1,
0.6571985, -1.035929, 2.119441, 0.4745098, 0, 1, 1,
0.6581949, -2.029038, 4.278951, 0.4823529, 0, 1, 1,
0.6706789, 0.8256799, -0.5682216, 0.4862745, 0, 1, 1,
0.6707526, 1.007054, 2.0435, 0.4941176, 0, 1, 1,
0.6729477, -1.008789, 3.503439, 0.5019608, 0, 1, 1,
0.6802193, -0.9393033, 3.959152, 0.5058824, 0, 1, 1,
0.6843805, -2.086532, 1.793095, 0.5137255, 0, 1, 1,
0.6864989, -1.217014, 1.330272, 0.5176471, 0, 1, 1,
0.6897333, -0.565359, 4.509476, 0.5254902, 0, 1, 1,
0.6914805, -0.6126165, 2.172402, 0.5294118, 0, 1, 1,
0.6948726, -0.9095907, 2.378393, 0.5372549, 0, 1, 1,
0.70341, 1.314805, 0.5917621, 0.5411765, 0, 1, 1,
0.7076818, -0.7775846, 3.280793, 0.5490196, 0, 1, 1,
0.708345, -0.9032328, 2.630217, 0.5529412, 0, 1, 1,
0.7116614, 0.4507326, 0.5330272, 0.5607843, 0, 1, 1,
0.712966, 0.8001213, 0.09935267, 0.5647059, 0, 1, 1,
0.7141936, -0.1532709, -0.463205, 0.572549, 0, 1, 1,
0.7144802, -0.9912055, 2.755047, 0.5764706, 0, 1, 1,
0.7259778, -1.789428, 3.901186, 0.5843138, 0, 1, 1,
0.726773, 1.042683, 1.729502, 0.5882353, 0, 1, 1,
0.7315484, -0.1091204, 1.739242, 0.5960785, 0, 1, 1,
0.7329844, 0.8246262, 1.746562, 0.6039216, 0, 1, 1,
0.7345871, -0.4507234, 2.039546, 0.6078432, 0, 1, 1,
0.7383962, 2.273024, 1.2844, 0.6156863, 0, 1, 1,
0.7442403, -0.8448799, 2.578166, 0.6196079, 0, 1, 1,
0.7450468, -0.7839214, 1.906376, 0.627451, 0, 1, 1,
0.747215, -0.05568195, 2.403901, 0.6313726, 0, 1, 1,
0.7500595, 0.1899498, 2.104087, 0.6392157, 0, 1, 1,
0.7522755, 0.4450328, 1.622281, 0.6431373, 0, 1, 1,
0.7544511, -1.114076, 2.996111, 0.6509804, 0, 1, 1,
0.7604157, -0.1945114, 1.637822, 0.654902, 0, 1, 1,
0.761008, 0.1206781, 0.188611, 0.6627451, 0, 1, 1,
0.7637803, 0.2725184, 0.3055687, 0.6666667, 0, 1, 1,
0.7646533, 0.04196283, 0.6637909, 0.6745098, 0, 1, 1,
0.7665263, -0.2210768, 1.069324, 0.6784314, 0, 1, 1,
0.7699545, 0.3998195, -1.153735, 0.6862745, 0, 1, 1,
0.7826018, -0.9975244, 2.157768, 0.6901961, 0, 1, 1,
0.7831744, -1.092628, 2.451389, 0.6980392, 0, 1, 1,
0.784808, 1.7041, 0.6287501, 0.7058824, 0, 1, 1,
0.7866631, 0.2005218, 2.071412, 0.7098039, 0, 1, 1,
0.7950434, 0.7511778, 0.8505142, 0.7176471, 0, 1, 1,
0.8018436, -0.3063862, 1.610871, 0.7215686, 0, 1, 1,
0.8028504, -0.3926584, 1.086331, 0.7294118, 0, 1, 1,
0.8034506, 0.1479561, 1.40661, 0.7333333, 0, 1, 1,
0.8071047, -1.121007, 2.403242, 0.7411765, 0, 1, 1,
0.8072549, 0.3942573, 0.6433026, 0.7450981, 0, 1, 1,
0.8097343, 0.3202332, 0.7510048, 0.7529412, 0, 1, 1,
0.8153136, 0.4331718, 0.6471775, 0.7568628, 0, 1, 1,
0.8239962, -0.3416038, 2.052863, 0.7647059, 0, 1, 1,
0.8269929, 1.903739, 0.03647636, 0.7686275, 0, 1, 1,
0.8315667, 1.098641, -0.329375, 0.7764706, 0, 1, 1,
0.8344772, -0.8597359, 2.566784, 0.7803922, 0, 1, 1,
0.8352623, -0.1965877, -0.1298846, 0.7882353, 0, 1, 1,
0.8414218, -0.2657244, 2.637618, 0.7921569, 0, 1, 1,
0.8438869, 1.620594, 0.4221764, 0.8, 0, 1, 1,
0.8450786, -1.399867, 3.121923, 0.8078431, 0, 1, 1,
0.8470253, 0.7497991, 1.956818, 0.8117647, 0, 1, 1,
0.853635, 0.2696355, 1.67836, 0.8196079, 0, 1, 1,
0.8590509, 1.307723, 3.177574, 0.8235294, 0, 1, 1,
0.8602585, -1.555833, 3.180854, 0.8313726, 0, 1, 1,
0.8643161, -0.327481, 0.9735035, 0.8352941, 0, 1, 1,
0.864422, 2.982545, -0.3687404, 0.8431373, 0, 1, 1,
0.8686112, 0.3786601, 1.505577, 0.8470588, 0, 1, 1,
0.8765779, 0.1986791, -0.173547, 0.854902, 0, 1, 1,
0.8794425, 0.04293888, 1.326968, 0.8588235, 0, 1, 1,
0.8820478, 2.189314, -0.451943, 0.8666667, 0, 1, 1,
0.8918155, -0.5081812, 1.701874, 0.8705882, 0, 1, 1,
0.9019895, -0.2575071, -0.3914315, 0.8784314, 0, 1, 1,
0.9045064, 0.7401252, 0.02994849, 0.8823529, 0, 1, 1,
0.9074652, 0.5975835, 0.7547436, 0.8901961, 0, 1, 1,
0.9137096, 0.5660483, 1.523421, 0.8941177, 0, 1, 1,
0.9168531, 1.143398, 0.9128192, 0.9019608, 0, 1, 1,
0.9222306, -0.1068569, 3.233837, 0.9098039, 0, 1, 1,
0.9227035, 1.080568, 3.167599, 0.9137255, 0, 1, 1,
0.9234125, -0.0762984, 1.586016, 0.9215686, 0, 1, 1,
0.9236029, 0.5292356, 1.200608, 0.9254902, 0, 1, 1,
0.9256236, 0.6793355, 1.244412, 0.9333333, 0, 1, 1,
0.9272087, -1.380802, 4.394745, 0.9372549, 0, 1, 1,
0.928869, -0.2676795, 2.030147, 0.945098, 0, 1, 1,
0.9347494, 0.7192988, 0.6370153, 0.9490196, 0, 1, 1,
0.9552638, -1.895703, 2.137931, 0.9568627, 0, 1, 1,
0.9588777, -0.1970035, 1.807609, 0.9607843, 0, 1, 1,
0.9590224, -0.6926871, 1.174115, 0.9686275, 0, 1, 1,
0.9591001, 0.2054667, 1.522512, 0.972549, 0, 1, 1,
0.9596536, 0.2379184, 1.410749, 0.9803922, 0, 1, 1,
0.9641928, 0.337781, 2.358212, 0.9843137, 0, 1, 1,
0.9667753, -0.1138953, 2.491426, 0.9921569, 0, 1, 1,
0.9679081, -0.07870471, 0.8141681, 0.9960784, 0, 1, 1,
0.9732274, 2.189474, -0.09812132, 1, 0, 0.9960784, 1,
0.9782411, -0.1982265, 2.708152, 1, 0, 0.9882353, 1,
0.9801131, -1.656573, 2.864362, 1, 0, 0.9843137, 1,
0.9839182, -0.5494965, 2.067733, 1, 0, 0.9764706, 1,
0.984472, 1.064073, 1.830366, 1, 0, 0.972549, 1,
0.9886808, 0.1458783, 1.253927, 1, 0, 0.9647059, 1,
0.9887933, 0.7101351, 2.064579, 1, 0, 0.9607843, 1,
1.003385, -1.081508, 2.63141, 1, 0, 0.9529412, 1,
1.004183, -0.5038034, 1.910013, 1, 0, 0.9490196, 1,
1.005627, -1.286271, 0.6893704, 1, 0, 0.9411765, 1,
1.007813, -0.5133664, 1.886088, 1, 0, 0.9372549, 1,
1.019344, -0.5344669, 1.374124, 1, 0, 0.9294118, 1,
1.019364, 1.115413, 1.284034, 1, 0, 0.9254902, 1,
1.022473, 0.8733113, 0.800117, 1, 0, 0.9176471, 1,
1.02378, 0.01521188, 1.998716, 1, 0, 0.9137255, 1,
1.02387, 0.8285356, 1.778466, 1, 0, 0.9058824, 1,
1.026633, -0.2577674, 3.820735, 1, 0, 0.9019608, 1,
1.031467, 0.4619646, 1.468801, 1, 0, 0.8941177, 1,
1.033947, 0.4229296, 2.711671, 1, 0, 0.8862745, 1,
1.048608, -0.7431447, 2.005487, 1, 0, 0.8823529, 1,
1.052474, 0.320973, 1.464845, 1, 0, 0.8745098, 1,
1.062691, -0.04541744, 2.63424, 1, 0, 0.8705882, 1,
1.081533, 1.483353, -0.6016883, 1, 0, 0.8627451, 1,
1.082853, 0.5596629, 3.726958, 1, 0, 0.8588235, 1,
1.088202, 0.6971364, 1.457126, 1, 0, 0.8509804, 1,
1.096022, 0.8760569, 1.024085, 1, 0, 0.8470588, 1,
1.097667, -1.025608, 2.814879, 1, 0, 0.8392157, 1,
1.108681, 0.8293267, 0.2201804, 1, 0, 0.8352941, 1,
1.10892, 0.9819479, 0.7848555, 1, 0, 0.827451, 1,
1.110927, -0.6402078, 2.928018, 1, 0, 0.8235294, 1,
1.119694, 0.3152612, 0.4098055, 1, 0, 0.8156863, 1,
1.123114, -1.456547, 2.220454, 1, 0, 0.8117647, 1,
1.125822, -0.2480524, 2.309777, 1, 0, 0.8039216, 1,
1.12825, -0.05588429, 1.237561, 1, 0, 0.7960784, 1,
1.12831, 1.557831, -0.07541285, 1, 0, 0.7921569, 1,
1.129211, -0.7452547, 2.098256, 1, 0, 0.7843137, 1,
1.140569, -2.084657, 2.884602, 1, 0, 0.7803922, 1,
1.141233, -1.839802, 2.13954, 1, 0, 0.772549, 1,
1.147407, 0.999257, -0.5232145, 1, 0, 0.7686275, 1,
1.15111, 0.4369089, 0.2944202, 1, 0, 0.7607843, 1,
1.151798, 1.42648, 0.906557, 1, 0, 0.7568628, 1,
1.172638, 1.15255, -0.3832746, 1, 0, 0.7490196, 1,
1.175367, 0.4507704, 0.08145906, 1, 0, 0.7450981, 1,
1.179464, -0.3034921, -0.09041554, 1, 0, 0.7372549, 1,
1.18402, -0.1835231, 0.1546017, 1, 0, 0.7333333, 1,
1.190802, 0.05874191, 1.841145, 1, 0, 0.7254902, 1,
1.190923, -0.1737116, 2.750916, 1, 0, 0.7215686, 1,
1.197857, 0.9940165, 0.2920568, 1, 0, 0.7137255, 1,
1.203518, 0.6572058, -0.413845, 1, 0, 0.7098039, 1,
1.221076, 0.9464618, -1.357037, 1, 0, 0.7019608, 1,
1.228608, -2.942944, 1.795119, 1, 0, 0.6941177, 1,
1.231337, 0.5882987, 1.733253, 1, 0, 0.6901961, 1,
1.237026, -2.092516, 1.378729, 1, 0, 0.682353, 1,
1.23937, -1.577113, 2.64921, 1, 0, 0.6784314, 1,
1.240288, 0.7233638, 3.668684, 1, 0, 0.6705883, 1,
1.242364, 0.6708154, 1.802658, 1, 0, 0.6666667, 1,
1.244056, -1.066622, 2.381422, 1, 0, 0.6588235, 1,
1.262023, 0.2489548, 1.947176, 1, 0, 0.654902, 1,
1.263704, 0.7314319, 1.440733, 1, 0, 0.6470588, 1,
1.267916, -1.305869, 2.420481, 1, 0, 0.6431373, 1,
1.275114, 0.9211228, 0.7091317, 1, 0, 0.6352941, 1,
1.277324, 1.527564, 0.3588116, 1, 0, 0.6313726, 1,
1.282823, 0.04641959, 0.2224838, 1, 0, 0.6235294, 1,
1.295031, -0.7569494, 2.50507, 1, 0, 0.6196079, 1,
1.296442, 1.246638, 2.046028, 1, 0, 0.6117647, 1,
1.298663, 0.1166496, 2.639668, 1, 0, 0.6078432, 1,
1.306975, -1.106285, 1.882715, 1, 0, 0.6, 1,
1.313339, -1.918645, 1.12935, 1, 0, 0.5921569, 1,
1.315048, 0.9809201, 0.6045894, 1, 0, 0.5882353, 1,
1.320463, 0.5567733, 2.295671, 1, 0, 0.5803922, 1,
1.336968, -0.09685685, 1.404261, 1, 0, 0.5764706, 1,
1.338176, 1.080538, 2.354881, 1, 0, 0.5686275, 1,
1.342475, 1.245983, 0.4703088, 1, 0, 0.5647059, 1,
1.346326, 0.7332802, 1.527504, 1, 0, 0.5568628, 1,
1.359561, 2.463956, 0.8094745, 1, 0, 0.5529412, 1,
1.365371, 0.5551608, 4.615131, 1, 0, 0.5450981, 1,
1.366862, 1.901378, 1.049197, 1, 0, 0.5411765, 1,
1.370879, 0.4319594, 1.136996, 1, 0, 0.5333334, 1,
1.377909, 0.9227344, 0.423835, 1, 0, 0.5294118, 1,
1.380132, 0.8312537, 1.121788, 1, 0, 0.5215687, 1,
1.38315, 1.189445, 1.054519, 1, 0, 0.5176471, 1,
1.383699, -0.8871932, 1.842303, 1, 0, 0.509804, 1,
1.383821, 1.573961, 1.527962, 1, 0, 0.5058824, 1,
1.384062, -1.435836, 2.58398, 1, 0, 0.4980392, 1,
1.384894, 0.449429, 0.614407, 1, 0, 0.4901961, 1,
1.387995, -0.4079775, 2.000843, 1, 0, 0.4862745, 1,
1.3889, -0.3999245, 3.091504, 1, 0, 0.4784314, 1,
1.396299, -2.200738, 2.711495, 1, 0, 0.4745098, 1,
1.409613, 0.5769511, 0.8405455, 1, 0, 0.4666667, 1,
1.410407, -0.9602603, 3.156685, 1, 0, 0.4627451, 1,
1.411234, 0.5963744, 2.177645, 1, 0, 0.454902, 1,
1.414275, -0.01690341, 0.4293966, 1, 0, 0.4509804, 1,
1.416014, -0.8377839, 1.239036, 1, 0, 0.4431373, 1,
1.418533, 0.5072029, -0.1753773, 1, 0, 0.4392157, 1,
1.431816, -0.06599262, 0.5836639, 1, 0, 0.4313726, 1,
1.43968, -1.531892, 3.007233, 1, 0, 0.427451, 1,
1.441265, -0.9236463, 1.784102, 1, 0, 0.4196078, 1,
1.451466, 0.1692724, 1.740307, 1, 0, 0.4156863, 1,
1.473024, -1.486931, 1.929973, 1, 0, 0.4078431, 1,
1.483913, 0.2123693, 0.418634, 1, 0, 0.4039216, 1,
1.488416, 0.1196436, 2.662757, 1, 0, 0.3960784, 1,
1.489034, 2.906521, -0.0004320845, 1, 0, 0.3882353, 1,
1.499272, -1.124575, 1.573992, 1, 0, 0.3843137, 1,
1.500103, 1.914666, 0.04580305, 1, 0, 0.3764706, 1,
1.516662, -0.3249563, 1.101375, 1, 0, 0.372549, 1,
1.519884, -2.34948, 1.587771, 1, 0, 0.3647059, 1,
1.520213, 0.2083652, 0.3774985, 1, 0, 0.3607843, 1,
1.522082, -0.3077353, 1.730975, 1, 0, 0.3529412, 1,
1.538637, -1.353403, 3.004187, 1, 0, 0.3490196, 1,
1.54546, -0.8255088, 1.231202, 1, 0, 0.3411765, 1,
1.545795, -1.238207, 0.7300326, 1, 0, 0.3372549, 1,
1.550604, 1.099972, 1.316553, 1, 0, 0.3294118, 1,
1.555382, -0.2009755, 1.825286, 1, 0, 0.3254902, 1,
1.555871, 0.6799281, 0.3981067, 1, 0, 0.3176471, 1,
1.582638, 0.006388579, 1.497767, 1, 0, 0.3137255, 1,
1.593234, 1.821816, 2.185279, 1, 0, 0.3058824, 1,
1.59754, 1.180133, 0.4569747, 1, 0, 0.2980392, 1,
1.604619, 1.786511, 2.148072, 1, 0, 0.2941177, 1,
1.60913, -0.2363285, 2.419443, 1, 0, 0.2862745, 1,
1.609195, -0.1239036, 1.637816, 1, 0, 0.282353, 1,
1.624038, 1.282793, 1.730865, 1, 0, 0.2745098, 1,
1.624311, 0.2758423, 3.017115, 1, 0, 0.2705882, 1,
1.640115, -1.417664, 0.9507798, 1, 0, 0.2627451, 1,
1.640949, -0.9996279, 1.230951, 1, 0, 0.2588235, 1,
1.642035, -1.469418, 0.3992794, 1, 0, 0.2509804, 1,
1.666424, 0.7296003, 0.2799542, 1, 0, 0.2470588, 1,
1.691007, 0.7725455, 0.1808643, 1, 0, 0.2392157, 1,
1.708056, 0.6514628, 0.6555772, 1, 0, 0.2352941, 1,
1.708861, 1.231703, 1.084108, 1, 0, 0.227451, 1,
1.710957, -1.843442, 1.680084, 1, 0, 0.2235294, 1,
1.712927, 1.077028, 0.8665096, 1, 0, 0.2156863, 1,
1.714166, 1.748826, -0.0134411, 1, 0, 0.2117647, 1,
1.717429, -0.3253905, 0.9212373, 1, 0, 0.2039216, 1,
1.721362, -0.7728325, 1.838513, 1, 0, 0.1960784, 1,
1.736724, -1.175631, 2.56554, 1, 0, 0.1921569, 1,
1.753158, -0.2788695, 1.4591, 1, 0, 0.1843137, 1,
1.775296, 0.7810054, 2.042094, 1, 0, 0.1803922, 1,
1.80617, -0.1579816, 1.477196, 1, 0, 0.172549, 1,
1.811875, -1.531187, 2.230705, 1, 0, 0.1686275, 1,
1.819086, -0.5286034, 1.59917, 1, 0, 0.1607843, 1,
1.85598, -1.133945, 1.896083, 1, 0, 0.1568628, 1,
1.856007, -0.2048094, 1.380967, 1, 0, 0.1490196, 1,
1.876623, -0.2009254, 3.158549, 1, 0, 0.145098, 1,
1.8951, -0.1080288, 2.464346, 1, 0, 0.1372549, 1,
1.913563, 1.392295, 0.3589447, 1, 0, 0.1333333, 1,
1.929148, 1.151281, 0.63763, 1, 0, 0.1254902, 1,
1.995023, 2.348072, 0.3660251, 1, 0, 0.1215686, 1,
1.997902, 0.3600267, -0.1560433, 1, 0, 0.1137255, 1,
2.001127, 0.4459633, 0.9386183, 1, 0, 0.1098039, 1,
2.039208, -0.02543391, 1.790768, 1, 0, 0.1019608, 1,
2.053573, 0.09239847, 2.644233, 1, 0, 0.09411765, 1,
2.066623, 0.1721264, 0.8292146, 1, 0, 0.09019608, 1,
2.091479, 0.4703229, 2.932266, 1, 0, 0.08235294, 1,
2.097285, -2.106342, 1.642105, 1, 0, 0.07843138, 1,
2.153754, -0.404042, 1.286415, 1, 0, 0.07058824, 1,
2.156759, -0.6966534, 4.78663, 1, 0, 0.06666667, 1,
2.208311, -1.324473, 3.077084, 1, 0, 0.05882353, 1,
2.215496, 0.08474765, 1.759784, 1, 0, 0.05490196, 1,
2.236388, 0.2777764, 2.577052, 1, 0, 0.04705882, 1,
2.257507, -0.8400969, 0.8464808, 1, 0, 0.04313726, 1,
2.273306, 0.8647404, -0.7089003, 1, 0, 0.03529412, 1,
2.376545, -1.1021, 2.577869, 1, 0, 0.03137255, 1,
2.406218, -1.376008, 1.098752, 1, 0, 0.02352941, 1,
2.751604, 0.2800298, 1.792166, 1, 0, 0.01960784, 1,
2.874893, 0.6898912, 2.238626, 1, 0, 0.01176471, 1,
3.208316, -0.2925185, 3.192682, 1, 0, 0.007843138, 1
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
-0.2154264, -3.947314, -7.007183, 0, -0.5, 0.5, 0.5,
-0.2154264, -3.947314, -7.007183, 1, -0.5, 0.5, 0.5,
-0.2154264, -3.947314, -7.007183, 1, 1.5, 0.5, 0.5,
-0.2154264, -3.947314, -7.007183, 0, 1.5, 0.5, 0.5
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
-4.799818, 0.01980054, -7.007183, 0, -0.5, 0.5, 0.5,
-4.799818, 0.01980054, -7.007183, 1, -0.5, 0.5, 0.5,
-4.799818, 0.01980054, -7.007183, 1, 1.5, 0.5, 0.5,
-4.799818, 0.01980054, -7.007183, 0, 1.5, 0.5, 0.5
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
-4.799818, -3.947314, 0.087075, 0, -0.5, 0.5, 0.5,
-4.799818, -3.947314, 0.087075, 1, -0.5, 0.5, 0.5,
-4.799818, -3.947314, 0.087075, 1, 1.5, 0.5, 0.5,
-4.799818, -3.947314, 0.087075, 0, 1.5, 0.5, 0.5
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
-3, -3.031826, -5.370046,
3, -3.031826, -5.370046,
-3, -3.031826, -5.370046,
-3, -3.184407, -5.642902,
-2, -3.031826, -5.370046,
-2, -3.184407, -5.642902,
-1, -3.031826, -5.370046,
-1, -3.184407, -5.642902,
0, -3.031826, -5.370046,
0, -3.184407, -5.642902,
1, -3.031826, -5.370046,
1, -3.184407, -5.642902,
2, -3.031826, -5.370046,
2, -3.184407, -5.642902,
3, -3.031826, -5.370046,
3, -3.184407, -5.642902
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
-3, -3.48957, -6.188614, 0, -0.5, 0.5, 0.5,
-3, -3.48957, -6.188614, 1, -0.5, 0.5, 0.5,
-3, -3.48957, -6.188614, 1, 1.5, 0.5, 0.5,
-3, -3.48957, -6.188614, 0, 1.5, 0.5, 0.5,
-2, -3.48957, -6.188614, 0, -0.5, 0.5, 0.5,
-2, -3.48957, -6.188614, 1, -0.5, 0.5, 0.5,
-2, -3.48957, -6.188614, 1, 1.5, 0.5, 0.5,
-2, -3.48957, -6.188614, 0, 1.5, 0.5, 0.5,
-1, -3.48957, -6.188614, 0, -0.5, 0.5, 0.5,
-1, -3.48957, -6.188614, 1, -0.5, 0.5, 0.5,
-1, -3.48957, -6.188614, 1, 1.5, 0.5, 0.5,
-1, -3.48957, -6.188614, 0, 1.5, 0.5, 0.5,
0, -3.48957, -6.188614, 0, -0.5, 0.5, 0.5,
0, -3.48957, -6.188614, 1, -0.5, 0.5, 0.5,
0, -3.48957, -6.188614, 1, 1.5, 0.5, 0.5,
0, -3.48957, -6.188614, 0, 1.5, 0.5, 0.5,
1, -3.48957, -6.188614, 0, -0.5, 0.5, 0.5,
1, -3.48957, -6.188614, 1, -0.5, 0.5, 0.5,
1, -3.48957, -6.188614, 1, 1.5, 0.5, 0.5,
1, -3.48957, -6.188614, 0, 1.5, 0.5, 0.5,
2, -3.48957, -6.188614, 0, -0.5, 0.5, 0.5,
2, -3.48957, -6.188614, 1, -0.5, 0.5, 0.5,
2, -3.48957, -6.188614, 1, 1.5, 0.5, 0.5,
2, -3.48957, -6.188614, 0, 1.5, 0.5, 0.5,
3, -3.48957, -6.188614, 0, -0.5, 0.5, 0.5,
3, -3.48957, -6.188614, 1, -0.5, 0.5, 0.5,
3, -3.48957, -6.188614, 1, 1.5, 0.5, 0.5,
3, -3.48957, -6.188614, 0, 1.5, 0.5, 0.5
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
-3.741881, -2, -5.370046,
-3.741881, 2, -5.370046,
-3.741881, -2, -5.370046,
-3.918204, -2, -5.642902,
-3.741881, -1, -5.370046,
-3.918204, -1, -5.642902,
-3.741881, 0, -5.370046,
-3.918204, 0, -5.642902,
-3.741881, 1, -5.370046,
-3.918204, 1, -5.642902,
-3.741881, 2, -5.370046,
-3.918204, 2, -5.642902
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
-4.27085, -2, -6.188614, 0, -0.5, 0.5, 0.5,
-4.27085, -2, -6.188614, 1, -0.5, 0.5, 0.5,
-4.27085, -2, -6.188614, 1, 1.5, 0.5, 0.5,
-4.27085, -2, -6.188614, 0, 1.5, 0.5, 0.5,
-4.27085, -1, -6.188614, 0, -0.5, 0.5, 0.5,
-4.27085, -1, -6.188614, 1, -0.5, 0.5, 0.5,
-4.27085, -1, -6.188614, 1, 1.5, 0.5, 0.5,
-4.27085, -1, -6.188614, 0, 1.5, 0.5, 0.5,
-4.27085, 0, -6.188614, 0, -0.5, 0.5, 0.5,
-4.27085, 0, -6.188614, 1, -0.5, 0.5, 0.5,
-4.27085, 0, -6.188614, 1, 1.5, 0.5, 0.5,
-4.27085, 0, -6.188614, 0, 1.5, 0.5, 0.5,
-4.27085, 1, -6.188614, 0, -0.5, 0.5, 0.5,
-4.27085, 1, -6.188614, 1, -0.5, 0.5, 0.5,
-4.27085, 1, -6.188614, 1, 1.5, 0.5, 0.5,
-4.27085, 1, -6.188614, 0, 1.5, 0.5, 0.5,
-4.27085, 2, -6.188614, 0, -0.5, 0.5, 0.5,
-4.27085, 2, -6.188614, 1, -0.5, 0.5, 0.5,
-4.27085, 2, -6.188614, 1, 1.5, 0.5, 0.5,
-4.27085, 2, -6.188614, 0, 1.5, 0.5, 0.5
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
-3.741881, -3.031826, -4,
-3.741881, -3.031826, 4,
-3.741881, -3.031826, -4,
-3.918204, -3.184407, -4,
-3.741881, -3.031826, -2,
-3.918204, -3.184407, -2,
-3.741881, -3.031826, 0,
-3.918204, -3.184407, 0,
-3.741881, -3.031826, 2,
-3.918204, -3.184407, 2,
-3.741881, -3.031826, 4,
-3.918204, -3.184407, 4
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
-4.27085, -3.48957, -4, 0, -0.5, 0.5, 0.5,
-4.27085, -3.48957, -4, 1, -0.5, 0.5, 0.5,
-4.27085, -3.48957, -4, 1, 1.5, 0.5, 0.5,
-4.27085, -3.48957, -4, 0, 1.5, 0.5, 0.5,
-4.27085, -3.48957, -2, 0, -0.5, 0.5, 0.5,
-4.27085, -3.48957, -2, 1, -0.5, 0.5, 0.5,
-4.27085, -3.48957, -2, 1, 1.5, 0.5, 0.5,
-4.27085, -3.48957, -2, 0, 1.5, 0.5, 0.5,
-4.27085, -3.48957, 0, 0, -0.5, 0.5, 0.5,
-4.27085, -3.48957, 0, 1, -0.5, 0.5, 0.5,
-4.27085, -3.48957, 0, 1, 1.5, 0.5, 0.5,
-4.27085, -3.48957, 0, 0, 1.5, 0.5, 0.5,
-4.27085, -3.48957, 2, 0, -0.5, 0.5, 0.5,
-4.27085, -3.48957, 2, 1, -0.5, 0.5, 0.5,
-4.27085, -3.48957, 2, 1, 1.5, 0.5, 0.5,
-4.27085, -3.48957, 2, 0, 1.5, 0.5, 0.5,
-4.27085, -3.48957, 4, 0, -0.5, 0.5, 0.5,
-4.27085, -3.48957, 4, 1, -0.5, 0.5, 0.5,
-4.27085, -3.48957, 4, 1, 1.5, 0.5, 0.5,
-4.27085, -3.48957, 4, 0, 1.5, 0.5, 0.5
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
-3.741881, -3.031826, -5.370046,
-3.741881, 3.071427, -5.370046,
-3.741881, -3.031826, 5.544196,
-3.741881, 3.071427, 5.544196,
-3.741881, -3.031826, -5.370046,
-3.741881, -3.031826, 5.544196,
-3.741881, 3.071427, -5.370046,
-3.741881, 3.071427, 5.544196,
-3.741881, -3.031826, -5.370046,
3.311028, -3.031826, -5.370046,
-3.741881, -3.031826, 5.544196,
3.311028, -3.031826, 5.544196,
-3.741881, 3.071427, -5.370046,
3.311028, 3.071427, -5.370046,
-3.741881, 3.071427, 5.544196,
3.311028, 3.071427, 5.544196,
3.311028, -3.031826, -5.370046,
3.311028, 3.071427, -5.370046,
3.311028, -3.031826, 5.544196,
3.311028, 3.071427, 5.544196,
3.311028, -3.031826, -5.370046,
3.311028, -3.031826, 5.544196,
3.311028, 3.071427, -5.370046,
3.311028, 3.071427, 5.544196
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
var radius = 7.666182;
var distance = 34.10771;
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
mvMatrix.translate( 0.2154264, -0.01980054, -0.087075 );
mvMatrix.scale( 1.175235, 1.3581, 0.7594504 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.10771);
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
desmetryne<-read.table("desmetryne.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-desmetryne$V2
```

```
## Error in eval(expr, envir, enclos): object 'desmetryne' not found
```

```r
y<-desmetryne$V3
```

```
## Error in eval(expr, envir, enclos): object 'desmetryne' not found
```

```r
z<-desmetryne$V4
```

```
## Error in eval(expr, envir, enclos): object 'desmetryne' not found
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
-3.639169, -0.01720243, -1.726384, 0, 0, 1, 1, 1,
-3.060531, 0.5403677, -1.306168, 1, 0, 0, 1, 1,
-3.033378, 0.5745097, -0.9257869, 1, 0, 0, 1, 1,
-2.894897, 0.3422419, -1.466791, 1, 0, 0, 1, 1,
-2.639727, 0.330399, -3.655771, 1, 0, 0, 1, 1,
-2.518137, 0.5844829, 0.2108135, 1, 0, 0, 1, 1,
-2.505415, -1.515053, -1.221684, 0, 0, 0, 1, 1,
-2.449515, 1.06011, -0.8489256, 0, 0, 0, 1, 1,
-2.358495, -0.5968134, -2.079973, 0, 0, 0, 1, 1,
-2.355749, -0.6334991, -0.6934545, 0, 0, 0, 1, 1,
-2.319265, -1.83771, -1.588462, 0, 0, 0, 1, 1,
-2.299444, 0.6712681, -1.981386, 0, 0, 0, 1, 1,
-2.297367, -0.1022133, -1.627265, 0, 0, 0, 1, 1,
-2.291378, 1.696403, -2.964884, 1, 1, 1, 1, 1,
-2.250714, 1.626606, -0.5146681, 1, 1, 1, 1, 1,
-2.193686, -0.1854378, -1.447718, 1, 1, 1, 1, 1,
-2.173736, 1.054719, 0.3851087, 1, 1, 1, 1, 1,
-2.171433, -1.375836, -1.637841, 1, 1, 1, 1, 1,
-2.170753, 0.873708, -1.507425, 1, 1, 1, 1, 1,
-2.137169, -0.9148277, 1.102269, 1, 1, 1, 1, 1,
-2.096369, 0.5525447, 0.05581845, 1, 1, 1, 1, 1,
-2.081887, -0.9132453, -0.6726671, 1, 1, 1, 1, 1,
-2.062932, 0.4234925, -0.9215631, 1, 1, 1, 1, 1,
-2.052162, 0.5493594, -2.686451, 1, 1, 1, 1, 1,
-2.026833, 1.529218, -0.303899, 1, 1, 1, 1, 1,
-2.007692, 0.7380812, -0.7598469, 1, 1, 1, 1, 1,
-1.987621, -1.335801, -3.041271, 1, 1, 1, 1, 1,
-1.965845, -0.5206946, -1.707725, 1, 1, 1, 1, 1,
-1.934595, -0.3425019, -1.06734, 0, 0, 1, 1, 1,
-1.921241, -0.3558715, -0.8896383, 1, 0, 0, 1, 1,
-1.904042, 0.370465, -1.362802, 1, 0, 0, 1, 1,
-1.903738, 0.1161987, -1.00968, 1, 0, 0, 1, 1,
-1.900626, 2.086415, 2.28918, 1, 0, 0, 1, 1,
-1.899485, -0.8616815, -1.577835, 1, 0, 0, 1, 1,
-1.869131, -0.4313033, -4.046287, 0, 0, 0, 1, 1,
-1.868816, 0.3265644, -0.3581494, 0, 0, 0, 1, 1,
-1.854758, -0.7995628, -1.638027, 0, 0, 0, 1, 1,
-1.851323, -0.6445521, -1.357564, 0, 0, 0, 1, 1,
-1.838282, 1.50746, -1.17353, 0, 0, 0, 1, 1,
-1.81496, 1.550673, -1.889259, 0, 0, 0, 1, 1,
-1.806122, 0.8143906, -1.499865, 0, 0, 0, 1, 1,
-1.794185, 0.8964397, -1.692686, 1, 1, 1, 1, 1,
-1.79019, 0.04303315, -1.633851, 1, 1, 1, 1, 1,
-1.788801, 0.7363915, -1.990032, 1, 1, 1, 1, 1,
-1.77714, -0.4091505, -0.6952244, 1, 1, 1, 1, 1,
-1.774408, 0.1327854, -2.170897, 1, 1, 1, 1, 1,
-1.753101, -0.6010684, -1.249694, 1, 1, 1, 1, 1,
-1.750464, -1.53732, -1.216784, 1, 1, 1, 1, 1,
-1.746856, 0.4929785, -2.627322, 1, 1, 1, 1, 1,
-1.745012, 0.3097929, -0.7579809, 1, 1, 1, 1, 1,
-1.724978, 1.382821, -0.3272963, 1, 1, 1, 1, 1,
-1.716645, -0.1697467, -1.121422, 1, 1, 1, 1, 1,
-1.7085, -1.213588, -2.538005, 1, 1, 1, 1, 1,
-1.704857, 0.5158696, -2.034915, 1, 1, 1, 1, 1,
-1.698983, -0.987982, -1.795951, 1, 1, 1, 1, 1,
-1.683291, -0.8195366, -1.059764, 1, 1, 1, 1, 1,
-1.675179, -1.426013, -2.54557, 0, 0, 1, 1, 1,
-1.668388, -0.7184078, -1.916398, 1, 0, 0, 1, 1,
-1.663092, 0.8879042, -1.838693, 1, 0, 0, 1, 1,
-1.658681, 0.7051936, -1.953026, 1, 0, 0, 1, 1,
-1.636441, 1.002448, -1.166328, 1, 0, 0, 1, 1,
-1.631978, 0.3834363, -2.830176, 1, 0, 0, 1, 1,
-1.630045, 1.595159, -2.47045, 0, 0, 0, 1, 1,
-1.621988, -0.9211572, -3.48217, 0, 0, 0, 1, 1,
-1.616637, -0.1619769, -2.412776, 0, 0, 0, 1, 1,
-1.614665, -0.03569643, -1.177846, 0, 0, 0, 1, 1,
-1.613927, -0.1179683, 0.27541, 0, 0, 0, 1, 1,
-1.610137, -0.4721634, -2.55533, 0, 0, 0, 1, 1,
-1.609938, -1.443892, -3.403663, 0, 0, 0, 1, 1,
-1.606817, 1.089749, -1.912471, 1, 1, 1, 1, 1,
-1.604862, 1.246732, 0.5949464, 1, 1, 1, 1, 1,
-1.597287, -0.6932608, -1.167917, 1, 1, 1, 1, 1,
-1.585413, -0.2031367, -2.584161, 1, 1, 1, 1, 1,
-1.57004, -0.2997666, -2.531766, 1, 1, 1, 1, 1,
-1.547359, -0.9466525, -2.830137, 1, 1, 1, 1, 1,
-1.539983, -0.939821, -1.679578, 1, 1, 1, 1, 1,
-1.534387, -0.6392413, -4.52288, 1, 1, 1, 1, 1,
-1.529566, 0.006712064, -2.392488, 1, 1, 1, 1, 1,
-1.5269, -0.1747913, -1.637551, 1, 1, 1, 1, 1,
-1.519444, 0.3689264, -1.584712, 1, 1, 1, 1, 1,
-1.495488, 0.6273052, -0.1651792, 1, 1, 1, 1, 1,
-1.491088, 0.7666119, -0.9391522, 1, 1, 1, 1, 1,
-1.483453, -0.7698739, -1.380237, 1, 1, 1, 1, 1,
-1.46779, 0.7376526, 0.199145, 1, 1, 1, 1, 1,
-1.460257, -1.07058, -3.158109, 0, 0, 1, 1, 1,
-1.458951, -0.7238814, -1.994841, 1, 0, 0, 1, 1,
-1.453145, 0.7428277, -2.208791, 1, 0, 0, 1, 1,
-1.452508, -0.7712855, -1.09606, 1, 0, 0, 1, 1,
-1.448956, 0.3938835, 0.6776869, 1, 0, 0, 1, 1,
-1.443338, -0.6165485, -1.936222, 1, 0, 0, 1, 1,
-1.442536, -0.5683535, -2.643093, 0, 0, 0, 1, 1,
-1.43736, 0.3277209, -1.701115, 0, 0, 0, 1, 1,
-1.434135, -0.8246855, -2.252387, 0, 0, 0, 1, 1,
-1.423482, 0.6401338, -2.749505, 0, 0, 0, 1, 1,
-1.421228, -0.01827925, -0.04937065, 0, 0, 0, 1, 1,
-1.405705, -0.08952331, -2.319693, 0, 0, 0, 1, 1,
-1.399873, 0.9992854, -0.9628435, 0, 0, 0, 1, 1,
-1.396683, 0.7319111, -0.6387593, 1, 1, 1, 1, 1,
-1.390955, 0.9253677, -1.126807, 1, 1, 1, 1, 1,
-1.378282, -1.791326, -2.872108, 1, 1, 1, 1, 1,
-1.37794, 0.5234463, -1.815357, 1, 1, 1, 1, 1,
-1.37306, 2.521522, -0.5122608, 1, 1, 1, 1, 1,
-1.371018, 0.4500213, -1.143678, 1, 1, 1, 1, 1,
-1.362998, 1.666031, -0.9766529, 1, 1, 1, 1, 1,
-1.356231, -1.780648, -0.01776664, 1, 1, 1, 1, 1,
-1.354541, -2.353802, -0.4157758, 1, 1, 1, 1, 1,
-1.348794, -0.8578258, -3.00547, 1, 1, 1, 1, 1,
-1.346559, -0.5451264, -1.578865, 1, 1, 1, 1, 1,
-1.343897, -1.001506, -1.221368, 1, 1, 1, 1, 1,
-1.341686, 0.4987268, 0.0163677, 1, 1, 1, 1, 1,
-1.337805, -1.155832, -3.962307, 1, 1, 1, 1, 1,
-1.332694, -1.085553, -1.333642, 1, 1, 1, 1, 1,
-1.329508, -0.6711659, -3.295712, 0, 0, 1, 1, 1,
-1.322593, -1.213315, -1.891123, 1, 0, 0, 1, 1,
-1.32153, 0.3934827, -1.150067, 1, 0, 0, 1, 1,
-1.318237, 0.2197323, -0.6767306, 1, 0, 0, 1, 1,
-1.301791, -0.3113323, -1.972166, 1, 0, 0, 1, 1,
-1.292945, -0.33053, -1.338956, 1, 0, 0, 1, 1,
-1.29103, -0.5611278, -0.694017, 0, 0, 0, 1, 1,
-1.279595, -0.2694572, -3.23439, 0, 0, 0, 1, 1,
-1.27024, 1.627516, -0.03651986, 0, 0, 0, 1, 1,
-1.266805, -1.152312, -3.006068, 0, 0, 0, 1, 1,
-1.252124, 0.8080801, -0.5796063, 0, 0, 0, 1, 1,
-1.247599, -1.205312, -2.75231, 0, 0, 0, 1, 1,
-1.243029, -0.5940737, -1.737815, 0, 0, 0, 1, 1,
-1.241646, 1.695506, -0.6899616, 1, 1, 1, 1, 1,
-1.237662, 0.224036, -1.757404, 1, 1, 1, 1, 1,
-1.233066, 1.046325, -1.281277, 1, 1, 1, 1, 1,
-1.229476, -0.3786362, -1.126718, 1, 1, 1, 1, 1,
-1.223765, -1.278753, -3.367027, 1, 1, 1, 1, 1,
-1.204872, 1.88564, 0.2278278, 1, 1, 1, 1, 1,
-1.203897, 0.5299853, -0.7889122, 1, 1, 1, 1, 1,
-1.198254, 0.5502964, -0.6140993, 1, 1, 1, 1, 1,
-1.196374, 0.8522668, -0.8940793, 1, 1, 1, 1, 1,
-1.195855, -1.572095, -1.423433, 1, 1, 1, 1, 1,
-1.190087, -0.3335853, -0.7993727, 1, 1, 1, 1, 1,
-1.189284, 1.507977, 0.5862418, 1, 1, 1, 1, 1,
-1.182992, -2.122284, -2.941267, 1, 1, 1, 1, 1,
-1.174631, 0.2784328, 0.2911244, 1, 1, 1, 1, 1,
-1.165922, 0.4019677, -2.542676, 1, 1, 1, 1, 1,
-1.163472, 0.1921609, -1.247511, 0, 0, 1, 1, 1,
-1.147112, 1.069449, -0.3485666, 1, 0, 0, 1, 1,
-1.138807, -0.5452489, -2.708015, 1, 0, 0, 1, 1,
-1.127481, -1.837264, -3.987463, 1, 0, 0, 1, 1,
-1.123964, 2.00314, -0.9568358, 1, 0, 0, 1, 1,
-1.123582, -1.275329, -1.900192, 1, 0, 0, 1, 1,
-1.122832, 0.8247727, -1.384919, 0, 0, 0, 1, 1,
-1.114721, -0.05659818, -1.300558, 0, 0, 0, 1, 1,
-1.109479, -0.3259278, -2.993578, 0, 0, 0, 1, 1,
-1.104108, 0.7271559, 0.7039744, 0, 0, 0, 1, 1,
-1.101601, 1.300598, -2.20156, 0, 0, 0, 1, 1,
-1.097758, 0.9020215, -3.142538, 0, 0, 0, 1, 1,
-1.093487, 0.05831452, -0.2544206, 0, 0, 0, 1, 1,
-1.089828, 0.3684335, -0.98136, 1, 1, 1, 1, 1,
-1.086065, 0.2800618, -0.3751074, 1, 1, 1, 1, 1,
-1.085247, 0.59443, -1.095966, 1, 1, 1, 1, 1,
-1.084719, -0.8382179, -1.159241, 1, 1, 1, 1, 1,
-1.082115, 0.7377753, -0.9550137, 1, 1, 1, 1, 1,
-1.08185, -1.156218, -2.41337, 1, 1, 1, 1, 1,
-1.080925, 1.070984, -0.9134961, 1, 1, 1, 1, 1,
-1.080907, 2.249771, 0.5926482, 1, 1, 1, 1, 1,
-1.074006, 0.7457972, 0.5347129, 1, 1, 1, 1, 1,
-1.07093, 0.0655916, -0.9491751, 1, 1, 1, 1, 1,
-1.069931, 0.6777392, 0.7191392, 1, 1, 1, 1, 1,
-1.069833, 0.4526961, -1.56518, 1, 1, 1, 1, 1,
-1.066489, 1.274, 0.4335541, 1, 1, 1, 1, 1,
-1.065023, -1.88017, -3.069126, 1, 1, 1, 1, 1,
-1.063432, 0.04555216, -0.2084878, 1, 1, 1, 1, 1,
-1.061024, -1.695485, -1.723721, 0, 0, 1, 1, 1,
-1.060593, -0.7452399, -1.308286, 1, 0, 0, 1, 1,
-1.053555, 0.8538043, -1.012151, 1, 0, 0, 1, 1,
-1.047454, 0.1644059, -1.972355, 1, 0, 0, 1, 1,
-1.045451, 0.3547241, -1.091634, 1, 0, 0, 1, 1,
-1.04502, 1.358769, -2.740971, 1, 0, 0, 1, 1,
-1.034843, 0.3529192, -1.457281, 0, 0, 0, 1, 1,
-1.027342, 0.5458193, 0.1243493, 0, 0, 0, 1, 1,
-1.020345, 0.183691, -1.721723, 0, 0, 0, 1, 1,
-1.018998, -0.0752397, -2.125171, 0, 0, 0, 1, 1,
-1.006759, -0.3049119, -1.042371, 0, 0, 0, 1, 1,
-1.005142, 1.01854, -2.002734, 0, 0, 0, 1, 1,
-1.002393, 1.594146, -2.578534, 0, 0, 0, 1, 1,
-1.001198, -1.90937, -3.2186, 1, 1, 1, 1, 1,
-1.000034, 0.1500811, -1.34472, 1, 1, 1, 1, 1,
-0.9994059, -1.618069, -4.214753, 1, 1, 1, 1, 1,
-0.995155, -0.03854172, -1.935244, 1, 1, 1, 1, 1,
-0.9925146, 0.9047609, -0.5533833, 1, 1, 1, 1, 1,
-0.9903157, 0.4218599, -1.025849, 1, 1, 1, 1, 1,
-0.9894958, -0.009475243, -2.033032, 1, 1, 1, 1, 1,
-0.9863751, -1.179588, -3.542858, 1, 1, 1, 1, 1,
-0.9760004, 0.358731, 0.2777124, 1, 1, 1, 1, 1,
-0.9637844, -1.073899, -4.041992, 1, 1, 1, 1, 1,
-0.9519452, -1.12459, -4.511633, 1, 1, 1, 1, 1,
-0.9472875, 0.4222172, -1.31105, 1, 1, 1, 1, 1,
-0.9449083, -0.7707902, -2.139544, 1, 1, 1, 1, 1,
-0.941834, -2.108895, -1.45445, 1, 1, 1, 1, 1,
-0.9398544, 0.630609, -0.7251682, 1, 1, 1, 1, 1,
-0.9385202, 0.7372594, 1.647051, 0, 0, 1, 1, 1,
-0.9381715, 0.06415621, 0.1264852, 1, 0, 0, 1, 1,
-0.9293442, -0.3119221, -2.270742, 1, 0, 0, 1, 1,
-0.9286239, -0.04648531, -2.760463, 1, 0, 0, 1, 1,
-0.9282078, -0.5761188, -0.8873137, 1, 0, 0, 1, 1,
-0.9273586, 0.4552158, -0.2158976, 1, 0, 0, 1, 1,
-0.9239917, 0.8072039, -1.657038, 0, 0, 0, 1, 1,
-0.9188083, 0.8053962, -0.1555477, 0, 0, 0, 1, 1,
-0.9169859, -0.2572072, -1.945529, 0, 0, 0, 1, 1,
-0.9114423, -0.844742, -2.619576, 0, 0, 0, 1, 1,
-0.9096439, 0.7713515, -1.317609, 0, 0, 0, 1, 1,
-0.9092287, 0.4006985, -1.397945, 0, 0, 0, 1, 1,
-0.9041724, 0.4023719, -2.019699, 0, 0, 0, 1, 1,
-0.8914822, 0.8461726, -0.5915653, 1, 1, 1, 1, 1,
-0.8807753, -0.4937076, -2.230403, 1, 1, 1, 1, 1,
-0.8799415, 1.121384, 0.334744, 1, 1, 1, 1, 1,
-0.8744405, -0.4609718, -2.347822, 1, 1, 1, 1, 1,
-0.8740484, 0.3765461, -2.929867, 1, 1, 1, 1, 1,
-0.8701642, 1.146209, -1.834291, 1, 1, 1, 1, 1,
-0.8683518, 0.2594738, -1.88362, 1, 1, 1, 1, 1,
-0.861903, 0.1260281, -1.162646, 1, 1, 1, 1, 1,
-0.8571066, 1.746033, -1.044055, 1, 1, 1, 1, 1,
-0.8549673, 0.3005101, -1.526427, 1, 1, 1, 1, 1,
-0.8547772, 0.4035287, -1.593415, 1, 1, 1, 1, 1,
-0.8534892, -1.183784, -3.399615, 1, 1, 1, 1, 1,
-0.8509465, 1.35717, 0.3258671, 1, 1, 1, 1, 1,
-0.8376186, 1.547965, -0.5861581, 1, 1, 1, 1, 1,
-0.8346633, -0.7807248, -2.522992, 1, 1, 1, 1, 1,
-0.8316163, 0.1841996, -1.754988, 0, 0, 1, 1, 1,
-0.8183212, 0.2514449, -0.4481483, 1, 0, 0, 1, 1,
-0.8152942, -1.473362, -3.766349, 1, 0, 0, 1, 1,
-0.8118244, 0.9472704, -0.5672469, 1, 0, 0, 1, 1,
-0.8074516, 0.01204828, -1.227451, 1, 0, 0, 1, 1,
-0.7993417, -0.03578126, -0.976474, 1, 0, 0, 1, 1,
-0.7992783, 0.2097695, -0.8184234, 0, 0, 0, 1, 1,
-0.7956888, 0.2528694, 0.2486768, 0, 0, 0, 1, 1,
-0.7902865, 1.288296, -1.047855, 0, 0, 0, 1, 1,
-0.7786998, -0.5937888, -3.220297, 0, 0, 0, 1, 1,
-0.7773993, -0.4821579, -1.845947, 0, 0, 0, 1, 1,
-0.7772759, 0.762933, 0.2389195, 0, 0, 0, 1, 1,
-0.7755217, 1.368784, 0.5812579, 0, 0, 0, 1, 1,
-0.7682021, -0.6910428, -1.489884, 1, 1, 1, 1, 1,
-0.7614558, -0.3965228, -0.9193347, 1, 1, 1, 1, 1,
-0.7609424, 1.019899, 1.189295, 1, 1, 1, 1, 1,
-0.7600201, -0.1456407, -3.137424, 1, 1, 1, 1, 1,
-0.7576116, 1.078913, 1.231202, 1, 1, 1, 1, 1,
-0.7513273, 0.9488699, -1.951239, 1, 1, 1, 1, 1,
-0.7459542, -0.369198, -1.700125, 1, 1, 1, 1, 1,
-0.7452239, 2.044694, -1.588813, 1, 1, 1, 1, 1,
-0.7421175, 0.4890772, -0.7018754, 1, 1, 1, 1, 1,
-0.7409796, -1.006683, -3.87708, 1, 1, 1, 1, 1,
-0.7387605, 0.2528183, -0.3627108, 1, 1, 1, 1, 1,
-0.7386891, -0.2685055, -1.960809, 1, 1, 1, 1, 1,
-0.7366377, 0.870437, -3.705258, 1, 1, 1, 1, 1,
-0.7306758, -0.1242896, -1.853925, 1, 1, 1, 1, 1,
-0.7295981, 1.562393, 0.151672, 1, 1, 1, 1, 1,
-0.7281789, -0.2067451, -1.212843, 0, 0, 1, 1, 1,
-0.7256262, 0.6399555, -0.272424, 1, 0, 0, 1, 1,
-0.72454, -0.2747358, -3.45712, 1, 0, 0, 1, 1,
-0.7210769, 1.639252, 1.067621, 1, 0, 0, 1, 1,
-0.7196609, -1.669748, -2.901545, 1, 0, 0, 1, 1,
-0.7149939, -0.1260889, -1.581328, 1, 0, 0, 1, 1,
-0.7145554, -0.4184856, -3.383836, 0, 0, 0, 1, 1,
-0.7119246, 0.4773497, -0.7013485, 0, 0, 0, 1, 1,
-0.7114299, -0.1379918, -2.146079, 0, 0, 0, 1, 1,
-0.7046167, 0.5576841, -1.277975, 0, 0, 0, 1, 1,
-0.7044767, 0.5234537, 0.5012548, 0, 0, 0, 1, 1,
-0.6980499, -0.6524771, -2.069805, 0, 0, 0, 1, 1,
-0.6959001, -0.284338, -2.133198, 0, 0, 0, 1, 1,
-0.6944119, 0.1731041, -0.2726542, 1, 1, 1, 1, 1,
-0.6931724, -1.211949, -3.677491, 1, 1, 1, 1, 1,
-0.6872246, 0.7398826, -0.5748382, 1, 1, 1, 1, 1,
-0.6825571, -0.02867004, -1.037906, 1, 1, 1, 1, 1,
-0.680407, 0.07173276, -1.269722, 1, 1, 1, 1, 1,
-0.6709073, 0.3374104, -0.5325129, 1, 1, 1, 1, 1,
-0.6634157, 0.05566007, -0.161219, 1, 1, 1, 1, 1,
-0.6618, 0.1428398, -1.422146, 1, 1, 1, 1, 1,
-0.6610346, -0.3920085, -1.988428, 1, 1, 1, 1, 1,
-0.6580465, 0.05031417, -1.038362, 1, 1, 1, 1, 1,
-0.6563251, -0.7496598, -2.454112, 1, 1, 1, 1, 1,
-0.6522201, 1.500633, -0.6188387, 1, 1, 1, 1, 1,
-0.6516682, 0.6707301, -0.7964463, 1, 1, 1, 1, 1,
-0.6514755, 0.1393793, -1.396456, 1, 1, 1, 1, 1,
-0.6461061, 0.5296646, -0.9301812, 1, 1, 1, 1, 1,
-0.6446356, -0.5318356, 0.3071846, 0, 0, 1, 1, 1,
-0.6416986, 1.196026, 0.6492047, 1, 0, 0, 1, 1,
-0.6300293, 0.6239265, -1.788617, 1, 0, 0, 1, 1,
-0.6282081, -0.2722554, -0.809885, 1, 0, 0, 1, 1,
-0.6245005, -0.9900462, -2.624145, 1, 0, 0, 1, 1,
-0.6226255, -1.805313, -1.159553, 1, 0, 0, 1, 1,
-0.6226084, 0.9783067, -2.652838, 0, 0, 0, 1, 1,
-0.6206344, -0.3317405, -3.826743, 0, 0, 0, 1, 1,
-0.6156335, -0.3262596, -1.623505, 0, 0, 0, 1, 1,
-0.6136907, -0.8488806, -2.819179, 0, 0, 0, 1, 1,
-0.6083803, -0.202622, -3.490844, 0, 0, 0, 1, 1,
-0.605703, -0.1966698, -1.999184, 0, 0, 0, 1, 1,
-0.5988926, 0.6390343, -1.278204, 0, 0, 0, 1, 1,
-0.5939419, 1.303429, -0.6566464, 1, 1, 1, 1, 1,
-0.5845367, 1.410323, 0.6898341, 1, 1, 1, 1, 1,
-0.5832723, 1.122065, -0.4221783, 1, 1, 1, 1, 1,
-0.5826881, 0.1084679, -1.972922, 1, 1, 1, 1, 1,
-0.5790657, -0.1133433, -4.063051, 1, 1, 1, 1, 1,
-0.5747893, 0.6883807, 0.7551422, 1, 1, 1, 1, 1,
-0.5746157, 1.337266, 0.572589, 1, 1, 1, 1, 1,
-0.5728431, 1.767261, -1.149557, 1, 1, 1, 1, 1,
-0.5719474, 0.4591837, 0.5005784, 1, 1, 1, 1, 1,
-0.5684222, -0.6114908, -3.024232, 1, 1, 1, 1, 1,
-0.567283, 0.225389, -2.171354, 1, 1, 1, 1, 1,
-0.5623822, 0.4783886, 0.02796254, 1, 1, 1, 1, 1,
-0.5569423, 2.190021, -1.172256, 1, 1, 1, 1, 1,
-0.5560124, -0.7975149, -2.54682, 1, 1, 1, 1, 1,
-0.5555155, 0.4965625, -3.055021, 1, 1, 1, 1, 1,
-0.5515797, 1.290529, -1.2933, 0, 0, 1, 1, 1,
-0.5481395, 0.1061231, -1.948669, 1, 0, 0, 1, 1,
-0.5459626, -0.6123876, -3.411369, 1, 0, 0, 1, 1,
-0.5448838, 1.150983, 2.119255, 1, 0, 0, 1, 1,
-0.5442103, -1.395095, -2.653318, 1, 0, 0, 1, 1,
-0.5433213, -0.2476985, -1.753851, 1, 0, 0, 1, 1,
-0.5419264, -0.1368192, -1.355492, 0, 0, 0, 1, 1,
-0.5412556, -0.4158183, -2.889264, 0, 0, 0, 1, 1,
-0.5364896, 0.4455675, -0.6202465, 0, 0, 0, 1, 1,
-0.5252644, 1.084945, -0.7332317, 0, 0, 0, 1, 1,
-0.5230434, -0.3498113, -2.191199, 0, 0, 0, 1, 1,
-0.5215854, 0.1369058, -0.5646356, 0, 0, 0, 1, 1,
-0.5058811, -0.9160838, -3.317389, 0, 0, 0, 1, 1,
-0.50583, 1.370113, -1.611638, 1, 1, 1, 1, 1,
-0.5049182, 1.076712, -1.354241, 1, 1, 1, 1, 1,
-0.5012552, -0.8306001, -2.221833, 1, 1, 1, 1, 1,
-0.4984869, -1.650272, -2.261059, 1, 1, 1, 1, 1,
-0.4970101, 0.1002941, -1.442263, 1, 1, 1, 1, 1,
-0.4959698, 0.3945851, 1.572191, 1, 1, 1, 1, 1,
-0.4949478, -0.7635568, -3.450071, 1, 1, 1, 1, 1,
-0.4944065, -0.4554592, -1.552308, 1, 1, 1, 1, 1,
-0.493708, 0.3569004, -1.892728, 1, 1, 1, 1, 1,
-0.4916425, 0.3754556, -0.2307092, 1, 1, 1, 1, 1,
-0.4912133, 0.01391081, -2.002884, 1, 1, 1, 1, 1,
-0.4910553, -0.2516022, -1.559885, 1, 1, 1, 1, 1,
-0.4910045, -0.108472, -1.847383, 1, 1, 1, 1, 1,
-0.4899376, -0.5001626, -2.113543, 1, 1, 1, 1, 1,
-0.4895704, -0.5622923, -1.338164, 1, 1, 1, 1, 1,
-0.4861144, 0.630676, 0.3813822, 0, 0, 1, 1, 1,
-0.4788195, 0.9161376, 0.5353736, 1, 0, 0, 1, 1,
-0.4692262, 0.6569739, -0.5734684, 1, 0, 0, 1, 1,
-0.4683795, 0.7977982, -1.267023, 1, 0, 0, 1, 1,
-0.4682541, -1.259002, -4.82495, 1, 0, 0, 1, 1,
-0.4625223, -1.33528, -2.848945, 1, 0, 0, 1, 1,
-0.4615637, 1.482602, -1.788905, 0, 0, 0, 1, 1,
-0.4601973, -0.6594586, -1.187648, 0, 0, 0, 1, 1,
-0.4595957, 0.9434658, 0.0802466, 0, 0, 0, 1, 1,
-0.4585266, 1.994598, -2.309348, 0, 0, 0, 1, 1,
-0.4577093, -0.07055611, -1.392305, 0, 0, 0, 1, 1,
-0.4564644, 0.611416, -0.7000946, 0, 0, 0, 1, 1,
-0.4550717, 0.1897286, -1.844898, 0, 0, 0, 1, 1,
-0.4548931, -0.2047915, -1.341365, 1, 1, 1, 1, 1,
-0.4471171, 0.6226398, -1.000443, 1, 1, 1, 1, 1,
-0.4439202, -0.7271785, -2.028062, 1, 1, 1, 1, 1,
-0.4435564, -0.2074415, -3.160934, 1, 1, 1, 1, 1,
-0.4408689, -1.099788, -4.228536, 1, 1, 1, 1, 1,
-0.4366011, -0.1609804, -1.44238, 1, 1, 1, 1, 1,
-0.4350972, 1.218122, -0.9555584, 1, 1, 1, 1, 1,
-0.4349588, 1.418968, -0.2080074, 1, 1, 1, 1, 1,
-0.4348642, 0.2681071, -1.772157, 1, 1, 1, 1, 1,
-0.428835, -0.1933262, -3.434598, 1, 1, 1, 1, 1,
-0.4274465, -1.632337, -3.033244, 1, 1, 1, 1, 1,
-0.4263063, -0.09691813, 0.1462812, 1, 1, 1, 1, 1,
-0.4193377, -0.5386136, -1.238613, 1, 1, 1, 1, 1,
-0.4180437, 0.6314204, -0.4869063, 1, 1, 1, 1, 1,
-0.4151478, -0.880284, -3.254938, 1, 1, 1, 1, 1,
-0.4139351, 1.818167, 0.4134635, 0, 0, 1, 1, 1,
-0.4134049, -1.656864, -1.138861, 1, 0, 0, 1, 1,
-0.4107768, 0.9336807, -1.40461, 1, 0, 0, 1, 1,
-0.4072741, 0.1445968, 0.001153125, 1, 0, 0, 1, 1,
-0.4072722, 0.1015828, -0.6506432, 1, 0, 0, 1, 1,
-0.4063754, -0.9135527, -3.366149, 1, 0, 0, 1, 1,
-0.4039738, -1.825252, -3.45851, 0, 0, 0, 1, 1,
-0.4007123, -1.714529, -2.394141, 0, 0, 0, 1, 1,
-0.3915517, 0.7813295, -0.7504553, 0, 0, 0, 1, 1,
-0.3869928, 0.7295871, -0.5267065, 0, 0, 0, 1, 1,
-0.384597, 0.3760138, -0.7755172, 0, 0, 0, 1, 1,
-0.3840883, 1.918136, 0.607551, 0, 0, 0, 1, 1,
-0.382305, -1.226643, -2.486686, 0, 0, 0, 1, 1,
-0.3781461, -1.818206, -3.091132, 1, 1, 1, 1, 1,
-0.3701286, 0.4272331, 0.6358542, 1, 1, 1, 1, 1,
-0.3687941, 0.279294, -0.0230434, 1, 1, 1, 1, 1,
-0.3681176, 0.4669228, -1.5016, 1, 1, 1, 1, 1,
-0.3653002, -1.437675, 0.01437643, 1, 1, 1, 1, 1,
-0.3633337, 1.407589, -1.938059, 1, 1, 1, 1, 1,
-0.3632896, -0.4685292, -2.371703, 1, 1, 1, 1, 1,
-0.3630708, -1.847045, -2.002512, 1, 1, 1, 1, 1,
-0.3627003, 0.4131029, -0.6469695, 1, 1, 1, 1, 1,
-0.362468, -1.012371, -3.136513, 1, 1, 1, 1, 1,
-0.3538076, -1.159216, -2.533493, 1, 1, 1, 1, 1,
-0.3514717, -0.01847812, -1.214988, 1, 1, 1, 1, 1,
-0.3512255, 0.7902205, -0.09198876, 1, 1, 1, 1, 1,
-0.3442391, -0.8790041, -2.653566, 1, 1, 1, 1, 1,
-0.343593, -0.5516826, -1.021995, 1, 1, 1, 1, 1,
-0.3362522, 1.430827, -0.5631715, 0, 0, 1, 1, 1,
-0.3336644, 0.1875357, -1.869986, 1, 0, 0, 1, 1,
-0.3334489, 0.5624186, -0.5011778, 1, 0, 0, 1, 1,
-0.3318061, 2.397746, 0.04019972, 1, 0, 0, 1, 1,
-0.3286442, -1.196799, -1.802544, 1, 0, 0, 1, 1,
-0.3256065, -0.7857041, -2.334294, 1, 0, 0, 1, 1,
-0.3235807, -0.620898, -2.587632, 0, 0, 0, 1, 1,
-0.3228236, 0.563298, 0.7089318, 0, 0, 0, 1, 1,
-0.319609, 0.2810688, 0.6631014, 0, 0, 0, 1, 1,
-0.3175117, -0.07009857, -1.096284, 0, 0, 0, 1, 1,
-0.3147993, -0.5129526, -2.248662, 0, 0, 0, 1, 1,
-0.3100159, 0.4763862, 0.2595837, 0, 0, 0, 1, 1,
-0.3047018, -0.9518186, -4.357128, 0, 0, 0, 1, 1,
-0.3020758, 1.344873, -0.006980554, 1, 1, 1, 1, 1,
-0.3017903, 0.1502481, 0.2696667, 1, 1, 1, 1, 1,
-0.2909859, -0.9341916, -1.306277, 1, 1, 1, 1, 1,
-0.2894067, 0.6756384, 0.1807204, 1, 1, 1, 1, 1,
-0.288885, 0.4171129, -0.6048919, 1, 1, 1, 1, 1,
-0.2879654, 0.8457438, -1.067309, 1, 1, 1, 1, 1,
-0.2875998, 0.4569887, -1.182435, 1, 1, 1, 1, 1,
-0.28526, -0.171121, -1.802472, 1, 1, 1, 1, 1,
-0.2846875, -0.5843023, -3.303932, 1, 1, 1, 1, 1,
-0.2823607, 1.074403, -0.3787096, 1, 1, 1, 1, 1,
-0.2821653, 1.195572, 1.105486, 1, 1, 1, 1, 1,
-0.2802133, 0.1288457, 0.5481088, 1, 1, 1, 1, 1,
-0.2797827, 0.6147099, -0.3187459, 1, 1, 1, 1, 1,
-0.2787678, 0.8077373, 1.89459, 1, 1, 1, 1, 1,
-0.2773453, -0.1247906, -3.60281, 1, 1, 1, 1, 1,
-0.2772215, 0.4902099, -0.3357452, 0, 0, 1, 1, 1,
-0.2732514, 0.5535622, -0.3858741, 1, 0, 0, 1, 1,
-0.270791, 0.5847855, 0.8689472, 1, 0, 0, 1, 1,
-0.2706213, 1.535597, 1.027715, 1, 0, 0, 1, 1,
-0.2631806, -1.770658, -2.738026, 1, 0, 0, 1, 1,
-0.2615874, -0.4347852, -3.190174, 1, 0, 0, 1, 1,
-0.2603691, 0.630321, 0.6672352, 0, 0, 0, 1, 1,
-0.2578911, -1.487115, -3.052294, 0, 0, 0, 1, 1,
-0.2483605, -0.2510048, -3.335682, 0, 0, 0, 1, 1,
-0.2451262, 0.7322084, -1.453562, 0, 0, 0, 1, 1,
-0.2438791, -0.1527288, -0.6825781, 0, 0, 0, 1, 1,
-0.2406766, 0.3362654, 0.02153678, 0, 0, 0, 1, 1,
-0.2393213, -0.5471988, -2.362185, 0, 0, 0, 1, 1,
-0.2391401, -0.9620953, -4.50422, 1, 1, 1, 1, 1,
-0.2357498, 0.3556944, 1.156473, 1, 1, 1, 1, 1,
-0.23528, -0.626474, -2.270579, 1, 1, 1, 1, 1,
-0.2336841, 0.1661072, -1.149811, 1, 1, 1, 1, 1,
-0.2322768, -1.967493, -4.512539, 1, 1, 1, 1, 1,
-0.2307366, 0.8773738, -1.581242, 1, 1, 1, 1, 1,
-0.2295787, 0.9340808, 1.374727, 1, 1, 1, 1, 1,
-0.2282066, -0.8146393, -1.256128, 1, 1, 1, 1, 1,
-0.2258704, -0.6929072, -3.429202, 1, 1, 1, 1, 1,
-0.2247493, -1.45731, -3.565189, 1, 1, 1, 1, 1,
-0.2206852, 1.110489, 1.162986, 1, 1, 1, 1, 1,
-0.2201722, -0.2336116, -2.485383, 1, 1, 1, 1, 1,
-0.2194492, -0.4501416, -1.205091, 1, 1, 1, 1, 1,
-0.2184462, 0.3501687, -0.6241585, 1, 1, 1, 1, 1,
-0.2151594, 0.5702131, -0.1390115, 1, 1, 1, 1, 1,
-0.206567, 0.8074645, -1.487201, 0, 0, 1, 1, 1,
-0.2034126, 1.0997, -1.158891, 1, 0, 0, 1, 1,
-0.1938862, -0.7209479, -4.364198, 1, 0, 0, 1, 1,
-0.1839926, 0.5640555, 0.09434178, 1, 0, 0, 1, 1,
-0.1838006, 0.9257935, 0.5351102, 1, 0, 0, 1, 1,
-0.175427, -0.8793492, -4.283628, 1, 0, 0, 1, 1,
-0.1688163, -0.6616857, -2.553345, 0, 0, 0, 1, 1,
-0.1684975, 0.3067169, -1.772406, 0, 0, 0, 1, 1,
-0.167361, -0.6262829, -2.893595, 0, 0, 0, 1, 1,
-0.1649295, -0.7042373, -3.518514, 0, 0, 0, 1, 1,
-0.163676, -0.7637569, -3.649324, 0, 0, 0, 1, 1,
-0.1633221, 1.098012, 0.7193727, 0, 0, 0, 1, 1,
-0.1624184, -0.569153, -0.5862616, 0, 0, 0, 1, 1,
-0.1615837, -1.747074, -3.017173, 1, 1, 1, 1, 1,
-0.1609599, -0.5062951, -4.483181, 1, 1, 1, 1, 1,
-0.1608659, 1.057001, 0.4670189, 1, 1, 1, 1, 1,
-0.1537061, -2.131697, -3.073622, 1, 1, 1, 1, 1,
-0.1510005, -0.01548308, -1.961683, 1, 1, 1, 1, 1,
-0.149391, 0.14367, -1.378801, 1, 1, 1, 1, 1,
-0.1483159, -1.760554, -4.567503, 1, 1, 1, 1, 1,
-0.1469041, -0.5624308, -3.42835, 1, 1, 1, 1, 1,
-0.1458405, 1.039252, -0.6561261, 1, 1, 1, 1, 1,
-0.1454503, -1.895528, -3.708853, 1, 1, 1, 1, 1,
-0.1442014, 0.6726193, -0.7011955, 1, 1, 1, 1, 1,
-0.1356103, 1.159814, -0.7704121, 1, 1, 1, 1, 1,
-0.1335329, -1.700148, -2.04366, 1, 1, 1, 1, 1,
-0.1315851, 0.182034, 1.522665, 1, 1, 1, 1, 1,
-0.1284082, -0.509323, -5.211101, 1, 1, 1, 1, 1,
-0.1244342, -1.258073, -1.996458, 0, 0, 1, 1, 1,
-0.1240146, 0.2776675, -1.170314, 1, 0, 0, 1, 1,
-0.122574, 0.189484, -0.6185756, 1, 0, 0, 1, 1,
-0.1222462, -0.1286846, -0.4260757, 1, 0, 0, 1, 1,
-0.1197946, -1.857226, -3.728265, 1, 0, 0, 1, 1,
-0.1192428, -1.4614, -1.634804, 1, 0, 0, 1, 1,
-0.1185063, -1.215851, -3.062518, 0, 0, 0, 1, 1,
-0.1168836, 0.6954756, -1.375842, 0, 0, 0, 1, 1,
-0.1163715, -0.0701877, -2.54605, 0, 0, 0, 1, 1,
-0.1154453, -0.3244407, -2.418811, 0, 0, 0, 1, 1,
-0.1139073, -1.077404, -1.813787, 0, 0, 0, 1, 1,
-0.1112518, 0.1721839, 0.6303409, 0, 0, 0, 1, 1,
-0.1051549, -1.878501, -4.007215, 0, 0, 0, 1, 1,
-0.1029318, 1.271966, -0.02817438, 1, 1, 1, 1, 1,
-0.09535278, -2.388656, -3.703939, 1, 1, 1, 1, 1,
-0.09521957, -0.1648073, -2.095202, 1, 1, 1, 1, 1,
-0.09280737, -0.1057447, -2.090751, 1, 1, 1, 1, 1,
-0.09250253, 0.4334202, -1.375798, 1, 1, 1, 1, 1,
-0.08990002, 0.4705733, 1.331604, 1, 1, 1, 1, 1,
-0.08982972, -0.08566196, -3.307329, 1, 1, 1, 1, 1,
-0.08766239, 0.5934802, 0.8448544, 1, 1, 1, 1, 1,
-0.08756889, -0.3911003, -3.369457, 1, 1, 1, 1, 1,
-0.08636986, 0.4853607, -1.079076, 1, 1, 1, 1, 1,
-0.0854372, -0.7201827, -4.134984, 1, 1, 1, 1, 1,
-0.08498906, 0.7854335, 1.135192, 1, 1, 1, 1, 1,
-0.07957207, 0.8073512, -0.9096566, 1, 1, 1, 1, 1,
-0.07634776, -1.729168, -1.930411, 1, 1, 1, 1, 1,
-0.07606267, -0.1757536, -2.623853, 1, 1, 1, 1, 1,
-0.06973042, 0.2029542, 0.364655, 0, 0, 1, 1, 1,
-0.06733027, 0.845583, 0.4075519, 1, 0, 0, 1, 1,
-0.06628704, 0.1245353, -1.457002, 1, 0, 0, 1, 1,
-0.06628019, 0.1248805, 0.6107372, 1, 0, 0, 1, 1,
-0.06252592, -0.1953001, -3.362403, 1, 0, 0, 1, 1,
-0.05808156, 0.2534518, -1.296219, 1, 0, 0, 1, 1,
-0.05567317, 0.1092292, -2.705347, 0, 0, 0, 1, 1,
-0.05519525, 0.8177153, 0.7195886, 0, 0, 0, 1, 1,
-0.05363009, 0.248962, 1.435742, 0, 0, 0, 1, 1,
-0.05102263, -0.3962876, -3.563028, 0, 0, 0, 1, 1,
-0.05024893, -0.003744304, -1.848244, 0, 0, 0, 1, 1,
-0.04725603, 0.6023163, -0.14552, 0, 0, 0, 1, 1,
-0.04361908, 0.06898928, -0.2484329, 0, 0, 0, 1, 1,
-0.03980482, -1.213407, -2.427857, 1, 1, 1, 1, 1,
-0.03310968, 1.038825, -0.8113319, 1, 1, 1, 1, 1,
-0.03274586, 0.7026354, -1.101796, 1, 1, 1, 1, 1,
-0.02465578, 0.313015, 1.471833, 1, 1, 1, 1, 1,
-0.02293494, 0.8559829, 0.671374, 1, 1, 1, 1, 1,
-0.02291914, -1.674018, -2.611828, 1, 1, 1, 1, 1,
-0.01409415, -0.1687683, -3.217531, 1, 1, 1, 1, 1,
-0.003835837, 0.3527825, 0.04939778, 1, 1, 1, 1, 1,
-0.0006600706, -0.06351364, -2.45052, 1, 1, 1, 1, 1,
0.001325352, 0.2477721, 0.441161, 1, 1, 1, 1, 1,
0.001856554, 1.544287, 0.3552936, 1, 1, 1, 1, 1,
0.002980398, -1.441908, 0.8202937, 1, 1, 1, 1, 1,
0.004373504, 0.3528036, -0.1818801, 1, 1, 1, 1, 1,
0.004742877, 2.009018, -1.304412, 1, 1, 1, 1, 1,
0.008355866, 0.9456096, 1.232037, 1, 1, 1, 1, 1,
0.009971483, 1.50997, -1.603806, 0, 0, 1, 1, 1,
0.0153513, 0.1375522, -0.3438309, 1, 0, 0, 1, 1,
0.01654804, 1.470196, 0.8717236, 1, 0, 0, 1, 1,
0.02019624, 0.1708175, -0.799242, 1, 0, 0, 1, 1,
0.02082997, -0.4819165, 4.229639, 1, 0, 0, 1, 1,
0.02098044, 0.2942687, 0.187025, 1, 0, 0, 1, 1,
0.02448773, 0.830461, -0.2121882, 0, 0, 0, 1, 1,
0.02893333, -0.02962257, 3.670873, 0, 0, 0, 1, 1,
0.03313917, 0.8036253, -0.4629254, 0, 0, 0, 1, 1,
0.03583175, -0.06223606, 2.91272, 0, 0, 0, 1, 1,
0.03951862, 1.468001, -0.2724156, 0, 0, 0, 1, 1,
0.03993024, 1.745174, -0.8430067, 0, 0, 0, 1, 1,
0.04328382, -1.501678, 2.053125, 0, 0, 0, 1, 1,
0.05327662, -1.004403, 0.4683216, 1, 1, 1, 1, 1,
0.05527508, -0.184544, 3.63858, 1, 1, 1, 1, 1,
0.0622016, 1.426432, -0.1008959, 1, 1, 1, 1, 1,
0.06240527, -0.05730111, 2.903938, 1, 1, 1, 1, 1,
0.06798785, 2.201424, 0.1298288, 1, 1, 1, 1, 1,
0.08059217, -0.08881666, 1.907149, 1, 1, 1, 1, 1,
0.08121803, -0.7226095, 3.596627, 1, 1, 1, 1, 1,
0.08245406, 0.06433494, 1.199147, 1, 1, 1, 1, 1,
0.08829334, 2.344692, 0.339553, 1, 1, 1, 1, 1,
0.09142044, -1.119562, 3.502846, 1, 1, 1, 1, 1,
0.0919157, -0.9854399, 3.768248, 1, 1, 1, 1, 1,
0.09305666, 1.590232, -1.762008, 1, 1, 1, 1, 1,
0.0953633, 0.6119885, -0.8245323, 1, 1, 1, 1, 1,
0.09627796, -1.26139, 3.66611, 1, 1, 1, 1, 1,
0.09658418, 0.6705854, 0.5145579, 1, 1, 1, 1, 1,
0.09676494, 1.968305, 0.35417, 0, 0, 1, 1, 1,
0.09882181, -0.6739032, 3.861079, 1, 0, 0, 1, 1,
0.09976377, -0.7418637, 2.783838, 1, 0, 0, 1, 1,
0.1038226, -1.654711, 3.764663, 1, 0, 0, 1, 1,
0.1056828, -0.2997169, 2.228789, 1, 0, 0, 1, 1,
0.1124307, -0.1366266, 2.79528, 1, 0, 0, 1, 1,
0.1134076, -1.392413, 3.565651, 0, 0, 0, 1, 1,
0.1220004, 0.5900011, -0.6663672, 0, 0, 0, 1, 1,
0.124314, -1.865093, 1.967305, 0, 0, 0, 1, 1,
0.1250411, -0.6219193, 1.843089, 0, 0, 0, 1, 1,
0.1287329, -0.9306665, 3.659776, 0, 0, 0, 1, 1,
0.1294898, 0.7635542, -1.403016, 0, 0, 0, 1, 1,
0.1334109, -0.8403392, 3.067539, 0, 0, 0, 1, 1,
0.1343094, 0.6564879, 0.1215364, 1, 1, 1, 1, 1,
0.1370156, 0.741847, 0.5177938, 1, 1, 1, 1, 1,
0.1396365, -0.06942637, 1.708191, 1, 1, 1, 1, 1,
0.1411441, -0.4425554, -0.07735756, 1, 1, 1, 1, 1,
0.1442315, 0.4272501, -1.527879, 1, 1, 1, 1, 1,
0.1461522, -0.00619848, 1.46556, 1, 1, 1, 1, 1,
0.146219, -1.156599, 3.948654, 1, 1, 1, 1, 1,
0.1571614, 0.4733773, 0.6662487, 1, 1, 1, 1, 1,
0.1585113, -0.2481064, 1.124917, 1, 1, 1, 1, 1,
0.1585536, -1.146792, 3.462217, 1, 1, 1, 1, 1,
0.159626, 0.7399591, 1.322798, 1, 1, 1, 1, 1,
0.1662755, -0.05152103, 3.386698, 1, 1, 1, 1, 1,
0.169476, 0.9427121, -0.766447, 1, 1, 1, 1, 1,
0.1711009, 1.140202, 0.4698168, 1, 1, 1, 1, 1,
0.1723188, -1.637999, 3.001614, 1, 1, 1, 1, 1,
0.1724054, 0.441125, 0.35668, 0, 0, 1, 1, 1,
0.1756272, -1.162342, 4.018007, 1, 0, 0, 1, 1,
0.1784788, 1.436274, 0.2656816, 1, 0, 0, 1, 1,
0.179401, 0.9878539, 0.6976262, 1, 0, 0, 1, 1,
0.1799932, -0.8207676, 3.301108, 1, 0, 0, 1, 1,
0.1800269, 1.692525, 2.336105, 1, 0, 0, 1, 1,
0.1822551, 0.5925713, 1.050202, 0, 0, 0, 1, 1,
0.183599, 0.4966919, 1.306412, 0, 0, 0, 1, 1,
0.1896418, -0.2861752, 2.27866, 0, 0, 0, 1, 1,
0.1942297, 0.2214606, 1.839859, 0, 0, 0, 1, 1,
0.198431, -0.9088256, 3.774368, 0, 0, 0, 1, 1,
0.2089003, 1.866956, -1.322263, 0, 0, 0, 1, 1,
0.2155715, 1.372448, -0.06012869, 0, 0, 0, 1, 1,
0.2177396, 0.3242531, 0.134051, 1, 1, 1, 1, 1,
0.2183326, -0.03016476, 1.999589, 1, 1, 1, 1, 1,
0.2234419, 2.146545, -0.1229055, 1, 1, 1, 1, 1,
0.2250685, 2.316853, -1.214955, 1, 1, 1, 1, 1,
0.2262425, 1.024088, -0.643068, 1, 1, 1, 1, 1,
0.2314145, 1.366298, -1.365993, 1, 1, 1, 1, 1,
0.2322459, -1.383621, 2.742253, 1, 1, 1, 1, 1,
0.2334733, -0.6399743, 2.858829, 1, 1, 1, 1, 1,
0.2357107, -0.8841707, 1.506156, 1, 1, 1, 1, 1,
0.2372914, 0.685572, -0.1182846, 1, 1, 1, 1, 1,
0.2387281, 0.811097, -0.6248551, 1, 1, 1, 1, 1,
0.2392486, 1.021636, 0.05179086, 1, 1, 1, 1, 1,
0.2407032, -0.5322348, 2.711084, 1, 1, 1, 1, 1,
0.2456019, 1.491487, 0.00571682, 1, 1, 1, 1, 1,
0.2480282, -0.3788908, 0.8859133, 1, 1, 1, 1, 1,
0.2497818, 0.3705519, 0.1564027, 0, 0, 1, 1, 1,
0.2506501, 0.2785446, 0.3928881, 1, 0, 0, 1, 1,
0.2536933, 0.327896, -1.37011, 1, 0, 0, 1, 1,
0.2546156, -1.234067, 4.40105, 1, 0, 0, 1, 1,
0.2589531, 0.4824123, 0.284152, 1, 0, 0, 1, 1,
0.2651036, 0.3749081, -0.03922221, 1, 0, 0, 1, 1,
0.2671371, 0.9380921, 1.129302, 0, 0, 0, 1, 1,
0.270899, -0.1178845, 1.051361, 0, 0, 0, 1, 1,
0.2728293, -0.2243484, 3.228985, 0, 0, 0, 1, 1,
0.2739821, -1.288981, 4.334888, 0, 0, 0, 1, 1,
0.2790436, -1.77742, 2.220573, 0, 0, 0, 1, 1,
0.2890181, 0.4793188, -0.5867931, 0, 0, 0, 1, 1,
0.2942897, -1.528157, 2.329404, 0, 0, 0, 1, 1,
0.2958129, -1.018015, 0.9088289, 1, 1, 1, 1, 1,
0.2961009, 0.7860532, -0.8643661, 1, 1, 1, 1, 1,
0.2983947, 0.8920132, 1.43468, 1, 1, 1, 1, 1,
0.3015111, 0.957597, 2.230371, 1, 1, 1, 1, 1,
0.3019855, 0.2945663, 1.891784, 1, 1, 1, 1, 1,
0.3076123, -0.01082558, 1.931893, 1, 1, 1, 1, 1,
0.3095479, -0.1689173, 0.8181098, 1, 1, 1, 1, 1,
0.3133011, 1.331677, 1.190659, 1, 1, 1, 1, 1,
0.314999, -0.5884236, 2.432177, 1, 1, 1, 1, 1,
0.3204843, -0.9177657, 4.007004, 1, 1, 1, 1, 1,
0.321696, 1.204719, 1.523372, 1, 1, 1, 1, 1,
0.3224274, -0.05433008, 2.159333, 1, 1, 1, 1, 1,
0.3227537, 1.340245, 1.417141, 1, 1, 1, 1, 1,
0.329261, 0.1813082, -0.008823161, 1, 1, 1, 1, 1,
0.3337517, -1.822146, 1.783991, 1, 1, 1, 1, 1,
0.3343793, 0.3092151, 1.424961, 0, 0, 1, 1, 1,
0.3361456, -1.043855, 1.652979, 1, 0, 0, 1, 1,
0.3362455, 1.545087, 0.68532, 1, 0, 0, 1, 1,
0.3436275, 0.01709419, 1.065015, 1, 0, 0, 1, 1,
0.3439784, 0.2121293, 2.545284, 1, 0, 0, 1, 1,
0.3450218, 0.03571445, 1.506892, 1, 0, 0, 1, 1,
0.3469089, 0.1048552, 0.9430673, 0, 0, 0, 1, 1,
0.3543638, -0.2422996, 2.669333, 0, 0, 0, 1, 1,
0.3548467, 1.424741, -0.8509457, 0, 0, 0, 1, 1,
0.3573855, -0.6785634, 3.436574, 0, 0, 0, 1, 1,
0.3599957, 1.313287, 0.4812725, 0, 0, 0, 1, 1,
0.3612644, -0.8210434, 2.663427, 0, 0, 0, 1, 1,
0.3737273, -1.170095, 3.226329, 0, 0, 0, 1, 1,
0.3744955, 1.848513, -1.005446, 1, 1, 1, 1, 1,
0.3751653, -1.110138, 2.864287, 1, 1, 1, 1, 1,
0.3784266, -1.011827, -0.1315876, 1, 1, 1, 1, 1,
0.3805502, 0.9541475, 1.851113, 1, 1, 1, 1, 1,
0.3832066, -1.648582, 2.848668, 1, 1, 1, 1, 1,
0.383387, -1.787886, 4.472905, 1, 1, 1, 1, 1,
0.3835995, -0.8986665, 3.76288, 1, 1, 1, 1, 1,
0.3857753, -1.29065, 2.155449, 1, 1, 1, 1, 1,
0.3860588, -1.01377, 0.7851916, 1, 1, 1, 1, 1,
0.3977968, 0.2586566, -1.08246, 1, 1, 1, 1, 1,
0.4098894, 0.4074914, 2.407229, 1, 1, 1, 1, 1,
0.4100599, 0.1180798, 2.341063, 1, 1, 1, 1, 1,
0.4127568, 0.871618, -1.29598, 1, 1, 1, 1, 1,
0.4140903, 0.3201742, 1.651976, 1, 1, 1, 1, 1,
0.4171384, 0.6055084, 0.7436018, 1, 1, 1, 1, 1,
0.42053, -1.14089, 1.03394, 0, 0, 1, 1, 1,
0.4324544, -0.5217075, 3.486576, 1, 0, 0, 1, 1,
0.4359168, -0.5959731, 1.533521, 1, 0, 0, 1, 1,
0.4378518, 1.490009, 1.002211, 1, 0, 0, 1, 1,
0.4384054, 1.157655, 0.4389056, 1, 0, 0, 1, 1,
0.4390154, 0.9507504, -0.0166214, 1, 0, 0, 1, 1,
0.4412324, -0.8092326, 1.641891, 0, 0, 0, 1, 1,
0.4431089, -1.351285, 5.385251, 0, 0, 0, 1, 1,
0.4602215, -0.3122443, 0.37778, 0, 0, 0, 1, 1,
0.4607812, -1.479142, 4.094884, 0, 0, 0, 1, 1,
0.4611853, 0.6993488, 0.01165746, 0, 0, 0, 1, 1,
0.4640075, 0.7821297, 0.4533816, 0, 0, 0, 1, 1,
0.4674208, 0.1754849, 1.677696, 0, 0, 0, 1, 1,
0.4690921, -0.3600485, 1.937738, 1, 1, 1, 1, 1,
0.4720283, 0.7874566, -1.94857, 1, 1, 1, 1, 1,
0.4740718, 0.8122364, -0.08939468, 1, 1, 1, 1, 1,
0.4774536, -0.1548506, 1.190404, 1, 1, 1, 1, 1,
0.4848123, 2.073476, 0.01619697, 1, 1, 1, 1, 1,
0.4861803, -0.3398173, 1.06214, 1, 1, 1, 1, 1,
0.4873233, -0.4896574, 1.790152, 1, 1, 1, 1, 1,
0.4878622, -0.3636166, 1.025378, 1, 1, 1, 1, 1,
0.4966083, 0.3439957, -0.1443767, 1, 1, 1, 1, 1,
0.4968523, 2.385753, 0.6716664, 1, 1, 1, 1, 1,
0.4978357, -1.058263, 0.9953121, 1, 1, 1, 1, 1,
0.501999, -1.180121, 1.652195, 1, 1, 1, 1, 1,
0.5058756, -0.7723277, 3.481906, 1, 1, 1, 1, 1,
0.5073827, -0.3061068, 3.038433, 1, 1, 1, 1, 1,
0.509918, -0.1643864, 1.948796, 1, 1, 1, 1, 1,
0.52087, -0.375348, 2.12328, 0, 0, 1, 1, 1,
0.5217081, 2.353378, 0.7126962, 1, 0, 0, 1, 1,
0.5254063, -1.554323, 1.77376, 1, 0, 0, 1, 1,
0.5281639, -0.5931495, 3.264853, 1, 0, 0, 1, 1,
0.5281972, -0.03487274, -0.2147343, 1, 0, 0, 1, 1,
0.5295447, 0.6622226, 0.933721, 1, 0, 0, 1, 1,
0.5330601, 0.3601302, -0.08720829, 0, 0, 0, 1, 1,
0.5339736, 0.9871369, 1.009032, 0, 0, 0, 1, 1,
0.5345244, 1.130364, 0.8977725, 0, 0, 0, 1, 1,
0.5351734, -0.3689036, 1.512246, 0, 0, 0, 1, 1,
0.5356088, -0.1199603, 1.504869, 0, 0, 0, 1, 1,
0.5385486, 1.511439, 1.497075, 0, 0, 0, 1, 1,
0.5415707, 0.4630204, -0.9211604, 0, 0, 0, 1, 1,
0.5462783, -0.9727652, 2.85539, 1, 1, 1, 1, 1,
0.5488361, 0.8144319, -0.7809408, 1, 1, 1, 1, 1,
0.5507441, -1.723864, 2.674609, 1, 1, 1, 1, 1,
0.5511475, -1.235888, 3.840924, 1, 1, 1, 1, 1,
0.5548577, -1.399426, 2.760613, 1, 1, 1, 1, 1,
0.5583566, 0.4994961, 0.3332932, 1, 1, 1, 1, 1,
0.5629614, 2.108238, -0.01088661, 1, 1, 1, 1, 1,
0.5632956, 1.74988, -0.1043797, 1, 1, 1, 1, 1,
0.5700034, 1.708871, 0.7324772, 1, 1, 1, 1, 1,
0.5722162, 1.094143, -1.911046, 1, 1, 1, 1, 1,
0.5722677, -1.191569, 2.534258, 1, 1, 1, 1, 1,
0.5822412, 0.4340381, 1.694182, 1, 1, 1, 1, 1,
0.5827074, 0.7904689, 0.1614324, 1, 1, 1, 1, 1,
0.5838279, 0.6760131, 1.498447, 1, 1, 1, 1, 1,
0.5840867, 1.940473, 0.05064293, 1, 1, 1, 1, 1,
0.5868573, -0.1452791, 1.228312, 0, 0, 1, 1, 1,
0.5935643, 1.245203, 0.02928946, 1, 0, 0, 1, 1,
0.594236, -0.6072869, 2.24488, 1, 0, 0, 1, 1,
0.5985727, -1.763463, 1.135054, 1, 0, 0, 1, 1,
0.6124647, -1.730771, 2.42079, 1, 0, 0, 1, 1,
0.6126912, -0.1694371, 3.328959, 1, 0, 0, 1, 1,
0.6141175, 0.940555, 0.2336678, 0, 0, 0, 1, 1,
0.6228558, 1.098252, 0.8362598, 0, 0, 0, 1, 1,
0.6286182, -0.4261658, 1.419761, 0, 0, 0, 1, 1,
0.6290305, -0.04666021, -0.5156845, 0, 0, 0, 1, 1,
0.6327198, -0.3999208, 0.9253828, 0, 0, 0, 1, 1,
0.6354408, -0.6646981, 2.674258, 0, 0, 0, 1, 1,
0.6374694, -1.068847, 2.238838, 0, 0, 0, 1, 1,
0.6428681, -2.051359, 4.688757, 1, 1, 1, 1, 1,
0.6439065, 0.08732102, 2.237691, 1, 1, 1, 1, 1,
0.651662, -0.4808516, 2.788516, 1, 1, 1, 1, 1,
0.6556116, 1.673833, -0.3892854, 1, 1, 1, 1, 1,
0.6559835, -0.7753353, 2.938946, 1, 1, 1, 1, 1,
0.6571985, -1.035929, 2.119441, 1, 1, 1, 1, 1,
0.6581949, -2.029038, 4.278951, 1, 1, 1, 1, 1,
0.6706789, 0.8256799, -0.5682216, 1, 1, 1, 1, 1,
0.6707526, 1.007054, 2.0435, 1, 1, 1, 1, 1,
0.6729477, -1.008789, 3.503439, 1, 1, 1, 1, 1,
0.6802193, -0.9393033, 3.959152, 1, 1, 1, 1, 1,
0.6843805, -2.086532, 1.793095, 1, 1, 1, 1, 1,
0.6864989, -1.217014, 1.330272, 1, 1, 1, 1, 1,
0.6897333, -0.565359, 4.509476, 1, 1, 1, 1, 1,
0.6914805, -0.6126165, 2.172402, 1, 1, 1, 1, 1,
0.6948726, -0.9095907, 2.378393, 0, 0, 1, 1, 1,
0.70341, 1.314805, 0.5917621, 1, 0, 0, 1, 1,
0.7076818, -0.7775846, 3.280793, 1, 0, 0, 1, 1,
0.708345, -0.9032328, 2.630217, 1, 0, 0, 1, 1,
0.7116614, 0.4507326, 0.5330272, 1, 0, 0, 1, 1,
0.712966, 0.8001213, 0.09935267, 1, 0, 0, 1, 1,
0.7141936, -0.1532709, -0.463205, 0, 0, 0, 1, 1,
0.7144802, -0.9912055, 2.755047, 0, 0, 0, 1, 1,
0.7259778, -1.789428, 3.901186, 0, 0, 0, 1, 1,
0.726773, 1.042683, 1.729502, 0, 0, 0, 1, 1,
0.7315484, -0.1091204, 1.739242, 0, 0, 0, 1, 1,
0.7329844, 0.8246262, 1.746562, 0, 0, 0, 1, 1,
0.7345871, -0.4507234, 2.039546, 0, 0, 0, 1, 1,
0.7383962, 2.273024, 1.2844, 1, 1, 1, 1, 1,
0.7442403, -0.8448799, 2.578166, 1, 1, 1, 1, 1,
0.7450468, -0.7839214, 1.906376, 1, 1, 1, 1, 1,
0.747215, -0.05568195, 2.403901, 1, 1, 1, 1, 1,
0.7500595, 0.1899498, 2.104087, 1, 1, 1, 1, 1,
0.7522755, 0.4450328, 1.622281, 1, 1, 1, 1, 1,
0.7544511, -1.114076, 2.996111, 1, 1, 1, 1, 1,
0.7604157, -0.1945114, 1.637822, 1, 1, 1, 1, 1,
0.761008, 0.1206781, 0.188611, 1, 1, 1, 1, 1,
0.7637803, 0.2725184, 0.3055687, 1, 1, 1, 1, 1,
0.7646533, 0.04196283, 0.6637909, 1, 1, 1, 1, 1,
0.7665263, -0.2210768, 1.069324, 1, 1, 1, 1, 1,
0.7699545, 0.3998195, -1.153735, 1, 1, 1, 1, 1,
0.7826018, -0.9975244, 2.157768, 1, 1, 1, 1, 1,
0.7831744, -1.092628, 2.451389, 1, 1, 1, 1, 1,
0.784808, 1.7041, 0.6287501, 0, 0, 1, 1, 1,
0.7866631, 0.2005218, 2.071412, 1, 0, 0, 1, 1,
0.7950434, 0.7511778, 0.8505142, 1, 0, 0, 1, 1,
0.8018436, -0.3063862, 1.610871, 1, 0, 0, 1, 1,
0.8028504, -0.3926584, 1.086331, 1, 0, 0, 1, 1,
0.8034506, 0.1479561, 1.40661, 1, 0, 0, 1, 1,
0.8071047, -1.121007, 2.403242, 0, 0, 0, 1, 1,
0.8072549, 0.3942573, 0.6433026, 0, 0, 0, 1, 1,
0.8097343, 0.3202332, 0.7510048, 0, 0, 0, 1, 1,
0.8153136, 0.4331718, 0.6471775, 0, 0, 0, 1, 1,
0.8239962, -0.3416038, 2.052863, 0, 0, 0, 1, 1,
0.8269929, 1.903739, 0.03647636, 0, 0, 0, 1, 1,
0.8315667, 1.098641, -0.329375, 0, 0, 0, 1, 1,
0.8344772, -0.8597359, 2.566784, 1, 1, 1, 1, 1,
0.8352623, -0.1965877, -0.1298846, 1, 1, 1, 1, 1,
0.8414218, -0.2657244, 2.637618, 1, 1, 1, 1, 1,
0.8438869, 1.620594, 0.4221764, 1, 1, 1, 1, 1,
0.8450786, -1.399867, 3.121923, 1, 1, 1, 1, 1,
0.8470253, 0.7497991, 1.956818, 1, 1, 1, 1, 1,
0.853635, 0.2696355, 1.67836, 1, 1, 1, 1, 1,
0.8590509, 1.307723, 3.177574, 1, 1, 1, 1, 1,
0.8602585, -1.555833, 3.180854, 1, 1, 1, 1, 1,
0.8643161, -0.327481, 0.9735035, 1, 1, 1, 1, 1,
0.864422, 2.982545, -0.3687404, 1, 1, 1, 1, 1,
0.8686112, 0.3786601, 1.505577, 1, 1, 1, 1, 1,
0.8765779, 0.1986791, -0.173547, 1, 1, 1, 1, 1,
0.8794425, 0.04293888, 1.326968, 1, 1, 1, 1, 1,
0.8820478, 2.189314, -0.451943, 1, 1, 1, 1, 1,
0.8918155, -0.5081812, 1.701874, 0, 0, 1, 1, 1,
0.9019895, -0.2575071, -0.3914315, 1, 0, 0, 1, 1,
0.9045064, 0.7401252, 0.02994849, 1, 0, 0, 1, 1,
0.9074652, 0.5975835, 0.7547436, 1, 0, 0, 1, 1,
0.9137096, 0.5660483, 1.523421, 1, 0, 0, 1, 1,
0.9168531, 1.143398, 0.9128192, 1, 0, 0, 1, 1,
0.9222306, -0.1068569, 3.233837, 0, 0, 0, 1, 1,
0.9227035, 1.080568, 3.167599, 0, 0, 0, 1, 1,
0.9234125, -0.0762984, 1.586016, 0, 0, 0, 1, 1,
0.9236029, 0.5292356, 1.200608, 0, 0, 0, 1, 1,
0.9256236, 0.6793355, 1.244412, 0, 0, 0, 1, 1,
0.9272087, -1.380802, 4.394745, 0, 0, 0, 1, 1,
0.928869, -0.2676795, 2.030147, 0, 0, 0, 1, 1,
0.9347494, 0.7192988, 0.6370153, 1, 1, 1, 1, 1,
0.9552638, -1.895703, 2.137931, 1, 1, 1, 1, 1,
0.9588777, -0.1970035, 1.807609, 1, 1, 1, 1, 1,
0.9590224, -0.6926871, 1.174115, 1, 1, 1, 1, 1,
0.9591001, 0.2054667, 1.522512, 1, 1, 1, 1, 1,
0.9596536, 0.2379184, 1.410749, 1, 1, 1, 1, 1,
0.9641928, 0.337781, 2.358212, 1, 1, 1, 1, 1,
0.9667753, -0.1138953, 2.491426, 1, 1, 1, 1, 1,
0.9679081, -0.07870471, 0.8141681, 1, 1, 1, 1, 1,
0.9732274, 2.189474, -0.09812132, 1, 1, 1, 1, 1,
0.9782411, -0.1982265, 2.708152, 1, 1, 1, 1, 1,
0.9801131, -1.656573, 2.864362, 1, 1, 1, 1, 1,
0.9839182, -0.5494965, 2.067733, 1, 1, 1, 1, 1,
0.984472, 1.064073, 1.830366, 1, 1, 1, 1, 1,
0.9886808, 0.1458783, 1.253927, 1, 1, 1, 1, 1,
0.9887933, 0.7101351, 2.064579, 0, 0, 1, 1, 1,
1.003385, -1.081508, 2.63141, 1, 0, 0, 1, 1,
1.004183, -0.5038034, 1.910013, 1, 0, 0, 1, 1,
1.005627, -1.286271, 0.6893704, 1, 0, 0, 1, 1,
1.007813, -0.5133664, 1.886088, 1, 0, 0, 1, 1,
1.019344, -0.5344669, 1.374124, 1, 0, 0, 1, 1,
1.019364, 1.115413, 1.284034, 0, 0, 0, 1, 1,
1.022473, 0.8733113, 0.800117, 0, 0, 0, 1, 1,
1.02378, 0.01521188, 1.998716, 0, 0, 0, 1, 1,
1.02387, 0.8285356, 1.778466, 0, 0, 0, 1, 1,
1.026633, -0.2577674, 3.820735, 0, 0, 0, 1, 1,
1.031467, 0.4619646, 1.468801, 0, 0, 0, 1, 1,
1.033947, 0.4229296, 2.711671, 0, 0, 0, 1, 1,
1.048608, -0.7431447, 2.005487, 1, 1, 1, 1, 1,
1.052474, 0.320973, 1.464845, 1, 1, 1, 1, 1,
1.062691, -0.04541744, 2.63424, 1, 1, 1, 1, 1,
1.081533, 1.483353, -0.6016883, 1, 1, 1, 1, 1,
1.082853, 0.5596629, 3.726958, 1, 1, 1, 1, 1,
1.088202, 0.6971364, 1.457126, 1, 1, 1, 1, 1,
1.096022, 0.8760569, 1.024085, 1, 1, 1, 1, 1,
1.097667, -1.025608, 2.814879, 1, 1, 1, 1, 1,
1.108681, 0.8293267, 0.2201804, 1, 1, 1, 1, 1,
1.10892, 0.9819479, 0.7848555, 1, 1, 1, 1, 1,
1.110927, -0.6402078, 2.928018, 1, 1, 1, 1, 1,
1.119694, 0.3152612, 0.4098055, 1, 1, 1, 1, 1,
1.123114, -1.456547, 2.220454, 1, 1, 1, 1, 1,
1.125822, -0.2480524, 2.309777, 1, 1, 1, 1, 1,
1.12825, -0.05588429, 1.237561, 1, 1, 1, 1, 1,
1.12831, 1.557831, -0.07541285, 0, 0, 1, 1, 1,
1.129211, -0.7452547, 2.098256, 1, 0, 0, 1, 1,
1.140569, -2.084657, 2.884602, 1, 0, 0, 1, 1,
1.141233, -1.839802, 2.13954, 1, 0, 0, 1, 1,
1.147407, 0.999257, -0.5232145, 1, 0, 0, 1, 1,
1.15111, 0.4369089, 0.2944202, 1, 0, 0, 1, 1,
1.151798, 1.42648, 0.906557, 0, 0, 0, 1, 1,
1.172638, 1.15255, -0.3832746, 0, 0, 0, 1, 1,
1.175367, 0.4507704, 0.08145906, 0, 0, 0, 1, 1,
1.179464, -0.3034921, -0.09041554, 0, 0, 0, 1, 1,
1.18402, -0.1835231, 0.1546017, 0, 0, 0, 1, 1,
1.190802, 0.05874191, 1.841145, 0, 0, 0, 1, 1,
1.190923, -0.1737116, 2.750916, 0, 0, 0, 1, 1,
1.197857, 0.9940165, 0.2920568, 1, 1, 1, 1, 1,
1.203518, 0.6572058, -0.413845, 1, 1, 1, 1, 1,
1.221076, 0.9464618, -1.357037, 1, 1, 1, 1, 1,
1.228608, -2.942944, 1.795119, 1, 1, 1, 1, 1,
1.231337, 0.5882987, 1.733253, 1, 1, 1, 1, 1,
1.237026, -2.092516, 1.378729, 1, 1, 1, 1, 1,
1.23937, -1.577113, 2.64921, 1, 1, 1, 1, 1,
1.240288, 0.7233638, 3.668684, 1, 1, 1, 1, 1,
1.242364, 0.6708154, 1.802658, 1, 1, 1, 1, 1,
1.244056, -1.066622, 2.381422, 1, 1, 1, 1, 1,
1.262023, 0.2489548, 1.947176, 1, 1, 1, 1, 1,
1.263704, 0.7314319, 1.440733, 1, 1, 1, 1, 1,
1.267916, -1.305869, 2.420481, 1, 1, 1, 1, 1,
1.275114, 0.9211228, 0.7091317, 1, 1, 1, 1, 1,
1.277324, 1.527564, 0.3588116, 1, 1, 1, 1, 1,
1.282823, 0.04641959, 0.2224838, 0, 0, 1, 1, 1,
1.295031, -0.7569494, 2.50507, 1, 0, 0, 1, 1,
1.296442, 1.246638, 2.046028, 1, 0, 0, 1, 1,
1.298663, 0.1166496, 2.639668, 1, 0, 0, 1, 1,
1.306975, -1.106285, 1.882715, 1, 0, 0, 1, 1,
1.313339, -1.918645, 1.12935, 1, 0, 0, 1, 1,
1.315048, 0.9809201, 0.6045894, 0, 0, 0, 1, 1,
1.320463, 0.5567733, 2.295671, 0, 0, 0, 1, 1,
1.336968, -0.09685685, 1.404261, 0, 0, 0, 1, 1,
1.338176, 1.080538, 2.354881, 0, 0, 0, 1, 1,
1.342475, 1.245983, 0.4703088, 0, 0, 0, 1, 1,
1.346326, 0.7332802, 1.527504, 0, 0, 0, 1, 1,
1.359561, 2.463956, 0.8094745, 0, 0, 0, 1, 1,
1.365371, 0.5551608, 4.615131, 1, 1, 1, 1, 1,
1.366862, 1.901378, 1.049197, 1, 1, 1, 1, 1,
1.370879, 0.4319594, 1.136996, 1, 1, 1, 1, 1,
1.377909, 0.9227344, 0.423835, 1, 1, 1, 1, 1,
1.380132, 0.8312537, 1.121788, 1, 1, 1, 1, 1,
1.38315, 1.189445, 1.054519, 1, 1, 1, 1, 1,
1.383699, -0.8871932, 1.842303, 1, 1, 1, 1, 1,
1.383821, 1.573961, 1.527962, 1, 1, 1, 1, 1,
1.384062, -1.435836, 2.58398, 1, 1, 1, 1, 1,
1.384894, 0.449429, 0.614407, 1, 1, 1, 1, 1,
1.387995, -0.4079775, 2.000843, 1, 1, 1, 1, 1,
1.3889, -0.3999245, 3.091504, 1, 1, 1, 1, 1,
1.396299, -2.200738, 2.711495, 1, 1, 1, 1, 1,
1.409613, 0.5769511, 0.8405455, 1, 1, 1, 1, 1,
1.410407, -0.9602603, 3.156685, 1, 1, 1, 1, 1,
1.411234, 0.5963744, 2.177645, 0, 0, 1, 1, 1,
1.414275, -0.01690341, 0.4293966, 1, 0, 0, 1, 1,
1.416014, -0.8377839, 1.239036, 1, 0, 0, 1, 1,
1.418533, 0.5072029, -0.1753773, 1, 0, 0, 1, 1,
1.431816, -0.06599262, 0.5836639, 1, 0, 0, 1, 1,
1.43968, -1.531892, 3.007233, 1, 0, 0, 1, 1,
1.441265, -0.9236463, 1.784102, 0, 0, 0, 1, 1,
1.451466, 0.1692724, 1.740307, 0, 0, 0, 1, 1,
1.473024, -1.486931, 1.929973, 0, 0, 0, 1, 1,
1.483913, 0.2123693, 0.418634, 0, 0, 0, 1, 1,
1.488416, 0.1196436, 2.662757, 0, 0, 0, 1, 1,
1.489034, 2.906521, -0.0004320845, 0, 0, 0, 1, 1,
1.499272, -1.124575, 1.573992, 0, 0, 0, 1, 1,
1.500103, 1.914666, 0.04580305, 1, 1, 1, 1, 1,
1.516662, -0.3249563, 1.101375, 1, 1, 1, 1, 1,
1.519884, -2.34948, 1.587771, 1, 1, 1, 1, 1,
1.520213, 0.2083652, 0.3774985, 1, 1, 1, 1, 1,
1.522082, -0.3077353, 1.730975, 1, 1, 1, 1, 1,
1.538637, -1.353403, 3.004187, 1, 1, 1, 1, 1,
1.54546, -0.8255088, 1.231202, 1, 1, 1, 1, 1,
1.545795, -1.238207, 0.7300326, 1, 1, 1, 1, 1,
1.550604, 1.099972, 1.316553, 1, 1, 1, 1, 1,
1.555382, -0.2009755, 1.825286, 1, 1, 1, 1, 1,
1.555871, 0.6799281, 0.3981067, 1, 1, 1, 1, 1,
1.582638, 0.006388579, 1.497767, 1, 1, 1, 1, 1,
1.593234, 1.821816, 2.185279, 1, 1, 1, 1, 1,
1.59754, 1.180133, 0.4569747, 1, 1, 1, 1, 1,
1.604619, 1.786511, 2.148072, 1, 1, 1, 1, 1,
1.60913, -0.2363285, 2.419443, 0, 0, 1, 1, 1,
1.609195, -0.1239036, 1.637816, 1, 0, 0, 1, 1,
1.624038, 1.282793, 1.730865, 1, 0, 0, 1, 1,
1.624311, 0.2758423, 3.017115, 1, 0, 0, 1, 1,
1.640115, -1.417664, 0.9507798, 1, 0, 0, 1, 1,
1.640949, -0.9996279, 1.230951, 1, 0, 0, 1, 1,
1.642035, -1.469418, 0.3992794, 0, 0, 0, 1, 1,
1.666424, 0.7296003, 0.2799542, 0, 0, 0, 1, 1,
1.691007, 0.7725455, 0.1808643, 0, 0, 0, 1, 1,
1.708056, 0.6514628, 0.6555772, 0, 0, 0, 1, 1,
1.708861, 1.231703, 1.084108, 0, 0, 0, 1, 1,
1.710957, -1.843442, 1.680084, 0, 0, 0, 1, 1,
1.712927, 1.077028, 0.8665096, 0, 0, 0, 1, 1,
1.714166, 1.748826, -0.0134411, 1, 1, 1, 1, 1,
1.717429, -0.3253905, 0.9212373, 1, 1, 1, 1, 1,
1.721362, -0.7728325, 1.838513, 1, 1, 1, 1, 1,
1.736724, -1.175631, 2.56554, 1, 1, 1, 1, 1,
1.753158, -0.2788695, 1.4591, 1, 1, 1, 1, 1,
1.775296, 0.7810054, 2.042094, 1, 1, 1, 1, 1,
1.80617, -0.1579816, 1.477196, 1, 1, 1, 1, 1,
1.811875, -1.531187, 2.230705, 1, 1, 1, 1, 1,
1.819086, -0.5286034, 1.59917, 1, 1, 1, 1, 1,
1.85598, -1.133945, 1.896083, 1, 1, 1, 1, 1,
1.856007, -0.2048094, 1.380967, 1, 1, 1, 1, 1,
1.876623, -0.2009254, 3.158549, 1, 1, 1, 1, 1,
1.8951, -0.1080288, 2.464346, 1, 1, 1, 1, 1,
1.913563, 1.392295, 0.3589447, 1, 1, 1, 1, 1,
1.929148, 1.151281, 0.63763, 1, 1, 1, 1, 1,
1.995023, 2.348072, 0.3660251, 0, 0, 1, 1, 1,
1.997902, 0.3600267, -0.1560433, 1, 0, 0, 1, 1,
2.001127, 0.4459633, 0.9386183, 1, 0, 0, 1, 1,
2.039208, -0.02543391, 1.790768, 1, 0, 0, 1, 1,
2.053573, 0.09239847, 2.644233, 1, 0, 0, 1, 1,
2.066623, 0.1721264, 0.8292146, 1, 0, 0, 1, 1,
2.091479, 0.4703229, 2.932266, 0, 0, 0, 1, 1,
2.097285, -2.106342, 1.642105, 0, 0, 0, 1, 1,
2.153754, -0.404042, 1.286415, 0, 0, 0, 1, 1,
2.156759, -0.6966534, 4.78663, 0, 0, 0, 1, 1,
2.208311, -1.324473, 3.077084, 0, 0, 0, 1, 1,
2.215496, 0.08474765, 1.759784, 0, 0, 0, 1, 1,
2.236388, 0.2777764, 2.577052, 0, 0, 0, 1, 1,
2.257507, -0.8400969, 0.8464808, 1, 1, 1, 1, 1,
2.273306, 0.8647404, -0.7089003, 1, 1, 1, 1, 1,
2.376545, -1.1021, 2.577869, 1, 1, 1, 1, 1,
2.406218, -1.376008, 1.098752, 1, 1, 1, 1, 1,
2.751604, 0.2800298, 1.792166, 1, 1, 1, 1, 1,
2.874893, 0.6898912, 2.238626, 1, 1, 1, 1, 1,
3.208316, -0.2925185, 3.192682, 1, 1, 1, 1, 1
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
var radius = 9.522459;
var distance = 33.44724;
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
mvMatrix.translate( 0.2154264, -0.01980054, -0.087075 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.44724);
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