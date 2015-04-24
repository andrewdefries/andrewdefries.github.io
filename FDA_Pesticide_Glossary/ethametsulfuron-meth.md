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
-3.578806, -1.271116, -1.234958, 1, 0, 0, 1,
-2.85588, -0.9614803, -2.08584, 1, 0.007843138, 0, 1,
-2.714072, 1.918276, -1.030511, 1, 0.01176471, 0, 1,
-2.654376, -0.6373571, -2.323719, 1, 0.01960784, 0, 1,
-2.528143, -0.06029451, -1.528693, 1, 0.02352941, 0, 1,
-2.446076, -0.1955959, -2.184139, 1, 0.03137255, 0, 1,
-2.411455, 0.9297377, -2.002108, 1, 0.03529412, 0, 1,
-2.382351, -0.9360985, -1.43292, 1, 0.04313726, 0, 1,
-2.374997, 0.7903867, -1.45412, 1, 0.04705882, 0, 1,
-2.364161, -1.34139, -1.776322, 1, 0.05490196, 0, 1,
-2.34216, -1.471709, -1.165099, 1, 0.05882353, 0, 1,
-2.276771, -1.943056, -0.5147806, 1, 0.06666667, 0, 1,
-2.200664, 0.1576056, -2.494931, 1, 0.07058824, 0, 1,
-2.1851, 0.855379, -0.05596045, 1, 0.07843138, 0, 1,
-2.114371, 0.5202298, -2.093322, 1, 0.08235294, 0, 1,
-2.097019, -0.03695538, -1.980299, 1, 0.09019608, 0, 1,
-2.076764, 0.1426203, -3.37531, 1, 0.09411765, 0, 1,
-2.066089, 0.7547086, -2.944933, 1, 0.1019608, 0, 1,
-2.041962, 1.3437, -1.25343, 1, 0.1098039, 0, 1,
-2.030499, 0.1428043, -3.18834, 1, 0.1137255, 0, 1,
-2.005247, 0.537487, -1.480268, 1, 0.1215686, 0, 1,
-1.9915, -0.02695174, -0.9856114, 1, 0.1254902, 0, 1,
-1.958563, -0.7574291, -1.034504, 1, 0.1333333, 0, 1,
-1.952955, 0.5305697, 0.3099456, 1, 0.1372549, 0, 1,
-1.939747, 1.655774, 0.2858282, 1, 0.145098, 0, 1,
-1.925147, -0.76717, -1.608637, 1, 0.1490196, 0, 1,
-1.921141, -1.820819, -3.47301, 1, 0.1568628, 0, 1,
-1.920676, -2.321656, -2.511309, 1, 0.1607843, 0, 1,
-1.894055, -1.160978, -3.315907, 1, 0.1686275, 0, 1,
-1.890298, -0.1169712, -0.8696919, 1, 0.172549, 0, 1,
-1.8842, 1.120928, -1.322099, 1, 0.1803922, 0, 1,
-1.874933, -0.5099172, -3.032061, 1, 0.1843137, 0, 1,
-1.865615, -0.09117313, -1.290663, 1, 0.1921569, 0, 1,
-1.857442, 1.197479, -0.3952191, 1, 0.1960784, 0, 1,
-1.840942, 0.5283707, -1.459791, 1, 0.2039216, 0, 1,
-1.837854, -1.304068, -2.883935, 1, 0.2117647, 0, 1,
-1.835158, -0.911064, -2.568737, 1, 0.2156863, 0, 1,
-1.8327, 1.96424, -1.075361, 1, 0.2235294, 0, 1,
-1.82233, 1.332637, -0.9499405, 1, 0.227451, 0, 1,
-1.821771, -1.721213, -2.315645, 1, 0.2352941, 0, 1,
-1.812232, -0.1985554, -3.391801, 1, 0.2392157, 0, 1,
-1.806203, 0.7057098, -0.9610505, 1, 0.2470588, 0, 1,
-1.787127, 0.06122977, -1.29372, 1, 0.2509804, 0, 1,
-1.785299, -0.1666662, -0.2556178, 1, 0.2588235, 0, 1,
-1.781817, -0.5451316, -0.09553616, 1, 0.2627451, 0, 1,
-1.74133, 0.3536362, -2.846627, 1, 0.2705882, 0, 1,
-1.700632, -1.445665, -1.396317, 1, 0.2745098, 0, 1,
-1.674779, -0.277761, -0.358383, 1, 0.282353, 0, 1,
-1.669256, -0.3570306, -3.012314, 1, 0.2862745, 0, 1,
-1.651788, -0.02181908, -2.772121, 1, 0.2941177, 0, 1,
-1.638429, 0.9978558, -1.318329, 1, 0.3019608, 0, 1,
-1.638288, -0.5750002, -1.397861, 1, 0.3058824, 0, 1,
-1.636242, -2.005916, -2.915403, 1, 0.3137255, 0, 1,
-1.633624, -1.021283, -3.430975, 1, 0.3176471, 0, 1,
-1.616498, -0.2111102, -1.708041, 1, 0.3254902, 0, 1,
-1.609683, -1.175578, -3.422825, 1, 0.3294118, 0, 1,
-1.602208, -0.9967556, -3.520652, 1, 0.3372549, 0, 1,
-1.601559, -1.016197, -0.8009401, 1, 0.3411765, 0, 1,
-1.598573, 1.804718, -0.5911232, 1, 0.3490196, 0, 1,
-1.58929, 1.00147, -2.693328, 1, 0.3529412, 0, 1,
-1.589103, -0.6173566, -1.275013, 1, 0.3607843, 0, 1,
-1.581896, 0.2005171, -1.936448, 1, 0.3647059, 0, 1,
-1.578191, 0.4682508, -1.981591, 1, 0.372549, 0, 1,
-1.571388, -0.1382221, -0.3962568, 1, 0.3764706, 0, 1,
-1.570881, -1.137442, -1.950645, 1, 0.3843137, 0, 1,
-1.567363, 1.259497, -1.291591, 1, 0.3882353, 0, 1,
-1.557598, 1.488302, -0.610893, 1, 0.3960784, 0, 1,
-1.552806, -0.6598976, -2.527403, 1, 0.4039216, 0, 1,
-1.545026, 0.6204471, -1.256248, 1, 0.4078431, 0, 1,
-1.516191, -1.190406, -2.330531, 1, 0.4156863, 0, 1,
-1.51515, 0.8999661, -2.079064, 1, 0.4196078, 0, 1,
-1.514889, -0.6674072, -2.551281, 1, 0.427451, 0, 1,
-1.508881, 0.05980478, -0.5847521, 1, 0.4313726, 0, 1,
-1.507866, 0.5710981, -1.69686, 1, 0.4392157, 0, 1,
-1.500387, 0.1792439, -0.9205489, 1, 0.4431373, 0, 1,
-1.497199, 0.5078797, 0.1998252, 1, 0.4509804, 0, 1,
-1.494133, 0.340652, -2.409027, 1, 0.454902, 0, 1,
-1.492033, 0.06069934, -1.936009, 1, 0.4627451, 0, 1,
-1.485454, 0.3232983, -0.3553137, 1, 0.4666667, 0, 1,
-1.484787, -0.3788458, -1.855996, 1, 0.4745098, 0, 1,
-1.484585, -0.286375, -2.523917, 1, 0.4784314, 0, 1,
-1.47643, 0.4377309, -0.08351303, 1, 0.4862745, 0, 1,
-1.474609, -1.104235, -3.179483, 1, 0.4901961, 0, 1,
-1.468353, -0.9388353, -2.518466, 1, 0.4980392, 0, 1,
-1.468084, 1.31136, 0.5095506, 1, 0.5058824, 0, 1,
-1.466843, 0.7381029, -1.257729, 1, 0.509804, 0, 1,
-1.460815, 0.3632439, -2.822038, 1, 0.5176471, 0, 1,
-1.451806, -0.2038079, -1.748336, 1, 0.5215687, 0, 1,
-1.427258, 0.4227941, -2.235206, 1, 0.5294118, 0, 1,
-1.425613, -0.326474, -0.9639787, 1, 0.5333334, 0, 1,
-1.419327, -0.6672323, -0.9288263, 1, 0.5411765, 0, 1,
-1.41602, 0.1987663, -1.351316, 1, 0.5450981, 0, 1,
-1.409663, 0.4275143, -1.59367, 1, 0.5529412, 0, 1,
-1.397613, 0.9857442, -0.429081, 1, 0.5568628, 0, 1,
-1.384532, -0.08043499, -1.586122, 1, 0.5647059, 0, 1,
-1.375055, 0.3830408, -0.209949, 1, 0.5686275, 0, 1,
-1.373593, 1.30953, 0.736378, 1, 0.5764706, 0, 1,
-1.363284, 0.6582381, 0.191955, 1, 0.5803922, 0, 1,
-1.354468, -2.732001, -3.145392, 1, 0.5882353, 0, 1,
-1.349429, 3.004424, -1.699045, 1, 0.5921569, 0, 1,
-1.348231, -1.143212, -0.5752596, 1, 0.6, 0, 1,
-1.347344, 0.458005, -3.255797, 1, 0.6078432, 0, 1,
-1.341635, 0.7440319, -2.155275, 1, 0.6117647, 0, 1,
-1.341414, -0.1366116, -3.496005, 1, 0.6196079, 0, 1,
-1.329037, -0.1307037, -0.8323489, 1, 0.6235294, 0, 1,
-1.310688, -0.5672059, -2.323064, 1, 0.6313726, 0, 1,
-1.308701, -0.8959736, -1.286476, 1, 0.6352941, 0, 1,
-1.30798, -0.05532761, -1.173518, 1, 0.6431373, 0, 1,
-1.307877, 0.528846, 0.9030838, 1, 0.6470588, 0, 1,
-1.303279, -0.1957678, -4.000729, 1, 0.654902, 0, 1,
-1.295588, -0.3078014, -1.160021, 1, 0.6588235, 0, 1,
-1.289516, -0.9872404, -1.778511, 1, 0.6666667, 0, 1,
-1.277295, 0.1914006, -1.82501, 1, 0.6705883, 0, 1,
-1.274767, -1.351391, -0.7954593, 1, 0.6784314, 0, 1,
-1.261886, 1.251316, -0.3293428, 1, 0.682353, 0, 1,
-1.257635, 3.055556, 0.09240236, 1, 0.6901961, 0, 1,
-1.255034, 1.158074, -0.547619, 1, 0.6941177, 0, 1,
-1.251512, 1.271058, -2.224084, 1, 0.7019608, 0, 1,
-1.250034, 1.346703, -1.016032, 1, 0.7098039, 0, 1,
-1.245922, -0.4339075, -0.5438391, 1, 0.7137255, 0, 1,
-1.2333, -1.043273, -3.23976, 1, 0.7215686, 0, 1,
-1.230213, 0.119974, -1.90348, 1, 0.7254902, 0, 1,
-1.229514, 1.036507, -0.2897579, 1, 0.7333333, 0, 1,
-1.216862, -0.5624488, -0.9608613, 1, 0.7372549, 0, 1,
-1.214071, 0.8802902, -2.762791, 1, 0.7450981, 0, 1,
-1.209424, -1.057812, -1.225688, 1, 0.7490196, 0, 1,
-1.20613, 0.1751388, -0.2601786, 1, 0.7568628, 0, 1,
-1.200859, -0.5910876, -1.555755, 1, 0.7607843, 0, 1,
-1.197661, 0.1160618, -1.469542, 1, 0.7686275, 0, 1,
-1.197035, 0.6195353, -1.054835, 1, 0.772549, 0, 1,
-1.196532, -0.2354651, -2.436912, 1, 0.7803922, 0, 1,
-1.195754, -1.270249, -2.464919, 1, 0.7843137, 0, 1,
-1.193453, 0.5961679, -2.612203, 1, 0.7921569, 0, 1,
-1.173981, -0.1629945, -2.887799, 1, 0.7960784, 0, 1,
-1.166703, -1.026984, -3.295179, 1, 0.8039216, 0, 1,
-1.162746, -0.8389852, -1.555599, 1, 0.8117647, 0, 1,
-1.161245, -1.431575, -3.690941, 1, 0.8156863, 0, 1,
-1.150922, 1.38364, -0.5642101, 1, 0.8235294, 0, 1,
-1.148878, 0.1996235, -0.6371617, 1, 0.827451, 0, 1,
-1.14803, -0.2548891, -3.313499, 1, 0.8352941, 0, 1,
-1.146844, -0.4580111, -1.613818, 1, 0.8392157, 0, 1,
-1.14253, -1.235016, -4.566872, 1, 0.8470588, 0, 1,
-1.139687, -0.2022784, -1.732654, 1, 0.8509804, 0, 1,
-1.136799, 0.570758, -1.981804, 1, 0.8588235, 0, 1,
-1.135011, -0.6204816, -2.301666, 1, 0.8627451, 0, 1,
-1.122618, -2.384808, -4.477984, 1, 0.8705882, 0, 1,
-1.117968, -1.574087, -1.204192, 1, 0.8745098, 0, 1,
-1.105209, 0.8668019, -1.307564, 1, 0.8823529, 0, 1,
-1.105152, -0.2829208, -2.199581, 1, 0.8862745, 0, 1,
-1.091376, 1.508249, 1.439856, 1, 0.8941177, 0, 1,
-1.090422, -0.1793254, -2.427919, 1, 0.8980392, 0, 1,
-1.084882, -1.030326, -3.303649, 1, 0.9058824, 0, 1,
-1.084387, -0.7185004, -2.424151, 1, 0.9137255, 0, 1,
-1.082293, -0.7803432, -1.481765, 1, 0.9176471, 0, 1,
-1.074533, 0.5907127, -1.482301, 1, 0.9254902, 0, 1,
-1.07389, 0.1662643, -1.336859, 1, 0.9294118, 0, 1,
-1.072002, 0.3552292, -0.5279356, 1, 0.9372549, 0, 1,
-1.069085, 0.6715124, -0.06187382, 1, 0.9411765, 0, 1,
-1.067919, -0.402692, -3.033116, 1, 0.9490196, 0, 1,
-1.066225, 0.08340019, -1.191871, 1, 0.9529412, 0, 1,
-1.061152, 1.613817, -2.394588, 1, 0.9607843, 0, 1,
-1.059268, -0.08116698, -3.072552, 1, 0.9647059, 0, 1,
-1.043933, -0.2230918, -1.728406, 1, 0.972549, 0, 1,
-1.042746, -1.122854, -0.549228, 1, 0.9764706, 0, 1,
-1.040395, 1.013777, -1.435127, 1, 0.9843137, 0, 1,
-1.034557, 1.24362, -1.567041, 1, 0.9882353, 0, 1,
-1.033566, -0.9484573, -3.210161, 1, 0.9960784, 0, 1,
-1.032731, 0.02644385, -1.561464, 0.9960784, 1, 0, 1,
-1.032223, 0.2021754, -0.8308017, 0.9921569, 1, 0, 1,
-1.029876, 0.6755551, -0.02802147, 0.9843137, 1, 0, 1,
-1.009263, 0.1316997, -1.204393, 0.9803922, 1, 0, 1,
-1.009143, -0.6998809, -0.8583811, 0.972549, 1, 0, 1,
-1.00424, 1.587885, -0.3352617, 0.9686275, 1, 0, 1,
-1.001411, 0.486735, 0.7647033, 0.9607843, 1, 0, 1,
-1.000849, -0.8502665, -1.932138, 0.9568627, 1, 0, 1,
-0.9982453, -1.69888, -1.29953, 0.9490196, 1, 0, 1,
-0.9951417, -0.2916039, -0.02570844, 0.945098, 1, 0, 1,
-0.9922329, -0.0721589, -0.9169737, 0.9372549, 1, 0, 1,
-0.9873992, -0.5805161, -0.5764361, 0.9333333, 1, 0, 1,
-0.9751692, -0.6802185, -1.272195, 0.9254902, 1, 0, 1,
-0.9743367, 3.687095, -0.4895624, 0.9215686, 1, 0, 1,
-0.9739752, -1.30891, -1.971481, 0.9137255, 1, 0, 1,
-0.9727072, -1.004769, -2.647273, 0.9098039, 1, 0, 1,
-0.9683371, 0.06990319, -1.027247, 0.9019608, 1, 0, 1,
-0.9661067, 1.045816, -0.1426029, 0.8941177, 1, 0, 1,
-0.9644719, -1.044655, -3.779214, 0.8901961, 1, 0, 1,
-0.9586064, 0.2911841, -1.272926, 0.8823529, 1, 0, 1,
-0.9507482, -1.594893, -0.8325748, 0.8784314, 1, 0, 1,
-0.9500318, -0.6642685, -2.998434, 0.8705882, 1, 0, 1,
-0.9420865, 0.470538, -2.137099, 0.8666667, 1, 0, 1,
-0.9339092, 0.3850959, -1.218944, 0.8588235, 1, 0, 1,
-0.9326906, -1.628455, -2.926477, 0.854902, 1, 0, 1,
-0.9312525, -1.262116, -2.421618, 0.8470588, 1, 0, 1,
-0.9302907, 0.02345341, -1.992165, 0.8431373, 1, 0, 1,
-0.9284983, 1.686592, -1.267259, 0.8352941, 1, 0, 1,
-0.9251308, -0.18533, -2.444136, 0.8313726, 1, 0, 1,
-0.9251161, 0.7561778, -1.298785, 0.8235294, 1, 0, 1,
-0.9221346, 0.2041969, -2.506331, 0.8196079, 1, 0, 1,
-0.9213687, 0.1306637, -0.02793158, 0.8117647, 1, 0, 1,
-0.9175287, 1.0799, -0.4291081, 0.8078431, 1, 0, 1,
-0.9096891, 0.3999141, -0.4312658, 0.8, 1, 0, 1,
-0.9078914, 0.1961915, -0.9018801, 0.7921569, 1, 0, 1,
-0.9033424, 0.6049685, 0.2504477, 0.7882353, 1, 0, 1,
-0.9012273, 0.07680194, -1.314646, 0.7803922, 1, 0, 1,
-0.900017, 0.5193217, 0.9244934, 0.7764706, 1, 0, 1,
-0.8966051, -0.4741629, -1.493052, 0.7686275, 1, 0, 1,
-0.8926423, 1.99205, -0.5241076, 0.7647059, 1, 0, 1,
-0.8889603, 0.04522543, -1.131769, 0.7568628, 1, 0, 1,
-0.8871295, -1.537701, -2.547727, 0.7529412, 1, 0, 1,
-0.8796631, -0.06753033, -1.951123, 0.7450981, 1, 0, 1,
-0.8761303, -0.4124601, -1.565627, 0.7411765, 1, 0, 1,
-0.8716383, 0.1259956, -1.502693, 0.7333333, 1, 0, 1,
-0.870213, -0.991664, -1.426108, 0.7294118, 1, 0, 1,
-0.8691592, 0.05688203, -2.058438, 0.7215686, 1, 0, 1,
-0.8687047, -0.04567687, -0.6575552, 0.7176471, 1, 0, 1,
-0.8629162, 1.96985, -0.5387496, 0.7098039, 1, 0, 1,
-0.8583501, -0.6033614, -2.657599, 0.7058824, 1, 0, 1,
-0.8580832, -0.5389526, -1.246908, 0.6980392, 1, 0, 1,
-0.8569316, -0.9260154, -2.536688, 0.6901961, 1, 0, 1,
-0.851806, 0.6103377, -0.958073, 0.6862745, 1, 0, 1,
-0.8354258, -1.583972, -2.428309, 0.6784314, 1, 0, 1,
-0.8304353, 0.7106232, 1.021408, 0.6745098, 1, 0, 1,
-0.8270684, 0.9240027, -1.963802, 0.6666667, 1, 0, 1,
-0.8203022, -0.8596375, -3.838222, 0.6627451, 1, 0, 1,
-0.8149708, 0.2059536, -2.298874, 0.654902, 1, 0, 1,
-0.8131881, 0.6167981, -0.9295294, 0.6509804, 1, 0, 1,
-0.8108597, -0.7987975, -3.147761, 0.6431373, 1, 0, 1,
-0.8062034, -1.218739, -3.305311, 0.6392157, 1, 0, 1,
-0.8054101, 1.572892, -1.560148, 0.6313726, 1, 0, 1,
-0.8018589, -0.5537872, -3.001932, 0.627451, 1, 0, 1,
-0.7990408, -0.07274178, -0.7024304, 0.6196079, 1, 0, 1,
-0.7984556, -1.398549, -1.960626, 0.6156863, 1, 0, 1,
-0.7972239, -1.646049, -3.599479, 0.6078432, 1, 0, 1,
-0.7940333, -0.3716843, -1.9464, 0.6039216, 1, 0, 1,
-0.7937236, 1.491905, -1.533952, 0.5960785, 1, 0, 1,
-0.7929011, 1.562216, 1.211562, 0.5882353, 1, 0, 1,
-0.7891732, 0.08359107, -1.569379, 0.5843138, 1, 0, 1,
-0.7874074, 1.31351, 1.423781, 0.5764706, 1, 0, 1,
-0.7868543, -0.530829, -0.9307188, 0.572549, 1, 0, 1,
-0.7822242, -0.4804925, -2.598321, 0.5647059, 1, 0, 1,
-0.7785759, -0.7937252, -3.085003, 0.5607843, 1, 0, 1,
-0.7734736, -0.8896157, -3.706641, 0.5529412, 1, 0, 1,
-0.7683772, -1.294016, -1.867716, 0.5490196, 1, 0, 1,
-0.7645995, -0.4272075, -0.8358068, 0.5411765, 1, 0, 1,
-0.7641291, 1.457724, 0.4948541, 0.5372549, 1, 0, 1,
-0.7638112, 0.4322018, -1.899304, 0.5294118, 1, 0, 1,
-0.7629807, -0.7182784, -2.644273, 0.5254902, 1, 0, 1,
-0.7562957, 0.07372989, -1.082151, 0.5176471, 1, 0, 1,
-0.7484099, 0.07871677, -1.105476, 0.5137255, 1, 0, 1,
-0.7453894, -0.1910667, -1.876688, 0.5058824, 1, 0, 1,
-0.7370595, 0.8452105, -2.220786, 0.5019608, 1, 0, 1,
-0.7356645, 0.6306705, -0.3411919, 0.4941176, 1, 0, 1,
-0.7333262, -0.5615466, -1.300618, 0.4862745, 1, 0, 1,
-0.7280112, 0.7961785, -0.1003488, 0.4823529, 1, 0, 1,
-0.7273449, 0.348784, -1.353594, 0.4745098, 1, 0, 1,
-0.7234133, 0.1190867, -1.236267, 0.4705882, 1, 0, 1,
-0.7204968, -1.040919, -2.195167, 0.4627451, 1, 0, 1,
-0.7186953, -1.386159, -2.178817, 0.4588235, 1, 0, 1,
-0.7185968, -0.45313, -2.855167, 0.4509804, 1, 0, 1,
-0.7165169, 0.4824866, -1.819556, 0.4470588, 1, 0, 1,
-0.7084156, -0.3063596, -1.618147, 0.4392157, 1, 0, 1,
-0.7061607, -0.1789139, -2.018436, 0.4352941, 1, 0, 1,
-0.7049671, 0.0977837, -1.920425, 0.427451, 1, 0, 1,
-0.7027401, 0.1973388, 0.3482651, 0.4235294, 1, 0, 1,
-0.7022505, -1.336922, -1.529694, 0.4156863, 1, 0, 1,
-0.6926609, -0.6008472, -3.014186, 0.4117647, 1, 0, 1,
-0.6926206, -0.5594122, -3.577609, 0.4039216, 1, 0, 1,
-0.686998, -0.5930332, -1.304123, 0.3960784, 1, 0, 1,
-0.6814471, -0.04921486, -2.753626, 0.3921569, 1, 0, 1,
-0.674738, 0.9548987, -1.323313, 0.3843137, 1, 0, 1,
-0.6733196, -0.7265415, -1.819872, 0.3803922, 1, 0, 1,
-0.669776, 0.09345723, -0.304897, 0.372549, 1, 0, 1,
-0.6660547, -0.1047056, -1.709843, 0.3686275, 1, 0, 1,
-0.6648808, 0.03953194, -3.121985, 0.3607843, 1, 0, 1,
-0.6618825, 0.01954138, -0.6933796, 0.3568628, 1, 0, 1,
-0.6560932, 0.04881601, -0.5364331, 0.3490196, 1, 0, 1,
-0.653648, -0.3483499, -1.415053, 0.345098, 1, 0, 1,
-0.646341, 0.824253, 0.487736, 0.3372549, 1, 0, 1,
-0.6431141, -0.5848443, -3.161468, 0.3333333, 1, 0, 1,
-0.6430825, 0.2120275, -0.8904749, 0.3254902, 1, 0, 1,
-0.6398826, -0.4226474, -3.765078, 0.3215686, 1, 0, 1,
-0.6376368, -1.051237, -2.462757, 0.3137255, 1, 0, 1,
-0.6373525, 1.131713, 0.2966532, 0.3098039, 1, 0, 1,
-0.6363171, 0.1208405, -2.897069, 0.3019608, 1, 0, 1,
-0.6338789, -0.4581526, -1.12565, 0.2941177, 1, 0, 1,
-0.6262122, 0.9144115, 0.2046083, 0.2901961, 1, 0, 1,
-0.621958, -0.7843567, -1.739976, 0.282353, 1, 0, 1,
-0.6214224, -1.188546, -2.841763, 0.2784314, 1, 0, 1,
-0.61862, -0.9256835, -1.468895, 0.2705882, 1, 0, 1,
-0.6152471, 0.2791426, -0.7531368, 0.2666667, 1, 0, 1,
-0.6099486, -0.5183512, -2.581837, 0.2588235, 1, 0, 1,
-0.6001536, -0.2857594, -1.494931, 0.254902, 1, 0, 1,
-0.596357, -1.208102, -2.61932, 0.2470588, 1, 0, 1,
-0.5950955, -1.951183, -3.419071, 0.2431373, 1, 0, 1,
-0.5933428, 0.3964059, -3.148497, 0.2352941, 1, 0, 1,
-0.5865494, 0.4207661, 0.6263638, 0.2313726, 1, 0, 1,
-0.5862789, -0.4512598, -1.595157, 0.2235294, 1, 0, 1,
-0.5818347, -1.621539, -2.163584, 0.2196078, 1, 0, 1,
-0.5782598, 0.1784277, -1.329577, 0.2117647, 1, 0, 1,
-0.5777337, 2.452699, 1.5935, 0.2078431, 1, 0, 1,
-0.5753033, 1.418065, -0.4947038, 0.2, 1, 0, 1,
-0.5720651, 0.0174747, -0.8485984, 0.1921569, 1, 0, 1,
-0.5701736, -0.4902705, -4.580517, 0.1882353, 1, 0, 1,
-0.5696478, -1.188492, -3.127717, 0.1803922, 1, 0, 1,
-0.5694962, 0.959939, -0.5301648, 0.1764706, 1, 0, 1,
-0.5677674, -0.1054021, -1.017388, 0.1686275, 1, 0, 1,
-0.5669711, 0.7926642, -1.318455, 0.1647059, 1, 0, 1,
-0.5651684, -0.5738254, -3.024909, 0.1568628, 1, 0, 1,
-0.5592192, -0.4113018, -1.423295, 0.1529412, 1, 0, 1,
-0.5575764, 0.6670817, -1.016929, 0.145098, 1, 0, 1,
-0.5559875, 0.5701079, -2.14483, 0.1411765, 1, 0, 1,
-0.5545307, 0.7041701, -0.8362697, 0.1333333, 1, 0, 1,
-0.5540441, 1.276012, -1.599303, 0.1294118, 1, 0, 1,
-0.5537586, 1.501462, -0.5953943, 0.1215686, 1, 0, 1,
-0.5406581, -0.4505419, -1.855717, 0.1176471, 1, 0, 1,
-0.5399383, -0.564387, -0.5524288, 0.1098039, 1, 0, 1,
-0.5339403, 0.4459508, -1.978225, 0.1058824, 1, 0, 1,
-0.5290104, -0.9001226, -2.761299, 0.09803922, 1, 0, 1,
-0.5258011, 0.7952738, -0.7755138, 0.09019608, 1, 0, 1,
-0.5231493, -1.557157, -3.907725, 0.08627451, 1, 0, 1,
-0.5008798, -0.3114332, -1.421348, 0.07843138, 1, 0, 1,
-0.4982475, -0.9683701, -1.652633, 0.07450981, 1, 0, 1,
-0.4926932, -1.005935, -1.536817, 0.06666667, 1, 0, 1,
-0.491065, 0.7378255, -1.429748, 0.0627451, 1, 0, 1,
-0.4885222, 1.228315, -2.078504, 0.05490196, 1, 0, 1,
-0.4824151, 0.4822264, 0.5873801, 0.05098039, 1, 0, 1,
-0.4786403, -0.680508, -1.908478, 0.04313726, 1, 0, 1,
-0.4780423, -0.501179, -1.056725, 0.03921569, 1, 0, 1,
-0.4768701, 1.240867, 0.6555495, 0.03137255, 1, 0, 1,
-0.4729906, 0.4020583, -0.6743201, 0.02745098, 1, 0, 1,
-0.4715099, -0.3184791, -1.932701, 0.01960784, 1, 0, 1,
-0.4672374, -0.4997138, -2.443553, 0.01568628, 1, 0, 1,
-0.4643173, -1.298806, -2.272851, 0.007843138, 1, 0, 1,
-0.4634895, 0.5517154, -0.7730814, 0.003921569, 1, 0, 1,
-0.4616852, -1.635367, -2.974656, 0, 1, 0.003921569, 1,
-0.4614424, -0.973463, -4.561692, 0, 1, 0.01176471, 1,
-0.4607728, 0.09034467, -1.382273, 0, 1, 0.01568628, 1,
-0.4572658, 0.6965304, -1.350878, 0, 1, 0.02352941, 1,
-0.4566706, 0.2503376, -1.77361, 0, 1, 0.02745098, 1,
-0.4563749, -0.4824634, -0.8457146, 0, 1, 0.03529412, 1,
-0.4544571, -0.6727637, -2.916743, 0, 1, 0.03921569, 1,
-0.4527267, -1.791499, -3.579499, 0, 1, 0.04705882, 1,
-0.4515147, -0.2994754, -1.284028, 0, 1, 0.05098039, 1,
-0.4458959, 1.496331, -0.4179294, 0, 1, 0.05882353, 1,
-0.4430266, 0.9805374, 0.06487528, 0, 1, 0.0627451, 1,
-0.4426813, 0.03772124, -2.053925, 0, 1, 0.07058824, 1,
-0.437039, 0.4058077, -1.648054, 0, 1, 0.07450981, 1,
-0.4349459, 1.763948, 0.2664866, 0, 1, 0.08235294, 1,
-0.43177, 0.4719415, -3.6408, 0, 1, 0.08627451, 1,
-0.4303034, -0.3445646, -2.323321, 0, 1, 0.09411765, 1,
-0.4282402, 0.459889, -0.07348004, 0, 1, 0.1019608, 1,
-0.4222472, 0.5282892, -1.122932, 0, 1, 0.1058824, 1,
-0.4182245, 0.5641855, -1.446743, 0, 1, 0.1137255, 1,
-0.4174658, 1.778257, 1.345123, 0, 1, 0.1176471, 1,
-0.4137066, 0.6027555, -1.478628, 0, 1, 0.1254902, 1,
-0.4102728, -0.7656727, -1.737066, 0, 1, 0.1294118, 1,
-0.4076485, 0.4160673, -1.161512, 0, 1, 0.1372549, 1,
-0.4075875, -1.424102, -4.046045, 0, 1, 0.1411765, 1,
-0.4028617, -1.582753, -2.938866, 0, 1, 0.1490196, 1,
-0.4004795, 0.8366777, 0.104461, 0, 1, 0.1529412, 1,
-0.3958189, -0.5709993, -2.969016, 0, 1, 0.1607843, 1,
-0.3943019, 0.7990339, -0.6875729, 0, 1, 0.1647059, 1,
-0.3919133, -0.2706371, -3.320523, 0, 1, 0.172549, 1,
-0.3896834, -1.149827, -2.715888, 0, 1, 0.1764706, 1,
-0.3886421, -0.8542064, -1.301711, 0, 1, 0.1843137, 1,
-0.3876151, -0.7194287, -2.435505, 0, 1, 0.1882353, 1,
-0.3866911, -0.5072252, -2.884309, 0, 1, 0.1960784, 1,
-0.3857489, 1.872694, -2.318202, 0, 1, 0.2039216, 1,
-0.3833478, -0.5996343, -2.062322, 0, 1, 0.2078431, 1,
-0.379076, 1.883437, -0.04260022, 0, 1, 0.2156863, 1,
-0.3739156, -0.5472369, -3.836356, 0, 1, 0.2196078, 1,
-0.3696084, 0.1927358, -1.711016, 0, 1, 0.227451, 1,
-0.3606201, 0.1217627, -2.919063, 0, 1, 0.2313726, 1,
-0.3552426, -0.2234354, -1.281275, 0, 1, 0.2392157, 1,
-0.3538028, -1.113255, -2.222675, 0, 1, 0.2431373, 1,
-0.3478796, 0.04101542, -2.616016, 0, 1, 0.2509804, 1,
-0.3405462, 0.005754624, -1.175054, 0, 1, 0.254902, 1,
-0.336833, -0.3610834, -2.39342, 0, 1, 0.2627451, 1,
-0.3344495, -0.02353438, -0.9263894, 0, 1, 0.2666667, 1,
-0.3289781, 0.7929611, -2.521083, 0, 1, 0.2745098, 1,
-0.328564, 0.4394566, -1.8783, 0, 1, 0.2784314, 1,
-0.3274863, -1.020714, -2.033353, 0, 1, 0.2862745, 1,
-0.3269171, 0.9841919, 1.225013, 0, 1, 0.2901961, 1,
-0.3231573, 0.260708, -0.3930296, 0, 1, 0.2980392, 1,
-0.3193293, 1.266337, 1.463366, 0, 1, 0.3058824, 1,
-0.3171361, 0.8988112, 0.291966, 0, 1, 0.3098039, 1,
-0.3161643, -0.07675538, -0.9315515, 0, 1, 0.3176471, 1,
-0.3147557, -1.345109, -2.574607, 0, 1, 0.3215686, 1,
-0.3133557, 0.1929805, 0.2313495, 0, 1, 0.3294118, 1,
-0.3109399, -0.5601941, -1.984003, 0, 1, 0.3333333, 1,
-0.3016022, -0.6369352, -1.952286, 0, 1, 0.3411765, 1,
-0.3009456, 1.527337, 0.4371202, 0, 1, 0.345098, 1,
-0.2947062, 1.501113, -1.022917, 0, 1, 0.3529412, 1,
-0.2928049, -1.319328, -2.730874, 0, 1, 0.3568628, 1,
-0.2927541, -1.257346, -4.288803, 0, 1, 0.3647059, 1,
-0.2882815, 0.003291917, -0.8300671, 0, 1, 0.3686275, 1,
-0.283545, -0.08052328, -1.069993, 0, 1, 0.3764706, 1,
-0.2789236, -0.9255807, -2.820558, 0, 1, 0.3803922, 1,
-0.278565, 0.296985, -1.511069, 0, 1, 0.3882353, 1,
-0.2766539, -1.748554, -3.35865, 0, 1, 0.3921569, 1,
-0.2745613, 0.7907595, 0.468769, 0, 1, 0.4, 1,
-0.2719646, 1.855749, -2.53122, 0, 1, 0.4078431, 1,
-0.258556, -1.782687, -2.908322, 0, 1, 0.4117647, 1,
-0.2560055, 0.01988092, -1.982341, 0, 1, 0.4196078, 1,
-0.2530392, -1.233766, -2.074383, 0, 1, 0.4235294, 1,
-0.2517285, -0.3272437, -1.245937, 0, 1, 0.4313726, 1,
-0.2507678, 1.480282, -0.3303253, 0, 1, 0.4352941, 1,
-0.2506473, -1.067294, -2.822902, 0, 1, 0.4431373, 1,
-0.2481035, 0.01288972, -3.238522, 0, 1, 0.4470588, 1,
-0.2412698, -2.066226, -3.108562, 0, 1, 0.454902, 1,
-0.2410672, -0.9450077, -3.508605, 0, 1, 0.4588235, 1,
-0.2398968, 0.9367976, -0.07276158, 0, 1, 0.4666667, 1,
-0.2397955, -0.4810193, -3.058644, 0, 1, 0.4705882, 1,
-0.2392412, 0.4463636, -0.006403245, 0, 1, 0.4784314, 1,
-0.2334669, -0.6535578, -2.14353, 0, 1, 0.4823529, 1,
-0.2289188, 1.119712, -0.9337429, 0, 1, 0.4901961, 1,
-0.2269154, 0.2186101, -0.8257964, 0, 1, 0.4941176, 1,
-0.2251154, 1.66761, -0.559466, 0, 1, 0.5019608, 1,
-0.2243028, -1.478679, -4.782657, 0, 1, 0.509804, 1,
-0.2215079, -0.1893566, -1.945599, 0, 1, 0.5137255, 1,
-0.2155274, -0.3254329, -2.344807, 0, 1, 0.5215687, 1,
-0.2028923, 0.5084813, 0.5233291, 0, 1, 0.5254902, 1,
-0.1978957, 1.717413, -0.7600155, 0, 1, 0.5333334, 1,
-0.1960587, 1.031352, -0.2344443, 0, 1, 0.5372549, 1,
-0.1924876, -0.6705924, -2.792059, 0, 1, 0.5450981, 1,
-0.1881979, 0.9191031, 0.08599012, 0, 1, 0.5490196, 1,
-0.1869291, 0.5533559, 0.2414078, 0, 1, 0.5568628, 1,
-0.1830724, 1.012197, 0.6574233, 0, 1, 0.5607843, 1,
-0.1810005, 0.9879309, -2.298818, 0, 1, 0.5686275, 1,
-0.1808584, -1.01853, -2.861528, 0, 1, 0.572549, 1,
-0.1768872, 0.828055, 0.1201599, 0, 1, 0.5803922, 1,
-0.173025, 0.2147108, -1.013155, 0, 1, 0.5843138, 1,
-0.1697706, 0.3651707, -0.9474722, 0, 1, 0.5921569, 1,
-0.1689308, 1.903587, 0.7144704, 0, 1, 0.5960785, 1,
-0.1668638, 0.6236041, -1.246778, 0, 1, 0.6039216, 1,
-0.165492, 0.08931606, -1.337391, 0, 1, 0.6117647, 1,
-0.1647521, -0.4981446, -3.535813, 0, 1, 0.6156863, 1,
-0.1628778, 2.169356, 0.3316907, 0, 1, 0.6235294, 1,
-0.1610857, -0.3985054, -3.944687, 0, 1, 0.627451, 1,
-0.159646, -0.9573575, -1.817479, 0, 1, 0.6352941, 1,
-0.1572175, 1.281276, -0.6420166, 0, 1, 0.6392157, 1,
-0.1565143, -0.3286748, -0.9936286, 0, 1, 0.6470588, 1,
-0.1513374, 1.591465, 0.2355918, 0, 1, 0.6509804, 1,
-0.1499976, -1.237952, -1.508768, 0, 1, 0.6588235, 1,
-0.1461426, -0.5329498, -3.835744, 0, 1, 0.6627451, 1,
-0.1448963, 0.2535791, 0.09405175, 0, 1, 0.6705883, 1,
-0.1419185, -0.6534834, -2.728053, 0, 1, 0.6745098, 1,
-0.1415412, -0.4637162, -3.628157, 0, 1, 0.682353, 1,
-0.1413679, -0.8334355, -2.148903, 0, 1, 0.6862745, 1,
-0.1411225, -1.444389, -4.960066, 0, 1, 0.6941177, 1,
-0.1405632, -0.5505841, -1.821198, 0, 1, 0.7019608, 1,
-0.1358654, 0.2708223, 0.1453256, 0, 1, 0.7058824, 1,
-0.1350447, 0.2276824, -1.626468, 0, 1, 0.7137255, 1,
-0.1326158, 0.05895939, -1.933473, 0, 1, 0.7176471, 1,
-0.1284749, -0.6129251, -4.896215, 0, 1, 0.7254902, 1,
-0.1283523, 0.7200978, 1.350126, 0, 1, 0.7294118, 1,
-0.1269829, -0.1873856, -3.180082, 0, 1, 0.7372549, 1,
-0.1251079, -0.165568, -1.496948, 0, 1, 0.7411765, 1,
-0.1243961, -0.3440386, -1.592641, 0, 1, 0.7490196, 1,
-0.1240091, -0.2186535, -1.502499, 0, 1, 0.7529412, 1,
-0.1236146, -0.1590391, -1.76361, 0, 1, 0.7607843, 1,
-0.1219809, -0.1821731, -3.1642, 0, 1, 0.7647059, 1,
-0.1204281, 0.6648923, 1.559268, 0, 1, 0.772549, 1,
-0.1197357, 1.314066, 0.7427402, 0, 1, 0.7764706, 1,
-0.1173752, -0.152058, -3.577893, 0, 1, 0.7843137, 1,
-0.1170365, 1.147623, 1.458109, 0, 1, 0.7882353, 1,
-0.1107572, 0.3753169, -0.772117, 0, 1, 0.7960784, 1,
-0.108498, -1.488962, -4.27636, 0, 1, 0.8039216, 1,
-0.1038493, -0.08471723, -1.736382, 0, 1, 0.8078431, 1,
-0.09996603, 0.7778117, 1.84043, 0, 1, 0.8156863, 1,
-0.09898115, 0.7072124, 0.214411, 0, 1, 0.8196079, 1,
-0.09518521, -1.276941, -2.860659, 0, 1, 0.827451, 1,
-0.09337673, 0.02555767, -0.2387427, 0, 1, 0.8313726, 1,
-0.08902858, -1.200826, -3.262484, 0, 1, 0.8392157, 1,
-0.0885659, 0.3820115, -0.4310462, 0, 1, 0.8431373, 1,
-0.08844271, -0.8838153, -3.423579, 0, 1, 0.8509804, 1,
-0.08767744, -0.4602575, -3.322812, 0, 1, 0.854902, 1,
-0.08269253, -0.7534316, -4.626605, 0, 1, 0.8627451, 1,
-0.08263335, -2.172618, -4.243443, 0, 1, 0.8666667, 1,
-0.08216298, -1.376095, -2.39536, 0, 1, 0.8745098, 1,
-0.08049555, -1.769165, -3.378096, 0, 1, 0.8784314, 1,
-0.07954337, 0.6445546, 0.0620335, 0, 1, 0.8862745, 1,
-0.07739959, -0.7619119, -5.233266, 0, 1, 0.8901961, 1,
-0.07526566, -0.3892888, -0.2282434, 0, 1, 0.8980392, 1,
-0.067944, 0.2564586, 0.1661, 0, 1, 0.9058824, 1,
-0.06614437, -0.6372883, -5.255367, 0, 1, 0.9098039, 1,
-0.06598114, -0.385415, -2.627134, 0, 1, 0.9176471, 1,
-0.05747926, 1.70164, 1.549411, 0, 1, 0.9215686, 1,
-0.05739653, 0.3326028, -0.7977602, 0, 1, 0.9294118, 1,
-0.05350042, 0.9293627, 1.058837, 0, 1, 0.9333333, 1,
-0.05154528, -1.508929, -2.143164, 0, 1, 0.9411765, 1,
-0.04687604, -1.370684, -2.465518, 0, 1, 0.945098, 1,
-0.04103194, -0.4034897, -3.065021, 0, 1, 0.9529412, 1,
-0.04055452, -1.018312, -2.552335, 0, 1, 0.9568627, 1,
-0.04041316, -0.8990502, -2.299318, 0, 1, 0.9647059, 1,
-0.0398212, 1.251547, -0.5615824, 0, 1, 0.9686275, 1,
-0.03975792, 0.8365766, -0.7081045, 0, 1, 0.9764706, 1,
-0.03864251, -2.854871, -2.77847, 0, 1, 0.9803922, 1,
-0.03739684, 1.006341, -0.2879278, 0, 1, 0.9882353, 1,
-0.03663637, -0.3796794, -3.045884, 0, 1, 0.9921569, 1,
-0.03293442, -0.1583826, -3.602214, 0, 1, 1, 1,
-0.0248556, 0.4771912, 0.06870158, 0, 0.9921569, 1, 1,
-0.02034828, -0.1781917, -1.523631, 0, 0.9882353, 1, 1,
-0.01742781, 0.1799013, 1.530547, 0, 0.9803922, 1, 1,
-0.00836926, -0.4667695, -2.561899, 0, 0.9764706, 1, 1,
-0.006117584, -0.974292, -3.443949, 0, 0.9686275, 1, 1,
-0.005574923, 0.08180387, -0.4261439, 0, 0.9647059, 1, 1,
-2.813969e-05, -0.4010452, -1.629862, 0, 0.9568627, 1, 1,
0.01670302, -0.7242805, 2.493577, 0, 0.9529412, 1, 1,
0.01830558, 1.452086, 0.5262176, 0, 0.945098, 1, 1,
0.01942342, -0.5385624, 3.680308, 0, 0.9411765, 1, 1,
0.02380049, -0.8325163, 4.244397, 0, 0.9333333, 1, 1,
0.02464923, -0.2905219, 3.678659, 0, 0.9294118, 1, 1,
0.02532616, -0.2562563, 2.460795, 0, 0.9215686, 1, 1,
0.03189771, 0.1578898, 1.07844, 0, 0.9176471, 1, 1,
0.03249804, -0.1582387, 3.846721, 0, 0.9098039, 1, 1,
0.0331519, 1.481274, 1.713821, 0, 0.9058824, 1, 1,
0.03820016, 1.928205, 0.4945093, 0, 0.8980392, 1, 1,
0.03915562, -0.2370265, 4.514218, 0, 0.8901961, 1, 1,
0.04325259, -0.7067196, 2.040725, 0, 0.8862745, 1, 1,
0.04410301, -0.2117596, 3.026283, 0, 0.8784314, 1, 1,
0.0443736, -0.7404521, 3.077609, 0, 0.8745098, 1, 1,
0.04521451, 1.339531, 1.993228, 0, 0.8666667, 1, 1,
0.04598039, 0.9159595, 2.280821, 0, 0.8627451, 1, 1,
0.04649108, 0.8651385, -0.5074487, 0, 0.854902, 1, 1,
0.04761245, 0.292031, 0.07353681, 0, 0.8509804, 1, 1,
0.0530962, -0.07479442, 1.221789, 0, 0.8431373, 1, 1,
0.05325891, -0.009907571, 2.310903, 0, 0.8392157, 1, 1,
0.05465174, -1.073961, 3.887599, 0, 0.8313726, 1, 1,
0.05863746, 0.7288601, 1.836534, 0, 0.827451, 1, 1,
0.05971294, -0.4109616, 1.37729, 0, 0.8196079, 1, 1,
0.06187069, -0.8595482, 2.68004, 0, 0.8156863, 1, 1,
0.06871421, -0.1626663, 2.885596, 0, 0.8078431, 1, 1,
0.07280037, -1.808646, 2.066915, 0, 0.8039216, 1, 1,
0.07410534, 0.3974377, 1.805086, 0, 0.7960784, 1, 1,
0.07911859, -0.566786, 2.008784, 0, 0.7882353, 1, 1,
0.08204678, -0.3970185, 2.569516, 0, 0.7843137, 1, 1,
0.08511598, -0.9762031, 4.390791, 0, 0.7764706, 1, 1,
0.09158278, 0.2563718, 1.444199, 0, 0.772549, 1, 1,
0.09706624, 0.2302996, 1.481421, 0, 0.7647059, 1, 1,
0.1003965, 0.02204749, 1.413942, 0, 0.7607843, 1, 1,
0.1055489, 0.805814, 0.1156337, 0, 0.7529412, 1, 1,
0.1084535, 1.322668, -0.2716126, 0, 0.7490196, 1, 1,
0.1096559, 0.9996532, 0.1556449, 0, 0.7411765, 1, 1,
0.1115878, -0.7447307, 2.872459, 0, 0.7372549, 1, 1,
0.1116389, -0.6274674, 3.215626, 0, 0.7294118, 1, 1,
0.1123158, 1.584916, -1.045251, 0, 0.7254902, 1, 1,
0.1179052, -0.1416268, 1.780141, 0, 0.7176471, 1, 1,
0.1244091, 1.449785, 0.3059654, 0, 0.7137255, 1, 1,
0.1259795, 0.5358587, -0.5773184, 0, 0.7058824, 1, 1,
0.1268843, 1.248224, -0.7219208, 0, 0.6980392, 1, 1,
0.1329405, 0.1498527, 0.7365928, 0, 0.6941177, 1, 1,
0.1444623, 0.4482767, 0.5778965, 0, 0.6862745, 1, 1,
0.144499, -0.4356775, 2.320881, 0, 0.682353, 1, 1,
0.1450793, 1.211074, 0.7437816, 0, 0.6745098, 1, 1,
0.1456262, -0.3298899, 3.392075, 0, 0.6705883, 1, 1,
0.1477187, 0.5555252, 0.5333554, 0, 0.6627451, 1, 1,
0.1482977, 1.630405, -1.104539, 0, 0.6588235, 1, 1,
0.1487743, -0.207497, 2.330743, 0, 0.6509804, 1, 1,
0.1526971, 0.07019374, 0.8127364, 0, 0.6470588, 1, 1,
0.1571657, -0.6549195, 1.332615, 0, 0.6392157, 1, 1,
0.1597513, -0.9188704, 3.073384, 0, 0.6352941, 1, 1,
0.1629663, -0.09035512, 2.407356, 0, 0.627451, 1, 1,
0.1646959, 1.20009, -0.1270918, 0, 0.6235294, 1, 1,
0.1661511, 0.2929237, 0.3023523, 0, 0.6156863, 1, 1,
0.1673075, 0.2616739, 2.124057, 0, 0.6117647, 1, 1,
0.1679512, 0.06692281, 2.726032, 0, 0.6039216, 1, 1,
0.1692174, -0.2865734, 2.765321, 0, 0.5960785, 1, 1,
0.1695142, 0.3278648, 0.04311852, 0, 0.5921569, 1, 1,
0.1739128, 0.3954155, -0.8567326, 0, 0.5843138, 1, 1,
0.1763497, 0.913573, 0.7055091, 0, 0.5803922, 1, 1,
0.1775618, -0.3845148, 1.185776, 0, 0.572549, 1, 1,
0.1788274, -0.5295153, 5.401637, 0, 0.5686275, 1, 1,
0.1804102, 0.511319, -1.05485, 0, 0.5607843, 1, 1,
0.1825687, 2.291717, 1.383144, 0, 0.5568628, 1, 1,
0.1855249, -1.33716, 3.193304, 0, 0.5490196, 1, 1,
0.1868596, 0.7626827, 0.5929688, 0, 0.5450981, 1, 1,
0.1901209, 2.336469, 0.05047676, 0, 0.5372549, 1, 1,
0.1916716, -0.8646383, 3.922306, 0, 0.5333334, 1, 1,
0.1916905, 1.746851, 0.6924014, 0, 0.5254902, 1, 1,
0.1920111, -0.6171223, 3.317132, 0, 0.5215687, 1, 1,
0.1926783, -0.09657307, 1.202808, 0, 0.5137255, 1, 1,
0.1944039, -2.881698, 3.780896, 0, 0.509804, 1, 1,
0.1975596, 2.826112, 0.5001161, 0, 0.5019608, 1, 1,
0.2015758, 1.297858, -0.5188918, 0, 0.4941176, 1, 1,
0.2017418, -0.020059, 2.239712, 0, 0.4901961, 1, 1,
0.2052426, 1.286466, 0.8165433, 0, 0.4823529, 1, 1,
0.2056743, -0.1464341, 1.47704, 0, 0.4784314, 1, 1,
0.2065553, 0.1974983, 1.044968, 0, 0.4705882, 1, 1,
0.2073745, 2.633638, -1.627193, 0, 0.4666667, 1, 1,
0.210754, -1.305895, 3.683009, 0, 0.4588235, 1, 1,
0.2111133, -1.17042, 2.641978, 0, 0.454902, 1, 1,
0.212406, -0.9189435, 0.8525764, 0, 0.4470588, 1, 1,
0.2189875, 0.06238375, 1.414334, 0, 0.4431373, 1, 1,
0.2226534, -0.2988652, 1.804083, 0, 0.4352941, 1, 1,
0.2236905, 0.4218604, -0.5020998, 0, 0.4313726, 1, 1,
0.2309402, 0.4746704, -1.427851, 0, 0.4235294, 1, 1,
0.235694, 1.330848, -0.705372, 0, 0.4196078, 1, 1,
0.2425484, 1.364843, -0.07601887, 0, 0.4117647, 1, 1,
0.2459046, 0.3000481, 0.09311041, 0, 0.4078431, 1, 1,
0.2487928, -0.07169618, 1.617021, 0, 0.4, 1, 1,
0.2561538, 2.432671, 0.5513836, 0, 0.3921569, 1, 1,
0.2575664, 0.2874119, 1.612828, 0, 0.3882353, 1, 1,
0.2635348, -0.1790938, 1.517202, 0, 0.3803922, 1, 1,
0.2666735, 0.03717291, 2.667617, 0, 0.3764706, 1, 1,
0.2689743, 0.7425082, -1.979949, 0, 0.3686275, 1, 1,
0.2718647, 0.7196178, 1.020045, 0, 0.3647059, 1, 1,
0.2752346, -0.2251855, 1.88955, 0, 0.3568628, 1, 1,
0.2756223, 3.318789, -1.98189, 0, 0.3529412, 1, 1,
0.2770996, 1.711904, -0.09142607, 0, 0.345098, 1, 1,
0.2772167, 1.263817, 1.515649, 0, 0.3411765, 1, 1,
0.2788378, -0.7577743, 3.960567, 0, 0.3333333, 1, 1,
0.2792409, -0.8385907, 3.605839, 0, 0.3294118, 1, 1,
0.2819999, 0.3118052, 2.457846, 0, 0.3215686, 1, 1,
0.2841946, -1.096623, 1.687686, 0, 0.3176471, 1, 1,
0.2861696, 0.7643172, 0.01938667, 0, 0.3098039, 1, 1,
0.2892021, 0.1677606, 3.160324, 0, 0.3058824, 1, 1,
0.2929448, 0.06541795, 2.875374, 0, 0.2980392, 1, 1,
0.2947096, -0.02509509, 1.235667, 0, 0.2901961, 1, 1,
0.2958965, 0.0009533848, 2.27918, 0, 0.2862745, 1, 1,
0.2967132, -1.515893, 2.172207, 0, 0.2784314, 1, 1,
0.3022008, 0.3968477, -0.1821703, 0, 0.2745098, 1, 1,
0.3084666, 0.6571127, 0.6457883, 0, 0.2666667, 1, 1,
0.3117943, -1.167626, 1.821367, 0, 0.2627451, 1, 1,
0.3118984, 0.5818196, -1.139839, 0, 0.254902, 1, 1,
0.321624, 1.194984, -0.8815831, 0, 0.2509804, 1, 1,
0.3227382, -0.4484496, 3.260813, 0, 0.2431373, 1, 1,
0.3227771, 0.5398647, 0.8353306, 0, 0.2392157, 1, 1,
0.3239206, -0.3239838, 2.020653, 0, 0.2313726, 1, 1,
0.3247121, -1.710224, 1.308379, 0, 0.227451, 1, 1,
0.3303474, -0.03269846, 1.624169, 0, 0.2196078, 1, 1,
0.3332044, -0.7182325, 3.67263, 0, 0.2156863, 1, 1,
0.3345789, -1.770834, 3.733098, 0, 0.2078431, 1, 1,
0.3385249, 0.6335212, 0.09350951, 0, 0.2039216, 1, 1,
0.3417487, -0.09570729, 1.430767, 0, 0.1960784, 1, 1,
0.3491164, -0.7953859, 2.893932, 0, 0.1882353, 1, 1,
0.3601353, 1.372985, -0.05947848, 0, 0.1843137, 1, 1,
0.3725492, -0.5007752, 1.922639, 0, 0.1764706, 1, 1,
0.3734651, -0.0893765, 1.369449, 0, 0.172549, 1, 1,
0.3740385, 0.1154838, 1.293978, 0, 0.1647059, 1, 1,
0.3748228, -1.80671, 2.301021, 0, 0.1607843, 1, 1,
0.3752399, -0.183754, 1.900373, 0, 0.1529412, 1, 1,
0.3772481, -1.155989, 2.834153, 0, 0.1490196, 1, 1,
0.3786628, -0.6297972, 1.974696, 0, 0.1411765, 1, 1,
0.3815804, -1.141478, 2.012602, 0, 0.1372549, 1, 1,
0.3816387, -1.126513, 2.692634, 0, 0.1294118, 1, 1,
0.3822775, -0.4072078, 1.741313, 0, 0.1254902, 1, 1,
0.3864818, -0.664212, 1.633665, 0, 0.1176471, 1, 1,
0.3887609, -0.4520268, 1.654034, 0, 0.1137255, 1, 1,
0.3901827, 2.282249, 0.9742177, 0, 0.1058824, 1, 1,
0.3910014, -0.4276994, 2.509175, 0, 0.09803922, 1, 1,
0.3918946, 2.377413, 0.2596423, 0, 0.09411765, 1, 1,
0.3954641, -0.3060722, 2.992473, 0, 0.08627451, 1, 1,
0.3993371, -0.9019381, 4.94342, 0, 0.08235294, 1, 1,
0.4140755, 3.322529, -1.846973, 0, 0.07450981, 1, 1,
0.4142703, -0.07988646, 2.027707, 0, 0.07058824, 1, 1,
0.4187692, -1.20205, 1.575521, 0, 0.0627451, 1, 1,
0.4208224, -0.5076255, 3.367476, 0, 0.05882353, 1, 1,
0.4221312, 0.903843, 0.03835134, 0, 0.05098039, 1, 1,
0.4236941, 2.052011, 0.8756649, 0, 0.04705882, 1, 1,
0.4261099, 0.204099, 2.160889, 0, 0.03921569, 1, 1,
0.4276951, -0.7312268, 2.638323, 0, 0.03529412, 1, 1,
0.4313409, -1.050968, 2.397306, 0, 0.02745098, 1, 1,
0.4389553, 1.413367, -1.157796, 0, 0.02352941, 1, 1,
0.4445269, -0.08370503, 1.833824, 0, 0.01568628, 1, 1,
0.4499084, -0.5493194, 3.376086, 0, 0.01176471, 1, 1,
0.4519919, -0.1478315, 1.114778, 0, 0.003921569, 1, 1,
0.4554072, 0.2619516, 2.02198, 0.003921569, 0, 1, 1,
0.4557881, 1.219539, 1.792154, 0.007843138, 0, 1, 1,
0.4565221, 1.477708, 0.5962874, 0.01568628, 0, 1, 1,
0.4570233, 0.7870821, 1.824004, 0.01960784, 0, 1, 1,
0.4626062, 1.339881, 1.384929, 0.02745098, 0, 1, 1,
0.4691073, 0.8822724, 1.033114, 0.03137255, 0, 1, 1,
0.4695701, 0.1840873, 0.6257682, 0.03921569, 0, 1, 1,
0.4697637, 0.1026417, 2.422959, 0.04313726, 0, 1, 1,
0.4704187, -0.7235364, 3.819974, 0.05098039, 0, 1, 1,
0.4791033, -0.9403552, 2.746961, 0.05490196, 0, 1, 1,
0.4801543, -0.9387835, 2.295774, 0.0627451, 0, 1, 1,
0.4826218, 2.544755, -0.4986344, 0.06666667, 0, 1, 1,
0.4849968, 0.6548119, -0.9532692, 0.07450981, 0, 1, 1,
0.4852512, -1.85369, 4.822931, 0.07843138, 0, 1, 1,
0.4913965, 0.2046932, -0.7451284, 0.08627451, 0, 1, 1,
0.4923506, -0.3243376, 2.866516, 0.09019608, 0, 1, 1,
0.4929553, -0.525487, 2.331303, 0.09803922, 0, 1, 1,
0.4968975, 0.9580805, -0.3476003, 0.1058824, 0, 1, 1,
0.4988414, -0.5335578, 3.103078, 0.1098039, 0, 1, 1,
0.5011333, -1.17668, 3.379411, 0.1176471, 0, 1, 1,
0.5034413, -0.4426012, 3.963067, 0.1215686, 0, 1, 1,
0.5100681, 0.8516755, -0.7371747, 0.1294118, 0, 1, 1,
0.5110407, -0.5631636, 2.917808, 0.1333333, 0, 1, 1,
0.5121402, -1.655575, 1.813229, 0.1411765, 0, 1, 1,
0.5167966, 0.179309, 1.271715, 0.145098, 0, 1, 1,
0.5193716, 0.134645, 1.657707, 0.1529412, 0, 1, 1,
0.5233806, 0.06804446, 1.760207, 0.1568628, 0, 1, 1,
0.5295776, -1.178964, 2.68865, 0.1647059, 0, 1, 1,
0.5337029, 1.641671, 0.6728114, 0.1686275, 0, 1, 1,
0.5338858, 0.1010496, 1.277606, 0.1764706, 0, 1, 1,
0.5342377, -1.032145, 2.432616, 0.1803922, 0, 1, 1,
0.5347002, -1.015893, 2.832193, 0.1882353, 0, 1, 1,
0.5362117, -0.09424756, 2.613229, 0.1921569, 0, 1, 1,
0.5370473, 0.6069303, -0.8912387, 0.2, 0, 1, 1,
0.5478442, -0.6795489, 1.382472, 0.2078431, 0, 1, 1,
0.5489683, 0.4908682, 0.15786, 0.2117647, 0, 1, 1,
0.5493299, 0.477447, 1.167826, 0.2196078, 0, 1, 1,
0.5509367, 1.182513, 1.153557, 0.2235294, 0, 1, 1,
0.5547318, -1.112149, 2.736438, 0.2313726, 0, 1, 1,
0.5558739, -0.5682784, 3.194966, 0.2352941, 0, 1, 1,
0.556766, 1.176068, 0.9084781, 0.2431373, 0, 1, 1,
0.5623291, 1.107013, 1.909705, 0.2470588, 0, 1, 1,
0.56415, 0.2500675, 0.5562634, 0.254902, 0, 1, 1,
0.5645841, 2.448853, 1.305491, 0.2588235, 0, 1, 1,
0.5646822, 0.4972102, -3.038286, 0.2666667, 0, 1, 1,
0.571978, -0.4016924, 2.12991, 0.2705882, 0, 1, 1,
0.5728398, -2.16464, 1.705124, 0.2784314, 0, 1, 1,
0.5760572, -1.597198, 3.302126, 0.282353, 0, 1, 1,
0.5792825, 0.4757895, 1.604397, 0.2901961, 0, 1, 1,
0.581601, 0.8256934, -0.2411479, 0.2941177, 0, 1, 1,
0.5816541, -0.7221931, 3.984497, 0.3019608, 0, 1, 1,
0.5833474, -0.7636591, 3.500397, 0.3098039, 0, 1, 1,
0.5851377, 0.930661, -0.1188874, 0.3137255, 0, 1, 1,
0.5892279, -0.01161414, 1.829561, 0.3215686, 0, 1, 1,
0.5897796, 1.190745, -0.2163934, 0.3254902, 0, 1, 1,
0.5917588, 1.318907, 1.592184, 0.3333333, 0, 1, 1,
0.6025497, 1.742844, 1.709647, 0.3372549, 0, 1, 1,
0.6125945, -1.28283, 0.2680096, 0.345098, 0, 1, 1,
0.6144549, -1.006932, 2.19443, 0.3490196, 0, 1, 1,
0.6286242, -0.8114297, 2.482242, 0.3568628, 0, 1, 1,
0.6296788, 0.1802742, 1.056569, 0.3607843, 0, 1, 1,
0.6314224, 0.9905781, 1.121556, 0.3686275, 0, 1, 1,
0.6325486, -0.04191094, 0.1663666, 0.372549, 0, 1, 1,
0.6413561, -0.2642416, 2.507035, 0.3803922, 0, 1, 1,
0.6430323, -0.4659266, 1.954377, 0.3843137, 0, 1, 1,
0.6440443, 1.060276, -0.02701398, 0.3921569, 0, 1, 1,
0.6481006, -0.1525902, 1.218212, 0.3960784, 0, 1, 1,
0.6508436, 0.9815282, -0.2393481, 0.4039216, 0, 1, 1,
0.6527271, -0.520268, 1.776315, 0.4117647, 0, 1, 1,
0.6570244, 0.4588457, 0.4677808, 0.4156863, 0, 1, 1,
0.6592727, 0.6995057, -1.089213, 0.4235294, 0, 1, 1,
0.6594096, -1.07668, 1.662484, 0.427451, 0, 1, 1,
0.6614333, -0.1498067, 1.561827, 0.4352941, 0, 1, 1,
0.6686402, -1.276385, 2.220277, 0.4392157, 0, 1, 1,
0.6710489, 1.097554, 2.33196, 0.4470588, 0, 1, 1,
0.6726679, 0.1193406, 1.578096, 0.4509804, 0, 1, 1,
0.6761013, 0.04826305, 1.29122, 0.4588235, 0, 1, 1,
0.6784657, 0.7792846, -0.6488954, 0.4627451, 0, 1, 1,
0.6843285, -1.166131, 1.861651, 0.4705882, 0, 1, 1,
0.6844806, 0.1805599, -0.7543615, 0.4745098, 0, 1, 1,
0.6849174, 1.263501, -0.03654721, 0.4823529, 0, 1, 1,
0.6857241, -1.16105, 4.327857, 0.4862745, 0, 1, 1,
0.6873379, 0.09981272, 3.021968, 0.4941176, 0, 1, 1,
0.6926234, -0.4928694, 3.141309, 0.5019608, 0, 1, 1,
0.6933265, 1.787608, 0.7009453, 0.5058824, 0, 1, 1,
0.6968182, 0.549473, 1.44134, 0.5137255, 0, 1, 1,
0.6986151, -0.2805237, 1.683734, 0.5176471, 0, 1, 1,
0.6987031, 3.034803, -0.06453726, 0.5254902, 0, 1, 1,
0.7026629, -1.472509, 2.956692, 0.5294118, 0, 1, 1,
0.7096943, 0.8078192, -1.091209, 0.5372549, 0, 1, 1,
0.7143016, -1.425473, 1.494075, 0.5411765, 0, 1, 1,
0.7157611, -0.5598841, 2.088552, 0.5490196, 0, 1, 1,
0.7169039, 0.3699192, 0.1759071, 0.5529412, 0, 1, 1,
0.7179985, 0.5861757, 0.1930825, 0.5607843, 0, 1, 1,
0.7260641, 0.6962438, 2.155674, 0.5647059, 0, 1, 1,
0.7308312, 2.4668, 0.07329138, 0.572549, 0, 1, 1,
0.7340509, -0.08917641, 1.063782, 0.5764706, 0, 1, 1,
0.7476779, 0.008880475, 0.7118814, 0.5843138, 0, 1, 1,
0.7482806, -0.3724788, 0.7995355, 0.5882353, 0, 1, 1,
0.7484134, -1.260154, 1.290449, 0.5960785, 0, 1, 1,
0.7523046, 0.7569739, 1.653952, 0.6039216, 0, 1, 1,
0.7534645, 1.156287, -0.2008719, 0.6078432, 0, 1, 1,
0.7550321, 0.2824857, 1.169929, 0.6156863, 0, 1, 1,
0.7593468, -1.819955, 5.458695, 0.6196079, 0, 1, 1,
0.7594391, 0.6437724, 0.6859497, 0.627451, 0, 1, 1,
0.7606458, -1.190947, 1.013232, 0.6313726, 0, 1, 1,
0.7678525, -0.1477767, 2.994689, 0.6392157, 0, 1, 1,
0.7688037, 1.278333, -0.03193608, 0.6431373, 0, 1, 1,
0.7803322, -1.830478, 1.221893, 0.6509804, 0, 1, 1,
0.7813959, 2.032722, 0.6177776, 0.654902, 0, 1, 1,
0.7818554, -0.5833099, 2.460241, 0.6627451, 0, 1, 1,
0.7837369, -0.9947879, 2.650047, 0.6666667, 0, 1, 1,
0.7922414, -0.1699917, 2.124555, 0.6745098, 0, 1, 1,
0.7949233, -0.4905688, 2.695897, 0.6784314, 0, 1, 1,
0.8021963, -0.4713432, 0.4125969, 0.6862745, 0, 1, 1,
0.805176, -0.1502923, 2.386916, 0.6901961, 0, 1, 1,
0.8068103, -0.3269246, 1.806155, 0.6980392, 0, 1, 1,
0.8071333, -0.3516178, 3.227986, 0.7058824, 0, 1, 1,
0.8081287, -0.8326912, 2.529971, 0.7098039, 0, 1, 1,
0.8117151, 0.1045246, 1.103157, 0.7176471, 0, 1, 1,
0.8147082, -0.7333353, 0.4703629, 0.7215686, 0, 1, 1,
0.8186665, -0.9992972, 1.964129, 0.7294118, 0, 1, 1,
0.8309857, -1.800961, 5.112025, 0.7333333, 0, 1, 1,
0.8314172, -3.229947, 3.055346, 0.7411765, 0, 1, 1,
0.8335837, -1.235725, 0.2753482, 0.7450981, 0, 1, 1,
0.8449727, 0.2465426, 2.954123, 0.7529412, 0, 1, 1,
0.8453332, 0.9310451, -0.4428395, 0.7568628, 0, 1, 1,
0.8472173, 2.106652, -0.5188419, 0.7647059, 0, 1, 1,
0.8620394, -0.867882, 2.006763, 0.7686275, 0, 1, 1,
0.8728842, 1.490077, -0.8122542, 0.7764706, 0, 1, 1,
0.8761734, 0.1464251, 2.300362, 0.7803922, 0, 1, 1,
0.8803677, -0.1957218, 0.1864234, 0.7882353, 0, 1, 1,
0.8805316, 0.4091706, 1.09016, 0.7921569, 0, 1, 1,
0.8836465, -0.9890088, 4.125319, 0.8, 0, 1, 1,
0.8908578, -0.4572045, 0.8966423, 0.8078431, 0, 1, 1,
0.8924232, -1.444461, 3.557594, 0.8117647, 0, 1, 1,
0.8925323, 1.115308, -0.1271477, 0.8196079, 0, 1, 1,
0.8986472, -0.5995436, -0.549574, 0.8235294, 0, 1, 1,
0.9003648, 0.6239064, 0.9437687, 0.8313726, 0, 1, 1,
0.9046063, -0.282475, 1.830969, 0.8352941, 0, 1, 1,
0.9057987, -0.5297209, 0.5252922, 0.8431373, 0, 1, 1,
0.9122046, -0.5808392, 0.9568403, 0.8470588, 0, 1, 1,
0.9177628, 0.877283, -0.8772351, 0.854902, 0, 1, 1,
0.9213336, -1.842153, 1.643179, 0.8588235, 0, 1, 1,
0.9260628, 0.4241346, 2.158955, 0.8666667, 0, 1, 1,
0.9299637, 0.8102614, 1.521736, 0.8705882, 0, 1, 1,
0.9364679, -0.7137805, 2.953542, 0.8784314, 0, 1, 1,
0.9436376, -0.5489505, 1.530298, 0.8823529, 0, 1, 1,
0.9470223, -0.8684281, 2.569272, 0.8901961, 0, 1, 1,
0.9500244, -1.435572, 1.665117, 0.8941177, 0, 1, 1,
0.9524704, -0.7278847, 3.73042, 0.9019608, 0, 1, 1,
0.9577853, -0.8711947, 2.368123, 0.9098039, 0, 1, 1,
0.9636451, -0.5211784, 3.62516, 0.9137255, 0, 1, 1,
0.9645208, 1.003437, 0.7593253, 0.9215686, 0, 1, 1,
0.9691167, -0.07485116, 0.5818344, 0.9254902, 0, 1, 1,
0.9692853, 0.7926321, 2.464213, 0.9333333, 0, 1, 1,
0.969295, 0.06686588, 0.6565678, 0.9372549, 0, 1, 1,
0.9732197, 0.4121364, 2.589928, 0.945098, 0, 1, 1,
0.9743171, -0.04374164, 1.975536, 0.9490196, 0, 1, 1,
0.9805304, 1.639212, 1.001501, 0.9568627, 0, 1, 1,
0.9883118, -0.6541481, 0.7610819, 0.9607843, 0, 1, 1,
0.9980443, -1.851295, 3.343692, 0.9686275, 0, 1, 1,
1.003426, 0.4577934, 1.058427, 0.972549, 0, 1, 1,
1.018646, 0.04395577, 1.757644, 0.9803922, 0, 1, 1,
1.021139, -0.7030579, 4.041135, 0.9843137, 0, 1, 1,
1.02754, -0.6293607, 2.550673, 0.9921569, 0, 1, 1,
1.028138, -0.8731241, 2.140548, 0.9960784, 0, 1, 1,
1.028689, -1.136075, 2.319897, 1, 0, 0.9960784, 1,
1.034011, 1.074792, 0.6052808, 1, 0, 0.9882353, 1,
1.041091, -1.871745, 1.516936, 1, 0, 0.9843137, 1,
1.042084, -0.206071, 1.687771, 1, 0, 0.9764706, 1,
1.044475, -1.440465, 3.474738, 1, 0, 0.972549, 1,
1.044689, -0.2456867, 0.09286417, 1, 0, 0.9647059, 1,
1.049917, 0.182474, 1.640738, 1, 0, 0.9607843, 1,
1.052331, 0.0339596, 2.556793, 1, 0, 0.9529412, 1,
1.057302, 0.2686841, -0.553158, 1, 0, 0.9490196, 1,
1.058473, -0.6331015, 2.959418, 1, 0, 0.9411765, 1,
1.062928, -0.06992484, 1.994749, 1, 0, 0.9372549, 1,
1.065156, -1.514815, 2.68813, 1, 0, 0.9294118, 1,
1.067573, -1.61069, 3.188386, 1, 0, 0.9254902, 1,
1.072254, 1.089049, -1.132866, 1, 0, 0.9176471, 1,
1.072771, -0.5862815, 2.790878, 1, 0, 0.9137255, 1,
1.076943, -1.88523, 3.760598, 1, 0, 0.9058824, 1,
1.077416, -0.6494431, 1.117501, 1, 0, 0.9019608, 1,
1.095592, 0.2242112, 2.041528, 1, 0, 0.8941177, 1,
1.103853, 1.036123, 0.628801, 1, 0, 0.8862745, 1,
1.107423, -0.1652704, 0.7595526, 1, 0, 0.8823529, 1,
1.123624, 0.377935, 0.833301, 1, 0, 0.8745098, 1,
1.126882, 0.7043491, 0.07728443, 1, 0, 0.8705882, 1,
1.130187, 0.3007169, 0.1791255, 1, 0, 0.8627451, 1,
1.131709, -0.0002834924, 2.389255, 1, 0, 0.8588235, 1,
1.137622, 0.8516828, 0.3543462, 1, 0, 0.8509804, 1,
1.139145, -0.9235181, 2.187048, 1, 0, 0.8470588, 1,
1.155486, -0.7837402, 1.364986, 1, 0, 0.8392157, 1,
1.155903, 1.819727, 0.000606386, 1, 0, 0.8352941, 1,
1.165075, 0.08011648, 1.018223, 1, 0, 0.827451, 1,
1.166048, 0.416279, 1.872008, 1, 0, 0.8235294, 1,
1.168621, -1.276303, 2.020816, 1, 0, 0.8156863, 1,
1.171373, -0.2273479, 0.8798822, 1, 0, 0.8117647, 1,
1.173791, 0.09230424, 0.7404523, 1, 0, 0.8039216, 1,
1.18268, -0.6759464, -0.3970552, 1, 0, 0.7960784, 1,
1.199054, 0.2815251, 1.174797, 1, 0, 0.7921569, 1,
1.202764, 0.5826862, 0.4861357, 1, 0, 0.7843137, 1,
1.207153, -1.026694, 2.726411, 1, 0, 0.7803922, 1,
1.217535, 0.6770869, 1.279806, 1, 0, 0.772549, 1,
1.2197, -1.463091, 1.86777, 1, 0, 0.7686275, 1,
1.220861, 0.3409245, 0.1034434, 1, 0, 0.7607843, 1,
1.221171, 0.8080228, 1.722404, 1, 0, 0.7568628, 1,
1.226784, 2.182763, 1.222463, 1, 0, 0.7490196, 1,
1.228091, 0.3217305, 1.810472, 1, 0, 0.7450981, 1,
1.229654, -0.8372209, 2.002154, 1, 0, 0.7372549, 1,
1.230169, 0.5744866, 1.818393, 1, 0, 0.7333333, 1,
1.238192, 0.7775913, 1.164401, 1, 0, 0.7254902, 1,
1.240594, -0.0977858, 1.404575, 1, 0, 0.7215686, 1,
1.245762, -0.7275778, 0.814812, 1, 0, 0.7137255, 1,
1.248509, -1.107621, 2.003936, 1, 0, 0.7098039, 1,
1.277959, 0.07440238, 0.9583839, 1, 0, 0.7019608, 1,
1.280746, -1.118936, 5.153796, 1, 0, 0.6941177, 1,
1.282677, -1.147249, 3.011287, 1, 0, 0.6901961, 1,
1.288685, -0.3066737, 2.391826, 1, 0, 0.682353, 1,
1.291418, -1.145658, 2.637481, 1, 0, 0.6784314, 1,
1.301593, 1.228174, 2.356353, 1, 0, 0.6705883, 1,
1.303146, 0.1951499, 3.142275, 1, 0, 0.6666667, 1,
1.303784, 2.033223, -0.2741721, 1, 0, 0.6588235, 1,
1.305686, 0.3837816, 2.665392, 1, 0, 0.654902, 1,
1.310586, -0.3856177, 2.388642, 1, 0, 0.6470588, 1,
1.316133, -1.606666, 3.140175, 1, 0, 0.6431373, 1,
1.319582, -1.409595, 1.177998, 1, 0, 0.6352941, 1,
1.326446, 0.9292799, 0.8247119, 1, 0, 0.6313726, 1,
1.326661, -0.07684384, 0.805176, 1, 0, 0.6235294, 1,
1.334099, -0.1679767, 1.740352, 1, 0, 0.6196079, 1,
1.338865, 3.369622, -1.609472, 1, 0, 0.6117647, 1,
1.339125, 1.700601, 1.451045, 1, 0, 0.6078432, 1,
1.341655, -1.405505, 1.264024, 1, 0, 0.6, 1,
1.342385, -0.291162, 0.02011192, 1, 0, 0.5921569, 1,
1.348889, -1.273885, 1.824246, 1, 0, 0.5882353, 1,
1.3492, -0.2343236, -1.034495, 1, 0, 0.5803922, 1,
1.349883, 1.867198, 0.5611378, 1, 0, 0.5764706, 1,
1.349975, 2.695643, 1.885792, 1, 0, 0.5686275, 1,
1.352421, 1.973582, 0.1224854, 1, 0, 0.5647059, 1,
1.364832, 0.5442687, 2.620762, 1, 0, 0.5568628, 1,
1.371536, -0.2098434, 3.606003, 1, 0, 0.5529412, 1,
1.373575, -0.2541899, 4.666728, 1, 0, 0.5450981, 1,
1.374148, 0.401163, 1.714392, 1, 0, 0.5411765, 1,
1.3803, 0.4663988, 1.683648, 1, 0, 0.5333334, 1,
1.380407, -0.1973692, 3.688067, 1, 0, 0.5294118, 1,
1.383376, -0.7004283, 1.911775, 1, 0, 0.5215687, 1,
1.385031, 0.4099024, 2.236665, 1, 0, 0.5176471, 1,
1.390884, -0.2615708, 2.829492, 1, 0, 0.509804, 1,
1.39472, 0.4294751, 1.075578, 1, 0, 0.5058824, 1,
1.397298, 1.124171, 2.350815, 1, 0, 0.4980392, 1,
1.397557, 1.951515, 0.7751844, 1, 0, 0.4901961, 1,
1.408547, 1.083062, 0.9742467, 1, 0, 0.4862745, 1,
1.426867, -0.1343928, 2.205942, 1, 0, 0.4784314, 1,
1.435784, 0.662687, 1.316271, 1, 0, 0.4745098, 1,
1.445236, 1.298768, 0.913635, 1, 0, 0.4666667, 1,
1.453753, 0.415204, 0.1231524, 1, 0, 0.4627451, 1,
1.45693, -0.7166061, 1.906784, 1, 0, 0.454902, 1,
1.478782, -0.07514866, 0.2771066, 1, 0, 0.4509804, 1,
1.483039, 0.1484793, 2.725735, 1, 0, 0.4431373, 1,
1.485582, -0.3197101, 1.598943, 1, 0, 0.4392157, 1,
1.496271, -0.5389729, 3.520696, 1, 0, 0.4313726, 1,
1.507026, 1.955412, -0.1188662, 1, 0, 0.427451, 1,
1.510313, 0.9209918, -1.400304, 1, 0, 0.4196078, 1,
1.511756, -0.5264971, 0.4521809, 1, 0, 0.4156863, 1,
1.517004, 1.30258, 1.257824, 1, 0, 0.4078431, 1,
1.518992, -0.927627, 2.093707, 1, 0, 0.4039216, 1,
1.538134, -1.09166, 1.646679, 1, 0, 0.3960784, 1,
1.544732, 1.744946, 1.034474, 1, 0, 0.3882353, 1,
1.553991, 0.6739272, 0.3436466, 1, 0, 0.3843137, 1,
1.554378, 0.8429667, 0.9239522, 1, 0, 0.3764706, 1,
1.560082, 0.3878639, 0.8752245, 1, 0, 0.372549, 1,
1.578827, -0.07130144, 0.1453301, 1, 0, 0.3647059, 1,
1.583015, -2.221029, 2.581028, 1, 0, 0.3607843, 1,
1.596693, -2.031847, 2.573166, 1, 0, 0.3529412, 1,
1.622568, -1.228257, 1.410803, 1, 0, 0.3490196, 1,
1.62724, -1.465813, 0.5291691, 1, 0, 0.3411765, 1,
1.640105, -0.1899321, 2.648328, 1, 0, 0.3372549, 1,
1.640345, 0.9047936, 0.6095009, 1, 0, 0.3294118, 1,
1.64876, 0.07575452, 0.9808629, 1, 0, 0.3254902, 1,
1.649984, 0.3939338, 1.142015, 1, 0, 0.3176471, 1,
1.65414, 1.407776, 0.5399199, 1, 0, 0.3137255, 1,
1.671747, 0.4408408, 0.2235705, 1, 0, 0.3058824, 1,
1.674378, -0.1766729, 0.6331692, 1, 0, 0.2980392, 1,
1.67653, 0.8914067, -0.03891837, 1, 0, 0.2941177, 1,
1.682188, -1.226584, 1.14046, 1, 0, 0.2862745, 1,
1.684167, -3.022913, 4.080915, 1, 0, 0.282353, 1,
1.689166, 0.2454861, 2.738939, 1, 0, 0.2745098, 1,
1.689694, 1.309828, 1.216977, 1, 0, 0.2705882, 1,
1.712079, -0.9698003, 5.018125, 1, 0, 0.2627451, 1,
1.766267, 0.7415686, 1.046605, 1, 0, 0.2588235, 1,
1.767683, -2.228794, 2.240052, 1, 0, 0.2509804, 1,
1.776261, 0.1480053, 2.494601, 1, 0, 0.2470588, 1,
1.778111, 0.3022221, 1.548272, 1, 0, 0.2392157, 1,
1.77937, 0.9829959, 1.320268, 1, 0, 0.2352941, 1,
1.787752, 0.02648162, 1.063004, 1, 0, 0.227451, 1,
1.789352, -0.1035107, 2.0111, 1, 0, 0.2235294, 1,
1.796538, 0.5804269, 0.6123559, 1, 0, 0.2156863, 1,
1.798615, -0.5066537, 1.050057, 1, 0, 0.2117647, 1,
1.803519, -0.7434798, 2.432423, 1, 0, 0.2039216, 1,
1.815125, -0.4804733, 1.634543, 1, 0, 0.1960784, 1,
1.819358, 2.256346, 0.03444092, 1, 0, 0.1921569, 1,
1.842997, -0.01145258, 1.762946, 1, 0, 0.1843137, 1,
1.868735, -0.783796, 2.324721, 1, 0, 0.1803922, 1,
1.902437, -1.129958, 0.7317413, 1, 0, 0.172549, 1,
1.902893, -0.5454851, 1.494364, 1, 0, 0.1686275, 1,
1.925488, 0.09148254, 2.630842, 1, 0, 0.1607843, 1,
1.944731, -0.3869041, 3.143502, 1, 0, 0.1568628, 1,
1.951742, -0.1580732, 2.125869, 1, 0, 0.1490196, 1,
1.970313, -0.3104604, 0.9779378, 1, 0, 0.145098, 1,
1.978706, 0.5845227, -0.1334148, 1, 0, 0.1372549, 1,
2.014871, 1.826779, 3.156859, 1, 0, 0.1333333, 1,
2.058506, 0.4106822, -0.2108883, 1, 0, 0.1254902, 1,
2.06043, -0.8483438, 2.149699, 1, 0, 0.1215686, 1,
2.077031, 0.9193538, 0.02116474, 1, 0, 0.1137255, 1,
2.083797, 0.5877894, 2.106934, 1, 0, 0.1098039, 1,
2.090309, -1.207385, 2.615997, 1, 0, 0.1019608, 1,
2.098731, 0.7433536, 1.446863, 1, 0, 0.09411765, 1,
2.20816, 0.6063237, 1.906963, 1, 0, 0.09019608, 1,
2.238025, 1.376583, 0.2974027, 1, 0, 0.08235294, 1,
2.298171, -0.6806167, 2.384439, 1, 0, 0.07843138, 1,
2.315806, 0.8603776, 1.692707, 1, 0, 0.07058824, 1,
2.350561, 0.6535211, 2.155476, 1, 0, 0.06666667, 1,
2.351105, -1.339959, 4.142241, 1, 0, 0.05882353, 1,
2.370508, -0.4844884, 2.125286, 1, 0, 0.05490196, 1,
2.422091, -1.474637, 3.668061, 1, 0, 0.04705882, 1,
2.44552, 0.2863493, 2.156745, 1, 0, 0.04313726, 1,
2.484514, -0.3633811, 3.260985, 1, 0, 0.03529412, 1,
2.588468, 0.6545033, 0.3652462, 1, 0, 0.03137255, 1,
2.636458, 0.2781158, -0.7081432, 1, 0, 0.02352941, 1,
2.704967, -0.6798133, 0.09906673, 1, 0, 0.01960784, 1,
3.056921, -2.943677, 3.39194, 1, 0, 0.01176471, 1,
3.069786, 1.566287, 1.205859, 1, 0, 0.007843138, 1
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
-0.2545102, -4.402385, -7.071401, 0, -0.5, 0.5, 0.5,
-0.2545102, -4.402385, -7.071401, 1, -0.5, 0.5, 0.5,
-0.2545102, -4.402385, -7.071401, 1, 1.5, 0.5, 0.5,
-0.2545102, -4.402385, -7.071401, 0, 1.5, 0.5, 0.5
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
-4.705742, 0.2285744, -7.071401, 0, -0.5, 0.5, 0.5,
-4.705742, 0.2285744, -7.071401, 1, -0.5, 0.5, 0.5,
-4.705742, 0.2285744, -7.071401, 1, 1.5, 0.5, 0.5,
-4.705742, 0.2285744, -7.071401, 0, 1.5, 0.5, 0.5
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
-4.705742, -4.402385, 0.1016638, 0, -0.5, 0.5, 0.5,
-4.705742, -4.402385, 0.1016638, 1, -0.5, 0.5, 0.5,
-4.705742, -4.402385, 0.1016638, 1, 1.5, 0.5, 0.5,
-4.705742, -4.402385, 0.1016638, 0, 1.5, 0.5, 0.5
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
-3, -3.333702, -5.416078,
3, -3.333702, -5.416078,
-3, -3.333702, -5.416078,
-3, -3.511816, -5.691965,
-2, -3.333702, -5.416078,
-2, -3.511816, -5.691965,
-1, -3.333702, -5.416078,
-1, -3.511816, -5.691965,
0, -3.333702, -5.416078,
0, -3.511816, -5.691965,
1, -3.333702, -5.416078,
1, -3.511816, -5.691965,
2, -3.333702, -5.416078,
2, -3.511816, -5.691965,
3, -3.333702, -5.416078,
3, -3.511816, -5.691965
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
-3, -3.868044, -6.24374, 0, -0.5, 0.5, 0.5,
-3, -3.868044, -6.24374, 1, -0.5, 0.5, 0.5,
-3, -3.868044, -6.24374, 1, 1.5, 0.5, 0.5,
-3, -3.868044, -6.24374, 0, 1.5, 0.5, 0.5,
-2, -3.868044, -6.24374, 0, -0.5, 0.5, 0.5,
-2, -3.868044, -6.24374, 1, -0.5, 0.5, 0.5,
-2, -3.868044, -6.24374, 1, 1.5, 0.5, 0.5,
-2, -3.868044, -6.24374, 0, 1.5, 0.5, 0.5,
-1, -3.868044, -6.24374, 0, -0.5, 0.5, 0.5,
-1, -3.868044, -6.24374, 1, -0.5, 0.5, 0.5,
-1, -3.868044, -6.24374, 1, 1.5, 0.5, 0.5,
-1, -3.868044, -6.24374, 0, 1.5, 0.5, 0.5,
0, -3.868044, -6.24374, 0, -0.5, 0.5, 0.5,
0, -3.868044, -6.24374, 1, -0.5, 0.5, 0.5,
0, -3.868044, -6.24374, 1, 1.5, 0.5, 0.5,
0, -3.868044, -6.24374, 0, 1.5, 0.5, 0.5,
1, -3.868044, -6.24374, 0, -0.5, 0.5, 0.5,
1, -3.868044, -6.24374, 1, -0.5, 0.5, 0.5,
1, -3.868044, -6.24374, 1, 1.5, 0.5, 0.5,
1, -3.868044, -6.24374, 0, 1.5, 0.5, 0.5,
2, -3.868044, -6.24374, 0, -0.5, 0.5, 0.5,
2, -3.868044, -6.24374, 1, -0.5, 0.5, 0.5,
2, -3.868044, -6.24374, 1, 1.5, 0.5, 0.5,
2, -3.868044, -6.24374, 0, 1.5, 0.5, 0.5,
3, -3.868044, -6.24374, 0, -0.5, 0.5, 0.5,
3, -3.868044, -6.24374, 1, -0.5, 0.5, 0.5,
3, -3.868044, -6.24374, 1, 1.5, 0.5, 0.5,
3, -3.868044, -6.24374, 0, 1.5, 0.5, 0.5
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
-3.678535, -3, -5.416078,
-3.678535, 3, -5.416078,
-3.678535, -3, -5.416078,
-3.849736, -3, -5.691965,
-3.678535, -2, -5.416078,
-3.849736, -2, -5.691965,
-3.678535, -1, -5.416078,
-3.849736, -1, -5.691965,
-3.678535, 0, -5.416078,
-3.849736, 0, -5.691965,
-3.678535, 1, -5.416078,
-3.849736, 1, -5.691965,
-3.678535, 2, -5.416078,
-3.849736, 2, -5.691965,
-3.678535, 3, -5.416078,
-3.849736, 3, -5.691965
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
-4.192139, -3, -6.24374, 0, -0.5, 0.5, 0.5,
-4.192139, -3, -6.24374, 1, -0.5, 0.5, 0.5,
-4.192139, -3, -6.24374, 1, 1.5, 0.5, 0.5,
-4.192139, -3, -6.24374, 0, 1.5, 0.5, 0.5,
-4.192139, -2, -6.24374, 0, -0.5, 0.5, 0.5,
-4.192139, -2, -6.24374, 1, -0.5, 0.5, 0.5,
-4.192139, -2, -6.24374, 1, 1.5, 0.5, 0.5,
-4.192139, -2, -6.24374, 0, 1.5, 0.5, 0.5,
-4.192139, -1, -6.24374, 0, -0.5, 0.5, 0.5,
-4.192139, -1, -6.24374, 1, -0.5, 0.5, 0.5,
-4.192139, -1, -6.24374, 1, 1.5, 0.5, 0.5,
-4.192139, -1, -6.24374, 0, 1.5, 0.5, 0.5,
-4.192139, 0, -6.24374, 0, -0.5, 0.5, 0.5,
-4.192139, 0, -6.24374, 1, -0.5, 0.5, 0.5,
-4.192139, 0, -6.24374, 1, 1.5, 0.5, 0.5,
-4.192139, 0, -6.24374, 0, 1.5, 0.5, 0.5,
-4.192139, 1, -6.24374, 0, -0.5, 0.5, 0.5,
-4.192139, 1, -6.24374, 1, -0.5, 0.5, 0.5,
-4.192139, 1, -6.24374, 1, 1.5, 0.5, 0.5,
-4.192139, 1, -6.24374, 0, 1.5, 0.5, 0.5,
-4.192139, 2, -6.24374, 0, -0.5, 0.5, 0.5,
-4.192139, 2, -6.24374, 1, -0.5, 0.5, 0.5,
-4.192139, 2, -6.24374, 1, 1.5, 0.5, 0.5,
-4.192139, 2, -6.24374, 0, 1.5, 0.5, 0.5,
-4.192139, 3, -6.24374, 0, -0.5, 0.5, 0.5,
-4.192139, 3, -6.24374, 1, -0.5, 0.5, 0.5,
-4.192139, 3, -6.24374, 1, 1.5, 0.5, 0.5,
-4.192139, 3, -6.24374, 0, 1.5, 0.5, 0.5
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
-3.678535, -3.333702, -4,
-3.678535, -3.333702, 4,
-3.678535, -3.333702, -4,
-3.849736, -3.511816, -4,
-3.678535, -3.333702, -2,
-3.849736, -3.511816, -2,
-3.678535, -3.333702, 0,
-3.849736, -3.511816, 0,
-3.678535, -3.333702, 2,
-3.849736, -3.511816, 2,
-3.678535, -3.333702, 4,
-3.849736, -3.511816, 4
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
-4.192139, -3.868044, -4, 0, -0.5, 0.5, 0.5,
-4.192139, -3.868044, -4, 1, -0.5, 0.5, 0.5,
-4.192139, -3.868044, -4, 1, 1.5, 0.5, 0.5,
-4.192139, -3.868044, -4, 0, 1.5, 0.5, 0.5,
-4.192139, -3.868044, -2, 0, -0.5, 0.5, 0.5,
-4.192139, -3.868044, -2, 1, -0.5, 0.5, 0.5,
-4.192139, -3.868044, -2, 1, 1.5, 0.5, 0.5,
-4.192139, -3.868044, -2, 0, 1.5, 0.5, 0.5,
-4.192139, -3.868044, 0, 0, -0.5, 0.5, 0.5,
-4.192139, -3.868044, 0, 1, -0.5, 0.5, 0.5,
-4.192139, -3.868044, 0, 1, 1.5, 0.5, 0.5,
-4.192139, -3.868044, 0, 0, 1.5, 0.5, 0.5,
-4.192139, -3.868044, 2, 0, -0.5, 0.5, 0.5,
-4.192139, -3.868044, 2, 1, -0.5, 0.5, 0.5,
-4.192139, -3.868044, 2, 1, 1.5, 0.5, 0.5,
-4.192139, -3.868044, 2, 0, 1.5, 0.5, 0.5,
-4.192139, -3.868044, 4, 0, -0.5, 0.5, 0.5,
-4.192139, -3.868044, 4, 1, -0.5, 0.5, 0.5,
-4.192139, -3.868044, 4, 1, 1.5, 0.5, 0.5,
-4.192139, -3.868044, 4, 0, 1.5, 0.5, 0.5
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
-3.678535, -3.333702, -5.416078,
-3.678535, 3.790851, -5.416078,
-3.678535, -3.333702, 5.619406,
-3.678535, 3.790851, 5.619406,
-3.678535, -3.333702, -5.416078,
-3.678535, -3.333702, 5.619406,
-3.678535, 3.790851, -5.416078,
-3.678535, 3.790851, 5.619406,
-3.678535, -3.333702, -5.416078,
3.169515, -3.333702, -5.416078,
-3.678535, -3.333702, 5.619406,
3.169515, -3.333702, 5.619406,
-3.678535, 3.790851, -5.416078,
3.169515, 3.790851, -5.416078,
-3.678535, 3.790851, 5.619406,
3.169515, 3.790851, 5.619406,
3.169515, -3.333702, -5.416078,
3.169515, 3.790851, -5.416078,
3.169515, -3.333702, 5.619406,
3.169515, 3.790851, 5.619406,
3.169515, -3.333702, -5.416078,
3.169515, -3.333702, 5.619406,
3.169515, 3.790851, -5.416078,
3.169515, 3.790851, 5.619406
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
var radius = 7.91007;
var distance = 35.1928;
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
mvMatrix.translate( 0.2545102, -0.2285744, -0.1016638 );
mvMatrix.scale( 1.248899, 1.200429, 0.7750021 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.1928);
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
ethametsulfuron-meth<-read.table("ethametsulfuron-meth.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-ethametsulfuron-meth$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethametsulfuron' not found
```

```r
y<-ethametsulfuron-meth$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethametsulfuron' not found
```

```r
z<-ethametsulfuron-meth$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethametsulfuron' not found
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
-3.578806, -1.271116, -1.234958, 0, 0, 1, 1, 1,
-2.85588, -0.9614803, -2.08584, 1, 0, 0, 1, 1,
-2.714072, 1.918276, -1.030511, 1, 0, 0, 1, 1,
-2.654376, -0.6373571, -2.323719, 1, 0, 0, 1, 1,
-2.528143, -0.06029451, -1.528693, 1, 0, 0, 1, 1,
-2.446076, -0.1955959, -2.184139, 1, 0, 0, 1, 1,
-2.411455, 0.9297377, -2.002108, 0, 0, 0, 1, 1,
-2.382351, -0.9360985, -1.43292, 0, 0, 0, 1, 1,
-2.374997, 0.7903867, -1.45412, 0, 0, 0, 1, 1,
-2.364161, -1.34139, -1.776322, 0, 0, 0, 1, 1,
-2.34216, -1.471709, -1.165099, 0, 0, 0, 1, 1,
-2.276771, -1.943056, -0.5147806, 0, 0, 0, 1, 1,
-2.200664, 0.1576056, -2.494931, 0, 0, 0, 1, 1,
-2.1851, 0.855379, -0.05596045, 1, 1, 1, 1, 1,
-2.114371, 0.5202298, -2.093322, 1, 1, 1, 1, 1,
-2.097019, -0.03695538, -1.980299, 1, 1, 1, 1, 1,
-2.076764, 0.1426203, -3.37531, 1, 1, 1, 1, 1,
-2.066089, 0.7547086, -2.944933, 1, 1, 1, 1, 1,
-2.041962, 1.3437, -1.25343, 1, 1, 1, 1, 1,
-2.030499, 0.1428043, -3.18834, 1, 1, 1, 1, 1,
-2.005247, 0.537487, -1.480268, 1, 1, 1, 1, 1,
-1.9915, -0.02695174, -0.9856114, 1, 1, 1, 1, 1,
-1.958563, -0.7574291, -1.034504, 1, 1, 1, 1, 1,
-1.952955, 0.5305697, 0.3099456, 1, 1, 1, 1, 1,
-1.939747, 1.655774, 0.2858282, 1, 1, 1, 1, 1,
-1.925147, -0.76717, -1.608637, 1, 1, 1, 1, 1,
-1.921141, -1.820819, -3.47301, 1, 1, 1, 1, 1,
-1.920676, -2.321656, -2.511309, 1, 1, 1, 1, 1,
-1.894055, -1.160978, -3.315907, 0, 0, 1, 1, 1,
-1.890298, -0.1169712, -0.8696919, 1, 0, 0, 1, 1,
-1.8842, 1.120928, -1.322099, 1, 0, 0, 1, 1,
-1.874933, -0.5099172, -3.032061, 1, 0, 0, 1, 1,
-1.865615, -0.09117313, -1.290663, 1, 0, 0, 1, 1,
-1.857442, 1.197479, -0.3952191, 1, 0, 0, 1, 1,
-1.840942, 0.5283707, -1.459791, 0, 0, 0, 1, 1,
-1.837854, -1.304068, -2.883935, 0, 0, 0, 1, 1,
-1.835158, -0.911064, -2.568737, 0, 0, 0, 1, 1,
-1.8327, 1.96424, -1.075361, 0, 0, 0, 1, 1,
-1.82233, 1.332637, -0.9499405, 0, 0, 0, 1, 1,
-1.821771, -1.721213, -2.315645, 0, 0, 0, 1, 1,
-1.812232, -0.1985554, -3.391801, 0, 0, 0, 1, 1,
-1.806203, 0.7057098, -0.9610505, 1, 1, 1, 1, 1,
-1.787127, 0.06122977, -1.29372, 1, 1, 1, 1, 1,
-1.785299, -0.1666662, -0.2556178, 1, 1, 1, 1, 1,
-1.781817, -0.5451316, -0.09553616, 1, 1, 1, 1, 1,
-1.74133, 0.3536362, -2.846627, 1, 1, 1, 1, 1,
-1.700632, -1.445665, -1.396317, 1, 1, 1, 1, 1,
-1.674779, -0.277761, -0.358383, 1, 1, 1, 1, 1,
-1.669256, -0.3570306, -3.012314, 1, 1, 1, 1, 1,
-1.651788, -0.02181908, -2.772121, 1, 1, 1, 1, 1,
-1.638429, 0.9978558, -1.318329, 1, 1, 1, 1, 1,
-1.638288, -0.5750002, -1.397861, 1, 1, 1, 1, 1,
-1.636242, -2.005916, -2.915403, 1, 1, 1, 1, 1,
-1.633624, -1.021283, -3.430975, 1, 1, 1, 1, 1,
-1.616498, -0.2111102, -1.708041, 1, 1, 1, 1, 1,
-1.609683, -1.175578, -3.422825, 1, 1, 1, 1, 1,
-1.602208, -0.9967556, -3.520652, 0, 0, 1, 1, 1,
-1.601559, -1.016197, -0.8009401, 1, 0, 0, 1, 1,
-1.598573, 1.804718, -0.5911232, 1, 0, 0, 1, 1,
-1.58929, 1.00147, -2.693328, 1, 0, 0, 1, 1,
-1.589103, -0.6173566, -1.275013, 1, 0, 0, 1, 1,
-1.581896, 0.2005171, -1.936448, 1, 0, 0, 1, 1,
-1.578191, 0.4682508, -1.981591, 0, 0, 0, 1, 1,
-1.571388, -0.1382221, -0.3962568, 0, 0, 0, 1, 1,
-1.570881, -1.137442, -1.950645, 0, 0, 0, 1, 1,
-1.567363, 1.259497, -1.291591, 0, 0, 0, 1, 1,
-1.557598, 1.488302, -0.610893, 0, 0, 0, 1, 1,
-1.552806, -0.6598976, -2.527403, 0, 0, 0, 1, 1,
-1.545026, 0.6204471, -1.256248, 0, 0, 0, 1, 1,
-1.516191, -1.190406, -2.330531, 1, 1, 1, 1, 1,
-1.51515, 0.8999661, -2.079064, 1, 1, 1, 1, 1,
-1.514889, -0.6674072, -2.551281, 1, 1, 1, 1, 1,
-1.508881, 0.05980478, -0.5847521, 1, 1, 1, 1, 1,
-1.507866, 0.5710981, -1.69686, 1, 1, 1, 1, 1,
-1.500387, 0.1792439, -0.9205489, 1, 1, 1, 1, 1,
-1.497199, 0.5078797, 0.1998252, 1, 1, 1, 1, 1,
-1.494133, 0.340652, -2.409027, 1, 1, 1, 1, 1,
-1.492033, 0.06069934, -1.936009, 1, 1, 1, 1, 1,
-1.485454, 0.3232983, -0.3553137, 1, 1, 1, 1, 1,
-1.484787, -0.3788458, -1.855996, 1, 1, 1, 1, 1,
-1.484585, -0.286375, -2.523917, 1, 1, 1, 1, 1,
-1.47643, 0.4377309, -0.08351303, 1, 1, 1, 1, 1,
-1.474609, -1.104235, -3.179483, 1, 1, 1, 1, 1,
-1.468353, -0.9388353, -2.518466, 1, 1, 1, 1, 1,
-1.468084, 1.31136, 0.5095506, 0, 0, 1, 1, 1,
-1.466843, 0.7381029, -1.257729, 1, 0, 0, 1, 1,
-1.460815, 0.3632439, -2.822038, 1, 0, 0, 1, 1,
-1.451806, -0.2038079, -1.748336, 1, 0, 0, 1, 1,
-1.427258, 0.4227941, -2.235206, 1, 0, 0, 1, 1,
-1.425613, -0.326474, -0.9639787, 1, 0, 0, 1, 1,
-1.419327, -0.6672323, -0.9288263, 0, 0, 0, 1, 1,
-1.41602, 0.1987663, -1.351316, 0, 0, 0, 1, 1,
-1.409663, 0.4275143, -1.59367, 0, 0, 0, 1, 1,
-1.397613, 0.9857442, -0.429081, 0, 0, 0, 1, 1,
-1.384532, -0.08043499, -1.586122, 0, 0, 0, 1, 1,
-1.375055, 0.3830408, -0.209949, 0, 0, 0, 1, 1,
-1.373593, 1.30953, 0.736378, 0, 0, 0, 1, 1,
-1.363284, 0.6582381, 0.191955, 1, 1, 1, 1, 1,
-1.354468, -2.732001, -3.145392, 1, 1, 1, 1, 1,
-1.349429, 3.004424, -1.699045, 1, 1, 1, 1, 1,
-1.348231, -1.143212, -0.5752596, 1, 1, 1, 1, 1,
-1.347344, 0.458005, -3.255797, 1, 1, 1, 1, 1,
-1.341635, 0.7440319, -2.155275, 1, 1, 1, 1, 1,
-1.341414, -0.1366116, -3.496005, 1, 1, 1, 1, 1,
-1.329037, -0.1307037, -0.8323489, 1, 1, 1, 1, 1,
-1.310688, -0.5672059, -2.323064, 1, 1, 1, 1, 1,
-1.308701, -0.8959736, -1.286476, 1, 1, 1, 1, 1,
-1.30798, -0.05532761, -1.173518, 1, 1, 1, 1, 1,
-1.307877, 0.528846, 0.9030838, 1, 1, 1, 1, 1,
-1.303279, -0.1957678, -4.000729, 1, 1, 1, 1, 1,
-1.295588, -0.3078014, -1.160021, 1, 1, 1, 1, 1,
-1.289516, -0.9872404, -1.778511, 1, 1, 1, 1, 1,
-1.277295, 0.1914006, -1.82501, 0, 0, 1, 1, 1,
-1.274767, -1.351391, -0.7954593, 1, 0, 0, 1, 1,
-1.261886, 1.251316, -0.3293428, 1, 0, 0, 1, 1,
-1.257635, 3.055556, 0.09240236, 1, 0, 0, 1, 1,
-1.255034, 1.158074, -0.547619, 1, 0, 0, 1, 1,
-1.251512, 1.271058, -2.224084, 1, 0, 0, 1, 1,
-1.250034, 1.346703, -1.016032, 0, 0, 0, 1, 1,
-1.245922, -0.4339075, -0.5438391, 0, 0, 0, 1, 1,
-1.2333, -1.043273, -3.23976, 0, 0, 0, 1, 1,
-1.230213, 0.119974, -1.90348, 0, 0, 0, 1, 1,
-1.229514, 1.036507, -0.2897579, 0, 0, 0, 1, 1,
-1.216862, -0.5624488, -0.9608613, 0, 0, 0, 1, 1,
-1.214071, 0.8802902, -2.762791, 0, 0, 0, 1, 1,
-1.209424, -1.057812, -1.225688, 1, 1, 1, 1, 1,
-1.20613, 0.1751388, -0.2601786, 1, 1, 1, 1, 1,
-1.200859, -0.5910876, -1.555755, 1, 1, 1, 1, 1,
-1.197661, 0.1160618, -1.469542, 1, 1, 1, 1, 1,
-1.197035, 0.6195353, -1.054835, 1, 1, 1, 1, 1,
-1.196532, -0.2354651, -2.436912, 1, 1, 1, 1, 1,
-1.195754, -1.270249, -2.464919, 1, 1, 1, 1, 1,
-1.193453, 0.5961679, -2.612203, 1, 1, 1, 1, 1,
-1.173981, -0.1629945, -2.887799, 1, 1, 1, 1, 1,
-1.166703, -1.026984, -3.295179, 1, 1, 1, 1, 1,
-1.162746, -0.8389852, -1.555599, 1, 1, 1, 1, 1,
-1.161245, -1.431575, -3.690941, 1, 1, 1, 1, 1,
-1.150922, 1.38364, -0.5642101, 1, 1, 1, 1, 1,
-1.148878, 0.1996235, -0.6371617, 1, 1, 1, 1, 1,
-1.14803, -0.2548891, -3.313499, 1, 1, 1, 1, 1,
-1.146844, -0.4580111, -1.613818, 0, 0, 1, 1, 1,
-1.14253, -1.235016, -4.566872, 1, 0, 0, 1, 1,
-1.139687, -0.2022784, -1.732654, 1, 0, 0, 1, 1,
-1.136799, 0.570758, -1.981804, 1, 0, 0, 1, 1,
-1.135011, -0.6204816, -2.301666, 1, 0, 0, 1, 1,
-1.122618, -2.384808, -4.477984, 1, 0, 0, 1, 1,
-1.117968, -1.574087, -1.204192, 0, 0, 0, 1, 1,
-1.105209, 0.8668019, -1.307564, 0, 0, 0, 1, 1,
-1.105152, -0.2829208, -2.199581, 0, 0, 0, 1, 1,
-1.091376, 1.508249, 1.439856, 0, 0, 0, 1, 1,
-1.090422, -0.1793254, -2.427919, 0, 0, 0, 1, 1,
-1.084882, -1.030326, -3.303649, 0, 0, 0, 1, 1,
-1.084387, -0.7185004, -2.424151, 0, 0, 0, 1, 1,
-1.082293, -0.7803432, -1.481765, 1, 1, 1, 1, 1,
-1.074533, 0.5907127, -1.482301, 1, 1, 1, 1, 1,
-1.07389, 0.1662643, -1.336859, 1, 1, 1, 1, 1,
-1.072002, 0.3552292, -0.5279356, 1, 1, 1, 1, 1,
-1.069085, 0.6715124, -0.06187382, 1, 1, 1, 1, 1,
-1.067919, -0.402692, -3.033116, 1, 1, 1, 1, 1,
-1.066225, 0.08340019, -1.191871, 1, 1, 1, 1, 1,
-1.061152, 1.613817, -2.394588, 1, 1, 1, 1, 1,
-1.059268, -0.08116698, -3.072552, 1, 1, 1, 1, 1,
-1.043933, -0.2230918, -1.728406, 1, 1, 1, 1, 1,
-1.042746, -1.122854, -0.549228, 1, 1, 1, 1, 1,
-1.040395, 1.013777, -1.435127, 1, 1, 1, 1, 1,
-1.034557, 1.24362, -1.567041, 1, 1, 1, 1, 1,
-1.033566, -0.9484573, -3.210161, 1, 1, 1, 1, 1,
-1.032731, 0.02644385, -1.561464, 1, 1, 1, 1, 1,
-1.032223, 0.2021754, -0.8308017, 0, 0, 1, 1, 1,
-1.029876, 0.6755551, -0.02802147, 1, 0, 0, 1, 1,
-1.009263, 0.1316997, -1.204393, 1, 0, 0, 1, 1,
-1.009143, -0.6998809, -0.8583811, 1, 0, 0, 1, 1,
-1.00424, 1.587885, -0.3352617, 1, 0, 0, 1, 1,
-1.001411, 0.486735, 0.7647033, 1, 0, 0, 1, 1,
-1.000849, -0.8502665, -1.932138, 0, 0, 0, 1, 1,
-0.9982453, -1.69888, -1.29953, 0, 0, 0, 1, 1,
-0.9951417, -0.2916039, -0.02570844, 0, 0, 0, 1, 1,
-0.9922329, -0.0721589, -0.9169737, 0, 0, 0, 1, 1,
-0.9873992, -0.5805161, -0.5764361, 0, 0, 0, 1, 1,
-0.9751692, -0.6802185, -1.272195, 0, 0, 0, 1, 1,
-0.9743367, 3.687095, -0.4895624, 0, 0, 0, 1, 1,
-0.9739752, -1.30891, -1.971481, 1, 1, 1, 1, 1,
-0.9727072, -1.004769, -2.647273, 1, 1, 1, 1, 1,
-0.9683371, 0.06990319, -1.027247, 1, 1, 1, 1, 1,
-0.9661067, 1.045816, -0.1426029, 1, 1, 1, 1, 1,
-0.9644719, -1.044655, -3.779214, 1, 1, 1, 1, 1,
-0.9586064, 0.2911841, -1.272926, 1, 1, 1, 1, 1,
-0.9507482, -1.594893, -0.8325748, 1, 1, 1, 1, 1,
-0.9500318, -0.6642685, -2.998434, 1, 1, 1, 1, 1,
-0.9420865, 0.470538, -2.137099, 1, 1, 1, 1, 1,
-0.9339092, 0.3850959, -1.218944, 1, 1, 1, 1, 1,
-0.9326906, -1.628455, -2.926477, 1, 1, 1, 1, 1,
-0.9312525, -1.262116, -2.421618, 1, 1, 1, 1, 1,
-0.9302907, 0.02345341, -1.992165, 1, 1, 1, 1, 1,
-0.9284983, 1.686592, -1.267259, 1, 1, 1, 1, 1,
-0.9251308, -0.18533, -2.444136, 1, 1, 1, 1, 1,
-0.9251161, 0.7561778, -1.298785, 0, 0, 1, 1, 1,
-0.9221346, 0.2041969, -2.506331, 1, 0, 0, 1, 1,
-0.9213687, 0.1306637, -0.02793158, 1, 0, 0, 1, 1,
-0.9175287, 1.0799, -0.4291081, 1, 0, 0, 1, 1,
-0.9096891, 0.3999141, -0.4312658, 1, 0, 0, 1, 1,
-0.9078914, 0.1961915, -0.9018801, 1, 0, 0, 1, 1,
-0.9033424, 0.6049685, 0.2504477, 0, 0, 0, 1, 1,
-0.9012273, 0.07680194, -1.314646, 0, 0, 0, 1, 1,
-0.900017, 0.5193217, 0.9244934, 0, 0, 0, 1, 1,
-0.8966051, -0.4741629, -1.493052, 0, 0, 0, 1, 1,
-0.8926423, 1.99205, -0.5241076, 0, 0, 0, 1, 1,
-0.8889603, 0.04522543, -1.131769, 0, 0, 0, 1, 1,
-0.8871295, -1.537701, -2.547727, 0, 0, 0, 1, 1,
-0.8796631, -0.06753033, -1.951123, 1, 1, 1, 1, 1,
-0.8761303, -0.4124601, -1.565627, 1, 1, 1, 1, 1,
-0.8716383, 0.1259956, -1.502693, 1, 1, 1, 1, 1,
-0.870213, -0.991664, -1.426108, 1, 1, 1, 1, 1,
-0.8691592, 0.05688203, -2.058438, 1, 1, 1, 1, 1,
-0.8687047, -0.04567687, -0.6575552, 1, 1, 1, 1, 1,
-0.8629162, 1.96985, -0.5387496, 1, 1, 1, 1, 1,
-0.8583501, -0.6033614, -2.657599, 1, 1, 1, 1, 1,
-0.8580832, -0.5389526, -1.246908, 1, 1, 1, 1, 1,
-0.8569316, -0.9260154, -2.536688, 1, 1, 1, 1, 1,
-0.851806, 0.6103377, -0.958073, 1, 1, 1, 1, 1,
-0.8354258, -1.583972, -2.428309, 1, 1, 1, 1, 1,
-0.8304353, 0.7106232, 1.021408, 1, 1, 1, 1, 1,
-0.8270684, 0.9240027, -1.963802, 1, 1, 1, 1, 1,
-0.8203022, -0.8596375, -3.838222, 1, 1, 1, 1, 1,
-0.8149708, 0.2059536, -2.298874, 0, 0, 1, 1, 1,
-0.8131881, 0.6167981, -0.9295294, 1, 0, 0, 1, 1,
-0.8108597, -0.7987975, -3.147761, 1, 0, 0, 1, 1,
-0.8062034, -1.218739, -3.305311, 1, 0, 0, 1, 1,
-0.8054101, 1.572892, -1.560148, 1, 0, 0, 1, 1,
-0.8018589, -0.5537872, -3.001932, 1, 0, 0, 1, 1,
-0.7990408, -0.07274178, -0.7024304, 0, 0, 0, 1, 1,
-0.7984556, -1.398549, -1.960626, 0, 0, 0, 1, 1,
-0.7972239, -1.646049, -3.599479, 0, 0, 0, 1, 1,
-0.7940333, -0.3716843, -1.9464, 0, 0, 0, 1, 1,
-0.7937236, 1.491905, -1.533952, 0, 0, 0, 1, 1,
-0.7929011, 1.562216, 1.211562, 0, 0, 0, 1, 1,
-0.7891732, 0.08359107, -1.569379, 0, 0, 0, 1, 1,
-0.7874074, 1.31351, 1.423781, 1, 1, 1, 1, 1,
-0.7868543, -0.530829, -0.9307188, 1, 1, 1, 1, 1,
-0.7822242, -0.4804925, -2.598321, 1, 1, 1, 1, 1,
-0.7785759, -0.7937252, -3.085003, 1, 1, 1, 1, 1,
-0.7734736, -0.8896157, -3.706641, 1, 1, 1, 1, 1,
-0.7683772, -1.294016, -1.867716, 1, 1, 1, 1, 1,
-0.7645995, -0.4272075, -0.8358068, 1, 1, 1, 1, 1,
-0.7641291, 1.457724, 0.4948541, 1, 1, 1, 1, 1,
-0.7638112, 0.4322018, -1.899304, 1, 1, 1, 1, 1,
-0.7629807, -0.7182784, -2.644273, 1, 1, 1, 1, 1,
-0.7562957, 0.07372989, -1.082151, 1, 1, 1, 1, 1,
-0.7484099, 0.07871677, -1.105476, 1, 1, 1, 1, 1,
-0.7453894, -0.1910667, -1.876688, 1, 1, 1, 1, 1,
-0.7370595, 0.8452105, -2.220786, 1, 1, 1, 1, 1,
-0.7356645, 0.6306705, -0.3411919, 1, 1, 1, 1, 1,
-0.7333262, -0.5615466, -1.300618, 0, 0, 1, 1, 1,
-0.7280112, 0.7961785, -0.1003488, 1, 0, 0, 1, 1,
-0.7273449, 0.348784, -1.353594, 1, 0, 0, 1, 1,
-0.7234133, 0.1190867, -1.236267, 1, 0, 0, 1, 1,
-0.7204968, -1.040919, -2.195167, 1, 0, 0, 1, 1,
-0.7186953, -1.386159, -2.178817, 1, 0, 0, 1, 1,
-0.7185968, -0.45313, -2.855167, 0, 0, 0, 1, 1,
-0.7165169, 0.4824866, -1.819556, 0, 0, 0, 1, 1,
-0.7084156, -0.3063596, -1.618147, 0, 0, 0, 1, 1,
-0.7061607, -0.1789139, -2.018436, 0, 0, 0, 1, 1,
-0.7049671, 0.0977837, -1.920425, 0, 0, 0, 1, 1,
-0.7027401, 0.1973388, 0.3482651, 0, 0, 0, 1, 1,
-0.7022505, -1.336922, -1.529694, 0, 0, 0, 1, 1,
-0.6926609, -0.6008472, -3.014186, 1, 1, 1, 1, 1,
-0.6926206, -0.5594122, -3.577609, 1, 1, 1, 1, 1,
-0.686998, -0.5930332, -1.304123, 1, 1, 1, 1, 1,
-0.6814471, -0.04921486, -2.753626, 1, 1, 1, 1, 1,
-0.674738, 0.9548987, -1.323313, 1, 1, 1, 1, 1,
-0.6733196, -0.7265415, -1.819872, 1, 1, 1, 1, 1,
-0.669776, 0.09345723, -0.304897, 1, 1, 1, 1, 1,
-0.6660547, -0.1047056, -1.709843, 1, 1, 1, 1, 1,
-0.6648808, 0.03953194, -3.121985, 1, 1, 1, 1, 1,
-0.6618825, 0.01954138, -0.6933796, 1, 1, 1, 1, 1,
-0.6560932, 0.04881601, -0.5364331, 1, 1, 1, 1, 1,
-0.653648, -0.3483499, -1.415053, 1, 1, 1, 1, 1,
-0.646341, 0.824253, 0.487736, 1, 1, 1, 1, 1,
-0.6431141, -0.5848443, -3.161468, 1, 1, 1, 1, 1,
-0.6430825, 0.2120275, -0.8904749, 1, 1, 1, 1, 1,
-0.6398826, -0.4226474, -3.765078, 0, 0, 1, 1, 1,
-0.6376368, -1.051237, -2.462757, 1, 0, 0, 1, 1,
-0.6373525, 1.131713, 0.2966532, 1, 0, 0, 1, 1,
-0.6363171, 0.1208405, -2.897069, 1, 0, 0, 1, 1,
-0.6338789, -0.4581526, -1.12565, 1, 0, 0, 1, 1,
-0.6262122, 0.9144115, 0.2046083, 1, 0, 0, 1, 1,
-0.621958, -0.7843567, -1.739976, 0, 0, 0, 1, 1,
-0.6214224, -1.188546, -2.841763, 0, 0, 0, 1, 1,
-0.61862, -0.9256835, -1.468895, 0, 0, 0, 1, 1,
-0.6152471, 0.2791426, -0.7531368, 0, 0, 0, 1, 1,
-0.6099486, -0.5183512, -2.581837, 0, 0, 0, 1, 1,
-0.6001536, -0.2857594, -1.494931, 0, 0, 0, 1, 1,
-0.596357, -1.208102, -2.61932, 0, 0, 0, 1, 1,
-0.5950955, -1.951183, -3.419071, 1, 1, 1, 1, 1,
-0.5933428, 0.3964059, -3.148497, 1, 1, 1, 1, 1,
-0.5865494, 0.4207661, 0.6263638, 1, 1, 1, 1, 1,
-0.5862789, -0.4512598, -1.595157, 1, 1, 1, 1, 1,
-0.5818347, -1.621539, -2.163584, 1, 1, 1, 1, 1,
-0.5782598, 0.1784277, -1.329577, 1, 1, 1, 1, 1,
-0.5777337, 2.452699, 1.5935, 1, 1, 1, 1, 1,
-0.5753033, 1.418065, -0.4947038, 1, 1, 1, 1, 1,
-0.5720651, 0.0174747, -0.8485984, 1, 1, 1, 1, 1,
-0.5701736, -0.4902705, -4.580517, 1, 1, 1, 1, 1,
-0.5696478, -1.188492, -3.127717, 1, 1, 1, 1, 1,
-0.5694962, 0.959939, -0.5301648, 1, 1, 1, 1, 1,
-0.5677674, -0.1054021, -1.017388, 1, 1, 1, 1, 1,
-0.5669711, 0.7926642, -1.318455, 1, 1, 1, 1, 1,
-0.5651684, -0.5738254, -3.024909, 1, 1, 1, 1, 1,
-0.5592192, -0.4113018, -1.423295, 0, 0, 1, 1, 1,
-0.5575764, 0.6670817, -1.016929, 1, 0, 0, 1, 1,
-0.5559875, 0.5701079, -2.14483, 1, 0, 0, 1, 1,
-0.5545307, 0.7041701, -0.8362697, 1, 0, 0, 1, 1,
-0.5540441, 1.276012, -1.599303, 1, 0, 0, 1, 1,
-0.5537586, 1.501462, -0.5953943, 1, 0, 0, 1, 1,
-0.5406581, -0.4505419, -1.855717, 0, 0, 0, 1, 1,
-0.5399383, -0.564387, -0.5524288, 0, 0, 0, 1, 1,
-0.5339403, 0.4459508, -1.978225, 0, 0, 0, 1, 1,
-0.5290104, -0.9001226, -2.761299, 0, 0, 0, 1, 1,
-0.5258011, 0.7952738, -0.7755138, 0, 0, 0, 1, 1,
-0.5231493, -1.557157, -3.907725, 0, 0, 0, 1, 1,
-0.5008798, -0.3114332, -1.421348, 0, 0, 0, 1, 1,
-0.4982475, -0.9683701, -1.652633, 1, 1, 1, 1, 1,
-0.4926932, -1.005935, -1.536817, 1, 1, 1, 1, 1,
-0.491065, 0.7378255, -1.429748, 1, 1, 1, 1, 1,
-0.4885222, 1.228315, -2.078504, 1, 1, 1, 1, 1,
-0.4824151, 0.4822264, 0.5873801, 1, 1, 1, 1, 1,
-0.4786403, -0.680508, -1.908478, 1, 1, 1, 1, 1,
-0.4780423, -0.501179, -1.056725, 1, 1, 1, 1, 1,
-0.4768701, 1.240867, 0.6555495, 1, 1, 1, 1, 1,
-0.4729906, 0.4020583, -0.6743201, 1, 1, 1, 1, 1,
-0.4715099, -0.3184791, -1.932701, 1, 1, 1, 1, 1,
-0.4672374, -0.4997138, -2.443553, 1, 1, 1, 1, 1,
-0.4643173, -1.298806, -2.272851, 1, 1, 1, 1, 1,
-0.4634895, 0.5517154, -0.7730814, 1, 1, 1, 1, 1,
-0.4616852, -1.635367, -2.974656, 1, 1, 1, 1, 1,
-0.4614424, -0.973463, -4.561692, 1, 1, 1, 1, 1,
-0.4607728, 0.09034467, -1.382273, 0, 0, 1, 1, 1,
-0.4572658, 0.6965304, -1.350878, 1, 0, 0, 1, 1,
-0.4566706, 0.2503376, -1.77361, 1, 0, 0, 1, 1,
-0.4563749, -0.4824634, -0.8457146, 1, 0, 0, 1, 1,
-0.4544571, -0.6727637, -2.916743, 1, 0, 0, 1, 1,
-0.4527267, -1.791499, -3.579499, 1, 0, 0, 1, 1,
-0.4515147, -0.2994754, -1.284028, 0, 0, 0, 1, 1,
-0.4458959, 1.496331, -0.4179294, 0, 0, 0, 1, 1,
-0.4430266, 0.9805374, 0.06487528, 0, 0, 0, 1, 1,
-0.4426813, 0.03772124, -2.053925, 0, 0, 0, 1, 1,
-0.437039, 0.4058077, -1.648054, 0, 0, 0, 1, 1,
-0.4349459, 1.763948, 0.2664866, 0, 0, 0, 1, 1,
-0.43177, 0.4719415, -3.6408, 0, 0, 0, 1, 1,
-0.4303034, -0.3445646, -2.323321, 1, 1, 1, 1, 1,
-0.4282402, 0.459889, -0.07348004, 1, 1, 1, 1, 1,
-0.4222472, 0.5282892, -1.122932, 1, 1, 1, 1, 1,
-0.4182245, 0.5641855, -1.446743, 1, 1, 1, 1, 1,
-0.4174658, 1.778257, 1.345123, 1, 1, 1, 1, 1,
-0.4137066, 0.6027555, -1.478628, 1, 1, 1, 1, 1,
-0.4102728, -0.7656727, -1.737066, 1, 1, 1, 1, 1,
-0.4076485, 0.4160673, -1.161512, 1, 1, 1, 1, 1,
-0.4075875, -1.424102, -4.046045, 1, 1, 1, 1, 1,
-0.4028617, -1.582753, -2.938866, 1, 1, 1, 1, 1,
-0.4004795, 0.8366777, 0.104461, 1, 1, 1, 1, 1,
-0.3958189, -0.5709993, -2.969016, 1, 1, 1, 1, 1,
-0.3943019, 0.7990339, -0.6875729, 1, 1, 1, 1, 1,
-0.3919133, -0.2706371, -3.320523, 1, 1, 1, 1, 1,
-0.3896834, -1.149827, -2.715888, 1, 1, 1, 1, 1,
-0.3886421, -0.8542064, -1.301711, 0, 0, 1, 1, 1,
-0.3876151, -0.7194287, -2.435505, 1, 0, 0, 1, 1,
-0.3866911, -0.5072252, -2.884309, 1, 0, 0, 1, 1,
-0.3857489, 1.872694, -2.318202, 1, 0, 0, 1, 1,
-0.3833478, -0.5996343, -2.062322, 1, 0, 0, 1, 1,
-0.379076, 1.883437, -0.04260022, 1, 0, 0, 1, 1,
-0.3739156, -0.5472369, -3.836356, 0, 0, 0, 1, 1,
-0.3696084, 0.1927358, -1.711016, 0, 0, 0, 1, 1,
-0.3606201, 0.1217627, -2.919063, 0, 0, 0, 1, 1,
-0.3552426, -0.2234354, -1.281275, 0, 0, 0, 1, 1,
-0.3538028, -1.113255, -2.222675, 0, 0, 0, 1, 1,
-0.3478796, 0.04101542, -2.616016, 0, 0, 0, 1, 1,
-0.3405462, 0.005754624, -1.175054, 0, 0, 0, 1, 1,
-0.336833, -0.3610834, -2.39342, 1, 1, 1, 1, 1,
-0.3344495, -0.02353438, -0.9263894, 1, 1, 1, 1, 1,
-0.3289781, 0.7929611, -2.521083, 1, 1, 1, 1, 1,
-0.328564, 0.4394566, -1.8783, 1, 1, 1, 1, 1,
-0.3274863, -1.020714, -2.033353, 1, 1, 1, 1, 1,
-0.3269171, 0.9841919, 1.225013, 1, 1, 1, 1, 1,
-0.3231573, 0.260708, -0.3930296, 1, 1, 1, 1, 1,
-0.3193293, 1.266337, 1.463366, 1, 1, 1, 1, 1,
-0.3171361, 0.8988112, 0.291966, 1, 1, 1, 1, 1,
-0.3161643, -0.07675538, -0.9315515, 1, 1, 1, 1, 1,
-0.3147557, -1.345109, -2.574607, 1, 1, 1, 1, 1,
-0.3133557, 0.1929805, 0.2313495, 1, 1, 1, 1, 1,
-0.3109399, -0.5601941, -1.984003, 1, 1, 1, 1, 1,
-0.3016022, -0.6369352, -1.952286, 1, 1, 1, 1, 1,
-0.3009456, 1.527337, 0.4371202, 1, 1, 1, 1, 1,
-0.2947062, 1.501113, -1.022917, 0, 0, 1, 1, 1,
-0.2928049, -1.319328, -2.730874, 1, 0, 0, 1, 1,
-0.2927541, -1.257346, -4.288803, 1, 0, 0, 1, 1,
-0.2882815, 0.003291917, -0.8300671, 1, 0, 0, 1, 1,
-0.283545, -0.08052328, -1.069993, 1, 0, 0, 1, 1,
-0.2789236, -0.9255807, -2.820558, 1, 0, 0, 1, 1,
-0.278565, 0.296985, -1.511069, 0, 0, 0, 1, 1,
-0.2766539, -1.748554, -3.35865, 0, 0, 0, 1, 1,
-0.2745613, 0.7907595, 0.468769, 0, 0, 0, 1, 1,
-0.2719646, 1.855749, -2.53122, 0, 0, 0, 1, 1,
-0.258556, -1.782687, -2.908322, 0, 0, 0, 1, 1,
-0.2560055, 0.01988092, -1.982341, 0, 0, 0, 1, 1,
-0.2530392, -1.233766, -2.074383, 0, 0, 0, 1, 1,
-0.2517285, -0.3272437, -1.245937, 1, 1, 1, 1, 1,
-0.2507678, 1.480282, -0.3303253, 1, 1, 1, 1, 1,
-0.2506473, -1.067294, -2.822902, 1, 1, 1, 1, 1,
-0.2481035, 0.01288972, -3.238522, 1, 1, 1, 1, 1,
-0.2412698, -2.066226, -3.108562, 1, 1, 1, 1, 1,
-0.2410672, -0.9450077, -3.508605, 1, 1, 1, 1, 1,
-0.2398968, 0.9367976, -0.07276158, 1, 1, 1, 1, 1,
-0.2397955, -0.4810193, -3.058644, 1, 1, 1, 1, 1,
-0.2392412, 0.4463636, -0.006403245, 1, 1, 1, 1, 1,
-0.2334669, -0.6535578, -2.14353, 1, 1, 1, 1, 1,
-0.2289188, 1.119712, -0.9337429, 1, 1, 1, 1, 1,
-0.2269154, 0.2186101, -0.8257964, 1, 1, 1, 1, 1,
-0.2251154, 1.66761, -0.559466, 1, 1, 1, 1, 1,
-0.2243028, -1.478679, -4.782657, 1, 1, 1, 1, 1,
-0.2215079, -0.1893566, -1.945599, 1, 1, 1, 1, 1,
-0.2155274, -0.3254329, -2.344807, 0, 0, 1, 1, 1,
-0.2028923, 0.5084813, 0.5233291, 1, 0, 0, 1, 1,
-0.1978957, 1.717413, -0.7600155, 1, 0, 0, 1, 1,
-0.1960587, 1.031352, -0.2344443, 1, 0, 0, 1, 1,
-0.1924876, -0.6705924, -2.792059, 1, 0, 0, 1, 1,
-0.1881979, 0.9191031, 0.08599012, 1, 0, 0, 1, 1,
-0.1869291, 0.5533559, 0.2414078, 0, 0, 0, 1, 1,
-0.1830724, 1.012197, 0.6574233, 0, 0, 0, 1, 1,
-0.1810005, 0.9879309, -2.298818, 0, 0, 0, 1, 1,
-0.1808584, -1.01853, -2.861528, 0, 0, 0, 1, 1,
-0.1768872, 0.828055, 0.1201599, 0, 0, 0, 1, 1,
-0.173025, 0.2147108, -1.013155, 0, 0, 0, 1, 1,
-0.1697706, 0.3651707, -0.9474722, 0, 0, 0, 1, 1,
-0.1689308, 1.903587, 0.7144704, 1, 1, 1, 1, 1,
-0.1668638, 0.6236041, -1.246778, 1, 1, 1, 1, 1,
-0.165492, 0.08931606, -1.337391, 1, 1, 1, 1, 1,
-0.1647521, -0.4981446, -3.535813, 1, 1, 1, 1, 1,
-0.1628778, 2.169356, 0.3316907, 1, 1, 1, 1, 1,
-0.1610857, -0.3985054, -3.944687, 1, 1, 1, 1, 1,
-0.159646, -0.9573575, -1.817479, 1, 1, 1, 1, 1,
-0.1572175, 1.281276, -0.6420166, 1, 1, 1, 1, 1,
-0.1565143, -0.3286748, -0.9936286, 1, 1, 1, 1, 1,
-0.1513374, 1.591465, 0.2355918, 1, 1, 1, 1, 1,
-0.1499976, -1.237952, -1.508768, 1, 1, 1, 1, 1,
-0.1461426, -0.5329498, -3.835744, 1, 1, 1, 1, 1,
-0.1448963, 0.2535791, 0.09405175, 1, 1, 1, 1, 1,
-0.1419185, -0.6534834, -2.728053, 1, 1, 1, 1, 1,
-0.1415412, -0.4637162, -3.628157, 1, 1, 1, 1, 1,
-0.1413679, -0.8334355, -2.148903, 0, 0, 1, 1, 1,
-0.1411225, -1.444389, -4.960066, 1, 0, 0, 1, 1,
-0.1405632, -0.5505841, -1.821198, 1, 0, 0, 1, 1,
-0.1358654, 0.2708223, 0.1453256, 1, 0, 0, 1, 1,
-0.1350447, 0.2276824, -1.626468, 1, 0, 0, 1, 1,
-0.1326158, 0.05895939, -1.933473, 1, 0, 0, 1, 1,
-0.1284749, -0.6129251, -4.896215, 0, 0, 0, 1, 1,
-0.1283523, 0.7200978, 1.350126, 0, 0, 0, 1, 1,
-0.1269829, -0.1873856, -3.180082, 0, 0, 0, 1, 1,
-0.1251079, -0.165568, -1.496948, 0, 0, 0, 1, 1,
-0.1243961, -0.3440386, -1.592641, 0, 0, 0, 1, 1,
-0.1240091, -0.2186535, -1.502499, 0, 0, 0, 1, 1,
-0.1236146, -0.1590391, -1.76361, 0, 0, 0, 1, 1,
-0.1219809, -0.1821731, -3.1642, 1, 1, 1, 1, 1,
-0.1204281, 0.6648923, 1.559268, 1, 1, 1, 1, 1,
-0.1197357, 1.314066, 0.7427402, 1, 1, 1, 1, 1,
-0.1173752, -0.152058, -3.577893, 1, 1, 1, 1, 1,
-0.1170365, 1.147623, 1.458109, 1, 1, 1, 1, 1,
-0.1107572, 0.3753169, -0.772117, 1, 1, 1, 1, 1,
-0.108498, -1.488962, -4.27636, 1, 1, 1, 1, 1,
-0.1038493, -0.08471723, -1.736382, 1, 1, 1, 1, 1,
-0.09996603, 0.7778117, 1.84043, 1, 1, 1, 1, 1,
-0.09898115, 0.7072124, 0.214411, 1, 1, 1, 1, 1,
-0.09518521, -1.276941, -2.860659, 1, 1, 1, 1, 1,
-0.09337673, 0.02555767, -0.2387427, 1, 1, 1, 1, 1,
-0.08902858, -1.200826, -3.262484, 1, 1, 1, 1, 1,
-0.0885659, 0.3820115, -0.4310462, 1, 1, 1, 1, 1,
-0.08844271, -0.8838153, -3.423579, 1, 1, 1, 1, 1,
-0.08767744, -0.4602575, -3.322812, 0, 0, 1, 1, 1,
-0.08269253, -0.7534316, -4.626605, 1, 0, 0, 1, 1,
-0.08263335, -2.172618, -4.243443, 1, 0, 0, 1, 1,
-0.08216298, -1.376095, -2.39536, 1, 0, 0, 1, 1,
-0.08049555, -1.769165, -3.378096, 1, 0, 0, 1, 1,
-0.07954337, 0.6445546, 0.0620335, 1, 0, 0, 1, 1,
-0.07739959, -0.7619119, -5.233266, 0, 0, 0, 1, 1,
-0.07526566, -0.3892888, -0.2282434, 0, 0, 0, 1, 1,
-0.067944, 0.2564586, 0.1661, 0, 0, 0, 1, 1,
-0.06614437, -0.6372883, -5.255367, 0, 0, 0, 1, 1,
-0.06598114, -0.385415, -2.627134, 0, 0, 0, 1, 1,
-0.05747926, 1.70164, 1.549411, 0, 0, 0, 1, 1,
-0.05739653, 0.3326028, -0.7977602, 0, 0, 0, 1, 1,
-0.05350042, 0.9293627, 1.058837, 1, 1, 1, 1, 1,
-0.05154528, -1.508929, -2.143164, 1, 1, 1, 1, 1,
-0.04687604, -1.370684, -2.465518, 1, 1, 1, 1, 1,
-0.04103194, -0.4034897, -3.065021, 1, 1, 1, 1, 1,
-0.04055452, -1.018312, -2.552335, 1, 1, 1, 1, 1,
-0.04041316, -0.8990502, -2.299318, 1, 1, 1, 1, 1,
-0.0398212, 1.251547, -0.5615824, 1, 1, 1, 1, 1,
-0.03975792, 0.8365766, -0.7081045, 1, 1, 1, 1, 1,
-0.03864251, -2.854871, -2.77847, 1, 1, 1, 1, 1,
-0.03739684, 1.006341, -0.2879278, 1, 1, 1, 1, 1,
-0.03663637, -0.3796794, -3.045884, 1, 1, 1, 1, 1,
-0.03293442, -0.1583826, -3.602214, 1, 1, 1, 1, 1,
-0.0248556, 0.4771912, 0.06870158, 1, 1, 1, 1, 1,
-0.02034828, -0.1781917, -1.523631, 1, 1, 1, 1, 1,
-0.01742781, 0.1799013, 1.530547, 1, 1, 1, 1, 1,
-0.00836926, -0.4667695, -2.561899, 0, 0, 1, 1, 1,
-0.006117584, -0.974292, -3.443949, 1, 0, 0, 1, 1,
-0.005574923, 0.08180387, -0.4261439, 1, 0, 0, 1, 1,
-2.813969e-05, -0.4010452, -1.629862, 1, 0, 0, 1, 1,
0.01670302, -0.7242805, 2.493577, 1, 0, 0, 1, 1,
0.01830558, 1.452086, 0.5262176, 1, 0, 0, 1, 1,
0.01942342, -0.5385624, 3.680308, 0, 0, 0, 1, 1,
0.02380049, -0.8325163, 4.244397, 0, 0, 0, 1, 1,
0.02464923, -0.2905219, 3.678659, 0, 0, 0, 1, 1,
0.02532616, -0.2562563, 2.460795, 0, 0, 0, 1, 1,
0.03189771, 0.1578898, 1.07844, 0, 0, 0, 1, 1,
0.03249804, -0.1582387, 3.846721, 0, 0, 0, 1, 1,
0.0331519, 1.481274, 1.713821, 0, 0, 0, 1, 1,
0.03820016, 1.928205, 0.4945093, 1, 1, 1, 1, 1,
0.03915562, -0.2370265, 4.514218, 1, 1, 1, 1, 1,
0.04325259, -0.7067196, 2.040725, 1, 1, 1, 1, 1,
0.04410301, -0.2117596, 3.026283, 1, 1, 1, 1, 1,
0.0443736, -0.7404521, 3.077609, 1, 1, 1, 1, 1,
0.04521451, 1.339531, 1.993228, 1, 1, 1, 1, 1,
0.04598039, 0.9159595, 2.280821, 1, 1, 1, 1, 1,
0.04649108, 0.8651385, -0.5074487, 1, 1, 1, 1, 1,
0.04761245, 0.292031, 0.07353681, 1, 1, 1, 1, 1,
0.0530962, -0.07479442, 1.221789, 1, 1, 1, 1, 1,
0.05325891, -0.009907571, 2.310903, 1, 1, 1, 1, 1,
0.05465174, -1.073961, 3.887599, 1, 1, 1, 1, 1,
0.05863746, 0.7288601, 1.836534, 1, 1, 1, 1, 1,
0.05971294, -0.4109616, 1.37729, 1, 1, 1, 1, 1,
0.06187069, -0.8595482, 2.68004, 1, 1, 1, 1, 1,
0.06871421, -0.1626663, 2.885596, 0, 0, 1, 1, 1,
0.07280037, -1.808646, 2.066915, 1, 0, 0, 1, 1,
0.07410534, 0.3974377, 1.805086, 1, 0, 0, 1, 1,
0.07911859, -0.566786, 2.008784, 1, 0, 0, 1, 1,
0.08204678, -0.3970185, 2.569516, 1, 0, 0, 1, 1,
0.08511598, -0.9762031, 4.390791, 1, 0, 0, 1, 1,
0.09158278, 0.2563718, 1.444199, 0, 0, 0, 1, 1,
0.09706624, 0.2302996, 1.481421, 0, 0, 0, 1, 1,
0.1003965, 0.02204749, 1.413942, 0, 0, 0, 1, 1,
0.1055489, 0.805814, 0.1156337, 0, 0, 0, 1, 1,
0.1084535, 1.322668, -0.2716126, 0, 0, 0, 1, 1,
0.1096559, 0.9996532, 0.1556449, 0, 0, 0, 1, 1,
0.1115878, -0.7447307, 2.872459, 0, 0, 0, 1, 1,
0.1116389, -0.6274674, 3.215626, 1, 1, 1, 1, 1,
0.1123158, 1.584916, -1.045251, 1, 1, 1, 1, 1,
0.1179052, -0.1416268, 1.780141, 1, 1, 1, 1, 1,
0.1244091, 1.449785, 0.3059654, 1, 1, 1, 1, 1,
0.1259795, 0.5358587, -0.5773184, 1, 1, 1, 1, 1,
0.1268843, 1.248224, -0.7219208, 1, 1, 1, 1, 1,
0.1329405, 0.1498527, 0.7365928, 1, 1, 1, 1, 1,
0.1444623, 0.4482767, 0.5778965, 1, 1, 1, 1, 1,
0.144499, -0.4356775, 2.320881, 1, 1, 1, 1, 1,
0.1450793, 1.211074, 0.7437816, 1, 1, 1, 1, 1,
0.1456262, -0.3298899, 3.392075, 1, 1, 1, 1, 1,
0.1477187, 0.5555252, 0.5333554, 1, 1, 1, 1, 1,
0.1482977, 1.630405, -1.104539, 1, 1, 1, 1, 1,
0.1487743, -0.207497, 2.330743, 1, 1, 1, 1, 1,
0.1526971, 0.07019374, 0.8127364, 1, 1, 1, 1, 1,
0.1571657, -0.6549195, 1.332615, 0, 0, 1, 1, 1,
0.1597513, -0.9188704, 3.073384, 1, 0, 0, 1, 1,
0.1629663, -0.09035512, 2.407356, 1, 0, 0, 1, 1,
0.1646959, 1.20009, -0.1270918, 1, 0, 0, 1, 1,
0.1661511, 0.2929237, 0.3023523, 1, 0, 0, 1, 1,
0.1673075, 0.2616739, 2.124057, 1, 0, 0, 1, 1,
0.1679512, 0.06692281, 2.726032, 0, 0, 0, 1, 1,
0.1692174, -0.2865734, 2.765321, 0, 0, 0, 1, 1,
0.1695142, 0.3278648, 0.04311852, 0, 0, 0, 1, 1,
0.1739128, 0.3954155, -0.8567326, 0, 0, 0, 1, 1,
0.1763497, 0.913573, 0.7055091, 0, 0, 0, 1, 1,
0.1775618, -0.3845148, 1.185776, 0, 0, 0, 1, 1,
0.1788274, -0.5295153, 5.401637, 0, 0, 0, 1, 1,
0.1804102, 0.511319, -1.05485, 1, 1, 1, 1, 1,
0.1825687, 2.291717, 1.383144, 1, 1, 1, 1, 1,
0.1855249, -1.33716, 3.193304, 1, 1, 1, 1, 1,
0.1868596, 0.7626827, 0.5929688, 1, 1, 1, 1, 1,
0.1901209, 2.336469, 0.05047676, 1, 1, 1, 1, 1,
0.1916716, -0.8646383, 3.922306, 1, 1, 1, 1, 1,
0.1916905, 1.746851, 0.6924014, 1, 1, 1, 1, 1,
0.1920111, -0.6171223, 3.317132, 1, 1, 1, 1, 1,
0.1926783, -0.09657307, 1.202808, 1, 1, 1, 1, 1,
0.1944039, -2.881698, 3.780896, 1, 1, 1, 1, 1,
0.1975596, 2.826112, 0.5001161, 1, 1, 1, 1, 1,
0.2015758, 1.297858, -0.5188918, 1, 1, 1, 1, 1,
0.2017418, -0.020059, 2.239712, 1, 1, 1, 1, 1,
0.2052426, 1.286466, 0.8165433, 1, 1, 1, 1, 1,
0.2056743, -0.1464341, 1.47704, 1, 1, 1, 1, 1,
0.2065553, 0.1974983, 1.044968, 0, 0, 1, 1, 1,
0.2073745, 2.633638, -1.627193, 1, 0, 0, 1, 1,
0.210754, -1.305895, 3.683009, 1, 0, 0, 1, 1,
0.2111133, -1.17042, 2.641978, 1, 0, 0, 1, 1,
0.212406, -0.9189435, 0.8525764, 1, 0, 0, 1, 1,
0.2189875, 0.06238375, 1.414334, 1, 0, 0, 1, 1,
0.2226534, -0.2988652, 1.804083, 0, 0, 0, 1, 1,
0.2236905, 0.4218604, -0.5020998, 0, 0, 0, 1, 1,
0.2309402, 0.4746704, -1.427851, 0, 0, 0, 1, 1,
0.235694, 1.330848, -0.705372, 0, 0, 0, 1, 1,
0.2425484, 1.364843, -0.07601887, 0, 0, 0, 1, 1,
0.2459046, 0.3000481, 0.09311041, 0, 0, 0, 1, 1,
0.2487928, -0.07169618, 1.617021, 0, 0, 0, 1, 1,
0.2561538, 2.432671, 0.5513836, 1, 1, 1, 1, 1,
0.2575664, 0.2874119, 1.612828, 1, 1, 1, 1, 1,
0.2635348, -0.1790938, 1.517202, 1, 1, 1, 1, 1,
0.2666735, 0.03717291, 2.667617, 1, 1, 1, 1, 1,
0.2689743, 0.7425082, -1.979949, 1, 1, 1, 1, 1,
0.2718647, 0.7196178, 1.020045, 1, 1, 1, 1, 1,
0.2752346, -0.2251855, 1.88955, 1, 1, 1, 1, 1,
0.2756223, 3.318789, -1.98189, 1, 1, 1, 1, 1,
0.2770996, 1.711904, -0.09142607, 1, 1, 1, 1, 1,
0.2772167, 1.263817, 1.515649, 1, 1, 1, 1, 1,
0.2788378, -0.7577743, 3.960567, 1, 1, 1, 1, 1,
0.2792409, -0.8385907, 3.605839, 1, 1, 1, 1, 1,
0.2819999, 0.3118052, 2.457846, 1, 1, 1, 1, 1,
0.2841946, -1.096623, 1.687686, 1, 1, 1, 1, 1,
0.2861696, 0.7643172, 0.01938667, 1, 1, 1, 1, 1,
0.2892021, 0.1677606, 3.160324, 0, 0, 1, 1, 1,
0.2929448, 0.06541795, 2.875374, 1, 0, 0, 1, 1,
0.2947096, -0.02509509, 1.235667, 1, 0, 0, 1, 1,
0.2958965, 0.0009533848, 2.27918, 1, 0, 0, 1, 1,
0.2967132, -1.515893, 2.172207, 1, 0, 0, 1, 1,
0.3022008, 0.3968477, -0.1821703, 1, 0, 0, 1, 1,
0.3084666, 0.6571127, 0.6457883, 0, 0, 0, 1, 1,
0.3117943, -1.167626, 1.821367, 0, 0, 0, 1, 1,
0.3118984, 0.5818196, -1.139839, 0, 0, 0, 1, 1,
0.321624, 1.194984, -0.8815831, 0, 0, 0, 1, 1,
0.3227382, -0.4484496, 3.260813, 0, 0, 0, 1, 1,
0.3227771, 0.5398647, 0.8353306, 0, 0, 0, 1, 1,
0.3239206, -0.3239838, 2.020653, 0, 0, 0, 1, 1,
0.3247121, -1.710224, 1.308379, 1, 1, 1, 1, 1,
0.3303474, -0.03269846, 1.624169, 1, 1, 1, 1, 1,
0.3332044, -0.7182325, 3.67263, 1, 1, 1, 1, 1,
0.3345789, -1.770834, 3.733098, 1, 1, 1, 1, 1,
0.3385249, 0.6335212, 0.09350951, 1, 1, 1, 1, 1,
0.3417487, -0.09570729, 1.430767, 1, 1, 1, 1, 1,
0.3491164, -0.7953859, 2.893932, 1, 1, 1, 1, 1,
0.3601353, 1.372985, -0.05947848, 1, 1, 1, 1, 1,
0.3725492, -0.5007752, 1.922639, 1, 1, 1, 1, 1,
0.3734651, -0.0893765, 1.369449, 1, 1, 1, 1, 1,
0.3740385, 0.1154838, 1.293978, 1, 1, 1, 1, 1,
0.3748228, -1.80671, 2.301021, 1, 1, 1, 1, 1,
0.3752399, -0.183754, 1.900373, 1, 1, 1, 1, 1,
0.3772481, -1.155989, 2.834153, 1, 1, 1, 1, 1,
0.3786628, -0.6297972, 1.974696, 1, 1, 1, 1, 1,
0.3815804, -1.141478, 2.012602, 0, 0, 1, 1, 1,
0.3816387, -1.126513, 2.692634, 1, 0, 0, 1, 1,
0.3822775, -0.4072078, 1.741313, 1, 0, 0, 1, 1,
0.3864818, -0.664212, 1.633665, 1, 0, 0, 1, 1,
0.3887609, -0.4520268, 1.654034, 1, 0, 0, 1, 1,
0.3901827, 2.282249, 0.9742177, 1, 0, 0, 1, 1,
0.3910014, -0.4276994, 2.509175, 0, 0, 0, 1, 1,
0.3918946, 2.377413, 0.2596423, 0, 0, 0, 1, 1,
0.3954641, -0.3060722, 2.992473, 0, 0, 0, 1, 1,
0.3993371, -0.9019381, 4.94342, 0, 0, 0, 1, 1,
0.4140755, 3.322529, -1.846973, 0, 0, 0, 1, 1,
0.4142703, -0.07988646, 2.027707, 0, 0, 0, 1, 1,
0.4187692, -1.20205, 1.575521, 0, 0, 0, 1, 1,
0.4208224, -0.5076255, 3.367476, 1, 1, 1, 1, 1,
0.4221312, 0.903843, 0.03835134, 1, 1, 1, 1, 1,
0.4236941, 2.052011, 0.8756649, 1, 1, 1, 1, 1,
0.4261099, 0.204099, 2.160889, 1, 1, 1, 1, 1,
0.4276951, -0.7312268, 2.638323, 1, 1, 1, 1, 1,
0.4313409, -1.050968, 2.397306, 1, 1, 1, 1, 1,
0.4389553, 1.413367, -1.157796, 1, 1, 1, 1, 1,
0.4445269, -0.08370503, 1.833824, 1, 1, 1, 1, 1,
0.4499084, -0.5493194, 3.376086, 1, 1, 1, 1, 1,
0.4519919, -0.1478315, 1.114778, 1, 1, 1, 1, 1,
0.4554072, 0.2619516, 2.02198, 1, 1, 1, 1, 1,
0.4557881, 1.219539, 1.792154, 1, 1, 1, 1, 1,
0.4565221, 1.477708, 0.5962874, 1, 1, 1, 1, 1,
0.4570233, 0.7870821, 1.824004, 1, 1, 1, 1, 1,
0.4626062, 1.339881, 1.384929, 1, 1, 1, 1, 1,
0.4691073, 0.8822724, 1.033114, 0, 0, 1, 1, 1,
0.4695701, 0.1840873, 0.6257682, 1, 0, 0, 1, 1,
0.4697637, 0.1026417, 2.422959, 1, 0, 0, 1, 1,
0.4704187, -0.7235364, 3.819974, 1, 0, 0, 1, 1,
0.4791033, -0.9403552, 2.746961, 1, 0, 0, 1, 1,
0.4801543, -0.9387835, 2.295774, 1, 0, 0, 1, 1,
0.4826218, 2.544755, -0.4986344, 0, 0, 0, 1, 1,
0.4849968, 0.6548119, -0.9532692, 0, 0, 0, 1, 1,
0.4852512, -1.85369, 4.822931, 0, 0, 0, 1, 1,
0.4913965, 0.2046932, -0.7451284, 0, 0, 0, 1, 1,
0.4923506, -0.3243376, 2.866516, 0, 0, 0, 1, 1,
0.4929553, -0.525487, 2.331303, 0, 0, 0, 1, 1,
0.4968975, 0.9580805, -0.3476003, 0, 0, 0, 1, 1,
0.4988414, -0.5335578, 3.103078, 1, 1, 1, 1, 1,
0.5011333, -1.17668, 3.379411, 1, 1, 1, 1, 1,
0.5034413, -0.4426012, 3.963067, 1, 1, 1, 1, 1,
0.5100681, 0.8516755, -0.7371747, 1, 1, 1, 1, 1,
0.5110407, -0.5631636, 2.917808, 1, 1, 1, 1, 1,
0.5121402, -1.655575, 1.813229, 1, 1, 1, 1, 1,
0.5167966, 0.179309, 1.271715, 1, 1, 1, 1, 1,
0.5193716, 0.134645, 1.657707, 1, 1, 1, 1, 1,
0.5233806, 0.06804446, 1.760207, 1, 1, 1, 1, 1,
0.5295776, -1.178964, 2.68865, 1, 1, 1, 1, 1,
0.5337029, 1.641671, 0.6728114, 1, 1, 1, 1, 1,
0.5338858, 0.1010496, 1.277606, 1, 1, 1, 1, 1,
0.5342377, -1.032145, 2.432616, 1, 1, 1, 1, 1,
0.5347002, -1.015893, 2.832193, 1, 1, 1, 1, 1,
0.5362117, -0.09424756, 2.613229, 1, 1, 1, 1, 1,
0.5370473, 0.6069303, -0.8912387, 0, 0, 1, 1, 1,
0.5478442, -0.6795489, 1.382472, 1, 0, 0, 1, 1,
0.5489683, 0.4908682, 0.15786, 1, 0, 0, 1, 1,
0.5493299, 0.477447, 1.167826, 1, 0, 0, 1, 1,
0.5509367, 1.182513, 1.153557, 1, 0, 0, 1, 1,
0.5547318, -1.112149, 2.736438, 1, 0, 0, 1, 1,
0.5558739, -0.5682784, 3.194966, 0, 0, 0, 1, 1,
0.556766, 1.176068, 0.9084781, 0, 0, 0, 1, 1,
0.5623291, 1.107013, 1.909705, 0, 0, 0, 1, 1,
0.56415, 0.2500675, 0.5562634, 0, 0, 0, 1, 1,
0.5645841, 2.448853, 1.305491, 0, 0, 0, 1, 1,
0.5646822, 0.4972102, -3.038286, 0, 0, 0, 1, 1,
0.571978, -0.4016924, 2.12991, 0, 0, 0, 1, 1,
0.5728398, -2.16464, 1.705124, 1, 1, 1, 1, 1,
0.5760572, -1.597198, 3.302126, 1, 1, 1, 1, 1,
0.5792825, 0.4757895, 1.604397, 1, 1, 1, 1, 1,
0.581601, 0.8256934, -0.2411479, 1, 1, 1, 1, 1,
0.5816541, -0.7221931, 3.984497, 1, 1, 1, 1, 1,
0.5833474, -0.7636591, 3.500397, 1, 1, 1, 1, 1,
0.5851377, 0.930661, -0.1188874, 1, 1, 1, 1, 1,
0.5892279, -0.01161414, 1.829561, 1, 1, 1, 1, 1,
0.5897796, 1.190745, -0.2163934, 1, 1, 1, 1, 1,
0.5917588, 1.318907, 1.592184, 1, 1, 1, 1, 1,
0.6025497, 1.742844, 1.709647, 1, 1, 1, 1, 1,
0.6125945, -1.28283, 0.2680096, 1, 1, 1, 1, 1,
0.6144549, -1.006932, 2.19443, 1, 1, 1, 1, 1,
0.6286242, -0.8114297, 2.482242, 1, 1, 1, 1, 1,
0.6296788, 0.1802742, 1.056569, 1, 1, 1, 1, 1,
0.6314224, 0.9905781, 1.121556, 0, 0, 1, 1, 1,
0.6325486, -0.04191094, 0.1663666, 1, 0, 0, 1, 1,
0.6413561, -0.2642416, 2.507035, 1, 0, 0, 1, 1,
0.6430323, -0.4659266, 1.954377, 1, 0, 0, 1, 1,
0.6440443, 1.060276, -0.02701398, 1, 0, 0, 1, 1,
0.6481006, -0.1525902, 1.218212, 1, 0, 0, 1, 1,
0.6508436, 0.9815282, -0.2393481, 0, 0, 0, 1, 1,
0.6527271, -0.520268, 1.776315, 0, 0, 0, 1, 1,
0.6570244, 0.4588457, 0.4677808, 0, 0, 0, 1, 1,
0.6592727, 0.6995057, -1.089213, 0, 0, 0, 1, 1,
0.6594096, -1.07668, 1.662484, 0, 0, 0, 1, 1,
0.6614333, -0.1498067, 1.561827, 0, 0, 0, 1, 1,
0.6686402, -1.276385, 2.220277, 0, 0, 0, 1, 1,
0.6710489, 1.097554, 2.33196, 1, 1, 1, 1, 1,
0.6726679, 0.1193406, 1.578096, 1, 1, 1, 1, 1,
0.6761013, 0.04826305, 1.29122, 1, 1, 1, 1, 1,
0.6784657, 0.7792846, -0.6488954, 1, 1, 1, 1, 1,
0.6843285, -1.166131, 1.861651, 1, 1, 1, 1, 1,
0.6844806, 0.1805599, -0.7543615, 1, 1, 1, 1, 1,
0.6849174, 1.263501, -0.03654721, 1, 1, 1, 1, 1,
0.6857241, -1.16105, 4.327857, 1, 1, 1, 1, 1,
0.6873379, 0.09981272, 3.021968, 1, 1, 1, 1, 1,
0.6926234, -0.4928694, 3.141309, 1, 1, 1, 1, 1,
0.6933265, 1.787608, 0.7009453, 1, 1, 1, 1, 1,
0.6968182, 0.549473, 1.44134, 1, 1, 1, 1, 1,
0.6986151, -0.2805237, 1.683734, 1, 1, 1, 1, 1,
0.6987031, 3.034803, -0.06453726, 1, 1, 1, 1, 1,
0.7026629, -1.472509, 2.956692, 1, 1, 1, 1, 1,
0.7096943, 0.8078192, -1.091209, 0, 0, 1, 1, 1,
0.7143016, -1.425473, 1.494075, 1, 0, 0, 1, 1,
0.7157611, -0.5598841, 2.088552, 1, 0, 0, 1, 1,
0.7169039, 0.3699192, 0.1759071, 1, 0, 0, 1, 1,
0.7179985, 0.5861757, 0.1930825, 1, 0, 0, 1, 1,
0.7260641, 0.6962438, 2.155674, 1, 0, 0, 1, 1,
0.7308312, 2.4668, 0.07329138, 0, 0, 0, 1, 1,
0.7340509, -0.08917641, 1.063782, 0, 0, 0, 1, 1,
0.7476779, 0.008880475, 0.7118814, 0, 0, 0, 1, 1,
0.7482806, -0.3724788, 0.7995355, 0, 0, 0, 1, 1,
0.7484134, -1.260154, 1.290449, 0, 0, 0, 1, 1,
0.7523046, 0.7569739, 1.653952, 0, 0, 0, 1, 1,
0.7534645, 1.156287, -0.2008719, 0, 0, 0, 1, 1,
0.7550321, 0.2824857, 1.169929, 1, 1, 1, 1, 1,
0.7593468, -1.819955, 5.458695, 1, 1, 1, 1, 1,
0.7594391, 0.6437724, 0.6859497, 1, 1, 1, 1, 1,
0.7606458, -1.190947, 1.013232, 1, 1, 1, 1, 1,
0.7678525, -0.1477767, 2.994689, 1, 1, 1, 1, 1,
0.7688037, 1.278333, -0.03193608, 1, 1, 1, 1, 1,
0.7803322, -1.830478, 1.221893, 1, 1, 1, 1, 1,
0.7813959, 2.032722, 0.6177776, 1, 1, 1, 1, 1,
0.7818554, -0.5833099, 2.460241, 1, 1, 1, 1, 1,
0.7837369, -0.9947879, 2.650047, 1, 1, 1, 1, 1,
0.7922414, -0.1699917, 2.124555, 1, 1, 1, 1, 1,
0.7949233, -0.4905688, 2.695897, 1, 1, 1, 1, 1,
0.8021963, -0.4713432, 0.4125969, 1, 1, 1, 1, 1,
0.805176, -0.1502923, 2.386916, 1, 1, 1, 1, 1,
0.8068103, -0.3269246, 1.806155, 1, 1, 1, 1, 1,
0.8071333, -0.3516178, 3.227986, 0, 0, 1, 1, 1,
0.8081287, -0.8326912, 2.529971, 1, 0, 0, 1, 1,
0.8117151, 0.1045246, 1.103157, 1, 0, 0, 1, 1,
0.8147082, -0.7333353, 0.4703629, 1, 0, 0, 1, 1,
0.8186665, -0.9992972, 1.964129, 1, 0, 0, 1, 1,
0.8309857, -1.800961, 5.112025, 1, 0, 0, 1, 1,
0.8314172, -3.229947, 3.055346, 0, 0, 0, 1, 1,
0.8335837, -1.235725, 0.2753482, 0, 0, 0, 1, 1,
0.8449727, 0.2465426, 2.954123, 0, 0, 0, 1, 1,
0.8453332, 0.9310451, -0.4428395, 0, 0, 0, 1, 1,
0.8472173, 2.106652, -0.5188419, 0, 0, 0, 1, 1,
0.8620394, -0.867882, 2.006763, 0, 0, 0, 1, 1,
0.8728842, 1.490077, -0.8122542, 0, 0, 0, 1, 1,
0.8761734, 0.1464251, 2.300362, 1, 1, 1, 1, 1,
0.8803677, -0.1957218, 0.1864234, 1, 1, 1, 1, 1,
0.8805316, 0.4091706, 1.09016, 1, 1, 1, 1, 1,
0.8836465, -0.9890088, 4.125319, 1, 1, 1, 1, 1,
0.8908578, -0.4572045, 0.8966423, 1, 1, 1, 1, 1,
0.8924232, -1.444461, 3.557594, 1, 1, 1, 1, 1,
0.8925323, 1.115308, -0.1271477, 1, 1, 1, 1, 1,
0.8986472, -0.5995436, -0.549574, 1, 1, 1, 1, 1,
0.9003648, 0.6239064, 0.9437687, 1, 1, 1, 1, 1,
0.9046063, -0.282475, 1.830969, 1, 1, 1, 1, 1,
0.9057987, -0.5297209, 0.5252922, 1, 1, 1, 1, 1,
0.9122046, -0.5808392, 0.9568403, 1, 1, 1, 1, 1,
0.9177628, 0.877283, -0.8772351, 1, 1, 1, 1, 1,
0.9213336, -1.842153, 1.643179, 1, 1, 1, 1, 1,
0.9260628, 0.4241346, 2.158955, 1, 1, 1, 1, 1,
0.9299637, 0.8102614, 1.521736, 0, 0, 1, 1, 1,
0.9364679, -0.7137805, 2.953542, 1, 0, 0, 1, 1,
0.9436376, -0.5489505, 1.530298, 1, 0, 0, 1, 1,
0.9470223, -0.8684281, 2.569272, 1, 0, 0, 1, 1,
0.9500244, -1.435572, 1.665117, 1, 0, 0, 1, 1,
0.9524704, -0.7278847, 3.73042, 1, 0, 0, 1, 1,
0.9577853, -0.8711947, 2.368123, 0, 0, 0, 1, 1,
0.9636451, -0.5211784, 3.62516, 0, 0, 0, 1, 1,
0.9645208, 1.003437, 0.7593253, 0, 0, 0, 1, 1,
0.9691167, -0.07485116, 0.5818344, 0, 0, 0, 1, 1,
0.9692853, 0.7926321, 2.464213, 0, 0, 0, 1, 1,
0.969295, 0.06686588, 0.6565678, 0, 0, 0, 1, 1,
0.9732197, 0.4121364, 2.589928, 0, 0, 0, 1, 1,
0.9743171, -0.04374164, 1.975536, 1, 1, 1, 1, 1,
0.9805304, 1.639212, 1.001501, 1, 1, 1, 1, 1,
0.9883118, -0.6541481, 0.7610819, 1, 1, 1, 1, 1,
0.9980443, -1.851295, 3.343692, 1, 1, 1, 1, 1,
1.003426, 0.4577934, 1.058427, 1, 1, 1, 1, 1,
1.018646, 0.04395577, 1.757644, 1, 1, 1, 1, 1,
1.021139, -0.7030579, 4.041135, 1, 1, 1, 1, 1,
1.02754, -0.6293607, 2.550673, 1, 1, 1, 1, 1,
1.028138, -0.8731241, 2.140548, 1, 1, 1, 1, 1,
1.028689, -1.136075, 2.319897, 1, 1, 1, 1, 1,
1.034011, 1.074792, 0.6052808, 1, 1, 1, 1, 1,
1.041091, -1.871745, 1.516936, 1, 1, 1, 1, 1,
1.042084, -0.206071, 1.687771, 1, 1, 1, 1, 1,
1.044475, -1.440465, 3.474738, 1, 1, 1, 1, 1,
1.044689, -0.2456867, 0.09286417, 1, 1, 1, 1, 1,
1.049917, 0.182474, 1.640738, 0, 0, 1, 1, 1,
1.052331, 0.0339596, 2.556793, 1, 0, 0, 1, 1,
1.057302, 0.2686841, -0.553158, 1, 0, 0, 1, 1,
1.058473, -0.6331015, 2.959418, 1, 0, 0, 1, 1,
1.062928, -0.06992484, 1.994749, 1, 0, 0, 1, 1,
1.065156, -1.514815, 2.68813, 1, 0, 0, 1, 1,
1.067573, -1.61069, 3.188386, 0, 0, 0, 1, 1,
1.072254, 1.089049, -1.132866, 0, 0, 0, 1, 1,
1.072771, -0.5862815, 2.790878, 0, 0, 0, 1, 1,
1.076943, -1.88523, 3.760598, 0, 0, 0, 1, 1,
1.077416, -0.6494431, 1.117501, 0, 0, 0, 1, 1,
1.095592, 0.2242112, 2.041528, 0, 0, 0, 1, 1,
1.103853, 1.036123, 0.628801, 0, 0, 0, 1, 1,
1.107423, -0.1652704, 0.7595526, 1, 1, 1, 1, 1,
1.123624, 0.377935, 0.833301, 1, 1, 1, 1, 1,
1.126882, 0.7043491, 0.07728443, 1, 1, 1, 1, 1,
1.130187, 0.3007169, 0.1791255, 1, 1, 1, 1, 1,
1.131709, -0.0002834924, 2.389255, 1, 1, 1, 1, 1,
1.137622, 0.8516828, 0.3543462, 1, 1, 1, 1, 1,
1.139145, -0.9235181, 2.187048, 1, 1, 1, 1, 1,
1.155486, -0.7837402, 1.364986, 1, 1, 1, 1, 1,
1.155903, 1.819727, 0.000606386, 1, 1, 1, 1, 1,
1.165075, 0.08011648, 1.018223, 1, 1, 1, 1, 1,
1.166048, 0.416279, 1.872008, 1, 1, 1, 1, 1,
1.168621, -1.276303, 2.020816, 1, 1, 1, 1, 1,
1.171373, -0.2273479, 0.8798822, 1, 1, 1, 1, 1,
1.173791, 0.09230424, 0.7404523, 1, 1, 1, 1, 1,
1.18268, -0.6759464, -0.3970552, 1, 1, 1, 1, 1,
1.199054, 0.2815251, 1.174797, 0, 0, 1, 1, 1,
1.202764, 0.5826862, 0.4861357, 1, 0, 0, 1, 1,
1.207153, -1.026694, 2.726411, 1, 0, 0, 1, 1,
1.217535, 0.6770869, 1.279806, 1, 0, 0, 1, 1,
1.2197, -1.463091, 1.86777, 1, 0, 0, 1, 1,
1.220861, 0.3409245, 0.1034434, 1, 0, 0, 1, 1,
1.221171, 0.8080228, 1.722404, 0, 0, 0, 1, 1,
1.226784, 2.182763, 1.222463, 0, 0, 0, 1, 1,
1.228091, 0.3217305, 1.810472, 0, 0, 0, 1, 1,
1.229654, -0.8372209, 2.002154, 0, 0, 0, 1, 1,
1.230169, 0.5744866, 1.818393, 0, 0, 0, 1, 1,
1.238192, 0.7775913, 1.164401, 0, 0, 0, 1, 1,
1.240594, -0.0977858, 1.404575, 0, 0, 0, 1, 1,
1.245762, -0.7275778, 0.814812, 1, 1, 1, 1, 1,
1.248509, -1.107621, 2.003936, 1, 1, 1, 1, 1,
1.277959, 0.07440238, 0.9583839, 1, 1, 1, 1, 1,
1.280746, -1.118936, 5.153796, 1, 1, 1, 1, 1,
1.282677, -1.147249, 3.011287, 1, 1, 1, 1, 1,
1.288685, -0.3066737, 2.391826, 1, 1, 1, 1, 1,
1.291418, -1.145658, 2.637481, 1, 1, 1, 1, 1,
1.301593, 1.228174, 2.356353, 1, 1, 1, 1, 1,
1.303146, 0.1951499, 3.142275, 1, 1, 1, 1, 1,
1.303784, 2.033223, -0.2741721, 1, 1, 1, 1, 1,
1.305686, 0.3837816, 2.665392, 1, 1, 1, 1, 1,
1.310586, -0.3856177, 2.388642, 1, 1, 1, 1, 1,
1.316133, -1.606666, 3.140175, 1, 1, 1, 1, 1,
1.319582, -1.409595, 1.177998, 1, 1, 1, 1, 1,
1.326446, 0.9292799, 0.8247119, 1, 1, 1, 1, 1,
1.326661, -0.07684384, 0.805176, 0, 0, 1, 1, 1,
1.334099, -0.1679767, 1.740352, 1, 0, 0, 1, 1,
1.338865, 3.369622, -1.609472, 1, 0, 0, 1, 1,
1.339125, 1.700601, 1.451045, 1, 0, 0, 1, 1,
1.341655, -1.405505, 1.264024, 1, 0, 0, 1, 1,
1.342385, -0.291162, 0.02011192, 1, 0, 0, 1, 1,
1.348889, -1.273885, 1.824246, 0, 0, 0, 1, 1,
1.3492, -0.2343236, -1.034495, 0, 0, 0, 1, 1,
1.349883, 1.867198, 0.5611378, 0, 0, 0, 1, 1,
1.349975, 2.695643, 1.885792, 0, 0, 0, 1, 1,
1.352421, 1.973582, 0.1224854, 0, 0, 0, 1, 1,
1.364832, 0.5442687, 2.620762, 0, 0, 0, 1, 1,
1.371536, -0.2098434, 3.606003, 0, 0, 0, 1, 1,
1.373575, -0.2541899, 4.666728, 1, 1, 1, 1, 1,
1.374148, 0.401163, 1.714392, 1, 1, 1, 1, 1,
1.3803, 0.4663988, 1.683648, 1, 1, 1, 1, 1,
1.380407, -0.1973692, 3.688067, 1, 1, 1, 1, 1,
1.383376, -0.7004283, 1.911775, 1, 1, 1, 1, 1,
1.385031, 0.4099024, 2.236665, 1, 1, 1, 1, 1,
1.390884, -0.2615708, 2.829492, 1, 1, 1, 1, 1,
1.39472, 0.4294751, 1.075578, 1, 1, 1, 1, 1,
1.397298, 1.124171, 2.350815, 1, 1, 1, 1, 1,
1.397557, 1.951515, 0.7751844, 1, 1, 1, 1, 1,
1.408547, 1.083062, 0.9742467, 1, 1, 1, 1, 1,
1.426867, -0.1343928, 2.205942, 1, 1, 1, 1, 1,
1.435784, 0.662687, 1.316271, 1, 1, 1, 1, 1,
1.445236, 1.298768, 0.913635, 1, 1, 1, 1, 1,
1.453753, 0.415204, 0.1231524, 1, 1, 1, 1, 1,
1.45693, -0.7166061, 1.906784, 0, 0, 1, 1, 1,
1.478782, -0.07514866, 0.2771066, 1, 0, 0, 1, 1,
1.483039, 0.1484793, 2.725735, 1, 0, 0, 1, 1,
1.485582, -0.3197101, 1.598943, 1, 0, 0, 1, 1,
1.496271, -0.5389729, 3.520696, 1, 0, 0, 1, 1,
1.507026, 1.955412, -0.1188662, 1, 0, 0, 1, 1,
1.510313, 0.9209918, -1.400304, 0, 0, 0, 1, 1,
1.511756, -0.5264971, 0.4521809, 0, 0, 0, 1, 1,
1.517004, 1.30258, 1.257824, 0, 0, 0, 1, 1,
1.518992, -0.927627, 2.093707, 0, 0, 0, 1, 1,
1.538134, -1.09166, 1.646679, 0, 0, 0, 1, 1,
1.544732, 1.744946, 1.034474, 0, 0, 0, 1, 1,
1.553991, 0.6739272, 0.3436466, 0, 0, 0, 1, 1,
1.554378, 0.8429667, 0.9239522, 1, 1, 1, 1, 1,
1.560082, 0.3878639, 0.8752245, 1, 1, 1, 1, 1,
1.578827, -0.07130144, 0.1453301, 1, 1, 1, 1, 1,
1.583015, -2.221029, 2.581028, 1, 1, 1, 1, 1,
1.596693, -2.031847, 2.573166, 1, 1, 1, 1, 1,
1.622568, -1.228257, 1.410803, 1, 1, 1, 1, 1,
1.62724, -1.465813, 0.5291691, 1, 1, 1, 1, 1,
1.640105, -0.1899321, 2.648328, 1, 1, 1, 1, 1,
1.640345, 0.9047936, 0.6095009, 1, 1, 1, 1, 1,
1.64876, 0.07575452, 0.9808629, 1, 1, 1, 1, 1,
1.649984, 0.3939338, 1.142015, 1, 1, 1, 1, 1,
1.65414, 1.407776, 0.5399199, 1, 1, 1, 1, 1,
1.671747, 0.4408408, 0.2235705, 1, 1, 1, 1, 1,
1.674378, -0.1766729, 0.6331692, 1, 1, 1, 1, 1,
1.67653, 0.8914067, -0.03891837, 1, 1, 1, 1, 1,
1.682188, -1.226584, 1.14046, 0, 0, 1, 1, 1,
1.684167, -3.022913, 4.080915, 1, 0, 0, 1, 1,
1.689166, 0.2454861, 2.738939, 1, 0, 0, 1, 1,
1.689694, 1.309828, 1.216977, 1, 0, 0, 1, 1,
1.712079, -0.9698003, 5.018125, 1, 0, 0, 1, 1,
1.766267, 0.7415686, 1.046605, 1, 0, 0, 1, 1,
1.767683, -2.228794, 2.240052, 0, 0, 0, 1, 1,
1.776261, 0.1480053, 2.494601, 0, 0, 0, 1, 1,
1.778111, 0.3022221, 1.548272, 0, 0, 0, 1, 1,
1.77937, 0.9829959, 1.320268, 0, 0, 0, 1, 1,
1.787752, 0.02648162, 1.063004, 0, 0, 0, 1, 1,
1.789352, -0.1035107, 2.0111, 0, 0, 0, 1, 1,
1.796538, 0.5804269, 0.6123559, 0, 0, 0, 1, 1,
1.798615, -0.5066537, 1.050057, 1, 1, 1, 1, 1,
1.803519, -0.7434798, 2.432423, 1, 1, 1, 1, 1,
1.815125, -0.4804733, 1.634543, 1, 1, 1, 1, 1,
1.819358, 2.256346, 0.03444092, 1, 1, 1, 1, 1,
1.842997, -0.01145258, 1.762946, 1, 1, 1, 1, 1,
1.868735, -0.783796, 2.324721, 1, 1, 1, 1, 1,
1.902437, -1.129958, 0.7317413, 1, 1, 1, 1, 1,
1.902893, -0.5454851, 1.494364, 1, 1, 1, 1, 1,
1.925488, 0.09148254, 2.630842, 1, 1, 1, 1, 1,
1.944731, -0.3869041, 3.143502, 1, 1, 1, 1, 1,
1.951742, -0.1580732, 2.125869, 1, 1, 1, 1, 1,
1.970313, -0.3104604, 0.9779378, 1, 1, 1, 1, 1,
1.978706, 0.5845227, -0.1334148, 1, 1, 1, 1, 1,
2.014871, 1.826779, 3.156859, 1, 1, 1, 1, 1,
2.058506, 0.4106822, -0.2108883, 1, 1, 1, 1, 1,
2.06043, -0.8483438, 2.149699, 0, 0, 1, 1, 1,
2.077031, 0.9193538, 0.02116474, 1, 0, 0, 1, 1,
2.083797, 0.5877894, 2.106934, 1, 0, 0, 1, 1,
2.090309, -1.207385, 2.615997, 1, 0, 0, 1, 1,
2.098731, 0.7433536, 1.446863, 1, 0, 0, 1, 1,
2.20816, 0.6063237, 1.906963, 1, 0, 0, 1, 1,
2.238025, 1.376583, 0.2974027, 0, 0, 0, 1, 1,
2.298171, -0.6806167, 2.384439, 0, 0, 0, 1, 1,
2.315806, 0.8603776, 1.692707, 0, 0, 0, 1, 1,
2.350561, 0.6535211, 2.155476, 0, 0, 0, 1, 1,
2.351105, -1.339959, 4.142241, 0, 0, 0, 1, 1,
2.370508, -0.4844884, 2.125286, 0, 0, 0, 1, 1,
2.422091, -1.474637, 3.668061, 0, 0, 0, 1, 1,
2.44552, 0.2863493, 2.156745, 1, 1, 1, 1, 1,
2.484514, -0.3633811, 3.260985, 1, 1, 1, 1, 1,
2.588468, 0.6545033, 0.3652462, 1, 1, 1, 1, 1,
2.636458, 0.2781158, -0.7081432, 1, 1, 1, 1, 1,
2.704967, -0.6798133, 0.09906673, 1, 1, 1, 1, 1,
3.056921, -2.943677, 3.39194, 1, 1, 1, 1, 1,
3.069786, 1.566287, 1.205859, 1, 1, 1, 1, 1
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
var radius = 9.776382;
var distance = 34.33913;
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
mvMatrix.translate( 0.2545099, -0.2285745, -0.1016638 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.33913);
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