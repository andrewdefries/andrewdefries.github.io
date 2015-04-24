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
-3.024819, 0.6349937, 0.2904676, 1, 0, 0, 1,
-2.993756, 1.193506, -3.052853, 1, 0.007843138, 0, 1,
-2.954728, 0.5809317, -2.236984, 1, 0.01176471, 0, 1,
-2.742653, 0.2668788, -2.044137, 1, 0.01960784, 0, 1,
-2.49505, -0.07136257, -0.7187895, 1, 0.02352941, 0, 1,
-2.444149, -0.7556359, -3.643388, 1, 0.03137255, 0, 1,
-2.413584, 1.045637, -0.9516776, 1, 0.03529412, 0, 1,
-2.40127, -0.005123468, 0.2335736, 1, 0.04313726, 0, 1,
-2.368516, -0.331325, -0.9386635, 1, 0.04705882, 0, 1,
-2.363564, -1.001224, -3.761626, 1, 0.05490196, 0, 1,
-2.311876, 0.1217663, -1.201386, 1, 0.05882353, 0, 1,
-2.248644, 0.2449571, -1.542436, 1, 0.06666667, 0, 1,
-2.225995, 0.5176941, -0.3474738, 1, 0.07058824, 0, 1,
-2.225682, 0.08371052, -2.128553, 1, 0.07843138, 0, 1,
-2.218295, 1.444504, -1.408524, 1, 0.08235294, 0, 1,
-2.202659, 0.8205917, -0.6147531, 1, 0.09019608, 0, 1,
-2.189574, -0.5213464, -1.982588, 1, 0.09411765, 0, 1,
-2.188727, 1.005359, 0.385195, 1, 0.1019608, 0, 1,
-2.155111, -0.3148737, -1.905129, 1, 0.1098039, 0, 1,
-2.146052, -1.657684, -1.646947, 1, 0.1137255, 0, 1,
-2.121339, 0.6682215, -3.35779, 1, 0.1215686, 0, 1,
-2.117778, 0.6162211, -2.2978, 1, 0.1254902, 0, 1,
-2.102281, -0.6950597, -2.092156, 1, 0.1333333, 0, 1,
-2.086386, -0.2546479, -1.550668, 1, 0.1372549, 0, 1,
-2.050753, -2.225172, -1.339803, 1, 0.145098, 0, 1,
-2.02411, -0.05515596, -1.184524, 1, 0.1490196, 0, 1,
-2.011111, -0.3049374, -0.843035, 1, 0.1568628, 0, 1,
-1.987365, -0.3687296, -1.875215, 1, 0.1607843, 0, 1,
-1.987201, -0.4583883, -1.978483, 1, 0.1686275, 0, 1,
-1.951593, -0.9666921, -2.289957, 1, 0.172549, 0, 1,
-1.934512, 0.763407, -0.08798024, 1, 0.1803922, 0, 1,
-1.928697, -0.5264121, -2.002939, 1, 0.1843137, 0, 1,
-1.926225, -0.3560075, -2.118932, 1, 0.1921569, 0, 1,
-1.910986, 0.6035953, -1.716734, 1, 0.1960784, 0, 1,
-1.906511, -0.2551887, -1.522104, 1, 0.2039216, 0, 1,
-1.895533, 0.5016025, -1.550179, 1, 0.2117647, 0, 1,
-1.878707, -2.323946, -2.470244, 1, 0.2156863, 0, 1,
-1.86598, -0.1788552, -3.873308, 1, 0.2235294, 0, 1,
-1.847884, -0.07438377, -0.9061446, 1, 0.227451, 0, 1,
-1.816635, -0.05494933, -4.097019, 1, 0.2352941, 0, 1,
-1.81492, 1.549566, 0.8773729, 1, 0.2392157, 0, 1,
-1.814611, -0.5164986, -2.806728, 1, 0.2470588, 0, 1,
-1.809474, 0.9791692, -3.516331, 1, 0.2509804, 0, 1,
-1.799678, 0.0418459, -1.592821, 1, 0.2588235, 0, 1,
-1.785877, 0.7724143, -0.9963732, 1, 0.2627451, 0, 1,
-1.783904, -2.262271, -2.632983, 1, 0.2705882, 0, 1,
-1.779284, -1.513239, -0.6409327, 1, 0.2745098, 0, 1,
-1.738087, -0.04285395, -3.347935, 1, 0.282353, 0, 1,
-1.711175, -0.5245684, -3.205727, 1, 0.2862745, 0, 1,
-1.678152, -2.46088, -3.223473, 1, 0.2941177, 0, 1,
-1.6707, -0.03886532, -1.967049, 1, 0.3019608, 0, 1,
-1.668904, 0.4813914, -0.01096433, 1, 0.3058824, 0, 1,
-1.668858, -2.418081, -2.717702, 1, 0.3137255, 0, 1,
-1.663177, -0.8205065, -1.838352, 1, 0.3176471, 0, 1,
-1.645256, -0.3529451, -2.604704, 1, 0.3254902, 0, 1,
-1.627713, 0.24549, -1.566798, 1, 0.3294118, 0, 1,
-1.625148, 0.02167429, -0.2219585, 1, 0.3372549, 0, 1,
-1.605836, 1.12198, -1.032444, 1, 0.3411765, 0, 1,
-1.596214, -0.5590746, -2.377913, 1, 0.3490196, 0, 1,
-1.587789, -1.722408, -1.555318, 1, 0.3529412, 0, 1,
-1.580248, -0.1609577, -0.6779137, 1, 0.3607843, 0, 1,
-1.579947, 1.49346, -1.430835, 1, 0.3647059, 0, 1,
-1.575552, 0.2449864, -1.301008, 1, 0.372549, 0, 1,
-1.568435, -1.285926, -2.666257, 1, 0.3764706, 0, 1,
-1.55027, -0.6241369, -2.048749, 1, 0.3843137, 0, 1,
-1.544974, 0.5179647, -2.890234, 1, 0.3882353, 0, 1,
-1.54217, 0.6142078, 0.417996, 1, 0.3960784, 0, 1,
-1.532813, -0.6657565, -1.470073, 1, 0.4039216, 0, 1,
-1.527837, 0.3309052, -1.294166, 1, 0.4078431, 0, 1,
-1.517995, -1.139632, -3.322871, 1, 0.4156863, 0, 1,
-1.491617, 0.1809879, -1.949256, 1, 0.4196078, 0, 1,
-1.488177, -0.980951, -1.33905, 1, 0.427451, 0, 1,
-1.483455, 0.1685847, -3.028886, 1, 0.4313726, 0, 1,
-1.475917, -1.365007, -1.022539, 1, 0.4392157, 0, 1,
-1.47353, 0.8670629, -1.537081, 1, 0.4431373, 0, 1,
-1.466293, -0.8673528, -2.028008, 1, 0.4509804, 0, 1,
-1.461943, -1.671582, -1.615646, 1, 0.454902, 0, 1,
-1.454663, 1.194951, -1.094929, 1, 0.4627451, 0, 1,
-1.452802, -0.4305511, -0.9849417, 1, 0.4666667, 0, 1,
-1.443019, 0.4671246, -1.051374, 1, 0.4745098, 0, 1,
-1.441794, 0.8989745, -2.041682, 1, 0.4784314, 0, 1,
-1.43721, -1.346566, -1.574981, 1, 0.4862745, 0, 1,
-1.436996, 0.6435597, -1.349861, 1, 0.4901961, 0, 1,
-1.424816, -1.411702, -2.598155, 1, 0.4980392, 0, 1,
-1.421999, -1.316516, -1.745654, 1, 0.5058824, 0, 1,
-1.417265, -1.439738, -3.036046, 1, 0.509804, 0, 1,
-1.413721, 0.8763412, -2.094122, 1, 0.5176471, 0, 1,
-1.409084, -0.4385953, -2.406315, 1, 0.5215687, 0, 1,
-1.400944, 0.4347032, -1.015623, 1, 0.5294118, 0, 1,
-1.39026, 0.5235726, -1.299128, 1, 0.5333334, 0, 1,
-1.38209, 1.026788, -1.916908, 1, 0.5411765, 0, 1,
-1.3567, 0.188026, -1.182382, 1, 0.5450981, 0, 1,
-1.347398, -0.0954361, -1.311095, 1, 0.5529412, 0, 1,
-1.341798, 2.119442, 1.071053, 1, 0.5568628, 0, 1,
-1.333476, -0.9739673, -1.094549, 1, 0.5647059, 0, 1,
-1.331148, -0.3607286, -0.7564278, 1, 0.5686275, 0, 1,
-1.317322, -0.3873171, -3.408355, 1, 0.5764706, 0, 1,
-1.294101, -1.130908, -3.088763, 1, 0.5803922, 0, 1,
-1.290671, 1.0928, 0.1911196, 1, 0.5882353, 0, 1,
-1.286982, 0.7125708, -0.8021312, 1, 0.5921569, 0, 1,
-1.285088, -1.666419, -4.340297, 1, 0.6, 0, 1,
-1.265793, 0.9476137, 0.7653127, 1, 0.6078432, 0, 1,
-1.263827, 1.080047, -1.869849, 1, 0.6117647, 0, 1,
-1.253893, 1.690336, -1.284737, 1, 0.6196079, 0, 1,
-1.247969, 0.09290886, -1.638764, 1, 0.6235294, 0, 1,
-1.247099, -0.1886266, -2.692877, 1, 0.6313726, 0, 1,
-1.242384, 1.984737, -2.841295, 1, 0.6352941, 0, 1,
-1.230775, -0.05914968, -0.7268423, 1, 0.6431373, 0, 1,
-1.222468, -0.8917486, -1.868405, 1, 0.6470588, 0, 1,
-1.211442, 0.9073063, -0.4922136, 1, 0.654902, 0, 1,
-1.208564, 0.6719506, -1.59394, 1, 0.6588235, 0, 1,
-1.207019, 0.3331198, -1.453149, 1, 0.6666667, 0, 1,
-1.20686, 0.4357893, -1.187375, 1, 0.6705883, 0, 1,
-1.204335, 0.113617, -0.0305794, 1, 0.6784314, 0, 1,
-1.187162, -0.04005564, -1.43004, 1, 0.682353, 0, 1,
-1.184305, -0.6639679, 0.548022, 1, 0.6901961, 0, 1,
-1.18249, 0.1365573, -1.277848, 1, 0.6941177, 0, 1,
-1.179637, -0.7849114, -1.317722, 1, 0.7019608, 0, 1,
-1.177868, 0.7853075, -1.118111, 1, 0.7098039, 0, 1,
-1.177388, 1.311609, 1.04506, 1, 0.7137255, 0, 1,
-1.177312, 1.734276, 0.554056, 1, 0.7215686, 0, 1,
-1.17512, 0.9337989, -0.07119394, 1, 0.7254902, 0, 1,
-1.174072, 0.07177789, -0.9133752, 1, 0.7333333, 0, 1,
-1.173972, 1.106672, 1.750003, 1, 0.7372549, 0, 1,
-1.170038, 1.860031, 0.5304657, 1, 0.7450981, 0, 1,
-1.163046, 0.3869686, -0.3092808, 1, 0.7490196, 0, 1,
-1.157495, 0.6902865, -1.140451, 1, 0.7568628, 0, 1,
-1.156405, -0.05505284, -1.483648, 1, 0.7607843, 0, 1,
-1.152462, -0.615007, -2.77471, 1, 0.7686275, 0, 1,
-1.151028, -0.4280524, -3.002293, 1, 0.772549, 0, 1,
-1.135911, 0.4915422, -1.657363, 1, 0.7803922, 0, 1,
-1.132274, -0.385618, -1.565149, 1, 0.7843137, 0, 1,
-1.127275, -0.6862537, -3.212024, 1, 0.7921569, 0, 1,
-1.119119, 0.5348408, -0.5077589, 1, 0.7960784, 0, 1,
-1.114388, 2.369624, -0.2643188, 1, 0.8039216, 0, 1,
-1.112735, 0.1357732, -0.9494113, 1, 0.8117647, 0, 1,
-1.11211, -0.5214466, -2.43362, 1, 0.8156863, 0, 1,
-1.11088, 1.24169, -0.883212, 1, 0.8235294, 0, 1,
-1.109867, -2.28353, -1.58124, 1, 0.827451, 0, 1,
-1.104595, 2.063956, -1.176819, 1, 0.8352941, 0, 1,
-1.10339, 0.7138284, -1.36007, 1, 0.8392157, 0, 1,
-1.098386, -0.1985802, -1.057044, 1, 0.8470588, 0, 1,
-1.084903, 1.714904, -0.3814686, 1, 0.8509804, 0, 1,
-1.082921, 0.7478412, 0.6204264, 1, 0.8588235, 0, 1,
-1.072593, 0.7495207, -0.2099517, 1, 0.8627451, 0, 1,
-1.070417, -0.2928584, -1.862627, 1, 0.8705882, 0, 1,
-1.066923, 0.8471229, 0.0698633, 1, 0.8745098, 0, 1,
-1.064961, 0.7885813, -0.8171001, 1, 0.8823529, 0, 1,
-1.056677, 0.1127705, -2.496706, 1, 0.8862745, 0, 1,
-1.042195, 1.482591, -1.026142, 1, 0.8941177, 0, 1,
-1.034385, -0.8044423, -3.189528, 1, 0.8980392, 0, 1,
-1.032815, -1.195788, -3.973273, 1, 0.9058824, 0, 1,
-1.030715, -1.184411, -1.846205, 1, 0.9137255, 0, 1,
-1.026487, 0.07082944, -1.577773, 1, 0.9176471, 0, 1,
-1.026079, -0.427598, -1.557894, 1, 0.9254902, 0, 1,
-1.025646, 0.7769139, 1.465017, 1, 0.9294118, 0, 1,
-1.019807, -1.901526, -3.597474, 1, 0.9372549, 0, 1,
-1.017547, 1.362417, -0.6373795, 1, 0.9411765, 0, 1,
-1.013343, 0.7028163, -0.6453722, 1, 0.9490196, 0, 1,
-1.01118, 0.7151956, -0.7223511, 1, 0.9529412, 0, 1,
-1.010437, 0.9150695, -0.9353647, 1, 0.9607843, 0, 1,
-1.009134, 0.1833443, -0.4917284, 1, 0.9647059, 0, 1,
-0.9996625, -0.2830431, -0.1944942, 1, 0.972549, 0, 1,
-0.9987007, -1.348313, -1.59785, 1, 0.9764706, 0, 1,
-0.9905654, 3.053047, -0.02655171, 1, 0.9843137, 0, 1,
-0.9905279, 0.8965642, 0.7539858, 1, 0.9882353, 0, 1,
-0.9883716, 0.09255749, -1.919954, 1, 0.9960784, 0, 1,
-0.9842566, 0.2858073, -1.660017, 0.9960784, 1, 0, 1,
-0.980094, 0.6308781, -0.6577414, 0.9921569, 1, 0, 1,
-0.9734571, 0.469675, -1.328349, 0.9843137, 1, 0, 1,
-0.9622989, -1.485756, -2.832977, 0.9803922, 1, 0, 1,
-0.961101, 0.2632941, -2.709898, 0.972549, 1, 0, 1,
-0.957484, 0.7102284, -1.288843, 0.9686275, 1, 0, 1,
-0.9561204, -0.8301587, 0.3340749, 0.9607843, 1, 0, 1,
-0.947947, -0.669677, -0.9878348, 0.9568627, 1, 0, 1,
-0.9442636, -1.86206, -2.906974, 0.9490196, 1, 0, 1,
-0.9365277, -0.2091331, -1.601619, 0.945098, 1, 0, 1,
-0.9317665, -1.355919, -1.560705, 0.9372549, 1, 0, 1,
-0.9307044, -0.6161145, -2.064344, 0.9333333, 1, 0, 1,
-0.9302504, -1.450057, -1.79374, 0.9254902, 1, 0, 1,
-0.9189891, -1.820397, -1.552987, 0.9215686, 1, 0, 1,
-0.9176543, 0.6210033, 0.2016328, 0.9137255, 1, 0, 1,
-0.9081515, 0.2091115, -2.20443, 0.9098039, 1, 0, 1,
-0.9079038, -0.6661251, -2.693478, 0.9019608, 1, 0, 1,
-0.9038899, 2.211047, 0.3346288, 0.8941177, 1, 0, 1,
-0.892892, 1.059233, -2.652086, 0.8901961, 1, 0, 1,
-0.8927566, 0.1597762, -0.5244967, 0.8823529, 1, 0, 1,
-0.8885513, 0.05330556, -0.5937798, 0.8784314, 1, 0, 1,
-0.8868837, 0.5465139, 0.6131278, 0.8705882, 1, 0, 1,
-0.8772929, 1.120698, -0.2516201, 0.8666667, 1, 0, 1,
-0.869867, -0.05303356, -2.820364, 0.8588235, 1, 0, 1,
-0.8671227, -0.7353138, -0.5690422, 0.854902, 1, 0, 1,
-0.8625724, -0.2498325, -3.017585, 0.8470588, 1, 0, 1,
-0.8533746, 0.5286394, -1.222437, 0.8431373, 1, 0, 1,
-0.8503206, 0.2316545, -0.3278306, 0.8352941, 1, 0, 1,
-0.8499674, -0.3821653, -0.5129836, 0.8313726, 1, 0, 1,
-0.8495449, -0.3772793, -0.2640135, 0.8235294, 1, 0, 1,
-0.8492753, 0.8805365, -1.303609, 0.8196079, 1, 0, 1,
-0.847711, 1.715462, -0.06825154, 0.8117647, 1, 0, 1,
-0.8467922, -1.658451, -2.550322, 0.8078431, 1, 0, 1,
-0.8443075, 0.2503805, -0.3872595, 0.8, 1, 0, 1,
-0.8420777, -0.1492193, -1.306155, 0.7921569, 1, 0, 1,
-0.8340966, -0.485888, -1.770139, 0.7882353, 1, 0, 1,
-0.8331082, -1.120338, -4.289777, 0.7803922, 1, 0, 1,
-0.8309642, -0.3917448, -4.376102, 0.7764706, 1, 0, 1,
-0.8308048, 1.166752, -1.268162, 0.7686275, 1, 0, 1,
-0.8283672, 0.181545, -1.052541, 0.7647059, 1, 0, 1,
-0.827047, -1.288681, -1.428453, 0.7568628, 1, 0, 1,
-0.81801, -1.009507, -2.647249, 0.7529412, 1, 0, 1,
-0.8147266, -0.2247952, 0.2513288, 0.7450981, 1, 0, 1,
-0.8094407, -0.4273449, -1.212127, 0.7411765, 1, 0, 1,
-0.8093374, 1.142663, -1.271581, 0.7333333, 1, 0, 1,
-0.807328, -0.06985036, -2.657351, 0.7294118, 1, 0, 1,
-0.7996356, 1.318763, -3.013258, 0.7215686, 1, 0, 1,
-0.7970462, 2.137367, -0.1779447, 0.7176471, 1, 0, 1,
-0.793729, -0.8129792, -1.010589, 0.7098039, 1, 0, 1,
-0.7876702, -1.490258, -2.552699, 0.7058824, 1, 0, 1,
-0.7841575, 0.5511003, 0.724978, 0.6980392, 1, 0, 1,
-0.7810984, 0.05241745, 1.860937, 0.6901961, 1, 0, 1,
-0.7758454, -1.460166, -3.733959, 0.6862745, 1, 0, 1,
-0.7720761, -0.2476679, -1.6589, 0.6784314, 1, 0, 1,
-0.7608413, 0.4923121, -1.370943, 0.6745098, 1, 0, 1,
-0.7586195, 1.557061, -0.4124277, 0.6666667, 1, 0, 1,
-0.7585526, 0.8318394, -2.036863, 0.6627451, 1, 0, 1,
-0.7547634, 0.9693077, -2.565798, 0.654902, 1, 0, 1,
-0.753041, -0.9983161, -1.168753, 0.6509804, 1, 0, 1,
-0.7501625, 1.986674, -0.9784014, 0.6431373, 1, 0, 1,
-0.7481117, -0.4124143, -2.315972, 0.6392157, 1, 0, 1,
-0.7469882, 0.5060293, 0.1961113, 0.6313726, 1, 0, 1,
-0.7461614, 0.03058369, -1.401221, 0.627451, 1, 0, 1,
-0.7422121, 0.3976919, -1.34347, 0.6196079, 1, 0, 1,
-0.7286766, -0.695049, -2.843904, 0.6156863, 1, 0, 1,
-0.7181536, 0.2663544, -1.241986, 0.6078432, 1, 0, 1,
-0.716803, 0.1478861, -1.722791, 0.6039216, 1, 0, 1,
-0.7154068, 1.276577, -0.1381699, 0.5960785, 1, 0, 1,
-0.7126101, -1.323791, -2.390985, 0.5882353, 1, 0, 1,
-0.709636, 0.4867209, -1.221319, 0.5843138, 1, 0, 1,
-0.7059408, -0.05049077, -3.227804, 0.5764706, 1, 0, 1,
-0.7040482, -0.8766029, -2.142822, 0.572549, 1, 0, 1,
-0.7002509, 2.123018, -0.5221879, 0.5647059, 1, 0, 1,
-0.6992429, -0.4652581, -1.851779, 0.5607843, 1, 0, 1,
-0.6987941, -1.131007, -2.672, 0.5529412, 1, 0, 1,
-0.6983002, 0.1143132, -0.5755385, 0.5490196, 1, 0, 1,
-0.6963154, 1.961225, 0.238048, 0.5411765, 1, 0, 1,
-0.6923793, -1.169574, -1.781666, 0.5372549, 1, 0, 1,
-0.690466, 1.346402, -1.678094, 0.5294118, 1, 0, 1,
-0.6901497, -0.2950144, -2.539272, 0.5254902, 1, 0, 1,
-0.6896158, -0.7572439, -1.991158, 0.5176471, 1, 0, 1,
-0.6888403, -1.214018, -2.667288, 0.5137255, 1, 0, 1,
-0.6809976, -0.7615813, -2.636962, 0.5058824, 1, 0, 1,
-0.6760354, -0.1323274, -2.901364, 0.5019608, 1, 0, 1,
-0.6740245, 0.4000502, -2.695737, 0.4941176, 1, 0, 1,
-0.6729816, -0.2748154, -2.126665, 0.4862745, 1, 0, 1,
-0.6712942, -0.6042518, -2.485136, 0.4823529, 1, 0, 1,
-0.6700375, 0.2671664, -1.521288, 0.4745098, 1, 0, 1,
-0.6690556, -0.2637531, -1.378768, 0.4705882, 1, 0, 1,
-0.6653146, 0.8304607, -0.8282658, 0.4627451, 1, 0, 1,
-0.6595673, -0.572257, -2.817884, 0.4588235, 1, 0, 1,
-0.6501781, 0.6044181, -0.7441424, 0.4509804, 1, 0, 1,
-0.6470137, 0.8428007, 0.2463706, 0.4470588, 1, 0, 1,
-0.6469636, -0.2380588, -1.223552, 0.4392157, 1, 0, 1,
-0.6462792, -1.511083, -0.9985758, 0.4352941, 1, 0, 1,
-0.6386684, -1.343744, -2.064343, 0.427451, 1, 0, 1,
-0.6371615, 1.042069, -1.141548, 0.4235294, 1, 0, 1,
-0.6371599, -0.5757388, -1.572786, 0.4156863, 1, 0, 1,
-0.6201139, -0.3848307, -3.117884, 0.4117647, 1, 0, 1,
-0.6184677, 0.1462982, -2.000111, 0.4039216, 1, 0, 1,
-0.6126723, 0.2620682, -1.687926, 0.3960784, 1, 0, 1,
-0.6043783, 0.00240685, -2.894315, 0.3921569, 1, 0, 1,
-0.598666, -1.333106, -2.74869, 0.3843137, 1, 0, 1,
-0.5940966, 1.225144, -0.8198557, 0.3803922, 1, 0, 1,
-0.5926132, -0.4314755, -1.85857, 0.372549, 1, 0, 1,
-0.5915748, 1.280441, 0.4919573, 0.3686275, 1, 0, 1,
-0.5782564, 0.2598885, -1.558272, 0.3607843, 1, 0, 1,
-0.5747334, 0.364286, 1.040848, 0.3568628, 1, 0, 1,
-0.5693147, -1.486281, -2.482228, 0.3490196, 1, 0, 1,
-0.562486, -0.8810536, -3.054901, 0.345098, 1, 0, 1,
-0.5606679, -0.1434809, -3.250738, 0.3372549, 1, 0, 1,
-0.5588048, -0.1123726, -2.314757, 0.3333333, 1, 0, 1,
-0.5574883, 0.07157951, -1.239336, 0.3254902, 1, 0, 1,
-0.5547929, 1.332507, -1.158429, 0.3215686, 1, 0, 1,
-0.5547076, -0.3669548, -1.298795, 0.3137255, 1, 0, 1,
-0.5531653, -1.92875, -3.9681, 0.3098039, 1, 0, 1,
-0.5527628, 1.35493, -1.366197, 0.3019608, 1, 0, 1,
-0.5484741, 1.611763, -1.553805, 0.2941177, 1, 0, 1,
-0.5478469, 0.9297736, 0.4473228, 0.2901961, 1, 0, 1,
-0.5406577, 1.207992, 0.6044769, 0.282353, 1, 0, 1,
-0.538853, -0.03176507, -1.851868, 0.2784314, 1, 0, 1,
-0.5383091, -0.2779357, -3.353485, 0.2705882, 1, 0, 1,
-0.5382725, 0.234439, -1.295146, 0.2666667, 1, 0, 1,
-0.5375899, -0.1662872, -0.5732689, 0.2588235, 1, 0, 1,
-0.5369372, 1.578165, -1.688961, 0.254902, 1, 0, 1,
-0.5358095, 0.3735299, -0.9419771, 0.2470588, 1, 0, 1,
-0.5314472, 0.2205385, -1.324104, 0.2431373, 1, 0, 1,
-0.5272195, -1.202774, -2.259459, 0.2352941, 1, 0, 1,
-0.5216339, 0.7903957, -1.609134, 0.2313726, 1, 0, 1,
-0.5194124, -0.6800764, -3.93875, 0.2235294, 1, 0, 1,
-0.5147468, 0.6555218, -0.268159, 0.2196078, 1, 0, 1,
-0.5104332, 0.09276977, -1.358765, 0.2117647, 1, 0, 1,
-0.5026586, -0.05818477, -2.784449, 0.2078431, 1, 0, 1,
-0.5007014, -1.281192, -3.804323, 0.2, 1, 0, 1,
-0.4949215, -1.759576, -1.935669, 0.1921569, 1, 0, 1,
-0.4934811, 0.3564105, -2.763242, 0.1882353, 1, 0, 1,
-0.4920968, 0.01237254, -2.276396, 0.1803922, 1, 0, 1,
-0.4914463, -1.264437, -1.41469, 0.1764706, 1, 0, 1,
-0.4908512, -1.010039, -1.072461, 0.1686275, 1, 0, 1,
-0.4905786, 0.7028902, 0.08982596, 0.1647059, 1, 0, 1,
-0.4893149, -0.2053084, -2.827099, 0.1568628, 1, 0, 1,
-0.4875317, 0.02487083, -0.04841884, 0.1529412, 1, 0, 1,
-0.4848479, -0.7352179, -1.625667, 0.145098, 1, 0, 1,
-0.4847282, -0.5137008, -1.227786, 0.1411765, 1, 0, 1,
-0.4835779, -0.5661515, -3.646512, 0.1333333, 1, 0, 1,
-0.4824749, -0.2770803, -2.831387, 0.1294118, 1, 0, 1,
-0.4823175, -1.198068, -3.171948, 0.1215686, 1, 0, 1,
-0.4821025, -1.124387, -1.078685, 0.1176471, 1, 0, 1,
-0.4806054, 0.9517276, -2.57866, 0.1098039, 1, 0, 1,
-0.4803821, -0.6055493, -3.887854, 0.1058824, 1, 0, 1,
-0.4761988, 0.1125814, -1.299242, 0.09803922, 1, 0, 1,
-0.4720353, 2.064912, 0.1961045, 0.09019608, 1, 0, 1,
-0.469809, 2.755631, 0.5999195, 0.08627451, 1, 0, 1,
-0.4691984, -0.8751682, -0.4582542, 0.07843138, 1, 0, 1,
-0.4660881, 0.02038327, -1.912029, 0.07450981, 1, 0, 1,
-0.4619311, -0.3033331, -1.042091, 0.06666667, 1, 0, 1,
-0.4599711, -1.428779, -3.714299, 0.0627451, 1, 0, 1,
-0.4560842, 0.4234644, -0.3402647, 0.05490196, 1, 0, 1,
-0.4554334, -2.359633, -2.319523, 0.05098039, 1, 0, 1,
-0.4553563, -1.795424, -2.081453, 0.04313726, 1, 0, 1,
-0.4532016, 1.02866, -1.324373, 0.03921569, 1, 0, 1,
-0.4518508, 0.5037248, -1.780652, 0.03137255, 1, 0, 1,
-0.4513058, -0.7525195, -3.449213, 0.02745098, 1, 0, 1,
-0.451237, 3.026201, -0.7069348, 0.01960784, 1, 0, 1,
-0.4509493, -0.4446597, -2.442278, 0.01568628, 1, 0, 1,
-0.4450965, -0.6791483, -3.307391, 0.007843138, 1, 0, 1,
-0.4448084, -0.867701, -3.952153, 0.003921569, 1, 0, 1,
-0.4408796, -0.3373477, -2.466455, 0, 1, 0.003921569, 1,
-0.4408596, 0.512383, -1.5927, 0, 1, 0.01176471, 1,
-0.4406743, 1.137007, -0.1402432, 0, 1, 0.01568628, 1,
-0.4380885, -2.013621, -3.720647, 0, 1, 0.02352941, 1,
-0.4377767, 0.5987777, 0.06391142, 0, 1, 0.02745098, 1,
-0.436157, 0.3593102, -1.632891, 0, 1, 0.03529412, 1,
-0.4328213, 1.374559, 1.306504, 0, 1, 0.03921569, 1,
-0.4305429, -0.3217378, -0.664117, 0, 1, 0.04705882, 1,
-0.4299607, 2.917804, -0.3150314, 0, 1, 0.05098039, 1,
-0.428325, -0.8139768, -3.343439, 0, 1, 0.05882353, 1,
-0.4220821, -0.03024948, -1.167446, 0, 1, 0.0627451, 1,
-0.4198221, -0.9049168, -2.109255, 0, 1, 0.07058824, 1,
-0.4172289, -0.08336817, -1.956618, 0, 1, 0.07450981, 1,
-0.4133362, 0.263637, -0.5911224, 0, 1, 0.08235294, 1,
-0.4066305, 1.08696, -0.1087935, 0, 1, 0.08627451, 1,
-0.4039311, 0.5960907, 0.009287173, 0, 1, 0.09411765, 1,
-0.4032019, -1.168144, -3.576191, 0, 1, 0.1019608, 1,
-0.4023802, -0.7728735, -2.817558, 0, 1, 0.1058824, 1,
-0.4006525, -0.1988708, -4.586614, 0, 1, 0.1137255, 1,
-0.4001084, -0.5733491, -2.513237, 0, 1, 0.1176471, 1,
-0.3984925, 0.1711624, -1.017584, 0, 1, 0.1254902, 1,
-0.3964622, -1.486487, -3.922759, 0, 1, 0.1294118, 1,
-0.3961962, 1.110033, 1.890021, 0, 1, 0.1372549, 1,
-0.3881927, -0.7114595, -3.468687, 0, 1, 0.1411765, 1,
-0.3875522, -0.01201873, -1.124285, 0, 1, 0.1490196, 1,
-0.3874691, -1.182704, -2.05754, 0, 1, 0.1529412, 1,
-0.379691, -1.432003, -2.422325, 0, 1, 0.1607843, 1,
-0.3753609, 0.1656514, 0.4140664, 0, 1, 0.1647059, 1,
-0.3747594, 0.6619387, -0.8512868, 0, 1, 0.172549, 1,
-0.3733154, 0.9890426, -1.150518, 0, 1, 0.1764706, 1,
-0.3702188, -1.501724, -3.016731, 0, 1, 0.1843137, 1,
-0.3628152, -0.6359254, -1.145731, 0, 1, 0.1882353, 1,
-0.3627612, -1.713456, -3.453102, 0, 1, 0.1960784, 1,
-0.3527449, 2.220363, -0.6779761, 0, 1, 0.2039216, 1,
-0.3484514, 0.6484515, 0.5351132, 0, 1, 0.2078431, 1,
-0.3483066, -0.1977267, -1.891357, 0, 1, 0.2156863, 1,
-0.3455273, 1.855073, 2.092311, 0, 1, 0.2196078, 1,
-0.343769, 1.336395, -1.050478, 0, 1, 0.227451, 1,
-0.3401897, 0.1427527, -0.2016288, 0, 1, 0.2313726, 1,
-0.3386514, 0.7332976, 0.1744573, 0, 1, 0.2392157, 1,
-0.3379744, 2.037494, 1.08989, 0, 1, 0.2431373, 1,
-0.3340402, 2.445765, -0.5985891, 0, 1, 0.2509804, 1,
-0.3327084, 0.9179616, -1.246292, 0, 1, 0.254902, 1,
-0.3321146, -0.6175873, -3.084322, 0, 1, 0.2627451, 1,
-0.3292912, -0.09208621, -1.01629, 0, 1, 0.2666667, 1,
-0.3248517, -0.1008534, -2.803239, 0, 1, 0.2745098, 1,
-0.3246098, 1.060447, -1.867438, 0, 1, 0.2784314, 1,
-0.3218908, 0.157669, -1.850262, 0, 1, 0.2862745, 1,
-0.3202636, -0.544026, -2.964131, 0, 1, 0.2901961, 1,
-0.3187164, -0.3689291, -2.786412, 0, 1, 0.2980392, 1,
-0.317099, 0.404525, 0.9586715, 0, 1, 0.3058824, 1,
-0.3156362, 0.1355609, -0.7330045, 0, 1, 0.3098039, 1,
-0.3121355, 0.5754736, -1.505617, 0, 1, 0.3176471, 1,
-0.3094033, -0.4038801, -2.788362, 0, 1, 0.3215686, 1,
-0.307997, 0.2544185, -1.07216, 0, 1, 0.3294118, 1,
-0.3044466, 1.003561, -1.064781, 0, 1, 0.3333333, 1,
-0.3022703, -1.103893, -3.450408, 0, 1, 0.3411765, 1,
-0.3003439, 1.663325, 1.92295, 0, 1, 0.345098, 1,
-0.2985729, 0.5455999, 0.5491486, 0, 1, 0.3529412, 1,
-0.2982482, 1.646432, -1.114392, 0, 1, 0.3568628, 1,
-0.2966618, 0.2160008, -0.8116246, 0, 1, 0.3647059, 1,
-0.2962736, 0.2691561, -1.118959, 0, 1, 0.3686275, 1,
-0.2951074, 1.088241, 0.4328808, 0, 1, 0.3764706, 1,
-0.2911798, 0.2255097, -0.22774, 0, 1, 0.3803922, 1,
-0.2881303, 0.4917437, -1.731616, 0, 1, 0.3882353, 1,
-0.2866506, -1.434897, -2.431942, 0, 1, 0.3921569, 1,
-0.2858499, 0.2191027, -0.8083478, 0, 1, 0.4, 1,
-0.2836446, -1.339702, -0.4604198, 0, 1, 0.4078431, 1,
-0.2715591, 2.091648, -2.134562, 0, 1, 0.4117647, 1,
-0.2649746, 0.5660502, -0.4607869, 0, 1, 0.4196078, 1,
-0.2603782, -2.362266, -3.753813, 0, 1, 0.4235294, 1,
-0.257351, -0.5250435, -4.950082, 0, 1, 0.4313726, 1,
-0.2524155, 0.4736087, -1.231423, 0, 1, 0.4352941, 1,
-0.2496841, -0.8060837, -2.559995, 0, 1, 0.4431373, 1,
-0.2479169, -0.4040343, -1.83948, 0, 1, 0.4470588, 1,
-0.2471098, 0.02464881, -2.52953, 0, 1, 0.454902, 1,
-0.2441612, -0.01197798, -1.122224, 0, 1, 0.4588235, 1,
-0.2409424, 1.210067, 2.001989, 0, 1, 0.4666667, 1,
-0.2383364, 0.9869394, -1.031101, 0, 1, 0.4705882, 1,
-0.2371449, -1.154338, -2.532996, 0, 1, 0.4784314, 1,
-0.2363093, 1.255238, -1.466461, 0, 1, 0.4823529, 1,
-0.235851, -1.597172, -3.430995, 0, 1, 0.4901961, 1,
-0.2322085, -1.425555, -3.05167, 0, 1, 0.4941176, 1,
-0.2308543, 1.712826, -0.5083969, 0, 1, 0.5019608, 1,
-0.2303092, -0.6550216, -4.037863, 0, 1, 0.509804, 1,
-0.2290554, -0.8278841, -3.229129, 0, 1, 0.5137255, 1,
-0.2288442, 0.3998592, -0.5001662, 0, 1, 0.5215687, 1,
-0.2284635, -2.759108, -3.337905, 0, 1, 0.5254902, 1,
-0.226728, -1.226353, -2.510245, 0, 1, 0.5333334, 1,
-0.2220512, -0.3771142, -3.600799, 0, 1, 0.5372549, 1,
-0.2211086, 0.5736236, -1.03705, 0, 1, 0.5450981, 1,
-0.2202903, -0.2465024, -3.068687, 0, 1, 0.5490196, 1,
-0.2194761, 0.7674343, 0.4066035, 0, 1, 0.5568628, 1,
-0.2127471, -0.9315534, -2.9166, 0, 1, 0.5607843, 1,
-0.2121907, 0.8252397, 0.5373931, 0, 1, 0.5686275, 1,
-0.2055442, -0.02925083, -1.590037, 0, 1, 0.572549, 1,
-0.2019025, -0.2032696, -3.753785, 0, 1, 0.5803922, 1,
-0.2008536, -0.6873892, -2.597658, 0, 1, 0.5843138, 1,
-0.2003518, -0.2052883, -1.853994, 0, 1, 0.5921569, 1,
-0.1989214, -0.0758361, -2.550055, 0, 1, 0.5960785, 1,
-0.1926402, 0.04069911, -0.7118205, 0, 1, 0.6039216, 1,
-0.1889982, 1.95711, -0.6346819, 0, 1, 0.6117647, 1,
-0.1887983, 0.9603037, 0.09253646, 0, 1, 0.6156863, 1,
-0.188745, 0.7646758, 0.1676657, 0, 1, 0.6235294, 1,
-0.188669, 0.4521908, -0.3548187, 0, 1, 0.627451, 1,
-0.1871146, 0.101397, -1.032953, 0, 1, 0.6352941, 1,
-0.1865414, -0.7541555, -3.440857, 0, 1, 0.6392157, 1,
-0.1845506, -0.09697703, -1.358786, 0, 1, 0.6470588, 1,
-0.1831556, 2.023958, 0.1777147, 0, 1, 0.6509804, 1,
-0.1829586, -1.105064, -4.647986, 0, 1, 0.6588235, 1,
-0.1753407, -0.8245935, -1.990416, 0, 1, 0.6627451, 1,
-0.1737428, -0.04009431, -1.121464, 0, 1, 0.6705883, 1,
-0.170018, 0.734798, 0.3342653, 0, 1, 0.6745098, 1,
-0.1615054, -0.2796145, -1.235504, 0, 1, 0.682353, 1,
-0.1595688, 1.38924, -0.5647843, 0, 1, 0.6862745, 1,
-0.1574508, -0.23907, -1.218783, 0, 1, 0.6941177, 1,
-0.1486271, 0.9489193, 1.358415, 0, 1, 0.7019608, 1,
-0.1450387, -0.8282022, -4.385869, 0, 1, 0.7058824, 1,
-0.1412065, 0.953693, -0.1548657, 0, 1, 0.7137255, 1,
-0.138595, -0.03833421, -1.423395, 0, 1, 0.7176471, 1,
-0.137568, -0.6472384, -3.247503, 0, 1, 0.7254902, 1,
-0.1351185, 2.046023, -2.446897, 0, 1, 0.7294118, 1,
-0.1344448, 1.152791, 0.6290388, 0, 1, 0.7372549, 1,
-0.1340954, 0.2985738, -1.016186, 0, 1, 0.7411765, 1,
-0.1334031, 1.159491, -1.28942, 0, 1, 0.7490196, 1,
-0.1323363, -2.055067, -2.06994, 0, 1, 0.7529412, 1,
-0.1314322, -0.2735613, -4.108223, 0, 1, 0.7607843, 1,
-0.1288437, 1.239558, -1.147606, 0, 1, 0.7647059, 1,
-0.1226989, 0.8618448, 0.2068374, 0, 1, 0.772549, 1,
-0.1188423, 1.445078, -0.660409, 0, 1, 0.7764706, 1,
-0.1188065, -0.903124, -2.697293, 0, 1, 0.7843137, 1,
-0.1140242, -1.028848, -2.029001, 0, 1, 0.7882353, 1,
-0.111098, -1.201299, -2.117562, 0, 1, 0.7960784, 1,
-0.1065698, 0.6000848, 0.08831085, 0, 1, 0.8039216, 1,
-0.1054476, -1.000064, -3.316167, 0, 1, 0.8078431, 1,
-0.1045151, -1.398369, -4.057187, 0, 1, 0.8156863, 1,
-0.09467512, 2.572624, 0.7613896, 0, 1, 0.8196079, 1,
-0.09451205, -0.6013235, -2.91818, 0, 1, 0.827451, 1,
-0.09263635, -0.2782514, -3.459015, 0, 1, 0.8313726, 1,
-0.09107352, 2.354645, 0.3244455, 0, 1, 0.8392157, 1,
-0.08422209, 0.5668241, 0.2304196, 0, 1, 0.8431373, 1,
-0.08054758, 0.3337026, -1.747359, 0, 1, 0.8509804, 1,
-0.07821752, 0.0806296, -1.332408, 0, 1, 0.854902, 1,
-0.07467198, 0.08748976, -0.622533, 0, 1, 0.8627451, 1,
-0.07282262, -0.7224629, -2.450621, 0, 1, 0.8666667, 1,
-0.07255913, -0.2666792, -3.789968, 0, 1, 0.8745098, 1,
-0.07241638, 0.7498444, 0.3573753, 0, 1, 0.8784314, 1,
-0.0689343, -0.716382, -2.632085, 0, 1, 0.8862745, 1,
-0.06193853, -1.415572, -2.687684, 0, 1, 0.8901961, 1,
-0.06132545, -1.752818, -3.451574, 0, 1, 0.8980392, 1,
-0.05610421, -1.659621, -3.638921, 0, 1, 0.9058824, 1,
-0.05508387, 0.6522722, 0.3175747, 0, 1, 0.9098039, 1,
-0.05318145, -0.2288891, -2.364428, 0, 1, 0.9176471, 1,
-0.05058334, 0.857587, -0.5479966, 0, 1, 0.9215686, 1,
-0.04728673, 1.160997, -2.472571, 0, 1, 0.9294118, 1,
-0.04587249, -0.7836443, -2.557417, 0, 1, 0.9333333, 1,
-0.04531651, 0.7006531, 1.744908, 0, 1, 0.9411765, 1,
-0.04117171, -0.8990066, -3.97319, 0, 1, 0.945098, 1,
-0.04050679, 0.1270371, -0.7375106, 0, 1, 0.9529412, 1,
-0.03964028, 0.447818, 0.8940292, 0, 1, 0.9568627, 1,
-0.03902404, 0.5693325, -0.2911888, 0, 1, 0.9647059, 1,
-0.03743155, 1.123325, -2.457153, 0, 1, 0.9686275, 1,
-0.02663579, 0.7234371, 1.28694, 0, 1, 0.9764706, 1,
-0.02519864, 1.914312, -2.1275, 0, 1, 0.9803922, 1,
-0.02131617, 0.235048, -0.2979808, 0, 1, 0.9882353, 1,
-0.0209542, -1.780208, -3.500932, 0, 1, 0.9921569, 1,
-0.01964491, -0.02099417, -1.918682, 0, 1, 1, 1,
-0.01865751, -0.7599792, -2.555416, 0, 0.9921569, 1, 1,
-0.01608903, -0.2866419, -1.936584, 0, 0.9882353, 1, 1,
-0.01013319, -0.6578807, -5.228706, 0, 0.9803922, 1, 1,
-0.009930812, 0.2660477, -0.1108504, 0, 0.9764706, 1, 1,
-0.009575929, 0.9316947, -0.7884433, 0, 0.9686275, 1, 1,
-0.008705966, 0.2147244, 1.261227, 0, 0.9647059, 1, 1,
-0.001841869, -1.142056, -1.900326, 0, 0.9568627, 1, 1,
-0.001757891, 0.4901417, 0.5480481, 0, 0.9529412, 1, 1,
0.0002614562, 0.7747249, -0.1621582, 0, 0.945098, 1, 1,
0.006683487, -0.7743239, 2.814362, 0, 0.9411765, 1, 1,
0.00760038, 0.4679625, -2.957135, 0, 0.9333333, 1, 1,
0.01609262, 0.4975273, -1.672669, 0, 0.9294118, 1, 1,
0.01899486, 0.7254021, -0.2515188, 0, 0.9215686, 1, 1,
0.02015612, 1.101152, 0.5360847, 0, 0.9176471, 1, 1,
0.02075419, -1.000556, 0.6390492, 0, 0.9098039, 1, 1,
0.02763299, 0.5578167, -1.374184, 0, 0.9058824, 1, 1,
0.02906677, -0.850584, 2.850157, 0, 0.8980392, 1, 1,
0.02938412, -1.232629, 2.988501, 0, 0.8901961, 1, 1,
0.02965405, -0.1794907, 2.866392, 0, 0.8862745, 1, 1,
0.03014956, -1.539459, 4.052955, 0, 0.8784314, 1, 1,
0.03068343, -0.7725513, 3.688512, 0, 0.8745098, 1, 1,
0.03258729, 1.036355, 0.4491357, 0, 0.8666667, 1, 1,
0.03259513, -0.3554854, 2.280746, 0, 0.8627451, 1, 1,
0.03323558, -0.5159839, 2.921242, 0, 0.854902, 1, 1,
0.03525895, -0.5657746, 4.476104, 0, 0.8509804, 1, 1,
0.03751845, -1.307283, 1.62673, 0, 0.8431373, 1, 1,
0.03787596, -0.5579836, 2.457041, 0, 0.8392157, 1, 1,
0.03865776, -1.536017, 2.955095, 0, 0.8313726, 1, 1,
0.04019116, -2.001751, 4.084258, 0, 0.827451, 1, 1,
0.04055338, -0.4403479, 2.86699, 0, 0.8196079, 1, 1,
0.04064365, 1.812833, -0.01160863, 0, 0.8156863, 1, 1,
0.04128846, 1.165274, 0.5664955, 0, 0.8078431, 1, 1,
0.04192494, 1.423533, 1.778644, 0, 0.8039216, 1, 1,
0.04284609, 0.5101414, 0.3814368, 0, 0.7960784, 1, 1,
0.04298582, 1.236774, -0.9941733, 0, 0.7882353, 1, 1,
0.04374997, 0.8409171, 1.886167, 0, 0.7843137, 1, 1,
0.04741763, -0.6871957, 3.750866, 0, 0.7764706, 1, 1,
0.04945163, -1.299236, 1.599072, 0, 0.772549, 1, 1,
0.05216907, 0.1190827, 0.8798482, 0, 0.7647059, 1, 1,
0.05292152, 1.316586, -0.5085384, 0, 0.7607843, 1, 1,
0.05593648, 0.2815929, 0.1261245, 0, 0.7529412, 1, 1,
0.0712642, -1.718382, 4.412448, 0, 0.7490196, 1, 1,
0.07353444, 1.163321, 0.4524379, 0, 0.7411765, 1, 1,
0.07552739, 0.5700436, -0.4589262, 0, 0.7372549, 1, 1,
0.08077733, 0.1771468, -0.5909516, 0, 0.7294118, 1, 1,
0.08355889, 0.3244349, 1.128306, 0, 0.7254902, 1, 1,
0.0851443, 0.477201, -0.2340834, 0, 0.7176471, 1, 1,
0.08976056, 0.9131016, -0.3535327, 0, 0.7137255, 1, 1,
0.09291395, 0.002220264, 1.352737, 0, 0.7058824, 1, 1,
0.0957205, 0.1755916, 1.657647, 0, 0.6980392, 1, 1,
0.09760448, -1.213325, 4.253235, 0, 0.6941177, 1, 1,
0.09875804, 0.2879249, 0.6210604, 0, 0.6862745, 1, 1,
0.1055868, -0.77153, 2.831412, 0, 0.682353, 1, 1,
0.1071391, 0.05138726, -0.08613804, 0, 0.6745098, 1, 1,
0.1074188, -1.088254, 3.414179, 0, 0.6705883, 1, 1,
0.1081381, 0.4474063, 1.045146, 0, 0.6627451, 1, 1,
0.1114746, -0.2537653, 3.211102, 0, 0.6588235, 1, 1,
0.111972, 0.3021441, 1.974181, 0, 0.6509804, 1, 1,
0.1131274, -0.1950677, 1.107834, 0, 0.6470588, 1, 1,
0.1140503, -1.502467, 3.772268, 0, 0.6392157, 1, 1,
0.1149639, -0.1620161, 1.752372, 0, 0.6352941, 1, 1,
0.1179125, 1.092263, -0.09746643, 0, 0.627451, 1, 1,
0.1198489, 0.3880266, 0.7726021, 0, 0.6235294, 1, 1,
0.1287836, 1.177135, -0.8127852, 0, 0.6156863, 1, 1,
0.131217, -0.3648746, 0.9615641, 0, 0.6117647, 1, 1,
0.136207, -0.7672375, 0.4910715, 0, 0.6039216, 1, 1,
0.1397927, 1.482735, -0.1944457, 0, 0.5960785, 1, 1,
0.1459976, 1.379625, 0.5867045, 0, 0.5921569, 1, 1,
0.1490608, -0.7792302, 3.153929, 0, 0.5843138, 1, 1,
0.1506409, -1.08332, 3.412905, 0, 0.5803922, 1, 1,
0.152017, -1.53835, 4.77477, 0, 0.572549, 1, 1,
0.155627, 1.398554, -0.8015075, 0, 0.5686275, 1, 1,
0.156009, -1.757463, 4.03774, 0, 0.5607843, 1, 1,
0.1583931, 0.5464332, -0.6103261, 0, 0.5568628, 1, 1,
0.1623192, -0.5804273, 4.877048, 0, 0.5490196, 1, 1,
0.1662958, -1.446943, 2.9494, 0, 0.5450981, 1, 1,
0.1733092, 0.3394375, 0.5666381, 0, 0.5372549, 1, 1,
0.1735754, -0.7297852, 3.246066, 0, 0.5333334, 1, 1,
0.1736202, 2.935298, -0.1009356, 0, 0.5254902, 1, 1,
0.1761064, -1.632257, 1.523346, 0, 0.5215687, 1, 1,
0.1821906, -0.1896835, 2.092883, 0, 0.5137255, 1, 1,
0.1904303, 0.5109349, 0.7147815, 0, 0.509804, 1, 1,
0.1906078, -0.5338935, 2.372425, 0, 0.5019608, 1, 1,
0.1917628, -1.506608, 4.512532, 0, 0.4941176, 1, 1,
0.1970297, -0.6690825, 2.438747, 0, 0.4901961, 1, 1,
0.1982952, 1.343916, 1.204293, 0, 0.4823529, 1, 1,
0.2009233, 0.2970025, 1.947424, 0, 0.4784314, 1, 1,
0.2055932, -0.3138394, 2.534521, 0, 0.4705882, 1, 1,
0.2060634, -1.084404, 2.650454, 0, 0.4666667, 1, 1,
0.2108099, 1.724927, -0.855196, 0, 0.4588235, 1, 1,
0.2142368, -0.1790021, 1.267493, 0, 0.454902, 1, 1,
0.2156911, -1.072353, 5.911755, 0, 0.4470588, 1, 1,
0.2181935, -0.5374895, 2.470978, 0, 0.4431373, 1, 1,
0.2182116, -0.07234427, 1.343919, 0, 0.4352941, 1, 1,
0.2182312, 1.721606, -1.035277, 0, 0.4313726, 1, 1,
0.2224661, 0.4709118, -0.9835687, 0, 0.4235294, 1, 1,
0.2237996, 0.7208683, 0.08036493, 0, 0.4196078, 1, 1,
0.2262897, -1.075783, 1.661497, 0, 0.4117647, 1, 1,
0.2297311, -0.5826352, 3.419401, 0, 0.4078431, 1, 1,
0.232123, 0.3471548, -0.6679758, 0, 0.4, 1, 1,
0.2345822, -0.2164383, 2.484372, 0, 0.3921569, 1, 1,
0.2363826, -0.5131384, 1.491827, 0, 0.3882353, 1, 1,
0.237369, 2.002469, -1.125684, 0, 0.3803922, 1, 1,
0.2434487, -0.5121692, 3.247205, 0, 0.3764706, 1, 1,
0.2472229, -1.420976, 1.596222, 0, 0.3686275, 1, 1,
0.2477446, -0.2098767, 1.366842, 0, 0.3647059, 1, 1,
0.2502925, -0.03450321, 1.083136, 0, 0.3568628, 1, 1,
0.2576584, 2.388089, 0.8593622, 0, 0.3529412, 1, 1,
0.2643616, 0.6813917, -0.08057129, 0, 0.345098, 1, 1,
0.2690308, 1.197495, 1.449792, 0, 0.3411765, 1, 1,
0.2716059, -0.9114688, 1.4655, 0, 0.3333333, 1, 1,
0.2729554, 1.416205, 0.1056452, 0, 0.3294118, 1, 1,
0.2782885, 0.3833315, -0.1861928, 0, 0.3215686, 1, 1,
0.2837247, -1.270792, 1.319892, 0, 0.3176471, 1, 1,
0.2845617, 0.1013579, 0.1280959, 0, 0.3098039, 1, 1,
0.2850072, -0.6492139, 2.951925, 0, 0.3058824, 1, 1,
0.285731, -1.542404, 3.422335, 0, 0.2980392, 1, 1,
0.2881776, -0.07375283, 1.32297, 0, 0.2901961, 1, 1,
0.290094, 1.801846, 1.685877, 0, 0.2862745, 1, 1,
0.2910747, -1.494152, 3.19995, 0, 0.2784314, 1, 1,
0.2912064, 0.6378056, 2.37576, 0, 0.2745098, 1, 1,
0.2955884, 0.5897862, 2.644418, 0, 0.2666667, 1, 1,
0.2987059, 1.8529, -0.01774867, 0, 0.2627451, 1, 1,
0.2996859, 0.3217055, 0.2358371, 0, 0.254902, 1, 1,
0.3015278, 2.000406, 0.9133484, 0, 0.2509804, 1, 1,
0.3029527, 0.4169368, 1.654101, 0, 0.2431373, 1, 1,
0.3046042, -2.038549, 3.320927, 0, 0.2392157, 1, 1,
0.3054092, -0.2381308, 2.537949, 0, 0.2313726, 1, 1,
0.3065629, 0.2747325, -0.1766381, 0, 0.227451, 1, 1,
0.311764, 0.3799019, 0.4288439, 0, 0.2196078, 1, 1,
0.3133043, 0.6061127, 0.8403742, 0, 0.2156863, 1, 1,
0.3243687, 1.47124, 0.1204418, 0, 0.2078431, 1, 1,
0.3252696, -1.678036, 3.711453, 0, 0.2039216, 1, 1,
0.325373, 1.160012, -0.3010179, 0, 0.1960784, 1, 1,
0.3281276, -0.2877755, 2.714962, 0, 0.1882353, 1, 1,
0.3303349, 0.6023867, 1.246881, 0, 0.1843137, 1, 1,
0.3307994, 1.207796, -0.510604, 0, 0.1764706, 1, 1,
0.3337323, 0.2852825, 2.358926, 0, 0.172549, 1, 1,
0.3358073, -0.1957528, 2.534504, 0, 0.1647059, 1, 1,
0.3383354, -1.29985, 2.584731, 0, 0.1607843, 1, 1,
0.3429048, -0.964688, 3.2555, 0, 0.1529412, 1, 1,
0.3430001, -0.567746, 2.194769, 0, 0.1490196, 1, 1,
0.3459126, 1.276626, 0.2645608, 0, 0.1411765, 1, 1,
0.3491095, -0.4792027, 1.543049, 0, 0.1372549, 1, 1,
0.3563314, 1.817726, -0.2283168, 0, 0.1294118, 1, 1,
0.3609377, 0.9627423, 2.367907, 0, 0.1254902, 1, 1,
0.3629621, 1.238339, -0.2802707, 0, 0.1176471, 1, 1,
0.3649706, -1.118913, 1.433563, 0, 0.1137255, 1, 1,
0.3649869, 0.7346928, -0.3500758, 0, 0.1058824, 1, 1,
0.3659313, -1.239046, 1.971424, 0, 0.09803922, 1, 1,
0.3678178, 1.804581, -1.038035, 0, 0.09411765, 1, 1,
0.3735896, -0.2185597, 3.835422, 0, 0.08627451, 1, 1,
0.3827822, -0.1831318, 0.4560737, 0, 0.08235294, 1, 1,
0.3878815, -0.5258703, 2.327883, 0, 0.07450981, 1, 1,
0.3893715, 0.5651386, 1.147077, 0, 0.07058824, 1, 1,
0.3936229, -1.419764, 3.024183, 0, 0.0627451, 1, 1,
0.3999845, -1.092681, 0.9725744, 0, 0.05882353, 1, 1,
0.4026132, 1.507213, 1.11603, 0, 0.05098039, 1, 1,
0.4076221, -1.373407, 1.908348, 0, 0.04705882, 1, 1,
0.4102676, 0.9059939, 2.137535, 0, 0.03921569, 1, 1,
0.4119249, -1.531841, 3.461314, 0, 0.03529412, 1, 1,
0.4119592, 0.2246861, 1.288158, 0, 0.02745098, 1, 1,
0.4128827, 0.1528099, -1.170673, 0, 0.02352941, 1, 1,
0.4164105, -0.5360049, 2.606592, 0, 0.01568628, 1, 1,
0.4180236, -1.886021, 1.432636, 0, 0.01176471, 1, 1,
0.4217127, -1.414441, 0.6042811, 0, 0.003921569, 1, 1,
0.4217552, -0.1649219, 2.010549, 0.003921569, 0, 1, 1,
0.4229189, -0.1917566, 0.8267108, 0.007843138, 0, 1, 1,
0.4234648, 0.117724, 0.7656786, 0.01568628, 0, 1, 1,
0.4246623, -1.319896, 1.714047, 0.01960784, 0, 1, 1,
0.4250749, 1.397611, 1.26406, 0.02745098, 0, 1, 1,
0.4264186, -0.2240726, 0.7521654, 0.03137255, 0, 1, 1,
0.4282632, -0.149004, 0.9668765, 0.03921569, 0, 1, 1,
0.4297432, -1.010035, 2.094139, 0.04313726, 0, 1, 1,
0.4312106, 0.9928264, 1.323584, 0.05098039, 0, 1, 1,
0.4377621, 1.413257, 1.312409, 0.05490196, 0, 1, 1,
0.4387985, -1.525088, 3.383405, 0.0627451, 0, 1, 1,
0.4391991, -0.1649683, 3.264313, 0.06666667, 0, 1, 1,
0.4420122, 0.4214281, -0.460538, 0.07450981, 0, 1, 1,
0.4432994, -0.4623542, 3.860081, 0.07843138, 0, 1, 1,
0.4452345, 1.955381, -0.9355378, 0.08627451, 0, 1, 1,
0.451834, 0.3728241, 3.860132, 0.09019608, 0, 1, 1,
0.4582651, 0.5600408, 0.5936509, 0.09803922, 0, 1, 1,
0.4613694, -0.8928667, 2.624755, 0.1058824, 0, 1, 1,
0.4642492, 0.5827122, -0.004985725, 0.1098039, 0, 1, 1,
0.4652194, 0.506436, 1.85233, 0.1176471, 0, 1, 1,
0.4679125, 0.2445396, 0.9716032, 0.1215686, 0, 1, 1,
0.4683908, -0.5653624, 1.40799, 0.1294118, 0, 1, 1,
0.4818408, 1.570384, 0.02537591, 0.1333333, 0, 1, 1,
0.4821683, -0.6611685, 2.884238, 0.1411765, 0, 1, 1,
0.4824094, 0.9740528, -0.6447695, 0.145098, 0, 1, 1,
0.4844013, -0.9629336, 2.185987, 0.1529412, 0, 1, 1,
0.484438, -0.717798, 3.09867, 0.1568628, 0, 1, 1,
0.4891922, -0.8057911, 2.476818, 0.1647059, 0, 1, 1,
0.4942889, 0.2088939, 2.065895, 0.1686275, 0, 1, 1,
0.4973081, 0.7888268, 0.5601109, 0.1764706, 0, 1, 1,
0.4994503, -0.2865633, 0.7221394, 0.1803922, 0, 1, 1,
0.5023499, -1.400395, 2.253327, 0.1882353, 0, 1, 1,
0.5049741, 0.6660542, 1.303482, 0.1921569, 0, 1, 1,
0.5125719, -0.8601711, 2.155001, 0.2, 0, 1, 1,
0.5127878, -0.9170558, 2.328305, 0.2078431, 0, 1, 1,
0.5164096, 0.2544453, 0.8767381, 0.2117647, 0, 1, 1,
0.5186651, -1.181782, 2.142765, 0.2196078, 0, 1, 1,
0.524121, -1.07608, 2.932503, 0.2235294, 0, 1, 1,
0.5248691, 0.813153, -0.8692589, 0.2313726, 0, 1, 1,
0.5269624, 1.010225, 1.62535, 0.2352941, 0, 1, 1,
0.5270927, 0.5458939, 1.600023, 0.2431373, 0, 1, 1,
0.5271503, 0.129456, -0.721108, 0.2470588, 0, 1, 1,
0.5289232, -0.1241944, 2.444382, 0.254902, 0, 1, 1,
0.530157, -0.5624353, 3.948828, 0.2588235, 0, 1, 1,
0.5303867, -0.5695157, 2.698563, 0.2666667, 0, 1, 1,
0.5386955, 0.9803143, 0.8396303, 0.2705882, 0, 1, 1,
0.5391709, 1.116664, 1.165352, 0.2784314, 0, 1, 1,
0.5393034, 0.7673542, -0.2455159, 0.282353, 0, 1, 1,
0.5426996, 0.5728895, 2.214317, 0.2901961, 0, 1, 1,
0.55043, 0.5112863, 2.987242, 0.2941177, 0, 1, 1,
0.5536764, 1.189259, 1.353975, 0.3019608, 0, 1, 1,
0.5587062, 0.05600822, 1.453583, 0.3098039, 0, 1, 1,
0.5642813, -1.144511, 2.363151, 0.3137255, 0, 1, 1,
0.5713823, -1.691632, 3.313652, 0.3215686, 0, 1, 1,
0.5723606, 1.035875, 0.4600646, 0.3254902, 0, 1, 1,
0.5771879, 1.37391, 1.324976, 0.3333333, 0, 1, 1,
0.5777526, 2.293574, 2.206329, 0.3372549, 0, 1, 1,
0.5785644, 0.6262082, -0.2854806, 0.345098, 0, 1, 1,
0.5844931, -0.4192841, 1.565278, 0.3490196, 0, 1, 1,
0.5856197, -0.6397344, 1.672075, 0.3568628, 0, 1, 1,
0.5875353, 0.5253666, -0.7170576, 0.3607843, 0, 1, 1,
0.5920029, 0.8333584, 0.5648189, 0.3686275, 0, 1, 1,
0.5934682, -3.071326, 2.936579, 0.372549, 0, 1, 1,
0.5976253, 1.30079, 0.4046511, 0.3803922, 0, 1, 1,
0.6031115, 1.98835, 0.2786947, 0.3843137, 0, 1, 1,
0.6043234, -0.7699431, 2.013997, 0.3921569, 0, 1, 1,
0.6116994, -0.9480028, 2.547707, 0.3960784, 0, 1, 1,
0.6187314, -0.5002224, 0.924022, 0.4039216, 0, 1, 1,
0.6197802, 0.5580984, 0.8729141, 0.4117647, 0, 1, 1,
0.624505, 1.878672, 0.397668, 0.4156863, 0, 1, 1,
0.6282803, -0.5350193, 3.047776, 0.4235294, 0, 1, 1,
0.633424, -0.06861473, 0.932525, 0.427451, 0, 1, 1,
0.6406295, 1.156115, 2.846776, 0.4352941, 0, 1, 1,
0.6419321, 0.8297461, 2.05145, 0.4392157, 0, 1, 1,
0.6438593, -0.232658, 0.4773175, 0.4470588, 0, 1, 1,
0.6459646, -1.106925, 3.399785, 0.4509804, 0, 1, 1,
0.6533782, -0.9277857, 1.920894, 0.4588235, 0, 1, 1,
0.6549882, -0.3514268, 2.77369, 0.4627451, 0, 1, 1,
0.6557347, 1.212979, -0.8513126, 0.4705882, 0, 1, 1,
0.6563396, -0.317688, 3.330802, 0.4745098, 0, 1, 1,
0.6583224, -0.9215011, 3.064144, 0.4823529, 0, 1, 1,
0.6591929, 0.5582529, 0.3223244, 0.4862745, 0, 1, 1,
0.6670718, -0.6930675, 3.149924, 0.4941176, 0, 1, 1,
0.6730052, -2.024543, 3.96451, 0.5019608, 0, 1, 1,
0.6758257, -1.635413, 4.836751, 0.5058824, 0, 1, 1,
0.677678, -0.0008651976, 1.428359, 0.5137255, 0, 1, 1,
0.6847749, -0.1071078, 0.4260269, 0.5176471, 0, 1, 1,
0.6898916, 1.130727, -0.1730547, 0.5254902, 0, 1, 1,
0.6952536, 0.5899861, 1.073935, 0.5294118, 0, 1, 1,
0.6970972, 0.9198604, -1.872884, 0.5372549, 0, 1, 1,
0.6975772, 0.9474868, 0.922621, 0.5411765, 0, 1, 1,
0.7058306, 0.05042744, 0.7374061, 0.5490196, 0, 1, 1,
0.7062775, 1.494678, 0.2164781, 0.5529412, 0, 1, 1,
0.706585, 0.2744598, 1.212683, 0.5607843, 0, 1, 1,
0.710804, 0.9644889, 1.67611, 0.5647059, 0, 1, 1,
0.7122601, -0.6749974, 0.3057486, 0.572549, 0, 1, 1,
0.7146335, -1.13134, 1.42126, 0.5764706, 0, 1, 1,
0.716556, 0.3048545, 1.093446, 0.5843138, 0, 1, 1,
0.7183952, -1.773163, 3.712451, 0.5882353, 0, 1, 1,
0.7206507, -0.6147448, 3.295147, 0.5960785, 0, 1, 1,
0.7228829, -0.07314826, 1.657194, 0.6039216, 0, 1, 1,
0.7269818, 0.3316787, 1.395576, 0.6078432, 0, 1, 1,
0.7289556, -0.3118972, 1.248452, 0.6156863, 0, 1, 1,
0.7302678, -0.4073226, 0.9935599, 0.6196079, 0, 1, 1,
0.7327703, -0.7783388, 3.102412, 0.627451, 0, 1, 1,
0.7329888, -0.8895373, 1.97412, 0.6313726, 0, 1, 1,
0.7335032, 0.2767803, 2.460759, 0.6392157, 0, 1, 1,
0.7396114, -1.682093, 2.960588, 0.6431373, 0, 1, 1,
0.755282, -0.186289, 2.2407, 0.6509804, 0, 1, 1,
0.7555897, 0.1731062, 1.609258, 0.654902, 0, 1, 1,
0.7578076, -0.7194883, 3.5496, 0.6627451, 0, 1, 1,
0.7600408, -0.5602004, 2.980138, 0.6666667, 0, 1, 1,
0.7621958, 1.223429, -1.022558, 0.6745098, 0, 1, 1,
0.7690005, -0.07537559, 0.09477397, 0.6784314, 0, 1, 1,
0.7791247, -1.255554, 0.8591607, 0.6862745, 0, 1, 1,
0.7799673, 1.480477, -0.6736134, 0.6901961, 0, 1, 1,
0.7809287, -0.1623332, -0.310963, 0.6980392, 0, 1, 1,
0.7854806, -1.132402, 2.960504, 0.7058824, 0, 1, 1,
0.7879945, 0.5166727, 2.630559, 0.7098039, 0, 1, 1,
0.7928877, -1.029767, 1.40349, 0.7176471, 0, 1, 1,
0.7947094, -0.6863369, 4.037644, 0.7215686, 0, 1, 1,
0.7978309, 0.09223002, 1.946923, 0.7294118, 0, 1, 1,
0.8023859, 0.7220941, 1.743459, 0.7333333, 0, 1, 1,
0.8062399, 0.4776955, 2.272044, 0.7411765, 0, 1, 1,
0.8072167, -0.776291, 3.524318, 0.7450981, 0, 1, 1,
0.8088808, -0.5263714, 1.90198, 0.7529412, 0, 1, 1,
0.8164642, 1.140556, 1.261646, 0.7568628, 0, 1, 1,
0.816871, 0.03430643, 0.9573454, 0.7647059, 0, 1, 1,
0.819194, 0.06960756, 0.04194447, 0.7686275, 0, 1, 1,
0.8210236, 1.293935, -0.9658548, 0.7764706, 0, 1, 1,
0.8244886, -0.5126193, 1.912309, 0.7803922, 0, 1, 1,
0.8268715, 1.54616, 1.044406, 0.7882353, 0, 1, 1,
0.8295613, -0.5320507, 3.167929, 0.7921569, 0, 1, 1,
0.8304229, 0.3801298, -0.3523942, 0.8, 0, 1, 1,
0.8321691, 0.8700761, 0.2261112, 0.8078431, 0, 1, 1,
0.8368567, -0.2224957, 2.178477, 0.8117647, 0, 1, 1,
0.8379778, -0.3997582, 1.61106, 0.8196079, 0, 1, 1,
0.8387714, -1.473708, 1.645929, 0.8235294, 0, 1, 1,
0.8398575, -0.1245594, 1.90782, 0.8313726, 0, 1, 1,
0.8433081, 0.3054638, -0.3831258, 0.8352941, 0, 1, 1,
0.8463538, 0.0906729, 1.638697, 0.8431373, 0, 1, 1,
0.8489159, 0.9624221, 0.1263405, 0.8470588, 0, 1, 1,
0.8606239, -2.37511, 2.198894, 0.854902, 0, 1, 1,
0.8616198, 0.5801351, 1.237237, 0.8588235, 0, 1, 1,
0.8731925, -0.9713522, 2.920177, 0.8666667, 0, 1, 1,
0.8773469, 0.742999, 0.4770721, 0.8705882, 0, 1, 1,
0.8826454, 0.6367374, 2.496266, 0.8784314, 0, 1, 1,
0.8859817, 0.5579621, 2.441302, 0.8823529, 0, 1, 1,
0.8880921, 1.751458, 1.035576, 0.8901961, 0, 1, 1,
0.8979837, -0.939524, 2.977674, 0.8941177, 0, 1, 1,
0.9040272, 0.1740617, 1.136184, 0.9019608, 0, 1, 1,
0.9184618, -0.8793337, 2.501946, 0.9098039, 0, 1, 1,
0.9215859, -1.275808, 1.101444, 0.9137255, 0, 1, 1,
0.9294199, -0.2678618, 2.616634, 0.9215686, 0, 1, 1,
0.9326085, 0.6845776, 2.618843, 0.9254902, 0, 1, 1,
0.9341372, 0.452307, -0.2786801, 0.9333333, 0, 1, 1,
0.9342015, 0.1588844, 1.501998, 0.9372549, 0, 1, 1,
0.9342791, -0.7412628, 2.036743, 0.945098, 0, 1, 1,
0.9370108, -0.04135381, 2.79413, 0.9490196, 0, 1, 1,
0.938721, -0.5579344, 3.434526, 0.9568627, 0, 1, 1,
0.9414901, -0.9398121, 2.269542, 0.9607843, 0, 1, 1,
0.9466106, -1.459316, 2.656002, 0.9686275, 0, 1, 1,
0.9487321, 0.04526852, 0.837716, 0.972549, 0, 1, 1,
0.9491641, 0.3065278, -1.135972, 0.9803922, 0, 1, 1,
0.9493964, 0.007521709, 2.79197, 0.9843137, 0, 1, 1,
0.9533005, -0.4226755, 4.267005, 0.9921569, 0, 1, 1,
0.9539385, 1.667089, 2.084611, 0.9960784, 0, 1, 1,
0.9553519, 1.667588, 1.676824, 1, 0, 0.9960784, 1,
0.9568472, 0.01319712, 2.393079, 1, 0, 0.9882353, 1,
0.9594549, -1.742049, 1.997913, 1, 0, 0.9843137, 1,
0.9649229, 3.329548, -0.6758549, 1, 0, 0.9764706, 1,
0.9658681, -1.173328, 2.933029, 1, 0, 0.972549, 1,
0.969717, -0.8510067, 0.09315946, 1, 0, 0.9647059, 1,
0.9770696, 0.07925754, 1.53158, 1, 0, 0.9607843, 1,
0.977644, 0.39466, 1.388764, 1, 0, 0.9529412, 1,
0.9877974, 1.479615, -0.4561015, 1, 0, 0.9490196, 1,
0.9898238, -1.265802, 3.474239, 1, 0, 0.9411765, 1,
0.9920225, 1.13472, 0.8726805, 1, 0, 0.9372549, 1,
0.9938526, -1.077564, 2.164468, 1, 0, 0.9294118, 1,
0.9996592, 0.5499367, 0.832068, 1, 0, 0.9254902, 1,
1.002185, -1.329356, 3.902033, 1, 0, 0.9176471, 1,
1.003051, 0.4343933, 0.4638635, 1, 0, 0.9137255, 1,
1.015364, -0.2721802, 2.518922, 1, 0, 0.9058824, 1,
1.02124, -0.9675801, 0.2412232, 1, 0, 0.9019608, 1,
1.035707, 0.8463901, 2.468314, 1, 0, 0.8941177, 1,
1.041846, 0.002283467, 3.180577, 1, 0, 0.8862745, 1,
1.042647, 0.8915882, 1.598674, 1, 0, 0.8823529, 1,
1.044473, 1.333598, 1.495728, 1, 0, 0.8745098, 1,
1.04992, -1.02801, 1.988051, 1, 0, 0.8705882, 1,
1.050607, 1.055481, 0.1862443, 1, 0, 0.8627451, 1,
1.053381, -0.7322928, 1.72492, 1, 0, 0.8588235, 1,
1.053855, 1.220917, 0.5383561, 1, 0, 0.8509804, 1,
1.063851, 0.4976642, 1.006423, 1, 0, 0.8470588, 1,
1.064981, 1.17187, 0.4863673, 1, 0, 0.8392157, 1,
1.070182, -0.5893441, 2.895299, 1, 0, 0.8352941, 1,
1.077405, -0.9181468, 2.854808, 1, 0, 0.827451, 1,
1.085211, 0.05272117, 1.81712, 1, 0, 0.8235294, 1,
1.086331, -1.166993, 5.065897, 1, 0, 0.8156863, 1,
1.10455, 0.5184443, 0.993564, 1, 0, 0.8117647, 1,
1.104579, -1.44055, 1.427652, 1, 0, 0.8039216, 1,
1.134755, 0.05839463, 0.03422092, 1, 0, 0.7960784, 1,
1.135698, 0.2303513, 0.3819013, 1, 0, 0.7921569, 1,
1.136147, -0.7831442, 1.483784, 1, 0, 0.7843137, 1,
1.140049, 0.8621901, -0.4533629, 1, 0, 0.7803922, 1,
1.155979, 1.715278, 0.5649258, 1, 0, 0.772549, 1,
1.159526, -3.002384, 3.052417, 1, 0, 0.7686275, 1,
1.164244, -0.9389279, 1.555867, 1, 0, 0.7607843, 1,
1.165766, 0.6975843, -0.3463438, 1, 0, 0.7568628, 1,
1.171898, -0.8362862, 2.516028, 1, 0, 0.7490196, 1,
1.173496, 0.2087097, 0.4878829, 1, 0, 0.7450981, 1,
1.178902, -0.5879378, 1.610121, 1, 0, 0.7372549, 1,
1.180695, -1.183163, 2.311721, 1, 0, 0.7333333, 1,
1.18227, -0.5353115, 3.392225, 1, 0, 0.7254902, 1,
1.185724, -1.219299, 5.520391, 1, 0, 0.7215686, 1,
1.187775, 1.397029, 0.7693087, 1, 0, 0.7137255, 1,
1.193336, 0.8091939, 0.1260389, 1, 0, 0.7098039, 1,
1.195856, -1.790708, 0.938304, 1, 0, 0.7019608, 1,
1.198921, 0.3459799, 0.9277353, 1, 0, 0.6941177, 1,
1.199418, 1.297225, 0.5071033, 1, 0, 0.6901961, 1,
1.199562, 0.9349136, 0.3012842, 1, 0, 0.682353, 1,
1.203053, -1.18955, 2.90995, 1, 0, 0.6784314, 1,
1.207994, -0.3569123, 0.8319698, 1, 0, 0.6705883, 1,
1.211797, 0.8827444, 1.381306, 1, 0, 0.6666667, 1,
1.217666, -0.6010843, 1.382289, 1, 0, 0.6588235, 1,
1.223572, 0.5244561, 2.915172, 1, 0, 0.654902, 1,
1.234753, 1.604676, 1.546241, 1, 0, 0.6470588, 1,
1.248611, 1.982598, 1.475669, 1, 0, 0.6431373, 1,
1.249055, -0.9605601, 2.357641, 1, 0, 0.6352941, 1,
1.264623, 0.9040257, 2.074396, 1, 0, 0.6313726, 1,
1.267764, 0.2619636, 0.1944251, 1, 0, 0.6235294, 1,
1.268407, 0.7081912, 1.15444, 1, 0, 0.6196079, 1,
1.274957, -0.1615115, 1.338767, 1, 0, 0.6117647, 1,
1.292016, -0.3555018, 3.960093, 1, 0, 0.6078432, 1,
1.29935, -0.6137903, 1.016916, 1, 0, 0.6, 1,
1.30006, -0.6244693, 1.975217, 1, 0, 0.5921569, 1,
1.302652, 0.2650519, -0.00291688, 1, 0, 0.5882353, 1,
1.313976, 0.722288, -0.5051136, 1, 0, 0.5803922, 1,
1.31738, 0.6726814, 0.7887179, 1, 0, 0.5764706, 1,
1.327517, -0.3410456, 2.019772, 1, 0, 0.5686275, 1,
1.342528, -0.3578321, 2.570203, 1, 0, 0.5647059, 1,
1.348891, 0.7017773, 1.630243, 1, 0, 0.5568628, 1,
1.349021, 1.474159, 2.6026, 1, 0, 0.5529412, 1,
1.356545, -0.02705881, 0.7018933, 1, 0, 0.5450981, 1,
1.357241, -1.822781, 2.182546, 1, 0, 0.5411765, 1,
1.369241, -0.9679877, 1.836574, 1, 0, 0.5333334, 1,
1.373942, -0.4588179, 3.647291, 1, 0, 0.5294118, 1,
1.384149, -1.72361, 1.386101, 1, 0, 0.5215687, 1,
1.384812, 0.4911957, -0.1834133, 1, 0, 0.5176471, 1,
1.385559, -0.8225943, 1.07497, 1, 0, 0.509804, 1,
1.388796, 1.353932, 1.12448, 1, 0, 0.5058824, 1,
1.389391, -0.6001345, 3.171424, 1, 0, 0.4980392, 1,
1.396947, 0.2022277, 1.928337, 1, 0, 0.4901961, 1,
1.403925, -1.074214, 3.642379, 1, 0, 0.4862745, 1,
1.406911, 0.3173253, 0.4474683, 1, 0, 0.4784314, 1,
1.40837, 0.2021001, 2.984838, 1, 0, 0.4745098, 1,
1.414163, -0.008411556, 1.377294, 1, 0, 0.4666667, 1,
1.414754, -0.4145352, 0.4108978, 1, 0, 0.4627451, 1,
1.414778, -0.8404103, 1.012913, 1, 0, 0.454902, 1,
1.416119, -0.2690788, 2.281313, 1, 0, 0.4509804, 1,
1.416866, 0.7192462, 0.8094765, 1, 0, 0.4431373, 1,
1.433043, 2.582987, 0.9878621, 1, 0, 0.4392157, 1,
1.463352, 0.4767368, 1.990403, 1, 0, 0.4313726, 1,
1.46831, 0.4636751, 1.256258, 1, 0, 0.427451, 1,
1.471443, 0.1499406, 0.4475706, 1, 0, 0.4196078, 1,
1.471758, 0.9053926, 1.984472, 1, 0, 0.4156863, 1,
1.473112, -1.788773, -0.2638622, 1, 0, 0.4078431, 1,
1.473933, 0.01567167, 2.046545, 1, 0, 0.4039216, 1,
1.474033, -0.4440406, 2.505766, 1, 0, 0.3960784, 1,
1.488154, -0.5802475, 2.003795, 1, 0, 0.3882353, 1,
1.51248, 1.402305, -0.3961528, 1, 0, 0.3843137, 1,
1.512727, -0.03746436, 2.505695, 1, 0, 0.3764706, 1,
1.518568, 1.169847, 1.046518, 1, 0, 0.372549, 1,
1.532246, -0.8250077, 3.393614, 1, 0, 0.3647059, 1,
1.553958, 0.3668179, 0.2987372, 1, 0, 0.3607843, 1,
1.555604, 0.204809, 1.683846, 1, 0, 0.3529412, 1,
1.557974, 0.3538005, 1.989137, 1, 0, 0.3490196, 1,
1.562959, -0.6173175, 2.128642, 1, 0, 0.3411765, 1,
1.571709, 0.5411001, -0.02992792, 1, 0, 0.3372549, 1,
1.571924, -0.1300758, 2.436143, 1, 0, 0.3294118, 1,
1.58147, 0.7502214, 1.527104, 1, 0, 0.3254902, 1,
1.581884, -0.3390129, 1.090228, 1, 0, 0.3176471, 1,
1.583688, 1.451823, -0.04165455, 1, 0, 0.3137255, 1,
1.591361, -0.1046043, 1.646075, 1, 0, 0.3058824, 1,
1.592237, -1.28688, 3.6561, 1, 0, 0.2980392, 1,
1.612561, 0.08026157, 1.572563, 1, 0, 0.2941177, 1,
1.617449, -1.065135, 1.125082, 1, 0, 0.2862745, 1,
1.622328, -0.4014488, 3.341744, 1, 0, 0.282353, 1,
1.622703, 1.326536, 0.5221086, 1, 0, 0.2745098, 1,
1.626303, 1.424693, 0.6206581, 1, 0, 0.2705882, 1,
1.628326, -0.289668, 2.891189, 1, 0, 0.2627451, 1,
1.654815, 0.7995828, 1.387547, 1, 0, 0.2588235, 1,
1.66055, 0.6139852, 1.188255, 1, 0, 0.2509804, 1,
1.669755, 1.416972, 0.6102532, 1, 0, 0.2470588, 1,
1.691672, 0.3831626, 0.1867803, 1, 0, 0.2392157, 1,
1.698812, 0.05371231, 1.500841, 1, 0, 0.2352941, 1,
1.702171, -1.557977, 3.082302, 1, 0, 0.227451, 1,
1.712047, -0.8773499, 3.404009, 1, 0, 0.2235294, 1,
1.713194, -0.8438277, 1.593808, 1, 0, 0.2156863, 1,
1.713819, -0.1181667, 3.698343, 1, 0, 0.2117647, 1,
1.722108, 0.6783639, 0.2326754, 1, 0, 0.2039216, 1,
1.724915, 0.1416076, 2.653674, 1, 0, 0.1960784, 1,
1.724925, 0.08017723, 1.328761, 1, 0, 0.1921569, 1,
1.759887, -0.8285303, 1.915759, 1, 0, 0.1843137, 1,
1.760245, -1.129718, 1.597711, 1, 0, 0.1803922, 1,
1.801647, -0.3670858, 3.400859, 1, 0, 0.172549, 1,
1.814747, -0.9259094, 2.035558, 1, 0, 0.1686275, 1,
1.833603, 0.2693742, 0.1012905, 1, 0, 0.1607843, 1,
1.848707, 0.4272527, 0.9685708, 1, 0, 0.1568628, 1,
1.861029, -0.1819696, 1.470248, 1, 0, 0.1490196, 1,
1.866161, 1.004078, 1.11132, 1, 0, 0.145098, 1,
1.90638, 1.152452, 0.4509404, 1, 0, 0.1372549, 1,
1.931726, 1.389902, 2.098469, 1, 0, 0.1333333, 1,
1.936434, 1.203643, 1.0637, 1, 0, 0.1254902, 1,
1.961211, 1.051033, 0.03249498, 1, 0, 0.1215686, 1,
1.971132, 1.878173, -0.2742465, 1, 0, 0.1137255, 1,
1.994785, 0.1932416, 2.727323, 1, 0, 0.1098039, 1,
2.01255, 0.0798857, 2.210679, 1, 0, 0.1019608, 1,
2.073078, 0.1128052, 1.969174, 1, 0, 0.09411765, 1,
2.084274, 1.499901, -1.658596, 1, 0, 0.09019608, 1,
2.123574, -1.243058, 2.162314, 1, 0, 0.08235294, 1,
2.169731, -0.5985705, 0.9668242, 1, 0, 0.07843138, 1,
2.17919, -0.02246114, 1.08426, 1, 0, 0.07058824, 1,
2.182216, 0.1923992, 0.9606382, 1, 0, 0.06666667, 1,
2.259622, -0.2998674, 2.960793, 1, 0, 0.05882353, 1,
2.272188, -0.5096118, 0.7076626, 1, 0, 0.05490196, 1,
2.324958, -0.6214595, 1.728898, 1, 0, 0.04705882, 1,
2.352626, 1.055017, 1.147271, 1, 0, 0.04313726, 1,
2.402328, -1.041041, 2.537347, 1, 0, 0.03529412, 1,
2.408381, -0.7892293, 2.110412, 1, 0, 0.03137255, 1,
2.471309, 0.7245185, 3.051157, 1, 0, 0.02352941, 1,
2.531012, -0.1068487, 1.393917, 1, 0, 0.01960784, 1,
2.909471, -0.2568422, 2.086629, 1, 0, 0.01176471, 1,
2.933995, -0.4688928, 1.839397, 1, 0, 0.007843138, 1
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
-0.0454123, -4.156273, -7.117014, 0, -0.5, 0.5, 0.5,
-0.0454123, -4.156273, -7.117014, 1, -0.5, 0.5, 0.5,
-0.0454123, -4.156273, -7.117014, 1, 1.5, 0.5, 0.5,
-0.0454123, -4.156273, -7.117014, 0, 1.5, 0.5, 0.5
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
-4.034838, 0.1291112, -7.117014, 0, -0.5, 0.5, 0.5,
-4.034838, 0.1291112, -7.117014, 1, -0.5, 0.5, 0.5,
-4.034838, 0.1291112, -7.117014, 1, 1.5, 0.5, 0.5,
-4.034838, 0.1291112, -7.117014, 0, 1.5, 0.5, 0.5
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
-4.034838, -4.156273, 0.3415246, 0, -0.5, 0.5, 0.5,
-4.034838, -4.156273, 0.3415246, 1, -0.5, 0.5, 0.5,
-4.034838, -4.156273, 0.3415246, 1, 1.5, 0.5, 0.5,
-4.034838, -4.156273, 0.3415246, 0, 1.5, 0.5, 0.5
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
-3, -3.167339, -5.395813,
2, -3.167339, -5.395813,
-3, -3.167339, -5.395813,
-3, -3.332161, -5.68268,
-2, -3.167339, -5.395813,
-2, -3.332161, -5.68268,
-1, -3.167339, -5.395813,
-1, -3.332161, -5.68268,
0, -3.167339, -5.395813,
0, -3.332161, -5.68268,
1, -3.167339, -5.395813,
1, -3.332161, -5.68268,
2, -3.167339, -5.395813,
2, -3.332161, -5.68268
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
-3, -3.661806, -6.256413, 0, -0.5, 0.5, 0.5,
-3, -3.661806, -6.256413, 1, -0.5, 0.5, 0.5,
-3, -3.661806, -6.256413, 1, 1.5, 0.5, 0.5,
-3, -3.661806, -6.256413, 0, 1.5, 0.5, 0.5,
-2, -3.661806, -6.256413, 0, -0.5, 0.5, 0.5,
-2, -3.661806, -6.256413, 1, -0.5, 0.5, 0.5,
-2, -3.661806, -6.256413, 1, 1.5, 0.5, 0.5,
-2, -3.661806, -6.256413, 0, 1.5, 0.5, 0.5,
-1, -3.661806, -6.256413, 0, -0.5, 0.5, 0.5,
-1, -3.661806, -6.256413, 1, -0.5, 0.5, 0.5,
-1, -3.661806, -6.256413, 1, 1.5, 0.5, 0.5,
-1, -3.661806, -6.256413, 0, 1.5, 0.5, 0.5,
0, -3.661806, -6.256413, 0, -0.5, 0.5, 0.5,
0, -3.661806, -6.256413, 1, -0.5, 0.5, 0.5,
0, -3.661806, -6.256413, 1, 1.5, 0.5, 0.5,
0, -3.661806, -6.256413, 0, 1.5, 0.5, 0.5,
1, -3.661806, -6.256413, 0, -0.5, 0.5, 0.5,
1, -3.661806, -6.256413, 1, -0.5, 0.5, 0.5,
1, -3.661806, -6.256413, 1, 1.5, 0.5, 0.5,
1, -3.661806, -6.256413, 0, 1.5, 0.5, 0.5,
2, -3.661806, -6.256413, 0, -0.5, 0.5, 0.5,
2, -3.661806, -6.256413, 1, -0.5, 0.5, 0.5,
2, -3.661806, -6.256413, 1, 1.5, 0.5, 0.5,
2, -3.661806, -6.256413, 0, 1.5, 0.5, 0.5
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
-3.114201, -3, -5.395813,
-3.114201, 3, -5.395813,
-3.114201, -3, -5.395813,
-3.267641, -3, -5.68268,
-3.114201, -2, -5.395813,
-3.267641, -2, -5.68268,
-3.114201, -1, -5.395813,
-3.267641, -1, -5.68268,
-3.114201, 0, -5.395813,
-3.267641, 0, -5.68268,
-3.114201, 1, -5.395813,
-3.267641, 1, -5.68268,
-3.114201, 2, -5.395813,
-3.267641, 2, -5.68268,
-3.114201, 3, -5.395813,
-3.267641, 3, -5.68268
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
-3.57452, -3, -6.256413, 0, -0.5, 0.5, 0.5,
-3.57452, -3, -6.256413, 1, -0.5, 0.5, 0.5,
-3.57452, -3, -6.256413, 1, 1.5, 0.5, 0.5,
-3.57452, -3, -6.256413, 0, 1.5, 0.5, 0.5,
-3.57452, -2, -6.256413, 0, -0.5, 0.5, 0.5,
-3.57452, -2, -6.256413, 1, -0.5, 0.5, 0.5,
-3.57452, -2, -6.256413, 1, 1.5, 0.5, 0.5,
-3.57452, -2, -6.256413, 0, 1.5, 0.5, 0.5,
-3.57452, -1, -6.256413, 0, -0.5, 0.5, 0.5,
-3.57452, -1, -6.256413, 1, -0.5, 0.5, 0.5,
-3.57452, -1, -6.256413, 1, 1.5, 0.5, 0.5,
-3.57452, -1, -6.256413, 0, 1.5, 0.5, 0.5,
-3.57452, 0, -6.256413, 0, -0.5, 0.5, 0.5,
-3.57452, 0, -6.256413, 1, -0.5, 0.5, 0.5,
-3.57452, 0, -6.256413, 1, 1.5, 0.5, 0.5,
-3.57452, 0, -6.256413, 0, 1.5, 0.5, 0.5,
-3.57452, 1, -6.256413, 0, -0.5, 0.5, 0.5,
-3.57452, 1, -6.256413, 1, -0.5, 0.5, 0.5,
-3.57452, 1, -6.256413, 1, 1.5, 0.5, 0.5,
-3.57452, 1, -6.256413, 0, 1.5, 0.5, 0.5,
-3.57452, 2, -6.256413, 0, -0.5, 0.5, 0.5,
-3.57452, 2, -6.256413, 1, -0.5, 0.5, 0.5,
-3.57452, 2, -6.256413, 1, 1.5, 0.5, 0.5,
-3.57452, 2, -6.256413, 0, 1.5, 0.5, 0.5,
-3.57452, 3, -6.256413, 0, -0.5, 0.5, 0.5,
-3.57452, 3, -6.256413, 1, -0.5, 0.5, 0.5,
-3.57452, 3, -6.256413, 1, 1.5, 0.5, 0.5,
-3.57452, 3, -6.256413, 0, 1.5, 0.5, 0.5
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
-3.114201, -3.167339, -4,
-3.114201, -3.167339, 4,
-3.114201, -3.167339, -4,
-3.267641, -3.332161, -4,
-3.114201, -3.167339, -2,
-3.267641, -3.332161, -2,
-3.114201, -3.167339, 0,
-3.267641, -3.332161, 0,
-3.114201, -3.167339, 2,
-3.267641, -3.332161, 2,
-3.114201, -3.167339, 4,
-3.267641, -3.332161, 4
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
-3.57452, -3.661806, -4, 0, -0.5, 0.5, 0.5,
-3.57452, -3.661806, -4, 1, -0.5, 0.5, 0.5,
-3.57452, -3.661806, -4, 1, 1.5, 0.5, 0.5,
-3.57452, -3.661806, -4, 0, 1.5, 0.5, 0.5,
-3.57452, -3.661806, -2, 0, -0.5, 0.5, 0.5,
-3.57452, -3.661806, -2, 1, -0.5, 0.5, 0.5,
-3.57452, -3.661806, -2, 1, 1.5, 0.5, 0.5,
-3.57452, -3.661806, -2, 0, 1.5, 0.5, 0.5,
-3.57452, -3.661806, 0, 0, -0.5, 0.5, 0.5,
-3.57452, -3.661806, 0, 1, -0.5, 0.5, 0.5,
-3.57452, -3.661806, 0, 1, 1.5, 0.5, 0.5,
-3.57452, -3.661806, 0, 0, 1.5, 0.5, 0.5,
-3.57452, -3.661806, 2, 0, -0.5, 0.5, 0.5,
-3.57452, -3.661806, 2, 1, -0.5, 0.5, 0.5,
-3.57452, -3.661806, 2, 1, 1.5, 0.5, 0.5,
-3.57452, -3.661806, 2, 0, 1.5, 0.5, 0.5,
-3.57452, -3.661806, 4, 0, -0.5, 0.5, 0.5,
-3.57452, -3.661806, 4, 1, -0.5, 0.5, 0.5,
-3.57452, -3.661806, 4, 1, 1.5, 0.5, 0.5,
-3.57452, -3.661806, 4, 0, 1.5, 0.5, 0.5
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
-3.114201, -3.167339, -5.395813,
-3.114201, 3.425561, -5.395813,
-3.114201, -3.167339, 6.078862,
-3.114201, 3.425561, 6.078862,
-3.114201, -3.167339, -5.395813,
-3.114201, -3.167339, 6.078862,
-3.114201, 3.425561, -5.395813,
-3.114201, 3.425561, 6.078862,
-3.114201, -3.167339, -5.395813,
3.023377, -3.167339, -5.395813,
-3.114201, -3.167339, 6.078862,
3.023377, -3.167339, 6.078862,
-3.114201, 3.425561, -5.395813,
3.023377, 3.425561, -5.395813,
-3.114201, 3.425561, 6.078862,
3.023377, 3.425561, 6.078862,
3.023377, -3.167339, -5.395813,
3.023377, 3.425561, -5.395813,
3.023377, -3.167339, 6.078862,
3.023377, 3.425561, 6.078862,
3.023377, -3.167339, -5.395813,
3.023377, -3.167339, 6.078862,
3.023377, 3.425561, -5.395813,
3.023377, 3.425561, 6.078862
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
var radius = 7.78961;
var distance = 34.65686;
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
mvMatrix.translate( 0.0454123, -0.1291112, -0.3415246 );
mvMatrix.scale( 1.372248, 1.277477, 0.7339885 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.65686);
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
mepanipyrim<-read.table("mepanipyrim.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-mepanipyrim$V2
```

```
## Error in eval(expr, envir, enclos): object 'mepanipyrim' not found
```

```r
y<-mepanipyrim$V3
```

```
## Error in eval(expr, envir, enclos): object 'mepanipyrim' not found
```

```r
z<-mepanipyrim$V4
```

```
## Error in eval(expr, envir, enclos): object 'mepanipyrim' not found
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
-3.024819, 0.6349937, 0.2904676, 0, 0, 1, 1, 1,
-2.993756, 1.193506, -3.052853, 1, 0, 0, 1, 1,
-2.954728, 0.5809317, -2.236984, 1, 0, 0, 1, 1,
-2.742653, 0.2668788, -2.044137, 1, 0, 0, 1, 1,
-2.49505, -0.07136257, -0.7187895, 1, 0, 0, 1, 1,
-2.444149, -0.7556359, -3.643388, 1, 0, 0, 1, 1,
-2.413584, 1.045637, -0.9516776, 0, 0, 0, 1, 1,
-2.40127, -0.005123468, 0.2335736, 0, 0, 0, 1, 1,
-2.368516, -0.331325, -0.9386635, 0, 0, 0, 1, 1,
-2.363564, -1.001224, -3.761626, 0, 0, 0, 1, 1,
-2.311876, 0.1217663, -1.201386, 0, 0, 0, 1, 1,
-2.248644, 0.2449571, -1.542436, 0, 0, 0, 1, 1,
-2.225995, 0.5176941, -0.3474738, 0, 0, 0, 1, 1,
-2.225682, 0.08371052, -2.128553, 1, 1, 1, 1, 1,
-2.218295, 1.444504, -1.408524, 1, 1, 1, 1, 1,
-2.202659, 0.8205917, -0.6147531, 1, 1, 1, 1, 1,
-2.189574, -0.5213464, -1.982588, 1, 1, 1, 1, 1,
-2.188727, 1.005359, 0.385195, 1, 1, 1, 1, 1,
-2.155111, -0.3148737, -1.905129, 1, 1, 1, 1, 1,
-2.146052, -1.657684, -1.646947, 1, 1, 1, 1, 1,
-2.121339, 0.6682215, -3.35779, 1, 1, 1, 1, 1,
-2.117778, 0.6162211, -2.2978, 1, 1, 1, 1, 1,
-2.102281, -0.6950597, -2.092156, 1, 1, 1, 1, 1,
-2.086386, -0.2546479, -1.550668, 1, 1, 1, 1, 1,
-2.050753, -2.225172, -1.339803, 1, 1, 1, 1, 1,
-2.02411, -0.05515596, -1.184524, 1, 1, 1, 1, 1,
-2.011111, -0.3049374, -0.843035, 1, 1, 1, 1, 1,
-1.987365, -0.3687296, -1.875215, 1, 1, 1, 1, 1,
-1.987201, -0.4583883, -1.978483, 0, 0, 1, 1, 1,
-1.951593, -0.9666921, -2.289957, 1, 0, 0, 1, 1,
-1.934512, 0.763407, -0.08798024, 1, 0, 0, 1, 1,
-1.928697, -0.5264121, -2.002939, 1, 0, 0, 1, 1,
-1.926225, -0.3560075, -2.118932, 1, 0, 0, 1, 1,
-1.910986, 0.6035953, -1.716734, 1, 0, 0, 1, 1,
-1.906511, -0.2551887, -1.522104, 0, 0, 0, 1, 1,
-1.895533, 0.5016025, -1.550179, 0, 0, 0, 1, 1,
-1.878707, -2.323946, -2.470244, 0, 0, 0, 1, 1,
-1.86598, -0.1788552, -3.873308, 0, 0, 0, 1, 1,
-1.847884, -0.07438377, -0.9061446, 0, 0, 0, 1, 1,
-1.816635, -0.05494933, -4.097019, 0, 0, 0, 1, 1,
-1.81492, 1.549566, 0.8773729, 0, 0, 0, 1, 1,
-1.814611, -0.5164986, -2.806728, 1, 1, 1, 1, 1,
-1.809474, 0.9791692, -3.516331, 1, 1, 1, 1, 1,
-1.799678, 0.0418459, -1.592821, 1, 1, 1, 1, 1,
-1.785877, 0.7724143, -0.9963732, 1, 1, 1, 1, 1,
-1.783904, -2.262271, -2.632983, 1, 1, 1, 1, 1,
-1.779284, -1.513239, -0.6409327, 1, 1, 1, 1, 1,
-1.738087, -0.04285395, -3.347935, 1, 1, 1, 1, 1,
-1.711175, -0.5245684, -3.205727, 1, 1, 1, 1, 1,
-1.678152, -2.46088, -3.223473, 1, 1, 1, 1, 1,
-1.6707, -0.03886532, -1.967049, 1, 1, 1, 1, 1,
-1.668904, 0.4813914, -0.01096433, 1, 1, 1, 1, 1,
-1.668858, -2.418081, -2.717702, 1, 1, 1, 1, 1,
-1.663177, -0.8205065, -1.838352, 1, 1, 1, 1, 1,
-1.645256, -0.3529451, -2.604704, 1, 1, 1, 1, 1,
-1.627713, 0.24549, -1.566798, 1, 1, 1, 1, 1,
-1.625148, 0.02167429, -0.2219585, 0, 0, 1, 1, 1,
-1.605836, 1.12198, -1.032444, 1, 0, 0, 1, 1,
-1.596214, -0.5590746, -2.377913, 1, 0, 0, 1, 1,
-1.587789, -1.722408, -1.555318, 1, 0, 0, 1, 1,
-1.580248, -0.1609577, -0.6779137, 1, 0, 0, 1, 1,
-1.579947, 1.49346, -1.430835, 1, 0, 0, 1, 1,
-1.575552, 0.2449864, -1.301008, 0, 0, 0, 1, 1,
-1.568435, -1.285926, -2.666257, 0, 0, 0, 1, 1,
-1.55027, -0.6241369, -2.048749, 0, 0, 0, 1, 1,
-1.544974, 0.5179647, -2.890234, 0, 0, 0, 1, 1,
-1.54217, 0.6142078, 0.417996, 0, 0, 0, 1, 1,
-1.532813, -0.6657565, -1.470073, 0, 0, 0, 1, 1,
-1.527837, 0.3309052, -1.294166, 0, 0, 0, 1, 1,
-1.517995, -1.139632, -3.322871, 1, 1, 1, 1, 1,
-1.491617, 0.1809879, -1.949256, 1, 1, 1, 1, 1,
-1.488177, -0.980951, -1.33905, 1, 1, 1, 1, 1,
-1.483455, 0.1685847, -3.028886, 1, 1, 1, 1, 1,
-1.475917, -1.365007, -1.022539, 1, 1, 1, 1, 1,
-1.47353, 0.8670629, -1.537081, 1, 1, 1, 1, 1,
-1.466293, -0.8673528, -2.028008, 1, 1, 1, 1, 1,
-1.461943, -1.671582, -1.615646, 1, 1, 1, 1, 1,
-1.454663, 1.194951, -1.094929, 1, 1, 1, 1, 1,
-1.452802, -0.4305511, -0.9849417, 1, 1, 1, 1, 1,
-1.443019, 0.4671246, -1.051374, 1, 1, 1, 1, 1,
-1.441794, 0.8989745, -2.041682, 1, 1, 1, 1, 1,
-1.43721, -1.346566, -1.574981, 1, 1, 1, 1, 1,
-1.436996, 0.6435597, -1.349861, 1, 1, 1, 1, 1,
-1.424816, -1.411702, -2.598155, 1, 1, 1, 1, 1,
-1.421999, -1.316516, -1.745654, 0, 0, 1, 1, 1,
-1.417265, -1.439738, -3.036046, 1, 0, 0, 1, 1,
-1.413721, 0.8763412, -2.094122, 1, 0, 0, 1, 1,
-1.409084, -0.4385953, -2.406315, 1, 0, 0, 1, 1,
-1.400944, 0.4347032, -1.015623, 1, 0, 0, 1, 1,
-1.39026, 0.5235726, -1.299128, 1, 0, 0, 1, 1,
-1.38209, 1.026788, -1.916908, 0, 0, 0, 1, 1,
-1.3567, 0.188026, -1.182382, 0, 0, 0, 1, 1,
-1.347398, -0.0954361, -1.311095, 0, 0, 0, 1, 1,
-1.341798, 2.119442, 1.071053, 0, 0, 0, 1, 1,
-1.333476, -0.9739673, -1.094549, 0, 0, 0, 1, 1,
-1.331148, -0.3607286, -0.7564278, 0, 0, 0, 1, 1,
-1.317322, -0.3873171, -3.408355, 0, 0, 0, 1, 1,
-1.294101, -1.130908, -3.088763, 1, 1, 1, 1, 1,
-1.290671, 1.0928, 0.1911196, 1, 1, 1, 1, 1,
-1.286982, 0.7125708, -0.8021312, 1, 1, 1, 1, 1,
-1.285088, -1.666419, -4.340297, 1, 1, 1, 1, 1,
-1.265793, 0.9476137, 0.7653127, 1, 1, 1, 1, 1,
-1.263827, 1.080047, -1.869849, 1, 1, 1, 1, 1,
-1.253893, 1.690336, -1.284737, 1, 1, 1, 1, 1,
-1.247969, 0.09290886, -1.638764, 1, 1, 1, 1, 1,
-1.247099, -0.1886266, -2.692877, 1, 1, 1, 1, 1,
-1.242384, 1.984737, -2.841295, 1, 1, 1, 1, 1,
-1.230775, -0.05914968, -0.7268423, 1, 1, 1, 1, 1,
-1.222468, -0.8917486, -1.868405, 1, 1, 1, 1, 1,
-1.211442, 0.9073063, -0.4922136, 1, 1, 1, 1, 1,
-1.208564, 0.6719506, -1.59394, 1, 1, 1, 1, 1,
-1.207019, 0.3331198, -1.453149, 1, 1, 1, 1, 1,
-1.20686, 0.4357893, -1.187375, 0, 0, 1, 1, 1,
-1.204335, 0.113617, -0.0305794, 1, 0, 0, 1, 1,
-1.187162, -0.04005564, -1.43004, 1, 0, 0, 1, 1,
-1.184305, -0.6639679, 0.548022, 1, 0, 0, 1, 1,
-1.18249, 0.1365573, -1.277848, 1, 0, 0, 1, 1,
-1.179637, -0.7849114, -1.317722, 1, 0, 0, 1, 1,
-1.177868, 0.7853075, -1.118111, 0, 0, 0, 1, 1,
-1.177388, 1.311609, 1.04506, 0, 0, 0, 1, 1,
-1.177312, 1.734276, 0.554056, 0, 0, 0, 1, 1,
-1.17512, 0.9337989, -0.07119394, 0, 0, 0, 1, 1,
-1.174072, 0.07177789, -0.9133752, 0, 0, 0, 1, 1,
-1.173972, 1.106672, 1.750003, 0, 0, 0, 1, 1,
-1.170038, 1.860031, 0.5304657, 0, 0, 0, 1, 1,
-1.163046, 0.3869686, -0.3092808, 1, 1, 1, 1, 1,
-1.157495, 0.6902865, -1.140451, 1, 1, 1, 1, 1,
-1.156405, -0.05505284, -1.483648, 1, 1, 1, 1, 1,
-1.152462, -0.615007, -2.77471, 1, 1, 1, 1, 1,
-1.151028, -0.4280524, -3.002293, 1, 1, 1, 1, 1,
-1.135911, 0.4915422, -1.657363, 1, 1, 1, 1, 1,
-1.132274, -0.385618, -1.565149, 1, 1, 1, 1, 1,
-1.127275, -0.6862537, -3.212024, 1, 1, 1, 1, 1,
-1.119119, 0.5348408, -0.5077589, 1, 1, 1, 1, 1,
-1.114388, 2.369624, -0.2643188, 1, 1, 1, 1, 1,
-1.112735, 0.1357732, -0.9494113, 1, 1, 1, 1, 1,
-1.11211, -0.5214466, -2.43362, 1, 1, 1, 1, 1,
-1.11088, 1.24169, -0.883212, 1, 1, 1, 1, 1,
-1.109867, -2.28353, -1.58124, 1, 1, 1, 1, 1,
-1.104595, 2.063956, -1.176819, 1, 1, 1, 1, 1,
-1.10339, 0.7138284, -1.36007, 0, 0, 1, 1, 1,
-1.098386, -0.1985802, -1.057044, 1, 0, 0, 1, 1,
-1.084903, 1.714904, -0.3814686, 1, 0, 0, 1, 1,
-1.082921, 0.7478412, 0.6204264, 1, 0, 0, 1, 1,
-1.072593, 0.7495207, -0.2099517, 1, 0, 0, 1, 1,
-1.070417, -0.2928584, -1.862627, 1, 0, 0, 1, 1,
-1.066923, 0.8471229, 0.0698633, 0, 0, 0, 1, 1,
-1.064961, 0.7885813, -0.8171001, 0, 0, 0, 1, 1,
-1.056677, 0.1127705, -2.496706, 0, 0, 0, 1, 1,
-1.042195, 1.482591, -1.026142, 0, 0, 0, 1, 1,
-1.034385, -0.8044423, -3.189528, 0, 0, 0, 1, 1,
-1.032815, -1.195788, -3.973273, 0, 0, 0, 1, 1,
-1.030715, -1.184411, -1.846205, 0, 0, 0, 1, 1,
-1.026487, 0.07082944, -1.577773, 1, 1, 1, 1, 1,
-1.026079, -0.427598, -1.557894, 1, 1, 1, 1, 1,
-1.025646, 0.7769139, 1.465017, 1, 1, 1, 1, 1,
-1.019807, -1.901526, -3.597474, 1, 1, 1, 1, 1,
-1.017547, 1.362417, -0.6373795, 1, 1, 1, 1, 1,
-1.013343, 0.7028163, -0.6453722, 1, 1, 1, 1, 1,
-1.01118, 0.7151956, -0.7223511, 1, 1, 1, 1, 1,
-1.010437, 0.9150695, -0.9353647, 1, 1, 1, 1, 1,
-1.009134, 0.1833443, -0.4917284, 1, 1, 1, 1, 1,
-0.9996625, -0.2830431, -0.1944942, 1, 1, 1, 1, 1,
-0.9987007, -1.348313, -1.59785, 1, 1, 1, 1, 1,
-0.9905654, 3.053047, -0.02655171, 1, 1, 1, 1, 1,
-0.9905279, 0.8965642, 0.7539858, 1, 1, 1, 1, 1,
-0.9883716, 0.09255749, -1.919954, 1, 1, 1, 1, 1,
-0.9842566, 0.2858073, -1.660017, 1, 1, 1, 1, 1,
-0.980094, 0.6308781, -0.6577414, 0, 0, 1, 1, 1,
-0.9734571, 0.469675, -1.328349, 1, 0, 0, 1, 1,
-0.9622989, -1.485756, -2.832977, 1, 0, 0, 1, 1,
-0.961101, 0.2632941, -2.709898, 1, 0, 0, 1, 1,
-0.957484, 0.7102284, -1.288843, 1, 0, 0, 1, 1,
-0.9561204, -0.8301587, 0.3340749, 1, 0, 0, 1, 1,
-0.947947, -0.669677, -0.9878348, 0, 0, 0, 1, 1,
-0.9442636, -1.86206, -2.906974, 0, 0, 0, 1, 1,
-0.9365277, -0.2091331, -1.601619, 0, 0, 0, 1, 1,
-0.9317665, -1.355919, -1.560705, 0, 0, 0, 1, 1,
-0.9307044, -0.6161145, -2.064344, 0, 0, 0, 1, 1,
-0.9302504, -1.450057, -1.79374, 0, 0, 0, 1, 1,
-0.9189891, -1.820397, -1.552987, 0, 0, 0, 1, 1,
-0.9176543, 0.6210033, 0.2016328, 1, 1, 1, 1, 1,
-0.9081515, 0.2091115, -2.20443, 1, 1, 1, 1, 1,
-0.9079038, -0.6661251, -2.693478, 1, 1, 1, 1, 1,
-0.9038899, 2.211047, 0.3346288, 1, 1, 1, 1, 1,
-0.892892, 1.059233, -2.652086, 1, 1, 1, 1, 1,
-0.8927566, 0.1597762, -0.5244967, 1, 1, 1, 1, 1,
-0.8885513, 0.05330556, -0.5937798, 1, 1, 1, 1, 1,
-0.8868837, 0.5465139, 0.6131278, 1, 1, 1, 1, 1,
-0.8772929, 1.120698, -0.2516201, 1, 1, 1, 1, 1,
-0.869867, -0.05303356, -2.820364, 1, 1, 1, 1, 1,
-0.8671227, -0.7353138, -0.5690422, 1, 1, 1, 1, 1,
-0.8625724, -0.2498325, -3.017585, 1, 1, 1, 1, 1,
-0.8533746, 0.5286394, -1.222437, 1, 1, 1, 1, 1,
-0.8503206, 0.2316545, -0.3278306, 1, 1, 1, 1, 1,
-0.8499674, -0.3821653, -0.5129836, 1, 1, 1, 1, 1,
-0.8495449, -0.3772793, -0.2640135, 0, 0, 1, 1, 1,
-0.8492753, 0.8805365, -1.303609, 1, 0, 0, 1, 1,
-0.847711, 1.715462, -0.06825154, 1, 0, 0, 1, 1,
-0.8467922, -1.658451, -2.550322, 1, 0, 0, 1, 1,
-0.8443075, 0.2503805, -0.3872595, 1, 0, 0, 1, 1,
-0.8420777, -0.1492193, -1.306155, 1, 0, 0, 1, 1,
-0.8340966, -0.485888, -1.770139, 0, 0, 0, 1, 1,
-0.8331082, -1.120338, -4.289777, 0, 0, 0, 1, 1,
-0.8309642, -0.3917448, -4.376102, 0, 0, 0, 1, 1,
-0.8308048, 1.166752, -1.268162, 0, 0, 0, 1, 1,
-0.8283672, 0.181545, -1.052541, 0, 0, 0, 1, 1,
-0.827047, -1.288681, -1.428453, 0, 0, 0, 1, 1,
-0.81801, -1.009507, -2.647249, 0, 0, 0, 1, 1,
-0.8147266, -0.2247952, 0.2513288, 1, 1, 1, 1, 1,
-0.8094407, -0.4273449, -1.212127, 1, 1, 1, 1, 1,
-0.8093374, 1.142663, -1.271581, 1, 1, 1, 1, 1,
-0.807328, -0.06985036, -2.657351, 1, 1, 1, 1, 1,
-0.7996356, 1.318763, -3.013258, 1, 1, 1, 1, 1,
-0.7970462, 2.137367, -0.1779447, 1, 1, 1, 1, 1,
-0.793729, -0.8129792, -1.010589, 1, 1, 1, 1, 1,
-0.7876702, -1.490258, -2.552699, 1, 1, 1, 1, 1,
-0.7841575, 0.5511003, 0.724978, 1, 1, 1, 1, 1,
-0.7810984, 0.05241745, 1.860937, 1, 1, 1, 1, 1,
-0.7758454, -1.460166, -3.733959, 1, 1, 1, 1, 1,
-0.7720761, -0.2476679, -1.6589, 1, 1, 1, 1, 1,
-0.7608413, 0.4923121, -1.370943, 1, 1, 1, 1, 1,
-0.7586195, 1.557061, -0.4124277, 1, 1, 1, 1, 1,
-0.7585526, 0.8318394, -2.036863, 1, 1, 1, 1, 1,
-0.7547634, 0.9693077, -2.565798, 0, 0, 1, 1, 1,
-0.753041, -0.9983161, -1.168753, 1, 0, 0, 1, 1,
-0.7501625, 1.986674, -0.9784014, 1, 0, 0, 1, 1,
-0.7481117, -0.4124143, -2.315972, 1, 0, 0, 1, 1,
-0.7469882, 0.5060293, 0.1961113, 1, 0, 0, 1, 1,
-0.7461614, 0.03058369, -1.401221, 1, 0, 0, 1, 1,
-0.7422121, 0.3976919, -1.34347, 0, 0, 0, 1, 1,
-0.7286766, -0.695049, -2.843904, 0, 0, 0, 1, 1,
-0.7181536, 0.2663544, -1.241986, 0, 0, 0, 1, 1,
-0.716803, 0.1478861, -1.722791, 0, 0, 0, 1, 1,
-0.7154068, 1.276577, -0.1381699, 0, 0, 0, 1, 1,
-0.7126101, -1.323791, -2.390985, 0, 0, 0, 1, 1,
-0.709636, 0.4867209, -1.221319, 0, 0, 0, 1, 1,
-0.7059408, -0.05049077, -3.227804, 1, 1, 1, 1, 1,
-0.7040482, -0.8766029, -2.142822, 1, 1, 1, 1, 1,
-0.7002509, 2.123018, -0.5221879, 1, 1, 1, 1, 1,
-0.6992429, -0.4652581, -1.851779, 1, 1, 1, 1, 1,
-0.6987941, -1.131007, -2.672, 1, 1, 1, 1, 1,
-0.6983002, 0.1143132, -0.5755385, 1, 1, 1, 1, 1,
-0.6963154, 1.961225, 0.238048, 1, 1, 1, 1, 1,
-0.6923793, -1.169574, -1.781666, 1, 1, 1, 1, 1,
-0.690466, 1.346402, -1.678094, 1, 1, 1, 1, 1,
-0.6901497, -0.2950144, -2.539272, 1, 1, 1, 1, 1,
-0.6896158, -0.7572439, -1.991158, 1, 1, 1, 1, 1,
-0.6888403, -1.214018, -2.667288, 1, 1, 1, 1, 1,
-0.6809976, -0.7615813, -2.636962, 1, 1, 1, 1, 1,
-0.6760354, -0.1323274, -2.901364, 1, 1, 1, 1, 1,
-0.6740245, 0.4000502, -2.695737, 1, 1, 1, 1, 1,
-0.6729816, -0.2748154, -2.126665, 0, 0, 1, 1, 1,
-0.6712942, -0.6042518, -2.485136, 1, 0, 0, 1, 1,
-0.6700375, 0.2671664, -1.521288, 1, 0, 0, 1, 1,
-0.6690556, -0.2637531, -1.378768, 1, 0, 0, 1, 1,
-0.6653146, 0.8304607, -0.8282658, 1, 0, 0, 1, 1,
-0.6595673, -0.572257, -2.817884, 1, 0, 0, 1, 1,
-0.6501781, 0.6044181, -0.7441424, 0, 0, 0, 1, 1,
-0.6470137, 0.8428007, 0.2463706, 0, 0, 0, 1, 1,
-0.6469636, -0.2380588, -1.223552, 0, 0, 0, 1, 1,
-0.6462792, -1.511083, -0.9985758, 0, 0, 0, 1, 1,
-0.6386684, -1.343744, -2.064343, 0, 0, 0, 1, 1,
-0.6371615, 1.042069, -1.141548, 0, 0, 0, 1, 1,
-0.6371599, -0.5757388, -1.572786, 0, 0, 0, 1, 1,
-0.6201139, -0.3848307, -3.117884, 1, 1, 1, 1, 1,
-0.6184677, 0.1462982, -2.000111, 1, 1, 1, 1, 1,
-0.6126723, 0.2620682, -1.687926, 1, 1, 1, 1, 1,
-0.6043783, 0.00240685, -2.894315, 1, 1, 1, 1, 1,
-0.598666, -1.333106, -2.74869, 1, 1, 1, 1, 1,
-0.5940966, 1.225144, -0.8198557, 1, 1, 1, 1, 1,
-0.5926132, -0.4314755, -1.85857, 1, 1, 1, 1, 1,
-0.5915748, 1.280441, 0.4919573, 1, 1, 1, 1, 1,
-0.5782564, 0.2598885, -1.558272, 1, 1, 1, 1, 1,
-0.5747334, 0.364286, 1.040848, 1, 1, 1, 1, 1,
-0.5693147, -1.486281, -2.482228, 1, 1, 1, 1, 1,
-0.562486, -0.8810536, -3.054901, 1, 1, 1, 1, 1,
-0.5606679, -0.1434809, -3.250738, 1, 1, 1, 1, 1,
-0.5588048, -0.1123726, -2.314757, 1, 1, 1, 1, 1,
-0.5574883, 0.07157951, -1.239336, 1, 1, 1, 1, 1,
-0.5547929, 1.332507, -1.158429, 0, 0, 1, 1, 1,
-0.5547076, -0.3669548, -1.298795, 1, 0, 0, 1, 1,
-0.5531653, -1.92875, -3.9681, 1, 0, 0, 1, 1,
-0.5527628, 1.35493, -1.366197, 1, 0, 0, 1, 1,
-0.5484741, 1.611763, -1.553805, 1, 0, 0, 1, 1,
-0.5478469, 0.9297736, 0.4473228, 1, 0, 0, 1, 1,
-0.5406577, 1.207992, 0.6044769, 0, 0, 0, 1, 1,
-0.538853, -0.03176507, -1.851868, 0, 0, 0, 1, 1,
-0.5383091, -0.2779357, -3.353485, 0, 0, 0, 1, 1,
-0.5382725, 0.234439, -1.295146, 0, 0, 0, 1, 1,
-0.5375899, -0.1662872, -0.5732689, 0, 0, 0, 1, 1,
-0.5369372, 1.578165, -1.688961, 0, 0, 0, 1, 1,
-0.5358095, 0.3735299, -0.9419771, 0, 0, 0, 1, 1,
-0.5314472, 0.2205385, -1.324104, 1, 1, 1, 1, 1,
-0.5272195, -1.202774, -2.259459, 1, 1, 1, 1, 1,
-0.5216339, 0.7903957, -1.609134, 1, 1, 1, 1, 1,
-0.5194124, -0.6800764, -3.93875, 1, 1, 1, 1, 1,
-0.5147468, 0.6555218, -0.268159, 1, 1, 1, 1, 1,
-0.5104332, 0.09276977, -1.358765, 1, 1, 1, 1, 1,
-0.5026586, -0.05818477, -2.784449, 1, 1, 1, 1, 1,
-0.5007014, -1.281192, -3.804323, 1, 1, 1, 1, 1,
-0.4949215, -1.759576, -1.935669, 1, 1, 1, 1, 1,
-0.4934811, 0.3564105, -2.763242, 1, 1, 1, 1, 1,
-0.4920968, 0.01237254, -2.276396, 1, 1, 1, 1, 1,
-0.4914463, -1.264437, -1.41469, 1, 1, 1, 1, 1,
-0.4908512, -1.010039, -1.072461, 1, 1, 1, 1, 1,
-0.4905786, 0.7028902, 0.08982596, 1, 1, 1, 1, 1,
-0.4893149, -0.2053084, -2.827099, 1, 1, 1, 1, 1,
-0.4875317, 0.02487083, -0.04841884, 0, 0, 1, 1, 1,
-0.4848479, -0.7352179, -1.625667, 1, 0, 0, 1, 1,
-0.4847282, -0.5137008, -1.227786, 1, 0, 0, 1, 1,
-0.4835779, -0.5661515, -3.646512, 1, 0, 0, 1, 1,
-0.4824749, -0.2770803, -2.831387, 1, 0, 0, 1, 1,
-0.4823175, -1.198068, -3.171948, 1, 0, 0, 1, 1,
-0.4821025, -1.124387, -1.078685, 0, 0, 0, 1, 1,
-0.4806054, 0.9517276, -2.57866, 0, 0, 0, 1, 1,
-0.4803821, -0.6055493, -3.887854, 0, 0, 0, 1, 1,
-0.4761988, 0.1125814, -1.299242, 0, 0, 0, 1, 1,
-0.4720353, 2.064912, 0.1961045, 0, 0, 0, 1, 1,
-0.469809, 2.755631, 0.5999195, 0, 0, 0, 1, 1,
-0.4691984, -0.8751682, -0.4582542, 0, 0, 0, 1, 1,
-0.4660881, 0.02038327, -1.912029, 1, 1, 1, 1, 1,
-0.4619311, -0.3033331, -1.042091, 1, 1, 1, 1, 1,
-0.4599711, -1.428779, -3.714299, 1, 1, 1, 1, 1,
-0.4560842, 0.4234644, -0.3402647, 1, 1, 1, 1, 1,
-0.4554334, -2.359633, -2.319523, 1, 1, 1, 1, 1,
-0.4553563, -1.795424, -2.081453, 1, 1, 1, 1, 1,
-0.4532016, 1.02866, -1.324373, 1, 1, 1, 1, 1,
-0.4518508, 0.5037248, -1.780652, 1, 1, 1, 1, 1,
-0.4513058, -0.7525195, -3.449213, 1, 1, 1, 1, 1,
-0.451237, 3.026201, -0.7069348, 1, 1, 1, 1, 1,
-0.4509493, -0.4446597, -2.442278, 1, 1, 1, 1, 1,
-0.4450965, -0.6791483, -3.307391, 1, 1, 1, 1, 1,
-0.4448084, -0.867701, -3.952153, 1, 1, 1, 1, 1,
-0.4408796, -0.3373477, -2.466455, 1, 1, 1, 1, 1,
-0.4408596, 0.512383, -1.5927, 1, 1, 1, 1, 1,
-0.4406743, 1.137007, -0.1402432, 0, 0, 1, 1, 1,
-0.4380885, -2.013621, -3.720647, 1, 0, 0, 1, 1,
-0.4377767, 0.5987777, 0.06391142, 1, 0, 0, 1, 1,
-0.436157, 0.3593102, -1.632891, 1, 0, 0, 1, 1,
-0.4328213, 1.374559, 1.306504, 1, 0, 0, 1, 1,
-0.4305429, -0.3217378, -0.664117, 1, 0, 0, 1, 1,
-0.4299607, 2.917804, -0.3150314, 0, 0, 0, 1, 1,
-0.428325, -0.8139768, -3.343439, 0, 0, 0, 1, 1,
-0.4220821, -0.03024948, -1.167446, 0, 0, 0, 1, 1,
-0.4198221, -0.9049168, -2.109255, 0, 0, 0, 1, 1,
-0.4172289, -0.08336817, -1.956618, 0, 0, 0, 1, 1,
-0.4133362, 0.263637, -0.5911224, 0, 0, 0, 1, 1,
-0.4066305, 1.08696, -0.1087935, 0, 0, 0, 1, 1,
-0.4039311, 0.5960907, 0.009287173, 1, 1, 1, 1, 1,
-0.4032019, -1.168144, -3.576191, 1, 1, 1, 1, 1,
-0.4023802, -0.7728735, -2.817558, 1, 1, 1, 1, 1,
-0.4006525, -0.1988708, -4.586614, 1, 1, 1, 1, 1,
-0.4001084, -0.5733491, -2.513237, 1, 1, 1, 1, 1,
-0.3984925, 0.1711624, -1.017584, 1, 1, 1, 1, 1,
-0.3964622, -1.486487, -3.922759, 1, 1, 1, 1, 1,
-0.3961962, 1.110033, 1.890021, 1, 1, 1, 1, 1,
-0.3881927, -0.7114595, -3.468687, 1, 1, 1, 1, 1,
-0.3875522, -0.01201873, -1.124285, 1, 1, 1, 1, 1,
-0.3874691, -1.182704, -2.05754, 1, 1, 1, 1, 1,
-0.379691, -1.432003, -2.422325, 1, 1, 1, 1, 1,
-0.3753609, 0.1656514, 0.4140664, 1, 1, 1, 1, 1,
-0.3747594, 0.6619387, -0.8512868, 1, 1, 1, 1, 1,
-0.3733154, 0.9890426, -1.150518, 1, 1, 1, 1, 1,
-0.3702188, -1.501724, -3.016731, 0, 0, 1, 1, 1,
-0.3628152, -0.6359254, -1.145731, 1, 0, 0, 1, 1,
-0.3627612, -1.713456, -3.453102, 1, 0, 0, 1, 1,
-0.3527449, 2.220363, -0.6779761, 1, 0, 0, 1, 1,
-0.3484514, 0.6484515, 0.5351132, 1, 0, 0, 1, 1,
-0.3483066, -0.1977267, -1.891357, 1, 0, 0, 1, 1,
-0.3455273, 1.855073, 2.092311, 0, 0, 0, 1, 1,
-0.343769, 1.336395, -1.050478, 0, 0, 0, 1, 1,
-0.3401897, 0.1427527, -0.2016288, 0, 0, 0, 1, 1,
-0.3386514, 0.7332976, 0.1744573, 0, 0, 0, 1, 1,
-0.3379744, 2.037494, 1.08989, 0, 0, 0, 1, 1,
-0.3340402, 2.445765, -0.5985891, 0, 0, 0, 1, 1,
-0.3327084, 0.9179616, -1.246292, 0, 0, 0, 1, 1,
-0.3321146, -0.6175873, -3.084322, 1, 1, 1, 1, 1,
-0.3292912, -0.09208621, -1.01629, 1, 1, 1, 1, 1,
-0.3248517, -0.1008534, -2.803239, 1, 1, 1, 1, 1,
-0.3246098, 1.060447, -1.867438, 1, 1, 1, 1, 1,
-0.3218908, 0.157669, -1.850262, 1, 1, 1, 1, 1,
-0.3202636, -0.544026, -2.964131, 1, 1, 1, 1, 1,
-0.3187164, -0.3689291, -2.786412, 1, 1, 1, 1, 1,
-0.317099, 0.404525, 0.9586715, 1, 1, 1, 1, 1,
-0.3156362, 0.1355609, -0.7330045, 1, 1, 1, 1, 1,
-0.3121355, 0.5754736, -1.505617, 1, 1, 1, 1, 1,
-0.3094033, -0.4038801, -2.788362, 1, 1, 1, 1, 1,
-0.307997, 0.2544185, -1.07216, 1, 1, 1, 1, 1,
-0.3044466, 1.003561, -1.064781, 1, 1, 1, 1, 1,
-0.3022703, -1.103893, -3.450408, 1, 1, 1, 1, 1,
-0.3003439, 1.663325, 1.92295, 1, 1, 1, 1, 1,
-0.2985729, 0.5455999, 0.5491486, 0, 0, 1, 1, 1,
-0.2982482, 1.646432, -1.114392, 1, 0, 0, 1, 1,
-0.2966618, 0.2160008, -0.8116246, 1, 0, 0, 1, 1,
-0.2962736, 0.2691561, -1.118959, 1, 0, 0, 1, 1,
-0.2951074, 1.088241, 0.4328808, 1, 0, 0, 1, 1,
-0.2911798, 0.2255097, -0.22774, 1, 0, 0, 1, 1,
-0.2881303, 0.4917437, -1.731616, 0, 0, 0, 1, 1,
-0.2866506, -1.434897, -2.431942, 0, 0, 0, 1, 1,
-0.2858499, 0.2191027, -0.8083478, 0, 0, 0, 1, 1,
-0.2836446, -1.339702, -0.4604198, 0, 0, 0, 1, 1,
-0.2715591, 2.091648, -2.134562, 0, 0, 0, 1, 1,
-0.2649746, 0.5660502, -0.4607869, 0, 0, 0, 1, 1,
-0.2603782, -2.362266, -3.753813, 0, 0, 0, 1, 1,
-0.257351, -0.5250435, -4.950082, 1, 1, 1, 1, 1,
-0.2524155, 0.4736087, -1.231423, 1, 1, 1, 1, 1,
-0.2496841, -0.8060837, -2.559995, 1, 1, 1, 1, 1,
-0.2479169, -0.4040343, -1.83948, 1, 1, 1, 1, 1,
-0.2471098, 0.02464881, -2.52953, 1, 1, 1, 1, 1,
-0.2441612, -0.01197798, -1.122224, 1, 1, 1, 1, 1,
-0.2409424, 1.210067, 2.001989, 1, 1, 1, 1, 1,
-0.2383364, 0.9869394, -1.031101, 1, 1, 1, 1, 1,
-0.2371449, -1.154338, -2.532996, 1, 1, 1, 1, 1,
-0.2363093, 1.255238, -1.466461, 1, 1, 1, 1, 1,
-0.235851, -1.597172, -3.430995, 1, 1, 1, 1, 1,
-0.2322085, -1.425555, -3.05167, 1, 1, 1, 1, 1,
-0.2308543, 1.712826, -0.5083969, 1, 1, 1, 1, 1,
-0.2303092, -0.6550216, -4.037863, 1, 1, 1, 1, 1,
-0.2290554, -0.8278841, -3.229129, 1, 1, 1, 1, 1,
-0.2288442, 0.3998592, -0.5001662, 0, 0, 1, 1, 1,
-0.2284635, -2.759108, -3.337905, 1, 0, 0, 1, 1,
-0.226728, -1.226353, -2.510245, 1, 0, 0, 1, 1,
-0.2220512, -0.3771142, -3.600799, 1, 0, 0, 1, 1,
-0.2211086, 0.5736236, -1.03705, 1, 0, 0, 1, 1,
-0.2202903, -0.2465024, -3.068687, 1, 0, 0, 1, 1,
-0.2194761, 0.7674343, 0.4066035, 0, 0, 0, 1, 1,
-0.2127471, -0.9315534, -2.9166, 0, 0, 0, 1, 1,
-0.2121907, 0.8252397, 0.5373931, 0, 0, 0, 1, 1,
-0.2055442, -0.02925083, -1.590037, 0, 0, 0, 1, 1,
-0.2019025, -0.2032696, -3.753785, 0, 0, 0, 1, 1,
-0.2008536, -0.6873892, -2.597658, 0, 0, 0, 1, 1,
-0.2003518, -0.2052883, -1.853994, 0, 0, 0, 1, 1,
-0.1989214, -0.0758361, -2.550055, 1, 1, 1, 1, 1,
-0.1926402, 0.04069911, -0.7118205, 1, 1, 1, 1, 1,
-0.1889982, 1.95711, -0.6346819, 1, 1, 1, 1, 1,
-0.1887983, 0.9603037, 0.09253646, 1, 1, 1, 1, 1,
-0.188745, 0.7646758, 0.1676657, 1, 1, 1, 1, 1,
-0.188669, 0.4521908, -0.3548187, 1, 1, 1, 1, 1,
-0.1871146, 0.101397, -1.032953, 1, 1, 1, 1, 1,
-0.1865414, -0.7541555, -3.440857, 1, 1, 1, 1, 1,
-0.1845506, -0.09697703, -1.358786, 1, 1, 1, 1, 1,
-0.1831556, 2.023958, 0.1777147, 1, 1, 1, 1, 1,
-0.1829586, -1.105064, -4.647986, 1, 1, 1, 1, 1,
-0.1753407, -0.8245935, -1.990416, 1, 1, 1, 1, 1,
-0.1737428, -0.04009431, -1.121464, 1, 1, 1, 1, 1,
-0.170018, 0.734798, 0.3342653, 1, 1, 1, 1, 1,
-0.1615054, -0.2796145, -1.235504, 1, 1, 1, 1, 1,
-0.1595688, 1.38924, -0.5647843, 0, 0, 1, 1, 1,
-0.1574508, -0.23907, -1.218783, 1, 0, 0, 1, 1,
-0.1486271, 0.9489193, 1.358415, 1, 0, 0, 1, 1,
-0.1450387, -0.8282022, -4.385869, 1, 0, 0, 1, 1,
-0.1412065, 0.953693, -0.1548657, 1, 0, 0, 1, 1,
-0.138595, -0.03833421, -1.423395, 1, 0, 0, 1, 1,
-0.137568, -0.6472384, -3.247503, 0, 0, 0, 1, 1,
-0.1351185, 2.046023, -2.446897, 0, 0, 0, 1, 1,
-0.1344448, 1.152791, 0.6290388, 0, 0, 0, 1, 1,
-0.1340954, 0.2985738, -1.016186, 0, 0, 0, 1, 1,
-0.1334031, 1.159491, -1.28942, 0, 0, 0, 1, 1,
-0.1323363, -2.055067, -2.06994, 0, 0, 0, 1, 1,
-0.1314322, -0.2735613, -4.108223, 0, 0, 0, 1, 1,
-0.1288437, 1.239558, -1.147606, 1, 1, 1, 1, 1,
-0.1226989, 0.8618448, 0.2068374, 1, 1, 1, 1, 1,
-0.1188423, 1.445078, -0.660409, 1, 1, 1, 1, 1,
-0.1188065, -0.903124, -2.697293, 1, 1, 1, 1, 1,
-0.1140242, -1.028848, -2.029001, 1, 1, 1, 1, 1,
-0.111098, -1.201299, -2.117562, 1, 1, 1, 1, 1,
-0.1065698, 0.6000848, 0.08831085, 1, 1, 1, 1, 1,
-0.1054476, -1.000064, -3.316167, 1, 1, 1, 1, 1,
-0.1045151, -1.398369, -4.057187, 1, 1, 1, 1, 1,
-0.09467512, 2.572624, 0.7613896, 1, 1, 1, 1, 1,
-0.09451205, -0.6013235, -2.91818, 1, 1, 1, 1, 1,
-0.09263635, -0.2782514, -3.459015, 1, 1, 1, 1, 1,
-0.09107352, 2.354645, 0.3244455, 1, 1, 1, 1, 1,
-0.08422209, 0.5668241, 0.2304196, 1, 1, 1, 1, 1,
-0.08054758, 0.3337026, -1.747359, 1, 1, 1, 1, 1,
-0.07821752, 0.0806296, -1.332408, 0, 0, 1, 1, 1,
-0.07467198, 0.08748976, -0.622533, 1, 0, 0, 1, 1,
-0.07282262, -0.7224629, -2.450621, 1, 0, 0, 1, 1,
-0.07255913, -0.2666792, -3.789968, 1, 0, 0, 1, 1,
-0.07241638, 0.7498444, 0.3573753, 1, 0, 0, 1, 1,
-0.0689343, -0.716382, -2.632085, 1, 0, 0, 1, 1,
-0.06193853, -1.415572, -2.687684, 0, 0, 0, 1, 1,
-0.06132545, -1.752818, -3.451574, 0, 0, 0, 1, 1,
-0.05610421, -1.659621, -3.638921, 0, 0, 0, 1, 1,
-0.05508387, 0.6522722, 0.3175747, 0, 0, 0, 1, 1,
-0.05318145, -0.2288891, -2.364428, 0, 0, 0, 1, 1,
-0.05058334, 0.857587, -0.5479966, 0, 0, 0, 1, 1,
-0.04728673, 1.160997, -2.472571, 0, 0, 0, 1, 1,
-0.04587249, -0.7836443, -2.557417, 1, 1, 1, 1, 1,
-0.04531651, 0.7006531, 1.744908, 1, 1, 1, 1, 1,
-0.04117171, -0.8990066, -3.97319, 1, 1, 1, 1, 1,
-0.04050679, 0.1270371, -0.7375106, 1, 1, 1, 1, 1,
-0.03964028, 0.447818, 0.8940292, 1, 1, 1, 1, 1,
-0.03902404, 0.5693325, -0.2911888, 1, 1, 1, 1, 1,
-0.03743155, 1.123325, -2.457153, 1, 1, 1, 1, 1,
-0.02663579, 0.7234371, 1.28694, 1, 1, 1, 1, 1,
-0.02519864, 1.914312, -2.1275, 1, 1, 1, 1, 1,
-0.02131617, 0.235048, -0.2979808, 1, 1, 1, 1, 1,
-0.0209542, -1.780208, -3.500932, 1, 1, 1, 1, 1,
-0.01964491, -0.02099417, -1.918682, 1, 1, 1, 1, 1,
-0.01865751, -0.7599792, -2.555416, 1, 1, 1, 1, 1,
-0.01608903, -0.2866419, -1.936584, 1, 1, 1, 1, 1,
-0.01013319, -0.6578807, -5.228706, 1, 1, 1, 1, 1,
-0.009930812, 0.2660477, -0.1108504, 0, 0, 1, 1, 1,
-0.009575929, 0.9316947, -0.7884433, 1, 0, 0, 1, 1,
-0.008705966, 0.2147244, 1.261227, 1, 0, 0, 1, 1,
-0.001841869, -1.142056, -1.900326, 1, 0, 0, 1, 1,
-0.001757891, 0.4901417, 0.5480481, 1, 0, 0, 1, 1,
0.0002614562, 0.7747249, -0.1621582, 1, 0, 0, 1, 1,
0.006683487, -0.7743239, 2.814362, 0, 0, 0, 1, 1,
0.00760038, 0.4679625, -2.957135, 0, 0, 0, 1, 1,
0.01609262, 0.4975273, -1.672669, 0, 0, 0, 1, 1,
0.01899486, 0.7254021, -0.2515188, 0, 0, 0, 1, 1,
0.02015612, 1.101152, 0.5360847, 0, 0, 0, 1, 1,
0.02075419, -1.000556, 0.6390492, 0, 0, 0, 1, 1,
0.02763299, 0.5578167, -1.374184, 0, 0, 0, 1, 1,
0.02906677, -0.850584, 2.850157, 1, 1, 1, 1, 1,
0.02938412, -1.232629, 2.988501, 1, 1, 1, 1, 1,
0.02965405, -0.1794907, 2.866392, 1, 1, 1, 1, 1,
0.03014956, -1.539459, 4.052955, 1, 1, 1, 1, 1,
0.03068343, -0.7725513, 3.688512, 1, 1, 1, 1, 1,
0.03258729, 1.036355, 0.4491357, 1, 1, 1, 1, 1,
0.03259513, -0.3554854, 2.280746, 1, 1, 1, 1, 1,
0.03323558, -0.5159839, 2.921242, 1, 1, 1, 1, 1,
0.03525895, -0.5657746, 4.476104, 1, 1, 1, 1, 1,
0.03751845, -1.307283, 1.62673, 1, 1, 1, 1, 1,
0.03787596, -0.5579836, 2.457041, 1, 1, 1, 1, 1,
0.03865776, -1.536017, 2.955095, 1, 1, 1, 1, 1,
0.04019116, -2.001751, 4.084258, 1, 1, 1, 1, 1,
0.04055338, -0.4403479, 2.86699, 1, 1, 1, 1, 1,
0.04064365, 1.812833, -0.01160863, 1, 1, 1, 1, 1,
0.04128846, 1.165274, 0.5664955, 0, 0, 1, 1, 1,
0.04192494, 1.423533, 1.778644, 1, 0, 0, 1, 1,
0.04284609, 0.5101414, 0.3814368, 1, 0, 0, 1, 1,
0.04298582, 1.236774, -0.9941733, 1, 0, 0, 1, 1,
0.04374997, 0.8409171, 1.886167, 1, 0, 0, 1, 1,
0.04741763, -0.6871957, 3.750866, 1, 0, 0, 1, 1,
0.04945163, -1.299236, 1.599072, 0, 0, 0, 1, 1,
0.05216907, 0.1190827, 0.8798482, 0, 0, 0, 1, 1,
0.05292152, 1.316586, -0.5085384, 0, 0, 0, 1, 1,
0.05593648, 0.2815929, 0.1261245, 0, 0, 0, 1, 1,
0.0712642, -1.718382, 4.412448, 0, 0, 0, 1, 1,
0.07353444, 1.163321, 0.4524379, 0, 0, 0, 1, 1,
0.07552739, 0.5700436, -0.4589262, 0, 0, 0, 1, 1,
0.08077733, 0.1771468, -0.5909516, 1, 1, 1, 1, 1,
0.08355889, 0.3244349, 1.128306, 1, 1, 1, 1, 1,
0.0851443, 0.477201, -0.2340834, 1, 1, 1, 1, 1,
0.08976056, 0.9131016, -0.3535327, 1, 1, 1, 1, 1,
0.09291395, 0.002220264, 1.352737, 1, 1, 1, 1, 1,
0.0957205, 0.1755916, 1.657647, 1, 1, 1, 1, 1,
0.09760448, -1.213325, 4.253235, 1, 1, 1, 1, 1,
0.09875804, 0.2879249, 0.6210604, 1, 1, 1, 1, 1,
0.1055868, -0.77153, 2.831412, 1, 1, 1, 1, 1,
0.1071391, 0.05138726, -0.08613804, 1, 1, 1, 1, 1,
0.1074188, -1.088254, 3.414179, 1, 1, 1, 1, 1,
0.1081381, 0.4474063, 1.045146, 1, 1, 1, 1, 1,
0.1114746, -0.2537653, 3.211102, 1, 1, 1, 1, 1,
0.111972, 0.3021441, 1.974181, 1, 1, 1, 1, 1,
0.1131274, -0.1950677, 1.107834, 1, 1, 1, 1, 1,
0.1140503, -1.502467, 3.772268, 0, 0, 1, 1, 1,
0.1149639, -0.1620161, 1.752372, 1, 0, 0, 1, 1,
0.1179125, 1.092263, -0.09746643, 1, 0, 0, 1, 1,
0.1198489, 0.3880266, 0.7726021, 1, 0, 0, 1, 1,
0.1287836, 1.177135, -0.8127852, 1, 0, 0, 1, 1,
0.131217, -0.3648746, 0.9615641, 1, 0, 0, 1, 1,
0.136207, -0.7672375, 0.4910715, 0, 0, 0, 1, 1,
0.1397927, 1.482735, -0.1944457, 0, 0, 0, 1, 1,
0.1459976, 1.379625, 0.5867045, 0, 0, 0, 1, 1,
0.1490608, -0.7792302, 3.153929, 0, 0, 0, 1, 1,
0.1506409, -1.08332, 3.412905, 0, 0, 0, 1, 1,
0.152017, -1.53835, 4.77477, 0, 0, 0, 1, 1,
0.155627, 1.398554, -0.8015075, 0, 0, 0, 1, 1,
0.156009, -1.757463, 4.03774, 1, 1, 1, 1, 1,
0.1583931, 0.5464332, -0.6103261, 1, 1, 1, 1, 1,
0.1623192, -0.5804273, 4.877048, 1, 1, 1, 1, 1,
0.1662958, -1.446943, 2.9494, 1, 1, 1, 1, 1,
0.1733092, 0.3394375, 0.5666381, 1, 1, 1, 1, 1,
0.1735754, -0.7297852, 3.246066, 1, 1, 1, 1, 1,
0.1736202, 2.935298, -0.1009356, 1, 1, 1, 1, 1,
0.1761064, -1.632257, 1.523346, 1, 1, 1, 1, 1,
0.1821906, -0.1896835, 2.092883, 1, 1, 1, 1, 1,
0.1904303, 0.5109349, 0.7147815, 1, 1, 1, 1, 1,
0.1906078, -0.5338935, 2.372425, 1, 1, 1, 1, 1,
0.1917628, -1.506608, 4.512532, 1, 1, 1, 1, 1,
0.1970297, -0.6690825, 2.438747, 1, 1, 1, 1, 1,
0.1982952, 1.343916, 1.204293, 1, 1, 1, 1, 1,
0.2009233, 0.2970025, 1.947424, 1, 1, 1, 1, 1,
0.2055932, -0.3138394, 2.534521, 0, 0, 1, 1, 1,
0.2060634, -1.084404, 2.650454, 1, 0, 0, 1, 1,
0.2108099, 1.724927, -0.855196, 1, 0, 0, 1, 1,
0.2142368, -0.1790021, 1.267493, 1, 0, 0, 1, 1,
0.2156911, -1.072353, 5.911755, 1, 0, 0, 1, 1,
0.2181935, -0.5374895, 2.470978, 1, 0, 0, 1, 1,
0.2182116, -0.07234427, 1.343919, 0, 0, 0, 1, 1,
0.2182312, 1.721606, -1.035277, 0, 0, 0, 1, 1,
0.2224661, 0.4709118, -0.9835687, 0, 0, 0, 1, 1,
0.2237996, 0.7208683, 0.08036493, 0, 0, 0, 1, 1,
0.2262897, -1.075783, 1.661497, 0, 0, 0, 1, 1,
0.2297311, -0.5826352, 3.419401, 0, 0, 0, 1, 1,
0.232123, 0.3471548, -0.6679758, 0, 0, 0, 1, 1,
0.2345822, -0.2164383, 2.484372, 1, 1, 1, 1, 1,
0.2363826, -0.5131384, 1.491827, 1, 1, 1, 1, 1,
0.237369, 2.002469, -1.125684, 1, 1, 1, 1, 1,
0.2434487, -0.5121692, 3.247205, 1, 1, 1, 1, 1,
0.2472229, -1.420976, 1.596222, 1, 1, 1, 1, 1,
0.2477446, -0.2098767, 1.366842, 1, 1, 1, 1, 1,
0.2502925, -0.03450321, 1.083136, 1, 1, 1, 1, 1,
0.2576584, 2.388089, 0.8593622, 1, 1, 1, 1, 1,
0.2643616, 0.6813917, -0.08057129, 1, 1, 1, 1, 1,
0.2690308, 1.197495, 1.449792, 1, 1, 1, 1, 1,
0.2716059, -0.9114688, 1.4655, 1, 1, 1, 1, 1,
0.2729554, 1.416205, 0.1056452, 1, 1, 1, 1, 1,
0.2782885, 0.3833315, -0.1861928, 1, 1, 1, 1, 1,
0.2837247, -1.270792, 1.319892, 1, 1, 1, 1, 1,
0.2845617, 0.1013579, 0.1280959, 1, 1, 1, 1, 1,
0.2850072, -0.6492139, 2.951925, 0, 0, 1, 1, 1,
0.285731, -1.542404, 3.422335, 1, 0, 0, 1, 1,
0.2881776, -0.07375283, 1.32297, 1, 0, 0, 1, 1,
0.290094, 1.801846, 1.685877, 1, 0, 0, 1, 1,
0.2910747, -1.494152, 3.19995, 1, 0, 0, 1, 1,
0.2912064, 0.6378056, 2.37576, 1, 0, 0, 1, 1,
0.2955884, 0.5897862, 2.644418, 0, 0, 0, 1, 1,
0.2987059, 1.8529, -0.01774867, 0, 0, 0, 1, 1,
0.2996859, 0.3217055, 0.2358371, 0, 0, 0, 1, 1,
0.3015278, 2.000406, 0.9133484, 0, 0, 0, 1, 1,
0.3029527, 0.4169368, 1.654101, 0, 0, 0, 1, 1,
0.3046042, -2.038549, 3.320927, 0, 0, 0, 1, 1,
0.3054092, -0.2381308, 2.537949, 0, 0, 0, 1, 1,
0.3065629, 0.2747325, -0.1766381, 1, 1, 1, 1, 1,
0.311764, 0.3799019, 0.4288439, 1, 1, 1, 1, 1,
0.3133043, 0.6061127, 0.8403742, 1, 1, 1, 1, 1,
0.3243687, 1.47124, 0.1204418, 1, 1, 1, 1, 1,
0.3252696, -1.678036, 3.711453, 1, 1, 1, 1, 1,
0.325373, 1.160012, -0.3010179, 1, 1, 1, 1, 1,
0.3281276, -0.2877755, 2.714962, 1, 1, 1, 1, 1,
0.3303349, 0.6023867, 1.246881, 1, 1, 1, 1, 1,
0.3307994, 1.207796, -0.510604, 1, 1, 1, 1, 1,
0.3337323, 0.2852825, 2.358926, 1, 1, 1, 1, 1,
0.3358073, -0.1957528, 2.534504, 1, 1, 1, 1, 1,
0.3383354, -1.29985, 2.584731, 1, 1, 1, 1, 1,
0.3429048, -0.964688, 3.2555, 1, 1, 1, 1, 1,
0.3430001, -0.567746, 2.194769, 1, 1, 1, 1, 1,
0.3459126, 1.276626, 0.2645608, 1, 1, 1, 1, 1,
0.3491095, -0.4792027, 1.543049, 0, 0, 1, 1, 1,
0.3563314, 1.817726, -0.2283168, 1, 0, 0, 1, 1,
0.3609377, 0.9627423, 2.367907, 1, 0, 0, 1, 1,
0.3629621, 1.238339, -0.2802707, 1, 0, 0, 1, 1,
0.3649706, -1.118913, 1.433563, 1, 0, 0, 1, 1,
0.3649869, 0.7346928, -0.3500758, 1, 0, 0, 1, 1,
0.3659313, -1.239046, 1.971424, 0, 0, 0, 1, 1,
0.3678178, 1.804581, -1.038035, 0, 0, 0, 1, 1,
0.3735896, -0.2185597, 3.835422, 0, 0, 0, 1, 1,
0.3827822, -0.1831318, 0.4560737, 0, 0, 0, 1, 1,
0.3878815, -0.5258703, 2.327883, 0, 0, 0, 1, 1,
0.3893715, 0.5651386, 1.147077, 0, 0, 0, 1, 1,
0.3936229, -1.419764, 3.024183, 0, 0, 0, 1, 1,
0.3999845, -1.092681, 0.9725744, 1, 1, 1, 1, 1,
0.4026132, 1.507213, 1.11603, 1, 1, 1, 1, 1,
0.4076221, -1.373407, 1.908348, 1, 1, 1, 1, 1,
0.4102676, 0.9059939, 2.137535, 1, 1, 1, 1, 1,
0.4119249, -1.531841, 3.461314, 1, 1, 1, 1, 1,
0.4119592, 0.2246861, 1.288158, 1, 1, 1, 1, 1,
0.4128827, 0.1528099, -1.170673, 1, 1, 1, 1, 1,
0.4164105, -0.5360049, 2.606592, 1, 1, 1, 1, 1,
0.4180236, -1.886021, 1.432636, 1, 1, 1, 1, 1,
0.4217127, -1.414441, 0.6042811, 1, 1, 1, 1, 1,
0.4217552, -0.1649219, 2.010549, 1, 1, 1, 1, 1,
0.4229189, -0.1917566, 0.8267108, 1, 1, 1, 1, 1,
0.4234648, 0.117724, 0.7656786, 1, 1, 1, 1, 1,
0.4246623, -1.319896, 1.714047, 1, 1, 1, 1, 1,
0.4250749, 1.397611, 1.26406, 1, 1, 1, 1, 1,
0.4264186, -0.2240726, 0.7521654, 0, 0, 1, 1, 1,
0.4282632, -0.149004, 0.9668765, 1, 0, 0, 1, 1,
0.4297432, -1.010035, 2.094139, 1, 0, 0, 1, 1,
0.4312106, 0.9928264, 1.323584, 1, 0, 0, 1, 1,
0.4377621, 1.413257, 1.312409, 1, 0, 0, 1, 1,
0.4387985, -1.525088, 3.383405, 1, 0, 0, 1, 1,
0.4391991, -0.1649683, 3.264313, 0, 0, 0, 1, 1,
0.4420122, 0.4214281, -0.460538, 0, 0, 0, 1, 1,
0.4432994, -0.4623542, 3.860081, 0, 0, 0, 1, 1,
0.4452345, 1.955381, -0.9355378, 0, 0, 0, 1, 1,
0.451834, 0.3728241, 3.860132, 0, 0, 0, 1, 1,
0.4582651, 0.5600408, 0.5936509, 0, 0, 0, 1, 1,
0.4613694, -0.8928667, 2.624755, 0, 0, 0, 1, 1,
0.4642492, 0.5827122, -0.004985725, 1, 1, 1, 1, 1,
0.4652194, 0.506436, 1.85233, 1, 1, 1, 1, 1,
0.4679125, 0.2445396, 0.9716032, 1, 1, 1, 1, 1,
0.4683908, -0.5653624, 1.40799, 1, 1, 1, 1, 1,
0.4818408, 1.570384, 0.02537591, 1, 1, 1, 1, 1,
0.4821683, -0.6611685, 2.884238, 1, 1, 1, 1, 1,
0.4824094, 0.9740528, -0.6447695, 1, 1, 1, 1, 1,
0.4844013, -0.9629336, 2.185987, 1, 1, 1, 1, 1,
0.484438, -0.717798, 3.09867, 1, 1, 1, 1, 1,
0.4891922, -0.8057911, 2.476818, 1, 1, 1, 1, 1,
0.4942889, 0.2088939, 2.065895, 1, 1, 1, 1, 1,
0.4973081, 0.7888268, 0.5601109, 1, 1, 1, 1, 1,
0.4994503, -0.2865633, 0.7221394, 1, 1, 1, 1, 1,
0.5023499, -1.400395, 2.253327, 1, 1, 1, 1, 1,
0.5049741, 0.6660542, 1.303482, 1, 1, 1, 1, 1,
0.5125719, -0.8601711, 2.155001, 0, 0, 1, 1, 1,
0.5127878, -0.9170558, 2.328305, 1, 0, 0, 1, 1,
0.5164096, 0.2544453, 0.8767381, 1, 0, 0, 1, 1,
0.5186651, -1.181782, 2.142765, 1, 0, 0, 1, 1,
0.524121, -1.07608, 2.932503, 1, 0, 0, 1, 1,
0.5248691, 0.813153, -0.8692589, 1, 0, 0, 1, 1,
0.5269624, 1.010225, 1.62535, 0, 0, 0, 1, 1,
0.5270927, 0.5458939, 1.600023, 0, 0, 0, 1, 1,
0.5271503, 0.129456, -0.721108, 0, 0, 0, 1, 1,
0.5289232, -0.1241944, 2.444382, 0, 0, 0, 1, 1,
0.530157, -0.5624353, 3.948828, 0, 0, 0, 1, 1,
0.5303867, -0.5695157, 2.698563, 0, 0, 0, 1, 1,
0.5386955, 0.9803143, 0.8396303, 0, 0, 0, 1, 1,
0.5391709, 1.116664, 1.165352, 1, 1, 1, 1, 1,
0.5393034, 0.7673542, -0.2455159, 1, 1, 1, 1, 1,
0.5426996, 0.5728895, 2.214317, 1, 1, 1, 1, 1,
0.55043, 0.5112863, 2.987242, 1, 1, 1, 1, 1,
0.5536764, 1.189259, 1.353975, 1, 1, 1, 1, 1,
0.5587062, 0.05600822, 1.453583, 1, 1, 1, 1, 1,
0.5642813, -1.144511, 2.363151, 1, 1, 1, 1, 1,
0.5713823, -1.691632, 3.313652, 1, 1, 1, 1, 1,
0.5723606, 1.035875, 0.4600646, 1, 1, 1, 1, 1,
0.5771879, 1.37391, 1.324976, 1, 1, 1, 1, 1,
0.5777526, 2.293574, 2.206329, 1, 1, 1, 1, 1,
0.5785644, 0.6262082, -0.2854806, 1, 1, 1, 1, 1,
0.5844931, -0.4192841, 1.565278, 1, 1, 1, 1, 1,
0.5856197, -0.6397344, 1.672075, 1, 1, 1, 1, 1,
0.5875353, 0.5253666, -0.7170576, 1, 1, 1, 1, 1,
0.5920029, 0.8333584, 0.5648189, 0, 0, 1, 1, 1,
0.5934682, -3.071326, 2.936579, 1, 0, 0, 1, 1,
0.5976253, 1.30079, 0.4046511, 1, 0, 0, 1, 1,
0.6031115, 1.98835, 0.2786947, 1, 0, 0, 1, 1,
0.6043234, -0.7699431, 2.013997, 1, 0, 0, 1, 1,
0.6116994, -0.9480028, 2.547707, 1, 0, 0, 1, 1,
0.6187314, -0.5002224, 0.924022, 0, 0, 0, 1, 1,
0.6197802, 0.5580984, 0.8729141, 0, 0, 0, 1, 1,
0.624505, 1.878672, 0.397668, 0, 0, 0, 1, 1,
0.6282803, -0.5350193, 3.047776, 0, 0, 0, 1, 1,
0.633424, -0.06861473, 0.932525, 0, 0, 0, 1, 1,
0.6406295, 1.156115, 2.846776, 0, 0, 0, 1, 1,
0.6419321, 0.8297461, 2.05145, 0, 0, 0, 1, 1,
0.6438593, -0.232658, 0.4773175, 1, 1, 1, 1, 1,
0.6459646, -1.106925, 3.399785, 1, 1, 1, 1, 1,
0.6533782, -0.9277857, 1.920894, 1, 1, 1, 1, 1,
0.6549882, -0.3514268, 2.77369, 1, 1, 1, 1, 1,
0.6557347, 1.212979, -0.8513126, 1, 1, 1, 1, 1,
0.6563396, -0.317688, 3.330802, 1, 1, 1, 1, 1,
0.6583224, -0.9215011, 3.064144, 1, 1, 1, 1, 1,
0.6591929, 0.5582529, 0.3223244, 1, 1, 1, 1, 1,
0.6670718, -0.6930675, 3.149924, 1, 1, 1, 1, 1,
0.6730052, -2.024543, 3.96451, 1, 1, 1, 1, 1,
0.6758257, -1.635413, 4.836751, 1, 1, 1, 1, 1,
0.677678, -0.0008651976, 1.428359, 1, 1, 1, 1, 1,
0.6847749, -0.1071078, 0.4260269, 1, 1, 1, 1, 1,
0.6898916, 1.130727, -0.1730547, 1, 1, 1, 1, 1,
0.6952536, 0.5899861, 1.073935, 1, 1, 1, 1, 1,
0.6970972, 0.9198604, -1.872884, 0, 0, 1, 1, 1,
0.6975772, 0.9474868, 0.922621, 1, 0, 0, 1, 1,
0.7058306, 0.05042744, 0.7374061, 1, 0, 0, 1, 1,
0.7062775, 1.494678, 0.2164781, 1, 0, 0, 1, 1,
0.706585, 0.2744598, 1.212683, 1, 0, 0, 1, 1,
0.710804, 0.9644889, 1.67611, 1, 0, 0, 1, 1,
0.7122601, -0.6749974, 0.3057486, 0, 0, 0, 1, 1,
0.7146335, -1.13134, 1.42126, 0, 0, 0, 1, 1,
0.716556, 0.3048545, 1.093446, 0, 0, 0, 1, 1,
0.7183952, -1.773163, 3.712451, 0, 0, 0, 1, 1,
0.7206507, -0.6147448, 3.295147, 0, 0, 0, 1, 1,
0.7228829, -0.07314826, 1.657194, 0, 0, 0, 1, 1,
0.7269818, 0.3316787, 1.395576, 0, 0, 0, 1, 1,
0.7289556, -0.3118972, 1.248452, 1, 1, 1, 1, 1,
0.7302678, -0.4073226, 0.9935599, 1, 1, 1, 1, 1,
0.7327703, -0.7783388, 3.102412, 1, 1, 1, 1, 1,
0.7329888, -0.8895373, 1.97412, 1, 1, 1, 1, 1,
0.7335032, 0.2767803, 2.460759, 1, 1, 1, 1, 1,
0.7396114, -1.682093, 2.960588, 1, 1, 1, 1, 1,
0.755282, -0.186289, 2.2407, 1, 1, 1, 1, 1,
0.7555897, 0.1731062, 1.609258, 1, 1, 1, 1, 1,
0.7578076, -0.7194883, 3.5496, 1, 1, 1, 1, 1,
0.7600408, -0.5602004, 2.980138, 1, 1, 1, 1, 1,
0.7621958, 1.223429, -1.022558, 1, 1, 1, 1, 1,
0.7690005, -0.07537559, 0.09477397, 1, 1, 1, 1, 1,
0.7791247, -1.255554, 0.8591607, 1, 1, 1, 1, 1,
0.7799673, 1.480477, -0.6736134, 1, 1, 1, 1, 1,
0.7809287, -0.1623332, -0.310963, 1, 1, 1, 1, 1,
0.7854806, -1.132402, 2.960504, 0, 0, 1, 1, 1,
0.7879945, 0.5166727, 2.630559, 1, 0, 0, 1, 1,
0.7928877, -1.029767, 1.40349, 1, 0, 0, 1, 1,
0.7947094, -0.6863369, 4.037644, 1, 0, 0, 1, 1,
0.7978309, 0.09223002, 1.946923, 1, 0, 0, 1, 1,
0.8023859, 0.7220941, 1.743459, 1, 0, 0, 1, 1,
0.8062399, 0.4776955, 2.272044, 0, 0, 0, 1, 1,
0.8072167, -0.776291, 3.524318, 0, 0, 0, 1, 1,
0.8088808, -0.5263714, 1.90198, 0, 0, 0, 1, 1,
0.8164642, 1.140556, 1.261646, 0, 0, 0, 1, 1,
0.816871, 0.03430643, 0.9573454, 0, 0, 0, 1, 1,
0.819194, 0.06960756, 0.04194447, 0, 0, 0, 1, 1,
0.8210236, 1.293935, -0.9658548, 0, 0, 0, 1, 1,
0.8244886, -0.5126193, 1.912309, 1, 1, 1, 1, 1,
0.8268715, 1.54616, 1.044406, 1, 1, 1, 1, 1,
0.8295613, -0.5320507, 3.167929, 1, 1, 1, 1, 1,
0.8304229, 0.3801298, -0.3523942, 1, 1, 1, 1, 1,
0.8321691, 0.8700761, 0.2261112, 1, 1, 1, 1, 1,
0.8368567, -0.2224957, 2.178477, 1, 1, 1, 1, 1,
0.8379778, -0.3997582, 1.61106, 1, 1, 1, 1, 1,
0.8387714, -1.473708, 1.645929, 1, 1, 1, 1, 1,
0.8398575, -0.1245594, 1.90782, 1, 1, 1, 1, 1,
0.8433081, 0.3054638, -0.3831258, 1, 1, 1, 1, 1,
0.8463538, 0.0906729, 1.638697, 1, 1, 1, 1, 1,
0.8489159, 0.9624221, 0.1263405, 1, 1, 1, 1, 1,
0.8606239, -2.37511, 2.198894, 1, 1, 1, 1, 1,
0.8616198, 0.5801351, 1.237237, 1, 1, 1, 1, 1,
0.8731925, -0.9713522, 2.920177, 1, 1, 1, 1, 1,
0.8773469, 0.742999, 0.4770721, 0, 0, 1, 1, 1,
0.8826454, 0.6367374, 2.496266, 1, 0, 0, 1, 1,
0.8859817, 0.5579621, 2.441302, 1, 0, 0, 1, 1,
0.8880921, 1.751458, 1.035576, 1, 0, 0, 1, 1,
0.8979837, -0.939524, 2.977674, 1, 0, 0, 1, 1,
0.9040272, 0.1740617, 1.136184, 1, 0, 0, 1, 1,
0.9184618, -0.8793337, 2.501946, 0, 0, 0, 1, 1,
0.9215859, -1.275808, 1.101444, 0, 0, 0, 1, 1,
0.9294199, -0.2678618, 2.616634, 0, 0, 0, 1, 1,
0.9326085, 0.6845776, 2.618843, 0, 0, 0, 1, 1,
0.9341372, 0.452307, -0.2786801, 0, 0, 0, 1, 1,
0.9342015, 0.1588844, 1.501998, 0, 0, 0, 1, 1,
0.9342791, -0.7412628, 2.036743, 0, 0, 0, 1, 1,
0.9370108, -0.04135381, 2.79413, 1, 1, 1, 1, 1,
0.938721, -0.5579344, 3.434526, 1, 1, 1, 1, 1,
0.9414901, -0.9398121, 2.269542, 1, 1, 1, 1, 1,
0.9466106, -1.459316, 2.656002, 1, 1, 1, 1, 1,
0.9487321, 0.04526852, 0.837716, 1, 1, 1, 1, 1,
0.9491641, 0.3065278, -1.135972, 1, 1, 1, 1, 1,
0.9493964, 0.007521709, 2.79197, 1, 1, 1, 1, 1,
0.9533005, -0.4226755, 4.267005, 1, 1, 1, 1, 1,
0.9539385, 1.667089, 2.084611, 1, 1, 1, 1, 1,
0.9553519, 1.667588, 1.676824, 1, 1, 1, 1, 1,
0.9568472, 0.01319712, 2.393079, 1, 1, 1, 1, 1,
0.9594549, -1.742049, 1.997913, 1, 1, 1, 1, 1,
0.9649229, 3.329548, -0.6758549, 1, 1, 1, 1, 1,
0.9658681, -1.173328, 2.933029, 1, 1, 1, 1, 1,
0.969717, -0.8510067, 0.09315946, 1, 1, 1, 1, 1,
0.9770696, 0.07925754, 1.53158, 0, 0, 1, 1, 1,
0.977644, 0.39466, 1.388764, 1, 0, 0, 1, 1,
0.9877974, 1.479615, -0.4561015, 1, 0, 0, 1, 1,
0.9898238, -1.265802, 3.474239, 1, 0, 0, 1, 1,
0.9920225, 1.13472, 0.8726805, 1, 0, 0, 1, 1,
0.9938526, -1.077564, 2.164468, 1, 0, 0, 1, 1,
0.9996592, 0.5499367, 0.832068, 0, 0, 0, 1, 1,
1.002185, -1.329356, 3.902033, 0, 0, 0, 1, 1,
1.003051, 0.4343933, 0.4638635, 0, 0, 0, 1, 1,
1.015364, -0.2721802, 2.518922, 0, 0, 0, 1, 1,
1.02124, -0.9675801, 0.2412232, 0, 0, 0, 1, 1,
1.035707, 0.8463901, 2.468314, 0, 0, 0, 1, 1,
1.041846, 0.002283467, 3.180577, 0, 0, 0, 1, 1,
1.042647, 0.8915882, 1.598674, 1, 1, 1, 1, 1,
1.044473, 1.333598, 1.495728, 1, 1, 1, 1, 1,
1.04992, -1.02801, 1.988051, 1, 1, 1, 1, 1,
1.050607, 1.055481, 0.1862443, 1, 1, 1, 1, 1,
1.053381, -0.7322928, 1.72492, 1, 1, 1, 1, 1,
1.053855, 1.220917, 0.5383561, 1, 1, 1, 1, 1,
1.063851, 0.4976642, 1.006423, 1, 1, 1, 1, 1,
1.064981, 1.17187, 0.4863673, 1, 1, 1, 1, 1,
1.070182, -0.5893441, 2.895299, 1, 1, 1, 1, 1,
1.077405, -0.9181468, 2.854808, 1, 1, 1, 1, 1,
1.085211, 0.05272117, 1.81712, 1, 1, 1, 1, 1,
1.086331, -1.166993, 5.065897, 1, 1, 1, 1, 1,
1.10455, 0.5184443, 0.993564, 1, 1, 1, 1, 1,
1.104579, -1.44055, 1.427652, 1, 1, 1, 1, 1,
1.134755, 0.05839463, 0.03422092, 1, 1, 1, 1, 1,
1.135698, 0.2303513, 0.3819013, 0, 0, 1, 1, 1,
1.136147, -0.7831442, 1.483784, 1, 0, 0, 1, 1,
1.140049, 0.8621901, -0.4533629, 1, 0, 0, 1, 1,
1.155979, 1.715278, 0.5649258, 1, 0, 0, 1, 1,
1.159526, -3.002384, 3.052417, 1, 0, 0, 1, 1,
1.164244, -0.9389279, 1.555867, 1, 0, 0, 1, 1,
1.165766, 0.6975843, -0.3463438, 0, 0, 0, 1, 1,
1.171898, -0.8362862, 2.516028, 0, 0, 0, 1, 1,
1.173496, 0.2087097, 0.4878829, 0, 0, 0, 1, 1,
1.178902, -0.5879378, 1.610121, 0, 0, 0, 1, 1,
1.180695, -1.183163, 2.311721, 0, 0, 0, 1, 1,
1.18227, -0.5353115, 3.392225, 0, 0, 0, 1, 1,
1.185724, -1.219299, 5.520391, 0, 0, 0, 1, 1,
1.187775, 1.397029, 0.7693087, 1, 1, 1, 1, 1,
1.193336, 0.8091939, 0.1260389, 1, 1, 1, 1, 1,
1.195856, -1.790708, 0.938304, 1, 1, 1, 1, 1,
1.198921, 0.3459799, 0.9277353, 1, 1, 1, 1, 1,
1.199418, 1.297225, 0.5071033, 1, 1, 1, 1, 1,
1.199562, 0.9349136, 0.3012842, 1, 1, 1, 1, 1,
1.203053, -1.18955, 2.90995, 1, 1, 1, 1, 1,
1.207994, -0.3569123, 0.8319698, 1, 1, 1, 1, 1,
1.211797, 0.8827444, 1.381306, 1, 1, 1, 1, 1,
1.217666, -0.6010843, 1.382289, 1, 1, 1, 1, 1,
1.223572, 0.5244561, 2.915172, 1, 1, 1, 1, 1,
1.234753, 1.604676, 1.546241, 1, 1, 1, 1, 1,
1.248611, 1.982598, 1.475669, 1, 1, 1, 1, 1,
1.249055, -0.9605601, 2.357641, 1, 1, 1, 1, 1,
1.264623, 0.9040257, 2.074396, 1, 1, 1, 1, 1,
1.267764, 0.2619636, 0.1944251, 0, 0, 1, 1, 1,
1.268407, 0.7081912, 1.15444, 1, 0, 0, 1, 1,
1.274957, -0.1615115, 1.338767, 1, 0, 0, 1, 1,
1.292016, -0.3555018, 3.960093, 1, 0, 0, 1, 1,
1.29935, -0.6137903, 1.016916, 1, 0, 0, 1, 1,
1.30006, -0.6244693, 1.975217, 1, 0, 0, 1, 1,
1.302652, 0.2650519, -0.00291688, 0, 0, 0, 1, 1,
1.313976, 0.722288, -0.5051136, 0, 0, 0, 1, 1,
1.31738, 0.6726814, 0.7887179, 0, 0, 0, 1, 1,
1.327517, -0.3410456, 2.019772, 0, 0, 0, 1, 1,
1.342528, -0.3578321, 2.570203, 0, 0, 0, 1, 1,
1.348891, 0.7017773, 1.630243, 0, 0, 0, 1, 1,
1.349021, 1.474159, 2.6026, 0, 0, 0, 1, 1,
1.356545, -0.02705881, 0.7018933, 1, 1, 1, 1, 1,
1.357241, -1.822781, 2.182546, 1, 1, 1, 1, 1,
1.369241, -0.9679877, 1.836574, 1, 1, 1, 1, 1,
1.373942, -0.4588179, 3.647291, 1, 1, 1, 1, 1,
1.384149, -1.72361, 1.386101, 1, 1, 1, 1, 1,
1.384812, 0.4911957, -0.1834133, 1, 1, 1, 1, 1,
1.385559, -0.8225943, 1.07497, 1, 1, 1, 1, 1,
1.388796, 1.353932, 1.12448, 1, 1, 1, 1, 1,
1.389391, -0.6001345, 3.171424, 1, 1, 1, 1, 1,
1.396947, 0.2022277, 1.928337, 1, 1, 1, 1, 1,
1.403925, -1.074214, 3.642379, 1, 1, 1, 1, 1,
1.406911, 0.3173253, 0.4474683, 1, 1, 1, 1, 1,
1.40837, 0.2021001, 2.984838, 1, 1, 1, 1, 1,
1.414163, -0.008411556, 1.377294, 1, 1, 1, 1, 1,
1.414754, -0.4145352, 0.4108978, 1, 1, 1, 1, 1,
1.414778, -0.8404103, 1.012913, 0, 0, 1, 1, 1,
1.416119, -0.2690788, 2.281313, 1, 0, 0, 1, 1,
1.416866, 0.7192462, 0.8094765, 1, 0, 0, 1, 1,
1.433043, 2.582987, 0.9878621, 1, 0, 0, 1, 1,
1.463352, 0.4767368, 1.990403, 1, 0, 0, 1, 1,
1.46831, 0.4636751, 1.256258, 1, 0, 0, 1, 1,
1.471443, 0.1499406, 0.4475706, 0, 0, 0, 1, 1,
1.471758, 0.9053926, 1.984472, 0, 0, 0, 1, 1,
1.473112, -1.788773, -0.2638622, 0, 0, 0, 1, 1,
1.473933, 0.01567167, 2.046545, 0, 0, 0, 1, 1,
1.474033, -0.4440406, 2.505766, 0, 0, 0, 1, 1,
1.488154, -0.5802475, 2.003795, 0, 0, 0, 1, 1,
1.51248, 1.402305, -0.3961528, 0, 0, 0, 1, 1,
1.512727, -0.03746436, 2.505695, 1, 1, 1, 1, 1,
1.518568, 1.169847, 1.046518, 1, 1, 1, 1, 1,
1.532246, -0.8250077, 3.393614, 1, 1, 1, 1, 1,
1.553958, 0.3668179, 0.2987372, 1, 1, 1, 1, 1,
1.555604, 0.204809, 1.683846, 1, 1, 1, 1, 1,
1.557974, 0.3538005, 1.989137, 1, 1, 1, 1, 1,
1.562959, -0.6173175, 2.128642, 1, 1, 1, 1, 1,
1.571709, 0.5411001, -0.02992792, 1, 1, 1, 1, 1,
1.571924, -0.1300758, 2.436143, 1, 1, 1, 1, 1,
1.58147, 0.7502214, 1.527104, 1, 1, 1, 1, 1,
1.581884, -0.3390129, 1.090228, 1, 1, 1, 1, 1,
1.583688, 1.451823, -0.04165455, 1, 1, 1, 1, 1,
1.591361, -0.1046043, 1.646075, 1, 1, 1, 1, 1,
1.592237, -1.28688, 3.6561, 1, 1, 1, 1, 1,
1.612561, 0.08026157, 1.572563, 1, 1, 1, 1, 1,
1.617449, -1.065135, 1.125082, 0, 0, 1, 1, 1,
1.622328, -0.4014488, 3.341744, 1, 0, 0, 1, 1,
1.622703, 1.326536, 0.5221086, 1, 0, 0, 1, 1,
1.626303, 1.424693, 0.6206581, 1, 0, 0, 1, 1,
1.628326, -0.289668, 2.891189, 1, 0, 0, 1, 1,
1.654815, 0.7995828, 1.387547, 1, 0, 0, 1, 1,
1.66055, 0.6139852, 1.188255, 0, 0, 0, 1, 1,
1.669755, 1.416972, 0.6102532, 0, 0, 0, 1, 1,
1.691672, 0.3831626, 0.1867803, 0, 0, 0, 1, 1,
1.698812, 0.05371231, 1.500841, 0, 0, 0, 1, 1,
1.702171, -1.557977, 3.082302, 0, 0, 0, 1, 1,
1.712047, -0.8773499, 3.404009, 0, 0, 0, 1, 1,
1.713194, -0.8438277, 1.593808, 0, 0, 0, 1, 1,
1.713819, -0.1181667, 3.698343, 1, 1, 1, 1, 1,
1.722108, 0.6783639, 0.2326754, 1, 1, 1, 1, 1,
1.724915, 0.1416076, 2.653674, 1, 1, 1, 1, 1,
1.724925, 0.08017723, 1.328761, 1, 1, 1, 1, 1,
1.759887, -0.8285303, 1.915759, 1, 1, 1, 1, 1,
1.760245, -1.129718, 1.597711, 1, 1, 1, 1, 1,
1.801647, -0.3670858, 3.400859, 1, 1, 1, 1, 1,
1.814747, -0.9259094, 2.035558, 1, 1, 1, 1, 1,
1.833603, 0.2693742, 0.1012905, 1, 1, 1, 1, 1,
1.848707, 0.4272527, 0.9685708, 1, 1, 1, 1, 1,
1.861029, -0.1819696, 1.470248, 1, 1, 1, 1, 1,
1.866161, 1.004078, 1.11132, 1, 1, 1, 1, 1,
1.90638, 1.152452, 0.4509404, 1, 1, 1, 1, 1,
1.931726, 1.389902, 2.098469, 1, 1, 1, 1, 1,
1.936434, 1.203643, 1.0637, 1, 1, 1, 1, 1,
1.961211, 1.051033, 0.03249498, 0, 0, 1, 1, 1,
1.971132, 1.878173, -0.2742465, 1, 0, 0, 1, 1,
1.994785, 0.1932416, 2.727323, 1, 0, 0, 1, 1,
2.01255, 0.0798857, 2.210679, 1, 0, 0, 1, 1,
2.073078, 0.1128052, 1.969174, 1, 0, 0, 1, 1,
2.084274, 1.499901, -1.658596, 1, 0, 0, 1, 1,
2.123574, -1.243058, 2.162314, 0, 0, 0, 1, 1,
2.169731, -0.5985705, 0.9668242, 0, 0, 0, 1, 1,
2.17919, -0.02246114, 1.08426, 0, 0, 0, 1, 1,
2.182216, 0.1923992, 0.9606382, 0, 0, 0, 1, 1,
2.259622, -0.2998674, 2.960793, 0, 0, 0, 1, 1,
2.272188, -0.5096118, 0.7076626, 0, 0, 0, 1, 1,
2.324958, -0.6214595, 1.728898, 0, 0, 0, 1, 1,
2.352626, 1.055017, 1.147271, 1, 1, 1, 1, 1,
2.402328, -1.041041, 2.537347, 1, 1, 1, 1, 1,
2.408381, -0.7892293, 2.110412, 1, 1, 1, 1, 1,
2.471309, 0.7245185, 3.051157, 1, 1, 1, 1, 1,
2.531012, -0.1068487, 1.393917, 1, 1, 1, 1, 1,
2.909471, -0.2568422, 2.086629, 1, 1, 1, 1, 1,
2.933995, -0.4688928, 1.839397, 1, 1, 1, 1, 1
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
var radius = 9.630327;
var distance = 33.82611;
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
mvMatrix.translate( 0.04541242, -0.1291113, -0.3415246 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.82611);
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