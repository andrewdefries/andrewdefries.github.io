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
-2.747272, 1.001594, -2.679654, 1, 0, 0, 1,
-2.693263, 1.23598, -1.489492, 1, 0.007843138, 0, 1,
-2.673429, -1.967204, -1.054683, 1, 0.01176471, 0, 1,
-2.624059, -0.6597912, -0.9882348, 1, 0.01960784, 0, 1,
-2.512038, 1.264187, -1.187334, 1, 0.02352941, 0, 1,
-2.473252, -0.7245786, -3.948985, 1, 0.03137255, 0, 1,
-2.449086, -0.01243495, -1.993284, 1, 0.03529412, 0, 1,
-2.445149, 0.1266747, -1.183904, 1, 0.04313726, 0, 1,
-2.395746, -1.493898, -1.367532, 1, 0.04705882, 0, 1,
-2.381414, 0.3252616, 2.24515, 1, 0.05490196, 0, 1,
-2.312408, 0.5142393, -3.169585, 1, 0.05882353, 0, 1,
-2.179152, 0.247945, -2.494842, 1, 0.06666667, 0, 1,
-2.177454, -0.3386052, -1.571774, 1, 0.07058824, 0, 1,
-2.154096, -0.1505512, -3.053257, 1, 0.07843138, 0, 1,
-2.122674, -1.640128, -1.776032, 1, 0.08235294, 0, 1,
-2.120883, 1.414141, -1.27609, 1, 0.09019608, 0, 1,
-2.109391, -1.389233, -3.262973, 1, 0.09411765, 0, 1,
-2.061383, -0.1615985, -0.6290503, 1, 0.1019608, 0, 1,
-2.048457, -0.4927703, -0.7876022, 1, 0.1098039, 0, 1,
-2.044549, 0.5266467, -2.467209, 1, 0.1137255, 0, 1,
-2.017616, 1.284759, -1.352962, 1, 0.1215686, 0, 1,
-2.003553, -0.03439567, -1.414518, 1, 0.1254902, 0, 1,
-1.985746, -1.104114, 0.04931869, 1, 0.1333333, 0, 1,
-1.983082, -1.359841, -1.405702, 1, 0.1372549, 0, 1,
-1.978941, 0.3511543, -2.079242, 1, 0.145098, 0, 1,
-1.847716, -1.308497, -2.092629, 1, 0.1490196, 0, 1,
-1.785522, 0.5035411, -1.59625, 1, 0.1568628, 0, 1,
-1.783833, -0.07739212, -1.945138, 1, 0.1607843, 0, 1,
-1.776096, -1.384376, -4.081169, 1, 0.1686275, 0, 1,
-1.766592, 1.088578, -1.068406, 1, 0.172549, 0, 1,
-1.744069, -1.363337, -3.559968, 1, 0.1803922, 0, 1,
-1.693238, -1.225353, -0.1066884, 1, 0.1843137, 0, 1,
-1.674915, -0.2411052, -1.133687, 1, 0.1921569, 0, 1,
-1.662215, -0.09356257, 0.1748653, 1, 0.1960784, 0, 1,
-1.662212, 0.2257712, -1.626438, 1, 0.2039216, 0, 1,
-1.633477, 1.065868, -0.6884385, 1, 0.2117647, 0, 1,
-1.62732, -1.997902, -1.906012, 1, 0.2156863, 0, 1,
-1.611692, -0.1199203, -1.226954, 1, 0.2235294, 0, 1,
-1.605143, -0.005065143, -2.111149, 1, 0.227451, 0, 1,
-1.597959, -0.1968598, -1.377068, 1, 0.2352941, 0, 1,
-1.59035, 0.04301835, 0.02283344, 1, 0.2392157, 0, 1,
-1.579942, 0.8072415, -1.71176, 1, 0.2470588, 0, 1,
-1.570693, 0.7960435, -0.4054757, 1, 0.2509804, 0, 1,
-1.565333, -1.04535, -2.263604, 1, 0.2588235, 0, 1,
-1.557834, -0.402179, -1.059871, 1, 0.2627451, 0, 1,
-1.551664, 0.6039044, -2.112393, 1, 0.2705882, 0, 1,
-1.54873, -1.022725, -2.891626, 1, 0.2745098, 0, 1,
-1.524227, -1.011585, -2.23619, 1, 0.282353, 0, 1,
-1.52055, 0.5424009, -1.57707, 1, 0.2862745, 0, 1,
-1.511499, -0.4646645, -1.444637, 1, 0.2941177, 0, 1,
-1.492363, 0.8859156, -1.505258, 1, 0.3019608, 0, 1,
-1.487647, -0.3525559, -0.7690926, 1, 0.3058824, 0, 1,
-1.485897, 1.104687, -0.3829077, 1, 0.3137255, 0, 1,
-1.473181, -1.587367, -3.708977, 1, 0.3176471, 0, 1,
-1.459178, -1.091733, -0.747093, 1, 0.3254902, 0, 1,
-1.458773, -0.7039796, -1.311345, 1, 0.3294118, 0, 1,
-1.451627, 1.115095, -1.637818, 1, 0.3372549, 0, 1,
-1.450062, 0.4372871, -1.584863, 1, 0.3411765, 0, 1,
-1.448293, 1.54566, -0.08100124, 1, 0.3490196, 0, 1,
-1.447747, 1.207088, -0.8804403, 1, 0.3529412, 0, 1,
-1.432606, 0.7545065, -2.636798, 1, 0.3607843, 0, 1,
-1.416128, -0.2574421, -1.373421, 1, 0.3647059, 0, 1,
-1.411584, 0.5107006, 0.8918968, 1, 0.372549, 0, 1,
-1.408052, 1.671322, -1.277128, 1, 0.3764706, 0, 1,
-1.404667, -1.36311, -2.731801, 1, 0.3843137, 0, 1,
-1.397504, -0.5825456, -2.371352, 1, 0.3882353, 0, 1,
-1.392274, -1.2218, -2.432467, 1, 0.3960784, 0, 1,
-1.389679, 0.7814296, -1.069583, 1, 0.4039216, 0, 1,
-1.38032, 0.7127568, -1.197122, 1, 0.4078431, 0, 1,
-1.377375, -0.3434823, -0.6099924, 1, 0.4156863, 0, 1,
-1.376588, 1.606166, -1.960695, 1, 0.4196078, 0, 1,
-1.361513, 0.3924817, -0.8886368, 1, 0.427451, 0, 1,
-1.353842, -1.239073, -2.90101, 1, 0.4313726, 0, 1,
-1.345489, -0.5420741, -1.645482, 1, 0.4392157, 0, 1,
-1.342558, -0.4267077, -3.047717, 1, 0.4431373, 0, 1,
-1.340807, -0.7984878, -2.898257, 1, 0.4509804, 0, 1,
-1.335247, 0.4858378, -0.1991275, 1, 0.454902, 0, 1,
-1.327673, 0.6005936, -1.483128, 1, 0.4627451, 0, 1,
-1.327547, 1.241771, -1.122927, 1, 0.4666667, 0, 1,
-1.315722, -1.387217, -1.337551, 1, 0.4745098, 0, 1,
-1.308884, 0.4014708, -0.08971043, 1, 0.4784314, 0, 1,
-1.30757, 0.8017923, 0.7790011, 1, 0.4862745, 0, 1,
-1.294289, 0.1300188, -1.607833, 1, 0.4901961, 0, 1,
-1.292375, 0.672843, -2.92064, 1, 0.4980392, 0, 1,
-1.292206, -0.4888858, -2.911709, 1, 0.5058824, 0, 1,
-1.28346, 0.6718886, 0.4470198, 1, 0.509804, 0, 1,
-1.28229, 1.444883, -0.1975783, 1, 0.5176471, 0, 1,
-1.281951, -0.2045646, -0.1309025, 1, 0.5215687, 0, 1,
-1.281617, -1.475238, -0.6565419, 1, 0.5294118, 0, 1,
-1.280902, -0.05130313, -1.468277, 1, 0.5333334, 0, 1,
-1.279969, 1.908456, 0.3617148, 1, 0.5411765, 0, 1,
-1.279597, 0.3323387, -1.086986, 1, 0.5450981, 0, 1,
-1.275448, 0.5620146, -1.264477, 1, 0.5529412, 0, 1,
-1.25727, -0.2671767, -2.144459, 1, 0.5568628, 0, 1,
-1.256516, -2.417693, -2.085583, 1, 0.5647059, 0, 1,
-1.255159, 0.08076305, -1.250626, 1, 0.5686275, 0, 1,
-1.25006, -0.2530298, -1.52561, 1, 0.5764706, 0, 1,
-1.245016, -1.327247, -2.817102, 1, 0.5803922, 0, 1,
-1.240103, 0.7406681, -1.457756, 1, 0.5882353, 0, 1,
-1.236449, -0.1200617, -0.4862352, 1, 0.5921569, 0, 1,
-1.23593, 0.5109848, -1.023978, 1, 0.6, 0, 1,
-1.231755, -0.09640539, -1.474135, 1, 0.6078432, 0, 1,
-1.229891, 1.460061, -0.1616331, 1, 0.6117647, 0, 1,
-1.228385, -0.3976501, -0.2106282, 1, 0.6196079, 0, 1,
-1.227721, -1.724624, -2.293504, 1, 0.6235294, 0, 1,
-1.224222, -0.3472129, -3.207044, 1, 0.6313726, 0, 1,
-1.221879, -0.3921652, -1.424262, 1, 0.6352941, 0, 1,
-1.217258, -1.091551, -2.402324, 1, 0.6431373, 0, 1,
-1.217216, 1.149057, -0.01687562, 1, 0.6470588, 0, 1,
-1.215913, -0.7738562, -2.594846, 1, 0.654902, 0, 1,
-1.210111, 1.098314, -0.2714724, 1, 0.6588235, 0, 1,
-1.209366, 0.07175856, -1.566769, 1, 0.6666667, 0, 1,
-1.208828, 0.6283858, -0.8399292, 1, 0.6705883, 0, 1,
-1.207539, 0.4496354, -0.8547493, 1, 0.6784314, 0, 1,
-1.203158, -0.4461873, -2.085944, 1, 0.682353, 0, 1,
-1.19556, 1.156478, -2.955092, 1, 0.6901961, 0, 1,
-1.191836, -0.9480783, -2.901862, 1, 0.6941177, 0, 1,
-1.19072, 1.415675, 1.07162, 1, 0.7019608, 0, 1,
-1.188213, -0.3906798, -3.173149, 1, 0.7098039, 0, 1,
-1.185506, 0.2054859, -2.069592, 1, 0.7137255, 0, 1,
-1.184234, 0.9395548, -3.013494, 1, 0.7215686, 0, 1,
-1.182999, 2.342785, -0.8018961, 1, 0.7254902, 0, 1,
-1.180003, -1.042725, -0.4276827, 1, 0.7333333, 0, 1,
-1.173521, -1.194887, -3.512377, 1, 0.7372549, 0, 1,
-1.166113, 0.6174645, -0.8087536, 1, 0.7450981, 0, 1,
-1.157902, 0.9398353, -0.431085, 1, 0.7490196, 0, 1,
-1.15554, 0.8430182, -2.361796, 1, 0.7568628, 0, 1,
-1.145603, 0.5249949, -0.630105, 1, 0.7607843, 0, 1,
-1.131623, 0.01138842, -1.939443, 1, 0.7686275, 0, 1,
-1.130271, 1.298375, -1.237094, 1, 0.772549, 0, 1,
-1.127271, -0.696247, -0.7065668, 1, 0.7803922, 0, 1,
-1.122527, -1.182309, -3.691277, 1, 0.7843137, 0, 1,
-1.114472, 0.6342169, -0.5649461, 1, 0.7921569, 0, 1,
-1.107145, -1.140754, -2.823794, 1, 0.7960784, 0, 1,
-1.106118, 0.4648123, -1.888015, 1, 0.8039216, 0, 1,
-1.100157, 0.2894708, -2.50696, 1, 0.8117647, 0, 1,
-1.099675, 0.9299736, -0.8797151, 1, 0.8156863, 0, 1,
-1.095736, 1.189403, -0.9594733, 1, 0.8235294, 0, 1,
-1.093292, 0.3885854, 0.03181314, 1, 0.827451, 0, 1,
-1.092647, -1.000805, -3.172587, 1, 0.8352941, 0, 1,
-1.088902, 0.4918614, -1.143724, 1, 0.8392157, 0, 1,
-1.087245, -1.28354, -0.6154992, 1, 0.8470588, 0, 1,
-1.086208, -1.930781, -2.310614, 1, 0.8509804, 0, 1,
-1.071762, -0.002269085, -1.356943, 1, 0.8588235, 0, 1,
-1.066827, -0.302446, -0.2219326, 1, 0.8627451, 0, 1,
-1.063527, 1.340954, -0.1921289, 1, 0.8705882, 0, 1,
-1.059421, 0.4116086, -2.815339, 1, 0.8745098, 0, 1,
-1.058042, -1.434625, -3.950331, 1, 0.8823529, 0, 1,
-1.053104, 0.6146971, -2.606243, 1, 0.8862745, 0, 1,
-1.05131, 0.1111993, -0.584645, 1, 0.8941177, 0, 1,
-1.036761, -0.9807119, -3.509082, 1, 0.8980392, 0, 1,
-1.033435, -0.6437182, -1.366748, 1, 0.9058824, 0, 1,
-1.032265, -0.1608264, -3.122046, 1, 0.9137255, 0, 1,
-1.031036, 1.271887, -2.094385, 1, 0.9176471, 0, 1,
-1.02927, -0.2714654, -1.596113, 1, 0.9254902, 0, 1,
-1.02581, 0.01207643, -3.429377, 1, 0.9294118, 0, 1,
-1.022891, 0.536658, -0.5212694, 1, 0.9372549, 0, 1,
-1.022252, 0.3508048, -2.086625, 1, 0.9411765, 0, 1,
-1.018636, -0.4894776, -1.225453, 1, 0.9490196, 0, 1,
-1.006102, 2.498923, -0.3339704, 1, 0.9529412, 0, 1,
-0.9898188, -0.4448341, -2.795319, 1, 0.9607843, 0, 1,
-0.9835366, -1.066975, -1.636588, 1, 0.9647059, 0, 1,
-0.9829566, 0.7202825, 0.731406, 1, 0.972549, 0, 1,
-0.9811574, 1.343344, -0.8319622, 1, 0.9764706, 0, 1,
-0.9777976, 0.4084841, -0.1033081, 1, 0.9843137, 0, 1,
-0.9708968, 0.4413152, -1.335588, 1, 0.9882353, 0, 1,
-0.96448, 0.3730168, -2.948312, 1, 0.9960784, 0, 1,
-0.9624282, -0.151352, -2.687947, 0.9960784, 1, 0, 1,
-0.9586632, 1.699523, -0.4484075, 0.9921569, 1, 0, 1,
-0.9504511, -1.563858, -4.182761, 0.9843137, 1, 0, 1,
-0.9479147, 1.430985, -1.878135, 0.9803922, 1, 0, 1,
-0.941502, 0.8211473, -0.6699318, 0.972549, 1, 0, 1,
-0.938625, -0.0637648, -1.363127, 0.9686275, 1, 0, 1,
-0.936898, 0.949128, -0.3307268, 0.9607843, 1, 0, 1,
-0.9340351, -0.8180509, -1.49395, 0.9568627, 1, 0, 1,
-0.9325062, 1.89106, 0.1814853, 0.9490196, 1, 0, 1,
-0.9303523, 0.8732583, -0.8644363, 0.945098, 1, 0, 1,
-0.9171997, 0.5971165, -1.336763, 0.9372549, 1, 0, 1,
-0.9146671, 1.218137, -1.64614, 0.9333333, 1, 0, 1,
-0.9070458, -0.3127755, -1.563799, 0.9254902, 1, 0, 1,
-0.900252, -0.6178653, -0.8250341, 0.9215686, 1, 0, 1,
-0.8984155, 0.1846718, 0.3544162, 0.9137255, 1, 0, 1,
-0.8964719, -1.108549, -1.464335, 0.9098039, 1, 0, 1,
-0.8943011, 0.7253398, -1.375112, 0.9019608, 1, 0, 1,
-0.8913887, 0.1166504, -1.014318, 0.8941177, 1, 0, 1,
-0.8900551, -0.7499596, -2.345157, 0.8901961, 1, 0, 1,
-0.8899502, 0.3107433, -1.291079, 0.8823529, 1, 0, 1,
-0.8711005, -0.1025522, -3.872583, 0.8784314, 1, 0, 1,
-0.8580607, 1.497598, -0.6349334, 0.8705882, 1, 0, 1,
-0.8490145, 2.204332, -0.8732611, 0.8666667, 1, 0, 1,
-0.8487556, 0.6795034, -0.2278414, 0.8588235, 1, 0, 1,
-0.8454521, -2.079388, -2.179634, 0.854902, 1, 0, 1,
-0.8365812, 0.9008254, -1.619086, 0.8470588, 1, 0, 1,
-0.8336258, -1.059507, -2.744927, 0.8431373, 1, 0, 1,
-0.8318312, -1.664142, -1.562167, 0.8352941, 1, 0, 1,
-0.8244931, 0.03053739, -0.02616102, 0.8313726, 1, 0, 1,
-0.8149104, -1.140042, -2.633859, 0.8235294, 1, 0, 1,
-0.813458, 1.014935, -0.8090014, 0.8196079, 1, 0, 1,
-0.811972, -0.297195, 0.07435994, 0.8117647, 1, 0, 1,
-0.8109967, 2.031756, 0.4212007, 0.8078431, 1, 0, 1,
-0.7949099, 0.09695129, -1.633382, 0.8, 1, 0, 1,
-0.7915413, -0.501297, -1.276124, 0.7921569, 1, 0, 1,
-0.789098, 1.474408, 0.1832024, 0.7882353, 1, 0, 1,
-0.776714, -0.4633539, -3.511157, 0.7803922, 1, 0, 1,
-0.776347, 1.299947, 0.1870061, 0.7764706, 1, 0, 1,
-0.7752877, 0.9751942, -0.2420243, 0.7686275, 1, 0, 1,
-0.7707566, -1.171174, -1.928466, 0.7647059, 1, 0, 1,
-0.7653796, 0.2441256, -1.778313, 0.7568628, 1, 0, 1,
-0.7582844, 0.5179379, -0.002865279, 0.7529412, 1, 0, 1,
-0.7547755, 0.4414345, -0.3490369, 0.7450981, 1, 0, 1,
-0.7494442, 1.213658, -0.6891196, 0.7411765, 1, 0, 1,
-0.7492768, -0.7808577, -1.112406, 0.7333333, 1, 0, 1,
-0.7426788, 1.969875, -0.712073, 0.7294118, 1, 0, 1,
-0.7284304, 0.08449443, 0.6509222, 0.7215686, 1, 0, 1,
-0.725956, 1.357794, 0.4474919, 0.7176471, 1, 0, 1,
-0.7255554, -0.1998144, -1.890185, 0.7098039, 1, 0, 1,
-0.722942, -1.334654, -3.852477, 0.7058824, 1, 0, 1,
-0.7211394, -0.03344568, -2.648216, 0.6980392, 1, 0, 1,
-0.7190888, -2.231048, -1.916782, 0.6901961, 1, 0, 1,
-0.7157708, 0.2831452, -0.5440612, 0.6862745, 1, 0, 1,
-0.7117959, -0.2993632, -2.21547, 0.6784314, 1, 0, 1,
-0.711428, 1.194489, 0.3854519, 0.6745098, 1, 0, 1,
-0.7113872, -0.7787778, -3.080211, 0.6666667, 1, 0, 1,
-0.7111175, -0.03501464, -0.9081987, 0.6627451, 1, 0, 1,
-0.7100123, 0.09947269, -0.9735036, 0.654902, 1, 0, 1,
-0.7098082, 1.289108, -1.57922, 0.6509804, 1, 0, 1,
-0.7042782, -0.9373596, -1.53981, 0.6431373, 1, 0, 1,
-0.6921555, -0.8126157, -4.37157, 0.6392157, 1, 0, 1,
-0.6893837, 0.2867102, -3.036957, 0.6313726, 1, 0, 1,
-0.688485, -0.7584195, -1.458912, 0.627451, 1, 0, 1,
-0.6880226, -1.505699, -3.101315, 0.6196079, 1, 0, 1,
-0.6858457, -1.380123, -3.457258, 0.6156863, 1, 0, 1,
-0.6845273, -0.08285316, -2.001599, 0.6078432, 1, 0, 1,
-0.6832876, 0.09648104, -1.509474, 0.6039216, 1, 0, 1,
-0.6784345, -1.675593, -3.2056, 0.5960785, 1, 0, 1,
-0.6743567, 0.5469444, -0.7330129, 0.5882353, 1, 0, 1,
-0.673013, 0.8214034, -0.6435722, 0.5843138, 1, 0, 1,
-0.6714992, -0.5063822, -2.167406, 0.5764706, 1, 0, 1,
-0.6713181, 0.711017, 0.7716238, 0.572549, 1, 0, 1,
-0.6676375, 0.4509124, -1.287717, 0.5647059, 1, 0, 1,
-0.6650237, 0.6216518, -2.381306, 0.5607843, 1, 0, 1,
-0.661688, 0.04076912, -2.454362, 0.5529412, 1, 0, 1,
-0.6612496, 0.8355014, 1.39111, 0.5490196, 1, 0, 1,
-0.6590303, 0.8937325, -0.02335755, 0.5411765, 1, 0, 1,
-0.649494, 1.053177, -0.185525, 0.5372549, 1, 0, 1,
-0.6491339, 0.4653476, -1.194641, 0.5294118, 1, 0, 1,
-0.6471539, 0.09578516, -0.929517, 0.5254902, 1, 0, 1,
-0.6427661, 0.7021987, 0.7039706, 0.5176471, 1, 0, 1,
-0.6411162, 0.7293295, -0.6125154, 0.5137255, 1, 0, 1,
-0.6400571, 2.085022, 1.036714, 0.5058824, 1, 0, 1,
-0.6344732, -2.109515, -1.398172, 0.5019608, 1, 0, 1,
-0.6311455, -0.09892444, -1.381781, 0.4941176, 1, 0, 1,
-0.6287591, 1.629883, 0.09135199, 0.4862745, 1, 0, 1,
-0.6277175, 0.5140724, 1.354781, 0.4823529, 1, 0, 1,
-0.6261869, -0.1690238, -2.533492, 0.4745098, 1, 0, 1,
-0.6242737, 1.476402, -1.126384, 0.4705882, 1, 0, 1,
-0.620204, 0.8073369, -0.3795667, 0.4627451, 1, 0, 1,
-0.6182671, 0.1652772, -0.6636506, 0.4588235, 1, 0, 1,
-0.6171655, -0.0971884, -2.656173, 0.4509804, 1, 0, 1,
-0.6131838, 0.6669806, 0.4394717, 0.4470588, 1, 0, 1,
-0.6086756, 1.004744, -0.9874905, 0.4392157, 1, 0, 1,
-0.6015384, -0.3220969, -2.649501, 0.4352941, 1, 0, 1,
-0.601122, 0.5974671, -0.3290603, 0.427451, 1, 0, 1,
-0.5983332, -1.531876, -0.9673779, 0.4235294, 1, 0, 1,
-0.596725, 0.3991752, -0.9601716, 0.4156863, 1, 0, 1,
-0.5913637, 0.7011852, -1.164031, 0.4117647, 1, 0, 1,
-0.5900497, -0.802457, -2.351491, 0.4039216, 1, 0, 1,
-0.5865756, 0.8311962, -0.7577095, 0.3960784, 1, 0, 1,
-0.583365, -0.7872182, -3.862182, 0.3921569, 1, 0, 1,
-0.5816523, -1.101965, -3.326389, 0.3843137, 1, 0, 1,
-0.5803057, 0.6502085, -1.514381, 0.3803922, 1, 0, 1,
-0.5766193, -0.278503, -2.522925, 0.372549, 1, 0, 1,
-0.5718089, 0.1784196, -1.070744, 0.3686275, 1, 0, 1,
-0.5694545, -0.987249, -2.373371, 0.3607843, 1, 0, 1,
-0.5646217, 1.228208, -1.171955, 0.3568628, 1, 0, 1,
-0.5631397, 1.367469, -0.1088041, 0.3490196, 1, 0, 1,
-0.5550144, -0.1265791, -1.677538, 0.345098, 1, 0, 1,
-0.5531729, -1.261932, -1.201797, 0.3372549, 1, 0, 1,
-0.5525067, 1.229476, 0.1634141, 0.3333333, 1, 0, 1,
-0.5522051, -0.8209466, -1.965325, 0.3254902, 1, 0, 1,
-0.5508154, -0.4603384, -2.77147, 0.3215686, 1, 0, 1,
-0.5444867, 2.445165, -0.7014971, 0.3137255, 1, 0, 1,
-0.5375559, -0.144642, -2.348697, 0.3098039, 1, 0, 1,
-0.5374991, 1.622231, -0.65718, 0.3019608, 1, 0, 1,
-0.5374025, -3.547784, -2.953429, 0.2941177, 1, 0, 1,
-0.5338287, 1.188885, -0.4584841, 0.2901961, 1, 0, 1,
-0.5328493, 1.145177, -2.826926, 0.282353, 1, 0, 1,
-0.5215564, 0.02281651, 0.06494838, 0.2784314, 1, 0, 1,
-0.5215385, -0.1473941, -1.994132, 0.2705882, 1, 0, 1,
-0.5109132, 0.4231358, -1.759313, 0.2666667, 1, 0, 1,
-0.5079489, 0.9892681, -1.767146, 0.2588235, 1, 0, 1,
-0.5075812, 0.04763366, -2.218061, 0.254902, 1, 0, 1,
-0.5056539, 0.239353, -1.341763, 0.2470588, 1, 0, 1,
-0.5048822, -0.1700186, -0.4681922, 0.2431373, 1, 0, 1,
-0.5008959, 1.016174, 1.389976, 0.2352941, 1, 0, 1,
-0.5006198, 1.477898, -2.512143, 0.2313726, 1, 0, 1,
-0.4982899, -0.07487445, 0.1611359, 0.2235294, 1, 0, 1,
-0.4953149, 0.7152271, -1.656964, 0.2196078, 1, 0, 1,
-0.4916875, -0.6916434, -2.386505, 0.2117647, 1, 0, 1,
-0.4890291, 0.1069808, -1.306046, 0.2078431, 1, 0, 1,
-0.4838782, -0.2179806, -2.999174, 0.2, 1, 0, 1,
-0.4809907, -0.4446987, -4.910834, 0.1921569, 1, 0, 1,
-0.4808812, -0.4449267, -2.32318, 0.1882353, 1, 0, 1,
-0.4802821, 0.4800422, -0.5899919, 0.1803922, 1, 0, 1,
-0.4795385, 0.2293004, -2.169853, 0.1764706, 1, 0, 1,
-0.4779636, 0.8688324, -0.5691614, 0.1686275, 1, 0, 1,
-0.4774646, 0.28293, 1.025601, 0.1647059, 1, 0, 1,
-0.4742031, 1.377014, -0.3867932, 0.1568628, 1, 0, 1,
-0.4725517, -0.4812315, -2.770639, 0.1529412, 1, 0, 1,
-0.4702282, -0.783257, -2.999592, 0.145098, 1, 0, 1,
-0.4582401, -0.4509673, -0.9937254, 0.1411765, 1, 0, 1,
-0.4521253, 0.2742218, 0.3162966, 0.1333333, 1, 0, 1,
-0.4490733, -0.0951299, -1.783167, 0.1294118, 1, 0, 1,
-0.4426527, 0.4170823, -1.347332, 0.1215686, 1, 0, 1,
-0.440854, -0.3715507, -3.106992, 0.1176471, 1, 0, 1,
-0.4401936, 1.204961, -0.9920271, 0.1098039, 1, 0, 1,
-0.4371412, 1.732853, -0.958448, 0.1058824, 1, 0, 1,
-0.4368249, 0.1646314, -0.8780193, 0.09803922, 1, 0, 1,
-0.4342199, 0.2868705, -0.2412789, 0.09019608, 1, 0, 1,
-0.4332753, -1.094033, -2.131277, 0.08627451, 1, 0, 1,
-0.4326299, 1.435465, 0.6231393, 0.07843138, 1, 0, 1,
-0.4323712, 0.4805267, -0.8847906, 0.07450981, 1, 0, 1,
-0.4307356, -1.267825, -3.732053, 0.06666667, 1, 0, 1,
-0.4289709, -0.721686, -2.949286, 0.0627451, 1, 0, 1,
-0.4286529, 0.1275092, -1.18917, 0.05490196, 1, 0, 1,
-0.4268858, -0.4894127, -2.157288, 0.05098039, 1, 0, 1,
-0.4225503, 1.16189, -0.5915911, 0.04313726, 1, 0, 1,
-0.4224707, 0.600021, -3.505486, 0.03921569, 1, 0, 1,
-0.4207457, -0.646621, -1.503099, 0.03137255, 1, 0, 1,
-0.4161695, 2.425889, 0.2056135, 0.02745098, 1, 0, 1,
-0.4116777, 0.03955597, -2.844979, 0.01960784, 1, 0, 1,
-0.4073089, -0.7201484, -0.9953813, 0.01568628, 1, 0, 1,
-0.3919182, 0.7428412, -0.880688, 0.007843138, 1, 0, 1,
-0.3852655, -1.687078, -4.27062, 0.003921569, 1, 0, 1,
-0.3852471, 0.6351866, 0.2602578, 0, 1, 0.003921569, 1,
-0.3802124, -0.6080725, -2.576341, 0, 1, 0.01176471, 1,
-0.38015, 0.2913744, -0.9751734, 0, 1, 0.01568628, 1,
-0.378738, -0.001050069, -2.034707, 0, 1, 0.02352941, 1,
-0.3739395, 0.5770395, 0.06098047, 0, 1, 0.02745098, 1,
-0.3734433, -1.405686, -3.387705, 0, 1, 0.03529412, 1,
-0.3716362, 0.3276373, -0.4205922, 0, 1, 0.03921569, 1,
-0.3698532, 0.4784105, 0.1547819, 0, 1, 0.04705882, 1,
-0.3649367, 0.6944298, -1.373081, 0, 1, 0.05098039, 1,
-0.3579977, 0.5346751, -2.02406, 0, 1, 0.05882353, 1,
-0.3521948, -1.909326, -3.718178, 0, 1, 0.0627451, 1,
-0.3513549, 0.3206489, -2.901132, 0, 1, 0.07058824, 1,
-0.3505868, 0.9866653, -0.04625202, 0, 1, 0.07450981, 1,
-0.349842, -0.4732861, -3.04232, 0, 1, 0.08235294, 1,
-0.3488609, -0.2232927, -2.456611, 0, 1, 0.08627451, 1,
-0.3478895, 0.2157689, -2.31505, 0, 1, 0.09411765, 1,
-0.3452989, -0.3815973, -2.730159, 0, 1, 0.1019608, 1,
-0.3405881, -1.99685, -4.053835, 0, 1, 0.1058824, 1,
-0.3310033, -1.22349, -3.258525, 0, 1, 0.1137255, 1,
-0.3229405, 0.08164439, 0.02715047, 0, 1, 0.1176471, 1,
-0.3211728, -0.6880777, -2.320799, 0, 1, 0.1254902, 1,
-0.3201909, 0.9255006, 0.4267352, 0, 1, 0.1294118, 1,
-0.3162704, -0.06601625, -0.7163534, 0, 1, 0.1372549, 1,
-0.311754, -0.1897964, -2.299429, 0, 1, 0.1411765, 1,
-0.3100453, -0.5780932, -1.834202, 0, 1, 0.1490196, 1,
-0.3094815, 0.7755477, -1.412581, 0, 1, 0.1529412, 1,
-0.3047734, -0.4302782, -2.362711, 0, 1, 0.1607843, 1,
-0.303008, -1.063113, -1.822908, 0, 1, 0.1647059, 1,
-0.2991308, 0.1179624, -0.9558949, 0, 1, 0.172549, 1,
-0.2932756, -1.421934, -3.045754, 0, 1, 0.1764706, 1,
-0.2906866, 2.166887, -0.5289881, 0, 1, 0.1843137, 1,
-0.2902642, 1.144043, -1.75055, 0, 1, 0.1882353, 1,
-0.2867748, -1.223432, -3.551438, 0, 1, 0.1960784, 1,
-0.2859557, 0.05185143, -0.9058056, 0, 1, 0.2039216, 1,
-0.2856058, 0.8274742, -0.8789127, 0, 1, 0.2078431, 1,
-0.285477, -0.4715709, -3.701804, 0, 1, 0.2156863, 1,
-0.2846751, -0.01872757, -3.608243, 0, 1, 0.2196078, 1,
-0.2833337, 2.233177, 1.703339, 0, 1, 0.227451, 1,
-0.2832319, -2.044219, -2.396711, 0, 1, 0.2313726, 1,
-0.2824626, -0.0829632, -1.979638, 0, 1, 0.2392157, 1,
-0.2804891, 2.841648, 0.8528333, 0, 1, 0.2431373, 1,
-0.2764937, -0.4552614, -3.592146, 0, 1, 0.2509804, 1,
-0.2754501, -2.455156, -2.295665, 0, 1, 0.254902, 1,
-0.2749315, -0.7448463, -2.723949, 0, 1, 0.2627451, 1,
-0.2741136, 0.1274403, -0.2593468, 0, 1, 0.2666667, 1,
-0.2712113, -0.7938056, -3.675223, 0, 1, 0.2745098, 1,
-0.2684184, 0.490749, -0.3282752, 0, 1, 0.2784314, 1,
-0.2664693, -0.3684238, -2.369444, 0, 1, 0.2862745, 1,
-0.2664349, -0.8214658, -3.383075, 0, 1, 0.2901961, 1,
-0.2636957, -0.4543151, -3.127562, 0, 1, 0.2980392, 1,
-0.2635905, 1.568044, -0.07357676, 0, 1, 0.3058824, 1,
-0.2624522, 1.127922, -0.2561074, 0, 1, 0.3098039, 1,
-0.2569641, 0.2232632, -0.05064838, 0, 1, 0.3176471, 1,
-0.25656, 0.5886197, -0.6705165, 0, 1, 0.3215686, 1,
-0.2554599, -1.409956, -2.420976, 0, 1, 0.3294118, 1,
-0.2501194, -2.342291, -3.126851, 0, 1, 0.3333333, 1,
-0.2458184, -1.708734, -4.26696, 0, 1, 0.3411765, 1,
-0.244447, 0.8055416, 0.005138131, 0, 1, 0.345098, 1,
-0.2437628, -0.2925197, -1.605218, 0, 1, 0.3529412, 1,
-0.2422615, -0.4031474, -2.76907, 0, 1, 0.3568628, 1,
-0.2317077, 0.5520704, 1.071077, 0, 1, 0.3647059, 1,
-0.2303035, 0.7531405, -0.2323979, 0, 1, 0.3686275, 1,
-0.2254603, 0.4599487, 1.022374, 0, 1, 0.3764706, 1,
-0.2239526, -0.5269815, -1.880727, 0, 1, 0.3803922, 1,
-0.2237145, -1.082706, -2.944887, 0, 1, 0.3882353, 1,
-0.221135, 1.147792, 0.1794669, 0, 1, 0.3921569, 1,
-0.2203303, 1.526005, 2.985319, 0, 1, 0.4, 1,
-0.2132351, 1.12707, -0.3829264, 0, 1, 0.4078431, 1,
-0.2126058, 1.438321, -1.029133, 0, 1, 0.4117647, 1,
-0.2114319, -0.457054, -1.414014, 0, 1, 0.4196078, 1,
-0.2101829, -0.6896886, -2.760354, 0, 1, 0.4235294, 1,
-0.208124, -0.3585964, -3.204322, 0, 1, 0.4313726, 1,
-0.20754, 0.3161746, -0.7544806, 0, 1, 0.4352941, 1,
-0.2066892, 0.7901758, -2.130609, 0, 1, 0.4431373, 1,
-0.2055091, 0.9799946, 0.5042879, 0, 1, 0.4470588, 1,
-0.2055042, 1.435298, 0.6199611, 0, 1, 0.454902, 1,
-0.204038, 1.279447, 0.2397817, 0, 1, 0.4588235, 1,
-0.201815, 0.1372432, -1.777318, 0, 1, 0.4666667, 1,
-0.1954936, -0.6319592, -2.966122, 0, 1, 0.4705882, 1,
-0.1912307, -1.906798, -2.068009, 0, 1, 0.4784314, 1,
-0.1898451, 1.435868, -0.1197355, 0, 1, 0.4823529, 1,
-0.1877352, -0.9898243, -3.20383, 0, 1, 0.4901961, 1,
-0.1869906, -0.7015054, -2.157983, 0, 1, 0.4941176, 1,
-0.1859355, 1.298079, 0.8616234, 0, 1, 0.5019608, 1,
-0.1736759, -0.7883855, -2.968657, 0, 1, 0.509804, 1,
-0.1725725, 0.4318012, -1.455008, 0, 1, 0.5137255, 1,
-0.1708681, -0.8247285, -3.820781, 0, 1, 0.5215687, 1,
-0.1692189, 1.256651, -0.5396801, 0, 1, 0.5254902, 1,
-0.1684547, 0.6472638, -0.3720418, 0, 1, 0.5333334, 1,
-0.163715, -0.3269326, -2.254193, 0, 1, 0.5372549, 1,
-0.1607055, 0.5799101, -3.180391, 0, 1, 0.5450981, 1,
-0.1585919, 0.4660029, 0.1678662, 0, 1, 0.5490196, 1,
-0.1575261, -0.4901009, -1.950713, 0, 1, 0.5568628, 1,
-0.1550535, 0.5069989, -2.215419, 0, 1, 0.5607843, 1,
-0.1532887, -0.7274749, -2.239988, 0, 1, 0.5686275, 1,
-0.1457758, -1.058696, -3.927009, 0, 1, 0.572549, 1,
-0.136832, 2.100689, 2.249093, 0, 1, 0.5803922, 1,
-0.1345933, 0.09798861, 0.1875607, 0, 1, 0.5843138, 1,
-0.1285079, -0.6274921, -3.27949, 0, 1, 0.5921569, 1,
-0.1282283, -0.5964067, -4.344446, 0, 1, 0.5960785, 1,
-0.1267999, 0.5412686, -1.502042, 0, 1, 0.6039216, 1,
-0.1209518, 1.144553, 1.43838, 0, 1, 0.6117647, 1,
-0.117891, -1.548943, -4.376023, 0, 1, 0.6156863, 1,
-0.1151827, -0.973645, -4.22266, 0, 1, 0.6235294, 1,
-0.1108175, 1.123955, 0.4779119, 0, 1, 0.627451, 1,
-0.1042024, 2.271338, -0.1100772, 0, 1, 0.6352941, 1,
-0.1015471, -0.9004428, -2.676945, 0, 1, 0.6392157, 1,
-0.1000308, 1.020707, 1.349033, 0, 1, 0.6470588, 1,
-0.09888683, -0.6253023, -1.730317, 0, 1, 0.6509804, 1,
-0.09761768, 0.7522055, -1.491213, 0, 1, 0.6588235, 1,
-0.09535849, 1.455996, -0.5466154, 0, 1, 0.6627451, 1,
-0.08854216, -1.23835, -3.78738, 0, 1, 0.6705883, 1,
-0.08336978, 0.693006, -0.4206477, 0, 1, 0.6745098, 1,
-0.07888617, -0.3381956, -2.396734, 0, 1, 0.682353, 1,
-0.0749239, -0.4335082, -1.259494, 0, 1, 0.6862745, 1,
-0.07418989, 0.8339064, -0.6738945, 0, 1, 0.6941177, 1,
-0.07250735, -0.08859625, -5.171303, 0, 1, 0.7019608, 1,
-0.07130609, -1.693496, -4.314574, 0, 1, 0.7058824, 1,
-0.06829794, -0.2132161, -2.414665, 0, 1, 0.7137255, 1,
-0.06767721, 0.9983525, -0.08681051, 0, 1, 0.7176471, 1,
-0.0566055, -0.09066699, -3.442898, 0, 1, 0.7254902, 1,
-0.05558754, 1.616729, 1.400466, 0, 1, 0.7294118, 1,
-0.05301475, 1.070474, 0.06795838, 0, 1, 0.7372549, 1,
-0.04593606, 3.016253, 0.518495, 0, 1, 0.7411765, 1,
-0.04552845, -0.9343904, -1.973709, 0, 1, 0.7490196, 1,
-0.0454707, -0.970542, -3.849133, 0, 1, 0.7529412, 1,
-0.03823299, 0.02775416, -1.916981, 0, 1, 0.7607843, 1,
-0.03281603, 1.672883, -0.2514339, 0, 1, 0.7647059, 1,
-0.02924859, -1.594995, -2.868514, 0, 1, 0.772549, 1,
-0.02827662, 0.8286359, -0.07350215, 0, 1, 0.7764706, 1,
-0.02557626, -1.261517, -3.849312, 0, 1, 0.7843137, 1,
-0.02499625, -1.055925, -1.394029, 0, 1, 0.7882353, 1,
-0.01264396, -1.428483, -3.807579, 0, 1, 0.7960784, 1,
-0.008814577, -0.6032214, -4.044176, 0, 1, 0.8039216, 1,
-0.007919832, 0.003307683, -2.088487, 0, 1, 0.8078431, 1,
-0.006005661, -0.2492268, -2.749593, 0, 1, 0.8156863, 1,
-0.004765463, 0.1516362, -1.203042, 0, 1, 0.8196079, 1,
-0.004128108, -0.4705533, -2.737717, 0, 1, 0.827451, 1,
-0.003267271, -1.20374, -4.167186, 0, 1, 0.8313726, 1,
-0.0004460111, -1.169088, -3.29941, 0, 1, 0.8392157, 1,
0.0008985093, 0.8116643, -0.3718419, 0, 1, 0.8431373, 1,
0.006768997, 0.7898562, 1.518924, 0, 1, 0.8509804, 1,
0.008906949, -1.466619, 3.767131, 0, 1, 0.854902, 1,
0.0107113, 0.4390287, 1.198358, 0, 1, 0.8627451, 1,
0.01178416, -1.454757, 3.556882, 0, 1, 0.8666667, 1,
0.01231377, 0.2890258, -0.6922758, 0, 1, 0.8745098, 1,
0.01412464, -0.6891767, 1.409813, 0, 1, 0.8784314, 1,
0.02032531, 0.6601778, 1.578237, 0, 1, 0.8862745, 1,
0.02090833, 0.6216149, 0.7719934, 0, 1, 0.8901961, 1,
0.02178437, -0.2993437, 2.989448, 0, 1, 0.8980392, 1,
0.02342894, -0.8268111, 1.646284, 0, 1, 0.9058824, 1,
0.02384578, -1.102245, 3.47919, 0, 1, 0.9098039, 1,
0.02544172, -1.136138, 1.4548, 0, 1, 0.9176471, 1,
0.02590384, 0.0633646, 1.555295, 0, 1, 0.9215686, 1,
0.03280023, -0.7564118, 4.140666, 0, 1, 0.9294118, 1,
0.03769938, -1.199704, 4.369812, 0, 1, 0.9333333, 1,
0.04102327, -0.3051449, 1.815297, 0, 1, 0.9411765, 1,
0.04588372, 0.9651598, 0.9905423, 0, 1, 0.945098, 1,
0.05326562, -1.362647, 3.654558, 0, 1, 0.9529412, 1,
0.0552693, -0.432007, 2.852293, 0, 1, 0.9568627, 1,
0.05658303, -1.315034, 3.567722, 0, 1, 0.9647059, 1,
0.05666364, -0.4172695, 2.712025, 0, 1, 0.9686275, 1,
0.05696665, 0.9625457, -0.4619295, 0, 1, 0.9764706, 1,
0.06218844, 0.6355435, -0.373704, 0, 1, 0.9803922, 1,
0.06422623, -0.1729397, 4.144356, 0, 1, 0.9882353, 1,
0.0656593, -0.4414307, 2.985495, 0, 1, 0.9921569, 1,
0.06802204, 0.6511824, -0.8672003, 0, 1, 1, 1,
0.07082631, -0.6070493, 2.417377, 0, 0.9921569, 1, 1,
0.07123833, -0.4917628, 2.463772, 0, 0.9882353, 1, 1,
0.07415137, -0.4958791, 2.942906, 0, 0.9803922, 1, 1,
0.0756432, 0.3474478, 0.6204449, 0, 0.9764706, 1, 1,
0.07836345, -0.110383, 1.650999, 0, 0.9686275, 1, 1,
0.08224652, 1.051194, -1.133795, 0, 0.9647059, 1, 1,
0.08336489, 0.1056949, 1.978925, 0, 0.9568627, 1, 1,
0.0887437, 0.06788686, 2.425934, 0, 0.9529412, 1, 1,
0.09072051, -0.4007778, 1.627053, 0, 0.945098, 1, 1,
0.09142558, -2.243427, 4.756925, 0, 0.9411765, 1, 1,
0.0921621, -0.8414071, 1.937969, 0, 0.9333333, 1, 1,
0.1005991, 2.284587, 0.4612497, 0, 0.9294118, 1, 1,
0.1016684, 1.346027, -1.278951, 0, 0.9215686, 1, 1,
0.1023219, -0.5057044, 2.139802, 0, 0.9176471, 1, 1,
0.1050957, -0.4161433, 4.181374, 0, 0.9098039, 1, 1,
0.1081686, -0.6252455, 2.657781, 0, 0.9058824, 1, 1,
0.1093092, -0.1443121, 3.699226, 0, 0.8980392, 1, 1,
0.111886, -0.6925502, 0.9772132, 0, 0.8901961, 1, 1,
0.112739, 0.9881301, -0.03095621, 0, 0.8862745, 1, 1,
0.1171678, 0.05028151, 2.096616, 0, 0.8784314, 1, 1,
0.1210294, 0.02373662, 1.025986, 0, 0.8745098, 1, 1,
0.1214899, -0.8255513, 3.59558, 0, 0.8666667, 1, 1,
0.1219243, -0.6731385, 2.149045, 0, 0.8627451, 1, 1,
0.1234113, -1.176925, 3.214557, 0, 0.854902, 1, 1,
0.1239825, 0.08870334, 0.4492425, 0, 0.8509804, 1, 1,
0.1297427, 0.9043602, -1.349209, 0, 0.8431373, 1, 1,
0.1317897, -0.476572, 4.407112, 0, 0.8392157, 1, 1,
0.1325023, -2.061363, 3.405193, 0, 0.8313726, 1, 1,
0.1329765, 0.5078163, 1.373995, 0, 0.827451, 1, 1,
0.1329844, -0.04610073, 0.7769793, 0, 0.8196079, 1, 1,
0.1377538, -1.266442, 2.746946, 0, 0.8156863, 1, 1,
0.1401477, -0.9133757, 3.144615, 0, 0.8078431, 1, 1,
0.1415809, -0.2085559, 2.857817, 0, 0.8039216, 1, 1,
0.1423249, -0.5906548, 3.943683, 0, 0.7960784, 1, 1,
0.1448124, -0.8733612, 4.268317, 0, 0.7882353, 1, 1,
0.1493899, 0.09939838, 1.187261, 0, 0.7843137, 1, 1,
0.1531601, 0.7781811, -1.473331, 0, 0.7764706, 1, 1,
0.1588085, -0.3001915, 3.537556, 0, 0.772549, 1, 1,
0.1608214, -0.007101583, 0.674918, 0, 0.7647059, 1, 1,
0.1714948, -0.452813, 1.392102, 0, 0.7607843, 1, 1,
0.1727403, -0.555883, 3.558043, 0, 0.7529412, 1, 1,
0.1752838, -0.7584523, 6.033597, 0, 0.7490196, 1, 1,
0.1776256, -0.9558105, 1.784354, 0, 0.7411765, 1, 1,
0.184187, 1.846485, 0.7588302, 0, 0.7372549, 1, 1,
0.1860235, -0.6241506, 2.106314, 0, 0.7294118, 1, 1,
0.1914171, -0.4060823, 0.3404781, 0, 0.7254902, 1, 1,
0.198282, 0.1024373, 0.7029204, 0, 0.7176471, 1, 1,
0.2014137, -0.3987319, 2.589838, 0, 0.7137255, 1, 1,
0.2028388, 0.8710651, -1.28269, 0, 0.7058824, 1, 1,
0.2048583, -0.6925867, 5.042045, 0, 0.6980392, 1, 1,
0.2049124, -0.8570958, 2.715963, 0, 0.6941177, 1, 1,
0.2077992, 0.03682298, 2.167586, 0, 0.6862745, 1, 1,
0.2088751, 0.7287365, 1.284482, 0, 0.682353, 1, 1,
0.2121024, 0.5642587, 2.505876, 0, 0.6745098, 1, 1,
0.2133641, -1.58287, 5.552888, 0, 0.6705883, 1, 1,
0.2230468, -1.709742, 2.874066, 0, 0.6627451, 1, 1,
0.2239165, 0.6037788, 0.6677527, 0, 0.6588235, 1, 1,
0.2272082, -2.092717, 4.10305, 0, 0.6509804, 1, 1,
0.2274857, 0.7139117, -0.3274909, 0, 0.6470588, 1, 1,
0.2288212, -0.5941327, 3.023063, 0, 0.6392157, 1, 1,
0.2289086, 1.88546, -1.556692, 0, 0.6352941, 1, 1,
0.2289138, 1.298298, -0.4994277, 0, 0.627451, 1, 1,
0.2301007, -0.2801143, 1.856806, 0, 0.6235294, 1, 1,
0.2319525, -0.4982285, 3.048335, 0, 0.6156863, 1, 1,
0.2333767, -0.958874, 2.144972, 0, 0.6117647, 1, 1,
0.2341219, 0.526831, 0.4107745, 0, 0.6039216, 1, 1,
0.2412054, 0.4807162, 0.2707349, 0, 0.5960785, 1, 1,
0.2428163, -1.664149, 1.742109, 0, 0.5921569, 1, 1,
0.2436579, -1.222288, 3.782923, 0, 0.5843138, 1, 1,
0.2454333, 1.299361, -0.03183608, 0, 0.5803922, 1, 1,
0.2456543, -0.06177858, 0.8404058, 0, 0.572549, 1, 1,
0.2487709, 1.028095, -0.173581, 0, 0.5686275, 1, 1,
0.2527857, -2.016908, 3.557245, 0, 0.5607843, 1, 1,
0.2532282, 2.294158, -0.4421231, 0, 0.5568628, 1, 1,
0.2566387, 2.149213, 1.929471, 0, 0.5490196, 1, 1,
0.2614661, -0.3419726, 3.642754, 0, 0.5450981, 1, 1,
0.2619174, 0.97254, 1.245774, 0, 0.5372549, 1, 1,
0.2627095, -1.502841, 2.46267, 0, 0.5333334, 1, 1,
0.2663919, 0.6979869, 1.431017, 0, 0.5254902, 1, 1,
0.2713025, 0.06954198, 0.6078506, 0, 0.5215687, 1, 1,
0.2739904, 0.01808461, 3.17942, 0, 0.5137255, 1, 1,
0.2763066, 0.2924958, 0.1215522, 0, 0.509804, 1, 1,
0.2784319, 0.0764019, 0.740854, 0, 0.5019608, 1, 1,
0.2816106, -0.1032033, 2.399429, 0, 0.4941176, 1, 1,
0.2821437, 2.524076, 0.7559767, 0, 0.4901961, 1, 1,
0.2861055, 0.6887959, 0.7210851, 0, 0.4823529, 1, 1,
0.2875029, 0.7215238, -0.3183721, 0, 0.4784314, 1, 1,
0.2875808, -1.477668, 2.169669, 0, 0.4705882, 1, 1,
0.2893547, -0.1587909, 1.464744, 0, 0.4666667, 1, 1,
0.2900575, 1.096074, 1.582845, 0, 0.4588235, 1, 1,
0.2918492, 1.584841, 0.446683, 0, 0.454902, 1, 1,
0.2929833, 1.240661, 0.6407688, 0, 0.4470588, 1, 1,
0.3008385, -1.473562, 1.278746, 0, 0.4431373, 1, 1,
0.3022216, 1.365564, 1.368364, 0, 0.4352941, 1, 1,
0.3030709, -0.8786114, 3.600651, 0, 0.4313726, 1, 1,
0.3035919, 0.8870159, 0.7738369, 0, 0.4235294, 1, 1,
0.3037159, -1.178956, 1.23825, 0, 0.4196078, 1, 1,
0.3069592, 0.7479985, 0.1053229, 0, 0.4117647, 1, 1,
0.3108658, -0.2895867, 2.144827, 0, 0.4078431, 1, 1,
0.3114169, 0.5757519, 0.3957274, 0, 0.4, 1, 1,
0.3124957, 0.7749482, 1.735647, 0, 0.3921569, 1, 1,
0.3200581, 0.3615661, 0.5379343, 0, 0.3882353, 1, 1,
0.3243931, -0.6849918, 1.585112, 0, 0.3803922, 1, 1,
0.3265191, 1.025677, 0.3079823, 0, 0.3764706, 1, 1,
0.3301562, -0.08454049, 2.284247, 0, 0.3686275, 1, 1,
0.3304371, 0.7077488, -0.7582189, 0, 0.3647059, 1, 1,
0.3343167, -0.8185058, 3.489906, 0, 0.3568628, 1, 1,
0.3379648, 0.4162972, 0.3918831, 0, 0.3529412, 1, 1,
0.3384983, -1.658457, 1.681689, 0, 0.345098, 1, 1,
0.3403688, 0.9829497, 0.76421, 0, 0.3411765, 1, 1,
0.3459846, 0.4783924, 1.671396, 0, 0.3333333, 1, 1,
0.3478034, -0.6113097, 3.455225, 0, 0.3294118, 1, 1,
0.349047, 0.7637211, 1.21862, 0, 0.3215686, 1, 1,
0.3495661, -1.713747, 5.140676, 0, 0.3176471, 1, 1,
0.3506042, 1.869586, 0.1360111, 0, 0.3098039, 1, 1,
0.353762, 1.518533, -1.877543, 0, 0.3058824, 1, 1,
0.3554652, 0.08374576, 2.370963, 0, 0.2980392, 1, 1,
0.3565682, -0.6191416, 3.342549, 0, 0.2901961, 1, 1,
0.3577354, 2.292236, -1.082838, 0, 0.2862745, 1, 1,
0.3585197, 0.3661807, -0.1258839, 0, 0.2784314, 1, 1,
0.359917, -2.527299, 3.443706, 0, 0.2745098, 1, 1,
0.3618891, -1.334395, 3.387594, 0, 0.2666667, 1, 1,
0.3626029, -0.9018543, 3.91637, 0, 0.2627451, 1, 1,
0.3664664, 0.1807498, 1.492304, 0, 0.254902, 1, 1,
0.3667479, -1.990697, 3.232726, 0, 0.2509804, 1, 1,
0.3702655, -1.410756, 1.503324, 0, 0.2431373, 1, 1,
0.3710732, -1.135062, 2.287463, 0, 0.2392157, 1, 1,
0.3742068, 2.230808, -0.7060462, 0, 0.2313726, 1, 1,
0.3782771, -1.951325, 2.317723, 0, 0.227451, 1, 1,
0.3801501, -1.115414, 2.708027, 0, 0.2196078, 1, 1,
0.3842667, 0.725354, 1.599867, 0, 0.2156863, 1, 1,
0.3844545, 1.420904, 1.764402, 0, 0.2078431, 1, 1,
0.3849887, 0.08888979, 0.05993852, 0, 0.2039216, 1, 1,
0.3851835, 0.5515943, -1.790971, 0, 0.1960784, 1, 1,
0.3854077, -0.2659397, 3.024233, 0, 0.1882353, 1, 1,
0.3884926, 0.01999645, -0.2314334, 0, 0.1843137, 1, 1,
0.3958622, 0.1236211, 1.631205, 0, 0.1764706, 1, 1,
0.4024044, -1.186317, 2.253766, 0, 0.172549, 1, 1,
0.404764, 0.1875546, 0.332088, 0, 0.1647059, 1, 1,
0.4052656, -0.1162414, 0.9376237, 0, 0.1607843, 1, 1,
0.4065787, 0.7240634, 1.748208, 0, 0.1529412, 1, 1,
0.4097914, -2.452694, 3.526114, 0, 0.1490196, 1, 1,
0.4176261, 0.7887321, -1.533804, 0, 0.1411765, 1, 1,
0.4201443, -0.09087925, 0.5395862, 0, 0.1372549, 1, 1,
0.4206024, 0.7443554, 0.9064027, 0, 0.1294118, 1, 1,
0.4253326, -0.995079, 2.557497, 0, 0.1254902, 1, 1,
0.4270752, 0.7834756, -0.283082, 0, 0.1176471, 1, 1,
0.4283417, 1.309392, 0.5642596, 0, 0.1137255, 1, 1,
0.4346271, 0.6185822, -0.687986, 0, 0.1058824, 1, 1,
0.4356715, -0.5136139, 2.841149, 0, 0.09803922, 1, 1,
0.4385857, 0.15427, 3.010391, 0, 0.09411765, 1, 1,
0.4400389, 0.5574216, -1.152169, 0, 0.08627451, 1, 1,
0.4406095, -1.659771, 2.298748, 0, 0.08235294, 1, 1,
0.444061, 0.1689652, 2.447203, 0, 0.07450981, 1, 1,
0.4441239, -1.712497, 3.376359, 0, 0.07058824, 1, 1,
0.4476086, -2.80343, 1.804597, 0, 0.0627451, 1, 1,
0.4477977, 1.041669, 0.561277, 0, 0.05882353, 1, 1,
0.4517493, 0.6559216, 1.071209, 0, 0.05098039, 1, 1,
0.4559186, -0.1015178, -0.02438813, 0, 0.04705882, 1, 1,
0.4603165, 0.09583018, 1.475429, 0, 0.03921569, 1, 1,
0.4614182, 0.4113763, 1.187845, 0, 0.03529412, 1, 1,
0.4649003, 0.2894986, 1.224735, 0, 0.02745098, 1, 1,
0.4666767, 0.4021277, 1.46794, 0, 0.02352941, 1, 1,
0.468854, 1.191347, 1.115211, 0, 0.01568628, 1, 1,
0.4699449, 1.816726, -0.6699829, 0, 0.01176471, 1, 1,
0.4755021, 1.513604, 1.233979, 0, 0.003921569, 1, 1,
0.475771, -0.6791444, 2.361513, 0.003921569, 0, 1, 1,
0.4767943, -1.473289, 0.5985503, 0.007843138, 0, 1, 1,
0.4770133, -0.2198803, 3.696793, 0.01568628, 0, 1, 1,
0.4776637, 2.422985, -0.06533211, 0.01960784, 0, 1, 1,
0.4779128, -1.094079, 2.733695, 0.02745098, 0, 1, 1,
0.4783519, -0.2409446, 2.403427, 0.03137255, 0, 1, 1,
0.4790332, 0.1882202, 1.925315, 0.03921569, 0, 1, 1,
0.479338, -1.542777, 2.683255, 0.04313726, 0, 1, 1,
0.4816335, -0.461746, 1.169458, 0.05098039, 0, 1, 1,
0.4824826, 0.00141783, 0.9755864, 0.05490196, 0, 1, 1,
0.4850787, 1.401031, 1.29386, 0.0627451, 0, 1, 1,
0.5010629, -1.496688, 3.759872, 0.06666667, 0, 1, 1,
0.5012713, 0.8763261, 1.112709, 0.07450981, 0, 1, 1,
0.5081176, 0.2294934, 3.020036, 0.07843138, 0, 1, 1,
0.5088674, 0.9562423, 0.3785642, 0.08627451, 0, 1, 1,
0.5092568, -1.207778, 4.173621, 0.09019608, 0, 1, 1,
0.5094001, 0.2878495, 1.483429, 0.09803922, 0, 1, 1,
0.5098961, -0.9437938, 2.907639, 0.1058824, 0, 1, 1,
0.5172339, -0.897749, 0.9787986, 0.1098039, 0, 1, 1,
0.5216895, 0.2893976, -0.03826101, 0.1176471, 0, 1, 1,
0.527138, -0.9234859, 2.722957, 0.1215686, 0, 1, 1,
0.5276303, 0.2710274, 0.09923644, 0.1294118, 0, 1, 1,
0.5330912, 1.998419, -0.5897879, 0.1333333, 0, 1, 1,
0.5365763, 0.1152328, 1.568386, 0.1411765, 0, 1, 1,
0.5407242, -0.1010581, 1.688311, 0.145098, 0, 1, 1,
0.5440401, -0.9249948, 3.319434, 0.1529412, 0, 1, 1,
0.5469633, 1.107772, 0.46752, 0.1568628, 0, 1, 1,
0.5564491, 0.9713144, 0.2004029, 0.1647059, 0, 1, 1,
0.5574874, 0.7212401, 2.700846, 0.1686275, 0, 1, 1,
0.5596448, -1.55879, 4.805488, 0.1764706, 0, 1, 1,
0.5635143, -0.08950081, 2.675057, 0.1803922, 0, 1, 1,
0.5658624, 1.02026, 1.589402, 0.1882353, 0, 1, 1,
0.5746127, 1.682153, -0.003749723, 0.1921569, 0, 1, 1,
0.5746989, 0.05679862, 2.809403, 0.2, 0, 1, 1,
0.5768734, -0.3916991, 1.791011, 0.2078431, 0, 1, 1,
0.5773883, -0.09933694, 1.784202, 0.2117647, 0, 1, 1,
0.5798241, 0.1947064, 1.406101, 0.2196078, 0, 1, 1,
0.5815721, 0.6469479, 0.4665298, 0.2235294, 0, 1, 1,
0.5831842, -0.4476719, 1.035057, 0.2313726, 0, 1, 1,
0.5842724, -1.226897, 1.669636, 0.2352941, 0, 1, 1,
0.5852296, -0.8972608, 5.081552, 0.2431373, 0, 1, 1,
0.596192, -2.212017, 2.222994, 0.2470588, 0, 1, 1,
0.5963871, 0.4993826, 1.470016, 0.254902, 0, 1, 1,
0.5964885, -0.4067925, 3.092498, 0.2588235, 0, 1, 1,
0.5986996, -1.106396, 1.276551, 0.2666667, 0, 1, 1,
0.605431, -0.5935429, 2.525944, 0.2705882, 0, 1, 1,
0.605867, -0.1549873, 0.2647183, 0.2784314, 0, 1, 1,
0.6118755, 0.1712733, 1.308202, 0.282353, 0, 1, 1,
0.6191444, 1.021798, -0.4624509, 0.2901961, 0, 1, 1,
0.6205461, -1.144272, 3.108728, 0.2941177, 0, 1, 1,
0.6218442, 0.9201909, -0.8337672, 0.3019608, 0, 1, 1,
0.6233129, -0.6222116, 1.35944, 0.3098039, 0, 1, 1,
0.6261922, 0.973546, 0.06974282, 0.3137255, 0, 1, 1,
0.6292052, 0.9897628, 1.767667, 0.3215686, 0, 1, 1,
0.6314475, -0.6989493, 2.202264, 0.3254902, 0, 1, 1,
0.634593, -0.3917795, 1.874192, 0.3333333, 0, 1, 1,
0.6380252, 0.5683347, 0.1979515, 0.3372549, 0, 1, 1,
0.6424617, -0.1871555, 2.337747, 0.345098, 0, 1, 1,
0.6439601, 0.4191782, 0.08377603, 0.3490196, 0, 1, 1,
0.6463921, 1.631587, 2.045598, 0.3568628, 0, 1, 1,
0.6570667, -1.594329, 2.945976, 0.3607843, 0, 1, 1,
0.6592346, 0.1978187, 0.6161308, 0.3686275, 0, 1, 1,
0.6614212, -1.103161, 1.608124, 0.372549, 0, 1, 1,
0.6671708, -1.132452, 2.865347, 0.3803922, 0, 1, 1,
0.6681535, -1.23517, 3.519837, 0.3843137, 0, 1, 1,
0.6692692, -0.9592931, 1.917728, 0.3921569, 0, 1, 1,
0.6732097, -0.13822, 0.3609055, 0.3960784, 0, 1, 1,
0.6786052, -0.944613, 2.717185, 0.4039216, 0, 1, 1,
0.6817946, -2.108514, 2.945467, 0.4117647, 0, 1, 1,
0.6843979, 0.4906499, 1.799846, 0.4156863, 0, 1, 1,
0.6854317, 1.131328, -0.05177487, 0.4235294, 0, 1, 1,
0.6892977, -0.532343, 3.1994, 0.427451, 0, 1, 1,
0.690618, 0.3386065, -0.563599, 0.4352941, 0, 1, 1,
0.6916521, -1.027622, 4.343493, 0.4392157, 0, 1, 1,
0.6999185, 0.2362671, 2.98402, 0.4470588, 0, 1, 1,
0.7084135, -0.9235152, 1.885265, 0.4509804, 0, 1, 1,
0.7096715, -0.004840165, 2.181723, 0.4588235, 0, 1, 1,
0.7108216, 0.7469772, 1.279947, 0.4627451, 0, 1, 1,
0.7153571, 0.7686214, 1.665812, 0.4705882, 0, 1, 1,
0.7162479, 0.5521704, 0.6676487, 0.4745098, 0, 1, 1,
0.7174227, 1.183842, 0.5096172, 0.4823529, 0, 1, 1,
0.7194008, -0.5461943, 2.711053, 0.4862745, 0, 1, 1,
0.7277231, -1.587104, 3.188376, 0.4941176, 0, 1, 1,
0.7278336, 0.3331283, 3.145363, 0.5019608, 0, 1, 1,
0.7283853, -2.261104, 3.087302, 0.5058824, 0, 1, 1,
0.7284836, 0.2161475, 0.04401687, 0.5137255, 0, 1, 1,
0.7291992, 1.833068, 2.020168, 0.5176471, 0, 1, 1,
0.7296504, 0.5631255, 1.826497, 0.5254902, 0, 1, 1,
0.7394627, 0.5313388, -0.09611149, 0.5294118, 0, 1, 1,
0.7423494, -0.1687211, 2.058422, 0.5372549, 0, 1, 1,
0.7441053, -0.3278596, 1.731357, 0.5411765, 0, 1, 1,
0.7497991, 1.067254, 1.44636, 0.5490196, 0, 1, 1,
0.7503073, 0.3484958, 1.270784, 0.5529412, 0, 1, 1,
0.754964, 0.5145281, 0.5126289, 0.5607843, 0, 1, 1,
0.7561277, -0.2425493, 1.868091, 0.5647059, 0, 1, 1,
0.7561824, 2.277428, 0.9552786, 0.572549, 0, 1, 1,
0.7591052, 0.5875408, 0.4663379, 0.5764706, 0, 1, 1,
0.7600035, -0.04354874, 2.816684, 0.5843138, 0, 1, 1,
0.7624984, 2.113366, 0.09718639, 0.5882353, 0, 1, 1,
0.7632779, -0.7749667, 0.6339969, 0.5960785, 0, 1, 1,
0.7643076, 0.8519756, 0.580049, 0.6039216, 0, 1, 1,
0.7687761, 0.003954926, 3.181054, 0.6078432, 0, 1, 1,
0.7696387, 0.5037031, -0.06898622, 0.6156863, 0, 1, 1,
0.7710831, -1.526916, 1.818775, 0.6196079, 0, 1, 1,
0.7714041, 0.01751752, 2.492213, 0.627451, 0, 1, 1,
0.7720408, -0.1493119, 2.939554, 0.6313726, 0, 1, 1,
0.7737991, -0.6265337, 2.782759, 0.6392157, 0, 1, 1,
0.7764693, 0.5186195, -0.851923, 0.6431373, 0, 1, 1,
0.7769845, -0.756134, 3.434849, 0.6509804, 0, 1, 1,
0.7772117, -0.7442343, 2.541307, 0.654902, 0, 1, 1,
0.7774675, -1.780703, 2.889096, 0.6627451, 0, 1, 1,
0.7789034, -1.600133, 2.978616, 0.6666667, 0, 1, 1,
0.7803164, -0.6220405, 1.761884, 0.6745098, 0, 1, 1,
0.7869959, -0.4610885, -0.6461539, 0.6784314, 0, 1, 1,
0.7894087, -0.7867071, 2.427617, 0.6862745, 0, 1, 1,
0.8070773, 0.9320551, 1.181461, 0.6901961, 0, 1, 1,
0.8072268, -1.069214, 1.617243, 0.6980392, 0, 1, 1,
0.8072648, 1.07784, 0.9185136, 0.7058824, 0, 1, 1,
0.8119709, -0.1406778, 3.006955, 0.7098039, 0, 1, 1,
0.8152829, 0.5159703, 2.182638, 0.7176471, 0, 1, 1,
0.8257993, 2.455494, -0.4093739, 0.7215686, 0, 1, 1,
0.8259485, 0.03711598, 2.125784, 0.7294118, 0, 1, 1,
0.8285737, -1.569162, 1.816916, 0.7333333, 0, 1, 1,
0.8317503, -0.6264382, 1.854635, 0.7411765, 0, 1, 1,
0.8352003, -1.18522, 2.327642, 0.7450981, 0, 1, 1,
0.8371607, 0.6723418, 1.677646, 0.7529412, 0, 1, 1,
0.8422932, -0.4264248, 3.687866, 0.7568628, 0, 1, 1,
0.8484421, 0.8766561, 1.974542, 0.7647059, 0, 1, 1,
0.8557421, 0.8368945, 2.283886, 0.7686275, 0, 1, 1,
0.8599443, 0.03354809, 1.017683, 0.7764706, 0, 1, 1,
0.8715317, -0.4929642, 2.561682, 0.7803922, 0, 1, 1,
0.8753557, 0.6643656, -0.2010186, 0.7882353, 0, 1, 1,
0.8777965, -1.079455, 3.303957, 0.7921569, 0, 1, 1,
0.8879648, -0.8423122, 3.429896, 0.8, 0, 1, 1,
0.8890331, -0.04504734, 1.6858, 0.8078431, 0, 1, 1,
0.8914548, -2.31809, 1.437995, 0.8117647, 0, 1, 1,
0.8967498, -0.6602086, 0.7684178, 0.8196079, 0, 1, 1,
0.8978037, 0.07523862, 0.02071352, 0.8235294, 0, 1, 1,
0.8985091, 0.9583111, 0.9961264, 0.8313726, 0, 1, 1,
0.9041579, -1.52566, 1.373474, 0.8352941, 0, 1, 1,
0.9051442, 0.5658523, 2.073117, 0.8431373, 0, 1, 1,
0.9105175, -1.110416, 3.98732, 0.8470588, 0, 1, 1,
0.9145319, -0.5279418, 2.493001, 0.854902, 0, 1, 1,
0.9204925, -1.474045, 1.96057, 0.8588235, 0, 1, 1,
0.9258542, -0.6633526, 0.5269781, 0.8666667, 0, 1, 1,
0.927828, 1.043143, 1.513409, 0.8705882, 0, 1, 1,
0.9304113, -0.8211373, 1.801958, 0.8784314, 0, 1, 1,
0.9304126, -0.893331, 3.225617, 0.8823529, 0, 1, 1,
0.9362711, -1.233889, 1.697567, 0.8901961, 0, 1, 1,
0.9381567, 0.1351079, 0.34711, 0.8941177, 0, 1, 1,
0.9429949, -0.3863285, 2.814812, 0.9019608, 0, 1, 1,
0.9609255, 0.1700516, 1.772466, 0.9098039, 0, 1, 1,
0.9660065, 0.8505144, 2.569393, 0.9137255, 0, 1, 1,
0.9664775, -0.3389487, -0.1455728, 0.9215686, 0, 1, 1,
0.9714466, 0.5159101, 2.391292, 0.9254902, 0, 1, 1,
0.9738754, 0.6890724, -0.009271749, 0.9333333, 0, 1, 1,
0.9768329, -0.09886445, 1.002538, 0.9372549, 0, 1, 1,
0.9812856, 1.385799, 0.7698619, 0.945098, 0, 1, 1,
0.9831475, 1.764368, -0.1981285, 0.9490196, 0, 1, 1,
0.9837856, -1.358087, 2.550699, 0.9568627, 0, 1, 1,
0.9844766, -1.315956, 3.444904, 0.9607843, 0, 1, 1,
0.9852369, -0.3841361, 1.069612, 0.9686275, 0, 1, 1,
0.9914522, -1.207389, 3.669699, 0.972549, 0, 1, 1,
0.9916981, 0.1475906, -0.4999605, 0.9803922, 0, 1, 1,
0.9919602, -0.418881, 2.279756, 0.9843137, 0, 1, 1,
0.9929591, -0.4065854, 2.30243, 0.9921569, 0, 1, 1,
0.9967563, -1.20301, 2.261642, 0.9960784, 0, 1, 1,
1.001521, 0.9377838, -0.8324834, 1, 0, 0.9960784, 1,
1.001699, -0.7095942, 1.811018, 1, 0, 0.9882353, 1,
1.009895, 0.4829795, -0.4738097, 1, 0, 0.9843137, 1,
1.018652, -0.9801663, 0.5646316, 1, 0, 0.9764706, 1,
1.024705, 1.281905, 0.7244801, 1, 0, 0.972549, 1,
1.030857, 0.5331741, 1.670475, 1, 0, 0.9647059, 1,
1.043839, -0.3387376, 1.493814, 1, 0, 0.9607843, 1,
1.057917, -0.4748417, 1.901356, 1, 0, 0.9529412, 1,
1.058503, -0.351111, 1.222722, 1, 0, 0.9490196, 1,
1.062659, -0.998418, 2.072388, 1, 0, 0.9411765, 1,
1.072909, -0.8862681, 3.464206, 1, 0, 0.9372549, 1,
1.073718, 0.7281578, 1.205568, 1, 0, 0.9294118, 1,
1.075242, -0.9333987, 2.873737, 1, 0, 0.9254902, 1,
1.076684, 1.570294, -0.590322, 1, 0, 0.9176471, 1,
1.077395, 1.623772, -1.242236, 1, 0, 0.9137255, 1,
1.079141, 0.8205677, 2.635911, 1, 0, 0.9058824, 1,
1.082665, -1.035367, 2.220719, 1, 0, 0.9019608, 1,
1.090302, 0.1071805, 1.00457, 1, 0, 0.8941177, 1,
1.090629, 0.04698292, 0.6430942, 1, 0, 0.8862745, 1,
1.095002, -0.5014234, 2.367096, 1, 0, 0.8823529, 1,
1.097293, 0.5807005, -0.3120974, 1, 0, 0.8745098, 1,
1.097475, 0.4895024, 3.015664, 1, 0, 0.8705882, 1,
1.10604, -1.298269, 2.976825, 1, 0, 0.8627451, 1,
1.110367, 0.1825121, 3.152901, 1, 0, 0.8588235, 1,
1.114437, -0.7316, 2.45621, 1, 0, 0.8509804, 1,
1.115609, 1.369275, -0.004659315, 1, 0, 0.8470588, 1,
1.116051, -0.2084571, 0.9660777, 1, 0, 0.8392157, 1,
1.116094, -0.459085, 0.5134968, 1, 0, 0.8352941, 1,
1.12084, -0.03518855, 0.3436485, 1, 0, 0.827451, 1,
1.123454, 0.4685214, 3.127655, 1, 0, 0.8235294, 1,
1.12375, 1.593914, 0.3998848, 1, 0, 0.8156863, 1,
1.128753, -0.2208156, 2.609244, 1, 0, 0.8117647, 1,
1.133528, 0.09393068, 0.5441352, 1, 0, 0.8039216, 1,
1.136398, -0.2548352, 1.817119, 1, 0, 0.7960784, 1,
1.138127, 0.1737291, 3.03128, 1, 0, 0.7921569, 1,
1.139952, -0.8574001, 1.558321, 1, 0, 0.7843137, 1,
1.147164, -1.783442, 2.069009, 1, 0, 0.7803922, 1,
1.147469, 0.2216478, 0.9660354, 1, 0, 0.772549, 1,
1.154189, 0.9871059, 0.5257021, 1, 0, 0.7686275, 1,
1.169371, -0.6908517, 3.575365, 1, 0, 0.7607843, 1,
1.177996, -1.081363, 2.09201, 1, 0, 0.7568628, 1,
1.180164, 0.2643509, 0.7648801, 1, 0, 0.7490196, 1,
1.180958, 0.6489521, 2.066961, 1, 0, 0.7450981, 1,
1.187624, 0.8796664, 0.9152842, 1, 0, 0.7372549, 1,
1.193237, 0.1129203, 2.377005, 1, 0, 0.7333333, 1,
1.196221, 0.6400374, 1.574689, 1, 0, 0.7254902, 1,
1.196852, -0.6321352, 2.045915, 1, 0, 0.7215686, 1,
1.198258, -0.1979887, 0.5428942, 1, 0, 0.7137255, 1,
1.209753, -0.8106145, 3.340231, 1, 0, 0.7098039, 1,
1.226781, -0.7607382, 3.402838, 1, 0, 0.7019608, 1,
1.232602, -0.3140453, 2.838606, 1, 0, 0.6941177, 1,
1.24, 0.7932664, 1.121281, 1, 0, 0.6901961, 1,
1.24228, 0.1226718, 2.425838, 1, 0, 0.682353, 1,
1.242813, -0.9551899, 2.387702, 1, 0, 0.6784314, 1,
1.249083, 0.3618055, 2.451138, 1, 0, 0.6705883, 1,
1.249709, 0.01958994, 1.828738, 1, 0, 0.6666667, 1,
1.253744, 1.492558, 1.154112, 1, 0, 0.6588235, 1,
1.259604, -0.6557516, 1.769164, 1, 0, 0.654902, 1,
1.261415, 1.429226, 1.478167, 1, 0, 0.6470588, 1,
1.262107, 1.049673, -0.2088191, 1, 0, 0.6431373, 1,
1.262309, 2.087668, 0.7572244, 1, 0, 0.6352941, 1,
1.265462, 1.03647, 2.037487, 1, 0, 0.6313726, 1,
1.268445, 0.3792053, 0.7993922, 1, 0, 0.6235294, 1,
1.272479, 0.4623377, 1.672294, 1, 0, 0.6196079, 1,
1.282049, -0.1706405, 1.644298, 1, 0, 0.6117647, 1,
1.304302, 0.6821092, 2.169591, 1, 0, 0.6078432, 1,
1.307393, -0.1828809, 1.209359, 1, 0, 0.6, 1,
1.334511, 0.1716097, 1.429939, 1, 0, 0.5921569, 1,
1.343854, -0.4664799, 2.109422, 1, 0, 0.5882353, 1,
1.3455, 1.053582, 0.2681723, 1, 0, 0.5803922, 1,
1.347352, 1.685055, 0.2362796, 1, 0, 0.5764706, 1,
1.34776, -0.06278042, 1.920532, 1, 0, 0.5686275, 1,
1.349837, -0.3434625, -0.02924788, 1, 0, 0.5647059, 1,
1.353488, -1.527298, 3.018538, 1, 0, 0.5568628, 1,
1.357604, -1.976875, 3.874364, 1, 0, 0.5529412, 1,
1.362437, 1.740455, 1.236317, 1, 0, 0.5450981, 1,
1.364161, -0.1201477, 2.753928, 1, 0, 0.5411765, 1,
1.365652, -0.6144195, -0.2667138, 1, 0, 0.5333334, 1,
1.367437, -0.3996795, 1.87115, 1, 0, 0.5294118, 1,
1.377293, 1.060605, 0.5024722, 1, 0, 0.5215687, 1,
1.390406, 0.4574843, 0.4692713, 1, 0, 0.5176471, 1,
1.410844, -1.151297, 3.237934, 1, 0, 0.509804, 1,
1.41826, -0.9094318, 2.003894, 1, 0, 0.5058824, 1,
1.420238, 0.01478262, 1.537758, 1, 0, 0.4980392, 1,
1.421124, 0.8212479, 0.119649, 1, 0, 0.4901961, 1,
1.421836, -0.4749946, 2.247329, 1, 0, 0.4862745, 1,
1.423009, -1.235548, 0.6315064, 1, 0, 0.4784314, 1,
1.430592, 0.1899584, 1.065883, 1, 0, 0.4745098, 1,
1.434152, -1.263546, 2.861327, 1, 0, 0.4666667, 1,
1.439443, -0.08365534, 1.243295, 1, 0, 0.4627451, 1,
1.445806, 0.2245095, 2.302428, 1, 0, 0.454902, 1,
1.448177, -0.5700254, 1.022666, 1, 0, 0.4509804, 1,
1.459861, 1.093827, 0.5896432, 1, 0, 0.4431373, 1,
1.474127, -0.8630976, 1.558506, 1, 0, 0.4392157, 1,
1.478754, -0.1458488, 0.32367, 1, 0, 0.4313726, 1,
1.482624, 0.7323585, 1.548146, 1, 0, 0.427451, 1,
1.485489, -0.5145718, 2.550721, 1, 0, 0.4196078, 1,
1.50142, -0.65153, 1.342901, 1, 0, 0.4156863, 1,
1.502195, 0.2028046, 2.165492, 1, 0, 0.4078431, 1,
1.502586, -1.556412, 2.46475, 1, 0, 0.4039216, 1,
1.514279, -1.574785, 0.9963263, 1, 0, 0.3960784, 1,
1.523133, -1.367819, 3.071455, 1, 0, 0.3882353, 1,
1.523702, -0.2209607, 0.9104922, 1, 0, 0.3843137, 1,
1.529319, -0.1393497, 1.069792, 1, 0, 0.3764706, 1,
1.532404, 0.3543855, 2.392172, 1, 0, 0.372549, 1,
1.536333, -2.402795, 3.302902, 1, 0, 0.3647059, 1,
1.549182, -0.35847, 0.8277176, 1, 0, 0.3607843, 1,
1.558682, 0.7939937, 1.443385, 1, 0, 0.3529412, 1,
1.577412, -0.06195475, 2.339981, 1, 0, 0.3490196, 1,
1.579232, 0.9767582, -0.4449238, 1, 0, 0.3411765, 1,
1.596788, -0.5198367, 3.523708, 1, 0, 0.3372549, 1,
1.611689, -0.6446629, 1.622841, 1, 0, 0.3294118, 1,
1.617091, 1.158141, -0.9546947, 1, 0, 0.3254902, 1,
1.63123, 0.9387174, -0.4677507, 1, 0, 0.3176471, 1,
1.63642, 0.01794508, 2.832632, 1, 0, 0.3137255, 1,
1.64604, 0.7469419, 1.493884, 1, 0, 0.3058824, 1,
1.649364, -0.2799781, 1.23322, 1, 0, 0.2980392, 1,
1.651966, -0.05161869, 1.764106, 1, 0, 0.2941177, 1,
1.656061, -1.018418, 3.063133, 1, 0, 0.2862745, 1,
1.663611, 1.134223, 1.210364, 1, 0, 0.282353, 1,
1.686232, 0.08719834, 2.377495, 1, 0, 0.2745098, 1,
1.699023, -1.389751, 2.333898, 1, 0, 0.2705882, 1,
1.70173, -1.539361, 3.192098, 1, 0, 0.2627451, 1,
1.719464, -0.4750145, -0.05828851, 1, 0, 0.2588235, 1,
1.724408, -0.8987765, 3.189571, 1, 0, 0.2509804, 1,
1.743324, -0.5014815, 2.268712, 1, 0, 0.2470588, 1,
1.75289, -1.01094, 1.437248, 1, 0, 0.2392157, 1,
1.754782, -1.08823, 1.551457, 1, 0, 0.2352941, 1,
1.75852, -0.4996733, 1.788197, 1, 0, 0.227451, 1,
1.759213, -1.595211, 1.041374, 1, 0, 0.2235294, 1,
1.760145, -0.03746065, 1.457064, 1, 0, 0.2156863, 1,
1.763753, 0.7980126, 0.1642317, 1, 0, 0.2117647, 1,
1.804629, 0.1417589, 1.591869, 1, 0, 0.2039216, 1,
1.825323, -0.03806666, 0.23353, 1, 0, 0.1960784, 1,
1.859017, -0.4455625, 2.320641, 1, 0, 0.1921569, 1,
1.860699, 1.045888, 0.001498425, 1, 0, 0.1843137, 1,
1.861597, 2.842659, 1.003759, 1, 0, 0.1803922, 1,
1.862279, -0.4400249, 2.492956, 1, 0, 0.172549, 1,
1.864103, 0.006368593, 1.187866, 1, 0, 0.1686275, 1,
1.876312, 0.2034934, 2.97909, 1, 0, 0.1607843, 1,
1.876743, 1.035438, 0.1387687, 1, 0, 0.1568628, 1,
1.878328, 0.5609533, 1.532204, 1, 0, 0.1490196, 1,
1.888739, 0.5431221, 0.5926505, 1, 0, 0.145098, 1,
1.938492, -0.1475765, 1.740355, 1, 0, 0.1372549, 1,
1.958056, -0.5410417, 1.890849, 1, 0, 0.1333333, 1,
1.983712, -0.9598334, 3.019892, 1, 0, 0.1254902, 1,
1.99081, 1.184816, 1.727353, 1, 0, 0.1215686, 1,
2.039559, 0.9578899, 1.162858, 1, 0, 0.1137255, 1,
2.052591, 0.5527187, 1.248605, 1, 0, 0.1098039, 1,
2.053934, -0.182618, 0.2959533, 1, 0, 0.1019608, 1,
2.065037, 0.727515, 0.5399212, 1, 0, 0.09411765, 1,
2.071124, -1.329784, 3.9911, 1, 0, 0.09019608, 1,
2.147108, -0.7940382, 2.449667, 1, 0, 0.08235294, 1,
2.165212, 0.2529804, 3.781947, 1, 0, 0.07843138, 1,
2.16986, -0.6012176, 1.709206, 1, 0, 0.07058824, 1,
2.202949, 1.272882, 0.8732882, 1, 0, 0.06666667, 1,
2.229436, 0.4704821, 2.413121, 1, 0, 0.05882353, 1,
2.282242, 0.2004843, 1.037596, 1, 0, 0.05490196, 1,
2.288472, -0.001266114, 1.502482, 1, 0, 0.04705882, 1,
2.289717, 0.1265752, 1.099188, 1, 0, 0.04313726, 1,
2.328529, -0.2313605, 3.394873, 1, 0, 0.03529412, 1,
2.560316, -0.07016157, 1.320179, 1, 0, 0.03137255, 1,
2.641606, -0.3422925, 1.415891, 1, 0, 0.02352941, 1,
2.642867, 0.2685959, 1.038685, 1, 0, 0.01960784, 1,
2.81032, -1.682048, 2.185071, 1, 0, 0.01176471, 1,
3.32814, 1.090427, 1.790464, 1, 0, 0.007843138, 1
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
0.2904338, -4.660389, -7.070534, 0, -0.5, 0.5, 0.5,
0.2904338, -4.660389, -7.070534, 1, -0.5, 0.5, 0.5,
0.2904338, -4.660389, -7.070534, 1, 1.5, 0.5, 0.5,
0.2904338, -4.660389, -7.070534, 0, 1.5, 0.5, 0.5
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
-3.777055, -0.2657654, -7.070534, 0, -0.5, 0.5, 0.5,
-3.777055, -0.2657654, -7.070534, 1, -0.5, 0.5, 0.5,
-3.777055, -0.2657654, -7.070534, 1, 1.5, 0.5, 0.5,
-3.777055, -0.2657654, -7.070534, 0, 1.5, 0.5, 0.5
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
-3.777055, -4.660389, 0.4311466, 0, -0.5, 0.5, 0.5,
-3.777055, -4.660389, 0.4311466, 1, -0.5, 0.5, 0.5,
-3.777055, -4.660389, 0.4311466, 1, 1.5, 0.5, 0.5,
-3.777055, -4.660389, 0.4311466, 0, 1.5, 0.5, 0.5
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
-2, -3.646245, -5.339377,
3, -3.646245, -5.339377,
-2, -3.646245, -5.339377,
-2, -3.815269, -5.627903,
-1, -3.646245, -5.339377,
-1, -3.815269, -5.627903,
0, -3.646245, -5.339377,
0, -3.815269, -5.627903,
1, -3.646245, -5.339377,
1, -3.815269, -5.627903,
2, -3.646245, -5.339377,
2, -3.815269, -5.627903,
3, -3.646245, -5.339377,
3, -3.815269, -5.627903
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
-2, -4.153317, -6.204955, 0, -0.5, 0.5, 0.5,
-2, -4.153317, -6.204955, 1, -0.5, 0.5, 0.5,
-2, -4.153317, -6.204955, 1, 1.5, 0.5, 0.5,
-2, -4.153317, -6.204955, 0, 1.5, 0.5, 0.5,
-1, -4.153317, -6.204955, 0, -0.5, 0.5, 0.5,
-1, -4.153317, -6.204955, 1, -0.5, 0.5, 0.5,
-1, -4.153317, -6.204955, 1, 1.5, 0.5, 0.5,
-1, -4.153317, -6.204955, 0, 1.5, 0.5, 0.5,
0, -4.153317, -6.204955, 0, -0.5, 0.5, 0.5,
0, -4.153317, -6.204955, 1, -0.5, 0.5, 0.5,
0, -4.153317, -6.204955, 1, 1.5, 0.5, 0.5,
0, -4.153317, -6.204955, 0, 1.5, 0.5, 0.5,
1, -4.153317, -6.204955, 0, -0.5, 0.5, 0.5,
1, -4.153317, -6.204955, 1, -0.5, 0.5, 0.5,
1, -4.153317, -6.204955, 1, 1.5, 0.5, 0.5,
1, -4.153317, -6.204955, 0, 1.5, 0.5, 0.5,
2, -4.153317, -6.204955, 0, -0.5, 0.5, 0.5,
2, -4.153317, -6.204955, 1, -0.5, 0.5, 0.5,
2, -4.153317, -6.204955, 1, 1.5, 0.5, 0.5,
2, -4.153317, -6.204955, 0, 1.5, 0.5, 0.5,
3, -4.153317, -6.204955, 0, -0.5, 0.5, 0.5,
3, -4.153317, -6.204955, 1, -0.5, 0.5, 0.5,
3, -4.153317, -6.204955, 1, 1.5, 0.5, 0.5,
3, -4.153317, -6.204955, 0, 1.5, 0.5, 0.5
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
-2.838403, -3, -5.339377,
-2.838403, 3, -5.339377,
-2.838403, -3, -5.339377,
-2.994845, -3, -5.627903,
-2.838403, -2, -5.339377,
-2.994845, -2, -5.627903,
-2.838403, -1, -5.339377,
-2.994845, -1, -5.627903,
-2.838403, 0, -5.339377,
-2.994845, 0, -5.627903,
-2.838403, 1, -5.339377,
-2.994845, 1, -5.627903,
-2.838403, 2, -5.339377,
-2.994845, 2, -5.627903,
-2.838403, 3, -5.339377,
-2.994845, 3, -5.627903
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
-3.307729, -3, -6.204955, 0, -0.5, 0.5, 0.5,
-3.307729, -3, -6.204955, 1, -0.5, 0.5, 0.5,
-3.307729, -3, -6.204955, 1, 1.5, 0.5, 0.5,
-3.307729, -3, -6.204955, 0, 1.5, 0.5, 0.5,
-3.307729, -2, -6.204955, 0, -0.5, 0.5, 0.5,
-3.307729, -2, -6.204955, 1, -0.5, 0.5, 0.5,
-3.307729, -2, -6.204955, 1, 1.5, 0.5, 0.5,
-3.307729, -2, -6.204955, 0, 1.5, 0.5, 0.5,
-3.307729, -1, -6.204955, 0, -0.5, 0.5, 0.5,
-3.307729, -1, -6.204955, 1, -0.5, 0.5, 0.5,
-3.307729, -1, -6.204955, 1, 1.5, 0.5, 0.5,
-3.307729, -1, -6.204955, 0, 1.5, 0.5, 0.5,
-3.307729, 0, -6.204955, 0, -0.5, 0.5, 0.5,
-3.307729, 0, -6.204955, 1, -0.5, 0.5, 0.5,
-3.307729, 0, -6.204955, 1, 1.5, 0.5, 0.5,
-3.307729, 0, -6.204955, 0, 1.5, 0.5, 0.5,
-3.307729, 1, -6.204955, 0, -0.5, 0.5, 0.5,
-3.307729, 1, -6.204955, 1, -0.5, 0.5, 0.5,
-3.307729, 1, -6.204955, 1, 1.5, 0.5, 0.5,
-3.307729, 1, -6.204955, 0, 1.5, 0.5, 0.5,
-3.307729, 2, -6.204955, 0, -0.5, 0.5, 0.5,
-3.307729, 2, -6.204955, 1, -0.5, 0.5, 0.5,
-3.307729, 2, -6.204955, 1, 1.5, 0.5, 0.5,
-3.307729, 2, -6.204955, 0, 1.5, 0.5, 0.5,
-3.307729, 3, -6.204955, 0, -0.5, 0.5, 0.5,
-3.307729, 3, -6.204955, 1, -0.5, 0.5, 0.5,
-3.307729, 3, -6.204955, 1, 1.5, 0.5, 0.5,
-3.307729, 3, -6.204955, 0, 1.5, 0.5, 0.5
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
-2.838403, -3.646245, -4,
-2.838403, -3.646245, 6,
-2.838403, -3.646245, -4,
-2.994845, -3.815269, -4,
-2.838403, -3.646245, -2,
-2.994845, -3.815269, -2,
-2.838403, -3.646245, 0,
-2.994845, -3.815269, 0,
-2.838403, -3.646245, 2,
-2.994845, -3.815269, 2,
-2.838403, -3.646245, 4,
-2.994845, -3.815269, 4,
-2.838403, -3.646245, 6,
-2.994845, -3.815269, 6
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
"4",
"6"
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
-3.307729, -4.153317, -4, 0, -0.5, 0.5, 0.5,
-3.307729, -4.153317, -4, 1, -0.5, 0.5, 0.5,
-3.307729, -4.153317, -4, 1, 1.5, 0.5, 0.5,
-3.307729, -4.153317, -4, 0, 1.5, 0.5, 0.5,
-3.307729, -4.153317, -2, 0, -0.5, 0.5, 0.5,
-3.307729, -4.153317, -2, 1, -0.5, 0.5, 0.5,
-3.307729, -4.153317, -2, 1, 1.5, 0.5, 0.5,
-3.307729, -4.153317, -2, 0, 1.5, 0.5, 0.5,
-3.307729, -4.153317, 0, 0, -0.5, 0.5, 0.5,
-3.307729, -4.153317, 0, 1, -0.5, 0.5, 0.5,
-3.307729, -4.153317, 0, 1, 1.5, 0.5, 0.5,
-3.307729, -4.153317, 0, 0, 1.5, 0.5, 0.5,
-3.307729, -4.153317, 2, 0, -0.5, 0.5, 0.5,
-3.307729, -4.153317, 2, 1, -0.5, 0.5, 0.5,
-3.307729, -4.153317, 2, 1, 1.5, 0.5, 0.5,
-3.307729, -4.153317, 2, 0, 1.5, 0.5, 0.5,
-3.307729, -4.153317, 4, 0, -0.5, 0.5, 0.5,
-3.307729, -4.153317, 4, 1, -0.5, 0.5, 0.5,
-3.307729, -4.153317, 4, 1, 1.5, 0.5, 0.5,
-3.307729, -4.153317, 4, 0, 1.5, 0.5, 0.5,
-3.307729, -4.153317, 6, 0, -0.5, 0.5, 0.5,
-3.307729, -4.153317, 6, 1, -0.5, 0.5, 0.5,
-3.307729, -4.153317, 6, 1, 1.5, 0.5, 0.5,
-3.307729, -4.153317, 6, 0, 1.5, 0.5, 0.5
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
-2.838403, -3.646245, -5.339377,
-2.838403, 3.114714, -5.339377,
-2.838403, -3.646245, 6.20167,
-2.838403, 3.114714, 6.20167,
-2.838403, -3.646245, -5.339377,
-2.838403, -3.646245, 6.20167,
-2.838403, 3.114714, -5.339377,
-2.838403, 3.114714, 6.20167,
-2.838403, -3.646245, -5.339377,
3.419271, -3.646245, -5.339377,
-2.838403, -3.646245, 6.20167,
3.419271, -3.646245, 6.20167,
-2.838403, 3.114714, -5.339377,
3.419271, 3.114714, -5.339377,
-2.838403, 3.114714, 6.20167,
3.419271, 3.114714, 6.20167,
3.419271, -3.646245, -5.339377,
3.419271, 3.114714, -5.339377,
3.419271, -3.646245, 6.20167,
3.419271, 3.114714, 6.20167,
3.419271, -3.646245, -5.339377,
3.419271, -3.646245, 6.20167,
3.419271, 3.114714, -5.339377,
3.419271, 3.114714, 6.20167
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
var radius = 7.885301;
var distance = 35.0826;
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
mvMatrix.translate( -0.2904338, 0.2657654, -0.4311466 );
mvMatrix.scale( 1.362446, 1.261026, 0.7387321 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.0826);
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
hexane<-read.table("hexane.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-hexane$V2
```

```
## Error in eval(expr, envir, enclos): object 'hexane' not found
```

```r
y<-hexane$V3
```

```
## Error in eval(expr, envir, enclos): object 'hexane' not found
```

```r
z<-hexane$V4
```

```
## Error in eval(expr, envir, enclos): object 'hexane' not found
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
-2.747272, 1.001594, -2.679654, 0, 0, 1, 1, 1,
-2.693263, 1.23598, -1.489492, 1, 0, 0, 1, 1,
-2.673429, -1.967204, -1.054683, 1, 0, 0, 1, 1,
-2.624059, -0.6597912, -0.9882348, 1, 0, 0, 1, 1,
-2.512038, 1.264187, -1.187334, 1, 0, 0, 1, 1,
-2.473252, -0.7245786, -3.948985, 1, 0, 0, 1, 1,
-2.449086, -0.01243495, -1.993284, 0, 0, 0, 1, 1,
-2.445149, 0.1266747, -1.183904, 0, 0, 0, 1, 1,
-2.395746, -1.493898, -1.367532, 0, 0, 0, 1, 1,
-2.381414, 0.3252616, 2.24515, 0, 0, 0, 1, 1,
-2.312408, 0.5142393, -3.169585, 0, 0, 0, 1, 1,
-2.179152, 0.247945, -2.494842, 0, 0, 0, 1, 1,
-2.177454, -0.3386052, -1.571774, 0, 0, 0, 1, 1,
-2.154096, -0.1505512, -3.053257, 1, 1, 1, 1, 1,
-2.122674, -1.640128, -1.776032, 1, 1, 1, 1, 1,
-2.120883, 1.414141, -1.27609, 1, 1, 1, 1, 1,
-2.109391, -1.389233, -3.262973, 1, 1, 1, 1, 1,
-2.061383, -0.1615985, -0.6290503, 1, 1, 1, 1, 1,
-2.048457, -0.4927703, -0.7876022, 1, 1, 1, 1, 1,
-2.044549, 0.5266467, -2.467209, 1, 1, 1, 1, 1,
-2.017616, 1.284759, -1.352962, 1, 1, 1, 1, 1,
-2.003553, -0.03439567, -1.414518, 1, 1, 1, 1, 1,
-1.985746, -1.104114, 0.04931869, 1, 1, 1, 1, 1,
-1.983082, -1.359841, -1.405702, 1, 1, 1, 1, 1,
-1.978941, 0.3511543, -2.079242, 1, 1, 1, 1, 1,
-1.847716, -1.308497, -2.092629, 1, 1, 1, 1, 1,
-1.785522, 0.5035411, -1.59625, 1, 1, 1, 1, 1,
-1.783833, -0.07739212, -1.945138, 1, 1, 1, 1, 1,
-1.776096, -1.384376, -4.081169, 0, 0, 1, 1, 1,
-1.766592, 1.088578, -1.068406, 1, 0, 0, 1, 1,
-1.744069, -1.363337, -3.559968, 1, 0, 0, 1, 1,
-1.693238, -1.225353, -0.1066884, 1, 0, 0, 1, 1,
-1.674915, -0.2411052, -1.133687, 1, 0, 0, 1, 1,
-1.662215, -0.09356257, 0.1748653, 1, 0, 0, 1, 1,
-1.662212, 0.2257712, -1.626438, 0, 0, 0, 1, 1,
-1.633477, 1.065868, -0.6884385, 0, 0, 0, 1, 1,
-1.62732, -1.997902, -1.906012, 0, 0, 0, 1, 1,
-1.611692, -0.1199203, -1.226954, 0, 0, 0, 1, 1,
-1.605143, -0.005065143, -2.111149, 0, 0, 0, 1, 1,
-1.597959, -0.1968598, -1.377068, 0, 0, 0, 1, 1,
-1.59035, 0.04301835, 0.02283344, 0, 0, 0, 1, 1,
-1.579942, 0.8072415, -1.71176, 1, 1, 1, 1, 1,
-1.570693, 0.7960435, -0.4054757, 1, 1, 1, 1, 1,
-1.565333, -1.04535, -2.263604, 1, 1, 1, 1, 1,
-1.557834, -0.402179, -1.059871, 1, 1, 1, 1, 1,
-1.551664, 0.6039044, -2.112393, 1, 1, 1, 1, 1,
-1.54873, -1.022725, -2.891626, 1, 1, 1, 1, 1,
-1.524227, -1.011585, -2.23619, 1, 1, 1, 1, 1,
-1.52055, 0.5424009, -1.57707, 1, 1, 1, 1, 1,
-1.511499, -0.4646645, -1.444637, 1, 1, 1, 1, 1,
-1.492363, 0.8859156, -1.505258, 1, 1, 1, 1, 1,
-1.487647, -0.3525559, -0.7690926, 1, 1, 1, 1, 1,
-1.485897, 1.104687, -0.3829077, 1, 1, 1, 1, 1,
-1.473181, -1.587367, -3.708977, 1, 1, 1, 1, 1,
-1.459178, -1.091733, -0.747093, 1, 1, 1, 1, 1,
-1.458773, -0.7039796, -1.311345, 1, 1, 1, 1, 1,
-1.451627, 1.115095, -1.637818, 0, 0, 1, 1, 1,
-1.450062, 0.4372871, -1.584863, 1, 0, 0, 1, 1,
-1.448293, 1.54566, -0.08100124, 1, 0, 0, 1, 1,
-1.447747, 1.207088, -0.8804403, 1, 0, 0, 1, 1,
-1.432606, 0.7545065, -2.636798, 1, 0, 0, 1, 1,
-1.416128, -0.2574421, -1.373421, 1, 0, 0, 1, 1,
-1.411584, 0.5107006, 0.8918968, 0, 0, 0, 1, 1,
-1.408052, 1.671322, -1.277128, 0, 0, 0, 1, 1,
-1.404667, -1.36311, -2.731801, 0, 0, 0, 1, 1,
-1.397504, -0.5825456, -2.371352, 0, 0, 0, 1, 1,
-1.392274, -1.2218, -2.432467, 0, 0, 0, 1, 1,
-1.389679, 0.7814296, -1.069583, 0, 0, 0, 1, 1,
-1.38032, 0.7127568, -1.197122, 0, 0, 0, 1, 1,
-1.377375, -0.3434823, -0.6099924, 1, 1, 1, 1, 1,
-1.376588, 1.606166, -1.960695, 1, 1, 1, 1, 1,
-1.361513, 0.3924817, -0.8886368, 1, 1, 1, 1, 1,
-1.353842, -1.239073, -2.90101, 1, 1, 1, 1, 1,
-1.345489, -0.5420741, -1.645482, 1, 1, 1, 1, 1,
-1.342558, -0.4267077, -3.047717, 1, 1, 1, 1, 1,
-1.340807, -0.7984878, -2.898257, 1, 1, 1, 1, 1,
-1.335247, 0.4858378, -0.1991275, 1, 1, 1, 1, 1,
-1.327673, 0.6005936, -1.483128, 1, 1, 1, 1, 1,
-1.327547, 1.241771, -1.122927, 1, 1, 1, 1, 1,
-1.315722, -1.387217, -1.337551, 1, 1, 1, 1, 1,
-1.308884, 0.4014708, -0.08971043, 1, 1, 1, 1, 1,
-1.30757, 0.8017923, 0.7790011, 1, 1, 1, 1, 1,
-1.294289, 0.1300188, -1.607833, 1, 1, 1, 1, 1,
-1.292375, 0.672843, -2.92064, 1, 1, 1, 1, 1,
-1.292206, -0.4888858, -2.911709, 0, 0, 1, 1, 1,
-1.28346, 0.6718886, 0.4470198, 1, 0, 0, 1, 1,
-1.28229, 1.444883, -0.1975783, 1, 0, 0, 1, 1,
-1.281951, -0.2045646, -0.1309025, 1, 0, 0, 1, 1,
-1.281617, -1.475238, -0.6565419, 1, 0, 0, 1, 1,
-1.280902, -0.05130313, -1.468277, 1, 0, 0, 1, 1,
-1.279969, 1.908456, 0.3617148, 0, 0, 0, 1, 1,
-1.279597, 0.3323387, -1.086986, 0, 0, 0, 1, 1,
-1.275448, 0.5620146, -1.264477, 0, 0, 0, 1, 1,
-1.25727, -0.2671767, -2.144459, 0, 0, 0, 1, 1,
-1.256516, -2.417693, -2.085583, 0, 0, 0, 1, 1,
-1.255159, 0.08076305, -1.250626, 0, 0, 0, 1, 1,
-1.25006, -0.2530298, -1.52561, 0, 0, 0, 1, 1,
-1.245016, -1.327247, -2.817102, 1, 1, 1, 1, 1,
-1.240103, 0.7406681, -1.457756, 1, 1, 1, 1, 1,
-1.236449, -0.1200617, -0.4862352, 1, 1, 1, 1, 1,
-1.23593, 0.5109848, -1.023978, 1, 1, 1, 1, 1,
-1.231755, -0.09640539, -1.474135, 1, 1, 1, 1, 1,
-1.229891, 1.460061, -0.1616331, 1, 1, 1, 1, 1,
-1.228385, -0.3976501, -0.2106282, 1, 1, 1, 1, 1,
-1.227721, -1.724624, -2.293504, 1, 1, 1, 1, 1,
-1.224222, -0.3472129, -3.207044, 1, 1, 1, 1, 1,
-1.221879, -0.3921652, -1.424262, 1, 1, 1, 1, 1,
-1.217258, -1.091551, -2.402324, 1, 1, 1, 1, 1,
-1.217216, 1.149057, -0.01687562, 1, 1, 1, 1, 1,
-1.215913, -0.7738562, -2.594846, 1, 1, 1, 1, 1,
-1.210111, 1.098314, -0.2714724, 1, 1, 1, 1, 1,
-1.209366, 0.07175856, -1.566769, 1, 1, 1, 1, 1,
-1.208828, 0.6283858, -0.8399292, 0, 0, 1, 1, 1,
-1.207539, 0.4496354, -0.8547493, 1, 0, 0, 1, 1,
-1.203158, -0.4461873, -2.085944, 1, 0, 0, 1, 1,
-1.19556, 1.156478, -2.955092, 1, 0, 0, 1, 1,
-1.191836, -0.9480783, -2.901862, 1, 0, 0, 1, 1,
-1.19072, 1.415675, 1.07162, 1, 0, 0, 1, 1,
-1.188213, -0.3906798, -3.173149, 0, 0, 0, 1, 1,
-1.185506, 0.2054859, -2.069592, 0, 0, 0, 1, 1,
-1.184234, 0.9395548, -3.013494, 0, 0, 0, 1, 1,
-1.182999, 2.342785, -0.8018961, 0, 0, 0, 1, 1,
-1.180003, -1.042725, -0.4276827, 0, 0, 0, 1, 1,
-1.173521, -1.194887, -3.512377, 0, 0, 0, 1, 1,
-1.166113, 0.6174645, -0.8087536, 0, 0, 0, 1, 1,
-1.157902, 0.9398353, -0.431085, 1, 1, 1, 1, 1,
-1.15554, 0.8430182, -2.361796, 1, 1, 1, 1, 1,
-1.145603, 0.5249949, -0.630105, 1, 1, 1, 1, 1,
-1.131623, 0.01138842, -1.939443, 1, 1, 1, 1, 1,
-1.130271, 1.298375, -1.237094, 1, 1, 1, 1, 1,
-1.127271, -0.696247, -0.7065668, 1, 1, 1, 1, 1,
-1.122527, -1.182309, -3.691277, 1, 1, 1, 1, 1,
-1.114472, 0.6342169, -0.5649461, 1, 1, 1, 1, 1,
-1.107145, -1.140754, -2.823794, 1, 1, 1, 1, 1,
-1.106118, 0.4648123, -1.888015, 1, 1, 1, 1, 1,
-1.100157, 0.2894708, -2.50696, 1, 1, 1, 1, 1,
-1.099675, 0.9299736, -0.8797151, 1, 1, 1, 1, 1,
-1.095736, 1.189403, -0.9594733, 1, 1, 1, 1, 1,
-1.093292, 0.3885854, 0.03181314, 1, 1, 1, 1, 1,
-1.092647, -1.000805, -3.172587, 1, 1, 1, 1, 1,
-1.088902, 0.4918614, -1.143724, 0, 0, 1, 1, 1,
-1.087245, -1.28354, -0.6154992, 1, 0, 0, 1, 1,
-1.086208, -1.930781, -2.310614, 1, 0, 0, 1, 1,
-1.071762, -0.002269085, -1.356943, 1, 0, 0, 1, 1,
-1.066827, -0.302446, -0.2219326, 1, 0, 0, 1, 1,
-1.063527, 1.340954, -0.1921289, 1, 0, 0, 1, 1,
-1.059421, 0.4116086, -2.815339, 0, 0, 0, 1, 1,
-1.058042, -1.434625, -3.950331, 0, 0, 0, 1, 1,
-1.053104, 0.6146971, -2.606243, 0, 0, 0, 1, 1,
-1.05131, 0.1111993, -0.584645, 0, 0, 0, 1, 1,
-1.036761, -0.9807119, -3.509082, 0, 0, 0, 1, 1,
-1.033435, -0.6437182, -1.366748, 0, 0, 0, 1, 1,
-1.032265, -0.1608264, -3.122046, 0, 0, 0, 1, 1,
-1.031036, 1.271887, -2.094385, 1, 1, 1, 1, 1,
-1.02927, -0.2714654, -1.596113, 1, 1, 1, 1, 1,
-1.02581, 0.01207643, -3.429377, 1, 1, 1, 1, 1,
-1.022891, 0.536658, -0.5212694, 1, 1, 1, 1, 1,
-1.022252, 0.3508048, -2.086625, 1, 1, 1, 1, 1,
-1.018636, -0.4894776, -1.225453, 1, 1, 1, 1, 1,
-1.006102, 2.498923, -0.3339704, 1, 1, 1, 1, 1,
-0.9898188, -0.4448341, -2.795319, 1, 1, 1, 1, 1,
-0.9835366, -1.066975, -1.636588, 1, 1, 1, 1, 1,
-0.9829566, 0.7202825, 0.731406, 1, 1, 1, 1, 1,
-0.9811574, 1.343344, -0.8319622, 1, 1, 1, 1, 1,
-0.9777976, 0.4084841, -0.1033081, 1, 1, 1, 1, 1,
-0.9708968, 0.4413152, -1.335588, 1, 1, 1, 1, 1,
-0.96448, 0.3730168, -2.948312, 1, 1, 1, 1, 1,
-0.9624282, -0.151352, -2.687947, 1, 1, 1, 1, 1,
-0.9586632, 1.699523, -0.4484075, 0, 0, 1, 1, 1,
-0.9504511, -1.563858, -4.182761, 1, 0, 0, 1, 1,
-0.9479147, 1.430985, -1.878135, 1, 0, 0, 1, 1,
-0.941502, 0.8211473, -0.6699318, 1, 0, 0, 1, 1,
-0.938625, -0.0637648, -1.363127, 1, 0, 0, 1, 1,
-0.936898, 0.949128, -0.3307268, 1, 0, 0, 1, 1,
-0.9340351, -0.8180509, -1.49395, 0, 0, 0, 1, 1,
-0.9325062, 1.89106, 0.1814853, 0, 0, 0, 1, 1,
-0.9303523, 0.8732583, -0.8644363, 0, 0, 0, 1, 1,
-0.9171997, 0.5971165, -1.336763, 0, 0, 0, 1, 1,
-0.9146671, 1.218137, -1.64614, 0, 0, 0, 1, 1,
-0.9070458, -0.3127755, -1.563799, 0, 0, 0, 1, 1,
-0.900252, -0.6178653, -0.8250341, 0, 0, 0, 1, 1,
-0.8984155, 0.1846718, 0.3544162, 1, 1, 1, 1, 1,
-0.8964719, -1.108549, -1.464335, 1, 1, 1, 1, 1,
-0.8943011, 0.7253398, -1.375112, 1, 1, 1, 1, 1,
-0.8913887, 0.1166504, -1.014318, 1, 1, 1, 1, 1,
-0.8900551, -0.7499596, -2.345157, 1, 1, 1, 1, 1,
-0.8899502, 0.3107433, -1.291079, 1, 1, 1, 1, 1,
-0.8711005, -0.1025522, -3.872583, 1, 1, 1, 1, 1,
-0.8580607, 1.497598, -0.6349334, 1, 1, 1, 1, 1,
-0.8490145, 2.204332, -0.8732611, 1, 1, 1, 1, 1,
-0.8487556, 0.6795034, -0.2278414, 1, 1, 1, 1, 1,
-0.8454521, -2.079388, -2.179634, 1, 1, 1, 1, 1,
-0.8365812, 0.9008254, -1.619086, 1, 1, 1, 1, 1,
-0.8336258, -1.059507, -2.744927, 1, 1, 1, 1, 1,
-0.8318312, -1.664142, -1.562167, 1, 1, 1, 1, 1,
-0.8244931, 0.03053739, -0.02616102, 1, 1, 1, 1, 1,
-0.8149104, -1.140042, -2.633859, 0, 0, 1, 1, 1,
-0.813458, 1.014935, -0.8090014, 1, 0, 0, 1, 1,
-0.811972, -0.297195, 0.07435994, 1, 0, 0, 1, 1,
-0.8109967, 2.031756, 0.4212007, 1, 0, 0, 1, 1,
-0.7949099, 0.09695129, -1.633382, 1, 0, 0, 1, 1,
-0.7915413, -0.501297, -1.276124, 1, 0, 0, 1, 1,
-0.789098, 1.474408, 0.1832024, 0, 0, 0, 1, 1,
-0.776714, -0.4633539, -3.511157, 0, 0, 0, 1, 1,
-0.776347, 1.299947, 0.1870061, 0, 0, 0, 1, 1,
-0.7752877, 0.9751942, -0.2420243, 0, 0, 0, 1, 1,
-0.7707566, -1.171174, -1.928466, 0, 0, 0, 1, 1,
-0.7653796, 0.2441256, -1.778313, 0, 0, 0, 1, 1,
-0.7582844, 0.5179379, -0.002865279, 0, 0, 0, 1, 1,
-0.7547755, 0.4414345, -0.3490369, 1, 1, 1, 1, 1,
-0.7494442, 1.213658, -0.6891196, 1, 1, 1, 1, 1,
-0.7492768, -0.7808577, -1.112406, 1, 1, 1, 1, 1,
-0.7426788, 1.969875, -0.712073, 1, 1, 1, 1, 1,
-0.7284304, 0.08449443, 0.6509222, 1, 1, 1, 1, 1,
-0.725956, 1.357794, 0.4474919, 1, 1, 1, 1, 1,
-0.7255554, -0.1998144, -1.890185, 1, 1, 1, 1, 1,
-0.722942, -1.334654, -3.852477, 1, 1, 1, 1, 1,
-0.7211394, -0.03344568, -2.648216, 1, 1, 1, 1, 1,
-0.7190888, -2.231048, -1.916782, 1, 1, 1, 1, 1,
-0.7157708, 0.2831452, -0.5440612, 1, 1, 1, 1, 1,
-0.7117959, -0.2993632, -2.21547, 1, 1, 1, 1, 1,
-0.711428, 1.194489, 0.3854519, 1, 1, 1, 1, 1,
-0.7113872, -0.7787778, -3.080211, 1, 1, 1, 1, 1,
-0.7111175, -0.03501464, -0.9081987, 1, 1, 1, 1, 1,
-0.7100123, 0.09947269, -0.9735036, 0, 0, 1, 1, 1,
-0.7098082, 1.289108, -1.57922, 1, 0, 0, 1, 1,
-0.7042782, -0.9373596, -1.53981, 1, 0, 0, 1, 1,
-0.6921555, -0.8126157, -4.37157, 1, 0, 0, 1, 1,
-0.6893837, 0.2867102, -3.036957, 1, 0, 0, 1, 1,
-0.688485, -0.7584195, -1.458912, 1, 0, 0, 1, 1,
-0.6880226, -1.505699, -3.101315, 0, 0, 0, 1, 1,
-0.6858457, -1.380123, -3.457258, 0, 0, 0, 1, 1,
-0.6845273, -0.08285316, -2.001599, 0, 0, 0, 1, 1,
-0.6832876, 0.09648104, -1.509474, 0, 0, 0, 1, 1,
-0.6784345, -1.675593, -3.2056, 0, 0, 0, 1, 1,
-0.6743567, 0.5469444, -0.7330129, 0, 0, 0, 1, 1,
-0.673013, 0.8214034, -0.6435722, 0, 0, 0, 1, 1,
-0.6714992, -0.5063822, -2.167406, 1, 1, 1, 1, 1,
-0.6713181, 0.711017, 0.7716238, 1, 1, 1, 1, 1,
-0.6676375, 0.4509124, -1.287717, 1, 1, 1, 1, 1,
-0.6650237, 0.6216518, -2.381306, 1, 1, 1, 1, 1,
-0.661688, 0.04076912, -2.454362, 1, 1, 1, 1, 1,
-0.6612496, 0.8355014, 1.39111, 1, 1, 1, 1, 1,
-0.6590303, 0.8937325, -0.02335755, 1, 1, 1, 1, 1,
-0.649494, 1.053177, -0.185525, 1, 1, 1, 1, 1,
-0.6491339, 0.4653476, -1.194641, 1, 1, 1, 1, 1,
-0.6471539, 0.09578516, -0.929517, 1, 1, 1, 1, 1,
-0.6427661, 0.7021987, 0.7039706, 1, 1, 1, 1, 1,
-0.6411162, 0.7293295, -0.6125154, 1, 1, 1, 1, 1,
-0.6400571, 2.085022, 1.036714, 1, 1, 1, 1, 1,
-0.6344732, -2.109515, -1.398172, 1, 1, 1, 1, 1,
-0.6311455, -0.09892444, -1.381781, 1, 1, 1, 1, 1,
-0.6287591, 1.629883, 0.09135199, 0, 0, 1, 1, 1,
-0.6277175, 0.5140724, 1.354781, 1, 0, 0, 1, 1,
-0.6261869, -0.1690238, -2.533492, 1, 0, 0, 1, 1,
-0.6242737, 1.476402, -1.126384, 1, 0, 0, 1, 1,
-0.620204, 0.8073369, -0.3795667, 1, 0, 0, 1, 1,
-0.6182671, 0.1652772, -0.6636506, 1, 0, 0, 1, 1,
-0.6171655, -0.0971884, -2.656173, 0, 0, 0, 1, 1,
-0.6131838, 0.6669806, 0.4394717, 0, 0, 0, 1, 1,
-0.6086756, 1.004744, -0.9874905, 0, 0, 0, 1, 1,
-0.6015384, -0.3220969, -2.649501, 0, 0, 0, 1, 1,
-0.601122, 0.5974671, -0.3290603, 0, 0, 0, 1, 1,
-0.5983332, -1.531876, -0.9673779, 0, 0, 0, 1, 1,
-0.596725, 0.3991752, -0.9601716, 0, 0, 0, 1, 1,
-0.5913637, 0.7011852, -1.164031, 1, 1, 1, 1, 1,
-0.5900497, -0.802457, -2.351491, 1, 1, 1, 1, 1,
-0.5865756, 0.8311962, -0.7577095, 1, 1, 1, 1, 1,
-0.583365, -0.7872182, -3.862182, 1, 1, 1, 1, 1,
-0.5816523, -1.101965, -3.326389, 1, 1, 1, 1, 1,
-0.5803057, 0.6502085, -1.514381, 1, 1, 1, 1, 1,
-0.5766193, -0.278503, -2.522925, 1, 1, 1, 1, 1,
-0.5718089, 0.1784196, -1.070744, 1, 1, 1, 1, 1,
-0.5694545, -0.987249, -2.373371, 1, 1, 1, 1, 1,
-0.5646217, 1.228208, -1.171955, 1, 1, 1, 1, 1,
-0.5631397, 1.367469, -0.1088041, 1, 1, 1, 1, 1,
-0.5550144, -0.1265791, -1.677538, 1, 1, 1, 1, 1,
-0.5531729, -1.261932, -1.201797, 1, 1, 1, 1, 1,
-0.5525067, 1.229476, 0.1634141, 1, 1, 1, 1, 1,
-0.5522051, -0.8209466, -1.965325, 1, 1, 1, 1, 1,
-0.5508154, -0.4603384, -2.77147, 0, 0, 1, 1, 1,
-0.5444867, 2.445165, -0.7014971, 1, 0, 0, 1, 1,
-0.5375559, -0.144642, -2.348697, 1, 0, 0, 1, 1,
-0.5374991, 1.622231, -0.65718, 1, 0, 0, 1, 1,
-0.5374025, -3.547784, -2.953429, 1, 0, 0, 1, 1,
-0.5338287, 1.188885, -0.4584841, 1, 0, 0, 1, 1,
-0.5328493, 1.145177, -2.826926, 0, 0, 0, 1, 1,
-0.5215564, 0.02281651, 0.06494838, 0, 0, 0, 1, 1,
-0.5215385, -0.1473941, -1.994132, 0, 0, 0, 1, 1,
-0.5109132, 0.4231358, -1.759313, 0, 0, 0, 1, 1,
-0.5079489, 0.9892681, -1.767146, 0, 0, 0, 1, 1,
-0.5075812, 0.04763366, -2.218061, 0, 0, 0, 1, 1,
-0.5056539, 0.239353, -1.341763, 0, 0, 0, 1, 1,
-0.5048822, -0.1700186, -0.4681922, 1, 1, 1, 1, 1,
-0.5008959, 1.016174, 1.389976, 1, 1, 1, 1, 1,
-0.5006198, 1.477898, -2.512143, 1, 1, 1, 1, 1,
-0.4982899, -0.07487445, 0.1611359, 1, 1, 1, 1, 1,
-0.4953149, 0.7152271, -1.656964, 1, 1, 1, 1, 1,
-0.4916875, -0.6916434, -2.386505, 1, 1, 1, 1, 1,
-0.4890291, 0.1069808, -1.306046, 1, 1, 1, 1, 1,
-0.4838782, -0.2179806, -2.999174, 1, 1, 1, 1, 1,
-0.4809907, -0.4446987, -4.910834, 1, 1, 1, 1, 1,
-0.4808812, -0.4449267, -2.32318, 1, 1, 1, 1, 1,
-0.4802821, 0.4800422, -0.5899919, 1, 1, 1, 1, 1,
-0.4795385, 0.2293004, -2.169853, 1, 1, 1, 1, 1,
-0.4779636, 0.8688324, -0.5691614, 1, 1, 1, 1, 1,
-0.4774646, 0.28293, 1.025601, 1, 1, 1, 1, 1,
-0.4742031, 1.377014, -0.3867932, 1, 1, 1, 1, 1,
-0.4725517, -0.4812315, -2.770639, 0, 0, 1, 1, 1,
-0.4702282, -0.783257, -2.999592, 1, 0, 0, 1, 1,
-0.4582401, -0.4509673, -0.9937254, 1, 0, 0, 1, 1,
-0.4521253, 0.2742218, 0.3162966, 1, 0, 0, 1, 1,
-0.4490733, -0.0951299, -1.783167, 1, 0, 0, 1, 1,
-0.4426527, 0.4170823, -1.347332, 1, 0, 0, 1, 1,
-0.440854, -0.3715507, -3.106992, 0, 0, 0, 1, 1,
-0.4401936, 1.204961, -0.9920271, 0, 0, 0, 1, 1,
-0.4371412, 1.732853, -0.958448, 0, 0, 0, 1, 1,
-0.4368249, 0.1646314, -0.8780193, 0, 0, 0, 1, 1,
-0.4342199, 0.2868705, -0.2412789, 0, 0, 0, 1, 1,
-0.4332753, -1.094033, -2.131277, 0, 0, 0, 1, 1,
-0.4326299, 1.435465, 0.6231393, 0, 0, 0, 1, 1,
-0.4323712, 0.4805267, -0.8847906, 1, 1, 1, 1, 1,
-0.4307356, -1.267825, -3.732053, 1, 1, 1, 1, 1,
-0.4289709, -0.721686, -2.949286, 1, 1, 1, 1, 1,
-0.4286529, 0.1275092, -1.18917, 1, 1, 1, 1, 1,
-0.4268858, -0.4894127, -2.157288, 1, 1, 1, 1, 1,
-0.4225503, 1.16189, -0.5915911, 1, 1, 1, 1, 1,
-0.4224707, 0.600021, -3.505486, 1, 1, 1, 1, 1,
-0.4207457, -0.646621, -1.503099, 1, 1, 1, 1, 1,
-0.4161695, 2.425889, 0.2056135, 1, 1, 1, 1, 1,
-0.4116777, 0.03955597, -2.844979, 1, 1, 1, 1, 1,
-0.4073089, -0.7201484, -0.9953813, 1, 1, 1, 1, 1,
-0.3919182, 0.7428412, -0.880688, 1, 1, 1, 1, 1,
-0.3852655, -1.687078, -4.27062, 1, 1, 1, 1, 1,
-0.3852471, 0.6351866, 0.2602578, 1, 1, 1, 1, 1,
-0.3802124, -0.6080725, -2.576341, 1, 1, 1, 1, 1,
-0.38015, 0.2913744, -0.9751734, 0, 0, 1, 1, 1,
-0.378738, -0.001050069, -2.034707, 1, 0, 0, 1, 1,
-0.3739395, 0.5770395, 0.06098047, 1, 0, 0, 1, 1,
-0.3734433, -1.405686, -3.387705, 1, 0, 0, 1, 1,
-0.3716362, 0.3276373, -0.4205922, 1, 0, 0, 1, 1,
-0.3698532, 0.4784105, 0.1547819, 1, 0, 0, 1, 1,
-0.3649367, 0.6944298, -1.373081, 0, 0, 0, 1, 1,
-0.3579977, 0.5346751, -2.02406, 0, 0, 0, 1, 1,
-0.3521948, -1.909326, -3.718178, 0, 0, 0, 1, 1,
-0.3513549, 0.3206489, -2.901132, 0, 0, 0, 1, 1,
-0.3505868, 0.9866653, -0.04625202, 0, 0, 0, 1, 1,
-0.349842, -0.4732861, -3.04232, 0, 0, 0, 1, 1,
-0.3488609, -0.2232927, -2.456611, 0, 0, 0, 1, 1,
-0.3478895, 0.2157689, -2.31505, 1, 1, 1, 1, 1,
-0.3452989, -0.3815973, -2.730159, 1, 1, 1, 1, 1,
-0.3405881, -1.99685, -4.053835, 1, 1, 1, 1, 1,
-0.3310033, -1.22349, -3.258525, 1, 1, 1, 1, 1,
-0.3229405, 0.08164439, 0.02715047, 1, 1, 1, 1, 1,
-0.3211728, -0.6880777, -2.320799, 1, 1, 1, 1, 1,
-0.3201909, 0.9255006, 0.4267352, 1, 1, 1, 1, 1,
-0.3162704, -0.06601625, -0.7163534, 1, 1, 1, 1, 1,
-0.311754, -0.1897964, -2.299429, 1, 1, 1, 1, 1,
-0.3100453, -0.5780932, -1.834202, 1, 1, 1, 1, 1,
-0.3094815, 0.7755477, -1.412581, 1, 1, 1, 1, 1,
-0.3047734, -0.4302782, -2.362711, 1, 1, 1, 1, 1,
-0.303008, -1.063113, -1.822908, 1, 1, 1, 1, 1,
-0.2991308, 0.1179624, -0.9558949, 1, 1, 1, 1, 1,
-0.2932756, -1.421934, -3.045754, 1, 1, 1, 1, 1,
-0.2906866, 2.166887, -0.5289881, 0, 0, 1, 1, 1,
-0.2902642, 1.144043, -1.75055, 1, 0, 0, 1, 1,
-0.2867748, -1.223432, -3.551438, 1, 0, 0, 1, 1,
-0.2859557, 0.05185143, -0.9058056, 1, 0, 0, 1, 1,
-0.2856058, 0.8274742, -0.8789127, 1, 0, 0, 1, 1,
-0.285477, -0.4715709, -3.701804, 1, 0, 0, 1, 1,
-0.2846751, -0.01872757, -3.608243, 0, 0, 0, 1, 1,
-0.2833337, 2.233177, 1.703339, 0, 0, 0, 1, 1,
-0.2832319, -2.044219, -2.396711, 0, 0, 0, 1, 1,
-0.2824626, -0.0829632, -1.979638, 0, 0, 0, 1, 1,
-0.2804891, 2.841648, 0.8528333, 0, 0, 0, 1, 1,
-0.2764937, -0.4552614, -3.592146, 0, 0, 0, 1, 1,
-0.2754501, -2.455156, -2.295665, 0, 0, 0, 1, 1,
-0.2749315, -0.7448463, -2.723949, 1, 1, 1, 1, 1,
-0.2741136, 0.1274403, -0.2593468, 1, 1, 1, 1, 1,
-0.2712113, -0.7938056, -3.675223, 1, 1, 1, 1, 1,
-0.2684184, 0.490749, -0.3282752, 1, 1, 1, 1, 1,
-0.2664693, -0.3684238, -2.369444, 1, 1, 1, 1, 1,
-0.2664349, -0.8214658, -3.383075, 1, 1, 1, 1, 1,
-0.2636957, -0.4543151, -3.127562, 1, 1, 1, 1, 1,
-0.2635905, 1.568044, -0.07357676, 1, 1, 1, 1, 1,
-0.2624522, 1.127922, -0.2561074, 1, 1, 1, 1, 1,
-0.2569641, 0.2232632, -0.05064838, 1, 1, 1, 1, 1,
-0.25656, 0.5886197, -0.6705165, 1, 1, 1, 1, 1,
-0.2554599, -1.409956, -2.420976, 1, 1, 1, 1, 1,
-0.2501194, -2.342291, -3.126851, 1, 1, 1, 1, 1,
-0.2458184, -1.708734, -4.26696, 1, 1, 1, 1, 1,
-0.244447, 0.8055416, 0.005138131, 1, 1, 1, 1, 1,
-0.2437628, -0.2925197, -1.605218, 0, 0, 1, 1, 1,
-0.2422615, -0.4031474, -2.76907, 1, 0, 0, 1, 1,
-0.2317077, 0.5520704, 1.071077, 1, 0, 0, 1, 1,
-0.2303035, 0.7531405, -0.2323979, 1, 0, 0, 1, 1,
-0.2254603, 0.4599487, 1.022374, 1, 0, 0, 1, 1,
-0.2239526, -0.5269815, -1.880727, 1, 0, 0, 1, 1,
-0.2237145, -1.082706, -2.944887, 0, 0, 0, 1, 1,
-0.221135, 1.147792, 0.1794669, 0, 0, 0, 1, 1,
-0.2203303, 1.526005, 2.985319, 0, 0, 0, 1, 1,
-0.2132351, 1.12707, -0.3829264, 0, 0, 0, 1, 1,
-0.2126058, 1.438321, -1.029133, 0, 0, 0, 1, 1,
-0.2114319, -0.457054, -1.414014, 0, 0, 0, 1, 1,
-0.2101829, -0.6896886, -2.760354, 0, 0, 0, 1, 1,
-0.208124, -0.3585964, -3.204322, 1, 1, 1, 1, 1,
-0.20754, 0.3161746, -0.7544806, 1, 1, 1, 1, 1,
-0.2066892, 0.7901758, -2.130609, 1, 1, 1, 1, 1,
-0.2055091, 0.9799946, 0.5042879, 1, 1, 1, 1, 1,
-0.2055042, 1.435298, 0.6199611, 1, 1, 1, 1, 1,
-0.204038, 1.279447, 0.2397817, 1, 1, 1, 1, 1,
-0.201815, 0.1372432, -1.777318, 1, 1, 1, 1, 1,
-0.1954936, -0.6319592, -2.966122, 1, 1, 1, 1, 1,
-0.1912307, -1.906798, -2.068009, 1, 1, 1, 1, 1,
-0.1898451, 1.435868, -0.1197355, 1, 1, 1, 1, 1,
-0.1877352, -0.9898243, -3.20383, 1, 1, 1, 1, 1,
-0.1869906, -0.7015054, -2.157983, 1, 1, 1, 1, 1,
-0.1859355, 1.298079, 0.8616234, 1, 1, 1, 1, 1,
-0.1736759, -0.7883855, -2.968657, 1, 1, 1, 1, 1,
-0.1725725, 0.4318012, -1.455008, 1, 1, 1, 1, 1,
-0.1708681, -0.8247285, -3.820781, 0, 0, 1, 1, 1,
-0.1692189, 1.256651, -0.5396801, 1, 0, 0, 1, 1,
-0.1684547, 0.6472638, -0.3720418, 1, 0, 0, 1, 1,
-0.163715, -0.3269326, -2.254193, 1, 0, 0, 1, 1,
-0.1607055, 0.5799101, -3.180391, 1, 0, 0, 1, 1,
-0.1585919, 0.4660029, 0.1678662, 1, 0, 0, 1, 1,
-0.1575261, -0.4901009, -1.950713, 0, 0, 0, 1, 1,
-0.1550535, 0.5069989, -2.215419, 0, 0, 0, 1, 1,
-0.1532887, -0.7274749, -2.239988, 0, 0, 0, 1, 1,
-0.1457758, -1.058696, -3.927009, 0, 0, 0, 1, 1,
-0.136832, 2.100689, 2.249093, 0, 0, 0, 1, 1,
-0.1345933, 0.09798861, 0.1875607, 0, 0, 0, 1, 1,
-0.1285079, -0.6274921, -3.27949, 0, 0, 0, 1, 1,
-0.1282283, -0.5964067, -4.344446, 1, 1, 1, 1, 1,
-0.1267999, 0.5412686, -1.502042, 1, 1, 1, 1, 1,
-0.1209518, 1.144553, 1.43838, 1, 1, 1, 1, 1,
-0.117891, -1.548943, -4.376023, 1, 1, 1, 1, 1,
-0.1151827, -0.973645, -4.22266, 1, 1, 1, 1, 1,
-0.1108175, 1.123955, 0.4779119, 1, 1, 1, 1, 1,
-0.1042024, 2.271338, -0.1100772, 1, 1, 1, 1, 1,
-0.1015471, -0.9004428, -2.676945, 1, 1, 1, 1, 1,
-0.1000308, 1.020707, 1.349033, 1, 1, 1, 1, 1,
-0.09888683, -0.6253023, -1.730317, 1, 1, 1, 1, 1,
-0.09761768, 0.7522055, -1.491213, 1, 1, 1, 1, 1,
-0.09535849, 1.455996, -0.5466154, 1, 1, 1, 1, 1,
-0.08854216, -1.23835, -3.78738, 1, 1, 1, 1, 1,
-0.08336978, 0.693006, -0.4206477, 1, 1, 1, 1, 1,
-0.07888617, -0.3381956, -2.396734, 1, 1, 1, 1, 1,
-0.0749239, -0.4335082, -1.259494, 0, 0, 1, 1, 1,
-0.07418989, 0.8339064, -0.6738945, 1, 0, 0, 1, 1,
-0.07250735, -0.08859625, -5.171303, 1, 0, 0, 1, 1,
-0.07130609, -1.693496, -4.314574, 1, 0, 0, 1, 1,
-0.06829794, -0.2132161, -2.414665, 1, 0, 0, 1, 1,
-0.06767721, 0.9983525, -0.08681051, 1, 0, 0, 1, 1,
-0.0566055, -0.09066699, -3.442898, 0, 0, 0, 1, 1,
-0.05558754, 1.616729, 1.400466, 0, 0, 0, 1, 1,
-0.05301475, 1.070474, 0.06795838, 0, 0, 0, 1, 1,
-0.04593606, 3.016253, 0.518495, 0, 0, 0, 1, 1,
-0.04552845, -0.9343904, -1.973709, 0, 0, 0, 1, 1,
-0.0454707, -0.970542, -3.849133, 0, 0, 0, 1, 1,
-0.03823299, 0.02775416, -1.916981, 0, 0, 0, 1, 1,
-0.03281603, 1.672883, -0.2514339, 1, 1, 1, 1, 1,
-0.02924859, -1.594995, -2.868514, 1, 1, 1, 1, 1,
-0.02827662, 0.8286359, -0.07350215, 1, 1, 1, 1, 1,
-0.02557626, -1.261517, -3.849312, 1, 1, 1, 1, 1,
-0.02499625, -1.055925, -1.394029, 1, 1, 1, 1, 1,
-0.01264396, -1.428483, -3.807579, 1, 1, 1, 1, 1,
-0.008814577, -0.6032214, -4.044176, 1, 1, 1, 1, 1,
-0.007919832, 0.003307683, -2.088487, 1, 1, 1, 1, 1,
-0.006005661, -0.2492268, -2.749593, 1, 1, 1, 1, 1,
-0.004765463, 0.1516362, -1.203042, 1, 1, 1, 1, 1,
-0.004128108, -0.4705533, -2.737717, 1, 1, 1, 1, 1,
-0.003267271, -1.20374, -4.167186, 1, 1, 1, 1, 1,
-0.0004460111, -1.169088, -3.29941, 1, 1, 1, 1, 1,
0.0008985093, 0.8116643, -0.3718419, 1, 1, 1, 1, 1,
0.006768997, 0.7898562, 1.518924, 1, 1, 1, 1, 1,
0.008906949, -1.466619, 3.767131, 0, 0, 1, 1, 1,
0.0107113, 0.4390287, 1.198358, 1, 0, 0, 1, 1,
0.01178416, -1.454757, 3.556882, 1, 0, 0, 1, 1,
0.01231377, 0.2890258, -0.6922758, 1, 0, 0, 1, 1,
0.01412464, -0.6891767, 1.409813, 1, 0, 0, 1, 1,
0.02032531, 0.6601778, 1.578237, 1, 0, 0, 1, 1,
0.02090833, 0.6216149, 0.7719934, 0, 0, 0, 1, 1,
0.02178437, -0.2993437, 2.989448, 0, 0, 0, 1, 1,
0.02342894, -0.8268111, 1.646284, 0, 0, 0, 1, 1,
0.02384578, -1.102245, 3.47919, 0, 0, 0, 1, 1,
0.02544172, -1.136138, 1.4548, 0, 0, 0, 1, 1,
0.02590384, 0.0633646, 1.555295, 0, 0, 0, 1, 1,
0.03280023, -0.7564118, 4.140666, 0, 0, 0, 1, 1,
0.03769938, -1.199704, 4.369812, 1, 1, 1, 1, 1,
0.04102327, -0.3051449, 1.815297, 1, 1, 1, 1, 1,
0.04588372, 0.9651598, 0.9905423, 1, 1, 1, 1, 1,
0.05326562, -1.362647, 3.654558, 1, 1, 1, 1, 1,
0.0552693, -0.432007, 2.852293, 1, 1, 1, 1, 1,
0.05658303, -1.315034, 3.567722, 1, 1, 1, 1, 1,
0.05666364, -0.4172695, 2.712025, 1, 1, 1, 1, 1,
0.05696665, 0.9625457, -0.4619295, 1, 1, 1, 1, 1,
0.06218844, 0.6355435, -0.373704, 1, 1, 1, 1, 1,
0.06422623, -0.1729397, 4.144356, 1, 1, 1, 1, 1,
0.0656593, -0.4414307, 2.985495, 1, 1, 1, 1, 1,
0.06802204, 0.6511824, -0.8672003, 1, 1, 1, 1, 1,
0.07082631, -0.6070493, 2.417377, 1, 1, 1, 1, 1,
0.07123833, -0.4917628, 2.463772, 1, 1, 1, 1, 1,
0.07415137, -0.4958791, 2.942906, 1, 1, 1, 1, 1,
0.0756432, 0.3474478, 0.6204449, 0, 0, 1, 1, 1,
0.07836345, -0.110383, 1.650999, 1, 0, 0, 1, 1,
0.08224652, 1.051194, -1.133795, 1, 0, 0, 1, 1,
0.08336489, 0.1056949, 1.978925, 1, 0, 0, 1, 1,
0.0887437, 0.06788686, 2.425934, 1, 0, 0, 1, 1,
0.09072051, -0.4007778, 1.627053, 1, 0, 0, 1, 1,
0.09142558, -2.243427, 4.756925, 0, 0, 0, 1, 1,
0.0921621, -0.8414071, 1.937969, 0, 0, 0, 1, 1,
0.1005991, 2.284587, 0.4612497, 0, 0, 0, 1, 1,
0.1016684, 1.346027, -1.278951, 0, 0, 0, 1, 1,
0.1023219, -0.5057044, 2.139802, 0, 0, 0, 1, 1,
0.1050957, -0.4161433, 4.181374, 0, 0, 0, 1, 1,
0.1081686, -0.6252455, 2.657781, 0, 0, 0, 1, 1,
0.1093092, -0.1443121, 3.699226, 1, 1, 1, 1, 1,
0.111886, -0.6925502, 0.9772132, 1, 1, 1, 1, 1,
0.112739, 0.9881301, -0.03095621, 1, 1, 1, 1, 1,
0.1171678, 0.05028151, 2.096616, 1, 1, 1, 1, 1,
0.1210294, 0.02373662, 1.025986, 1, 1, 1, 1, 1,
0.1214899, -0.8255513, 3.59558, 1, 1, 1, 1, 1,
0.1219243, -0.6731385, 2.149045, 1, 1, 1, 1, 1,
0.1234113, -1.176925, 3.214557, 1, 1, 1, 1, 1,
0.1239825, 0.08870334, 0.4492425, 1, 1, 1, 1, 1,
0.1297427, 0.9043602, -1.349209, 1, 1, 1, 1, 1,
0.1317897, -0.476572, 4.407112, 1, 1, 1, 1, 1,
0.1325023, -2.061363, 3.405193, 1, 1, 1, 1, 1,
0.1329765, 0.5078163, 1.373995, 1, 1, 1, 1, 1,
0.1329844, -0.04610073, 0.7769793, 1, 1, 1, 1, 1,
0.1377538, -1.266442, 2.746946, 1, 1, 1, 1, 1,
0.1401477, -0.9133757, 3.144615, 0, 0, 1, 1, 1,
0.1415809, -0.2085559, 2.857817, 1, 0, 0, 1, 1,
0.1423249, -0.5906548, 3.943683, 1, 0, 0, 1, 1,
0.1448124, -0.8733612, 4.268317, 1, 0, 0, 1, 1,
0.1493899, 0.09939838, 1.187261, 1, 0, 0, 1, 1,
0.1531601, 0.7781811, -1.473331, 1, 0, 0, 1, 1,
0.1588085, -0.3001915, 3.537556, 0, 0, 0, 1, 1,
0.1608214, -0.007101583, 0.674918, 0, 0, 0, 1, 1,
0.1714948, -0.452813, 1.392102, 0, 0, 0, 1, 1,
0.1727403, -0.555883, 3.558043, 0, 0, 0, 1, 1,
0.1752838, -0.7584523, 6.033597, 0, 0, 0, 1, 1,
0.1776256, -0.9558105, 1.784354, 0, 0, 0, 1, 1,
0.184187, 1.846485, 0.7588302, 0, 0, 0, 1, 1,
0.1860235, -0.6241506, 2.106314, 1, 1, 1, 1, 1,
0.1914171, -0.4060823, 0.3404781, 1, 1, 1, 1, 1,
0.198282, 0.1024373, 0.7029204, 1, 1, 1, 1, 1,
0.2014137, -0.3987319, 2.589838, 1, 1, 1, 1, 1,
0.2028388, 0.8710651, -1.28269, 1, 1, 1, 1, 1,
0.2048583, -0.6925867, 5.042045, 1, 1, 1, 1, 1,
0.2049124, -0.8570958, 2.715963, 1, 1, 1, 1, 1,
0.2077992, 0.03682298, 2.167586, 1, 1, 1, 1, 1,
0.2088751, 0.7287365, 1.284482, 1, 1, 1, 1, 1,
0.2121024, 0.5642587, 2.505876, 1, 1, 1, 1, 1,
0.2133641, -1.58287, 5.552888, 1, 1, 1, 1, 1,
0.2230468, -1.709742, 2.874066, 1, 1, 1, 1, 1,
0.2239165, 0.6037788, 0.6677527, 1, 1, 1, 1, 1,
0.2272082, -2.092717, 4.10305, 1, 1, 1, 1, 1,
0.2274857, 0.7139117, -0.3274909, 1, 1, 1, 1, 1,
0.2288212, -0.5941327, 3.023063, 0, 0, 1, 1, 1,
0.2289086, 1.88546, -1.556692, 1, 0, 0, 1, 1,
0.2289138, 1.298298, -0.4994277, 1, 0, 0, 1, 1,
0.2301007, -0.2801143, 1.856806, 1, 0, 0, 1, 1,
0.2319525, -0.4982285, 3.048335, 1, 0, 0, 1, 1,
0.2333767, -0.958874, 2.144972, 1, 0, 0, 1, 1,
0.2341219, 0.526831, 0.4107745, 0, 0, 0, 1, 1,
0.2412054, 0.4807162, 0.2707349, 0, 0, 0, 1, 1,
0.2428163, -1.664149, 1.742109, 0, 0, 0, 1, 1,
0.2436579, -1.222288, 3.782923, 0, 0, 0, 1, 1,
0.2454333, 1.299361, -0.03183608, 0, 0, 0, 1, 1,
0.2456543, -0.06177858, 0.8404058, 0, 0, 0, 1, 1,
0.2487709, 1.028095, -0.173581, 0, 0, 0, 1, 1,
0.2527857, -2.016908, 3.557245, 1, 1, 1, 1, 1,
0.2532282, 2.294158, -0.4421231, 1, 1, 1, 1, 1,
0.2566387, 2.149213, 1.929471, 1, 1, 1, 1, 1,
0.2614661, -0.3419726, 3.642754, 1, 1, 1, 1, 1,
0.2619174, 0.97254, 1.245774, 1, 1, 1, 1, 1,
0.2627095, -1.502841, 2.46267, 1, 1, 1, 1, 1,
0.2663919, 0.6979869, 1.431017, 1, 1, 1, 1, 1,
0.2713025, 0.06954198, 0.6078506, 1, 1, 1, 1, 1,
0.2739904, 0.01808461, 3.17942, 1, 1, 1, 1, 1,
0.2763066, 0.2924958, 0.1215522, 1, 1, 1, 1, 1,
0.2784319, 0.0764019, 0.740854, 1, 1, 1, 1, 1,
0.2816106, -0.1032033, 2.399429, 1, 1, 1, 1, 1,
0.2821437, 2.524076, 0.7559767, 1, 1, 1, 1, 1,
0.2861055, 0.6887959, 0.7210851, 1, 1, 1, 1, 1,
0.2875029, 0.7215238, -0.3183721, 1, 1, 1, 1, 1,
0.2875808, -1.477668, 2.169669, 0, 0, 1, 1, 1,
0.2893547, -0.1587909, 1.464744, 1, 0, 0, 1, 1,
0.2900575, 1.096074, 1.582845, 1, 0, 0, 1, 1,
0.2918492, 1.584841, 0.446683, 1, 0, 0, 1, 1,
0.2929833, 1.240661, 0.6407688, 1, 0, 0, 1, 1,
0.3008385, -1.473562, 1.278746, 1, 0, 0, 1, 1,
0.3022216, 1.365564, 1.368364, 0, 0, 0, 1, 1,
0.3030709, -0.8786114, 3.600651, 0, 0, 0, 1, 1,
0.3035919, 0.8870159, 0.7738369, 0, 0, 0, 1, 1,
0.3037159, -1.178956, 1.23825, 0, 0, 0, 1, 1,
0.3069592, 0.7479985, 0.1053229, 0, 0, 0, 1, 1,
0.3108658, -0.2895867, 2.144827, 0, 0, 0, 1, 1,
0.3114169, 0.5757519, 0.3957274, 0, 0, 0, 1, 1,
0.3124957, 0.7749482, 1.735647, 1, 1, 1, 1, 1,
0.3200581, 0.3615661, 0.5379343, 1, 1, 1, 1, 1,
0.3243931, -0.6849918, 1.585112, 1, 1, 1, 1, 1,
0.3265191, 1.025677, 0.3079823, 1, 1, 1, 1, 1,
0.3301562, -0.08454049, 2.284247, 1, 1, 1, 1, 1,
0.3304371, 0.7077488, -0.7582189, 1, 1, 1, 1, 1,
0.3343167, -0.8185058, 3.489906, 1, 1, 1, 1, 1,
0.3379648, 0.4162972, 0.3918831, 1, 1, 1, 1, 1,
0.3384983, -1.658457, 1.681689, 1, 1, 1, 1, 1,
0.3403688, 0.9829497, 0.76421, 1, 1, 1, 1, 1,
0.3459846, 0.4783924, 1.671396, 1, 1, 1, 1, 1,
0.3478034, -0.6113097, 3.455225, 1, 1, 1, 1, 1,
0.349047, 0.7637211, 1.21862, 1, 1, 1, 1, 1,
0.3495661, -1.713747, 5.140676, 1, 1, 1, 1, 1,
0.3506042, 1.869586, 0.1360111, 1, 1, 1, 1, 1,
0.353762, 1.518533, -1.877543, 0, 0, 1, 1, 1,
0.3554652, 0.08374576, 2.370963, 1, 0, 0, 1, 1,
0.3565682, -0.6191416, 3.342549, 1, 0, 0, 1, 1,
0.3577354, 2.292236, -1.082838, 1, 0, 0, 1, 1,
0.3585197, 0.3661807, -0.1258839, 1, 0, 0, 1, 1,
0.359917, -2.527299, 3.443706, 1, 0, 0, 1, 1,
0.3618891, -1.334395, 3.387594, 0, 0, 0, 1, 1,
0.3626029, -0.9018543, 3.91637, 0, 0, 0, 1, 1,
0.3664664, 0.1807498, 1.492304, 0, 0, 0, 1, 1,
0.3667479, -1.990697, 3.232726, 0, 0, 0, 1, 1,
0.3702655, -1.410756, 1.503324, 0, 0, 0, 1, 1,
0.3710732, -1.135062, 2.287463, 0, 0, 0, 1, 1,
0.3742068, 2.230808, -0.7060462, 0, 0, 0, 1, 1,
0.3782771, -1.951325, 2.317723, 1, 1, 1, 1, 1,
0.3801501, -1.115414, 2.708027, 1, 1, 1, 1, 1,
0.3842667, 0.725354, 1.599867, 1, 1, 1, 1, 1,
0.3844545, 1.420904, 1.764402, 1, 1, 1, 1, 1,
0.3849887, 0.08888979, 0.05993852, 1, 1, 1, 1, 1,
0.3851835, 0.5515943, -1.790971, 1, 1, 1, 1, 1,
0.3854077, -0.2659397, 3.024233, 1, 1, 1, 1, 1,
0.3884926, 0.01999645, -0.2314334, 1, 1, 1, 1, 1,
0.3958622, 0.1236211, 1.631205, 1, 1, 1, 1, 1,
0.4024044, -1.186317, 2.253766, 1, 1, 1, 1, 1,
0.404764, 0.1875546, 0.332088, 1, 1, 1, 1, 1,
0.4052656, -0.1162414, 0.9376237, 1, 1, 1, 1, 1,
0.4065787, 0.7240634, 1.748208, 1, 1, 1, 1, 1,
0.4097914, -2.452694, 3.526114, 1, 1, 1, 1, 1,
0.4176261, 0.7887321, -1.533804, 1, 1, 1, 1, 1,
0.4201443, -0.09087925, 0.5395862, 0, 0, 1, 1, 1,
0.4206024, 0.7443554, 0.9064027, 1, 0, 0, 1, 1,
0.4253326, -0.995079, 2.557497, 1, 0, 0, 1, 1,
0.4270752, 0.7834756, -0.283082, 1, 0, 0, 1, 1,
0.4283417, 1.309392, 0.5642596, 1, 0, 0, 1, 1,
0.4346271, 0.6185822, -0.687986, 1, 0, 0, 1, 1,
0.4356715, -0.5136139, 2.841149, 0, 0, 0, 1, 1,
0.4385857, 0.15427, 3.010391, 0, 0, 0, 1, 1,
0.4400389, 0.5574216, -1.152169, 0, 0, 0, 1, 1,
0.4406095, -1.659771, 2.298748, 0, 0, 0, 1, 1,
0.444061, 0.1689652, 2.447203, 0, 0, 0, 1, 1,
0.4441239, -1.712497, 3.376359, 0, 0, 0, 1, 1,
0.4476086, -2.80343, 1.804597, 0, 0, 0, 1, 1,
0.4477977, 1.041669, 0.561277, 1, 1, 1, 1, 1,
0.4517493, 0.6559216, 1.071209, 1, 1, 1, 1, 1,
0.4559186, -0.1015178, -0.02438813, 1, 1, 1, 1, 1,
0.4603165, 0.09583018, 1.475429, 1, 1, 1, 1, 1,
0.4614182, 0.4113763, 1.187845, 1, 1, 1, 1, 1,
0.4649003, 0.2894986, 1.224735, 1, 1, 1, 1, 1,
0.4666767, 0.4021277, 1.46794, 1, 1, 1, 1, 1,
0.468854, 1.191347, 1.115211, 1, 1, 1, 1, 1,
0.4699449, 1.816726, -0.6699829, 1, 1, 1, 1, 1,
0.4755021, 1.513604, 1.233979, 1, 1, 1, 1, 1,
0.475771, -0.6791444, 2.361513, 1, 1, 1, 1, 1,
0.4767943, -1.473289, 0.5985503, 1, 1, 1, 1, 1,
0.4770133, -0.2198803, 3.696793, 1, 1, 1, 1, 1,
0.4776637, 2.422985, -0.06533211, 1, 1, 1, 1, 1,
0.4779128, -1.094079, 2.733695, 1, 1, 1, 1, 1,
0.4783519, -0.2409446, 2.403427, 0, 0, 1, 1, 1,
0.4790332, 0.1882202, 1.925315, 1, 0, 0, 1, 1,
0.479338, -1.542777, 2.683255, 1, 0, 0, 1, 1,
0.4816335, -0.461746, 1.169458, 1, 0, 0, 1, 1,
0.4824826, 0.00141783, 0.9755864, 1, 0, 0, 1, 1,
0.4850787, 1.401031, 1.29386, 1, 0, 0, 1, 1,
0.5010629, -1.496688, 3.759872, 0, 0, 0, 1, 1,
0.5012713, 0.8763261, 1.112709, 0, 0, 0, 1, 1,
0.5081176, 0.2294934, 3.020036, 0, 0, 0, 1, 1,
0.5088674, 0.9562423, 0.3785642, 0, 0, 0, 1, 1,
0.5092568, -1.207778, 4.173621, 0, 0, 0, 1, 1,
0.5094001, 0.2878495, 1.483429, 0, 0, 0, 1, 1,
0.5098961, -0.9437938, 2.907639, 0, 0, 0, 1, 1,
0.5172339, -0.897749, 0.9787986, 1, 1, 1, 1, 1,
0.5216895, 0.2893976, -0.03826101, 1, 1, 1, 1, 1,
0.527138, -0.9234859, 2.722957, 1, 1, 1, 1, 1,
0.5276303, 0.2710274, 0.09923644, 1, 1, 1, 1, 1,
0.5330912, 1.998419, -0.5897879, 1, 1, 1, 1, 1,
0.5365763, 0.1152328, 1.568386, 1, 1, 1, 1, 1,
0.5407242, -0.1010581, 1.688311, 1, 1, 1, 1, 1,
0.5440401, -0.9249948, 3.319434, 1, 1, 1, 1, 1,
0.5469633, 1.107772, 0.46752, 1, 1, 1, 1, 1,
0.5564491, 0.9713144, 0.2004029, 1, 1, 1, 1, 1,
0.5574874, 0.7212401, 2.700846, 1, 1, 1, 1, 1,
0.5596448, -1.55879, 4.805488, 1, 1, 1, 1, 1,
0.5635143, -0.08950081, 2.675057, 1, 1, 1, 1, 1,
0.5658624, 1.02026, 1.589402, 1, 1, 1, 1, 1,
0.5746127, 1.682153, -0.003749723, 1, 1, 1, 1, 1,
0.5746989, 0.05679862, 2.809403, 0, 0, 1, 1, 1,
0.5768734, -0.3916991, 1.791011, 1, 0, 0, 1, 1,
0.5773883, -0.09933694, 1.784202, 1, 0, 0, 1, 1,
0.5798241, 0.1947064, 1.406101, 1, 0, 0, 1, 1,
0.5815721, 0.6469479, 0.4665298, 1, 0, 0, 1, 1,
0.5831842, -0.4476719, 1.035057, 1, 0, 0, 1, 1,
0.5842724, -1.226897, 1.669636, 0, 0, 0, 1, 1,
0.5852296, -0.8972608, 5.081552, 0, 0, 0, 1, 1,
0.596192, -2.212017, 2.222994, 0, 0, 0, 1, 1,
0.5963871, 0.4993826, 1.470016, 0, 0, 0, 1, 1,
0.5964885, -0.4067925, 3.092498, 0, 0, 0, 1, 1,
0.5986996, -1.106396, 1.276551, 0, 0, 0, 1, 1,
0.605431, -0.5935429, 2.525944, 0, 0, 0, 1, 1,
0.605867, -0.1549873, 0.2647183, 1, 1, 1, 1, 1,
0.6118755, 0.1712733, 1.308202, 1, 1, 1, 1, 1,
0.6191444, 1.021798, -0.4624509, 1, 1, 1, 1, 1,
0.6205461, -1.144272, 3.108728, 1, 1, 1, 1, 1,
0.6218442, 0.9201909, -0.8337672, 1, 1, 1, 1, 1,
0.6233129, -0.6222116, 1.35944, 1, 1, 1, 1, 1,
0.6261922, 0.973546, 0.06974282, 1, 1, 1, 1, 1,
0.6292052, 0.9897628, 1.767667, 1, 1, 1, 1, 1,
0.6314475, -0.6989493, 2.202264, 1, 1, 1, 1, 1,
0.634593, -0.3917795, 1.874192, 1, 1, 1, 1, 1,
0.6380252, 0.5683347, 0.1979515, 1, 1, 1, 1, 1,
0.6424617, -0.1871555, 2.337747, 1, 1, 1, 1, 1,
0.6439601, 0.4191782, 0.08377603, 1, 1, 1, 1, 1,
0.6463921, 1.631587, 2.045598, 1, 1, 1, 1, 1,
0.6570667, -1.594329, 2.945976, 1, 1, 1, 1, 1,
0.6592346, 0.1978187, 0.6161308, 0, 0, 1, 1, 1,
0.6614212, -1.103161, 1.608124, 1, 0, 0, 1, 1,
0.6671708, -1.132452, 2.865347, 1, 0, 0, 1, 1,
0.6681535, -1.23517, 3.519837, 1, 0, 0, 1, 1,
0.6692692, -0.9592931, 1.917728, 1, 0, 0, 1, 1,
0.6732097, -0.13822, 0.3609055, 1, 0, 0, 1, 1,
0.6786052, -0.944613, 2.717185, 0, 0, 0, 1, 1,
0.6817946, -2.108514, 2.945467, 0, 0, 0, 1, 1,
0.6843979, 0.4906499, 1.799846, 0, 0, 0, 1, 1,
0.6854317, 1.131328, -0.05177487, 0, 0, 0, 1, 1,
0.6892977, -0.532343, 3.1994, 0, 0, 0, 1, 1,
0.690618, 0.3386065, -0.563599, 0, 0, 0, 1, 1,
0.6916521, -1.027622, 4.343493, 0, 0, 0, 1, 1,
0.6999185, 0.2362671, 2.98402, 1, 1, 1, 1, 1,
0.7084135, -0.9235152, 1.885265, 1, 1, 1, 1, 1,
0.7096715, -0.004840165, 2.181723, 1, 1, 1, 1, 1,
0.7108216, 0.7469772, 1.279947, 1, 1, 1, 1, 1,
0.7153571, 0.7686214, 1.665812, 1, 1, 1, 1, 1,
0.7162479, 0.5521704, 0.6676487, 1, 1, 1, 1, 1,
0.7174227, 1.183842, 0.5096172, 1, 1, 1, 1, 1,
0.7194008, -0.5461943, 2.711053, 1, 1, 1, 1, 1,
0.7277231, -1.587104, 3.188376, 1, 1, 1, 1, 1,
0.7278336, 0.3331283, 3.145363, 1, 1, 1, 1, 1,
0.7283853, -2.261104, 3.087302, 1, 1, 1, 1, 1,
0.7284836, 0.2161475, 0.04401687, 1, 1, 1, 1, 1,
0.7291992, 1.833068, 2.020168, 1, 1, 1, 1, 1,
0.7296504, 0.5631255, 1.826497, 1, 1, 1, 1, 1,
0.7394627, 0.5313388, -0.09611149, 1, 1, 1, 1, 1,
0.7423494, -0.1687211, 2.058422, 0, 0, 1, 1, 1,
0.7441053, -0.3278596, 1.731357, 1, 0, 0, 1, 1,
0.7497991, 1.067254, 1.44636, 1, 0, 0, 1, 1,
0.7503073, 0.3484958, 1.270784, 1, 0, 0, 1, 1,
0.754964, 0.5145281, 0.5126289, 1, 0, 0, 1, 1,
0.7561277, -0.2425493, 1.868091, 1, 0, 0, 1, 1,
0.7561824, 2.277428, 0.9552786, 0, 0, 0, 1, 1,
0.7591052, 0.5875408, 0.4663379, 0, 0, 0, 1, 1,
0.7600035, -0.04354874, 2.816684, 0, 0, 0, 1, 1,
0.7624984, 2.113366, 0.09718639, 0, 0, 0, 1, 1,
0.7632779, -0.7749667, 0.6339969, 0, 0, 0, 1, 1,
0.7643076, 0.8519756, 0.580049, 0, 0, 0, 1, 1,
0.7687761, 0.003954926, 3.181054, 0, 0, 0, 1, 1,
0.7696387, 0.5037031, -0.06898622, 1, 1, 1, 1, 1,
0.7710831, -1.526916, 1.818775, 1, 1, 1, 1, 1,
0.7714041, 0.01751752, 2.492213, 1, 1, 1, 1, 1,
0.7720408, -0.1493119, 2.939554, 1, 1, 1, 1, 1,
0.7737991, -0.6265337, 2.782759, 1, 1, 1, 1, 1,
0.7764693, 0.5186195, -0.851923, 1, 1, 1, 1, 1,
0.7769845, -0.756134, 3.434849, 1, 1, 1, 1, 1,
0.7772117, -0.7442343, 2.541307, 1, 1, 1, 1, 1,
0.7774675, -1.780703, 2.889096, 1, 1, 1, 1, 1,
0.7789034, -1.600133, 2.978616, 1, 1, 1, 1, 1,
0.7803164, -0.6220405, 1.761884, 1, 1, 1, 1, 1,
0.7869959, -0.4610885, -0.6461539, 1, 1, 1, 1, 1,
0.7894087, -0.7867071, 2.427617, 1, 1, 1, 1, 1,
0.8070773, 0.9320551, 1.181461, 1, 1, 1, 1, 1,
0.8072268, -1.069214, 1.617243, 1, 1, 1, 1, 1,
0.8072648, 1.07784, 0.9185136, 0, 0, 1, 1, 1,
0.8119709, -0.1406778, 3.006955, 1, 0, 0, 1, 1,
0.8152829, 0.5159703, 2.182638, 1, 0, 0, 1, 1,
0.8257993, 2.455494, -0.4093739, 1, 0, 0, 1, 1,
0.8259485, 0.03711598, 2.125784, 1, 0, 0, 1, 1,
0.8285737, -1.569162, 1.816916, 1, 0, 0, 1, 1,
0.8317503, -0.6264382, 1.854635, 0, 0, 0, 1, 1,
0.8352003, -1.18522, 2.327642, 0, 0, 0, 1, 1,
0.8371607, 0.6723418, 1.677646, 0, 0, 0, 1, 1,
0.8422932, -0.4264248, 3.687866, 0, 0, 0, 1, 1,
0.8484421, 0.8766561, 1.974542, 0, 0, 0, 1, 1,
0.8557421, 0.8368945, 2.283886, 0, 0, 0, 1, 1,
0.8599443, 0.03354809, 1.017683, 0, 0, 0, 1, 1,
0.8715317, -0.4929642, 2.561682, 1, 1, 1, 1, 1,
0.8753557, 0.6643656, -0.2010186, 1, 1, 1, 1, 1,
0.8777965, -1.079455, 3.303957, 1, 1, 1, 1, 1,
0.8879648, -0.8423122, 3.429896, 1, 1, 1, 1, 1,
0.8890331, -0.04504734, 1.6858, 1, 1, 1, 1, 1,
0.8914548, -2.31809, 1.437995, 1, 1, 1, 1, 1,
0.8967498, -0.6602086, 0.7684178, 1, 1, 1, 1, 1,
0.8978037, 0.07523862, 0.02071352, 1, 1, 1, 1, 1,
0.8985091, 0.9583111, 0.9961264, 1, 1, 1, 1, 1,
0.9041579, -1.52566, 1.373474, 1, 1, 1, 1, 1,
0.9051442, 0.5658523, 2.073117, 1, 1, 1, 1, 1,
0.9105175, -1.110416, 3.98732, 1, 1, 1, 1, 1,
0.9145319, -0.5279418, 2.493001, 1, 1, 1, 1, 1,
0.9204925, -1.474045, 1.96057, 1, 1, 1, 1, 1,
0.9258542, -0.6633526, 0.5269781, 1, 1, 1, 1, 1,
0.927828, 1.043143, 1.513409, 0, 0, 1, 1, 1,
0.9304113, -0.8211373, 1.801958, 1, 0, 0, 1, 1,
0.9304126, -0.893331, 3.225617, 1, 0, 0, 1, 1,
0.9362711, -1.233889, 1.697567, 1, 0, 0, 1, 1,
0.9381567, 0.1351079, 0.34711, 1, 0, 0, 1, 1,
0.9429949, -0.3863285, 2.814812, 1, 0, 0, 1, 1,
0.9609255, 0.1700516, 1.772466, 0, 0, 0, 1, 1,
0.9660065, 0.8505144, 2.569393, 0, 0, 0, 1, 1,
0.9664775, -0.3389487, -0.1455728, 0, 0, 0, 1, 1,
0.9714466, 0.5159101, 2.391292, 0, 0, 0, 1, 1,
0.9738754, 0.6890724, -0.009271749, 0, 0, 0, 1, 1,
0.9768329, -0.09886445, 1.002538, 0, 0, 0, 1, 1,
0.9812856, 1.385799, 0.7698619, 0, 0, 0, 1, 1,
0.9831475, 1.764368, -0.1981285, 1, 1, 1, 1, 1,
0.9837856, -1.358087, 2.550699, 1, 1, 1, 1, 1,
0.9844766, -1.315956, 3.444904, 1, 1, 1, 1, 1,
0.9852369, -0.3841361, 1.069612, 1, 1, 1, 1, 1,
0.9914522, -1.207389, 3.669699, 1, 1, 1, 1, 1,
0.9916981, 0.1475906, -0.4999605, 1, 1, 1, 1, 1,
0.9919602, -0.418881, 2.279756, 1, 1, 1, 1, 1,
0.9929591, -0.4065854, 2.30243, 1, 1, 1, 1, 1,
0.9967563, -1.20301, 2.261642, 1, 1, 1, 1, 1,
1.001521, 0.9377838, -0.8324834, 1, 1, 1, 1, 1,
1.001699, -0.7095942, 1.811018, 1, 1, 1, 1, 1,
1.009895, 0.4829795, -0.4738097, 1, 1, 1, 1, 1,
1.018652, -0.9801663, 0.5646316, 1, 1, 1, 1, 1,
1.024705, 1.281905, 0.7244801, 1, 1, 1, 1, 1,
1.030857, 0.5331741, 1.670475, 1, 1, 1, 1, 1,
1.043839, -0.3387376, 1.493814, 0, 0, 1, 1, 1,
1.057917, -0.4748417, 1.901356, 1, 0, 0, 1, 1,
1.058503, -0.351111, 1.222722, 1, 0, 0, 1, 1,
1.062659, -0.998418, 2.072388, 1, 0, 0, 1, 1,
1.072909, -0.8862681, 3.464206, 1, 0, 0, 1, 1,
1.073718, 0.7281578, 1.205568, 1, 0, 0, 1, 1,
1.075242, -0.9333987, 2.873737, 0, 0, 0, 1, 1,
1.076684, 1.570294, -0.590322, 0, 0, 0, 1, 1,
1.077395, 1.623772, -1.242236, 0, 0, 0, 1, 1,
1.079141, 0.8205677, 2.635911, 0, 0, 0, 1, 1,
1.082665, -1.035367, 2.220719, 0, 0, 0, 1, 1,
1.090302, 0.1071805, 1.00457, 0, 0, 0, 1, 1,
1.090629, 0.04698292, 0.6430942, 0, 0, 0, 1, 1,
1.095002, -0.5014234, 2.367096, 1, 1, 1, 1, 1,
1.097293, 0.5807005, -0.3120974, 1, 1, 1, 1, 1,
1.097475, 0.4895024, 3.015664, 1, 1, 1, 1, 1,
1.10604, -1.298269, 2.976825, 1, 1, 1, 1, 1,
1.110367, 0.1825121, 3.152901, 1, 1, 1, 1, 1,
1.114437, -0.7316, 2.45621, 1, 1, 1, 1, 1,
1.115609, 1.369275, -0.004659315, 1, 1, 1, 1, 1,
1.116051, -0.2084571, 0.9660777, 1, 1, 1, 1, 1,
1.116094, -0.459085, 0.5134968, 1, 1, 1, 1, 1,
1.12084, -0.03518855, 0.3436485, 1, 1, 1, 1, 1,
1.123454, 0.4685214, 3.127655, 1, 1, 1, 1, 1,
1.12375, 1.593914, 0.3998848, 1, 1, 1, 1, 1,
1.128753, -0.2208156, 2.609244, 1, 1, 1, 1, 1,
1.133528, 0.09393068, 0.5441352, 1, 1, 1, 1, 1,
1.136398, -0.2548352, 1.817119, 1, 1, 1, 1, 1,
1.138127, 0.1737291, 3.03128, 0, 0, 1, 1, 1,
1.139952, -0.8574001, 1.558321, 1, 0, 0, 1, 1,
1.147164, -1.783442, 2.069009, 1, 0, 0, 1, 1,
1.147469, 0.2216478, 0.9660354, 1, 0, 0, 1, 1,
1.154189, 0.9871059, 0.5257021, 1, 0, 0, 1, 1,
1.169371, -0.6908517, 3.575365, 1, 0, 0, 1, 1,
1.177996, -1.081363, 2.09201, 0, 0, 0, 1, 1,
1.180164, 0.2643509, 0.7648801, 0, 0, 0, 1, 1,
1.180958, 0.6489521, 2.066961, 0, 0, 0, 1, 1,
1.187624, 0.8796664, 0.9152842, 0, 0, 0, 1, 1,
1.193237, 0.1129203, 2.377005, 0, 0, 0, 1, 1,
1.196221, 0.6400374, 1.574689, 0, 0, 0, 1, 1,
1.196852, -0.6321352, 2.045915, 0, 0, 0, 1, 1,
1.198258, -0.1979887, 0.5428942, 1, 1, 1, 1, 1,
1.209753, -0.8106145, 3.340231, 1, 1, 1, 1, 1,
1.226781, -0.7607382, 3.402838, 1, 1, 1, 1, 1,
1.232602, -0.3140453, 2.838606, 1, 1, 1, 1, 1,
1.24, 0.7932664, 1.121281, 1, 1, 1, 1, 1,
1.24228, 0.1226718, 2.425838, 1, 1, 1, 1, 1,
1.242813, -0.9551899, 2.387702, 1, 1, 1, 1, 1,
1.249083, 0.3618055, 2.451138, 1, 1, 1, 1, 1,
1.249709, 0.01958994, 1.828738, 1, 1, 1, 1, 1,
1.253744, 1.492558, 1.154112, 1, 1, 1, 1, 1,
1.259604, -0.6557516, 1.769164, 1, 1, 1, 1, 1,
1.261415, 1.429226, 1.478167, 1, 1, 1, 1, 1,
1.262107, 1.049673, -0.2088191, 1, 1, 1, 1, 1,
1.262309, 2.087668, 0.7572244, 1, 1, 1, 1, 1,
1.265462, 1.03647, 2.037487, 1, 1, 1, 1, 1,
1.268445, 0.3792053, 0.7993922, 0, 0, 1, 1, 1,
1.272479, 0.4623377, 1.672294, 1, 0, 0, 1, 1,
1.282049, -0.1706405, 1.644298, 1, 0, 0, 1, 1,
1.304302, 0.6821092, 2.169591, 1, 0, 0, 1, 1,
1.307393, -0.1828809, 1.209359, 1, 0, 0, 1, 1,
1.334511, 0.1716097, 1.429939, 1, 0, 0, 1, 1,
1.343854, -0.4664799, 2.109422, 0, 0, 0, 1, 1,
1.3455, 1.053582, 0.2681723, 0, 0, 0, 1, 1,
1.347352, 1.685055, 0.2362796, 0, 0, 0, 1, 1,
1.34776, -0.06278042, 1.920532, 0, 0, 0, 1, 1,
1.349837, -0.3434625, -0.02924788, 0, 0, 0, 1, 1,
1.353488, -1.527298, 3.018538, 0, 0, 0, 1, 1,
1.357604, -1.976875, 3.874364, 0, 0, 0, 1, 1,
1.362437, 1.740455, 1.236317, 1, 1, 1, 1, 1,
1.364161, -0.1201477, 2.753928, 1, 1, 1, 1, 1,
1.365652, -0.6144195, -0.2667138, 1, 1, 1, 1, 1,
1.367437, -0.3996795, 1.87115, 1, 1, 1, 1, 1,
1.377293, 1.060605, 0.5024722, 1, 1, 1, 1, 1,
1.390406, 0.4574843, 0.4692713, 1, 1, 1, 1, 1,
1.410844, -1.151297, 3.237934, 1, 1, 1, 1, 1,
1.41826, -0.9094318, 2.003894, 1, 1, 1, 1, 1,
1.420238, 0.01478262, 1.537758, 1, 1, 1, 1, 1,
1.421124, 0.8212479, 0.119649, 1, 1, 1, 1, 1,
1.421836, -0.4749946, 2.247329, 1, 1, 1, 1, 1,
1.423009, -1.235548, 0.6315064, 1, 1, 1, 1, 1,
1.430592, 0.1899584, 1.065883, 1, 1, 1, 1, 1,
1.434152, -1.263546, 2.861327, 1, 1, 1, 1, 1,
1.439443, -0.08365534, 1.243295, 1, 1, 1, 1, 1,
1.445806, 0.2245095, 2.302428, 0, 0, 1, 1, 1,
1.448177, -0.5700254, 1.022666, 1, 0, 0, 1, 1,
1.459861, 1.093827, 0.5896432, 1, 0, 0, 1, 1,
1.474127, -0.8630976, 1.558506, 1, 0, 0, 1, 1,
1.478754, -0.1458488, 0.32367, 1, 0, 0, 1, 1,
1.482624, 0.7323585, 1.548146, 1, 0, 0, 1, 1,
1.485489, -0.5145718, 2.550721, 0, 0, 0, 1, 1,
1.50142, -0.65153, 1.342901, 0, 0, 0, 1, 1,
1.502195, 0.2028046, 2.165492, 0, 0, 0, 1, 1,
1.502586, -1.556412, 2.46475, 0, 0, 0, 1, 1,
1.514279, -1.574785, 0.9963263, 0, 0, 0, 1, 1,
1.523133, -1.367819, 3.071455, 0, 0, 0, 1, 1,
1.523702, -0.2209607, 0.9104922, 0, 0, 0, 1, 1,
1.529319, -0.1393497, 1.069792, 1, 1, 1, 1, 1,
1.532404, 0.3543855, 2.392172, 1, 1, 1, 1, 1,
1.536333, -2.402795, 3.302902, 1, 1, 1, 1, 1,
1.549182, -0.35847, 0.8277176, 1, 1, 1, 1, 1,
1.558682, 0.7939937, 1.443385, 1, 1, 1, 1, 1,
1.577412, -0.06195475, 2.339981, 1, 1, 1, 1, 1,
1.579232, 0.9767582, -0.4449238, 1, 1, 1, 1, 1,
1.596788, -0.5198367, 3.523708, 1, 1, 1, 1, 1,
1.611689, -0.6446629, 1.622841, 1, 1, 1, 1, 1,
1.617091, 1.158141, -0.9546947, 1, 1, 1, 1, 1,
1.63123, 0.9387174, -0.4677507, 1, 1, 1, 1, 1,
1.63642, 0.01794508, 2.832632, 1, 1, 1, 1, 1,
1.64604, 0.7469419, 1.493884, 1, 1, 1, 1, 1,
1.649364, -0.2799781, 1.23322, 1, 1, 1, 1, 1,
1.651966, -0.05161869, 1.764106, 1, 1, 1, 1, 1,
1.656061, -1.018418, 3.063133, 0, 0, 1, 1, 1,
1.663611, 1.134223, 1.210364, 1, 0, 0, 1, 1,
1.686232, 0.08719834, 2.377495, 1, 0, 0, 1, 1,
1.699023, -1.389751, 2.333898, 1, 0, 0, 1, 1,
1.70173, -1.539361, 3.192098, 1, 0, 0, 1, 1,
1.719464, -0.4750145, -0.05828851, 1, 0, 0, 1, 1,
1.724408, -0.8987765, 3.189571, 0, 0, 0, 1, 1,
1.743324, -0.5014815, 2.268712, 0, 0, 0, 1, 1,
1.75289, -1.01094, 1.437248, 0, 0, 0, 1, 1,
1.754782, -1.08823, 1.551457, 0, 0, 0, 1, 1,
1.75852, -0.4996733, 1.788197, 0, 0, 0, 1, 1,
1.759213, -1.595211, 1.041374, 0, 0, 0, 1, 1,
1.760145, -0.03746065, 1.457064, 0, 0, 0, 1, 1,
1.763753, 0.7980126, 0.1642317, 1, 1, 1, 1, 1,
1.804629, 0.1417589, 1.591869, 1, 1, 1, 1, 1,
1.825323, -0.03806666, 0.23353, 1, 1, 1, 1, 1,
1.859017, -0.4455625, 2.320641, 1, 1, 1, 1, 1,
1.860699, 1.045888, 0.001498425, 1, 1, 1, 1, 1,
1.861597, 2.842659, 1.003759, 1, 1, 1, 1, 1,
1.862279, -0.4400249, 2.492956, 1, 1, 1, 1, 1,
1.864103, 0.006368593, 1.187866, 1, 1, 1, 1, 1,
1.876312, 0.2034934, 2.97909, 1, 1, 1, 1, 1,
1.876743, 1.035438, 0.1387687, 1, 1, 1, 1, 1,
1.878328, 0.5609533, 1.532204, 1, 1, 1, 1, 1,
1.888739, 0.5431221, 0.5926505, 1, 1, 1, 1, 1,
1.938492, -0.1475765, 1.740355, 1, 1, 1, 1, 1,
1.958056, -0.5410417, 1.890849, 1, 1, 1, 1, 1,
1.983712, -0.9598334, 3.019892, 1, 1, 1, 1, 1,
1.99081, 1.184816, 1.727353, 0, 0, 1, 1, 1,
2.039559, 0.9578899, 1.162858, 1, 0, 0, 1, 1,
2.052591, 0.5527187, 1.248605, 1, 0, 0, 1, 1,
2.053934, -0.182618, 0.2959533, 1, 0, 0, 1, 1,
2.065037, 0.727515, 0.5399212, 1, 0, 0, 1, 1,
2.071124, -1.329784, 3.9911, 1, 0, 0, 1, 1,
2.147108, -0.7940382, 2.449667, 0, 0, 0, 1, 1,
2.165212, 0.2529804, 3.781947, 0, 0, 0, 1, 1,
2.16986, -0.6012176, 1.709206, 0, 0, 0, 1, 1,
2.202949, 1.272882, 0.8732882, 0, 0, 0, 1, 1,
2.229436, 0.4704821, 2.413121, 0, 0, 0, 1, 1,
2.282242, 0.2004843, 1.037596, 0, 0, 0, 1, 1,
2.288472, -0.001266114, 1.502482, 0, 0, 0, 1, 1,
2.289717, 0.1265752, 1.099188, 1, 1, 1, 1, 1,
2.328529, -0.2313605, 3.394873, 1, 1, 1, 1, 1,
2.560316, -0.07016157, 1.320179, 1, 1, 1, 1, 1,
2.641606, -0.3422925, 1.415891, 1, 1, 1, 1, 1,
2.642867, 0.2685959, 1.038685, 1, 1, 1, 1, 1,
2.81032, -1.682048, 2.185071, 1, 1, 1, 1, 1,
3.32814, 1.090427, 1.790464, 1, 1, 1, 1, 1
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
var radius = 9.729318;
var distance = 34.17382;
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
mvMatrix.translate( -0.2904338, 0.2657654, -0.4311466 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.17382);
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