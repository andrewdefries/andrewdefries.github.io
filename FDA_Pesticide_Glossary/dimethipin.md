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
-3.238968, 1.295669, -1.854218, 1, 0, 0, 1,
-3.201491, 0.175819, -1.544905, 1, 0.007843138, 0, 1,
-2.769442, -2.720819, -2.744967, 1, 0.01176471, 0, 1,
-2.670159, 0.4973911, -0.2609704, 1, 0.01960784, 0, 1,
-2.647861, 0.1753484, -0.9441923, 1, 0.02352941, 0, 1,
-2.63738, 0.07365521, -0.1978603, 1, 0.03137255, 0, 1,
-2.579719, -0.7130716, -0.0001702958, 1, 0.03529412, 0, 1,
-2.548736, 0.5967602, -1.58338, 1, 0.04313726, 0, 1,
-2.496585, 0.3412551, -0.6257605, 1, 0.04705882, 0, 1,
-2.451608, -1.827713, -4.33166, 1, 0.05490196, 0, 1,
-2.419661, 2.401099, 0.235973, 1, 0.05882353, 0, 1,
-2.382979, 0.0004717146, -0.5500203, 1, 0.06666667, 0, 1,
-2.373456, -2.295382, -2.954177, 1, 0.07058824, 0, 1,
-2.34428, -1.826316, -1.641177, 1, 0.07843138, 0, 1,
-2.342579, 1.190028, -2.538213, 1, 0.08235294, 0, 1,
-2.297964, 0.6824682, -0.9550695, 1, 0.09019608, 0, 1,
-2.233634, 0.6173944, 1.330648, 1, 0.09411765, 0, 1,
-2.212893, 0.4640345, -1.731543, 1, 0.1019608, 0, 1,
-2.206366, 0.4003241, 0.6357977, 1, 0.1098039, 0, 1,
-2.186905, 0.8428893, -0.5198696, 1, 0.1137255, 0, 1,
-2.131095, 0.009140344, -2.000959, 1, 0.1215686, 0, 1,
-2.127371, -0.4946138, -2.302275, 1, 0.1254902, 0, 1,
-2.099825, 1.257905, -1.732948, 1, 0.1333333, 0, 1,
-2.075325, -0.0447468, -0.9579934, 1, 0.1372549, 0, 1,
-2.064734, 0.1830429, -0.5637168, 1, 0.145098, 0, 1,
-2.051646, -0.8122993, -3.079581, 1, 0.1490196, 0, 1,
-2.04979, -0.02531319, -1.810989, 1, 0.1568628, 0, 1,
-2.04752, -1.561489, -3.930516, 1, 0.1607843, 0, 1,
-2.047063, 0.7555081, -0.6054701, 1, 0.1686275, 0, 1,
-2.022188, -0.6673733, -2.446015, 1, 0.172549, 0, 1,
-2.0177, -1.47945, -2.092382, 1, 0.1803922, 0, 1,
-1.967023, 0.729819, -1.130904, 1, 0.1843137, 0, 1,
-1.962707, -0.3350578, -2.300438, 1, 0.1921569, 0, 1,
-1.937367, 0.2932198, -0.02858883, 1, 0.1960784, 0, 1,
-1.919489, -0.4219387, -2.066756, 1, 0.2039216, 0, 1,
-1.901344, 0.2494796, -2.146527, 1, 0.2117647, 0, 1,
-1.893272, -0.7712282, -3.195071, 1, 0.2156863, 0, 1,
-1.891127, 1.022478, -1.333942, 1, 0.2235294, 0, 1,
-1.864138, 0.1658799, -2.898668, 1, 0.227451, 0, 1,
-1.852885, -1.231387, -0.5362692, 1, 0.2352941, 0, 1,
-1.841441, -0.9417203, -1.346439, 1, 0.2392157, 0, 1,
-1.834333, 0.4130174, -3.367389, 1, 0.2470588, 0, 1,
-1.829101, 0.6257428, -2.024714, 1, 0.2509804, 0, 1,
-1.817457, -0.3823796, -1.746752, 1, 0.2588235, 0, 1,
-1.813464, 0.1585394, -2.963844, 1, 0.2627451, 0, 1,
-1.795987, 1.422054, -2.018801, 1, 0.2705882, 0, 1,
-1.789705, 0.06245293, -0.1356162, 1, 0.2745098, 0, 1,
-1.785507, -1.149689, -1.780146, 1, 0.282353, 0, 1,
-1.771675, -1.06943, -2.413655, 1, 0.2862745, 0, 1,
-1.755628, -0.4558194, -2.544169, 1, 0.2941177, 0, 1,
-1.733955, 1.091588, -2.527153, 1, 0.3019608, 0, 1,
-1.731741, 0.3241305, -2.381482, 1, 0.3058824, 0, 1,
-1.729959, 1.27999, -2.160882, 1, 0.3137255, 0, 1,
-1.725387, 0.3289456, -1.609295, 1, 0.3176471, 0, 1,
-1.720608, 0.4201429, -2.860784, 1, 0.3254902, 0, 1,
-1.720395, -0.4167016, -2.31999, 1, 0.3294118, 0, 1,
-1.692197, 0.3325415, -2.88747, 1, 0.3372549, 0, 1,
-1.688519, 1.842835, 1.235236, 1, 0.3411765, 0, 1,
-1.683916, -1.207154, -2.86875, 1, 0.3490196, 0, 1,
-1.676604, -0.9967337, -4.945835, 1, 0.3529412, 0, 1,
-1.67225, -0.9040024, -3.02417, 1, 0.3607843, 0, 1,
-1.66498, -0.3140394, -2.144269, 1, 0.3647059, 0, 1,
-1.658283, 1.00005, -0.981495, 1, 0.372549, 0, 1,
-1.64714, 0.4595399, 0.01343821, 1, 0.3764706, 0, 1,
-1.646667, -0.03268434, -2.284966, 1, 0.3843137, 0, 1,
-1.623038, -0.9001694, -2.08793, 1, 0.3882353, 0, 1,
-1.615883, 0.1124851, -0.6408937, 1, 0.3960784, 0, 1,
-1.615739, 2.298381, -0.8381254, 1, 0.4039216, 0, 1,
-1.606783, 1.811447, -0.924042, 1, 0.4078431, 0, 1,
-1.599987, 1.149697, -1.871456, 1, 0.4156863, 0, 1,
-1.587376, -0.9095198, -1.766609, 1, 0.4196078, 0, 1,
-1.570634, -1.790127, -1.998832, 1, 0.427451, 0, 1,
-1.567369, 0.8516644, -1.019943, 1, 0.4313726, 0, 1,
-1.558935, -0.2674981, -0.9497847, 1, 0.4392157, 0, 1,
-1.55825, -0.1652334, -2.046983, 1, 0.4431373, 0, 1,
-1.547228, 0.247879, -1.085601, 1, 0.4509804, 0, 1,
-1.512569, 0.2100322, -1.673031, 1, 0.454902, 0, 1,
-1.510429, 0.1076352, 0.2574825, 1, 0.4627451, 0, 1,
-1.506459, 2.20727, -1.258512, 1, 0.4666667, 0, 1,
-1.505231, 0.8781087, -1.812451, 1, 0.4745098, 0, 1,
-1.503791, -0.008010906, -3.088199, 1, 0.4784314, 0, 1,
-1.487933, 1.598561, -0.5315844, 1, 0.4862745, 0, 1,
-1.485586, -1.128629, -1.038046, 1, 0.4901961, 0, 1,
-1.48021, -0.08661559, 0.5441694, 1, 0.4980392, 0, 1,
-1.472028, 1.173884, -0.141025, 1, 0.5058824, 0, 1,
-1.45842, 0.587184, -2.486617, 1, 0.509804, 0, 1,
-1.453144, 0.5698166, -1.53617, 1, 0.5176471, 0, 1,
-1.427081, -0.02517421, -1.109985, 1, 0.5215687, 0, 1,
-1.415042, 0.6311799, -1.60886, 1, 0.5294118, 0, 1,
-1.403816, 0.7702358, -0.5188282, 1, 0.5333334, 0, 1,
-1.398666, -0.2052358, -0.2764119, 1, 0.5411765, 0, 1,
-1.392128, 0.5877132, -0.34303, 1, 0.5450981, 0, 1,
-1.369417, 0.1199771, -1.33724, 1, 0.5529412, 0, 1,
-1.369044, -1.52616, -3.403039, 1, 0.5568628, 0, 1,
-1.36186, 0.6659938, -0.5888661, 1, 0.5647059, 0, 1,
-1.341865, -0.08228092, -1.106863, 1, 0.5686275, 0, 1,
-1.338491, 0.5084794, -1.228851, 1, 0.5764706, 0, 1,
-1.32972, 0.04219331, -0.6911982, 1, 0.5803922, 0, 1,
-1.329059, 0.4986959, -1.92506, 1, 0.5882353, 0, 1,
-1.3229, 0.8282205, -1.491509, 1, 0.5921569, 0, 1,
-1.301098, 0.3165661, -1.438342, 1, 0.6, 0, 1,
-1.291221, 0.03045108, -0.2780095, 1, 0.6078432, 0, 1,
-1.286569, -0.6754355, -2.758336, 1, 0.6117647, 0, 1,
-1.284976, 0.5483695, -1.284107, 1, 0.6196079, 0, 1,
-1.275985, 0.8255111, -1.700406, 1, 0.6235294, 0, 1,
-1.270504, -0.3977005, -0.472226, 1, 0.6313726, 0, 1,
-1.266287, -0.3095743, -2.490083, 1, 0.6352941, 0, 1,
-1.250263, 0.2487595, -2.510286, 1, 0.6431373, 0, 1,
-1.241157, 2.373842, -0.2247616, 1, 0.6470588, 0, 1,
-1.235724, -1.451996, -1.717684, 1, 0.654902, 0, 1,
-1.235709, 1.798506, -0.3502666, 1, 0.6588235, 0, 1,
-1.229403, 1.588391, -1.103939, 1, 0.6666667, 0, 1,
-1.22362, -0.1497678, 0.1067604, 1, 0.6705883, 0, 1,
-1.21547, -0.04714938, -2.5812, 1, 0.6784314, 0, 1,
-1.211739, 0.599678, -1.422354, 1, 0.682353, 0, 1,
-1.197036, 0.4308542, -1.960076, 1, 0.6901961, 0, 1,
-1.182953, -0.690482, -1.739851, 1, 0.6941177, 0, 1,
-1.175758, -0.2901796, -4.189302, 1, 0.7019608, 0, 1,
-1.174202, 0.5718601, -2.399159, 1, 0.7098039, 0, 1,
-1.171329, 0.7564228, -0.6852505, 1, 0.7137255, 0, 1,
-1.160729, 1.144214, -0.13792, 1, 0.7215686, 0, 1,
-1.156481, -0.06320188, 0.4511913, 1, 0.7254902, 0, 1,
-1.143811, 1.614877, -0.05899995, 1, 0.7333333, 0, 1,
-1.138656, -2.085319, -1.113223, 1, 0.7372549, 0, 1,
-1.126999, 0.8751642, -2.420886, 1, 0.7450981, 0, 1,
-1.112385, -0.4045791, -1.477816, 1, 0.7490196, 0, 1,
-1.096186, -2.405604, -0.5080637, 1, 0.7568628, 0, 1,
-1.084274, -0.1393809, -2.38217, 1, 0.7607843, 0, 1,
-1.083435, 0.918011, -0.0242543, 1, 0.7686275, 0, 1,
-1.082251, -1.140817, -3.971045, 1, 0.772549, 0, 1,
-1.080816, -0.4232706, -1.814273, 1, 0.7803922, 0, 1,
-1.078258, -1.774966, -1.913371, 1, 0.7843137, 0, 1,
-1.066453, 0.8729532, -0.1043205, 1, 0.7921569, 0, 1,
-1.059845, -0.6703582, -2.125072, 1, 0.7960784, 0, 1,
-1.059408, -0.6694792, -2.734554, 1, 0.8039216, 0, 1,
-1.056553, 0.2790099, -1.738218, 1, 0.8117647, 0, 1,
-1.055699, -0.2016619, -3.183033, 1, 0.8156863, 0, 1,
-1.050836, -0.583097, -1.059283, 1, 0.8235294, 0, 1,
-1.049419, -0.5848917, -1.060247, 1, 0.827451, 0, 1,
-1.04419, 0.09910685, -0.3543407, 1, 0.8352941, 0, 1,
-1.040742, 1.788506, -0.328487, 1, 0.8392157, 0, 1,
-1.040695, -1.235861, -2.801001, 1, 0.8470588, 0, 1,
-1.039375, 2.050566, -0.2513082, 1, 0.8509804, 0, 1,
-1.036581, -0.001119479, -1.165743, 1, 0.8588235, 0, 1,
-1.036134, 0.8908092, 0.2840797, 1, 0.8627451, 0, 1,
-1.033508, 1.122121, -1.595166, 1, 0.8705882, 0, 1,
-1.031413, -0.1118204, -2.619112, 1, 0.8745098, 0, 1,
-1.021881, -0.4355082, -2.773592, 1, 0.8823529, 0, 1,
-1.021661, -0.267939, -1.30172, 1, 0.8862745, 0, 1,
-1.019055, 0.05403812, 0.1713337, 1, 0.8941177, 0, 1,
-1.014362, -0.2414398, -2.311001, 1, 0.8980392, 0, 1,
-1.000301, -2.177204, -4.11625, 1, 0.9058824, 0, 1,
-0.9992498, -0.8378995, -1.721406, 1, 0.9137255, 0, 1,
-0.9978195, -0.8222723, -1.061675, 1, 0.9176471, 0, 1,
-0.9962116, 1.501724, 0.5516006, 1, 0.9254902, 0, 1,
-0.98717, 1.114839, -0.1926535, 1, 0.9294118, 0, 1,
-0.9840018, -0.5615804, -1.297595, 1, 0.9372549, 0, 1,
-0.9762992, -0.3433339, -3.272047, 1, 0.9411765, 0, 1,
-0.9751788, -1.425743, -1.201121, 1, 0.9490196, 0, 1,
-0.9708277, 2.361023, 1.298138, 1, 0.9529412, 0, 1,
-0.9655077, 0.5672445, -3.153929, 1, 0.9607843, 0, 1,
-0.9652611, -1.768476, -2.105443, 1, 0.9647059, 0, 1,
-0.9630379, 1.655894, -0.977725, 1, 0.972549, 0, 1,
-0.9599785, -0.369237, -0.02539134, 1, 0.9764706, 0, 1,
-0.9507877, -0.4949724, -0.7051124, 1, 0.9843137, 0, 1,
-0.9506286, -0.7441913, -1.518844, 1, 0.9882353, 0, 1,
-0.9389036, -0.3827866, -2.850266, 1, 0.9960784, 0, 1,
-0.9315318, -0.5324992, -3.298906, 0.9960784, 1, 0, 1,
-0.9293575, 1.05659, -0.8220206, 0.9921569, 1, 0, 1,
-0.927937, -0.4445847, 0.4636814, 0.9843137, 1, 0, 1,
-0.9273964, 0.7514123, -1.690197, 0.9803922, 1, 0, 1,
-0.9257409, 0.1322737, -0.220568, 0.972549, 1, 0, 1,
-0.9211222, -0.4704141, -2.943024, 0.9686275, 1, 0, 1,
-0.9116502, 1.127019, -1.05251, 0.9607843, 1, 0, 1,
-0.9070189, -1.004005, -2.045521, 0.9568627, 1, 0, 1,
-0.8998256, 0.4264954, -0.9638907, 0.9490196, 1, 0, 1,
-0.8998117, -0.2709801, -2.070098, 0.945098, 1, 0, 1,
-0.8963872, 0.6599175, 0.6426948, 0.9372549, 1, 0, 1,
-0.8904788, -3.018454, -4.385894, 0.9333333, 1, 0, 1,
-0.8887627, -0.4113007, -3.251793, 0.9254902, 1, 0, 1,
-0.8854678, -0.8520893, -3.226946, 0.9215686, 1, 0, 1,
-0.8854492, 0.05530718, -0.6849256, 0.9137255, 1, 0, 1,
-0.8832844, -0.3485019, -0.4673913, 0.9098039, 1, 0, 1,
-0.8828825, -1.362119, -2.33891, 0.9019608, 1, 0, 1,
-0.8752832, 0.7575541, 0.03084138, 0.8941177, 1, 0, 1,
-0.8747895, -0.145659, -3.38331, 0.8901961, 1, 0, 1,
-0.8572918, -1.162676, -3.484221, 0.8823529, 1, 0, 1,
-0.8534545, 0.6389909, -2.089324, 0.8784314, 1, 0, 1,
-0.8528792, 0.7298242, 0.3115397, 0.8705882, 1, 0, 1,
-0.8455729, 0.8291897, 2.058605, 0.8666667, 1, 0, 1,
-0.8379231, 2.676584, 0.9097668, 0.8588235, 1, 0, 1,
-0.8372885, 1.256558, 1.469446, 0.854902, 1, 0, 1,
-0.8372869, 0.02353611, -2.054067, 0.8470588, 1, 0, 1,
-0.835246, -0.2171965, -1.904525, 0.8431373, 1, 0, 1,
-0.8274288, 0.8317243, 0.4611637, 0.8352941, 1, 0, 1,
-0.8260612, 0.1568762, -0.9208037, 0.8313726, 1, 0, 1,
-0.8259454, 0.9925225, -1.462682, 0.8235294, 1, 0, 1,
-0.8249291, -0.6828276, -1.232222, 0.8196079, 1, 0, 1,
-0.8239807, 0.9464792, -0.5525471, 0.8117647, 1, 0, 1,
-0.8228961, -0.9910092, -2.113765, 0.8078431, 1, 0, 1,
-0.8218128, -0.5607482, -2.135753, 0.8, 1, 0, 1,
-0.8181207, 0.9583842, -1.447915, 0.7921569, 1, 0, 1,
-0.8162794, -0.2597101, -2.789862, 0.7882353, 1, 0, 1,
-0.8034669, 1.542572, -0.576514, 0.7803922, 1, 0, 1,
-0.8001359, 0.7895131, 0.6750063, 0.7764706, 1, 0, 1,
-0.7985293, 0.5018197, -1.503349, 0.7686275, 1, 0, 1,
-0.7893903, -0.1459784, -1.465879, 0.7647059, 1, 0, 1,
-0.786418, 1.409113, 0.3272861, 0.7568628, 1, 0, 1,
-0.7805277, -1.336993, -1.098359, 0.7529412, 1, 0, 1,
-0.7721662, 0.5651658, -1.745105, 0.7450981, 1, 0, 1,
-0.7695113, -0.1199864, -3.365093, 0.7411765, 1, 0, 1,
-0.7673082, -0.7445109, -1.066456, 0.7333333, 1, 0, 1,
-0.7638479, -1.507218, -2.035517, 0.7294118, 1, 0, 1,
-0.762971, 2.530549, -0.8117833, 0.7215686, 1, 0, 1,
-0.7609738, 0.08075441, -0.9417716, 0.7176471, 1, 0, 1,
-0.7567229, 1.468078, -1.783196, 0.7098039, 1, 0, 1,
-0.7551739, 0.4445648, -1.431612, 0.7058824, 1, 0, 1,
-0.7547488, 0.316757, -2.64565, 0.6980392, 1, 0, 1,
-0.749871, 0.7974177, -0.05681387, 0.6901961, 1, 0, 1,
-0.7498168, 1.383836, -2.160418, 0.6862745, 1, 0, 1,
-0.7466007, 0.09072246, -0.2220034, 0.6784314, 1, 0, 1,
-0.7432784, 1.740561, 0.6813503, 0.6745098, 1, 0, 1,
-0.7400959, 0.9825081, -1.319356, 0.6666667, 1, 0, 1,
-0.7377034, 2.295018, -0.5428376, 0.6627451, 1, 0, 1,
-0.7367846, 0.7163786, -1.068058, 0.654902, 1, 0, 1,
-0.7289989, -0.4113761, -3.471434, 0.6509804, 1, 0, 1,
-0.7283334, 0.6338122, -1.703504, 0.6431373, 1, 0, 1,
-0.720637, -1.362459, -1.606499, 0.6392157, 1, 0, 1,
-0.719707, 1.103251, -0.2627267, 0.6313726, 1, 0, 1,
-0.7195274, -1.153919, -3.441044, 0.627451, 1, 0, 1,
-0.7183047, -2.285788, -3.098728, 0.6196079, 1, 0, 1,
-0.7163688, -2.248406, -3.252393, 0.6156863, 1, 0, 1,
-0.7113084, 0.6030781, -0.02531418, 0.6078432, 1, 0, 1,
-0.7097653, -2.40484, -3.269498, 0.6039216, 1, 0, 1,
-0.7053029, 1.636948, -1.057195, 0.5960785, 1, 0, 1,
-0.7014003, -1.085074, -3.267039, 0.5882353, 1, 0, 1,
-0.6998838, -0.4008779, -1.740635, 0.5843138, 1, 0, 1,
-0.6969166, 1.162255, -0.5020441, 0.5764706, 1, 0, 1,
-0.6901416, 0.366267, -0.5522991, 0.572549, 1, 0, 1,
-0.6799816, -0.7902033, -0.492898, 0.5647059, 1, 0, 1,
-0.6795941, -0.957882, -2.382038, 0.5607843, 1, 0, 1,
-0.6659698, -0.1008975, -3.459605, 0.5529412, 1, 0, 1,
-0.6628156, 0.7592189, -2.214044, 0.5490196, 1, 0, 1,
-0.65372, 0.01084533, -1.067903, 0.5411765, 1, 0, 1,
-0.6491889, -0.8714759, -3.052193, 0.5372549, 1, 0, 1,
-0.6467211, 1.886577, -2.083157, 0.5294118, 1, 0, 1,
-0.6421372, -0.4150164, -1.315281, 0.5254902, 1, 0, 1,
-0.6402965, 1.333243, -0.05109446, 0.5176471, 1, 0, 1,
-0.6395296, -0.3300414, -1.388884, 0.5137255, 1, 0, 1,
-0.6390516, 1.849041, 0.1678249, 0.5058824, 1, 0, 1,
-0.638711, 0.5835201, -0.5939837, 0.5019608, 1, 0, 1,
-0.6373529, -0.2554141, -1.168592, 0.4941176, 1, 0, 1,
-0.6371394, 2.358374, -0.2602069, 0.4862745, 1, 0, 1,
-0.6328027, 0.9242291, 0.6141853, 0.4823529, 1, 0, 1,
-0.6317118, -1.372829, -2.941612, 0.4745098, 1, 0, 1,
-0.6290346, -0.6463908, -2.146559, 0.4705882, 1, 0, 1,
-0.6244503, -0.4674597, -2.485078, 0.4627451, 1, 0, 1,
-0.6200315, -0.5859689, -2.416427, 0.4588235, 1, 0, 1,
-0.6156185, 0.3988844, -0.04772656, 0.4509804, 1, 0, 1,
-0.6112013, 0.3873681, -0.7245671, 0.4470588, 1, 0, 1,
-0.6090129, -1.549129, -3.62622, 0.4392157, 1, 0, 1,
-0.6089967, 1.117761, -0.1788742, 0.4352941, 1, 0, 1,
-0.6048778, 0.4888065, 0.546142, 0.427451, 1, 0, 1,
-0.6045105, -0.01006146, -0.5526857, 0.4235294, 1, 0, 1,
-0.6032996, -0.7285749, -2.009523, 0.4156863, 1, 0, 1,
-0.6017025, 1.032209, 0.4503055, 0.4117647, 1, 0, 1,
-0.5921274, 0.4087682, -0.2370107, 0.4039216, 1, 0, 1,
-0.5910557, -0.7546152, -1.751063, 0.3960784, 1, 0, 1,
-0.5797375, -0.3913402, -2.165427, 0.3921569, 1, 0, 1,
-0.5778237, -0.7167473, -3.088219, 0.3843137, 1, 0, 1,
-0.5758551, 2.134907, -1.354244, 0.3803922, 1, 0, 1,
-0.5718653, 1.39434, -0.5609644, 0.372549, 1, 0, 1,
-0.5689654, 0.2588847, -1.421851, 0.3686275, 1, 0, 1,
-0.5688626, -0.371491, -2.030765, 0.3607843, 1, 0, 1,
-0.5684582, 1.119512, -1.148016, 0.3568628, 1, 0, 1,
-0.5668607, 0.7418223, 0.1346111, 0.3490196, 1, 0, 1,
-0.5648178, -2.351267, -2.919205, 0.345098, 1, 0, 1,
-0.5636828, 0.1067363, -0.1284993, 0.3372549, 1, 0, 1,
-0.5634756, 0.5371125, -0.4726603, 0.3333333, 1, 0, 1,
-0.5621481, 0.1568632, -2.163644, 0.3254902, 1, 0, 1,
-0.5620785, 0.7707558, -1.478293, 0.3215686, 1, 0, 1,
-0.5585801, -1.016639, -3.910776, 0.3137255, 1, 0, 1,
-0.5560166, 0.4349746, -0.8829805, 0.3098039, 1, 0, 1,
-0.5533506, -0.05788856, -2.097642, 0.3019608, 1, 0, 1,
-0.5503216, 0.2833752, -2.038563, 0.2941177, 1, 0, 1,
-0.5480134, -1.456007, -1.871696, 0.2901961, 1, 0, 1,
-0.5399538, 0.3813933, 0.8573644, 0.282353, 1, 0, 1,
-0.5328351, 0.2048609, -2.690647, 0.2784314, 1, 0, 1,
-0.5323696, 0.07889578, -0.9633552, 0.2705882, 1, 0, 1,
-0.5322872, -0.06051585, -1.290191, 0.2666667, 1, 0, 1,
-0.5295451, 0.8534695, -0.1969816, 0.2588235, 1, 0, 1,
-0.5155005, 2.412859, 1.527735, 0.254902, 1, 0, 1,
-0.508731, 0.1479594, -0.7632628, 0.2470588, 1, 0, 1,
-0.5060492, -1.301683, -2.445986, 0.2431373, 1, 0, 1,
-0.5043032, -0.0542007, -2.622512, 0.2352941, 1, 0, 1,
-0.5037274, -0.1188568, -2.27483, 0.2313726, 1, 0, 1,
-0.5032132, -0.1800599, -3.911881, 0.2235294, 1, 0, 1,
-0.4968733, 1.028893, 1.298598, 0.2196078, 1, 0, 1,
-0.4935499, 0.4428347, -0.6652399, 0.2117647, 1, 0, 1,
-0.4920225, 0.4973273, -0.9421657, 0.2078431, 1, 0, 1,
-0.4903866, 0.09798487, -1.038031, 0.2, 1, 0, 1,
-0.4880432, -1.11368, -1.97036, 0.1921569, 1, 0, 1,
-0.4878781, 0.2851243, -0.01153375, 0.1882353, 1, 0, 1,
-0.4810547, -1.475253, -3.70898, 0.1803922, 1, 0, 1,
-0.4799268, 1.332445, 0.3968774, 0.1764706, 1, 0, 1,
-0.4795327, -0.322796, -2.299013, 0.1686275, 1, 0, 1,
-0.4740955, 0.2091297, -2.065861, 0.1647059, 1, 0, 1,
-0.472418, -0.1378993, -2.178065, 0.1568628, 1, 0, 1,
-0.4705667, 0.7828078, -1.356903, 0.1529412, 1, 0, 1,
-0.4700031, -1.164219, -1.112688, 0.145098, 1, 0, 1,
-0.4694912, -1.023183, -2.472713, 0.1411765, 1, 0, 1,
-0.4678048, -0.5198475, -1.857446, 0.1333333, 1, 0, 1,
-0.4657413, 0.8865861, -0.03384452, 0.1294118, 1, 0, 1,
-0.4650906, -1.041919, -2.139383, 0.1215686, 1, 0, 1,
-0.4592135, 0.1554173, -0.1839977, 0.1176471, 1, 0, 1,
-0.4567391, 0.7601984, -1.358091, 0.1098039, 1, 0, 1,
-0.4468545, 0.4411577, -1.201668, 0.1058824, 1, 0, 1,
-0.4468012, 0.6216089, -1.793866, 0.09803922, 1, 0, 1,
-0.4467821, 2.00371, -0.6066314, 0.09019608, 1, 0, 1,
-0.4467052, -0.8623321, -0.9943255, 0.08627451, 1, 0, 1,
-0.4451962, 0.1235615, -2.04328, 0.07843138, 1, 0, 1,
-0.4439715, 0.1475319, -0.8977945, 0.07450981, 1, 0, 1,
-0.4436371, -0.5708681, -2.824621, 0.06666667, 1, 0, 1,
-0.4425447, 0.5599676, -1.196799, 0.0627451, 1, 0, 1,
-0.440329, -1.182871, -2.347776, 0.05490196, 1, 0, 1,
-0.4397709, -0.7955295, -3.019655, 0.05098039, 1, 0, 1,
-0.4382824, -0.03141218, -2.719656, 0.04313726, 1, 0, 1,
-0.434751, -2.01406, -3.851238, 0.03921569, 1, 0, 1,
-0.4324656, -0.1664256, -2.245362, 0.03137255, 1, 0, 1,
-0.4314899, 1.917246, -1.349048, 0.02745098, 1, 0, 1,
-0.4308855, -0.398756, 0.3501278, 0.01960784, 1, 0, 1,
-0.4302342, -0.8464025, -2.589833, 0.01568628, 1, 0, 1,
-0.4224724, -0.2754224, -1.051813, 0.007843138, 1, 0, 1,
-0.4219369, -1.483824, -2.614532, 0.003921569, 1, 0, 1,
-0.4213152, 0.5007012, -1.691137, 0, 1, 0.003921569, 1,
-0.419461, -0.1489866, -0.492509, 0, 1, 0.01176471, 1,
-0.4187401, -0.4333255, -2.573365, 0, 1, 0.01568628, 1,
-0.416707, -0.3199531, -3.196971, 0, 1, 0.02352941, 1,
-0.4121265, -2.22221, -3.537606, 0, 1, 0.02745098, 1,
-0.4096326, -0.5695504, -3.446699, 0, 1, 0.03529412, 1,
-0.4087211, -0.4518845, -3.312317, 0, 1, 0.03921569, 1,
-0.4048272, 0.3370265, -1.75877, 0, 1, 0.04705882, 1,
-0.4012267, -1.521584, -2.526177, 0, 1, 0.05098039, 1,
-0.4003705, 0.1594494, -1.059245, 0, 1, 0.05882353, 1,
-0.4001983, 0.7279969, -1.444244, 0, 1, 0.0627451, 1,
-0.3978858, -2.294114, -3.245417, 0, 1, 0.07058824, 1,
-0.3900306, -1.186517, -2.298816, 0, 1, 0.07450981, 1,
-0.3892248, 1.428147, -0.3839189, 0, 1, 0.08235294, 1,
-0.388939, 0.7277502, -1.903313, 0, 1, 0.08627451, 1,
-0.3875392, -0.5886055, -2.773226, 0, 1, 0.09411765, 1,
-0.3851042, 1.01064, -0.2854088, 0, 1, 0.1019608, 1,
-0.3841838, -0.5455511, -1.992023, 0, 1, 0.1058824, 1,
-0.3820323, 0.09195953, -2.186452, 0, 1, 0.1137255, 1,
-0.3751918, -0.06465403, -3.60495, 0, 1, 0.1176471, 1,
-0.3741174, -0.2313946, -2.82052, 0, 1, 0.1254902, 1,
-0.3670759, 0.6988367, -0.1080732, 0, 1, 0.1294118, 1,
-0.3666033, -1.622304, -2.96107, 0, 1, 0.1372549, 1,
-0.3651715, 1.089451, -0.8719038, 0, 1, 0.1411765, 1,
-0.36488, 0.9380481, -0.3889112, 0, 1, 0.1490196, 1,
-0.362098, 0.57291, -2.01336, 0, 1, 0.1529412, 1,
-0.3619846, -0.08361042, -0.4553817, 0, 1, 0.1607843, 1,
-0.3606658, 0.1667096, -2.121886, 0, 1, 0.1647059, 1,
-0.3515885, 0.1858224, -1.812142, 0, 1, 0.172549, 1,
-0.3515667, -0.7128286, -1.414025, 0, 1, 0.1764706, 1,
-0.3503233, -0.1249526, -2.868162, 0, 1, 0.1843137, 1,
-0.3494675, 0.0303756, -1.706141, 0, 1, 0.1882353, 1,
-0.3494542, -0.02092002, -1.285467, 0, 1, 0.1960784, 1,
-0.3479022, -1.081505, -2.547678, 0, 1, 0.2039216, 1,
-0.3474241, -1.302958, -2.851691, 0, 1, 0.2078431, 1,
-0.3457776, -1.890658, -3.374055, 0, 1, 0.2156863, 1,
-0.3431822, -1.52409, -4.789053, 0, 1, 0.2196078, 1,
-0.3430089, 0.4469836, -0.5335191, 0, 1, 0.227451, 1,
-0.342822, 1.140538, 0.6659532, 0, 1, 0.2313726, 1,
-0.3416975, 0.6732599, 0.03452322, 0, 1, 0.2392157, 1,
-0.3415492, 0.3010292, -1.548519, 0, 1, 0.2431373, 1,
-0.3413668, 0.377397, -1.287366, 0, 1, 0.2509804, 1,
-0.3412284, -1.057545, -3.355715, 0, 1, 0.254902, 1,
-0.3394491, -1.519719, -2.461177, 0, 1, 0.2627451, 1,
-0.3359948, 1.039467, 2.011468, 0, 1, 0.2666667, 1,
-0.3345701, 0.5558878, -0.8789443, 0, 1, 0.2745098, 1,
-0.3257893, 0.8198748, -0.04159058, 0, 1, 0.2784314, 1,
-0.3255869, -0.8422968, -1.910429, 0, 1, 0.2862745, 1,
-0.321935, 1.961217, -0.7256095, 0, 1, 0.2901961, 1,
-0.3174058, -1.173306, -2.040108, 0, 1, 0.2980392, 1,
-0.3083887, 0.3434188, 0.6321476, 0, 1, 0.3058824, 1,
-0.3074843, 1.043201, -2.204704, 0, 1, 0.3098039, 1,
-0.3027777, 0.7497627, 0.110928, 0, 1, 0.3176471, 1,
-0.3025328, 0.1357901, -0.3064888, 0, 1, 0.3215686, 1,
-0.3018901, 0.1929982, -1.831558, 0, 1, 0.3294118, 1,
-0.3017057, -0.4347821, -1.495288, 0, 1, 0.3333333, 1,
-0.301498, -0.3042502, -1.729541, 0, 1, 0.3411765, 1,
-0.3000291, 0.8225414, -0.5762774, 0, 1, 0.345098, 1,
-0.299013, -1.008872, -2.85127, 0, 1, 0.3529412, 1,
-0.2903838, -0.4120973, -1.673315, 0, 1, 0.3568628, 1,
-0.2899762, 0.5245232, -1.266417, 0, 1, 0.3647059, 1,
-0.2889729, 0.3889425, -0.4608652, 0, 1, 0.3686275, 1,
-0.2887237, -0.1483947, -1.396651, 0, 1, 0.3764706, 1,
-0.2857777, 0.7037236, -0.4593636, 0, 1, 0.3803922, 1,
-0.2848453, -0.6541296, -5.640109, 0, 1, 0.3882353, 1,
-0.2830575, -1.327682, -1.855762, 0, 1, 0.3921569, 1,
-0.2754999, 1.657923, 0.817643, 0, 1, 0.4, 1,
-0.2735706, 0.4314018, -0.01970223, 0, 1, 0.4078431, 1,
-0.272287, -0.7699325, -2.742995, 0, 1, 0.4117647, 1,
-0.2720308, 1.186056, -1.995802, 0, 1, 0.4196078, 1,
-0.2671925, 0.3403853, -0.08573524, 0, 1, 0.4235294, 1,
-0.26611, -0.3856622, -0.9111739, 0, 1, 0.4313726, 1,
-0.2657249, -0.7718586, -3.140885, 0, 1, 0.4352941, 1,
-0.263978, -1.170097, -4.088388, 0, 1, 0.4431373, 1,
-0.2628798, -0.4051113, -2.962179, 0, 1, 0.4470588, 1,
-0.2610039, -0.2991865, -4.484888, 0, 1, 0.454902, 1,
-0.2568808, -2.342001, -3.130204, 0, 1, 0.4588235, 1,
-0.2555192, 0.3245752, 1.172986, 0, 1, 0.4666667, 1,
-0.249906, 0.1917607, -1.380185, 0, 1, 0.4705882, 1,
-0.2464674, 0.02078638, -0.9959789, 0, 1, 0.4784314, 1,
-0.2455191, 0.529778, -1.197671, 0, 1, 0.4823529, 1,
-0.2448784, -0.6323044, -3.570532, 0, 1, 0.4901961, 1,
-0.2424356, 1.065434, 0.3136143, 0, 1, 0.4941176, 1,
-0.2409166, 1.73352, 0.4624326, 0, 1, 0.5019608, 1,
-0.2388513, -1.928754, -3.673878, 0, 1, 0.509804, 1,
-0.2366099, -0.9819546, -4.217606, 0, 1, 0.5137255, 1,
-0.2292323, -1.157699, -3.237577, 0, 1, 0.5215687, 1,
-0.2289312, 0.9462816, -1.32552, 0, 1, 0.5254902, 1,
-0.2249312, 2.208174, -1.53024, 0, 1, 0.5333334, 1,
-0.22297, -0.6444257, -1.913415, 0, 1, 0.5372549, 1,
-0.2181216, 0.02904926, -1.163597, 0, 1, 0.5450981, 1,
-0.2177614, 0.9264495, -0.20969, 0, 1, 0.5490196, 1,
-0.210931, 1.141537, 1.273651, 0, 1, 0.5568628, 1,
-0.2103046, 1.405809, -0.1408683, 0, 1, 0.5607843, 1,
-0.2097295, 0.723195, 1.086653, 0, 1, 0.5686275, 1,
-0.2085082, -1.24504, -2.197272, 0, 1, 0.572549, 1,
-0.1999677, -1.120664, -2.05066, 0, 1, 0.5803922, 1,
-0.1997806, 0.3554285, -0.8413634, 0, 1, 0.5843138, 1,
-0.1899057, 0.6930076, 0.606396, 0, 1, 0.5921569, 1,
-0.1863208, 0.9468961, -0.1910145, 0, 1, 0.5960785, 1,
-0.1828453, -0.2746003, -4.713387, 0, 1, 0.6039216, 1,
-0.1805556, -1.234407, -2.117796, 0, 1, 0.6117647, 1,
-0.1761179, 0.07977816, -0.3793149, 0, 1, 0.6156863, 1,
-0.1683862, 1.866904, -0.5451714, 0, 1, 0.6235294, 1,
-0.1602956, -0.3791279, -2.401443, 0, 1, 0.627451, 1,
-0.1572405, 0.9047431, -1.115523, 0, 1, 0.6352941, 1,
-0.1558144, -1.479574, -3.239906, 0, 1, 0.6392157, 1,
-0.1545741, 1.326949, -0.2261442, 0, 1, 0.6470588, 1,
-0.1471296, 1.66663, 0.3188514, 0, 1, 0.6509804, 1,
-0.1440453, -1.356085, -1.755609, 0, 1, 0.6588235, 1,
-0.1416887, 0.2257192, -0.4791578, 0, 1, 0.6627451, 1,
-0.1373783, 2.322742, -1.196104, 0, 1, 0.6705883, 1,
-0.1346117, 1.551983, -1.085396, 0, 1, 0.6745098, 1,
-0.1329558, 0.9213259, 0.06441753, 0, 1, 0.682353, 1,
-0.132061, -2.745051, -2.753706, 0, 1, 0.6862745, 1,
-0.1302467, 0.9155009, -0.6636025, 0, 1, 0.6941177, 1,
-0.1278685, -0.5741588, -0.4632869, 0, 1, 0.7019608, 1,
-0.1220409, 0.08906338, 0.3712018, 0, 1, 0.7058824, 1,
-0.1187454, -0.1296996, 0.04127204, 0, 1, 0.7137255, 1,
-0.1171751, 0.4692445, -1.303666, 0, 1, 0.7176471, 1,
-0.1167011, 1.404738, 0.9291792, 0, 1, 0.7254902, 1,
-0.1120693, 0.1765765, 1.611045, 0, 1, 0.7294118, 1,
-0.1113752, -0.9295216, -4.578462, 0, 1, 0.7372549, 1,
-0.1066481, -1.017083, -3.907738, 0, 1, 0.7411765, 1,
-0.1060054, -0.9275692, -4.843714, 0, 1, 0.7490196, 1,
-0.1043304, -0.1069259, -1.128856, 0, 1, 0.7529412, 1,
-0.1006709, -0.243528, -3.795268, 0, 1, 0.7607843, 1,
-0.0967825, -1.954403, -3.634144, 0, 1, 0.7647059, 1,
-0.09344035, 3.035857, 1.096323, 0, 1, 0.772549, 1,
-0.09099098, -1.091576, -4.252625, 0, 1, 0.7764706, 1,
-0.09036241, -0.7716318, -2.337882, 0, 1, 0.7843137, 1,
-0.08566853, -0.6609488, -4.846049, 0, 1, 0.7882353, 1,
-0.07978781, -0.2350218, -5.256658, 0, 1, 0.7960784, 1,
-0.07839353, 0.5674459, 0.5247416, 0, 1, 0.8039216, 1,
-0.07639582, 0.4273604, -2.736396, 0, 1, 0.8078431, 1,
-0.07433464, -0.7235656, -3.708279, 0, 1, 0.8156863, 1,
-0.07255979, -0.4029159, -3.26874, 0, 1, 0.8196079, 1,
-0.07218815, 0.312903, 0.5336291, 0, 1, 0.827451, 1,
-0.07210332, -0.4068092, -1.312031, 0, 1, 0.8313726, 1,
-0.06930579, -0.8533709, -2.237461, 0, 1, 0.8392157, 1,
-0.06896012, 0.1424949, -1.446544, 0, 1, 0.8431373, 1,
-0.06828395, -0.6960682, -2.992761, 0, 1, 0.8509804, 1,
-0.06696769, -1.880456, -2.295878, 0, 1, 0.854902, 1,
-0.06319147, -1.543342, -2.619996, 0, 1, 0.8627451, 1,
-0.0606912, -1.468985, -3.179826, 0, 1, 0.8666667, 1,
-0.06027097, 1.530175, 2.387086, 0, 1, 0.8745098, 1,
-0.05766733, 1.67837, 0.05110711, 0, 1, 0.8784314, 1,
-0.05733752, -0.4619784, -3.060685, 0, 1, 0.8862745, 1,
-0.0561468, -0.4093292, -1.664359, 0, 1, 0.8901961, 1,
-0.05589437, 0.9753523, -0.6473885, 0, 1, 0.8980392, 1,
-0.05164595, -0.7511773, -4.219093, 0, 1, 0.9058824, 1,
-0.04519346, 0.1117659, 0.366497, 0, 1, 0.9098039, 1,
-0.0424348, -0.04904221, -1.363155, 0, 1, 0.9176471, 1,
-0.03873387, -0.8069027, -2.316939, 0, 1, 0.9215686, 1,
-0.03739644, 0.101913, 0.1144128, 0, 1, 0.9294118, 1,
-0.03712257, 0.5997686, -0.5823255, 0, 1, 0.9333333, 1,
-0.035369, -1.314281, -4.159528, 0, 1, 0.9411765, 1,
-0.03533641, 0.05367297, -1.192488, 0, 1, 0.945098, 1,
-0.03465611, -0.3656037, -2.35141, 0, 1, 0.9529412, 1,
-0.03417459, -1.268011, -3.048613, 0, 1, 0.9568627, 1,
-0.03026844, 0.01245788, -1.352955, 0, 1, 0.9647059, 1,
-0.02457651, 0.5318984, -0.871565, 0, 1, 0.9686275, 1,
-0.02015663, 0.04086713, -1.434642, 0, 1, 0.9764706, 1,
-0.01690576, -0.4955821, -5.481495, 0, 1, 0.9803922, 1,
-0.01456438, -0.5028379, -4.531643, 0, 1, 0.9882353, 1,
-0.01190424, -0.1599805, -2.234801, 0, 1, 0.9921569, 1,
-0.007879561, -0.34329, -4.326327, 0, 1, 1, 1,
-0.003502254, 0.3835309, 2.421227, 0, 0.9921569, 1, 1,
0.0006311679, -1.200324, 3.867463, 0, 0.9882353, 1, 1,
0.003549391, 0.5911092, 0.9650554, 0, 0.9803922, 1, 1,
0.005502014, -1.002526, 1.335008, 0, 0.9764706, 1, 1,
0.005526813, -0.311489, 2.764889, 0, 0.9686275, 1, 1,
0.007910755, 0.4796607, -1.485587, 0, 0.9647059, 1, 1,
0.008733807, -0.9624199, 3.525311, 0, 0.9568627, 1, 1,
0.009530344, -0.8530138, 2.972996, 0, 0.9529412, 1, 1,
0.009965529, -1.921734, 2.184458, 0, 0.945098, 1, 1,
0.01101919, -0.06563415, 1.946107, 0, 0.9411765, 1, 1,
0.01299666, -1.819483, 2.881598, 0, 0.9333333, 1, 1,
0.01302287, 0.5156806, 2.935048, 0, 0.9294118, 1, 1,
0.01422781, -0.04656118, 4.18688, 0, 0.9215686, 1, 1,
0.01835466, 0.1948681, 0.4971396, 0, 0.9176471, 1, 1,
0.0186491, 1.733689, -2.521591, 0, 0.9098039, 1, 1,
0.02016581, 0.01363501, 1.224819, 0, 0.9058824, 1, 1,
0.02142863, 0.2459481, -1.161404, 0, 0.8980392, 1, 1,
0.02460513, 0.3318725, 0.1712511, 0, 0.8901961, 1, 1,
0.02467484, 0.5704781, 2.341192, 0, 0.8862745, 1, 1,
0.02568095, -0.4727862, 2.992943, 0, 0.8784314, 1, 1,
0.02852504, 1.392688, 0.3408329, 0, 0.8745098, 1, 1,
0.03163875, -0.5818245, 1.327994, 0, 0.8666667, 1, 1,
0.03330084, 0.4151185, -0.5725899, 0, 0.8627451, 1, 1,
0.03446535, 0.2038255, -0.4894927, 0, 0.854902, 1, 1,
0.0373515, -0.4352228, 3.694777, 0, 0.8509804, 1, 1,
0.04099374, 0.1918973, 0.5485535, 0, 0.8431373, 1, 1,
0.04106111, -0.6062514, 4.130139, 0, 0.8392157, 1, 1,
0.04186676, 0.6241531, -1.970602, 0, 0.8313726, 1, 1,
0.0446719, -0.7576974, 3.392695, 0, 0.827451, 1, 1,
0.0453421, -0.5609094, 4.009449, 0, 0.8196079, 1, 1,
0.05020978, 1.55938, 0.763412, 0, 0.8156863, 1, 1,
0.05872715, -0.5819629, 2.652101, 0, 0.8078431, 1, 1,
0.06272272, -0.3280038, 3.199594, 0, 0.8039216, 1, 1,
0.06292077, -1.407871, 2.75283, 0, 0.7960784, 1, 1,
0.06479188, 0.44864, -1.013191, 0, 0.7882353, 1, 1,
0.07114302, 2.341308, 2.183141, 0, 0.7843137, 1, 1,
0.08284795, -0.1760623, 3.463545, 0, 0.7764706, 1, 1,
0.09041678, -0.25709, 4.174759, 0, 0.772549, 1, 1,
0.09551328, 0.3231192, 1.464354, 0, 0.7647059, 1, 1,
0.09923212, -0.1761412, 2.909235, 0, 0.7607843, 1, 1,
0.1004605, -0.7102792, 3.813823, 0, 0.7529412, 1, 1,
0.1078093, -0.2508289, 2.848937, 0, 0.7490196, 1, 1,
0.1125759, 0.4907012, 1.468964, 0, 0.7411765, 1, 1,
0.1142675, 1.290352, 0.315928, 0, 0.7372549, 1, 1,
0.1157593, 0.08789693, 1.154696, 0, 0.7294118, 1, 1,
0.1237184, -0.6080973, 0.6467966, 0, 0.7254902, 1, 1,
0.1323213, 0.7741537, 1.519496, 0, 0.7176471, 1, 1,
0.1331946, -0.7417525, 2.784052, 0, 0.7137255, 1, 1,
0.1338683, -0.3578237, 0.2516339, 0, 0.7058824, 1, 1,
0.1391879, -0.5608743, 2.300145, 0, 0.6980392, 1, 1,
0.1413355, -0.8388903, 3.780047, 0, 0.6941177, 1, 1,
0.1419758, -0.05821691, 2.708513, 0, 0.6862745, 1, 1,
0.1431955, 0.5279663, -0.772344, 0, 0.682353, 1, 1,
0.1474144, 1.744828, 1.834846, 0, 0.6745098, 1, 1,
0.1543979, -0.9960356, 2.54458, 0, 0.6705883, 1, 1,
0.1550012, 0.4489017, 1.390602, 0, 0.6627451, 1, 1,
0.1575115, 0.8116544, 1.140488, 0, 0.6588235, 1, 1,
0.1642016, 0.6435654, 1.174569, 0, 0.6509804, 1, 1,
0.1654206, 0.1909665, 0.4371141, 0, 0.6470588, 1, 1,
0.1675905, 1.419819, -0.7460942, 0, 0.6392157, 1, 1,
0.1730193, -0.7114683, 1.392844, 0, 0.6352941, 1, 1,
0.1735421, -1.357114, 2.679179, 0, 0.627451, 1, 1,
0.1779511, -0.3080485, 1.876603, 0, 0.6235294, 1, 1,
0.1783758, 0.6269217, 0.08325519, 0, 0.6156863, 1, 1,
0.1804407, 0.3904884, 1.151665, 0, 0.6117647, 1, 1,
0.1843532, 1.860201, -1.660522, 0, 0.6039216, 1, 1,
0.1855934, -0.1568581, 0.9312342, 0, 0.5960785, 1, 1,
0.1856848, -2.017748, 3.149662, 0, 0.5921569, 1, 1,
0.1900821, 1.113762, 0.130119, 0, 0.5843138, 1, 1,
0.1901224, -0.7600533, 2.083946, 0, 0.5803922, 1, 1,
0.1933956, 1.748959, 0.7540414, 0, 0.572549, 1, 1,
0.1938857, 1.541551, -0.5182702, 0, 0.5686275, 1, 1,
0.1953357, 0.01630144, 1.773044, 0, 0.5607843, 1, 1,
0.1987002, 0.5952231, 0.4738721, 0, 0.5568628, 1, 1,
0.1992913, 0.5460176, -0.4333119, 0, 0.5490196, 1, 1,
0.2016673, 1.023245, -0.4837686, 0, 0.5450981, 1, 1,
0.203517, 1.562288, -0.527217, 0, 0.5372549, 1, 1,
0.2044121, 1.163945, 2.699726, 0, 0.5333334, 1, 1,
0.2053369, 2.33637, -0.07466189, 0, 0.5254902, 1, 1,
0.2068191, 0.3476741, -0.1735583, 0, 0.5215687, 1, 1,
0.2079477, -1.081967, 2.549227, 0, 0.5137255, 1, 1,
0.2084557, 0.4993773, 1.437891, 0, 0.509804, 1, 1,
0.210031, -0.9271912, 2.931225, 0, 0.5019608, 1, 1,
0.2122076, 0.8028392, -2.049969, 0, 0.4941176, 1, 1,
0.2178499, 0.4097942, 2.609242, 0, 0.4901961, 1, 1,
0.2241444, -1.080674, 2.45726, 0, 0.4823529, 1, 1,
0.2271329, 0.006220678, 1.6741, 0, 0.4784314, 1, 1,
0.2274266, -0.2902263, 2.28515, 0, 0.4705882, 1, 1,
0.2315748, 1.424495, 0.766901, 0, 0.4666667, 1, 1,
0.2369966, 0.5137882, -0.8311267, 0, 0.4588235, 1, 1,
0.2423565, -0.4850235, 4.043845, 0, 0.454902, 1, 1,
0.2424843, -0.928394, 3.109711, 0, 0.4470588, 1, 1,
0.2507086, 0.754108, 2.267745, 0, 0.4431373, 1, 1,
0.2520805, 0.406825, 0.03207784, 0, 0.4352941, 1, 1,
0.2555837, 0.9885262, 0.4691068, 0, 0.4313726, 1, 1,
0.2567356, -0.3451953, 0.879879, 0, 0.4235294, 1, 1,
0.2611403, -1.005518, 4.504135, 0, 0.4196078, 1, 1,
0.2612961, 0.09064324, 0.535892, 0, 0.4117647, 1, 1,
0.2675788, -0.5131556, 3.667073, 0, 0.4078431, 1, 1,
0.2694488, -0.9445672, 2.779341, 0, 0.4, 1, 1,
0.2695628, -0.3599153, 0.9169594, 0, 0.3921569, 1, 1,
0.2697882, -0.4898424, 2.101611, 0, 0.3882353, 1, 1,
0.2756731, -1.077285, 1.957907, 0, 0.3803922, 1, 1,
0.2787122, 0.3978631, 1.189345, 0, 0.3764706, 1, 1,
0.2804336, -1.332002, 3.321929, 0, 0.3686275, 1, 1,
0.2822207, 0.05586409, 2.180067, 0, 0.3647059, 1, 1,
0.2838031, -0.4275385, 1.462432, 0, 0.3568628, 1, 1,
0.2920242, 0.0172184, 1.373822, 0, 0.3529412, 1, 1,
0.2973174, 0.3841601, -0.8450634, 0, 0.345098, 1, 1,
0.2986529, -0.9721487, 2.161995, 0, 0.3411765, 1, 1,
0.3003062, -1.445884, 2.939446, 0, 0.3333333, 1, 1,
0.3006417, -1.693467, 2.444423, 0, 0.3294118, 1, 1,
0.3063039, 1.885375, 1.695569, 0, 0.3215686, 1, 1,
0.3126091, -0.2806293, 1.307393, 0, 0.3176471, 1, 1,
0.3162013, -1.801494, 2.362069, 0, 0.3098039, 1, 1,
0.3202181, -1.467601, 2.484535, 0, 0.3058824, 1, 1,
0.3206657, -0.3865926, 2.35844, 0, 0.2980392, 1, 1,
0.3230307, -1.105963, 1.565427, 0, 0.2901961, 1, 1,
0.3320814, 0.2042883, 2.631835, 0, 0.2862745, 1, 1,
0.3367538, 1.069521, 0.04745267, 0, 0.2784314, 1, 1,
0.3469188, 1.413382, -0.3466747, 0, 0.2745098, 1, 1,
0.3491537, 0.3863682, 0.5852449, 0, 0.2666667, 1, 1,
0.350418, -0.505016, 3.280072, 0, 0.2627451, 1, 1,
0.3513052, -1.294584, 2.712119, 0, 0.254902, 1, 1,
0.3529708, -0.8631727, 4.770039, 0, 0.2509804, 1, 1,
0.3563317, -1.482788, 3.086511, 0, 0.2431373, 1, 1,
0.3632942, 0.04310462, 1.205304, 0, 0.2392157, 1, 1,
0.3649275, 1.902975, -0.8489417, 0, 0.2313726, 1, 1,
0.3650679, 1.030613, -0.5619642, 0, 0.227451, 1, 1,
0.3652548, 0.5494703, 1.110114, 0, 0.2196078, 1, 1,
0.3696992, -1.441236, 2.12726, 0, 0.2156863, 1, 1,
0.370112, -2.004195, 3.164215, 0, 0.2078431, 1, 1,
0.3702208, 0.4778189, 1.678518, 0, 0.2039216, 1, 1,
0.3733281, 1.49812, -0.5885912, 0, 0.1960784, 1, 1,
0.3757133, 0.1375614, 1.815885, 0, 0.1882353, 1, 1,
0.3768543, -2.490921, 3.840176, 0, 0.1843137, 1, 1,
0.3785499, -0.3199449, 3.939089, 0, 0.1764706, 1, 1,
0.3788823, -1.062967, 2.132563, 0, 0.172549, 1, 1,
0.3807387, -1.558918, 2.281691, 0, 0.1647059, 1, 1,
0.3828806, -1.011891, 1.441682, 0, 0.1607843, 1, 1,
0.3839103, -0.01343138, 0.2840394, 0, 0.1529412, 1, 1,
0.3912449, 1.139155, 1.719373, 0, 0.1490196, 1, 1,
0.3948417, 0.7253187, 0.02996003, 0, 0.1411765, 1, 1,
0.4014156, 0.05788586, 2.600411, 0, 0.1372549, 1, 1,
0.4051057, -0.44262, 3.02811, 0, 0.1294118, 1, 1,
0.4063644, 0.06487348, 0.9673116, 0, 0.1254902, 1, 1,
0.4084563, 0.1200123, 1.092731, 0, 0.1176471, 1, 1,
0.408635, -0.3103018, 2.770522, 0, 0.1137255, 1, 1,
0.4090672, 1.67776, 0.0922676, 0, 0.1058824, 1, 1,
0.4193772, 0.9352192, 0.04555983, 0, 0.09803922, 1, 1,
0.4338113, -0.8083002, 2.090203, 0, 0.09411765, 1, 1,
0.4408365, -0.5816146, 1.802935, 0, 0.08627451, 1, 1,
0.440916, -0.3743082, 1.585335, 0, 0.08235294, 1, 1,
0.4423415, 0.3338473, -0.221231, 0, 0.07450981, 1, 1,
0.4464345, -0.3359255, 2.134016, 0, 0.07058824, 1, 1,
0.448082, -0.1980348, 2.121841, 0, 0.0627451, 1, 1,
0.4512306, 0.1314408, 1.247809, 0, 0.05882353, 1, 1,
0.4524314, 0.3566753, 2.593299, 0, 0.05098039, 1, 1,
0.4588282, -1.019241, 3.148381, 0, 0.04705882, 1, 1,
0.4617765, -0.1896479, 0.9176567, 0, 0.03921569, 1, 1,
0.464002, -1.619707, 3.534212, 0, 0.03529412, 1, 1,
0.4645555, 1.171754, 1.580241, 0, 0.02745098, 1, 1,
0.4696995, 0.1014157, 1.475159, 0, 0.02352941, 1, 1,
0.4703897, 1.716547, 1.156399, 0, 0.01568628, 1, 1,
0.4712684, -2.778364, 4.329746, 0, 0.01176471, 1, 1,
0.4723177, 0.535877, 0.4614273, 0, 0.003921569, 1, 1,
0.4727535, -0.6394565, 2.051104, 0.003921569, 0, 1, 1,
0.476562, -0.6725006, 2.559267, 0.007843138, 0, 1, 1,
0.4769485, 1.083186, -1.30047, 0.01568628, 0, 1, 1,
0.4782915, 0.2832434, -0.1146797, 0.01960784, 0, 1, 1,
0.4818273, 0.8913946, 0.596965, 0.02745098, 0, 1, 1,
0.4828692, 1.206579, 0.4498526, 0.03137255, 0, 1, 1,
0.4841463, -1.671181, 2.315478, 0.03921569, 0, 1, 1,
0.4863997, 0.003766548, 1.629368, 0.04313726, 0, 1, 1,
0.4880293, 0.8906365, 1.126726, 0.05098039, 0, 1, 1,
0.4882891, 0.4041049, 0.1804176, 0.05490196, 0, 1, 1,
0.4914389, -0.6213426, 2.076419, 0.0627451, 0, 1, 1,
0.4979673, 0.08296925, 1.908181, 0.06666667, 0, 1, 1,
0.4997071, -0.08957062, 1.532608, 0.07450981, 0, 1, 1,
0.5035785, -0.6397446, 2.264827, 0.07843138, 0, 1, 1,
0.5039779, -0.5986104, 1.948424, 0.08627451, 0, 1, 1,
0.5065786, 0.6570071, 2.786056, 0.09019608, 0, 1, 1,
0.5086134, 0.3028452, 2.393967, 0.09803922, 0, 1, 1,
0.5108093, -0.6694307, 2.752248, 0.1058824, 0, 1, 1,
0.5119593, -1.237694, 2.478888, 0.1098039, 0, 1, 1,
0.5128765, 0.3476773, 1.07133, 0.1176471, 0, 1, 1,
0.5149083, -0.9847863, 3.0788, 0.1215686, 0, 1, 1,
0.5166925, -2.165911, 2.488721, 0.1294118, 0, 1, 1,
0.5167306, 0.8352508, 1.273585, 0.1333333, 0, 1, 1,
0.5173294, -0.3579858, 1.904491, 0.1411765, 0, 1, 1,
0.5200853, -1.504711, 3.042005, 0.145098, 0, 1, 1,
0.5216649, 0.06097383, 1.573422, 0.1529412, 0, 1, 1,
0.5265272, -0.2475844, 2.880555, 0.1568628, 0, 1, 1,
0.5302836, -1.422628, 3.014199, 0.1647059, 0, 1, 1,
0.532106, 0.6645799, -0.2963284, 0.1686275, 0, 1, 1,
0.5349318, 2.44876, 0.3931597, 0.1764706, 0, 1, 1,
0.536768, -1.060665, 0.7059623, 0.1803922, 0, 1, 1,
0.5426092, -1.273138, 3.772217, 0.1882353, 0, 1, 1,
0.5455645, 0.1941598, 0.8984243, 0.1921569, 0, 1, 1,
0.5462229, 0.004711113, 1.716015, 0.2, 0, 1, 1,
0.556894, 1.728755, 1.578233, 0.2078431, 0, 1, 1,
0.5584807, -0.8066575, 2.474245, 0.2117647, 0, 1, 1,
0.5595133, -0.4237545, 1.728081, 0.2196078, 0, 1, 1,
0.5595223, -1.583254, 2.074792, 0.2235294, 0, 1, 1,
0.5624846, -1.370756, 2.726915, 0.2313726, 0, 1, 1,
0.567012, -0.9945425, 1.202652, 0.2352941, 0, 1, 1,
0.5695751, 1.012066, 0.07704563, 0.2431373, 0, 1, 1,
0.5725396, -0.09664435, 2.2684, 0.2470588, 0, 1, 1,
0.5795698, 2.408572, -0.4012665, 0.254902, 0, 1, 1,
0.5809946, -0.9901159, 2.407751, 0.2588235, 0, 1, 1,
0.5812144, -0.2259634, 2.011372, 0.2666667, 0, 1, 1,
0.5829808, 0.06561811, 1.518434, 0.2705882, 0, 1, 1,
0.58338, -1.508368, 2.903661, 0.2784314, 0, 1, 1,
0.5836115, -0.09289758, 2.048004, 0.282353, 0, 1, 1,
0.5846503, -0.6280655, 2.28016, 0.2901961, 0, 1, 1,
0.58692, -0.5162624, 2.454623, 0.2941177, 0, 1, 1,
0.5870689, 2.644649, 0.7932107, 0.3019608, 0, 1, 1,
0.5876315, -0.3737641, 1.847043, 0.3098039, 0, 1, 1,
0.5900632, 0.2969163, 0.705767, 0.3137255, 0, 1, 1,
0.5953678, -0.4906579, 1.487605, 0.3215686, 0, 1, 1,
0.5981139, -0.2008069, 2.31477, 0.3254902, 0, 1, 1,
0.5996612, 0.6128508, 1.315853, 0.3333333, 0, 1, 1,
0.6046252, -1.251576, 1.726335, 0.3372549, 0, 1, 1,
0.6048747, 0.3430606, 1.60765, 0.345098, 0, 1, 1,
0.6054721, 0.07781009, 2.874116, 0.3490196, 0, 1, 1,
0.6070926, 1.981977, 0.2639098, 0.3568628, 0, 1, 1,
0.6091695, 1.713918, -2.109244, 0.3607843, 0, 1, 1,
0.6125657, 0.4131614, 0.9805312, 0.3686275, 0, 1, 1,
0.6128059, 0.673268, 3.29504, 0.372549, 0, 1, 1,
0.6129983, -0.8431886, 2.237199, 0.3803922, 0, 1, 1,
0.6230961, 0.9680367, -0.30463, 0.3843137, 0, 1, 1,
0.6252705, 0.5615239, -1.051501, 0.3921569, 0, 1, 1,
0.6269451, -1.45178, 1.799642, 0.3960784, 0, 1, 1,
0.6281433, 0.4669068, 0.3183008, 0.4039216, 0, 1, 1,
0.6287161, 2.03591, 1.294769, 0.4117647, 0, 1, 1,
0.6386191, 0.8180472, 1.742193, 0.4156863, 0, 1, 1,
0.6407599, -2.090043, 2.582007, 0.4235294, 0, 1, 1,
0.643322, 1.92907, -0.8477079, 0.427451, 0, 1, 1,
0.6439967, 1.749257, 1.835622, 0.4352941, 0, 1, 1,
0.644743, -0.06343804, 1.100223, 0.4392157, 0, 1, 1,
0.6448191, -0.5614101, 2.607662, 0.4470588, 0, 1, 1,
0.6470885, -1.207806, 3.654768, 0.4509804, 0, 1, 1,
0.6483208, -0.5551816, 2.019105, 0.4588235, 0, 1, 1,
0.6501074, 0.07671101, 1.438649, 0.4627451, 0, 1, 1,
0.6509756, 0.503617, -1.215773, 0.4705882, 0, 1, 1,
0.6619365, 0.9508778, -0.5122328, 0.4745098, 0, 1, 1,
0.6719736, -0.3769199, 4.006429, 0.4823529, 0, 1, 1,
0.6756779, -1.614212, 3.609143, 0.4862745, 0, 1, 1,
0.6796359, 0.5753328, 0.469764, 0.4941176, 0, 1, 1,
0.6861792, -0.3178393, 3.49433, 0.5019608, 0, 1, 1,
0.6878254, 0.1152067, 1.875155, 0.5058824, 0, 1, 1,
0.6904517, 0.2781653, -0.3319342, 0.5137255, 0, 1, 1,
0.6951714, 0.1453409, -0.1267786, 0.5176471, 0, 1, 1,
0.6992721, 0.6853831, 2.501752, 0.5254902, 0, 1, 1,
0.7001063, 0.04898277, 1.743406, 0.5294118, 0, 1, 1,
0.7049869, -0.0550761, 1.018997, 0.5372549, 0, 1, 1,
0.7069971, 0.1911703, 2.702078, 0.5411765, 0, 1, 1,
0.7085128, 0.2710053, 0.05446014, 0.5490196, 0, 1, 1,
0.7162026, 0.5927123, 0.02372567, 0.5529412, 0, 1, 1,
0.7198614, -0.09783551, 3.531703, 0.5607843, 0, 1, 1,
0.7250885, 0.5796178, -0.417469, 0.5647059, 0, 1, 1,
0.7259101, -0.4585628, 3.141597, 0.572549, 0, 1, 1,
0.727993, -1.580781, 2.03564, 0.5764706, 0, 1, 1,
0.7349619, -3.208687, 1.025319, 0.5843138, 0, 1, 1,
0.7431087, 2.074853, 0.5465174, 0.5882353, 0, 1, 1,
0.7440845, -2.494201, 2.19696, 0.5960785, 0, 1, 1,
0.7448737, 1.717338, -0.2128651, 0.6039216, 0, 1, 1,
0.7469873, -1.935698, 3.884463, 0.6078432, 0, 1, 1,
0.7472814, -1.20846, 2.684525, 0.6156863, 0, 1, 1,
0.7533304, 1.483827, 1.001764, 0.6196079, 0, 1, 1,
0.7604837, -1.511737, 2.331244, 0.627451, 0, 1, 1,
0.76407, 1.04906, 3.373604, 0.6313726, 0, 1, 1,
0.7667627, -1.079954, 3.965665, 0.6392157, 0, 1, 1,
0.7714434, 0.4129702, 0.9793503, 0.6431373, 0, 1, 1,
0.7730816, 1.042555, -0.1910222, 0.6509804, 0, 1, 1,
0.7752091, -0.03149169, 0.191596, 0.654902, 0, 1, 1,
0.7796847, -0.4839006, 1.339664, 0.6627451, 0, 1, 1,
0.7809385, -0.4557288, 1.009381, 0.6666667, 0, 1, 1,
0.7827957, -1.569298, 2.328045, 0.6745098, 0, 1, 1,
0.7849114, 1.741186, -0.8876843, 0.6784314, 0, 1, 1,
0.7912156, 1.044511, -0.3394406, 0.6862745, 0, 1, 1,
0.7977838, 0.1266178, 2.355574, 0.6901961, 0, 1, 1,
0.7985007, -1.102385, 3.180071, 0.6980392, 0, 1, 1,
0.7990239, 0.1632943, 1.141358, 0.7058824, 0, 1, 1,
0.8023196, -0.5761317, 3.713931, 0.7098039, 0, 1, 1,
0.8025686, 0.6966597, 0.8531693, 0.7176471, 0, 1, 1,
0.8033582, 0.005499444, 4.192444, 0.7215686, 0, 1, 1,
0.8066999, 0.2675275, 3.616558, 0.7294118, 0, 1, 1,
0.8084042, 0.884354, 1.714962, 0.7333333, 0, 1, 1,
0.8141271, -0.3763055, 1.266442, 0.7411765, 0, 1, 1,
0.8150338, -0.1649503, 2.156534, 0.7450981, 0, 1, 1,
0.8259935, 1.824388, 0.9995255, 0.7529412, 0, 1, 1,
0.8293508, -0.7762753, 2.872705, 0.7568628, 0, 1, 1,
0.8297209, -0.7738266, 1.576571, 0.7647059, 0, 1, 1,
0.8297752, -0.7564788, 2.669367, 0.7686275, 0, 1, 1,
0.83395, 0.01203523, 2.106347, 0.7764706, 0, 1, 1,
0.8354832, 0.730769, 1.444792, 0.7803922, 0, 1, 1,
0.8387377, -0.5618679, 2.640108, 0.7882353, 0, 1, 1,
0.8389248, -0.2840264, 3.041405, 0.7921569, 0, 1, 1,
0.8406365, 0.0768258, 2.780618, 0.8, 0, 1, 1,
0.8424896, -2.660538, 1.461023, 0.8078431, 0, 1, 1,
0.8435913, 0.2308886, 2.248244, 0.8117647, 0, 1, 1,
0.8475582, 0.7310876, -1.192505, 0.8196079, 0, 1, 1,
0.8504623, -0.810654, 3.017002, 0.8235294, 0, 1, 1,
0.8543366, -0.6414863, 3.046345, 0.8313726, 0, 1, 1,
0.855741, 1.467089, 0.3993738, 0.8352941, 0, 1, 1,
0.8591765, -0.1625134, 1.992007, 0.8431373, 0, 1, 1,
0.8668436, -0.2347209, -0.1127865, 0.8470588, 0, 1, 1,
0.8713205, 0.4698756, 0.5132922, 0.854902, 0, 1, 1,
0.8725837, 1.307238, 1.410353, 0.8588235, 0, 1, 1,
0.8739731, 0.07409741, 0.4633937, 0.8666667, 0, 1, 1,
0.8750555, 0.8300548, 1.676989, 0.8705882, 0, 1, 1,
0.8770741, -1.063736, 2.555021, 0.8784314, 0, 1, 1,
0.8786731, 1.613, 0.7368709, 0.8823529, 0, 1, 1,
0.8790449, -1.262858, 4.678219, 0.8901961, 0, 1, 1,
0.879398, 1.684948, -0.4305134, 0.8941177, 0, 1, 1,
0.8843356, 0.9507056, 1.741842, 0.9019608, 0, 1, 1,
0.8916482, 1.308475, 0.3059537, 0.9098039, 0, 1, 1,
0.8934698, -0.4485592, 1.327556, 0.9137255, 0, 1, 1,
0.8953769, -0.5926536, 0.9771652, 0.9215686, 0, 1, 1,
0.8959138, -1.073583, 1.895163, 0.9254902, 0, 1, 1,
0.8971353, -1.11601, 2.656312, 0.9333333, 0, 1, 1,
0.8976005, 0.06202855, 2.079273, 0.9372549, 0, 1, 1,
0.898386, -0.192044, 1.07856, 0.945098, 0, 1, 1,
0.9023128, -0.2777582, 2.539779, 0.9490196, 0, 1, 1,
0.9044928, 0.07645752, 0.1623758, 0.9568627, 0, 1, 1,
0.9054787, 0.4334295, 0.2269973, 0.9607843, 0, 1, 1,
0.9089019, -0.04576473, 0.3653634, 0.9686275, 0, 1, 1,
0.9117748, -0.9324377, 2.828471, 0.972549, 0, 1, 1,
0.9214051, -1.146173, 2.786438, 0.9803922, 0, 1, 1,
0.9406909, 0.6717837, 3.36905, 0.9843137, 0, 1, 1,
0.9433868, 0.6584039, 0.8122506, 0.9921569, 0, 1, 1,
0.9439406, 0.3358301, 0.3676676, 0.9960784, 0, 1, 1,
0.9457362, -0.1145392, 1.936826, 1, 0, 0.9960784, 1,
0.9463461, -0.06403881, 1.560963, 1, 0, 0.9882353, 1,
0.9464386, -0.8888653, 0.9253342, 1, 0, 0.9843137, 1,
0.9465622, -0.842128, 1.819336, 1, 0, 0.9764706, 1,
0.9566339, 1.451785, -1.359984, 1, 0, 0.972549, 1,
0.9612203, 1.665568, -0.3673325, 1, 0, 0.9647059, 1,
0.9677615, -1.760647, 2.171492, 1, 0, 0.9607843, 1,
0.9716424, -0.3315364, 1.681392, 1, 0, 0.9529412, 1,
0.9752008, -0.6213201, 2.115355, 1, 0, 0.9490196, 1,
0.9778585, -1.421183, 0.2686846, 1, 0, 0.9411765, 1,
0.9799547, -0.8803586, 3.348664, 1, 0, 0.9372549, 1,
0.9826298, 0.9588082, 0.5743151, 1, 0, 0.9294118, 1,
0.9871272, 0.1336771, 2.169352, 1, 0, 0.9254902, 1,
0.9891696, 0.4533334, 0.8752761, 1, 0, 0.9176471, 1,
0.9983718, -1.381571, 1.795939, 1, 0, 0.9137255, 1,
0.9985794, -0.1801571, 1.396004, 1, 0, 0.9058824, 1,
1.004062, 1.965686, 0.7476687, 1, 0, 0.9019608, 1,
1.006793, 0.1018403, 1.536097, 1, 0, 0.8941177, 1,
1.007406, -1.951826, 2.816871, 1, 0, 0.8862745, 1,
1.007928, -0.4489225, 1.916228, 1, 0, 0.8823529, 1,
1.009182, 1.307243, -0.1087144, 1, 0, 0.8745098, 1,
1.025431, 1.376433, 1.129471, 1, 0, 0.8705882, 1,
1.027043, -1.523682, 2.67801, 1, 0, 0.8627451, 1,
1.027698, -0.4295236, 1.424986, 1, 0, 0.8588235, 1,
1.040214, -0.1453637, 1.696842, 1, 0, 0.8509804, 1,
1.046132, 0.5751457, 1.913908, 1, 0, 0.8470588, 1,
1.061997, -0.118537, 1.456852, 1, 0, 0.8392157, 1,
1.067873, -0.5120209, 0.3252882, 1, 0, 0.8352941, 1,
1.092858, 1.532519, 0.2830163, 1, 0, 0.827451, 1,
1.10051, -0.8731464, 2.523506, 1, 0, 0.8235294, 1,
1.102045, 0.7821845, 1.005396, 1, 0, 0.8156863, 1,
1.111614, 0.5263657, 0.3745562, 1, 0, 0.8117647, 1,
1.131483, -1.13537, 2.790794, 1, 0, 0.8039216, 1,
1.135236, -0.4837078, 2.070422, 1, 0, 0.7960784, 1,
1.136031, 0.6725607, -0.6898623, 1, 0, 0.7921569, 1,
1.136742, -0.07787432, 1.588075, 1, 0, 0.7843137, 1,
1.137413, 0.5783578, 1.689312, 1, 0, 0.7803922, 1,
1.144988, -0.7360891, 2.847394, 1, 0, 0.772549, 1,
1.147423, -0.4485217, 1.126936, 1, 0, 0.7686275, 1,
1.15382, 2.540527, 0.4165237, 1, 0, 0.7607843, 1,
1.161081, -0.2067683, 0.02829946, 1, 0, 0.7568628, 1,
1.170619, -0.4660143, 1.430951, 1, 0, 0.7490196, 1,
1.17263, -0.4114612, 2.181066, 1, 0, 0.7450981, 1,
1.175741, 0.2818581, 0.9128998, 1, 0, 0.7372549, 1,
1.182033, -1.664882, 1.652958, 1, 0, 0.7333333, 1,
1.182704, -0.1628419, 2.685213, 1, 0, 0.7254902, 1,
1.186687, 2.834, 0.117742, 1, 0, 0.7215686, 1,
1.192686, -1.434601, 4.082798, 1, 0, 0.7137255, 1,
1.201064, 1.2324, -0.1391741, 1, 0, 0.7098039, 1,
1.208516, 0.09975104, 1.027819, 1, 0, 0.7019608, 1,
1.21027, 0.1550898, 2.194379, 1, 0, 0.6941177, 1,
1.21038, -0.1794108, 3.606366, 1, 0, 0.6901961, 1,
1.211272, -0.5357904, 2.198142, 1, 0, 0.682353, 1,
1.225276, 0.1667084, 1.359651, 1, 0, 0.6784314, 1,
1.230854, -0.01852444, 2.722661, 1, 0, 0.6705883, 1,
1.236933, -0.2916059, 2.344671, 1, 0, 0.6666667, 1,
1.247113, -0.6027998, 0.7295197, 1, 0, 0.6588235, 1,
1.248536, 0.6989304, 1.483475, 1, 0, 0.654902, 1,
1.250389, 0.04210633, 1.349907, 1, 0, 0.6470588, 1,
1.260717, -1.683367, 1.625844, 1, 0, 0.6431373, 1,
1.261644, -0.4576001, 1.991458, 1, 0, 0.6352941, 1,
1.264571, -0.3828294, 2.435374, 1, 0, 0.6313726, 1,
1.265413, -0.7584462, 2.389832, 1, 0, 0.6235294, 1,
1.265725, 0.8257762, 1.688273, 1, 0, 0.6196079, 1,
1.266426, -0.1337553, 1.091514, 1, 0, 0.6117647, 1,
1.26974, 0.1941633, 0.5833339, 1, 0, 0.6078432, 1,
1.283967, 0.4817747, 1.782349, 1, 0, 0.6, 1,
1.286164, 2.055968, 0.5005555, 1, 0, 0.5921569, 1,
1.311818, -1.345986, 2.148294, 1, 0, 0.5882353, 1,
1.313866, -0.2052912, 3.888046, 1, 0, 0.5803922, 1,
1.317244, 0.5527226, 2.338761, 1, 0, 0.5764706, 1,
1.325914, 0.04132801, 0.4141001, 1, 0, 0.5686275, 1,
1.332903, -0.6813692, 3.09303, 1, 0, 0.5647059, 1,
1.338941, 0.07065328, 2.010749, 1, 0, 0.5568628, 1,
1.342257, -1.771167, 3.278862, 1, 0, 0.5529412, 1,
1.358648, 0.588016, 1.402124, 1, 0, 0.5450981, 1,
1.36147, -1.023516, 1.169224, 1, 0, 0.5411765, 1,
1.367174, -1.225492, 2.127262, 1, 0, 0.5333334, 1,
1.37068, 0.1374185, 0.4025007, 1, 0, 0.5294118, 1,
1.371158, 1.619322, 1.662488, 1, 0, 0.5215687, 1,
1.374092, -0.3124304, 3.22337, 1, 0, 0.5176471, 1,
1.383116, -0.2634493, 2.006199, 1, 0, 0.509804, 1,
1.383608, -0.6080477, 1.532246, 1, 0, 0.5058824, 1,
1.384018, 0.02267541, 0.007645708, 1, 0, 0.4980392, 1,
1.394123, -0.2108916, 1.080793, 1, 0, 0.4901961, 1,
1.409918, 0.2023398, 1.699329, 1, 0, 0.4862745, 1,
1.41068, 0.2400246, 1.568159, 1, 0, 0.4784314, 1,
1.417895, -1.572071, 2.503358, 1, 0, 0.4745098, 1,
1.419263, 1.106825, 3.057095, 1, 0, 0.4666667, 1,
1.41978, -0.01097724, 0.4770625, 1, 0, 0.4627451, 1,
1.440832, -0.2891564, 2.548259, 1, 0, 0.454902, 1,
1.44119, -0.8383656, 2.111832, 1, 0, 0.4509804, 1,
1.460868, 1.288023, 1.653518, 1, 0, 0.4431373, 1,
1.465997, -0.8967158, 3.348595, 1, 0, 0.4392157, 1,
1.495207, 0.8353636, 2.017861, 1, 0, 0.4313726, 1,
1.499947, -1.011008, 0.1826678, 1, 0, 0.427451, 1,
1.502506, 1.191871, 2.218947, 1, 0, 0.4196078, 1,
1.509089, -0.357195, 2.616453, 1, 0, 0.4156863, 1,
1.518716, 1.704489, -0.8120678, 1, 0, 0.4078431, 1,
1.524681, 0.9868223, -0.1881771, 1, 0, 0.4039216, 1,
1.555048, -0.9163923, 2.674618, 1, 0, 0.3960784, 1,
1.557329, 0.2050458, 3.148205, 1, 0, 0.3882353, 1,
1.558542, 0.6268138, 0.05444355, 1, 0, 0.3843137, 1,
1.560931, -0.2322214, 0.409187, 1, 0, 0.3764706, 1,
1.563326, -0.8461478, 2.316376, 1, 0, 0.372549, 1,
1.569916, 1.881086, -0.1603556, 1, 0, 0.3647059, 1,
1.594361, 0.1003831, 2.139584, 1, 0, 0.3607843, 1,
1.594601, -0.1634626, 1.667041, 1, 0, 0.3529412, 1,
1.603415, 0.5185657, 2.15833, 1, 0, 0.3490196, 1,
1.604278, 2.109739, -0.6750799, 1, 0, 0.3411765, 1,
1.62582, -0.4830742, 1.837159, 1, 0, 0.3372549, 1,
1.639601, -0.5675963, 2.994715, 1, 0, 0.3294118, 1,
1.649415, -0.8284595, 2.885853, 1, 0, 0.3254902, 1,
1.672208, -0.6436049, -0.3416128, 1, 0, 0.3176471, 1,
1.672474, -0.4650987, 1.229244, 1, 0, 0.3137255, 1,
1.679481, 2.216564, -0.6867235, 1, 0, 0.3058824, 1,
1.682719, -0.147136, 1.969833, 1, 0, 0.2980392, 1,
1.689746, 0.7377481, 2.760466, 1, 0, 0.2941177, 1,
1.709137, -0.3736566, 2.50393, 1, 0, 0.2862745, 1,
1.764312, 0.3665758, 0.7911909, 1, 0, 0.282353, 1,
1.775422, 0.8169535, 0.6862428, 1, 0, 0.2745098, 1,
1.784426, -0.5087055, 2.326769, 1, 0, 0.2705882, 1,
1.78843, -1.093187, 3.596967, 1, 0, 0.2627451, 1,
1.810474, 0.9191448, 0.9309401, 1, 0, 0.2588235, 1,
1.830859, -0.3773127, 1.71965, 1, 0, 0.2509804, 1,
1.834719, 1.294194, -0.727162, 1, 0, 0.2470588, 1,
1.835768, -2.369062, 2.213289, 1, 0, 0.2392157, 1,
1.853038, -0.2291181, 1.352031, 1, 0, 0.2352941, 1,
1.857049, 0.2579827, 1.763206, 1, 0, 0.227451, 1,
1.872916, -1.387775, 2.16215, 1, 0, 0.2235294, 1,
1.873876, 0.02759368, 2.612115, 1, 0, 0.2156863, 1,
1.874575, -0.7552006, 3.343263, 1, 0, 0.2117647, 1,
1.941984, -0.5772395, 3.210187, 1, 0, 0.2039216, 1,
1.992668, -1.705213, 3.346519, 1, 0, 0.1960784, 1,
2.004985, 0.7366022, 1.998997, 1, 0, 0.1921569, 1,
2.006134, 0.6405725, -0.4097837, 1, 0, 0.1843137, 1,
2.006576, -0.3050398, 3.232405, 1, 0, 0.1803922, 1,
2.015876, -1.4421, 2.055678, 1, 0, 0.172549, 1,
2.034963, 0.503636, 0.5988987, 1, 0, 0.1686275, 1,
2.063498, -0.3877378, 1.668231, 1, 0, 0.1607843, 1,
2.067021, -0.1486438, 3.453585, 1, 0, 0.1568628, 1,
2.105347, -1.590608, 3.245656, 1, 0, 0.1490196, 1,
2.11889, 0.6010109, 1.06044, 1, 0, 0.145098, 1,
2.130811, -1.160226, 1.599134, 1, 0, 0.1372549, 1,
2.141877, -1.199921, 2.048616, 1, 0, 0.1333333, 1,
2.17074, 0.1146294, 0.4561676, 1, 0, 0.1254902, 1,
2.17529, -1.661081, 2.614731, 1, 0, 0.1215686, 1,
2.180575, 0.4336978, 1.079423, 1, 0, 0.1137255, 1,
2.230187, 2.110404, 2.661139, 1, 0, 0.1098039, 1,
2.239589, -1.38381, 3.011125, 1, 0, 0.1019608, 1,
2.283521, -0.6112018, 1.687976, 1, 0, 0.09411765, 1,
2.288298, -0.4257973, 1.960532, 1, 0, 0.09019608, 1,
2.289509, -0.6584899, 0.8149279, 1, 0, 0.08235294, 1,
2.302129, -1.084747, 1.734494, 1, 0, 0.07843138, 1,
2.306905, 1.266165, 1.418721, 1, 0, 0.07058824, 1,
2.312124, 0.6547274, 0.6762248, 1, 0, 0.06666667, 1,
2.327636, 0.3019991, 1.626655, 1, 0, 0.05882353, 1,
2.47121, 0.6392856, 1.440007, 1, 0, 0.05490196, 1,
2.504153, -0.5497422, 1.630923, 1, 0, 0.04705882, 1,
2.658155, -0.02780043, 1.266062, 1, 0, 0.04313726, 1,
2.821192, -0.4632787, 2.300674, 1, 0, 0.03529412, 1,
2.908195, -1.380949, 3.429769, 1, 0, 0.03137255, 1,
3.298569, 1.000697, 0.3390595, 1, 0, 0.02352941, 1,
3.332363, 1.165877, 1.885636, 1, 0, 0.01960784, 1,
3.379083, -1.0301, 3.390367, 1, 0, 0.01176471, 1,
3.530266, -0.7706749, 2.393923, 1, 0, 0.007843138, 1
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
0.1456491, -4.267137, -7.404629, 0, -0.5, 0.5, 0.5,
0.1456491, -4.267137, -7.404629, 1, -0.5, 0.5, 0.5,
0.1456491, -4.267137, -7.404629, 1, 1.5, 0.5, 0.5,
0.1456491, -4.267137, -7.404629, 0, 1.5, 0.5, 0.5
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
-4.386353, -0.08641505, -7.404629, 0, -0.5, 0.5, 0.5,
-4.386353, -0.08641505, -7.404629, 1, -0.5, 0.5, 0.5,
-4.386353, -0.08641505, -7.404629, 1, 1.5, 0.5, 0.5,
-4.386353, -0.08641505, -7.404629, 0, 1.5, 0.5, 0.5
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
-4.386353, -4.267137, -0.4350352, 0, -0.5, 0.5, 0.5,
-4.386353, -4.267137, -0.4350352, 1, -0.5, 0.5, 0.5,
-4.386353, -4.267137, -0.4350352, 1, 1.5, 0.5, 0.5,
-4.386353, -4.267137, -0.4350352, 0, 1.5, 0.5, 0.5
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
-3, -3.302355, -5.796261,
3, -3.302355, -5.796261,
-3, -3.302355, -5.796261,
-3, -3.463152, -6.064322,
-2, -3.302355, -5.796261,
-2, -3.463152, -6.064322,
-1, -3.302355, -5.796261,
-1, -3.463152, -6.064322,
0, -3.302355, -5.796261,
0, -3.463152, -6.064322,
1, -3.302355, -5.796261,
1, -3.463152, -6.064322,
2, -3.302355, -5.796261,
2, -3.463152, -6.064322,
3, -3.302355, -5.796261,
3, -3.463152, -6.064322
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
-3, -3.784746, -6.600445, 0, -0.5, 0.5, 0.5,
-3, -3.784746, -6.600445, 1, -0.5, 0.5, 0.5,
-3, -3.784746, -6.600445, 1, 1.5, 0.5, 0.5,
-3, -3.784746, -6.600445, 0, 1.5, 0.5, 0.5,
-2, -3.784746, -6.600445, 0, -0.5, 0.5, 0.5,
-2, -3.784746, -6.600445, 1, -0.5, 0.5, 0.5,
-2, -3.784746, -6.600445, 1, 1.5, 0.5, 0.5,
-2, -3.784746, -6.600445, 0, 1.5, 0.5, 0.5,
-1, -3.784746, -6.600445, 0, -0.5, 0.5, 0.5,
-1, -3.784746, -6.600445, 1, -0.5, 0.5, 0.5,
-1, -3.784746, -6.600445, 1, 1.5, 0.5, 0.5,
-1, -3.784746, -6.600445, 0, 1.5, 0.5, 0.5,
0, -3.784746, -6.600445, 0, -0.5, 0.5, 0.5,
0, -3.784746, -6.600445, 1, -0.5, 0.5, 0.5,
0, -3.784746, -6.600445, 1, 1.5, 0.5, 0.5,
0, -3.784746, -6.600445, 0, 1.5, 0.5, 0.5,
1, -3.784746, -6.600445, 0, -0.5, 0.5, 0.5,
1, -3.784746, -6.600445, 1, -0.5, 0.5, 0.5,
1, -3.784746, -6.600445, 1, 1.5, 0.5, 0.5,
1, -3.784746, -6.600445, 0, 1.5, 0.5, 0.5,
2, -3.784746, -6.600445, 0, -0.5, 0.5, 0.5,
2, -3.784746, -6.600445, 1, -0.5, 0.5, 0.5,
2, -3.784746, -6.600445, 1, 1.5, 0.5, 0.5,
2, -3.784746, -6.600445, 0, 1.5, 0.5, 0.5,
3, -3.784746, -6.600445, 0, -0.5, 0.5, 0.5,
3, -3.784746, -6.600445, 1, -0.5, 0.5, 0.5,
3, -3.784746, -6.600445, 1, 1.5, 0.5, 0.5,
3, -3.784746, -6.600445, 0, 1.5, 0.5, 0.5
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
-3.340507, -3, -5.796261,
-3.340507, 3, -5.796261,
-3.340507, -3, -5.796261,
-3.514814, -3, -6.064322,
-3.340507, -2, -5.796261,
-3.514814, -2, -6.064322,
-3.340507, -1, -5.796261,
-3.514814, -1, -6.064322,
-3.340507, 0, -5.796261,
-3.514814, 0, -6.064322,
-3.340507, 1, -5.796261,
-3.514814, 1, -6.064322,
-3.340507, 2, -5.796261,
-3.514814, 2, -6.064322,
-3.340507, 3, -5.796261,
-3.514814, 3, -6.064322
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
-3.86343, -3, -6.600445, 0, -0.5, 0.5, 0.5,
-3.86343, -3, -6.600445, 1, -0.5, 0.5, 0.5,
-3.86343, -3, -6.600445, 1, 1.5, 0.5, 0.5,
-3.86343, -3, -6.600445, 0, 1.5, 0.5, 0.5,
-3.86343, -2, -6.600445, 0, -0.5, 0.5, 0.5,
-3.86343, -2, -6.600445, 1, -0.5, 0.5, 0.5,
-3.86343, -2, -6.600445, 1, 1.5, 0.5, 0.5,
-3.86343, -2, -6.600445, 0, 1.5, 0.5, 0.5,
-3.86343, -1, -6.600445, 0, -0.5, 0.5, 0.5,
-3.86343, -1, -6.600445, 1, -0.5, 0.5, 0.5,
-3.86343, -1, -6.600445, 1, 1.5, 0.5, 0.5,
-3.86343, -1, -6.600445, 0, 1.5, 0.5, 0.5,
-3.86343, 0, -6.600445, 0, -0.5, 0.5, 0.5,
-3.86343, 0, -6.600445, 1, -0.5, 0.5, 0.5,
-3.86343, 0, -6.600445, 1, 1.5, 0.5, 0.5,
-3.86343, 0, -6.600445, 0, 1.5, 0.5, 0.5,
-3.86343, 1, -6.600445, 0, -0.5, 0.5, 0.5,
-3.86343, 1, -6.600445, 1, -0.5, 0.5, 0.5,
-3.86343, 1, -6.600445, 1, 1.5, 0.5, 0.5,
-3.86343, 1, -6.600445, 0, 1.5, 0.5, 0.5,
-3.86343, 2, -6.600445, 0, -0.5, 0.5, 0.5,
-3.86343, 2, -6.600445, 1, -0.5, 0.5, 0.5,
-3.86343, 2, -6.600445, 1, 1.5, 0.5, 0.5,
-3.86343, 2, -6.600445, 0, 1.5, 0.5, 0.5,
-3.86343, 3, -6.600445, 0, -0.5, 0.5, 0.5,
-3.86343, 3, -6.600445, 1, -0.5, 0.5, 0.5,
-3.86343, 3, -6.600445, 1, 1.5, 0.5, 0.5,
-3.86343, 3, -6.600445, 0, 1.5, 0.5, 0.5
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
-3.340507, -3.302355, -4,
-3.340507, -3.302355, 4,
-3.340507, -3.302355, -4,
-3.514814, -3.463152, -4,
-3.340507, -3.302355, -2,
-3.514814, -3.463152, -2,
-3.340507, -3.302355, 0,
-3.514814, -3.463152, 0,
-3.340507, -3.302355, 2,
-3.514814, -3.463152, 2,
-3.340507, -3.302355, 4,
-3.514814, -3.463152, 4
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
-3.86343, -3.784746, -4, 0, -0.5, 0.5, 0.5,
-3.86343, -3.784746, -4, 1, -0.5, 0.5, 0.5,
-3.86343, -3.784746, -4, 1, 1.5, 0.5, 0.5,
-3.86343, -3.784746, -4, 0, 1.5, 0.5, 0.5,
-3.86343, -3.784746, -2, 0, -0.5, 0.5, 0.5,
-3.86343, -3.784746, -2, 1, -0.5, 0.5, 0.5,
-3.86343, -3.784746, -2, 1, 1.5, 0.5, 0.5,
-3.86343, -3.784746, -2, 0, 1.5, 0.5, 0.5,
-3.86343, -3.784746, 0, 0, -0.5, 0.5, 0.5,
-3.86343, -3.784746, 0, 1, -0.5, 0.5, 0.5,
-3.86343, -3.784746, 0, 1, 1.5, 0.5, 0.5,
-3.86343, -3.784746, 0, 0, 1.5, 0.5, 0.5,
-3.86343, -3.784746, 2, 0, -0.5, 0.5, 0.5,
-3.86343, -3.784746, 2, 1, -0.5, 0.5, 0.5,
-3.86343, -3.784746, 2, 1, 1.5, 0.5, 0.5,
-3.86343, -3.784746, 2, 0, 1.5, 0.5, 0.5,
-3.86343, -3.784746, 4, 0, -0.5, 0.5, 0.5,
-3.86343, -3.784746, 4, 1, -0.5, 0.5, 0.5,
-3.86343, -3.784746, 4, 1, 1.5, 0.5, 0.5,
-3.86343, -3.784746, 4, 0, 1.5, 0.5, 0.5
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
-3.340507, -3.302355, -5.796261,
-3.340507, 3.129525, -5.796261,
-3.340507, -3.302355, 4.926191,
-3.340507, 3.129525, 4.926191,
-3.340507, -3.302355, -5.796261,
-3.340507, -3.302355, 4.926191,
-3.340507, 3.129525, -5.796261,
-3.340507, 3.129525, 4.926191,
-3.340507, -3.302355, -5.796261,
3.631805, -3.302355, -5.796261,
-3.340507, -3.302355, 4.926191,
3.631805, -3.302355, 4.926191,
-3.340507, 3.129525, -5.796261,
3.631805, 3.129525, -5.796261,
-3.340507, 3.129525, 4.926191,
3.631805, 3.129525, 4.926191,
3.631805, -3.302355, -5.796261,
3.631805, 3.129525, -5.796261,
3.631805, -3.302355, 4.926191,
3.631805, 3.129525, 4.926191,
3.631805, -3.302355, -5.796261,
3.631805, -3.302355, 4.926191,
3.631805, 3.129525, -5.796261,
3.631805, 3.129525, 4.926191
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
var radius = 7.644565;
var distance = 34.01153;
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
mvMatrix.translate( -0.1456491, 0.08641505, 0.4350352 );
mvMatrix.scale( 1.185468, 1.285076, 0.7708548 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.01153);
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
dimethipin<-read.table("dimethipin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-dimethipin$V2
```

```
## Error in eval(expr, envir, enclos): object 'dimethipin' not found
```

```r
y<-dimethipin$V3
```

```
## Error in eval(expr, envir, enclos): object 'dimethipin' not found
```

```r
z<-dimethipin$V4
```

```
## Error in eval(expr, envir, enclos): object 'dimethipin' not found
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
-3.238968, 1.295669, -1.854218, 0, 0, 1, 1, 1,
-3.201491, 0.175819, -1.544905, 1, 0, 0, 1, 1,
-2.769442, -2.720819, -2.744967, 1, 0, 0, 1, 1,
-2.670159, 0.4973911, -0.2609704, 1, 0, 0, 1, 1,
-2.647861, 0.1753484, -0.9441923, 1, 0, 0, 1, 1,
-2.63738, 0.07365521, -0.1978603, 1, 0, 0, 1, 1,
-2.579719, -0.7130716, -0.0001702958, 0, 0, 0, 1, 1,
-2.548736, 0.5967602, -1.58338, 0, 0, 0, 1, 1,
-2.496585, 0.3412551, -0.6257605, 0, 0, 0, 1, 1,
-2.451608, -1.827713, -4.33166, 0, 0, 0, 1, 1,
-2.419661, 2.401099, 0.235973, 0, 0, 0, 1, 1,
-2.382979, 0.0004717146, -0.5500203, 0, 0, 0, 1, 1,
-2.373456, -2.295382, -2.954177, 0, 0, 0, 1, 1,
-2.34428, -1.826316, -1.641177, 1, 1, 1, 1, 1,
-2.342579, 1.190028, -2.538213, 1, 1, 1, 1, 1,
-2.297964, 0.6824682, -0.9550695, 1, 1, 1, 1, 1,
-2.233634, 0.6173944, 1.330648, 1, 1, 1, 1, 1,
-2.212893, 0.4640345, -1.731543, 1, 1, 1, 1, 1,
-2.206366, 0.4003241, 0.6357977, 1, 1, 1, 1, 1,
-2.186905, 0.8428893, -0.5198696, 1, 1, 1, 1, 1,
-2.131095, 0.009140344, -2.000959, 1, 1, 1, 1, 1,
-2.127371, -0.4946138, -2.302275, 1, 1, 1, 1, 1,
-2.099825, 1.257905, -1.732948, 1, 1, 1, 1, 1,
-2.075325, -0.0447468, -0.9579934, 1, 1, 1, 1, 1,
-2.064734, 0.1830429, -0.5637168, 1, 1, 1, 1, 1,
-2.051646, -0.8122993, -3.079581, 1, 1, 1, 1, 1,
-2.04979, -0.02531319, -1.810989, 1, 1, 1, 1, 1,
-2.04752, -1.561489, -3.930516, 1, 1, 1, 1, 1,
-2.047063, 0.7555081, -0.6054701, 0, 0, 1, 1, 1,
-2.022188, -0.6673733, -2.446015, 1, 0, 0, 1, 1,
-2.0177, -1.47945, -2.092382, 1, 0, 0, 1, 1,
-1.967023, 0.729819, -1.130904, 1, 0, 0, 1, 1,
-1.962707, -0.3350578, -2.300438, 1, 0, 0, 1, 1,
-1.937367, 0.2932198, -0.02858883, 1, 0, 0, 1, 1,
-1.919489, -0.4219387, -2.066756, 0, 0, 0, 1, 1,
-1.901344, 0.2494796, -2.146527, 0, 0, 0, 1, 1,
-1.893272, -0.7712282, -3.195071, 0, 0, 0, 1, 1,
-1.891127, 1.022478, -1.333942, 0, 0, 0, 1, 1,
-1.864138, 0.1658799, -2.898668, 0, 0, 0, 1, 1,
-1.852885, -1.231387, -0.5362692, 0, 0, 0, 1, 1,
-1.841441, -0.9417203, -1.346439, 0, 0, 0, 1, 1,
-1.834333, 0.4130174, -3.367389, 1, 1, 1, 1, 1,
-1.829101, 0.6257428, -2.024714, 1, 1, 1, 1, 1,
-1.817457, -0.3823796, -1.746752, 1, 1, 1, 1, 1,
-1.813464, 0.1585394, -2.963844, 1, 1, 1, 1, 1,
-1.795987, 1.422054, -2.018801, 1, 1, 1, 1, 1,
-1.789705, 0.06245293, -0.1356162, 1, 1, 1, 1, 1,
-1.785507, -1.149689, -1.780146, 1, 1, 1, 1, 1,
-1.771675, -1.06943, -2.413655, 1, 1, 1, 1, 1,
-1.755628, -0.4558194, -2.544169, 1, 1, 1, 1, 1,
-1.733955, 1.091588, -2.527153, 1, 1, 1, 1, 1,
-1.731741, 0.3241305, -2.381482, 1, 1, 1, 1, 1,
-1.729959, 1.27999, -2.160882, 1, 1, 1, 1, 1,
-1.725387, 0.3289456, -1.609295, 1, 1, 1, 1, 1,
-1.720608, 0.4201429, -2.860784, 1, 1, 1, 1, 1,
-1.720395, -0.4167016, -2.31999, 1, 1, 1, 1, 1,
-1.692197, 0.3325415, -2.88747, 0, 0, 1, 1, 1,
-1.688519, 1.842835, 1.235236, 1, 0, 0, 1, 1,
-1.683916, -1.207154, -2.86875, 1, 0, 0, 1, 1,
-1.676604, -0.9967337, -4.945835, 1, 0, 0, 1, 1,
-1.67225, -0.9040024, -3.02417, 1, 0, 0, 1, 1,
-1.66498, -0.3140394, -2.144269, 1, 0, 0, 1, 1,
-1.658283, 1.00005, -0.981495, 0, 0, 0, 1, 1,
-1.64714, 0.4595399, 0.01343821, 0, 0, 0, 1, 1,
-1.646667, -0.03268434, -2.284966, 0, 0, 0, 1, 1,
-1.623038, -0.9001694, -2.08793, 0, 0, 0, 1, 1,
-1.615883, 0.1124851, -0.6408937, 0, 0, 0, 1, 1,
-1.615739, 2.298381, -0.8381254, 0, 0, 0, 1, 1,
-1.606783, 1.811447, -0.924042, 0, 0, 0, 1, 1,
-1.599987, 1.149697, -1.871456, 1, 1, 1, 1, 1,
-1.587376, -0.9095198, -1.766609, 1, 1, 1, 1, 1,
-1.570634, -1.790127, -1.998832, 1, 1, 1, 1, 1,
-1.567369, 0.8516644, -1.019943, 1, 1, 1, 1, 1,
-1.558935, -0.2674981, -0.9497847, 1, 1, 1, 1, 1,
-1.55825, -0.1652334, -2.046983, 1, 1, 1, 1, 1,
-1.547228, 0.247879, -1.085601, 1, 1, 1, 1, 1,
-1.512569, 0.2100322, -1.673031, 1, 1, 1, 1, 1,
-1.510429, 0.1076352, 0.2574825, 1, 1, 1, 1, 1,
-1.506459, 2.20727, -1.258512, 1, 1, 1, 1, 1,
-1.505231, 0.8781087, -1.812451, 1, 1, 1, 1, 1,
-1.503791, -0.008010906, -3.088199, 1, 1, 1, 1, 1,
-1.487933, 1.598561, -0.5315844, 1, 1, 1, 1, 1,
-1.485586, -1.128629, -1.038046, 1, 1, 1, 1, 1,
-1.48021, -0.08661559, 0.5441694, 1, 1, 1, 1, 1,
-1.472028, 1.173884, -0.141025, 0, 0, 1, 1, 1,
-1.45842, 0.587184, -2.486617, 1, 0, 0, 1, 1,
-1.453144, 0.5698166, -1.53617, 1, 0, 0, 1, 1,
-1.427081, -0.02517421, -1.109985, 1, 0, 0, 1, 1,
-1.415042, 0.6311799, -1.60886, 1, 0, 0, 1, 1,
-1.403816, 0.7702358, -0.5188282, 1, 0, 0, 1, 1,
-1.398666, -0.2052358, -0.2764119, 0, 0, 0, 1, 1,
-1.392128, 0.5877132, -0.34303, 0, 0, 0, 1, 1,
-1.369417, 0.1199771, -1.33724, 0, 0, 0, 1, 1,
-1.369044, -1.52616, -3.403039, 0, 0, 0, 1, 1,
-1.36186, 0.6659938, -0.5888661, 0, 0, 0, 1, 1,
-1.341865, -0.08228092, -1.106863, 0, 0, 0, 1, 1,
-1.338491, 0.5084794, -1.228851, 0, 0, 0, 1, 1,
-1.32972, 0.04219331, -0.6911982, 1, 1, 1, 1, 1,
-1.329059, 0.4986959, -1.92506, 1, 1, 1, 1, 1,
-1.3229, 0.8282205, -1.491509, 1, 1, 1, 1, 1,
-1.301098, 0.3165661, -1.438342, 1, 1, 1, 1, 1,
-1.291221, 0.03045108, -0.2780095, 1, 1, 1, 1, 1,
-1.286569, -0.6754355, -2.758336, 1, 1, 1, 1, 1,
-1.284976, 0.5483695, -1.284107, 1, 1, 1, 1, 1,
-1.275985, 0.8255111, -1.700406, 1, 1, 1, 1, 1,
-1.270504, -0.3977005, -0.472226, 1, 1, 1, 1, 1,
-1.266287, -0.3095743, -2.490083, 1, 1, 1, 1, 1,
-1.250263, 0.2487595, -2.510286, 1, 1, 1, 1, 1,
-1.241157, 2.373842, -0.2247616, 1, 1, 1, 1, 1,
-1.235724, -1.451996, -1.717684, 1, 1, 1, 1, 1,
-1.235709, 1.798506, -0.3502666, 1, 1, 1, 1, 1,
-1.229403, 1.588391, -1.103939, 1, 1, 1, 1, 1,
-1.22362, -0.1497678, 0.1067604, 0, 0, 1, 1, 1,
-1.21547, -0.04714938, -2.5812, 1, 0, 0, 1, 1,
-1.211739, 0.599678, -1.422354, 1, 0, 0, 1, 1,
-1.197036, 0.4308542, -1.960076, 1, 0, 0, 1, 1,
-1.182953, -0.690482, -1.739851, 1, 0, 0, 1, 1,
-1.175758, -0.2901796, -4.189302, 1, 0, 0, 1, 1,
-1.174202, 0.5718601, -2.399159, 0, 0, 0, 1, 1,
-1.171329, 0.7564228, -0.6852505, 0, 0, 0, 1, 1,
-1.160729, 1.144214, -0.13792, 0, 0, 0, 1, 1,
-1.156481, -0.06320188, 0.4511913, 0, 0, 0, 1, 1,
-1.143811, 1.614877, -0.05899995, 0, 0, 0, 1, 1,
-1.138656, -2.085319, -1.113223, 0, 0, 0, 1, 1,
-1.126999, 0.8751642, -2.420886, 0, 0, 0, 1, 1,
-1.112385, -0.4045791, -1.477816, 1, 1, 1, 1, 1,
-1.096186, -2.405604, -0.5080637, 1, 1, 1, 1, 1,
-1.084274, -0.1393809, -2.38217, 1, 1, 1, 1, 1,
-1.083435, 0.918011, -0.0242543, 1, 1, 1, 1, 1,
-1.082251, -1.140817, -3.971045, 1, 1, 1, 1, 1,
-1.080816, -0.4232706, -1.814273, 1, 1, 1, 1, 1,
-1.078258, -1.774966, -1.913371, 1, 1, 1, 1, 1,
-1.066453, 0.8729532, -0.1043205, 1, 1, 1, 1, 1,
-1.059845, -0.6703582, -2.125072, 1, 1, 1, 1, 1,
-1.059408, -0.6694792, -2.734554, 1, 1, 1, 1, 1,
-1.056553, 0.2790099, -1.738218, 1, 1, 1, 1, 1,
-1.055699, -0.2016619, -3.183033, 1, 1, 1, 1, 1,
-1.050836, -0.583097, -1.059283, 1, 1, 1, 1, 1,
-1.049419, -0.5848917, -1.060247, 1, 1, 1, 1, 1,
-1.04419, 0.09910685, -0.3543407, 1, 1, 1, 1, 1,
-1.040742, 1.788506, -0.328487, 0, 0, 1, 1, 1,
-1.040695, -1.235861, -2.801001, 1, 0, 0, 1, 1,
-1.039375, 2.050566, -0.2513082, 1, 0, 0, 1, 1,
-1.036581, -0.001119479, -1.165743, 1, 0, 0, 1, 1,
-1.036134, 0.8908092, 0.2840797, 1, 0, 0, 1, 1,
-1.033508, 1.122121, -1.595166, 1, 0, 0, 1, 1,
-1.031413, -0.1118204, -2.619112, 0, 0, 0, 1, 1,
-1.021881, -0.4355082, -2.773592, 0, 0, 0, 1, 1,
-1.021661, -0.267939, -1.30172, 0, 0, 0, 1, 1,
-1.019055, 0.05403812, 0.1713337, 0, 0, 0, 1, 1,
-1.014362, -0.2414398, -2.311001, 0, 0, 0, 1, 1,
-1.000301, -2.177204, -4.11625, 0, 0, 0, 1, 1,
-0.9992498, -0.8378995, -1.721406, 0, 0, 0, 1, 1,
-0.9978195, -0.8222723, -1.061675, 1, 1, 1, 1, 1,
-0.9962116, 1.501724, 0.5516006, 1, 1, 1, 1, 1,
-0.98717, 1.114839, -0.1926535, 1, 1, 1, 1, 1,
-0.9840018, -0.5615804, -1.297595, 1, 1, 1, 1, 1,
-0.9762992, -0.3433339, -3.272047, 1, 1, 1, 1, 1,
-0.9751788, -1.425743, -1.201121, 1, 1, 1, 1, 1,
-0.9708277, 2.361023, 1.298138, 1, 1, 1, 1, 1,
-0.9655077, 0.5672445, -3.153929, 1, 1, 1, 1, 1,
-0.9652611, -1.768476, -2.105443, 1, 1, 1, 1, 1,
-0.9630379, 1.655894, -0.977725, 1, 1, 1, 1, 1,
-0.9599785, -0.369237, -0.02539134, 1, 1, 1, 1, 1,
-0.9507877, -0.4949724, -0.7051124, 1, 1, 1, 1, 1,
-0.9506286, -0.7441913, -1.518844, 1, 1, 1, 1, 1,
-0.9389036, -0.3827866, -2.850266, 1, 1, 1, 1, 1,
-0.9315318, -0.5324992, -3.298906, 1, 1, 1, 1, 1,
-0.9293575, 1.05659, -0.8220206, 0, 0, 1, 1, 1,
-0.927937, -0.4445847, 0.4636814, 1, 0, 0, 1, 1,
-0.9273964, 0.7514123, -1.690197, 1, 0, 0, 1, 1,
-0.9257409, 0.1322737, -0.220568, 1, 0, 0, 1, 1,
-0.9211222, -0.4704141, -2.943024, 1, 0, 0, 1, 1,
-0.9116502, 1.127019, -1.05251, 1, 0, 0, 1, 1,
-0.9070189, -1.004005, -2.045521, 0, 0, 0, 1, 1,
-0.8998256, 0.4264954, -0.9638907, 0, 0, 0, 1, 1,
-0.8998117, -0.2709801, -2.070098, 0, 0, 0, 1, 1,
-0.8963872, 0.6599175, 0.6426948, 0, 0, 0, 1, 1,
-0.8904788, -3.018454, -4.385894, 0, 0, 0, 1, 1,
-0.8887627, -0.4113007, -3.251793, 0, 0, 0, 1, 1,
-0.8854678, -0.8520893, -3.226946, 0, 0, 0, 1, 1,
-0.8854492, 0.05530718, -0.6849256, 1, 1, 1, 1, 1,
-0.8832844, -0.3485019, -0.4673913, 1, 1, 1, 1, 1,
-0.8828825, -1.362119, -2.33891, 1, 1, 1, 1, 1,
-0.8752832, 0.7575541, 0.03084138, 1, 1, 1, 1, 1,
-0.8747895, -0.145659, -3.38331, 1, 1, 1, 1, 1,
-0.8572918, -1.162676, -3.484221, 1, 1, 1, 1, 1,
-0.8534545, 0.6389909, -2.089324, 1, 1, 1, 1, 1,
-0.8528792, 0.7298242, 0.3115397, 1, 1, 1, 1, 1,
-0.8455729, 0.8291897, 2.058605, 1, 1, 1, 1, 1,
-0.8379231, 2.676584, 0.9097668, 1, 1, 1, 1, 1,
-0.8372885, 1.256558, 1.469446, 1, 1, 1, 1, 1,
-0.8372869, 0.02353611, -2.054067, 1, 1, 1, 1, 1,
-0.835246, -0.2171965, -1.904525, 1, 1, 1, 1, 1,
-0.8274288, 0.8317243, 0.4611637, 1, 1, 1, 1, 1,
-0.8260612, 0.1568762, -0.9208037, 1, 1, 1, 1, 1,
-0.8259454, 0.9925225, -1.462682, 0, 0, 1, 1, 1,
-0.8249291, -0.6828276, -1.232222, 1, 0, 0, 1, 1,
-0.8239807, 0.9464792, -0.5525471, 1, 0, 0, 1, 1,
-0.8228961, -0.9910092, -2.113765, 1, 0, 0, 1, 1,
-0.8218128, -0.5607482, -2.135753, 1, 0, 0, 1, 1,
-0.8181207, 0.9583842, -1.447915, 1, 0, 0, 1, 1,
-0.8162794, -0.2597101, -2.789862, 0, 0, 0, 1, 1,
-0.8034669, 1.542572, -0.576514, 0, 0, 0, 1, 1,
-0.8001359, 0.7895131, 0.6750063, 0, 0, 0, 1, 1,
-0.7985293, 0.5018197, -1.503349, 0, 0, 0, 1, 1,
-0.7893903, -0.1459784, -1.465879, 0, 0, 0, 1, 1,
-0.786418, 1.409113, 0.3272861, 0, 0, 0, 1, 1,
-0.7805277, -1.336993, -1.098359, 0, 0, 0, 1, 1,
-0.7721662, 0.5651658, -1.745105, 1, 1, 1, 1, 1,
-0.7695113, -0.1199864, -3.365093, 1, 1, 1, 1, 1,
-0.7673082, -0.7445109, -1.066456, 1, 1, 1, 1, 1,
-0.7638479, -1.507218, -2.035517, 1, 1, 1, 1, 1,
-0.762971, 2.530549, -0.8117833, 1, 1, 1, 1, 1,
-0.7609738, 0.08075441, -0.9417716, 1, 1, 1, 1, 1,
-0.7567229, 1.468078, -1.783196, 1, 1, 1, 1, 1,
-0.7551739, 0.4445648, -1.431612, 1, 1, 1, 1, 1,
-0.7547488, 0.316757, -2.64565, 1, 1, 1, 1, 1,
-0.749871, 0.7974177, -0.05681387, 1, 1, 1, 1, 1,
-0.7498168, 1.383836, -2.160418, 1, 1, 1, 1, 1,
-0.7466007, 0.09072246, -0.2220034, 1, 1, 1, 1, 1,
-0.7432784, 1.740561, 0.6813503, 1, 1, 1, 1, 1,
-0.7400959, 0.9825081, -1.319356, 1, 1, 1, 1, 1,
-0.7377034, 2.295018, -0.5428376, 1, 1, 1, 1, 1,
-0.7367846, 0.7163786, -1.068058, 0, 0, 1, 1, 1,
-0.7289989, -0.4113761, -3.471434, 1, 0, 0, 1, 1,
-0.7283334, 0.6338122, -1.703504, 1, 0, 0, 1, 1,
-0.720637, -1.362459, -1.606499, 1, 0, 0, 1, 1,
-0.719707, 1.103251, -0.2627267, 1, 0, 0, 1, 1,
-0.7195274, -1.153919, -3.441044, 1, 0, 0, 1, 1,
-0.7183047, -2.285788, -3.098728, 0, 0, 0, 1, 1,
-0.7163688, -2.248406, -3.252393, 0, 0, 0, 1, 1,
-0.7113084, 0.6030781, -0.02531418, 0, 0, 0, 1, 1,
-0.7097653, -2.40484, -3.269498, 0, 0, 0, 1, 1,
-0.7053029, 1.636948, -1.057195, 0, 0, 0, 1, 1,
-0.7014003, -1.085074, -3.267039, 0, 0, 0, 1, 1,
-0.6998838, -0.4008779, -1.740635, 0, 0, 0, 1, 1,
-0.6969166, 1.162255, -0.5020441, 1, 1, 1, 1, 1,
-0.6901416, 0.366267, -0.5522991, 1, 1, 1, 1, 1,
-0.6799816, -0.7902033, -0.492898, 1, 1, 1, 1, 1,
-0.6795941, -0.957882, -2.382038, 1, 1, 1, 1, 1,
-0.6659698, -0.1008975, -3.459605, 1, 1, 1, 1, 1,
-0.6628156, 0.7592189, -2.214044, 1, 1, 1, 1, 1,
-0.65372, 0.01084533, -1.067903, 1, 1, 1, 1, 1,
-0.6491889, -0.8714759, -3.052193, 1, 1, 1, 1, 1,
-0.6467211, 1.886577, -2.083157, 1, 1, 1, 1, 1,
-0.6421372, -0.4150164, -1.315281, 1, 1, 1, 1, 1,
-0.6402965, 1.333243, -0.05109446, 1, 1, 1, 1, 1,
-0.6395296, -0.3300414, -1.388884, 1, 1, 1, 1, 1,
-0.6390516, 1.849041, 0.1678249, 1, 1, 1, 1, 1,
-0.638711, 0.5835201, -0.5939837, 1, 1, 1, 1, 1,
-0.6373529, -0.2554141, -1.168592, 1, 1, 1, 1, 1,
-0.6371394, 2.358374, -0.2602069, 0, 0, 1, 1, 1,
-0.6328027, 0.9242291, 0.6141853, 1, 0, 0, 1, 1,
-0.6317118, -1.372829, -2.941612, 1, 0, 0, 1, 1,
-0.6290346, -0.6463908, -2.146559, 1, 0, 0, 1, 1,
-0.6244503, -0.4674597, -2.485078, 1, 0, 0, 1, 1,
-0.6200315, -0.5859689, -2.416427, 1, 0, 0, 1, 1,
-0.6156185, 0.3988844, -0.04772656, 0, 0, 0, 1, 1,
-0.6112013, 0.3873681, -0.7245671, 0, 0, 0, 1, 1,
-0.6090129, -1.549129, -3.62622, 0, 0, 0, 1, 1,
-0.6089967, 1.117761, -0.1788742, 0, 0, 0, 1, 1,
-0.6048778, 0.4888065, 0.546142, 0, 0, 0, 1, 1,
-0.6045105, -0.01006146, -0.5526857, 0, 0, 0, 1, 1,
-0.6032996, -0.7285749, -2.009523, 0, 0, 0, 1, 1,
-0.6017025, 1.032209, 0.4503055, 1, 1, 1, 1, 1,
-0.5921274, 0.4087682, -0.2370107, 1, 1, 1, 1, 1,
-0.5910557, -0.7546152, -1.751063, 1, 1, 1, 1, 1,
-0.5797375, -0.3913402, -2.165427, 1, 1, 1, 1, 1,
-0.5778237, -0.7167473, -3.088219, 1, 1, 1, 1, 1,
-0.5758551, 2.134907, -1.354244, 1, 1, 1, 1, 1,
-0.5718653, 1.39434, -0.5609644, 1, 1, 1, 1, 1,
-0.5689654, 0.2588847, -1.421851, 1, 1, 1, 1, 1,
-0.5688626, -0.371491, -2.030765, 1, 1, 1, 1, 1,
-0.5684582, 1.119512, -1.148016, 1, 1, 1, 1, 1,
-0.5668607, 0.7418223, 0.1346111, 1, 1, 1, 1, 1,
-0.5648178, -2.351267, -2.919205, 1, 1, 1, 1, 1,
-0.5636828, 0.1067363, -0.1284993, 1, 1, 1, 1, 1,
-0.5634756, 0.5371125, -0.4726603, 1, 1, 1, 1, 1,
-0.5621481, 0.1568632, -2.163644, 1, 1, 1, 1, 1,
-0.5620785, 0.7707558, -1.478293, 0, 0, 1, 1, 1,
-0.5585801, -1.016639, -3.910776, 1, 0, 0, 1, 1,
-0.5560166, 0.4349746, -0.8829805, 1, 0, 0, 1, 1,
-0.5533506, -0.05788856, -2.097642, 1, 0, 0, 1, 1,
-0.5503216, 0.2833752, -2.038563, 1, 0, 0, 1, 1,
-0.5480134, -1.456007, -1.871696, 1, 0, 0, 1, 1,
-0.5399538, 0.3813933, 0.8573644, 0, 0, 0, 1, 1,
-0.5328351, 0.2048609, -2.690647, 0, 0, 0, 1, 1,
-0.5323696, 0.07889578, -0.9633552, 0, 0, 0, 1, 1,
-0.5322872, -0.06051585, -1.290191, 0, 0, 0, 1, 1,
-0.5295451, 0.8534695, -0.1969816, 0, 0, 0, 1, 1,
-0.5155005, 2.412859, 1.527735, 0, 0, 0, 1, 1,
-0.508731, 0.1479594, -0.7632628, 0, 0, 0, 1, 1,
-0.5060492, -1.301683, -2.445986, 1, 1, 1, 1, 1,
-0.5043032, -0.0542007, -2.622512, 1, 1, 1, 1, 1,
-0.5037274, -0.1188568, -2.27483, 1, 1, 1, 1, 1,
-0.5032132, -0.1800599, -3.911881, 1, 1, 1, 1, 1,
-0.4968733, 1.028893, 1.298598, 1, 1, 1, 1, 1,
-0.4935499, 0.4428347, -0.6652399, 1, 1, 1, 1, 1,
-0.4920225, 0.4973273, -0.9421657, 1, 1, 1, 1, 1,
-0.4903866, 0.09798487, -1.038031, 1, 1, 1, 1, 1,
-0.4880432, -1.11368, -1.97036, 1, 1, 1, 1, 1,
-0.4878781, 0.2851243, -0.01153375, 1, 1, 1, 1, 1,
-0.4810547, -1.475253, -3.70898, 1, 1, 1, 1, 1,
-0.4799268, 1.332445, 0.3968774, 1, 1, 1, 1, 1,
-0.4795327, -0.322796, -2.299013, 1, 1, 1, 1, 1,
-0.4740955, 0.2091297, -2.065861, 1, 1, 1, 1, 1,
-0.472418, -0.1378993, -2.178065, 1, 1, 1, 1, 1,
-0.4705667, 0.7828078, -1.356903, 0, 0, 1, 1, 1,
-0.4700031, -1.164219, -1.112688, 1, 0, 0, 1, 1,
-0.4694912, -1.023183, -2.472713, 1, 0, 0, 1, 1,
-0.4678048, -0.5198475, -1.857446, 1, 0, 0, 1, 1,
-0.4657413, 0.8865861, -0.03384452, 1, 0, 0, 1, 1,
-0.4650906, -1.041919, -2.139383, 1, 0, 0, 1, 1,
-0.4592135, 0.1554173, -0.1839977, 0, 0, 0, 1, 1,
-0.4567391, 0.7601984, -1.358091, 0, 0, 0, 1, 1,
-0.4468545, 0.4411577, -1.201668, 0, 0, 0, 1, 1,
-0.4468012, 0.6216089, -1.793866, 0, 0, 0, 1, 1,
-0.4467821, 2.00371, -0.6066314, 0, 0, 0, 1, 1,
-0.4467052, -0.8623321, -0.9943255, 0, 0, 0, 1, 1,
-0.4451962, 0.1235615, -2.04328, 0, 0, 0, 1, 1,
-0.4439715, 0.1475319, -0.8977945, 1, 1, 1, 1, 1,
-0.4436371, -0.5708681, -2.824621, 1, 1, 1, 1, 1,
-0.4425447, 0.5599676, -1.196799, 1, 1, 1, 1, 1,
-0.440329, -1.182871, -2.347776, 1, 1, 1, 1, 1,
-0.4397709, -0.7955295, -3.019655, 1, 1, 1, 1, 1,
-0.4382824, -0.03141218, -2.719656, 1, 1, 1, 1, 1,
-0.434751, -2.01406, -3.851238, 1, 1, 1, 1, 1,
-0.4324656, -0.1664256, -2.245362, 1, 1, 1, 1, 1,
-0.4314899, 1.917246, -1.349048, 1, 1, 1, 1, 1,
-0.4308855, -0.398756, 0.3501278, 1, 1, 1, 1, 1,
-0.4302342, -0.8464025, -2.589833, 1, 1, 1, 1, 1,
-0.4224724, -0.2754224, -1.051813, 1, 1, 1, 1, 1,
-0.4219369, -1.483824, -2.614532, 1, 1, 1, 1, 1,
-0.4213152, 0.5007012, -1.691137, 1, 1, 1, 1, 1,
-0.419461, -0.1489866, -0.492509, 1, 1, 1, 1, 1,
-0.4187401, -0.4333255, -2.573365, 0, 0, 1, 1, 1,
-0.416707, -0.3199531, -3.196971, 1, 0, 0, 1, 1,
-0.4121265, -2.22221, -3.537606, 1, 0, 0, 1, 1,
-0.4096326, -0.5695504, -3.446699, 1, 0, 0, 1, 1,
-0.4087211, -0.4518845, -3.312317, 1, 0, 0, 1, 1,
-0.4048272, 0.3370265, -1.75877, 1, 0, 0, 1, 1,
-0.4012267, -1.521584, -2.526177, 0, 0, 0, 1, 1,
-0.4003705, 0.1594494, -1.059245, 0, 0, 0, 1, 1,
-0.4001983, 0.7279969, -1.444244, 0, 0, 0, 1, 1,
-0.3978858, -2.294114, -3.245417, 0, 0, 0, 1, 1,
-0.3900306, -1.186517, -2.298816, 0, 0, 0, 1, 1,
-0.3892248, 1.428147, -0.3839189, 0, 0, 0, 1, 1,
-0.388939, 0.7277502, -1.903313, 0, 0, 0, 1, 1,
-0.3875392, -0.5886055, -2.773226, 1, 1, 1, 1, 1,
-0.3851042, 1.01064, -0.2854088, 1, 1, 1, 1, 1,
-0.3841838, -0.5455511, -1.992023, 1, 1, 1, 1, 1,
-0.3820323, 0.09195953, -2.186452, 1, 1, 1, 1, 1,
-0.3751918, -0.06465403, -3.60495, 1, 1, 1, 1, 1,
-0.3741174, -0.2313946, -2.82052, 1, 1, 1, 1, 1,
-0.3670759, 0.6988367, -0.1080732, 1, 1, 1, 1, 1,
-0.3666033, -1.622304, -2.96107, 1, 1, 1, 1, 1,
-0.3651715, 1.089451, -0.8719038, 1, 1, 1, 1, 1,
-0.36488, 0.9380481, -0.3889112, 1, 1, 1, 1, 1,
-0.362098, 0.57291, -2.01336, 1, 1, 1, 1, 1,
-0.3619846, -0.08361042, -0.4553817, 1, 1, 1, 1, 1,
-0.3606658, 0.1667096, -2.121886, 1, 1, 1, 1, 1,
-0.3515885, 0.1858224, -1.812142, 1, 1, 1, 1, 1,
-0.3515667, -0.7128286, -1.414025, 1, 1, 1, 1, 1,
-0.3503233, -0.1249526, -2.868162, 0, 0, 1, 1, 1,
-0.3494675, 0.0303756, -1.706141, 1, 0, 0, 1, 1,
-0.3494542, -0.02092002, -1.285467, 1, 0, 0, 1, 1,
-0.3479022, -1.081505, -2.547678, 1, 0, 0, 1, 1,
-0.3474241, -1.302958, -2.851691, 1, 0, 0, 1, 1,
-0.3457776, -1.890658, -3.374055, 1, 0, 0, 1, 1,
-0.3431822, -1.52409, -4.789053, 0, 0, 0, 1, 1,
-0.3430089, 0.4469836, -0.5335191, 0, 0, 0, 1, 1,
-0.342822, 1.140538, 0.6659532, 0, 0, 0, 1, 1,
-0.3416975, 0.6732599, 0.03452322, 0, 0, 0, 1, 1,
-0.3415492, 0.3010292, -1.548519, 0, 0, 0, 1, 1,
-0.3413668, 0.377397, -1.287366, 0, 0, 0, 1, 1,
-0.3412284, -1.057545, -3.355715, 0, 0, 0, 1, 1,
-0.3394491, -1.519719, -2.461177, 1, 1, 1, 1, 1,
-0.3359948, 1.039467, 2.011468, 1, 1, 1, 1, 1,
-0.3345701, 0.5558878, -0.8789443, 1, 1, 1, 1, 1,
-0.3257893, 0.8198748, -0.04159058, 1, 1, 1, 1, 1,
-0.3255869, -0.8422968, -1.910429, 1, 1, 1, 1, 1,
-0.321935, 1.961217, -0.7256095, 1, 1, 1, 1, 1,
-0.3174058, -1.173306, -2.040108, 1, 1, 1, 1, 1,
-0.3083887, 0.3434188, 0.6321476, 1, 1, 1, 1, 1,
-0.3074843, 1.043201, -2.204704, 1, 1, 1, 1, 1,
-0.3027777, 0.7497627, 0.110928, 1, 1, 1, 1, 1,
-0.3025328, 0.1357901, -0.3064888, 1, 1, 1, 1, 1,
-0.3018901, 0.1929982, -1.831558, 1, 1, 1, 1, 1,
-0.3017057, -0.4347821, -1.495288, 1, 1, 1, 1, 1,
-0.301498, -0.3042502, -1.729541, 1, 1, 1, 1, 1,
-0.3000291, 0.8225414, -0.5762774, 1, 1, 1, 1, 1,
-0.299013, -1.008872, -2.85127, 0, 0, 1, 1, 1,
-0.2903838, -0.4120973, -1.673315, 1, 0, 0, 1, 1,
-0.2899762, 0.5245232, -1.266417, 1, 0, 0, 1, 1,
-0.2889729, 0.3889425, -0.4608652, 1, 0, 0, 1, 1,
-0.2887237, -0.1483947, -1.396651, 1, 0, 0, 1, 1,
-0.2857777, 0.7037236, -0.4593636, 1, 0, 0, 1, 1,
-0.2848453, -0.6541296, -5.640109, 0, 0, 0, 1, 1,
-0.2830575, -1.327682, -1.855762, 0, 0, 0, 1, 1,
-0.2754999, 1.657923, 0.817643, 0, 0, 0, 1, 1,
-0.2735706, 0.4314018, -0.01970223, 0, 0, 0, 1, 1,
-0.272287, -0.7699325, -2.742995, 0, 0, 0, 1, 1,
-0.2720308, 1.186056, -1.995802, 0, 0, 0, 1, 1,
-0.2671925, 0.3403853, -0.08573524, 0, 0, 0, 1, 1,
-0.26611, -0.3856622, -0.9111739, 1, 1, 1, 1, 1,
-0.2657249, -0.7718586, -3.140885, 1, 1, 1, 1, 1,
-0.263978, -1.170097, -4.088388, 1, 1, 1, 1, 1,
-0.2628798, -0.4051113, -2.962179, 1, 1, 1, 1, 1,
-0.2610039, -0.2991865, -4.484888, 1, 1, 1, 1, 1,
-0.2568808, -2.342001, -3.130204, 1, 1, 1, 1, 1,
-0.2555192, 0.3245752, 1.172986, 1, 1, 1, 1, 1,
-0.249906, 0.1917607, -1.380185, 1, 1, 1, 1, 1,
-0.2464674, 0.02078638, -0.9959789, 1, 1, 1, 1, 1,
-0.2455191, 0.529778, -1.197671, 1, 1, 1, 1, 1,
-0.2448784, -0.6323044, -3.570532, 1, 1, 1, 1, 1,
-0.2424356, 1.065434, 0.3136143, 1, 1, 1, 1, 1,
-0.2409166, 1.73352, 0.4624326, 1, 1, 1, 1, 1,
-0.2388513, -1.928754, -3.673878, 1, 1, 1, 1, 1,
-0.2366099, -0.9819546, -4.217606, 1, 1, 1, 1, 1,
-0.2292323, -1.157699, -3.237577, 0, 0, 1, 1, 1,
-0.2289312, 0.9462816, -1.32552, 1, 0, 0, 1, 1,
-0.2249312, 2.208174, -1.53024, 1, 0, 0, 1, 1,
-0.22297, -0.6444257, -1.913415, 1, 0, 0, 1, 1,
-0.2181216, 0.02904926, -1.163597, 1, 0, 0, 1, 1,
-0.2177614, 0.9264495, -0.20969, 1, 0, 0, 1, 1,
-0.210931, 1.141537, 1.273651, 0, 0, 0, 1, 1,
-0.2103046, 1.405809, -0.1408683, 0, 0, 0, 1, 1,
-0.2097295, 0.723195, 1.086653, 0, 0, 0, 1, 1,
-0.2085082, -1.24504, -2.197272, 0, 0, 0, 1, 1,
-0.1999677, -1.120664, -2.05066, 0, 0, 0, 1, 1,
-0.1997806, 0.3554285, -0.8413634, 0, 0, 0, 1, 1,
-0.1899057, 0.6930076, 0.606396, 0, 0, 0, 1, 1,
-0.1863208, 0.9468961, -0.1910145, 1, 1, 1, 1, 1,
-0.1828453, -0.2746003, -4.713387, 1, 1, 1, 1, 1,
-0.1805556, -1.234407, -2.117796, 1, 1, 1, 1, 1,
-0.1761179, 0.07977816, -0.3793149, 1, 1, 1, 1, 1,
-0.1683862, 1.866904, -0.5451714, 1, 1, 1, 1, 1,
-0.1602956, -0.3791279, -2.401443, 1, 1, 1, 1, 1,
-0.1572405, 0.9047431, -1.115523, 1, 1, 1, 1, 1,
-0.1558144, -1.479574, -3.239906, 1, 1, 1, 1, 1,
-0.1545741, 1.326949, -0.2261442, 1, 1, 1, 1, 1,
-0.1471296, 1.66663, 0.3188514, 1, 1, 1, 1, 1,
-0.1440453, -1.356085, -1.755609, 1, 1, 1, 1, 1,
-0.1416887, 0.2257192, -0.4791578, 1, 1, 1, 1, 1,
-0.1373783, 2.322742, -1.196104, 1, 1, 1, 1, 1,
-0.1346117, 1.551983, -1.085396, 1, 1, 1, 1, 1,
-0.1329558, 0.9213259, 0.06441753, 1, 1, 1, 1, 1,
-0.132061, -2.745051, -2.753706, 0, 0, 1, 1, 1,
-0.1302467, 0.9155009, -0.6636025, 1, 0, 0, 1, 1,
-0.1278685, -0.5741588, -0.4632869, 1, 0, 0, 1, 1,
-0.1220409, 0.08906338, 0.3712018, 1, 0, 0, 1, 1,
-0.1187454, -0.1296996, 0.04127204, 1, 0, 0, 1, 1,
-0.1171751, 0.4692445, -1.303666, 1, 0, 0, 1, 1,
-0.1167011, 1.404738, 0.9291792, 0, 0, 0, 1, 1,
-0.1120693, 0.1765765, 1.611045, 0, 0, 0, 1, 1,
-0.1113752, -0.9295216, -4.578462, 0, 0, 0, 1, 1,
-0.1066481, -1.017083, -3.907738, 0, 0, 0, 1, 1,
-0.1060054, -0.9275692, -4.843714, 0, 0, 0, 1, 1,
-0.1043304, -0.1069259, -1.128856, 0, 0, 0, 1, 1,
-0.1006709, -0.243528, -3.795268, 0, 0, 0, 1, 1,
-0.0967825, -1.954403, -3.634144, 1, 1, 1, 1, 1,
-0.09344035, 3.035857, 1.096323, 1, 1, 1, 1, 1,
-0.09099098, -1.091576, -4.252625, 1, 1, 1, 1, 1,
-0.09036241, -0.7716318, -2.337882, 1, 1, 1, 1, 1,
-0.08566853, -0.6609488, -4.846049, 1, 1, 1, 1, 1,
-0.07978781, -0.2350218, -5.256658, 1, 1, 1, 1, 1,
-0.07839353, 0.5674459, 0.5247416, 1, 1, 1, 1, 1,
-0.07639582, 0.4273604, -2.736396, 1, 1, 1, 1, 1,
-0.07433464, -0.7235656, -3.708279, 1, 1, 1, 1, 1,
-0.07255979, -0.4029159, -3.26874, 1, 1, 1, 1, 1,
-0.07218815, 0.312903, 0.5336291, 1, 1, 1, 1, 1,
-0.07210332, -0.4068092, -1.312031, 1, 1, 1, 1, 1,
-0.06930579, -0.8533709, -2.237461, 1, 1, 1, 1, 1,
-0.06896012, 0.1424949, -1.446544, 1, 1, 1, 1, 1,
-0.06828395, -0.6960682, -2.992761, 1, 1, 1, 1, 1,
-0.06696769, -1.880456, -2.295878, 0, 0, 1, 1, 1,
-0.06319147, -1.543342, -2.619996, 1, 0, 0, 1, 1,
-0.0606912, -1.468985, -3.179826, 1, 0, 0, 1, 1,
-0.06027097, 1.530175, 2.387086, 1, 0, 0, 1, 1,
-0.05766733, 1.67837, 0.05110711, 1, 0, 0, 1, 1,
-0.05733752, -0.4619784, -3.060685, 1, 0, 0, 1, 1,
-0.0561468, -0.4093292, -1.664359, 0, 0, 0, 1, 1,
-0.05589437, 0.9753523, -0.6473885, 0, 0, 0, 1, 1,
-0.05164595, -0.7511773, -4.219093, 0, 0, 0, 1, 1,
-0.04519346, 0.1117659, 0.366497, 0, 0, 0, 1, 1,
-0.0424348, -0.04904221, -1.363155, 0, 0, 0, 1, 1,
-0.03873387, -0.8069027, -2.316939, 0, 0, 0, 1, 1,
-0.03739644, 0.101913, 0.1144128, 0, 0, 0, 1, 1,
-0.03712257, 0.5997686, -0.5823255, 1, 1, 1, 1, 1,
-0.035369, -1.314281, -4.159528, 1, 1, 1, 1, 1,
-0.03533641, 0.05367297, -1.192488, 1, 1, 1, 1, 1,
-0.03465611, -0.3656037, -2.35141, 1, 1, 1, 1, 1,
-0.03417459, -1.268011, -3.048613, 1, 1, 1, 1, 1,
-0.03026844, 0.01245788, -1.352955, 1, 1, 1, 1, 1,
-0.02457651, 0.5318984, -0.871565, 1, 1, 1, 1, 1,
-0.02015663, 0.04086713, -1.434642, 1, 1, 1, 1, 1,
-0.01690576, -0.4955821, -5.481495, 1, 1, 1, 1, 1,
-0.01456438, -0.5028379, -4.531643, 1, 1, 1, 1, 1,
-0.01190424, -0.1599805, -2.234801, 1, 1, 1, 1, 1,
-0.007879561, -0.34329, -4.326327, 1, 1, 1, 1, 1,
-0.003502254, 0.3835309, 2.421227, 1, 1, 1, 1, 1,
0.0006311679, -1.200324, 3.867463, 1, 1, 1, 1, 1,
0.003549391, 0.5911092, 0.9650554, 1, 1, 1, 1, 1,
0.005502014, -1.002526, 1.335008, 0, 0, 1, 1, 1,
0.005526813, -0.311489, 2.764889, 1, 0, 0, 1, 1,
0.007910755, 0.4796607, -1.485587, 1, 0, 0, 1, 1,
0.008733807, -0.9624199, 3.525311, 1, 0, 0, 1, 1,
0.009530344, -0.8530138, 2.972996, 1, 0, 0, 1, 1,
0.009965529, -1.921734, 2.184458, 1, 0, 0, 1, 1,
0.01101919, -0.06563415, 1.946107, 0, 0, 0, 1, 1,
0.01299666, -1.819483, 2.881598, 0, 0, 0, 1, 1,
0.01302287, 0.5156806, 2.935048, 0, 0, 0, 1, 1,
0.01422781, -0.04656118, 4.18688, 0, 0, 0, 1, 1,
0.01835466, 0.1948681, 0.4971396, 0, 0, 0, 1, 1,
0.0186491, 1.733689, -2.521591, 0, 0, 0, 1, 1,
0.02016581, 0.01363501, 1.224819, 0, 0, 0, 1, 1,
0.02142863, 0.2459481, -1.161404, 1, 1, 1, 1, 1,
0.02460513, 0.3318725, 0.1712511, 1, 1, 1, 1, 1,
0.02467484, 0.5704781, 2.341192, 1, 1, 1, 1, 1,
0.02568095, -0.4727862, 2.992943, 1, 1, 1, 1, 1,
0.02852504, 1.392688, 0.3408329, 1, 1, 1, 1, 1,
0.03163875, -0.5818245, 1.327994, 1, 1, 1, 1, 1,
0.03330084, 0.4151185, -0.5725899, 1, 1, 1, 1, 1,
0.03446535, 0.2038255, -0.4894927, 1, 1, 1, 1, 1,
0.0373515, -0.4352228, 3.694777, 1, 1, 1, 1, 1,
0.04099374, 0.1918973, 0.5485535, 1, 1, 1, 1, 1,
0.04106111, -0.6062514, 4.130139, 1, 1, 1, 1, 1,
0.04186676, 0.6241531, -1.970602, 1, 1, 1, 1, 1,
0.0446719, -0.7576974, 3.392695, 1, 1, 1, 1, 1,
0.0453421, -0.5609094, 4.009449, 1, 1, 1, 1, 1,
0.05020978, 1.55938, 0.763412, 1, 1, 1, 1, 1,
0.05872715, -0.5819629, 2.652101, 0, 0, 1, 1, 1,
0.06272272, -0.3280038, 3.199594, 1, 0, 0, 1, 1,
0.06292077, -1.407871, 2.75283, 1, 0, 0, 1, 1,
0.06479188, 0.44864, -1.013191, 1, 0, 0, 1, 1,
0.07114302, 2.341308, 2.183141, 1, 0, 0, 1, 1,
0.08284795, -0.1760623, 3.463545, 1, 0, 0, 1, 1,
0.09041678, -0.25709, 4.174759, 0, 0, 0, 1, 1,
0.09551328, 0.3231192, 1.464354, 0, 0, 0, 1, 1,
0.09923212, -0.1761412, 2.909235, 0, 0, 0, 1, 1,
0.1004605, -0.7102792, 3.813823, 0, 0, 0, 1, 1,
0.1078093, -0.2508289, 2.848937, 0, 0, 0, 1, 1,
0.1125759, 0.4907012, 1.468964, 0, 0, 0, 1, 1,
0.1142675, 1.290352, 0.315928, 0, 0, 0, 1, 1,
0.1157593, 0.08789693, 1.154696, 1, 1, 1, 1, 1,
0.1237184, -0.6080973, 0.6467966, 1, 1, 1, 1, 1,
0.1323213, 0.7741537, 1.519496, 1, 1, 1, 1, 1,
0.1331946, -0.7417525, 2.784052, 1, 1, 1, 1, 1,
0.1338683, -0.3578237, 0.2516339, 1, 1, 1, 1, 1,
0.1391879, -0.5608743, 2.300145, 1, 1, 1, 1, 1,
0.1413355, -0.8388903, 3.780047, 1, 1, 1, 1, 1,
0.1419758, -0.05821691, 2.708513, 1, 1, 1, 1, 1,
0.1431955, 0.5279663, -0.772344, 1, 1, 1, 1, 1,
0.1474144, 1.744828, 1.834846, 1, 1, 1, 1, 1,
0.1543979, -0.9960356, 2.54458, 1, 1, 1, 1, 1,
0.1550012, 0.4489017, 1.390602, 1, 1, 1, 1, 1,
0.1575115, 0.8116544, 1.140488, 1, 1, 1, 1, 1,
0.1642016, 0.6435654, 1.174569, 1, 1, 1, 1, 1,
0.1654206, 0.1909665, 0.4371141, 1, 1, 1, 1, 1,
0.1675905, 1.419819, -0.7460942, 0, 0, 1, 1, 1,
0.1730193, -0.7114683, 1.392844, 1, 0, 0, 1, 1,
0.1735421, -1.357114, 2.679179, 1, 0, 0, 1, 1,
0.1779511, -0.3080485, 1.876603, 1, 0, 0, 1, 1,
0.1783758, 0.6269217, 0.08325519, 1, 0, 0, 1, 1,
0.1804407, 0.3904884, 1.151665, 1, 0, 0, 1, 1,
0.1843532, 1.860201, -1.660522, 0, 0, 0, 1, 1,
0.1855934, -0.1568581, 0.9312342, 0, 0, 0, 1, 1,
0.1856848, -2.017748, 3.149662, 0, 0, 0, 1, 1,
0.1900821, 1.113762, 0.130119, 0, 0, 0, 1, 1,
0.1901224, -0.7600533, 2.083946, 0, 0, 0, 1, 1,
0.1933956, 1.748959, 0.7540414, 0, 0, 0, 1, 1,
0.1938857, 1.541551, -0.5182702, 0, 0, 0, 1, 1,
0.1953357, 0.01630144, 1.773044, 1, 1, 1, 1, 1,
0.1987002, 0.5952231, 0.4738721, 1, 1, 1, 1, 1,
0.1992913, 0.5460176, -0.4333119, 1, 1, 1, 1, 1,
0.2016673, 1.023245, -0.4837686, 1, 1, 1, 1, 1,
0.203517, 1.562288, -0.527217, 1, 1, 1, 1, 1,
0.2044121, 1.163945, 2.699726, 1, 1, 1, 1, 1,
0.2053369, 2.33637, -0.07466189, 1, 1, 1, 1, 1,
0.2068191, 0.3476741, -0.1735583, 1, 1, 1, 1, 1,
0.2079477, -1.081967, 2.549227, 1, 1, 1, 1, 1,
0.2084557, 0.4993773, 1.437891, 1, 1, 1, 1, 1,
0.210031, -0.9271912, 2.931225, 1, 1, 1, 1, 1,
0.2122076, 0.8028392, -2.049969, 1, 1, 1, 1, 1,
0.2178499, 0.4097942, 2.609242, 1, 1, 1, 1, 1,
0.2241444, -1.080674, 2.45726, 1, 1, 1, 1, 1,
0.2271329, 0.006220678, 1.6741, 1, 1, 1, 1, 1,
0.2274266, -0.2902263, 2.28515, 0, 0, 1, 1, 1,
0.2315748, 1.424495, 0.766901, 1, 0, 0, 1, 1,
0.2369966, 0.5137882, -0.8311267, 1, 0, 0, 1, 1,
0.2423565, -0.4850235, 4.043845, 1, 0, 0, 1, 1,
0.2424843, -0.928394, 3.109711, 1, 0, 0, 1, 1,
0.2507086, 0.754108, 2.267745, 1, 0, 0, 1, 1,
0.2520805, 0.406825, 0.03207784, 0, 0, 0, 1, 1,
0.2555837, 0.9885262, 0.4691068, 0, 0, 0, 1, 1,
0.2567356, -0.3451953, 0.879879, 0, 0, 0, 1, 1,
0.2611403, -1.005518, 4.504135, 0, 0, 0, 1, 1,
0.2612961, 0.09064324, 0.535892, 0, 0, 0, 1, 1,
0.2675788, -0.5131556, 3.667073, 0, 0, 0, 1, 1,
0.2694488, -0.9445672, 2.779341, 0, 0, 0, 1, 1,
0.2695628, -0.3599153, 0.9169594, 1, 1, 1, 1, 1,
0.2697882, -0.4898424, 2.101611, 1, 1, 1, 1, 1,
0.2756731, -1.077285, 1.957907, 1, 1, 1, 1, 1,
0.2787122, 0.3978631, 1.189345, 1, 1, 1, 1, 1,
0.2804336, -1.332002, 3.321929, 1, 1, 1, 1, 1,
0.2822207, 0.05586409, 2.180067, 1, 1, 1, 1, 1,
0.2838031, -0.4275385, 1.462432, 1, 1, 1, 1, 1,
0.2920242, 0.0172184, 1.373822, 1, 1, 1, 1, 1,
0.2973174, 0.3841601, -0.8450634, 1, 1, 1, 1, 1,
0.2986529, -0.9721487, 2.161995, 1, 1, 1, 1, 1,
0.3003062, -1.445884, 2.939446, 1, 1, 1, 1, 1,
0.3006417, -1.693467, 2.444423, 1, 1, 1, 1, 1,
0.3063039, 1.885375, 1.695569, 1, 1, 1, 1, 1,
0.3126091, -0.2806293, 1.307393, 1, 1, 1, 1, 1,
0.3162013, -1.801494, 2.362069, 1, 1, 1, 1, 1,
0.3202181, -1.467601, 2.484535, 0, 0, 1, 1, 1,
0.3206657, -0.3865926, 2.35844, 1, 0, 0, 1, 1,
0.3230307, -1.105963, 1.565427, 1, 0, 0, 1, 1,
0.3320814, 0.2042883, 2.631835, 1, 0, 0, 1, 1,
0.3367538, 1.069521, 0.04745267, 1, 0, 0, 1, 1,
0.3469188, 1.413382, -0.3466747, 1, 0, 0, 1, 1,
0.3491537, 0.3863682, 0.5852449, 0, 0, 0, 1, 1,
0.350418, -0.505016, 3.280072, 0, 0, 0, 1, 1,
0.3513052, -1.294584, 2.712119, 0, 0, 0, 1, 1,
0.3529708, -0.8631727, 4.770039, 0, 0, 0, 1, 1,
0.3563317, -1.482788, 3.086511, 0, 0, 0, 1, 1,
0.3632942, 0.04310462, 1.205304, 0, 0, 0, 1, 1,
0.3649275, 1.902975, -0.8489417, 0, 0, 0, 1, 1,
0.3650679, 1.030613, -0.5619642, 1, 1, 1, 1, 1,
0.3652548, 0.5494703, 1.110114, 1, 1, 1, 1, 1,
0.3696992, -1.441236, 2.12726, 1, 1, 1, 1, 1,
0.370112, -2.004195, 3.164215, 1, 1, 1, 1, 1,
0.3702208, 0.4778189, 1.678518, 1, 1, 1, 1, 1,
0.3733281, 1.49812, -0.5885912, 1, 1, 1, 1, 1,
0.3757133, 0.1375614, 1.815885, 1, 1, 1, 1, 1,
0.3768543, -2.490921, 3.840176, 1, 1, 1, 1, 1,
0.3785499, -0.3199449, 3.939089, 1, 1, 1, 1, 1,
0.3788823, -1.062967, 2.132563, 1, 1, 1, 1, 1,
0.3807387, -1.558918, 2.281691, 1, 1, 1, 1, 1,
0.3828806, -1.011891, 1.441682, 1, 1, 1, 1, 1,
0.3839103, -0.01343138, 0.2840394, 1, 1, 1, 1, 1,
0.3912449, 1.139155, 1.719373, 1, 1, 1, 1, 1,
0.3948417, 0.7253187, 0.02996003, 1, 1, 1, 1, 1,
0.4014156, 0.05788586, 2.600411, 0, 0, 1, 1, 1,
0.4051057, -0.44262, 3.02811, 1, 0, 0, 1, 1,
0.4063644, 0.06487348, 0.9673116, 1, 0, 0, 1, 1,
0.4084563, 0.1200123, 1.092731, 1, 0, 0, 1, 1,
0.408635, -0.3103018, 2.770522, 1, 0, 0, 1, 1,
0.4090672, 1.67776, 0.0922676, 1, 0, 0, 1, 1,
0.4193772, 0.9352192, 0.04555983, 0, 0, 0, 1, 1,
0.4338113, -0.8083002, 2.090203, 0, 0, 0, 1, 1,
0.4408365, -0.5816146, 1.802935, 0, 0, 0, 1, 1,
0.440916, -0.3743082, 1.585335, 0, 0, 0, 1, 1,
0.4423415, 0.3338473, -0.221231, 0, 0, 0, 1, 1,
0.4464345, -0.3359255, 2.134016, 0, 0, 0, 1, 1,
0.448082, -0.1980348, 2.121841, 0, 0, 0, 1, 1,
0.4512306, 0.1314408, 1.247809, 1, 1, 1, 1, 1,
0.4524314, 0.3566753, 2.593299, 1, 1, 1, 1, 1,
0.4588282, -1.019241, 3.148381, 1, 1, 1, 1, 1,
0.4617765, -0.1896479, 0.9176567, 1, 1, 1, 1, 1,
0.464002, -1.619707, 3.534212, 1, 1, 1, 1, 1,
0.4645555, 1.171754, 1.580241, 1, 1, 1, 1, 1,
0.4696995, 0.1014157, 1.475159, 1, 1, 1, 1, 1,
0.4703897, 1.716547, 1.156399, 1, 1, 1, 1, 1,
0.4712684, -2.778364, 4.329746, 1, 1, 1, 1, 1,
0.4723177, 0.535877, 0.4614273, 1, 1, 1, 1, 1,
0.4727535, -0.6394565, 2.051104, 1, 1, 1, 1, 1,
0.476562, -0.6725006, 2.559267, 1, 1, 1, 1, 1,
0.4769485, 1.083186, -1.30047, 1, 1, 1, 1, 1,
0.4782915, 0.2832434, -0.1146797, 1, 1, 1, 1, 1,
0.4818273, 0.8913946, 0.596965, 1, 1, 1, 1, 1,
0.4828692, 1.206579, 0.4498526, 0, 0, 1, 1, 1,
0.4841463, -1.671181, 2.315478, 1, 0, 0, 1, 1,
0.4863997, 0.003766548, 1.629368, 1, 0, 0, 1, 1,
0.4880293, 0.8906365, 1.126726, 1, 0, 0, 1, 1,
0.4882891, 0.4041049, 0.1804176, 1, 0, 0, 1, 1,
0.4914389, -0.6213426, 2.076419, 1, 0, 0, 1, 1,
0.4979673, 0.08296925, 1.908181, 0, 0, 0, 1, 1,
0.4997071, -0.08957062, 1.532608, 0, 0, 0, 1, 1,
0.5035785, -0.6397446, 2.264827, 0, 0, 0, 1, 1,
0.5039779, -0.5986104, 1.948424, 0, 0, 0, 1, 1,
0.5065786, 0.6570071, 2.786056, 0, 0, 0, 1, 1,
0.5086134, 0.3028452, 2.393967, 0, 0, 0, 1, 1,
0.5108093, -0.6694307, 2.752248, 0, 0, 0, 1, 1,
0.5119593, -1.237694, 2.478888, 1, 1, 1, 1, 1,
0.5128765, 0.3476773, 1.07133, 1, 1, 1, 1, 1,
0.5149083, -0.9847863, 3.0788, 1, 1, 1, 1, 1,
0.5166925, -2.165911, 2.488721, 1, 1, 1, 1, 1,
0.5167306, 0.8352508, 1.273585, 1, 1, 1, 1, 1,
0.5173294, -0.3579858, 1.904491, 1, 1, 1, 1, 1,
0.5200853, -1.504711, 3.042005, 1, 1, 1, 1, 1,
0.5216649, 0.06097383, 1.573422, 1, 1, 1, 1, 1,
0.5265272, -0.2475844, 2.880555, 1, 1, 1, 1, 1,
0.5302836, -1.422628, 3.014199, 1, 1, 1, 1, 1,
0.532106, 0.6645799, -0.2963284, 1, 1, 1, 1, 1,
0.5349318, 2.44876, 0.3931597, 1, 1, 1, 1, 1,
0.536768, -1.060665, 0.7059623, 1, 1, 1, 1, 1,
0.5426092, -1.273138, 3.772217, 1, 1, 1, 1, 1,
0.5455645, 0.1941598, 0.8984243, 1, 1, 1, 1, 1,
0.5462229, 0.004711113, 1.716015, 0, 0, 1, 1, 1,
0.556894, 1.728755, 1.578233, 1, 0, 0, 1, 1,
0.5584807, -0.8066575, 2.474245, 1, 0, 0, 1, 1,
0.5595133, -0.4237545, 1.728081, 1, 0, 0, 1, 1,
0.5595223, -1.583254, 2.074792, 1, 0, 0, 1, 1,
0.5624846, -1.370756, 2.726915, 1, 0, 0, 1, 1,
0.567012, -0.9945425, 1.202652, 0, 0, 0, 1, 1,
0.5695751, 1.012066, 0.07704563, 0, 0, 0, 1, 1,
0.5725396, -0.09664435, 2.2684, 0, 0, 0, 1, 1,
0.5795698, 2.408572, -0.4012665, 0, 0, 0, 1, 1,
0.5809946, -0.9901159, 2.407751, 0, 0, 0, 1, 1,
0.5812144, -0.2259634, 2.011372, 0, 0, 0, 1, 1,
0.5829808, 0.06561811, 1.518434, 0, 0, 0, 1, 1,
0.58338, -1.508368, 2.903661, 1, 1, 1, 1, 1,
0.5836115, -0.09289758, 2.048004, 1, 1, 1, 1, 1,
0.5846503, -0.6280655, 2.28016, 1, 1, 1, 1, 1,
0.58692, -0.5162624, 2.454623, 1, 1, 1, 1, 1,
0.5870689, 2.644649, 0.7932107, 1, 1, 1, 1, 1,
0.5876315, -0.3737641, 1.847043, 1, 1, 1, 1, 1,
0.5900632, 0.2969163, 0.705767, 1, 1, 1, 1, 1,
0.5953678, -0.4906579, 1.487605, 1, 1, 1, 1, 1,
0.5981139, -0.2008069, 2.31477, 1, 1, 1, 1, 1,
0.5996612, 0.6128508, 1.315853, 1, 1, 1, 1, 1,
0.6046252, -1.251576, 1.726335, 1, 1, 1, 1, 1,
0.6048747, 0.3430606, 1.60765, 1, 1, 1, 1, 1,
0.6054721, 0.07781009, 2.874116, 1, 1, 1, 1, 1,
0.6070926, 1.981977, 0.2639098, 1, 1, 1, 1, 1,
0.6091695, 1.713918, -2.109244, 1, 1, 1, 1, 1,
0.6125657, 0.4131614, 0.9805312, 0, 0, 1, 1, 1,
0.6128059, 0.673268, 3.29504, 1, 0, 0, 1, 1,
0.6129983, -0.8431886, 2.237199, 1, 0, 0, 1, 1,
0.6230961, 0.9680367, -0.30463, 1, 0, 0, 1, 1,
0.6252705, 0.5615239, -1.051501, 1, 0, 0, 1, 1,
0.6269451, -1.45178, 1.799642, 1, 0, 0, 1, 1,
0.6281433, 0.4669068, 0.3183008, 0, 0, 0, 1, 1,
0.6287161, 2.03591, 1.294769, 0, 0, 0, 1, 1,
0.6386191, 0.8180472, 1.742193, 0, 0, 0, 1, 1,
0.6407599, -2.090043, 2.582007, 0, 0, 0, 1, 1,
0.643322, 1.92907, -0.8477079, 0, 0, 0, 1, 1,
0.6439967, 1.749257, 1.835622, 0, 0, 0, 1, 1,
0.644743, -0.06343804, 1.100223, 0, 0, 0, 1, 1,
0.6448191, -0.5614101, 2.607662, 1, 1, 1, 1, 1,
0.6470885, -1.207806, 3.654768, 1, 1, 1, 1, 1,
0.6483208, -0.5551816, 2.019105, 1, 1, 1, 1, 1,
0.6501074, 0.07671101, 1.438649, 1, 1, 1, 1, 1,
0.6509756, 0.503617, -1.215773, 1, 1, 1, 1, 1,
0.6619365, 0.9508778, -0.5122328, 1, 1, 1, 1, 1,
0.6719736, -0.3769199, 4.006429, 1, 1, 1, 1, 1,
0.6756779, -1.614212, 3.609143, 1, 1, 1, 1, 1,
0.6796359, 0.5753328, 0.469764, 1, 1, 1, 1, 1,
0.6861792, -0.3178393, 3.49433, 1, 1, 1, 1, 1,
0.6878254, 0.1152067, 1.875155, 1, 1, 1, 1, 1,
0.6904517, 0.2781653, -0.3319342, 1, 1, 1, 1, 1,
0.6951714, 0.1453409, -0.1267786, 1, 1, 1, 1, 1,
0.6992721, 0.6853831, 2.501752, 1, 1, 1, 1, 1,
0.7001063, 0.04898277, 1.743406, 1, 1, 1, 1, 1,
0.7049869, -0.0550761, 1.018997, 0, 0, 1, 1, 1,
0.7069971, 0.1911703, 2.702078, 1, 0, 0, 1, 1,
0.7085128, 0.2710053, 0.05446014, 1, 0, 0, 1, 1,
0.7162026, 0.5927123, 0.02372567, 1, 0, 0, 1, 1,
0.7198614, -0.09783551, 3.531703, 1, 0, 0, 1, 1,
0.7250885, 0.5796178, -0.417469, 1, 0, 0, 1, 1,
0.7259101, -0.4585628, 3.141597, 0, 0, 0, 1, 1,
0.727993, -1.580781, 2.03564, 0, 0, 0, 1, 1,
0.7349619, -3.208687, 1.025319, 0, 0, 0, 1, 1,
0.7431087, 2.074853, 0.5465174, 0, 0, 0, 1, 1,
0.7440845, -2.494201, 2.19696, 0, 0, 0, 1, 1,
0.7448737, 1.717338, -0.2128651, 0, 0, 0, 1, 1,
0.7469873, -1.935698, 3.884463, 0, 0, 0, 1, 1,
0.7472814, -1.20846, 2.684525, 1, 1, 1, 1, 1,
0.7533304, 1.483827, 1.001764, 1, 1, 1, 1, 1,
0.7604837, -1.511737, 2.331244, 1, 1, 1, 1, 1,
0.76407, 1.04906, 3.373604, 1, 1, 1, 1, 1,
0.7667627, -1.079954, 3.965665, 1, 1, 1, 1, 1,
0.7714434, 0.4129702, 0.9793503, 1, 1, 1, 1, 1,
0.7730816, 1.042555, -0.1910222, 1, 1, 1, 1, 1,
0.7752091, -0.03149169, 0.191596, 1, 1, 1, 1, 1,
0.7796847, -0.4839006, 1.339664, 1, 1, 1, 1, 1,
0.7809385, -0.4557288, 1.009381, 1, 1, 1, 1, 1,
0.7827957, -1.569298, 2.328045, 1, 1, 1, 1, 1,
0.7849114, 1.741186, -0.8876843, 1, 1, 1, 1, 1,
0.7912156, 1.044511, -0.3394406, 1, 1, 1, 1, 1,
0.7977838, 0.1266178, 2.355574, 1, 1, 1, 1, 1,
0.7985007, -1.102385, 3.180071, 1, 1, 1, 1, 1,
0.7990239, 0.1632943, 1.141358, 0, 0, 1, 1, 1,
0.8023196, -0.5761317, 3.713931, 1, 0, 0, 1, 1,
0.8025686, 0.6966597, 0.8531693, 1, 0, 0, 1, 1,
0.8033582, 0.005499444, 4.192444, 1, 0, 0, 1, 1,
0.8066999, 0.2675275, 3.616558, 1, 0, 0, 1, 1,
0.8084042, 0.884354, 1.714962, 1, 0, 0, 1, 1,
0.8141271, -0.3763055, 1.266442, 0, 0, 0, 1, 1,
0.8150338, -0.1649503, 2.156534, 0, 0, 0, 1, 1,
0.8259935, 1.824388, 0.9995255, 0, 0, 0, 1, 1,
0.8293508, -0.7762753, 2.872705, 0, 0, 0, 1, 1,
0.8297209, -0.7738266, 1.576571, 0, 0, 0, 1, 1,
0.8297752, -0.7564788, 2.669367, 0, 0, 0, 1, 1,
0.83395, 0.01203523, 2.106347, 0, 0, 0, 1, 1,
0.8354832, 0.730769, 1.444792, 1, 1, 1, 1, 1,
0.8387377, -0.5618679, 2.640108, 1, 1, 1, 1, 1,
0.8389248, -0.2840264, 3.041405, 1, 1, 1, 1, 1,
0.8406365, 0.0768258, 2.780618, 1, 1, 1, 1, 1,
0.8424896, -2.660538, 1.461023, 1, 1, 1, 1, 1,
0.8435913, 0.2308886, 2.248244, 1, 1, 1, 1, 1,
0.8475582, 0.7310876, -1.192505, 1, 1, 1, 1, 1,
0.8504623, -0.810654, 3.017002, 1, 1, 1, 1, 1,
0.8543366, -0.6414863, 3.046345, 1, 1, 1, 1, 1,
0.855741, 1.467089, 0.3993738, 1, 1, 1, 1, 1,
0.8591765, -0.1625134, 1.992007, 1, 1, 1, 1, 1,
0.8668436, -0.2347209, -0.1127865, 1, 1, 1, 1, 1,
0.8713205, 0.4698756, 0.5132922, 1, 1, 1, 1, 1,
0.8725837, 1.307238, 1.410353, 1, 1, 1, 1, 1,
0.8739731, 0.07409741, 0.4633937, 1, 1, 1, 1, 1,
0.8750555, 0.8300548, 1.676989, 0, 0, 1, 1, 1,
0.8770741, -1.063736, 2.555021, 1, 0, 0, 1, 1,
0.8786731, 1.613, 0.7368709, 1, 0, 0, 1, 1,
0.8790449, -1.262858, 4.678219, 1, 0, 0, 1, 1,
0.879398, 1.684948, -0.4305134, 1, 0, 0, 1, 1,
0.8843356, 0.9507056, 1.741842, 1, 0, 0, 1, 1,
0.8916482, 1.308475, 0.3059537, 0, 0, 0, 1, 1,
0.8934698, -0.4485592, 1.327556, 0, 0, 0, 1, 1,
0.8953769, -0.5926536, 0.9771652, 0, 0, 0, 1, 1,
0.8959138, -1.073583, 1.895163, 0, 0, 0, 1, 1,
0.8971353, -1.11601, 2.656312, 0, 0, 0, 1, 1,
0.8976005, 0.06202855, 2.079273, 0, 0, 0, 1, 1,
0.898386, -0.192044, 1.07856, 0, 0, 0, 1, 1,
0.9023128, -0.2777582, 2.539779, 1, 1, 1, 1, 1,
0.9044928, 0.07645752, 0.1623758, 1, 1, 1, 1, 1,
0.9054787, 0.4334295, 0.2269973, 1, 1, 1, 1, 1,
0.9089019, -0.04576473, 0.3653634, 1, 1, 1, 1, 1,
0.9117748, -0.9324377, 2.828471, 1, 1, 1, 1, 1,
0.9214051, -1.146173, 2.786438, 1, 1, 1, 1, 1,
0.9406909, 0.6717837, 3.36905, 1, 1, 1, 1, 1,
0.9433868, 0.6584039, 0.8122506, 1, 1, 1, 1, 1,
0.9439406, 0.3358301, 0.3676676, 1, 1, 1, 1, 1,
0.9457362, -0.1145392, 1.936826, 1, 1, 1, 1, 1,
0.9463461, -0.06403881, 1.560963, 1, 1, 1, 1, 1,
0.9464386, -0.8888653, 0.9253342, 1, 1, 1, 1, 1,
0.9465622, -0.842128, 1.819336, 1, 1, 1, 1, 1,
0.9566339, 1.451785, -1.359984, 1, 1, 1, 1, 1,
0.9612203, 1.665568, -0.3673325, 1, 1, 1, 1, 1,
0.9677615, -1.760647, 2.171492, 0, 0, 1, 1, 1,
0.9716424, -0.3315364, 1.681392, 1, 0, 0, 1, 1,
0.9752008, -0.6213201, 2.115355, 1, 0, 0, 1, 1,
0.9778585, -1.421183, 0.2686846, 1, 0, 0, 1, 1,
0.9799547, -0.8803586, 3.348664, 1, 0, 0, 1, 1,
0.9826298, 0.9588082, 0.5743151, 1, 0, 0, 1, 1,
0.9871272, 0.1336771, 2.169352, 0, 0, 0, 1, 1,
0.9891696, 0.4533334, 0.8752761, 0, 0, 0, 1, 1,
0.9983718, -1.381571, 1.795939, 0, 0, 0, 1, 1,
0.9985794, -0.1801571, 1.396004, 0, 0, 0, 1, 1,
1.004062, 1.965686, 0.7476687, 0, 0, 0, 1, 1,
1.006793, 0.1018403, 1.536097, 0, 0, 0, 1, 1,
1.007406, -1.951826, 2.816871, 0, 0, 0, 1, 1,
1.007928, -0.4489225, 1.916228, 1, 1, 1, 1, 1,
1.009182, 1.307243, -0.1087144, 1, 1, 1, 1, 1,
1.025431, 1.376433, 1.129471, 1, 1, 1, 1, 1,
1.027043, -1.523682, 2.67801, 1, 1, 1, 1, 1,
1.027698, -0.4295236, 1.424986, 1, 1, 1, 1, 1,
1.040214, -0.1453637, 1.696842, 1, 1, 1, 1, 1,
1.046132, 0.5751457, 1.913908, 1, 1, 1, 1, 1,
1.061997, -0.118537, 1.456852, 1, 1, 1, 1, 1,
1.067873, -0.5120209, 0.3252882, 1, 1, 1, 1, 1,
1.092858, 1.532519, 0.2830163, 1, 1, 1, 1, 1,
1.10051, -0.8731464, 2.523506, 1, 1, 1, 1, 1,
1.102045, 0.7821845, 1.005396, 1, 1, 1, 1, 1,
1.111614, 0.5263657, 0.3745562, 1, 1, 1, 1, 1,
1.131483, -1.13537, 2.790794, 1, 1, 1, 1, 1,
1.135236, -0.4837078, 2.070422, 1, 1, 1, 1, 1,
1.136031, 0.6725607, -0.6898623, 0, 0, 1, 1, 1,
1.136742, -0.07787432, 1.588075, 1, 0, 0, 1, 1,
1.137413, 0.5783578, 1.689312, 1, 0, 0, 1, 1,
1.144988, -0.7360891, 2.847394, 1, 0, 0, 1, 1,
1.147423, -0.4485217, 1.126936, 1, 0, 0, 1, 1,
1.15382, 2.540527, 0.4165237, 1, 0, 0, 1, 1,
1.161081, -0.2067683, 0.02829946, 0, 0, 0, 1, 1,
1.170619, -0.4660143, 1.430951, 0, 0, 0, 1, 1,
1.17263, -0.4114612, 2.181066, 0, 0, 0, 1, 1,
1.175741, 0.2818581, 0.9128998, 0, 0, 0, 1, 1,
1.182033, -1.664882, 1.652958, 0, 0, 0, 1, 1,
1.182704, -0.1628419, 2.685213, 0, 0, 0, 1, 1,
1.186687, 2.834, 0.117742, 0, 0, 0, 1, 1,
1.192686, -1.434601, 4.082798, 1, 1, 1, 1, 1,
1.201064, 1.2324, -0.1391741, 1, 1, 1, 1, 1,
1.208516, 0.09975104, 1.027819, 1, 1, 1, 1, 1,
1.21027, 0.1550898, 2.194379, 1, 1, 1, 1, 1,
1.21038, -0.1794108, 3.606366, 1, 1, 1, 1, 1,
1.211272, -0.5357904, 2.198142, 1, 1, 1, 1, 1,
1.225276, 0.1667084, 1.359651, 1, 1, 1, 1, 1,
1.230854, -0.01852444, 2.722661, 1, 1, 1, 1, 1,
1.236933, -0.2916059, 2.344671, 1, 1, 1, 1, 1,
1.247113, -0.6027998, 0.7295197, 1, 1, 1, 1, 1,
1.248536, 0.6989304, 1.483475, 1, 1, 1, 1, 1,
1.250389, 0.04210633, 1.349907, 1, 1, 1, 1, 1,
1.260717, -1.683367, 1.625844, 1, 1, 1, 1, 1,
1.261644, -0.4576001, 1.991458, 1, 1, 1, 1, 1,
1.264571, -0.3828294, 2.435374, 1, 1, 1, 1, 1,
1.265413, -0.7584462, 2.389832, 0, 0, 1, 1, 1,
1.265725, 0.8257762, 1.688273, 1, 0, 0, 1, 1,
1.266426, -0.1337553, 1.091514, 1, 0, 0, 1, 1,
1.26974, 0.1941633, 0.5833339, 1, 0, 0, 1, 1,
1.283967, 0.4817747, 1.782349, 1, 0, 0, 1, 1,
1.286164, 2.055968, 0.5005555, 1, 0, 0, 1, 1,
1.311818, -1.345986, 2.148294, 0, 0, 0, 1, 1,
1.313866, -0.2052912, 3.888046, 0, 0, 0, 1, 1,
1.317244, 0.5527226, 2.338761, 0, 0, 0, 1, 1,
1.325914, 0.04132801, 0.4141001, 0, 0, 0, 1, 1,
1.332903, -0.6813692, 3.09303, 0, 0, 0, 1, 1,
1.338941, 0.07065328, 2.010749, 0, 0, 0, 1, 1,
1.342257, -1.771167, 3.278862, 0, 0, 0, 1, 1,
1.358648, 0.588016, 1.402124, 1, 1, 1, 1, 1,
1.36147, -1.023516, 1.169224, 1, 1, 1, 1, 1,
1.367174, -1.225492, 2.127262, 1, 1, 1, 1, 1,
1.37068, 0.1374185, 0.4025007, 1, 1, 1, 1, 1,
1.371158, 1.619322, 1.662488, 1, 1, 1, 1, 1,
1.374092, -0.3124304, 3.22337, 1, 1, 1, 1, 1,
1.383116, -0.2634493, 2.006199, 1, 1, 1, 1, 1,
1.383608, -0.6080477, 1.532246, 1, 1, 1, 1, 1,
1.384018, 0.02267541, 0.007645708, 1, 1, 1, 1, 1,
1.394123, -0.2108916, 1.080793, 1, 1, 1, 1, 1,
1.409918, 0.2023398, 1.699329, 1, 1, 1, 1, 1,
1.41068, 0.2400246, 1.568159, 1, 1, 1, 1, 1,
1.417895, -1.572071, 2.503358, 1, 1, 1, 1, 1,
1.419263, 1.106825, 3.057095, 1, 1, 1, 1, 1,
1.41978, -0.01097724, 0.4770625, 1, 1, 1, 1, 1,
1.440832, -0.2891564, 2.548259, 0, 0, 1, 1, 1,
1.44119, -0.8383656, 2.111832, 1, 0, 0, 1, 1,
1.460868, 1.288023, 1.653518, 1, 0, 0, 1, 1,
1.465997, -0.8967158, 3.348595, 1, 0, 0, 1, 1,
1.495207, 0.8353636, 2.017861, 1, 0, 0, 1, 1,
1.499947, -1.011008, 0.1826678, 1, 0, 0, 1, 1,
1.502506, 1.191871, 2.218947, 0, 0, 0, 1, 1,
1.509089, -0.357195, 2.616453, 0, 0, 0, 1, 1,
1.518716, 1.704489, -0.8120678, 0, 0, 0, 1, 1,
1.524681, 0.9868223, -0.1881771, 0, 0, 0, 1, 1,
1.555048, -0.9163923, 2.674618, 0, 0, 0, 1, 1,
1.557329, 0.2050458, 3.148205, 0, 0, 0, 1, 1,
1.558542, 0.6268138, 0.05444355, 0, 0, 0, 1, 1,
1.560931, -0.2322214, 0.409187, 1, 1, 1, 1, 1,
1.563326, -0.8461478, 2.316376, 1, 1, 1, 1, 1,
1.569916, 1.881086, -0.1603556, 1, 1, 1, 1, 1,
1.594361, 0.1003831, 2.139584, 1, 1, 1, 1, 1,
1.594601, -0.1634626, 1.667041, 1, 1, 1, 1, 1,
1.603415, 0.5185657, 2.15833, 1, 1, 1, 1, 1,
1.604278, 2.109739, -0.6750799, 1, 1, 1, 1, 1,
1.62582, -0.4830742, 1.837159, 1, 1, 1, 1, 1,
1.639601, -0.5675963, 2.994715, 1, 1, 1, 1, 1,
1.649415, -0.8284595, 2.885853, 1, 1, 1, 1, 1,
1.672208, -0.6436049, -0.3416128, 1, 1, 1, 1, 1,
1.672474, -0.4650987, 1.229244, 1, 1, 1, 1, 1,
1.679481, 2.216564, -0.6867235, 1, 1, 1, 1, 1,
1.682719, -0.147136, 1.969833, 1, 1, 1, 1, 1,
1.689746, 0.7377481, 2.760466, 1, 1, 1, 1, 1,
1.709137, -0.3736566, 2.50393, 0, 0, 1, 1, 1,
1.764312, 0.3665758, 0.7911909, 1, 0, 0, 1, 1,
1.775422, 0.8169535, 0.6862428, 1, 0, 0, 1, 1,
1.784426, -0.5087055, 2.326769, 1, 0, 0, 1, 1,
1.78843, -1.093187, 3.596967, 1, 0, 0, 1, 1,
1.810474, 0.9191448, 0.9309401, 1, 0, 0, 1, 1,
1.830859, -0.3773127, 1.71965, 0, 0, 0, 1, 1,
1.834719, 1.294194, -0.727162, 0, 0, 0, 1, 1,
1.835768, -2.369062, 2.213289, 0, 0, 0, 1, 1,
1.853038, -0.2291181, 1.352031, 0, 0, 0, 1, 1,
1.857049, 0.2579827, 1.763206, 0, 0, 0, 1, 1,
1.872916, -1.387775, 2.16215, 0, 0, 0, 1, 1,
1.873876, 0.02759368, 2.612115, 0, 0, 0, 1, 1,
1.874575, -0.7552006, 3.343263, 1, 1, 1, 1, 1,
1.941984, -0.5772395, 3.210187, 1, 1, 1, 1, 1,
1.992668, -1.705213, 3.346519, 1, 1, 1, 1, 1,
2.004985, 0.7366022, 1.998997, 1, 1, 1, 1, 1,
2.006134, 0.6405725, -0.4097837, 1, 1, 1, 1, 1,
2.006576, -0.3050398, 3.232405, 1, 1, 1, 1, 1,
2.015876, -1.4421, 2.055678, 1, 1, 1, 1, 1,
2.034963, 0.503636, 0.5988987, 1, 1, 1, 1, 1,
2.063498, -0.3877378, 1.668231, 1, 1, 1, 1, 1,
2.067021, -0.1486438, 3.453585, 1, 1, 1, 1, 1,
2.105347, -1.590608, 3.245656, 1, 1, 1, 1, 1,
2.11889, 0.6010109, 1.06044, 1, 1, 1, 1, 1,
2.130811, -1.160226, 1.599134, 1, 1, 1, 1, 1,
2.141877, -1.199921, 2.048616, 1, 1, 1, 1, 1,
2.17074, 0.1146294, 0.4561676, 1, 1, 1, 1, 1,
2.17529, -1.661081, 2.614731, 0, 0, 1, 1, 1,
2.180575, 0.4336978, 1.079423, 1, 0, 0, 1, 1,
2.230187, 2.110404, 2.661139, 1, 0, 0, 1, 1,
2.239589, -1.38381, 3.011125, 1, 0, 0, 1, 1,
2.283521, -0.6112018, 1.687976, 1, 0, 0, 1, 1,
2.288298, -0.4257973, 1.960532, 1, 0, 0, 1, 1,
2.289509, -0.6584899, 0.8149279, 0, 0, 0, 1, 1,
2.302129, -1.084747, 1.734494, 0, 0, 0, 1, 1,
2.306905, 1.266165, 1.418721, 0, 0, 0, 1, 1,
2.312124, 0.6547274, 0.6762248, 0, 0, 0, 1, 1,
2.327636, 0.3019991, 1.626655, 0, 0, 0, 1, 1,
2.47121, 0.6392856, 1.440007, 0, 0, 0, 1, 1,
2.504153, -0.5497422, 1.630923, 0, 0, 0, 1, 1,
2.658155, -0.02780043, 1.266062, 1, 1, 1, 1, 1,
2.821192, -0.4632787, 2.300674, 1, 1, 1, 1, 1,
2.908195, -1.380949, 3.429769, 1, 1, 1, 1, 1,
3.298569, 1.000697, 0.3390595, 1, 1, 1, 1, 1,
3.332363, 1.165877, 1.885636, 1, 1, 1, 1, 1,
3.379083, -1.0301, 3.390367, 1, 1, 1, 1, 1,
3.530266, -0.7706749, 2.393923, 1, 1, 1, 1, 1
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
var radius = 9.50854;
var distance = 33.39834;
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
mvMatrix.translate( -0.1456492, 0.08641481, 0.4350352 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.39834);
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