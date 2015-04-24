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
-3.01189, 1.804381, -1.534585, 1, 0, 0, 1,
-2.884364, 1.317153, -1.296494, 1, 0.007843138, 0, 1,
-2.866846, 0.3171302, -2.132807, 1, 0.01176471, 0, 1,
-2.768647, 1.218532, -1.695881, 1, 0.01960784, 0, 1,
-2.645, 0.4265653, -0.2891852, 1, 0.02352941, 0, 1,
-2.532943, -0.7454731, -2.145296, 1, 0.03137255, 0, 1,
-2.520397, 0.4300689, -0.7391012, 1, 0.03529412, 0, 1,
-2.475914, 1.09813, -0.4782035, 1, 0.04313726, 0, 1,
-2.392822, 0.8405138, -1.442568, 1, 0.04705882, 0, 1,
-2.392125, 1.628682, -1.273106, 1, 0.05490196, 0, 1,
-2.298887, 2.416605, -0.2276007, 1, 0.05882353, 0, 1,
-2.292112, -0.3074486, -1.803514, 1, 0.06666667, 0, 1,
-2.289362, 0.784233, -1.044056, 1, 0.07058824, 0, 1,
-2.27465, 0.3146111, -0.708945, 1, 0.07843138, 0, 1,
-2.250146, -0.5646105, -1.174959, 1, 0.08235294, 0, 1,
-2.232408, -1.244476, -0.7116882, 1, 0.09019608, 0, 1,
-2.229068, 1.408555, 0.3310823, 1, 0.09411765, 0, 1,
-2.219043, 0.8469371, -1.551394, 1, 0.1019608, 0, 1,
-2.192955, -0.2984839, -3.737224, 1, 0.1098039, 0, 1,
-2.147523, -1.149244, -1.077742, 1, 0.1137255, 0, 1,
-2.145942, -1.547184, -1.791371, 1, 0.1215686, 0, 1,
-2.111986, -0.9055197, -0.807196, 1, 0.1254902, 0, 1,
-2.108307, -1.55818, -3.566703, 1, 0.1333333, 0, 1,
-2.106696, 1.606967, -1.261138, 1, 0.1372549, 0, 1,
-2.069491, 0.7164072, -1.911125, 1, 0.145098, 0, 1,
-2.068811, -0.3734579, -0.1418845, 1, 0.1490196, 0, 1,
-2.060452, -1.259926, -2.505568, 1, 0.1568628, 0, 1,
-2.0504, -0.2767078, -1.619315, 1, 0.1607843, 0, 1,
-2.034649, -0.4968525, -0.2450415, 1, 0.1686275, 0, 1,
-2.025252, 0.1440467, -1.289354, 1, 0.172549, 0, 1,
-2.006228, -1.123855, -2.577719, 1, 0.1803922, 0, 1,
-1.986194, 1.213149, -0.7609054, 1, 0.1843137, 0, 1,
-1.972526, -0.2271928, -0.01838551, 1, 0.1921569, 0, 1,
-1.953708, -0.6031902, -1.881347, 1, 0.1960784, 0, 1,
-1.946752, 0.747525, -0.3659103, 1, 0.2039216, 0, 1,
-1.938103, 0.3176281, -1.45871, 1, 0.2117647, 0, 1,
-1.93361, 0.1261615, -2.299078, 1, 0.2156863, 0, 1,
-1.890855, -1.672714, -0.7615442, 1, 0.2235294, 0, 1,
-1.855419, -0.7668607, -0.8719974, 1, 0.227451, 0, 1,
-1.851073, 2.174517, -0.6786051, 1, 0.2352941, 0, 1,
-1.850064, -0.1273846, -1.423194, 1, 0.2392157, 0, 1,
-1.844478, 0.1195735, -2.399723, 1, 0.2470588, 0, 1,
-1.844182, 0.8338659, 1.087152, 1, 0.2509804, 0, 1,
-1.835407, -0.9287475, -3.291871, 1, 0.2588235, 0, 1,
-1.835152, -0.4165211, -2.720255, 1, 0.2627451, 0, 1,
-1.788146, -0.2466592, -2.397207, 1, 0.2705882, 0, 1,
-1.785628, -0.7203031, -4.519815, 1, 0.2745098, 0, 1,
-1.733036, -0.7059976, -2.025223, 1, 0.282353, 0, 1,
-1.732608, -0.2673985, -0.9485892, 1, 0.2862745, 0, 1,
-1.705311, 0.4784065, -1.896582, 1, 0.2941177, 0, 1,
-1.697517, -0.1650967, -1.735107, 1, 0.3019608, 0, 1,
-1.694466, -0.01808612, -2.345247, 1, 0.3058824, 0, 1,
-1.679285, 1.390025, -2.671415, 1, 0.3137255, 0, 1,
-1.678435, 0.5244492, 0.4315345, 1, 0.3176471, 0, 1,
-1.670749, -0.2605399, -2.786293, 1, 0.3254902, 0, 1,
-1.66596, 1.73681, -0.5867037, 1, 0.3294118, 0, 1,
-1.625995, 0.2514056, -0.2876994, 1, 0.3372549, 0, 1,
-1.625629, 0.6363144, -1.000812, 1, 0.3411765, 0, 1,
-1.618908, -0.1495155, -0.07018806, 1, 0.3490196, 0, 1,
-1.608145, 0.1088324, -1.04203, 1, 0.3529412, 0, 1,
-1.606243, -0.1307299, -1.305728, 1, 0.3607843, 0, 1,
-1.593036, 0.3686768, -2.758485, 1, 0.3647059, 0, 1,
-1.591288, 0.90171, -3.069292, 1, 0.372549, 0, 1,
-1.586414, 0.1466807, 0.1295002, 1, 0.3764706, 0, 1,
-1.575101, 1.227977, -0.6507317, 1, 0.3843137, 0, 1,
-1.570171, -0.2678974, -3.610002, 1, 0.3882353, 0, 1,
-1.564205, -1.580353, -2.968553, 1, 0.3960784, 0, 1,
-1.561691, 0.00238798, -0.782082, 1, 0.4039216, 0, 1,
-1.561121, -1.490854, -1.571787, 1, 0.4078431, 0, 1,
-1.555675, -0.5611634, -2.184635, 1, 0.4156863, 0, 1,
-1.55152, -1.133531, -1.380914, 1, 0.4196078, 0, 1,
-1.548843, -1.454014, -3.01953, 1, 0.427451, 0, 1,
-1.537462, -1.397434, -2.490613, 1, 0.4313726, 0, 1,
-1.53371, -0.7660664, -2.62263, 1, 0.4392157, 0, 1,
-1.531538, 1.432358, -1.169778, 1, 0.4431373, 0, 1,
-1.530821, -1.237221, -1.827421, 1, 0.4509804, 0, 1,
-1.523041, -0.8454837, -3.297142, 1, 0.454902, 0, 1,
-1.519895, 0.7409539, -1.350062, 1, 0.4627451, 0, 1,
-1.511194, 0.1393279, -1.025664, 1, 0.4666667, 0, 1,
-1.502214, 1.480136, -1.381086, 1, 0.4745098, 0, 1,
-1.499419, 2.237437, 0.1428098, 1, 0.4784314, 0, 1,
-1.482096, 0.002915437, -1.693621, 1, 0.4862745, 0, 1,
-1.471887, 0.2244622, -1.808235, 1, 0.4901961, 0, 1,
-1.462087, -0.943903, -2.867667, 1, 0.4980392, 0, 1,
-1.458528, -0.05550333, -1.187914, 1, 0.5058824, 0, 1,
-1.457666, 1.739085, -0.8614679, 1, 0.509804, 0, 1,
-1.442797, 1.30055, 0.08544812, 1, 0.5176471, 0, 1,
-1.43683, 0.4144506, -2.686246, 1, 0.5215687, 0, 1,
-1.434148, 1.510538, -1.148463, 1, 0.5294118, 0, 1,
-1.43155, 1.168458, -0.3562994, 1, 0.5333334, 0, 1,
-1.429728, -1.240708, -2.211331, 1, 0.5411765, 0, 1,
-1.428411, 0.1701288, -0.2829196, 1, 0.5450981, 0, 1,
-1.424099, -0.2368505, -1.982809, 1, 0.5529412, 0, 1,
-1.416682, -1.800218, -2.450158, 1, 0.5568628, 0, 1,
-1.414355, 0.5489478, -1.200822, 1, 0.5647059, 0, 1,
-1.412752, 1.121862, -0.9502874, 1, 0.5686275, 0, 1,
-1.40615, 1.177533, -1.160272, 1, 0.5764706, 0, 1,
-1.405205, 0.227172, -2.785915, 1, 0.5803922, 0, 1,
-1.393658, 0.6714782, -1.368796, 1, 0.5882353, 0, 1,
-1.384204, 0.5159913, -0.9978628, 1, 0.5921569, 0, 1,
-1.37213, -0.9966392, -4.202751, 1, 0.6, 0, 1,
-1.359093, -0.7358357, -2.936558, 1, 0.6078432, 0, 1,
-1.358598, 1.390783, -1.263574, 1, 0.6117647, 0, 1,
-1.349665, -0.6045908, -3.837331, 1, 0.6196079, 0, 1,
-1.343126, -0.1041818, -2.681871, 1, 0.6235294, 0, 1,
-1.342808, -1.375481, -2.86514, 1, 0.6313726, 0, 1,
-1.342171, -1.569566, -2.726687, 1, 0.6352941, 0, 1,
-1.340861, -1.915229, -1.995942, 1, 0.6431373, 0, 1,
-1.339873, 0.137989, 0.1254651, 1, 0.6470588, 0, 1,
-1.339506, -0.7276543, -0.8738937, 1, 0.654902, 0, 1,
-1.338871, -0.254979, -2.470693, 1, 0.6588235, 0, 1,
-1.329584, -1.961145, -5.931831, 1, 0.6666667, 0, 1,
-1.327496, 0.959734, -1.167302, 1, 0.6705883, 0, 1,
-1.325575, 1.575539, -0.7821045, 1, 0.6784314, 0, 1,
-1.319065, -0.242985, -0.9887248, 1, 0.682353, 0, 1,
-1.315982, 0.7174875, -1.222537, 1, 0.6901961, 0, 1,
-1.307837, -0.0841575, -2.0999, 1, 0.6941177, 0, 1,
-1.30505, -0.1658431, -2.537506, 1, 0.7019608, 0, 1,
-1.298709, 0.05631006, -1.570508, 1, 0.7098039, 0, 1,
-1.296391, 0.8329017, -0.867299, 1, 0.7137255, 0, 1,
-1.287559, -1.196466, -2.383859, 1, 0.7215686, 0, 1,
-1.278353, -0.06706038, -2.087922, 1, 0.7254902, 0, 1,
-1.273203, 2.129145, -0.2484279, 1, 0.7333333, 0, 1,
-1.262677, -0.4463977, -0.9250778, 1, 0.7372549, 0, 1,
-1.259643, -1.264987, -3.27484, 1, 0.7450981, 0, 1,
-1.259604, -1.425976, -1.742211, 1, 0.7490196, 0, 1,
-1.251308, -2.345675, -2.081296, 1, 0.7568628, 0, 1,
-1.25056, -0.5169113, -1.624998, 1, 0.7607843, 0, 1,
-1.250079, -0.4690598, -0.8471908, 1, 0.7686275, 0, 1,
-1.246877, -0.267131, -4.05564, 1, 0.772549, 0, 1,
-1.245784, 1.056541, 0.259324, 1, 0.7803922, 0, 1,
-1.236072, 0.6205583, -1.904631, 1, 0.7843137, 0, 1,
-1.232615, -0.9208394, -1.167287, 1, 0.7921569, 0, 1,
-1.231475, -0.2890367, -4.518415, 1, 0.7960784, 0, 1,
-1.227226, -0.7990332, -2.707367, 1, 0.8039216, 0, 1,
-1.225565, 1.44317, -1.504698, 1, 0.8117647, 0, 1,
-1.223447, 0.1260575, -1.475805, 1, 0.8156863, 0, 1,
-1.222415, -2.158351, -1.868832, 1, 0.8235294, 0, 1,
-1.221808, -0.2708384, -1.27802, 1, 0.827451, 0, 1,
-1.218987, 0.2494394, -0.3096577, 1, 0.8352941, 0, 1,
-1.217459, -0.4300767, -3.456341, 1, 0.8392157, 0, 1,
-1.217199, -1.479072, -2.678678, 1, 0.8470588, 0, 1,
-1.215788, -0.1799773, -1.173456, 1, 0.8509804, 0, 1,
-1.212321, -0.2888025, -2.647409, 1, 0.8588235, 0, 1,
-1.211691, 0.8328362, -0.08397431, 1, 0.8627451, 0, 1,
-1.210421, 0.9050454, -1.838861, 1, 0.8705882, 0, 1,
-1.194585, 0.1631868, -1.684707, 1, 0.8745098, 0, 1,
-1.192925, 1.056603, 1.244204, 1, 0.8823529, 0, 1,
-1.18989, 0.02281968, -0.6942979, 1, 0.8862745, 0, 1,
-1.167549, -0.2478926, -2.369483, 1, 0.8941177, 0, 1,
-1.164794, 0.7072858, 0.07292787, 1, 0.8980392, 0, 1,
-1.15865, 0.4802738, 0.08130749, 1, 0.9058824, 0, 1,
-1.153696, -0.2961138, -1.539242, 1, 0.9137255, 0, 1,
-1.153529, -1.297277, -2.14144, 1, 0.9176471, 0, 1,
-1.151202, 1.071978, -2.811311, 1, 0.9254902, 0, 1,
-1.143829, 0.578123, -1.298844, 1, 0.9294118, 0, 1,
-1.143173, -0.5000507, -1.664944, 1, 0.9372549, 0, 1,
-1.13757, 0.2611465, -1.563367, 1, 0.9411765, 0, 1,
-1.123653, 1.36703, -0.7293541, 1, 0.9490196, 0, 1,
-1.117798, -0.4213007, -1.366393, 1, 0.9529412, 0, 1,
-1.10247, -0.3440611, -0.4316532, 1, 0.9607843, 0, 1,
-1.097697, 0.7248918, -0.5535188, 1, 0.9647059, 0, 1,
-1.095562, -2.499578, -2.739406, 1, 0.972549, 0, 1,
-1.088298, -1.099985, -2.172301, 1, 0.9764706, 0, 1,
-1.075926, -0.2774618, -1.646409, 1, 0.9843137, 0, 1,
-1.067195, -1.306959, -2.418624, 1, 0.9882353, 0, 1,
-1.059799, -2.134088, -2.176592, 1, 0.9960784, 0, 1,
-1.056463, 1.82168, 1.159876, 0.9960784, 1, 0, 1,
-1.020667, -1.157467, -1.354818, 0.9921569, 1, 0, 1,
-1.01869, 0.202043, -2.752584, 0.9843137, 1, 0, 1,
-1.014835, 0.6305985, -1.382868, 0.9803922, 1, 0, 1,
-1.014059, 1.888049, -1.792957, 0.972549, 1, 0, 1,
-1.00682, 0.08592084, -1.973794, 0.9686275, 1, 0, 1,
-0.9917406, 0.2052246, -1.335043, 0.9607843, 1, 0, 1,
-0.9840383, -0.2716656, -0.6277154, 0.9568627, 1, 0, 1,
-0.9813122, 0.1657871, -1.492746, 0.9490196, 1, 0, 1,
-0.9785233, -0.1946466, -2.530924, 0.945098, 1, 0, 1,
-0.975362, 1.865806, 0.4388866, 0.9372549, 1, 0, 1,
-0.965789, -0.4974466, -2.717432, 0.9333333, 1, 0, 1,
-0.9633963, -0.007349793, -1.671192, 0.9254902, 1, 0, 1,
-0.9630935, 2.744581, 0.8626888, 0.9215686, 1, 0, 1,
-0.9620615, -0.4930697, -1.551242, 0.9137255, 1, 0, 1,
-0.9481986, 1.861883, 0.3494757, 0.9098039, 1, 0, 1,
-0.939514, 0.3152534, -2.033202, 0.9019608, 1, 0, 1,
-0.9291031, 0.4604103, -0.4691185, 0.8941177, 1, 0, 1,
-0.9275986, 0.5915519, -0.5699114, 0.8901961, 1, 0, 1,
-0.9273282, 0.867517, 0.6453965, 0.8823529, 1, 0, 1,
-0.9241676, -0.8516221, -1.083917, 0.8784314, 1, 0, 1,
-0.9216108, 0.4455122, -1.249146, 0.8705882, 1, 0, 1,
-0.9121957, -1.024772, -3.786465, 0.8666667, 1, 0, 1,
-0.9040637, 0.5830395, -2.804395, 0.8588235, 1, 0, 1,
-0.8972651, 0.9384444, -0.7568649, 0.854902, 1, 0, 1,
-0.896644, 0.6036388, -1.742061, 0.8470588, 1, 0, 1,
-0.8908644, 0.5798628, -1.175196, 0.8431373, 1, 0, 1,
-0.8906943, -0.9555593, -0.3998684, 0.8352941, 1, 0, 1,
-0.8863772, -1.542928, -2.747661, 0.8313726, 1, 0, 1,
-0.8856769, 0.6619882, 1.553339, 0.8235294, 1, 0, 1,
-0.8846689, 0.543496, -1.358177, 0.8196079, 1, 0, 1,
-0.8841255, -0.6175913, -3.958085, 0.8117647, 1, 0, 1,
-0.8785323, -0.8387972, -0.8228108, 0.8078431, 1, 0, 1,
-0.8726999, -0.5684555, -1.931001, 0.8, 1, 0, 1,
-0.8712931, 1.434668, -1.33679, 0.7921569, 1, 0, 1,
-0.8666784, 0.8007513, -0.3821175, 0.7882353, 1, 0, 1,
-0.8643939, -0.9137336, -2.290532, 0.7803922, 1, 0, 1,
-0.8626788, 0.05831729, -1.309859, 0.7764706, 1, 0, 1,
-0.8619234, 0.6870189, -1.552008, 0.7686275, 1, 0, 1,
-0.860223, -0.8013686, -3.285256, 0.7647059, 1, 0, 1,
-0.8597949, 0.3432825, -0.5180147, 0.7568628, 1, 0, 1,
-0.8583628, 0.6392239, -1.734053, 0.7529412, 1, 0, 1,
-0.8578092, 1.810311, 0.7837681, 0.7450981, 1, 0, 1,
-0.8558401, 0.443607, -2.81287, 0.7411765, 1, 0, 1,
-0.8555905, 0.7804935, -1.379818, 0.7333333, 1, 0, 1,
-0.8514947, 0.1909647, -2.6652, 0.7294118, 1, 0, 1,
-0.8480118, 1.077158, 1.67352, 0.7215686, 1, 0, 1,
-0.8439713, 1.452122, -0.1124389, 0.7176471, 1, 0, 1,
-0.8394998, 0.4420138, -2.577739, 0.7098039, 1, 0, 1,
-0.8349813, 1.014189, -0.1969301, 0.7058824, 1, 0, 1,
-0.8341488, -0.562888, -2.738559, 0.6980392, 1, 0, 1,
-0.8339245, -0.7981033, -0.7644199, 0.6901961, 1, 0, 1,
-0.8317, 0.4315965, 1.429663, 0.6862745, 1, 0, 1,
-0.8311185, -0.3845776, -2.078985, 0.6784314, 1, 0, 1,
-0.8309023, -0.6101613, -2.027511, 0.6745098, 1, 0, 1,
-0.8302127, -1.658155, -3.556863, 0.6666667, 1, 0, 1,
-0.8290623, -0.5284773, -3.244578, 0.6627451, 1, 0, 1,
-0.8265069, 0.2646875, 0.2065166, 0.654902, 1, 0, 1,
-0.82418, -0.5076354, -5.166903, 0.6509804, 1, 0, 1,
-0.8216734, 2.205377, -0.1928796, 0.6431373, 1, 0, 1,
-0.8215876, -1.889526, -0.3881552, 0.6392157, 1, 0, 1,
-0.8203734, 1.032754, -1.830565, 0.6313726, 1, 0, 1,
-0.8127704, -0.7375471, -2.752848, 0.627451, 1, 0, 1,
-0.8127045, -1.099242, -2.880126, 0.6196079, 1, 0, 1,
-0.8121095, 1.247637, 0.7840386, 0.6156863, 1, 0, 1,
-0.8097549, -1.914271, -2.20678, 0.6078432, 1, 0, 1,
-0.8076102, 0.9785946, -0.1117074, 0.6039216, 1, 0, 1,
-0.8043685, 0.009731081, -1.336729, 0.5960785, 1, 0, 1,
-0.8036665, -0.09306569, -0.7969705, 0.5882353, 1, 0, 1,
-0.8035743, 0.8160879, -0.02503368, 0.5843138, 1, 0, 1,
-0.7988278, 1.112796, 0.6458028, 0.5764706, 1, 0, 1,
-0.7896921, 1.954964, 0.1896431, 0.572549, 1, 0, 1,
-0.788619, -0.8217717, -1.872989, 0.5647059, 1, 0, 1,
-0.7862571, 0.5586604, -0.3795253, 0.5607843, 1, 0, 1,
-0.7853811, -0.6264885, -2.058703, 0.5529412, 1, 0, 1,
-0.7850694, -0.2957253, -0.4635614, 0.5490196, 1, 0, 1,
-0.7824101, 1.14233, -0.2930798, 0.5411765, 1, 0, 1,
-0.7816009, -0.3123839, -1.15223, 0.5372549, 1, 0, 1,
-0.7800797, 0.9552154, 0.9603314, 0.5294118, 1, 0, 1,
-0.770909, 0.4888362, -2.173563, 0.5254902, 1, 0, 1,
-0.7699573, -0.2274134, 1.109944, 0.5176471, 1, 0, 1,
-0.7636154, 0.1740356, -3.459806, 0.5137255, 1, 0, 1,
-0.76192, 0.1050485, -2.635569, 0.5058824, 1, 0, 1,
-0.760299, -0.4263862, -1.275217, 0.5019608, 1, 0, 1,
-0.7562984, 1.540035, -2.281806, 0.4941176, 1, 0, 1,
-0.7544898, -1.221132, -2.663772, 0.4862745, 1, 0, 1,
-0.751593, -0.2325405, -2.027694, 0.4823529, 1, 0, 1,
-0.745516, 0.7770703, -1.347023, 0.4745098, 1, 0, 1,
-0.7434431, 1.850378, -0.2530701, 0.4705882, 1, 0, 1,
-0.742185, 1.395452, -0.386617, 0.4627451, 1, 0, 1,
-0.738916, 0.4924826, 0.08604714, 0.4588235, 1, 0, 1,
-0.7327725, 0.3736521, 0.5394325, 0.4509804, 1, 0, 1,
-0.7314849, -1.54109, -2.948483, 0.4470588, 1, 0, 1,
-0.7311378, 0.008888628, -1.71996, 0.4392157, 1, 0, 1,
-0.7229168, 0.9297218, 0.7462895, 0.4352941, 1, 0, 1,
-0.7188544, -1.659498, -3.557548, 0.427451, 1, 0, 1,
-0.7165236, 1.286318, 1.232331, 0.4235294, 1, 0, 1,
-0.7149819, -0.9321832, -1.735989, 0.4156863, 1, 0, 1,
-0.7148104, 0.8609505, -0.3990675, 0.4117647, 1, 0, 1,
-0.7088997, -0.6701888, -0.3306192, 0.4039216, 1, 0, 1,
-0.7014019, -0.2930594, -0.8157982, 0.3960784, 1, 0, 1,
-0.7007354, 1.356045, 1.089543, 0.3921569, 1, 0, 1,
-0.6931401, -2.00493, -1.448137, 0.3843137, 1, 0, 1,
-0.6877615, -1.657782, -3.286473, 0.3803922, 1, 0, 1,
-0.6872175, 0.04855556, -0.9147202, 0.372549, 1, 0, 1,
-0.6863328, 0.6648771, -0.254093, 0.3686275, 1, 0, 1,
-0.6854916, -0.1262864, -0.1091582, 0.3607843, 1, 0, 1,
-0.6842514, -1.272974, -0.7945279, 0.3568628, 1, 0, 1,
-0.6829848, 1.421743, -0.07114844, 0.3490196, 1, 0, 1,
-0.682214, -0.654052, -2.937537, 0.345098, 1, 0, 1,
-0.6819862, -0.5211197, -1.34641, 0.3372549, 1, 0, 1,
-0.6762381, -1.157781, -3.189069, 0.3333333, 1, 0, 1,
-0.6759099, -1.198042, -1.818846, 0.3254902, 1, 0, 1,
-0.6725479, 0.08158683, 0.6928983, 0.3215686, 1, 0, 1,
-0.6693593, 0.3343558, -1.971016, 0.3137255, 1, 0, 1,
-0.6684064, 0.09214603, 0.3752976, 0.3098039, 1, 0, 1,
-0.6682736, 1.30484, -1.394302, 0.3019608, 1, 0, 1,
-0.6643057, -0.3078455, -2.172143, 0.2941177, 1, 0, 1,
-0.6642946, -0.6631156, -1.617153, 0.2901961, 1, 0, 1,
-0.6410317, -0.6889201, -1.040637, 0.282353, 1, 0, 1,
-0.6391354, 0.182765, -1.401243, 0.2784314, 1, 0, 1,
-0.6336136, 1.682043, 0.4470148, 0.2705882, 1, 0, 1,
-0.6313036, 0.3838561, -0.3054294, 0.2666667, 1, 0, 1,
-0.6266643, -0.163614, -1.070625, 0.2588235, 1, 0, 1,
-0.6195356, 0.1484049, -1.868577, 0.254902, 1, 0, 1,
-0.6130878, -0.1706467, -1.881394, 0.2470588, 1, 0, 1,
-0.6090044, -0.4369981, -0.6345929, 0.2431373, 1, 0, 1,
-0.5907141, -1.63244, -1.440084, 0.2352941, 1, 0, 1,
-0.587688, -1.284205, -1.835289, 0.2313726, 1, 0, 1,
-0.5837981, -0.2878622, -3.239897, 0.2235294, 1, 0, 1,
-0.5830098, -1.147626, -2.347133, 0.2196078, 1, 0, 1,
-0.5813158, -0.5709484, -0.9846576, 0.2117647, 1, 0, 1,
-0.5813105, -0.05505069, -0.4334246, 0.2078431, 1, 0, 1,
-0.5750119, -0.6095569, -1.72764, 0.2, 1, 0, 1,
-0.5728953, -0.876615, -3.596523, 0.1921569, 1, 0, 1,
-0.5700212, 1.087774, -0.8189139, 0.1882353, 1, 0, 1,
-0.568373, 1.106937, 0.2758932, 0.1803922, 1, 0, 1,
-0.5670915, -0.7145603, -2.632041, 0.1764706, 1, 0, 1,
-0.5666209, 0.5394034, -0.2941047, 0.1686275, 1, 0, 1,
-0.5596833, -0.8872859, -3.774956, 0.1647059, 1, 0, 1,
-0.5596696, 1.143633, 1.246117, 0.1568628, 1, 0, 1,
-0.5498384, 2.757715, -0.1089814, 0.1529412, 1, 0, 1,
-0.5489984, 1.326603, -0.9389072, 0.145098, 1, 0, 1,
-0.5487015, -1.758187, -1.081258, 0.1411765, 1, 0, 1,
-0.546333, 0.4294313, -1.101465, 0.1333333, 1, 0, 1,
-0.5449253, -1.343965, -2.063341, 0.1294118, 1, 0, 1,
-0.5446917, -1.500503, -2.546408, 0.1215686, 1, 0, 1,
-0.5436175, -0.01486357, -1.585663, 0.1176471, 1, 0, 1,
-0.5411597, 0.5135657, -0.9726303, 0.1098039, 1, 0, 1,
-0.5386217, -1.318957, -1.897119, 0.1058824, 1, 0, 1,
-0.5344288, -0.385247, -4.533926, 0.09803922, 1, 0, 1,
-0.5342741, 0.603238, -0.5523044, 0.09019608, 1, 0, 1,
-0.5335699, 0.6865741, -0.3702042, 0.08627451, 1, 0, 1,
-0.5322933, -0.2005597, -2.102782, 0.07843138, 1, 0, 1,
-0.5262929, 0.09275007, 0.1652243, 0.07450981, 1, 0, 1,
-0.5256065, 1.415725, -1.101272, 0.06666667, 1, 0, 1,
-0.52556, -0.01644287, -0.09313296, 0.0627451, 1, 0, 1,
-0.522774, 1.253402, 1.065423, 0.05490196, 1, 0, 1,
-0.5188348, -0.14463, -3.310065, 0.05098039, 1, 0, 1,
-0.5149, 1.244274, -2.199584, 0.04313726, 1, 0, 1,
-0.5113114, -0.1219968, -2.976746, 0.03921569, 1, 0, 1,
-0.5095386, 0.4542806, 0.3744895, 0.03137255, 1, 0, 1,
-0.5081902, -0.4706028, -2.222613, 0.02745098, 1, 0, 1,
-0.5045912, 0.3641408, -0.9655931, 0.01960784, 1, 0, 1,
-0.5004649, -0.6428898, -3.344042, 0.01568628, 1, 0, 1,
-0.5002128, -0.4447151, -2.322336, 0.007843138, 1, 0, 1,
-0.4962543, -1.998265, -2.889059, 0.003921569, 1, 0, 1,
-0.4922738, 0.1654737, -2.677702, 0, 1, 0.003921569, 1,
-0.4913048, -0.5977402, -2.993245, 0, 1, 0.01176471, 1,
-0.4850726, 1.228328, -0.486095, 0, 1, 0.01568628, 1,
-0.4844866, -0.8639402, -3.301057, 0, 1, 0.02352941, 1,
-0.482389, 0.5934401, -2.472139, 0, 1, 0.02745098, 1,
-0.4816456, 0.7322416, 1.343712, 0, 1, 0.03529412, 1,
-0.4814676, -0.5863689, -2.267322, 0, 1, 0.03921569, 1,
-0.4786965, 0.4032569, -0.6671605, 0, 1, 0.04705882, 1,
-0.4743322, 0.1139796, -1.439204, 0, 1, 0.05098039, 1,
-0.471625, -0.2849567, -2.909092, 0, 1, 0.05882353, 1,
-0.462255, 1.817357, 0.4984295, 0, 1, 0.0627451, 1,
-0.4619684, 0.08407775, -2.946708, 0, 1, 0.07058824, 1,
-0.4570491, -1.801759, -2.038019, 0, 1, 0.07450981, 1,
-0.4402598, 0.8156797, -0.1593563, 0, 1, 0.08235294, 1,
-0.4377059, 1.002652, 1.112562, 0, 1, 0.08627451, 1,
-0.4353282, 1.058858, -1.574987, 0, 1, 0.09411765, 1,
-0.4297671, -2.118771, -3.098076, 0, 1, 0.1019608, 1,
-0.4292649, -0.5145192, -1.917898, 0, 1, 0.1058824, 1,
-0.421039, -1.505875, -3.447537, 0, 1, 0.1137255, 1,
-0.4200736, -0.6513225, -3.360803, 0, 1, 0.1176471, 1,
-0.4180781, -0.7154893, -0.6750792, 0, 1, 0.1254902, 1,
-0.4159963, -0.09191208, 0.2547649, 0, 1, 0.1294118, 1,
-0.4151926, 0.5230091, -0.5467007, 0, 1, 0.1372549, 1,
-0.4114159, -0.3768023, -2.421047, 0, 1, 0.1411765, 1,
-0.4100355, -0.05009161, -0.229095, 0, 1, 0.1490196, 1,
-0.407549, 0.7828636, 1.044159, 0, 1, 0.1529412, 1,
-0.4073429, 0.4886602, -2.561484, 0, 1, 0.1607843, 1,
-0.4069715, 0.4259805, -0.1288324, 0, 1, 0.1647059, 1,
-0.404477, -0.8412986, -2.631743, 0, 1, 0.172549, 1,
-0.4033396, 0.05767694, -0.3461625, 0, 1, 0.1764706, 1,
-0.4023163, -0.696166, -2.054144, 0, 1, 0.1843137, 1,
-0.3949853, 0.1494584, -1.421767, 0, 1, 0.1882353, 1,
-0.393196, -1.805374, -3.369893, 0, 1, 0.1960784, 1,
-0.3900389, 0.6039239, -0.2067637, 0, 1, 0.2039216, 1,
-0.3880583, 0.6252869, -1.199809, 0, 1, 0.2078431, 1,
-0.3872071, -1.057573, -3.180031, 0, 1, 0.2156863, 1,
-0.3867827, 0.3938248, -1.244277, 0, 1, 0.2196078, 1,
-0.3856639, -0.5003397, -5.046485, 0, 1, 0.227451, 1,
-0.3849196, 1.054536, 1.036705, 0, 1, 0.2313726, 1,
-0.3845631, -2.139196, -3.421574, 0, 1, 0.2392157, 1,
-0.3823617, 0.1323046, -1.087577, 0, 1, 0.2431373, 1,
-0.3819338, 1.36204, 0.3620328, 0, 1, 0.2509804, 1,
-0.3808787, 1.790774, -1.062889, 0, 1, 0.254902, 1,
-0.3805365, -1.935654, -2.686838, 0, 1, 0.2627451, 1,
-0.3785827, 0.9598281, -1.386871, 0, 1, 0.2666667, 1,
-0.3772239, -1.317642, -1.564581, 0, 1, 0.2745098, 1,
-0.3768209, 0.1645227, -1.573628, 0, 1, 0.2784314, 1,
-0.3732974, -0.02316637, -2.272076, 0, 1, 0.2862745, 1,
-0.3725341, -0.8110921, -2.334326, 0, 1, 0.2901961, 1,
-0.3710265, 0.2811295, -1.431371, 0, 1, 0.2980392, 1,
-0.3710256, -2.056256, -3.156825, 0, 1, 0.3058824, 1,
-0.3640056, -0.2266601, -0.4934896, 0, 1, 0.3098039, 1,
-0.3638875, -0.1208638, -4.470555, 0, 1, 0.3176471, 1,
-0.3634625, 0.871944, -0.1899654, 0, 1, 0.3215686, 1,
-0.360276, 1.34508, -0.2006904, 0, 1, 0.3294118, 1,
-0.3533397, 0.4897083, -0.1391573, 0, 1, 0.3333333, 1,
-0.3515842, -0.5784256, -1.701055, 0, 1, 0.3411765, 1,
-0.3515733, -0.1140234, -2.421154, 0, 1, 0.345098, 1,
-0.3480892, 1.080189, -1.954053, 0, 1, 0.3529412, 1,
-0.344208, -0.0003571428, -0.1183413, 0, 1, 0.3568628, 1,
-0.3423488, 1.156615, -1.500595, 0, 1, 0.3647059, 1,
-0.3404365, -0.8712744, -2.269937, 0, 1, 0.3686275, 1,
-0.3381014, -1.801793, -3.046751, 0, 1, 0.3764706, 1,
-0.3361375, 0.5249652, -2.218491, 0, 1, 0.3803922, 1,
-0.3357997, -0.08361395, -3.701044, 0, 1, 0.3882353, 1,
-0.3353405, -0.2753595, -2.829808, 0, 1, 0.3921569, 1,
-0.3339143, -0.5695033, -1.174796, 0, 1, 0.4, 1,
-0.3335256, 0.743866, -0.6975588, 0, 1, 0.4078431, 1,
-0.3334565, 1.077279, -1.577371, 0, 1, 0.4117647, 1,
-0.3315085, -0.4701868, -3.311669, 0, 1, 0.4196078, 1,
-0.3296272, -0.495389, -2.377752, 0, 1, 0.4235294, 1,
-0.3277025, 1.067295, -0.6066295, 0, 1, 0.4313726, 1,
-0.3255542, 1.192749, -1.991069, 0, 1, 0.4352941, 1,
-0.3147064, -1.951564, -4.090608, 0, 1, 0.4431373, 1,
-0.3115141, 0.1156703, -2.317078, 0, 1, 0.4470588, 1,
-0.3109469, 0.2333961, -1.621044, 0, 1, 0.454902, 1,
-0.3071461, 0.6956148, 0.6126448, 0, 1, 0.4588235, 1,
-0.3054256, 0.2071774, 0.5353637, 0, 1, 0.4666667, 1,
-0.3030019, 0.5352693, -2.833302, 0, 1, 0.4705882, 1,
-0.3027755, -0.1351869, -3.892016, 0, 1, 0.4784314, 1,
-0.3019697, -0.4503812, -1.347296, 0, 1, 0.4823529, 1,
-0.2996375, 1.75443, -1.615073, 0, 1, 0.4901961, 1,
-0.2990842, -0.002328389, -2.926766, 0, 1, 0.4941176, 1,
-0.2978955, 0.3663187, 0.4781626, 0, 1, 0.5019608, 1,
-0.2978661, 1.153615, -2.286345, 0, 1, 0.509804, 1,
-0.2932709, -0.5595119, -2.14804, 0, 1, 0.5137255, 1,
-0.2895621, 1.482393, 0.4717915, 0, 1, 0.5215687, 1,
-0.2856765, -1.060085, -2.87086, 0, 1, 0.5254902, 1,
-0.2843706, -1.15555, -3.734634, 0, 1, 0.5333334, 1,
-0.2833391, -0.1496346, -2.964974, 0, 1, 0.5372549, 1,
-0.2754096, -0.7454964, -5.456976, 0, 1, 0.5450981, 1,
-0.2738716, -0.9334273, -3.439506, 0, 1, 0.5490196, 1,
-0.272636, -0.4415109, -3.328462, 0, 1, 0.5568628, 1,
-0.2709346, 1.764648, -0.578571, 0, 1, 0.5607843, 1,
-0.2683631, -0.3788894, -3.226165, 0, 1, 0.5686275, 1,
-0.2674775, -2.283858, -3.066923, 0, 1, 0.572549, 1,
-0.2674148, 0.5209498, -0.5003244, 0, 1, 0.5803922, 1,
-0.2643866, 1.255675, -0.5708109, 0, 1, 0.5843138, 1,
-0.2628859, -0.1058832, -0.8870189, 0, 1, 0.5921569, 1,
-0.2622576, -1.078019, -2.106894, 0, 1, 0.5960785, 1,
-0.260497, 0.1508696, -1.386646, 0, 1, 0.6039216, 1,
-0.2585192, -0.9517349, -2.645633, 0, 1, 0.6117647, 1,
-0.2547317, 0.01233912, -0.3267568, 0, 1, 0.6156863, 1,
-0.2496185, 0.2444526, -1.096684, 0, 1, 0.6235294, 1,
-0.2490417, -0.4198345, -4.114621, 0, 1, 0.627451, 1,
-0.2419313, -1.979858, -2.900505, 0, 1, 0.6352941, 1,
-0.240322, 1.257174, 1.863617, 0, 1, 0.6392157, 1,
-0.2380789, 0.3146636, -0.1197532, 0, 1, 0.6470588, 1,
-0.2361478, -0.1514341, -3.659111, 0, 1, 0.6509804, 1,
-0.2345837, -0.05789433, -3.066391, 0, 1, 0.6588235, 1,
-0.2318378, 0.3965159, -0.3176927, 0, 1, 0.6627451, 1,
-0.2309307, 0.3337499, -2.058199, 0, 1, 0.6705883, 1,
-0.2293013, 1.129022, 0.834278, 0, 1, 0.6745098, 1,
-0.2220815, 0.7059991, -0.08390761, 0, 1, 0.682353, 1,
-0.2215929, -0.09229786, -2.003079, 0, 1, 0.6862745, 1,
-0.2209225, 0.1069774, 0.04791661, 0, 1, 0.6941177, 1,
-0.216601, -0.6825227, -3.818048, 0, 1, 0.7019608, 1,
-0.2146451, -0.222276, -3.711442, 0, 1, 0.7058824, 1,
-0.2104297, 0.3266849, 0.8740708, 0, 1, 0.7137255, 1,
-0.2087721, -0.8864214, -3.070408, 0, 1, 0.7176471, 1,
-0.2086, -0.8323833, -4.725437, 0, 1, 0.7254902, 1,
-0.2074767, -0.2760851, -1.760989, 0, 1, 0.7294118, 1,
-0.2003761, -0.9613709, -3.268524, 0, 1, 0.7372549, 1,
-0.1947788, -0.3093227, -3.190877, 0, 1, 0.7411765, 1,
-0.1862091, 0.05717945, -1.254452, 0, 1, 0.7490196, 1,
-0.1851726, -0.5855719, -2.906055, 0, 1, 0.7529412, 1,
-0.183823, 1.533403, 0.09412169, 0, 1, 0.7607843, 1,
-0.1837663, -0.5706947, -2.925488, 0, 1, 0.7647059, 1,
-0.1826877, -1.810631, -2.442863, 0, 1, 0.772549, 1,
-0.1719913, 0.1333077, -1.166719, 0, 1, 0.7764706, 1,
-0.1681335, 1.095182, 0.1599399, 0, 1, 0.7843137, 1,
-0.1671349, 0.3555221, -0.7344661, 0, 1, 0.7882353, 1,
-0.1669741, -0.946237, -2.914705, 0, 1, 0.7960784, 1,
-0.164308, -0.2545359, -1.806866, 0, 1, 0.8039216, 1,
-0.1642566, -1.242445, -3.191955, 0, 1, 0.8078431, 1,
-0.1604235, 2.430674, -1.028423, 0, 1, 0.8156863, 1,
-0.1584258, -0.1578705, -0.8048593, 0, 1, 0.8196079, 1,
-0.1552648, 0.8719933, 1.301601, 0, 1, 0.827451, 1,
-0.1540557, 0.3444731, -0.482318, 0, 1, 0.8313726, 1,
-0.1497825, 0.1984681, -0.7241572, 0, 1, 0.8392157, 1,
-0.1471995, -0.6731973, -1.561249, 0, 1, 0.8431373, 1,
-0.1413003, -0.4926952, -3.152163, 0, 1, 0.8509804, 1,
-0.1404317, 1.145474, -0.2174286, 0, 1, 0.854902, 1,
-0.1398609, 2.271178, 0.1343205, 0, 1, 0.8627451, 1,
-0.1358398, 0.5284805, -0.6733242, 0, 1, 0.8666667, 1,
-0.1305933, 1.3161, -0.7296609, 0, 1, 0.8745098, 1,
-0.1261368, 1.721763, -1.298886, 0, 1, 0.8784314, 1,
-0.1259278, 0.966934, 3.144312, 0, 1, 0.8862745, 1,
-0.1254009, -0.5902263, -1.688989, 0, 1, 0.8901961, 1,
-0.1217408, -0.5449443, -2.616834, 0, 1, 0.8980392, 1,
-0.1187537, 0.5660388, -0.3193374, 0, 1, 0.9058824, 1,
-0.1171426, 2.043793, -1.66274, 0, 1, 0.9098039, 1,
-0.115254, 1.353292, 0.8967695, 0, 1, 0.9176471, 1,
-0.1125031, -0.3385175, -3.957855, 0, 1, 0.9215686, 1,
-0.1108182, -0.1932515, -2.431794, 0, 1, 0.9294118, 1,
-0.102851, -0.7962824, -2.626804, 0, 1, 0.9333333, 1,
-0.1014091, -0.2409745, -1.892911, 0, 1, 0.9411765, 1,
-0.1004833, -0.2745206, -6.261063, 0, 1, 0.945098, 1,
-0.09953756, 0.4812139, -0.880232, 0, 1, 0.9529412, 1,
-0.09929997, 0.09171262, 0.2258292, 0, 1, 0.9568627, 1,
-0.09690352, 0.7792203, 0.01975173, 0, 1, 0.9647059, 1,
-0.09481461, 1.271541, 0.7245426, 0, 1, 0.9686275, 1,
-0.09432693, 1.168651, 0.976361, 0, 1, 0.9764706, 1,
-0.08649981, -0.1702048, -2.980123, 0, 1, 0.9803922, 1,
-0.08433823, 0.6684988, -1.195414, 0, 1, 0.9882353, 1,
-0.08243346, 1.597821, -0.02800449, 0, 1, 0.9921569, 1,
-0.07969614, -0.3196924, -2.690504, 0, 1, 1, 1,
-0.07751458, 1.033223, -1.470332, 0, 0.9921569, 1, 1,
-0.07548541, -0.6108456, -3.322578, 0, 0.9882353, 1, 1,
-0.07160585, -1.138117, -3.702272, 0, 0.9803922, 1, 1,
-0.07034253, 0.9316302, -0.8494888, 0, 0.9764706, 1, 1,
-0.06924246, -0.5155237, -3.479502, 0, 0.9686275, 1, 1,
-0.06705337, -0.116531, -1.800002, 0, 0.9647059, 1, 1,
-0.06383511, 0.05260633, -0.1974397, 0, 0.9568627, 1, 1,
-0.06180863, 0.3086209, 0.2666674, 0, 0.9529412, 1, 1,
-0.05918469, 1.410124, -1.011516, 0, 0.945098, 1, 1,
-0.05369347, 0.675459, -0.9930661, 0, 0.9411765, 1, 1,
-0.05092639, -1.201163, -2.937316, 0, 0.9333333, 1, 1,
-0.05074006, 0.8318831, 1.305519, 0, 0.9294118, 1, 1,
-0.04900384, 1.523183, 1.400247, 0, 0.9215686, 1, 1,
-0.0458434, 0.09320384, -0.9674487, 0, 0.9176471, 1, 1,
-0.04310994, -1.124505, -1.902279, 0, 0.9098039, 1, 1,
-0.04177135, 0.7752994, -0.1638663, 0, 0.9058824, 1, 1,
-0.04086002, -0.2203595, -4.014507, 0, 0.8980392, 1, 1,
-0.03678877, 1.034353, 0.3422124, 0, 0.8901961, 1, 1,
-0.03506346, -0.9181525, -0.8684452, 0, 0.8862745, 1, 1,
-0.03202606, 1.785052, -0.7578757, 0, 0.8784314, 1, 1,
-0.03034958, 0.9674376, 0.08901381, 0, 0.8745098, 1, 1,
-0.03029383, -0.4467725, -2.084226, 0, 0.8666667, 1, 1,
-0.02976496, 0.6170045, 0.714926, 0, 0.8627451, 1, 1,
-0.02922763, 0.6145005, 2.516029, 0, 0.854902, 1, 1,
-0.0289707, 1.377716, 0.4230081, 0, 0.8509804, 1, 1,
-0.02816783, 2.474007, -1.734721, 0, 0.8431373, 1, 1,
-0.02781258, -1.944757, -1.492705, 0, 0.8392157, 1, 1,
-0.02702462, 0.3115147, -2.357368, 0, 0.8313726, 1, 1,
-0.02506869, 0.375017, 0.06744893, 0, 0.827451, 1, 1,
-0.02477731, -1.457486, -2.464831, 0, 0.8196079, 1, 1,
-0.02474094, 0.1514077, 0.2521207, 0, 0.8156863, 1, 1,
-0.01937344, 0.2331614, -0.135977, 0, 0.8078431, 1, 1,
-0.01389649, 0.387867, 0.1240785, 0, 0.8039216, 1, 1,
-0.006637429, 1.074242, -0.9199185, 0, 0.7960784, 1, 1,
-0.005304291, 2.288236, 0.5584255, 0, 0.7882353, 1, 1,
-0.002718013, -0.6486073, -3.401714, 0, 0.7843137, 1, 1,
-0.001974707, 1.122391, 1.039638, 0, 0.7764706, 1, 1,
0.0005536278, -0.1470023, 2.386174, 0, 0.772549, 1, 1,
0.006533127, 0.3087615, -0.5679696, 0, 0.7647059, 1, 1,
0.008649291, 0.04278991, 2.016775, 0, 0.7607843, 1, 1,
0.01046348, 0.3458295, -0.7033117, 0, 0.7529412, 1, 1,
0.01233531, -0.739921, 3.263909, 0, 0.7490196, 1, 1,
0.01298781, -1.163462, 4.769456, 0, 0.7411765, 1, 1,
0.01419006, 0.3592939, -0.9675281, 0, 0.7372549, 1, 1,
0.01708238, 0.5862976, 2.593413, 0, 0.7294118, 1, 1,
0.01725114, -2.770848, 2.854048, 0, 0.7254902, 1, 1,
0.02683902, -0.08767083, 0.6013819, 0, 0.7176471, 1, 1,
0.03514164, -0.4902317, 1.687897, 0, 0.7137255, 1, 1,
0.03668576, -0.932485, 1.130005, 0, 0.7058824, 1, 1,
0.03907158, -0.07710438, 2.560794, 0, 0.6980392, 1, 1,
0.03987498, -0.7608317, 4.267861, 0, 0.6941177, 1, 1,
0.04137138, 0.2145132, -0.09051922, 0, 0.6862745, 1, 1,
0.04553692, -0.1041625, 1.387365, 0, 0.682353, 1, 1,
0.05058841, 1.932401, 1.609349, 0, 0.6745098, 1, 1,
0.05074293, 0.2080314, 1.09084, 0, 0.6705883, 1, 1,
0.05105967, 0.2491046, 1.095087, 0, 0.6627451, 1, 1,
0.053355, -0.1138452, 2.309408, 0, 0.6588235, 1, 1,
0.05818842, -0.4312412, 2.759132, 0, 0.6509804, 1, 1,
0.06001138, -0.4584002, 2.777557, 0, 0.6470588, 1, 1,
0.06890323, 0.9523898, 0.7835165, 0, 0.6392157, 1, 1,
0.07069376, -0.05097666, 1.328131, 0, 0.6352941, 1, 1,
0.07230723, -0.1820933, 2.101587, 0, 0.627451, 1, 1,
0.07569066, 0.3636928, -0.1610968, 0, 0.6235294, 1, 1,
0.07623784, -0.1130936, 3.701741, 0, 0.6156863, 1, 1,
0.08006363, -2.248919, 1.845399, 0, 0.6117647, 1, 1,
0.08590151, -0.7706577, 4.406908, 0, 0.6039216, 1, 1,
0.09024654, 0.4226641, 0.6563101, 0, 0.5960785, 1, 1,
0.09159679, -1.635318, 5.249986, 0, 0.5921569, 1, 1,
0.09280716, -0.02735356, 2.183716, 0, 0.5843138, 1, 1,
0.09465069, -0.3191008, 4.410834, 0, 0.5803922, 1, 1,
0.0947146, -2.153865, 3.507246, 0, 0.572549, 1, 1,
0.0957959, 1.584846, -1.324147, 0, 0.5686275, 1, 1,
0.0961342, 0.2805044, 2.169376, 0, 0.5607843, 1, 1,
0.09741528, -0.5674406, 1.214901, 0, 0.5568628, 1, 1,
0.1052214, 1.96471, -1.504647, 0, 0.5490196, 1, 1,
0.1073238, 0.4064817, -0.1880026, 0, 0.5450981, 1, 1,
0.1127601, 1.219351, -1.755289, 0, 0.5372549, 1, 1,
0.1163023, -0.1945153, 2.083304, 0, 0.5333334, 1, 1,
0.1292571, -1.323165, 3.585873, 0, 0.5254902, 1, 1,
0.1296013, 0.03473991, 1.325814, 0, 0.5215687, 1, 1,
0.1302134, 2.219306, -0.4255527, 0, 0.5137255, 1, 1,
0.1344758, -1.383783, 2.404591, 0, 0.509804, 1, 1,
0.1367641, -1.218832, 1.951601, 0, 0.5019608, 1, 1,
0.1383809, 0.4515452, -0.1665825, 0, 0.4941176, 1, 1,
0.1400135, 1.311648, 0.2818365, 0, 0.4901961, 1, 1,
0.1400399, 0.3947758, 0.08419581, 0, 0.4823529, 1, 1,
0.1451944, -0.2492595, 1.405121, 0, 0.4784314, 1, 1,
0.1454812, -0.7227426, 3.118783, 0, 0.4705882, 1, 1,
0.1456538, -0.5432037, 2.625978, 0, 0.4666667, 1, 1,
0.1459688, -0.6541931, 4.300258, 0, 0.4588235, 1, 1,
0.152239, -0.2043802, 3.338724, 0, 0.454902, 1, 1,
0.1529352, -0.1430503, 1.19401, 0, 0.4470588, 1, 1,
0.158262, 1.365926, -0.9539176, 0, 0.4431373, 1, 1,
0.1590324, -0.1902882, 4.040316, 0, 0.4352941, 1, 1,
0.1613932, -1.104849, 2.165798, 0, 0.4313726, 1, 1,
0.164608, -0.2409534, 3.388748, 0, 0.4235294, 1, 1,
0.1689823, 1.3509, 0.5727485, 0, 0.4196078, 1, 1,
0.178886, 0.04428982, 2.070054, 0, 0.4117647, 1, 1,
0.1816534, -2.169251, 3.007871, 0, 0.4078431, 1, 1,
0.1825146, 1.251512, 0.58187, 0, 0.4, 1, 1,
0.1855511, -0.9249386, 3.777305, 0, 0.3921569, 1, 1,
0.1868949, 0.4170042, -0.9596565, 0, 0.3882353, 1, 1,
0.1894843, -1.787422, 2.496195, 0, 0.3803922, 1, 1,
0.1901002, -0.4339601, 2.294435, 0, 0.3764706, 1, 1,
0.1907292, -1.343119, 1.844406, 0, 0.3686275, 1, 1,
0.1921576, -1.621265, 2.549117, 0, 0.3647059, 1, 1,
0.1943871, 0.3176979, 0.1146429, 0, 0.3568628, 1, 1,
0.1950701, 0.3475004, -1.569828, 0, 0.3529412, 1, 1,
0.1954686, -0.536494, 2.043291, 0, 0.345098, 1, 1,
0.202638, 1.196827, 1.188153, 0, 0.3411765, 1, 1,
0.2091399, -0.7834752, 3.575253, 0, 0.3333333, 1, 1,
0.2099305, 0.3681129, 0.5518038, 0, 0.3294118, 1, 1,
0.2102037, -0.4206544, 3.024863, 0, 0.3215686, 1, 1,
0.2122778, -0.274429, 0.9044201, 0, 0.3176471, 1, 1,
0.2186425, 1.518128, 0.6067156, 0, 0.3098039, 1, 1,
0.222167, 0.7850968, 0.3868634, 0, 0.3058824, 1, 1,
0.2251278, 1.68868, -1.054681, 0, 0.2980392, 1, 1,
0.2255914, -0.3296231, 1.657734, 0, 0.2901961, 1, 1,
0.2265789, 1.136687, 0.609818, 0, 0.2862745, 1, 1,
0.233704, -0.8631641, 3.346148, 0, 0.2784314, 1, 1,
0.2374781, -0.4573455, -0.04477648, 0, 0.2745098, 1, 1,
0.239913, -1.042865, 2.810165, 0, 0.2666667, 1, 1,
0.2409379, -1.584912, 2.575235, 0, 0.2627451, 1, 1,
0.2469741, 0.5937465, 0.565964, 0, 0.254902, 1, 1,
0.2491335, 0.6577463, 1.316102, 0, 0.2509804, 1, 1,
0.25113, 0.03551199, 2.189841, 0, 0.2431373, 1, 1,
0.2573174, 0.4657531, 0.5938087, 0, 0.2392157, 1, 1,
0.2589399, -0.04510432, 0.5502555, 0, 0.2313726, 1, 1,
0.2596677, 1.503595, -0.8152059, 0, 0.227451, 1, 1,
0.2626735, 1.51938, 1.214012, 0, 0.2196078, 1, 1,
0.2641358, 1.659075, -0.7727082, 0, 0.2156863, 1, 1,
0.2648747, -0.4420953, 4.497615, 0, 0.2078431, 1, 1,
0.2668321, -0.6042146, 2.09293, 0, 0.2039216, 1, 1,
0.2670765, 1.415095, 0.4102896, 0, 0.1960784, 1, 1,
0.2696969, -0.9541138, 1.985255, 0, 0.1882353, 1, 1,
0.2760814, -0.06941271, 2.63593, 0, 0.1843137, 1, 1,
0.2783244, -1.475233, 2.650171, 0, 0.1764706, 1, 1,
0.2791703, -0.04924412, 2.101446, 0, 0.172549, 1, 1,
0.2815, 0.9501559, 0.5996906, 0, 0.1647059, 1, 1,
0.2838896, -1.059056, 4.111445, 0, 0.1607843, 1, 1,
0.2842143, -0.9234755, 2.576181, 0, 0.1529412, 1, 1,
0.2886916, -0.6255778, 0.3900158, 0, 0.1490196, 1, 1,
0.2891557, 0.06688978, 0.2750513, 0, 0.1411765, 1, 1,
0.2898996, -1.287915, 3.852926, 0, 0.1372549, 1, 1,
0.2955454, 1.138469, 1.032605, 0, 0.1294118, 1, 1,
0.2983657, -0.7165216, 1.858079, 0, 0.1254902, 1, 1,
0.3003697, 1.463837, 1.475734, 0, 0.1176471, 1, 1,
0.3016666, -0.1135764, 1.655474, 0, 0.1137255, 1, 1,
0.302358, -0.5249632, 1.344652, 0, 0.1058824, 1, 1,
0.3053105, -0.07210577, 2.524012, 0, 0.09803922, 1, 1,
0.3072239, -0.7440256, 3.235833, 0, 0.09411765, 1, 1,
0.3109753, 1.616956, -1.513333, 0, 0.08627451, 1, 1,
0.3152163, 0.09166408, 1.780433, 0, 0.08235294, 1, 1,
0.321796, 0.8524521, -0.5098206, 0, 0.07450981, 1, 1,
0.3218314, -1.052261, 1.967007, 0, 0.07058824, 1, 1,
0.3305229, 1.721018, 0.7256638, 0, 0.0627451, 1, 1,
0.3313449, 0.07484756, 2.647795, 0, 0.05882353, 1, 1,
0.3365133, -1.041439, 3.918203, 0, 0.05098039, 1, 1,
0.3416159, 0.9696645, 1.440561, 0, 0.04705882, 1, 1,
0.3459225, -0.04743493, 1.596266, 0, 0.03921569, 1, 1,
0.3462871, 0.6187637, 1.096088, 0, 0.03529412, 1, 1,
0.3497133, 1.152867, 0.2460917, 0, 0.02745098, 1, 1,
0.35118, -0.7818086, 3.363991, 0, 0.02352941, 1, 1,
0.3525161, -1.723629, 2.546516, 0, 0.01568628, 1, 1,
0.3538403, 1.078061, -1.618772, 0, 0.01176471, 1, 1,
0.3600999, 1.386961, 1.104217, 0, 0.003921569, 1, 1,
0.3607722, -0.2196473, 1.709733, 0.003921569, 0, 1, 1,
0.3618526, -0.544115, 2.405688, 0.007843138, 0, 1, 1,
0.3662637, 0.6983588, 0.6215891, 0.01568628, 0, 1, 1,
0.3680834, -0.6801761, 1.21176, 0.01960784, 0, 1, 1,
0.3687961, -0.5238359, 2.756922, 0.02745098, 0, 1, 1,
0.3697838, 1.073012, -0.3455032, 0.03137255, 0, 1, 1,
0.3718269, 0.03173925, 1.589031, 0.03921569, 0, 1, 1,
0.3768116, -0.249138, 1.949984, 0.04313726, 0, 1, 1,
0.3769618, 0.2811525, 0.5195639, 0.05098039, 0, 1, 1,
0.3817042, 0.1149704, 1.210246, 0.05490196, 0, 1, 1,
0.3902285, -0.2554689, 3.564677, 0.0627451, 0, 1, 1,
0.3928671, -0.7564362, 2.66903, 0.06666667, 0, 1, 1,
0.3948198, -0.9629509, 3.733381, 0.07450981, 0, 1, 1,
0.3948758, 0.9498734, -1.386668, 0.07843138, 0, 1, 1,
0.395169, 0.4328501, 2.054766, 0.08627451, 0, 1, 1,
0.3957819, -0.1899438, 1.807883, 0.09019608, 0, 1, 1,
0.3984191, -0.6683089, 3.96081, 0.09803922, 0, 1, 1,
0.4047142, 0.5517535, 1.154122, 0.1058824, 0, 1, 1,
0.4054143, 0.09214325, 1.718367, 0.1098039, 0, 1, 1,
0.4058843, 1.699826, -0.03025221, 0.1176471, 0, 1, 1,
0.4083708, -2.180197, 2.452171, 0.1215686, 0, 1, 1,
0.4147218, 0.1356588, 0.6729044, 0.1294118, 0, 1, 1,
0.4181779, -0.539207, 1.10867, 0.1333333, 0, 1, 1,
0.4188941, 0.2772875, 2.079783, 0.1411765, 0, 1, 1,
0.4208826, 0.3283533, 0.762738, 0.145098, 0, 1, 1,
0.4218482, -0.8338975, 3.217776, 0.1529412, 0, 1, 1,
0.4221872, -0.4867901, 3.60358, 0.1568628, 0, 1, 1,
0.4224449, 0.9112363, 0.3639009, 0.1647059, 0, 1, 1,
0.4272648, 0.569003, -1.142627, 0.1686275, 0, 1, 1,
0.4290872, -0.7518068, 2.599236, 0.1764706, 0, 1, 1,
0.4320416, 1.901413, 2.479194, 0.1803922, 0, 1, 1,
0.4323738, -0.1138379, 1.722898, 0.1882353, 0, 1, 1,
0.4364936, -1.328478, 1.920019, 0.1921569, 0, 1, 1,
0.4385305, 1.454748, 1.060195, 0.2, 0, 1, 1,
0.4397365, 1.220837, 1.110539, 0.2078431, 0, 1, 1,
0.4404454, -0.04287744, 0.2604729, 0.2117647, 0, 1, 1,
0.4433659, -0.7413259, 3.767359, 0.2196078, 0, 1, 1,
0.4454434, 0.3310502, 4.180254, 0.2235294, 0, 1, 1,
0.4485302, -0.192976, 3.011473, 0.2313726, 0, 1, 1,
0.4525062, 1.674398, 0.05129215, 0.2352941, 0, 1, 1,
0.4590529, 0.1896712, 0.5283875, 0.2431373, 0, 1, 1,
0.4619306, 0.08266228, 0.5224993, 0.2470588, 0, 1, 1,
0.4662301, 0.5019321, 2.819694, 0.254902, 0, 1, 1,
0.4670477, -1.35198, 3.470085, 0.2588235, 0, 1, 1,
0.4673825, 0.3003105, 0.8297402, 0.2666667, 0, 1, 1,
0.4800628, -1.204204, 2.114812, 0.2705882, 0, 1, 1,
0.4856119, 0.1852255, 0.5135125, 0.2784314, 0, 1, 1,
0.4861564, 0.8671063, -0.1551479, 0.282353, 0, 1, 1,
0.4864857, 0.07768135, 2.153285, 0.2901961, 0, 1, 1,
0.4918391, -0.6453546, 1.145174, 0.2941177, 0, 1, 1,
0.4945032, -1.714685, 2.383266, 0.3019608, 0, 1, 1,
0.4961705, 0.4920419, 1.85953, 0.3098039, 0, 1, 1,
0.4985482, 1.377149, 0.1490376, 0.3137255, 0, 1, 1,
0.5001749, 1.779334, 1.976195, 0.3215686, 0, 1, 1,
0.5047548, -0.3351641, 4.479429, 0.3254902, 0, 1, 1,
0.5049999, 0.840793, 1.029567, 0.3333333, 0, 1, 1,
0.5077343, 0.5493571, 2.363662, 0.3372549, 0, 1, 1,
0.509101, -0.2563832, 0.05992119, 0.345098, 0, 1, 1,
0.5114665, -2.384789, 1.833829, 0.3490196, 0, 1, 1,
0.5139008, 1.319753, -0.8700717, 0.3568628, 0, 1, 1,
0.5139815, 0.02384901, 2.052832, 0.3607843, 0, 1, 1,
0.5201568, -0.01203417, -0.01937955, 0.3686275, 0, 1, 1,
0.5203626, 0.01973478, 1.612904, 0.372549, 0, 1, 1,
0.5219798, 0.005051679, 1.300401, 0.3803922, 0, 1, 1,
0.5222127, 0.03090495, 2.263528, 0.3843137, 0, 1, 1,
0.5227665, 0.3373725, 0.7493476, 0.3921569, 0, 1, 1,
0.524995, -1.892219, 3.822852, 0.3960784, 0, 1, 1,
0.534695, 0.2411276, -0.3628725, 0.4039216, 0, 1, 1,
0.5367408, -0.1103898, 2.153753, 0.4117647, 0, 1, 1,
0.5371377, 1.520208, -1.137165, 0.4156863, 0, 1, 1,
0.5453684, 1.764243, 0.9015352, 0.4235294, 0, 1, 1,
0.548243, -1.010564, 1.593372, 0.427451, 0, 1, 1,
0.5501333, -2.024529, 3.355643, 0.4352941, 0, 1, 1,
0.5542647, 1.904119, 0.3346954, 0.4392157, 0, 1, 1,
0.560339, -0.4713455, 2.555101, 0.4470588, 0, 1, 1,
0.5631803, -0.8014256, 3.469554, 0.4509804, 0, 1, 1,
0.5633704, -0.1521059, 2.826068, 0.4588235, 0, 1, 1,
0.5719837, 0.4380469, 0.4105512, 0.4627451, 0, 1, 1,
0.5726463, -0.4791825, 0.2564047, 0.4705882, 0, 1, 1,
0.574818, -0.01573725, 3.360978, 0.4745098, 0, 1, 1,
0.5836362, -0.7592007, 3.010193, 0.4823529, 0, 1, 1,
0.5875591, -0.9850502, 3.000168, 0.4862745, 0, 1, 1,
0.587679, -1.645933, 3.911104, 0.4941176, 0, 1, 1,
0.5929347, -0.004900463, 1.82123, 0.5019608, 0, 1, 1,
0.594141, -0.2487627, 2.548208, 0.5058824, 0, 1, 1,
0.6110666, -1.636944, 2.326985, 0.5137255, 0, 1, 1,
0.6147891, -1.239987, 2.946997, 0.5176471, 0, 1, 1,
0.6178468, -0.9711034, 2.22689, 0.5254902, 0, 1, 1,
0.6210129, 0.3142767, 0.6727453, 0.5294118, 0, 1, 1,
0.6259583, 0.6201893, 1.717242, 0.5372549, 0, 1, 1,
0.6280404, 0.3274958, 0.003718405, 0.5411765, 0, 1, 1,
0.628852, 0.3398554, 1.184905, 0.5490196, 0, 1, 1,
0.6337732, 2.171985, -0.2488848, 0.5529412, 0, 1, 1,
0.6339633, -0.2669338, 3.161736, 0.5607843, 0, 1, 1,
0.6363426, 2.0576, 0.01796307, 0.5647059, 0, 1, 1,
0.6410866, 0.5758851, 2.826261, 0.572549, 0, 1, 1,
0.6442678, -0.3752155, 0.2068583, 0.5764706, 0, 1, 1,
0.6448615, 1.163855, 0.06785225, 0.5843138, 0, 1, 1,
0.6474316, -0.2932851, 3.834108, 0.5882353, 0, 1, 1,
0.6501288, 2.576912, 1.476761, 0.5960785, 0, 1, 1,
0.6503274, 0.1953626, 0.871999, 0.6039216, 0, 1, 1,
0.6562135, 1.437334, 2.104556, 0.6078432, 0, 1, 1,
0.6658882, 0.07182293, 0.9378408, 0.6156863, 0, 1, 1,
0.6695644, -0.08155722, -0.2452314, 0.6196079, 0, 1, 1,
0.6753405, 1.575709, 2.11421, 0.627451, 0, 1, 1,
0.6780831, 1.940703, -0.2179294, 0.6313726, 0, 1, 1,
0.6785386, -0.3716469, 2.161246, 0.6392157, 0, 1, 1,
0.6797254, -0.32717, 2.575363, 0.6431373, 0, 1, 1,
0.6846669, 0.2961491, 0.06851654, 0.6509804, 0, 1, 1,
0.6975645, 2.332744, -0.2935841, 0.654902, 0, 1, 1,
0.6982762, 1.988949, 1.05362, 0.6627451, 0, 1, 1,
0.7002594, -1.331347, 1.885833, 0.6666667, 0, 1, 1,
0.7100551, -0.9695213, 3.261774, 0.6745098, 0, 1, 1,
0.7138537, -0.5267109, 0.5866856, 0.6784314, 0, 1, 1,
0.7156134, -0.1571317, 2.456184, 0.6862745, 0, 1, 1,
0.7172545, -0.2377927, 0.9706152, 0.6901961, 0, 1, 1,
0.7174511, -1.573483, 1.567019, 0.6980392, 0, 1, 1,
0.7225365, -0.7910197, 2.297472, 0.7058824, 0, 1, 1,
0.7226285, -0.5421463, 0.9831911, 0.7098039, 0, 1, 1,
0.7256847, -0.3300821, 2.633808, 0.7176471, 0, 1, 1,
0.7270507, -0.3191749, 2.270207, 0.7215686, 0, 1, 1,
0.7276934, -0.189291, 1.351056, 0.7294118, 0, 1, 1,
0.7278968, 1.100374, 1.81562, 0.7333333, 0, 1, 1,
0.729499, -0.4247451, 2.191937, 0.7411765, 0, 1, 1,
0.7331564, 0.04114955, 0.170983, 0.7450981, 0, 1, 1,
0.7373201, -0.1098582, 2.801377, 0.7529412, 0, 1, 1,
0.7381828, 0.4566511, 1.194832, 0.7568628, 0, 1, 1,
0.7407374, -1.264848, 3.717489, 0.7647059, 0, 1, 1,
0.7458839, -1.363099, 3.922927, 0.7686275, 0, 1, 1,
0.7513973, -0.7633068, 1.290171, 0.7764706, 0, 1, 1,
0.7557511, 0.2106726, 0.6275456, 0.7803922, 0, 1, 1,
0.7691762, 1.525505, 1.138999, 0.7882353, 0, 1, 1,
0.7716429, 2.674647, 1.257793, 0.7921569, 0, 1, 1,
0.7718832, 1.31309, 0.09844315, 0.8, 0, 1, 1,
0.7771316, -0.9181702, 3.071196, 0.8078431, 0, 1, 1,
0.7780342, -0.07126937, 2.498996, 0.8117647, 0, 1, 1,
0.7802497, 0.3724676, 1.239562, 0.8196079, 0, 1, 1,
0.7843722, -0.4105165, 1.655529, 0.8235294, 0, 1, 1,
0.7971444, 0.6209183, 3.639988, 0.8313726, 0, 1, 1,
0.8020524, -1.043007, 3.756486, 0.8352941, 0, 1, 1,
0.8052126, -0.9331913, 2.293746, 0.8431373, 0, 1, 1,
0.8069778, -0.4358445, 1.272187, 0.8470588, 0, 1, 1,
0.8087291, -0.1161129, 0.8166262, 0.854902, 0, 1, 1,
0.8090369, 0.0588255, 1.211939, 0.8588235, 0, 1, 1,
0.8232247, 0.7275405, 1.146803, 0.8666667, 0, 1, 1,
0.8241797, 0.7373707, 1.312136, 0.8705882, 0, 1, 1,
0.8256089, 1.116204, 1.225019, 0.8784314, 0, 1, 1,
0.8280181, 0.3051915, -0.1651427, 0.8823529, 0, 1, 1,
0.831665, 0.06127178, 0.8671542, 0.8901961, 0, 1, 1,
0.8346658, 0.7106897, 0.553538, 0.8941177, 0, 1, 1,
0.8347561, 1.478409, 1.445023, 0.9019608, 0, 1, 1,
0.8364346, 0.03513101, 1.456895, 0.9098039, 0, 1, 1,
0.8405704, 1.08964, 1.492935, 0.9137255, 0, 1, 1,
0.8501958, -1.001444, 1.126868, 0.9215686, 0, 1, 1,
0.8505005, -0.234655, 2.27338, 0.9254902, 0, 1, 1,
0.8508499, 0.2340411, 0.9167015, 0.9333333, 0, 1, 1,
0.8533875, -1.147775, 4.222656, 0.9372549, 0, 1, 1,
0.8567795, 2.61662, -0.09988207, 0.945098, 0, 1, 1,
0.8605058, 1.062298, 0.1003548, 0.9490196, 0, 1, 1,
0.8619351, 0.9097368, -0.8371731, 0.9568627, 0, 1, 1,
0.8661057, 1.653174, 1.184413, 0.9607843, 0, 1, 1,
0.866533, 0.378846, 1.058143, 0.9686275, 0, 1, 1,
0.8667728, -1.123515, 1.826335, 0.972549, 0, 1, 1,
0.8802283, 0.1106212, 1.292609, 0.9803922, 0, 1, 1,
0.8818101, -0.9522363, 2.742354, 0.9843137, 0, 1, 1,
0.8889059, -0.04581774, 0.7737885, 0.9921569, 0, 1, 1,
0.8946707, 0.1162706, 0.3111028, 0.9960784, 0, 1, 1,
0.8987461, -0.599947, 0.01587635, 1, 0, 0.9960784, 1,
0.9020373, 0.4418037, 2.262862, 1, 0, 0.9882353, 1,
0.9077421, 0.06161989, 0.4719537, 1, 0, 0.9843137, 1,
0.9155639, 1.113832, 1.07837, 1, 0, 0.9764706, 1,
0.9332054, -0.823348, 2.299428, 1, 0, 0.972549, 1,
0.9337052, -0.7470344, 2.353642, 1, 0, 0.9647059, 1,
0.9368562, 0.5974427, -0.1658883, 1, 0, 0.9607843, 1,
0.9374675, -0.1358797, 0.8724172, 1, 0, 0.9529412, 1,
0.9403321, -0.6011, 1.477242, 1, 0, 0.9490196, 1,
0.9433041, 0.8379507, 0.9529029, 1, 0, 0.9411765, 1,
0.9505557, -1.107309, 3.848524, 1, 0, 0.9372549, 1,
0.9541042, 0.009268164, 1.990888, 1, 0, 0.9294118, 1,
0.9581016, 0.6000522, -0.5214401, 1, 0, 0.9254902, 1,
0.9631688, -0.5464299, 1.928597, 1, 0, 0.9176471, 1,
0.9671662, -1.327955, 2.304193, 1, 0, 0.9137255, 1,
0.9834097, -1.014125, 2.580507, 1, 0, 0.9058824, 1,
0.9869353, -1.331944, 2.56969, 1, 0, 0.9019608, 1,
0.9931908, -1.664274, 3.448213, 1, 0, 0.8941177, 1,
0.9933614, -0.3513931, 1.699978, 1, 0, 0.8862745, 1,
1.004335, -1.891956, 3.676111, 1, 0, 0.8823529, 1,
1.005172, 0.2659413, 1.031438, 1, 0, 0.8745098, 1,
1.007828, 0.8826128, 1.165881, 1, 0, 0.8705882, 1,
1.016534, 0.1795175, 2.480113, 1, 0, 0.8627451, 1,
1.017766, 0.1551256, 0.8115698, 1, 0, 0.8588235, 1,
1.019902, 1.306556, 1.939269, 1, 0, 0.8509804, 1,
1.021314, -1.085889, 3.401946, 1, 0, 0.8470588, 1,
1.022118, 0.008002818, 2.535549, 1, 0, 0.8392157, 1,
1.023332, 1.238776, -0.5435, 1, 0, 0.8352941, 1,
1.023896, 0.9129265, 2.890566, 1, 0, 0.827451, 1,
1.024433, -1.476498, 2.225731, 1, 0, 0.8235294, 1,
1.026087, -0.08333329, 1.39901, 1, 0, 0.8156863, 1,
1.029935, 0.4561847, 2.21744, 1, 0, 0.8117647, 1,
1.031701, -0.01220508, 3.125504, 1, 0, 0.8039216, 1,
1.040384, 0.3672112, 2.071125, 1, 0, 0.7960784, 1,
1.042205, 0.3136226, 1.970069, 1, 0, 0.7921569, 1,
1.044352, 0.02773389, 1.401684, 1, 0, 0.7843137, 1,
1.044517, 0.5475885, 1.772973, 1, 0, 0.7803922, 1,
1.053954, -1.300712, 3.189801, 1, 0, 0.772549, 1,
1.055151, 0.4109368, 1.591909, 1, 0, 0.7686275, 1,
1.063551, 0.8054403, 2.929997, 1, 0, 0.7607843, 1,
1.086747, 1.236203, -0.179525, 1, 0, 0.7568628, 1,
1.09164, -0.209824, 1.957089, 1, 0, 0.7490196, 1,
1.092059, 1.596129, 2.776543, 1, 0, 0.7450981, 1,
1.092503, -0.7416108, 2.783495, 1, 0, 0.7372549, 1,
1.093685, -1.439, 1.18426, 1, 0, 0.7333333, 1,
1.101263, -0.3004678, 2.027073, 1, 0, 0.7254902, 1,
1.133824, -0.1169829, 1.341063, 1, 0, 0.7215686, 1,
1.137707, 0.9219394, 1.051462, 1, 0, 0.7137255, 1,
1.142623, -1.605358, 1.709185, 1, 0, 0.7098039, 1,
1.146623, -0.08251243, 1.854815, 1, 0, 0.7019608, 1,
1.150033, -0.3117417, 2.336208, 1, 0, 0.6941177, 1,
1.155455, -0.1255301, 0.7436208, 1, 0, 0.6901961, 1,
1.156009, 1.106334, -0.8186831, 1, 0, 0.682353, 1,
1.156793, 0.273643, 0.5199787, 1, 0, 0.6784314, 1,
1.160041, 2.210565, 0.1515626, 1, 0, 0.6705883, 1,
1.167034, 0.006274532, 2.434564, 1, 0, 0.6666667, 1,
1.167626, -2.126394, 2.298584, 1, 0, 0.6588235, 1,
1.168383, -0.9296604, 1.592081, 1, 0, 0.654902, 1,
1.184607, 0.02391797, 0.634644, 1, 0, 0.6470588, 1,
1.191534, 0.5480624, 1.104226, 1, 0, 0.6431373, 1,
1.198006, -0.8614145, 2.750832, 1, 0, 0.6352941, 1,
1.198096, 0.4286681, 0.9804963, 1, 0, 0.6313726, 1,
1.20016, 1.83391, -0.08005144, 1, 0, 0.6235294, 1,
1.209549, 0.3480597, 1.471334, 1, 0, 0.6196079, 1,
1.210949, -1.263425, 4.534739, 1, 0, 0.6117647, 1,
1.215437, 0.06286779, -0.2834288, 1, 0, 0.6078432, 1,
1.218786, 1.100302, 0.7440596, 1, 0, 0.6, 1,
1.221521, 0.3653245, 1.489891, 1, 0, 0.5921569, 1,
1.224426, 0.3671797, 0.6107804, 1, 0, 0.5882353, 1,
1.232616, 2.048544, 0.05990229, 1, 0, 0.5803922, 1,
1.233614, 0.5668703, 2.296724, 1, 0, 0.5764706, 1,
1.234599, -0.876376, 2.991997, 1, 0, 0.5686275, 1,
1.242542, -0.4752529, 2.430737, 1, 0, 0.5647059, 1,
1.268136, 0.6663208, -0.362862, 1, 0, 0.5568628, 1,
1.274229, -1.417231, 2.369351, 1, 0, 0.5529412, 1,
1.27554, -0.219138, 3.365267, 1, 0, 0.5450981, 1,
1.279831, -0.1077293, 3.564502, 1, 0, 0.5411765, 1,
1.284681, -0.1898133, 0.4416857, 1, 0, 0.5333334, 1,
1.2969, 1.096785, 2.370628, 1, 0, 0.5294118, 1,
1.29766, -0.167282, 0.4466998, 1, 0, 0.5215687, 1,
1.311051, 0.6291568, 0.8649279, 1, 0, 0.5176471, 1,
1.319687, -1.155315, 0.6766005, 1, 0, 0.509804, 1,
1.319754, 0.1398812, 3.084162, 1, 0, 0.5058824, 1,
1.32083, -0.5888345, 1.557409, 1, 0, 0.4980392, 1,
1.327244, -0.8554671, 1.359921, 1, 0, 0.4901961, 1,
1.332859, -0.691294, 2.497679, 1, 0, 0.4862745, 1,
1.335282, -0.1516541, 2.234761, 1, 0, 0.4784314, 1,
1.350418, -1.785334, 2.628212, 1, 0, 0.4745098, 1,
1.351169, 0.4060227, 2.055306, 1, 0, 0.4666667, 1,
1.355225, 2.207735, 1.44455, 1, 0, 0.4627451, 1,
1.355368, 0.5030686, 1.540884, 1, 0, 0.454902, 1,
1.360939, -2.352046, 3.387635, 1, 0, 0.4509804, 1,
1.365264, -0.7525206, 2.452035, 1, 0, 0.4431373, 1,
1.371844, -0.9314927, 0.05370933, 1, 0, 0.4392157, 1,
1.376651, 0.8234639, 0.7657087, 1, 0, 0.4313726, 1,
1.379638, 0.5065832, 2.872078, 1, 0, 0.427451, 1,
1.387336, -0.3300825, 2.436845, 1, 0, 0.4196078, 1,
1.394718, 0.1615345, 0.09633498, 1, 0, 0.4156863, 1,
1.400482, -0.01138045, 1.560423, 1, 0, 0.4078431, 1,
1.406337, 0.9307557, 0.4105737, 1, 0, 0.4039216, 1,
1.411046, -0.2896877, -0.2037708, 1, 0, 0.3960784, 1,
1.416697, 1.443182, 1.127091, 1, 0, 0.3882353, 1,
1.420063, -0.4997748, 1.467387, 1, 0, 0.3843137, 1,
1.436227, 0.3883382, 2.57548, 1, 0, 0.3764706, 1,
1.445039, 0.5529616, 1.228248, 1, 0, 0.372549, 1,
1.447884, -0.3816737, 1.584725, 1, 0, 0.3647059, 1,
1.454353, 0.4652548, 3.214837, 1, 0, 0.3607843, 1,
1.491437, 0.6400525, 1.468392, 1, 0, 0.3529412, 1,
1.492205, -1.441183, 2.569829, 1, 0, 0.3490196, 1,
1.511795, -0.08466841, 1.831706, 1, 0, 0.3411765, 1,
1.516818, 0.3889625, 1.615776, 1, 0, 0.3372549, 1,
1.517126, 0.8805846, -0.01405391, 1, 0, 0.3294118, 1,
1.526214, -0.3567024, 1.249436, 1, 0, 0.3254902, 1,
1.537323, -1.421252, 1.076813, 1, 0, 0.3176471, 1,
1.588017, -1.50583, 0.5874186, 1, 0, 0.3137255, 1,
1.608274, 0.9256783, -0.4614188, 1, 0, 0.3058824, 1,
1.629545, -0.6689065, 2.169717, 1, 0, 0.2980392, 1,
1.632524, 1.112768, -0.03667431, 1, 0, 0.2941177, 1,
1.633064, -1.728825, 2.344949, 1, 0, 0.2862745, 1,
1.635303, 1.068912, 0.3561212, 1, 0, 0.282353, 1,
1.647704, 1.000733, 0.002651597, 1, 0, 0.2745098, 1,
1.66185, -1.826208, 1.002746, 1, 0, 0.2705882, 1,
1.677939, 0.2322335, 1.348429, 1, 0, 0.2627451, 1,
1.678558, -1.24345, 0.8981605, 1, 0, 0.2588235, 1,
1.687902, 1.63475, 1.773954, 1, 0, 0.2509804, 1,
1.697604, 1.98682, 0.7495505, 1, 0, 0.2470588, 1,
1.700803, -0.4124696, 0.553481, 1, 0, 0.2392157, 1,
1.732836, 0.8913718, 0.001464327, 1, 0, 0.2352941, 1,
1.73722, 0.05229749, 3.085128, 1, 0, 0.227451, 1,
1.745909, 0.2291254, 0.6258325, 1, 0, 0.2235294, 1,
1.756613, 1.26172, -0.4082632, 1, 0, 0.2156863, 1,
1.761801, -2.37964, 1.979531, 1, 0, 0.2117647, 1,
1.790363, -0.1813919, 1.483039, 1, 0, 0.2039216, 1,
1.81489, 0.4725284, 2.515471, 1, 0, 0.1960784, 1,
1.840841, -1.328211, 3.412995, 1, 0, 0.1921569, 1,
1.842629, 1.085705, 1.416247, 1, 0, 0.1843137, 1,
1.843592, 0.7300159, 1.192264, 1, 0, 0.1803922, 1,
1.877156, 0.5987974, 1.252967, 1, 0, 0.172549, 1,
1.909966, 1.047798, -0.08110406, 1, 0, 0.1686275, 1,
1.912248, -0.9034502, 0.4261956, 1, 0, 0.1607843, 1,
1.936446, -0.9202759, 4.212935, 1, 0, 0.1568628, 1,
1.973096, -0.6628892, 1.563375, 1, 0, 0.1490196, 1,
1.981259, 0.1695872, 2.736017, 1, 0, 0.145098, 1,
2.003832, 0.06222564, 1.476624, 1, 0, 0.1372549, 1,
2.00643, -1.072786, 3.094292, 1, 0, 0.1333333, 1,
2.015346, -0.04816974, 1.315519, 1, 0, 0.1254902, 1,
2.034202, 0.7661695, 2.207932, 1, 0, 0.1215686, 1,
2.074865, 0.1336509, 3.464986, 1, 0, 0.1137255, 1,
2.119308, 0.249349, 0.7828358, 1, 0, 0.1098039, 1,
2.125344, 0.1086501, 3.652369, 1, 0, 0.1019608, 1,
2.15163, 0.09148313, 1.24589, 1, 0, 0.09411765, 1,
2.201108, 0.938589, 1.584996, 1, 0, 0.09019608, 1,
2.211051, 0.5214704, 1.91361, 1, 0, 0.08235294, 1,
2.214951, 1.049632, 0.4944241, 1, 0, 0.07843138, 1,
2.280524, 1.971274, 3.191777, 1, 0, 0.07058824, 1,
2.286384, 1.123271, 1.363669, 1, 0, 0.06666667, 1,
2.343455, 0.5653085, -0.2285159, 1, 0, 0.05882353, 1,
2.376307, 0.3502486, 3.063093, 1, 0, 0.05490196, 1,
2.379415, -0.1973261, 1.648236, 1, 0, 0.04705882, 1,
2.389337, 0.9538722, 2.213459, 1, 0, 0.04313726, 1,
2.587472, -0.160534, 1.972252, 1, 0, 0.03529412, 1,
2.637536, 0.3851291, 0.3826022, 1, 0, 0.03137255, 1,
2.654834, 0.3262329, 1.097146, 1, 0, 0.02352941, 1,
2.863991, -0.9767532, 3.054504, 1, 0, 0.01960784, 1,
3.212806, -0.9829168, 2.726109, 1, 0, 0.01176471, 1,
3.30522, 3.267417, 0.2589491, 1, 0, 0.007843138, 1
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
0.1466647, -3.794334, -8.212185, 0, -0.5, 0.5, 0.5,
0.1466647, -3.794334, -8.212185, 1, -0.5, 0.5, 0.5,
0.1466647, -3.794334, -8.212185, 1, 1.5, 0.5, 0.5,
0.1466647, -3.794334, -8.212185, 0, 1.5, 0.5, 0.5
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
-4.08264, 0.2482845, -8.212185, 0, -0.5, 0.5, 0.5,
-4.08264, 0.2482845, -8.212185, 1, -0.5, 0.5, 0.5,
-4.08264, 0.2482845, -8.212185, 1, 1.5, 0.5, 0.5,
-4.08264, 0.2482845, -8.212185, 0, 1.5, 0.5, 0.5
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
-4.08264, -3.794334, -0.5055385, 0, -0.5, 0.5, 0.5,
-4.08264, -3.794334, -0.5055385, 1, -0.5, 0.5, 0.5,
-4.08264, -3.794334, -0.5055385, 1, 1.5, 0.5, 0.5,
-4.08264, -3.794334, -0.5055385, 0, 1.5, 0.5, 0.5
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
-3, -2.861422, -6.433728,
3, -2.861422, -6.433728,
-3, -2.861422, -6.433728,
-3, -3.016908, -6.730138,
-2, -2.861422, -6.433728,
-2, -3.016908, -6.730138,
-1, -2.861422, -6.433728,
-1, -3.016908, -6.730138,
0, -2.861422, -6.433728,
0, -3.016908, -6.730138,
1, -2.861422, -6.433728,
1, -3.016908, -6.730138,
2, -2.861422, -6.433728,
2, -3.016908, -6.730138,
3, -2.861422, -6.433728,
3, -3.016908, -6.730138
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
-3, -3.327878, -7.322957, 0, -0.5, 0.5, 0.5,
-3, -3.327878, -7.322957, 1, -0.5, 0.5, 0.5,
-3, -3.327878, -7.322957, 1, 1.5, 0.5, 0.5,
-3, -3.327878, -7.322957, 0, 1.5, 0.5, 0.5,
-2, -3.327878, -7.322957, 0, -0.5, 0.5, 0.5,
-2, -3.327878, -7.322957, 1, -0.5, 0.5, 0.5,
-2, -3.327878, -7.322957, 1, 1.5, 0.5, 0.5,
-2, -3.327878, -7.322957, 0, 1.5, 0.5, 0.5,
-1, -3.327878, -7.322957, 0, -0.5, 0.5, 0.5,
-1, -3.327878, -7.322957, 1, -0.5, 0.5, 0.5,
-1, -3.327878, -7.322957, 1, 1.5, 0.5, 0.5,
-1, -3.327878, -7.322957, 0, 1.5, 0.5, 0.5,
0, -3.327878, -7.322957, 0, -0.5, 0.5, 0.5,
0, -3.327878, -7.322957, 1, -0.5, 0.5, 0.5,
0, -3.327878, -7.322957, 1, 1.5, 0.5, 0.5,
0, -3.327878, -7.322957, 0, 1.5, 0.5, 0.5,
1, -3.327878, -7.322957, 0, -0.5, 0.5, 0.5,
1, -3.327878, -7.322957, 1, -0.5, 0.5, 0.5,
1, -3.327878, -7.322957, 1, 1.5, 0.5, 0.5,
1, -3.327878, -7.322957, 0, 1.5, 0.5, 0.5,
2, -3.327878, -7.322957, 0, -0.5, 0.5, 0.5,
2, -3.327878, -7.322957, 1, -0.5, 0.5, 0.5,
2, -3.327878, -7.322957, 1, 1.5, 0.5, 0.5,
2, -3.327878, -7.322957, 0, 1.5, 0.5, 0.5,
3, -3.327878, -7.322957, 0, -0.5, 0.5, 0.5,
3, -3.327878, -7.322957, 1, -0.5, 0.5, 0.5,
3, -3.327878, -7.322957, 1, 1.5, 0.5, 0.5,
3, -3.327878, -7.322957, 0, 1.5, 0.5, 0.5
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
-3.106647, -2, -6.433728,
-3.106647, 3, -6.433728,
-3.106647, -2, -6.433728,
-3.269312, -2, -6.730138,
-3.106647, -1, -6.433728,
-3.269312, -1, -6.730138,
-3.106647, 0, -6.433728,
-3.269312, 0, -6.730138,
-3.106647, 1, -6.433728,
-3.269312, 1, -6.730138,
-3.106647, 2, -6.433728,
-3.269312, 2, -6.730138,
-3.106647, 3, -6.433728,
-3.269312, 3, -6.730138
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
-3.594644, -2, -7.322957, 0, -0.5, 0.5, 0.5,
-3.594644, -2, -7.322957, 1, -0.5, 0.5, 0.5,
-3.594644, -2, -7.322957, 1, 1.5, 0.5, 0.5,
-3.594644, -2, -7.322957, 0, 1.5, 0.5, 0.5,
-3.594644, -1, -7.322957, 0, -0.5, 0.5, 0.5,
-3.594644, -1, -7.322957, 1, -0.5, 0.5, 0.5,
-3.594644, -1, -7.322957, 1, 1.5, 0.5, 0.5,
-3.594644, -1, -7.322957, 0, 1.5, 0.5, 0.5,
-3.594644, 0, -7.322957, 0, -0.5, 0.5, 0.5,
-3.594644, 0, -7.322957, 1, -0.5, 0.5, 0.5,
-3.594644, 0, -7.322957, 1, 1.5, 0.5, 0.5,
-3.594644, 0, -7.322957, 0, 1.5, 0.5, 0.5,
-3.594644, 1, -7.322957, 0, -0.5, 0.5, 0.5,
-3.594644, 1, -7.322957, 1, -0.5, 0.5, 0.5,
-3.594644, 1, -7.322957, 1, 1.5, 0.5, 0.5,
-3.594644, 1, -7.322957, 0, 1.5, 0.5, 0.5,
-3.594644, 2, -7.322957, 0, -0.5, 0.5, 0.5,
-3.594644, 2, -7.322957, 1, -0.5, 0.5, 0.5,
-3.594644, 2, -7.322957, 1, 1.5, 0.5, 0.5,
-3.594644, 2, -7.322957, 0, 1.5, 0.5, 0.5,
-3.594644, 3, -7.322957, 0, -0.5, 0.5, 0.5,
-3.594644, 3, -7.322957, 1, -0.5, 0.5, 0.5,
-3.594644, 3, -7.322957, 1, 1.5, 0.5, 0.5,
-3.594644, 3, -7.322957, 0, 1.5, 0.5, 0.5
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
-3.106647, -2.861422, -6,
-3.106647, -2.861422, 4,
-3.106647, -2.861422, -6,
-3.269312, -3.016908, -6,
-3.106647, -2.861422, -4,
-3.269312, -3.016908, -4,
-3.106647, -2.861422, -2,
-3.269312, -3.016908, -2,
-3.106647, -2.861422, 0,
-3.269312, -3.016908, 0,
-3.106647, -2.861422, 2,
-3.269312, -3.016908, 2,
-3.106647, -2.861422, 4,
-3.269312, -3.016908, 4
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
-3.594644, -3.327878, -6, 0, -0.5, 0.5, 0.5,
-3.594644, -3.327878, -6, 1, -0.5, 0.5, 0.5,
-3.594644, -3.327878, -6, 1, 1.5, 0.5, 0.5,
-3.594644, -3.327878, -6, 0, 1.5, 0.5, 0.5,
-3.594644, -3.327878, -4, 0, -0.5, 0.5, 0.5,
-3.594644, -3.327878, -4, 1, -0.5, 0.5, 0.5,
-3.594644, -3.327878, -4, 1, 1.5, 0.5, 0.5,
-3.594644, -3.327878, -4, 0, 1.5, 0.5, 0.5,
-3.594644, -3.327878, -2, 0, -0.5, 0.5, 0.5,
-3.594644, -3.327878, -2, 1, -0.5, 0.5, 0.5,
-3.594644, -3.327878, -2, 1, 1.5, 0.5, 0.5,
-3.594644, -3.327878, -2, 0, 1.5, 0.5, 0.5,
-3.594644, -3.327878, 0, 0, -0.5, 0.5, 0.5,
-3.594644, -3.327878, 0, 1, -0.5, 0.5, 0.5,
-3.594644, -3.327878, 0, 1, 1.5, 0.5, 0.5,
-3.594644, -3.327878, 0, 0, 1.5, 0.5, 0.5,
-3.594644, -3.327878, 2, 0, -0.5, 0.5, 0.5,
-3.594644, -3.327878, 2, 1, -0.5, 0.5, 0.5,
-3.594644, -3.327878, 2, 1, 1.5, 0.5, 0.5,
-3.594644, -3.327878, 2, 0, 1.5, 0.5, 0.5,
-3.594644, -3.327878, 4, 0, -0.5, 0.5, 0.5,
-3.594644, -3.327878, 4, 1, -0.5, 0.5, 0.5,
-3.594644, -3.327878, 4, 1, 1.5, 0.5, 0.5,
-3.594644, -3.327878, 4, 0, 1.5, 0.5, 0.5
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
-3.106647, -2.861422, -6.433728,
-3.106647, 3.357991, -6.433728,
-3.106647, -2.861422, 5.422651,
-3.106647, 3.357991, 5.422651,
-3.106647, -2.861422, -6.433728,
-3.106647, -2.861422, 5.422651,
-3.106647, 3.357991, -6.433728,
-3.106647, 3.357991, 5.422651,
-3.106647, -2.861422, -6.433728,
3.399976, -2.861422, -6.433728,
-3.106647, -2.861422, 5.422651,
3.399976, -2.861422, 5.422651,
-3.106647, 3.357991, -6.433728,
3.399976, 3.357991, -6.433728,
-3.106647, 3.357991, 5.422651,
3.399976, 3.357991, 5.422651,
3.399976, -2.861422, -6.433728,
3.399976, 3.357991, -6.433728,
3.399976, -2.861422, 5.422651,
3.399976, 3.357991, 5.422651,
3.399976, -2.861422, -6.433728,
3.399976, -2.861422, 5.422651,
3.399976, 3.357991, -6.433728,
3.399976, 3.357991, 5.422651
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
var radius = 7.948799;
var distance = 35.3651;
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
mvMatrix.translate( -0.1466647, -0.2482845, 0.5055385 );
mvMatrix.scale( 1.320869, 1.381866, 0.7248753 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.3651);
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
disodium_arsenate_di<-read.table("disodium_arsenate_di.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 2 did not have 5 elements
```

```r
x<-disodium_arsenate_di$V2
```

```
## Error in eval(expr, envir, enclos): object 'disodium_arsenate_di' not found
```

```r
y<-disodium_arsenate_di$V3
```

```
## Error in eval(expr, envir, enclos): object 'disodium_arsenate_di' not found
```

```r
z<-disodium_arsenate_di$V4
```

```
## Error in eval(expr, envir, enclos): object 'disodium_arsenate_di' not found
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
-3.01189, 1.804381, -1.534585, 0, 0, 1, 1, 1,
-2.884364, 1.317153, -1.296494, 1, 0, 0, 1, 1,
-2.866846, 0.3171302, -2.132807, 1, 0, 0, 1, 1,
-2.768647, 1.218532, -1.695881, 1, 0, 0, 1, 1,
-2.645, 0.4265653, -0.2891852, 1, 0, 0, 1, 1,
-2.532943, -0.7454731, -2.145296, 1, 0, 0, 1, 1,
-2.520397, 0.4300689, -0.7391012, 0, 0, 0, 1, 1,
-2.475914, 1.09813, -0.4782035, 0, 0, 0, 1, 1,
-2.392822, 0.8405138, -1.442568, 0, 0, 0, 1, 1,
-2.392125, 1.628682, -1.273106, 0, 0, 0, 1, 1,
-2.298887, 2.416605, -0.2276007, 0, 0, 0, 1, 1,
-2.292112, -0.3074486, -1.803514, 0, 0, 0, 1, 1,
-2.289362, 0.784233, -1.044056, 0, 0, 0, 1, 1,
-2.27465, 0.3146111, -0.708945, 1, 1, 1, 1, 1,
-2.250146, -0.5646105, -1.174959, 1, 1, 1, 1, 1,
-2.232408, -1.244476, -0.7116882, 1, 1, 1, 1, 1,
-2.229068, 1.408555, 0.3310823, 1, 1, 1, 1, 1,
-2.219043, 0.8469371, -1.551394, 1, 1, 1, 1, 1,
-2.192955, -0.2984839, -3.737224, 1, 1, 1, 1, 1,
-2.147523, -1.149244, -1.077742, 1, 1, 1, 1, 1,
-2.145942, -1.547184, -1.791371, 1, 1, 1, 1, 1,
-2.111986, -0.9055197, -0.807196, 1, 1, 1, 1, 1,
-2.108307, -1.55818, -3.566703, 1, 1, 1, 1, 1,
-2.106696, 1.606967, -1.261138, 1, 1, 1, 1, 1,
-2.069491, 0.7164072, -1.911125, 1, 1, 1, 1, 1,
-2.068811, -0.3734579, -0.1418845, 1, 1, 1, 1, 1,
-2.060452, -1.259926, -2.505568, 1, 1, 1, 1, 1,
-2.0504, -0.2767078, -1.619315, 1, 1, 1, 1, 1,
-2.034649, -0.4968525, -0.2450415, 0, 0, 1, 1, 1,
-2.025252, 0.1440467, -1.289354, 1, 0, 0, 1, 1,
-2.006228, -1.123855, -2.577719, 1, 0, 0, 1, 1,
-1.986194, 1.213149, -0.7609054, 1, 0, 0, 1, 1,
-1.972526, -0.2271928, -0.01838551, 1, 0, 0, 1, 1,
-1.953708, -0.6031902, -1.881347, 1, 0, 0, 1, 1,
-1.946752, 0.747525, -0.3659103, 0, 0, 0, 1, 1,
-1.938103, 0.3176281, -1.45871, 0, 0, 0, 1, 1,
-1.93361, 0.1261615, -2.299078, 0, 0, 0, 1, 1,
-1.890855, -1.672714, -0.7615442, 0, 0, 0, 1, 1,
-1.855419, -0.7668607, -0.8719974, 0, 0, 0, 1, 1,
-1.851073, 2.174517, -0.6786051, 0, 0, 0, 1, 1,
-1.850064, -0.1273846, -1.423194, 0, 0, 0, 1, 1,
-1.844478, 0.1195735, -2.399723, 1, 1, 1, 1, 1,
-1.844182, 0.8338659, 1.087152, 1, 1, 1, 1, 1,
-1.835407, -0.9287475, -3.291871, 1, 1, 1, 1, 1,
-1.835152, -0.4165211, -2.720255, 1, 1, 1, 1, 1,
-1.788146, -0.2466592, -2.397207, 1, 1, 1, 1, 1,
-1.785628, -0.7203031, -4.519815, 1, 1, 1, 1, 1,
-1.733036, -0.7059976, -2.025223, 1, 1, 1, 1, 1,
-1.732608, -0.2673985, -0.9485892, 1, 1, 1, 1, 1,
-1.705311, 0.4784065, -1.896582, 1, 1, 1, 1, 1,
-1.697517, -0.1650967, -1.735107, 1, 1, 1, 1, 1,
-1.694466, -0.01808612, -2.345247, 1, 1, 1, 1, 1,
-1.679285, 1.390025, -2.671415, 1, 1, 1, 1, 1,
-1.678435, 0.5244492, 0.4315345, 1, 1, 1, 1, 1,
-1.670749, -0.2605399, -2.786293, 1, 1, 1, 1, 1,
-1.66596, 1.73681, -0.5867037, 1, 1, 1, 1, 1,
-1.625995, 0.2514056, -0.2876994, 0, 0, 1, 1, 1,
-1.625629, 0.6363144, -1.000812, 1, 0, 0, 1, 1,
-1.618908, -0.1495155, -0.07018806, 1, 0, 0, 1, 1,
-1.608145, 0.1088324, -1.04203, 1, 0, 0, 1, 1,
-1.606243, -0.1307299, -1.305728, 1, 0, 0, 1, 1,
-1.593036, 0.3686768, -2.758485, 1, 0, 0, 1, 1,
-1.591288, 0.90171, -3.069292, 0, 0, 0, 1, 1,
-1.586414, 0.1466807, 0.1295002, 0, 0, 0, 1, 1,
-1.575101, 1.227977, -0.6507317, 0, 0, 0, 1, 1,
-1.570171, -0.2678974, -3.610002, 0, 0, 0, 1, 1,
-1.564205, -1.580353, -2.968553, 0, 0, 0, 1, 1,
-1.561691, 0.00238798, -0.782082, 0, 0, 0, 1, 1,
-1.561121, -1.490854, -1.571787, 0, 0, 0, 1, 1,
-1.555675, -0.5611634, -2.184635, 1, 1, 1, 1, 1,
-1.55152, -1.133531, -1.380914, 1, 1, 1, 1, 1,
-1.548843, -1.454014, -3.01953, 1, 1, 1, 1, 1,
-1.537462, -1.397434, -2.490613, 1, 1, 1, 1, 1,
-1.53371, -0.7660664, -2.62263, 1, 1, 1, 1, 1,
-1.531538, 1.432358, -1.169778, 1, 1, 1, 1, 1,
-1.530821, -1.237221, -1.827421, 1, 1, 1, 1, 1,
-1.523041, -0.8454837, -3.297142, 1, 1, 1, 1, 1,
-1.519895, 0.7409539, -1.350062, 1, 1, 1, 1, 1,
-1.511194, 0.1393279, -1.025664, 1, 1, 1, 1, 1,
-1.502214, 1.480136, -1.381086, 1, 1, 1, 1, 1,
-1.499419, 2.237437, 0.1428098, 1, 1, 1, 1, 1,
-1.482096, 0.002915437, -1.693621, 1, 1, 1, 1, 1,
-1.471887, 0.2244622, -1.808235, 1, 1, 1, 1, 1,
-1.462087, -0.943903, -2.867667, 1, 1, 1, 1, 1,
-1.458528, -0.05550333, -1.187914, 0, 0, 1, 1, 1,
-1.457666, 1.739085, -0.8614679, 1, 0, 0, 1, 1,
-1.442797, 1.30055, 0.08544812, 1, 0, 0, 1, 1,
-1.43683, 0.4144506, -2.686246, 1, 0, 0, 1, 1,
-1.434148, 1.510538, -1.148463, 1, 0, 0, 1, 1,
-1.43155, 1.168458, -0.3562994, 1, 0, 0, 1, 1,
-1.429728, -1.240708, -2.211331, 0, 0, 0, 1, 1,
-1.428411, 0.1701288, -0.2829196, 0, 0, 0, 1, 1,
-1.424099, -0.2368505, -1.982809, 0, 0, 0, 1, 1,
-1.416682, -1.800218, -2.450158, 0, 0, 0, 1, 1,
-1.414355, 0.5489478, -1.200822, 0, 0, 0, 1, 1,
-1.412752, 1.121862, -0.9502874, 0, 0, 0, 1, 1,
-1.40615, 1.177533, -1.160272, 0, 0, 0, 1, 1,
-1.405205, 0.227172, -2.785915, 1, 1, 1, 1, 1,
-1.393658, 0.6714782, -1.368796, 1, 1, 1, 1, 1,
-1.384204, 0.5159913, -0.9978628, 1, 1, 1, 1, 1,
-1.37213, -0.9966392, -4.202751, 1, 1, 1, 1, 1,
-1.359093, -0.7358357, -2.936558, 1, 1, 1, 1, 1,
-1.358598, 1.390783, -1.263574, 1, 1, 1, 1, 1,
-1.349665, -0.6045908, -3.837331, 1, 1, 1, 1, 1,
-1.343126, -0.1041818, -2.681871, 1, 1, 1, 1, 1,
-1.342808, -1.375481, -2.86514, 1, 1, 1, 1, 1,
-1.342171, -1.569566, -2.726687, 1, 1, 1, 1, 1,
-1.340861, -1.915229, -1.995942, 1, 1, 1, 1, 1,
-1.339873, 0.137989, 0.1254651, 1, 1, 1, 1, 1,
-1.339506, -0.7276543, -0.8738937, 1, 1, 1, 1, 1,
-1.338871, -0.254979, -2.470693, 1, 1, 1, 1, 1,
-1.329584, -1.961145, -5.931831, 1, 1, 1, 1, 1,
-1.327496, 0.959734, -1.167302, 0, 0, 1, 1, 1,
-1.325575, 1.575539, -0.7821045, 1, 0, 0, 1, 1,
-1.319065, -0.242985, -0.9887248, 1, 0, 0, 1, 1,
-1.315982, 0.7174875, -1.222537, 1, 0, 0, 1, 1,
-1.307837, -0.0841575, -2.0999, 1, 0, 0, 1, 1,
-1.30505, -0.1658431, -2.537506, 1, 0, 0, 1, 1,
-1.298709, 0.05631006, -1.570508, 0, 0, 0, 1, 1,
-1.296391, 0.8329017, -0.867299, 0, 0, 0, 1, 1,
-1.287559, -1.196466, -2.383859, 0, 0, 0, 1, 1,
-1.278353, -0.06706038, -2.087922, 0, 0, 0, 1, 1,
-1.273203, 2.129145, -0.2484279, 0, 0, 0, 1, 1,
-1.262677, -0.4463977, -0.9250778, 0, 0, 0, 1, 1,
-1.259643, -1.264987, -3.27484, 0, 0, 0, 1, 1,
-1.259604, -1.425976, -1.742211, 1, 1, 1, 1, 1,
-1.251308, -2.345675, -2.081296, 1, 1, 1, 1, 1,
-1.25056, -0.5169113, -1.624998, 1, 1, 1, 1, 1,
-1.250079, -0.4690598, -0.8471908, 1, 1, 1, 1, 1,
-1.246877, -0.267131, -4.05564, 1, 1, 1, 1, 1,
-1.245784, 1.056541, 0.259324, 1, 1, 1, 1, 1,
-1.236072, 0.6205583, -1.904631, 1, 1, 1, 1, 1,
-1.232615, -0.9208394, -1.167287, 1, 1, 1, 1, 1,
-1.231475, -0.2890367, -4.518415, 1, 1, 1, 1, 1,
-1.227226, -0.7990332, -2.707367, 1, 1, 1, 1, 1,
-1.225565, 1.44317, -1.504698, 1, 1, 1, 1, 1,
-1.223447, 0.1260575, -1.475805, 1, 1, 1, 1, 1,
-1.222415, -2.158351, -1.868832, 1, 1, 1, 1, 1,
-1.221808, -0.2708384, -1.27802, 1, 1, 1, 1, 1,
-1.218987, 0.2494394, -0.3096577, 1, 1, 1, 1, 1,
-1.217459, -0.4300767, -3.456341, 0, 0, 1, 1, 1,
-1.217199, -1.479072, -2.678678, 1, 0, 0, 1, 1,
-1.215788, -0.1799773, -1.173456, 1, 0, 0, 1, 1,
-1.212321, -0.2888025, -2.647409, 1, 0, 0, 1, 1,
-1.211691, 0.8328362, -0.08397431, 1, 0, 0, 1, 1,
-1.210421, 0.9050454, -1.838861, 1, 0, 0, 1, 1,
-1.194585, 0.1631868, -1.684707, 0, 0, 0, 1, 1,
-1.192925, 1.056603, 1.244204, 0, 0, 0, 1, 1,
-1.18989, 0.02281968, -0.6942979, 0, 0, 0, 1, 1,
-1.167549, -0.2478926, -2.369483, 0, 0, 0, 1, 1,
-1.164794, 0.7072858, 0.07292787, 0, 0, 0, 1, 1,
-1.15865, 0.4802738, 0.08130749, 0, 0, 0, 1, 1,
-1.153696, -0.2961138, -1.539242, 0, 0, 0, 1, 1,
-1.153529, -1.297277, -2.14144, 1, 1, 1, 1, 1,
-1.151202, 1.071978, -2.811311, 1, 1, 1, 1, 1,
-1.143829, 0.578123, -1.298844, 1, 1, 1, 1, 1,
-1.143173, -0.5000507, -1.664944, 1, 1, 1, 1, 1,
-1.13757, 0.2611465, -1.563367, 1, 1, 1, 1, 1,
-1.123653, 1.36703, -0.7293541, 1, 1, 1, 1, 1,
-1.117798, -0.4213007, -1.366393, 1, 1, 1, 1, 1,
-1.10247, -0.3440611, -0.4316532, 1, 1, 1, 1, 1,
-1.097697, 0.7248918, -0.5535188, 1, 1, 1, 1, 1,
-1.095562, -2.499578, -2.739406, 1, 1, 1, 1, 1,
-1.088298, -1.099985, -2.172301, 1, 1, 1, 1, 1,
-1.075926, -0.2774618, -1.646409, 1, 1, 1, 1, 1,
-1.067195, -1.306959, -2.418624, 1, 1, 1, 1, 1,
-1.059799, -2.134088, -2.176592, 1, 1, 1, 1, 1,
-1.056463, 1.82168, 1.159876, 1, 1, 1, 1, 1,
-1.020667, -1.157467, -1.354818, 0, 0, 1, 1, 1,
-1.01869, 0.202043, -2.752584, 1, 0, 0, 1, 1,
-1.014835, 0.6305985, -1.382868, 1, 0, 0, 1, 1,
-1.014059, 1.888049, -1.792957, 1, 0, 0, 1, 1,
-1.00682, 0.08592084, -1.973794, 1, 0, 0, 1, 1,
-0.9917406, 0.2052246, -1.335043, 1, 0, 0, 1, 1,
-0.9840383, -0.2716656, -0.6277154, 0, 0, 0, 1, 1,
-0.9813122, 0.1657871, -1.492746, 0, 0, 0, 1, 1,
-0.9785233, -0.1946466, -2.530924, 0, 0, 0, 1, 1,
-0.975362, 1.865806, 0.4388866, 0, 0, 0, 1, 1,
-0.965789, -0.4974466, -2.717432, 0, 0, 0, 1, 1,
-0.9633963, -0.007349793, -1.671192, 0, 0, 0, 1, 1,
-0.9630935, 2.744581, 0.8626888, 0, 0, 0, 1, 1,
-0.9620615, -0.4930697, -1.551242, 1, 1, 1, 1, 1,
-0.9481986, 1.861883, 0.3494757, 1, 1, 1, 1, 1,
-0.939514, 0.3152534, -2.033202, 1, 1, 1, 1, 1,
-0.9291031, 0.4604103, -0.4691185, 1, 1, 1, 1, 1,
-0.9275986, 0.5915519, -0.5699114, 1, 1, 1, 1, 1,
-0.9273282, 0.867517, 0.6453965, 1, 1, 1, 1, 1,
-0.9241676, -0.8516221, -1.083917, 1, 1, 1, 1, 1,
-0.9216108, 0.4455122, -1.249146, 1, 1, 1, 1, 1,
-0.9121957, -1.024772, -3.786465, 1, 1, 1, 1, 1,
-0.9040637, 0.5830395, -2.804395, 1, 1, 1, 1, 1,
-0.8972651, 0.9384444, -0.7568649, 1, 1, 1, 1, 1,
-0.896644, 0.6036388, -1.742061, 1, 1, 1, 1, 1,
-0.8908644, 0.5798628, -1.175196, 1, 1, 1, 1, 1,
-0.8906943, -0.9555593, -0.3998684, 1, 1, 1, 1, 1,
-0.8863772, -1.542928, -2.747661, 1, 1, 1, 1, 1,
-0.8856769, 0.6619882, 1.553339, 0, 0, 1, 1, 1,
-0.8846689, 0.543496, -1.358177, 1, 0, 0, 1, 1,
-0.8841255, -0.6175913, -3.958085, 1, 0, 0, 1, 1,
-0.8785323, -0.8387972, -0.8228108, 1, 0, 0, 1, 1,
-0.8726999, -0.5684555, -1.931001, 1, 0, 0, 1, 1,
-0.8712931, 1.434668, -1.33679, 1, 0, 0, 1, 1,
-0.8666784, 0.8007513, -0.3821175, 0, 0, 0, 1, 1,
-0.8643939, -0.9137336, -2.290532, 0, 0, 0, 1, 1,
-0.8626788, 0.05831729, -1.309859, 0, 0, 0, 1, 1,
-0.8619234, 0.6870189, -1.552008, 0, 0, 0, 1, 1,
-0.860223, -0.8013686, -3.285256, 0, 0, 0, 1, 1,
-0.8597949, 0.3432825, -0.5180147, 0, 0, 0, 1, 1,
-0.8583628, 0.6392239, -1.734053, 0, 0, 0, 1, 1,
-0.8578092, 1.810311, 0.7837681, 1, 1, 1, 1, 1,
-0.8558401, 0.443607, -2.81287, 1, 1, 1, 1, 1,
-0.8555905, 0.7804935, -1.379818, 1, 1, 1, 1, 1,
-0.8514947, 0.1909647, -2.6652, 1, 1, 1, 1, 1,
-0.8480118, 1.077158, 1.67352, 1, 1, 1, 1, 1,
-0.8439713, 1.452122, -0.1124389, 1, 1, 1, 1, 1,
-0.8394998, 0.4420138, -2.577739, 1, 1, 1, 1, 1,
-0.8349813, 1.014189, -0.1969301, 1, 1, 1, 1, 1,
-0.8341488, -0.562888, -2.738559, 1, 1, 1, 1, 1,
-0.8339245, -0.7981033, -0.7644199, 1, 1, 1, 1, 1,
-0.8317, 0.4315965, 1.429663, 1, 1, 1, 1, 1,
-0.8311185, -0.3845776, -2.078985, 1, 1, 1, 1, 1,
-0.8309023, -0.6101613, -2.027511, 1, 1, 1, 1, 1,
-0.8302127, -1.658155, -3.556863, 1, 1, 1, 1, 1,
-0.8290623, -0.5284773, -3.244578, 1, 1, 1, 1, 1,
-0.8265069, 0.2646875, 0.2065166, 0, 0, 1, 1, 1,
-0.82418, -0.5076354, -5.166903, 1, 0, 0, 1, 1,
-0.8216734, 2.205377, -0.1928796, 1, 0, 0, 1, 1,
-0.8215876, -1.889526, -0.3881552, 1, 0, 0, 1, 1,
-0.8203734, 1.032754, -1.830565, 1, 0, 0, 1, 1,
-0.8127704, -0.7375471, -2.752848, 1, 0, 0, 1, 1,
-0.8127045, -1.099242, -2.880126, 0, 0, 0, 1, 1,
-0.8121095, 1.247637, 0.7840386, 0, 0, 0, 1, 1,
-0.8097549, -1.914271, -2.20678, 0, 0, 0, 1, 1,
-0.8076102, 0.9785946, -0.1117074, 0, 0, 0, 1, 1,
-0.8043685, 0.009731081, -1.336729, 0, 0, 0, 1, 1,
-0.8036665, -0.09306569, -0.7969705, 0, 0, 0, 1, 1,
-0.8035743, 0.8160879, -0.02503368, 0, 0, 0, 1, 1,
-0.7988278, 1.112796, 0.6458028, 1, 1, 1, 1, 1,
-0.7896921, 1.954964, 0.1896431, 1, 1, 1, 1, 1,
-0.788619, -0.8217717, -1.872989, 1, 1, 1, 1, 1,
-0.7862571, 0.5586604, -0.3795253, 1, 1, 1, 1, 1,
-0.7853811, -0.6264885, -2.058703, 1, 1, 1, 1, 1,
-0.7850694, -0.2957253, -0.4635614, 1, 1, 1, 1, 1,
-0.7824101, 1.14233, -0.2930798, 1, 1, 1, 1, 1,
-0.7816009, -0.3123839, -1.15223, 1, 1, 1, 1, 1,
-0.7800797, 0.9552154, 0.9603314, 1, 1, 1, 1, 1,
-0.770909, 0.4888362, -2.173563, 1, 1, 1, 1, 1,
-0.7699573, -0.2274134, 1.109944, 1, 1, 1, 1, 1,
-0.7636154, 0.1740356, -3.459806, 1, 1, 1, 1, 1,
-0.76192, 0.1050485, -2.635569, 1, 1, 1, 1, 1,
-0.760299, -0.4263862, -1.275217, 1, 1, 1, 1, 1,
-0.7562984, 1.540035, -2.281806, 1, 1, 1, 1, 1,
-0.7544898, -1.221132, -2.663772, 0, 0, 1, 1, 1,
-0.751593, -0.2325405, -2.027694, 1, 0, 0, 1, 1,
-0.745516, 0.7770703, -1.347023, 1, 0, 0, 1, 1,
-0.7434431, 1.850378, -0.2530701, 1, 0, 0, 1, 1,
-0.742185, 1.395452, -0.386617, 1, 0, 0, 1, 1,
-0.738916, 0.4924826, 0.08604714, 1, 0, 0, 1, 1,
-0.7327725, 0.3736521, 0.5394325, 0, 0, 0, 1, 1,
-0.7314849, -1.54109, -2.948483, 0, 0, 0, 1, 1,
-0.7311378, 0.008888628, -1.71996, 0, 0, 0, 1, 1,
-0.7229168, 0.9297218, 0.7462895, 0, 0, 0, 1, 1,
-0.7188544, -1.659498, -3.557548, 0, 0, 0, 1, 1,
-0.7165236, 1.286318, 1.232331, 0, 0, 0, 1, 1,
-0.7149819, -0.9321832, -1.735989, 0, 0, 0, 1, 1,
-0.7148104, 0.8609505, -0.3990675, 1, 1, 1, 1, 1,
-0.7088997, -0.6701888, -0.3306192, 1, 1, 1, 1, 1,
-0.7014019, -0.2930594, -0.8157982, 1, 1, 1, 1, 1,
-0.7007354, 1.356045, 1.089543, 1, 1, 1, 1, 1,
-0.6931401, -2.00493, -1.448137, 1, 1, 1, 1, 1,
-0.6877615, -1.657782, -3.286473, 1, 1, 1, 1, 1,
-0.6872175, 0.04855556, -0.9147202, 1, 1, 1, 1, 1,
-0.6863328, 0.6648771, -0.254093, 1, 1, 1, 1, 1,
-0.6854916, -0.1262864, -0.1091582, 1, 1, 1, 1, 1,
-0.6842514, -1.272974, -0.7945279, 1, 1, 1, 1, 1,
-0.6829848, 1.421743, -0.07114844, 1, 1, 1, 1, 1,
-0.682214, -0.654052, -2.937537, 1, 1, 1, 1, 1,
-0.6819862, -0.5211197, -1.34641, 1, 1, 1, 1, 1,
-0.6762381, -1.157781, -3.189069, 1, 1, 1, 1, 1,
-0.6759099, -1.198042, -1.818846, 1, 1, 1, 1, 1,
-0.6725479, 0.08158683, 0.6928983, 0, 0, 1, 1, 1,
-0.6693593, 0.3343558, -1.971016, 1, 0, 0, 1, 1,
-0.6684064, 0.09214603, 0.3752976, 1, 0, 0, 1, 1,
-0.6682736, 1.30484, -1.394302, 1, 0, 0, 1, 1,
-0.6643057, -0.3078455, -2.172143, 1, 0, 0, 1, 1,
-0.6642946, -0.6631156, -1.617153, 1, 0, 0, 1, 1,
-0.6410317, -0.6889201, -1.040637, 0, 0, 0, 1, 1,
-0.6391354, 0.182765, -1.401243, 0, 0, 0, 1, 1,
-0.6336136, 1.682043, 0.4470148, 0, 0, 0, 1, 1,
-0.6313036, 0.3838561, -0.3054294, 0, 0, 0, 1, 1,
-0.6266643, -0.163614, -1.070625, 0, 0, 0, 1, 1,
-0.6195356, 0.1484049, -1.868577, 0, 0, 0, 1, 1,
-0.6130878, -0.1706467, -1.881394, 0, 0, 0, 1, 1,
-0.6090044, -0.4369981, -0.6345929, 1, 1, 1, 1, 1,
-0.5907141, -1.63244, -1.440084, 1, 1, 1, 1, 1,
-0.587688, -1.284205, -1.835289, 1, 1, 1, 1, 1,
-0.5837981, -0.2878622, -3.239897, 1, 1, 1, 1, 1,
-0.5830098, -1.147626, -2.347133, 1, 1, 1, 1, 1,
-0.5813158, -0.5709484, -0.9846576, 1, 1, 1, 1, 1,
-0.5813105, -0.05505069, -0.4334246, 1, 1, 1, 1, 1,
-0.5750119, -0.6095569, -1.72764, 1, 1, 1, 1, 1,
-0.5728953, -0.876615, -3.596523, 1, 1, 1, 1, 1,
-0.5700212, 1.087774, -0.8189139, 1, 1, 1, 1, 1,
-0.568373, 1.106937, 0.2758932, 1, 1, 1, 1, 1,
-0.5670915, -0.7145603, -2.632041, 1, 1, 1, 1, 1,
-0.5666209, 0.5394034, -0.2941047, 1, 1, 1, 1, 1,
-0.5596833, -0.8872859, -3.774956, 1, 1, 1, 1, 1,
-0.5596696, 1.143633, 1.246117, 1, 1, 1, 1, 1,
-0.5498384, 2.757715, -0.1089814, 0, 0, 1, 1, 1,
-0.5489984, 1.326603, -0.9389072, 1, 0, 0, 1, 1,
-0.5487015, -1.758187, -1.081258, 1, 0, 0, 1, 1,
-0.546333, 0.4294313, -1.101465, 1, 0, 0, 1, 1,
-0.5449253, -1.343965, -2.063341, 1, 0, 0, 1, 1,
-0.5446917, -1.500503, -2.546408, 1, 0, 0, 1, 1,
-0.5436175, -0.01486357, -1.585663, 0, 0, 0, 1, 1,
-0.5411597, 0.5135657, -0.9726303, 0, 0, 0, 1, 1,
-0.5386217, -1.318957, -1.897119, 0, 0, 0, 1, 1,
-0.5344288, -0.385247, -4.533926, 0, 0, 0, 1, 1,
-0.5342741, 0.603238, -0.5523044, 0, 0, 0, 1, 1,
-0.5335699, 0.6865741, -0.3702042, 0, 0, 0, 1, 1,
-0.5322933, -0.2005597, -2.102782, 0, 0, 0, 1, 1,
-0.5262929, 0.09275007, 0.1652243, 1, 1, 1, 1, 1,
-0.5256065, 1.415725, -1.101272, 1, 1, 1, 1, 1,
-0.52556, -0.01644287, -0.09313296, 1, 1, 1, 1, 1,
-0.522774, 1.253402, 1.065423, 1, 1, 1, 1, 1,
-0.5188348, -0.14463, -3.310065, 1, 1, 1, 1, 1,
-0.5149, 1.244274, -2.199584, 1, 1, 1, 1, 1,
-0.5113114, -0.1219968, -2.976746, 1, 1, 1, 1, 1,
-0.5095386, 0.4542806, 0.3744895, 1, 1, 1, 1, 1,
-0.5081902, -0.4706028, -2.222613, 1, 1, 1, 1, 1,
-0.5045912, 0.3641408, -0.9655931, 1, 1, 1, 1, 1,
-0.5004649, -0.6428898, -3.344042, 1, 1, 1, 1, 1,
-0.5002128, -0.4447151, -2.322336, 1, 1, 1, 1, 1,
-0.4962543, -1.998265, -2.889059, 1, 1, 1, 1, 1,
-0.4922738, 0.1654737, -2.677702, 1, 1, 1, 1, 1,
-0.4913048, -0.5977402, -2.993245, 1, 1, 1, 1, 1,
-0.4850726, 1.228328, -0.486095, 0, 0, 1, 1, 1,
-0.4844866, -0.8639402, -3.301057, 1, 0, 0, 1, 1,
-0.482389, 0.5934401, -2.472139, 1, 0, 0, 1, 1,
-0.4816456, 0.7322416, 1.343712, 1, 0, 0, 1, 1,
-0.4814676, -0.5863689, -2.267322, 1, 0, 0, 1, 1,
-0.4786965, 0.4032569, -0.6671605, 1, 0, 0, 1, 1,
-0.4743322, 0.1139796, -1.439204, 0, 0, 0, 1, 1,
-0.471625, -0.2849567, -2.909092, 0, 0, 0, 1, 1,
-0.462255, 1.817357, 0.4984295, 0, 0, 0, 1, 1,
-0.4619684, 0.08407775, -2.946708, 0, 0, 0, 1, 1,
-0.4570491, -1.801759, -2.038019, 0, 0, 0, 1, 1,
-0.4402598, 0.8156797, -0.1593563, 0, 0, 0, 1, 1,
-0.4377059, 1.002652, 1.112562, 0, 0, 0, 1, 1,
-0.4353282, 1.058858, -1.574987, 1, 1, 1, 1, 1,
-0.4297671, -2.118771, -3.098076, 1, 1, 1, 1, 1,
-0.4292649, -0.5145192, -1.917898, 1, 1, 1, 1, 1,
-0.421039, -1.505875, -3.447537, 1, 1, 1, 1, 1,
-0.4200736, -0.6513225, -3.360803, 1, 1, 1, 1, 1,
-0.4180781, -0.7154893, -0.6750792, 1, 1, 1, 1, 1,
-0.4159963, -0.09191208, 0.2547649, 1, 1, 1, 1, 1,
-0.4151926, 0.5230091, -0.5467007, 1, 1, 1, 1, 1,
-0.4114159, -0.3768023, -2.421047, 1, 1, 1, 1, 1,
-0.4100355, -0.05009161, -0.229095, 1, 1, 1, 1, 1,
-0.407549, 0.7828636, 1.044159, 1, 1, 1, 1, 1,
-0.4073429, 0.4886602, -2.561484, 1, 1, 1, 1, 1,
-0.4069715, 0.4259805, -0.1288324, 1, 1, 1, 1, 1,
-0.404477, -0.8412986, -2.631743, 1, 1, 1, 1, 1,
-0.4033396, 0.05767694, -0.3461625, 1, 1, 1, 1, 1,
-0.4023163, -0.696166, -2.054144, 0, 0, 1, 1, 1,
-0.3949853, 0.1494584, -1.421767, 1, 0, 0, 1, 1,
-0.393196, -1.805374, -3.369893, 1, 0, 0, 1, 1,
-0.3900389, 0.6039239, -0.2067637, 1, 0, 0, 1, 1,
-0.3880583, 0.6252869, -1.199809, 1, 0, 0, 1, 1,
-0.3872071, -1.057573, -3.180031, 1, 0, 0, 1, 1,
-0.3867827, 0.3938248, -1.244277, 0, 0, 0, 1, 1,
-0.3856639, -0.5003397, -5.046485, 0, 0, 0, 1, 1,
-0.3849196, 1.054536, 1.036705, 0, 0, 0, 1, 1,
-0.3845631, -2.139196, -3.421574, 0, 0, 0, 1, 1,
-0.3823617, 0.1323046, -1.087577, 0, 0, 0, 1, 1,
-0.3819338, 1.36204, 0.3620328, 0, 0, 0, 1, 1,
-0.3808787, 1.790774, -1.062889, 0, 0, 0, 1, 1,
-0.3805365, -1.935654, -2.686838, 1, 1, 1, 1, 1,
-0.3785827, 0.9598281, -1.386871, 1, 1, 1, 1, 1,
-0.3772239, -1.317642, -1.564581, 1, 1, 1, 1, 1,
-0.3768209, 0.1645227, -1.573628, 1, 1, 1, 1, 1,
-0.3732974, -0.02316637, -2.272076, 1, 1, 1, 1, 1,
-0.3725341, -0.8110921, -2.334326, 1, 1, 1, 1, 1,
-0.3710265, 0.2811295, -1.431371, 1, 1, 1, 1, 1,
-0.3710256, -2.056256, -3.156825, 1, 1, 1, 1, 1,
-0.3640056, -0.2266601, -0.4934896, 1, 1, 1, 1, 1,
-0.3638875, -0.1208638, -4.470555, 1, 1, 1, 1, 1,
-0.3634625, 0.871944, -0.1899654, 1, 1, 1, 1, 1,
-0.360276, 1.34508, -0.2006904, 1, 1, 1, 1, 1,
-0.3533397, 0.4897083, -0.1391573, 1, 1, 1, 1, 1,
-0.3515842, -0.5784256, -1.701055, 1, 1, 1, 1, 1,
-0.3515733, -0.1140234, -2.421154, 1, 1, 1, 1, 1,
-0.3480892, 1.080189, -1.954053, 0, 0, 1, 1, 1,
-0.344208, -0.0003571428, -0.1183413, 1, 0, 0, 1, 1,
-0.3423488, 1.156615, -1.500595, 1, 0, 0, 1, 1,
-0.3404365, -0.8712744, -2.269937, 1, 0, 0, 1, 1,
-0.3381014, -1.801793, -3.046751, 1, 0, 0, 1, 1,
-0.3361375, 0.5249652, -2.218491, 1, 0, 0, 1, 1,
-0.3357997, -0.08361395, -3.701044, 0, 0, 0, 1, 1,
-0.3353405, -0.2753595, -2.829808, 0, 0, 0, 1, 1,
-0.3339143, -0.5695033, -1.174796, 0, 0, 0, 1, 1,
-0.3335256, 0.743866, -0.6975588, 0, 0, 0, 1, 1,
-0.3334565, 1.077279, -1.577371, 0, 0, 0, 1, 1,
-0.3315085, -0.4701868, -3.311669, 0, 0, 0, 1, 1,
-0.3296272, -0.495389, -2.377752, 0, 0, 0, 1, 1,
-0.3277025, 1.067295, -0.6066295, 1, 1, 1, 1, 1,
-0.3255542, 1.192749, -1.991069, 1, 1, 1, 1, 1,
-0.3147064, -1.951564, -4.090608, 1, 1, 1, 1, 1,
-0.3115141, 0.1156703, -2.317078, 1, 1, 1, 1, 1,
-0.3109469, 0.2333961, -1.621044, 1, 1, 1, 1, 1,
-0.3071461, 0.6956148, 0.6126448, 1, 1, 1, 1, 1,
-0.3054256, 0.2071774, 0.5353637, 1, 1, 1, 1, 1,
-0.3030019, 0.5352693, -2.833302, 1, 1, 1, 1, 1,
-0.3027755, -0.1351869, -3.892016, 1, 1, 1, 1, 1,
-0.3019697, -0.4503812, -1.347296, 1, 1, 1, 1, 1,
-0.2996375, 1.75443, -1.615073, 1, 1, 1, 1, 1,
-0.2990842, -0.002328389, -2.926766, 1, 1, 1, 1, 1,
-0.2978955, 0.3663187, 0.4781626, 1, 1, 1, 1, 1,
-0.2978661, 1.153615, -2.286345, 1, 1, 1, 1, 1,
-0.2932709, -0.5595119, -2.14804, 1, 1, 1, 1, 1,
-0.2895621, 1.482393, 0.4717915, 0, 0, 1, 1, 1,
-0.2856765, -1.060085, -2.87086, 1, 0, 0, 1, 1,
-0.2843706, -1.15555, -3.734634, 1, 0, 0, 1, 1,
-0.2833391, -0.1496346, -2.964974, 1, 0, 0, 1, 1,
-0.2754096, -0.7454964, -5.456976, 1, 0, 0, 1, 1,
-0.2738716, -0.9334273, -3.439506, 1, 0, 0, 1, 1,
-0.272636, -0.4415109, -3.328462, 0, 0, 0, 1, 1,
-0.2709346, 1.764648, -0.578571, 0, 0, 0, 1, 1,
-0.2683631, -0.3788894, -3.226165, 0, 0, 0, 1, 1,
-0.2674775, -2.283858, -3.066923, 0, 0, 0, 1, 1,
-0.2674148, 0.5209498, -0.5003244, 0, 0, 0, 1, 1,
-0.2643866, 1.255675, -0.5708109, 0, 0, 0, 1, 1,
-0.2628859, -0.1058832, -0.8870189, 0, 0, 0, 1, 1,
-0.2622576, -1.078019, -2.106894, 1, 1, 1, 1, 1,
-0.260497, 0.1508696, -1.386646, 1, 1, 1, 1, 1,
-0.2585192, -0.9517349, -2.645633, 1, 1, 1, 1, 1,
-0.2547317, 0.01233912, -0.3267568, 1, 1, 1, 1, 1,
-0.2496185, 0.2444526, -1.096684, 1, 1, 1, 1, 1,
-0.2490417, -0.4198345, -4.114621, 1, 1, 1, 1, 1,
-0.2419313, -1.979858, -2.900505, 1, 1, 1, 1, 1,
-0.240322, 1.257174, 1.863617, 1, 1, 1, 1, 1,
-0.2380789, 0.3146636, -0.1197532, 1, 1, 1, 1, 1,
-0.2361478, -0.1514341, -3.659111, 1, 1, 1, 1, 1,
-0.2345837, -0.05789433, -3.066391, 1, 1, 1, 1, 1,
-0.2318378, 0.3965159, -0.3176927, 1, 1, 1, 1, 1,
-0.2309307, 0.3337499, -2.058199, 1, 1, 1, 1, 1,
-0.2293013, 1.129022, 0.834278, 1, 1, 1, 1, 1,
-0.2220815, 0.7059991, -0.08390761, 1, 1, 1, 1, 1,
-0.2215929, -0.09229786, -2.003079, 0, 0, 1, 1, 1,
-0.2209225, 0.1069774, 0.04791661, 1, 0, 0, 1, 1,
-0.216601, -0.6825227, -3.818048, 1, 0, 0, 1, 1,
-0.2146451, -0.222276, -3.711442, 1, 0, 0, 1, 1,
-0.2104297, 0.3266849, 0.8740708, 1, 0, 0, 1, 1,
-0.2087721, -0.8864214, -3.070408, 1, 0, 0, 1, 1,
-0.2086, -0.8323833, -4.725437, 0, 0, 0, 1, 1,
-0.2074767, -0.2760851, -1.760989, 0, 0, 0, 1, 1,
-0.2003761, -0.9613709, -3.268524, 0, 0, 0, 1, 1,
-0.1947788, -0.3093227, -3.190877, 0, 0, 0, 1, 1,
-0.1862091, 0.05717945, -1.254452, 0, 0, 0, 1, 1,
-0.1851726, -0.5855719, -2.906055, 0, 0, 0, 1, 1,
-0.183823, 1.533403, 0.09412169, 0, 0, 0, 1, 1,
-0.1837663, -0.5706947, -2.925488, 1, 1, 1, 1, 1,
-0.1826877, -1.810631, -2.442863, 1, 1, 1, 1, 1,
-0.1719913, 0.1333077, -1.166719, 1, 1, 1, 1, 1,
-0.1681335, 1.095182, 0.1599399, 1, 1, 1, 1, 1,
-0.1671349, 0.3555221, -0.7344661, 1, 1, 1, 1, 1,
-0.1669741, -0.946237, -2.914705, 1, 1, 1, 1, 1,
-0.164308, -0.2545359, -1.806866, 1, 1, 1, 1, 1,
-0.1642566, -1.242445, -3.191955, 1, 1, 1, 1, 1,
-0.1604235, 2.430674, -1.028423, 1, 1, 1, 1, 1,
-0.1584258, -0.1578705, -0.8048593, 1, 1, 1, 1, 1,
-0.1552648, 0.8719933, 1.301601, 1, 1, 1, 1, 1,
-0.1540557, 0.3444731, -0.482318, 1, 1, 1, 1, 1,
-0.1497825, 0.1984681, -0.7241572, 1, 1, 1, 1, 1,
-0.1471995, -0.6731973, -1.561249, 1, 1, 1, 1, 1,
-0.1413003, -0.4926952, -3.152163, 1, 1, 1, 1, 1,
-0.1404317, 1.145474, -0.2174286, 0, 0, 1, 1, 1,
-0.1398609, 2.271178, 0.1343205, 1, 0, 0, 1, 1,
-0.1358398, 0.5284805, -0.6733242, 1, 0, 0, 1, 1,
-0.1305933, 1.3161, -0.7296609, 1, 0, 0, 1, 1,
-0.1261368, 1.721763, -1.298886, 1, 0, 0, 1, 1,
-0.1259278, 0.966934, 3.144312, 1, 0, 0, 1, 1,
-0.1254009, -0.5902263, -1.688989, 0, 0, 0, 1, 1,
-0.1217408, -0.5449443, -2.616834, 0, 0, 0, 1, 1,
-0.1187537, 0.5660388, -0.3193374, 0, 0, 0, 1, 1,
-0.1171426, 2.043793, -1.66274, 0, 0, 0, 1, 1,
-0.115254, 1.353292, 0.8967695, 0, 0, 0, 1, 1,
-0.1125031, -0.3385175, -3.957855, 0, 0, 0, 1, 1,
-0.1108182, -0.1932515, -2.431794, 0, 0, 0, 1, 1,
-0.102851, -0.7962824, -2.626804, 1, 1, 1, 1, 1,
-0.1014091, -0.2409745, -1.892911, 1, 1, 1, 1, 1,
-0.1004833, -0.2745206, -6.261063, 1, 1, 1, 1, 1,
-0.09953756, 0.4812139, -0.880232, 1, 1, 1, 1, 1,
-0.09929997, 0.09171262, 0.2258292, 1, 1, 1, 1, 1,
-0.09690352, 0.7792203, 0.01975173, 1, 1, 1, 1, 1,
-0.09481461, 1.271541, 0.7245426, 1, 1, 1, 1, 1,
-0.09432693, 1.168651, 0.976361, 1, 1, 1, 1, 1,
-0.08649981, -0.1702048, -2.980123, 1, 1, 1, 1, 1,
-0.08433823, 0.6684988, -1.195414, 1, 1, 1, 1, 1,
-0.08243346, 1.597821, -0.02800449, 1, 1, 1, 1, 1,
-0.07969614, -0.3196924, -2.690504, 1, 1, 1, 1, 1,
-0.07751458, 1.033223, -1.470332, 1, 1, 1, 1, 1,
-0.07548541, -0.6108456, -3.322578, 1, 1, 1, 1, 1,
-0.07160585, -1.138117, -3.702272, 1, 1, 1, 1, 1,
-0.07034253, 0.9316302, -0.8494888, 0, 0, 1, 1, 1,
-0.06924246, -0.5155237, -3.479502, 1, 0, 0, 1, 1,
-0.06705337, -0.116531, -1.800002, 1, 0, 0, 1, 1,
-0.06383511, 0.05260633, -0.1974397, 1, 0, 0, 1, 1,
-0.06180863, 0.3086209, 0.2666674, 1, 0, 0, 1, 1,
-0.05918469, 1.410124, -1.011516, 1, 0, 0, 1, 1,
-0.05369347, 0.675459, -0.9930661, 0, 0, 0, 1, 1,
-0.05092639, -1.201163, -2.937316, 0, 0, 0, 1, 1,
-0.05074006, 0.8318831, 1.305519, 0, 0, 0, 1, 1,
-0.04900384, 1.523183, 1.400247, 0, 0, 0, 1, 1,
-0.0458434, 0.09320384, -0.9674487, 0, 0, 0, 1, 1,
-0.04310994, -1.124505, -1.902279, 0, 0, 0, 1, 1,
-0.04177135, 0.7752994, -0.1638663, 0, 0, 0, 1, 1,
-0.04086002, -0.2203595, -4.014507, 1, 1, 1, 1, 1,
-0.03678877, 1.034353, 0.3422124, 1, 1, 1, 1, 1,
-0.03506346, -0.9181525, -0.8684452, 1, 1, 1, 1, 1,
-0.03202606, 1.785052, -0.7578757, 1, 1, 1, 1, 1,
-0.03034958, 0.9674376, 0.08901381, 1, 1, 1, 1, 1,
-0.03029383, -0.4467725, -2.084226, 1, 1, 1, 1, 1,
-0.02976496, 0.6170045, 0.714926, 1, 1, 1, 1, 1,
-0.02922763, 0.6145005, 2.516029, 1, 1, 1, 1, 1,
-0.0289707, 1.377716, 0.4230081, 1, 1, 1, 1, 1,
-0.02816783, 2.474007, -1.734721, 1, 1, 1, 1, 1,
-0.02781258, -1.944757, -1.492705, 1, 1, 1, 1, 1,
-0.02702462, 0.3115147, -2.357368, 1, 1, 1, 1, 1,
-0.02506869, 0.375017, 0.06744893, 1, 1, 1, 1, 1,
-0.02477731, -1.457486, -2.464831, 1, 1, 1, 1, 1,
-0.02474094, 0.1514077, 0.2521207, 1, 1, 1, 1, 1,
-0.01937344, 0.2331614, -0.135977, 0, 0, 1, 1, 1,
-0.01389649, 0.387867, 0.1240785, 1, 0, 0, 1, 1,
-0.006637429, 1.074242, -0.9199185, 1, 0, 0, 1, 1,
-0.005304291, 2.288236, 0.5584255, 1, 0, 0, 1, 1,
-0.002718013, -0.6486073, -3.401714, 1, 0, 0, 1, 1,
-0.001974707, 1.122391, 1.039638, 1, 0, 0, 1, 1,
0.0005536278, -0.1470023, 2.386174, 0, 0, 0, 1, 1,
0.006533127, 0.3087615, -0.5679696, 0, 0, 0, 1, 1,
0.008649291, 0.04278991, 2.016775, 0, 0, 0, 1, 1,
0.01046348, 0.3458295, -0.7033117, 0, 0, 0, 1, 1,
0.01233531, -0.739921, 3.263909, 0, 0, 0, 1, 1,
0.01298781, -1.163462, 4.769456, 0, 0, 0, 1, 1,
0.01419006, 0.3592939, -0.9675281, 0, 0, 0, 1, 1,
0.01708238, 0.5862976, 2.593413, 1, 1, 1, 1, 1,
0.01725114, -2.770848, 2.854048, 1, 1, 1, 1, 1,
0.02683902, -0.08767083, 0.6013819, 1, 1, 1, 1, 1,
0.03514164, -0.4902317, 1.687897, 1, 1, 1, 1, 1,
0.03668576, -0.932485, 1.130005, 1, 1, 1, 1, 1,
0.03907158, -0.07710438, 2.560794, 1, 1, 1, 1, 1,
0.03987498, -0.7608317, 4.267861, 1, 1, 1, 1, 1,
0.04137138, 0.2145132, -0.09051922, 1, 1, 1, 1, 1,
0.04553692, -0.1041625, 1.387365, 1, 1, 1, 1, 1,
0.05058841, 1.932401, 1.609349, 1, 1, 1, 1, 1,
0.05074293, 0.2080314, 1.09084, 1, 1, 1, 1, 1,
0.05105967, 0.2491046, 1.095087, 1, 1, 1, 1, 1,
0.053355, -0.1138452, 2.309408, 1, 1, 1, 1, 1,
0.05818842, -0.4312412, 2.759132, 1, 1, 1, 1, 1,
0.06001138, -0.4584002, 2.777557, 1, 1, 1, 1, 1,
0.06890323, 0.9523898, 0.7835165, 0, 0, 1, 1, 1,
0.07069376, -0.05097666, 1.328131, 1, 0, 0, 1, 1,
0.07230723, -0.1820933, 2.101587, 1, 0, 0, 1, 1,
0.07569066, 0.3636928, -0.1610968, 1, 0, 0, 1, 1,
0.07623784, -0.1130936, 3.701741, 1, 0, 0, 1, 1,
0.08006363, -2.248919, 1.845399, 1, 0, 0, 1, 1,
0.08590151, -0.7706577, 4.406908, 0, 0, 0, 1, 1,
0.09024654, 0.4226641, 0.6563101, 0, 0, 0, 1, 1,
0.09159679, -1.635318, 5.249986, 0, 0, 0, 1, 1,
0.09280716, -0.02735356, 2.183716, 0, 0, 0, 1, 1,
0.09465069, -0.3191008, 4.410834, 0, 0, 0, 1, 1,
0.0947146, -2.153865, 3.507246, 0, 0, 0, 1, 1,
0.0957959, 1.584846, -1.324147, 0, 0, 0, 1, 1,
0.0961342, 0.2805044, 2.169376, 1, 1, 1, 1, 1,
0.09741528, -0.5674406, 1.214901, 1, 1, 1, 1, 1,
0.1052214, 1.96471, -1.504647, 1, 1, 1, 1, 1,
0.1073238, 0.4064817, -0.1880026, 1, 1, 1, 1, 1,
0.1127601, 1.219351, -1.755289, 1, 1, 1, 1, 1,
0.1163023, -0.1945153, 2.083304, 1, 1, 1, 1, 1,
0.1292571, -1.323165, 3.585873, 1, 1, 1, 1, 1,
0.1296013, 0.03473991, 1.325814, 1, 1, 1, 1, 1,
0.1302134, 2.219306, -0.4255527, 1, 1, 1, 1, 1,
0.1344758, -1.383783, 2.404591, 1, 1, 1, 1, 1,
0.1367641, -1.218832, 1.951601, 1, 1, 1, 1, 1,
0.1383809, 0.4515452, -0.1665825, 1, 1, 1, 1, 1,
0.1400135, 1.311648, 0.2818365, 1, 1, 1, 1, 1,
0.1400399, 0.3947758, 0.08419581, 1, 1, 1, 1, 1,
0.1451944, -0.2492595, 1.405121, 1, 1, 1, 1, 1,
0.1454812, -0.7227426, 3.118783, 0, 0, 1, 1, 1,
0.1456538, -0.5432037, 2.625978, 1, 0, 0, 1, 1,
0.1459688, -0.6541931, 4.300258, 1, 0, 0, 1, 1,
0.152239, -0.2043802, 3.338724, 1, 0, 0, 1, 1,
0.1529352, -0.1430503, 1.19401, 1, 0, 0, 1, 1,
0.158262, 1.365926, -0.9539176, 1, 0, 0, 1, 1,
0.1590324, -0.1902882, 4.040316, 0, 0, 0, 1, 1,
0.1613932, -1.104849, 2.165798, 0, 0, 0, 1, 1,
0.164608, -0.2409534, 3.388748, 0, 0, 0, 1, 1,
0.1689823, 1.3509, 0.5727485, 0, 0, 0, 1, 1,
0.178886, 0.04428982, 2.070054, 0, 0, 0, 1, 1,
0.1816534, -2.169251, 3.007871, 0, 0, 0, 1, 1,
0.1825146, 1.251512, 0.58187, 0, 0, 0, 1, 1,
0.1855511, -0.9249386, 3.777305, 1, 1, 1, 1, 1,
0.1868949, 0.4170042, -0.9596565, 1, 1, 1, 1, 1,
0.1894843, -1.787422, 2.496195, 1, 1, 1, 1, 1,
0.1901002, -0.4339601, 2.294435, 1, 1, 1, 1, 1,
0.1907292, -1.343119, 1.844406, 1, 1, 1, 1, 1,
0.1921576, -1.621265, 2.549117, 1, 1, 1, 1, 1,
0.1943871, 0.3176979, 0.1146429, 1, 1, 1, 1, 1,
0.1950701, 0.3475004, -1.569828, 1, 1, 1, 1, 1,
0.1954686, -0.536494, 2.043291, 1, 1, 1, 1, 1,
0.202638, 1.196827, 1.188153, 1, 1, 1, 1, 1,
0.2091399, -0.7834752, 3.575253, 1, 1, 1, 1, 1,
0.2099305, 0.3681129, 0.5518038, 1, 1, 1, 1, 1,
0.2102037, -0.4206544, 3.024863, 1, 1, 1, 1, 1,
0.2122778, -0.274429, 0.9044201, 1, 1, 1, 1, 1,
0.2186425, 1.518128, 0.6067156, 1, 1, 1, 1, 1,
0.222167, 0.7850968, 0.3868634, 0, 0, 1, 1, 1,
0.2251278, 1.68868, -1.054681, 1, 0, 0, 1, 1,
0.2255914, -0.3296231, 1.657734, 1, 0, 0, 1, 1,
0.2265789, 1.136687, 0.609818, 1, 0, 0, 1, 1,
0.233704, -0.8631641, 3.346148, 1, 0, 0, 1, 1,
0.2374781, -0.4573455, -0.04477648, 1, 0, 0, 1, 1,
0.239913, -1.042865, 2.810165, 0, 0, 0, 1, 1,
0.2409379, -1.584912, 2.575235, 0, 0, 0, 1, 1,
0.2469741, 0.5937465, 0.565964, 0, 0, 0, 1, 1,
0.2491335, 0.6577463, 1.316102, 0, 0, 0, 1, 1,
0.25113, 0.03551199, 2.189841, 0, 0, 0, 1, 1,
0.2573174, 0.4657531, 0.5938087, 0, 0, 0, 1, 1,
0.2589399, -0.04510432, 0.5502555, 0, 0, 0, 1, 1,
0.2596677, 1.503595, -0.8152059, 1, 1, 1, 1, 1,
0.2626735, 1.51938, 1.214012, 1, 1, 1, 1, 1,
0.2641358, 1.659075, -0.7727082, 1, 1, 1, 1, 1,
0.2648747, -0.4420953, 4.497615, 1, 1, 1, 1, 1,
0.2668321, -0.6042146, 2.09293, 1, 1, 1, 1, 1,
0.2670765, 1.415095, 0.4102896, 1, 1, 1, 1, 1,
0.2696969, -0.9541138, 1.985255, 1, 1, 1, 1, 1,
0.2760814, -0.06941271, 2.63593, 1, 1, 1, 1, 1,
0.2783244, -1.475233, 2.650171, 1, 1, 1, 1, 1,
0.2791703, -0.04924412, 2.101446, 1, 1, 1, 1, 1,
0.2815, 0.9501559, 0.5996906, 1, 1, 1, 1, 1,
0.2838896, -1.059056, 4.111445, 1, 1, 1, 1, 1,
0.2842143, -0.9234755, 2.576181, 1, 1, 1, 1, 1,
0.2886916, -0.6255778, 0.3900158, 1, 1, 1, 1, 1,
0.2891557, 0.06688978, 0.2750513, 1, 1, 1, 1, 1,
0.2898996, -1.287915, 3.852926, 0, 0, 1, 1, 1,
0.2955454, 1.138469, 1.032605, 1, 0, 0, 1, 1,
0.2983657, -0.7165216, 1.858079, 1, 0, 0, 1, 1,
0.3003697, 1.463837, 1.475734, 1, 0, 0, 1, 1,
0.3016666, -0.1135764, 1.655474, 1, 0, 0, 1, 1,
0.302358, -0.5249632, 1.344652, 1, 0, 0, 1, 1,
0.3053105, -0.07210577, 2.524012, 0, 0, 0, 1, 1,
0.3072239, -0.7440256, 3.235833, 0, 0, 0, 1, 1,
0.3109753, 1.616956, -1.513333, 0, 0, 0, 1, 1,
0.3152163, 0.09166408, 1.780433, 0, 0, 0, 1, 1,
0.321796, 0.8524521, -0.5098206, 0, 0, 0, 1, 1,
0.3218314, -1.052261, 1.967007, 0, 0, 0, 1, 1,
0.3305229, 1.721018, 0.7256638, 0, 0, 0, 1, 1,
0.3313449, 0.07484756, 2.647795, 1, 1, 1, 1, 1,
0.3365133, -1.041439, 3.918203, 1, 1, 1, 1, 1,
0.3416159, 0.9696645, 1.440561, 1, 1, 1, 1, 1,
0.3459225, -0.04743493, 1.596266, 1, 1, 1, 1, 1,
0.3462871, 0.6187637, 1.096088, 1, 1, 1, 1, 1,
0.3497133, 1.152867, 0.2460917, 1, 1, 1, 1, 1,
0.35118, -0.7818086, 3.363991, 1, 1, 1, 1, 1,
0.3525161, -1.723629, 2.546516, 1, 1, 1, 1, 1,
0.3538403, 1.078061, -1.618772, 1, 1, 1, 1, 1,
0.3600999, 1.386961, 1.104217, 1, 1, 1, 1, 1,
0.3607722, -0.2196473, 1.709733, 1, 1, 1, 1, 1,
0.3618526, -0.544115, 2.405688, 1, 1, 1, 1, 1,
0.3662637, 0.6983588, 0.6215891, 1, 1, 1, 1, 1,
0.3680834, -0.6801761, 1.21176, 1, 1, 1, 1, 1,
0.3687961, -0.5238359, 2.756922, 1, 1, 1, 1, 1,
0.3697838, 1.073012, -0.3455032, 0, 0, 1, 1, 1,
0.3718269, 0.03173925, 1.589031, 1, 0, 0, 1, 1,
0.3768116, -0.249138, 1.949984, 1, 0, 0, 1, 1,
0.3769618, 0.2811525, 0.5195639, 1, 0, 0, 1, 1,
0.3817042, 0.1149704, 1.210246, 1, 0, 0, 1, 1,
0.3902285, -0.2554689, 3.564677, 1, 0, 0, 1, 1,
0.3928671, -0.7564362, 2.66903, 0, 0, 0, 1, 1,
0.3948198, -0.9629509, 3.733381, 0, 0, 0, 1, 1,
0.3948758, 0.9498734, -1.386668, 0, 0, 0, 1, 1,
0.395169, 0.4328501, 2.054766, 0, 0, 0, 1, 1,
0.3957819, -0.1899438, 1.807883, 0, 0, 0, 1, 1,
0.3984191, -0.6683089, 3.96081, 0, 0, 0, 1, 1,
0.4047142, 0.5517535, 1.154122, 0, 0, 0, 1, 1,
0.4054143, 0.09214325, 1.718367, 1, 1, 1, 1, 1,
0.4058843, 1.699826, -0.03025221, 1, 1, 1, 1, 1,
0.4083708, -2.180197, 2.452171, 1, 1, 1, 1, 1,
0.4147218, 0.1356588, 0.6729044, 1, 1, 1, 1, 1,
0.4181779, -0.539207, 1.10867, 1, 1, 1, 1, 1,
0.4188941, 0.2772875, 2.079783, 1, 1, 1, 1, 1,
0.4208826, 0.3283533, 0.762738, 1, 1, 1, 1, 1,
0.4218482, -0.8338975, 3.217776, 1, 1, 1, 1, 1,
0.4221872, -0.4867901, 3.60358, 1, 1, 1, 1, 1,
0.4224449, 0.9112363, 0.3639009, 1, 1, 1, 1, 1,
0.4272648, 0.569003, -1.142627, 1, 1, 1, 1, 1,
0.4290872, -0.7518068, 2.599236, 1, 1, 1, 1, 1,
0.4320416, 1.901413, 2.479194, 1, 1, 1, 1, 1,
0.4323738, -0.1138379, 1.722898, 1, 1, 1, 1, 1,
0.4364936, -1.328478, 1.920019, 1, 1, 1, 1, 1,
0.4385305, 1.454748, 1.060195, 0, 0, 1, 1, 1,
0.4397365, 1.220837, 1.110539, 1, 0, 0, 1, 1,
0.4404454, -0.04287744, 0.2604729, 1, 0, 0, 1, 1,
0.4433659, -0.7413259, 3.767359, 1, 0, 0, 1, 1,
0.4454434, 0.3310502, 4.180254, 1, 0, 0, 1, 1,
0.4485302, -0.192976, 3.011473, 1, 0, 0, 1, 1,
0.4525062, 1.674398, 0.05129215, 0, 0, 0, 1, 1,
0.4590529, 0.1896712, 0.5283875, 0, 0, 0, 1, 1,
0.4619306, 0.08266228, 0.5224993, 0, 0, 0, 1, 1,
0.4662301, 0.5019321, 2.819694, 0, 0, 0, 1, 1,
0.4670477, -1.35198, 3.470085, 0, 0, 0, 1, 1,
0.4673825, 0.3003105, 0.8297402, 0, 0, 0, 1, 1,
0.4800628, -1.204204, 2.114812, 0, 0, 0, 1, 1,
0.4856119, 0.1852255, 0.5135125, 1, 1, 1, 1, 1,
0.4861564, 0.8671063, -0.1551479, 1, 1, 1, 1, 1,
0.4864857, 0.07768135, 2.153285, 1, 1, 1, 1, 1,
0.4918391, -0.6453546, 1.145174, 1, 1, 1, 1, 1,
0.4945032, -1.714685, 2.383266, 1, 1, 1, 1, 1,
0.4961705, 0.4920419, 1.85953, 1, 1, 1, 1, 1,
0.4985482, 1.377149, 0.1490376, 1, 1, 1, 1, 1,
0.5001749, 1.779334, 1.976195, 1, 1, 1, 1, 1,
0.5047548, -0.3351641, 4.479429, 1, 1, 1, 1, 1,
0.5049999, 0.840793, 1.029567, 1, 1, 1, 1, 1,
0.5077343, 0.5493571, 2.363662, 1, 1, 1, 1, 1,
0.509101, -0.2563832, 0.05992119, 1, 1, 1, 1, 1,
0.5114665, -2.384789, 1.833829, 1, 1, 1, 1, 1,
0.5139008, 1.319753, -0.8700717, 1, 1, 1, 1, 1,
0.5139815, 0.02384901, 2.052832, 1, 1, 1, 1, 1,
0.5201568, -0.01203417, -0.01937955, 0, 0, 1, 1, 1,
0.5203626, 0.01973478, 1.612904, 1, 0, 0, 1, 1,
0.5219798, 0.005051679, 1.300401, 1, 0, 0, 1, 1,
0.5222127, 0.03090495, 2.263528, 1, 0, 0, 1, 1,
0.5227665, 0.3373725, 0.7493476, 1, 0, 0, 1, 1,
0.524995, -1.892219, 3.822852, 1, 0, 0, 1, 1,
0.534695, 0.2411276, -0.3628725, 0, 0, 0, 1, 1,
0.5367408, -0.1103898, 2.153753, 0, 0, 0, 1, 1,
0.5371377, 1.520208, -1.137165, 0, 0, 0, 1, 1,
0.5453684, 1.764243, 0.9015352, 0, 0, 0, 1, 1,
0.548243, -1.010564, 1.593372, 0, 0, 0, 1, 1,
0.5501333, -2.024529, 3.355643, 0, 0, 0, 1, 1,
0.5542647, 1.904119, 0.3346954, 0, 0, 0, 1, 1,
0.560339, -0.4713455, 2.555101, 1, 1, 1, 1, 1,
0.5631803, -0.8014256, 3.469554, 1, 1, 1, 1, 1,
0.5633704, -0.1521059, 2.826068, 1, 1, 1, 1, 1,
0.5719837, 0.4380469, 0.4105512, 1, 1, 1, 1, 1,
0.5726463, -0.4791825, 0.2564047, 1, 1, 1, 1, 1,
0.574818, -0.01573725, 3.360978, 1, 1, 1, 1, 1,
0.5836362, -0.7592007, 3.010193, 1, 1, 1, 1, 1,
0.5875591, -0.9850502, 3.000168, 1, 1, 1, 1, 1,
0.587679, -1.645933, 3.911104, 1, 1, 1, 1, 1,
0.5929347, -0.004900463, 1.82123, 1, 1, 1, 1, 1,
0.594141, -0.2487627, 2.548208, 1, 1, 1, 1, 1,
0.6110666, -1.636944, 2.326985, 1, 1, 1, 1, 1,
0.6147891, -1.239987, 2.946997, 1, 1, 1, 1, 1,
0.6178468, -0.9711034, 2.22689, 1, 1, 1, 1, 1,
0.6210129, 0.3142767, 0.6727453, 1, 1, 1, 1, 1,
0.6259583, 0.6201893, 1.717242, 0, 0, 1, 1, 1,
0.6280404, 0.3274958, 0.003718405, 1, 0, 0, 1, 1,
0.628852, 0.3398554, 1.184905, 1, 0, 0, 1, 1,
0.6337732, 2.171985, -0.2488848, 1, 0, 0, 1, 1,
0.6339633, -0.2669338, 3.161736, 1, 0, 0, 1, 1,
0.6363426, 2.0576, 0.01796307, 1, 0, 0, 1, 1,
0.6410866, 0.5758851, 2.826261, 0, 0, 0, 1, 1,
0.6442678, -0.3752155, 0.2068583, 0, 0, 0, 1, 1,
0.6448615, 1.163855, 0.06785225, 0, 0, 0, 1, 1,
0.6474316, -0.2932851, 3.834108, 0, 0, 0, 1, 1,
0.6501288, 2.576912, 1.476761, 0, 0, 0, 1, 1,
0.6503274, 0.1953626, 0.871999, 0, 0, 0, 1, 1,
0.6562135, 1.437334, 2.104556, 0, 0, 0, 1, 1,
0.6658882, 0.07182293, 0.9378408, 1, 1, 1, 1, 1,
0.6695644, -0.08155722, -0.2452314, 1, 1, 1, 1, 1,
0.6753405, 1.575709, 2.11421, 1, 1, 1, 1, 1,
0.6780831, 1.940703, -0.2179294, 1, 1, 1, 1, 1,
0.6785386, -0.3716469, 2.161246, 1, 1, 1, 1, 1,
0.6797254, -0.32717, 2.575363, 1, 1, 1, 1, 1,
0.6846669, 0.2961491, 0.06851654, 1, 1, 1, 1, 1,
0.6975645, 2.332744, -0.2935841, 1, 1, 1, 1, 1,
0.6982762, 1.988949, 1.05362, 1, 1, 1, 1, 1,
0.7002594, -1.331347, 1.885833, 1, 1, 1, 1, 1,
0.7100551, -0.9695213, 3.261774, 1, 1, 1, 1, 1,
0.7138537, -0.5267109, 0.5866856, 1, 1, 1, 1, 1,
0.7156134, -0.1571317, 2.456184, 1, 1, 1, 1, 1,
0.7172545, -0.2377927, 0.9706152, 1, 1, 1, 1, 1,
0.7174511, -1.573483, 1.567019, 1, 1, 1, 1, 1,
0.7225365, -0.7910197, 2.297472, 0, 0, 1, 1, 1,
0.7226285, -0.5421463, 0.9831911, 1, 0, 0, 1, 1,
0.7256847, -0.3300821, 2.633808, 1, 0, 0, 1, 1,
0.7270507, -0.3191749, 2.270207, 1, 0, 0, 1, 1,
0.7276934, -0.189291, 1.351056, 1, 0, 0, 1, 1,
0.7278968, 1.100374, 1.81562, 1, 0, 0, 1, 1,
0.729499, -0.4247451, 2.191937, 0, 0, 0, 1, 1,
0.7331564, 0.04114955, 0.170983, 0, 0, 0, 1, 1,
0.7373201, -0.1098582, 2.801377, 0, 0, 0, 1, 1,
0.7381828, 0.4566511, 1.194832, 0, 0, 0, 1, 1,
0.7407374, -1.264848, 3.717489, 0, 0, 0, 1, 1,
0.7458839, -1.363099, 3.922927, 0, 0, 0, 1, 1,
0.7513973, -0.7633068, 1.290171, 0, 0, 0, 1, 1,
0.7557511, 0.2106726, 0.6275456, 1, 1, 1, 1, 1,
0.7691762, 1.525505, 1.138999, 1, 1, 1, 1, 1,
0.7716429, 2.674647, 1.257793, 1, 1, 1, 1, 1,
0.7718832, 1.31309, 0.09844315, 1, 1, 1, 1, 1,
0.7771316, -0.9181702, 3.071196, 1, 1, 1, 1, 1,
0.7780342, -0.07126937, 2.498996, 1, 1, 1, 1, 1,
0.7802497, 0.3724676, 1.239562, 1, 1, 1, 1, 1,
0.7843722, -0.4105165, 1.655529, 1, 1, 1, 1, 1,
0.7971444, 0.6209183, 3.639988, 1, 1, 1, 1, 1,
0.8020524, -1.043007, 3.756486, 1, 1, 1, 1, 1,
0.8052126, -0.9331913, 2.293746, 1, 1, 1, 1, 1,
0.8069778, -0.4358445, 1.272187, 1, 1, 1, 1, 1,
0.8087291, -0.1161129, 0.8166262, 1, 1, 1, 1, 1,
0.8090369, 0.0588255, 1.211939, 1, 1, 1, 1, 1,
0.8232247, 0.7275405, 1.146803, 1, 1, 1, 1, 1,
0.8241797, 0.7373707, 1.312136, 0, 0, 1, 1, 1,
0.8256089, 1.116204, 1.225019, 1, 0, 0, 1, 1,
0.8280181, 0.3051915, -0.1651427, 1, 0, 0, 1, 1,
0.831665, 0.06127178, 0.8671542, 1, 0, 0, 1, 1,
0.8346658, 0.7106897, 0.553538, 1, 0, 0, 1, 1,
0.8347561, 1.478409, 1.445023, 1, 0, 0, 1, 1,
0.8364346, 0.03513101, 1.456895, 0, 0, 0, 1, 1,
0.8405704, 1.08964, 1.492935, 0, 0, 0, 1, 1,
0.8501958, -1.001444, 1.126868, 0, 0, 0, 1, 1,
0.8505005, -0.234655, 2.27338, 0, 0, 0, 1, 1,
0.8508499, 0.2340411, 0.9167015, 0, 0, 0, 1, 1,
0.8533875, -1.147775, 4.222656, 0, 0, 0, 1, 1,
0.8567795, 2.61662, -0.09988207, 0, 0, 0, 1, 1,
0.8605058, 1.062298, 0.1003548, 1, 1, 1, 1, 1,
0.8619351, 0.9097368, -0.8371731, 1, 1, 1, 1, 1,
0.8661057, 1.653174, 1.184413, 1, 1, 1, 1, 1,
0.866533, 0.378846, 1.058143, 1, 1, 1, 1, 1,
0.8667728, -1.123515, 1.826335, 1, 1, 1, 1, 1,
0.8802283, 0.1106212, 1.292609, 1, 1, 1, 1, 1,
0.8818101, -0.9522363, 2.742354, 1, 1, 1, 1, 1,
0.8889059, -0.04581774, 0.7737885, 1, 1, 1, 1, 1,
0.8946707, 0.1162706, 0.3111028, 1, 1, 1, 1, 1,
0.8987461, -0.599947, 0.01587635, 1, 1, 1, 1, 1,
0.9020373, 0.4418037, 2.262862, 1, 1, 1, 1, 1,
0.9077421, 0.06161989, 0.4719537, 1, 1, 1, 1, 1,
0.9155639, 1.113832, 1.07837, 1, 1, 1, 1, 1,
0.9332054, -0.823348, 2.299428, 1, 1, 1, 1, 1,
0.9337052, -0.7470344, 2.353642, 1, 1, 1, 1, 1,
0.9368562, 0.5974427, -0.1658883, 0, 0, 1, 1, 1,
0.9374675, -0.1358797, 0.8724172, 1, 0, 0, 1, 1,
0.9403321, -0.6011, 1.477242, 1, 0, 0, 1, 1,
0.9433041, 0.8379507, 0.9529029, 1, 0, 0, 1, 1,
0.9505557, -1.107309, 3.848524, 1, 0, 0, 1, 1,
0.9541042, 0.009268164, 1.990888, 1, 0, 0, 1, 1,
0.9581016, 0.6000522, -0.5214401, 0, 0, 0, 1, 1,
0.9631688, -0.5464299, 1.928597, 0, 0, 0, 1, 1,
0.9671662, -1.327955, 2.304193, 0, 0, 0, 1, 1,
0.9834097, -1.014125, 2.580507, 0, 0, 0, 1, 1,
0.9869353, -1.331944, 2.56969, 0, 0, 0, 1, 1,
0.9931908, -1.664274, 3.448213, 0, 0, 0, 1, 1,
0.9933614, -0.3513931, 1.699978, 0, 0, 0, 1, 1,
1.004335, -1.891956, 3.676111, 1, 1, 1, 1, 1,
1.005172, 0.2659413, 1.031438, 1, 1, 1, 1, 1,
1.007828, 0.8826128, 1.165881, 1, 1, 1, 1, 1,
1.016534, 0.1795175, 2.480113, 1, 1, 1, 1, 1,
1.017766, 0.1551256, 0.8115698, 1, 1, 1, 1, 1,
1.019902, 1.306556, 1.939269, 1, 1, 1, 1, 1,
1.021314, -1.085889, 3.401946, 1, 1, 1, 1, 1,
1.022118, 0.008002818, 2.535549, 1, 1, 1, 1, 1,
1.023332, 1.238776, -0.5435, 1, 1, 1, 1, 1,
1.023896, 0.9129265, 2.890566, 1, 1, 1, 1, 1,
1.024433, -1.476498, 2.225731, 1, 1, 1, 1, 1,
1.026087, -0.08333329, 1.39901, 1, 1, 1, 1, 1,
1.029935, 0.4561847, 2.21744, 1, 1, 1, 1, 1,
1.031701, -0.01220508, 3.125504, 1, 1, 1, 1, 1,
1.040384, 0.3672112, 2.071125, 1, 1, 1, 1, 1,
1.042205, 0.3136226, 1.970069, 0, 0, 1, 1, 1,
1.044352, 0.02773389, 1.401684, 1, 0, 0, 1, 1,
1.044517, 0.5475885, 1.772973, 1, 0, 0, 1, 1,
1.053954, -1.300712, 3.189801, 1, 0, 0, 1, 1,
1.055151, 0.4109368, 1.591909, 1, 0, 0, 1, 1,
1.063551, 0.8054403, 2.929997, 1, 0, 0, 1, 1,
1.086747, 1.236203, -0.179525, 0, 0, 0, 1, 1,
1.09164, -0.209824, 1.957089, 0, 0, 0, 1, 1,
1.092059, 1.596129, 2.776543, 0, 0, 0, 1, 1,
1.092503, -0.7416108, 2.783495, 0, 0, 0, 1, 1,
1.093685, -1.439, 1.18426, 0, 0, 0, 1, 1,
1.101263, -0.3004678, 2.027073, 0, 0, 0, 1, 1,
1.133824, -0.1169829, 1.341063, 0, 0, 0, 1, 1,
1.137707, 0.9219394, 1.051462, 1, 1, 1, 1, 1,
1.142623, -1.605358, 1.709185, 1, 1, 1, 1, 1,
1.146623, -0.08251243, 1.854815, 1, 1, 1, 1, 1,
1.150033, -0.3117417, 2.336208, 1, 1, 1, 1, 1,
1.155455, -0.1255301, 0.7436208, 1, 1, 1, 1, 1,
1.156009, 1.106334, -0.8186831, 1, 1, 1, 1, 1,
1.156793, 0.273643, 0.5199787, 1, 1, 1, 1, 1,
1.160041, 2.210565, 0.1515626, 1, 1, 1, 1, 1,
1.167034, 0.006274532, 2.434564, 1, 1, 1, 1, 1,
1.167626, -2.126394, 2.298584, 1, 1, 1, 1, 1,
1.168383, -0.9296604, 1.592081, 1, 1, 1, 1, 1,
1.184607, 0.02391797, 0.634644, 1, 1, 1, 1, 1,
1.191534, 0.5480624, 1.104226, 1, 1, 1, 1, 1,
1.198006, -0.8614145, 2.750832, 1, 1, 1, 1, 1,
1.198096, 0.4286681, 0.9804963, 1, 1, 1, 1, 1,
1.20016, 1.83391, -0.08005144, 0, 0, 1, 1, 1,
1.209549, 0.3480597, 1.471334, 1, 0, 0, 1, 1,
1.210949, -1.263425, 4.534739, 1, 0, 0, 1, 1,
1.215437, 0.06286779, -0.2834288, 1, 0, 0, 1, 1,
1.218786, 1.100302, 0.7440596, 1, 0, 0, 1, 1,
1.221521, 0.3653245, 1.489891, 1, 0, 0, 1, 1,
1.224426, 0.3671797, 0.6107804, 0, 0, 0, 1, 1,
1.232616, 2.048544, 0.05990229, 0, 0, 0, 1, 1,
1.233614, 0.5668703, 2.296724, 0, 0, 0, 1, 1,
1.234599, -0.876376, 2.991997, 0, 0, 0, 1, 1,
1.242542, -0.4752529, 2.430737, 0, 0, 0, 1, 1,
1.268136, 0.6663208, -0.362862, 0, 0, 0, 1, 1,
1.274229, -1.417231, 2.369351, 0, 0, 0, 1, 1,
1.27554, -0.219138, 3.365267, 1, 1, 1, 1, 1,
1.279831, -0.1077293, 3.564502, 1, 1, 1, 1, 1,
1.284681, -0.1898133, 0.4416857, 1, 1, 1, 1, 1,
1.2969, 1.096785, 2.370628, 1, 1, 1, 1, 1,
1.29766, -0.167282, 0.4466998, 1, 1, 1, 1, 1,
1.311051, 0.6291568, 0.8649279, 1, 1, 1, 1, 1,
1.319687, -1.155315, 0.6766005, 1, 1, 1, 1, 1,
1.319754, 0.1398812, 3.084162, 1, 1, 1, 1, 1,
1.32083, -0.5888345, 1.557409, 1, 1, 1, 1, 1,
1.327244, -0.8554671, 1.359921, 1, 1, 1, 1, 1,
1.332859, -0.691294, 2.497679, 1, 1, 1, 1, 1,
1.335282, -0.1516541, 2.234761, 1, 1, 1, 1, 1,
1.350418, -1.785334, 2.628212, 1, 1, 1, 1, 1,
1.351169, 0.4060227, 2.055306, 1, 1, 1, 1, 1,
1.355225, 2.207735, 1.44455, 1, 1, 1, 1, 1,
1.355368, 0.5030686, 1.540884, 0, 0, 1, 1, 1,
1.360939, -2.352046, 3.387635, 1, 0, 0, 1, 1,
1.365264, -0.7525206, 2.452035, 1, 0, 0, 1, 1,
1.371844, -0.9314927, 0.05370933, 1, 0, 0, 1, 1,
1.376651, 0.8234639, 0.7657087, 1, 0, 0, 1, 1,
1.379638, 0.5065832, 2.872078, 1, 0, 0, 1, 1,
1.387336, -0.3300825, 2.436845, 0, 0, 0, 1, 1,
1.394718, 0.1615345, 0.09633498, 0, 0, 0, 1, 1,
1.400482, -0.01138045, 1.560423, 0, 0, 0, 1, 1,
1.406337, 0.9307557, 0.4105737, 0, 0, 0, 1, 1,
1.411046, -0.2896877, -0.2037708, 0, 0, 0, 1, 1,
1.416697, 1.443182, 1.127091, 0, 0, 0, 1, 1,
1.420063, -0.4997748, 1.467387, 0, 0, 0, 1, 1,
1.436227, 0.3883382, 2.57548, 1, 1, 1, 1, 1,
1.445039, 0.5529616, 1.228248, 1, 1, 1, 1, 1,
1.447884, -0.3816737, 1.584725, 1, 1, 1, 1, 1,
1.454353, 0.4652548, 3.214837, 1, 1, 1, 1, 1,
1.491437, 0.6400525, 1.468392, 1, 1, 1, 1, 1,
1.492205, -1.441183, 2.569829, 1, 1, 1, 1, 1,
1.511795, -0.08466841, 1.831706, 1, 1, 1, 1, 1,
1.516818, 0.3889625, 1.615776, 1, 1, 1, 1, 1,
1.517126, 0.8805846, -0.01405391, 1, 1, 1, 1, 1,
1.526214, -0.3567024, 1.249436, 1, 1, 1, 1, 1,
1.537323, -1.421252, 1.076813, 1, 1, 1, 1, 1,
1.588017, -1.50583, 0.5874186, 1, 1, 1, 1, 1,
1.608274, 0.9256783, -0.4614188, 1, 1, 1, 1, 1,
1.629545, -0.6689065, 2.169717, 1, 1, 1, 1, 1,
1.632524, 1.112768, -0.03667431, 1, 1, 1, 1, 1,
1.633064, -1.728825, 2.344949, 0, 0, 1, 1, 1,
1.635303, 1.068912, 0.3561212, 1, 0, 0, 1, 1,
1.647704, 1.000733, 0.002651597, 1, 0, 0, 1, 1,
1.66185, -1.826208, 1.002746, 1, 0, 0, 1, 1,
1.677939, 0.2322335, 1.348429, 1, 0, 0, 1, 1,
1.678558, -1.24345, 0.8981605, 1, 0, 0, 1, 1,
1.687902, 1.63475, 1.773954, 0, 0, 0, 1, 1,
1.697604, 1.98682, 0.7495505, 0, 0, 0, 1, 1,
1.700803, -0.4124696, 0.553481, 0, 0, 0, 1, 1,
1.732836, 0.8913718, 0.001464327, 0, 0, 0, 1, 1,
1.73722, 0.05229749, 3.085128, 0, 0, 0, 1, 1,
1.745909, 0.2291254, 0.6258325, 0, 0, 0, 1, 1,
1.756613, 1.26172, -0.4082632, 0, 0, 0, 1, 1,
1.761801, -2.37964, 1.979531, 1, 1, 1, 1, 1,
1.790363, -0.1813919, 1.483039, 1, 1, 1, 1, 1,
1.81489, 0.4725284, 2.515471, 1, 1, 1, 1, 1,
1.840841, -1.328211, 3.412995, 1, 1, 1, 1, 1,
1.842629, 1.085705, 1.416247, 1, 1, 1, 1, 1,
1.843592, 0.7300159, 1.192264, 1, 1, 1, 1, 1,
1.877156, 0.5987974, 1.252967, 1, 1, 1, 1, 1,
1.909966, 1.047798, -0.08110406, 1, 1, 1, 1, 1,
1.912248, -0.9034502, 0.4261956, 1, 1, 1, 1, 1,
1.936446, -0.9202759, 4.212935, 1, 1, 1, 1, 1,
1.973096, -0.6628892, 1.563375, 1, 1, 1, 1, 1,
1.981259, 0.1695872, 2.736017, 1, 1, 1, 1, 1,
2.003832, 0.06222564, 1.476624, 1, 1, 1, 1, 1,
2.00643, -1.072786, 3.094292, 1, 1, 1, 1, 1,
2.015346, -0.04816974, 1.315519, 1, 1, 1, 1, 1,
2.034202, 0.7661695, 2.207932, 0, 0, 1, 1, 1,
2.074865, 0.1336509, 3.464986, 1, 0, 0, 1, 1,
2.119308, 0.249349, 0.7828358, 1, 0, 0, 1, 1,
2.125344, 0.1086501, 3.652369, 1, 0, 0, 1, 1,
2.15163, 0.09148313, 1.24589, 1, 0, 0, 1, 1,
2.201108, 0.938589, 1.584996, 1, 0, 0, 1, 1,
2.211051, 0.5214704, 1.91361, 0, 0, 0, 1, 1,
2.214951, 1.049632, 0.4944241, 0, 0, 0, 1, 1,
2.280524, 1.971274, 3.191777, 0, 0, 0, 1, 1,
2.286384, 1.123271, 1.363669, 0, 0, 0, 1, 1,
2.343455, 0.5653085, -0.2285159, 0, 0, 0, 1, 1,
2.376307, 0.3502486, 3.063093, 0, 0, 0, 1, 1,
2.379415, -0.1973261, 1.648236, 0, 0, 0, 1, 1,
2.389337, 0.9538722, 2.213459, 1, 1, 1, 1, 1,
2.587472, -0.160534, 1.972252, 1, 1, 1, 1, 1,
2.637536, 0.3851291, 0.3826022, 1, 1, 1, 1, 1,
2.654834, 0.3262329, 1.097146, 1, 1, 1, 1, 1,
2.863991, -0.9767532, 3.054504, 1, 1, 1, 1, 1,
3.212806, -0.9829168, 2.726109, 1, 1, 1, 1, 1,
3.30522, 3.267417, 0.2589491, 1, 1, 1, 1, 1
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
var radius = 9.782217;
var distance = 34.35963;
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
mvMatrix.translate( -0.1466646, -0.2482843, 0.5055385 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.35963);
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