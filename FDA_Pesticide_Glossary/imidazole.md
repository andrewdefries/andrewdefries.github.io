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
-3.066276, -0.02897084, -3.126584, 1, 0, 0, 1,
-2.930886, 0.9455769, -2.057232, 1, 0.007843138, 0, 1,
-2.752216, 0.1136395, 0.5612913, 1, 0.01176471, 0, 1,
-2.721792, 0.2530529, -2.01125, 1, 0.01960784, 0, 1,
-2.620276, 1.06882, -0.2887909, 1, 0.02352941, 0, 1,
-2.508024, 0.09935699, -2.457625, 1, 0.03137255, 0, 1,
-2.41722, 0.3146052, -3.343947, 1, 0.03529412, 0, 1,
-2.404652, -1.035712, -2.603138, 1, 0.04313726, 0, 1,
-2.320727, -0.1673068, -3.118477, 1, 0.04705882, 0, 1,
-2.294715, 0.01622677, -2.740397, 1, 0.05490196, 0, 1,
-2.289563, 0.3443201, -1.71452, 1, 0.05882353, 0, 1,
-2.158913, 1.402648, -0.9620591, 1, 0.06666667, 0, 1,
-2.130311, -0.4003631, -0.9886472, 1, 0.07058824, 0, 1,
-2.029554, 2.463342, 0.1421641, 1, 0.07843138, 0, 1,
-2.018527, 0.4265567, 0.349197, 1, 0.08235294, 0, 1,
-2.017288, 2.368726, -2.668553, 1, 0.09019608, 0, 1,
-2.011535, 0.3826339, -1.390342, 1, 0.09411765, 0, 1,
-1.925035, -0.35847, -1.928469, 1, 0.1019608, 0, 1,
-1.912156, -0.4838262, -2.279652, 1, 0.1098039, 0, 1,
-1.899624, 0.05144816, -1.584946, 1, 0.1137255, 0, 1,
-1.875186, -0.6327652, -1.054893, 1, 0.1215686, 0, 1,
-1.872114, -0.7469019, -2.303695, 1, 0.1254902, 0, 1,
-1.8398, 1.100371, -1.413249, 1, 0.1333333, 0, 1,
-1.826364, -0.2342145, -2.578634, 1, 0.1372549, 0, 1,
-1.798311, 1.197573, -2.5762, 1, 0.145098, 0, 1,
-1.795235, -0.0003029746, -1.18144, 1, 0.1490196, 0, 1,
-1.765103, 0.3515965, -1.29556, 1, 0.1568628, 0, 1,
-1.761421, 0.1853042, -3.099404, 1, 0.1607843, 0, 1,
-1.745998, 1.155546, -2.22548, 1, 0.1686275, 0, 1,
-1.737099, -0.300742, -1.238389, 1, 0.172549, 0, 1,
-1.73472, 0.689505, -2.964953, 1, 0.1803922, 0, 1,
-1.716656, 1.198307, -0.06538486, 1, 0.1843137, 0, 1,
-1.710603, -0.3186085, -2.025046, 1, 0.1921569, 0, 1,
-1.687011, -0.9589544, -2.799315, 1, 0.1960784, 0, 1,
-1.682338, 0.3810566, -2.480092, 1, 0.2039216, 0, 1,
-1.645196, -0.6763104, -3.361949, 1, 0.2117647, 0, 1,
-1.638219, 0.5443994, -0.2251318, 1, 0.2156863, 0, 1,
-1.625785, -1.270025, -2.883136, 1, 0.2235294, 0, 1,
-1.624775, 0.04824866, -0.7349871, 1, 0.227451, 0, 1,
-1.61046, 0.08664007, 0.3888358, 1, 0.2352941, 0, 1,
-1.60089, 0.6969299, -1.191094, 1, 0.2392157, 0, 1,
-1.599876, -0.6359449, -2.721914, 1, 0.2470588, 0, 1,
-1.59328, 0.03612142, -0.6267319, 1, 0.2509804, 0, 1,
-1.589982, 1.118563, 0.3906537, 1, 0.2588235, 0, 1,
-1.570721, 0.008828435, -2.120772, 1, 0.2627451, 0, 1,
-1.569692, 0.9112547, -0.4602574, 1, 0.2705882, 0, 1,
-1.568397, -0.03520666, -1.737221, 1, 0.2745098, 0, 1,
-1.561448, 0.3956474, -1.071514, 1, 0.282353, 0, 1,
-1.555984, 0.5633454, -0.5545181, 1, 0.2862745, 0, 1,
-1.555045, 0.668617, -0.7630094, 1, 0.2941177, 0, 1,
-1.554362, 0.6737096, -1.984274, 1, 0.3019608, 0, 1,
-1.549877, -0.7066012, -0.4987777, 1, 0.3058824, 0, 1,
-1.504667, 1.711767, -1.336031, 1, 0.3137255, 0, 1,
-1.504508, -1.157352, -2.092355, 1, 0.3176471, 0, 1,
-1.481059, 0.01615758, -1.947063, 1, 0.3254902, 0, 1,
-1.468354, 0.6827846, -2.937895, 1, 0.3294118, 0, 1,
-1.466271, -1.517162, -3.332754, 1, 0.3372549, 0, 1,
-1.466228, -0.4076267, -1.290201, 1, 0.3411765, 0, 1,
-1.449495, -0.5226364, -0.4035154, 1, 0.3490196, 0, 1,
-1.444384, -0.3985769, -0.8579882, 1, 0.3529412, 0, 1,
-1.438318, 0.1973486, -1.359591, 1, 0.3607843, 0, 1,
-1.435931, -1.714991, -2.919144, 1, 0.3647059, 0, 1,
-1.432824, -0.6852667, -1.383957, 1, 0.372549, 0, 1,
-1.429502, -0.7322569, -3.915165, 1, 0.3764706, 0, 1,
-1.405578, -1.343152, -1.350765, 1, 0.3843137, 0, 1,
-1.403179, 1.862465, -1.305479, 1, 0.3882353, 0, 1,
-1.402684, 1.648678, 0.2957216, 1, 0.3960784, 0, 1,
-1.399955, -0.6233936, -1.74163, 1, 0.4039216, 0, 1,
-1.387075, -1.034637, -3.093631, 1, 0.4078431, 0, 1,
-1.378316, 0.05049505, -3.45265, 1, 0.4156863, 0, 1,
-1.376518, -0.6226735, -0.8088846, 1, 0.4196078, 0, 1,
-1.368197, -0.1601643, -3.4736, 1, 0.427451, 0, 1,
-1.357681, 0.5382976, 0.2564521, 1, 0.4313726, 0, 1,
-1.3448, 1.009162, -1.005833, 1, 0.4392157, 0, 1,
-1.343481, 1.556117, -0.6533926, 1, 0.4431373, 0, 1,
-1.340446, -0.01736482, -1.347128, 1, 0.4509804, 0, 1,
-1.336481, 0.9199224, -1.649652, 1, 0.454902, 0, 1,
-1.329689, 0.2602044, -1.460517, 1, 0.4627451, 0, 1,
-1.326213, 0.5063012, -0.1832722, 1, 0.4666667, 0, 1,
-1.325103, 1.24103, -0.3174725, 1, 0.4745098, 0, 1,
-1.323621, -0.09558614, -1.190079, 1, 0.4784314, 0, 1,
-1.323434, -0.8452197, -1.352511, 1, 0.4862745, 0, 1,
-1.312083, 1.13885, -0.03437485, 1, 0.4901961, 0, 1,
-1.308315, 0.2531441, -1.5552, 1, 0.4980392, 0, 1,
-1.308129, -0.01210677, -1.188234, 1, 0.5058824, 0, 1,
-1.304662, -1.257027, -1.77845, 1, 0.509804, 0, 1,
-1.297779, -1.110664, -2.940439, 1, 0.5176471, 0, 1,
-1.287823, 1.256202, -1.413963, 1, 0.5215687, 0, 1,
-1.278868, 0.5768449, -1.346489, 1, 0.5294118, 0, 1,
-1.27848, -0.1708095, -1.070036, 1, 0.5333334, 0, 1,
-1.273605, -2.047239, -1.779723, 1, 0.5411765, 0, 1,
-1.264567, 0.2646923, -1.324392, 1, 0.5450981, 0, 1,
-1.257541, 0.4464105, -0.7318943, 1, 0.5529412, 0, 1,
-1.242668, -0.2890985, -2.261306, 1, 0.5568628, 0, 1,
-1.23621, 0.2682841, -1.583285, 1, 0.5647059, 0, 1,
-1.218745, -0.9235018, -3.934028, 1, 0.5686275, 0, 1,
-1.214806, -1.033157, -4.732982, 1, 0.5764706, 0, 1,
-1.213616, 0.7349311, -0.215727, 1, 0.5803922, 0, 1,
-1.20536, -0.4421187, -0.548792, 1, 0.5882353, 0, 1,
-1.202461, -0.2124903, -1.221781, 1, 0.5921569, 0, 1,
-1.183008, -2.011709, -0.7045755, 1, 0.6, 0, 1,
-1.181369, 0.8469887, -0.4006277, 1, 0.6078432, 0, 1,
-1.173892, -0.2997622, -2.790044, 1, 0.6117647, 0, 1,
-1.173734, 0.006831754, -1.483858, 1, 0.6196079, 0, 1,
-1.168271, 0.5469677, -0.4300813, 1, 0.6235294, 0, 1,
-1.164196, 1.070376, -0.2138672, 1, 0.6313726, 0, 1,
-1.162705, 1.553867, 0.37666, 1, 0.6352941, 0, 1,
-1.15383, 0.2041249, -0.9627815, 1, 0.6431373, 0, 1,
-1.152087, 0.3872998, -2.209887, 1, 0.6470588, 0, 1,
-1.151627, -2.273491, -5.386397, 1, 0.654902, 0, 1,
-1.148697, 2.874338, -0.891215, 1, 0.6588235, 0, 1,
-1.147857, -0.9360628, -2.44292, 1, 0.6666667, 0, 1,
-1.139692, -1.319932, -1.855976, 1, 0.6705883, 0, 1,
-1.138419, -1.199025, -2.809312, 1, 0.6784314, 0, 1,
-1.13775, -0.1981798, -1.390883, 1, 0.682353, 0, 1,
-1.136975, -0.4262226, -3.216662, 1, 0.6901961, 0, 1,
-1.13236, 0.3122383, -2.879107, 1, 0.6941177, 0, 1,
-1.125306, 0.3595308, -2.302545, 1, 0.7019608, 0, 1,
-1.123393, 1.986912, 0.4378828, 1, 0.7098039, 0, 1,
-1.118631, -0.02991323, -2.550668, 1, 0.7137255, 0, 1,
-1.111707, 0.4471286, -1.843135, 1, 0.7215686, 0, 1,
-1.11035, 0.6955237, 0.4538285, 1, 0.7254902, 0, 1,
-1.104757, -0.5109888, -1.111347, 1, 0.7333333, 0, 1,
-1.103621, -0.8516122, -2.688323, 1, 0.7372549, 0, 1,
-1.102544, 0.3822035, -1.547291, 1, 0.7450981, 0, 1,
-1.100543, 0.3044859, -0.5107721, 1, 0.7490196, 0, 1,
-1.098303, -0.7715847, -4.10735, 1, 0.7568628, 0, 1,
-1.084169, -0.7959107, -2.806704, 1, 0.7607843, 0, 1,
-1.080451, 0.5063005, 0.08771767, 1, 0.7686275, 0, 1,
-1.077041, -0.5023367, -2.028468, 1, 0.772549, 0, 1,
-1.071322, -0.00590675, 0.6663333, 1, 0.7803922, 0, 1,
-1.061061, -2.322972, -3.232795, 1, 0.7843137, 0, 1,
-1.038545, 1.881341, -0.3403451, 1, 0.7921569, 0, 1,
-1.03396, 0.3920124, -1.050817, 1, 0.7960784, 0, 1,
-1.032126, 0.7357681, -0.7235223, 1, 0.8039216, 0, 1,
-1.026915, -0.2281041, -1.836133, 1, 0.8117647, 0, 1,
-1.026133, -0.01875939, -2.418849, 1, 0.8156863, 0, 1,
-1.019418, -0.2563473, -0.8386688, 1, 0.8235294, 0, 1,
-1.018279, 0.8558577, 0.6944157, 1, 0.827451, 0, 1,
-1.014979, 0.1593213, -1.557965, 1, 0.8352941, 0, 1,
-1.013059, -0.5105019, -1.160467, 1, 0.8392157, 0, 1,
-1.008305, 0.3306123, -0.351639, 1, 0.8470588, 0, 1,
-1.002949, -1.374781, -2.95854, 1, 0.8509804, 0, 1,
-0.9998532, -1.083215, -2.890161, 1, 0.8588235, 0, 1,
-0.9975131, 1.549433, -0.08090837, 1, 0.8627451, 0, 1,
-0.9947826, 0.4074547, -0.4800922, 1, 0.8705882, 0, 1,
-0.9881439, 0.1963994, -0.8980017, 1, 0.8745098, 0, 1,
-0.9834641, -0.4544359, -0.605856, 1, 0.8823529, 0, 1,
-0.9783528, -1.662573, -4.41734, 1, 0.8862745, 0, 1,
-0.9779342, 1.063824, -1.835846, 1, 0.8941177, 0, 1,
-0.9720482, -0.2963815, -3.068744, 1, 0.8980392, 0, 1,
-0.9689876, -1.045323, -2.865443, 1, 0.9058824, 0, 1,
-0.9634414, 0.3254871, -0.947112, 1, 0.9137255, 0, 1,
-0.9627821, -0.7005422, 0.3177654, 1, 0.9176471, 0, 1,
-0.9590774, 0.1827336, -1.008238, 1, 0.9254902, 0, 1,
-0.953157, -0.7189317, -2.341394, 1, 0.9294118, 0, 1,
-0.9477443, -0.6776546, -2.055912, 1, 0.9372549, 0, 1,
-0.9474038, -0.2434964, -3.043917, 1, 0.9411765, 0, 1,
-0.9464595, 1.33027, -2.389823, 1, 0.9490196, 0, 1,
-0.9463323, -0.2367342, -1.422034, 1, 0.9529412, 0, 1,
-0.9385158, 0.3366177, -0.268488, 1, 0.9607843, 0, 1,
-0.9355301, 0.1846453, -1.354408, 1, 0.9647059, 0, 1,
-0.9318008, 0.2600462, -0.7940536, 1, 0.972549, 0, 1,
-0.9240908, -0.008318475, -1.503585, 1, 0.9764706, 0, 1,
-0.9170936, -1.320303, -2.994239, 1, 0.9843137, 0, 1,
-0.9168735, -0.7913843, -2.42566, 1, 0.9882353, 0, 1,
-0.9122708, -0.6371337, -0.5938364, 1, 0.9960784, 0, 1,
-0.9110916, 1.178779, 0.8185592, 0.9960784, 1, 0, 1,
-0.907572, 0.8281211, -1.907416, 0.9921569, 1, 0, 1,
-0.902023, 1.804423, -0.6976439, 0.9843137, 1, 0, 1,
-0.8998536, -1.567777, -2.899331, 0.9803922, 1, 0, 1,
-0.8934503, 0.6592714, -0.9379644, 0.972549, 1, 0, 1,
-0.8914382, -0.09016274, -0.9317873, 0.9686275, 1, 0, 1,
-0.8877533, 1.268616, -2.4396, 0.9607843, 1, 0, 1,
-0.8850319, 1.261441, -0.3061646, 0.9568627, 1, 0, 1,
-0.8823404, -0.1601125, -1.613798, 0.9490196, 1, 0, 1,
-0.8803738, -1.001519, -4.25751, 0.945098, 1, 0, 1,
-0.8620439, 1.001118, -1.628651, 0.9372549, 1, 0, 1,
-0.8543344, -0.8332908, -3.203629, 0.9333333, 1, 0, 1,
-0.8538517, 0.4667031, -0.6546473, 0.9254902, 1, 0, 1,
-0.8523324, -0.1658814, -2.383173, 0.9215686, 1, 0, 1,
-0.850899, -0.6174684, -1.450272, 0.9137255, 1, 0, 1,
-0.8500568, 0.7832984, -1.270738, 0.9098039, 1, 0, 1,
-0.8500257, 0.4798627, -0.6702638, 0.9019608, 1, 0, 1,
-0.8494935, 2.45415, -0.07022215, 0.8941177, 1, 0, 1,
-0.8491966, 0.4690243, -0.3101042, 0.8901961, 1, 0, 1,
-0.8457972, 1.135772, -0.7697709, 0.8823529, 1, 0, 1,
-0.8452049, -1.118433, -2.086217, 0.8784314, 1, 0, 1,
-0.8417197, -1.409549, -2.732877, 0.8705882, 1, 0, 1,
-0.8413963, -0.6600347, -3.938325, 0.8666667, 1, 0, 1,
-0.8413599, 0.7389441, -1.977511, 0.8588235, 1, 0, 1,
-0.8337865, -0.2658785, -1.871754, 0.854902, 1, 0, 1,
-0.8315957, 1.734488, -0.6068019, 0.8470588, 1, 0, 1,
-0.8315483, 1.355705, -0.2190866, 0.8431373, 1, 0, 1,
-0.8289407, -0.9891738, -3.458824, 0.8352941, 1, 0, 1,
-0.8228493, 0.8402586, -1.328667, 0.8313726, 1, 0, 1,
-0.8197757, 0.1262373, -3.066864, 0.8235294, 1, 0, 1,
-0.8186971, -0.124384, -3.051172, 0.8196079, 1, 0, 1,
-0.8150581, -1.74481, -2.855355, 0.8117647, 1, 0, 1,
-0.812833, 0.05768789, -1.354141, 0.8078431, 1, 0, 1,
-0.8028904, 2.262471, 0.4543673, 0.8, 1, 0, 1,
-0.8027272, -0.2630243, -0.8100591, 0.7921569, 1, 0, 1,
-0.8002222, 0.03217722, 0.7556521, 0.7882353, 1, 0, 1,
-0.7819541, 0.6536037, -1.825204, 0.7803922, 1, 0, 1,
-0.7781518, 1.223095, 0.002816329, 0.7764706, 1, 0, 1,
-0.7773849, -1.909817, -2.71683, 0.7686275, 1, 0, 1,
-0.7756888, -0.2793243, -1.717881, 0.7647059, 1, 0, 1,
-0.7748322, -1.080928, -1.989962, 0.7568628, 1, 0, 1,
-0.7746478, 0.6535957, -0.6655681, 0.7529412, 1, 0, 1,
-0.7742932, -1.174927, -2.291641, 0.7450981, 1, 0, 1,
-0.7663422, -0.2659509, -2.687778, 0.7411765, 1, 0, 1,
-0.7584521, -0.2421123, -2.700694, 0.7333333, 1, 0, 1,
-0.7558882, -0.4442831, -4.044863, 0.7294118, 1, 0, 1,
-0.7514479, 1.242159, 0.4845738, 0.7215686, 1, 0, 1,
-0.7487956, -0.3706747, -2.003271, 0.7176471, 1, 0, 1,
-0.7408099, 0.4771875, -1.034379, 0.7098039, 1, 0, 1,
-0.7402819, -0.4790067, -1.395964, 0.7058824, 1, 0, 1,
-0.738286, 0.0007365297, 1.562078, 0.6980392, 1, 0, 1,
-0.7316146, -0.2795163, -0.9411789, 0.6901961, 1, 0, 1,
-0.7218069, 0.4091955, -0.9461929, 0.6862745, 1, 0, 1,
-0.7200881, -0.3161028, -3.311679, 0.6784314, 1, 0, 1,
-0.7115943, -0.5039521, -2.231172, 0.6745098, 1, 0, 1,
-0.7088737, -0.6166189, -2.841783, 0.6666667, 1, 0, 1,
-0.7043251, 0.2171807, -1.250255, 0.6627451, 1, 0, 1,
-0.697843, 0.9568899, -1.163062, 0.654902, 1, 0, 1,
-0.6969282, -1.239318, -2.750661, 0.6509804, 1, 0, 1,
-0.6927411, -0.2092707, -2.035645, 0.6431373, 1, 0, 1,
-0.689468, 0.576129, -2.035727, 0.6392157, 1, 0, 1,
-0.684995, -0.538336, -4.353452, 0.6313726, 1, 0, 1,
-0.6829763, 1.656515, 1.089201, 0.627451, 1, 0, 1,
-0.6826841, -0.4306425, 0.02093999, 0.6196079, 1, 0, 1,
-0.6821318, 1.348335, 1.036065, 0.6156863, 1, 0, 1,
-0.6788611, 0.3589589, -2.062126, 0.6078432, 1, 0, 1,
-0.6763104, -0.1011132, -2.689898, 0.6039216, 1, 0, 1,
-0.6748533, -0.8442537, -5.020606, 0.5960785, 1, 0, 1,
-0.6742844, -0.4790042, -1.960659, 0.5882353, 1, 0, 1,
-0.6725713, 0.2016069, -0.2909892, 0.5843138, 1, 0, 1,
-0.6673678, -0.204961, -3.321978, 0.5764706, 1, 0, 1,
-0.6647079, -0.4332043, -1.531003, 0.572549, 1, 0, 1,
-0.6569728, 1.007411, -0.8991352, 0.5647059, 1, 0, 1,
-0.6567153, -1.42904, -1.959134, 0.5607843, 1, 0, 1,
-0.6566669, 0.3521262, -0.7469613, 0.5529412, 1, 0, 1,
-0.648539, -0.07604253, -2.580846, 0.5490196, 1, 0, 1,
-0.6470607, -1.681581, -2.458247, 0.5411765, 1, 0, 1,
-0.6462002, -2.005012, -3.196944, 0.5372549, 1, 0, 1,
-0.6408851, -0.8191434, -3.23081, 0.5294118, 1, 0, 1,
-0.6390752, 0.9376768, -2.127575, 0.5254902, 1, 0, 1,
-0.6383171, -0.8391271, -2.768854, 0.5176471, 1, 0, 1,
-0.6356746, 0.2005328, -0.6431356, 0.5137255, 1, 0, 1,
-0.6352499, 0.07183438, -1.062327, 0.5058824, 1, 0, 1,
-0.6350009, 0.4438826, -0.2747711, 0.5019608, 1, 0, 1,
-0.6343302, -0.3270364, -1.769908, 0.4941176, 1, 0, 1,
-0.6336498, -0.5365942, -2.515982, 0.4862745, 1, 0, 1,
-0.6310269, -0.7964668, -1.588225, 0.4823529, 1, 0, 1,
-0.6294736, 1.387415, -0.4802303, 0.4745098, 1, 0, 1,
-0.6278667, 0.516991, -2.030483, 0.4705882, 1, 0, 1,
-0.6259412, -0.3549302, -1.560581, 0.4627451, 1, 0, 1,
-0.6235313, 0.7855343, -1.522642, 0.4588235, 1, 0, 1,
-0.621138, 1.815665, -0.5046757, 0.4509804, 1, 0, 1,
-0.6204522, 1.661142, -1.873805, 0.4470588, 1, 0, 1,
-0.6199162, 0.1168135, -4.11988, 0.4392157, 1, 0, 1,
-0.6189796, 0.7540745, -0.8391345, 0.4352941, 1, 0, 1,
-0.6112424, -0.5307682, -1.524407, 0.427451, 1, 0, 1,
-0.6077311, 0.5005651, -0.1419945, 0.4235294, 1, 0, 1,
-0.6055738, -0.3975845, -1.75628, 0.4156863, 1, 0, 1,
-0.6047084, -1.102835, -3.380872, 0.4117647, 1, 0, 1,
-0.6034604, -0.2235936, -2.469507, 0.4039216, 1, 0, 1,
-0.6004121, 2.109349, -1.26206, 0.3960784, 1, 0, 1,
-0.5929118, 0.576599, 0.4764229, 0.3921569, 1, 0, 1,
-0.5897513, -0.4829477, -1.205165, 0.3843137, 1, 0, 1,
-0.5886772, 1.217291, 0.6014702, 0.3803922, 1, 0, 1,
-0.5884961, -0.04727642, -1.377084, 0.372549, 1, 0, 1,
-0.5876846, 1.471478, -0.5719621, 0.3686275, 1, 0, 1,
-0.5876011, -1.130803, -2.348347, 0.3607843, 1, 0, 1,
-0.5858447, 0.5868312, 0.2734928, 0.3568628, 1, 0, 1,
-0.5850564, 1.220196, -1.227673, 0.3490196, 1, 0, 1,
-0.5830946, 0.3222945, 0.1907472, 0.345098, 1, 0, 1,
-0.5750583, 1.000867, -2.272381, 0.3372549, 1, 0, 1,
-0.5742256, 1.671813, 0.7680994, 0.3333333, 1, 0, 1,
-0.5689272, -0.5675181, -0.4459831, 0.3254902, 1, 0, 1,
-0.5684936, 0.4309799, -0.1044314, 0.3215686, 1, 0, 1,
-0.5683333, 1.874382, -1.154432, 0.3137255, 1, 0, 1,
-0.5627527, 1.538567, 0.7730848, 0.3098039, 1, 0, 1,
-0.5614184, 0.3451776, -1.195125, 0.3019608, 1, 0, 1,
-0.5582538, -1.184393, -3.391816, 0.2941177, 1, 0, 1,
-0.5572366, -0.713505, -2.9503, 0.2901961, 1, 0, 1,
-0.5528503, -1.036641, -4.183913, 0.282353, 1, 0, 1,
-0.5475977, 0.1532743, -1.407766, 0.2784314, 1, 0, 1,
-0.5471117, -0.1153006, -2.723822, 0.2705882, 1, 0, 1,
-0.5414935, -0.7047553, -3.655043, 0.2666667, 1, 0, 1,
-0.5396788, -1.760616, -3.838889, 0.2588235, 1, 0, 1,
-0.5391067, -0.1450481, -1.812013, 0.254902, 1, 0, 1,
-0.5378233, -0.5045435, -1.173183, 0.2470588, 1, 0, 1,
-0.5371847, -0.1045336, -1.494676, 0.2431373, 1, 0, 1,
-0.5357641, -1.573212, -1.711499, 0.2352941, 1, 0, 1,
-0.5340997, -1.338992, -3.453149, 0.2313726, 1, 0, 1,
-0.5336626, -0.1832767, -1.884858, 0.2235294, 1, 0, 1,
-0.5302226, 1.52667, 0.7590799, 0.2196078, 1, 0, 1,
-0.5241884, 0.3649904, -1.2499, 0.2117647, 1, 0, 1,
-0.5206499, 1.012271, -2.594725, 0.2078431, 1, 0, 1,
-0.5093617, -0.811831, -4.123271, 0.2, 1, 0, 1,
-0.508922, -0.3920938, -3.890841, 0.1921569, 1, 0, 1,
-0.5068259, 0.3010188, -2.112947, 0.1882353, 1, 0, 1,
-0.4954526, -0.6406021, -3.891439, 0.1803922, 1, 0, 1,
-0.4952046, -1.083324, -2.208122, 0.1764706, 1, 0, 1,
-0.4940393, -1.483939, -2.549595, 0.1686275, 1, 0, 1,
-0.4933015, 0.4636735, 0.01750312, 0.1647059, 1, 0, 1,
-0.4896599, 0.5408292, 0.4472906, 0.1568628, 1, 0, 1,
-0.488284, -1.154075, -1.149206, 0.1529412, 1, 0, 1,
-0.4844848, 0.1043743, -1.335377, 0.145098, 1, 0, 1,
-0.4809034, -0.223997, -2.681669, 0.1411765, 1, 0, 1,
-0.4808191, -1.325421, -3.410058, 0.1333333, 1, 0, 1,
-0.4745268, -0.8955354, -3.425637, 0.1294118, 1, 0, 1,
-0.472528, 1.33989, 0.7378566, 0.1215686, 1, 0, 1,
-0.4723573, -0.7350777, -2.622411, 0.1176471, 1, 0, 1,
-0.4722059, 0.1876422, -0.9979971, 0.1098039, 1, 0, 1,
-0.4683768, 0.6255869, -2.109569, 0.1058824, 1, 0, 1,
-0.4673131, 0.3345234, 0.2012057, 0.09803922, 1, 0, 1,
-0.4665283, -1.259325, -2.955878, 0.09019608, 1, 0, 1,
-0.4594215, -0.8495305, -2.731637, 0.08627451, 1, 0, 1,
-0.4588376, -0.242961, -0.7763104, 0.07843138, 1, 0, 1,
-0.4506137, 0.03423942, -2.358269, 0.07450981, 1, 0, 1,
-0.4460852, -0.915643, -2.347574, 0.06666667, 1, 0, 1,
-0.4440725, 0.004244937, 0.7007031, 0.0627451, 1, 0, 1,
-0.4417912, 1.650725, -0.5997213, 0.05490196, 1, 0, 1,
-0.4395053, -0.2341951, -1.857544, 0.05098039, 1, 0, 1,
-0.4393348, 1.440066, -0.8963086, 0.04313726, 1, 0, 1,
-0.4369557, -0.09715591, -2.403658, 0.03921569, 1, 0, 1,
-0.4359489, 2.558819, 0.4151843, 0.03137255, 1, 0, 1,
-0.4327022, 0.9345361, -0.5398228, 0.02745098, 1, 0, 1,
-0.4293078, -0.5879399, -3.391108, 0.01960784, 1, 0, 1,
-0.42863, -0.5211039, -2.138851, 0.01568628, 1, 0, 1,
-0.4263059, 0.1191821, 0.2171918, 0.007843138, 1, 0, 1,
-0.4235516, -0.235884, -1.294984, 0.003921569, 1, 0, 1,
-0.4165807, -0.6886767, -1.000377, 0, 1, 0.003921569, 1,
-0.4154542, 0.2215704, -0.3234877, 0, 1, 0.01176471, 1,
-0.415275, -0.3093993, -3.075172, 0, 1, 0.01568628, 1,
-0.4112383, 0.6874503, -0.569616, 0, 1, 0.02352941, 1,
-0.4029199, 0.1794624, -1.338373, 0, 1, 0.02745098, 1,
-0.3995295, 0.15539, -0.3072175, 0, 1, 0.03529412, 1,
-0.3992642, 0.4916663, 0.003535327, 0, 1, 0.03921569, 1,
-0.3981347, 0.7507377, 3.235181, 0, 1, 0.04705882, 1,
-0.3975155, 0.9559773, -0.6797755, 0, 1, 0.05098039, 1,
-0.3946373, 0.1635223, -1.031763, 0, 1, 0.05882353, 1,
-0.3946201, -1.535239, -4.540177, 0, 1, 0.0627451, 1,
-0.3913156, -1.843152, -4.464429, 0, 1, 0.07058824, 1,
-0.3861414, 2.192641, -0.6844795, 0, 1, 0.07450981, 1,
-0.3849544, 1.782602, -0.9318696, 0, 1, 0.08235294, 1,
-0.3818209, 1.503367, -0.2041412, 0, 1, 0.08627451, 1,
-0.3754041, -0.4403584, -3.818653, 0, 1, 0.09411765, 1,
-0.3723788, 0.09437544, -1.263127, 0, 1, 0.1019608, 1,
-0.3710971, 1.17822, 0.224361, 0, 1, 0.1058824, 1,
-0.3702453, -2.843057, -2.802896, 0, 1, 0.1137255, 1,
-0.369327, -1.162521, -3.824071, 0, 1, 0.1176471, 1,
-0.3691964, -1.010456, -3.324046, 0, 1, 0.1254902, 1,
-0.3689415, -1.23454, -3.076963, 0, 1, 0.1294118, 1,
-0.3671061, 0.09744757, -2.75529, 0, 1, 0.1372549, 1,
-0.3653012, 0.2696012, -0.4611163, 0, 1, 0.1411765, 1,
-0.364557, 0.7064213, -0.4440367, 0, 1, 0.1490196, 1,
-0.3605411, 1.036102, -0.5079101, 0, 1, 0.1529412, 1,
-0.3603542, 0.5103205, -0.193192, 0, 1, 0.1607843, 1,
-0.3580559, -0.8709618, -2.344941, 0, 1, 0.1647059, 1,
-0.3521853, -0.5610499, -2.62153, 0, 1, 0.172549, 1,
-0.3501276, 0.9921959, -0.08844966, 0, 1, 0.1764706, 1,
-0.346706, 0.912277, -0.5376713, 0, 1, 0.1843137, 1,
-0.3463442, 1.117561, -0.9366566, 0, 1, 0.1882353, 1,
-0.3427727, -1.74139, -3.943458, 0, 1, 0.1960784, 1,
-0.3412, -0.4880641, -1.96814, 0, 1, 0.2039216, 1,
-0.338266, 0.5997763, -0.5320757, 0, 1, 0.2078431, 1,
-0.3353209, -1.585594, -2.764332, 0, 1, 0.2156863, 1,
-0.3347326, -0.01980005, -2.58172, 0, 1, 0.2196078, 1,
-0.3340001, -0.6405562, -2.424877, 0, 1, 0.227451, 1,
-0.3332843, -1.078103, -2.678563, 0, 1, 0.2313726, 1,
-0.3324002, -1.319539, -1.368206, 0, 1, 0.2392157, 1,
-0.3302376, -1.092163, -4.203829, 0, 1, 0.2431373, 1,
-0.3272943, -0.6647589, -3.846174, 0, 1, 0.2509804, 1,
-0.3235941, 0.3036507, -0.7890493, 0, 1, 0.254902, 1,
-0.3174836, 0.6993673, -0.2194446, 0, 1, 0.2627451, 1,
-0.3166652, -1.555361, -2.476488, 0, 1, 0.2666667, 1,
-0.3160905, -0.3462656, -2.774953, 0, 1, 0.2745098, 1,
-0.3133054, -1.3694, -3.619337, 0, 1, 0.2784314, 1,
-0.3073683, -0.5708016, -1.206471, 0, 1, 0.2862745, 1,
-0.305077, 1.104819, -0.3653736, 0, 1, 0.2901961, 1,
-0.3028448, 0.5681317, -0.596028, 0, 1, 0.2980392, 1,
-0.3016433, -1.776458, -0.7959613, 0, 1, 0.3058824, 1,
-0.292308, -0.4966435, -2.760342, 0, 1, 0.3098039, 1,
-0.2921487, -1.095016, -0.9070368, 0, 1, 0.3176471, 1,
-0.2919352, 0.002146532, -1.843349, 0, 1, 0.3215686, 1,
-0.2842395, -0.7540022, -3.042623, 0, 1, 0.3294118, 1,
-0.2791837, 0.7763374, -0.6251422, 0, 1, 0.3333333, 1,
-0.2779141, 0.04557747, -1.533672, 0, 1, 0.3411765, 1,
-0.2761152, -0.09350044, -0.6421018, 0, 1, 0.345098, 1,
-0.2740017, -0.6870565, -4.748563, 0, 1, 0.3529412, 1,
-0.2722445, 0.200891, -1.348156, 0, 1, 0.3568628, 1,
-0.2706411, 1.209919, 0.1380084, 0, 1, 0.3647059, 1,
-0.2680277, 0.918497, -0.551428, 0, 1, 0.3686275, 1,
-0.2669943, -1.772373, -3.884166, 0, 1, 0.3764706, 1,
-0.2652158, 0.9433743, 0.3779481, 0, 1, 0.3803922, 1,
-0.2555741, -1.046302, -3.370122, 0, 1, 0.3882353, 1,
-0.2549861, -0.6898962, -2.761303, 0, 1, 0.3921569, 1,
-0.2513238, -0.6294662, -2.308236, 0, 1, 0.4, 1,
-0.2431531, -0.9584308, -2.300053, 0, 1, 0.4078431, 1,
-0.2411648, -0.8995615, -3.418563, 0, 1, 0.4117647, 1,
-0.2351134, 0.4713261, -1.551725, 0, 1, 0.4196078, 1,
-0.2336299, -0.1829121, -4.638904, 0, 1, 0.4235294, 1,
-0.232554, 0.4659981, -2.118116, 0, 1, 0.4313726, 1,
-0.2303084, 1.539728, -0.5057215, 0, 1, 0.4352941, 1,
-0.2295474, 1.167151, -1.203538, 0, 1, 0.4431373, 1,
-0.2285075, -0.9549366, -2.63992, 0, 1, 0.4470588, 1,
-0.2274927, 0.57595, 1.252168, 0, 1, 0.454902, 1,
-0.2166357, -1.199069, -1.261216, 0, 1, 0.4588235, 1,
-0.2134734, 0.7559002, 0.0968324, 0, 1, 0.4666667, 1,
-0.2118471, -0.2501357, -0.275716, 0, 1, 0.4705882, 1,
-0.2077319, 0.1731229, -0.9624003, 0, 1, 0.4784314, 1,
-0.2077144, 1.000581, 0.6260567, 0, 1, 0.4823529, 1,
-0.207616, 0.1266438, -2.394376, 0, 1, 0.4901961, 1,
-0.2058081, 1.172886, 0.7179995, 0, 1, 0.4941176, 1,
-0.2032631, -0.03941872, -2.362224, 0, 1, 0.5019608, 1,
-0.2007608, -2.051885, -4.104147, 0, 1, 0.509804, 1,
-0.1983122, -0.6676586, -2.717134, 0, 1, 0.5137255, 1,
-0.1970072, -1.643802, -3.412122, 0, 1, 0.5215687, 1,
-0.1952711, 0.2170462, 0.08165833, 0, 1, 0.5254902, 1,
-0.1939829, -0.4267854, -1.928744, 0, 1, 0.5333334, 1,
-0.1939264, -0.7769779, -1.635576, 0, 1, 0.5372549, 1,
-0.1817227, 0.2586105, 0.248808, 0, 1, 0.5450981, 1,
-0.1788233, 0.3209057, -1.888554, 0, 1, 0.5490196, 1,
-0.1783097, -0.2532203, -2.984372, 0, 1, 0.5568628, 1,
-0.1677847, -0.4277365, -3.436201, 0, 1, 0.5607843, 1,
-0.1656151, -0.1385213, -4.416809, 0, 1, 0.5686275, 1,
-0.1643111, -0.5355211, -4.028217, 0, 1, 0.572549, 1,
-0.1622977, 1.288806, -0.1585756, 0, 1, 0.5803922, 1,
-0.1613117, 0.5849929, -0.348708, 0, 1, 0.5843138, 1,
-0.1606308, 0.6041547, 0.6590775, 0, 1, 0.5921569, 1,
-0.1605425, -1.424532, -1.525432, 0, 1, 0.5960785, 1,
-0.1602605, -1.376844, -2.475496, 0, 1, 0.6039216, 1,
-0.1562356, 0.5043908, -1.347974, 0, 1, 0.6117647, 1,
-0.1562352, -0.008455002, -2.136959, 0, 1, 0.6156863, 1,
-0.1561899, 1.56516, 0.4518686, 0, 1, 0.6235294, 1,
-0.1554077, 1.611883, 0.05845305, 0, 1, 0.627451, 1,
-0.1535956, -0.02191783, -2.765184, 0, 1, 0.6352941, 1,
-0.1531676, 0.4597746, -0.07087633, 0, 1, 0.6392157, 1,
-0.1502605, 0.1854098, 1.101419, 0, 1, 0.6470588, 1,
-0.1468895, -2.127574, -2.061653, 0, 1, 0.6509804, 1,
-0.1467571, 1.254103, -0.2162799, 0, 1, 0.6588235, 1,
-0.1459059, 0.3057667, -1.024968, 0, 1, 0.6627451, 1,
-0.1439648, 2.504321, -0.2474502, 0, 1, 0.6705883, 1,
-0.1418086, -0.6559061, -2.781954, 0, 1, 0.6745098, 1,
-0.1397073, 0.546077, 0.2191262, 0, 1, 0.682353, 1,
-0.139248, -1.595739, -2.564569, 0, 1, 0.6862745, 1,
-0.127941, -0.6208254, -3.411986, 0, 1, 0.6941177, 1,
-0.1276896, -0.6899402, -4.892265, 0, 1, 0.7019608, 1,
-0.1275804, -1.064979, -4.453152, 0, 1, 0.7058824, 1,
-0.1226458, -0.9413496, -4.198129, 0, 1, 0.7137255, 1,
-0.1210391, -0.3097309, -3.235854, 0, 1, 0.7176471, 1,
-0.1163191, 0.5107058, -0.5026411, 0, 1, 0.7254902, 1,
-0.1160335, 2.180173, 0.09214656, 0, 1, 0.7294118, 1,
-0.1151844, -0.0853081, -1.892759, 0, 1, 0.7372549, 1,
-0.1090604, -0.7034451, -3.482466, 0, 1, 0.7411765, 1,
-0.1075712, 0.5337907, -0.03935829, 0, 1, 0.7490196, 1,
-0.1062693, -0.1819223, -2.491441, 0, 1, 0.7529412, 1,
-0.1007199, -0.1155692, -4.238429, 0, 1, 0.7607843, 1,
-0.09253287, -0.9358994, -2.955904, 0, 1, 0.7647059, 1,
-0.09178826, 0.8337082, -1.290559, 0, 1, 0.772549, 1,
-0.0909733, 0.3724443, -0.348203, 0, 1, 0.7764706, 1,
-0.0855026, 0.3445707, 0.8389724, 0, 1, 0.7843137, 1,
-0.08267934, -2.376807, -3.573736, 0, 1, 0.7882353, 1,
-0.08066718, 2.207222, 0.4137778, 0, 1, 0.7960784, 1,
-0.07721838, 1.617686, 0.5964112, 0, 1, 0.8039216, 1,
-0.07643118, -1.640388, -2.232345, 0, 1, 0.8078431, 1,
-0.07608362, -0.05538376, -4.174692, 0, 1, 0.8156863, 1,
-0.07550492, -0.6848494, -4.56766, 0, 1, 0.8196079, 1,
-0.06629839, -0.9882575, -5.291059, 0, 1, 0.827451, 1,
-0.06579438, -0.4600652, -2.571679, 0, 1, 0.8313726, 1,
-0.06433606, 1.2031, -0.6707734, 0, 1, 0.8392157, 1,
-0.06297934, 0.2695253, 1.050715, 0, 1, 0.8431373, 1,
-0.06275224, -1.151382, -3.120159, 0, 1, 0.8509804, 1,
-0.05963343, -1.55011, -3.108958, 0, 1, 0.854902, 1,
-0.0574018, -1.870014, -2.254362, 0, 1, 0.8627451, 1,
-0.05387411, -0.8569731, -2.134233, 0, 1, 0.8666667, 1,
-0.04747119, 1.543698, -0.1525386, 0, 1, 0.8745098, 1,
-0.04714374, 0.999362, 0.6010131, 0, 1, 0.8784314, 1,
-0.04518137, 0.8537333, -1.290229, 0, 1, 0.8862745, 1,
-0.04488787, 0.3735273, -1.211524, 0, 1, 0.8901961, 1,
-0.0429603, 0.5400246, -2.076135, 0, 1, 0.8980392, 1,
-0.04080522, 0.2951988, 0.3410658, 0, 1, 0.9058824, 1,
-0.03397724, 0.6966721, -0.09481619, 0, 1, 0.9098039, 1,
-0.03295979, -0.8843743, -2.126772, 0, 1, 0.9176471, 1,
-0.02978281, 0.3402198, 0.9541904, 0, 1, 0.9215686, 1,
-0.0280065, -0.187339, -2.704578, 0, 1, 0.9294118, 1,
-0.02679644, 0.942353, 2.004011, 0, 1, 0.9333333, 1,
-0.02559017, -0.02586243, -1.633846, 0, 1, 0.9411765, 1,
-0.0219681, 0.5084137, 0.3214866, 0, 1, 0.945098, 1,
-0.02168202, 0.2461366, -1.17337, 0, 1, 0.9529412, 1,
-0.0203579, 0.3009949, -1.638823, 0, 1, 0.9568627, 1,
-0.01863531, -0.4059057, -2.442498, 0, 1, 0.9647059, 1,
-0.01837022, 1.382872, -2.013808, 0, 1, 0.9686275, 1,
-0.01558561, -1.245685, -1.589926, 0, 1, 0.9764706, 1,
-0.00736876, -0.8059859, -3.998562, 0, 1, 0.9803922, 1,
-0.004163462, -1.082338, -3.389523, 0, 1, 0.9882353, 1,
-0.001430971, -0.4719494, -2.731218, 0, 1, 0.9921569, 1,
0.001184033, 0.5126215, 0.301798, 0, 1, 1, 1,
0.006498683, -0.8818592, 2.975904, 0, 0.9921569, 1, 1,
0.00764274, 1.196835, -1.037483, 0, 0.9882353, 1, 1,
0.007927828, -0.3411109, 4.801495, 0, 0.9803922, 1, 1,
0.01084177, 0.3138889, -0.5855756, 0, 0.9764706, 1, 1,
0.01584531, 1.344174, 0.6621804, 0, 0.9686275, 1, 1,
0.01849674, -1.698504, 3.1814, 0, 0.9647059, 1, 1,
0.01861934, -0.9569331, 2.472377, 0, 0.9568627, 1, 1,
0.02150289, 0.3392069, 1.299025, 0, 0.9529412, 1, 1,
0.02507698, -1.333937, 3.780897, 0, 0.945098, 1, 1,
0.02862636, -0.1970579, 2.431461, 0, 0.9411765, 1, 1,
0.02898811, 0.7535328, -0.1210332, 0, 0.9333333, 1, 1,
0.03172497, -1.601657, 1.796893, 0, 0.9294118, 1, 1,
0.03516905, -2.187613, 4.269004, 0, 0.9215686, 1, 1,
0.0358269, -0.4541889, 3.600141, 0, 0.9176471, 1, 1,
0.03930148, -0.04978154, 3.073321, 0, 0.9098039, 1, 1,
0.04085853, -0.9654238, 4.172842, 0, 0.9058824, 1, 1,
0.04452591, -0.8852273, 3.573257, 0, 0.8980392, 1, 1,
0.04460057, -1.729471, 3.290193, 0, 0.8901961, 1, 1,
0.04605588, 1.207546, -0.150502, 0, 0.8862745, 1, 1,
0.04665713, -0.2649717, 2.743778, 0, 0.8784314, 1, 1,
0.04771031, 1.795254, 0.4999495, 0, 0.8745098, 1, 1,
0.05033338, 0.2876626, -0.03779866, 0, 0.8666667, 1, 1,
0.0516273, 1.279635, 0.5412096, 0, 0.8627451, 1, 1,
0.0548316, -2.08228, 3.550253, 0, 0.854902, 1, 1,
0.055179, 0.6747344, -0.3736542, 0, 0.8509804, 1, 1,
0.06044666, 0.301772, -0.7737422, 0, 0.8431373, 1, 1,
0.06078451, 1.251537, 0.9782095, 0, 0.8392157, 1, 1,
0.06153195, 1.271841, -1.281538, 0, 0.8313726, 1, 1,
0.06315416, 1.282715, -0.8874874, 0, 0.827451, 1, 1,
0.07532366, 2.398438, 0.8789704, 0, 0.8196079, 1, 1,
0.07608114, -0.7950988, 2.895994, 0, 0.8156863, 1, 1,
0.07702556, 0.04143878, 1.255964, 0, 0.8078431, 1, 1,
0.08244741, 0.4714961, 1.050357, 0, 0.8039216, 1, 1,
0.08317224, -0.3438499, 2.641771, 0, 0.7960784, 1, 1,
0.0878571, 1.279749, -2.733837, 0, 0.7882353, 1, 1,
0.08920454, -0.5563175, 2.145687, 0, 0.7843137, 1, 1,
0.09403136, 0.8259327, 1.874903, 0, 0.7764706, 1, 1,
0.0944802, -0.1152533, 4.503292, 0, 0.772549, 1, 1,
0.09665742, -1.18294, 4.286876, 0, 0.7647059, 1, 1,
0.09881808, 1.103542, -0.420365, 0, 0.7607843, 1, 1,
0.0994533, -0.01843471, 2.770224, 0, 0.7529412, 1, 1,
0.1041256, -0.3814099, 3.637239, 0, 0.7490196, 1, 1,
0.1060501, 0.5959763, 0.2892182, 0, 0.7411765, 1, 1,
0.1094742, 1.082935, 1.152259, 0, 0.7372549, 1, 1,
0.1100741, -0.5590116, 1.474581, 0, 0.7294118, 1, 1,
0.1120818, 0.656503, 0.4160121, 0, 0.7254902, 1, 1,
0.114367, -1.114678, 4.643261, 0, 0.7176471, 1, 1,
0.1173196, 1.114252, -0.0933668, 0, 0.7137255, 1, 1,
0.1223064, 1.835678, -1.083502, 0, 0.7058824, 1, 1,
0.1240426, -1.085526, 2.830692, 0, 0.6980392, 1, 1,
0.1258988, -0.3208158, 4.11263, 0, 0.6941177, 1, 1,
0.1276466, -0.5832915, 4.659688, 0, 0.6862745, 1, 1,
0.1279396, -0.1264183, 2.973584, 0, 0.682353, 1, 1,
0.130286, -0.6460308, 2.155859, 0, 0.6745098, 1, 1,
0.1308025, -0.8153976, 3.800402, 0, 0.6705883, 1, 1,
0.1322693, -0.2126782, 1.594597, 0, 0.6627451, 1, 1,
0.1330009, 1.747364, -1.764506, 0, 0.6588235, 1, 1,
0.1401547, 0.7785041, -0.3402276, 0, 0.6509804, 1, 1,
0.1410204, 0.440769, 0.9085242, 0, 0.6470588, 1, 1,
0.1431712, 0.1835022, 0.1997594, 0, 0.6392157, 1, 1,
0.1450828, 1.145645, -0.5662889, 0, 0.6352941, 1, 1,
0.1584487, -0.8235907, 3.314751, 0, 0.627451, 1, 1,
0.1636163, 2.388497, 0.3334969, 0, 0.6235294, 1, 1,
0.1650319, -0.7554203, 2.892025, 0, 0.6156863, 1, 1,
0.1655255, -0.3119485, 2.0142, 0, 0.6117647, 1, 1,
0.1663641, 1.75954, 0.3325344, 0, 0.6039216, 1, 1,
0.1754809, 0.3193034, -0.6699682, 0, 0.5960785, 1, 1,
0.1789801, 0.2569532, 0.01800531, 0, 0.5921569, 1, 1,
0.1803513, 0.6226285, -1.747168, 0, 0.5843138, 1, 1,
0.1826842, 1.353633, -1.351739, 0, 0.5803922, 1, 1,
0.1981797, -0.3537804, 3.437258, 0, 0.572549, 1, 1,
0.2002273, 1.266296, 0.1007346, 0, 0.5686275, 1, 1,
0.201896, -0.04717663, 1.834503, 0, 0.5607843, 1, 1,
0.2102802, -0.1965062, 2.985733, 0, 0.5568628, 1, 1,
0.2204814, 1.189136, 1.488027, 0, 0.5490196, 1, 1,
0.2216625, 0.8290122, 1.668059, 0, 0.5450981, 1, 1,
0.2218778, -0.5496062, 4.769398, 0, 0.5372549, 1, 1,
0.2248431, 0.804292, -0.7334138, 0, 0.5333334, 1, 1,
0.2291009, -0.4114595, 2.498664, 0, 0.5254902, 1, 1,
0.2308623, 0.6007328, 1.97091, 0, 0.5215687, 1, 1,
0.2315659, 1.397745, 0.3758702, 0, 0.5137255, 1, 1,
0.2350567, 0.6246141, 0.5615363, 0, 0.509804, 1, 1,
0.2389543, -0.5845506, 3.163123, 0, 0.5019608, 1, 1,
0.2397309, -1.008657, 6.012092, 0, 0.4941176, 1, 1,
0.2425267, -0.7054365, 2.589076, 0, 0.4901961, 1, 1,
0.2429707, 1.034993, -0.3007223, 0, 0.4823529, 1, 1,
0.2451844, -0.7842301, 2.806087, 0, 0.4784314, 1, 1,
0.2504662, -0.9625696, 2.92041, 0, 0.4705882, 1, 1,
0.2531781, -0.3855723, 2.361994, 0, 0.4666667, 1, 1,
0.2573639, -0.6792268, 1.983354, 0, 0.4588235, 1, 1,
0.257871, -0.3763267, 2.460669, 0, 0.454902, 1, 1,
0.2580366, 0.3055794, 0.4292759, 0, 0.4470588, 1, 1,
0.262162, 1.322452, 0.08096342, 0, 0.4431373, 1, 1,
0.2633471, 1.558959, 2.26692, 0, 0.4352941, 1, 1,
0.2645547, -0.772061, 2.764059, 0, 0.4313726, 1, 1,
0.2654298, 1.013124, -0.5515989, 0, 0.4235294, 1, 1,
0.2658778, -0.284209, 1.748302, 0, 0.4196078, 1, 1,
0.2678067, -0.8550713, 2.506127, 0, 0.4117647, 1, 1,
0.2681828, -1.470701, 3.739508, 0, 0.4078431, 1, 1,
0.2686872, 1.283171, 1.116104, 0, 0.4, 1, 1,
0.2706008, 0.9266533, 0.9623482, 0, 0.3921569, 1, 1,
0.274538, 1.243366, -1.480198, 0, 0.3882353, 1, 1,
0.2878502, 1.059964, 1.163408, 0, 0.3803922, 1, 1,
0.2886409, -0.3893157, 1.880335, 0, 0.3764706, 1, 1,
0.3068188, -0.06352326, 1.954954, 0, 0.3686275, 1, 1,
0.3068697, 1.076488, 0.192754, 0, 0.3647059, 1, 1,
0.3075082, -1.472167, 4.587983, 0, 0.3568628, 1, 1,
0.3089457, 2.91606, 0.07506157, 0, 0.3529412, 1, 1,
0.3089632, 1.616782, 2.586977, 0, 0.345098, 1, 1,
0.3115802, 0.07405563, -0.1868118, 0, 0.3411765, 1, 1,
0.3129377, 1.72467, 2.160115, 0, 0.3333333, 1, 1,
0.3132663, -0.7212631, 1.703749, 0, 0.3294118, 1, 1,
0.3165915, 0.4887969, 2.759809, 0, 0.3215686, 1, 1,
0.322277, 0.2780011, 1.913127, 0, 0.3176471, 1, 1,
0.3234604, 0.8556049, 0.5483084, 0, 0.3098039, 1, 1,
0.3278659, 0.4167094, 1.771194, 0, 0.3058824, 1, 1,
0.3281036, 0.8969031, -0.7315785, 0, 0.2980392, 1, 1,
0.3293403, -1.09299, 0.4601712, 0, 0.2901961, 1, 1,
0.3305308, 0.4665876, 0.6524614, 0, 0.2862745, 1, 1,
0.3361983, -1.470629, 6.011433, 0, 0.2784314, 1, 1,
0.3428297, -2.281363, 4.090093, 0, 0.2745098, 1, 1,
0.3554395, 0.6579607, -1.819415, 0, 0.2666667, 1, 1,
0.3616055, 0.3510072, 1.413662, 0, 0.2627451, 1, 1,
0.3622825, -0.01018103, 2.925572, 0, 0.254902, 1, 1,
0.3677543, -0.5852868, 2.316875, 0, 0.2509804, 1, 1,
0.3686748, 1.031492, 0.6857387, 0, 0.2431373, 1, 1,
0.3725892, -1.143489, 3.065521, 0, 0.2392157, 1, 1,
0.3764259, -0.06050305, 1.863312, 0, 0.2313726, 1, 1,
0.3772349, -0.6923735, 0.6946312, 0, 0.227451, 1, 1,
0.3798596, -0.1677912, 1.887141, 0, 0.2196078, 1, 1,
0.3805629, 0.2785525, 2.056913, 0, 0.2156863, 1, 1,
0.382744, 0.218296, 0.03132471, 0, 0.2078431, 1, 1,
0.383512, -0.4505298, 2.541605, 0, 0.2039216, 1, 1,
0.3892728, -0.506753, 3.396866, 0, 0.1960784, 1, 1,
0.3898574, 1.338363, -0.7368625, 0, 0.1882353, 1, 1,
0.3916503, 0.06158646, 1.838336, 0, 0.1843137, 1, 1,
0.391694, 1.663331, -0.6014549, 0, 0.1764706, 1, 1,
0.3937018, -0.7631338, 3.510696, 0, 0.172549, 1, 1,
0.3957179, -0.7425877, 2.67114, 0, 0.1647059, 1, 1,
0.4050034, 0.194554, 0.1323842, 0, 0.1607843, 1, 1,
0.4093945, 0.1859359, 0.5417378, 0, 0.1529412, 1, 1,
0.4109668, -0.5896639, 2.242111, 0, 0.1490196, 1, 1,
0.4177545, -0.5144019, 3.109979, 0, 0.1411765, 1, 1,
0.4217166, -1.76077, 2.315174, 0, 0.1372549, 1, 1,
0.4227785, 0.4043877, 0.4500266, 0, 0.1294118, 1, 1,
0.4238442, -0.4268319, 2.838991, 0, 0.1254902, 1, 1,
0.4240129, -0.5865965, 0.04725092, 0, 0.1176471, 1, 1,
0.4267532, -0.791292, 2.446666, 0, 0.1137255, 1, 1,
0.4335115, 0.4245414, 0.414428, 0, 0.1058824, 1, 1,
0.4354436, -1.747825, 3.080707, 0, 0.09803922, 1, 1,
0.4357446, -1.181265, 2.890576, 0, 0.09411765, 1, 1,
0.4381027, -0.09026736, 2.174016, 0, 0.08627451, 1, 1,
0.4423778, -0.691973, 2.677227, 0, 0.08235294, 1, 1,
0.4448487, 1.57982, -1.389667, 0, 0.07450981, 1, 1,
0.44634, -0.2415081, 2.380357, 0, 0.07058824, 1, 1,
0.4465195, -0.4576528, 2.116827, 0, 0.0627451, 1, 1,
0.4487169, 1.546148, -0.06034527, 0, 0.05882353, 1, 1,
0.4525635, 1.818038, 0.1445608, 0, 0.05098039, 1, 1,
0.4531304, -1.068259, 2.421962, 0, 0.04705882, 1, 1,
0.4537465, 1.107206, 0.7190413, 0, 0.03921569, 1, 1,
0.4575885, -0.8678799, 1.727202, 0, 0.03529412, 1, 1,
0.4617513, -1.976039, 2.973576, 0, 0.02745098, 1, 1,
0.4628325, -1.557131, 3.218142, 0, 0.02352941, 1, 1,
0.4709472, -0.3298705, 1.595604, 0, 0.01568628, 1, 1,
0.4725004, 1.011341, 0.8331559, 0, 0.01176471, 1, 1,
0.4736473, 1.442872, -0.1720918, 0, 0.003921569, 1, 1,
0.4756136, -0.8075801, 3.071456, 0.003921569, 0, 1, 1,
0.4762666, 0.3661081, 1.803107, 0.007843138, 0, 1, 1,
0.4779737, 1.414551, -0.631357, 0.01568628, 0, 1, 1,
0.4804659, 0.908856, 0.2047691, 0.01960784, 0, 1, 1,
0.4813204, 0.6989654, -0.6680886, 0.02745098, 0, 1, 1,
0.4836073, 1.112448, -1.636946, 0.03137255, 0, 1, 1,
0.4862705, 0.5900208, 2.599451, 0.03921569, 0, 1, 1,
0.4947805, 1.3474, 0.3317481, 0.04313726, 0, 1, 1,
0.4950736, -1.406806, 3.198553, 0.05098039, 0, 1, 1,
0.4962916, -1.392345, 4.701798, 0.05490196, 0, 1, 1,
0.4972927, -1.584832, 2.531872, 0.0627451, 0, 1, 1,
0.500681, 0.8399218, 0.9890375, 0.06666667, 0, 1, 1,
0.5020345, -1.368283, 3.071314, 0.07450981, 0, 1, 1,
0.5056533, -0.5850502, 3.935957, 0.07843138, 0, 1, 1,
0.5086769, 1.826834, 1.066418, 0.08627451, 0, 1, 1,
0.5089641, 0.2929981, 0.1436807, 0.09019608, 0, 1, 1,
0.5097162, -0.04410115, 2.419036, 0.09803922, 0, 1, 1,
0.5107557, 0.4578381, 3.776697, 0.1058824, 0, 1, 1,
0.511458, -0.5158609, 2.700041, 0.1098039, 0, 1, 1,
0.5122666, 2.001519, 0.463823, 0.1176471, 0, 1, 1,
0.5161414, 0.5761263, 0.493926, 0.1215686, 0, 1, 1,
0.5173814, 0.2154409, 0.4555577, 0.1294118, 0, 1, 1,
0.5184728, 0.6489272, 1.448299, 0.1333333, 0, 1, 1,
0.5197961, 0.1271062, 2.394904, 0.1411765, 0, 1, 1,
0.5214599, -1.080037, 2.463384, 0.145098, 0, 1, 1,
0.5230273, -1.473859, 2.940837, 0.1529412, 0, 1, 1,
0.525135, 0.8365074, 0.9727111, 0.1568628, 0, 1, 1,
0.5260919, 0.5325152, 0.777191, 0.1647059, 0, 1, 1,
0.5272754, 1.394392, 0.147644, 0.1686275, 0, 1, 1,
0.5275662, -1.346663, 4.601649, 0.1764706, 0, 1, 1,
0.5289592, -1.115324, 2.799917, 0.1803922, 0, 1, 1,
0.5292383, -0.6192543, 2.284658, 0.1882353, 0, 1, 1,
0.5307593, -0.7007361, 1.288532, 0.1921569, 0, 1, 1,
0.5330666, -2.907116, 0.6258891, 0.2, 0, 1, 1,
0.5349117, 0.5219793, -0.3458744, 0.2078431, 0, 1, 1,
0.5385647, 0.1356172, 1.634514, 0.2117647, 0, 1, 1,
0.5496996, 0.3476878, 1.128219, 0.2196078, 0, 1, 1,
0.551466, -0.5477108, 2.326476, 0.2235294, 0, 1, 1,
0.5559381, 2.305885, -1.373126, 0.2313726, 0, 1, 1,
0.5563334, -1.103574, 1.306665, 0.2352941, 0, 1, 1,
0.5566198, -0.5004123, 3.571745, 0.2431373, 0, 1, 1,
0.5610559, 0.9831502, 0.7973381, 0.2470588, 0, 1, 1,
0.5611247, -0.5612706, 3.221214, 0.254902, 0, 1, 1,
0.5629702, -0.006545418, 0.01289735, 0.2588235, 0, 1, 1,
0.5663693, -0.4239056, 2.800774, 0.2666667, 0, 1, 1,
0.5738401, -0.1907392, 0.7815406, 0.2705882, 0, 1, 1,
0.577625, 0.8502331, 0.8210059, 0.2784314, 0, 1, 1,
0.585574, 0.4673573, 1.138429, 0.282353, 0, 1, 1,
0.5876469, 1.123036, -0.03426107, 0.2901961, 0, 1, 1,
0.5918586, 0.7439682, 1.7507, 0.2941177, 0, 1, 1,
0.5943205, -0.3774595, 4.081171, 0.3019608, 0, 1, 1,
0.5964499, 1.039618, 0.3000036, 0.3098039, 0, 1, 1,
0.6023624, -0.2979382, 1.800106, 0.3137255, 0, 1, 1,
0.6081555, -0.6128681, 2.073673, 0.3215686, 0, 1, 1,
0.6156533, -0.6837944, 2.91267, 0.3254902, 0, 1, 1,
0.6194443, 0.1926676, 0.7272979, 0.3333333, 0, 1, 1,
0.6209881, -1.616257, 2.296944, 0.3372549, 0, 1, 1,
0.6222193, 0.05758149, 2.307025, 0.345098, 0, 1, 1,
0.6250662, -0.5368715, 1.345794, 0.3490196, 0, 1, 1,
0.6252953, -0.8780014, 2.76245, 0.3568628, 0, 1, 1,
0.6282975, 0.1953143, 1.157273, 0.3607843, 0, 1, 1,
0.6317044, -0.07835807, 1.963756, 0.3686275, 0, 1, 1,
0.6319459, -0.4172588, 2.703264, 0.372549, 0, 1, 1,
0.632125, 1.202002, 0.9935564, 0.3803922, 0, 1, 1,
0.63352, -1.158307, 1.887711, 0.3843137, 0, 1, 1,
0.6337961, 1.859203, 0.2298823, 0.3921569, 0, 1, 1,
0.6376618, -1.694152, 0.2980084, 0.3960784, 0, 1, 1,
0.6406686, 0.6914678, 1.539437, 0.4039216, 0, 1, 1,
0.6415934, 0.7101806, -0.02641245, 0.4117647, 0, 1, 1,
0.6440758, -0.09734874, 2.706627, 0.4156863, 0, 1, 1,
0.6470156, 0.8970619, -0.7011885, 0.4235294, 0, 1, 1,
0.6496792, 0.7978297, -0.05524905, 0.427451, 0, 1, 1,
0.6620326, -1.377288, 1.855915, 0.4352941, 0, 1, 1,
0.6657312, -0.6639595, 3.238187, 0.4392157, 0, 1, 1,
0.6666211, -0.7819665, 1.203382, 0.4470588, 0, 1, 1,
0.6679341, -0.860131, 3.471573, 0.4509804, 0, 1, 1,
0.6739026, -0.7278062, 1.0338, 0.4588235, 0, 1, 1,
0.6789127, 1.584379, 0.07051172, 0.4627451, 0, 1, 1,
0.6809767, -0.3826796, 0.3286203, 0.4705882, 0, 1, 1,
0.6887802, 0.8014898, -0.005834662, 0.4745098, 0, 1, 1,
0.6933897, -1.772026, 4.994818, 0.4823529, 0, 1, 1,
0.7010846, -0.8275892, 3.391319, 0.4862745, 0, 1, 1,
0.7031487, -1.893954, 2.682466, 0.4941176, 0, 1, 1,
0.7032357, 0.01717406, 0.40674, 0.5019608, 0, 1, 1,
0.7061293, -1.159386, 2.8449, 0.5058824, 0, 1, 1,
0.708132, 0.05189777, 0.8343221, 0.5137255, 0, 1, 1,
0.72049, -0.7631039, 1.443515, 0.5176471, 0, 1, 1,
0.7225329, -0.8178488, 2.399377, 0.5254902, 0, 1, 1,
0.7228211, -0.4302612, 2.69189, 0.5294118, 0, 1, 1,
0.7253978, 1.090466, -0.7925818, 0.5372549, 0, 1, 1,
0.7276416, 1.071939, 0.07547089, 0.5411765, 0, 1, 1,
0.7296904, -0.01490386, 3.727585, 0.5490196, 0, 1, 1,
0.742624, -0.5508605, 1.766603, 0.5529412, 0, 1, 1,
0.7432595, 0.3816483, 1.772628, 0.5607843, 0, 1, 1,
0.7454305, -0.6856091, 2.160082, 0.5647059, 0, 1, 1,
0.7466032, -0.8483589, 3.248966, 0.572549, 0, 1, 1,
0.7480905, 0.7686766, 3.391284, 0.5764706, 0, 1, 1,
0.7495569, 1.240871, 1.56608, 0.5843138, 0, 1, 1,
0.7501751, -1.596645, 3.216236, 0.5882353, 0, 1, 1,
0.7537391, -1.386275, 1.78077, 0.5960785, 0, 1, 1,
0.7578125, -0.8698659, 2.155855, 0.6039216, 0, 1, 1,
0.7593558, -0.7950611, 3.186207, 0.6078432, 0, 1, 1,
0.7623487, 1.257078, 1.160017, 0.6156863, 0, 1, 1,
0.7625989, 0.03709122, -0.1917527, 0.6196079, 0, 1, 1,
0.7643492, 0.8554739, 1.48627, 0.627451, 0, 1, 1,
0.7650424, -0.1004073, 0.4973409, 0.6313726, 0, 1, 1,
0.7658387, -1.888414, 3.242302, 0.6392157, 0, 1, 1,
0.7694533, -1.134381, 3.264751, 0.6431373, 0, 1, 1,
0.7757932, -0.3654377, 2.096937, 0.6509804, 0, 1, 1,
0.7759449, 0.4924899, 1.119387, 0.654902, 0, 1, 1,
0.7761117, -1.437668, 1.899669, 0.6627451, 0, 1, 1,
0.78509, 0.9686862, 0.7926523, 0.6666667, 0, 1, 1,
0.7872153, 0.191691, 1.34677, 0.6745098, 0, 1, 1,
0.7906891, -1.006377, 3.015485, 0.6784314, 0, 1, 1,
0.79224, 1.001963, 2.294784, 0.6862745, 0, 1, 1,
0.7934705, 0.548148, 1.45877, 0.6901961, 0, 1, 1,
0.7941372, -0.5444348, 1.821434, 0.6980392, 0, 1, 1,
0.7945422, -0.3384567, 1.64896, 0.7058824, 0, 1, 1,
0.8011377, -1.59643, 1.896564, 0.7098039, 0, 1, 1,
0.801993, -0.6060001, 1.668708, 0.7176471, 0, 1, 1,
0.805024, -0.6680227, 1.266122, 0.7215686, 0, 1, 1,
0.8161858, 0.5013254, 1.590363, 0.7294118, 0, 1, 1,
0.821248, 0.6465424, 0.777067, 0.7333333, 0, 1, 1,
0.8322641, 0.4739994, 0.8719753, 0.7411765, 0, 1, 1,
0.8383054, -1.04044, 1.8577, 0.7450981, 0, 1, 1,
0.8425155, -0.4590772, 2.694535, 0.7529412, 0, 1, 1,
0.8504638, -1.009039, 0.7460346, 0.7568628, 0, 1, 1,
0.8523444, 0.1017132, 1.113282, 0.7647059, 0, 1, 1,
0.8622099, 0.7560169, 1.02828, 0.7686275, 0, 1, 1,
0.8695007, -0.9364789, 3.080624, 0.7764706, 0, 1, 1,
0.875177, 1.02447, 0.9152814, 0.7803922, 0, 1, 1,
0.8821151, -0.2932191, 3.099413, 0.7882353, 0, 1, 1,
0.8827205, -1.270626, 3.57982, 0.7921569, 0, 1, 1,
0.8900476, -0.1770488, 1.903404, 0.8, 0, 1, 1,
0.8954951, -1.179535, 2.303136, 0.8078431, 0, 1, 1,
0.896574, -0.2445035, 1.108503, 0.8117647, 0, 1, 1,
0.8987358, -0.9228522, 1.924918, 0.8196079, 0, 1, 1,
0.9014003, 0.2249177, 0.9290947, 0.8235294, 0, 1, 1,
0.9016547, -1.158413, 3.043803, 0.8313726, 0, 1, 1,
0.9018647, 0.505127, 0.8711577, 0.8352941, 0, 1, 1,
0.9035558, 0.6877583, 0.05401043, 0.8431373, 0, 1, 1,
0.904582, -0.7301449, 0.8854568, 0.8470588, 0, 1, 1,
0.908433, 1.102051, -1.587336, 0.854902, 0, 1, 1,
0.9119946, 0.3258851, -0.3212692, 0.8588235, 0, 1, 1,
0.9132895, 0.6542444, -0.6393926, 0.8666667, 0, 1, 1,
0.9147734, -1.478012, 2.89813, 0.8705882, 0, 1, 1,
0.9155824, -0.9699174, 1.9365, 0.8784314, 0, 1, 1,
0.9187167, -0.1892157, 0.06759749, 0.8823529, 0, 1, 1,
0.9191778, 0.3353789, 0.2931494, 0.8901961, 0, 1, 1,
0.9193321, -0.678508, 1.911001, 0.8941177, 0, 1, 1,
0.9283779, 1.659642, 0.2155796, 0.9019608, 0, 1, 1,
0.928856, -0.9305458, 1.090281, 0.9098039, 0, 1, 1,
0.9300419, 0.411469, 0.7487345, 0.9137255, 0, 1, 1,
0.9373587, 0.4923679, 2.945917, 0.9215686, 0, 1, 1,
0.9429184, 0.7171127, 1.202924, 0.9254902, 0, 1, 1,
0.944887, 0.3068334, 3.790891, 0.9333333, 0, 1, 1,
0.9457684, -0.1380336, 0.3436601, 0.9372549, 0, 1, 1,
0.9532718, 1.057326, 1.557751, 0.945098, 0, 1, 1,
0.954635, -0.8134321, 1.911479, 0.9490196, 0, 1, 1,
0.9555368, 1.044985, -0.4953664, 0.9568627, 0, 1, 1,
0.9588425, 1.205436, 1.652935, 0.9607843, 0, 1, 1,
0.960789, -0.2531135, 1.345192, 0.9686275, 0, 1, 1,
0.9635467, -0.8574939, 1.679784, 0.972549, 0, 1, 1,
0.9688311, -1.42953, 0.7608411, 0.9803922, 0, 1, 1,
0.9699445, 0.7608707, 1.043741, 0.9843137, 0, 1, 1,
0.9731539, 2.902593, 0.05362589, 0.9921569, 0, 1, 1,
0.9754797, 0.04649187, 1.875657, 0.9960784, 0, 1, 1,
0.9804147, 0.3883859, -0.1487069, 1, 0, 0.9960784, 1,
0.9824665, -0.5865216, 1.721698, 1, 0, 0.9882353, 1,
0.9879656, -0.4031393, 3.805606, 1, 0, 0.9843137, 1,
0.9941155, -0.9111636, 2.228818, 1, 0, 0.9764706, 1,
0.9983082, -0.4657321, 2.212296, 1, 0, 0.972549, 1,
0.9991241, 1.074022, 1.160802, 1, 0, 0.9647059, 1,
1.004145, 0.9589125, 1.964352, 1, 0, 0.9607843, 1,
1.011871, 1.142094, -0.3864762, 1, 0, 0.9529412, 1,
1.014646, -1.593963, 3.265455, 1, 0, 0.9490196, 1,
1.01892, -1.582136, 1.989614, 1, 0, 0.9411765, 1,
1.023145, 0.1003058, 2.441151, 1, 0, 0.9372549, 1,
1.023864, 0.6030599, -0.173884, 1, 0, 0.9294118, 1,
1.024658, 0.06905495, -0.4870139, 1, 0, 0.9254902, 1,
1.029432, 0.258785, 1.349557, 1, 0, 0.9176471, 1,
1.032802, 1.119859, 1.031141, 1, 0, 0.9137255, 1,
1.034849, 0.8894482, 0.4209853, 1, 0, 0.9058824, 1,
1.035304, -0.07981133, 0.5807109, 1, 0, 0.9019608, 1,
1.040855, -0.898164, 3.218937, 1, 0, 0.8941177, 1,
1.045135, -1.528353, 3.109827, 1, 0, 0.8862745, 1,
1.05241, -0.918143, 1.110009, 1, 0, 0.8823529, 1,
1.05795, -1.984484, 3.854662, 1, 0, 0.8745098, 1,
1.059191, 0.1145707, 1.123158, 1, 0, 0.8705882, 1,
1.062279, -0.3984496, 2.829579, 1, 0, 0.8627451, 1,
1.062668, -2.634022, 4.16021, 1, 0, 0.8588235, 1,
1.064373, 1.491423, 0.4710973, 1, 0, 0.8509804, 1,
1.067969, 2.076472, 0.7686142, 1, 0, 0.8470588, 1,
1.077402, -0.5055051, 2.889255, 1, 0, 0.8392157, 1,
1.085805, 1.112001, 1.980699, 1, 0, 0.8352941, 1,
1.092445, -0.7992842, 1.254237, 1, 0, 0.827451, 1,
1.097647, -0.4434465, 2.235655, 1, 0, 0.8235294, 1,
1.098103, -1.104918, 2.294368, 1, 0, 0.8156863, 1,
1.102404, 1.019672, 1.391478, 1, 0, 0.8117647, 1,
1.109311, -0.7358962, 1.779398, 1, 0, 0.8039216, 1,
1.110426, -0.4028408, 2.239317, 1, 0, 0.7960784, 1,
1.112372, 0.5426042, 0.6491383, 1, 0, 0.7921569, 1,
1.113518, 1.069045, -0.2112149, 1, 0, 0.7843137, 1,
1.116036, 1.14439, 1.520313, 1, 0, 0.7803922, 1,
1.119715, 2.227016, 0.8838813, 1, 0, 0.772549, 1,
1.126045, 1.576079, 1.766665, 1, 0, 0.7686275, 1,
1.132685, -1.057741, 2.322671, 1, 0, 0.7607843, 1,
1.138048, -0.4146709, -0.1279016, 1, 0, 0.7568628, 1,
1.139344, -0.4957284, 2.305097, 1, 0, 0.7490196, 1,
1.144933, 1.645938, 0.564911, 1, 0, 0.7450981, 1,
1.148714, -1.437019, 1.903773, 1, 0, 0.7372549, 1,
1.157437, -2.030646, 3.118985, 1, 0, 0.7333333, 1,
1.166298, -0.9843127, 1.065718, 1, 0, 0.7254902, 1,
1.169985, -0.4329142, 1.688881, 1, 0, 0.7215686, 1,
1.174888, 0.1781259, 2.04478, 1, 0, 0.7137255, 1,
1.180886, 0.3270019, 0.1894407, 1, 0, 0.7098039, 1,
1.18166, -0.9237632, 1.809051, 1, 0, 0.7019608, 1,
1.183606, 0.9587221, 0.2535448, 1, 0, 0.6941177, 1,
1.191497, 1.10101, 1.096225, 1, 0, 0.6901961, 1,
1.193425, 0.3232935, 1.181492, 1, 0, 0.682353, 1,
1.198761, -0.3261578, 1.265261, 1, 0, 0.6784314, 1,
1.199563, 0.3719735, 0.5028788, 1, 0, 0.6705883, 1,
1.210515, -0.2917889, 1.412617, 1, 0, 0.6666667, 1,
1.215805, -1.021289, 1.225682, 1, 0, 0.6588235, 1,
1.217336, 1.303912, 1.635331, 1, 0, 0.654902, 1,
1.21826, 0.531139, 0.3069112, 1, 0, 0.6470588, 1,
1.228346, 0.2939669, 0.04534687, 1, 0, 0.6431373, 1,
1.228875, -0.02269435, 1.883435, 1, 0, 0.6352941, 1,
1.240331, 0.8297604, 1.698694, 1, 0, 0.6313726, 1,
1.240347, 0.127519, 1.689401, 1, 0, 0.6235294, 1,
1.259407, 0.9724336, 1.766807, 1, 0, 0.6196079, 1,
1.260787, -1.251871, 1.661231, 1, 0, 0.6117647, 1,
1.264197, 1.67879, 0.8327702, 1, 0, 0.6078432, 1,
1.265616, 0.0204509, 1.357022, 1, 0, 0.6, 1,
1.271215, -0.8225565, 2.088204, 1, 0, 0.5921569, 1,
1.271708, 0.5973424, 2.191684, 1, 0, 0.5882353, 1,
1.274108, 0.009921229, 1.676871, 1, 0, 0.5803922, 1,
1.284197, 1.622326, 1.507796, 1, 0, 0.5764706, 1,
1.285764, -0.9964509, 1.495847, 1, 0, 0.5686275, 1,
1.291421, -0.5332544, 1.692206, 1, 0, 0.5647059, 1,
1.304185, 1.250734, 0.982391, 1, 0, 0.5568628, 1,
1.319067, 0.2581946, -1.388686, 1, 0, 0.5529412, 1,
1.333235, 1.329658, 0.5377384, 1, 0, 0.5450981, 1,
1.334164, 0.06025212, 1.100571, 1, 0, 0.5411765, 1,
1.359769, -2.25036, 4.499334, 1, 0, 0.5333334, 1,
1.360837, 2.6075, 0.5618576, 1, 0, 0.5294118, 1,
1.36955, 1.444287, 0.6608294, 1, 0, 0.5215687, 1,
1.369894, 1.28754, 1.482056, 1, 0, 0.5176471, 1,
1.377487, -0.3833593, 2.017471, 1, 0, 0.509804, 1,
1.384873, -0.4817832, 1.546091, 1, 0, 0.5058824, 1,
1.385045, 0.1151741, 1.047437, 1, 0, 0.4980392, 1,
1.388412, -0.1879827, 1.2452, 1, 0, 0.4901961, 1,
1.392198, -0.1409841, 0.8184164, 1, 0, 0.4862745, 1,
1.4126, 0.04099084, -0.2371465, 1, 0, 0.4784314, 1,
1.423021, 0.256319, 2.577829, 1, 0, 0.4745098, 1,
1.432463, -0.4948162, 4.422276, 1, 0, 0.4666667, 1,
1.439059, 0.6719363, 1.305825, 1, 0, 0.4627451, 1,
1.441447, -0.1420766, 1.313536, 1, 0, 0.454902, 1,
1.450941, 1.640764, 0.8062242, 1, 0, 0.4509804, 1,
1.456345, -1.789915, 2.586036, 1, 0, 0.4431373, 1,
1.466583, -0.5197185, 1.038277, 1, 0, 0.4392157, 1,
1.477284, -0.2639788, 1.702715, 1, 0, 0.4313726, 1,
1.485113, -0.870669, 4.641652, 1, 0, 0.427451, 1,
1.497564, 0.8397973, 0.7336625, 1, 0, 0.4196078, 1,
1.517966, -0.3031428, 2.359187, 1, 0, 0.4156863, 1,
1.52432, -0.9143147, 2.320304, 1, 0, 0.4078431, 1,
1.55191, -1.641453, 2.560122, 1, 0, 0.4039216, 1,
1.561582, -0.599515, 0.1487108, 1, 0, 0.3960784, 1,
1.56888, -0.4623244, 3.036641, 1, 0, 0.3882353, 1,
1.573153, 1.547015, 1.08271, 1, 0, 0.3843137, 1,
1.595059, -0.2599736, 0.9738085, 1, 0, 0.3764706, 1,
1.621807, 1.097972, -0.3538802, 1, 0, 0.372549, 1,
1.625677, 0.6798007, -0.2295254, 1, 0, 0.3647059, 1,
1.634715, -0.5950041, 1.813244, 1, 0, 0.3607843, 1,
1.63557, 2.026194, 1.592734, 1, 0, 0.3529412, 1,
1.64004, -0.7632712, 2.47992, 1, 0, 0.3490196, 1,
1.648234, 0.6927581, 2.546482, 1, 0, 0.3411765, 1,
1.670342, 0.03431617, 2.946082, 1, 0, 0.3372549, 1,
1.670535, -0.4758773, 2.441999, 1, 0, 0.3294118, 1,
1.698628, 0.3475688, 1.228967, 1, 0, 0.3254902, 1,
1.7088, -1.51835, 2.626338, 1, 0, 0.3176471, 1,
1.715209, 0.3210918, 0.4989699, 1, 0, 0.3137255, 1,
1.716324, -1.980776, 3.152414, 1, 0, 0.3058824, 1,
1.745627, -0.1488144, 0.8317926, 1, 0, 0.2980392, 1,
1.753148, 1.231392, 1.138046, 1, 0, 0.2941177, 1,
1.755843, -0.3278733, 2.35294, 1, 0, 0.2862745, 1,
1.764133, 0.4571541, 1.091557, 1, 0, 0.282353, 1,
1.773122, 1.641321, 0.9981456, 1, 0, 0.2745098, 1,
1.774245, 0.04161187, 4.531369, 1, 0, 0.2705882, 1,
1.78676, 0.4137819, 1.360034, 1, 0, 0.2627451, 1,
1.793763, 0.4107362, 0.1335631, 1, 0, 0.2588235, 1,
1.834922, 0.2484866, 2.187886, 1, 0, 0.2509804, 1,
1.838446, -0.5683355, 0.4665161, 1, 0, 0.2470588, 1,
1.900077, 0.767742, 0.4333459, 1, 0, 0.2392157, 1,
1.926906, -1.669162, 0.1069599, 1, 0, 0.2352941, 1,
1.932786, 0.1817966, 1.40118, 1, 0, 0.227451, 1,
1.950063, -1.601448, 2.839607, 1, 0, 0.2235294, 1,
1.962843, -0.3054762, 1.232435, 1, 0, 0.2156863, 1,
1.983861, -0.1951076, 1.062315, 1, 0, 0.2117647, 1,
2.002097, 0.07016885, 1.401576, 1, 0, 0.2039216, 1,
2.010388, -1.456498, 2.377853, 1, 0, 0.1960784, 1,
2.024349, 0.6805013, 1.128295, 1, 0, 0.1921569, 1,
2.025084, 0.4991659, 1.763271, 1, 0, 0.1843137, 1,
2.036768, 0.292276, 1.503287, 1, 0, 0.1803922, 1,
2.039914, -0.1487958, 3.706257, 1, 0, 0.172549, 1,
2.070394, -0.1935837, 0.1361101, 1, 0, 0.1686275, 1,
2.072255, -0.5402442, 1.579123, 1, 0, 0.1607843, 1,
2.161216, -1.209636, 1.080362, 1, 0, 0.1568628, 1,
2.175595, 0.2066369, 1.384614, 1, 0, 0.1490196, 1,
2.208443, 0.1387626, 1.410997, 1, 0, 0.145098, 1,
2.236887, 0.6263466, 1.993446, 1, 0, 0.1372549, 1,
2.302992, -0.3886192, 2.086737, 1, 0, 0.1333333, 1,
2.33688, 0.376498, 0.7594461, 1, 0, 0.1254902, 1,
2.34812, -0.7257506, -0.2866367, 1, 0, 0.1215686, 1,
2.364582, 0.3143121, 0.2288966, 1, 0, 0.1137255, 1,
2.373934, -0.9822812, 1.33765, 1, 0, 0.1098039, 1,
2.472897, -1.0697, 2.202839, 1, 0, 0.1019608, 1,
2.474486, -1.15591, 3.135488, 1, 0, 0.09411765, 1,
2.516075, 1.682184, -0.1207385, 1, 0, 0.09019608, 1,
2.520257, 0.9586858, -0.8907628, 1, 0, 0.08235294, 1,
2.535215, 1.506685, 0.5469646, 1, 0, 0.07843138, 1,
2.584203, 1.966893, 1.926376, 1, 0, 0.07058824, 1,
2.592305, -1.48614, 1.981527, 1, 0, 0.06666667, 1,
2.674536, 0.8672983, 0.07850173, 1, 0, 0.05882353, 1,
2.692664, 0.4040798, 0.6120746, 1, 0, 0.05490196, 1,
2.759628, 0.2990098, 0.3315824, 1, 0, 0.04705882, 1,
2.794517, -0.01117034, 3.155215, 1, 0, 0.04313726, 1,
2.855577, -1.25608, 3.121605, 1, 0, 0.03529412, 1,
2.874967, -0.970042, 1.015511, 1, 0, 0.03137255, 1,
2.881263, 1.346288, 0.7547396, 1, 0, 0.02352941, 1,
2.998247, 0.6402149, -0.9919945, 1, 0, 0.01960784, 1,
3.340301, -0.1792193, 0.7842085, 1, 0, 0.01176471, 1,
3.507477, -1.331322, 2.499007, 1, 0, 0.007843138, 1
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
0.2206005, -3.894144, -7.318441, 0, -0.5, 0.5, 0.5,
0.2206005, -3.894144, -7.318441, 1, -0.5, 0.5, 0.5,
0.2206005, -3.894144, -7.318441, 1, 1.5, 0.5, 0.5,
0.2206005, -3.894144, -7.318441, 0, 1.5, 0.5, 0.5
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
-4.180527, 0.004472136, -7.318441, 0, -0.5, 0.5, 0.5,
-4.180527, 0.004472136, -7.318441, 1, -0.5, 0.5, 0.5,
-4.180527, 0.004472136, -7.318441, 1, 1.5, 0.5, 0.5,
-4.180527, 0.004472136, -7.318441, 0, 1.5, 0.5, 0.5
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
-4.180527, -3.894144, 0.3128474, 0, -0.5, 0.5, 0.5,
-4.180527, -3.894144, 0.3128474, 1, -0.5, 0.5, 0.5,
-4.180527, -3.894144, 0.3128474, 1, 1.5, 0.5, 0.5,
-4.180527, -3.894144, 0.3128474, 0, 1.5, 0.5, 0.5
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
-3, -2.994464, -5.557374,
3, -2.994464, -5.557374,
-3, -2.994464, -5.557374,
-3, -3.14441, -5.850885,
-2, -2.994464, -5.557374,
-2, -3.14441, -5.850885,
-1, -2.994464, -5.557374,
-1, -3.14441, -5.850885,
0, -2.994464, -5.557374,
0, -3.14441, -5.850885,
1, -2.994464, -5.557374,
1, -3.14441, -5.850885,
2, -2.994464, -5.557374,
2, -3.14441, -5.850885,
3, -2.994464, -5.557374,
3, -3.14441, -5.850885
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
-3, -3.444304, -6.437907, 0, -0.5, 0.5, 0.5,
-3, -3.444304, -6.437907, 1, -0.5, 0.5, 0.5,
-3, -3.444304, -6.437907, 1, 1.5, 0.5, 0.5,
-3, -3.444304, -6.437907, 0, 1.5, 0.5, 0.5,
-2, -3.444304, -6.437907, 0, -0.5, 0.5, 0.5,
-2, -3.444304, -6.437907, 1, -0.5, 0.5, 0.5,
-2, -3.444304, -6.437907, 1, 1.5, 0.5, 0.5,
-2, -3.444304, -6.437907, 0, 1.5, 0.5, 0.5,
-1, -3.444304, -6.437907, 0, -0.5, 0.5, 0.5,
-1, -3.444304, -6.437907, 1, -0.5, 0.5, 0.5,
-1, -3.444304, -6.437907, 1, 1.5, 0.5, 0.5,
-1, -3.444304, -6.437907, 0, 1.5, 0.5, 0.5,
0, -3.444304, -6.437907, 0, -0.5, 0.5, 0.5,
0, -3.444304, -6.437907, 1, -0.5, 0.5, 0.5,
0, -3.444304, -6.437907, 1, 1.5, 0.5, 0.5,
0, -3.444304, -6.437907, 0, 1.5, 0.5, 0.5,
1, -3.444304, -6.437907, 0, -0.5, 0.5, 0.5,
1, -3.444304, -6.437907, 1, -0.5, 0.5, 0.5,
1, -3.444304, -6.437907, 1, 1.5, 0.5, 0.5,
1, -3.444304, -6.437907, 0, 1.5, 0.5, 0.5,
2, -3.444304, -6.437907, 0, -0.5, 0.5, 0.5,
2, -3.444304, -6.437907, 1, -0.5, 0.5, 0.5,
2, -3.444304, -6.437907, 1, 1.5, 0.5, 0.5,
2, -3.444304, -6.437907, 0, 1.5, 0.5, 0.5,
3, -3.444304, -6.437907, 0, -0.5, 0.5, 0.5,
3, -3.444304, -6.437907, 1, -0.5, 0.5, 0.5,
3, -3.444304, -6.437907, 1, 1.5, 0.5, 0.5,
3, -3.444304, -6.437907, 0, 1.5, 0.5, 0.5
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
-3.164882, -2, -5.557374,
-3.164882, 2, -5.557374,
-3.164882, -2, -5.557374,
-3.334157, -2, -5.850885,
-3.164882, -1, -5.557374,
-3.334157, -1, -5.850885,
-3.164882, 0, -5.557374,
-3.334157, 0, -5.850885,
-3.164882, 1, -5.557374,
-3.334157, 1, -5.850885,
-3.164882, 2, -5.557374,
-3.334157, 2, -5.850885
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
-3.672705, -2, -6.437907, 0, -0.5, 0.5, 0.5,
-3.672705, -2, -6.437907, 1, -0.5, 0.5, 0.5,
-3.672705, -2, -6.437907, 1, 1.5, 0.5, 0.5,
-3.672705, -2, -6.437907, 0, 1.5, 0.5, 0.5,
-3.672705, -1, -6.437907, 0, -0.5, 0.5, 0.5,
-3.672705, -1, -6.437907, 1, -0.5, 0.5, 0.5,
-3.672705, -1, -6.437907, 1, 1.5, 0.5, 0.5,
-3.672705, -1, -6.437907, 0, 1.5, 0.5, 0.5,
-3.672705, 0, -6.437907, 0, -0.5, 0.5, 0.5,
-3.672705, 0, -6.437907, 1, -0.5, 0.5, 0.5,
-3.672705, 0, -6.437907, 1, 1.5, 0.5, 0.5,
-3.672705, 0, -6.437907, 0, 1.5, 0.5, 0.5,
-3.672705, 1, -6.437907, 0, -0.5, 0.5, 0.5,
-3.672705, 1, -6.437907, 1, -0.5, 0.5, 0.5,
-3.672705, 1, -6.437907, 1, 1.5, 0.5, 0.5,
-3.672705, 1, -6.437907, 0, 1.5, 0.5, 0.5,
-3.672705, 2, -6.437907, 0, -0.5, 0.5, 0.5,
-3.672705, 2, -6.437907, 1, -0.5, 0.5, 0.5,
-3.672705, 2, -6.437907, 1, 1.5, 0.5, 0.5,
-3.672705, 2, -6.437907, 0, 1.5, 0.5, 0.5
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
-3.164882, -2.994464, -4,
-3.164882, -2.994464, 6,
-3.164882, -2.994464, -4,
-3.334157, -3.14441, -4,
-3.164882, -2.994464, -2,
-3.334157, -3.14441, -2,
-3.164882, -2.994464, 0,
-3.334157, -3.14441, 0,
-3.164882, -2.994464, 2,
-3.334157, -3.14441, 2,
-3.164882, -2.994464, 4,
-3.334157, -3.14441, 4,
-3.164882, -2.994464, 6,
-3.334157, -3.14441, 6
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
-3.672705, -3.444304, -4, 0, -0.5, 0.5, 0.5,
-3.672705, -3.444304, -4, 1, -0.5, 0.5, 0.5,
-3.672705, -3.444304, -4, 1, 1.5, 0.5, 0.5,
-3.672705, -3.444304, -4, 0, 1.5, 0.5, 0.5,
-3.672705, -3.444304, -2, 0, -0.5, 0.5, 0.5,
-3.672705, -3.444304, -2, 1, -0.5, 0.5, 0.5,
-3.672705, -3.444304, -2, 1, 1.5, 0.5, 0.5,
-3.672705, -3.444304, -2, 0, 1.5, 0.5, 0.5,
-3.672705, -3.444304, 0, 0, -0.5, 0.5, 0.5,
-3.672705, -3.444304, 0, 1, -0.5, 0.5, 0.5,
-3.672705, -3.444304, 0, 1, 1.5, 0.5, 0.5,
-3.672705, -3.444304, 0, 0, 1.5, 0.5, 0.5,
-3.672705, -3.444304, 2, 0, -0.5, 0.5, 0.5,
-3.672705, -3.444304, 2, 1, -0.5, 0.5, 0.5,
-3.672705, -3.444304, 2, 1, 1.5, 0.5, 0.5,
-3.672705, -3.444304, 2, 0, 1.5, 0.5, 0.5,
-3.672705, -3.444304, 4, 0, -0.5, 0.5, 0.5,
-3.672705, -3.444304, 4, 1, -0.5, 0.5, 0.5,
-3.672705, -3.444304, 4, 1, 1.5, 0.5, 0.5,
-3.672705, -3.444304, 4, 0, 1.5, 0.5, 0.5,
-3.672705, -3.444304, 6, 0, -0.5, 0.5, 0.5,
-3.672705, -3.444304, 6, 1, -0.5, 0.5, 0.5,
-3.672705, -3.444304, 6, 1, 1.5, 0.5, 0.5,
-3.672705, -3.444304, 6, 0, 1.5, 0.5, 0.5
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
-3.164882, -2.994464, -5.557374,
-3.164882, 3.003408, -5.557374,
-3.164882, -2.994464, 6.183069,
-3.164882, 3.003408, 6.183069,
-3.164882, -2.994464, -5.557374,
-3.164882, -2.994464, 6.183069,
-3.164882, 3.003408, -5.557374,
-3.164882, 3.003408, 6.183069,
-3.164882, -2.994464, -5.557374,
3.606083, -2.994464, -5.557374,
-3.164882, -2.994464, 6.183069,
3.606083, -2.994464, 6.183069,
-3.164882, 3.003408, -5.557374,
3.606083, 3.003408, -5.557374,
-3.164882, 3.003408, 6.183069,
3.606083, 3.003408, 6.183069,
3.606083, -2.994464, -5.557374,
3.606083, 3.003408, -5.557374,
3.606083, -2.994464, 6.183069,
3.606083, 3.003408, 6.183069,
3.606083, -2.994464, -5.557374,
3.606083, -2.994464, 6.183069,
3.606083, 3.003408, -5.557374,
3.606083, 3.003408, 6.183069
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
var radius = 7.914061;
var distance = 35.21055;
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
mvMatrix.translate( -0.2206005, -0.004472136, -0.3128474 );
mvMatrix.scale( 1.263754, 1.426646, 0.7288343 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.21055);
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
imidazole<-read.table("imidazole.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-imidazole$V2
```

```
## Error in eval(expr, envir, enclos): object 'imidazole' not found
```

```r
y<-imidazole$V3
```

```
## Error in eval(expr, envir, enclos): object 'imidazole' not found
```

```r
z<-imidazole$V4
```

```
## Error in eval(expr, envir, enclos): object 'imidazole' not found
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
-3.066276, -0.02897084, -3.126584, 0, 0, 1, 1, 1,
-2.930886, 0.9455769, -2.057232, 1, 0, 0, 1, 1,
-2.752216, 0.1136395, 0.5612913, 1, 0, 0, 1, 1,
-2.721792, 0.2530529, -2.01125, 1, 0, 0, 1, 1,
-2.620276, 1.06882, -0.2887909, 1, 0, 0, 1, 1,
-2.508024, 0.09935699, -2.457625, 1, 0, 0, 1, 1,
-2.41722, 0.3146052, -3.343947, 0, 0, 0, 1, 1,
-2.404652, -1.035712, -2.603138, 0, 0, 0, 1, 1,
-2.320727, -0.1673068, -3.118477, 0, 0, 0, 1, 1,
-2.294715, 0.01622677, -2.740397, 0, 0, 0, 1, 1,
-2.289563, 0.3443201, -1.71452, 0, 0, 0, 1, 1,
-2.158913, 1.402648, -0.9620591, 0, 0, 0, 1, 1,
-2.130311, -0.4003631, -0.9886472, 0, 0, 0, 1, 1,
-2.029554, 2.463342, 0.1421641, 1, 1, 1, 1, 1,
-2.018527, 0.4265567, 0.349197, 1, 1, 1, 1, 1,
-2.017288, 2.368726, -2.668553, 1, 1, 1, 1, 1,
-2.011535, 0.3826339, -1.390342, 1, 1, 1, 1, 1,
-1.925035, -0.35847, -1.928469, 1, 1, 1, 1, 1,
-1.912156, -0.4838262, -2.279652, 1, 1, 1, 1, 1,
-1.899624, 0.05144816, -1.584946, 1, 1, 1, 1, 1,
-1.875186, -0.6327652, -1.054893, 1, 1, 1, 1, 1,
-1.872114, -0.7469019, -2.303695, 1, 1, 1, 1, 1,
-1.8398, 1.100371, -1.413249, 1, 1, 1, 1, 1,
-1.826364, -0.2342145, -2.578634, 1, 1, 1, 1, 1,
-1.798311, 1.197573, -2.5762, 1, 1, 1, 1, 1,
-1.795235, -0.0003029746, -1.18144, 1, 1, 1, 1, 1,
-1.765103, 0.3515965, -1.29556, 1, 1, 1, 1, 1,
-1.761421, 0.1853042, -3.099404, 1, 1, 1, 1, 1,
-1.745998, 1.155546, -2.22548, 0, 0, 1, 1, 1,
-1.737099, -0.300742, -1.238389, 1, 0, 0, 1, 1,
-1.73472, 0.689505, -2.964953, 1, 0, 0, 1, 1,
-1.716656, 1.198307, -0.06538486, 1, 0, 0, 1, 1,
-1.710603, -0.3186085, -2.025046, 1, 0, 0, 1, 1,
-1.687011, -0.9589544, -2.799315, 1, 0, 0, 1, 1,
-1.682338, 0.3810566, -2.480092, 0, 0, 0, 1, 1,
-1.645196, -0.6763104, -3.361949, 0, 0, 0, 1, 1,
-1.638219, 0.5443994, -0.2251318, 0, 0, 0, 1, 1,
-1.625785, -1.270025, -2.883136, 0, 0, 0, 1, 1,
-1.624775, 0.04824866, -0.7349871, 0, 0, 0, 1, 1,
-1.61046, 0.08664007, 0.3888358, 0, 0, 0, 1, 1,
-1.60089, 0.6969299, -1.191094, 0, 0, 0, 1, 1,
-1.599876, -0.6359449, -2.721914, 1, 1, 1, 1, 1,
-1.59328, 0.03612142, -0.6267319, 1, 1, 1, 1, 1,
-1.589982, 1.118563, 0.3906537, 1, 1, 1, 1, 1,
-1.570721, 0.008828435, -2.120772, 1, 1, 1, 1, 1,
-1.569692, 0.9112547, -0.4602574, 1, 1, 1, 1, 1,
-1.568397, -0.03520666, -1.737221, 1, 1, 1, 1, 1,
-1.561448, 0.3956474, -1.071514, 1, 1, 1, 1, 1,
-1.555984, 0.5633454, -0.5545181, 1, 1, 1, 1, 1,
-1.555045, 0.668617, -0.7630094, 1, 1, 1, 1, 1,
-1.554362, 0.6737096, -1.984274, 1, 1, 1, 1, 1,
-1.549877, -0.7066012, -0.4987777, 1, 1, 1, 1, 1,
-1.504667, 1.711767, -1.336031, 1, 1, 1, 1, 1,
-1.504508, -1.157352, -2.092355, 1, 1, 1, 1, 1,
-1.481059, 0.01615758, -1.947063, 1, 1, 1, 1, 1,
-1.468354, 0.6827846, -2.937895, 1, 1, 1, 1, 1,
-1.466271, -1.517162, -3.332754, 0, 0, 1, 1, 1,
-1.466228, -0.4076267, -1.290201, 1, 0, 0, 1, 1,
-1.449495, -0.5226364, -0.4035154, 1, 0, 0, 1, 1,
-1.444384, -0.3985769, -0.8579882, 1, 0, 0, 1, 1,
-1.438318, 0.1973486, -1.359591, 1, 0, 0, 1, 1,
-1.435931, -1.714991, -2.919144, 1, 0, 0, 1, 1,
-1.432824, -0.6852667, -1.383957, 0, 0, 0, 1, 1,
-1.429502, -0.7322569, -3.915165, 0, 0, 0, 1, 1,
-1.405578, -1.343152, -1.350765, 0, 0, 0, 1, 1,
-1.403179, 1.862465, -1.305479, 0, 0, 0, 1, 1,
-1.402684, 1.648678, 0.2957216, 0, 0, 0, 1, 1,
-1.399955, -0.6233936, -1.74163, 0, 0, 0, 1, 1,
-1.387075, -1.034637, -3.093631, 0, 0, 0, 1, 1,
-1.378316, 0.05049505, -3.45265, 1, 1, 1, 1, 1,
-1.376518, -0.6226735, -0.8088846, 1, 1, 1, 1, 1,
-1.368197, -0.1601643, -3.4736, 1, 1, 1, 1, 1,
-1.357681, 0.5382976, 0.2564521, 1, 1, 1, 1, 1,
-1.3448, 1.009162, -1.005833, 1, 1, 1, 1, 1,
-1.343481, 1.556117, -0.6533926, 1, 1, 1, 1, 1,
-1.340446, -0.01736482, -1.347128, 1, 1, 1, 1, 1,
-1.336481, 0.9199224, -1.649652, 1, 1, 1, 1, 1,
-1.329689, 0.2602044, -1.460517, 1, 1, 1, 1, 1,
-1.326213, 0.5063012, -0.1832722, 1, 1, 1, 1, 1,
-1.325103, 1.24103, -0.3174725, 1, 1, 1, 1, 1,
-1.323621, -0.09558614, -1.190079, 1, 1, 1, 1, 1,
-1.323434, -0.8452197, -1.352511, 1, 1, 1, 1, 1,
-1.312083, 1.13885, -0.03437485, 1, 1, 1, 1, 1,
-1.308315, 0.2531441, -1.5552, 1, 1, 1, 1, 1,
-1.308129, -0.01210677, -1.188234, 0, 0, 1, 1, 1,
-1.304662, -1.257027, -1.77845, 1, 0, 0, 1, 1,
-1.297779, -1.110664, -2.940439, 1, 0, 0, 1, 1,
-1.287823, 1.256202, -1.413963, 1, 0, 0, 1, 1,
-1.278868, 0.5768449, -1.346489, 1, 0, 0, 1, 1,
-1.27848, -0.1708095, -1.070036, 1, 0, 0, 1, 1,
-1.273605, -2.047239, -1.779723, 0, 0, 0, 1, 1,
-1.264567, 0.2646923, -1.324392, 0, 0, 0, 1, 1,
-1.257541, 0.4464105, -0.7318943, 0, 0, 0, 1, 1,
-1.242668, -0.2890985, -2.261306, 0, 0, 0, 1, 1,
-1.23621, 0.2682841, -1.583285, 0, 0, 0, 1, 1,
-1.218745, -0.9235018, -3.934028, 0, 0, 0, 1, 1,
-1.214806, -1.033157, -4.732982, 0, 0, 0, 1, 1,
-1.213616, 0.7349311, -0.215727, 1, 1, 1, 1, 1,
-1.20536, -0.4421187, -0.548792, 1, 1, 1, 1, 1,
-1.202461, -0.2124903, -1.221781, 1, 1, 1, 1, 1,
-1.183008, -2.011709, -0.7045755, 1, 1, 1, 1, 1,
-1.181369, 0.8469887, -0.4006277, 1, 1, 1, 1, 1,
-1.173892, -0.2997622, -2.790044, 1, 1, 1, 1, 1,
-1.173734, 0.006831754, -1.483858, 1, 1, 1, 1, 1,
-1.168271, 0.5469677, -0.4300813, 1, 1, 1, 1, 1,
-1.164196, 1.070376, -0.2138672, 1, 1, 1, 1, 1,
-1.162705, 1.553867, 0.37666, 1, 1, 1, 1, 1,
-1.15383, 0.2041249, -0.9627815, 1, 1, 1, 1, 1,
-1.152087, 0.3872998, -2.209887, 1, 1, 1, 1, 1,
-1.151627, -2.273491, -5.386397, 1, 1, 1, 1, 1,
-1.148697, 2.874338, -0.891215, 1, 1, 1, 1, 1,
-1.147857, -0.9360628, -2.44292, 1, 1, 1, 1, 1,
-1.139692, -1.319932, -1.855976, 0, 0, 1, 1, 1,
-1.138419, -1.199025, -2.809312, 1, 0, 0, 1, 1,
-1.13775, -0.1981798, -1.390883, 1, 0, 0, 1, 1,
-1.136975, -0.4262226, -3.216662, 1, 0, 0, 1, 1,
-1.13236, 0.3122383, -2.879107, 1, 0, 0, 1, 1,
-1.125306, 0.3595308, -2.302545, 1, 0, 0, 1, 1,
-1.123393, 1.986912, 0.4378828, 0, 0, 0, 1, 1,
-1.118631, -0.02991323, -2.550668, 0, 0, 0, 1, 1,
-1.111707, 0.4471286, -1.843135, 0, 0, 0, 1, 1,
-1.11035, 0.6955237, 0.4538285, 0, 0, 0, 1, 1,
-1.104757, -0.5109888, -1.111347, 0, 0, 0, 1, 1,
-1.103621, -0.8516122, -2.688323, 0, 0, 0, 1, 1,
-1.102544, 0.3822035, -1.547291, 0, 0, 0, 1, 1,
-1.100543, 0.3044859, -0.5107721, 1, 1, 1, 1, 1,
-1.098303, -0.7715847, -4.10735, 1, 1, 1, 1, 1,
-1.084169, -0.7959107, -2.806704, 1, 1, 1, 1, 1,
-1.080451, 0.5063005, 0.08771767, 1, 1, 1, 1, 1,
-1.077041, -0.5023367, -2.028468, 1, 1, 1, 1, 1,
-1.071322, -0.00590675, 0.6663333, 1, 1, 1, 1, 1,
-1.061061, -2.322972, -3.232795, 1, 1, 1, 1, 1,
-1.038545, 1.881341, -0.3403451, 1, 1, 1, 1, 1,
-1.03396, 0.3920124, -1.050817, 1, 1, 1, 1, 1,
-1.032126, 0.7357681, -0.7235223, 1, 1, 1, 1, 1,
-1.026915, -0.2281041, -1.836133, 1, 1, 1, 1, 1,
-1.026133, -0.01875939, -2.418849, 1, 1, 1, 1, 1,
-1.019418, -0.2563473, -0.8386688, 1, 1, 1, 1, 1,
-1.018279, 0.8558577, 0.6944157, 1, 1, 1, 1, 1,
-1.014979, 0.1593213, -1.557965, 1, 1, 1, 1, 1,
-1.013059, -0.5105019, -1.160467, 0, 0, 1, 1, 1,
-1.008305, 0.3306123, -0.351639, 1, 0, 0, 1, 1,
-1.002949, -1.374781, -2.95854, 1, 0, 0, 1, 1,
-0.9998532, -1.083215, -2.890161, 1, 0, 0, 1, 1,
-0.9975131, 1.549433, -0.08090837, 1, 0, 0, 1, 1,
-0.9947826, 0.4074547, -0.4800922, 1, 0, 0, 1, 1,
-0.9881439, 0.1963994, -0.8980017, 0, 0, 0, 1, 1,
-0.9834641, -0.4544359, -0.605856, 0, 0, 0, 1, 1,
-0.9783528, -1.662573, -4.41734, 0, 0, 0, 1, 1,
-0.9779342, 1.063824, -1.835846, 0, 0, 0, 1, 1,
-0.9720482, -0.2963815, -3.068744, 0, 0, 0, 1, 1,
-0.9689876, -1.045323, -2.865443, 0, 0, 0, 1, 1,
-0.9634414, 0.3254871, -0.947112, 0, 0, 0, 1, 1,
-0.9627821, -0.7005422, 0.3177654, 1, 1, 1, 1, 1,
-0.9590774, 0.1827336, -1.008238, 1, 1, 1, 1, 1,
-0.953157, -0.7189317, -2.341394, 1, 1, 1, 1, 1,
-0.9477443, -0.6776546, -2.055912, 1, 1, 1, 1, 1,
-0.9474038, -0.2434964, -3.043917, 1, 1, 1, 1, 1,
-0.9464595, 1.33027, -2.389823, 1, 1, 1, 1, 1,
-0.9463323, -0.2367342, -1.422034, 1, 1, 1, 1, 1,
-0.9385158, 0.3366177, -0.268488, 1, 1, 1, 1, 1,
-0.9355301, 0.1846453, -1.354408, 1, 1, 1, 1, 1,
-0.9318008, 0.2600462, -0.7940536, 1, 1, 1, 1, 1,
-0.9240908, -0.008318475, -1.503585, 1, 1, 1, 1, 1,
-0.9170936, -1.320303, -2.994239, 1, 1, 1, 1, 1,
-0.9168735, -0.7913843, -2.42566, 1, 1, 1, 1, 1,
-0.9122708, -0.6371337, -0.5938364, 1, 1, 1, 1, 1,
-0.9110916, 1.178779, 0.8185592, 1, 1, 1, 1, 1,
-0.907572, 0.8281211, -1.907416, 0, 0, 1, 1, 1,
-0.902023, 1.804423, -0.6976439, 1, 0, 0, 1, 1,
-0.8998536, -1.567777, -2.899331, 1, 0, 0, 1, 1,
-0.8934503, 0.6592714, -0.9379644, 1, 0, 0, 1, 1,
-0.8914382, -0.09016274, -0.9317873, 1, 0, 0, 1, 1,
-0.8877533, 1.268616, -2.4396, 1, 0, 0, 1, 1,
-0.8850319, 1.261441, -0.3061646, 0, 0, 0, 1, 1,
-0.8823404, -0.1601125, -1.613798, 0, 0, 0, 1, 1,
-0.8803738, -1.001519, -4.25751, 0, 0, 0, 1, 1,
-0.8620439, 1.001118, -1.628651, 0, 0, 0, 1, 1,
-0.8543344, -0.8332908, -3.203629, 0, 0, 0, 1, 1,
-0.8538517, 0.4667031, -0.6546473, 0, 0, 0, 1, 1,
-0.8523324, -0.1658814, -2.383173, 0, 0, 0, 1, 1,
-0.850899, -0.6174684, -1.450272, 1, 1, 1, 1, 1,
-0.8500568, 0.7832984, -1.270738, 1, 1, 1, 1, 1,
-0.8500257, 0.4798627, -0.6702638, 1, 1, 1, 1, 1,
-0.8494935, 2.45415, -0.07022215, 1, 1, 1, 1, 1,
-0.8491966, 0.4690243, -0.3101042, 1, 1, 1, 1, 1,
-0.8457972, 1.135772, -0.7697709, 1, 1, 1, 1, 1,
-0.8452049, -1.118433, -2.086217, 1, 1, 1, 1, 1,
-0.8417197, -1.409549, -2.732877, 1, 1, 1, 1, 1,
-0.8413963, -0.6600347, -3.938325, 1, 1, 1, 1, 1,
-0.8413599, 0.7389441, -1.977511, 1, 1, 1, 1, 1,
-0.8337865, -0.2658785, -1.871754, 1, 1, 1, 1, 1,
-0.8315957, 1.734488, -0.6068019, 1, 1, 1, 1, 1,
-0.8315483, 1.355705, -0.2190866, 1, 1, 1, 1, 1,
-0.8289407, -0.9891738, -3.458824, 1, 1, 1, 1, 1,
-0.8228493, 0.8402586, -1.328667, 1, 1, 1, 1, 1,
-0.8197757, 0.1262373, -3.066864, 0, 0, 1, 1, 1,
-0.8186971, -0.124384, -3.051172, 1, 0, 0, 1, 1,
-0.8150581, -1.74481, -2.855355, 1, 0, 0, 1, 1,
-0.812833, 0.05768789, -1.354141, 1, 0, 0, 1, 1,
-0.8028904, 2.262471, 0.4543673, 1, 0, 0, 1, 1,
-0.8027272, -0.2630243, -0.8100591, 1, 0, 0, 1, 1,
-0.8002222, 0.03217722, 0.7556521, 0, 0, 0, 1, 1,
-0.7819541, 0.6536037, -1.825204, 0, 0, 0, 1, 1,
-0.7781518, 1.223095, 0.002816329, 0, 0, 0, 1, 1,
-0.7773849, -1.909817, -2.71683, 0, 0, 0, 1, 1,
-0.7756888, -0.2793243, -1.717881, 0, 0, 0, 1, 1,
-0.7748322, -1.080928, -1.989962, 0, 0, 0, 1, 1,
-0.7746478, 0.6535957, -0.6655681, 0, 0, 0, 1, 1,
-0.7742932, -1.174927, -2.291641, 1, 1, 1, 1, 1,
-0.7663422, -0.2659509, -2.687778, 1, 1, 1, 1, 1,
-0.7584521, -0.2421123, -2.700694, 1, 1, 1, 1, 1,
-0.7558882, -0.4442831, -4.044863, 1, 1, 1, 1, 1,
-0.7514479, 1.242159, 0.4845738, 1, 1, 1, 1, 1,
-0.7487956, -0.3706747, -2.003271, 1, 1, 1, 1, 1,
-0.7408099, 0.4771875, -1.034379, 1, 1, 1, 1, 1,
-0.7402819, -0.4790067, -1.395964, 1, 1, 1, 1, 1,
-0.738286, 0.0007365297, 1.562078, 1, 1, 1, 1, 1,
-0.7316146, -0.2795163, -0.9411789, 1, 1, 1, 1, 1,
-0.7218069, 0.4091955, -0.9461929, 1, 1, 1, 1, 1,
-0.7200881, -0.3161028, -3.311679, 1, 1, 1, 1, 1,
-0.7115943, -0.5039521, -2.231172, 1, 1, 1, 1, 1,
-0.7088737, -0.6166189, -2.841783, 1, 1, 1, 1, 1,
-0.7043251, 0.2171807, -1.250255, 1, 1, 1, 1, 1,
-0.697843, 0.9568899, -1.163062, 0, 0, 1, 1, 1,
-0.6969282, -1.239318, -2.750661, 1, 0, 0, 1, 1,
-0.6927411, -0.2092707, -2.035645, 1, 0, 0, 1, 1,
-0.689468, 0.576129, -2.035727, 1, 0, 0, 1, 1,
-0.684995, -0.538336, -4.353452, 1, 0, 0, 1, 1,
-0.6829763, 1.656515, 1.089201, 1, 0, 0, 1, 1,
-0.6826841, -0.4306425, 0.02093999, 0, 0, 0, 1, 1,
-0.6821318, 1.348335, 1.036065, 0, 0, 0, 1, 1,
-0.6788611, 0.3589589, -2.062126, 0, 0, 0, 1, 1,
-0.6763104, -0.1011132, -2.689898, 0, 0, 0, 1, 1,
-0.6748533, -0.8442537, -5.020606, 0, 0, 0, 1, 1,
-0.6742844, -0.4790042, -1.960659, 0, 0, 0, 1, 1,
-0.6725713, 0.2016069, -0.2909892, 0, 0, 0, 1, 1,
-0.6673678, -0.204961, -3.321978, 1, 1, 1, 1, 1,
-0.6647079, -0.4332043, -1.531003, 1, 1, 1, 1, 1,
-0.6569728, 1.007411, -0.8991352, 1, 1, 1, 1, 1,
-0.6567153, -1.42904, -1.959134, 1, 1, 1, 1, 1,
-0.6566669, 0.3521262, -0.7469613, 1, 1, 1, 1, 1,
-0.648539, -0.07604253, -2.580846, 1, 1, 1, 1, 1,
-0.6470607, -1.681581, -2.458247, 1, 1, 1, 1, 1,
-0.6462002, -2.005012, -3.196944, 1, 1, 1, 1, 1,
-0.6408851, -0.8191434, -3.23081, 1, 1, 1, 1, 1,
-0.6390752, 0.9376768, -2.127575, 1, 1, 1, 1, 1,
-0.6383171, -0.8391271, -2.768854, 1, 1, 1, 1, 1,
-0.6356746, 0.2005328, -0.6431356, 1, 1, 1, 1, 1,
-0.6352499, 0.07183438, -1.062327, 1, 1, 1, 1, 1,
-0.6350009, 0.4438826, -0.2747711, 1, 1, 1, 1, 1,
-0.6343302, -0.3270364, -1.769908, 1, 1, 1, 1, 1,
-0.6336498, -0.5365942, -2.515982, 0, 0, 1, 1, 1,
-0.6310269, -0.7964668, -1.588225, 1, 0, 0, 1, 1,
-0.6294736, 1.387415, -0.4802303, 1, 0, 0, 1, 1,
-0.6278667, 0.516991, -2.030483, 1, 0, 0, 1, 1,
-0.6259412, -0.3549302, -1.560581, 1, 0, 0, 1, 1,
-0.6235313, 0.7855343, -1.522642, 1, 0, 0, 1, 1,
-0.621138, 1.815665, -0.5046757, 0, 0, 0, 1, 1,
-0.6204522, 1.661142, -1.873805, 0, 0, 0, 1, 1,
-0.6199162, 0.1168135, -4.11988, 0, 0, 0, 1, 1,
-0.6189796, 0.7540745, -0.8391345, 0, 0, 0, 1, 1,
-0.6112424, -0.5307682, -1.524407, 0, 0, 0, 1, 1,
-0.6077311, 0.5005651, -0.1419945, 0, 0, 0, 1, 1,
-0.6055738, -0.3975845, -1.75628, 0, 0, 0, 1, 1,
-0.6047084, -1.102835, -3.380872, 1, 1, 1, 1, 1,
-0.6034604, -0.2235936, -2.469507, 1, 1, 1, 1, 1,
-0.6004121, 2.109349, -1.26206, 1, 1, 1, 1, 1,
-0.5929118, 0.576599, 0.4764229, 1, 1, 1, 1, 1,
-0.5897513, -0.4829477, -1.205165, 1, 1, 1, 1, 1,
-0.5886772, 1.217291, 0.6014702, 1, 1, 1, 1, 1,
-0.5884961, -0.04727642, -1.377084, 1, 1, 1, 1, 1,
-0.5876846, 1.471478, -0.5719621, 1, 1, 1, 1, 1,
-0.5876011, -1.130803, -2.348347, 1, 1, 1, 1, 1,
-0.5858447, 0.5868312, 0.2734928, 1, 1, 1, 1, 1,
-0.5850564, 1.220196, -1.227673, 1, 1, 1, 1, 1,
-0.5830946, 0.3222945, 0.1907472, 1, 1, 1, 1, 1,
-0.5750583, 1.000867, -2.272381, 1, 1, 1, 1, 1,
-0.5742256, 1.671813, 0.7680994, 1, 1, 1, 1, 1,
-0.5689272, -0.5675181, -0.4459831, 1, 1, 1, 1, 1,
-0.5684936, 0.4309799, -0.1044314, 0, 0, 1, 1, 1,
-0.5683333, 1.874382, -1.154432, 1, 0, 0, 1, 1,
-0.5627527, 1.538567, 0.7730848, 1, 0, 0, 1, 1,
-0.5614184, 0.3451776, -1.195125, 1, 0, 0, 1, 1,
-0.5582538, -1.184393, -3.391816, 1, 0, 0, 1, 1,
-0.5572366, -0.713505, -2.9503, 1, 0, 0, 1, 1,
-0.5528503, -1.036641, -4.183913, 0, 0, 0, 1, 1,
-0.5475977, 0.1532743, -1.407766, 0, 0, 0, 1, 1,
-0.5471117, -0.1153006, -2.723822, 0, 0, 0, 1, 1,
-0.5414935, -0.7047553, -3.655043, 0, 0, 0, 1, 1,
-0.5396788, -1.760616, -3.838889, 0, 0, 0, 1, 1,
-0.5391067, -0.1450481, -1.812013, 0, 0, 0, 1, 1,
-0.5378233, -0.5045435, -1.173183, 0, 0, 0, 1, 1,
-0.5371847, -0.1045336, -1.494676, 1, 1, 1, 1, 1,
-0.5357641, -1.573212, -1.711499, 1, 1, 1, 1, 1,
-0.5340997, -1.338992, -3.453149, 1, 1, 1, 1, 1,
-0.5336626, -0.1832767, -1.884858, 1, 1, 1, 1, 1,
-0.5302226, 1.52667, 0.7590799, 1, 1, 1, 1, 1,
-0.5241884, 0.3649904, -1.2499, 1, 1, 1, 1, 1,
-0.5206499, 1.012271, -2.594725, 1, 1, 1, 1, 1,
-0.5093617, -0.811831, -4.123271, 1, 1, 1, 1, 1,
-0.508922, -0.3920938, -3.890841, 1, 1, 1, 1, 1,
-0.5068259, 0.3010188, -2.112947, 1, 1, 1, 1, 1,
-0.4954526, -0.6406021, -3.891439, 1, 1, 1, 1, 1,
-0.4952046, -1.083324, -2.208122, 1, 1, 1, 1, 1,
-0.4940393, -1.483939, -2.549595, 1, 1, 1, 1, 1,
-0.4933015, 0.4636735, 0.01750312, 1, 1, 1, 1, 1,
-0.4896599, 0.5408292, 0.4472906, 1, 1, 1, 1, 1,
-0.488284, -1.154075, -1.149206, 0, 0, 1, 1, 1,
-0.4844848, 0.1043743, -1.335377, 1, 0, 0, 1, 1,
-0.4809034, -0.223997, -2.681669, 1, 0, 0, 1, 1,
-0.4808191, -1.325421, -3.410058, 1, 0, 0, 1, 1,
-0.4745268, -0.8955354, -3.425637, 1, 0, 0, 1, 1,
-0.472528, 1.33989, 0.7378566, 1, 0, 0, 1, 1,
-0.4723573, -0.7350777, -2.622411, 0, 0, 0, 1, 1,
-0.4722059, 0.1876422, -0.9979971, 0, 0, 0, 1, 1,
-0.4683768, 0.6255869, -2.109569, 0, 0, 0, 1, 1,
-0.4673131, 0.3345234, 0.2012057, 0, 0, 0, 1, 1,
-0.4665283, -1.259325, -2.955878, 0, 0, 0, 1, 1,
-0.4594215, -0.8495305, -2.731637, 0, 0, 0, 1, 1,
-0.4588376, -0.242961, -0.7763104, 0, 0, 0, 1, 1,
-0.4506137, 0.03423942, -2.358269, 1, 1, 1, 1, 1,
-0.4460852, -0.915643, -2.347574, 1, 1, 1, 1, 1,
-0.4440725, 0.004244937, 0.7007031, 1, 1, 1, 1, 1,
-0.4417912, 1.650725, -0.5997213, 1, 1, 1, 1, 1,
-0.4395053, -0.2341951, -1.857544, 1, 1, 1, 1, 1,
-0.4393348, 1.440066, -0.8963086, 1, 1, 1, 1, 1,
-0.4369557, -0.09715591, -2.403658, 1, 1, 1, 1, 1,
-0.4359489, 2.558819, 0.4151843, 1, 1, 1, 1, 1,
-0.4327022, 0.9345361, -0.5398228, 1, 1, 1, 1, 1,
-0.4293078, -0.5879399, -3.391108, 1, 1, 1, 1, 1,
-0.42863, -0.5211039, -2.138851, 1, 1, 1, 1, 1,
-0.4263059, 0.1191821, 0.2171918, 1, 1, 1, 1, 1,
-0.4235516, -0.235884, -1.294984, 1, 1, 1, 1, 1,
-0.4165807, -0.6886767, -1.000377, 1, 1, 1, 1, 1,
-0.4154542, 0.2215704, -0.3234877, 1, 1, 1, 1, 1,
-0.415275, -0.3093993, -3.075172, 0, 0, 1, 1, 1,
-0.4112383, 0.6874503, -0.569616, 1, 0, 0, 1, 1,
-0.4029199, 0.1794624, -1.338373, 1, 0, 0, 1, 1,
-0.3995295, 0.15539, -0.3072175, 1, 0, 0, 1, 1,
-0.3992642, 0.4916663, 0.003535327, 1, 0, 0, 1, 1,
-0.3981347, 0.7507377, 3.235181, 1, 0, 0, 1, 1,
-0.3975155, 0.9559773, -0.6797755, 0, 0, 0, 1, 1,
-0.3946373, 0.1635223, -1.031763, 0, 0, 0, 1, 1,
-0.3946201, -1.535239, -4.540177, 0, 0, 0, 1, 1,
-0.3913156, -1.843152, -4.464429, 0, 0, 0, 1, 1,
-0.3861414, 2.192641, -0.6844795, 0, 0, 0, 1, 1,
-0.3849544, 1.782602, -0.9318696, 0, 0, 0, 1, 1,
-0.3818209, 1.503367, -0.2041412, 0, 0, 0, 1, 1,
-0.3754041, -0.4403584, -3.818653, 1, 1, 1, 1, 1,
-0.3723788, 0.09437544, -1.263127, 1, 1, 1, 1, 1,
-0.3710971, 1.17822, 0.224361, 1, 1, 1, 1, 1,
-0.3702453, -2.843057, -2.802896, 1, 1, 1, 1, 1,
-0.369327, -1.162521, -3.824071, 1, 1, 1, 1, 1,
-0.3691964, -1.010456, -3.324046, 1, 1, 1, 1, 1,
-0.3689415, -1.23454, -3.076963, 1, 1, 1, 1, 1,
-0.3671061, 0.09744757, -2.75529, 1, 1, 1, 1, 1,
-0.3653012, 0.2696012, -0.4611163, 1, 1, 1, 1, 1,
-0.364557, 0.7064213, -0.4440367, 1, 1, 1, 1, 1,
-0.3605411, 1.036102, -0.5079101, 1, 1, 1, 1, 1,
-0.3603542, 0.5103205, -0.193192, 1, 1, 1, 1, 1,
-0.3580559, -0.8709618, -2.344941, 1, 1, 1, 1, 1,
-0.3521853, -0.5610499, -2.62153, 1, 1, 1, 1, 1,
-0.3501276, 0.9921959, -0.08844966, 1, 1, 1, 1, 1,
-0.346706, 0.912277, -0.5376713, 0, 0, 1, 1, 1,
-0.3463442, 1.117561, -0.9366566, 1, 0, 0, 1, 1,
-0.3427727, -1.74139, -3.943458, 1, 0, 0, 1, 1,
-0.3412, -0.4880641, -1.96814, 1, 0, 0, 1, 1,
-0.338266, 0.5997763, -0.5320757, 1, 0, 0, 1, 1,
-0.3353209, -1.585594, -2.764332, 1, 0, 0, 1, 1,
-0.3347326, -0.01980005, -2.58172, 0, 0, 0, 1, 1,
-0.3340001, -0.6405562, -2.424877, 0, 0, 0, 1, 1,
-0.3332843, -1.078103, -2.678563, 0, 0, 0, 1, 1,
-0.3324002, -1.319539, -1.368206, 0, 0, 0, 1, 1,
-0.3302376, -1.092163, -4.203829, 0, 0, 0, 1, 1,
-0.3272943, -0.6647589, -3.846174, 0, 0, 0, 1, 1,
-0.3235941, 0.3036507, -0.7890493, 0, 0, 0, 1, 1,
-0.3174836, 0.6993673, -0.2194446, 1, 1, 1, 1, 1,
-0.3166652, -1.555361, -2.476488, 1, 1, 1, 1, 1,
-0.3160905, -0.3462656, -2.774953, 1, 1, 1, 1, 1,
-0.3133054, -1.3694, -3.619337, 1, 1, 1, 1, 1,
-0.3073683, -0.5708016, -1.206471, 1, 1, 1, 1, 1,
-0.305077, 1.104819, -0.3653736, 1, 1, 1, 1, 1,
-0.3028448, 0.5681317, -0.596028, 1, 1, 1, 1, 1,
-0.3016433, -1.776458, -0.7959613, 1, 1, 1, 1, 1,
-0.292308, -0.4966435, -2.760342, 1, 1, 1, 1, 1,
-0.2921487, -1.095016, -0.9070368, 1, 1, 1, 1, 1,
-0.2919352, 0.002146532, -1.843349, 1, 1, 1, 1, 1,
-0.2842395, -0.7540022, -3.042623, 1, 1, 1, 1, 1,
-0.2791837, 0.7763374, -0.6251422, 1, 1, 1, 1, 1,
-0.2779141, 0.04557747, -1.533672, 1, 1, 1, 1, 1,
-0.2761152, -0.09350044, -0.6421018, 1, 1, 1, 1, 1,
-0.2740017, -0.6870565, -4.748563, 0, 0, 1, 1, 1,
-0.2722445, 0.200891, -1.348156, 1, 0, 0, 1, 1,
-0.2706411, 1.209919, 0.1380084, 1, 0, 0, 1, 1,
-0.2680277, 0.918497, -0.551428, 1, 0, 0, 1, 1,
-0.2669943, -1.772373, -3.884166, 1, 0, 0, 1, 1,
-0.2652158, 0.9433743, 0.3779481, 1, 0, 0, 1, 1,
-0.2555741, -1.046302, -3.370122, 0, 0, 0, 1, 1,
-0.2549861, -0.6898962, -2.761303, 0, 0, 0, 1, 1,
-0.2513238, -0.6294662, -2.308236, 0, 0, 0, 1, 1,
-0.2431531, -0.9584308, -2.300053, 0, 0, 0, 1, 1,
-0.2411648, -0.8995615, -3.418563, 0, 0, 0, 1, 1,
-0.2351134, 0.4713261, -1.551725, 0, 0, 0, 1, 1,
-0.2336299, -0.1829121, -4.638904, 0, 0, 0, 1, 1,
-0.232554, 0.4659981, -2.118116, 1, 1, 1, 1, 1,
-0.2303084, 1.539728, -0.5057215, 1, 1, 1, 1, 1,
-0.2295474, 1.167151, -1.203538, 1, 1, 1, 1, 1,
-0.2285075, -0.9549366, -2.63992, 1, 1, 1, 1, 1,
-0.2274927, 0.57595, 1.252168, 1, 1, 1, 1, 1,
-0.2166357, -1.199069, -1.261216, 1, 1, 1, 1, 1,
-0.2134734, 0.7559002, 0.0968324, 1, 1, 1, 1, 1,
-0.2118471, -0.2501357, -0.275716, 1, 1, 1, 1, 1,
-0.2077319, 0.1731229, -0.9624003, 1, 1, 1, 1, 1,
-0.2077144, 1.000581, 0.6260567, 1, 1, 1, 1, 1,
-0.207616, 0.1266438, -2.394376, 1, 1, 1, 1, 1,
-0.2058081, 1.172886, 0.7179995, 1, 1, 1, 1, 1,
-0.2032631, -0.03941872, -2.362224, 1, 1, 1, 1, 1,
-0.2007608, -2.051885, -4.104147, 1, 1, 1, 1, 1,
-0.1983122, -0.6676586, -2.717134, 1, 1, 1, 1, 1,
-0.1970072, -1.643802, -3.412122, 0, 0, 1, 1, 1,
-0.1952711, 0.2170462, 0.08165833, 1, 0, 0, 1, 1,
-0.1939829, -0.4267854, -1.928744, 1, 0, 0, 1, 1,
-0.1939264, -0.7769779, -1.635576, 1, 0, 0, 1, 1,
-0.1817227, 0.2586105, 0.248808, 1, 0, 0, 1, 1,
-0.1788233, 0.3209057, -1.888554, 1, 0, 0, 1, 1,
-0.1783097, -0.2532203, -2.984372, 0, 0, 0, 1, 1,
-0.1677847, -0.4277365, -3.436201, 0, 0, 0, 1, 1,
-0.1656151, -0.1385213, -4.416809, 0, 0, 0, 1, 1,
-0.1643111, -0.5355211, -4.028217, 0, 0, 0, 1, 1,
-0.1622977, 1.288806, -0.1585756, 0, 0, 0, 1, 1,
-0.1613117, 0.5849929, -0.348708, 0, 0, 0, 1, 1,
-0.1606308, 0.6041547, 0.6590775, 0, 0, 0, 1, 1,
-0.1605425, -1.424532, -1.525432, 1, 1, 1, 1, 1,
-0.1602605, -1.376844, -2.475496, 1, 1, 1, 1, 1,
-0.1562356, 0.5043908, -1.347974, 1, 1, 1, 1, 1,
-0.1562352, -0.008455002, -2.136959, 1, 1, 1, 1, 1,
-0.1561899, 1.56516, 0.4518686, 1, 1, 1, 1, 1,
-0.1554077, 1.611883, 0.05845305, 1, 1, 1, 1, 1,
-0.1535956, -0.02191783, -2.765184, 1, 1, 1, 1, 1,
-0.1531676, 0.4597746, -0.07087633, 1, 1, 1, 1, 1,
-0.1502605, 0.1854098, 1.101419, 1, 1, 1, 1, 1,
-0.1468895, -2.127574, -2.061653, 1, 1, 1, 1, 1,
-0.1467571, 1.254103, -0.2162799, 1, 1, 1, 1, 1,
-0.1459059, 0.3057667, -1.024968, 1, 1, 1, 1, 1,
-0.1439648, 2.504321, -0.2474502, 1, 1, 1, 1, 1,
-0.1418086, -0.6559061, -2.781954, 1, 1, 1, 1, 1,
-0.1397073, 0.546077, 0.2191262, 1, 1, 1, 1, 1,
-0.139248, -1.595739, -2.564569, 0, 0, 1, 1, 1,
-0.127941, -0.6208254, -3.411986, 1, 0, 0, 1, 1,
-0.1276896, -0.6899402, -4.892265, 1, 0, 0, 1, 1,
-0.1275804, -1.064979, -4.453152, 1, 0, 0, 1, 1,
-0.1226458, -0.9413496, -4.198129, 1, 0, 0, 1, 1,
-0.1210391, -0.3097309, -3.235854, 1, 0, 0, 1, 1,
-0.1163191, 0.5107058, -0.5026411, 0, 0, 0, 1, 1,
-0.1160335, 2.180173, 0.09214656, 0, 0, 0, 1, 1,
-0.1151844, -0.0853081, -1.892759, 0, 0, 0, 1, 1,
-0.1090604, -0.7034451, -3.482466, 0, 0, 0, 1, 1,
-0.1075712, 0.5337907, -0.03935829, 0, 0, 0, 1, 1,
-0.1062693, -0.1819223, -2.491441, 0, 0, 0, 1, 1,
-0.1007199, -0.1155692, -4.238429, 0, 0, 0, 1, 1,
-0.09253287, -0.9358994, -2.955904, 1, 1, 1, 1, 1,
-0.09178826, 0.8337082, -1.290559, 1, 1, 1, 1, 1,
-0.0909733, 0.3724443, -0.348203, 1, 1, 1, 1, 1,
-0.0855026, 0.3445707, 0.8389724, 1, 1, 1, 1, 1,
-0.08267934, -2.376807, -3.573736, 1, 1, 1, 1, 1,
-0.08066718, 2.207222, 0.4137778, 1, 1, 1, 1, 1,
-0.07721838, 1.617686, 0.5964112, 1, 1, 1, 1, 1,
-0.07643118, -1.640388, -2.232345, 1, 1, 1, 1, 1,
-0.07608362, -0.05538376, -4.174692, 1, 1, 1, 1, 1,
-0.07550492, -0.6848494, -4.56766, 1, 1, 1, 1, 1,
-0.06629839, -0.9882575, -5.291059, 1, 1, 1, 1, 1,
-0.06579438, -0.4600652, -2.571679, 1, 1, 1, 1, 1,
-0.06433606, 1.2031, -0.6707734, 1, 1, 1, 1, 1,
-0.06297934, 0.2695253, 1.050715, 1, 1, 1, 1, 1,
-0.06275224, -1.151382, -3.120159, 1, 1, 1, 1, 1,
-0.05963343, -1.55011, -3.108958, 0, 0, 1, 1, 1,
-0.0574018, -1.870014, -2.254362, 1, 0, 0, 1, 1,
-0.05387411, -0.8569731, -2.134233, 1, 0, 0, 1, 1,
-0.04747119, 1.543698, -0.1525386, 1, 0, 0, 1, 1,
-0.04714374, 0.999362, 0.6010131, 1, 0, 0, 1, 1,
-0.04518137, 0.8537333, -1.290229, 1, 0, 0, 1, 1,
-0.04488787, 0.3735273, -1.211524, 0, 0, 0, 1, 1,
-0.0429603, 0.5400246, -2.076135, 0, 0, 0, 1, 1,
-0.04080522, 0.2951988, 0.3410658, 0, 0, 0, 1, 1,
-0.03397724, 0.6966721, -0.09481619, 0, 0, 0, 1, 1,
-0.03295979, -0.8843743, -2.126772, 0, 0, 0, 1, 1,
-0.02978281, 0.3402198, 0.9541904, 0, 0, 0, 1, 1,
-0.0280065, -0.187339, -2.704578, 0, 0, 0, 1, 1,
-0.02679644, 0.942353, 2.004011, 1, 1, 1, 1, 1,
-0.02559017, -0.02586243, -1.633846, 1, 1, 1, 1, 1,
-0.0219681, 0.5084137, 0.3214866, 1, 1, 1, 1, 1,
-0.02168202, 0.2461366, -1.17337, 1, 1, 1, 1, 1,
-0.0203579, 0.3009949, -1.638823, 1, 1, 1, 1, 1,
-0.01863531, -0.4059057, -2.442498, 1, 1, 1, 1, 1,
-0.01837022, 1.382872, -2.013808, 1, 1, 1, 1, 1,
-0.01558561, -1.245685, -1.589926, 1, 1, 1, 1, 1,
-0.00736876, -0.8059859, -3.998562, 1, 1, 1, 1, 1,
-0.004163462, -1.082338, -3.389523, 1, 1, 1, 1, 1,
-0.001430971, -0.4719494, -2.731218, 1, 1, 1, 1, 1,
0.001184033, 0.5126215, 0.301798, 1, 1, 1, 1, 1,
0.006498683, -0.8818592, 2.975904, 1, 1, 1, 1, 1,
0.00764274, 1.196835, -1.037483, 1, 1, 1, 1, 1,
0.007927828, -0.3411109, 4.801495, 1, 1, 1, 1, 1,
0.01084177, 0.3138889, -0.5855756, 0, 0, 1, 1, 1,
0.01584531, 1.344174, 0.6621804, 1, 0, 0, 1, 1,
0.01849674, -1.698504, 3.1814, 1, 0, 0, 1, 1,
0.01861934, -0.9569331, 2.472377, 1, 0, 0, 1, 1,
0.02150289, 0.3392069, 1.299025, 1, 0, 0, 1, 1,
0.02507698, -1.333937, 3.780897, 1, 0, 0, 1, 1,
0.02862636, -0.1970579, 2.431461, 0, 0, 0, 1, 1,
0.02898811, 0.7535328, -0.1210332, 0, 0, 0, 1, 1,
0.03172497, -1.601657, 1.796893, 0, 0, 0, 1, 1,
0.03516905, -2.187613, 4.269004, 0, 0, 0, 1, 1,
0.0358269, -0.4541889, 3.600141, 0, 0, 0, 1, 1,
0.03930148, -0.04978154, 3.073321, 0, 0, 0, 1, 1,
0.04085853, -0.9654238, 4.172842, 0, 0, 0, 1, 1,
0.04452591, -0.8852273, 3.573257, 1, 1, 1, 1, 1,
0.04460057, -1.729471, 3.290193, 1, 1, 1, 1, 1,
0.04605588, 1.207546, -0.150502, 1, 1, 1, 1, 1,
0.04665713, -0.2649717, 2.743778, 1, 1, 1, 1, 1,
0.04771031, 1.795254, 0.4999495, 1, 1, 1, 1, 1,
0.05033338, 0.2876626, -0.03779866, 1, 1, 1, 1, 1,
0.0516273, 1.279635, 0.5412096, 1, 1, 1, 1, 1,
0.0548316, -2.08228, 3.550253, 1, 1, 1, 1, 1,
0.055179, 0.6747344, -0.3736542, 1, 1, 1, 1, 1,
0.06044666, 0.301772, -0.7737422, 1, 1, 1, 1, 1,
0.06078451, 1.251537, 0.9782095, 1, 1, 1, 1, 1,
0.06153195, 1.271841, -1.281538, 1, 1, 1, 1, 1,
0.06315416, 1.282715, -0.8874874, 1, 1, 1, 1, 1,
0.07532366, 2.398438, 0.8789704, 1, 1, 1, 1, 1,
0.07608114, -0.7950988, 2.895994, 1, 1, 1, 1, 1,
0.07702556, 0.04143878, 1.255964, 0, 0, 1, 1, 1,
0.08244741, 0.4714961, 1.050357, 1, 0, 0, 1, 1,
0.08317224, -0.3438499, 2.641771, 1, 0, 0, 1, 1,
0.0878571, 1.279749, -2.733837, 1, 0, 0, 1, 1,
0.08920454, -0.5563175, 2.145687, 1, 0, 0, 1, 1,
0.09403136, 0.8259327, 1.874903, 1, 0, 0, 1, 1,
0.0944802, -0.1152533, 4.503292, 0, 0, 0, 1, 1,
0.09665742, -1.18294, 4.286876, 0, 0, 0, 1, 1,
0.09881808, 1.103542, -0.420365, 0, 0, 0, 1, 1,
0.0994533, -0.01843471, 2.770224, 0, 0, 0, 1, 1,
0.1041256, -0.3814099, 3.637239, 0, 0, 0, 1, 1,
0.1060501, 0.5959763, 0.2892182, 0, 0, 0, 1, 1,
0.1094742, 1.082935, 1.152259, 0, 0, 0, 1, 1,
0.1100741, -0.5590116, 1.474581, 1, 1, 1, 1, 1,
0.1120818, 0.656503, 0.4160121, 1, 1, 1, 1, 1,
0.114367, -1.114678, 4.643261, 1, 1, 1, 1, 1,
0.1173196, 1.114252, -0.0933668, 1, 1, 1, 1, 1,
0.1223064, 1.835678, -1.083502, 1, 1, 1, 1, 1,
0.1240426, -1.085526, 2.830692, 1, 1, 1, 1, 1,
0.1258988, -0.3208158, 4.11263, 1, 1, 1, 1, 1,
0.1276466, -0.5832915, 4.659688, 1, 1, 1, 1, 1,
0.1279396, -0.1264183, 2.973584, 1, 1, 1, 1, 1,
0.130286, -0.6460308, 2.155859, 1, 1, 1, 1, 1,
0.1308025, -0.8153976, 3.800402, 1, 1, 1, 1, 1,
0.1322693, -0.2126782, 1.594597, 1, 1, 1, 1, 1,
0.1330009, 1.747364, -1.764506, 1, 1, 1, 1, 1,
0.1401547, 0.7785041, -0.3402276, 1, 1, 1, 1, 1,
0.1410204, 0.440769, 0.9085242, 1, 1, 1, 1, 1,
0.1431712, 0.1835022, 0.1997594, 0, 0, 1, 1, 1,
0.1450828, 1.145645, -0.5662889, 1, 0, 0, 1, 1,
0.1584487, -0.8235907, 3.314751, 1, 0, 0, 1, 1,
0.1636163, 2.388497, 0.3334969, 1, 0, 0, 1, 1,
0.1650319, -0.7554203, 2.892025, 1, 0, 0, 1, 1,
0.1655255, -0.3119485, 2.0142, 1, 0, 0, 1, 1,
0.1663641, 1.75954, 0.3325344, 0, 0, 0, 1, 1,
0.1754809, 0.3193034, -0.6699682, 0, 0, 0, 1, 1,
0.1789801, 0.2569532, 0.01800531, 0, 0, 0, 1, 1,
0.1803513, 0.6226285, -1.747168, 0, 0, 0, 1, 1,
0.1826842, 1.353633, -1.351739, 0, 0, 0, 1, 1,
0.1981797, -0.3537804, 3.437258, 0, 0, 0, 1, 1,
0.2002273, 1.266296, 0.1007346, 0, 0, 0, 1, 1,
0.201896, -0.04717663, 1.834503, 1, 1, 1, 1, 1,
0.2102802, -0.1965062, 2.985733, 1, 1, 1, 1, 1,
0.2204814, 1.189136, 1.488027, 1, 1, 1, 1, 1,
0.2216625, 0.8290122, 1.668059, 1, 1, 1, 1, 1,
0.2218778, -0.5496062, 4.769398, 1, 1, 1, 1, 1,
0.2248431, 0.804292, -0.7334138, 1, 1, 1, 1, 1,
0.2291009, -0.4114595, 2.498664, 1, 1, 1, 1, 1,
0.2308623, 0.6007328, 1.97091, 1, 1, 1, 1, 1,
0.2315659, 1.397745, 0.3758702, 1, 1, 1, 1, 1,
0.2350567, 0.6246141, 0.5615363, 1, 1, 1, 1, 1,
0.2389543, -0.5845506, 3.163123, 1, 1, 1, 1, 1,
0.2397309, -1.008657, 6.012092, 1, 1, 1, 1, 1,
0.2425267, -0.7054365, 2.589076, 1, 1, 1, 1, 1,
0.2429707, 1.034993, -0.3007223, 1, 1, 1, 1, 1,
0.2451844, -0.7842301, 2.806087, 1, 1, 1, 1, 1,
0.2504662, -0.9625696, 2.92041, 0, 0, 1, 1, 1,
0.2531781, -0.3855723, 2.361994, 1, 0, 0, 1, 1,
0.2573639, -0.6792268, 1.983354, 1, 0, 0, 1, 1,
0.257871, -0.3763267, 2.460669, 1, 0, 0, 1, 1,
0.2580366, 0.3055794, 0.4292759, 1, 0, 0, 1, 1,
0.262162, 1.322452, 0.08096342, 1, 0, 0, 1, 1,
0.2633471, 1.558959, 2.26692, 0, 0, 0, 1, 1,
0.2645547, -0.772061, 2.764059, 0, 0, 0, 1, 1,
0.2654298, 1.013124, -0.5515989, 0, 0, 0, 1, 1,
0.2658778, -0.284209, 1.748302, 0, 0, 0, 1, 1,
0.2678067, -0.8550713, 2.506127, 0, 0, 0, 1, 1,
0.2681828, -1.470701, 3.739508, 0, 0, 0, 1, 1,
0.2686872, 1.283171, 1.116104, 0, 0, 0, 1, 1,
0.2706008, 0.9266533, 0.9623482, 1, 1, 1, 1, 1,
0.274538, 1.243366, -1.480198, 1, 1, 1, 1, 1,
0.2878502, 1.059964, 1.163408, 1, 1, 1, 1, 1,
0.2886409, -0.3893157, 1.880335, 1, 1, 1, 1, 1,
0.3068188, -0.06352326, 1.954954, 1, 1, 1, 1, 1,
0.3068697, 1.076488, 0.192754, 1, 1, 1, 1, 1,
0.3075082, -1.472167, 4.587983, 1, 1, 1, 1, 1,
0.3089457, 2.91606, 0.07506157, 1, 1, 1, 1, 1,
0.3089632, 1.616782, 2.586977, 1, 1, 1, 1, 1,
0.3115802, 0.07405563, -0.1868118, 1, 1, 1, 1, 1,
0.3129377, 1.72467, 2.160115, 1, 1, 1, 1, 1,
0.3132663, -0.7212631, 1.703749, 1, 1, 1, 1, 1,
0.3165915, 0.4887969, 2.759809, 1, 1, 1, 1, 1,
0.322277, 0.2780011, 1.913127, 1, 1, 1, 1, 1,
0.3234604, 0.8556049, 0.5483084, 1, 1, 1, 1, 1,
0.3278659, 0.4167094, 1.771194, 0, 0, 1, 1, 1,
0.3281036, 0.8969031, -0.7315785, 1, 0, 0, 1, 1,
0.3293403, -1.09299, 0.4601712, 1, 0, 0, 1, 1,
0.3305308, 0.4665876, 0.6524614, 1, 0, 0, 1, 1,
0.3361983, -1.470629, 6.011433, 1, 0, 0, 1, 1,
0.3428297, -2.281363, 4.090093, 1, 0, 0, 1, 1,
0.3554395, 0.6579607, -1.819415, 0, 0, 0, 1, 1,
0.3616055, 0.3510072, 1.413662, 0, 0, 0, 1, 1,
0.3622825, -0.01018103, 2.925572, 0, 0, 0, 1, 1,
0.3677543, -0.5852868, 2.316875, 0, 0, 0, 1, 1,
0.3686748, 1.031492, 0.6857387, 0, 0, 0, 1, 1,
0.3725892, -1.143489, 3.065521, 0, 0, 0, 1, 1,
0.3764259, -0.06050305, 1.863312, 0, 0, 0, 1, 1,
0.3772349, -0.6923735, 0.6946312, 1, 1, 1, 1, 1,
0.3798596, -0.1677912, 1.887141, 1, 1, 1, 1, 1,
0.3805629, 0.2785525, 2.056913, 1, 1, 1, 1, 1,
0.382744, 0.218296, 0.03132471, 1, 1, 1, 1, 1,
0.383512, -0.4505298, 2.541605, 1, 1, 1, 1, 1,
0.3892728, -0.506753, 3.396866, 1, 1, 1, 1, 1,
0.3898574, 1.338363, -0.7368625, 1, 1, 1, 1, 1,
0.3916503, 0.06158646, 1.838336, 1, 1, 1, 1, 1,
0.391694, 1.663331, -0.6014549, 1, 1, 1, 1, 1,
0.3937018, -0.7631338, 3.510696, 1, 1, 1, 1, 1,
0.3957179, -0.7425877, 2.67114, 1, 1, 1, 1, 1,
0.4050034, 0.194554, 0.1323842, 1, 1, 1, 1, 1,
0.4093945, 0.1859359, 0.5417378, 1, 1, 1, 1, 1,
0.4109668, -0.5896639, 2.242111, 1, 1, 1, 1, 1,
0.4177545, -0.5144019, 3.109979, 1, 1, 1, 1, 1,
0.4217166, -1.76077, 2.315174, 0, 0, 1, 1, 1,
0.4227785, 0.4043877, 0.4500266, 1, 0, 0, 1, 1,
0.4238442, -0.4268319, 2.838991, 1, 0, 0, 1, 1,
0.4240129, -0.5865965, 0.04725092, 1, 0, 0, 1, 1,
0.4267532, -0.791292, 2.446666, 1, 0, 0, 1, 1,
0.4335115, 0.4245414, 0.414428, 1, 0, 0, 1, 1,
0.4354436, -1.747825, 3.080707, 0, 0, 0, 1, 1,
0.4357446, -1.181265, 2.890576, 0, 0, 0, 1, 1,
0.4381027, -0.09026736, 2.174016, 0, 0, 0, 1, 1,
0.4423778, -0.691973, 2.677227, 0, 0, 0, 1, 1,
0.4448487, 1.57982, -1.389667, 0, 0, 0, 1, 1,
0.44634, -0.2415081, 2.380357, 0, 0, 0, 1, 1,
0.4465195, -0.4576528, 2.116827, 0, 0, 0, 1, 1,
0.4487169, 1.546148, -0.06034527, 1, 1, 1, 1, 1,
0.4525635, 1.818038, 0.1445608, 1, 1, 1, 1, 1,
0.4531304, -1.068259, 2.421962, 1, 1, 1, 1, 1,
0.4537465, 1.107206, 0.7190413, 1, 1, 1, 1, 1,
0.4575885, -0.8678799, 1.727202, 1, 1, 1, 1, 1,
0.4617513, -1.976039, 2.973576, 1, 1, 1, 1, 1,
0.4628325, -1.557131, 3.218142, 1, 1, 1, 1, 1,
0.4709472, -0.3298705, 1.595604, 1, 1, 1, 1, 1,
0.4725004, 1.011341, 0.8331559, 1, 1, 1, 1, 1,
0.4736473, 1.442872, -0.1720918, 1, 1, 1, 1, 1,
0.4756136, -0.8075801, 3.071456, 1, 1, 1, 1, 1,
0.4762666, 0.3661081, 1.803107, 1, 1, 1, 1, 1,
0.4779737, 1.414551, -0.631357, 1, 1, 1, 1, 1,
0.4804659, 0.908856, 0.2047691, 1, 1, 1, 1, 1,
0.4813204, 0.6989654, -0.6680886, 1, 1, 1, 1, 1,
0.4836073, 1.112448, -1.636946, 0, 0, 1, 1, 1,
0.4862705, 0.5900208, 2.599451, 1, 0, 0, 1, 1,
0.4947805, 1.3474, 0.3317481, 1, 0, 0, 1, 1,
0.4950736, -1.406806, 3.198553, 1, 0, 0, 1, 1,
0.4962916, -1.392345, 4.701798, 1, 0, 0, 1, 1,
0.4972927, -1.584832, 2.531872, 1, 0, 0, 1, 1,
0.500681, 0.8399218, 0.9890375, 0, 0, 0, 1, 1,
0.5020345, -1.368283, 3.071314, 0, 0, 0, 1, 1,
0.5056533, -0.5850502, 3.935957, 0, 0, 0, 1, 1,
0.5086769, 1.826834, 1.066418, 0, 0, 0, 1, 1,
0.5089641, 0.2929981, 0.1436807, 0, 0, 0, 1, 1,
0.5097162, -0.04410115, 2.419036, 0, 0, 0, 1, 1,
0.5107557, 0.4578381, 3.776697, 0, 0, 0, 1, 1,
0.511458, -0.5158609, 2.700041, 1, 1, 1, 1, 1,
0.5122666, 2.001519, 0.463823, 1, 1, 1, 1, 1,
0.5161414, 0.5761263, 0.493926, 1, 1, 1, 1, 1,
0.5173814, 0.2154409, 0.4555577, 1, 1, 1, 1, 1,
0.5184728, 0.6489272, 1.448299, 1, 1, 1, 1, 1,
0.5197961, 0.1271062, 2.394904, 1, 1, 1, 1, 1,
0.5214599, -1.080037, 2.463384, 1, 1, 1, 1, 1,
0.5230273, -1.473859, 2.940837, 1, 1, 1, 1, 1,
0.525135, 0.8365074, 0.9727111, 1, 1, 1, 1, 1,
0.5260919, 0.5325152, 0.777191, 1, 1, 1, 1, 1,
0.5272754, 1.394392, 0.147644, 1, 1, 1, 1, 1,
0.5275662, -1.346663, 4.601649, 1, 1, 1, 1, 1,
0.5289592, -1.115324, 2.799917, 1, 1, 1, 1, 1,
0.5292383, -0.6192543, 2.284658, 1, 1, 1, 1, 1,
0.5307593, -0.7007361, 1.288532, 1, 1, 1, 1, 1,
0.5330666, -2.907116, 0.6258891, 0, 0, 1, 1, 1,
0.5349117, 0.5219793, -0.3458744, 1, 0, 0, 1, 1,
0.5385647, 0.1356172, 1.634514, 1, 0, 0, 1, 1,
0.5496996, 0.3476878, 1.128219, 1, 0, 0, 1, 1,
0.551466, -0.5477108, 2.326476, 1, 0, 0, 1, 1,
0.5559381, 2.305885, -1.373126, 1, 0, 0, 1, 1,
0.5563334, -1.103574, 1.306665, 0, 0, 0, 1, 1,
0.5566198, -0.5004123, 3.571745, 0, 0, 0, 1, 1,
0.5610559, 0.9831502, 0.7973381, 0, 0, 0, 1, 1,
0.5611247, -0.5612706, 3.221214, 0, 0, 0, 1, 1,
0.5629702, -0.006545418, 0.01289735, 0, 0, 0, 1, 1,
0.5663693, -0.4239056, 2.800774, 0, 0, 0, 1, 1,
0.5738401, -0.1907392, 0.7815406, 0, 0, 0, 1, 1,
0.577625, 0.8502331, 0.8210059, 1, 1, 1, 1, 1,
0.585574, 0.4673573, 1.138429, 1, 1, 1, 1, 1,
0.5876469, 1.123036, -0.03426107, 1, 1, 1, 1, 1,
0.5918586, 0.7439682, 1.7507, 1, 1, 1, 1, 1,
0.5943205, -0.3774595, 4.081171, 1, 1, 1, 1, 1,
0.5964499, 1.039618, 0.3000036, 1, 1, 1, 1, 1,
0.6023624, -0.2979382, 1.800106, 1, 1, 1, 1, 1,
0.6081555, -0.6128681, 2.073673, 1, 1, 1, 1, 1,
0.6156533, -0.6837944, 2.91267, 1, 1, 1, 1, 1,
0.6194443, 0.1926676, 0.7272979, 1, 1, 1, 1, 1,
0.6209881, -1.616257, 2.296944, 1, 1, 1, 1, 1,
0.6222193, 0.05758149, 2.307025, 1, 1, 1, 1, 1,
0.6250662, -0.5368715, 1.345794, 1, 1, 1, 1, 1,
0.6252953, -0.8780014, 2.76245, 1, 1, 1, 1, 1,
0.6282975, 0.1953143, 1.157273, 1, 1, 1, 1, 1,
0.6317044, -0.07835807, 1.963756, 0, 0, 1, 1, 1,
0.6319459, -0.4172588, 2.703264, 1, 0, 0, 1, 1,
0.632125, 1.202002, 0.9935564, 1, 0, 0, 1, 1,
0.63352, -1.158307, 1.887711, 1, 0, 0, 1, 1,
0.6337961, 1.859203, 0.2298823, 1, 0, 0, 1, 1,
0.6376618, -1.694152, 0.2980084, 1, 0, 0, 1, 1,
0.6406686, 0.6914678, 1.539437, 0, 0, 0, 1, 1,
0.6415934, 0.7101806, -0.02641245, 0, 0, 0, 1, 1,
0.6440758, -0.09734874, 2.706627, 0, 0, 0, 1, 1,
0.6470156, 0.8970619, -0.7011885, 0, 0, 0, 1, 1,
0.6496792, 0.7978297, -0.05524905, 0, 0, 0, 1, 1,
0.6620326, -1.377288, 1.855915, 0, 0, 0, 1, 1,
0.6657312, -0.6639595, 3.238187, 0, 0, 0, 1, 1,
0.6666211, -0.7819665, 1.203382, 1, 1, 1, 1, 1,
0.6679341, -0.860131, 3.471573, 1, 1, 1, 1, 1,
0.6739026, -0.7278062, 1.0338, 1, 1, 1, 1, 1,
0.6789127, 1.584379, 0.07051172, 1, 1, 1, 1, 1,
0.6809767, -0.3826796, 0.3286203, 1, 1, 1, 1, 1,
0.6887802, 0.8014898, -0.005834662, 1, 1, 1, 1, 1,
0.6933897, -1.772026, 4.994818, 1, 1, 1, 1, 1,
0.7010846, -0.8275892, 3.391319, 1, 1, 1, 1, 1,
0.7031487, -1.893954, 2.682466, 1, 1, 1, 1, 1,
0.7032357, 0.01717406, 0.40674, 1, 1, 1, 1, 1,
0.7061293, -1.159386, 2.8449, 1, 1, 1, 1, 1,
0.708132, 0.05189777, 0.8343221, 1, 1, 1, 1, 1,
0.72049, -0.7631039, 1.443515, 1, 1, 1, 1, 1,
0.7225329, -0.8178488, 2.399377, 1, 1, 1, 1, 1,
0.7228211, -0.4302612, 2.69189, 1, 1, 1, 1, 1,
0.7253978, 1.090466, -0.7925818, 0, 0, 1, 1, 1,
0.7276416, 1.071939, 0.07547089, 1, 0, 0, 1, 1,
0.7296904, -0.01490386, 3.727585, 1, 0, 0, 1, 1,
0.742624, -0.5508605, 1.766603, 1, 0, 0, 1, 1,
0.7432595, 0.3816483, 1.772628, 1, 0, 0, 1, 1,
0.7454305, -0.6856091, 2.160082, 1, 0, 0, 1, 1,
0.7466032, -0.8483589, 3.248966, 0, 0, 0, 1, 1,
0.7480905, 0.7686766, 3.391284, 0, 0, 0, 1, 1,
0.7495569, 1.240871, 1.56608, 0, 0, 0, 1, 1,
0.7501751, -1.596645, 3.216236, 0, 0, 0, 1, 1,
0.7537391, -1.386275, 1.78077, 0, 0, 0, 1, 1,
0.7578125, -0.8698659, 2.155855, 0, 0, 0, 1, 1,
0.7593558, -0.7950611, 3.186207, 0, 0, 0, 1, 1,
0.7623487, 1.257078, 1.160017, 1, 1, 1, 1, 1,
0.7625989, 0.03709122, -0.1917527, 1, 1, 1, 1, 1,
0.7643492, 0.8554739, 1.48627, 1, 1, 1, 1, 1,
0.7650424, -0.1004073, 0.4973409, 1, 1, 1, 1, 1,
0.7658387, -1.888414, 3.242302, 1, 1, 1, 1, 1,
0.7694533, -1.134381, 3.264751, 1, 1, 1, 1, 1,
0.7757932, -0.3654377, 2.096937, 1, 1, 1, 1, 1,
0.7759449, 0.4924899, 1.119387, 1, 1, 1, 1, 1,
0.7761117, -1.437668, 1.899669, 1, 1, 1, 1, 1,
0.78509, 0.9686862, 0.7926523, 1, 1, 1, 1, 1,
0.7872153, 0.191691, 1.34677, 1, 1, 1, 1, 1,
0.7906891, -1.006377, 3.015485, 1, 1, 1, 1, 1,
0.79224, 1.001963, 2.294784, 1, 1, 1, 1, 1,
0.7934705, 0.548148, 1.45877, 1, 1, 1, 1, 1,
0.7941372, -0.5444348, 1.821434, 1, 1, 1, 1, 1,
0.7945422, -0.3384567, 1.64896, 0, 0, 1, 1, 1,
0.8011377, -1.59643, 1.896564, 1, 0, 0, 1, 1,
0.801993, -0.6060001, 1.668708, 1, 0, 0, 1, 1,
0.805024, -0.6680227, 1.266122, 1, 0, 0, 1, 1,
0.8161858, 0.5013254, 1.590363, 1, 0, 0, 1, 1,
0.821248, 0.6465424, 0.777067, 1, 0, 0, 1, 1,
0.8322641, 0.4739994, 0.8719753, 0, 0, 0, 1, 1,
0.8383054, -1.04044, 1.8577, 0, 0, 0, 1, 1,
0.8425155, -0.4590772, 2.694535, 0, 0, 0, 1, 1,
0.8504638, -1.009039, 0.7460346, 0, 0, 0, 1, 1,
0.8523444, 0.1017132, 1.113282, 0, 0, 0, 1, 1,
0.8622099, 0.7560169, 1.02828, 0, 0, 0, 1, 1,
0.8695007, -0.9364789, 3.080624, 0, 0, 0, 1, 1,
0.875177, 1.02447, 0.9152814, 1, 1, 1, 1, 1,
0.8821151, -0.2932191, 3.099413, 1, 1, 1, 1, 1,
0.8827205, -1.270626, 3.57982, 1, 1, 1, 1, 1,
0.8900476, -0.1770488, 1.903404, 1, 1, 1, 1, 1,
0.8954951, -1.179535, 2.303136, 1, 1, 1, 1, 1,
0.896574, -0.2445035, 1.108503, 1, 1, 1, 1, 1,
0.8987358, -0.9228522, 1.924918, 1, 1, 1, 1, 1,
0.9014003, 0.2249177, 0.9290947, 1, 1, 1, 1, 1,
0.9016547, -1.158413, 3.043803, 1, 1, 1, 1, 1,
0.9018647, 0.505127, 0.8711577, 1, 1, 1, 1, 1,
0.9035558, 0.6877583, 0.05401043, 1, 1, 1, 1, 1,
0.904582, -0.7301449, 0.8854568, 1, 1, 1, 1, 1,
0.908433, 1.102051, -1.587336, 1, 1, 1, 1, 1,
0.9119946, 0.3258851, -0.3212692, 1, 1, 1, 1, 1,
0.9132895, 0.6542444, -0.6393926, 1, 1, 1, 1, 1,
0.9147734, -1.478012, 2.89813, 0, 0, 1, 1, 1,
0.9155824, -0.9699174, 1.9365, 1, 0, 0, 1, 1,
0.9187167, -0.1892157, 0.06759749, 1, 0, 0, 1, 1,
0.9191778, 0.3353789, 0.2931494, 1, 0, 0, 1, 1,
0.9193321, -0.678508, 1.911001, 1, 0, 0, 1, 1,
0.9283779, 1.659642, 0.2155796, 1, 0, 0, 1, 1,
0.928856, -0.9305458, 1.090281, 0, 0, 0, 1, 1,
0.9300419, 0.411469, 0.7487345, 0, 0, 0, 1, 1,
0.9373587, 0.4923679, 2.945917, 0, 0, 0, 1, 1,
0.9429184, 0.7171127, 1.202924, 0, 0, 0, 1, 1,
0.944887, 0.3068334, 3.790891, 0, 0, 0, 1, 1,
0.9457684, -0.1380336, 0.3436601, 0, 0, 0, 1, 1,
0.9532718, 1.057326, 1.557751, 0, 0, 0, 1, 1,
0.954635, -0.8134321, 1.911479, 1, 1, 1, 1, 1,
0.9555368, 1.044985, -0.4953664, 1, 1, 1, 1, 1,
0.9588425, 1.205436, 1.652935, 1, 1, 1, 1, 1,
0.960789, -0.2531135, 1.345192, 1, 1, 1, 1, 1,
0.9635467, -0.8574939, 1.679784, 1, 1, 1, 1, 1,
0.9688311, -1.42953, 0.7608411, 1, 1, 1, 1, 1,
0.9699445, 0.7608707, 1.043741, 1, 1, 1, 1, 1,
0.9731539, 2.902593, 0.05362589, 1, 1, 1, 1, 1,
0.9754797, 0.04649187, 1.875657, 1, 1, 1, 1, 1,
0.9804147, 0.3883859, -0.1487069, 1, 1, 1, 1, 1,
0.9824665, -0.5865216, 1.721698, 1, 1, 1, 1, 1,
0.9879656, -0.4031393, 3.805606, 1, 1, 1, 1, 1,
0.9941155, -0.9111636, 2.228818, 1, 1, 1, 1, 1,
0.9983082, -0.4657321, 2.212296, 1, 1, 1, 1, 1,
0.9991241, 1.074022, 1.160802, 1, 1, 1, 1, 1,
1.004145, 0.9589125, 1.964352, 0, 0, 1, 1, 1,
1.011871, 1.142094, -0.3864762, 1, 0, 0, 1, 1,
1.014646, -1.593963, 3.265455, 1, 0, 0, 1, 1,
1.01892, -1.582136, 1.989614, 1, 0, 0, 1, 1,
1.023145, 0.1003058, 2.441151, 1, 0, 0, 1, 1,
1.023864, 0.6030599, -0.173884, 1, 0, 0, 1, 1,
1.024658, 0.06905495, -0.4870139, 0, 0, 0, 1, 1,
1.029432, 0.258785, 1.349557, 0, 0, 0, 1, 1,
1.032802, 1.119859, 1.031141, 0, 0, 0, 1, 1,
1.034849, 0.8894482, 0.4209853, 0, 0, 0, 1, 1,
1.035304, -0.07981133, 0.5807109, 0, 0, 0, 1, 1,
1.040855, -0.898164, 3.218937, 0, 0, 0, 1, 1,
1.045135, -1.528353, 3.109827, 0, 0, 0, 1, 1,
1.05241, -0.918143, 1.110009, 1, 1, 1, 1, 1,
1.05795, -1.984484, 3.854662, 1, 1, 1, 1, 1,
1.059191, 0.1145707, 1.123158, 1, 1, 1, 1, 1,
1.062279, -0.3984496, 2.829579, 1, 1, 1, 1, 1,
1.062668, -2.634022, 4.16021, 1, 1, 1, 1, 1,
1.064373, 1.491423, 0.4710973, 1, 1, 1, 1, 1,
1.067969, 2.076472, 0.7686142, 1, 1, 1, 1, 1,
1.077402, -0.5055051, 2.889255, 1, 1, 1, 1, 1,
1.085805, 1.112001, 1.980699, 1, 1, 1, 1, 1,
1.092445, -0.7992842, 1.254237, 1, 1, 1, 1, 1,
1.097647, -0.4434465, 2.235655, 1, 1, 1, 1, 1,
1.098103, -1.104918, 2.294368, 1, 1, 1, 1, 1,
1.102404, 1.019672, 1.391478, 1, 1, 1, 1, 1,
1.109311, -0.7358962, 1.779398, 1, 1, 1, 1, 1,
1.110426, -0.4028408, 2.239317, 1, 1, 1, 1, 1,
1.112372, 0.5426042, 0.6491383, 0, 0, 1, 1, 1,
1.113518, 1.069045, -0.2112149, 1, 0, 0, 1, 1,
1.116036, 1.14439, 1.520313, 1, 0, 0, 1, 1,
1.119715, 2.227016, 0.8838813, 1, 0, 0, 1, 1,
1.126045, 1.576079, 1.766665, 1, 0, 0, 1, 1,
1.132685, -1.057741, 2.322671, 1, 0, 0, 1, 1,
1.138048, -0.4146709, -0.1279016, 0, 0, 0, 1, 1,
1.139344, -0.4957284, 2.305097, 0, 0, 0, 1, 1,
1.144933, 1.645938, 0.564911, 0, 0, 0, 1, 1,
1.148714, -1.437019, 1.903773, 0, 0, 0, 1, 1,
1.157437, -2.030646, 3.118985, 0, 0, 0, 1, 1,
1.166298, -0.9843127, 1.065718, 0, 0, 0, 1, 1,
1.169985, -0.4329142, 1.688881, 0, 0, 0, 1, 1,
1.174888, 0.1781259, 2.04478, 1, 1, 1, 1, 1,
1.180886, 0.3270019, 0.1894407, 1, 1, 1, 1, 1,
1.18166, -0.9237632, 1.809051, 1, 1, 1, 1, 1,
1.183606, 0.9587221, 0.2535448, 1, 1, 1, 1, 1,
1.191497, 1.10101, 1.096225, 1, 1, 1, 1, 1,
1.193425, 0.3232935, 1.181492, 1, 1, 1, 1, 1,
1.198761, -0.3261578, 1.265261, 1, 1, 1, 1, 1,
1.199563, 0.3719735, 0.5028788, 1, 1, 1, 1, 1,
1.210515, -0.2917889, 1.412617, 1, 1, 1, 1, 1,
1.215805, -1.021289, 1.225682, 1, 1, 1, 1, 1,
1.217336, 1.303912, 1.635331, 1, 1, 1, 1, 1,
1.21826, 0.531139, 0.3069112, 1, 1, 1, 1, 1,
1.228346, 0.2939669, 0.04534687, 1, 1, 1, 1, 1,
1.228875, -0.02269435, 1.883435, 1, 1, 1, 1, 1,
1.240331, 0.8297604, 1.698694, 1, 1, 1, 1, 1,
1.240347, 0.127519, 1.689401, 0, 0, 1, 1, 1,
1.259407, 0.9724336, 1.766807, 1, 0, 0, 1, 1,
1.260787, -1.251871, 1.661231, 1, 0, 0, 1, 1,
1.264197, 1.67879, 0.8327702, 1, 0, 0, 1, 1,
1.265616, 0.0204509, 1.357022, 1, 0, 0, 1, 1,
1.271215, -0.8225565, 2.088204, 1, 0, 0, 1, 1,
1.271708, 0.5973424, 2.191684, 0, 0, 0, 1, 1,
1.274108, 0.009921229, 1.676871, 0, 0, 0, 1, 1,
1.284197, 1.622326, 1.507796, 0, 0, 0, 1, 1,
1.285764, -0.9964509, 1.495847, 0, 0, 0, 1, 1,
1.291421, -0.5332544, 1.692206, 0, 0, 0, 1, 1,
1.304185, 1.250734, 0.982391, 0, 0, 0, 1, 1,
1.319067, 0.2581946, -1.388686, 0, 0, 0, 1, 1,
1.333235, 1.329658, 0.5377384, 1, 1, 1, 1, 1,
1.334164, 0.06025212, 1.100571, 1, 1, 1, 1, 1,
1.359769, -2.25036, 4.499334, 1, 1, 1, 1, 1,
1.360837, 2.6075, 0.5618576, 1, 1, 1, 1, 1,
1.36955, 1.444287, 0.6608294, 1, 1, 1, 1, 1,
1.369894, 1.28754, 1.482056, 1, 1, 1, 1, 1,
1.377487, -0.3833593, 2.017471, 1, 1, 1, 1, 1,
1.384873, -0.4817832, 1.546091, 1, 1, 1, 1, 1,
1.385045, 0.1151741, 1.047437, 1, 1, 1, 1, 1,
1.388412, -0.1879827, 1.2452, 1, 1, 1, 1, 1,
1.392198, -0.1409841, 0.8184164, 1, 1, 1, 1, 1,
1.4126, 0.04099084, -0.2371465, 1, 1, 1, 1, 1,
1.423021, 0.256319, 2.577829, 1, 1, 1, 1, 1,
1.432463, -0.4948162, 4.422276, 1, 1, 1, 1, 1,
1.439059, 0.6719363, 1.305825, 1, 1, 1, 1, 1,
1.441447, -0.1420766, 1.313536, 0, 0, 1, 1, 1,
1.450941, 1.640764, 0.8062242, 1, 0, 0, 1, 1,
1.456345, -1.789915, 2.586036, 1, 0, 0, 1, 1,
1.466583, -0.5197185, 1.038277, 1, 0, 0, 1, 1,
1.477284, -0.2639788, 1.702715, 1, 0, 0, 1, 1,
1.485113, -0.870669, 4.641652, 1, 0, 0, 1, 1,
1.497564, 0.8397973, 0.7336625, 0, 0, 0, 1, 1,
1.517966, -0.3031428, 2.359187, 0, 0, 0, 1, 1,
1.52432, -0.9143147, 2.320304, 0, 0, 0, 1, 1,
1.55191, -1.641453, 2.560122, 0, 0, 0, 1, 1,
1.561582, -0.599515, 0.1487108, 0, 0, 0, 1, 1,
1.56888, -0.4623244, 3.036641, 0, 0, 0, 1, 1,
1.573153, 1.547015, 1.08271, 0, 0, 0, 1, 1,
1.595059, -0.2599736, 0.9738085, 1, 1, 1, 1, 1,
1.621807, 1.097972, -0.3538802, 1, 1, 1, 1, 1,
1.625677, 0.6798007, -0.2295254, 1, 1, 1, 1, 1,
1.634715, -0.5950041, 1.813244, 1, 1, 1, 1, 1,
1.63557, 2.026194, 1.592734, 1, 1, 1, 1, 1,
1.64004, -0.7632712, 2.47992, 1, 1, 1, 1, 1,
1.648234, 0.6927581, 2.546482, 1, 1, 1, 1, 1,
1.670342, 0.03431617, 2.946082, 1, 1, 1, 1, 1,
1.670535, -0.4758773, 2.441999, 1, 1, 1, 1, 1,
1.698628, 0.3475688, 1.228967, 1, 1, 1, 1, 1,
1.7088, -1.51835, 2.626338, 1, 1, 1, 1, 1,
1.715209, 0.3210918, 0.4989699, 1, 1, 1, 1, 1,
1.716324, -1.980776, 3.152414, 1, 1, 1, 1, 1,
1.745627, -0.1488144, 0.8317926, 1, 1, 1, 1, 1,
1.753148, 1.231392, 1.138046, 1, 1, 1, 1, 1,
1.755843, -0.3278733, 2.35294, 0, 0, 1, 1, 1,
1.764133, 0.4571541, 1.091557, 1, 0, 0, 1, 1,
1.773122, 1.641321, 0.9981456, 1, 0, 0, 1, 1,
1.774245, 0.04161187, 4.531369, 1, 0, 0, 1, 1,
1.78676, 0.4137819, 1.360034, 1, 0, 0, 1, 1,
1.793763, 0.4107362, 0.1335631, 1, 0, 0, 1, 1,
1.834922, 0.2484866, 2.187886, 0, 0, 0, 1, 1,
1.838446, -0.5683355, 0.4665161, 0, 0, 0, 1, 1,
1.900077, 0.767742, 0.4333459, 0, 0, 0, 1, 1,
1.926906, -1.669162, 0.1069599, 0, 0, 0, 1, 1,
1.932786, 0.1817966, 1.40118, 0, 0, 0, 1, 1,
1.950063, -1.601448, 2.839607, 0, 0, 0, 1, 1,
1.962843, -0.3054762, 1.232435, 0, 0, 0, 1, 1,
1.983861, -0.1951076, 1.062315, 1, 1, 1, 1, 1,
2.002097, 0.07016885, 1.401576, 1, 1, 1, 1, 1,
2.010388, -1.456498, 2.377853, 1, 1, 1, 1, 1,
2.024349, 0.6805013, 1.128295, 1, 1, 1, 1, 1,
2.025084, 0.4991659, 1.763271, 1, 1, 1, 1, 1,
2.036768, 0.292276, 1.503287, 1, 1, 1, 1, 1,
2.039914, -0.1487958, 3.706257, 1, 1, 1, 1, 1,
2.070394, -0.1935837, 0.1361101, 1, 1, 1, 1, 1,
2.072255, -0.5402442, 1.579123, 1, 1, 1, 1, 1,
2.161216, -1.209636, 1.080362, 1, 1, 1, 1, 1,
2.175595, 0.2066369, 1.384614, 1, 1, 1, 1, 1,
2.208443, 0.1387626, 1.410997, 1, 1, 1, 1, 1,
2.236887, 0.6263466, 1.993446, 1, 1, 1, 1, 1,
2.302992, -0.3886192, 2.086737, 1, 1, 1, 1, 1,
2.33688, 0.376498, 0.7594461, 1, 1, 1, 1, 1,
2.34812, -0.7257506, -0.2866367, 0, 0, 1, 1, 1,
2.364582, 0.3143121, 0.2288966, 1, 0, 0, 1, 1,
2.373934, -0.9822812, 1.33765, 1, 0, 0, 1, 1,
2.472897, -1.0697, 2.202839, 1, 0, 0, 1, 1,
2.474486, -1.15591, 3.135488, 1, 0, 0, 1, 1,
2.516075, 1.682184, -0.1207385, 1, 0, 0, 1, 1,
2.520257, 0.9586858, -0.8907628, 0, 0, 0, 1, 1,
2.535215, 1.506685, 0.5469646, 0, 0, 0, 1, 1,
2.584203, 1.966893, 1.926376, 0, 0, 0, 1, 1,
2.592305, -1.48614, 1.981527, 0, 0, 0, 1, 1,
2.674536, 0.8672983, 0.07850173, 0, 0, 0, 1, 1,
2.692664, 0.4040798, 0.6120746, 0, 0, 0, 1, 1,
2.759628, 0.2990098, 0.3315824, 0, 0, 0, 1, 1,
2.794517, -0.01117034, 3.155215, 1, 1, 1, 1, 1,
2.855577, -1.25608, 3.121605, 1, 1, 1, 1, 1,
2.874967, -0.970042, 1.015511, 1, 1, 1, 1, 1,
2.881263, 1.346288, 0.7547396, 1, 1, 1, 1, 1,
2.998247, 0.6402149, -0.9919945, 1, 1, 1, 1, 1,
3.340301, -0.1792193, 0.7842085, 1, 1, 1, 1, 1,
3.507477, -1.331322, 2.499007, 1, 1, 1, 1, 1
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
var radius = 9.749606;
var distance = 34.24508;
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
mvMatrix.translate( -0.2206004, -0.004472136, -0.3128474 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.24508);
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
