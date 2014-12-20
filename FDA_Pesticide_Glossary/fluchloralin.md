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
-3.431175, -0.7337256, -0.7063608, 1, 0, 0, 1,
-3.045433, -0.08156251, -1.513203, 1, 0.007843138, 0, 1,
-2.747527, -2.380504, -3.421315, 1, 0.01176471, 0, 1,
-2.714069, 0.5967211, -1.619645, 1, 0.01960784, 0, 1,
-2.700486, -0.6851245, -1.650465, 1, 0.02352941, 0, 1,
-2.485599, 0.7668205, -0.8822357, 1, 0.03137255, 0, 1,
-2.434507, -0.1643662, -1.979619, 1, 0.03529412, 0, 1,
-2.380227, -0.2765366, -1.659282, 1, 0.04313726, 0, 1,
-2.246382, 1.850676, 0.4377993, 1, 0.04705882, 0, 1,
-2.1856, -0.5787687, -1.102191, 1, 0.05490196, 0, 1,
-2.172221, 1.236341, -2.881224, 1, 0.05882353, 0, 1,
-2.152737, -1.571056, -1.672815, 1, 0.06666667, 0, 1,
-2.132969, 1.250935, 0.02446261, 1, 0.07058824, 0, 1,
-2.088186, 1.038, -1.337833, 1, 0.07843138, 0, 1,
-2.067826, -1.421806, -1.525631, 1, 0.08235294, 0, 1,
-2.033454, 0.4216763, 0.2687462, 1, 0.09019608, 0, 1,
-2.007071, -1.418937, -4.268076, 1, 0.09411765, 0, 1,
-1.952143, -0.6555386, -2.539325, 1, 0.1019608, 0, 1,
-1.870598, 0.001854236, -1.913851, 1, 0.1098039, 0, 1,
-1.855247, -1.304135, -2.012173, 1, 0.1137255, 0, 1,
-1.849554, 0.8831789, -1.456698, 1, 0.1215686, 0, 1,
-1.843609, -0.8572174, -2.209543, 1, 0.1254902, 0, 1,
-1.827267, 0.348492, -0.5140026, 1, 0.1333333, 0, 1,
-1.823654, -0.8493565, -1.368559, 1, 0.1372549, 0, 1,
-1.813034, -1.58189, -2.333865, 1, 0.145098, 0, 1,
-1.799968, -0.5439003, -2.688235, 1, 0.1490196, 0, 1,
-1.796962, -0.1884751, -1.480081, 1, 0.1568628, 0, 1,
-1.774581, -0.3380075, -1.327849, 1, 0.1607843, 0, 1,
-1.760258, 0.5171381, -0.2649961, 1, 0.1686275, 0, 1,
-1.744034, 0.1042816, -0.3096198, 1, 0.172549, 0, 1,
-1.7377, -1.179458, -3.340399, 1, 0.1803922, 0, 1,
-1.734225, -0.2038281, -0.6939937, 1, 0.1843137, 0, 1,
-1.731079, -0.1701179, 0.09957661, 1, 0.1921569, 0, 1,
-1.692372, 0.4032632, -1.181524, 1, 0.1960784, 0, 1,
-1.687617, -0.04194417, -2.163339, 1, 0.2039216, 0, 1,
-1.677946, -1.864261, -2.070601, 1, 0.2117647, 0, 1,
-1.674278, -1.390448, -2.875128, 1, 0.2156863, 0, 1,
-1.661383, -0.8969671, -3.286481, 1, 0.2235294, 0, 1,
-1.648698, 1.582841, -1.983723, 1, 0.227451, 0, 1,
-1.625151, 0.1239474, -0.9154366, 1, 0.2352941, 0, 1,
-1.614443, -0.1158857, -1.229844, 1, 0.2392157, 0, 1,
-1.610128, 1.263932, -0.6524113, 1, 0.2470588, 0, 1,
-1.608899, -0.3386896, -1.911255, 1, 0.2509804, 0, 1,
-1.601927, -1.64213, -2.352532, 1, 0.2588235, 0, 1,
-1.592391, 1.349197, -2.741913, 1, 0.2627451, 0, 1,
-1.581537, -0.04295884, -1.382542, 1, 0.2705882, 0, 1,
-1.565192, -0.5783002, -3.409968, 1, 0.2745098, 0, 1,
-1.554904, -0.5602916, -2.686361, 1, 0.282353, 0, 1,
-1.546143, 0.7872127, -3.290424, 1, 0.2862745, 0, 1,
-1.545942, 0.7694274, -0.4378147, 1, 0.2941177, 0, 1,
-1.529938, -1.611619, -3.191344, 1, 0.3019608, 0, 1,
-1.526754, 2.62701, -1.543293, 1, 0.3058824, 0, 1,
-1.519765, 0.5041307, -0.210435, 1, 0.3137255, 0, 1,
-1.515072, -0.9802526, -2.4115, 1, 0.3176471, 0, 1,
-1.514643, -0.6207038, -3.146915, 1, 0.3254902, 0, 1,
-1.51348, 0.2283858, -1.118687, 1, 0.3294118, 0, 1,
-1.507144, 1.411456, -0.3620841, 1, 0.3372549, 0, 1,
-1.505466, -0.1262418, -1.243255, 1, 0.3411765, 0, 1,
-1.502877, -1.139216, -2.38342, 1, 0.3490196, 0, 1,
-1.501455, 0.1740165, -1.522167, 1, 0.3529412, 0, 1,
-1.46582, 1.455833, -0.429728, 1, 0.3607843, 0, 1,
-1.45285, 0.1597657, -0.430852, 1, 0.3647059, 0, 1,
-1.449031, 1.049388, -1.352276, 1, 0.372549, 0, 1,
-1.446107, -0.6401379, -0.3923444, 1, 0.3764706, 0, 1,
-1.432364, -1.761025, -2.129342, 1, 0.3843137, 0, 1,
-1.412588, -2.024074, -2.976682, 1, 0.3882353, 0, 1,
-1.400347, -0.1647889, -0.8312122, 1, 0.3960784, 0, 1,
-1.394731, 0.1421809, -0.5394022, 1, 0.4039216, 0, 1,
-1.394586, -0.05741125, -1.830686, 1, 0.4078431, 0, 1,
-1.393484, -0.9963626, -0.6831849, 1, 0.4156863, 0, 1,
-1.393182, -0.3855951, -1.517997, 1, 0.4196078, 0, 1,
-1.391379, -1.162131, -3.318059, 1, 0.427451, 0, 1,
-1.387918, 0.5459819, -1.526757, 1, 0.4313726, 0, 1,
-1.380109, -0.2728534, -1.402822, 1, 0.4392157, 0, 1,
-1.378348, 1.277195, -0.6110955, 1, 0.4431373, 0, 1,
-1.369621, 0.8151106, -1.166077, 1, 0.4509804, 0, 1,
-1.366255, 0.604401, -3.090721, 1, 0.454902, 0, 1,
-1.361634, -0.02126996, -1.316818, 1, 0.4627451, 0, 1,
-1.359775, -0.1738634, -3.200842, 1, 0.4666667, 0, 1,
-1.353113, 0.5069591, -1.720258, 1, 0.4745098, 0, 1,
-1.34771, 1.59065, 1.253639, 1, 0.4784314, 0, 1,
-1.34417, 1.444069, -0.9054425, 1, 0.4862745, 0, 1,
-1.34202, 0.3330445, -0.3196147, 1, 0.4901961, 0, 1,
-1.332853, 1.109362, -1.01984, 1, 0.4980392, 0, 1,
-1.329887, -1.342858, -2.221403, 1, 0.5058824, 0, 1,
-1.325035, -0.2639721, -0.752726, 1, 0.509804, 0, 1,
-1.314203, 0.311305, -0.5904513, 1, 0.5176471, 0, 1,
-1.312737, 0.3637463, -2.243046, 1, 0.5215687, 0, 1,
-1.310132, -0.0998755, 0.4044282, 1, 0.5294118, 0, 1,
-1.30811, 0.8661407, -1.53769, 1, 0.5333334, 0, 1,
-1.30259, 0.7643424, -2.124558, 1, 0.5411765, 0, 1,
-1.294552, 0.3149908, -1.457624, 1, 0.5450981, 0, 1,
-1.291899, -0.2203205, -1.246995, 1, 0.5529412, 0, 1,
-1.281946, -0.07172527, -1.940882, 1, 0.5568628, 0, 1,
-1.273696, -1.415541, -2.482485, 1, 0.5647059, 0, 1,
-1.267954, -0.6026898, -3.725899, 1, 0.5686275, 0, 1,
-1.267041, 0.9396437, -0.7116835, 1, 0.5764706, 0, 1,
-1.266131, 0.9287503, -1.307243, 1, 0.5803922, 0, 1,
-1.248699, 1.935176, -0.07892771, 1, 0.5882353, 0, 1,
-1.245283, -0.5804181, 0.156612, 1, 0.5921569, 0, 1,
-1.235628, 0.4748396, -2.282814, 1, 0.6, 0, 1,
-1.222352, 1.691626, -2.27614, 1, 0.6078432, 0, 1,
-1.219092, 0.4742528, 0.4287938, 1, 0.6117647, 0, 1,
-1.218627, -0.173586, -2.543317, 1, 0.6196079, 0, 1,
-1.216814, 0.2439586, 0.7028706, 1, 0.6235294, 0, 1,
-1.212714, -1.546253, -2.282495, 1, 0.6313726, 0, 1,
-1.203275, -0.6635017, -2.262779, 1, 0.6352941, 0, 1,
-1.192553, -1.878757, -3.307676, 1, 0.6431373, 0, 1,
-1.190506, -0.2989655, -3.017758, 1, 0.6470588, 0, 1,
-1.190273, -0.8858963, -1.477181, 1, 0.654902, 0, 1,
-1.171033, -0.5317835, -0.5829141, 1, 0.6588235, 0, 1,
-1.158244, -0.5954711, -1.662643, 1, 0.6666667, 0, 1,
-1.157241, -1.968303, -1.523676, 1, 0.6705883, 0, 1,
-1.149746, 1.169557, -2.026063, 1, 0.6784314, 0, 1,
-1.148395, 0.07103994, -0.1666691, 1, 0.682353, 0, 1,
-1.141645, -1.084457, -3.011669, 1, 0.6901961, 0, 1,
-1.127134, -0.1103879, -2.312392, 1, 0.6941177, 0, 1,
-1.123178, 0.3593405, -2.845104, 1, 0.7019608, 0, 1,
-1.118263, 1.362422, -1.352286, 1, 0.7098039, 0, 1,
-1.116263, -1.986279, -3.218482, 1, 0.7137255, 0, 1,
-1.115355, 0.7295626, -0.4910895, 1, 0.7215686, 0, 1,
-1.109898, -0.4396029, -3.256617, 1, 0.7254902, 0, 1,
-1.106589, 1.234149, -1.235393, 1, 0.7333333, 0, 1,
-1.104857, 0.8574462, -2.147216, 1, 0.7372549, 0, 1,
-1.104025, -0.583934, -2.494993, 1, 0.7450981, 0, 1,
-1.102017, 0.01093168, -2.861244, 1, 0.7490196, 0, 1,
-1.100289, -0.2716485, -0.7606664, 1, 0.7568628, 0, 1,
-1.09382, -0.2455066, -2.999409, 1, 0.7607843, 0, 1,
-1.084434, -0.3097664, -1.375389, 1, 0.7686275, 0, 1,
-1.083794, -0.6585897, -2.117008, 1, 0.772549, 0, 1,
-1.081412, -0.6376672, -2.382419, 1, 0.7803922, 0, 1,
-1.076073, -0.2232045, -1.377248, 1, 0.7843137, 0, 1,
-1.068495, -0.5331524, -1.159785, 1, 0.7921569, 0, 1,
-1.065093, 0.8634661, -1.173085, 1, 0.7960784, 0, 1,
-1.062425, -0.3908352, -2.421008, 1, 0.8039216, 0, 1,
-1.05868, 0.8512967, -1.291281, 1, 0.8117647, 0, 1,
-1.058462, -2.414713, -3.625478, 1, 0.8156863, 0, 1,
-1.052171, -0.1568782, -2.226996, 1, 0.8235294, 0, 1,
-1.038784, -0.2897878, -0.784248, 1, 0.827451, 0, 1,
-1.033641, 0.9384095, 0.4970937, 1, 0.8352941, 0, 1,
-1.031792, -1.010387, -1.202756, 1, 0.8392157, 0, 1,
-1.026812, 0.5846198, -1.262324, 1, 0.8470588, 0, 1,
-1.023621, 0.4346614, -0.4239942, 1, 0.8509804, 0, 1,
-1.022825, 1.774479, -0.3261224, 1, 0.8588235, 0, 1,
-1.022626, 0.948423, 0.9356598, 1, 0.8627451, 0, 1,
-1.01422, 0.1776678, -1.068132, 1, 0.8705882, 0, 1,
-1.012405, 1.261935, 0.1181141, 1, 0.8745098, 0, 1,
-1.011218, -0.8543734, -1.730652, 1, 0.8823529, 0, 1,
-1.008477, -1.192379, -3.279436, 1, 0.8862745, 0, 1,
-1.004756, 2.272321, -1.237851, 1, 0.8941177, 0, 1,
-1.000754, 0.4686697, -1.640503, 1, 0.8980392, 0, 1,
-0.9997941, -0.2321226, -0.7601088, 1, 0.9058824, 0, 1,
-0.9990162, -0.8347552, -0.0974056, 1, 0.9137255, 0, 1,
-0.9969316, 0.2739885, -2.039463, 1, 0.9176471, 0, 1,
-0.9936285, -0.2942819, -2.853251, 1, 0.9254902, 0, 1,
-0.9839544, -0.8302395, -3.81174, 1, 0.9294118, 0, 1,
-0.9814583, 0.4765295, -2.002838, 1, 0.9372549, 0, 1,
-0.9722092, 0.6098301, 0.7430739, 1, 0.9411765, 0, 1,
-0.9638393, -0.6832046, -1.665186, 1, 0.9490196, 0, 1,
-0.9579301, 0.4886885, -0.5169523, 1, 0.9529412, 0, 1,
-0.9561219, 0.04840792, -2.8169, 1, 0.9607843, 0, 1,
-0.9549738, -0.9178391, -1.088705, 1, 0.9647059, 0, 1,
-0.9491746, -0.4476731, -3.573746, 1, 0.972549, 0, 1,
-0.9357731, 0.6689541, -1.902612, 1, 0.9764706, 0, 1,
-0.9355704, 0.2276385, -0.3001682, 1, 0.9843137, 0, 1,
-0.9319659, 1.145324, -1.490958, 1, 0.9882353, 0, 1,
-0.9275653, -0.3384773, -1.289345, 1, 0.9960784, 0, 1,
-0.9204105, 1.196123, 1.665627, 0.9960784, 1, 0, 1,
-0.9190933, 1.068758, -0.711859, 0.9921569, 1, 0, 1,
-0.9144915, -1.072282, -1.038138, 0.9843137, 1, 0, 1,
-0.9129964, 0.9422309, -3.302299, 0.9803922, 1, 0, 1,
-0.9069925, 0.2197842, -2.49654, 0.972549, 1, 0, 1,
-0.9069358, -1.264002, -2.439035, 0.9686275, 1, 0, 1,
-0.9062374, -0.7434828, -0.6221976, 0.9607843, 1, 0, 1,
-0.9029832, 0.5486613, -0.6310859, 0.9568627, 1, 0, 1,
-0.8966662, -1.552585, -1.498355, 0.9490196, 1, 0, 1,
-0.8961688, -0.1257736, -1.537654, 0.945098, 1, 0, 1,
-0.8955448, 0.3112784, 1.816144, 0.9372549, 1, 0, 1,
-0.8948936, 1.445137, -1.53073, 0.9333333, 1, 0, 1,
-0.8846417, 0.307659, -3.313114, 0.9254902, 1, 0, 1,
-0.8846283, 0.3322764, -0.06812472, 0.9215686, 1, 0, 1,
-0.884471, 0.7693366, -0.9397913, 0.9137255, 1, 0, 1,
-0.8830882, -1.885949, -4.478212, 0.9098039, 1, 0, 1,
-0.8811793, -0.3215602, -2.787224, 0.9019608, 1, 0, 1,
-0.8794699, -0.3246728, -2.288789, 0.8941177, 1, 0, 1,
-0.8664051, -0.48896, -3.343781, 0.8901961, 1, 0, 1,
-0.8555295, 0.4637846, -0.3075979, 0.8823529, 1, 0, 1,
-0.847532, -0.857411, -2.75676, 0.8784314, 1, 0, 1,
-0.8436038, -0.654733, -0.3435449, 0.8705882, 1, 0, 1,
-0.8411511, 0.1639097, -0.003193303, 0.8666667, 1, 0, 1,
-0.8378937, 2.068982, -1.147237, 0.8588235, 1, 0, 1,
-0.8305793, -0.4977539, -0.8597798, 0.854902, 1, 0, 1,
-0.827894, -1.54664, -2.106423, 0.8470588, 1, 0, 1,
-0.8266001, 1.020656, -0.777852, 0.8431373, 1, 0, 1,
-0.8263716, -1.539197, -3.948312, 0.8352941, 1, 0, 1,
-0.8237324, -0.6710505, -2.301037, 0.8313726, 1, 0, 1,
-0.8211465, 0.03143706, -1.141198, 0.8235294, 1, 0, 1,
-0.8187299, -0.5582826, -3.474925, 0.8196079, 1, 0, 1,
-0.8112094, -0.3633935, -1.747522, 0.8117647, 1, 0, 1,
-0.806308, 0.2087414, -1.148153, 0.8078431, 1, 0, 1,
-0.8030929, -0.3144838, -0.2921998, 0.8, 1, 0, 1,
-0.8029125, -0.3540601, -1.222139, 0.7921569, 1, 0, 1,
-0.8010798, 1.077059, -0.02409852, 0.7882353, 1, 0, 1,
-0.7976608, -1.167583, -2.534325, 0.7803922, 1, 0, 1,
-0.7938437, 0.4714829, 0.7533659, 0.7764706, 1, 0, 1,
-0.7928315, 0.7188351, 2.808732, 0.7686275, 1, 0, 1,
-0.7919718, 0.9302523, 0.5797988, 0.7647059, 1, 0, 1,
-0.7887874, -1.038713, -3.210321, 0.7568628, 1, 0, 1,
-0.7886118, -0.07724845, -0.836182, 0.7529412, 1, 0, 1,
-0.7884322, 2.424685, -0.8779053, 0.7450981, 1, 0, 1,
-0.7858806, -0.9170309, -0.6784188, 0.7411765, 1, 0, 1,
-0.7755167, 1.134275, -0.9247189, 0.7333333, 1, 0, 1,
-0.7742255, 0.1723347, -0.6739559, 0.7294118, 1, 0, 1,
-0.7663473, -1.437278, -3.93157, 0.7215686, 1, 0, 1,
-0.7578823, -0.2476695, -1.088961, 0.7176471, 1, 0, 1,
-0.756355, 2.030711, -2.431776, 0.7098039, 1, 0, 1,
-0.7548191, 0.8124654, 0.4813632, 0.7058824, 1, 0, 1,
-0.7480824, 0.9981352, -2.2302, 0.6980392, 1, 0, 1,
-0.7474807, 3.15692, -0.01695118, 0.6901961, 1, 0, 1,
-0.7466557, 1.15337, -1.550211, 0.6862745, 1, 0, 1,
-0.7440581, -0.9948414, -2.354779, 0.6784314, 1, 0, 1,
-0.74235, -0.7686716, -5.492346, 0.6745098, 1, 0, 1,
-0.7418664, 0.4094571, -1.472131, 0.6666667, 1, 0, 1,
-0.7411475, -1.08498, -2.544115, 0.6627451, 1, 0, 1,
-0.7301105, 0.6052819, -1.45215, 0.654902, 1, 0, 1,
-0.728221, -2.299506, -3.254823, 0.6509804, 1, 0, 1,
-0.7203494, 0.05977604, -1.546776, 0.6431373, 1, 0, 1,
-0.7182567, -0.1499518, -0.7382484, 0.6392157, 1, 0, 1,
-0.7043917, -0.1385647, -0.7167068, 0.6313726, 1, 0, 1,
-0.7032224, -1.15595, -1.855334, 0.627451, 1, 0, 1,
-0.6996537, 0.3042032, -2.532121, 0.6196079, 1, 0, 1,
-0.694123, 0.1817555, -0.7836334, 0.6156863, 1, 0, 1,
-0.6925045, -0.1741999, 0.5292086, 0.6078432, 1, 0, 1,
-0.6881139, 0.5935796, -1.966663, 0.6039216, 1, 0, 1,
-0.670706, -0.1747956, -2.015515, 0.5960785, 1, 0, 1,
-0.6700386, -1.51744, -2.973444, 0.5882353, 1, 0, 1,
-0.6656838, 0.682623, -0.1493772, 0.5843138, 1, 0, 1,
-0.6584886, -0.0654555, -1.305732, 0.5764706, 1, 0, 1,
-0.6575037, 0.2945174, -0.05539627, 0.572549, 1, 0, 1,
-0.6561104, 0.3695665, -2.453103, 0.5647059, 1, 0, 1,
-0.6546957, -1.63975, -2.103582, 0.5607843, 1, 0, 1,
-0.6527578, 1.430137, -0.6894749, 0.5529412, 1, 0, 1,
-0.6475627, 0.7184221, -0.6768455, 0.5490196, 1, 0, 1,
-0.646237, -0.07383245, -1.330796, 0.5411765, 1, 0, 1,
-0.6451085, -1.68016, -2.564095, 0.5372549, 1, 0, 1,
-0.6446805, -0.5982238, -2.379263, 0.5294118, 1, 0, 1,
-0.6403359, 0.8387738, -1.836201, 0.5254902, 1, 0, 1,
-0.632663, -1.556443, -3.541596, 0.5176471, 1, 0, 1,
-0.631376, -0.942731, -3.867647, 0.5137255, 1, 0, 1,
-0.6287853, -0.3101967, -2.708266, 0.5058824, 1, 0, 1,
-0.6272308, -1.584944, -1.869156, 0.5019608, 1, 0, 1,
-0.6264365, 0.3053212, -0.8826649, 0.4941176, 1, 0, 1,
-0.6260307, -2.611088, -1.220648, 0.4862745, 1, 0, 1,
-0.6259666, 0.5006292, -1.331322, 0.4823529, 1, 0, 1,
-0.6172919, 0.1643618, -2.725578, 0.4745098, 1, 0, 1,
-0.6164976, 0.9289557, -0.2644954, 0.4705882, 1, 0, 1,
-0.615368, 1.013979, 1.776615, 0.4627451, 1, 0, 1,
-0.6142277, 1.826532, -1.581305, 0.4588235, 1, 0, 1,
-0.6129097, 0.2071991, -1.562809, 0.4509804, 1, 0, 1,
-0.6116588, 0.7152206, -0.6480712, 0.4470588, 1, 0, 1,
-0.6048569, 0.1324602, -1.107243, 0.4392157, 1, 0, 1,
-0.6044356, -1.205041, -1.391669, 0.4352941, 1, 0, 1,
-0.5914751, -0.9539146, -2.421535, 0.427451, 1, 0, 1,
-0.5896081, -3.375906, -3.224684, 0.4235294, 1, 0, 1,
-0.5891584, 0.6109581, -1.572283, 0.4156863, 1, 0, 1,
-0.5835581, -2.177935, -2.841075, 0.4117647, 1, 0, 1,
-0.581055, 0.4454352, -0.07276098, 0.4039216, 1, 0, 1,
-0.5672721, 0.4722496, -2.398425, 0.3960784, 1, 0, 1,
-0.5593787, -1.688249, -1.133017, 0.3921569, 1, 0, 1,
-0.5588837, 1.100136, 0.8093951, 0.3843137, 1, 0, 1,
-0.5517971, 1.630082, 2.159318, 0.3803922, 1, 0, 1,
-0.5511443, 1.257942, -1.328997, 0.372549, 1, 0, 1,
-0.5509438, 1.037938, -1.17935, 0.3686275, 1, 0, 1,
-0.5473412, 0.4226231, -0.1215431, 0.3607843, 1, 0, 1,
-0.5473216, 0.5801899, -1.50655, 0.3568628, 1, 0, 1,
-0.5385404, 1.713968, 0.8342654, 0.3490196, 1, 0, 1,
-0.5377513, 0.1477751, -3.02476, 0.345098, 1, 0, 1,
-0.5353686, -0.02061394, -2.037786, 0.3372549, 1, 0, 1,
-0.5280983, 0.4110607, -1.426634, 0.3333333, 1, 0, 1,
-0.5265896, 1.05967, 0.4686984, 0.3254902, 1, 0, 1,
-0.5256137, 0.05255308, -1.786028, 0.3215686, 1, 0, 1,
-0.5252179, -1.250582, -2.653651, 0.3137255, 1, 0, 1,
-0.5209463, -0.8688223, -2.679038, 0.3098039, 1, 0, 1,
-0.5200121, 1.409808, 0.08535352, 0.3019608, 1, 0, 1,
-0.5174195, 0.9449725, -2.801679, 0.2941177, 1, 0, 1,
-0.51673, -0.7561151, -1.935347, 0.2901961, 1, 0, 1,
-0.5156593, -1.089823, -1.068406, 0.282353, 1, 0, 1,
-0.5147628, -1.394435, -2.138215, 0.2784314, 1, 0, 1,
-0.5118896, 0.05594421, -2.618121, 0.2705882, 1, 0, 1,
-0.5068684, -0.5797572, -5.156383, 0.2666667, 1, 0, 1,
-0.5016854, -0.2899336, -3.233057, 0.2588235, 1, 0, 1,
-0.4954315, 0.8364692, -2.470742, 0.254902, 1, 0, 1,
-0.4790326, 0.5124311, -3.044107, 0.2470588, 1, 0, 1,
-0.4786799, 1.933181, -0.4361436, 0.2431373, 1, 0, 1,
-0.4785693, -1.073919, -2.081566, 0.2352941, 1, 0, 1,
-0.4782361, 2.129664, -0.5127107, 0.2313726, 1, 0, 1,
-0.4745013, 0.3217555, -1.429188, 0.2235294, 1, 0, 1,
-0.468465, -0.5587979, -0.1219574, 0.2196078, 1, 0, 1,
-0.4660888, 1.812089, -0.3194758, 0.2117647, 1, 0, 1,
-0.463331, 1.377061, 0.238916, 0.2078431, 1, 0, 1,
-0.4619984, -0.9152061, -2.214514, 0.2, 1, 0, 1,
-0.4616984, 0.07230379, -2.285136, 0.1921569, 1, 0, 1,
-0.4589583, -0.6854286, -2.299244, 0.1882353, 1, 0, 1,
-0.4556814, 1.003197, -2.958442, 0.1803922, 1, 0, 1,
-0.4519826, -0.3154326, -0.5603781, 0.1764706, 1, 0, 1,
-0.4488239, 0.5636837, -1.176429, 0.1686275, 1, 0, 1,
-0.4483847, -1.30383, -2.237787, 0.1647059, 1, 0, 1,
-0.4465192, 0.3741657, -0.4965695, 0.1568628, 1, 0, 1,
-0.445235, -1.482174, -4.69962, 0.1529412, 1, 0, 1,
-0.4431449, 0.9448418, -1.735205, 0.145098, 1, 0, 1,
-0.4421078, 0.0569177, -2.25789, 0.1411765, 1, 0, 1,
-0.442078, 0.1952487, -1.995262, 0.1333333, 1, 0, 1,
-0.440603, 1.242962, -2.159498, 0.1294118, 1, 0, 1,
-0.4380788, -0.8015929, -3.096272, 0.1215686, 1, 0, 1,
-0.4372386, -0.4972082, 0.0832113, 0.1176471, 1, 0, 1,
-0.4367915, 1.24324, -0.5847823, 0.1098039, 1, 0, 1,
-0.4347643, -0.285719, -2.948505, 0.1058824, 1, 0, 1,
-0.430566, 1.182662, 0.5888014, 0.09803922, 1, 0, 1,
-0.428555, 2.236086, 1.665911, 0.09019608, 1, 0, 1,
-0.4266544, -0.6554837, -0.7846543, 0.08627451, 1, 0, 1,
-0.4249357, 0.7692635, -0.7611879, 0.07843138, 1, 0, 1,
-0.418227, -0.4898965, -3.151826, 0.07450981, 1, 0, 1,
-0.4162798, -1.3748, -2.976082, 0.06666667, 1, 0, 1,
-0.4161968, -0.2650923, -1.049208, 0.0627451, 1, 0, 1,
-0.4135225, -1.095003, -2.59076, 0.05490196, 1, 0, 1,
-0.4069805, 0.7331837, 0.6689808, 0.05098039, 1, 0, 1,
-0.4046995, -2.044778, -2.536831, 0.04313726, 1, 0, 1,
-0.4030745, 0.8846356, -1.841962, 0.03921569, 1, 0, 1,
-0.4010426, 0.1012788, -0.8422953, 0.03137255, 1, 0, 1,
-0.3976311, 0.2077744, -0.3973047, 0.02745098, 1, 0, 1,
-0.3930543, 0.8180243, 0.3192815, 0.01960784, 1, 0, 1,
-0.3899678, -1.124676, -3.028506, 0.01568628, 1, 0, 1,
-0.3794586, 1.295873, 0.7399095, 0.007843138, 1, 0, 1,
-0.37639, -1.816299, -3.547074, 0.003921569, 1, 0, 1,
-0.3759187, -0.6114262, -3.942662, 0, 1, 0.003921569, 1,
-0.3733508, 0.6204338, -1.987529, 0, 1, 0.01176471, 1,
-0.3720449, -0.2531412, -2.672565, 0, 1, 0.01568628, 1,
-0.3710538, 0.4565618, -1.729029, 0, 1, 0.02352941, 1,
-0.3703608, 1.853954, 1.844414, 0, 1, 0.02745098, 1,
-0.3698834, 0.8555053, -0.9868696, 0, 1, 0.03529412, 1,
-0.36759, -0.5743986, -3.352973, 0, 1, 0.03921569, 1,
-0.3672478, 0.4590193, -0.3533612, 0, 1, 0.04705882, 1,
-0.364339, -0.5520511, -2.931476, 0, 1, 0.05098039, 1,
-0.3632717, 0.784936, 1.028302, 0, 1, 0.05882353, 1,
-0.3594254, 0.3198183, -2.106775, 0, 1, 0.0627451, 1,
-0.3586941, -1.775282, -3.574184, 0, 1, 0.07058824, 1,
-0.3551222, -0.6446376, -2.280538, 0, 1, 0.07450981, 1,
-0.3495282, 1.261704, -0.6238038, 0, 1, 0.08235294, 1,
-0.3422221, 0.3603081, -0.9139001, 0, 1, 0.08627451, 1,
-0.3408242, 0.02623203, -0.4757068, 0, 1, 0.09411765, 1,
-0.3396205, 1.018292, -1.521273, 0, 1, 0.1019608, 1,
-0.3355591, -0.8535497, -3.440255, 0, 1, 0.1058824, 1,
-0.3338551, 0.2933207, -2.719426, 0, 1, 0.1137255, 1,
-0.3320085, 0.5901745, -0.8919777, 0, 1, 0.1176471, 1,
-0.3287424, 0.0238665, -2.459779, 0, 1, 0.1254902, 1,
-0.3200851, -0.2473353, -1.492564, 0, 1, 0.1294118, 1,
-0.3156695, 0.1532619, 0.1011514, 0, 1, 0.1372549, 1,
-0.3143423, 0.2790208, -1.512232, 0, 1, 0.1411765, 1,
-0.3116706, -1.532121, -2.445588, 0, 1, 0.1490196, 1,
-0.3109624, -1.194591, -3.056892, 0, 1, 0.1529412, 1,
-0.306108, 0.8137849, 0.2650734, 0, 1, 0.1607843, 1,
-0.3058801, -0.3544608, -1.764048, 0, 1, 0.1647059, 1,
-0.3029864, 0.5503343, 1.647379, 0, 1, 0.172549, 1,
-0.2960746, -0.02474221, 0.1544703, 0, 1, 0.1764706, 1,
-0.2941442, 1.92447, -0.5328978, 0, 1, 0.1843137, 1,
-0.29258, 0.3094774, -1.192752, 0, 1, 0.1882353, 1,
-0.2908647, -0.413555, -2.588013, 0, 1, 0.1960784, 1,
-0.2905798, -0.9755661, -2.974186, 0, 1, 0.2039216, 1,
-0.2878312, -0.3301269, -3.611458, 0, 1, 0.2078431, 1,
-0.2812602, -1.225325, -1.578207, 0, 1, 0.2156863, 1,
-0.2788207, -0.3095957, -2.748686, 0, 1, 0.2196078, 1,
-0.2761054, 0.08682746, -1.627613, 0, 1, 0.227451, 1,
-0.2756673, -0.2268025, -1.379681, 0, 1, 0.2313726, 1,
-0.2754426, 0.6001582, -0.6588481, 0, 1, 0.2392157, 1,
-0.2744827, 1.045372, -0.8239244, 0, 1, 0.2431373, 1,
-0.2741788, -0.7192178, -3.618926, 0, 1, 0.2509804, 1,
-0.263183, -1.069996, -2.719148, 0, 1, 0.254902, 1,
-0.2589852, -0.9394487, -2.88326, 0, 1, 0.2627451, 1,
-0.2569715, -0.7756142, -3.097517, 0, 1, 0.2666667, 1,
-0.2536467, -0.1042958, -0.8324566, 0, 1, 0.2745098, 1,
-0.2528945, 1.563459, 0.3562938, 0, 1, 0.2784314, 1,
-0.2505881, -0.4925802, -2.612513, 0, 1, 0.2862745, 1,
-0.2500764, 0.05218488, -1.089505, 0, 1, 0.2901961, 1,
-0.2483033, 0.1402257, -0.7283223, 0, 1, 0.2980392, 1,
-0.2442723, 0.04584415, -1.398185, 0, 1, 0.3058824, 1,
-0.2383052, 0.03850459, -0.9982058, 0, 1, 0.3098039, 1,
-0.2341241, 1.28051, 0.912228, 0, 1, 0.3176471, 1,
-0.2278055, 1.436756, 0.7210228, 0, 1, 0.3215686, 1,
-0.2221747, -1.655911, -1.846718, 0, 1, 0.3294118, 1,
-0.2187397, -1.250162, -2.588187, 0, 1, 0.3333333, 1,
-0.2105395, 0.2434981, -1.29052, 0, 1, 0.3411765, 1,
-0.2099455, 0.2862906, -0.7700172, 0, 1, 0.345098, 1,
-0.206199, -0.6835563, -1.820025, 0, 1, 0.3529412, 1,
-0.2020708, -0.8746223, -3.393065, 0, 1, 0.3568628, 1,
-0.197349, 0.899738, -0.3822687, 0, 1, 0.3647059, 1,
-0.1931288, 1.490441, -0.7059582, 0, 1, 0.3686275, 1,
-0.1871632, -0.6598358, -1.521917, 0, 1, 0.3764706, 1,
-0.1871323, -0.02839038, -2.831414, 0, 1, 0.3803922, 1,
-0.1857185, -1.68314, -2.414358, 0, 1, 0.3882353, 1,
-0.1852067, 0.03485471, -1.519681, 0, 1, 0.3921569, 1,
-0.1821923, 0.6183867, -1.299728, 0, 1, 0.4, 1,
-0.1771314, 0.5923761, -2.196926, 0, 1, 0.4078431, 1,
-0.172766, 0.7794883, -0.6956443, 0, 1, 0.4117647, 1,
-0.1658175, -0.3463275, -2.412308, 0, 1, 0.4196078, 1,
-0.1570929, 0.04807971, -1.571855, 0, 1, 0.4235294, 1,
-0.1499468, 0.6527433, 1.639751, 0, 1, 0.4313726, 1,
-0.1468194, 2.37728, 0.3769042, 0, 1, 0.4352941, 1,
-0.1447399, 1.232812, 1.318996, 0, 1, 0.4431373, 1,
-0.1393518, 0.4223759, -0.1102281, 0, 1, 0.4470588, 1,
-0.136229, 1.078107, 0.5865914, 0, 1, 0.454902, 1,
-0.1357423, -0.1353901, -2.266442, 0, 1, 0.4588235, 1,
-0.1353478, -0.7702477, -1.030789, 0, 1, 0.4666667, 1,
-0.1310235, -1.137376, -3.87031, 0, 1, 0.4705882, 1,
-0.128954, -0.5661543, -2.044282, 0, 1, 0.4784314, 1,
-0.1236814, -1.130661, -3.636953, 0, 1, 0.4823529, 1,
-0.1231004, -1.292668, -3.423688, 0, 1, 0.4901961, 1,
-0.1227326, 0.1853478, -0.2657782, 0, 1, 0.4941176, 1,
-0.1217258, -0.4475088, -3.126732, 0, 1, 0.5019608, 1,
-0.1207161, -1.315534, -3.539139, 0, 1, 0.509804, 1,
-0.1204054, 0.4336314, -0.5240054, 0, 1, 0.5137255, 1,
-0.1185545, -0.1733235, -2.779453, 0, 1, 0.5215687, 1,
-0.1177173, -0.398009, -4.451062, 0, 1, 0.5254902, 1,
-0.116698, 0.6863993, -1.543858, 0, 1, 0.5333334, 1,
-0.1141214, -0.2915534, -3.474519, 0, 1, 0.5372549, 1,
-0.1132397, 0.8636543, -1.733353, 0, 1, 0.5450981, 1,
-0.1117764, -0.002169722, -0.5876659, 0, 1, 0.5490196, 1,
-0.1002559, 0.9821594, 0.7739878, 0, 1, 0.5568628, 1,
-0.096255, -1.038535, -4.913413, 0, 1, 0.5607843, 1,
-0.09250139, 0.5629446, 1.370409, 0, 1, 0.5686275, 1,
-0.08730704, -1.274689, -3.264424, 0, 1, 0.572549, 1,
-0.08678509, 2.116746, 0.06601391, 0, 1, 0.5803922, 1,
-0.08349132, -0.100499, -2.925155, 0, 1, 0.5843138, 1,
-0.08196072, 0.08970275, -1.721036, 0, 1, 0.5921569, 1,
-0.08159633, 1.685405, 1.038061, 0, 1, 0.5960785, 1,
-0.08002761, -2.049689, -2.654115, 0, 1, 0.6039216, 1,
-0.07779561, 0.5084893, 0.4103206, 0, 1, 0.6117647, 1,
-0.06979477, -0.3159299, -3.132625, 0, 1, 0.6156863, 1,
-0.0697137, 0.2130962, -0.0506638, 0, 1, 0.6235294, 1,
-0.06792261, 0.3535993, -0.3065435, 0, 1, 0.627451, 1,
-0.06178308, -1.156598, -1.486148, 0, 1, 0.6352941, 1,
-0.0579492, 0.1028649, -0.05212139, 0, 1, 0.6392157, 1,
-0.05683295, 0.8097529, 1.804953, 0, 1, 0.6470588, 1,
-0.05488979, 0.6723359, 1.667252, 0, 1, 0.6509804, 1,
-0.05464125, 1.252612, -1.169814, 0, 1, 0.6588235, 1,
-0.0535836, -0.01096589, -2.690837, 0, 1, 0.6627451, 1,
-0.05329818, 1.006162, 0.4704047, 0, 1, 0.6705883, 1,
-0.05272628, -0.1242456, -3.193887, 0, 1, 0.6745098, 1,
-0.05175734, 0.4763405, 0.9544872, 0, 1, 0.682353, 1,
-0.05104285, -0.7917292, -3.026837, 0, 1, 0.6862745, 1,
-0.05062698, 0.3183662, 0.06762229, 0, 1, 0.6941177, 1,
-0.04819468, 1.567664, -1.861646, 0, 1, 0.7019608, 1,
-0.04405173, 1.094858, -1.779278, 0, 1, 0.7058824, 1,
-0.04035881, -0.3674486, -1.610904, 0, 1, 0.7137255, 1,
-0.04019431, 0.3489824, 1.560798, 0, 1, 0.7176471, 1,
-0.03702527, -0.8521448, -4.409619, 0, 1, 0.7254902, 1,
-0.03690139, 0.1683124, -1.747348, 0, 1, 0.7294118, 1,
-0.03178784, -0.8505462, -3.00696, 0, 1, 0.7372549, 1,
-0.0309359, -1.996018, -1.429727, 0, 1, 0.7411765, 1,
-0.02318062, -0.06543344, -2.051142, 0, 1, 0.7490196, 1,
-0.02123662, 0.3584197, -0.06765955, 0, 1, 0.7529412, 1,
-0.01435049, -1.267439, -4.550567, 0, 1, 0.7607843, 1,
-0.01172349, -0.6139911, -0.7412352, 0, 1, 0.7647059, 1,
-0.01102194, -0.6000003, -2.684515, 0, 1, 0.772549, 1,
-0.01087509, -1.310708, -2.213652, 0, 1, 0.7764706, 1,
-0.007705287, 0.1350857, -1.580182, 0, 1, 0.7843137, 1,
-0.005489772, 0.2696771, 0.9952045, 0, 1, 0.7882353, 1,
-0.004931675, -2.04553, -4.379875, 0, 1, 0.7960784, 1,
-0.001541366, -1.199171, -3.804865, 0, 1, 0.8039216, 1,
0.002225683, 0.600799, 0.9626448, 0, 1, 0.8078431, 1,
0.006450082, 0.3090578, -0.1836055, 0, 1, 0.8156863, 1,
0.006926141, -0.6326658, 3.528989, 0, 1, 0.8196079, 1,
0.007797214, -1.418367, 1.001694, 0, 1, 0.827451, 1,
0.009889142, 0.4632698, -1.012034, 0, 1, 0.8313726, 1,
0.01477954, -2.047539, 1.248091, 0, 1, 0.8392157, 1,
0.01902216, 0.5351408, -0.7817615, 0, 1, 0.8431373, 1,
0.02046312, 1.219851, 0.1400308, 0, 1, 0.8509804, 1,
0.03157481, 0.07053396, -0.2287305, 0, 1, 0.854902, 1,
0.03240983, -1.376611, 4.632212, 0, 1, 0.8627451, 1,
0.03542128, -1.192412, 2.046429, 0, 1, 0.8666667, 1,
0.03614441, 1.577423, 1.839014, 0, 1, 0.8745098, 1,
0.03953543, 0.04112947, 0.1541627, 0, 1, 0.8784314, 1,
0.04486449, -0.8395007, 2.724344, 0, 1, 0.8862745, 1,
0.04884956, -1.880483, 2.621995, 0, 1, 0.8901961, 1,
0.04976925, 0.9699679, 0.9296724, 0, 1, 0.8980392, 1,
0.05752865, 1.220931, 0.6778919, 0, 1, 0.9058824, 1,
0.05765254, -0.3237988, 3.49967, 0, 1, 0.9098039, 1,
0.05827736, 1.87502, -1.260168, 0, 1, 0.9176471, 1,
0.06090274, -0.3632567, 4.477591, 0, 1, 0.9215686, 1,
0.06255638, 0.4042928, -1.382704, 0, 1, 0.9294118, 1,
0.06684224, -0.430143, 3.574312, 0, 1, 0.9333333, 1,
0.0685856, 1.544983, -2.759627, 0, 1, 0.9411765, 1,
0.06909474, 0.06511419, 0.0498139, 0, 1, 0.945098, 1,
0.07083419, -1.113422, 4.281977, 0, 1, 0.9529412, 1,
0.07086613, -1.004446, 2.691385, 0, 1, 0.9568627, 1,
0.07511741, 0.2284983, 1.077554, 0, 1, 0.9647059, 1,
0.07778136, 0.2854591, 0.3870647, 0, 1, 0.9686275, 1,
0.07793369, 0.6456569, 1.969103, 0, 1, 0.9764706, 1,
0.07843527, 0.07851151, -0.1155039, 0, 1, 0.9803922, 1,
0.08115847, 1.782846, -0.3562558, 0, 1, 0.9882353, 1,
0.08375623, 1.741145, -0.3844231, 0, 1, 0.9921569, 1,
0.08565159, -0.9143703, 4.296475, 0, 1, 1, 1,
0.08606862, -1.601354, 3.538406, 0, 0.9921569, 1, 1,
0.0871997, 0.5550054, 2.020492, 0, 0.9882353, 1, 1,
0.09092355, 0.6431844, -0.845463, 0, 0.9803922, 1, 1,
0.09263533, 0.6840444, -0.3247942, 0, 0.9764706, 1, 1,
0.09451803, -1.680932, 2.414547, 0, 0.9686275, 1, 1,
0.09648772, 0.756687, -0.1972638, 0, 0.9647059, 1, 1,
0.09663663, 1.959952, -1.021296, 0, 0.9568627, 1, 1,
0.09895959, -0.7034603, 2.400755, 0, 0.9529412, 1, 1,
0.09927448, 1.459139, 0.4474331, 0, 0.945098, 1, 1,
0.1001348, 0.6522237, -0.67273, 0, 0.9411765, 1, 1,
0.1045299, 0.6242983, -0.4206664, 0, 0.9333333, 1, 1,
0.1059392, -1.268848, 3.09823, 0, 0.9294118, 1, 1,
0.1072004, -1.807752, 1.873456, 0, 0.9215686, 1, 1,
0.1125431, 0.2977741, 1.390976, 0, 0.9176471, 1, 1,
0.1198673, 0.6601353, 0.3894507, 0, 0.9098039, 1, 1,
0.1208805, -0.7865902, 2.810775, 0, 0.9058824, 1, 1,
0.1238157, 0.08505477, 0.8085495, 0, 0.8980392, 1, 1,
0.1257423, 0.4671498, -0.4818857, 0, 0.8901961, 1, 1,
0.1309052, -0.5329851, 1.249128, 0, 0.8862745, 1, 1,
0.1316918, -2.494668, 2.145924, 0, 0.8784314, 1, 1,
0.1351423, -0.6923196, 3.63304, 0, 0.8745098, 1, 1,
0.1377624, 0.560742, 1.583162, 0, 0.8666667, 1, 1,
0.1389274, -0.361225, 1.981546, 0, 0.8627451, 1, 1,
0.1459862, -0.5204433, 4.250398, 0, 0.854902, 1, 1,
0.1481074, 0.7531528, -0.3936774, 0, 0.8509804, 1, 1,
0.149466, -2.271898, 1.033879, 0, 0.8431373, 1, 1,
0.1495838, -0.0145627, 1.070581, 0, 0.8392157, 1, 1,
0.15205, -1.183427, 2.459431, 0, 0.8313726, 1, 1,
0.1532788, -1.138702, 2.434982, 0, 0.827451, 1, 1,
0.1541934, 0.5025539, 1.944745, 0, 0.8196079, 1, 1,
0.1549162, -0.3156983, 1.923169, 0, 0.8156863, 1, 1,
0.1556589, 0.7525663, 1.458807, 0, 0.8078431, 1, 1,
0.1559593, -0.3503832, 2.803601, 0, 0.8039216, 1, 1,
0.1566795, 0.7111384, -0.5204812, 0, 0.7960784, 1, 1,
0.1571939, 1.043576, 0.2724085, 0, 0.7882353, 1, 1,
0.1595913, 0.09100286, 0.9221963, 0, 0.7843137, 1, 1,
0.1627033, 0.7858054, -0.5537012, 0, 0.7764706, 1, 1,
0.1631767, 0.01957098, 1.824134, 0, 0.772549, 1, 1,
0.1662806, 0.8467324, -1.559298, 0, 0.7647059, 1, 1,
0.1674154, 0.2582579, 1.533994, 0, 0.7607843, 1, 1,
0.1696557, 0.8840564, 0.2252444, 0, 0.7529412, 1, 1,
0.1712768, -0.01503572, 1.052107, 0, 0.7490196, 1, 1,
0.1714509, 1.727002, 0.1986046, 0, 0.7411765, 1, 1,
0.1746572, 0.6991143, -0.7735496, 0, 0.7372549, 1, 1,
0.1808827, -0.2292105, 1.332761, 0, 0.7294118, 1, 1,
0.1809518, -0.8457006, 3.051615, 0, 0.7254902, 1, 1,
0.1839705, 0.2580474, 0.2176462, 0, 0.7176471, 1, 1,
0.1874211, -0.2333898, 2.070459, 0, 0.7137255, 1, 1,
0.1879611, 1.810446, 0.421847, 0, 0.7058824, 1, 1,
0.1880676, 0.4578437, 1.990803, 0, 0.6980392, 1, 1,
0.1895964, 0.02403584, 2.133419, 0, 0.6941177, 1, 1,
0.1911169, -0.9586762, 4.021264, 0, 0.6862745, 1, 1,
0.1933162, 0.3272648, 0.7375121, 0, 0.682353, 1, 1,
0.199719, 0.2526858, 0.8602551, 0, 0.6745098, 1, 1,
0.2045566, 0.03423988, 0.2632414, 0, 0.6705883, 1, 1,
0.2047864, -0.9784248, 3.469888, 0, 0.6627451, 1, 1,
0.2086063, 0.128967, -0.7397202, 0, 0.6588235, 1, 1,
0.2102562, 1.295016, 0.5248637, 0, 0.6509804, 1, 1,
0.2145599, -0.2669823, 1.994694, 0, 0.6470588, 1, 1,
0.2147948, -0.671849, 2.896048, 0, 0.6392157, 1, 1,
0.2246842, -0.02100624, 3.315596, 0, 0.6352941, 1, 1,
0.2257903, 0.03752063, 0.5610558, 0, 0.627451, 1, 1,
0.2271338, 0.02864068, 1.689634, 0, 0.6235294, 1, 1,
0.227648, -0.6637627, 2.141217, 0, 0.6156863, 1, 1,
0.2307345, 0.2551593, -0.8893695, 0, 0.6117647, 1, 1,
0.2405913, -0.3000239, 3.850459, 0, 0.6039216, 1, 1,
0.2418092, -0.02590196, 1.343524, 0, 0.5960785, 1, 1,
0.2422579, -0.7059831, 3.170547, 0, 0.5921569, 1, 1,
0.2425652, -0.7350715, 2.583951, 0, 0.5843138, 1, 1,
0.2450505, -1.070217, 4.087376, 0, 0.5803922, 1, 1,
0.2451838, -1.706209, 0.8395275, 0, 0.572549, 1, 1,
0.2461803, 1.151558, -1.336245, 0, 0.5686275, 1, 1,
0.2487911, 0.5439829, 0.4387061, 0, 0.5607843, 1, 1,
0.2490315, 1.873513, -0.8069411, 0, 0.5568628, 1, 1,
0.2498448, -2.203635, 4.431388, 0, 0.5490196, 1, 1,
0.2566199, 0.5941859, 0.9965208, 0, 0.5450981, 1, 1,
0.26048, -0.935823, 2.72558, 0, 0.5372549, 1, 1,
0.2605031, 0.300033, 0.2274738, 0, 0.5333334, 1, 1,
0.2608964, -0.2580304, 0.7260724, 0, 0.5254902, 1, 1,
0.2633052, -2.45255, 4.376129, 0, 0.5215687, 1, 1,
0.2634771, 0.8038617, -0.05698081, 0, 0.5137255, 1, 1,
0.2676945, -0.05642996, 0.6553972, 0, 0.509804, 1, 1,
0.2694225, -1.008056, 4.048226, 0, 0.5019608, 1, 1,
0.2719851, -1.036609, 2.844589, 0, 0.4941176, 1, 1,
0.2755206, 1.21946, 0.8304271, 0, 0.4901961, 1, 1,
0.275551, 1.358235, 0.6411784, 0, 0.4823529, 1, 1,
0.276122, 0.001185508, 1.08167, 0, 0.4784314, 1, 1,
0.2762033, 0.8910052, 0.9165809, 0, 0.4705882, 1, 1,
0.2810078, -0.9752207, 3.003263, 0, 0.4666667, 1, 1,
0.2837031, -1.6531, 4.896907, 0, 0.4588235, 1, 1,
0.2851103, 0.5542546, 0.7659842, 0, 0.454902, 1, 1,
0.2859996, -0.08940724, 3.549405, 0, 0.4470588, 1, 1,
0.2911229, 0.5358449, 1.299876, 0, 0.4431373, 1, 1,
0.292179, -1.499753, 3.119786, 0, 0.4352941, 1, 1,
0.2923433, 0.0309535, 1.291795, 0, 0.4313726, 1, 1,
0.2990557, -0.15681, 2.281585, 0, 0.4235294, 1, 1,
0.3060728, 0.4502726, 1.76563, 0, 0.4196078, 1, 1,
0.3066552, -0.2323319, 2.183215, 0, 0.4117647, 1, 1,
0.3090184, 0.6791948, -0.2128474, 0, 0.4078431, 1, 1,
0.3194881, 0.2682494, 0.6561713, 0, 0.4, 1, 1,
0.3230686, -0.4601525, 1.113087, 0, 0.3921569, 1, 1,
0.3260094, -0.7947176, 1.833947, 0, 0.3882353, 1, 1,
0.3261208, 0.2704687, 0.6800863, 0, 0.3803922, 1, 1,
0.3307072, -1.162912, 1.861434, 0, 0.3764706, 1, 1,
0.3312663, 0.6733599, 1.910237, 0, 0.3686275, 1, 1,
0.3339357, -0.4709725, 1.734792, 0, 0.3647059, 1, 1,
0.3363667, -0.7711638, 2.067987, 0, 0.3568628, 1, 1,
0.3382066, 0.7233558, -0.2681666, 0, 0.3529412, 1, 1,
0.3408658, -0.6432669, 3.103584, 0, 0.345098, 1, 1,
0.3454078, -0.2679209, 2.159764, 0, 0.3411765, 1, 1,
0.3467572, -0.5258016, 4.04857, 0, 0.3333333, 1, 1,
0.3490559, 0.5799129, -1.188391, 0, 0.3294118, 1, 1,
0.3513109, -0.3492753, 2.142353, 0, 0.3215686, 1, 1,
0.3521597, -0.01434454, 0.9039915, 0, 0.3176471, 1, 1,
0.3528033, -1.159053, 3.099493, 0, 0.3098039, 1, 1,
0.3528611, 0.08298801, 2.44427, 0, 0.3058824, 1, 1,
0.3537015, -1.798292, 3.291819, 0, 0.2980392, 1, 1,
0.358046, 0.9367514, -0.311754, 0, 0.2901961, 1, 1,
0.3590865, -0.9020839, 3.522563, 0, 0.2862745, 1, 1,
0.3674941, 0.285874, 0.9209784, 0, 0.2784314, 1, 1,
0.3709762, 1.236195, 1.940189, 0, 0.2745098, 1, 1,
0.3724928, -1.039091, 3.49314, 0, 0.2666667, 1, 1,
0.3743733, 1.284511, 0.0251252, 0, 0.2627451, 1, 1,
0.3756863, -0.1255282, 1.76377, 0, 0.254902, 1, 1,
0.3768882, -1.678338, 1.972991, 0, 0.2509804, 1, 1,
0.3811663, 0.2463871, 2.149204, 0, 0.2431373, 1, 1,
0.3816769, 0.2029859, 1.48337, 0, 0.2392157, 1, 1,
0.3848391, 1.600706, -1.482926, 0, 0.2313726, 1, 1,
0.3903886, -2.22554, 2.365917, 0, 0.227451, 1, 1,
0.3923036, 0.08723805, 1.620589, 0, 0.2196078, 1, 1,
0.3926846, 1.354596, 0.6577809, 0, 0.2156863, 1, 1,
0.3932785, 0.2471706, 2.845201, 0, 0.2078431, 1, 1,
0.3935944, 0.8633965, -0.08321071, 0, 0.2039216, 1, 1,
0.4013687, 0.4784946, 0.1197101, 0, 0.1960784, 1, 1,
0.402256, -0.07484774, 2.842856, 0, 0.1882353, 1, 1,
0.404045, 0.3821996, 1.967685, 0, 0.1843137, 1, 1,
0.4078945, 0.5727407, -0.1686213, 0, 0.1764706, 1, 1,
0.4095762, -1.5773, 3.25387, 0, 0.172549, 1, 1,
0.4096894, -0.4116893, 2.571771, 0, 0.1647059, 1, 1,
0.4100514, -0.05763661, 1.244705, 0, 0.1607843, 1, 1,
0.4105571, -0.8847972, 2.196491, 0, 0.1529412, 1, 1,
0.4139356, -1.143169, 3.233914, 0, 0.1490196, 1, 1,
0.4172679, -0.714352, 2.585816, 0, 0.1411765, 1, 1,
0.4189836, 0.7100805, -0.3680459, 0, 0.1372549, 1, 1,
0.4195887, 0.9084865, -1.285585, 0, 0.1294118, 1, 1,
0.4217976, 0.6591617, 0.3825968, 0, 0.1254902, 1, 1,
0.4222674, -0.5514135, 1.945766, 0, 0.1176471, 1, 1,
0.424704, 0.663944, -0.0252997, 0, 0.1137255, 1, 1,
0.4279357, 0.7094548, 0.4363312, 0, 0.1058824, 1, 1,
0.4280021, 0.9761918, 2.439026, 0, 0.09803922, 1, 1,
0.4281819, 1.422212, 1.298739, 0, 0.09411765, 1, 1,
0.4302565, -0.87095, 2.702262, 0, 0.08627451, 1, 1,
0.4341373, 0.4610873, 0.9663329, 0, 0.08235294, 1, 1,
0.436613, -1.654228, 3.662007, 0, 0.07450981, 1, 1,
0.4385902, -0.3562353, 0.9195103, 0, 0.07058824, 1, 1,
0.4393142, 1.055016, 0.2318332, 0, 0.0627451, 1, 1,
0.4401226, -0.4386869, 1.759178, 0, 0.05882353, 1, 1,
0.4429114, 0.1066511, 1.068541, 0, 0.05098039, 1, 1,
0.4481568, -0.02418613, 3.266963, 0, 0.04705882, 1, 1,
0.4536449, 0.06017879, 1.826413, 0, 0.03921569, 1, 1,
0.4540422, -0.1452021, 2.940515, 0, 0.03529412, 1, 1,
0.4572657, 0.945076, 0.4065814, 0, 0.02745098, 1, 1,
0.4582322, -0.5053667, 3.274618, 0, 0.02352941, 1, 1,
0.467314, 0.9451554, 0.4932024, 0, 0.01568628, 1, 1,
0.468547, -0.6116248, 2.725836, 0, 0.01176471, 1, 1,
0.4701323, 0.1730777, 0.842061, 0, 0.003921569, 1, 1,
0.4721977, -0.9441173, 0.1611362, 0.003921569, 0, 1, 1,
0.4781651, 0.7211876, 1.941755, 0.007843138, 0, 1, 1,
0.4801084, -0.1938736, 1.965529, 0.01568628, 0, 1, 1,
0.4829151, -1.041389, 2.818089, 0.01960784, 0, 1, 1,
0.4939689, 0.7274817, -0.04488932, 0.02745098, 0, 1, 1,
0.4947642, -0.9709664, 2.401585, 0.03137255, 0, 1, 1,
0.4953015, 1.449342, 0.6324173, 0.03921569, 0, 1, 1,
0.4965541, -0.7111837, 1.206231, 0.04313726, 0, 1, 1,
0.4980269, -0.3487646, 3.511342, 0.05098039, 0, 1, 1,
0.4987234, -0.4966917, 1.203133, 0.05490196, 0, 1, 1,
0.5013071, 0.7588172, 0.986745, 0.0627451, 0, 1, 1,
0.5023224, 2.033048, -0.9371918, 0.06666667, 0, 1, 1,
0.5061475, 0.9881986, 1.007222, 0.07450981, 0, 1, 1,
0.5109777, -0.2770147, 3.301182, 0.07843138, 0, 1, 1,
0.5150956, 1.002678, 0.8855665, 0.08627451, 0, 1, 1,
0.5163721, -0.04849704, 1.512218, 0.09019608, 0, 1, 1,
0.5163789, 2.013063, -0.425528, 0.09803922, 0, 1, 1,
0.5173258, -1.598323, 3.247847, 0.1058824, 0, 1, 1,
0.519482, -0.4705502, 2.199781, 0.1098039, 0, 1, 1,
0.5204126, -0.5773326, 2.814114, 0.1176471, 0, 1, 1,
0.5218438, -0.05069887, -0.9707425, 0.1215686, 0, 1, 1,
0.521848, 0.9042506, 0.5027335, 0.1294118, 0, 1, 1,
0.533839, 1.199272, 1.393881, 0.1333333, 0, 1, 1,
0.5353994, -0.002903299, 2.155315, 0.1411765, 0, 1, 1,
0.5374828, -0.329522, 2.203656, 0.145098, 0, 1, 1,
0.5398084, -1.205942, 2.870981, 0.1529412, 0, 1, 1,
0.548535, -1.1466, 3.22671, 0.1568628, 0, 1, 1,
0.5518492, -0.005351814, 1.586193, 0.1647059, 0, 1, 1,
0.555186, 0.1190889, 0.8831133, 0.1686275, 0, 1, 1,
0.5552817, -0.8663431, 1.895212, 0.1764706, 0, 1, 1,
0.5574707, -0.3052118, 3.550923, 0.1803922, 0, 1, 1,
0.5582913, 1.136459, 0.1729347, 0.1882353, 0, 1, 1,
0.5607479, -0.02085246, 1.893581, 0.1921569, 0, 1, 1,
0.5613765, -0.2851656, 3.050017, 0.2, 0, 1, 1,
0.5622332, -2.396382, 2.738094, 0.2078431, 0, 1, 1,
0.5662342, 0.02884756, 1.771495, 0.2117647, 0, 1, 1,
0.5687562, -0.3079465, 3.50677, 0.2196078, 0, 1, 1,
0.5711992, 0.08925617, 2.594812, 0.2235294, 0, 1, 1,
0.5734666, 1.138791, 1.332462, 0.2313726, 0, 1, 1,
0.575756, -0.3235594, 2.243995, 0.2352941, 0, 1, 1,
0.5805348, 1.730783, 1.769324, 0.2431373, 0, 1, 1,
0.5810027, -1.19685, 1.508738, 0.2470588, 0, 1, 1,
0.581639, 0.2481422, 0.680135, 0.254902, 0, 1, 1,
0.5859308, 0.7461599, 0.8379504, 0.2588235, 0, 1, 1,
0.586644, 2.200331, -1.051863, 0.2666667, 0, 1, 1,
0.587919, -1.334746, 3.320795, 0.2705882, 0, 1, 1,
0.5945914, 1.992013, -2.055293, 0.2784314, 0, 1, 1,
0.5992208, -0.6332462, 1.873065, 0.282353, 0, 1, 1,
0.6009011, 0.2053195, 1.907695, 0.2901961, 0, 1, 1,
0.6016564, 0.7227468, -0.2373904, 0.2941177, 0, 1, 1,
0.6031203, 0.699197, 0.4676687, 0.3019608, 0, 1, 1,
0.6032974, -0.09294482, 0.9488161, 0.3098039, 0, 1, 1,
0.6086023, -2.045602, 3.58106, 0.3137255, 0, 1, 1,
0.6106063, -1.413733, 1.103159, 0.3215686, 0, 1, 1,
0.6211549, -0.7562611, 4.602854, 0.3254902, 0, 1, 1,
0.6327189, 0.2082378, 1.396741, 0.3333333, 0, 1, 1,
0.6378955, 0.8618683, -0.1998946, 0.3372549, 0, 1, 1,
0.6459869, 1.69647, 0.2522634, 0.345098, 0, 1, 1,
0.6539168, -0.7773197, 2.775474, 0.3490196, 0, 1, 1,
0.6541859, -0.9177357, 3.055641, 0.3568628, 0, 1, 1,
0.6576895, 0.1344199, 0.7596896, 0.3607843, 0, 1, 1,
0.6595026, -0.02448536, 2.458344, 0.3686275, 0, 1, 1,
0.6626442, 0.433639, 0.840646, 0.372549, 0, 1, 1,
0.6639178, 0.1891564, -0.1221896, 0.3803922, 0, 1, 1,
0.6707031, 1.595046, -0.2535495, 0.3843137, 0, 1, 1,
0.6711569, 0.2352737, 0.2452869, 0.3921569, 0, 1, 1,
0.6727816, -0.338008, 2.384742, 0.3960784, 0, 1, 1,
0.6794763, 0.4542286, 1.032492, 0.4039216, 0, 1, 1,
0.6820296, 0.2478716, -0.1698334, 0.4117647, 0, 1, 1,
0.6826705, 0.8166581, 1.746216, 0.4156863, 0, 1, 1,
0.687521, -0.03489456, -0.3597814, 0.4235294, 0, 1, 1,
0.688754, -0.7627397, 1.497214, 0.427451, 0, 1, 1,
0.6889135, 1.498618, 0.006772759, 0.4352941, 0, 1, 1,
0.6952571, -0.8834375, 2.143586, 0.4392157, 0, 1, 1,
0.7028331, 0.2436891, 0.8357512, 0.4470588, 0, 1, 1,
0.7041412, -0.2750989, 2.292955, 0.4509804, 0, 1, 1,
0.7066008, 1.68378, -0.4381818, 0.4588235, 0, 1, 1,
0.7125295, 1.474548, 0.423079, 0.4627451, 0, 1, 1,
0.7270687, -0.1494013, 1.79268, 0.4705882, 0, 1, 1,
0.7316496, 1.783158, -0.5312398, 0.4745098, 0, 1, 1,
0.7331172, -1.536558, 4.178508, 0.4823529, 0, 1, 1,
0.7336314, 0.1116562, 0.9532155, 0.4862745, 0, 1, 1,
0.7378486, 0.6806057, 1.619052, 0.4941176, 0, 1, 1,
0.7410749, 0.1813139, 1.604354, 0.5019608, 0, 1, 1,
0.7485816, -1.301806, 3.122708, 0.5058824, 0, 1, 1,
0.7564954, 0.97356, 0.8856289, 0.5137255, 0, 1, 1,
0.7668434, -1.604505, 1.875269, 0.5176471, 0, 1, 1,
0.7803354, -0.5465257, 0.3830213, 0.5254902, 0, 1, 1,
0.7808226, -1.511826, 2.550759, 0.5294118, 0, 1, 1,
0.7847059, -0.1157949, 1.769157, 0.5372549, 0, 1, 1,
0.7882636, 0.4263494, 0.6608228, 0.5411765, 0, 1, 1,
0.7958068, -1.007987, -0.3350523, 0.5490196, 0, 1, 1,
0.7975492, -0.701475, 4.274355, 0.5529412, 0, 1, 1,
0.8007731, 0.207595, 1.264107, 0.5607843, 0, 1, 1,
0.8051518, 0.110999, 1.97022, 0.5647059, 0, 1, 1,
0.8072013, -1.453022, 2.038579, 0.572549, 0, 1, 1,
0.8164737, -0.3972803, 2.060216, 0.5764706, 0, 1, 1,
0.8199007, -0.4926105, 0.9419883, 0.5843138, 0, 1, 1,
0.8225081, 0.9040668, 0.6275278, 0.5882353, 0, 1, 1,
0.823139, -0.2649604, 0.4839768, 0.5960785, 0, 1, 1,
0.8234902, -2.152337, 3.215035, 0.6039216, 0, 1, 1,
0.834942, 0.6774751, 2.019186, 0.6078432, 0, 1, 1,
0.8391104, 2.146703, 0.7957103, 0.6156863, 0, 1, 1,
0.8395486, -0.6271046, 2.417367, 0.6196079, 0, 1, 1,
0.8496076, -0.7402291, 1.759416, 0.627451, 0, 1, 1,
0.8536786, -0.1076523, 1.778394, 0.6313726, 0, 1, 1,
0.8593542, 0.7966337, 1.007516, 0.6392157, 0, 1, 1,
0.8744789, -0.9735888, 1.600879, 0.6431373, 0, 1, 1,
0.8755937, 0.5168425, 2.575009, 0.6509804, 0, 1, 1,
0.8773814, 1.441249, -0.6568611, 0.654902, 0, 1, 1,
0.8796538, 0.6575645, 2.410405, 0.6627451, 0, 1, 1,
0.8797075, 0.9229973, 0.4684628, 0.6666667, 0, 1, 1,
0.8798118, 0.2183027, 1.441866, 0.6745098, 0, 1, 1,
0.8812408, 0.7299935, -0.1266515, 0.6784314, 0, 1, 1,
0.8844145, -1.735691, 3.122415, 0.6862745, 0, 1, 1,
0.8882362, -0.03839091, 2.572554, 0.6901961, 0, 1, 1,
0.8895234, -1.377433, 3.040571, 0.6980392, 0, 1, 1,
0.8898917, -0.6496167, 3.721219, 0.7058824, 0, 1, 1,
0.8923446, -1.075395, 1.964093, 0.7098039, 0, 1, 1,
0.8934025, -0.4090344, 2.495965, 0.7176471, 0, 1, 1,
0.896977, 0.5008268, 1.564776, 0.7215686, 0, 1, 1,
0.8986064, -1.583941, 3.662856, 0.7294118, 0, 1, 1,
0.9029901, -0.1340112, 2.454323, 0.7333333, 0, 1, 1,
0.9055297, 1.14113, -0.5083925, 0.7411765, 0, 1, 1,
0.9068497, 0.520928, 2.408632, 0.7450981, 0, 1, 1,
0.914472, -0.6094162, 3.466928, 0.7529412, 0, 1, 1,
0.917216, -0.4772019, 3.635568, 0.7568628, 0, 1, 1,
0.9175286, 0.6018376, 1.989596, 0.7647059, 0, 1, 1,
0.9192758, -0.9324726, 1.54754, 0.7686275, 0, 1, 1,
0.9240615, -0.3541854, 0.5834945, 0.7764706, 0, 1, 1,
0.9263362, -0.5039513, 2.152187, 0.7803922, 0, 1, 1,
0.9269491, 1.478522, 1.405185, 0.7882353, 0, 1, 1,
0.928324, 0.1111911, 2.51112, 0.7921569, 0, 1, 1,
0.9297364, 0.5321752, 2.643955, 0.8, 0, 1, 1,
0.930194, 2.038407, -0.1682341, 0.8078431, 0, 1, 1,
0.9315062, 0.7973137, 0.1372156, 0.8117647, 0, 1, 1,
0.9325343, -0.07517464, 0.4100109, 0.8196079, 0, 1, 1,
0.9352367, -1.067876, 2.623986, 0.8235294, 0, 1, 1,
0.9384116, 0.1952091, 1.46297, 0.8313726, 0, 1, 1,
0.9395544, 0.8933022, 0.9886652, 0.8352941, 0, 1, 1,
0.9403613, -0.7785416, 2.861204, 0.8431373, 0, 1, 1,
0.9404196, -0.2218728, 1.173909, 0.8470588, 0, 1, 1,
0.9459682, -0.4471243, 2.348506, 0.854902, 0, 1, 1,
0.948843, -0.8839943, 1.986559, 0.8588235, 0, 1, 1,
0.9505906, 1.558949, 0.7406729, 0.8666667, 0, 1, 1,
0.9593074, 0.4770329, 2.155294, 0.8705882, 0, 1, 1,
0.9647468, -0.5082003, 2.883323, 0.8784314, 0, 1, 1,
0.9664093, 1.095609, 0.9501684, 0.8823529, 0, 1, 1,
0.9741847, 0.1114153, 2.290697, 0.8901961, 0, 1, 1,
0.9785414, -0.4370829, 1.405642, 0.8941177, 0, 1, 1,
0.9790419, 1.223232, -0.5983086, 0.9019608, 0, 1, 1,
0.9805656, -0.5732723, 2.168815, 0.9098039, 0, 1, 1,
0.9806165, 0.1533729, 1.313128, 0.9137255, 0, 1, 1,
0.9867581, -1.231865, 1.805428, 0.9215686, 0, 1, 1,
0.9938052, 1.075391, 1.236939, 0.9254902, 0, 1, 1,
0.9942993, 1.034165, 0.3085025, 0.9333333, 0, 1, 1,
0.9968454, -0.621909, 1.159714, 0.9372549, 0, 1, 1,
1.007292, -0.7927226, 2.395858, 0.945098, 0, 1, 1,
1.016622, 1.455168, 0.08362437, 0.9490196, 0, 1, 1,
1.020763, -0.06031436, 2.246022, 0.9568627, 0, 1, 1,
1.025468, -1.178792, 2.446202, 0.9607843, 0, 1, 1,
1.027039, -1.503693, 3.404469, 0.9686275, 0, 1, 1,
1.028592, 0.9587457, 1.168108, 0.972549, 0, 1, 1,
1.034576, -1.671061, 1.83525, 0.9803922, 0, 1, 1,
1.034748, 0.5344606, -0.5098285, 0.9843137, 0, 1, 1,
1.037297, -0.3751812, 2.709709, 0.9921569, 0, 1, 1,
1.039195, -1.323185, 1.385741, 0.9960784, 0, 1, 1,
1.041106, -1.877524, 2.778363, 1, 0, 0.9960784, 1,
1.041472, -0.7719875, 2.452281, 1, 0, 0.9882353, 1,
1.045974, 0.573237, 1.78866, 1, 0, 0.9843137, 1,
1.049726, -2.297576, 2.856889, 1, 0, 0.9764706, 1,
1.050632, 0.6389733, 1.496605, 1, 0, 0.972549, 1,
1.054774, 0.8577131, 0.78719, 1, 0, 0.9647059, 1,
1.056542, -1.278105, 1.432721, 1, 0, 0.9607843, 1,
1.058078, 0.3971537, 0.9035403, 1, 0, 0.9529412, 1,
1.059507, -1.697385, 3.170397, 1, 0, 0.9490196, 1,
1.060468, 0.3197373, 2.434717, 1, 0, 0.9411765, 1,
1.070199, -1.04768, 2.187158, 1, 0, 0.9372549, 1,
1.07327, 3.209062, 2.08408, 1, 0, 0.9294118, 1,
1.075172, -0.9352548, 2.091855, 1, 0, 0.9254902, 1,
1.075362, 0.79063, 0.5580963, 1, 0, 0.9176471, 1,
1.076225, -0.08287698, 0.2138964, 1, 0, 0.9137255, 1,
1.077479, 0.640288, 2.131503, 1, 0, 0.9058824, 1,
1.078059, -1.738544, 2.124345, 1, 0, 0.9019608, 1,
1.082223, -1.09702, 3.009807, 1, 0, 0.8941177, 1,
1.086279, 0.6379937, 1.392656, 1, 0, 0.8862745, 1,
1.086648, -0.3660707, 3.844842, 1, 0, 0.8823529, 1,
1.086865, 0.5501068, -0.8044744, 1, 0, 0.8745098, 1,
1.090619, 0.7199645, 0.623776, 1, 0, 0.8705882, 1,
1.096633, 0.9800769, 1.346437, 1, 0, 0.8627451, 1,
1.102619, -1.12588, 2.408099, 1, 0, 0.8588235, 1,
1.10796, -0.5730441, 1.957952, 1, 0, 0.8509804, 1,
1.109544, 0.6509286, -0.8775231, 1, 0, 0.8470588, 1,
1.115916, -0.4617492, 1.614085, 1, 0, 0.8392157, 1,
1.116843, 1.505103, -1.311982, 1, 0, 0.8352941, 1,
1.124121, 0.5455412, -0.325777, 1, 0, 0.827451, 1,
1.134824, 0.2354133, 0.5062584, 1, 0, 0.8235294, 1,
1.140315, -0.537797, -0.2888121, 1, 0, 0.8156863, 1,
1.158651, -1.007058, -0.1617995, 1, 0, 0.8117647, 1,
1.171095, 2.540854, 2.522284, 1, 0, 0.8039216, 1,
1.17821, 0.1102148, 0.09767815, 1, 0, 0.7960784, 1,
1.180536, 1.951025, -0.002563275, 1, 0, 0.7921569, 1,
1.183415, 0.7551274, 1.391788, 1, 0, 0.7843137, 1,
1.186033, -0.8411368, 3.363921, 1, 0, 0.7803922, 1,
1.186898, -0.04461568, 2.471154, 1, 0, 0.772549, 1,
1.199242, -0.00859818, 0.9187394, 1, 0, 0.7686275, 1,
1.207098, 1.874067, 2.086973, 1, 0, 0.7607843, 1,
1.20877, 0.1583097, 0.4894651, 1, 0, 0.7568628, 1,
1.219331, 0.2757293, 1.435324, 1, 0, 0.7490196, 1,
1.223181, -0.02284919, 2.336706, 1, 0, 0.7450981, 1,
1.224707, 0.1040968, 0.3743576, 1, 0, 0.7372549, 1,
1.231743, 0.4305383, 2.995251, 1, 0, 0.7333333, 1,
1.233861, 0.8185436, 0.7418188, 1, 0, 0.7254902, 1,
1.233983, -0.07181639, 0.07000748, 1, 0, 0.7215686, 1,
1.236683, -1.310793, 3.962392, 1, 0, 0.7137255, 1,
1.238693, -0.8040331, 1.188239, 1, 0, 0.7098039, 1,
1.242048, -1.575201, 2.821218, 1, 0, 0.7019608, 1,
1.245101, 0.3979309, 2.702426, 1, 0, 0.6941177, 1,
1.259282, -0.1294386, 1.549439, 1, 0, 0.6901961, 1,
1.261572, -1.110941, 2.488369, 1, 0, 0.682353, 1,
1.262361, 1.452305, 1.564582, 1, 0, 0.6784314, 1,
1.271562, -1.504073, 0.5689332, 1, 0, 0.6705883, 1,
1.272584, 0.6188397, 1.526177, 1, 0, 0.6666667, 1,
1.281225, 0.06004072, 2.994114, 1, 0, 0.6588235, 1,
1.289676, 0.09160699, 0.4227673, 1, 0, 0.654902, 1,
1.292204, 0.7450301, -0.3677317, 1, 0, 0.6470588, 1,
1.295517, -0.1211958, 3.241842, 1, 0, 0.6431373, 1,
1.295533, -1.774096, 2.393875, 1, 0, 0.6352941, 1,
1.312861, 2.156381, 0.6116965, 1, 0, 0.6313726, 1,
1.314638, -1.870927, 2.440771, 1, 0, 0.6235294, 1,
1.315201, -0.2990693, 2.349196, 1, 0, 0.6196079, 1,
1.315244, 0.7346487, 0.5616271, 1, 0, 0.6117647, 1,
1.323832, -1.579601, 1.963739, 1, 0, 0.6078432, 1,
1.325733, -0.3987873, 2.93177, 1, 0, 0.6, 1,
1.330921, -0.3671161, 2.001263, 1, 0, 0.5921569, 1,
1.355789, -0.986036, 2.510213, 1, 0, 0.5882353, 1,
1.356743, 1.146338, 1.596265, 1, 0, 0.5803922, 1,
1.363927, -0.08437186, 2.230203, 1, 0, 0.5764706, 1,
1.373211, 0.756417, 0.6842285, 1, 0, 0.5686275, 1,
1.374084, -0.1815536, 2.697395, 1, 0, 0.5647059, 1,
1.378592, 0.5359439, 1.674861, 1, 0, 0.5568628, 1,
1.38096, 0.2388244, 2.263705, 1, 0, 0.5529412, 1,
1.381144, -1.103204, 2.663239, 1, 0, 0.5450981, 1,
1.381529, -0.5074132, 2.338897, 1, 0, 0.5411765, 1,
1.382457, -0.09673055, 2.015227, 1, 0, 0.5333334, 1,
1.384007, -0.9700502, 0.9237099, 1, 0, 0.5294118, 1,
1.392314, 0.1480737, 1.66314, 1, 0, 0.5215687, 1,
1.399131, -2.698441, 3.175373, 1, 0, 0.5176471, 1,
1.404157, -0.2428512, 2.833011, 1, 0, 0.509804, 1,
1.40893, 1.473723, 1.509964, 1, 0, 0.5058824, 1,
1.411045, 0.6339036, 1.748832, 1, 0, 0.4980392, 1,
1.417132, -0.2230337, 2.489912, 1, 0, 0.4901961, 1,
1.437471, -1.37789, 1.904653, 1, 0, 0.4862745, 1,
1.444886, -0.8341086, 3.189112, 1, 0, 0.4784314, 1,
1.447317, -0.2171042, 3.113727, 1, 0, 0.4745098, 1,
1.452943, 0.3450326, 1.761672, 1, 0, 0.4666667, 1,
1.469374, 0.4195178, 1.534067, 1, 0, 0.4627451, 1,
1.493319, -2.011394, 4.685891, 1, 0, 0.454902, 1,
1.509781, -1.401001, 3.996951, 1, 0, 0.4509804, 1,
1.513292, 0.8492635, 1.368349, 1, 0, 0.4431373, 1,
1.51653, 0.5205982, 2.208811, 1, 0, 0.4392157, 1,
1.526194, 0.8495893, 1.051135, 1, 0, 0.4313726, 1,
1.535448, 0.4896503, 1.681258, 1, 0, 0.427451, 1,
1.541469, 0.4276521, -0.5382041, 1, 0, 0.4196078, 1,
1.558055, 0.2967515, 2.066324, 1, 0, 0.4156863, 1,
1.559059, -0.4565141, 3.010421, 1, 0, 0.4078431, 1,
1.561102, 2.565248, 1.206332, 1, 0, 0.4039216, 1,
1.563835, -1.955678, 4.348456, 1, 0, 0.3960784, 1,
1.564895, -1.86252, 4.912443, 1, 0, 0.3882353, 1,
1.575499, 0.7804357, 1.090153, 1, 0, 0.3843137, 1,
1.581655, 0.6466786, 0.5198396, 1, 0, 0.3764706, 1,
1.585729, 0.49365, 0.7442474, 1, 0, 0.372549, 1,
1.587652, 0.07568216, 3.930723, 1, 0, 0.3647059, 1,
1.595699, 0.7616021, 2.553163, 1, 0, 0.3607843, 1,
1.598296, -1.056735, 2.577009, 1, 0, 0.3529412, 1,
1.602687, 0.2944077, 0.1278082, 1, 0, 0.3490196, 1,
1.604609, -0.04370978, 2.425252, 1, 0, 0.3411765, 1,
1.606381, 0.60722, 2.268718, 1, 0, 0.3372549, 1,
1.610013, 0.6136339, 1.417392, 1, 0, 0.3294118, 1,
1.618156, 0.5323361, 1.308727, 1, 0, 0.3254902, 1,
1.619648, 0.6474271, 1.713872, 1, 0, 0.3176471, 1,
1.643995, 0.04000542, 2.61138, 1, 0, 0.3137255, 1,
1.653694, 0.1327406, 2.504212, 1, 0, 0.3058824, 1,
1.656835, -0.8079324, 0.001883634, 1, 0, 0.2980392, 1,
1.656954, -0.4287839, 1.501991, 1, 0, 0.2941177, 1,
1.684496, -0.06888248, 2.248006, 1, 0, 0.2862745, 1,
1.697623, 1.79611, 3.155611, 1, 0, 0.282353, 1,
1.70367, -1.461356, 0.7646343, 1, 0, 0.2745098, 1,
1.719093, -1.327082, 2.686049, 1, 0, 0.2705882, 1,
1.721614, 0.004269595, 2.143732, 1, 0, 0.2627451, 1,
1.730575, -0.2366161, 1.69468, 1, 0, 0.2588235, 1,
1.733024, 2.125785, 0.6138226, 1, 0, 0.2509804, 1,
1.752117, 0.6548752, 0.9205492, 1, 0, 0.2470588, 1,
1.752664, 0.7220622, 2.019131, 1, 0, 0.2392157, 1,
1.768761, -0.9351162, 1.708229, 1, 0, 0.2352941, 1,
1.772992, -0.02801455, 1.507653, 1, 0, 0.227451, 1,
1.777909, -1.539831, 3.491376, 1, 0, 0.2235294, 1,
1.779511, -0.5083988, 0.6639541, 1, 0, 0.2156863, 1,
1.785439, 0.08391627, 1.493043, 1, 0, 0.2117647, 1,
1.80455, -0.5553438, 1.871147, 1, 0, 0.2039216, 1,
1.841048, 1.324067, 0.7632224, 1, 0, 0.1960784, 1,
1.862983, -1.118722, 3.577726, 1, 0, 0.1921569, 1,
1.893429, 0.4205327, 2.417756, 1, 0, 0.1843137, 1,
1.91855, -0.861247, 3.888264, 1, 0, 0.1803922, 1,
1.981468, 0.1532671, 1.07385, 1, 0, 0.172549, 1,
1.992818, 0.1603077, 2.3076, 1, 0, 0.1686275, 1,
1.993076, 1.554084, 0.8385102, 1, 0, 0.1607843, 1,
2.01743, -1.323784, 1.599979, 1, 0, 0.1568628, 1,
2.044782, -0.5214971, 2.239643, 1, 0, 0.1490196, 1,
2.051465, -0.8110406, 0.6506053, 1, 0, 0.145098, 1,
2.053216, -0.490292, 3.367448, 1, 0, 0.1372549, 1,
2.058951, -0.7038308, 0.07647975, 1, 0, 0.1333333, 1,
2.072779, 1.120263, 1.751304, 1, 0, 0.1254902, 1,
2.12549, -1.073561, 0.04004896, 1, 0, 0.1215686, 1,
2.138009, 0.8388259, 1.000224, 1, 0, 0.1137255, 1,
2.142677, 0.3808863, 0.839815, 1, 0, 0.1098039, 1,
2.164035, -0.8208017, 4.562504, 1, 0, 0.1019608, 1,
2.165395, -0.3136109, 2.526945, 1, 0, 0.09411765, 1,
2.16717, 0.04492174, 2.47205, 1, 0, 0.09019608, 1,
2.20201, 0.7370961, 0.8979316, 1, 0, 0.08235294, 1,
2.248015, -0.5626395, 2.9283, 1, 0, 0.07843138, 1,
2.248595, 0.3529003, 0.8546153, 1, 0, 0.07058824, 1,
2.271533, 0.0956405, 1.426622, 1, 0, 0.06666667, 1,
2.285723, 2.364034, 0.914117, 1, 0, 0.05882353, 1,
2.31751, 0.4520913, 3.141601, 1, 0, 0.05490196, 1,
2.33145, -0.2776048, 1.837791, 1, 0, 0.04705882, 1,
2.352059, 0.3220914, 1.51149, 1, 0, 0.04313726, 1,
2.480781, 0.1826224, 1.229199, 1, 0, 0.03529412, 1,
2.487479, -0.9229, 1.706758, 1, 0, 0.03137255, 1,
2.612303, 1.128932, -0.6451048, 1, 0, 0.02352941, 1,
2.754422, -1.323635, 2.440814, 1, 0, 0.01960784, 1,
2.881207, 0.05510779, 2.605807, 1, 0, 0.01176471, 1,
3.378632, 0.003562139, 2.062477, 1, 0, 0.007843138, 1
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
-0.02627134, -4.492059, -7.255958, 0, -0.5, 0.5, 0.5,
-0.02627134, -4.492059, -7.255958, 1, -0.5, 0.5, 0.5,
-0.02627134, -4.492059, -7.255958, 1, 1.5, 0.5, 0.5,
-0.02627134, -4.492059, -7.255958, 0, 1.5, 0.5, 0.5
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
-4.585437, -0.08342242, -7.255958, 0, -0.5, 0.5, 0.5,
-4.585437, -0.08342242, -7.255958, 1, -0.5, 0.5, 0.5,
-4.585437, -0.08342242, -7.255958, 1, 1.5, 0.5, 0.5,
-4.585437, -0.08342242, -7.255958, 0, 1.5, 0.5, 0.5
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
-4.585437, -4.492059, -0.2899516, 0, -0.5, 0.5, 0.5,
-4.585437, -4.492059, -0.2899516, 1, -0.5, 0.5, 0.5,
-4.585437, -4.492059, -0.2899516, 1, 1.5, 0.5, 0.5,
-4.585437, -4.492059, -0.2899516, 0, 1.5, 0.5, 0.5
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
-3, -3.474681, -5.648418,
3, -3.474681, -5.648418,
-3, -3.474681, -5.648418,
-3, -3.644244, -5.916341,
-2, -3.474681, -5.648418,
-2, -3.644244, -5.916341,
-1, -3.474681, -5.648418,
-1, -3.644244, -5.916341,
0, -3.474681, -5.648418,
0, -3.644244, -5.916341,
1, -3.474681, -5.648418,
1, -3.644244, -5.916341,
2, -3.474681, -5.648418,
2, -3.644244, -5.916341,
3, -3.474681, -5.648418,
3, -3.644244, -5.916341
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
-3, -3.98337, -6.452188, 0, -0.5, 0.5, 0.5,
-3, -3.98337, -6.452188, 1, -0.5, 0.5, 0.5,
-3, -3.98337, -6.452188, 1, 1.5, 0.5, 0.5,
-3, -3.98337, -6.452188, 0, 1.5, 0.5, 0.5,
-2, -3.98337, -6.452188, 0, -0.5, 0.5, 0.5,
-2, -3.98337, -6.452188, 1, -0.5, 0.5, 0.5,
-2, -3.98337, -6.452188, 1, 1.5, 0.5, 0.5,
-2, -3.98337, -6.452188, 0, 1.5, 0.5, 0.5,
-1, -3.98337, -6.452188, 0, -0.5, 0.5, 0.5,
-1, -3.98337, -6.452188, 1, -0.5, 0.5, 0.5,
-1, -3.98337, -6.452188, 1, 1.5, 0.5, 0.5,
-1, -3.98337, -6.452188, 0, 1.5, 0.5, 0.5,
0, -3.98337, -6.452188, 0, -0.5, 0.5, 0.5,
0, -3.98337, -6.452188, 1, -0.5, 0.5, 0.5,
0, -3.98337, -6.452188, 1, 1.5, 0.5, 0.5,
0, -3.98337, -6.452188, 0, 1.5, 0.5, 0.5,
1, -3.98337, -6.452188, 0, -0.5, 0.5, 0.5,
1, -3.98337, -6.452188, 1, -0.5, 0.5, 0.5,
1, -3.98337, -6.452188, 1, 1.5, 0.5, 0.5,
1, -3.98337, -6.452188, 0, 1.5, 0.5, 0.5,
2, -3.98337, -6.452188, 0, -0.5, 0.5, 0.5,
2, -3.98337, -6.452188, 1, -0.5, 0.5, 0.5,
2, -3.98337, -6.452188, 1, 1.5, 0.5, 0.5,
2, -3.98337, -6.452188, 0, 1.5, 0.5, 0.5,
3, -3.98337, -6.452188, 0, -0.5, 0.5, 0.5,
3, -3.98337, -6.452188, 1, -0.5, 0.5, 0.5,
3, -3.98337, -6.452188, 1, 1.5, 0.5, 0.5,
3, -3.98337, -6.452188, 0, 1.5, 0.5, 0.5
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
-3.533322, -3, -5.648418,
-3.533322, 3, -5.648418,
-3.533322, -3, -5.648418,
-3.708674, -3, -5.916341,
-3.533322, -2, -5.648418,
-3.708674, -2, -5.916341,
-3.533322, -1, -5.648418,
-3.708674, -1, -5.916341,
-3.533322, 0, -5.648418,
-3.708674, 0, -5.916341,
-3.533322, 1, -5.648418,
-3.708674, 1, -5.916341,
-3.533322, 2, -5.648418,
-3.708674, 2, -5.916341,
-3.533322, 3, -5.648418,
-3.708674, 3, -5.916341
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
-4.059379, -3, -6.452188, 0, -0.5, 0.5, 0.5,
-4.059379, -3, -6.452188, 1, -0.5, 0.5, 0.5,
-4.059379, -3, -6.452188, 1, 1.5, 0.5, 0.5,
-4.059379, -3, -6.452188, 0, 1.5, 0.5, 0.5,
-4.059379, -2, -6.452188, 0, -0.5, 0.5, 0.5,
-4.059379, -2, -6.452188, 1, -0.5, 0.5, 0.5,
-4.059379, -2, -6.452188, 1, 1.5, 0.5, 0.5,
-4.059379, -2, -6.452188, 0, 1.5, 0.5, 0.5,
-4.059379, -1, -6.452188, 0, -0.5, 0.5, 0.5,
-4.059379, -1, -6.452188, 1, -0.5, 0.5, 0.5,
-4.059379, -1, -6.452188, 1, 1.5, 0.5, 0.5,
-4.059379, -1, -6.452188, 0, 1.5, 0.5, 0.5,
-4.059379, 0, -6.452188, 0, -0.5, 0.5, 0.5,
-4.059379, 0, -6.452188, 1, -0.5, 0.5, 0.5,
-4.059379, 0, -6.452188, 1, 1.5, 0.5, 0.5,
-4.059379, 0, -6.452188, 0, 1.5, 0.5, 0.5,
-4.059379, 1, -6.452188, 0, -0.5, 0.5, 0.5,
-4.059379, 1, -6.452188, 1, -0.5, 0.5, 0.5,
-4.059379, 1, -6.452188, 1, 1.5, 0.5, 0.5,
-4.059379, 1, -6.452188, 0, 1.5, 0.5, 0.5,
-4.059379, 2, -6.452188, 0, -0.5, 0.5, 0.5,
-4.059379, 2, -6.452188, 1, -0.5, 0.5, 0.5,
-4.059379, 2, -6.452188, 1, 1.5, 0.5, 0.5,
-4.059379, 2, -6.452188, 0, 1.5, 0.5, 0.5,
-4.059379, 3, -6.452188, 0, -0.5, 0.5, 0.5,
-4.059379, 3, -6.452188, 1, -0.5, 0.5, 0.5,
-4.059379, 3, -6.452188, 1, 1.5, 0.5, 0.5,
-4.059379, 3, -6.452188, 0, 1.5, 0.5, 0.5
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
-3.533322, -3.474681, -4,
-3.533322, -3.474681, 4,
-3.533322, -3.474681, -4,
-3.708674, -3.644244, -4,
-3.533322, -3.474681, -2,
-3.708674, -3.644244, -2,
-3.533322, -3.474681, 0,
-3.708674, -3.644244, 0,
-3.533322, -3.474681, 2,
-3.708674, -3.644244, 2,
-3.533322, -3.474681, 4,
-3.708674, -3.644244, 4
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
-4.059379, -3.98337, -4, 0, -0.5, 0.5, 0.5,
-4.059379, -3.98337, -4, 1, -0.5, 0.5, 0.5,
-4.059379, -3.98337, -4, 1, 1.5, 0.5, 0.5,
-4.059379, -3.98337, -4, 0, 1.5, 0.5, 0.5,
-4.059379, -3.98337, -2, 0, -0.5, 0.5, 0.5,
-4.059379, -3.98337, -2, 1, -0.5, 0.5, 0.5,
-4.059379, -3.98337, -2, 1, 1.5, 0.5, 0.5,
-4.059379, -3.98337, -2, 0, 1.5, 0.5, 0.5,
-4.059379, -3.98337, 0, 0, -0.5, 0.5, 0.5,
-4.059379, -3.98337, 0, 1, -0.5, 0.5, 0.5,
-4.059379, -3.98337, 0, 1, 1.5, 0.5, 0.5,
-4.059379, -3.98337, 0, 0, 1.5, 0.5, 0.5,
-4.059379, -3.98337, 2, 0, -0.5, 0.5, 0.5,
-4.059379, -3.98337, 2, 1, -0.5, 0.5, 0.5,
-4.059379, -3.98337, 2, 1, 1.5, 0.5, 0.5,
-4.059379, -3.98337, 2, 0, 1.5, 0.5, 0.5,
-4.059379, -3.98337, 4, 0, -0.5, 0.5, 0.5,
-4.059379, -3.98337, 4, 1, -0.5, 0.5, 0.5,
-4.059379, -3.98337, 4, 1, 1.5, 0.5, 0.5,
-4.059379, -3.98337, 4, 0, 1.5, 0.5, 0.5
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
-3.533322, -3.474681, -5.648418,
-3.533322, 3.307836, -5.648418,
-3.533322, -3.474681, 5.068515,
-3.533322, 3.307836, 5.068515,
-3.533322, -3.474681, -5.648418,
-3.533322, -3.474681, 5.068515,
-3.533322, 3.307836, -5.648418,
-3.533322, 3.307836, 5.068515,
-3.533322, -3.474681, -5.648418,
3.480779, -3.474681, -5.648418,
-3.533322, -3.474681, 5.068515,
3.480779, -3.474681, 5.068515,
-3.533322, 3.307836, -5.648418,
3.480779, 3.307836, -5.648418,
-3.533322, 3.307836, 5.068515,
3.480779, 3.307836, 5.068515,
3.480779, -3.474681, -5.648418,
3.480779, 3.307836, -5.648418,
3.480779, -3.474681, 5.068515,
3.480779, 3.307836, 5.068515,
3.480779, -3.474681, -5.648418,
3.480779, -3.474681, 5.068515,
3.480779, 3.307836, -5.648418,
3.480779, 3.307836, 5.068515
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
var radius = 7.739087;
var distance = 34.43207;
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
mvMatrix.translate( 0.02627134, 0.08342242, 0.2899516 );
mvMatrix.scale( 1.192976, 1.233709, 0.7807879 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.43207);
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
fluchloralin<-read.table("fluchloralin.xyz")
```

```
## Error in read.table("fluchloralin.xyz"): no lines available in input
```

```r
x<-fluchloralin$V2
```

```
## Error in eval(expr, envir, enclos): object 'fluchloralin' not found
```

```r
y<-fluchloralin$V3
```

```
## Error in eval(expr, envir, enclos): object 'fluchloralin' not found
```

```r
z<-fluchloralin$V4
```

```
## Error in eval(expr, envir, enclos): object 'fluchloralin' not found
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
-3.431175, -0.7337256, -0.7063608, 0, 0, 1, 1, 1,
-3.045433, -0.08156251, -1.513203, 1, 0, 0, 1, 1,
-2.747527, -2.380504, -3.421315, 1, 0, 0, 1, 1,
-2.714069, 0.5967211, -1.619645, 1, 0, 0, 1, 1,
-2.700486, -0.6851245, -1.650465, 1, 0, 0, 1, 1,
-2.485599, 0.7668205, -0.8822357, 1, 0, 0, 1, 1,
-2.434507, -0.1643662, -1.979619, 0, 0, 0, 1, 1,
-2.380227, -0.2765366, -1.659282, 0, 0, 0, 1, 1,
-2.246382, 1.850676, 0.4377993, 0, 0, 0, 1, 1,
-2.1856, -0.5787687, -1.102191, 0, 0, 0, 1, 1,
-2.172221, 1.236341, -2.881224, 0, 0, 0, 1, 1,
-2.152737, -1.571056, -1.672815, 0, 0, 0, 1, 1,
-2.132969, 1.250935, 0.02446261, 0, 0, 0, 1, 1,
-2.088186, 1.038, -1.337833, 1, 1, 1, 1, 1,
-2.067826, -1.421806, -1.525631, 1, 1, 1, 1, 1,
-2.033454, 0.4216763, 0.2687462, 1, 1, 1, 1, 1,
-2.007071, -1.418937, -4.268076, 1, 1, 1, 1, 1,
-1.952143, -0.6555386, -2.539325, 1, 1, 1, 1, 1,
-1.870598, 0.001854236, -1.913851, 1, 1, 1, 1, 1,
-1.855247, -1.304135, -2.012173, 1, 1, 1, 1, 1,
-1.849554, 0.8831789, -1.456698, 1, 1, 1, 1, 1,
-1.843609, -0.8572174, -2.209543, 1, 1, 1, 1, 1,
-1.827267, 0.348492, -0.5140026, 1, 1, 1, 1, 1,
-1.823654, -0.8493565, -1.368559, 1, 1, 1, 1, 1,
-1.813034, -1.58189, -2.333865, 1, 1, 1, 1, 1,
-1.799968, -0.5439003, -2.688235, 1, 1, 1, 1, 1,
-1.796962, -0.1884751, -1.480081, 1, 1, 1, 1, 1,
-1.774581, -0.3380075, -1.327849, 1, 1, 1, 1, 1,
-1.760258, 0.5171381, -0.2649961, 0, 0, 1, 1, 1,
-1.744034, 0.1042816, -0.3096198, 1, 0, 0, 1, 1,
-1.7377, -1.179458, -3.340399, 1, 0, 0, 1, 1,
-1.734225, -0.2038281, -0.6939937, 1, 0, 0, 1, 1,
-1.731079, -0.1701179, 0.09957661, 1, 0, 0, 1, 1,
-1.692372, 0.4032632, -1.181524, 1, 0, 0, 1, 1,
-1.687617, -0.04194417, -2.163339, 0, 0, 0, 1, 1,
-1.677946, -1.864261, -2.070601, 0, 0, 0, 1, 1,
-1.674278, -1.390448, -2.875128, 0, 0, 0, 1, 1,
-1.661383, -0.8969671, -3.286481, 0, 0, 0, 1, 1,
-1.648698, 1.582841, -1.983723, 0, 0, 0, 1, 1,
-1.625151, 0.1239474, -0.9154366, 0, 0, 0, 1, 1,
-1.614443, -0.1158857, -1.229844, 0, 0, 0, 1, 1,
-1.610128, 1.263932, -0.6524113, 1, 1, 1, 1, 1,
-1.608899, -0.3386896, -1.911255, 1, 1, 1, 1, 1,
-1.601927, -1.64213, -2.352532, 1, 1, 1, 1, 1,
-1.592391, 1.349197, -2.741913, 1, 1, 1, 1, 1,
-1.581537, -0.04295884, -1.382542, 1, 1, 1, 1, 1,
-1.565192, -0.5783002, -3.409968, 1, 1, 1, 1, 1,
-1.554904, -0.5602916, -2.686361, 1, 1, 1, 1, 1,
-1.546143, 0.7872127, -3.290424, 1, 1, 1, 1, 1,
-1.545942, 0.7694274, -0.4378147, 1, 1, 1, 1, 1,
-1.529938, -1.611619, -3.191344, 1, 1, 1, 1, 1,
-1.526754, 2.62701, -1.543293, 1, 1, 1, 1, 1,
-1.519765, 0.5041307, -0.210435, 1, 1, 1, 1, 1,
-1.515072, -0.9802526, -2.4115, 1, 1, 1, 1, 1,
-1.514643, -0.6207038, -3.146915, 1, 1, 1, 1, 1,
-1.51348, 0.2283858, -1.118687, 1, 1, 1, 1, 1,
-1.507144, 1.411456, -0.3620841, 0, 0, 1, 1, 1,
-1.505466, -0.1262418, -1.243255, 1, 0, 0, 1, 1,
-1.502877, -1.139216, -2.38342, 1, 0, 0, 1, 1,
-1.501455, 0.1740165, -1.522167, 1, 0, 0, 1, 1,
-1.46582, 1.455833, -0.429728, 1, 0, 0, 1, 1,
-1.45285, 0.1597657, -0.430852, 1, 0, 0, 1, 1,
-1.449031, 1.049388, -1.352276, 0, 0, 0, 1, 1,
-1.446107, -0.6401379, -0.3923444, 0, 0, 0, 1, 1,
-1.432364, -1.761025, -2.129342, 0, 0, 0, 1, 1,
-1.412588, -2.024074, -2.976682, 0, 0, 0, 1, 1,
-1.400347, -0.1647889, -0.8312122, 0, 0, 0, 1, 1,
-1.394731, 0.1421809, -0.5394022, 0, 0, 0, 1, 1,
-1.394586, -0.05741125, -1.830686, 0, 0, 0, 1, 1,
-1.393484, -0.9963626, -0.6831849, 1, 1, 1, 1, 1,
-1.393182, -0.3855951, -1.517997, 1, 1, 1, 1, 1,
-1.391379, -1.162131, -3.318059, 1, 1, 1, 1, 1,
-1.387918, 0.5459819, -1.526757, 1, 1, 1, 1, 1,
-1.380109, -0.2728534, -1.402822, 1, 1, 1, 1, 1,
-1.378348, 1.277195, -0.6110955, 1, 1, 1, 1, 1,
-1.369621, 0.8151106, -1.166077, 1, 1, 1, 1, 1,
-1.366255, 0.604401, -3.090721, 1, 1, 1, 1, 1,
-1.361634, -0.02126996, -1.316818, 1, 1, 1, 1, 1,
-1.359775, -0.1738634, -3.200842, 1, 1, 1, 1, 1,
-1.353113, 0.5069591, -1.720258, 1, 1, 1, 1, 1,
-1.34771, 1.59065, 1.253639, 1, 1, 1, 1, 1,
-1.34417, 1.444069, -0.9054425, 1, 1, 1, 1, 1,
-1.34202, 0.3330445, -0.3196147, 1, 1, 1, 1, 1,
-1.332853, 1.109362, -1.01984, 1, 1, 1, 1, 1,
-1.329887, -1.342858, -2.221403, 0, 0, 1, 1, 1,
-1.325035, -0.2639721, -0.752726, 1, 0, 0, 1, 1,
-1.314203, 0.311305, -0.5904513, 1, 0, 0, 1, 1,
-1.312737, 0.3637463, -2.243046, 1, 0, 0, 1, 1,
-1.310132, -0.0998755, 0.4044282, 1, 0, 0, 1, 1,
-1.30811, 0.8661407, -1.53769, 1, 0, 0, 1, 1,
-1.30259, 0.7643424, -2.124558, 0, 0, 0, 1, 1,
-1.294552, 0.3149908, -1.457624, 0, 0, 0, 1, 1,
-1.291899, -0.2203205, -1.246995, 0, 0, 0, 1, 1,
-1.281946, -0.07172527, -1.940882, 0, 0, 0, 1, 1,
-1.273696, -1.415541, -2.482485, 0, 0, 0, 1, 1,
-1.267954, -0.6026898, -3.725899, 0, 0, 0, 1, 1,
-1.267041, 0.9396437, -0.7116835, 0, 0, 0, 1, 1,
-1.266131, 0.9287503, -1.307243, 1, 1, 1, 1, 1,
-1.248699, 1.935176, -0.07892771, 1, 1, 1, 1, 1,
-1.245283, -0.5804181, 0.156612, 1, 1, 1, 1, 1,
-1.235628, 0.4748396, -2.282814, 1, 1, 1, 1, 1,
-1.222352, 1.691626, -2.27614, 1, 1, 1, 1, 1,
-1.219092, 0.4742528, 0.4287938, 1, 1, 1, 1, 1,
-1.218627, -0.173586, -2.543317, 1, 1, 1, 1, 1,
-1.216814, 0.2439586, 0.7028706, 1, 1, 1, 1, 1,
-1.212714, -1.546253, -2.282495, 1, 1, 1, 1, 1,
-1.203275, -0.6635017, -2.262779, 1, 1, 1, 1, 1,
-1.192553, -1.878757, -3.307676, 1, 1, 1, 1, 1,
-1.190506, -0.2989655, -3.017758, 1, 1, 1, 1, 1,
-1.190273, -0.8858963, -1.477181, 1, 1, 1, 1, 1,
-1.171033, -0.5317835, -0.5829141, 1, 1, 1, 1, 1,
-1.158244, -0.5954711, -1.662643, 1, 1, 1, 1, 1,
-1.157241, -1.968303, -1.523676, 0, 0, 1, 1, 1,
-1.149746, 1.169557, -2.026063, 1, 0, 0, 1, 1,
-1.148395, 0.07103994, -0.1666691, 1, 0, 0, 1, 1,
-1.141645, -1.084457, -3.011669, 1, 0, 0, 1, 1,
-1.127134, -0.1103879, -2.312392, 1, 0, 0, 1, 1,
-1.123178, 0.3593405, -2.845104, 1, 0, 0, 1, 1,
-1.118263, 1.362422, -1.352286, 0, 0, 0, 1, 1,
-1.116263, -1.986279, -3.218482, 0, 0, 0, 1, 1,
-1.115355, 0.7295626, -0.4910895, 0, 0, 0, 1, 1,
-1.109898, -0.4396029, -3.256617, 0, 0, 0, 1, 1,
-1.106589, 1.234149, -1.235393, 0, 0, 0, 1, 1,
-1.104857, 0.8574462, -2.147216, 0, 0, 0, 1, 1,
-1.104025, -0.583934, -2.494993, 0, 0, 0, 1, 1,
-1.102017, 0.01093168, -2.861244, 1, 1, 1, 1, 1,
-1.100289, -0.2716485, -0.7606664, 1, 1, 1, 1, 1,
-1.09382, -0.2455066, -2.999409, 1, 1, 1, 1, 1,
-1.084434, -0.3097664, -1.375389, 1, 1, 1, 1, 1,
-1.083794, -0.6585897, -2.117008, 1, 1, 1, 1, 1,
-1.081412, -0.6376672, -2.382419, 1, 1, 1, 1, 1,
-1.076073, -0.2232045, -1.377248, 1, 1, 1, 1, 1,
-1.068495, -0.5331524, -1.159785, 1, 1, 1, 1, 1,
-1.065093, 0.8634661, -1.173085, 1, 1, 1, 1, 1,
-1.062425, -0.3908352, -2.421008, 1, 1, 1, 1, 1,
-1.05868, 0.8512967, -1.291281, 1, 1, 1, 1, 1,
-1.058462, -2.414713, -3.625478, 1, 1, 1, 1, 1,
-1.052171, -0.1568782, -2.226996, 1, 1, 1, 1, 1,
-1.038784, -0.2897878, -0.784248, 1, 1, 1, 1, 1,
-1.033641, 0.9384095, 0.4970937, 1, 1, 1, 1, 1,
-1.031792, -1.010387, -1.202756, 0, 0, 1, 1, 1,
-1.026812, 0.5846198, -1.262324, 1, 0, 0, 1, 1,
-1.023621, 0.4346614, -0.4239942, 1, 0, 0, 1, 1,
-1.022825, 1.774479, -0.3261224, 1, 0, 0, 1, 1,
-1.022626, 0.948423, 0.9356598, 1, 0, 0, 1, 1,
-1.01422, 0.1776678, -1.068132, 1, 0, 0, 1, 1,
-1.012405, 1.261935, 0.1181141, 0, 0, 0, 1, 1,
-1.011218, -0.8543734, -1.730652, 0, 0, 0, 1, 1,
-1.008477, -1.192379, -3.279436, 0, 0, 0, 1, 1,
-1.004756, 2.272321, -1.237851, 0, 0, 0, 1, 1,
-1.000754, 0.4686697, -1.640503, 0, 0, 0, 1, 1,
-0.9997941, -0.2321226, -0.7601088, 0, 0, 0, 1, 1,
-0.9990162, -0.8347552, -0.0974056, 0, 0, 0, 1, 1,
-0.9969316, 0.2739885, -2.039463, 1, 1, 1, 1, 1,
-0.9936285, -0.2942819, -2.853251, 1, 1, 1, 1, 1,
-0.9839544, -0.8302395, -3.81174, 1, 1, 1, 1, 1,
-0.9814583, 0.4765295, -2.002838, 1, 1, 1, 1, 1,
-0.9722092, 0.6098301, 0.7430739, 1, 1, 1, 1, 1,
-0.9638393, -0.6832046, -1.665186, 1, 1, 1, 1, 1,
-0.9579301, 0.4886885, -0.5169523, 1, 1, 1, 1, 1,
-0.9561219, 0.04840792, -2.8169, 1, 1, 1, 1, 1,
-0.9549738, -0.9178391, -1.088705, 1, 1, 1, 1, 1,
-0.9491746, -0.4476731, -3.573746, 1, 1, 1, 1, 1,
-0.9357731, 0.6689541, -1.902612, 1, 1, 1, 1, 1,
-0.9355704, 0.2276385, -0.3001682, 1, 1, 1, 1, 1,
-0.9319659, 1.145324, -1.490958, 1, 1, 1, 1, 1,
-0.9275653, -0.3384773, -1.289345, 1, 1, 1, 1, 1,
-0.9204105, 1.196123, 1.665627, 1, 1, 1, 1, 1,
-0.9190933, 1.068758, -0.711859, 0, 0, 1, 1, 1,
-0.9144915, -1.072282, -1.038138, 1, 0, 0, 1, 1,
-0.9129964, 0.9422309, -3.302299, 1, 0, 0, 1, 1,
-0.9069925, 0.2197842, -2.49654, 1, 0, 0, 1, 1,
-0.9069358, -1.264002, -2.439035, 1, 0, 0, 1, 1,
-0.9062374, -0.7434828, -0.6221976, 1, 0, 0, 1, 1,
-0.9029832, 0.5486613, -0.6310859, 0, 0, 0, 1, 1,
-0.8966662, -1.552585, -1.498355, 0, 0, 0, 1, 1,
-0.8961688, -0.1257736, -1.537654, 0, 0, 0, 1, 1,
-0.8955448, 0.3112784, 1.816144, 0, 0, 0, 1, 1,
-0.8948936, 1.445137, -1.53073, 0, 0, 0, 1, 1,
-0.8846417, 0.307659, -3.313114, 0, 0, 0, 1, 1,
-0.8846283, 0.3322764, -0.06812472, 0, 0, 0, 1, 1,
-0.884471, 0.7693366, -0.9397913, 1, 1, 1, 1, 1,
-0.8830882, -1.885949, -4.478212, 1, 1, 1, 1, 1,
-0.8811793, -0.3215602, -2.787224, 1, 1, 1, 1, 1,
-0.8794699, -0.3246728, -2.288789, 1, 1, 1, 1, 1,
-0.8664051, -0.48896, -3.343781, 1, 1, 1, 1, 1,
-0.8555295, 0.4637846, -0.3075979, 1, 1, 1, 1, 1,
-0.847532, -0.857411, -2.75676, 1, 1, 1, 1, 1,
-0.8436038, -0.654733, -0.3435449, 1, 1, 1, 1, 1,
-0.8411511, 0.1639097, -0.003193303, 1, 1, 1, 1, 1,
-0.8378937, 2.068982, -1.147237, 1, 1, 1, 1, 1,
-0.8305793, -0.4977539, -0.8597798, 1, 1, 1, 1, 1,
-0.827894, -1.54664, -2.106423, 1, 1, 1, 1, 1,
-0.8266001, 1.020656, -0.777852, 1, 1, 1, 1, 1,
-0.8263716, -1.539197, -3.948312, 1, 1, 1, 1, 1,
-0.8237324, -0.6710505, -2.301037, 1, 1, 1, 1, 1,
-0.8211465, 0.03143706, -1.141198, 0, 0, 1, 1, 1,
-0.8187299, -0.5582826, -3.474925, 1, 0, 0, 1, 1,
-0.8112094, -0.3633935, -1.747522, 1, 0, 0, 1, 1,
-0.806308, 0.2087414, -1.148153, 1, 0, 0, 1, 1,
-0.8030929, -0.3144838, -0.2921998, 1, 0, 0, 1, 1,
-0.8029125, -0.3540601, -1.222139, 1, 0, 0, 1, 1,
-0.8010798, 1.077059, -0.02409852, 0, 0, 0, 1, 1,
-0.7976608, -1.167583, -2.534325, 0, 0, 0, 1, 1,
-0.7938437, 0.4714829, 0.7533659, 0, 0, 0, 1, 1,
-0.7928315, 0.7188351, 2.808732, 0, 0, 0, 1, 1,
-0.7919718, 0.9302523, 0.5797988, 0, 0, 0, 1, 1,
-0.7887874, -1.038713, -3.210321, 0, 0, 0, 1, 1,
-0.7886118, -0.07724845, -0.836182, 0, 0, 0, 1, 1,
-0.7884322, 2.424685, -0.8779053, 1, 1, 1, 1, 1,
-0.7858806, -0.9170309, -0.6784188, 1, 1, 1, 1, 1,
-0.7755167, 1.134275, -0.9247189, 1, 1, 1, 1, 1,
-0.7742255, 0.1723347, -0.6739559, 1, 1, 1, 1, 1,
-0.7663473, -1.437278, -3.93157, 1, 1, 1, 1, 1,
-0.7578823, -0.2476695, -1.088961, 1, 1, 1, 1, 1,
-0.756355, 2.030711, -2.431776, 1, 1, 1, 1, 1,
-0.7548191, 0.8124654, 0.4813632, 1, 1, 1, 1, 1,
-0.7480824, 0.9981352, -2.2302, 1, 1, 1, 1, 1,
-0.7474807, 3.15692, -0.01695118, 1, 1, 1, 1, 1,
-0.7466557, 1.15337, -1.550211, 1, 1, 1, 1, 1,
-0.7440581, -0.9948414, -2.354779, 1, 1, 1, 1, 1,
-0.74235, -0.7686716, -5.492346, 1, 1, 1, 1, 1,
-0.7418664, 0.4094571, -1.472131, 1, 1, 1, 1, 1,
-0.7411475, -1.08498, -2.544115, 1, 1, 1, 1, 1,
-0.7301105, 0.6052819, -1.45215, 0, 0, 1, 1, 1,
-0.728221, -2.299506, -3.254823, 1, 0, 0, 1, 1,
-0.7203494, 0.05977604, -1.546776, 1, 0, 0, 1, 1,
-0.7182567, -0.1499518, -0.7382484, 1, 0, 0, 1, 1,
-0.7043917, -0.1385647, -0.7167068, 1, 0, 0, 1, 1,
-0.7032224, -1.15595, -1.855334, 1, 0, 0, 1, 1,
-0.6996537, 0.3042032, -2.532121, 0, 0, 0, 1, 1,
-0.694123, 0.1817555, -0.7836334, 0, 0, 0, 1, 1,
-0.6925045, -0.1741999, 0.5292086, 0, 0, 0, 1, 1,
-0.6881139, 0.5935796, -1.966663, 0, 0, 0, 1, 1,
-0.670706, -0.1747956, -2.015515, 0, 0, 0, 1, 1,
-0.6700386, -1.51744, -2.973444, 0, 0, 0, 1, 1,
-0.6656838, 0.682623, -0.1493772, 0, 0, 0, 1, 1,
-0.6584886, -0.0654555, -1.305732, 1, 1, 1, 1, 1,
-0.6575037, 0.2945174, -0.05539627, 1, 1, 1, 1, 1,
-0.6561104, 0.3695665, -2.453103, 1, 1, 1, 1, 1,
-0.6546957, -1.63975, -2.103582, 1, 1, 1, 1, 1,
-0.6527578, 1.430137, -0.6894749, 1, 1, 1, 1, 1,
-0.6475627, 0.7184221, -0.6768455, 1, 1, 1, 1, 1,
-0.646237, -0.07383245, -1.330796, 1, 1, 1, 1, 1,
-0.6451085, -1.68016, -2.564095, 1, 1, 1, 1, 1,
-0.6446805, -0.5982238, -2.379263, 1, 1, 1, 1, 1,
-0.6403359, 0.8387738, -1.836201, 1, 1, 1, 1, 1,
-0.632663, -1.556443, -3.541596, 1, 1, 1, 1, 1,
-0.631376, -0.942731, -3.867647, 1, 1, 1, 1, 1,
-0.6287853, -0.3101967, -2.708266, 1, 1, 1, 1, 1,
-0.6272308, -1.584944, -1.869156, 1, 1, 1, 1, 1,
-0.6264365, 0.3053212, -0.8826649, 1, 1, 1, 1, 1,
-0.6260307, -2.611088, -1.220648, 0, 0, 1, 1, 1,
-0.6259666, 0.5006292, -1.331322, 1, 0, 0, 1, 1,
-0.6172919, 0.1643618, -2.725578, 1, 0, 0, 1, 1,
-0.6164976, 0.9289557, -0.2644954, 1, 0, 0, 1, 1,
-0.615368, 1.013979, 1.776615, 1, 0, 0, 1, 1,
-0.6142277, 1.826532, -1.581305, 1, 0, 0, 1, 1,
-0.6129097, 0.2071991, -1.562809, 0, 0, 0, 1, 1,
-0.6116588, 0.7152206, -0.6480712, 0, 0, 0, 1, 1,
-0.6048569, 0.1324602, -1.107243, 0, 0, 0, 1, 1,
-0.6044356, -1.205041, -1.391669, 0, 0, 0, 1, 1,
-0.5914751, -0.9539146, -2.421535, 0, 0, 0, 1, 1,
-0.5896081, -3.375906, -3.224684, 0, 0, 0, 1, 1,
-0.5891584, 0.6109581, -1.572283, 0, 0, 0, 1, 1,
-0.5835581, -2.177935, -2.841075, 1, 1, 1, 1, 1,
-0.581055, 0.4454352, -0.07276098, 1, 1, 1, 1, 1,
-0.5672721, 0.4722496, -2.398425, 1, 1, 1, 1, 1,
-0.5593787, -1.688249, -1.133017, 1, 1, 1, 1, 1,
-0.5588837, 1.100136, 0.8093951, 1, 1, 1, 1, 1,
-0.5517971, 1.630082, 2.159318, 1, 1, 1, 1, 1,
-0.5511443, 1.257942, -1.328997, 1, 1, 1, 1, 1,
-0.5509438, 1.037938, -1.17935, 1, 1, 1, 1, 1,
-0.5473412, 0.4226231, -0.1215431, 1, 1, 1, 1, 1,
-0.5473216, 0.5801899, -1.50655, 1, 1, 1, 1, 1,
-0.5385404, 1.713968, 0.8342654, 1, 1, 1, 1, 1,
-0.5377513, 0.1477751, -3.02476, 1, 1, 1, 1, 1,
-0.5353686, -0.02061394, -2.037786, 1, 1, 1, 1, 1,
-0.5280983, 0.4110607, -1.426634, 1, 1, 1, 1, 1,
-0.5265896, 1.05967, 0.4686984, 1, 1, 1, 1, 1,
-0.5256137, 0.05255308, -1.786028, 0, 0, 1, 1, 1,
-0.5252179, -1.250582, -2.653651, 1, 0, 0, 1, 1,
-0.5209463, -0.8688223, -2.679038, 1, 0, 0, 1, 1,
-0.5200121, 1.409808, 0.08535352, 1, 0, 0, 1, 1,
-0.5174195, 0.9449725, -2.801679, 1, 0, 0, 1, 1,
-0.51673, -0.7561151, -1.935347, 1, 0, 0, 1, 1,
-0.5156593, -1.089823, -1.068406, 0, 0, 0, 1, 1,
-0.5147628, -1.394435, -2.138215, 0, 0, 0, 1, 1,
-0.5118896, 0.05594421, -2.618121, 0, 0, 0, 1, 1,
-0.5068684, -0.5797572, -5.156383, 0, 0, 0, 1, 1,
-0.5016854, -0.2899336, -3.233057, 0, 0, 0, 1, 1,
-0.4954315, 0.8364692, -2.470742, 0, 0, 0, 1, 1,
-0.4790326, 0.5124311, -3.044107, 0, 0, 0, 1, 1,
-0.4786799, 1.933181, -0.4361436, 1, 1, 1, 1, 1,
-0.4785693, -1.073919, -2.081566, 1, 1, 1, 1, 1,
-0.4782361, 2.129664, -0.5127107, 1, 1, 1, 1, 1,
-0.4745013, 0.3217555, -1.429188, 1, 1, 1, 1, 1,
-0.468465, -0.5587979, -0.1219574, 1, 1, 1, 1, 1,
-0.4660888, 1.812089, -0.3194758, 1, 1, 1, 1, 1,
-0.463331, 1.377061, 0.238916, 1, 1, 1, 1, 1,
-0.4619984, -0.9152061, -2.214514, 1, 1, 1, 1, 1,
-0.4616984, 0.07230379, -2.285136, 1, 1, 1, 1, 1,
-0.4589583, -0.6854286, -2.299244, 1, 1, 1, 1, 1,
-0.4556814, 1.003197, -2.958442, 1, 1, 1, 1, 1,
-0.4519826, -0.3154326, -0.5603781, 1, 1, 1, 1, 1,
-0.4488239, 0.5636837, -1.176429, 1, 1, 1, 1, 1,
-0.4483847, -1.30383, -2.237787, 1, 1, 1, 1, 1,
-0.4465192, 0.3741657, -0.4965695, 1, 1, 1, 1, 1,
-0.445235, -1.482174, -4.69962, 0, 0, 1, 1, 1,
-0.4431449, 0.9448418, -1.735205, 1, 0, 0, 1, 1,
-0.4421078, 0.0569177, -2.25789, 1, 0, 0, 1, 1,
-0.442078, 0.1952487, -1.995262, 1, 0, 0, 1, 1,
-0.440603, 1.242962, -2.159498, 1, 0, 0, 1, 1,
-0.4380788, -0.8015929, -3.096272, 1, 0, 0, 1, 1,
-0.4372386, -0.4972082, 0.0832113, 0, 0, 0, 1, 1,
-0.4367915, 1.24324, -0.5847823, 0, 0, 0, 1, 1,
-0.4347643, -0.285719, -2.948505, 0, 0, 0, 1, 1,
-0.430566, 1.182662, 0.5888014, 0, 0, 0, 1, 1,
-0.428555, 2.236086, 1.665911, 0, 0, 0, 1, 1,
-0.4266544, -0.6554837, -0.7846543, 0, 0, 0, 1, 1,
-0.4249357, 0.7692635, -0.7611879, 0, 0, 0, 1, 1,
-0.418227, -0.4898965, -3.151826, 1, 1, 1, 1, 1,
-0.4162798, -1.3748, -2.976082, 1, 1, 1, 1, 1,
-0.4161968, -0.2650923, -1.049208, 1, 1, 1, 1, 1,
-0.4135225, -1.095003, -2.59076, 1, 1, 1, 1, 1,
-0.4069805, 0.7331837, 0.6689808, 1, 1, 1, 1, 1,
-0.4046995, -2.044778, -2.536831, 1, 1, 1, 1, 1,
-0.4030745, 0.8846356, -1.841962, 1, 1, 1, 1, 1,
-0.4010426, 0.1012788, -0.8422953, 1, 1, 1, 1, 1,
-0.3976311, 0.2077744, -0.3973047, 1, 1, 1, 1, 1,
-0.3930543, 0.8180243, 0.3192815, 1, 1, 1, 1, 1,
-0.3899678, -1.124676, -3.028506, 1, 1, 1, 1, 1,
-0.3794586, 1.295873, 0.7399095, 1, 1, 1, 1, 1,
-0.37639, -1.816299, -3.547074, 1, 1, 1, 1, 1,
-0.3759187, -0.6114262, -3.942662, 1, 1, 1, 1, 1,
-0.3733508, 0.6204338, -1.987529, 1, 1, 1, 1, 1,
-0.3720449, -0.2531412, -2.672565, 0, 0, 1, 1, 1,
-0.3710538, 0.4565618, -1.729029, 1, 0, 0, 1, 1,
-0.3703608, 1.853954, 1.844414, 1, 0, 0, 1, 1,
-0.3698834, 0.8555053, -0.9868696, 1, 0, 0, 1, 1,
-0.36759, -0.5743986, -3.352973, 1, 0, 0, 1, 1,
-0.3672478, 0.4590193, -0.3533612, 1, 0, 0, 1, 1,
-0.364339, -0.5520511, -2.931476, 0, 0, 0, 1, 1,
-0.3632717, 0.784936, 1.028302, 0, 0, 0, 1, 1,
-0.3594254, 0.3198183, -2.106775, 0, 0, 0, 1, 1,
-0.3586941, -1.775282, -3.574184, 0, 0, 0, 1, 1,
-0.3551222, -0.6446376, -2.280538, 0, 0, 0, 1, 1,
-0.3495282, 1.261704, -0.6238038, 0, 0, 0, 1, 1,
-0.3422221, 0.3603081, -0.9139001, 0, 0, 0, 1, 1,
-0.3408242, 0.02623203, -0.4757068, 1, 1, 1, 1, 1,
-0.3396205, 1.018292, -1.521273, 1, 1, 1, 1, 1,
-0.3355591, -0.8535497, -3.440255, 1, 1, 1, 1, 1,
-0.3338551, 0.2933207, -2.719426, 1, 1, 1, 1, 1,
-0.3320085, 0.5901745, -0.8919777, 1, 1, 1, 1, 1,
-0.3287424, 0.0238665, -2.459779, 1, 1, 1, 1, 1,
-0.3200851, -0.2473353, -1.492564, 1, 1, 1, 1, 1,
-0.3156695, 0.1532619, 0.1011514, 1, 1, 1, 1, 1,
-0.3143423, 0.2790208, -1.512232, 1, 1, 1, 1, 1,
-0.3116706, -1.532121, -2.445588, 1, 1, 1, 1, 1,
-0.3109624, -1.194591, -3.056892, 1, 1, 1, 1, 1,
-0.306108, 0.8137849, 0.2650734, 1, 1, 1, 1, 1,
-0.3058801, -0.3544608, -1.764048, 1, 1, 1, 1, 1,
-0.3029864, 0.5503343, 1.647379, 1, 1, 1, 1, 1,
-0.2960746, -0.02474221, 0.1544703, 1, 1, 1, 1, 1,
-0.2941442, 1.92447, -0.5328978, 0, 0, 1, 1, 1,
-0.29258, 0.3094774, -1.192752, 1, 0, 0, 1, 1,
-0.2908647, -0.413555, -2.588013, 1, 0, 0, 1, 1,
-0.2905798, -0.9755661, -2.974186, 1, 0, 0, 1, 1,
-0.2878312, -0.3301269, -3.611458, 1, 0, 0, 1, 1,
-0.2812602, -1.225325, -1.578207, 1, 0, 0, 1, 1,
-0.2788207, -0.3095957, -2.748686, 0, 0, 0, 1, 1,
-0.2761054, 0.08682746, -1.627613, 0, 0, 0, 1, 1,
-0.2756673, -0.2268025, -1.379681, 0, 0, 0, 1, 1,
-0.2754426, 0.6001582, -0.6588481, 0, 0, 0, 1, 1,
-0.2744827, 1.045372, -0.8239244, 0, 0, 0, 1, 1,
-0.2741788, -0.7192178, -3.618926, 0, 0, 0, 1, 1,
-0.263183, -1.069996, -2.719148, 0, 0, 0, 1, 1,
-0.2589852, -0.9394487, -2.88326, 1, 1, 1, 1, 1,
-0.2569715, -0.7756142, -3.097517, 1, 1, 1, 1, 1,
-0.2536467, -0.1042958, -0.8324566, 1, 1, 1, 1, 1,
-0.2528945, 1.563459, 0.3562938, 1, 1, 1, 1, 1,
-0.2505881, -0.4925802, -2.612513, 1, 1, 1, 1, 1,
-0.2500764, 0.05218488, -1.089505, 1, 1, 1, 1, 1,
-0.2483033, 0.1402257, -0.7283223, 1, 1, 1, 1, 1,
-0.2442723, 0.04584415, -1.398185, 1, 1, 1, 1, 1,
-0.2383052, 0.03850459, -0.9982058, 1, 1, 1, 1, 1,
-0.2341241, 1.28051, 0.912228, 1, 1, 1, 1, 1,
-0.2278055, 1.436756, 0.7210228, 1, 1, 1, 1, 1,
-0.2221747, -1.655911, -1.846718, 1, 1, 1, 1, 1,
-0.2187397, -1.250162, -2.588187, 1, 1, 1, 1, 1,
-0.2105395, 0.2434981, -1.29052, 1, 1, 1, 1, 1,
-0.2099455, 0.2862906, -0.7700172, 1, 1, 1, 1, 1,
-0.206199, -0.6835563, -1.820025, 0, 0, 1, 1, 1,
-0.2020708, -0.8746223, -3.393065, 1, 0, 0, 1, 1,
-0.197349, 0.899738, -0.3822687, 1, 0, 0, 1, 1,
-0.1931288, 1.490441, -0.7059582, 1, 0, 0, 1, 1,
-0.1871632, -0.6598358, -1.521917, 1, 0, 0, 1, 1,
-0.1871323, -0.02839038, -2.831414, 1, 0, 0, 1, 1,
-0.1857185, -1.68314, -2.414358, 0, 0, 0, 1, 1,
-0.1852067, 0.03485471, -1.519681, 0, 0, 0, 1, 1,
-0.1821923, 0.6183867, -1.299728, 0, 0, 0, 1, 1,
-0.1771314, 0.5923761, -2.196926, 0, 0, 0, 1, 1,
-0.172766, 0.7794883, -0.6956443, 0, 0, 0, 1, 1,
-0.1658175, -0.3463275, -2.412308, 0, 0, 0, 1, 1,
-0.1570929, 0.04807971, -1.571855, 0, 0, 0, 1, 1,
-0.1499468, 0.6527433, 1.639751, 1, 1, 1, 1, 1,
-0.1468194, 2.37728, 0.3769042, 1, 1, 1, 1, 1,
-0.1447399, 1.232812, 1.318996, 1, 1, 1, 1, 1,
-0.1393518, 0.4223759, -0.1102281, 1, 1, 1, 1, 1,
-0.136229, 1.078107, 0.5865914, 1, 1, 1, 1, 1,
-0.1357423, -0.1353901, -2.266442, 1, 1, 1, 1, 1,
-0.1353478, -0.7702477, -1.030789, 1, 1, 1, 1, 1,
-0.1310235, -1.137376, -3.87031, 1, 1, 1, 1, 1,
-0.128954, -0.5661543, -2.044282, 1, 1, 1, 1, 1,
-0.1236814, -1.130661, -3.636953, 1, 1, 1, 1, 1,
-0.1231004, -1.292668, -3.423688, 1, 1, 1, 1, 1,
-0.1227326, 0.1853478, -0.2657782, 1, 1, 1, 1, 1,
-0.1217258, -0.4475088, -3.126732, 1, 1, 1, 1, 1,
-0.1207161, -1.315534, -3.539139, 1, 1, 1, 1, 1,
-0.1204054, 0.4336314, -0.5240054, 1, 1, 1, 1, 1,
-0.1185545, -0.1733235, -2.779453, 0, 0, 1, 1, 1,
-0.1177173, -0.398009, -4.451062, 1, 0, 0, 1, 1,
-0.116698, 0.6863993, -1.543858, 1, 0, 0, 1, 1,
-0.1141214, -0.2915534, -3.474519, 1, 0, 0, 1, 1,
-0.1132397, 0.8636543, -1.733353, 1, 0, 0, 1, 1,
-0.1117764, -0.002169722, -0.5876659, 1, 0, 0, 1, 1,
-0.1002559, 0.9821594, 0.7739878, 0, 0, 0, 1, 1,
-0.096255, -1.038535, -4.913413, 0, 0, 0, 1, 1,
-0.09250139, 0.5629446, 1.370409, 0, 0, 0, 1, 1,
-0.08730704, -1.274689, -3.264424, 0, 0, 0, 1, 1,
-0.08678509, 2.116746, 0.06601391, 0, 0, 0, 1, 1,
-0.08349132, -0.100499, -2.925155, 0, 0, 0, 1, 1,
-0.08196072, 0.08970275, -1.721036, 0, 0, 0, 1, 1,
-0.08159633, 1.685405, 1.038061, 1, 1, 1, 1, 1,
-0.08002761, -2.049689, -2.654115, 1, 1, 1, 1, 1,
-0.07779561, 0.5084893, 0.4103206, 1, 1, 1, 1, 1,
-0.06979477, -0.3159299, -3.132625, 1, 1, 1, 1, 1,
-0.0697137, 0.2130962, -0.0506638, 1, 1, 1, 1, 1,
-0.06792261, 0.3535993, -0.3065435, 1, 1, 1, 1, 1,
-0.06178308, -1.156598, -1.486148, 1, 1, 1, 1, 1,
-0.0579492, 0.1028649, -0.05212139, 1, 1, 1, 1, 1,
-0.05683295, 0.8097529, 1.804953, 1, 1, 1, 1, 1,
-0.05488979, 0.6723359, 1.667252, 1, 1, 1, 1, 1,
-0.05464125, 1.252612, -1.169814, 1, 1, 1, 1, 1,
-0.0535836, -0.01096589, -2.690837, 1, 1, 1, 1, 1,
-0.05329818, 1.006162, 0.4704047, 1, 1, 1, 1, 1,
-0.05272628, -0.1242456, -3.193887, 1, 1, 1, 1, 1,
-0.05175734, 0.4763405, 0.9544872, 1, 1, 1, 1, 1,
-0.05104285, -0.7917292, -3.026837, 0, 0, 1, 1, 1,
-0.05062698, 0.3183662, 0.06762229, 1, 0, 0, 1, 1,
-0.04819468, 1.567664, -1.861646, 1, 0, 0, 1, 1,
-0.04405173, 1.094858, -1.779278, 1, 0, 0, 1, 1,
-0.04035881, -0.3674486, -1.610904, 1, 0, 0, 1, 1,
-0.04019431, 0.3489824, 1.560798, 1, 0, 0, 1, 1,
-0.03702527, -0.8521448, -4.409619, 0, 0, 0, 1, 1,
-0.03690139, 0.1683124, -1.747348, 0, 0, 0, 1, 1,
-0.03178784, -0.8505462, -3.00696, 0, 0, 0, 1, 1,
-0.0309359, -1.996018, -1.429727, 0, 0, 0, 1, 1,
-0.02318062, -0.06543344, -2.051142, 0, 0, 0, 1, 1,
-0.02123662, 0.3584197, -0.06765955, 0, 0, 0, 1, 1,
-0.01435049, -1.267439, -4.550567, 0, 0, 0, 1, 1,
-0.01172349, -0.6139911, -0.7412352, 1, 1, 1, 1, 1,
-0.01102194, -0.6000003, -2.684515, 1, 1, 1, 1, 1,
-0.01087509, -1.310708, -2.213652, 1, 1, 1, 1, 1,
-0.007705287, 0.1350857, -1.580182, 1, 1, 1, 1, 1,
-0.005489772, 0.2696771, 0.9952045, 1, 1, 1, 1, 1,
-0.004931675, -2.04553, -4.379875, 1, 1, 1, 1, 1,
-0.001541366, -1.199171, -3.804865, 1, 1, 1, 1, 1,
0.002225683, 0.600799, 0.9626448, 1, 1, 1, 1, 1,
0.006450082, 0.3090578, -0.1836055, 1, 1, 1, 1, 1,
0.006926141, -0.6326658, 3.528989, 1, 1, 1, 1, 1,
0.007797214, -1.418367, 1.001694, 1, 1, 1, 1, 1,
0.009889142, 0.4632698, -1.012034, 1, 1, 1, 1, 1,
0.01477954, -2.047539, 1.248091, 1, 1, 1, 1, 1,
0.01902216, 0.5351408, -0.7817615, 1, 1, 1, 1, 1,
0.02046312, 1.219851, 0.1400308, 1, 1, 1, 1, 1,
0.03157481, 0.07053396, -0.2287305, 0, 0, 1, 1, 1,
0.03240983, -1.376611, 4.632212, 1, 0, 0, 1, 1,
0.03542128, -1.192412, 2.046429, 1, 0, 0, 1, 1,
0.03614441, 1.577423, 1.839014, 1, 0, 0, 1, 1,
0.03953543, 0.04112947, 0.1541627, 1, 0, 0, 1, 1,
0.04486449, -0.8395007, 2.724344, 1, 0, 0, 1, 1,
0.04884956, -1.880483, 2.621995, 0, 0, 0, 1, 1,
0.04976925, 0.9699679, 0.9296724, 0, 0, 0, 1, 1,
0.05752865, 1.220931, 0.6778919, 0, 0, 0, 1, 1,
0.05765254, -0.3237988, 3.49967, 0, 0, 0, 1, 1,
0.05827736, 1.87502, -1.260168, 0, 0, 0, 1, 1,
0.06090274, -0.3632567, 4.477591, 0, 0, 0, 1, 1,
0.06255638, 0.4042928, -1.382704, 0, 0, 0, 1, 1,
0.06684224, -0.430143, 3.574312, 1, 1, 1, 1, 1,
0.0685856, 1.544983, -2.759627, 1, 1, 1, 1, 1,
0.06909474, 0.06511419, 0.0498139, 1, 1, 1, 1, 1,
0.07083419, -1.113422, 4.281977, 1, 1, 1, 1, 1,
0.07086613, -1.004446, 2.691385, 1, 1, 1, 1, 1,
0.07511741, 0.2284983, 1.077554, 1, 1, 1, 1, 1,
0.07778136, 0.2854591, 0.3870647, 1, 1, 1, 1, 1,
0.07793369, 0.6456569, 1.969103, 1, 1, 1, 1, 1,
0.07843527, 0.07851151, -0.1155039, 1, 1, 1, 1, 1,
0.08115847, 1.782846, -0.3562558, 1, 1, 1, 1, 1,
0.08375623, 1.741145, -0.3844231, 1, 1, 1, 1, 1,
0.08565159, -0.9143703, 4.296475, 1, 1, 1, 1, 1,
0.08606862, -1.601354, 3.538406, 1, 1, 1, 1, 1,
0.0871997, 0.5550054, 2.020492, 1, 1, 1, 1, 1,
0.09092355, 0.6431844, -0.845463, 1, 1, 1, 1, 1,
0.09263533, 0.6840444, -0.3247942, 0, 0, 1, 1, 1,
0.09451803, -1.680932, 2.414547, 1, 0, 0, 1, 1,
0.09648772, 0.756687, -0.1972638, 1, 0, 0, 1, 1,
0.09663663, 1.959952, -1.021296, 1, 0, 0, 1, 1,
0.09895959, -0.7034603, 2.400755, 1, 0, 0, 1, 1,
0.09927448, 1.459139, 0.4474331, 1, 0, 0, 1, 1,
0.1001348, 0.6522237, -0.67273, 0, 0, 0, 1, 1,
0.1045299, 0.6242983, -0.4206664, 0, 0, 0, 1, 1,
0.1059392, -1.268848, 3.09823, 0, 0, 0, 1, 1,
0.1072004, -1.807752, 1.873456, 0, 0, 0, 1, 1,
0.1125431, 0.2977741, 1.390976, 0, 0, 0, 1, 1,
0.1198673, 0.6601353, 0.3894507, 0, 0, 0, 1, 1,
0.1208805, -0.7865902, 2.810775, 0, 0, 0, 1, 1,
0.1238157, 0.08505477, 0.8085495, 1, 1, 1, 1, 1,
0.1257423, 0.4671498, -0.4818857, 1, 1, 1, 1, 1,
0.1309052, -0.5329851, 1.249128, 1, 1, 1, 1, 1,
0.1316918, -2.494668, 2.145924, 1, 1, 1, 1, 1,
0.1351423, -0.6923196, 3.63304, 1, 1, 1, 1, 1,
0.1377624, 0.560742, 1.583162, 1, 1, 1, 1, 1,
0.1389274, -0.361225, 1.981546, 1, 1, 1, 1, 1,
0.1459862, -0.5204433, 4.250398, 1, 1, 1, 1, 1,
0.1481074, 0.7531528, -0.3936774, 1, 1, 1, 1, 1,
0.149466, -2.271898, 1.033879, 1, 1, 1, 1, 1,
0.1495838, -0.0145627, 1.070581, 1, 1, 1, 1, 1,
0.15205, -1.183427, 2.459431, 1, 1, 1, 1, 1,
0.1532788, -1.138702, 2.434982, 1, 1, 1, 1, 1,
0.1541934, 0.5025539, 1.944745, 1, 1, 1, 1, 1,
0.1549162, -0.3156983, 1.923169, 1, 1, 1, 1, 1,
0.1556589, 0.7525663, 1.458807, 0, 0, 1, 1, 1,
0.1559593, -0.3503832, 2.803601, 1, 0, 0, 1, 1,
0.1566795, 0.7111384, -0.5204812, 1, 0, 0, 1, 1,
0.1571939, 1.043576, 0.2724085, 1, 0, 0, 1, 1,
0.1595913, 0.09100286, 0.9221963, 1, 0, 0, 1, 1,
0.1627033, 0.7858054, -0.5537012, 1, 0, 0, 1, 1,
0.1631767, 0.01957098, 1.824134, 0, 0, 0, 1, 1,
0.1662806, 0.8467324, -1.559298, 0, 0, 0, 1, 1,
0.1674154, 0.2582579, 1.533994, 0, 0, 0, 1, 1,
0.1696557, 0.8840564, 0.2252444, 0, 0, 0, 1, 1,
0.1712768, -0.01503572, 1.052107, 0, 0, 0, 1, 1,
0.1714509, 1.727002, 0.1986046, 0, 0, 0, 1, 1,
0.1746572, 0.6991143, -0.7735496, 0, 0, 0, 1, 1,
0.1808827, -0.2292105, 1.332761, 1, 1, 1, 1, 1,
0.1809518, -0.8457006, 3.051615, 1, 1, 1, 1, 1,
0.1839705, 0.2580474, 0.2176462, 1, 1, 1, 1, 1,
0.1874211, -0.2333898, 2.070459, 1, 1, 1, 1, 1,
0.1879611, 1.810446, 0.421847, 1, 1, 1, 1, 1,
0.1880676, 0.4578437, 1.990803, 1, 1, 1, 1, 1,
0.1895964, 0.02403584, 2.133419, 1, 1, 1, 1, 1,
0.1911169, -0.9586762, 4.021264, 1, 1, 1, 1, 1,
0.1933162, 0.3272648, 0.7375121, 1, 1, 1, 1, 1,
0.199719, 0.2526858, 0.8602551, 1, 1, 1, 1, 1,
0.2045566, 0.03423988, 0.2632414, 1, 1, 1, 1, 1,
0.2047864, -0.9784248, 3.469888, 1, 1, 1, 1, 1,
0.2086063, 0.128967, -0.7397202, 1, 1, 1, 1, 1,
0.2102562, 1.295016, 0.5248637, 1, 1, 1, 1, 1,
0.2145599, -0.2669823, 1.994694, 1, 1, 1, 1, 1,
0.2147948, -0.671849, 2.896048, 0, 0, 1, 1, 1,
0.2246842, -0.02100624, 3.315596, 1, 0, 0, 1, 1,
0.2257903, 0.03752063, 0.5610558, 1, 0, 0, 1, 1,
0.2271338, 0.02864068, 1.689634, 1, 0, 0, 1, 1,
0.227648, -0.6637627, 2.141217, 1, 0, 0, 1, 1,
0.2307345, 0.2551593, -0.8893695, 1, 0, 0, 1, 1,
0.2405913, -0.3000239, 3.850459, 0, 0, 0, 1, 1,
0.2418092, -0.02590196, 1.343524, 0, 0, 0, 1, 1,
0.2422579, -0.7059831, 3.170547, 0, 0, 0, 1, 1,
0.2425652, -0.7350715, 2.583951, 0, 0, 0, 1, 1,
0.2450505, -1.070217, 4.087376, 0, 0, 0, 1, 1,
0.2451838, -1.706209, 0.8395275, 0, 0, 0, 1, 1,
0.2461803, 1.151558, -1.336245, 0, 0, 0, 1, 1,
0.2487911, 0.5439829, 0.4387061, 1, 1, 1, 1, 1,
0.2490315, 1.873513, -0.8069411, 1, 1, 1, 1, 1,
0.2498448, -2.203635, 4.431388, 1, 1, 1, 1, 1,
0.2566199, 0.5941859, 0.9965208, 1, 1, 1, 1, 1,
0.26048, -0.935823, 2.72558, 1, 1, 1, 1, 1,
0.2605031, 0.300033, 0.2274738, 1, 1, 1, 1, 1,
0.2608964, -0.2580304, 0.7260724, 1, 1, 1, 1, 1,
0.2633052, -2.45255, 4.376129, 1, 1, 1, 1, 1,
0.2634771, 0.8038617, -0.05698081, 1, 1, 1, 1, 1,
0.2676945, -0.05642996, 0.6553972, 1, 1, 1, 1, 1,
0.2694225, -1.008056, 4.048226, 1, 1, 1, 1, 1,
0.2719851, -1.036609, 2.844589, 1, 1, 1, 1, 1,
0.2755206, 1.21946, 0.8304271, 1, 1, 1, 1, 1,
0.275551, 1.358235, 0.6411784, 1, 1, 1, 1, 1,
0.276122, 0.001185508, 1.08167, 1, 1, 1, 1, 1,
0.2762033, 0.8910052, 0.9165809, 0, 0, 1, 1, 1,
0.2810078, -0.9752207, 3.003263, 1, 0, 0, 1, 1,
0.2837031, -1.6531, 4.896907, 1, 0, 0, 1, 1,
0.2851103, 0.5542546, 0.7659842, 1, 0, 0, 1, 1,
0.2859996, -0.08940724, 3.549405, 1, 0, 0, 1, 1,
0.2911229, 0.5358449, 1.299876, 1, 0, 0, 1, 1,
0.292179, -1.499753, 3.119786, 0, 0, 0, 1, 1,
0.2923433, 0.0309535, 1.291795, 0, 0, 0, 1, 1,
0.2990557, -0.15681, 2.281585, 0, 0, 0, 1, 1,
0.3060728, 0.4502726, 1.76563, 0, 0, 0, 1, 1,
0.3066552, -0.2323319, 2.183215, 0, 0, 0, 1, 1,
0.3090184, 0.6791948, -0.2128474, 0, 0, 0, 1, 1,
0.3194881, 0.2682494, 0.6561713, 0, 0, 0, 1, 1,
0.3230686, -0.4601525, 1.113087, 1, 1, 1, 1, 1,
0.3260094, -0.7947176, 1.833947, 1, 1, 1, 1, 1,
0.3261208, 0.2704687, 0.6800863, 1, 1, 1, 1, 1,
0.3307072, -1.162912, 1.861434, 1, 1, 1, 1, 1,
0.3312663, 0.6733599, 1.910237, 1, 1, 1, 1, 1,
0.3339357, -0.4709725, 1.734792, 1, 1, 1, 1, 1,
0.3363667, -0.7711638, 2.067987, 1, 1, 1, 1, 1,
0.3382066, 0.7233558, -0.2681666, 1, 1, 1, 1, 1,
0.3408658, -0.6432669, 3.103584, 1, 1, 1, 1, 1,
0.3454078, -0.2679209, 2.159764, 1, 1, 1, 1, 1,
0.3467572, -0.5258016, 4.04857, 1, 1, 1, 1, 1,
0.3490559, 0.5799129, -1.188391, 1, 1, 1, 1, 1,
0.3513109, -0.3492753, 2.142353, 1, 1, 1, 1, 1,
0.3521597, -0.01434454, 0.9039915, 1, 1, 1, 1, 1,
0.3528033, -1.159053, 3.099493, 1, 1, 1, 1, 1,
0.3528611, 0.08298801, 2.44427, 0, 0, 1, 1, 1,
0.3537015, -1.798292, 3.291819, 1, 0, 0, 1, 1,
0.358046, 0.9367514, -0.311754, 1, 0, 0, 1, 1,
0.3590865, -0.9020839, 3.522563, 1, 0, 0, 1, 1,
0.3674941, 0.285874, 0.9209784, 1, 0, 0, 1, 1,
0.3709762, 1.236195, 1.940189, 1, 0, 0, 1, 1,
0.3724928, -1.039091, 3.49314, 0, 0, 0, 1, 1,
0.3743733, 1.284511, 0.0251252, 0, 0, 0, 1, 1,
0.3756863, -0.1255282, 1.76377, 0, 0, 0, 1, 1,
0.3768882, -1.678338, 1.972991, 0, 0, 0, 1, 1,
0.3811663, 0.2463871, 2.149204, 0, 0, 0, 1, 1,
0.3816769, 0.2029859, 1.48337, 0, 0, 0, 1, 1,
0.3848391, 1.600706, -1.482926, 0, 0, 0, 1, 1,
0.3903886, -2.22554, 2.365917, 1, 1, 1, 1, 1,
0.3923036, 0.08723805, 1.620589, 1, 1, 1, 1, 1,
0.3926846, 1.354596, 0.6577809, 1, 1, 1, 1, 1,
0.3932785, 0.2471706, 2.845201, 1, 1, 1, 1, 1,
0.3935944, 0.8633965, -0.08321071, 1, 1, 1, 1, 1,
0.4013687, 0.4784946, 0.1197101, 1, 1, 1, 1, 1,
0.402256, -0.07484774, 2.842856, 1, 1, 1, 1, 1,
0.404045, 0.3821996, 1.967685, 1, 1, 1, 1, 1,
0.4078945, 0.5727407, -0.1686213, 1, 1, 1, 1, 1,
0.4095762, -1.5773, 3.25387, 1, 1, 1, 1, 1,
0.4096894, -0.4116893, 2.571771, 1, 1, 1, 1, 1,
0.4100514, -0.05763661, 1.244705, 1, 1, 1, 1, 1,
0.4105571, -0.8847972, 2.196491, 1, 1, 1, 1, 1,
0.4139356, -1.143169, 3.233914, 1, 1, 1, 1, 1,
0.4172679, -0.714352, 2.585816, 1, 1, 1, 1, 1,
0.4189836, 0.7100805, -0.3680459, 0, 0, 1, 1, 1,
0.4195887, 0.9084865, -1.285585, 1, 0, 0, 1, 1,
0.4217976, 0.6591617, 0.3825968, 1, 0, 0, 1, 1,
0.4222674, -0.5514135, 1.945766, 1, 0, 0, 1, 1,
0.424704, 0.663944, -0.0252997, 1, 0, 0, 1, 1,
0.4279357, 0.7094548, 0.4363312, 1, 0, 0, 1, 1,
0.4280021, 0.9761918, 2.439026, 0, 0, 0, 1, 1,
0.4281819, 1.422212, 1.298739, 0, 0, 0, 1, 1,
0.4302565, -0.87095, 2.702262, 0, 0, 0, 1, 1,
0.4341373, 0.4610873, 0.9663329, 0, 0, 0, 1, 1,
0.436613, -1.654228, 3.662007, 0, 0, 0, 1, 1,
0.4385902, -0.3562353, 0.9195103, 0, 0, 0, 1, 1,
0.4393142, 1.055016, 0.2318332, 0, 0, 0, 1, 1,
0.4401226, -0.4386869, 1.759178, 1, 1, 1, 1, 1,
0.4429114, 0.1066511, 1.068541, 1, 1, 1, 1, 1,
0.4481568, -0.02418613, 3.266963, 1, 1, 1, 1, 1,
0.4536449, 0.06017879, 1.826413, 1, 1, 1, 1, 1,
0.4540422, -0.1452021, 2.940515, 1, 1, 1, 1, 1,
0.4572657, 0.945076, 0.4065814, 1, 1, 1, 1, 1,
0.4582322, -0.5053667, 3.274618, 1, 1, 1, 1, 1,
0.467314, 0.9451554, 0.4932024, 1, 1, 1, 1, 1,
0.468547, -0.6116248, 2.725836, 1, 1, 1, 1, 1,
0.4701323, 0.1730777, 0.842061, 1, 1, 1, 1, 1,
0.4721977, -0.9441173, 0.1611362, 1, 1, 1, 1, 1,
0.4781651, 0.7211876, 1.941755, 1, 1, 1, 1, 1,
0.4801084, -0.1938736, 1.965529, 1, 1, 1, 1, 1,
0.4829151, -1.041389, 2.818089, 1, 1, 1, 1, 1,
0.4939689, 0.7274817, -0.04488932, 1, 1, 1, 1, 1,
0.4947642, -0.9709664, 2.401585, 0, 0, 1, 1, 1,
0.4953015, 1.449342, 0.6324173, 1, 0, 0, 1, 1,
0.4965541, -0.7111837, 1.206231, 1, 0, 0, 1, 1,
0.4980269, -0.3487646, 3.511342, 1, 0, 0, 1, 1,
0.4987234, -0.4966917, 1.203133, 1, 0, 0, 1, 1,
0.5013071, 0.7588172, 0.986745, 1, 0, 0, 1, 1,
0.5023224, 2.033048, -0.9371918, 0, 0, 0, 1, 1,
0.5061475, 0.9881986, 1.007222, 0, 0, 0, 1, 1,
0.5109777, -0.2770147, 3.301182, 0, 0, 0, 1, 1,
0.5150956, 1.002678, 0.8855665, 0, 0, 0, 1, 1,
0.5163721, -0.04849704, 1.512218, 0, 0, 0, 1, 1,
0.5163789, 2.013063, -0.425528, 0, 0, 0, 1, 1,
0.5173258, -1.598323, 3.247847, 0, 0, 0, 1, 1,
0.519482, -0.4705502, 2.199781, 1, 1, 1, 1, 1,
0.5204126, -0.5773326, 2.814114, 1, 1, 1, 1, 1,
0.5218438, -0.05069887, -0.9707425, 1, 1, 1, 1, 1,
0.521848, 0.9042506, 0.5027335, 1, 1, 1, 1, 1,
0.533839, 1.199272, 1.393881, 1, 1, 1, 1, 1,
0.5353994, -0.002903299, 2.155315, 1, 1, 1, 1, 1,
0.5374828, -0.329522, 2.203656, 1, 1, 1, 1, 1,
0.5398084, -1.205942, 2.870981, 1, 1, 1, 1, 1,
0.548535, -1.1466, 3.22671, 1, 1, 1, 1, 1,
0.5518492, -0.005351814, 1.586193, 1, 1, 1, 1, 1,
0.555186, 0.1190889, 0.8831133, 1, 1, 1, 1, 1,
0.5552817, -0.8663431, 1.895212, 1, 1, 1, 1, 1,
0.5574707, -0.3052118, 3.550923, 1, 1, 1, 1, 1,
0.5582913, 1.136459, 0.1729347, 1, 1, 1, 1, 1,
0.5607479, -0.02085246, 1.893581, 1, 1, 1, 1, 1,
0.5613765, -0.2851656, 3.050017, 0, 0, 1, 1, 1,
0.5622332, -2.396382, 2.738094, 1, 0, 0, 1, 1,
0.5662342, 0.02884756, 1.771495, 1, 0, 0, 1, 1,
0.5687562, -0.3079465, 3.50677, 1, 0, 0, 1, 1,
0.5711992, 0.08925617, 2.594812, 1, 0, 0, 1, 1,
0.5734666, 1.138791, 1.332462, 1, 0, 0, 1, 1,
0.575756, -0.3235594, 2.243995, 0, 0, 0, 1, 1,
0.5805348, 1.730783, 1.769324, 0, 0, 0, 1, 1,
0.5810027, -1.19685, 1.508738, 0, 0, 0, 1, 1,
0.581639, 0.2481422, 0.680135, 0, 0, 0, 1, 1,
0.5859308, 0.7461599, 0.8379504, 0, 0, 0, 1, 1,
0.586644, 2.200331, -1.051863, 0, 0, 0, 1, 1,
0.587919, -1.334746, 3.320795, 0, 0, 0, 1, 1,
0.5945914, 1.992013, -2.055293, 1, 1, 1, 1, 1,
0.5992208, -0.6332462, 1.873065, 1, 1, 1, 1, 1,
0.6009011, 0.2053195, 1.907695, 1, 1, 1, 1, 1,
0.6016564, 0.7227468, -0.2373904, 1, 1, 1, 1, 1,
0.6031203, 0.699197, 0.4676687, 1, 1, 1, 1, 1,
0.6032974, -0.09294482, 0.9488161, 1, 1, 1, 1, 1,
0.6086023, -2.045602, 3.58106, 1, 1, 1, 1, 1,
0.6106063, -1.413733, 1.103159, 1, 1, 1, 1, 1,
0.6211549, -0.7562611, 4.602854, 1, 1, 1, 1, 1,
0.6327189, 0.2082378, 1.396741, 1, 1, 1, 1, 1,
0.6378955, 0.8618683, -0.1998946, 1, 1, 1, 1, 1,
0.6459869, 1.69647, 0.2522634, 1, 1, 1, 1, 1,
0.6539168, -0.7773197, 2.775474, 1, 1, 1, 1, 1,
0.6541859, -0.9177357, 3.055641, 1, 1, 1, 1, 1,
0.6576895, 0.1344199, 0.7596896, 1, 1, 1, 1, 1,
0.6595026, -0.02448536, 2.458344, 0, 0, 1, 1, 1,
0.6626442, 0.433639, 0.840646, 1, 0, 0, 1, 1,
0.6639178, 0.1891564, -0.1221896, 1, 0, 0, 1, 1,
0.6707031, 1.595046, -0.2535495, 1, 0, 0, 1, 1,
0.6711569, 0.2352737, 0.2452869, 1, 0, 0, 1, 1,
0.6727816, -0.338008, 2.384742, 1, 0, 0, 1, 1,
0.6794763, 0.4542286, 1.032492, 0, 0, 0, 1, 1,
0.6820296, 0.2478716, -0.1698334, 0, 0, 0, 1, 1,
0.6826705, 0.8166581, 1.746216, 0, 0, 0, 1, 1,
0.687521, -0.03489456, -0.3597814, 0, 0, 0, 1, 1,
0.688754, -0.7627397, 1.497214, 0, 0, 0, 1, 1,
0.6889135, 1.498618, 0.006772759, 0, 0, 0, 1, 1,
0.6952571, -0.8834375, 2.143586, 0, 0, 0, 1, 1,
0.7028331, 0.2436891, 0.8357512, 1, 1, 1, 1, 1,
0.7041412, -0.2750989, 2.292955, 1, 1, 1, 1, 1,
0.7066008, 1.68378, -0.4381818, 1, 1, 1, 1, 1,
0.7125295, 1.474548, 0.423079, 1, 1, 1, 1, 1,
0.7270687, -0.1494013, 1.79268, 1, 1, 1, 1, 1,
0.7316496, 1.783158, -0.5312398, 1, 1, 1, 1, 1,
0.7331172, -1.536558, 4.178508, 1, 1, 1, 1, 1,
0.7336314, 0.1116562, 0.9532155, 1, 1, 1, 1, 1,
0.7378486, 0.6806057, 1.619052, 1, 1, 1, 1, 1,
0.7410749, 0.1813139, 1.604354, 1, 1, 1, 1, 1,
0.7485816, -1.301806, 3.122708, 1, 1, 1, 1, 1,
0.7564954, 0.97356, 0.8856289, 1, 1, 1, 1, 1,
0.7668434, -1.604505, 1.875269, 1, 1, 1, 1, 1,
0.7803354, -0.5465257, 0.3830213, 1, 1, 1, 1, 1,
0.7808226, -1.511826, 2.550759, 1, 1, 1, 1, 1,
0.7847059, -0.1157949, 1.769157, 0, 0, 1, 1, 1,
0.7882636, 0.4263494, 0.6608228, 1, 0, 0, 1, 1,
0.7958068, -1.007987, -0.3350523, 1, 0, 0, 1, 1,
0.7975492, -0.701475, 4.274355, 1, 0, 0, 1, 1,
0.8007731, 0.207595, 1.264107, 1, 0, 0, 1, 1,
0.8051518, 0.110999, 1.97022, 1, 0, 0, 1, 1,
0.8072013, -1.453022, 2.038579, 0, 0, 0, 1, 1,
0.8164737, -0.3972803, 2.060216, 0, 0, 0, 1, 1,
0.8199007, -0.4926105, 0.9419883, 0, 0, 0, 1, 1,
0.8225081, 0.9040668, 0.6275278, 0, 0, 0, 1, 1,
0.823139, -0.2649604, 0.4839768, 0, 0, 0, 1, 1,
0.8234902, -2.152337, 3.215035, 0, 0, 0, 1, 1,
0.834942, 0.6774751, 2.019186, 0, 0, 0, 1, 1,
0.8391104, 2.146703, 0.7957103, 1, 1, 1, 1, 1,
0.8395486, -0.6271046, 2.417367, 1, 1, 1, 1, 1,
0.8496076, -0.7402291, 1.759416, 1, 1, 1, 1, 1,
0.8536786, -0.1076523, 1.778394, 1, 1, 1, 1, 1,
0.8593542, 0.7966337, 1.007516, 1, 1, 1, 1, 1,
0.8744789, -0.9735888, 1.600879, 1, 1, 1, 1, 1,
0.8755937, 0.5168425, 2.575009, 1, 1, 1, 1, 1,
0.8773814, 1.441249, -0.6568611, 1, 1, 1, 1, 1,
0.8796538, 0.6575645, 2.410405, 1, 1, 1, 1, 1,
0.8797075, 0.9229973, 0.4684628, 1, 1, 1, 1, 1,
0.8798118, 0.2183027, 1.441866, 1, 1, 1, 1, 1,
0.8812408, 0.7299935, -0.1266515, 1, 1, 1, 1, 1,
0.8844145, -1.735691, 3.122415, 1, 1, 1, 1, 1,
0.8882362, -0.03839091, 2.572554, 1, 1, 1, 1, 1,
0.8895234, -1.377433, 3.040571, 1, 1, 1, 1, 1,
0.8898917, -0.6496167, 3.721219, 0, 0, 1, 1, 1,
0.8923446, -1.075395, 1.964093, 1, 0, 0, 1, 1,
0.8934025, -0.4090344, 2.495965, 1, 0, 0, 1, 1,
0.896977, 0.5008268, 1.564776, 1, 0, 0, 1, 1,
0.8986064, -1.583941, 3.662856, 1, 0, 0, 1, 1,
0.9029901, -0.1340112, 2.454323, 1, 0, 0, 1, 1,
0.9055297, 1.14113, -0.5083925, 0, 0, 0, 1, 1,
0.9068497, 0.520928, 2.408632, 0, 0, 0, 1, 1,
0.914472, -0.6094162, 3.466928, 0, 0, 0, 1, 1,
0.917216, -0.4772019, 3.635568, 0, 0, 0, 1, 1,
0.9175286, 0.6018376, 1.989596, 0, 0, 0, 1, 1,
0.9192758, -0.9324726, 1.54754, 0, 0, 0, 1, 1,
0.9240615, -0.3541854, 0.5834945, 0, 0, 0, 1, 1,
0.9263362, -0.5039513, 2.152187, 1, 1, 1, 1, 1,
0.9269491, 1.478522, 1.405185, 1, 1, 1, 1, 1,
0.928324, 0.1111911, 2.51112, 1, 1, 1, 1, 1,
0.9297364, 0.5321752, 2.643955, 1, 1, 1, 1, 1,
0.930194, 2.038407, -0.1682341, 1, 1, 1, 1, 1,
0.9315062, 0.7973137, 0.1372156, 1, 1, 1, 1, 1,
0.9325343, -0.07517464, 0.4100109, 1, 1, 1, 1, 1,
0.9352367, -1.067876, 2.623986, 1, 1, 1, 1, 1,
0.9384116, 0.1952091, 1.46297, 1, 1, 1, 1, 1,
0.9395544, 0.8933022, 0.9886652, 1, 1, 1, 1, 1,
0.9403613, -0.7785416, 2.861204, 1, 1, 1, 1, 1,
0.9404196, -0.2218728, 1.173909, 1, 1, 1, 1, 1,
0.9459682, -0.4471243, 2.348506, 1, 1, 1, 1, 1,
0.948843, -0.8839943, 1.986559, 1, 1, 1, 1, 1,
0.9505906, 1.558949, 0.7406729, 1, 1, 1, 1, 1,
0.9593074, 0.4770329, 2.155294, 0, 0, 1, 1, 1,
0.9647468, -0.5082003, 2.883323, 1, 0, 0, 1, 1,
0.9664093, 1.095609, 0.9501684, 1, 0, 0, 1, 1,
0.9741847, 0.1114153, 2.290697, 1, 0, 0, 1, 1,
0.9785414, -0.4370829, 1.405642, 1, 0, 0, 1, 1,
0.9790419, 1.223232, -0.5983086, 1, 0, 0, 1, 1,
0.9805656, -0.5732723, 2.168815, 0, 0, 0, 1, 1,
0.9806165, 0.1533729, 1.313128, 0, 0, 0, 1, 1,
0.9867581, -1.231865, 1.805428, 0, 0, 0, 1, 1,
0.9938052, 1.075391, 1.236939, 0, 0, 0, 1, 1,
0.9942993, 1.034165, 0.3085025, 0, 0, 0, 1, 1,
0.9968454, -0.621909, 1.159714, 0, 0, 0, 1, 1,
1.007292, -0.7927226, 2.395858, 0, 0, 0, 1, 1,
1.016622, 1.455168, 0.08362437, 1, 1, 1, 1, 1,
1.020763, -0.06031436, 2.246022, 1, 1, 1, 1, 1,
1.025468, -1.178792, 2.446202, 1, 1, 1, 1, 1,
1.027039, -1.503693, 3.404469, 1, 1, 1, 1, 1,
1.028592, 0.9587457, 1.168108, 1, 1, 1, 1, 1,
1.034576, -1.671061, 1.83525, 1, 1, 1, 1, 1,
1.034748, 0.5344606, -0.5098285, 1, 1, 1, 1, 1,
1.037297, -0.3751812, 2.709709, 1, 1, 1, 1, 1,
1.039195, -1.323185, 1.385741, 1, 1, 1, 1, 1,
1.041106, -1.877524, 2.778363, 1, 1, 1, 1, 1,
1.041472, -0.7719875, 2.452281, 1, 1, 1, 1, 1,
1.045974, 0.573237, 1.78866, 1, 1, 1, 1, 1,
1.049726, -2.297576, 2.856889, 1, 1, 1, 1, 1,
1.050632, 0.6389733, 1.496605, 1, 1, 1, 1, 1,
1.054774, 0.8577131, 0.78719, 1, 1, 1, 1, 1,
1.056542, -1.278105, 1.432721, 0, 0, 1, 1, 1,
1.058078, 0.3971537, 0.9035403, 1, 0, 0, 1, 1,
1.059507, -1.697385, 3.170397, 1, 0, 0, 1, 1,
1.060468, 0.3197373, 2.434717, 1, 0, 0, 1, 1,
1.070199, -1.04768, 2.187158, 1, 0, 0, 1, 1,
1.07327, 3.209062, 2.08408, 1, 0, 0, 1, 1,
1.075172, -0.9352548, 2.091855, 0, 0, 0, 1, 1,
1.075362, 0.79063, 0.5580963, 0, 0, 0, 1, 1,
1.076225, -0.08287698, 0.2138964, 0, 0, 0, 1, 1,
1.077479, 0.640288, 2.131503, 0, 0, 0, 1, 1,
1.078059, -1.738544, 2.124345, 0, 0, 0, 1, 1,
1.082223, -1.09702, 3.009807, 0, 0, 0, 1, 1,
1.086279, 0.6379937, 1.392656, 0, 0, 0, 1, 1,
1.086648, -0.3660707, 3.844842, 1, 1, 1, 1, 1,
1.086865, 0.5501068, -0.8044744, 1, 1, 1, 1, 1,
1.090619, 0.7199645, 0.623776, 1, 1, 1, 1, 1,
1.096633, 0.9800769, 1.346437, 1, 1, 1, 1, 1,
1.102619, -1.12588, 2.408099, 1, 1, 1, 1, 1,
1.10796, -0.5730441, 1.957952, 1, 1, 1, 1, 1,
1.109544, 0.6509286, -0.8775231, 1, 1, 1, 1, 1,
1.115916, -0.4617492, 1.614085, 1, 1, 1, 1, 1,
1.116843, 1.505103, -1.311982, 1, 1, 1, 1, 1,
1.124121, 0.5455412, -0.325777, 1, 1, 1, 1, 1,
1.134824, 0.2354133, 0.5062584, 1, 1, 1, 1, 1,
1.140315, -0.537797, -0.2888121, 1, 1, 1, 1, 1,
1.158651, -1.007058, -0.1617995, 1, 1, 1, 1, 1,
1.171095, 2.540854, 2.522284, 1, 1, 1, 1, 1,
1.17821, 0.1102148, 0.09767815, 1, 1, 1, 1, 1,
1.180536, 1.951025, -0.002563275, 0, 0, 1, 1, 1,
1.183415, 0.7551274, 1.391788, 1, 0, 0, 1, 1,
1.186033, -0.8411368, 3.363921, 1, 0, 0, 1, 1,
1.186898, -0.04461568, 2.471154, 1, 0, 0, 1, 1,
1.199242, -0.00859818, 0.9187394, 1, 0, 0, 1, 1,
1.207098, 1.874067, 2.086973, 1, 0, 0, 1, 1,
1.20877, 0.1583097, 0.4894651, 0, 0, 0, 1, 1,
1.219331, 0.2757293, 1.435324, 0, 0, 0, 1, 1,
1.223181, -0.02284919, 2.336706, 0, 0, 0, 1, 1,
1.224707, 0.1040968, 0.3743576, 0, 0, 0, 1, 1,
1.231743, 0.4305383, 2.995251, 0, 0, 0, 1, 1,
1.233861, 0.8185436, 0.7418188, 0, 0, 0, 1, 1,
1.233983, -0.07181639, 0.07000748, 0, 0, 0, 1, 1,
1.236683, -1.310793, 3.962392, 1, 1, 1, 1, 1,
1.238693, -0.8040331, 1.188239, 1, 1, 1, 1, 1,
1.242048, -1.575201, 2.821218, 1, 1, 1, 1, 1,
1.245101, 0.3979309, 2.702426, 1, 1, 1, 1, 1,
1.259282, -0.1294386, 1.549439, 1, 1, 1, 1, 1,
1.261572, -1.110941, 2.488369, 1, 1, 1, 1, 1,
1.262361, 1.452305, 1.564582, 1, 1, 1, 1, 1,
1.271562, -1.504073, 0.5689332, 1, 1, 1, 1, 1,
1.272584, 0.6188397, 1.526177, 1, 1, 1, 1, 1,
1.281225, 0.06004072, 2.994114, 1, 1, 1, 1, 1,
1.289676, 0.09160699, 0.4227673, 1, 1, 1, 1, 1,
1.292204, 0.7450301, -0.3677317, 1, 1, 1, 1, 1,
1.295517, -0.1211958, 3.241842, 1, 1, 1, 1, 1,
1.295533, -1.774096, 2.393875, 1, 1, 1, 1, 1,
1.312861, 2.156381, 0.6116965, 1, 1, 1, 1, 1,
1.314638, -1.870927, 2.440771, 0, 0, 1, 1, 1,
1.315201, -0.2990693, 2.349196, 1, 0, 0, 1, 1,
1.315244, 0.7346487, 0.5616271, 1, 0, 0, 1, 1,
1.323832, -1.579601, 1.963739, 1, 0, 0, 1, 1,
1.325733, -0.3987873, 2.93177, 1, 0, 0, 1, 1,
1.330921, -0.3671161, 2.001263, 1, 0, 0, 1, 1,
1.355789, -0.986036, 2.510213, 0, 0, 0, 1, 1,
1.356743, 1.146338, 1.596265, 0, 0, 0, 1, 1,
1.363927, -0.08437186, 2.230203, 0, 0, 0, 1, 1,
1.373211, 0.756417, 0.6842285, 0, 0, 0, 1, 1,
1.374084, -0.1815536, 2.697395, 0, 0, 0, 1, 1,
1.378592, 0.5359439, 1.674861, 0, 0, 0, 1, 1,
1.38096, 0.2388244, 2.263705, 0, 0, 0, 1, 1,
1.381144, -1.103204, 2.663239, 1, 1, 1, 1, 1,
1.381529, -0.5074132, 2.338897, 1, 1, 1, 1, 1,
1.382457, -0.09673055, 2.015227, 1, 1, 1, 1, 1,
1.384007, -0.9700502, 0.9237099, 1, 1, 1, 1, 1,
1.392314, 0.1480737, 1.66314, 1, 1, 1, 1, 1,
1.399131, -2.698441, 3.175373, 1, 1, 1, 1, 1,
1.404157, -0.2428512, 2.833011, 1, 1, 1, 1, 1,
1.40893, 1.473723, 1.509964, 1, 1, 1, 1, 1,
1.411045, 0.6339036, 1.748832, 1, 1, 1, 1, 1,
1.417132, -0.2230337, 2.489912, 1, 1, 1, 1, 1,
1.437471, -1.37789, 1.904653, 1, 1, 1, 1, 1,
1.444886, -0.8341086, 3.189112, 1, 1, 1, 1, 1,
1.447317, -0.2171042, 3.113727, 1, 1, 1, 1, 1,
1.452943, 0.3450326, 1.761672, 1, 1, 1, 1, 1,
1.469374, 0.4195178, 1.534067, 1, 1, 1, 1, 1,
1.493319, -2.011394, 4.685891, 0, 0, 1, 1, 1,
1.509781, -1.401001, 3.996951, 1, 0, 0, 1, 1,
1.513292, 0.8492635, 1.368349, 1, 0, 0, 1, 1,
1.51653, 0.5205982, 2.208811, 1, 0, 0, 1, 1,
1.526194, 0.8495893, 1.051135, 1, 0, 0, 1, 1,
1.535448, 0.4896503, 1.681258, 1, 0, 0, 1, 1,
1.541469, 0.4276521, -0.5382041, 0, 0, 0, 1, 1,
1.558055, 0.2967515, 2.066324, 0, 0, 0, 1, 1,
1.559059, -0.4565141, 3.010421, 0, 0, 0, 1, 1,
1.561102, 2.565248, 1.206332, 0, 0, 0, 1, 1,
1.563835, -1.955678, 4.348456, 0, 0, 0, 1, 1,
1.564895, -1.86252, 4.912443, 0, 0, 0, 1, 1,
1.575499, 0.7804357, 1.090153, 0, 0, 0, 1, 1,
1.581655, 0.6466786, 0.5198396, 1, 1, 1, 1, 1,
1.585729, 0.49365, 0.7442474, 1, 1, 1, 1, 1,
1.587652, 0.07568216, 3.930723, 1, 1, 1, 1, 1,
1.595699, 0.7616021, 2.553163, 1, 1, 1, 1, 1,
1.598296, -1.056735, 2.577009, 1, 1, 1, 1, 1,
1.602687, 0.2944077, 0.1278082, 1, 1, 1, 1, 1,
1.604609, -0.04370978, 2.425252, 1, 1, 1, 1, 1,
1.606381, 0.60722, 2.268718, 1, 1, 1, 1, 1,
1.610013, 0.6136339, 1.417392, 1, 1, 1, 1, 1,
1.618156, 0.5323361, 1.308727, 1, 1, 1, 1, 1,
1.619648, 0.6474271, 1.713872, 1, 1, 1, 1, 1,
1.643995, 0.04000542, 2.61138, 1, 1, 1, 1, 1,
1.653694, 0.1327406, 2.504212, 1, 1, 1, 1, 1,
1.656835, -0.8079324, 0.001883634, 1, 1, 1, 1, 1,
1.656954, -0.4287839, 1.501991, 1, 1, 1, 1, 1,
1.684496, -0.06888248, 2.248006, 0, 0, 1, 1, 1,
1.697623, 1.79611, 3.155611, 1, 0, 0, 1, 1,
1.70367, -1.461356, 0.7646343, 1, 0, 0, 1, 1,
1.719093, -1.327082, 2.686049, 1, 0, 0, 1, 1,
1.721614, 0.004269595, 2.143732, 1, 0, 0, 1, 1,
1.730575, -0.2366161, 1.69468, 1, 0, 0, 1, 1,
1.733024, 2.125785, 0.6138226, 0, 0, 0, 1, 1,
1.752117, 0.6548752, 0.9205492, 0, 0, 0, 1, 1,
1.752664, 0.7220622, 2.019131, 0, 0, 0, 1, 1,
1.768761, -0.9351162, 1.708229, 0, 0, 0, 1, 1,
1.772992, -0.02801455, 1.507653, 0, 0, 0, 1, 1,
1.777909, -1.539831, 3.491376, 0, 0, 0, 1, 1,
1.779511, -0.5083988, 0.6639541, 0, 0, 0, 1, 1,
1.785439, 0.08391627, 1.493043, 1, 1, 1, 1, 1,
1.80455, -0.5553438, 1.871147, 1, 1, 1, 1, 1,
1.841048, 1.324067, 0.7632224, 1, 1, 1, 1, 1,
1.862983, -1.118722, 3.577726, 1, 1, 1, 1, 1,
1.893429, 0.4205327, 2.417756, 1, 1, 1, 1, 1,
1.91855, -0.861247, 3.888264, 1, 1, 1, 1, 1,
1.981468, 0.1532671, 1.07385, 1, 1, 1, 1, 1,
1.992818, 0.1603077, 2.3076, 1, 1, 1, 1, 1,
1.993076, 1.554084, 0.8385102, 1, 1, 1, 1, 1,
2.01743, -1.323784, 1.599979, 1, 1, 1, 1, 1,
2.044782, -0.5214971, 2.239643, 1, 1, 1, 1, 1,
2.051465, -0.8110406, 0.6506053, 1, 1, 1, 1, 1,
2.053216, -0.490292, 3.367448, 1, 1, 1, 1, 1,
2.058951, -0.7038308, 0.07647975, 1, 1, 1, 1, 1,
2.072779, 1.120263, 1.751304, 1, 1, 1, 1, 1,
2.12549, -1.073561, 0.04004896, 0, 0, 1, 1, 1,
2.138009, 0.8388259, 1.000224, 1, 0, 0, 1, 1,
2.142677, 0.3808863, 0.839815, 1, 0, 0, 1, 1,
2.164035, -0.8208017, 4.562504, 1, 0, 0, 1, 1,
2.165395, -0.3136109, 2.526945, 1, 0, 0, 1, 1,
2.16717, 0.04492174, 2.47205, 1, 0, 0, 1, 1,
2.20201, 0.7370961, 0.8979316, 0, 0, 0, 1, 1,
2.248015, -0.5626395, 2.9283, 0, 0, 0, 1, 1,
2.248595, 0.3529003, 0.8546153, 0, 0, 0, 1, 1,
2.271533, 0.0956405, 1.426622, 0, 0, 0, 1, 1,
2.285723, 2.364034, 0.914117, 0, 0, 0, 1, 1,
2.31751, 0.4520913, 3.141601, 0, 0, 0, 1, 1,
2.33145, -0.2776048, 1.837791, 0, 0, 0, 1, 1,
2.352059, 0.3220914, 1.51149, 1, 1, 1, 1, 1,
2.480781, 0.1826224, 1.229199, 1, 1, 1, 1, 1,
2.487479, -0.9229, 1.706758, 1, 1, 1, 1, 1,
2.612303, 1.128932, -0.6451048, 1, 1, 1, 1, 1,
2.754422, -1.323635, 2.440814, 1, 1, 1, 1, 1,
2.881207, 0.05510779, 2.605807, 1, 1, 1, 1, 1,
3.378632, 0.003562139, 2.062477, 1, 1, 1, 1, 1
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
var radius = 9.608378;
var distance = 33.74902;
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
mvMatrix.translate( 0.02627134, 0.08342242, 0.2899516 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.74902);
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
