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
-2.866787, -2.329954, -0.6420699, 1, 0, 0, 1,
-2.689518, 0.359783, -1.266698, 1, 0.007843138, 0, 1,
-2.628548, -0.9923435, -2.331935, 1, 0.01176471, 0, 1,
-2.599271, -1.424435, -1.769134, 1, 0.01960784, 0, 1,
-2.59464, 0.7135034, -1.156097, 1, 0.02352941, 0, 1,
-2.522864, -0.6345586, -1.121162, 1, 0.03137255, 0, 1,
-2.393548, 0.9285105, -1.867535, 1, 0.03529412, 0, 1,
-2.330042, 0.1787955, -1.510753, 1, 0.04313726, 0, 1,
-2.313447, -0.06446624, -0.7060924, 1, 0.04705882, 0, 1,
-2.272225, -0.2716679, -4.082469, 1, 0.05490196, 0, 1,
-2.167237, -1.057498, -0.3224634, 1, 0.05882353, 0, 1,
-2.166653, -0.6565993, -2.300344, 1, 0.06666667, 0, 1,
-2.15034, 0.2448059, -2.117033, 1, 0.07058824, 0, 1,
-2.145903, -0.5606275, -1.358375, 1, 0.07843138, 0, 1,
-2.086037, -2.283747, -3.036915, 1, 0.08235294, 0, 1,
-2.077227, -0.1923148, -2.724679, 1, 0.09019608, 0, 1,
-2.071425, -0.3556937, -2.774054, 1, 0.09411765, 0, 1,
-2.062021, -0.9910563, 0.1630909, 1, 0.1019608, 0, 1,
-2.036519, -2.03584, -2.925933, 1, 0.1098039, 0, 1,
-2.026161, -1.114035, -0.8759091, 1, 0.1137255, 0, 1,
-1.99972, 0.3961114, -1.486123, 1, 0.1215686, 0, 1,
-1.998516, -0.4274729, -0.5713702, 1, 0.1254902, 0, 1,
-1.987465, 1.376956, -0.8833841, 1, 0.1333333, 0, 1,
-1.983243, -0.04115072, -3.302381, 1, 0.1372549, 0, 1,
-1.978202, 0.6184139, -1.169526, 1, 0.145098, 0, 1,
-1.9726, -0.5235668, -1.542133, 1, 0.1490196, 0, 1,
-1.971919, -0.2376956, -2.009348, 1, 0.1568628, 0, 1,
-1.96081, -0.5524108, -1.266224, 1, 0.1607843, 0, 1,
-1.959769, -0.7626168, 0.4370115, 1, 0.1686275, 0, 1,
-1.95718, 0.04570518, -1.089996, 1, 0.172549, 0, 1,
-1.95393, -1.325126, -3.656774, 1, 0.1803922, 0, 1,
-1.950677, 0.1419121, -1.105071, 1, 0.1843137, 0, 1,
-1.941676, 0.1880976, 0.467061, 1, 0.1921569, 0, 1,
-1.940488, 0.5520149, -1.230949, 1, 0.1960784, 0, 1,
-1.934964, 0.1908335, -2.157955, 1, 0.2039216, 0, 1,
-1.933017, -1.548947, -2.063477, 1, 0.2117647, 0, 1,
-1.920606, 1.457174, -1.589446, 1, 0.2156863, 0, 1,
-1.916058, -0.1529558, -2.470789, 1, 0.2235294, 0, 1,
-1.876542, -0.4838803, -1.792138, 1, 0.227451, 0, 1,
-1.867628, 0.2486143, -3.195238, 1, 0.2352941, 0, 1,
-1.858826, 1.327621, -0.7293445, 1, 0.2392157, 0, 1,
-1.831204, 0.5411227, -0.819428, 1, 0.2470588, 0, 1,
-1.826664, -0.1182974, -2.486714, 1, 0.2509804, 0, 1,
-1.814284, 1.095572, -0.6811575, 1, 0.2588235, 0, 1,
-1.781512, 0.2704175, -0.7816545, 1, 0.2627451, 0, 1,
-1.77976, 0.4738988, 0.3288252, 1, 0.2705882, 0, 1,
-1.779681, -1.688637, -1.214909, 1, 0.2745098, 0, 1,
-1.771643, 2.236881, 0.1948699, 1, 0.282353, 0, 1,
-1.732506, 1.516803, -1.976687, 1, 0.2862745, 0, 1,
-1.717393, 0.7011911, -0.4479247, 1, 0.2941177, 0, 1,
-1.695393, -0.3825146, -2.138325, 1, 0.3019608, 0, 1,
-1.693228, 0.8207757, -0.1769556, 1, 0.3058824, 0, 1,
-1.690619, 1.599503, -1.521228, 1, 0.3137255, 0, 1,
-1.688868, 0.5811166, -1.778456, 1, 0.3176471, 0, 1,
-1.687792, 1.51301, 0.6297074, 1, 0.3254902, 0, 1,
-1.678468, -0.346348, -2.49927, 1, 0.3294118, 0, 1,
-1.65199, -0.6705062, -2.275786, 1, 0.3372549, 0, 1,
-1.649231, 1.919945, 0.6227469, 1, 0.3411765, 0, 1,
-1.639515, 0.5701101, -2.78638, 1, 0.3490196, 0, 1,
-1.638732, -1.683511, -2.239878, 1, 0.3529412, 0, 1,
-1.638342, 0.4173422, -2.777139, 1, 0.3607843, 0, 1,
-1.621531, 0.7312207, -1.534482, 1, 0.3647059, 0, 1,
-1.610019, 0.5883023, -1.57862, 1, 0.372549, 0, 1,
-1.601647, 0.9320345, -2.7339, 1, 0.3764706, 0, 1,
-1.601533, 1.033648, -2.239991, 1, 0.3843137, 0, 1,
-1.595344, -1.784344, -0.6963273, 1, 0.3882353, 0, 1,
-1.59194, -0.3409511, -1.733669, 1, 0.3960784, 0, 1,
-1.580402, 1.554284, -0.9402457, 1, 0.4039216, 0, 1,
-1.5747, 0.7242378, -2.542497, 1, 0.4078431, 0, 1,
-1.573903, -0.5544752, -3.923275, 1, 0.4156863, 0, 1,
-1.54954, -0.3145519, -0.9916247, 1, 0.4196078, 0, 1,
-1.546564, 1.075667, -0.4541196, 1, 0.427451, 0, 1,
-1.544601, 0.6161482, -1.632349, 1, 0.4313726, 0, 1,
-1.541975, 2.205191, -0.04421678, 1, 0.4392157, 0, 1,
-1.540026, 0.9068506, -1.145566, 1, 0.4431373, 0, 1,
-1.521284, 1.504775, -1.290171, 1, 0.4509804, 0, 1,
-1.51539, 0.2910252, -0.4339297, 1, 0.454902, 0, 1,
-1.507024, -1.660084, -1.386072, 1, 0.4627451, 0, 1,
-1.505923, -1.704389, -0.4264619, 1, 0.4666667, 0, 1,
-1.499816, -0.4128163, -1.918804, 1, 0.4745098, 0, 1,
-1.495018, 1.212526, -1.920326, 1, 0.4784314, 0, 1,
-1.494586, -0.4189024, -1.523395, 1, 0.4862745, 0, 1,
-1.492572, -0.06706604, -0.9741533, 1, 0.4901961, 0, 1,
-1.489869, -1.269522, -0.4430868, 1, 0.4980392, 0, 1,
-1.484957, 0.212549, -0.1530887, 1, 0.5058824, 0, 1,
-1.484253, 0.8042358, 0.9205023, 1, 0.509804, 0, 1,
-1.470431, -0.7168346, -3.380142, 1, 0.5176471, 0, 1,
-1.464254, 1.132769, -0.8083985, 1, 0.5215687, 0, 1,
-1.46348, -1.197407, -4.305271, 1, 0.5294118, 0, 1,
-1.459434, 0.6468899, -2.026376, 1, 0.5333334, 0, 1,
-1.450173, -2.067196, -3.678432, 1, 0.5411765, 0, 1,
-1.442535, 1.207037, 0.295776, 1, 0.5450981, 0, 1,
-1.440603, -1.099303, -0.5311892, 1, 0.5529412, 0, 1,
-1.430772, 0.8578674, -0.3296995, 1, 0.5568628, 0, 1,
-1.428192, -0.3997017, -1.546101, 1, 0.5647059, 0, 1,
-1.416048, 2.207311, -0.292108, 1, 0.5686275, 0, 1,
-1.414099, -0.4177101, -3.017025, 1, 0.5764706, 0, 1,
-1.410825, -1.338961, -2.332776, 1, 0.5803922, 0, 1,
-1.400602, -1.711357, -3.480915, 1, 0.5882353, 0, 1,
-1.397806, -0.7732956, -3.018332, 1, 0.5921569, 0, 1,
-1.393158, -0.6823967, -0.8581935, 1, 0.6, 0, 1,
-1.388833, 0.1397736, -1.62267, 1, 0.6078432, 0, 1,
-1.381585, 1.246039, -0.7303718, 1, 0.6117647, 0, 1,
-1.367737, -0.7614507, -3.205768, 1, 0.6196079, 0, 1,
-1.359474, 0.7905606, 1.432525, 1, 0.6235294, 0, 1,
-1.355351, 1.504076, -1.320137, 1, 0.6313726, 0, 1,
-1.329184, 1.081816, -1.313518, 1, 0.6352941, 0, 1,
-1.328761, -0.7864198, -2.933801, 1, 0.6431373, 0, 1,
-1.323915, -0.1443333, -0.9682637, 1, 0.6470588, 0, 1,
-1.316945, 0.9508706, 0.6329135, 1, 0.654902, 0, 1,
-1.313032, 0.3830221, 1.022205, 1, 0.6588235, 0, 1,
-1.310961, -0.3660141, -2.026222, 1, 0.6666667, 0, 1,
-1.303281, 0.8180457, -0.3806781, 1, 0.6705883, 0, 1,
-1.294153, 0.7148896, -0.1069885, 1, 0.6784314, 0, 1,
-1.279203, 1.038937, -0.5410613, 1, 0.682353, 0, 1,
-1.271422, 2.820954, -0.3020778, 1, 0.6901961, 0, 1,
-1.267299, -0.4301763, -1.156805, 1, 0.6941177, 0, 1,
-1.263938, 1.37472, 0.9078923, 1, 0.7019608, 0, 1,
-1.260978, 0.7059198, -1.647553, 1, 0.7098039, 0, 1,
-1.24707, -1.656672, -2.750821, 1, 0.7137255, 0, 1,
-1.240172, -0.5184051, -2.141916, 1, 0.7215686, 0, 1,
-1.238338, 0.244016, -1.525348, 1, 0.7254902, 0, 1,
-1.231244, -0.7966741, -1.626305, 1, 0.7333333, 0, 1,
-1.231081, 2.96318, -2.151853, 1, 0.7372549, 0, 1,
-1.220474, 0.6659373, -2.177845, 1, 0.7450981, 0, 1,
-1.214396, 0.2878033, -0.001636109, 1, 0.7490196, 0, 1,
-1.209848, -0.05797341, -2.236675, 1, 0.7568628, 0, 1,
-1.207632, -0.0555933, -2.642135, 1, 0.7607843, 0, 1,
-1.206357, -0.6006097, -1.189749, 1, 0.7686275, 0, 1,
-1.19664, 0.4572708, 0.1119785, 1, 0.772549, 0, 1,
-1.188746, 0.5210675, -1.045024, 1, 0.7803922, 0, 1,
-1.168831, 0.9986516, 0.08072713, 1, 0.7843137, 0, 1,
-1.152209, 0.6466447, 0.02331545, 1, 0.7921569, 0, 1,
-1.127787, -1.310546, -2.716451, 1, 0.7960784, 0, 1,
-1.124865, 0.7237842, -1.218254, 1, 0.8039216, 0, 1,
-1.117333, -0.7745501, -0.9150649, 1, 0.8117647, 0, 1,
-1.114019, -1.724085, -3.465644, 1, 0.8156863, 0, 1,
-1.113635, -1.439199, -3.781967, 1, 0.8235294, 0, 1,
-1.110324, 0.3408638, -1.385301, 1, 0.827451, 0, 1,
-1.100334, 0.4095604, -2.413112, 1, 0.8352941, 0, 1,
-1.098709, 1.050547, -2.374389, 1, 0.8392157, 0, 1,
-1.093823, -0.6593737, -2.481206, 1, 0.8470588, 0, 1,
-1.08185, -0.2990698, -1.542112, 1, 0.8509804, 0, 1,
-1.080417, 0.8681062, -1.012777, 1, 0.8588235, 0, 1,
-1.070995, -0.7522298, -2.401641, 1, 0.8627451, 0, 1,
-1.067615, -0.160065, -1.130744, 1, 0.8705882, 0, 1,
-1.043706, 0.6519569, -1.431609, 1, 0.8745098, 0, 1,
-1.037063, -0.9781658, -2.175318, 1, 0.8823529, 0, 1,
-1.03507, 0.3043074, -2.400705, 1, 0.8862745, 0, 1,
-1.033751, -0.02368832, -2.032083, 1, 0.8941177, 0, 1,
-1.026479, 0.1973129, -1.298585, 1, 0.8980392, 0, 1,
-1.0184, -0.3075016, -4.280977, 1, 0.9058824, 0, 1,
-1.017908, -0.8763496, -5.202352, 1, 0.9137255, 0, 1,
-1.016344, -0.419324, -3.173049, 1, 0.9176471, 0, 1,
-1.015633, -0.8250771, -3.946957, 1, 0.9254902, 0, 1,
-1.013783, 0.5247677, -2.223512, 1, 0.9294118, 0, 1,
-1.012704, 0.1923579, -1.415473, 1, 0.9372549, 0, 1,
-1.001155, 0.5073237, -0.03047327, 1, 0.9411765, 0, 1,
-0.990976, 0.05315192, -3.477153, 1, 0.9490196, 0, 1,
-0.9875809, -0.2618068, -2.353107, 1, 0.9529412, 0, 1,
-0.9849533, 0.2088297, -0.909171, 1, 0.9607843, 0, 1,
-0.9700477, -1.427325, -1.663475, 1, 0.9647059, 0, 1,
-0.963271, -0.506391, -1.702353, 1, 0.972549, 0, 1,
-0.9605671, 0.2663366, 0.8401068, 1, 0.9764706, 0, 1,
-0.95658, 0.5262523, -0.1119447, 1, 0.9843137, 0, 1,
-0.9564328, 0.503295, -0.5242012, 1, 0.9882353, 0, 1,
-0.949981, 0.5715598, -0.6282395, 1, 0.9960784, 0, 1,
-0.9482644, -0.2488899, -1.996871, 0.9960784, 1, 0, 1,
-0.9481142, -0.2905314, -0.01778864, 0.9921569, 1, 0, 1,
-0.942912, -2.30523, -4.289531, 0.9843137, 1, 0, 1,
-0.9399831, -1.562833, -0.249123, 0.9803922, 1, 0, 1,
-0.9390988, -0.4663267, -1.545267, 0.972549, 1, 0, 1,
-0.933934, -0.1766304, -2.013131, 0.9686275, 1, 0, 1,
-0.9299493, -0.9757497, -1.48442, 0.9607843, 1, 0, 1,
-0.9257446, -2.144999, -4.566052, 0.9568627, 1, 0, 1,
-0.9198095, -1.525611, -2.392185, 0.9490196, 1, 0, 1,
-0.8944562, 0.4254337, -1.437872, 0.945098, 1, 0, 1,
-0.8898095, -0.8532258, -1.406126, 0.9372549, 1, 0, 1,
-0.8781206, 0.7638304, -0.2856047, 0.9333333, 1, 0, 1,
-0.8687571, -0.6067194, -3.607482, 0.9254902, 1, 0, 1,
-0.8654447, 0.4427299, -1.196853, 0.9215686, 1, 0, 1,
-0.8629948, -0.7306072, -1.920051, 0.9137255, 1, 0, 1,
-0.8626261, 0.5878582, -0.6676288, 0.9098039, 1, 0, 1,
-0.8611061, -0.4995355, -2.823289, 0.9019608, 1, 0, 1,
-0.8604665, 1.523747, -1.049793, 0.8941177, 1, 0, 1,
-0.8582207, -0.1522204, -2.841613, 0.8901961, 1, 0, 1,
-0.8566837, -1.23136, -1.833, 0.8823529, 1, 0, 1,
-0.8545544, -0.3023732, -0.6959704, 0.8784314, 1, 0, 1,
-0.8537272, 1.013541, 0.2583026, 0.8705882, 1, 0, 1,
-0.8341748, 0.741625, -3.020307, 0.8666667, 1, 0, 1,
-0.8335296, -0.919691, -2.751087, 0.8588235, 1, 0, 1,
-0.8330684, -0.4429258, -1.773014, 0.854902, 1, 0, 1,
-0.8288773, -0.5814987, -1.30899, 0.8470588, 1, 0, 1,
-0.8283726, 1.845558, -0.3430801, 0.8431373, 1, 0, 1,
-0.8268373, 2.326229, -0.4161574, 0.8352941, 1, 0, 1,
-0.8249094, -1.863329, -2.616522, 0.8313726, 1, 0, 1,
-0.8229774, 0.6329722, -1.896484, 0.8235294, 1, 0, 1,
-0.8136009, -0.566098, -2.120183, 0.8196079, 1, 0, 1,
-0.8123542, -1.509649, -3.345679, 0.8117647, 1, 0, 1,
-0.8063607, -0.1688159, -1.804829, 0.8078431, 1, 0, 1,
-0.8055648, 1.165228, -0.07556012, 0.8, 1, 0, 1,
-0.7953703, -0.9596487, -4.090108, 0.7921569, 1, 0, 1,
-0.7890315, 1.944354, 0.828446, 0.7882353, 1, 0, 1,
-0.78254, -1.850455, -2.302294, 0.7803922, 1, 0, 1,
-0.7812354, -0.4379098, -1.580293, 0.7764706, 1, 0, 1,
-0.7737212, 0.7966108, -0.4423546, 0.7686275, 1, 0, 1,
-0.7678715, 0.8664391, -0.635658, 0.7647059, 1, 0, 1,
-0.7675021, 1.524571, 1.307005, 0.7568628, 1, 0, 1,
-0.7663271, -0.2945111, -1.771624, 0.7529412, 1, 0, 1,
-0.7651628, -1.006533, -1.798481, 0.7450981, 1, 0, 1,
-0.764118, -0.5568347, -1.613002, 0.7411765, 1, 0, 1,
-0.7615766, 0.6782202, 0.09503194, 0.7333333, 1, 0, 1,
-0.7615157, 0.3160721, -1.166603, 0.7294118, 1, 0, 1,
-0.7567779, -1.385682, -4.569963, 0.7215686, 1, 0, 1,
-0.7527944, -0.6141734, -0.206115, 0.7176471, 1, 0, 1,
-0.732153, 0.4133649, -2.215562, 0.7098039, 1, 0, 1,
-0.7287833, -0.3872968, -0.5809498, 0.7058824, 1, 0, 1,
-0.7243672, -0.408651, -1.714271, 0.6980392, 1, 0, 1,
-0.7138227, 0.60373, -0.5379754, 0.6901961, 1, 0, 1,
-0.7084565, 0.2064443, -2.777102, 0.6862745, 1, 0, 1,
-0.7076269, 0.1605402, -2.77428, 0.6784314, 1, 0, 1,
-0.694114, -0.7208492, -3.105766, 0.6745098, 1, 0, 1,
-0.691505, 1.273254, -0.9857528, 0.6666667, 1, 0, 1,
-0.6912041, -0.4038271, -2.996568, 0.6627451, 1, 0, 1,
-0.6905974, -0.9852639, -2.471674, 0.654902, 1, 0, 1,
-0.6904275, 0.2775034, -1.327839, 0.6509804, 1, 0, 1,
-0.6887852, -0.566803, -3.69154, 0.6431373, 1, 0, 1,
-0.6844565, 1.232104, 1.202391, 0.6392157, 1, 0, 1,
-0.684283, -0.2058866, 1.101038, 0.6313726, 1, 0, 1,
-0.6821692, -0.4318613, -3.136628, 0.627451, 1, 0, 1,
-0.6812173, 0.8300232, -1.090339, 0.6196079, 1, 0, 1,
-0.6773157, 0.3082445, -3.656477, 0.6156863, 1, 0, 1,
-0.6759888, -0.5658187, -3.52996, 0.6078432, 1, 0, 1,
-0.6741101, 1.871711, -0.9824174, 0.6039216, 1, 0, 1,
-0.6738147, -0.002138611, -2.083403, 0.5960785, 1, 0, 1,
-0.6716166, -0.9106103, -2.135721, 0.5882353, 1, 0, 1,
-0.6715093, -0.1561557, -0.7747515, 0.5843138, 1, 0, 1,
-0.6712905, 0.6701278, -0.952143, 0.5764706, 1, 0, 1,
-0.6649623, -0.3387812, -3.162263, 0.572549, 1, 0, 1,
-0.6642775, -0.6722441, -2.57809, 0.5647059, 1, 0, 1,
-0.6629804, 0.2570797, -0.790284, 0.5607843, 1, 0, 1,
-0.6627792, -1.559793, -2.092964, 0.5529412, 1, 0, 1,
-0.6562814, 0.1148284, 0.5389945, 0.5490196, 1, 0, 1,
-0.6506664, 2.145005, -1.431531, 0.5411765, 1, 0, 1,
-0.6465417, -0.1544041, -1.470471, 0.5372549, 1, 0, 1,
-0.640314, 0.5017139, -0.3060698, 0.5294118, 1, 0, 1,
-0.6397722, -0.07161837, -0.8456038, 0.5254902, 1, 0, 1,
-0.6394807, 2.042328, -0.9982544, 0.5176471, 1, 0, 1,
-0.6301957, -1.567091, -3.730125, 0.5137255, 1, 0, 1,
-0.6300551, 0.9344379, 0.451556, 0.5058824, 1, 0, 1,
-0.6274474, 1.407917, -1.127355, 0.5019608, 1, 0, 1,
-0.6264117, -0.7456686, -3.109679, 0.4941176, 1, 0, 1,
-0.6252652, -1.350175, -0.4964787, 0.4862745, 1, 0, 1,
-0.6246603, -0.6421772, -2.060416, 0.4823529, 1, 0, 1,
-0.6238859, -0.5663477, -4.595204, 0.4745098, 1, 0, 1,
-0.6226158, 1.197564, -0.7269325, 0.4705882, 1, 0, 1,
-0.6208894, 0.1438879, -0.3084467, 0.4627451, 1, 0, 1,
-0.6200782, -1.966297, -2.761508, 0.4588235, 1, 0, 1,
-0.6177118, 0.5901534, 0.5610573, 0.4509804, 1, 0, 1,
-0.6115661, 0.868965, -0.1912825, 0.4470588, 1, 0, 1,
-0.6106933, 1.118361, 0.05357348, 0.4392157, 1, 0, 1,
-0.6092733, -0.3653141, -2.750896, 0.4352941, 1, 0, 1,
-0.607537, -0.01883076, -1.065236, 0.427451, 1, 0, 1,
-0.6047798, -0.06715881, -2.401927, 0.4235294, 1, 0, 1,
-0.6033615, -0.08959154, -1.935571, 0.4156863, 1, 0, 1,
-0.5999802, 0.8017616, 0.1725415, 0.4117647, 1, 0, 1,
-0.5983108, -0.5276119, -3.550138, 0.4039216, 1, 0, 1,
-0.5958632, 0.9681428, -1.502489, 0.3960784, 1, 0, 1,
-0.5937178, 0.9966198, -2.178488, 0.3921569, 1, 0, 1,
-0.5921201, 0.1441716, -0.9794501, 0.3843137, 1, 0, 1,
-0.5901381, -0.3548572, -0.8517727, 0.3803922, 1, 0, 1,
-0.5859645, -0.6748432, -2.363744, 0.372549, 1, 0, 1,
-0.58252, -0.382031, -2.72032, 0.3686275, 1, 0, 1,
-0.5756902, 0.3918552, 0.2028475, 0.3607843, 1, 0, 1,
-0.5741145, 0.1035802, -3.747226, 0.3568628, 1, 0, 1,
-0.5729973, -0.7399271, -2.266786, 0.3490196, 1, 0, 1,
-0.5728077, 1.736668, 0.4475393, 0.345098, 1, 0, 1,
-0.5715145, -0.7129132, -5.613375, 0.3372549, 1, 0, 1,
-0.570951, 1.564222, 0.8512433, 0.3333333, 1, 0, 1,
-0.5651274, 0.4141067, -0.7959468, 0.3254902, 1, 0, 1,
-0.5620193, 1.795953, 0.841747, 0.3215686, 1, 0, 1,
-0.5615759, -2.344941, -3.955401, 0.3137255, 1, 0, 1,
-0.5612891, 0.73184, -0.7244949, 0.3098039, 1, 0, 1,
-0.5576509, 0.2232925, -2.022364, 0.3019608, 1, 0, 1,
-0.5574962, -0.5321733, -2.889293, 0.2941177, 1, 0, 1,
-0.556792, -0.5727316, -3.167287, 0.2901961, 1, 0, 1,
-0.554801, -0.7373915, -2.360596, 0.282353, 1, 0, 1,
-0.5505148, -1.251721, -2.365146, 0.2784314, 1, 0, 1,
-0.5478884, -0.2600821, -0.8075742, 0.2705882, 1, 0, 1,
-0.547726, 1.016066, -1.136919, 0.2666667, 1, 0, 1,
-0.5420787, -1.279349, -4.626505, 0.2588235, 1, 0, 1,
-0.5419005, 0.6850228, -0.06518001, 0.254902, 1, 0, 1,
-0.5373347, 2.474602, 0.6213914, 0.2470588, 1, 0, 1,
-0.5332823, -0.2202336, -1.873005, 0.2431373, 1, 0, 1,
-0.5321814, 0.9111878, 1.509887, 0.2352941, 1, 0, 1,
-0.5241706, -0.3682587, -2.019027, 0.2313726, 1, 0, 1,
-0.521741, 0.8954273, -0.411233, 0.2235294, 1, 0, 1,
-0.5188897, -0.4853319, -2.646313, 0.2196078, 1, 0, 1,
-0.5180156, -0.4092762, -2.689743, 0.2117647, 1, 0, 1,
-0.5179071, -2.706631, -1.972029, 0.2078431, 1, 0, 1,
-0.5156884, 1.315678, -0.5076188, 0.2, 1, 0, 1,
-0.5152318, -1.306165, -2.831001, 0.1921569, 1, 0, 1,
-0.5148523, -1.164373, -1.430148, 0.1882353, 1, 0, 1,
-0.5131574, -0.9643859, -1.967427, 0.1803922, 1, 0, 1,
-0.5034063, -0.7051691, -2.808177, 0.1764706, 1, 0, 1,
-0.502862, -0.5650474, -1.578351, 0.1686275, 1, 0, 1,
-0.5004331, 1.598556, -0.1350334, 0.1647059, 1, 0, 1,
-0.4958892, -0.8972778, -0.8592389, 0.1568628, 1, 0, 1,
-0.4955892, 0.2605734, -4.264305, 0.1529412, 1, 0, 1,
-0.489058, 1.259933, 0.4084793, 0.145098, 1, 0, 1,
-0.4878527, -1.922943, -1.213359, 0.1411765, 1, 0, 1,
-0.4854987, 0.2328916, -1.028281, 0.1333333, 1, 0, 1,
-0.4824681, -1.472392, -2.250407, 0.1294118, 1, 0, 1,
-0.478949, 1.270217, -2.052475, 0.1215686, 1, 0, 1,
-0.4781199, -0.8364505, -1.394328, 0.1176471, 1, 0, 1,
-0.4766913, -0.5439231, -1.073907, 0.1098039, 1, 0, 1,
-0.4753223, 1.809317, -1.405946, 0.1058824, 1, 0, 1,
-0.4730321, -0.3729363, -2.149132, 0.09803922, 1, 0, 1,
-0.4710352, 1.11851, -3.012207, 0.09019608, 1, 0, 1,
-0.4687709, 0.3716247, -1.199408, 0.08627451, 1, 0, 1,
-0.4673727, -0.07489423, -0.7142694, 0.07843138, 1, 0, 1,
-0.4621159, -0.9483036, -1.663498, 0.07450981, 1, 0, 1,
-0.4567902, -1.12127, -4.07388, 0.06666667, 1, 0, 1,
-0.4552141, -0.1177057, -3.323692, 0.0627451, 1, 0, 1,
-0.4516128, -0.6567945, -2.723921, 0.05490196, 1, 0, 1,
-0.4470267, 0.2028111, -0.1573169, 0.05098039, 1, 0, 1,
-0.4428032, 1.303801, -1.02591, 0.04313726, 1, 0, 1,
-0.4409696, -0.7965015, -3.557025, 0.03921569, 1, 0, 1,
-0.4308234, 0.485339, 0.4912004, 0.03137255, 1, 0, 1,
-0.4266822, 1.560412, -1.639508, 0.02745098, 1, 0, 1,
-0.416771, -0.166342, -2.644779, 0.01960784, 1, 0, 1,
-0.4137411, 1.169292, -2.007187, 0.01568628, 1, 0, 1,
-0.412961, 0.5549923, 0.1547967, 0.007843138, 1, 0, 1,
-0.4126326, 0.02689827, -2.19917, 0.003921569, 1, 0, 1,
-0.4115831, -0.7889163, -4.099325, 0, 1, 0.003921569, 1,
-0.4029485, -0.2010874, -1.69209, 0, 1, 0.01176471, 1,
-0.3953139, -0.7527681, -4.471038, 0, 1, 0.01568628, 1,
-0.3936926, -1.67429, -2.397666, 0, 1, 0.02352941, 1,
-0.3918577, -0.7894018, -3.079522, 0, 1, 0.02745098, 1,
-0.3915034, 0.3763209, -1.349039, 0, 1, 0.03529412, 1,
-0.389455, -0.1618701, -1.506161, 0, 1, 0.03921569, 1,
-0.3874962, 0.170479, -1.270643, 0, 1, 0.04705882, 1,
-0.384067, 1.803416, -1.129618, 0, 1, 0.05098039, 1,
-0.3821736, 0.774211, -1.380861, 0, 1, 0.05882353, 1,
-0.3806096, -0.02147796, -0.2417948, 0, 1, 0.0627451, 1,
-0.3764245, 1.385298, -0.8980545, 0, 1, 0.07058824, 1,
-0.3699892, 0.6662145, 0.08194393, 0, 1, 0.07450981, 1,
-0.3699757, -0.6697109, -2.403109, 0, 1, 0.08235294, 1,
-0.3680777, 0.3073807, -0.7945008, 0, 1, 0.08627451, 1,
-0.365352, -0.09351541, -2.228068, 0, 1, 0.09411765, 1,
-0.3635568, -0.02586759, -1.305076, 0, 1, 0.1019608, 1,
-0.358384, -1.41874, -2.97973, 0, 1, 0.1058824, 1,
-0.3551316, 0.1705827, -0.5229049, 0, 1, 0.1137255, 1,
-0.3456284, 0.6065758, -2.498476, 0, 1, 0.1176471, 1,
-0.3420461, 1.256877, -0.6376156, 0, 1, 0.1254902, 1,
-0.3387783, -1.737977, -2.690749, 0, 1, 0.1294118, 1,
-0.3320108, -0.2603923, -2.964287, 0, 1, 0.1372549, 1,
-0.3318967, 1.832956, -1.08235, 0, 1, 0.1411765, 1,
-0.3315367, -0.7393016, -2.083113, 0, 1, 0.1490196, 1,
-0.3263128, -0.04187094, -1.014809, 0, 1, 0.1529412, 1,
-0.3246222, 0.4292448, -1.036823, 0, 1, 0.1607843, 1,
-0.3229294, -0.09596479, -1.977865, 0, 1, 0.1647059, 1,
-0.3225883, 0.657895, -1.175149, 0, 1, 0.172549, 1,
-0.3157401, -0.5026646, -2.160111, 0, 1, 0.1764706, 1,
-0.3102774, -0.199497, -1.307432, 0, 1, 0.1843137, 1,
-0.3052928, 0.5165787, 0.01767565, 0, 1, 0.1882353, 1,
-0.3037967, -0.6912928, -1.423216, 0, 1, 0.1960784, 1,
-0.2937746, 0.1120236, -0.02270645, 0, 1, 0.2039216, 1,
-0.2927035, 1.592167, -0.3924765, 0, 1, 0.2078431, 1,
-0.2895557, -2.922191, -2.352774, 0, 1, 0.2156863, 1,
-0.288326, -1.819553, -0.7464335, 0, 1, 0.2196078, 1,
-0.2879169, 0.5692728, -1.007863, 0, 1, 0.227451, 1,
-0.284689, 1.500728, 0.3498715, 0, 1, 0.2313726, 1,
-0.2833655, 0.0474817, -1.501153, 0, 1, 0.2392157, 1,
-0.2819802, 0.8027986, -0.0971345, 0, 1, 0.2431373, 1,
-0.2798852, 1.054206, 0.4283634, 0, 1, 0.2509804, 1,
-0.2797419, 0.8444279, 1.587265, 0, 1, 0.254902, 1,
-0.2734337, 1.010879, 0.3854215, 0, 1, 0.2627451, 1,
-0.2680756, -0.7303986, -2.47633, 0, 1, 0.2666667, 1,
-0.2630536, 0.5147204, -0.1075114, 0, 1, 0.2745098, 1,
-0.2610525, -0.07630014, -3.861321, 0, 1, 0.2784314, 1,
-0.2589047, 1.314308, -0.557326, 0, 1, 0.2862745, 1,
-0.2570995, -1.427924, -3.327323, 0, 1, 0.2901961, 1,
-0.2449138, -1.607201, -1.488269, 0, 1, 0.2980392, 1,
-0.2416598, -1.34196, -0.9980769, 0, 1, 0.3058824, 1,
-0.2412755, 1.748336, -0.9598717, 0, 1, 0.3098039, 1,
-0.2394232, -0.3432037, -2.601161, 0, 1, 0.3176471, 1,
-0.2388293, -0.01136652, -2.507246, 0, 1, 0.3215686, 1,
-0.2368889, 0.4212711, 2.11698, 0, 1, 0.3294118, 1,
-0.2323888, -0.8891654, -2.329804, 0, 1, 0.3333333, 1,
-0.228726, -1.573605, -4.311683, 0, 1, 0.3411765, 1,
-0.2240518, 1.601122, -1.855929, 0, 1, 0.345098, 1,
-0.222977, -0.914849, -1.515808, 0, 1, 0.3529412, 1,
-0.2212804, 0.1399107, -0.7079795, 0, 1, 0.3568628, 1,
-0.2201895, 1.834221, -0.4457429, 0, 1, 0.3647059, 1,
-0.214322, -0.6738797, -1.648456, 0, 1, 0.3686275, 1,
-0.2137234, 1.057544, 1.620347, 0, 1, 0.3764706, 1,
-0.2116859, -0.250865, -2.391388, 0, 1, 0.3803922, 1,
-0.2079972, 0.02488296, -2.618753, 0, 1, 0.3882353, 1,
-0.2019747, 0.5247396, -2.064605, 0, 1, 0.3921569, 1,
-0.2008258, 2.24794, -1.634097, 0, 1, 0.4, 1,
-0.198332, 1.034905, -0.3150027, 0, 1, 0.4078431, 1,
-0.195272, 1.58048, 0.5119179, 0, 1, 0.4117647, 1,
-0.1911059, 0.1075983, 0.7040569, 0, 1, 0.4196078, 1,
-0.1848298, -0.1684868, -0.6734777, 0, 1, 0.4235294, 1,
-0.1846518, -0.08663242, -1.73426, 0, 1, 0.4313726, 1,
-0.1831762, -0.5858467, -2.272498, 0, 1, 0.4352941, 1,
-0.1827089, 0.9010805, 0.1409058, 0, 1, 0.4431373, 1,
-0.1819677, 0.3252059, -0.8307418, 0, 1, 0.4470588, 1,
-0.1808283, 0.03107912, -0.3819586, 0, 1, 0.454902, 1,
-0.1806274, -0.4934559, -1.727039, 0, 1, 0.4588235, 1,
-0.1794894, 0.6615936, 1.142924, 0, 1, 0.4666667, 1,
-0.1760948, 0.2329386, 1.09042, 0, 1, 0.4705882, 1,
-0.1693678, -0.8957016, -3.336409, 0, 1, 0.4784314, 1,
-0.1675729, 0.902915, 1.466566, 0, 1, 0.4823529, 1,
-0.1673405, -1.117746, -3.97345, 0, 1, 0.4901961, 1,
-0.1668999, 0.5756493, -1.453192, 0, 1, 0.4941176, 1,
-0.1657259, 1.421021, -0.7238697, 0, 1, 0.5019608, 1,
-0.1633744, 0.9013326, -0.2298104, 0, 1, 0.509804, 1,
-0.1617579, 1.629963, 0.0612575, 0, 1, 0.5137255, 1,
-0.158494, 0.9712569, -0.7120467, 0, 1, 0.5215687, 1,
-0.1570641, 0.1745055, -1.398222, 0, 1, 0.5254902, 1,
-0.1551924, 0.131764, -1.088476, 0, 1, 0.5333334, 1,
-0.1532338, -0.417128, -4.138911, 0, 1, 0.5372549, 1,
-0.1492698, 0.412298, -2.090886, 0, 1, 0.5450981, 1,
-0.1483781, -0.301871, -3.686435, 0, 1, 0.5490196, 1,
-0.1470598, -0.06999271, -3.169261, 0, 1, 0.5568628, 1,
-0.1458791, 0.1439429, -0.4675072, 0, 1, 0.5607843, 1,
-0.1448242, -0.1014008, -2.859345, 0, 1, 0.5686275, 1,
-0.1439613, 0.2090479, -1.572552, 0, 1, 0.572549, 1,
-0.1413607, 0.6311527, 1.089532, 0, 1, 0.5803922, 1,
-0.1403123, -0.5107489, -3.785605, 0, 1, 0.5843138, 1,
-0.1381988, -2.075313, -3.322316, 0, 1, 0.5921569, 1,
-0.1359479, 0.8675433, -0.3254578, 0, 1, 0.5960785, 1,
-0.1235103, 1.110601, 2.208337, 0, 1, 0.6039216, 1,
-0.121235, -1.187575, -4.055203, 0, 1, 0.6117647, 1,
-0.1176418, -1.035598, -4.321174, 0, 1, 0.6156863, 1,
-0.1127048, 1.105701, 0.3097175, 0, 1, 0.6235294, 1,
-0.1122467, -1.077733, -2.363844, 0, 1, 0.627451, 1,
-0.110651, -0.6761358, -3.739062, 0, 1, 0.6352941, 1,
-0.1073536, 1.334186, -0.6601151, 0, 1, 0.6392157, 1,
-0.09960001, -0.5531825, -2.67951, 0, 1, 0.6470588, 1,
-0.09513298, -0.8089164, -3.492867, 0, 1, 0.6509804, 1,
-0.09019025, 0.8489753, 0.008822154, 0, 1, 0.6588235, 1,
-0.08664812, -0.1339471, -1.680698, 0, 1, 0.6627451, 1,
-0.08640886, -0.04108829, -1.887829, 0, 1, 0.6705883, 1,
-0.08190142, 0.7780014, -2.575647, 0, 1, 0.6745098, 1,
-0.07311966, 0.8974229, 0.5058468, 0, 1, 0.682353, 1,
-0.06446969, -1.329881, -2.430268, 0, 1, 0.6862745, 1,
-0.05277592, -1.693398, -3.65597, 0, 1, 0.6941177, 1,
-0.04861435, -2.140413, -3.355183, 0, 1, 0.7019608, 1,
-0.04784977, -0.1549483, -0.2212594, 0, 1, 0.7058824, 1,
-0.04774912, -0.4215345, -1.493924, 0, 1, 0.7137255, 1,
-0.04723277, 0.3245124, -0.2972782, 0, 1, 0.7176471, 1,
-0.04665446, -0.4184485, -2.708634, 0, 1, 0.7254902, 1,
-0.04577951, 1.153583, -1.321378, 0, 1, 0.7294118, 1,
-0.04472232, 1.603912, -1.845447, 0, 1, 0.7372549, 1,
-0.04146479, 0.1511013, 0.561844, 0, 1, 0.7411765, 1,
-0.03994351, -0.9994051, -4.489067, 0, 1, 0.7490196, 1,
-0.03381835, -0.4897972, -3.19646, 0, 1, 0.7529412, 1,
-0.03312216, 0.1266394, -0.3192949, 0, 1, 0.7607843, 1,
-0.03143403, 1.214436, -0.4350097, 0, 1, 0.7647059, 1,
-0.02652418, -0.4736369, -3.512345, 0, 1, 0.772549, 1,
-0.02277895, 0.1186317, 0.4788596, 0, 1, 0.7764706, 1,
-0.01806012, 0.7466462, -0.08609679, 0, 1, 0.7843137, 1,
-0.0168952, -1.076356, -3.926462, 0, 1, 0.7882353, 1,
-0.01579843, -1.04439, -5.025824, 0, 1, 0.7960784, 1,
-0.01208992, -0.9662221, -4.204494, 0, 1, 0.8039216, 1,
-0.008057576, 0.8472292, -0.3841868, 0, 1, 0.8078431, 1,
-0.005907811, 2.513942, 0.2258978, 0, 1, 0.8156863, 1,
-0.003511345, 0.2086584, -0.643117, 0, 1, 0.8196079, 1,
-0.0006765586, 1.215608, 0.7552716, 0, 1, 0.827451, 1,
-0.0004871617, 1.472157, -0.4315594, 0, 1, 0.8313726, 1,
0.001886413, -0.922542, 2.683812, 0, 1, 0.8392157, 1,
0.001977552, 0.5407834, -0.7582259, 0, 1, 0.8431373, 1,
0.002097276, 3.705844, -0.6375158, 0, 1, 0.8509804, 1,
0.007931788, 0.5393839, 0.723639, 0, 1, 0.854902, 1,
0.01105446, 0.2251183, -0.5787023, 0, 1, 0.8627451, 1,
0.01221765, -0.02057555, 2.887764, 0, 1, 0.8666667, 1,
0.01296779, -1.148794, 3.088741, 0, 1, 0.8745098, 1,
0.0158161, -0.1789546, 3.988271, 0, 1, 0.8784314, 1,
0.02065801, -1.164535, 3.132307, 0, 1, 0.8862745, 1,
0.02192988, 0.4802048, -1.61405, 0, 1, 0.8901961, 1,
0.02647635, 0.7217607, -0.5668223, 0, 1, 0.8980392, 1,
0.02654699, -0.4715123, 3.474161, 0, 1, 0.9058824, 1,
0.02842612, 0.3413067, 1.459915, 0, 1, 0.9098039, 1,
0.04022699, 0.6514325, -0.9996238, 0, 1, 0.9176471, 1,
0.04542505, -1.218475, 2.279553, 0, 1, 0.9215686, 1,
0.04561884, 0.04355116, 0.4945522, 0, 1, 0.9294118, 1,
0.0473565, 0.5293694, -0.002473747, 0, 1, 0.9333333, 1,
0.04744782, 1.979798, -1.228153, 0, 1, 0.9411765, 1,
0.05258222, 1.661154, 1.915576, 0, 1, 0.945098, 1,
0.05352665, 0.1519392, 1.051529, 0, 1, 0.9529412, 1,
0.05400464, 0.8172301, -2.222845, 0, 1, 0.9568627, 1,
0.059609, 0.4180623, -0.2339433, 0, 1, 0.9647059, 1,
0.05962589, -1.625135, 2.860522, 0, 1, 0.9686275, 1,
0.06381549, -2.497501, 3.208993, 0, 1, 0.9764706, 1,
0.06586655, 0.1685694, 0.8686079, 0, 1, 0.9803922, 1,
0.06723332, 0.3628674, -0.2369636, 0, 1, 0.9882353, 1,
0.06854262, 0.6485207, 0.8554857, 0, 1, 0.9921569, 1,
0.06959354, 0.195217, 0.9298668, 0, 1, 1, 1,
0.07311507, 0.902193, 1.113433, 0, 0.9921569, 1, 1,
0.07370137, 0.8753418, -1.40576, 0, 0.9882353, 1, 1,
0.07814854, -0.5231016, 2.818792, 0, 0.9803922, 1, 1,
0.07874603, 0.9849866, 0.6258681, 0, 0.9764706, 1, 1,
0.0809039, -0.9075195, 3.851133, 0, 0.9686275, 1, 1,
0.0809516, -1.666974, 3.360369, 0, 0.9647059, 1, 1,
0.081554, 0.1457057, 0.9764387, 0, 0.9568627, 1, 1,
0.08165898, 0.1209332, 1.618973, 0, 0.9529412, 1, 1,
0.08179252, -1.251579, 4.036847, 0, 0.945098, 1, 1,
0.08199573, 0.7379146, -1.025418, 0, 0.9411765, 1, 1,
0.08463838, 0.4561845, 1.067278, 0, 0.9333333, 1, 1,
0.08590256, -0.6481559, 3.426199, 0, 0.9294118, 1, 1,
0.08790343, 0.2097458, -0.1374692, 0, 0.9215686, 1, 1,
0.09308261, -0.4720069, 2.972693, 0, 0.9176471, 1, 1,
0.09402873, -0.8452277, 2.601361, 0, 0.9098039, 1, 1,
0.0945349, -0.9184839, 3.395801, 0, 0.9058824, 1, 1,
0.09546039, -1.451064, 2.173704, 0, 0.8980392, 1, 1,
0.09904709, -2.056415, 3.791097, 0, 0.8901961, 1, 1,
0.09927066, 0.8037617, 0.466727, 0, 0.8862745, 1, 1,
0.1004053, -0.1150754, 2.043042, 0, 0.8784314, 1, 1,
0.1024911, -0.7846779, 2.396831, 0, 0.8745098, 1, 1,
0.1040302, 1.26483, -0.6536756, 0, 0.8666667, 1, 1,
0.1067505, 1.918919, -1.079497, 0, 0.8627451, 1, 1,
0.1088154, 0.3115264, 0.5341404, 0, 0.854902, 1, 1,
0.1094231, -0.2488268, 3.661411, 0, 0.8509804, 1, 1,
0.1108216, 0.9135951, -1.430953, 0, 0.8431373, 1, 1,
0.1112236, -0.9546429, 3.521592, 0, 0.8392157, 1, 1,
0.1129123, 0.3060217, 0.09636236, 0, 0.8313726, 1, 1,
0.1195599, 0.7952884, -1.106704, 0, 0.827451, 1, 1,
0.1204871, 0.1493359, -0.6957949, 0, 0.8196079, 1, 1,
0.1215167, 0.127109, 0.3118725, 0, 0.8156863, 1, 1,
0.1229118, -0.9365966, 1.587259, 0, 0.8078431, 1, 1,
0.1249186, -0.1495795, 3.895033, 0, 0.8039216, 1, 1,
0.1282306, 0.6366848, -0.3141138, 0, 0.7960784, 1, 1,
0.1298455, -2.880526, 2.964565, 0, 0.7882353, 1, 1,
0.1323823, 0.08159642, 1.764273, 0, 0.7843137, 1, 1,
0.1347055, 0.3831258, 0.2041794, 0, 0.7764706, 1, 1,
0.1393694, 0.758609, 0.3911281, 0, 0.772549, 1, 1,
0.1464016, 0.5067232, 0.02601845, 0, 0.7647059, 1, 1,
0.148447, 0.9992613, -0.08621496, 0, 0.7607843, 1, 1,
0.1486924, 0.2776101, 2.208541, 0, 0.7529412, 1, 1,
0.1523539, -0.8232045, 2.618076, 0, 0.7490196, 1, 1,
0.1531107, -0.3626371, 5.205733, 0, 0.7411765, 1, 1,
0.1574218, 0.5824555, -0.2264339, 0, 0.7372549, 1, 1,
0.1596963, 1.026674, 0.8826978, 0, 0.7294118, 1, 1,
0.1598586, 0.8543965, 1.078794, 0, 0.7254902, 1, 1,
0.1630159, 1.281143, 1.269704, 0, 0.7176471, 1, 1,
0.1634123, 1.362269, -0.372755, 0, 0.7137255, 1, 1,
0.1641905, 0.8344838, -0.7321554, 0, 0.7058824, 1, 1,
0.1656364, -1.434783, 3.965894, 0, 0.6980392, 1, 1,
0.1657371, -0.149326, 1.988632, 0, 0.6941177, 1, 1,
0.1665794, -0.03553553, 4.060087, 0, 0.6862745, 1, 1,
0.1674274, 0.5171827, -0.5121192, 0, 0.682353, 1, 1,
0.1698586, 0.2619051, 1.357845, 0, 0.6745098, 1, 1,
0.1699459, 1.442338, -0.4302323, 0, 0.6705883, 1, 1,
0.1734546, -0.5602532, 3.267815, 0, 0.6627451, 1, 1,
0.1746112, -1.523732, 2.027545, 0, 0.6588235, 1, 1,
0.178156, 0.8057356, 1.591713, 0, 0.6509804, 1, 1,
0.1917259, -0.7475357, 3.443561, 0, 0.6470588, 1, 1,
0.1923566, -0.8977066, 3.31028, 0, 0.6392157, 1, 1,
0.1930692, -1.657758, 3.191685, 0, 0.6352941, 1, 1,
0.1937666, 0.04200852, 1.764007, 0, 0.627451, 1, 1,
0.1999265, -0.6029476, 2.879746, 0, 0.6235294, 1, 1,
0.207651, -0.07957787, 2.09247, 0, 0.6156863, 1, 1,
0.2081364, -0.4801977, 2.304758, 0, 0.6117647, 1, 1,
0.2086663, 0.5610215, 0.6034604, 0, 0.6039216, 1, 1,
0.2105182, -0.5294718, 3.736652, 0, 0.5960785, 1, 1,
0.2143312, -1.830302, 2.130018, 0, 0.5921569, 1, 1,
0.2192085, -0.553027, 3.543242, 0, 0.5843138, 1, 1,
0.2215679, -0.2042, 1.34721, 0, 0.5803922, 1, 1,
0.2306899, -0.3028211, 1.96366, 0, 0.572549, 1, 1,
0.2335274, 0.7970957, 0.4466152, 0, 0.5686275, 1, 1,
0.2348877, 0.5869631, 0.3078623, 0, 0.5607843, 1, 1,
0.2361486, -0.2249621, 0.325646, 0, 0.5568628, 1, 1,
0.2372136, -0.3964677, -0.19707, 0, 0.5490196, 1, 1,
0.2396693, 0.7340561, 2.263768, 0, 0.5450981, 1, 1,
0.2397307, 0.6575513, 1.59946, 0, 0.5372549, 1, 1,
0.2398658, 0.2320707, 0.8460788, 0, 0.5333334, 1, 1,
0.24177, 1.745454, 1.23113, 0, 0.5254902, 1, 1,
0.2448206, -0.4283106, 2.378273, 0, 0.5215687, 1, 1,
0.245651, -2.071903, 5.622282, 0, 0.5137255, 1, 1,
0.2502391, -1.519229, 3.337887, 0, 0.509804, 1, 1,
0.2515886, 0.2976484, 0.4963461, 0, 0.5019608, 1, 1,
0.2525656, 0.9813228, -0.3670081, 0, 0.4941176, 1, 1,
0.2532151, 1.408667, 0.5351548, 0, 0.4901961, 1, 1,
0.2586839, 0.3762955, 0.6589141, 0, 0.4823529, 1, 1,
0.2612258, -0.5678608, 2.228879, 0, 0.4784314, 1, 1,
0.2646443, -1.345831, 3.238007, 0, 0.4705882, 1, 1,
0.26488, -0.1440036, 0.6297286, 0, 0.4666667, 1, 1,
0.2670894, -0.09025244, 1.218891, 0, 0.4588235, 1, 1,
0.2677695, 1.150832, -0.7211127, 0, 0.454902, 1, 1,
0.2692444, -0.6442742, 1.640268, 0, 0.4470588, 1, 1,
0.2708596, 1.478377, 0.398415, 0, 0.4431373, 1, 1,
0.2735708, -0.01280815, 1.959572, 0, 0.4352941, 1, 1,
0.2737641, 0.9933861, -0.295455, 0, 0.4313726, 1, 1,
0.2761951, 0.2598836, -0.3498773, 0, 0.4235294, 1, 1,
0.2772121, -0.2190155, 2.629243, 0, 0.4196078, 1, 1,
0.2796605, 0.2618794, 1.293799, 0, 0.4117647, 1, 1,
0.2818449, -0.5254849, 1.102494, 0, 0.4078431, 1, 1,
0.281893, -0.1949914, 2.305475, 0, 0.4, 1, 1,
0.2842138, 1.377685, 0.04807476, 0, 0.3921569, 1, 1,
0.2914118, 0.1617595, 1.787184, 0, 0.3882353, 1, 1,
0.2914152, -0.7193827, 3.748055, 0, 0.3803922, 1, 1,
0.2983603, 1.442428, 0.9836855, 0, 0.3764706, 1, 1,
0.3018009, 0.8298731, 0.5167155, 0, 0.3686275, 1, 1,
0.3028137, -0.94783, 2.683596, 0, 0.3647059, 1, 1,
0.3053015, 0.7046714, 0.8140446, 0, 0.3568628, 1, 1,
0.308388, -1.041181, 2.221348, 0, 0.3529412, 1, 1,
0.3107762, 0.334336, 2.450144, 0, 0.345098, 1, 1,
0.311931, 1.392999, 0.6758169, 0, 0.3411765, 1, 1,
0.3165298, 0.195375, 2.600817, 0, 0.3333333, 1, 1,
0.3188544, -1.791712, 3.21544, 0, 0.3294118, 1, 1,
0.3197551, -0.006174142, 2.101944, 0, 0.3215686, 1, 1,
0.3233405, 0.4416698, 1.027947, 0, 0.3176471, 1, 1,
0.327091, -0.1772354, 1.35466, 0, 0.3098039, 1, 1,
0.333256, -0.01963129, 2.441674, 0, 0.3058824, 1, 1,
0.3383836, -0.6948227, 1.832087, 0, 0.2980392, 1, 1,
0.3434131, 1.275513, -0.03618905, 0, 0.2901961, 1, 1,
0.344257, -0.4038416, 2.756077, 0, 0.2862745, 1, 1,
0.3454138, 0.03165243, 2.552962, 0, 0.2784314, 1, 1,
0.3493716, -0.0402141, -0.0359339, 0, 0.2745098, 1, 1,
0.3511187, 0.3126732, 1.671152, 0, 0.2666667, 1, 1,
0.3535113, -0.3589638, 2.117895, 0, 0.2627451, 1, 1,
0.3572624, 1.164073, 1.113698, 0, 0.254902, 1, 1,
0.3579746, 0.1855685, 1.185971, 0, 0.2509804, 1, 1,
0.3651036, -0.3322608, 4.433531, 0, 0.2431373, 1, 1,
0.3709309, 0.2732858, 1.963129, 0, 0.2392157, 1, 1,
0.3712666, 0.5941833, 0.8061816, 0, 0.2313726, 1, 1,
0.3714727, -0.3244314, 2.049341, 0, 0.227451, 1, 1,
0.3764258, 0.1335214, 1.513076, 0, 0.2196078, 1, 1,
0.3786205, -0.3977195, 2.367652, 0, 0.2156863, 1, 1,
0.3830931, -0.5614611, 2.511595, 0, 0.2078431, 1, 1,
0.3841896, -0.01443549, 1.626076, 0, 0.2039216, 1, 1,
0.384509, 0.3495267, 0.003001522, 0, 0.1960784, 1, 1,
0.3848288, -1.182079, 2.409665, 0, 0.1882353, 1, 1,
0.3870289, 0.9172518, -0.7564373, 0, 0.1843137, 1, 1,
0.3872151, -0.3711341, 3.34113, 0, 0.1764706, 1, 1,
0.3906927, 0.4848565, -0.1192876, 0, 0.172549, 1, 1,
0.3954871, -0.08236211, 3.123402, 0, 0.1647059, 1, 1,
0.3961111, 0.7555904, 0.9162738, 0, 0.1607843, 1, 1,
0.3972106, -1.069639, 4.844035, 0, 0.1529412, 1, 1,
0.4049174, 0.9401678, 0.14747, 0, 0.1490196, 1, 1,
0.4051915, -2.160186, 4.248827, 0, 0.1411765, 1, 1,
0.4053191, 0.02823874, 1.19877, 0, 0.1372549, 1, 1,
0.4062077, 0.339435, 2.19559, 0, 0.1294118, 1, 1,
0.4125558, 0.06475195, 0.4662944, 0, 0.1254902, 1, 1,
0.4168086, 1.132891, -1.44352, 0, 0.1176471, 1, 1,
0.4172608, -0.2328423, 2.843982, 0, 0.1137255, 1, 1,
0.4175409, 0.04166513, 1.243691, 0, 0.1058824, 1, 1,
0.4204744, -0.9121546, 2.249337, 0, 0.09803922, 1, 1,
0.4269625, -0.09577662, 1.151024, 0, 0.09411765, 1, 1,
0.4277396, 2.281368, -0.4494019, 0, 0.08627451, 1, 1,
0.4336122, -1.624047, 1.841003, 0, 0.08235294, 1, 1,
0.4340797, -1.198865, 2.893238, 0, 0.07450981, 1, 1,
0.4346284, 0.2915772, 0.7408314, 0, 0.07058824, 1, 1,
0.4435412, -1.406282, 0.6279225, 0, 0.0627451, 1, 1,
0.4458219, -0.9915707, -0.04278374, 0, 0.05882353, 1, 1,
0.4485731, 0.2079576, 2.639831, 0, 0.05098039, 1, 1,
0.4494151, 0.1976535, 2.435664, 0, 0.04705882, 1, 1,
0.4534704, 0.840663, 1.521462, 0, 0.03921569, 1, 1,
0.4535322, 0.06494609, 1.469729, 0, 0.03529412, 1, 1,
0.4549763, -0.800694, 2.641076, 0, 0.02745098, 1, 1,
0.4579129, -0.4393252, 0.5790043, 0, 0.02352941, 1, 1,
0.4648254, -0.6688001, 2.497573, 0, 0.01568628, 1, 1,
0.4662675, 0.8655093, 0.0294387, 0, 0.01176471, 1, 1,
0.4665478, -1.89001, 2.963758, 0, 0.003921569, 1, 1,
0.469501, -0.4927012, 2.982297, 0.003921569, 0, 1, 1,
0.4754154, -0.4663762, 2.895294, 0.007843138, 0, 1, 1,
0.4764646, -0.7482061, 1.90704, 0.01568628, 0, 1, 1,
0.4846183, -1.515268, 3.073149, 0.01960784, 0, 1, 1,
0.4915606, -0.974303, 2.30384, 0.02745098, 0, 1, 1,
0.4917642, 0.1475065, 1.602566, 0.03137255, 0, 1, 1,
0.4917944, 0.3173308, 1.348544, 0.03921569, 0, 1, 1,
0.492277, -0.7083142, 3.951179, 0.04313726, 0, 1, 1,
0.4945941, 0.3616676, 2.587879, 0.05098039, 0, 1, 1,
0.49479, 2.08549, -1.924053, 0.05490196, 0, 1, 1,
0.4952885, -1.847969, 1.173818, 0.0627451, 0, 1, 1,
0.496033, -0.6927945, 1.9209, 0.06666667, 0, 1, 1,
0.5012619, 1.674378, 1.488628, 0.07450981, 0, 1, 1,
0.5037425, -0.09547189, 1.228327, 0.07843138, 0, 1, 1,
0.5040648, 2.578797, 0.08000837, 0.08627451, 0, 1, 1,
0.5071937, 0.8725538, 0.4968352, 0.09019608, 0, 1, 1,
0.5102221, 0.6335011, 1.943046, 0.09803922, 0, 1, 1,
0.5152, -0.4312401, 2.448698, 0.1058824, 0, 1, 1,
0.515517, 1.008396, 0.2141847, 0.1098039, 0, 1, 1,
0.5237106, -1.340009, 2.606497, 0.1176471, 0, 1, 1,
0.5252944, 0.7575499, 0.9939278, 0.1215686, 0, 1, 1,
0.5291275, -1.304219, 2.133384, 0.1294118, 0, 1, 1,
0.5316323, 1.633765, -1.243741, 0.1333333, 0, 1, 1,
0.5371795, -1.33669, 3.619309, 0.1411765, 0, 1, 1,
0.541391, -0.5911919, 3.266564, 0.145098, 0, 1, 1,
0.5446591, -0.9177898, 3.201453, 0.1529412, 0, 1, 1,
0.5450732, -0.5716516, 2.333807, 0.1568628, 0, 1, 1,
0.5451285, 1.251039, 1.206967, 0.1647059, 0, 1, 1,
0.5481504, 0.8819287, -0.525277, 0.1686275, 0, 1, 1,
0.5514681, -2.154817, 2.44731, 0.1764706, 0, 1, 1,
0.5627375, 0.8300343, -0.7977518, 0.1803922, 0, 1, 1,
0.5642523, 0.5176016, 1.735774, 0.1882353, 0, 1, 1,
0.5673278, 1.10596, -0.2915671, 0.1921569, 0, 1, 1,
0.569123, 0.8400822, -0.3965263, 0.2, 0, 1, 1,
0.571305, 0.2422132, 1.173239, 0.2078431, 0, 1, 1,
0.572381, -1.677058, 3.983129, 0.2117647, 0, 1, 1,
0.5730877, 0.004820413, 0.8225845, 0.2196078, 0, 1, 1,
0.5741673, 1.147546, 1.201857, 0.2235294, 0, 1, 1,
0.5742779, 0.8112818, 1.408661, 0.2313726, 0, 1, 1,
0.5789925, 0.6626832, -0.3418235, 0.2352941, 0, 1, 1,
0.5804473, -1.625619, 3.740611, 0.2431373, 0, 1, 1,
0.5815729, 0.3728516, 0.09517681, 0.2470588, 0, 1, 1,
0.5820155, 0.524821, 1.692583, 0.254902, 0, 1, 1,
0.582812, 0.9700488, 1.390575, 0.2588235, 0, 1, 1,
0.5848363, -0.8155541, 3.424882, 0.2666667, 0, 1, 1,
0.5864428, 0.1135191, 1.904706, 0.2705882, 0, 1, 1,
0.5882235, -0.1798078, 0.06681628, 0.2784314, 0, 1, 1,
0.5885779, 0.9907904, 1.195811, 0.282353, 0, 1, 1,
0.5888832, 1.535077, 0.7828453, 0.2901961, 0, 1, 1,
0.5908285, 2.010614, 0.2755211, 0.2941177, 0, 1, 1,
0.5928954, -0.6517854, 1.378007, 0.3019608, 0, 1, 1,
0.5944706, 0.4612028, 2.116107, 0.3098039, 0, 1, 1,
0.5977107, 0.6499456, 0.4273901, 0.3137255, 0, 1, 1,
0.6001775, -1.669574, 2.960064, 0.3215686, 0, 1, 1,
0.6011237, -1.513243, 5.0101, 0.3254902, 0, 1, 1,
0.6088346, -0.571237, 2.639169, 0.3333333, 0, 1, 1,
0.6362936, -1.712086, 0.9379528, 0.3372549, 0, 1, 1,
0.6372523, 1.000297, 1.20584, 0.345098, 0, 1, 1,
0.6582142, -0.9070892, 1.983973, 0.3490196, 0, 1, 1,
0.6598691, 0.02325586, 0.07330476, 0.3568628, 0, 1, 1,
0.6630616, 0.7812454, -1.619413, 0.3607843, 0, 1, 1,
0.6655635, -0.2279142, -0.3483174, 0.3686275, 0, 1, 1,
0.6675826, 1.073855, 0.6474915, 0.372549, 0, 1, 1,
0.6702977, -1.063598, 2.382063, 0.3803922, 0, 1, 1,
0.6719807, 0.5976566, -0.4195782, 0.3843137, 0, 1, 1,
0.6739263, 0.3252472, 1.698082, 0.3921569, 0, 1, 1,
0.6742078, -0.9595358, 1.632879, 0.3960784, 0, 1, 1,
0.677033, -1.117342, 1.181035, 0.4039216, 0, 1, 1,
0.6825694, -0.431335, 3.512779, 0.4117647, 0, 1, 1,
0.6832865, 0.8127396, 1.904172, 0.4156863, 0, 1, 1,
0.6851054, 0.4788054, 1.40515, 0.4235294, 0, 1, 1,
0.6875821, -2.413303, 3.170361, 0.427451, 0, 1, 1,
0.6970068, 0.385519, 2.650638, 0.4352941, 0, 1, 1,
0.6977568, -0.2490886, 4.090034, 0.4392157, 0, 1, 1,
0.7009258, 0.4298379, 1.775997, 0.4470588, 0, 1, 1,
0.7013627, 2.054682, 0.06690145, 0.4509804, 0, 1, 1,
0.7048218, 1.194526, -1.268806, 0.4588235, 0, 1, 1,
0.7066078, -1.838714, 2.846546, 0.4627451, 0, 1, 1,
0.7112364, -1.295442, 2.455933, 0.4705882, 0, 1, 1,
0.7160589, 0.520945, 1.652481, 0.4745098, 0, 1, 1,
0.7163144, 1.736688, -0.5704184, 0.4823529, 0, 1, 1,
0.7194993, 0.005353805, 2.258186, 0.4862745, 0, 1, 1,
0.7212083, -0.2717539, 0.7312911, 0.4941176, 0, 1, 1,
0.7228541, 0.7761828, 0.7393292, 0.5019608, 0, 1, 1,
0.7240533, -1.003199, 3.494141, 0.5058824, 0, 1, 1,
0.7314398, -0.3370165, 1.829455, 0.5137255, 0, 1, 1,
0.7349752, -0.4911097, 3.035292, 0.5176471, 0, 1, 1,
0.7412933, 0.5625281, 0.9244248, 0.5254902, 0, 1, 1,
0.7453374, -0.9904179, 2.799624, 0.5294118, 0, 1, 1,
0.7522827, 1.020666, 1.156268, 0.5372549, 0, 1, 1,
0.7528416, -1.401241, 1.484634, 0.5411765, 0, 1, 1,
0.7532431, 1.275355, 2.017285, 0.5490196, 0, 1, 1,
0.7565764, -1.282653, 0.8586228, 0.5529412, 0, 1, 1,
0.7566414, -0.5396217, 1.372943, 0.5607843, 0, 1, 1,
0.7595267, 0.1387357, 2.171556, 0.5647059, 0, 1, 1,
0.7597302, -0.3025426, 0.9281706, 0.572549, 0, 1, 1,
0.7647527, 0.3680693, -0.4022302, 0.5764706, 0, 1, 1,
0.769301, 1.283128, 1.464021, 0.5843138, 0, 1, 1,
0.7718236, -0.07805436, 2.473418, 0.5882353, 0, 1, 1,
0.7750183, -0.5659679, 0.2087826, 0.5960785, 0, 1, 1,
0.7764993, 3.673134, -1.210815, 0.6039216, 0, 1, 1,
0.7809094, 1.09376, 1.236691, 0.6078432, 0, 1, 1,
0.7810432, -0.9127671, 2.820091, 0.6156863, 0, 1, 1,
0.7816519, -0.2137339, 2.203384, 0.6196079, 0, 1, 1,
0.7828715, -0.5980704, 1.166225, 0.627451, 0, 1, 1,
0.7905084, 0.08398924, 2.077048, 0.6313726, 0, 1, 1,
0.7908104, -2.136848, 2.294412, 0.6392157, 0, 1, 1,
0.7967366, -1.357351, 3.465257, 0.6431373, 0, 1, 1,
0.7976878, -1.308087, 2.647915, 0.6509804, 0, 1, 1,
0.8055078, 0.4106977, 1.608945, 0.654902, 0, 1, 1,
0.8065422, 0.193744, 0.6962168, 0.6627451, 0, 1, 1,
0.8071643, 0.4278278, 1.872274, 0.6666667, 0, 1, 1,
0.8080749, 0.5183842, -0.08459536, 0.6745098, 0, 1, 1,
0.8111285, -0.7226259, 3.132257, 0.6784314, 0, 1, 1,
0.816286, -2.061062, 1.792298, 0.6862745, 0, 1, 1,
0.8174606, 0.4623644, -0.7769702, 0.6901961, 0, 1, 1,
0.819458, 0.3337073, -0.4918784, 0.6980392, 0, 1, 1,
0.8311644, -2.123381, 2.602076, 0.7058824, 0, 1, 1,
0.8316049, 0.8636474, 0.6044114, 0.7098039, 0, 1, 1,
0.8332101, -0.6665474, 1.265193, 0.7176471, 0, 1, 1,
0.8351216, -1.272951, 0.6748334, 0.7215686, 0, 1, 1,
0.8384084, -2.063727, 2.833986, 0.7294118, 0, 1, 1,
0.8443082, 0.006853065, 1.46466, 0.7333333, 0, 1, 1,
0.8452417, -0.2351779, 2.417487, 0.7411765, 0, 1, 1,
0.8453645, -0.03000492, 1.478263, 0.7450981, 0, 1, 1,
0.8470831, -0.1877134, 1.181301, 0.7529412, 0, 1, 1,
0.8472412, -0.03205405, 2.240179, 0.7568628, 0, 1, 1,
0.8483439, 0.3592627, 0.2417159, 0.7647059, 0, 1, 1,
0.8500672, 0.08759423, 0.6129383, 0.7686275, 0, 1, 1,
0.8506483, 0.4194744, 0.5689532, 0.7764706, 0, 1, 1,
0.8523198, 0.8291985, 2.726366, 0.7803922, 0, 1, 1,
0.8596995, 0.0310583, 1.766094, 0.7882353, 0, 1, 1,
0.864512, 0.8194879, -0.4042135, 0.7921569, 0, 1, 1,
0.8655754, 0.6023571, 0.3946995, 0.8, 0, 1, 1,
0.8671551, -0.4367595, 2.119156, 0.8078431, 0, 1, 1,
0.8737851, 0.4130757, 1.130457, 0.8117647, 0, 1, 1,
0.8746921, -1.362042, 3.450005, 0.8196079, 0, 1, 1,
0.8838629, 0.5375735, 2.066694, 0.8235294, 0, 1, 1,
0.8932812, -0.01114865, 0.7703541, 0.8313726, 0, 1, 1,
0.895844, -1.350294, 2.888706, 0.8352941, 0, 1, 1,
0.9094097, -2.223236, 2.794634, 0.8431373, 0, 1, 1,
0.9113224, -0.1696522, 2.675952, 0.8470588, 0, 1, 1,
0.9136215, 0.4793788, 1.391036, 0.854902, 0, 1, 1,
0.9137254, -0.6851108, 1.092323, 0.8588235, 0, 1, 1,
0.9189444, -1.077518, 0.646368, 0.8666667, 0, 1, 1,
0.9189577, 1.097757, -0.2174889, 0.8705882, 0, 1, 1,
0.9254346, 0.07435445, 1.773072, 0.8784314, 0, 1, 1,
0.9267808, 0.2595564, 1.012547, 0.8823529, 0, 1, 1,
0.9295906, -0.02311946, 1.319896, 0.8901961, 0, 1, 1,
0.9302029, -0.5367951, 3.168279, 0.8941177, 0, 1, 1,
0.9346909, -0.3006901, 1.381501, 0.9019608, 0, 1, 1,
0.9373549, -1.746366, 1.971987, 0.9098039, 0, 1, 1,
0.9387774, 0.9846395, 1.03333, 0.9137255, 0, 1, 1,
0.9418715, 0.6786326, 1.025703, 0.9215686, 0, 1, 1,
0.9546556, -1.013575, 2.353531, 0.9254902, 0, 1, 1,
0.9552507, -0.00907992, 4.059155, 0.9333333, 0, 1, 1,
0.9626021, -2.226032, 1.552528, 0.9372549, 0, 1, 1,
0.966765, 0.07924365, 1.082194, 0.945098, 0, 1, 1,
0.9724132, 0.9121881, 1.51527, 0.9490196, 0, 1, 1,
0.9730517, 1.54236, 1.013563, 0.9568627, 0, 1, 1,
0.9779449, 0.9802888, 0.7113003, 0.9607843, 0, 1, 1,
0.9797181, 0.8062815, 0.917752, 0.9686275, 0, 1, 1,
0.9801716, 0.3663321, 1.596152, 0.972549, 0, 1, 1,
0.9878358, -0.3243892, 1.96046, 0.9803922, 0, 1, 1,
0.9889544, 0.2126018, 0.09063638, 0.9843137, 0, 1, 1,
0.9903667, -0.618993, 1.861877, 0.9921569, 0, 1, 1,
0.9950453, -0.1993098, 2.537145, 0.9960784, 0, 1, 1,
1.002481, 0.8559852, -0.5183572, 1, 0, 0.9960784, 1,
1.002711, 0.877156, -0.3672083, 1, 0, 0.9882353, 1,
1.003044, 0.0638228, 1.000739, 1, 0, 0.9843137, 1,
1.012104, -0.3379253, 0.9787766, 1, 0, 0.9764706, 1,
1.013173, 0.2360155, 0.7167855, 1, 0, 0.972549, 1,
1.014703, 0.09998927, 0.913174, 1, 0, 0.9647059, 1,
1.018437, -0.3851186, 1.279807, 1, 0, 0.9607843, 1,
1.021446, -1.298228, 2.241847, 1, 0, 0.9529412, 1,
1.025831, -1.182709, 1.18952, 1, 0, 0.9490196, 1,
1.026807, 1.365279, 0.2075961, 1, 0, 0.9411765, 1,
1.031025, -0.6164476, 3.544688, 1, 0, 0.9372549, 1,
1.032531, 0.7052141, 2.287584, 1, 0, 0.9294118, 1,
1.040888, 0.5234029, -0.4771576, 1, 0, 0.9254902, 1,
1.042541, 0.2135324, 0.2639183, 1, 0, 0.9176471, 1,
1.043388, -1.67451, 1.724715, 1, 0, 0.9137255, 1,
1.049499, 1.162101, -0.6022851, 1, 0, 0.9058824, 1,
1.049818, -0.5811014, 1.034521, 1, 0, 0.9019608, 1,
1.061288, -0.3331704, 4.250319, 1, 0, 0.8941177, 1,
1.061745, 0.5690096, -0.8423654, 1, 0, 0.8862745, 1,
1.07138, -0.4587128, 1.234777, 1, 0, 0.8823529, 1,
1.072813, 0.0990037, 0.4604652, 1, 0, 0.8745098, 1,
1.072962, -0.2919312, 3.567416, 1, 0, 0.8705882, 1,
1.080914, 0.9830655, 1.259698, 1, 0, 0.8627451, 1,
1.101168, -0.159762, 2.770961, 1, 0, 0.8588235, 1,
1.101368, 0.9690472, 0.7010662, 1, 0, 0.8509804, 1,
1.109815, -1.896507, 2.401747, 1, 0, 0.8470588, 1,
1.113553, -2.215344, 2.517536, 1, 0, 0.8392157, 1,
1.124111, -1.731508, 2.255966, 1, 0, 0.8352941, 1,
1.131152, 1.505167, 0.6767355, 1, 0, 0.827451, 1,
1.138323, -0.5141258, 3.03832, 1, 0, 0.8235294, 1,
1.14406, -0.4932341, 2.461385, 1, 0, 0.8156863, 1,
1.146217, 0.9181454, 1.027037, 1, 0, 0.8117647, 1,
1.153032, -1.6917, 1.464729, 1, 0, 0.8039216, 1,
1.153236, 0.2920443, 0.6565256, 1, 0, 0.7960784, 1,
1.161157, 0.09536473, 2.804728, 1, 0, 0.7921569, 1,
1.168792, 1.89507, -1.43837, 1, 0, 0.7843137, 1,
1.1793, -0.03047843, -0.2252033, 1, 0, 0.7803922, 1,
1.18125, 1.67176, 1.654072, 1, 0, 0.772549, 1,
1.187724, 1.448446, 2.189481, 1, 0, 0.7686275, 1,
1.187802, -0.6682458, 1.090263, 1, 0, 0.7607843, 1,
1.190502, -1.399585, 4.512786, 1, 0, 0.7568628, 1,
1.199273, -0.0883029, 3.047672, 1, 0, 0.7490196, 1,
1.201112, -0.9379719, 1.699954, 1, 0, 0.7450981, 1,
1.206717, 1.46035, 1.085778, 1, 0, 0.7372549, 1,
1.20995, -0.2023236, 2.421015, 1, 0, 0.7333333, 1,
1.211409, 0.6404631, 2.006645, 1, 0, 0.7254902, 1,
1.220528, 0.8909312, 1.151781, 1, 0, 0.7215686, 1,
1.22081, 0.2643664, 2.344502, 1, 0, 0.7137255, 1,
1.222872, 0.8029383, 0.04631465, 1, 0, 0.7098039, 1,
1.230812, 0.5962222, 1.527227, 1, 0, 0.7019608, 1,
1.242565, -0.5092982, 1.924454, 1, 0, 0.6941177, 1,
1.26071, -0.005183038, 0.633644, 1, 0, 0.6901961, 1,
1.26262, -1.404895, 1.401735, 1, 0, 0.682353, 1,
1.266737, 1.870561, 2.67959, 1, 0, 0.6784314, 1,
1.271184, 1.858202, -0.7664995, 1, 0, 0.6705883, 1,
1.273401, -0.1814218, 1.608515, 1, 0, 0.6666667, 1,
1.274367, 0.6738292, 0.641802, 1, 0, 0.6588235, 1,
1.275194, 0.4876951, 1.50289, 1, 0, 0.654902, 1,
1.277803, 0.2584091, 1.202459, 1, 0, 0.6470588, 1,
1.279102, 0.1152263, 0.5214708, 1, 0, 0.6431373, 1,
1.28234, -0.8164374, 2.729589, 1, 0, 0.6352941, 1,
1.285347, -0.3218286, 1.260239, 1, 0, 0.6313726, 1,
1.307205, -1.201799, 3.296477, 1, 0, 0.6235294, 1,
1.308721, -1.253425, 1.654578, 1, 0, 0.6196079, 1,
1.311025, 0.5162626, -0.2932414, 1, 0, 0.6117647, 1,
1.314473, -0.7250462, 1.912652, 1, 0, 0.6078432, 1,
1.320713, -1.286286, 3.166641, 1, 0, 0.6, 1,
1.326788, -2.112683, 2.235108, 1, 0, 0.5921569, 1,
1.332134, -1.247857, 2.23286, 1, 0, 0.5882353, 1,
1.339257, -0.5843992, 3.442736, 1, 0, 0.5803922, 1,
1.339972, -0.03530313, 2.315523, 1, 0, 0.5764706, 1,
1.340374, 1.102451, 1.291763, 1, 0, 0.5686275, 1,
1.344226, -1.137389, 2.502685, 1, 0, 0.5647059, 1,
1.345228, 1.663308, 1.40353, 1, 0, 0.5568628, 1,
1.349762, 0.5873107, -0.1407226, 1, 0, 0.5529412, 1,
1.353249, -0.1022382, 1.435086, 1, 0, 0.5450981, 1,
1.3555, -1.367926, 2.324612, 1, 0, 0.5411765, 1,
1.357784, 1.675774, 0.4171714, 1, 0, 0.5333334, 1,
1.369133, 2.644533, -1.517149, 1, 0, 0.5294118, 1,
1.374285, -0.2993919, 0.8457182, 1, 0, 0.5215687, 1,
1.379965, 0.04638081, 3.288703, 1, 0, 0.5176471, 1,
1.387635, -0.114582, 1.515765, 1, 0, 0.509804, 1,
1.38811, -0.4738752, 0.978296, 1, 0, 0.5058824, 1,
1.389035, 0.2804788, 2.616783, 1, 0, 0.4980392, 1,
1.395684, -0.2804702, 1.704524, 1, 0, 0.4901961, 1,
1.406646, -1.250977, 2.601491, 1, 0, 0.4862745, 1,
1.414842, 0.6638777, 0.1836572, 1, 0, 0.4784314, 1,
1.417574, -0.4381129, -0.02782191, 1, 0, 0.4745098, 1,
1.424402, -1.748699, 1.556204, 1, 0, 0.4666667, 1,
1.431885, -0.8163202, 3.273068, 1, 0, 0.4627451, 1,
1.438395, 0.2876035, -0.5188777, 1, 0, 0.454902, 1,
1.458677, -0.2415138, 1.306872, 1, 0, 0.4509804, 1,
1.459427, -1.056569, 0.03381963, 1, 0, 0.4431373, 1,
1.468821, 1.395799, 0.1554811, 1, 0, 0.4392157, 1,
1.472903, -1.276007, 1.710177, 1, 0, 0.4313726, 1,
1.485615, 1.859578, 1.523206, 1, 0, 0.427451, 1,
1.492007, -1.110255, 0.9476232, 1, 0, 0.4196078, 1,
1.494282, -1.756122, 3.006045, 1, 0, 0.4156863, 1,
1.498148, 1.870669, 2.593779, 1, 0, 0.4078431, 1,
1.501761, 1.076314, 0.6466118, 1, 0, 0.4039216, 1,
1.510509, -0.980633, 2.854309, 1, 0, 0.3960784, 1,
1.511458, 0.1643321, 1.615422, 1, 0, 0.3882353, 1,
1.518051, 0.3685609, 0.8320392, 1, 0, 0.3843137, 1,
1.521392, -0.9544152, 2.760334, 1, 0, 0.3764706, 1,
1.522369, 0.3431355, 2.592869, 1, 0, 0.372549, 1,
1.530897, -0.4065485, 2.141788, 1, 0, 0.3647059, 1,
1.53512, 0.3447167, 0.7238058, 1, 0, 0.3607843, 1,
1.53554, -0.3512194, 1.911493, 1, 0, 0.3529412, 1,
1.535752, 0.5937809, 0.8653299, 1, 0, 0.3490196, 1,
1.553028, -1.006985, 2.517186, 1, 0, 0.3411765, 1,
1.553165, 1.691917, 1.910335, 1, 0, 0.3372549, 1,
1.560852, 1.562489, 0.9408245, 1, 0, 0.3294118, 1,
1.566036, -0.1228776, 1.471965, 1, 0, 0.3254902, 1,
1.567913, -1.373395, 2.785303, 1, 0, 0.3176471, 1,
1.607368, 0.4634186, 1.366621, 1, 0, 0.3137255, 1,
1.61528, -0.09665746, 2.370198, 1, 0, 0.3058824, 1,
1.623164, 0.1414018, 1.381096, 1, 0, 0.2980392, 1,
1.641816, -0.8575749, 3.095034, 1, 0, 0.2941177, 1,
1.655415, -1.472631, 3.018506, 1, 0, 0.2862745, 1,
1.655645, 0.9262389, -0.5426241, 1, 0, 0.282353, 1,
1.666981, 0.410515, 2.321028, 1, 0, 0.2745098, 1,
1.670014, -0.5124593, 1.381789, 1, 0, 0.2705882, 1,
1.67607, 0.05251015, 1.070352, 1, 0, 0.2627451, 1,
1.677826, -2.324405, 2.417615, 1, 0, 0.2588235, 1,
1.7101, -0.8733276, 0.5560704, 1, 0, 0.2509804, 1,
1.718514, 1.622307, 1.324178, 1, 0, 0.2470588, 1,
1.724705, -0.778479, 2.377384, 1, 0, 0.2392157, 1,
1.735509, -1.239196, 1.15781, 1, 0, 0.2352941, 1,
1.738945, -0.5601955, 2.083518, 1, 0, 0.227451, 1,
1.747607, 0.4182981, 1.522391, 1, 0, 0.2235294, 1,
1.792729, 0.2561053, 1.168157, 1, 0, 0.2156863, 1,
1.79751, 0.9195753, 0.7736561, 1, 0, 0.2117647, 1,
1.802189, 0.1444277, 1.227022, 1, 0, 0.2039216, 1,
1.807749, 1.070611, 1.827641, 1, 0, 0.1960784, 1,
1.81761, 0.2791348, 1.00475, 1, 0, 0.1921569, 1,
1.87468, 0.4716465, 1.702228, 1, 0, 0.1843137, 1,
1.877617, -1.307024, 1.422683, 1, 0, 0.1803922, 1,
1.882231, 0.494908, 0.5960988, 1, 0, 0.172549, 1,
1.911922, 0.9445108, -1.302104, 1, 0, 0.1686275, 1,
1.915514, -2.720751, 3.01578, 1, 0, 0.1607843, 1,
1.921619, 0.2066515, 0.696871, 1, 0, 0.1568628, 1,
1.930918, 0.6647462, 1.381905, 1, 0, 0.1490196, 1,
1.952216, -1.119184, 2.862862, 1, 0, 0.145098, 1,
1.972951, 0.8495284, 1.695553, 1, 0, 0.1372549, 1,
1.980445, -0.2066155, 3.120548, 1, 0, 0.1333333, 1,
1.98111, -0.6775445, -0.2130393, 1, 0, 0.1254902, 1,
1.992039, -1.535037, 1.430234, 1, 0, 0.1215686, 1,
2.013569, 0.09236325, 1.687932, 1, 0, 0.1137255, 1,
2.054863, -0.3661766, 1.735627, 1, 0, 0.1098039, 1,
2.086429, -0.6464076, 2.27991, 1, 0, 0.1019608, 1,
2.092097, -1.391619, 2.193595, 1, 0, 0.09411765, 1,
2.156183, 0.3490319, 0.9065446, 1, 0, 0.09019608, 1,
2.186286, -0.3950229, 1.425581, 1, 0, 0.08235294, 1,
2.222917, -0.3916053, 0.9924241, 1, 0, 0.07843138, 1,
2.291503, -1.231861, 1.05759, 1, 0, 0.07058824, 1,
2.300336, 0.7105477, 2.075117, 1, 0, 0.06666667, 1,
2.358095, -0.1235168, 1.595087, 1, 0, 0.05882353, 1,
2.368901, 1.607139, 1.009294, 1, 0, 0.05490196, 1,
2.394017, -0.5327062, 0.7644299, 1, 0, 0.04705882, 1,
2.476315, 1.621176, 0.3720449, 1, 0, 0.04313726, 1,
2.492677, -0.2536574, 2.535053, 1, 0, 0.03529412, 1,
2.845126, 0.4475046, 3.717147, 1, 0, 0.03137255, 1,
2.879079, -0.8691562, 2.533503, 1, 0, 0.02352941, 1,
3.067893, -0.7455828, 1.789061, 1, 0, 0.01960784, 1,
3.236599, -1.553994, 1.057165, 1, 0, 0.01176471, 1,
3.287866, -0.8927943, 3.044363, 1, 0, 0.007843138, 1
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
0.2105393, -4.045642, -7.517818, 0, -0.5, 0.5, 0.5,
0.2105393, -4.045642, -7.517818, 1, -0.5, 0.5, 0.5,
0.2105393, -4.045642, -7.517818, 1, 1.5, 0.5, 0.5,
0.2105393, -4.045642, -7.517818, 0, 1.5, 0.5, 0.5
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
-3.910001, 0.3918267, -7.517818, 0, -0.5, 0.5, 0.5,
-3.910001, 0.3918267, -7.517818, 1, -0.5, 0.5, 0.5,
-3.910001, 0.3918267, -7.517818, 1, 1.5, 0.5, 0.5,
-3.910001, 0.3918267, -7.517818, 0, 1.5, 0.5, 0.5
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
-3.910001, -4.045642, 0.004453421, 0, -0.5, 0.5, 0.5,
-3.910001, -4.045642, 0.004453421, 1, -0.5, 0.5, 0.5,
-3.910001, -4.045642, 0.004453421, 1, 1.5, 0.5, 0.5,
-3.910001, -4.045642, 0.004453421, 0, 1.5, 0.5, 0.5
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
-2, -3.021611, -5.781909,
3, -3.021611, -5.781909,
-2, -3.021611, -5.781909,
-2, -3.192283, -6.071228,
-1, -3.021611, -5.781909,
-1, -3.192283, -6.071228,
0, -3.021611, -5.781909,
0, -3.192283, -6.071228,
1, -3.021611, -5.781909,
1, -3.192283, -6.071228,
2, -3.021611, -5.781909,
2, -3.192283, -6.071228,
3, -3.021611, -5.781909,
3, -3.192283, -6.071228
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
-2, -3.533627, -6.649864, 0, -0.5, 0.5, 0.5,
-2, -3.533627, -6.649864, 1, -0.5, 0.5, 0.5,
-2, -3.533627, -6.649864, 1, 1.5, 0.5, 0.5,
-2, -3.533627, -6.649864, 0, 1.5, 0.5, 0.5,
-1, -3.533627, -6.649864, 0, -0.5, 0.5, 0.5,
-1, -3.533627, -6.649864, 1, -0.5, 0.5, 0.5,
-1, -3.533627, -6.649864, 1, 1.5, 0.5, 0.5,
-1, -3.533627, -6.649864, 0, 1.5, 0.5, 0.5,
0, -3.533627, -6.649864, 0, -0.5, 0.5, 0.5,
0, -3.533627, -6.649864, 1, -0.5, 0.5, 0.5,
0, -3.533627, -6.649864, 1, 1.5, 0.5, 0.5,
0, -3.533627, -6.649864, 0, 1.5, 0.5, 0.5,
1, -3.533627, -6.649864, 0, -0.5, 0.5, 0.5,
1, -3.533627, -6.649864, 1, -0.5, 0.5, 0.5,
1, -3.533627, -6.649864, 1, 1.5, 0.5, 0.5,
1, -3.533627, -6.649864, 0, 1.5, 0.5, 0.5,
2, -3.533627, -6.649864, 0, -0.5, 0.5, 0.5,
2, -3.533627, -6.649864, 1, -0.5, 0.5, 0.5,
2, -3.533627, -6.649864, 1, 1.5, 0.5, 0.5,
2, -3.533627, -6.649864, 0, 1.5, 0.5, 0.5,
3, -3.533627, -6.649864, 0, -0.5, 0.5, 0.5,
3, -3.533627, -6.649864, 1, -0.5, 0.5, 0.5,
3, -3.533627, -6.649864, 1, 1.5, 0.5, 0.5,
3, -3.533627, -6.649864, 0, 1.5, 0.5, 0.5
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
-2.959107, -2, -5.781909,
-2.959107, 3, -5.781909,
-2.959107, -2, -5.781909,
-3.117589, -2, -6.071228,
-2.959107, -1, -5.781909,
-3.117589, -1, -6.071228,
-2.959107, 0, -5.781909,
-3.117589, 0, -6.071228,
-2.959107, 1, -5.781909,
-3.117589, 1, -6.071228,
-2.959107, 2, -5.781909,
-3.117589, 2, -6.071228,
-2.959107, 3, -5.781909,
-3.117589, 3, -6.071228
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
-3.434554, -2, -6.649864, 0, -0.5, 0.5, 0.5,
-3.434554, -2, -6.649864, 1, -0.5, 0.5, 0.5,
-3.434554, -2, -6.649864, 1, 1.5, 0.5, 0.5,
-3.434554, -2, -6.649864, 0, 1.5, 0.5, 0.5,
-3.434554, -1, -6.649864, 0, -0.5, 0.5, 0.5,
-3.434554, -1, -6.649864, 1, -0.5, 0.5, 0.5,
-3.434554, -1, -6.649864, 1, 1.5, 0.5, 0.5,
-3.434554, -1, -6.649864, 0, 1.5, 0.5, 0.5,
-3.434554, 0, -6.649864, 0, -0.5, 0.5, 0.5,
-3.434554, 0, -6.649864, 1, -0.5, 0.5, 0.5,
-3.434554, 0, -6.649864, 1, 1.5, 0.5, 0.5,
-3.434554, 0, -6.649864, 0, 1.5, 0.5, 0.5,
-3.434554, 1, -6.649864, 0, -0.5, 0.5, 0.5,
-3.434554, 1, -6.649864, 1, -0.5, 0.5, 0.5,
-3.434554, 1, -6.649864, 1, 1.5, 0.5, 0.5,
-3.434554, 1, -6.649864, 0, 1.5, 0.5, 0.5,
-3.434554, 2, -6.649864, 0, -0.5, 0.5, 0.5,
-3.434554, 2, -6.649864, 1, -0.5, 0.5, 0.5,
-3.434554, 2, -6.649864, 1, 1.5, 0.5, 0.5,
-3.434554, 2, -6.649864, 0, 1.5, 0.5, 0.5,
-3.434554, 3, -6.649864, 0, -0.5, 0.5, 0.5,
-3.434554, 3, -6.649864, 1, -0.5, 0.5, 0.5,
-3.434554, 3, -6.649864, 1, 1.5, 0.5, 0.5,
-3.434554, 3, -6.649864, 0, 1.5, 0.5, 0.5
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
-2.959107, -3.021611, -4,
-2.959107, -3.021611, 4,
-2.959107, -3.021611, -4,
-3.117589, -3.192283, -4,
-2.959107, -3.021611, -2,
-3.117589, -3.192283, -2,
-2.959107, -3.021611, 0,
-3.117589, -3.192283, 0,
-2.959107, -3.021611, 2,
-3.117589, -3.192283, 2,
-2.959107, -3.021611, 4,
-3.117589, -3.192283, 4
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
-3.434554, -3.533627, -4, 0, -0.5, 0.5, 0.5,
-3.434554, -3.533627, -4, 1, -0.5, 0.5, 0.5,
-3.434554, -3.533627, -4, 1, 1.5, 0.5, 0.5,
-3.434554, -3.533627, -4, 0, 1.5, 0.5, 0.5,
-3.434554, -3.533627, -2, 0, -0.5, 0.5, 0.5,
-3.434554, -3.533627, -2, 1, -0.5, 0.5, 0.5,
-3.434554, -3.533627, -2, 1, 1.5, 0.5, 0.5,
-3.434554, -3.533627, -2, 0, 1.5, 0.5, 0.5,
-3.434554, -3.533627, 0, 0, -0.5, 0.5, 0.5,
-3.434554, -3.533627, 0, 1, -0.5, 0.5, 0.5,
-3.434554, -3.533627, 0, 1, 1.5, 0.5, 0.5,
-3.434554, -3.533627, 0, 0, 1.5, 0.5, 0.5,
-3.434554, -3.533627, 2, 0, -0.5, 0.5, 0.5,
-3.434554, -3.533627, 2, 1, -0.5, 0.5, 0.5,
-3.434554, -3.533627, 2, 1, 1.5, 0.5, 0.5,
-3.434554, -3.533627, 2, 0, 1.5, 0.5, 0.5,
-3.434554, -3.533627, 4, 0, -0.5, 0.5, 0.5,
-3.434554, -3.533627, 4, 1, -0.5, 0.5, 0.5,
-3.434554, -3.533627, 4, 1, 1.5, 0.5, 0.5,
-3.434554, -3.533627, 4, 0, 1.5, 0.5, 0.5
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
-2.959107, -3.021611, -5.781909,
-2.959107, 3.805265, -5.781909,
-2.959107, -3.021611, 5.790816,
-2.959107, 3.805265, 5.790816,
-2.959107, -3.021611, -5.781909,
-2.959107, -3.021611, 5.790816,
-2.959107, 3.805265, -5.781909,
-2.959107, 3.805265, 5.790816,
-2.959107, -3.021611, -5.781909,
3.380186, -3.021611, -5.781909,
-2.959107, -3.021611, 5.790816,
3.380186, -3.021611, 5.790816,
-2.959107, 3.805265, -5.781909,
3.380186, 3.805265, -5.781909,
-2.959107, 3.805265, 5.790816,
3.380186, 3.805265, 5.790816,
3.380186, -3.021611, -5.781909,
3.380186, 3.805265, -5.781909,
3.380186, -3.021611, 5.790816,
3.380186, 3.805265, 5.790816,
3.380186, -3.021611, -5.781909,
3.380186, -3.021611, 5.790816,
3.380186, 3.805265, -5.781909,
3.380186, 3.805265, 5.790816
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
var radius = 7.933177;
var distance = 35.2956;
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
mvMatrix.translate( -0.2105393, -0.3918267, -0.004453421 );
mvMatrix.scale( 1.35307, 1.256432, 0.7411829 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.2956);
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
ethyl_pyrophosphate<-read.table("ethyl_pyrophosphate.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-ethyl_pyrophosphate$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethyl_pyrophosphate' not found
```

```r
y<-ethyl_pyrophosphate$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethyl_pyrophosphate' not found
```

```r
z<-ethyl_pyrophosphate$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethyl_pyrophosphate' not found
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
-2.866787, -2.329954, -0.6420699, 0, 0, 1, 1, 1,
-2.689518, 0.359783, -1.266698, 1, 0, 0, 1, 1,
-2.628548, -0.9923435, -2.331935, 1, 0, 0, 1, 1,
-2.599271, -1.424435, -1.769134, 1, 0, 0, 1, 1,
-2.59464, 0.7135034, -1.156097, 1, 0, 0, 1, 1,
-2.522864, -0.6345586, -1.121162, 1, 0, 0, 1, 1,
-2.393548, 0.9285105, -1.867535, 0, 0, 0, 1, 1,
-2.330042, 0.1787955, -1.510753, 0, 0, 0, 1, 1,
-2.313447, -0.06446624, -0.7060924, 0, 0, 0, 1, 1,
-2.272225, -0.2716679, -4.082469, 0, 0, 0, 1, 1,
-2.167237, -1.057498, -0.3224634, 0, 0, 0, 1, 1,
-2.166653, -0.6565993, -2.300344, 0, 0, 0, 1, 1,
-2.15034, 0.2448059, -2.117033, 0, 0, 0, 1, 1,
-2.145903, -0.5606275, -1.358375, 1, 1, 1, 1, 1,
-2.086037, -2.283747, -3.036915, 1, 1, 1, 1, 1,
-2.077227, -0.1923148, -2.724679, 1, 1, 1, 1, 1,
-2.071425, -0.3556937, -2.774054, 1, 1, 1, 1, 1,
-2.062021, -0.9910563, 0.1630909, 1, 1, 1, 1, 1,
-2.036519, -2.03584, -2.925933, 1, 1, 1, 1, 1,
-2.026161, -1.114035, -0.8759091, 1, 1, 1, 1, 1,
-1.99972, 0.3961114, -1.486123, 1, 1, 1, 1, 1,
-1.998516, -0.4274729, -0.5713702, 1, 1, 1, 1, 1,
-1.987465, 1.376956, -0.8833841, 1, 1, 1, 1, 1,
-1.983243, -0.04115072, -3.302381, 1, 1, 1, 1, 1,
-1.978202, 0.6184139, -1.169526, 1, 1, 1, 1, 1,
-1.9726, -0.5235668, -1.542133, 1, 1, 1, 1, 1,
-1.971919, -0.2376956, -2.009348, 1, 1, 1, 1, 1,
-1.96081, -0.5524108, -1.266224, 1, 1, 1, 1, 1,
-1.959769, -0.7626168, 0.4370115, 0, 0, 1, 1, 1,
-1.95718, 0.04570518, -1.089996, 1, 0, 0, 1, 1,
-1.95393, -1.325126, -3.656774, 1, 0, 0, 1, 1,
-1.950677, 0.1419121, -1.105071, 1, 0, 0, 1, 1,
-1.941676, 0.1880976, 0.467061, 1, 0, 0, 1, 1,
-1.940488, 0.5520149, -1.230949, 1, 0, 0, 1, 1,
-1.934964, 0.1908335, -2.157955, 0, 0, 0, 1, 1,
-1.933017, -1.548947, -2.063477, 0, 0, 0, 1, 1,
-1.920606, 1.457174, -1.589446, 0, 0, 0, 1, 1,
-1.916058, -0.1529558, -2.470789, 0, 0, 0, 1, 1,
-1.876542, -0.4838803, -1.792138, 0, 0, 0, 1, 1,
-1.867628, 0.2486143, -3.195238, 0, 0, 0, 1, 1,
-1.858826, 1.327621, -0.7293445, 0, 0, 0, 1, 1,
-1.831204, 0.5411227, -0.819428, 1, 1, 1, 1, 1,
-1.826664, -0.1182974, -2.486714, 1, 1, 1, 1, 1,
-1.814284, 1.095572, -0.6811575, 1, 1, 1, 1, 1,
-1.781512, 0.2704175, -0.7816545, 1, 1, 1, 1, 1,
-1.77976, 0.4738988, 0.3288252, 1, 1, 1, 1, 1,
-1.779681, -1.688637, -1.214909, 1, 1, 1, 1, 1,
-1.771643, 2.236881, 0.1948699, 1, 1, 1, 1, 1,
-1.732506, 1.516803, -1.976687, 1, 1, 1, 1, 1,
-1.717393, 0.7011911, -0.4479247, 1, 1, 1, 1, 1,
-1.695393, -0.3825146, -2.138325, 1, 1, 1, 1, 1,
-1.693228, 0.8207757, -0.1769556, 1, 1, 1, 1, 1,
-1.690619, 1.599503, -1.521228, 1, 1, 1, 1, 1,
-1.688868, 0.5811166, -1.778456, 1, 1, 1, 1, 1,
-1.687792, 1.51301, 0.6297074, 1, 1, 1, 1, 1,
-1.678468, -0.346348, -2.49927, 1, 1, 1, 1, 1,
-1.65199, -0.6705062, -2.275786, 0, 0, 1, 1, 1,
-1.649231, 1.919945, 0.6227469, 1, 0, 0, 1, 1,
-1.639515, 0.5701101, -2.78638, 1, 0, 0, 1, 1,
-1.638732, -1.683511, -2.239878, 1, 0, 0, 1, 1,
-1.638342, 0.4173422, -2.777139, 1, 0, 0, 1, 1,
-1.621531, 0.7312207, -1.534482, 1, 0, 0, 1, 1,
-1.610019, 0.5883023, -1.57862, 0, 0, 0, 1, 1,
-1.601647, 0.9320345, -2.7339, 0, 0, 0, 1, 1,
-1.601533, 1.033648, -2.239991, 0, 0, 0, 1, 1,
-1.595344, -1.784344, -0.6963273, 0, 0, 0, 1, 1,
-1.59194, -0.3409511, -1.733669, 0, 0, 0, 1, 1,
-1.580402, 1.554284, -0.9402457, 0, 0, 0, 1, 1,
-1.5747, 0.7242378, -2.542497, 0, 0, 0, 1, 1,
-1.573903, -0.5544752, -3.923275, 1, 1, 1, 1, 1,
-1.54954, -0.3145519, -0.9916247, 1, 1, 1, 1, 1,
-1.546564, 1.075667, -0.4541196, 1, 1, 1, 1, 1,
-1.544601, 0.6161482, -1.632349, 1, 1, 1, 1, 1,
-1.541975, 2.205191, -0.04421678, 1, 1, 1, 1, 1,
-1.540026, 0.9068506, -1.145566, 1, 1, 1, 1, 1,
-1.521284, 1.504775, -1.290171, 1, 1, 1, 1, 1,
-1.51539, 0.2910252, -0.4339297, 1, 1, 1, 1, 1,
-1.507024, -1.660084, -1.386072, 1, 1, 1, 1, 1,
-1.505923, -1.704389, -0.4264619, 1, 1, 1, 1, 1,
-1.499816, -0.4128163, -1.918804, 1, 1, 1, 1, 1,
-1.495018, 1.212526, -1.920326, 1, 1, 1, 1, 1,
-1.494586, -0.4189024, -1.523395, 1, 1, 1, 1, 1,
-1.492572, -0.06706604, -0.9741533, 1, 1, 1, 1, 1,
-1.489869, -1.269522, -0.4430868, 1, 1, 1, 1, 1,
-1.484957, 0.212549, -0.1530887, 0, 0, 1, 1, 1,
-1.484253, 0.8042358, 0.9205023, 1, 0, 0, 1, 1,
-1.470431, -0.7168346, -3.380142, 1, 0, 0, 1, 1,
-1.464254, 1.132769, -0.8083985, 1, 0, 0, 1, 1,
-1.46348, -1.197407, -4.305271, 1, 0, 0, 1, 1,
-1.459434, 0.6468899, -2.026376, 1, 0, 0, 1, 1,
-1.450173, -2.067196, -3.678432, 0, 0, 0, 1, 1,
-1.442535, 1.207037, 0.295776, 0, 0, 0, 1, 1,
-1.440603, -1.099303, -0.5311892, 0, 0, 0, 1, 1,
-1.430772, 0.8578674, -0.3296995, 0, 0, 0, 1, 1,
-1.428192, -0.3997017, -1.546101, 0, 0, 0, 1, 1,
-1.416048, 2.207311, -0.292108, 0, 0, 0, 1, 1,
-1.414099, -0.4177101, -3.017025, 0, 0, 0, 1, 1,
-1.410825, -1.338961, -2.332776, 1, 1, 1, 1, 1,
-1.400602, -1.711357, -3.480915, 1, 1, 1, 1, 1,
-1.397806, -0.7732956, -3.018332, 1, 1, 1, 1, 1,
-1.393158, -0.6823967, -0.8581935, 1, 1, 1, 1, 1,
-1.388833, 0.1397736, -1.62267, 1, 1, 1, 1, 1,
-1.381585, 1.246039, -0.7303718, 1, 1, 1, 1, 1,
-1.367737, -0.7614507, -3.205768, 1, 1, 1, 1, 1,
-1.359474, 0.7905606, 1.432525, 1, 1, 1, 1, 1,
-1.355351, 1.504076, -1.320137, 1, 1, 1, 1, 1,
-1.329184, 1.081816, -1.313518, 1, 1, 1, 1, 1,
-1.328761, -0.7864198, -2.933801, 1, 1, 1, 1, 1,
-1.323915, -0.1443333, -0.9682637, 1, 1, 1, 1, 1,
-1.316945, 0.9508706, 0.6329135, 1, 1, 1, 1, 1,
-1.313032, 0.3830221, 1.022205, 1, 1, 1, 1, 1,
-1.310961, -0.3660141, -2.026222, 1, 1, 1, 1, 1,
-1.303281, 0.8180457, -0.3806781, 0, 0, 1, 1, 1,
-1.294153, 0.7148896, -0.1069885, 1, 0, 0, 1, 1,
-1.279203, 1.038937, -0.5410613, 1, 0, 0, 1, 1,
-1.271422, 2.820954, -0.3020778, 1, 0, 0, 1, 1,
-1.267299, -0.4301763, -1.156805, 1, 0, 0, 1, 1,
-1.263938, 1.37472, 0.9078923, 1, 0, 0, 1, 1,
-1.260978, 0.7059198, -1.647553, 0, 0, 0, 1, 1,
-1.24707, -1.656672, -2.750821, 0, 0, 0, 1, 1,
-1.240172, -0.5184051, -2.141916, 0, 0, 0, 1, 1,
-1.238338, 0.244016, -1.525348, 0, 0, 0, 1, 1,
-1.231244, -0.7966741, -1.626305, 0, 0, 0, 1, 1,
-1.231081, 2.96318, -2.151853, 0, 0, 0, 1, 1,
-1.220474, 0.6659373, -2.177845, 0, 0, 0, 1, 1,
-1.214396, 0.2878033, -0.001636109, 1, 1, 1, 1, 1,
-1.209848, -0.05797341, -2.236675, 1, 1, 1, 1, 1,
-1.207632, -0.0555933, -2.642135, 1, 1, 1, 1, 1,
-1.206357, -0.6006097, -1.189749, 1, 1, 1, 1, 1,
-1.19664, 0.4572708, 0.1119785, 1, 1, 1, 1, 1,
-1.188746, 0.5210675, -1.045024, 1, 1, 1, 1, 1,
-1.168831, 0.9986516, 0.08072713, 1, 1, 1, 1, 1,
-1.152209, 0.6466447, 0.02331545, 1, 1, 1, 1, 1,
-1.127787, -1.310546, -2.716451, 1, 1, 1, 1, 1,
-1.124865, 0.7237842, -1.218254, 1, 1, 1, 1, 1,
-1.117333, -0.7745501, -0.9150649, 1, 1, 1, 1, 1,
-1.114019, -1.724085, -3.465644, 1, 1, 1, 1, 1,
-1.113635, -1.439199, -3.781967, 1, 1, 1, 1, 1,
-1.110324, 0.3408638, -1.385301, 1, 1, 1, 1, 1,
-1.100334, 0.4095604, -2.413112, 1, 1, 1, 1, 1,
-1.098709, 1.050547, -2.374389, 0, 0, 1, 1, 1,
-1.093823, -0.6593737, -2.481206, 1, 0, 0, 1, 1,
-1.08185, -0.2990698, -1.542112, 1, 0, 0, 1, 1,
-1.080417, 0.8681062, -1.012777, 1, 0, 0, 1, 1,
-1.070995, -0.7522298, -2.401641, 1, 0, 0, 1, 1,
-1.067615, -0.160065, -1.130744, 1, 0, 0, 1, 1,
-1.043706, 0.6519569, -1.431609, 0, 0, 0, 1, 1,
-1.037063, -0.9781658, -2.175318, 0, 0, 0, 1, 1,
-1.03507, 0.3043074, -2.400705, 0, 0, 0, 1, 1,
-1.033751, -0.02368832, -2.032083, 0, 0, 0, 1, 1,
-1.026479, 0.1973129, -1.298585, 0, 0, 0, 1, 1,
-1.0184, -0.3075016, -4.280977, 0, 0, 0, 1, 1,
-1.017908, -0.8763496, -5.202352, 0, 0, 0, 1, 1,
-1.016344, -0.419324, -3.173049, 1, 1, 1, 1, 1,
-1.015633, -0.8250771, -3.946957, 1, 1, 1, 1, 1,
-1.013783, 0.5247677, -2.223512, 1, 1, 1, 1, 1,
-1.012704, 0.1923579, -1.415473, 1, 1, 1, 1, 1,
-1.001155, 0.5073237, -0.03047327, 1, 1, 1, 1, 1,
-0.990976, 0.05315192, -3.477153, 1, 1, 1, 1, 1,
-0.9875809, -0.2618068, -2.353107, 1, 1, 1, 1, 1,
-0.9849533, 0.2088297, -0.909171, 1, 1, 1, 1, 1,
-0.9700477, -1.427325, -1.663475, 1, 1, 1, 1, 1,
-0.963271, -0.506391, -1.702353, 1, 1, 1, 1, 1,
-0.9605671, 0.2663366, 0.8401068, 1, 1, 1, 1, 1,
-0.95658, 0.5262523, -0.1119447, 1, 1, 1, 1, 1,
-0.9564328, 0.503295, -0.5242012, 1, 1, 1, 1, 1,
-0.949981, 0.5715598, -0.6282395, 1, 1, 1, 1, 1,
-0.9482644, -0.2488899, -1.996871, 1, 1, 1, 1, 1,
-0.9481142, -0.2905314, -0.01778864, 0, 0, 1, 1, 1,
-0.942912, -2.30523, -4.289531, 1, 0, 0, 1, 1,
-0.9399831, -1.562833, -0.249123, 1, 0, 0, 1, 1,
-0.9390988, -0.4663267, -1.545267, 1, 0, 0, 1, 1,
-0.933934, -0.1766304, -2.013131, 1, 0, 0, 1, 1,
-0.9299493, -0.9757497, -1.48442, 1, 0, 0, 1, 1,
-0.9257446, -2.144999, -4.566052, 0, 0, 0, 1, 1,
-0.9198095, -1.525611, -2.392185, 0, 0, 0, 1, 1,
-0.8944562, 0.4254337, -1.437872, 0, 0, 0, 1, 1,
-0.8898095, -0.8532258, -1.406126, 0, 0, 0, 1, 1,
-0.8781206, 0.7638304, -0.2856047, 0, 0, 0, 1, 1,
-0.8687571, -0.6067194, -3.607482, 0, 0, 0, 1, 1,
-0.8654447, 0.4427299, -1.196853, 0, 0, 0, 1, 1,
-0.8629948, -0.7306072, -1.920051, 1, 1, 1, 1, 1,
-0.8626261, 0.5878582, -0.6676288, 1, 1, 1, 1, 1,
-0.8611061, -0.4995355, -2.823289, 1, 1, 1, 1, 1,
-0.8604665, 1.523747, -1.049793, 1, 1, 1, 1, 1,
-0.8582207, -0.1522204, -2.841613, 1, 1, 1, 1, 1,
-0.8566837, -1.23136, -1.833, 1, 1, 1, 1, 1,
-0.8545544, -0.3023732, -0.6959704, 1, 1, 1, 1, 1,
-0.8537272, 1.013541, 0.2583026, 1, 1, 1, 1, 1,
-0.8341748, 0.741625, -3.020307, 1, 1, 1, 1, 1,
-0.8335296, -0.919691, -2.751087, 1, 1, 1, 1, 1,
-0.8330684, -0.4429258, -1.773014, 1, 1, 1, 1, 1,
-0.8288773, -0.5814987, -1.30899, 1, 1, 1, 1, 1,
-0.8283726, 1.845558, -0.3430801, 1, 1, 1, 1, 1,
-0.8268373, 2.326229, -0.4161574, 1, 1, 1, 1, 1,
-0.8249094, -1.863329, -2.616522, 1, 1, 1, 1, 1,
-0.8229774, 0.6329722, -1.896484, 0, 0, 1, 1, 1,
-0.8136009, -0.566098, -2.120183, 1, 0, 0, 1, 1,
-0.8123542, -1.509649, -3.345679, 1, 0, 0, 1, 1,
-0.8063607, -0.1688159, -1.804829, 1, 0, 0, 1, 1,
-0.8055648, 1.165228, -0.07556012, 1, 0, 0, 1, 1,
-0.7953703, -0.9596487, -4.090108, 1, 0, 0, 1, 1,
-0.7890315, 1.944354, 0.828446, 0, 0, 0, 1, 1,
-0.78254, -1.850455, -2.302294, 0, 0, 0, 1, 1,
-0.7812354, -0.4379098, -1.580293, 0, 0, 0, 1, 1,
-0.7737212, 0.7966108, -0.4423546, 0, 0, 0, 1, 1,
-0.7678715, 0.8664391, -0.635658, 0, 0, 0, 1, 1,
-0.7675021, 1.524571, 1.307005, 0, 0, 0, 1, 1,
-0.7663271, -0.2945111, -1.771624, 0, 0, 0, 1, 1,
-0.7651628, -1.006533, -1.798481, 1, 1, 1, 1, 1,
-0.764118, -0.5568347, -1.613002, 1, 1, 1, 1, 1,
-0.7615766, 0.6782202, 0.09503194, 1, 1, 1, 1, 1,
-0.7615157, 0.3160721, -1.166603, 1, 1, 1, 1, 1,
-0.7567779, -1.385682, -4.569963, 1, 1, 1, 1, 1,
-0.7527944, -0.6141734, -0.206115, 1, 1, 1, 1, 1,
-0.732153, 0.4133649, -2.215562, 1, 1, 1, 1, 1,
-0.7287833, -0.3872968, -0.5809498, 1, 1, 1, 1, 1,
-0.7243672, -0.408651, -1.714271, 1, 1, 1, 1, 1,
-0.7138227, 0.60373, -0.5379754, 1, 1, 1, 1, 1,
-0.7084565, 0.2064443, -2.777102, 1, 1, 1, 1, 1,
-0.7076269, 0.1605402, -2.77428, 1, 1, 1, 1, 1,
-0.694114, -0.7208492, -3.105766, 1, 1, 1, 1, 1,
-0.691505, 1.273254, -0.9857528, 1, 1, 1, 1, 1,
-0.6912041, -0.4038271, -2.996568, 1, 1, 1, 1, 1,
-0.6905974, -0.9852639, -2.471674, 0, 0, 1, 1, 1,
-0.6904275, 0.2775034, -1.327839, 1, 0, 0, 1, 1,
-0.6887852, -0.566803, -3.69154, 1, 0, 0, 1, 1,
-0.6844565, 1.232104, 1.202391, 1, 0, 0, 1, 1,
-0.684283, -0.2058866, 1.101038, 1, 0, 0, 1, 1,
-0.6821692, -0.4318613, -3.136628, 1, 0, 0, 1, 1,
-0.6812173, 0.8300232, -1.090339, 0, 0, 0, 1, 1,
-0.6773157, 0.3082445, -3.656477, 0, 0, 0, 1, 1,
-0.6759888, -0.5658187, -3.52996, 0, 0, 0, 1, 1,
-0.6741101, 1.871711, -0.9824174, 0, 0, 0, 1, 1,
-0.6738147, -0.002138611, -2.083403, 0, 0, 0, 1, 1,
-0.6716166, -0.9106103, -2.135721, 0, 0, 0, 1, 1,
-0.6715093, -0.1561557, -0.7747515, 0, 0, 0, 1, 1,
-0.6712905, 0.6701278, -0.952143, 1, 1, 1, 1, 1,
-0.6649623, -0.3387812, -3.162263, 1, 1, 1, 1, 1,
-0.6642775, -0.6722441, -2.57809, 1, 1, 1, 1, 1,
-0.6629804, 0.2570797, -0.790284, 1, 1, 1, 1, 1,
-0.6627792, -1.559793, -2.092964, 1, 1, 1, 1, 1,
-0.6562814, 0.1148284, 0.5389945, 1, 1, 1, 1, 1,
-0.6506664, 2.145005, -1.431531, 1, 1, 1, 1, 1,
-0.6465417, -0.1544041, -1.470471, 1, 1, 1, 1, 1,
-0.640314, 0.5017139, -0.3060698, 1, 1, 1, 1, 1,
-0.6397722, -0.07161837, -0.8456038, 1, 1, 1, 1, 1,
-0.6394807, 2.042328, -0.9982544, 1, 1, 1, 1, 1,
-0.6301957, -1.567091, -3.730125, 1, 1, 1, 1, 1,
-0.6300551, 0.9344379, 0.451556, 1, 1, 1, 1, 1,
-0.6274474, 1.407917, -1.127355, 1, 1, 1, 1, 1,
-0.6264117, -0.7456686, -3.109679, 1, 1, 1, 1, 1,
-0.6252652, -1.350175, -0.4964787, 0, 0, 1, 1, 1,
-0.6246603, -0.6421772, -2.060416, 1, 0, 0, 1, 1,
-0.6238859, -0.5663477, -4.595204, 1, 0, 0, 1, 1,
-0.6226158, 1.197564, -0.7269325, 1, 0, 0, 1, 1,
-0.6208894, 0.1438879, -0.3084467, 1, 0, 0, 1, 1,
-0.6200782, -1.966297, -2.761508, 1, 0, 0, 1, 1,
-0.6177118, 0.5901534, 0.5610573, 0, 0, 0, 1, 1,
-0.6115661, 0.868965, -0.1912825, 0, 0, 0, 1, 1,
-0.6106933, 1.118361, 0.05357348, 0, 0, 0, 1, 1,
-0.6092733, -0.3653141, -2.750896, 0, 0, 0, 1, 1,
-0.607537, -0.01883076, -1.065236, 0, 0, 0, 1, 1,
-0.6047798, -0.06715881, -2.401927, 0, 0, 0, 1, 1,
-0.6033615, -0.08959154, -1.935571, 0, 0, 0, 1, 1,
-0.5999802, 0.8017616, 0.1725415, 1, 1, 1, 1, 1,
-0.5983108, -0.5276119, -3.550138, 1, 1, 1, 1, 1,
-0.5958632, 0.9681428, -1.502489, 1, 1, 1, 1, 1,
-0.5937178, 0.9966198, -2.178488, 1, 1, 1, 1, 1,
-0.5921201, 0.1441716, -0.9794501, 1, 1, 1, 1, 1,
-0.5901381, -0.3548572, -0.8517727, 1, 1, 1, 1, 1,
-0.5859645, -0.6748432, -2.363744, 1, 1, 1, 1, 1,
-0.58252, -0.382031, -2.72032, 1, 1, 1, 1, 1,
-0.5756902, 0.3918552, 0.2028475, 1, 1, 1, 1, 1,
-0.5741145, 0.1035802, -3.747226, 1, 1, 1, 1, 1,
-0.5729973, -0.7399271, -2.266786, 1, 1, 1, 1, 1,
-0.5728077, 1.736668, 0.4475393, 1, 1, 1, 1, 1,
-0.5715145, -0.7129132, -5.613375, 1, 1, 1, 1, 1,
-0.570951, 1.564222, 0.8512433, 1, 1, 1, 1, 1,
-0.5651274, 0.4141067, -0.7959468, 1, 1, 1, 1, 1,
-0.5620193, 1.795953, 0.841747, 0, 0, 1, 1, 1,
-0.5615759, -2.344941, -3.955401, 1, 0, 0, 1, 1,
-0.5612891, 0.73184, -0.7244949, 1, 0, 0, 1, 1,
-0.5576509, 0.2232925, -2.022364, 1, 0, 0, 1, 1,
-0.5574962, -0.5321733, -2.889293, 1, 0, 0, 1, 1,
-0.556792, -0.5727316, -3.167287, 1, 0, 0, 1, 1,
-0.554801, -0.7373915, -2.360596, 0, 0, 0, 1, 1,
-0.5505148, -1.251721, -2.365146, 0, 0, 0, 1, 1,
-0.5478884, -0.2600821, -0.8075742, 0, 0, 0, 1, 1,
-0.547726, 1.016066, -1.136919, 0, 0, 0, 1, 1,
-0.5420787, -1.279349, -4.626505, 0, 0, 0, 1, 1,
-0.5419005, 0.6850228, -0.06518001, 0, 0, 0, 1, 1,
-0.5373347, 2.474602, 0.6213914, 0, 0, 0, 1, 1,
-0.5332823, -0.2202336, -1.873005, 1, 1, 1, 1, 1,
-0.5321814, 0.9111878, 1.509887, 1, 1, 1, 1, 1,
-0.5241706, -0.3682587, -2.019027, 1, 1, 1, 1, 1,
-0.521741, 0.8954273, -0.411233, 1, 1, 1, 1, 1,
-0.5188897, -0.4853319, -2.646313, 1, 1, 1, 1, 1,
-0.5180156, -0.4092762, -2.689743, 1, 1, 1, 1, 1,
-0.5179071, -2.706631, -1.972029, 1, 1, 1, 1, 1,
-0.5156884, 1.315678, -0.5076188, 1, 1, 1, 1, 1,
-0.5152318, -1.306165, -2.831001, 1, 1, 1, 1, 1,
-0.5148523, -1.164373, -1.430148, 1, 1, 1, 1, 1,
-0.5131574, -0.9643859, -1.967427, 1, 1, 1, 1, 1,
-0.5034063, -0.7051691, -2.808177, 1, 1, 1, 1, 1,
-0.502862, -0.5650474, -1.578351, 1, 1, 1, 1, 1,
-0.5004331, 1.598556, -0.1350334, 1, 1, 1, 1, 1,
-0.4958892, -0.8972778, -0.8592389, 1, 1, 1, 1, 1,
-0.4955892, 0.2605734, -4.264305, 0, 0, 1, 1, 1,
-0.489058, 1.259933, 0.4084793, 1, 0, 0, 1, 1,
-0.4878527, -1.922943, -1.213359, 1, 0, 0, 1, 1,
-0.4854987, 0.2328916, -1.028281, 1, 0, 0, 1, 1,
-0.4824681, -1.472392, -2.250407, 1, 0, 0, 1, 1,
-0.478949, 1.270217, -2.052475, 1, 0, 0, 1, 1,
-0.4781199, -0.8364505, -1.394328, 0, 0, 0, 1, 1,
-0.4766913, -0.5439231, -1.073907, 0, 0, 0, 1, 1,
-0.4753223, 1.809317, -1.405946, 0, 0, 0, 1, 1,
-0.4730321, -0.3729363, -2.149132, 0, 0, 0, 1, 1,
-0.4710352, 1.11851, -3.012207, 0, 0, 0, 1, 1,
-0.4687709, 0.3716247, -1.199408, 0, 0, 0, 1, 1,
-0.4673727, -0.07489423, -0.7142694, 0, 0, 0, 1, 1,
-0.4621159, -0.9483036, -1.663498, 1, 1, 1, 1, 1,
-0.4567902, -1.12127, -4.07388, 1, 1, 1, 1, 1,
-0.4552141, -0.1177057, -3.323692, 1, 1, 1, 1, 1,
-0.4516128, -0.6567945, -2.723921, 1, 1, 1, 1, 1,
-0.4470267, 0.2028111, -0.1573169, 1, 1, 1, 1, 1,
-0.4428032, 1.303801, -1.02591, 1, 1, 1, 1, 1,
-0.4409696, -0.7965015, -3.557025, 1, 1, 1, 1, 1,
-0.4308234, 0.485339, 0.4912004, 1, 1, 1, 1, 1,
-0.4266822, 1.560412, -1.639508, 1, 1, 1, 1, 1,
-0.416771, -0.166342, -2.644779, 1, 1, 1, 1, 1,
-0.4137411, 1.169292, -2.007187, 1, 1, 1, 1, 1,
-0.412961, 0.5549923, 0.1547967, 1, 1, 1, 1, 1,
-0.4126326, 0.02689827, -2.19917, 1, 1, 1, 1, 1,
-0.4115831, -0.7889163, -4.099325, 1, 1, 1, 1, 1,
-0.4029485, -0.2010874, -1.69209, 1, 1, 1, 1, 1,
-0.3953139, -0.7527681, -4.471038, 0, 0, 1, 1, 1,
-0.3936926, -1.67429, -2.397666, 1, 0, 0, 1, 1,
-0.3918577, -0.7894018, -3.079522, 1, 0, 0, 1, 1,
-0.3915034, 0.3763209, -1.349039, 1, 0, 0, 1, 1,
-0.389455, -0.1618701, -1.506161, 1, 0, 0, 1, 1,
-0.3874962, 0.170479, -1.270643, 1, 0, 0, 1, 1,
-0.384067, 1.803416, -1.129618, 0, 0, 0, 1, 1,
-0.3821736, 0.774211, -1.380861, 0, 0, 0, 1, 1,
-0.3806096, -0.02147796, -0.2417948, 0, 0, 0, 1, 1,
-0.3764245, 1.385298, -0.8980545, 0, 0, 0, 1, 1,
-0.3699892, 0.6662145, 0.08194393, 0, 0, 0, 1, 1,
-0.3699757, -0.6697109, -2.403109, 0, 0, 0, 1, 1,
-0.3680777, 0.3073807, -0.7945008, 0, 0, 0, 1, 1,
-0.365352, -0.09351541, -2.228068, 1, 1, 1, 1, 1,
-0.3635568, -0.02586759, -1.305076, 1, 1, 1, 1, 1,
-0.358384, -1.41874, -2.97973, 1, 1, 1, 1, 1,
-0.3551316, 0.1705827, -0.5229049, 1, 1, 1, 1, 1,
-0.3456284, 0.6065758, -2.498476, 1, 1, 1, 1, 1,
-0.3420461, 1.256877, -0.6376156, 1, 1, 1, 1, 1,
-0.3387783, -1.737977, -2.690749, 1, 1, 1, 1, 1,
-0.3320108, -0.2603923, -2.964287, 1, 1, 1, 1, 1,
-0.3318967, 1.832956, -1.08235, 1, 1, 1, 1, 1,
-0.3315367, -0.7393016, -2.083113, 1, 1, 1, 1, 1,
-0.3263128, -0.04187094, -1.014809, 1, 1, 1, 1, 1,
-0.3246222, 0.4292448, -1.036823, 1, 1, 1, 1, 1,
-0.3229294, -0.09596479, -1.977865, 1, 1, 1, 1, 1,
-0.3225883, 0.657895, -1.175149, 1, 1, 1, 1, 1,
-0.3157401, -0.5026646, -2.160111, 1, 1, 1, 1, 1,
-0.3102774, -0.199497, -1.307432, 0, 0, 1, 1, 1,
-0.3052928, 0.5165787, 0.01767565, 1, 0, 0, 1, 1,
-0.3037967, -0.6912928, -1.423216, 1, 0, 0, 1, 1,
-0.2937746, 0.1120236, -0.02270645, 1, 0, 0, 1, 1,
-0.2927035, 1.592167, -0.3924765, 1, 0, 0, 1, 1,
-0.2895557, -2.922191, -2.352774, 1, 0, 0, 1, 1,
-0.288326, -1.819553, -0.7464335, 0, 0, 0, 1, 1,
-0.2879169, 0.5692728, -1.007863, 0, 0, 0, 1, 1,
-0.284689, 1.500728, 0.3498715, 0, 0, 0, 1, 1,
-0.2833655, 0.0474817, -1.501153, 0, 0, 0, 1, 1,
-0.2819802, 0.8027986, -0.0971345, 0, 0, 0, 1, 1,
-0.2798852, 1.054206, 0.4283634, 0, 0, 0, 1, 1,
-0.2797419, 0.8444279, 1.587265, 0, 0, 0, 1, 1,
-0.2734337, 1.010879, 0.3854215, 1, 1, 1, 1, 1,
-0.2680756, -0.7303986, -2.47633, 1, 1, 1, 1, 1,
-0.2630536, 0.5147204, -0.1075114, 1, 1, 1, 1, 1,
-0.2610525, -0.07630014, -3.861321, 1, 1, 1, 1, 1,
-0.2589047, 1.314308, -0.557326, 1, 1, 1, 1, 1,
-0.2570995, -1.427924, -3.327323, 1, 1, 1, 1, 1,
-0.2449138, -1.607201, -1.488269, 1, 1, 1, 1, 1,
-0.2416598, -1.34196, -0.9980769, 1, 1, 1, 1, 1,
-0.2412755, 1.748336, -0.9598717, 1, 1, 1, 1, 1,
-0.2394232, -0.3432037, -2.601161, 1, 1, 1, 1, 1,
-0.2388293, -0.01136652, -2.507246, 1, 1, 1, 1, 1,
-0.2368889, 0.4212711, 2.11698, 1, 1, 1, 1, 1,
-0.2323888, -0.8891654, -2.329804, 1, 1, 1, 1, 1,
-0.228726, -1.573605, -4.311683, 1, 1, 1, 1, 1,
-0.2240518, 1.601122, -1.855929, 1, 1, 1, 1, 1,
-0.222977, -0.914849, -1.515808, 0, 0, 1, 1, 1,
-0.2212804, 0.1399107, -0.7079795, 1, 0, 0, 1, 1,
-0.2201895, 1.834221, -0.4457429, 1, 0, 0, 1, 1,
-0.214322, -0.6738797, -1.648456, 1, 0, 0, 1, 1,
-0.2137234, 1.057544, 1.620347, 1, 0, 0, 1, 1,
-0.2116859, -0.250865, -2.391388, 1, 0, 0, 1, 1,
-0.2079972, 0.02488296, -2.618753, 0, 0, 0, 1, 1,
-0.2019747, 0.5247396, -2.064605, 0, 0, 0, 1, 1,
-0.2008258, 2.24794, -1.634097, 0, 0, 0, 1, 1,
-0.198332, 1.034905, -0.3150027, 0, 0, 0, 1, 1,
-0.195272, 1.58048, 0.5119179, 0, 0, 0, 1, 1,
-0.1911059, 0.1075983, 0.7040569, 0, 0, 0, 1, 1,
-0.1848298, -0.1684868, -0.6734777, 0, 0, 0, 1, 1,
-0.1846518, -0.08663242, -1.73426, 1, 1, 1, 1, 1,
-0.1831762, -0.5858467, -2.272498, 1, 1, 1, 1, 1,
-0.1827089, 0.9010805, 0.1409058, 1, 1, 1, 1, 1,
-0.1819677, 0.3252059, -0.8307418, 1, 1, 1, 1, 1,
-0.1808283, 0.03107912, -0.3819586, 1, 1, 1, 1, 1,
-0.1806274, -0.4934559, -1.727039, 1, 1, 1, 1, 1,
-0.1794894, 0.6615936, 1.142924, 1, 1, 1, 1, 1,
-0.1760948, 0.2329386, 1.09042, 1, 1, 1, 1, 1,
-0.1693678, -0.8957016, -3.336409, 1, 1, 1, 1, 1,
-0.1675729, 0.902915, 1.466566, 1, 1, 1, 1, 1,
-0.1673405, -1.117746, -3.97345, 1, 1, 1, 1, 1,
-0.1668999, 0.5756493, -1.453192, 1, 1, 1, 1, 1,
-0.1657259, 1.421021, -0.7238697, 1, 1, 1, 1, 1,
-0.1633744, 0.9013326, -0.2298104, 1, 1, 1, 1, 1,
-0.1617579, 1.629963, 0.0612575, 1, 1, 1, 1, 1,
-0.158494, 0.9712569, -0.7120467, 0, 0, 1, 1, 1,
-0.1570641, 0.1745055, -1.398222, 1, 0, 0, 1, 1,
-0.1551924, 0.131764, -1.088476, 1, 0, 0, 1, 1,
-0.1532338, -0.417128, -4.138911, 1, 0, 0, 1, 1,
-0.1492698, 0.412298, -2.090886, 1, 0, 0, 1, 1,
-0.1483781, -0.301871, -3.686435, 1, 0, 0, 1, 1,
-0.1470598, -0.06999271, -3.169261, 0, 0, 0, 1, 1,
-0.1458791, 0.1439429, -0.4675072, 0, 0, 0, 1, 1,
-0.1448242, -0.1014008, -2.859345, 0, 0, 0, 1, 1,
-0.1439613, 0.2090479, -1.572552, 0, 0, 0, 1, 1,
-0.1413607, 0.6311527, 1.089532, 0, 0, 0, 1, 1,
-0.1403123, -0.5107489, -3.785605, 0, 0, 0, 1, 1,
-0.1381988, -2.075313, -3.322316, 0, 0, 0, 1, 1,
-0.1359479, 0.8675433, -0.3254578, 1, 1, 1, 1, 1,
-0.1235103, 1.110601, 2.208337, 1, 1, 1, 1, 1,
-0.121235, -1.187575, -4.055203, 1, 1, 1, 1, 1,
-0.1176418, -1.035598, -4.321174, 1, 1, 1, 1, 1,
-0.1127048, 1.105701, 0.3097175, 1, 1, 1, 1, 1,
-0.1122467, -1.077733, -2.363844, 1, 1, 1, 1, 1,
-0.110651, -0.6761358, -3.739062, 1, 1, 1, 1, 1,
-0.1073536, 1.334186, -0.6601151, 1, 1, 1, 1, 1,
-0.09960001, -0.5531825, -2.67951, 1, 1, 1, 1, 1,
-0.09513298, -0.8089164, -3.492867, 1, 1, 1, 1, 1,
-0.09019025, 0.8489753, 0.008822154, 1, 1, 1, 1, 1,
-0.08664812, -0.1339471, -1.680698, 1, 1, 1, 1, 1,
-0.08640886, -0.04108829, -1.887829, 1, 1, 1, 1, 1,
-0.08190142, 0.7780014, -2.575647, 1, 1, 1, 1, 1,
-0.07311966, 0.8974229, 0.5058468, 1, 1, 1, 1, 1,
-0.06446969, -1.329881, -2.430268, 0, 0, 1, 1, 1,
-0.05277592, -1.693398, -3.65597, 1, 0, 0, 1, 1,
-0.04861435, -2.140413, -3.355183, 1, 0, 0, 1, 1,
-0.04784977, -0.1549483, -0.2212594, 1, 0, 0, 1, 1,
-0.04774912, -0.4215345, -1.493924, 1, 0, 0, 1, 1,
-0.04723277, 0.3245124, -0.2972782, 1, 0, 0, 1, 1,
-0.04665446, -0.4184485, -2.708634, 0, 0, 0, 1, 1,
-0.04577951, 1.153583, -1.321378, 0, 0, 0, 1, 1,
-0.04472232, 1.603912, -1.845447, 0, 0, 0, 1, 1,
-0.04146479, 0.1511013, 0.561844, 0, 0, 0, 1, 1,
-0.03994351, -0.9994051, -4.489067, 0, 0, 0, 1, 1,
-0.03381835, -0.4897972, -3.19646, 0, 0, 0, 1, 1,
-0.03312216, 0.1266394, -0.3192949, 0, 0, 0, 1, 1,
-0.03143403, 1.214436, -0.4350097, 1, 1, 1, 1, 1,
-0.02652418, -0.4736369, -3.512345, 1, 1, 1, 1, 1,
-0.02277895, 0.1186317, 0.4788596, 1, 1, 1, 1, 1,
-0.01806012, 0.7466462, -0.08609679, 1, 1, 1, 1, 1,
-0.0168952, -1.076356, -3.926462, 1, 1, 1, 1, 1,
-0.01579843, -1.04439, -5.025824, 1, 1, 1, 1, 1,
-0.01208992, -0.9662221, -4.204494, 1, 1, 1, 1, 1,
-0.008057576, 0.8472292, -0.3841868, 1, 1, 1, 1, 1,
-0.005907811, 2.513942, 0.2258978, 1, 1, 1, 1, 1,
-0.003511345, 0.2086584, -0.643117, 1, 1, 1, 1, 1,
-0.0006765586, 1.215608, 0.7552716, 1, 1, 1, 1, 1,
-0.0004871617, 1.472157, -0.4315594, 1, 1, 1, 1, 1,
0.001886413, -0.922542, 2.683812, 1, 1, 1, 1, 1,
0.001977552, 0.5407834, -0.7582259, 1, 1, 1, 1, 1,
0.002097276, 3.705844, -0.6375158, 1, 1, 1, 1, 1,
0.007931788, 0.5393839, 0.723639, 0, 0, 1, 1, 1,
0.01105446, 0.2251183, -0.5787023, 1, 0, 0, 1, 1,
0.01221765, -0.02057555, 2.887764, 1, 0, 0, 1, 1,
0.01296779, -1.148794, 3.088741, 1, 0, 0, 1, 1,
0.0158161, -0.1789546, 3.988271, 1, 0, 0, 1, 1,
0.02065801, -1.164535, 3.132307, 1, 0, 0, 1, 1,
0.02192988, 0.4802048, -1.61405, 0, 0, 0, 1, 1,
0.02647635, 0.7217607, -0.5668223, 0, 0, 0, 1, 1,
0.02654699, -0.4715123, 3.474161, 0, 0, 0, 1, 1,
0.02842612, 0.3413067, 1.459915, 0, 0, 0, 1, 1,
0.04022699, 0.6514325, -0.9996238, 0, 0, 0, 1, 1,
0.04542505, -1.218475, 2.279553, 0, 0, 0, 1, 1,
0.04561884, 0.04355116, 0.4945522, 0, 0, 0, 1, 1,
0.0473565, 0.5293694, -0.002473747, 1, 1, 1, 1, 1,
0.04744782, 1.979798, -1.228153, 1, 1, 1, 1, 1,
0.05258222, 1.661154, 1.915576, 1, 1, 1, 1, 1,
0.05352665, 0.1519392, 1.051529, 1, 1, 1, 1, 1,
0.05400464, 0.8172301, -2.222845, 1, 1, 1, 1, 1,
0.059609, 0.4180623, -0.2339433, 1, 1, 1, 1, 1,
0.05962589, -1.625135, 2.860522, 1, 1, 1, 1, 1,
0.06381549, -2.497501, 3.208993, 1, 1, 1, 1, 1,
0.06586655, 0.1685694, 0.8686079, 1, 1, 1, 1, 1,
0.06723332, 0.3628674, -0.2369636, 1, 1, 1, 1, 1,
0.06854262, 0.6485207, 0.8554857, 1, 1, 1, 1, 1,
0.06959354, 0.195217, 0.9298668, 1, 1, 1, 1, 1,
0.07311507, 0.902193, 1.113433, 1, 1, 1, 1, 1,
0.07370137, 0.8753418, -1.40576, 1, 1, 1, 1, 1,
0.07814854, -0.5231016, 2.818792, 1, 1, 1, 1, 1,
0.07874603, 0.9849866, 0.6258681, 0, 0, 1, 1, 1,
0.0809039, -0.9075195, 3.851133, 1, 0, 0, 1, 1,
0.0809516, -1.666974, 3.360369, 1, 0, 0, 1, 1,
0.081554, 0.1457057, 0.9764387, 1, 0, 0, 1, 1,
0.08165898, 0.1209332, 1.618973, 1, 0, 0, 1, 1,
0.08179252, -1.251579, 4.036847, 1, 0, 0, 1, 1,
0.08199573, 0.7379146, -1.025418, 0, 0, 0, 1, 1,
0.08463838, 0.4561845, 1.067278, 0, 0, 0, 1, 1,
0.08590256, -0.6481559, 3.426199, 0, 0, 0, 1, 1,
0.08790343, 0.2097458, -0.1374692, 0, 0, 0, 1, 1,
0.09308261, -0.4720069, 2.972693, 0, 0, 0, 1, 1,
0.09402873, -0.8452277, 2.601361, 0, 0, 0, 1, 1,
0.0945349, -0.9184839, 3.395801, 0, 0, 0, 1, 1,
0.09546039, -1.451064, 2.173704, 1, 1, 1, 1, 1,
0.09904709, -2.056415, 3.791097, 1, 1, 1, 1, 1,
0.09927066, 0.8037617, 0.466727, 1, 1, 1, 1, 1,
0.1004053, -0.1150754, 2.043042, 1, 1, 1, 1, 1,
0.1024911, -0.7846779, 2.396831, 1, 1, 1, 1, 1,
0.1040302, 1.26483, -0.6536756, 1, 1, 1, 1, 1,
0.1067505, 1.918919, -1.079497, 1, 1, 1, 1, 1,
0.1088154, 0.3115264, 0.5341404, 1, 1, 1, 1, 1,
0.1094231, -0.2488268, 3.661411, 1, 1, 1, 1, 1,
0.1108216, 0.9135951, -1.430953, 1, 1, 1, 1, 1,
0.1112236, -0.9546429, 3.521592, 1, 1, 1, 1, 1,
0.1129123, 0.3060217, 0.09636236, 1, 1, 1, 1, 1,
0.1195599, 0.7952884, -1.106704, 1, 1, 1, 1, 1,
0.1204871, 0.1493359, -0.6957949, 1, 1, 1, 1, 1,
0.1215167, 0.127109, 0.3118725, 1, 1, 1, 1, 1,
0.1229118, -0.9365966, 1.587259, 0, 0, 1, 1, 1,
0.1249186, -0.1495795, 3.895033, 1, 0, 0, 1, 1,
0.1282306, 0.6366848, -0.3141138, 1, 0, 0, 1, 1,
0.1298455, -2.880526, 2.964565, 1, 0, 0, 1, 1,
0.1323823, 0.08159642, 1.764273, 1, 0, 0, 1, 1,
0.1347055, 0.3831258, 0.2041794, 1, 0, 0, 1, 1,
0.1393694, 0.758609, 0.3911281, 0, 0, 0, 1, 1,
0.1464016, 0.5067232, 0.02601845, 0, 0, 0, 1, 1,
0.148447, 0.9992613, -0.08621496, 0, 0, 0, 1, 1,
0.1486924, 0.2776101, 2.208541, 0, 0, 0, 1, 1,
0.1523539, -0.8232045, 2.618076, 0, 0, 0, 1, 1,
0.1531107, -0.3626371, 5.205733, 0, 0, 0, 1, 1,
0.1574218, 0.5824555, -0.2264339, 0, 0, 0, 1, 1,
0.1596963, 1.026674, 0.8826978, 1, 1, 1, 1, 1,
0.1598586, 0.8543965, 1.078794, 1, 1, 1, 1, 1,
0.1630159, 1.281143, 1.269704, 1, 1, 1, 1, 1,
0.1634123, 1.362269, -0.372755, 1, 1, 1, 1, 1,
0.1641905, 0.8344838, -0.7321554, 1, 1, 1, 1, 1,
0.1656364, -1.434783, 3.965894, 1, 1, 1, 1, 1,
0.1657371, -0.149326, 1.988632, 1, 1, 1, 1, 1,
0.1665794, -0.03553553, 4.060087, 1, 1, 1, 1, 1,
0.1674274, 0.5171827, -0.5121192, 1, 1, 1, 1, 1,
0.1698586, 0.2619051, 1.357845, 1, 1, 1, 1, 1,
0.1699459, 1.442338, -0.4302323, 1, 1, 1, 1, 1,
0.1734546, -0.5602532, 3.267815, 1, 1, 1, 1, 1,
0.1746112, -1.523732, 2.027545, 1, 1, 1, 1, 1,
0.178156, 0.8057356, 1.591713, 1, 1, 1, 1, 1,
0.1917259, -0.7475357, 3.443561, 1, 1, 1, 1, 1,
0.1923566, -0.8977066, 3.31028, 0, 0, 1, 1, 1,
0.1930692, -1.657758, 3.191685, 1, 0, 0, 1, 1,
0.1937666, 0.04200852, 1.764007, 1, 0, 0, 1, 1,
0.1999265, -0.6029476, 2.879746, 1, 0, 0, 1, 1,
0.207651, -0.07957787, 2.09247, 1, 0, 0, 1, 1,
0.2081364, -0.4801977, 2.304758, 1, 0, 0, 1, 1,
0.2086663, 0.5610215, 0.6034604, 0, 0, 0, 1, 1,
0.2105182, -0.5294718, 3.736652, 0, 0, 0, 1, 1,
0.2143312, -1.830302, 2.130018, 0, 0, 0, 1, 1,
0.2192085, -0.553027, 3.543242, 0, 0, 0, 1, 1,
0.2215679, -0.2042, 1.34721, 0, 0, 0, 1, 1,
0.2306899, -0.3028211, 1.96366, 0, 0, 0, 1, 1,
0.2335274, 0.7970957, 0.4466152, 0, 0, 0, 1, 1,
0.2348877, 0.5869631, 0.3078623, 1, 1, 1, 1, 1,
0.2361486, -0.2249621, 0.325646, 1, 1, 1, 1, 1,
0.2372136, -0.3964677, -0.19707, 1, 1, 1, 1, 1,
0.2396693, 0.7340561, 2.263768, 1, 1, 1, 1, 1,
0.2397307, 0.6575513, 1.59946, 1, 1, 1, 1, 1,
0.2398658, 0.2320707, 0.8460788, 1, 1, 1, 1, 1,
0.24177, 1.745454, 1.23113, 1, 1, 1, 1, 1,
0.2448206, -0.4283106, 2.378273, 1, 1, 1, 1, 1,
0.245651, -2.071903, 5.622282, 1, 1, 1, 1, 1,
0.2502391, -1.519229, 3.337887, 1, 1, 1, 1, 1,
0.2515886, 0.2976484, 0.4963461, 1, 1, 1, 1, 1,
0.2525656, 0.9813228, -0.3670081, 1, 1, 1, 1, 1,
0.2532151, 1.408667, 0.5351548, 1, 1, 1, 1, 1,
0.2586839, 0.3762955, 0.6589141, 1, 1, 1, 1, 1,
0.2612258, -0.5678608, 2.228879, 1, 1, 1, 1, 1,
0.2646443, -1.345831, 3.238007, 0, 0, 1, 1, 1,
0.26488, -0.1440036, 0.6297286, 1, 0, 0, 1, 1,
0.2670894, -0.09025244, 1.218891, 1, 0, 0, 1, 1,
0.2677695, 1.150832, -0.7211127, 1, 0, 0, 1, 1,
0.2692444, -0.6442742, 1.640268, 1, 0, 0, 1, 1,
0.2708596, 1.478377, 0.398415, 1, 0, 0, 1, 1,
0.2735708, -0.01280815, 1.959572, 0, 0, 0, 1, 1,
0.2737641, 0.9933861, -0.295455, 0, 0, 0, 1, 1,
0.2761951, 0.2598836, -0.3498773, 0, 0, 0, 1, 1,
0.2772121, -0.2190155, 2.629243, 0, 0, 0, 1, 1,
0.2796605, 0.2618794, 1.293799, 0, 0, 0, 1, 1,
0.2818449, -0.5254849, 1.102494, 0, 0, 0, 1, 1,
0.281893, -0.1949914, 2.305475, 0, 0, 0, 1, 1,
0.2842138, 1.377685, 0.04807476, 1, 1, 1, 1, 1,
0.2914118, 0.1617595, 1.787184, 1, 1, 1, 1, 1,
0.2914152, -0.7193827, 3.748055, 1, 1, 1, 1, 1,
0.2983603, 1.442428, 0.9836855, 1, 1, 1, 1, 1,
0.3018009, 0.8298731, 0.5167155, 1, 1, 1, 1, 1,
0.3028137, -0.94783, 2.683596, 1, 1, 1, 1, 1,
0.3053015, 0.7046714, 0.8140446, 1, 1, 1, 1, 1,
0.308388, -1.041181, 2.221348, 1, 1, 1, 1, 1,
0.3107762, 0.334336, 2.450144, 1, 1, 1, 1, 1,
0.311931, 1.392999, 0.6758169, 1, 1, 1, 1, 1,
0.3165298, 0.195375, 2.600817, 1, 1, 1, 1, 1,
0.3188544, -1.791712, 3.21544, 1, 1, 1, 1, 1,
0.3197551, -0.006174142, 2.101944, 1, 1, 1, 1, 1,
0.3233405, 0.4416698, 1.027947, 1, 1, 1, 1, 1,
0.327091, -0.1772354, 1.35466, 1, 1, 1, 1, 1,
0.333256, -0.01963129, 2.441674, 0, 0, 1, 1, 1,
0.3383836, -0.6948227, 1.832087, 1, 0, 0, 1, 1,
0.3434131, 1.275513, -0.03618905, 1, 0, 0, 1, 1,
0.344257, -0.4038416, 2.756077, 1, 0, 0, 1, 1,
0.3454138, 0.03165243, 2.552962, 1, 0, 0, 1, 1,
0.3493716, -0.0402141, -0.0359339, 1, 0, 0, 1, 1,
0.3511187, 0.3126732, 1.671152, 0, 0, 0, 1, 1,
0.3535113, -0.3589638, 2.117895, 0, 0, 0, 1, 1,
0.3572624, 1.164073, 1.113698, 0, 0, 0, 1, 1,
0.3579746, 0.1855685, 1.185971, 0, 0, 0, 1, 1,
0.3651036, -0.3322608, 4.433531, 0, 0, 0, 1, 1,
0.3709309, 0.2732858, 1.963129, 0, 0, 0, 1, 1,
0.3712666, 0.5941833, 0.8061816, 0, 0, 0, 1, 1,
0.3714727, -0.3244314, 2.049341, 1, 1, 1, 1, 1,
0.3764258, 0.1335214, 1.513076, 1, 1, 1, 1, 1,
0.3786205, -0.3977195, 2.367652, 1, 1, 1, 1, 1,
0.3830931, -0.5614611, 2.511595, 1, 1, 1, 1, 1,
0.3841896, -0.01443549, 1.626076, 1, 1, 1, 1, 1,
0.384509, 0.3495267, 0.003001522, 1, 1, 1, 1, 1,
0.3848288, -1.182079, 2.409665, 1, 1, 1, 1, 1,
0.3870289, 0.9172518, -0.7564373, 1, 1, 1, 1, 1,
0.3872151, -0.3711341, 3.34113, 1, 1, 1, 1, 1,
0.3906927, 0.4848565, -0.1192876, 1, 1, 1, 1, 1,
0.3954871, -0.08236211, 3.123402, 1, 1, 1, 1, 1,
0.3961111, 0.7555904, 0.9162738, 1, 1, 1, 1, 1,
0.3972106, -1.069639, 4.844035, 1, 1, 1, 1, 1,
0.4049174, 0.9401678, 0.14747, 1, 1, 1, 1, 1,
0.4051915, -2.160186, 4.248827, 1, 1, 1, 1, 1,
0.4053191, 0.02823874, 1.19877, 0, 0, 1, 1, 1,
0.4062077, 0.339435, 2.19559, 1, 0, 0, 1, 1,
0.4125558, 0.06475195, 0.4662944, 1, 0, 0, 1, 1,
0.4168086, 1.132891, -1.44352, 1, 0, 0, 1, 1,
0.4172608, -0.2328423, 2.843982, 1, 0, 0, 1, 1,
0.4175409, 0.04166513, 1.243691, 1, 0, 0, 1, 1,
0.4204744, -0.9121546, 2.249337, 0, 0, 0, 1, 1,
0.4269625, -0.09577662, 1.151024, 0, 0, 0, 1, 1,
0.4277396, 2.281368, -0.4494019, 0, 0, 0, 1, 1,
0.4336122, -1.624047, 1.841003, 0, 0, 0, 1, 1,
0.4340797, -1.198865, 2.893238, 0, 0, 0, 1, 1,
0.4346284, 0.2915772, 0.7408314, 0, 0, 0, 1, 1,
0.4435412, -1.406282, 0.6279225, 0, 0, 0, 1, 1,
0.4458219, -0.9915707, -0.04278374, 1, 1, 1, 1, 1,
0.4485731, 0.2079576, 2.639831, 1, 1, 1, 1, 1,
0.4494151, 0.1976535, 2.435664, 1, 1, 1, 1, 1,
0.4534704, 0.840663, 1.521462, 1, 1, 1, 1, 1,
0.4535322, 0.06494609, 1.469729, 1, 1, 1, 1, 1,
0.4549763, -0.800694, 2.641076, 1, 1, 1, 1, 1,
0.4579129, -0.4393252, 0.5790043, 1, 1, 1, 1, 1,
0.4648254, -0.6688001, 2.497573, 1, 1, 1, 1, 1,
0.4662675, 0.8655093, 0.0294387, 1, 1, 1, 1, 1,
0.4665478, -1.89001, 2.963758, 1, 1, 1, 1, 1,
0.469501, -0.4927012, 2.982297, 1, 1, 1, 1, 1,
0.4754154, -0.4663762, 2.895294, 1, 1, 1, 1, 1,
0.4764646, -0.7482061, 1.90704, 1, 1, 1, 1, 1,
0.4846183, -1.515268, 3.073149, 1, 1, 1, 1, 1,
0.4915606, -0.974303, 2.30384, 1, 1, 1, 1, 1,
0.4917642, 0.1475065, 1.602566, 0, 0, 1, 1, 1,
0.4917944, 0.3173308, 1.348544, 1, 0, 0, 1, 1,
0.492277, -0.7083142, 3.951179, 1, 0, 0, 1, 1,
0.4945941, 0.3616676, 2.587879, 1, 0, 0, 1, 1,
0.49479, 2.08549, -1.924053, 1, 0, 0, 1, 1,
0.4952885, -1.847969, 1.173818, 1, 0, 0, 1, 1,
0.496033, -0.6927945, 1.9209, 0, 0, 0, 1, 1,
0.5012619, 1.674378, 1.488628, 0, 0, 0, 1, 1,
0.5037425, -0.09547189, 1.228327, 0, 0, 0, 1, 1,
0.5040648, 2.578797, 0.08000837, 0, 0, 0, 1, 1,
0.5071937, 0.8725538, 0.4968352, 0, 0, 0, 1, 1,
0.5102221, 0.6335011, 1.943046, 0, 0, 0, 1, 1,
0.5152, -0.4312401, 2.448698, 0, 0, 0, 1, 1,
0.515517, 1.008396, 0.2141847, 1, 1, 1, 1, 1,
0.5237106, -1.340009, 2.606497, 1, 1, 1, 1, 1,
0.5252944, 0.7575499, 0.9939278, 1, 1, 1, 1, 1,
0.5291275, -1.304219, 2.133384, 1, 1, 1, 1, 1,
0.5316323, 1.633765, -1.243741, 1, 1, 1, 1, 1,
0.5371795, -1.33669, 3.619309, 1, 1, 1, 1, 1,
0.541391, -0.5911919, 3.266564, 1, 1, 1, 1, 1,
0.5446591, -0.9177898, 3.201453, 1, 1, 1, 1, 1,
0.5450732, -0.5716516, 2.333807, 1, 1, 1, 1, 1,
0.5451285, 1.251039, 1.206967, 1, 1, 1, 1, 1,
0.5481504, 0.8819287, -0.525277, 1, 1, 1, 1, 1,
0.5514681, -2.154817, 2.44731, 1, 1, 1, 1, 1,
0.5627375, 0.8300343, -0.7977518, 1, 1, 1, 1, 1,
0.5642523, 0.5176016, 1.735774, 1, 1, 1, 1, 1,
0.5673278, 1.10596, -0.2915671, 1, 1, 1, 1, 1,
0.569123, 0.8400822, -0.3965263, 0, 0, 1, 1, 1,
0.571305, 0.2422132, 1.173239, 1, 0, 0, 1, 1,
0.572381, -1.677058, 3.983129, 1, 0, 0, 1, 1,
0.5730877, 0.004820413, 0.8225845, 1, 0, 0, 1, 1,
0.5741673, 1.147546, 1.201857, 1, 0, 0, 1, 1,
0.5742779, 0.8112818, 1.408661, 1, 0, 0, 1, 1,
0.5789925, 0.6626832, -0.3418235, 0, 0, 0, 1, 1,
0.5804473, -1.625619, 3.740611, 0, 0, 0, 1, 1,
0.5815729, 0.3728516, 0.09517681, 0, 0, 0, 1, 1,
0.5820155, 0.524821, 1.692583, 0, 0, 0, 1, 1,
0.582812, 0.9700488, 1.390575, 0, 0, 0, 1, 1,
0.5848363, -0.8155541, 3.424882, 0, 0, 0, 1, 1,
0.5864428, 0.1135191, 1.904706, 0, 0, 0, 1, 1,
0.5882235, -0.1798078, 0.06681628, 1, 1, 1, 1, 1,
0.5885779, 0.9907904, 1.195811, 1, 1, 1, 1, 1,
0.5888832, 1.535077, 0.7828453, 1, 1, 1, 1, 1,
0.5908285, 2.010614, 0.2755211, 1, 1, 1, 1, 1,
0.5928954, -0.6517854, 1.378007, 1, 1, 1, 1, 1,
0.5944706, 0.4612028, 2.116107, 1, 1, 1, 1, 1,
0.5977107, 0.6499456, 0.4273901, 1, 1, 1, 1, 1,
0.6001775, -1.669574, 2.960064, 1, 1, 1, 1, 1,
0.6011237, -1.513243, 5.0101, 1, 1, 1, 1, 1,
0.6088346, -0.571237, 2.639169, 1, 1, 1, 1, 1,
0.6362936, -1.712086, 0.9379528, 1, 1, 1, 1, 1,
0.6372523, 1.000297, 1.20584, 1, 1, 1, 1, 1,
0.6582142, -0.9070892, 1.983973, 1, 1, 1, 1, 1,
0.6598691, 0.02325586, 0.07330476, 1, 1, 1, 1, 1,
0.6630616, 0.7812454, -1.619413, 1, 1, 1, 1, 1,
0.6655635, -0.2279142, -0.3483174, 0, 0, 1, 1, 1,
0.6675826, 1.073855, 0.6474915, 1, 0, 0, 1, 1,
0.6702977, -1.063598, 2.382063, 1, 0, 0, 1, 1,
0.6719807, 0.5976566, -0.4195782, 1, 0, 0, 1, 1,
0.6739263, 0.3252472, 1.698082, 1, 0, 0, 1, 1,
0.6742078, -0.9595358, 1.632879, 1, 0, 0, 1, 1,
0.677033, -1.117342, 1.181035, 0, 0, 0, 1, 1,
0.6825694, -0.431335, 3.512779, 0, 0, 0, 1, 1,
0.6832865, 0.8127396, 1.904172, 0, 0, 0, 1, 1,
0.6851054, 0.4788054, 1.40515, 0, 0, 0, 1, 1,
0.6875821, -2.413303, 3.170361, 0, 0, 0, 1, 1,
0.6970068, 0.385519, 2.650638, 0, 0, 0, 1, 1,
0.6977568, -0.2490886, 4.090034, 0, 0, 0, 1, 1,
0.7009258, 0.4298379, 1.775997, 1, 1, 1, 1, 1,
0.7013627, 2.054682, 0.06690145, 1, 1, 1, 1, 1,
0.7048218, 1.194526, -1.268806, 1, 1, 1, 1, 1,
0.7066078, -1.838714, 2.846546, 1, 1, 1, 1, 1,
0.7112364, -1.295442, 2.455933, 1, 1, 1, 1, 1,
0.7160589, 0.520945, 1.652481, 1, 1, 1, 1, 1,
0.7163144, 1.736688, -0.5704184, 1, 1, 1, 1, 1,
0.7194993, 0.005353805, 2.258186, 1, 1, 1, 1, 1,
0.7212083, -0.2717539, 0.7312911, 1, 1, 1, 1, 1,
0.7228541, 0.7761828, 0.7393292, 1, 1, 1, 1, 1,
0.7240533, -1.003199, 3.494141, 1, 1, 1, 1, 1,
0.7314398, -0.3370165, 1.829455, 1, 1, 1, 1, 1,
0.7349752, -0.4911097, 3.035292, 1, 1, 1, 1, 1,
0.7412933, 0.5625281, 0.9244248, 1, 1, 1, 1, 1,
0.7453374, -0.9904179, 2.799624, 1, 1, 1, 1, 1,
0.7522827, 1.020666, 1.156268, 0, 0, 1, 1, 1,
0.7528416, -1.401241, 1.484634, 1, 0, 0, 1, 1,
0.7532431, 1.275355, 2.017285, 1, 0, 0, 1, 1,
0.7565764, -1.282653, 0.8586228, 1, 0, 0, 1, 1,
0.7566414, -0.5396217, 1.372943, 1, 0, 0, 1, 1,
0.7595267, 0.1387357, 2.171556, 1, 0, 0, 1, 1,
0.7597302, -0.3025426, 0.9281706, 0, 0, 0, 1, 1,
0.7647527, 0.3680693, -0.4022302, 0, 0, 0, 1, 1,
0.769301, 1.283128, 1.464021, 0, 0, 0, 1, 1,
0.7718236, -0.07805436, 2.473418, 0, 0, 0, 1, 1,
0.7750183, -0.5659679, 0.2087826, 0, 0, 0, 1, 1,
0.7764993, 3.673134, -1.210815, 0, 0, 0, 1, 1,
0.7809094, 1.09376, 1.236691, 0, 0, 0, 1, 1,
0.7810432, -0.9127671, 2.820091, 1, 1, 1, 1, 1,
0.7816519, -0.2137339, 2.203384, 1, 1, 1, 1, 1,
0.7828715, -0.5980704, 1.166225, 1, 1, 1, 1, 1,
0.7905084, 0.08398924, 2.077048, 1, 1, 1, 1, 1,
0.7908104, -2.136848, 2.294412, 1, 1, 1, 1, 1,
0.7967366, -1.357351, 3.465257, 1, 1, 1, 1, 1,
0.7976878, -1.308087, 2.647915, 1, 1, 1, 1, 1,
0.8055078, 0.4106977, 1.608945, 1, 1, 1, 1, 1,
0.8065422, 0.193744, 0.6962168, 1, 1, 1, 1, 1,
0.8071643, 0.4278278, 1.872274, 1, 1, 1, 1, 1,
0.8080749, 0.5183842, -0.08459536, 1, 1, 1, 1, 1,
0.8111285, -0.7226259, 3.132257, 1, 1, 1, 1, 1,
0.816286, -2.061062, 1.792298, 1, 1, 1, 1, 1,
0.8174606, 0.4623644, -0.7769702, 1, 1, 1, 1, 1,
0.819458, 0.3337073, -0.4918784, 1, 1, 1, 1, 1,
0.8311644, -2.123381, 2.602076, 0, 0, 1, 1, 1,
0.8316049, 0.8636474, 0.6044114, 1, 0, 0, 1, 1,
0.8332101, -0.6665474, 1.265193, 1, 0, 0, 1, 1,
0.8351216, -1.272951, 0.6748334, 1, 0, 0, 1, 1,
0.8384084, -2.063727, 2.833986, 1, 0, 0, 1, 1,
0.8443082, 0.006853065, 1.46466, 1, 0, 0, 1, 1,
0.8452417, -0.2351779, 2.417487, 0, 0, 0, 1, 1,
0.8453645, -0.03000492, 1.478263, 0, 0, 0, 1, 1,
0.8470831, -0.1877134, 1.181301, 0, 0, 0, 1, 1,
0.8472412, -0.03205405, 2.240179, 0, 0, 0, 1, 1,
0.8483439, 0.3592627, 0.2417159, 0, 0, 0, 1, 1,
0.8500672, 0.08759423, 0.6129383, 0, 0, 0, 1, 1,
0.8506483, 0.4194744, 0.5689532, 0, 0, 0, 1, 1,
0.8523198, 0.8291985, 2.726366, 1, 1, 1, 1, 1,
0.8596995, 0.0310583, 1.766094, 1, 1, 1, 1, 1,
0.864512, 0.8194879, -0.4042135, 1, 1, 1, 1, 1,
0.8655754, 0.6023571, 0.3946995, 1, 1, 1, 1, 1,
0.8671551, -0.4367595, 2.119156, 1, 1, 1, 1, 1,
0.8737851, 0.4130757, 1.130457, 1, 1, 1, 1, 1,
0.8746921, -1.362042, 3.450005, 1, 1, 1, 1, 1,
0.8838629, 0.5375735, 2.066694, 1, 1, 1, 1, 1,
0.8932812, -0.01114865, 0.7703541, 1, 1, 1, 1, 1,
0.895844, -1.350294, 2.888706, 1, 1, 1, 1, 1,
0.9094097, -2.223236, 2.794634, 1, 1, 1, 1, 1,
0.9113224, -0.1696522, 2.675952, 1, 1, 1, 1, 1,
0.9136215, 0.4793788, 1.391036, 1, 1, 1, 1, 1,
0.9137254, -0.6851108, 1.092323, 1, 1, 1, 1, 1,
0.9189444, -1.077518, 0.646368, 1, 1, 1, 1, 1,
0.9189577, 1.097757, -0.2174889, 0, 0, 1, 1, 1,
0.9254346, 0.07435445, 1.773072, 1, 0, 0, 1, 1,
0.9267808, 0.2595564, 1.012547, 1, 0, 0, 1, 1,
0.9295906, -0.02311946, 1.319896, 1, 0, 0, 1, 1,
0.9302029, -0.5367951, 3.168279, 1, 0, 0, 1, 1,
0.9346909, -0.3006901, 1.381501, 1, 0, 0, 1, 1,
0.9373549, -1.746366, 1.971987, 0, 0, 0, 1, 1,
0.9387774, 0.9846395, 1.03333, 0, 0, 0, 1, 1,
0.9418715, 0.6786326, 1.025703, 0, 0, 0, 1, 1,
0.9546556, -1.013575, 2.353531, 0, 0, 0, 1, 1,
0.9552507, -0.00907992, 4.059155, 0, 0, 0, 1, 1,
0.9626021, -2.226032, 1.552528, 0, 0, 0, 1, 1,
0.966765, 0.07924365, 1.082194, 0, 0, 0, 1, 1,
0.9724132, 0.9121881, 1.51527, 1, 1, 1, 1, 1,
0.9730517, 1.54236, 1.013563, 1, 1, 1, 1, 1,
0.9779449, 0.9802888, 0.7113003, 1, 1, 1, 1, 1,
0.9797181, 0.8062815, 0.917752, 1, 1, 1, 1, 1,
0.9801716, 0.3663321, 1.596152, 1, 1, 1, 1, 1,
0.9878358, -0.3243892, 1.96046, 1, 1, 1, 1, 1,
0.9889544, 0.2126018, 0.09063638, 1, 1, 1, 1, 1,
0.9903667, -0.618993, 1.861877, 1, 1, 1, 1, 1,
0.9950453, -0.1993098, 2.537145, 1, 1, 1, 1, 1,
1.002481, 0.8559852, -0.5183572, 1, 1, 1, 1, 1,
1.002711, 0.877156, -0.3672083, 1, 1, 1, 1, 1,
1.003044, 0.0638228, 1.000739, 1, 1, 1, 1, 1,
1.012104, -0.3379253, 0.9787766, 1, 1, 1, 1, 1,
1.013173, 0.2360155, 0.7167855, 1, 1, 1, 1, 1,
1.014703, 0.09998927, 0.913174, 1, 1, 1, 1, 1,
1.018437, -0.3851186, 1.279807, 0, 0, 1, 1, 1,
1.021446, -1.298228, 2.241847, 1, 0, 0, 1, 1,
1.025831, -1.182709, 1.18952, 1, 0, 0, 1, 1,
1.026807, 1.365279, 0.2075961, 1, 0, 0, 1, 1,
1.031025, -0.6164476, 3.544688, 1, 0, 0, 1, 1,
1.032531, 0.7052141, 2.287584, 1, 0, 0, 1, 1,
1.040888, 0.5234029, -0.4771576, 0, 0, 0, 1, 1,
1.042541, 0.2135324, 0.2639183, 0, 0, 0, 1, 1,
1.043388, -1.67451, 1.724715, 0, 0, 0, 1, 1,
1.049499, 1.162101, -0.6022851, 0, 0, 0, 1, 1,
1.049818, -0.5811014, 1.034521, 0, 0, 0, 1, 1,
1.061288, -0.3331704, 4.250319, 0, 0, 0, 1, 1,
1.061745, 0.5690096, -0.8423654, 0, 0, 0, 1, 1,
1.07138, -0.4587128, 1.234777, 1, 1, 1, 1, 1,
1.072813, 0.0990037, 0.4604652, 1, 1, 1, 1, 1,
1.072962, -0.2919312, 3.567416, 1, 1, 1, 1, 1,
1.080914, 0.9830655, 1.259698, 1, 1, 1, 1, 1,
1.101168, -0.159762, 2.770961, 1, 1, 1, 1, 1,
1.101368, 0.9690472, 0.7010662, 1, 1, 1, 1, 1,
1.109815, -1.896507, 2.401747, 1, 1, 1, 1, 1,
1.113553, -2.215344, 2.517536, 1, 1, 1, 1, 1,
1.124111, -1.731508, 2.255966, 1, 1, 1, 1, 1,
1.131152, 1.505167, 0.6767355, 1, 1, 1, 1, 1,
1.138323, -0.5141258, 3.03832, 1, 1, 1, 1, 1,
1.14406, -0.4932341, 2.461385, 1, 1, 1, 1, 1,
1.146217, 0.9181454, 1.027037, 1, 1, 1, 1, 1,
1.153032, -1.6917, 1.464729, 1, 1, 1, 1, 1,
1.153236, 0.2920443, 0.6565256, 1, 1, 1, 1, 1,
1.161157, 0.09536473, 2.804728, 0, 0, 1, 1, 1,
1.168792, 1.89507, -1.43837, 1, 0, 0, 1, 1,
1.1793, -0.03047843, -0.2252033, 1, 0, 0, 1, 1,
1.18125, 1.67176, 1.654072, 1, 0, 0, 1, 1,
1.187724, 1.448446, 2.189481, 1, 0, 0, 1, 1,
1.187802, -0.6682458, 1.090263, 1, 0, 0, 1, 1,
1.190502, -1.399585, 4.512786, 0, 0, 0, 1, 1,
1.199273, -0.0883029, 3.047672, 0, 0, 0, 1, 1,
1.201112, -0.9379719, 1.699954, 0, 0, 0, 1, 1,
1.206717, 1.46035, 1.085778, 0, 0, 0, 1, 1,
1.20995, -0.2023236, 2.421015, 0, 0, 0, 1, 1,
1.211409, 0.6404631, 2.006645, 0, 0, 0, 1, 1,
1.220528, 0.8909312, 1.151781, 0, 0, 0, 1, 1,
1.22081, 0.2643664, 2.344502, 1, 1, 1, 1, 1,
1.222872, 0.8029383, 0.04631465, 1, 1, 1, 1, 1,
1.230812, 0.5962222, 1.527227, 1, 1, 1, 1, 1,
1.242565, -0.5092982, 1.924454, 1, 1, 1, 1, 1,
1.26071, -0.005183038, 0.633644, 1, 1, 1, 1, 1,
1.26262, -1.404895, 1.401735, 1, 1, 1, 1, 1,
1.266737, 1.870561, 2.67959, 1, 1, 1, 1, 1,
1.271184, 1.858202, -0.7664995, 1, 1, 1, 1, 1,
1.273401, -0.1814218, 1.608515, 1, 1, 1, 1, 1,
1.274367, 0.6738292, 0.641802, 1, 1, 1, 1, 1,
1.275194, 0.4876951, 1.50289, 1, 1, 1, 1, 1,
1.277803, 0.2584091, 1.202459, 1, 1, 1, 1, 1,
1.279102, 0.1152263, 0.5214708, 1, 1, 1, 1, 1,
1.28234, -0.8164374, 2.729589, 1, 1, 1, 1, 1,
1.285347, -0.3218286, 1.260239, 1, 1, 1, 1, 1,
1.307205, -1.201799, 3.296477, 0, 0, 1, 1, 1,
1.308721, -1.253425, 1.654578, 1, 0, 0, 1, 1,
1.311025, 0.5162626, -0.2932414, 1, 0, 0, 1, 1,
1.314473, -0.7250462, 1.912652, 1, 0, 0, 1, 1,
1.320713, -1.286286, 3.166641, 1, 0, 0, 1, 1,
1.326788, -2.112683, 2.235108, 1, 0, 0, 1, 1,
1.332134, -1.247857, 2.23286, 0, 0, 0, 1, 1,
1.339257, -0.5843992, 3.442736, 0, 0, 0, 1, 1,
1.339972, -0.03530313, 2.315523, 0, 0, 0, 1, 1,
1.340374, 1.102451, 1.291763, 0, 0, 0, 1, 1,
1.344226, -1.137389, 2.502685, 0, 0, 0, 1, 1,
1.345228, 1.663308, 1.40353, 0, 0, 0, 1, 1,
1.349762, 0.5873107, -0.1407226, 0, 0, 0, 1, 1,
1.353249, -0.1022382, 1.435086, 1, 1, 1, 1, 1,
1.3555, -1.367926, 2.324612, 1, 1, 1, 1, 1,
1.357784, 1.675774, 0.4171714, 1, 1, 1, 1, 1,
1.369133, 2.644533, -1.517149, 1, 1, 1, 1, 1,
1.374285, -0.2993919, 0.8457182, 1, 1, 1, 1, 1,
1.379965, 0.04638081, 3.288703, 1, 1, 1, 1, 1,
1.387635, -0.114582, 1.515765, 1, 1, 1, 1, 1,
1.38811, -0.4738752, 0.978296, 1, 1, 1, 1, 1,
1.389035, 0.2804788, 2.616783, 1, 1, 1, 1, 1,
1.395684, -0.2804702, 1.704524, 1, 1, 1, 1, 1,
1.406646, -1.250977, 2.601491, 1, 1, 1, 1, 1,
1.414842, 0.6638777, 0.1836572, 1, 1, 1, 1, 1,
1.417574, -0.4381129, -0.02782191, 1, 1, 1, 1, 1,
1.424402, -1.748699, 1.556204, 1, 1, 1, 1, 1,
1.431885, -0.8163202, 3.273068, 1, 1, 1, 1, 1,
1.438395, 0.2876035, -0.5188777, 0, 0, 1, 1, 1,
1.458677, -0.2415138, 1.306872, 1, 0, 0, 1, 1,
1.459427, -1.056569, 0.03381963, 1, 0, 0, 1, 1,
1.468821, 1.395799, 0.1554811, 1, 0, 0, 1, 1,
1.472903, -1.276007, 1.710177, 1, 0, 0, 1, 1,
1.485615, 1.859578, 1.523206, 1, 0, 0, 1, 1,
1.492007, -1.110255, 0.9476232, 0, 0, 0, 1, 1,
1.494282, -1.756122, 3.006045, 0, 0, 0, 1, 1,
1.498148, 1.870669, 2.593779, 0, 0, 0, 1, 1,
1.501761, 1.076314, 0.6466118, 0, 0, 0, 1, 1,
1.510509, -0.980633, 2.854309, 0, 0, 0, 1, 1,
1.511458, 0.1643321, 1.615422, 0, 0, 0, 1, 1,
1.518051, 0.3685609, 0.8320392, 0, 0, 0, 1, 1,
1.521392, -0.9544152, 2.760334, 1, 1, 1, 1, 1,
1.522369, 0.3431355, 2.592869, 1, 1, 1, 1, 1,
1.530897, -0.4065485, 2.141788, 1, 1, 1, 1, 1,
1.53512, 0.3447167, 0.7238058, 1, 1, 1, 1, 1,
1.53554, -0.3512194, 1.911493, 1, 1, 1, 1, 1,
1.535752, 0.5937809, 0.8653299, 1, 1, 1, 1, 1,
1.553028, -1.006985, 2.517186, 1, 1, 1, 1, 1,
1.553165, 1.691917, 1.910335, 1, 1, 1, 1, 1,
1.560852, 1.562489, 0.9408245, 1, 1, 1, 1, 1,
1.566036, -0.1228776, 1.471965, 1, 1, 1, 1, 1,
1.567913, -1.373395, 2.785303, 1, 1, 1, 1, 1,
1.607368, 0.4634186, 1.366621, 1, 1, 1, 1, 1,
1.61528, -0.09665746, 2.370198, 1, 1, 1, 1, 1,
1.623164, 0.1414018, 1.381096, 1, 1, 1, 1, 1,
1.641816, -0.8575749, 3.095034, 1, 1, 1, 1, 1,
1.655415, -1.472631, 3.018506, 0, 0, 1, 1, 1,
1.655645, 0.9262389, -0.5426241, 1, 0, 0, 1, 1,
1.666981, 0.410515, 2.321028, 1, 0, 0, 1, 1,
1.670014, -0.5124593, 1.381789, 1, 0, 0, 1, 1,
1.67607, 0.05251015, 1.070352, 1, 0, 0, 1, 1,
1.677826, -2.324405, 2.417615, 1, 0, 0, 1, 1,
1.7101, -0.8733276, 0.5560704, 0, 0, 0, 1, 1,
1.718514, 1.622307, 1.324178, 0, 0, 0, 1, 1,
1.724705, -0.778479, 2.377384, 0, 0, 0, 1, 1,
1.735509, -1.239196, 1.15781, 0, 0, 0, 1, 1,
1.738945, -0.5601955, 2.083518, 0, 0, 0, 1, 1,
1.747607, 0.4182981, 1.522391, 0, 0, 0, 1, 1,
1.792729, 0.2561053, 1.168157, 0, 0, 0, 1, 1,
1.79751, 0.9195753, 0.7736561, 1, 1, 1, 1, 1,
1.802189, 0.1444277, 1.227022, 1, 1, 1, 1, 1,
1.807749, 1.070611, 1.827641, 1, 1, 1, 1, 1,
1.81761, 0.2791348, 1.00475, 1, 1, 1, 1, 1,
1.87468, 0.4716465, 1.702228, 1, 1, 1, 1, 1,
1.877617, -1.307024, 1.422683, 1, 1, 1, 1, 1,
1.882231, 0.494908, 0.5960988, 1, 1, 1, 1, 1,
1.911922, 0.9445108, -1.302104, 1, 1, 1, 1, 1,
1.915514, -2.720751, 3.01578, 1, 1, 1, 1, 1,
1.921619, 0.2066515, 0.696871, 1, 1, 1, 1, 1,
1.930918, 0.6647462, 1.381905, 1, 1, 1, 1, 1,
1.952216, -1.119184, 2.862862, 1, 1, 1, 1, 1,
1.972951, 0.8495284, 1.695553, 1, 1, 1, 1, 1,
1.980445, -0.2066155, 3.120548, 1, 1, 1, 1, 1,
1.98111, -0.6775445, -0.2130393, 1, 1, 1, 1, 1,
1.992039, -1.535037, 1.430234, 0, 0, 1, 1, 1,
2.013569, 0.09236325, 1.687932, 1, 0, 0, 1, 1,
2.054863, -0.3661766, 1.735627, 1, 0, 0, 1, 1,
2.086429, -0.6464076, 2.27991, 1, 0, 0, 1, 1,
2.092097, -1.391619, 2.193595, 1, 0, 0, 1, 1,
2.156183, 0.3490319, 0.9065446, 1, 0, 0, 1, 1,
2.186286, -0.3950229, 1.425581, 0, 0, 0, 1, 1,
2.222917, -0.3916053, 0.9924241, 0, 0, 0, 1, 1,
2.291503, -1.231861, 1.05759, 0, 0, 0, 1, 1,
2.300336, 0.7105477, 2.075117, 0, 0, 0, 1, 1,
2.358095, -0.1235168, 1.595087, 0, 0, 0, 1, 1,
2.368901, 1.607139, 1.009294, 0, 0, 0, 1, 1,
2.394017, -0.5327062, 0.7644299, 0, 0, 0, 1, 1,
2.476315, 1.621176, 0.3720449, 1, 1, 1, 1, 1,
2.492677, -0.2536574, 2.535053, 1, 1, 1, 1, 1,
2.845126, 0.4475046, 3.717147, 1, 1, 1, 1, 1,
2.879079, -0.8691562, 2.533503, 1, 1, 1, 1, 1,
3.067893, -0.7455828, 1.789061, 1, 1, 1, 1, 1,
3.236599, -1.553994, 1.057165, 1, 1, 1, 1, 1,
3.287866, -0.8927943, 3.044363, 1, 1, 1, 1, 1
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
var radius = 9.778931;
var distance = 34.34808;
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
mvMatrix.translate( -0.2105392, -0.3918266, -0.004453421 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.34808);
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
