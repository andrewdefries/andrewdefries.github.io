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
-3.566572, -0.001234747, -1.635879, 1, 0, 0, 1,
-3.342725, 0.774423, -0.6944882, 1, 0.007843138, 0, 1,
-3.017797, -0.8055349, -1.408929, 1, 0.01176471, 0, 1,
-2.889808, 1.100442, -1.832994, 1, 0.01960784, 0, 1,
-2.766089, 0.882623, -2.069432, 1, 0.02352941, 0, 1,
-2.741354, -0.5378539, -0.741218, 1, 0.03137255, 0, 1,
-2.536032, -0.2844333, -1.577874, 1, 0.03529412, 0, 1,
-2.51975, -1.347132, -2.013137, 1, 0.04313726, 0, 1,
-2.466044, 0.3082517, -0.5714831, 1, 0.04705882, 0, 1,
-2.449852, -1.461498, -1.259454, 1, 0.05490196, 0, 1,
-2.354346, 1.228335, -1.030364, 1, 0.05882353, 0, 1,
-2.339697, -0.2519484, -2.854439, 1, 0.06666667, 0, 1,
-2.327363, 0.6574282, -1.095557, 1, 0.07058824, 0, 1,
-2.316637, 0.1645919, -0.1029552, 1, 0.07843138, 0, 1,
-2.246619, 0.9881298, -1.006065, 1, 0.08235294, 0, 1,
-2.181551, -0.5807304, -0.9521731, 1, 0.09019608, 0, 1,
-2.166436, -1.069825, -1.658555, 1, 0.09411765, 0, 1,
-2.14677, -0.9777194, -1.444368, 1, 0.1019608, 0, 1,
-2.132643, -1.620309, -2.298141, 1, 0.1098039, 0, 1,
-2.117045, -0.6269888, -1.969241, 1, 0.1137255, 0, 1,
-2.10894, 0.8649342, 0.01383994, 1, 0.1215686, 0, 1,
-2.098381, 0.08300481, -1.704629, 1, 0.1254902, 0, 1,
-2.091943, -0.5473524, -2.173326, 1, 0.1333333, 0, 1,
-2.081966, -0.8066142, -1.829346, 1, 0.1372549, 0, 1,
-2.078433, 0.615079, -1.226403, 1, 0.145098, 0, 1,
-2.057491, -0.655596, -3.174149, 1, 0.1490196, 0, 1,
-2.016005, 0.3589186, -1.272198, 1, 0.1568628, 0, 1,
-2.009093, 1.905943, -0.8209991, 1, 0.1607843, 0, 1,
-1.96259, -0.8890756, -1.413227, 1, 0.1686275, 0, 1,
-1.961022, -1.412076, -0.7081529, 1, 0.172549, 0, 1,
-1.931356, 0.6063138, -2.044704, 1, 0.1803922, 0, 1,
-1.901609, -0.2548865, -1.70027, 1, 0.1843137, 0, 1,
-1.895413, -0.8429868, -3.768273, 1, 0.1921569, 0, 1,
-1.871795, 1.506498, 0.6613247, 1, 0.1960784, 0, 1,
-1.836297, -0.5037152, -1.727197, 1, 0.2039216, 0, 1,
-1.834459, -1.269813, -2.371536, 1, 0.2117647, 0, 1,
-1.828939, 0.8242767, -0.1807579, 1, 0.2156863, 0, 1,
-1.816488, 0.2292637, -3.085399, 1, 0.2235294, 0, 1,
-1.815296, 1.306834, -0.7688177, 1, 0.227451, 0, 1,
-1.814576, -0.2005652, -1.606348, 1, 0.2352941, 0, 1,
-1.772857, -0.1702018, -1.70392, 1, 0.2392157, 0, 1,
-1.75742, -0.2112166, -1.906634, 1, 0.2470588, 0, 1,
-1.75044, -0.8300998, -0.4929679, 1, 0.2509804, 0, 1,
-1.738432, 1.081854, -1.051845, 1, 0.2588235, 0, 1,
-1.718962, -0.8704853, -4.321008, 1, 0.2627451, 0, 1,
-1.698114, 0.7133621, -2.369679, 1, 0.2705882, 0, 1,
-1.692585, -1.379123, -3.407669, 1, 0.2745098, 0, 1,
-1.68618, -0.2619754, -2.124045, 1, 0.282353, 0, 1,
-1.660273, -0.4148761, -2.604031, 1, 0.2862745, 0, 1,
-1.65093, -1.280079, -2.389382, 1, 0.2941177, 0, 1,
-1.644641, 1.349124, -2.323942, 1, 0.3019608, 0, 1,
-1.642038, -0.6862503, -1.152903, 1, 0.3058824, 0, 1,
-1.639357, -0.597302, -1.863198, 1, 0.3137255, 0, 1,
-1.639138, 1.291814, -0.5319463, 1, 0.3176471, 0, 1,
-1.581097, 0.4584078, -1.606353, 1, 0.3254902, 0, 1,
-1.577545, 0.1311668, -1.294896, 1, 0.3294118, 0, 1,
-1.564299, 1.277019, -4.202151, 1, 0.3372549, 0, 1,
-1.553869, -0.4864829, 0.04924959, 1, 0.3411765, 0, 1,
-1.552063, -1.542957, -3.257306, 1, 0.3490196, 0, 1,
-1.533785, 1.533474, 1.129195, 1, 0.3529412, 0, 1,
-1.531882, 0.2740512, -2.008613, 1, 0.3607843, 0, 1,
-1.524419, -0.8514121, -2.62106, 1, 0.3647059, 0, 1,
-1.519903, 0.2452008, -2.980143, 1, 0.372549, 0, 1,
-1.50975, -1.473788, -3.613466, 1, 0.3764706, 0, 1,
-1.503649, -1.383249, -3.766499, 1, 0.3843137, 0, 1,
-1.498544, 1.427546, -1.382417, 1, 0.3882353, 0, 1,
-1.497987, 0.03735151, -1.812483, 1, 0.3960784, 0, 1,
-1.497777, -0.03908079, 0.9770231, 1, 0.4039216, 0, 1,
-1.487734, -2.168433, -2.683696, 1, 0.4078431, 0, 1,
-1.483187, 0.04066755, -2.227499, 1, 0.4156863, 0, 1,
-1.477606, 0.6539778, 0.5701923, 1, 0.4196078, 0, 1,
-1.472321, -1.181062, -1.500724, 1, 0.427451, 0, 1,
-1.46474, -0.7910607, -2.142789, 1, 0.4313726, 0, 1,
-1.461128, 0.3386459, -0.4073387, 1, 0.4392157, 0, 1,
-1.459827, 0.7477721, -0.6399735, 1, 0.4431373, 0, 1,
-1.458584, 0.05303912, -3.806472, 1, 0.4509804, 0, 1,
-1.424818, 0.3676748, -1.971267, 1, 0.454902, 0, 1,
-1.378032, -1.49947, -1.919139, 1, 0.4627451, 0, 1,
-1.370179, -1.033712, -2.008845, 1, 0.4666667, 0, 1,
-1.366485, -0.1234945, -3.266534, 1, 0.4745098, 0, 1,
-1.34999, 1.239673, -0.7188163, 1, 0.4784314, 0, 1,
-1.345473, 0.4937597, 0.5444016, 1, 0.4862745, 0, 1,
-1.337374, 1.239488, -2.16187, 1, 0.4901961, 0, 1,
-1.326124, 0.9031343, -0.06551483, 1, 0.4980392, 0, 1,
-1.321696, 1.893192, -1.040268, 1, 0.5058824, 0, 1,
-1.313731, -0.09682442, -3.232291, 1, 0.509804, 0, 1,
-1.303856, -0.413644, -2.682994, 1, 0.5176471, 0, 1,
-1.303364, -1.922908, -3.025906, 1, 0.5215687, 0, 1,
-1.287422, -1.969272, -1.215006, 1, 0.5294118, 0, 1,
-1.275941, 0.5092824, -1.428452, 1, 0.5333334, 0, 1,
-1.272792, -0.3367568, -3.554207, 1, 0.5411765, 0, 1,
-1.266333, -0.3995206, -1.678589, 1, 0.5450981, 0, 1,
-1.264831, 0.2869065, -2.052922, 1, 0.5529412, 0, 1,
-1.258893, 2.309034, 0.1236499, 1, 0.5568628, 0, 1,
-1.256059, 1.086883, -3.278802, 1, 0.5647059, 0, 1,
-1.254497, -1.582787, -1.77346, 1, 0.5686275, 0, 1,
-1.249875, 0.6669464, -2.289344, 1, 0.5764706, 0, 1,
-1.248661, 0.9246429, -0.5984826, 1, 0.5803922, 0, 1,
-1.244722, -0.09001193, -0.5179874, 1, 0.5882353, 0, 1,
-1.244674, 2.470207, -0.8502194, 1, 0.5921569, 0, 1,
-1.23877, 1.137553, -0.02504144, 1, 0.6, 0, 1,
-1.238453, 0.8817317, -0.4968504, 1, 0.6078432, 0, 1,
-1.233971, 1.556369, -0.5338122, 1, 0.6117647, 0, 1,
-1.230887, 0.4726302, -0.4859634, 1, 0.6196079, 0, 1,
-1.219484, 0.391792, -1.038862, 1, 0.6235294, 0, 1,
-1.210115, 0.5355193, -0.3787066, 1, 0.6313726, 0, 1,
-1.205539, 0.1871459, -0.549839, 1, 0.6352941, 0, 1,
-1.204174, 1.795344, -0.536117, 1, 0.6431373, 0, 1,
-1.19513, -1.297259, -2.117007, 1, 0.6470588, 0, 1,
-1.194144, 1.252936, -1.660702, 1, 0.654902, 0, 1,
-1.189235, -1.247141, -2.169442, 1, 0.6588235, 0, 1,
-1.180198, 0.1884269, -1.538549, 1, 0.6666667, 0, 1,
-1.17602, 1.939134, -2.060318, 1, 0.6705883, 0, 1,
-1.175845, -0.1278678, -2.291892, 1, 0.6784314, 0, 1,
-1.165662, -1.448656, -3.51053, 1, 0.682353, 0, 1,
-1.165008, 0.1731328, -0.6826177, 1, 0.6901961, 0, 1,
-1.157325, -0.3153977, -2.538632, 1, 0.6941177, 0, 1,
-1.148361, 0.3476992, -0.220847, 1, 0.7019608, 0, 1,
-1.14392, 1.255426, -0.02829853, 1, 0.7098039, 0, 1,
-1.143403, 0.9227386, -0.5683013, 1, 0.7137255, 0, 1,
-1.124293, 1.94797, -1.315752, 1, 0.7215686, 0, 1,
-1.122665, -1.027619, -1.31605, 1, 0.7254902, 0, 1,
-1.121516, -0.9329023, -1.039458, 1, 0.7333333, 0, 1,
-1.120721, -0.02681373, -2.592971, 1, 0.7372549, 0, 1,
-1.120256, 0.5910036, -1.174422, 1, 0.7450981, 0, 1,
-1.115759, -1.279907, -2.818894, 1, 0.7490196, 0, 1,
-1.11155, -1.08645, 0.06120284, 1, 0.7568628, 0, 1,
-1.109021, 0.6419333, -0.03708549, 1, 0.7607843, 0, 1,
-1.103599, -0.3283948, -2.340649, 1, 0.7686275, 0, 1,
-1.101625, 0.6411314, -0.2867488, 1, 0.772549, 0, 1,
-1.097636, -0.3784668, -1.438361, 1, 0.7803922, 0, 1,
-1.092719, 0.6477104, -2.207972, 1, 0.7843137, 0, 1,
-1.091056, -0.2493824, -2.367569, 1, 0.7921569, 0, 1,
-1.0893, -1.721995, -2.603364, 1, 0.7960784, 0, 1,
-1.087401, 0.3317913, -1.487041, 1, 0.8039216, 0, 1,
-1.080834, 0.5085027, 0.8761907, 1, 0.8117647, 0, 1,
-1.079109, 0.6980336, -2.357695, 1, 0.8156863, 0, 1,
-1.073157, 0.973759, -2.112769, 1, 0.8235294, 0, 1,
-1.066904, -1.027982, -3.126641, 1, 0.827451, 0, 1,
-1.063235, -0.393177, -1.108272, 1, 0.8352941, 0, 1,
-1.05879, 1.303986, -2.644488, 1, 0.8392157, 0, 1,
-1.055724, -1.451895, -4.834395, 1, 0.8470588, 0, 1,
-1.047415, -0.5027025, -1.220279, 1, 0.8509804, 0, 1,
-1.047301, -1.948735, -2.118482, 1, 0.8588235, 0, 1,
-1.046881, -0.941466, -1.540123, 1, 0.8627451, 0, 1,
-1.04385, 1.101027, 0.4765221, 1, 0.8705882, 0, 1,
-1.041066, 0.5686369, -2.26096, 1, 0.8745098, 0, 1,
-1.040889, -0.8553842, -3.094817, 1, 0.8823529, 0, 1,
-1.039962, 0.9224107, 0.9517461, 1, 0.8862745, 0, 1,
-1.036999, -0.2398896, -2.345693, 1, 0.8941177, 0, 1,
-1.036784, 0.7514904, 1.111083, 1, 0.8980392, 0, 1,
-1.029823, -0.4971289, -0.5362113, 1, 0.9058824, 0, 1,
-1.025353, 0.3777863, -1.462702, 1, 0.9137255, 0, 1,
-1.020716, 0.1765655, -1.993879, 1, 0.9176471, 0, 1,
-1.005401, -1.709454, -1.365505, 1, 0.9254902, 0, 1,
-1.001444, -1.598346, -2.994443, 1, 0.9294118, 0, 1,
-0.9980996, -0.2691367, -1.320313, 1, 0.9372549, 0, 1,
-0.994061, -1.020497, -1.193233, 1, 0.9411765, 0, 1,
-0.9596839, 0.1299461, -1.949665, 1, 0.9490196, 0, 1,
-0.951461, 0.8319905, -2.200737, 1, 0.9529412, 0, 1,
-0.9501863, -0.3172601, -2.343043, 1, 0.9607843, 0, 1,
-0.9410737, 0.9989327, -0.05533459, 1, 0.9647059, 0, 1,
-0.939492, 1.862227, -1.723631, 1, 0.972549, 0, 1,
-0.933081, 0.8985457, -2.492397, 1, 0.9764706, 0, 1,
-0.9317027, -0.8892768, -1.988043, 1, 0.9843137, 0, 1,
-0.9304016, -0.6760793, -1.456748, 1, 0.9882353, 0, 1,
-0.9288684, -0.3675018, -1.869312, 1, 0.9960784, 0, 1,
-0.9241236, 0.08061472, -0.8299716, 0.9960784, 1, 0, 1,
-0.9217348, 0.4923028, -0.9272979, 0.9921569, 1, 0, 1,
-0.9210511, -1.353256, -2.521708, 0.9843137, 1, 0, 1,
-0.9176233, 0.304954, -3.0207, 0.9803922, 1, 0, 1,
-0.9157255, -0.2626487, -1.787085, 0.972549, 1, 0, 1,
-0.9134948, 0.1832785, -3.227726, 0.9686275, 1, 0, 1,
-0.9105451, -0.9011962, -1.123664, 0.9607843, 1, 0, 1,
-0.9077186, -0.4731839, -1.838541, 0.9568627, 1, 0, 1,
-0.8999704, 0.2040775, -2.410432, 0.9490196, 1, 0, 1,
-0.8953216, 0.02912801, 0.003316139, 0.945098, 1, 0, 1,
-0.8880468, -0.4339816, -2.94844, 0.9372549, 1, 0, 1,
-0.8861131, 0.3173893, 0.02987952, 0.9333333, 1, 0, 1,
-0.8856884, -1.189132, -1.295946, 0.9254902, 1, 0, 1,
-0.8809749, 0.8626897, -1.221015, 0.9215686, 1, 0, 1,
-0.8721914, -0.4607679, 0.5388146, 0.9137255, 1, 0, 1,
-0.8718857, 0.4755532, -1.523423, 0.9098039, 1, 0, 1,
-0.8682901, 0.3410557, 0.659017, 0.9019608, 1, 0, 1,
-0.861807, -0.05513101, -0.2577916, 0.8941177, 1, 0, 1,
-0.8601692, -0.7845044, -3.14134, 0.8901961, 1, 0, 1,
-0.856127, -0.7361396, -1.688921, 0.8823529, 1, 0, 1,
-0.8545836, -1.162644, -3.604023, 0.8784314, 1, 0, 1,
-0.8476111, -1.172498, -1.147512, 0.8705882, 1, 0, 1,
-0.8396727, -0.7289553, -2.811013, 0.8666667, 1, 0, 1,
-0.8375994, -0.7734525, -2.696343, 0.8588235, 1, 0, 1,
-0.8349847, -0.09222053, -1.635479, 0.854902, 1, 0, 1,
-0.8340153, -0.09959338, -1.60689, 0.8470588, 1, 0, 1,
-0.8334878, 0.2051261, -1.22279, 0.8431373, 1, 0, 1,
-0.8302135, 0.7518021, 1.522142, 0.8352941, 1, 0, 1,
-0.8285948, 0.7030246, 0.3305828, 0.8313726, 1, 0, 1,
-0.8280065, 0.8914571, -0.05018278, 0.8235294, 1, 0, 1,
-0.8230785, -0.5642489, -1.316338, 0.8196079, 1, 0, 1,
-0.8190772, -0.3203502, -2.854081, 0.8117647, 1, 0, 1,
-0.8164075, -0.02163031, -1.228, 0.8078431, 1, 0, 1,
-0.8122291, -1.394956, -2.151854, 0.8, 1, 0, 1,
-0.8077235, 1.872812, -0.7953659, 0.7921569, 1, 0, 1,
-0.8065544, 0.4992434, -1.9141, 0.7882353, 1, 0, 1,
-0.806075, 2.840218, -0.6287633, 0.7803922, 1, 0, 1,
-0.8053669, 2.089922, -1.128177, 0.7764706, 1, 0, 1,
-0.8018264, -0.4075378, -1.259665, 0.7686275, 1, 0, 1,
-0.7980704, 0.5661128, 0.2358094, 0.7647059, 1, 0, 1,
-0.7959186, -0.6959126, -1.42595, 0.7568628, 1, 0, 1,
-0.7932985, 0.09078374, -0.8812264, 0.7529412, 1, 0, 1,
-0.7887785, 0.2254811, -2.049953, 0.7450981, 1, 0, 1,
-0.7844731, -1.809767, -2.668051, 0.7411765, 1, 0, 1,
-0.7834925, -0.9102528, -1.80312, 0.7333333, 1, 0, 1,
-0.7828786, 2.87533, 0.3826671, 0.7294118, 1, 0, 1,
-0.7823226, -0.0455092, -1.235364, 0.7215686, 1, 0, 1,
-0.7819773, 0.7713704, -2.275827, 0.7176471, 1, 0, 1,
-0.7813534, 0.8645095, -2.171054, 0.7098039, 1, 0, 1,
-0.7798607, 1.052258, -2.230685, 0.7058824, 1, 0, 1,
-0.7787763, 0.5487981, -0.8430684, 0.6980392, 1, 0, 1,
-0.7783867, 1.487228, -1.381226, 0.6901961, 1, 0, 1,
-0.7776002, -0.8952065, -3.557895, 0.6862745, 1, 0, 1,
-0.7768196, 0.3050673, -0.225054, 0.6784314, 1, 0, 1,
-0.7761126, -0.6824442, -2.354153, 0.6745098, 1, 0, 1,
-0.7715465, -1.929265, -2.661055, 0.6666667, 1, 0, 1,
-0.7713848, 0.1260208, -2.687096, 0.6627451, 1, 0, 1,
-0.7713724, -1.186171, -3.759189, 0.654902, 1, 0, 1,
-0.7707349, 0.9898636, -1.042992, 0.6509804, 1, 0, 1,
-0.7706389, 1.312436, -1.216397, 0.6431373, 1, 0, 1,
-0.7703983, -0.215373, -1.350894, 0.6392157, 1, 0, 1,
-0.7509452, -1.861141, -3.65802, 0.6313726, 1, 0, 1,
-0.7501304, -0.7392296, -2.357052, 0.627451, 1, 0, 1,
-0.7476847, -1.059267, -2.867131, 0.6196079, 1, 0, 1,
-0.7443808, 1.657712, 1.033657, 0.6156863, 1, 0, 1,
-0.7429382, -1.309654, -2.539599, 0.6078432, 1, 0, 1,
-0.7371134, -1.969585, -2.393031, 0.6039216, 1, 0, 1,
-0.7354731, -0.2241602, -1.500562, 0.5960785, 1, 0, 1,
-0.7346821, -0.2878806, -3.654113, 0.5882353, 1, 0, 1,
-0.7329593, 0.1861743, -1.203462, 0.5843138, 1, 0, 1,
-0.7317802, 0.2820489, -1.660042, 0.5764706, 1, 0, 1,
-0.7300925, -1.59991, -1.644292, 0.572549, 1, 0, 1,
-0.7250061, 0.1443861, -0.6848924, 0.5647059, 1, 0, 1,
-0.7164502, -0.2936306, -3.139493, 0.5607843, 1, 0, 1,
-0.7142707, -0.01961513, -2.660361, 0.5529412, 1, 0, 1,
-0.7072088, 1.733426, 0.7355874, 0.5490196, 1, 0, 1,
-0.7032141, -1.39488, -3.058986, 0.5411765, 1, 0, 1,
-0.6869196, 2.168725, -1.044888, 0.5372549, 1, 0, 1,
-0.6862515, -0.5900092, -1.020333, 0.5294118, 1, 0, 1,
-0.6848615, 1.670486, 0.779735, 0.5254902, 1, 0, 1,
-0.6844184, -0.5167018, -2.496305, 0.5176471, 1, 0, 1,
-0.679899, 0.9983194, 0.4465946, 0.5137255, 1, 0, 1,
-0.6754599, 1.0474, -0.2070908, 0.5058824, 1, 0, 1,
-0.6742819, -1.226779, -2.603094, 0.5019608, 1, 0, 1,
-0.6732315, -0.1974263, 0.1346117, 0.4941176, 1, 0, 1,
-0.6724587, 1.017124, -0.1435985, 0.4862745, 1, 0, 1,
-0.6702846, -1.383405, -3.194015, 0.4823529, 1, 0, 1,
-0.6700708, -0.7938561, -3.310096, 0.4745098, 1, 0, 1,
-0.6671046, -0.2501928, -1.943612, 0.4705882, 1, 0, 1,
-0.6625723, -0.2659773, -0.967684, 0.4627451, 1, 0, 1,
-0.6617588, 1.334565, -0.5662659, 0.4588235, 1, 0, 1,
-0.6565707, -1.370313, -3.229122, 0.4509804, 1, 0, 1,
-0.6565661, -1.216428, -1.86345, 0.4470588, 1, 0, 1,
-0.6554791, -2.076345, -2.759262, 0.4392157, 1, 0, 1,
-0.6553469, -0.3276067, -2.943723, 0.4352941, 1, 0, 1,
-0.6504745, 0.8840684, -1.363855, 0.427451, 1, 0, 1,
-0.6445331, 0.7152026, -0.2744932, 0.4235294, 1, 0, 1,
-0.6367558, 0.1665316, 0.990684, 0.4156863, 1, 0, 1,
-0.6315786, 0.4324519, -0.5065053, 0.4117647, 1, 0, 1,
-0.629799, 0.5511578, -0.337389, 0.4039216, 1, 0, 1,
-0.6284415, 0.5386366, -0.7936049, 0.3960784, 1, 0, 1,
-0.6195545, -0.2972876, -4.619369, 0.3921569, 1, 0, 1,
-0.6184086, -0.02606978, -1.218629, 0.3843137, 1, 0, 1,
-0.6164963, -1.465617, -2.89327, 0.3803922, 1, 0, 1,
-0.611389, -0.5251164, -3.341269, 0.372549, 1, 0, 1,
-0.6110974, -0.7448502, -3.852685, 0.3686275, 1, 0, 1,
-0.6079937, 0.08786594, -0.0710065, 0.3607843, 1, 0, 1,
-0.6076192, -0.7209319, -1.922064, 0.3568628, 1, 0, 1,
-0.6044576, -0.7753205, -2.407439, 0.3490196, 1, 0, 1,
-0.5980491, -1.029256, -2.663997, 0.345098, 1, 0, 1,
-0.5978752, -0.1114141, -1.047676, 0.3372549, 1, 0, 1,
-0.5962036, 2.024034, -0.317395, 0.3333333, 1, 0, 1,
-0.5895473, -0.3259712, -2.156303, 0.3254902, 1, 0, 1,
-0.5814291, -0.359949, -2.713524, 0.3215686, 1, 0, 1,
-0.5779625, -1.048287, -4.784657, 0.3137255, 1, 0, 1,
-0.5772009, -0.03781756, -2.607511, 0.3098039, 1, 0, 1,
-0.5738343, 0.5612314, -1.049135, 0.3019608, 1, 0, 1,
-0.5730262, 0.2693093, -0.1843483, 0.2941177, 1, 0, 1,
-0.5713724, 0.5419706, 1.204395, 0.2901961, 1, 0, 1,
-0.56589, -0.5152138, -2.868971, 0.282353, 1, 0, 1,
-0.5640021, -0.6913279, -0.717392, 0.2784314, 1, 0, 1,
-0.5627555, 1.516379, -1.350986, 0.2705882, 1, 0, 1,
-0.5573335, 0.2032473, -0.2705442, 0.2666667, 1, 0, 1,
-0.5562928, 1.602489, -0.1564073, 0.2588235, 1, 0, 1,
-0.5558926, 2.253556, 0.1260957, 0.254902, 1, 0, 1,
-0.5556435, 0.6620086, -0.623788, 0.2470588, 1, 0, 1,
-0.5520468, -0.7908627, -2.57558, 0.2431373, 1, 0, 1,
-0.551367, -1.254122, -3.591819, 0.2352941, 1, 0, 1,
-0.5488044, 0.1688849, -0.7856024, 0.2313726, 1, 0, 1,
-0.5450286, 0.1714763, -1.386217, 0.2235294, 1, 0, 1,
-0.5441041, 0.3416018, -0.2711911, 0.2196078, 1, 0, 1,
-0.5430985, 0.05330537, -2.332818, 0.2117647, 1, 0, 1,
-0.5430394, 1.582064, -0.2226352, 0.2078431, 1, 0, 1,
-0.5406219, -1.257659, -2.831325, 0.2, 1, 0, 1,
-0.5359604, -0.3257956, -1.990245, 0.1921569, 1, 0, 1,
-0.5307963, -1.973905, -3.857059, 0.1882353, 1, 0, 1,
-0.5305362, 0.9000022, -0.610638, 0.1803922, 1, 0, 1,
-0.5284708, 0.005489132, -1.084177, 0.1764706, 1, 0, 1,
-0.5249425, -0.5426247, -2.323066, 0.1686275, 1, 0, 1,
-0.5244142, 0.6595739, -2.799284, 0.1647059, 1, 0, 1,
-0.5240716, 0.3932239, -1.627334, 0.1568628, 1, 0, 1,
-0.5239353, 1.084593, -1.733579, 0.1529412, 1, 0, 1,
-0.521845, 0.8174004, -0.1000467, 0.145098, 1, 0, 1,
-0.5212864, 0.6587373, -0.9637977, 0.1411765, 1, 0, 1,
-0.5196742, 0.6269102, 1.476204, 0.1333333, 1, 0, 1,
-0.5134706, 1.036773, -1.062343, 0.1294118, 1, 0, 1,
-0.5119002, 0.2575017, -1.578629, 0.1215686, 1, 0, 1,
-0.5098448, -0.2782314, -2.372336, 0.1176471, 1, 0, 1,
-0.501886, -0.42181, -2.431655, 0.1098039, 1, 0, 1,
-0.5006964, -1.095163, -1.470905, 0.1058824, 1, 0, 1,
-0.4975688, 0.7266876, -1.01499, 0.09803922, 1, 0, 1,
-0.4961118, 0.6408659, -0.7604831, 0.09019608, 1, 0, 1,
-0.495461, -0.112044, -3.497386, 0.08627451, 1, 0, 1,
-0.4893617, 0.2050098, -2.053991, 0.07843138, 1, 0, 1,
-0.4890844, 1.007972, 1.209486, 0.07450981, 1, 0, 1,
-0.4868035, 0.4434528, -0.8987092, 0.06666667, 1, 0, 1,
-0.4835636, -0.3835388, -1.573761, 0.0627451, 1, 0, 1,
-0.4819233, 0.4353769, -1.090816, 0.05490196, 1, 0, 1,
-0.4800792, -0.6774089, -4.279629, 0.05098039, 1, 0, 1,
-0.4738479, -0.3660381, -3.258892, 0.04313726, 1, 0, 1,
-0.4716611, 0.9907993, -0.01189854, 0.03921569, 1, 0, 1,
-0.4714728, 1.259786, -2.329817, 0.03137255, 1, 0, 1,
-0.464271, -0.8448721, -1.354265, 0.02745098, 1, 0, 1,
-0.4615565, 0.3839544, 0.1396146, 0.01960784, 1, 0, 1,
-0.4613349, -0.5082601, -1.110002, 0.01568628, 1, 0, 1,
-0.4491739, -1.278878, -4.480374, 0.007843138, 1, 0, 1,
-0.4465362, 1.529942, -0.1587636, 0.003921569, 1, 0, 1,
-0.4450798, 0.08911131, -1.286798, 0, 1, 0.003921569, 1,
-0.4420971, -0.9855967, -0.6544854, 0, 1, 0.01176471, 1,
-0.4385293, -0.3158815, -3.226279, 0, 1, 0.01568628, 1,
-0.4356933, -1.19894, -3.79919, 0, 1, 0.02352941, 1,
-0.4338802, 1.114904, 0.5008488, 0, 1, 0.02745098, 1,
-0.4297602, 0.01778826, -0.7757459, 0, 1, 0.03529412, 1,
-0.4284214, 1.928468, -0.9189577, 0, 1, 0.03921569, 1,
-0.427824, 0.6792896, -1.249831, 0, 1, 0.04705882, 1,
-0.421966, 1.387874, -0.6209106, 0, 1, 0.05098039, 1,
-0.4189138, -0.01781865, -2.501817, 0, 1, 0.05882353, 1,
-0.415248, -0.00390362, -1.609764, 0, 1, 0.0627451, 1,
-0.4114048, -0.5966921, -1.474482, 0, 1, 0.07058824, 1,
-0.4091215, -1.149889, -3.835179, 0, 1, 0.07450981, 1,
-0.4019288, -0.9042869, -3.322232, 0, 1, 0.08235294, 1,
-0.4016099, 0.7158044, -0.2882603, 0, 1, 0.08627451, 1,
-0.4006891, 0.2317975, -0.8159721, 0, 1, 0.09411765, 1,
-0.4002915, 1.65945, -0.6742575, 0, 1, 0.1019608, 1,
-0.3935753, -0.3499225, -3.1366, 0, 1, 0.1058824, 1,
-0.3923933, -0.8572928, -2.812602, 0, 1, 0.1137255, 1,
-0.3900567, 2.495607, -0.5015379, 0, 1, 0.1176471, 1,
-0.3896663, 0.531207, -0.3954803, 0, 1, 0.1254902, 1,
-0.3882221, 1.865607, -2.261549, 0, 1, 0.1294118, 1,
-0.3868507, 0.5310043, 0.8852847, 0, 1, 0.1372549, 1,
-0.3861988, 1.607506, -0.8185034, 0, 1, 0.1411765, 1,
-0.3830483, 0.5648852, -2.413431, 0, 1, 0.1490196, 1,
-0.3828019, 0.9077168, 0.2315315, 0, 1, 0.1529412, 1,
-0.376328, 1.526311, 0.2852754, 0, 1, 0.1607843, 1,
-0.3751916, 0.5305163, -1.476506, 0, 1, 0.1647059, 1,
-0.3742287, 0.4579832, -3.382364, 0, 1, 0.172549, 1,
-0.3716618, -1.630427, -2.590611, 0, 1, 0.1764706, 1,
-0.3631994, -1.942053, -5.4504, 0, 1, 0.1843137, 1,
-0.3624249, -0.5896263, -1.804381, 0, 1, 0.1882353, 1,
-0.3607675, -0.7683769, -4.665697, 0, 1, 0.1960784, 1,
-0.3589753, -0.3838515, -3.402332, 0, 1, 0.2039216, 1,
-0.3491153, -0.4630145, -1.044763, 0, 1, 0.2078431, 1,
-0.3479265, 0.3130426, -0.9136371, 0, 1, 0.2156863, 1,
-0.347071, 1.497547, -1.236705, 0, 1, 0.2196078, 1,
-0.3458563, 0.9561781, 1.060899, 0, 1, 0.227451, 1,
-0.3441105, -0.2451827, -2.423733, 0, 1, 0.2313726, 1,
-0.3416861, -1.473033, -3.665131, 0, 1, 0.2392157, 1,
-0.3405967, -1.5633, -3.592838, 0, 1, 0.2431373, 1,
-0.3376758, -1.992072, -3.605852, 0, 1, 0.2509804, 1,
-0.3365479, -1.382968, -2.484973, 0, 1, 0.254902, 1,
-0.3350078, 0.08527618, 0.6008052, 0, 1, 0.2627451, 1,
-0.3330322, -0.2006102, -1.838993, 0, 1, 0.2666667, 1,
-0.3326786, 0.231602, -1.96245, 0, 1, 0.2745098, 1,
-0.3228591, 0.2238423, -1.241278, 0, 1, 0.2784314, 1,
-0.3227374, -0.9485077, -2.037629, 0, 1, 0.2862745, 1,
-0.3170792, 0.2137792, -0.9426879, 0, 1, 0.2901961, 1,
-0.3167846, -0.6171434, -1.870147, 0, 1, 0.2980392, 1,
-0.314637, 0.6711388, 1.123571, 0, 1, 0.3058824, 1,
-0.312919, 0.2799966, 0.3210571, 0, 1, 0.3098039, 1,
-0.3127746, -0.7644847, -4.24112, 0, 1, 0.3176471, 1,
-0.310859, -0.2724423, -2.576905, 0, 1, 0.3215686, 1,
-0.3107225, -0.5367641, -4.121011, 0, 1, 0.3294118, 1,
-0.3020373, -1.132549, -2.583525, 0, 1, 0.3333333, 1,
-0.3011285, 0.866122, 2.384438, 0, 1, 0.3411765, 1,
-0.299114, -0.6073406, -3.515085, 0, 1, 0.345098, 1,
-0.2988168, 0.4712325, -1.990787, 0, 1, 0.3529412, 1,
-0.2973931, -0.7867712, -1.768272, 0, 1, 0.3568628, 1,
-0.2950522, 0.4232785, 0.7529943, 0, 1, 0.3647059, 1,
-0.294148, 0.7495418, -0.8153533, 0, 1, 0.3686275, 1,
-0.2910184, -1.032173, -2.375739, 0, 1, 0.3764706, 1,
-0.288178, 1.226781, -0.4955644, 0, 1, 0.3803922, 1,
-0.2877848, 0.7353827, -0.9698501, 0, 1, 0.3882353, 1,
-0.2873488, -2.340499, -2.341047, 0, 1, 0.3921569, 1,
-0.2848951, -0.2934624, -4.596821, 0, 1, 0.4, 1,
-0.2820883, -1.716417, -3.038602, 0, 1, 0.4078431, 1,
-0.2784268, 1.445716, 1.48506, 0, 1, 0.4117647, 1,
-0.2781797, 0.7893289, -1.096605, 0, 1, 0.4196078, 1,
-0.2780131, 0.3879771, 0.3507889, 0, 1, 0.4235294, 1,
-0.2758623, -1.580895, -3.328889, 0, 1, 0.4313726, 1,
-0.2713313, 0.4964066, -0.8260527, 0, 1, 0.4352941, 1,
-0.2692975, 0.4717109, 0.4672943, 0, 1, 0.4431373, 1,
-0.2678232, -0.2356059, -3.954783, 0, 1, 0.4470588, 1,
-0.2641097, 1.726104, 0.2783686, 0, 1, 0.454902, 1,
-0.2560042, -1.511322, -2.821815, 0, 1, 0.4588235, 1,
-0.2541893, 2.199186, -0.4834599, 0, 1, 0.4666667, 1,
-0.2528542, 0.7311764, -0.3288129, 0, 1, 0.4705882, 1,
-0.251219, -1.262446, -2.921037, 0, 1, 0.4784314, 1,
-0.2504036, 1.14307, -0.05065718, 0, 1, 0.4823529, 1,
-0.249703, 0.9090555, -1.10379, 0, 1, 0.4901961, 1,
-0.2496509, -0.3626429, -3.133863, 0, 1, 0.4941176, 1,
-0.2402348, 1.31086, -0.08026122, 0, 1, 0.5019608, 1,
-0.2222105, -0.3476847, -3.210059, 0, 1, 0.509804, 1,
-0.217836, -0.3276282, -2.048121, 0, 1, 0.5137255, 1,
-0.2177416, 0.9722615, 0.7150586, 0, 1, 0.5215687, 1,
-0.2151862, 0.3006413, -1.217933, 0, 1, 0.5254902, 1,
-0.2130467, 0.7694821, -0.7198766, 0, 1, 0.5333334, 1,
-0.2078225, -1.569898, -1.447255, 0, 1, 0.5372549, 1,
-0.2017679, 1.369937, -1.024226, 0, 1, 0.5450981, 1,
-0.2010292, -0.2076489, -1.139255, 0, 1, 0.5490196, 1,
-0.1978203, -0.764981, -2.110119, 0, 1, 0.5568628, 1,
-0.1975207, -0.6833351, -2.275668, 0, 1, 0.5607843, 1,
-0.1957089, -1.88696, -4.30735, 0, 1, 0.5686275, 1,
-0.1949092, -1.001175, -3.396039, 0, 1, 0.572549, 1,
-0.1948959, 0.2154756, -0.7832282, 0, 1, 0.5803922, 1,
-0.1945342, -0.4494825, -1.365127, 0, 1, 0.5843138, 1,
-0.1917958, 1.423905, -0.3514412, 0, 1, 0.5921569, 1,
-0.1872883, 0.6910343, 1.511667, 0, 1, 0.5960785, 1,
-0.1845057, 0.1050952, -2.242435, 0, 1, 0.6039216, 1,
-0.1800446, -1.11303, -2.630134, 0, 1, 0.6117647, 1,
-0.1705866, 0.9056567, -1.607857, 0, 1, 0.6156863, 1,
-0.1686775, -0.6896903, -1.876972, 0, 1, 0.6235294, 1,
-0.1668189, 0.3292249, -1.340142, 0, 1, 0.627451, 1,
-0.1643819, 1.576004, -0.9685197, 0, 1, 0.6352941, 1,
-0.1641113, -0.6644004, -2.590223, 0, 1, 0.6392157, 1,
-0.1619026, 0.8679336, 0.4632198, 0, 1, 0.6470588, 1,
-0.156111, 0.430145, -0.0386983, 0, 1, 0.6509804, 1,
-0.1515294, -1.521853, -3.317476, 0, 1, 0.6588235, 1,
-0.151375, -0.08910793, -1.761988, 0, 1, 0.6627451, 1,
-0.149914, 0.3249968, -1.233872, 0, 1, 0.6705883, 1,
-0.148978, -0.2582625, -2.644542, 0, 1, 0.6745098, 1,
-0.1487922, 1.799681, 0.001696003, 0, 1, 0.682353, 1,
-0.1443353, 0.788063, 1.136732, 0, 1, 0.6862745, 1,
-0.1436837, -0.6037823, -4.105251, 0, 1, 0.6941177, 1,
-0.1425256, 0.4012056, 1.271319, 0, 1, 0.7019608, 1,
-0.1422368, -0.3996314, -3.16961, 0, 1, 0.7058824, 1,
-0.1400037, -0.8390628, -2.987977, 0, 1, 0.7137255, 1,
-0.1364196, -0.5065905, -2.052291, 0, 1, 0.7176471, 1,
-0.1350665, -0.8162882, -3.271885, 0, 1, 0.7254902, 1,
-0.1317495, -1.534198, -5.149646, 0, 1, 0.7294118, 1,
-0.1305149, -0.8700145, -3.017906, 0, 1, 0.7372549, 1,
-0.1282894, 1.284526, 0.7184181, 0, 1, 0.7411765, 1,
-0.1255169, 0.2013521, -0.9817445, 0, 1, 0.7490196, 1,
-0.1216175, 1.781297, -0.1406264, 0, 1, 0.7529412, 1,
-0.1212152, 0.9804676, 0.7978553, 0, 1, 0.7607843, 1,
-0.1115511, 0.9828656, -0.8091117, 0, 1, 0.7647059, 1,
-0.1081753, -0.1518031, -2.495342, 0, 1, 0.772549, 1,
-0.1031421, 1.468509, 0.1215329, 0, 1, 0.7764706, 1,
-0.1011277, 0.868406, -1.796376, 0, 1, 0.7843137, 1,
-0.09900837, 0.6502397, 0.1770985, 0, 1, 0.7882353, 1,
-0.09504173, 1.280547, 0.5691546, 0, 1, 0.7960784, 1,
-0.09447427, -1.672069, -2.28035, 0, 1, 0.8039216, 1,
-0.09400006, 0.617822, 0.6509789, 0, 1, 0.8078431, 1,
-0.09239154, -0.8816161, -1.522486, 0, 1, 0.8156863, 1,
-0.08949658, -0.8358335, -2.692816, 0, 1, 0.8196079, 1,
-0.08924717, 0.3718564, -1.096706, 0, 1, 0.827451, 1,
-0.08363256, -2.405574, -1.572193, 0, 1, 0.8313726, 1,
-0.08197232, 1.192751, -0.8626899, 0, 1, 0.8392157, 1,
-0.08093694, 1.008175, -1.062228, 0, 1, 0.8431373, 1,
-0.07876305, -0.3439237, -3.571587, 0, 1, 0.8509804, 1,
-0.07773368, 2.577986, -0.1145481, 0, 1, 0.854902, 1,
-0.07258798, 1.023349, -0.8019529, 0, 1, 0.8627451, 1,
-0.06376187, -0.1546731, -2.743016, 0, 1, 0.8666667, 1,
-0.06200178, 0.4489982, 0.607756, 0, 1, 0.8745098, 1,
-0.05809085, 1.024275, -0.0462255, 0, 1, 0.8784314, 1,
-0.05148287, -0.8782544, -3.08907, 0, 1, 0.8862745, 1,
-0.04971463, 0.3224056, 0.7499522, 0, 1, 0.8901961, 1,
-0.04684664, 1.222398, 0.96724, 0, 1, 0.8980392, 1,
-0.04671911, 2.115585, 0.1958899, 0, 1, 0.9058824, 1,
-0.04454525, -2.364538, -4.542428, 0, 1, 0.9098039, 1,
-0.04434331, -0.7066305, -2.386497, 0, 1, 0.9176471, 1,
-0.04127486, -0.1127727, -2.924357, 0, 1, 0.9215686, 1,
-0.04118746, -0.2711321, -3.961885, 0, 1, 0.9294118, 1,
-0.04033703, 0.9750634, -1.738941, 0, 1, 0.9333333, 1,
-0.03860863, 0.3547912, -0.04792755, 0, 1, 0.9411765, 1,
-0.0368991, 0.5690512, -0.225616, 0, 1, 0.945098, 1,
-0.03681921, 1.029756, 0.262817, 0, 1, 0.9529412, 1,
-0.03679836, 2.60839, -0.7718672, 0, 1, 0.9568627, 1,
-0.03557695, -0.6949492, -2.068279, 0, 1, 0.9647059, 1,
-0.03462382, -1.058853, -3.075826, 0, 1, 0.9686275, 1,
-0.02553536, 0.3694351, 0.0231767, 0, 1, 0.9764706, 1,
-0.0242232, -0.4918108, -0.5831867, 0, 1, 0.9803922, 1,
-0.02346917, -0.3575791, -1.257575, 0, 1, 0.9882353, 1,
-0.01871136, -0.398447, -3.41007, 0, 1, 0.9921569, 1,
-0.01751725, 0.8373235, -0.1513755, 0, 1, 1, 1,
-0.01232497, 0.9223939, -1.370293, 0, 0.9921569, 1, 1,
-0.008493165, 0.8127299, -0.2002838, 0, 0.9882353, 1, 1,
-0.008065733, -0.2432857, -5.000981, 0, 0.9803922, 1, 1,
-0.003498829, 0.5582661, 1.264046, 0, 0.9764706, 1, 1,
-0.0008471027, 0.6703255, 1.094599, 0, 0.9686275, 1, 1,
0.003329209, -0.8842842, 5.73025, 0, 0.9647059, 1, 1,
0.004665579, 0.07207949, 0.8563362, 0, 0.9568627, 1, 1,
0.006455993, -0.358992, 2.356658, 0, 0.9529412, 1, 1,
0.007910074, 1.850832, -0.4764594, 0, 0.945098, 1, 1,
0.008336692, 0.003258093, 2.115654, 0, 0.9411765, 1, 1,
0.01017834, -0.7049878, 2.307428, 0, 0.9333333, 1, 1,
0.01176975, 0.9587191, -0.3543519, 0, 0.9294118, 1, 1,
0.01218758, 0.2447814, 1.474144, 0, 0.9215686, 1, 1,
0.01567202, 0.7226368, -0.6827621, 0, 0.9176471, 1, 1,
0.01571902, 0.8263199, -2.068433, 0, 0.9098039, 1, 1,
0.01837436, 0.3048419, -2.040857, 0, 0.9058824, 1, 1,
0.02772115, -0.3537467, 2.140902, 0, 0.8980392, 1, 1,
0.03006088, 0.7426963, 0.1534289, 0, 0.8901961, 1, 1,
0.03541238, 0.6130254, -0.9120037, 0, 0.8862745, 1, 1,
0.03544928, -0.5720316, 3.475868, 0, 0.8784314, 1, 1,
0.0415502, -1.23751, 3.239861, 0, 0.8745098, 1, 1,
0.04419208, -0.5929943, 3.593195, 0, 0.8666667, 1, 1,
0.05117104, 1.444867, 0.6964386, 0, 0.8627451, 1, 1,
0.05196245, 0.1390522, 0.5548283, 0, 0.854902, 1, 1,
0.05217731, -0.2177788, 5.002292, 0, 0.8509804, 1, 1,
0.05290691, 0.785335, 0.4101943, 0, 0.8431373, 1, 1,
0.05444929, 0.1181722, 0.4454359, 0, 0.8392157, 1, 1,
0.06003764, -0.9123246, 1.795733, 0, 0.8313726, 1, 1,
0.06004844, 0.2025947, 1.626072, 0, 0.827451, 1, 1,
0.06244557, -0.04645574, 2.35447, 0, 0.8196079, 1, 1,
0.06422955, 0.6338185, -2.5306, 0, 0.8156863, 1, 1,
0.06591631, 0.4532897, 0.6258909, 0, 0.8078431, 1, 1,
0.0675269, -0.1861845, 2.975078, 0, 0.8039216, 1, 1,
0.07329734, -0.04759347, 1.477842, 0, 0.7960784, 1, 1,
0.07548886, 0.8674374, 1.666047, 0, 0.7882353, 1, 1,
0.07593639, 0.1952743, 1.517599, 0, 0.7843137, 1, 1,
0.07669814, -0.167072, 3.300481, 0, 0.7764706, 1, 1,
0.07922205, -0.02455371, 1.800129, 0, 0.772549, 1, 1,
0.08408754, -0.6734856, -0.9033046, 0, 0.7647059, 1, 1,
0.08467633, -0.1405236, 2.341938, 0, 0.7607843, 1, 1,
0.08552302, -0.3170837, 4.956959, 0, 0.7529412, 1, 1,
0.08745221, -1.366015, 3.153116, 0, 0.7490196, 1, 1,
0.09075201, -0.7976515, 4.018185, 0, 0.7411765, 1, 1,
0.09125961, -0.6263881, 3.752827, 0, 0.7372549, 1, 1,
0.09286109, 1.108843, -0.08120216, 0, 0.7294118, 1, 1,
0.09963842, 0.5840467, 3.199359, 0, 0.7254902, 1, 1,
0.1035465, -0.9361607, 1.978906, 0, 0.7176471, 1, 1,
0.1064649, -0.02101649, 1.927419, 0, 0.7137255, 1, 1,
0.1084349, -0.3877013, 2.373131, 0, 0.7058824, 1, 1,
0.1120098, -0.8038446, 1.400334, 0, 0.6980392, 1, 1,
0.1170252, -1.211302, 2.652635, 0, 0.6941177, 1, 1,
0.1199088, -0.796334, 2.960631, 0, 0.6862745, 1, 1,
0.1209826, 0.6308598, -0.9043494, 0, 0.682353, 1, 1,
0.1241023, 1.049623, -0.1340824, 0, 0.6745098, 1, 1,
0.1247216, -0.2014781, 3.529225, 0, 0.6705883, 1, 1,
0.1256093, 0.5400739, -1.051796, 0, 0.6627451, 1, 1,
0.127607, 2.239608, -1.400422, 0, 0.6588235, 1, 1,
0.1287155, -0.3315819, 2.737334, 0, 0.6509804, 1, 1,
0.1287256, -1.74597, 3.761999, 0, 0.6470588, 1, 1,
0.1372373, -0.5496747, 2.084477, 0, 0.6392157, 1, 1,
0.1379208, 0.9071061, 0.487865, 0, 0.6352941, 1, 1,
0.1431634, -2.035251, 2.742834, 0, 0.627451, 1, 1,
0.1448387, 0.6400128, 0.401014, 0, 0.6235294, 1, 1,
0.1514339, -1.229202, 1.451389, 0, 0.6156863, 1, 1,
0.1515645, -0.3091107, 1.200132, 0, 0.6117647, 1, 1,
0.1528049, 1.155941, 1.713817, 0, 0.6039216, 1, 1,
0.1532019, -1.628981, 2.756887, 0, 0.5960785, 1, 1,
0.1532198, 0.5303131, 1.461359, 0, 0.5921569, 1, 1,
0.1534008, -1.38824, 3.525531, 0, 0.5843138, 1, 1,
0.1548692, -1.055202, 1.599727, 0, 0.5803922, 1, 1,
0.1589033, -2.094313, 3.493465, 0, 0.572549, 1, 1,
0.1598441, 0.104865, -0.09459714, 0, 0.5686275, 1, 1,
0.1629218, -1.034293, 3.856989, 0, 0.5607843, 1, 1,
0.1631273, 0.03926773, 1.687735, 0, 0.5568628, 1, 1,
0.1661863, -1.608063, 3.177316, 0, 0.5490196, 1, 1,
0.1669408, 0.751012, -1.191317, 0, 0.5450981, 1, 1,
0.168085, 0.5475587, -1.219758, 0, 0.5372549, 1, 1,
0.1683085, 0.6532725, 1.55943, 0, 0.5333334, 1, 1,
0.1711926, -0.233409, 3.50303, 0, 0.5254902, 1, 1,
0.1759042, 0.5576873, -0.1653954, 0, 0.5215687, 1, 1,
0.1820159, -1.509428, 0.9780884, 0, 0.5137255, 1, 1,
0.1848182, 0.9121597, 2.091823, 0, 0.509804, 1, 1,
0.1871087, -0.8906552, 2.33189, 0, 0.5019608, 1, 1,
0.1872229, -0.557205, 2.583611, 0, 0.4941176, 1, 1,
0.1880964, 1.004712, 1.837057, 0, 0.4901961, 1, 1,
0.1882978, 1.964059, 1.456807, 0, 0.4823529, 1, 1,
0.1941792, -2.563688, 4.278608, 0, 0.4784314, 1, 1,
0.2007418, -0.4268467, 3.900637, 0, 0.4705882, 1, 1,
0.201175, -0.8220865, 3.466455, 0, 0.4666667, 1, 1,
0.2027372, -0.8981454, 3.379254, 0, 0.4588235, 1, 1,
0.2032548, 1.145686, -0.9950722, 0, 0.454902, 1, 1,
0.2070263, -1.147382, 1.688525, 0, 0.4470588, 1, 1,
0.210007, 1.019366, 1.005106, 0, 0.4431373, 1, 1,
0.2118894, -1.619517, 4.193274, 0, 0.4352941, 1, 1,
0.2127825, 1.096381, -0.7851983, 0, 0.4313726, 1, 1,
0.213286, 0.2219776, 1.05348, 0, 0.4235294, 1, 1,
0.2150446, 1.416559, 1.249218, 0, 0.4196078, 1, 1,
0.2154449, -0.3021585, 2.910743, 0, 0.4117647, 1, 1,
0.217483, -0.9375514, 1.730037, 0, 0.4078431, 1, 1,
0.2188566, -0.02263918, -0.02725401, 0, 0.4, 1, 1,
0.2188926, 0.3971056, 0.8049406, 0, 0.3921569, 1, 1,
0.2193924, 0.5013356, 1.530874, 0, 0.3882353, 1, 1,
0.2254408, 0.8812024, 0.5683914, 0, 0.3803922, 1, 1,
0.2294771, -0.3336242, 1.697482, 0, 0.3764706, 1, 1,
0.2335006, 0.3897074, 0.9595096, 0, 0.3686275, 1, 1,
0.2364895, 0.7522584, 0.8589646, 0, 0.3647059, 1, 1,
0.2367442, -0.01397895, 0.7629005, 0, 0.3568628, 1, 1,
0.2424529, 2.400139, 0.3471191, 0, 0.3529412, 1, 1,
0.2429681, -0.6066488, 2.701507, 0, 0.345098, 1, 1,
0.2458733, -0.03596373, 2.289023, 0, 0.3411765, 1, 1,
0.247939, -1.383684, 3.497111, 0, 0.3333333, 1, 1,
0.2482361, 0.2440463, 1.079771, 0, 0.3294118, 1, 1,
0.2497703, 0.03432839, 1.073667, 0, 0.3215686, 1, 1,
0.2497788, -1.063579, 4.667743, 0, 0.3176471, 1, 1,
0.2506232, -2.233685, 1.924152, 0, 0.3098039, 1, 1,
0.2546534, 2.9818, 0.189124, 0, 0.3058824, 1, 1,
0.2546944, -2.400902, 2.525412, 0, 0.2980392, 1, 1,
0.2565071, 0.6238163, 0.8065535, 0, 0.2901961, 1, 1,
0.2605835, -0.5569263, 2.855721, 0, 0.2862745, 1, 1,
0.263302, 0.1107167, -1.134527, 0, 0.2784314, 1, 1,
0.2635947, 0.6110676, 0.5670095, 0, 0.2745098, 1, 1,
0.2664392, 0.6486742, 0.8451854, 0, 0.2666667, 1, 1,
0.2684146, -1.428739, 4.340373, 0, 0.2627451, 1, 1,
0.2802816, -0.2282206, 2.774636, 0, 0.254902, 1, 1,
0.2815467, 0.3825443, 1.980989, 0, 0.2509804, 1, 1,
0.282433, 1.231854, 1.406939, 0, 0.2431373, 1, 1,
0.2832545, 1.016793, -0.765084, 0, 0.2392157, 1, 1,
0.2904065, 0.3391681, -0.1162611, 0, 0.2313726, 1, 1,
0.2905652, -0.1784855, 3.262637, 0, 0.227451, 1, 1,
0.2948083, 0.490785, 0.5465983, 0, 0.2196078, 1, 1,
0.2997569, -1.775288, 2.592921, 0, 0.2156863, 1, 1,
0.3020259, 0.809927, 1.58934, 0, 0.2078431, 1, 1,
0.3021554, -0.8705835, 3.863466, 0, 0.2039216, 1, 1,
0.3058912, 0.9235661, 1.377631, 0, 0.1960784, 1, 1,
0.3086539, -0.08311725, 1.804205, 0, 0.1882353, 1, 1,
0.3123037, 0.02800524, 0.9007099, 0, 0.1843137, 1, 1,
0.315081, -1.333703, 3.135505, 0, 0.1764706, 1, 1,
0.316312, -1.840715, 1.373286, 0, 0.172549, 1, 1,
0.3172717, -0.6911141, 2.651656, 0, 0.1647059, 1, 1,
0.3217135, 0.3859971, 0.7984459, 0, 0.1607843, 1, 1,
0.3268548, -0.4352962, 1.068184, 0, 0.1529412, 1, 1,
0.3300703, 2.338675, 0.552976, 0, 0.1490196, 1, 1,
0.3331263, 0.6880577, 0.1517926, 0, 0.1411765, 1, 1,
0.334781, 1.014592, -1.007937, 0, 0.1372549, 1, 1,
0.3351253, -1.04917, 2.276397, 0, 0.1294118, 1, 1,
0.3381548, 1.172357, 1.172813, 0, 0.1254902, 1, 1,
0.3417395, 2.837453, -1.822281, 0, 0.1176471, 1, 1,
0.3420194, 1.152729, 1.159991, 0, 0.1137255, 1, 1,
0.342553, 0.3146234, 0.4759017, 0, 0.1058824, 1, 1,
0.3435031, -1.243322, 1.747227, 0, 0.09803922, 1, 1,
0.3507013, -1.220491, 2.872345, 0, 0.09411765, 1, 1,
0.3518005, 0.04187537, 0.7866017, 0, 0.08627451, 1, 1,
0.3549109, -0.2713834, 1.283957, 0, 0.08235294, 1, 1,
0.3592839, 0.7138383, -0.1360464, 0, 0.07450981, 1, 1,
0.3597062, -0.9667352, 2.636736, 0, 0.07058824, 1, 1,
0.3609134, -0.232636, 0.9982651, 0, 0.0627451, 1, 1,
0.3621097, 0.1669094, 2.35091, 0, 0.05882353, 1, 1,
0.3637407, 0.08089598, 1.46146, 0, 0.05098039, 1, 1,
0.364151, 0.7718797, 2.061891, 0, 0.04705882, 1, 1,
0.369837, 0.7831267, -1.001539, 0, 0.03921569, 1, 1,
0.371786, -0.7660185, 3.408412, 0, 0.03529412, 1, 1,
0.3726266, 0.5289372, 1.96426, 0, 0.02745098, 1, 1,
0.3733771, 1.963302, -2.324935, 0, 0.02352941, 1, 1,
0.3738525, -0.6766781, 2.785381, 0, 0.01568628, 1, 1,
0.3768469, 1.900618, -0.2531576, 0, 0.01176471, 1, 1,
0.3778374, -0.4842254, -1.302276, 0, 0.003921569, 1, 1,
0.3790361, -0.2510309, 1.528666, 0.003921569, 0, 1, 1,
0.3820705, -0.03424329, 3.155812, 0.007843138, 0, 1, 1,
0.3917856, 0.6922004, -2.13273, 0.01568628, 0, 1, 1,
0.3926619, 1.531853, -0.113401, 0.01960784, 0, 1, 1,
0.3955196, 0.3843122, 3.36575, 0.02745098, 0, 1, 1,
0.397773, -1.148885, 1.827532, 0.03137255, 0, 1, 1,
0.4031889, -0.3312688, 2.796903, 0.03921569, 0, 1, 1,
0.4037291, 0.878822, -0.06968776, 0.04313726, 0, 1, 1,
0.40398, 0.9253758, 0.6484088, 0.05098039, 0, 1, 1,
0.407192, -1.766188, 2.630665, 0.05490196, 0, 1, 1,
0.4099768, 1.56507, 0.3092643, 0.0627451, 0, 1, 1,
0.4112978, -0.3511103, 0.9887115, 0.06666667, 0, 1, 1,
0.4123571, 1.26388, -1.12747, 0.07450981, 0, 1, 1,
0.4177826, -1.080166, 1.596838, 0.07843138, 0, 1, 1,
0.4223462, -0.118916, 0.6940497, 0.08627451, 0, 1, 1,
0.4298441, 0.2428134, 1.094213, 0.09019608, 0, 1, 1,
0.4338422, 0.795199, 0.2369478, 0.09803922, 0, 1, 1,
0.4351999, -0.5795322, 3.312084, 0.1058824, 0, 1, 1,
0.4360769, 2.041755, 0.7413767, 0.1098039, 0, 1, 1,
0.4409647, 0.8454409, 0.9863986, 0.1176471, 0, 1, 1,
0.4419892, -0.290182, 1.256785, 0.1215686, 0, 1, 1,
0.4449357, 0.7975429, -0.07236017, 0.1294118, 0, 1, 1,
0.4453671, -0.162567, 1.627558, 0.1333333, 0, 1, 1,
0.448999, 0.9829136, -0.8842279, 0.1411765, 0, 1, 1,
0.4501702, 0.4903063, 1.003572, 0.145098, 0, 1, 1,
0.4550437, 0.4575146, 0.5036238, 0.1529412, 0, 1, 1,
0.4565687, -0.4788425, 1.998361, 0.1568628, 0, 1, 1,
0.4570728, -0.8161749, 2.440967, 0.1647059, 0, 1, 1,
0.4625739, 0.540608, -0.7569, 0.1686275, 0, 1, 1,
0.4635136, -1.189069, 3.067085, 0.1764706, 0, 1, 1,
0.464691, 0.5584552, 2.28974, 0.1803922, 0, 1, 1,
0.4670736, -0.2727707, 1.837303, 0.1882353, 0, 1, 1,
0.4717667, -1.232614, 3.953062, 0.1921569, 0, 1, 1,
0.4718597, 0.1396416, -0.7234065, 0.2, 0, 1, 1,
0.4742764, 0.6263769, -0.6645997, 0.2078431, 0, 1, 1,
0.4751163, 0.7296072, 0.2712659, 0.2117647, 0, 1, 1,
0.4797984, 1.169385, -0.07419985, 0.2196078, 0, 1, 1,
0.4840781, 0.00357644, 1.482528, 0.2235294, 0, 1, 1,
0.4894161, 1.096093, 0.6634391, 0.2313726, 0, 1, 1,
0.4997993, -0.07228569, 1.923553, 0.2352941, 0, 1, 1,
0.5003012, 0.5713176, 2.08924, 0.2431373, 0, 1, 1,
0.501304, -0.08682729, 2.782139, 0.2470588, 0, 1, 1,
0.5018136, -0.3247972, 2.077357, 0.254902, 0, 1, 1,
0.5027633, -0.7503266, 3.36366, 0.2588235, 0, 1, 1,
0.5085211, 0.5947253, 1.525821, 0.2666667, 0, 1, 1,
0.5103229, -0.3097954, 1.867526, 0.2705882, 0, 1, 1,
0.5103768, -0.4825592, 1.678985, 0.2784314, 0, 1, 1,
0.5157039, 0.5891514, 1.693156, 0.282353, 0, 1, 1,
0.5235484, -0.4056796, 3.571136, 0.2901961, 0, 1, 1,
0.5238618, -0.2725292, 3.053402, 0.2941177, 0, 1, 1,
0.5259228, -1.705862, 2.231946, 0.3019608, 0, 1, 1,
0.5288265, 0.5228522, 0.1177917, 0.3098039, 0, 1, 1,
0.5329831, 0.4003576, 1.831742, 0.3137255, 0, 1, 1,
0.5376747, -1.587952, 1.66736, 0.3215686, 0, 1, 1,
0.5431178, 0.5511464, 0.2513608, 0.3254902, 0, 1, 1,
0.545382, -0.5766708, 1.562268, 0.3333333, 0, 1, 1,
0.5470331, -1.652867, 2.839768, 0.3372549, 0, 1, 1,
0.549184, 0.1224537, 0.6830254, 0.345098, 0, 1, 1,
0.5549668, 1.25615, 0.5455612, 0.3490196, 0, 1, 1,
0.558635, -0.9915844, 1.171486, 0.3568628, 0, 1, 1,
0.5586894, 0.6583961, 2.573645, 0.3607843, 0, 1, 1,
0.5612946, -1.428581, 2.174482, 0.3686275, 0, 1, 1,
0.5637294, 0.6545113, 0.08968163, 0.372549, 0, 1, 1,
0.5674684, -1.215824, 3.270722, 0.3803922, 0, 1, 1,
0.5798996, -1.238254, 0.7768112, 0.3843137, 0, 1, 1,
0.5819272, 0.7875068, -0.02401412, 0.3921569, 0, 1, 1,
0.5843399, 1.396227, 0.6352429, 0.3960784, 0, 1, 1,
0.587207, 0.1732946, 1.577783, 0.4039216, 0, 1, 1,
0.6000177, 0.7864035, 2.295698, 0.4117647, 0, 1, 1,
0.6016371, 0.6397832, 0.09201945, 0.4156863, 0, 1, 1,
0.6067439, 0.1883294, 1.589218, 0.4235294, 0, 1, 1,
0.6098717, 0.3900985, -0.565084, 0.427451, 0, 1, 1,
0.610686, -0.1684657, 1.643719, 0.4352941, 0, 1, 1,
0.6171578, 1.257144, 0.2934723, 0.4392157, 0, 1, 1,
0.6232712, 1.509863, 0.7899187, 0.4470588, 0, 1, 1,
0.6265864, 0.9080035, -0.8258746, 0.4509804, 0, 1, 1,
0.6299725, 1.593668, -0.696857, 0.4588235, 0, 1, 1,
0.6302644, -1.228969, 3.127112, 0.4627451, 0, 1, 1,
0.6312006, -0.7050936, 1.608765, 0.4705882, 0, 1, 1,
0.6336672, 1.344045, 0.228404, 0.4745098, 0, 1, 1,
0.6429152, -0.8889534, 0.2893897, 0.4823529, 0, 1, 1,
0.6510364, -0.3584417, 2.037781, 0.4862745, 0, 1, 1,
0.6564749, 0.8710783, 0.04235103, 0.4941176, 0, 1, 1,
0.6626857, -0.9937515, 1.836065, 0.5019608, 0, 1, 1,
0.6675173, 1.047742, -0.5773407, 0.5058824, 0, 1, 1,
0.6707419, 0.03225132, -0.2995727, 0.5137255, 0, 1, 1,
0.6741979, -1.106946, 3.146742, 0.5176471, 0, 1, 1,
0.689152, -1.222901, 2.848362, 0.5254902, 0, 1, 1,
0.6940313, -0.003704034, 2.762614, 0.5294118, 0, 1, 1,
0.7001724, 0.8131213, 0.2409106, 0.5372549, 0, 1, 1,
0.7012801, 0.1960939, 1.303544, 0.5411765, 0, 1, 1,
0.7039433, 1.064002, 0.8506593, 0.5490196, 0, 1, 1,
0.7056213, 0.4455153, 2.062768, 0.5529412, 0, 1, 1,
0.708133, -1.067908, 0.7062972, 0.5607843, 0, 1, 1,
0.7125621, -0.5182512, 0.5022195, 0.5647059, 0, 1, 1,
0.7141068, -1.626155, 2.281259, 0.572549, 0, 1, 1,
0.7160656, 0.4300812, 1.81681, 0.5764706, 0, 1, 1,
0.7165908, -0.5794635, 1.721496, 0.5843138, 0, 1, 1,
0.7173319, 0.2124064, -0.3566327, 0.5882353, 0, 1, 1,
0.7215663, 0.5061878, 2.572304, 0.5960785, 0, 1, 1,
0.7260669, -1.135831, 1.475494, 0.6039216, 0, 1, 1,
0.7328565, 1.534055, -0.05051353, 0.6078432, 0, 1, 1,
0.7441676, -0.1058212, 2.344579, 0.6156863, 0, 1, 1,
0.74679, 1.364037, -0.292851, 0.6196079, 0, 1, 1,
0.7498055, 0.4478488, -0.2109903, 0.627451, 0, 1, 1,
0.7512935, 0.1298451, 2.161765, 0.6313726, 0, 1, 1,
0.7559561, 0.5837386, 1.015957, 0.6392157, 0, 1, 1,
0.7631229, 0.4612038, 1.155782, 0.6431373, 0, 1, 1,
0.7632086, 0.3365467, 0.3206184, 0.6509804, 0, 1, 1,
0.7654479, 0.2544056, 2.420228, 0.654902, 0, 1, 1,
0.7657623, -0.2743451, 2.644014, 0.6627451, 0, 1, 1,
0.7674248, 0.2067198, -0.547433, 0.6666667, 0, 1, 1,
0.7685686, -0.4521252, 3.425179, 0.6745098, 0, 1, 1,
0.7721869, -0.4584412, 0.7246467, 0.6784314, 0, 1, 1,
0.7738547, -0.6553405, 4.376459, 0.6862745, 0, 1, 1,
0.7782027, 1.408834, -0.7342874, 0.6901961, 0, 1, 1,
0.782231, 0.6763061, 0.03079503, 0.6980392, 0, 1, 1,
0.7831488, 0.5401448, 0.6096814, 0.7058824, 0, 1, 1,
0.785254, 1.726809, -0.5923097, 0.7098039, 0, 1, 1,
0.795372, 1.620692, 0.5076261, 0.7176471, 0, 1, 1,
0.7988918, 1.609778, 1.992877, 0.7215686, 0, 1, 1,
0.8002377, -0.914783, 1.280208, 0.7294118, 0, 1, 1,
0.8003468, -0.279155, 1.461134, 0.7333333, 0, 1, 1,
0.8009028, 0.3779273, 2.076569, 0.7411765, 0, 1, 1,
0.8072834, -0.2618287, 1.295602, 0.7450981, 0, 1, 1,
0.8106506, -1.004513, 1.570635, 0.7529412, 0, 1, 1,
0.81526, -0.758972, 2.487512, 0.7568628, 0, 1, 1,
0.8169097, 1.258206, 0.9630773, 0.7647059, 0, 1, 1,
0.8192585, 1.203968, -0.2019038, 0.7686275, 0, 1, 1,
0.82296, 1.203331, 1.875385, 0.7764706, 0, 1, 1,
0.8261825, -0.06271461, 0.5768265, 0.7803922, 0, 1, 1,
0.8277284, -2.351523, 1.588263, 0.7882353, 0, 1, 1,
0.8336313, 1.912523, 1.675893, 0.7921569, 0, 1, 1,
0.8340337, -0.346135, 2.591471, 0.8, 0, 1, 1,
0.8404728, -0.1000072, 2.568611, 0.8078431, 0, 1, 1,
0.8410953, -0.9349014, 1.835826, 0.8117647, 0, 1, 1,
0.8420643, 1.142237, 0.3031119, 0.8196079, 0, 1, 1,
0.8448979, -0.3210206, 0.3647537, 0.8235294, 0, 1, 1,
0.8480662, 1.722634, 0.7020727, 0.8313726, 0, 1, 1,
0.8511186, -2.460686, 2.092242, 0.8352941, 0, 1, 1,
0.8540391, 0.3198236, 0.8977799, 0.8431373, 0, 1, 1,
0.8542693, 0.2008143, 1.608437, 0.8470588, 0, 1, 1,
0.8563968, -0.6138324, 3.560989, 0.854902, 0, 1, 1,
0.8572588, 2.154604, 1.122456, 0.8588235, 0, 1, 1,
0.8586103, 1.134393, 0.6432196, 0.8666667, 0, 1, 1,
0.8618432, 0.5487524, 0.431693, 0.8705882, 0, 1, 1,
0.864511, 1.10152, 0.2089535, 0.8784314, 0, 1, 1,
0.8822873, -0.653057, 1.315065, 0.8823529, 0, 1, 1,
0.8857109, -0.6152843, 1.939116, 0.8901961, 0, 1, 1,
0.8912122, 0.5132926, 0.3375327, 0.8941177, 0, 1, 1,
0.8956128, -2.005348, 3.067279, 0.9019608, 0, 1, 1,
0.8968706, 1.176318, 1.136309, 0.9098039, 0, 1, 1,
0.8980849, -0.09552927, 1.303881, 0.9137255, 0, 1, 1,
0.914454, -0.5167524, 1.664213, 0.9215686, 0, 1, 1,
0.9153516, -0.4963338, 3.00429, 0.9254902, 0, 1, 1,
0.9223749, -1.60878, 3.134539, 0.9333333, 0, 1, 1,
0.9236101, 0.733734, 1.130845, 0.9372549, 0, 1, 1,
0.9243387, 1.435356, -0.3565071, 0.945098, 0, 1, 1,
0.9346281, 0.709193, 0.3693513, 0.9490196, 0, 1, 1,
0.9365005, -0.3725817, 0.6551376, 0.9568627, 0, 1, 1,
0.9373193, -0.06062692, 2.75914, 0.9607843, 0, 1, 1,
0.9388312, -0.9337893, 2.870784, 0.9686275, 0, 1, 1,
0.938952, -0.9830403, 3.641812, 0.972549, 0, 1, 1,
0.9478365, -0.4864656, 2.664084, 0.9803922, 0, 1, 1,
0.9485535, 0.7238901, 2.14979, 0.9843137, 0, 1, 1,
0.9494836, 0.1195896, 1.713931, 0.9921569, 0, 1, 1,
0.9548807, 0.03578493, 0.6525826, 0.9960784, 0, 1, 1,
0.9585305, 2.421188, 0.2176966, 1, 0, 0.9960784, 1,
0.9689569, -0.1089398, 1.00478, 1, 0, 0.9882353, 1,
0.9757609, 0.5375412, 1.441728, 1, 0, 0.9843137, 1,
0.9842203, -0.330353, 4.074495, 1, 0, 0.9764706, 1,
0.9849735, 0.1151469, 0.7142853, 1, 0, 0.972549, 1,
0.9850411, 0.5689657, -0.4379122, 1, 0, 0.9647059, 1,
0.9850907, 2.307087, -0.5745453, 1, 0, 0.9607843, 1,
1.004906, 1.201592, -0.1481051, 1, 0, 0.9529412, 1,
1.007254, -0.823732, 1.169036, 1, 0, 0.9490196, 1,
1.007268, -0.5108048, 3.076891, 1, 0, 0.9411765, 1,
1.012382, -1.457891, 3.240262, 1, 0, 0.9372549, 1,
1.014298, 1.3035, 0.6220504, 1, 0, 0.9294118, 1,
1.018028, -2.036523, 1.982956, 1, 0, 0.9254902, 1,
1.019859, 0.1967945, 1.768563, 1, 0, 0.9176471, 1,
1.031517, -0.7406, 2.287246, 1, 0, 0.9137255, 1,
1.036165, -1.013629, 1.446039, 1, 0, 0.9058824, 1,
1.036883, -0.9587294, 0.9090563, 1, 0, 0.9019608, 1,
1.040747, 0.1879618, 0.1077426, 1, 0, 0.8941177, 1,
1.043291, -0.158458, 1.498362, 1, 0, 0.8862745, 1,
1.052534, -1.296224, 4.000672, 1, 0, 0.8823529, 1,
1.055011, -0.5904387, 1.599921, 1, 0, 0.8745098, 1,
1.057104, -0.8397485, 2.146065, 1, 0, 0.8705882, 1,
1.061633, 1.168108, 0.8759464, 1, 0, 0.8627451, 1,
1.065523, -1.679104, 2.009465, 1, 0, 0.8588235, 1,
1.078631, 0.78513, 2.200908, 1, 0, 0.8509804, 1,
1.082409, -0.9192203, 3.679797, 1, 0, 0.8470588, 1,
1.088756, 1.034063, 2.443779, 1, 0, 0.8392157, 1,
1.089744, 0.2410263, 0.8838214, 1, 0, 0.8352941, 1,
1.091003, -1.013062, 2.428086, 1, 0, 0.827451, 1,
1.097451, -0.4791109, 2.87995, 1, 0, 0.8235294, 1,
1.103857, -2.541541, 2.099143, 1, 0, 0.8156863, 1,
1.10402, -0.7139328, 3.24603, 1, 0, 0.8117647, 1,
1.110248, 0.037597, 0.7549499, 1, 0, 0.8039216, 1,
1.112303, -0.11615, 1.016924, 1, 0, 0.7960784, 1,
1.120224, -1.804943, 3.476972, 1, 0, 0.7921569, 1,
1.121247, 1.730309, 2.086896, 1, 0, 0.7843137, 1,
1.123127, -1.283122, 1.079753, 1, 0, 0.7803922, 1,
1.128724, -0.983398, 2.486352, 1, 0, 0.772549, 1,
1.129122, -0.8871589, 2.081138, 1, 0, 0.7686275, 1,
1.12922, 0.2263126, 0.2731883, 1, 0, 0.7607843, 1,
1.136009, 0.0676457, 1.32068, 1, 0, 0.7568628, 1,
1.145532, -0.9078568, 1.700024, 1, 0, 0.7490196, 1,
1.148817, -0.6591383, 0.7584099, 1, 0, 0.7450981, 1,
1.152747, 1.252716, 0.2798612, 1, 0, 0.7372549, 1,
1.166579, -0.4577747, 2.177331, 1, 0, 0.7333333, 1,
1.168771, -0.7194325, 1.174765, 1, 0, 0.7254902, 1,
1.177011, -1.329543, 0.6945269, 1, 0, 0.7215686, 1,
1.18239, -0.4892125, 3.239248, 1, 0, 0.7137255, 1,
1.183427, -0.2136764, 2.387609, 1, 0, 0.7098039, 1,
1.183492, 1.322536, 0.5375413, 1, 0, 0.7019608, 1,
1.194314, 0.2005568, 1.202905, 1, 0, 0.6941177, 1,
1.197693, 1.941051, 0.5592881, 1, 0, 0.6901961, 1,
1.199178, -0.3879818, 1.845939, 1, 0, 0.682353, 1,
1.19944, 0.5076647, 0.5054909, 1, 0, 0.6784314, 1,
1.20279, -1.295602, 2.798462, 1, 0, 0.6705883, 1,
1.20473, -0.6541855, 3.116533, 1, 0, 0.6666667, 1,
1.206423, 0.06518304, 2.815498, 1, 0, 0.6588235, 1,
1.209114, 0.8621863, 1.627506, 1, 0, 0.654902, 1,
1.212001, -1.334391, 2.678383, 1, 0, 0.6470588, 1,
1.213521, -0.2624147, 2.235797, 1, 0, 0.6431373, 1,
1.214192, 0.773516, 1.616657, 1, 0, 0.6352941, 1,
1.226181, 0.1913804, 1.180333, 1, 0, 0.6313726, 1,
1.234797, -1.648652, 3.19118, 1, 0, 0.6235294, 1,
1.242658, -0.4352864, 0.5503311, 1, 0, 0.6196079, 1,
1.248022, -1.940265, 1.300522, 1, 0, 0.6117647, 1,
1.251706, -0.5665443, 2.559859, 1, 0, 0.6078432, 1,
1.276352, -0.6766725, 1.72741, 1, 0, 0.6, 1,
1.279145, -1.377626, 2.879901, 1, 0, 0.5921569, 1,
1.286428, 2.195657, 1.83746, 1, 0, 0.5882353, 1,
1.29487, 1.012826, -0.4633742, 1, 0, 0.5803922, 1,
1.300087, -0.3155065, 1.186314, 1, 0, 0.5764706, 1,
1.312706, -0.5789357, 2.476814, 1, 0, 0.5686275, 1,
1.315329, -0.6171458, 1.461794, 1, 0, 0.5647059, 1,
1.319095, -0.519003, 2.739028, 1, 0, 0.5568628, 1,
1.32016, -0.1454586, -0.4072953, 1, 0, 0.5529412, 1,
1.32915, 1.216779, 0.5978816, 1, 0, 0.5450981, 1,
1.341416, -0.5991992, 2.591769, 1, 0, 0.5411765, 1,
1.345569, -1.762446, 1.057776, 1, 0, 0.5333334, 1,
1.348409, -1.243849, 1.439962, 1, 0, 0.5294118, 1,
1.35794, 1.382951, 0.2748244, 1, 0, 0.5215687, 1,
1.361287, 0.3324412, 0.7035487, 1, 0, 0.5176471, 1,
1.369117, 0.6731626, -0.4267009, 1, 0, 0.509804, 1,
1.383525, -0.8782756, 3.966232, 1, 0, 0.5058824, 1,
1.390083, -0.1404835, 2.513033, 1, 0, 0.4980392, 1,
1.391397, -0.6555141, 0.6750885, 1, 0, 0.4901961, 1,
1.399388, -1.685747, 1.974153, 1, 0, 0.4862745, 1,
1.401429, -0.8400403, 2.181897, 1, 0, 0.4784314, 1,
1.405397, -1.241424, 1.60147, 1, 0, 0.4745098, 1,
1.417298, -1.289349, 2.698595, 1, 0, 0.4666667, 1,
1.427428, 0.9236782, 0.7965168, 1, 0, 0.4627451, 1,
1.435079, -1.612853, 3.139958, 1, 0, 0.454902, 1,
1.450794, 1.545304, 2.380571, 1, 0, 0.4509804, 1,
1.462205, -2.259819, 3.500726, 1, 0, 0.4431373, 1,
1.473788, 2.148441, 0.9800096, 1, 0, 0.4392157, 1,
1.477495, 0.5065927, 2.123791, 1, 0, 0.4313726, 1,
1.48001, 0.1023032, 0.3427894, 1, 0, 0.427451, 1,
1.481055, -0.9808547, 1.426657, 1, 0, 0.4196078, 1,
1.494632, -0.5107384, 3.159015, 1, 0, 0.4156863, 1,
1.502571, 1.592169, 1.483606, 1, 0, 0.4078431, 1,
1.504059, 0.4201703, -0.07400386, 1, 0, 0.4039216, 1,
1.504268, 0.9263295, -0.7922803, 1, 0, 0.3960784, 1,
1.507728, 0.2186142, 1.619995, 1, 0, 0.3882353, 1,
1.512705, -0.01322828, 0.9642099, 1, 0, 0.3843137, 1,
1.514139, -1.24463, 3.291298, 1, 0, 0.3764706, 1,
1.519709, 0.8043066, 1.821009, 1, 0, 0.372549, 1,
1.521454, 0.2797275, 1.931008, 1, 0, 0.3647059, 1,
1.523859, -0.1131934, 1.879296, 1, 0, 0.3607843, 1,
1.530438, 0.7304047, 0.2772292, 1, 0, 0.3529412, 1,
1.534227, 1.979935, 0.6146776, 1, 0, 0.3490196, 1,
1.550085, 0.5843939, 1.583883, 1, 0, 0.3411765, 1,
1.552635, 0.252505, 3.87745, 1, 0, 0.3372549, 1,
1.566188, 1.401441, -0.6685138, 1, 0, 0.3294118, 1,
1.574058, -0.4467859, 0.9486174, 1, 0, 0.3254902, 1,
1.605078, 0.2367058, 0.4758685, 1, 0, 0.3176471, 1,
1.611373, 1.267267, 1.686934, 1, 0, 0.3137255, 1,
1.617356, -1.101196, -0.4626807, 1, 0, 0.3058824, 1,
1.630565, -1.508896, 1.806153, 1, 0, 0.2980392, 1,
1.636723, 1.234918, 0.6567941, 1, 0, 0.2941177, 1,
1.640775, -1.085653, 2.285747, 1, 0, 0.2862745, 1,
1.645623, -0.6891265, 1.411626, 1, 0, 0.282353, 1,
1.648796, 1.189112, 1.591258, 1, 0, 0.2745098, 1,
1.655839, 1.010608, 2.748215, 1, 0, 0.2705882, 1,
1.67876, 0.7746506, 2.461598, 1, 0, 0.2627451, 1,
1.690863, 0.8379555, 3.515416, 1, 0, 0.2588235, 1,
1.712888, 0.9560223, 0.8118942, 1, 0, 0.2509804, 1,
1.728807, -0.372578, 3.773789, 1, 0, 0.2470588, 1,
1.733159, 0.9817309, 1.34834, 1, 0, 0.2392157, 1,
1.74026, -0.00927117, 0.5010859, 1, 0, 0.2352941, 1,
1.742839, 0.06209979, 2.292392, 1, 0, 0.227451, 1,
1.764742, 0.01360823, 1.337888, 1, 0, 0.2235294, 1,
1.791022, 0.09091102, 0.1358537, 1, 0, 0.2156863, 1,
1.794738, 1.013397, 0.5751703, 1, 0, 0.2117647, 1,
1.825808, 0.1748821, 3.074279, 1, 0, 0.2039216, 1,
1.839434, 0.08975106, 2.681311, 1, 0, 0.1960784, 1,
1.860544, -0.2323122, 2.334289, 1, 0, 0.1921569, 1,
1.868095, 1.250921, -0.08849417, 1, 0, 0.1843137, 1,
1.869171, 0.1526023, 2.151869, 1, 0, 0.1803922, 1,
1.885904, 0.625337, 1.843832, 1, 0, 0.172549, 1,
1.889732, 0.1642473, 1.250141, 1, 0, 0.1686275, 1,
1.893718, -1.418851, 1.270284, 1, 0, 0.1607843, 1,
1.910193, 0.2095746, 0.1171228, 1, 0, 0.1568628, 1,
1.921381, 0.7075847, 3.605078, 1, 0, 0.1490196, 1,
1.93033, 1.722634, 2.093202, 1, 0, 0.145098, 1,
1.946993, -0.5980296, 1.537751, 1, 0, 0.1372549, 1,
1.967104, 0.304486, 0.9613228, 1, 0, 0.1333333, 1,
2.012531, 1.060187, 0.7214334, 1, 0, 0.1254902, 1,
2.018172, -0.16651, 2.380899, 1, 0, 0.1215686, 1,
2.058287, 1.136531, 2.572479, 1, 0, 0.1137255, 1,
2.095396, 0.2710342, 2.236525, 1, 0, 0.1098039, 1,
2.121479, 0.1646068, 0.9985973, 1, 0, 0.1019608, 1,
2.184122, 0.4912961, -0.1253239, 1, 0, 0.09411765, 1,
2.188102, 1.082817, 2.052573, 1, 0, 0.09019608, 1,
2.233586, -0.2118576, 1.831353, 1, 0, 0.08235294, 1,
2.291986, 0.1999347, 1.658554, 1, 0, 0.07843138, 1,
2.340866, 0.7667726, 2.632402, 1, 0, 0.07058824, 1,
2.353862, 1.063615, 1.218376, 1, 0, 0.06666667, 1,
2.412895, 0.07125314, 1.665182, 1, 0, 0.05882353, 1,
2.436818, 0.824197, 1.095709, 1, 0, 0.05490196, 1,
2.508406, 0.4944868, 2.898643, 1, 0, 0.04705882, 1,
2.532996, 1.517473, 0.2536913, 1, 0, 0.04313726, 1,
2.555646, -0.3269289, 2.807793, 1, 0, 0.03529412, 1,
2.580039, 0.5246075, 1.619198, 1, 0, 0.03137255, 1,
2.58323, 0.5954916, 1.586453, 1, 0, 0.02352941, 1,
2.627378, -0.01672416, 2.111667, 1, 0, 0.01960784, 1,
2.638748, -0.3096878, 0.07618285, 1, 0, 0.01176471, 1,
2.834372, -0.7214804, 2.208966, 1, 0, 0.007843138, 1
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
-0.3661003, -3.503648, -7.34552, 0, -0.5, 0.5, 0.5,
-0.3661003, -3.503648, -7.34552, 1, -0.5, 0.5, 0.5,
-0.3661003, -3.503648, -7.34552, 1, 1.5, 0.5, 0.5,
-0.3661003, -3.503648, -7.34552, 0, 1.5, 0.5, 0.5
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
-4.651533, 0.2090559, -7.34552, 0, -0.5, 0.5, 0.5,
-4.651533, 0.2090559, -7.34552, 1, -0.5, 0.5, 0.5,
-4.651533, 0.2090559, -7.34552, 1, 1.5, 0.5, 0.5,
-4.651533, 0.2090559, -7.34552, 0, 1.5, 0.5, 0.5
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
-4.651533, -3.503648, 0.1399248, 0, -0.5, 0.5, 0.5,
-4.651533, -3.503648, 0.1399248, 1, -0.5, 0.5, 0.5,
-4.651533, -3.503648, 0.1399248, 1, 1.5, 0.5, 0.5,
-4.651533, -3.503648, 0.1399248, 0, 1.5, 0.5, 0.5
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
-3, -2.64687, -5.61811,
2, -2.64687, -5.61811,
-3, -2.64687, -5.61811,
-3, -2.789667, -5.906012,
-2, -2.64687, -5.61811,
-2, -2.789667, -5.906012,
-1, -2.64687, -5.61811,
-1, -2.789667, -5.906012,
0, -2.64687, -5.61811,
0, -2.789667, -5.906012,
1, -2.64687, -5.61811,
1, -2.789667, -5.906012,
2, -2.64687, -5.61811,
2, -2.789667, -5.906012
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
-3, -3.075259, -6.481815, 0, -0.5, 0.5, 0.5,
-3, -3.075259, -6.481815, 1, -0.5, 0.5, 0.5,
-3, -3.075259, -6.481815, 1, 1.5, 0.5, 0.5,
-3, -3.075259, -6.481815, 0, 1.5, 0.5, 0.5,
-2, -3.075259, -6.481815, 0, -0.5, 0.5, 0.5,
-2, -3.075259, -6.481815, 1, -0.5, 0.5, 0.5,
-2, -3.075259, -6.481815, 1, 1.5, 0.5, 0.5,
-2, -3.075259, -6.481815, 0, 1.5, 0.5, 0.5,
-1, -3.075259, -6.481815, 0, -0.5, 0.5, 0.5,
-1, -3.075259, -6.481815, 1, -0.5, 0.5, 0.5,
-1, -3.075259, -6.481815, 1, 1.5, 0.5, 0.5,
-1, -3.075259, -6.481815, 0, 1.5, 0.5, 0.5,
0, -3.075259, -6.481815, 0, -0.5, 0.5, 0.5,
0, -3.075259, -6.481815, 1, -0.5, 0.5, 0.5,
0, -3.075259, -6.481815, 1, 1.5, 0.5, 0.5,
0, -3.075259, -6.481815, 0, 1.5, 0.5, 0.5,
1, -3.075259, -6.481815, 0, -0.5, 0.5, 0.5,
1, -3.075259, -6.481815, 1, -0.5, 0.5, 0.5,
1, -3.075259, -6.481815, 1, 1.5, 0.5, 0.5,
1, -3.075259, -6.481815, 0, 1.5, 0.5, 0.5,
2, -3.075259, -6.481815, 0, -0.5, 0.5, 0.5,
2, -3.075259, -6.481815, 1, -0.5, 0.5, 0.5,
2, -3.075259, -6.481815, 1, 1.5, 0.5, 0.5,
2, -3.075259, -6.481815, 0, 1.5, 0.5, 0.5
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
-3.662587, -2, -5.61811,
-3.662587, 2, -5.61811,
-3.662587, -2, -5.61811,
-3.827411, -2, -5.906012,
-3.662587, -1, -5.61811,
-3.827411, -1, -5.906012,
-3.662587, 0, -5.61811,
-3.827411, 0, -5.906012,
-3.662587, 1, -5.61811,
-3.827411, 1, -5.906012,
-3.662587, 2, -5.61811,
-3.827411, 2, -5.906012
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
-4.15706, -2, -6.481815, 0, -0.5, 0.5, 0.5,
-4.15706, -2, -6.481815, 1, -0.5, 0.5, 0.5,
-4.15706, -2, -6.481815, 1, 1.5, 0.5, 0.5,
-4.15706, -2, -6.481815, 0, 1.5, 0.5, 0.5,
-4.15706, -1, -6.481815, 0, -0.5, 0.5, 0.5,
-4.15706, -1, -6.481815, 1, -0.5, 0.5, 0.5,
-4.15706, -1, -6.481815, 1, 1.5, 0.5, 0.5,
-4.15706, -1, -6.481815, 0, 1.5, 0.5, 0.5,
-4.15706, 0, -6.481815, 0, -0.5, 0.5, 0.5,
-4.15706, 0, -6.481815, 1, -0.5, 0.5, 0.5,
-4.15706, 0, -6.481815, 1, 1.5, 0.5, 0.5,
-4.15706, 0, -6.481815, 0, 1.5, 0.5, 0.5,
-4.15706, 1, -6.481815, 0, -0.5, 0.5, 0.5,
-4.15706, 1, -6.481815, 1, -0.5, 0.5, 0.5,
-4.15706, 1, -6.481815, 1, 1.5, 0.5, 0.5,
-4.15706, 1, -6.481815, 0, 1.5, 0.5, 0.5,
-4.15706, 2, -6.481815, 0, -0.5, 0.5, 0.5,
-4.15706, 2, -6.481815, 1, -0.5, 0.5, 0.5,
-4.15706, 2, -6.481815, 1, 1.5, 0.5, 0.5,
-4.15706, 2, -6.481815, 0, 1.5, 0.5, 0.5
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
-3.662587, -2.64687, -4,
-3.662587, -2.64687, 4,
-3.662587, -2.64687, -4,
-3.827411, -2.789667, -4,
-3.662587, -2.64687, -2,
-3.827411, -2.789667, -2,
-3.662587, -2.64687, 0,
-3.827411, -2.789667, 0,
-3.662587, -2.64687, 2,
-3.827411, -2.789667, 2,
-3.662587, -2.64687, 4,
-3.827411, -2.789667, 4
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
-4.15706, -3.075259, -4, 0, -0.5, 0.5, 0.5,
-4.15706, -3.075259, -4, 1, -0.5, 0.5, 0.5,
-4.15706, -3.075259, -4, 1, 1.5, 0.5, 0.5,
-4.15706, -3.075259, -4, 0, 1.5, 0.5, 0.5,
-4.15706, -3.075259, -2, 0, -0.5, 0.5, 0.5,
-4.15706, -3.075259, -2, 1, -0.5, 0.5, 0.5,
-4.15706, -3.075259, -2, 1, 1.5, 0.5, 0.5,
-4.15706, -3.075259, -2, 0, 1.5, 0.5, 0.5,
-4.15706, -3.075259, 0, 0, -0.5, 0.5, 0.5,
-4.15706, -3.075259, 0, 1, -0.5, 0.5, 0.5,
-4.15706, -3.075259, 0, 1, 1.5, 0.5, 0.5,
-4.15706, -3.075259, 0, 0, 1.5, 0.5, 0.5,
-4.15706, -3.075259, 2, 0, -0.5, 0.5, 0.5,
-4.15706, -3.075259, 2, 1, -0.5, 0.5, 0.5,
-4.15706, -3.075259, 2, 1, 1.5, 0.5, 0.5,
-4.15706, -3.075259, 2, 0, 1.5, 0.5, 0.5,
-4.15706, -3.075259, 4, 0, -0.5, 0.5, 0.5,
-4.15706, -3.075259, 4, 1, -0.5, 0.5, 0.5,
-4.15706, -3.075259, 4, 1, 1.5, 0.5, 0.5,
-4.15706, -3.075259, 4, 0, 1.5, 0.5, 0.5
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
-3.662587, -2.64687, -5.61811,
-3.662587, 3.064982, -5.61811,
-3.662587, -2.64687, 5.89796,
-3.662587, 3.064982, 5.89796,
-3.662587, -2.64687, -5.61811,
-3.662587, -2.64687, 5.89796,
-3.662587, 3.064982, -5.61811,
-3.662587, 3.064982, 5.89796,
-3.662587, -2.64687, -5.61811,
2.930386, -2.64687, -5.61811,
-3.662587, -2.64687, 5.89796,
2.930386, -2.64687, 5.89796,
-3.662587, 3.064982, -5.61811,
2.930386, 3.064982, -5.61811,
-3.662587, 3.064982, 5.89796,
2.930386, 3.064982, 5.89796,
2.930386, -2.64687, -5.61811,
2.930386, 3.064982, -5.61811,
2.930386, -2.64687, 5.89796,
2.930386, 3.064982, 5.89796,
2.930386, -2.64687, -5.61811,
2.930386, -2.64687, 5.89796,
2.930386, 3.064982, -5.61811,
2.930386, 3.064982, 5.89796
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
var radius = 7.714354;
var distance = 34.32203;
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
mvMatrix.translate( 0.3661003, -0.2090559, -0.1399248 );
mvMatrix.scale( 1.265121, 1.460281, 0.7242845 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.32203);
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
fenpyroximate<-read.table("fenpyroximate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fenpyroximate$V2
```

```
## Error in eval(expr, envir, enclos): object 'fenpyroximate' not found
```

```r
y<-fenpyroximate$V3
```

```
## Error in eval(expr, envir, enclos): object 'fenpyroximate' not found
```

```r
z<-fenpyroximate$V4
```

```
## Error in eval(expr, envir, enclos): object 'fenpyroximate' not found
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
-3.566572, -0.001234747, -1.635879, 0, 0, 1, 1, 1,
-3.342725, 0.774423, -0.6944882, 1, 0, 0, 1, 1,
-3.017797, -0.8055349, -1.408929, 1, 0, 0, 1, 1,
-2.889808, 1.100442, -1.832994, 1, 0, 0, 1, 1,
-2.766089, 0.882623, -2.069432, 1, 0, 0, 1, 1,
-2.741354, -0.5378539, -0.741218, 1, 0, 0, 1, 1,
-2.536032, -0.2844333, -1.577874, 0, 0, 0, 1, 1,
-2.51975, -1.347132, -2.013137, 0, 0, 0, 1, 1,
-2.466044, 0.3082517, -0.5714831, 0, 0, 0, 1, 1,
-2.449852, -1.461498, -1.259454, 0, 0, 0, 1, 1,
-2.354346, 1.228335, -1.030364, 0, 0, 0, 1, 1,
-2.339697, -0.2519484, -2.854439, 0, 0, 0, 1, 1,
-2.327363, 0.6574282, -1.095557, 0, 0, 0, 1, 1,
-2.316637, 0.1645919, -0.1029552, 1, 1, 1, 1, 1,
-2.246619, 0.9881298, -1.006065, 1, 1, 1, 1, 1,
-2.181551, -0.5807304, -0.9521731, 1, 1, 1, 1, 1,
-2.166436, -1.069825, -1.658555, 1, 1, 1, 1, 1,
-2.14677, -0.9777194, -1.444368, 1, 1, 1, 1, 1,
-2.132643, -1.620309, -2.298141, 1, 1, 1, 1, 1,
-2.117045, -0.6269888, -1.969241, 1, 1, 1, 1, 1,
-2.10894, 0.8649342, 0.01383994, 1, 1, 1, 1, 1,
-2.098381, 0.08300481, -1.704629, 1, 1, 1, 1, 1,
-2.091943, -0.5473524, -2.173326, 1, 1, 1, 1, 1,
-2.081966, -0.8066142, -1.829346, 1, 1, 1, 1, 1,
-2.078433, 0.615079, -1.226403, 1, 1, 1, 1, 1,
-2.057491, -0.655596, -3.174149, 1, 1, 1, 1, 1,
-2.016005, 0.3589186, -1.272198, 1, 1, 1, 1, 1,
-2.009093, 1.905943, -0.8209991, 1, 1, 1, 1, 1,
-1.96259, -0.8890756, -1.413227, 0, 0, 1, 1, 1,
-1.961022, -1.412076, -0.7081529, 1, 0, 0, 1, 1,
-1.931356, 0.6063138, -2.044704, 1, 0, 0, 1, 1,
-1.901609, -0.2548865, -1.70027, 1, 0, 0, 1, 1,
-1.895413, -0.8429868, -3.768273, 1, 0, 0, 1, 1,
-1.871795, 1.506498, 0.6613247, 1, 0, 0, 1, 1,
-1.836297, -0.5037152, -1.727197, 0, 0, 0, 1, 1,
-1.834459, -1.269813, -2.371536, 0, 0, 0, 1, 1,
-1.828939, 0.8242767, -0.1807579, 0, 0, 0, 1, 1,
-1.816488, 0.2292637, -3.085399, 0, 0, 0, 1, 1,
-1.815296, 1.306834, -0.7688177, 0, 0, 0, 1, 1,
-1.814576, -0.2005652, -1.606348, 0, 0, 0, 1, 1,
-1.772857, -0.1702018, -1.70392, 0, 0, 0, 1, 1,
-1.75742, -0.2112166, -1.906634, 1, 1, 1, 1, 1,
-1.75044, -0.8300998, -0.4929679, 1, 1, 1, 1, 1,
-1.738432, 1.081854, -1.051845, 1, 1, 1, 1, 1,
-1.718962, -0.8704853, -4.321008, 1, 1, 1, 1, 1,
-1.698114, 0.7133621, -2.369679, 1, 1, 1, 1, 1,
-1.692585, -1.379123, -3.407669, 1, 1, 1, 1, 1,
-1.68618, -0.2619754, -2.124045, 1, 1, 1, 1, 1,
-1.660273, -0.4148761, -2.604031, 1, 1, 1, 1, 1,
-1.65093, -1.280079, -2.389382, 1, 1, 1, 1, 1,
-1.644641, 1.349124, -2.323942, 1, 1, 1, 1, 1,
-1.642038, -0.6862503, -1.152903, 1, 1, 1, 1, 1,
-1.639357, -0.597302, -1.863198, 1, 1, 1, 1, 1,
-1.639138, 1.291814, -0.5319463, 1, 1, 1, 1, 1,
-1.581097, 0.4584078, -1.606353, 1, 1, 1, 1, 1,
-1.577545, 0.1311668, -1.294896, 1, 1, 1, 1, 1,
-1.564299, 1.277019, -4.202151, 0, 0, 1, 1, 1,
-1.553869, -0.4864829, 0.04924959, 1, 0, 0, 1, 1,
-1.552063, -1.542957, -3.257306, 1, 0, 0, 1, 1,
-1.533785, 1.533474, 1.129195, 1, 0, 0, 1, 1,
-1.531882, 0.2740512, -2.008613, 1, 0, 0, 1, 1,
-1.524419, -0.8514121, -2.62106, 1, 0, 0, 1, 1,
-1.519903, 0.2452008, -2.980143, 0, 0, 0, 1, 1,
-1.50975, -1.473788, -3.613466, 0, 0, 0, 1, 1,
-1.503649, -1.383249, -3.766499, 0, 0, 0, 1, 1,
-1.498544, 1.427546, -1.382417, 0, 0, 0, 1, 1,
-1.497987, 0.03735151, -1.812483, 0, 0, 0, 1, 1,
-1.497777, -0.03908079, 0.9770231, 0, 0, 0, 1, 1,
-1.487734, -2.168433, -2.683696, 0, 0, 0, 1, 1,
-1.483187, 0.04066755, -2.227499, 1, 1, 1, 1, 1,
-1.477606, 0.6539778, 0.5701923, 1, 1, 1, 1, 1,
-1.472321, -1.181062, -1.500724, 1, 1, 1, 1, 1,
-1.46474, -0.7910607, -2.142789, 1, 1, 1, 1, 1,
-1.461128, 0.3386459, -0.4073387, 1, 1, 1, 1, 1,
-1.459827, 0.7477721, -0.6399735, 1, 1, 1, 1, 1,
-1.458584, 0.05303912, -3.806472, 1, 1, 1, 1, 1,
-1.424818, 0.3676748, -1.971267, 1, 1, 1, 1, 1,
-1.378032, -1.49947, -1.919139, 1, 1, 1, 1, 1,
-1.370179, -1.033712, -2.008845, 1, 1, 1, 1, 1,
-1.366485, -0.1234945, -3.266534, 1, 1, 1, 1, 1,
-1.34999, 1.239673, -0.7188163, 1, 1, 1, 1, 1,
-1.345473, 0.4937597, 0.5444016, 1, 1, 1, 1, 1,
-1.337374, 1.239488, -2.16187, 1, 1, 1, 1, 1,
-1.326124, 0.9031343, -0.06551483, 1, 1, 1, 1, 1,
-1.321696, 1.893192, -1.040268, 0, 0, 1, 1, 1,
-1.313731, -0.09682442, -3.232291, 1, 0, 0, 1, 1,
-1.303856, -0.413644, -2.682994, 1, 0, 0, 1, 1,
-1.303364, -1.922908, -3.025906, 1, 0, 0, 1, 1,
-1.287422, -1.969272, -1.215006, 1, 0, 0, 1, 1,
-1.275941, 0.5092824, -1.428452, 1, 0, 0, 1, 1,
-1.272792, -0.3367568, -3.554207, 0, 0, 0, 1, 1,
-1.266333, -0.3995206, -1.678589, 0, 0, 0, 1, 1,
-1.264831, 0.2869065, -2.052922, 0, 0, 0, 1, 1,
-1.258893, 2.309034, 0.1236499, 0, 0, 0, 1, 1,
-1.256059, 1.086883, -3.278802, 0, 0, 0, 1, 1,
-1.254497, -1.582787, -1.77346, 0, 0, 0, 1, 1,
-1.249875, 0.6669464, -2.289344, 0, 0, 0, 1, 1,
-1.248661, 0.9246429, -0.5984826, 1, 1, 1, 1, 1,
-1.244722, -0.09001193, -0.5179874, 1, 1, 1, 1, 1,
-1.244674, 2.470207, -0.8502194, 1, 1, 1, 1, 1,
-1.23877, 1.137553, -0.02504144, 1, 1, 1, 1, 1,
-1.238453, 0.8817317, -0.4968504, 1, 1, 1, 1, 1,
-1.233971, 1.556369, -0.5338122, 1, 1, 1, 1, 1,
-1.230887, 0.4726302, -0.4859634, 1, 1, 1, 1, 1,
-1.219484, 0.391792, -1.038862, 1, 1, 1, 1, 1,
-1.210115, 0.5355193, -0.3787066, 1, 1, 1, 1, 1,
-1.205539, 0.1871459, -0.549839, 1, 1, 1, 1, 1,
-1.204174, 1.795344, -0.536117, 1, 1, 1, 1, 1,
-1.19513, -1.297259, -2.117007, 1, 1, 1, 1, 1,
-1.194144, 1.252936, -1.660702, 1, 1, 1, 1, 1,
-1.189235, -1.247141, -2.169442, 1, 1, 1, 1, 1,
-1.180198, 0.1884269, -1.538549, 1, 1, 1, 1, 1,
-1.17602, 1.939134, -2.060318, 0, 0, 1, 1, 1,
-1.175845, -0.1278678, -2.291892, 1, 0, 0, 1, 1,
-1.165662, -1.448656, -3.51053, 1, 0, 0, 1, 1,
-1.165008, 0.1731328, -0.6826177, 1, 0, 0, 1, 1,
-1.157325, -0.3153977, -2.538632, 1, 0, 0, 1, 1,
-1.148361, 0.3476992, -0.220847, 1, 0, 0, 1, 1,
-1.14392, 1.255426, -0.02829853, 0, 0, 0, 1, 1,
-1.143403, 0.9227386, -0.5683013, 0, 0, 0, 1, 1,
-1.124293, 1.94797, -1.315752, 0, 0, 0, 1, 1,
-1.122665, -1.027619, -1.31605, 0, 0, 0, 1, 1,
-1.121516, -0.9329023, -1.039458, 0, 0, 0, 1, 1,
-1.120721, -0.02681373, -2.592971, 0, 0, 0, 1, 1,
-1.120256, 0.5910036, -1.174422, 0, 0, 0, 1, 1,
-1.115759, -1.279907, -2.818894, 1, 1, 1, 1, 1,
-1.11155, -1.08645, 0.06120284, 1, 1, 1, 1, 1,
-1.109021, 0.6419333, -0.03708549, 1, 1, 1, 1, 1,
-1.103599, -0.3283948, -2.340649, 1, 1, 1, 1, 1,
-1.101625, 0.6411314, -0.2867488, 1, 1, 1, 1, 1,
-1.097636, -0.3784668, -1.438361, 1, 1, 1, 1, 1,
-1.092719, 0.6477104, -2.207972, 1, 1, 1, 1, 1,
-1.091056, -0.2493824, -2.367569, 1, 1, 1, 1, 1,
-1.0893, -1.721995, -2.603364, 1, 1, 1, 1, 1,
-1.087401, 0.3317913, -1.487041, 1, 1, 1, 1, 1,
-1.080834, 0.5085027, 0.8761907, 1, 1, 1, 1, 1,
-1.079109, 0.6980336, -2.357695, 1, 1, 1, 1, 1,
-1.073157, 0.973759, -2.112769, 1, 1, 1, 1, 1,
-1.066904, -1.027982, -3.126641, 1, 1, 1, 1, 1,
-1.063235, -0.393177, -1.108272, 1, 1, 1, 1, 1,
-1.05879, 1.303986, -2.644488, 0, 0, 1, 1, 1,
-1.055724, -1.451895, -4.834395, 1, 0, 0, 1, 1,
-1.047415, -0.5027025, -1.220279, 1, 0, 0, 1, 1,
-1.047301, -1.948735, -2.118482, 1, 0, 0, 1, 1,
-1.046881, -0.941466, -1.540123, 1, 0, 0, 1, 1,
-1.04385, 1.101027, 0.4765221, 1, 0, 0, 1, 1,
-1.041066, 0.5686369, -2.26096, 0, 0, 0, 1, 1,
-1.040889, -0.8553842, -3.094817, 0, 0, 0, 1, 1,
-1.039962, 0.9224107, 0.9517461, 0, 0, 0, 1, 1,
-1.036999, -0.2398896, -2.345693, 0, 0, 0, 1, 1,
-1.036784, 0.7514904, 1.111083, 0, 0, 0, 1, 1,
-1.029823, -0.4971289, -0.5362113, 0, 0, 0, 1, 1,
-1.025353, 0.3777863, -1.462702, 0, 0, 0, 1, 1,
-1.020716, 0.1765655, -1.993879, 1, 1, 1, 1, 1,
-1.005401, -1.709454, -1.365505, 1, 1, 1, 1, 1,
-1.001444, -1.598346, -2.994443, 1, 1, 1, 1, 1,
-0.9980996, -0.2691367, -1.320313, 1, 1, 1, 1, 1,
-0.994061, -1.020497, -1.193233, 1, 1, 1, 1, 1,
-0.9596839, 0.1299461, -1.949665, 1, 1, 1, 1, 1,
-0.951461, 0.8319905, -2.200737, 1, 1, 1, 1, 1,
-0.9501863, -0.3172601, -2.343043, 1, 1, 1, 1, 1,
-0.9410737, 0.9989327, -0.05533459, 1, 1, 1, 1, 1,
-0.939492, 1.862227, -1.723631, 1, 1, 1, 1, 1,
-0.933081, 0.8985457, -2.492397, 1, 1, 1, 1, 1,
-0.9317027, -0.8892768, -1.988043, 1, 1, 1, 1, 1,
-0.9304016, -0.6760793, -1.456748, 1, 1, 1, 1, 1,
-0.9288684, -0.3675018, -1.869312, 1, 1, 1, 1, 1,
-0.9241236, 0.08061472, -0.8299716, 1, 1, 1, 1, 1,
-0.9217348, 0.4923028, -0.9272979, 0, 0, 1, 1, 1,
-0.9210511, -1.353256, -2.521708, 1, 0, 0, 1, 1,
-0.9176233, 0.304954, -3.0207, 1, 0, 0, 1, 1,
-0.9157255, -0.2626487, -1.787085, 1, 0, 0, 1, 1,
-0.9134948, 0.1832785, -3.227726, 1, 0, 0, 1, 1,
-0.9105451, -0.9011962, -1.123664, 1, 0, 0, 1, 1,
-0.9077186, -0.4731839, -1.838541, 0, 0, 0, 1, 1,
-0.8999704, 0.2040775, -2.410432, 0, 0, 0, 1, 1,
-0.8953216, 0.02912801, 0.003316139, 0, 0, 0, 1, 1,
-0.8880468, -0.4339816, -2.94844, 0, 0, 0, 1, 1,
-0.8861131, 0.3173893, 0.02987952, 0, 0, 0, 1, 1,
-0.8856884, -1.189132, -1.295946, 0, 0, 0, 1, 1,
-0.8809749, 0.8626897, -1.221015, 0, 0, 0, 1, 1,
-0.8721914, -0.4607679, 0.5388146, 1, 1, 1, 1, 1,
-0.8718857, 0.4755532, -1.523423, 1, 1, 1, 1, 1,
-0.8682901, 0.3410557, 0.659017, 1, 1, 1, 1, 1,
-0.861807, -0.05513101, -0.2577916, 1, 1, 1, 1, 1,
-0.8601692, -0.7845044, -3.14134, 1, 1, 1, 1, 1,
-0.856127, -0.7361396, -1.688921, 1, 1, 1, 1, 1,
-0.8545836, -1.162644, -3.604023, 1, 1, 1, 1, 1,
-0.8476111, -1.172498, -1.147512, 1, 1, 1, 1, 1,
-0.8396727, -0.7289553, -2.811013, 1, 1, 1, 1, 1,
-0.8375994, -0.7734525, -2.696343, 1, 1, 1, 1, 1,
-0.8349847, -0.09222053, -1.635479, 1, 1, 1, 1, 1,
-0.8340153, -0.09959338, -1.60689, 1, 1, 1, 1, 1,
-0.8334878, 0.2051261, -1.22279, 1, 1, 1, 1, 1,
-0.8302135, 0.7518021, 1.522142, 1, 1, 1, 1, 1,
-0.8285948, 0.7030246, 0.3305828, 1, 1, 1, 1, 1,
-0.8280065, 0.8914571, -0.05018278, 0, 0, 1, 1, 1,
-0.8230785, -0.5642489, -1.316338, 1, 0, 0, 1, 1,
-0.8190772, -0.3203502, -2.854081, 1, 0, 0, 1, 1,
-0.8164075, -0.02163031, -1.228, 1, 0, 0, 1, 1,
-0.8122291, -1.394956, -2.151854, 1, 0, 0, 1, 1,
-0.8077235, 1.872812, -0.7953659, 1, 0, 0, 1, 1,
-0.8065544, 0.4992434, -1.9141, 0, 0, 0, 1, 1,
-0.806075, 2.840218, -0.6287633, 0, 0, 0, 1, 1,
-0.8053669, 2.089922, -1.128177, 0, 0, 0, 1, 1,
-0.8018264, -0.4075378, -1.259665, 0, 0, 0, 1, 1,
-0.7980704, 0.5661128, 0.2358094, 0, 0, 0, 1, 1,
-0.7959186, -0.6959126, -1.42595, 0, 0, 0, 1, 1,
-0.7932985, 0.09078374, -0.8812264, 0, 0, 0, 1, 1,
-0.7887785, 0.2254811, -2.049953, 1, 1, 1, 1, 1,
-0.7844731, -1.809767, -2.668051, 1, 1, 1, 1, 1,
-0.7834925, -0.9102528, -1.80312, 1, 1, 1, 1, 1,
-0.7828786, 2.87533, 0.3826671, 1, 1, 1, 1, 1,
-0.7823226, -0.0455092, -1.235364, 1, 1, 1, 1, 1,
-0.7819773, 0.7713704, -2.275827, 1, 1, 1, 1, 1,
-0.7813534, 0.8645095, -2.171054, 1, 1, 1, 1, 1,
-0.7798607, 1.052258, -2.230685, 1, 1, 1, 1, 1,
-0.7787763, 0.5487981, -0.8430684, 1, 1, 1, 1, 1,
-0.7783867, 1.487228, -1.381226, 1, 1, 1, 1, 1,
-0.7776002, -0.8952065, -3.557895, 1, 1, 1, 1, 1,
-0.7768196, 0.3050673, -0.225054, 1, 1, 1, 1, 1,
-0.7761126, -0.6824442, -2.354153, 1, 1, 1, 1, 1,
-0.7715465, -1.929265, -2.661055, 1, 1, 1, 1, 1,
-0.7713848, 0.1260208, -2.687096, 1, 1, 1, 1, 1,
-0.7713724, -1.186171, -3.759189, 0, 0, 1, 1, 1,
-0.7707349, 0.9898636, -1.042992, 1, 0, 0, 1, 1,
-0.7706389, 1.312436, -1.216397, 1, 0, 0, 1, 1,
-0.7703983, -0.215373, -1.350894, 1, 0, 0, 1, 1,
-0.7509452, -1.861141, -3.65802, 1, 0, 0, 1, 1,
-0.7501304, -0.7392296, -2.357052, 1, 0, 0, 1, 1,
-0.7476847, -1.059267, -2.867131, 0, 0, 0, 1, 1,
-0.7443808, 1.657712, 1.033657, 0, 0, 0, 1, 1,
-0.7429382, -1.309654, -2.539599, 0, 0, 0, 1, 1,
-0.7371134, -1.969585, -2.393031, 0, 0, 0, 1, 1,
-0.7354731, -0.2241602, -1.500562, 0, 0, 0, 1, 1,
-0.7346821, -0.2878806, -3.654113, 0, 0, 0, 1, 1,
-0.7329593, 0.1861743, -1.203462, 0, 0, 0, 1, 1,
-0.7317802, 0.2820489, -1.660042, 1, 1, 1, 1, 1,
-0.7300925, -1.59991, -1.644292, 1, 1, 1, 1, 1,
-0.7250061, 0.1443861, -0.6848924, 1, 1, 1, 1, 1,
-0.7164502, -0.2936306, -3.139493, 1, 1, 1, 1, 1,
-0.7142707, -0.01961513, -2.660361, 1, 1, 1, 1, 1,
-0.7072088, 1.733426, 0.7355874, 1, 1, 1, 1, 1,
-0.7032141, -1.39488, -3.058986, 1, 1, 1, 1, 1,
-0.6869196, 2.168725, -1.044888, 1, 1, 1, 1, 1,
-0.6862515, -0.5900092, -1.020333, 1, 1, 1, 1, 1,
-0.6848615, 1.670486, 0.779735, 1, 1, 1, 1, 1,
-0.6844184, -0.5167018, -2.496305, 1, 1, 1, 1, 1,
-0.679899, 0.9983194, 0.4465946, 1, 1, 1, 1, 1,
-0.6754599, 1.0474, -0.2070908, 1, 1, 1, 1, 1,
-0.6742819, -1.226779, -2.603094, 1, 1, 1, 1, 1,
-0.6732315, -0.1974263, 0.1346117, 1, 1, 1, 1, 1,
-0.6724587, 1.017124, -0.1435985, 0, 0, 1, 1, 1,
-0.6702846, -1.383405, -3.194015, 1, 0, 0, 1, 1,
-0.6700708, -0.7938561, -3.310096, 1, 0, 0, 1, 1,
-0.6671046, -0.2501928, -1.943612, 1, 0, 0, 1, 1,
-0.6625723, -0.2659773, -0.967684, 1, 0, 0, 1, 1,
-0.6617588, 1.334565, -0.5662659, 1, 0, 0, 1, 1,
-0.6565707, -1.370313, -3.229122, 0, 0, 0, 1, 1,
-0.6565661, -1.216428, -1.86345, 0, 0, 0, 1, 1,
-0.6554791, -2.076345, -2.759262, 0, 0, 0, 1, 1,
-0.6553469, -0.3276067, -2.943723, 0, 0, 0, 1, 1,
-0.6504745, 0.8840684, -1.363855, 0, 0, 0, 1, 1,
-0.6445331, 0.7152026, -0.2744932, 0, 0, 0, 1, 1,
-0.6367558, 0.1665316, 0.990684, 0, 0, 0, 1, 1,
-0.6315786, 0.4324519, -0.5065053, 1, 1, 1, 1, 1,
-0.629799, 0.5511578, -0.337389, 1, 1, 1, 1, 1,
-0.6284415, 0.5386366, -0.7936049, 1, 1, 1, 1, 1,
-0.6195545, -0.2972876, -4.619369, 1, 1, 1, 1, 1,
-0.6184086, -0.02606978, -1.218629, 1, 1, 1, 1, 1,
-0.6164963, -1.465617, -2.89327, 1, 1, 1, 1, 1,
-0.611389, -0.5251164, -3.341269, 1, 1, 1, 1, 1,
-0.6110974, -0.7448502, -3.852685, 1, 1, 1, 1, 1,
-0.6079937, 0.08786594, -0.0710065, 1, 1, 1, 1, 1,
-0.6076192, -0.7209319, -1.922064, 1, 1, 1, 1, 1,
-0.6044576, -0.7753205, -2.407439, 1, 1, 1, 1, 1,
-0.5980491, -1.029256, -2.663997, 1, 1, 1, 1, 1,
-0.5978752, -0.1114141, -1.047676, 1, 1, 1, 1, 1,
-0.5962036, 2.024034, -0.317395, 1, 1, 1, 1, 1,
-0.5895473, -0.3259712, -2.156303, 1, 1, 1, 1, 1,
-0.5814291, -0.359949, -2.713524, 0, 0, 1, 1, 1,
-0.5779625, -1.048287, -4.784657, 1, 0, 0, 1, 1,
-0.5772009, -0.03781756, -2.607511, 1, 0, 0, 1, 1,
-0.5738343, 0.5612314, -1.049135, 1, 0, 0, 1, 1,
-0.5730262, 0.2693093, -0.1843483, 1, 0, 0, 1, 1,
-0.5713724, 0.5419706, 1.204395, 1, 0, 0, 1, 1,
-0.56589, -0.5152138, -2.868971, 0, 0, 0, 1, 1,
-0.5640021, -0.6913279, -0.717392, 0, 0, 0, 1, 1,
-0.5627555, 1.516379, -1.350986, 0, 0, 0, 1, 1,
-0.5573335, 0.2032473, -0.2705442, 0, 0, 0, 1, 1,
-0.5562928, 1.602489, -0.1564073, 0, 0, 0, 1, 1,
-0.5558926, 2.253556, 0.1260957, 0, 0, 0, 1, 1,
-0.5556435, 0.6620086, -0.623788, 0, 0, 0, 1, 1,
-0.5520468, -0.7908627, -2.57558, 1, 1, 1, 1, 1,
-0.551367, -1.254122, -3.591819, 1, 1, 1, 1, 1,
-0.5488044, 0.1688849, -0.7856024, 1, 1, 1, 1, 1,
-0.5450286, 0.1714763, -1.386217, 1, 1, 1, 1, 1,
-0.5441041, 0.3416018, -0.2711911, 1, 1, 1, 1, 1,
-0.5430985, 0.05330537, -2.332818, 1, 1, 1, 1, 1,
-0.5430394, 1.582064, -0.2226352, 1, 1, 1, 1, 1,
-0.5406219, -1.257659, -2.831325, 1, 1, 1, 1, 1,
-0.5359604, -0.3257956, -1.990245, 1, 1, 1, 1, 1,
-0.5307963, -1.973905, -3.857059, 1, 1, 1, 1, 1,
-0.5305362, 0.9000022, -0.610638, 1, 1, 1, 1, 1,
-0.5284708, 0.005489132, -1.084177, 1, 1, 1, 1, 1,
-0.5249425, -0.5426247, -2.323066, 1, 1, 1, 1, 1,
-0.5244142, 0.6595739, -2.799284, 1, 1, 1, 1, 1,
-0.5240716, 0.3932239, -1.627334, 1, 1, 1, 1, 1,
-0.5239353, 1.084593, -1.733579, 0, 0, 1, 1, 1,
-0.521845, 0.8174004, -0.1000467, 1, 0, 0, 1, 1,
-0.5212864, 0.6587373, -0.9637977, 1, 0, 0, 1, 1,
-0.5196742, 0.6269102, 1.476204, 1, 0, 0, 1, 1,
-0.5134706, 1.036773, -1.062343, 1, 0, 0, 1, 1,
-0.5119002, 0.2575017, -1.578629, 1, 0, 0, 1, 1,
-0.5098448, -0.2782314, -2.372336, 0, 0, 0, 1, 1,
-0.501886, -0.42181, -2.431655, 0, 0, 0, 1, 1,
-0.5006964, -1.095163, -1.470905, 0, 0, 0, 1, 1,
-0.4975688, 0.7266876, -1.01499, 0, 0, 0, 1, 1,
-0.4961118, 0.6408659, -0.7604831, 0, 0, 0, 1, 1,
-0.495461, -0.112044, -3.497386, 0, 0, 0, 1, 1,
-0.4893617, 0.2050098, -2.053991, 0, 0, 0, 1, 1,
-0.4890844, 1.007972, 1.209486, 1, 1, 1, 1, 1,
-0.4868035, 0.4434528, -0.8987092, 1, 1, 1, 1, 1,
-0.4835636, -0.3835388, -1.573761, 1, 1, 1, 1, 1,
-0.4819233, 0.4353769, -1.090816, 1, 1, 1, 1, 1,
-0.4800792, -0.6774089, -4.279629, 1, 1, 1, 1, 1,
-0.4738479, -0.3660381, -3.258892, 1, 1, 1, 1, 1,
-0.4716611, 0.9907993, -0.01189854, 1, 1, 1, 1, 1,
-0.4714728, 1.259786, -2.329817, 1, 1, 1, 1, 1,
-0.464271, -0.8448721, -1.354265, 1, 1, 1, 1, 1,
-0.4615565, 0.3839544, 0.1396146, 1, 1, 1, 1, 1,
-0.4613349, -0.5082601, -1.110002, 1, 1, 1, 1, 1,
-0.4491739, -1.278878, -4.480374, 1, 1, 1, 1, 1,
-0.4465362, 1.529942, -0.1587636, 1, 1, 1, 1, 1,
-0.4450798, 0.08911131, -1.286798, 1, 1, 1, 1, 1,
-0.4420971, -0.9855967, -0.6544854, 1, 1, 1, 1, 1,
-0.4385293, -0.3158815, -3.226279, 0, 0, 1, 1, 1,
-0.4356933, -1.19894, -3.79919, 1, 0, 0, 1, 1,
-0.4338802, 1.114904, 0.5008488, 1, 0, 0, 1, 1,
-0.4297602, 0.01778826, -0.7757459, 1, 0, 0, 1, 1,
-0.4284214, 1.928468, -0.9189577, 1, 0, 0, 1, 1,
-0.427824, 0.6792896, -1.249831, 1, 0, 0, 1, 1,
-0.421966, 1.387874, -0.6209106, 0, 0, 0, 1, 1,
-0.4189138, -0.01781865, -2.501817, 0, 0, 0, 1, 1,
-0.415248, -0.00390362, -1.609764, 0, 0, 0, 1, 1,
-0.4114048, -0.5966921, -1.474482, 0, 0, 0, 1, 1,
-0.4091215, -1.149889, -3.835179, 0, 0, 0, 1, 1,
-0.4019288, -0.9042869, -3.322232, 0, 0, 0, 1, 1,
-0.4016099, 0.7158044, -0.2882603, 0, 0, 0, 1, 1,
-0.4006891, 0.2317975, -0.8159721, 1, 1, 1, 1, 1,
-0.4002915, 1.65945, -0.6742575, 1, 1, 1, 1, 1,
-0.3935753, -0.3499225, -3.1366, 1, 1, 1, 1, 1,
-0.3923933, -0.8572928, -2.812602, 1, 1, 1, 1, 1,
-0.3900567, 2.495607, -0.5015379, 1, 1, 1, 1, 1,
-0.3896663, 0.531207, -0.3954803, 1, 1, 1, 1, 1,
-0.3882221, 1.865607, -2.261549, 1, 1, 1, 1, 1,
-0.3868507, 0.5310043, 0.8852847, 1, 1, 1, 1, 1,
-0.3861988, 1.607506, -0.8185034, 1, 1, 1, 1, 1,
-0.3830483, 0.5648852, -2.413431, 1, 1, 1, 1, 1,
-0.3828019, 0.9077168, 0.2315315, 1, 1, 1, 1, 1,
-0.376328, 1.526311, 0.2852754, 1, 1, 1, 1, 1,
-0.3751916, 0.5305163, -1.476506, 1, 1, 1, 1, 1,
-0.3742287, 0.4579832, -3.382364, 1, 1, 1, 1, 1,
-0.3716618, -1.630427, -2.590611, 1, 1, 1, 1, 1,
-0.3631994, -1.942053, -5.4504, 0, 0, 1, 1, 1,
-0.3624249, -0.5896263, -1.804381, 1, 0, 0, 1, 1,
-0.3607675, -0.7683769, -4.665697, 1, 0, 0, 1, 1,
-0.3589753, -0.3838515, -3.402332, 1, 0, 0, 1, 1,
-0.3491153, -0.4630145, -1.044763, 1, 0, 0, 1, 1,
-0.3479265, 0.3130426, -0.9136371, 1, 0, 0, 1, 1,
-0.347071, 1.497547, -1.236705, 0, 0, 0, 1, 1,
-0.3458563, 0.9561781, 1.060899, 0, 0, 0, 1, 1,
-0.3441105, -0.2451827, -2.423733, 0, 0, 0, 1, 1,
-0.3416861, -1.473033, -3.665131, 0, 0, 0, 1, 1,
-0.3405967, -1.5633, -3.592838, 0, 0, 0, 1, 1,
-0.3376758, -1.992072, -3.605852, 0, 0, 0, 1, 1,
-0.3365479, -1.382968, -2.484973, 0, 0, 0, 1, 1,
-0.3350078, 0.08527618, 0.6008052, 1, 1, 1, 1, 1,
-0.3330322, -0.2006102, -1.838993, 1, 1, 1, 1, 1,
-0.3326786, 0.231602, -1.96245, 1, 1, 1, 1, 1,
-0.3228591, 0.2238423, -1.241278, 1, 1, 1, 1, 1,
-0.3227374, -0.9485077, -2.037629, 1, 1, 1, 1, 1,
-0.3170792, 0.2137792, -0.9426879, 1, 1, 1, 1, 1,
-0.3167846, -0.6171434, -1.870147, 1, 1, 1, 1, 1,
-0.314637, 0.6711388, 1.123571, 1, 1, 1, 1, 1,
-0.312919, 0.2799966, 0.3210571, 1, 1, 1, 1, 1,
-0.3127746, -0.7644847, -4.24112, 1, 1, 1, 1, 1,
-0.310859, -0.2724423, -2.576905, 1, 1, 1, 1, 1,
-0.3107225, -0.5367641, -4.121011, 1, 1, 1, 1, 1,
-0.3020373, -1.132549, -2.583525, 1, 1, 1, 1, 1,
-0.3011285, 0.866122, 2.384438, 1, 1, 1, 1, 1,
-0.299114, -0.6073406, -3.515085, 1, 1, 1, 1, 1,
-0.2988168, 0.4712325, -1.990787, 0, 0, 1, 1, 1,
-0.2973931, -0.7867712, -1.768272, 1, 0, 0, 1, 1,
-0.2950522, 0.4232785, 0.7529943, 1, 0, 0, 1, 1,
-0.294148, 0.7495418, -0.8153533, 1, 0, 0, 1, 1,
-0.2910184, -1.032173, -2.375739, 1, 0, 0, 1, 1,
-0.288178, 1.226781, -0.4955644, 1, 0, 0, 1, 1,
-0.2877848, 0.7353827, -0.9698501, 0, 0, 0, 1, 1,
-0.2873488, -2.340499, -2.341047, 0, 0, 0, 1, 1,
-0.2848951, -0.2934624, -4.596821, 0, 0, 0, 1, 1,
-0.2820883, -1.716417, -3.038602, 0, 0, 0, 1, 1,
-0.2784268, 1.445716, 1.48506, 0, 0, 0, 1, 1,
-0.2781797, 0.7893289, -1.096605, 0, 0, 0, 1, 1,
-0.2780131, 0.3879771, 0.3507889, 0, 0, 0, 1, 1,
-0.2758623, -1.580895, -3.328889, 1, 1, 1, 1, 1,
-0.2713313, 0.4964066, -0.8260527, 1, 1, 1, 1, 1,
-0.2692975, 0.4717109, 0.4672943, 1, 1, 1, 1, 1,
-0.2678232, -0.2356059, -3.954783, 1, 1, 1, 1, 1,
-0.2641097, 1.726104, 0.2783686, 1, 1, 1, 1, 1,
-0.2560042, -1.511322, -2.821815, 1, 1, 1, 1, 1,
-0.2541893, 2.199186, -0.4834599, 1, 1, 1, 1, 1,
-0.2528542, 0.7311764, -0.3288129, 1, 1, 1, 1, 1,
-0.251219, -1.262446, -2.921037, 1, 1, 1, 1, 1,
-0.2504036, 1.14307, -0.05065718, 1, 1, 1, 1, 1,
-0.249703, 0.9090555, -1.10379, 1, 1, 1, 1, 1,
-0.2496509, -0.3626429, -3.133863, 1, 1, 1, 1, 1,
-0.2402348, 1.31086, -0.08026122, 1, 1, 1, 1, 1,
-0.2222105, -0.3476847, -3.210059, 1, 1, 1, 1, 1,
-0.217836, -0.3276282, -2.048121, 1, 1, 1, 1, 1,
-0.2177416, 0.9722615, 0.7150586, 0, 0, 1, 1, 1,
-0.2151862, 0.3006413, -1.217933, 1, 0, 0, 1, 1,
-0.2130467, 0.7694821, -0.7198766, 1, 0, 0, 1, 1,
-0.2078225, -1.569898, -1.447255, 1, 0, 0, 1, 1,
-0.2017679, 1.369937, -1.024226, 1, 0, 0, 1, 1,
-0.2010292, -0.2076489, -1.139255, 1, 0, 0, 1, 1,
-0.1978203, -0.764981, -2.110119, 0, 0, 0, 1, 1,
-0.1975207, -0.6833351, -2.275668, 0, 0, 0, 1, 1,
-0.1957089, -1.88696, -4.30735, 0, 0, 0, 1, 1,
-0.1949092, -1.001175, -3.396039, 0, 0, 0, 1, 1,
-0.1948959, 0.2154756, -0.7832282, 0, 0, 0, 1, 1,
-0.1945342, -0.4494825, -1.365127, 0, 0, 0, 1, 1,
-0.1917958, 1.423905, -0.3514412, 0, 0, 0, 1, 1,
-0.1872883, 0.6910343, 1.511667, 1, 1, 1, 1, 1,
-0.1845057, 0.1050952, -2.242435, 1, 1, 1, 1, 1,
-0.1800446, -1.11303, -2.630134, 1, 1, 1, 1, 1,
-0.1705866, 0.9056567, -1.607857, 1, 1, 1, 1, 1,
-0.1686775, -0.6896903, -1.876972, 1, 1, 1, 1, 1,
-0.1668189, 0.3292249, -1.340142, 1, 1, 1, 1, 1,
-0.1643819, 1.576004, -0.9685197, 1, 1, 1, 1, 1,
-0.1641113, -0.6644004, -2.590223, 1, 1, 1, 1, 1,
-0.1619026, 0.8679336, 0.4632198, 1, 1, 1, 1, 1,
-0.156111, 0.430145, -0.0386983, 1, 1, 1, 1, 1,
-0.1515294, -1.521853, -3.317476, 1, 1, 1, 1, 1,
-0.151375, -0.08910793, -1.761988, 1, 1, 1, 1, 1,
-0.149914, 0.3249968, -1.233872, 1, 1, 1, 1, 1,
-0.148978, -0.2582625, -2.644542, 1, 1, 1, 1, 1,
-0.1487922, 1.799681, 0.001696003, 1, 1, 1, 1, 1,
-0.1443353, 0.788063, 1.136732, 0, 0, 1, 1, 1,
-0.1436837, -0.6037823, -4.105251, 1, 0, 0, 1, 1,
-0.1425256, 0.4012056, 1.271319, 1, 0, 0, 1, 1,
-0.1422368, -0.3996314, -3.16961, 1, 0, 0, 1, 1,
-0.1400037, -0.8390628, -2.987977, 1, 0, 0, 1, 1,
-0.1364196, -0.5065905, -2.052291, 1, 0, 0, 1, 1,
-0.1350665, -0.8162882, -3.271885, 0, 0, 0, 1, 1,
-0.1317495, -1.534198, -5.149646, 0, 0, 0, 1, 1,
-0.1305149, -0.8700145, -3.017906, 0, 0, 0, 1, 1,
-0.1282894, 1.284526, 0.7184181, 0, 0, 0, 1, 1,
-0.1255169, 0.2013521, -0.9817445, 0, 0, 0, 1, 1,
-0.1216175, 1.781297, -0.1406264, 0, 0, 0, 1, 1,
-0.1212152, 0.9804676, 0.7978553, 0, 0, 0, 1, 1,
-0.1115511, 0.9828656, -0.8091117, 1, 1, 1, 1, 1,
-0.1081753, -0.1518031, -2.495342, 1, 1, 1, 1, 1,
-0.1031421, 1.468509, 0.1215329, 1, 1, 1, 1, 1,
-0.1011277, 0.868406, -1.796376, 1, 1, 1, 1, 1,
-0.09900837, 0.6502397, 0.1770985, 1, 1, 1, 1, 1,
-0.09504173, 1.280547, 0.5691546, 1, 1, 1, 1, 1,
-0.09447427, -1.672069, -2.28035, 1, 1, 1, 1, 1,
-0.09400006, 0.617822, 0.6509789, 1, 1, 1, 1, 1,
-0.09239154, -0.8816161, -1.522486, 1, 1, 1, 1, 1,
-0.08949658, -0.8358335, -2.692816, 1, 1, 1, 1, 1,
-0.08924717, 0.3718564, -1.096706, 1, 1, 1, 1, 1,
-0.08363256, -2.405574, -1.572193, 1, 1, 1, 1, 1,
-0.08197232, 1.192751, -0.8626899, 1, 1, 1, 1, 1,
-0.08093694, 1.008175, -1.062228, 1, 1, 1, 1, 1,
-0.07876305, -0.3439237, -3.571587, 1, 1, 1, 1, 1,
-0.07773368, 2.577986, -0.1145481, 0, 0, 1, 1, 1,
-0.07258798, 1.023349, -0.8019529, 1, 0, 0, 1, 1,
-0.06376187, -0.1546731, -2.743016, 1, 0, 0, 1, 1,
-0.06200178, 0.4489982, 0.607756, 1, 0, 0, 1, 1,
-0.05809085, 1.024275, -0.0462255, 1, 0, 0, 1, 1,
-0.05148287, -0.8782544, -3.08907, 1, 0, 0, 1, 1,
-0.04971463, 0.3224056, 0.7499522, 0, 0, 0, 1, 1,
-0.04684664, 1.222398, 0.96724, 0, 0, 0, 1, 1,
-0.04671911, 2.115585, 0.1958899, 0, 0, 0, 1, 1,
-0.04454525, -2.364538, -4.542428, 0, 0, 0, 1, 1,
-0.04434331, -0.7066305, -2.386497, 0, 0, 0, 1, 1,
-0.04127486, -0.1127727, -2.924357, 0, 0, 0, 1, 1,
-0.04118746, -0.2711321, -3.961885, 0, 0, 0, 1, 1,
-0.04033703, 0.9750634, -1.738941, 1, 1, 1, 1, 1,
-0.03860863, 0.3547912, -0.04792755, 1, 1, 1, 1, 1,
-0.0368991, 0.5690512, -0.225616, 1, 1, 1, 1, 1,
-0.03681921, 1.029756, 0.262817, 1, 1, 1, 1, 1,
-0.03679836, 2.60839, -0.7718672, 1, 1, 1, 1, 1,
-0.03557695, -0.6949492, -2.068279, 1, 1, 1, 1, 1,
-0.03462382, -1.058853, -3.075826, 1, 1, 1, 1, 1,
-0.02553536, 0.3694351, 0.0231767, 1, 1, 1, 1, 1,
-0.0242232, -0.4918108, -0.5831867, 1, 1, 1, 1, 1,
-0.02346917, -0.3575791, -1.257575, 1, 1, 1, 1, 1,
-0.01871136, -0.398447, -3.41007, 1, 1, 1, 1, 1,
-0.01751725, 0.8373235, -0.1513755, 1, 1, 1, 1, 1,
-0.01232497, 0.9223939, -1.370293, 1, 1, 1, 1, 1,
-0.008493165, 0.8127299, -0.2002838, 1, 1, 1, 1, 1,
-0.008065733, -0.2432857, -5.000981, 1, 1, 1, 1, 1,
-0.003498829, 0.5582661, 1.264046, 0, 0, 1, 1, 1,
-0.0008471027, 0.6703255, 1.094599, 1, 0, 0, 1, 1,
0.003329209, -0.8842842, 5.73025, 1, 0, 0, 1, 1,
0.004665579, 0.07207949, 0.8563362, 1, 0, 0, 1, 1,
0.006455993, -0.358992, 2.356658, 1, 0, 0, 1, 1,
0.007910074, 1.850832, -0.4764594, 1, 0, 0, 1, 1,
0.008336692, 0.003258093, 2.115654, 0, 0, 0, 1, 1,
0.01017834, -0.7049878, 2.307428, 0, 0, 0, 1, 1,
0.01176975, 0.9587191, -0.3543519, 0, 0, 0, 1, 1,
0.01218758, 0.2447814, 1.474144, 0, 0, 0, 1, 1,
0.01567202, 0.7226368, -0.6827621, 0, 0, 0, 1, 1,
0.01571902, 0.8263199, -2.068433, 0, 0, 0, 1, 1,
0.01837436, 0.3048419, -2.040857, 0, 0, 0, 1, 1,
0.02772115, -0.3537467, 2.140902, 1, 1, 1, 1, 1,
0.03006088, 0.7426963, 0.1534289, 1, 1, 1, 1, 1,
0.03541238, 0.6130254, -0.9120037, 1, 1, 1, 1, 1,
0.03544928, -0.5720316, 3.475868, 1, 1, 1, 1, 1,
0.0415502, -1.23751, 3.239861, 1, 1, 1, 1, 1,
0.04419208, -0.5929943, 3.593195, 1, 1, 1, 1, 1,
0.05117104, 1.444867, 0.6964386, 1, 1, 1, 1, 1,
0.05196245, 0.1390522, 0.5548283, 1, 1, 1, 1, 1,
0.05217731, -0.2177788, 5.002292, 1, 1, 1, 1, 1,
0.05290691, 0.785335, 0.4101943, 1, 1, 1, 1, 1,
0.05444929, 0.1181722, 0.4454359, 1, 1, 1, 1, 1,
0.06003764, -0.9123246, 1.795733, 1, 1, 1, 1, 1,
0.06004844, 0.2025947, 1.626072, 1, 1, 1, 1, 1,
0.06244557, -0.04645574, 2.35447, 1, 1, 1, 1, 1,
0.06422955, 0.6338185, -2.5306, 1, 1, 1, 1, 1,
0.06591631, 0.4532897, 0.6258909, 0, 0, 1, 1, 1,
0.0675269, -0.1861845, 2.975078, 1, 0, 0, 1, 1,
0.07329734, -0.04759347, 1.477842, 1, 0, 0, 1, 1,
0.07548886, 0.8674374, 1.666047, 1, 0, 0, 1, 1,
0.07593639, 0.1952743, 1.517599, 1, 0, 0, 1, 1,
0.07669814, -0.167072, 3.300481, 1, 0, 0, 1, 1,
0.07922205, -0.02455371, 1.800129, 0, 0, 0, 1, 1,
0.08408754, -0.6734856, -0.9033046, 0, 0, 0, 1, 1,
0.08467633, -0.1405236, 2.341938, 0, 0, 0, 1, 1,
0.08552302, -0.3170837, 4.956959, 0, 0, 0, 1, 1,
0.08745221, -1.366015, 3.153116, 0, 0, 0, 1, 1,
0.09075201, -0.7976515, 4.018185, 0, 0, 0, 1, 1,
0.09125961, -0.6263881, 3.752827, 0, 0, 0, 1, 1,
0.09286109, 1.108843, -0.08120216, 1, 1, 1, 1, 1,
0.09963842, 0.5840467, 3.199359, 1, 1, 1, 1, 1,
0.1035465, -0.9361607, 1.978906, 1, 1, 1, 1, 1,
0.1064649, -0.02101649, 1.927419, 1, 1, 1, 1, 1,
0.1084349, -0.3877013, 2.373131, 1, 1, 1, 1, 1,
0.1120098, -0.8038446, 1.400334, 1, 1, 1, 1, 1,
0.1170252, -1.211302, 2.652635, 1, 1, 1, 1, 1,
0.1199088, -0.796334, 2.960631, 1, 1, 1, 1, 1,
0.1209826, 0.6308598, -0.9043494, 1, 1, 1, 1, 1,
0.1241023, 1.049623, -0.1340824, 1, 1, 1, 1, 1,
0.1247216, -0.2014781, 3.529225, 1, 1, 1, 1, 1,
0.1256093, 0.5400739, -1.051796, 1, 1, 1, 1, 1,
0.127607, 2.239608, -1.400422, 1, 1, 1, 1, 1,
0.1287155, -0.3315819, 2.737334, 1, 1, 1, 1, 1,
0.1287256, -1.74597, 3.761999, 1, 1, 1, 1, 1,
0.1372373, -0.5496747, 2.084477, 0, 0, 1, 1, 1,
0.1379208, 0.9071061, 0.487865, 1, 0, 0, 1, 1,
0.1431634, -2.035251, 2.742834, 1, 0, 0, 1, 1,
0.1448387, 0.6400128, 0.401014, 1, 0, 0, 1, 1,
0.1514339, -1.229202, 1.451389, 1, 0, 0, 1, 1,
0.1515645, -0.3091107, 1.200132, 1, 0, 0, 1, 1,
0.1528049, 1.155941, 1.713817, 0, 0, 0, 1, 1,
0.1532019, -1.628981, 2.756887, 0, 0, 0, 1, 1,
0.1532198, 0.5303131, 1.461359, 0, 0, 0, 1, 1,
0.1534008, -1.38824, 3.525531, 0, 0, 0, 1, 1,
0.1548692, -1.055202, 1.599727, 0, 0, 0, 1, 1,
0.1589033, -2.094313, 3.493465, 0, 0, 0, 1, 1,
0.1598441, 0.104865, -0.09459714, 0, 0, 0, 1, 1,
0.1629218, -1.034293, 3.856989, 1, 1, 1, 1, 1,
0.1631273, 0.03926773, 1.687735, 1, 1, 1, 1, 1,
0.1661863, -1.608063, 3.177316, 1, 1, 1, 1, 1,
0.1669408, 0.751012, -1.191317, 1, 1, 1, 1, 1,
0.168085, 0.5475587, -1.219758, 1, 1, 1, 1, 1,
0.1683085, 0.6532725, 1.55943, 1, 1, 1, 1, 1,
0.1711926, -0.233409, 3.50303, 1, 1, 1, 1, 1,
0.1759042, 0.5576873, -0.1653954, 1, 1, 1, 1, 1,
0.1820159, -1.509428, 0.9780884, 1, 1, 1, 1, 1,
0.1848182, 0.9121597, 2.091823, 1, 1, 1, 1, 1,
0.1871087, -0.8906552, 2.33189, 1, 1, 1, 1, 1,
0.1872229, -0.557205, 2.583611, 1, 1, 1, 1, 1,
0.1880964, 1.004712, 1.837057, 1, 1, 1, 1, 1,
0.1882978, 1.964059, 1.456807, 1, 1, 1, 1, 1,
0.1941792, -2.563688, 4.278608, 1, 1, 1, 1, 1,
0.2007418, -0.4268467, 3.900637, 0, 0, 1, 1, 1,
0.201175, -0.8220865, 3.466455, 1, 0, 0, 1, 1,
0.2027372, -0.8981454, 3.379254, 1, 0, 0, 1, 1,
0.2032548, 1.145686, -0.9950722, 1, 0, 0, 1, 1,
0.2070263, -1.147382, 1.688525, 1, 0, 0, 1, 1,
0.210007, 1.019366, 1.005106, 1, 0, 0, 1, 1,
0.2118894, -1.619517, 4.193274, 0, 0, 0, 1, 1,
0.2127825, 1.096381, -0.7851983, 0, 0, 0, 1, 1,
0.213286, 0.2219776, 1.05348, 0, 0, 0, 1, 1,
0.2150446, 1.416559, 1.249218, 0, 0, 0, 1, 1,
0.2154449, -0.3021585, 2.910743, 0, 0, 0, 1, 1,
0.217483, -0.9375514, 1.730037, 0, 0, 0, 1, 1,
0.2188566, -0.02263918, -0.02725401, 0, 0, 0, 1, 1,
0.2188926, 0.3971056, 0.8049406, 1, 1, 1, 1, 1,
0.2193924, 0.5013356, 1.530874, 1, 1, 1, 1, 1,
0.2254408, 0.8812024, 0.5683914, 1, 1, 1, 1, 1,
0.2294771, -0.3336242, 1.697482, 1, 1, 1, 1, 1,
0.2335006, 0.3897074, 0.9595096, 1, 1, 1, 1, 1,
0.2364895, 0.7522584, 0.8589646, 1, 1, 1, 1, 1,
0.2367442, -0.01397895, 0.7629005, 1, 1, 1, 1, 1,
0.2424529, 2.400139, 0.3471191, 1, 1, 1, 1, 1,
0.2429681, -0.6066488, 2.701507, 1, 1, 1, 1, 1,
0.2458733, -0.03596373, 2.289023, 1, 1, 1, 1, 1,
0.247939, -1.383684, 3.497111, 1, 1, 1, 1, 1,
0.2482361, 0.2440463, 1.079771, 1, 1, 1, 1, 1,
0.2497703, 0.03432839, 1.073667, 1, 1, 1, 1, 1,
0.2497788, -1.063579, 4.667743, 1, 1, 1, 1, 1,
0.2506232, -2.233685, 1.924152, 1, 1, 1, 1, 1,
0.2546534, 2.9818, 0.189124, 0, 0, 1, 1, 1,
0.2546944, -2.400902, 2.525412, 1, 0, 0, 1, 1,
0.2565071, 0.6238163, 0.8065535, 1, 0, 0, 1, 1,
0.2605835, -0.5569263, 2.855721, 1, 0, 0, 1, 1,
0.263302, 0.1107167, -1.134527, 1, 0, 0, 1, 1,
0.2635947, 0.6110676, 0.5670095, 1, 0, 0, 1, 1,
0.2664392, 0.6486742, 0.8451854, 0, 0, 0, 1, 1,
0.2684146, -1.428739, 4.340373, 0, 0, 0, 1, 1,
0.2802816, -0.2282206, 2.774636, 0, 0, 0, 1, 1,
0.2815467, 0.3825443, 1.980989, 0, 0, 0, 1, 1,
0.282433, 1.231854, 1.406939, 0, 0, 0, 1, 1,
0.2832545, 1.016793, -0.765084, 0, 0, 0, 1, 1,
0.2904065, 0.3391681, -0.1162611, 0, 0, 0, 1, 1,
0.2905652, -0.1784855, 3.262637, 1, 1, 1, 1, 1,
0.2948083, 0.490785, 0.5465983, 1, 1, 1, 1, 1,
0.2997569, -1.775288, 2.592921, 1, 1, 1, 1, 1,
0.3020259, 0.809927, 1.58934, 1, 1, 1, 1, 1,
0.3021554, -0.8705835, 3.863466, 1, 1, 1, 1, 1,
0.3058912, 0.9235661, 1.377631, 1, 1, 1, 1, 1,
0.3086539, -0.08311725, 1.804205, 1, 1, 1, 1, 1,
0.3123037, 0.02800524, 0.9007099, 1, 1, 1, 1, 1,
0.315081, -1.333703, 3.135505, 1, 1, 1, 1, 1,
0.316312, -1.840715, 1.373286, 1, 1, 1, 1, 1,
0.3172717, -0.6911141, 2.651656, 1, 1, 1, 1, 1,
0.3217135, 0.3859971, 0.7984459, 1, 1, 1, 1, 1,
0.3268548, -0.4352962, 1.068184, 1, 1, 1, 1, 1,
0.3300703, 2.338675, 0.552976, 1, 1, 1, 1, 1,
0.3331263, 0.6880577, 0.1517926, 1, 1, 1, 1, 1,
0.334781, 1.014592, -1.007937, 0, 0, 1, 1, 1,
0.3351253, -1.04917, 2.276397, 1, 0, 0, 1, 1,
0.3381548, 1.172357, 1.172813, 1, 0, 0, 1, 1,
0.3417395, 2.837453, -1.822281, 1, 0, 0, 1, 1,
0.3420194, 1.152729, 1.159991, 1, 0, 0, 1, 1,
0.342553, 0.3146234, 0.4759017, 1, 0, 0, 1, 1,
0.3435031, -1.243322, 1.747227, 0, 0, 0, 1, 1,
0.3507013, -1.220491, 2.872345, 0, 0, 0, 1, 1,
0.3518005, 0.04187537, 0.7866017, 0, 0, 0, 1, 1,
0.3549109, -0.2713834, 1.283957, 0, 0, 0, 1, 1,
0.3592839, 0.7138383, -0.1360464, 0, 0, 0, 1, 1,
0.3597062, -0.9667352, 2.636736, 0, 0, 0, 1, 1,
0.3609134, -0.232636, 0.9982651, 0, 0, 0, 1, 1,
0.3621097, 0.1669094, 2.35091, 1, 1, 1, 1, 1,
0.3637407, 0.08089598, 1.46146, 1, 1, 1, 1, 1,
0.364151, 0.7718797, 2.061891, 1, 1, 1, 1, 1,
0.369837, 0.7831267, -1.001539, 1, 1, 1, 1, 1,
0.371786, -0.7660185, 3.408412, 1, 1, 1, 1, 1,
0.3726266, 0.5289372, 1.96426, 1, 1, 1, 1, 1,
0.3733771, 1.963302, -2.324935, 1, 1, 1, 1, 1,
0.3738525, -0.6766781, 2.785381, 1, 1, 1, 1, 1,
0.3768469, 1.900618, -0.2531576, 1, 1, 1, 1, 1,
0.3778374, -0.4842254, -1.302276, 1, 1, 1, 1, 1,
0.3790361, -0.2510309, 1.528666, 1, 1, 1, 1, 1,
0.3820705, -0.03424329, 3.155812, 1, 1, 1, 1, 1,
0.3917856, 0.6922004, -2.13273, 1, 1, 1, 1, 1,
0.3926619, 1.531853, -0.113401, 1, 1, 1, 1, 1,
0.3955196, 0.3843122, 3.36575, 1, 1, 1, 1, 1,
0.397773, -1.148885, 1.827532, 0, 0, 1, 1, 1,
0.4031889, -0.3312688, 2.796903, 1, 0, 0, 1, 1,
0.4037291, 0.878822, -0.06968776, 1, 0, 0, 1, 1,
0.40398, 0.9253758, 0.6484088, 1, 0, 0, 1, 1,
0.407192, -1.766188, 2.630665, 1, 0, 0, 1, 1,
0.4099768, 1.56507, 0.3092643, 1, 0, 0, 1, 1,
0.4112978, -0.3511103, 0.9887115, 0, 0, 0, 1, 1,
0.4123571, 1.26388, -1.12747, 0, 0, 0, 1, 1,
0.4177826, -1.080166, 1.596838, 0, 0, 0, 1, 1,
0.4223462, -0.118916, 0.6940497, 0, 0, 0, 1, 1,
0.4298441, 0.2428134, 1.094213, 0, 0, 0, 1, 1,
0.4338422, 0.795199, 0.2369478, 0, 0, 0, 1, 1,
0.4351999, -0.5795322, 3.312084, 0, 0, 0, 1, 1,
0.4360769, 2.041755, 0.7413767, 1, 1, 1, 1, 1,
0.4409647, 0.8454409, 0.9863986, 1, 1, 1, 1, 1,
0.4419892, -0.290182, 1.256785, 1, 1, 1, 1, 1,
0.4449357, 0.7975429, -0.07236017, 1, 1, 1, 1, 1,
0.4453671, -0.162567, 1.627558, 1, 1, 1, 1, 1,
0.448999, 0.9829136, -0.8842279, 1, 1, 1, 1, 1,
0.4501702, 0.4903063, 1.003572, 1, 1, 1, 1, 1,
0.4550437, 0.4575146, 0.5036238, 1, 1, 1, 1, 1,
0.4565687, -0.4788425, 1.998361, 1, 1, 1, 1, 1,
0.4570728, -0.8161749, 2.440967, 1, 1, 1, 1, 1,
0.4625739, 0.540608, -0.7569, 1, 1, 1, 1, 1,
0.4635136, -1.189069, 3.067085, 1, 1, 1, 1, 1,
0.464691, 0.5584552, 2.28974, 1, 1, 1, 1, 1,
0.4670736, -0.2727707, 1.837303, 1, 1, 1, 1, 1,
0.4717667, -1.232614, 3.953062, 1, 1, 1, 1, 1,
0.4718597, 0.1396416, -0.7234065, 0, 0, 1, 1, 1,
0.4742764, 0.6263769, -0.6645997, 1, 0, 0, 1, 1,
0.4751163, 0.7296072, 0.2712659, 1, 0, 0, 1, 1,
0.4797984, 1.169385, -0.07419985, 1, 0, 0, 1, 1,
0.4840781, 0.00357644, 1.482528, 1, 0, 0, 1, 1,
0.4894161, 1.096093, 0.6634391, 1, 0, 0, 1, 1,
0.4997993, -0.07228569, 1.923553, 0, 0, 0, 1, 1,
0.5003012, 0.5713176, 2.08924, 0, 0, 0, 1, 1,
0.501304, -0.08682729, 2.782139, 0, 0, 0, 1, 1,
0.5018136, -0.3247972, 2.077357, 0, 0, 0, 1, 1,
0.5027633, -0.7503266, 3.36366, 0, 0, 0, 1, 1,
0.5085211, 0.5947253, 1.525821, 0, 0, 0, 1, 1,
0.5103229, -0.3097954, 1.867526, 0, 0, 0, 1, 1,
0.5103768, -0.4825592, 1.678985, 1, 1, 1, 1, 1,
0.5157039, 0.5891514, 1.693156, 1, 1, 1, 1, 1,
0.5235484, -0.4056796, 3.571136, 1, 1, 1, 1, 1,
0.5238618, -0.2725292, 3.053402, 1, 1, 1, 1, 1,
0.5259228, -1.705862, 2.231946, 1, 1, 1, 1, 1,
0.5288265, 0.5228522, 0.1177917, 1, 1, 1, 1, 1,
0.5329831, 0.4003576, 1.831742, 1, 1, 1, 1, 1,
0.5376747, -1.587952, 1.66736, 1, 1, 1, 1, 1,
0.5431178, 0.5511464, 0.2513608, 1, 1, 1, 1, 1,
0.545382, -0.5766708, 1.562268, 1, 1, 1, 1, 1,
0.5470331, -1.652867, 2.839768, 1, 1, 1, 1, 1,
0.549184, 0.1224537, 0.6830254, 1, 1, 1, 1, 1,
0.5549668, 1.25615, 0.5455612, 1, 1, 1, 1, 1,
0.558635, -0.9915844, 1.171486, 1, 1, 1, 1, 1,
0.5586894, 0.6583961, 2.573645, 1, 1, 1, 1, 1,
0.5612946, -1.428581, 2.174482, 0, 0, 1, 1, 1,
0.5637294, 0.6545113, 0.08968163, 1, 0, 0, 1, 1,
0.5674684, -1.215824, 3.270722, 1, 0, 0, 1, 1,
0.5798996, -1.238254, 0.7768112, 1, 0, 0, 1, 1,
0.5819272, 0.7875068, -0.02401412, 1, 0, 0, 1, 1,
0.5843399, 1.396227, 0.6352429, 1, 0, 0, 1, 1,
0.587207, 0.1732946, 1.577783, 0, 0, 0, 1, 1,
0.6000177, 0.7864035, 2.295698, 0, 0, 0, 1, 1,
0.6016371, 0.6397832, 0.09201945, 0, 0, 0, 1, 1,
0.6067439, 0.1883294, 1.589218, 0, 0, 0, 1, 1,
0.6098717, 0.3900985, -0.565084, 0, 0, 0, 1, 1,
0.610686, -0.1684657, 1.643719, 0, 0, 0, 1, 1,
0.6171578, 1.257144, 0.2934723, 0, 0, 0, 1, 1,
0.6232712, 1.509863, 0.7899187, 1, 1, 1, 1, 1,
0.6265864, 0.9080035, -0.8258746, 1, 1, 1, 1, 1,
0.6299725, 1.593668, -0.696857, 1, 1, 1, 1, 1,
0.6302644, -1.228969, 3.127112, 1, 1, 1, 1, 1,
0.6312006, -0.7050936, 1.608765, 1, 1, 1, 1, 1,
0.6336672, 1.344045, 0.228404, 1, 1, 1, 1, 1,
0.6429152, -0.8889534, 0.2893897, 1, 1, 1, 1, 1,
0.6510364, -0.3584417, 2.037781, 1, 1, 1, 1, 1,
0.6564749, 0.8710783, 0.04235103, 1, 1, 1, 1, 1,
0.6626857, -0.9937515, 1.836065, 1, 1, 1, 1, 1,
0.6675173, 1.047742, -0.5773407, 1, 1, 1, 1, 1,
0.6707419, 0.03225132, -0.2995727, 1, 1, 1, 1, 1,
0.6741979, -1.106946, 3.146742, 1, 1, 1, 1, 1,
0.689152, -1.222901, 2.848362, 1, 1, 1, 1, 1,
0.6940313, -0.003704034, 2.762614, 1, 1, 1, 1, 1,
0.7001724, 0.8131213, 0.2409106, 0, 0, 1, 1, 1,
0.7012801, 0.1960939, 1.303544, 1, 0, 0, 1, 1,
0.7039433, 1.064002, 0.8506593, 1, 0, 0, 1, 1,
0.7056213, 0.4455153, 2.062768, 1, 0, 0, 1, 1,
0.708133, -1.067908, 0.7062972, 1, 0, 0, 1, 1,
0.7125621, -0.5182512, 0.5022195, 1, 0, 0, 1, 1,
0.7141068, -1.626155, 2.281259, 0, 0, 0, 1, 1,
0.7160656, 0.4300812, 1.81681, 0, 0, 0, 1, 1,
0.7165908, -0.5794635, 1.721496, 0, 0, 0, 1, 1,
0.7173319, 0.2124064, -0.3566327, 0, 0, 0, 1, 1,
0.7215663, 0.5061878, 2.572304, 0, 0, 0, 1, 1,
0.7260669, -1.135831, 1.475494, 0, 0, 0, 1, 1,
0.7328565, 1.534055, -0.05051353, 0, 0, 0, 1, 1,
0.7441676, -0.1058212, 2.344579, 1, 1, 1, 1, 1,
0.74679, 1.364037, -0.292851, 1, 1, 1, 1, 1,
0.7498055, 0.4478488, -0.2109903, 1, 1, 1, 1, 1,
0.7512935, 0.1298451, 2.161765, 1, 1, 1, 1, 1,
0.7559561, 0.5837386, 1.015957, 1, 1, 1, 1, 1,
0.7631229, 0.4612038, 1.155782, 1, 1, 1, 1, 1,
0.7632086, 0.3365467, 0.3206184, 1, 1, 1, 1, 1,
0.7654479, 0.2544056, 2.420228, 1, 1, 1, 1, 1,
0.7657623, -0.2743451, 2.644014, 1, 1, 1, 1, 1,
0.7674248, 0.2067198, -0.547433, 1, 1, 1, 1, 1,
0.7685686, -0.4521252, 3.425179, 1, 1, 1, 1, 1,
0.7721869, -0.4584412, 0.7246467, 1, 1, 1, 1, 1,
0.7738547, -0.6553405, 4.376459, 1, 1, 1, 1, 1,
0.7782027, 1.408834, -0.7342874, 1, 1, 1, 1, 1,
0.782231, 0.6763061, 0.03079503, 1, 1, 1, 1, 1,
0.7831488, 0.5401448, 0.6096814, 0, 0, 1, 1, 1,
0.785254, 1.726809, -0.5923097, 1, 0, 0, 1, 1,
0.795372, 1.620692, 0.5076261, 1, 0, 0, 1, 1,
0.7988918, 1.609778, 1.992877, 1, 0, 0, 1, 1,
0.8002377, -0.914783, 1.280208, 1, 0, 0, 1, 1,
0.8003468, -0.279155, 1.461134, 1, 0, 0, 1, 1,
0.8009028, 0.3779273, 2.076569, 0, 0, 0, 1, 1,
0.8072834, -0.2618287, 1.295602, 0, 0, 0, 1, 1,
0.8106506, -1.004513, 1.570635, 0, 0, 0, 1, 1,
0.81526, -0.758972, 2.487512, 0, 0, 0, 1, 1,
0.8169097, 1.258206, 0.9630773, 0, 0, 0, 1, 1,
0.8192585, 1.203968, -0.2019038, 0, 0, 0, 1, 1,
0.82296, 1.203331, 1.875385, 0, 0, 0, 1, 1,
0.8261825, -0.06271461, 0.5768265, 1, 1, 1, 1, 1,
0.8277284, -2.351523, 1.588263, 1, 1, 1, 1, 1,
0.8336313, 1.912523, 1.675893, 1, 1, 1, 1, 1,
0.8340337, -0.346135, 2.591471, 1, 1, 1, 1, 1,
0.8404728, -0.1000072, 2.568611, 1, 1, 1, 1, 1,
0.8410953, -0.9349014, 1.835826, 1, 1, 1, 1, 1,
0.8420643, 1.142237, 0.3031119, 1, 1, 1, 1, 1,
0.8448979, -0.3210206, 0.3647537, 1, 1, 1, 1, 1,
0.8480662, 1.722634, 0.7020727, 1, 1, 1, 1, 1,
0.8511186, -2.460686, 2.092242, 1, 1, 1, 1, 1,
0.8540391, 0.3198236, 0.8977799, 1, 1, 1, 1, 1,
0.8542693, 0.2008143, 1.608437, 1, 1, 1, 1, 1,
0.8563968, -0.6138324, 3.560989, 1, 1, 1, 1, 1,
0.8572588, 2.154604, 1.122456, 1, 1, 1, 1, 1,
0.8586103, 1.134393, 0.6432196, 1, 1, 1, 1, 1,
0.8618432, 0.5487524, 0.431693, 0, 0, 1, 1, 1,
0.864511, 1.10152, 0.2089535, 1, 0, 0, 1, 1,
0.8822873, -0.653057, 1.315065, 1, 0, 0, 1, 1,
0.8857109, -0.6152843, 1.939116, 1, 0, 0, 1, 1,
0.8912122, 0.5132926, 0.3375327, 1, 0, 0, 1, 1,
0.8956128, -2.005348, 3.067279, 1, 0, 0, 1, 1,
0.8968706, 1.176318, 1.136309, 0, 0, 0, 1, 1,
0.8980849, -0.09552927, 1.303881, 0, 0, 0, 1, 1,
0.914454, -0.5167524, 1.664213, 0, 0, 0, 1, 1,
0.9153516, -0.4963338, 3.00429, 0, 0, 0, 1, 1,
0.9223749, -1.60878, 3.134539, 0, 0, 0, 1, 1,
0.9236101, 0.733734, 1.130845, 0, 0, 0, 1, 1,
0.9243387, 1.435356, -0.3565071, 0, 0, 0, 1, 1,
0.9346281, 0.709193, 0.3693513, 1, 1, 1, 1, 1,
0.9365005, -0.3725817, 0.6551376, 1, 1, 1, 1, 1,
0.9373193, -0.06062692, 2.75914, 1, 1, 1, 1, 1,
0.9388312, -0.9337893, 2.870784, 1, 1, 1, 1, 1,
0.938952, -0.9830403, 3.641812, 1, 1, 1, 1, 1,
0.9478365, -0.4864656, 2.664084, 1, 1, 1, 1, 1,
0.9485535, 0.7238901, 2.14979, 1, 1, 1, 1, 1,
0.9494836, 0.1195896, 1.713931, 1, 1, 1, 1, 1,
0.9548807, 0.03578493, 0.6525826, 1, 1, 1, 1, 1,
0.9585305, 2.421188, 0.2176966, 1, 1, 1, 1, 1,
0.9689569, -0.1089398, 1.00478, 1, 1, 1, 1, 1,
0.9757609, 0.5375412, 1.441728, 1, 1, 1, 1, 1,
0.9842203, -0.330353, 4.074495, 1, 1, 1, 1, 1,
0.9849735, 0.1151469, 0.7142853, 1, 1, 1, 1, 1,
0.9850411, 0.5689657, -0.4379122, 1, 1, 1, 1, 1,
0.9850907, 2.307087, -0.5745453, 0, 0, 1, 1, 1,
1.004906, 1.201592, -0.1481051, 1, 0, 0, 1, 1,
1.007254, -0.823732, 1.169036, 1, 0, 0, 1, 1,
1.007268, -0.5108048, 3.076891, 1, 0, 0, 1, 1,
1.012382, -1.457891, 3.240262, 1, 0, 0, 1, 1,
1.014298, 1.3035, 0.6220504, 1, 0, 0, 1, 1,
1.018028, -2.036523, 1.982956, 0, 0, 0, 1, 1,
1.019859, 0.1967945, 1.768563, 0, 0, 0, 1, 1,
1.031517, -0.7406, 2.287246, 0, 0, 0, 1, 1,
1.036165, -1.013629, 1.446039, 0, 0, 0, 1, 1,
1.036883, -0.9587294, 0.9090563, 0, 0, 0, 1, 1,
1.040747, 0.1879618, 0.1077426, 0, 0, 0, 1, 1,
1.043291, -0.158458, 1.498362, 0, 0, 0, 1, 1,
1.052534, -1.296224, 4.000672, 1, 1, 1, 1, 1,
1.055011, -0.5904387, 1.599921, 1, 1, 1, 1, 1,
1.057104, -0.8397485, 2.146065, 1, 1, 1, 1, 1,
1.061633, 1.168108, 0.8759464, 1, 1, 1, 1, 1,
1.065523, -1.679104, 2.009465, 1, 1, 1, 1, 1,
1.078631, 0.78513, 2.200908, 1, 1, 1, 1, 1,
1.082409, -0.9192203, 3.679797, 1, 1, 1, 1, 1,
1.088756, 1.034063, 2.443779, 1, 1, 1, 1, 1,
1.089744, 0.2410263, 0.8838214, 1, 1, 1, 1, 1,
1.091003, -1.013062, 2.428086, 1, 1, 1, 1, 1,
1.097451, -0.4791109, 2.87995, 1, 1, 1, 1, 1,
1.103857, -2.541541, 2.099143, 1, 1, 1, 1, 1,
1.10402, -0.7139328, 3.24603, 1, 1, 1, 1, 1,
1.110248, 0.037597, 0.7549499, 1, 1, 1, 1, 1,
1.112303, -0.11615, 1.016924, 1, 1, 1, 1, 1,
1.120224, -1.804943, 3.476972, 0, 0, 1, 1, 1,
1.121247, 1.730309, 2.086896, 1, 0, 0, 1, 1,
1.123127, -1.283122, 1.079753, 1, 0, 0, 1, 1,
1.128724, -0.983398, 2.486352, 1, 0, 0, 1, 1,
1.129122, -0.8871589, 2.081138, 1, 0, 0, 1, 1,
1.12922, 0.2263126, 0.2731883, 1, 0, 0, 1, 1,
1.136009, 0.0676457, 1.32068, 0, 0, 0, 1, 1,
1.145532, -0.9078568, 1.700024, 0, 0, 0, 1, 1,
1.148817, -0.6591383, 0.7584099, 0, 0, 0, 1, 1,
1.152747, 1.252716, 0.2798612, 0, 0, 0, 1, 1,
1.166579, -0.4577747, 2.177331, 0, 0, 0, 1, 1,
1.168771, -0.7194325, 1.174765, 0, 0, 0, 1, 1,
1.177011, -1.329543, 0.6945269, 0, 0, 0, 1, 1,
1.18239, -0.4892125, 3.239248, 1, 1, 1, 1, 1,
1.183427, -0.2136764, 2.387609, 1, 1, 1, 1, 1,
1.183492, 1.322536, 0.5375413, 1, 1, 1, 1, 1,
1.194314, 0.2005568, 1.202905, 1, 1, 1, 1, 1,
1.197693, 1.941051, 0.5592881, 1, 1, 1, 1, 1,
1.199178, -0.3879818, 1.845939, 1, 1, 1, 1, 1,
1.19944, 0.5076647, 0.5054909, 1, 1, 1, 1, 1,
1.20279, -1.295602, 2.798462, 1, 1, 1, 1, 1,
1.20473, -0.6541855, 3.116533, 1, 1, 1, 1, 1,
1.206423, 0.06518304, 2.815498, 1, 1, 1, 1, 1,
1.209114, 0.8621863, 1.627506, 1, 1, 1, 1, 1,
1.212001, -1.334391, 2.678383, 1, 1, 1, 1, 1,
1.213521, -0.2624147, 2.235797, 1, 1, 1, 1, 1,
1.214192, 0.773516, 1.616657, 1, 1, 1, 1, 1,
1.226181, 0.1913804, 1.180333, 1, 1, 1, 1, 1,
1.234797, -1.648652, 3.19118, 0, 0, 1, 1, 1,
1.242658, -0.4352864, 0.5503311, 1, 0, 0, 1, 1,
1.248022, -1.940265, 1.300522, 1, 0, 0, 1, 1,
1.251706, -0.5665443, 2.559859, 1, 0, 0, 1, 1,
1.276352, -0.6766725, 1.72741, 1, 0, 0, 1, 1,
1.279145, -1.377626, 2.879901, 1, 0, 0, 1, 1,
1.286428, 2.195657, 1.83746, 0, 0, 0, 1, 1,
1.29487, 1.012826, -0.4633742, 0, 0, 0, 1, 1,
1.300087, -0.3155065, 1.186314, 0, 0, 0, 1, 1,
1.312706, -0.5789357, 2.476814, 0, 0, 0, 1, 1,
1.315329, -0.6171458, 1.461794, 0, 0, 0, 1, 1,
1.319095, -0.519003, 2.739028, 0, 0, 0, 1, 1,
1.32016, -0.1454586, -0.4072953, 0, 0, 0, 1, 1,
1.32915, 1.216779, 0.5978816, 1, 1, 1, 1, 1,
1.341416, -0.5991992, 2.591769, 1, 1, 1, 1, 1,
1.345569, -1.762446, 1.057776, 1, 1, 1, 1, 1,
1.348409, -1.243849, 1.439962, 1, 1, 1, 1, 1,
1.35794, 1.382951, 0.2748244, 1, 1, 1, 1, 1,
1.361287, 0.3324412, 0.7035487, 1, 1, 1, 1, 1,
1.369117, 0.6731626, -0.4267009, 1, 1, 1, 1, 1,
1.383525, -0.8782756, 3.966232, 1, 1, 1, 1, 1,
1.390083, -0.1404835, 2.513033, 1, 1, 1, 1, 1,
1.391397, -0.6555141, 0.6750885, 1, 1, 1, 1, 1,
1.399388, -1.685747, 1.974153, 1, 1, 1, 1, 1,
1.401429, -0.8400403, 2.181897, 1, 1, 1, 1, 1,
1.405397, -1.241424, 1.60147, 1, 1, 1, 1, 1,
1.417298, -1.289349, 2.698595, 1, 1, 1, 1, 1,
1.427428, 0.9236782, 0.7965168, 1, 1, 1, 1, 1,
1.435079, -1.612853, 3.139958, 0, 0, 1, 1, 1,
1.450794, 1.545304, 2.380571, 1, 0, 0, 1, 1,
1.462205, -2.259819, 3.500726, 1, 0, 0, 1, 1,
1.473788, 2.148441, 0.9800096, 1, 0, 0, 1, 1,
1.477495, 0.5065927, 2.123791, 1, 0, 0, 1, 1,
1.48001, 0.1023032, 0.3427894, 1, 0, 0, 1, 1,
1.481055, -0.9808547, 1.426657, 0, 0, 0, 1, 1,
1.494632, -0.5107384, 3.159015, 0, 0, 0, 1, 1,
1.502571, 1.592169, 1.483606, 0, 0, 0, 1, 1,
1.504059, 0.4201703, -0.07400386, 0, 0, 0, 1, 1,
1.504268, 0.9263295, -0.7922803, 0, 0, 0, 1, 1,
1.507728, 0.2186142, 1.619995, 0, 0, 0, 1, 1,
1.512705, -0.01322828, 0.9642099, 0, 0, 0, 1, 1,
1.514139, -1.24463, 3.291298, 1, 1, 1, 1, 1,
1.519709, 0.8043066, 1.821009, 1, 1, 1, 1, 1,
1.521454, 0.2797275, 1.931008, 1, 1, 1, 1, 1,
1.523859, -0.1131934, 1.879296, 1, 1, 1, 1, 1,
1.530438, 0.7304047, 0.2772292, 1, 1, 1, 1, 1,
1.534227, 1.979935, 0.6146776, 1, 1, 1, 1, 1,
1.550085, 0.5843939, 1.583883, 1, 1, 1, 1, 1,
1.552635, 0.252505, 3.87745, 1, 1, 1, 1, 1,
1.566188, 1.401441, -0.6685138, 1, 1, 1, 1, 1,
1.574058, -0.4467859, 0.9486174, 1, 1, 1, 1, 1,
1.605078, 0.2367058, 0.4758685, 1, 1, 1, 1, 1,
1.611373, 1.267267, 1.686934, 1, 1, 1, 1, 1,
1.617356, -1.101196, -0.4626807, 1, 1, 1, 1, 1,
1.630565, -1.508896, 1.806153, 1, 1, 1, 1, 1,
1.636723, 1.234918, 0.6567941, 1, 1, 1, 1, 1,
1.640775, -1.085653, 2.285747, 0, 0, 1, 1, 1,
1.645623, -0.6891265, 1.411626, 1, 0, 0, 1, 1,
1.648796, 1.189112, 1.591258, 1, 0, 0, 1, 1,
1.655839, 1.010608, 2.748215, 1, 0, 0, 1, 1,
1.67876, 0.7746506, 2.461598, 1, 0, 0, 1, 1,
1.690863, 0.8379555, 3.515416, 1, 0, 0, 1, 1,
1.712888, 0.9560223, 0.8118942, 0, 0, 0, 1, 1,
1.728807, -0.372578, 3.773789, 0, 0, 0, 1, 1,
1.733159, 0.9817309, 1.34834, 0, 0, 0, 1, 1,
1.74026, -0.00927117, 0.5010859, 0, 0, 0, 1, 1,
1.742839, 0.06209979, 2.292392, 0, 0, 0, 1, 1,
1.764742, 0.01360823, 1.337888, 0, 0, 0, 1, 1,
1.791022, 0.09091102, 0.1358537, 0, 0, 0, 1, 1,
1.794738, 1.013397, 0.5751703, 1, 1, 1, 1, 1,
1.825808, 0.1748821, 3.074279, 1, 1, 1, 1, 1,
1.839434, 0.08975106, 2.681311, 1, 1, 1, 1, 1,
1.860544, -0.2323122, 2.334289, 1, 1, 1, 1, 1,
1.868095, 1.250921, -0.08849417, 1, 1, 1, 1, 1,
1.869171, 0.1526023, 2.151869, 1, 1, 1, 1, 1,
1.885904, 0.625337, 1.843832, 1, 1, 1, 1, 1,
1.889732, 0.1642473, 1.250141, 1, 1, 1, 1, 1,
1.893718, -1.418851, 1.270284, 1, 1, 1, 1, 1,
1.910193, 0.2095746, 0.1171228, 1, 1, 1, 1, 1,
1.921381, 0.7075847, 3.605078, 1, 1, 1, 1, 1,
1.93033, 1.722634, 2.093202, 1, 1, 1, 1, 1,
1.946993, -0.5980296, 1.537751, 1, 1, 1, 1, 1,
1.967104, 0.304486, 0.9613228, 1, 1, 1, 1, 1,
2.012531, 1.060187, 0.7214334, 1, 1, 1, 1, 1,
2.018172, -0.16651, 2.380899, 0, 0, 1, 1, 1,
2.058287, 1.136531, 2.572479, 1, 0, 0, 1, 1,
2.095396, 0.2710342, 2.236525, 1, 0, 0, 1, 1,
2.121479, 0.1646068, 0.9985973, 1, 0, 0, 1, 1,
2.184122, 0.4912961, -0.1253239, 1, 0, 0, 1, 1,
2.188102, 1.082817, 2.052573, 1, 0, 0, 1, 1,
2.233586, -0.2118576, 1.831353, 0, 0, 0, 1, 1,
2.291986, 0.1999347, 1.658554, 0, 0, 0, 1, 1,
2.340866, 0.7667726, 2.632402, 0, 0, 0, 1, 1,
2.353862, 1.063615, 1.218376, 0, 0, 0, 1, 1,
2.412895, 0.07125314, 1.665182, 0, 0, 0, 1, 1,
2.436818, 0.824197, 1.095709, 0, 0, 0, 1, 1,
2.508406, 0.4944868, 2.898643, 0, 0, 0, 1, 1,
2.532996, 1.517473, 0.2536913, 1, 1, 1, 1, 1,
2.555646, -0.3269289, 2.807793, 1, 1, 1, 1, 1,
2.580039, 0.5246075, 1.619198, 1, 1, 1, 1, 1,
2.58323, 0.5954916, 1.586453, 1, 1, 1, 1, 1,
2.627378, -0.01672416, 2.111667, 1, 1, 1, 1, 1,
2.638748, -0.3096878, 0.07618285, 1, 1, 1, 1, 1,
2.834372, -0.7214804, 2.208966, 1, 1, 1, 1, 1
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
var radius = 9.545943;
var distance = 33.52972;
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
mvMatrix.translate( 0.3661002, -0.2090559, -0.1399248 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.52972);
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