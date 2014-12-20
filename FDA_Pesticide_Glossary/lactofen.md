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
-3.384208, 0.3329606, 0.3289827, 1, 0, 0, 1,
-2.981117, -1.715746, -1.576571, 1, 0.007843138, 0, 1,
-2.830035, -0.4015581, -3.24521, 1, 0.01176471, 0, 1,
-2.37614, -1.569694, -0.6773977, 1, 0.01960784, 0, 1,
-2.332669, 0.3127055, -2.023175, 1, 0.02352941, 0, 1,
-2.3055, 0.7855912, -1.814191, 1, 0.03137255, 0, 1,
-2.272671, 1.397192, -3.137497, 1, 0.03529412, 0, 1,
-2.264479, -0.2647231, 0.0918075, 1, 0.04313726, 0, 1,
-2.214564, -1.561081, -1.085175, 1, 0.04705882, 0, 1,
-2.20956, 0.6052337, 0.6490797, 1, 0.05490196, 0, 1,
-2.19565, 1.097787, -2.278371, 1, 0.05882353, 0, 1,
-2.172745, -2.079874, -0.4981492, 1, 0.06666667, 0, 1,
-2.162732, 0.09341183, 0.621802, 1, 0.07058824, 0, 1,
-2.152723, -0.6436445, -0.4484881, 1, 0.07843138, 0, 1,
-2.136706, -0.4475779, -0.6981058, 1, 0.08235294, 0, 1,
-2.128205, -0.6448205, -0.8609183, 1, 0.09019608, 0, 1,
-2.123874, -1.468564, -3.224842, 1, 0.09411765, 0, 1,
-2.108836, 0.07419991, -0.2813882, 1, 0.1019608, 0, 1,
-2.104036, 0.9715643, 1.119414, 1, 0.1098039, 0, 1,
-2.093876, 0.3457397, -1.663441, 1, 0.1137255, 0, 1,
-1.980595, 2.097688, 0.1827195, 1, 0.1215686, 0, 1,
-1.971968, -0.0261702, -1.979877, 1, 0.1254902, 0, 1,
-1.961222, 1.542092, 0.06541094, 1, 0.1333333, 0, 1,
-1.947885, -0.7850888, -2.153941, 1, 0.1372549, 0, 1,
-1.943341, 1.090031, -0.1941192, 1, 0.145098, 0, 1,
-1.935318, -0.2271006, -0.9140459, 1, 0.1490196, 0, 1,
-1.898319, -2.152525, -2.386308, 1, 0.1568628, 0, 1,
-1.895137, -1.396425, -2.103192, 1, 0.1607843, 0, 1,
-1.889968, 1.456958, 0.7152398, 1, 0.1686275, 0, 1,
-1.885682, -0.6861034, -3.37934, 1, 0.172549, 0, 1,
-1.875955, -0.4459828, -2.617209, 1, 0.1803922, 0, 1,
-1.849643, -2.449832, -3.679106, 1, 0.1843137, 0, 1,
-1.837216, -1.211583, -2.964041, 1, 0.1921569, 0, 1,
-1.814585, 0.2618654, -2.14298, 1, 0.1960784, 0, 1,
-1.798234, 0.7082329, 0.003425221, 1, 0.2039216, 0, 1,
-1.775042, -0.5075792, -4.135491, 1, 0.2117647, 0, 1,
-1.774192, 1.15399, -2.982227, 1, 0.2156863, 0, 1,
-1.768825, 0.9404905, 0.2126557, 1, 0.2235294, 0, 1,
-1.766905, 0.3007127, -0.7034853, 1, 0.227451, 0, 1,
-1.748496, 0.7222211, -0.4844241, 1, 0.2352941, 0, 1,
-1.748206, 0.1388589, -1.967616, 1, 0.2392157, 0, 1,
-1.738144, -0.09935775, -1.948781, 1, 0.2470588, 0, 1,
-1.734342, 1.621231, -1.120369, 1, 0.2509804, 0, 1,
-1.706685, 0.7166836, -1.292085, 1, 0.2588235, 0, 1,
-1.699088, -0.5902158, -2.388226, 1, 0.2627451, 0, 1,
-1.686165, 0.9752491, -0.3199552, 1, 0.2705882, 0, 1,
-1.679616, 1.392208, -1.774186, 1, 0.2745098, 0, 1,
-1.664966, -1.381384, -2.239528, 1, 0.282353, 0, 1,
-1.643774, 0.2667275, -1.844132, 1, 0.2862745, 0, 1,
-1.640979, -1.632558, -2.251937, 1, 0.2941177, 0, 1,
-1.633237, -0.005056029, -1.237784, 1, 0.3019608, 0, 1,
-1.618151, -0.7938957, -3.211957, 1, 0.3058824, 0, 1,
-1.605946, -1.030363, -1.99878, 1, 0.3137255, 0, 1,
-1.60423, 0.8003622, -1.803002, 1, 0.3176471, 0, 1,
-1.583779, 0.7237253, -1.844097, 1, 0.3254902, 0, 1,
-1.566441, 0.1875408, -1.073923, 1, 0.3294118, 0, 1,
-1.551406, 0.2116511, -2.230069, 1, 0.3372549, 0, 1,
-1.548062, -0.2526127, -2.644594, 1, 0.3411765, 0, 1,
-1.545381, -1.216339, -2.025574, 1, 0.3490196, 0, 1,
-1.541012, -0.710456, -2.283471, 1, 0.3529412, 0, 1,
-1.532068, -0.4897625, -1.841931, 1, 0.3607843, 0, 1,
-1.511968, 1.121502, -0.3434791, 1, 0.3647059, 0, 1,
-1.503691, 0.08805718, -1.631418, 1, 0.372549, 0, 1,
-1.493709, 0.2783028, -1.905955, 1, 0.3764706, 0, 1,
-1.474001, -0.4048161, -1.083322, 1, 0.3843137, 0, 1,
-1.467089, -0.6694099, -2.885504, 1, 0.3882353, 0, 1,
-1.447531, 1.192998, -1.835121, 1, 0.3960784, 0, 1,
-1.437898, -0.6014586, -2.708039, 1, 0.4039216, 0, 1,
-1.426468, 1.275422, -0.2531407, 1, 0.4078431, 0, 1,
-1.424568, 0.4107989, -1.402021, 1, 0.4156863, 0, 1,
-1.388737, 0.5375924, -3.717382, 1, 0.4196078, 0, 1,
-1.381075, -1.00141, -1.429204, 1, 0.427451, 0, 1,
-1.378507, -0.1830269, -0.5982762, 1, 0.4313726, 0, 1,
-1.36904, -2.062232, -2.707147, 1, 0.4392157, 0, 1,
-1.36861, -1.689115, -2.664081, 1, 0.4431373, 0, 1,
-1.366067, -1.46698, -2.655822, 1, 0.4509804, 0, 1,
-1.348366, 0.2720331, -2.182025, 1, 0.454902, 0, 1,
-1.323402, -1.296914, -1.16212, 1, 0.4627451, 0, 1,
-1.309051, -0.1800176, -0.1440091, 1, 0.4666667, 0, 1,
-1.305268, -1.668934, -3.220289, 1, 0.4745098, 0, 1,
-1.304199, 2.634853, 0.6805245, 1, 0.4784314, 0, 1,
-1.298426, 0.7673024, -0.9902437, 1, 0.4862745, 0, 1,
-1.297954, 0.8091351, -1.547141, 1, 0.4901961, 0, 1,
-1.289097, 1.620926, -0.327966, 1, 0.4980392, 0, 1,
-1.284489, -0.7512404, -1.170968, 1, 0.5058824, 0, 1,
-1.260256, -0.6935341, -1.392321, 1, 0.509804, 0, 1,
-1.258302, 1.152084, -0.700442, 1, 0.5176471, 0, 1,
-1.255801, -0.2333289, -2.269084, 1, 0.5215687, 0, 1,
-1.254256, -0.2692373, -3.135037, 1, 0.5294118, 0, 1,
-1.231908, -0.02366067, -1.089651, 1, 0.5333334, 0, 1,
-1.220104, -1.739062, -2.874902, 1, 0.5411765, 0, 1,
-1.213267, 0.5340573, 0.3386156, 1, 0.5450981, 0, 1,
-1.204201, -1.052244, -2.329346, 1, 0.5529412, 0, 1,
-1.200067, 1.319829, 1.659544, 1, 0.5568628, 0, 1,
-1.19654, 0.8172309, -2.222259, 1, 0.5647059, 0, 1,
-1.196035, 0.9287, -0.6085508, 1, 0.5686275, 0, 1,
-1.19528, -0.5520834, -1.697582, 1, 0.5764706, 0, 1,
-1.189847, -0.2201798, -2.682559, 1, 0.5803922, 0, 1,
-1.187619, -1.905339, -2.836116, 1, 0.5882353, 0, 1,
-1.187148, 0.5920797, -0.9705644, 1, 0.5921569, 0, 1,
-1.173757, 0.2277077, -2.091737, 1, 0.6, 0, 1,
-1.17244, -0.8169951, -0.2845164, 1, 0.6078432, 0, 1,
-1.171393, -0.5276392, -1.727175, 1, 0.6117647, 0, 1,
-1.166704, -0.7271262, -3.338388, 1, 0.6196079, 0, 1,
-1.164349, -0.1648003, -1.83525, 1, 0.6235294, 0, 1,
-1.162928, -0.5482392, -3.025683, 1, 0.6313726, 0, 1,
-1.161065, -0.4776978, -1.061472, 1, 0.6352941, 0, 1,
-1.149966, 0.8121395, -0.7046868, 1, 0.6431373, 0, 1,
-1.13721, 0.4830382, 1.055385, 1, 0.6470588, 0, 1,
-1.127138, -1.164373, -0.9476925, 1, 0.654902, 0, 1,
-1.123004, -0.5836871, -3.186278, 1, 0.6588235, 0, 1,
-1.110095, -0.599307, -0.3700208, 1, 0.6666667, 0, 1,
-1.11009, -0.481692, -2.627497, 1, 0.6705883, 0, 1,
-1.104028, -0.444221, -1.059666, 1, 0.6784314, 0, 1,
-1.10341, 0.295144, -0.4848994, 1, 0.682353, 0, 1,
-1.100396, -0.280317, -1.642241, 1, 0.6901961, 0, 1,
-1.098476, 0.4926623, -1.023152, 1, 0.6941177, 0, 1,
-1.09718, 1.902142, -0.9862363, 1, 0.7019608, 0, 1,
-1.090081, 0.5190676, -1.079804, 1, 0.7098039, 0, 1,
-1.085467, 0.0368538, -0.888642, 1, 0.7137255, 0, 1,
-1.083343, -0.4674455, -1.985919, 1, 0.7215686, 0, 1,
-1.079254, -0.1402458, -2.121343, 1, 0.7254902, 0, 1,
-1.060638, -0.333869, -1.592989, 1, 0.7333333, 0, 1,
-1.060096, 1.166268, -3.589809, 1, 0.7372549, 0, 1,
-1.058185, 1.087231, 0.1779508, 1, 0.7450981, 0, 1,
-1.051763, -0.8282758, -2.382058, 1, 0.7490196, 0, 1,
-1.051557, -0.4057026, -1.640466, 1, 0.7568628, 0, 1,
-1.048842, 0.2519127, -1.71351, 1, 0.7607843, 0, 1,
-1.03821, 0.7966638, -0.9958935, 1, 0.7686275, 0, 1,
-1.023884, 0.2990662, -2.790707, 1, 0.772549, 0, 1,
-1.015405, 1.166618, -1.417766, 1, 0.7803922, 0, 1,
-1.013207, 0.3742204, -1.120052, 1, 0.7843137, 0, 1,
-1.01167, -1.473216, -2.845572, 1, 0.7921569, 0, 1,
-1.003379, -1.959482, -3.67676, 1, 0.7960784, 0, 1,
-0.9994392, 0.5451919, -0.3376529, 1, 0.8039216, 0, 1,
-0.9985532, 0.6578347, -2.401403, 1, 0.8117647, 0, 1,
-0.9961435, -0.1437922, -1.851551, 1, 0.8156863, 0, 1,
-0.9862338, -0.4566859, -1.87545, 1, 0.8235294, 0, 1,
-0.9809053, 1.036154, 0.8701926, 1, 0.827451, 0, 1,
-0.9805, -0.9120975, -3.431817, 1, 0.8352941, 0, 1,
-0.9794089, 0.6616524, 1.478663, 1, 0.8392157, 0, 1,
-0.9779781, 0.4176784, -0.4182956, 1, 0.8470588, 0, 1,
-0.9762453, -1.595054, -2.36819, 1, 0.8509804, 0, 1,
-0.9759898, -1.522116, -3.504158, 1, 0.8588235, 0, 1,
-0.9722223, 0.7188444, -2.216887, 1, 0.8627451, 0, 1,
-0.9706444, 0.6930159, -1.714724, 1, 0.8705882, 0, 1,
-0.9664121, -1.083468, -0.4952523, 1, 0.8745098, 0, 1,
-0.9659805, -0.06735694, -1.728247, 1, 0.8823529, 0, 1,
-0.9467385, -0.2902066, -2.452971, 1, 0.8862745, 0, 1,
-0.9372284, -0.01051587, -2.49331, 1, 0.8941177, 0, 1,
-0.9348459, -0.4908508, -3.980248, 1, 0.8980392, 0, 1,
-0.9338558, -0.837638, -3.560602, 1, 0.9058824, 0, 1,
-0.931014, 0.7540838, -1.568112, 1, 0.9137255, 0, 1,
-0.9306582, -1.80252, -1.913188, 1, 0.9176471, 0, 1,
-0.9259184, -1.561007, -2.012194, 1, 0.9254902, 0, 1,
-0.9206459, -0.04037884, -1.967479, 1, 0.9294118, 0, 1,
-0.9189918, 1.414675, -0.5840712, 1, 0.9372549, 0, 1,
-0.915397, 1.873335, -1.722672, 1, 0.9411765, 0, 1,
-0.9142379, -0.8723149, -2.839261, 1, 0.9490196, 0, 1,
-0.9135392, -0.07272433, -1.807963, 1, 0.9529412, 0, 1,
-0.9125218, -0.7608233, -4.212651, 1, 0.9607843, 0, 1,
-0.9083965, 0.9669442, -1.544997, 1, 0.9647059, 0, 1,
-0.9074767, -0.8510792, -2.82102, 1, 0.972549, 0, 1,
-0.904669, 0.9261898, -1.138126, 1, 0.9764706, 0, 1,
-0.9018368, -1.005976, -3.130252, 1, 0.9843137, 0, 1,
-0.8952997, 0.166432, -2.641973, 1, 0.9882353, 0, 1,
-0.8915704, 0.7246789, -1.1634, 1, 0.9960784, 0, 1,
-0.8911092, 0.6694146, -1.686928, 0.9960784, 1, 0, 1,
-0.8796018, 0.2399257, -2.845409, 0.9921569, 1, 0, 1,
-0.8779622, -0.06278964, -2.532552, 0.9843137, 1, 0, 1,
-0.868847, -1.621648, -2.026861, 0.9803922, 1, 0, 1,
-0.8558688, -0.2131541, -1.571445, 0.972549, 1, 0, 1,
-0.8433971, 0.07895666, -0.8762708, 0.9686275, 1, 0, 1,
-0.8408615, -0.4011213, -2.349466, 0.9607843, 1, 0, 1,
-0.8344305, 1.732139, 0.5463812, 0.9568627, 1, 0, 1,
-0.8290371, 0.1468115, -1.911205, 0.9490196, 1, 0, 1,
-0.8255634, 0.8913615, 0.211257, 0.945098, 1, 0, 1,
-0.8252746, -0.664691, -2.234679, 0.9372549, 1, 0, 1,
-0.8184379, 0.3966822, -2.267209, 0.9333333, 1, 0, 1,
-0.8171489, 1.622913, 0.06377313, 0.9254902, 1, 0, 1,
-0.8158322, 0.157557, -1.132124, 0.9215686, 1, 0, 1,
-0.8143504, 1.231404, -1.46862, 0.9137255, 1, 0, 1,
-0.8065017, 0.5788335, 0.0695316, 0.9098039, 1, 0, 1,
-0.8061658, -0.5528835, -0.1389427, 0.9019608, 1, 0, 1,
-0.7986991, 1.685239, 0.4379992, 0.8941177, 1, 0, 1,
-0.7951908, 1.188076, -1.545987, 0.8901961, 1, 0, 1,
-0.7918415, -0.7580815, -2.305068, 0.8823529, 1, 0, 1,
-0.7898711, 0.4360011, -2.834934, 0.8784314, 1, 0, 1,
-0.7891579, -0.08143314, -2.374401, 0.8705882, 1, 0, 1,
-0.7859513, -0.8269451, -1.727303, 0.8666667, 1, 0, 1,
-0.7717376, -0.2295748, -2.033202, 0.8588235, 1, 0, 1,
-0.7712842, -0.07410978, -0.6754723, 0.854902, 1, 0, 1,
-0.7651802, 0.4085329, 0.6400155, 0.8470588, 1, 0, 1,
-0.7606417, -0.5665293, -2.695076, 0.8431373, 1, 0, 1,
-0.7584944, 1.246687, 0.05186135, 0.8352941, 1, 0, 1,
-0.7579854, 1.232981, -1.6819, 0.8313726, 1, 0, 1,
-0.7561641, -0.9654235, -2.159523, 0.8235294, 1, 0, 1,
-0.756059, -3.144669, -2.478531, 0.8196079, 1, 0, 1,
-0.7540966, 0.4267396, 1.046471, 0.8117647, 1, 0, 1,
-0.7522296, 0.9584813, 0.8765534, 0.8078431, 1, 0, 1,
-0.7476448, -0.7168444, -2.146392, 0.8, 1, 0, 1,
-0.7456415, 1.167202, 0.3375193, 0.7921569, 1, 0, 1,
-0.7406567, 0.9038265, -0.3004437, 0.7882353, 1, 0, 1,
-0.7371933, 0.3832714, -1.491803, 0.7803922, 1, 0, 1,
-0.7298481, -0.306904, -3.351363, 0.7764706, 1, 0, 1,
-0.7237651, -1.101163, -1.188255, 0.7686275, 1, 0, 1,
-0.7199728, -1.329729, -3.48716, 0.7647059, 1, 0, 1,
-0.7173789, -2.624532, -1.472699, 0.7568628, 1, 0, 1,
-0.7162754, -1.843624, -3.880929, 0.7529412, 1, 0, 1,
-0.7148243, -0.6761582, -2.284395, 0.7450981, 1, 0, 1,
-0.7117245, 0.969765, 0.4906944, 0.7411765, 1, 0, 1,
-0.7091327, -0.5862051, -1.946227, 0.7333333, 1, 0, 1,
-0.7051316, -1.160261, -2.320709, 0.7294118, 1, 0, 1,
-0.6923705, 2.374933, -0.6982958, 0.7215686, 1, 0, 1,
-0.6904719, 0.6198377, -3.27332, 0.7176471, 1, 0, 1,
-0.6813769, -0.2951664, -0.4770706, 0.7098039, 1, 0, 1,
-0.6813345, -1.437827, -3.502252, 0.7058824, 1, 0, 1,
-0.6787453, 0.7244675, -2.554785, 0.6980392, 1, 0, 1,
-0.6782933, -0.1766941, -1.86845, 0.6901961, 1, 0, 1,
-0.6751404, -0.01918436, -3.77085, 0.6862745, 1, 0, 1,
-0.6727475, 1.309007, 0.6339992, 0.6784314, 1, 0, 1,
-0.6708608, 0.3010472, -2.074905, 0.6745098, 1, 0, 1,
-0.669383, -0.1541094, -2.615313, 0.6666667, 1, 0, 1,
-0.6683654, 0.9745376, -1.003843, 0.6627451, 1, 0, 1,
-0.6678762, 0.5361011, -1.657482, 0.654902, 1, 0, 1,
-0.6671463, -0.8539456, -2.812165, 0.6509804, 1, 0, 1,
-0.6624045, -1.287287, -2.318281, 0.6431373, 1, 0, 1,
-0.6581275, -1.212858, -4.671228, 0.6392157, 1, 0, 1,
-0.6580871, -1.699605, -3.318646, 0.6313726, 1, 0, 1,
-0.6560504, -0.3118084, -2.230845, 0.627451, 1, 0, 1,
-0.6539161, -0.5659889, -2.061399, 0.6196079, 1, 0, 1,
-0.6442168, 0.8711477, -0.9016501, 0.6156863, 1, 0, 1,
-0.643793, 0.192341, -1.662471, 0.6078432, 1, 0, 1,
-0.6389876, 1.636512, 1.113928, 0.6039216, 1, 0, 1,
-0.633118, 0.1277273, -0.5718125, 0.5960785, 1, 0, 1,
-0.6313328, 0.8219174, -0.9559788, 0.5882353, 1, 0, 1,
-0.6310991, 1.052873, 0.4985698, 0.5843138, 1, 0, 1,
-0.6307765, 0.840968, -1.187291, 0.5764706, 1, 0, 1,
-0.6266215, 0.8016337, -0.5809029, 0.572549, 1, 0, 1,
-0.6241434, -2.552643, -3.180735, 0.5647059, 1, 0, 1,
-0.6215712, 0.4049858, -1.220534, 0.5607843, 1, 0, 1,
-0.6188098, -0.2154558, -1.491253, 0.5529412, 1, 0, 1,
-0.6171053, 0.3118374, -1.60127, 0.5490196, 1, 0, 1,
-0.6150932, -0.5888472, -2.200042, 0.5411765, 1, 0, 1,
-0.6137931, 0.1406074, -2.504647, 0.5372549, 1, 0, 1,
-0.6082392, -1.658181, -3.173597, 0.5294118, 1, 0, 1,
-0.6011134, 0.7055132, -1.903188, 0.5254902, 1, 0, 1,
-0.6004862, 1.381195, -0.5736015, 0.5176471, 1, 0, 1,
-0.6003402, -0.7812517, -1.987207, 0.5137255, 1, 0, 1,
-0.5999401, -0.2282857, -2.369818, 0.5058824, 1, 0, 1,
-0.5987853, 0.9772912, -2.066454, 0.5019608, 1, 0, 1,
-0.5941323, -0.4266355, -1.172931, 0.4941176, 1, 0, 1,
-0.5907532, 0.6532882, -1.237202, 0.4862745, 1, 0, 1,
-0.5895462, 0.7366686, 1.057838, 0.4823529, 1, 0, 1,
-0.5894879, -0.6685491, -2.154845, 0.4745098, 1, 0, 1,
-0.5801015, -1.158726, -3.723554, 0.4705882, 1, 0, 1,
-0.5793585, -0.3359483, -2.346499, 0.4627451, 1, 0, 1,
-0.5775228, 2.383457, 2.111286, 0.4588235, 1, 0, 1,
-0.5773579, -0.5651486, -1.812513, 0.4509804, 1, 0, 1,
-0.5668536, 1.427913, -1.840061, 0.4470588, 1, 0, 1,
-0.563821, -0.868806, -2.958493, 0.4392157, 1, 0, 1,
-0.5607123, 1.436122, 0.04239965, 0.4352941, 1, 0, 1,
-0.5556065, 0.4361114, 0.5252723, 0.427451, 1, 0, 1,
-0.5405241, -0.1695549, -2.590057, 0.4235294, 1, 0, 1,
-0.5401514, 1.203237, -1.324241, 0.4156863, 1, 0, 1,
-0.5360913, -0.4967158, -1.01357, 0.4117647, 1, 0, 1,
-0.534311, -0.481287, -3.13361, 0.4039216, 1, 0, 1,
-0.5339126, -1.489021, -2.8105, 0.3960784, 1, 0, 1,
-0.5299903, 0.9759857, -0.8285294, 0.3921569, 1, 0, 1,
-0.5282595, 0.4933329, -1.587722, 0.3843137, 1, 0, 1,
-0.5243128, 0.839842, 1.832253, 0.3803922, 1, 0, 1,
-0.5227239, -0.8605068, -1.035824, 0.372549, 1, 0, 1,
-0.5204366, -0.4979039, -2.724273, 0.3686275, 1, 0, 1,
-0.5192131, -0.5886533, -3.32459, 0.3607843, 1, 0, 1,
-0.5137573, -1.361895, -3.619873, 0.3568628, 1, 0, 1,
-0.5122902, 0.2261667, -2.722826, 0.3490196, 1, 0, 1,
-0.5096279, 0.5387499, -0.4111095, 0.345098, 1, 0, 1,
-0.5062232, 0.2861597, -1.700566, 0.3372549, 1, 0, 1,
-0.5003703, 0.3039389, -0.7092346, 0.3333333, 1, 0, 1,
-0.4994529, 1.321001, 0.4751521, 0.3254902, 1, 0, 1,
-0.4976784, -0.898192, -4.00815, 0.3215686, 1, 0, 1,
-0.4961157, -0.3921959, -1.498559, 0.3137255, 1, 0, 1,
-0.4942966, -0.08278642, -1.770012, 0.3098039, 1, 0, 1,
-0.4935456, -0.4340396, -2.066777, 0.3019608, 1, 0, 1,
-0.4931552, -1.271901, -3.958357, 0.2941177, 1, 0, 1,
-0.4883419, 0.4311024, -2.083191, 0.2901961, 1, 0, 1,
-0.4848022, -0.09427963, -1.360732, 0.282353, 1, 0, 1,
-0.4822166, -0.5284953, -3.855153, 0.2784314, 1, 0, 1,
-0.4807641, 0.4513606, 0.4526673, 0.2705882, 1, 0, 1,
-0.4805922, -0.9584097, -3.331026, 0.2666667, 1, 0, 1,
-0.480413, 1.012093, -1.227947, 0.2588235, 1, 0, 1,
-0.4777065, 1.04308, -0.8258064, 0.254902, 1, 0, 1,
-0.4774716, -0.5802867, -2.100718, 0.2470588, 1, 0, 1,
-0.4750707, -0.6580631, -3.403138, 0.2431373, 1, 0, 1,
-0.4747189, -0.2966272, -2.743492, 0.2352941, 1, 0, 1,
-0.4701227, 0.1672764, -1.363999, 0.2313726, 1, 0, 1,
-0.4675196, 0.1886251, -1.196283, 0.2235294, 1, 0, 1,
-0.4673917, 1.602069, 0.1323714, 0.2196078, 1, 0, 1,
-0.466684, -0.2598612, -4.065888, 0.2117647, 1, 0, 1,
-0.4619963, 0.9705873, 2.179454, 0.2078431, 1, 0, 1,
-0.4562944, 1.527339, 0.4475955, 0.2, 1, 0, 1,
-0.4551333, -1.753076, -2.94862, 0.1921569, 1, 0, 1,
-0.4510219, -0.2293342, -2.631365, 0.1882353, 1, 0, 1,
-0.4488382, -1.079836, -1.778752, 0.1803922, 1, 0, 1,
-0.4472147, 0.7706236, -1.241027, 0.1764706, 1, 0, 1,
-0.4426954, -0.8373263, -1.442583, 0.1686275, 1, 0, 1,
-0.4411111, 2.202275, -2.077011, 0.1647059, 1, 0, 1,
-0.4381102, -0.559465, -1.716134, 0.1568628, 1, 0, 1,
-0.4370389, -0.1262002, -1.933506, 0.1529412, 1, 0, 1,
-0.4340309, -1.710837, -1.810389, 0.145098, 1, 0, 1,
-0.4326268, -0.8971887, -2.715395, 0.1411765, 1, 0, 1,
-0.4322468, -0.8327003, -2.483789, 0.1333333, 1, 0, 1,
-0.4293428, -1.082071, -2.776835, 0.1294118, 1, 0, 1,
-0.4280111, -0.01260055, -0.6211323, 0.1215686, 1, 0, 1,
-0.4269185, -1.259313, -2.708733, 0.1176471, 1, 0, 1,
-0.4230451, -1.633829, -3.759671, 0.1098039, 1, 0, 1,
-0.4224806, 0.3734209, 0.2607468, 0.1058824, 1, 0, 1,
-0.4221311, 1.614447, -0.4194557, 0.09803922, 1, 0, 1,
-0.4198571, 1.912139, 0.1257195, 0.09019608, 1, 0, 1,
-0.4187064, 0.1351581, -1.076823, 0.08627451, 1, 0, 1,
-0.4173108, -0.3682676, -1.077941, 0.07843138, 1, 0, 1,
-0.4170049, 1.061951, 1.233552, 0.07450981, 1, 0, 1,
-0.4167648, -0.5028135, -1.893095, 0.06666667, 1, 0, 1,
-0.4130754, 1.397278, 0.4681014, 0.0627451, 1, 0, 1,
-0.4112032, -0.6332516, -2.664825, 0.05490196, 1, 0, 1,
-0.4102622, 0.3729349, 1.344202, 0.05098039, 1, 0, 1,
-0.41022, 0.6557065, 1.091284, 0.04313726, 1, 0, 1,
-0.4029176, 0.2373111, -1.525292, 0.03921569, 1, 0, 1,
-0.402078, 0.239859, -1.503857, 0.03137255, 1, 0, 1,
-0.4004526, 0.9604832, -0.345161, 0.02745098, 1, 0, 1,
-0.4002838, 0.7963706, -0.7524226, 0.01960784, 1, 0, 1,
-0.3916331, 1.367719, -0.5639454, 0.01568628, 1, 0, 1,
-0.3905725, -0.1280712, -2.114952, 0.007843138, 1, 0, 1,
-0.3831672, -0.7628945, -4.475918, 0.003921569, 1, 0, 1,
-0.382116, -1.509461, -2.248183, 0, 1, 0.003921569, 1,
-0.3764896, -0.04139136, -0.8635238, 0, 1, 0.01176471, 1,
-0.3760752, 1.233559, -1.624128, 0, 1, 0.01568628, 1,
-0.3734962, 0.08631495, -0.6543923, 0, 1, 0.02352941, 1,
-0.3729017, 2.030342, 0.1392235, 0, 1, 0.02745098, 1,
-0.3701133, 0.1139753, -2.193582, 0, 1, 0.03529412, 1,
-0.3700116, -0.4753286, -1.901751, 0, 1, 0.03921569, 1,
-0.3693829, 1.320898, -1.122058, 0, 1, 0.04705882, 1,
-0.3678267, -0.7496355, -1.754378, 0, 1, 0.05098039, 1,
-0.3642612, -0.6239898, -3.318278, 0, 1, 0.05882353, 1,
-0.3622598, 1.513113, -1.879077, 0, 1, 0.0627451, 1,
-0.3607861, 2.273909, -1.117265, 0, 1, 0.07058824, 1,
-0.3552832, 0.01550499, -0.9273213, 0, 1, 0.07450981, 1,
-0.3546214, -1.165073, -3.006516, 0, 1, 0.08235294, 1,
-0.3544179, -1.140511, -2.180858, 0, 1, 0.08627451, 1,
-0.3527466, 0.08024674, -0.5547794, 0, 1, 0.09411765, 1,
-0.351522, 0.6153343, -0.3263912, 0, 1, 0.1019608, 1,
-0.3494024, 1.132614, -1.836364, 0, 1, 0.1058824, 1,
-0.3493896, 1.018376, -1.075408, 0, 1, 0.1137255, 1,
-0.3472358, -0.02723275, -0.8394907, 0, 1, 0.1176471, 1,
-0.3446765, -2.518363, -3.024712, 0, 1, 0.1254902, 1,
-0.3428958, 1.468249, 0.4561976, 0, 1, 0.1294118, 1,
-0.3402528, 0.3018258, -0.3487733, 0, 1, 0.1372549, 1,
-0.331617, 0.7228944, -0.1579524, 0, 1, 0.1411765, 1,
-0.3314117, -1.507433, -2.389429, 0, 1, 0.1490196, 1,
-0.3248802, -0.2144828, -4.401998, 0, 1, 0.1529412, 1,
-0.323802, 2.45242, 0.7637411, 0, 1, 0.1607843, 1,
-0.3236282, 1.806544, 1.567626, 0, 1, 0.1647059, 1,
-0.321938, 0.5892033, -0.8935402, 0, 1, 0.172549, 1,
-0.3207869, 0.2607881, -1.20313, 0, 1, 0.1764706, 1,
-0.3193461, 1.931519, -0.1271951, 0, 1, 0.1843137, 1,
-0.3185888, 0.2714615, -0.2083063, 0, 1, 0.1882353, 1,
-0.3154599, -0.1526583, -3.358485, 0, 1, 0.1960784, 1,
-0.3091467, -0.3555244, -2.598301, 0, 1, 0.2039216, 1,
-0.3081573, -1.276803, -2.569087, 0, 1, 0.2078431, 1,
-0.2961571, -2.035074, -1.870167, 0, 1, 0.2156863, 1,
-0.2936165, -1.751086, -2.729433, 0, 1, 0.2196078, 1,
-0.2906809, 0.3851714, -0.7295848, 0, 1, 0.227451, 1,
-0.2886098, -0.5593979, -2.035731, 0, 1, 0.2313726, 1,
-0.2877424, 0.9025797, 0.5038793, 0, 1, 0.2392157, 1,
-0.2830144, -1.309456, -2.849125, 0, 1, 0.2431373, 1,
-0.2819778, 0.7763628, -0.2017029, 0, 1, 0.2509804, 1,
-0.281075, 1.225785, -0.04154976, 0, 1, 0.254902, 1,
-0.2805068, 0.9208491, -1.070822, 0, 1, 0.2627451, 1,
-0.2800546, 0.8384329, -0.2918586, 0, 1, 0.2666667, 1,
-0.2773575, -0.2472368, -2.564811, 0, 1, 0.2745098, 1,
-0.2767943, -1.162674, -1.793915, 0, 1, 0.2784314, 1,
-0.2755112, 0.737464, -1.556868, 0, 1, 0.2862745, 1,
-0.2728977, -0.8235754, -2.926564, 0, 1, 0.2901961, 1,
-0.2610104, 0.7520661, -1.307737, 0, 1, 0.2980392, 1,
-0.255071, 0.5134636, -0.1143679, 0, 1, 0.3058824, 1,
-0.2490819, 0.3392215, -2.099127, 0, 1, 0.3098039, 1,
-0.2451388, 0.4334845, -0.1354273, 0, 1, 0.3176471, 1,
-0.2412082, 0.1891154, 0.01318129, 0, 1, 0.3215686, 1,
-0.2405014, -0.8683214, -4.328093, 0, 1, 0.3294118, 1,
-0.2392889, -0.9368962, -2.070666, 0, 1, 0.3333333, 1,
-0.2336547, 0.2152252, -1.39971, 0, 1, 0.3411765, 1,
-0.2306236, 0.1262881, 0.2795461, 0, 1, 0.345098, 1,
-0.2296048, -1.056913, -1.500804, 0, 1, 0.3529412, 1,
-0.2265924, 0.3591353, -0.1101635, 0, 1, 0.3568628, 1,
-0.2241725, 0.6646398, 0.3240418, 0, 1, 0.3647059, 1,
-0.2202983, -1.584757, -3.633285, 0, 1, 0.3686275, 1,
-0.2112706, -0.7189561, -2.761793, 0, 1, 0.3764706, 1,
-0.1977097, -2.258269, -4.340338, 0, 1, 0.3803922, 1,
-0.1962653, 0.9801634, -0.3352719, 0, 1, 0.3882353, 1,
-0.19231, -0.004558573, -1.882545, 0, 1, 0.3921569, 1,
-0.1905941, -0.3590674, -1.833887, 0, 1, 0.4, 1,
-0.1891423, -0.1002105, -2.616414, 0, 1, 0.4078431, 1,
-0.1883689, -1.259353, -3.56698, 0, 1, 0.4117647, 1,
-0.18664, -1.467106, -3.143936, 0, 1, 0.4196078, 1,
-0.1838373, -0.5966469, -0.2954765, 0, 1, 0.4235294, 1,
-0.1836307, -0.6609394, -2.407169, 0, 1, 0.4313726, 1,
-0.1829578, 0.2874537, -0.7543666, 0, 1, 0.4352941, 1,
-0.1795363, 0.4698134, -1.131833, 0, 1, 0.4431373, 1,
-0.1772047, 0.1126881, -1.941965, 0, 1, 0.4470588, 1,
-0.1766827, -0.8385844, -1.567356, 0, 1, 0.454902, 1,
-0.1731143, 0.7475477, -0.05790603, 0, 1, 0.4588235, 1,
-0.1725851, 0.3587589, 0.2704482, 0, 1, 0.4666667, 1,
-0.1696674, 0.2223545, -4.52419, 0, 1, 0.4705882, 1,
-0.16851, 1.736962, -1.490332, 0, 1, 0.4784314, 1,
-0.1675025, -2.46598, -3.524903, 0, 1, 0.4823529, 1,
-0.1636102, -0.8405758, -3.410752, 0, 1, 0.4901961, 1,
-0.1608853, -2.460069, -3.5304, 0, 1, 0.4941176, 1,
-0.145056, 1.824635, -0.2666509, 0, 1, 0.5019608, 1,
-0.1438506, 0.978734, 0.1876741, 0, 1, 0.509804, 1,
-0.1407652, -1.514886, -3.542755, 0, 1, 0.5137255, 1,
-0.1393653, -2.946411, -2.302683, 0, 1, 0.5215687, 1,
-0.1392089, 0.217359, -2.06925, 0, 1, 0.5254902, 1,
-0.1392071, -0.09988973, -2.530334, 0, 1, 0.5333334, 1,
-0.13119, 1.124308, -1.818092, 0, 1, 0.5372549, 1,
-0.1255528, -0.725729, -1.842926, 0, 1, 0.5450981, 1,
-0.1235403, 2.302623, 0.08026856, 0, 1, 0.5490196, 1,
-0.1221248, -1.969614, -1.374675, 0, 1, 0.5568628, 1,
-0.1138023, 1.326311, 0.7371125, 0, 1, 0.5607843, 1,
-0.1137928, -0.7949072, -5.282682, 0, 1, 0.5686275, 1,
-0.1126364, -1.613085, -2.972696, 0, 1, 0.572549, 1,
-0.1124307, -0.9940608, -3.32851, 0, 1, 0.5803922, 1,
-0.1096741, -0.3727683, -4.064246, 0, 1, 0.5843138, 1,
-0.1051212, 0.3581399, -0.03269564, 0, 1, 0.5921569, 1,
-0.1046655, -1.120568, 0.07515826, 0, 1, 0.5960785, 1,
-0.1043632, 0.04755891, -1.156714, 0, 1, 0.6039216, 1,
-0.1012398, 2.235416, 1.518863, 0, 1, 0.6117647, 1,
-0.09916508, -0.391651, -3.521811, 0, 1, 0.6156863, 1,
-0.09811211, -0.3715479, -2.847409, 0, 1, 0.6235294, 1,
-0.09093976, 0.4770146, 0.8173009, 0, 1, 0.627451, 1,
-0.08684709, 0.7705231, -1.072163, 0, 1, 0.6352941, 1,
-0.08592308, 1.521369, -0.2930881, 0, 1, 0.6392157, 1,
-0.08562966, 1.117386, 0.534882, 0, 1, 0.6470588, 1,
-0.08459215, 0.9283661, 0.802592, 0, 1, 0.6509804, 1,
-0.08324647, -0.5409775, -1.341864, 0, 1, 0.6588235, 1,
-0.08280862, -0.8563772, -3.349853, 0, 1, 0.6627451, 1,
-0.08256264, 1.810884, -1.57172, 0, 1, 0.6705883, 1,
-0.07650198, -1.004832, -2.276366, 0, 1, 0.6745098, 1,
-0.07547938, -0.6025707, -2.444848, 0, 1, 0.682353, 1,
-0.07265576, 0.6889988, 0.1641194, 0, 1, 0.6862745, 1,
-0.07258975, 0.8651829, -0.1431601, 0, 1, 0.6941177, 1,
-0.06788645, 1.23916, 0.1336753, 0, 1, 0.7019608, 1,
-0.06263862, 0.7629828, -0.03374042, 0, 1, 0.7058824, 1,
-0.06204585, -0.7455168, -5.460182, 0, 1, 0.7137255, 1,
-0.06181805, -1.964236, -3.161444, 0, 1, 0.7176471, 1,
-0.05675291, 0.05997871, -0.9681296, 0, 1, 0.7254902, 1,
-0.05601956, -0.9964397, -3.657504, 0, 1, 0.7294118, 1,
-0.0557473, 0.6008732, -0.4845081, 0, 1, 0.7372549, 1,
-0.045538, 0.4442703, 0.1427447, 0, 1, 0.7411765, 1,
-0.04441363, -0.3841743, -2.521223, 0, 1, 0.7490196, 1,
-0.04229577, 0.01334891, -0.5565684, 0, 1, 0.7529412, 1,
-0.03935533, 1.410001, -0.7710536, 0, 1, 0.7607843, 1,
-0.03721815, -0.236452, -3.336544, 0, 1, 0.7647059, 1,
-0.03391544, 0.7555828, 1.422201, 0, 1, 0.772549, 1,
-0.02952687, 1.624545, -1.25272, 0, 1, 0.7764706, 1,
-0.02913212, -1.086555, -2.92104, 0, 1, 0.7843137, 1,
-0.02341604, 0.3706359, 0.4335962, 0, 1, 0.7882353, 1,
-0.02275766, 0.2637727, 1.588915, 0, 1, 0.7960784, 1,
-0.02152523, -0.08189338, -2.128668, 0, 1, 0.8039216, 1,
-0.01937523, 0.547325, 0.3356046, 0, 1, 0.8078431, 1,
-0.01598778, -0.3666654, -2.842, 0, 1, 0.8156863, 1,
-0.006476397, -0.6952196, -3.369483, 0, 1, 0.8196079, 1,
-0.005932964, 0.9870362, -1.089992, 0, 1, 0.827451, 1,
-0.005899536, -0.485967, -4.314614, 0, 1, 0.8313726, 1,
-0.005359736, 0.220422, -0.3802663, 0, 1, 0.8392157, 1,
-0.003350649, -0.7616997, -2.161629, 0, 1, 0.8431373, 1,
-0.002827202, 1.140403, 1.04769, 0, 1, 0.8509804, 1,
-0.002745658, 1.525983, -0.2782019, 0, 1, 0.854902, 1,
-0.002595717, 0.195076, -0.6397293, 0, 1, 0.8627451, 1,
-0.001940428, 0.4274806, -1.512528, 0, 1, 0.8666667, 1,
-0.001612809, -0.8570708, -2.481929, 0, 1, 0.8745098, 1,
0.004024119, 0.4573765, -0.2345546, 0, 1, 0.8784314, 1,
0.004523236, 1.064931, -2.098813, 0, 1, 0.8862745, 1,
0.01035079, 0.3760174, 0.4398537, 0, 1, 0.8901961, 1,
0.01337142, 0.4526453, -0.05500993, 0, 1, 0.8980392, 1,
0.01997565, 0.7013711, -0.926488, 0, 1, 0.9058824, 1,
0.02460394, 1.32479, 0.7559297, 0, 1, 0.9098039, 1,
0.02519294, 1.542596, -0.04978593, 0, 1, 0.9176471, 1,
0.03227343, -0.5440409, 3.665801, 0, 1, 0.9215686, 1,
0.0366273, 0.159168, 0.3343511, 0, 1, 0.9294118, 1,
0.03739237, -0.005673425, 1.116754, 0, 1, 0.9333333, 1,
0.0393465, 1.199383, -0.4268867, 0, 1, 0.9411765, 1,
0.04510407, -0.3361431, 3.418427, 0, 1, 0.945098, 1,
0.04775893, 0.2839094, 0.3793638, 0, 1, 0.9529412, 1,
0.05330837, -0.9511989, 2.50654, 0, 1, 0.9568627, 1,
0.05332861, -0.4063613, 2.113657, 0, 1, 0.9647059, 1,
0.05419042, -1.156615, 2.522818, 0, 1, 0.9686275, 1,
0.05649102, 0.333592, -2.152007, 0, 1, 0.9764706, 1,
0.05812904, -0.5951141, 3.123735, 0, 1, 0.9803922, 1,
0.05837344, -0.4255127, 4.594299, 0, 1, 0.9882353, 1,
0.06339946, -1.376638, 4.156843, 0, 1, 0.9921569, 1,
0.0639887, -0.04773772, 2.844259, 0, 1, 1, 1,
0.07196034, -0.9007378, 2.679472, 0, 0.9921569, 1, 1,
0.07766923, -0.9902829, 2.693379, 0, 0.9882353, 1, 1,
0.07943524, -1.5555, 2.707451, 0, 0.9803922, 1, 1,
0.08358061, 0.1579194, 1.009468, 0, 0.9764706, 1, 1,
0.0838025, 0.7884262, -0.204153, 0, 0.9686275, 1, 1,
0.08623486, -0.04038624, 1.347042, 0, 0.9647059, 1, 1,
0.09145555, -0.9533362, 3.694792, 0, 0.9568627, 1, 1,
0.0959585, 0.9163102, -0.5926635, 0, 0.9529412, 1, 1,
0.0965779, 0.1187849, 1.3846, 0, 0.945098, 1, 1,
0.09744211, -1.852929, 2.936661, 0, 0.9411765, 1, 1,
0.1088315, 0.4474811, 0.4540021, 0, 0.9333333, 1, 1,
0.1118528, -0.5542693, 2.526884, 0, 0.9294118, 1, 1,
0.1127204, -0.444197, 3.404886, 0, 0.9215686, 1, 1,
0.1163155, -0.1560049, 3.43994, 0, 0.9176471, 1, 1,
0.1163834, 0.3123334, -0.4310482, 0, 0.9098039, 1, 1,
0.1239334, -1.242383, 2.34552, 0, 0.9058824, 1, 1,
0.1241474, -0.7411066, 4.17873, 0, 0.8980392, 1, 1,
0.124381, 0.01002125, 2.836766, 0, 0.8901961, 1, 1,
0.1336997, -0.2686706, 2.576349, 0, 0.8862745, 1, 1,
0.1347988, 0.09066011, 0.4340272, 0, 0.8784314, 1, 1,
0.1389118, -1.528913, 2.640246, 0, 0.8745098, 1, 1,
0.1395001, -0.5162626, 0.1884547, 0, 0.8666667, 1, 1,
0.1412996, 2.284488, -0.23663, 0, 0.8627451, 1, 1,
0.1425622, 0.5927734, 0.6828464, 0, 0.854902, 1, 1,
0.1455003, -1.540903, 4.490859, 0, 0.8509804, 1, 1,
0.1467082, -1.187606, 2.969314, 0, 0.8431373, 1, 1,
0.1479528, -1.573191, 1.585451, 0, 0.8392157, 1, 1,
0.1532649, 1.796482, 1.841513, 0, 0.8313726, 1, 1,
0.1550359, -1.226178, 3.683287, 0, 0.827451, 1, 1,
0.1633993, 1.040427, -1.068745, 0, 0.8196079, 1, 1,
0.1652431, 0.894407, -0.6084879, 0, 0.8156863, 1, 1,
0.1678336, 0.01479779, 3.057926, 0, 0.8078431, 1, 1,
0.1706922, 0.1190982, 1.735662, 0, 0.8039216, 1, 1,
0.1724335, 2.75842, 0.2146888, 0, 0.7960784, 1, 1,
0.1741748, 0.1557914, 1.675023, 0, 0.7882353, 1, 1,
0.1757373, 1.061113, 1.203004, 0, 0.7843137, 1, 1,
0.1781033, 0.7111197, -0.7418924, 0, 0.7764706, 1, 1,
0.1807203, -0.3013157, 2.192784, 0, 0.772549, 1, 1,
0.1861793, 0.7392929, -1.343077, 0, 0.7647059, 1, 1,
0.1864811, 1.087435, 0.3282327, 0, 0.7607843, 1, 1,
0.1866936, 0.09629789, 3.01245, 0, 0.7529412, 1, 1,
0.1868671, 1.52898, 0.1498762, 0, 0.7490196, 1, 1,
0.1887833, -0.2469781, 2.024043, 0, 0.7411765, 1, 1,
0.192863, 1.642331, 0.875225, 0, 0.7372549, 1, 1,
0.1942909, 0.2995818, 0.0661797, 0, 0.7294118, 1, 1,
0.1947794, 0.1666816, 1.010001, 0, 0.7254902, 1, 1,
0.1977705, 0.04707019, -0.06148418, 0, 0.7176471, 1, 1,
0.2011022, -1.392719, 2.190932, 0, 0.7137255, 1, 1,
0.2011201, 0.2997959, 0.7341904, 0, 0.7058824, 1, 1,
0.2024127, -1.321061, 1.726965, 0, 0.6980392, 1, 1,
0.2039718, 0.9486548, 0.4487052, 0, 0.6941177, 1, 1,
0.2142245, -0.3716717, 4.338082, 0, 0.6862745, 1, 1,
0.2174303, 1.815513, 0.5041735, 0, 0.682353, 1, 1,
0.2196358, 0.249395, -0.5031328, 0, 0.6745098, 1, 1,
0.2211239, -1.013309, 1.724785, 0, 0.6705883, 1, 1,
0.2212641, 0.6932374, 0.1258726, 0, 0.6627451, 1, 1,
0.2273526, -0.7036178, 3.706354, 0, 0.6588235, 1, 1,
0.2278069, 0.0235793, 1.864333, 0, 0.6509804, 1, 1,
0.2300841, 0.6348087, -1.59274, 0, 0.6470588, 1, 1,
0.2314804, -1.043967, 2.499136, 0, 0.6392157, 1, 1,
0.2402119, -0.6926156, 2.789015, 0, 0.6352941, 1, 1,
0.2446444, -0.2453101, 1.47279, 0, 0.627451, 1, 1,
0.2484583, -0.1185482, 2.611583, 0, 0.6235294, 1, 1,
0.2497093, 1.640999, 0.5278169, 0, 0.6156863, 1, 1,
0.2497225, 0.6804612, 1.627025, 0, 0.6117647, 1, 1,
0.2506251, -0.688758, 1.848698, 0, 0.6039216, 1, 1,
0.2511481, 0.3977029, 0.7444553, 0, 0.5960785, 1, 1,
0.2513105, 1.642494, -1.366528, 0, 0.5921569, 1, 1,
0.2522931, -0.03800501, 1.250577, 0, 0.5843138, 1, 1,
0.2556304, -1.458972, 2.005089, 0, 0.5803922, 1, 1,
0.2562103, 1.051073, 1.805806, 0, 0.572549, 1, 1,
0.2567641, 0.8731196, -0.7544582, 0, 0.5686275, 1, 1,
0.266291, 0.7046867, -0.09328211, 0, 0.5607843, 1, 1,
0.2666044, -0.7007909, 1.824451, 0, 0.5568628, 1, 1,
0.2685221, 0.02103743, 1.246718, 0, 0.5490196, 1, 1,
0.2694391, -0.05864125, 1.260303, 0, 0.5450981, 1, 1,
0.2756393, 0.8145316, 1.182334, 0, 0.5372549, 1, 1,
0.2769533, -2.285404, 2.41575, 0, 0.5333334, 1, 1,
0.2788804, 0.7172654, -1.005426, 0, 0.5254902, 1, 1,
0.281419, 0.6296928, -0.3954647, 0, 0.5215687, 1, 1,
0.2831787, -0.3567267, 3.818731, 0, 0.5137255, 1, 1,
0.2903399, 0.2808279, 0.1735448, 0, 0.509804, 1, 1,
0.2905172, -0.04065565, 2.764918, 0, 0.5019608, 1, 1,
0.2932114, -1.266813, 2.592898, 0, 0.4941176, 1, 1,
0.295093, -0.5864795, 1.979847, 0, 0.4901961, 1, 1,
0.2965523, -0.04680113, 1.065169, 0, 0.4823529, 1, 1,
0.2998738, -0.5805279, 2.354351, 0, 0.4784314, 1, 1,
0.3011984, 0.504679, -1.298211, 0, 0.4705882, 1, 1,
0.3013455, -1.000264, 4.031867, 0, 0.4666667, 1, 1,
0.3023928, 1.077623, 0.1164311, 0, 0.4588235, 1, 1,
0.3024095, 0.277074, 0.9021575, 0, 0.454902, 1, 1,
0.3028742, -1.147765, 3.875143, 0, 0.4470588, 1, 1,
0.3044404, 1.795735, 0.9821534, 0, 0.4431373, 1, 1,
0.3050381, 0.5554087, -2.101383, 0, 0.4352941, 1, 1,
0.3070495, -0.8833993, 3.918336, 0, 0.4313726, 1, 1,
0.3073564, 2.377064, -1.855708, 0, 0.4235294, 1, 1,
0.3108003, -0.7187246, 1.760288, 0, 0.4196078, 1, 1,
0.3119015, 0.5373743, -0.3739953, 0, 0.4117647, 1, 1,
0.3141849, -1.370966, 2.615736, 0, 0.4078431, 1, 1,
0.3168879, 0.7554097, -0.1188845, 0, 0.4, 1, 1,
0.3176131, -1.38999, 3.196631, 0, 0.3921569, 1, 1,
0.320071, 0.9080557, 0.7765247, 0, 0.3882353, 1, 1,
0.3204101, -1.185557, 3.381429, 0, 0.3803922, 1, 1,
0.3218117, 0.753723, 2.095492, 0, 0.3764706, 1, 1,
0.3220432, -0.2532975, 2.910789, 0, 0.3686275, 1, 1,
0.3223411, -1.45743, 1.953364, 0, 0.3647059, 1, 1,
0.3237495, 1.087183, 1.378196, 0, 0.3568628, 1, 1,
0.3243708, 0.5568631, -0.5570879, 0, 0.3529412, 1, 1,
0.3258569, 0.03074357, 1.280543, 0, 0.345098, 1, 1,
0.3284149, 1.3675, 0.338824, 0, 0.3411765, 1, 1,
0.3338439, -1.504718, 1.998958, 0, 0.3333333, 1, 1,
0.3350117, 0.3860399, 1.03877, 0, 0.3294118, 1, 1,
0.3373342, -0.3728997, 3.725571, 0, 0.3215686, 1, 1,
0.3388016, 1.738117, 1.171009, 0, 0.3176471, 1, 1,
0.3426225, 1.808943, 1.922149, 0, 0.3098039, 1, 1,
0.3431888, 1.079792, -0.2943062, 0, 0.3058824, 1, 1,
0.3440035, -0.4970706, 2.990737, 0, 0.2980392, 1, 1,
0.3449706, 1.17011, 0.1177029, 0, 0.2901961, 1, 1,
0.3486226, 1.42085, 0.2958017, 0, 0.2862745, 1, 1,
0.3505179, 0.5761372, -1.104923, 0, 0.2784314, 1, 1,
0.352623, 0.4195706, -1.742257, 0, 0.2745098, 1, 1,
0.3526568, 1.143503, -0.2715947, 0, 0.2666667, 1, 1,
0.3537605, 0.5117451, -0.3302729, 0, 0.2627451, 1, 1,
0.3571519, 1.364489, 0.4772482, 0, 0.254902, 1, 1,
0.357261, -0.8895025, 1.843454, 0, 0.2509804, 1, 1,
0.3616896, -0.2342888, 2.387712, 0, 0.2431373, 1, 1,
0.3632702, -1.454941, 2.759997, 0, 0.2392157, 1, 1,
0.3644952, -0.7156438, 2.866342, 0, 0.2313726, 1, 1,
0.3645687, 1.342993, -0.6368404, 0, 0.227451, 1, 1,
0.368044, -2.957019, 3.823944, 0, 0.2196078, 1, 1,
0.3681543, -0.1502079, 2.119478, 0, 0.2156863, 1, 1,
0.3692726, -1.070858, 1.654689, 0, 0.2078431, 1, 1,
0.3759139, -0.34635, 1.385011, 0, 0.2039216, 1, 1,
0.3762805, 0.2590465, 2.058851, 0, 0.1960784, 1, 1,
0.37727, 0.7962166, 1.767677, 0, 0.1882353, 1, 1,
0.383389, -1.004578, 1.209383, 0, 0.1843137, 1, 1,
0.3862379, -1.142309, 2.258662, 0, 0.1764706, 1, 1,
0.3867137, -0.5985761, 0.6014873, 0, 0.172549, 1, 1,
0.3878561, 1.332404, 0.4053396, 0, 0.1647059, 1, 1,
0.3878684, -0.2090478, 2.600703, 0, 0.1607843, 1, 1,
0.393584, -0.2154463, 1.32872, 0, 0.1529412, 1, 1,
0.3954792, 1.332905, -0.1063838, 0, 0.1490196, 1, 1,
0.3977204, 0.5982301, 1.628909, 0, 0.1411765, 1, 1,
0.3979249, 1.425529, -0.5679608, 0, 0.1372549, 1, 1,
0.4001424, -0.3624263, 2.065169, 0, 0.1294118, 1, 1,
0.4011723, -1.812064, 2.381545, 0, 0.1254902, 1, 1,
0.4078125, -0.5960782, 1.689465, 0, 0.1176471, 1, 1,
0.4088179, 1.016839, 0.02267989, 0, 0.1137255, 1, 1,
0.4119073, 1.744437, -0.6578311, 0, 0.1058824, 1, 1,
0.4141036, -1.070744, 2.761282, 0, 0.09803922, 1, 1,
0.4167529, 0.7042229, 1.690235, 0, 0.09411765, 1, 1,
0.4218577, 0.9529848, -1.45648, 0, 0.08627451, 1, 1,
0.430429, -0.2023939, 3.180658, 0, 0.08235294, 1, 1,
0.4384308, -0.4663162, 2.376066, 0, 0.07450981, 1, 1,
0.4386229, -1.269205, 3.716243, 0, 0.07058824, 1, 1,
0.4403834, -0.7658182, 2.979658, 0, 0.0627451, 1, 1,
0.4417149, 0.3267598, 0.6819758, 0, 0.05882353, 1, 1,
0.445644, 1.336969, 1.319132, 0, 0.05098039, 1, 1,
0.4511039, 0.2207865, 0.5501871, 0, 0.04705882, 1, 1,
0.4511852, -2.054366, 1.337191, 0, 0.03921569, 1, 1,
0.4549939, 0.7712311, -1.173825, 0, 0.03529412, 1, 1,
0.4590549, 0.4685831, 1.178508, 0, 0.02745098, 1, 1,
0.4624742, -0.4725834, 1.818667, 0, 0.02352941, 1, 1,
0.4696534, -0.9337215, 3.605854, 0, 0.01568628, 1, 1,
0.4711408, 0.4566348, 1.21995, 0, 0.01176471, 1, 1,
0.4748944, 1.365855, -0.4853308, 0, 0.003921569, 1, 1,
0.4753184, 0.3996838, 0.3909196, 0.003921569, 0, 1, 1,
0.4776238, -0.1773689, 2.847691, 0.007843138, 0, 1, 1,
0.4783759, -1.67975, 2.441466, 0.01568628, 0, 1, 1,
0.4806822, -1.140322, 2.724955, 0.01960784, 0, 1, 1,
0.4836523, -0.5468168, 2.695163, 0.02745098, 0, 1, 1,
0.4882005, -0.5269042, 1.480987, 0.03137255, 0, 1, 1,
0.4884228, 0.663818, -0.610639, 0.03921569, 0, 1, 1,
0.4908493, 0.1087967, 1.38841, 0.04313726, 0, 1, 1,
0.4930683, -0.5704213, 2.63214, 0.05098039, 0, 1, 1,
0.493199, 0.8232769, 1.12282, 0.05490196, 0, 1, 1,
0.498116, 0.3402267, 1.560878, 0.0627451, 0, 1, 1,
0.501479, -0.1503253, 0.9496005, 0.06666667, 0, 1, 1,
0.5071799, -0.2990919, 2.942792, 0.07450981, 0, 1, 1,
0.5099928, 0.5087919, 1.444026, 0.07843138, 0, 1, 1,
0.5123954, 1.748844, 0.8208305, 0.08627451, 0, 1, 1,
0.5124398, 0.0006626207, 0.7673218, 0.09019608, 0, 1, 1,
0.5127271, -0.100112, 1.772593, 0.09803922, 0, 1, 1,
0.514882, 1.20356, -1.060694, 0.1058824, 0, 1, 1,
0.515308, -1.993909, 2.060266, 0.1098039, 0, 1, 1,
0.5168688, 2.451173, 1.226024, 0.1176471, 0, 1, 1,
0.5180956, -0.3369891, 0.07961242, 0.1215686, 0, 1, 1,
0.51958, -0.2239675, 1.73494, 0.1294118, 0, 1, 1,
0.5232891, -0.4427296, 1.340974, 0.1333333, 0, 1, 1,
0.5234689, 0.0183652, 2.156824, 0.1411765, 0, 1, 1,
0.5340109, -1.306853, 1.943186, 0.145098, 0, 1, 1,
0.5386836, 0.5911654, 0.07222848, 0.1529412, 0, 1, 1,
0.538699, 0.2992066, 1.043549, 0.1568628, 0, 1, 1,
0.5411168, 0.9712675, 1.343447, 0.1647059, 0, 1, 1,
0.5420954, -0.729356, 1.928954, 0.1686275, 0, 1, 1,
0.5441502, 0.03885632, 2.255692, 0.1764706, 0, 1, 1,
0.5442698, 0.8774613, -0.7648038, 0.1803922, 0, 1, 1,
0.5443855, -1.196527, 2.515299, 0.1882353, 0, 1, 1,
0.5455231, -0.009971682, 2.531242, 0.1921569, 0, 1, 1,
0.5466797, -1.120663, 0.5502567, 0.2, 0, 1, 1,
0.5512197, -0.2983273, 1.185943, 0.2078431, 0, 1, 1,
0.5571619, 0.0760539, 2.287976, 0.2117647, 0, 1, 1,
0.5610089, 0.1183617, 3.627807, 0.2196078, 0, 1, 1,
0.5666583, -0.4932957, 2.790776, 0.2235294, 0, 1, 1,
0.5680469, -1.50957, 2.496053, 0.2313726, 0, 1, 1,
0.5688447, 0.7267233, 0.8715476, 0.2352941, 0, 1, 1,
0.5702022, -0.1739893, 0.7286317, 0.2431373, 0, 1, 1,
0.5742888, 0.9726488, 0.9946358, 0.2470588, 0, 1, 1,
0.5747675, -0.1170548, 0.536576, 0.254902, 0, 1, 1,
0.5752355, -0.2005555, -0.9712405, 0.2588235, 0, 1, 1,
0.5796089, 1.565531, -0.6772903, 0.2666667, 0, 1, 1,
0.5854335, 0.2572947, 2.070604, 0.2705882, 0, 1, 1,
0.5857497, -0.4743652, 0.8848395, 0.2784314, 0, 1, 1,
0.6006313, 1.629102, 0.6845713, 0.282353, 0, 1, 1,
0.6046056, 0.675764, 0.5459661, 0.2901961, 0, 1, 1,
0.6071776, 0.05921322, 2.342606, 0.2941177, 0, 1, 1,
0.6095448, 0.4867657, 0.543206, 0.3019608, 0, 1, 1,
0.6103558, -1.378792, 2.592873, 0.3098039, 0, 1, 1,
0.6127294, 0.1688701, 2.140679, 0.3137255, 0, 1, 1,
0.617901, 0.6134061, 0.1165348, 0.3215686, 0, 1, 1,
0.6191803, 2.595815, 0.4836669, 0.3254902, 0, 1, 1,
0.6238793, -0.831776, 3.177729, 0.3333333, 0, 1, 1,
0.6267707, -0.1145994, -0.02255141, 0.3372549, 0, 1, 1,
0.6330352, 1.016163, 0.9445631, 0.345098, 0, 1, 1,
0.6360697, -0.4914654, 0.9843659, 0.3490196, 0, 1, 1,
0.6369289, -1.54617, 4.348605, 0.3568628, 0, 1, 1,
0.6419383, 0.03689057, 0.8120725, 0.3607843, 0, 1, 1,
0.6424197, 0.1664107, 0.597069, 0.3686275, 0, 1, 1,
0.6438069, -1.252095, 1.264031, 0.372549, 0, 1, 1,
0.6445558, 1.195064, -0.4047509, 0.3803922, 0, 1, 1,
0.6504155, -0.6041179, 1.317633, 0.3843137, 0, 1, 1,
0.6569433, -1.438972, 1.50327, 0.3921569, 0, 1, 1,
0.6583939, 0.001109751, 3.176833, 0.3960784, 0, 1, 1,
0.6625162, -1.322934, 2.095479, 0.4039216, 0, 1, 1,
0.6670619, -0.4105677, 3.364928, 0.4117647, 0, 1, 1,
0.6690423, -0.3645771, 1.783806, 0.4156863, 0, 1, 1,
0.6722089, 0.2257494, 1.360012, 0.4235294, 0, 1, 1,
0.6773724, -0.1365876, 0.4338565, 0.427451, 0, 1, 1,
0.6831178, -1.362098, 2.711817, 0.4352941, 0, 1, 1,
0.6831846, 0.4985034, -0.4786146, 0.4392157, 0, 1, 1,
0.6835939, 0.1523824, 2.228557, 0.4470588, 0, 1, 1,
0.6839737, -0.798503, 3.117946, 0.4509804, 0, 1, 1,
0.6875855, 0.2906574, 1.621888, 0.4588235, 0, 1, 1,
0.6890647, -0.3744503, 3.975585, 0.4627451, 0, 1, 1,
0.6900864, -0.3606214, 2.099283, 0.4705882, 0, 1, 1,
0.6901767, -0.7743002, 2.244473, 0.4745098, 0, 1, 1,
0.6926877, -0.5762858, 3.644006, 0.4823529, 0, 1, 1,
0.6927283, -0.1117106, 1.618386, 0.4862745, 0, 1, 1,
0.6933993, 2.533486, -0.9205992, 0.4941176, 0, 1, 1,
0.695859, -0.9653029, 2.71992, 0.5019608, 0, 1, 1,
0.6990228, -0.3262115, 4.35411, 0.5058824, 0, 1, 1,
0.6996016, 1.474392, -0.3874219, 0.5137255, 0, 1, 1,
0.7005349, 0.1005415, 0.5143964, 0.5176471, 0, 1, 1,
0.7010048, -1.764221, 3.192305, 0.5254902, 0, 1, 1,
0.7010372, -0.557043, 2.831539, 0.5294118, 0, 1, 1,
0.702134, -0.5839984, 2.999231, 0.5372549, 0, 1, 1,
0.70565, -1.814915, 2.564078, 0.5411765, 0, 1, 1,
0.7140325, -0.01022692, 2.422396, 0.5490196, 0, 1, 1,
0.715345, 0.7413837, 0.3914714, 0.5529412, 0, 1, 1,
0.7190545, 0.01214212, 2.982212, 0.5607843, 0, 1, 1,
0.7243186, -1.060194, 3.257021, 0.5647059, 0, 1, 1,
0.7303225, -1.029332, 1.131816, 0.572549, 0, 1, 1,
0.7316736, -0.1173054, 3.424916, 0.5764706, 0, 1, 1,
0.7390447, 1.594048, 0.1648463, 0.5843138, 0, 1, 1,
0.7395142, -0.1545658, 3.345096, 0.5882353, 0, 1, 1,
0.7410269, -2.03927, 4.351028, 0.5960785, 0, 1, 1,
0.7452875, 1.248418, 1.607934, 0.6039216, 0, 1, 1,
0.7562154, 1.616545, -0.001168494, 0.6078432, 0, 1, 1,
0.7697599, -1.421691, 3.005182, 0.6156863, 0, 1, 1,
0.7703595, 0.8392479, 1.72799, 0.6196079, 0, 1, 1,
0.7746229, -0.2281588, 1.246983, 0.627451, 0, 1, 1,
0.7748945, 0.20593, 2.444829, 0.6313726, 0, 1, 1,
0.7765076, 1.204008, 1.294167, 0.6392157, 0, 1, 1,
0.7776171, 1.345173, 0.9684179, 0.6431373, 0, 1, 1,
0.7790355, 1.742107, -0.6160676, 0.6509804, 0, 1, 1,
0.7852728, 0.6956714, 1.0368, 0.654902, 0, 1, 1,
0.7877535, -0.6757058, 3.06993, 0.6627451, 0, 1, 1,
0.7901824, -1.38476, 2.544585, 0.6666667, 0, 1, 1,
0.7923471, 0.8405388, 1.382449, 0.6745098, 0, 1, 1,
0.7971035, -0.07723077, 1.346546, 0.6784314, 0, 1, 1,
0.799999, 1.459643, 0.4603578, 0.6862745, 0, 1, 1,
0.80358, 0.2934891, 0.6536167, 0.6901961, 0, 1, 1,
0.8046554, 2.836613, 1.021135, 0.6980392, 0, 1, 1,
0.8132598, -0.7562827, 3.971159, 0.7058824, 0, 1, 1,
0.8136755, 1.630805, -0.3456506, 0.7098039, 0, 1, 1,
0.8193407, -0.7796323, 1.372016, 0.7176471, 0, 1, 1,
0.8203894, -0.2544517, 2.362763, 0.7215686, 0, 1, 1,
0.8215695, 1.609432, 2.024038, 0.7294118, 0, 1, 1,
0.8220147, -0.8210159, 1.147298, 0.7333333, 0, 1, 1,
0.8246884, 1.630704, 1.35601, 0.7411765, 0, 1, 1,
0.8258498, 0.3846473, 2.228188, 0.7450981, 0, 1, 1,
0.8281689, 0.7909871, -1.455226, 0.7529412, 0, 1, 1,
0.8286019, 0.2980442, 0.2484413, 0.7568628, 0, 1, 1,
0.8303217, 1.374138, -0.458821, 0.7647059, 0, 1, 1,
0.8432104, 0.6806708, 0.9789423, 0.7686275, 0, 1, 1,
0.8436135, 0.8146806, -1.196333, 0.7764706, 0, 1, 1,
0.8441856, 1.221702, 0.6818526, 0.7803922, 0, 1, 1,
0.8487398, 0.2699946, 2.892142, 0.7882353, 0, 1, 1,
0.8491123, -0.4362401, 0.2881468, 0.7921569, 0, 1, 1,
0.8516546, -0.2531886, 1.329219, 0.8, 0, 1, 1,
0.852012, -0.2073459, 2.031914, 0.8078431, 0, 1, 1,
0.8593754, 0.479665, 0.7570254, 0.8117647, 0, 1, 1,
0.8595064, 1.071155, 0.02387064, 0.8196079, 0, 1, 1,
0.8665358, 1.159009, -0.2205568, 0.8235294, 0, 1, 1,
0.8688911, 0.5336363, -1.030245, 0.8313726, 0, 1, 1,
0.8702591, -0.9701961, 3.216655, 0.8352941, 0, 1, 1,
0.8728691, 0.687484, 3.741786, 0.8431373, 0, 1, 1,
0.8795048, -1.609736, 1.996082, 0.8470588, 0, 1, 1,
0.8802714, -0.3019332, 1.804611, 0.854902, 0, 1, 1,
0.8817494, -0.9479035, 3.102939, 0.8588235, 0, 1, 1,
0.8827375, -0.9865478, 0.50514, 0.8666667, 0, 1, 1,
0.8838502, 0.9603438, 0.6391034, 0.8705882, 0, 1, 1,
0.888635, -0.4294399, 1.453521, 0.8784314, 0, 1, 1,
0.893173, -0.4589946, 1.316185, 0.8823529, 0, 1, 1,
0.8957485, -0.3608051, 3.358884, 0.8901961, 0, 1, 1,
0.8976444, -0.7279969, 2.742739, 0.8941177, 0, 1, 1,
0.9032688, 0.1134622, -0.255238, 0.9019608, 0, 1, 1,
0.9077915, 0.5937922, 1.734375, 0.9098039, 0, 1, 1,
0.9106662, -0.6733665, 2.512049, 0.9137255, 0, 1, 1,
0.9135126, -0.1511476, 1.867853, 0.9215686, 0, 1, 1,
0.9139605, 0.7967752, -0.06936543, 0.9254902, 0, 1, 1,
0.9173737, -0.7702751, 3.235499, 0.9333333, 0, 1, 1,
0.920384, -0.1736776, 2.662949, 0.9372549, 0, 1, 1,
0.9226072, -0.7079085, 2.62569, 0.945098, 0, 1, 1,
0.9228388, 0.3377763, 0.7602822, 0.9490196, 0, 1, 1,
0.9244431, 0.4307369, 1.992573, 0.9568627, 0, 1, 1,
0.9254916, 0.526181, -0.6218597, 0.9607843, 0, 1, 1,
0.9267948, -0.1155182, 1.861682, 0.9686275, 0, 1, 1,
0.9269564, 0.002789441, 1.313066, 0.972549, 0, 1, 1,
0.9272231, 1.086885, 0.6499265, 0.9803922, 0, 1, 1,
0.9308475, -1.534356, 2.335867, 0.9843137, 0, 1, 1,
0.9311505, -1.670903, 3.108771, 0.9921569, 0, 1, 1,
0.9401551, 0.02471159, 1.069654, 0.9960784, 0, 1, 1,
0.9429822, -0.6131158, 0.8294342, 1, 0, 0.9960784, 1,
0.9519414, 1.467757, 0.3613027, 1, 0, 0.9882353, 1,
0.959408, 0.3084291, 0.04178081, 1, 0, 0.9843137, 1,
0.9634611, -2.149907, 3.636514, 1, 0, 0.9764706, 1,
0.9691739, 0.5376995, 1.739614, 1, 0, 0.972549, 1,
0.9760033, -0.3770621, 0.4281135, 1, 0, 0.9647059, 1,
0.9765953, 0.5062056, 3.811502, 1, 0, 0.9607843, 1,
0.9792785, 0.0001064639, 2.175225, 1, 0, 0.9529412, 1,
0.9798896, -0.5362634, 1.708624, 1, 0, 0.9490196, 1,
0.9814138, 0.5452727, 2.071688, 1, 0, 0.9411765, 1,
0.9855864, -0.3321071, 2.199289, 1, 0, 0.9372549, 1,
0.9875584, 0.4782398, 0.2648354, 1, 0, 0.9294118, 1,
0.9892536, 1.45115, 2.594325, 1, 0, 0.9254902, 1,
0.9920964, -0.6136814, 1.276857, 1, 0, 0.9176471, 1,
0.9969214, 0.4380925, 0.9039782, 1, 0, 0.9137255, 1,
1.010551, -0.1980731, 0.5305159, 1, 0, 0.9058824, 1,
1.015759, 1.526719, -0.3165126, 1, 0, 0.9019608, 1,
1.017197, -1.446636, 1.566506, 1, 0, 0.8941177, 1,
1.017386, 0.09713577, 2.613467, 1, 0, 0.8862745, 1,
1.020985, -0.5703614, 2.300326, 1, 0, 0.8823529, 1,
1.035566, -1.050968, 2.913708, 1, 0, 0.8745098, 1,
1.037266, 0.03971823, 1.25824, 1, 0, 0.8705882, 1,
1.038127, -0.3370976, 1.714364, 1, 0, 0.8627451, 1,
1.04052, -0.7774538, 1.24386, 1, 0, 0.8588235, 1,
1.044731, -0.1145317, 1.980776, 1, 0, 0.8509804, 1,
1.050056, -0.7876408, 3.646662, 1, 0, 0.8470588, 1,
1.059159, 0.4905625, 1.568074, 1, 0, 0.8392157, 1,
1.060953, -1.396306, 3.03649, 1, 0, 0.8352941, 1,
1.06296, 0.3711894, 0.8020949, 1, 0, 0.827451, 1,
1.068066, -0.8522382, 2.606429, 1, 0, 0.8235294, 1,
1.069897, 1.488385, 1.341687, 1, 0, 0.8156863, 1,
1.073076, 0.9012103, 1.815798, 1, 0, 0.8117647, 1,
1.075604, 1.505032, 0.6096826, 1, 0, 0.8039216, 1,
1.077364, -0.4874544, 1.179799, 1, 0, 0.7960784, 1,
1.085614, -0.3276632, 2.630543, 1, 0, 0.7921569, 1,
1.104028, -0.6563065, 0.6130779, 1, 0, 0.7843137, 1,
1.108837, 0.2848331, 1.449556, 1, 0, 0.7803922, 1,
1.113824, -1.207071, 3.970189, 1, 0, 0.772549, 1,
1.114931, -0.9470103, 2.434558, 1, 0, 0.7686275, 1,
1.138186, -0.6361948, 3.878155, 1, 0, 0.7607843, 1,
1.138533, 1.044641, 1.291378, 1, 0, 0.7568628, 1,
1.138797, 0.2392185, 2.488991, 1, 0, 0.7490196, 1,
1.160068, 0.6322451, 2.008668, 1, 0, 0.7450981, 1,
1.164374, -1.143125, 2.317143, 1, 0, 0.7372549, 1,
1.169893, -1.007956, 4.55197, 1, 0, 0.7333333, 1,
1.177613, -0.08315386, 1.079012, 1, 0, 0.7254902, 1,
1.192601, 0.7563357, -0.6301226, 1, 0, 0.7215686, 1,
1.197277, 0.5397535, -0.893626, 1, 0, 0.7137255, 1,
1.203268, -1.031795, 3.109353, 1, 0, 0.7098039, 1,
1.205873, -0.6569954, 2.18065, 1, 0, 0.7019608, 1,
1.20665, -0.5256677, 1.71024, 1, 0, 0.6941177, 1,
1.237383, -0.8366098, 3.571805, 1, 0, 0.6901961, 1,
1.238791, 1.881636, 1.732854, 1, 0, 0.682353, 1,
1.249943, -0.4962254, 0.1830909, 1, 0, 0.6784314, 1,
1.251225, 0.771184, 1.571297, 1, 0, 0.6705883, 1,
1.251346, -1.037339, 1.724126, 1, 0, 0.6666667, 1,
1.255412, -1.296861, 1.810317, 1, 0, 0.6588235, 1,
1.26434, 1.106283, -0.64627, 1, 0, 0.654902, 1,
1.267937, -0.1731778, 2.059758, 1, 0, 0.6470588, 1,
1.270354, -1.584111, 1.356572, 1, 0, 0.6431373, 1,
1.27172, -1.749136, 0.7660159, 1, 0, 0.6352941, 1,
1.273071, -0.7890155, 1.789265, 1, 0, 0.6313726, 1,
1.277591, -0.7853304, 1.283248, 1, 0, 0.6235294, 1,
1.280779, 1.404183, 1.032706, 1, 0, 0.6196079, 1,
1.287722, -0.8060899, 2.833413, 1, 0, 0.6117647, 1,
1.290552, 1.224302, 0.7947336, 1, 0, 0.6078432, 1,
1.293434, 1.34512, -0.4932219, 1, 0, 0.6, 1,
1.295803, -0.1542156, 0.4080953, 1, 0, 0.5921569, 1,
1.298105, 0.7941554, 1.798833, 1, 0, 0.5882353, 1,
1.301258, 0.3715462, 1.27879, 1, 0, 0.5803922, 1,
1.303094, 0.8450297, -0.2578883, 1, 0, 0.5764706, 1,
1.312008, 1.733842, 1.503961, 1, 0, 0.5686275, 1,
1.312853, 1.160225, 0.8307111, 1, 0, 0.5647059, 1,
1.319821, -0.2285563, 4.396202, 1, 0, 0.5568628, 1,
1.335172, -1.197159, 2.548398, 1, 0, 0.5529412, 1,
1.336901, -0.864913, 2.213995, 1, 0, 0.5450981, 1,
1.342957, -0.5490743, 2.477555, 1, 0, 0.5411765, 1,
1.362999, 2.013222, 0.2866796, 1, 0, 0.5333334, 1,
1.366887, -0.363793, 2.78793, 1, 0, 0.5294118, 1,
1.371904, -1.114068, 2.800539, 1, 0, 0.5215687, 1,
1.37468, -2.138138, 2.07743, 1, 0, 0.5176471, 1,
1.378291, 0.3129205, 0.925375, 1, 0, 0.509804, 1,
1.381731, -1.118506, 1.96941, 1, 0, 0.5058824, 1,
1.403728, -1.358372, 2.405293, 1, 0, 0.4980392, 1,
1.411347, -0.8011765, 4.119002, 1, 0, 0.4901961, 1,
1.414074, -0.281736, 0.5462403, 1, 0, 0.4862745, 1,
1.414337, 0.2642688, 0.8059325, 1, 0, 0.4784314, 1,
1.421725, 0.6391608, 0.9683817, 1, 0, 0.4745098, 1,
1.428234, 1.062279, 1.909184, 1, 0, 0.4666667, 1,
1.448578, 0.5624052, 0.02864609, 1, 0, 0.4627451, 1,
1.452998, -1.190084, 2.324382, 1, 0, 0.454902, 1,
1.452999, -1.550871, 3.226691, 1, 0, 0.4509804, 1,
1.454939, -0.6688414, 3.014487, 1, 0, 0.4431373, 1,
1.455857, -0.4157972, 2.816466, 1, 0, 0.4392157, 1,
1.465587, 1.961128, -0.4809207, 1, 0, 0.4313726, 1,
1.472787, -1.782685, 2.765239, 1, 0, 0.427451, 1,
1.47414, 0.7728747, 2.160224, 1, 0, 0.4196078, 1,
1.480607, -1.727155, 0.9278338, 1, 0, 0.4156863, 1,
1.485374, -0.2109244, 2.010461, 1, 0, 0.4078431, 1,
1.486143, -1.303347, 3.094064, 1, 0, 0.4039216, 1,
1.493351, 1.616891, 2.558746, 1, 0, 0.3960784, 1,
1.493847, 0.6577328, 2.616139, 1, 0, 0.3882353, 1,
1.495858, -0.7505084, 3.108456, 1, 0, 0.3843137, 1,
1.501338, 0.7102569, 0.117768, 1, 0, 0.3764706, 1,
1.537152, -0.5571151, 1.163645, 1, 0, 0.372549, 1,
1.547722, -0.09706247, 1.667373, 1, 0, 0.3647059, 1,
1.550469, 0.6821656, 0.6450756, 1, 0, 0.3607843, 1,
1.553643, -0.5024394, 1.753656, 1, 0, 0.3529412, 1,
1.565327, 0.8073994, -0.5975599, 1, 0, 0.3490196, 1,
1.570587, 1.306575, -0.05643876, 1, 0, 0.3411765, 1,
1.585361, -2.137562, 3.350198, 1, 0, 0.3372549, 1,
1.593198, 0.7915092, 2.398882, 1, 0, 0.3294118, 1,
1.595265, -1.665993, 1.076585, 1, 0, 0.3254902, 1,
1.609861, -0.07062054, 1.252362, 1, 0, 0.3176471, 1,
1.619137, 0.1016033, -0.007593777, 1, 0, 0.3137255, 1,
1.636276, 0.5573509, 2.547796, 1, 0, 0.3058824, 1,
1.638292, -0.6613817, 2.294312, 1, 0, 0.2980392, 1,
1.641022, -0.0608886, 1.055026, 1, 0, 0.2941177, 1,
1.648414, -0.07174807, 1.775876, 1, 0, 0.2862745, 1,
1.654908, -0.9493768, 2.952414, 1, 0, 0.282353, 1,
1.670442, -0.3534129, -0.04155558, 1, 0, 0.2745098, 1,
1.760077, 0.3325222, 0.6144803, 1, 0, 0.2705882, 1,
1.768919, 0.8427992, 0.1292513, 1, 0, 0.2627451, 1,
1.772975, -0.2585292, 0.242191, 1, 0, 0.2588235, 1,
1.788525, 1.089926, 0.7554408, 1, 0, 0.2509804, 1,
1.806972, -1.628953, 1.4427, 1, 0, 0.2470588, 1,
1.822369, 1.794406, 0.4609173, 1, 0, 0.2392157, 1,
1.839875, 0.06460147, 0.4331245, 1, 0, 0.2352941, 1,
1.848307, 0.1536774, 1.660542, 1, 0, 0.227451, 1,
1.881424, 0.7492651, 2.186109, 1, 0, 0.2235294, 1,
1.885956, -1.276695, 2.659099, 1, 0, 0.2156863, 1,
1.887025, 0.08777761, 0.9916056, 1, 0, 0.2117647, 1,
1.899269, -1.450788, 3.313209, 1, 0, 0.2039216, 1,
1.909058, -0.2701691, 3.171989, 1, 0, 0.1960784, 1,
1.956007, 0.141124, 1.725271, 1, 0, 0.1921569, 1,
1.96199, -1.442676, 2.16155, 1, 0, 0.1843137, 1,
2.027216, -0.1955398, 1.70429, 1, 0, 0.1803922, 1,
2.035666, -1.905937, 1.950925, 1, 0, 0.172549, 1,
2.045379, -0.7392629, 2.373475, 1, 0, 0.1686275, 1,
2.045739, -1.276102, 3.366051, 1, 0, 0.1607843, 1,
2.074509, 0.1149993, 2.459668, 1, 0, 0.1568628, 1,
2.077294, -0.3098202, -0.236586, 1, 0, 0.1490196, 1,
2.092139, -0.2088694, 1.187404, 1, 0, 0.145098, 1,
2.098992, 0.8072206, 3.071381, 1, 0, 0.1372549, 1,
2.12484, 0.7266353, 1.508238, 1, 0, 0.1333333, 1,
2.133754, 0.8003888, 1.488594, 1, 0, 0.1254902, 1,
2.141832, 1.914544, 0.885419, 1, 0, 0.1215686, 1,
2.145846, -0.4378121, 1.623339, 1, 0, 0.1137255, 1,
2.148371, 0.7155939, 3.102545, 1, 0, 0.1098039, 1,
2.164822, 0.1788856, 1.768483, 1, 0, 0.1019608, 1,
2.181634, -1.602024, 2.067044, 1, 0, 0.09411765, 1,
2.183821, 1.660284, -0.8530719, 1, 0, 0.09019608, 1,
2.19423, -0.5910844, 1.21007, 1, 0, 0.08235294, 1,
2.203566, -0.5705826, 2.690521, 1, 0, 0.07843138, 1,
2.262292, -0.2343484, 1.453134, 1, 0, 0.07058824, 1,
2.274801, 0.7395635, 2.602542, 1, 0, 0.06666667, 1,
2.299538, 0.209616, 1.961225, 1, 0, 0.05882353, 1,
2.317632, 0.2460116, 1.4009, 1, 0, 0.05490196, 1,
2.327739, 1.320479, 0.8348434, 1, 0, 0.04705882, 1,
2.330929, -0.1424261, 1.612314, 1, 0, 0.04313726, 1,
2.341079, -0.9047645, 4.033566, 1, 0, 0.03529412, 1,
2.357874, -1.563522, 2.7395, 1, 0, 0.03137255, 1,
2.442727, 0.1413539, 2.160167, 1, 0, 0.02352941, 1,
2.505638, -0.2307048, 2.432063, 1, 0, 0.01960784, 1,
2.669735, 0.1732018, 1.794185, 1, 0, 0.01176471, 1,
3.145691, 0.4805658, 2.211993, 1, 0, 0.007843138, 1
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
-0.1192584, -4.158497, -7.164416, 0, -0.5, 0.5, 0.5,
-0.1192584, -4.158497, -7.164416, 1, -0.5, 0.5, 0.5,
-0.1192584, -4.158497, -7.164416, 1, 1.5, 0.5, 0.5,
-0.1192584, -4.158497, -7.164416, 0, 1.5, 0.5, 0.5
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
-4.491026, -0.1540281, -7.164416, 0, -0.5, 0.5, 0.5,
-4.491026, -0.1540281, -7.164416, 1, -0.5, 0.5, 0.5,
-4.491026, -0.1540281, -7.164416, 1, 1.5, 0.5, 0.5,
-4.491026, -0.1540281, -7.164416, 0, 1.5, 0.5, 0.5
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
-4.491026, -4.158497, -0.4329414, 0, -0.5, 0.5, 0.5,
-4.491026, -4.158497, -0.4329414, 1, -0.5, 0.5, 0.5,
-4.491026, -4.158497, -0.4329414, 1, 1.5, 0.5, 0.5,
-4.491026, -4.158497, -0.4329414, 0, 1.5, 0.5, 0.5
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
-3, -3.234389, -5.610999,
3, -3.234389, -5.610999,
-3, -3.234389, -5.610999,
-3, -3.388407, -5.869902,
-2, -3.234389, -5.610999,
-2, -3.388407, -5.869902,
-1, -3.234389, -5.610999,
-1, -3.388407, -5.869902,
0, -3.234389, -5.610999,
0, -3.388407, -5.869902,
1, -3.234389, -5.610999,
1, -3.388407, -5.869902,
2, -3.234389, -5.610999,
2, -3.388407, -5.869902,
3, -3.234389, -5.610999,
3, -3.388407, -5.869902
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
-3, -3.696443, -6.387708, 0, -0.5, 0.5, 0.5,
-3, -3.696443, -6.387708, 1, -0.5, 0.5, 0.5,
-3, -3.696443, -6.387708, 1, 1.5, 0.5, 0.5,
-3, -3.696443, -6.387708, 0, 1.5, 0.5, 0.5,
-2, -3.696443, -6.387708, 0, -0.5, 0.5, 0.5,
-2, -3.696443, -6.387708, 1, -0.5, 0.5, 0.5,
-2, -3.696443, -6.387708, 1, 1.5, 0.5, 0.5,
-2, -3.696443, -6.387708, 0, 1.5, 0.5, 0.5,
-1, -3.696443, -6.387708, 0, -0.5, 0.5, 0.5,
-1, -3.696443, -6.387708, 1, -0.5, 0.5, 0.5,
-1, -3.696443, -6.387708, 1, 1.5, 0.5, 0.5,
-1, -3.696443, -6.387708, 0, 1.5, 0.5, 0.5,
0, -3.696443, -6.387708, 0, -0.5, 0.5, 0.5,
0, -3.696443, -6.387708, 1, -0.5, 0.5, 0.5,
0, -3.696443, -6.387708, 1, 1.5, 0.5, 0.5,
0, -3.696443, -6.387708, 0, 1.5, 0.5, 0.5,
1, -3.696443, -6.387708, 0, -0.5, 0.5, 0.5,
1, -3.696443, -6.387708, 1, -0.5, 0.5, 0.5,
1, -3.696443, -6.387708, 1, 1.5, 0.5, 0.5,
1, -3.696443, -6.387708, 0, 1.5, 0.5, 0.5,
2, -3.696443, -6.387708, 0, -0.5, 0.5, 0.5,
2, -3.696443, -6.387708, 1, -0.5, 0.5, 0.5,
2, -3.696443, -6.387708, 1, 1.5, 0.5, 0.5,
2, -3.696443, -6.387708, 0, 1.5, 0.5, 0.5,
3, -3.696443, -6.387708, 0, -0.5, 0.5, 0.5,
3, -3.696443, -6.387708, 1, -0.5, 0.5, 0.5,
3, -3.696443, -6.387708, 1, 1.5, 0.5, 0.5,
3, -3.696443, -6.387708, 0, 1.5, 0.5, 0.5
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
-3.482157, -3, -5.610999,
-3.482157, 2, -5.610999,
-3.482157, -3, -5.610999,
-3.650302, -3, -5.869902,
-3.482157, -2, -5.610999,
-3.650302, -2, -5.869902,
-3.482157, -1, -5.610999,
-3.650302, -1, -5.869902,
-3.482157, 0, -5.610999,
-3.650302, 0, -5.869902,
-3.482157, 1, -5.610999,
-3.650302, 1, -5.869902,
-3.482157, 2, -5.610999,
-3.650302, 2, -5.869902
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
-3.986591, -3, -6.387708, 0, -0.5, 0.5, 0.5,
-3.986591, -3, -6.387708, 1, -0.5, 0.5, 0.5,
-3.986591, -3, -6.387708, 1, 1.5, 0.5, 0.5,
-3.986591, -3, -6.387708, 0, 1.5, 0.5, 0.5,
-3.986591, -2, -6.387708, 0, -0.5, 0.5, 0.5,
-3.986591, -2, -6.387708, 1, -0.5, 0.5, 0.5,
-3.986591, -2, -6.387708, 1, 1.5, 0.5, 0.5,
-3.986591, -2, -6.387708, 0, 1.5, 0.5, 0.5,
-3.986591, -1, -6.387708, 0, -0.5, 0.5, 0.5,
-3.986591, -1, -6.387708, 1, -0.5, 0.5, 0.5,
-3.986591, -1, -6.387708, 1, 1.5, 0.5, 0.5,
-3.986591, -1, -6.387708, 0, 1.5, 0.5, 0.5,
-3.986591, 0, -6.387708, 0, -0.5, 0.5, 0.5,
-3.986591, 0, -6.387708, 1, -0.5, 0.5, 0.5,
-3.986591, 0, -6.387708, 1, 1.5, 0.5, 0.5,
-3.986591, 0, -6.387708, 0, 1.5, 0.5, 0.5,
-3.986591, 1, -6.387708, 0, -0.5, 0.5, 0.5,
-3.986591, 1, -6.387708, 1, -0.5, 0.5, 0.5,
-3.986591, 1, -6.387708, 1, 1.5, 0.5, 0.5,
-3.986591, 1, -6.387708, 0, 1.5, 0.5, 0.5,
-3.986591, 2, -6.387708, 0, -0.5, 0.5, 0.5,
-3.986591, 2, -6.387708, 1, -0.5, 0.5, 0.5,
-3.986591, 2, -6.387708, 1, 1.5, 0.5, 0.5,
-3.986591, 2, -6.387708, 0, 1.5, 0.5, 0.5
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
-3.482157, -3.234389, -4,
-3.482157, -3.234389, 4,
-3.482157, -3.234389, -4,
-3.650302, -3.388407, -4,
-3.482157, -3.234389, -2,
-3.650302, -3.388407, -2,
-3.482157, -3.234389, 0,
-3.650302, -3.388407, 0,
-3.482157, -3.234389, 2,
-3.650302, -3.388407, 2,
-3.482157, -3.234389, 4,
-3.650302, -3.388407, 4
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
-3.986591, -3.696443, -4, 0, -0.5, 0.5, 0.5,
-3.986591, -3.696443, -4, 1, -0.5, 0.5, 0.5,
-3.986591, -3.696443, -4, 1, 1.5, 0.5, 0.5,
-3.986591, -3.696443, -4, 0, 1.5, 0.5, 0.5,
-3.986591, -3.696443, -2, 0, -0.5, 0.5, 0.5,
-3.986591, -3.696443, -2, 1, -0.5, 0.5, 0.5,
-3.986591, -3.696443, -2, 1, 1.5, 0.5, 0.5,
-3.986591, -3.696443, -2, 0, 1.5, 0.5, 0.5,
-3.986591, -3.696443, 0, 0, -0.5, 0.5, 0.5,
-3.986591, -3.696443, 0, 1, -0.5, 0.5, 0.5,
-3.986591, -3.696443, 0, 1, 1.5, 0.5, 0.5,
-3.986591, -3.696443, 0, 0, 1.5, 0.5, 0.5,
-3.986591, -3.696443, 2, 0, -0.5, 0.5, 0.5,
-3.986591, -3.696443, 2, 1, -0.5, 0.5, 0.5,
-3.986591, -3.696443, 2, 1, 1.5, 0.5, 0.5,
-3.986591, -3.696443, 2, 0, 1.5, 0.5, 0.5,
-3.986591, -3.696443, 4, 0, -0.5, 0.5, 0.5,
-3.986591, -3.696443, 4, 1, -0.5, 0.5, 0.5,
-3.986591, -3.696443, 4, 1, 1.5, 0.5, 0.5,
-3.986591, -3.696443, 4, 0, 1.5, 0.5, 0.5
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
-3.482157, -3.234389, -5.610999,
-3.482157, 2.926332, -5.610999,
-3.482157, -3.234389, 4.745116,
-3.482157, 2.926332, 4.745116,
-3.482157, -3.234389, -5.610999,
-3.482157, -3.234389, 4.745116,
-3.482157, 2.926332, -5.610999,
-3.482157, 2.926332, 4.745116,
-3.482157, -3.234389, -5.610999,
3.24364, -3.234389, -5.610999,
-3.482157, -3.234389, 4.745116,
3.24364, -3.234389, 4.745116,
-3.482157, 2.926332, -5.610999,
3.24364, 2.926332, -5.610999,
-3.482157, 2.926332, 4.745116,
3.24364, 2.926332, 4.745116,
3.24364, -3.234389, -5.610999,
3.24364, 2.926332, -5.610999,
3.24364, -3.234389, 4.745116,
3.24364, 2.926332, 4.745116,
3.24364, -3.234389, -5.610999,
3.24364, -3.234389, 4.745116,
3.24364, 2.926332, -5.610999,
3.24364, 2.926332, 4.745116
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
var radius = 7.368931;
var distance = 32.78521;
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
mvMatrix.translate( 0.1192584, 0.1540281, 0.4329414 );
mvMatrix.scale( 1.184608, 1.293263, 0.7693457 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.78521);
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
lactofen<-read.table("lactofen.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-lactofen$V2
```

```
## Error in eval(expr, envir, enclos): object 'lactofen' not found
```

```r
y<-lactofen$V3
```

```
## Error in eval(expr, envir, enclos): object 'lactofen' not found
```

```r
z<-lactofen$V4
```

```
## Error in eval(expr, envir, enclos): object 'lactofen' not found
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
-3.384208, 0.3329606, 0.3289827, 0, 0, 1, 1, 1,
-2.981117, -1.715746, -1.576571, 1, 0, 0, 1, 1,
-2.830035, -0.4015581, -3.24521, 1, 0, 0, 1, 1,
-2.37614, -1.569694, -0.6773977, 1, 0, 0, 1, 1,
-2.332669, 0.3127055, -2.023175, 1, 0, 0, 1, 1,
-2.3055, 0.7855912, -1.814191, 1, 0, 0, 1, 1,
-2.272671, 1.397192, -3.137497, 0, 0, 0, 1, 1,
-2.264479, -0.2647231, 0.0918075, 0, 0, 0, 1, 1,
-2.214564, -1.561081, -1.085175, 0, 0, 0, 1, 1,
-2.20956, 0.6052337, 0.6490797, 0, 0, 0, 1, 1,
-2.19565, 1.097787, -2.278371, 0, 0, 0, 1, 1,
-2.172745, -2.079874, -0.4981492, 0, 0, 0, 1, 1,
-2.162732, 0.09341183, 0.621802, 0, 0, 0, 1, 1,
-2.152723, -0.6436445, -0.4484881, 1, 1, 1, 1, 1,
-2.136706, -0.4475779, -0.6981058, 1, 1, 1, 1, 1,
-2.128205, -0.6448205, -0.8609183, 1, 1, 1, 1, 1,
-2.123874, -1.468564, -3.224842, 1, 1, 1, 1, 1,
-2.108836, 0.07419991, -0.2813882, 1, 1, 1, 1, 1,
-2.104036, 0.9715643, 1.119414, 1, 1, 1, 1, 1,
-2.093876, 0.3457397, -1.663441, 1, 1, 1, 1, 1,
-1.980595, 2.097688, 0.1827195, 1, 1, 1, 1, 1,
-1.971968, -0.0261702, -1.979877, 1, 1, 1, 1, 1,
-1.961222, 1.542092, 0.06541094, 1, 1, 1, 1, 1,
-1.947885, -0.7850888, -2.153941, 1, 1, 1, 1, 1,
-1.943341, 1.090031, -0.1941192, 1, 1, 1, 1, 1,
-1.935318, -0.2271006, -0.9140459, 1, 1, 1, 1, 1,
-1.898319, -2.152525, -2.386308, 1, 1, 1, 1, 1,
-1.895137, -1.396425, -2.103192, 1, 1, 1, 1, 1,
-1.889968, 1.456958, 0.7152398, 0, 0, 1, 1, 1,
-1.885682, -0.6861034, -3.37934, 1, 0, 0, 1, 1,
-1.875955, -0.4459828, -2.617209, 1, 0, 0, 1, 1,
-1.849643, -2.449832, -3.679106, 1, 0, 0, 1, 1,
-1.837216, -1.211583, -2.964041, 1, 0, 0, 1, 1,
-1.814585, 0.2618654, -2.14298, 1, 0, 0, 1, 1,
-1.798234, 0.7082329, 0.003425221, 0, 0, 0, 1, 1,
-1.775042, -0.5075792, -4.135491, 0, 0, 0, 1, 1,
-1.774192, 1.15399, -2.982227, 0, 0, 0, 1, 1,
-1.768825, 0.9404905, 0.2126557, 0, 0, 0, 1, 1,
-1.766905, 0.3007127, -0.7034853, 0, 0, 0, 1, 1,
-1.748496, 0.7222211, -0.4844241, 0, 0, 0, 1, 1,
-1.748206, 0.1388589, -1.967616, 0, 0, 0, 1, 1,
-1.738144, -0.09935775, -1.948781, 1, 1, 1, 1, 1,
-1.734342, 1.621231, -1.120369, 1, 1, 1, 1, 1,
-1.706685, 0.7166836, -1.292085, 1, 1, 1, 1, 1,
-1.699088, -0.5902158, -2.388226, 1, 1, 1, 1, 1,
-1.686165, 0.9752491, -0.3199552, 1, 1, 1, 1, 1,
-1.679616, 1.392208, -1.774186, 1, 1, 1, 1, 1,
-1.664966, -1.381384, -2.239528, 1, 1, 1, 1, 1,
-1.643774, 0.2667275, -1.844132, 1, 1, 1, 1, 1,
-1.640979, -1.632558, -2.251937, 1, 1, 1, 1, 1,
-1.633237, -0.005056029, -1.237784, 1, 1, 1, 1, 1,
-1.618151, -0.7938957, -3.211957, 1, 1, 1, 1, 1,
-1.605946, -1.030363, -1.99878, 1, 1, 1, 1, 1,
-1.60423, 0.8003622, -1.803002, 1, 1, 1, 1, 1,
-1.583779, 0.7237253, -1.844097, 1, 1, 1, 1, 1,
-1.566441, 0.1875408, -1.073923, 1, 1, 1, 1, 1,
-1.551406, 0.2116511, -2.230069, 0, 0, 1, 1, 1,
-1.548062, -0.2526127, -2.644594, 1, 0, 0, 1, 1,
-1.545381, -1.216339, -2.025574, 1, 0, 0, 1, 1,
-1.541012, -0.710456, -2.283471, 1, 0, 0, 1, 1,
-1.532068, -0.4897625, -1.841931, 1, 0, 0, 1, 1,
-1.511968, 1.121502, -0.3434791, 1, 0, 0, 1, 1,
-1.503691, 0.08805718, -1.631418, 0, 0, 0, 1, 1,
-1.493709, 0.2783028, -1.905955, 0, 0, 0, 1, 1,
-1.474001, -0.4048161, -1.083322, 0, 0, 0, 1, 1,
-1.467089, -0.6694099, -2.885504, 0, 0, 0, 1, 1,
-1.447531, 1.192998, -1.835121, 0, 0, 0, 1, 1,
-1.437898, -0.6014586, -2.708039, 0, 0, 0, 1, 1,
-1.426468, 1.275422, -0.2531407, 0, 0, 0, 1, 1,
-1.424568, 0.4107989, -1.402021, 1, 1, 1, 1, 1,
-1.388737, 0.5375924, -3.717382, 1, 1, 1, 1, 1,
-1.381075, -1.00141, -1.429204, 1, 1, 1, 1, 1,
-1.378507, -0.1830269, -0.5982762, 1, 1, 1, 1, 1,
-1.36904, -2.062232, -2.707147, 1, 1, 1, 1, 1,
-1.36861, -1.689115, -2.664081, 1, 1, 1, 1, 1,
-1.366067, -1.46698, -2.655822, 1, 1, 1, 1, 1,
-1.348366, 0.2720331, -2.182025, 1, 1, 1, 1, 1,
-1.323402, -1.296914, -1.16212, 1, 1, 1, 1, 1,
-1.309051, -0.1800176, -0.1440091, 1, 1, 1, 1, 1,
-1.305268, -1.668934, -3.220289, 1, 1, 1, 1, 1,
-1.304199, 2.634853, 0.6805245, 1, 1, 1, 1, 1,
-1.298426, 0.7673024, -0.9902437, 1, 1, 1, 1, 1,
-1.297954, 0.8091351, -1.547141, 1, 1, 1, 1, 1,
-1.289097, 1.620926, -0.327966, 1, 1, 1, 1, 1,
-1.284489, -0.7512404, -1.170968, 0, 0, 1, 1, 1,
-1.260256, -0.6935341, -1.392321, 1, 0, 0, 1, 1,
-1.258302, 1.152084, -0.700442, 1, 0, 0, 1, 1,
-1.255801, -0.2333289, -2.269084, 1, 0, 0, 1, 1,
-1.254256, -0.2692373, -3.135037, 1, 0, 0, 1, 1,
-1.231908, -0.02366067, -1.089651, 1, 0, 0, 1, 1,
-1.220104, -1.739062, -2.874902, 0, 0, 0, 1, 1,
-1.213267, 0.5340573, 0.3386156, 0, 0, 0, 1, 1,
-1.204201, -1.052244, -2.329346, 0, 0, 0, 1, 1,
-1.200067, 1.319829, 1.659544, 0, 0, 0, 1, 1,
-1.19654, 0.8172309, -2.222259, 0, 0, 0, 1, 1,
-1.196035, 0.9287, -0.6085508, 0, 0, 0, 1, 1,
-1.19528, -0.5520834, -1.697582, 0, 0, 0, 1, 1,
-1.189847, -0.2201798, -2.682559, 1, 1, 1, 1, 1,
-1.187619, -1.905339, -2.836116, 1, 1, 1, 1, 1,
-1.187148, 0.5920797, -0.9705644, 1, 1, 1, 1, 1,
-1.173757, 0.2277077, -2.091737, 1, 1, 1, 1, 1,
-1.17244, -0.8169951, -0.2845164, 1, 1, 1, 1, 1,
-1.171393, -0.5276392, -1.727175, 1, 1, 1, 1, 1,
-1.166704, -0.7271262, -3.338388, 1, 1, 1, 1, 1,
-1.164349, -0.1648003, -1.83525, 1, 1, 1, 1, 1,
-1.162928, -0.5482392, -3.025683, 1, 1, 1, 1, 1,
-1.161065, -0.4776978, -1.061472, 1, 1, 1, 1, 1,
-1.149966, 0.8121395, -0.7046868, 1, 1, 1, 1, 1,
-1.13721, 0.4830382, 1.055385, 1, 1, 1, 1, 1,
-1.127138, -1.164373, -0.9476925, 1, 1, 1, 1, 1,
-1.123004, -0.5836871, -3.186278, 1, 1, 1, 1, 1,
-1.110095, -0.599307, -0.3700208, 1, 1, 1, 1, 1,
-1.11009, -0.481692, -2.627497, 0, 0, 1, 1, 1,
-1.104028, -0.444221, -1.059666, 1, 0, 0, 1, 1,
-1.10341, 0.295144, -0.4848994, 1, 0, 0, 1, 1,
-1.100396, -0.280317, -1.642241, 1, 0, 0, 1, 1,
-1.098476, 0.4926623, -1.023152, 1, 0, 0, 1, 1,
-1.09718, 1.902142, -0.9862363, 1, 0, 0, 1, 1,
-1.090081, 0.5190676, -1.079804, 0, 0, 0, 1, 1,
-1.085467, 0.0368538, -0.888642, 0, 0, 0, 1, 1,
-1.083343, -0.4674455, -1.985919, 0, 0, 0, 1, 1,
-1.079254, -0.1402458, -2.121343, 0, 0, 0, 1, 1,
-1.060638, -0.333869, -1.592989, 0, 0, 0, 1, 1,
-1.060096, 1.166268, -3.589809, 0, 0, 0, 1, 1,
-1.058185, 1.087231, 0.1779508, 0, 0, 0, 1, 1,
-1.051763, -0.8282758, -2.382058, 1, 1, 1, 1, 1,
-1.051557, -0.4057026, -1.640466, 1, 1, 1, 1, 1,
-1.048842, 0.2519127, -1.71351, 1, 1, 1, 1, 1,
-1.03821, 0.7966638, -0.9958935, 1, 1, 1, 1, 1,
-1.023884, 0.2990662, -2.790707, 1, 1, 1, 1, 1,
-1.015405, 1.166618, -1.417766, 1, 1, 1, 1, 1,
-1.013207, 0.3742204, -1.120052, 1, 1, 1, 1, 1,
-1.01167, -1.473216, -2.845572, 1, 1, 1, 1, 1,
-1.003379, -1.959482, -3.67676, 1, 1, 1, 1, 1,
-0.9994392, 0.5451919, -0.3376529, 1, 1, 1, 1, 1,
-0.9985532, 0.6578347, -2.401403, 1, 1, 1, 1, 1,
-0.9961435, -0.1437922, -1.851551, 1, 1, 1, 1, 1,
-0.9862338, -0.4566859, -1.87545, 1, 1, 1, 1, 1,
-0.9809053, 1.036154, 0.8701926, 1, 1, 1, 1, 1,
-0.9805, -0.9120975, -3.431817, 1, 1, 1, 1, 1,
-0.9794089, 0.6616524, 1.478663, 0, 0, 1, 1, 1,
-0.9779781, 0.4176784, -0.4182956, 1, 0, 0, 1, 1,
-0.9762453, -1.595054, -2.36819, 1, 0, 0, 1, 1,
-0.9759898, -1.522116, -3.504158, 1, 0, 0, 1, 1,
-0.9722223, 0.7188444, -2.216887, 1, 0, 0, 1, 1,
-0.9706444, 0.6930159, -1.714724, 1, 0, 0, 1, 1,
-0.9664121, -1.083468, -0.4952523, 0, 0, 0, 1, 1,
-0.9659805, -0.06735694, -1.728247, 0, 0, 0, 1, 1,
-0.9467385, -0.2902066, -2.452971, 0, 0, 0, 1, 1,
-0.9372284, -0.01051587, -2.49331, 0, 0, 0, 1, 1,
-0.9348459, -0.4908508, -3.980248, 0, 0, 0, 1, 1,
-0.9338558, -0.837638, -3.560602, 0, 0, 0, 1, 1,
-0.931014, 0.7540838, -1.568112, 0, 0, 0, 1, 1,
-0.9306582, -1.80252, -1.913188, 1, 1, 1, 1, 1,
-0.9259184, -1.561007, -2.012194, 1, 1, 1, 1, 1,
-0.9206459, -0.04037884, -1.967479, 1, 1, 1, 1, 1,
-0.9189918, 1.414675, -0.5840712, 1, 1, 1, 1, 1,
-0.915397, 1.873335, -1.722672, 1, 1, 1, 1, 1,
-0.9142379, -0.8723149, -2.839261, 1, 1, 1, 1, 1,
-0.9135392, -0.07272433, -1.807963, 1, 1, 1, 1, 1,
-0.9125218, -0.7608233, -4.212651, 1, 1, 1, 1, 1,
-0.9083965, 0.9669442, -1.544997, 1, 1, 1, 1, 1,
-0.9074767, -0.8510792, -2.82102, 1, 1, 1, 1, 1,
-0.904669, 0.9261898, -1.138126, 1, 1, 1, 1, 1,
-0.9018368, -1.005976, -3.130252, 1, 1, 1, 1, 1,
-0.8952997, 0.166432, -2.641973, 1, 1, 1, 1, 1,
-0.8915704, 0.7246789, -1.1634, 1, 1, 1, 1, 1,
-0.8911092, 0.6694146, -1.686928, 1, 1, 1, 1, 1,
-0.8796018, 0.2399257, -2.845409, 0, 0, 1, 1, 1,
-0.8779622, -0.06278964, -2.532552, 1, 0, 0, 1, 1,
-0.868847, -1.621648, -2.026861, 1, 0, 0, 1, 1,
-0.8558688, -0.2131541, -1.571445, 1, 0, 0, 1, 1,
-0.8433971, 0.07895666, -0.8762708, 1, 0, 0, 1, 1,
-0.8408615, -0.4011213, -2.349466, 1, 0, 0, 1, 1,
-0.8344305, 1.732139, 0.5463812, 0, 0, 0, 1, 1,
-0.8290371, 0.1468115, -1.911205, 0, 0, 0, 1, 1,
-0.8255634, 0.8913615, 0.211257, 0, 0, 0, 1, 1,
-0.8252746, -0.664691, -2.234679, 0, 0, 0, 1, 1,
-0.8184379, 0.3966822, -2.267209, 0, 0, 0, 1, 1,
-0.8171489, 1.622913, 0.06377313, 0, 0, 0, 1, 1,
-0.8158322, 0.157557, -1.132124, 0, 0, 0, 1, 1,
-0.8143504, 1.231404, -1.46862, 1, 1, 1, 1, 1,
-0.8065017, 0.5788335, 0.0695316, 1, 1, 1, 1, 1,
-0.8061658, -0.5528835, -0.1389427, 1, 1, 1, 1, 1,
-0.7986991, 1.685239, 0.4379992, 1, 1, 1, 1, 1,
-0.7951908, 1.188076, -1.545987, 1, 1, 1, 1, 1,
-0.7918415, -0.7580815, -2.305068, 1, 1, 1, 1, 1,
-0.7898711, 0.4360011, -2.834934, 1, 1, 1, 1, 1,
-0.7891579, -0.08143314, -2.374401, 1, 1, 1, 1, 1,
-0.7859513, -0.8269451, -1.727303, 1, 1, 1, 1, 1,
-0.7717376, -0.2295748, -2.033202, 1, 1, 1, 1, 1,
-0.7712842, -0.07410978, -0.6754723, 1, 1, 1, 1, 1,
-0.7651802, 0.4085329, 0.6400155, 1, 1, 1, 1, 1,
-0.7606417, -0.5665293, -2.695076, 1, 1, 1, 1, 1,
-0.7584944, 1.246687, 0.05186135, 1, 1, 1, 1, 1,
-0.7579854, 1.232981, -1.6819, 1, 1, 1, 1, 1,
-0.7561641, -0.9654235, -2.159523, 0, 0, 1, 1, 1,
-0.756059, -3.144669, -2.478531, 1, 0, 0, 1, 1,
-0.7540966, 0.4267396, 1.046471, 1, 0, 0, 1, 1,
-0.7522296, 0.9584813, 0.8765534, 1, 0, 0, 1, 1,
-0.7476448, -0.7168444, -2.146392, 1, 0, 0, 1, 1,
-0.7456415, 1.167202, 0.3375193, 1, 0, 0, 1, 1,
-0.7406567, 0.9038265, -0.3004437, 0, 0, 0, 1, 1,
-0.7371933, 0.3832714, -1.491803, 0, 0, 0, 1, 1,
-0.7298481, -0.306904, -3.351363, 0, 0, 0, 1, 1,
-0.7237651, -1.101163, -1.188255, 0, 0, 0, 1, 1,
-0.7199728, -1.329729, -3.48716, 0, 0, 0, 1, 1,
-0.7173789, -2.624532, -1.472699, 0, 0, 0, 1, 1,
-0.7162754, -1.843624, -3.880929, 0, 0, 0, 1, 1,
-0.7148243, -0.6761582, -2.284395, 1, 1, 1, 1, 1,
-0.7117245, 0.969765, 0.4906944, 1, 1, 1, 1, 1,
-0.7091327, -0.5862051, -1.946227, 1, 1, 1, 1, 1,
-0.7051316, -1.160261, -2.320709, 1, 1, 1, 1, 1,
-0.6923705, 2.374933, -0.6982958, 1, 1, 1, 1, 1,
-0.6904719, 0.6198377, -3.27332, 1, 1, 1, 1, 1,
-0.6813769, -0.2951664, -0.4770706, 1, 1, 1, 1, 1,
-0.6813345, -1.437827, -3.502252, 1, 1, 1, 1, 1,
-0.6787453, 0.7244675, -2.554785, 1, 1, 1, 1, 1,
-0.6782933, -0.1766941, -1.86845, 1, 1, 1, 1, 1,
-0.6751404, -0.01918436, -3.77085, 1, 1, 1, 1, 1,
-0.6727475, 1.309007, 0.6339992, 1, 1, 1, 1, 1,
-0.6708608, 0.3010472, -2.074905, 1, 1, 1, 1, 1,
-0.669383, -0.1541094, -2.615313, 1, 1, 1, 1, 1,
-0.6683654, 0.9745376, -1.003843, 1, 1, 1, 1, 1,
-0.6678762, 0.5361011, -1.657482, 0, 0, 1, 1, 1,
-0.6671463, -0.8539456, -2.812165, 1, 0, 0, 1, 1,
-0.6624045, -1.287287, -2.318281, 1, 0, 0, 1, 1,
-0.6581275, -1.212858, -4.671228, 1, 0, 0, 1, 1,
-0.6580871, -1.699605, -3.318646, 1, 0, 0, 1, 1,
-0.6560504, -0.3118084, -2.230845, 1, 0, 0, 1, 1,
-0.6539161, -0.5659889, -2.061399, 0, 0, 0, 1, 1,
-0.6442168, 0.8711477, -0.9016501, 0, 0, 0, 1, 1,
-0.643793, 0.192341, -1.662471, 0, 0, 0, 1, 1,
-0.6389876, 1.636512, 1.113928, 0, 0, 0, 1, 1,
-0.633118, 0.1277273, -0.5718125, 0, 0, 0, 1, 1,
-0.6313328, 0.8219174, -0.9559788, 0, 0, 0, 1, 1,
-0.6310991, 1.052873, 0.4985698, 0, 0, 0, 1, 1,
-0.6307765, 0.840968, -1.187291, 1, 1, 1, 1, 1,
-0.6266215, 0.8016337, -0.5809029, 1, 1, 1, 1, 1,
-0.6241434, -2.552643, -3.180735, 1, 1, 1, 1, 1,
-0.6215712, 0.4049858, -1.220534, 1, 1, 1, 1, 1,
-0.6188098, -0.2154558, -1.491253, 1, 1, 1, 1, 1,
-0.6171053, 0.3118374, -1.60127, 1, 1, 1, 1, 1,
-0.6150932, -0.5888472, -2.200042, 1, 1, 1, 1, 1,
-0.6137931, 0.1406074, -2.504647, 1, 1, 1, 1, 1,
-0.6082392, -1.658181, -3.173597, 1, 1, 1, 1, 1,
-0.6011134, 0.7055132, -1.903188, 1, 1, 1, 1, 1,
-0.6004862, 1.381195, -0.5736015, 1, 1, 1, 1, 1,
-0.6003402, -0.7812517, -1.987207, 1, 1, 1, 1, 1,
-0.5999401, -0.2282857, -2.369818, 1, 1, 1, 1, 1,
-0.5987853, 0.9772912, -2.066454, 1, 1, 1, 1, 1,
-0.5941323, -0.4266355, -1.172931, 1, 1, 1, 1, 1,
-0.5907532, 0.6532882, -1.237202, 0, 0, 1, 1, 1,
-0.5895462, 0.7366686, 1.057838, 1, 0, 0, 1, 1,
-0.5894879, -0.6685491, -2.154845, 1, 0, 0, 1, 1,
-0.5801015, -1.158726, -3.723554, 1, 0, 0, 1, 1,
-0.5793585, -0.3359483, -2.346499, 1, 0, 0, 1, 1,
-0.5775228, 2.383457, 2.111286, 1, 0, 0, 1, 1,
-0.5773579, -0.5651486, -1.812513, 0, 0, 0, 1, 1,
-0.5668536, 1.427913, -1.840061, 0, 0, 0, 1, 1,
-0.563821, -0.868806, -2.958493, 0, 0, 0, 1, 1,
-0.5607123, 1.436122, 0.04239965, 0, 0, 0, 1, 1,
-0.5556065, 0.4361114, 0.5252723, 0, 0, 0, 1, 1,
-0.5405241, -0.1695549, -2.590057, 0, 0, 0, 1, 1,
-0.5401514, 1.203237, -1.324241, 0, 0, 0, 1, 1,
-0.5360913, -0.4967158, -1.01357, 1, 1, 1, 1, 1,
-0.534311, -0.481287, -3.13361, 1, 1, 1, 1, 1,
-0.5339126, -1.489021, -2.8105, 1, 1, 1, 1, 1,
-0.5299903, 0.9759857, -0.8285294, 1, 1, 1, 1, 1,
-0.5282595, 0.4933329, -1.587722, 1, 1, 1, 1, 1,
-0.5243128, 0.839842, 1.832253, 1, 1, 1, 1, 1,
-0.5227239, -0.8605068, -1.035824, 1, 1, 1, 1, 1,
-0.5204366, -0.4979039, -2.724273, 1, 1, 1, 1, 1,
-0.5192131, -0.5886533, -3.32459, 1, 1, 1, 1, 1,
-0.5137573, -1.361895, -3.619873, 1, 1, 1, 1, 1,
-0.5122902, 0.2261667, -2.722826, 1, 1, 1, 1, 1,
-0.5096279, 0.5387499, -0.4111095, 1, 1, 1, 1, 1,
-0.5062232, 0.2861597, -1.700566, 1, 1, 1, 1, 1,
-0.5003703, 0.3039389, -0.7092346, 1, 1, 1, 1, 1,
-0.4994529, 1.321001, 0.4751521, 1, 1, 1, 1, 1,
-0.4976784, -0.898192, -4.00815, 0, 0, 1, 1, 1,
-0.4961157, -0.3921959, -1.498559, 1, 0, 0, 1, 1,
-0.4942966, -0.08278642, -1.770012, 1, 0, 0, 1, 1,
-0.4935456, -0.4340396, -2.066777, 1, 0, 0, 1, 1,
-0.4931552, -1.271901, -3.958357, 1, 0, 0, 1, 1,
-0.4883419, 0.4311024, -2.083191, 1, 0, 0, 1, 1,
-0.4848022, -0.09427963, -1.360732, 0, 0, 0, 1, 1,
-0.4822166, -0.5284953, -3.855153, 0, 0, 0, 1, 1,
-0.4807641, 0.4513606, 0.4526673, 0, 0, 0, 1, 1,
-0.4805922, -0.9584097, -3.331026, 0, 0, 0, 1, 1,
-0.480413, 1.012093, -1.227947, 0, 0, 0, 1, 1,
-0.4777065, 1.04308, -0.8258064, 0, 0, 0, 1, 1,
-0.4774716, -0.5802867, -2.100718, 0, 0, 0, 1, 1,
-0.4750707, -0.6580631, -3.403138, 1, 1, 1, 1, 1,
-0.4747189, -0.2966272, -2.743492, 1, 1, 1, 1, 1,
-0.4701227, 0.1672764, -1.363999, 1, 1, 1, 1, 1,
-0.4675196, 0.1886251, -1.196283, 1, 1, 1, 1, 1,
-0.4673917, 1.602069, 0.1323714, 1, 1, 1, 1, 1,
-0.466684, -0.2598612, -4.065888, 1, 1, 1, 1, 1,
-0.4619963, 0.9705873, 2.179454, 1, 1, 1, 1, 1,
-0.4562944, 1.527339, 0.4475955, 1, 1, 1, 1, 1,
-0.4551333, -1.753076, -2.94862, 1, 1, 1, 1, 1,
-0.4510219, -0.2293342, -2.631365, 1, 1, 1, 1, 1,
-0.4488382, -1.079836, -1.778752, 1, 1, 1, 1, 1,
-0.4472147, 0.7706236, -1.241027, 1, 1, 1, 1, 1,
-0.4426954, -0.8373263, -1.442583, 1, 1, 1, 1, 1,
-0.4411111, 2.202275, -2.077011, 1, 1, 1, 1, 1,
-0.4381102, -0.559465, -1.716134, 1, 1, 1, 1, 1,
-0.4370389, -0.1262002, -1.933506, 0, 0, 1, 1, 1,
-0.4340309, -1.710837, -1.810389, 1, 0, 0, 1, 1,
-0.4326268, -0.8971887, -2.715395, 1, 0, 0, 1, 1,
-0.4322468, -0.8327003, -2.483789, 1, 0, 0, 1, 1,
-0.4293428, -1.082071, -2.776835, 1, 0, 0, 1, 1,
-0.4280111, -0.01260055, -0.6211323, 1, 0, 0, 1, 1,
-0.4269185, -1.259313, -2.708733, 0, 0, 0, 1, 1,
-0.4230451, -1.633829, -3.759671, 0, 0, 0, 1, 1,
-0.4224806, 0.3734209, 0.2607468, 0, 0, 0, 1, 1,
-0.4221311, 1.614447, -0.4194557, 0, 0, 0, 1, 1,
-0.4198571, 1.912139, 0.1257195, 0, 0, 0, 1, 1,
-0.4187064, 0.1351581, -1.076823, 0, 0, 0, 1, 1,
-0.4173108, -0.3682676, -1.077941, 0, 0, 0, 1, 1,
-0.4170049, 1.061951, 1.233552, 1, 1, 1, 1, 1,
-0.4167648, -0.5028135, -1.893095, 1, 1, 1, 1, 1,
-0.4130754, 1.397278, 0.4681014, 1, 1, 1, 1, 1,
-0.4112032, -0.6332516, -2.664825, 1, 1, 1, 1, 1,
-0.4102622, 0.3729349, 1.344202, 1, 1, 1, 1, 1,
-0.41022, 0.6557065, 1.091284, 1, 1, 1, 1, 1,
-0.4029176, 0.2373111, -1.525292, 1, 1, 1, 1, 1,
-0.402078, 0.239859, -1.503857, 1, 1, 1, 1, 1,
-0.4004526, 0.9604832, -0.345161, 1, 1, 1, 1, 1,
-0.4002838, 0.7963706, -0.7524226, 1, 1, 1, 1, 1,
-0.3916331, 1.367719, -0.5639454, 1, 1, 1, 1, 1,
-0.3905725, -0.1280712, -2.114952, 1, 1, 1, 1, 1,
-0.3831672, -0.7628945, -4.475918, 1, 1, 1, 1, 1,
-0.382116, -1.509461, -2.248183, 1, 1, 1, 1, 1,
-0.3764896, -0.04139136, -0.8635238, 1, 1, 1, 1, 1,
-0.3760752, 1.233559, -1.624128, 0, 0, 1, 1, 1,
-0.3734962, 0.08631495, -0.6543923, 1, 0, 0, 1, 1,
-0.3729017, 2.030342, 0.1392235, 1, 0, 0, 1, 1,
-0.3701133, 0.1139753, -2.193582, 1, 0, 0, 1, 1,
-0.3700116, -0.4753286, -1.901751, 1, 0, 0, 1, 1,
-0.3693829, 1.320898, -1.122058, 1, 0, 0, 1, 1,
-0.3678267, -0.7496355, -1.754378, 0, 0, 0, 1, 1,
-0.3642612, -0.6239898, -3.318278, 0, 0, 0, 1, 1,
-0.3622598, 1.513113, -1.879077, 0, 0, 0, 1, 1,
-0.3607861, 2.273909, -1.117265, 0, 0, 0, 1, 1,
-0.3552832, 0.01550499, -0.9273213, 0, 0, 0, 1, 1,
-0.3546214, -1.165073, -3.006516, 0, 0, 0, 1, 1,
-0.3544179, -1.140511, -2.180858, 0, 0, 0, 1, 1,
-0.3527466, 0.08024674, -0.5547794, 1, 1, 1, 1, 1,
-0.351522, 0.6153343, -0.3263912, 1, 1, 1, 1, 1,
-0.3494024, 1.132614, -1.836364, 1, 1, 1, 1, 1,
-0.3493896, 1.018376, -1.075408, 1, 1, 1, 1, 1,
-0.3472358, -0.02723275, -0.8394907, 1, 1, 1, 1, 1,
-0.3446765, -2.518363, -3.024712, 1, 1, 1, 1, 1,
-0.3428958, 1.468249, 0.4561976, 1, 1, 1, 1, 1,
-0.3402528, 0.3018258, -0.3487733, 1, 1, 1, 1, 1,
-0.331617, 0.7228944, -0.1579524, 1, 1, 1, 1, 1,
-0.3314117, -1.507433, -2.389429, 1, 1, 1, 1, 1,
-0.3248802, -0.2144828, -4.401998, 1, 1, 1, 1, 1,
-0.323802, 2.45242, 0.7637411, 1, 1, 1, 1, 1,
-0.3236282, 1.806544, 1.567626, 1, 1, 1, 1, 1,
-0.321938, 0.5892033, -0.8935402, 1, 1, 1, 1, 1,
-0.3207869, 0.2607881, -1.20313, 1, 1, 1, 1, 1,
-0.3193461, 1.931519, -0.1271951, 0, 0, 1, 1, 1,
-0.3185888, 0.2714615, -0.2083063, 1, 0, 0, 1, 1,
-0.3154599, -0.1526583, -3.358485, 1, 0, 0, 1, 1,
-0.3091467, -0.3555244, -2.598301, 1, 0, 0, 1, 1,
-0.3081573, -1.276803, -2.569087, 1, 0, 0, 1, 1,
-0.2961571, -2.035074, -1.870167, 1, 0, 0, 1, 1,
-0.2936165, -1.751086, -2.729433, 0, 0, 0, 1, 1,
-0.2906809, 0.3851714, -0.7295848, 0, 0, 0, 1, 1,
-0.2886098, -0.5593979, -2.035731, 0, 0, 0, 1, 1,
-0.2877424, 0.9025797, 0.5038793, 0, 0, 0, 1, 1,
-0.2830144, -1.309456, -2.849125, 0, 0, 0, 1, 1,
-0.2819778, 0.7763628, -0.2017029, 0, 0, 0, 1, 1,
-0.281075, 1.225785, -0.04154976, 0, 0, 0, 1, 1,
-0.2805068, 0.9208491, -1.070822, 1, 1, 1, 1, 1,
-0.2800546, 0.8384329, -0.2918586, 1, 1, 1, 1, 1,
-0.2773575, -0.2472368, -2.564811, 1, 1, 1, 1, 1,
-0.2767943, -1.162674, -1.793915, 1, 1, 1, 1, 1,
-0.2755112, 0.737464, -1.556868, 1, 1, 1, 1, 1,
-0.2728977, -0.8235754, -2.926564, 1, 1, 1, 1, 1,
-0.2610104, 0.7520661, -1.307737, 1, 1, 1, 1, 1,
-0.255071, 0.5134636, -0.1143679, 1, 1, 1, 1, 1,
-0.2490819, 0.3392215, -2.099127, 1, 1, 1, 1, 1,
-0.2451388, 0.4334845, -0.1354273, 1, 1, 1, 1, 1,
-0.2412082, 0.1891154, 0.01318129, 1, 1, 1, 1, 1,
-0.2405014, -0.8683214, -4.328093, 1, 1, 1, 1, 1,
-0.2392889, -0.9368962, -2.070666, 1, 1, 1, 1, 1,
-0.2336547, 0.2152252, -1.39971, 1, 1, 1, 1, 1,
-0.2306236, 0.1262881, 0.2795461, 1, 1, 1, 1, 1,
-0.2296048, -1.056913, -1.500804, 0, 0, 1, 1, 1,
-0.2265924, 0.3591353, -0.1101635, 1, 0, 0, 1, 1,
-0.2241725, 0.6646398, 0.3240418, 1, 0, 0, 1, 1,
-0.2202983, -1.584757, -3.633285, 1, 0, 0, 1, 1,
-0.2112706, -0.7189561, -2.761793, 1, 0, 0, 1, 1,
-0.1977097, -2.258269, -4.340338, 1, 0, 0, 1, 1,
-0.1962653, 0.9801634, -0.3352719, 0, 0, 0, 1, 1,
-0.19231, -0.004558573, -1.882545, 0, 0, 0, 1, 1,
-0.1905941, -0.3590674, -1.833887, 0, 0, 0, 1, 1,
-0.1891423, -0.1002105, -2.616414, 0, 0, 0, 1, 1,
-0.1883689, -1.259353, -3.56698, 0, 0, 0, 1, 1,
-0.18664, -1.467106, -3.143936, 0, 0, 0, 1, 1,
-0.1838373, -0.5966469, -0.2954765, 0, 0, 0, 1, 1,
-0.1836307, -0.6609394, -2.407169, 1, 1, 1, 1, 1,
-0.1829578, 0.2874537, -0.7543666, 1, 1, 1, 1, 1,
-0.1795363, 0.4698134, -1.131833, 1, 1, 1, 1, 1,
-0.1772047, 0.1126881, -1.941965, 1, 1, 1, 1, 1,
-0.1766827, -0.8385844, -1.567356, 1, 1, 1, 1, 1,
-0.1731143, 0.7475477, -0.05790603, 1, 1, 1, 1, 1,
-0.1725851, 0.3587589, 0.2704482, 1, 1, 1, 1, 1,
-0.1696674, 0.2223545, -4.52419, 1, 1, 1, 1, 1,
-0.16851, 1.736962, -1.490332, 1, 1, 1, 1, 1,
-0.1675025, -2.46598, -3.524903, 1, 1, 1, 1, 1,
-0.1636102, -0.8405758, -3.410752, 1, 1, 1, 1, 1,
-0.1608853, -2.460069, -3.5304, 1, 1, 1, 1, 1,
-0.145056, 1.824635, -0.2666509, 1, 1, 1, 1, 1,
-0.1438506, 0.978734, 0.1876741, 1, 1, 1, 1, 1,
-0.1407652, -1.514886, -3.542755, 1, 1, 1, 1, 1,
-0.1393653, -2.946411, -2.302683, 0, 0, 1, 1, 1,
-0.1392089, 0.217359, -2.06925, 1, 0, 0, 1, 1,
-0.1392071, -0.09988973, -2.530334, 1, 0, 0, 1, 1,
-0.13119, 1.124308, -1.818092, 1, 0, 0, 1, 1,
-0.1255528, -0.725729, -1.842926, 1, 0, 0, 1, 1,
-0.1235403, 2.302623, 0.08026856, 1, 0, 0, 1, 1,
-0.1221248, -1.969614, -1.374675, 0, 0, 0, 1, 1,
-0.1138023, 1.326311, 0.7371125, 0, 0, 0, 1, 1,
-0.1137928, -0.7949072, -5.282682, 0, 0, 0, 1, 1,
-0.1126364, -1.613085, -2.972696, 0, 0, 0, 1, 1,
-0.1124307, -0.9940608, -3.32851, 0, 0, 0, 1, 1,
-0.1096741, -0.3727683, -4.064246, 0, 0, 0, 1, 1,
-0.1051212, 0.3581399, -0.03269564, 0, 0, 0, 1, 1,
-0.1046655, -1.120568, 0.07515826, 1, 1, 1, 1, 1,
-0.1043632, 0.04755891, -1.156714, 1, 1, 1, 1, 1,
-0.1012398, 2.235416, 1.518863, 1, 1, 1, 1, 1,
-0.09916508, -0.391651, -3.521811, 1, 1, 1, 1, 1,
-0.09811211, -0.3715479, -2.847409, 1, 1, 1, 1, 1,
-0.09093976, 0.4770146, 0.8173009, 1, 1, 1, 1, 1,
-0.08684709, 0.7705231, -1.072163, 1, 1, 1, 1, 1,
-0.08592308, 1.521369, -0.2930881, 1, 1, 1, 1, 1,
-0.08562966, 1.117386, 0.534882, 1, 1, 1, 1, 1,
-0.08459215, 0.9283661, 0.802592, 1, 1, 1, 1, 1,
-0.08324647, -0.5409775, -1.341864, 1, 1, 1, 1, 1,
-0.08280862, -0.8563772, -3.349853, 1, 1, 1, 1, 1,
-0.08256264, 1.810884, -1.57172, 1, 1, 1, 1, 1,
-0.07650198, -1.004832, -2.276366, 1, 1, 1, 1, 1,
-0.07547938, -0.6025707, -2.444848, 1, 1, 1, 1, 1,
-0.07265576, 0.6889988, 0.1641194, 0, 0, 1, 1, 1,
-0.07258975, 0.8651829, -0.1431601, 1, 0, 0, 1, 1,
-0.06788645, 1.23916, 0.1336753, 1, 0, 0, 1, 1,
-0.06263862, 0.7629828, -0.03374042, 1, 0, 0, 1, 1,
-0.06204585, -0.7455168, -5.460182, 1, 0, 0, 1, 1,
-0.06181805, -1.964236, -3.161444, 1, 0, 0, 1, 1,
-0.05675291, 0.05997871, -0.9681296, 0, 0, 0, 1, 1,
-0.05601956, -0.9964397, -3.657504, 0, 0, 0, 1, 1,
-0.0557473, 0.6008732, -0.4845081, 0, 0, 0, 1, 1,
-0.045538, 0.4442703, 0.1427447, 0, 0, 0, 1, 1,
-0.04441363, -0.3841743, -2.521223, 0, 0, 0, 1, 1,
-0.04229577, 0.01334891, -0.5565684, 0, 0, 0, 1, 1,
-0.03935533, 1.410001, -0.7710536, 0, 0, 0, 1, 1,
-0.03721815, -0.236452, -3.336544, 1, 1, 1, 1, 1,
-0.03391544, 0.7555828, 1.422201, 1, 1, 1, 1, 1,
-0.02952687, 1.624545, -1.25272, 1, 1, 1, 1, 1,
-0.02913212, -1.086555, -2.92104, 1, 1, 1, 1, 1,
-0.02341604, 0.3706359, 0.4335962, 1, 1, 1, 1, 1,
-0.02275766, 0.2637727, 1.588915, 1, 1, 1, 1, 1,
-0.02152523, -0.08189338, -2.128668, 1, 1, 1, 1, 1,
-0.01937523, 0.547325, 0.3356046, 1, 1, 1, 1, 1,
-0.01598778, -0.3666654, -2.842, 1, 1, 1, 1, 1,
-0.006476397, -0.6952196, -3.369483, 1, 1, 1, 1, 1,
-0.005932964, 0.9870362, -1.089992, 1, 1, 1, 1, 1,
-0.005899536, -0.485967, -4.314614, 1, 1, 1, 1, 1,
-0.005359736, 0.220422, -0.3802663, 1, 1, 1, 1, 1,
-0.003350649, -0.7616997, -2.161629, 1, 1, 1, 1, 1,
-0.002827202, 1.140403, 1.04769, 1, 1, 1, 1, 1,
-0.002745658, 1.525983, -0.2782019, 0, 0, 1, 1, 1,
-0.002595717, 0.195076, -0.6397293, 1, 0, 0, 1, 1,
-0.001940428, 0.4274806, -1.512528, 1, 0, 0, 1, 1,
-0.001612809, -0.8570708, -2.481929, 1, 0, 0, 1, 1,
0.004024119, 0.4573765, -0.2345546, 1, 0, 0, 1, 1,
0.004523236, 1.064931, -2.098813, 1, 0, 0, 1, 1,
0.01035079, 0.3760174, 0.4398537, 0, 0, 0, 1, 1,
0.01337142, 0.4526453, -0.05500993, 0, 0, 0, 1, 1,
0.01997565, 0.7013711, -0.926488, 0, 0, 0, 1, 1,
0.02460394, 1.32479, 0.7559297, 0, 0, 0, 1, 1,
0.02519294, 1.542596, -0.04978593, 0, 0, 0, 1, 1,
0.03227343, -0.5440409, 3.665801, 0, 0, 0, 1, 1,
0.0366273, 0.159168, 0.3343511, 0, 0, 0, 1, 1,
0.03739237, -0.005673425, 1.116754, 1, 1, 1, 1, 1,
0.0393465, 1.199383, -0.4268867, 1, 1, 1, 1, 1,
0.04510407, -0.3361431, 3.418427, 1, 1, 1, 1, 1,
0.04775893, 0.2839094, 0.3793638, 1, 1, 1, 1, 1,
0.05330837, -0.9511989, 2.50654, 1, 1, 1, 1, 1,
0.05332861, -0.4063613, 2.113657, 1, 1, 1, 1, 1,
0.05419042, -1.156615, 2.522818, 1, 1, 1, 1, 1,
0.05649102, 0.333592, -2.152007, 1, 1, 1, 1, 1,
0.05812904, -0.5951141, 3.123735, 1, 1, 1, 1, 1,
0.05837344, -0.4255127, 4.594299, 1, 1, 1, 1, 1,
0.06339946, -1.376638, 4.156843, 1, 1, 1, 1, 1,
0.0639887, -0.04773772, 2.844259, 1, 1, 1, 1, 1,
0.07196034, -0.9007378, 2.679472, 1, 1, 1, 1, 1,
0.07766923, -0.9902829, 2.693379, 1, 1, 1, 1, 1,
0.07943524, -1.5555, 2.707451, 1, 1, 1, 1, 1,
0.08358061, 0.1579194, 1.009468, 0, 0, 1, 1, 1,
0.0838025, 0.7884262, -0.204153, 1, 0, 0, 1, 1,
0.08623486, -0.04038624, 1.347042, 1, 0, 0, 1, 1,
0.09145555, -0.9533362, 3.694792, 1, 0, 0, 1, 1,
0.0959585, 0.9163102, -0.5926635, 1, 0, 0, 1, 1,
0.0965779, 0.1187849, 1.3846, 1, 0, 0, 1, 1,
0.09744211, -1.852929, 2.936661, 0, 0, 0, 1, 1,
0.1088315, 0.4474811, 0.4540021, 0, 0, 0, 1, 1,
0.1118528, -0.5542693, 2.526884, 0, 0, 0, 1, 1,
0.1127204, -0.444197, 3.404886, 0, 0, 0, 1, 1,
0.1163155, -0.1560049, 3.43994, 0, 0, 0, 1, 1,
0.1163834, 0.3123334, -0.4310482, 0, 0, 0, 1, 1,
0.1239334, -1.242383, 2.34552, 0, 0, 0, 1, 1,
0.1241474, -0.7411066, 4.17873, 1, 1, 1, 1, 1,
0.124381, 0.01002125, 2.836766, 1, 1, 1, 1, 1,
0.1336997, -0.2686706, 2.576349, 1, 1, 1, 1, 1,
0.1347988, 0.09066011, 0.4340272, 1, 1, 1, 1, 1,
0.1389118, -1.528913, 2.640246, 1, 1, 1, 1, 1,
0.1395001, -0.5162626, 0.1884547, 1, 1, 1, 1, 1,
0.1412996, 2.284488, -0.23663, 1, 1, 1, 1, 1,
0.1425622, 0.5927734, 0.6828464, 1, 1, 1, 1, 1,
0.1455003, -1.540903, 4.490859, 1, 1, 1, 1, 1,
0.1467082, -1.187606, 2.969314, 1, 1, 1, 1, 1,
0.1479528, -1.573191, 1.585451, 1, 1, 1, 1, 1,
0.1532649, 1.796482, 1.841513, 1, 1, 1, 1, 1,
0.1550359, -1.226178, 3.683287, 1, 1, 1, 1, 1,
0.1633993, 1.040427, -1.068745, 1, 1, 1, 1, 1,
0.1652431, 0.894407, -0.6084879, 1, 1, 1, 1, 1,
0.1678336, 0.01479779, 3.057926, 0, 0, 1, 1, 1,
0.1706922, 0.1190982, 1.735662, 1, 0, 0, 1, 1,
0.1724335, 2.75842, 0.2146888, 1, 0, 0, 1, 1,
0.1741748, 0.1557914, 1.675023, 1, 0, 0, 1, 1,
0.1757373, 1.061113, 1.203004, 1, 0, 0, 1, 1,
0.1781033, 0.7111197, -0.7418924, 1, 0, 0, 1, 1,
0.1807203, -0.3013157, 2.192784, 0, 0, 0, 1, 1,
0.1861793, 0.7392929, -1.343077, 0, 0, 0, 1, 1,
0.1864811, 1.087435, 0.3282327, 0, 0, 0, 1, 1,
0.1866936, 0.09629789, 3.01245, 0, 0, 0, 1, 1,
0.1868671, 1.52898, 0.1498762, 0, 0, 0, 1, 1,
0.1887833, -0.2469781, 2.024043, 0, 0, 0, 1, 1,
0.192863, 1.642331, 0.875225, 0, 0, 0, 1, 1,
0.1942909, 0.2995818, 0.0661797, 1, 1, 1, 1, 1,
0.1947794, 0.1666816, 1.010001, 1, 1, 1, 1, 1,
0.1977705, 0.04707019, -0.06148418, 1, 1, 1, 1, 1,
0.2011022, -1.392719, 2.190932, 1, 1, 1, 1, 1,
0.2011201, 0.2997959, 0.7341904, 1, 1, 1, 1, 1,
0.2024127, -1.321061, 1.726965, 1, 1, 1, 1, 1,
0.2039718, 0.9486548, 0.4487052, 1, 1, 1, 1, 1,
0.2142245, -0.3716717, 4.338082, 1, 1, 1, 1, 1,
0.2174303, 1.815513, 0.5041735, 1, 1, 1, 1, 1,
0.2196358, 0.249395, -0.5031328, 1, 1, 1, 1, 1,
0.2211239, -1.013309, 1.724785, 1, 1, 1, 1, 1,
0.2212641, 0.6932374, 0.1258726, 1, 1, 1, 1, 1,
0.2273526, -0.7036178, 3.706354, 1, 1, 1, 1, 1,
0.2278069, 0.0235793, 1.864333, 1, 1, 1, 1, 1,
0.2300841, 0.6348087, -1.59274, 1, 1, 1, 1, 1,
0.2314804, -1.043967, 2.499136, 0, 0, 1, 1, 1,
0.2402119, -0.6926156, 2.789015, 1, 0, 0, 1, 1,
0.2446444, -0.2453101, 1.47279, 1, 0, 0, 1, 1,
0.2484583, -0.1185482, 2.611583, 1, 0, 0, 1, 1,
0.2497093, 1.640999, 0.5278169, 1, 0, 0, 1, 1,
0.2497225, 0.6804612, 1.627025, 1, 0, 0, 1, 1,
0.2506251, -0.688758, 1.848698, 0, 0, 0, 1, 1,
0.2511481, 0.3977029, 0.7444553, 0, 0, 0, 1, 1,
0.2513105, 1.642494, -1.366528, 0, 0, 0, 1, 1,
0.2522931, -0.03800501, 1.250577, 0, 0, 0, 1, 1,
0.2556304, -1.458972, 2.005089, 0, 0, 0, 1, 1,
0.2562103, 1.051073, 1.805806, 0, 0, 0, 1, 1,
0.2567641, 0.8731196, -0.7544582, 0, 0, 0, 1, 1,
0.266291, 0.7046867, -0.09328211, 1, 1, 1, 1, 1,
0.2666044, -0.7007909, 1.824451, 1, 1, 1, 1, 1,
0.2685221, 0.02103743, 1.246718, 1, 1, 1, 1, 1,
0.2694391, -0.05864125, 1.260303, 1, 1, 1, 1, 1,
0.2756393, 0.8145316, 1.182334, 1, 1, 1, 1, 1,
0.2769533, -2.285404, 2.41575, 1, 1, 1, 1, 1,
0.2788804, 0.7172654, -1.005426, 1, 1, 1, 1, 1,
0.281419, 0.6296928, -0.3954647, 1, 1, 1, 1, 1,
0.2831787, -0.3567267, 3.818731, 1, 1, 1, 1, 1,
0.2903399, 0.2808279, 0.1735448, 1, 1, 1, 1, 1,
0.2905172, -0.04065565, 2.764918, 1, 1, 1, 1, 1,
0.2932114, -1.266813, 2.592898, 1, 1, 1, 1, 1,
0.295093, -0.5864795, 1.979847, 1, 1, 1, 1, 1,
0.2965523, -0.04680113, 1.065169, 1, 1, 1, 1, 1,
0.2998738, -0.5805279, 2.354351, 1, 1, 1, 1, 1,
0.3011984, 0.504679, -1.298211, 0, 0, 1, 1, 1,
0.3013455, -1.000264, 4.031867, 1, 0, 0, 1, 1,
0.3023928, 1.077623, 0.1164311, 1, 0, 0, 1, 1,
0.3024095, 0.277074, 0.9021575, 1, 0, 0, 1, 1,
0.3028742, -1.147765, 3.875143, 1, 0, 0, 1, 1,
0.3044404, 1.795735, 0.9821534, 1, 0, 0, 1, 1,
0.3050381, 0.5554087, -2.101383, 0, 0, 0, 1, 1,
0.3070495, -0.8833993, 3.918336, 0, 0, 0, 1, 1,
0.3073564, 2.377064, -1.855708, 0, 0, 0, 1, 1,
0.3108003, -0.7187246, 1.760288, 0, 0, 0, 1, 1,
0.3119015, 0.5373743, -0.3739953, 0, 0, 0, 1, 1,
0.3141849, -1.370966, 2.615736, 0, 0, 0, 1, 1,
0.3168879, 0.7554097, -0.1188845, 0, 0, 0, 1, 1,
0.3176131, -1.38999, 3.196631, 1, 1, 1, 1, 1,
0.320071, 0.9080557, 0.7765247, 1, 1, 1, 1, 1,
0.3204101, -1.185557, 3.381429, 1, 1, 1, 1, 1,
0.3218117, 0.753723, 2.095492, 1, 1, 1, 1, 1,
0.3220432, -0.2532975, 2.910789, 1, 1, 1, 1, 1,
0.3223411, -1.45743, 1.953364, 1, 1, 1, 1, 1,
0.3237495, 1.087183, 1.378196, 1, 1, 1, 1, 1,
0.3243708, 0.5568631, -0.5570879, 1, 1, 1, 1, 1,
0.3258569, 0.03074357, 1.280543, 1, 1, 1, 1, 1,
0.3284149, 1.3675, 0.338824, 1, 1, 1, 1, 1,
0.3338439, -1.504718, 1.998958, 1, 1, 1, 1, 1,
0.3350117, 0.3860399, 1.03877, 1, 1, 1, 1, 1,
0.3373342, -0.3728997, 3.725571, 1, 1, 1, 1, 1,
0.3388016, 1.738117, 1.171009, 1, 1, 1, 1, 1,
0.3426225, 1.808943, 1.922149, 1, 1, 1, 1, 1,
0.3431888, 1.079792, -0.2943062, 0, 0, 1, 1, 1,
0.3440035, -0.4970706, 2.990737, 1, 0, 0, 1, 1,
0.3449706, 1.17011, 0.1177029, 1, 0, 0, 1, 1,
0.3486226, 1.42085, 0.2958017, 1, 0, 0, 1, 1,
0.3505179, 0.5761372, -1.104923, 1, 0, 0, 1, 1,
0.352623, 0.4195706, -1.742257, 1, 0, 0, 1, 1,
0.3526568, 1.143503, -0.2715947, 0, 0, 0, 1, 1,
0.3537605, 0.5117451, -0.3302729, 0, 0, 0, 1, 1,
0.3571519, 1.364489, 0.4772482, 0, 0, 0, 1, 1,
0.357261, -0.8895025, 1.843454, 0, 0, 0, 1, 1,
0.3616896, -0.2342888, 2.387712, 0, 0, 0, 1, 1,
0.3632702, -1.454941, 2.759997, 0, 0, 0, 1, 1,
0.3644952, -0.7156438, 2.866342, 0, 0, 0, 1, 1,
0.3645687, 1.342993, -0.6368404, 1, 1, 1, 1, 1,
0.368044, -2.957019, 3.823944, 1, 1, 1, 1, 1,
0.3681543, -0.1502079, 2.119478, 1, 1, 1, 1, 1,
0.3692726, -1.070858, 1.654689, 1, 1, 1, 1, 1,
0.3759139, -0.34635, 1.385011, 1, 1, 1, 1, 1,
0.3762805, 0.2590465, 2.058851, 1, 1, 1, 1, 1,
0.37727, 0.7962166, 1.767677, 1, 1, 1, 1, 1,
0.383389, -1.004578, 1.209383, 1, 1, 1, 1, 1,
0.3862379, -1.142309, 2.258662, 1, 1, 1, 1, 1,
0.3867137, -0.5985761, 0.6014873, 1, 1, 1, 1, 1,
0.3878561, 1.332404, 0.4053396, 1, 1, 1, 1, 1,
0.3878684, -0.2090478, 2.600703, 1, 1, 1, 1, 1,
0.393584, -0.2154463, 1.32872, 1, 1, 1, 1, 1,
0.3954792, 1.332905, -0.1063838, 1, 1, 1, 1, 1,
0.3977204, 0.5982301, 1.628909, 1, 1, 1, 1, 1,
0.3979249, 1.425529, -0.5679608, 0, 0, 1, 1, 1,
0.4001424, -0.3624263, 2.065169, 1, 0, 0, 1, 1,
0.4011723, -1.812064, 2.381545, 1, 0, 0, 1, 1,
0.4078125, -0.5960782, 1.689465, 1, 0, 0, 1, 1,
0.4088179, 1.016839, 0.02267989, 1, 0, 0, 1, 1,
0.4119073, 1.744437, -0.6578311, 1, 0, 0, 1, 1,
0.4141036, -1.070744, 2.761282, 0, 0, 0, 1, 1,
0.4167529, 0.7042229, 1.690235, 0, 0, 0, 1, 1,
0.4218577, 0.9529848, -1.45648, 0, 0, 0, 1, 1,
0.430429, -0.2023939, 3.180658, 0, 0, 0, 1, 1,
0.4384308, -0.4663162, 2.376066, 0, 0, 0, 1, 1,
0.4386229, -1.269205, 3.716243, 0, 0, 0, 1, 1,
0.4403834, -0.7658182, 2.979658, 0, 0, 0, 1, 1,
0.4417149, 0.3267598, 0.6819758, 1, 1, 1, 1, 1,
0.445644, 1.336969, 1.319132, 1, 1, 1, 1, 1,
0.4511039, 0.2207865, 0.5501871, 1, 1, 1, 1, 1,
0.4511852, -2.054366, 1.337191, 1, 1, 1, 1, 1,
0.4549939, 0.7712311, -1.173825, 1, 1, 1, 1, 1,
0.4590549, 0.4685831, 1.178508, 1, 1, 1, 1, 1,
0.4624742, -0.4725834, 1.818667, 1, 1, 1, 1, 1,
0.4696534, -0.9337215, 3.605854, 1, 1, 1, 1, 1,
0.4711408, 0.4566348, 1.21995, 1, 1, 1, 1, 1,
0.4748944, 1.365855, -0.4853308, 1, 1, 1, 1, 1,
0.4753184, 0.3996838, 0.3909196, 1, 1, 1, 1, 1,
0.4776238, -0.1773689, 2.847691, 1, 1, 1, 1, 1,
0.4783759, -1.67975, 2.441466, 1, 1, 1, 1, 1,
0.4806822, -1.140322, 2.724955, 1, 1, 1, 1, 1,
0.4836523, -0.5468168, 2.695163, 1, 1, 1, 1, 1,
0.4882005, -0.5269042, 1.480987, 0, 0, 1, 1, 1,
0.4884228, 0.663818, -0.610639, 1, 0, 0, 1, 1,
0.4908493, 0.1087967, 1.38841, 1, 0, 0, 1, 1,
0.4930683, -0.5704213, 2.63214, 1, 0, 0, 1, 1,
0.493199, 0.8232769, 1.12282, 1, 0, 0, 1, 1,
0.498116, 0.3402267, 1.560878, 1, 0, 0, 1, 1,
0.501479, -0.1503253, 0.9496005, 0, 0, 0, 1, 1,
0.5071799, -0.2990919, 2.942792, 0, 0, 0, 1, 1,
0.5099928, 0.5087919, 1.444026, 0, 0, 0, 1, 1,
0.5123954, 1.748844, 0.8208305, 0, 0, 0, 1, 1,
0.5124398, 0.0006626207, 0.7673218, 0, 0, 0, 1, 1,
0.5127271, -0.100112, 1.772593, 0, 0, 0, 1, 1,
0.514882, 1.20356, -1.060694, 0, 0, 0, 1, 1,
0.515308, -1.993909, 2.060266, 1, 1, 1, 1, 1,
0.5168688, 2.451173, 1.226024, 1, 1, 1, 1, 1,
0.5180956, -0.3369891, 0.07961242, 1, 1, 1, 1, 1,
0.51958, -0.2239675, 1.73494, 1, 1, 1, 1, 1,
0.5232891, -0.4427296, 1.340974, 1, 1, 1, 1, 1,
0.5234689, 0.0183652, 2.156824, 1, 1, 1, 1, 1,
0.5340109, -1.306853, 1.943186, 1, 1, 1, 1, 1,
0.5386836, 0.5911654, 0.07222848, 1, 1, 1, 1, 1,
0.538699, 0.2992066, 1.043549, 1, 1, 1, 1, 1,
0.5411168, 0.9712675, 1.343447, 1, 1, 1, 1, 1,
0.5420954, -0.729356, 1.928954, 1, 1, 1, 1, 1,
0.5441502, 0.03885632, 2.255692, 1, 1, 1, 1, 1,
0.5442698, 0.8774613, -0.7648038, 1, 1, 1, 1, 1,
0.5443855, -1.196527, 2.515299, 1, 1, 1, 1, 1,
0.5455231, -0.009971682, 2.531242, 1, 1, 1, 1, 1,
0.5466797, -1.120663, 0.5502567, 0, 0, 1, 1, 1,
0.5512197, -0.2983273, 1.185943, 1, 0, 0, 1, 1,
0.5571619, 0.0760539, 2.287976, 1, 0, 0, 1, 1,
0.5610089, 0.1183617, 3.627807, 1, 0, 0, 1, 1,
0.5666583, -0.4932957, 2.790776, 1, 0, 0, 1, 1,
0.5680469, -1.50957, 2.496053, 1, 0, 0, 1, 1,
0.5688447, 0.7267233, 0.8715476, 0, 0, 0, 1, 1,
0.5702022, -0.1739893, 0.7286317, 0, 0, 0, 1, 1,
0.5742888, 0.9726488, 0.9946358, 0, 0, 0, 1, 1,
0.5747675, -0.1170548, 0.536576, 0, 0, 0, 1, 1,
0.5752355, -0.2005555, -0.9712405, 0, 0, 0, 1, 1,
0.5796089, 1.565531, -0.6772903, 0, 0, 0, 1, 1,
0.5854335, 0.2572947, 2.070604, 0, 0, 0, 1, 1,
0.5857497, -0.4743652, 0.8848395, 1, 1, 1, 1, 1,
0.6006313, 1.629102, 0.6845713, 1, 1, 1, 1, 1,
0.6046056, 0.675764, 0.5459661, 1, 1, 1, 1, 1,
0.6071776, 0.05921322, 2.342606, 1, 1, 1, 1, 1,
0.6095448, 0.4867657, 0.543206, 1, 1, 1, 1, 1,
0.6103558, -1.378792, 2.592873, 1, 1, 1, 1, 1,
0.6127294, 0.1688701, 2.140679, 1, 1, 1, 1, 1,
0.617901, 0.6134061, 0.1165348, 1, 1, 1, 1, 1,
0.6191803, 2.595815, 0.4836669, 1, 1, 1, 1, 1,
0.6238793, -0.831776, 3.177729, 1, 1, 1, 1, 1,
0.6267707, -0.1145994, -0.02255141, 1, 1, 1, 1, 1,
0.6330352, 1.016163, 0.9445631, 1, 1, 1, 1, 1,
0.6360697, -0.4914654, 0.9843659, 1, 1, 1, 1, 1,
0.6369289, -1.54617, 4.348605, 1, 1, 1, 1, 1,
0.6419383, 0.03689057, 0.8120725, 1, 1, 1, 1, 1,
0.6424197, 0.1664107, 0.597069, 0, 0, 1, 1, 1,
0.6438069, -1.252095, 1.264031, 1, 0, 0, 1, 1,
0.6445558, 1.195064, -0.4047509, 1, 0, 0, 1, 1,
0.6504155, -0.6041179, 1.317633, 1, 0, 0, 1, 1,
0.6569433, -1.438972, 1.50327, 1, 0, 0, 1, 1,
0.6583939, 0.001109751, 3.176833, 1, 0, 0, 1, 1,
0.6625162, -1.322934, 2.095479, 0, 0, 0, 1, 1,
0.6670619, -0.4105677, 3.364928, 0, 0, 0, 1, 1,
0.6690423, -0.3645771, 1.783806, 0, 0, 0, 1, 1,
0.6722089, 0.2257494, 1.360012, 0, 0, 0, 1, 1,
0.6773724, -0.1365876, 0.4338565, 0, 0, 0, 1, 1,
0.6831178, -1.362098, 2.711817, 0, 0, 0, 1, 1,
0.6831846, 0.4985034, -0.4786146, 0, 0, 0, 1, 1,
0.6835939, 0.1523824, 2.228557, 1, 1, 1, 1, 1,
0.6839737, -0.798503, 3.117946, 1, 1, 1, 1, 1,
0.6875855, 0.2906574, 1.621888, 1, 1, 1, 1, 1,
0.6890647, -0.3744503, 3.975585, 1, 1, 1, 1, 1,
0.6900864, -0.3606214, 2.099283, 1, 1, 1, 1, 1,
0.6901767, -0.7743002, 2.244473, 1, 1, 1, 1, 1,
0.6926877, -0.5762858, 3.644006, 1, 1, 1, 1, 1,
0.6927283, -0.1117106, 1.618386, 1, 1, 1, 1, 1,
0.6933993, 2.533486, -0.9205992, 1, 1, 1, 1, 1,
0.695859, -0.9653029, 2.71992, 1, 1, 1, 1, 1,
0.6990228, -0.3262115, 4.35411, 1, 1, 1, 1, 1,
0.6996016, 1.474392, -0.3874219, 1, 1, 1, 1, 1,
0.7005349, 0.1005415, 0.5143964, 1, 1, 1, 1, 1,
0.7010048, -1.764221, 3.192305, 1, 1, 1, 1, 1,
0.7010372, -0.557043, 2.831539, 1, 1, 1, 1, 1,
0.702134, -0.5839984, 2.999231, 0, 0, 1, 1, 1,
0.70565, -1.814915, 2.564078, 1, 0, 0, 1, 1,
0.7140325, -0.01022692, 2.422396, 1, 0, 0, 1, 1,
0.715345, 0.7413837, 0.3914714, 1, 0, 0, 1, 1,
0.7190545, 0.01214212, 2.982212, 1, 0, 0, 1, 1,
0.7243186, -1.060194, 3.257021, 1, 0, 0, 1, 1,
0.7303225, -1.029332, 1.131816, 0, 0, 0, 1, 1,
0.7316736, -0.1173054, 3.424916, 0, 0, 0, 1, 1,
0.7390447, 1.594048, 0.1648463, 0, 0, 0, 1, 1,
0.7395142, -0.1545658, 3.345096, 0, 0, 0, 1, 1,
0.7410269, -2.03927, 4.351028, 0, 0, 0, 1, 1,
0.7452875, 1.248418, 1.607934, 0, 0, 0, 1, 1,
0.7562154, 1.616545, -0.001168494, 0, 0, 0, 1, 1,
0.7697599, -1.421691, 3.005182, 1, 1, 1, 1, 1,
0.7703595, 0.8392479, 1.72799, 1, 1, 1, 1, 1,
0.7746229, -0.2281588, 1.246983, 1, 1, 1, 1, 1,
0.7748945, 0.20593, 2.444829, 1, 1, 1, 1, 1,
0.7765076, 1.204008, 1.294167, 1, 1, 1, 1, 1,
0.7776171, 1.345173, 0.9684179, 1, 1, 1, 1, 1,
0.7790355, 1.742107, -0.6160676, 1, 1, 1, 1, 1,
0.7852728, 0.6956714, 1.0368, 1, 1, 1, 1, 1,
0.7877535, -0.6757058, 3.06993, 1, 1, 1, 1, 1,
0.7901824, -1.38476, 2.544585, 1, 1, 1, 1, 1,
0.7923471, 0.8405388, 1.382449, 1, 1, 1, 1, 1,
0.7971035, -0.07723077, 1.346546, 1, 1, 1, 1, 1,
0.799999, 1.459643, 0.4603578, 1, 1, 1, 1, 1,
0.80358, 0.2934891, 0.6536167, 1, 1, 1, 1, 1,
0.8046554, 2.836613, 1.021135, 1, 1, 1, 1, 1,
0.8132598, -0.7562827, 3.971159, 0, 0, 1, 1, 1,
0.8136755, 1.630805, -0.3456506, 1, 0, 0, 1, 1,
0.8193407, -0.7796323, 1.372016, 1, 0, 0, 1, 1,
0.8203894, -0.2544517, 2.362763, 1, 0, 0, 1, 1,
0.8215695, 1.609432, 2.024038, 1, 0, 0, 1, 1,
0.8220147, -0.8210159, 1.147298, 1, 0, 0, 1, 1,
0.8246884, 1.630704, 1.35601, 0, 0, 0, 1, 1,
0.8258498, 0.3846473, 2.228188, 0, 0, 0, 1, 1,
0.8281689, 0.7909871, -1.455226, 0, 0, 0, 1, 1,
0.8286019, 0.2980442, 0.2484413, 0, 0, 0, 1, 1,
0.8303217, 1.374138, -0.458821, 0, 0, 0, 1, 1,
0.8432104, 0.6806708, 0.9789423, 0, 0, 0, 1, 1,
0.8436135, 0.8146806, -1.196333, 0, 0, 0, 1, 1,
0.8441856, 1.221702, 0.6818526, 1, 1, 1, 1, 1,
0.8487398, 0.2699946, 2.892142, 1, 1, 1, 1, 1,
0.8491123, -0.4362401, 0.2881468, 1, 1, 1, 1, 1,
0.8516546, -0.2531886, 1.329219, 1, 1, 1, 1, 1,
0.852012, -0.2073459, 2.031914, 1, 1, 1, 1, 1,
0.8593754, 0.479665, 0.7570254, 1, 1, 1, 1, 1,
0.8595064, 1.071155, 0.02387064, 1, 1, 1, 1, 1,
0.8665358, 1.159009, -0.2205568, 1, 1, 1, 1, 1,
0.8688911, 0.5336363, -1.030245, 1, 1, 1, 1, 1,
0.8702591, -0.9701961, 3.216655, 1, 1, 1, 1, 1,
0.8728691, 0.687484, 3.741786, 1, 1, 1, 1, 1,
0.8795048, -1.609736, 1.996082, 1, 1, 1, 1, 1,
0.8802714, -0.3019332, 1.804611, 1, 1, 1, 1, 1,
0.8817494, -0.9479035, 3.102939, 1, 1, 1, 1, 1,
0.8827375, -0.9865478, 0.50514, 1, 1, 1, 1, 1,
0.8838502, 0.9603438, 0.6391034, 0, 0, 1, 1, 1,
0.888635, -0.4294399, 1.453521, 1, 0, 0, 1, 1,
0.893173, -0.4589946, 1.316185, 1, 0, 0, 1, 1,
0.8957485, -0.3608051, 3.358884, 1, 0, 0, 1, 1,
0.8976444, -0.7279969, 2.742739, 1, 0, 0, 1, 1,
0.9032688, 0.1134622, -0.255238, 1, 0, 0, 1, 1,
0.9077915, 0.5937922, 1.734375, 0, 0, 0, 1, 1,
0.9106662, -0.6733665, 2.512049, 0, 0, 0, 1, 1,
0.9135126, -0.1511476, 1.867853, 0, 0, 0, 1, 1,
0.9139605, 0.7967752, -0.06936543, 0, 0, 0, 1, 1,
0.9173737, -0.7702751, 3.235499, 0, 0, 0, 1, 1,
0.920384, -0.1736776, 2.662949, 0, 0, 0, 1, 1,
0.9226072, -0.7079085, 2.62569, 0, 0, 0, 1, 1,
0.9228388, 0.3377763, 0.7602822, 1, 1, 1, 1, 1,
0.9244431, 0.4307369, 1.992573, 1, 1, 1, 1, 1,
0.9254916, 0.526181, -0.6218597, 1, 1, 1, 1, 1,
0.9267948, -0.1155182, 1.861682, 1, 1, 1, 1, 1,
0.9269564, 0.002789441, 1.313066, 1, 1, 1, 1, 1,
0.9272231, 1.086885, 0.6499265, 1, 1, 1, 1, 1,
0.9308475, -1.534356, 2.335867, 1, 1, 1, 1, 1,
0.9311505, -1.670903, 3.108771, 1, 1, 1, 1, 1,
0.9401551, 0.02471159, 1.069654, 1, 1, 1, 1, 1,
0.9429822, -0.6131158, 0.8294342, 1, 1, 1, 1, 1,
0.9519414, 1.467757, 0.3613027, 1, 1, 1, 1, 1,
0.959408, 0.3084291, 0.04178081, 1, 1, 1, 1, 1,
0.9634611, -2.149907, 3.636514, 1, 1, 1, 1, 1,
0.9691739, 0.5376995, 1.739614, 1, 1, 1, 1, 1,
0.9760033, -0.3770621, 0.4281135, 1, 1, 1, 1, 1,
0.9765953, 0.5062056, 3.811502, 0, 0, 1, 1, 1,
0.9792785, 0.0001064639, 2.175225, 1, 0, 0, 1, 1,
0.9798896, -0.5362634, 1.708624, 1, 0, 0, 1, 1,
0.9814138, 0.5452727, 2.071688, 1, 0, 0, 1, 1,
0.9855864, -0.3321071, 2.199289, 1, 0, 0, 1, 1,
0.9875584, 0.4782398, 0.2648354, 1, 0, 0, 1, 1,
0.9892536, 1.45115, 2.594325, 0, 0, 0, 1, 1,
0.9920964, -0.6136814, 1.276857, 0, 0, 0, 1, 1,
0.9969214, 0.4380925, 0.9039782, 0, 0, 0, 1, 1,
1.010551, -0.1980731, 0.5305159, 0, 0, 0, 1, 1,
1.015759, 1.526719, -0.3165126, 0, 0, 0, 1, 1,
1.017197, -1.446636, 1.566506, 0, 0, 0, 1, 1,
1.017386, 0.09713577, 2.613467, 0, 0, 0, 1, 1,
1.020985, -0.5703614, 2.300326, 1, 1, 1, 1, 1,
1.035566, -1.050968, 2.913708, 1, 1, 1, 1, 1,
1.037266, 0.03971823, 1.25824, 1, 1, 1, 1, 1,
1.038127, -0.3370976, 1.714364, 1, 1, 1, 1, 1,
1.04052, -0.7774538, 1.24386, 1, 1, 1, 1, 1,
1.044731, -0.1145317, 1.980776, 1, 1, 1, 1, 1,
1.050056, -0.7876408, 3.646662, 1, 1, 1, 1, 1,
1.059159, 0.4905625, 1.568074, 1, 1, 1, 1, 1,
1.060953, -1.396306, 3.03649, 1, 1, 1, 1, 1,
1.06296, 0.3711894, 0.8020949, 1, 1, 1, 1, 1,
1.068066, -0.8522382, 2.606429, 1, 1, 1, 1, 1,
1.069897, 1.488385, 1.341687, 1, 1, 1, 1, 1,
1.073076, 0.9012103, 1.815798, 1, 1, 1, 1, 1,
1.075604, 1.505032, 0.6096826, 1, 1, 1, 1, 1,
1.077364, -0.4874544, 1.179799, 1, 1, 1, 1, 1,
1.085614, -0.3276632, 2.630543, 0, 0, 1, 1, 1,
1.104028, -0.6563065, 0.6130779, 1, 0, 0, 1, 1,
1.108837, 0.2848331, 1.449556, 1, 0, 0, 1, 1,
1.113824, -1.207071, 3.970189, 1, 0, 0, 1, 1,
1.114931, -0.9470103, 2.434558, 1, 0, 0, 1, 1,
1.138186, -0.6361948, 3.878155, 1, 0, 0, 1, 1,
1.138533, 1.044641, 1.291378, 0, 0, 0, 1, 1,
1.138797, 0.2392185, 2.488991, 0, 0, 0, 1, 1,
1.160068, 0.6322451, 2.008668, 0, 0, 0, 1, 1,
1.164374, -1.143125, 2.317143, 0, 0, 0, 1, 1,
1.169893, -1.007956, 4.55197, 0, 0, 0, 1, 1,
1.177613, -0.08315386, 1.079012, 0, 0, 0, 1, 1,
1.192601, 0.7563357, -0.6301226, 0, 0, 0, 1, 1,
1.197277, 0.5397535, -0.893626, 1, 1, 1, 1, 1,
1.203268, -1.031795, 3.109353, 1, 1, 1, 1, 1,
1.205873, -0.6569954, 2.18065, 1, 1, 1, 1, 1,
1.20665, -0.5256677, 1.71024, 1, 1, 1, 1, 1,
1.237383, -0.8366098, 3.571805, 1, 1, 1, 1, 1,
1.238791, 1.881636, 1.732854, 1, 1, 1, 1, 1,
1.249943, -0.4962254, 0.1830909, 1, 1, 1, 1, 1,
1.251225, 0.771184, 1.571297, 1, 1, 1, 1, 1,
1.251346, -1.037339, 1.724126, 1, 1, 1, 1, 1,
1.255412, -1.296861, 1.810317, 1, 1, 1, 1, 1,
1.26434, 1.106283, -0.64627, 1, 1, 1, 1, 1,
1.267937, -0.1731778, 2.059758, 1, 1, 1, 1, 1,
1.270354, -1.584111, 1.356572, 1, 1, 1, 1, 1,
1.27172, -1.749136, 0.7660159, 1, 1, 1, 1, 1,
1.273071, -0.7890155, 1.789265, 1, 1, 1, 1, 1,
1.277591, -0.7853304, 1.283248, 0, 0, 1, 1, 1,
1.280779, 1.404183, 1.032706, 1, 0, 0, 1, 1,
1.287722, -0.8060899, 2.833413, 1, 0, 0, 1, 1,
1.290552, 1.224302, 0.7947336, 1, 0, 0, 1, 1,
1.293434, 1.34512, -0.4932219, 1, 0, 0, 1, 1,
1.295803, -0.1542156, 0.4080953, 1, 0, 0, 1, 1,
1.298105, 0.7941554, 1.798833, 0, 0, 0, 1, 1,
1.301258, 0.3715462, 1.27879, 0, 0, 0, 1, 1,
1.303094, 0.8450297, -0.2578883, 0, 0, 0, 1, 1,
1.312008, 1.733842, 1.503961, 0, 0, 0, 1, 1,
1.312853, 1.160225, 0.8307111, 0, 0, 0, 1, 1,
1.319821, -0.2285563, 4.396202, 0, 0, 0, 1, 1,
1.335172, -1.197159, 2.548398, 0, 0, 0, 1, 1,
1.336901, -0.864913, 2.213995, 1, 1, 1, 1, 1,
1.342957, -0.5490743, 2.477555, 1, 1, 1, 1, 1,
1.362999, 2.013222, 0.2866796, 1, 1, 1, 1, 1,
1.366887, -0.363793, 2.78793, 1, 1, 1, 1, 1,
1.371904, -1.114068, 2.800539, 1, 1, 1, 1, 1,
1.37468, -2.138138, 2.07743, 1, 1, 1, 1, 1,
1.378291, 0.3129205, 0.925375, 1, 1, 1, 1, 1,
1.381731, -1.118506, 1.96941, 1, 1, 1, 1, 1,
1.403728, -1.358372, 2.405293, 1, 1, 1, 1, 1,
1.411347, -0.8011765, 4.119002, 1, 1, 1, 1, 1,
1.414074, -0.281736, 0.5462403, 1, 1, 1, 1, 1,
1.414337, 0.2642688, 0.8059325, 1, 1, 1, 1, 1,
1.421725, 0.6391608, 0.9683817, 1, 1, 1, 1, 1,
1.428234, 1.062279, 1.909184, 1, 1, 1, 1, 1,
1.448578, 0.5624052, 0.02864609, 1, 1, 1, 1, 1,
1.452998, -1.190084, 2.324382, 0, 0, 1, 1, 1,
1.452999, -1.550871, 3.226691, 1, 0, 0, 1, 1,
1.454939, -0.6688414, 3.014487, 1, 0, 0, 1, 1,
1.455857, -0.4157972, 2.816466, 1, 0, 0, 1, 1,
1.465587, 1.961128, -0.4809207, 1, 0, 0, 1, 1,
1.472787, -1.782685, 2.765239, 1, 0, 0, 1, 1,
1.47414, 0.7728747, 2.160224, 0, 0, 0, 1, 1,
1.480607, -1.727155, 0.9278338, 0, 0, 0, 1, 1,
1.485374, -0.2109244, 2.010461, 0, 0, 0, 1, 1,
1.486143, -1.303347, 3.094064, 0, 0, 0, 1, 1,
1.493351, 1.616891, 2.558746, 0, 0, 0, 1, 1,
1.493847, 0.6577328, 2.616139, 0, 0, 0, 1, 1,
1.495858, -0.7505084, 3.108456, 0, 0, 0, 1, 1,
1.501338, 0.7102569, 0.117768, 1, 1, 1, 1, 1,
1.537152, -0.5571151, 1.163645, 1, 1, 1, 1, 1,
1.547722, -0.09706247, 1.667373, 1, 1, 1, 1, 1,
1.550469, 0.6821656, 0.6450756, 1, 1, 1, 1, 1,
1.553643, -0.5024394, 1.753656, 1, 1, 1, 1, 1,
1.565327, 0.8073994, -0.5975599, 1, 1, 1, 1, 1,
1.570587, 1.306575, -0.05643876, 1, 1, 1, 1, 1,
1.585361, -2.137562, 3.350198, 1, 1, 1, 1, 1,
1.593198, 0.7915092, 2.398882, 1, 1, 1, 1, 1,
1.595265, -1.665993, 1.076585, 1, 1, 1, 1, 1,
1.609861, -0.07062054, 1.252362, 1, 1, 1, 1, 1,
1.619137, 0.1016033, -0.007593777, 1, 1, 1, 1, 1,
1.636276, 0.5573509, 2.547796, 1, 1, 1, 1, 1,
1.638292, -0.6613817, 2.294312, 1, 1, 1, 1, 1,
1.641022, -0.0608886, 1.055026, 1, 1, 1, 1, 1,
1.648414, -0.07174807, 1.775876, 0, 0, 1, 1, 1,
1.654908, -0.9493768, 2.952414, 1, 0, 0, 1, 1,
1.670442, -0.3534129, -0.04155558, 1, 0, 0, 1, 1,
1.760077, 0.3325222, 0.6144803, 1, 0, 0, 1, 1,
1.768919, 0.8427992, 0.1292513, 1, 0, 0, 1, 1,
1.772975, -0.2585292, 0.242191, 1, 0, 0, 1, 1,
1.788525, 1.089926, 0.7554408, 0, 0, 0, 1, 1,
1.806972, -1.628953, 1.4427, 0, 0, 0, 1, 1,
1.822369, 1.794406, 0.4609173, 0, 0, 0, 1, 1,
1.839875, 0.06460147, 0.4331245, 0, 0, 0, 1, 1,
1.848307, 0.1536774, 1.660542, 0, 0, 0, 1, 1,
1.881424, 0.7492651, 2.186109, 0, 0, 0, 1, 1,
1.885956, -1.276695, 2.659099, 0, 0, 0, 1, 1,
1.887025, 0.08777761, 0.9916056, 1, 1, 1, 1, 1,
1.899269, -1.450788, 3.313209, 1, 1, 1, 1, 1,
1.909058, -0.2701691, 3.171989, 1, 1, 1, 1, 1,
1.956007, 0.141124, 1.725271, 1, 1, 1, 1, 1,
1.96199, -1.442676, 2.16155, 1, 1, 1, 1, 1,
2.027216, -0.1955398, 1.70429, 1, 1, 1, 1, 1,
2.035666, -1.905937, 1.950925, 1, 1, 1, 1, 1,
2.045379, -0.7392629, 2.373475, 1, 1, 1, 1, 1,
2.045739, -1.276102, 3.366051, 1, 1, 1, 1, 1,
2.074509, 0.1149993, 2.459668, 1, 1, 1, 1, 1,
2.077294, -0.3098202, -0.236586, 1, 1, 1, 1, 1,
2.092139, -0.2088694, 1.187404, 1, 1, 1, 1, 1,
2.098992, 0.8072206, 3.071381, 1, 1, 1, 1, 1,
2.12484, 0.7266353, 1.508238, 1, 1, 1, 1, 1,
2.133754, 0.8003888, 1.488594, 1, 1, 1, 1, 1,
2.141832, 1.914544, 0.885419, 0, 0, 1, 1, 1,
2.145846, -0.4378121, 1.623339, 1, 0, 0, 1, 1,
2.148371, 0.7155939, 3.102545, 1, 0, 0, 1, 1,
2.164822, 0.1788856, 1.768483, 1, 0, 0, 1, 1,
2.181634, -1.602024, 2.067044, 1, 0, 0, 1, 1,
2.183821, 1.660284, -0.8530719, 1, 0, 0, 1, 1,
2.19423, -0.5910844, 1.21007, 0, 0, 0, 1, 1,
2.203566, -0.5705826, 2.690521, 0, 0, 0, 1, 1,
2.262292, -0.2343484, 1.453134, 0, 0, 0, 1, 1,
2.274801, 0.7395635, 2.602542, 0, 0, 0, 1, 1,
2.299538, 0.209616, 1.961225, 0, 0, 0, 1, 1,
2.317632, 0.2460116, 1.4009, 0, 0, 0, 1, 1,
2.327739, 1.320479, 0.8348434, 0, 0, 0, 1, 1,
2.330929, -0.1424261, 1.612314, 1, 1, 1, 1, 1,
2.341079, -0.9047645, 4.033566, 1, 1, 1, 1, 1,
2.357874, -1.563522, 2.7395, 1, 1, 1, 1, 1,
2.442727, 0.1413539, 2.160167, 1, 1, 1, 1, 1,
2.505638, -0.2307048, 2.432063, 1, 1, 1, 1, 1,
2.669735, 0.1732018, 1.794185, 1, 1, 1, 1, 1,
3.145691, 0.4805658, 2.211993, 1, 1, 1, 1, 1
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
var radius = 9.232313;
var distance = 32.4281;
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
mvMatrix.translate( 0.1192584, 0.1540282, 0.4329414 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.4281);
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
