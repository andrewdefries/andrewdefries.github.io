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
-3.10147, -1.316338, -0.6924291, 1, 0, 0, 1,
-2.876693, -0.5311034, -1.438813, 1, 0.007843138, 0, 1,
-2.779989, -1.677524, -3.141727, 1, 0.01176471, 0, 1,
-2.562278, -1.721768, -1.869651, 1, 0.01960784, 0, 1,
-2.526149, 0.0229784, -2.159607, 1, 0.02352941, 0, 1,
-2.514744, -1.201879, -1.700854, 1, 0.03137255, 0, 1,
-2.487051, 0.7362896, -1.092064, 1, 0.03529412, 0, 1,
-2.484182, -0.916662, -1.478187, 1, 0.04313726, 0, 1,
-2.431947, -0.4481306, -1.347639, 1, 0.04705882, 0, 1,
-2.41103, -0.3719107, -0.07024883, 1, 0.05490196, 0, 1,
-2.350461, -0.1525833, -2.840384, 1, 0.05882353, 0, 1,
-2.348604, -1.782792, -3.152568, 1, 0.06666667, 0, 1,
-2.311045, -0.07559261, -2.781625, 1, 0.07058824, 0, 1,
-2.308228, 1.203457, -0.1016866, 1, 0.07843138, 0, 1,
-2.288115, 0.5101979, -0.4946656, 1, 0.08235294, 0, 1,
-2.246539, -0.19018, -0.6037971, 1, 0.09019608, 0, 1,
-2.236687, 1.103159, -0.87362, 1, 0.09411765, 0, 1,
-2.22574, -0.3337469, -2.9106, 1, 0.1019608, 0, 1,
-2.188174, 0.1955827, -2.760347, 1, 0.1098039, 0, 1,
-2.171035, 0.3395333, -0.6191501, 1, 0.1137255, 0, 1,
-2.161445, -1.981836, -2.026397, 1, 0.1215686, 0, 1,
-2.139681, -0.2692866, -0.2996702, 1, 0.1254902, 0, 1,
-2.066975, -0.6702036, -1.746946, 1, 0.1333333, 0, 1,
-2.047531, 0.9556977, -0.1479557, 1, 0.1372549, 0, 1,
-2.040136, -0.3176821, -1.625503, 1, 0.145098, 0, 1,
-2.039613, 0.944854, -0.2842561, 1, 0.1490196, 0, 1,
-2.025915, -0.1000888, -1.497005, 1, 0.1568628, 0, 1,
-1.991763, 0.6769388, -2.44741, 1, 0.1607843, 0, 1,
-1.990384, 0.05676439, -1.951624, 1, 0.1686275, 0, 1,
-1.983276, -0.6054756, -1.708226, 1, 0.172549, 0, 1,
-1.97486, -0.8253434, -1.099655, 1, 0.1803922, 0, 1,
-1.955501, 0.6050356, -1.250926, 1, 0.1843137, 0, 1,
-1.939721, 0.4834777, 0.4412635, 1, 0.1921569, 0, 1,
-1.918845, -0.3008093, -0.683956, 1, 0.1960784, 0, 1,
-1.914124, 1.21541, -1.349997, 1, 0.2039216, 0, 1,
-1.897992, -0.4576272, -3.03322, 1, 0.2117647, 0, 1,
-1.88636, -0.9779316, -1.430167, 1, 0.2156863, 0, 1,
-1.857559, 0.9620457, -0.6004244, 1, 0.2235294, 0, 1,
-1.843872, 1.758838, -1.503708, 1, 0.227451, 0, 1,
-1.822999, 1.058178, -1.617869, 1, 0.2352941, 0, 1,
-1.821735, -2.729175, -3.261771, 1, 0.2392157, 0, 1,
-1.818036, 0.4562795, -2.746775, 1, 0.2470588, 0, 1,
-1.815776, 0.8495766, -0.7130172, 1, 0.2509804, 0, 1,
-1.805, 0.1920889, -1.899715, 1, 0.2588235, 0, 1,
-1.768032, -0.556308, -2.182486, 1, 0.2627451, 0, 1,
-1.763148, 0.3438407, -1.539732, 1, 0.2705882, 0, 1,
-1.75564, 0.2552962, -0.6947765, 1, 0.2745098, 0, 1,
-1.749434, 1.703847, 0.4942894, 1, 0.282353, 0, 1,
-1.745295, 2.125112, -0.2591659, 1, 0.2862745, 0, 1,
-1.728483, -0.988395, -2.360004, 1, 0.2941177, 0, 1,
-1.712967, 1.132117, -2.337121, 1, 0.3019608, 0, 1,
-1.709508, -0.01308624, -2.514047, 1, 0.3058824, 0, 1,
-1.67716, -0.1484599, -2.353471, 1, 0.3137255, 0, 1,
-1.667547, 1.112022, -1.199962, 1, 0.3176471, 0, 1,
-1.661915, 0.1835737, 0.8401909, 1, 0.3254902, 0, 1,
-1.653405, 0.2593066, -0.9971886, 1, 0.3294118, 0, 1,
-1.651467, 1.139486, -1.082724, 1, 0.3372549, 0, 1,
-1.646625, 1.044368, -1.747523, 1, 0.3411765, 0, 1,
-1.639094, 0.3535545, -2.752999, 1, 0.3490196, 0, 1,
-1.638926, -0.9667994, -1.136063, 1, 0.3529412, 0, 1,
-1.62923, -1.054418, -4.521418, 1, 0.3607843, 0, 1,
-1.619604, 0.01259729, -0.8933182, 1, 0.3647059, 0, 1,
-1.615234, 0.6581887, -0.9986081, 1, 0.372549, 0, 1,
-1.61423, -0.9764026, -1.728335, 1, 0.3764706, 0, 1,
-1.599636, -0.6376038, -0.8893908, 1, 0.3843137, 0, 1,
-1.597213, 0.9439495, -0.6879646, 1, 0.3882353, 0, 1,
-1.579006, -0.1123566, -0.4047652, 1, 0.3960784, 0, 1,
-1.571914, -0.8419465, -0.2093635, 1, 0.4039216, 0, 1,
-1.565403, 1.60128, 0.3218001, 1, 0.4078431, 0, 1,
-1.549318, 0.1610213, -1.003248, 1, 0.4156863, 0, 1,
-1.533141, 0.958755, -2.427702, 1, 0.4196078, 0, 1,
-1.531429, 1.344562, -1.937429, 1, 0.427451, 0, 1,
-1.511875, -1.462864, -2.948699, 1, 0.4313726, 0, 1,
-1.497337, 0.2867459, -1.183301, 1, 0.4392157, 0, 1,
-1.489585, -0.374884, -1.766074, 1, 0.4431373, 0, 1,
-1.472038, -1.121943, -1.809519, 1, 0.4509804, 0, 1,
-1.464296, -0.2144972, -1.667294, 1, 0.454902, 0, 1,
-1.456158, -0.4945829, -1.959157, 1, 0.4627451, 0, 1,
-1.449796, -0.0783384, -1.718232, 1, 0.4666667, 0, 1,
-1.445851, -0.1490792, -1.913509, 1, 0.4745098, 0, 1,
-1.43848, -0.3190201, -2.609988, 1, 0.4784314, 0, 1,
-1.417669, 1.111627, 0.04222629, 1, 0.4862745, 0, 1,
-1.417273, 0.5994961, -0.01374563, 1, 0.4901961, 0, 1,
-1.414366, -0.5588365, -1.161776, 1, 0.4980392, 0, 1,
-1.405609, 0.05300157, -0.6199093, 1, 0.5058824, 0, 1,
-1.405339, -0.4750289, -0.1449555, 1, 0.509804, 0, 1,
-1.403268, -1.133673, -1.000366, 1, 0.5176471, 0, 1,
-1.401181, 0.3403228, -1.368612, 1, 0.5215687, 0, 1,
-1.396118, 0.4073149, -1.434306, 1, 0.5294118, 0, 1,
-1.390119, -0.3637986, -2.686684, 1, 0.5333334, 0, 1,
-1.38951, 0.6750927, 0.4397076, 1, 0.5411765, 0, 1,
-1.366494, -0.9600227, -1.770493, 1, 0.5450981, 0, 1,
-1.355973, -0.60918, -1.071243, 1, 0.5529412, 0, 1,
-1.3519, -0.3556503, -1.768268, 1, 0.5568628, 0, 1,
-1.351289, 1.592056, -1.235938, 1, 0.5647059, 0, 1,
-1.351085, -0.670812, -1.847941, 1, 0.5686275, 0, 1,
-1.348117, 0.9393017, -2.345536, 1, 0.5764706, 0, 1,
-1.341493, -0.3070449, -0.3581715, 1, 0.5803922, 0, 1,
-1.338004, -1.465079, -2.9992, 1, 0.5882353, 0, 1,
-1.328657, -0.4804618, -2.98739, 1, 0.5921569, 0, 1,
-1.328572, -0.8688669, -1.605453, 1, 0.6, 0, 1,
-1.326778, -0.3919074, -1.999619, 1, 0.6078432, 0, 1,
-1.318438, -0.8675625, -1.831726, 1, 0.6117647, 0, 1,
-1.317838, -0.1133102, -1.18781, 1, 0.6196079, 0, 1,
-1.314053, 0.709752, -0.4353202, 1, 0.6235294, 0, 1,
-1.285441, 1.108758, -0.07757317, 1, 0.6313726, 0, 1,
-1.283756, -0.09682579, -0.07163028, 1, 0.6352941, 0, 1,
-1.271158, -1.253599, -1.49879, 1, 0.6431373, 0, 1,
-1.261672, 0.5428702, -1.791157, 1, 0.6470588, 0, 1,
-1.241496, -0.992204, -2.996674, 1, 0.654902, 0, 1,
-1.237558, 0.3634616, -2.24411, 1, 0.6588235, 0, 1,
-1.234027, -2.133338, -2.960527, 1, 0.6666667, 0, 1,
-1.229378, -0.005631807, -2.354986, 1, 0.6705883, 0, 1,
-1.228076, 0.3249752, -1.250037, 1, 0.6784314, 0, 1,
-1.207985, -0.8706338, -1.752168, 1, 0.682353, 0, 1,
-1.200233, 0.4065137, -1.148772, 1, 0.6901961, 0, 1,
-1.192301, 0.5694719, 0.407959, 1, 0.6941177, 0, 1,
-1.190037, 0.1026881, -1.962166, 1, 0.7019608, 0, 1,
-1.187743, -0.4030998, -3.548023, 1, 0.7098039, 0, 1,
-1.18298, -1.785933, -2.601452, 1, 0.7137255, 0, 1,
-1.18108, 0.4142266, -1.191653, 1, 0.7215686, 0, 1,
-1.172603, 0.9660856, -0.5979244, 1, 0.7254902, 0, 1,
-1.1703, -2.604918, -3.573262, 1, 0.7333333, 0, 1,
-1.165788, 0.457602, -0.1418927, 1, 0.7372549, 0, 1,
-1.163636, 1.256935, -1.393616, 1, 0.7450981, 0, 1,
-1.161701, -0.881568, -3.226183, 1, 0.7490196, 0, 1,
-1.160722, -1.0127, -4.371984, 1, 0.7568628, 0, 1,
-1.154698, -1.917444, -1.864606, 1, 0.7607843, 0, 1,
-1.142091, -1.15021, -3.388015, 1, 0.7686275, 0, 1,
-1.135004, 0.1466083, -0.7150803, 1, 0.772549, 0, 1,
-1.13064, -1.126782, -1.822529, 1, 0.7803922, 0, 1,
-1.126286, 1.623963, -2.545673, 1, 0.7843137, 0, 1,
-1.123582, 1.132611, -0.6759517, 1, 0.7921569, 0, 1,
-1.117357, 0.1151896, -1.162741, 1, 0.7960784, 0, 1,
-1.113747, -0.6298162, -2.309527, 1, 0.8039216, 0, 1,
-1.113185, 1.165867, -0.1986728, 1, 0.8117647, 0, 1,
-1.112845, 2.634012, -1.477842, 1, 0.8156863, 0, 1,
-1.108146, -1.386444, -1.172893, 1, 0.8235294, 0, 1,
-1.107344, -1.698112, -3.409016, 1, 0.827451, 0, 1,
-1.09963, -0.4308109, -2.021698, 1, 0.8352941, 0, 1,
-1.096691, 0.03285174, -0.5118119, 1, 0.8392157, 0, 1,
-1.091842, 0.8594701, -0.5310104, 1, 0.8470588, 0, 1,
-1.089534, 1.150234, -2.122571, 1, 0.8509804, 0, 1,
-1.075865, 1.110992, -0.6436444, 1, 0.8588235, 0, 1,
-1.070901, 1.67068, -2.295108, 1, 0.8627451, 0, 1,
-1.069213, 0.777038, 0.08781821, 1, 0.8705882, 0, 1,
-1.055927, -0.09961882, -2.667237, 1, 0.8745098, 0, 1,
-1.05295, -0.7075517, -2.650474, 1, 0.8823529, 0, 1,
-1.05274, -0.005726252, -0.4543666, 1, 0.8862745, 0, 1,
-1.041549, -0.09096947, -2.836898, 1, 0.8941177, 0, 1,
-1.038662, 0.1561354, -2.763397, 1, 0.8980392, 0, 1,
-1.038443, 0.3324528, -2.312825, 1, 0.9058824, 0, 1,
-1.035322, -0.0221603, -0.285915, 1, 0.9137255, 0, 1,
-1.030774, -2.392582, -2.166511, 1, 0.9176471, 0, 1,
-1.030309, -0.1662958, 0.9065142, 1, 0.9254902, 0, 1,
-1.027853, -1.052301, -3.010254, 1, 0.9294118, 0, 1,
-1.027354, 0.2989039, -1.193921, 1, 0.9372549, 0, 1,
-1.023748, -0.6885707, -3.16188, 1, 0.9411765, 0, 1,
-1.01799, 1.170471, -0.9583414, 1, 0.9490196, 0, 1,
-1.01584, -1.231078, -1.582757, 1, 0.9529412, 0, 1,
-1.015307, 0.5140222, -0.866767, 1, 0.9607843, 0, 1,
-1.012724, -1.567629, -2.92855, 1, 0.9647059, 0, 1,
-1.006445, 0.2652644, -0.7080657, 1, 0.972549, 0, 1,
-1.000618, -0.6824193, -2.14721, 1, 0.9764706, 0, 1,
-0.9946419, 0.5407176, 0.1925401, 1, 0.9843137, 0, 1,
-0.9923837, 0.2943268, -0.8200191, 1, 0.9882353, 0, 1,
-0.9809608, -1.665765, -1.316628, 1, 0.9960784, 0, 1,
-0.9793761, 0.08387956, 0.3366854, 0.9960784, 1, 0, 1,
-0.9783571, -2.898035, -3.387294, 0.9921569, 1, 0, 1,
-0.9762079, -0.5230474, -1.148837, 0.9843137, 1, 0, 1,
-0.9624185, 1.9915, -0.2590363, 0.9803922, 1, 0, 1,
-0.9595289, -1.01476, -1.516797, 0.972549, 1, 0, 1,
-0.9575227, -1.025891, -0.9702379, 0.9686275, 1, 0, 1,
-0.9572198, 1.263091, 0.9482, 0.9607843, 1, 0, 1,
-0.9545237, 1.040658, -0.4263083, 0.9568627, 1, 0, 1,
-0.94879, 0.3846253, -2.884628, 0.9490196, 1, 0, 1,
-0.9383351, -0.4784329, -1.171013, 0.945098, 1, 0, 1,
-0.9365476, -0.2877072, -1.982343, 0.9372549, 1, 0, 1,
-0.9185731, 1.679474, -1.66842, 0.9333333, 1, 0, 1,
-0.9146325, -0.6708665, -2.033783, 0.9254902, 1, 0, 1,
-0.9132234, 0.6191242, -0.9207289, 0.9215686, 1, 0, 1,
-0.9121761, 0.3718314, -2.116753, 0.9137255, 1, 0, 1,
-0.910457, -0.811551, -3.239642, 0.9098039, 1, 0, 1,
-0.9056195, 0.8406239, -1.225603, 0.9019608, 1, 0, 1,
-0.8997723, -0.3879366, -4.505987, 0.8941177, 1, 0, 1,
-0.8951718, 1.156791, 0.8771113, 0.8901961, 1, 0, 1,
-0.8942936, 0.1461087, -2.493276, 0.8823529, 1, 0, 1,
-0.8914206, -1.296444, -3.047356, 0.8784314, 1, 0, 1,
-0.8911701, 3.062422, -0.4977942, 0.8705882, 1, 0, 1,
-0.8896545, 0.8098264, -1.892886, 0.8666667, 1, 0, 1,
-0.8892604, 1.070974, -1.186682, 0.8588235, 1, 0, 1,
-0.8884631, 0.7983568, 0.02349824, 0.854902, 1, 0, 1,
-0.8858901, -0.9769443, -2.908007, 0.8470588, 1, 0, 1,
-0.8845136, -1.018438, -2.423187, 0.8431373, 1, 0, 1,
-0.8707444, -0.33415, -2.649236, 0.8352941, 1, 0, 1,
-0.8670643, 0.1351446, -0.560118, 0.8313726, 1, 0, 1,
-0.8643805, -0.2014756, -0.6656443, 0.8235294, 1, 0, 1,
-0.8523256, -0.06981303, -0.9619033, 0.8196079, 1, 0, 1,
-0.8518118, -0.7299981, -0.7645094, 0.8117647, 1, 0, 1,
-0.8490281, -0.2164703, -2.69995, 0.8078431, 1, 0, 1,
-0.8421452, -1.84242, -2.157845, 0.8, 1, 0, 1,
-0.8374518, 0.02325596, -1.274234, 0.7921569, 1, 0, 1,
-0.8331461, -0.8014617, -2.711091, 0.7882353, 1, 0, 1,
-0.8237824, 1.221307, -0.7501647, 0.7803922, 1, 0, 1,
-0.8223107, 1.205732, -0.8722492, 0.7764706, 1, 0, 1,
-0.8218472, 2.056014, 0.7430327, 0.7686275, 1, 0, 1,
-0.8211861, -1.569291, -2.646003, 0.7647059, 1, 0, 1,
-0.820961, 0.3023971, -0.1679035, 0.7568628, 1, 0, 1,
-0.8208349, 0.5733784, -0.197129, 0.7529412, 1, 0, 1,
-0.8197187, 1.323228, 0.2793594, 0.7450981, 1, 0, 1,
-0.8175623, 0.06691943, -1.242228, 0.7411765, 1, 0, 1,
-0.8094555, 1.299686, -1.214016, 0.7333333, 1, 0, 1,
-0.8025261, -0.7719768, -2.061013, 0.7294118, 1, 0, 1,
-0.7996271, -1.694597, -1.83941, 0.7215686, 1, 0, 1,
-0.7952474, -0.4485472, -2.674828, 0.7176471, 1, 0, 1,
-0.7944176, 0.1209756, -1.255066, 0.7098039, 1, 0, 1,
-0.7907552, 0.3496002, -1.25577, 0.7058824, 1, 0, 1,
-0.7907535, 1.360342, -0.4364909, 0.6980392, 1, 0, 1,
-0.7849082, 0.6934648, 0.3541051, 0.6901961, 1, 0, 1,
-0.7831147, -0.9167207, -3.184278, 0.6862745, 1, 0, 1,
-0.7825718, -0.5554073, -2.839447, 0.6784314, 1, 0, 1,
-0.7778647, -0.4331283, -1.762235, 0.6745098, 1, 0, 1,
-0.7761313, 0.8916788, -1.027662, 0.6666667, 1, 0, 1,
-0.7758936, -0.5213916, -3.280398, 0.6627451, 1, 0, 1,
-0.7733198, -1.33509, -2.411976, 0.654902, 1, 0, 1,
-0.7615469, 0.5930264, -0.1105277, 0.6509804, 1, 0, 1,
-0.7548847, 0.7409612, -1.278826, 0.6431373, 1, 0, 1,
-0.7478257, -1.207662, -3.135941, 0.6392157, 1, 0, 1,
-0.7421803, -0.3283903, -4.005474, 0.6313726, 1, 0, 1,
-0.7347863, 0.01503751, -3.116198, 0.627451, 1, 0, 1,
-0.7318789, -0.9028625, -3.234767, 0.6196079, 1, 0, 1,
-0.7316836, 0.1275026, -0.4251477, 0.6156863, 1, 0, 1,
-0.7305105, 0.09232528, -2.400424, 0.6078432, 1, 0, 1,
-0.7265027, -0.3844439, -3.029253, 0.6039216, 1, 0, 1,
-0.7200404, -1.141845, -2.267452, 0.5960785, 1, 0, 1,
-0.719594, 2.033104, -0.3641337, 0.5882353, 1, 0, 1,
-0.7187234, -0.2582801, -2.17672, 0.5843138, 1, 0, 1,
-0.7122628, -0.07808812, -2.621324, 0.5764706, 1, 0, 1,
-0.7100264, 0.07589184, -0.949201, 0.572549, 1, 0, 1,
-0.7060094, 0.1603133, -2.581431, 0.5647059, 1, 0, 1,
-0.705517, 0.04815969, -1.824529, 0.5607843, 1, 0, 1,
-0.7053108, 0.163376, -1.755055, 0.5529412, 1, 0, 1,
-0.6981606, -1.555132, -3.235298, 0.5490196, 1, 0, 1,
-0.6913199, 0.3210349, -1.449348, 0.5411765, 1, 0, 1,
-0.6911002, -0.8160993, -1.147254, 0.5372549, 1, 0, 1,
-0.6882327, 0.9085467, -0.7313838, 0.5294118, 1, 0, 1,
-0.6868376, 0.1516196, -1.539161, 0.5254902, 1, 0, 1,
-0.6865163, -1.187221, -0.2260116, 0.5176471, 1, 0, 1,
-0.686121, -0.7742363, -1.65812, 0.5137255, 1, 0, 1,
-0.6783196, -0.9033735, -4.693799, 0.5058824, 1, 0, 1,
-0.6781333, 0.8445873, 1.223401, 0.5019608, 1, 0, 1,
-0.6769999, -1.696259, -2.148228, 0.4941176, 1, 0, 1,
-0.6762927, -0.002533034, -2.80863, 0.4862745, 1, 0, 1,
-0.6760799, -1.36227, -2.274145, 0.4823529, 1, 0, 1,
-0.6741006, 0.5965416, -0.5505598, 0.4745098, 1, 0, 1,
-0.6724641, -0.1249348, -2.444071, 0.4705882, 1, 0, 1,
-0.6705582, -0.1542046, 0.9067159, 0.4627451, 1, 0, 1,
-0.667576, 0.8902548, -0.4458479, 0.4588235, 1, 0, 1,
-0.6654778, 1.119348, -0.4076551, 0.4509804, 1, 0, 1,
-0.6631319, -1.604817, -2.737624, 0.4470588, 1, 0, 1,
-0.6529196, 0.9799387, -0.3341687, 0.4392157, 1, 0, 1,
-0.6477266, 1.088465, 0.2556443, 0.4352941, 1, 0, 1,
-0.6463673, -0.2925019, -1.161555, 0.427451, 1, 0, 1,
-0.6454354, 1.572866, -1.13486, 0.4235294, 1, 0, 1,
-0.6454328, 1.626754, 0.117981, 0.4156863, 1, 0, 1,
-0.6443444, -0.4401008, -2.906252, 0.4117647, 1, 0, 1,
-0.6438279, -1.10989, -2.222088, 0.4039216, 1, 0, 1,
-0.633669, -1.353183, -2.939957, 0.3960784, 1, 0, 1,
-0.6313266, -0.6202723, -2.215954, 0.3921569, 1, 0, 1,
-0.6276846, -0.9843049, -0.7588654, 0.3843137, 1, 0, 1,
-0.6276357, 1.028577, 0.0584974, 0.3803922, 1, 0, 1,
-0.6238008, -0.6768607, -2.597669, 0.372549, 1, 0, 1,
-0.6213023, -0.1086601, -2.35169, 0.3686275, 1, 0, 1,
-0.6192433, 1.365453, -0.8496168, 0.3607843, 1, 0, 1,
-0.6171981, -1.427798, -1.505654, 0.3568628, 1, 0, 1,
-0.6130107, 0.4063994, -0.7977681, 0.3490196, 1, 0, 1,
-0.6092063, 1.044691, -1.700652, 0.345098, 1, 0, 1,
-0.6049418, 1.201773, 0.6482986, 0.3372549, 1, 0, 1,
-0.6033076, -0.7034144, -2.02691, 0.3333333, 1, 0, 1,
-0.598974, 0.9292066, 0.1247697, 0.3254902, 1, 0, 1,
-0.5974851, 0.917235, -1.345554, 0.3215686, 1, 0, 1,
-0.5955532, 1.306601, 1.868751, 0.3137255, 1, 0, 1,
-0.5904102, -1.349061, -3.872012, 0.3098039, 1, 0, 1,
-0.5866122, 0.1149386, -3.364414, 0.3019608, 1, 0, 1,
-0.5832157, -0.8733317, -2.988484, 0.2941177, 1, 0, 1,
-0.5780883, 1.360049, -1.888951, 0.2901961, 1, 0, 1,
-0.5705344, 0.5510132, 1.889787, 0.282353, 1, 0, 1,
-0.5687815, 1.022378, -0.08680288, 0.2784314, 1, 0, 1,
-0.5632104, -1.33638, -2.253498, 0.2705882, 1, 0, 1,
-0.5619845, 0.441136, -1.659313, 0.2666667, 1, 0, 1,
-0.5594437, -1.625396, -1.25445, 0.2588235, 1, 0, 1,
-0.5586614, 0.9655015, -0.8000107, 0.254902, 1, 0, 1,
-0.5538558, -1.382157, -3.629567, 0.2470588, 1, 0, 1,
-0.5532597, -1.764218, -1.682858, 0.2431373, 1, 0, 1,
-0.5487635, 0.09707753, -2.593442, 0.2352941, 1, 0, 1,
-0.5466684, 2.075719, 0.02443239, 0.2313726, 1, 0, 1,
-0.5461563, 0.1161274, -1.129849, 0.2235294, 1, 0, 1,
-0.5453853, -1.477897, -3.724971, 0.2196078, 1, 0, 1,
-0.5446059, -0.773052, -2.933637, 0.2117647, 1, 0, 1,
-0.5438899, -0.7797677, -4.36335, 0.2078431, 1, 0, 1,
-0.5436049, -0.6955469, -2.611026, 0.2, 1, 0, 1,
-0.5419084, 1.035816, -1.26456, 0.1921569, 1, 0, 1,
-0.534973, -0.2156491, -1.440003, 0.1882353, 1, 0, 1,
-0.5285118, 2.023653, 0.7769066, 0.1803922, 1, 0, 1,
-0.5280012, 0.06049126, -1.957977, 0.1764706, 1, 0, 1,
-0.5216485, -2.076863, -2.011122, 0.1686275, 1, 0, 1,
-0.521152, 0.9156814, -1.236092, 0.1647059, 1, 0, 1,
-0.5188538, 0.9590925, -0.1875321, 0.1568628, 1, 0, 1,
-0.5166275, -0.5796689, -2.06541, 0.1529412, 1, 0, 1,
-0.5120342, -0.2247939, -0.09153646, 0.145098, 1, 0, 1,
-0.5033302, 0.07196085, -1.587834, 0.1411765, 1, 0, 1,
-0.4989741, 1.632027, 0.8386313, 0.1333333, 1, 0, 1,
-0.4948586, -0.7338716, -2.099019, 0.1294118, 1, 0, 1,
-0.4916081, 1.394664, 1.999045, 0.1215686, 1, 0, 1,
-0.4908269, 0.518144, -2.392588, 0.1176471, 1, 0, 1,
-0.4892155, -0.5437652, -2.301241, 0.1098039, 1, 0, 1,
-0.4871811, 0.9383388, 0.4898278, 0.1058824, 1, 0, 1,
-0.4836284, 0.4563995, -0.8907513, 0.09803922, 1, 0, 1,
-0.482882, 0.5794123, -0.2996655, 0.09019608, 1, 0, 1,
-0.4826781, 1.168265, -0.8085551, 0.08627451, 1, 0, 1,
-0.4808303, 1.258865, 0.4851703, 0.07843138, 1, 0, 1,
-0.4750977, -1.316967, -4.411262, 0.07450981, 1, 0, 1,
-0.4719987, -0.667549, -4.511747, 0.06666667, 1, 0, 1,
-0.466194, 0.8373374, -0.4056377, 0.0627451, 1, 0, 1,
-0.4656847, 0.9957311, 0.5933297, 0.05490196, 1, 0, 1,
-0.4609221, -0.6424527, -2.865097, 0.05098039, 1, 0, 1,
-0.4608309, 0.01928303, -1.836272, 0.04313726, 1, 0, 1,
-0.460223, 0.3688214, -0.6043769, 0.03921569, 1, 0, 1,
-0.4579955, -0.2799281, -2.263856, 0.03137255, 1, 0, 1,
-0.4536918, -0.1874483, -3.968563, 0.02745098, 1, 0, 1,
-0.4519397, -0.8046377, -1.968079, 0.01960784, 1, 0, 1,
-0.4498129, 1.387999, -1.134476, 0.01568628, 1, 0, 1,
-0.4494284, 1.175667, -0.9760832, 0.007843138, 1, 0, 1,
-0.4468977, 0.3007342, -0.113651, 0.003921569, 1, 0, 1,
-0.4457758, -0.8125135, -3.337969, 0, 1, 0.003921569, 1,
-0.445148, -1.028629, -3.674374, 0, 1, 0.01176471, 1,
-0.441225, -0.6117201, -3.457199, 0, 1, 0.01568628, 1,
-0.4394284, -1.342298, -1.876373, 0, 1, 0.02352941, 1,
-0.4377873, 1.306451, -1.407098, 0, 1, 0.02745098, 1,
-0.4335771, 1.007456, -0.2808791, 0, 1, 0.03529412, 1,
-0.433105, -0.9963755, -2.589163, 0, 1, 0.03921569, 1,
-0.4329267, -0.9472461, -4.293341, 0, 1, 0.04705882, 1,
-0.4326574, 0.8388687, -0.8477711, 0, 1, 0.05098039, 1,
-0.4305634, 2.122482, -1.123269, 0, 1, 0.05882353, 1,
-0.4297494, 0.2160587, -0.5067551, 0, 1, 0.0627451, 1,
-0.4290618, -0.7294534, -3.417333, 0, 1, 0.07058824, 1,
-0.426771, -0.7324962, -2.227374, 0, 1, 0.07450981, 1,
-0.4241024, 1.488448, 1.54333, 0, 1, 0.08235294, 1,
-0.4235137, -1.890433, -3.667507, 0, 1, 0.08627451, 1,
-0.422816, -0.1774516, -1.523015, 0, 1, 0.09411765, 1,
-0.4145702, -0.3816504, -0.994505, 0, 1, 0.1019608, 1,
-0.3961937, 1.76832, -1.215182, 0, 1, 0.1058824, 1,
-0.3912574, -0.7294339, -0.6687639, 0, 1, 0.1137255, 1,
-0.3863671, -0.8946549, -3.657618, 0, 1, 0.1176471, 1,
-0.3821827, -2.077678, -3.924124, 0, 1, 0.1254902, 1,
-0.3792741, -0.3014701, -2.388528, 0, 1, 0.1294118, 1,
-0.3781006, -2.231654, -3.740633, 0, 1, 0.1372549, 1,
-0.3778442, 1.235867, -0.04444419, 0, 1, 0.1411765, 1,
-0.3768687, 0.8961556, -0.9243485, 0, 1, 0.1490196, 1,
-0.3761248, -1.430495, -1.379528, 0, 1, 0.1529412, 1,
-0.374852, -0.03193347, -3.543721, 0, 1, 0.1607843, 1,
-0.3743604, -0.4923688, -3.702467, 0, 1, 0.1647059, 1,
-0.3743134, 0.6617084, -1.474939, 0, 1, 0.172549, 1,
-0.3736251, 1.319342, -0.2015927, 0, 1, 0.1764706, 1,
-0.372275, -1.845501, -2.005005, 0, 1, 0.1843137, 1,
-0.3720317, 0.04002565, -1.425874, 0, 1, 0.1882353, 1,
-0.369615, 0.3658776, 0.03700522, 0, 1, 0.1960784, 1,
-0.3666295, -2.204872, -2.207244, 0, 1, 0.2039216, 1,
-0.3657993, 0.07458262, -1.525139, 0, 1, 0.2078431, 1,
-0.363887, -1.270098, -2.807479, 0, 1, 0.2156863, 1,
-0.3629088, 0.02476112, -2.02481, 0, 1, 0.2196078, 1,
-0.362056, 0.6047161, 0.2700753, 0, 1, 0.227451, 1,
-0.360727, -0.3186502, -0.6628572, 0, 1, 0.2313726, 1,
-0.3587722, 0.1295515, -3.187212, 0, 1, 0.2392157, 1,
-0.3565168, -0.5840819, -2.365324, 0, 1, 0.2431373, 1,
-0.3529061, 0.7499855, -0.8790932, 0, 1, 0.2509804, 1,
-0.3521092, -0.6642141, -1.753668, 0, 1, 0.254902, 1,
-0.3491327, -3.177277, -2.031083, 0, 1, 0.2627451, 1,
-0.3489696, -0.07202163, -1.889745, 0, 1, 0.2666667, 1,
-0.3474839, 0.3209125, 0.1445033, 0, 1, 0.2745098, 1,
-0.3459536, -0.1779264, -3.118495, 0, 1, 0.2784314, 1,
-0.3423443, -1.118453, -2.760871, 0, 1, 0.2862745, 1,
-0.3421944, 0.8281702, 0.5246522, 0, 1, 0.2901961, 1,
-0.3413724, -0.8436278, -2.159494, 0, 1, 0.2980392, 1,
-0.3408485, 1.201604, 0.7577051, 0, 1, 0.3058824, 1,
-0.3361838, -0.5379588, -1.836738, 0, 1, 0.3098039, 1,
-0.3359313, -0.4821702, -2.004168, 0, 1, 0.3176471, 1,
-0.3357328, 0.4074814, 0.2659367, 0, 1, 0.3215686, 1,
-0.3336923, -1.428407, -3.568551, 0, 1, 0.3294118, 1,
-0.3262152, 1.387547, -0.9457123, 0, 1, 0.3333333, 1,
-0.3241929, -1.905184, -4.125381, 0, 1, 0.3411765, 1,
-0.3231249, 0.5745351, -1.547048, 0, 1, 0.345098, 1,
-0.322871, -1.210653, -2.34305, 0, 1, 0.3529412, 1,
-0.3211784, -1.311292, -2.589252, 0, 1, 0.3568628, 1,
-0.3193263, -2.01669, -3.287773, 0, 1, 0.3647059, 1,
-0.3153717, 1.158128, -0.1339396, 0, 1, 0.3686275, 1,
-0.3131567, 0.1319909, -2.405619, 0, 1, 0.3764706, 1,
-0.3059355, 2.073192, -0.6859205, 0, 1, 0.3803922, 1,
-0.305389, -1.258033, -1.633953, 0, 1, 0.3882353, 1,
-0.3052495, 1.23844, 0.3389023, 0, 1, 0.3921569, 1,
-0.3045989, 1.32623, -1.468463, 0, 1, 0.4, 1,
-0.301045, 0.1833833, 0.3456177, 0, 1, 0.4078431, 1,
-0.2965623, -0.9517437, -2.077259, 0, 1, 0.4117647, 1,
-0.2927353, -0.3545834, -1.256934, 0, 1, 0.4196078, 1,
-0.2902115, 1.526618, -0.07555904, 0, 1, 0.4235294, 1,
-0.2886728, -0.228198, -3.239274, 0, 1, 0.4313726, 1,
-0.2866089, -0.2196777, -3.351655, 0, 1, 0.4352941, 1,
-0.2814774, -1.185162, -3.707683, 0, 1, 0.4431373, 1,
-0.2806994, -0.6758111, -2.809384, 0, 1, 0.4470588, 1,
-0.2794258, 0.968401, 0.6208411, 0, 1, 0.454902, 1,
-0.2699882, -0.9440488, -2.337122, 0, 1, 0.4588235, 1,
-0.2685624, -1.345466, -4.174464, 0, 1, 0.4666667, 1,
-0.2657033, 0.5805086, 0.3969838, 0, 1, 0.4705882, 1,
-0.2652676, 1.075027, -0.2865532, 0, 1, 0.4784314, 1,
-0.2612511, -0.7710824, -3.892895, 0, 1, 0.4823529, 1,
-0.2600069, -0.3015548, -1.807784, 0, 1, 0.4901961, 1,
-0.2598609, -0.3087359, -1.225132, 0, 1, 0.4941176, 1,
-0.2596973, 1.777407, -0.04111479, 0, 1, 0.5019608, 1,
-0.2575127, -1.663841, -3.808635, 0, 1, 0.509804, 1,
-0.2561923, -2.055632, -2.719589, 0, 1, 0.5137255, 1,
-0.2551777, -0.1258088, -2.993403, 0, 1, 0.5215687, 1,
-0.2550271, -0.2901484, -1.091651, 0, 1, 0.5254902, 1,
-0.2547009, -1.379651, -3.686488, 0, 1, 0.5333334, 1,
-0.2458004, 1.137329, 1.036534, 0, 1, 0.5372549, 1,
-0.2409682, -1.320766, -3.931975, 0, 1, 0.5450981, 1,
-0.23907, -0.2407736, -2.668147, 0, 1, 0.5490196, 1,
-0.2381755, -0.2963207, -3.899396, 0, 1, 0.5568628, 1,
-0.2376426, -0.270864, -1.989853, 0, 1, 0.5607843, 1,
-0.2367478, -2.034574, -2.699765, 0, 1, 0.5686275, 1,
-0.2301632, 2.024835, 1.973394, 0, 1, 0.572549, 1,
-0.2293616, -1.348606, -3.754975, 0, 1, 0.5803922, 1,
-0.2271888, 0.7429222, -1.07357, 0, 1, 0.5843138, 1,
-0.2261205, -0.448146, -3.269333, 0, 1, 0.5921569, 1,
-0.2258668, 0.6395175, -0.01186399, 0, 1, 0.5960785, 1,
-0.217997, 2.085917, -1.599887, 0, 1, 0.6039216, 1,
-0.2167431, -0.9483246, -2.893164, 0, 1, 0.6117647, 1,
-0.2093853, -0.7306113, -2.47175, 0, 1, 0.6156863, 1,
-0.2070735, -3.191354, -3.356753, 0, 1, 0.6235294, 1,
-0.2069731, -0.9435613, -3.651476, 0, 1, 0.627451, 1,
-0.2048881, -0.7386202, -2.8193, 0, 1, 0.6352941, 1,
-0.2028511, 1.073235, 1.038371, 0, 1, 0.6392157, 1,
-0.201538, -0.04891947, -4.264449, 0, 1, 0.6470588, 1,
-0.2007657, -1.233256, -1.910115, 0, 1, 0.6509804, 1,
-0.1968828, -0.05900181, -2.728503, 0, 1, 0.6588235, 1,
-0.1944616, 1.119928, 0.5858328, 0, 1, 0.6627451, 1,
-0.1897186, 0.9536225, -1.729099, 0, 1, 0.6705883, 1,
-0.1896733, 0.7852901, 0.2103457, 0, 1, 0.6745098, 1,
-0.1887971, -0.3391565, -2.623377, 0, 1, 0.682353, 1,
-0.1886531, 1.108578, -0.3278616, 0, 1, 0.6862745, 1,
-0.1857129, 0.275238, -2.293827, 0, 1, 0.6941177, 1,
-0.1854073, 0.3846318, -1.909711, 0, 1, 0.7019608, 1,
-0.1828046, 0.4128188, 0.5007312, 0, 1, 0.7058824, 1,
-0.1826722, -0.04039619, -3.478033, 0, 1, 0.7137255, 1,
-0.1714117, 2.822431, -0.1079446, 0, 1, 0.7176471, 1,
-0.16945, 0.3262701, -0.4944576, 0, 1, 0.7254902, 1,
-0.1649037, -0.8200694, -3.353542, 0, 1, 0.7294118, 1,
-0.1636587, -0.5367672, -1.725664, 0, 1, 0.7372549, 1,
-0.1634673, -1.616262, -2.399808, 0, 1, 0.7411765, 1,
-0.1558393, 0.440262, -1.391843, 0, 1, 0.7490196, 1,
-0.1503676, -0.5914248, -2.995456, 0, 1, 0.7529412, 1,
-0.1492856, 0.9453171, 0.05601312, 0, 1, 0.7607843, 1,
-0.147689, -1.035475, -4.020296, 0, 1, 0.7647059, 1,
-0.1443607, 0.2767609, -0.08837541, 0, 1, 0.772549, 1,
-0.1398982, -0.8674038, -2.097761, 0, 1, 0.7764706, 1,
-0.1373386, 0.3029934, -0.940603, 0, 1, 0.7843137, 1,
-0.1361601, 1.062292, -0.04810439, 0, 1, 0.7882353, 1,
-0.1334588, 0.8026066, -1.105018, 0, 1, 0.7960784, 1,
-0.1298192, 0.1726053, -0.3409719, 0, 1, 0.8039216, 1,
-0.1229955, -0.4769672, -4.458632, 0, 1, 0.8078431, 1,
-0.1227567, 2.45625, -0.6649737, 0, 1, 0.8156863, 1,
-0.1190767, -1.407264, -4.574189, 0, 1, 0.8196079, 1,
-0.1168154, -0.7504612, -3.367275, 0, 1, 0.827451, 1,
-0.116293, -0.3175487, -3.755513, 0, 1, 0.8313726, 1,
-0.1160742, -0.4304642, -2.722502, 0, 1, 0.8392157, 1,
-0.1133852, 0.5732054, -1.386032, 0, 1, 0.8431373, 1,
-0.110235, 1.27247, 0.9642735, 0, 1, 0.8509804, 1,
-0.1061261, -0.2543119, -3.180019, 0, 1, 0.854902, 1,
-0.1020722, 0.7134603, -0.3857732, 0, 1, 0.8627451, 1,
-0.0976412, 0.1115779, -1.954809, 0, 1, 0.8666667, 1,
-0.09505647, 0.02899808, -0.1580729, 0, 1, 0.8745098, 1,
-0.09434708, 0.540804, -2.090424, 0, 1, 0.8784314, 1,
-0.0934394, 0.4381627, 0.07605024, 0, 1, 0.8862745, 1,
-0.09296458, -1.866435, -3.585762, 0, 1, 0.8901961, 1,
-0.09098151, -2.328544, -3.038274, 0, 1, 0.8980392, 1,
-0.08725163, -0.3937131, -2.883026, 0, 1, 0.9058824, 1,
-0.08427998, -1.446144, -1.755166, 0, 1, 0.9098039, 1,
-0.07969137, -0.7309309, -2.221376, 0, 1, 0.9176471, 1,
-0.07870301, -2.352043, -3.824914, 0, 1, 0.9215686, 1,
-0.07805081, -3.048192, -2.793285, 0, 1, 0.9294118, 1,
-0.07569829, 1.684847, -0.5133554, 0, 1, 0.9333333, 1,
-0.07121909, 1.013012, -2.122254, 0, 1, 0.9411765, 1,
-0.07081888, -1.032945, -2.928189, 0, 1, 0.945098, 1,
-0.06589326, -0.3758934, -2.476076, 0, 1, 0.9529412, 1,
-0.06521405, -0.5847281, -4.851074, 0, 1, 0.9568627, 1,
-0.06364477, 1.673901, 0.5180772, 0, 1, 0.9647059, 1,
-0.0635248, 0.2552991, 0.991725, 0, 1, 0.9686275, 1,
-0.05991688, -0.3211056, -1.27427, 0, 1, 0.9764706, 1,
-0.05928891, 0.3574993, -1.127289, 0, 1, 0.9803922, 1,
-0.05405554, -0.4429985, -3.446363, 0, 1, 0.9882353, 1,
-0.05335036, -1.601089, -1.721885, 0, 1, 0.9921569, 1,
-0.04774433, -0.01842027, -1.101482, 0, 1, 1, 1,
-0.04169312, 0.544003, 0.4978479, 0, 0.9921569, 1, 1,
-0.03878552, 0.9400139, 0.5408403, 0, 0.9882353, 1, 1,
-0.03780355, -0.5783262, -2.799185, 0, 0.9803922, 1, 1,
-0.03445343, 1.810486, -0.9717672, 0, 0.9764706, 1, 1,
-0.03193422, 1.3778, -0.2846013, 0, 0.9686275, 1, 1,
-0.02574117, 0.718031, 0.3833468, 0, 0.9647059, 1, 1,
-0.02444769, -0.3889367, -4.144348, 0, 0.9568627, 1, 1,
-0.02391652, -0.7357003, -4.951592, 0, 0.9529412, 1, 1,
-0.01824447, 0.8650478, 1.085417, 0, 0.945098, 1, 1,
-0.017016, 0.4386533, -0.3868648, 0, 0.9411765, 1, 1,
-0.01596625, 1.772927, -0.4462433, 0, 0.9333333, 1, 1,
-0.01154959, 1.832354, -0.29127, 0, 0.9294118, 1, 1,
-0.01002885, 1.45666, -1.756089, 0, 0.9215686, 1, 1,
-0.00997865, 0.1639599, -1.590383, 0, 0.9176471, 1, 1,
-0.004144056, 1.433547, 0.7684265, 0, 0.9098039, 1, 1,
-0.002971351, 0.3592094, -0.4920421, 0, 0.9058824, 1, 1,
-0.0009056766, -1.10494, -2.113191, 0, 0.8980392, 1, 1,
0.004225323, -0.2752525, 2.560004, 0, 0.8901961, 1, 1,
0.005839003, 0.2036489, -0.2916967, 0, 0.8862745, 1, 1,
0.008114244, 1.281291, 0.833872, 0, 0.8784314, 1, 1,
0.01057628, -2.070168, 3.644777, 0, 0.8745098, 1, 1,
0.01152667, -0.4977004, 2.221856, 0, 0.8666667, 1, 1,
0.01259533, 0.9497374, -0.3817087, 0, 0.8627451, 1, 1,
0.02001941, -0.1807601, 3.714775, 0, 0.854902, 1, 1,
0.02095069, -0.6633822, 3.618188, 0, 0.8509804, 1, 1,
0.02099322, 1.164042, 1.137463, 0, 0.8431373, 1, 1,
0.02158893, 0.1878388, 0.1383025, 0, 0.8392157, 1, 1,
0.02275244, 2.409222, -1.139339, 0, 0.8313726, 1, 1,
0.02444695, 1.252065, -0.3607807, 0, 0.827451, 1, 1,
0.02852648, -0.2549078, 1.278048, 0, 0.8196079, 1, 1,
0.03513703, 0.7492896, -1.142426, 0, 0.8156863, 1, 1,
0.03593213, -0.5026537, 2.61724, 0, 0.8078431, 1, 1,
0.03724438, 1.226278, -0.1260892, 0, 0.8039216, 1, 1,
0.03743507, -0.1166933, 1.700434, 0, 0.7960784, 1, 1,
0.03940621, 0.4486533, -0.9700524, 0, 0.7882353, 1, 1,
0.04333215, 0.2666715, 0.5746678, 0, 0.7843137, 1, 1,
0.04516177, 0.7236975, -0.187066, 0, 0.7764706, 1, 1,
0.04706924, 0.4541362, 0.5475133, 0, 0.772549, 1, 1,
0.04803418, -0.01320559, 1.998907, 0, 0.7647059, 1, 1,
0.05362349, 0.7581707, -0.2300857, 0, 0.7607843, 1, 1,
0.05557468, -0.5239567, 1.560914, 0, 0.7529412, 1, 1,
0.0620722, 0.1850315, -0.757988, 0, 0.7490196, 1, 1,
0.06502294, -0.9092197, 2.22804, 0, 0.7411765, 1, 1,
0.06910992, 0.173891, 0.9366612, 0, 0.7372549, 1, 1,
0.06926223, 1.172633, 0.1455399, 0, 0.7294118, 1, 1,
0.07377203, -0.5302887, 5.168033, 0, 0.7254902, 1, 1,
0.07570508, 0.9650234, -0.5432233, 0, 0.7176471, 1, 1,
0.07856937, -0.254367, 2.370957, 0, 0.7137255, 1, 1,
0.08420322, 1.266885, -0.06735062, 0, 0.7058824, 1, 1,
0.08426954, 0.6997773, -0.2168187, 0, 0.6980392, 1, 1,
0.08936759, 0.3288541, -0.3084353, 0, 0.6941177, 1, 1,
0.09221254, 0.7661388, 0.4436947, 0, 0.6862745, 1, 1,
0.09589563, 0.9417443, -0.1115903, 0, 0.682353, 1, 1,
0.1106977, -0.2429924, 3.390409, 0, 0.6745098, 1, 1,
0.1122413, -1.175465, 1.400911, 0, 0.6705883, 1, 1,
0.1142133, -0.2189728, 4.76572, 0, 0.6627451, 1, 1,
0.1149969, 0.8437718, -0.4718741, 0, 0.6588235, 1, 1,
0.1166096, 0.2913888, 1.762239, 0, 0.6509804, 1, 1,
0.1186336, -1.27508, 3.5546, 0, 0.6470588, 1, 1,
0.1189192, 0.5732956, 1.057121, 0, 0.6392157, 1, 1,
0.1234737, -0.369491, 2.988053, 0, 0.6352941, 1, 1,
0.1239984, -1.169324, 3.671546, 0, 0.627451, 1, 1,
0.1252925, -0.6537154, 3.917006, 0, 0.6235294, 1, 1,
0.1325972, 0.6105392, -0.2251926, 0, 0.6156863, 1, 1,
0.1336326, 1.136488, -0.7450367, 0, 0.6117647, 1, 1,
0.1403364, -0.4073746, 2.089092, 0, 0.6039216, 1, 1,
0.1426734, 1.233707, 0.5339127, 0, 0.5960785, 1, 1,
0.1454885, -1.180051, 2.486907, 0, 0.5921569, 1, 1,
0.1489719, -1.62465, 2.739118, 0, 0.5843138, 1, 1,
0.1491772, -0.01040755, 0.1138148, 0, 0.5803922, 1, 1,
0.1527706, -1.008185, 3.152732, 0, 0.572549, 1, 1,
0.1530948, 1.452411, 0.7089599, 0, 0.5686275, 1, 1,
0.1579634, 1.103318, -0.8602949, 0, 0.5607843, 1, 1,
0.1630068, 0.04978148, 2.902455, 0, 0.5568628, 1, 1,
0.1633627, 0.2717582, 0.5275829, 0, 0.5490196, 1, 1,
0.1658979, 0.6876122, 0.914135, 0, 0.5450981, 1, 1,
0.1659221, 1.533529, 0.470907, 0, 0.5372549, 1, 1,
0.1682108, -0.7529055, 1.465434, 0, 0.5333334, 1, 1,
0.1683819, 1.154207, 0.3621885, 0, 0.5254902, 1, 1,
0.1690662, 0.007925109, 0.08453376, 0, 0.5215687, 1, 1,
0.1705032, 0.6065869, -0.5108215, 0, 0.5137255, 1, 1,
0.1748762, -0.593974, 2.45667, 0, 0.509804, 1, 1,
0.1756312, -0.3908891, 0.6328883, 0, 0.5019608, 1, 1,
0.1775118, 0.04084972, 1.204949, 0, 0.4941176, 1, 1,
0.1793411, -1.868127, 2.554975, 0, 0.4901961, 1, 1,
0.1810849, -0.2144231, 2.050067, 0, 0.4823529, 1, 1,
0.181205, -0.1080241, 0.7703485, 0, 0.4784314, 1, 1,
0.1841418, -0.3159006, 4.099512, 0, 0.4705882, 1, 1,
0.1856342, -0.2917554, 4.677332, 0, 0.4666667, 1, 1,
0.1906449, -0.4347663, 2.251227, 0, 0.4588235, 1, 1,
0.1949143, 0.5804458, 1.03986, 0, 0.454902, 1, 1,
0.2005871, 0.8157656, 0.958548, 0, 0.4470588, 1, 1,
0.2068788, -1.0059, 3.074355, 0, 0.4431373, 1, 1,
0.2084754, 0.2125418, 1.786499, 0, 0.4352941, 1, 1,
0.2085352, -0.8014034, 2.757213, 0, 0.4313726, 1, 1,
0.2087061, 1.317577, -1.23048, 0, 0.4235294, 1, 1,
0.2118253, -0.8490262, 1.779534, 0, 0.4196078, 1, 1,
0.2163941, -0.6397081, 3.265743, 0, 0.4117647, 1, 1,
0.2167601, -0.7050119, 3.045666, 0, 0.4078431, 1, 1,
0.2173138, -1.223315, 1.273166, 0, 0.4, 1, 1,
0.217685, -0.2448696, 1.922961, 0, 0.3921569, 1, 1,
0.228067, -1.383688, 3.53379, 0, 0.3882353, 1, 1,
0.2285629, 1.369033, -0.5225469, 0, 0.3803922, 1, 1,
0.2313405, 1.00281, 0.4790947, 0, 0.3764706, 1, 1,
0.2374271, -1.039107, 3.627739, 0, 0.3686275, 1, 1,
0.2375734, 1.947119, 0.1730988, 0, 0.3647059, 1, 1,
0.2377093, -0.8982897, 2.569817, 0, 0.3568628, 1, 1,
0.2390772, 0.4677441, 1.860608, 0, 0.3529412, 1, 1,
0.2416422, 0.1688794, 0.8300053, 0, 0.345098, 1, 1,
0.2433871, 0.6123771, -3.10737, 0, 0.3411765, 1, 1,
0.2440249, 0.4956261, 0.2205409, 0, 0.3333333, 1, 1,
0.2469513, 0.1352897, -0.04671109, 0, 0.3294118, 1, 1,
0.2496538, 1.137849, 0.3924935, 0, 0.3215686, 1, 1,
0.2510006, -2.027192, 4.543724, 0, 0.3176471, 1, 1,
0.2554135, -0.3164517, 4.567977, 0, 0.3098039, 1, 1,
0.2565487, 0.2003603, 1.161185, 0, 0.3058824, 1, 1,
0.2586744, -1.084469, 4.005716, 0, 0.2980392, 1, 1,
0.2625114, -1.989421, 3.594625, 0, 0.2901961, 1, 1,
0.2649794, -1.838253, 2.877379, 0, 0.2862745, 1, 1,
0.2651452, -0.1383634, 1.939627, 0, 0.2784314, 1, 1,
0.2654811, 0.7313954, 0.3585467, 0, 0.2745098, 1, 1,
0.265548, 0.2619075, -0.7032725, 0, 0.2666667, 1, 1,
0.2655647, -1.610399, 2.33079, 0, 0.2627451, 1, 1,
0.2699034, 0.1447697, -0.7656726, 0, 0.254902, 1, 1,
0.2730256, 1.120632, -0.8833278, 0, 0.2509804, 1, 1,
0.2744151, -0.08788173, 1.711649, 0, 0.2431373, 1, 1,
0.2748542, -0.2708243, 2.824511, 0, 0.2392157, 1, 1,
0.2860616, 0.5914623, -0.1662366, 0, 0.2313726, 1, 1,
0.2862999, 0.4684926, 0.2585992, 0, 0.227451, 1, 1,
0.2906351, 0.9628252, 0.1491952, 0, 0.2196078, 1, 1,
0.2908953, 0.6044639, 0.5392521, 0, 0.2156863, 1, 1,
0.2927898, 0.9083237, 0.3104487, 0, 0.2078431, 1, 1,
0.2940258, -1.570239, 2.302021, 0, 0.2039216, 1, 1,
0.2955855, -2.292352, 3.25862, 0, 0.1960784, 1, 1,
0.2976809, 0.1852568, 0.7280033, 0, 0.1882353, 1, 1,
0.3019067, 0.3609534, 1.038744, 0, 0.1843137, 1, 1,
0.3053617, -1.214966, 2.654147, 0, 0.1764706, 1, 1,
0.3092445, 0.302785, -0.0359128, 0, 0.172549, 1, 1,
0.3103135, 0.4675257, 0.5007131, 0, 0.1647059, 1, 1,
0.3111026, 1.76945, 0.5307012, 0, 0.1607843, 1, 1,
0.3154015, -0.9122756, 2.544852, 0, 0.1529412, 1, 1,
0.3203268, 0.2194697, -0.07548035, 0, 0.1490196, 1, 1,
0.3221262, -2.565172, 0.5721446, 0, 0.1411765, 1, 1,
0.3241313, 0.3064843, 0.768142, 0, 0.1372549, 1, 1,
0.3248362, -1.478726, 2.207979, 0, 0.1294118, 1, 1,
0.3250223, 0.1192026, 1.679278, 0, 0.1254902, 1, 1,
0.3358275, -0.923835, 3.885592, 0, 0.1176471, 1, 1,
0.3396711, -0.02575847, 1.460026, 0, 0.1137255, 1, 1,
0.3405232, -1.499032, 4.034614, 0, 0.1058824, 1, 1,
0.3476437, 2.478729, 0.3071416, 0, 0.09803922, 1, 1,
0.3508885, -2.043108, 2.090424, 0, 0.09411765, 1, 1,
0.3524908, -0.5419236, 3.612833, 0, 0.08627451, 1, 1,
0.355003, -1.234621, 4.407128, 0, 0.08235294, 1, 1,
0.3591677, -2.405336, 2.402829, 0, 0.07450981, 1, 1,
0.3604458, 0.2786196, 2.395926, 0, 0.07058824, 1, 1,
0.3613252, 0.7373598, 2.839904, 0, 0.0627451, 1, 1,
0.3632596, 0.1546714, 0.5009196, 0, 0.05882353, 1, 1,
0.3649686, 1.465438, 2.079327, 0, 0.05098039, 1, 1,
0.3650489, -0.4314437, 1.007401, 0, 0.04705882, 1, 1,
0.3655581, 1.867303, 2.977933, 0, 0.03921569, 1, 1,
0.3695712, 0.2135862, 1.785896, 0, 0.03529412, 1, 1,
0.3710275, -1.743272, 1.754547, 0, 0.02745098, 1, 1,
0.372243, 0.5983645, 1.104879, 0, 0.02352941, 1, 1,
0.3797282, -0.1829346, 0.6478552, 0, 0.01568628, 1, 1,
0.3797857, 0.2416468, -0.5059849, 0, 0.01176471, 1, 1,
0.380763, 0.9180806, -0.8941419, 0, 0.003921569, 1, 1,
0.3819636, -0.3937135, 1.323792, 0.003921569, 0, 1, 1,
0.3846446, 0.7282428, 1.105021, 0.007843138, 0, 1, 1,
0.3903898, -0.9942217, 3.014573, 0.01568628, 0, 1, 1,
0.3919061, 0.09743299, -0.1160496, 0.01960784, 0, 1, 1,
0.3919985, 1.260848, 2.45099, 0.02745098, 0, 1, 1,
0.3948081, 1.128662, -0.3565033, 0.03137255, 0, 1, 1,
0.4009261, 0.8236269, -1.385424, 0.03921569, 0, 1, 1,
0.4027243, 0.2407465, 1.322936, 0.04313726, 0, 1, 1,
0.4046116, -0.06455477, 3.268413, 0.05098039, 0, 1, 1,
0.4061327, 1.154009, 0.5134039, 0.05490196, 0, 1, 1,
0.4066538, 0.8695698, 0.1395674, 0.0627451, 0, 1, 1,
0.4100212, 0.3786088, 2.016957, 0.06666667, 0, 1, 1,
0.4117889, -0.4752433, 1.755045, 0.07450981, 0, 1, 1,
0.4147205, 1.22418, 2.182725, 0.07843138, 0, 1, 1,
0.4192417, 0.4056348, 2.227421, 0.08627451, 0, 1, 1,
0.4204515, -1.250231, 1.238797, 0.09019608, 0, 1, 1,
0.4238007, 1.181373, -2.46518, 0.09803922, 0, 1, 1,
0.4243242, 0.2037831, 1.089161, 0.1058824, 0, 1, 1,
0.4299452, 0.863432, 0.2787664, 0.1098039, 0, 1, 1,
0.4305436, 0.1222967, 1.094614, 0.1176471, 0, 1, 1,
0.4339658, 0.385117, 1.618177, 0.1215686, 0, 1, 1,
0.4348925, 0.207087, 0.4250295, 0.1294118, 0, 1, 1,
0.4385353, 0.3747953, 0.4663121, 0.1333333, 0, 1, 1,
0.4388051, 0.0567399, 1.974659, 0.1411765, 0, 1, 1,
0.4428201, -0.6553853, 2.209822, 0.145098, 0, 1, 1,
0.4486899, 0.9510918, -0.2143223, 0.1529412, 0, 1, 1,
0.4488102, 1.077032, 1.014129, 0.1568628, 0, 1, 1,
0.4488757, 1.964238, -0.07510705, 0.1647059, 0, 1, 1,
0.4532407, -0.9539561, 1.997623, 0.1686275, 0, 1, 1,
0.454745, -0.7930222, 4.821631, 0.1764706, 0, 1, 1,
0.4551184, -1.278538, 2.652578, 0.1803922, 0, 1, 1,
0.458681, -0.5583774, 4.85358, 0.1882353, 0, 1, 1,
0.4605767, -2.86269, 4.541327, 0.1921569, 0, 1, 1,
0.4647963, 0.6502559, 2.894302, 0.2, 0, 1, 1,
0.4655193, 1.186963, 0.9273998, 0.2078431, 0, 1, 1,
0.472226, -0.5552101, 2.833359, 0.2117647, 0, 1, 1,
0.4753237, 0.03700983, 1.467505, 0.2196078, 0, 1, 1,
0.476499, -0.3842327, 2.088864, 0.2235294, 0, 1, 1,
0.4779977, -0.8053263, 3.078752, 0.2313726, 0, 1, 1,
0.4852459, 0.06814659, 1.420079, 0.2352941, 0, 1, 1,
0.4862258, 1.161059, 0.8024349, 0.2431373, 0, 1, 1,
0.4889521, -0.2246529, 2.670421, 0.2470588, 0, 1, 1,
0.4892211, -0.3110835, 1.584725, 0.254902, 0, 1, 1,
0.495152, 0.4822723, 1.128245, 0.2588235, 0, 1, 1,
0.5000075, 0.4581737, 1.335801, 0.2666667, 0, 1, 1,
0.5026745, 0.6535243, 0.6126848, 0.2705882, 0, 1, 1,
0.5036618, 1.032249, 1.309769, 0.2784314, 0, 1, 1,
0.5038121, -0.3234306, 2.003401, 0.282353, 0, 1, 1,
0.5049725, -0.639168, 3.223557, 0.2901961, 0, 1, 1,
0.5098292, 2.194878, 0.3911548, 0.2941177, 0, 1, 1,
0.5133566, 1.74031, 0.9409801, 0.3019608, 0, 1, 1,
0.5142608, 0.1782904, 1.753393, 0.3098039, 0, 1, 1,
0.5162424, -0.7201483, 1.31738, 0.3137255, 0, 1, 1,
0.5177877, 0.5980595, 1.227893, 0.3215686, 0, 1, 1,
0.5181496, -0.2491102, 3.090504, 0.3254902, 0, 1, 1,
0.5196707, 0.6312736, 1.786786, 0.3333333, 0, 1, 1,
0.5262172, -0.993959, 2.810783, 0.3372549, 0, 1, 1,
0.5268689, 0.5301813, 1.495283, 0.345098, 0, 1, 1,
0.5280042, -0.1570805, 1.177999, 0.3490196, 0, 1, 1,
0.5285165, 0.7786592, -0.1304231, 0.3568628, 0, 1, 1,
0.5290235, -1.949583, 5.01594, 0.3607843, 0, 1, 1,
0.5292642, 0.04223278, 3.195597, 0.3686275, 0, 1, 1,
0.5299423, -0.05366065, 1.031244, 0.372549, 0, 1, 1,
0.5328239, -1.105397, 2.937101, 0.3803922, 0, 1, 1,
0.5355995, -1.091429, 0.9117425, 0.3843137, 0, 1, 1,
0.5396659, 0.07794186, 1.587371, 0.3921569, 0, 1, 1,
0.5429288, -0.9963817, 1.728896, 0.3960784, 0, 1, 1,
0.5527914, -1.067415, 3.279552, 0.4039216, 0, 1, 1,
0.5545474, 1.088598, 1.872643, 0.4117647, 0, 1, 1,
0.5572341, -0.2452554, 2.04746, 0.4156863, 0, 1, 1,
0.5587655, 0.146863, -0.1699144, 0.4235294, 0, 1, 1,
0.5592027, 0.05143276, 0.7928429, 0.427451, 0, 1, 1,
0.5605931, 1.253267, 0.2549096, 0.4352941, 0, 1, 1,
0.5637682, -1.688897, 1.588184, 0.4392157, 0, 1, 1,
0.5651094, 2.06039, 0.05264497, 0.4470588, 0, 1, 1,
0.5704145, -0.5576226, 3.105651, 0.4509804, 0, 1, 1,
0.5706985, 1.221003, 0.1794956, 0.4588235, 0, 1, 1,
0.5762579, 0.06925602, 1.727315, 0.4627451, 0, 1, 1,
0.5804813, 0.363729, 1.074501, 0.4705882, 0, 1, 1,
0.581452, -1.684619, 3.430767, 0.4745098, 0, 1, 1,
0.5825192, 0.7429535, 0.668586, 0.4823529, 0, 1, 1,
0.5857157, 0.2218771, 1.780013, 0.4862745, 0, 1, 1,
0.589883, 1.260959, -1.063969, 0.4941176, 0, 1, 1,
0.6042656, -0.1439749, 0.8681793, 0.5019608, 0, 1, 1,
0.6073034, 0.9611339, 0.07279742, 0.5058824, 0, 1, 1,
0.6074243, -1.160305, 2.230153, 0.5137255, 0, 1, 1,
0.6096669, 0.5779828, -0.06636471, 0.5176471, 0, 1, 1,
0.6155899, -0.3386203, 1.616399, 0.5254902, 0, 1, 1,
0.6243281, -1.387667, 3.8995, 0.5294118, 0, 1, 1,
0.6249537, 0.1245606, 1.828214, 0.5372549, 0, 1, 1,
0.6269513, 0.7864278, 1.699702, 0.5411765, 0, 1, 1,
0.6283205, 1.04381, -1.627178, 0.5490196, 0, 1, 1,
0.6300392, -1.041973, 2.629489, 0.5529412, 0, 1, 1,
0.6345278, 1.765301, 0.7176241, 0.5607843, 0, 1, 1,
0.6353482, 0.5883652, 1.334165, 0.5647059, 0, 1, 1,
0.6396242, 0.8453379, 0.6160003, 0.572549, 0, 1, 1,
0.642338, 1.552365, 2.482874, 0.5764706, 0, 1, 1,
0.6450214, -0.02482409, 2.738735, 0.5843138, 0, 1, 1,
0.6456214, -0.01853435, 2.097717, 0.5882353, 0, 1, 1,
0.6515589, 0.3399988, 2.245258, 0.5960785, 0, 1, 1,
0.6542987, 0.6468502, 0.6765062, 0.6039216, 0, 1, 1,
0.6559897, -1.890011, 3.824215, 0.6078432, 0, 1, 1,
0.6642436, 0.1389646, 2.553116, 0.6156863, 0, 1, 1,
0.6646101, -0.3911316, 1.968938, 0.6196079, 0, 1, 1,
0.67087, 0.3470319, 1.156566, 0.627451, 0, 1, 1,
0.6761604, 0.7933704, -0.9000167, 0.6313726, 0, 1, 1,
0.6766123, 0.6414287, 0.5535598, 0.6392157, 0, 1, 1,
0.6790735, -0.4782072, 1.790433, 0.6431373, 0, 1, 1,
0.6799665, -0.5106306, 2.57685, 0.6509804, 0, 1, 1,
0.6803133, 0.9119223, 1.770991, 0.654902, 0, 1, 1,
0.6824636, 1.250121, -0.1144062, 0.6627451, 0, 1, 1,
0.6826658, -2.231411, 1.216326, 0.6666667, 0, 1, 1,
0.6881914, 1.352246, 0.818093, 0.6745098, 0, 1, 1,
0.6956983, -0.05225005, 1.566266, 0.6784314, 0, 1, 1,
0.7051927, 0.2178448, 1.655703, 0.6862745, 0, 1, 1,
0.7073896, -0.1558776, 2.01473, 0.6901961, 0, 1, 1,
0.7097737, -0.4276895, 2.101988, 0.6980392, 0, 1, 1,
0.7163278, 0.1710872, -0.1527572, 0.7058824, 0, 1, 1,
0.730373, -0.707197, 1.006006, 0.7098039, 0, 1, 1,
0.7333469, -0.7715293, 2.006756, 0.7176471, 0, 1, 1,
0.737985, -0.25436, 0.2340008, 0.7215686, 0, 1, 1,
0.7410545, 1.451351, -0.5954791, 0.7294118, 0, 1, 1,
0.7436222, -1.25328, 3.41904, 0.7333333, 0, 1, 1,
0.7455572, 0.5145562, -0.3729827, 0.7411765, 0, 1, 1,
0.7459257, 0.7883901, 0.0548139, 0.7450981, 0, 1, 1,
0.7494362, -0.8257926, 2.226713, 0.7529412, 0, 1, 1,
0.7512151, -2.56062, 2.609814, 0.7568628, 0, 1, 1,
0.7558263, 0.3937019, 1.286378, 0.7647059, 0, 1, 1,
0.7625929, -1.208497, 1.932985, 0.7686275, 0, 1, 1,
0.768822, 0.2525606, 0.2792028, 0.7764706, 0, 1, 1,
0.7760286, -0.2460642, 1.592228, 0.7803922, 0, 1, 1,
0.7772804, -1.884754, 2.650391, 0.7882353, 0, 1, 1,
0.7801962, -0.985565, 4.287797, 0.7921569, 0, 1, 1,
0.7825478, 1.231675, 0.6484933, 0.8, 0, 1, 1,
0.7948828, -1.3629, 3.301148, 0.8078431, 0, 1, 1,
0.8067701, -1.340084, 1.704789, 0.8117647, 0, 1, 1,
0.8174019, 1.295277, 1.117122, 0.8196079, 0, 1, 1,
0.8200484, 0.7771019, 1.415461, 0.8235294, 0, 1, 1,
0.8230129, 0.2327359, 1.066218, 0.8313726, 0, 1, 1,
0.8271807, 0.1608064, 0.3511145, 0.8352941, 0, 1, 1,
0.8317026, -0.1393766, 1.637071, 0.8431373, 0, 1, 1,
0.8348943, 1.266673, 1.875452, 0.8470588, 0, 1, 1,
0.8397028, 3.00217, -0.1054312, 0.854902, 0, 1, 1,
0.8554834, 0.4571765, 0.2999633, 0.8588235, 0, 1, 1,
0.8574533, -0.5996738, 1.257157, 0.8666667, 0, 1, 1,
0.8615406, -0.633511, 2.556246, 0.8705882, 0, 1, 1,
0.8639892, -0.6820747, 3.606266, 0.8784314, 0, 1, 1,
0.8683004, -0.4784555, 1.453009, 0.8823529, 0, 1, 1,
0.8722434, 0.5205988, 1.516242, 0.8901961, 0, 1, 1,
0.8729421, -0.07254308, 1.161527, 0.8941177, 0, 1, 1,
0.8731135, -1.291094, -0.01928818, 0.9019608, 0, 1, 1,
0.8741986, -0.6300822, 1.872821, 0.9098039, 0, 1, 1,
0.8805209, 1.180406, -0.4501205, 0.9137255, 0, 1, 1,
0.8822424, -0.4014617, 1.021946, 0.9215686, 0, 1, 1,
0.8911117, -0.5327567, 1.553329, 0.9254902, 0, 1, 1,
0.8951485, -0.7647623, 1.855372, 0.9333333, 0, 1, 1,
0.8966094, 0.5864516, -0.828624, 0.9372549, 0, 1, 1,
0.8968254, 0.9566959, 0.463278, 0.945098, 0, 1, 1,
0.8996876, 0.2061219, 1.605433, 0.9490196, 0, 1, 1,
0.9026766, -1.210025, 2.456698, 0.9568627, 0, 1, 1,
0.9113897, -1.834306, 2.254038, 0.9607843, 0, 1, 1,
0.9122722, -1.080937, 1.659446, 0.9686275, 0, 1, 1,
0.9126613, 0.6918609, 2.146308, 0.972549, 0, 1, 1,
0.9135268, 1.290001, 1.115638, 0.9803922, 0, 1, 1,
0.9142941, 0.8238357, 1.311262, 0.9843137, 0, 1, 1,
0.9263201, 0.08929078, 0.5654448, 0.9921569, 0, 1, 1,
0.930649, -0.1091693, 0.4356833, 0.9960784, 0, 1, 1,
0.9310161, 1.776808, -1.119034, 1, 0, 0.9960784, 1,
0.9312946, 0.766151, 0.9627786, 1, 0, 0.9882353, 1,
0.9357993, -1.681364, 1.785987, 1, 0, 0.9843137, 1,
0.9412207, 1.180089, 1.967573, 1, 0, 0.9764706, 1,
0.9479164, 0.1416741, 0.1104047, 1, 0, 0.972549, 1,
0.9492279, -2.346813, 4.372482, 1, 0, 0.9647059, 1,
0.951467, -0.8974912, 2.678133, 1, 0, 0.9607843, 1,
0.95317, -1.08719, 4.137183, 1, 0, 0.9529412, 1,
0.9598066, -0.1885979, 3.200188, 1, 0, 0.9490196, 1,
0.9670991, -0.432109, 2.410491, 1, 0, 0.9411765, 1,
0.9816644, -0.8327062, 3.147265, 1, 0, 0.9372549, 1,
0.9882424, 1.080323, 1.598452, 1, 0, 0.9294118, 1,
0.9909547, -1.186969, 2.611809, 1, 0, 0.9254902, 1,
0.9957031, 1.088372, 0.1736558, 1, 0, 0.9176471, 1,
0.997995, 0.3899074, -0.05029739, 1, 0, 0.9137255, 1,
0.9983854, 0.9171495, -0.05644029, 1, 0, 0.9058824, 1,
1.010316, -0.06035211, 2.647573, 1, 0, 0.9019608, 1,
1.012064, -1.096963, 2.272644, 1, 0, 0.8941177, 1,
1.022631, 1.478068, 1.424879, 1, 0, 0.8862745, 1,
1.03817, 1.470962, 1.327973, 1, 0, 0.8823529, 1,
1.040084, 0.7551895, 0.207835, 1, 0, 0.8745098, 1,
1.050733, 0.7616054, 0.3363273, 1, 0, 0.8705882, 1,
1.056678, 2.0096, 0.2647619, 1, 0, 0.8627451, 1,
1.060314, -0.1903934, 1.494542, 1, 0, 0.8588235, 1,
1.061367, -0.02719405, 1.731267, 1, 0, 0.8509804, 1,
1.061741, 0.9739978, 2.522675, 1, 0, 0.8470588, 1,
1.063105, 0.9807851, 1.795345, 1, 0, 0.8392157, 1,
1.064094, -1.413708, 0.3931858, 1, 0, 0.8352941, 1,
1.06491, 0.620051, 0.2713937, 1, 0, 0.827451, 1,
1.070783, 1.853134, 0.3968177, 1, 0, 0.8235294, 1,
1.071434, 0.9509291, 1.484927, 1, 0, 0.8156863, 1,
1.07974, 0.261184, 2.19365, 1, 0, 0.8117647, 1,
1.085301, -1.590436, 0.1820057, 1, 0, 0.8039216, 1,
1.098783, -0.6295392, 2.29654, 1, 0, 0.7960784, 1,
1.101431, -0.9997493, 0.7447606, 1, 0, 0.7921569, 1,
1.101802, -1.408761, 3.18217, 1, 0, 0.7843137, 1,
1.102583, 0.03633416, 2.864356, 1, 0, 0.7803922, 1,
1.106038, 1.379454, 0.6843475, 1, 0, 0.772549, 1,
1.114602, -0.929996, 2.67257, 1, 0, 0.7686275, 1,
1.117324, -1.149087, 1.495313, 1, 0, 0.7607843, 1,
1.118303, -0.5514616, 3.229962, 1, 0, 0.7568628, 1,
1.119141, 1.313693, 2.277035, 1, 0, 0.7490196, 1,
1.138993, 0.5197687, 1.709536, 1, 0, 0.7450981, 1,
1.147815, 0.7843189, 1.657146, 1, 0, 0.7372549, 1,
1.159134, 1.311039, 0.2568427, 1, 0, 0.7333333, 1,
1.166846, 0.485029, 1.276815, 1, 0, 0.7254902, 1,
1.168121, -0.4862221, 1.737198, 1, 0, 0.7215686, 1,
1.174169, -1.526872, 2.623094, 1, 0, 0.7137255, 1,
1.183802, -0.1473098, 2.542095, 1, 0, 0.7098039, 1,
1.185452, 2.022553, 0.4592874, 1, 0, 0.7019608, 1,
1.194579, -0.8682756, 1.035738, 1, 0, 0.6941177, 1,
1.229635, 0.1154194, 2.341352, 1, 0, 0.6901961, 1,
1.230787, -0.9936253, 1.787563, 1, 0, 0.682353, 1,
1.239908, 0.3978161, 0.7916054, 1, 0, 0.6784314, 1,
1.23994, 0.1700688, -0.0156317, 1, 0, 0.6705883, 1,
1.240577, -1.413555, 2.471317, 1, 0, 0.6666667, 1,
1.246698, 0.3836206, 2.969662, 1, 0, 0.6588235, 1,
1.26101, 0.6928536, 0.3340344, 1, 0, 0.654902, 1,
1.261424, 1.587641, 0.8030113, 1, 0, 0.6470588, 1,
1.26666, 0.4252691, 0.8365306, 1, 0, 0.6431373, 1,
1.268447, -1.837509, 3.819136, 1, 0, 0.6352941, 1,
1.273459, -0.2020217, 3.666656, 1, 0, 0.6313726, 1,
1.280142, 1.100158, 0.7592101, 1, 0, 0.6235294, 1,
1.281894, -0.4995429, 2.760671, 1, 0, 0.6196079, 1,
1.286697, -1.648517, 3.345753, 1, 0, 0.6117647, 1,
1.294356, -0.991833, 1.691241, 1, 0, 0.6078432, 1,
1.302188, -1.046985, 2.122193, 1, 0, 0.6, 1,
1.303785, 0.2550768, 0.7766412, 1, 0, 0.5921569, 1,
1.306691, 0.4003432, 1.215551, 1, 0, 0.5882353, 1,
1.308009, -0.4222859, 1.863621, 1, 0, 0.5803922, 1,
1.314188, -0.556491, 3.72121, 1, 0, 0.5764706, 1,
1.316015, 1.246721, 1.147564, 1, 0, 0.5686275, 1,
1.322758, -1.731937, 4.667181, 1, 0, 0.5647059, 1,
1.327573, -1.416713, 3.327833, 1, 0, 0.5568628, 1,
1.332795, 0.06841574, -0.6255491, 1, 0, 0.5529412, 1,
1.333515, 0.6138698, 1.292806, 1, 0, 0.5450981, 1,
1.347511, -0.04843324, 0.8423432, 1, 0, 0.5411765, 1,
1.355419, 0.5425923, 1.518294, 1, 0, 0.5333334, 1,
1.364946, -0.8881588, 1.646423, 1, 0, 0.5294118, 1,
1.368887, -0.7008855, 3.175089, 1, 0, 0.5215687, 1,
1.378256, -0.5609441, 1.387295, 1, 0, 0.5176471, 1,
1.381145, 1.621988, 1.473336, 1, 0, 0.509804, 1,
1.388456, 0.6680238, 1.319101, 1, 0, 0.5058824, 1,
1.392061, -0.6140754, 3.342578, 1, 0, 0.4980392, 1,
1.401387, -0.9882576, 3.319532, 1, 0, 0.4901961, 1,
1.412105, -0.3498985, 0.9619575, 1, 0, 0.4862745, 1,
1.422966, -1.40629, 1.659905, 1, 0, 0.4784314, 1,
1.423812, 1.420247, 0.03860858, 1, 0, 0.4745098, 1,
1.424943, -0.2233951, -0.3306761, 1, 0, 0.4666667, 1,
1.42543, 0.8362483, 1.24708, 1, 0, 0.4627451, 1,
1.42627, 2.153096, 2.175561, 1, 0, 0.454902, 1,
1.439786, -0.2923853, 1.302969, 1, 0, 0.4509804, 1,
1.453538, -0.6129134, 1.755126, 1, 0, 0.4431373, 1,
1.463553, -0.1978512, 1.437009, 1, 0, 0.4392157, 1,
1.471308, -0.820003, 1.569305, 1, 0, 0.4313726, 1,
1.473678, 0.1201621, 4.036782, 1, 0, 0.427451, 1,
1.475423, -1.344328, 2.593866, 1, 0, 0.4196078, 1,
1.477298, 1.539783, 0.8407833, 1, 0, 0.4156863, 1,
1.485422, -0.9432955, 1.287343, 1, 0, 0.4078431, 1,
1.499193, -0.1340356, 0.01079998, 1, 0, 0.4039216, 1,
1.511187, -0.7317752, 2.677708, 1, 0, 0.3960784, 1,
1.512184, 1.125061, 1.48481, 1, 0, 0.3882353, 1,
1.51937, -0.4841006, 1.004207, 1, 0, 0.3843137, 1,
1.532392, -1.817727, 2.957504, 1, 0, 0.3764706, 1,
1.550242, -1.620635, 2.932959, 1, 0, 0.372549, 1,
1.555091, -0.7969456, 1.982665, 1, 0, 0.3647059, 1,
1.595492, -0.1215928, 2.590737, 1, 0, 0.3607843, 1,
1.603351, -0.5707834, 2.723745, 1, 0, 0.3529412, 1,
1.60612, -0.1387961, 1.938147, 1, 0, 0.3490196, 1,
1.615078, -0.3814961, 2.300558, 1, 0, 0.3411765, 1,
1.623521, 1.32536, 1.99916, 1, 0, 0.3372549, 1,
1.63107, -1.255373, 2.966604, 1, 0, 0.3294118, 1,
1.655482, 0.2709889, 0.1760454, 1, 0, 0.3254902, 1,
1.675683, -0.5714542, 2.330413, 1, 0, 0.3176471, 1,
1.679324, 0.6690436, 2.185273, 1, 0, 0.3137255, 1,
1.679804, -1.09527, 2.69238, 1, 0, 0.3058824, 1,
1.684655, -0.4546473, -0.1028599, 1, 0, 0.2980392, 1,
1.700965, 0.4138692, -0.5877075, 1, 0, 0.2941177, 1,
1.704126, 0.4003694, 1.28381, 1, 0, 0.2862745, 1,
1.712968, -1.579603, 0.7749972, 1, 0, 0.282353, 1,
1.730145, 0.9140882, 1.59503, 1, 0, 0.2745098, 1,
1.747961, 1.632263, -1.190242, 1, 0, 0.2705882, 1,
1.749497, -0.9558869, 2.952254, 1, 0, 0.2627451, 1,
1.753982, 0.03369023, 2.042894, 1, 0, 0.2588235, 1,
1.755244, -0.8390231, 1.292646, 1, 0, 0.2509804, 1,
1.761615, -0.5584899, 2.087159, 1, 0, 0.2470588, 1,
1.766209, -0.2089499, 1.602649, 1, 0, 0.2392157, 1,
1.778781, 0.2874681, 2.436596, 1, 0, 0.2352941, 1,
1.784789, 0.2574225, 1.664784, 1, 0, 0.227451, 1,
1.790711, -1.42045, 2.371722, 1, 0, 0.2235294, 1,
1.818629, 1.041246, 1.057164, 1, 0, 0.2156863, 1,
1.871368, -1.278512, 3.161535, 1, 0, 0.2117647, 1,
1.904708, 0.4396259, 1.220445, 1, 0, 0.2039216, 1,
1.909695, -0.160749, 1.31614, 1, 0, 0.1960784, 1,
1.911155, 0.5671664, 0.2965253, 1, 0, 0.1921569, 1,
1.955783, -1.460887, 2.566889, 1, 0, 0.1843137, 1,
1.964936, -1.26848, 1.880715, 1, 0, 0.1803922, 1,
1.979839, -1.771703, 2.138717, 1, 0, 0.172549, 1,
1.982993, 0.2100093, -0.06807617, 1, 0, 0.1686275, 1,
1.991872, -0.6851141, 0.2263049, 1, 0, 0.1607843, 1,
1.996624, -0.03079103, 0.8756883, 1, 0, 0.1568628, 1,
2.007436, 0.2290141, 0.9771842, 1, 0, 0.1490196, 1,
2.021848, -1.040267, 2.491433, 1, 0, 0.145098, 1,
2.035668, 0.4466889, 2.142718, 1, 0, 0.1372549, 1,
2.076106, -0.1109429, 0.9724063, 1, 0, 0.1333333, 1,
2.093828, 2.260789, 0.5632105, 1, 0, 0.1254902, 1,
2.101681, -0.2193597, 2.289032, 1, 0, 0.1215686, 1,
2.102139, 0.6968389, -0.4251706, 1, 0, 0.1137255, 1,
2.104896, -1.024058, 2.302254, 1, 0, 0.1098039, 1,
2.110431, 0.3374341, 0.8499984, 1, 0, 0.1019608, 1,
2.122203, 1.114257, 1.094368, 1, 0, 0.09411765, 1,
2.125012, -0.7736734, 1.543974, 1, 0, 0.09019608, 1,
2.134239, 1.786243, 0.2576418, 1, 0, 0.08235294, 1,
2.135356, -0.2282792, 1.957254, 1, 0, 0.07843138, 1,
2.171367, -0.1891417, 0.6137905, 1, 0, 0.07058824, 1,
2.214451, -1.16389, 1.454506, 1, 0, 0.06666667, 1,
2.28382, -0.9011738, 1.176521, 1, 0, 0.05882353, 1,
2.329551, 0.1003181, 3.641213, 1, 0, 0.05490196, 1,
2.409742, -0.9807775, 2.555392, 1, 0, 0.04705882, 1,
2.415086, 0.4524315, 1.682397, 1, 0, 0.04313726, 1,
2.470461, -1.872103, 1.592484, 1, 0, 0.03529412, 1,
2.504695, 0.09066004, 0.888284, 1, 0, 0.03137255, 1,
2.554859, -0.353289, 2.424606, 1, 0, 0.02352941, 1,
2.558342, 0.5039366, 0.6532102, 1, 0, 0.01960784, 1,
2.641834, -1.578479, 1.493081, 1, 0, 0.01176471, 1,
2.814442, -2.154403, 2.37997, 1, 0, 0.007843138, 1
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
-0.1435136, -4.251369, -6.666869, 0, -0.5, 0.5, 0.5,
-0.1435136, -4.251369, -6.666869, 1, -0.5, 0.5, 0.5,
-0.1435136, -4.251369, -6.666869, 1, 1.5, 0.5, 0.5,
-0.1435136, -4.251369, -6.666869, 0, 1.5, 0.5, 0.5
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
-4.104217, -0.064466, -6.666869, 0, -0.5, 0.5, 0.5,
-4.104217, -0.064466, -6.666869, 1, -0.5, 0.5, 0.5,
-4.104217, -0.064466, -6.666869, 1, 1.5, 0.5, 0.5,
-4.104217, -0.064466, -6.666869, 0, 1.5, 0.5, 0.5
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
-4.104217, -4.251369, 0.1082201, 0, -0.5, 0.5, 0.5,
-4.104217, -4.251369, 0.1082201, 1, -0.5, 0.5, 0.5,
-4.104217, -4.251369, 0.1082201, 1, 1.5, 0.5, 0.5,
-4.104217, -4.251369, 0.1082201, 0, 1.5, 0.5, 0.5
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
-3, -3.285161, -5.103387,
2, -3.285161, -5.103387,
-3, -3.285161, -5.103387,
-3, -3.446195, -5.363967,
-2, -3.285161, -5.103387,
-2, -3.446195, -5.363967,
-1, -3.285161, -5.103387,
-1, -3.446195, -5.363967,
0, -3.285161, -5.103387,
0, -3.446195, -5.363967,
1, -3.285161, -5.103387,
1, -3.446195, -5.363967,
2, -3.285161, -5.103387,
2, -3.446195, -5.363967
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
-3, -3.768265, -5.885128, 0, -0.5, 0.5, 0.5,
-3, -3.768265, -5.885128, 1, -0.5, 0.5, 0.5,
-3, -3.768265, -5.885128, 1, 1.5, 0.5, 0.5,
-3, -3.768265, -5.885128, 0, 1.5, 0.5, 0.5,
-2, -3.768265, -5.885128, 0, -0.5, 0.5, 0.5,
-2, -3.768265, -5.885128, 1, -0.5, 0.5, 0.5,
-2, -3.768265, -5.885128, 1, 1.5, 0.5, 0.5,
-2, -3.768265, -5.885128, 0, 1.5, 0.5, 0.5,
-1, -3.768265, -5.885128, 0, -0.5, 0.5, 0.5,
-1, -3.768265, -5.885128, 1, -0.5, 0.5, 0.5,
-1, -3.768265, -5.885128, 1, 1.5, 0.5, 0.5,
-1, -3.768265, -5.885128, 0, 1.5, 0.5, 0.5,
0, -3.768265, -5.885128, 0, -0.5, 0.5, 0.5,
0, -3.768265, -5.885128, 1, -0.5, 0.5, 0.5,
0, -3.768265, -5.885128, 1, 1.5, 0.5, 0.5,
0, -3.768265, -5.885128, 0, 1.5, 0.5, 0.5,
1, -3.768265, -5.885128, 0, -0.5, 0.5, 0.5,
1, -3.768265, -5.885128, 1, -0.5, 0.5, 0.5,
1, -3.768265, -5.885128, 1, 1.5, 0.5, 0.5,
1, -3.768265, -5.885128, 0, 1.5, 0.5, 0.5,
2, -3.768265, -5.885128, 0, -0.5, 0.5, 0.5,
2, -3.768265, -5.885128, 1, -0.5, 0.5, 0.5,
2, -3.768265, -5.885128, 1, 1.5, 0.5, 0.5,
2, -3.768265, -5.885128, 0, 1.5, 0.5, 0.5
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
-3.190208, -3, -5.103387,
-3.190208, 3, -5.103387,
-3.190208, -3, -5.103387,
-3.342543, -3, -5.363967,
-3.190208, -2, -5.103387,
-3.342543, -2, -5.363967,
-3.190208, -1, -5.103387,
-3.342543, -1, -5.363967,
-3.190208, 0, -5.103387,
-3.342543, 0, -5.363967,
-3.190208, 1, -5.103387,
-3.342543, 1, -5.363967,
-3.190208, 2, -5.103387,
-3.342543, 2, -5.363967,
-3.190208, 3, -5.103387,
-3.342543, 3, -5.363967
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
-3.647213, -3, -5.885128, 0, -0.5, 0.5, 0.5,
-3.647213, -3, -5.885128, 1, -0.5, 0.5, 0.5,
-3.647213, -3, -5.885128, 1, 1.5, 0.5, 0.5,
-3.647213, -3, -5.885128, 0, 1.5, 0.5, 0.5,
-3.647213, -2, -5.885128, 0, -0.5, 0.5, 0.5,
-3.647213, -2, -5.885128, 1, -0.5, 0.5, 0.5,
-3.647213, -2, -5.885128, 1, 1.5, 0.5, 0.5,
-3.647213, -2, -5.885128, 0, 1.5, 0.5, 0.5,
-3.647213, -1, -5.885128, 0, -0.5, 0.5, 0.5,
-3.647213, -1, -5.885128, 1, -0.5, 0.5, 0.5,
-3.647213, -1, -5.885128, 1, 1.5, 0.5, 0.5,
-3.647213, -1, -5.885128, 0, 1.5, 0.5, 0.5,
-3.647213, 0, -5.885128, 0, -0.5, 0.5, 0.5,
-3.647213, 0, -5.885128, 1, -0.5, 0.5, 0.5,
-3.647213, 0, -5.885128, 1, 1.5, 0.5, 0.5,
-3.647213, 0, -5.885128, 0, 1.5, 0.5, 0.5,
-3.647213, 1, -5.885128, 0, -0.5, 0.5, 0.5,
-3.647213, 1, -5.885128, 1, -0.5, 0.5, 0.5,
-3.647213, 1, -5.885128, 1, 1.5, 0.5, 0.5,
-3.647213, 1, -5.885128, 0, 1.5, 0.5, 0.5,
-3.647213, 2, -5.885128, 0, -0.5, 0.5, 0.5,
-3.647213, 2, -5.885128, 1, -0.5, 0.5, 0.5,
-3.647213, 2, -5.885128, 1, 1.5, 0.5, 0.5,
-3.647213, 2, -5.885128, 0, 1.5, 0.5, 0.5,
-3.647213, 3, -5.885128, 0, -0.5, 0.5, 0.5,
-3.647213, 3, -5.885128, 1, -0.5, 0.5, 0.5,
-3.647213, 3, -5.885128, 1, 1.5, 0.5, 0.5,
-3.647213, 3, -5.885128, 0, 1.5, 0.5, 0.5
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
-3.190208, -3.285161, -4,
-3.190208, -3.285161, 4,
-3.190208, -3.285161, -4,
-3.342543, -3.446195, -4,
-3.190208, -3.285161, -2,
-3.342543, -3.446195, -2,
-3.190208, -3.285161, 0,
-3.342543, -3.446195, 0,
-3.190208, -3.285161, 2,
-3.342543, -3.446195, 2,
-3.190208, -3.285161, 4,
-3.342543, -3.446195, 4
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
-3.647213, -3.768265, -4, 0, -0.5, 0.5, 0.5,
-3.647213, -3.768265, -4, 1, -0.5, 0.5, 0.5,
-3.647213, -3.768265, -4, 1, 1.5, 0.5, 0.5,
-3.647213, -3.768265, -4, 0, 1.5, 0.5, 0.5,
-3.647213, -3.768265, -2, 0, -0.5, 0.5, 0.5,
-3.647213, -3.768265, -2, 1, -0.5, 0.5, 0.5,
-3.647213, -3.768265, -2, 1, 1.5, 0.5, 0.5,
-3.647213, -3.768265, -2, 0, 1.5, 0.5, 0.5,
-3.647213, -3.768265, 0, 0, -0.5, 0.5, 0.5,
-3.647213, -3.768265, 0, 1, -0.5, 0.5, 0.5,
-3.647213, -3.768265, 0, 1, 1.5, 0.5, 0.5,
-3.647213, -3.768265, 0, 0, 1.5, 0.5, 0.5,
-3.647213, -3.768265, 2, 0, -0.5, 0.5, 0.5,
-3.647213, -3.768265, 2, 1, -0.5, 0.5, 0.5,
-3.647213, -3.768265, 2, 1, 1.5, 0.5, 0.5,
-3.647213, -3.768265, 2, 0, 1.5, 0.5, 0.5,
-3.647213, -3.768265, 4, 0, -0.5, 0.5, 0.5,
-3.647213, -3.768265, 4, 1, -0.5, 0.5, 0.5,
-3.647213, -3.768265, 4, 1, 1.5, 0.5, 0.5,
-3.647213, -3.768265, 4, 0, 1.5, 0.5, 0.5
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
-3.190208, -3.285161, -5.103387,
-3.190208, 3.156229, -5.103387,
-3.190208, -3.285161, 5.319827,
-3.190208, 3.156229, 5.319827,
-3.190208, -3.285161, -5.103387,
-3.190208, -3.285161, 5.319827,
-3.190208, 3.156229, -5.103387,
-3.190208, 3.156229, 5.319827,
-3.190208, -3.285161, -5.103387,
2.903181, -3.285161, -5.103387,
-3.190208, -3.285161, 5.319827,
2.903181, -3.285161, 5.319827,
-3.190208, 3.156229, -5.103387,
2.903181, 3.156229, -5.103387,
-3.190208, 3.156229, 5.319827,
2.903181, 3.156229, 5.319827,
2.903181, -3.285161, -5.103387,
2.903181, 3.156229, -5.103387,
2.903181, -3.285161, 5.319827,
2.903181, 3.156229, 5.319827,
2.903181, -3.285161, -5.103387,
2.903181, -3.285161, 5.319827,
2.903181, 3.156229, -5.103387,
2.903181, 3.156229, 5.319827
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
var radius = 7.307233;
var distance = 32.5107;
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
mvMatrix.translate( 0.1435136, 0.064466, -0.1082201 );
mvMatrix.scale( 1.296606, 1.226556, 0.757993 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.5107);
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
flurochloridone<-read.table("flurochloridone.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-flurochloridone$V2
```

```
## Error in eval(expr, envir, enclos): object 'flurochloridone' not found
```

```r
y<-flurochloridone$V3
```

```
## Error in eval(expr, envir, enclos): object 'flurochloridone' not found
```

```r
z<-flurochloridone$V4
```

```
## Error in eval(expr, envir, enclos): object 'flurochloridone' not found
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
-3.10147, -1.316338, -0.6924291, 0, 0, 1, 1, 1,
-2.876693, -0.5311034, -1.438813, 1, 0, 0, 1, 1,
-2.779989, -1.677524, -3.141727, 1, 0, 0, 1, 1,
-2.562278, -1.721768, -1.869651, 1, 0, 0, 1, 1,
-2.526149, 0.0229784, -2.159607, 1, 0, 0, 1, 1,
-2.514744, -1.201879, -1.700854, 1, 0, 0, 1, 1,
-2.487051, 0.7362896, -1.092064, 0, 0, 0, 1, 1,
-2.484182, -0.916662, -1.478187, 0, 0, 0, 1, 1,
-2.431947, -0.4481306, -1.347639, 0, 0, 0, 1, 1,
-2.41103, -0.3719107, -0.07024883, 0, 0, 0, 1, 1,
-2.350461, -0.1525833, -2.840384, 0, 0, 0, 1, 1,
-2.348604, -1.782792, -3.152568, 0, 0, 0, 1, 1,
-2.311045, -0.07559261, -2.781625, 0, 0, 0, 1, 1,
-2.308228, 1.203457, -0.1016866, 1, 1, 1, 1, 1,
-2.288115, 0.5101979, -0.4946656, 1, 1, 1, 1, 1,
-2.246539, -0.19018, -0.6037971, 1, 1, 1, 1, 1,
-2.236687, 1.103159, -0.87362, 1, 1, 1, 1, 1,
-2.22574, -0.3337469, -2.9106, 1, 1, 1, 1, 1,
-2.188174, 0.1955827, -2.760347, 1, 1, 1, 1, 1,
-2.171035, 0.3395333, -0.6191501, 1, 1, 1, 1, 1,
-2.161445, -1.981836, -2.026397, 1, 1, 1, 1, 1,
-2.139681, -0.2692866, -0.2996702, 1, 1, 1, 1, 1,
-2.066975, -0.6702036, -1.746946, 1, 1, 1, 1, 1,
-2.047531, 0.9556977, -0.1479557, 1, 1, 1, 1, 1,
-2.040136, -0.3176821, -1.625503, 1, 1, 1, 1, 1,
-2.039613, 0.944854, -0.2842561, 1, 1, 1, 1, 1,
-2.025915, -0.1000888, -1.497005, 1, 1, 1, 1, 1,
-1.991763, 0.6769388, -2.44741, 1, 1, 1, 1, 1,
-1.990384, 0.05676439, -1.951624, 0, 0, 1, 1, 1,
-1.983276, -0.6054756, -1.708226, 1, 0, 0, 1, 1,
-1.97486, -0.8253434, -1.099655, 1, 0, 0, 1, 1,
-1.955501, 0.6050356, -1.250926, 1, 0, 0, 1, 1,
-1.939721, 0.4834777, 0.4412635, 1, 0, 0, 1, 1,
-1.918845, -0.3008093, -0.683956, 1, 0, 0, 1, 1,
-1.914124, 1.21541, -1.349997, 0, 0, 0, 1, 1,
-1.897992, -0.4576272, -3.03322, 0, 0, 0, 1, 1,
-1.88636, -0.9779316, -1.430167, 0, 0, 0, 1, 1,
-1.857559, 0.9620457, -0.6004244, 0, 0, 0, 1, 1,
-1.843872, 1.758838, -1.503708, 0, 0, 0, 1, 1,
-1.822999, 1.058178, -1.617869, 0, 0, 0, 1, 1,
-1.821735, -2.729175, -3.261771, 0, 0, 0, 1, 1,
-1.818036, 0.4562795, -2.746775, 1, 1, 1, 1, 1,
-1.815776, 0.8495766, -0.7130172, 1, 1, 1, 1, 1,
-1.805, 0.1920889, -1.899715, 1, 1, 1, 1, 1,
-1.768032, -0.556308, -2.182486, 1, 1, 1, 1, 1,
-1.763148, 0.3438407, -1.539732, 1, 1, 1, 1, 1,
-1.75564, 0.2552962, -0.6947765, 1, 1, 1, 1, 1,
-1.749434, 1.703847, 0.4942894, 1, 1, 1, 1, 1,
-1.745295, 2.125112, -0.2591659, 1, 1, 1, 1, 1,
-1.728483, -0.988395, -2.360004, 1, 1, 1, 1, 1,
-1.712967, 1.132117, -2.337121, 1, 1, 1, 1, 1,
-1.709508, -0.01308624, -2.514047, 1, 1, 1, 1, 1,
-1.67716, -0.1484599, -2.353471, 1, 1, 1, 1, 1,
-1.667547, 1.112022, -1.199962, 1, 1, 1, 1, 1,
-1.661915, 0.1835737, 0.8401909, 1, 1, 1, 1, 1,
-1.653405, 0.2593066, -0.9971886, 1, 1, 1, 1, 1,
-1.651467, 1.139486, -1.082724, 0, 0, 1, 1, 1,
-1.646625, 1.044368, -1.747523, 1, 0, 0, 1, 1,
-1.639094, 0.3535545, -2.752999, 1, 0, 0, 1, 1,
-1.638926, -0.9667994, -1.136063, 1, 0, 0, 1, 1,
-1.62923, -1.054418, -4.521418, 1, 0, 0, 1, 1,
-1.619604, 0.01259729, -0.8933182, 1, 0, 0, 1, 1,
-1.615234, 0.6581887, -0.9986081, 0, 0, 0, 1, 1,
-1.61423, -0.9764026, -1.728335, 0, 0, 0, 1, 1,
-1.599636, -0.6376038, -0.8893908, 0, 0, 0, 1, 1,
-1.597213, 0.9439495, -0.6879646, 0, 0, 0, 1, 1,
-1.579006, -0.1123566, -0.4047652, 0, 0, 0, 1, 1,
-1.571914, -0.8419465, -0.2093635, 0, 0, 0, 1, 1,
-1.565403, 1.60128, 0.3218001, 0, 0, 0, 1, 1,
-1.549318, 0.1610213, -1.003248, 1, 1, 1, 1, 1,
-1.533141, 0.958755, -2.427702, 1, 1, 1, 1, 1,
-1.531429, 1.344562, -1.937429, 1, 1, 1, 1, 1,
-1.511875, -1.462864, -2.948699, 1, 1, 1, 1, 1,
-1.497337, 0.2867459, -1.183301, 1, 1, 1, 1, 1,
-1.489585, -0.374884, -1.766074, 1, 1, 1, 1, 1,
-1.472038, -1.121943, -1.809519, 1, 1, 1, 1, 1,
-1.464296, -0.2144972, -1.667294, 1, 1, 1, 1, 1,
-1.456158, -0.4945829, -1.959157, 1, 1, 1, 1, 1,
-1.449796, -0.0783384, -1.718232, 1, 1, 1, 1, 1,
-1.445851, -0.1490792, -1.913509, 1, 1, 1, 1, 1,
-1.43848, -0.3190201, -2.609988, 1, 1, 1, 1, 1,
-1.417669, 1.111627, 0.04222629, 1, 1, 1, 1, 1,
-1.417273, 0.5994961, -0.01374563, 1, 1, 1, 1, 1,
-1.414366, -0.5588365, -1.161776, 1, 1, 1, 1, 1,
-1.405609, 0.05300157, -0.6199093, 0, 0, 1, 1, 1,
-1.405339, -0.4750289, -0.1449555, 1, 0, 0, 1, 1,
-1.403268, -1.133673, -1.000366, 1, 0, 0, 1, 1,
-1.401181, 0.3403228, -1.368612, 1, 0, 0, 1, 1,
-1.396118, 0.4073149, -1.434306, 1, 0, 0, 1, 1,
-1.390119, -0.3637986, -2.686684, 1, 0, 0, 1, 1,
-1.38951, 0.6750927, 0.4397076, 0, 0, 0, 1, 1,
-1.366494, -0.9600227, -1.770493, 0, 0, 0, 1, 1,
-1.355973, -0.60918, -1.071243, 0, 0, 0, 1, 1,
-1.3519, -0.3556503, -1.768268, 0, 0, 0, 1, 1,
-1.351289, 1.592056, -1.235938, 0, 0, 0, 1, 1,
-1.351085, -0.670812, -1.847941, 0, 0, 0, 1, 1,
-1.348117, 0.9393017, -2.345536, 0, 0, 0, 1, 1,
-1.341493, -0.3070449, -0.3581715, 1, 1, 1, 1, 1,
-1.338004, -1.465079, -2.9992, 1, 1, 1, 1, 1,
-1.328657, -0.4804618, -2.98739, 1, 1, 1, 1, 1,
-1.328572, -0.8688669, -1.605453, 1, 1, 1, 1, 1,
-1.326778, -0.3919074, -1.999619, 1, 1, 1, 1, 1,
-1.318438, -0.8675625, -1.831726, 1, 1, 1, 1, 1,
-1.317838, -0.1133102, -1.18781, 1, 1, 1, 1, 1,
-1.314053, 0.709752, -0.4353202, 1, 1, 1, 1, 1,
-1.285441, 1.108758, -0.07757317, 1, 1, 1, 1, 1,
-1.283756, -0.09682579, -0.07163028, 1, 1, 1, 1, 1,
-1.271158, -1.253599, -1.49879, 1, 1, 1, 1, 1,
-1.261672, 0.5428702, -1.791157, 1, 1, 1, 1, 1,
-1.241496, -0.992204, -2.996674, 1, 1, 1, 1, 1,
-1.237558, 0.3634616, -2.24411, 1, 1, 1, 1, 1,
-1.234027, -2.133338, -2.960527, 1, 1, 1, 1, 1,
-1.229378, -0.005631807, -2.354986, 0, 0, 1, 1, 1,
-1.228076, 0.3249752, -1.250037, 1, 0, 0, 1, 1,
-1.207985, -0.8706338, -1.752168, 1, 0, 0, 1, 1,
-1.200233, 0.4065137, -1.148772, 1, 0, 0, 1, 1,
-1.192301, 0.5694719, 0.407959, 1, 0, 0, 1, 1,
-1.190037, 0.1026881, -1.962166, 1, 0, 0, 1, 1,
-1.187743, -0.4030998, -3.548023, 0, 0, 0, 1, 1,
-1.18298, -1.785933, -2.601452, 0, 0, 0, 1, 1,
-1.18108, 0.4142266, -1.191653, 0, 0, 0, 1, 1,
-1.172603, 0.9660856, -0.5979244, 0, 0, 0, 1, 1,
-1.1703, -2.604918, -3.573262, 0, 0, 0, 1, 1,
-1.165788, 0.457602, -0.1418927, 0, 0, 0, 1, 1,
-1.163636, 1.256935, -1.393616, 0, 0, 0, 1, 1,
-1.161701, -0.881568, -3.226183, 1, 1, 1, 1, 1,
-1.160722, -1.0127, -4.371984, 1, 1, 1, 1, 1,
-1.154698, -1.917444, -1.864606, 1, 1, 1, 1, 1,
-1.142091, -1.15021, -3.388015, 1, 1, 1, 1, 1,
-1.135004, 0.1466083, -0.7150803, 1, 1, 1, 1, 1,
-1.13064, -1.126782, -1.822529, 1, 1, 1, 1, 1,
-1.126286, 1.623963, -2.545673, 1, 1, 1, 1, 1,
-1.123582, 1.132611, -0.6759517, 1, 1, 1, 1, 1,
-1.117357, 0.1151896, -1.162741, 1, 1, 1, 1, 1,
-1.113747, -0.6298162, -2.309527, 1, 1, 1, 1, 1,
-1.113185, 1.165867, -0.1986728, 1, 1, 1, 1, 1,
-1.112845, 2.634012, -1.477842, 1, 1, 1, 1, 1,
-1.108146, -1.386444, -1.172893, 1, 1, 1, 1, 1,
-1.107344, -1.698112, -3.409016, 1, 1, 1, 1, 1,
-1.09963, -0.4308109, -2.021698, 1, 1, 1, 1, 1,
-1.096691, 0.03285174, -0.5118119, 0, 0, 1, 1, 1,
-1.091842, 0.8594701, -0.5310104, 1, 0, 0, 1, 1,
-1.089534, 1.150234, -2.122571, 1, 0, 0, 1, 1,
-1.075865, 1.110992, -0.6436444, 1, 0, 0, 1, 1,
-1.070901, 1.67068, -2.295108, 1, 0, 0, 1, 1,
-1.069213, 0.777038, 0.08781821, 1, 0, 0, 1, 1,
-1.055927, -0.09961882, -2.667237, 0, 0, 0, 1, 1,
-1.05295, -0.7075517, -2.650474, 0, 0, 0, 1, 1,
-1.05274, -0.005726252, -0.4543666, 0, 0, 0, 1, 1,
-1.041549, -0.09096947, -2.836898, 0, 0, 0, 1, 1,
-1.038662, 0.1561354, -2.763397, 0, 0, 0, 1, 1,
-1.038443, 0.3324528, -2.312825, 0, 0, 0, 1, 1,
-1.035322, -0.0221603, -0.285915, 0, 0, 0, 1, 1,
-1.030774, -2.392582, -2.166511, 1, 1, 1, 1, 1,
-1.030309, -0.1662958, 0.9065142, 1, 1, 1, 1, 1,
-1.027853, -1.052301, -3.010254, 1, 1, 1, 1, 1,
-1.027354, 0.2989039, -1.193921, 1, 1, 1, 1, 1,
-1.023748, -0.6885707, -3.16188, 1, 1, 1, 1, 1,
-1.01799, 1.170471, -0.9583414, 1, 1, 1, 1, 1,
-1.01584, -1.231078, -1.582757, 1, 1, 1, 1, 1,
-1.015307, 0.5140222, -0.866767, 1, 1, 1, 1, 1,
-1.012724, -1.567629, -2.92855, 1, 1, 1, 1, 1,
-1.006445, 0.2652644, -0.7080657, 1, 1, 1, 1, 1,
-1.000618, -0.6824193, -2.14721, 1, 1, 1, 1, 1,
-0.9946419, 0.5407176, 0.1925401, 1, 1, 1, 1, 1,
-0.9923837, 0.2943268, -0.8200191, 1, 1, 1, 1, 1,
-0.9809608, -1.665765, -1.316628, 1, 1, 1, 1, 1,
-0.9793761, 0.08387956, 0.3366854, 1, 1, 1, 1, 1,
-0.9783571, -2.898035, -3.387294, 0, 0, 1, 1, 1,
-0.9762079, -0.5230474, -1.148837, 1, 0, 0, 1, 1,
-0.9624185, 1.9915, -0.2590363, 1, 0, 0, 1, 1,
-0.9595289, -1.01476, -1.516797, 1, 0, 0, 1, 1,
-0.9575227, -1.025891, -0.9702379, 1, 0, 0, 1, 1,
-0.9572198, 1.263091, 0.9482, 1, 0, 0, 1, 1,
-0.9545237, 1.040658, -0.4263083, 0, 0, 0, 1, 1,
-0.94879, 0.3846253, -2.884628, 0, 0, 0, 1, 1,
-0.9383351, -0.4784329, -1.171013, 0, 0, 0, 1, 1,
-0.9365476, -0.2877072, -1.982343, 0, 0, 0, 1, 1,
-0.9185731, 1.679474, -1.66842, 0, 0, 0, 1, 1,
-0.9146325, -0.6708665, -2.033783, 0, 0, 0, 1, 1,
-0.9132234, 0.6191242, -0.9207289, 0, 0, 0, 1, 1,
-0.9121761, 0.3718314, -2.116753, 1, 1, 1, 1, 1,
-0.910457, -0.811551, -3.239642, 1, 1, 1, 1, 1,
-0.9056195, 0.8406239, -1.225603, 1, 1, 1, 1, 1,
-0.8997723, -0.3879366, -4.505987, 1, 1, 1, 1, 1,
-0.8951718, 1.156791, 0.8771113, 1, 1, 1, 1, 1,
-0.8942936, 0.1461087, -2.493276, 1, 1, 1, 1, 1,
-0.8914206, -1.296444, -3.047356, 1, 1, 1, 1, 1,
-0.8911701, 3.062422, -0.4977942, 1, 1, 1, 1, 1,
-0.8896545, 0.8098264, -1.892886, 1, 1, 1, 1, 1,
-0.8892604, 1.070974, -1.186682, 1, 1, 1, 1, 1,
-0.8884631, 0.7983568, 0.02349824, 1, 1, 1, 1, 1,
-0.8858901, -0.9769443, -2.908007, 1, 1, 1, 1, 1,
-0.8845136, -1.018438, -2.423187, 1, 1, 1, 1, 1,
-0.8707444, -0.33415, -2.649236, 1, 1, 1, 1, 1,
-0.8670643, 0.1351446, -0.560118, 1, 1, 1, 1, 1,
-0.8643805, -0.2014756, -0.6656443, 0, 0, 1, 1, 1,
-0.8523256, -0.06981303, -0.9619033, 1, 0, 0, 1, 1,
-0.8518118, -0.7299981, -0.7645094, 1, 0, 0, 1, 1,
-0.8490281, -0.2164703, -2.69995, 1, 0, 0, 1, 1,
-0.8421452, -1.84242, -2.157845, 1, 0, 0, 1, 1,
-0.8374518, 0.02325596, -1.274234, 1, 0, 0, 1, 1,
-0.8331461, -0.8014617, -2.711091, 0, 0, 0, 1, 1,
-0.8237824, 1.221307, -0.7501647, 0, 0, 0, 1, 1,
-0.8223107, 1.205732, -0.8722492, 0, 0, 0, 1, 1,
-0.8218472, 2.056014, 0.7430327, 0, 0, 0, 1, 1,
-0.8211861, -1.569291, -2.646003, 0, 0, 0, 1, 1,
-0.820961, 0.3023971, -0.1679035, 0, 0, 0, 1, 1,
-0.8208349, 0.5733784, -0.197129, 0, 0, 0, 1, 1,
-0.8197187, 1.323228, 0.2793594, 1, 1, 1, 1, 1,
-0.8175623, 0.06691943, -1.242228, 1, 1, 1, 1, 1,
-0.8094555, 1.299686, -1.214016, 1, 1, 1, 1, 1,
-0.8025261, -0.7719768, -2.061013, 1, 1, 1, 1, 1,
-0.7996271, -1.694597, -1.83941, 1, 1, 1, 1, 1,
-0.7952474, -0.4485472, -2.674828, 1, 1, 1, 1, 1,
-0.7944176, 0.1209756, -1.255066, 1, 1, 1, 1, 1,
-0.7907552, 0.3496002, -1.25577, 1, 1, 1, 1, 1,
-0.7907535, 1.360342, -0.4364909, 1, 1, 1, 1, 1,
-0.7849082, 0.6934648, 0.3541051, 1, 1, 1, 1, 1,
-0.7831147, -0.9167207, -3.184278, 1, 1, 1, 1, 1,
-0.7825718, -0.5554073, -2.839447, 1, 1, 1, 1, 1,
-0.7778647, -0.4331283, -1.762235, 1, 1, 1, 1, 1,
-0.7761313, 0.8916788, -1.027662, 1, 1, 1, 1, 1,
-0.7758936, -0.5213916, -3.280398, 1, 1, 1, 1, 1,
-0.7733198, -1.33509, -2.411976, 0, 0, 1, 1, 1,
-0.7615469, 0.5930264, -0.1105277, 1, 0, 0, 1, 1,
-0.7548847, 0.7409612, -1.278826, 1, 0, 0, 1, 1,
-0.7478257, -1.207662, -3.135941, 1, 0, 0, 1, 1,
-0.7421803, -0.3283903, -4.005474, 1, 0, 0, 1, 1,
-0.7347863, 0.01503751, -3.116198, 1, 0, 0, 1, 1,
-0.7318789, -0.9028625, -3.234767, 0, 0, 0, 1, 1,
-0.7316836, 0.1275026, -0.4251477, 0, 0, 0, 1, 1,
-0.7305105, 0.09232528, -2.400424, 0, 0, 0, 1, 1,
-0.7265027, -0.3844439, -3.029253, 0, 0, 0, 1, 1,
-0.7200404, -1.141845, -2.267452, 0, 0, 0, 1, 1,
-0.719594, 2.033104, -0.3641337, 0, 0, 0, 1, 1,
-0.7187234, -0.2582801, -2.17672, 0, 0, 0, 1, 1,
-0.7122628, -0.07808812, -2.621324, 1, 1, 1, 1, 1,
-0.7100264, 0.07589184, -0.949201, 1, 1, 1, 1, 1,
-0.7060094, 0.1603133, -2.581431, 1, 1, 1, 1, 1,
-0.705517, 0.04815969, -1.824529, 1, 1, 1, 1, 1,
-0.7053108, 0.163376, -1.755055, 1, 1, 1, 1, 1,
-0.6981606, -1.555132, -3.235298, 1, 1, 1, 1, 1,
-0.6913199, 0.3210349, -1.449348, 1, 1, 1, 1, 1,
-0.6911002, -0.8160993, -1.147254, 1, 1, 1, 1, 1,
-0.6882327, 0.9085467, -0.7313838, 1, 1, 1, 1, 1,
-0.6868376, 0.1516196, -1.539161, 1, 1, 1, 1, 1,
-0.6865163, -1.187221, -0.2260116, 1, 1, 1, 1, 1,
-0.686121, -0.7742363, -1.65812, 1, 1, 1, 1, 1,
-0.6783196, -0.9033735, -4.693799, 1, 1, 1, 1, 1,
-0.6781333, 0.8445873, 1.223401, 1, 1, 1, 1, 1,
-0.6769999, -1.696259, -2.148228, 1, 1, 1, 1, 1,
-0.6762927, -0.002533034, -2.80863, 0, 0, 1, 1, 1,
-0.6760799, -1.36227, -2.274145, 1, 0, 0, 1, 1,
-0.6741006, 0.5965416, -0.5505598, 1, 0, 0, 1, 1,
-0.6724641, -0.1249348, -2.444071, 1, 0, 0, 1, 1,
-0.6705582, -0.1542046, 0.9067159, 1, 0, 0, 1, 1,
-0.667576, 0.8902548, -0.4458479, 1, 0, 0, 1, 1,
-0.6654778, 1.119348, -0.4076551, 0, 0, 0, 1, 1,
-0.6631319, -1.604817, -2.737624, 0, 0, 0, 1, 1,
-0.6529196, 0.9799387, -0.3341687, 0, 0, 0, 1, 1,
-0.6477266, 1.088465, 0.2556443, 0, 0, 0, 1, 1,
-0.6463673, -0.2925019, -1.161555, 0, 0, 0, 1, 1,
-0.6454354, 1.572866, -1.13486, 0, 0, 0, 1, 1,
-0.6454328, 1.626754, 0.117981, 0, 0, 0, 1, 1,
-0.6443444, -0.4401008, -2.906252, 1, 1, 1, 1, 1,
-0.6438279, -1.10989, -2.222088, 1, 1, 1, 1, 1,
-0.633669, -1.353183, -2.939957, 1, 1, 1, 1, 1,
-0.6313266, -0.6202723, -2.215954, 1, 1, 1, 1, 1,
-0.6276846, -0.9843049, -0.7588654, 1, 1, 1, 1, 1,
-0.6276357, 1.028577, 0.0584974, 1, 1, 1, 1, 1,
-0.6238008, -0.6768607, -2.597669, 1, 1, 1, 1, 1,
-0.6213023, -0.1086601, -2.35169, 1, 1, 1, 1, 1,
-0.6192433, 1.365453, -0.8496168, 1, 1, 1, 1, 1,
-0.6171981, -1.427798, -1.505654, 1, 1, 1, 1, 1,
-0.6130107, 0.4063994, -0.7977681, 1, 1, 1, 1, 1,
-0.6092063, 1.044691, -1.700652, 1, 1, 1, 1, 1,
-0.6049418, 1.201773, 0.6482986, 1, 1, 1, 1, 1,
-0.6033076, -0.7034144, -2.02691, 1, 1, 1, 1, 1,
-0.598974, 0.9292066, 0.1247697, 1, 1, 1, 1, 1,
-0.5974851, 0.917235, -1.345554, 0, 0, 1, 1, 1,
-0.5955532, 1.306601, 1.868751, 1, 0, 0, 1, 1,
-0.5904102, -1.349061, -3.872012, 1, 0, 0, 1, 1,
-0.5866122, 0.1149386, -3.364414, 1, 0, 0, 1, 1,
-0.5832157, -0.8733317, -2.988484, 1, 0, 0, 1, 1,
-0.5780883, 1.360049, -1.888951, 1, 0, 0, 1, 1,
-0.5705344, 0.5510132, 1.889787, 0, 0, 0, 1, 1,
-0.5687815, 1.022378, -0.08680288, 0, 0, 0, 1, 1,
-0.5632104, -1.33638, -2.253498, 0, 0, 0, 1, 1,
-0.5619845, 0.441136, -1.659313, 0, 0, 0, 1, 1,
-0.5594437, -1.625396, -1.25445, 0, 0, 0, 1, 1,
-0.5586614, 0.9655015, -0.8000107, 0, 0, 0, 1, 1,
-0.5538558, -1.382157, -3.629567, 0, 0, 0, 1, 1,
-0.5532597, -1.764218, -1.682858, 1, 1, 1, 1, 1,
-0.5487635, 0.09707753, -2.593442, 1, 1, 1, 1, 1,
-0.5466684, 2.075719, 0.02443239, 1, 1, 1, 1, 1,
-0.5461563, 0.1161274, -1.129849, 1, 1, 1, 1, 1,
-0.5453853, -1.477897, -3.724971, 1, 1, 1, 1, 1,
-0.5446059, -0.773052, -2.933637, 1, 1, 1, 1, 1,
-0.5438899, -0.7797677, -4.36335, 1, 1, 1, 1, 1,
-0.5436049, -0.6955469, -2.611026, 1, 1, 1, 1, 1,
-0.5419084, 1.035816, -1.26456, 1, 1, 1, 1, 1,
-0.534973, -0.2156491, -1.440003, 1, 1, 1, 1, 1,
-0.5285118, 2.023653, 0.7769066, 1, 1, 1, 1, 1,
-0.5280012, 0.06049126, -1.957977, 1, 1, 1, 1, 1,
-0.5216485, -2.076863, -2.011122, 1, 1, 1, 1, 1,
-0.521152, 0.9156814, -1.236092, 1, 1, 1, 1, 1,
-0.5188538, 0.9590925, -0.1875321, 1, 1, 1, 1, 1,
-0.5166275, -0.5796689, -2.06541, 0, 0, 1, 1, 1,
-0.5120342, -0.2247939, -0.09153646, 1, 0, 0, 1, 1,
-0.5033302, 0.07196085, -1.587834, 1, 0, 0, 1, 1,
-0.4989741, 1.632027, 0.8386313, 1, 0, 0, 1, 1,
-0.4948586, -0.7338716, -2.099019, 1, 0, 0, 1, 1,
-0.4916081, 1.394664, 1.999045, 1, 0, 0, 1, 1,
-0.4908269, 0.518144, -2.392588, 0, 0, 0, 1, 1,
-0.4892155, -0.5437652, -2.301241, 0, 0, 0, 1, 1,
-0.4871811, 0.9383388, 0.4898278, 0, 0, 0, 1, 1,
-0.4836284, 0.4563995, -0.8907513, 0, 0, 0, 1, 1,
-0.482882, 0.5794123, -0.2996655, 0, 0, 0, 1, 1,
-0.4826781, 1.168265, -0.8085551, 0, 0, 0, 1, 1,
-0.4808303, 1.258865, 0.4851703, 0, 0, 0, 1, 1,
-0.4750977, -1.316967, -4.411262, 1, 1, 1, 1, 1,
-0.4719987, -0.667549, -4.511747, 1, 1, 1, 1, 1,
-0.466194, 0.8373374, -0.4056377, 1, 1, 1, 1, 1,
-0.4656847, 0.9957311, 0.5933297, 1, 1, 1, 1, 1,
-0.4609221, -0.6424527, -2.865097, 1, 1, 1, 1, 1,
-0.4608309, 0.01928303, -1.836272, 1, 1, 1, 1, 1,
-0.460223, 0.3688214, -0.6043769, 1, 1, 1, 1, 1,
-0.4579955, -0.2799281, -2.263856, 1, 1, 1, 1, 1,
-0.4536918, -0.1874483, -3.968563, 1, 1, 1, 1, 1,
-0.4519397, -0.8046377, -1.968079, 1, 1, 1, 1, 1,
-0.4498129, 1.387999, -1.134476, 1, 1, 1, 1, 1,
-0.4494284, 1.175667, -0.9760832, 1, 1, 1, 1, 1,
-0.4468977, 0.3007342, -0.113651, 1, 1, 1, 1, 1,
-0.4457758, -0.8125135, -3.337969, 1, 1, 1, 1, 1,
-0.445148, -1.028629, -3.674374, 1, 1, 1, 1, 1,
-0.441225, -0.6117201, -3.457199, 0, 0, 1, 1, 1,
-0.4394284, -1.342298, -1.876373, 1, 0, 0, 1, 1,
-0.4377873, 1.306451, -1.407098, 1, 0, 0, 1, 1,
-0.4335771, 1.007456, -0.2808791, 1, 0, 0, 1, 1,
-0.433105, -0.9963755, -2.589163, 1, 0, 0, 1, 1,
-0.4329267, -0.9472461, -4.293341, 1, 0, 0, 1, 1,
-0.4326574, 0.8388687, -0.8477711, 0, 0, 0, 1, 1,
-0.4305634, 2.122482, -1.123269, 0, 0, 0, 1, 1,
-0.4297494, 0.2160587, -0.5067551, 0, 0, 0, 1, 1,
-0.4290618, -0.7294534, -3.417333, 0, 0, 0, 1, 1,
-0.426771, -0.7324962, -2.227374, 0, 0, 0, 1, 1,
-0.4241024, 1.488448, 1.54333, 0, 0, 0, 1, 1,
-0.4235137, -1.890433, -3.667507, 0, 0, 0, 1, 1,
-0.422816, -0.1774516, -1.523015, 1, 1, 1, 1, 1,
-0.4145702, -0.3816504, -0.994505, 1, 1, 1, 1, 1,
-0.3961937, 1.76832, -1.215182, 1, 1, 1, 1, 1,
-0.3912574, -0.7294339, -0.6687639, 1, 1, 1, 1, 1,
-0.3863671, -0.8946549, -3.657618, 1, 1, 1, 1, 1,
-0.3821827, -2.077678, -3.924124, 1, 1, 1, 1, 1,
-0.3792741, -0.3014701, -2.388528, 1, 1, 1, 1, 1,
-0.3781006, -2.231654, -3.740633, 1, 1, 1, 1, 1,
-0.3778442, 1.235867, -0.04444419, 1, 1, 1, 1, 1,
-0.3768687, 0.8961556, -0.9243485, 1, 1, 1, 1, 1,
-0.3761248, -1.430495, -1.379528, 1, 1, 1, 1, 1,
-0.374852, -0.03193347, -3.543721, 1, 1, 1, 1, 1,
-0.3743604, -0.4923688, -3.702467, 1, 1, 1, 1, 1,
-0.3743134, 0.6617084, -1.474939, 1, 1, 1, 1, 1,
-0.3736251, 1.319342, -0.2015927, 1, 1, 1, 1, 1,
-0.372275, -1.845501, -2.005005, 0, 0, 1, 1, 1,
-0.3720317, 0.04002565, -1.425874, 1, 0, 0, 1, 1,
-0.369615, 0.3658776, 0.03700522, 1, 0, 0, 1, 1,
-0.3666295, -2.204872, -2.207244, 1, 0, 0, 1, 1,
-0.3657993, 0.07458262, -1.525139, 1, 0, 0, 1, 1,
-0.363887, -1.270098, -2.807479, 1, 0, 0, 1, 1,
-0.3629088, 0.02476112, -2.02481, 0, 0, 0, 1, 1,
-0.362056, 0.6047161, 0.2700753, 0, 0, 0, 1, 1,
-0.360727, -0.3186502, -0.6628572, 0, 0, 0, 1, 1,
-0.3587722, 0.1295515, -3.187212, 0, 0, 0, 1, 1,
-0.3565168, -0.5840819, -2.365324, 0, 0, 0, 1, 1,
-0.3529061, 0.7499855, -0.8790932, 0, 0, 0, 1, 1,
-0.3521092, -0.6642141, -1.753668, 0, 0, 0, 1, 1,
-0.3491327, -3.177277, -2.031083, 1, 1, 1, 1, 1,
-0.3489696, -0.07202163, -1.889745, 1, 1, 1, 1, 1,
-0.3474839, 0.3209125, 0.1445033, 1, 1, 1, 1, 1,
-0.3459536, -0.1779264, -3.118495, 1, 1, 1, 1, 1,
-0.3423443, -1.118453, -2.760871, 1, 1, 1, 1, 1,
-0.3421944, 0.8281702, 0.5246522, 1, 1, 1, 1, 1,
-0.3413724, -0.8436278, -2.159494, 1, 1, 1, 1, 1,
-0.3408485, 1.201604, 0.7577051, 1, 1, 1, 1, 1,
-0.3361838, -0.5379588, -1.836738, 1, 1, 1, 1, 1,
-0.3359313, -0.4821702, -2.004168, 1, 1, 1, 1, 1,
-0.3357328, 0.4074814, 0.2659367, 1, 1, 1, 1, 1,
-0.3336923, -1.428407, -3.568551, 1, 1, 1, 1, 1,
-0.3262152, 1.387547, -0.9457123, 1, 1, 1, 1, 1,
-0.3241929, -1.905184, -4.125381, 1, 1, 1, 1, 1,
-0.3231249, 0.5745351, -1.547048, 1, 1, 1, 1, 1,
-0.322871, -1.210653, -2.34305, 0, 0, 1, 1, 1,
-0.3211784, -1.311292, -2.589252, 1, 0, 0, 1, 1,
-0.3193263, -2.01669, -3.287773, 1, 0, 0, 1, 1,
-0.3153717, 1.158128, -0.1339396, 1, 0, 0, 1, 1,
-0.3131567, 0.1319909, -2.405619, 1, 0, 0, 1, 1,
-0.3059355, 2.073192, -0.6859205, 1, 0, 0, 1, 1,
-0.305389, -1.258033, -1.633953, 0, 0, 0, 1, 1,
-0.3052495, 1.23844, 0.3389023, 0, 0, 0, 1, 1,
-0.3045989, 1.32623, -1.468463, 0, 0, 0, 1, 1,
-0.301045, 0.1833833, 0.3456177, 0, 0, 0, 1, 1,
-0.2965623, -0.9517437, -2.077259, 0, 0, 0, 1, 1,
-0.2927353, -0.3545834, -1.256934, 0, 0, 0, 1, 1,
-0.2902115, 1.526618, -0.07555904, 0, 0, 0, 1, 1,
-0.2886728, -0.228198, -3.239274, 1, 1, 1, 1, 1,
-0.2866089, -0.2196777, -3.351655, 1, 1, 1, 1, 1,
-0.2814774, -1.185162, -3.707683, 1, 1, 1, 1, 1,
-0.2806994, -0.6758111, -2.809384, 1, 1, 1, 1, 1,
-0.2794258, 0.968401, 0.6208411, 1, 1, 1, 1, 1,
-0.2699882, -0.9440488, -2.337122, 1, 1, 1, 1, 1,
-0.2685624, -1.345466, -4.174464, 1, 1, 1, 1, 1,
-0.2657033, 0.5805086, 0.3969838, 1, 1, 1, 1, 1,
-0.2652676, 1.075027, -0.2865532, 1, 1, 1, 1, 1,
-0.2612511, -0.7710824, -3.892895, 1, 1, 1, 1, 1,
-0.2600069, -0.3015548, -1.807784, 1, 1, 1, 1, 1,
-0.2598609, -0.3087359, -1.225132, 1, 1, 1, 1, 1,
-0.2596973, 1.777407, -0.04111479, 1, 1, 1, 1, 1,
-0.2575127, -1.663841, -3.808635, 1, 1, 1, 1, 1,
-0.2561923, -2.055632, -2.719589, 1, 1, 1, 1, 1,
-0.2551777, -0.1258088, -2.993403, 0, 0, 1, 1, 1,
-0.2550271, -0.2901484, -1.091651, 1, 0, 0, 1, 1,
-0.2547009, -1.379651, -3.686488, 1, 0, 0, 1, 1,
-0.2458004, 1.137329, 1.036534, 1, 0, 0, 1, 1,
-0.2409682, -1.320766, -3.931975, 1, 0, 0, 1, 1,
-0.23907, -0.2407736, -2.668147, 1, 0, 0, 1, 1,
-0.2381755, -0.2963207, -3.899396, 0, 0, 0, 1, 1,
-0.2376426, -0.270864, -1.989853, 0, 0, 0, 1, 1,
-0.2367478, -2.034574, -2.699765, 0, 0, 0, 1, 1,
-0.2301632, 2.024835, 1.973394, 0, 0, 0, 1, 1,
-0.2293616, -1.348606, -3.754975, 0, 0, 0, 1, 1,
-0.2271888, 0.7429222, -1.07357, 0, 0, 0, 1, 1,
-0.2261205, -0.448146, -3.269333, 0, 0, 0, 1, 1,
-0.2258668, 0.6395175, -0.01186399, 1, 1, 1, 1, 1,
-0.217997, 2.085917, -1.599887, 1, 1, 1, 1, 1,
-0.2167431, -0.9483246, -2.893164, 1, 1, 1, 1, 1,
-0.2093853, -0.7306113, -2.47175, 1, 1, 1, 1, 1,
-0.2070735, -3.191354, -3.356753, 1, 1, 1, 1, 1,
-0.2069731, -0.9435613, -3.651476, 1, 1, 1, 1, 1,
-0.2048881, -0.7386202, -2.8193, 1, 1, 1, 1, 1,
-0.2028511, 1.073235, 1.038371, 1, 1, 1, 1, 1,
-0.201538, -0.04891947, -4.264449, 1, 1, 1, 1, 1,
-0.2007657, -1.233256, -1.910115, 1, 1, 1, 1, 1,
-0.1968828, -0.05900181, -2.728503, 1, 1, 1, 1, 1,
-0.1944616, 1.119928, 0.5858328, 1, 1, 1, 1, 1,
-0.1897186, 0.9536225, -1.729099, 1, 1, 1, 1, 1,
-0.1896733, 0.7852901, 0.2103457, 1, 1, 1, 1, 1,
-0.1887971, -0.3391565, -2.623377, 1, 1, 1, 1, 1,
-0.1886531, 1.108578, -0.3278616, 0, 0, 1, 1, 1,
-0.1857129, 0.275238, -2.293827, 1, 0, 0, 1, 1,
-0.1854073, 0.3846318, -1.909711, 1, 0, 0, 1, 1,
-0.1828046, 0.4128188, 0.5007312, 1, 0, 0, 1, 1,
-0.1826722, -0.04039619, -3.478033, 1, 0, 0, 1, 1,
-0.1714117, 2.822431, -0.1079446, 1, 0, 0, 1, 1,
-0.16945, 0.3262701, -0.4944576, 0, 0, 0, 1, 1,
-0.1649037, -0.8200694, -3.353542, 0, 0, 0, 1, 1,
-0.1636587, -0.5367672, -1.725664, 0, 0, 0, 1, 1,
-0.1634673, -1.616262, -2.399808, 0, 0, 0, 1, 1,
-0.1558393, 0.440262, -1.391843, 0, 0, 0, 1, 1,
-0.1503676, -0.5914248, -2.995456, 0, 0, 0, 1, 1,
-0.1492856, 0.9453171, 0.05601312, 0, 0, 0, 1, 1,
-0.147689, -1.035475, -4.020296, 1, 1, 1, 1, 1,
-0.1443607, 0.2767609, -0.08837541, 1, 1, 1, 1, 1,
-0.1398982, -0.8674038, -2.097761, 1, 1, 1, 1, 1,
-0.1373386, 0.3029934, -0.940603, 1, 1, 1, 1, 1,
-0.1361601, 1.062292, -0.04810439, 1, 1, 1, 1, 1,
-0.1334588, 0.8026066, -1.105018, 1, 1, 1, 1, 1,
-0.1298192, 0.1726053, -0.3409719, 1, 1, 1, 1, 1,
-0.1229955, -0.4769672, -4.458632, 1, 1, 1, 1, 1,
-0.1227567, 2.45625, -0.6649737, 1, 1, 1, 1, 1,
-0.1190767, -1.407264, -4.574189, 1, 1, 1, 1, 1,
-0.1168154, -0.7504612, -3.367275, 1, 1, 1, 1, 1,
-0.116293, -0.3175487, -3.755513, 1, 1, 1, 1, 1,
-0.1160742, -0.4304642, -2.722502, 1, 1, 1, 1, 1,
-0.1133852, 0.5732054, -1.386032, 1, 1, 1, 1, 1,
-0.110235, 1.27247, 0.9642735, 1, 1, 1, 1, 1,
-0.1061261, -0.2543119, -3.180019, 0, 0, 1, 1, 1,
-0.1020722, 0.7134603, -0.3857732, 1, 0, 0, 1, 1,
-0.0976412, 0.1115779, -1.954809, 1, 0, 0, 1, 1,
-0.09505647, 0.02899808, -0.1580729, 1, 0, 0, 1, 1,
-0.09434708, 0.540804, -2.090424, 1, 0, 0, 1, 1,
-0.0934394, 0.4381627, 0.07605024, 1, 0, 0, 1, 1,
-0.09296458, -1.866435, -3.585762, 0, 0, 0, 1, 1,
-0.09098151, -2.328544, -3.038274, 0, 0, 0, 1, 1,
-0.08725163, -0.3937131, -2.883026, 0, 0, 0, 1, 1,
-0.08427998, -1.446144, -1.755166, 0, 0, 0, 1, 1,
-0.07969137, -0.7309309, -2.221376, 0, 0, 0, 1, 1,
-0.07870301, -2.352043, -3.824914, 0, 0, 0, 1, 1,
-0.07805081, -3.048192, -2.793285, 0, 0, 0, 1, 1,
-0.07569829, 1.684847, -0.5133554, 1, 1, 1, 1, 1,
-0.07121909, 1.013012, -2.122254, 1, 1, 1, 1, 1,
-0.07081888, -1.032945, -2.928189, 1, 1, 1, 1, 1,
-0.06589326, -0.3758934, -2.476076, 1, 1, 1, 1, 1,
-0.06521405, -0.5847281, -4.851074, 1, 1, 1, 1, 1,
-0.06364477, 1.673901, 0.5180772, 1, 1, 1, 1, 1,
-0.0635248, 0.2552991, 0.991725, 1, 1, 1, 1, 1,
-0.05991688, -0.3211056, -1.27427, 1, 1, 1, 1, 1,
-0.05928891, 0.3574993, -1.127289, 1, 1, 1, 1, 1,
-0.05405554, -0.4429985, -3.446363, 1, 1, 1, 1, 1,
-0.05335036, -1.601089, -1.721885, 1, 1, 1, 1, 1,
-0.04774433, -0.01842027, -1.101482, 1, 1, 1, 1, 1,
-0.04169312, 0.544003, 0.4978479, 1, 1, 1, 1, 1,
-0.03878552, 0.9400139, 0.5408403, 1, 1, 1, 1, 1,
-0.03780355, -0.5783262, -2.799185, 1, 1, 1, 1, 1,
-0.03445343, 1.810486, -0.9717672, 0, 0, 1, 1, 1,
-0.03193422, 1.3778, -0.2846013, 1, 0, 0, 1, 1,
-0.02574117, 0.718031, 0.3833468, 1, 0, 0, 1, 1,
-0.02444769, -0.3889367, -4.144348, 1, 0, 0, 1, 1,
-0.02391652, -0.7357003, -4.951592, 1, 0, 0, 1, 1,
-0.01824447, 0.8650478, 1.085417, 1, 0, 0, 1, 1,
-0.017016, 0.4386533, -0.3868648, 0, 0, 0, 1, 1,
-0.01596625, 1.772927, -0.4462433, 0, 0, 0, 1, 1,
-0.01154959, 1.832354, -0.29127, 0, 0, 0, 1, 1,
-0.01002885, 1.45666, -1.756089, 0, 0, 0, 1, 1,
-0.00997865, 0.1639599, -1.590383, 0, 0, 0, 1, 1,
-0.004144056, 1.433547, 0.7684265, 0, 0, 0, 1, 1,
-0.002971351, 0.3592094, -0.4920421, 0, 0, 0, 1, 1,
-0.0009056766, -1.10494, -2.113191, 1, 1, 1, 1, 1,
0.004225323, -0.2752525, 2.560004, 1, 1, 1, 1, 1,
0.005839003, 0.2036489, -0.2916967, 1, 1, 1, 1, 1,
0.008114244, 1.281291, 0.833872, 1, 1, 1, 1, 1,
0.01057628, -2.070168, 3.644777, 1, 1, 1, 1, 1,
0.01152667, -0.4977004, 2.221856, 1, 1, 1, 1, 1,
0.01259533, 0.9497374, -0.3817087, 1, 1, 1, 1, 1,
0.02001941, -0.1807601, 3.714775, 1, 1, 1, 1, 1,
0.02095069, -0.6633822, 3.618188, 1, 1, 1, 1, 1,
0.02099322, 1.164042, 1.137463, 1, 1, 1, 1, 1,
0.02158893, 0.1878388, 0.1383025, 1, 1, 1, 1, 1,
0.02275244, 2.409222, -1.139339, 1, 1, 1, 1, 1,
0.02444695, 1.252065, -0.3607807, 1, 1, 1, 1, 1,
0.02852648, -0.2549078, 1.278048, 1, 1, 1, 1, 1,
0.03513703, 0.7492896, -1.142426, 1, 1, 1, 1, 1,
0.03593213, -0.5026537, 2.61724, 0, 0, 1, 1, 1,
0.03724438, 1.226278, -0.1260892, 1, 0, 0, 1, 1,
0.03743507, -0.1166933, 1.700434, 1, 0, 0, 1, 1,
0.03940621, 0.4486533, -0.9700524, 1, 0, 0, 1, 1,
0.04333215, 0.2666715, 0.5746678, 1, 0, 0, 1, 1,
0.04516177, 0.7236975, -0.187066, 1, 0, 0, 1, 1,
0.04706924, 0.4541362, 0.5475133, 0, 0, 0, 1, 1,
0.04803418, -0.01320559, 1.998907, 0, 0, 0, 1, 1,
0.05362349, 0.7581707, -0.2300857, 0, 0, 0, 1, 1,
0.05557468, -0.5239567, 1.560914, 0, 0, 0, 1, 1,
0.0620722, 0.1850315, -0.757988, 0, 0, 0, 1, 1,
0.06502294, -0.9092197, 2.22804, 0, 0, 0, 1, 1,
0.06910992, 0.173891, 0.9366612, 0, 0, 0, 1, 1,
0.06926223, 1.172633, 0.1455399, 1, 1, 1, 1, 1,
0.07377203, -0.5302887, 5.168033, 1, 1, 1, 1, 1,
0.07570508, 0.9650234, -0.5432233, 1, 1, 1, 1, 1,
0.07856937, -0.254367, 2.370957, 1, 1, 1, 1, 1,
0.08420322, 1.266885, -0.06735062, 1, 1, 1, 1, 1,
0.08426954, 0.6997773, -0.2168187, 1, 1, 1, 1, 1,
0.08936759, 0.3288541, -0.3084353, 1, 1, 1, 1, 1,
0.09221254, 0.7661388, 0.4436947, 1, 1, 1, 1, 1,
0.09589563, 0.9417443, -0.1115903, 1, 1, 1, 1, 1,
0.1106977, -0.2429924, 3.390409, 1, 1, 1, 1, 1,
0.1122413, -1.175465, 1.400911, 1, 1, 1, 1, 1,
0.1142133, -0.2189728, 4.76572, 1, 1, 1, 1, 1,
0.1149969, 0.8437718, -0.4718741, 1, 1, 1, 1, 1,
0.1166096, 0.2913888, 1.762239, 1, 1, 1, 1, 1,
0.1186336, -1.27508, 3.5546, 1, 1, 1, 1, 1,
0.1189192, 0.5732956, 1.057121, 0, 0, 1, 1, 1,
0.1234737, -0.369491, 2.988053, 1, 0, 0, 1, 1,
0.1239984, -1.169324, 3.671546, 1, 0, 0, 1, 1,
0.1252925, -0.6537154, 3.917006, 1, 0, 0, 1, 1,
0.1325972, 0.6105392, -0.2251926, 1, 0, 0, 1, 1,
0.1336326, 1.136488, -0.7450367, 1, 0, 0, 1, 1,
0.1403364, -0.4073746, 2.089092, 0, 0, 0, 1, 1,
0.1426734, 1.233707, 0.5339127, 0, 0, 0, 1, 1,
0.1454885, -1.180051, 2.486907, 0, 0, 0, 1, 1,
0.1489719, -1.62465, 2.739118, 0, 0, 0, 1, 1,
0.1491772, -0.01040755, 0.1138148, 0, 0, 0, 1, 1,
0.1527706, -1.008185, 3.152732, 0, 0, 0, 1, 1,
0.1530948, 1.452411, 0.7089599, 0, 0, 0, 1, 1,
0.1579634, 1.103318, -0.8602949, 1, 1, 1, 1, 1,
0.1630068, 0.04978148, 2.902455, 1, 1, 1, 1, 1,
0.1633627, 0.2717582, 0.5275829, 1, 1, 1, 1, 1,
0.1658979, 0.6876122, 0.914135, 1, 1, 1, 1, 1,
0.1659221, 1.533529, 0.470907, 1, 1, 1, 1, 1,
0.1682108, -0.7529055, 1.465434, 1, 1, 1, 1, 1,
0.1683819, 1.154207, 0.3621885, 1, 1, 1, 1, 1,
0.1690662, 0.007925109, 0.08453376, 1, 1, 1, 1, 1,
0.1705032, 0.6065869, -0.5108215, 1, 1, 1, 1, 1,
0.1748762, -0.593974, 2.45667, 1, 1, 1, 1, 1,
0.1756312, -0.3908891, 0.6328883, 1, 1, 1, 1, 1,
0.1775118, 0.04084972, 1.204949, 1, 1, 1, 1, 1,
0.1793411, -1.868127, 2.554975, 1, 1, 1, 1, 1,
0.1810849, -0.2144231, 2.050067, 1, 1, 1, 1, 1,
0.181205, -0.1080241, 0.7703485, 1, 1, 1, 1, 1,
0.1841418, -0.3159006, 4.099512, 0, 0, 1, 1, 1,
0.1856342, -0.2917554, 4.677332, 1, 0, 0, 1, 1,
0.1906449, -0.4347663, 2.251227, 1, 0, 0, 1, 1,
0.1949143, 0.5804458, 1.03986, 1, 0, 0, 1, 1,
0.2005871, 0.8157656, 0.958548, 1, 0, 0, 1, 1,
0.2068788, -1.0059, 3.074355, 1, 0, 0, 1, 1,
0.2084754, 0.2125418, 1.786499, 0, 0, 0, 1, 1,
0.2085352, -0.8014034, 2.757213, 0, 0, 0, 1, 1,
0.2087061, 1.317577, -1.23048, 0, 0, 0, 1, 1,
0.2118253, -0.8490262, 1.779534, 0, 0, 0, 1, 1,
0.2163941, -0.6397081, 3.265743, 0, 0, 0, 1, 1,
0.2167601, -0.7050119, 3.045666, 0, 0, 0, 1, 1,
0.2173138, -1.223315, 1.273166, 0, 0, 0, 1, 1,
0.217685, -0.2448696, 1.922961, 1, 1, 1, 1, 1,
0.228067, -1.383688, 3.53379, 1, 1, 1, 1, 1,
0.2285629, 1.369033, -0.5225469, 1, 1, 1, 1, 1,
0.2313405, 1.00281, 0.4790947, 1, 1, 1, 1, 1,
0.2374271, -1.039107, 3.627739, 1, 1, 1, 1, 1,
0.2375734, 1.947119, 0.1730988, 1, 1, 1, 1, 1,
0.2377093, -0.8982897, 2.569817, 1, 1, 1, 1, 1,
0.2390772, 0.4677441, 1.860608, 1, 1, 1, 1, 1,
0.2416422, 0.1688794, 0.8300053, 1, 1, 1, 1, 1,
0.2433871, 0.6123771, -3.10737, 1, 1, 1, 1, 1,
0.2440249, 0.4956261, 0.2205409, 1, 1, 1, 1, 1,
0.2469513, 0.1352897, -0.04671109, 1, 1, 1, 1, 1,
0.2496538, 1.137849, 0.3924935, 1, 1, 1, 1, 1,
0.2510006, -2.027192, 4.543724, 1, 1, 1, 1, 1,
0.2554135, -0.3164517, 4.567977, 1, 1, 1, 1, 1,
0.2565487, 0.2003603, 1.161185, 0, 0, 1, 1, 1,
0.2586744, -1.084469, 4.005716, 1, 0, 0, 1, 1,
0.2625114, -1.989421, 3.594625, 1, 0, 0, 1, 1,
0.2649794, -1.838253, 2.877379, 1, 0, 0, 1, 1,
0.2651452, -0.1383634, 1.939627, 1, 0, 0, 1, 1,
0.2654811, 0.7313954, 0.3585467, 1, 0, 0, 1, 1,
0.265548, 0.2619075, -0.7032725, 0, 0, 0, 1, 1,
0.2655647, -1.610399, 2.33079, 0, 0, 0, 1, 1,
0.2699034, 0.1447697, -0.7656726, 0, 0, 0, 1, 1,
0.2730256, 1.120632, -0.8833278, 0, 0, 0, 1, 1,
0.2744151, -0.08788173, 1.711649, 0, 0, 0, 1, 1,
0.2748542, -0.2708243, 2.824511, 0, 0, 0, 1, 1,
0.2860616, 0.5914623, -0.1662366, 0, 0, 0, 1, 1,
0.2862999, 0.4684926, 0.2585992, 1, 1, 1, 1, 1,
0.2906351, 0.9628252, 0.1491952, 1, 1, 1, 1, 1,
0.2908953, 0.6044639, 0.5392521, 1, 1, 1, 1, 1,
0.2927898, 0.9083237, 0.3104487, 1, 1, 1, 1, 1,
0.2940258, -1.570239, 2.302021, 1, 1, 1, 1, 1,
0.2955855, -2.292352, 3.25862, 1, 1, 1, 1, 1,
0.2976809, 0.1852568, 0.7280033, 1, 1, 1, 1, 1,
0.3019067, 0.3609534, 1.038744, 1, 1, 1, 1, 1,
0.3053617, -1.214966, 2.654147, 1, 1, 1, 1, 1,
0.3092445, 0.302785, -0.0359128, 1, 1, 1, 1, 1,
0.3103135, 0.4675257, 0.5007131, 1, 1, 1, 1, 1,
0.3111026, 1.76945, 0.5307012, 1, 1, 1, 1, 1,
0.3154015, -0.9122756, 2.544852, 1, 1, 1, 1, 1,
0.3203268, 0.2194697, -0.07548035, 1, 1, 1, 1, 1,
0.3221262, -2.565172, 0.5721446, 1, 1, 1, 1, 1,
0.3241313, 0.3064843, 0.768142, 0, 0, 1, 1, 1,
0.3248362, -1.478726, 2.207979, 1, 0, 0, 1, 1,
0.3250223, 0.1192026, 1.679278, 1, 0, 0, 1, 1,
0.3358275, -0.923835, 3.885592, 1, 0, 0, 1, 1,
0.3396711, -0.02575847, 1.460026, 1, 0, 0, 1, 1,
0.3405232, -1.499032, 4.034614, 1, 0, 0, 1, 1,
0.3476437, 2.478729, 0.3071416, 0, 0, 0, 1, 1,
0.3508885, -2.043108, 2.090424, 0, 0, 0, 1, 1,
0.3524908, -0.5419236, 3.612833, 0, 0, 0, 1, 1,
0.355003, -1.234621, 4.407128, 0, 0, 0, 1, 1,
0.3591677, -2.405336, 2.402829, 0, 0, 0, 1, 1,
0.3604458, 0.2786196, 2.395926, 0, 0, 0, 1, 1,
0.3613252, 0.7373598, 2.839904, 0, 0, 0, 1, 1,
0.3632596, 0.1546714, 0.5009196, 1, 1, 1, 1, 1,
0.3649686, 1.465438, 2.079327, 1, 1, 1, 1, 1,
0.3650489, -0.4314437, 1.007401, 1, 1, 1, 1, 1,
0.3655581, 1.867303, 2.977933, 1, 1, 1, 1, 1,
0.3695712, 0.2135862, 1.785896, 1, 1, 1, 1, 1,
0.3710275, -1.743272, 1.754547, 1, 1, 1, 1, 1,
0.372243, 0.5983645, 1.104879, 1, 1, 1, 1, 1,
0.3797282, -0.1829346, 0.6478552, 1, 1, 1, 1, 1,
0.3797857, 0.2416468, -0.5059849, 1, 1, 1, 1, 1,
0.380763, 0.9180806, -0.8941419, 1, 1, 1, 1, 1,
0.3819636, -0.3937135, 1.323792, 1, 1, 1, 1, 1,
0.3846446, 0.7282428, 1.105021, 1, 1, 1, 1, 1,
0.3903898, -0.9942217, 3.014573, 1, 1, 1, 1, 1,
0.3919061, 0.09743299, -0.1160496, 1, 1, 1, 1, 1,
0.3919985, 1.260848, 2.45099, 1, 1, 1, 1, 1,
0.3948081, 1.128662, -0.3565033, 0, 0, 1, 1, 1,
0.4009261, 0.8236269, -1.385424, 1, 0, 0, 1, 1,
0.4027243, 0.2407465, 1.322936, 1, 0, 0, 1, 1,
0.4046116, -0.06455477, 3.268413, 1, 0, 0, 1, 1,
0.4061327, 1.154009, 0.5134039, 1, 0, 0, 1, 1,
0.4066538, 0.8695698, 0.1395674, 1, 0, 0, 1, 1,
0.4100212, 0.3786088, 2.016957, 0, 0, 0, 1, 1,
0.4117889, -0.4752433, 1.755045, 0, 0, 0, 1, 1,
0.4147205, 1.22418, 2.182725, 0, 0, 0, 1, 1,
0.4192417, 0.4056348, 2.227421, 0, 0, 0, 1, 1,
0.4204515, -1.250231, 1.238797, 0, 0, 0, 1, 1,
0.4238007, 1.181373, -2.46518, 0, 0, 0, 1, 1,
0.4243242, 0.2037831, 1.089161, 0, 0, 0, 1, 1,
0.4299452, 0.863432, 0.2787664, 1, 1, 1, 1, 1,
0.4305436, 0.1222967, 1.094614, 1, 1, 1, 1, 1,
0.4339658, 0.385117, 1.618177, 1, 1, 1, 1, 1,
0.4348925, 0.207087, 0.4250295, 1, 1, 1, 1, 1,
0.4385353, 0.3747953, 0.4663121, 1, 1, 1, 1, 1,
0.4388051, 0.0567399, 1.974659, 1, 1, 1, 1, 1,
0.4428201, -0.6553853, 2.209822, 1, 1, 1, 1, 1,
0.4486899, 0.9510918, -0.2143223, 1, 1, 1, 1, 1,
0.4488102, 1.077032, 1.014129, 1, 1, 1, 1, 1,
0.4488757, 1.964238, -0.07510705, 1, 1, 1, 1, 1,
0.4532407, -0.9539561, 1.997623, 1, 1, 1, 1, 1,
0.454745, -0.7930222, 4.821631, 1, 1, 1, 1, 1,
0.4551184, -1.278538, 2.652578, 1, 1, 1, 1, 1,
0.458681, -0.5583774, 4.85358, 1, 1, 1, 1, 1,
0.4605767, -2.86269, 4.541327, 1, 1, 1, 1, 1,
0.4647963, 0.6502559, 2.894302, 0, 0, 1, 1, 1,
0.4655193, 1.186963, 0.9273998, 1, 0, 0, 1, 1,
0.472226, -0.5552101, 2.833359, 1, 0, 0, 1, 1,
0.4753237, 0.03700983, 1.467505, 1, 0, 0, 1, 1,
0.476499, -0.3842327, 2.088864, 1, 0, 0, 1, 1,
0.4779977, -0.8053263, 3.078752, 1, 0, 0, 1, 1,
0.4852459, 0.06814659, 1.420079, 0, 0, 0, 1, 1,
0.4862258, 1.161059, 0.8024349, 0, 0, 0, 1, 1,
0.4889521, -0.2246529, 2.670421, 0, 0, 0, 1, 1,
0.4892211, -0.3110835, 1.584725, 0, 0, 0, 1, 1,
0.495152, 0.4822723, 1.128245, 0, 0, 0, 1, 1,
0.5000075, 0.4581737, 1.335801, 0, 0, 0, 1, 1,
0.5026745, 0.6535243, 0.6126848, 0, 0, 0, 1, 1,
0.5036618, 1.032249, 1.309769, 1, 1, 1, 1, 1,
0.5038121, -0.3234306, 2.003401, 1, 1, 1, 1, 1,
0.5049725, -0.639168, 3.223557, 1, 1, 1, 1, 1,
0.5098292, 2.194878, 0.3911548, 1, 1, 1, 1, 1,
0.5133566, 1.74031, 0.9409801, 1, 1, 1, 1, 1,
0.5142608, 0.1782904, 1.753393, 1, 1, 1, 1, 1,
0.5162424, -0.7201483, 1.31738, 1, 1, 1, 1, 1,
0.5177877, 0.5980595, 1.227893, 1, 1, 1, 1, 1,
0.5181496, -0.2491102, 3.090504, 1, 1, 1, 1, 1,
0.5196707, 0.6312736, 1.786786, 1, 1, 1, 1, 1,
0.5262172, -0.993959, 2.810783, 1, 1, 1, 1, 1,
0.5268689, 0.5301813, 1.495283, 1, 1, 1, 1, 1,
0.5280042, -0.1570805, 1.177999, 1, 1, 1, 1, 1,
0.5285165, 0.7786592, -0.1304231, 1, 1, 1, 1, 1,
0.5290235, -1.949583, 5.01594, 1, 1, 1, 1, 1,
0.5292642, 0.04223278, 3.195597, 0, 0, 1, 1, 1,
0.5299423, -0.05366065, 1.031244, 1, 0, 0, 1, 1,
0.5328239, -1.105397, 2.937101, 1, 0, 0, 1, 1,
0.5355995, -1.091429, 0.9117425, 1, 0, 0, 1, 1,
0.5396659, 0.07794186, 1.587371, 1, 0, 0, 1, 1,
0.5429288, -0.9963817, 1.728896, 1, 0, 0, 1, 1,
0.5527914, -1.067415, 3.279552, 0, 0, 0, 1, 1,
0.5545474, 1.088598, 1.872643, 0, 0, 0, 1, 1,
0.5572341, -0.2452554, 2.04746, 0, 0, 0, 1, 1,
0.5587655, 0.146863, -0.1699144, 0, 0, 0, 1, 1,
0.5592027, 0.05143276, 0.7928429, 0, 0, 0, 1, 1,
0.5605931, 1.253267, 0.2549096, 0, 0, 0, 1, 1,
0.5637682, -1.688897, 1.588184, 0, 0, 0, 1, 1,
0.5651094, 2.06039, 0.05264497, 1, 1, 1, 1, 1,
0.5704145, -0.5576226, 3.105651, 1, 1, 1, 1, 1,
0.5706985, 1.221003, 0.1794956, 1, 1, 1, 1, 1,
0.5762579, 0.06925602, 1.727315, 1, 1, 1, 1, 1,
0.5804813, 0.363729, 1.074501, 1, 1, 1, 1, 1,
0.581452, -1.684619, 3.430767, 1, 1, 1, 1, 1,
0.5825192, 0.7429535, 0.668586, 1, 1, 1, 1, 1,
0.5857157, 0.2218771, 1.780013, 1, 1, 1, 1, 1,
0.589883, 1.260959, -1.063969, 1, 1, 1, 1, 1,
0.6042656, -0.1439749, 0.8681793, 1, 1, 1, 1, 1,
0.6073034, 0.9611339, 0.07279742, 1, 1, 1, 1, 1,
0.6074243, -1.160305, 2.230153, 1, 1, 1, 1, 1,
0.6096669, 0.5779828, -0.06636471, 1, 1, 1, 1, 1,
0.6155899, -0.3386203, 1.616399, 1, 1, 1, 1, 1,
0.6243281, -1.387667, 3.8995, 1, 1, 1, 1, 1,
0.6249537, 0.1245606, 1.828214, 0, 0, 1, 1, 1,
0.6269513, 0.7864278, 1.699702, 1, 0, 0, 1, 1,
0.6283205, 1.04381, -1.627178, 1, 0, 0, 1, 1,
0.6300392, -1.041973, 2.629489, 1, 0, 0, 1, 1,
0.6345278, 1.765301, 0.7176241, 1, 0, 0, 1, 1,
0.6353482, 0.5883652, 1.334165, 1, 0, 0, 1, 1,
0.6396242, 0.8453379, 0.6160003, 0, 0, 0, 1, 1,
0.642338, 1.552365, 2.482874, 0, 0, 0, 1, 1,
0.6450214, -0.02482409, 2.738735, 0, 0, 0, 1, 1,
0.6456214, -0.01853435, 2.097717, 0, 0, 0, 1, 1,
0.6515589, 0.3399988, 2.245258, 0, 0, 0, 1, 1,
0.6542987, 0.6468502, 0.6765062, 0, 0, 0, 1, 1,
0.6559897, -1.890011, 3.824215, 0, 0, 0, 1, 1,
0.6642436, 0.1389646, 2.553116, 1, 1, 1, 1, 1,
0.6646101, -0.3911316, 1.968938, 1, 1, 1, 1, 1,
0.67087, 0.3470319, 1.156566, 1, 1, 1, 1, 1,
0.6761604, 0.7933704, -0.9000167, 1, 1, 1, 1, 1,
0.6766123, 0.6414287, 0.5535598, 1, 1, 1, 1, 1,
0.6790735, -0.4782072, 1.790433, 1, 1, 1, 1, 1,
0.6799665, -0.5106306, 2.57685, 1, 1, 1, 1, 1,
0.6803133, 0.9119223, 1.770991, 1, 1, 1, 1, 1,
0.6824636, 1.250121, -0.1144062, 1, 1, 1, 1, 1,
0.6826658, -2.231411, 1.216326, 1, 1, 1, 1, 1,
0.6881914, 1.352246, 0.818093, 1, 1, 1, 1, 1,
0.6956983, -0.05225005, 1.566266, 1, 1, 1, 1, 1,
0.7051927, 0.2178448, 1.655703, 1, 1, 1, 1, 1,
0.7073896, -0.1558776, 2.01473, 1, 1, 1, 1, 1,
0.7097737, -0.4276895, 2.101988, 1, 1, 1, 1, 1,
0.7163278, 0.1710872, -0.1527572, 0, 0, 1, 1, 1,
0.730373, -0.707197, 1.006006, 1, 0, 0, 1, 1,
0.7333469, -0.7715293, 2.006756, 1, 0, 0, 1, 1,
0.737985, -0.25436, 0.2340008, 1, 0, 0, 1, 1,
0.7410545, 1.451351, -0.5954791, 1, 0, 0, 1, 1,
0.7436222, -1.25328, 3.41904, 1, 0, 0, 1, 1,
0.7455572, 0.5145562, -0.3729827, 0, 0, 0, 1, 1,
0.7459257, 0.7883901, 0.0548139, 0, 0, 0, 1, 1,
0.7494362, -0.8257926, 2.226713, 0, 0, 0, 1, 1,
0.7512151, -2.56062, 2.609814, 0, 0, 0, 1, 1,
0.7558263, 0.3937019, 1.286378, 0, 0, 0, 1, 1,
0.7625929, -1.208497, 1.932985, 0, 0, 0, 1, 1,
0.768822, 0.2525606, 0.2792028, 0, 0, 0, 1, 1,
0.7760286, -0.2460642, 1.592228, 1, 1, 1, 1, 1,
0.7772804, -1.884754, 2.650391, 1, 1, 1, 1, 1,
0.7801962, -0.985565, 4.287797, 1, 1, 1, 1, 1,
0.7825478, 1.231675, 0.6484933, 1, 1, 1, 1, 1,
0.7948828, -1.3629, 3.301148, 1, 1, 1, 1, 1,
0.8067701, -1.340084, 1.704789, 1, 1, 1, 1, 1,
0.8174019, 1.295277, 1.117122, 1, 1, 1, 1, 1,
0.8200484, 0.7771019, 1.415461, 1, 1, 1, 1, 1,
0.8230129, 0.2327359, 1.066218, 1, 1, 1, 1, 1,
0.8271807, 0.1608064, 0.3511145, 1, 1, 1, 1, 1,
0.8317026, -0.1393766, 1.637071, 1, 1, 1, 1, 1,
0.8348943, 1.266673, 1.875452, 1, 1, 1, 1, 1,
0.8397028, 3.00217, -0.1054312, 1, 1, 1, 1, 1,
0.8554834, 0.4571765, 0.2999633, 1, 1, 1, 1, 1,
0.8574533, -0.5996738, 1.257157, 1, 1, 1, 1, 1,
0.8615406, -0.633511, 2.556246, 0, 0, 1, 1, 1,
0.8639892, -0.6820747, 3.606266, 1, 0, 0, 1, 1,
0.8683004, -0.4784555, 1.453009, 1, 0, 0, 1, 1,
0.8722434, 0.5205988, 1.516242, 1, 0, 0, 1, 1,
0.8729421, -0.07254308, 1.161527, 1, 0, 0, 1, 1,
0.8731135, -1.291094, -0.01928818, 1, 0, 0, 1, 1,
0.8741986, -0.6300822, 1.872821, 0, 0, 0, 1, 1,
0.8805209, 1.180406, -0.4501205, 0, 0, 0, 1, 1,
0.8822424, -0.4014617, 1.021946, 0, 0, 0, 1, 1,
0.8911117, -0.5327567, 1.553329, 0, 0, 0, 1, 1,
0.8951485, -0.7647623, 1.855372, 0, 0, 0, 1, 1,
0.8966094, 0.5864516, -0.828624, 0, 0, 0, 1, 1,
0.8968254, 0.9566959, 0.463278, 0, 0, 0, 1, 1,
0.8996876, 0.2061219, 1.605433, 1, 1, 1, 1, 1,
0.9026766, -1.210025, 2.456698, 1, 1, 1, 1, 1,
0.9113897, -1.834306, 2.254038, 1, 1, 1, 1, 1,
0.9122722, -1.080937, 1.659446, 1, 1, 1, 1, 1,
0.9126613, 0.6918609, 2.146308, 1, 1, 1, 1, 1,
0.9135268, 1.290001, 1.115638, 1, 1, 1, 1, 1,
0.9142941, 0.8238357, 1.311262, 1, 1, 1, 1, 1,
0.9263201, 0.08929078, 0.5654448, 1, 1, 1, 1, 1,
0.930649, -0.1091693, 0.4356833, 1, 1, 1, 1, 1,
0.9310161, 1.776808, -1.119034, 1, 1, 1, 1, 1,
0.9312946, 0.766151, 0.9627786, 1, 1, 1, 1, 1,
0.9357993, -1.681364, 1.785987, 1, 1, 1, 1, 1,
0.9412207, 1.180089, 1.967573, 1, 1, 1, 1, 1,
0.9479164, 0.1416741, 0.1104047, 1, 1, 1, 1, 1,
0.9492279, -2.346813, 4.372482, 1, 1, 1, 1, 1,
0.951467, -0.8974912, 2.678133, 0, 0, 1, 1, 1,
0.95317, -1.08719, 4.137183, 1, 0, 0, 1, 1,
0.9598066, -0.1885979, 3.200188, 1, 0, 0, 1, 1,
0.9670991, -0.432109, 2.410491, 1, 0, 0, 1, 1,
0.9816644, -0.8327062, 3.147265, 1, 0, 0, 1, 1,
0.9882424, 1.080323, 1.598452, 1, 0, 0, 1, 1,
0.9909547, -1.186969, 2.611809, 0, 0, 0, 1, 1,
0.9957031, 1.088372, 0.1736558, 0, 0, 0, 1, 1,
0.997995, 0.3899074, -0.05029739, 0, 0, 0, 1, 1,
0.9983854, 0.9171495, -0.05644029, 0, 0, 0, 1, 1,
1.010316, -0.06035211, 2.647573, 0, 0, 0, 1, 1,
1.012064, -1.096963, 2.272644, 0, 0, 0, 1, 1,
1.022631, 1.478068, 1.424879, 0, 0, 0, 1, 1,
1.03817, 1.470962, 1.327973, 1, 1, 1, 1, 1,
1.040084, 0.7551895, 0.207835, 1, 1, 1, 1, 1,
1.050733, 0.7616054, 0.3363273, 1, 1, 1, 1, 1,
1.056678, 2.0096, 0.2647619, 1, 1, 1, 1, 1,
1.060314, -0.1903934, 1.494542, 1, 1, 1, 1, 1,
1.061367, -0.02719405, 1.731267, 1, 1, 1, 1, 1,
1.061741, 0.9739978, 2.522675, 1, 1, 1, 1, 1,
1.063105, 0.9807851, 1.795345, 1, 1, 1, 1, 1,
1.064094, -1.413708, 0.3931858, 1, 1, 1, 1, 1,
1.06491, 0.620051, 0.2713937, 1, 1, 1, 1, 1,
1.070783, 1.853134, 0.3968177, 1, 1, 1, 1, 1,
1.071434, 0.9509291, 1.484927, 1, 1, 1, 1, 1,
1.07974, 0.261184, 2.19365, 1, 1, 1, 1, 1,
1.085301, -1.590436, 0.1820057, 1, 1, 1, 1, 1,
1.098783, -0.6295392, 2.29654, 1, 1, 1, 1, 1,
1.101431, -0.9997493, 0.7447606, 0, 0, 1, 1, 1,
1.101802, -1.408761, 3.18217, 1, 0, 0, 1, 1,
1.102583, 0.03633416, 2.864356, 1, 0, 0, 1, 1,
1.106038, 1.379454, 0.6843475, 1, 0, 0, 1, 1,
1.114602, -0.929996, 2.67257, 1, 0, 0, 1, 1,
1.117324, -1.149087, 1.495313, 1, 0, 0, 1, 1,
1.118303, -0.5514616, 3.229962, 0, 0, 0, 1, 1,
1.119141, 1.313693, 2.277035, 0, 0, 0, 1, 1,
1.138993, 0.5197687, 1.709536, 0, 0, 0, 1, 1,
1.147815, 0.7843189, 1.657146, 0, 0, 0, 1, 1,
1.159134, 1.311039, 0.2568427, 0, 0, 0, 1, 1,
1.166846, 0.485029, 1.276815, 0, 0, 0, 1, 1,
1.168121, -0.4862221, 1.737198, 0, 0, 0, 1, 1,
1.174169, -1.526872, 2.623094, 1, 1, 1, 1, 1,
1.183802, -0.1473098, 2.542095, 1, 1, 1, 1, 1,
1.185452, 2.022553, 0.4592874, 1, 1, 1, 1, 1,
1.194579, -0.8682756, 1.035738, 1, 1, 1, 1, 1,
1.229635, 0.1154194, 2.341352, 1, 1, 1, 1, 1,
1.230787, -0.9936253, 1.787563, 1, 1, 1, 1, 1,
1.239908, 0.3978161, 0.7916054, 1, 1, 1, 1, 1,
1.23994, 0.1700688, -0.0156317, 1, 1, 1, 1, 1,
1.240577, -1.413555, 2.471317, 1, 1, 1, 1, 1,
1.246698, 0.3836206, 2.969662, 1, 1, 1, 1, 1,
1.26101, 0.6928536, 0.3340344, 1, 1, 1, 1, 1,
1.261424, 1.587641, 0.8030113, 1, 1, 1, 1, 1,
1.26666, 0.4252691, 0.8365306, 1, 1, 1, 1, 1,
1.268447, -1.837509, 3.819136, 1, 1, 1, 1, 1,
1.273459, -0.2020217, 3.666656, 1, 1, 1, 1, 1,
1.280142, 1.100158, 0.7592101, 0, 0, 1, 1, 1,
1.281894, -0.4995429, 2.760671, 1, 0, 0, 1, 1,
1.286697, -1.648517, 3.345753, 1, 0, 0, 1, 1,
1.294356, -0.991833, 1.691241, 1, 0, 0, 1, 1,
1.302188, -1.046985, 2.122193, 1, 0, 0, 1, 1,
1.303785, 0.2550768, 0.7766412, 1, 0, 0, 1, 1,
1.306691, 0.4003432, 1.215551, 0, 0, 0, 1, 1,
1.308009, -0.4222859, 1.863621, 0, 0, 0, 1, 1,
1.314188, -0.556491, 3.72121, 0, 0, 0, 1, 1,
1.316015, 1.246721, 1.147564, 0, 0, 0, 1, 1,
1.322758, -1.731937, 4.667181, 0, 0, 0, 1, 1,
1.327573, -1.416713, 3.327833, 0, 0, 0, 1, 1,
1.332795, 0.06841574, -0.6255491, 0, 0, 0, 1, 1,
1.333515, 0.6138698, 1.292806, 1, 1, 1, 1, 1,
1.347511, -0.04843324, 0.8423432, 1, 1, 1, 1, 1,
1.355419, 0.5425923, 1.518294, 1, 1, 1, 1, 1,
1.364946, -0.8881588, 1.646423, 1, 1, 1, 1, 1,
1.368887, -0.7008855, 3.175089, 1, 1, 1, 1, 1,
1.378256, -0.5609441, 1.387295, 1, 1, 1, 1, 1,
1.381145, 1.621988, 1.473336, 1, 1, 1, 1, 1,
1.388456, 0.6680238, 1.319101, 1, 1, 1, 1, 1,
1.392061, -0.6140754, 3.342578, 1, 1, 1, 1, 1,
1.401387, -0.9882576, 3.319532, 1, 1, 1, 1, 1,
1.412105, -0.3498985, 0.9619575, 1, 1, 1, 1, 1,
1.422966, -1.40629, 1.659905, 1, 1, 1, 1, 1,
1.423812, 1.420247, 0.03860858, 1, 1, 1, 1, 1,
1.424943, -0.2233951, -0.3306761, 1, 1, 1, 1, 1,
1.42543, 0.8362483, 1.24708, 1, 1, 1, 1, 1,
1.42627, 2.153096, 2.175561, 0, 0, 1, 1, 1,
1.439786, -0.2923853, 1.302969, 1, 0, 0, 1, 1,
1.453538, -0.6129134, 1.755126, 1, 0, 0, 1, 1,
1.463553, -0.1978512, 1.437009, 1, 0, 0, 1, 1,
1.471308, -0.820003, 1.569305, 1, 0, 0, 1, 1,
1.473678, 0.1201621, 4.036782, 1, 0, 0, 1, 1,
1.475423, -1.344328, 2.593866, 0, 0, 0, 1, 1,
1.477298, 1.539783, 0.8407833, 0, 0, 0, 1, 1,
1.485422, -0.9432955, 1.287343, 0, 0, 0, 1, 1,
1.499193, -0.1340356, 0.01079998, 0, 0, 0, 1, 1,
1.511187, -0.7317752, 2.677708, 0, 0, 0, 1, 1,
1.512184, 1.125061, 1.48481, 0, 0, 0, 1, 1,
1.51937, -0.4841006, 1.004207, 0, 0, 0, 1, 1,
1.532392, -1.817727, 2.957504, 1, 1, 1, 1, 1,
1.550242, -1.620635, 2.932959, 1, 1, 1, 1, 1,
1.555091, -0.7969456, 1.982665, 1, 1, 1, 1, 1,
1.595492, -0.1215928, 2.590737, 1, 1, 1, 1, 1,
1.603351, -0.5707834, 2.723745, 1, 1, 1, 1, 1,
1.60612, -0.1387961, 1.938147, 1, 1, 1, 1, 1,
1.615078, -0.3814961, 2.300558, 1, 1, 1, 1, 1,
1.623521, 1.32536, 1.99916, 1, 1, 1, 1, 1,
1.63107, -1.255373, 2.966604, 1, 1, 1, 1, 1,
1.655482, 0.2709889, 0.1760454, 1, 1, 1, 1, 1,
1.675683, -0.5714542, 2.330413, 1, 1, 1, 1, 1,
1.679324, 0.6690436, 2.185273, 1, 1, 1, 1, 1,
1.679804, -1.09527, 2.69238, 1, 1, 1, 1, 1,
1.684655, -0.4546473, -0.1028599, 1, 1, 1, 1, 1,
1.700965, 0.4138692, -0.5877075, 1, 1, 1, 1, 1,
1.704126, 0.4003694, 1.28381, 0, 0, 1, 1, 1,
1.712968, -1.579603, 0.7749972, 1, 0, 0, 1, 1,
1.730145, 0.9140882, 1.59503, 1, 0, 0, 1, 1,
1.747961, 1.632263, -1.190242, 1, 0, 0, 1, 1,
1.749497, -0.9558869, 2.952254, 1, 0, 0, 1, 1,
1.753982, 0.03369023, 2.042894, 1, 0, 0, 1, 1,
1.755244, -0.8390231, 1.292646, 0, 0, 0, 1, 1,
1.761615, -0.5584899, 2.087159, 0, 0, 0, 1, 1,
1.766209, -0.2089499, 1.602649, 0, 0, 0, 1, 1,
1.778781, 0.2874681, 2.436596, 0, 0, 0, 1, 1,
1.784789, 0.2574225, 1.664784, 0, 0, 0, 1, 1,
1.790711, -1.42045, 2.371722, 0, 0, 0, 1, 1,
1.818629, 1.041246, 1.057164, 0, 0, 0, 1, 1,
1.871368, -1.278512, 3.161535, 1, 1, 1, 1, 1,
1.904708, 0.4396259, 1.220445, 1, 1, 1, 1, 1,
1.909695, -0.160749, 1.31614, 1, 1, 1, 1, 1,
1.911155, 0.5671664, 0.2965253, 1, 1, 1, 1, 1,
1.955783, -1.460887, 2.566889, 1, 1, 1, 1, 1,
1.964936, -1.26848, 1.880715, 1, 1, 1, 1, 1,
1.979839, -1.771703, 2.138717, 1, 1, 1, 1, 1,
1.982993, 0.2100093, -0.06807617, 1, 1, 1, 1, 1,
1.991872, -0.6851141, 0.2263049, 1, 1, 1, 1, 1,
1.996624, -0.03079103, 0.8756883, 1, 1, 1, 1, 1,
2.007436, 0.2290141, 0.9771842, 1, 1, 1, 1, 1,
2.021848, -1.040267, 2.491433, 1, 1, 1, 1, 1,
2.035668, 0.4466889, 2.142718, 1, 1, 1, 1, 1,
2.076106, -0.1109429, 0.9724063, 1, 1, 1, 1, 1,
2.093828, 2.260789, 0.5632105, 1, 1, 1, 1, 1,
2.101681, -0.2193597, 2.289032, 0, 0, 1, 1, 1,
2.102139, 0.6968389, -0.4251706, 1, 0, 0, 1, 1,
2.104896, -1.024058, 2.302254, 1, 0, 0, 1, 1,
2.110431, 0.3374341, 0.8499984, 1, 0, 0, 1, 1,
2.122203, 1.114257, 1.094368, 1, 0, 0, 1, 1,
2.125012, -0.7736734, 1.543974, 1, 0, 0, 1, 1,
2.134239, 1.786243, 0.2576418, 0, 0, 0, 1, 1,
2.135356, -0.2282792, 1.957254, 0, 0, 0, 1, 1,
2.171367, -0.1891417, 0.6137905, 0, 0, 0, 1, 1,
2.214451, -1.16389, 1.454506, 0, 0, 0, 1, 1,
2.28382, -0.9011738, 1.176521, 0, 0, 0, 1, 1,
2.329551, 0.1003181, 3.641213, 0, 0, 0, 1, 1,
2.409742, -0.9807775, 2.555392, 0, 0, 0, 1, 1,
2.415086, 0.4524315, 1.682397, 1, 1, 1, 1, 1,
2.470461, -1.872103, 1.592484, 1, 1, 1, 1, 1,
2.504695, 0.09066004, 0.888284, 1, 1, 1, 1, 1,
2.554859, -0.353289, 2.424606, 1, 1, 1, 1, 1,
2.558342, 0.5039366, 0.6532102, 1, 1, 1, 1, 1,
2.641834, -1.578479, 1.493081, 1, 1, 1, 1, 1,
2.814442, -2.154403, 2.37997, 1, 1, 1, 1, 1
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
var radius = 9.164918;
var distance = 32.19138;
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
mvMatrix.translate( 0.1435136, 0.064466, -0.1082201 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.19138);
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
