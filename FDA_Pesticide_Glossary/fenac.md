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
-2.853061, 1.297925, -1.185473, 1, 0, 0, 1,
-2.818896, 1.732446, -0.9056972, 1, 0.007843138, 0, 1,
-2.800813, -0.556156, -2.905142, 1, 0.01176471, 0, 1,
-2.794356, -0.9660797, -1.503484, 1, 0.01960784, 0, 1,
-2.536669, 2.010338, -0.4619008, 1, 0.02352941, 0, 1,
-2.490207, -0.3826082, -3.003451, 1, 0.03137255, 0, 1,
-2.374335, -1.26657, -2.361504, 1, 0.03529412, 0, 1,
-2.361791, 0.3466526, 0.3933176, 1, 0.04313726, 0, 1,
-2.352714, 0.8377799, -1.684519, 1, 0.04705882, 0, 1,
-2.315135, -0.7957194, -0.5888994, 1, 0.05490196, 0, 1,
-2.26612, -0.9091399, -0.6488742, 1, 0.05882353, 0, 1,
-2.252076, 1.686334, -1.979596, 1, 0.06666667, 0, 1,
-2.214457, -0.09947234, -2.990895, 1, 0.07058824, 0, 1,
-2.203068, 0.418099, -0.2423211, 1, 0.07843138, 0, 1,
-2.109893, -1.354864, -2.095494, 1, 0.08235294, 0, 1,
-2.096287, 0.3960139, -1.397369, 1, 0.09019608, 0, 1,
-2.042715, -0.3162736, -2.183633, 1, 0.09411765, 0, 1,
-2.03417, -1.885098, 0.2653449, 1, 0.1019608, 0, 1,
-2.006818, 0.5199265, -0.4125313, 1, 0.1098039, 0, 1,
-1.996664, -0.3039462, -2.07843, 1, 0.1137255, 0, 1,
-1.994101, -1.175716, -1.08982, 1, 0.1215686, 0, 1,
-1.993837, -0.9671089, -2.622293, 1, 0.1254902, 0, 1,
-1.989961, -0.5731214, -2.142066, 1, 0.1333333, 0, 1,
-1.961875, -0.1310743, -2.894487, 1, 0.1372549, 0, 1,
-1.912679, -1.216341, -1.65912, 1, 0.145098, 0, 1,
-1.907162, 0.6434243, -0.9659894, 1, 0.1490196, 0, 1,
-1.906007, -0.7787333, -0.7693367, 1, 0.1568628, 0, 1,
-1.847862, 0.9623365, -1.433528, 1, 0.1607843, 0, 1,
-1.82792, -1.338724, -2.93251, 1, 0.1686275, 0, 1,
-1.822202, -0.02436051, -2.567421, 1, 0.172549, 0, 1,
-1.797454, 0.4628685, -0.3657638, 1, 0.1803922, 0, 1,
-1.780589, -0.1092689, -2.436973, 1, 0.1843137, 0, 1,
-1.777763, 0.8889154, -0.7043971, 1, 0.1921569, 0, 1,
-1.776919, 0.01287627, -1.222947, 1, 0.1960784, 0, 1,
-1.776846, -1.354587, -1.083083, 1, 0.2039216, 0, 1,
-1.752206, -1.53135, -2.342748, 1, 0.2117647, 0, 1,
-1.745317, -0.5326831, -1.570183, 1, 0.2156863, 0, 1,
-1.709425, 0.07585458, -0.02088595, 1, 0.2235294, 0, 1,
-1.708559, -2.001551, -4.198355, 1, 0.227451, 0, 1,
-1.699603, 0.567122, -0.8302784, 1, 0.2352941, 0, 1,
-1.692917, 0.513849, -1.930191, 1, 0.2392157, 0, 1,
-1.691834, 0.5040358, -2.757239, 1, 0.2470588, 0, 1,
-1.689549, -1.1268, -2.386631, 1, 0.2509804, 0, 1,
-1.688774, -0.9370361, -3.024785, 1, 0.2588235, 0, 1,
-1.687588, -0.009837445, 0.4451331, 1, 0.2627451, 0, 1,
-1.678767, 0.1778323, -2.726522, 1, 0.2705882, 0, 1,
-1.676234, -1.754431, -1.173482, 1, 0.2745098, 0, 1,
-1.673544, 1.333585, -1.191657, 1, 0.282353, 0, 1,
-1.652676, 0.2602035, -2.379046, 1, 0.2862745, 0, 1,
-1.63496, -0.3850899, -0.4392619, 1, 0.2941177, 0, 1,
-1.612776, 1.371187, -0.3112144, 1, 0.3019608, 0, 1,
-1.594172, 1.060745, -1.344181, 1, 0.3058824, 0, 1,
-1.582935, 0.2206649, -0.5705028, 1, 0.3137255, 0, 1,
-1.576461, 0.2741212, -0.6659703, 1, 0.3176471, 0, 1,
-1.575057, -1.433782, -2.985303, 1, 0.3254902, 0, 1,
-1.574142, -0.295857, -4.403008, 1, 0.3294118, 0, 1,
-1.554108, 0.8245613, -2.428322, 1, 0.3372549, 0, 1,
-1.523044, 0.09181821, 0.5694484, 1, 0.3411765, 0, 1,
-1.504567, -0.09406675, -2.554048, 1, 0.3490196, 0, 1,
-1.497411, -3.037074, -3.490955, 1, 0.3529412, 0, 1,
-1.488059, 0.004535587, -3.062383, 1, 0.3607843, 0, 1,
-1.481496, 0.1286166, -0.4971552, 1, 0.3647059, 0, 1,
-1.476496, 0.3511223, -0.6308218, 1, 0.372549, 0, 1,
-1.466637, -1.483635, -3.481428, 1, 0.3764706, 0, 1,
-1.453996, -2.620895, -2.871107, 1, 0.3843137, 0, 1,
-1.451072, 1.572931, -0.09611002, 1, 0.3882353, 0, 1,
-1.446443, 0.2895083, -0.9953175, 1, 0.3960784, 0, 1,
-1.444909, -0.2465237, -1.354695, 1, 0.4039216, 0, 1,
-1.444598, -0.4127896, -4.449452, 1, 0.4078431, 0, 1,
-1.431555, -1.951625, -1.866272, 1, 0.4156863, 0, 1,
-1.410109, -0.3131008, -2.982224, 1, 0.4196078, 0, 1,
-1.400151, -0.1415097, -1.769895, 1, 0.427451, 0, 1,
-1.395703, 1.012967, -1.490591, 1, 0.4313726, 0, 1,
-1.388355, -0.9516886, -1.769634, 1, 0.4392157, 0, 1,
-1.378033, 0.5168864, -2.193912, 1, 0.4431373, 0, 1,
-1.369348, -0.1935075, 0.1595219, 1, 0.4509804, 0, 1,
-1.34877, -1.133886, -3.910674, 1, 0.454902, 0, 1,
-1.332952, 0.8204432, -3.432386, 1, 0.4627451, 0, 1,
-1.330789, -0.2431532, -2.613351, 1, 0.4666667, 0, 1,
-1.33052, -0.05707316, -1.726858, 1, 0.4745098, 0, 1,
-1.326757, 1.139613, -1.990754, 1, 0.4784314, 0, 1,
-1.325422, -1.25467, -3.086606, 1, 0.4862745, 0, 1,
-1.322762, -0.2671249, -2.582417, 1, 0.4901961, 0, 1,
-1.305336, 0.02090767, -1.599564, 1, 0.4980392, 0, 1,
-1.301984, -0.2176154, -0.6938605, 1, 0.5058824, 0, 1,
-1.301721, 0.8083191, 0.6226451, 1, 0.509804, 0, 1,
-1.301243, 2.406965, -1.269364, 1, 0.5176471, 0, 1,
-1.285091, 0.6030681, -1.041359, 1, 0.5215687, 0, 1,
-1.284035, 0.7895487, -0.6514385, 1, 0.5294118, 0, 1,
-1.272189, 2.328734, -1.007439, 1, 0.5333334, 0, 1,
-1.268894, -1.767658, -2.902832, 1, 0.5411765, 0, 1,
-1.256569, 0.6418688, -0.1860781, 1, 0.5450981, 0, 1,
-1.254144, -0.2933164, -1.612309, 1, 0.5529412, 0, 1,
-1.235992, 0.5915104, -1.427455, 1, 0.5568628, 0, 1,
-1.227171, 0.3377364, -2.265907, 1, 0.5647059, 0, 1,
-1.226673, -0.4759187, -1.584716, 1, 0.5686275, 0, 1,
-1.226136, 0.02386422, -2.273417, 1, 0.5764706, 0, 1,
-1.207281, -0.03999433, 0.04638447, 1, 0.5803922, 0, 1,
-1.205402, 1.202088, -1.460559, 1, 0.5882353, 0, 1,
-1.198623, -1.37191, -0.7853648, 1, 0.5921569, 0, 1,
-1.195869, -1.649632, -1.501165, 1, 0.6, 0, 1,
-1.190469, -0.3034565, -1.36563, 1, 0.6078432, 0, 1,
-1.185874, -1.298754, -1.519766, 1, 0.6117647, 0, 1,
-1.182951, -0.656615, -1.744308, 1, 0.6196079, 0, 1,
-1.177955, 0.2173366, -1.232977, 1, 0.6235294, 0, 1,
-1.176994, -1.026292, -1.380962, 1, 0.6313726, 0, 1,
-1.174368, -0.6005819, -2.900049, 1, 0.6352941, 0, 1,
-1.169264, -0.7104278, -1.586516, 1, 0.6431373, 0, 1,
-1.167289, 0.919645, -0.8512559, 1, 0.6470588, 0, 1,
-1.145883, 0.9911256, -0.6629077, 1, 0.654902, 0, 1,
-1.145003, -0.3496631, -2.575266, 1, 0.6588235, 0, 1,
-1.144453, -0.5356007, -3.105007, 1, 0.6666667, 0, 1,
-1.137382, -0.00135161, -2.456504, 1, 0.6705883, 0, 1,
-1.133927, -0.1788708, -0.9666595, 1, 0.6784314, 0, 1,
-1.13134, 0.1036254, -2.710121, 1, 0.682353, 0, 1,
-1.123415, -0.6168802, -3.261952, 1, 0.6901961, 0, 1,
-1.122992, -0.0535423, -1.095533, 1, 0.6941177, 0, 1,
-1.112806, 0.9638116, -1.248255, 1, 0.7019608, 0, 1,
-1.109933, -0.8412838, -4.151188, 1, 0.7098039, 0, 1,
-1.107922, -1.517202, -1.964751, 1, 0.7137255, 0, 1,
-1.107906, -2.30488, -2.746593, 1, 0.7215686, 0, 1,
-1.10546, -0.3045295, -1.778888, 1, 0.7254902, 0, 1,
-1.103456, -1.369965, -2.919442, 1, 0.7333333, 0, 1,
-1.101763, 1.030411, -1.383877, 1, 0.7372549, 0, 1,
-1.09979, 0.7830955, -2.345863, 1, 0.7450981, 0, 1,
-1.099024, -0.2081749, -1.537556, 1, 0.7490196, 0, 1,
-1.092236, 0.8424675, -0.5486071, 1, 0.7568628, 0, 1,
-1.084614, -0.4400587, -1.918167, 1, 0.7607843, 0, 1,
-1.07626, 0.2815213, -0.8090056, 1, 0.7686275, 0, 1,
-1.060576, -0.1593377, -0.1943914, 1, 0.772549, 0, 1,
-1.059286, -0.418731, -3.026936, 1, 0.7803922, 0, 1,
-1.056396, 0.2192859, -1.775577, 1, 0.7843137, 0, 1,
-1.056338, 0.28372, -1.981646, 1, 0.7921569, 0, 1,
-1.049943, 1.678346, -0.9628502, 1, 0.7960784, 0, 1,
-1.046687, -0.03599491, -0.6732734, 1, 0.8039216, 0, 1,
-1.043632, 0.04826664, -1.383396, 1, 0.8117647, 0, 1,
-1.034712, 1.108263, -1.062483, 1, 0.8156863, 0, 1,
-1.024748, -0.8819773, -2.805452, 1, 0.8235294, 0, 1,
-1.023325, 1.318905, -0.8019986, 1, 0.827451, 0, 1,
-1.011325, 0.8153942, -1.612395, 1, 0.8352941, 0, 1,
-1.010092, -1.24794, -3.657219, 1, 0.8392157, 0, 1,
-1.005471, 1.015266, 0.5307127, 1, 0.8470588, 0, 1,
-1.003876, 1.122725, 0.9735104, 1, 0.8509804, 0, 1,
-1.003287, 0.9589544, -1.045898, 1, 0.8588235, 0, 1,
-1.001346, 1.417702, -0.3211214, 1, 0.8627451, 0, 1,
-0.9998952, -2.77403, -3.134347, 1, 0.8705882, 0, 1,
-0.9989374, 0.08013672, -1.681109, 1, 0.8745098, 0, 1,
-0.9958492, 0.6715037, -1.27645, 1, 0.8823529, 0, 1,
-0.9912066, 1.142552, -2.500597, 1, 0.8862745, 0, 1,
-0.9897964, -0.4336964, -2.912291, 1, 0.8941177, 0, 1,
-0.9895934, 0.6485393, -0.4065751, 1, 0.8980392, 0, 1,
-0.9869768, 0.5865915, -1.816491, 1, 0.9058824, 0, 1,
-0.9863269, 1.055101, -0.6785435, 1, 0.9137255, 0, 1,
-0.9845129, 0.8853268, -0.170397, 1, 0.9176471, 0, 1,
-0.9840919, -0.8341097, -1.325579, 1, 0.9254902, 0, 1,
-0.978339, -2.368847, -2.575441, 1, 0.9294118, 0, 1,
-0.9768565, -0.4840933, -1.772975, 1, 0.9372549, 0, 1,
-0.9755529, 0.04398302, -1.772571, 1, 0.9411765, 0, 1,
-0.9677914, -0.3917877, -0.9996476, 1, 0.9490196, 0, 1,
-0.9643456, 0.5649439, -1.528203, 1, 0.9529412, 0, 1,
-0.9629905, 0.6892471, -1.974721, 1, 0.9607843, 0, 1,
-0.9618456, -1.646645, -3.408106, 1, 0.9647059, 0, 1,
-0.9614561, 0.7840859, -1.869044, 1, 0.972549, 0, 1,
-0.9538394, -1.524882, -2.050742, 1, 0.9764706, 0, 1,
-0.9537262, 0.6055441, -1.595268, 1, 0.9843137, 0, 1,
-0.9449384, -0.1001917, -4.345382, 1, 0.9882353, 0, 1,
-0.9395444, 1.983585, -0.2893952, 1, 0.9960784, 0, 1,
-0.9288691, 1.019383, -1.706362, 0.9960784, 1, 0, 1,
-0.9259543, 0.08504814, -0.7457203, 0.9921569, 1, 0, 1,
-0.925311, 1.577635, -0.7833291, 0.9843137, 1, 0, 1,
-0.9232581, 0.1753076, -0.9508826, 0.9803922, 1, 0, 1,
-0.923102, -0.6001881, -3.224147, 0.972549, 1, 0, 1,
-0.9230472, -0.6715385, -2.405863, 0.9686275, 1, 0, 1,
-0.9229139, 0.6929191, -1.275741, 0.9607843, 1, 0, 1,
-0.9171506, -0.7302088, -2.040497, 0.9568627, 1, 0, 1,
-0.9099839, 0.3391593, -1.373685, 0.9490196, 1, 0, 1,
-0.9031517, -0.2637551, -0.1674438, 0.945098, 1, 0, 1,
-0.8971986, 0.2667401, -0.415365, 0.9372549, 1, 0, 1,
-0.8965162, 0.2165223, -1.392328, 0.9333333, 1, 0, 1,
-0.8932868, -0.6911976, -1.716298, 0.9254902, 1, 0, 1,
-0.8704165, 0.5836194, -1.293523, 0.9215686, 1, 0, 1,
-0.8692436, -0.1606573, -0.8329784, 0.9137255, 1, 0, 1,
-0.8656662, -0.312606, -2.050124, 0.9098039, 1, 0, 1,
-0.864201, 1.245507, -0.6728261, 0.9019608, 1, 0, 1,
-0.8601726, 0.3133445, -1.245054, 0.8941177, 1, 0, 1,
-0.8577907, 0.1634213, -3.699472, 0.8901961, 1, 0, 1,
-0.8571634, 0.5337699, -0.678679, 0.8823529, 1, 0, 1,
-0.8570502, -0.372811, 1.337963, 0.8784314, 1, 0, 1,
-0.8569419, 0.9035683, 0.6088601, 0.8705882, 1, 0, 1,
-0.8566524, 0.2651955, -0.1895028, 0.8666667, 1, 0, 1,
-0.8535674, -1.409908, -3.273449, 0.8588235, 1, 0, 1,
-0.8532028, -0.6329781, -2.373121, 0.854902, 1, 0, 1,
-0.8448621, -1.904745, -3.615832, 0.8470588, 1, 0, 1,
-0.8399081, 0.1669029, -0.659409, 0.8431373, 1, 0, 1,
-0.8358751, 1.477771, 0.7316188, 0.8352941, 1, 0, 1,
-0.8252795, -0.0947912, -2.248429, 0.8313726, 1, 0, 1,
-0.8242466, -1.309139, -3.002202, 0.8235294, 1, 0, 1,
-0.8214177, -1.55945, -2.554996, 0.8196079, 1, 0, 1,
-0.8182199, 0.2031052, -1.840019, 0.8117647, 1, 0, 1,
-0.8117471, -0.004983255, -1.949263, 0.8078431, 1, 0, 1,
-0.8099377, 0.8528386, -0.6296542, 0.8, 1, 0, 1,
-0.8063706, 0.3617995, -2.414756, 0.7921569, 1, 0, 1,
-0.800314, -1.62762, -4.352154, 0.7882353, 1, 0, 1,
-0.7995387, -0.5320628, -3.516812, 0.7803922, 1, 0, 1,
-0.7976267, -1.215627, -1.846913, 0.7764706, 1, 0, 1,
-0.7958153, 0.5547638, -1.966025, 0.7686275, 1, 0, 1,
-0.7900037, 0.5684277, 0.2301358, 0.7647059, 1, 0, 1,
-0.786657, -0.06538264, -1.715895, 0.7568628, 1, 0, 1,
-0.7755643, -0.5588, -0.8620592, 0.7529412, 1, 0, 1,
-0.7710239, 0.963945, -2.587557, 0.7450981, 1, 0, 1,
-0.770957, -0.6657322, -4.3302, 0.7411765, 1, 0, 1,
-0.7696499, 0.1970983, -1.812513, 0.7333333, 1, 0, 1,
-0.7681415, 0.5815873, -1.078986, 0.7294118, 1, 0, 1,
-0.7632841, -0.2503096, -2.036651, 0.7215686, 1, 0, 1,
-0.761929, -0.2332812, -1.765262, 0.7176471, 1, 0, 1,
-0.7596616, -0.5181576, -1.630309, 0.7098039, 1, 0, 1,
-0.758464, 0.526418, -1.095033, 0.7058824, 1, 0, 1,
-0.7556676, -0.0003786738, -1.860168, 0.6980392, 1, 0, 1,
-0.7543515, 1.133007, -0.1816269, 0.6901961, 1, 0, 1,
-0.7535295, -0.579522, -2.63091, 0.6862745, 1, 0, 1,
-0.7497479, -0.7382689, -3.808503, 0.6784314, 1, 0, 1,
-0.7411073, -0.3456513, -2.158534, 0.6745098, 1, 0, 1,
-0.738288, -1.628391, -1.8748, 0.6666667, 1, 0, 1,
-0.7325397, -1.046013, -2.376299, 0.6627451, 1, 0, 1,
-0.728321, 1.117633, 0.3264015, 0.654902, 1, 0, 1,
-0.7268041, 0.5865208, 0.7930674, 0.6509804, 1, 0, 1,
-0.7252923, -0.6590749, -3.39835, 0.6431373, 1, 0, 1,
-0.7251148, -0.356203, -3.824788, 0.6392157, 1, 0, 1,
-0.7120727, 1.196258, 0.04205843, 0.6313726, 1, 0, 1,
-0.7056491, -0.7617738, -2.396907, 0.627451, 1, 0, 1,
-0.7042296, 0.5682971, -2.142652, 0.6196079, 1, 0, 1,
-0.7029488, -1.378657, -2.612218, 0.6156863, 1, 0, 1,
-0.7018961, 1.218795, -2.580054, 0.6078432, 1, 0, 1,
-0.7015896, -0.2775057, 0.3542483, 0.6039216, 1, 0, 1,
-0.699779, -0.763267, -1.222326, 0.5960785, 1, 0, 1,
-0.699248, 0.259918, -0.05859964, 0.5882353, 1, 0, 1,
-0.6965951, -0.2103469, -3.214001, 0.5843138, 1, 0, 1,
-0.6940248, 1.489063, -1.262791, 0.5764706, 1, 0, 1,
-0.6797451, -1.23743, -2.387633, 0.572549, 1, 0, 1,
-0.6737298, -0.8554631, -3.84102, 0.5647059, 1, 0, 1,
-0.6733385, 1.585321, -2.145049, 0.5607843, 1, 0, 1,
-0.6684546, -0.02134572, -1.493979, 0.5529412, 1, 0, 1,
-0.6574771, 2.168026, -0.3824169, 0.5490196, 1, 0, 1,
-0.6540238, -0.2008485, -2.214139, 0.5411765, 1, 0, 1,
-0.6531132, 0.2218465, -1.402688, 0.5372549, 1, 0, 1,
-0.6450272, -2.330916, -2.117146, 0.5294118, 1, 0, 1,
-0.6440355, -1.215851, -3.001804, 0.5254902, 1, 0, 1,
-0.6436698, 0.05768644, -2.816762, 0.5176471, 1, 0, 1,
-0.6428708, -0.0507009, -2.170775, 0.5137255, 1, 0, 1,
-0.6373756, 0.8465722, -1.496484, 0.5058824, 1, 0, 1,
-0.6344691, -0.2317775, -2.846827, 0.5019608, 1, 0, 1,
-0.6343119, -1.069031, -1.979226, 0.4941176, 1, 0, 1,
-0.6339838, -0.09201931, -3.003772, 0.4862745, 1, 0, 1,
-0.6301225, -1.43523, 0.8722461, 0.4823529, 1, 0, 1,
-0.6255089, -0.6857172, -2.542236, 0.4745098, 1, 0, 1,
-0.6235428, 1.121061, -0.4162112, 0.4705882, 1, 0, 1,
-0.6234214, 0.09779622, -1.826649, 0.4627451, 1, 0, 1,
-0.6230645, 0.1891692, -2.546013, 0.4588235, 1, 0, 1,
-0.6204933, 0.4076627, -0.9446985, 0.4509804, 1, 0, 1,
-0.6185197, 0.8827719, -0.5432352, 0.4470588, 1, 0, 1,
-0.6178203, 1.388581, 0.9004511, 0.4392157, 1, 0, 1,
-0.6087456, -0.9328508, -1.592927, 0.4352941, 1, 0, 1,
-0.6012132, -1.349376, -3.577239, 0.427451, 1, 0, 1,
-0.5998461, -0.5916413, -1.943587, 0.4235294, 1, 0, 1,
-0.5869032, -0.3057908, -0.1799954, 0.4156863, 1, 0, 1,
-0.5868979, 1.457529, -3.420347, 0.4117647, 1, 0, 1,
-0.5836544, -0.8821823, -1.865434, 0.4039216, 1, 0, 1,
-0.5797911, 0.3123249, -1.701418, 0.3960784, 1, 0, 1,
-0.5778959, -0.4923236, -2.698009, 0.3921569, 1, 0, 1,
-0.5773161, 0.4683719, 0.3270808, 0.3843137, 1, 0, 1,
-0.5717744, 1.758848, -1.161257, 0.3803922, 1, 0, 1,
-0.5714296, -1.319961, -2.720191, 0.372549, 1, 0, 1,
-0.5693244, 1.425136, -0.5559976, 0.3686275, 1, 0, 1,
-0.5660788, -1.040297, -2.055453, 0.3607843, 1, 0, 1,
-0.56545, 1.064235, -0.6149433, 0.3568628, 1, 0, 1,
-0.5583267, -0.4075912, -2.584119, 0.3490196, 1, 0, 1,
-0.5574988, -0.1587151, -0.6009945, 0.345098, 1, 0, 1,
-0.5550739, 0.7380474, 0.1550138, 0.3372549, 1, 0, 1,
-0.5474735, 0.732147, -0.3997976, 0.3333333, 1, 0, 1,
-0.5465686, 0.832064, -0.02147146, 0.3254902, 1, 0, 1,
-0.5397254, -0.192407, 0.2358462, 0.3215686, 1, 0, 1,
-0.5392206, -0.7235253, -3.99936, 0.3137255, 1, 0, 1,
-0.526999, -0.6638894, -2.42938, 0.3098039, 1, 0, 1,
-0.5258344, 0.04790378, -0.2384524, 0.3019608, 1, 0, 1,
-0.5130756, 0.2771406, -1.556671, 0.2941177, 1, 0, 1,
-0.5113671, 2.912952, 0.1281306, 0.2901961, 1, 0, 1,
-0.501191, -0.333827, -2.049665, 0.282353, 1, 0, 1,
-0.5004467, 0.2110554, 0.07805097, 0.2784314, 1, 0, 1,
-0.499691, -0.3605648, -2.211407, 0.2705882, 1, 0, 1,
-0.4987677, 1.966734, 1.321307, 0.2666667, 1, 0, 1,
-0.4977241, 0.176962, 0.1642362, 0.2588235, 1, 0, 1,
-0.4960656, 1.295329, -1.278566, 0.254902, 1, 0, 1,
-0.4927519, -0.1438872, -3.981694, 0.2470588, 1, 0, 1,
-0.4905888, -0.771, -2.397673, 0.2431373, 1, 0, 1,
-0.4901729, 0.5708961, 0.3083661, 0.2352941, 1, 0, 1,
-0.4875114, 0.5889699, -0.04859477, 0.2313726, 1, 0, 1,
-0.4838339, -0.5788131, -2.833097, 0.2235294, 1, 0, 1,
-0.474766, 1.21931, -1.426992, 0.2196078, 1, 0, 1,
-0.473797, 0.5572504, -1.409276, 0.2117647, 1, 0, 1,
-0.4684568, 0.2149296, -2.905793, 0.2078431, 1, 0, 1,
-0.4672409, -0.5410348, -1.310568, 0.2, 1, 0, 1,
-0.4660127, 0.6310404, -3.585762, 0.1921569, 1, 0, 1,
-0.4593633, -0.8847581, -3.778981, 0.1882353, 1, 0, 1,
-0.4570511, -1.052427, -2.879208, 0.1803922, 1, 0, 1,
-0.4532531, -0.1011695, -1.930262, 0.1764706, 1, 0, 1,
-0.4525236, 0.3835598, -0.0739616, 0.1686275, 1, 0, 1,
-0.4498288, 1.200002, -0.6455567, 0.1647059, 1, 0, 1,
-0.4460395, 0.2561533, -0.9430906, 0.1568628, 1, 0, 1,
-0.4444222, 0.6160052, -1.932739, 0.1529412, 1, 0, 1,
-0.4440207, 0.6159089, -0.6308977, 0.145098, 1, 0, 1,
-0.4392984, 1.695169, -2.12356, 0.1411765, 1, 0, 1,
-0.4390451, 0.4280148, -2.437644, 0.1333333, 1, 0, 1,
-0.4389203, 0.2434834, -2.47293, 0.1294118, 1, 0, 1,
-0.4364757, -0.2788673, -2.739964, 0.1215686, 1, 0, 1,
-0.435196, -0.9171907, -1.77093, 0.1176471, 1, 0, 1,
-0.4348629, -1.301581, -2.526524, 0.1098039, 1, 0, 1,
-0.4311717, -0.554432, -2.656394, 0.1058824, 1, 0, 1,
-0.4282741, 0.8276653, -0.09379392, 0.09803922, 1, 0, 1,
-0.4217059, -0.114515, -2.334005, 0.09019608, 1, 0, 1,
-0.418447, 0.2625516, -1.275165, 0.08627451, 1, 0, 1,
-0.4120854, -0.2978204, -0.9877689, 0.07843138, 1, 0, 1,
-0.4105504, 0.4985311, -0.944619, 0.07450981, 1, 0, 1,
-0.4103947, 0.8928316, -2.290018, 0.06666667, 1, 0, 1,
-0.3999279, 0.4385841, -1.581806, 0.0627451, 1, 0, 1,
-0.3996157, 0.2027763, -1.145985, 0.05490196, 1, 0, 1,
-0.3988077, 1.037023, 0.2735096, 0.05098039, 1, 0, 1,
-0.3982698, -0.1670038, -1.547006, 0.04313726, 1, 0, 1,
-0.3956446, -1.370908, -1.644361, 0.03921569, 1, 0, 1,
-0.3748232, -0.91996, -3.955474, 0.03137255, 1, 0, 1,
-0.374289, 0.003690251, -1.323585, 0.02745098, 1, 0, 1,
-0.3737632, 0.02309172, -2.301506, 0.01960784, 1, 0, 1,
-0.3700815, 1.326869, 0.04869973, 0.01568628, 1, 0, 1,
-0.3659218, -2.047005, -3.017336, 0.007843138, 1, 0, 1,
-0.3626581, -0.7399798, -4.840996, 0.003921569, 1, 0, 1,
-0.3594702, -0.2486493, -1.544038, 0, 1, 0.003921569, 1,
-0.3585512, 1.069994, -0.042013, 0, 1, 0.01176471, 1,
-0.3558499, 1.23515, -0.7625359, 0, 1, 0.01568628, 1,
-0.35138, 0.2624035, -0.4393062, 0, 1, 0.02352941, 1,
-0.3437541, -0.1454313, -2.446597, 0, 1, 0.02745098, 1,
-0.3435688, -1.4638, -4.039811, 0, 1, 0.03529412, 1,
-0.3412493, 0.7648044, -1.731794, 0, 1, 0.03921569, 1,
-0.3410656, -0.01646622, -1.495867, 0, 1, 0.04705882, 1,
-0.3393034, 1.196048, 0.2461539, 0, 1, 0.05098039, 1,
-0.3350995, 0.3986511, 0.176438, 0, 1, 0.05882353, 1,
-0.3350612, 0.3111679, -0.4683977, 0, 1, 0.0627451, 1,
-0.333285, -0.1221275, -2.140508, 0, 1, 0.07058824, 1,
-0.3331869, -1.253917, -2.835572, 0, 1, 0.07450981, 1,
-0.3279389, -0.6339864, -2.738692, 0, 1, 0.08235294, 1,
-0.326757, 0.7039249, -0.985269, 0, 1, 0.08627451, 1,
-0.3257844, -0.3139607, -1.98369, 0, 1, 0.09411765, 1,
-0.3256861, 0.1200271, -1.517248, 0, 1, 0.1019608, 1,
-0.320333, 0.1242085, -1.968362, 0, 1, 0.1058824, 1,
-0.3154655, -0.5760506, -3.924545, 0, 1, 0.1137255, 1,
-0.3114727, 0.3535107, -0.6179349, 0, 1, 0.1176471, 1,
-0.3108832, 1.137585, 0.1069922, 0, 1, 0.1254902, 1,
-0.3042746, -0.5229887, -1.903501, 0, 1, 0.1294118, 1,
-0.3036433, -0.5337102, -3.752993, 0, 1, 0.1372549, 1,
-0.3036342, 0.4037188, 1.732019, 0, 1, 0.1411765, 1,
-0.3021377, 2.56286, 0.5930456, 0, 1, 0.1490196, 1,
-0.300593, -0.6668452, -3.073977, 0, 1, 0.1529412, 1,
-0.2994049, 1.047378, -1.84793, 0, 1, 0.1607843, 1,
-0.2982138, -0.6745269, -3.054678, 0, 1, 0.1647059, 1,
-0.2939126, -1.02712, -3.786292, 0, 1, 0.172549, 1,
-0.2911797, -0.4897837, -2.932798, 0, 1, 0.1764706, 1,
-0.2891659, 0.1466475, -0.2624086, 0, 1, 0.1843137, 1,
-0.2873456, 1.209126, -0.02898055, 0, 1, 0.1882353, 1,
-0.2809082, -0.6798317, -3.583704, 0, 1, 0.1960784, 1,
-0.2738314, -0.8989214, -3.818491, 0, 1, 0.2039216, 1,
-0.2737292, 0.2053814, -1.863856, 0, 1, 0.2078431, 1,
-0.2716518, 1.116626, 0.249622, 0, 1, 0.2156863, 1,
-0.2698288, 0.9566405, -0.07417782, 0, 1, 0.2196078, 1,
-0.2695522, -2.527417, -2.587416, 0, 1, 0.227451, 1,
-0.26608, 1.164356, 0.02945194, 0, 1, 0.2313726, 1,
-0.2650436, 1.200475, 1.927528, 0, 1, 0.2392157, 1,
-0.2609949, 0.1021061, -0.2662067, 0, 1, 0.2431373, 1,
-0.2575123, 0.7740504, -0.4044066, 0, 1, 0.2509804, 1,
-0.257299, 0.5719603, 0.3371352, 0, 1, 0.254902, 1,
-0.2528238, 0.8989224, -1.174515, 0, 1, 0.2627451, 1,
-0.2526187, 0.3444784, -1.671138, 0, 1, 0.2666667, 1,
-0.2518883, -0.3944708, -1.805609, 0, 1, 0.2745098, 1,
-0.2512576, -0.09933301, -2.286044, 0, 1, 0.2784314, 1,
-0.2508098, -0.9304603, -1.993467, 0, 1, 0.2862745, 1,
-0.2503105, -0.744226, -3.469057, 0, 1, 0.2901961, 1,
-0.2484062, -0.1336319, -2.708942, 0, 1, 0.2980392, 1,
-0.2427994, -0.2667484, -1.415919, 0, 1, 0.3058824, 1,
-0.2398591, -1.13646, -3.788649, 0, 1, 0.3098039, 1,
-0.2375259, 0.3244617, 0.02454498, 0, 1, 0.3176471, 1,
-0.2325404, 1.076, 1.49663, 0, 1, 0.3215686, 1,
-0.2315851, -1.192922, -4.374083, 0, 1, 0.3294118, 1,
-0.2307521, 0.5531279, -1.369735, 0, 1, 0.3333333, 1,
-0.2267671, -0.7830274, -3.374231, 0, 1, 0.3411765, 1,
-0.2251518, 0.7992197, 1.126225, 0, 1, 0.345098, 1,
-0.2173416, 0.03364906, -0.7613958, 0, 1, 0.3529412, 1,
-0.2161199, 0.2630877, -1.641889, 0, 1, 0.3568628, 1,
-0.2148919, -1.575766, -1.61271, 0, 1, 0.3647059, 1,
-0.2115795, 0.05076735, -2.523758, 0, 1, 0.3686275, 1,
-0.208468, -0.5559893, -4.189053, 0, 1, 0.3764706, 1,
-0.2071614, 0.7220027, -0.891046, 0, 1, 0.3803922, 1,
-0.2065484, -0.4917878, -2.865732, 0, 1, 0.3882353, 1,
-0.2063526, -1.883512, -3.372834, 0, 1, 0.3921569, 1,
-0.204728, 0.8655723, -0.003239264, 0, 1, 0.4, 1,
-0.2047029, -1.13574, -2.234516, 0, 1, 0.4078431, 1,
-0.2029928, 0.626498, 0.3049521, 0, 1, 0.4117647, 1,
-0.2017008, 1.290608, 2.111233, 0, 1, 0.4196078, 1,
-0.2001315, -0.9055662, -2.21203, 0, 1, 0.4235294, 1,
-0.198643, 0.7261637, 0.1870875, 0, 1, 0.4313726, 1,
-0.1942368, -0.6779531, -0.851509, 0, 1, 0.4352941, 1,
-0.1921305, 0.08969719, -1.934789, 0, 1, 0.4431373, 1,
-0.191883, 0.4802196, 0.5324867, 0, 1, 0.4470588, 1,
-0.1915145, 1.433787, 0.5011021, 0, 1, 0.454902, 1,
-0.1907595, 1.772098, -0.5327599, 0, 1, 0.4588235, 1,
-0.1899495, 1.371904, 0.008686798, 0, 1, 0.4666667, 1,
-0.1891971, -1.958184, -4.132048, 0, 1, 0.4705882, 1,
-0.1881792, 1.68983, 0.6403239, 0, 1, 0.4784314, 1,
-0.1858574, -0.6889563, -1.870261, 0, 1, 0.4823529, 1,
-0.1811947, -0.2221888, -1.026546, 0, 1, 0.4901961, 1,
-0.1808343, -2.204482, -3.930113, 0, 1, 0.4941176, 1,
-0.1783773, 2.130819, -1.664766, 0, 1, 0.5019608, 1,
-0.1764317, -0.1169401, -1.457205, 0, 1, 0.509804, 1,
-0.1709817, -2.472381, -4.489901, 0, 1, 0.5137255, 1,
-0.1703664, -1.10466, -3.658499, 0, 1, 0.5215687, 1,
-0.1701118, 1.057233, -0.8245999, 0, 1, 0.5254902, 1,
-0.1679274, 0.1259606, -2.454658, 0, 1, 0.5333334, 1,
-0.1659021, 0.7741293, 0.5514089, 0, 1, 0.5372549, 1,
-0.1615785, 1.391661, -0.6080806, 0, 1, 0.5450981, 1,
-0.1569015, -0.2717195, -0.8035294, 0, 1, 0.5490196, 1,
-0.1542158, -1.47969, -3.928969, 0, 1, 0.5568628, 1,
-0.1521446, -0.4912941, -3.615098, 0, 1, 0.5607843, 1,
-0.1519246, 0.4126359, 0.3373625, 0, 1, 0.5686275, 1,
-0.149337, -0.3811297, -4.216713, 0, 1, 0.572549, 1,
-0.1481813, -1.869755, -2.485191, 0, 1, 0.5803922, 1,
-0.1434089, 1.755442, 0.5228665, 0, 1, 0.5843138, 1,
-0.1409122, 0.7447577, -0.3672286, 0, 1, 0.5921569, 1,
-0.1386977, -0.4627998, -2.429715, 0, 1, 0.5960785, 1,
-0.1386068, 1.453616, 0.5713297, 0, 1, 0.6039216, 1,
-0.1381077, 0.06371218, -0.9270561, 0, 1, 0.6117647, 1,
-0.1376833, -1.196757, -2.846497, 0, 1, 0.6156863, 1,
-0.1369886, -0.2162768, -2.859462, 0, 1, 0.6235294, 1,
-0.1350078, 0.4700561, 0.6638086, 0, 1, 0.627451, 1,
-0.1347513, -1.012139, -2.615929, 0, 1, 0.6352941, 1,
-0.1347331, 1.093733, -0.8984562, 0, 1, 0.6392157, 1,
-0.133954, 0.07150931, -0.8373415, 0, 1, 0.6470588, 1,
-0.1307838, -0.4007622, -2.066308, 0, 1, 0.6509804, 1,
-0.1271648, 1.250867, -1.837264, 0, 1, 0.6588235, 1,
-0.1270941, 0.8681313, 0.8195443, 0, 1, 0.6627451, 1,
-0.1262843, -0.3185479, -2.180422, 0, 1, 0.6705883, 1,
-0.1262417, 1.322418, -0.9776214, 0, 1, 0.6745098, 1,
-0.1251001, 1.769666, -1.023028, 0, 1, 0.682353, 1,
-0.1224692, -0.8792936, -3.507845, 0, 1, 0.6862745, 1,
-0.1190658, -2.341528, -3.49396, 0, 1, 0.6941177, 1,
-0.1189796, -0.5738419, -1.351432, 0, 1, 0.7019608, 1,
-0.1153175, -0.4592514, -2.978854, 0, 1, 0.7058824, 1,
-0.1072565, 0.4368051, -0.3143703, 0, 1, 0.7137255, 1,
-0.1055435, -0.0385754, -0.6176862, 0, 1, 0.7176471, 1,
-0.1039287, -0.3968512, -1.973191, 0, 1, 0.7254902, 1,
-0.1020692, 0.222722, 0.09890286, 0, 1, 0.7294118, 1,
-0.1012071, -0.5259839, -3.068031, 0, 1, 0.7372549, 1,
-0.09876747, -0.9904231, -2.318833, 0, 1, 0.7411765, 1,
-0.09815297, 0.1033935, -0.6019699, 0, 1, 0.7490196, 1,
-0.09448628, 0.7598093, -0.6921864, 0, 1, 0.7529412, 1,
-0.09445715, 1.359017, 1.209121, 0, 1, 0.7607843, 1,
-0.09165853, 0.9884647, -1.677402, 0, 1, 0.7647059, 1,
-0.09095113, 0.2590281, -2.538748, 0, 1, 0.772549, 1,
-0.0907921, 0.003967638, -2.165826, 0, 1, 0.7764706, 1,
-0.08904117, 0.1736104, -1.134048, 0, 1, 0.7843137, 1,
-0.08829734, 0.08473781, 0.7925376, 0, 1, 0.7882353, 1,
-0.08703341, -0.4361554, -3.752291, 0, 1, 0.7960784, 1,
-0.08617456, -1.189954, -4.694618, 0, 1, 0.8039216, 1,
-0.08317844, -0.978187, -3.277729, 0, 1, 0.8078431, 1,
-0.0803994, 0.3691425, -1.864586, 0, 1, 0.8156863, 1,
-0.07990201, -0.361428, -3.655293, 0, 1, 0.8196079, 1,
-0.07728066, -0.463628, -2.211592, 0, 1, 0.827451, 1,
-0.07711255, -0.6415709, -4.202789, 0, 1, 0.8313726, 1,
-0.07575035, -0.2560444, -4.275092, 0, 1, 0.8392157, 1,
-0.07515159, 0.3701524, 0.3735049, 0, 1, 0.8431373, 1,
-0.07056356, 0.66424, 0.8095207, 0, 1, 0.8509804, 1,
-0.06790899, -0.255712, -4.110134, 0, 1, 0.854902, 1,
-0.06560466, -0.1590341, -1.598064, 0, 1, 0.8627451, 1,
-0.06513482, 1.855051, -0.4099972, 0, 1, 0.8666667, 1,
-0.06507831, 0.5799938, -1.328234, 0, 1, 0.8745098, 1,
-0.06418932, -0.8436887, -2.061637, 0, 1, 0.8784314, 1,
-0.05971901, 1.491219, 0.0334906, 0, 1, 0.8862745, 1,
-0.05963744, 0.2713001, 1.068707, 0, 1, 0.8901961, 1,
-0.05660809, 1.059107, -0.2232479, 0, 1, 0.8980392, 1,
-0.05547765, -1.370326, -3.099255, 0, 1, 0.9058824, 1,
-0.05278624, -0.3926749, -3.817474, 0, 1, 0.9098039, 1,
-0.05189415, 0.1255216, -0.9863235, 0, 1, 0.9176471, 1,
-0.04980472, -1.833967, -4.355619, 0, 1, 0.9215686, 1,
-0.04958632, -0.4182816, -3.316913, 0, 1, 0.9294118, 1,
-0.04956501, -0.3024072, -2.846491, 0, 1, 0.9333333, 1,
-0.0473954, -0.9903849, -4.212392, 0, 1, 0.9411765, 1,
-0.04582356, -0.4799568, -3.391741, 0, 1, 0.945098, 1,
-0.04070915, -0.9597103, -4.912038, 0, 1, 0.9529412, 1,
-0.03868108, -0.9124535, -1.950012, 0, 1, 0.9568627, 1,
-0.03698133, -1.419517, -2.206352, 0, 1, 0.9647059, 1,
-0.03489762, 0.9421955, -0.2863109, 0, 1, 0.9686275, 1,
-0.03480297, 0.06779943, -1.596925, 0, 1, 0.9764706, 1,
-0.03244195, -0.09539548, -1.118865, 0, 1, 0.9803922, 1,
-0.03184429, -0.6819747, -2.148071, 0, 1, 0.9882353, 1,
-0.0287473, 0.3294766, -0.6327106, 0, 1, 0.9921569, 1,
-0.02063326, 0.0005293803, -0.3713493, 0, 1, 1, 1,
-0.01968978, 0.8880963, 0.1777761, 0, 0.9921569, 1, 1,
-0.01823188, 1.113504, -0.001877714, 0, 0.9882353, 1, 1,
-0.01362139, 0.2418691, 0.697971, 0, 0.9803922, 1, 1,
-0.01329963, -0.1357177, -3.884492, 0, 0.9764706, 1, 1,
-0.01015731, -0.4978341, -3.205488, 0, 0.9686275, 1, 1,
-0.008905826, 0.7015758, 0.5109012, 0, 0.9647059, 1, 1,
-0.006014424, 0.160287, -0.2793792, 0, 0.9568627, 1, 1,
0.0001518477, -1.430585, 4.080412, 0, 0.9529412, 1, 1,
0.001884735, -1.017737, 2.838896, 0, 0.945098, 1, 1,
0.01274287, 1.208925, -2.437335, 0, 0.9411765, 1, 1,
0.0185315, 0.4193039, 0.2307724, 0, 0.9333333, 1, 1,
0.01878434, -0.9828911, 1.219078, 0, 0.9294118, 1, 1,
0.01992007, 0.4779637, 0.2724797, 0, 0.9215686, 1, 1,
0.02433152, -0.2571488, 3.523781, 0, 0.9176471, 1, 1,
0.02498448, -0.4481351, 2.579274, 0, 0.9098039, 1, 1,
0.0263118, -0.2945313, 2.441575, 0, 0.9058824, 1, 1,
0.02966631, -0.6177198, 0.9943435, 0, 0.8980392, 1, 1,
0.03392021, -0.3832282, 0.4120981, 0, 0.8901961, 1, 1,
0.03445691, -1.891923, 3.053766, 0, 0.8862745, 1, 1,
0.03814195, -1.378103, 1.103287, 0, 0.8784314, 1, 1,
0.03819161, -0.363083, 0.6406327, 0, 0.8745098, 1, 1,
0.04013584, -1.200203, 1.297191, 0, 0.8666667, 1, 1,
0.04153776, -1.415147, 4.109043, 0, 0.8627451, 1, 1,
0.04326427, 0.321384, -0.1438845, 0, 0.854902, 1, 1,
0.04585827, 0.05934385, 0.3118345, 0, 0.8509804, 1, 1,
0.04603457, -1.324719, 3.583047, 0, 0.8431373, 1, 1,
0.04928724, 0.3776611, 0.9744481, 0, 0.8392157, 1, 1,
0.05800987, 0.1496209, 1.412848, 0, 0.8313726, 1, 1,
0.05907806, 1.632375, -0.1700167, 0, 0.827451, 1, 1,
0.05928159, 0.4816431, -1.047666, 0, 0.8196079, 1, 1,
0.0598377, -0.662881, 3.052708, 0, 0.8156863, 1, 1,
0.06000312, 0.02208312, 0.6256177, 0, 0.8078431, 1, 1,
0.06416767, -2.627735, 3.915107, 0, 0.8039216, 1, 1,
0.06525241, -1.566054, 3.565946, 0, 0.7960784, 1, 1,
0.06743296, -0.5331933, 2.227388, 0, 0.7882353, 1, 1,
0.06864446, -0.05332236, 0.3757451, 0, 0.7843137, 1, 1,
0.07061553, 0.8237464, 0.2453345, 0, 0.7764706, 1, 1,
0.07254013, 1.469416, -0.1843025, 0, 0.772549, 1, 1,
0.07341284, 0.2768474, 0.002838532, 0, 0.7647059, 1, 1,
0.07394838, 0.6543389, -1.068092, 0, 0.7607843, 1, 1,
0.07423618, -0.05507692, 1.569934, 0, 0.7529412, 1, 1,
0.07832091, -0.5351231, 2.523002, 0, 0.7490196, 1, 1,
0.0842132, 2.018307, 0.4294935, 0, 0.7411765, 1, 1,
0.08537425, 0.1924204, -0.5247195, 0, 0.7372549, 1, 1,
0.08547522, 1.042111, 1.494072, 0, 0.7294118, 1, 1,
0.08673474, 0.5989939, 0.1344992, 0, 0.7254902, 1, 1,
0.08681154, -0.4338753, 1.692174, 0, 0.7176471, 1, 1,
0.09120966, 0.1040645, -0.05024986, 0, 0.7137255, 1, 1,
0.0928532, 0.9520507, -0.06525206, 0, 0.7058824, 1, 1,
0.09389838, 0.8663788, -0.7910725, 0, 0.6980392, 1, 1,
0.0954845, -1.197657, 2.116935, 0, 0.6941177, 1, 1,
0.1018883, -0.4613626, 1.922509, 0, 0.6862745, 1, 1,
0.1055963, 1.046005, 1.048279, 0, 0.682353, 1, 1,
0.1088312, -0.2984222, 3.586115, 0, 0.6745098, 1, 1,
0.1130584, -0.1963359, 3.018116, 0, 0.6705883, 1, 1,
0.1153776, -0.1539341, 1.658864, 0, 0.6627451, 1, 1,
0.115711, 0.8511497, 0.9410915, 0, 0.6588235, 1, 1,
0.1198133, -0.9364203, 4.721616, 0, 0.6509804, 1, 1,
0.1200078, -0.6822742, 3.477169, 0, 0.6470588, 1, 1,
0.1262724, 0.7454349, -0.5220849, 0, 0.6392157, 1, 1,
0.1273373, 0.8317567, 0.7675889, 0, 0.6352941, 1, 1,
0.1329105, -0.7392722, 2.28239, 0, 0.627451, 1, 1,
0.1363963, -0.6965073, 3.764495, 0, 0.6235294, 1, 1,
0.1371749, 2.144396, -1.077671, 0, 0.6156863, 1, 1,
0.1378941, -1.033411, 3.552297, 0, 0.6117647, 1, 1,
0.1384788, 0.32127, -1.447581, 0, 0.6039216, 1, 1,
0.1399755, -0.2450259, 1.891663, 0, 0.5960785, 1, 1,
0.1447455, 0.8035806, -0.3064334, 0, 0.5921569, 1, 1,
0.1489203, 1.135557, 0.5822196, 0, 0.5843138, 1, 1,
0.1499309, -0.2896323, 5.012794, 0, 0.5803922, 1, 1,
0.1534907, 0.6100145, 0.3766972, 0, 0.572549, 1, 1,
0.1598232, -0.3065608, 1.093755, 0, 0.5686275, 1, 1,
0.1660648, -0.3564413, 1.935632, 0, 0.5607843, 1, 1,
0.1661124, -0.5495994, 0.9241349, 0, 0.5568628, 1, 1,
0.1675268, 0.103063, -0.9389473, 0, 0.5490196, 1, 1,
0.1688677, -2.111157, 2.429539, 0, 0.5450981, 1, 1,
0.1694795, 1.439556, 0.6397303, 0, 0.5372549, 1, 1,
0.1730954, -1.680113, 1.851441, 0, 0.5333334, 1, 1,
0.1780373, 1.591859, -1.163644, 0, 0.5254902, 1, 1,
0.1800029, 0.636509, 1.83287, 0, 0.5215687, 1, 1,
0.1802112, 1.574054, 1.738199, 0, 0.5137255, 1, 1,
0.1835602, -1.864671, 1.510163, 0, 0.509804, 1, 1,
0.1944159, -0.7739629, 2.871265, 0, 0.5019608, 1, 1,
0.1960802, 2.760626, 0.4755536, 0, 0.4941176, 1, 1,
0.2000317, -0.5037909, 0.7046288, 0, 0.4901961, 1, 1,
0.2033444, -0.3796171, 1.64426, 0, 0.4823529, 1, 1,
0.20687, -0.2781963, 2.316741, 0, 0.4784314, 1, 1,
0.2093586, -0.2635887, 3.048958, 0, 0.4705882, 1, 1,
0.2133507, -0.8034436, 3.824378, 0, 0.4666667, 1, 1,
0.2143203, 1.324338, 1.947707, 0, 0.4588235, 1, 1,
0.2180796, 0.9907293, 1.364549, 0, 0.454902, 1, 1,
0.2198304, -0.09576742, 3.957401, 0, 0.4470588, 1, 1,
0.2211372, 0.04766898, 3.041916, 0, 0.4431373, 1, 1,
0.221256, -0.6250567, 3.23186, 0, 0.4352941, 1, 1,
0.2233239, -0.006923418, 2.927181, 0, 0.4313726, 1, 1,
0.223429, -0.456649, 4.130802, 0, 0.4235294, 1, 1,
0.2241282, 0.07958306, -0.3619182, 0, 0.4196078, 1, 1,
0.227161, 0.1760874, -0.8103109, 0, 0.4117647, 1, 1,
0.2282395, 1.638642, -0.2452955, 0, 0.4078431, 1, 1,
0.2300246, -0.2437503, 2.891439, 0, 0.4, 1, 1,
0.2348815, -0.6563728, 4.895544, 0, 0.3921569, 1, 1,
0.2361954, 0.5140693, 0.4231621, 0, 0.3882353, 1, 1,
0.2369073, 2.103063, -0.2104677, 0, 0.3803922, 1, 1,
0.2390329, -0.3450426, 2.785213, 0, 0.3764706, 1, 1,
0.2452426, -0.2669176, 1.772032, 0, 0.3686275, 1, 1,
0.2469646, -0.5242912, 2.437483, 0, 0.3647059, 1, 1,
0.2487275, 0.4611738, 1.269172, 0, 0.3568628, 1, 1,
0.2506778, 0.3586895, 0.8503757, 0, 0.3529412, 1, 1,
0.2579124, 0.8412119, -0.1413009, 0, 0.345098, 1, 1,
0.2685494, -0.4523159, 2.915921, 0, 0.3411765, 1, 1,
0.2686845, -1.364393, 1.973844, 0, 0.3333333, 1, 1,
0.2704604, 0.3705188, 1.286568, 0, 0.3294118, 1, 1,
0.2726769, 0.8643952, -1.1252, 0, 0.3215686, 1, 1,
0.2735369, -0.2234024, 2.001108, 0, 0.3176471, 1, 1,
0.2740242, -0.144289, 1.716539, 0, 0.3098039, 1, 1,
0.2789261, 0.5810195, 1.949927, 0, 0.3058824, 1, 1,
0.2796926, -0.3567702, 3.11784, 0, 0.2980392, 1, 1,
0.2859834, -0.7976505, 3.084671, 0, 0.2901961, 1, 1,
0.294389, 1.426868, 0.870028, 0, 0.2862745, 1, 1,
0.3047689, 0.04335655, 4.359334, 0, 0.2784314, 1, 1,
0.307324, -0.7465706, 3.610194, 0, 0.2745098, 1, 1,
0.31407, 0.110121, 2.402516, 0, 0.2666667, 1, 1,
0.3201838, 0.2494184, 0.5182776, 0, 0.2627451, 1, 1,
0.3203985, -1.587179, 3.073978, 0, 0.254902, 1, 1,
0.3222796, -0.3018141, 4.353762, 0, 0.2509804, 1, 1,
0.322955, 1.877782, 0.2220386, 0, 0.2431373, 1, 1,
0.3231816, -0.1367707, 3.176774, 0, 0.2392157, 1, 1,
0.3235922, 1.197329, -0.01303242, 0, 0.2313726, 1, 1,
0.3238536, 1.030889, 0.6709617, 0, 0.227451, 1, 1,
0.3242462, -1.906553, 4.796095, 0, 0.2196078, 1, 1,
0.3251531, -0.4296347, 1.825485, 0, 0.2156863, 1, 1,
0.3307632, -1.847413, 3.688677, 0, 0.2078431, 1, 1,
0.3309354, -0.1895153, -0.7245415, 0, 0.2039216, 1, 1,
0.334414, 0.1345751, 2.537363, 0, 0.1960784, 1, 1,
0.3352279, -0.5389142, 2.741335, 0, 0.1882353, 1, 1,
0.3374352, -0.686785, 3.038105, 0, 0.1843137, 1, 1,
0.3385488, -1.939413, 2.592186, 0, 0.1764706, 1, 1,
0.3387563, 0.5614968, 0.9565053, 0, 0.172549, 1, 1,
0.3431974, -0.1194702, 1.540842, 0, 0.1647059, 1, 1,
0.3449107, 0.3231947, 0.7722617, 0, 0.1607843, 1, 1,
0.3460249, -0.1035052, 4.445976, 0, 0.1529412, 1, 1,
0.3508245, 1.077858, -0.3520238, 0, 0.1490196, 1, 1,
0.3508993, 0.497072, -0.06041145, 0, 0.1411765, 1, 1,
0.3529275, 0.5292379, 0.950016, 0, 0.1372549, 1, 1,
0.3635769, -0.4576321, 2.467602, 0, 0.1294118, 1, 1,
0.3655401, 0.6569406, -0.3735225, 0, 0.1254902, 1, 1,
0.3661812, -0.8555721, 4.340011, 0, 0.1176471, 1, 1,
0.3669809, 0.2705743, 1.078945, 0, 0.1137255, 1, 1,
0.3676214, 0.4397305, 0.1916862, 0, 0.1058824, 1, 1,
0.3699726, 0.4710622, 1.033339, 0, 0.09803922, 1, 1,
0.3702959, -0.8099785, 3.001379, 0, 0.09411765, 1, 1,
0.3754596, 0.2838751, 0.8470873, 0, 0.08627451, 1, 1,
0.3792858, -0.2832781, 1.190831, 0, 0.08235294, 1, 1,
0.3794158, 1.362085, 1.866222, 0, 0.07450981, 1, 1,
0.3871328, 0.4257605, -0.8488964, 0, 0.07058824, 1, 1,
0.396673, 2.31479, 0.4663751, 0, 0.0627451, 1, 1,
0.3985399, 0.8083284, 2.273921, 0, 0.05882353, 1, 1,
0.404557, 0.2464513, 0.8189642, 0, 0.05098039, 1, 1,
0.4092872, -0.1695909, 1.609908, 0, 0.04705882, 1, 1,
0.4118366, -0.1982908, 1.033989, 0, 0.03921569, 1, 1,
0.415609, 0.5273557, 1.996251, 0, 0.03529412, 1, 1,
0.4160358, 1.071542, 0.5465524, 0, 0.02745098, 1, 1,
0.4186113, 1.04583, 1.903327, 0, 0.02352941, 1, 1,
0.4231156, -0.9739344, 2.284417, 0, 0.01568628, 1, 1,
0.4270524, -1.466227, 0.8855501, 0, 0.01176471, 1, 1,
0.4368185, -1.343608, 3.134802, 0, 0.003921569, 1, 1,
0.4402646, -0.406175, 0.740562, 0.003921569, 0, 1, 1,
0.4407518, 1.230577, 1.068582, 0.007843138, 0, 1, 1,
0.4539159, -0.8997058, 2.309708, 0.01568628, 0, 1, 1,
0.4545224, 2.702232, -0.09837537, 0.01960784, 0, 1, 1,
0.4549622, -1.358112, 3.336249, 0.02745098, 0, 1, 1,
0.4617815, 0.08535588, 2.532491, 0.03137255, 0, 1, 1,
0.4635653, -0.5957891, 2.772904, 0.03921569, 0, 1, 1,
0.4662164, -0.1394227, -0.6700632, 0.04313726, 0, 1, 1,
0.4683419, -0.223714, 2.860515, 0.05098039, 0, 1, 1,
0.4704317, 0.4726315, -0.4817095, 0.05490196, 0, 1, 1,
0.4705949, 0.08909746, 0.2833259, 0.0627451, 0, 1, 1,
0.4710635, -1.444048, 2.582891, 0.06666667, 0, 1, 1,
0.4718387, 0.1210787, 1.018952, 0.07450981, 0, 1, 1,
0.4724247, -0.9385279, 4.635875, 0.07843138, 0, 1, 1,
0.4735627, 1.070413, 0.04004462, 0.08627451, 0, 1, 1,
0.4749286, -0.866619, 1.419533, 0.09019608, 0, 1, 1,
0.4765866, -0.6491203, 0.7665633, 0.09803922, 0, 1, 1,
0.4766392, -1.004643, 1.508662, 0.1058824, 0, 1, 1,
0.4770657, -0.07130872, 0.7423843, 0.1098039, 0, 1, 1,
0.4785063, -0.08390129, 2.565564, 0.1176471, 0, 1, 1,
0.4803836, -3.214839, 3.361973, 0.1215686, 0, 1, 1,
0.4851066, 0.09690279, 3.516129, 0.1294118, 0, 1, 1,
0.4854621, 1.211182, 0.3091756, 0.1333333, 0, 1, 1,
0.4858246, -0.6238523, 3.132919, 0.1411765, 0, 1, 1,
0.4902222, -0.06664303, 1.095168, 0.145098, 0, 1, 1,
0.4911441, 0.1883077, -0.1649119, 0.1529412, 0, 1, 1,
0.4987838, 1.46864, 0.8205343, 0.1568628, 0, 1, 1,
0.5010885, -0.182062, -0.1289619, 0.1647059, 0, 1, 1,
0.5045987, 1.066126, 0.08805249, 0.1686275, 0, 1, 1,
0.506748, -0.1126649, 1.77849, 0.1764706, 0, 1, 1,
0.5076418, -0.183679, 2.217602, 0.1803922, 0, 1, 1,
0.5076565, -1.058766, 3.807288, 0.1882353, 0, 1, 1,
0.5113469, 1.374189, -1.591856, 0.1921569, 0, 1, 1,
0.5114653, -1.876385, 4.936853, 0.2, 0, 1, 1,
0.5123263, -0.5123742, 1.727909, 0.2078431, 0, 1, 1,
0.5153461, -1.375449, 2.94636, 0.2117647, 0, 1, 1,
0.520232, 0.01281107, 0.2793027, 0.2196078, 0, 1, 1,
0.5230719, 1.994217, 0.5757955, 0.2235294, 0, 1, 1,
0.5242996, -1.35041, 4.521459, 0.2313726, 0, 1, 1,
0.5301697, -1.273748, 4.090809, 0.2352941, 0, 1, 1,
0.535473, 0.6897652, 0.8764532, 0.2431373, 0, 1, 1,
0.5378076, 0.2888648, 0.4675697, 0.2470588, 0, 1, 1,
0.5388879, 0.1537941, 2.388535, 0.254902, 0, 1, 1,
0.5415315, 1.35896, 1.881121, 0.2588235, 0, 1, 1,
0.5481316, 0.5258604, 0.6675205, 0.2666667, 0, 1, 1,
0.5499433, 0.4378907, 1.227763, 0.2705882, 0, 1, 1,
0.5537224, -0.7819762, 2.750959, 0.2784314, 0, 1, 1,
0.5645826, 0.0213892, 3.00582, 0.282353, 0, 1, 1,
0.565683, 0.4458306, 0.6446053, 0.2901961, 0, 1, 1,
0.5657915, -1.167617, 3.657026, 0.2941177, 0, 1, 1,
0.5665625, -1.148658, 3.018846, 0.3019608, 0, 1, 1,
0.5705113, 0.4341499, 2.212533, 0.3098039, 0, 1, 1,
0.5729064, 0.5345872, 0.8130476, 0.3137255, 0, 1, 1,
0.5750379, -0.7972872, 2.754298, 0.3215686, 0, 1, 1,
0.5827548, 0.4024021, 0.6124616, 0.3254902, 0, 1, 1,
0.5847924, 0.6267537, 1.165403, 0.3333333, 0, 1, 1,
0.6025205, 0.1760114, 0.1798815, 0.3372549, 0, 1, 1,
0.6027681, -0.9638085, 1.867291, 0.345098, 0, 1, 1,
0.604515, 2.099844, 3.530432, 0.3490196, 0, 1, 1,
0.6222842, -1.53911, 2.451653, 0.3568628, 0, 1, 1,
0.6224412, -0.03237966, 2.685413, 0.3607843, 0, 1, 1,
0.6305481, -1.066489, 1.392264, 0.3686275, 0, 1, 1,
0.6415249, -0.9816617, 4.053964, 0.372549, 0, 1, 1,
0.6449293, -1.31933, 2.307498, 0.3803922, 0, 1, 1,
0.6459237, -2.083074, 2.000172, 0.3843137, 0, 1, 1,
0.6461455, 1.20922, -0.2633707, 0.3921569, 0, 1, 1,
0.646846, 0.6919209, 0.6579905, 0.3960784, 0, 1, 1,
0.6594927, 1.67817, 0.5186186, 0.4039216, 0, 1, 1,
0.6608123, 0.4425909, 2.268606, 0.4117647, 0, 1, 1,
0.6649214, -0.4077889, 1.139853, 0.4156863, 0, 1, 1,
0.6725425, 1.133975, 0.7222024, 0.4235294, 0, 1, 1,
0.6734474, 0.8371921, 0.6287749, 0.427451, 0, 1, 1,
0.6735979, 1.858972, 1.652643, 0.4352941, 0, 1, 1,
0.6754684, 0.2256888, 0.8161657, 0.4392157, 0, 1, 1,
0.6765078, 0.7371664, 1.268715, 0.4470588, 0, 1, 1,
0.677265, 0.4669712, 2.746787, 0.4509804, 0, 1, 1,
0.6840708, -1.43899, 2.493718, 0.4588235, 0, 1, 1,
0.6932509, 1.386883, -0.2007216, 0.4627451, 0, 1, 1,
0.697633, -1.372878, 5.186485, 0.4705882, 0, 1, 1,
0.6992669, -1.797261, 3.73812, 0.4745098, 0, 1, 1,
0.7006958, 1.550353, -0.3685561, 0.4823529, 0, 1, 1,
0.7009231, 0.645662, 1.72067, 0.4862745, 0, 1, 1,
0.7022513, -2.102317, 3.161878, 0.4941176, 0, 1, 1,
0.7023367, 0.796567, -0.01473251, 0.5019608, 0, 1, 1,
0.7056106, 0.8252128, 0.9934962, 0.5058824, 0, 1, 1,
0.7112283, -1.376964, 2.705036, 0.5137255, 0, 1, 1,
0.7200677, 1.801875, -0.5399061, 0.5176471, 0, 1, 1,
0.7212475, -1.053262, 2.567598, 0.5254902, 0, 1, 1,
0.7252014, -0.281265, 3.324575, 0.5294118, 0, 1, 1,
0.7264043, -1.349658, 1.414119, 0.5372549, 0, 1, 1,
0.7379745, -0.007339898, 3.014678, 0.5411765, 0, 1, 1,
0.7405964, 0.4082019, 2.624392, 0.5490196, 0, 1, 1,
0.7415479, 0.05524079, 2.980075, 0.5529412, 0, 1, 1,
0.7452552, -0.4376997, 1.356025, 0.5607843, 0, 1, 1,
0.7594405, 1.546681, 0.02650601, 0.5647059, 0, 1, 1,
0.7604755, -1.630725, 1.37929, 0.572549, 0, 1, 1,
0.7627658, -0.8452094, 1.71594, 0.5764706, 0, 1, 1,
0.7660018, -1.613263, 1.450686, 0.5843138, 0, 1, 1,
0.7694484, -0.2036093, 3.80008, 0.5882353, 0, 1, 1,
0.7716416, -1.766853, 2.843524, 0.5960785, 0, 1, 1,
0.7721732, -0.3218638, 1.243121, 0.6039216, 0, 1, 1,
0.7806494, 1.127036, 1.487218, 0.6078432, 0, 1, 1,
0.7818184, 1.413903, 0.1829488, 0.6156863, 0, 1, 1,
0.7826045, -2.310165, 1.184337, 0.6196079, 0, 1, 1,
0.7839459, 1.518054, 0.7805361, 0.627451, 0, 1, 1,
0.7859572, 0.2674953, 1.065215, 0.6313726, 0, 1, 1,
0.7892391, 1.093922, 0.7587882, 0.6392157, 0, 1, 1,
0.7950329, -0.4506054, 1.959643, 0.6431373, 0, 1, 1,
0.7960278, -0.879043, 1.839011, 0.6509804, 0, 1, 1,
0.7992473, 0.527715, 0.2817007, 0.654902, 0, 1, 1,
0.7995988, -0.5914917, 1.400787, 0.6627451, 0, 1, 1,
0.8024559, -0.7738667, 2.186176, 0.6666667, 0, 1, 1,
0.8039426, 0.4311804, -0.6262131, 0.6745098, 0, 1, 1,
0.8042694, 0.5189097, 0.9129213, 0.6784314, 0, 1, 1,
0.8075362, -0.1896001, 0.9499851, 0.6862745, 0, 1, 1,
0.8092609, 0.5602215, 1.722981, 0.6901961, 0, 1, 1,
0.8114414, -0.5331985, 1.066188, 0.6980392, 0, 1, 1,
0.8139599, 1.017537, 1.159604, 0.7058824, 0, 1, 1,
0.8185731, 1.678705, -2.023704, 0.7098039, 0, 1, 1,
0.8379586, 0.0005093885, 2.155762, 0.7176471, 0, 1, 1,
0.8425759, 1.268654, 0.4582229, 0.7215686, 0, 1, 1,
0.8486215, -0.2766734, 1.123795, 0.7294118, 0, 1, 1,
0.8503224, 0.1516752, 0.7244177, 0.7333333, 0, 1, 1,
0.8517839, -1.718725, 2.102407, 0.7411765, 0, 1, 1,
0.8554002, 0.05836384, 0.6922409, 0.7450981, 0, 1, 1,
0.8555211, 1.130443, 0.8808538, 0.7529412, 0, 1, 1,
0.8558531, -1.212513, 3.045187, 0.7568628, 0, 1, 1,
0.8599604, -0.4777808, 1.871222, 0.7647059, 0, 1, 1,
0.8766266, 1.639685, 0.1135875, 0.7686275, 0, 1, 1,
0.8816761, 0.5325937, 0.7281106, 0.7764706, 0, 1, 1,
0.8834834, -0.8298921, 2.460792, 0.7803922, 0, 1, 1,
0.9091434, 0.02820357, 1.411211, 0.7882353, 0, 1, 1,
0.9116408, -1.226609, 2.935827, 0.7921569, 0, 1, 1,
0.9128044, 0.1236308, 3.160023, 0.8, 0, 1, 1,
0.9131951, -1.202363, 5.564622, 0.8078431, 0, 1, 1,
0.9139681, 0.5451663, 1.821362, 0.8117647, 0, 1, 1,
0.9171923, -2.785962, 2.029521, 0.8196079, 0, 1, 1,
0.9188331, 0.09388071, 0.5195584, 0.8235294, 0, 1, 1,
0.9204069, -1.310204, 3.209711, 0.8313726, 0, 1, 1,
0.9221321, -1.116934, 1.502531, 0.8352941, 0, 1, 1,
0.9236153, -0.006173254, 2.414237, 0.8431373, 0, 1, 1,
0.9281173, -0.6892653, 1.090415, 0.8470588, 0, 1, 1,
0.9281744, -1.682985, 3.700358, 0.854902, 0, 1, 1,
0.930418, -0.4928859, 2.912735, 0.8588235, 0, 1, 1,
0.9354897, 1.418071, 2.638998, 0.8666667, 0, 1, 1,
0.9398741, 0.2330463, 1.826657, 0.8705882, 0, 1, 1,
0.9398919, 1.20044, -0.001946839, 0.8784314, 0, 1, 1,
0.949346, 1.42198, 0.6693791, 0.8823529, 0, 1, 1,
0.9500633, -1.040535, 1.897601, 0.8901961, 0, 1, 1,
0.9508344, 0.6031058, 2.159746, 0.8941177, 0, 1, 1,
0.9525726, 0.001472401, 1.619303, 0.9019608, 0, 1, 1,
0.9629467, 0.2995009, 1.286628, 0.9098039, 0, 1, 1,
0.9631041, -0.2030471, 3.276515, 0.9137255, 0, 1, 1,
0.9648906, 0.06963578, 2.166445, 0.9215686, 0, 1, 1,
0.9668154, 1.029154, 3.132616, 0.9254902, 0, 1, 1,
0.9858147, -0.2134538, 1.3947, 0.9333333, 0, 1, 1,
0.9875311, -0.06293031, 0.6210672, 0.9372549, 0, 1, 1,
0.9955766, -0.3778361, 3.805719, 0.945098, 0, 1, 1,
1.001908, -0.9966938, 3.153846, 0.9490196, 0, 1, 1,
1.008326, -0.2860982, 1.432788, 0.9568627, 0, 1, 1,
1.012031, -0.465484, 1.430508, 0.9607843, 0, 1, 1,
1.016552, -0.614058, 1.643375, 0.9686275, 0, 1, 1,
1.019109, -0.8861156, 3.98201, 0.972549, 0, 1, 1,
1.020187, -1.149119, 1.828914, 0.9803922, 0, 1, 1,
1.020707, -0.4945858, 1.671135, 0.9843137, 0, 1, 1,
1.02508, 0.2657062, 0.5883934, 0.9921569, 0, 1, 1,
1.039384, 0.2868372, -0.1173785, 0.9960784, 0, 1, 1,
1.039414, 1.943241, 0.1640749, 1, 0, 0.9960784, 1,
1.041375, 0.833578, 0.3256175, 1, 0, 0.9882353, 1,
1.054474, -0.3645551, 0.8285251, 1, 0, 0.9843137, 1,
1.05776, -1.089976, 2.318918, 1, 0, 0.9764706, 1,
1.058261, -0.437047, 1.051159, 1, 0, 0.972549, 1,
1.062561, 0.4369821, 1.387522, 1, 0, 0.9647059, 1,
1.070349, -1.025746, 2.515445, 1, 0, 0.9607843, 1,
1.071686, -2.30809, 2.204849, 1, 0, 0.9529412, 1,
1.076594, 0.6597474, 0.04753091, 1, 0, 0.9490196, 1,
1.079931, 0.3228094, 1.508057, 1, 0, 0.9411765, 1,
1.085545, 1.717359, 0.2240153, 1, 0, 0.9372549, 1,
1.08613, 1.110819, 0.8323187, 1, 0, 0.9294118, 1,
1.087832, 0.5471106, 2.30757, 1, 0, 0.9254902, 1,
1.092487, 2.749173, 1.774789, 1, 0, 0.9176471, 1,
1.09678, -0.610756, 1.517821, 1, 0, 0.9137255, 1,
1.10163, -2.190768, 3.481564, 1, 0, 0.9058824, 1,
1.1052, 0.778065, -0.4835623, 1, 0, 0.9019608, 1,
1.124293, -1.744968, 1.901398, 1, 0, 0.8941177, 1,
1.128871, -0.5259036, 3.127826, 1, 0, 0.8862745, 1,
1.13856, -1.372192, 2.822518, 1, 0, 0.8823529, 1,
1.139313, 0.2510939, 0.5104507, 1, 0, 0.8745098, 1,
1.149229, -2.759226, 1.583434, 1, 0, 0.8705882, 1,
1.1515, 0.7183433, 1.416571, 1, 0, 0.8627451, 1,
1.153568, 0.07379545, 1.954877, 1, 0, 0.8588235, 1,
1.153808, -1.066197, 3.086464, 1, 0, 0.8509804, 1,
1.154768, 1.015829, 0.1460065, 1, 0, 0.8470588, 1,
1.155488, -1.232899, 3.08697, 1, 0, 0.8392157, 1,
1.158972, -0.7653978, 3.423445, 1, 0, 0.8352941, 1,
1.160202, 1.805249, 0.7396723, 1, 0, 0.827451, 1,
1.164096, -0.1089584, 2.589492, 1, 0, 0.8235294, 1,
1.166479, 0.5552854, 0.5766753, 1, 0, 0.8156863, 1,
1.168068, 0.3564727, 1.212233, 1, 0, 0.8117647, 1,
1.171407, 1.698213, 1.270887, 1, 0, 0.8039216, 1,
1.178545, 0.6086044, 2.458047, 1, 0, 0.7960784, 1,
1.179257, -0.5214917, 1.414426, 1, 0, 0.7921569, 1,
1.180587, -1.776349, 3.049664, 1, 0, 0.7843137, 1,
1.186451, -1.322928, 2.544093, 1, 0, 0.7803922, 1,
1.190804, -1.127414, 0.4973359, 1, 0, 0.772549, 1,
1.19879, -0.396655, 2.01476, 1, 0, 0.7686275, 1,
1.200762, 0.2019343, 2.316695, 1, 0, 0.7607843, 1,
1.202161, -0.3190472, 1.773241, 1, 0, 0.7568628, 1,
1.203302, 0.30275, 1.935381, 1, 0, 0.7490196, 1,
1.208629, 0.562871, 0.5543288, 1, 0, 0.7450981, 1,
1.210789, 1.547677, 2.032741, 1, 0, 0.7372549, 1,
1.212903, -0.1741606, 1.04265, 1, 0, 0.7333333, 1,
1.214998, 0.4125296, 0.2822497, 1, 0, 0.7254902, 1,
1.226785, 1.694816, -1.639641, 1, 0, 0.7215686, 1,
1.231567, -0.1042939, -0.2678137, 1, 0, 0.7137255, 1,
1.238443, 0.4286983, 0.8002625, 1, 0, 0.7098039, 1,
1.238624, 0.5853444, 1.043335, 1, 0, 0.7019608, 1,
1.242216, 0.6999894, 1.613681, 1, 0, 0.6941177, 1,
1.244901, 0.4411557, 1.200112, 1, 0, 0.6901961, 1,
1.254578, 0.7932103, 1.872856, 1, 0, 0.682353, 1,
1.260333, 0.3343416, 0.07798405, 1, 0, 0.6784314, 1,
1.267276, -0.4653668, 1.548887, 1, 0, 0.6705883, 1,
1.272627, -2.880535, 2.278087, 1, 0, 0.6666667, 1,
1.273408, 1.901823, 0.8525078, 1, 0, 0.6588235, 1,
1.282101, 1.039973, 0.3681872, 1, 0, 0.654902, 1,
1.286243, -1.645231, 1.59636, 1, 0, 0.6470588, 1,
1.289294, 2.599974, 1.18543, 1, 0, 0.6431373, 1,
1.293578, 1.57265, -0.3379515, 1, 0, 0.6352941, 1,
1.30485, -0.9162296, 1.082503, 1, 0, 0.6313726, 1,
1.308739, -0.2238987, 3.136215, 1, 0, 0.6235294, 1,
1.310978, 1.072937, 0.1853832, 1, 0, 0.6196079, 1,
1.319699, 0.3314858, -0.1751354, 1, 0, 0.6117647, 1,
1.329893, -0.1183394, 0.9373236, 1, 0, 0.6078432, 1,
1.332916, -2.623843, 2.764355, 1, 0, 0.6, 1,
1.333505, 1.50297, 1.621814, 1, 0, 0.5921569, 1,
1.346474, 0.2480696, 2.398242, 1, 0, 0.5882353, 1,
1.353444, -0.7701903, 1.396947, 1, 0, 0.5803922, 1,
1.366045, -0.5528517, 1.415132, 1, 0, 0.5764706, 1,
1.367491, -0.4625947, 0.3490048, 1, 0, 0.5686275, 1,
1.374975, 1.505062, 0.8469734, 1, 0, 0.5647059, 1,
1.377317, 0.9756955, 2.741072, 1, 0, 0.5568628, 1,
1.39858, 1.213207, 0.1820827, 1, 0, 0.5529412, 1,
1.407984, -2.513137, 3.338393, 1, 0, 0.5450981, 1,
1.416499, 1.165997, -0.8719493, 1, 0, 0.5411765, 1,
1.419085, 0.5311205, 1.12675, 1, 0, 0.5333334, 1,
1.421074, 0.4144942, 2.254584, 1, 0, 0.5294118, 1,
1.421441, -0.07662618, 2.749433, 1, 0, 0.5215687, 1,
1.424987, -0.7229235, 1.393746, 1, 0, 0.5176471, 1,
1.429758, -1.643846, 2.195068, 1, 0, 0.509804, 1,
1.440937, 0.8688505, -0.2774855, 1, 0, 0.5058824, 1,
1.446982, -0.8060271, 2.672336, 1, 0, 0.4980392, 1,
1.449481, -0.7692795, 2.901651, 1, 0, 0.4901961, 1,
1.45159, 0.007243343, 1.67178, 1, 0, 0.4862745, 1,
1.456101, 1.372603, 1.986493, 1, 0, 0.4784314, 1,
1.458367, 0.2521017, -1.453195, 1, 0, 0.4745098, 1,
1.461527, 0.3030062, 1.183742, 1, 0, 0.4666667, 1,
1.478242, -0.6874001, 0.676871, 1, 0, 0.4627451, 1,
1.481478, -0.930691, 2.762887, 1, 0, 0.454902, 1,
1.484684, -2.578022, 3.395641, 1, 0, 0.4509804, 1,
1.512247, 0.7681181, -0.2832062, 1, 0, 0.4431373, 1,
1.52259, -0.7724167, 1.77483, 1, 0, 0.4392157, 1,
1.52808, -0.2575794, 2.464949, 1, 0, 0.4313726, 1,
1.542034, 0.6717937, 0.2856331, 1, 0, 0.427451, 1,
1.545489, -1.522227, 3.405532, 1, 0, 0.4196078, 1,
1.563863, 0.3477873, 1.644804, 1, 0, 0.4156863, 1,
1.575581, 0.9387745, 0.3688614, 1, 0, 0.4078431, 1,
1.576713, 0.01709512, 3.029434, 1, 0, 0.4039216, 1,
1.580353, -1.233208, 3.45385, 1, 0, 0.3960784, 1,
1.603941, -0.216161, 0.3627557, 1, 0, 0.3882353, 1,
1.609652, -0.7524571, 1.386328, 1, 0, 0.3843137, 1,
1.613488, 1.12336, 0.986213, 1, 0, 0.3764706, 1,
1.617887, 0.9026976, 0.9231408, 1, 0, 0.372549, 1,
1.62128, -1.189468, 2.173666, 1, 0, 0.3647059, 1,
1.650973, -0.9831998, 2.538038, 1, 0, 0.3607843, 1,
1.653346, 1.100745, 0.7164932, 1, 0, 0.3529412, 1,
1.657488, -0.7922466, 3.213976, 1, 0, 0.3490196, 1,
1.65872, 0.3622528, 0.2113446, 1, 0, 0.3411765, 1,
1.687228, -1.011458, 1.470587, 1, 0, 0.3372549, 1,
1.694172, 0.2409306, 0.1220183, 1, 0, 0.3294118, 1,
1.701561, -0.3645245, 1.377555, 1, 0, 0.3254902, 1,
1.712, 0.8896445, 0.889336, 1, 0, 0.3176471, 1,
1.712097, -0.8152214, 1.61017, 1, 0, 0.3137255, 1,
1.733345, 0.08665144, 0.6976833, 1, 0, 0.3058824, 1,
1.734355, -1.116687, 3.601909, 1, 0, 0.2980392, 1,
1.749644, 0.1011849, 3.26489, 1, 0, 0.2941177, 1,
1.753688, -0.5878767, 1.416802, 1, 0, 0.2862745, 1,
1.753724, -0.07378828, 2.561333, 1, 0, 0.282353, 1,
1.754069, 0.3546797, 2.268049, 1, 0, 0.2745098, 1,
1.761402, 0.3745724, 0.6625339, 1, 0, 0.2705882, 1,
1.766675, -0.1506359, 0.9056161, 1, 0, 0.2627451, 1,
1.784119, 0.1850774, -0.86277, 1, 0, 0.2588235, 1,
1.789115, 0.2409372, 3.746556, 1, 0, 0.2509804, 1,
1.791909, -1.131106, 2.189335, 1, 0, 0.2470588, 1,
1.792932, -0.02499523, 2.208742, 1, 0, 0.2392157, 1,
1.797926, 1.475148, 2.927977, 1, 0, 0.2352941, 1,
1.803099, 0.8639196, 1.833743, 1, 0, 0.227451, 1,
1.829402, 0.1440879, 1.328837, 1, 0, 0.2235294, 1,
1.835344, -0.5918202, 1.447774, 1, 0, 0.2156863, 1,
1.83903, 1.345601, 0.5838477, 1, 0, 0.2117647, 1,
1.866889, -0.438592, 1.12607, 1, 0, 0.2039216, 1,
1.889611, 0.3483053, 0.8488371, 1, 0, 0.1960784, 1,
1.903544, 0.7233313, 0.3685735, 1, 0, 0.1921569, 1,
1.908854, -1.010195, 2.720597, 1, 0, 0.1843137, 1,
1.941148, 1.016218, 2.194899, 1, 0, 0.1803922, 1,
1.950413, 1.167534, -0.9692701, 1, 0, 0.172549, 1,
1.970214, 1.487082, -0.9035124, 1, 0, 0.1686275, 1,
1.978356, -0.3992746, 2.414922, 1, 0, 0.1607843, 1,
1.984027, -0.4516704, 2.357679, 1, 0, 0.1568628, 1,
1.985878, -1.201221, 1.758982, 1, 0, 0.1490196, 1,
2.013421, -1.415148, 2.750556, 1, 0, 0.145098, 1,
2.024115, -0.6689421, 2.221062, 1, 0, 0.1372549, 1,
2.032459, 1.390285, 2.058532, 1, 0, 0.1333333, 1,
2.043918, -1.765949, 0.9635065, 1, 0, 0.1254902, 1,
2.082624, -0.2696788, 0.2047307, 1, 0, 0.1215686, 1,
2.089434, 0.8205885, 2.351141, 1, 0, 0.1137255, 1,
2.116535, -1.080913, 2.704689, 1, 0, 0.1098039, 1,
2.119379, -0.5886828, 2.989594, 1, 0, 0.1019608, 1,
2.137598, -1.53816, 3.33479, 1, 0, 0.09411765, 1,
2.154404, 0.03844056, 1.109287, 1, 0, 0.09019608, 1,
2.29903, -1.745325, 3.192494, 1, 0, 0.08235294, 1,
2.334387, -1.201893, 3.414803, 1, 0, 0.07843138, 1,
2.385623, 0.04488253, -0.07634445, 1, 0, 0.07058824, 1,
2.392548, -0.227532, 1.488867, 1, 0, 0.06666667, 1,
2.397755, -0.00509072, 2.179433, 1, 0, 0.05882353, 1,
2.404262, 2.01667, -0.1427605, 1, 0, 0.05490196, 1,
2.422256, 2.316089, 2.090159, 1, 0, 0.04705882, 1,
2.458549, -1.709545, 2.475082, 1, 0, 0.04313726, 1,
2.490171, -1.473976, 0.3876129, 1, 0, 0.03529412, 1,
2.550278, 1.086239, -0.02696694, 1, 0, 0.03137255, 1,
2.56718, -1.2528, 0.04110403, 1, 0, 0.02352941, 1,
2.623241, -0.2510109, 2.957828, 1, 0, 0.01960784, 1,
2.693762, 1.170441, 4.021546, 1, 0, 0.01176471, 1,
2.702384, 0.1143191, 2.149788, 1, 0, 0.007843138, 1
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
-0.07533872, -4.2535, -6.687832, 0, -0.5, 0.5, 0.5,
-0.07533872, -4.2535, -6.687832, 1, -0.5, 0.5, 0.5,
-0.07533872, -4.2535, -6.687832, 1, 1.5, 0.5, 0.5,
-0.07533872, -4.2535, -6.687832, 0, 1.5, 0.5, 0.5
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
-3.794709, -0.1509433, -6.687832, 0, -0.5, 0.5, 0.5,
-3.794709, -0.1509433, -6.687832, 1, -0.5, 0.5, 0.5,
-3.794709, -0.1509433, -6.687832, 1, 1.5, 0.5, 0.5,
-3.794709, -0.1509433, -6.687832, 0, 1.5, 0.5, 0.5
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
-3.794709, -4.2535, 0.326292, 0, -0.5, 0.5, 0.5,
-3.794709, -4.2535, 0.326292, 1, -0.5, 0.5, 0.5,
-3.794709, -4.2535, 0.326292, 1, 1.5, 0.5, 0.5,
-3.794709, -4.2535, 0.326292, 0, 1.5, 0.5, 0.5
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
-2, -3.306756, -5.069188,
2, -3.306756, -5.069188,
-2, -3.306756, -5.069188,
-2, -3.464546, -5.338962,
-1, -3.306756, -5.069188,
-1, -3.464546, -5.338962,
0, -3.306756, -5.069188,
0, -3.464546, -5.338962,
1, -3.306756, -5.069188,
1, -3.464546, -5.338962,
2, -3.306756, -5.069188,
2, -3.464546, -5.338962
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
"2"
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
-2, -3.780128, -5.87851, 0, -0.5, 0.5, 0.5,
-2, -3.780128, -5.87851, 1, -0.5, 0.5, 0.5,
-2, -3.780128, -5.87851, 1, 1.5, 0.5, 0.5,
-2, -3.780128, -5.87851, 0, 1.5, 0.5, 0.5,
-1, -3.780128, -5.87851, 0, -0.5, 0.5, 0.5,
-1, -3.780128, -5.87851, 1, -0.5, 0.5, 0.5,
-1, -3.780128, -5.87851, 1, 1.5, 0.5, 0.5,
-1, -3.780128, -5.87851, 0, 1.5, 0.5, 0.5,
0, -3.780128, -5.87851, 0, -0.5, 0.5, 0.5,
0, -3.780128, -5.87851, 1, -0.5, 0.5, 0.5,
0, -3.780128, -5.87851, 1, 1.5, 0.5, 0.5,
0, -3.780128, -5.87851, 0, 1.5, 0.5, 0.5,
1, -3.780128, -5.87851, 0, -0.5, 0.5, 0.5,
1, -3.780128, -5.87851, 1, -0.5, 0.5, 0.5,
1, -3.780128, -5.87851, 1, 1.5, 0.5, 0.5,
1, -3.780128, -5.87851, 0, 1.5, 0.5, 0.5,
2, -3.780128, -5.87851, 0, -0.5, 0.5, 0.5,
2, -3.780128, -5.87851, 1, -0.5, 0.5, 0.5,
2, -3.780128, -5.87851, 1, 1.5, 0.5, 0.5,
2, -3.780128, -5.87851, 0, 1.5, 0.5, 0.5
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
-2.936393, -3, -5.069188,
-2.936393, 2, -5.069188,
-2.936393, -3, -5.069188,
-3.079446, -3, -5.338962,
-2.936393, -2, -5.069188,
-3.079446, -2, -5.338962,
-2.936393, -1, -5.069188,
-3.079446, -1, -5.338962,
-2.936393, 0, -5.069188,
-3.079446, 0, -5.338962,
-2.936393, 1, -5.069188,
-3.079446, 1, -5.338962,
-2.936393, 2, -5.069188,
-3.079446, 2, -5.338962
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
-3.365551, -3, -5.87851, 0, -0.5, 0.5, 0.5,
-3.365551, -3, -5.87851, 1, -0.5, 0.5, 0.5,
-3.365551, -3, -5.87851, 1, 1.5, 0.5, 0.5,
-3.365551, -3, -5.87851, 0, 1.5, 0.5, 0.5,
-3.365551, -2, -5.87851, 0, -0.5, 0.5, 0.5,
-3.365551, -2, -5.87851, 1, -0.5, 0.5, 0.5,
-3.365551, -2, -5.87851, 1, 1.5, 0.5, 0.5,
-3.365551, -2, -5.87851, 0, 1.5, 0.5, 0.5,
-3.365551, -1, -5.87851, 0, -0.5, 0.5, 0.5,
-3.365551, -1, -5.87851, 1, -0.5, 0.5, 0.5,
-3.365551, -1, -5.87851, 1, 1.5, 0.5, 0.5,
-3.365551, -1, -5.87851, 0, 1.5, 0.5, 0.5,
-3.365551, 0, -5.87851, 0, -0.5, 0.5, 0.5,
-3.365551, 0, -5.87851, 1, -0.5, 0.5, 0.5,
-3.365551, 0, -5.87851, 1, 1.5, 0.5, 0.5,
-3.365551, 0, -5.87851, 0, 1.5, 0.5, 0.5,
-3.365551, 1, -5.87851, 0, -0.5, 0.5, 0.5,
-3.365551, 1, -5.87851, 1, -0.5, 0.5, 0.5,
-3.365551, 1, -5.87851, 1, 1.5, 0.5, 0.5,
-3.365551, 1, -5.87851, 0, 1.5, 0.5, 0.5,
-3.365551, 2, -5.87851, 0, -0.5, 0.5, 0.5,
-3.365551, 2, -5.87851, 1, -0.5, 0.5, 0.5,
-3.365551, 2, -5.87851, 1, 1.5, 0.5, 0.5,
-3.365551, 2, -5.87851, 0, 1.5, 0.5, 0.5
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
-2.936393, -3.306756, -4,
-2.936393, -3.306756, 4,
-2.936393, -3.306756, -4,
-3.079446, -3.464546, -4,
-2.936393, -3.306756, -2,
-3.079446, -3.464546, -2,
-2.936393, -3.306756, 0,
-3.079446, -3.464546, 0,
-2.936393, -3.306756, 2,
-3.079446, -3.464546, 2,
-2.936393, -3.306756, 4,
-3.079446, -3.464546, 4
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
-3.365551, -3.780128, -4, 0, -0.5, 0.5, 0.5,
-3.365551, -3.780128, -4, 1, -0.5, 0.5, 0.5,
-3.365551, -3.780128, -4, 1, 1.5, 0.5, 0.5,
-3.365551, -3.780128, -4, 0, 1.5, 0.5, 0.5,
-3.365551, -3.780128, -2, 0, -0.5, 0.5, 0.5,
-3.365551, -3.780128, -2, 1, -0.5, 0.5, 0.5,
-3.365551, -3.780128, -2, 1, 1.5, 0.5, 0.5,
-3.365551, -3.780128, -2, 0, 1.5, 0.5, 0.5,
-3.365551, -3.780128, 0, 0, -0.5, 0.5, 0.5,
-3.365551, -3.780128, 0, 1, -0.5, 0.5, 0.5,
-3.365551, -3.780128, 0, 1, 1.5, 0.5, 0.5,
-3.365551, -3.780128, 0, 0, 1.5, 0.5, 0.5,
-3.365551, -3.780128, 2, 0, -0.5, 0.5, 0.5,
-3.365551, -3.780128, 2, 1, -0.5, 0.5, 0.5,
-3.365551, -3.780128, 2, 1, 1.5, 0.5, 0.5,
-3.365551, -3.780128, 2, 0, 1.5, 0.5, 0.5,
-3.365551, -3.780128, 4, 0, -0.5, 0.5, 0.5,
-3.365551, -3.780128, 4, 1, -0.5, 0.5, 0.5,
-3.365551, -3.780128, 4, 1, 1.5, 0.5, 0.5,
-3.365551, -3.780128, 4, 0, 1.5, 0.5, 0.5
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
-2.936393, -3.306756, -5.069188,
-2.936393, 3.004869, -5.069188,
-2.936393, -3.306756, 5.721772,
-2.936393, 3.004869, 5.721772,
-2.936393, -3.306756, -5.069188,
-2.936393, -3.306756, 5.721772,
-2.936393, 3.004869, -5.069188,
-2.936393, 3.004869, 5.721772,
-2.936393, -3.306756, -5.069188,
2.785716, -3.306756, -5.069188,
-2.936393, -3.306756, 5.721772,
2.785716, -3.306756, 5.721772,
-2.936393, 3.004869, -5.069188,
2.785716, 3.004869, -5.069188,
-2.936393, 3.004869, 5.721772,
2.785716, 3.004869, 5.721772,
2.785716, -3.306756, -5.069188,
2.785716, 3.004869, -5.069188,
2.785716, -3.306756, 5.721772,
2.785716, 3.004869, 5.721772,
2.785716, -3.306756, -5.069188,
2.785716, -3.306756, 5.721772,
2.785716, 3.004869, -5.069188,
2.785716, 3.004869, 5.721772
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
var radius = 7.341485;
var distance = 32.6631;
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
mvMatrix.translate( 0.07533872, 0.1509433, -0.326292 );
mvMatrix.scale( 1.387208, 1.257641, 0.7355932 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.6631);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
fenac<-read.table("fenac.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fenac$V2
```

```
## Error in eval(expr, envir, enclos): object 'fenac' not found
```

```r
y<-fenac$V3
```

```
## Error in eval(expr, envir, enclos): object 'fenac' not found
```

```r
z<-fenac$V4
```

```
## Error in eval(expr, envir, enclos): object 'fenac' not found
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
-2.853061, 1.297925, -1.185473, 0, 0, 1, 1, 1,
-2.818896, 1.732446, -0.9056972, 1, 0, 0, 1, 1,
-2.800813, -0.556156, -2.905142, 1, 0, 0, 1, 1,
-2.794356, -0.9660797, -1.503484, 1, 0, 0, 1, 1,
-2.536669, 2.010338, -0.4619008, 1, 0, 0, 1, 1,
-2.490207, -0.3826082, -3.003451, 1, 0, 0, 1, 1,
-2.374335, -1.26657, -2.361504, 0, 0, 0, 1, 1,
-2.361791, 0.3466526, 0.3933176, 0, 0, 0, 1, 1,
-2.352714, 0.8377799, -1.684519, 0, 0, 0, 1, 1,
-2.315135, -0.7957194, -0.5888994, 0, 0, 0, 1, 1,
-2.26612, -0.9091399, -0.6488742, 0, 0, 0, 1, 1,
-2.252076, 1.686334, -1.979596, 0, 0, 0, 1, 1,
-2.214457, -0.09947234, -2.990895, 0, 0, 0, 1, 1,
-2.203068, 0.418099, -0.2423211, 1, 1, 1, 1, 1,
-2.109893, -1.354864, -2.095494, 1, 1, 1, 1, 1,
-2.096287, 0.3960139, -1.397369, 1, 1, 1, 1, 1,
-2.042715, -0.3162736, -2.183633, 1, 1, 1, 1, 1,
-2.03417, -1.885098, 0.2653449, 1, 1, 1, 1, 1,
-2.006818, 0.5199265, -0.4125313, 1, 1, 1, 1, 1,
-1.996664, -0.3039462, -2.07843, 1, 1, 1, 1, 1,
-1.994101, -1.175716, -1.08982, 1, 1, 1, 1, 1,
-1.993837, -0.9671089, -2.622293, 1, 1, 1, 1, 1,
-1.989961, -0.5731214, -2.142066, 1, 1, 1, 1, 1,
-1.961875, -0.1310743, -2.894487, 1, 1, 1, 1, 1,
-1.912679, -1.216341, -1.65912, 1, 1, 1, 1, 1,
-1.907162, 0.6434243, -0.9659894, 1, 1, 1, 1, 1,
-1.906007, -0.7787333, -0.7693367, 1, 1, 1, 1, 1,
-1.847862, 0.9623365, -1.433528, 1, 1, 1, 1, 1,
-1.82792, -1.338724, -2.93251, 0, 0, 1, 1, 1,
-1.822202, -0.02436051, -2.567421, 1, 0, 0, 1, 1,
-1.797454, 0.4628685, -0.3657638, 1, 0, 0, 1, 1,
-1.780589, -0.1092689, -2.436973, 1, 0, 0, 1, 1,
-1.777763, 0.8889154, -0.7043971, 1, 0, 0, 1, 1,
-1.776919, 0.01287627, -1.222947, 1, 0, 0, 1, 1,
-1.776846, -1.354587, -1.083083, 0, 0, 0, 1, 1,
-1.752206, -1.53135, -2.342748, 0, 0, 0, 1, 1,
-1.745317, -0.5326831, -1.570183, 0, 0, 0, 1, 1,
-1.709425, 0.07585458, -0.02088595, 0, 0, 0, 1, 1,
-1.708559, -2.001551, -4.198355, 0, 0, 0, 1, 1,
-1.699603, 0.567122, -0.8302784, 0, 0, 0, 1, 1,
-1.692917, 0.513849, -1.930191, 0, 0, 0, 1, 1,
-1.691834, 0.5040358, -2.757239, 1, 1, 1, 1, 1,
-1.689549, -1.1268, -2.386631, 1, 1, 1, 1, 1,
-1.688774, -0.9370361, -3.024785, 1, 1, 1, 1, 1,
-1.687588, -0.009837445, 0.4451331, 1, 1, 1, 1, 1,
-1.678767, 0.1778323, -2.726522, 1, 1, 1, 1, 1,
-1.676234, -1.754431, -1.173482, 1, 1, 1, 1, 1,
-1.673544, 1.333585, -1.191657, 1, 1, 1, 1, 1,
-1.652676, 0.2602035, -2.379046, 1, 1, 1, 1, 1,
-1.63496, -0.3850899, -0.4392619, 1, 1, 1, 1, 1,
-1.612776, 1.371187, -0.3112144, 1, 1, 1, 1, 1,
-1.594172, 1.060745, -1.344181, 1, 1, 1, 1, 1,
-1.582935, 0.2206649, -0.5705028, 1, 1, 1, 1, 1,
-1.576461, 0.2741212, -0.6659703, 1, 1, 1, 1, 1,
-1.575057, -1.433782, -2.985303, 1, 1, 1, 1, 1,
-1.574142, -0.295857, -4.403008, 1, 1, 1, 1, 1,
-1.554108, 0.8245613, -2.428322, 0, 0, 1, 1, 1,
-1.523044, 0.09181821, 0.5694484, 1, 0, 0, 1, 1,
-1.504567, -0.09406675, -2.554048, 1, 0, 0, 1, 1,
-1.497411, -3.037074, -3.490955, 1, 0, 0, 1, 1,
-1.488059, 0.004535587, -3.062383, 1, 0, 0, 1, 1,
-1.481496, 0.1286166, -0.4971552, 1, 0, 0, 1, 1,
-1.476496, 0.3511223, -0.6308218, 0, 0, 0, 1, 1,
-1.466637, -1.483635, -3.481428, 0, 0, 0, 1, 1,
-1.453996, -2.620895, -2.871107, 0, 0, 0, 1, 1,
-1.451072, 1.572931, -0.09611002, 0, 0, 0, 1, 1,
-1.446443, 0.2895083, -0.9953175, 0, 0, 0, 1, 1,
-1.444909, -0.2465237, -1.354695, 0, 0, 0, 1, 1,
-1.444598, -0.4127896, -4.449452, 0, 0, 0, 1, 1,
-1.431555, -1.951625, -1.866272, 1, 1, 1, 1, 1,
-1.410109, -0.3131008, -2.982224, 1, 1, 1, 1, 1,
-1.400151, -0.1415097, -1.769895, 1, 1, 1, 1, 1,
-1.395703, 1.012967, -1.490591, 1, 1, 1, 1, 1,
-1.388355, -0.9516886, -1.769634, 1, 1, 1, 1, 1,
-1.378033, 0.5168864, -2.193912, 1, 1, 1, 1, 1,
-1.369348, -0.1935075, 0.1595219, 1, 1, 1, 1, 1,
-1.34877, -1.133886, -3.910674, 1, 1, 1, 1, 1,
-1.332952, 0.8204432, -3.432386, 1, 1, 1, 1, 1,
-1.330789, -0.2431532, -2.613351, 1, 1, 1, 1, 1,
-1.33052, -0.05707316, -1.726858, 1, 1, 1, 1, 1,
-1.326757, 1.139613, -1.990754, 1, 1, 1, 1, 1,
-1.325422, -1.25467, -3.086606, 1, 1, 1, 1, 1,
-1.322762, -0.2671249, -2.582417, 1, 1, 1, 1, 1,
-1.305336, 0.02090767, -1.599564, 1, 1, 1, 1, 1,
-1.301984, -0.2176154, -0.6938605, 0, 0, 1, 1, 1,
-1.301721, 0.8083191, 0.6226451, 1, 0, 0, 1, 1,
-1.301243, 2.406965, -1.269364, 1, 0, 0, 1, 1,
-1.285091, 0.6030681, -1.041359, 1, 0, 0, 1, 1,
-1.284035, 0.7895487, -0.6514385, 1, 0, 0, 1, 1,
-1.272189, 2.328734, -1.007439, 1, 0, 0, 1, 1,
-1.268894, -1.767658, -2.902832, 0, 0, 0, 1, 1,
-1.256569, 0.6418688, -0.1860781, 0, 0, 0, 1, 1,
-1.254144, -0.2933164, -1.612309, 0, 0, 0, 1, 1,
-1.235992, 0.5915104, -1.427455, 0, 0, 0, 1, 1,
-1.227171, 0.3377364, -2.265907, 0, 0, 0, 1, 1,
-1.226673, -0.4759187, -1.584716, 0, 0, 0, 1, 1,
-1.226136, 0.02386422, -2.273417, 0, 0, 0, 1, 1,
-1.207281, -0.03999433, 0.04638447, 1, 1, 1, 1, 1,
-1.205402, 1.202088, -1.460559, 1, 1, 1, 1, 1,
-1.198623, -1.37191, -0.7853648, 1, 1, 1, 1, 1,
-1.195869, -1.649632, -1.501165, 1, 1, 1, 1, 1,
-1.190469, -0.3034565, -1.36563, 1, 1, 1, 1, 1,
-1.185874, -1.298754, -1.519766, 1, 1, 1, 1, 1,
-1.182951, -0.656615, -1.744308, 1, 1, 1, 1, 1,
-1.177955, 0.2173366, -1.232977, 1, 1, 1, 1, 1,
-1.176994, -1.026292, -1.380962, 1, 1, 1, 1, 1,
-1.174368, -0.6005819, -2.900049, 1, 1, 1, 1, 1,
-1.169264, -0.7104278, -1.586516, 1, 1, 1, 1, 1,
-1.167289, 0.919645, -0.8512559, 1, 1, 1, 1, 1,
-1.145883, 0.9911256, -0.6629077, 1, 1, 1, 1, 1,
-1.145003, -0.3496631, -2.575266, 1, 1, 1, 1, 1,
-1.144453, -0.5356007, -3.105007, 1, 1, 1, 1, 1,
-1.137382, -0.00135161, -2.456504, 0, 0, 1, 1, 1,
-1.133927, -0.1788708, -0.9666595, 1, 0, 0, 1, 1,
-1.13134, 0.1036254, -2.710121, 1, 0, 0, 1, 1,
-1.123415, -0.6168802, -3.261952, 1, 0, 0, 1, 1,
-1.122992, -0.0535423, -1.095533, 1, 0, 0, 1, 1,
-1.112806, 0.9638116, -1.248255, 1, 0, 0, 1, 1,
-1.109933, -0.8412838, -4.151188, 0, 0, 0, 1, 1,
-1.107922, -1.517202, -1.964751, 0, 0, 0, 1, 1,
-1.107906, -2.30488, -2.746593, 0, 0, 0, 1, 1,
-1.10546, -0.3045295, -1.778888, 0, 0, 0, 1, 1,
-1.103456, -1.369965, -2.919442, 0, 0, 0, 1, 1,
-1.101763, 1.030411, -1.383877, 0, 0, 0, 1, 1,
-1.09979, 0.7830955, -2.345863, 0, 0, 0, 1, 1,
-1.099024, -0.2081749, -1.537556, 1, 1, 1, 1, 1,
-1.092236, 0.8424675, -0.5486071, 1, 1, 1, 1, 1,
-1.084614, -0.4400587, -1.918167, 1, 1, 1, 1, 1,
-1.07626, 0.2815213, -0.8090056, 1, 1, 1, 1, 1,
-1.060576, -0.1593377, -0.1943914, 1, 1, 1, 1, 1,
-1.059286, -0.418731, -3.026936, 1, 1, 1, 1, 1,
-1.056396, 0.2192859, -1.775577, 1, 1, 1, 1, 1,
-1.056338, 0.28372, -1.981646, 1, 1, 1, 1, 1,
-1.049943, 1.678346, -0.9628502, 1, 1, 1, 1, 1,
-1.046687, -0.03599491, -0.6732734, 1, 1, 1, 1, 1,
-1.043632, 0.04826664, -1.383396, 1, 1, 1, 1, 1,
-1.034712, 1.108263, -1.062483, 1, 1, 1, 1, 1,
-1.024748, -0.8819773, -2.805452, 1, 1, 1, 1, 1,
-1.023325, 1.318905, -0.8019986, 1, 1, 1, 1, 1,
-1.011325, 0.8153942, -1.612395, 1, 1, 1, 1, 1,
-1.010092, -1.24794, -3.657219, 0, 0, 1, 1, 1,
-1.005471, 1.015266, 0.5307127, 1, 0, 0, 1, 1,
-1.003876, 1.122725, 0.9735104, 1, 0, 0, 1, 1,
-1.003287, 0.9589544, -1.045898, 1, 0, 0, 1, 1,
-1.001346, 1.417702, -0.3211214, 1, 0, 0, 1, 1,
-0.9998952, -2.77403, -3.134347, 1, 0, 0, 1, 1,
-0.9989374, 0.08013672, -1.681109, 0, 0, 0, 1, 1,
-0.9958492, 0.6715037, -1.27645, 0, 0, 0, 1, 1,
-0.9912066, 1.142552, -2.500597, 0, 0, 0, 1, 1,
-0.9897964, -0.4336964, -2.912291, 0, 0, 0, 1, 1,
-0.9895934, 0.6485393, -0.4065751, 0, 0, 0, 1, 1,
-0.9869768, 0.5865915, -1.816491, 0, 0, 0, 1, 1,
-0.9863269, 1.055101, -0.6785435, 0, 0, 0, 1, 1,
-0.9845129, 0.8853268, -0.170397, 1, 1, 1, 1, 1,
-0.9840919, -0.8341097, -1.325579, 1, 1, 1, 1, 1,
-0.978339, -2.368847, -2.575441, 1, 1, 1, 1, 1,
-0.9768565, -0.4840933, -1.772975, 1, 1, 1, 1, 1,
-0.9755529, 0.04398302, -1.772571, 1, 1, 1, 1, 1,
-0.9677914, -0.3917877, -0.9996476, 1, 1, 1, 1, 1,
-0.9643456, 0.5649439, -1.528203, 1, 1, 1, 1, 1,
-0.9629905, 0.6892471, -1.974721, 1, 1, 1, 1, 1,
-0.9618456, -1.646645, -3.408106, 1, 1, 1, 1, 1,
-0.9614561, 0.7840859, -1.869044, 1, 1, 1, 1, 1,
-0.9538394, -1.524882, -2.050742, 1, 1, 1, 1, 1,
-0.9537262, 0.6055441, -1.595268, 1, 1, 1, 1, 1,
-0.9449384, -0.1001917, -4.345382, 1, 1, 1, 1, 1,
-0.9395444, 1.983585, -0.2893952, 1, 1, 1, 1, 1,
-0.9288691, 1.019383, -1.706362, 1, 1, 1, 1, 1,
-0.9259543, 0.08504814, -0.7457203, 0, 0, 1, 1, 1,
-0.925311, 1.577635, -0.7833291, 1, 0, 0, 1, 1,
-0.9232581, 0.1753076, -0.9508826, 1, 0, 0, 1, 1,
-0.923102, -0.6001881, -3.224147, 1, 0, 0, 1, 1,
-0.9230472, -0.6715385, -2.405863, 1, 0, 0, 1, 1,
-0.9229139, 0.6929191, -1.275741, 1, 0, 0, 1, 1,
-0.9171506, -0.7302088, -2.040497, 0, 0, 0, 1, 1,
-0.9099839, 0.3391593, -1.373685, 0, 0, 0, 1, 1,
-0.9031517, -0.2637551, -0.1674438, 0, 0, 0, 1, 1,
-0.8971986, 0.2667401, -0.415365, 0, 0, 0, 1, 1,
-0.8965162, 0.2165223, -1.392328, 0, 0, 0, 1, 1,
-0.8932868, -0.6911976, -1.716298, 0, 0, 0, 1, 1,
-0.8704165, 0.5836194, -1.293523, 0, 0, 0, 1, 1,
-0.8692436, -0.1606573, -0.8329784, 1, 1, 1, 1, 1,
-0.8656662, -0.312606, -2.050124, 1, 1, 1, 1, 1,
-0.864201, 1.245507, -0.6728261, 1, 1, 1, 1, 1,
-0.8601726, 0.3133445, -1.245054, 1, 1, 1, 1, 1,
-0.8577907, 0.1634213, -3.699472, 1, 1, 1, 1, 1,
-0.8571634, 0.5337699, -0.678679, 1, 1, 1, 1, 1,
-0.8570502, -0.372811, 1.337963, 1, 1, 1, 1, 1,
-0.8569419, 0.9035683, 0.6088601, 1, 1, 1, 1, 1,
-0.8566524, 0.2651955, -0.1895028, 1, 1, 1, 1, 1,
-0.8535674, -1.409908, -3.273449, 1, 1, 1, 1, 1,
-0.8532028, -0.6329781, -2.373121, 1, 1, 1, 1, 1,
-0.8448621, -1.904745, -3.615832, 1, 1, 1, 1, 1,
-0.8399081, 0.1669029, -0.659409, 1, 1, 1, 1, 1,
-0.8358751, 1.477771, 0.7316188, 1, 1, 1, 1, 1,
-0.8252795, -0.0947912, -2.248429, 1, 1, 1, 1, 1,
-0.8242466, -1.309139, -3.002202, 0, 0, 1, 1, 1,
-0.8214177, -1.55945, -2.554996, 1, 0, 0, 1, 1,
-0.8182199, 0.2031052, -1.840019, 1, 0, 0, 1, 1,
-0.8117471, -0.004983255, -1.949263, 1, 0, 0, 1, 1,
-0.8099377, 0.8528386, -0.6296542, 1, 0, 0, 1, 1,
-0.8063706, 0.3617995, -2.414756, 1, 0, 0, 1, 1,
-0.800314, -1.62762, -4.352154, 0, 0, 0, 1, 1,
-0.7995387, -0.5320628, -3.516812, 0, 0, 0, 1, 1,
-0.7976267, -1.215627, -1.846913, 0, 0, 0, 1, 1,
-0.7958153, 0.5547638, -1.966025, 0, 0, 0, 1, 1,
-0.7900037, 0.5684277, 0.2301358, 0, 0, 0, 1, 1,
-0.786657, -0.06538264, -1.715895, 0, 0, 0, 1, 1,
-0.7755643, -0.5588, -0.8620592, 0, 0, 0, 1, 1,
-0.7710239, 0.963945, -2.587557, 1, 1, 1, 1, 1,
-0.770957, -0.6657322, -4.3302, 1, 1, 1, 1, 1,
-0.7696499, 0.1970983, -1.812513, 1, 1, 1, 1, 1,
-0.7681415, 0.5815873, -1.078986, 1, 1, 1, 1, 1,
-0.7632841, -0.2503096, -2.036651, 1, 1, 1, 1, 1,
-0.761929, -0.2332812, -1.765262, 1, 1, 1, 1, 1,
-0.7596616, -0.5181576, -1.630309, 1, 1, 1, 1, 1,
-0.758464, 0.526418, -1.095033, 1, 1, 1, 1, 1,
-0.7556676, -0.0003786738, -1.860168, 1, 1, 1, 1, 1,
-0.7543515, 1.133007, -0.1816269, 1, 1, 1, 1, 1,
-0.7535295, -0.579522, -2.63091, 1, 1, 1, 1, 1,
-0.7497479, -0.7382689, -3.808503, 1, 1, 1, 1, 1,
-0.7411073, -0.3456513, -2.158534, 1, 1, 1, 1, 1,
-0.738288, -1.628391, -1.8748, 1, 1, 1, 1, 1,
-0.7325397, -1.046013, -2.376299, 1, 1, 1, 1, 1,
-0.728321, 1.117633, 0.3264015, 0, 0, 1, 1, 1,
-0.7268041, 0.5865208, 0.7930674, 1, 0, 0, 1, 1,
-0.7252923, -0.6590749, -3.39835, 1, 0, 0, 1, 1,
-0.7251148, -0.356203, -3.824788, 1, 0, 0, 1, 1,
-0.7120727, 1.196258, 0.04205843, 1, 0, 0, 1, 1,
-0.7056491, -0.7617738, -2.396907, 1, 0, 0, 1, 1,
-0.7042296, 0.5682971, -2.142652, 0, 0, 0, 1, 1,
-0.7029488, -1.378657, -2.612218, 0, 0, 0, 1, 1,
-0.7018961, 1.218795, -2.580054, 0, 0, 0, 1, 1,
-0.7015896, -0.2775057, 0.3542483, 0, 0, 0, 1, 1,
-0.699779, -0.763267, -1.222326, 0, 0, 0, 1, 1,
-0.699248, 0.259918, -0.05859964, 0, 0, 0, 1, 1,
-0.6965951, -0.2103469, -3.214001, 0, 0, 0, 1, 1,
-0.6940248, 1.489063, -1.262791, 1, 1, 1, 1, 1,
-0.6797451, -1.23743, -2.387633, 1, 1, 1, 1, 1,
-0.6737298, -0.8554631, -3.84102, 1, 1, 1, 1, 1,
-0.6733385, 1.585321, -2.145049, 1, 1, 1, 1, 1,
-0.6684546, -0.02134572, -1.493979, 1, 1, 1, 1, 1,
-0.6574771, 2.168026, -0.3824169, 1, 1, 1, 1, 1,
-0.6540238, -0.2008485, -2.214139, 1, 1, 1, 1, 1,
-0.6531132, 0.2218465, -1.402688, 1, 1, 1, 1, 1,
-0.6450272, -2.330916, -2.117146, 1, 1, 1, 1, 1,
-0.6440355, -1.215851, -3.001804, 1, 1, 1, 1, 1,
-0.6436698, 0.05768644, -2.816762, 1, 1, 1, 1, 1,
-0.6428708, -0.0507009, -2.170775, 1, 1, 1, 1, 1,
-0.6373756, 0.8465722, -1.496484, 1, 1, 1, 1, 1,
-0.6344691, -0.2317775, -2.846827, 1, 1, 1, 1, 1,
-0.6343119, -1.069031, -1.979226, 1, 1, 1, 1, 1,
-0.6339838, -0.09201931, -3.003772, 0, 0, 1, 1, 1,
-0.6301225, -1.43523, 0.8722461, 1, 0, 0, 1, 1,
-0.6255089, -0.6857172, -2.542236, 1, 0, 0, 1, 1,
-0.6235428, 1.121061, -0.4162112, 1, 0, 0, 1, 1,
-0.6234214, 0.09779622, -1.826649, 1, 0, 0, 1, 1,
-0.6230645, 0.1891692, -2.546013, 1, 0, 0, 1, 1,
-0.6204933, 0.4076627, -0.9446985, 0, 0, 0, 1, 1,
-0.6185197, 0.8827719, -0.5432352, 0, 0, 0, 1, 1,
-0.6178203, 1.388581, 0.9004511, 0, 0, 0, 1, 1,
-0.6087456, -0.9328508, -1.592927, 0, 0, 0, 1, 1,
-0.6012132, -1.349376, -3.577239, 0, 0, 0, 1, 1,
-0.5998461, -0.5916413, -1.943587, 0, 0, 0, 1, 1,
-0.5869032, -0.3057908, -0.1799954, 0, 0, 0, 1, 1,
-0.5868979, 1.457529, -3.420347, 1, 1, 1, 1, 1,
-0.5836544, -0.8821823, -1.865434, 1, 1, 1, 1, 1,
-0.5797911, 0.3123249, -1.701418, 1, 1, 1, 1, 1,
-0.5778959, -0.4923236, -2.698009, 1, 1, 1, 1, 1,
-0.5773161, 0.4683719, 0.3270808, 1, 1, 1, 1, 1,
-0.5717744, 1.758848, -1.161257, 1, 1, 1, 1, 1,
-0.5714296, -1.319961, -2.720191, 1, 1, 1, 1, 1,
-0.5693244, 1.425136, -0.5559976, 1, 1, 1, 1, 1,
-0.5660788, -1.040297, -2.055453, 1, 1, 1, 1, 1,
-0.56545, 1.064235, -0.6149433, 1, 1, 1, 1, 1,
-0.5583267, -0.4075912, -2.584119, 1, 1, 1, 1, 1,
-0.5574988, -0.1587151, -0.6009945, 1, 1, 1, 1, 1,
-0.5550739, 0.7380474, 0.1550138, 1, 1, 1, 1, 1,
-0.5474735, 0.732147, -0.3997976, 1, 1, 1, 1, 1,
-0.5465686, 0.832064, -0.02147146, 1, 1, 1, 1, 1,
-0.5397254, -0.192407, 0.2358462, 0, 0, 1, 1, 1,
-0.5392206, -0.7235253, -3.99936, 1, 0, 0, 1, 1,
-0.526999, -0.6638894, -2.42938, 1, 0, 0, 1, 1,
-0.5258344, 0.04790378, -0.2384524, 1, 0, 0, 1, 1,
-0.5130756, 0.2771406, -1.556671, 1, 0, 0, 1, 1,
-0.5113671, 2.912952, 0.1281306, 1, 0, 0, 1, 1,
-0.501191, -0.333827, -2.049665, 0, 0, 0, 1, 1,
-0.5004467, 0.2110554, 0.07805097, 0, 0, 0, 1, 1,
-0.499691, -0.3605648, -2.211407, 0, 0, 0, 1, 1,
-0.4987677, 1.966734, 1.321307, 0, 0, 0, 1, 1,
-0.4977241, 0.176962, 0.1642362, 0, 0, 0, 1, 1,
-0.4960656, 1.295329, -1.278566, 0, 0, 0, 1, 1,
-0.4927519, -0.1438872, -3.981694, 0, 0, 0, 1, 1,
-0.4905888, -0.771, -2.397673, 1, 1, 1, 1, 1,
-0.4901729, 0.5708961, 0.3083661, 1, 1, 1, 1, 1,
-0.4875114, 0.5889699, -0.04859477, 1, 1, 1, 1, 1,
-0.4838339, -0.5788131, -2.833097, 1, 1, 1, 1, 1,
-0.474766, 1.21931, -1.426992, 1, 1, 1, 1, 1,
-0.473797, 0.5572504, -1.409276, 1, 1, 1, 1, 1,
-0.4684568, 0.2149296, -2.905793, 1, 1, 1, 1, 1,
-0.4672409, -0.5410348, -1.310568, 1, 1, 1, 1, 1,
-0.4660127, 0.6310404, -3.585762, 1, 1, 1, 1, 1,
-0.4593633, -0.8847581, -3.778981, 1, 1, 1, 1, 1,
-0.4570511, -1.052427, -2.879208, 1, 1, 1, 1, 1,
-0.4532531, -0.1011695, -1.930262, 1, 1, 1, 1, 1,
-0.4525236, 0.3835598, -0.0739616, 1, 1, 1, 1, 1,
-0.4498288, 1.200002, -0.6455567, 1, 1, 1, 1, 1,
-0.4460395, 0.2561533, -0.9430906, 1, 1, 1, 1, 1,
-0.4444222, 0.6160052, -1.932739, 0, 0, 1, 1, 1,
-0.4440207, 0.6159089, -0.6308977, 1, 0, 0, 1, 1,
-0.4392984, 1.695169, -2.12356, 1, 0, 0, 1, 1,
-0.4390451, 0.4280148, -2.437644, 1, 0, 0, 1, 1,
-0.4389203, 0.2434834, -2.47293, 1, 0, 0, 1, 1,
-0.4364757, -0.2788673, -2.739964, 1, 0, 0, 1, 1,
-0.435196, -0.9171907, -1.77093, 0, 0, 0, 1, 1,
-0.4348629, -1.301581, -2.526524, 0, 0, 0, 1, 1,
-0.4311717, -0.554432, -2.656394, 0, 0, 0, 1, 1,
-0.4282741, 0.8276653, -0.09379392, 0, 0, 0, 1, 1,
-0.4217059, -0.114515, -2.334005, 0, 0, 0, 1, 1,
-0.418447, 0.2625516, -1.275165, 0, 0, 0, 1, 1,
-0.4120854, -0.2978204, -0.9877689, 0, 0, 0, 1, 1,
-0.4105504, 0.4985311, -0.944619, 1, 1, 1, 1, 1,
-0.4103947, 0.8928316, -2.290018, 1, 1, 1, 1, 1,
-0.3999279, 0.4385841, -1.581806, 1, 1, 1, 1, 1,
-0.3996157, 0.2027763, -1.145985, 1, 1, 1, 1, 1,
-0.3988077, 1.037023, 0.2735096, 1, 1, 1, 1, 1,
-0.3982698, -0.1670038, -1.547006, 1, 1, 1, 1, 1,
-0.3956446, -1.370908, -1.644361, 1, 1, 1, 1, 1,
-0.3748232, -0.91996, -3.955474, 1, 1, 1, 1, 1,
-0.374289, 0.003690251, -1.323585, 1, 1, 1, 1, 1,
-0.3737632, 0.02309172, -2.301506, 1, 1, 1, 1, 1,
-0.3700815, 1.326869, 0.04869973, 1, 1, 1, 1, 1,
-0.3659218, -2.047005, -3.017336, 1, 1, 1, 1, 1,
-0.3626581, -0.7399798, -4.840996, 1, 1, 1, 1, 1,
-0.3594702, -0.2486493, -1.544038, 1, 1, 1, 1, 1,
-0.3585512, 1.069994, -0.042013, 1, 1, 1, 1, 1,
-0.3558499, 1.23515, -0.7625359, 0, 0, 1, 1, 1,
-0.35138, 0.2624035, -0.4393062, 1, 0, 0, 1, 1,
-0.3437541, -0.1454313, -2.446597, 1, 0, 0, 1, 1,
-0.3435688, -1.4638, -4.039811, 1, 0, 0, 1, 1,
-0.3412493, 0.7648044, -1.731794, 1, 0, 0, 1, 1,
-0.3410656, -0.01646622, -1.495867, 1, 0, 0, 1, 1,
-0.3393034, 1.196048, 0.2461539, 0, 0, 0, 1, 1,
-0.3350995, 0.3986511, 0.176438, 0, 0, 0, 1, 1,
-0.3350612, 0.3111679, -0.4683977, 0, 0, 0, 1, 1,
-0.333285, -0.1221275, -2.140508, 0, 0, 0, 1, 1,
-0.3331869, -1.253917, -2.835572, 0, 0, 0, 1, 1,
-0.3279389, -0.6339864, -2.738692, 0, 0, 0, 1, 1,
-0.326757, 0.7039249, -0.985269, 0, 0, 0, 1, 1,
-0.3257844, -0.3139607, -1.98369, 1, 1, 1, 1, 1,
-0.3256861, 0.1200271, -1.517248, 1, 1, 1, 1, 1,
-0.320333, 0.1242085, -1.968362, 1, 1, 1, 1, 1,
-0.3154655, -0.5760506, -3.924545, 1, 1, 1, 1, 1,
-0.3114727, 0.3535107, -0.6179349, 1, 1, 1, 1, 1,
-0.3108832, 1.137585, 0.1069922, 1, 1, 1, 1, 1,
-0.3042746, -0.5229887, -1.903501, 1, 1, 1, 1, 1,
-0.3036433, -0.5337102, -3.752993, 1, 1, 1, 1, 1,
-0.3036342, 0.4037188, 1.732019, 1, 1, 1, 1, 1,
-0.3021377, 2.56286, 0.5930456, 1, 1, 1, 1, 1,
-0.300593, -0.6668452, -3.073977, 1, 1, 1, 1, 1,
-0.2994049, 1.047378, -1.84793, 1, 1, 1, 1, 1,
-0.2982138, -0.6745269, -3.054678, 1, 1, 1, 1, 1,
-0.2939126, -1.02712, -3.786292, 1, 1, 1, 1, 1,
-0.2911797, -0.4897837, -2.932798, 1, 1, 1, 1, 1,
-0.2891659, 0.1466475, -0.2624086, 0, 0, 1, 1, 1,
-0.2873456, 1.209126, -0.02898055, 1, 0, 0, 1, 1,
-0.2809082, -0.6798317, -3.583704, 1, 0, 0, 1, 1,
-0.2738314, -0.8989214, -3.818491, 1, 0, 0, 1, 1,
-0.2737292, 0.2053814, -1.863856, 1, 0, 0, 1, 1,
-0.2716518, 1.116626, 0.249622, 1, 0, 0, 1, 1,
-0.2698288, 0.9566405, -0.07417782, 0, 0, 0, 1, 1,
-0.2695522, -2.527417, -2.587416, 0, 0, 0, 1, 1,
-0.26608, 1.164356, 0.02945194, 0, 0, 0, 1, 1,
-0.2650436, 1.200475, 1.927528, 0, 0, 0, 1, 1,
-0.2609949, 0.1021061, -0.2662067, 0, 0, 0, 1, 1,
-0.2575123, 0.7740504, -0.4044066, 0, 0, 0, 1, 1,
-0.257299, 0.5719603, 0.3371352, 0, 0, 0, 1, 1,
-0.2528238, 0.8989224, -1.174515, 1, 1, 1, 1, 1,
-0.2526187, 0.3444784, -1.671138, 1, 1, 1, 1, 1,
-0.2518883, -0.3944708, -1.805609, 1, 1, 1, 1, 1,
-0.2512576, -0.09933301, -2.286044, 1, 1, 1, 1, 1,
-0.2508098, -0.9304603, -1.993467, 1, 1, 1, 1, 1,
-0.2503105, -0.744226, -3.469057, 1, 1, 1, 1, 1,
-0.2484062, -0.1336319, -2.708942, 1, 1, 1, 1, 1,
-0.2427994, -0.2667484, -1.415919, 1, 1, 1, 1, 1,
-0.2398591, -1.13646, -3.788649, 1, 1, 1, 1, 1,
-0.2375259, 0.3244617, 0.02454498, 1, 1, 1, 1, 1,
-0.2325404, 1.076, 1.49663, 1, 1, 1, 1, 1,
-0.2315851, -1.192922, -4.374083, 1, 1, 1, 1, 1,
-0.2307521, 0.5531279, -1.369735, 1, 1, 1, 1, 1,
-0.2267671, -0.7830274, -3.374231, 1, 1, 1, 1, 1,
-0.2251518, 0.7992197, 1.126225, 1, 1, 1, 1, 1,
-0.2173416, 0.03364906, -0.7613958, 0, 0, 1, 1, 1,
-0.2161199, 0.2630877, -1.641889, 1, 0, 0, 1, 1,
-0.2148919, -1.575766, -1.61271, 1, 0, 0, 1, 1,
-0.2115795, 0.05076735, -2.523758, 1, 0, 0, 1, 1,
-0.208468, -0.5559893, -4.189053, 1, 0, 0, 1, 1,
-0.2071614, 0.7220027, -0.891046, 1, 0, 0, 1, 1,
-0.2065484, -0.4917878, -2.865732, 0, 0, 0, 1, 1,
-0.2063526, -1.883512, -3.372834, 0, 0, 0, 1, 1,
-0.204728, 0.8655723, -0.003239264, 0, 0, 0, 1, 1,
-0.2047029, -1.13574, -2.234516, 0, 0, 0, 1, 1,
-0.2029928, 0.626498, 0.3049521, 0, 0, 0, 1, 1,
-0.2017008, 1.290608, 2.111233, 0, 0, 0, 1, 1,
-0.2001315, -0.9055662, -2.21203, 0, 0, 0, 1, 1,
-0.198643, 0.7261637, 0.1870875, 1, 1, 1, 1, 1,
-0.1942368, -0.6779531, -0.851509, 1, 1, 1, 1, 1,
-0.1921305, 0.08969719, -1.934789, 1, 1, 1, 1, 1,
-0.191883, 0.4802196, 0.5324867, 1, 1, 1, 1, 1,
-0.1915145, 1.433787, 0.5011021, 1, 1, 1, 1, 1,
-0.1907595, 1.772098, -0.5327599, 1, 1, 1, 1, 1,
-0.1899495, 1.371904, 0.008686798, 1, 1, 1, 1, 1,
-0.1891971, -1.958184, -4.132048, 1, 1, 1, 1, 1,
-0.1881792, 1.68983, 0.6403239, 1, 1, 1, 1, 1,
-0.1858574, -0.6889563, -1.870261, 1, 1, 1, 1, 1,
-0.1811947, -0.2221888, -1.026546, 1, 1, 1, 1, 1,
-0.1808343, -2.204482, -3.930113, 1, 1, 1, 1, 1,
-0.1783773, 2.130819, -1.664766, 1, 1, 1, 1, 1,
-0.1764317, -0.1169401, -1.457205, 1, 1, 1, 1, 1,
-0.1709817, -2.472381, -4.489901, 1, 1, 1, 1, 1,
-0.1703664, -1.10466, -3.658499, 0, 0, 1, 1, 1,
-0.1701118, 1.057233, -0.8245999, 1, 0, 0, 1, 1,
-0.1679274, 0.1259606, -2.454658, 1, 0, 0, 1, 1,
-0.1659021, 0.7741293, 0.5514089, 1, 0, 0, 1, 1,
-0.1615785, 1.391661, -0.6080806, 1, 0, 0, 1, 1,
-0.1569015, -0.2717195, -0.8035294, 1, 0, 0, 1, 1,
-0.1542158, -1.47969, -3.928969, 0, 0, 0, 1, 1,
-0.1521446, -0.4912941, -3.615098, 0, 0, 0, 1, 1,
-0.1519246, 0.4126359, 0.3373625, 0, 0, 0, 1, 1,
-0.149337, -0.3811297, -4.216713, 0, 0, 0, 1, 1,
-0.1481813, -1.869755, -2.485191, 0, 0, 0, 1, 1,
-0.1434089, 1.755442, 0.5228665, 0, 0, 0, 1, 1,
-0.1409122, 0.7447577, -0.3672286, 0, 0, 0, 1, 1,
-0.1386977, -0.4627998, -2.429715, 1, 1, 1, 1, 1,
-0.1386068, 1.453616, 0.5713297, 1, 1, 1, 1, 1,
-0.1381077, 0.06371218, -0.9270561, 1, 1, 1, 1, 1,
-0.1376833, -1.196757, -2.846497, 1, 1, 1, 1, 1,
-0.1369886, -0.2162768, -2.859462, 1, 1, 1, 1, 1,
-0.1350078, 0.4700561, 0.6638086, 1, 1, 1, 1, 1,
-0.1347513, -1.012139, -2.615929, 1, 1, 1, 1, 1,
-0.1347331, 1.093733, -0.8984562, 1, 1, 1, 1, 1,
-0.133954, 0.07150931, -0.8373415, 1, 1, 1, 1, 1,
-0.1307838, -0.4007622, -2.066308, 1, 1, 1, 1, 1,
-0.1271648, 1.250867, -1.837264, 1, 1, 1, 1, 1,
-0.1270941, 0.8681313, 0.8195443, 1, 1, 1, 1, 1,
-0.1262843, -0.3185479, -2.180422, 1, 1, 1, 1, 1,
-0.1262417, 1.322418, -0.9776214, 1, 1, 1, 1, 1,
-0.1251001, 1.769666, -1.023028, 1, 1, 1, 1, 1,
-0.1224692, -0.8792936, -3.507845, 0, 0, 1, 1, 1,
-0.1190658, -2.341528, -3.49396, 1, 0, 0, 1, 1,
-0.1189796, -0.5738419, -1.351432, 1, 0, 0, 1, 1,
-0.1153175, -0.4592514, -2.978854, 1, 0, 0, 1, 1,
-0.1072565, 0.4368051, -0.3143703, 1, 0, 0, 1, 1,
-0.1055435, -0.0385754, -0.6176862, 1, 0, 0, 1, 1,
-0.1039287, -0.3968512, -1.973191, 0, 0, 0, 1, 1,
-0.1020692, 0.222722, 0.09890286, 0, 0, 0, 1, 1,
-0.1012071, -0.5259839, -3.068031, 0, 0, 0, 1, 1,
-0.09876747, -0.9904231, -2.318833, 0, 0, 0, 1, 1,
-0.09815297, 0.1033935, -0.6019699, 0, 0, 0, 1, 1,
-0.09448628, 0.7598093, -0.6921864, 0, 0, 0, 1, 1,
-0.09445715, 1.359017, 1.209121, 0, 0, 0, 1, 1,
-0.09165853, 0.9884647, -1.677402, 1, 1, 1, 1, 1,
-0.09095113, 0.2590281, -2.538748, 1, 1, 1, 1, 1,
-0.0907921, 0.003967638, -2.165826, 1, 1, 1, 1, 1,
-0.08904117, 0.1736104, -1.134048, 1, 1, 1, 1, 1,
-0.08829734, 0.08473781, 0.7925376, 1, 1, 1, 1, 1,
-0.08703341, -0.4361554, -3.752291, 1, 1, 1, 1, 1,
-0.08617456, -1.189954, -4.694618, 1, 1, 1, 1, 1,
-0.08317844, -0.978187, -3.277729, 1, 1, 1, 1, 1,
-0.0803994, 0.3691425, -1.864586, 1, 1, 1, 1, 1,
-0.07990201, -0.361428, -3.655293, 1, 1, 1, 1, 1,
-0.07728066, -0.463628, -2.211592, 1, 1, 1, 1, 1,
-0.07711255, -0.6415709, -4.202789, 1, 1, 1, 1, 1,
-0.07575035, -0.2560444, -4.275092, 1, 1, 1, 1, 1,
-0.07515159, 0.3701524, 0.3735049, 1, 1, 1, 1, 1,
-0.07056356, 0.66424, 0.8095207, 1, 1, 1, 1, 1,
-0.06790899, -0.255712, -4.110134, 0, 0, 1, 1, 1,
-0.06560466, -0.1590341, -1.598064, 1, 0, 0, 1, 1,
-0.06513482, 1.855051, -0.4099972, 1, 0, 0, 1, 1,
-0.06507831, 0.5799938, -1.328234, 1, 0, 0, 1, 1,
-0.06418932, -0.8436887, -2.061637, 1, 0, 0, 1, 1,
-0.05971901, 1.491219, 0.0334906, 1, 0, 0, 1, 1,
-0.05963744, 0.2713001, 1.068707, 0, 0, 0, 1, 1,
-0.05660809, 1.059107, -0.2232479, 0, 0, 0, 1, 1,
-0.05547765, -1.370326, -3.099255, 0, 0, 0, 1, 1,
-0.05278624, -0.3926749, -3.817474, 0, 0, 0, 1, 1,
-0.05189415, 0.1255216, -0.9863235, 0, 0, 0, 1, 1,
-0.04980472, -1.833967, -4.355619, 0, 0, 0, 1, 1,
-0.04958632, -0.4182816, -3.316913, 0, 0, 0, 1, 1,
-0.04956501, -0.3024072, -2.846491, 1, 1, 1, 1, 1,
-0.0473954, -0.9903849, -4.212392, 1, 1, 1, 1, 1,
-0.04582356, -0.4799568, -3.391741, 1, 1, 1, 1, 1,
-0.04070915, -0.9597103, -4.912038, 1, 1, 1, 1, 1,
-0.03868108, -0.9124535, -1.950012, 1, 1, 1, 1, 1,
-0.03698133, -1.419517, -2.206352, 1, 1, 1, 1, 1,
-0.03489762, 0.9421955, -0.2863109, 1, 1, 1, 1, 1,
-0.03480297, 0.06779943, -1.596925, 1, 1, 1, 1, 1,
-0.03244195, -0.09539548, -1.118865, 1, 1, 1, 1, 1,
-0.03184429, -0.6819747, -2.148071, 1, 1, 1, 1, 1,
-0.0287473, 0.3294766, -0.6327106, 1, 1, 1, 1, 1,
-0.02063326, 0.0005293803, -0.3713493, 1, 1, 1, 1, 1,
-0.01968978, 0.8880963, 0.1777761, 1, 1, 1, 1, 1,
-0.01823188, 1.113504, -0.001877714, 1, 1, 1, 1, 1,
-0.01362139, 0.2418691, 0.697971, 1, 1, 1, 1, 1,
-0.01329963, -0.1357177, -3.884492, 0, 0, 1, 1, 1,
-0.01015731, -0.4978341, -3.205488, 1, 0, 0, 1, 1,
-0.008905826, 0.7015758, 0.5109012, 1, 0, 0, 1, 1,
-0.006014424, 0.160287, -0.2793792, 1, 0, 0, 1, 1,
0.0001518477, -1.430585, 4.080412, 1, 0, 0, 1, 1,
0.001884735, -1.017737, 2.838896, 1, 0, 0, 1, 1,
0.01274287, 1.208925, -2.437335, 0, 0, 0, 1, 1,
0.0185315, 0.4193039, 0.2307724, 0, 0, 0, 1, 1,
0.01878434, -0.9828911, 1.219078, 0, 0, 0, 1, 1,
0.01992007, 0.4779637, 0.2724797, 0, 0, 0, 1, 1,
0.02433152, -0.2571488, 3.523781, 0, 0, 0, 1, 1,
0.02498448, -0.4481351, 2.579274, 0, 0, 0, 1, 1,
0.0263118, -0.2945313, 2.441575, 0, 0, 0, 1, 1,
0.02966631, -0.6177198, 0.9943435, 1, 1, 1, 1, 1,
0.03392021, -0.3832282, 0.4120981, 1, 1, 1, 1, 1,
0.03445691, -1.891923, 3.053766, 1, 1, 1, 1, 1,
0.03814195, -1.378103, 1.103287, 1, 1, 1, 1, 1,
0.03819161, -0.363083, 0.6406327, 1, 1, 1, 1, 1,
0.04013584, -1.200203, 1.297191, 1, 1, 1, 1, 1,
0.04153776, -1.415147, 4.109043, 1, 1, 1, 1, 1,
0.04326427, 0.321384, -0.1438845, 1, 1, 1, 1, 1,
0.04585827, 0.05934385, 0.3118345, 1, 1, 1, 1, 1,
0.04603457, -1.324719, 3.583047, 1, 1, 1, 1, 1,
0.04928724, 0.3776611, 0.9744481, 1, 1, 1, 1, 1,
0.05800987, 0.1496209, 1.412848, 1, 1, 1, 1, 1,
0.05907806, 1.632375, -0.1700167, 1, 1, 1, 1, 1,
0.05928159, 0.4816431, -1.047666, 1, 1, 1, 1, 1,
0.0598377, -0.662881, 3.052708, 1, 1, 1, 1, 1,
0.06000312, 0.02208312, 0.6256177, 0, 0, 1, 1, 1,
0.06416767, -2.627735, 3.915107, 1, 0, 0, 1, 1,
0.06525241, -1.566054, 3.565946, 1, 0, 0, 1, 1,
0.06743296, -0.5331933, 2.227388, 1, 0, 0, 1, 1,
0.06864446, -0.05332236, 0.3757451, 1, 0, 0, 1, 1,
0.07061553, 0.8237464, 0.2453345, 1, 0, 0, 1, 1,
0.07254013, 1.469416, -0.1843025, 0, 0, 0, 1, 1,
0.07341284, 0.2768474, 0.002838532, 0, 0, 0, 1, 1,
0.07394838, 0.6543389, -1.068092, 0, 0, 0, 1, 1,
0.07423618, -0.05507692, 1.569934, 0, 0, 0, 1, 1,
0.07832091, -0.5351231, 2.523002, 0, 0, 0, 1, 1,
0.0842132, 2.018307, 0.4294935, 0, 0, 0, 1, 1,
0.08537425, 0.1924204, -0.5247195, 0, 0, 0, 1, 1,
0.08547522, 1.042111, 1.494072, 1, 1, 1, 1, 1,
0.08673474, 0.5989939, 0.1344992, 1, 1, 1, 1, 1,
0.08681154, -0.4338753, 1.692174, 1, 1, 1, 1, 1,
0.09120966, 0.1040645, -0.05024986, 1, 1, 1, 1, 1,
0.0928532, 0.9520507, -0.06525206, 1, 1, 1, 1, 1,
0.09389838, 0.8663788, -0.7910725, 1, 1, 1, 1, 1,
0.0954845, -1.197657, 2.116935, 1, 1, 1, 1, 1,
0.1018883, -0.4613626, 1.922509, 1, 1, 1, 1, 1,
0.1055963, 1.046005, 1.048279, 1, 1, 1, 1, 1,
0.1088312, -0.2984222, 3.586115, 1, 1, 1, 1, 1,
0.1130584, -0.1963359, 3.018116, 1, 1, 1, 1, 1,
0.1153776, -0.1539341, 1.658864, 1, 1, 1, 1, 1,
0.115711, 0.8511497, 0.9410915, 1, 1, 1, 1, 1,
0.1198133, -0.9364203, 4.721616, 1, 1, 1, 1, 1,
0.1200078, -0.6822742, 3.477169, 1, 1, 1, 1, 1,
0.1262724, 0.7454349, -0.5220849, 0, 0, 1, 1, 1,
0.1273373, 0.8317567, 0.7675889, 1, 0, 0, 1, 1,
0.1329105, -0.7392722, 2.28239, 1, 0, 0, 1, 1,
0.1363963, -0.6965073, 3.764495, 1, 0, 0, 1, 1,
0.1371749, 2.144396, -1.077671, 1, 0, 0, 1, 1,
0.1378941, -1.033411, 3.552297, 1, 0, 0, 1, 1,
0.1384788, 0.32127, -1.447581, 0, 0, 0, 1, 1,
0.1399755, -0.2450259, 1.891663, 0, 0, 0, 1, 1,
0.1447455, 0.8035806, -0.3064334, 0, 0, 0, 1, 1,
0.1489203, 1.135557, 0.5822196, 0, 0, 0, 1, 1,
0.1499309, -0.2896323, 5.012794, 0, 0, 0, 1, 1,
0.1534907, 0.6100145, 0.3766972, 0, 0, 0, 1, 1,
0.1598232, -0.3065608, 1.093755, 0, 0, 0, 1, 1,
0.1660648, -0.3564413, 1.935632, 1, 1, 1, 1, 1,
0.1661124, -0.5495994, 0.9241349, 1, 1, 1, 1, 1,
0.1675268, 0.103063, -0.9389473, 1, 1, 1, 1, 1,
0.1688677, -2.111157, 2.429539, 1, 1, 1, 1, 1,
0.1694795, 1.439556, 0.6397303, 1, 1, 1, 1, 1,
0.1730954, -1.680113, 1.851441, 1, 1, 1, 1, 1,
0.1780373, 1.591859, -1.163644, 1, 1, 1, 1, 1,
0.1800029, 0.636509, 1.83287, 1, 1, 1, 1, 1,
0.1802112, 1.574054, 1.738199, 1, 1, 1, 1, 1,
0.1835602, -1.864671, 1.510163, 1, 1, 1, 1, 1,
0.1944159, -0.7739629, 2.871265, 1, 1, 1, 1, 1,
0.1960802, 2.760626, 0.4755536, 1, 1, 1, 1, 1,
0.2000317, -0.5037909, 0.7046288, 1, 1, 1, 1, 1,
0.2033444, -0.3796171, 1.64426, 1, 1, 1, 1, 1,
0.20687, -0.2781963, 2.316741, 1, 1, 1, 1, 1,
0.2093586, -0.2635887, 3.048958, 0, 0, 1, 1, 1,
0.2133507, -0.8034436, 3.824378, 1, 0, 0, 1, 1,
0.2143203, 1.324338, 1.947707, 1, 0, 0, 1, 1,
0.2180796, 0.9907293, 1.364549, 1, 0, 0, 1, 1,
0.2198304, -0.09576742, 3.957401, 1, 0, 0, 1, 1,
0.2211372, 0.04766898, 3.041916, 1, 0, 0, 1, 1,
0.221256, -0.6250567, 3.23186, 0, 0, 0, 1, 1,
0.2233239, -0.006923418, 2.927181, 0, 0, 0, 1, 1,
0.223429, -0.456649, 4.130802, 0, 0, 0, 1, 1,
0.2241282, 0.07958306, -0.3619182, 0, 0, 0, 1, 1,
0.227161, 0.1760874, -0.8103109, 0, 0, 0, 1, 1,
0.2282395, 1.638642, -0.2452955, 0, 0, 0, 1, 1,
0.2300246, -0.2437503, 2.891439, 0, 0, 0, 1, 1,
0.2348815, -0.6563728, 4.895544, 1, 1, 1, 1, 1,
0.2361954, 0.5140693, 0.4231621, 1, 1, 1, 1, 1,
0.2369073, 2.103063, -0.2104677, 1, 1, 1, 1, 1,
0.2390329, -0.3450426, 2.785213, 1, 1, 1, 1, 1,
0.2452426, -0.2669176, 1.772032, 1, 1, 1, 1, 1,
0.2469646, -0.5242912, 2.437483, 1, 1, 1, 1, 1,
0.2487275, 0.4611738, 1.269172, 1, 1, 1, 1, 1,
0.2506778, 0.3586895, 0.8503757, 1, 1, 1, 1, 1,
0.2579124, 0.8412119, -0.1413009, 1, 1, 1, 1, 1,
0.2685494, -0.4523159, 2.915921, 1, 1, 1, 1, 1,
0.2686845, -1.364393, 1.973844, 1, 1, 1, 1, 1,
0.2704604, 0.3705188, 1.286568, 1, 1, 1, 1, 1,
0.2726769, 0.8643952, -1.1252, 1, 1, 1, 1, 1,
0.2735369, -0.2234024, 2.001108, 1, 1, 1, 1, 1,
0.2740242, -0.144289, 1.716539, 1, 1, 1, 1, 1,
0.2789261, 0.5810195, 1.949927, 0, 0, 1, 1, 1,
0.2796926, -0.3567702, 3.11784, 1, 0, 0, 1, 1,
0.2859834, -0.7976505, 3.084671, 1, 0, 0, 1, 1,
0.294389, 1.426868, 0.870028, 1, 0, 0, 1, 1,
0.3047689, 0.04335655, 4.359334, 1, 0, 0, 1, 1,
0.307324, -0.7465706, 3.610194, 1, 0, 0, 1, 1,
0.31407, 0.110121, 2.402516, 0, 0, 0, 1, 1,
0.3201838, 0.2494184, 0.5182776, 0, 0, 0, 1, 1,
0.3203985, -1.587179, 3.073978, 0, 0, 0, 1, 1,
0.3222796, -0.3018141, 4.353762, 0, 0, 0, 1, 1,
0.322955, 1.877782, 0.2220386, 0, 0, 0, 1, 1,
0.3231816, -0.1367707, 3.176774, 0, 0, 0, 1, 1,
0.3235922, 1.197329, -0.01303242, 0, 0, 0, 1, 1,
0.3238536, 1.030889, 0.6709617, 1, 1, 1, 1, 1,
0.3242462, -1.906553, 4.796095, 1, 1, 1, 1, 1,
0.3251531, -0.4296347, 1.825485, 1, 1, 1, 1, 1,
0.3307632, -1.847413, 3.688677, 1, 1, 1, 1, 1,
0.3309354, -0.1895153, -0.7245415, 1, 1, 1, 1, 1,
0.334414, 0.1345751, 2.537363, 1, 1, 1, 1, 1,
0.3352279, -0.5389142, 2.741335, 1, 1, 1, 1, 1,
0.3374352, -0.686785, 3.038105, 1, 1, 1, 1, 1,
0.3385488, -1.939413, 2.592186, 1, 1, 1, 1, 1,
0.3387563, 0.5614968, 0.9565053, 1, 1, 1, 1, 1,
0.3431974, -0.1194702, 1.540842, 1, 1, 1, 1, 1,
0.3449107, 0.3231947, 0.7722617, 1, 1, 1, 1, 1,
0.3460249, -0.1035052, 4.445976, 1, 1, 1, 1, 1,
0.3508245, 1.077858, -0.3520238, 1, 1, 1, 1, 1,
0.3508993, 0.497072, -0.06041145, 1, 1, 1, 1, 1,
0.3529275, 0.5292379, 0.950016, 0, 0, 1, 1, 1,
0.3635769, -0.4576321, 2.467602, 1, 0, 0, 1, 1,
0.3655401, 0.6569406, -0.3735225, 1, 0, 0, 1, 1,
0.3661812, -0.8555721, 4.340011, 1, 0, 0, 1, 1,
0.3669809, 0.2705743, 1.078945, 1, 0, 0, 1, 1,
0.3676214, 0.4397305, 0.1916862, 1, 0, 0, 1, 1,
0.3699726, 0.4710622, 1.033339, 0, 0, 0, 1, 1,
0.3702959, -0.8099785, 3.001379, 0, 0, 0, 1, 1,
0.3754596, 0.2838751, 0.8470873, 0, 0, 0, 1, 1,
0.3792858, -0.2832781, 1.190831, 0, 0, 0, 1, 1,
0.3794158, 1.362085, 1.866222, 0, 0, 0, 1, 1,
0.3871328, 0.4257605, -0.8488964, 0, 0, 0, 1, 1,
0.396673, 2.31479, 0.4663751, 0, 0, 0, 1, 1,
0.3985399, 0.8083284, 2.273921, 1, 1, 1, 1, 1,
0.404557, 0.2464513, 0.8189642, 1, 1, 1, 1, 1,
0.4092872, -0.1695909, 1.609908, 1, 1, 1, 1, 1,
0.4118366, -0.1982908, 1.033989, 1, 1, 1, 1, 1,
0.415609, 0.5273557, 1.996251, 1, 1, 1, 1, 1,
0.4160358, 1.071542, 0.5465524, 1, 1, 1, 1, 1,
0.4186113, 1.04583, 1.903327, 1, 1, 1, 1, 1,
0.4231156, -0.9739344, 2.284417, 1, 1, 1, 1, 1,
0.4270524, -1.466227, 0.8855501, 1, 1, 1, 1, 1,
0.4368185, -1.343608, 3.134802, 1, 1, 1, 1, 1,
0.4402646, -0.406175, 0.740562, 1, 1, 1, 1, 1,
0.4407518, 1.230577, 1.068582, 1, 1, 1, 1, 1,
0.4539159, -0.8997058, 2.309708, 1, 1, 1, 1, 1,
0.4545224, 2.702232, -0.09837537, 1, 1, 1, 1, 1,
0.4549622, -1.358112, 3.336249, 1, 1, 1, 1, 1,
0.4617815, 0.08535588, 2.532491, 0, 0, 1, 1, 1,
0.4635653, -0.5957891, 2.772904, 1, 0, 0, 1, 1,
0.4662164, -0.1394227, -0.6700632, 1, 0, 0, 1, 1,
0.4683419, -0.223714, 2.860515, 1, 0, 0, 1, 1,
0.4704317, 0.4726315, -0.4817095, 1, 0, 0, 1, 1,
0.4705949, 0.08909746, 0.2833259, 1, 0, 0, 1, 1,
0.4710635, -1.444048, 2.582891, 0, 0, 0, 1, 1,
0.4718387, 0.1210787, 1.018952, 0, 0, 0, 1, 1,
0.4724247, -0.9385279, 4.635875, 0, 0, 0, 1, 1,
0.4735627, 1.070413, 0.04004462, 0, 0, 0, 1, 1,
0.4749286, -0.866619, 1.419533, 0, 0, 0, 1, 1,
0.4765866, -0.6491203, 0.7665633, 0, 0, 0, 1, 1,
0.4766392, -1.004643, 1.508662, 0, 0, 0, 1, 1,
0.4770657, -0.07130872, 0.7423843, 1, 1, 1, 1, 1,
0.4785063, -0.08390129, 2.565564, 1, 1, 1, 1, 1,
0.4803836, -3.214839, 3.361973, 1, 1, 1, 1, 1,
0.4851066, 0.09690279, 3.516129, 1, 1, 1, 1, 1,
0.4854621, 1.211182, 0.3091756, 1, 1, 1, 1, 1,
0.4858246, -0.6238523, 3.132919, 1, 1, 1, 1, 1,
0.4902222, -0.06664303, 1.095168, 1, 1, 1, 1, 1,
0.4911441, 0.1883077, -0.1649119, 1, 1, 1, 1, 1,
0.4987838, 1.46864, 0.8205343, 1, 1, 1, 1, 1,
0.5010885, -0.182062, -0.1289619, 1, 1, 1, 1, 1,
0.5045987, 1.066126, 0.08805249, 1, 1, 1, 1, 1,
0.506748, -0.1126649, 1.77849, 1, 1, 1, 1, 1,
0.5076418, -0.183679, 2.217602, 1, 1, 1, 1, 1,
0.5076565, -1.058766, 3.807288, 1, 1, 1, 1, 1,
0.5113469, 1.374189, -1.591856, 1, 1, 1, 1, 1,
0.5114653, -1.876385, 4.936853, 0, 0, 1, 1, 1,
0.5123263, -0.5123742, 1.727909, 1, 0, 0, 1, 1,
0.5153461, -1.375449, 2.94636, 1, 0, 0, 1, 1,
0.520232, 0.01281107, 0.2793027, 1, 0, 0, 1, 1,
0.5230719, 1.994217, 0.5757955, 1, 0, 0, 1, 1,
0.5242996, -1.35041, 4.521459, 1, 0, 0, 1, 1,
0.5301697, -1.273748, 4.090809, 0, 0, 0, 1, 1,
0.535473, 0.6897652, 0.8764532, 0, 0, 0, 1, 1,
0.5378076, 0.2888648, 0.4675697, 0, 0, 0, 1, 1,
0.5388879, 0.1537941, 2.388535, 0, 0, 0, 1, 1,
0.5415315, 1.35896, 1.881121, 0, 0, 0, 1, 1,
0.5481316, 0.5258604, 0.6675205, 0, 0, 0, 1, 1,
0.5499433, 0.4378907, 1.227763, 0, 0, 0, 1, 1,
0.5537224, -0.7819762, 2.750959, 1, 1, 1, 1, 1,
0.5645826, 0.0213892, 3.00582, 1, 1, 1, 1, 1,
0.565683, 0.4458306, 0.6446053, 1, 1, 1, 1, 1,
0.5657915, -1.167617, 3.657026, 1, 1, 1, 1, 1,
0.5665625, -1.148658, 3.018846, 1, 1, 1, 1, 1,
0.5705113, 0.4341499, 2.212533, 1, 1, 1, 1, 1,
0.5729064, 0.5345872, 0.8130476, 1, 1, 1, 1, 1,
0.5750379, -0.7972872, 2.754298, 1, 1, 1, 1, 1,
0.5827548, 0.4024021, 0.6124616, 1, 1, 1, 1, 1,
0.5847924, 0.6267537, 1.165403, 1, 1, 1, 1, 1,
0.6025205, 0.1760114, 0.1798815, 1, 1, 1, 1, 1,
0.6027681, -0.9638085, 1.867291, 1, 1, 1, 1, 1,
0.604515, 2.099844, 3.530432, 1, 1, 1, 1, 1,
0.6222842, -1.53911, 2.451653, 1, 1, 1, 1, 1,
0.6224412, -0.03237966, 2.685413, 1, 1, 1, 1, 1,
0.6305481, -1.066489, 1.392264, 0, 0, 1, 1, 1,
0.6415249, -0.9816617, 4.053964, 1, 0, 0, 1, 1,
0.6449293, -1.31933, 2.307498, 1, 0, 0, 1, 1,
0.6459237, -2.083074, 2.000172, 1, 0, 0, 1, 1,
0.6461455, 1.20922, -0.2633707, 1, 0, 0, 1, 1,
0.646846, 0.6919209, 0.6579905, 1, 0, 0, 1, 1,
0.6594927, 1.67817, 0.5186186, 0, 0, 0, 1, 1,
0.6608123, 0.4425909, 2.268606, 0, 0, 0, 1, 1,
0.6649214, -0.4077889, 1.139853, 0, 0, 0, 1, 1,
0.6725425, 1.133975, 0.7222024, 0, 0, 0, 1, 1,
0.6734474, 0.8371921, 0.6287749, 0, 0, 0, 1, 1,
0.6735979, 1.858972, 1.652643, 0, 0, 0, 1, 1,
0.6754684, 0.2256888, 0.8161657, 0, 0, 0, 1, 1,
0.6765078, 0.7371664, 1.268715, 1, 1, 1, 1, 1,
0.677265, 0.4669712, 2.746787, 1, 1, 1, 1, 1,
0.6840708, -1.43899, 2.493718, 1, 1, 1, 1, 1,
0.6932509, 1.386883, -0.2007216, 1, 1, 1, 1, 1,
0.697633, -1.372878, 5.186485, 1, 1, 1, 1, 1,
0.6992669, -1.797261, 3.73812, 1, 1, 1, 1, 1,
0.7006958, 1.550353, -0.3685561, 1, 1, 1, 1, 1,
0.7009231, 0.645662, 1.72067, 1, 1, 1, 1, 1,
0.7022513, -2.102317, 3.161878, 1, 1, 1, 1, 1,
0.7023367, 0.796567, -0.01473251, 1, 1, 1, 1, 1,
0.7056106, 0.8252128, 0.9934962, 1, 1, 1, 1, 1,
0.7112283, -1.376964, 2.705036, 1, 1, 1, 1, 1,
0.7200677, 1.801875, -0.5399061, 1, 1, 1, 1, 1,
0.7212475, -1.053262, 2.567598, 1, 1, 1, 1, 1,
0.7252014, -0.281265, 3.324575, 1, 1, 1, 1, 1,
0.7264043, -1.349658, 1.414119, 0, 0, 1, 1, 1,
0.7379745, -0.007339898, 3.014678, 1, 0, 0, 1, 1,
0.7405964, 0.4082019, 2.624392, 1, 0, 0, 1, 1,
0.7415479, 0.05524079, 2.980075, 1, 0, 0, 1, 1,
0.7452552, -0.4376997, 1.356025, 1, 0, 0, 1, 1,
0.7594405, 1.546681, 0.02650601, 1, 0, 0, 1, 1,
0.7604755, -1.630725, 1.37929, 0, 0, 0, 1, 1,
0.7627658, -0.8452094, 1.71594, 0, 0, 0, 1, 1,
0.7660018, -1.613263, 1.450686, 0, 0, 0, 1, 1,
0.7694484, -0.2036093, 3.80008, 0, 0, 0, 1, 1,
0.7716416, -1.766853, 2.843524, 0, 0, 0, 1, 1,
0.7721732, -0.3218638, 1.243121, 0, 0, 0, 1, 1,
0.7806494, 1.127036, 1.487218, 0, 0, 0, 1, 1,
0.7818184, 1.413903, 0.1829488, 1, 1, 1, 1, 1,
0.7826045, -2.310165, 1.184337, 1, 1, 1, 1, 1,
0.7839459, 1.518054, 0.7805361, 1, 1, 1, 1, 1,
0.7859572, 0.2674953, 1.065215, 1, 1, 1, 1, 1,
0.7892391, 1.093922, 0.7587882, 1, 1, 1, 1, 1,
0.7950329, -0.4506054, 1.959643, 1, 1, 1, 1, 1,
0.7960278, -0.879043, 1.839011, 1, 1, 1, 1, 1,
0.7992473, 0.527715, 0.2817007, 1, 1, 1, 1, 1,
0.7995988, -0.5914917, 1.400787, 1, 1, 1, 1, 1,
0.8024559, -0.7738667, 2.186176, 1, 1, 1, 1, 1,
0.8039426, 0.4311804, -0.6262131, 1, 1, 1, 1, 1,
0.8042694, 0.5189097, 0.9129213, 1, 1, 1, 1, 1,
0.8075362, -0.1896001, 0.9499851, 1, 1, 1, 1, 1,
0.8092609, 0.5602215, 1.722981, 1, 1, 1, 1, 1,
0.8114414, -0.5331985, 1.066188, 1, 1, 1, 1, 1,
0.8139599, 1.017537, 1.159604, 0, 0, 1, 1, 1,
0.8185731, 1.678705, -2.023704, 1, 0, 0, 1, 1,
0.8379586, 0.0005093885, 2.155762, 1, 0, 0, 1, 1,
0.8425759, 1.268654, 0.4582229, 1, 0, 0, 1, 1,
0.8486215, -0.2766734, 1.123795, 1, 0, 0, 1, 1,
0.8503224, 0.1516752, 0.7244177, 1, 0, 0, 1, 1,
0.8517839, -1.718725, 2.102407, 0, 0, 0, 1, 1,
0.8554002, 0.05836384, 0.6922409, 0, 0, 0, 1, 1,
0.8555211, 1.130443, 0.8808538, 0, 0, 0, 1, 1,
0.8558531, -1.212513, 3.045187, 0, 0, 0, 1, 1,
0.8599604, -0.4777808, 1.871222, 0, 0, 0, 1, 1,
0.8766266, 1.639685, 0.1135875, 0, 0, 0, 1, 1,
0.8816761, 0.5325937, 0.7281106, 0, 0, 0, 1, 1,
0.8834834, -0.8298921, 2.460792, 1, 1, 1, 1, 1,
0.9091434, 0.02820357, 1.411211, 1, 1, 1, 1, 1,
0.9116408, -1.226609, 2.935827, 1, 1, 1, 1, 1,
0.9128044, 0.1236308, 3.160023, 1, 1, 1, 1, 1,
0.9131951, -1.202363, 5.564622, 1, 1, 1, 1, 1,
0.9139681, 0.5451663, 1.821362, 1, 1, 1, 1, 1,
0.9171923, -2.785962, 2.029521, 1, 1, 1, 1, 1,
0.9188331, 0.09388071, 0.5195584, 1, 1, 1, 1, 1,
0.9204069, -1.310204, 3.209711, 1, 1, 1, 1, 1,
0.9221321, -1.116934, 1.502531, 1, 1, 1, 1, 1,
0.9236153, -0.006173254, 2.414237, 1, 1, 1, 1, 1,
0.9281173, -0.6892653, 1.090415, 1, 1, 1, 1, 1,
0.9281744, -1.682985, 3.700358, 1, 1, 1, 1, 1,
0.930418, -0.4928859, 2.912735, 1, 1, 1, 1, 1,
0.9354897, 1.418071, 2.638998, 1, 1, 1, 1, 1,
0.9398741, 0.2330463, 1.826657, 0, 0, 1, 1, 1,
0.9398919, 1.20044, -0.001946839, 1, 0, 0, 1, 1,
0.949346, 1.42198, 0.6693791, 1, 0, 0, 1, 1,
0.9500633, -1.040535, 1.897601, 1, 0, 0, 1, 1,
0.9508344, 0.6031058, 2.159746, 1, 0, 0, 1, 1,
0.9525726, 0.001472401, 1.619303, 1, 0, 0, 1, 1,
0.9629467, 0.2995009, 1.286628, 0, 0, 0, 1, 1,
0.9631041, -0.2030471, 3.276515, 0, 0, 0, 1, 1,
0.9648906, 0.06963578, 2.166445, 0, 0, 0, 1, 1,
0.9668154, 1.029154, 3.132616, 0, 0, 0, 1, 1,
0.9858147, -0.2134538, 1.3947, 0, 0, 0, 1, 1,
0.9875311, -0.06293031, 0.6210672, 0, 0, 0, 1, 1,
0.9955766, -0.3778361, 3.805719, 0, 0, 0, 1, 1,
1.001908, -0.9966938, 3.153846, 1, 1, 1, 1, 1,
1.008326, -0.2860982, 1.432788, 1, 1, 1, 1, 1,
1.012031, -0.465484, 1.430508, 1, 1, 1, 1, 1,
1.016552, -0.614058, 1.643375, 1, 1, 1, 1, 1,
1.019109, -0.8861156, 3.98201, 1, 1, 1, 1, 1,
1.020187, -1.149119, 1.828914, 1, 1, 1, 1, 1,
1.020707, -0.4945858, 1.671135, 1, 1, 1, 1, 1,
1.02508, 0.2657062, 0.5883934, 1, 1, 1, 1, 1,
1.039384, 0.2868372, -0.1173785, 1, 1, 1, 1, 1,
1.039414, 1.943241, 0.1640749, 1, 1, 1, 1, 1,
1.041375, 0.833578, 0.3256175, 1, 1, 1, 1, 1,
1.054474, -0.3645551, 0.8285251, 1, 1, 1, 1, 1,
1.05776, -1.089976, 2.318918, 1, 1, 1, 1, 1,
1.058261, -0.437047, 1.051159, 1, 1, 1, 1, 1,
1.062561, 0.4369821, 1.387522, 1, 1, 1, 1, 1,
1.070349, -1.025746, 2.515445, 0, 0, 1, 1, 1,
1.071686, -2.30809, 2.204849, 1, 0, 0, 1, 1,
1.076594, 0.6597474, 0.04753091, 1, 0, 0, 1, 1,
1.079931, 0.3228094, 1.508057, 1, 0, 0, 1, 1,
1.085545, 1.717359, 0.2240153, 1, 0, 0, 1, 1,
1.08613, 1.110819, 0.8323187, 1, 0, 0, 1, 1,
1.087832, 0.5471106, 2.30757, 0, 0, 0, 1, 1,
1.092487, 2.749173, 1.774789, 0, 0, 0, 1, 1,
1.09678, -0.610756, 1.517821, 0, 0, 0, 1, 1,
1.10163, -2.190768, 3.481564, 0, 0, 0, 1, 1,
1.1052, 0.778065, -0.4835623, 0, 0, 0, 1, 1,
1.124293, -1.744968, 1.901398, 0, 0, 0, 1, 1,
1.128871, -0.5259036, 3.127826, 0, 0, 0, 1, 1,
1.13856, -1.372192, 2.822518, 1, 1, 1, 1, 1,
1.139313, 0.2510939, 0.5104507, 1, 1, 1, 1, 1,
1.149229, -2.759226, 1.583434, 1, 1, 1, 1, 1,
1.1515, 0.7183433, 1.416571, 1, 1, 1, 1, 1,
1.153568, 0.07379545, 1.954877, 1, 1, 1, 1, 1,
1.153808, -1.066197, 3.086464, 1, 1, 1, 1, 1,
1.154768, 1.015829, 0.1460065, 1, 1, 1, 1, 1,
1.155488, -1.232899, 3.08697, 1, 1, 1, 1, 1,
1.158972, -0.7653978, 3.423445, 1, 1, 1, 1, 1,
1.160202, 1.805249, 0.7396723, 1, 1, 1, 1, 1,
1.164096, -0.1089584, 2.589492, 1, 1, 1, 1, 1,
1.166479, 0.5552854, 0.5766753, 1, 1, 1, 1, 1,
1.168068, 0.3564727, 1.212233, 1, 1, 1, 1, 1,
1.171407, 1.698213, 1.270887, 1, 1, 1, 1, 1,
1.178545, 0.6086044, 2.458047, 1, 1, 1, 1, 1,
1.179257, -0.5214917, 1.414426, 0, 0, 1, 1, 1,
1.180587, -1.776349, 3.049664, 1, 0, 0, 1, 1,
1.186451, -1.322928, 2.544093, 1, 0, 0, 1, 1,
1.190804, -1.127414, 0.4973359, 1, 0, 0, 1, 1,
1.19879, -0.396655, 2.01476, 1, 0, 0, 1, 1,
1.200762, 0.2019343, 2.316695, 1, 0, 0, 1, 1,
1.202161, -0.3190472, 1.773241, 0, 0, 0, 1, 1,
1.203302, 0.30275, 1.935381, 0, 0, 0, 1, 1,
1.208629, 0.562871, 0.5543288, 0, 0, 0, 1, 1,
1.210789, 1.547677, 2.032741, 0, 0, 0, 1, 1,
1.212903, -0.1741606, 1.04265, 0, 0, 0, 1, 1,
1.214998, 0.4125296, 0.2822497, 0, 0, 0, 1, 1,
1.226785, 1.694816, -1.639641, 0, 0, 0, 1, 1,
1.231567, -0.1042939, -0.2678137, 1, 1, 1, 1, 1,
1.238443, 0.4286983, 0.8002625, 1, 1, 1, 1, 1,
1.238624, 0.5853444, 1.043335, 1, 1, 1, 1, 1,
1.242216, 0.6999894, 1.613681, 1, 1, 1, 1, 1,
1.244901, 0.4411557, 1.200112, 1, 1, 1, 1, 1,
1.254578, 0.7932103, 1.872856, 1, 1, 1, 1, 1,
1.260333, 0.3343416, 0.07798405, 1, 1, 1, 1, 1,
1.267276, -0.4653668, 1.548887, 1, 1, 1, 1, 1,
1.272627, -2.880535, 2.278087, 1, 1, 1, 1, 1,
1.273408, 1.901823, 0.8525078, 1, 1, 1, 1, 1,
1.282101, 1.039973, 0.3681872, 1, 1, 1, 1, 1,
1.286243, -1.645231, 1.59636, 1, 1, 1, 1, 1,
1.289294, 2.599974, 1.18543, 1, 1, 1, 1, 1,
1.293578, 1.57265, -0.3379515, 1, 1, 1, 1, 1,
1.30485, -0.9162296, 1.082503, 1, 1, 1, 1, 1,
1.308739, -0.2238987, 3.136215, 0, 0, 1, 1, 1,
1.310978, 1.072937, 0.1853832, 1, 0, 0, 1, 1,
1.319699, 0.3314858, -0.1751354, 1, 0, 0, 1, 1,
1.329893, -0.1183394, 0.9373236, 1, 0, 0, 1, 1,
1.332916, -2.623843, 2.764355, 1, 0, 0, 1, 1,
1.333505, 1.50297, 1.621814, 1, 0, 0, 1, 1,
1.346474, 0.2480696, 2.398242, 0, 0, 0, 1, 1,
1.353444, -0.7701903, 1.396947, 0, 0, 0, 1, 1,
1.366045, -0.5528517, 1.415132, 0, 0, 0, 1, 1,
1.367491, -0.4625947, 0.3490048, 0, 0, 0, 1, 1,
1.374975, 1.505062, 0.8469734, 0, 0, 0, 1, 1,
1.377317, 0.9756955, 2.741072, 0, 0, 0, 1, 1,
1.39858, 1.213207, 0.1820827, 0, 0, 0, 1, 1,
1.407984, -2.513137, 3.338393, 1, 1, 1, 1, 1,
1.416499, 1.165997, -0.8719493, 1, 1, 1, 1, 1,
1.419085, 0.5311205, 1.12675, 1, 1, 1, 1, 1,
1.421074, 0.4144942, 2.254584, 1, 1, 1, 1, 1,
1.421441, -0.07662618, 2.749433, 1, 1, 1, 1, 1,
1.424987, -0.7229235, 1.393746, 1, 1, 1, 1, 1,
1.429758, -1.643846, 2.195068, 1, 1, 1, 1, 1,
1.440937, 0.8688505, -0.2774855, 1, 1, 1, 1, 1,
1.446982, -0.8060271, 2.672336, 1, 1, 1, 1, 1,
1.449481, -0.7692795, 2.901651, 1, 1, 1, 1, 1,
1.45159, 0.007243343, 1.67178, 1, 1, 1, 1, 1,
1.456101, 1.372603, 1.986493, 1, 1, 1, 1, 1,
1.458367, 0.2521017, -1.453195, 1, 1, 1, 1, 1,
1.461527, 0.3030062, 1.183742, 1, 1, 1, 1, 1,
1.478242, -0.6874001, 0.676871, 1, 1, 1, 1, 1,
1.481478, -0.930691, 2.762887, 0, 0, 1, 1, 1,
1.484684, -2.578022, 3.395641, 1, 0, 0, 1, 1,
1.512247, 0.7681181, -0.2832062, 1, 0, 0, 1, 1,
1.52259, -0.7724167, 1.77483, 1, 0, 0, 1, 1,
1.52808, -0.2575794, 2.464949, 1, 0, 0, 1, 1,
1.542034, 0.6717937, 0.2856331, 1, 0, 0, 1, 1,
1.545489, -1.522227, 3.405532, 0, 0, 0, 1, 1,
1.563863, 0.3477873, 1.644804, 0, 0, 0, 1, 1,
1.575581, 0.9387745, 0.3688614, 0, 0, 0, 1, 1,
1.576713, 0.01709512, 3.029434, 0, 0, 0, 1, 1,
1.580353, -1.233208, 3.45385, 0, 0, 0, 1, 1,
1.603941, -0.216161, 0.3627557, 0, 0, 0, 1, 1,
1.609652, -0.7524571, 1.386328, 0, 0, 0, 1, 1,
1.613488, 1.12336, 0.986213, 1, 1, 1, 1, 1,
1.617887, 0.9026976, 0.9231408, 1, 1, 1, 1, 1,
1.62128, -1.189468, 2.173666, 1, 1, 1, 1, 1,
1.650973, -0.9831998, 2.538038, 1, 1, 1, 1, 1,
1.653346, 1.100745, 0.7164932, 1, 1, 1, 1, 1,
1.657488, -0.7922466, 3.213976, 1, 1, 1, 1, 1,
1.65872, 0.3622528, 0.2113446, 1, 1, 1, 1, 1,
1.687228, -1.011458, 1.470587, 1, 1, 1, 1, 1,
1.694172, 0.2409306, 0.1220183, 1, 1, 1, 1, 1,
1.701561, -0.3645245, 1.377555, 1, 1, 1, 1, 1,
1.712, 0.8896445, 0.889336, 1, 1, 1, 1, 1,
1.712097, -0.8152214, 1.61017, 1, 1, 1, 1, 1,
1.733345, 0.08665144, 0.6976833, 1, 1, 1, 1, 1,
1.734355, -1.116687, 3.601909, 1, 1, 1, 1, 1,
1.749644, 0.1011849, 3.26489, 1, 1, 1, 1, 1,
1.753688, -0.5878767, 1.416802, 0, 0, 1, 1, 1,
1.753724, -0.07378828, 2.561333, 1, 0, 0, 1, 1,
1.754069, 0.3546797, 2.268049, 1, 0, 0, 1, 1,
1.761402, 0.3745724, 0.6625339, 1, 0, 0, 1, 1,
1.766675, -0.1506359, 0.9056161, 1, 0, 0, 1, 1,
1.784119, 0.1850774, -0.86277, 1, 0, 0, 1, 1,
1.789115, 0.2409372, 3.746556, 0, 0, 0, 1, 1,
1.791909, -1.131106, 2.189335, 0, 0, 0, 1, 1,
1.792932, -0.02499523, 2.208742, 0, 0, 0, 1, 1,
1.797926, 1.475148, 2.927977, 0, 0, 0, 1, 1,
1.803099, 0.8639196, 1.833743, 0, 0, 0, 1, 1,
1.829402, 0.1440879, 1.328837, 0, 0, 0, 1, 1,
1.835344, -0.5918202, 1.447774, 0, 0, 0, 1, 1,
1.83903, 1.345601, 0.5838477, 1, 1, 1, 1, 1,
1.866889, -0.438592, 1.12607, 1, 1, 1, 1, 1,
1.889611, 0.3483053, 0.8488371, 1, 1, 1, 1, 1,
1.903544, 0.7233313, 0.3685735, 1, 1, 1, 1, 1,
1.908854, -1.010195, 2.720597, 1, 1, 1, 1, 1,
1.941148, 1.016218, 2.194899, 1, 1, 1, 1, 1,
1.950413, 1.167534, -0.9692701, 1, 1, 1, 1, 1,
1.970214, 1.487082, -0.9035124, 1, 1, 1, 1, 1,
1.978356, -0.3992746, 2.414922, 1, 1, 1, 1, 1,
1.984027, -0.4516704, 2.357679, 1, 1, 1, 1, 1,
1.985878, -1.201221, 1.758982, 1, 1, 1, 1, 1,
2.013421, -1.415148, 2.750556, 1, 1, 1, 1, 1,
2.024115, -0.6689421, 2.221062, 1, 1, 1, 1, 1,
2.032459, 1.390285, 2.058532, 1, 1, 1, 1, 1,
2.043918, -1.765949, 0.9635065, 1, 1, 1, 1, 1,
2.082624, -0.2696788, 0.2047307, 0, 0, 1, 1, 1,
2.089434, 0.8205885, 2.351141, 1, 0, 0, 1, 1,
2.116535, -1.080913, 2.704689, 1, 0, 0, 1, 1,
2.119379, -0.5886828, 2.989594, 1, 0, 0, 1, 1,
2.137598, -1.53816, 3.33479, 1, 0, 0, 1, 1,
2.154404, 0.03844056, 1.109287, 1, 0, 0, 1, 1,
2.29903, -1.745325, 3.192494, 0, 0, 0, 1, 1,
2.334387, -1.201893, 3.414803, 0, 0, 0, 1, 1,
2.385623, 0.04488253, -0.07634445, 0, 0, 0, 1, 1,
2.392548, -0.227532, 1.488867, 0, 0, 0, 1, 1,
2.397755, -0.00509072, 2.179433, 0, 0, 0, 1, 1,
2.404262, 2.01667, -0.1427605, 0, 0, 0, 1, 1,
2.422256, 2.316089, 2.090159, 0, 0, 0, 1, 1,
2.458549, -1.709545, 2.475082, 1, 1, 1, 1, 1,
2.490171, -1.473976, 0.3876129, 1, 1, 1, 1, 1,
2.550278, 1.086239, -0.02696694, 1, 1, 1, 1, 1,
2.56718, -1.2528, 0.04110403, 1, 1, 1, 1, 1,
2.623241, -0.2510109, 2.957828, 1, 1, 1, 1, 1,
2.693762, 1.170441, 4.021546, 1, 1, 1, 1, 1,
2.702384, 0.1143191, 2.149788, 1, 1, 1, 1, 1
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
var radius = 9.183729;
var distance = 32.25746;
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
mvMatrix.translate( 0.07533872, 0.1509433, -0.326292 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.25746);
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