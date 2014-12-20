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
-3.882863, 0.6963946, 0.3951654, 1, 0, 0, 1,
-2.892459, 2.031092, -0.5294793, 1, 0.007843138, 0, 1,
-2.740347, -0.4588399, -1.923159, 1, 0.01176471, 0, 1,
-2.489192, -0.5798688, -0.8216589, 1, 0.01960784, 0, 1,
-2.449054, -0.8948541, -2.639895, 1, 0.02352941, 0, 1,
-2.410482, 0.8915979, -0.3385451, 1, 0.03137255, 0, 1,
-2.3948, -0.1744585, -2.196663, 1, 0.03529412, 0, 1,
-2.3907, -0.7757812, -2.904299, 1, 0.04313726, 0, 1,
-2.285572, -0.4452127, -0.1018856, 1, 0.04705882, 0, 1,
-2.25425, -0.2034627, -2.161909, 1, 0.05490196, 0, 1,
-2.248764, 0.3149139, -1.439185, 1, 0.05882353, 0, 1,
-2.207526, -2.559479, -4.413994, 1, 0.06666667, 0, 1,
-2.205132, 0.05716247, -2.71133, 1, 0.07058824, 0, 1,
-2.19486, 0.7073556, 0.007047771, 1, 0.07843138, 0, 1,
-2.122513, -1.190164, -3.516505, 1, 0.08235294, 0, 1,
-2.117778, 1.136812, -0.4139561, 1, 0.09019608, 0, 1,
-2.079504, -0.2178618, -2.606478, 1, 0.09411765, 0, 1,
-2.063332, -1.725211, -2.309319, 1, 0.1019608, 0, 1,
-2.053416, 0.4918801, -0.9595436, 1, 0.1098039, 0, 1,
-2.039515, -0.2227386, -1.667122, 1, 0.1137255, 0, 1,
-2.03071, 0.3339413, -2.056526, 1, 0.1215686, 0, 1,
-2.009977, 1.539799, -0.4049097, 1, 0.1254902, 0, 1,
-1.980822, 1.556216, -0.3130957, 1, 0.1333333, 0, 1,
-1.974098, 0.4753803, -1.124001, 1, 0.1372549, 0, 1,
-1.943795, -0.6555715, -1.815768, 1, 0.145098, 0, 1,
-1.899649, 0.172265, -1.880538, 1, 0.1490196, 0, 1,
-1.896317, -0.4633302, -1.30688, 1, 0.1568628, 0, 1,
-1.889819, -2.245663, -1.554519, 1, 0.1607843, 0, 1,
-1.875875, 0.4404903, -1.652975, 1, 0.1686275, 0, 1,
-1.848726, -2.40614, -1.918324, 1, 0.172549, 0, 1,
-1.836481, 0.5596672, -1.585924, 1, 0.1803922, 0, 1,
-1.833903, 0.9115721, -1.583395, 1, 0.1843137, 0, 1,
-1.816248, 0.6457794, -0.266233, 1, 0.1921569, 0, 1,
-1.814529, 0.02701771, -3.788836, 1, 0.1960784, 0, 1,
-1.78303, 0.233757, -0.896416, 1, 0.2039216, 0, 1,
-1.781711, 0.2779277, -0.1128678, 1, 0.2117647, 0, 1,
-1.777168, 0.0217644, -2.838282, 1, 0.2156863, 0, 1,
-1.750278, 0.9841065, -0.1000848, 1, 0.2235294, 0, 1,
-1.747295, 0.577182, -2.746629, 1, 0.227451, 0, 1,
-1.720977, 0.4300697, -3.339774, 1, 0.2352941, 0, 1,
-1.717246, -0.1731931, 0.01690205, 1, 0.2392157, 0, 1,
-1.713133, 0.07204916, -2.61432, 1, 0.2470588, 0, 1,
-1.709294, 0.3569088, -3.113086, 1, 0.2509804, 0, 1,
-1.696339, 1.088933, 0.2236993, 1, 0.2588235, 0, 1,
-1.684026, 0.02043741, -3.632965, 1, 0.2627451, 0, 1,
-1.681069, -0.7013799, -4.164131, 1, 0.2705882, 0, 1,
-1.66393, -1.203248, -2.104839, 1, 0.2745098, 0, 1,
-1.651525, 1.849526, 0.567008, 1, 0.282353, 0, 1,
-1.64587, -0.2938343, -1.137657, 1, 0.2862745, 0, 1,
-1.639271, -0.763478, -1.38726, 1, 0.2941177, 0, 1,
-1.631154, -0.9187374, -1.844389, 1, 0.3019608, 0, 1,
-1.622206, 0.2060162, 0.6103168, 1, 0.3058824, 0, 1,
-1.617695, -0.06102971, -0.8367923, 1, 0.3137255, 0, 1,
-1.61741, 1.387697, -0.1045453, 1, 0.3176471, 0, 1,
-1.581292, 1.782437, -0.3476195, 1, 0.3254902, 0, 1,
-1.577369, -0.7447625, -2.780595, 1, 0.3294118, 0, 1,
-1.577257, -0.05813339, -2.161004, 1, 0.3372549, 0, 1,
-1.566791, -1.052974, -1.140218, 1, 0.3411765, 0, 1,
-1.563125, 0.003899245, -2.431616, 1, 0.3490196, 0, 1,
-1.541259, 1.073724, -1.260853, 1, 0.3529412, 0, 1,
-1.530118, 1.633222, -0.1271329, 1, 0.3607843, 0, 1,
-1.528472, 0.9426372, -1.282035, 1, 0.3647059, 0, 1,
-1.52484, -0.510475, -1.442476, 1, 0.372549, 0, 1,
-1.524142, -0.3949896, -2.306894, 1, 0.3764706, 0, 1,
-1.52326, 0.9058326, -0.9567541, 1, 0.3843137, 0, 1,
-1.52152, -0.3491546, -2.228042, 1, 0.3882353, 0, 1,
-1.520828, 0.691712, -0.4775703, 1, 0.3960784, 0, 1,
-1.515662, -0.7555921, -2.105245, 1, 0.4039216, 0, 1,
-1.512278, -0.0226725, -2.184167, 1, 0.4078431, 0, 1,
-1.500458, -1.189901, -2.795236, 1, 0.4156863, 0, 1,
-1.490012, 0.7663541, 0.120295, 1, 0.4196078, 0, 1,
-1.485801, -1.051954, -1.419526, 1, 0.427451, 0, 1,
-1.479477, -0.05707581, -0.3412334, 1, 0.4313726, 0, 1,
-1.475566, -0.248006, -0.773756, 1, 0.4392157, 0, 1,
-1.456924, -0.7046902, -2.375206, 1, 0.4431373, 0, 1,
-1.452422, -1.992355, -2.849318, 1, 0.4509804, 0, 1,
-1.4515, -1.11853, -2.329365, 1, 0.454902, 0, 1,
-1.415825, -0.3990409, -1.890285, 1, 0.4627451, 0, 1,
-1.409536, 0.7832301, -1.320984, 1, 0.4666667, 0, 1,
-1.404577, 0.02901408, -2.140956, 1, 0.4745098, 0, 1,
-1.395705, 1.645722, -1.205822, 1, 0.4784314, 0, 1,
-1.395205, 0.1229847, -1.999904, 1, 0.4862745, 0, 1,
-1.368721, 0.03275039, -0.6768361, 1, 0.4901961, 0, 1,
-1.356557, 0.5921189, -0.2895087, 1, 0.4980392, 0, 1,
-1.35287, 0.05059073, -2.673001, 1, 0.5058824, 0, 1,
-1.347601, -0.8450183, -3.303941, 1, 0.509804, 0, 1,
-1.342125, 1.833873, 0.71578, 1, 0.5176471, 0, 1,
-1.33632, -1.303652, -2.67366, 1, 0.5215687, 0, 1,
-1.329997, -0.1911503, -3.827691, 1, 0.5294118, 0, 1,
-1.321712, 0.7243703, -0.5323367, 1, 0.5333334, 0, 1,
-1.302794, 1.237715, -1.276317, 1, 0.5411765, 0, 1,
-1.300382, 3.303091, -0.5428855, 1, 0.5450981, 0, 1,
-1.295922, 0.2709546, -0.03739879, 1, 0.5529412, 0, 1,
-1.291352, -2.323098, -3.237402, 1, 0.5568628, 0, 1,
-1.284718, -0.5440884, -0.1572576, 1, 0.5647059, 0, 1,
-1.281745, 1.804634, -2.510243, 1, 0.5686275, 0, 1,
-1.274319, -1.132608, -2.171383, 1, 0.5764706, 0, 1,
-1.259253, 1.592907, 0.6633612, 1, 0.5803922, 0, 1,
-1.258752, -0.2670116, 0.09593894, 1, 0.5882353, 0, 1,
-1.257147, -0.3655395, -2.282662, 1, 0.5921569, 0, 1,
-1.257068, 0.02195498, -1.022797, 1, 0.6, 0, 1,
-1.241918, -0.748361, -2.647627, 1, 0.6078432, 0, 1,
-1.238452, -2.397001, -3.463497, 1, 0.6117647, 0, 1,
-1.232803, 0.4687167, -1.071624, 1, 0.6196079, 0, 1,
-1.210929, -0.5050667, -2.191889, 1, 0.6235294, 0, 1,
-1.20776, 0.9205089, 0.5412345, 1, 0.6313726, 0, 1,
-1.204275, 0.2817645, -1.583466, 1, 0.6352941, 0, 1,
-1.203628, 0.1682153, -0.7621698, 1, 0.6431373, 0, 1,
-1.195714, 0.8711456, -0.3014809, 1, 0.6470588, 0, 1,
-1.181553, -0.4338683, -1.719621, 1, 0.654902, 0, 1,
-1.178734, 2.034651, 0.2136102, 1, 0.6588235, 0, 1,
-1.177166, -1.187396, -3.237438, 1, 0.6666667, 0, 1,
-1.169085, -0.7243772, -0.3493183, 1, 0.6705883, 0, 1,
-1.162012, -0.02779914, -1.467357, 1, 0.6784314, 0, 1,
-1.159954, 0.3977515, -1.960744, 1, 0.682353, 0, 1,
-1.144809, -0.816492, -0.9920828, 1, 0.6901961, 0, 1,
-1.137867, 1.022837, 0.4181931, 1, 0.6941177, 0, 1,
-1.120281, -1.630133, 0.2426939, 1, 0.7019608, 0, 1,
-1.116194, 0.557367, -0.4887916, 1, 0.7098039, 0, 1,
-1.111943, -0.3801892, -1.677097, 1, 0.7137255, 0, 1,
-1.11019, -0.2201315, -3.102957, 1, 0.7215686, 0, 1,
-1.107576, 0.1370823, -3.127519, 1, 0.7254902, 0, 1,
-1.10085, -0.7709945, -2.655405, 1, 0.7333333, 0, 1,
-1.093417, -0.4392274, -1.089771, 1, 0.7372549, 0, 1,
-1.089573, 0.2972497, -1.860793, 1, 0.7450981, 0, 1,
-1.087547, 1.359174, -1.250466, 1, 0.7490196, 0, 1,
-1.084351, 0.4259006, -0.1241991, 1, 0.7568628, 0, 1,
-1.081553, 0.01816843, -1.103275, 1, 0.7607843, 0, 1,
-1.080466, -1.836879, -2.544624, 1, 0.7686275, 0, 1,
-1.076173, -0.7133316, -1.464617, 1, 0.772549, 0, 1,
-1.075444, -0.3097005, -3.120604, 1, 0.7803922, 0, 1,
-1.075131, 1.96043, -0.5945911, 1, 0.7843137, 0, 1,
-1.071214, -0.3549706, -2.133955, 1, 0.7921569, 0, 1,
-1.070933, -0.433223, -2.342161, 1, 0.7960784, 0, 1,
-1.069541, 0.4373353, -0.0386007, 1, 0.8039216, 0, 1,
-1.053372, -1.121963, -0.9188918, 1, 0.8117647, 0, 1,
-1.047623, 0.2213842, 0.3664138, 1, 0.8156863, 0, 1,
-1.040186, 0.9889622, -3.037893, 1, 0.8235294, 0, 1,
-1.037583, -1.245455, -2.208998, 1, 0.827451, 0, 1,
-1.03478, -1.075479, -1.486714, 1, 0.8352941, 0, 1,
-1.03455, -0.03091307, -1.697774, 1, 0.8392157, 0, 1,
-1.030994, 0.04918975, -1.486656, 1, 0.8470588, 0, 1,
-1.025732, -0.3315648, -1.42059, 1, 0.8509804, 0, 1,
-1.020533, 2.191889, -0.6620218, 1, 0.8588235, 0, 1,
-1.015369, -1.843319, -1.359164, 1, 0.8627451, 0, 1,
-1.013213, -0.3363371, -1.677405, 1, 0.8705882, 0, 1,
-1.010906, -0.3662971, -2.397588, 1, 0.8745098, 0, 1,
-1.010698, -1.287537, -2.799191, 1, 0.8823529, 0, 1,
-1.010612, 0.3085537, 1.107698, 1, 0.8862745, 0, 1,
-1.006245, -0.138368, -1.441294, 1, 0.8941177, 0, 1,
-1.005493, -1.685181, -1.83356, 1, 0.8980392, 0, 1,
-0.9948109, 0.03873968, -1.684883, 1, 0.9058824, 0, 1,
-0.9921807, -0.5414166, -1.702464, 1, 0.9137255, 0, 1,
-0.9910915, -0.08785595, -2.035952, 1, 0.9176471, 0, 1,
-0.9773284, 1.978773, -0.9476373, 1, 0.9254902, 0, 1,
-0.9715803, -0.1288219, -0.5950902, 1, 0.9294118, 0, 1,
-0.9687886, 1.051257, 0.3980495, 1, 0.9372549, 0, 1,
-0.962592, 0.5327457, -2.365701, 1, 0.9411765, 0, 1,
-0.9549602, 1.379206, -2.566033, 1, 0.9490196, 0, 1,
-0.9486694, 0.2175484, -1.58943, 1, 0.9529412, 0, 1,
-0.9475157, 1.387153, -1.318789, 1, 0.9607843, 0, 1,
-0.9430942, 1.698341, -1.437507, 1, 0.9647059, 0, 1,
-0.9368471, 0.3043627, -1.33539, 1, 0.972549, 0, 1,
-0.9360178, -0.04942198, -2.747288, 1, 0.9764706, 0, 1,
-0.9331419, -0.860664, -3.120186, 1, 0.9843137, 0, 1,
-0.931053, 0.9479741, -1.188869, 1, 0.9882353, 0, 1,
-0.9307734, -0.1220797, -2.285657, 1, 0.9960784, 0, 1,
-0.9246134, -0.9782831, -2.473332, 0.9960784, 1, 0, 1,
-0.9231342, -1.788831, -2.262847, 0.9921569, 1, 0, 1,
-0.9208196, -0.0816432, -1.06552, 0.9843137, 1, 0, 1,
-0.9098195, 0.06285898, 0.5732383, 0.9803922, 1, 0, 1,
-0.9081755, 1.234942, -1.459896, 0.972549, 1, 0, 1,
-0.9026843, 1.620506, -0.4783652, 0.9686275, 1, 0, 1,
-0.9025819, 0.6362482, 1.346646, 0.9607843, 1, 0, 1,
-0.9008207, 0.8214859, 0.09909727, 0.9568627, 1, 0, 1,
-0.8989087, -0.4054158, -3.13713, 0.9490196, 1, 0, 1,
-0.8978103, -0.9201578, -1.127928, 0.945098, 1, 0, 1,
-0.8960314, -0.03438406, -1.36339, 0.9372549, 1, 0, 1,
-0.8943503, 0.1083097, -1.854455, 0.9333333, 1, 0, 1,
-0.8918723, -0.1407085, -2.871482, 0.9254902, 1, 0, 1,
-0.8882945, -0.3592485, -2.784899, 0.9215686, 1, 0, 1,
-0.8847521, -0.966031, -2.756794, 0.9137255, 1, 0, 1,
-0.8700401, -0.7171596, -2.096276, 0.9098039, 1, 0, 1,
-0.8681964, -1.688815, -3.885199, 0.9019608, 1, 0, 1,
-0.8681822, 1.124565, -2.175073, 0.8941177, 1, 0, 1,
-0.8676825, 0.1274615, -1.278238, 0.8901961, 1, 0, 1,
-0.8639514, 0.8489249, -2.757227, 0.8823529, 1, 0, 1,
-0.8637516, 0.6086133, -0.8835765, 0.8784314, 1, 0, 1,
-0.8542168, 0.287474, -0.6872905, 0.8705882, 1, 0, 1,
-0.8486579, 0.6753557, -0.8184338, 0.8666667, 1, 0, 1,
-0.8480519, 0.3297824, -2.042656, 0.8588235, 1, 0, 1,
-0.8466042, -0.136877, -0.6851088, 0.854902, 1, 0, 1,
-0.8396479, 0.03825924, -0.9586543, 0.8470588, 1, 0, 1,
-0.8225722, -1.701576, -3.867012, 0.8431373, 1, 0, 1,
-0.8221457, -0.6646926, -0.7387105, 0.8352941, 1, 0, 1,
-0.8215315, -0.4864535, -3.679211, 0.8313726, 1, 0, 1,
-0.8206576, 1.350049, -0.01404926, 0.8235294, 1, 0, 1,
-0.8199651, 1.459001, -0.5163507, 0.8196079, 1, 0, 1,
-0.8182202, -0.1121573, -1.709648, 0.8117647, 1, 0, 1,
-0.8117845, 0.9674268, -0.7391253, 0.8078431, 1, 0, 1,
-0.8094845, -0.3665375, -2.098062, 0.8, 1, 0, 1,
-0.804233, -0.4381444, -1.649316, 0.7921569, 1, 0, 1,
-0.7986748, 1.154938, 0.154519, 0.7882353, 1, 0, 1,
-0.7979186, -0.6896883, -2.273035, 0.7803922, 1, 0, 1,
-0.7961341, -0.7565214, -1.396304, 0.7764706, 1, 0, 1,
-0.7958615, -0.7499152, -2.070003, 0.7686275, 1, 0, 1,
-0.7954283, 0.4713682, -1.413505, 0.7647059, 1, 0, 1,
-0.7934533, -0.1653652, -4.138124, 0.7568628, 1, 0, 1,
-0.7925584, 0.4197371, -1.8919, 0.7529412, 1, 0, 1,
-0.7920737, 1.398169, 0.7788255, 0.7450981, 1, 0, 1,
-0.7912796, -0.2600567, -2.437394, 0.7411765, 1, 0, 1,
-0.7905185, 0.01055377, -2.075686, 0.7333333, 1, 0, 1,
-0.790261, 0.2461117, -2.328326, 0.7294118, 1, 0, 1,
-0.7849556, 2.304844, -0.67085, 0.7215686, 1, 0, 1,
-0.7830006, 0.7812495, 0.07781287, 0.7176471, 1, 0, 1,
-0.7793431, -0.9571176, -1.60244, 0.7098039, 1, 0, 1,
-0.7751359, 0.2273812, -2.255214, 0.7058824, 1, 0, 1,
-0.7723888, 0.2374467, 1.434847, 0.6980392, 1, 0, 1,
-0.7698814, -0.5675698, -2.285426, 0.6901961, 1, 0, 1,
-0.7680956, -1.26129, -2.848808, 0.6862745, 1, 0, 1,
-0.7612967, -0.2247033, -1.688221, 0.6784314, 1, 0, 1,
-0.7562156, -0.348769, 0.3794948, 0.6745098, 1, 0, 1,
-0.7560148, -0.5183821, -2.049624, 0.6666667, 1, 0, 1,
-0.7553717, -0.1006863, -3.695253, 0.6627451, 1, 0, 1,
-0.7540849, 0.5106905, 0.3413489, 0.654902, 1, 0, 1,
-0.7486908, 1.416571, 0.7297929, 0.6509804, 1, 0, 1,
-0.7437977, 0.5493236, -2.104351, 0.6431373, 1, 0, 1,
-0.7416003, 0.7002373, -1.061226, 0.6392157, 1, 0, 1,
-0.7400138, 0.7294493, 0.6587214, 0.6313726, 1, 0, 1,
-0.7326802, -0.2077282, 0.01511125, 0.627451, 1, 0, 1,
-0.7324253, -0.1013259, -1.872629, 0.6196079, 1, 0, 1,
-0.724717, 1.163194, -0.1518784, 0.6156863, 1, 0, 1,
-0.7244026, -0.4741527, -1.89988, 0.6078432, 1, 0, 1,
-0.7223284, 0.3063816, -0.5561282, 0.6039216, 1, 0, 1,
-0.7214454, -0.3193973, -3.657712, 0.5960785, 1, 0, 1,
-0.7131199, 0.2399096, -1.879479, 0.5882353, 1, 0, 1,
-0.7079096, 0.742707, -0.01941423, 0.5843138, 1, 0, 1,
-0.7044843, -1.211406, -1.288093, 0.5764706, 1, 0, 1,
-0.7044252, -0.6982085, -1.686954, 0.572549, 1, 0, 1,
-0.7033805, -1.52629, -4.470998, 0.5647059, 1, 0, 1,
-0.7031329, 0.4419963, -0.2280939, 0.5607843, 1, 0, 1,
-0.702293, 0.3354738, -0.3940622, 0.5529412, 1, 0, 1,
-0.7001624, 0.8730191, -1.642751, 0.5490196, 1, 0, 1,
-0.6941419, 0.3307963, -0.7580491, 0.5411765, 1, 0, 1,
-0.6907471, 1.405192, -0.06165666, 0.5372549, 1, 0, 1,
-0.6901638, 0.9859563, -2.016119, 0.5294118, 1, 0, 1,
-0.6898929, -0.04579367, -3.99957, 0.5254902, 1, 0, 1,
-0.6889981, 0.4651777, -1.099617, 0.5176471, 1, 0, 1,
-0.6884284, 0.9271409, 0.40435, 0.5137255, 1, 0, 1,
-0.6881208, -0.4365058, -0.809656, 0.5058824, 1, 0, 1,
-0.6837632, 0.7993147, -0.7260782, 0.5019608, 1, 0, 1,
-0.6832858, 1.078839, 0.6937791, 0.4941176, 1, 0, 1,
-0.6831288, -1.656691, -1.695592, 0.4862745, 1, 0, 1,
-0.6798055, -0.541434, -2.821195, 0.4823529, 1, 0, 1,
-0.6774039, -1.832647, -1.80359, 0.4745098, 1, 0, 1,
-0.6682031, 0.4327017, -1.256649, 0.4705882, 1, 0, 1,
-0.6651093, 0.4303704, -0.02646966, 0.4627451, 1, 0, 1,
-0.658867, 0.9855244, -0.07595465, 0.4588235, 1, 0, 1,
-0.6584011, 0.8751034, -1.297609, 0.4509804, 1, 0, 1,
-0.6565248, -0.03301891, -3.135001, 0.4470588, 1, 0, 1,
-0.6565149, 0.2962659, 0.2927323, 0.4392157, 1, 0, 1,
-0.6507322, 0.9269634, -1.560846, 0.4352941, 1, 0, 1,
-0.6487536, 0.2324451, -1.564921, 0.427451, 1, 0, 1,
-0.6471933, -0.5803151, -3.123813, 0.4235294, 1, 0, 1,
-0.643314, -1.931646, -4.513355, 0.4156863, 1, 0, 1,
-0.6408718, 0.8407819, -0.2023911, 0.4117647, 1, 0, 1,
-0.6402061, 1.227194, -3.280139, 0.4039216, 1, 0, 1,
-0.6363681, -1.32172, -2.024931, 0.3960784, 1, 0, 1,
-0.6304272, 0.478588, -0.6577337, 0.3921569, 1, 0, 1,
-0.6265198, -0.01734416, -1.824511, 0.3843137, 1, 0, 1,
-0.6251268, 1.383384, -1.390728, 0.3803922, 1, 0, 1,
-0.6152445, -1.11225, -1.588916, 0.372549, 1, 0, 1,
-0.6111136, 0.7897166, -0.4258699, 0.3686275, 1, 0, 1,
-0.6086748, -0.102399, -2.312922, 0.3607843, 1, 0, 1,
-0.608173, -0.06436433, -2.561593, 0.3568628, 1, 0, 1,
-0.6013814, -0.149203, -0.8724436, 0.3490196, 1, 0, 1,
-0.5987123, -0.9787394, -2.413721, 0.345098, 1, 0, 1,
-0.5983478, -0.9377782, -4.320393, 0.3372549, 1, 0, 1,
-0.5967022, -0.1179589, -2.642091, 0.3333333, 1, 0, 1,
-0.5956976, -0.03987418, -1.808922, 0.3254902, 1, 0, 1,
-0.5952782, -0.4055968, -2.707755, 0.3215686, 1, 0, 1,
-0.5914235, 0.162359, -2.406991, 0.3137255, 1, 0, 1,
-0.5865515, 1.184525, -2.281583, 0.3098039, 1, 0, 1,
-0.5821725, 0.3261758, -1.477168, 0.3019608, 1, 0, 1,
-0.5792596, -0.3492259, -2.765263, 0.2941177, 1, 0, 1,
-0.577282, -2.240941, -2.142358, 0.2901961, 1, 0, 1,
-0.5715388, -0.2937156, -1.690083, 0.282353, 1, 0, 1,
-0.5639807, 0.7453365, -0.9203225, 0.2784314, 1, 0, 1,
-0.561909, 1.249003, -0.6861202, 0.2705882, 1, 0, 1,
-0.5589792, -0.2238237, -1.665612, 0.2666667, 1, 0, 1,
-0.5541968, 0.4196581, -1.458061, 0.2588235, 1, 0, 1,
-0.549449, 1.12463, -1.007052, 0.254902, 1, 0, 1,
-0.5484141, 0.5309373, 0.2340254, 0.2470588, 1, 0, 1,
-0.5470216, -0.3281175, -1.255387, 0.2431373, 1, 0, 1,
-0.5427611, 0.8442591, -1.965959, 0.2352941, 1, 0, 1,
-0.540669, 2.187374, 0.8630628, 0.2313726, 1, 0, 1,
-0.5385821, 0.6153873, -0.7925749, 0.2235294, 1, 0, 1,
-0.5382051, 0.1606808, -1.565625, 0.2196078, 1, 0, 1,
-0.5379333, 0.07867204, -2.248746, 0.2117647, 1, 0, 1,
-0.5326228, 0.4127986, -1.848066, 0.2078431, 1, 0, 1,
-0.5325555, -0.9205486, -3.696367, 0.2, 1, 0, 1,
-0.5263972, 0.003027984, -2.526031, 0.1921569, 1, 0, 1,
-0.5228507, -1.233987, -1.599901, 0.1882353, 1, 0, 1,
-0.5176008, -0.5716612, -3.160421, 0.1803922, 1, 0, 1,
-0.5170637, 0.3593054, -0.5595076, 0.1764706, 1, 0, 1,
-0.5148212, 0.1644778, -1.054426, 0.1686275, 1, 0, 1,
-0.5109054, 0.6898881, 1.170258, 0.1647059, 1, 0, 1,
-0.51004, 0.1893328, -1.246944, 0.1568628, 1, 0, 1,
-0.5066227, 1.149604, -1.350764, 0.1529412, 1, 0, 1,
-0.5066195, -0.747078, -0.8964124, 0.145098, 1, 0, 1,
-0.5062357, 1.356848, -0.8703007, 0.1411765, 1, 0, 1,
-0.5044649, -0.09034142, 0.768957, 0.1333333, 1, 0, 1,
-0.5002098, -0.7674949, -1.97447, 0.1294118, 1, 0, 1,
-0.4993128, -1.723564, -2.669493, 0.1215686, 1, 0, 1,
-0.4976632, -2.121146, -2.681046, 0.1176471, 1, 0, 1,
-0.4973585, 0.1390283, 0.584239, 0.1098039, 1, 0, 1,
-0.4846078, 0.4900907, -2.537678, 0.1058824, 1, 0, 1,
-0.4833267, -0.06231181, -1.223227, 0.09803922, 1, 0, 1,
-0.4814484, 1.143792, -0.1480097, 0.09019608, 1, 0, 1,
-0.4784859, 1.135122, -0.7865924, 0.08627451, 1, 0, 1,
-0.477562, 0.389197, -1.35987, 0.07843138, 1, 0, 1,
-0.4758778, -0.9476527, -2.931324, 0.07450981, 1, 0, 1,
-0.4752949, -0.06824332, -1.522697, 0.06666667, 1, 0, 1,
-0.4739334, -0.4436209, -3.408777, 0.0627451, 1, 0, 1,
-0.4734537, -1.204356, -1.988044, 0.05490196, 1, 0, 1,
-0.4695564, -0.8936153, -3.935912, 0.05098039, 1, 0, 1,
-0.468542, 0.572495, -0.4475901, 0.04313726, 1, 0, 1,
-0.4517152, 0.6922511, -2.275258, 0.03921569, 1, 0, 1,
-0.4513379, -0.0406416, -2.450331, 0.03137255, 1, 0, 1,
-0.446368, -1.258512, -2.157004, 0.02745098, 1, 0, 1,
-0.4453586, 0.8949842, -1.633664, 0.01960784, 1, 0, 1,
-0.4422668, -0.1513133, -2.588259, 0.01568628, 1, 0, 1,
-0.4405665, 0.9082385, -1.210239, 0.007843138, 1, 0, 1,
-0.435969, -0.906763, -2.788781, 0.003921569, 1, 0, 1,
-0.4350198, -0.5316921, -2.99114, 0, 1, 0.003921569, 1,
-0.4326199, 1.054955, -1.480324, 0, 1, 0.01176471, 1,
-0.4272791, 1.251227, -1.424191, 0, 1, 0.01568628, 1,
-0.4268615, -0.1554286, -1.753114, 0, 1, 0.02352941, 1,
-0.4233652, 0.4133331, -0.2725656, 0, 1, 0.02745098, 1,
-0.4232227, 1.163314, 0.3707489, 0, 1, 0.03529412, 1,
-0.4218415, 0.9393654, -0.03420566, 0, 1, 0.03921569, 1,
-0.4087882, -0.7346607, -2.844023, 0, 1, 0.04705882, 1,
-0.4057026, -1.025565, -3.533162, 0, 1, 0.05098039, 1,
-0.402943, -0.4453486, -2.696284, 0, 1, 0.05882353, 1,
-0.4019823, -2.064939, -3.836366, 0, 1, 0.0627451, 1,
-0.3944885, 1.477996, -0.5443797, 0, 1, 0.07058824, 1,
-0.3888587, -0.4671967, -3.021713, 0, 1, 0.07450981, 1,
-0.3862621, -0.2428414, -2.504974, 0, 1, 0.08235294, 1,
-0.3828032, -0.2828878, -1.624616, 0, 1, 0.08627451, 1,
-0.3802232, -0.8811499, -2.958241, 0, 1, 0.09411765, 1,
-0.3795112, 1.146671, 0.4400686, 0, 1, 0.1019608, 1,
-0.3638264, 0.8209152, 0.6236473, 0, 1, 0.1058824, 1,
-0.3632835, -1.972867, -3.205799, 0, 1, 0.1137255, 1,
-0.3614544, 0.3462773, 0.4329587, 0, 1, 0.1176471, 1,
-0.3586748, 0.6771773, -0.6044063, 0, 1, 0.1254902, 1,
-0.3566753, -0.06334722, 0.2632397, 0, 1, 0.1294118, 1,
-0.3508094, -0.570178, -2.317351, 0, 1, 0.1372549, 1,
-0.344407, 1.290372, -0.5239871, 0, 1, 0.1411765, 1,
-0.3410521, 0.6486403, 0.737789, 0, 1, 0.1490196, 1,
-0.340668, 0.5095881, -1.187294, 0, 1, 0.1529412, 1,
-0.3374205, 1.394569, 0.2386062, 0, 1, 0.1607843, 1,
-0.3367543, -0.8407321, -3.360651, 0, 1, 0.1647059, 1,
-0.3324181, 1.485468, 0.9593995, 0, 1, 0.172549, 1,
-0.3306221, -0.5319724, 0.00650865, 0, 1, 0.1764706, 1,
-0.3299871, 0.1396737, 0.2868041, 0, 1, 0.1843137, 1,
-0.3286532, -0.2756134, -2.147132, 0, 1, 0.1882353, 1,
-0.3261224, -0.3425117, -2.860885, 0, 1, 0.1960784, 1,
-0.3205188, 0.2979127, -0.8308709, 0, 1, 0.2039216, 1,
-0.3160794, 1.139965, 0.1522834, 0, 1, 0.2078431, 1,
-0.3059984, 1.374109, 0.3920546, 0, 1, 0.2156863, 1,
-0.301227, 1.479002, -0.8838561, 0, 1, 0.2196078, 1,
-0.3000323, 0.5807143, -1.4484, 0, 1, 0.227451, 1,
-0.296782, 0.3423437, -1.421524, 0, 1, 0.2313726, 1,
-0.2941544, -0.5364592, -3.929442, 0, 1, 0.2392157, 1,
-0.2856684, 0.6249821, -1.226305, 0, 1, 0.2431373, 1,
-0.2851425, 2.023791, -0.43328, 0, 1, 0.2509804, 1,
-0.2798621, -0.2348588, -3.022489, 0, 1, 0.254902, 1,
-0.278553, 1.654952, -0.14249, 0, 1, 0.2627451, 1,
-0.2744688, -0.5122609, -2.961373, 0, 1, 0.2666667, 1,
-0.273831, -0.101607, -1.10513, 0, 1, 0.2745098, 1,
-0.263664, -2.177521, -3.487694, 0, 1, 0.2784314, 1,
-0.2626261, 0.06164534, 0.9155827, 0, 1, 0.2862745, 1,
-0.2620316, -0.3966892, -3.513612, 0, 1, 0.2901961, 1,
-0.2577531, 0.01161147, -1.24699, 0, 1, 0.2980392, 1,
-0.2553873, -0.4801211, -4.272692, 0, 1, 0.3058824, 1,
-0.2500913, 0.2236189, -1.710183, 0, 1, 0.3098039, 1,
-0.2489404, -0.3047167, -2.62046, 0, 1, 0.3176471, 1,
-0.2480692, 0.1040446, -1.451391, 0, 1, 0.3215686, 1,
-0.2437361, -1.425725, -2.085106, 0, 1, 0.3294118, 1,
-0.2334442, 1.270086, -1.083533, 0, 1, 0.3333333, 1,
-0.2318033, 0.1810359, -1.796933, 0, 1, 0.3411765, 1,
-0.2281732, 0.7725861, -1.337199, 0, 1, 0.345098, 1,
-0.2173475, -0.3005132, -3.732516, 0, 1, 0.3529412, 1,
-0.2131896, -0.6630525, -3.893183, 0, 1, 0.3568628, 1,
-0.2119539, -1.558095, -2.856945, 0, 1, 0.3647059, 1,
-0.2100799, 1.576006, 0.2665714, 0, 1, 0.3686275, 1,
-0.2060472, 2.497544, -1.573482, 0, 1, 0.3764706, 1,
-0.2054961, -2.177852, -2.233066, 0, 1, 0.3803922, 1,
-0.201658, -0.1276647, -0.6467633, 0, 1, 0.3882353, 1,
-0.2010864, -0.3561239, -4.499987, 0, 1, 0.3921569, 1,
-0.1988406, 1.444549, 1.185074, 0, 1, 0.4, 1,
-0.1965244, 0.0289376, 0.29321, 0, 1, 0.4078431, 1,
-0.1964571, 0.646884, 0.5272383, 0, 1, 0.4117647, 1,
-0.1896875, 1.764588, -0.1254944, 0, 1, 0.4196078, 1,
-0.1880511, 1.324226, 0.8374, 0, 1, 0.4235294, 1,
-0.1846306, -0.9050427, -2.952706, 0, 1, 0.4313726, 1,
-0.1824291, -0.5371066, -2.433146, 0, 1, 0.4352941, 1,
-0.1746836, 1.785487, 1.501569, 0, 1, 0.4431373, 1,
-0.1721971, -0.216979, -2.318356, 0, 1, 0.4470588, 1,
-0.1689989, -0.287531, 0.2748736, 0, 1, 0.454902, 1,
-0.1683655, -0.6174321, -2.355695, 0, 1, 0.4588235, 1,
-0.166124, -0.9205101, -1.905286, 0, 1, 0.4666667, 1,
-0.1543013, -0.5989082, -2.531349, 0, 1, 0.4705882, 1,
-0.1537841, -0.2072034, -2.874721, 0, 1, 0.4784314, 1,
-0.1505983, -0.8318121, -1.623949, 0, 1, 0.4823529, 1,
-0.1496442, -0.4595641, -3.483028, 0, 1, 0.4901961, 1,
-0.1488664, -0.2478867, -1.391279, 0, 1, 0.4941176, 1,
-0.1483439, -1.999838, -2.213307, 0, 1, 0.5019608, 1,
-0.146312, 0.7037975, -1.427899, 0, 1, 0.509804, 1,
-0.1432456, 0.332072, -1.261715, 0, 1, 0.5137255, 1,
-0.14247, 0.662009, -1.764924, 0, 1, 0.5215687, 1,
-0.1420732, -0.1374799, -1.041693, 0, 1, 0.5254902, 1,
-0.1416468, 2.221643, 0.7845562, 0, 1, 0.5333334, 1,
-0.1412179, -0.7725721, -3.251754, 0, 1, 0.5372549, 1,
-0.1409804, 0.7015831, -0.225658, 0, 1, 0.5450981, 1,
-0.1406353, 1.252766, -0.3766484, 0, 1, 0.5490196, 1,
-0.1377126, -0.8584366, -4.608319, 0, 1, 0.5568628, 1,
-0.1374628, -0.05322398, -2.480545, 0, 1, 0.5607843, 1,
-0.1359967, -1.863112, -3.194031, 0, 1, 0.5686275, 1,
-0.1350499, -0.7428916, -4.501757, 0, 1, 0.572549, 1,
-0.132973, -1.920992, -1.134944, 0, 1, 0.5803922, 1,
-0.127703, 0.1628177, -0.8760932, 0, 1, 0.5843138, 1,
-0.1269649, 0.5412291, 0.06514694, 0, 1, 0.5921569, 1,
-0.1268196, 1.506278, 0.01420949, 0, 1, 0.5960785, 1,
-0.121887, 0.3313726, -2.370851, 0, 1, 0.6039216, 1,
-0.1195737, -0.8997359, -4.804429, 0, 1, 0.6117647, 1,
-0.1160942, 0.04287632, -2.018094, 0, 1, 0.6156863, 1,
-0.1150391, -0.5829976, -2.762667, 0, 1, 0.6235294, 1,
-0.1134784, 0.4259022, 0.1635537, 0, 1, 0.627451, 1,
-0.1092463, -2.055533, -4.856162, 0, 1, 0.6352941, 1,
-0.1090968, -0.338615, -3.107046, 0, 1, 0.6392157, 1,
-0.1085561, -0.7885573, -3.055212, 0, 1, 0.6470588, 1,
-0.09436614, -0.157798, -2.264691, 0, 1, 0.6509804, 1,
-0.09217703, 0.2631047, -1.030453, 0, 1, 0.6588235, 1,
-0.09110764, -1.033415, -2.482681, 0, 1, 0.6627451, 1,
-0.09055377, 1.609449, -0.2885799, 0, 1, 0.6705883, 1,
-0.08743925, 0.06164409, 0.7428299, 0, 1, 0.6745098, 1,
-0.08734511, -2.154581, -2.8243, 0, 1, 0.682353, 1,
-0.08610383, 0.1643786, -0.6515827, 0, 1, 0.6862745, 1,
-0.08492392, 1.515578, -2.151169, 0, 1, 0.6941177, 1,
-0.08340137, -0.1146549, -3.029623, 0, 1, 0.7019608, 1,
-0.08073869, -1.788403, -3.366068, 0, 1, 0.7058824, 1,
-0.07166092, 0.7372946, -0.8995612, 0, 1, 0.7137255, 1,
-0.07030956, -1.058301, -3.699162, 0, 1, 0.7176471, 1,
-0.06965205, -0.6527337, -1.761316, 0, 1, 0.7254902, 1,
-0.06769068, -0.201429, -2.338959, 0, 1, 0.7294118, 1,
-0.06501076, -0.05246777, -0.5187316, 0, 1, 0.7372549, 1,
-0.06406607, -0.8492504, -4.437329, 0, 1, 0.7411765, 1,
-0.06026443, -0.3744942, -2.343868, 0, 1, 0.7490196, 1,
-0.06025414, 0.9538826, -0.3675412, 0, 1, 0.7529412, 1,
-0.05905027, -1.21339, -0.4133668, 0, 1, 0.7607843, 1,
-0.05851744, 1.459482, 1.29521, 0, 1, 0.7647059, 1,
-0.0573453, 1.203409, 0.2503809, 0, 1, 0.772549, 1,
-0.05631339, -0.4789339, -2.146745, 0, 1, 0.7764706, 1,
-0.05507056, 0.9583423, 1.221177, 0, 1, 0.7843137, 1,
-0.05369142, -1.045138, -2.644835, 0, 1, 0.7882353, 1,
-0.05233381, -1.505663, -2.007035, 0, 1, 0.7960784, 1,
-0.05219589, 0.385758, -0.1481141, 0, 1, 0.8039216, 1,
-0.0457724, 1.12764, -0.4593335, 0, 1, 0.8078431, 1,
-0.03359605, 0.5482851, -1.196083, 0, 1, 0.8156863, 1,
-0.03287744, -0.1423965, -3.489877, 0, 1, 0.8196079, 1,
-0.02771676, -1.870172, -4.313437, 0, 1, 0.827451, 1,
-0.02767242, -2.046195, -3.527414, 0, 1, 0.8313726, 1,
-0.0264125, 0.01179919, -2.120763, 0, 1, 0.8392157, 1,
-0.02625238, 1.341106, 0.1836784, 0, 1, 0.8431373, 1,
-0.02252027, 0.004346135, -1.060662, 0, 1, 0.8509804, 1,
-0.02234596, -0.5713854, -2.472972, 0, 1, 0.854902, 1,
-0.01990023, 0.7320214, -0.1950553, 0, 1, 0.8627451, 1,
-0.01578915, -0.2758197, -4.394574, 0, 1, 0.8666667, 1,
-0.01297337, -0.6879929, -3.733562, 0, 1, 0.8745098, 1,
-0.01043362, 0.584464, -0.2048071, 0, 1, 0.8784314, 1,
-0.01037701, -0.2765624, -2.676543, 0, 1, 0.8862745, 1,
-0.004062379, -0.8428658, -3.001508, 0, 1, 0.8901961, 1,
0.00314667, 0.6202601, -2.286098, 0, 1, 0.8980392, 1,
0.008315047, 0.4380821, -0.5686997, 0, 1, 0.9058824, 1,
0.01109272, 0.3664232, 0.935901, 0, 1, 0.9098039, 1,
0.01488388, -0.6599374, 4.100703, 0, 1, 0.9176471, 1,
0.02040341, -0.1322781, 3.010061, 0, 1, 0.9215686, 1,
0.02184969, 0.3918235, 0.1079385, 0, 1, 0.9294118, 1,
0.02207558, -0.611389, 2.043617, 0, 1, 0.9333333, 1,
0.02640283, -0.02469086, 1.415879, 0, 1, 0.9411765, 1,
0.02765014, -1.510169, 1.401652, 0, 1, 0.945098, 1,
0.02771797, -0.2123845, 2.420549, 0, 1, 0.9529412, 1,
0.02825279, 0.4728097, 1.313117, 0, 1, 0.9568627, 1,
0.02945535, -2.235027, 2.573829, 0, 1, 0.9647059, 1,
0.03174528, -1.705145, 2.09764, 0, 1, 0.9686275, 1,
0.03852857, -0.8650547, 4.966953, 0, 1, 0.9764706, 1,
0.03883857, -0.8184313, 3.048226, 0, 1, 0.9803922, 1,
0.0419216, 0.7001357, -0.2368499, 0, 1, 0.9882353, 1,
0.04482503, -2.002632, 3.889638, 0, 1, 0.9921569, 1,
0.04558926, -0.2091897, 2.903471, 0, 1, 1, 1,
0.04818079, -1.629721, 2.368683, 0, 0.9921569, 1, 1,
0.05247474, -0.3627368, 4.984251, 0, 0.9882353, 1, 1,
0.05281261, 0.6203245, 1.266946, 0, 0.9803922, 1, 1,
0.05310511, 1.164809, 0.5538145, 0, 0.9764706, 1, 1,
0.05820236, 0.7095177, -0.1282659, 0, 0.9686275, 1, 1,
0.05820307, -0.0622271, 2.17304, 0, 0.9647059, 1, 1,
0.05907857, -0.9794879, 1.447209, 0, 0.9568627, 1, 1,
0.05976478, 0.114875, 1.27694, 0, 0.9529412, 1, 1,
0.06210511, 0.5825571, 0.1939525, 0, 0.945098, 1, 1,
0.06326838, -0.6987864, 2.436343, 0, 0.9411765, 1, 1,
0.06890959, -0.9957146, 4.449142, 0, 0.9333333, 1, 1,
0.0724043, 0.04911871, 1.707017, 0, 0.9294118, 1, 1,
0.08380005, -0.7769989, 1.511792, 0, 0.9215686, 1, 1,
0.08546175, -0.7299069, 1.513965, 0, 0.9176471, 1, 1,
0.08730244, -0.0518433, 0.5676897, 0, 0.9098039, 1, 1,
0.08739632, -0.0001161186, 0.8542301, 0, 0.9058824, 1, 1,
0.09488954, -0.2132791, 2.588656, 0, 0.8980392, 1, 1,
0.09498757, 0.1207663, 0.8253242, 0, 0.8901961, 1, 1,
0.09763227, -1.021233, 2.070964, 0, 0.8862745, 1, 1,
0.1034765, -0.7507061, 2.93065, 0, 0.8784314, 1, 1,
0.1041154, 0.3624578, 0.5979984, 0, 0.8745098, 1, 1,
0.1043991, 0.1734874, 0.7470178, 0, 0.8666667, 1, 1,
0.1106334, 1.060057, 0.7035233, 0, 0.8627451, 1, 1,
0.1122749, 0.7839555, 0.3721345, 0, 0.854902, 1, 1,
0.1130942, 2.722902, 0.5942609, 0, 0.8509804, 1, 1,
0.1231241, 0.6386248, 1.051963, 0, 0.8431373, 1, 1,
0.1233697, -0.4717018, 2.317518, 0, 0.8392157, 1, 1,
0.1279566, -0.872628, 2.095287, 0, 0.8313726, 1, 1,
0.1290783, -1.283754, 3.004045, 0, 0.827451, 1, 1,
0.1339364, -0.153224, 1.33189, 0, 0.8196079, 1, 1,
0.1375133, -0.6217716, 4.082245, 0, 0.8156863, 1, 1,
0.1392052, 0.76332, 1.654616, 0, 0.8078431, 1, 1,
0.1435218, -0.959156, 4.320827, 0, 0.8039216, 1, 1,
0.144209, -0.8436809, 2.732593, 0, 0.7960784, 1, 1,
0.1454827, -0.8979919, 3.656122, 0, 0.7882353, 1, 1,
0.1455297, 0.2313484, -0.184607, 0, 0.7843137, 1, 1,
0.1474641, 0.3014849, 1.089638, 0, 0.7764706, 1, 1,
0.1492491, 1.891729, 0.01274633, 0, 0.772549, 1, 1,
0.1506181, 0.7062575, 0.8954229, 0, 0.7647059, 1, 1,
0.1520711, 0.2317467, 0.2000563, 0, 0.7607843, 1, 1,
0.153639, 0.4369927, 0.9996215, 0, 0.7529412, 1, 1,
0.1566844, -0.1791727, 2.371403, 0, 0.7490196, 1, 1,
0.1570757, 0.1939496, 1.165955, 0, 0.7411765, 1, 1,
0.1612334, -0.07048896, 1.235571, 0, 0.7372549, 1, 1,
0.1695457, -1.422765, 2.87104, 0, 0.7294118, 1, 1,
0.1712807, 2.968755, -0.6105453, 0, 0.7254902, 1, 1,
0.1719427, -0.9975719, 4.231241, 0, 0.7176471, 1, 1,
0.1738914, 0.2549726, 1.446587, 0, 0.7137255, 1, 1,
0.1741037, 1.146745, 0.6656415, 0, 0.7058824, 1, 1,
0.1755735, -1.206605, 2.363025, 0, 0.6980392, 1, 1,
0.1784166, -0.5247893, 3.593354, 0, 0.6941177, 1, 1,
0.1786871, -1.737511, 4.148479, 0, 0.6862745, 1, 1,
0.1800788, 0.8804984, -1.900479, 0, 0.682353, 1, 1,
0.1903074, -1.232425, 3.559523, 0, 0.6745098, 1, 1,
0.1940762, 0.3972558, 2.884817, 0, 0.6705883, 1, 1,
0.1945231, -1.163751, 2.293735, 0, 0.6627451, 1, 1,
0.1961187, -0.7176817, 1.563528, 0, 0.6588235, 1, 1,
0.2071282, 0.6777145, 1.143167, 0, 0.6509804, 1, 1,
0.2145055, 0.3155577, 2.426276, 0, 0.6470588, 1, 1,
0.2164393, 2.014823, 0.043354, 0, 0.6392157, 1, 1,
0.220994, -0.01749305, 2.331086, 0, 0.6352941, 1, 1,
0.2211227, 0.4152498, -1.162814, 0, 0.627451, 1, 1,
0.2306876, 1.587345, 1.468999, 0, 0.6235294, 1, 1,
0.2373523, -1.485842, 4.67773, 0, 0.6156863, 1, 1,
0.2377679, -0.9920978, 1.961156, 0, 0.6117647, 1, 1,
0.2379907, -0.06928499, 1.555787, 0, 0.6039216, 1, 1,
0.2453621, -0.06972367, 3.743195, 0, 0.5960785, 1, 1,
0.2462438, -0.6262286, 4.215908, 0, 0.5921569, 1, 1,
0.2496033, -0.7276313, 1.740707, 0, 0.5843138, 1, 1,
0.2526135, 0.4730341, -1.505885, 0, 0.5803922, 1, 1,
0.2622404, 0.204135, 0.6553714, 0, 0.572549, 1, 1,
0.2672457, 1.247239, 0.9187228, 0, 0.5686275, 1, 1,
0.2718767, -1.37748, 3.443695, 0, 0.5607843, 1, 1,
0.2800648, -0.01886704, 2.110033, 0, 0.5568628, 1, 1,
0.2808432, -0.5497543, 4.926277, 0, 0.5490196, 1, 1,
0.2842848, -0.01610899, 1.940868, 0, 0.5450981, 1, 1,
0.2880897, 0.08110861, 2.057813, 0, 0.5372549, 1, 1,
0.2962377, -1.160234, 3.995975, 0, 0.5333334, 1, 1,
0.3026462, -0.006706492, 2.122168, 0, 0.5254902, 1, 1,
0.3042675, 0.5037054, 0.78395, 0, 0.5215687, 1, 1,
0.3044875, 1.082676, -0.3666413, 0, 0.5137255, 1, 1,
0.3054892, -1.735082, 3.191494, 0, 0.509804, 1, 1,
0.3077466, -1.681822, 1.474087, 0, 0.5019608, 1, 1,
0.309956, 0.9470964, 1.898385, 0, 0.4941176, 1, 1,
0.3137174, -1.72026, 1.801848, 0, 0.4901961, 1, 1,
0.3214607, 0.8558122, 1.927596, 0, 0.4823529, 1, 1,
0.3222378, -1.706272, 1.626672, 0, 0.4784314, 1, 1,
0.3230425, 0.1247426, 1.746815, 0, 0.4705882, 1, 1,
0.32313, 1.719873, 0.5949886, 0, 0.4666667, 1, 1,
0.3253212, -0.889756, 2.279625, 0, 0.4588235, 1, 1,
0.3270103, -0.7878507, 4.528593, 0, 0.454902, 1, 1,
0.3270175, -0.3429765, 2.957151, 0, 0.4470588, 1, 1,
0.3271506, 0.5770746, -1.045853, 0, 0.4431373, 1, 1,
0.3274945, 0.9789307, 1.534595, 0, 0.4352941, 1, 1,
0.3277709, 1.00486, 0.4154004, 0, 0.4313726, 1, 1,
0.3301086, -0.7758237, 3.759151, 0, 0.4235294, 1, 1,
0.332952, 1.352256, 0.8806421, 0, 0.4196078, 1, 1,
0.3340734, 1.437999, 0.2280961, 0, 0.4117647, 1, 1,
0.336605, 2.498851, -0.09549697, 0, 0.4078431, 1, 1,
0.3366092, 0.4705647, 1.006968, 0, 0.4, 1, 1,
0.3404188, -1.30782, 2.792013, 0, 0.3921569, 1, 1,
0.3412982, 0.3829781, -0.7844843, 0, 0.3882353, 1, 1,
0.3456512, -0.3045245, 1.473974, 0, 0.3803922, 1, 1,
0.3466381, -0.2314396, 2.435464, 0, 0.3764706, 1, 1,
0.3495219, -1.055466, 2.254605, 0, 0.3686275, 1, 1,
0.349583, 1.496454, 0.4713965, 0, 0.3647059, 1, 1,
0.3511401, 0.5623753, 0.8586749, 0, 0.3568628, 1, 1,
0.3568038, -0.09382188, 3.842885, 0, 0.3529412, 1, 1,
0.3580524, -0.4310975, 1.807673, 0, 0.345098, 1, 1,
0.3589219, -1.144407, 2.285335, 0, 0.3411765, 1, 1,
0.3621891, -0.09571411, 1.854075, 0, 0.3333333, 1, 1,
0.3652589, 0.2891099, 0.9831157, 0, 0.3294118, 1, 1,
0.3658875, -1.182236, 2.365188, 0, 0.3215686, 1, 1,
0.3672344, 0.2656274, 1.936673, 0, 0.3176471, 1, 1,
0.3692214, 0.0541906, 1.733753, 0, 0.3098039, 1, 1,
0.3694649, -0.4284911, 3.782758, 0, 0.3058824, 1, 1,
0.3760789, -0.355149, -0.4662662, 0, 0.2980392, 1, 1,
0.3790384, 0.8308215, 0.7431219, 0, 0.2901961, 1, 1,
0.383604, 1.317023, -0.4068266, 0, 0.2862745, 1, 1,
0.3869619, -0.83799, 3.469439, 0, 0.2784314, 1, 1,
0.3938073, 1.235852, 0.04303027, 0, 0.2745098, 1, 1,
0.3961277, 0.3756289, 1.134477, 0, 0.2666667, 1, 1,
0.3964505, 0.5884321, 0.7823975, 0, 0.2627451, 1, 1,
0.3970225, -0.2894439, 1.731902, 0, 0.254902, 1, 1,
0.4035886, 0.4674756, 0.927041, 0, 0.2509804, 1, 1,
0.4048869, -2.10057, 2.451642, 0, 0.2431373, 1, 1,
0.406119, -0.06937411, 0.9540927, 0, 0.2392157, 1, 1,
0.4068218, 0.4996946, 0.572222, 0, 0.2313726, 1, 1,
0.4075386, -1.373726, 1.414311, 0, 0.227451, 1, 1,
0.4105914, -0.8889965, 3.054373, 0, 0.2196078, 1, 1,
0.4132923, -1.815081, 2.207895, 0, 0.2156863, 1, 1,
0.414981, -0.4110697, 1.458324, 0, 0.2078431, 1, 1,
0.4184723, 0.5176144, -1.095339, 0, 0.2039216, 1, 1,
0.4185101, 1.11008, -0.03772154, 0, 0.1960784, 1, 1,
0.418666, -0.198984, 0.137549, 0, 0.1882353, 1, 1,
0.4260847, 0.01600174, 2.59781, 0, 0.1843137, 1, 1,
0.4319595, -0.1428126, 0.1865906, 0, 0.1764706, 1, 1,
0.4322725, -1.793319, 2.053608, 0, 0.172549, 1, 1,
0.4334724, -0.07881893, 1.772097, 0, 0.1647059, 1, 1,
0.4351404, 0.1569686, 0.5323908, 0, 0.1607843, 1, 1,
0.4368118, -0.4386096, 3.170317, 0, 0.1529412, 1, 1,
0.4399644, 0.1315759, 3.268557, 0, 0.1490196, 1, 1,
0.4437976, -1.579945, 4.226675, 0, 0.1411765, 1, 1,
0.4441628, -3.26252, 2.922871, 0, 0.1372549, 1, 1,
0.4454423, -0.166189, 1.18098, 0, 0.1294118, 1, 1,
0.4494967, -0.8825694, 2.359976, 0, 0.1254902, 1, 1,
0.4520552, 0.5593046, -0.221384, 0, 0.1176471, 1, 1,
0.4533401, -0.3732549, 2.992142, 0, 0.1137255, 1, 1,
0.4557059, -0.1631574, 1.881335, 0, 0.1058824, 1, 1,
0.4582047, -1.12269, 3.02704, 0, 0.09803922, 1, 1,
0.4587854, -0.7814686, 2.137912, 0, 0.09411765, 1, 1,
0.4660574, -0.9271237, 2.619586, 0, 0.08627451, 1, 1,
0.4685597, 1.357453, 1.227581, 0, 0.08235294, 1, 1,
0.4702924, 0.2658828, -1.395627, 0, 0.07450981, 1, 1,
0.4713051, 1.189304, -0.1194055, 0, 0.07058824, 1, 1,
0.4744051, 0.05078962, 0.8929707, 0, 0.0627451, 1, 1,
0.4766844, -0.1221741, 1.31561, 0, 0.05882353, 1, 1,
0.4774689, -0.9132727, 3.659103, 0, 0.05098039, 1, 1,
0.4781332, 0.3876376, 1.247024, 0, 0.04705882, 1, 1,
0.4830237, 0.3839167, 0.06663786, 0, 0.03921569, 1, 1,
0.4850938, 0.008573664, 0.5089929, 0, 0.03529412, 1, 1,
0.4861723, -0.5434784, 3.834275, 0, 0.02745098, 1, 1,
0.4911046, -0.2676036, 1.622822, 0, 0.02352941, 1, 1,
0.4959919, 0.809367, 1.28765, 0, 0.01568628, 1, 1,
0.4974527, -0.1526779, 1.27334, 0, 0.01176471, 1, 1,
0.4986543, 0.2031752, 1.193256, 0, 0.003921569, 1, 1,
0.4995183, 0.3422403, 0.3413273, 0.003921569, 0, 1, 1,
0.4999378, -1.017222, 3.449769, 0.007843138, 0, 1, 1,
0.5063143, -1.99421, 3.938978, 0.01568628, 0, 1, 1,
0.5089658, -0.005613582, 1.745163, 0.01960784, 0, 1, 1,
0.512234, -0.01989199, -0.51368, 0.02745098, 0, 1, 1,
0.5136878, -0.7406307, 3.033328, 0.03137255, 0, 1, 1,
0.514156, -0.5558735, 2.39432, 0.03921569, 0, 1, 1,
0.5146517, 1.255862, 1.162199, 0.04313726, 0, 1, 1,
0.5153893, 1.106221, 1.751119, 0.05098039, 0, 1, 1,
0.5159033, 0.4011352, 1.657046, 0.05490196, 0, 1, 1,
0.5185416, -0.04906102, 1.806706, 0.0627451, 0, 1, 1,
0.522693, -1.170716, 3.736381, 0.06666667, 0, 1, 1,
0.5240322, 0.003929335, 1.113173, 0.07450981, 0, 1, 1,
0.5291769, -0.4624823, 1.379597, 0.07843138, 0, 1, 1,
0.53213, 1.105969, -0.09741154, 0.08627451, 0, 1, 1,
0.5371892, -1.451677, 3.289998, 0.09019608, 0, 1, 1,
0.5420441, 0.3053379, 2.04566, 0.09803922, 0, 1, 1,
0.5545706, 0.06737488, 2.21116, 0.1058824, 0, 1, 1,
0.5566878, 1.118099, 0.3307954, 0.1098039, 0, 1, 1,
0.5580193, -1.469877, 2.18081, 0.1176471, 0, 1, 1,
0.5629933, 0.2689026, 2.266966, 0.1215686, 0, 1, 1,
0.5658177, 1.354474, 2.354584, 0.1294118, 0, 1, 1,
0.5729945, 2.474226, 0.3617426, 0.1333333, 0, 1, 1,
0.5744606, 0.0532684, 2.731791, 0.1411765, 0, 1, 1,
0.5765779, 1.929602, 2.115972, 0.145098, 0, 1, 1,
0.5775176, -1.281469, 2.96231, 0.1529412, 0, 1, 1,
0.579597, 0.4676532, 0.9239755, 0.1568628, 0, 1, 1,
0.5797491, 0.2497312, 1.804489, 0.1647059, 0, 1, 1,
0.5816672, 0.5057164, 2.178593, 0.1686275, 0, 1, 1,
0.5830479, 0.2665797, 1.193143, 0.1764706, 0, 1, 1,
0.585756, 0.8049598, 3.8922, 0.1803922, 0, 1, 1,
0.588718, 0.1092863, 0.9881, 0.1882353, 0, 1, 1,
0.5914347, -0.5724525, 2.608608, 0.1921569, 0, 1, 1,
0.5918134, 0.0789858, -0.3757147, 0.2, 0, 1, 1,
0.5938861, -1.423978, 3.439731, 0.2078431, 0, 1, 1,
0.5951785, 0.4457263, 0.9548976, 0.2117647, 0, 1, 1,
0.595621, -2.484014, 2.045251, 0.2196078, 0, 1, 1,
0.6005042, -0.9970335, 3.613694, 0.2235294, 0, 1, 1,
0.601011, -0.3218285, 2.513802, 0.2313726, 0, 1, 1,
0.6012242, 1.83175, -1.067069, 0.2352941, 0, 1, 1,
0.6021258, 2.090545, -0.3987682, 0.2431373, 0, 1, 1,
0.6046493, 0.5183102, 0.4993573, 0.2470588, 0, 1, 1,
0.605852, -0.7089917, 0.5512186, 0.254902, 0, 1, 1,
0.6081495, -0.1514301, 1.308768, 0.2588235, 0, 1, 1,
0.6087263, 0.1031855, 2.195944, 0.2666667, 0, 1, 1,
0.6140491, -0.6415442, 2.328048, 0.2705882, 0, 1, 1,
0.6176535, -0.06141839, 1.146563, 0.2784314, 0, 1, 1,
0.6209494, -1.218501, 2.927622, 0.282353, 0, 1, 1,
0.6225466, -0.4369203, 3.159562, 0.2901961, 0, 1, 1,
0.6250648, -0.1969406, 0.9176095, 0.2941177, 0, 1, 1,
0.6274894, 0.2964055, 1.728807, 0.3019608, 0, 1, 1,
0.6346642, -1.407953, 2.064234, 0.3098039, 0, 1, 1,
0.6374153, -0.2079873, -0.2099249, 0.3137255, 0, 1, 1,
0.6382527, 0.3081305, 0.1754582, 0.3215686, 0, 1, 1,
0.639776, -0.8765339, 1.740471, 0.3254902, 0, 1, 1,
0.6403196, 0.662444, 0.5389991, 0.3333333, 0, 1, 1,
0.6429121, 0.1922505, 0.00113277, 0.3372549, 0, 1, 1,
0.645347, 1.148338, -0.1929494, 0.345098, 0, 1, 1,
0.6502131, 0.9575165, 1.676522, 0.3490196, 0, 1, 1,
0.6510983, 0.656745, 1.072516, 0.3568628, 0, 1, 1,
0.6527418, 1.208294, -0.02519411, 0.3607843, 0, 1, 1,
0.6548977, 0.05518586, 1.896759, 0.3686275, 0, 1, 1,
0.656702, 0.2616487, 0.2277966, 0.372549, 0, 1, 1,
0.6631139, -0.120291, 2.379996, 0.3803922, 0, 1, 1,
0.6669866, 0.6737744, 0.6806018, 0.3843137, 0, 1, 1,
0.6694713, -0.8769252, 2.722988, 0.3921569, 0, 1, 1,
0.6734532, -0.2712618, 2.075178, 0.3960784, 0, 1, 1,
0.6742633, 1.30881, 0.6349292, 0.4039216, 0, 1, 1,
0.6763082, 0.6566131, -0.2547145, 0.4117647, 0, 1, 1,
0.6836487, -1.341379, 2.154858, 0.4156863, 0, 1, 1,
0.6847284, 0.854874, -1.110293, 0.4235294, 0, 1, 1,
0.6873318, -1.174688, 2.330792, 0.427451, 0, 1, 1,
0.6876858, 0.1270443, 2.691739, 0.4352941, 0, 1, 1,
0.6889095, 1.603753, 0.01356911, 0.4392157, 0, 1, 1,
0.6901349, 1.122772, 0.7224646, 0.4470588, 0, 1, 1,
0.7056744, 0.3997868, 0.1673805, 0.4509804, 0, 1, 1,
0.7126172, -0.07458393, 1.199368, 0.4588235, 0, 1, 1,
0.7152904, 0.396704, 1.21065, 0.4627451, 0, 1, 1,
0.7169765, 0.04702693, 2.931773, 0.4705882, 0, 1, 1,
0.718444, -0.270286, 2.147717, 0.4745098, 0, 1, 1,
0.7192257, 0.2937801, 1.197729, 0.4823529, 0, 1, 1,
0.7197784, 0.4450042, 1.801088, 0.4862745, 0, 1, 1,
0.724943, -0.5790226, 2.553128, 0.4941176, 0, 1, 1,
0.7294325, -0.2636968, 1.799037, 0.5019608, 0, 1, 1,
0.7331363, -1.393154, 2.066794, 0.5058824, 0, 1, 1,
0.7343809, 1.00634, 2.069347, 0.5137255, 0, 1, 1,
0.7422568, 1.023407, 0.0441106, 0.5176471, 0, 1, 1,
0.7508571, -0.3012901, 1.412398, 0.5254902, 0, 1, 1,
0.753176, -1.506659, 2.950664, 0.5294118, 0, 1, 1,
0.7619893, -0.622025, 1.419823, 0.5372549, 0, 1, 1,
0.7630854, 1.239743, 0.6995285, 0.5411765, 0, 1, 1,
0.7663965, -0.2012466, 3.190713, 0.5490196, 0, 1, 1,
0.7681388, 1.427061, 1.599549, 0.5529412, 0, 1, 1,
0.7748014, -1.693478, 3.386126, 0.5607843, 0, 1, 1,
0.775919, -0.9058893, 1.531344, 0.5647059, 0, 1, 1,
0.7760925, -1.958645, 0.06776537, 0.572549, 0, 1, 1,
0.7778933, 2.335495, 0.3297185, 0.5764706, 0, 1, 1,
0.7805085, -0.5083169, 2.139085, 0.5843138, 0, 1, 1,
0.7924205, -0.3246392, 2.6201, 0.5882353, 0, 1, 1,
0.8063961, 1.481054, 0.7525219, 0.5960785, 0, 1, 1,
0.8085505, -1.46443, 3.567041, 0.6039216, 0, 1, 1,
0.8249763, -0.7789215, 4.061199, 0.6078432, 0, 1, 1,
0.8281752, -1.814141, 4.347949, 0.6156863, 0, 1, 1,
0.8296105, -0.9744573, 2.367734, 0.6196079, 0, 1, 1,
0.8307008, -0.3387464, 2.526711, 0.627451, 0, 1, 1,
0.8336495, -1.306443, 3.714235, 0.6313726, 0, 1, 1,
0.8337048, -0.0507873, 2.222243, 0.6392157, 0, 1, 1,
0.8338662, -1.048342, 2.782125, 0.6431373, 0, 1, 1,
0.8352561, 0.8923504, 0.8514932, 0.6509804, 0, 1, 1,
0.8381355, 2.101901, -0.7092173, 0.654902, 0, 1, 1,
0.8404207, -0.3330806, 2.780512, 0.6627451, 0, 1, 1,
0.8426649, 0.2852534, 2.240424, 0.6666667, 0, 1, 1,
0.845535, 1.489113, -0.2026969, 0.6745098, 0, 1, 1,
0.8471938, -1.304467, 1.694874, 0.6784314, 0, 1, 1,
0.8484712, -2.117676, 0.6552155, 0.6862745, 0, 1, 1,
0.8523601, -0.03561399, 3.783165, 0.6901961, 0, 1, 1,
0.8552943, 0.1116064, 1.23659, 0.6980392, 0, 1, 1,
0.8587779, 0.6633482, -0.1998637, 0.7058824, 0, 1, 1,
0.8652892, 1.256705, 1.419397, 0.7098039, 0, 1, 1,
0.8711879, 0.7987923, 0.5758869, 0.7176471, 0, 1, 1,
0.8730147, 0.6047601, 3.475065, 0.7215686, 0, 1, 1,
0.8752009, 0.03951027, -0.8058145, 0.7294118, 0, 1, 1,
0.8790056, -0.1594945, 0.8065798, 0.7333333, 0, 1, 1,
0.8800189, 0.7715095, -0.07528123, 0.7411765, 0, 1, 1,
0.8846654, 0.5218847, 0.2108348, 0.7450981, 0, 1, 1,
0.8882396, 0.0732294, 2.842605, 0.7529412, 0, 1, 1,
0.8982635, -0.06682561, 3.43672, 0.7568628, 0, 1, 1,
0.9002216, -0.3145675, 1.267328, 0.7647059, 0, 1, 1,
0.907747, -0.002945432, 1.684587, 0.7686275, 0, 1, 1,
0.9089405, 0.9076716, 2.751812, 0.7764706, 0, 1, 1,
0.9111952, -0.6698435, 0.6847969, 0.7803922, 0, 1, 1,
0.9201043, -0.1331033, 1.950564, 0.7882353, 0, 1, 1,
0.9272321, 0.3095701, 1.805626, 0.7921569, 0, 1, 1,
0.9331472, -0.2215346, 2.089394, 0.8, 0, 1, 1,
0.9331893, 0.3333438, 1.353505, 0.8078431, 0, 1, 1,
0.9334098, -0.5003184, 0.529613, 0.8117647, 0, 1, 1,
0.9374081, 0.4191249, 2.016472, 0.8196079, 0, 1, 1,
0.9447009, -0.5392323, 1.626598, 0.8235294, 0, 1, 1,
0.9491932, -0.9163975, 1.987888, 0.8313726, 0, 1, 1,
0.9533051, -0.7958944, 2.443945, 0.8352941, 0, 1, 1,
0.9578321, -1.283649, 2.916012, 0.8431373, 0, 1, 1,
0.9580293, 0.7481446, -0.5287009, 0.8470588, 0, 1, 1,
0.9598832, 1.09422, -1.380219, 0.854902, 0, 1, 1,
0.9619896, 0.3952012, 1.035174, 0.8588235, 0, 1, 1,
0.9641033, 0.17373, 0.6385727, 0.8666667, 0, 1, 1,
0.9683845, 0.5614143, 2.130584, 0.8705882, 0, 1, 1,
0.969615, -0.8269578, 2.592331, 0.8784314, 0, 1, 1,
0.9713354, -1.067935, 1.747258, 0.8823529, 0, 1, 1,
0.9874571, 0.3760176, 1.446662, 0.8901961, 0, 1, 1,
0.9888815, 0.1000708, 2.245677, 0.8941177, 0, 1, 1,
0.9912869, -0.6980777, 3.458531, 0.9019608, 0, 1, 1,
0.9924589, -0.07271618, 3.183101, 0.9098039, 0, 1, 1,
0.9928331, -1.29343, 3.090747, 0.9137255, 0, 1, 1,
0.9942221, -1.126117, 3.730671, 0.9215686, 0, 1, 1,
0.9963897, 2.265363, 1.444066, 0.9254902, 0, 1, 1,
0.9965547, -1.458784, 1.199695, 0.9333333, 0, 1, 1,
0.9996299, -0.5388697, 1.954781, 0.9372549, 0, 1, 1,
1.000862, 0.1881501, 2.432708, 0.945098, 0, 1, 1,
1.001444, 1.840628, 1.889503, 0.9490196, 0, 1, 1,
1.002776, 0.09401736, 0.399003, 0.9568627, 0, 1, 1,
1.004373, -1.693923, 3.572158, 0.9607843, 0, 1, 1,
1.013379, -0.9502761, 2.324791, 0.9686275, 0, 1, 1,
1.014292, 0.4507006, 0.9869697, 0.972549, 0, 1, 1,
1.022412, 0.7526059, 1.776204, 0.9803922, 0, 1, 1,
1.02396, -0.6704583, 1.098529, 0.9843137, 0, 1, 1,
1.026548, -1.020651, 1.463625, 0.9921569, 0, 1, 1,
1.026676, -0.389033, 2.11648, 0.9960784, 0, 1, 1,
1.02751, 0.4083155, 1.978103, 1, 0, 0.9960784, 1,
1.033513, 0.02497556, 3.171007, 1, 0, 0.9882353, 1,
1.035299, -0.3804528, 2.578616, 1, 0, 0.9843137, 1,
1.038629, 1.439231, 1.595403, 1, 0, 0.9764706, 1,
1.038694, -0.2770903, 0.6139255, 1, 0, 0.972549, 1,
1.041221, 0.2063053, 2.214771, 1, 0, 0.9647059, 1,
1.045537, -0.6963087, 2.42125, 1, 0, 0.9607843, 1,
1.047206, 0.2722233, 2.120227, 1, 0, 0.9529412, 1,
1.049439, 0.6695587, 0.02424083, 1, 0, 0.9490196, 1,
1.053981, 0.2317897, 2.767592, 1, 0, 0.9411765, 1,
1.072752, 1.741522, -0.03736672, 1, 0, 0.9372549, 1,
1.075595, -0.8049853, 3.079661, 1, 0, 0.9294118, 1,
1.076675, -0.863629, 1.973201, 1, 0, 0.9254902, 1,
1.078026, 0.06492249, 0.4080851, 1, 0, 0.9176471, 1,
1.078796, -1.600325, 2.618526, 1, 0, 0.9137255, 1,
1.079599, 0.2071608, 1.544982, 1, 0, 0.9058824, 1,
1.08033, 0.615878, 0.1259685, 1, 0, 0.9019608, 1,
1.084409, 1.329952, 2.213443, 1, 0, 0.8941177, 1,
1.090644, 1.215268, 0.6976207, 1, 0, 0.8862745, 1,
1.095006, -0.2532641, 0.9747298, 1, 0, 0.8823529, 1,
1.102309, 0.5032598, 1.136944, 1, 0, 0.8745098, 1,
1.105512, -0.8696482, 3.513827, 1, 0, 0.8705882, 1,
1.108108, 0.2654116, 1.937424, 1, 0, 0.8627451, 1,
1.122541, -0.1052365, 1.378853, 1, 0, 0.8588235, 1,
1.123927, 0.7193173, 0.8772233, 1, 0, 0.8509804, 1,
1.125113, -1.366187, 1.834288, 1, 0, 0.8470588, 1,
1.131322, -0.2590252, 1.412262, 1, 0, 0.8392157, 1,
1.138337, -0.2880419, 2.633661, 1, 0, 0.8352941, 1,
1.138901, 0.822443, 0.641978, 1, 0, 0.827451, 1,
1.145367, 0.5981783, 0.2272654, 1, 0, 0.8235294, 1,
1.148643, -0.5368503, 2.829813, 1, 0, 0.8156863, 1,
1.148782, -0.9590188, 0.6817045, 1, 0, 0.8117647, 1,
1.150316, 0.3154706, 2.271761, 1, 0, 0.8039216, 1,
1.150716, 0.210715, 1.964082, 1, 0, 0.7960784, 1,
1.153446, 1.363819, 0.6022612, 1, 0, 0.7921569, 1,
1.155897, -0.1837584, -0.06887531, 1, 0, 0.7843137, 1,
1.16032, 0.5163063, 1.713494, 1, 0, 0.7803922, 1,
1.161604, -0.1373101, 1.202362, 1, 0, 0.772549, 1,
1.163617, -1.787192, 3.254771, 1, 0, 0.7686275, 1,
1.166507, -1.066879, 2.417554, 1, 0, 0.7607843, 1,
1.172062, 0.4247012, 1.945256, 1, 0, 0.7568628, 1,
1.173318, -0.2443776, 2.816487, 1, 0, 0.7490196, 1,
1.175246, 0.7207758, 0.5609688, 1, 0, 0.7450981, 1,
1.176247, -1.180965, 2.559701, 1, 0, 0.7372549, 1,
1.176981, -0.6303536, 0.9588296, 1, 0, 0.7333333, 1,
1.180004, 0.8758081, 1.448163, 1, 0, 0.7254902, 1,
1.184511, 0.9559225, 1.491931, 1, 0, 0.7215686, 1,
1.216933, 0.2098176, 1.682177, 1, 0, 0.7137255, 1,
1.21753, 0.1451107, 2.837707, 1, 0, 0.7098039, 1,
1.218024, 1.244307, 2.211154, 1, 0, 0.7019608, 1,
1.22023, 0.5072179, -0.669824, 1, 0, 0.6941177, 1,
1.229199, 1.390467, 0.6753187, 1, 0, 0.6901961, 1,
1.232232, 0.5713095, 1.306655, 1, 0, 0.682353, 1,
1.233477, -0.6315001, -0.01375644, 1, 0, 0.6784314, 1,
1.237618, -0.6154763, 0.9145581, 1, 0, 0.6705883, 1,
1.239071, 1.215713, 1.696212, 1, 0, 0.6666667, 1,
1.252653, -1.120357, 3.272527, 1, 0, 0.6588235, 1,
1.253457, 0.4003773, 0.1063222, 1, 0, 0.654902, 1,
1.254953, 0.982115, -0.1766814, 1, 0, 0.6470588, 1,
1.258162, 2.137168, 0.9469677, 1, 0, 0.6431373, 1,
1.261666, -0.1502109, 3.489821, 1, 0, 0.6352941, 1,
1.277338, -0.1383292, -0.4968512, 1, 0, 0.6313726, 1,
1.281929, -0.5447186, 1.469248, 1, 0, 0.6235294, 1,
1.285237, 1.502068, 0.2425512, 1, 0, 0.6196079, 1,
1.28651, -0.6292905, 0.4801717, 1, 0, 0.6117647, 1,
1.286621, 2.301649, 0.7597634, 1, 0, 0.6078432, 1,
1.290531, -0.7503836, 2.827872, 1, 0, 0.6, 1,
1.291494, 0.8543468, 0.6764323, 1, 0, 0.5921569, 1,
1.294072, 1.364534, 1.128914, 1, 0, 0.5882353, 1,
1.303944, 1.810552, -0.6091735, 1, 0, 0.5803922, 1,
1.307524, -0.4636061, 1.907782, 1, 0, 0.5764706, 1,
1.308373, 0.252685, 0.4564352, 1, 0, 0.5686275, 1,
1.312254, -0.2948734, 1.430087, 1, 0, 0.5647059, 1,
1.313572, -0.3243758, 0.6099671, 1, 0, 0.5568628, 1,
1.31655, -0.1964119, 2.672491, 1, 0, 0.5529412, 1,
1.330679, 2.763451, -0.6276051, 1, 0, 0.5450981, 1,
1.336935, -1.465221, 3.541117, 1, 0, 0.5411765, 1,
1.339663, 0.4238681, 2.384039, 1, 0, 0.5333334, 1,
1.343029, -1.502475, 4.280879, 1, 0, 0.5294118, 1,
1.346402, 2.464766, -2.014421, 1, 0, 0.5215687, 1,
1.354351, -0.07199004, 1.404332, 1, 0, 0.5176471, 1,
1.354966, -0.8391339, 1.52346, 1, 0, 0.509804, 1,
1.365037, 3.330767, 1.299031, 1, 0, 0.5058824, 1,
1.365966, -0.8238612, 2.301404, 1, 0, 0.4980392, 1,
1.373767, 0.9919689, -0.1564516, 1, 0, 0.4901961, 1,
1.380623, 0.1104998, 1.964378, 1, 0, 0.4862745, 1,
1.382312, -0.9002281, 1.334491, 1, 0, 0.4784314, 1,
1.39925, -0.5012887, 3.160089, 1, 0, 0.4745098, 1,
1.406981, 0.397922, 0.7693802, 1, 0, 0.4666667, 1,
1.417965, -1.121274, 0.02279588, 1, 0, 0.4627451, 1,
1.42575, 0.51065, 0.511946, 1, 0, 0.454902, 1,
1.435723, -0.6216522, 1.406288, 1, 0, 0.4509804, 1,
1.453146, 0.8629808, 0.3125442, 1, 0, 0.4431373, 1,
1.45969, 0.4406585, 1.898922, 1, 0, 0.4392157, 1,
1.483466, 0.6901836, 0.9267635, 1, 0, 0.4313726, 1,
1.483862, 1.1371, 1.654951, 1, 0, 0.427451, 1,
1.486162, 0.9208722, 1.187483, 1, 0, 0.4196078, 1,
1.486761, 0.03759483, 0.9139245, 1, 0, 0.4156863, 1,
1.492418, -0.05119242, 1.610625, 1, 0, 0.4078431, 1,
1.506887, 0.8592526, 0.3685576, 1, 0, 0.4039216, 1,
1.512894, -0.337598, 0.2238282, 1, 0, 0.3960784, 1,
1.518521, -1.577944, 4.10829, 1, 0, 0.3882353, 1,
1.521621, 0.9189462, 1.595743, 1, 0, 0.3843137, 1,
1.522665, 1.360639, 1.935715, 1, 0, 0.3764706, 1,
1.525845, 0.02535412, 0.4559102, 1, 0, 0.372549, 1,
1.542676, 1.576331, -0.05595669, 1, 0, 0.3647059, 1,
1.549824, -0.02444158, 0.3210065, 1, 0, 0.3607843, 1,
1.553296, -0.4240427, 1.895443, 1, 0, 0.3529412, 1,
1.554374, -0.06912752, 2.49624, 1, 0, 0.3490196, 1,
1.557649, -2.032763, 1.786349, 1, 0, 0.3411765, 1,
1.559785, -2.25821, 2.414025, 1, 0, 0.3372549, 1,
1.573166, 1.529355, 0.8372257, 1, 0, 0.3294118, 1,
1.573976, -0.3990742, 2.414079, 1, 0, 0.3254902, 1,
1.586131, -0.1357697, 0.8292285, 1, 0, 0.3176471, 1,
1.604102, 0.3345526, 3.023151, 1, 0, 0.3137255, 1,
1.613024, 0.01720935, 2.149989, 1, 0, 0.3058824, 1,
1.616941, 0.9688314, 1.447873, 1, 0, 0.2980392, 1,
1.62288, 1.746772, -0.003635766, 1, 0, 0.2941177, 1,
1.636217, -1.600002, 0.5264229, 1, 0, 0.2862745, 1,
1.64867, 1.827831, 0.2633814, 1, 0, 0.282353, 1,
1.671743, -0.357545, 0.8644546, 1, 0, 0.2745098, 1,
1.688659, -0.3154275, 1.780862, 1, 0, 0.2705882, 1,
1.701397, 1.284993, 1.357706, 1, 0, 0.2627451, 1,
1.703415, -0.9850401, 1.373989, 1, 0, 0.2588235, 1,
1.718421, -0.642066, 0.971736, 1, 0, 0.2509804, 1,
1.718721, 0.726133, 1.193822, 1, 0, 0.2470588, 1,
1.720979, -0.8517481, 3.54159, 1, 0, 0.2392157, 1,
1.726398, -0.7261097, 2.312509, 1, 0, 0.2352941, 1,
1.736667, -0.4637585, 1.452627, 1, 0, 0.227451, 1,
1.755011, 0.7736101, 1.287048, 1, 0, 0.2235294, 1,
1.768785, -0.8917134, 3.047203, 1, 0, 0.2156863, 1,
1.777344, -0.4642706, 3.413715, 1, 0, 0.2117647, 1,
1.80381, 0.5172505, 1.341573, 1, 0, 0.2039216, 1,
1.847566, -0.1893436, 2.00257, 1, 0, 0.1960784, 1,
1.881571, -0.2750037, 1.485593, 1, 0, 0.1921569, 1,
1.88833, 0.1589971, -0.2263891, 1, 0, 0.1843137, 1,
1.927595, -0.08294068, 1.164275, 1, 0, 0.1803922, 1,
1.941306, 1.323534, 1.455393, 1, 0, 0.172549, 1,
1.95342, 0.4670103, 0.6451008, 1, 0, 0.1686275, 1,
1.953609, -1.814457, 2.013328, 1, 0, 0.1607843, 1,
1.99109, -0.4409615, 1.452797, 1, 0, 0.1568628, 1,
2.020071, -0.7811599, 2.538235, 1, 0, 0.1490196, 1,
2.028758, -0.08419592, 1.299088, 1, 0, 0.145098, 1,
2.059319, -1.001997, 1.942341, 1, 0, 0.1372549, 1,
2.065104, 0.5645779, 1.63288, 1, 0, 0.1333333, 1,
2.072857, -1.182873, 4.152883, 1, 0, 0.1254902, 1,
2.076676, 0.4466477, 3.059434, 1, 0, 0.1215686, 1,
2.151685, 1.593021, -0.655522, 1, 0, 0.1137255, 1,
2.156497, -0.6867961, 1.925156, 1, 0, 0.1098039, 1,
2.159327, -0.9134644, 1.07133, 1, 0, 0.1019608, 1,
2.175328, 0.1235472, 1.229747, 1, 0, 0.09411765, 1,
2.190262, 0.1933212, 0.872079, 1, 0, 0.09019608, 1,
2.208051, -0.8759314, 0.6149109, 1, 0, 0.08235294, 1,
2.221978, -0.5521697, 1.568392, 1, 0, 0.07843138, 1,
2.249274, -0.3297491, 0.9148832, 1, 0, 0.07058824, 1,
2.266581, -1.257254, -0.1280701, 1, 0, 0.06666667, 1,
2.345695, 0.1243462, 2.088494, 1, 0, 0.05882353, 1,
2.347363, -0.01037263, 1.331117, 1, 0, 0.05490196, 1,
2.350487, 1.306868, 0.9193287, 1, 0, 0.04705882, 1,
2.385266, -2.28217, 2.334219, 1, 0, 0.04313726, 1,
2.457766, -1.618972, 2.093588, 1, 0, 0.03529412, 1,
2.468424, -0.6673716, 1.151615, 1, 0, 0.03137255, 1,
2.601029, -0.5500742, 2.287835, 1, 0, 0.02352941, 1,
2.741169, 0.5772347, 1.305191, 1, 0, 0.01960784, 1,
2.955058, 1.440178, 1.500179, 1, 0, 0.01176471, 1,
3.236308, 2.494192, 2.62003, 1, 0, 0.007843138, 1
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
-0.3232774, -4.380083, -6.524111, 0, -0.5, 0.5, 0.5,
-0.3232774, -4.380083, -6.524111, 1, -0.5, 0.5, 0.5,
-0.3232774, -4.380083, -6.524111, 1, 1.5, 0.5, 0.5,
-0.3232774, -4.380083, -6.524111, 0, 1.5, 0.5, 0.5
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
-5.089562, 0.03412354, -6.524111, 0, -0.5, 0.5, 0.5,
-5.089562, 0.03412354, -6.524111, 1, -0.5, 0.5, 0.5,
-5.089562, 0.03412354, -6.524111, 1, 1.5, 0.5, 0.5,
-5.089562, 0.03412354, -6.524111, 0, 1.5, 0.5, 0.5
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
-5.089562, -4.380083, 0.06404448, 0, -0.5, 0.5, 0.5,
-5.089562, -4.380083, 0.06404448, 1, -0.5, 0.5, 0.5,
-5.089562, -4.380083, 0.06404448, 1, 1.5, 0.5, 0.5,
-5.089562, -4.380083, 0.06404448, 0, 1.5, 0.5, 0.5
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
-2, -3.36142, -5.003768,
2, -3.36142, -5.003768,
-2, -3.36142, -5.003768,
-2, -3.531197, -5.257158,
0, -3.36142, -5.003768,
0, -3.531197, -5.257158,
2, -3.36142, -5.003768,
2, -3.531197, -5.257158
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
"0",
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
-2, -3.870751, -5.763939, 0, -0.5, 0.5, 0.5,
-2, -3.870751, -5.763939, 1, -0.5, 0.5, 0.5,
-2, -3.870751, -5.763939, 1, 1.5, 0.5, 0.5,
-2, -3.870751, -5.763939, 0, 1.5, 0.5, 0.5,
0, -3.870751, -5.763939, 0, -0.5, 0.5, 0.5,
0, -3.870751, -5.763939, 1, -0.5, 0.5, 0.5,
0, -3.870751, -5.763939, 1, 1.5, 0.5, 0.5,
0, -3.870751, -5.763939, 0, 1.5, 0.5, 0.5,
2, -3.870751, -5.763939, 0, -0.5, 0.5, 0.5,
2, -3.870751, -5.763939, 1, -0.5, 0.5, 0.5,
2, -3.870751, -5.763939, 1, 1.5, 0.5, 0.5,
2, -3.870751, -5.763939, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.98965, -3, -5.003768,
-3.98965, 3, -5.003768,
-3.98965, -3, -5.003768,
-4.172969, -3, -5.257158,
-3.98965, -2, -5.003768,
-4.172969, -2, -5.257158,
-3.98965, -1, -5.003768,
-4.172969, -1, -5.257158,
-3.98965, 0, -5.003768,
-4.172969, 0, -5.257158,
-3.98965, 1, -5.003768,
-4.172969, 1, -5.257158,
-3.98965, 2, -5.003768,
-4.172969, 2, -5.257158,
-3.98965, 3, -5.003768,
-4.172969, 3, -5.257158
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
-4.539606, -3, -5.763939, 0, -0.5, 0.5, 0.5,
-4.539606, -3, -5.763939, 1, -0.5, 0.5, 0.5,
-4.539606, -3, -5.763939, 1, 1.5, 0.5, 0.5,
-4.539606, -3, -5.763939, 0, 1.5, 0.5, 0.5,
-4.539606, -2, -5.763939, 0, -0.5, 0.5, 0.5,
-4.539606, -2, -5.763939, 1, -0.5, 0.5, 0.5,
-4.539606, -2, -5.763939, 1, 1.5, 0.5, 0.5,
-4.539606, -2, -5.763939, 0, 1.5, 0.5, 0.5,
-4.539606, -1, -5.763939, 0, -0.5, 0.5, 0.5,
-4.539606, -1, -5.763939, 1, -0.5, 0.5, 0.5,
-4.539606, -1, -5.763939, 1, 1.5, 0.5, 0.5,
-4.539606, -1, -5.763939, 0, 1.5, 0.5, 0.5,
-4.539606, 0, -5.763939, 0, -0.5, 0.5, 0.5,
-4.539606, 0, -5.763939, 1, -0.5, 0.5, 0.5,
-4.539606, 0, -5.763939, 1, 1.5, 0.5, 0.5,
-4.539606, 0, -5.763939, 0, 1.5, 0.5, 0.5,
-4.539606, 1, -5.763939, 0, -0.5, 0.5, 0.5,
-4.539606, 1, -5.763939, 1, -0.5, 0.5, 0.5,
-4.539606, 1, -5.763939, 1, 1.5, 0.5, 0.5,
-4.539606, 1, -5.763939, 0, 1.5, 0.5, 0.5,
-4.539606, 2, -5.763939, 0, -0.5, 0.5, 0.5,
-4.539606, 2, -5.763939, 1, -0.5, 0.5, 0.5,
-4.539606, 2, -5.763939, 1, 1.5, 0.5, 0.5,
-4.539606, 2, -5.763939, 0, 1.5, 0.5, 0.5,
-4.539606, 3, -5.763939, 0, -0.5, 0.5, 0.5,
-4.539606, 3, -5.763939, 1, -0.5, 0.5, 0.5,
-4.539606, 3, -5.763939, 1, 1.5, 0.5, 0.5,
-4.539606, 3, -5.763939, 0, 1.5, 0.5, 0.5
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
-3.98965, -3.36142, -4,
-3.98965, -3.36142, 4,
-3.98965, -3.36142, -4,
-4.172969, -3.531197, -4,
-3.98965, -3.36142, -2,
-4.172969, -3.531197, -2,
-3.98965, -3.36142, 0,
-4.172969, -3.531197, 0,
-3.98965, -3.36142, 2,
-4.172969, -3.531197, 2,
-3.98965, -3.36142, 4,
-4.172969, -3.531197, 4
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
-4.539606, -3.870751, -4, 0, -0.5, 0.5, 0.5,
-4.539606, -3.870751, -4, 1, -0.5, 0.5, 0.5,
-4.539606, -3.870751, -4, 1, 1.5, 0.5, 0.5,
-4.539606, -3.870751, -4, 0, 1.5, 0.5, 0.5,
-4.539606, -3.870751, -2, 0, -0.5, 0.5, 0.5,
-4.539606, -3.870751, -2, 1, -0.5, 0.5, 0.5,
-4.539606, -3.870751, -2, 1, 1.5, 0.5, 0.5,
-4.539606, -3.870751, -2, 0, 1.5, 0.5, 0.5,
-4.539606, -3.870751, 0, 0, -0.5, 0.5, 0.5,
-4.539606, -3.870751, 0, 1, -0.5, 0.5, 0.5,
-4.539606, -3.870751, 0, 1, 1.5, 0.5, 0.5,
-4.539606, -3.870751, 0, 0, 1.5, 0.5, 0.5,
-4.539606, -3.870751, 2, 0, -0.5, 0.5, 0.5,
-4.539606, -3.870751, 2, 1, -0.5, 0.5, 0.5,
-4.539606, -3.870751, 2, 1, 1.5, 0.5, 0.5,
-4.539606, -3.870751, 2, 0, 1.5, 0.5, 0.5,
-4.539606, -3.870751, 4, 0, -0.5, 0.5, 0.5,
-4.539606, -3.870751, 4, 1, -0.5, 0.5, 0.5,
-4.539606, -3.870751, 4, 1, 1.5, 0.5, 0.5,
-4.539606, -3.870751, 4, 0, 1.5, 0.5, 0.5
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
-3.98965, -3.36142, -5.003768,
-3.98965, 3.429667, -5.003768,
-3.98965, -3.36142, 5.131857,
-3.98965, 3.429667, 5.131857,
-3.98965, -3.36142, -5.003768,
-3.98965, -3.36142, 5.131857,
-3.98965, 3.429667, -5.003768,
-3.98965, 3.429667, 5.131857,
-3.98965, -3.36142, -5.003768,
3.343096, -3.36142, -5.003768,
-3.98965, -3.36142, 5.131857,
3.343096, -3.36142, 5.131857,
-3.98965, 3.429667, -5.003768,
3.343096, 3.429667, -5.003768,
-3.98965, 3.429667, 5.131857,
3.343096, 3.429667, 5.131857,
3.343096, -3.36142, -5.003768,
3.343096, 3.429667, -5.003768,
3.343096, -3.36142, 5.131857,
3.343096, 3.429667, 5.131857,
3.343096, -3.36142, -5.003768,
3.343096, -3.36142, 5.131857,
3.343096, 3.429667, -5.003768,
3.343096, 3.429667, 5.131857
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
var radius = 7.600907;
var distance = 33.8173;
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
mvMatrix.translate( 0.3232774, -0.03412354, -0.06404448 );
mvMatrix.scale( 1.12076, 1.210153, 0.8108282 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.8173);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
furilazole<-read.table("furilazole.xyz")
```

```
## Error in read.table("furilazole.xyz"): no lines available in input
```

```r
x<-furilazole$V2
```

```
## Error in eval(expr, envir, enclos): object 'furilazole' not found
```

```r
y<-furilazole$V3
```

```
## Error in eval(expr, envir, enclos): object 'furilazole' not found
```

```r
z<-furilazole$V4
```

```
## Error in eval(expr, envir, enclos): object 'furilazole' not found
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
-3.882863, 0.6963946, 0.3951654, 0, 0, 1, 1, 1,
-2.892459, 2.031092, -0.5294793, 1, 0, 0, 1, 1,
-2.740347, -0.4588399, -1.923159, 1, 0, 0, 1, 1,
-2.489192, -0.5798688, -0.8216589, 1, 0, 0, 1, 1,
-2.449054, -0.8948541, -2.639895, 1, 0, 0, 1, 1,
-2.410482, 0.8915979, -0.3385451, 1, 0, 0, 1, 1,
-2.3948, -0.1744585, -2.196663, 0, 0, 0, 1, 1,
-2.3907, -0.7757812, -2.904299, 0, 0, 0, 1, 1,
-2.285572, -0.4452127, -0.1018856, 0, 0, 0, 1, 1,
-2.25425, -0.2034627, -2.161909, 0, 0, 0, 1, 1,
-2.248764, 0.3149139, -1.439185, 0, 0, 0, 1, 1,
-2.207526, -2.559479, -4.413994, 0, 0, 0, 1, 1,
-2.205132, 0.05716247, -2.71133, 0, 0, 0, 1, 1,
-2.19486, 0.7073556, 0.007047771, 1, 1, 1, 1, 1,
-2.122513, -1.190164, -3.516505, 1, 1, 1, 1, 1,
-2.117778, 1.136812, -0.4139561, 1, 1, 1, 1, 1,
-2.079504, -0.2178618, -2.606478, 1, 1, 1, 1, 1,
-2.063332, -1.725211, -2.309319, 1, 1, 1, 1, 1,
-2.053416, 0.4918801, -0.9595436, 1, 1, 1, 1, 1,
-2.039515, -0.2227386, -1.667122, 1, 1, 1, 1, 1,
-2.03071, 0.3339413, -2.056526, 1, 1, 1, 1, 1,
-2.009977, 1.539799, -0.4049097, 1, 1, 1, 1, 1,
-1.980822, 1.556216, -0.3130957, 1, 1, 1, 1, 1,
-1.974098, 0.4753803, -1.124001, 1, 1, 1, 1, 1,
-1.943795, -0.6555715, -1.815768, 1, 1, 1, 1, 1,
-1.899649, 0.172265, -1.880538, 1, 1, 1, 1, 1,
-1.896317, -0.4633302, -1.30688, 1, 1, 1, 1, 1,
-1.889819, -2.245663, -1.554519, 1, 1, 1, 1, 1,
-1.875875, 0.4404903, -1.652975, 0, 0, 1, 1, 1,
-1.848726, -2.40614, -1.918324, 1, 0, 0, 1, 1,
-1.836481, 0.5596672, -1.585924, 1, 0, 0, 1, 1,
-1.833903, 0.9115721, -1.583395, 1, 0, 0, 1, 1,
-1.816248, 0.6457794, -0.266233, 1, 0, 0, 1, 1,
-1.814529, 0.02701771, -3.788836, 1, 0, 0, 1, 1,
-1.78303, 0.233757, -0.896416, 0, 0, 0, 1, 1,
-1.781711, 0.2779277, -0.1128678, 0, 0, 0, 1, 1,
-1.777168, 0.0217644, -2.838282, 0, 0, 0, 1, 1,
-1.750278, 0.9841065, -0.1000848, 0, 0, 0, 1, 1,
-1.747295, 0.577182, -2.746629, 0, 0, 0, 1, 1,
-1.720977, 0.4300697, -3.339774, 0, 0, 0, 1, 1,
-1.717246, -0.1731931, 0.01690205, 0, 0, 0, 1, 1,
-1.713133, 0.07204916, -2.61432, 1, 1, 1, 1, 1,
-1.709294, 0.3569088, -3.113086, 1, 1, 1, 1, 1,
-1.696339, 1.088933, 0.2236993, 1, 1, 1, 1, 1,
-1.684026, 0.02043741, -3.632965, 1, 1, 1, 1, 1,
-1.681069, -0.7013799, -4.164131, 1, 1, 1, 1, 1,
-1.66393, -1.203248, -2.104839, 1, 1, 1, 1, 1,
-1.651525, 1.849526, 0.567008, 1, 1, 1, 1, 1,
-1.64587, -0.2938343, -1.137657, 1, 1, 1, 1, 1,
-1.639271, -0.763478, -1.38726, 1, 1, 1, 1, 1,
-1.631154, -0.9187374, -1.844389, 1, 1, 1, 1, 1,
-1.622206, 0.2060162, 0.6103168, 1, 1, 1, 1, 1,
-1.617695, -0.06102971, -0.8367923, 1, 1, 1, 1, 1,
-1.61741, 1.387697, -0.1045453, 1, 1, 1, 1, 1,
-1.581292, 1.782437, -0.3476195, 1, 1, 1, 1, 1,
-1.577369, -0.7447625, -2.780595, 1, 1, 1, 1, 1,
-1.577257, -0.05813339, -2.161004, 0, 0, 1, 1, 1,
-1.566791, -1.052974, -1.140218, 1, 0, 0, 1, 1,
-1.563125, 0.003899245, -2.431616, 1, 0, 0, 1, 1,
-1.541259, 1.073724, -1.260853, 1, 0, 0, 1, 1,
-1.530118, 1.633222, -0.1271329, 1, 0, 0, 1, 1,
-1.528472, 0.9426372, -1.282035, 1, 0, 0, 1, 1,
-1.52484, -0.510475, -1.442476, 0, 0, 0, 1, 1,
-1.524142, -0.3949896, -2.306894, 0, 0, 0, 1, 1,
-1.52326, 0.9058326, -0.9567541, 0, 0, 0, 1, 1,
-1.52152, -0.3491546, -2.228042, 0, 0, 0, 1, 1,
-1.520828, 0.691712, -0.4775703, 0, 0, 0, 1, 1,
-1.515662, -0.7555921, -2.105245, 0, 0, 0, 1, 1,
-1.512278, -0.0226725, -2.184167, 0, 0, 0, 1, 1,
-1.500458, -1.189901, -2.795236, 1, 1, 1, 1, 1,
-1.490012, 0.7663541, 0.120295, 1, 1, 1, 1, 1,
-1.485801, -1.051954, -1.419526, 1, 1, 1, 1, 1,
-1.479477, -0.05707581, -0.3412334, 1, 1, 1, 1, 1,
-1.475566, -0.248006, -0.773756, 1, 1, 1, 1, 1,
-1.456924, -0.7046902, -2.375206, 1, 1, 1, 1, 1,
-1.452422, -1.992355, -2.849318, 1, 1, 1, 1, 1,
-1.4515, -1.11853, -2.329365, 1, 1, 1, 1, 1,
-1.415825, -0.3990409, -1.890285, 1, 1, 1, 1, 1,
-1.409536, 0.7832301, -1.320984, 1, 1, 1, 1, 1,
-1.404577, 0.02901408, -2.140956, 1, 1, 1, 1, 1,
-1.395705, 1.645722, -1.205822, 1, 1, 1, 1, 1,
-1.395205, 0.1229847, -1.999904, 1, 1, 1, 1, 1,
-1.368721, 0.03275039, -0.6768361, 1, 1, 1, 1, 1,
-1.356557, 0.5921189, -0.2895087, 1, 1, 1, 1, 1,
-1.35287, 0.05059073, -2.673001, 0, 0, 1, 1, 1,
-1.347601, -0.8450183, -3.303941, 1, 0, 0, 1, 1,
-1.342125, 1.833873, 0.71578, 1, 0, 0, 1, 1,
-1.33632, -1.303652, -2.67366, 1, 0, 0, 1, 1,
-1.329997, -0.1911503, -3.827691, 1, 0, 0, 1, 1,
-1.321712, 0.7243703, -0.5323367, 1, 0, 0, 1, 1,
-1.302794, 1.237715, -1.276317, 0, 0, 0, 1, 1,
-1.300382, 3.303091, -0.5428855, 0, 0, 0, 1, 1,
-1.295922, 0.2709546, -0.03739879, 0, 0, 0, 1, 1,
-1.291352, -2.323098, -3.237402, 0, 0, 0, 1, 1,
-1.284718, -0.5440884, -0.1572576, 0, 0, 0, 1, 1,
-1.281745, 1.804634, -2.510243, 0, 0, 0, 1, 1,
-1.274319, -1.132608, -2.171383, 0, 0, 0, 1, 1,
-1.259253, 1.592907, 0.6633612, 1, 1, 1, 1, 1,
-1.258752, -0.2670116, 0.09593894, 1, 1, 1, 1, 1,
-1.257147, -0.3655395, -2.282662, 1, 1, 1, 1, 1,
-1.257068, 0.02195498, -1.022797, 1, 1, 1, 1, 1,
-1.241918, -0.748361, -2.647627, 1, 1, 1, 1, 1,
-1.238452, -2.397001, -3.463497, 1, 1, 1, 1, 1,
-1.232803, 0.4687167, -1.071624, 1, 1, 1, 1, 1,
-1.210929, -0.5050667, -2.191889, 1, 1, 1, 1, 1,
-1.20776, 0.9205089, 0.5412345, 1, 1, 1, 1, 1,
-1.204275, 0.2817645, -1.583466, 1, 1, 1, 1, 1,
-1.203628, 0.1682153, -0.7621698, 1, 1, 1, 1, 1,
-1.195714, 0.8711456, -0.3014809, 1, 1, 1, 1, 1,
-1.181553, -0.4338683, -1.719621, 1, 1, 1, 1, 1,
-1.178734, 2.034651, 0.2136102, 1, 1, 1, 1, 1,
-1.177166, -1.187396, -3.237438, 1, 1, 1, 1, 1,
-1.169085, -0.7243772, -0.3493183, 0, 0, 1, 1, 1,
-1.162012, -0.02779914, -1.467357, 1, 0, 0, 1, 1,
-1.159954, 0.3977515, -1.960744, 1, 0, 0, 1, 1,
-1.144809, -0.816492, -0.9920828, 1, 0, 0, 1, 1,
-1.137867, 1.022837, 0.4181931, 1, 0, 0, 1, 1,
-1.120281, -1.630133, 0.2426939, 1, 0, 0, 1, 1,
-1.116194, 0.557367, -0.4887916, 0, 0, 0, 1, 1,
-1.111943, -0.3801892, -1.677097, 0, 0, 0, 1, 1,
-1.11019, -0.2201315, -3.102957, 0, 0, 0, 1, 1,
-1.107576, 0.1370823, -3.127519, 0, 0, 0, 1, 1,
-1.10085, -0.7709945, -2.655405, 0, 0, 0, 1, 1,
-1.093417, -0.4392274, -1.089771, 0, 0, 0, 1, 1,
-1.089573, 0.2972497, -1.860793, 0, 0, 0, 1, 1,
-1.087547, 1.359174, -1.250466, 1, 1, 1, 1, 1,
-1.084351, 0.4259006, -0.1241991, 1, 1, 1, 1, 1,
-1.081553, 0.01816843, -1.103275, 1, 1, 1, 1, 1,
-1.080466, -1.836879, -2.544624, 1, 1, 1, 1, 1,
-1.076173, -0.7133316, -1.464617, 1, 1, 1, 1, 1,
-1.075444, -0.3097005, -3.120604, 1, 1, 1, 1, 1,
-1.075131, 1.96043, -0.5945911, 1, 1, 1, 1, 1,
-1.071214, -0.3549706, -2.133955, 1, 1, 1, 1, 1,
-1.070933, -0.433223, -2.342161, 1, 1, 1, 1, 1,
-1.069541, 0.4373353, -0.0386007, 1, 1, 1, 1, 1,
-1.053372, -1.121963, -0.9188918, 1, 1, 1, 1, 1,
-1.047623, 0.2213842, 0.3664138, 1, 1, 1, 1, 1,
-1.040186, 0.9889622, -3.037893, 1, 1, 1, 1, 1,
-1.037583, -1.245455, -2.208998, 1, 1, 1, 1, 1,
-1.03478, -1.075479, -1.486714, 1, 1, 1, 1, 1,
-1.03455, -0.03091307, -1.697774, 0, 0, 1, 1, 1,
-1.030994, 0.04918975, -1.486656, 1, 0, 0, 1, 1,
-1.025732, -0.3315648, -1.42059, 1, 0, 0, 1, 1,
-1.020533, 2.191889, -0.6620218, 1, 0, 0, 1, 1,
-1.015369, -1.843319, -1.359164, 1, 0, 0, 1, 1,
-1.013213, -0.3363371, -1.677405, 1, 0, 0, 1, 1,
-1.010906, -0.3662971, -2.397588, 0, 0, 0, 1, 1,
-1.010698, -1.287537, -2.799191, 0, 0, 0, 1, 1,
-1.010612, 0.3085537, 1.107698, 0, 0, 0, 1, 1,
-1.006245, -0.138368, -1.441294, 0, 0, 0, 1, 1,
-1.005493, -1.685181, -1.83356, 0, 0, 0, 1, 1,
-0.9948109, 0.03873968, -1.684883, 0, 0, 0, 1, 1,
-0.9921807, -0.5414166, -1.702464, 0, 0, 0, 1, 1,
-0.9910915, -0.08785595, -2.035952, 1, 1, 1, 1, 1,
-0.9773284, 1.978773, -0.9476373, 1, 1, 1, 1, 1,
-0.9715803, -0.1288219, -0.5950902, 1, 1, 1, 1, 1,
-0.9687886, 1.051257, 0.3980495, 1, 1, 1, 1, 1,
-0.962592, 0.5327457, -2.365701, 1, 1, 1, 1, 1,
-0.9549602, 1.379206, -2.566033, 1, 1, 1, 1, 1,
-0.9486694, 0.2175484, -1.58943, 1, 1, 1, 1, 1,
-0.9475157, 1.387153, -1.318789, 1, 1, 1, 1, 1,
-0.9430942, 1.698341, -1.437507, 1, 1, 1, 1, 1,
-0.9368471, 0.3043627, -1.33539, 1, 1, 1, 1, 1,
-0.9360178, -0.04942198, -2.747288, 1, 1, 1, 1, 1,
-0.9331419, -0.860664, -3.120186, 1, 1, 1, 1, 1,
-0.931053, 0.9479741, -1.188869, 1, 1, 1, 1, 1,
-0.9307734, -0.1220797, -2.285657, 1, 1, 1, 1, 1,
-0.9246134, -0.9782831, -2.473332, 1, 1, 1, 1, 1,
-0.9231342, -1.788831, -2.262847, 0, 0, 1, 1, 1,
-0.9208196, -0.0816432, -1.06552, 1, 0, 0, 1, 1,
-0.9098195, 0.06285898, 0.5732383, 1, 0, 0, 1, 1,
-0.9081755, 1.234942, -1.459896, 1, 0, 0, 1, 1,
-0.9026843, 1.620506, -0.4783652, 1, 0, 0, 1, 1,
-0.9025819, 0.6362482, 1.346646, 1, 0, 0, 1, 1,
-0.9008207, 0.8214859, 0.09909727, 0, 0, 0, 1, 1,
-0.8989087, -0.4054158, -3.13713, 0, 0, 0, 1, 1,
-0.8978103, -0.9201578, -1.127928, 0, 0, 0, 1, 1,
-0.8960314, -0.03438406, -1.36339, 0, 0, 0, 1, 1,
-0.8943503, 0.1083097, -1.854455, 0, 0, 0, 1, 1,
-0.8918723, -0.1407085, -2.871482, 0, 0, 0, 1, 1,
-0.8882945, -0.3592485, -2.784899, 0, 0, 0, 1, 1,
-0.8847521, -0.966031, -2.756794, 1, 1, 1, 1, 1,
-0.8700401, -0.7171596, -2.096276, 1, 1, 1, 1, 1,
-0.8681964, -1.688815, -3.885199, 1, 1, 1, 1, 1,
-0.8681822, 1.124565, -2.175073, 1, 1, 1, 1, 1,
-0.8676825, 0.1274615, -1.278238, 1, 1, 1, 1, 1,
-0.8639514, 0.8489249, -2.757227, 1, 1, 1, 1, 1,
-0.8637516, 0.6086133, -0.8835765, 1, 1, 1, 1, 1,
-0.8542168, 0.287474, -0.6872905, 1, 1, 1, 1, 1,
-0.8486579, 0.6753557, -0.8184338, 1, 1, 1, 1, 1,
-0.8480519, 0.3297824, -2.042656, 1, 1, 1, 1, 1,
-0.8466042, -0.136877, -0.6851088, 1, 1, 1, 1, 1,
-0.8396479, 0.03825924, -0.9586543, 1, 1, 1, 1, 1,
-0.8225722, -1.701576, -3.867012, 1, 1, 1, 1, 1,
-0.8221457, -0.6646926, -0.7387105, 1, 1, 1, 1, 1,
-0.8215315, -0.4864535, -3.679211, 1, 1, 1, 1, 1,
-0.8206576, 1.350049, -0.01404926, 0, 0, 1, 1, 1,
-0.8199651, 1.459001, -0.5163507, 1, 0, 0, 1, 1,
-0.8182202, -0.1121573, -1.709648, 1, 0, 0, 1, 1,
-0.8117845, 0.9674268, -0.7391253, 1, 0, 0, 1, 1,
-0.8094845, -0.3665375, -2.098062, 1, 0, 0, 1, 1,
-0.804233, -0.4381444, -1.649316, 1, 0, 0, 1, 1,
-0.7986748, 1.154938, 0.154519, 0, 0, 0, 1, 1,
-0.7979186, -0.6896883, -2.273035, 0, 0, 0, 1, 1,
-0.7961341, -0.7565214, -1.396304, 0, 0, 0, 1, 1,
-0.7958615, -0.7499152, -2.070003, 0, 0, 0, 1, 1,
-0.7954283, 0.4713682, -1.413505, 0, 0, 0, 1, 1,
-0.7934533, -0.1653652, -4.138124, 0, 0, 0, 1, 1,
-0.7925584, 0.4197371, -1.8919, 0, 0, 0, 1, 1,
-0.7920737, 1.398169, 0.7788255, 1, 1, 1, 1, 1,
-0.7912796, -0.2600567, -2.437394, 1, 1, 1, 1, 1,
-0.7905185, 0.01055377, -2.075686, 1, 1, 1, 1, 1,
-0.790261, 0.2461117, -2.328326, 1, 1, 1, 1, 1,
-0.7849556, 2.304844, -0.67085, 1, 1, 1, 1, 1,
-0.7830006, 0.7812495, 0.07781287, 1, 1, 1, 1, 1,
-0.7793431, -0.9571176, -1.60244, 1, 1, 1, 1, 1,
-0.7751359, 0.2273812, -2.255214, 1, 1, 1, 1, 1,
-0.7723888, 0.2374467, 1.434847, 1, 1, 1, 1, 1,
-0.7698814, -0.5675698, -2.285426, 1, 1, 1, 1, 1,
-0.7680956, -1.26129, -2.848808, 1, 1, 1, 1, 1,
-0.7612967, -0.2247033, -1.688221, 1, 1, 1, 1, 1,
-0.7562156, -0.348769, 0.3794948, 1, 1, 1, 1, 1,
-0.7560148, -0.5183821, -2.049624, 1, 1, 1, 1, 1,
-0.7553717, -0.1006863, -3.695253, 1, 1, 1, 1, 1,
-0.7540849, 0.5106905, 0.3413489, 0, 0, 1, 1, 1,
-0.7486908, 1.416571, 0.7297929, 1, 0, 0, 1, 1,
-0.7437977, 0.5493236, -2.104351, 1, 0, 0, 1, 1,
-0.7416003, 0.7002373, -1.061226, 1, 0, 0, 1, 1,
-0.7400138, 0.7294493, 0.6587214, 1, 0, 0, 1, 1,
-0.7326802, -0.2077282, 0.01511125, 1, 0, 0, 1, 1,
-0.7324253, -0.1013259, -1.872629, 0, 0, 0, 1, 1,
-0.724717, 1.163194, -0.1518784, 0, 0, 0, 1, 1,
-0.7244026, -0.4741527, -1.89988, 0, 0, 0, 1, 1,
-0.7223284, 0.3063816, -0.5561282, 0, 0, 0, 1, 1,
-0.7214454, -0.3193973, -3.657712, 0, 0, 0, 1, 1,
-0.7131199, 0.2399096, -1.879479, 0, 0, 0, 1, 1,
-0.7079096, 0.742707, -0.01941423, 0, 0, 0, 1, 1,
-0.7044843, -1.211406, -1.288093, 1, 1, 1, 1, 1,
-0.7044252, -0.6982085, -1.686954, 1, 1, 1, 1, 1,
-0.7033805, -1.52629, -4.470998, 1, 1, 1, 1, 1,
-0.7031329, 0.4419963, -0.2280939, 1, 1, 1, 1, 1,
-0.702293, 0.3354738, -0.3940622, 1, 1, 1, 1, 1,
-0.7001624, 0.8730191, -1.642751, 1, 1, 1, 1, 1,
-0.6941419, 0.3307963, -0.7580491, 1, 1, 1, 1, 1,
-0.6907471, 1.405192, -0.06165666, 1, 1, 1, 1, 1,
-0.6901638, 0.9859563, -2.016119, 1, 1, 1, 1, 1,
-0.6898929, -0.04579367, -3.99957, 1, 1, 1, 1, 1,
-0.6889981, 0.4651777, -1.099617, 1, 1, 1, 1, 1,
-0.6884284, 0.9271409, 0.40435, 1, 1, 1, 1, 1,
-0.6881208, -0.4365058, -0.809656, 1, 1, 1, 1, 1,
-0.6837632, 0.7993147, -0.7260782, 1, 1, 1, 1, 1,
-0.6832858, 1.078839, 0.6937791, 1, 1, 1, 1, 1,
-0.6831288, -1.656691, -1.695592, 0, 0, 1, 1, 1,
-0.6798055, -0.541434, -2.821195, 1, 0, 0, 1, 1,
-0.6774039, -1.832647, -1.80359, 1, 0, 0, 1, 1,
-0.6682031, 0.4327017, -1.256649, 1, 0, 0, 1, 1,
-0.6651093, 0.4303704, -0.02646966, 1, 0, 0, 1, 1,
-0.658867, 0.9855244, -0.07595465, 1, 0, 0, 1, 1,
-0.6584011, 0.8751034, -1.297609, 0, 0, 0, 1, 1,
-0.6565248, -0.03301891, -3.135001, 0, 0, 0, 1, 1,
-0.6565149, 0.2962659, 0.2927323, 0, 0, 0, 1, 1,
-0.6507322, 0.9269634, -1.560846, 0, 0, 0, 1, 1,
-0.6487536, 0.2324451, -1.564921, 0, 0, 0, 1, 1,
-0.6471933, -0.5803151, -3.123813, 0, 0, 0, 1, 1,
-0.643314, -1.931646, -4.513355, 0, 0, 0, 1, 1,
-0.6408718, 0.8407819, -0.2023911, 1, 1, 1, 1, 1,
-0.6402061, 1.227194, -3.280139, 1, 1, 1, 1, 1,
-0.6363681, -1.32172, -2.024931, 1, 1, 1, 1, 1,
-0.6304272, 0.478588, -0.6577337, 1, 1, 1, 1, 1,
-0.6265198, -0.01734416, -1.824511, 1, 1, 1, 1, 1,
-0.6251268, 1.383384, -1.390728, 1, 1, 1, 1, 1,
-0.6152445, -1.11225, -1.588916, 1, 1, 1, 1, 1,
-0.6111136, 0.7897166, -0.4258699, 1, 1, 1, 1, 1,
-0.6086748, -0.102399, -2.312922, 1, 1, 1, 1, 1,
-0.608173, -0.06436433, -2.561593, 1, 1, 1, 1, 1,
-0.6013814, -0.149203, -0.8724436, 1, 1, 1, 1, 1,
-0.5987123, -0.9787394, -2.413721, 1, 1, 1, 1, 1,
-0.5983478, -0.9377782, -4.320393, 1, 1, 1, 1, 1,
-0.5967022, -0.1179589, -2.642091, 1, 1, 1, 1, 1,
-0.5956976, -0.03987418, -1.808922, 1, 1, 1, 1, 1,
-0.5952782, -0.4055968, -2.707755, 0, 0, 1, 1, 1,
-0.5914235, 0.162359, -2.406991, 1, 0, 0, 1, 1,
-0.5865515, 1.184525, -2.281583, 1, 0, 0, 1, 1,
-0.5821725, 0.3261758, -1.477168, 1, 0, 0, 1, 1,
-0.5792596, -0.3492259, -2.765263, 1, 0, 0, 1, 1,
-0.577282, -2.240941, -2.142358, 1, 0, 0, 1, 1,
-0.5715388, -0.2937156, -1.690083, 0, 0, 0, 1, 1,
-0.5639807, 0.7453365, -0.9203225, 0, 0, 0, 1, 1,
-0.561909, 1.249003, -0.6861202, 0, 0, 0, 1, 1,
-0.5589792, -0.2238237, -1.665612, 0, 0, 0, 1, 1,
-0.5541968, 0.4196581, -1.458061, 0, 0, 0, 1, 1,
-0.549449, 1.12463, -1.007052, 0, 0, 0, 1, 1,
-0.5484141, 0.5309373, 0.2340254, 0, 0, 0, 1, 1,
-0.5470216, -0.3281175, -1.255387, 1, 1, 1, 1, 1,
-0.5427611, 0.8442591, -1.965959, 1, 1, 1, 1, 1,
-0.540669, 2.187374, 0.8630628, 1, 1, 1, 1, 1,
-0.5385821, 0.6153873, -0.7925749, 1, 1, 1, 1, 1,
-0.5382051, 0.1606808, -1.565625, 1, 1, 1, 1, 1,
-0.5379333, 0.07867204, -2.248746, 1, 1, 1, 1, 1,
-0.5326228, 0.4127986, -1.848066, 1, 1, 1, 1, 1,
-0.5325555, -0.9205486, -3.696367, 1, 1, 1, 1, 1,
-0.5263972, 0.003027984, -2.526031, 1, 1, 1, 1, 1,
-0.5228507, -1.233987, -1.599901, 1, 1, 1, 1, 1,
-0.5176008, -0.5716612, -3.160421, 1, 1, 1, 1, 1,
-0.5170637, 0.3593054, -0.5595076, 1, 1, 1, 1, 1,
-0.5148212, 0.1644778, -1.054426, 1, 1, 1, 1, 1,
-0.5109054, 0.6898881, 1.170258, 1, 1, 1, 1, 1,
-0.51004, 0.1893328, -1.246944, 1, 1, 1, 1, 1,
-0.5066227, 1.149604, -1.350764, 0, 0, 1, 1, 1,
-0.5066195, -0.747078, -0.8964124, 1, 0, 0, 1, 1,
-0.5062357, 1.356848, -0.8703007, 1, 0, 0, 1, 1,
-0.5044649, -0.09034142, 0.768957, 1, 0, 0, 1, 1,
-0.5002098, -0.7674949, -1.97447, 1, 0, 0, 1, 1,
-0.4993128, -1.723564, -2.669493, 1, 0, 0, 1, 1,
-0.4976632, -2.121146, -2.681046, 0, 0, 0, 1, 1,
-0.4973585, 0.1390283, 0.584239, 0, 0, 0, 1, 1,
-0.4846078, 0.4900907, -2.537678, 0, 0, 0, 1, 1,
-0.4833267, -0.06231181, -1.223227, 0, 0, 0, 1, 1,
-0.4814484, 1.143792, -0.1480097, 0, 0, 0, 1, 1,
-0.4784859, 1.135122, -0.7865924, 0, 0, 0, 1, 1,
-0.477562, 0.389197, -1.35987, 0, 0, 0, 1, 1,
-0.4758778, -0.9476527, -2.931324, 1, 1, 1, 1, 1,
-0.4752949, -0.06824332, -1.522697, 1, 1, 1, 1, 1,
-0.4739334, -0.4436209, -3.408777, 1, 1, 1, 1, 1,
-0.4734537, -1.204356, -1.988044, 1, 1, 1, 1, 1,
-0.4695564, -0.8936153, -3.935912, 1, 1, 1, 1, 1,
-0.468542, 0.572495, -0.4475901, 1, 1, 1, 1, 1,
-0.4517152, 0.6922511, -2.275258, 1, 1, 1, 1, 1,
-0.4513379, -0.0406416, -2.450331, 1, 1, 1, 1, 1,
-0.446368, -1.258512, -2.157004, 1, 1, 1, 1, 1,
-0.4453586, 0.8949842, -1.633664, 1, 1, 1, 1, 1,
-0.4422668, -0.1513133, -2.588259, 1, 1, 1, 1, 1,
-0.4405665, 0.9082385, -1.210239, 1, 1, 1, 1, 1,
-0.435969, -0.906763, -2.788781, 1, 1, 1, 1, 1,
-0.4350198, -0.5316921, -2.99114, 1, 1, 1, 1, 1,
-0.4326199, 1.054955, -1.480324, 1, 1, 1, 1, 1,
-0.4272791, 1.251227, -1.424191, 0, 0, 1, 1, 1,
-0.4268615, -0.1554286, -1.753114, 1, 0, 0, 1, 1,
-0.4233652, 0.4133331, -0.2725656, 1, 0, 0, 1, 1,
-0.4232227, 1.163314, 0.3707489, 1, 0, 0, 1, 1,
-0.4218415, 0.9393654, -0.03420566, 1, 0, 0, 1, 1,
-0.4087882, -0.7346607, -2.844023, 1, 0, 0, 1, 1,
-0.4057026, -1.025565, -3.533162, 0, 0, 0, 1, 1,
-0.402943, -0.4453486, -2.696284, 0, 0, 0, 1, 1,
-0.4019823, -2.064939, -3.836366, 0, 0, 0, 1, 1,
-0.3944885, 1.477996, -0.5443797, 0, 0, 0, 1, 1,
-0.3888587, -0.4671967, -3.021713, 0, 0, 0, 1, 1,
-0.3862621, -0.2428414, -2.504974, 0, 0, 0, 1, 1,
-0.3828032, -0.2828878, -1.624616, 0, 0, 0, 1, 1,
-0.3802232, -0.8811499, -2.958241, 1, 1, 1, 1, 1,
-0.3795112, 1.146671, 0.4400686, 1, 1, 1, 1, 1,
-0.3638264, 0.8209152, 0.6236473, 1, 1, 1, 1, 1,
-0.3632835, -1.972867, -3.205799, 1, 1, 1, 1, 1,
-0.3614544, 0.3462773, 0.4329587, 1, 1, 1, 1, 1,
-0.3586748, 0.6771773, -0.6044063, 1, 1, 1, 1, 1,
-0.3566753, -0.06334722, 0.2632397, 1, 1, 1, 1, 1,
-0.3508094, -0.570178, -2.317351, 1, 1, 1, 1, 1,
-0.344407, 1.290372, -0.5239871, 1, 1, 1, 1, 1,
-0.3410521, 0.6486403, 0.737789, 1, 1, 1, 1, 1,
-0.340668, 0.5095881, -1.187294, 1, 1, 1, 1, 1,
-0.3374205, 1.394569, 0.2386062, 1, 1, 1, 1, 1,
-0.3367543, -0.8407321, -3.360651, 1, 1, 1, 1, 1,
-0.3324181, 1.485468, 0.9593995, 1, 1, 1, 1, 1,
-0.3306221, -0.5319724, 0.00650865, 1, 1, 1, 1, 1,
-0.3299871, 0.1396737, 0.2868041, 0, 0, 1, 1, 1,
-0.3286532, -0.2756134, -2.147132, 1, 0, 0, 1, 1,
-0.3261224, -0.3425117, -2.860885, 1, 0, 0, 1, 1,
-0.3205188, 0.2979127, -0.8308709, 1, 0, 0, 1, 1,
-0.3160794, 1.139965, 0.1522834, 1, 0, 0, 1, 1,
-0.3059984, 1.374109, 0.3920546, 1, 0, 0, 1, 1,
-0.301227, 1.479002, -0.8838561, 0, 0, 0, 1, 1,
-0.3000323, 0.5807143, -1.4484, 0, 0, 0, 1, 1,
-0.296782, 0.3423437, -1.421524, 0, 0, 0, 1, 1,
-0.2941544, -0.5364592, -3.929442, 0, 0, 0, 1, 1,
-0.2856684, 0.6249821, -1.226305, 0, 0, 0, 1, 1,
-0.2851425, 2.023791, -0.43328, 0, 0, 0, 1, 1,
-0.2798621, -0.2348588, -3.022489, 0, 0, 0, 1, 1,
-0.278553, 1.654952, -0.14249, 1, 1, 1, 1, 1,
-0.2744688, -0.5122609, -2.961373, 1, 1, 1, 1, 1,
-0.273831, -0.101607, -1.10513, 1, 1, 1, 1, 1,
-0.263664, -2.177521, -3.487694, 1, 1, 1, 1, 1,
-0.2626261, 0.06164534, 0.9155827, 1, 1, 1, 1, 1,
-0.2620316, -0.3966892, -3.513612, 1, 1, 1, 1, 1,
-0.2577531, 0.01161147, -1.24699, 1, 1, 1, 1, 1,
-0.2553873, -0.4801211, -4.272692, 1, 1, 1, 1, 1,
-0.2500913, 0.2236189, -1.710183, 1, 1, 1, 1, 1,
-0.2489404, -0.3047167, -2.62046, 1, 1, 1, 1, 1,
-0.2480692, 0.1040446, -1.451391, 1, 1, 1, 1, 1,
-0.2437361, -1.425725, -2.085106, 1, 1, 1, 1, 1,
-0.2334442, 1.270086, -1.083533, 1, 1, 1, 1, 1,
-0.2318033, 0.1810359, -1.796933, 1, 1, 1, 1, 1,
-0.2281732, 0.7725861, -1.337199, 1, 1, 1, 1, 1,
-0.2173475, -0.3005132, -3.732516, 0, 0, 1, 1, 1,
-0.2131896, -0.6630525, -3.893183, 1, 0, 0, 1, 1,
-0.2119539, -1.558095, -2.856945, 1, 0, 0, 1, 1,
-0.2100799, 1.576006, 0.2665714, 1, 0, 0, 1, 1,
-0.2060472, 2.497544, -1.573482, 1, 0, 0, 1, 1,
-0.2054961, -2.177852, -2.233066, 1, 0, 0, 1, 1,
-0.201658, -0.1276647, -0.6467633, 0, 0, 0, 1, 1,
-0.2010864, -0.3561239, -4.499987, 0, 0, 0, 1, 1,
-0.1988406, 1.444549, 1.185074, 0, 0, 0, 1, 1,
-0.1965244, 0.0289376, 0.29321, 0, 0, 0, 1, 1,
-0.1964571, 0.646884, 0.5272383, 0, 0, 0, 1, 1,
-0.1896875, 1.764588, -0.1254944, 0, 0, 0, 1, 1,
-0.1880511, 1.324226, 0.8374, 0, 0, 0, 1, 1,
-0.1846306, -0.9050427, -2.952706, 1, 1, 1, 1, 1,
-0.1824291, -0.5371066, -2.433146, 1, 1, 1, 1, 1,
-0.1746836, 1.785487, 1.501569, 1, 1, 1, 1, 1,
-0.1721971, -0.216979, -2.318356, 1, 1, 1, 1, 1,
-0.1689989, -0.287531, 0.2748736, 1, 1, 1, 1, 1,
-0.1683655, -0.6174321, -2.355695, 1, 1, 1, 1, 1,
-0.166124, -0.9205101, -1.905286, 1, 1, 1, 1, 1,
-0.1543013, -0.5989082, -2.531349, 1, 1, 1, 1, 1,
-0.1537841, -0.2072034, -2.874721, 1, 1, 1, 1, 1,
-0.1505983, -0.8318121, -1.623949, 1, 1, 1, 1, 1,
-0.1496442, -0.4595641, -3.483028, 1, 1, 1, 1, 1,
-0.1488664, -0.2478867, -1.391279, 1, 1, 1, 1, 1,
-0.1483439, -1.999838, -2.213307, 1, 1, 1, 1, 1,
-0.146312, 0.7037975, -1.427899, 1, 1, 1, 1, 1,
-0.1432456, 0.332072, -1.261715, 1, 1, 1, 1, 1,
-0.14247, 0.662009, -1.764924, 0, 0, 1, 1, 1,
-0.1420732, -0.1374799, -1.041693, 1, 0, 0, 1, 1,
-0.1416468, 2.221643, 0.7845562, 1, 0, 0, 1, 1,
-0.1412179, -0.7725721, -3.251754, 1, 0, 0, 1, 1,
-0.1409804, 0.7015831, -0.225658, 1, 0, 0, 1, 1,
-0.1406353, 1.252766, -0.3766484, 1, 0, 0, 1, 1,
-0.1377126, -0.8584366, -4.608319, 0, 0, 0, 1, 1,
-0.1374628, -0.05322398, -2.480545, 0, 0, 0, 1, 1,
-0.1359967, -1.863112, -3.194031, 0, 0, 0, 1, 1,
-0.1350499, -0.7428916, -4.501757, 0, 0, 0, 1, 1,
-0.132973, -1.920992, -1.134944, 0, 0, 0, 1, 1,
-0.127703, 0.1628177, -0.8760932, 0, 0, 0, 1, 1,
-0.1269649, 0.5412291, 0.06514694, 0, 0, 0, 1, 1,
-0.1268196, 1.506278, 0.01420949, 1, 1, 1, 1, 1,
-0.121887, 0.3313726, -2.370851, 1, 1, 1, 1, 1,
-0.1195737, -0.8997359, -4.804429, 1, 1, 1, 1, 1,
-0.1160942, 0.04287632, -2.018094, 1, 1, 1, 1, 1,
-0.1150391, -0.5829976, -2.762667, 1, 1, 1, 1, 1,
-0.1134784, 0.4259022, 0.1635537, 1, 1, 1, 1, 1,
-0.1092463, -2.055533, -4.856162, 1, 1, 1, 1, 1,
-0.1090968, -0.338615, -3.107046, 1, 1, 1, 1, 1,
-0.1085561, -0.7885573, -3.055212, 1, 1, 1, 1, 1,
-0.09436614, -0.157798, -2.264691, 1, 1, 1, 1, 1,
-0.09217703, 0.2631047, -1.030453, 1, 1, 1, 1, 1,
-0.09110764, -1.033415, -2.482681, 1, 1, 1, 1, 1,
-0.09055377, 1.609449, -0.2885799, 1, 1, 1, 1, 1,
-0.08743925, 0.06164409, 0.7428299, 1, 1, 1, 1, 1,
-0.08734511, -2.154581, -2.8243, 1, 1, 1, 1, 1,
-0.08610383, 0.1643786, -0.6515827, 0, 0, 1, 1, 1,
-0.08492392, 1.515578, -2.151169, 1, 0, 0, 1, 1,
-0.08340137, -0.1146549, -3.029623, 1, 0, 0, 1, 1,
-0.08073869, -1.788403, -3.366068, 1, 0, 0, 1, 1,
-0.07166092, 0.7372946, -0.8995612, 1, 0, 0, 1, 1,
-0.07030956, -1.058301, -3.699162, 1, 0, 0, 1, 1,
-0.06965205, -0.6527337, -1.761316, 0, 0, 0, 1, 1,
-0.06769068, -0.201429, -2.338959, 0, 0, 0, 1, 1,
-0.06501076, -0.05246777, -0.5187316, 0, 0, 0, 1, 1,
-0.06406607, -0.8492504, -4.437329, 0, 0, 0, 1, 1,
-0.06026443, -0.3744942, -2.343868, 0, 0, 0, 1, 1,
-0.06025414, 0.9538826, -0.3675412, 0, 0, 0, 1, 1,
-0.05905027, -1.21339, -0.4133668, 0, 0, 0, 1, 1,
-0.05851744, 1.459482, 1.29521, 1, 1, 1, 1, 1,
-0.0573453, 1.203409, 0.2503809, 1, 1, 1, 1, 1,
-0.05631339, -0.4789339, -2.146745, 1, 1, 1, 1, 1,
-0.05507056, 0.9583423, 1.221177, 1, 1, 1, 1, 1,
-0.05369142, -1.045138, -2.644835, 1, 1, 1, 1, 1,
-0.05233381, -1.505663, -2.007035, 1, 1, 1, 1, 1,
-0.05219589, 0.385758, -0.1481141, 1, 1, 1, 1, 1,
-0.0457724, 1.12764, -0.4593335, 1, 1, 1, 1, 1,
-0.03359605, 0.5482851, -1.196083, 1, 1, 1, 1, 1,
-0.03287744, -0.1423965, -3.489877, 1, 1, 1, 1, 1,
-0.02771676, -1.870172, -4.313437, 1, 1, 1, 1, 1,
-0.02767242, -2.046195, -3.527414, 1, 1, 1, 1, 1,
-0.0264125, 0.01179919, -2.120763, 1, 1, 1, 1, 1,
-0.02625238, 1.341106, 0.1836784, 1, 1, 1, 1, 1,
-0.02252027, 0.004346135, -1.060662, 1, 1, 1, 1, 1,
-0.02234596, -0.5713854, -2.472972, 0, 0, 1, 1, 1,
-0.01990023, 0.7320214, -0.1950553, 1, 0, 0, 1, 1,
-0.01578915, -0.2758197, -4.394574, 1, 0, 0, 1, 1,
-0.01297337, -0.6879929, -3.733562, 1, 0, 0, 1, 1,
-0.01043362, 0.584464, -0.2048071, 1, 0, 0, 1, 1,
-0.01037701, -0.2765624, -2.676543, 1, 0, 0, 1, 1,
-0.004062379, -0.8428658, -3.001508, 0, 0, 0, 1, 1,
0.00314667, 0.6202601, -2.286098, 0, 0, 0, 1, 1,
0.008315047, 0.4380821, -0.5686997, 0, 0, 0, 1, 1,
0.01109272, 0.3664232, 0.935901, 0, 0, 0, 1, 1,
0.01488388, -0.6599374, 4.100703, 0, 0, 0, 1, 1,
0.02040341, -0.1322781, 3.010061, 0, 0, 0, 1, 1,
0.02184969, 0.3918235, 0.1079385, 0, 0, 0, 1, 1,
0.02207558, -0.611389, 2.043617, 1, 1, 1, 1, 1,
0.02640283, -0.02469086, 1.415879, 1, 1, 1, 1, 1,
0.02765014, -1.510169, 1.401652, 1, 1, 1, 1, 1,
0.02771797, -0.2123845, 2.420549, 1, 1, 1, 1, 1,
0.02825279, 0.4728097, 1.313117, 1, 1, 1, 1, 1,
0.02945535, -2.235027, 2.573829, 1, 1, 1, 1, 1,
0.03174528, -1.705145, 2.09764, 1, 1, 1, 1, 1,
0.03852857, -0.8650547, 4.966953, 1, 1, 1, 1, 1,
0.03883857, -0.8184313, 3.048226, 1, 1, 1, 1, 1,
0.0419216, 0.7001357, -0.2368499, 1, 1, 1, 1, 1,
0.04482503, -2.002632, 3.889638, 1, 1, 1, 1, 1,
0.04558926, -0.2091897, 2.903471, 1, 1, 1, 1, 1,
0.04818079, -1.629721, 2.368683, 1, 1, 1, 1, 1,
0.05247474, -0.3627368, 4.984251, 1, 1, 1, 1, 1,
0.05281261, 0.6203245, 1.266946, 1, 1, 1, 1, 1,
0.05310511, 1.164809, 0.5538145, 0, 0, 1, 1, 1,
0.05820236, 0.7095177, -0.1282659, 1, 0, 0, 1, 1,
0.05820307, -0.0622271, 2.17304, 1, 0, 0, 1, 1,
0.05907857, -0.9794879, 1.447209, 1, 0, 0, 1, 1,
0.05976478, 0.114875, 1.27694, 1, 0, 0, 1, 1,
0.06210511, 0.5825571, 0.1939525, 1, 0, 0, 1, 1,
0.06326838, -0.6987864, 2.436343, 0, 0, 0, 1, 1,
0.06890959, -0.9957146, 4.449142, 0, 0, 0, 1, 1,
0.0724043, 0.04911871, 1.707017, 0, 0, 0, 1, 1,
0.08380005, -0.7769989, 1.511792, 0, 0, 0, 1, 1,
0.08546175, -0.7299069, 1.513965, 0, 0, 0, 1, 1,
0.08730244, -0.0518433, 0.5676897, 0, 0, 0, 1, 1,
0.08739632, -0.0001161186, 0.8542301, 0, 0, 0, 1, 1,
0.09488954, -0.2132791, 2.588656, 1, 1, 1, 1, 1,
0.09498757, 0.1207663, 0.8253242, 1, 1, 1, 1, 1,
0.09763227, -1.021233, 2.070964, 1, 1, 1, 1, 1,
0.1034765, -0.7507061, 2.93065, 1, 1, 1, 1, 1,
0.1041154, 0.3624578, 0.5979984, 1, 1, 1, 1, 1,
0.1043991, 0.1734874, 0.7470178, 1, 1, 1, 1, 1,
0.1106334, 1.060057, 0.7035233, 1, 1, 1, 1, 1,
0.1122749, 0.7839555, 0.3721345, 1, 1, 1, 1, 1,
0.1130942, 2.722902, 0.5942609, 1, 1, 1, 1, 1,
0.1231241, 0.6386248, 1.051963, 1, 1, 1, 1, 1,
0.1233697, -0.4717018, 2.317518, 1, 1, 1, 1, 1,
0.1279566, -0.872628, 2.095287, 1, 1, 1, 1, 1,
0.1290783, -1.283754, 3.004045, 1, 1, 1, 1, 1,
0.1339364, -0.153224, 1.33189, 1, 1, 1, 1, 1,
0.1375133, -0.6217716, 4.082245, 1, 1, 1, 1, 1,
0.1392052, 0.76332, 1.654616, 0, 0, 1, 1, 1,
0.1435218, -0.959156, 4.320827, 1, 0, 0, 1, 1,
0.144209, -0.8436809, 2.732593, 1, 0, 0, 1, 1,
0.1454827, -0.8979919, 3.656122, 1, 0, 0, 1, 1,
0.1455297, 0.2313484, -0.184607, 1, 0, 0, 1, 1,
0.1474641, 0.3014849, 1.089638, 1, 0, 0, 1, 1,
0.1492491, 1.891729, 0.01274633, 0, 0, 0, 1, 1,
0.1506181, 0.7062575, 0.8954229, 0, 0, 0, 1, 1,
0.1520711, 0.2317467, 0.2000563, 0, 0, 0, 1, 1,
0.153639, 0.4369927, 0.9996215, 0, 0, 0, 1, 1,
0.1566844, -0.1791727, 2.371403, 0, 0, 0, 1, 1,
0.1570757, 0.1939496, 1.165955, 0, 0, 0, 1, 1,
0.1612334, -0.07048896, 1.235571, 0, 0, 0, 1, 1,
0.1695457, -1.422765, 2.87104, 1, 1, 1, 1, 1,
0.1712807, 2.968755, -0.6105453, 1, 1, 1, 1, 1,
0.1719427, -0.9975719, 4.231241, 1, 1, 1, 1, 1,
0.1738914, 0.2549726, 1.446587, 1, 1, 1, 1, 1,
0.1741037, 1.146745, 0.6656415, 1, 1, 1, 1, 1,
0.1755735, -1.206605, 2.363025, 1, 1, 1, 1, 1,
0.1784166, -0.5247893, 3.593354, 1, 1, 1, 1, 1,
0.1786871, -1.737511, 4.148479, 1, 1, 1, 1, 1,
0.1800788, 0.8804984, -1.900479, 1, 1, 1, 1, 1,
0.1903074, -1.232425, 3.559523, 1, 1, 1, 1, 1,
0.1940762, 0.3972558, 2.884817, 1, 1, 1, 1, 1,
0.1945231, -1.163751, 2.293735, 1, 1, 1, 1, 1,
0.1961187, -0.7176817, 1.563528, 1, 1, 1, 1, 1,
0.2071282, 0.6777145, 1.143167, 1, 1, 1, 1, 1,
0.2145055, 0.3155577, 2.426276, 1, 1, 1, 1, 1,
0.2164393, 2.014823, 0.043354, 0, 0, 1, 1, 1,
0.220994, -0.01749305, 2.331086, 1, 0, 0, 1, 1,
0.2211227, 0.4152498, -1.162814, 1, 0, 0, 1, 1,
0.2306876, 1.587345, 1.468999, 1, 0, 0, 1, 1,
0.2373523, -1.485842, 4.67773, 1, 0, 0, 1, 1,
0.2377679, -0.9920978, 1.961156, 1, 0, 0, 1, 1,
0.2379907, -0.06928499, 1.555787, 0, 0, 0, 1, 1,
0.2453621, -0.06972367, 3.743195, 0, 0, 0, 1, 1,
0.2462438, -0.6262286, 4.215908, 0, 0, 0, 1, 1,
0.2496033, -0.7276313, 1.740707, 0, 0, 0, 1, 1,
0.2526135, 0.4730341, -1.505885, 0, 0, 0, 1, 1,
0.2622404, 0.204135, 0.6553714, 0, 0, 0, 1, 1,
0.2672457, 1.247239, 0.9187228, 0, 0, 0, 1, 1,
0.2718767, -1.37748, 3.443695, 1, 1, 1, 1, 1,
0.2800648, -0.01886704, 2.110033, 1, 1, 1, 1, 1,
0.2808432, -0.5497543, 4.926277, 1, 1, 1, 1, 1,
0.2842848, -0.01610899, 1.940868, 1, 1, 1, 1, 1,
0.2880897, 0.08110861, 2.057813, 1, 1, 1, 1, 1,
0.2962377, -1.160234, 3.995975, 1, 1, 1, 1, 1,
0.3026462, -0.006706492, 2.122168, 1, 1, 1, 1, 1,
0.3042675, 0.5037054, 0.78395, 1, 1, 1, 1, 1,
0.3044875, 1.082676, -0.3666413, 1, 1, 1, 1, 1,
0.3054892, -1.735082, 3.191494, 1, 1, 1, 1, 1,
0.3077466, -1.681822, 1.474087, 1, 1, 1, 1, 1,
0.309956, 0.9470964, 1.898385, 1, 1, 1, 1, 1,
0.3137174, -1.72026, 1.801848, 1, 1, 1, 1, 1,
0.3214607, 0.8558122, 1.927596, 1, 1, 1, 1, 1,
0.3222378, -1.706272, 1.626672, 1, 1, 1, 1, 1,
0.3230425, 0.1247426, 1.746815, 0, 0, 1, 1, 1,
0.32313, 1.719873, 0.5949886, 1, 0, 0, 1, 1,
0.3253212, -0.889756, 2.279625, 1, 0, 0, 1, 1,
0.3270103, -0.7878507, 4.528593, 1, 0, 0, 1, 1,
0.3270175, -0.3429765, 2.957151, 1, 0, 0, 1, 1,
0.3271506, 0.5770746, -1.045853, 1, 0, 0, 1, 1,
0.3274945, 0.9789307, 1.534595, 0, 0, 0, 1, 1,
0.3277709, 1.00486, 0.4154004, 0, 0, 0, 1, 1,
0.3301086, -0.7758237, 3.759151, 0, 0, 0, 1, 1,
0.332952, 1.352256, 0.8806421, 0, 0, 0, 1, 1,
0.3340734, 1.437999, 0.2280961, 0, 0, 0, 1, 1,
0.336605, 2.498851, -0.09549697, 0, 0, 0, 1, 1,
0.3366092, 0.4705647, 1.006968, 0, 0, 0, 1, 1,
0.3404188, -1.30782, 2.792013, 1, 1, 1, 1, 1,
0.3412982, 0.3829781, -0.7844843, 1, 1, 1, 1, 1,
0.3456512, -0.3045245, 1.473974, 1, 1, 1, 1, 1,
0.3466381, -0.2314396, 2.435464, 1, 1, 1, 1, 1,
0.3495219, -1.055466, 2.254605, 1, 1, 1, 1, 1,
0.349583, 1.496454, 0.4713965, 1, 1, 1, 1, 1,
0.3511401, 0.5623753, 0.8586749, 1, 1, 1, 1, 1,
0.3568038, -0.09382188, 3.842885, 1, 1, 1, 1, 1,
0.3580524, -0.4310975, 1.807673, 1, 1, 1, 1, 1,
0.3589219, -1.144407, 2.285335, 1, 1, 1, 1, 1,
0.3621891, -0.09571411, 1.854075, 1, 1, 1, 1, 1,
0.3652589, 0.2891099, 0.9831157, 1, 1, 1, 1, 1,
0.3658875, -1.182236, 2.365188, 1, 1, 1, 1, 1,
0.3672344, 0.2656274, 1.936673, 1, 1, 1, 1, 1,
0.3692214, 0.0541906, 1.733753, 1, 1, 1, 1, 1,
0.3694649, -0.4284911, 3.782758, 0, 0, 1, 1, 1,
0.3760789, -0.355149, -0.4662662, 1, 0, 0, 1, 1,
0.3790384, 0.8308215, 0.7431219, 1, 0, 0, 1, 1,
0.383604, 1.317023, -0.4068266, 1, 0, 0, 1, 1,
0.3869619, -0.83799, 3.469439, 1, 0, 0, 1, 1,
0.3938073, 1.235852, 0.04303027, 1, 0, 0, 1, 1,
0.3961277, 0.3756289, 1.134477, 0, 0, 0, 1, 1,
0.3964505, 0.5884321, 0.7823975, 0, 0, 0, 1, 1,
0.3970225, -0.2894439, 1.731902, 0, 0, 0, 1, 1,
0.4035886, 0.4674756, 0.927041, 0, 0, 0, 1, 1,
0.4048869, -2.10057, 2.451642, 0, 0, 0, 1, 1,
0.406119, -0.06937411, 0.9540927, 0, 0, 0, 1, 1,
0.4068218, 0.4996946, 0.572222, 0, 0, 0, 1, 1,
0.4075386, -1.373726, 1.414311, 1, 1, 1, 1, 1,
0.4105914, -0.8889965, 3.054373, 1, 1, 1, 1, 1,
0.4132923, -1.815081, 2.207895, 1, 1, 1, 1, 1,
0.414981, -0.4110697, 1.458324, 1, 1, 1, 1, 1,
0.4184723, 0.5176144, -1.095339, 1, 1, 1, 1, 1,
0.4185101, 1.11008, -0.03772154, 1, 1, 1, 1, 1,
0.418666, -0.198984, 0.137549, 1, 1, 1, 1, 1,
0.4260847, 0.01600174, 2.59781, 1, 1, 1, 1, 1,
0.4319595, -0.1428126, 0.1865906, 1, 1, 1, 1, 1,
0.4322725, -1.793319, 2.053608, 1, 1, 1, 1, 1,
0.4334724, -0.07881893, 1.772097, 1, 1, 1, 1, 1,
0.4351404, 0.1569686, 0.5323908, 1, 1, 1, 1, 1,
0.4368118, -0.4386096, 3.170317, 1, 1, 1, 1, 1,
0.4399644, 0.1315759, 3.268557, 1, 1, 1, 1, 1,
0.4437976, -1.579945, 4.226675, 1, 1, 1, 1, 1,
0.4441628, -3.26252, 2.922871, 0, 0, 1, 1, 1,
0.4454423, -0.166189, 1.18098, 1, 0, 0, 1, 1,
0.4494967, -0.8825694, 2.359976, 1, 0, 0, 1, 1,
0.4520552, 0.5593046, -0.221384, 1, 0, 0, 1, 1,
0.4533401, -0.3732549, 2.992142, 1, 0, 0, 1, 1,
0.4557059, -0.1631574, 1.881335, 1, 0, 0, 1, 1,
0.4582047, -1.12269, 3.02704, 0, 0, 0, 1, 1,
0.4587854, -0.7814686, 2.137912, 0, 0, 0, 1, 1,
0.4660574, -0.9271237, 2.619586, 0, 0, 0, 1, 1,
0.4685597, 1.357453, 1.227581, 0, 0, 0, 1, 1,
0.4702924, 0.2658828, -1.395627, 0, 0, 0, 1, 1,
0.4713051, 1.189304, -0.1194055, 0, 0, 0, 1, 1,
0.4744051, 0.05078962, 0.8929707, 0, 0, 0, 1, 1,
0.4766844, -0.1221741, 1.31561, 1, 1, 1, 1, 1,
0.4774689, -0.9132727, 3.659103, 1, 1, 1, 1, 1,
0.4781332, 0.3876376, 1.247024, 1, 1, 1, 1, 1,
0.4830237, 0.3839167, 0.06663786, 1, 1, 1, 1, 1,
0.4850938, 0.008573664, 0.5089929, 1, 1, 1, 1, 1,
0.4861723, -0.5434784, 3.834275, 1, 1, 1, 1, 1,
0.4911046, -0.2676036, 1.622822, 1, 1, 1, 1, 1,
0.4959919, 0.809367, 1.28765, 1, 1, 1, 1, 1,
0.4974527, -0.1526779, 1.27334, 1, 1, 1, 1, 1,
0.4986543, 0.2031752, 1.193256, 1, 1, 1, 1, 1,
0.4995183, 0.3422403, 0.3413273, 1, 1, 1, 1, 1,
0.4999378, -1.017222, 3.449769, 1, 1, 1, 1, 1,
0.5063143, -1.99421, 3.938978, 1, 1, 1, 1, 1,
0.5089658, -0.005613582, 1.745163, 1, 1, 1, 1, 1,
0.512234, -0.01989199, -0.51368, 1, 1, 1, 1, 1,
0.5136878, -0.7406307, 3.033328, 0, 0, 1, 1, 1,
0.514156, -0.5558735, 2.39432, 1, 0, 0, 1, 1,
0.5146517, 1.255862, 1.162199, 1, 0, 0, 1, 1,
0.5153893, 1.106221, 1.751119, 1, 0, 0, 1, 1,
0.5159033, 0.4011352, 1.657046, 1, 0, 0, 1, 1,
0.5185416, -0.04906102, 1.806706, 1, 0, 0, 1, 1,
0.522693, -1.170716, 3.736381, 0, 0, 0, 1, 1,
0.5240322, 0.003929335, 1.113173, 0, 0, 0, 1, 1,
0.5291769, -0.4624823, 1.379597, 0, 0, 0, 1, 1,
0.53213, 1.105969, -0.09741154, 0, 0, 0, 1, 1,
0.5371892, -1.451677, 3.289998, 0, 0, 0, 1, 1,
0.5420441, 0.3053379, 2.04566, 0, 0, 0, 1, 1,
0.5545706, 0.06737488, 2.21116, 0, 0, 0, 1, 1,
0.5566878, 1.118099, 0.3307954, 1, 1, 1, 1, 1,
0.5580193, -1.469877, 2.18081, 1, 1, 1, 1, 1,
0.5629933, 0.2689026, 2.266966, 1, 1, 1, 1, 1,
0.5658177, 1.354474, 2.354584, 1, 1, 1, 1, 1,
0.5729945, 2.474226, 0.3617426, 1, 1, 1, 1, 1,
0.5744606, 0.0532684, 2.731791, 1, 1, 1, 1, 1,
0.5765779, 1.929602, 2.115972, 1, 1, 1, 1, 1,
0.5775176, -1.281469, 2.96231, 1, 1, 1, 1, 1,
0.579597, 0.4676532, 0.9239755, 1, 1, 1, 1, 1,
0.5797491, 0.2497312, 1.804489, 1, 1, 1, 1, 1,
0.5816672, 0.5057164, 2.178593, 1, 1, 1, 1, 1,
0.5830479, 0.2665797, 1.193143, 1, 1, 1, 1, 1,
0.585756, 0.8049598, 3.8922, 1, 1, 1, 1, 1,
0.588718, 0.1092863, 0.9881, 1, 1, 1, 1, 1,
0.5914347, -0.5724525, 2.608608, 1, 1, 1, 1, 1,
0.5918134, 0.0789858, -0.3757147, 0, 0, 1, 1, 1,
0.5938861, -1.423978, 3.439731, 1, 0, 0, 1, 1,
0.5951785, 0.4457263, 0.9548976, 1, 0, 0, 1, 1,
0.595621, -2.484014, 2.045251, 1, 0, 0, 1, 1,
0.6005042, -0.9970335, 3.613694, 1, 0, 0, 1, 1,
0.601011, -0.3218285, 2.513802, 1, 0, 0, 1, 1,
0.6012242, 1.83175, -1.067069, 0, 0, 0, 1, 1,
0.6021258, 2.090545, -0.3987682, 0, 0, 0, 1, 1,
0.6046493, 0.5183102, 0.4993573, 0, 0, 0, 1, 1,
0.605852, -0.7089917, 0.5512186, 0, 0, 0, 1, 1,
0.6081495, -0.1514301, 1.308768, 0, 0, 0, 1, 1,
0.6087263, 0.1031855, 2.195944, 0, 0, 0, 1, 1,
0.6140491, -0.6415442, 2.328048, 0, 0, 0, 1, 1,
0.6176535, -0.06141839, 1.146563, 1, 1, 1, 1, 1,
0.6209494, -1.218501, 2.927622, 1, 1, 1, 1, 1,
0.6225466, -0.4369203, 3.159562, 1, 1, 1, 1, 1,
0.6250648, -0.1969406, 0.9176095, 1, 1, 1, 1, 1,
0.6274894, 0.2964055, 1.728807, 1, 1, 1, 1, 1,
0.6346642, -1.407953, 2.064234, 1, 1, 1, 1, 1,
0.6374153, -0.2079873, -0.2099249, 1, 1, 1, 1, 1,
0.6382527, 0.3081305, 0.1754582, 1, 1, 1, 1, 1,
0.639776, -0.8765339, 1.740471, 1, 1, 1, 1, 1,
0.6403196, 0.662444, 0.5389991, 1, 1, 1, 1, 1,
0.6429121, 0.1922505, 0.00113277, 1, 1, 1, 1, 1,
0.645347, 1.148338, -0.1929494, 1, 1, 1, 1, 1,
0.6502131, 0.9575165, 1.676522, 1, 1, 1, 1, 1,
0.6510983, 0.656745, 1.072516, 1, 1, 1, 1, 1,
0.6527418, 1.208294, -0.02519411, 1, 1, 1, 1, 1,
0.6548977, 0.05518586, 1.896759, 0, 0, 1, 1, 1,
0.656702, 0.2616487, 0.2277966, 1, 0, 0, 1, 1,
0.6631139, -0.120291, 2.379996, 1, 0, 0, 1, 1,
0.6669866, 0.6737744, 0.6806018, 1, 0, 0, 1, 1,
0.6694713, -0.8769252, 2.722988, 1, 0, 0, 1, 1,
0.6734532, -0.2712618, 2.075178, 1, 0, 0, 1, 1,
0.6742633, 1.30881, 0.6349292, 0, 0, 0, 1, 1,
0.6763082, 0.6566131, -0.2547145, 0, 0, 0, 1, 1,
0.6836487, -1.341379, 2.154858, 0, 0, 0, 1, 1,
0.6847284, 0.854874, -1.110293, 0, 0, 0, 1, 1,
0.6873318, -1.174688, 2.330792, 0, 0, 0, 1, 1,
0.6876858, 0.1270443, 2.691739, 0, 0, 0, 1, 1,
0.6889095, 1.603753, 0.01356911, 0, 0, 0, 1, 1,
0.6901349, 1.122772, 0.7224646, 1, 1, 1, 1, 1,
0.7056744, 0.3997868, 0.1673805, 1, 1, 1, 1, 1,
0.7126172, -0.07458393, 1.199368, 1, 1, 1, 1, 1,
0.7152904, 0.396704, 1.21065, 1, 1, 1, 1, 1,
0.7169765, 0.04702693, 2.931773, 1, 1, 1, 1, 1,
0.718444, -0.270286, 2.147717, 1, 1, 1, 1, 1,
0.7192257, 0.2937801, 1.197729, 1, 1, 1, 1, 1,
0.7197784, 0.4450042, 1.801088, 1, 1, 1, 1, 1,
0.724943, -0.5790226, 2.553128, 1, 1, 1, 1, 1,
0.7294325, -0.2636968, 1.799037, 1, 1, 1, 1, 1,
0.7331363, -1.393154, 2.066794, 1, 1, 1, 1, 1,
0.7343809, 1.00634, 2.069347, 1, 1, 1, 1, 1,
0.7422568, 1.023407, 0.0441106, 1, 1, 1, 1, 1,
0.7508571, -0.3012901, 1.412398, 1, 1, 1, 1, 1,
0.753176, -1.506659, 2.950664, 1, 1, 1, 1, 1,
0.7619893, -0.622025, 1.419823, 0, 0, 1, 1, 1,
0.7630854, 1.239743, 0.6995285, 1, 0, 0, 1, 1,
0.7663965, -0.2012466, 3.190713, 1, 0, 0, 1, 1,
0.7681388, 1.427061, 1.599549, 1, 0, 0, 1, 1,
0.7748014, -1.693478, 3.386126, 1, 0, 0, 1, 1,
0.775919, -0.9058893, 1.531344, 1, 0, 0, 1, 1,
0.7760925, -1.958645, 0.06776537, 0, 0, 0, 1, 1,
0.7778933, 2.335495, 0.3297185, 0, 0, 0, 1, 1,
0.7805085, -0.5083169, 2.139085, 0, 0, 0, 1, 1,
0.7924205, -0.3246392, 2.6201, 0, 0, 0, 1, 1,
0.8063961, 1.481054, 0.7525219, 0, 0, 0, 1, 1,
0.8085505, -1.46443, 3.567041, 0, 0, 0, 1, 1,
0.8249763, -0.7789215, 4.061199, 0, 0, 0, 1, 1,
0.8281752, -1.814141, 4.347949, 1, 1, 1, 1, 1,
0.8296105, -0.9744573, 2.367734, 1, 1, 1, 1, 1,
0.8307008, -0.3387464, 2.526711, 1, 1, 1, 1, 1,
0.8336495, -1.306443, 3.714235, 1, 1, 1, 1, 1,
0.8337048, -0.0507873, 2.222243, 1, 1, 1, 1, 1,
0.8338662, -1.048342, 2.782125, 1, 1, 1, 1, 1,
0.8352561, 0.8923504, 0.8514932, 1, 1, 1, 1, 1,
0.8381355, 2.101901, -0.7092173, 1, 1, 1, 1, 1,
0.8404207, -0.3330806, 2.780512, 1, 1, 1, 1, 1,
0.8426649, 0.2852534, 2.240424, 1, 1, 1, 1, 1,
0.845535, 1.489113, -0.2026969, 1, 1, 1, 1, 1,
0.8471938, -1.304467, 1.694874, 1, 1, 1, 1, 1,
0.8484712, -2.117676, 0.6552155, 1, 1, 1, 1, 1,
0.8523601, -0.03561399, 3.783165, 1, 1, 1, 1, 1,
0.8552943, 0.1116064, 1.23659, 1, 1, 1, 1, 1,
0.8587779, 0.6633482, -0.1998637, 0, 0, 1, 1, 1,
0.8652892, 1.256705, 1.419397, 1, 0, 0, 1, 1,
0.8711879, 0.7987923, 0.5758869, 1, 0, 0, 1, 1,
0.8730147, 0.6047601, 3.475065, 1, 0, 0, 1, 1,
0.8752009, 0.03951027, -0.8058145, 1, 0, 0, 1, 1,
0.8790056, -0.1594945, 0.8065798, 1, 0, 0, 1, 1,
0.8800189, 0.7715095, -0.07528123, 0, 0, 0, 1, 1,
0.8846654, 0.5218847, 0.2108348, 0, 0, 0, 1, 1,
0.8882396, 0.0732294, 2.842605, 0, 0, 0, 1, 1,
0.8982635, -0.06682561, 3.43672, 0, 0, 0, 1, 1,
0.9002216, -0.3145675, 1.267328, 0, 0, 0, 1, 1,
0.907747, -0.002945432, 1.684587, 0, 0, 0, 1, 1,
0.9089405, 0.9076716, 2.751812, 0, 0, 0, 1, 1,
0.9111952, -0.6698435, 0.6847969, 1, 1, 1, 1, 1,
0.9201043, -0.1331033, 1.950564, 1, 1, 1, 1, 1,
0.9272321, 0.3095701, 1.805626, 1, 1, 1, 1, 1,
0.9331472, -0.2215346, 2.089394, 1, 1, 1, 1, 1,
0.9331893, 0.3333438, 1.353505, 1, 1, 1, 1, 1,
0.9334098, -0.5003184, 0.529613, 1, 1, 1, 1, 1,
0.9374081, 0.4191249, 2.016472, 1, 1, 1, 1, 1,
0.9447009, -0.5392323, 1.626598, 1, 1, 1, 1, 1,
0.9491932, -0.9163975, 1.987888, 1, 1, 1, 1, 1,
0.9533051, -0.7958944, 2.443945, 1, 1, 1, 1, 1,
0.9578321, -1.283649, 2.916012, 1, 1, 1, 1, 1,
0.9580293, 0.7481446, -0.5287009, 1, 1, 1, 1, 1,
0.9598832, 1.09422, -1.380219, 1, 1, 1, 1, 1,
0.9619896, 0.3952012, 1.035174, 1, 1, 1, 1, 1,
0.9641033, 0.17373, 0.6385727, 1, 1, 1, 1, 1,
0.9683845, 0.5614143, 2.130584, 0, 0, 1, 1, 1,
0.969615, -0.8269578, 2.592331, 1, 0, 0, 1, 1,
0.9713354, -1.067935, 1.747258, 1, 0, 0, 1, 1,
0.9874571, 0.3760176, 1.446662, 1, 0, 0, 1, 1,
0.9888815, 0.1000708, 2.245677, 1, 0, 0, 1, 1,
0.9912869, -0.6980777, 3.458531, 1, 0, 0, 1, 1,
0.9924589, -0.07271618, 3.183101, 0, 0, 0, 1, 1,
0.9928331, -1.29343, 3.090747, 0, 0, 0, 1, 1,
0.9942221, -1.126117, 3.730671, 0, 0, 0, 1, 1,
0.9963897, 2.265363, 1.444066, 0, 0, 0, 1, 1,
0.9965547, -1.458784, 1.199695, 0, 0, 0, 1, 1,
0.9996299, -0.5388697, 1.954781, 0, 0, 0, 1, 1,
1.000862, 0.1881501, 2.432708, 0, 0, 0, 1, 1,
1.001444, 1.840628, 1.889503, 1, 1, 1, 1, 1,
1.002776, 0.09401736, 0.399003, 1, 1, 1, 1, 1,
1.004373, -1.693923, 3.572158, 1, 1, 1, 1, 1,
1.013379, -0.9502761, 2.324791, 1, 1, 1, 1, 1,
1.014292, 0.4507006, 0.9869697, 1, 1, 1, 1, 1,
1.022412, 0.7526059, 1.776204, 1, 1, 1, 1, 1,
1.02396, -0.6704583, 1.098529, 1, 1, 1, 1, 1,
1.026548, -1.020651, 1.463625, 1, 1, 1, 1, 1,
1.026676, -0.389033, 2.11648, 1, 1, 1, 1, 1,
1.02751, 0.4083155, 1.978103, 1, 1, 1, 1, 1,
1.033513, 0.02497556, 3.171007, 1, 1, 1, 1, 1,
1.035299, -0.3804528, 2.578616, 1, 1, 1, 1, 1,
1.038629, 1.439231, 1.595403, 1, 1, 1, 1, 1,
1.038694, -0.2770903, 0.6139255, 1, 1, 1, 1, 1,
1.041221, 0.2063053, 2.214771, 1, 1, 1, 1, 1,
1.045537, -0.6963087, 2.42125, 0, 0, 1, 1, 1,
1.047206, 0.2722233, 2.120227, 1, 0, 0, 1, 1,
1.049439, 0.6695587, 0.02424083, 1, 0, 0, 1, 1,
1.053981, 0.2317897, 2.767592, 1, 0, 0, 1, 1,
1.072752, 1.741522, -0.03736672, 1, 0, 0, 1, 1,
1.075595, -0.8049853, 3.079661, 1, 0, 0, 1, 1,
1.076675, -0.863629, 1.973201, 0, 0, 0, 1, 1,
1.078026, 0.06492249, 0.4080851, 0, 0, 0, 1, 1,
1.078796, -1.600325, 2.618526, 0, 0, 0, 1, 1,
1.079599, 0.2071608, 1.544982, 0, 0, 0, 1, 1,
1.08033, 0.615878, 0.1259685, 0, 0, 0, 1, 1,
1.084409, 1.329952, 2.213443, 0, 0, 0, 1, 1,
1.090644, 1.215268, 0.6976207, 0, 0, 0, 1, 1,
1.095006, -0.2532641, 0.9747298, 1, 1, 1, 1, 1,
1.102309, 0.5032598, 1.136944, 1, 1, 1, 1, 1,
1.105512, -0.8696482, 3.513827, 1, 1, 1, 1, 1,
1.108108, 0.2654116, 1.937424, 1, 1, 1, 1, 1,
1.122541, -0.1052365, 1.378853, 1, 1, 1, 1, 1,
1.123927, 0.7193173, 0.8772233, 1, 1, 1, 1, 1,
1.125113, -1.366187, 1.834288, 1, 1, 1, 1, 1,
1.131322, -0.2590252, 1.412262, 1, 1, 1, 1, 1,
1.138337, -0.2880419, 2.633661, 1, 1, 1, 1, 1,
1.138901, 0.822443, 0.641978, 1, 1, 1, 1, 1,
1.145367, 0.5981783, 0.2272654, 1, 1, 1, 1, 1,
1.148643, -0.5368503, 2.829813, 1, 1, 1, 1, 1,
1.148782, -0.9590188, 0.6817045, 1, 1, 1, 1, 1,
1.150316, 0.3154706, 2.271761, 1, 1, 1, 1, 1,
1.150716, 0.210715, 1.964082, 1, 1, 1, 1, 1,
1.153446, 1.363819, 0.6022612, 0, 0, 1, 1, 1,
1.155897, -0.1837584, -0.06887531, 1, 0, 0, 1, 1,
1.16032, 0.5163063, 1.713494, 1, 0, 0, 1, 1,
1.161604, -0.1373101, 1.202362, 1, 0, 0, 1, 1,
1.163617, -1.787192, 3.254771, 1, 0, 0, 1, 1,
1.166507, -1.066879, 2.417554, 1, 0, 0, 1, 1,
1.172062, 0.4247012, 1.945256, 0, 0, 0, 1, 1,
1.173318, -0.2443776, 2.816487, 0, 0, 0, 1, 1,
1.175246, 0.7207758, 0.5609688, 0, 0, 0, 1, 1,
1.176247, -1.180965, 2.559701, 0, 0, 0, 1, 1,
1.176981, -0.6303536, 0.9588296, 0, 0, 0, 1, 1,
1.180004, 0.8758081, 1.448163, 0, 0, 0, 1, 1,
1.184511, 0.9559225, 1.491931, 0, 0, 0, 1, 1,
1.216933, 0.2098176, 1.682177, 1, 1, 1, 1, 1,
1.21753, 0.1451107, 2.837707, 1, 1, 1, 1, 1,
1.218024, 1.244307, 2.211154, 1, 1, 1, 1, 1,
1.22023, 0.5072179, -0.669824, 1, 1, 1, 1, 1,
1.229199, 1.390467, 0.6753187, 1, 1, 1, 1, 1,
1.232232, 0.5713095, 1.306655, 1, 1, 1, 1, 1,
1.233477, -0.6315001, -0.01375644, 1, 1, 1, 1, 1,
1.237618, -0.6154763, 0.9145581, 1, 1, 1, 1, 1,
1.239071, 1.215713, 1.696212, 1, 1, 1, 1, 1,
1.252653, -1.120357, 3.272527, 1, 1, 1, 1, 1,
1.253457, 0.4003773, 0.1063222, 1, 1, 1, 1, 1,
1.254953, 0.982115, -0.1766814, 1, 1, 1, 1, 1,
1.258162, 2.137168, 0.9469677, 1, 1, 1, 1, 1,
1.261666, -0.1502109, 3.489821, 1, 1, 1, 1, 1,
1.277338, -0.1383292, -0.4968512, 1, 1, 1, 1, 1,
1.281929, -0.5447186, 1.469248, 0, 0, 1, 1, 1,
1.285237, 1.502068, 0.2425512, 1, 0, 0, 1, 1,
1.28651, -0.6292905, 0.4801717, 1, 0, 0, 1, 1,
1.286621, 2.301649, 0.7597634, 1, 0, 0, 1, 1,
1.290531, -0.7503836, 2.827872, 1, 0, 0, 1, 1,
1.291494, 0.8543468, 0.6764323, 1, 0, 0, 1, 1,
1.294072, 1.364534, 1.128914, 0, 0, 0, 1, 1,
1.303944, 1.810552, -0.6091735, 0, 0, 0, 1, 1,
1.307524, -0.4636061, 1.907782, 0, 0, 0, 1, 1,
1.308373, 0.252685, 0.4564352, 0, 0, 0, 1, 1,
1.312254, -0.2948734, 1.430087, 0, 0, 0, 1, 1,
1.313572, -0.3243758, 0.6099671, 0, 0, 0, 1, 1,
1.31655, -0.1964119, 2.672491, 0, 0, 0, 1, 1,
1.330679, 2.763451, -0.6276051, 1, 1, 1, 1, 1,
1.336935, -1.465221, 3.541117, 1, 1, 1, 1, 1,
1.339663, 0.4238681, 2.384039, 1, 1, 1, 1, 1,
1.343029, -1.502475, 4.280879, 1, 1, 1, 1, 1,
1.346402, 2.464766, -2.014421, 1, 1, 1, 1, 1,
1.354351, -0.07199004, 1.404332, 1, 1, 1, 1, 1,
1.354966, -0.8391339, 1.52346, 1, 1, 1, 1, 1,
1.365037, 3.330767, 1.299031, 1, 1, 1, 1, 1,
1.365966, -0.8238612, 2.301404, 1, 1, 1, 1, 1,
1.373767, 0.9919689, -0.1564516, 1, 1, 1, 1, 1,
1.380623, 0.1104998, 1.964378, 1, 1, 1, 1, 1,
1.382312, -0.9002281, 1.334491, 1, 1, 1, 1, 1,
1.39925, -0.5012887, 3.160089, 1, 1, 1, 1, 1,
1.406981, 0.397922, 0.7693802, 1, 1, 1, 1, 1,
1.417965, -1.121274, 0.02279588, 1, 1, 1, 1, 1,
1.42575, 0.51065, 0.511946, 0, 0, 1, 1, 1,
1.435723, -0.6216522, 1.406288, 1, 0, 0, 1, 1,
1.453146, 0.8629808, 0.3125442, 1, 0, 0, 1, 1,
1.45969, 0.4406585, 1.898922, 1, 0, 0, 1, 1,
1.483466, 0.6901836, 0.9267635, 1, 0, 0, 1, 1,
1.483862, 1.1371, 1.654951, 1, 0, 0, 1, 1,
1.486162, 0.9208722, 1.187483, 0, 0, 0, 1, 1,
1.486761, 0.03759483, 0.9139245, 0, 0, 0, 1, 1,
1.492418, -0.05119242, 1.610625, 0, 0, 0, 1, 1,
1.506887, 0.8592526, 0.3685576, 0, 0, 0, 1, 1,
1.512894, -0.337598, 0.2238282, 0, 0, 0, 1, 1,
1.518521, -1.577944, 4.10829, 0, 0, 0, 1, 1,
1.521621, 0.9189462, 1.595743, 0, 0, 0, 1, 1,
1.522665, 1.360639, 1.935715, 1, 1, 1, 1, 1,
1.525845, 0.02535412, 0.4559102, 1, 1, 1, 1, 1,
1.542676, 1.576331, -0.05595669, 1, 1, 1, 1, 1,
1.549824, -0.02444158, 0.3210065, 1, 1, 1, 1, 1,
1.553296, -0.4240427, 1.895443, 1, 1, 1, 1, 1,
1.554374, -0.06912752, 2.49624, 1, 1, 1, 1, 1,
1.557649, -2.032763, 1.786349, 1, 1, 1, 1, 1,
1.559785, -2.25821, 2.414025, 1, 1, 1, 1, 1,
1.573166, 1.529355, 0.8372257, 1, 1, 1, 1, 1,
1.573976, -0.3990742, 2.414079, 1, 1, 1, 1, 1,
1.586131, -0.1357697, 0.8292285, 1, 1, 1, 1, 1,
1.604102, 0.3345526, 3.023151, 1, 1, 1, 1, 1,
1.613024, 0.01720935, 2.149989, 1, 1, 1, 1, 1,
1.616941, 0.9688314, 1.447873, 1, 1, 1, 1, 1,
1.62288, 1.746772, -0.003635766, 1, 1, 1, 1, 1,
1.636217, -1.600002, 0.5264229, 0, 0, 1, 1, 1,
1.64867, 1.827831, 0.2633814, 1, 0, 0, 1, 1,
1.671743, -0.357545, 0.8644546, 1, 0, 0, 1, 1,
1.688659, -0.3154275, 1.780862, 1, 0, 0, 1, 1,
1.701397, 1.284993, 1.357706, 1, 0, 0, 1, 1,
1.703415, -0.9850401, 1.373989, 1, 0, 0, 1, 1,
1.718421, -0.642066, 0.971736, 0, 0, 0, 1, 1,
1.718721, 0.726133, 1.193822, 0, 0, 0, 1, 1,
1.720979, -0.8517481, 3.54159, 0, 0, 0, 1, 1,
1.726398, -0.7261097, 2.312509, 0, 0, 0, 1, 1,
1.736667, -0.4637585, 1.452627, 0, 0, 0, 1, 1,
1.755011, 0.7736101, 1.287048, 0, 0, 0, 1, 1,
1.768785, -0.8917134, 3.047203, 0, 0, 0, 1, 1,
1.777344, -0.4642706, 3.413715, 1, 1, 1, 1, 1,
1.80381, 0.5172505, 1.341573, 1, 1, 1, 1, 1,
1.847566, -0.1893436, 2.00257, 1, 1, 1, 1, 1,
1.881571, -0.2750037, 1.485593, 1, 1, 1, 1, 1,
1.88833, 0.1589971, -0.2263891, 1, 1, 1, 1, 1,
1.927595, -0.08294068, 1.164275, 1, 1, 1, 1, 1,
1.941306, 1.323534, 1.455393, 1, 1, 1, 1, 1,
1.95342, 0.4670103, 0.6451008, 1, 1, 1, 1, 1,
1.953609, -1.814457, 2.013328, 1, 1, 1, 1, 1,
1.99109, -0.4409615, 1.452797, 1, 1, 1, 1, 1,
2.020071, -0.7811599, 2.538235, 1, 1, 1, 1, 1,
2.028758, -0.08419592, 1.299088, 1, 1, 1, 1, 1,
2.059319, -1.001997, 1.942341, 1, 1, 1, 1, 1,
2.065104, 0.5645779, 1.63288, 1, 1, 1, 1, 1,
2.072857, -1.182873, 4.152883, 1, 1, 1, 1, 1,
2.076676, 0.4466477, 3.059434, 0, 0, 1, 1, 1,
2.151685, 1.593021, -0.655522, 1, 0, 0, 1, 1,
2.156497, -0.6867961, 1.925156, 1, 0, 0, 1, 1,
2.159327, -0.9134644, 1.07133, 1, 0, 0, 1, 1,
2.175328, 0.1235472, 1.229747, 1, 0, 0, 1, 1,
2.190262, 0.1933212, 0.872079, 1, 0, 0, 1, 1,
2.208051, -0.8759314, 0.6149109, 0, 0, 0, 1, 1,
2.221978, -0.5521697, 1.568392, 0, 0, 0, 1, 1,
2.249274, -0.3297491, 0.9148832, 0, 0, 0, 1, 1,
2.266581, -1.257254, -0.1280701, 0, 0, 0, 1, 1,
2.345695, 0.1243462, 2.088494, 0, 0, 0, 1, 1,
2.347363, -0.01037263, 1.331117, 0, 0, 0, 1, 1,
2.350487, 1.306868, 0.9193287, 0, 0, 0, 1, 1,
2.385266, -2.28217, 2.334219, 1, 1, 1, 1, 1,
2.457766, -1.618972, 2.093588, 1, 1, 1, 1, 1,
2.468424, -0.6673716, 1.151615, 1, 1, 1, 1, 1,
2.601029, -0.5500742, 2.287835, 1, 1, 1, 1, 1,
2.741169, 0.5772347, 1.305191, 1, 1, 1, 1, 1,
2.955058, 1.440178, 1.500179, 1, 1, 1, 1, 1,
3.236308, 2.494192, 2.62003, 1, 1, 1, 1, 1
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
var radius = 9.481707;
var distance = 33.30409;
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
mvMatrix.translate( 0.3232775, -0.03412366, -0.06404448 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.30409);
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
