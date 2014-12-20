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
-3.603559, 0.6469641, -0.6701284, 1, 0, 0, 1,
-3.552959, 1.119442, -3.013298, 1, 0.007843138, 0, 1,
-3.299893, 0.8184224, -0.9194854, 1, 0.01176471, 0, 1,
-3.254331, -0.3160241, -1.07562, 1, 0.01960784, 0, 1,
-3.063995, -0.1655699, -0.1804002, 1, 0.02352941, 0, 1,
-2.78814, -0.8681644, -1.464103, 1, 0.03137255, 0, 1,
-2.702271, 0.61905, -1.540449, 1, 0.03529412, 0, 1,
-2.544101, 1.490367, 0.9480067, 1, 0.04313726, 0, 1,
-2.520811, -0.7275428, -1.963501, 1, 0.04705882, 0, 1,
-2.504078, -0.9543527, -1.901158, 1, 0.05490196, 0, 1,
-2.443662, -1.927562, -1.952984, 1, 0.05882353, 0, 1,
-2.440023, -1.115249, -3.181196, 1, 0.06666667, 0, 1,
-2.352053, 0.02556559, -1.739824, 1, 0.07058824, 0, 1,
-2.307426, 1.120607, -0.3151395, 1, 0.07843138, 0, 1,
-2.302054, 0.7442145, -0.5692068, 1, 0.08235294, 0, 1,
-2.192816, -0.182373, -0.3740973, 1, 0.09019608, 0, 1,
-2.178804, -0.437186, 0.04672098, 1, 0.09411765, 0, 1,
-2.158754, -1.158189, -3.256005, 1, 0.1019608, 0, 1,
-2.151705, -0.8143768, -0.6480241, 1, 0.1098039, 0, 1,
-2.146129, -1.759679, -2.472987, 1, 0.1137255, 0, 1,
-2.132511, 0.4416843, -2.103009, 1, 0.1215686, 0, 1,
-2.127914, -1.49154, -0.9465097, 1, 0.1254902, 0, 1,
-2.119071, -0.2238221, -0.6790254, 1, 0.1333333, 0, 1,
-2.112313, 0.1750215, -1.513817, 1, 0.1372549, 0, 1,
-2.03703, 0.7938609, -0.655144, 1, 0.145098, 0, 1,
-2.027032, 0.2108348, -1.681263, 1, 0.1490196, 0, 1,
-2.014407, 2.279804, -0.5241994, 1, 0.1568628, 0, 1,
-2.004443, -1.524598, -3.109565, 1, 0.1607843, 0, 1,
-1.967392, 0.1832847, -1.169493, 1, 0.1686275, 0, 1,
-1.941229, -0.3891828, -1.997503, 1, 0.172549, 0, 1,
-1.923818, 0.319992, -2.121417, 1, 0.1803922, 0, 1,
-1.879105, 0.3953485, -1.618369, 1, 0.1843137, 0, 1,
-1.875093, -2.099099, -2.139936, 1, 0.1921569, 0, 1,
-1.852653, 1.244421, -1.570472, 1, 0.1960784, 0, 1,
-1.844046, 0.9832137, -3.247324, 1, 0.2039216, 0, 1,
-1.839657, -0.9644973, -2.14912, 1, 0.2117647, 0, 1,
-1.822345, 1.472711, -0.1799605, 1, 0.2156863, 0, 1,
-1.818618, -0.580185, -3.229194, 1, 0.2235294, 0, 1,
-1.788517, 0.6252779, -1.188234, 1, 0.227451, 0, 1,
-1.787788, -0.1094838, -0.3710731, 1, 0.2352941, 0, 1,
-1.78584, 0.0368251, -1.012161, 1, 0.2392157, 0, 1,
-1.7807, 0.0932123, -1.7121, 1, 0.2470588, 0, 1,
-1.779477, -0.7390171, -2.974074, 1, 0.2509804, 0, 1,
-1.776324, -1.759992, -1.886848, 1, 0.2588235, 0, 1,
-1.768708, 0.8090464, -1.005349, 1, 0.2627451, 0, 1,
-1.764686, 1.904616, -1.862384, 1, 0.2705882, 0, 1,
-1.760512, 0.4268559, -2.956116, 1, 0.2745098, 0, 1,
-1.725689, 0.3848046, -2.014349, 1, 0.282353, 0, 1,
-1.722392, 0.1353575, -2.856941, 1, 0.2862745, 0, 1,
-1.718805, -0.07295763, -1.365728, 1, 0.2941177, 0, 1,
-1.717304, 0.0686, -2.173393, 1, 0.3019608, 0, 1,
-1.716756, -0.1535824, -1.477674, 1, 0.3058824, 0, 1,
-1.715656, 0.7565603, -0.9814171, 1, 0.3137255, 0, 1,
-1.694631, -0.09078637, -2.315324, 1, 0.3176471, 0, 1,
-1.691392, -0.6148879, -4.140425, 1, 0.3254902, 0, 1,
-1.689326, -0.6249108, -3.256468, 1, 0.3294118, 0, 1,
-1.67335, 2.289542, 0.9554403, 1, 0.3372549, 0, 1,
-1.651056, 0.1550485, -3.342458, 1, 0.3411765, 0, 1,
-1.647258, -0.6461755, -1.488961, 1, 0.3490196, 0, 1,
-1.633403, -1.119292, -3.647034, 1, 0.3529412, 0, 1,
-1.627286, -1.246725, -1.771598, 1, 0.3607843, 0, 1,
-1.623282, 0.2342949, -1.207638, 1, 0.3647059, 0, 1,
-1.621808, -0.9212639, -3.916334, 1, 0.372549, 0, 1,
-1.618979, 1.82447, -0.1972813, 1, 0.3764706, 0, 1,
-1.613895, 0.5829843, -1.324218, 1, 0.3843137, 0, 1,
-1.601851, -0.8122713, -3.699973, 1, 0.3882353, 0, 1,
-1.599769, 0.1482466, -1.033132, 1, 0.3960784, 0, 1,
-1.595238, 0.6147584, -0.1829445, 1, 0.4039216, 0, 1,
-1.58783, 0.9920269, -2.027169, 1, 0.4078431, 0, 1,
-1.582996, 0.1119803, -0.7902341, 1, 0.4156863, 0, 1,
-1.577696, -0.3866376, -2.477187, 1, 0.4196078, 0, 1,
-1.56786, 0.2029269, 0.2673228, 1, 0.427451, 0, 1,
-1.555378, 0.2337351, -1.174336, 1, 0.4313726, 0, 1,
-1.545779, -1.048177, -0.4686998, 1, 0.4392157, 0, 1,
-1.540007, 0.06369501, -1.668752, 1, 0.4431373, 0, 1,
-1.534167, -0.4562625, -3.310327, 1, 0.4509804, 0, 1,
-1.530283, -0.2675015, -1.920793, 1, 0.454902, 0, 1,
-1.515596, -0.5324623, -1.599877, 1, 0.4627451, 0, 1,
-1.503199, 0.4074063, -0.7871598, 1, 0.4666667, 0, 1,
-1.492748, -0.3050019, -2.855074, 1, 0.4745098, 0, 1,
-1.484523, 0.3659733, -1.195547, 1, 0.4784314, 0, 1,
-1.477794, 0.6931537, -1.758154, 1, 0.4862745, 0, 1,
-1.475562, 1.113532, -1.250007, 1, 0.4901961, 0, 1,
-1.471764, -0.9976273, -1.370687, 1, 0.4980392, 0, 1,
-1.464097, 1.302519, -0.03458202, 1, 0.5058824, 0, 1,
-1.463133, 0.5318822, -3.006935, 1, 0.509804, 0, 1,
-1.455213, 0.2500069, -1.787484, 1, 0.5176471, 0, 1,
-1.454358, -0.8715437, -1.660288, 1, 0.5215687, 0, 1,
-1.446245, 1.066059, -0.9888858, 1, 0.5294118, 0, 1,
-1.4416, 0.1532173, 0.4347112, 1, 0.5333334, 0, 1,
-1.440162, 1.444024, -1.40916, 1, 0.5411765, 0, 1,
-1.426423, 1.896694, -1.463866, 1, 0.5450981, 0, 1,
-1.419843, 0.377852, -0.5834846, 1, 0.5529412, 0, 1,
-1.413643, 0.1780523, -2.644099, 1, 0.5568628, 0, 1,
-1.410657, -1.246412, -1.964788, 1, 0.5647059, 0, 1,
-1.397931, 0.9158645, -2.664345, 1, 0.5686275, 0, 1,
-1.396891, -0.0009253731, -1.391042, 1, 0.5764706, 0, 1,
-1.396432, -0.1151434, -2.856688, 1, 0.5803922, 0, 1,
-1.393928, 1.595176, -0.777633, 1, 0.5882353, 0, 1,
-1.391367, 0.1855507, -0.324996, 1, 0.5921569, 0, 1,
-1.38039, -1.013836, -3.440229, 1, 0.6, 0, 1,
-1.344988, 0.2754903, -1.374479, 1, 0.6078432, 0, 1,
-1.342411, 0.552732, -1.17473, 1, 0.6117647, 0, 1,
-1.338479, 0.2295762, 1.556185, 1, 0.6196079, 0, 1,
-1.334317, 0.5959073, -1.138409, 1, 0.6235294, 0, 1,
-1.329459, 1.623521, 1.631291, 1, 0.6313726, 0, 1,
-1.324508, -0.7327473, -1.120827, 1, 0.6352941, 0, 1,
-1.321076, -0.9358072, -1.878053, 1, 0.6431373, 0, 1,
-1.309033, 0.3179837, -1.377741, 1, 0.6470588, 0, 1,
-1.304244, -0.4246562, -0.8944398, 1, 0.654902, 0, 1,
-1.30207, -1.588204, -2.653945, 1, 0.6588235, 0, 1,
-1.300288, 0.1637229, -1.422274, 1, 0.6666667, 0, 1,
-1.2996, -1.593975, -1.211528, 1, 0.6705883, 0, 1,
-1.298247, -0.4333141, -2.731557, 1, 0.6784314, 0, 1,
-1.296277, -2.622004, -1.277734, 1, 0.682353, 0, 1,
-1.295245, -0.1943024, -2.150682, 1, 0.6901961, 0, 1,
-1.292062, 0.7750462, -1.113441, 1, 0.6941177, 0, 1,
-1.286764, 1.290822, -1.617308, 1, 0.7019608, 0, 1,
-1.278355, -0.9823061, -3.93291, 1, 0.7098039, 0, 1,
-1.276953, -1.722892, -2.510557, 1, 0.7137255, 0, 1,
-1.274873, 0.2091959, -0.01642438, 1, 0.7215686, 0, 1,
-1.252967, 0.3025548, -0.3238664, 1, 0.7254902, 0, 1,
-1.250318, -0.8264183, -2.180988, 1, 0.7333333, 0, 1,
-1.248735, 0.9189705, -2.230485, 1, 0.7372549, 0, 1,
-1.245615, -1.490526, -3.215381, 1, 0.7450981, 0, 1,
-1.23846, -1.462456, -1.665886, 1, 0.7490196, 0, 1,
-1.238413, 0.07442982, -2.809623, 1, 0.7568628, 0, 1,
-1.236418, -0.07094271, -2.116947, 1, 0.7607843, 0, 1,
-1.229183, 1.092098, 0.1525027, 1, 0.7686275, 0, 1,
-1.226937, 1.162826, -0.4866771, 1, 0.772549, 0, 1,
-1.223564, 0.8396637, -1.912848, 1, 0.7803922, 0, 1,
-1.222977, -1.417871, -1.034923, 1, 0.7843137, 0, 1,
-1.218485, -1.147949, -1.16378, 1, 0.7921569, 0, 1,
-1.196214, -0.1991883, -0.1596574, 1, 0.7960784, 0, 1,
-1.19102, 1.578505, -1.097191, 1, 0.8039216, 0, 1,
-1.188172, 1.271032, -0.7503347, 1, 0.8117647, 0, 1,
-1.187252, 1.539837, 0.3083349, 1, 0.8156863, 0, 1,
-1.185505, 1.483587, -0.8538079, 1, 0.8235294, 0, 1,
-1.184906, -0.6952259, -2.705726, 1, 0.827451, 0, 1,
-1.182785, 2.665977, -2.088552, 1, 0.8352941, 0, 1,
-1.166813, 0.8124051, -1.781684, 1, 0.8392157, 0, 1,
-1.164477, 2.866725, -0.6741676, 1, 0.8470588, 0, 1,
-1.157528, -0.4293396, -2.507021, 1, 0.8509804, 0, 1,
-1.156335, 1.182189, -0.1270523, 1, 0.8588235, 0, 1,
-1.15582, 0.7131374, 1.356887, 1, 0.8627451, 0, 1,
-1.155074, -0.1462724, -2.56168, 1, 0.8705882, 0, 1,
-1.154163, -0.3035068, -3.067068, 1, 0.8745098, 0, 1,
-1.151489, 0.1087464, -2.313679, 1, 0.8823529, 0, 1,
-1.150076, -0.4243557, -0.5547224, 1, 0.8862745, 0, 1,
-1.140161, 1.277241, -1.37459, 1, 0.8941177, 0, 1,
-1.135898, -0.8153552, 0.1939227, 1, 0.8980392, 0, 1,
-1.135436, 1.393022, -1.890445, 1, 0.9058824, 0, 1,
-1.127429, 0.6885061, -0.6460956, 1, 0.9137255, 0, 1,
-1.123099, 1.031497, -1.14251, 1, 0.9176471, 0, 1,
-1.114442, -0.5916032, -2.907014, 1, 0.9254902, 0, 1,
-1.109737, 0.9632621, -1.788104, 1, 0.9294118, 0, 1,
-1.107513, -0.5389368, -2.765979, 1, 0.9372549, 0, 1,
-1.096311, -0.7647771, -3.732516, 1, 0.9411765, 0, 1,
-1.0956, -0.2446194, -1.169168, 1, 0.9490196, 0, 1,
-1.085957, -0.4669847, 1.37697, 1, 0.9529412, 0, 1,
-1.08356, -1.303414, -2.828018, 1, 0.9607843, 0, 1,
-1.076162, -0.4001259, -2.405421, 1, 0.9647059, 0, 1,
-1.071001, 0.9088045, -0.4406033, 1, 0.972549, 0, 1,
-1.0632, -1.573538, -3.677178, 1, 0.9764706, 0, 1,
-1.045155, -1.107989, -1.657016, 1, 0.9843137, 0, 1,
-1.036981, -0.2818046, -2.30961, 1, 0.9882353, 0, 1,
-1.034964, -0.7931233, -3.734223, 1, 0.9960784, 0, 1,
-1.032522, -0.6008977, -0.08455613, 0.9960784, 1, 0, 1,
-1.029702, -0.05260651, 0.02425471, 0.9921569, 1, 0, 1,
-1.025997, 0.7562692, -1.922716, 0.9843137, 1, 0, 1,
-1.023937, 0.7568719, -1.773429, 0.9803922, 1, 0, 1,
-1.019368, 0.3569544, -1.411239, 0.972549, 1, 0, 1,
-1.013984, 0.8602319, -1.997314, 0.9686275, 1, 0, 1,
-1.006094, -0.3528835, -1.546774, 0.9607843, 1, 0, 1,
-0.9950715, -2.575164, -4.308161, 0.9568627, 1, 0, 1,
-0.9931249, 1.342258, 1.004431, 0.9490196, 1, 0, 1,
-0.9880212, 0.1991281, -1.335239, 0.945098, 1, 0, 1,
-0.9814849, 1.692552, -1.699103, 0.9372549, 1, 0, 1,
-0.9677292, -0.3164865, -1.49905, 0.9333333, 1, 0, 1,
-0.9626392, 0.9706063, -1.88647, 0.9254902, 1, 0, 1,
-0.9624923, 0.06382916, -4.023099, 0.9215686, 1, 0, 1,
-0.9611104, 0.324563, -2.595118, 0.9137255, 1, 0, 1,
-0.9486093, 0.7713823, -0.9793387, 0.9098039, 1, 0, 1,
-0.9485679, -0.1794688, -1.94064, 0.9019608, 1, 0, 1,
-0.9439971, -1.49946, -3.252014, 0.8941177, 1, 0, 1,
-0.9432845, -0.4363945, -2.788188, 0.8901961, 1, 0, 1,
-0.9384595, 0.08170813, -1.958537, 0.8823529, 1, 0, 1,
-0.9376138, -1.516465, -1.98328, 0.8784314, 1, 0, 1,
-0.9373361, -2.772594, -3.129269, 0.8705882, 1, 0, 1,
-0.9369845, -0.52732, -3.225516, 0.8666667, 1, 0, 1,
-0.9351516, -1.204261, -0.835442, 0.8588235, 1, 0, 1,
-0.9321508, -0.4481796, -1.821354, 0.854902, 1, 0, 1,
-0.9306819, 1.756095, -1.33954, 0.8470588, 1, 0, 1,
-0.918498, 0.4828913, -2.281081, 0.8431373, 1, 0, 1,
-0.908517, 0.9556428, -2.92328, 0.8352941, 1, 0, 1,
-0.9062579, 0.1651962, -1.054444, 0.8313726, 1, 0, 1,
-0.9024529, 0.793165, -0.4473715, 0.8235294, 1, 0, 1,
-0.8988189, -0.3316123, -2.837935, 0.8196079, 1, 0, 1,
-0.8963416, 0.5494363, -0.891034, 0.8117647, 1, 0, 1,
-0.8947356, 0.6388347, -1.646022, 0.8078431, 1, 0, 1,
-0.8942156, 0.7630822, -2.809026, 0.8, 1, 0, 1,
-0.8940409, 0.6778708, -2.603926, 0.7921569, 1, 0, 1,
-0.8935276, 0.0585779, -2.497352, 0.7882353, 1, 0, 1,
-0.8920215, -0.4975388, -3.22589, 0.7803922, 1, 0, 1,
-0.8868338, 0.1159725, -2.086892, 0.7764706, 1, 0, 1,
-0.8849561, -0.9712011, -0.8612429, 0.7686275, 1, 0, 1,
-0.8835608, 0.3509685, -0.3502175, 0.7647059, 1, 0, 1,
-0.8834676, -0.4216427, -1.53993, 0.7568628, 1, 0, 1,
-0.8748963, -0.4778127, 0.6902274, 0.7529412, 1, 0, 1,
-0.8747103, 0.166975, -2.73479, 0.7450981, 1, 0, 1,
-0.8703826, 1.372103, 0.8050144, 0.7411765, 1, 0, 1,
-0.8688838, 1.585614, 1.473456, 0.7333333, 1, 0, 1,
-0.8657612, 0.3978935, -0.06936219, 0.7294118, 1, 0, 1,
-0.8592138, -2.114362, -2.122048, 0.7215686, 1, 0, 1,
-0.8591439, -1.003517, -5.577538, 0.7176471, 1, 0, 1,
-0.8586519, -0.2041469, -1.022193, 0.7098039, 1, 0, 1,
-0.8541585, -1.044454, -3.083631, 0.7058824, 1, 0, 1,
-0.847255, -1.342413, -2.944468, 0.6980392, 1, 0, 1,
-0.8324504, 0.4736913, -1.308018, 0.6901961, 1, 0, 1,
-0.8292115, -1.270258, -2.934194, 0.6862745, 1, 0, 1,
-0.827612, 0.6835219, -2.972271, 0.6784314, 1, 0, 1,
-0.8269281, 0.3795671, -2.694958, 0.6745098, 1, 0, 1,
-0.8265035, -0.1126442, -1.260711, 0.6666667, 1, 0, 1,
-0.8249367, -1.322972, -2.171286, 0.6627451, 1, 0, 1,
-0.8246002, -0.3857083, -0.6564406, 0.654902, 1, 0, 1,
-0.8243774, -1.212763, -2.402286, 0.6509804, 1, 0, 1,
-0.8174211, -2.35956, -1.331336, 0.6431373, 1, 0, 1,
-0.8104373, -0.01942309, -1.541734, 0.6392157, 1, 0, 1,
-0.8055295, -0.3223314, -1.62456, 0.6313726, 1, 0, 1,
-0.8031998, 0.4546732, -0.515014, 0.627451, 1, 0, 1,
-0.7972228, 0.4520062, -2.775292, 0.6196079, 1, 0, 1,
-0.7962472, -2.026315, -2.2081, 0.6156863, 1, 0, 1,
-0.7961976, 1.163291, 1.613869, 0.6078432, 1, 0, 1,
-0.7938256, 1.065562, 0.02528322, 0.6039216, 1, 0, 1,
-0.7931929, 1.065901, -0.8520406, 0.5960785, 1, 0, 1,
-0.7917218, -1.794185, -3.663909, 0.5882353, 1, 0, 1,
-0.7838377, -0.1790016, -2.900548, 0.5843138, 1, 0, 1,
-0.7815813, 0.1406756, -1.62779, 0.5764706, 1, 0, 1,
-0.7761265, 1.416584, 0.8715973, 0.572549, 1, 0, 1,
-0.7760689, 0.396114, 0.09276694, 0.5647059, 1, 0, 1,
-0.7743132, 0.01553419, -1.462242, 0.5607843, 1, 0, 1,
-0.7717667, -0.9189581, -2.410213, 0.5529412, 1, 0, 1,
-0.7707093, 1.207238, -0.4695472, 0.5490196, 1, 0, 1,
-0.7681649, 0.4810949, -1.74727, 0.5411765, 1, 0, 1,
-0.7611785, -1.300612, -1.781475, 0.5372549, 1, 0, 1,
-0.7533064, 0.6023527, -1.493298, 0.5294118, 1, 0, 1,
-0.7512456, -0.7344339, -2.182088, 0.5254902, 1, 0, 1,
-0.7501764, -0.05374506, -3.290307, 0.5176471, 1, 0, 1,
-0.746976, -0.1511314, -0.5405684, 0.5137255, 1, 0, 1,
-0.7468451, 0.4344532, -1.431289, 0.5058824, 1, 0, 1,
-0.7429755, 0.1452865, -0.9421042, 0.5019608, 1, 0, 1,
-0.7395698, 0.7742918, -1.667487, 0.4941176, 1, 0, 1,
-0.7373402, -0.09546936, -1.229403, 0.4862745, 1, 0, 1,
-0.7372894, -0.5043596, -3.352233, 0.4823529, 1, 0, 1,
-0.7269543, -0.1068587, -3.299629, 0.4745098, 1, 0, 1,
-0.7220182, 0.7962477, -0.7316695, 0.4705882, 1, 0, 1,
-0.721997, -2.203721, -2.109594, 0.4627451, 1, 0, 1,
-0.7210636, -0.05078747, -1.841875, 0.4588235, 1, 0, 1,
-0.7187698, -1.216099, -5.032959, 0.4509804, 1, 0, 1,
-0.7182779, -0.4997783, -2.450894, 0.4470588, 1, 0, 1,
-0.7179757, -0.4795793, -2.137433, 0.4392157, 1, 0, 1,
-0.715097, 0.3037901, -0.8549838, 0.4352941, 1, 0, 1,
-0.7115628, 0.4530062, -1.18528, 0.427451, 1, 0, 1,
-0.7050961, -0.5287395, -3.868987, 0.4235294, 1, 0, 1,
-0.7010912, 0.5007249, -0.2643255, 0.4156863, 1, 0, 1,
-0.6969236, -0.7692393, -2.327053, 0.4117647, 1, 0, 1,
-0.6947365, 0.01206528, -1.44798, 0.4039216, 1, 0, 1,
-0.6913898, 0.1947047, -0.6850644, 0.3960784, 1, 0, 1,
-0.6909984, -0.1755784, -0.7058015, 0.3921569, 1, 0, 1,
-0.6896611, -1.342831, -2.142958, 0.3843137, 1, 0, 1,
-0.6847433, -0.7342669, -2.148385, 0.3803922, 1, 0, 1,
-0.6798512, -0.003869399, -2.176852, 0.372549, 1, 0, 1,
-0.6787823, -1.268808, -2.918838, 0.3686275, 1, 0, 1,
-0.6750754, 1.654214, 1.077343, 0.3607843, 1, 0, 1,
-0.6709009, -0.4653668, -1.574924, 0.3568628, 1, 0, 1,
-0.6692266, 1.211831, -2.475423, 0.3490196, 1, 0, 1,
-0.6593376, -0.2813725, -1.88107, 0.345098, 1, 0, 1,
-0.6568027, -0.5642588, -1.560557, 0.3372549, 1, 0, 1,
-0.6550112, 2.401928, -1.046655, 0.3333333, 1, 0, 1,
-0.6507427, -2.224856, -3.398843, 0.3254902, 1, 0, 1,
-0.6490456, 0.08569478, -1.102799, 0.3215686, 1, 0, 1,
-0.6472132, 1.098419, -0.2593125, 0.3137255, 1, 0, 1,
-0.6467708, -1.054483, -1.750469, 0.3098039, 1, 0, 1,
-0.6466147, 1.122507, -1.800488, 0.3019608, 1, 0, 1,
-0.6461824, 1.051566, -2.426886, 0.2941177, 1, 0, 1,
-0.6457521, 0.4019996, -0.9473679, 0.2901961, 1, 0, 1,
-0.6442901, 0.5413508, -0.3855111, 0.282353, 1, 0, 1,
-0.6342284, 1.308924, -0.0113989, 0.2784314, 1, 0, 1,
-0.6334908, 0.4017139, -1.202322, 0.2705882, 1, 0, 1,
-0.6291256, 0.1799403, -1.201533, 0.2666667, 1, 0, 1,
-0.6287081, -0.8615333, -3.406177, 0.2588235, 1, 0, 1,
-0.6286735, 0.7236164, -1.841437, 0.254902, 1, 0, 1,
-0.6261095, 0.3038186, -1.02286, 0.2470588, 1, 0, 1,
-0.625278, 0.7230663, 0.07440252, 0.2431373, 1, 0, 1,
-0.6245778, -0.6040893, -3.211347, 0.2352941, 1, 0, 1,
-0.6209463, 0.2580879, -0.8240103, 0.2313726, 1, 0, 1,
-0.6188633, -0.4976839, -2.796642, 0.2235294, 1, 0, 1,
-0.6154816, -0.6881919, -2.909462, 0.2196078, 1, 0, 1,
-0.6150425, -0.2211166, -3.176432, 0.2117647, 1, 0, 1,
-0.6052176, 0.4713274, -0.08153964, 0.2078431, 1, 0, 1,
-0.6022643, -1.447766, -1.581613, 0.2, 1, 0, 1,
-0.5970666, 0.6070199, -2.809248, 0.1921569, 1, 0, 1,
-0.5938113, -0.8604151, -1.749676, 0.1882353, 1, 0, 1,
-0.590655, -0.56735, -3.870388, 0.1803922, 1, 0, 1,
-0.5888963, -0.09884602, -2.849088, 0.1764706, 1, 0, 1,
-0.5866611, -1.714414, -3.623112, 0.1686275, 1, 0, 1,
-0.5852655, 2.996516, -0.4641014, 0.1647059, 1, 0, 1,
-0.5791244, -0.9916996, -1.676549, 0.1568628, 1, 0, 1,
-0.5749003, 0.4703726, -1.72099, 0.1529412, 1, 0, 1,
-0.5706888, 0.7879916, -0.7676437, 0.145098, 1, 0, 1,
-0.5677214, -0.0128423, -1.140434, 0.1411765, 1, 0, 1,
-0.563539, -0.7897345, -2.527894, 0.1333333, 1, 0, 1,
-0.559605, -0.7113554, -2.719299, 0.1294118, 1, 0, 1,
-0.5574369, 0.5619859, -1.885607, 0.1215686, 1, 0, 1,
-0.5573546, 0.9498615, 0.8633237, 0.1176471, 1, 0, 1,
-0.5551002, -0.5263427, -0.8685766, 0.1098039, 1, 0, 1,
-0.5542198, 1.006647, -1.493496, 0.1058824, 1, 0, 1,
-0.5492709, -0.08891647, -0.1935487, 0.09803922, 1, 0, 1,
-0.5486, -1.117202, -1.783476, 0.09019608, 1, 0, 1,
-0.5413578, -0.6721082, -1.192358, 0.08627451, 1, 0, 1,
-0.5347925, -0.4804519, -3.491913, 0.07843138, 1, 0, 1,
-0.5313767, -1.403705, -1.433387, 0.07450981, 1, 0, 1,
-0.5218706, 0.6175891, -2.037481, 0.06666667, 1, 0, 1,
-0.5186372, -0.8511882, -3.325334, 0.0627451, 1, 0, 1,
-0.5176765, 0.2497286, -1.489739, 0.05490196, 1, 0, 1,
-0.5175558, -0.4910126, -2.398354, 0.05098039, 1, 0, 1,
-0.5156104, 1.211491, 1.30747, 0.04313726, 1, 0, 1,
-0.5128792, -2.341741, -2.828473, 0.03921569, 1, 0, 1,
-0.5128638, -0.1290952, 0.267985, 0.03137255, 1, 0, 1,
-0.5107337, 0.4435113, 0.0832784, 0.02745098, 1, 0, 1,
-0.5099122, -1.677641, -4.334641, 0.01960784, 1, 0, 1,
-0.5094363, -0.147148, -2.620851, 0.01568628, 1, 0, 1,
-0.5094067, 1.433002, -0.2736494, 0.007843138, 1, 0, 1,
-0.508635, -0.3630845, -5.376871, 0.003921569, 1, 0, 1,
-0.5040274, 0.1449594, -0.4156307, 0, 1, 0.003921569, 1,
-0.5031503, -0.4769414, -2.316526, 0, 1, 0.01176471, 1,
-0.5023119, -0.7366573, -3.638124, 0, 1, 0.01568628, 1,
-0.5018417, 0.04684133, -2.127896, 0, 1, 0.02352941, 1,
-0.5011956, -1.189119, -1.460879, 0, 1, 0.02745098, 1,
-0.4874935, -0.7465328, -1.561899, 0, 1, 0.03529412, 1,
-0.4871455, 1.037219, -0.6565239, 0, 1, 0.03921569, 1,
-0.4862939, -0.4030073, -3.519175, 0, 1, 0.04705882, 1,
-0.4849716, 0.6683542, -0.1452594, 0, 1, 0.05098039, 1,
-0.4828653, -0.6664617, -0.3962286, 0, 1, 0.05882353, 1,
-0.4807247, -0.4508695, -2.624503, 0, 1, 0.0627451, 1,
-0.4758881, 0.9093763, -0.9349774, 0, 1, 0.07058824, 1,
-0.4731649, -1.791901, -3.311903, 0, 1, 0.07450981, 1,
-0.4718301, -0.9158461, -3.119203, 0, 1, 0.08235294, 1,
-0.4716384, 1.158022, -1.758456, 0, 1, 0.08627451, 1,
-0.4708902, -0.2924505, -3.573013, 0, 1, 0.09411765, 1,
-0.4695642, 1.348922, -0.9411804, 0, 1, 0.1019608, 1,
-0.4631561, -0.2026965, -3.296132, 0, 1, 0.1058824, 1,
-0.4615052, -1.288484, -2.360759, 0, 1, 0.1137255, 1,
-0.4594698, 1.062002, -0.2330566, 0, 1, 0.1176471, 1,
-0.4586464, 0.4335425, -1.396131, 0, 1, 0.1254902, 1,
-0.4549641, -0.2930823, -2.422981, 0, 1, 0.1294118, 1,
-0.4543788, -0.8418475, -3.334553, 0, 1, 0.1372549, 1,
-0.4462595, 0.6138994, 0.7782739, 0, 1, 0.1411765, 1,
-0.4439534, 1.047213, 0.1064743, 0, 1, 0.1490196, 1,
-0.439134, -0.2865981, -3.885933, 0, 1, 0.1529412, 1,
-0.4372136, 1.658037, 0.4092712, 0, 1, 0.1607843, 1,
-0.4364011, -0.3004678, -3.515319, 0, 1, 0.1647059, 1,
-0.434408, 1.232265, 0.01543228, 0, 1, 0.172549, 1,
-0.4319601, -1.151696, -3.830051, 0, 1, 0.1764706, 1,
-0.4296316, -0.7869712, -2.158794, 0, 1, 0.1843137, 1,
-0.4267899, -0.6948622, -1.837931, 0, 1, 0.1882353, 1,
-0.4256871, -1.749483, -2.203872, 0, 1, 0.1960784, 1,
-0.4214895, -0.1273434, -1.753346, 0, 1, 0.2039216, 1,
-0.4191288, -1.292981, -2.672014, 0, 1, 0.2078431, 1,
-0.4114257, -0.3768256, -2.443514, 0, 1, 0.2156863, 1,
-0.4104785, -0.9515947, -2.089974, 0, 1, 0.2196078, 1,
-0.4099108, -1.048482, -2.839202, 0, 1, 0.227451, 1,
-0.4094526, 0.1502427, -1.149468, 0, 1, 0.2313726, 1,
-0.4063692, 0.9426485, -0.8866171, 0, 1, 0.2392157, 1,
-0.4026404, -0.7698709, -2.807887, 0, 1, 0.2431373, 1,
-0.4010544, 0.3081259, -2.240356, 0, 1, 0.2509804, 1,
-0.400204, 0.67246, 0.2165392, 0, 1, 0.254902, 1,
-0.3997278, -0.0463879, -0.2774654, 0, 1, 0.2627451, 1,
-0.3982118, 0.5672479, -0.07940773, 0, 1, 0.2666667, 1,
-0.3969266, -0.08441312, -1.131267, 0, 1, 0.2745098, 1,
-0.396254, -0.5116695, -2.634112, 0, 1, 0.2784314, 1,
-0.392891, 0.7594875, -0.6761025, 0, 1, 0.2862745, 1,
-0.3923663, 1.363607, -1.149686, 0, 1, 0.2901961, 1,
-0.3897643, 0.852512, -0.3954768, 0, 1, 0.2980392, 1,
-0.3886226, -1.102918, -3.344883, 0, 1, 0.3058824, 1,
-0.3878809, -0.9588984, -2.957906, 0, 1, 0.3098039, 1,
-0.3834278, 1.709383, 0.3153405, 0, 1, 0.3176471, 1,
-0.3832028, -0.4505228, -0.9258244, 0, 1, 0.3215686, 1,
-0.3827862, 0.818492, 0.3231799, 0, 1, 0.3294118, 1,
-0.3820724, -0.5521695, -4.519601, 0, 1, 0.3333333, 1,
-0.3794672, -1.015487, -1.777439, 0, 1, 0.3411765, 1,
-0.3785794, -0.04105667, -2.068228, 0, 1, 0.345098, 1,
-0.3770971, -0.8353322, -4.364563, 0, 1, 0.3529412, 1,
-0.376198, 2.049229, 0.03845355, 0, 1, 0.3568628, 1,
-0.3749305, -1.70871, -5.081332, 0, 1, 0.3647059, 1,
-0.3697098, -0.04989124, -1.539263, 0, 1, 0.3686275, 1,
-0.3670875, 0.7812154, 0.2067446, 0, 1, 0.3764706, 1,
-0.3618885, -1.891867, -2.790712, 0, 1, 0.3803922, 1,
-0.3556157, -0.249873, -2.492807, 0, 1, 0.3882353, 1,
-0.3466653, 0.4022216, -1.900763, 0, 1, 0.3921569, 1,
-0.3455077, -0.3532304, -1.929224, 0, 1, 0.4, 1,
-0.3443432, 2.086401, -0.6604801, 0, 1, 0.4078431, 1,
-0.3437645, -1.680027, -1.034142, 0, 1, 0.4117647, 1,
-0.3433487, 0.06722966, -0.7094222, 0, 1, 0.4196078, 1,
-0.3384726, 1.115404, -0.4822905, 0, 1, 0.4235294, 1,
-0.3349762, 0.6196803, 1.737967, 0, 1, 0.4313726, 1,
-0.3335333, -1.079421, -4.570937, 0, 1, 0.4352941, 1,
-0.327646, 0.4985119, 0.5469427, 0, 1, 0.4431373, 1,
-0.3227325, -0.5481811, -3.025875, 0, 1, 0.4470588, 1,
-0.3214317, 1.305054, -2.187588, 0, 1, 0.454902, 1,
-0.3176107, -2.44794, -4.112232, 0, 1, 0.4588235, 1,
-0.3143959, 2.438726, -0.6837533, 0, 1, 0.4666667, 1,
-0.3126873, -1.015697, -2.133931, 0, 1, 0.4705882, 1,
-0.3125285, 1.533713, 0.2276601, 0, 1, 0.4784314, 1,
-0.3123476, -0.5134009, -2.291803, 0, 1, 0.4823529, 1,
-0.3120223, -0.8101041, -4.760608, 0, 1, 0.4901961, 1,
-0.3023962, 0.3824647, -1.209105, 0, 1, 0.4941176, 1,
-0.297366, 1.868951, -2.041653, 0, 1, 0.5019608, 1,
-0.2969152, 0.4386566, -0.2156598, 0, 1, 0.509804, 1,
-0.2950656, -1.610797, -3.724913, 0, 1, 0.5137255, 1,
-0.2901585, -0.6371878, -3.126632, 0, 1, 0.5215687, 1,
-0.2890182, -0.4942932, -4.685175, 0, 1, 0.5254902, 1,
-0.2880618, 1.937706, 0.7139678, 0, 1, 0.5333334, 1,
-0.2839097, 1.78431, 1.315103, 0, 1, 0.5372549, 1,
-0.2828042, -0.4054258, -0.4832339, 0, 1, 0.5450981, 1,
-0.2759369, 1.603147, -2.622603, 0, 1, 0.5490196, 1,
-0.2738876, -0.4106705, -2.962343, 0, 1, 0.5568628, 1,
-0.2733381, 1.514803, 0.1155078, 0, 1, 0.5607843, 1,
-0.2730896, 2.131199, -0.7072659, 0, 1, 0.5686275, 1,
-0.2725599, 0.03018148, -0.9815688, 0, 1, 0.572549, 1,
-0.2690516, -1.394871, -3.356951, 0, 1, 0.5803922, 1,
-0.267583, -0.3548552, -1.658481, 0, 1, 0.5843138, 1,
-0.2630219, 1.101598, 0.6219728, 0, 1, 0.5921569, 1,
-0.2616521, 0.4065356, -1.073657, 0, 1, 0.5960785, 1,
-0.2565861, -0.0382746, -1.90145, 0, 1, 0.6039216, 1,
-0.2547748, 0.2160017, -1.059286, 0, 1, 0.6117647, 1,
-0.2502431, -0.5877787, -2.642454, 0, 1, 0.6156863, 1,
-0.2467283, 0.8119668, -1.772402, 0, 1, 0.6235294, 1,
-0.2358152, -0.4748356, -1.894073, 0, 1, 0.627451, 1,
-0.2306785, 0.3435074, -1.680716, 0, 1, 0.6352941, 1,
-0.2303328, -0.09481037, -2.11612, 0, 1, 0.6392157, 1,
-0.2278784, -0.1591734, -2.210062, 0, 1, 0.6470588, 1,
-0.2268349, -0.04960548, -0.765159, 0, 1, 0.6509804, 1,
-0.2169677, 0.2486279, -0.8019835, 0, 1, 0.6588235, 1,
-0.2169559, 1.571023, 1.470303, 0, 1, 0.6627451, 1,
-0.2147414, 1.211283, -0.06153236, 0, 1, 0.6705883, 1,
-0.2090207, 0.4525981, 0.1172636, 0, 1, 0.6745098, 1,
-0.2079243, 0.7049146, -1.540175, 0, 1, 0.682353, 1,
-0.2033783, -1.190824, -4.492185, 0, 1, 0.6862745, 1,
-0.2006529, -1.079479, -4.995417, 0, 1, 0.6941177, 1,
-0.199223, 0.07998785, -1.833841, 0, 1, 0.7019608, 1,
-0.1920192, 1.24117, -1.563975, 0, 1, 0.7058824, 1,
-0.1844842, 2.02167, 0.7880455, 0, 1, 0.7137255, 1,
-0.1825873, 1.242807, -0.7462209, 0, 1, 0.7176471, 1,
-0.1763722, 2.054902, 0.6454095, 0, 1, 0.7254902, 1,
-0.1726199, -1.564319, -3.156504, 0, 1, 0.7294118, 1,
-0.1717876, -1.081077, -3.571651, 0, 1, 0.7372549, 1,
-0.1647351, 0.4495327, 0.592351, 0, 1, 0.7411765, 1,
-0.162202, -0.5853784, -3.162917, 0, 1, 0.7490196, 1,
-0.1601507, -0.1362269, -1.675064, 0, 1, 0.7529412, 1,
-0.1592388, -0.4982868, -5.631246, 0, 1, 0.7607843, 1,
-0.1563038, 0.05342336, -1.425189, 0, 1, 0.7647059, 1,
-0.1558697, 0.1184563, -2.203692, 0, 1, 0.772549, 1,
-0.1545015, 0.09174974, -2.486605, 0, 1, 0.7764706, 1,
-0.153287, -0.4172541, -2.913742, 0, 1, 0.7843137, 1,
-0.1505698, -1.149805, -2.959918, 0, 1, 0.7882353, 1,
-0.1468929, -0.500624, -1.714119, 0, 1, 0.7960784, 1,
-0.1468458, -1.403702, -3.415747, 0, 1, 0.8039216, 1,
-0.1436446, -0.03022161, -0.8132264, 0, 1, 0.8078431, 1,
-0.1424286, -1.127768, -2.757421, 0, 1, 0.8156863, 1,
-0.1416363, -1.449514, -2.061175, 0, 1, 0.8196079, 1,
-0.1391253, 1.829017, 0.6021731, 0, 1, 0.827451, 1,
-0.1352888, -0.4246515, -3.096562, 0, 1, 0.8313726, 1,
-0.130727, 1.377573, 0.4261412, 0, 1, 0.8392157, 1,
-0.1294707, 0.5388835, 1.524916, 0, 1, 0.8431373, 1,
-0.1262562, -0.532235, -3.229855, 0, 1, 0.8509804, 1,
-0.1258347, 0.04554864, -1.46032, 0, 1, 0.854902, 1,
-0.1228878, 0.06128379, -2.223006, 0, 1, 0.8627451, 1,
-0.12055, -0.3891058, -3.603332, 0, 1, 0.8666667, 1,
-0.1168769, -0.5300718, -1.935693, 0, 1, 0.8745098, 1,
-0.1146548, -1.160702, -3.16764, 0, 1, 0.8784314, 1,
-0.1141144, 0.00647264, -1.959306, 0, 1, 0.8862745, 1,
-0.1117923, 1.028054, 0.6921911, 0, 1, 0.8901961, 1,
-0.111562, 0.9154519, -0.1183136, 0, 1, 0.8980392, 1,
-0.1099718, 0.6132777, -1.57087, 0, 1, 0.9058824, 1,
-0.109326, 1.359436, -1.453701, 0, 1, 0.9098039, 1,
-0.1085454, 0.02311526, -1.962639, 0, 1, 0.9176471, 1,
-0.1084197, -0.109902, -2.069418, 0, 1, 0.9215686, 1,
-0.1076341, 1.910529, 1.893109, 0, 1, 0.9294118, 1,
-0.1047675, -0.8762842, -3.258097, 0, 1, 0.9333333, 1,
-0.1042825, 1.52814, 0.05845071, 0, 1, 0.9411765, 1,
-0.1031118, 1.61558, 0.2172456, 0, 1, 0.945098, 1,
-0.1007051, 0.02897764, 0.1619777, 0, 1, 0.9529412, 1,
-0.09939542, -0.01064775, -2.141661, 0, 1, 0.9568627, 1,
-0.09724982, 0.1740448, -1.014354, 0, 1, 0.9647059, 1,
-0.09432667, -0.5521296, -3.499567, 0, 1, 0.9686275, 1,
-0.09403411, 0.1817614, -0.8772417, 0, 1, 0.9764706, 1,
-0.0917863, 1.094193, 0.152053, 0, 1, 0.9803922, 1,
-0.08681307, -0.2922173, -3.40469, 0, 1, 0.9882353, 1,
-0.08586692, -0.4201243, -2.395263, 0, 1, 0.9921569, 1,
-0.08562052, -0.5659698, -3.653715, 0, 1, 1, 1,
-0.08116543, 0.1600851, -1.189811, 0, 0.9921569, 1, 1,
-0.08073559, 1.093667, -1.066268, 0, 0.9882353, 1, 1,
-0.07892931, 1.851399, 0.3764332, 0, 0.9803922, 1, 1,
-0.07209252, 0.1166509, 1.271342, 0, 0.9764706, 1, 1,
-0.07178181, 0.2063157, -2.012199, 0, 0.9686275, 1, 1,
-0.07122689, -0.7983667, -2.084599, 0, 0.9647059, 1, 1,
-0.06920055, 0.3638667, 0.04442469, 0, 0.9568627, 1, 1,
-0.06825525, 0.2867305, 0.1312282, 0, 0.9529412, 1, 1,
-0.06601214, -1.113058, -4.640088, 0, 0.945098, 1, 1,
-0.06522656, 1.435073, -0.3433157, 0, 0.9411765, 1, 1,
-0.05732862, 0.08938294, -1.773672, 0, 0.9333333, 1, 1,
-0.05006737, -1.210409, -3.508557, 0, 0.9294118, 1, 1,
-0.04815739, 2.551678, -1.504106, 0, 0.9215686, 1, 1,
-0.04619675, 0.2936346, -0.1493089, 0, 0.9176471, 1, 1,
-0.04258233, 1.321202, 0.6165395, 0, 0.9098039, 1, 1,
-0.04178101, 0.3121686, -0.1698145, 0, 0.9058824, 1, 1,
-0.04176643, -0.07626999, -1.80731, 0, 0.8980392, 1, 1,
-0.03942282, 0.645828, -2.186618, 0, 0.8901961, 1, 1,
-0.03581772, -1.021952, -3.277486, 0, 0.8862745, 1, 1,
-0.02869971, -0.07240644, -2.924471, 0, 0.8784314, 1, 1,
-0.02851649, -1.519636, -4.127876, 0, 0.8745098, 1, 1,
-0.02835413, 1.419477, 0.8121228, 0, 0.8666667, 1, 1,
-0.02151507, -1.075413, -2.688327, 0, 0.8627451, 1, 1,
-0.02036616, 0.900409, -1.008529, 0, 0.854902, 1, 1,
-0.02025621, -1.479575, -1.556952, 0, 0.8509804, 1, 1,
-0.02009248, 1.219243, 0.3772655, 0, 0.8431373, 1, 1,
-0.01927415, 0.06578051, -0.01506414, 0, 0.8392157, 1, 1,
-0.01794622, -0.07756224, -3.614857, 0, 0.8313726, 1, 1,
-0.01725086, -2.203306, -3.434111, 0, 0.827451, 1, 1,
-0.01475205, -0.03445894, -3.43644, 0, 0.8196079, 1, 1,
-0.01288824, 0.8020741, 0.9982748, 0, 0.8156863, 1, 1,
-0.01238668, -1.23283, -4.092585, 0, 0.8078431, 1, 1,
-0.008521152, -0.3407523, -4.285097, 0, 0.8039216, 1, 1,
-0.007102455, 1.678396, -1.639648, 0, 0.7960784, 1, 1,
0.005198148, -0.8129923, 2.213817, 0, 0.7882353, 1, 1,
0.005201836, -1.064928, 3.387746, 0, 0.7843137, 1, 1,
0.0105966, -0.8935193, 4.630041, 0, 0.7764706, 1, 1,
0.01315777, -1.3011, 3.235819, 0, 0.772549, 1, 1,
0.01498377, 0.4623827, -0.0817517, 0, 0.7647059, 1, 1,
0.01499013, 0.0210232, 0.6351898, 0, 0.7607843, 1, 1,
0.02174145, -0.7841439, 1.514889, 0, 0.7529412, 1, 1,
0.02461111, 0.3451197, -0.5991516, 0, 0.7490196, 1, 1,
0.02547858, 0.04654452, -0.002269133, 0, 0.7411765, 1, 1,
0.02999958, 0.3598819, -0.5636178, 0, 0.7372549, 1, 1,
0.0310957, -0.9355068, 3.175617, 0, 0.7294118, 1, 1,
0.03283796, -0.5921611, 4.784775, 0, 0.7254902, 1, 1,
0.03658583, 0.002358049, -0.3871996, 0, 0.7176471, 1, 1,
0.04016761, 0.669199, 1.727198, 0, 0.7137255, 1, 1,
0.04271428, 1.022185, 1.24066, 0, 0.7058824, 1, 1,
0.04542161, -0.4680918, 4.483189, 0, 0.6980392, 1, 1,
0.04788593, -1.4783, 4.313818, 0, 0.6941177, 1, 1,
0.0490344, 1.135856, 0.4213719, 0, 0.6862745, 1, 1,
0.05283172, -0.5627261, 1.450705, 0, 0.682353, 1, 1,
0.05481835, 1.45999, -0.9808716, 0, 0.6745098, 1, 1,
0.05530598, -1.072352, 3.169982, 0, 0.6705883, 1, 1,
0.05594907, -2.168192, 2.610747, 0, 0.6627451, 1, 1,
0.05882766, 0.6417366, 0.2738178, 0, 0.6588235, 1, 1,
0.05894298, 0.5803437, -1.1445, 0, 0.6509804, 1, 1,
0.05913369, 0.4071681, -0.02912511, 0, 0.6470588, 1, 1,
0.05981644, -0.9925026, 1.469831, 0, 0.6392157, 1, 1,
0.06180258, -0.02648244, 0.4269286, 0, 0.6352941, 1, 1,
0.06720272, 1.163773, -1.165709, 0, 0.627451, 1, 1,
0.06774989, 0.5308188, -0.02557382, 0, 0.6235294, 1, 1,
0.07317414, -0.6453083, 2.941699, 0, 0.6156863, 1, 1,
0.07492362, 0.7399416, -2.241152, 0, 0.6117647, 1, 1,
0.07623716, -1.413949, 3.440066, 0, 0.6039216, 1, 1,
0.07797511, 0.3763659, 0.01972638, 0, 0.5960785, 1, 1,
0.08402736, -0.8315901, 2.91635, 0, 0.5921569, 1, 1,
0.0852493, 0.5263336, 1.348315, 0, 0.5843138, 1, 1,
0.08552279, 0.9525868, -0.1412568, 0, 0.5803922, 1, 1,
0.08766481, 0.7441352, 1.022392, 0, 0.572549, 1, 1,
0.08935494, -0.9237646, 3.513789, 0, 0.5686275, 1, 1,
0.09943664, -1.651708, 3.233215, 0, 0.5607843, 1, 1,
0.101144, -0.08234838, 3.535025, 0, 0.5568628, 1, 1,
0.1045906, 1.545221, -0.7653907, 0, 0.5490196, 1, 1,
0.1088849, -0.9234399, 3.25585, 0, 0.5450981, 1, 1,
0.1128495, 1.550888, 2.317307, 0, 0.5372549, 1, 1,
0.1129198, -0.2567545, 2.538032, 0, 0.5333334, 1, 1,
0.1175976, 1.192788, -0.3373239, 0, 0.5254902, 1, 1,
0.118497, -0.7274293, 2.532437, 0, 0.5215687, 1, 1,
0.1222425, 0.7543636, 0.5956039, 0, 0.5137255, 1, 1,
0.1222499, -0.5124558, 4.92008, 0, 0.509804, 1, 1,
0.1309199, 1.06442, 0.07993861, 0, 0.5019608, 1, 1,
0.1321162, -1.458092, 3.03482, 0, 0.4941176, 1, 1,
0.1335584, 0.1213918, 3.199421, 0, 0.4901961, 1, 1,
0.1345599, 0.9948735, 0.964918, 0, 0.4823529, 1, 1,
0.1380371, -0.8998771, 3.537037, 0, 0.4784314, 1, 1,
0.143954, 0.2520568, -1.057161, 0, 0.4705882, 1, 1,
0.144619, -0.9492671, 3.121416, 0, 0.4666667, 1, 1,
0.1501486, -0.1069116, 2.757134, 0, 0.4588235, 1, 1,
0.1614426, 0.4564422, 0.3286557, 0, 0.454902, 1, 1,
0.166434, -0.2556938, 2.255147, 0, 0.4470588, 1, 1,
0.1668082, 2.524413, -0.2120206, 0, 0.4431373, 1, 1,
0.1710761, -0.4268035, 4.172953, 0, 0.4352941, 1, 1,
0.1731329, 0.3107655, 0.7836381, 0, 0.4313726, 1, 1,
0.1753127, -0.3991274, 2.244501, 0, 0.4235294, 1, 1,
0.1755744, -0.5938808, 2.423319, 0, 0.4196078, 1, 1,
0.1758355, -0.1601612, 2.177402, 0, 0.4117647, 1, 1,
0.193555, -2.925209, 3.086382, 0, 0.4078431, 1, 1,
0.1970547, -0.9756132, 4.899307, 0, 0.4, 1, 1,
0.1976614, -0.3715484, 2.473493, 0, 0.3921569, 1, 1,
0.1992396, 1.275369, 1.649427, 0, 0.3882353, 1, 1,
0.2015173, -0.5434093, 3.774557, 0, 0.3803922, 1, 1,
0.2016602, -1.45449, 5.001394, 0, 0.3764706, 1, 1,
0.2019635, -0.008603081, 2.232985, 0, 0.3686275, 1, 1,
0.2029487, 0.5341359, 0.9007292, 0, 0.3647059, 1, 1,
0.203656, 1.27734, -0.2034426, 0, 0.3568628, 1, 1,
0.2087205, 0.3178558, 0.6000344, 0, 0.3529412, 1, 1,
0.2113163, 0.8181174, 0.03746881, 0, 0.345098, 1, 1,
0.2118243, 2.216763, -2.240242, 0, 0.3411765, 1, 1,
0.2159147, 1.608208, 0.8045434, 0, 0.3333333, 1, 1,
0.2219855, 0.3542245, 0.4040233, 0, 0.3294118, 1, 1,
0.2270517, -0.4644742, 3.411529, 0, 0.3215686, 1, 1,
0.2275983, 1.822043, -0.1669653, 0, 0.3176471, 1, 1,
0.2364435, 0.7857185, 0.2918039, 0, 0.3098039, 1, 1,
0.2386559, 1.496392, -1.180389, 0, 0.3058824, 1, 1,
0.2454354, -1.857447, 2.048092, 0, 0.2980392, 1, 1,
0.2474028, -0.04277261, 3.655463, 0, 0.2901961, 1, 1,
0.2577677, -2.229953, 3.477376, 0, 0.2862745, 1, 1,
0.2580437, -1.070634, 4.177171, 0, 0.2784314, 1, 1,
0.2581834, 0.6717862, 0.08676143, 0, 0.2745098, 1, 1,
0.2606312, -0.9044482, 3.006055, 0, 0.2666667, 1, 1,
0.2647689, -1.035026, 2.52625, 0, 0.2627451, 1, 1,
0.264853, -1.893057, 1.964852, 0, 0.254902, 1, 1,
0.2706272, -0.2128243, 1.988073, 0, 0.2509804, 1, 1,
0.2708691, 0.6967874, 1.131749, 0, 0.2431373, 1, 1,
0.2773661, -1.004423, 2.547702, 0, 0.2392157, 1, 1,
0.2791696, -0.6047489, 4.170873, 0, 0.2313726, 1, 1,
0.2827548, 0.3092049, 0.5548702, 0, 0.227451, 1, 1,
0.2918814, 0.28523, 1.376377, 0, 0.2196078, 1, 1,
0.2919537, -0.4534563, 2.342511, 0, 0.2156863, 1, 1,
0.2919698, 0.01655556, 0.3738984, 0, 0.2078431, 1, 1,
0.2968783, 0.2941161, 0.8601459, 0, 0.2039216, 1, 1,
0.2970548, -0.07424179, 1.392478, 0, 0.1960784, 1, 1,
0.2973013, -0.3329774, 2.101309, 0, 0.1882353, 1, 1,
0.3035002, -2.095981, 0.8543947, 0, 0.1843137, 1, 1,
0.3035297, 1.280965, -1.557091, 0, 0.1764706, 1, 1,
0.3037441, -0.9929113, 4.120741, 0, 0.172549, 1, 1,
0.3071673, 0.8872533, 0.3213376, 0, 0.1647059, 1, 1,
0.307905, 0.3183183, 0.6525985, 0, 0.1607843, 1, 1,
0.3102593, 1.212924, -1.194999, 0, 0.1529412, 1, 1,
0.317093, 0.1314918, 0.2657789, 0, 0.1490196, 1, 1,
0.3204227, -0.1192366, 0.346616, 0, 0.1411765, 1, 1,
0.3230527, 1.000427, -1.909966, 0, 0.1372549, 1, 1,
0.3246699, 1.620631, -0.1543877, 0, 0.1294118, 1, 1,
0.3250506, -0.2636201, 2.607613, 0, 0.1254902, 1, 1,
0.3280103, -0.572989, 2.989485, 0, 0.1176471, 1, 1,
0.3289813, 1.287996, 0.03313956, 0, 0.1137255, 1, 1,
0.3373637, -0.4906223, 1.972888, 0, 0.1058824, 1, 1,
0.3392107, 1.721369, -0.7424168, 0, 0.09803922, 1, 1,
0.3406598, 1.668859, 0.2665675, 0, 0.09411765, 1, 1,
0.3431476, -0.540913, 2.982023, 0, 0.08627451, 1, 1,
0.344153, 0.6199505, -0.6955409, 0, 0.08235294, 1, 1,
0.3442271, -0.5490295, 2.501389, 0, 0.07450981, 1, 1,
0.3461905, 1.389803, 1.407773, 0, 0.07058824, 1, 1,
0.346691, -0.7812229, 1.183973, 0, 0.0627451, 1, 1,
0.3491418, 0.4671405, 0.8132308, 0, 0.05882353, 1, 1,
0.3530397, 0.9062151, 0.1326178, 0, 0.05098039, 1, 1,
0.3535494, -0.830622, 2.878687, 0, 0.04705882, 1, 1,
0.3563793, 0.3045286, -1.313574, 0, 0.03921569, 1, 1,
0.3606478, -0.8329701, 2.376298, 0, 0.03529412, 1, 1,
0.3615661, 0.7948202, -0.1481597, 0, 0.02745098, 1, 1,
0.3622783, 1.237727, 0.4962425, 0, 0.02352941, 1, 1,
0.3683551, -1.065352, 3.400261, 0, 0.01568628, 1, 1,
0.3691834, -0.8976563, 0.2450221, 0, 0.01176471, 1, 1,
0.3698937, 1.372373, -0.1613494, 0, 0.003921569, 1, 1,
0.3714596, 0.4320511, -0.02520003, 0.003921569, 0, 1, 1,
0.3740333, -1.717645, 4.121266, 0.007843138, 0, 1, 1,
0.3773078, 0.1647761, 1.317398, 0.01568628, 0, 1, 1,
0.3786065, -0.0927273, 2.493469, 0.01960784, 0, 1, 1,
0.3839976, -0.6748064, 1.712639, 0.02745098, 0, 1, 1,
0.3862866, -0.06146054, 0.4150921, 0.03137255, 0, 1, 1,
0.3934705, 0.08572787, -0.3592622, 0.03921569, 0, 1, 1,
0.3994493, 0.4528083, -1.594906, 0.04313726, 0, 1, 1,
0.4026164, 0.8731253, -0.9255863, 0.05098039, 0, 1, 1,
0.406398, 1.093396, 0.01338397, 0.05490196, 0, 1, 1,
0.4159383, -0.3273313, 1.407393, 0.0627451, 0, 1, 1,
0.4159409, -0.1900817, 0.6052814, 0.06666667, 0, 1, 1,
0.4166481, -0.458959, 2.701512, 0.07450981, 0, 1, 1,
0.4169827, -0.9254311, 4.025102, 0.07843138, 0, 1, 1,
0.4176038, 1.113685, 0.6215758, 0.08627451, 0, 1, 1,
0.4198822, 0.598438, 0.4146324, 0.09019608, 0, 1, 1,
0.4201895, 0.3190717, 1.123228, 0.09803922, 0, 1, 1,
0.4222012, -0.2014852, -1.913057, 0.1058824, 0, 1, 1,
0.4261945, 1.184339, -1.357502, 0.1098039, 0, 1, 1,
0.4262616, 0.8065816, -0.2765444, 0.1176471, 0, 1, 1,
0.4290703, -0.4934983, 1.061426, 0.1215686, 0, 1, 1,
0.4301961, 1.374498, 1.678377, 0.1294118, 0, 1, 1,
0.4307404, 0.4231047, -0.04076913, 0.1333333, 0, 1, 1,
0.4314025, -0.7180892, 0.5701905, 0.1411765, 0, 1, 1,
0.4325141, 0.01924501, 2.17308, 0.145098, 0, 1, 1,
0.4350546, -0.04657721, 2.184539, 0.1529412, 0, 1, 1,
0.4356951, 1.503894, 0.6068203, 0.1568628, 0, 1, 1,
0.4505127, 0.8058717, 0.2627251, 0.1647059, 0, 1, 1,
0.451055, 0.9636044, 1.105427, 0.1686275, 0, 1, 1,
0.4584976, -0.920606, 4.469027, 0.1764706, 0, 1, 1,
0.4624256, -0.2872225, 3.008167, 0.1803922, 0, 1, 1,
0.4648257, 1.846055, 0.617636, 0.1882353, 0, 1, 1,
0.4654975, -0.4201705, 2.86621, 0.1921569, 0, 1, 1,
0.467024, -0.0855596, 2.127891, 0.2, 0, 1, 1,
0.4672319, -0.0913664, 1.027561, 0.2078431, 0, 1, 1,
0.4687926, 0.9315013, -0.4004244, 0.2117647, 0, 1, 1,
0.4702173, -1.466388, 3.522664, 0.2196078, 0, 1, 1,
0.4849031, -0.6227345, 1.568316, 0.2235294, 0, 1, 1,
0.4896844, 1.036217, -0.1352368, 0.2313726, 0, 1, 1,
0.4916973, -0.8685348, 1.567491, 0.2352941, 0, 1, 1,
0.4919975, 0.2423714, 1.791681, 0.2431373, 0, 1, 1,
0.4970565, -0.6086743, 2.280892, 0.2470588, 0, 1, 1,
0.4993651, -0.02122137, 1.801171, 0.254902, 0, 1, 1,
0.504531, 0.117139, 0.8275763, 0.2588235, 0, 1, 1,
0.5078033, -0.8052753, 3.171567, 0.2666667, 0, 1, 1,
0.5192818, 0.8424538, -3.218295, 0.2705882, 0, 1, 1,
0.5233676, -1.000833, 2.513143, 0.2784314, 0, 1, 1,
0.5297661, -0.3900112, 3.302655, 0.282353, 0, 1, 1,
0.5323164, -1.569795, 3.943901, 0.2901961, 0, 1, 1,
0.5324677, 0.5604953, 0.8936245, 0.2941177, 0, 1, 1,
0.5366297, -0.5145406, 1.070124, 0.3019608, 0, 1, 1,
0.5366693, -0.4662106, 2.201987, 0.3098039, 0, 1, 1,
0.5373144, 1.458701, 1.603702, 0.3137255, 0, 1, 1,
0.5379311, -1.116659, 2.080978, 0.3215686, 0, 1, 1,
0.5393864, 0.125335, 0.8090325, 0.3254902, 0, 1, 1,
0.5405223, -0.4393844, 2.391093, 0.3333333, 0, 1, 1,
0.5422284, 1.150618, 0.6241213, 0.3372549, 0, 1, 1,
0.5453023, -1.438032, 1.369595, 0.345098, 0, 1, 1,
0.546617, -0.3186098, 1.601094, 0.3490196, 0, 1, 1,
0.5485884, 1.902052, -1.568694, 0.3568628, 0, 1, 1,
0.5514825, 0.4310136, 0.2763855, 0.3607843, 0, 1, 1,
0.5532876, 1.022472, -0.796584, 0.3686275, 0, 1, 1,
0.5533524, -0.8437295, 1.262949, 0.372549, 0, 1, 1,
0.555685, 0.08376233, 1.835193, 0.3803922, 0, 1, 1,
0.5562882, 1.755618, 0.3580193, 0.3843137, 0, 1, 1,
0.55975, 0.5195736, 0.6636304, 0.3921569, 0, 1, 1,
0.56077, 1.569457, 1.103327, 0.3960784, 0, 1, 1,
0.5654395, 0.7336653, -0.827081, 0.4039216, 0, 1, 1,
0.567623, -0.9516982, 1.789577, 0.4117647, 0, 1, 1,
0.56775, 1.355431, 1.82041, 0.4156863, 0, 1, 1,
0.5686553, -0.115647, 2.537407, 0.4235294, 0, 1, 1,
0.5759249, 1.305903, 1.760423, 0.427451, 0, 1, 1,
0.5777246, 2.191298, -0.3851563, 0.4352941, 0, 1, 1,
0.5858858, 0.4485377, -0.02804393, 0.4392157, 0, 1, 1,
0.590307, 1.236733, -0.2303339, 0.4470588, 0, 1, 1,
0.5906326, -2.222196, 5.011271, 0.4509804, 0, 1, 1,
0.6032554, -0.2634173, 0.1689826, 0.4588235, 0, 1, 1,
0.6044577, 0.8864765, 1.058431, 0.4627451, 0, 1, 1,
0.6098642, 0.08807275, 1.660348, 0.4705882, 0, 1, 1,
0.6209393, 1.730013, 0.3590793, 0.4745098, 0, 1, 1,
0.6229057, 0.1615621, 2.28826, 0.4823529, 0, 1, 1,
0.6347257, 1.46034, 2.273027, 0.4862745, 0, 1, 1,
0.6365426, -0.2732816, 1.254392, 0.4941176, 0, 1, 1,
0.6399258, -1.775531, 2.291679, 0.5019608, 0, 1, 1,
0.6446166, 0.05881964, 1.885696, 0.5058824, 0, 1, 1,
0.6452265, -1.191572, 2.662118, 0.5137255, 0, 1, 1,
0.6461837, -1.820516, 2.543155, 0.5176471, 0, 1, 1,
0.6469489, -1.022622, 1.31107, 0.5254902, 0, 1, 1,
0.6479784, 2.046269, 0.03308376, 0.5294118, 0, 1, 1,
0.6492171, -1.117944, 2.117378, 0.5372549, 0, 1, 1,
0.6531616, -0.08985589, 2.688033, 0.5411765, 0, 1, 1,
0.6552617, -0.1989169, 2.329884, 0.5490196, 0, 1, 1,
0.655682, 1.31461, 1.393195, 0.5529412, 0, 1, 1,
0.6568212, -1.398229, 3.456676, 0.5607843, 0, 1, 1,
0.6570975, -0.0547375, 1.900243, 0.5647059, 0, 1, 1,
0.6609994, 0.3742046, 1.578599, 0.572549, 0, 1, 1,
0.6647795, 0.1281582, 1.710401, 0.5764706, 0, 1, 1,
0.6736457, 1.559175, 0.7763534, 0.5843138, 0, 1, 1,
0.6802807, -0.3790383, 2.730931, 0.5882353, 0, 1, 1,
0.6811532, -0.9937904, 4.658376, 0.5960785, 0, 1, 1,
0.681291, 0.3695147, 0.6343877, 0.6039216, 0, 1, 1,
0.683608, -1.428976, 3.096843, 0.6078432, 0, 1, 1,
0.6850819, 1.067023, -0.1694591, 0.6156863, 0, 1, 1,
0.6869784, -1.750253, 2.373721, 0.6196079, 0, 1, 1,
0.6896282, 1.470939, 0.7072983, 0.627451, 0, 1, 1,
0.6900368, 0.1158291, 0.4750649, 0.6313726, 0, 1, 1,
0.6900387, 0.04227557, 0.7158815, 0.6392157, 0, 1, 1,
0.695614, -0.1558515, 2.595176, 0.6431373, 0, 1, 1,
0.6964576, 0.3001976, 2.5336, 0.6509804, 0, 1, 1,
0.6971728, -0.7028851, 0.6883658, 0.654902, 0, 1, 1,
0.7008199, 0.4542012, 0.4462349, 0.6627451, 0, 1, 1,
0.7018175, -0.2769461, 2.753709, 0.6666667, 0, 1, 1,
0.7020285, 1.371837, -0.2487193, 0.6745098, 0, 1, 1,
0.7054597, -0.8964753, 1.427968, 0.6784314, 0, 1, 1,
0.7062762, -0.2827615, 1.093828, 0.6862745, 0, 1, 1,
0.7105317, -1.394205, 2.490122, 0.6901961, 0, 1, 1,
0.712829, -1.095497, 2.837466, 0.6980392, 0, 1, 1,
0.7136481, -1.604561, 3.555098, 0.7058824, 0, 1, 1,
0.7206449, -1.494474, 2.414045, 0.7098039, 0, 1, 1,
0.7259668, 0.0272017, 2.354678, 0.7176471, 0, 1, 1,
0.7264513, 0.1720556, 1.688466, 0.7215686, 0, 1, 1,
0.7264809, 1.390176, 1.401334, 0.7294118, 0, 1, 1,
0.7267636, -1.235866, 2.434258, 0.7333333, 0, 1, 1,
0.7286561, 0.700009, 0.02423711, 0.7411765, 0, 1, 1,
0.7313323, 1.908859, 0.2516814, 0.7450981, 0, 1, 1,
0.7397273, 1.704482, 0.7621742, 0.7529412, 0, 1, 1,
0.7487257, 1.951036, 1.839984, 0.7568628, 0, 1, 1,
0.757749, -0.04114664, 1.624836, 0.7647059, 0, 1, 1,
0.7642496, 0.3843593, 0.2643904, 0.7686275, 0, 1, 1,
0.7658993, 0.2579021, 0.2525212, 0.7764706, 0, 1, 1,
0.7697625, 0.05278582, 0.6557373, 0.7803922, 0, 1, 1,
0.7699419, 0.8767622, -0.001322607, 0.7882353, 0, 1, 1,
0.7750873, 0.7349923, 2.129002, 0.7921569, 0, 1, 1,
0.7794487, 0.5560394, 2.788926, 0.8, 0, 1, 1,
0.7798524, 0.8759176, 1.321007, 0.8078431, 0, 1, 1,
0.7822127, 0.6716112, 0.1874967, 0.8117647, 0, 1, 1,
0.7837177, 1.341854, -0.5721368, 0.8196079, 0, 1, 1,
0.7855462, -0.3237911, 3.069439, 0.8235294, 0, 1, 1,
0.7872426, -0.8770025, 4.343545, 0.8313726, 0, 1, 1,
0.7878748, -1.536469, 1.805511, 0.8352941, 0, 1, 1,
0.8100107, 0.4520109, 0.9544168, 0.8431373, 0, 1, 1,
0.8179995, -0.8446596, 0.9914822, 0.8470588, 0, 1, 1,
0.8186756, 1.407272, -0.7883965, 0.854902, 0, 1, 1,
0.820062, 0.0701578, 0.4810073, 0.8588235, 0, 1, 1,
0.8237886, 0.2670313, 0.8842039, 0.8666667, 0, 1, 1,
0.8245479, 0.1473019, 2.073972, 0.8705882, 0, 1, 1,
0.8250089, -1.391623, 2.50949, 0.8784314, 0, 1, 1,
0.8261554, 0.720865, 0.3366554, 0.8823529, 0, 1, 1,
0.8266822, 1.901513, 1.947528, 0.8901961, 0, 1, 1,
0.8320595, 1.236955, 1.425592, 0.8941177, 0, 1, 1,
0.8327731, -0.003352677, 2.950732, 0.9019608, 0, 1, 1,
0.838025, -0.1744629, 1.721317, 0.9098039, 0, 1, 1,
0.8385, 0.1445076, 1.681793, 0.9137255, 0, 1, 1,
0.8389142, -0.4811378, 1.450532, 0.9215686, 0, 1, 1,
0.8392398, 0.7390315, -0.2979648, 0.9254902, 0, 1, 1,
0.8428798, -2.24168, 3.484908, 0.9333333, 0, 1, 1,
0.8451569, 0.4811233, 1.164507, 0.9372549, 0, 1, 1,
0.8491851, 1.834, -0.4055886, 0.945098, 0, 1, 1,
0.85015, 0.444872, 1.323293, 0.9490196, 0, 1, 1,
0.853576, 0.8975067, 0.2378378, 0.9568627, 0, 1, 1,
0.8591036, 0.2387041, 1.081869, 0.9607843, 0, 1, 1,
0.8623599, -0.739356, 1.9427, 0.9686275, 0, 1, 1,
0.8722141, 0.1016397, 1.647334, 0.972549, 0, 1, 1,
0.8773242, 0.9764131, -1.403297, 0.9803922, 0, 1, 1,
0.8815871, -1.767994, 5.248689, 0.9843137, 0, 1, 1,
0.8846024, -1.895817, 1.887277, 0.9921569, 0, 1, 1,
0.8853425, 0.3091867, 2.122544, 0.9960784, 0, 1, 1,
0.887786, -0.01739935, 0.4700556, 1, 0, 0.9960784, 1,
0.8883103, 0.1998091, 2.238441, 1, 0, 0.9882353, 1,
0.8920138, 0.1323593, 0.6757256, 1, 0, 0.9843137, 1,
0.8958651, -0.8682514, 2.940178, 1, 0, 0.9764706, 1,
0.901027, 0.8797562, 2.002478, 1, 0, 0.972549, 1,
0.9042883, 0.65365, 1.439637, 1, 0, 0.9647059, 1,
0.9059658, 0.6654523, 1.242539, 1, 0, 0.9607843, 1,
0.9107662, -0.1662041, 0.8873833, 1, 0, 0.9529412, 1,
0.9144364, -0.8385779, 2.722543, 1, 0, 0.9490196, 1,
0.9146268, 0.1129716, 1.922869, 1, 0, 0.9411765, 1,
0.918634, 0.7318165, 3.240343, 1, 0, 0.9372549, 1,
0.9302891, -0.721739, 2.858537, 1, 0, 0.9294118, 1,
0.9375151, 0.4802942, 2.217344, 1, 0, 0.9254902, 1,
0.946898, 0.3920971, -0.351428, 1, 0, 0.9176471, 1,
0.9599594, 0.3836313, 1.455416, 1, 0, 0.9137255, 1,
0.9641606, -0.9415693, 3.285428, 1, 0, 0.9058824, 1,
0.9690908, 0.1276186, 1.311769, 1, 0, 0.9019608, 1,
0.9744269, -0.3100985, 1.910792, 1, 0, 0.8941177, 1,
0.9766725, 0.6826076, -0.07326978, 1, 0, 0.8862745, 1,
0.9860122, 1.063346, 0.5535426, 1, 0, 0.8823529, 1,
0.9862253, 0.04685477, 0.5058469, 1, 0, 0.8745098, 1,
1.003605, -0.1670868, 1.516673, 1, 0, 0.8705882, 1,
1.011164, -0.6108073, 1.171072, 1, 0, 0.8627451, 1,
1.011879, 0.2150371, 0.9734418, 1, 0, 0.8588235, 1,
1.015768, -0.4660644, 3.594414, 1, 0, 0.8509804, 1,
1.021594, -0.3295128, 2.564392, 1, 0, 0.8470588, 1,
1.022129, -0.6727515, 2.110271, 1, 0, 0.8392157, 1,
1.025452, -0.9081953, 2.180303, 1, 0, 0.8352941, 1,
1.029385, 0.7239104, 0.9800801, 1, 0, 0.827451, 1,
1.030597, -0.8484698, 2.475033, 1, 0, 0.8235294, 1,
1.032956, -1.021491, 1.60107, 1, 0, 0.8156863, 1,
1.035363, -0.8479136, 3.027295, 1, 0, 0.8117647, 1,
1.039066, -0.9255518, 3.167102, 1, 0, 0.8039216, 1,
1.044392, 0.7542011, 1.289881, 1, 0, 0.7960784, 1,
1.049549, -0.7400814, 2.698355, 1, 0, 0.7921569, 1,
1.056713, -1.310366, 2.470993, 1, 0, 0.7843137, 1,
1.058667, 1.903124, -1.605762, 1, 0, 0.7803922, 1,
1.06337, -0.2053956, 1.712468, 1, 0, 0.772549, 1,
1.064862, 0.2690039, 0.4701328, 1, 0, 0.7686275, 1,
1.06834, 0.1064776, -0.07454433, 1, 0, 0.7607843, 1,
1.072634, -1.91518, 3.348187, 1, 0, 0.7568628, 1,
1.081151, 0.2877637, 2.791143, 1, 0, 0.7490196, 1,
1.095961, -0.7654266, 1.143969, 1, 0, 0.7450981, 1,
1.102719, 0.4059088, 1.301743, 1, 0, 0.7372549, 1,
1.108473, 1.826631, 0.6106207, 1, 0, 0.7333333, 1,
1.112765, -0.8548512, 2.727192, 1, 0, 0.7254902, 1,
1.121182, -0.3955503, 2.229381, 1, 0, 0.7215686, 1,
1.125984, -0.5692738, 2.506197, 1, 0, 0.7137255, 1,
1.12759, 1.631918, 1.395512, 1, 0, 0.7098039, 1,
1.12791, -1.150999, 2.72303, 1, 0, 0.7019608, 1,
1.129062, -1.594588, 2.872859, 1, 0, 0.6941177, 1,
1.135085, -0.5956024, 2.000034, 1, 0, 0.6901961, 1,
1.140075, -0.5285802, 3.306969, 1, 0, 0.682353, 1,
1.140326, -0.881339, 2.341197, 1, 0, 0.6784314, 1,
1.142629, 1.651695, -0.753992, 1, 0, 0.6705883, 1,
1.144481, 1.037168, 0.6958713, 1, 0, 0.6666667, 1,
1.155398, -0.5690808, 1.418966, 1, 0, 0.6588235, 1,
1.159969, -0.6179513, 2.269908, 1, 0, 0.654902, 1,
1.164016, 0.1145857, 1.49045, 1, 0, 0.6470588, 1,
1.166944, 0.1806788, 3.110122, 1, 0, 0.6431373, 1,
1.168896, -0.5129518, 4.195548, 1, 0, 0.6352941, 1,
1.177007, -0.6334175, -0.7449916, 1, 0, 0.6313726, 1,
1.184572, -0.6146018, 4.795981, 1, 0, 0.6235294, 1,
1.187269, -0.5099478, 2.058811, 1, 0, 0.6196079, 1,
1.187629, -0.328426, 2.115471, 1, 0, 0.6117647, 1,
1.187871, -0.3311546, 1.504194, 1, 0, 0.6078432, 1,
1.188107, -1.469127, 3.138811, 1, 0, 0.6, 1,
1.188243, 0.7159001, 1.979917, 1, 0, 0.5921569, 1,
1.189876, -0.9691619, 2.624377, 1, 0, 0.5882353, 1,
1.195665, 1.077976, 1.753178, 1, 0, 0.5803922, 1,
1.198287, 1.067433, 2.459259, 1, 0, 0.5764706, 1,
1.201524, -1.035016, 1.351495, 1, 0, 0.5686275, 1,
1.203934, -0.3247001, 1.028636, 1, 0, 0.5647059, 1,
1.20942, -0.4978279, 1.237989, 1, 0, 0.5568628, 1,
1.222606, -0.6373696, 1.806096, 1, 0, 0.5529412, 1,
1.227361, 0.2037252, 0.7915752, 1, 0, 0.5450981, 1,
1.230886, -0.7516263, 3.196326, 1, 0, 0.5411765, 1,
1.232149, -1.177337, 0.7505734, 1, 0, 0.5333334, 1,
1.242421, 1.074939, 1.242655, 1, 0, 0.5294118, 1,
1.247232, 0.1603446, 1.767095, 1, 0, 0.5215687, 1,
1.260778, 2.258991, 1.317028, 1, 0, 0.5176471, 1,
1.266381, 0.05307202, 1.02178, 1, 0, 0.509804, 1,
1.278376, 0.5633755, 1.390602, 1, 0, 0.5058824, 1,
1.279509, -0.535669, 2.956381, 1, 0, 0.4980392, 1,
1.28308, -0.05329592, 1.319011, 1, 0, 0.4901961, 1,
1.310791, -0.7789295, 1.121126, 1, 0, 0.4862745, 1,
1.311796, -2.001566, 4.061635, 1, 0, 0.4784314, 1,
1.313795, -1.022893, 1.856085, 1, 0, 0.4745098, 1,
1.31918, 0.7574258, 2.058556, 1, 0, 0.4666667, 1,
1.319612, -0.4430763, 4.206719, 1, 0, 0.4627451, 1,
1.325168, 1.533328, 1.062608, 1, 0, 0.454902, 1,
1.340745, -2.870624, 0.3722312, 1, 0, 0.4509804, 1,
1.347283, 0.2152602, 1.113634, 1, 0, 0.4431373, 1,
1.348944, -1.086479, 1.194366, 1, 0, 0.4392157, 1,
1.357228, -0.3484434, 3.220264, 1, 0, 0.4313726, 1,
1.364235, -1.510549, 0.2650032, 1, 0, 0.427451, 1,
1.372681, 0.4393651, 1.213763, 1, 0, 0.4196078, 1,
1.389288, -0.7782328, 2.556692, 1, 0, 0.4156863, 1,
1.389913, -0.5451272, 0.9436495, 1, 0, 0.4078431, 1,
1.393608, -0.4237824, 0.03657087, 1, 0, 0.4039216, 1,
1.406443, -0.5537021, 1.156533, 1, 0, 0.3960784, 1,
1.410841, -1.358905, 2.536174, 1, 0, 0.3882353, 1,
1.416346, -0.9716244, 0.9844818, 1, 0, 0.3843137, 1,
1.436742, 0.9353189, -0.03465868, 1, 0, 0.3764706, 1,
1.444619, 0.7178377, 0.2286686, 1, 0, 0.372549, 1,
1.449646, 0.9739933, 0.7749695, 1, 0, 0.3647059, 1,
1.465737, -1.025208, 0.7151181, 1, 0, 0.3607843, 1,
1.47842, -0.1311935, 0.6608458, 1, 0, 0.3529412, 1,
1.493312, -0.7648726, 3.015911, 1, 0, 0.3490196, 1,
1.497952, -0.08029878, -0.4514161, 1, 0, 0.3411765, 1,
1.500492, 1.398952, 1.550964, 1, 0, 0.3372549, 1,
1.503855, -2.185147, 3.484152, 1, 0, 0.3294118, 1,
1.512214, 0.6447737, 2.240702, 1, 0, 0.3254902, 1,
1.533537, 0.2420657, 1.603358, 1, 0, 0.3176471, 1,
1.535865, -0.1705631, 2.478467, 1, 0, 0.3137255, 1,
1.538276, 1.578791, 0.2777698, 1, 0, 0.3058824, 1,
1.544972, -0.646832, 2.28415, 1, 0, 0.2980392, 1,
1.545298, 0.9352984, 0.4736362, 1, 0, 0.2941177, 1,
1.561713, -0.0861406, 1.59859, 1, 0, 0.2862745, 1,
1.565821, 0.9448277, 0.9359831, 1, 0, 0.282353, 1,
1.574498, -0.3416775, 0.7053068, 1, 0, 0.2745098, 1,
1.609194, 1.985313, -0.189647, 1, 0, 0.2705882, 1,
1.612913, 0.8709283, 1.394961, 1, 0, 0.2627451, 1,
1.630105, 0.9465281, 2.562304, 1, 0, 0.2588235, 1,
1.631062, 0.07203849, 3.367869, 1, 0, 0.2509804, 1,
1.648475, -1.441838, 1.634673, 1, 0, 0.2470588, 1,
1.663053, -0.4968919, 1.769404, 1, 0, 0.2392157, 1,
1.691936, -0.5178868, 1.809613, 1, 0, 0.2352941, 1,
1.693659, -1.510369, 1.407895, 1, 0, 0.227451, 1,
1.696675, -0.2991149, 3.554018, 1, 0, 0.2235294, 1,
1.707448, -0.1744952, 0.9627806, 1, 0, 0.2156863, 1,
1.721259, 1.055229, -0.08732947, 1, 0, 0.2117647, 1,
1.7301, -0.8439002, 2.407542, 1, 0, 0.2039216, 1,
1.740602, -0.7505643, 0.7437217, 1, 0, 0.1960784, 1,
1.741956, 0.06443723, 1.804408, 1, 0, 0.1921569, 1,
1.746116, -0.2019008, 2.029436, 1, 0, 0.1843137, 1,
1.764851, 0.9730783, 1.39933, 1, 0, 0.1803922, 1,
1.76772, 1.048339, 1.43905, 1, 0, 0.172549, 1,
1.777667, -0.4782532, 1.435692, 1, 0, 0.1686275, 1,
1.784922, 0.9091253, 1.21777, 1, 0, 0.1607843, 1,
1.804448, -0.5159433, 0.8912928, 1, 0, 0.1568628, 1,
1.827055, -1.255722, 1.664426, 1, 0, 0.1490196, 1,
1.850649, -1.943077, 1.616705, 1, 0, 0.145098, 1,
1.875291, 0.9891529, 0.906123, 1, 0, 0.1372549, 1,
1.907893, -0.7782339, 3.465516, 1, 0, 0.1333333, 1,
1.913967, 1.681321, 0.1924632, 1, 0, 0.1254902, 1,
1.921621, -0.7943913, 1.052552, 1, 0, 0.1215686, 1,
1.941062, -0.457834, 0.009337213, 1, 0, 0.1137255, 1,
1.965922, -1.530084, 2.248625, 1, 0, 0.1098039, 1,
1.968858, 0.02715751, 2.174062, 1, 0, 0.1019608, 1,
2.000786, 1.836249, 0.2102999, 1, 0, 0.09411765, 1,
2.006776, 1.245204, 0.8365991, 1, 0, 0.09019608, 1,
2.01774, 0.9933097, 2.947052, 1, 0, 0.08235294, 1,
2.073617, 1.606032, 1.9828, 1, 0, 0.07843138, 1,
2.128525, -0.515431, 2.355815, 1, 0, 0.07058824, 1,
2.17109, 0.6644622, 1.179236, 1, 0, 0.06666667, 1,
2.231253, 0.6512709, 1.601601, 1, 0, 0.05882353, 1,
2.249395, 0.4832379, 1.227126, 1, 0, 0.05490196, 1,
2.254699, 0.004283256, 0.3614875, 1, 0, 0.04705882, 1,
2.444504, 1.137871, 1.45296, 1, 0, 0.04313726, 1,
2.668573, 0.3197885, 0.9592966, 1, 0, 0.03529412, 1,
2.786691, -1.704129, 2.328484, 1, 0, 0.03137255, 1,
3.44657, 0.6383672, 1.443761, 1, 0, 0.02352941, 1,
3.451323, -0.1416011, 2.107759, 1, 0, 0.01960784, 1,
3.458572, -0.8519588, 2.271414, 1, 0, 0.01176471, 1,
3.652998, -1.215136, 1.466338, 1, 0, 0.007843138, 1
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
0.02471995, -3.928941, -7.475395, 0, -0.5, 0.5, 0.5,
0.02471995, -3.928941, -7.475395, 1, -0.5, 0.5, 0.5,
0.02471995, -3.928941, -7.475395, 1, 1.5, 0.5, 0.5,
0.02471995, -3.928941, -7.475395, 0, 1.5, 0.5, 0.5
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
-4.833545, 0.03565359, -7.475395, 0, -0.5, 0.5, 0.5,
-4.833545, 0.03565359, -7.475395, 1, -0.5, 0.5, 0.5,
-4.833545, 0.03565359, -7.475395, 1, 1.5, 0.5, 0.5,
-4.833545, 0.03565359, -7.475395, 0, 1.5, 0.5, 0.5
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
-4.833545, -3.928941, -0.1912787, 0, -0.5, 0.5, 0.5,
-4.833545, -3.928941, -0.1912787, 1, -0.5, 0.5, 0.5,
-4.833545, -3.928941, -0.1912787, 1, 1.5, 0.5, 0.5,
-4.833545, -3.928941, -0.1912787, 0, 1.5, 0.5, 0.5
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
-2, -3.014035, -5.794445,
2, -3.014035, -5.794445,
-2, -3.014035, -5.794445,
-2, -3.166519, -6.074604,
0, -3.014035, -5.794445,
0, -3.166519, -6.074604,
2, -3.014035, -5.794445,
2, -3.166519, -6.074604
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
-2, -3.471488, -6.63492, 0, -0.5, 0.5, 0.5,
-2, -3.471488, -6.63492, 1, -0.5, 0.5, 0.5,
-2, -3.471488, -6.63492, 1, 1.5, 0.5, 0.5,
-2, -3.471488, -6.63492, 0, 1.5, 0.5, 0.5,
0, -3.471488, -6.63492, 0, -0.5, 0.5, 0.5,
0, -3.471488, -6.63492, 1, -0.5, 0.5, 0.5,
0, -3.471488, -6.63492, 1, 1.5, 0.5, 0.5,
0, -3.471488, -6.63492, 0, 1.5, 0.5, 0.5,
2, -3.471488, -6.63492, 0, -0.5, 0.5, 0.5,
2, -3.471488, -6.63492, 1, -0.5, 0.5, 0.5,
2, -3.471488, -6.63492, 1, 1.5, 0.5, 0.5,
2, -3.471488, -6.63492, 0, 1.5, 0.5, 0.5
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
-3.712407, -2, -5.794445,
-3.712407, 2, -5.794445,
-3.712407, -2, -5.794445,
-3.899263, -2, -6.074604,
-3.712407, -1, -5.794445,
-3.899263, -1, -6.074604,
-3.712407, 0, -5.794445,
-3.899263, 0, -6.074604,
-3.712407, 1, -5.794445,
-3.899263, 1, -6.074604,
-3.712407, 2, -5.794445,
-3.899263, 2, -6.074604
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
-4.272976, -2, -6.63492, 0, -0.5, 0.5, 0.5,
-4.272976, -2, -6.63492, 1, -0.5, 0.5, 0.5,
-4.272976, -2, -6.63492, 1, 1.5, 0.5, 0.5,
-4.272976, -2, -6.63492, 0, 1.5, 0.5, 0.5,
-4.272976, -1, -6.63492, 0, -0.5, 0.5, 0.5,
-4.272976, -1, -6.63492, 1, -0.5, 0.5, 0.5,
-4.272976, -1, -6.63492, 1, 1.5, 0.5, 0.5,
-4.272976, -1, -6.63492, 0, 1.5, 0.5, 0.5,
-4.272976, 0, -6.63492, 0, -0.5, 0.5, 0.5,
-4.272976, 0, -6.63492, 1, -0.5, 0.5, 0.5,
-4.272976, 0, -6.63492, 1, 1.5, 0.5, 0.5,
-4.272976, 0, -6.63492, 0, 1.5, 0.5, 0.5,
-4.272976, 1, -6.63492, 0, -0.5, 0.5, 0.5,
-4.272976, 1, -6.63492, 1, -0.5, 0.5, 0.5,
-4.272976, 1, -6.63492, 1, 1.5, 0.5, 0.5,
-4.272976, 1, -6.63492, 0, 1.5, 0.5, 0.5,
-4.272976, 2, -6.63492, 0, -0.5, 0.5, 0.5,
-4.272976, 2, -6.63492, 1, -0.5, 0.5, 0.5,
-4.272976, 2, -6.63492, 1, 1.5, 0.5, 0.5,
-4.272976, 2, -6.63492, 0, 1.5, 0.5, 0.5
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
-3.712407, -3.014035, -4,
-3.712407, -3.014035, 4,
-3.712407, -3.014035, -4,
-3.899263, -3.166519, -4,
-3.712407, -3.014035, -2,
-3.899263, -3.166519, -2,
-3.712407, -3.014035, 0,
-3.899263, -3.166519, 0,
-3.712407, -3.014035, 2,
-3.899263, -3.166519, 2,
-3.712407, -3.014035, 4,
-3.899263, -3.166519, 4
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
-4.272976, -3.471488, -4, 0, -0.5, 0.5, 0.5,
-4.272976, -3.471488, -4, 1, -0.5, 0.5, 0.5,
-4.272976, -3.471488, -4, 1, 1.5, 0.5, 0.5,
-4.272976, -3.471488, -4, 0, 1.5, 0.5, 0.5,
-4.272976, -3.471488, -2, 0, -0.5, 0.5, 0.5,
-4.272976, -3.471488, -2, 1, -0.5, 0.5, 0.5,
-4.272976, -3.471488, -2, 1, 1.5, 0.5, 0.5,
-4.272976, -3.471488, -2, 0, 1.5, 0.5, 0.5,
-4.272976, -3.471488, 0, 0, -0.5, 0.5, 0.5,
-4.272976, -3.471488, 0, 1, -0.5, 0.5, 0.5,
-4.272976, -3.471488, 0, 1, 1.5, 0.5, 0.5,
-4.272976, -3.471488, 0, 0, 1.5, 0.5, 0.5,
-4.272976, -3.471488, 2, 0, -0.5, 0.5, 0.5,
-4.272976, -3.471488, 2, 1, -0.5, 0.5, 0.5,
-4.272976, -3.471488, 2, 1, 1.5, 0.5, 0.5,
-4.272976, -3.471488, 2, 0, 1.5, 0.5, 0.5,
-4.272976, -3.471488, 4, 0, -0.5, 0.5, 0.5,
-4.272976, -3.471488, 4, 1, -0.5, 0.5, 0.5,
-4.272976, -3.471488, 4, 1, 1.5, 0.5, 0.5,
-4.272976, -3.471488, 4, 0, 1.5, 0.5, 0.5
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
-3.712407, -3.014035, -5.794445,
-3.712407, 3.085342, -5.794445,
-3.712407, -3.014035, 5.411888,
-3.712407, 3.085342, 5.411888,
-3.712407, -3.014035, -5.794445,
-3.712407, -3.014035, 5.411888,
-3.712407, 3.085342, -5.794445,
-3.712407, 3.085342, 5.411888,
-3.712407, -3.014035, -5.794445,
3.761847, -3.014035, -5.794445,
-3.712407, -3.014035, 5.411888,
3.761847, -3.014035, 5.411888,
-3.712407, 3.085342, -5.794445,
3.761847, 3.085342, -5.794445,
-3.712407, 3.085342, 5.411888,
3.761847, 3.085342, 5.411888,
3.761847, -3.014035, -5.794445,
3.761847, 3.085342, -5.794445,
3.761847, -3.014035, 5.411888,
3.761847, 3.085342, 5.411888,
3.761847, -3.014035, -5.794445,
3.761847, -3.014035, 5.411888,
3.761847, 3.085342, -5.794445,
3.761847, 3.085342, 5.411888
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
var radius = 7.895852;
var distance = 35.12954;
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
mvMatrix.translate( -0.02471995, -0.03565359, 0.1912787 );
mvMatrix.scale( 1.142208, 1.399676, 0.7618147 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.12954);
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


