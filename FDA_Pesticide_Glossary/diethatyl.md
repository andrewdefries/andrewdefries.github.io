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
-3.282697, -0.7947018, -1.409983, 1, 0, 0, 1,
-2.913537, 0.5721106, -2.705367, 1, 0.007843138, 0, 1,
-2.746622, 0.3362647, -1.83796, 1, 0.01176471, 0, 1,
-2.704699, -0.7568383, -0.6649559, 1, 0.01960784, 0, 1,
-2.668769, -0.3260121, -1.927381, 1, 0.02352941, 0, 1,
-2.306594, -0.1663125, -1.937835, 1, 0.03137255, 0, 1,
-2.305155, -1.154768, -3.365331, 1, 0.03529412, 0, 1,
-2.2989, -1.643065, -4.197793, 1, 0.04313726, 0, 1,
-2.273914, -1.906454, -1.969463, 1, 0.04705882, 0, 1,
-2.261621, -0.5573188, -1.642355, 1, 0.05490196, 0, 1,
-2.260373, -1.434872, -1.766486, 1, 0.05882353, 0, 1,
-2.177258, -0.01908641, -2.31235, 1, 0.06666667, 0, 1,
-2.146158, -0.1139727, -1.641269, 1, 0.07058824, 0, 1,
-2.106238, 0.939706, -0.9614304, 1, 0.07843138, 0, 1,
-2.08263, 1.40112, -0.05001942, 1, 0.08235294, 0, 1,
-2.077534, 1.064853, -0.7974669, 1, 0.09019608, 0, 1,
-2.067147, 1.653448, -1.702796, 1, 0.09411765, 0, 1,
-2.065847, -0.09010842, 0.05186839, 1, 0.1019608, 0, 1,
-2.065305, 0.2239179, -2.007898, 1, 0.1098039, 0, 1,
-2.028167, -0.07999317, -0.9651686, 1, 0.1137255, 0, 1,
-2.026731, -0.9747306, -1.701201, 1, 0.1215686, 0, 1,
-2.026106, -1.647835, -1.330061, 1, 0.1254902, 0, 1,
-2.025876, -0.8277057, -2.06941, 1, 0.1333333, 0, 1,
-2.013773, -0.09708691, -0.7908915, 1, 0.1372549, 0, 1,
-2.009572, -0.5940287, -1.178328, 1, 0.145098, 0, 1,
-1.988769, -0.736144, -2.319081, 1, 0.1490196, 0, 1,
-1.97125, -0.2634962, -1.856049, 1, 0.1568628, 0, 1,
-1.963844, 0.6496043, -0.8627061, 1, 0.1607843, 0, 1,
-1.962674, 1.145916, -0.02764227, 1, 0.1686275, 0, 1,
-1.959148, -0.3670785, -1.931494, 1, 0.172549, 0, 1,
-1.911099, -1.060256, -2.130841, 1, 0.1803922, 0, 1,
-1.908349, 1.406052, -1.969744, 1, 0.1843137, 0, 1,
-1.90067, 0.3569857, -2.748521, 1, 0.1921569, 0, 1,
-1.892581, -2.165813, -3.181506, 1, 0.1960784, 0, 1,
-1.872222, 0.0925118, 0.02745812, 1, 0.2039216, 0, 1,
-1.866458, -0.247366, -1.076609, 1, 0.2117647, 0, 1,
-1.865154, 0.1179925, -2.641258, 1, 0.2156863, 0, 1,
-1.851134, 3.169419, 0.9943688, 1, 0.2235294, 0, 1,
-1.801986, -0.1443791, -0.1933131, 1, 0.227451, 0, 1,
-1.795437, 0.7877859, -1.594549, 1, 0.2352941, 0, 1,
-1.794854, -1.716973, -3.020104, 1, 0.2392157, 0, 1,
-1.762753, 0.2221262, -1.422855, 1, 0.2470588, 0, 1,
-1.760616, -0.1593322, -1.488056, 1, 0.2509804, 0, 1,
-1.756657, -0.5403739, -0.4924147, 1, 0.2588235, 0, 1,
-1.752136, 0.9932407, 0.1769785, 1, 0.2627451, 0, 1,
-1.733949, -0.7908928, -3.309799, 1, 0.2705882, 0, 1,
-1.70991, -0.1550712, 0.2664928, 1, 0.2745098, 0, 1,
-1.70631, -1.149773, -2.326628, 1, 0.282353, 0, 1,
-1.698274, 0.5125573, -1.488442, 1, 0.2862745, 0, 1,
-1.69751, 1.872097, -1.015295, 1, 0.2941177, 0, 1,
-1.687161, -1.036216, -1.77845, 1, 0.3019608, 0, 1,
-1.67583, 0.4281379, -3.134838, 1, 0.3058824, 0, 1,
-1.670689, 0.1746049, -1.414826, 1, 0.3137255, 0, 1,
-1.669823, 0.5341268, -1.65839, 1, 0.3176471, 0, 1,
-1.639257, 0.8063335, -0.708724, 1, 0.3254902, 0, 1,
-1.629875, -1.098352, -0.6764927, 1, 0.3294118, 0, 1,
-1.615638, -0.5664744, -1.029584, 1, 0.3372549, 0, 1,
-1.612549, -0.1913333, -1.384482, 1, 0.3411765, 0, 1,
-1.609316, 0.6957742, -1.781166, 1, 0.3490196, 0, 1,
-1.605951, 1.752645, -0.5316756, 1, 0.3529412, 0, 1,
-1.578325, -0.2566591, -1.952247, 1, 0.3607843, 0, 1,
-1.571649, -0.5307209, -2.880647, 1, 0.3647059, 0, 1,
-1.570578, 0.3978664, -0.7896095, 1, 0.372549, 0, 1,
-1.569405, -1.563564, -1.486491, 1, 0.3764706, 0, 1,
-1.56388, 0.5571129, -0.7573397, 1, 0.3843137, 0, 1,
-1.554119, 1.567276, 0.1694786, 1, 0.3882353, 0, 1,
-1.533438, -1.35408, -2.315068, 1, 0.3960784, 0, 1,
-1.529451, -0.1467218, -2.239813, 1, 0.4039216, 0, 1,
-1.518447, 0.8763794, -0.8403845, 1, 0.4078431, 0, 1,
-1.502977, 0.8904566, 2.067011, 1, 0.4156863, 0, 1,
-1.496696, 0.6540186, -0.7296427, 1, 0.4196078, 0, 1,
-1.494626, -0.03707204, -1.19362, 1, 0.427451, 0, 1,
-1.492383, -0.07247467, -2.318389, 1, 0.4313726, 0, 1,
-1.49078, 0.6466956, -2.073927, 1, 0.4392157, 0, 1,
-1.488635, -0.09829669, -2.595541, 1, 0.4431373, 0, 1,
-1.486866, 0.1128948, -2.333211, 1, 0.4509804, 0, 1,
-1.481363, 1.111183, -0.5794922, 1, 0.454902, 0, 1,
-1.480151, 1.801409, -2.586206, 1, 0.4627451, 0, 1,
-1.436808, -0.03679801, -0.9208031, 1, 0.4666667, 0, 1,
-1.426757, 0.7899442, -0.6781062, 1, 0.4745098, 0, 1,
-1.425591, -0.1684286, -0.999541, 1, 0.4784314, 0, 1,
-1.423136, -0.5447614, -4.009781, 1, 0.4862745, 0, 1,
-1.421166, 0.9450613, -0.7423086, 1, 0.4901961, 0, 1,
-1.420014, 1.056286, -2.40202, 1, 0.4980392, 0, 1,
-1.415472, 0.6629552, -0.02366274, 1, 0.5058824, 0, 1,
-1.403971, -1.308632, -2.879767, 1, 0.509804, 0, 1,
-1.403231, -1.104417, -3.099482, 1, 0.5176471, 0, 1,
-1.392567, 1.128674, -1.653403, 1, 0.5215687, 0, 1,
-1.391878, -1.367257, -4.940901, 1, 0.5294118, 0, 1,
-1.373493, -0.1959345, -0.3471658, 1, 0.5333334, 0, 1,
-1.365759, 0.06414903, -1.725458, 1, 0.5411765, 0, 1,
-1.357882, 0.7211494, -2.555043, 1, 0.5450981, 0, 1,
-1.331775, -0.1611425, -1.115193, 1, 0.5529412, 0, 1,
-1.329669, 1.199206, -0.6608161, 1, 0.5568628, 0, 1,
-1.325774, 0.3092121, -1.466888, 1, 0.5647059, 0, 1,
-1.324546, -0.1475178, -1.116018, 1, 0.5686275, 0, 1,
-1.314197, 0.3419594, -2.251731, 1, 0.5764706, 0, 1,
-1.313405, -0.7620336, -0.9119154, 1, 0.5803922, 0, 1,
-1.300445, -0.04243407, -1.513166, 1, 0.5882353, 0, 1,
-1.296257, 0.01426733, -1.571432, 1, 0.5921569, 0, 1,
-1.287049, 1.20438, -1.487003, 1, 0.6, 0, 1,
-1.276984, 1.470829, -1.076743, 1, 0.6078432, 0, 1,
-1.266168, -0.07019312, -1.895577, 1, 0.6117647, 0, 1,
-1.263043, 0.4936845, -1.067568, 1, 0.6196079, 0, 1,
-1.248355, -0.1899433, -3.82601, 1, 0.6235294, 0, 1,
-1.247022, 0.8678604, -0.2405077, 1, 0.6313726, 0, 1,
-1.244626, -1.164145, -2.539913, 1, 0.6352941, 0, 1,
-1.244199, 2.142939, -0.8889259, 1, 0.6431373, 0, 1,
-1.24167, -0.1890259, 0.01776887, 1, 0.6470588, 0, 1,
-1.235194, -2.053254, -1.094743, 1, 0.654902, 0, 1,
-1.232975, -0.8167772, -3.069831, 1, 0.6588235, 0, 1,
-1.221194, -1.29812, -2.985071, 1, 0.6666667, 0, 1,
-1.220405, 0.05005151, -1.322252, 1, 0.6705883, 0, 1,
-1.216574, 0.2516641, -1.38195, 1, 0.6784314, 0, 1,
-1.21393, 0.3947109, -1.084843, 1, 0.682353, 0, 1,
-1.209809, -0.7232914, -1.154317, 1, 0.6901961, 0, 1,
-1.199299, -0.3141045, -1.64174, 1, 0.6941177, 0, 1,
-1.198244, -1.956826, -1.693092, 1, 0.7019608, 0, 1,
-1.190627, -1.68279, -2.671664, 1, 0.7098039, 0, 1,
-1.187452, -0.6923451, -3.346313, 1, 0.7137255, 0, 1,
-1.1859, 0.4429823, -0.4628027, 1, 0.7215686, 0, 1,
-1.182702, 1.57326, 0.4613101, 1, 0.7254902, 0, 1,
-1.181975, 0.4169515, -0.4668831, 1, 0.7333333, 0, 1,
-1.180426, -3.195744, -4.189486, 1, 0.7372549, 0, 1,
-1.18022, 1.319283, -0.7128043, 1, 0.7450981, 0, 1,
-1.176671, 0.4395301, -0.5894905, 1, 0.7490196, 0, 1,
-1.172294, 1.172236, -1.954735, 1, 0.7568628, 0, 1,
-1.166605, 0.6352481, -0.4507995, 1, 0.7607843, 0, 1,
-1.162646, 0.2803102, -0.5404272, 1, 0.7686275, 0, 1,
-1.156473, 0.382484, -2.634293, 1, 0.772549, 0, 1,
-1.151765, -0.08891995, -1.495308, 1, 0.7803922, 0, 1,
-1.149421, 1.015059, -1.683195, 1, 0.7843137, 0, 1,
-1.14589, -0.08226103, -2.748513, 1, 0.7921569, 0, 1,
-1.14531, 0.7082544, -1.812209, 1, 0.7960784, 0, 1,
-1.141329, -0.3365662, -2.34637, 1, 0.8039216, 0, 1,
-1.138306, 0.2422505, -0.1965804, 1, 0.8117647, 0, 1,
-1.125154, 0.7579846, -2.48234, 1, 0.8156863, 0, 1,
-1.121607, -1.421078, -1.609892, 1, 0.8235294, 0, 1,
-1.121302, -0.3484256, -2.129836, 1, 0.827451, 0, 1,
-1.117256, 1.188282, -2.017954, 1, 0.8352941, 0, 1,
-1.114178, 2.03543, 0.5403714, 1, 0.8392157, 0, 1,
-1.112759, -1.869397, -1.949921, 1, 0.8470588, 0, 1,
-1.11177, -0.8229563, -0.8474023, 1, 0.8509804, 0, 1,
-1.109334, 0.5574703, -3.264611, 1, 0.8588235, 0, 1,
-1.081956, -1.088152, -3.994316, 1, 0.8627451, 0, 1,
-1.07086, 1.863788, -0.241048, 1, 0.8705882, 0, 1,
-1.070753, -0.800391, -1.552122, 1, 0.8745098, 0, 1,
-1.068881, 0.1090906, -0.520067, 1, 0.8823529, 0, 1,
-1.068617, 0.01141989, -0.9953581, 1, 0.8862745, 0, 1,
-1.067852, -1.57457, -1.846968, 1, 0.8941177, 0, 1,
-1.066201, 1.99505, -1.155408, 1, 0.8980392, 0, 1,
-1.064897, 0.1530424, -2.32627, 1, 0.9058824, 0, 1,
-1.043083, -0.2765582, -2.139753, 1, 0.9137255, 0, 1,
-1.041962, -0.6889628, -2.681426, 1, 0.9176471, 0, 1,
-1.040919, 1.534015, -0.03818832, 1, 0.9254902, 0, 1,
-1.035061, -0.414406, -0.4350546, 1, 0.9294118, 0, 1,
-1.033134, 0.8690525, -2.166099, 1, 0.9372549, 0, 1,
-1.016128, 0.7902431, -1.604008, 1, 0.9411765, 0, 1,
-1.014387, -2.137053, -1.136941, 1, 0.9490196, 0, 1,
-1.004379, 0.1129045, -2.578437, 1, 0.9529412, 0, 1,
-1.003398, 0.06421613, -0.5059869, 1, 0.9607843, 0, 1,
-0.9908944, -0.9315242, -3.710384, 1, 0.9647059, 0, 1,
-0.9799263, -0.7306996, -2.297711, 1, 0.972549, 0, 1,
-0.9778455, 0.7107968, -2.668623, 1, 0.9764706, 0, 1,
-0.9774017, 0.6906828, -2.115275, 1, 0.9843137, 0, 1,
-0.9750794, -0.3867057, -3.288464, 1, 0.9882353, 0, 1,
-0.9734292, -0.1700498, -1.970843, 1, 0.9960784, 0, 1,
-0.9713798, 0.7417732, -1.233539, 0.9960784, 1, 0, 1,
-0.9699675, -0.6576075, -1.909952, 0.9921569, 1, 0, 1,
-0.96835, 0.3738798, -1.460996, 0.9843137, 1, 0, 1,
-0.9677747, 0.7949667, -1.289794, 0.9803922, 1, 0, 1,
-0.9483101, -0.1139712, -1.93854, 0.972549, 1, 0, 1,
-0.9481525, -0.002257081, -1.429914, 0.9686275, 1, 0, 1,
-0.9420819, 0.4774043, -0.9807545, 0.9607843, 1, 0, 1,
-0.9407603, -0.116324, -1.808455, 0.9568627, 1, 0, 1,
-0.9398438, 0.2095018, -0.8151268, 0.9490196, 1, 0, 1,
-0.9181416, 0.7795429, -0.7579831, 0.945098, 1, 0, 1,
-0.9145324, -1.523606, -2.219707, 0.9372549, 1, 0, 1,
-0.9071639, -0.9587321, -1.469824, 0.9333333, 1, 0, 1,
-0.9000077, 1.352396, 1.316727, 0.9254902, 1, 0, 1,
-0.8972313, 0.7290492, 0.1743206, 0.9215686, 1, 0, 1,
-0.8890433, 0.4022138, -0.06874178, 0.9137255, 1, 0, 1,
-0.8814614, -0.7445814, -3.977535, 0.9098039, 1, 0, 1,
-0.8801715, -0.5730827, -1.678813, 0.9019608, 1, 0, 1,
-0.8777681, 0.4321333, -2.953079, 0.8941177, 1, 0, 1,
-0.8757272, -1.808557, -1.664886, 0.8901961, 1, 0, 1,
-0.8704844, -0.7004478, -1.297485, 0.8823529, 1, 0, 1,
-0.8622059, 0.02269624, -1.026914, 0.8784314, 1, 0, 1,
-0.8603343, -0.2152498, -1.164532, 0.8705882, 1, 0, 1,
-0.8562109, -0.933949, -5.796622, 0.8666667, 1, 0, 1,
-0.8501019, 0.6108724, -0.9366152, 0.8588235, 1, 0, 1,
-0.8481912, 0.1471065, 0.1919999, 0.854902, 1, 0, 1,
-0.8474618, 0.5769081, -1.796301, 0.8470588, 1, 0, 1,
-0.8358483, -1.774173, -2.418055, 0.8431373, 1, 0, 1,
-0.8270717, -0.4524675, -2.127077, 0.8352941, 1, 0, 1,
-0.825208, -0.499662, -1.794452, 0.8313726, 1, 0, 1,
-0.8250186, -2.104133, -2.262376, 0.8235294, 1, 0, 1,
-0.8075866, 0.1440804, -1.323837, 0.8196079, 1, 0, 1,
-0.8029194, 1.147463, 0.5945984, 0.8117647, 1, 0, 1,
-0.7974936, -0.2662208, -2.31467, 0.8078431, 1, 0, 1,
-0.7968879, 0.02495458, -2.548338, 0.8, 1, 0, 1,
-0.7965636, 0.3632725, -1.209429, 0.7921569, 1, 0, 1,
-0.7962872, 0.3716712, -0.01793152, 0.7882353, 1, 0, 1,
-0.7919644, 1.384215, -0.6052446, 0.7803922, 1, 0, 1,
-0.791559, -0.08586587, -2.918317, 0.7764706, 1, 0, 1,
-0.790309, 0.2878973, -0.9362202, 0.7686275, 1, 0, 1,
-0.7893397, -0.7816459, -2.230017, 0.7647059, 1, 0, 1,
-0.7891074, 0.4810448, -1.170852, 0.7568628, 1, 0, 1,
-0.7875994, -0.9449348, -3.800873, 0.7529412, 1, 0, 1,
-0.7858939, 1.129308, 0.02787058, 0.7450981, 1, 0, 1,
-0.7850582, -0.4419974, -2.342341, 0.7411765, 1, 0, 1,
-0.7777897, -0.8391544, -1.689786, 0.7333333, 1, 0, 1,
-0.7767154, 1.588924, 0.4459764, 0.7294118, 1, 0, 1,
-0.7756532, 0.1213437, 0.1066222, 0.7215686, 1, 0, 1,
-0.7641882, -0.7742584, -0.5532496, 0.7176471, 1, 0, 1,
-0.7585473, 0.3876709, -2.56763, 0.7098039, 1, 0, 1,
-0.7560583, 0.7451821, -0.8532369, 0.7058824, 1, 0, 1,
-0.7545097, -2.1528, -2.319898, 0.6980392, 1, 0, 1,
-0.751545, 0.7940032, -1.236982, 0.6901961, 1, 0, 1,
-0.7514607, 1.636322, -1.517129, 0.6862745, 1, 0, 1,
-0.7498436, 2.240711, -0.5578651, 0.6784314, 1, 0, 1,
-0.7489768, -0.2890183, -0.7573689, 0.6745098, 1, 0, 1,
-0.7450885, 0.2232377, -0.5103402, 0.6666667, 1, 0, 1,
-0.7416375, 3.10108, -0.90883, 0.6627451, 1, 0, 1,
-0.7393882, 0.7341572, -1.659584, 0.654902, 1, 0, 1,
-0.736645, 0.4445981, -1.733626, 0.6509804, 1, 0, 1,
-0.7272843, 0.6014293, -1.793979, 0.6431373, 1, 0, 1,
-0.7259062, 0.4358587, -1.789315, 0.6392157, 1, 0, 1,
-0.7258512, 0.4116292, -0.5992544, 0.6313726, 1, 0, 1,
-0.7257715, -0.564709, -4.581839, 0.627451, 1, 0, 1,
-0.722958, -0.03539178, -1.824948, 0.6196079, 1, 0, 1,
-0.7124966, 1.085886, -1.914125, 0.6156863, 1, 0, 1,
-0.7087224, -0.1022907, -1.396572, 0.6078432, 1, 0, 1,
-0.7063353, 2.987877, 0.8745705, 0.6039216, 1, 0, 1,
-0.7052297, 2.007535, -1.424109, 0.5960785, 1, 0, 1,
-0.6991628, -1.010785, -2.998029, 0.5882353, 1, 0, 1,
-0.6989006, -0.1158508, -0.9506245, 0.5843138, 1, 0, 1,
-0.6951337, -1.00615, -0.425019, 0.5764706, 1, 0, 1,
-0.6934721, 0.05648522, -1.920559, 0.572549, 1, 0, 1,
-0.6904641, -0.7401878, -1.042275, 0.5647059, 1, 0, 1,
-0.6763301, 1.602114, -0.8013153, 0.5607843, 1, 0, 1,
-0.6761158, -0.9901946, -1.082011, 0.5529412, 1, 0, 1,
-0.6759681, 1.137028, -0.5962005, 0.5490196, 1, 0, 1,
-0.6749565, -0.06031475, -1.250048, 0.5411765, 1, 0, 1,
-0.672434, -0.7337287, -2.158558, 0.5372549, 1, 0, 1,
-0.6684202, 0.3071432, -0.6044329, 0.5294118, 1, 0, 1,
-0.6643605, 0.1024752, -0.8123004, 0.5254902, 1, 0, 1,
-0.6626955, -1.186185, -3.162429, 0.5176471, 1, 0, 1,
-0.6588195, -0.7345694, -4.09197, 0.5137255, 1, 0, 1,
-0.6586153, -0.5199767, -2.804485, 0.5058824, 1, 0, 1,
-0.6583862, 2.475187, 0.553436, 0.5019608, 1, 0, 1,
-0.6577641, -0.4896564, -2.935455, 0.4941176, 1, 0, 1,
-0.6566461, 0.5945905, -1.848293, 0.4862745, 1, 0, 1,
-0.6537918, -0.03631076, -2.913785, 0.4823529, 1, 0, 1,
-0.651069, -1.927302, -2.814415, 0.4745098, 1, 0, 1,
-0.6455797, 1.407047, 0.3326269, 0.4705882, 1, 0, 1,
-0.6416356, 0.8595642, -1.317019, 0.4627451, 1, 0, 1,
-0.6413443, 1.610747, 0.1445354, 0.4588235, 1, 0, 1,
-0.640196, -0.009944156, -2.115325, 0.4509804, 1, 0, 1,
-0.631831, -0.9501135, -3.57924, 0.4470588, 1, 0, 1,
-0.6297807, -1.053765, -2.775097, 0.4392157, 1, 0, 1,
-0.6265333, -1.577686, -3.043566, 0.4352941, 1, 0, 1,
-0.6240297, 0.3019987, -1.936628, 0.427451, 1, 0, 1,
-0.6202242, -0.8517492, -2.73204, 0.4235294, 1, 0, 1,
-0.6190868, 0.07321113, -0.3426464, 0.4156863, 1, 0, 1,
-0.617911, -0.1578171, -2.932521, 0.4117647, 1, 0, 1,
-0.6116724, 0.04760234, -1.763016, 0.4039216, 1, 0, 1,
-0.6033973, -0.1136672, -0.2462324, 0.3960784, 1, 0, 1,
-0.6022533, 0.8177101, 1.123341, 0.3921569, 1, 0, 1,
-0.5970995, 1.099814, -0.9274278, 0.3843137, 1, 0, 1,
-0.596324, -0.5866179, -1.963351, 0.3803922, 1, 0, 1,
-0.5946608, -0.2568443, -0.4201564, 0.372549, 1, 0, 1,
-0.591703, -0.6037239, -2.175534, 0.3686275, 1, 0, 1,
-0.5872449, -0.4835769, -1.485512, 0.3607843, 1, 0, 1,
-0.5863828, -1.452002, -3.974871, 0.3568628, 1, 0, 1,
-0.5859544, -0.3784474, -3.331849, 0.3490196, 1, 0, 1,
-0.5846869, -0.5816907, -1.744296, 0.345098, 1, 0, 1,
-0.5822951, 0.8285651, -0.606564, 0.3372549, 1, 0, 1,
-0.5812806, -2.628411, -3.701868, 0.3333333, 1, 0, 1,
-0.5792248, 1.392006, -1.568157, 0.3254902, 1, 0, 1,
-0.5767912, 0.6104016, -1.740459, 0.3215686, 1, 0, 1,
-0.5750211, 0.6053565, -0.7658195, 0.3137255, 1, 0, 1,
-0.5723035, -0.1678607, -3.194058, 0.3098039, 1, 0, 1,
-0.5705742, -1.613175, -3.506092, 0.3019608, 1, 0, 1,
-0.5692741, -0.1338776, -1.894789, 0.2941177, 1, 0, 1,
-0.5649043, -0.3922373, -2.335118, 0.2901961, 1, 0, 1,
-0.5628296, -0.5849645, -2.940595, 0.282353, 1, 0, 1,
-0.562798, 0.7954327, -0.6770384, 0.2784314, 1, 0, 1,
-0.5620292, -1.122464, -2.714279, 0.2705882, 1, 0, 1,
-0.5534863, 0.8520399, -0.2559931, 0.2666667, 1, 0, 1,
-0.5479812, 1.508173, -0.3512605, 0.2588235, 1, 0, 1,
-0.5423498, -0.1666801, -1.811642, 0.254902, 1, 0, 1,
-0.5413658, -0.4921941, -1.942293, 0.2470588, 1, 0, 1,
-0.5370373, -0.2133967, -2.290562, 0.2431373, 1, 0, 1,
-0.5296068, 1.742898, -0.3218382, 0.2352941, 1, 0, 1,
-0.5263528, -1.323758, -2.216644, 0.2313726, 1, 0, 1,
-0.520042, -1.524892, -1.71925, 0.2235294, 1, 0, 1,
-0.5132052, -1.747942, -1.677727, 0.2196078, 1, 0, 1,
-0.5109132, -0.05335002, -0.4715153, 0.2117647, 1, 0, 1,
-0.5106339, 1.656258, 0.4033708, 0.2078431, 1, 0, 1,
-0.5047987, -0.5663186, -2.389337, 0.2, 1, 0, 1,
-0.5037599, 2.144857, 1.596218, 0.1921569, 1, 0, 1,
-0.503326, -1.072199, -2.473158, 0.1882353, 1, 0, 1,
-0.5027986, -0.6953076, -3.681039, 0.1803922, 1, 0, 1,
-0.4896658, -2.892255, -2.00779, 0.1764706, 1, 0, 1,
-0.4893851, 0.6409172, 0.6044304, 0.1686275, 1, 0, 1,
-0.4893295, 1.522935, -0.05175761, 0.1647059, 1, 0, 1,
-0.4873401, 0.4988176, 0.1156385, 0.1568628, 1, 0, 1,
-0.4800647, -1.127339, -4.484632, 0.1529412, 1, 0, 1,
-0.4787608, -1.032168, -2.570835, 0.145098, 1, 0, 1,
-0.4606767, -0.8806707, -1.671662, 0.1411765, 1, 0, 1,
-0.4548103, 0.8213652, -1.303633, 0.1333333, 1, 0, 1,
-0.4545257, 0.7238413, -1.529768, 0.1294118, 1, 0, 1,
-0.4500896, 0.8739797, -1.130741, 0.1215686, 1, 0, 1,
-0.4490848, -0.5574107, -2.348913, 0.1176471, 1, 0, 1,
-0.4443665, -0.9970476, -1.344244, 0.1098039, 1, 0, 1,
-0.4436196, -1.232462, -2.503376, 0.1058824, 1, 0, 1,
-0.443466, 0.3951674, -0.3791056, 0.09803922, 1, 0, 1,
-0.436365, -1.047763, -3.67702, 0.09019608, 1, 0, 1,
-0.4363216, -0.4464745, -0.9755188, 0.08627451, 1, 0, 1,
-0.4350717, 0.9851544, 1.091729, 0.07843138, 1, 0, 1,
-0.4347466, 1.553166, -0.3044026, 0.07450981, 1, 0, 1,
-0.4333169, 0.4723082, 0.4142103, 0.06666667, 1, 0, 1,
-0.4241408, 1.559339, 1.676513, 0.0627451, 1, 0, 1,
-0.4240151, 0.2445243, -1.638694, 0.05490196, 1, 0, 1,
-0.422419, 1.622451, 1.173133, 0.05098039, 1, 0, 1,
-0.4223116, -0.03631581, -2.831029, 0.04313726, 1, 0, 1,
-0.4214969, -0.4125818, -1.721848, 0.03921569, 1, 0, 1,
-0.419965, -0.1774915, -0.5393374, 0.03137255, 1, 0, 1,
-0.4186996, 0.3062864, 0.5890892, 0.02745098, 1, 0, 1,
-0.4161385, -0.3952189, -0.9987224, 0.01960784, 1, 0, 1,
-0.4157321, -1.117981, -2.753242, 0.01568628, 1, 0, 1,
-0.4101594, 0.01301023, -0.4797931, 0.007843138, 1, 0, 1,
-0.4095382, 1.390714, 0.6980417, 0.003921569, 1, 0, 1,
-0.4080481, -0.4090293, -3.100795, 0, 1, 0.003921569, 1,
-0.4056284, 0.5368869, -1.940817, 0, 1, 0.01176471, 1,
-0.4030611, 1.725944, -2.215457, 0, 1, 0.01568628, 1,
-0.402743, -0.847226, -4.365571, 0, 1, 0.02352941, 1,
-0.398371, -1.909771, -1.167746, 0, 1, 0.02745098, 1,
-0.3975542, 0.7380335, -0.6161827, 0, 1, 0.03529412, 1,
-0.3932035, -0.1181213, -1.885563, 0, 1, 0.03921569, 1,
-0.3911166, 1.675732, 3.038122, 0, 1, 0.04705882, 1,
-0.390436, -0.7268552, -2.671921, 0, 1, 0.05098039, 1,
-0.3877373, -1.217782, -2.741225, 0, 1, 0.05882353, 1,
-0.3871549, -0.8823389, -0.9105243, 0, 1, 0.0627451, 1,
-0.3862157, 0.7462513, -1.504888, 0, 1, 0.07058824, 1,
-0.3781613, 0.8189622, 0.967284, 0, 1, 0.07450981, 1,
-0.3716625, -0.6747469, -4.130103, 0, 1, 0.08235294, 1,
-0.3714085, 0.5900517, -1.46689, 0, 1, 0.08627451, 1,
-0.3657689, -0.4468559, -2.702327, 0, 1, 0.09411765, 1,
-0.3654318, -0.6277627, -1.834272, 0, 1, 0.1019608, 1,
-0.3647881, -0.7005802, -3.687549, 0, 1, 0.1058824, 1,
-0.3642885, 1.96696, 1.659279, 0, 1, 0.1137255, 1,
-0.3565193, 2.17883, -0.9314563, 0, 1, 0.1176471, 1,
-0.3564352, 0.7072874, -0.4315482, 0, 1, 0.1254902, 1,
-0.3563496, 0.3001465, -1.191571, 0, 1, 0.1294118, 1,
-0.3500997, -0.06563579, -2.399506, 0, 1, 0.1372549, 1,
-0.3500137, 1.025723, -0.7229101, 0, 1, 0.1411765, 1,
-0.3474374, 0.4412283, 0.8999, 0, 1, 0.1490196, 1,
-0.3398893, -0.1046027, -1.356431, 0, 1, 0.1529412, 1,
-0.3386521, 1.334389, 0.7346503, 0, 1, 0.1607843, 1,
-0.3237678, 0.4514708, 1.283904, 0, 1, 0.1647059, 1,
-0.3227938, -1.881718, -3.924919, 0, 1, 0.172549, 1,
-0.3189807, 0.6433359, 1.235261, 0, 1, 0.1764706, 1,
-0.3101823, -1.297453, -2.736556, 0, 1, 0.1843137, 1,
-0.2999381, -0.9820424, -2.855835, 0, 1, 0.1882353, 1,
-0.299503, 0.338978, -0.7451628, 0, 1, 0.1960784, 1,
-0.2985238, -0.2482977, -1.751507, 0, 1, 0.2039216, 1,
-0.2971276, -1.791701, -3.162928, 0, 1, 0.2078431, 1,
-0.296795, 0.7752498, 1.303615, 0, 1, 0.2156863, 1,
-0.2889122, 0.2859536, -1.829194, 0, 1, 0.2196078, 1,
-0.2873989, -3.243599, -3.264574, 0, 1, 0.227451, 1,
-0.2826369, 0.8258097, 0.3248127, 0, 1, 0.2313726, 1,
-0.2802514, 1.817959, -0.2892179, 0, 1, 0.2392157, 1,
-0.2733156, -1.270406, -2.203729, 0, 1, 0.2431373, 1,
-0.273116, -0.1655549, -2.433484, 0, 1, 0.2509804, 1,
-0.2729689, -0.236373, -2.340001, 0, 1, 0.254902, 1,
-0.2705133, -0.03265803, -2.449922, 0, 1, 0.2627451, 1,
-0.2689362, -0.3811741, -3.373817, 0, 1, 0.2666667, 1,
-0.2664244, 0.2602235, -0.8429253, 0, 1, 0.2745098, 1,
-0.2624661, 0.2293862, -2.810044, 0, 1, 0.2784314, 1,
-0.259912, -0.5081283, -2.561634, 0, 1, 0.2862745, 1,
-0.2552173, -0.5028082, -2.763594, 0, 1, 0.2901961, 1,
-0.2533607, 0.174301, -1.271047, 0, 1, 0.2980392, 1,
-0.2508567, 0.3122478, -1.369128, 0, 1, 0.3058824, 1,
-0.2489116, -0.1182238, -1.210601, 0, 1, 0.3098039, 1,
-0.2486107, 0.7518331, 1.374835, 0, 1, 0.3176471, 1,
-0.2390241, -0.8322808, -3.266898, 0, 1, 0.3215686, 1,
-0.2387276, -0.2776218, -2.993898, 0, 1, 0.3294118, 1,
-0.2386836, -1.781186, -3.286077, 0, 1, 0.3333333, 1,
-0.2384958, -0.9631321, -1.889715, 0, 1, 0.3411765, 1,
-0.2382714, -0.4672438, -3.023606, 0, 1, 0.345098, 1,
-0.2370134, -1.207034, -5.489, 0, 1, 0.3529412, 1,
-0.2369252, -0.8901727, -2.187729, 0, 1, 0.3568628, 1,
-0.2353069, -1.157212, -3.157201, 0, 1, 0.3647059, 1,
-0.235154, 0.4855297, -1.742344, 0, 1, 0.3686275, 1,
-0.2318117, -0.1295087, -1.970392, 0, 1, 0.3764706, 1,
-0.2287739, 0.1952767, -1.409476, 0, 1, 0.3803922, 1,
-0.2267794, -1.185939, -3.348031, 0, 1, 0.3882353, 1,
-0.2267612, -0.9340736, -3.643447, 0, 1, 0.3921569, 1,
-0.2240859, -1.717119, -5.037193, 0, 1, 0.4, 1,
-0.2199635, 1.150157, 0.9559733, 0, 1, 0.4078431, 1,
-0.2175038, -0.7292207, -2.696357, 0, 1, 0.4117647, 1,
-0.2170927, 0.3331688, 0.6468564, 0, 1, 0.4196078, 1,
-0.2096869, -0.1503366, -2.945184, 0, 1, 0.4235294, 1,
-0.2094718, 0.5458619, -0.49501, 0, 1, 0.4313726, 1,
-0.2075998, 0.3685882, -1.017095, 0, 1, 0.4352941, 1,
-0.2051563, 0.8671923, -1.342769, 0, 1, 0.4431373, 1,
-0.2049159, 0.9746099, 0.5023852, 0, 1, 0.4470588, 1,
-0.2042288, -0.8135633, -3.010183, 0, 1, 0.454902, 1,
-0.2015214, -0.3899831, -2.428263, 0, 1, 0.4588235, 1,
-0.1982455, -1.966091, -3.943193, 0, 1, 0.4666667, 1,
-0.1953198, -0.01804605, -1.322978, 0, 1, 0.4705882, 1,
-0.1921101, 0.6253404, 0.4807428, 0, 1, 0.4784314, 1,
-0.1902852, -0.1176056, -0.05530072, 0, 1, 0.4823529, 1,
-0.1893163, 1.250802, 4.006267, 0, 1, 0.4901961, 1,
-0.1851353, 0.7488041, -0.7400184, 0, 1, 0.4941176, 1,
-0.1826477, 1.88568, 0.4834361, 0, 1, 0.5019608, 1,
-0.1795263, -1.859181, -3.399227, 0, 1, 0.509804, 1,
-0.1769682, 0.4419858, -1.557162, 0, 1, 0.5137255, 1,
-0.1765486, -1.556907, -1.689989, 0, 1, 0.5215687, 1,
-0.1691394, 0.2698738, 2.126264, 0, 1, 0.5254902, 1,
-0.1655884, -1.189827, -2.848621, 0, 1, 0.5333334, 1,
-0.1655069, 1.525319, -1.103354, 0, 1, 0.5372549, 1,
-0.1629747, -0.5291277, -3.210795, 0, 1, 0.5450981, 1,
-0.1572915, -0.9154649, -3.330101, 0, 1, 0.5490196, 1,
-0.1570521, 1.028075, 0.2902793, 0, 1, 0.5568628, 1,
-0.1561254, -0.2155509, -0.957205, 0, 1, 0.5607843, 1,
-0.1547913, -1.49607, -2.077112, 0, 1, 0.5686275, 1,
-0.1528475, 2.241025, -0.7854484, 0, 1, 0.572549, 1,
-0.1494997, 0.1138779, -2.30482, 0, 1, 0.5803922, 1,
-0.1489498, 1.980484, 1.325405, 0, 1, 0.5843138, 1,
-0.1454424, -0.0330199, 0.3379427, 0, 1, 0.5921569, 1,
-0.1428937, 1.234204, 0.4741683, 0, 1, 0.5960785, 1,
-0.142773, 1.350825, -1.247925, 0, 1, 0.6039216, 1,
-0.1419702, -3.340564, -2.995434, 0, 1, 0.6117647, 1,
-0.1382256, -0.2405201, -2.87503, 0, 1, 0.6156863, 1,
-0.1342685, -0.1628017, -0.6288948, 0, 1, 0.6235294, 1,
-0.1305474, 0.06919745, -0.7242871, 0, 1, 0.627451, 1,
-0.1282301, -0.7521117, -3.378808, 0, 1, 0.6352941, 1,
-0.1194357, -1.928116, -3.178083, 0, 1, 0.6392157, 1,
-0.1184594, -0.693122, -3.343566, 0, 1, 0.6470588, 1,
-0.1146413, 0.2128382, -0.8913925, 0, 1, 0.6509804, 1,
-0.114273, -0.6201911, -1.779731, 0, 1, 0.6588235, 1,
-0.1081509, 0.3029392, -0.9416277, 0, 1, 0.6627451, 1,
-0.1076845, 0.5812196, 0.5833971, 0, 1, 0.6705883, 1,
-0.1069815, -0.6720176, -1.583627, 0, 1, 0.6745098, 1,
-0.09848335, -0.5456555, -4.566164, 0, 1, 0.682353, 1,
-0.09450909, -0.2744948, -2.066917, 0, 1, 0.6862745, 1,
-0.09388947, 0.7427832, -0.1605598, 0, 1, 0.6941177, 1,
-0.09231614, 1.675882, 0.7440167, 0, 1, 0.7019608, 1,
-0.08768223, -0.2495537, -4.164833, 0, 1, 0.7058824, 1,
-0.08555645, -0.8851898, -2.067423, 0, 1, 0.7137255, 1,
-0.07970962, 1.539191, 0.5063524, 0, 1, 0.7176471, 1,
-0.07947248, -1.923697, -1.759488, 0, 1, 0.7254902, 1,
-0.07817104, 0.695565, 0.2324492, 0, 1, 0.7294118, 1,
-0.07350542, 1.397584, -0.8535011, 0, 1, 0.7372549, 1,
-0.06690253, 1.091507, 0.2211856, 0, 1, 0.7411765, 1,
-0.0666033, 0.6457024, 1.449249, 0, 1, 0.7490196, 1,
-0.06583291, 0.705349, -0.5526403, 0, 1, 0.7529412, 1,
-0.06453103, -0.8884957, -4.097275, 0, 1, 0.7607843, 1,
-0.06234716, 0.7735539, 0.5580359, 0, 1, 0.7647059, 1,
-0.0576674, -0.7523456, -2.711649, 0, 1, 0.772549, 1,
-0.05764652, 1.118456, -1.36542, 0, 1, 0.7764706, 1,
-0.05687888, 0.6270345, -0.9420691, 0, 1, 0.7843137, 1,
-0.05303261, -0.5282252, -3.396593, 0, 1, 0.7882353, 1,
-0.0435684, 0.2806119, -0.01152682, 0, 1, 0.7960784, 1,
-0.04340819, -0.183598, -3.672034, 0, 1, 0.8039216, 1,
-0.04239075, 3.223848, -0.6308005, 0, 1, 0.8078431, 1,
-0.03773532, 2.241106, 0.5791112, 0, 1, 0.8156863, 1,
-0.03572775, 1.507276, 0.4742984, 0, 1, 0.8196079, 1,
-0.03438134, 0.2405725, -0.9725026, 0, 1, 0.827451, 1,
-0.02995279, -0.886344, -2.816987, 0, 1, 0.8313726, 1,
-0.0247687, 0.1981668, 0.5589269, 0, 1, 0.8392157, 1,
-0.02250345, -0.0754494, -3.316727, 0, 1, 0.8431373, 1,
-0.01964505, 0.2095982, 0.3700839, 0, 1, 0.8509804, 1,
-0.01932617, 0.1820908, 0.1253283, 0, 1, 0.854902, 1,
-0.01870983, 0.546011, -0.226587, 0, 1, 0.8627451, 1,
-0.01677741, 3.243802, -0.4627843, 0, 1, 0.8666667, 1,
-0.01323191, -0.1356466, -2.165611, 0, 1, 0.8745098, 1,
-0.007705831, -0.8030013, -3.024167, 0, 1, 0.8784314, 1,
-0.002933283, -0.02403394, -3.316004, 0, 1, 0.8862745, 1,
-0.001415208, 1.842031, -0.1265473, 0, 1, 0.8901961, 1,
-0.001099809, -0.6187692, -3.631112, 0, 1, 0.8980392, 1,
0.002239797, -2.210149, 2.277333, 0, 1, 0.9058824, 1,
0.002830538, 0.4422219, -0.313441, 0, 1, 0.9098039, 1,
0.005908815, 1.427137, -0.3469498, 0, 1, 0.9176471, 1,
0.006543863, -0.749981, 2.748259, 0, 1, 0.9215686, 1,
0.01254805, -0.8092856, 3.725269, 0, 1, 0.9294118, 1,
0.01399316, -0.4773699, 4.076308, 0, 1, 0.9333333, 1,
0.01484995, -0.5182064, 3.37819, 0, 1, 0.9411765, 1,
0.01519271, -0.2742397, 4.553504, 0, 1, 0.945098, 1,
0.01592299, -0.04097217, 2.413764, 0, 1, 0.9529412, 1,
0.01652087, 0.4286659, -0.589681, 0, 1, 0.9568627, 1,
0.02406567, 0.8110501, -0.8921931, 0, 1, 0.9647059, 1,
0.0270864, -0.4638807, 4.236492, 0, 1, 0.9686275, 1,
0.03174699, 0.08255056, 1.408032, 0, 1, 0.9764706, 1,
0.03628219, -3.200611, 2.98509, 0, 1, 0.9803922, 1,
0.03945799, -0.6942112, 3.323871, 0, 1, 0.9882353, 1,
0.04275122, 1.105581, 0.7159601, 0, 1, 0.9921569, 1,
0.04400271, 0.6638914, 0.3492171, 0, 1, 1, 1,
0.0447856, 1.853147, 1.103553, 0, 0.9921569, 1, 1,
0.04510751, 0.137143, -0.01248494, 0, 0.9882353, 1, 1,
0.04621574, -0.2763517, 3.822281, 0, 0.9803922, 1, 1,
0.04920314, 0.9563262, -0.6126009, 0, 0.9764706, 1, 1,
0.05437055, -0.1051958, 2.207577, 0, 0.9686275, 1, 1,
0.0616143, -0.6834804, 1.916206, 0, 0.9647059, 1, 1,
0.06181109, -0.05430804, 1.517359, 0, 0.9568627, 1, 1,
0.06397693, 1.550443, 0.6662441, 0, 0.9529412, 1, 1,
0.06464767, -0.4242859, 0.7446775, 0, 0.945098, 1, 1,
0.0646913, 0.6701897, 0.7265586, 0, 0.9411765, 1, 1,
0.06755354, 0.05098357, 0.2761481, 0, 0.9333333, 1, 1,
0.06818812, 0.9337209, 1.439675, 0, 0.9294118, 1, 1,
0.07098507, 0.5268936, -0.9450638, 0, 0.9215686, 1, 1,
0.07334267, 0.4671069, 0.02427367, 0, 0.9176471, 1, 1,
0.07358657, 0.5150263, -0.5028405, 0, 0.9098039, 1, 1,
0.07504319, 0.5681005, 1.861665, 0, 0.9058824, 1, 1,
0.07566316, 1.950154, 1.313729, 0, 0.8980392, 1, 1,
0.07998736, 0.1046448, -0.3748603, 0, 0.8901961, 1, 1,
0.08027845, -0.5983801, 2.616942, 0, 0.8862745, 1, 1,
0.08106028, 0.03197134, 0.8326241, 0, 0.8784314, 1, 1,
0.08144783, -1.904091, 2.596005, 0, 0.8745098, 1, 1,
0.09317426, -0.2908663, 3.395764, 0, 0.8666667, 1, 1,
0.09600437, -0.4924531, 4.060429, 0, 0.8627451, 1, 1,
0.09704711, 1.073947, 0.8648009, 0, 0.854902, 1, 1,
0.09740324, -1.20939, 3.429625, 0, 0.8509804, 1, 1,
0.1011972, -0.2226994, 0.4485889, 0, 0.8431373, 1, 1,
0.1021054, 1.014951, -1.276721, 0, 0.8392157, 1, 1,
0.1077008, 2.104626, 0.1903603, 0, 0.8313726, 1, 1,
0.1088094, -2.667562, 3.438759, 0, 0.827451, 1, 1,
0.1138786, 1.171634, 0.6908601, 0, 0.8196079, 1, 1,
0.1163034, -0.4809366, 2.838632, 0, 0.8156863, 1, 1,
0.1167118, 1.268317, 0.295688, 0, 0.8078431, 1, 1,
0.1200119, -1.392418, 3.389995, 0, 0.8039216, 1, 1,
0.1224444, 0.1983755, 0.1534274, 0, 0.7960784, 1, 1,
0.1227255, -0.8464255, 2.261123, 0, 0.7882353, 1, 1,
0.1263255, -0.896889, 2.961432, 0, 0.7843137, 1, 1,
0.1276166, -0.7236294, 4.805753, 0, 0.7764706, 1, 1,
0.1341802, -0.2763102, 4.11182, 0, 0.772549, 1, 1,
0.1354335, 0.9215218, 1.291343, 0, 0.7647059, 1, 1,
0.1358098, 0.3871581, -1.448322, 0, 0.7607843, 1, 1,
0.1359564, 0.8872637, 1.170977, 0, 0.7529412, 1, 1,
0.1391673, -0.3178574, 2.863238, 0, 0.7490196, 1, 1,
0.1401637, -1.581116, 3.836293, 0, 0.7411765, 1, 1,
0.141819, -1.464677, 1.895581, 0, 0.7372549, 1, 1,
0.1438198, 1.583414, -1.048163, 0, 0.7294118, 1, 1,
0.1453808, 0.1249136, 0.5387064, 0, 0.7254902, 1, 1,
0.1505488, 0.2252435, -0.3682466, 0, 0.7176471, 1, 1,
0.1572722, 1.585687, -0.07798959, 0, 0.7137255, 1, 1,
0.1615229, -1.099255, 3.552219, 0, 0.7058824, 1, 1,
0.1636389, 0.6881634, 1.965796, 0, 0.6980392, 1, 1,
0.1647623, -0.637992, 2.3629, 0, 0.6941177, 1, 1,
0.1663784, -1.24189, 4.406858, 0, 0.6862745, 1, 1,
0.1686902, 1.366854, -0.6896555, 0, 0.682353, 1, 1,
0.1697004, 0.2677574, 0.5359625, 0, 0.6745098, 1, 1,
0.1698335, 0.3510593, 0.9324532, 0, 0.6705883, 1, 1,
0.1712276, 0.9463375, 1.772919, 0, 0.6627451, 1, 1,
0.1750752, 0.7830368, -0.8687291, 0, 0.6588235, 1, 1,
0.178079, -0.01186073, 1.181012, 0, 0.6509804, 1, 1,
0.1881156, -0.5826149, 3.113503, 0, 0.6470588, 1, 1,
0.1931583, -1.10103, 2.208371, 0, 0.6392157, 1, 1,
0.1932008, 1.003368, -1.27597, 0, 0.6352941, 1, 1,
0.1935482, 2.321354, 0.5666221, 0, 0.627451, 1, 1,
0.1943692, -0.8458102, 3.173056, 0, 0.6235294, 1, 1,
0.1952858, -0.3636697, 2.522652, 0, 0.6156863, 1, 1,
0.1965714, 0.9683209, 0.6113237, 0, 0.6117647, 1, 1,
0.1985064, 0.6628096, 0.5281252, 0, 0.6039216, 1, 1,
0.2017451, -0.9319699, 2.916843, 0, 0.5960785, 1, 1,
0.2110623, -0.636681, 3.163919, 0, 0.5921569, 1, 1,
0.2171376, -0.8886364, 4.487883, 0, 0.5843138, 1, 1,
0.2174048, 0.7186035, -0.3282251, 0, 0.5803922, 1, 1,
0.2180379, 1.168318, 0.957267, 0, 0.572549, 1, 1,
0.2201518, 0.3078195, 2.409096, 0, 0.5686275, 1, 1,
0.2224067, 0.966477, 1.114316, 0, 0.5607843, 1, 1,
0.224315, 0.7372273, -0.4371019, 0, 0.5568628, 1, 1,
0.2244225, 0.1704616, 0.1167884, 0, 0.5490196, 1, 1,
0.2273133, 0.06334364, 1.763601, 0, 0.5450981, 1, 1,
0.2276917, 2.7108, 0.1450728, 0, 0.5372549, 1, 1,
0.2318528, 0.07057701, 0.06403178, 0, 0.5333334, 1, 1,
0.23419, -0.004336821, 0.8737708, 0, 0.5254902, 1, 1,
0.2353992, -1.019619, 2.10517, 0, 0.5215687, 1, 1,
0.2357926, -1.028765, 3.438929, 0, 0.5137255, 1, 1,
0.2391601, -0.2039203, 0.3179417, 0, 0.509804, 1, 1,
0.2430624, 0.02577768, 1.154087, 0, 0.5019608, 1, 1,
0.2438824, 0.08541568, -0.6620266, 0, 0.4941176, 1, 1,
0.2498547, 0.6253577, -0.5512143, 0, 0.4901961, 1, 1,
0.2528312, 0.9480893, -0.2580681, 0, 0.4823529, 1, 1,
0.2573671, -0.7251631, 5.047464, 0, 0.4784314, 1, 1,
0.2586705, 0.7676138, -0.1687778, 0, 0.4705882, 1, 1,
0.2596416, 1.395088, 0.4280998, 0, 0.4666667, 1, 1,
0.2603271, -1.005018, 2.916108, 0, 0.4588235, 1, 1,
0.2611524, -0.3845155, 2.994781, 0, 0.454902, 1, 1,
0.2642296, -1.109126, 2.71991, 0, 0.4470588, 1, 1,
0.266151, 1.322859, 0.0654804, 0, 0.4431373, 1, 1,
0.2672335, -0.4139595, 2.156682, 0, 0.4352941, 1, 1,
0.2687387, -1.545121, 2.358018, 0, 0.4313726, 1, 1,
0.2689992, 0.8115557, 0.388742, 0, 0.4235294, 1, 1,
0.2723595, 1.074352, -0.419559, 0, 0.4196078, 1, 1,
0.2734043, -1.011478, 3.224495, 0, 0.4117647, 1, 1,
0.2746485, -1.566568, 3.498864, 0, 0.4078431, 1, 1,
0.2764971, 0.6399379, 1.491924, 0, 0.4, 1, 1,
0.2801588, 1.024472, 0.3570375, 0, 0.3921569, 1, 1,
0.2818866, 1.289078, -2.279474, 0, 0.3882353, 1, 1,
0.2893712, 2.367694, 0.6576928, 0, 0.3803922, 1, 1,
0.2952215, 0.6016105, 0.06451866, 0, 0.3764706, 1, 1,
0.2986299, 0.9195384, 0.5851108, 0, 0.3686275, 1, 1,
0.2999163, 1.629547, -1.392679, 0, 0.3647059, 1, 1,
0.3000714, 0.9196451, 1.009261, 0, 0.3568628, 1, 1,
0.3020957, -0.1641365, 1.341384, 0, 0.3529412, 1, 1,
0.3046095, 2.065699, -1.844698, 0, 0.345098, 1, 1,
0.305167, 0.2308607, 0.344898, 0, 0.3411765, 1, 1,
0.3055188, 0.4335483, 2.579727, 0, 0.3333333, 1, 1,
0.3075685, -0.268216, 1.127839, 0, 0.3294118, 1, 1,
0.3113773, -1.698694, 3.228201, 0, 0.3215686, 1, 1,
0.3119329, -0.1356759, 2.459165, 0, 0.3176471, 1, 1,
0.3126463, -0.3542119, 1.854855, 0, 0.3098039, 1, 1,
0.313556, -0.7503241, 3.294081, 0, 0.3058824, 1, 1,
0.3141064, -0.8836516, 1.925149, 0, 0.2980392, 1, 1,
0.3161488, 1.587512, 0.9777741, 0, 0.2901961, 1, 1,
0.3187725, -0.560282, 0.7021002, 0, 0.2862745, 1, 1,
0.3214545, -0.8293343, 2.705786, 0, 0.2784314, 1, 1,
0.3244845, -0.861006, 1.580894, 0, 0.2745098, 1, 1,
0.3290663, -0.7300879, 3.891403, 0, 0.2666667, 1, 1,
0.3293819, 0.4251245, -0.1493695, 0, 0.2627451, 1, 1,
0.3299809, -1.275759, 3.412669, 0, 0.254902, 1, 1,
0.3302709, 0.4229378, 1.531146, 0, 0.2509804, 1, 1,
0.3348568, -1.104231, 2.714811, 0, 0.2431373, 1, 1,
0.3373213, -0.9953335, 1.903739, 0, 0.2392157, 1, 1,
0.3381296, 1.860269, 0.5435877, 0, 0.2313726, 1, 1,
0.3412354, -1.093652, 1.91722, 0, 0.227451, 1, 1,
0.3450538, 0.6229979, 0.6335033, 0, 0.2196078, 1, 1,
0.3559681, 0.4505114, 1.288796, 0, 0.2156863, 1, 1,
0.3566408, 0.2643169, 2.749464, 0, 0.2078431, 1, 1,
0.3568353, -1.170721, 3.512586, 0, 0.2039216, 1, 1,
0.3631217, 0.202793, 1.865008, 0, 0.1960784, 1, 1,
0.3687334, -0.09127232, 2.163489, 0, 0.1882353, 1, 1,
0.3697844, -1.743415, 3.697384, 0, 0.1843137, 1, 1,
0.3714417, -1.944403, 3.730103, 0, 0.1764706, 1, 1,
0.3730646, -0.9980033, 2.576368, 0, 0.172549, 1, 1,
0.3766654, -1.583981, 3.538984, 0, 0.1647059, 1, 1,
0.3776881, 0.8687797, -0.2409366, 0, 0.1607843, 1, 1,
0.3797112, -0.2073979, 2.44823, 0, 0.1529412, 1, 1,
0.3859862, -1.040987, 2.303164, 0, 0.1490196, 1, 1,
0.3893801, 1.772647, 0.3240729, 0, 0.1411765, 1, 1,
0.3895551, -0.4237114, 2.866289, 0, 0.1372549, 1, 1,
0.3907359, 0.7972493, 0.8610078, 0, 0.1294118, 1, 1,
0.3935547, -0.9934852, 1.693246, 0, 0.1254902, 1, 1,
0.3938669, -1.955319, 2.455672, 0, 0.1176471, 1, 1,
0.3943685, 0.9897295, 0.8592972, 0, 0.1137255, 1, 1,
0.3948863, 0.8038395, -0.2930561, 0, 0.1058824, 1, 1,
0.3981233, -0.2982945, 2.767714, 0, 0.09803922, 1, 1,
0.3997876, -1.21108, 2.362949, 0, 0.09411765, 1, 1,
0.4045231, 0.6112329, 9.300887e-05, 0, 0.08627451, 1, 1,
0.4077714, 0.1241514, 2.812557, 0, 0.08235294, 1, 1,
0.4133677, 0.9781275, -1.488733, 0, 0.07450981, 1, 1,
0.4179484, -0.1569775, 1.346551, 0, 0.07058824, 1, 1,
0.4192395, 0.3976232, 2.279182, 0, 0.0627451, 1, 1,
0.4193458, 0.3203097, 2.285853, 0, 0.05882353, 1, 1,
0.4194905, -0.4367819, 1.679322, 0, 0.05098039, 1, 1,
0.4215123, 0.8238094, 1.296408, 0, 0.04705882, 1, 1,
0.4261355, -1.013089, 2.80485, 0, 0.03921569, 1, 1,
0.4263715, -0.4396514, 2.947417, 0, 0.03529412, 1, 1,
0.4360494, 0.8574181, 0.2110075, 0, 0.02745098, 1, 1,
0.4416957, -0.4905849, 1.622746, 0, 0.02352941, 1, 1,
0.4423787, -0.06180529, 0.7983373, 0, 0.01568628, 1, 1,
0.446073, -1.603537, 4.39994, 0, 0.01176471, 1, 1,
0.4487223, -0.8965224, 1.778252, 0, 0.003921569, 1, 1,
0.4501927, -0.2784588, 1.737704, 0.003921569, 0, 1, 1,
0.4571819, -0.3675259, 2.300906, 0.007843138, 0, 1, 1,
0.4572692, -0.2421619, 2.006631, 0.01568628, 0, 1, 1,
0.457561, 1.278717, 0.6920075, 0.01960784, 0, 1, 1,
0.4584095, -0.06479374, 2.773297, 0.02745098, 0, 1, 1,
0.4595731, 0.3308848, 1.528864, 0.03137255, 0, 1, 1,
0.4616457, -1.686912, 4.12191, 0.03921569, 0, 1, 1,
0.4627577, 0.1470916, 0.3095472, 0.04313726, 0, 1, 1,
0.4667414, 0.2398069, 0.9155843, 0.05098039, 0, 1, 1,
0.4717246, 2.03488, -0.7509826, 0.05490196, 0, 1, 1,
0.4760828, -0.4479938, 1.300968, 0.0627451, 0, 1, 1,
0.4839685, -0.05862651, 2.945835, 0.06666667, 0, 1, 1,
0.484914, 0.01838143, 1.723197, 0.07450981, 0, 1, 1,
0.489083, -0.6278824, 2.715844, 0.07843138, 0, 1, 1,
0.4936707, 0.5718832, -0.4212358, 0.08627451, 0, 1, 1,
0.4962958, -0.8724297, 4.288533, 0.09019608, 0, 1, 1,
0.4972174, -1.218965, 1.95056, 0.09803922, 0, 1, 1,
0.4986106, 0.9345907, 0.2221985, 0.1058824, 0, 1, 1,
0.499412, -0.3588806, 3.942202, 0.1098039, 0, 1, 1,
0.5022994, -0.2016298, 2.946895, 0.1176471, 0, 1, 1,
0.5031052, 0.6618094, 1.534329, 0.1215686, 0, 1, 1,
0.5078461, 1.8708, 0.003431683, 0.1294118, 0, 1, 1,
0.5098225, -0.6605704, 2.050527, 0.1333333, 0, 1, 1,
0.5107477, -0.05916259, 2.28043, 0.1411765, 0, 1, 1,
0.5108238, -0.2325275, 2.534071, 0.145098, 0, 1, 1,
0.5123417, -0.1568857, 2.443517, 0.1529412, 0, 1, 1,
0.5136033, 0.03817152, 0.04457647, 0.1568628, 0, 1, 1,
0.5185707, 1.485743, 1.008331, 0.1647059, 0, 1, 1,
0.5204881, 0.2255984, -0.4394799, 0.1686275, 0, 1, 1,
0.5218769, 0.243424, 0.7704821, 0.1764706, 0, 1, 1,
0.526125, 0.3528737, 1.046509, 0.1803922, 0, 1, 1,
0.5440751, 0.708945, -0.9614624, 0.1882353, 0, 1, 1,
0.544469, -1.426786, 1.535392, 0.1921569, 0, 1, 1,
0.5447191, 0.9318793, 0.4557716, 0.2, 0, 1, 1,
0.5485789, 1.164857, -0.4234007, 0.2078431, 0, 1, 1,
0.549152, -1.19712, 3.13149, 0.2117647, 0, 1, 1,
0.5504064, 0.609333, 0.2573069, 0.2196078, 0, 1, 1,
0.5555651, -0.325975, 1.896325, 0.2235294, 0, 1, 1,
0.5607185, -1.057994, 2.432322, 0.2313726, 0, 1, 1,
0.5621951, 0.4223877, 1.519368, 0.2352941, 0, 1, 1,
0.5638995, 1.401438, -0.4268222, 0.2431373, 0, 1, 1,
0.5640237, -0.5019963, 1.818603, 0.2470588, 0, 1, 1,
0.5754252, 2.148067, 0.01334581, 0.254902, 0, 1, 1,
0.5761529, -1.700137, 2.667871, 0.2588235, 0, 1, 1,
0.5820799, -0.1156326, 0.1948798, 0.2666667, 0, 1, 1,
0.5829115, -1.012656, 2.296664, 0.2705882, 0, 1, 1,
0.5861154, -2.07241, 2.957919, 0.2784314, 0, 1, 1,
0.5939159, -0.1796199, 2.552572, 0.282353, 0, 1, 1,
0.5952649, 1.308039, -0.8022547, 0.2901961, 0, 1, 1,
0.5986417, 1.737064, 1.782009, 0.2941177, 0, 1, 1,
0.599609, 0.4282795, -0.4570106, 0.3019608, 0, 1, 1,
0.6058377, 2.687922, 0.3270755, 0.3098039, 0, 1, 1,
0.6101604, 0.6770943, 2.339283, 0.3137255, 0, 1, 1,
0.6106614, -0.08473399, 2.545351, 0.3215686, 0, 1, 1,
0.6145085, 0.3556797, 0.321741, 0.3254902, 0, 1, 1,
0.6186356, -0.01879947, 2.19113, 0.3333333, 0, 1, 1,
0.6207598, -0.9881964, 2.829055, 0.3372549, 0, 1, 1,
0.6277987, -0.2020529, 3.536722, 0.345098, 0, 1, 1,
0.6398759, 1.7359, 2.404281, 0.3490196, 0, 1, 1,
0.6415955, -0.0769559, 1.548673, 0.3568628, 0, 1, 1,
0.6485024, 0.870523, 0.9363949, 0.3607843, 0, 1, 1,
0.650675, -0.8326358, 3.700808, 0.3686275, 0, 1, 1,
0.652389, 0.5180146, 0.828266, 0.372549, 0, 1, 1,
0.6687145, 0.9937959, 3.42082, 0.3803922, 0, 1, 1,
0.6835385, 1.427581, -1.615941, 0.3843137, 0, 1, 1,
0.6846187, 0.00615213, 2.332519, 0.3921569, 0, 1, 1,
0.6868775, 1.936478, 1.199483, 0.3960784, 0, 1, 1,
0.6904315, 0.2852366, 0.6881496, 0.4039216, 0, 1, 1,
0.6928631, -0.01504756, 3.095983, 0.4117647, 0, 1, 1,
0.6951874, 0.9684581, 0.004699385, 0.4156863, 0, 1, 1,
0.6980861, -1.235456, 1.140355, 0.4235294, 0, 1, 1,
0.6997227, -0.6062523, 2.325579, 0.427451, 0, 1, 1,
0.7018448, -0.7180364, 2.458671, 0.4352941, 0, 1, 1,
0.7054666, -1.441522, 2.315847, 0.4392157, 0, 1, 1,
0.7073792, -0.9517518, 1.895653, 0.4470588, 0, 1, 1,
0.7089239, 0.2023866, 1.177184, 0.4509804, 0, 1, 1,
0.7100046, -1.193359, 3.229376, 0.4588235, 0, 1, 1,
0.7120013, -1.583545, 2.220716, 0.4627451, 0, 1, 1,
0.7125605, 0.04072573, 0.8970324, 0.4705882, 0, 1, 1,
0.7127472, -0.4980458, 3.977317, 0.4745098, 0, 1, 1,
0.7146808, 1.269841, 1.051631, 0.4823529, 0, 1, 1,
0.7213422, -0.2654786, 0.9029696, 0.4862745, 0, 1, 1,
0.7217578, 1.368335, 1.251633, 0.4941176, 0, 1, 1,
0.7297373, 0.3028105, 0.007559133, 0.5019608, 0, 1, 1,
0.7309849, 1.989874, 1.776747, 0.5058824, 0, 1, 1,
0.7315884, -0.07811362, 1.555715, 0.5137255, 0, 1, 1,
0.7345086, 0.4080212, 1.803666, 0.5176471, 0, 1, 1,
0.7354127, -1.885478, 2.418057, 0.5254902, 0, 1, 1,
0.7365144, -1.074182, 1.911608, 0.5294118, 0, 1, 1,
0.7374418, -0.3140246, 3.141166, 0.5372549, 0, 1, 1,
0.7388355, -1.213971, 3.888894, 0.5411765, 0, 1, 1,
0.7415001, -0.1144017, -0.7887042, 0.5490196, 0, 1, 1,
0.7441191, -0.3281841, 2.036773, 0.5529412, 0, 1, 1,
0.7456277, 0.5261945, 0.7373646, 0.5607843, 0, 1, 1,
0.7463087, -0.3762013, 1.865011, 0.5647059, 0, 1, 1,
0.7477236, 0.06896466, 1.462347, 0.572549, 0, 1, 1,
0.7484202, -0.9997768, 2.056438, 0.5764706, 0, 1, 1,
0.7511585, -1.217787, 3.458316, 0.5843138, 0, 1, 1,
0.7533443, 1.091635, 1.344849, 0.5882353, 0, 1, 1,
0.7573323, -1.182527, 1.860079, 0.5960785, 0, 1, 1,
0.7615228, -1.643299, 3.645427, 0.6039216, 0, 1, 1,
0.76415, -0.4862949, 3.765233, 0.6078432, 0, 1, 1,
0.7776881, 0.6691313, 1.303852, 0.6156863, 0, 1, 1,
0.7789487, -0.2685956, 3.18612, 0.6196079, 0, 1, 1,
0.7858359, -1.002856, 0.2918157, 0.627451, 0, 1, 1,
0.7860974, 0.265061, 0.5682032, 0.6313726, 0, 1, 1,
0.7904143, -0.07431496, 2.088642, 0.6392157, 0, 1, 1,
0.7920226, -0.08538601, 0.6309721, 0.6431373, 0, 1, 1,
0.793849, 0.4029108, 0.1750837, 0.6509804, 0, 1, 1,
0.8001802, -0.1991687, 1.65593, 0.654902, 0, 1, 1,
0.8033071, -0.04534728, 0.239029, 0.6627451, 0, 1, 1,
0.8036543, -0.7842424, 1.323852, 0.6666667, 0, 1, 1,
0.8115846, -0.1621546, 1.461733, 0.6745098, 0, 1, 1,
0.8119186, -1.149131, 1.296049, 0.6784314, 0, 1, 1,
0.8153458, -0.658126, 1.834512, 0.6862745, 0, 1, 1,
0.8163437, -1.017843, 0.8004814, 0.6901961, 0, 1, 1,
0.8175941, 0.8977199, 0.4458181, 0.6980392, 0, 1, 1,
0.8208632, -0.0563307, 1.618658, 0.7058824, 0, 1, 1,
0.8322763, -0.7795377, 2.938925, 0.7098039, 0, 1, 1,
0.8336, 1.093934, 1.109858, 0.7176471, 0, 1, 1,
0.8368731, 0.6885028, -0.3366894, 0.7215686, 0, 1, 1,
0.8385841, 1.200981, 0.01310867, 0.7294118, 0, 1, 1,
0.843955, -1.265074, 1.249537, 0.7333333, 0, 1, 1,
0.8487463, -0.2084863, 1.20887, 0.7411765, 0, 1, 1,
0.8568169, 1.67458, 0.3678563, 0.7450981, 0, 1, 1,
0.8569488, -0.3508233, 4.181518, 0.7529412, 0, 1, 1,
0.8627882, -1.058076, 2.221746, 0.7568628, 0, 1, 1,
0.8687419, -1.354441, 2.53749, 0.7647059, 0, 1, 1,
0.8707384, -0.06501114, 1.542392, 0.7686275, 0, 1, 1,
0.8747144, 1.307429, 2.786599, 0.7764706, 0, 1, 1,
0.8797302, 1.594638, -0.1921982, 0.7803922, 0, 1, 1,
0.8801686, 0.2013814, 2.17084, 0.7882353, 0, 1, 1,
0.8849925, -0.7719276, 0.8709789, 0.7921569, 0, 1, 1,
0.888907, -1.042929, 2.406242, 0.8, 0, 1, 1,
0.8930616, 0.8211674, -0.0612231, 0.8078431, 0, 1, 1,
0.8995945, -0.9922237, 2.387228, 0.8117647, 0, 1, 1,
0.9015806, 1.020607, 1.906984, 0.8196079, 0, 1, 1,
0.9057396, 0.5096706, 0.05627609, 0.8235294, 0, 1, 1,
0.9135064, 0.5510421, 0.7194019, 0.8313726, 0, 1, 1,
0.9208667, -0.07846389, 1.021774, 0.8352941, 0, 1, 1,
0.9251488, -1.608422, 0.387554, 0.8431373, 0, 1, 1,
0.9270536, -1.050028, 3.059363, 0.8470588, 0, 1, 1,
0.9330265, -1.141227, 4.330563, 0.854902, 0, 1, 1,
0.9360618, 0.6588817, 1.511046, 0.8588235, 0, 1, 1,
0.9430348, 0.5147037, 1.956775, 0.8666667, 0, 1, 1,
0.9485124, -1.039177, 2.905223, 0.8705882, 0, 1, 1,
0.9489049, 2.617252, 0.2297047, 0.8784314, 0, 1, 1,
0.9506353, 0.4153739, 0.8058777, 0.8823529, 0, 1, 1,
0.9536307, -0.659143, 3.847759, 0.8901961, 0, 1, 1,
0.9588214, 1.029317, -1.369735, 0.8941177, 0, 1, 1,
0.9681919, -1.06064, 2.817206, 0.9019608, 0, 1, 1,
0.9693766, 0.4294727, 0.5985099, 0.9098039, 0, 1, 1,
0.9712815, -1.450095, 1.929858, 0.9137255, 0, 1, 1,
0.9724045, -0.3488619, 1.877516, 0.9215686, 0, 1, 1,
0.9753938, 1.806466, 0.7417919, 0.9254902, 0, 1, 1,
0.9757219, 1.070086, 0.1950718, 0.9333333, 0, 1, 1,
0.9831151, -0.03854192, 1.622096, 0.9372549, 0, 1, 1,
0.9846023, 0.006102942, 1.166485, 0.945098, 0, 1, 1,
0.9859775, -1.773078, 1.732862, 0.9490196, 0, 1, 1,
0.9950851, -0.02136074, 2.557502, 0.9568627, 0, 1, 1,
1.000788, -2.570593, 0.9317415, 0.9607843, 0, 1, 1,
1.001217, 0.537501, 1.590756, 0.9686275, 0, 1, 1,
1.005629, 0.3487774, 2.280766, 0.972549, 0, 1, 1,
1.019478, 0.4546034, 1.153037, 0.9803922, 0, 1, 1,
1.028318, -1.144607, 3.187151, 0.9843137, 0, 1, 1,
1.035291, -1.102195, 2.834506, 0.9921569, 0, 1, 1,
1.039316, 1.03376, 1.70666, 0.9960784, 0, 1, 1,
1.041643, -0.1214135, 3.068793, 1, 0, 0.9960784, 1,
1.041764, -0.03466736, 1.594348, 1, 0, 0.9882353, 1,
1.050077, -0.9050793, 3.426832, 1, 0, 0.9843137, 1,
1.053722, -1.055504, 2.806303, 1, 0, 0.9764706, 1,
1.059758, 1.320783, 1.561245, 1, 0, 0.972549, 1,
1.066119, -0.3671017, 1.812692, 1, 0, 0.9647059, 1,
1.066686, -0.1312855, 1.633204, 1, 0, 0.9607843, 1,
1.071183, 0.9287083, 1.439211, 1, 0, 0.9529412, 1,
1.072151, 0.2044182, -0.3711386, 1, 0, 0.9490196, 1,
1.074635, 0.7132962, 1.086113, 1, 0, 0.9411765, 1,
1.083018, 0.1751919, -0.5180944, 1, 0, 0.9372549, 1,
1.087739, 0.9087673, 0.869634, 1, 0, 0.9294118, 1,
1.095018, -0.227379, 1.764536, 1, 0, 0.9254902, 1,
1.103737, -0.2204916, 0.595298, 1, 0, 0.9176471, 1,
1.112158, -1.473361, 2.453565, 1, 0, 0.9137255, 1,
1.11517, -0.5159942, -0.461529, 1, 0, 0.9058824, 1,
1.115207, -1.209426, 3.902837, 1, 0, 0.9019608, 1,
1.11725, 0.4318081, 0.1191337, 1, 0, 0.8941177, 1,
1.119157, -0.6726976, 2.043983, 1, 0, 0.8862745, 1,
1.131953, -0.6523944, 2.913888, 1, 0, 0.8823529, 1,
1.135563, 0.4090714, 0.4675049, 1, 0, 0.8745098, 1,
1.139568, 0.5255257, 0.4068257, 1, 0, 0.8705882, 1,
1.14708, 1.768553, 0.7932028, 1, 0, 0.8627451, 1,
1.147145, -0.4117417, 0.9810337, 1, 0, 0.8588235, 1,
1.148556, 0.5818244, 2.096453, 1, 0, 0.8509804, 1,
1.158807, -0.3945515, 1.21345, 1, 0, 0.8470588, 1,
1.158842, -0.5024776, 2.464316, 1, 0, 0.8392157, 1,
1.163195, -0.09811953, 2.378963, 1, 0, 0.8352941, 1,
1.168862, 1.062144, 2.212188, 1, 0, 0.827451, 1,
1.171331, 1.281946, 2.366187, 1, 0, 0.8235294, 1,
1.175793, -2.450642, 2.501467, 1, 0, 0.8156863, 1,
1.181958, -0.6333982, 2.102632, 1, 0, 0.8117647, 1,
1.185091, -0.2193262, 0.9438695, 1, 0, 0.8039216, 1,
1.188587, 0.5231851, 0.6643546, 1, 0, 0.7960784, 1,
1.189367, -0.1387459, 2.431832, 1, 0, 0.7921569, 1,
1.195572, -0.3385493, 2.228186, 1, 0, 0.7843137, 1,
1.201292, -0.7758502, 1.537966, 1, 0, 0.7803922, 1,
1.201677, 0.1661579, 1.799374, 1, 0, 0.772549, 1,
1.203687, 1.027048, 1.649757, 1, 0, 0.7686275, 1,
1.204052, -1.717452, 0.7571035, 1, 0, 0.7607843, 1,
1.205635, -1.245037, 2.165644, 1, 0, 0.7568628, 1,
1.206671, -0.6076158, 2.766037, 1, 0, 0.7490196, 1,
1.220008, 0.7632591, 0.154158, 1, 0, 0.7450981, 1,
1.222322, 0.2486634, 1.804274, 1, 0, 0.7372549, 1,
1.224825, -0.4070802, 2.963994, 1, 0, 0.7333333, 1,
1.236832, 1.734771, 1.131418, 1, 0, 0.7254902, 1,
1.238289, 1.37498, -0.590373, 1, 0, 0.7215686, 1,
1.24496, -2.130221, 0.4980173, 1, 0, 0.7137255, 1,
1.249236, 0.08613328, 1.836453, 1, 0, 0.7098039, 1,
1.26107, -0.2862456, 0.7639129, 1, 0, 0.7019608, 1,
1.266804, -1.739794, 1.490124, 1, 0, 0.6941177, 1,
1.27237, 0.9473414, 0.6305544, 1, 0, 0.6901961, 1,
1.278584, 0.13856, 0.9564809, 1, 0, 0.682353, 1,
1.281917, 0.04423227, 1.780756, 1, 0, 0.6784314, 1,
1.286549, -0.3430133, 3.144207, 1, 0, 0.6705883, 1,
1.28799, 1.492354, -0.2833119, 1, 0, 0.6666667, 1,
1.288095, 0.2266079, 1.504752, 1, 0, 0.6588235, 1,
1.288151, -0.09682596, 1.171873, 1, 0, 0.654902, 1,
1.289142, -1.022625, 2.602943, 1, 0, 0.6470588, 1,
1.293815, 0.8648644, 0.3105471, 1, 0, 0.6431373, 1,
1.295727, -0.6863316, 1.911485, 1, 0, 0.6352941, 1,
1.300549, 0.3844787, 1.870824, 1, 0, 0.6313726, 1,
1.304807, 0.8057736, 0.0008626695, 1, 0, 0.6235294, 1,
1.307172, -0.4462505, 0.132829, 1, 0, 0.6196079, 1,
1.309832, -0.8571716, 3.051054, 1, 0, 0.6117647, 1,
1.31879, 1.719609, 0.4468236, 1, 0, 0.6078432, 1,
1.324022, -0.6481429, 1.377429, 1, 0, 0.6, 1,
1.328816, -1.29856, 2.23553, 1, 0, 0.5921569, 1,
1.332817, -0.2568719, 2.329989, 1, 0, 0.5882353, 1,
1.334823, 1.421053, 0.8238976, 1, 0, 0.5803922, 1,
1.337036, -0.4957843, 1.962924, 1, 0, 0.5764706, 1,
1.357223, 0.03677708, 1.200312, 1, 0, 0.5686275, 1,
1.359213, 1.144861, 2.499242, 1, 0, 0.5647059, 1,
1.377574, 1.310087, 1.392952, 1, 0, 0.5568628, 1,
1.400932, 0.8990916, 0.5626757, 1, 0, 0.5529412, 1,
1.407244, 0.8440152, 2.117739, 1, 0, 0.5450981, 1,
1.408519, 1.308976, -1.384174, 1, 0, 0.5411765, 1,
1.408691, -1.089865, 1.041858, 1, 0, 0.5333334, 1,
1.412023, -0.4975309, 2.219159, 1, 0, 0.5294118, 1,
1.414465, -0.463442, 1.739782, 1, 0, 0.5215687, 1,
1.421953, -1.709404, 2.102038, 1, 0, 0.5176471, 1,
1.426872, -0.01312253, 1.640604, 1, 0, 0.509804, 1,
1.427882, 1.425755, 0.870097, 1, 0, 0.5058824, 1,
1.428318, 0.4506318, 1.233153, 1, 0, 0.4980392, 1,
1.432397, -0.4540073, 2.183172, 1, 0, 0.4901961, 1,
1.435257, 0.4377064, 1.373127, 1, 0, 0.4862745, 1,
1.45003, 1.17529, 0.7594028, 1, 0, 0.4784314, 1,
1.460693, -2.413019, 4.705887, 1, 0, 0.4745098, 1,
1.460953, -0.2750996, 3.58272, 1, 0, 0.4666667, 1,
1.464354, 0.2136465, 0.5945617, 1, 0, 0.4627451, 1,
1.46511, 0.678578, 1.595948, 1, 0, 0.454902, 1,
1.472413, 0.697705, 1.315641, 1, 0, 0.4509804, 1,
1.480003, -0.8156325, 1.492982, 1, 0, 0.4431373, 1,
1.480293, 0.5679854, 0.910154, 1, 0, 0.4392157, 1,
1.481246, -0.3926641, 1.346346, 1, 0, 0.4313726, 1,
1.490985, -0.2731042, 2.593557, 1, 0, 0.427451, 1,
1.533586, 1.190685, 1.370066, 1, 0, 0.4196078, 1,
1.54467, 0.3080621, 3.255027, 1, 0, 0.4156863, 1,
1.545191, -0.08723639, 3.097359, 1, 0, 0.4078431, 1,
1.55553, -0.5340341, 1.877509, 1, 0, 0.4039216, 1,
1.566619, 0.5644277, 1.651311, 1, 0, 0.3960784, 1,
1.580741, 0.5187274, 0.7202192, 1, 0, 0.3882353, 1,
1.583025, -1.126112, 1.143899, 1, 0, 0.3843137, 1,
1.585117, 1.204128, -0.4600555, 1, 0, 0.3764706, 1,
1.596501, 0.6724778, 2.081142, 1, 0, 0.372549, 1,
1.602093, 0.04375184, 1.876438, 1, 0, 0.3647059, 1,
1.616941, -0.5984517, 2.352777, 1, 0, 0.3607843, 1,
1.624043, 0.2581648, 2.72371, 1, 0, 0.3529412, 1,
1.627687, -0.4897669, 3.064938, 1, 0, 0.3490196, 1,
1.634154, -1.515818, 4.339231, 1, 0, 0.3411765, 1,
1.635121, -0.2370163, 2.274523, 1, 0, 0.3372549, 1,
1.639529, 0.001078462, 1.92473, 1, 0, 0.3294118, 1,
1.652401, -1.050964, 0.5583653, 1, 0, 0.3254902, 1,
1.663181, 0.7645598, 1.482117, 1, 0, 0.3176471, 1,
1.664961, -0.726673, 3.51618, 1, 0, 0.3137255, 1,
1.675369, 2.045698, -1.80996, 1, 0, 0.3058824, 1,
1.684031, 0.3842268, 1.262646, 1, 0, 0.2980392, 1,
1.70021, -0.3567904, 0.5103738, 1, 0, 0.2941177, 1,
1.703852, -0.9761671, 1.407959, 1, 0, 0.2862745, 1,
1.708624, 1.58294, 3.436219, 1, 0, 0.282353, 1,
1.709422, 0.4238847, 0.2159092, 1, 0, 0.2745098, 1,
1.717341, 1.388907, 0.9924669, 1, 0, 0.2705882, 1,
1.727481, 0.004639138, 0.1243847, 1, 0, 0.2627451, 1,
1.732514, 0.6396742, 0.3129556, 1, 0, 0.2588235, 1,
1.750039, 1.342198, 0.8614001, 1, 0, 0.2509804, 1,
1.770256, 0.5626193, 1.130336, 1, 0, 0.2470588, 1,
1.807884, 1.324554, 1.575071, 1, 0, 0.2392157, 1,
1.808244, 0.431555, 0.4662751, 1, 0, 0.2352941, 1,
1.812023, 1.4686, 0.7883186, 1, 0, 0.227451, 1,
1.840163, 1.546037, 0.4366801, 1, 0, 0.2235294, 1,
1.861553, 0.3741434, 0.8940143, 1, 0, 0.2156863, 1,
1.899775, 1.214055, 0.7838774, 1, 0, 0.2117647, 1,
1.905989, -0.8118573, 0.298843, 1, 0, 0.2039216, 1,
1.970176, -0.652163, 2.449197, 1, 0, 0.1960784, 1,
1.978697, 0.1606856, 1.626351, 1, 0, 0.1921569, 1,
1.980731, 0.09626979, 2.471346, 1, 0, 0.1843137, 1,
2.002451, -0.5013801, 1.647211, 1, 0, 0.1803922, 1,
2.055819, -0.5567626, 2.328338, 1, 0, 0.172549, 1,
2.068934, 0.2274555, 1.394366, 1, 0, 0.1686275, 1,
2.084908, 0.599717, 2.311711, 1, 0, 0.1607843, 1,
2.10397, -1.347733, 2.907247, 1, 0, 0.1568628, 1,
2.107318, 1.326591, -0.1513106, 1, 0, 0.1490196, 1,
2.121204, 0.01206359, -0.4968912, 1, 0, 0.145098, 1,
2.130843, 0.2733361, 1.242284, 1, 0, 0.1372549, 1,
2.15754, 0.5413322, 2.276907, 1, 0, 0.1333333, 1,
2.177633, 0.9785259, -0.9575365, 1, 0, 0.1254902, 1,
2.184923, 1.460858, 0.6335354, 1, 0, 0.1215686, 1,
2.215584, 0.2404751, 2.214502, 1, 0, 0.1137255, 1,
2.220501, -1.036425, 2.660895, 1, 0, 0.1098039, 1,
2.228741, -0.06867518, 2.027798, 1, 0, 0.1019608, 1,
2.265615, -0.1176057, 2.273907, 1, 0, 0.09411765, 1,
2.267847, 0.7852107, 1.613023, 1, 0, 0.09019608, 1,
2.273024, 0.4820749, 2.359331, 1, 0, 0.08235294, 1,
2.305827, 0.06723942, 1.816652, 1, 0, 0.07843138, 1,
2.384196, -0.9829255, 3.458191, 1, 0, 0.07058824, 1,
2.459122, -0.704843, 2.396021, 1, 0, 0.06666667, 1,
2.459916, 0.1458631, 2.27664, 1, 0, 0.05882353, 1,
2.502491, -0.4298514, -0.5702151, 1, 0, 0.05490196, 1,
2.516267, -2.529839, 2.127214, 1, 0, 0.04705882, 1,
2.547298, 0.9323282, 0.1906928, 1, 0, 0.04313726, 1,
2.565004, 0.186105, 1.753811, 1, 0, 0.03529412, 1,
2.662437, 2.492883, 1.120023, 1, 0, 0.03137255, 1,
2.746469, -0.005842911, 1.727822, 1, 0, 0.02352941, 1,
2.776903, -0.1686016, 1.981049, 1, 0, 0.01960784, 1,
2.9073, 0.6758133, 0.7685856, 1, 0, 0.01176471, 1,
3.055596, 0.07509348, 1.579431, 1, 0, 0.007843138, 1
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
-0.1135507, -4.456614, -7.634695, 0, -0.5, 0.5, 0.5,
-0.1135507, -4.456614, -7.634695, 1, -0.5, 0.5, 0.5,
-0.1135507, -4.456614, -7.634695, 1, 1.5, 0.5, 0.5,
-0.1135507, -4.456614, -7.634695, 0, 1.5, 0.5, 0.5
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
-4.357038, -0.04838109, -7.634695, 0, -0.5, 0.5, 0.5,
-4.357038, -0.04838109, -7.634695, 1, -0.5, 0.5, 0.5,
-4.357038, -0.04838109, -7.634695, 1, 1.5, 0.5, 0.5,
-4.357038, -0.04838109, -7.634695, 0, 1.5, 0.5, 0.5
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
-4.357038, -4.456614, -0.374579, 0, -0.5, 0.5, 0.5,
-4.357038, -4.456614, -0.374579, 1, -0.5, 0.5, 0.5,
-4.357038, -4.456614, -0.374579, 1, 1.5, 0.5, 0.5,
-4.357038, -4.456614, -0.374579, 0, 1.5, 0.5, 0.5
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
-3, -3.439329, -5.959283,
3, -3.439329, -5.959283,
-3, -3.439329, -5.959283,
-3, -3.608877, -6.238519,
-2, -3.439329, -5.959283,
-2, -3.608877, -6.238519,
-1, -3.439329, -5.959283,
-1, -3.608877, -6.238519,
0, -3.439329, -5.959283,
0, -3.608877, -6.238519,
1, -3.439329, -5.959283,
1, -3.608877, -6.238519,
2, -3.439329, -5.959283,
2, -3.608877, -6.238519,
3, -3.439329, -5.959283,
3, -3.608877, -6.238519
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
-3, -3.947972, -6.796989, 0, -0.5, 0.5, 0.5,
-3, -3.947972, -6.796989, 1, -0.5, 0.5, 0.5,
-3, -3.947972, -6.796989, 1, 1.5, 0.5, 0.5,
-3, -3.947972, -6.796989, 0, 1.5, 0.5, 0.5,
-2, -3.947972, -6.796989, 0, -0.5, 0.5, 0.5,
-2, -3.947972, -6.796989, 1, -0.5, 0.5, 0.5,
-2, -3.947972, -6.796989, 1, 1.5, 0.5, 0.5,
-2, -3.947972, -6.796989, 0, 1.5, 0.5, 0.5,
-1, -3.947972, -6.796989, 0, -0.5, 0.5, 0.5,
-1, -3.947972, -6.796989, 1, -0.5, 0.5, 0.5,
-1, -3.947972, -6.796989, 1, 1.5, 0.5, 0.5,
-1, -3.947972, -6.796989, 0, 1.5, 0.5, 0.5,
0, -3.947972, -6.796989, 0, -0.5, 0.5, 0.5,
0, -3.947972, -6.796989, 1, -0.5, 0.5, 0.5,
0, -3.947972, -6.796989, 1, 1.5, 0.5, 0.5,
0, -3.947972, -6.796989, 0, 1.5, 0.5, 0.5,
1, -3.947972, -6.796989, 0, -0.5, 0.5, 0.5,
1, -3.947972, -6.796989, 1, -0.5, 0.5, 0.5,
1, -3.947972, -6.796989, 1, 1.5, 0.5, 0.5,
1, -3.947972, -6.796989, 0, 1.5, 0.5, 0.5,
2, -3.947972, -6.796989, 0, -0.5, 0.5, 0.5,
2, -3.947972, -6.796989, 1, -0.5, 0.5, 0.5,
2, -3.947972, -6.796989, 1, 1.5, 0.5, 0.5,
2, -3.947972, -6.796989, 0, 1.5, 0.5, 0.5,
3, -3.947972, -6.796989, 0, -0.5, 0.5, 0.5,
3, -3.947972, -6.796989, 1, -0.5, 0.5, 0.5,
3, -3.947972, -6.796989, 1, 1.5, 0.5, 0.5,
3, -3.947972, -6.796989, 0, 1.5, 0.5, 0.5
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
-3.377772, -3, -5.959283,
-3.377772, 3, -5.959283,
-3.377772, -3, -5.959283,
-3.540983, -3, -6.238519,
-3.377772, -2, -5.959283,
-3.540983, -2, -6.238519,
-3.377772, -1, -5.959283,
-3.540983, -1, -6.238519,
-3.377772, 0, -5.959283,
-3.540983, 0, -6.238519,
-3.377772, 1, -5.959283,
-3.540983, 1, -6.238519,
-3.377772, 2, -5.959283,
-3.540983, 2, -6.238519,
-3.377772, 3, -5.959283,
-3.540983, 3, -6.238519
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
-3.867405, -3, -6.796989, 0, -0.5, 0.5, 0.5,
-3.867405, -3, -6.796989, 1, -0.5, 0.5, 0.5,
-3.867405, -3, -6.796989, 1, 1.5, 0.5, 0.5,
-3.867405, -3, -6.796989, 0, 1.5, 0.5, 0.5,
-3.867405, -2, -6.796989, 0, -0.5, 0.5, 0.5,
-3.867405, -2, -6.796989, 1, -0.5, 0.5, 0.5,
-3.867405, -2, -6.796989, 1, 1.5, 0.5, 0.5,
-3.867405, -2, -6.796989, 0, 1.5, 0.5, 0.5,
-3.867405, -1, -6.796989, 0, -0.5, 0.5, 0.5,
-3.867405, -1, -6.796989, 1, -0.5, 0.5, 0.5,
-3.867405, -1, -6.796989, 1, 1.5, 0.5, 0.5,
-3.867405, -1, -6.796989, 0, 1.5, 0.5, 0.5,
-3.867405, 0, -6.796989, 0, -0.5, 0.5, 0.5,
-3.867405, 0, -6.796989, 1, -0.5, 0.5, 0.5,
-3.867405, 0, -6.796989, 1, 1.5, 0.5, 0.5,
-3.867405, 0, -6.796989, 0, 1.5, 0.5, 0.5,
-3.867405, 1, -6.796989, 0, -0.5, 0.5, 0.5,
-3.867405, 1, -6.796989, 1, -0.5, 0.5, 0.5,
-3.867405, 1, -6.796989, 1, 1.5, 0.5, 0.5,
-3.867405, 1, -6.796989, 0, 1.5, 0.5, 0.5,
-3.867405, 2, -6.796989, 0, -0.5, 0.5, 0.5,
-3.867405, 2, -6.796989, 1, -0.5, 0.5, 0.5,
-3.867405, 2, -6.796989, 1, 1.5, 0.5, 0.5,
-3.867405, 2, -6.796989, 0, 1.5, 0.5, 0.5,
-3.867405, 3, -6.796989, 0, -0.5, 0.5, 0.5,
-3.867405, 3, -6.796989, 1, -0.5, 0.5, 0.5,
-3.867405, 3, -6.796989, 1, 1.5, 0.5, 0.5,
-3.867405, 3, -6.796989, 0, 1.5, 0.5, 0.5
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
-3.377772, -3.439329, -4,
-3.377772, -3.439329, 4,
-3.377772, -3.439329, -4,
-3.540983, -3.608877, -4,
-3.377772, -3.439329, -2,
-3.540983, -3.608877, -2,
-3.377772, -3.439329, 0,
-3.540983, -3.608877, 0,
-3.377772, -3.439329, 2,
-3.540983, -3.608877, 2,
-3.377772, -3.439329, 4,
-3.540983, -3.608877, 4
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
-3.867405, -3.947972, -4, 0, -0.5, 0.5, 0.5,
-3.867405, -3.947972, -4, 1, -0.5, 0.5, 0.5,
-3.867405, -3.947972, -4, 1, 1.5, 0.5, 0.5,
-3.867405, -3.947972, -4, 0, 1.5, 0.5, 0.5,
-3.867405, -3.947972, -2, 0, -0.5, 0.5, 0.5,
-3.867405, -3.947972, -2, 1, -0.5, 0.5, 0.5,
-3.867405, -3.947972, -2, 1, 1.5, 0.5, 0.5,
-3.867405, -3.947972, -2, 0, 1.5, 0.5, 0.5,
-3.867405, -3.947972, 0, 0, -0.5, 0.5, 0.5,
-3.867405, -3.947972, 0, 1, -0.5, 0.5, 0.5,
-3.867405, -3.947972, 0, 1, 1.5, 0.5, 0.5,
-3.867405, -3.947972, 0, 0, 1.5, 0.5, 0.5,
-3.867405, -3.947972, 2, 0, -0.5, 0.5, 0.5,
-3.867405, -3.947972, 2, 1, -0.5, 0.5, 0.5,
-3.867405, -3.947972, 2, 1, 1.5, 0.5, 0.5,
-3.867405, -3.947972, 2, 0, 1.5, 0.5, 0.5,
-3.867405, -3.947972, 4, 0, -0.5, 0.5, 0.5,
-3.867405, -3.947972, 4, 1, -0.5, 0.5, 0.5,
-3.867405, -3.947972, 4, 1, 1.5, 0.5, 0.5,
-3.867405, -3.947972, 4, 0, 1.5, 0.5, 0.5
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
-3.377772, -3.439329, -5.959283,
-3.377772, 3.342567, -5.959283,
-3.377772, -3.439329, 5.210125,
-3.377772, 3.342567, 5.210125,
-3.377772, -3.439329, -5.959283,
-3.377772, -3.439329, 5.210125,
-3.377772, 3.342567, -5.959283,
-3.377772, 3.342567, 5.210125,
-3.377772, -3.439329, -5.959283,
3.150671, -3.439329, -5.959283,
-3.377772, -3.439329, 5.210125,
3.150671, -3.439329, 5.210125,
-3.377772, 3.342567, -5.959283,
3.150671, 3.342567, -5.959283,
-3.377772, 3.342567, 5.210125,
3.150671, 3.342567, 5.210125,
3.150671, -3.439329, -5.959283,
3.150671, 3.342567, -5.959283,
3.150671, -3.439329, 5.210125,
3.150671, 3.342567, 5.210125,
3.150671, -3.439329, -5.959283,
3.150671, -3.439329, 5.210125,
3.150671, 3.342567, -5.959283,
3.150671, 3.342567, 5.210125
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
var radius = 7.799963;
var distance = 34.70292;
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
mvMatrix.translate( 0.1135507, 0.04838109, 0.374579 );
mvMatrix.scale( 1.291805, 1.243527, 0.7550509 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.70292);
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
diethatyl<-read.table("diethatyl.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-diethatyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'diethatyl' not found
```

```r
y<-diethatyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'diethatyl' not found
```

```r
z<-diethatyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'diethatyl' not found
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
-3.282697, -0.7947018, -1.409983, 0, 0, 1, 1, 1,
-2.913537, 0.5721106, -2.705367, 1, 0, 0, 1, 1,
-2.746622, 0.3362647, -1.83796, 1, 0, 0, 1, 1,
-2.704699, -0.7568383, -0.6649559, 1, 0, 0, 1, 1,
-2.668769, -0.3260121, -1.927381, 1, 0, 0, 1, 1,
-2.306594, -0.1663125, -1.937835, 1, 0, 0, 1, 1,
-2.305155, -1.154768, -3.365331, 0, 0, 0, 1, 1,
-2.2989, -1.643065, -4.197793, 0, 0, 0, 1, 1,
-2.273914, -1.906454, -1.969463, 0, 0, 0, 1, 1,
-2.261621, -0.5573188, -1.642355, 0, 0, 0, 1, 1,
-2.260373, -1.434872, -1.766486, 0, 0, 0, 1, 1,
-2.177258, -0.01908641, -2.31235, 0, 0, 0, 1, 1,
-2.146158, -0.1139727, -1.641269, 0, 0, 0, 1, 1,
-2.106238, 0.939706, -0.9614304, 1, 1, 1, 1, 1,
-2.08263, 1.40112, -0.05001942, 1, 1, 1, 1, 1,
-2.077534, 1.064853, -0.7974669, 1, 1, 1, 1, 1,
-2.067147, 1.653448, -1.702796, 1, 1, 1, 1, 1,
-2.065847, -0.09010842, 0.05186839, 1, 1, 1, 1, 1,
-2.065305, 0.2239179, -2.007898, 1, 1, 1, 1, 1,
-2.028167, -0.07999317, -0.9651686, 1, 1, 1, 1, 1,
-2.026731, -0.9747306, -1.701201, 1, 1, 1, 1, 1,
-2.026106, -1.647835, -1.330061, 1, 1, 1, 1, 1,
-2.025876, -0.8277057, -2.06941, 1, 1, 1, 1, 1,
-2.013773, -0.09708691, -0.7908915, 1, 1, 1, 1, 1,
-2.009572, -0.5940287, -1.178328, 1, 1, 1, 1, 1,
-1.988769, -0.736144, -2.319081, 1, 1, 1, 1, 1,
-1.97125, -0.2634962, -1.856049, 1, 1, 1, 1, 1,
-1.963844, 0.6496043, -0.8627061, 1, 1, 1, 1, 1,
-1.962674, 1.145916, -0.02764227, 0, 0, 1, 1, 1,
-1.959148, -0.3670785, -1.931494, 1, 0, 0, 1, 1,
-1.911099, -1.060256, -2.130841, 1, 0, 0, 1, 1,
-1.908349, 1.406052, -1.969744, 1, 0, 0, 1, 1,
-1.90067, 0.3569857, -2.748521, 1, 0, 0, 1, 1,
-1.892581, -2.165813, -3.181506, 1, 0, 0, 1, 1,
-1.872222, 0.0925118, 0.02745812, 0, 0, 0, 1, 1,
-1.866458, -0.247366, -1.076609, 0, 0, 0, 1, 1,
-1.865154, 0.1179925, -2.641258, 0, 0, 0, 1, 1,
-1.851134, 3.169419, 0.9943688, 0, 0, 0, 1, 1,
-1.801986, -0.1443791, -0.1933131, 0, 0, 0, 1, 1,
-1.795437, 0.7877859, -1.594549, 0, 0, 0, 1, 1,
-1.794854, -1.716973, -3.020104, 0, 0, 0, 1, 1,
-1.762753, 0.2221262, -1.422855, 1, 1, 1, 1, 1,
-1.760616, -0.1593322, -1.488056, 1, 1, 1, 1, 1,
-1.756657, -0.5403739, -0.4924147, 1, 1, 1, 1, 1,
-1.752136, 0.9932407, 0.1769785, 1, 1, 1, 1, 1,
-1.733949, -0.7908928, -3.309799, 1, 1, 1, 1, 1,
-1.70991, -0.1550712, 0.2664928, 1, 1, 1, 1, 1,
-1.70631, -1.149773, -2.326628, 1, 1, 1, 1, 1,
-1.698274, 0.5125573, -1.488442, 1, 1, 1, 1, 1,
-1.69751, 1.872097, -1.015295, 1, 1, 1, 1, 1,
-1.687161, -1.036216, -1.77845, 1, 1, 1, 1, 1,
-1.67583, 0.4281379, -3.134838, 1, 1, 1, 1, 1,
-1.670689, 0.1746049, -1.414826, 1, 1, 1, 1, 1,
-1.669823, 0.5341268, -1.65839, 1, 1, 1, 1, 1,
-1.639257, 0.8063335, -0.708724, 1, 1, 1, 1, 1,
-1.629875, -1.098352, -0.6764927, 1, 1, 1, 1, 1,
-1.615638, -0.5664744, -1.029584, 0, 0, 1, 1, 1,
-1.612549, -0.1913333, -1.384482, 1, 0, 0, 1, 1,
-1.609316, 0.6957742, -1.781166, 1, 0, 0, 1, 1,
-1.605951, 1.752645, -0.5316756, 1, 0, 0, 1, 1,
-1.578325, -0.2566591, -1.952247, 1, 0, 0, 1, 1,
-1.571649, -0.5307209, -2.880647, 1, 0, 0, 1, 1,
-1.570578, 0.3978664, -0.7896095, 0, 0, 0, 1, 1,
-1.569405, -1.563564, -1.486491, 0, 0, 0, 1, 1,
-1.56388, 0.5571129, -0.7573397, 0, 0, 0, 1, 1,
-1.554119, 1.567276, 0.1694786, 0, 0, 0, 1, 1,
-1.533438, -1.35408, -2.315068, 0, 0, 0, 1, 1,
-1.529451, -0.1467218, -2.239813, 0, 0, 0, 1, 1,
-1.518447, 0.8763794, -0.8403845, 0, 0, 0, 1, 1,
-1.502977, 0.8904566, 2.067011, 1, 1, 1, 1, 1,
-1.496696, 0.6540186, -0.7296427, 1, 1, 1, 1, 1,
-1.494626, -0.03707204, -1.19362, 1, 1, 1, 1, 1,
-1.492383, -0.07247467, -2.318389, 1, 1, 1, 1, 1,
-1.49078, 0.6466956, -2.073927, 1, 1, 1, 1, 1,
-1.488635, -0.09829669, -2.595541, 1, 1, 1, 1, 1,
-1.486866, 0.1128948, -2.333211, 1, 1, 1, 1, 1,
-1.481363, 1.111183, -0.5794922, 1, 1, 1, 1, 1,
-1.480151, 1.801409, -2.586206, 1, 1, 1, 1, 1,
-1.436808, -0.03679801, -0.9208031, 1, 1, 1, 1, 1,
-1.426757, 0.7899442, -0.6781062, 1, 1, 1, 1, 1,
-1.425591, -0.1684286, -0.999541, 1, 1, 1, 1, 1,
-1.423136, -0.5447614, -4.009781, 1, 1, 1, 1, 1,
-1.421166, 0.9450613, -0.7423086, 1, 1, 1, 1, 1,
-1.420014, 1.056286, -2.40202, 1, 1, 1, 1, 1,
-1.415472, 0.6629552, -0.02366274, 0, 0, 1, 1, 1,
-1.403971, -1.308632, -2.879767, 1, 0, 0, 1, 1,
-1.403231, -1.104417, -3.099482, 1, 0, 0, 1, 1,
-1.392567, 1.128674, -1.653403, 1, 0, 0, 1, 1,
-1.391878, -1.367257, -4.940901, 1, 0, 0, 1, 1,
-1.373493, -0.1959345, -0.3471658, 1, 0, 0, 1, 1,
-1.365759, 0.06414903, -1.725458, 0, 0, 0, 1, 1,
-1.357882, 0.7211494, -2.555043, 0, 0, 0, 1, 1,
-1.331775, -0.1611425, -1.115193, 0, 0, 0, 1, 1,
-1.329669, 1.199206, -0.6608161, 0, 0, 0, 1, 1,
-1.325774, 0.3092121, -1.466888, 0, 0, 0, 1, 1,
-1.324546, -0.1475178, -1.116018, 0, 0, 0, 1, 1,
-1.314197, 0.3419594, -2.251731, 0, 0, 0, 1, 1,
-1.313405, -0.7620336, -0.9119154, 1, 1, 1, 1, 1,
-1.300445, -0.04243407, -1.513166, 1, 1, 1, 1, 1,
-1.296257, 0.01426733, -1.571432, 1, 1, 1, 1, 1,
-1.287049, 1.20438, -1.487003, 1, 1, 1, 1, 1,
-1.276984, 1.470829, -1.076743, 1, 1, 1, 1, 1,
-1.266168, -0.07019312, -1.895577, 1, 1, 1, 1, 1,
-1.263043, 0.4936845, -1.067568, 1, 1, 1, 1, 1,
-1.248355, -0.1899433, -3.82601, 1, 1, 1, 1, 1,
-1.247022, 0.8678604, -0.2405077, 1, 1, 1, 1, 1,
-1.244626, -1.164145, -2.539913, 1, 1, 1, 1, 1,
-1.244199, 2.142939, -0.8889259, 1, 1, 1, 1, 1,
-1.24167, -0.1890259, 0.01776887, 1, 1, 1, 1, 1,
-1.235194, -2.053254, -1.094743, 1, 1, 1, 1, 1,
-1.232975, -0.8167772, -3.069831, 1, 1, 1, 1, 1,
-1.221194, -1.29812, -2.985071, 1, 1, 1, 1, 1,
-1.220405, 0.05005151, -1.322252, 0, 0, 1, 1, 1,
-1.216574, 0.2516641, -1.38195, 1, 0, 0, 1, 1,
-1.21393, 0.3947109, -1.084843, 1, 0, 0, 1, 1,
-1.209809, -0.7232914, -1.154317, 1, 0, 0, 1, 1,
-1.199299, -0.3141045, -1.64174, 1, 0, 0, 1, 1,
-1.198244, -1.956826, -1.693092, 1, 0, 0, 1, 1,
-1.190627, -1.68279, -2.671664, 0, 0, 0, 1, 1,
-1.187452, -0.6923451, -3.346313, 0, 0, 0, 1, 1,
-1.1859, 0.4429823, -0.4628027, 0, 0, 0, 1, 1,
-1.182702, 1.57326, 0.4613101, 0, 0, 0, 1, 1,
-1.181975, 0.4169515, -0.4668831, 0, 0, 0, 1, 1,
-1.180426, -3.195744, -4.189486, 0, 0, 0, 1, 1,
-1.18022, 1.319283, -0.7128043, 0, 0, 0, 1, 1,
-1.176671, 0.4395301, -0.5894905, 1, 1, 1, 1, 1,
-1.172294, 1.172236, -1.954735, 1, 1, 1, 1, 1,
-1.166605, 0.6352481, -0.4507995, 1, 1, 1, 1, 1,
-1.162646, 0.2803102, -0.5404272, 1, 1, 1, 1, 1,
-1.156473, 0.382484, -2.634293, 1, 1, 1, 1, 1,
-1.151765, -0.08891995, -1.495308, 1, 1, 1, 1, 1,
-1.149421, 1.015059, -1.683195, 1, 1, 1, 1, 1,
-1.14589, -0.08226103, -2.748513, 1, 1, 1, 1, 1,
-1.14531, 0.7082544, -1.812209, 1, 1, 1, 1, 1,
-1.141329, -0.3365662, -2.34637, 1, 1, 1, 1, 1,
-1.138306, 0.2422505, -0.1965804, 1, 1, 1, 1, 1,
-1.125154, 0.7579846, -2.48234, 1, 1, 1, 1, 1,
-1.121607, -1.421078, -1.609892, 1, 1, 1, 1, 1,
-1.121302, -0.3484256, -2.129836, 1, 1, 1, 1, 1,
-1.117256, 1.188282, -2.017954, 1, 1, 1, 1, 1,
-1.114178, 2.03543, 0.5403714, 0, 0, 1, 1, 1,
-1.112759, -1.869397, -1.949921, 1, 0, 0, 1, 1,
-1.11177, -0.8229563, -0.8474023, 1, 0, 0, 1, 1,
-1.109334, 0.5574703, -3.264611, 1, 0, 0, 1, 1,
-1.081956, -1.088152, -3.994316, 1, 0, 0, 1, 1,
-1.07086, 1.863788, -0.241048, 1, 0, 0, 1, 1,
-1.070753, -0.800391, -1.552122, 0, 0, 0, 1, 1,
-1.068881, 0.1090906, -0.520067, 0, 0, 0, 1, 1,
-1.068617, 0.01141989, -0.9953581, 0, 0, 0, 1, 1,
-1.067852, -1.57457, -1.846968, 0, 0, 0, 1, 1,
-1.066201, 1.99505, -1.155408, 0, 0, 0, 1, 1,
-1.064897, 0.1530424, -2.32627, 0, 0, 0, 1, 1,
-1.043083, -0.2765582, -2.139753, 0, 0, 0, 1, 1,
-1.041962, -0.6889628, -2.681426, 1, 1, 1, 1, 1,
-1.040919, 1.534015, -0.03818832, 1, 1, 1, 1, 1,
-1.035061, -0.414406, -0.4350546, 1, 1, 1, 1, 1,
-1.033134, 0.8690525, -2.166099, 1, 1, 1, 1, 1,
-1.016128, 0.7902431, -1.604008, 1, 1, 1, 1, 1,
-1.014387, -2.137053, -1.136941, 1, 1, 1, 1, 1,
-1.004379, 0.1129045, -2.578437, 1, 1, 1, 1, 1,
-1.003398, 0.06421613, -0.5059869, 1, 1, 1, 1, 1,
-0.9908944, -0.9315242, -3.710384, 1, 1, 1, 1, 1,
-0.9799263, -0.7306996, -2.297711, 1, 1, 1, 1, 1,
-0.9778455, 0.7107968, -2.668623, 1, 1, 1, 1, 1,
-0.9774017, 0.6906828, -2.115275, 1, 1, 1, 1, 1,
-0.9750794, -0.3867057, -3.288464, 1, 1, 1, 1, 1,
-0.9734292, -0.1700498, -1.970843, 1, 1, 1, 1, 1,
-0.9713798, 0.7417732, -1.233539, 1, 1, 1, 1, 1,
-0.9699675, -0.6576075, -1.909952, 0, 0, 1, 1, 1,
-0.96835, 0.3738798, -1.460996, 1, 0, 0, 1, 1,
-0.9677747, 0.7949667, -1.289794, 1, 0, 0, 1, 1,
-0.9483101, -0.1139712, -1.93854, 1, 0, 0, 1, 1,
-0.9481525, -0.002257081, -1.429914, 1, 0, 0, 1, 1,
-0.9420819, 0.4774043, -0.9807545, 1, 0, 0, 1, 1,
-0.9407603, -0.116324, -1.808455, 0, 0, 0, 1, 1,
-0.9398438, 0.2095018, -0.8151268, 0, 0, 0, 1, 1,
-0.9181416, 0.7795429, -0.7579831, 0, 0, 0, 1, 1,
-0.9145324, -1.523606, -2.219707, 0, 0, 0, 1, 1,
-0.9071639, -0.9587321, -1.469824, 0, 0, 0, 1, 1,
-0.9000077, 1.352396, 1.316727, 0, 0, 0, 1, 1,
-0.8972313, 0.7290492, 0.1743206, 0, 0, 0, 1, 1,
-0.8890433, 0.4022138, -0.06874178, 1, 1, 1, 1, 1,
-0.8814614, -0.7445814, -3.977535, 1, 1, 1, 1, 1,
-0.8801715, -0.5730827, -1.678813, 1, 1, 1, 1, 1,
-0.8777681, 0.4321333, -2.953079, 1, 1, 1, 1, 1,
-0.8757272, -1.808557, -1.664886, 1, 1, 1, 1, 1,
-0.8704844, -0.7004478, -1.297485, 1, 1, 1, 1, 1,
-0.8622059, 0.02269624, -1.026914, 1, 1, 1, 1, 1,
-0.8603343, -0.2152498, -1.164532, 1, 1, 1, 1, 1,
-0.8562109, -0.933949, -5.796622, 1, 1, 1, 1, 1,
-0.8501019, 0.6108724, -0.9366152, 1, 1, 1, 1, 1,
-0.8481912, 0.1471065, 0.1919999, 1, 1, 1, 1, 1,
-0.8474618, 0.5769081, -1.796301, 1, 1, 1, 1, 1,
-0.8358483, -1.774173, -2.418055, 1, 1, 1, 1, 1,
-0.8270717, -0.4524675, -2.127077, 1, 1, 1, 1, 1,
-0.825208, -0.499662, -1.794452, 1, 1, 1, 1, 1,
-0.8250186, -2.104133, -2.262376, 0, 0, 1, 1, 1,
-0.8075866, 0.1440804, -1.323837, 1, 0, 0, 1, 1,
-0.8029194, 1.147463, 0.5945984, 1, 0, 0, 1, 1,
-0.7974936, -0.2662208, -2.31467, 1, 0, 0, 1, 1,
-0.7968879, 0.02495458, -2.548338, 1, 0, 0, 1, 1,
-0.7965636, 0.3632725, -1.209429, 1, 0, 0, 1, 1,
-0.7962872, 0.3716712, -0.01793152, 0, 0, 0, 1, 1,
-0.7919644, 1.384215, -0.6052446, 0, 0, 0, 1, 1,
-0.791559, -0.08586587, -2.918317, 0, 0, 0, 1, 1,
-0.790309, 0.2878973, -0.9362202, 0, 0, 0, 1, 1,
-0.7893397, -0.7816459, -2.230017, 0, 0, 0, 1, 1,
-0.7891074, 0.4810448, -1.170852, 0, 0, 0, 1, 1,
-0.7875994, -0.9449348, -3.800873, 0, 0, 0, 1, 1,
-0.7858939, 1.129308, 0.02787058, 1, 1, 1, 1, 1,
-0.7850582, -0.4419974, -2.342341, 1, 1, 1, 1, 1,
-0.7777897, -0.8391544, -1.689786, 1, 1, 1, 1, 1,
-0.7767154, 1.588924, 0.4459764, 1, 1, 1, 1, 1,
-0.7756532, 0.1213437, 0.1066222, 1, 1, 1, 1, 1,
-0.7641882, -0.7742584, -0.5532496, 1, 1, 1, 1, 1,
-0.7585473, 0.3876709, -2.56763, 1, 1, 1, 1, 1,
-0.7560583, 0.7451821, -0.8532369, 1, 1, 1, 1, 1,
-0.7545097, -2.1528, -2.319898, 1, 1, 1, 1, 1,
-0.751545, 0.7940032, -1.236982, 1, 1, 1, 1, 1,
-0.7514607, 1.636322, -1.517129, 1, 1, 1, 1, 1,
-0.7498436, 2.240711, -0.5578651, 1, 1, 1, 1, 1,
-0.7489768, -0.2890183, -0.7573689, 1, 1, 1, 1, 1,
-0.7450885, 0.2232377, -0.5103402, 1, 1, 1, 1, 1,
-0.7416375, 3.10108, -0.90883, 1, 1, 1, 1, 1,
-0.7393882, 0.7341572, -1.659584, 0, 0, 1, 1, 1,
-0.736645, 0.4445981, -1.733626, 1, 0, 0, 1, 1,
-0.7272843, 0.6014293, -1.793979, 1, 0, 0, 1, 1,
-0.7259062, 0.4358587, -1.789315, 1, 0, 0, 1, 1,
-0.7258512, 0.4116292, -0.5992544, 1, 0, 0, 1, 1,
-0.7257715, -0.564709, -4.581839, 1, 0, 0, 1, 1,
-0.722958, -0.03539178, -1.824948, 0, 0, 0, 1, 1,
-0.7124966, 1.085886, -1.914125, 0, 0, 0, 1, 1,
-0.7087224, -0.1022907, -1.396572, 0, 0, 0, 1, 1,
-0.7063353, 2.987877, 0.8745705, 0, 0, 0, 1, 1,
-0.7052297, 2.007535, -1.424109, 0, 0, 0, 1, 1,
-0.6991628, -1.010785, -2.998029, 0, 0, 0, 1, 1,
-0.6989006, -0.1158508, -0.9506245, 0, 0, 0, 1, 1,
-0.6951337, -1.00615, -0.425019, 1, 1, 1, 1, 1,
-0.6934721, 0.05648522, -1.920559, 1, 1, 1, 1, 1,
-0.6904641, -0.7401878, -1.042275, 1, 1, 1, 1, 1,
-0.6763301, 1.602114, -0.8013153, 1, 1, 1, 1, 1,
-0.6761158, -0.9901946, -1.082011, 1, 1, 1, 1, 1,
-0.6759681, 1.137028, -0.5962005, 1, 1, 1, 1, 1,
-0.6749565, -0.06031475, -1.250048, 1, 1, 1, 1, 1,
-0.672434, -0.7337287, -2.158558, 1, 1, 1, 1, 1,
-0.6684202, 0.3071432, -0.6044329, 1, 1, 1, 1, 1,
-0.6643605, 0.1024752, -0.8123004, 1, 1, 1, 1, 1,
-0.6626955, -1.186185, -3.162429, 1, 1, 1, 1, 1,
-0.6588195, -0.7345694, -4.09197, 1, 1, 1, 1, 1,
-0.6586153, -0.5199767, -2.804485, 1, 1, 1, 1, 1,
-0.6583862, 2.475187, 0.553436, 1, 1, 1, 1, 1,
-0.6577641, -0.4896564, -2.935455, 1, 1, 1, 1, 1,
-0.6566461, 0.5945905, -1.848293, 0, 0, 1, 1, 1,
-0.6537918, -0.03631076, -2.913785, 1, 0, 0, 1, 1,
-0.651069, -1.927302, -2.814415, 1, 0, 0, 1, 1,
-0.6455797, 1.407047, 0.3326269, 1, 0, 0, 1, 1,
-0.6416356, 0.8595642, -1.317019, 1, 0, 0, 1, 1,
-0.6413443, 1.610747, 0.1445354, 1, 0, 0, 1, 1,
-0.640196, -0.009944156, -2.115325, 0, 0, 0, 1, 1,
-0.631831, -0.9501135, -3.57924, 0, 0, 0, 1, 1,
-0.6297807, -1.053765, -2.775097, 0, 0, 0, 1, 1,
-0.6265333, -1.577686, -3.043566, 0, 0, 0, 1, 1,
-0.6240297, 0.3019987, -1.936628, 0, 0, 0, 1, 1,
-0.6202242, -0.8517492, -2.73204, 0, 0, 0, 1, 1,
-0.6190868, 0.07321113, -0.3426464, 0, 0, 0, 1, 1,
-0.617911, -0.1578171, -2.932521, 1, 1, 1, 1, 1,
-0.6116724, 0.04760234, -1.763016, 1, 1, 1, 1, 1,
-0.6033973, -0.1136672, -0.2462324, 1, 1, 1, 1, 1,
-0.6022533, 0.8177101, 1.123341, 1, 1, 1, 1, 1,
-0.5970995, 1.099814, -0.9274278, 1, 1, 1, 1, 1,
-0.596324, -0.5866179, -1.963351, 1, 1, 1, 1, 1,
-0.5946608, -0.2568443, -0.4201564, 1, 1, 1, 1, 1,
-0.591703, -0.6037239, -2.175534, 1, 1, 1, 1, 1,
-0.5872449, -0.4835769, -1.485512, 1, 1, 1, 1, 1,
-0.5863828, -1.452002, -3.974871, 1, 1, 1, 1, 1,
-0.5859544, -0.3784474, -3.331849, 1, 1, 1, 1, 1,
-0.5846869, -0.5816907, -1.744296, 1, 1, 1, 1, 1,
-0.5822951, 0.8285651, -0.606564, 1, 1, 1, 1, 1,
-0.5812806, -2.628411, -3.701868, 1, 1, 1, 1, 1,
-0.5792248, 1.392006, -1.568157, 1, 1, 1, 1, 1,
-0.5767912, 0.6104016, -1.740459, 0, 0, 1, 1, 1,
-0.5750211, 0.6053565, -0.7658195, 1, 0, 0, 1, 1,
-0.5723035, -0.1678607, -3.194058, 1, 0, 0, 1, 1,
-0.5705742, -1.613175, -3.506092, 1, 0, 0, 1, 1,
-0.5692741, -0.1338776, -1.894789, 1, 0, 0, 1, 1,
-0.5649043, -0.3922373, -2.335118, 1, 0, 0, 1, 1,
-0.5628296, -0.5849645, -2.940595, 0, 0, 0, 1, 1,
-0.562798, 0.7954327, -0.6770384, 0, 0, 0, 1, 1,
-0.5620292, -1.122464, -2.714279, 0, 0, 0, 1, 1,
-0.5534863, 0.8520399, -0.2559931, 0, 0, 0, 1, 1,
-0.5479812, 1.508173, -0.3512605, 0, 0, 0, 1, 1,
-0.5423498, -0.1666801, -1.811642, 0, 0, 0, 1, 1,
-0.5413658, -0.4921941, -1.942293, 0, 0, 0, 1, 1,
-0.5370373, -0.2133967, -2.290562, 1, 1, 1, 1, 1,
-0.5296068, 1.742898, -0.3218382, 1, 1, 1, 1, 1,
-0.5263528, -1.323758, -2.216644, 1, 1, 1, 1, 1,
-0.520042, -1.524892, -1.71925, 1, 1, 1, 1, 1,
-0.5132052, -1.747942, -1.677727, 1, 1, 1, 1, 1,
-0.5109132, -0.05335002, -0.4715153, 1, 1, 1, 1, 1,
-0.5106339, 1.656258, 0.4033708, 1, 1, 1, 1, 1,
-0.5047987, -0.5663186, -2.389337, 1, 1, 1, 1, 1,
-0.5037599, 2.144857, 1.596218, 1, 1, 1, 1, 1,
-0.503326, -1.072199, -2.473158, 1, 1, 1, 1, 1,
-0.5027986, -0.6953076, -3.681039, 1, 1, 1, 1, 1,
-0.4896658, -2.892255, -2.00779, 1, 1, 1, 1, 1,
-0.4893851, 0.6409172, 0.6044304, 1, 1, 1, 1, 1,
-0.4893295, 1.522935, -0.05175761, 1, 1, 1, 1, 1,
-0.4873401, 0.4988176, 0.1156385, 1, 1, 1, 1, 1,
-0.4800647, -1.127339, -4.484632, 0, 0, 1, 1, 1,
-0.4787608, -1.032168, -2.570835, 1, 0, 0, 1, 1,
-0.4606767, -0.8806707, -1.671662, 1, 0, 0, 1, 1,
-0.4548103, 0.8213652, -1.303633, 1, 0, 0, 1, 1,
-0.4545257, 0.7238413, -1.529768, 1, 0, 0, 1, 1,
-0.4500896, 0.8739797, -1.130741, 1, 0, 0, 1, 1,
-0.4490848, -0.5574107, -2.348913, 0, 0, 0, 1, 1,
-0.4443665, -0.9970476, -1.344244, 0, 0, 0, 1, 1,
-0.4436196, -1.232462, -2.503376, 0, 0, 0, 1, 1,
-0.443466, 0.3951674, -0.3791056, 0, 0, 0, 1, 1,
-0.436365, -1.047763, -3.67702, 0, 0, 0, 1, 1,
-0.4363216, -0.4464745, -0.9755188, 0, 0, 0, 1, 1,
-0.4350717, 0.9851544, 1.091729, 0, 0, 0, 1, 1,
-0.4347466, 1.553166, -0.3044026, 1, 1, 1, 1, 1,
-0.4333169, 0.4723082, 0.4142103, 1, 1, 1, 1, 1,
-0.4241408, 1.559339, 1.676513, 1, 1, 1, 1, 1,
-0.4240151, 0.2445243, -1.638694, 1, 1, 1, 1, 1,
-0.422419, 1.622451, 1.173133, 1, 1, 1, 1, 1,
-0.4223116, -0.03631581, -2.831029, 1, 1, 1, 1, 1,
-0.4214969, -0.4125818, -1.721848, 1, 1, 1, 1, 1,
-0.419965, -0.1774915, -0.5393374, 1, 1, 1, 1, 1,
-0.4186996, 0.3062864, 0.5890892, 1, 1, 1, 1, 1,
-0.4161385, -0.3952189, -0.9987224, 1, 1, 1, 1, 1,
-0.4157321, -1.117981, -2.753242, 1, 1, 1, 1, 1,
-0.4101594, 0.01301023, -0.4797931, 1, 1, 1, 1, 1,
-0.4095382, 1.390714, 0.6980417, 1, 1, 1, 1, 1,
-0.4080481, -0.4090293, -3.100795, 1, 1, 1, 1, 1,
-0.4056284, 0.5368869, -1.940817, 1, 1, 1, 1, 1,
-0.4030611, 1.725944, -2.215457, 0, 0, 1, 1, 1,
-0.402743, -0.847226, -4.365571, 1, 0, 0, 1, 1,
-0.398371, -1.909771, -1.167746, 1, 0, 0, 1, 1,
-0.3975542, 0.7380335, -0.6161827, 1, 0, 0, 1, 1,
-0.3932035, -0.1181213, -1.885563, 1, 0, 0, 1, 1,
-0.3911166, 1.675732, 3.038122, 1, 0, 0, 1, 1,
-0.390436, -0.7268552, -2.671921, 0, 0, 0, 1, 1,
-0.3877373, -1.217782, -2.741225, 0, 0, 0, 1, 1,
-0.3871549, -0.8823389, -0.9105243, 0, 0, 0, 1, 1,
-0.3862157, 0.7462513, -1.504888, 0, 0, 0, 1, 1,
-0.3781613, 0.8189622, 0.967284, 0, 0, 0, 1, 1,
-0.3716625, -0.6747469, -4.130103, 0, 0, 0, 1, 1,
-0.3714085, 0.5900517, -1.46689, 0, 0, 0, 1, 1,
-0.3657689, -0.4468559, -2.702327, 1, 1, 1, 1, 1,
-0.3654318, -0.6277627, -1.834272, 1, 1, 1, 1, 1,
-0.3647881, -0.7005802, -3.687549, 1, 1, 1, 1, 1,
-0.3642885, 1.96696, 1.659279, 1, 1, 1, 1, 1,
-0.3565193, 2.17883, -0.9314563, 1, 1, 1, 1, 1,
-0.3564352, 0.7072874, -0.4315482, 1, 1, 1, 1, 1,
-0.3563496, 0.3001465, -1.191571, 1, 1, 1, 1, 1,
-0.3500997, -0.06563579, -2.399506, 1, 1, 1, 1, 1,
-0.3500137, 1.025723, -0.7229101, 1, 1, 1, 1, 1,
-0.3474374, 0.4412283, 0.8999, 1, 1, 1, 1, 1,
-0.3398893, -0.1046027, -1.356431, 1, 1, 1, 1, 1,
-0.3386521, 1.334389, 0.7346503, 1, 1, 1, 1, 1,
-0.3237678, 0.4514708, 1.283904, 1, 1, 1, 1, 1,
-0.3227938, -1.881718, -3.924919, 1, 1, 1, 1, 1,
-0.3189807, 0.6433359, 1.235261, 1, 1, 1, 1, 1,
-0.3101823, -1.297453, -2.736556, 0, 0, 1, 1, 1,
-0.2999381, -0.9820424, -2.855835, 1, 0, 0, 1, 1,
-0.299503, 0.338978, -0.7451628, 1, 0, 0, 1, 1,
-0.2985238, -0.2482977, -1.751507, 1, 0, 0, 1, 1,
-0.2971276, -1.791701, -3.162928, 1, 0, 0, 1, 1,
-0.296795, 0.7752498, 1.303615, 1, 0, 0, 1, 1,
-0.2889122, 0.2859536, -1.829194, 0, 0, 0, 1, 1,
-0.2873989, -3.243599, -3.264574, 0, 0, 0, 1, 1,
-0.2826369, 0.8258097, 0.3248127, 0, 0, 0, 1, 1,
-0.2802514, 1.817959, -0.2892179, 0, 0, 0, 1, 1,
-0.2733156, -1.270406, -2.203729, 0, 0, 0, 1, 1,
-0.273116, -0.1655549, -2.433484, 0, 0, 0, 1, 1,
-0.2729689, -0.236373, -2.340001, 0, 0, 0, 1, 1,
-0.2705133, -0.03265803, -2.449922, 1, 1, 1, 1, 1,
-0.2689362, -0.3811741, -3.373817, 1, 1, 1, 1, 1,
-0.2664244, 0.2602235, -0.8429253, 1, 1, 1, 1, 1,
-0.2624661, 0.2293862, -2.810044, 1, 1, 1, 1, 1,
-0.259912, -0.5081283, -2.561634, 1, 1, 1, 1, 1,
-0.2552173, -0.5028082, -2.763594, 1, 1, 1, 1, 1,
-0.2533607, 0.174301, -1.271047, 1, 1, 1, 1, 1,
-0.2508567, 0.3122478, -1.369128, 1, 1, 1, 1, 1,
-0.2489116, -0.1182238, -1.210601, 1, 1, 1, 1, 1,
-0.2486107, 0.7518331, 1.374835, 1, 1, 1, 1, 1,
-0.2390241, -0.8322808, -3.266898, 1, 1, 1, 1, 1,
-0.2387276, -0.2776218, -2.993898, 1, 1, 1, 1, 1,
-0.2386836, -1.781186, -3.286077, 1, 1, 1, 1, 1,
-0.2384958, -0.9631321, -1.889715, 1, 1, 1, 1, 1,
-0.2382714, -0.4672438, -3.023606, 1, 1, 1, 1, 1,
-0.2370134, -1.207034, -5.489, 0, 0, 1, 1, 1,
-0.2369252, -0.8901727, -2.187729, 1, 0, 0, 1, 1,
-0.2353069, -1.157212, -3.157201, 1, 0, 0, 1, 1,
-0.235154, 0.4855297, -1.742344, 1, 0, 0, 1, 1,
-0.2318117, -0.1295087, -1.970392, 1, 0, 0, 1, 1,
-0.2287739, 0.1952767, -1.409476, 1, 0, 0, 1, 1,
-0.2267794, -1.185939, -3.348031, 0, 0, 0, 1, 1,
-0.2267612, -0.9340736, -3.643447, 0, 0, 0, 1, 1,
-0.2240859, -1.717119, -5.037193, 0, 0, 0, 1, 1,
-0.2199635, 1.150157, 0.9559733, 0, 0, 0, 1, 1,
-0.2175038, -0.7292207, -2.696357, 0, 0, 0, 1, 1,
-0.2170927, 0.3331688, 0.6468564, 0, 0, 0, 1, 1,
-0.2096869, -0.1503366, -2.945184, 0, 0, 0, 1, 1,
-0.2094718, 0.5458619, -0.49501, 1, 1, 1, 1, 1,
-0.2075998, 0.3685882, -1.017095, 1, 1, 1, 1, 1,
-0.2051563, 0.8671923, -1.342769, 1, 1, 1, 1, 1,
-0.2049159, 0.9746099, 0.5023852, 1, 1, 1, 1, 1,
-0.2042288, -0.8135633, -3.010183, 1, 1, 1, 1, 1,
-0.2015214, -0.3899831, -2.428263, 1, 1, 1, 1, 1,
-0.1982455, -1.966091, -3.943193, 1, 1, 1, 1, 1,
-0.1953198, -0.01804605, -1.322978, 1, 1, 1, 1, 1,
-0.1921101, 0.6253404, 0.4807428, 1, 1, 1, 1, 1,
-0.1902852, -0.1176056, -0.05530072, 1, 1, 1, 1, 1,
-0.1893163, 1.250802, 4.006267, 1, 1, 1, 1, 1,
-0.1851353, 0.7488041, -0.7400184, 1, 1, 1, 1, 1,
-0.1826477, 1.88568, 0.4834361, 1, 1, 1, 1, 1,
-0.1795263, -1.859181, -3.399227, 1, 1, 1, 1, 1,
-0.1769682, 0.4419858, -1.557162, 1, 1, 1, 1, 1,
-0.1765486, -1.556907, -1.689989, 0, 0, 1, 1, 1,
-0.1691394, 0.2698738, 2.126264, 1, 0, 0, 1, 1,
-0.1655884, -1.189827, -2.848621, 1, 0, 0, 1, 1,
-0.1655069, 1.525319, -1.103354, 1, 0, 0, 1, 1,
-0.1629747, -0.5291277, -3.210795, 1, 0, 0, 1, 1,
-0.1572915, -0.9154649, -3.330101, 1, 0, 0, 1, 1,
-0.1570521, 1.028075, 0.2902793, 0, 0, 0, 1, 1,
-0.1561254, -0.2155509, -0.957205, 0, 0, 0, 1, 1,
-0.1547913, -1.49607, -2.077112, 0, 0, 0, 1, 1,
-0.1528475, 2.241025, -0.7854484, 0, 0, 0, 1, 1,
-0.1494997, 0.1138779, -2.30482, 0, 0, 0, 1, 1,
-0.1489498, 1.980484, 1.325405, 0, 0, 0, 1, 1,
-0.1454424, -0.0330199, 0.3379427, 0, 0, 0, 1, 1,
-0.1428937, 1.234204, 0.4741683, 1, 1, 1, 1, 1,
-0.142773, 1.350825, -1.247925, 1, 1, 1, 1, 1,
-0.1419702, -3.340564, -2.995434, 1, 1, 1, 1, 1,
-0.1382256, -0.2405201, -2.87503, 1, 1, 1, 1, 1,
-0.1342685, -0.1628017, -0.6288948, 1, 1, 1, 1, 1,
-0.1305474, 0.06919745, -0.7242871, 1, 1, 1, 1, 1,
-0.1282301, -0.7521117, -3.378808, 1, 1, 1, 1, 1,
-0.1194357, -1.928116, -3.178083, 1, 1, 1, 1, 1,
-0.1184594, -0.693122, -3.343566, 1, 1, 1, 1, 1,
-0.1146413, 0.2128382, -0.8913925, 1, 1, 1, 1, 1,
-0.114273, -0.6201911, -1.779731, 1, 1, 1, 1, 1,
-0.1081509, 0.3029392, -0.9416277, 1, 1, 1, 1, 1,
-0.1076845, 0.5812196, 0.5833971, 1, 1, 1, 1, 1,
-0.1069815, -0.6720176, -1.583627, 1, 1, 1, 1, 1,
-0.09848335, -0.5456555, -4.566164, 1, 1, 1, 1, 1,
-0.09450909, -0.2744948, -2.066917, 0, 0, 1, 1, 1,
-0.09388947, 0.7427832, -0.1605598, 1, 0, 0, 1, 1,
-0.09231614, 1.675882, 0.7440167, 1, 0, 0, 1, 1,
-0.08768223, -0.2495537, -4.164833, 1, 0, 0, 1, 1,
-0.08555645, -0.8851898, -2.067423, 1, 0, 0, 1, 1,
-0.07970962, 1.539191, 0.5063524, 1, 0, 0, 1, 1,
-0.07947248, -1.923697, -1.759488, 0, 0, 0, 1, 1,
-0.07817104, 0.695565, 0.2324492, 0, 0, 0, 1, 1,
-0.07350542, 1.397584, -0.8535011, 0, 0, 0, 1, 1,
-0.06690253, 1.091507, 0.2211856, 0, 0, 0, 1, 1,
-0.0666033, 0.6457024, 1.449249, 0, 0, 0, 1, 1,
-0.06583291, 0.705349, -0.5526403, 0, 0, 0, 1, 1,
-0.06453103, -0.8884957, -4.097275, 0, 0, 0, 1, 1,
-0.06234716, 0.7735539, 0.5580359, 1, 1, 1, 1, 1,
-0.0576674, -0.7523456, -2.711649, 1, 1, 1, 1, 1,
-0.05764652, 1.118456, -1.36542, 1, 1, 1, 1, 1,
-0.05687888, 0.6270345, -0.9420691, 1, 1, 1, 1, 1,
-0.05303261, -0.5282252, -3.396593, 1, 1, 1, 1, 1,
-0.0435684, 0.2806119, -0.01152682, 1, 1, 1, 1, 1,
-0.04340819, -0.183598, -3.672034, 1, 1, 1, 1, 1,
-0.04239075, 3.223848, -0.6308005, 1, 1, 1, 1, 1,
-0.03773532, 2.241106, 0.5791112, 1, 1, 1, 1, 1,
-0.03572775, 1.507276, 0.4742984, 1, 1, 1, 1, 1,
-0.03438134, 0.2405725, -0.9725026, 1, 1, 1, 1, 1,
-0.02995279, -0.886344, -2.816987, 1, 1, 1, 1, 1,
-0.0247687, 0.1981668, 0.5589269, 1, 1, 1, 1, 1,
-0.02250345, -0.0754494, -3.316727, 1, 1, 1, 1, 1,
-0.01964505, 0.2095982, 0.3700839, 1, 1, 1, 1, 1,
-0.01932617, 0.1820908, 0.1253283, 0, 0, 1, 1, 1,
-0.01870983, 0.546011, -0.226587, 1, 0, 0, 1, 1,
-0.01677741, 3.243802, -0.4627843, 1, 0, 0, 1, 1,
-0.01323191, -0.1356466, -2.165611, 1, 0, 0, 1, 1,
-0.007705831, -0.8030013, -3.024167, 1, 0, 0, 1, 1,
-0.002933283, -0.02403394, -3.316004, 1, 0, 0, 1, 1,
-0.001415208, 1.842031, -0.1265473, 0, 0, 0, 1, 1,
-0.001099809, -0.6187692, -3.631112, 0, 0, 0, 1, 1,
0.002239797, -2.210149, 2.277333, 0, 0, 0, 1, 1,
0.002830538, 0.4422219, -0.313441, 0, 0, 0, 1, 1,
0.005908815, 1.427137, -0.3469498, 0, 0, 0, 1, 1,
0.006543863, -0.749981, 2.748259, 0, 0, 0, 1, 1,
0.01254805, -0.8092856, 3.725269, 0, 0, 0, 1, 1,
0.01399316, -0.4773699, 4.076308, 1, 1, 1, 1, 1,
0.01484995, -0.5182064, 3.37819, 1, 1, 1, 1, 1,
0.01519271, -0.2742397, 4.553504, 1, 1, 1, 1, 1,
0.01592299, -0.04097217, 2.413764, 1, 1, 1, 1, 1,
0.01652087, 0.4286659, -0.589681, 1, 1, 1, 1, 1,
0.02406567, 0.8110501, -0.8921931, 1, 1, 1, 1, 1,
0.0270864, -0.4638807, 4.236492, 1, 1, 1, 1, 1,
0.03174699, 0.08255056, 1.408032, 1, 1, 1, 1, 1,
0.03628219, -3.200611, 2.98509, 1, 1, 1, 1, 1,
0.03945799, -0.6942112, 3.323871, 1, 1, 1, 1, 1,
0.04275122, 1.105581, 0.7159601, 1, 1, 1, 1, 1,
0.04400271, 0.6638914, 0.3492171, 1, 1, 1, 1, 1,
0.0447856, 1.853147, 1.103553, 1, 1, 1, 1, 1,
0.04510751, 0.137143, -0.01248494, 1, 1, 1, 1, 1,
0.04621574, -0.2763517, 3.822281, 1, 1, 1, 1, 1,
0.04920314, 0.9563262, -0.6126009, 0, 0, 1, 1, 1,
0.05437055, -0.1051958, 2.207577, 1, 0, 0, 1, 1,
0.0616143, -0.6834804, 1.916206, 1, 0, 0, 1, 1,
0.06181109, -0.05430804, 1.517359, 1, 0, 0, 1, 1,
0.06397693, 1.550443, 0.6662441, 1, 0, 0, 1, 1,
0.06464767, -0.4242859, 0.7446775, 1, 0, 0, 1, 1,
0.0646913, 0.6701897, 0.7265586, 0, 0, 0, 1, 1,
0.06755354, 0.05098357, 0.2761481, 0, 0, 0, 1, 1,
0.06818812, 0.9337209, 1.439675, 0, 0, 0, 1, 1,
0.07098507, 0.5268936, -0.9450638, 0, 0, 0, 1, 1,
0.07334267, 0.4671069, 0.02427367, 0, 0, 0, 1, 1,
0.07358657, 0.5150263, -0.5028405, 0, 0, 0, 1, 1,
0.07504319, 0.5681005, 1.861665, 0, 0, 0, 1, 1,
0.07566316, 1.950154, 1.313729, 1, 1, 1, 1, 1,
0.07998736, 0.1046448, -0.3748603, 1, 1, 1, 1, 1,
0.08027845, -0.5983801, 2.616942, 1, 1, 1, 1, 1,
0.08106028, 0.03197134, 0.8326241, 1, 1, 1, 1, 1,
0.08144783, -1.904091, 2.596005, 1, 1, 1, 1, 1,
0.09317426, -0.2908663, 3.395764, 1, 1, 1, 1, 1,
0.09600437, -0.4924531, 4.060429, 1, 1, 1, 1, 1,
0.09704711, 1.073947, 0.8648009, 1, 1, 1, 1, 1,
0.09740324, -1.20939, 3.429625, 1, 1, 1, 1, 1,
0.1011972, -0.2226994, 0.4485889, 1, 1, 1, 1, 1,
0.1021054, 1.014951, -1.276721, 1, 1, 1, 1, 1,
0.1077008, 2.104626, 0.1903603, 1, 1, 1, 1, 1,
0.1088094, -2.667562, 3.438759, 1, 1, 1, 1, 1,
0.1138786, 1.171634, 0.6908601, 1, 1, 1, 1, 1,
0.1163034, -0.4809366, 2.838632, 1, 1, 1, 1, 1,
0.1167118, 1.268317, 0.295688, 0, 0, 1, 1, 1,
0.1200119, -1.392418, 3.389995, 1, 0, 0, 1, 1,
0.1224444, 0.1983755, 0.1534274, 1, 0, 0, 1, 1,
0.1227255, -0.8464255, 2.261123, 1, 0, 0, 1, 1,
0.1263255, -0.896889, 2.961432, 1, 0, 0, 1, 1,
0.1276166, -0.7236294, 4.805753, 1, 0, 0, 1, 1,
0.1341802, -0.2763102, 4.11182, 0, 0, 0, 1, 1,
0.1354335, 0.9215218, 1.291343, 0, 0, 0, 1, 1,
0.1358098, 0.3871581, -1.448322, 0, 0, 0, 1, 1,
0.1359564, 0.8872637, 1.170977, 0, 0, 0, 1, 1,
0.1391673, -0.3178574, 2.863238, 0, 0, 0, 1, 1,
0.1401637, -1.581116, 3.836293, 0, 0, 0, 1, 1,
0.141819, -1.464677, 1.895581, 0, 0, 0, 1, 1,
0.1438198, 1.583414, -1.048163, 1, 1, 1, 1, 1,
0.1453808, 0.1249136, 0.5387064, 1, 1, 1, 1, 1,
0.1505488, 0.2252435, -0.3682466, 1, 1, 1, 1, 1,
0.1572722, 1.585687, -0.07798959, 1, 1, 1, 1, 1,
0.1615229, -1.099255, 3.552219, 1, 1, 1, 1, 1,
0.1636389, 0.6881634, 1.965796, 1, 1, 1, 1, 1,
0.1647623, -0.637992, 2.3629, 1, 1, 1, 1, 1,
0.1663784, -1.24189, 4.406858, 1, 1, 1, 1, 1,
0.1686902, 1.366854, -0.6896555, 1, 1, 1, 1, 1,
0.1697004, 0.2677574, 0.5359625, 1, 1, 1, 1, 1,
0.1698335, 0.3510593, 0.9324532, 1, 1, 1, 1, 1,
0.1712276, 0.9463375, 1.772919, 1, 1, 1, 1, 1,
0.1750752, 0.7830368, -0.8687291, 1, 1, 1, 1, 1,
0.178079, -0.01186073, 1.181012, 1, 1, 1, 1, 1,
0.1881156, -0.5826149, 3.113503, 1, 1, 1, 1, 1,
0.1931583, -1.10103, 2.208371, 0, 0, 1, 1, 1,
0.1932008, 1.003368, -1.27597, 1, 0, 0, 1, 1,
0.1935482, 2.321354, 0.5666221, 1, 0, 0, 1, 1,
0.1943692, -0.8458102, 3.173056, 1, 0, 0, 1, 1,
0.1952858, -0.3636697, 2.522652, 1, 0, 0, 1, 1,
0.1965714, 0.9683209, 0.6113237, 1, 0, 0, 1, 1,
0.1985064, 0.6628096, 0.5281252, 0, 0, 0, 1, 1,
0.2017451, -0.9319699, 2.916843, 0, 0, 0, 1, 1,
0.2110623, -0.636681, 3.163919, 0, 0, 0, 1, 1,
0.2171376, -0.8886364, 4.487883, 0, 0, 0, 1, 1,
0.2174048, 0.7186035, -0.3282251, 0, 0, 0, 1, 1,
0.2180379, 1.168318, 0.957267, 0, 0, 0, 1, 1,
0.2201518, 0.3078195, 2.409096, 0, 0, 0, 1, 1,
0.2224067, 0.966477, 1.114316, 1, 1, 1, 1, 1,
0.224315, 0.7372273, -0.4371019, 1, 1, 1, 1, 1,
0.2244225, 0.1704616, 0.1167884, 1, 1, 1, 1, 1,
0.2273133, 0.06334364, 1.763601, 1, 1, 1, 1, 1,
0.2276917, 2.7108, 0.1450728, 1, 1, 1, 1, 1,
0.2318528, 0.07057701, 0.06403178, 1, 1, 1, 1, 1,
0.23419, -0.004336821, 0.8737708, 1, 1, 1, 1, 1,
0.2353992, -1.019619, 2.10517, 1, 1, 1, 1, 1,
0.2357926, -1.028765, 3.438929, 1, 1, 1, 1, 1,
0.2391601, -0.2039203, 0.3179417, 1, 1, 1, 1, 1,
0.2430624, 0.02577768, 1.154087, 1, 1, 1, 1, 1,
0.2438824, 0.08541568, -0.6620266, 1, 1, 1, 1, 1,
0.2498547, 0.6253577, -0.5512143, 1, 1, 1, 1, 1,
0.2528312, 0.9480893, -0.2580681, 1, 1, 1, 1, 1,
0.2573671, -0.7251631, 5.047464, 1, 1, 1, 1, 1,
0.2586705, 0.7676138, -0.1687778, 0, 0, 1, 1, 1,
0.2596416, 1.395088, 0.4280998, 1, 0, 0, 1, 1,
0.2603271, -1.005018, 2.916108, 1, 0, 0, 1, 1,
0.2611524, -0.3845155, 2.994781, 1, 0, 0, 1, 1,
0.2642296, -1.109126, 2.71991, 1, 0, 0, 1, 1,
0.266151, 1.322859, 0.0654804, 1, 0, 0, 1, 1,
0.2672335, -0.4139595, 2.156682, 0, 0, 0, 1, 1,
0.2687387, -1.545121, 2.358018, 0, 0, 0, 1, 1,
0.2689992, 0.8115557, 0.388742, 0, 0, 0, 1, 1,
0.2723595, 1.074352, -0.419559, 0, 0, 0, 1, 1,
0.2734043, -1.011478, 3.224495, 0, 0, 0, 1, 1,
0.2746485, -1.566568, 3.498864, 0, 0, 0, 1, 1,
0.2764971, 0.6399379, 1.491924, 0, 0, 0, 1, 1,
0.2801588, 1.024472, 0.3570375, 1, 1, 1, 1, 1,
0.2818866, 1.289078, -2.279474, 1, 1, 1, 1, 1,
0.2893712, 2.367694, 0.6576928, 1, 1, 1, 1, 1,
0.2952215, 0.6016105, 0.06451866, 1, 1, 1, 1, 1,
0.2986299, 0.9195384, 0.5851108, 1, 1, 1, 1, 1,
0.2999163, 1.629547, -1.392679, 1, 1, 1, 1, 1,
0.3000714, 0.9196451, 1.009261, 1, 1, 1, 1, 1,
0.3020957, -0.1641365, 1.341384, 1, 1, 1, 1, 1,
0.3046095, 2.065699, -1.844698, 1, 1, 1, 1, 1,
0.305167, 0.2308607, 0.344898, 1, 1, 1, 1, 1,
0.3055188, 0.4335483, 2.579727, 1, 1, 1, 1, 1,
0.3075685, -0.268216, 1.127839, 1, 1, 1, 1, 1,
0.3113773, -1.698694, 3.228201, 1, 1, 1, 1, 1,
0.3119329, -0.1356759, 2.459165, 1, 1, 1, 1, 1,
0.3126463, -0.3542119, 1.854855, 1, 1, 1, 1, 1,
0.313556, -0.7503241, 3.294081, 0, 0, 1, 1, 1,
0.3141064, -0.8836516, 1.925149, 1, 0, 0, 1, 1,
0.3161488, 1.587512, 0.9777741, 1, 0, 0, 1, 1,
0.3187725, -0.560282, 0.7021002, 1, 0, 0, 1, 1,
0.3214545, -0.8293343, 2.705786, 1, 0, 0, 1, 1,
0.3244845, -0.861006, 1.580894, 1, 0, 0, 1, 1,
0.3290663, -0.7300879, 3.891403, 0, 0, 0, 1, 1,
0.3293819, 0.4251245, -0.1493695, 0, 0, 0, 1, 1,
0.3299809, -1.275759, 3.412669, 0, 0, 0, 1, 1,
0.3302709, 0.4229378, 1.531146, 0, 0, 0, 1, 1,
0.3348568, -1.104231, 2.714811, 0, 0, 0, 1, 1,
0.3373213, -0.9953335, 1.903739, 0, 0, 0, 1, 1,
0.3381296, 1.860269, 0.5435877, 0, 0, 0, 1, 1,
0.3412354, -1.093652, 1.91722, 1, 1, 1, 1, 1,
0.3450538, 0.6229979, 0.6335033, 1, 1, 1, 1, 1,
0.3559681, 0.4505114, 1.288796, 1, 1, 1, 1, 1,
0.3566408, 0.2643169, 2.749464, 1, 1, 1, 1, 1,
0.3568353, -1.170721, 3.512586, 1, 1, 1, 1, 1,
0.3631217, 0.202793, 1.865008, 1, 1, 1, 1, 1,
0.3687334, -0.09127232, 2.163489, 1, 1, 1, 1, 1,
0.3697844, -1.743415, 3.697384, 1, 1, 1, 1, 1,
0.3714417, -1.944403, 3.730103, 1, 1, 1, 1, 1,
0.3730646, -0.9980033, 2.576368, 1, 1, 1, 1, 1,
0.3766654, -1.583981, 3.538984, 1, 1, 1, 1, 1,
0.3776881, 0.8687797, -0.2409366, 1, 1, 1, 1, 1,
0.3797112, -0.2073979, 2.44823, 1, 1, 1, 1, 1,
0.3859862, -1.040987, 2.303164, 1, 1, 1, 1, 1,
0.3893801, 1.772647, 0.3240729, 1, 1, 1, 1, 1,
0.3895551, -0.4237114, 2.866289, 0, 0, 1, 1, 1,
0.3907359, 0.7972493, 0.8610078, 1, 0, 0, 1, 1,
0.3935547, -0.9934852, 1.693246, 1, 0, 0, 1, 1,
0.3938669, -1.955319, 2.455672, 1, 0, 0, 1, 1,
0.3943685, 0.9897295, 0.8592972, 1, 0, 0, 1, 1,
0.3948863, 0.8038395, -0.2930561, 1, 0, 0, 1, 1,
0.3981233, -0.2982945, 2.767714, 0, 0, 0, 1, 1,
0.3997876, -1.21108, 2.362949, 0, 0, 0, 1, 1,
0.4045231, 0.6112329, 9.300887e-05, 0, 0, 0, 1, 1,
0.4077714, 0.1241514, 2.812557, 0, 0, 0, 1, 1,
0.4133677, 0.9781275, -1.488733, 0, 0, 0, 1, 1,
0.4179484, -0.1569775, 1.346551, 0, 0, 0, 1, 1,
0.4192395, 0.3976232, 2.279182, 0, 0, 0, 1, 1,
0.4193458, 0.3203097, 2.285853, 1, 1, 1, 1, 1,
0.4194905, -0.4367819, 1.679322, 1, 1, 1, 1, 1,
0.4215123, 0.8238094, 1.296408, 1, 1, 1, 1, 1,
0.4261355, -1.013089, 2.80485, 1, 1, 1, 1, 1,
0.4263715, -0.4396514, 2.947417, 1, 1, 1, 1, 1,
0.4360494, 0.8574181, 0.2110075, 1, 1, 1, 1, 1,
0.4416957, -0.4905849, 1.622746, 1, 1, 1, 1, 1,
0.4423787, -0.06180529, 0.7983373, 1, 1, 1, 1, 1,
0.446073, -1.603537, 4.39994, 1, 1, 1, 1, 1,
0.4487223, -0.8965224, 1.778252, 1, 1, 1, 1, 1,
0.4501927, -0.2784588, 1.737704, 1, 1, 1, 1, 1,
0.4571819, -0.3675259, 2.300906, 1, 1, 1, 1, 1,
0.4572692, -0.2421619, 2.006631, 1, 1, 1, 1, 1,
0.457561, 1.278717, 0.6920075, 1, 1, 1, 1, 1,
0.4584095, -0.06479374, 2.773297, 1, 1, 1, 1, 1,
0.4595731, 0.3308848, 1.528864, 0, 0, 1, 1, 1,
0.4616457, -1.686912, 4.12191, 1, 0, 0, 1, 1,
0.4627577, 0.1470916, 0.3095472, 1, 0, 0, 1, 1,
0.4667414, 0.2398069, 0.9155843, 1, 0, 0, 1, 1,
0.4717246, 2.03488, -0.7509826, 1, 0, 0, 1, 1,
0.4760828, -0.4479938, 1.300968, 1, 0, 0, 1, 1,
0.4839685, -0.05862651, 2.945835, 0, 0, 0, 1, 1,
0.484914, 0.01838143, 1.723197, 0, 0, 0, 1, 1,
0.489083, -0.6278824, 2.715844, 0, 0, 0, 1, 1,
0.4936707, 0.5718832, -0.4212358, 0, 0, 0, 1, 1,
0.4962958, -0.8724297, 4.288533, 0, 0, 0, 1, 1,
0.4972174, -1.218965, 1.95056, 0, 0, 0, 1, 1,
0.4986106, 0.9345907, 0.2221985, 0, 0, 0, 1, 1,
0.499412, -0.3588806, 3.942202, 1, 1, 1, 1, 1,
0.5022994, -0.2016298, 2.946895, 1, 1, 1, 1, 1,
0.5031052, 0.6618094, 1.534329, 1, 1, 1, 1, 1,
0.5078461, 1.8708, 0.003431683, 1, 1, 1, 1, 1,
0.5098225, -0.6605704, 2.050527, 1, 1, 1, 1, 1,
0.5107477, -0.05916259, 2.28043, 1, 1, 1, 1, 1,
0.5108238, -0.2325275, 2.534071, 1, 1, 1, 1, 1,
0.5123417, -0.1568857, 2.443517, 1, 1, 1, 1, 1,
0.5136033, 0.03817152, 0.04457647, 1, 1, 1, 1, 1,
0.5185707, 1.485743, 1.008331, 1, 1, 1, 1, 1,
0.5204881, 0.2255984, -0.4394799, 1, 1, 1, 1, 1,
0.5218769, 0.243424, 0.7704821, 1, 1, 1, 1, 1,
0.526125, 0.3528737, 1.046509, 1, 1, 1, 1, 1,
0.5440751, 0.708945, -0.9614624, 1, 1, 1, 1, 1,
0.544469, -1.426786, 1.535392, 1, 1, 1, 1, 1,
0.5447191, 0.9318793, 0.4557716, 0, 0, 1, 1, 1,
0.5485789, 1.164857, -0.4234007, 1, 0, 0, 1, 1,
0.549152, -1.19712, 3.13149, 1, 0, 0, 1, 1,
0.5504064, 0.609333, 0.2573069, 1, 0, 0, 1, 1,
0.5555651, -0.325975, 1.896325, 1, 0, 0, 1, 1,
0.5607185, -1.057994, 2.432322, 1, 0, 0, 1, 1,
0.5621951, 0.4223877, 1.519368, 0, 0, 0, 1, 1,
0.5638995, 1.401438, -0.4268222, 0, 0, 0, 1, 1,
0.5640237, -0.5019963, 1.818603, 0, 0, 0, 1, 1,
0.5754252, 2.148067, 0.01334581, 0, 0, 0, 1, 1,
0.5761529, -1.700137, 2.667871, 0, 0, 0, 1, 1,
0.5820799, -0.1156326, 0.1948798, 0, 0, 0, 1, 1,
0.5829115, -1.012656, 2.296664, 0, 0, 0, 1, 1,
0.5861154, -2.07241, 2.957919, 1, 1, 1, 1, 1,
0.5939159, -0.1796199, 2.552572, 1, 1, 1, 1, 1,
0.5952649, 1.308039, -0.8022547, 1, 1, 1, 1, 1,
0.5986417, 1.737064, 1.782009, 1, 1, 1, 1, 1,
0.599609, 0.4282795, -0.4570106, 1, 1, 1, 1, 1,
0.6058377, 2.687922, 0.3270755, 1, 1, 1, 1, 1,
0.6101604, 0.6770943, 2.339283, 1, 1, 1, 1, 1,
0.6106614, -0.08473399, 2.545351, 1, 1, 1, 1, 1,
0.6145085, 0.3556797, 0.321741, 1, 1, 1, 1, 1,
0.6186356, -0.01879947, 2.19113, 1, 1, 1, 1, 1,
0.6207598, -0.9881964, 2.829055, 1, 1, 1, 1, 1,
0.6277987, -0.2020529, 3.536722, 1, 1, 1, 1, 1,
0.6398759, 1.7359, 2.404281, 1, 1, 1, 1, 1,
0.6415955, -0.0769559, 1.548673, 1, 1, 1, 1, 1,
0.6485024, 0.870523, 0.9363949, 1, 1, 1, 1, 1,
0.650675, -0.8326358, 3.700808, 0, 0, 1, 1, 1,
0.652389, 0.5180146, 0.828266, 1, 0, 0, 1, 1,
0.6687145, 0.9937959, 3.42082, 1, 0, 0, 1, 1,
0.6835385, 1.427581, -1.615941, 1, 0, 0, 1, 1,
0.6846187, 0.00615213, 2.332519, 1, 0, 0, 1, 1,
0.6868775, 1.936478, 1.199483, 1, 0, 0, 1, 1,
0.6904315, 0.2852366, 0.6881496, 0, 0, 0, 1, 1,
0.6928631, -0.01504756, 3.095983, 0, 0, 0, 1, 1,
0.6951874, 0.9684581, 0.004699385, 0, 0, 0, 1, 1,
0.6980861, -1.235456, 1.140355, 0, 0, 0, 1, 1,
0.6997227, -0.6062523, 2.325579, 0, 0, 0, 1, 1,
0.7018448, -0.7180364, 2.458671, 0, 0, 0, 1, 1,
0.7054666, -1.441522, 2.315847, 0, 0, 0, 1, 1,
0.7073792, -0.9517518, 1.895653, 1, 1, 1, 1, 1,
0.7089239, 0.2023866, 1.177184, 1, 1, 1, 1, 1,
0.7100046, -1.193359, 3.229376, 1, 1, 1, 1, 1,
0.7120013, -1.583545, 2.220716, 1, 1, 1, 1, 1,
0.7125605, 0.04072573, 0.8970324, 1, 1, 1, 1, 1,
0.7127472, -0.4980458, 3.977317, 1, 1, 1, 1, 1,
0.7146808, 1.269841, 1.051631, 1, 1, 1, 1, 1,
0.7213422, -0.2654786, 0.9029696, 1, 1, 1, 1, 1,
0.7217578, 1.368335, 1.251633, 1, 1, 1, 1, 1,
0.7297373, 0.3028105, 0.007559133, 1, 1, 1, 1, 1,
0.7309849, 1.989874, 1.776747, 1, 1, 1, 1, 1,
0.7315884, -0.07811362, 1.555715, 1, 1, 1, 1, 1,
0.7345086, 0.4080212, 1.803666, 1, 1, 1, 1, 1,
0.7354127, -1.885478, 2.418057, 1, 1, 1, 1, 1,
0.7365144, -1.074182, 1.911608, 1, 1, 1, 1, 1,
0.7374418, -0.3140246, 3.141166, 0, 0, 1, 1, 1,
0.7388355, -1.213971, 3.888894, 1, 0, 0, 1, 1,
0.7415001, -0.1144017, -0.7887042, 1, 0, 0, 1, 1,
0.7441191, -0.3281841, 2.036773, 1, 0, 0, 1, 1,
0.7456277, 0.5261945, 0.7373646, 1, 0, 0, 1, 1,
0.7463087, -0.3762013, 1.865011, 1, 0, 0, 1, 1,
0.7477236, 0.06896466, 1.462347, 0, 0, 0, 1, 1,
0.7484202, -0.9997768, 2.056438, 0, 0, 0, 1, 1,
0.7511585, -1.217787, 3.458316, 0, 0, 0, 1, 1,
0.7533443, 1.091635, 1.344849, 0, 0, 0, 1, 1,
0.7573323, -1.182527, 1.860079, 0, 0, 0, 1, 1,
0.7615228, -1.643299, 3.645427, 0, 0, 0, 1, 1,
0.76415, -0.4862949, 3.765233, 0, 0, 0, 1, 1,
0.7776881, 0.6691313, 1.303852, 1, 1, 1, 1, 1,
0.7789487, -0.2685956, 3.18612, 1, 1, 1, 1, 1,
0.7858359, -1.002856, 0.2918157, 1, 1, 1, 1, 1,
0.7860974, 0.265061, 0.5682032, 1, 1, 1, 1, 1,
0.7904143, -0.07431496, 2.088642, 1, 1, 1, 1, 1,
0.7920226, -0.08538601, 0.6309721, 1, 1, 1, 1, 1,
0.793849, 0.4029108, 0.1750837, 1, 1, 1, 1, 1,
0.8001802, -0.1991687, 1.65593, 1, 1, 1, 1, 1,
0.8033071, -0.04534728, 0.239029, 1, 1, 1, 1, 1,
0.8036543, -0.7842424, 1.323852, 1, 1, 1, 1, 1,
0.8115846, -0.1621546, 1.461733, 1, 1, 1, 1, 1,
0.8119186, -1.149131, 1.296049, 1, 1, 1, 1, 1,
0.8153458, -0.658126, 1.834512, 1, 1, 1, 1, 1,
0.8163437, -1.017843, 0.8004814, 1, 1, 1, 1, 1,
0.8175941, 0.8977199, 0.4458181, 1, 1, 1, 1, 1,
0.8208632, -0.0563307, 1.618658, 0, 0, 1, 1, 1,
0.8322763, -0.7795377, 2.938925, 1, 0, 0, 1, 1,
0.8336, 1.093934, 1.109858, 1, 0, 0, 1, 1,
0.8368731, 0.6885028, -0.3366894, 1, 0, 0, 1, 1,
0.8385841, 1.200981, 0.01310867, 1, 0, 0, 1, 1,
0.843955, -1.265074, 1.249537, 1, 0, 0, 1, 1,
0.8487463, -0.2084863, 1.20887, 0, 0, 0, 1, 1,
0.8568169, 1.67458, 0.3678563, 0, 0, 0, 1, 1,
0.8569488, -0.3508233, 4.181518, 0, 0, 0, 1, 1,
0.8627882, -1.058076, 2.221746, 0, 0, 0, 1, 1,
0.8687419, -1.354441, 2.53749, 0, 0, 0, 1, 1,
0.8707384, -0.06501114, 1.542392, 0, 0, 0, 1, 1,
0.8747144, 1.307429, 2.786599, 0, 0, 0, 1, 1,
0.8797302, 1.594638, -0.1921982, 1, 1, 1, 1, 1,
0.8801686, 0.2013814, 2.17084, 1, 1, 1, 1, 1,
0.8849925, -0.7719276, 0.8709789, 1, 1, 1, 1, 1,
0.888907, -1.042929, 2.406242, 1, 1, 1, 1, 1,
0.8930616, 0.8211674, -0.0612231, 1, 1, 1, 1, 1,
0.8995945, -0.9922237, 2.387228, 1, 1, 1, 1, 1,
0.9015806, 1.020607, 1.906984, 1, 1, 1, 1, 1,
0.9057396, 0.5096706, 0.05627609, 1, 1, 1, 1, 1,
0.9135064, 0.5510421, 0.7194019, 1, 1, 1, 1, 1,
0.9208667, -0.07846389, 1.021774, 1, 1, 1, 1, 1,
0.9251488, -1.608422, 0.387554, 1, 1, 1, 1, 1,
0.9270536, -1.050028, 3.059363, 1, 1, 1, 1, 1,
0.9330265, -1.141227, 4.330563, 1, 1, 1, 1, 1,
0.9360618, 0.6588817, 1.511046, 1, 1, 1, 1, 1,
0.9430348, 0.5147037, 1.956775, 1, 1, 1, 1, 1,
0.9485124, -1.039177, 2.905223, 0, 0, 1, 1, 1,
0.9489049, 2.617252, 0.2297047, 1, 0, 0, 1, 1,
0.9506353, 0.4153739, 0.8058777, 1, 0, 0, 1, 1,
0.9536307, -0.659143, 3.847759, 1, 0, 0, 1, 1,
0.9588214, 1.029317, -1.369735, 1, 0, 0, 1, 1,
0.9681919, -1.06064, 2.817206, 1, 0, 0, 1, 1,
0.9693766, 0.4294727, 0.5985099, 0, 0, 0, 1, 1,
0.9712815, -1.450095, 1.929858, 0, 0, 0, 1, 1,
0.9724045, -0.3488619, 1.877516, 0, 0, 0, 1, 1,
0.9753938, 1.806466, 0.7417919, 0, 0, 0, 1, 1,
0.9757219, 1.070086, 0.1950718, 0, 0, 0, 1, 1,
0.9831151, -0.03854192, 1.622096, 0, 0, 0, 1, 1,
0.9846023, 0.006102942, 1.166485, 0, 0, 0, 1, 1,
0.9859775, -1.773078, 1.732862, 1, 1, 1, 1, 1,
0.9950851, -0.02136074, 2.557502, 1, 1, 1, 1, 1,
1.000788, -2.570593, 0.9317415, 1, 1, 1, 1, 1,
1.001217, 0.537501, 1.590756, 1, 1, 1, 1, 1,
1.005629, 0.3487774, 2.280766, 1, 1, 1, 1, 1,
1.019478, 0.4546034, 1.153037, 1, 1, 1, 1, 1,
1.028318, -1.144607, 3.187151, 1, 1, 1, 1, 1,
1.035291, -1.102195, 2.834506, 1, 1, 1, 1, 1,
1.039316, 1.03376, 1.70666, 1, 1, 1, 1, 1,
1.041643, -0.1214135, 3.068793, 1, 1, 1, 1, 1,
1.041764, -0.03466736, 1.594348, 1, 1, 1, 1, 1,
1.050077, -0.9050793, 3.426832, 1, 1, 1, 1, 1,
1.053722, -1.055504, 2.806303, 1, 1, 1, 1, 1,
1.059758, 1.320783, 1.561245, 1, 1, 1, 1, 1,
1.066119, -0.3671017, 1.812692, 1, 1, 1, 1, 1,
1.066686, -0.1312855, 1.633204, 0, 0, 1, 1, 1,
1.071183, 0.9287083, 1.439211, 1, 0, 0, 1, 1,
1.072151, 0.2044182, -0.3711386, 1, 0, 0, 1, 1,
1.074635, 0.7132962, 1.086113, 1, 0, 0, 1, 1,
1.083018, 0.1751919, -0.5180944, 1, 0, 0, 1, 1,
1.087739, 0.9087673, 0.869634, 1, 0, 0, 1, 1,
1.095018, -0.227379, 1.764536, 0, 0, 0, 1, 1,
1.103737, -0.2204916, 0.595298, 0, 0, 0, 1, 1,
1.112158, -1.473361, 2.453565, 0, 0, 0, 1, 1,
1.11517, -0.5159942, -0.461529, 0, 0, 0, 1, 1,
1.115207, -1.209426, 3.902837, 0, 0, 0, 1, 1,
1.11725, 0.4318081, 0.1191337, 0, 0, 0, 1, 1,
1.119157, -0.6726976, 2.043983, 0, 0, 0, 1, 1,
1.131953, -0.6523944, 2.913888, 1, 1, 1, 1, 1,
1.135563, 0.4090714, 0.4675049, 1, 1, 1, 1, 1,
1.139568, 0.5255257, 0.4068257, 1, 1, 1, 1, 1,
1.14708, 1.768553, 0.7932028, 1, 1, 1, 1, 1,
1.147145, -0.4117417, 0.9810337, 1, 1, 1, 1, 1,
1.148556, 0.5818244, 2.096453, 1, 1, 1, 1, 1,
1.158807, -0.3945515, 1.21345, 1, 1, 1, 1, 1,
1.158842, -0.5024776, 2.464316, 1, 1, 1, 1, 1,
1.163195, -0.09811953, 2.378963, 1, 1, 1, 1, 1,
1.168862, 1.062144, 2.212188, 1, 1, 1, 1, 1,
1.171331, 1.281946, 2.366187, 1, 1, 1, 1, 1,
1.175793, -2.450642, 2.501467, 1, 1, 1, 1, 1,
1.181958, -0.6333982, 2.102632, 1, 1, 1, 1, 1,
1.185091, -0.2193262, 0.9438695, 1, 1, 1, 1, 1,
1.188587, 0.5231851, 0.6643546, 1, 1, 1, 1, 1,
1.189367, -0.1387459, 2.431832, 0, 0, 1, 1, 1,
1.195572, -0.3385493, 2.228186, 1, 0, 0, 1, 1,
1.201292, -0.7758502, 1.537966, 1, 0, 0, 1, 1,
1.201677, 0.1661579, 1.799374, 1, 0, 0, 1, 1,
1.203687, 1.027048, 1.649757, 1, 0, 0, 1, 1,
1.204052, -1.717452, 0.7571035, 1, 0, 0, 1, 1,
1.205635, -1.245037, 2.165644, 0, 0, 0, 1, 1,
1.206671, -0.6076158, 2.766037, 0, 0, 0, 1, 1,
1.220008, 0.7632591, 0.154158, 0, 0, 0, 1, 1,
1.222322, 0.2486634, 1.804274, 0, 0, 0, 1, 1,
1.224825, -0.4070802, 2.963994, 0, 0, 0, 1, 1,
1.236832, 1.734771, 1.131418, 0, 0, 0, 1, 1,
1.238289, 1.37498, -0.590373, 0, 0, 0, 1, 1,
1.24496, -2.130221, 0.4980173, 1, 1, 1, 1, 1,
1.249236, 0.08613328, 1.836453, 1, 1, 1, 1, 1,
1.26107, -0.2862456, 0.7639129, 1, 1, 1, 1, 1,
1.266804, -1.739794, 1.490124, 1, 1, 1, 1, 1,
1.27237, 0.9473414, 0.6305544, 1, 1, 1, 1, 1,
1.278584, 0.13856, 0.9564809, 1, 1, 1, 1, 1,
1.281917, 0.04423227, 1.780756, 1, 1, 1, 1, 1,
1.286549, -0.3430133, 3.144207, 1, 1, 1, 1, 1,
1.28799, 1.492354, -0.2833119, 1, 1, 1, 1, 1,
1.288095, 0.2266079, 1.504752, 1, 1, 1, 1, 1,
1.288151, -0.09682596, 1.171873, 1, 1, 1, 1, 1,
1.289142, -1.022625, 2.602943, 1, 1, 1, 1, 1,
1.293815, 0.8648644, 0.3105471, 1, 1, 1, 1, 1,
1.295727, -0.6863316, 1.911485, 1, 1, 1, 1, 1,
1.300549, 0.3844787, 1.870824, 1, 1, 1, 1, 1,
1.304807, 0.8057736, 0.0008626695, 0, 0, 1, 1, 1,
1.307172, -0.4462505, 0.132829, 1, 0, 0, 1, 1,
1.309832, -0.8571716, 3.051054, 1, 0, 0, 1, 1,
1.31879, 1.719609, 0.4468236, 1, 0, 0, 1, 1,
1.324022, -0.6481429, 1.377429, 1, 0, 0, 1, 1,
1.328816, -1.29856, 2.23553, 1, 0, 0, 1, 1,
1.332817, -0.2568719, 2.329989, 0, 0, 0, 1, 1,
1.334823, 1.421053, 0.8238976, 0, 0, 0, 1, 1,
1.337036, -0.4957843, 1.962924, 0, 0, 0, 1, 1,
1.357223, 0.03677708, 1.200312, 0, 0, 0, 1, 1,
1.359213, 1.144861, 2.499242, 0, 0, 0, 1, 1,
1.377574, 1.310087, 1.392952, 0, 0, 0, 1, 1,
1.400932, 0.8990916, 0.5626757, 0, 0, 0, 1, 1,
1.407244, 0.8440152, 2.117739, 1, 1, 1, 1, 1,
1.408519, 1.308976, -1.384174, 1, 1, 1, 1, 1,
1.408691, -1.089865, 1.041858, 1, 1, 1, 1, 1,
1.412023, -0.4975309, 2.219159, 1, 1, 1, 1, 1,
1.414465, -0.463442, 1.739782, 1, 1, 1, 1, 1,
1.421953, -1.709404, 2.102038, 1, 1, 1, 1, 1,
1.426872, -0.01312253, 1.640604, 1, 1, 1, 1, 1,
1.427882, 1.425755, 0.870097, 1, 1, 1, 1, 1,
1.428318, 0.4506318, 1.233153, 1, 1, 1, 1, 1,
1.432397, -0.4540073, 2.183172, 1, 1, 1, 1, 1,
1.435257, 0.4377064, 1.373127, 1, 1, 1, 1, 1,
1.45003, 1.17529, 0.7594028, 1, 1, 1, 1, 1,
1.460693, -2.413019, 4.705887, 1, 1, 1, 1, 1,
1.460953, -0.2750996, 3.58272, 1, 1, 1, 1, 1,
1.464354, 0.2136465, 0.5945617, 1, 1, 1, 1, 1,
1.46511, 0.678578, 1.595948, 0, 0, 1, 1, 1,
1.472413, 0.697705, 1.315641, 1, 0, 0, 1, 1,
1.480003, -0.8156325, 1.492982, 1, 0, 0, 1, 1,
1.480293, 0.5679854, 0.910154, 1, 0, 0, 1, 1,
1.481246, -0.3926641, 1.346346, 1, 0, 0, 1, 1,
1.490985, -0.2731042, 2.593557, 1, 0, 0, 1, 1,
1.533586, 1.190685, 1.370066, 0, 0, 0, 1, 1,
1.54467, 0.3080621, 3.255027, 0, 0, 0, 1, 1,
1.545191, -0.08723639, 3.097359, 0, 0, 0, 1, 1,
1.55553, -0.5340341, 1.877509, 0, 0, 0, 1, 1,
1.566619, 0.5644277, 1.651311, 0, 0, 0, 1, 1,
1.580741, 0.5187274, 0.7202192, 0, 0, 0, 1, 1,
1.583025, -1.126112, 1.143899, 0, 0, 0, 1, 1,
1.585117, 1.204128, -0.4600555, 1, 1, 1, 1, 1,
1.596501, 0.6724778, 2.081142, 1, 1, 1, 1, 1,
1.602093, 0.04375184, 1.876438, 1, 1, 1, 1, 1,
1.616941, -0.5984517, 2.352777, 1, 1, 1, 1, 1,
1.624043, 0.2581648, 2.72371, 1, 1, 1, 1, 1,
1.627687, -0.4897669, 3.064938, 1, 1, 1, 1, 1,
1.634154, -1.515818, 4.339231, 1, 1, 1, 1, 1,
1.635121, -0.2370163, 2.274523, 1, 1, 1, 1, 1,
1.639529, 0.001078462, 1.92473, 1, 1, 1, 1, 1,
1.652401, -1.050964, 0.5583653, 1, 1, 1, 1, 1,
1.663181, 0.7645598, 1.482117, 1, 1, 1, 1, 1,
1.664961, -0.726673, 3.51618, 1, 1, 1, 1, 1,
1.675369, 2.045698, -1.80996, 1, 1, 1, 1, 1,
1.684031, 0.3842268, 1.262646, 1, 1, 1, 1, 1,
1.70021, -0.3567904, 0.5103738, 1, 1, 1, 1, 1,
1.703852, -0.9761671, 1.407959, 0, 0, 1, 1, 1,
1.708624, 1.58294, 3.436219, 1, 0, 0, 1, 1,
1.709422, 0.4238847, 0.2159092, 1, 0, 0, 1, 1,
1.717341, 1.388907, 0.9924669, 1, 0, 0, 1, 1,
1.727481, 0.004639138, 0.1243847, 1, 0, 0, 1, 1,
1.732514, 0.6396742, 0.3129556, 1, 0, 0, 1, 1,
1.750039, 1.342198, 0.8614001, 0, 0, 0, 1, 1,
1.770256, 0.5626193, 1.130336, 0, 0, 0, 1, 1,
1.807884, 1.324554, 1.575071, 0, 0, 0, 1, 1,
1.808244, 0.431555, 0.4662751, 0, 0, 0, 1, 1,
1.812023, 1.4686, 0.7883186, 0, 0, 0, 1, 1,
1.840163, 1.546037, 0.4366801, 0, 0, 0, 1, 1,
1.861553, 0.3741434, 0.8940143, 0, 0, 0, 1, 1,
1.899775, 1.214055, 0.7838774, 1, 1, 1, 1, 1,
1.905989, -0.8118573, 0.298843, 1, 1, 1, 1, 1,
1.970176, -0.652163, 2.449197, 1, 1, 1, 1, 1,
1.978697, 0.1606856, 1.626351, 1, 1, 1, 1, 1,
1.980731, 0.09626979, 2.471346, 1, 1, 1, 1, 1,
2.002451, -0.5013801, 1.647211, 1, 1, 1, 1, 1,
2.055819, -0.5567626, 2.328338, 1, 1, 1, 1, 1,
2.068934, 0.2274555, 1.394366, 1, 1, 1, 1, 1,
2.084908, 0.599717, 2.311711, 1, 1, 1, 1, 1,
2.10397, -1.347733, 2.907247, 1, 1, 1, 1, 1,
2.107318, 1.326591, -0.1513106, 1, 1, 1, 1, 1,
2.121204, 0.01206359, -0.4968912, 1, 1, 1, 1, 1,
2.130843, 0.2733361, 1.242284, 1, 1, 1, 1, 1,
2.15754, 0.5413322, 2.276907, 1, 1, 1, 1, 1,
2.177633, 0.9785259, -0.9575365, 1, 1, 1, 1, 1,
2.184923, 1.460858, 0.6335354, 0, 0, 1, 1, 1,
2.215584, 0.2404751, 2.214502, 1, 0, 0, 1, 1,
2.220501, -1.036425, 2.660895, 1, 0, 0, 1, 1,
2.228741, -0.06867518, 2.027798, 1, 0, 0, 1, 1,
2.265615, -0.1176057, 2.273907, 1, 0, 0, 1, 1,
2.267847, 0.7852107, 1.613023, 1, 0, 0, 1, 1,
2.273024, 0.4820749, 2.359331, 0, 0, 0, 1, 1,
2.305827, 0.06723942, 1.816652, 0, 0, 0, 1, 1,
2.384196, -0.9829255, 3.458191, 0, 0, 0, 1, 1,
2.459122, -0.704843, 2.396021, 0, 0, 0, 1, 1,
2.459916, 0.1458631, 2.27664, 0, 0, 0, 1, 1,
2.502491, -0.4298514, -0.5702151, 0, 0, 0, 1, 1,
2.516267, -2.529839, 2.127214, 0, 0, 0, 1, 1,
2.547298, 0.9323282, 0.1906928, 1, 1, 1, 1, 1,
2.565004, 0.186105, 1.753811, 1, 1, 1, 1, 1,
2.662437, 2.492883, 1.120023, 1, 1, 1, 1, 1,
2.746469, -0.005842911, 1.727822, 1, 1, 1, 1, 1,
2.776903, -0.1686016, 1.981049, 1, 1, 1, 1, 1,
2.9073, 0.6758133, 0.7685856, 1, 1, 1, 1, 1,
3.055596, 0.07509348, 1.579431, 1, 1, 1, 1, 1
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
var radius = 9.655423;
var distance = 33.91426;
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
mvMatrix.translate( 0.1135507, 0.04838085, 0.374579 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.91426);
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
