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
-3.654889, -1.187977, -3.499154, 1, 0, 0, 1,
-3.429525, 0.008488343, -0.9850622, 1, 0.007843138, 0, 1,
-2.950416, 0.05966524, -0.3410652, 1, 0.01176471, 0, 1,
-2.911414, -0.8158944, -1.842656, 1, 0.01960784, 0, 1,
-2.573844, 0.8631846, -0.2045606, 1, 0.02352941, 0, 1,
-2.547492, -0.669552, -1.323863, 1, 0.03137255, 0, 1,
-2.522503, -0.7741085, -3.044574, 1, 0.03529412, 0, 1,
-2.500564, 0.1944905, -0.1942363, 1, 0.04313726, 0, 1,
-2.480902, 0.7030885, -1.817445, 1, 0.04705882, 0, 1,
-2.45024, 1.268923, -2.37635, 1, 0.05490196, 0, 1,
-2.441694, 0.6770564, -2.696223, 1, 0.05882353, 0, 1,
-2.428296, -2.505944, -4.120465, 1, 0.06666667, 0, 1,
-2.416192, 0.6217413, -1.440788, 1, 0.07058824, 0, 1,
-2.3574, -0.05894806, -1.052898, 1, 0.07843138, 0, 1,
-2.345461, -1.175063, -1.686639, 1, 0.08235294, 0, 1,
-2.283879, 1.851027, -0.117571, 1, 0.09019608, 0, 1,
-2.186899, -2.180466, -1.356138, 1, 0.09411765, 0, 1,
-2.177677, -0.9863033, -1.340023, 1, 0.1019608, 0, 1,
-2.118103, -0.0259819, -0.2906688, 1, 0.1098039, 0, 1,
-2.10748, 0.8142005, -3.744649, 1, 0.1137255, 0, 1,
-2.107363, 0.6494244, -2.136603, 1, 0.1215686, 0, 1,
-2.07792, 0.4448266, -1.560461, 1, 0.1254902, 0, 1,
-2.06614, 0.2309116, -1.888948, 1, 0.1333333, 0, 1,
-2.060496, -0.1658714, -2.31239, 1, 0.1372549, 0, 1,
-2.032808, -0.7552543, -1.005931, 1, 0.145098, 0, 1,
-2.02851, -0.9602886, -1.242938, 1, 0.1490196, 0, 1,
-2.025361, 0.2729889, -1.876933, 1, 0.1568628, 0, 1,
-2.016557, -0.3154705, 0.3517109, 1, 0.1607843, 0, 1,
-2.011553, -2.108981, -1.095341, 1, 0.1686275, 0, 1,
-2.00327, -0.3609616, -3.109168, 1, 0.172549, 0, 1,
-2.002643, 0.6965605, -1.181768, 1, 0.1803922, 0, 1,
-1.966448, -1.300692, -2.840902, 1, 0.1843137, 0, 1,
-1.954155, 0.8964858, -0.2685484, 1, 0.1921569, 0, 1,
-1.952974, -0.1557883, -2.201103, 1, 0.1960784, 0, 1,
-1.94176, -0.2403101, -1.3262, 1, 0.2039216, 0, 1,
-1.923619, 1.394171, -2.095243, 1, 0.2117647, 0, 1,
-1.919143, 0.1295444, -1.681227, 1, 0.2156863, 0, 1,
-1.894205, 0.8824691, -0.9282495, 1, 0.2235294, 0, 1,
-1.853279, 0.139164, -2.793444, 1, 0.227451, 0, 1,
-1.839362, -1.002487, -2.572528, 1, 0.2352941, 0, 1,
-1.831601, -1.338164, -2.951058, 1, 0.2392157, 0, 1,
-1.812223, 0.05263411, -0.8729708, 1, 0.2470588, 0, 1,
-1.807574, -2.095379, -1.806713, 1, 0.2509804, 0, 1,
-1.805839, 0.5794527, -1.165327, 1, 0.2588235, 0, 1,
-1.759429, 0.3665535, -2.23537, 1, 0.2627451, 0, 1,
-1.758711, -0.6775501, -3.172781, 1, 0.2705882, 0, 1,
-1.756146, -0.8925493, -1.641688, 1, 0.2745098, 0, 1,
-1.749384, 1.2312, 0.6354376, 1, 0.282353, 0, 1,
-1.745116, -0.5461546, -1.858246, 1, 0.2862745, 0, 1,
-1.742537, 1.090227, 0.1631742, 1, 0.2941177, 0, 1,
-1.725348, 0.4566172, 0.5408927, 1, 0.3019608, 0, 1,
-1.715161, 0.2048787, -0.6658768, 1, 0.3058824, 0, 1,
-1.713138, 0.6568016, -2.719277, 1, 0.3137255, 0, 1,
-1.705624, -0.05074525, -2.911742, 1, 0.3176471, 0, 1,
-1.702404, 0.1126321, -1.082551, 1, 0.3254902, 0, 1,
-1.649934, 1.150357, -0.8329597, 1, 0.3294118, 0, 1,
-1.64511, 1.047036, -1.0108, 1, 0.3372549, 0, 1,
-1.627423, -0.1971551, -0.2097651, 1, 0.3411765, 0, 1,
-1.59021, -1.323991, -1.843257, 1, 0.3490196, 0, 1,
-1.585136, -0.7580827, -2.343195, 1, 0.3529412, 0, 1,
-1.583731, -0.1980371, -3.636889, 1, 0.3607843, 0, 1,
-1.576364, 0.120395, -1.696939, 1, 0.3647059, 0, 1,
-1.573975, 0.07060184, -1.200526, 1, 0.372549, 0, 1,
-1.567325, 0.8596448, -2.51965, 1, 0.3764706, 0, 1,
-1.554204, -0.5067148, -3.736244, 1, 0.3843137, 0, 1,
-1.551411, 2.093919, -1.254727, 1, 0.3882353, 0, 1,
-1.547381, 0.2196336, -1.995181, 1, 0.3960784, 0, 1,
-1.532766, 0.09912445, -1.520043, 1, 0.4039216, 0, 1,
-1.529249, -0.192933, -2.420042, 1, 0.4078431, 0, 1,
-1.523044, 0.001138866, -2.369397, 1, 0.4156863, 0, 1,
-1.516505, -0.2224994, -1.898327, 1, 0.4196078, 0, 1,
-1.515879, 1.234116, 0.6025574, 1, 0.427451, 0, 1,
-1.511366, -0.2703485, -3.698123, 1, 0.4313726, 0, 1,
-1.505111, -0.2087136, -0.2964507, 1, 0.4392157, 0, 1,
-1.49145, 1.050127, 0.3184444, 1, 0.4431373, 0, 1,
-1.479281, -0.8010501, -2.680664, 1, 0.4509804, 0, 1,
-1.477845, 0.3656795, -1.063544, 1, 0.454902, 0, 1,
-1.475266, -0.05376843, -1.929346, 1, 0.4627451, 0, 1,
-1.455909, 1.185562, -1.481691, 1, 0.4666667, 0, 1,
-1.453437, -0.3126099, -1.265553, 1, 0.4745098, 0, 1,
-1.450974, 0.0002606769, -2.900022, 1, 0.4784314, 0, 1,
-1.441665, -0.6831884, -1.901743, 1, 0.4862745, 0, 1,
-1.437809, 0.5505621, -2.353223, 1, 0.4901961, 0, 1,
-1.429471, -0.8129953, -1.268913, 1, 0.4980392, 0, 1,
-1.41652, -0.3108625, -3.588677, 1, 0.5058824, 0, 1,
-1.413731, 0.3010083, -2.223812, 1, 0.509804, 0, 1,
-1.411972, -0.4335721, -2.443362, 1, 0.5176471, 0, 1,
-1.410272, -0.8421958, -1.673876, 1, 0.5215687, 0, 1,
-1.407066, -0.2611855, 0.1213369, 1, 0.5294118, 0, 1,
-1.406681, -0.7976028, -4.750202, 1, 0.5333334, 0, 1,
-1.373939, -0.6621911, -0.8925651, 1, 0.5411765, 0, 1,
-1.370472, 0.4584702, -0.8080329, 1, 0.5450981, 0, 1,
-1.369833, 0.6550638, -1.641785, 1, 0.5529412, 0, 1,
-1.368703, 0.3341681, -0.4068979, 1, 0.5568628, 0, 1,
-1.359212, 0.8364365, -1.355684, 1, 0.5647059, 0, 1,
-1.346864, -0.718293, -0.9845369, 1, 0.5686275, 0, 1,
-1.346797, -0.9857571, -2.261663, 1, 0.5764706, 0, 1,
-1.335509, -0.5408465, -1.597045, 1, 0.5803922, 0, 1,
-1.332411, 2.041383, 0.05209458, 1, 0.5882353, 0, 1,
-1.331138, -0.3413966, -1.201319, 1, 0.5921569, 0, 1,
-1.319924, 0.8346973, -2.662155, 1, 0.6, 0, 1,
-1.319861, 1.212421, -1.597213, 1, 0.6078432, 0, 1,
-1.31697, 0.2282676, -1.538762, 1, 0.6117647, 0, 1,
-1.312686, 0.5203846, -1.231657, 1, 0.6196079, 0, 1,
-1.312562, -0.2869513, -0.480556, 1, 0.6235294, 0, 1,
-1.31088, 1.58376, -0.691277, 1, 0.6313726, 0, 1,
-1.310419, 0.3533894, -0.8374415, 1, 0.6352941, 0, 1,
-1.310276, -0.8696684, -2.243215, 1, 0.6431373, 0, 1,
-1.309722, 0.1871, -2.774829, 1, 0.6470588, 0, 1,
-1.30474, 0.1546157, -1.501688, 1, 0.654902, 0, 1,
-1.303274, 0.5222794, -0.3611598, 1, 0.6588235, 0, 1,
-1.296112, -1.38173, -1.489058, 1, 0.6666667, 0, 1,
-1.281467, -1.801435, -1.841601, 1, 0.6705883, 0, 1,
-1.277138, -0.4251422, -3.18752, 1, 0.6784314, 0, 1,
-1.274594, -0.4441392, -2.658477, 1, 0.682353, 0, 1,
-1.264376, 0.7885726, 0.1772771, 1, 0.6901961, 0, 1,
-1.261436, -0.05164074, -1.61806, 1, 0.6941177, 0, 1,
-1.259618, -0.5279911, -2.07275, 1, 0.7019608, 0, 1,
-1.255279, 0.1829809, -2.431727, 1, 0.7098039, 0, 1,
-1.254683, -0.2647183, -1.580255, 1, 0.7137255, 0, 1,
-1.246948, -0.2342361, -2.977752, 1, 0.7215686, 0, 1,
-1.23939, 1.3106, 0.3601058, 1, 0.7254902, 0, 1,
-1.238279, -0.22994, -0.1300873, 1, 0.7333333, 0, 1,
-1.224731, 0.4427212, 1.7776, 1, 0.7372549, 0, 1,
-1.224644, -0.05821185, 0.3317799, 1, 0.7450981, 0, 1,
-1.224603, 2.375018, -0.7402232, 1, 0.7490196, 0, 1,
-1.223315, -1.252251, -1.844918, 1, 0.7568628, 0, 1,
-1.222998, 0.2960086, -2.090816, 1, 0.7607843, 0, 1,
-1.222922, -1.793246, -2.227384, 1, 0.7686275, 0, 1,
-1.21366, 1.238086, 0.4070839, 1, 0.772549, 0, 1,
-1.20769, -1.105382, -2.164166, 1, 0.7803922, 0, 1,
-1.205503, 0.6539136, -1.122893, 1, 0.7843137, 0, 1,
-1.189756, 0.7966208, -2.995442, 1, 0.7921569, 0, 1,
-1.189015, 1.033425, -0.5917116, 1, 0.7960784, 0, 1,
-1.186937, 1.288934, -2.129516, 1, 0.8039216, 0, 1,
-1.18662, 0.6563759, -0.4098897, 1, 0.8117647, 0, 1,
-1.184768, -0.5127869, -0.4552951, 1, 0.8156863, 0, 1,
-1.180482, 0.1111375, -2.913965, 1, 0.8235294, 0, 1,
-1.177418, -1.465738, -1.36648, 1, 0.827451, 0, 1,
-1.170427, -0.3586331, -0.9766719, 1, 0.8352941, 0, 1,
-1.161994, 1.340799, -0.4872139, 1, 0.8392157, 0, 1,
-1.159953, 0.8527804, 0.6886058, 1, 0.8470588, 0, 1,
-1.155659, -1.655153, -2.464284, 1, 0.8509804, 0, 1,
-1.152628, 0.5218316, -1.177103, 1, 0.8588235, 0, 1,
-1.140855, 0.2998526, -1.316831, 1, 0.8627451, 0, 1,
-1.137447, -0.1308513, -1.963649, 1, 0.8705882, 0, 1,
-1.132841, 0.04594256, -2.791, 1, 0.8745098, 0, 1,
-1.129013, -0.1156611, -2.468368, 1, 0.8823529, 0, 1,
-1.127379, 1.309988, -0.9257586, 1, 0.8862745, 0, 1,
-1.127351, -0.440767, -1.519323, 1, 0.8941177, 0, 1,
-1.123919, 0.3297514, -1.2317, 1, 0.8980392, 0, 1,
-1.113706, 1.30126, 0.8820161, 1, 0.9058824, 0, 1,
-1.105532, 2.043366, -0.5712644, 1, 0.9137255, 0, 1,
-1.104048, -1.117567, -0.4773564, 1, 0.9176471, 0, 1,
-1.103399, -0.2578777, -2.787404, 1, 0.9254902, 0, 1,
-1.095594, 0.5141926, -1.647445, 1, 0.9294118, 0, 1,
-1.084001, -0.2023247, -1.416376, 1, 0.9372549, 0, 1,
-1.079945, -0.9198515, -3.064003, 1, 0.9411765, 0, 1,
-1.071269, 1.017592, -0.3856848, 1, 0.9490196, 0, 1,
-1.064334, -1.753314, -1.543765, 1, 0.9529412, 0, 1,
-1.063541, 0.368017, -1.845845, 1, 0.9607843, 0, 1,
-1.063463, -0.7556821, -1.689677, 1, 0.9647059, 0, 1,
-1.054932, -1.03328, -0.8795604, 1, 0.972549, 0, 1,
-1.05136, -0.6105185, -0.5418532, 1, 0.9764706, 0, 1,
-1.048494, -1.392367, -1.730906, 1, 0.9843137, 0, 1,
-1.043634, -1.102862, -2.204478, 1, 0.9882353, 0, 1,
-1.043342, 0.2382624, -1.499492, 1, 0.9960784, 0, 1,
-1.040176, -0.7333303, -2.5776, 0.9960784, 1, 0, 1,
-1.037517, -2.012252, -4.177112, 0.9921569, 1, 0, 1,
-1.036713, 0.5057755, -2.380399, 0.9843137, 1, 0, 1,
-1.036452, -1.513732, -1.446643, 0.9803922, 1, 0, 1,
-1.035507, 0.3058527, 0.02684938, 0.972549, 1, 0, 1,
-1.034862, 0.3437787, -1.661131, 0.9686275, 1, 0, 1,
-1.019277, -1.013666, -0.7703974, 0.9607843, 1, 0, 1,
-1.01867, -0.8751895, -3.269124, 0.9568627, 1, 0, 1,
-1.017615, 0.1772458, -0.5513186, 0.9490196, 1, 0, 1,
-1.013766, -2.510288, -1.590549, 0.945098, 1, 0, 1,
-1.013523, -0.8728591, -1.992735, 0.9372549, 1, 0, 1,
-1.012789, -0.4589558, -3.797879, 0.9333333, 1, 0, 1,
-1.011639, 2.024628, 0.4850615, 0.9254902, 1, 0, 1,
-1.003427, -0.2974945, -2.282198, 0.9215686, 1, 0, 1,
-1.001714, 0.618719, -0.00341891, 0.9137255, 1, 0, 1,
-0.9930612, 0.06673128, -1.714953, 0.9098039, 1, 0, 1,
-0.9772025, -1.19194, -2.872593, 0.9019608, 1, 0, 1,
-0.9765087, -0.2105902, -1.720709, 0.8941177, 1, 0, 1,
-0.9749249, 1.081396, -0.1935199, 0.8901961, 1, 0, 1,
-0.9748282, 0.7640772, 0.2033949, 0.8823529, 1, 0, 1,
-0.9706455, 0.6663648, -0.4269076, 0.8784314, 1, 0, 1,
-0.9695699, 0.8799428, -2.065018, 0.8705882, 1, 0, 1,
-0.9694962, -0.5159179, -2.10236, 0.8666667, 1, 0, 1,
-0.9672004, 0.9047332, -0.8395997, 0.8588235, 1, 0, 1,
-0.9517652, 0.7827953, -0.7561314, 0.854902, 1, 0, 1,
-0.951632, 0.9297954, 0.5979975, 0.8470588, 1, 0, 1,
-0.9488062, 0.09232929, -2.38344, 0.8431373, 1, 0, 1,
-0.9444441, 1.116181, -1.185862, 0.8352941, 1, 0, 1,
-0.9422743, -0.8358091, -1.632137, 0.8313726, 1, 0, 1,
-0.9404261, 1.754791, -0.5934837, 0.8235294, 1, 0, 1,
-0.934306, 0.9627051, -1.18482, 0.8196079, 1, 0, 1,
-0.9317726, -0.2206324, -2.121102, 0.8117647, 1, 0, 1,
-0.9265949, -1.121275, -2.262244, 0.8078431, 1, 0, 1,
-0.9239929, 0.7297331, 0.8555538, 0.8, 1, 0, 1,
-0.9235587, -0.3473208, -1.728887, 0.7921569, 1, 0, 1,
-0.9231083, 1.667561, -1.24329, 0.7882353, 1, 0, 1,
-0.9168155, -1.097726, -5.040462, 0.7803922, 1, 0, 1,
-0.9146981, -0.734937, -1.683936, 0.7764706, 1, 0, 1,
-0.9120979, -0.2433806, -2.091928, 0.7686275, 1, 0, 1,
-0.902511, 0.8438794, -1.225907, 0.7647059, 1, 0, 1,
-0.8980998, 1.62567, 0.1328877, 0.7568628, 1, 0, 1,
-0.8912318, 0.2729329, -1.174657, 0.7529412, 1, 0, 1,
-0.8855618, -0.5975647, -3.098145, 0.7450981, 1, 0, 1,
-0.8722383, 0.3714091, -1.915419, 0.7411765, 1, 0, 1,
-0.8694738, -0.585502, -0.341834, 0.7333333, 1, 0, 1,
-0.8611197, -1.046309, -3.462802, 0.7294118, 1, 0, 1,
-0.8585888, -0.1874732, -2.110663, 0.7215686, 1, 0, 1,
-0.8542342, -0.3936543, -4.295789, 0.7176471, 1, 0, 1,
-0.8505554, 1.833672, -0.01348017, 0.7098039, 1, 0, 1,
-0.8429135, 0.1754735, -0.8812913, 0.7058824, 1, 0, 1,
-0.8385915, 0.624719, -0.1135236, 0.6980392, 1, 0, 1,
-0.8235927, 0.1567234, 0.8103314, 0.6901961, 1, 0, 1,
-0.8221279, 1.42198, 0.04835703, 0.6862745, 1, 0, 1,
-0.8220792, 0.8003601, 0.2051571, 0.6784314, 1, 0, 1,
-0.8220282, -0.3316899, -2.624718, 0.6745098, 1, 0, 1,
-0.8113434, 1.183007, -0.7835671, 0.6666667, 1, 0, 1,
-0.8067724, -1.001535, -3.327936, 0.6627451, 1, 0, 1,
-0.8024024, -0.703564, -2.563506, 0.654902, 1, 0, 1,
-0.7967637, 0.9313256, -1.494858, 0.6509804, 1, 0, 1,
-0.7912081, -0.3728911, -2.580348, 0.6431373, 1, 0, 1,
-0.789031, 0.9205476, -2.636412, 0.6392157, 1, 0, 1,
-0.7866259, -0.6977572, -2.262527, 0.6313726, 1, 0, 1,
-0.7803615, 0.4529206, -0.4826305, 0.627451, 1, 0, 1,
-0.7757383, -0.7221465, -0.6203595, 0.6196079, 1, 0, 1,
-0.7735498, -1.392508, -1.079027, 0.6156863, 1, 0, 1,
-0.7724131, -0.7579986, -0.5106623, 0.6078432, 1, 0, 1,
-0.7721457, 0.6546512, -0.9310932, 0.6039216, 1, 0, 1,
-0.7706066, 1.656387, -0.7278925, 0.5960785, 1, 0, 1,
-0.7658442, 1.338141, 0.6191526, 0.5882353, 1, 0, 1,
-0.765048, -1.042493, -2.461512, 0.5843138, 1, 0, 1,
-0.7649254, 0.4535329, -1.365846, 0.5764706, 1, 0, 1,
-0.7583641, 0.2996965, -2.829354, 0.572549, 1, 0, 1,
-0.7490641, 0.8753047, -0.7550539, 0.5647059, 1, 0, 1,
-0.7360018, -0.3013062, -1.088607, 0.5607843, 1, 0, 1,
-0.7344421, -1.095928, -3.143471, 0.5529412, 1, 0, 1,
-0.7280606, -0.1116028, -0.9463829, 0.5490196, 1, 0, 1,
-0.7250928, 1.107345, -1.315958, 0.5411765, 1, 0, 1,
-0.7204192, 1.525506, -0.7385159, 0.5372549, 1, 0, 1,
-0.7100386, -0.8426767, -4.126927, 0.5294118, 1, 0, 1,
-0.705945, 0.9044015, -2.89006, 0.5254902, 1, 0, 1,
-0.702855, 0.2531245, -0.9254767, 0.5176471, 1, 0, 1,
-0.6862404, 0.2666461, -0.4459901, 0.5137255, 1, 0, 1,
-0.6842583, -0.7469996, -2.721735, 0.5058824, 1, 0, 1,
-0.6828338, -0.09982502, -1.370957, 0.5019608, 1, 0, 1,
-0.6815288, -1.032992, -3.133164, 0.4941176, 1, 0, 1,
-0.6719181, -2.138628, -1.992005, 0.4862745, 1, 0, 1,
-0.6697271, -0.4585122, -2.988639, 0.4823529, 1, 0, 1,
-0.663552, -0.8326755, -3.452823, 0.4745098, 1, 0, 1,
-0.6480188, -0.2750955, -2.414385, 0.4705882, 1, 0, 1,
-0.6470156, 1.921693, 0.7577306, 0.4627451, 1, 0, 1,
-0.6408867, -1.24685, -2.537894, 0.4588235, 1, 0, 1,
-0.6329803, -0.2558848, -1.903582, 0.4509804, 1, 0, 1,
-0.6305074, -0.4248255, -3.853665, 0.4470588, 1, 0, 1,
-0.629604, 0.465622, -1.947853, 0.4392157, 1, 0, 1,
-0.6281784, 0.07777461, -0.3896097, 0.4352941, 1, 0, 1,
-0.6229831, 2.380929, -0.7683408, 0.427451, 1, 0, 1,
-0.6223641, 1.520175, -2.205945, 0.4235294, 1, 0, 1,
-0.6221686, -0.540599, -2.39811, 0.4156863, 1, 0, 1,
-0.6200683, 1.447147, -0.5682823, 0.4117647, 1, 0, 1,
-0.6162524, -0.05266739, -0.3724819, 0.4039216, 1, 0, 1,
-0.610561, -0.1465771, -0.9315405, 0.3960784, 1, 0, 1,
-0.6086541, 0.4433104, 0.3894607, 0.3921569, 1, 0, 1,
-0.605633, -1.425951, -3.566322, 0.3843137, 1, 0, 1,
-0.6019998, -1.781698, -2.056628, 0.3803922, 1, 0, 1,
-0.5974981, 0.9804063, -1.302589, 0.372549, 1, 0, 1,
-0.5927899, -1.515734, -4.428213, 0.3686275, 1, 0, 1,
-0.5884451, 0.2999549, -1.071271, 0.3607843, 1, 0, 1,
-0.586512, 0.9342055, -2.324946, 0.3568628, 1, 0, 1,
-0.5852808, -1.399822, -4.149279, 0.3490196, 1, 0, 1,
-0.5836662, 1.731224, -1.328715, 0.345098, 1, 0, 1,
-0.5787649, 0.7032124, -0.2475167, 0.3372549, 1, 0, 1,
-0.5785191, -0.9638001, -1.812059, 0.3333333, 1, 0, 1,
-0.5783235, -0.3256268, -2.027017, 0.3254902, 1, 0, 1,
-0.5754632, 0.3517879, -0.5021787, 0.3215686, 1, 0, 1,
-0.5745683, 1.098001, -0.5455226, 0.3137255, 1, 0, 1,
-0.5737467, 0.04298685, -0.3699276, 0.3098039, 1, 0, 1,
-0.5714917, 0.8035859, -0.9041065, 0.3019608, 1, 0, 1,
-0.5712776, -0.6909753, -0.7810788, 0.2941177, 1, 0, 1,
-0.5636929, -0.05392643, -0.4988875, 0.2901961, 1, 0, 1,
-0.5579019, 0.9267584, -0.6115515, 0.282353, 1, 0, 1,
-0.5534353, 0.6105248, -0.2043963, 0.2784314, 1, 0, 1,
-0.5533989, 0.4262731, -2.260589, 0.2705882, 1, 0, 1,
-0.5508645, 0.3535517, -0.6597335, 0.2666667, 1, 0, 1,
-0.5469865, -0.1122136, -0.2539432, 0.2588235, 1, 0, 1,
-0.536292, 0.08214585, -0.682531, 0.254902, 1, 0, 1,
-0.5321811, 1.022193, 0.6961914, 0.2470588, 1, 0, 1,
-0.5260189, -2.22267, -2.488315, 0.2431373, 1, 0, 1,
-0.5228677, -0.4388692, -1.065533, 0.2352941, 1, 0, 1,
-0.5187282, -0.8737295, -4.967701, 0.2313726, 1, 0, 1,
-0.5055279, -0.31725, -1.137127, 0.2235294, 1, 0, 1,
-0.5047856, -0.4458964, -1.847204, 0.2196078, 1, 0, 1,
-0.502919, 1.314188, -0.03100044, 0.2117647, 1, 0, 1,
-0.501884, -1.151703, -1.139163, 0.2078431, 1, 0, 1,
-0.5016816, 0.5095622, -0.009498762, 0.2, 1, 0, 1,
-0.4916937, 1.213262, -0.9374965, 0.1921569, 1, 0, 1,
-0.4840467, -1.171166, -3.320804, 0.1882353, 1, 0, 1,
-0.4821161, -0.352265, 0.7030038, 0.1803922, 1, 0, 1,
-0.4780899, 1.030498, -0.07530924, 0.1764706, 1, 0, 1,
-0.4761375, -0.8009059, -2.33923, 0.1686275, 1, 0, 1,
-0.4740953, 0.1221355, -0.824766, 0.1647059, 1, 0, 1,
-0.4705032, 0.631637, -0.3943471, 0.1568628, 1, 0, 1,
-0.4697743, -0.4962962, -2.905656, 0.1529412, 1, 0, 1,
-0.4695387, -0.6741145, -2.555743, 0.145098, 1, 0, 1,
-0.4690254, -0.4740057, -1.909011, 0.1411765, 1, 0, 1,
-0.4678001, 1.618747, -0.2782929, 0.1333333, 1, 0, 1,
-0.4554375, 0.5138956, -0.7824252, 0.1294118, 1, 0, 1,
-0.4517352, 0.3465375, -2.565577, 0.1215686, 1, 0, 1,
-0.4471153, 0.1057753, -1.056123, 0.1176471, 1, 0, 1,
-0.4443856, 0.1884767, -1.974179, 0.1098039, 1, 0, 1,
-0.4423993, -0.508979, -2.39703, 0.1058824, 1, 0, 1,
-0.4398493, 1.069802, 0.6151748, 0.09803922, 1, 0, 1,
-0.4362878, 0.8880975, -0.7402326, 0.09019608, 1, 0, 1,
-0.4316231, -0.2836589, 0.409444, 0.08627451, 1, 0, 1,
-0.430119, 1.286662, -0.2491044, 0.07843138, 1, 0, 1,
-0.4263131, 0.02331603, -1.654015, 0.07450981, 1, 0, 1,
-0.42182, -0.2797295, -4.168154, 0.06666667, 1, 0, 1,
-0.4157243, 0.2437863, 0.3765742, 0.0627451, 1, 0, 1,
-0.4130156, -0.2028681, -1.877023, 0.05490196, 1, 0, 1,
-0.4117182, 0.08089431, -1.56613, 0.05098039, 1, 0, 1,
-0.409771, -0.1467433, -2.256422, 0.04313726, 1, 0, 1,
-0.4069163, -1.040052, -3.293321, 0.03921569, 1, 0, 1,
-0.4054183, 0.4142181, 0.02629433, 0.03137255, 1, 0, 1,
-0.4040511, 0.2581987, 0.139431, 0.02745098, 1, 0, 1,
-0.4030499, 0.2093625, -0.6061399, 0.01960784, 1, 0, 1,
-0.4002104, -0.2448932, -2.362214, 0.01568628, 1, 0, 1,
-0.3982354, -1.743381, -2.254548, 0.007843138, 1, 0, 1,
-0.3959498, -0.2196522, -2.975291, 0.003921569, 1, 0, 1,
-0.3950272, 1.689013, -2.048023, 0, 1, 0.003921569, 1,
-0.3937696, -0.3184474, -2.579678, 0, 1, 0.01176471, 1,
-0.3928441, -0.08818913, -2.488697, 0, 1, 0.01568628, 1,
-0.3845908, -0.5719525, -2.767421, 0, 1, 0.02352941, 1,
-0.3845681, -0.01156584, -2.296693, 0, 1, 0.02745098, 1,
-0.3819787, 1.014737, 0.433861, 0, 1, 0.03529412, 1,
-0.3791428, 0.3234243, -2.53411, 0, 1, 0.03921569, 1,
-0.3789783, -1.041785, -3.137004, 0, 1, 0.04705882, 1,
-0.3787064, -1.081892, -1.880739, 0, 1, 0.05098039, 1,
-0.3741284, 0.7056261, -1.640325, 0, 1, 0.05882353, 1,
-0.369673, 1.377941, -1.753847, 0, 1, 0.0627451, 1,
-0.3645765, -0.004153029, -1.707646, 0, 1, 0.07058824, 1,
-0.364239, 2.400132, 0.6211429, 0, 1, 0.07450981, 1,
-0.357805, -1.595929, -2.534205, 0, 1, 0.08235294, 1,
-0.3530414, -1.232183, -3.807956, 0, 1, 0.08627451, 1,
-0.3525153, 1.731059, 0.04864316, 0, 1, 0.09411765, 1,
-0.3517469, -0.597784, -1.134465, 0, 1, 0.1019608, 1,
-0.3504609, 0.6663976, -1.552532, 0, 1, 0.1058824, 1,
-0.3481961, -1.197261, -4.690335, 0, 1, 0.1137255, 1,
-0.3453408, -0.2838652, -2.72283, 0, 1, 0.1176471, 1,
-0.3395492, -0.8119339, -2.704452, 0, 1, 0.1254902, 1,
-0.3355661, 0.9272254, 1.927158, 0, 1, 0.1294118, 1,
-0.3348463, 0.4753442, -3.688671, 0, 1, 0.1372549, 1,
-0.3268677, 0.3841999, 1.398757, 0, 1, 0.1411765, 1,
-0.3248855, 0.1942602, -1.99769, 0, 1, 0.1490196, 1,
-0.3230844, -1.178424, -1.684646, 0, 1, 0.1529412, 1,
-0.3221799, -0.7964204, -3.312152, 0, 1, 0.1607843, 1,
-0.3180563, -0.04602317, -0.5265884, 0, 1, 0.1647059, 1,
-0.3091591, 1.3424, 0.2460483, 0, 1, 0.172549, 1,
-0.3088684, -1.359257, -4.831642, 0, 1, 0.1764706, 1,
-0.3072734, 0.404336, -2.102522, 0, 1, 0.1843137, 1,
-0.3061633, -0.0687549, -1.576375, 0, 1, 0.1882353, 1,
-0.3054524, -1.047142, -2.021359, 0, 1, 0.1960784, 1,
-0.29813, -1.107156, -2.132277, 0, 1, 0.2039216, 1,
-0.2973498, 0.8687022, 0.8606049, 0, 1, 0.2078431, 1,
-0.293391, -0.6894723, -2.967811, 0, 1, 0.2156863, 1,
-0.2902984, -0.6580829, -2.44235, 0, 1, 0.2196078, 1,
-0.2836856, 1.023866, -1.171806, 0, 1, 0.227451, 1,
-0.2767954, -2.401368, -4.816629, 0, 1, 0.2313726, 1,
-0.2726707, 1.573027, 0.8323045, 0, 1, 0.2392157, 1,
-0.2723572, 0.8371903, -1.656396, 0, 1, 0.2431373, 1,
-0.2695987, 0.6936963, 1.024612, 0, 1, 0.2509804, 1,
-0.2683052, 0.6258728, -0.7435294, 0, 1, 0.254902, 1,
-0.2655374, 0.4681717, 1.246119, 0, 1, 0.2627451, 1,
-0.2638048, -0.5199158, -3.601562, 0, 1, 0.2666667, 1,
-0.259754, -0.959133, -1.846421, 0, 1, 0.2745098, 1,
-0.2594656, 1.299729, -0.2164263, 0, 1, 0.2784314, 1,
-0.2583688, 0.3360388, 0.04039049, 0, 1, 0.2862745, 1,
-0.2572397, -0.9879669, -3.645698, 0, 1, 0.2901961, 1,
-0.2502588, -1.235498, -3.015964, 0, 1, 0.2980392, 1,
-0.249049, -1.238349, -1.15091, 0, 1, 0.3058824, 1,
-0.2450632, 0.5792173, -1.866459, 0, 1, 0.3098039, 1,
-0.2446078, -1.269046, -2.744089, 0, 1, 0.3176471, 1,
-0.2444293, 0.1142487, -0.2478788, 0, 1, 0.3215686, 1,
-0.2443651, -0.4979737, -1.641688, 0, 1, 0.3294118, 1,
-0.2428558, 0.9585267, -1.265912, 0, 1, 0.3333333, 1,
-0.2400967, -0.5321431, -2.26857, 0, 1, 0.3411765, 1,
-0.2399444, 0.608116, -2.428872, 0, 1, 0.345098, 1,
-0.2395074, -0.5043078, -1.611283, 0, 1, 0.3529412, 1,
-0.2367341, -0.1249902, -3.718634, 0, 1, 0.3568628, 1,
-0.2325535, 2.135484, -0.5444067, 0, 1, 0.3647059, 1,
-0.2274094, -0.4567265, -2.409919, 0, 1, 0.3686275, 1,
-0.2215645, 0.129947, -0.8183937, 0, 1, 0.3764706, 1,
-0.2186928, 1.038754, -1.480349, 0, 1, 0.3803922, 1,
-0.2179215, 0.6726608, 0.2052805, 0, 1, 0.3882353, 1,
-0.2148923, -0.0372655, -1.933739, 0, 1, 0.3921569, 1,
-0.2127419, 0.834153, 1.532739, 0, 1, 0.4, 1,
-0.2116607, 1.658624, 0.3624152, 0, 1, 0.4078431, 1,
-0.2109456, 0.4426546, -0.608359, 0, 1, 0.4117647, 1,
-0.2081429, -0.2228346, -1.808039, 0, 1, 0.4196078, 1,
-0.2062793, -0.04034066, -2.10851, 0, 1, 0.4235294, 1,
-0.1991564, 0.3368005, -0.9770311, 0, 1, 0.4313726, 1,
-0.1984299, -1.071018, -3.395128, 0, 1, 0.4352941, 1,
-0.1980933, -0.61542, -0.9593665, 0, 1, 0.4431373, 1,
-0.1974472, 0.6667487, -0.6595035, 0, 1, 0.4470588, 1,
-0.189873, -0.2159334, -0.2047859, 0, 1, 0.454902, 1,
-0.1883439, 0.6954567, -0.01435961, 0, 1, 0.4588235, 1,
-0.1806654, 0.2668076, 1.332945, 0, 1, 0.4666667, 1,
-0.1790697, -0.2517555, -4.771899, 0, 1, 0.4705882, 1,
-0.1745328, -0.3338849, -0.7921244, 0, 1, 0.4784314, 1,
-0.1646535, -0.1674119, -2.416279, 0, 1, 0.4823529, 1,
-0.1616989, 0.7588707, -0.9229823, 0, 1, 0.4901961, 1,
-0.1546109, -1.963673, -2.029723, 0, 1, 0.4941176, 1,
-0.1511871, -0.2804177, -2.441188, 0, 1, 0.5019608, 1,
-0.147862, 0.02274431, -0.9855549, 0, 1, 0.509804, 1,
-0.1473601, -1.178889, -4.359448, 0, 1, 0.5137255, 1,
-0.14565, -0.7170122, -3.916348, 0, 1, 0.5215687, 1,
-0.1428307, -0.3116624, -0.3787583, 0, 1, 0.5254902, 1,
-0.1424797, -0.2511771, -2.565292, 0, 1, 0.5333334, 1,
-0.1414445, 0.9752578, -0.7798609, 0, 1, 0.5372549, 1,
-0.140955, 0.08735094, -0.9117926, 0, 1, 0.5450981, 1,
-0.1385971, 0.6073244, 1.322873, 0, 1, 0.5490196, 1,
-0.1383453, -0.544737, -4.684484, 0, 1, 0.5568628, 1,
-0.1379507, -1.005777, -3.479668, 0, 1, 0.5607843, 1,
-0.133169, -1.179873, -3.925174, 0, 1, 0.5686275, 1,
-0.1326554, 0.4317456, 1.213521, 0, 1, 0.572549, 1,
-0.1317488, 0.6163327, -0.9979796, 0, 1, 0.5803922, 1,
-0.1278997, -0.3672115, -2.961942, 0, 1, 0.5843138, 1,
-0.1254309, 0.6581304, 0.1741193, 0, 1, 0.5921569, 1,
-0.1251244, 2.186399, 0.6139725, 0, 1, 0.5960785, 1,
-0.1197561, -2.097353, -2.596032, 0, 1, 0.6039216, 1,
-0.1181597, -1.105666, -2.608911, 0, 1, 0.6117647, 1,
-0.1156621, 0.1746397, 1.0172, 0, 1, 0.6156863, 1,
-0.1135945, 0.4896055, -0.4181164, 0, 1, 0.6235294, 1,
-0.1122079, -0.7715629, -2.287146, 0, 1, 0.627451, 1,
-0.1116802, -0.2907481, -4.241937, 0, 1, 0.6352941, 1,
-0.1070014, 0.3269411, -0.4610074, 0, 1, 0.6392157, 1,
-0.1069576, 1.483509, -1.391873, 0, 1, 0.6470588, 1,
-0.1064995, 1.142323, 2.409831, 0, 1, 0.6509804, 1,
-0.09936842, 2.15167, -0.1974595, 0, 1, 0.6588235, 1,
-0.09730883, -0.5256834, -2.453951, 0, 1, 0.6627451, 1,
-0.09564105, 0.4047437, -0.5829731, 0, 1, 0.6705883, 1,
-0.09207735, -2.624843, -0.705332, 0, 1, 0.6745098, 1,
-0.09189651, 0.09893695, -1.283795, 0, 1, 0.682353, 1,
-0.08717985, 2.098165, -1.93033, 0, 1, 0.6862745, 1,
-0.08364254, 0.266024, 0.756999, 0, 1, 0.6941177, 1,
-0.08083852, -0.4264245, -2.630372, 0, 1, 0.7019608, 1,
-0.07848664, 0.2119741, -3.028155, 0, 1, 0.7058824, 1,
-0.07527895, 0.0631794, -0.5965228, 0, 1, 0.7137255, 1,
-0.07524662, -1.848888, -6.50229, 0, 1, 0.7176471, 1,
-0.06785822, -0.09855594, -1.756013, 0, 1, 0.7254902, 1,
-0.06709149, 0.194096, -0.4130799, 0, 1, 0.7294118, 1,
-0.06463382, -0.01501879, -2.719808, 0, 1, 0.7372549, 1,
-0.05869297, 1.065414, 0.4262393, 0, 1, 0.7411765, 1,
-0.05676153, -0.1364749, -4.041555, 0, 1, 0.7490196, 1,
-0.05664554, 0.09521829, -0.1369565, 0, 1, 0.7529412, 1,
-0.04847348, -0.4078779, -4.378296, 0, 1, 0.7607843, 1,
-0.04718348, -0.2202079, -2.379084, 0, 1, 0.7647059, 1,
-0.04644003, 1.717243, -0.2376301, 0, 1, 0.772549, 1,
-0.04318994, -1.147352, -0.5794199, 0, 1, 0.7764706, 1,
-0.04175218, 0.7273082, 0.4432823, 0, 1, 0.7843137, 1,
-0.04169444, 0.7017097, 0.7186457, 0, 1, 0.7882353, 1,
-0.03822145, -1.65531, -3.535057, 0, 1, 0.7960784, 1,
-0.03813059, -0.2197562, -2.373075, 0, 1, 0.8039216, 1,
-0.03796905, 1.18391, -0.4779074, 0, 1, 0.8078431, 1,
-0.03443684, 1.363464, 1.965271, 0, 1, 0.8156863, 1,
-0.02631442, 0.03617527, 0.3489387, 0, 1, 0.8196079, 1,
-0.0243273, 0.9317785, -1.207619, 0, 1, 0.827451, 1,
-0.02231429, -0.2709328, -3.598351, 0, 1, 0.8313726, 1,
-0.021787, -0.4406973, -3.047441, 0, 1, 0.8392157, 1,
-0.02123024, 0.4195049, 0.1479345, 0, 1, 0.8431373, 1,
-0.01886792, -1.396373, -2.742944, 0, 1, 0.8509804, 1,
-0.0170277, 1.701488, -0.02431954, 0, 1, 0.854902, 1,
-0.0162154, -0.3472012, -3.573849, 0, 1, 0.8627451, 1,
-0.01525059, -0.0743041, -5.346668, 0, 1, 0.8666667, 1,
-0.01036098, 1.810561, 1.083917, 0, 1, 0.8745098, 1,
-0.008743998, 1.885742, -0.1340354, 0, 1, 0.8784314, 1,
-0.006213551, -1.358095, -2.764168, 0, 1, 0.8862745, 1,
-0.004630879, 0.08745484, 1.214945, 0, 1, 0.8901961, 1,
-0.002634781, -0.845453, -4.283444, 0, 1, 0.8980392, 1,
0.0009205242, -2.188835, 2.77581, 0, 1, 0.9058824, 1,
0.001074605, -0.8103302, 2.298095, 0, 1, 0.9098039, 1,
0.005781765, 1.411875, 0.3469385, 0, 1, 0.9176471, 1,
0.007586741, -0.2384819, 3.643936, 0, 1, 0.9215686, 1,
0.009632342, -0.7379959, 2.420252, 0, 1, 0.9294118, 1,
0.01197153, -0.8844951, 2.992692, 0, 1, 0.9333333, 1,
0.01395811, 1.046132, -1.305173, 0, 1, 0.9411765, 1,
0.01421835, 0.2848285, -0.5887175, 0, 1, 0.945098, 1,
0.01543038, -0.6750027, 4.461047, 0, 1, 0.9529412, 1,
0.01564606, -1.429178, 3.648437, 0, 1, 0.9568627, 1,
0.01616918, -1.172823, 1.675579, 0, 1, 0.9647059, 1,
0.02693859, 0.6679997, -0.7640496, 0, 1, 0.9686275, 1,
0.02930314, -0.5718936, 5.458113, 0, 1, 0.9764706, 1,
0.03027457, 1.261958, 0.06333232, 0, 1, 0.9803922, 1,
0.04010168, 0.4262254, 0.8093072, 0, 1, 0.9882353, 1,
0.04077234, -0.2418654, 3.837947, 0, 1, 0.9921569, 1,
0.041667, 1.090166, 0.7193196, 0, 1, 1, 1,
0.04515573, 0.3244775, 0.4668103, 0, 0.9921569, 1, 1,
0.04717025, -1.349313, 2.614833, 0, 0.9882353, 1, 1,
0.0485866, -1.655143, 2.101735, 0, 0.9803922, 1, 1,
0.04956208, -0.3798756, 2.368103, 0, 0.9764706, 1, 1,
0.04965628, -0.2378798, 2.86236, 0, 0.9686275, 1, 1,
0.05091145, -1.438388, 3.377541, 0, 0.9647059, 1, 1,
0.05247982, -0.8478615, 2.347005, 0, 0.9568627, 1, 1,
0.05436967, -0.8102097, 2.708595, 0, 0.9529412, 1, 1,
0.05473926, 0.3334524, 0.5540681, 0, 0.945098, 1, 1,
0.06147167, -1.078668, 2.911537, 0, 0.9411765, 1, 1,
0.06276004, -1.93366, 3.563099, 0, 0.9333333, 1, 1,
0.06882393, -1.866241, 3.58431, 0, 0.9294118, 1, 1,
0.06913383, -0.1795124, 2.355082, 0, 0.9215686, 1, 1,
0.07349441, 1.014232, 0.3376483, 0, 0.9176471, 1, 1,
0.07642172, 0.6626161, 0.2421955, 0, 0.9098039, 1, 1,
0.07994664, 0.1473182, 0.3579696, 0, 0.9058824, 1, 1,
0.08312734, -1.226341, 2.563326, 0, 0.8980392, 1, 1,
0.08445752, -0.2375085, 2.793499, 0, 0.8901961, 1, 1,
0.08572696, 0.3650148, 0.1657319, 0, 0.8862745, 1, 1,
0.08620819, -0.1354212, 2.312285, 0, 0.8784314, 1, 1,
0.08989946, 0.2697936, 2.508749, 0, 0.8745098, 1, 1,
0.09170505, -2.215369, 4.073456, 0, 0.8666667, 1, 1,
0.09235132, 1.65057, -0.8724493, 0, 0.8627451, 1, 1,
0.09318826, -0.09162856, 1.59027, 0, 0.854902, 1, 1,
0.09430341, 0.8044476, -0.1551586, 0, 0.8509804, 1, 1,
0.09460036, 1.501803, -1.500417, 0, 0.8431373, 1, 1,
0.09527266, -1.435103, 4.775399, 0, 0.8392157, 1, 1,
0.1026285, 0.9108664, -0.7571848, 0, 0.8313726, 1, 1,
0.1070743, -1.137629, 3.113849, 0, 0.827451, 1, 1,
0.1078855, -2.800584, 0.9639139, 0, 0.8196079, 1, 1,
0.110105, 0.730455, 0.9147884, 0, 0.8156863, 1, 1,
0.1128536, -0.4033535, 3.513868, 0, 0.8078431, 1, 1,
0.1138278, 0.5771443, -0.07288331, 0, 0.8039216, 1, 1,
0.1179594, -0.8857069, 3.193056, 0, 0.7960784, 1, 1,
0.1183116, -0.3917416, 2.386366, 0, 0.7882353, 1, 1,
0.1197409, 1.257032, -0.2764175, 0, 0.7843137, 1, 1,
0.1221118, -0.09047752, 3.188444, 0, 0.7764706, 1, 1,
0.1231764, 1.571325, -2.707792, 0, 0.772549, 1, 1,
0.1235439, 1.989746, 0.5535192, 0, 0.7647059, 1, 1,
0.1251483, -0.5082943, 3.350621, 0, 0.7607843, 1, 1,
0.1296761, 1.211088, -0.9570278, 0, 0.7529412, 1, 1,
0.1353928, -0.5633509, 5.53955, 0, 0.7490196, 1, 1,
0.1379233, 0.06583231, 0.2787351, 0, 0.7411765, 1, 1,
0.1418325, 0.06956393, 1.711127, 0, 0.7372549, 1, 1,
0.1443118, -0.7063206, 1.411436, 0, 0.7294118, 1, 1,
0.1485074, -0.174295, 1.312653, 0, 0.7254902, 1, 1,
0.1494509, -0.5301774, 4.484871, 0, 0.7176471, 1, 1,
0.1515834, -0.9321659, 4.063287, 0, 0.7137255, 1, 1,
0.1558492, -0.6076269, 1.095209, 0, 0.7058824, 1, 1,
0.1620594, 0.2347691, 0.5124578, 0, 0.6980392, 1, 1,
0.1627229, -0.6368233, 4.806056, 0, 0.6941177, 1, 1,
0.1630065, -0.3472086, 2.634131, 0, 0.6862745, 1, 1,
0.1680771, 2.098928, 1.78189, 0, 0.682353, 1, 1,
0.1688133, -2.444282, 3.266672, 0, 0.6745098, 1, 1,
0.1711744, -0.7286203, 1.765974, 0, 0.6705883, 1, 1,
0.1719442, 1.388236, -0.3064381, 0, 0.6627451, 1, 1,
0.1721374, 0.6545261, 1.098318, 0, 0.6588235, 1, 1,
0.1748654, -0.3778107, 3.893525, 0, 0.6509804, 1, 1,
0.1766645, -0.5245385, 1.743317, 0, 0.6470588, 1, 1,
0.1823138, -0.3613458, 2.904292, 0, 0.6392157, 1, 1,
0.1849827, -0.1133746, 4.157739, 0, 0.6352941, 1, 1,
0.189255, -0.3284006, 2.522239, 0, 0.627451, 1, 1,
0.1912423, -1.676129, 3.534089, 0, 0.6235294, 1, 1,
0.201508, -0.456758, 2.426708, 0, 0.6156863, 1, 1,
0.2075052, -0.4670106, 3.127487, 0, 0.6117647, 1, 1,
0.2081916, -1.233734, 2.497358, 0, 0.6039216, 1, 1,
0.2115754, -0.1226437, 0.8430912, 0, 0.5960785, 1, 1,
0.2125065, -0.9387624, 3.429044, 0, 0.5921569, 1, 1,
0.2145452, -1.757705, 1.778125, 0, 0.5843138, 1, 1,
0.2157274, 1.259802, 0.5047874, 0, 0.5803922, 1, 1,
0.2162052, 0.5968468, -1.076926, 0, 0.572549, 1, 1,
0.2184345, 1.189755, -0.7298642, 0, 0.5686275, 1, 1,
0.2184711, 0.6043154, 0.770137, 0, 0.5607843, 1, 1,
0.2216581, -0.4741589, 2.882899, 0, 0.5568628, 1, 1,
0.221679, -0.1178273, 1.998312, 0, 0.5490196, 1, 1,
0.2234785, -0.9050606, 1.826804, 0, 0.5450981, 1, 1,
0.2270541, 1.013355, -1.425465, 0, 0.5372549, 1, 1,
0.2278819, -0.484872, 2.837529, 0, 0.5333334, 1, 1,
0.2286368, -0.1199195, 2.74799, 0, 0.5254902, 1, 1,
0.2330441, 1.000096, 0.6994797, 0, 0.5215687, 1, 1,
0.2452338, 0.2492184, 0.4645713, 0, 0.5137255, 1, 1,
0.2467698, 1.277238, 1.644627, 0, 0.509804, 1, 1,
0.2478315, 0.8240675, 0.9821952, 0, 0.5019608, 1, 1,
0.2482886, -1.581507, 4.257963, 0, 0.4941176, 1, 1,
0.2523595, -0.4128383, 3.684665, 0, 0.4901961, 1, 1,
0.2534161, 1.481067, 0.339344, 0, 0.4823529, 1, 1,
0.2545586, 0.325783, 0.03293527, 0, 0.4784314, 1, 1,
0.2579472, -0.06746487, 1.762205, 0, 0.4705882, 1, 1,
0.2610034, -1.792172, 4.135811, 0, 0.4666667, 1, 1,
0.2643974, -0.1924143, 1.549772, 0, 0.4588235, 1, 1,
0.2669489, -0.3639612, 4.763889, 0, 0.454902, 1, 1,
0.2713791, -1.18448, 2.977771, 0, 0.4470588, 1, 1,
0.2744052, 0.5003002, 0.8271982, 0, 0.4431373, 1, 1,
0.2748267, -0.2843279, 3.19056, 0, 0.4352941, 1, 1,
0.2750975, -0.1657896, 3.013482, 0, 0.4313726, 1, 1,
0.2758643, 1.289661, -0.07631741, 0, 0.4235294, 1, 1,
0.2770207, 0.2416638, 0.8511497, 0, 0.4196078, 1, 1,
0.2785044, 0.3611906, 0.110877, 0, 0.4117647, 1, 1,
0.2831607, -0.6029091, 1.901929, 0, 0.4078431, 1, 1,
0.2855784, -0.3858519, 1.815027, 0, 0.4, 1, 1,
0.2880023, 0.4107822, 2.259332, 0, 0.3921569, 1, 1,
0.2955826, 3.082732, 0.2952741, 0, 0.3882353, 1, 1,
0.2959569, -1.002856, 2.693127, 0, 0.3803922, 1, 1,
0.2961459, 1.608524, 0.0214972, 0, 0.3764706, 1, 1,
0.2965398, 1.540297, -0.8326963, 0, 0.3686275, 1, 1,
0.303497, -1.190012, 2.858994, 0, 0.3647059, 1, 1,
0.3061929, 1.50837, 0.7372729, 0, 0.3568628, 1, 1,
0.3068866, 1.02166, -1.432443, 0, 0.3529412, 1, 1,
0.3092631, -0.7342887, 3.051929, 0, 0.345098, 1, 1,
0.3100301, -0.5373768, 2.814062, 0, 0.3411765, 1, 1,
0.3127307, -1.570104, 2.672273, 0, 0.3333333, 1, 1,
0.3203442, -0.1091698, 4.275164, 0, 0.3294118, 1, 1,
0.3203731, 1.870719, 0.1056027, 0, 0.3215686, 1, 1,
0.3254592, 0.2197607, 1.229512, 0, 0.3176471, 1, 1,
0.3267561, -0.9482086, 1.952635, 0, 0.3098039, 1, 1,
0.329983, -0.5531123, 2.04589, 0, 0.3058824, 1, 1,
0.3333062, -1.134, 2.344152, 0, 0.2980392, 1, 1,
0.3351335, -0.8005531, 1.338351, 0, 0.2901961, 1, 1,
0.3365085, 0.4636053, 0.6098719, 0, 0.2862745, 1, 1,
0.3372048, -0.5958278, 2.600931, 0, 0.2784314, 1, 1,
0.3380294, -0.08531132, 1.891906, 0, 0.2745098, 1, 1,
0.3384676, -0.8559196, 3.008732, 0, 0.2666667, 1, 1,
0.3393061, -0.007884747, 0.7417918, 0, 0.2627451, 1, 1,
0.3401796, 0.37756, 0.1700867, 0, 0.254902, 1, 1,
0.3406951, -0.9649606, 4.132146, 0, 0.2509804, 1, 1,
0.3448515, -0.2704659, 2.624066, 0, 0.2431373, 1, 1,
0.3462248, 0.4016151, 1.927652, 0, 0.2392157, 1, 1,
0.3501521, -0.06753764, 1.768457, 0, 0.2313726, 1, 1,
0.3586361, 1.611508, 0.2002877, 0, 0.227451, 1, 1,
0.3637837, -0.4895401, 1.104985, 0, 0.2196078, 1, 1,
0.3670304, -0.3163909, 1.383843, 0, 0.2156863, 1, 1,
0.3673559, -1.36718, 2.310548, 0, 0.2078431, 1, 1,
0.3708548, 0.956125, -0.01123828, 0, 0.2039216, 1, 1,
0.3738354, -0.8167195, 2.726997, 0, 0.1960784, 1, 1,
0.3770204, 0.5446221, -0.9781354, 0, 0.1882353, 1, 1,
0.3771084, -0.09073221, 2.7415, 0, 0.1843137, 1, 1,
0.378523, -1.626834, 4.448778, 0, 0.1764706, 1, 1,
0.3848925, 0.3280241, 2.594184, 0, 0.172549, 1, 1,
0.3893569, -0.8754798, 3.637861, 0, 0.1647059, 1, 1,
0.3895623, 1.2819, 0.2268163, 0, 0.1607843, 1, 1,
0.3919555, 0.8839118, 0.4217653, 0, 0.1529412, 1, 1,
0.3924645, 0.2864371, 0.6798277, 0, 0.1490196, 1, 1,
0.3952333, 1.343474, 0.02755336, 0, 0.1411765, 1, 1,
0.3983771, -1.002654, 3.384128, 0, 0.1372549, 1, 1,
0.3996242, -0.4036269, 1.89628, 0, 0.1294118, 1, 1,
0.3999766, -0.4115549, -0.07779273, 0, 0.1254902, 1, 1,
0.4011402, -0.1080156, 1.061249, 0, 0.1176471, 1, 1,
0.4013646, 0.5660362, 1.129791, 0, 0.1137255, 1, 1,
0.4015852, 0.6788694, 1.481244, 0, 0.1058824, 1, 1,
0.4057692, -0.4957736, 3.515949, 0, 0.09803922, 1, 1,
0.4063998, -1.632545, 1.566649, 0, 0.09411765, 1, 1,
0.4074844, 1.500902, 0.3193995, 0, 0.08627451, 1, 1,
0.4082276, -0.1872138, 3.25452, 0, 0.08235294, 1, 1,
0.4087673, 0.1816954, 0.5409957, 0, 0.07450981, 1, 1,
0.4109528, -1.662244, 1.906407, 0, 0.07058824, 1, 1,
0.4127547, 1.985336, 1.462908, 0, 0.0627451, 1, 1,
0.4170169, 1.850452, -0.08032852, 0, 0.05882353, 1, 1,
0.421315, -0.01450001, 0.7180433, 0, 0.05098039, 1, 1,
0.4213255, -0.2244025, 0.8248914, 0, 0.04705882, 1, 1,
0.4214903, -1.15602, 3.58316, 0, 0.03921569, 1, 1,
0.4280708, 0.0328881, 1.318169, 0, 0.03529412, 1, 1,
0.4282272, 0.8015314, 0.4412031, 0, 0.02745098, 1, 1,
0.4305086, -1.305079, 3.782902, 0, 0.02352941, 1, 1,
0.4309667, -1.107029, 1.745043, 0, 0.01568628, 1, 1,
0.4340115, -1.119191, 2.046485, 0, 0.01176471, 1, 1,
0.4395951, -0.1673765, 1.156171, 0, 0.003921569, 1, 1,
0.442674, 3.357806, 0.5361453, 0.003921569, 0, 1, 1,
0.4430429, -1.744166, 1.986746, 0.007843138, 0, 1, 1,
0.4445699, -0.06084282, 1.085571, 0.01568628, 0, 1, 1,
0.4457219, -2.112129, 2.976481, 0.01960784, 0, 1, 1,
0.4474049, -0.8397864, 3.31561, 0.02745098, 0, 1, 1,
0.4479249, 0.9316021, -2.303694, 0.03137255, 0, 1, 1,
0.4509786, 1.002337, -0.05594089, 0.03921569, 0, 1, 1,
0.4532208, 0.5476571, -0.01592875, 0.04313726, 0, 1, 1,
0.4570737, 0.1948941, 1.093976, 0.05098039, 0, 1, 1,
0.4599186, -0.8055639, 2.234931, 0.05490196, 0, 1, 1,
0.4618681, 0.880008, 0.2105206, 0.0627451, 0, 1, 1,
0.4648412, -1.184608, 2.43889, 0.06666667, 0, 1, 1,
0.4648805, -0.319607, 2.6658, 0.07450981, 0, 1, 1,
0.4653366, -0.1017406, 3.689794, 0.07843138, 0, 1, 1,
0.468208, 0.3807135, 0.09264158, 0.08627451, 0, 1, 1,
0.4690089, 0.4167194, 0.2861214, 0.09019608, 0, 1, 1,
0.4718203, -0.8310831, 3.640512, 0.09803922, 0, 1, 1,
0.4809763, -1.173528, 2.580492, 0.1058824, 0, 1, 1,
0.4836931, -0.173084, 2.328006, 0.1098039, 0, 1, 1,
0.4841403, -0.1798533, 1.993919, 0.1176471, 0, 1, 1,
0.4875644, 1.096139, 0.1249023, 0.1215686, 0, 1, 1,
0.4879394, 1.242618, -1.068248, 0.1294118, 0, 1, 1,
0.4883174, -1.212716, 4.008996, 0.1333333, 0, 1, 1,
0.4899096, -2.264569, 2.158636, 0.1411765, 0, 1, 1,
0.5008541, -0.3773774, 2.777411, 0.145098, 0, 1, 1,
0.5009376, -0.5952454, 1.07539, 0.1529412, 0, 1, 1,
0.5072137, -0.4827317, 2.884514, 0.1568628, 0, 1, 1,
0.5138084, -0.3339279, 1.95737, 0.1647059, 0, 1, 1,
0.5197077, -0.9316037, 3.171905, 0.1686275, 0, 1, 1,
0.5202466, -0.03683701, 1.349114, 0.1764706, 0, 1, 1,
0.5287755, -1.183392, 2.754627, 0.1803922, 0, 1, 1,
0.5306678, 0.3032936, 1.186669, 0.1882353, 0, 1, 1,
0.5325655, 1.470527, -1.26135, 0.1921569, 0, 1, 1,
0.5337538, 1.051881, 0.1570426, 0.2, 0, 1, 1,
0.544567, -1.742373, 2.303628, 0.2078431, 0, 1, 1,
0.5474205, -1.114633, 2.376377, 0.2117647, 0, 1, 1,
0.5488954, -1.609922, 0.9730392, 0.2196078, 0, 1, 1,
0.5574786, 0.2931732, -0.2257149, 0.2235294, 0, 1, 1,
0.5597209, 0.3186575, 0.3508749, 0.2313726, 0, 1, 1,
0.5666898, 0.3716759, 1.450042, 0.2352941, 0, 1, 1,
0.5672114, -0.526403, 2.226582, 0.2431373, 0, 1, 1,
0.5672382, -1.36437, 3.792418, 0.2470588, 0, 1, 1,
0.5677462, -0.2629888, 0.6976985, 0.254902, 0, 1, 1,
0.5683924, 0.8021357, -0.1499342, 0.2588235, 0, 1, 1,
0.5745461, -0.4740893, 1.89571, 0.2666667, 0, 1, 1,
0.5762321, -0.3594584, 1.055986, 0.2705882, 0, 1, 1,
0.5805147, -2.499169, 1.840041, 0.2784314, 0, 1, 1,
0.5811675, 0.3200368, 0.7029823, 0.282353, 0, 1, 1,
0.583043, 0.08760196, 1.338034, 0.2901961, 0, 1, 1,
0.5830499, 0.6835144, -0.1683521, 0.2941177, 0, 1, 1,
0.5884448, 0.6265697, 0.2854651, 0.3019608, 0, 1, 1,
0.5906929, 1.342116, 1.051666, 0.3098039, 0, 1, 1,
0.592076, -0.2908406, 1.570272, 0.3137255, 0, 1, 1,
0.5928459, -1.174054, 3.835075, 0.3215686, 0, 1, 1,
0.6015312, -0.4336045, 1.151109, 0.3254902, 0, 1, 1,
0.6037918, 0.9723417, -0.7665182, 0.3333333, 0, 1, 1,
0.6051893, -1.91509, 2.885987, 0.3372549, 0, 1, 1,
0.6054372, 0.3441993, -1.39363, 0.345098, 0, 1, 1,
0.6060327, -0.3372318, 3.084275, 0.3490196, 0, 1, 1,
0.6078588, 0.3175873, 1.538634, 0.3568628, 0, 1, 1,
0.6097886, -0.5118289, 0.8199195, 0.3607843, 0, 1, 1,
0.6103985, -1.763517, 3.943399, 0.3686275, 0, 1, 1,
0.6126114, 2.05758, 0.03549104, 0.372549, 0, 1, 1,
0.6136063, -0.1543618, 1.752024, 0.3803922, 0, 1, 1,
0.6153597, -0.1836047, 3.333432, 0.3843137, 0, 1, 1,
0.6155239, -1.51779, 4.776471, 0.3921569, 0, 1, 1,
0.6183489, -0.6619653, 2.959669, 0.3960784, 0, 1, 1,
0.6195405, -0.3078828, 1.018413, 0.4039216, 0, 1, 1,
0.6239485, -0.9814601, 2.78154, 0.4117647, 0, 1, 1,
0.6300111, 1.691625, -0.7659504, 0.4156863, 0, 1, 1,
0.6302789, 0.03694519, 2.102502, 0.4235294, 0, 1, 1,
0.6335057, 0.4540592, 0.8333634, 0.427451, 0, 1, 1,
0.6362787, 1.522702, 1.598259, 0.4352941, 0, 1, 1,
0.6415782, -0.141602, 1.650385, 0.4392157, 0, 1, 1,
0.6429301, -0.8288359, 1.266832, 0.4470588, 0, 1, 1,
0.6453948, -0.5871729, 1.473403, 0.4509804, 0, 1, 1,
0.6506206, -0.7594358, 3.823088, 0.4588235, 0, 1, 1,
0.6536123, -1.433565, 2.16499, 0.4627451, 0, 1, 1,
0.654245, 0.002483546, -0.8090979, 0.4705882, 0, 1, 1,
0.6542767, -0.5291874, 2.005772, 0.4745098, 0, 1, 1,
0.6574364, -0.08428364, 1.931312, 0.4823529, 0, 1, 1,
0.6609653, -0.008361056, 0.2373472, 0.4862745, 0, 1, 1,
0.6722882, -1.16714, 1.284583, 0.4941176, 0, 1, 1,
0.6728078, 0.6129158, 3.121294, 0.5019608, 0, 1, 1,
0.6735498, 0.1320001, 2.338415, 0.5058824, 0, 1, 1,
0.6746531, 0.6381788, -0.5375561, 0.5137255, 0, 1, 1,
0.6768678, 1.503785, -0.4550437, 0.5176471, 0, 1, 1,
0.6811508, 0.5041309, -0.1996648, 0.5254902, 0, 1, 1,
0.6816477, 1.31445, -0.1373938, 0.5294118, 0, 1, 1,
0.6825489, 1.472035, 0.1837517, 0.5372549, 0, 1, 1,
0.6898932, -1.239503, 2.197109, 0.5411765, 0, 1, 1,
0.6909117, 0.2109873, 0.7459338, 0.5490196, 0, 1, 1,
0.6913643, 0.7860499, 1.471524, 0.5529412, 0, 1, 1,
0.6915314, -1.215894, 3.177369, 0.5607843, 0, 1, 1,
0.6916475, -1.604798, 1.466455, 0.5647059, 0, 1, 1,
0.6934859, -0.7991387, 0.9159529, 0.572549, 0, 1, 1,
0.693508, 0.9828562, 2.358048, 0.5764706, 0, 1, 1,
0.6961621, -0.7394596, 3.912752, 0.5843138, 0, 1, 1,
0.6971144, -0.2208782, 1.454112, 0.5882353, 0, 1, 1,
0.6982273, -0.7947146, 2.604486, 0.5960785, 0, 1, 1,
0.702101, 2.148976, -0.6001958, 0.6039216, 0, 1, 1,
0.7035463, -0.3266687, 1.431144, 0.6078432, 0, 1, 1,
0.7066938, -0.3488351, -0.1022418, 0.6156863, 0, 1, 1,
0.7066951, 0.03431771, 2.435797, 0.6196079, 0, 1, 1,
0.7076293, -1.306467, 2.411, 0.627451, 0, 1, 1,
0.7094896, -0.2246746, 1.482362, 0.6313726, 0, 1, 1,
0.7172247, -0.4680762, 1.384803, 0.6392157, 0, 1, 1,
0.7217404, 0.06140696, 2.15222, 0.6431373, 0, 1, 1,
0.7222486, 0.2030033, 0.5216759, 0.6509804, 0, 1, 1,
0.7243119, 0.13023, 2.280923, 0.654902, 0, 1, 1,
0.72531, 1.069744, 1.614313, 0.6627451, 0, 1, 1,
0.7288787, -0.446164, 2.479899, 0.6666667, 0, 1, 1,
0.7339213, 0.5646377, 2.267689, 0.6745098, 0, 1, 1,
0.7376161, 2.233608, 0.4942904, 0.6784314, 0, 1, 1,
0.7382264, -0.4430183, 2.85676, 0.6862745, 0, 1, 1,
0.7404971, -2.442878, 3.370862, 0.6901961, 0, 1, 1,
0.7408518, 2.890176, 2.290462, 0.6980392, 0, 1, 1,
0.7449689, 1.884954, 0.5236244, 0.7058824, 0, 1, 1,
0.7497208, 0.3338128, 1.357229, 0.7098039, 0, 1, 1,
0.7641829, 0.3097917, 1.415473, 0.7176471, 0, 1, 1,
0.7734306, 1.89899, -0.1912973, 0.7215686, 0, 1, 1,
0.7763759, 0.1036787, 3.795857, 0.7294118, 0, 1, 1,
0.7801095, -0.7271908, 3.453548, 0.7333333, 0, 1, 1,
0.7808132, 2.110242, 0.161155, 0.7411765, 0, 1, 1,
0.7831667, 0.7395861, 1.475438, 0.7450981, 0, 1, 1,
0.7841386, -2.488936, 2.808476, 0.7529412, 0, 1, 1,
0.7914893, -0.3394568, 1.559948, 0.7568628, 0, 1, 1,
0.7941256, -1.217464, 1.298125, 0.7647059, 0, 1, 1,
0.7962401, -1.818024, 2.775727, 0.7686275, 0, 1, 1,
0.7967615, 0.8819838, 0.3441953, 0.7764706, 0, 1, 1,
0.7970019, -1.137199, 1.490045, 0.7803922, 0, 1, 1,
0.797668, 1.603973, -0.5957181, 0.7882353, 0, 1, 1,
0.8031511, 1.461552, -0.5514879, 0.7921569, 0, 1, 1,
0.806378, -1.49051, 2.773276, 0.8, 0, 1, 1,
0.8074771, -1.132104, 2.246025, 0.8078431, 0, 1, 1,
0.8113252, -0.2026687, 1.94501, 0.8117647, 0, 1, 1,
0.8166559, 0.01401642, -0.7125266, 0.8196079, 0, 1, 1,
0.8192862, 1.12474, 0.8110839, 0.8235294, 0, 1, 1,
0.8207325, 0.2376873, 0.9465808, 0.8313726, 0, 1, 1,
0.8223953, -0.2039385, 1.13075, 0.8352941, 0, 1, 1,
0.8339694, 2.307417, 1.500009, 0.8431373, 0, 1, 1,
0.8341956, 0.9111108, -0.855787, 0.8470588, 0, 1, 1,
0.8367105, 0.7227836, 1.292746, 0.854902, 0, 1, 1,
0.8405037, -1.323578, 2.959345, 0.8588235, 0, 1, 1,
0.8420619, -0.3951076, 0.6464082, 0.8666667, 0, 1, 1,
0.8474542, -1.575457, 3.051215, 0.8705882, 0, 1, 1,
0.8475496, 1.004931, 0.6985502, 0.8784314, 0, 1, 1,
0.8521699, 0.8065659, -1.225623, 0.8823529, 0, 1, 1,
0.8526776, -0.4817977, 2.87936, 0.8901961, 0, 1, 1,
0.8569694, 0.1298728, 1.648103, 0.8941177, 0, 1, 1,
0.8652844, 1.22468, -1.881114, 0.9019608, 0, 1, 1,
0.8670503, 1.10353, 1.056463, 0.9098039, 0, 1, 1,
0.8675448, -0.06194747, 2.498819, 0.9137255, 0, 1, 1,
0.8683805, 2.353833, -0.8170871, 0.9215686, 0, 1, 1,
0.8726372, -0.1772994, 2.799235, 0.9254902, 0, 1, 1,
0.8775416, -0.5294219, 0.5076865, 0.9333333, 0, 1, 1,
0.8791233, 1.189285, 2.894955, 0.9372549, 0, 1, 1,
0.883742, 0.2076838, 1.757145, 0.945098, 0, 1, 1,
0.8894552, -0.1435524, 1.8533, 0.9490196, 0, 1, 1,
0.8922862, 0.2125522, 0.6205908, 0.9568627, 0, 1, 1,
0.8939335, -1.128628, 2.888287, 0.9607843, 0, 1, 1,
0.8962164, -0.6405746, 1.706068, 0.9686275, 0, 1, 1,
0.8989229, 0.4138075, -1.267829, 0.972549, 0, 1, 1,
0.9026307, -0.8568021, 2.787917, 0.9803922, 0, 1, 1,
0.9133878, -0.4252915, 1.950507, 0.9843137, 0, 1, 1,
0.9142043, 2.896127, 0.6387224, 0.9921569, 0, 1, 1,
0.9149084, -1.690255, 2.329465, 0.9960784, 0, 1, 1,
0.922274, 0.3809868, 0.8200161, 1, 0, 0.9960784, 1,
0.923276, 2.423923, 0.83523, 1, 0, 0.9882353, 1,
0.9240803, -0.6282882, 0.8902473, 1, 0, 0.9843137, 1,
0.9247009, 0.7212229, 0.9679283, 1, 0, 0.9764706, 1,
0.9262397, 1.355536, -0.8453699, 1, 0, 0.972549, 1,
0.9271972, 1.047493, 0.3082266, 1, 0, 0.9647059, 1,
0.9272999, 0.6600361, 0.6978627, 1, 0, 0.9607843, 1,
0.937639, -0.5250003, 0.9404192, 1, 0, 0.9529412, 1,
0.937788, -0.4487719, 2.149691, 1, 0, 0.9490196, 1,
0.9403356, -0.2155325, 3.137114, 1, 0, 0.9411765, 1,
0.9451749, 0.6204145, 0.7596678, 1, 0, 0.9372549, 1,
0.9471498, 1.320758, 0.4425734, 1, 0, 0.9294118, 1,
0.9519633, -1.20826, 4.547474, 1, 0, 0.9254902, 1,
0.9692785, -1.068255, 3.22827, 1, 0, 0.9176471, 1,
0.9696581, 0.224932, 1.92995, 1, 0, 0.9137255, 1,
0.9803869, 0.9512708, 1.423744, 1, 0, 0.9058824, 1,
0.9825515, -1.746346, 1.798396, 1, 0, 0.9019608, 1,
1.010248, -0.003209265, 1.003956, 1, 0, 0.8941177, 1,
1.012205, -1.339465, 3.691224, 1, 0, 0.8862745, 1,
1.013407, 1.576674, 0.274407, 1, 0, 0.8823529, 1,
1.016293, 0.967441, 0.269401, 1, 0, 0.8745098, 1,
1.017846, 1.313807, 0.4133272, 1, 0, 0.8705882, 1,
1.019229, 0.6296776, 0.9993128, 1, 0, 0.8627451, 1,
1.025705, 1.072827, 0.8922436, 1, 0, 0.8588235, 1,
1.027242, 0.3526584, 2.222279, 1, 0, 0.8509804, 1,
1.029219, 0.8989775, 1.454082, 1, 0, 0.8470588, 1,
1.038245, -0.09149735, 1.533599, 1, 0, 0.8392157, 1,
1.043808, 1.969564, -0.3630537, 1, 0, 0.8352941, 1,
1.047153, 1.821981, 0.2157638, 1, 0, 0.827451, 1,
1.051588, -1.384332, 3.293561, 1, 0, 0.8235294, 1,
1.060863, 1.231109, 0.2069492, 1, 0, 0.8156863, 1,
1.078828, 0.3586662, 1.307625, 1, 0, 0.8117647, 1,
1.079329, 0.4477751, 1.004333, 1, 0, 0.8039216, 1,
1.079525, -0.7242283, 1.630622, 1, 0, 0.7960784, 1,
1.082386, -0.6744633, 2.52347, 1, 0, 0.7921569, 1,
1.085162, -0.4882203, 0.9048442, 1, 0, 0.7843137, 1,
1.086056, 0.6813891, 0.7594773, 1, 0, 0.7803922, 1,
1.090085, 1.048694, 1.027893, 1, 0, 0.772549, 1,
1.090165, 0.6224417, 1.290429, 1, 0, 0.7686275, 1,
1.092459, -0.5501417, 2.959904, 1, 0, 0.7607843, 1,
1.099311, -0.3646364, 1.459381, 1, 0, 0.7568628, 1,
1.101085, -0.618764, 1.239001, 1, 0, 0.7490196, 1,
1.105648, 0.6191154, 1.088463, 1, 0, 0.7450981, 1,
1.106959, -0.8101462, 2.482637, 1, 0, 0.7372549, 1,
1.107816, 0.4735531, 1.777194, 1, 0, 0.7333333, 1,
1.108162, -1.817038, 1.635299, 1, 0, 0.7254902, 1,
1.114275, -1.713668, 2.579959, 1, 0, 0.7215686, 1,
1.115164, 2.230518, 0.1049937, 1, 0, 0.7137255, 1,
1.116451, 1.928329, 0.8128474, 1, 0, 0.7098039, 1,
1.118511, 0.7115733, 1.658501, 1, 0, 0.7019608, 1,
1.122449, -0.5270693, 2.655426, 1, 0, 0.6941177, 1,
1.128249, -0.3106852, 2.40175, 1, 0, 0.6901961, 1,
1.130416, -1.105966, 2.502643, 1, 0, 0.682353, 1,
1.139761, 0.9378917, 0.4152776, 1, 0, 0.6784314, 1,
1.142046, 1.642557, 0.7354062, 1, 0, 0.6705883, 1,
1.142223, -0.176512, 1.284328, 1, 0, 0.6666667, 1,
1.152377, 0.4396718, 1.672383, 1, 0, 0.6588235, 1,
1.15342, -2.189657, 1.040426, 1, 0, 0.654902, 1,
1.160707, -0.2249095, 0.4351262, 1, 0, 0.6470588, 1,
1.165018, 1.128357, 1.803002, 1, 0, 0.6431373, 1,
1.168557, -0.5022567, 2.012821, 1, 0, 0.6352941, 1,
1.169403, -0.5218534, 1.714384, 1, 0, 0.6313726, 1,
1.173231, -0.1121319, 4.278765, 1, 0, 0.6235294, 1,
1.173793, -2.110572, 3.22437, 1, 0, 0.6196079, 1,
1.17818, -0.08870281, 2.758472, 1, 0, 0.6117647, 1,
1.17933, 0.06205254, 1.171769, 1, 0, 0.6078432, 1,
1.202611, -1.883825, 2.518642, 1, 0, 0.6, 1,
1.20725, 0.7955019, -0.4488109, 1, 0, 0.5921569, 1,
1.213872, 0.5340632, 1.472333, 1, 0, 0.5882353, 1,
1.230472, -0.2135032, 1.708627, 1, 0, 0.5803922, 1,
1.232835, 0.07834157, 0.5092562, 1, 0, 0.5764706, 1,
1.236943, -0.08647802, 0.1590527, 1, 0, 0.5686275, 1,
1.237654, 0.5728174, 1.503243, 1, 0, 0.5647059, 1,
1.243962, 0.6234967, 1.120472, 1, 0, 0.5568628, 1,
1.244047, 0.1013231, 1.042294, 1, 0, 0.5529412, 1,
1.253152, -0.4475886, 2.666662, 1, 0, 0.5450981, 1,
1.256817, 0.7808878, 0.2148673, 1, 0, 0.5411765, 1,
1.272932, -0.6253707, 0.8387502, 1, 0, 0.5333334, 1,
1.273582, 0.007683881, 2.137827, 1, 0, 0.5294118, 1,
1.273977, -0.9478494, 3.610092, 1, 0, 0.5215687, 1,
1.281079, -0.1782727, -0.0004224828, 1, 0, 0.5176471, 1,
1.281109, 0.9778121, 2.256468, 1, 0, 0.509804, 1,
1.293741, -2.092295, 2.203808, 1, 0, 0.5058824, 1,
1.316015, -0.2508387, 1.332607, 1, 0, 0.4980392, 1,
1.31796, -0.5661105, 2.537198, 1, 0, 0.4901961, 1,
1.322784, 2.234321, 2.506879, 1, 0, 0.4862745, 1,
1.327765, 0.1848598, 1.171814, 1, 0, 0.4784314, 1,
1.330129, -0.7809721, 3.153996, 1, 0, 0.4745098, 1,
1.332549, -0.5876731, 1.355523, 1, 0, 0.4666667, 1,
1.334959, -2.893267, 3.758053, 1, 0, 0.4627451, 1,
1.343042, -1.002297, 2.036877, 1, 0, 0.454902, 1,
1.351507, 0.7035759, 0.7182444, 1, 0, 0.4509804, 1,
1.352238, -0.9287337, 2.73602, 1, 0, 0.4431373, 1,
1.357377, 0.864465, 0.6160021, 1, 0, 0.4392157, 1,
1.365025, -0.3461964, 1.894479, 1, 0, 0.4313726, 1,
1.366473, -2.314956, 2.069167, 1, 0, 0.427451, 1,
1.3769, 0.40549, 1.110284, 1, 0, 0.4196078, 1,
1.395999, -1.859876, 3.03552, 1, 0, 0.4156863, 1,
1.401035, 0.7809668, 1.750683, 1, 0, 0.4078431, 1,
1.403981, 1.616937, 0.6239206, 1, 0, 0.4039216, 1,
1.405803, 0.4317062, 2.523088, 1, 0, 0.3960784, 1,
1.41177, -0.7363161, 3.852278, 1, 0, 0.3882353, 1,
1.422168, 0.7845997, 1.718185, 1, 0, 0.3843137, 1,
1.422717, 0.4574227, 3.347629, 1, 0, 0.3764706, 1,
1.424125, -0.8052144, 0.4706545, 1, 0, 0.372549, 1,
1.427065, -0.2519272, 2.986755, 1, 0, 0.3647059, 1,
1.431858, 0.30202, 1.013617, 1, 0, 0.3607843, 1,
1.435779, -1.866773, 2.049674, 1, 0, 0.3529412, 1,
1.437758, -0.481446, 1.318604, 1, 0, 0.3490196, 1,
1.445098, 0.278773, 0.4023573, 1, 0, 0.3411765, 1,
1.450802, -1.964778, 3.90865, 1, 0, 0.3372549, 1,
1.452995, 1.384224, 0.982473, 1, 0, 0.3294118, 1,
1.482922, -0.7614824, 3.390302, 1, 0, 0.3254902, 1,
1.492805, 0.6434291, 1.20439, 1, 0, 0.3176471, 1,
1.500761, 0.6988323, 2.330974, 1, 0, 0.3137255, 1,
1.515167, 1.772697, 1.59757, 1, 0, 0.3058824, 1,
1.526069, 0.3082218, 1.042206, 1, 0, 0.2980392, 1,
1.557038, 0.1360325, 1.606509, 1, 0, 0.2941177, 1,
1.564415, -0.3042616, 0.1581649, 1, 0, 0.2862745, 1,
1.584008, -0.3792794, 1.850239, 1, 0, 0.282353, 1,
1.605782, 0.08678775, 0.9819229, 1, 0, 0.2745098, 1,
1.607648, -0.7078968, 2.08106, 1, 0, 0.2705882, 1,
1.614384, 0.4433213, -0.4443026, 1, 0, 0.2627451, 1,
1.622499, -0.4228258, 1.562222, 1, 0, 0.2588235, 1,
1.626305, 0.1059915, 1.765301, 1, 0, 0.2509804, 1,
1.634475, 0.4132501, 0.3255583, 1, 0, 0.2470588, 1,
1.640199, -0.648062, 1.191141, 1, 0, 0.2392157, 1,
1.657995, 1.389681, -0.7057453, 1, 0, 0.2352941, 1,
1.662958, -1.474278, 3.29462, 1, 0, 0.227451, 1,
1.664893, 1.134462, 0.2803398, 1, 0, 0.2235294, 1,
1.668515, -1.909158, 2.625831, 1, 0, 0.2156863, 1,
1.709164, -0.05727153, 2.084863, 1, 0, 0.2117647, 1,
1.715133, 1.084603, 1.531052, 1, 0, 0.2039216, 1,
1.72225, 1.517485, 0.4807863, 1, 0, 0.1960784, 1,
1.76151, 0.9002308, 0.3085033, 1, 0, 0.1921569, 1,
1.762224, -0.7096488, 4.658358, 1, 0, 0.1843137, 1,
1.763429, 0.3439667, 1.768512, 1, 0, 0.1803922, 1,
1.767115, 0.3159859, 1.731044, 1, 0, 0.172549, 1,
1.788933, 0.9975123, 3.693572, 1, 0, 0.1686275, 1,
1.793555, 1.741159, 0.1607309, 1, 0, 0.1607843, 1,
1.814463, 1.436394, 0.4250151, 1, 0, 0.1568628, 1,
1.838041, 0.02145022, 0.7177738, 1, 0, 0.1490196, 1,
1.840886, -1.23706, 0.8239397, 1, 0, 0.145098, 1,
1.874179, 0.6214132, 0.1720713, 1, 0, 0.1372549, 1,
1.874448, 1.204282, 0.3847986, 1, 0, 0.1333333, 1,
1.887269, -0.6932701, 1.131966, 1, 0, 0.1254902, 1,
1.996175, -0.5890241, 2.783068, 1, 0, 0.1215686, 1,
1.999066, -0.6793706, 0.8486464, 1, 0, 0.1137255, 1,
2.071456, -0.3991883, 1.799679, 1, 0, 0.1098039, 1,
2.095516, -1.613832, 2.308305, 1, 0, 0.1019608, 1,
2.137483, -0.5538055, 0.2623147, 1, 0, 0.09411765, 1,
2.15835, 0.3625993, 0.3552787, 1, 0, 0.09019608, 1,
2.162799, -0.1246732, 1.895001, 1, 0, 0.08235294, 1,
2.189813, -1.222549, 0.5974098, 1, 0, 0.07843138, 1,
2.190535, -0.7044972, 2.823807, 1, 0, 0.07058824, 1,
2.226862, 1.795473, 2.241256, 1, 0, 0.06666667, 1,
2.241502, 0.3420652, 0.6041427, 1, 0, 0.05882353, 1,
2.262926, 0.1027264, 1.396773, 1, 0, 0.05490196, 1,
2.289416, 0.7664135, 2.18253, 1, 0, 0.04705882, 1,
2.362212, 0.1321381, 3.678866, 1, 0, 0.04313726, 1,
2.380956, 0.6419906, 0.84212, 1, 0, 0.03529412, 1,
2.535155, 0.6996266, 1.066192, 1, 0, 0.03137255, 1,
2.551321, 0.03988233, 1.662291, 1, 0, 0.02352941, 1,
2.552431, -0.9147462, 1.155828, 1, 0, 0.01960784, 1,
2.586906, 1.423137, 2.360802, 1, 0, 0.01176471, 1,
3.087893, -0.2629052, -0.03303383, 1, 0, 0.007843138, 1
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
-0.283498, -3.952824, -8.543382, 0, -0.5, 0.5, 0.5,
-0.283498, -3.952824, -8.543382, 1, -0.5, 0.5, 0.5,
-0.283498, -3.952824, -8.543382, 1, 1.5, 0.5, 0.5,
-0.283498, -3.952824, -8.543382, 0, 1.5, 0.5, 0.5
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
-4.797791, 0.2322692, -8.543382, 0, -0.5, 0.5, 0.5,
-4.797791, 0.2322692, -8.543382, 1, -0.5, 0.5, 0.5,
-4.797791, 0.2322692, -8.543382, 1, 1.5, 0.5, 0.5,
-4.797791, 0.2322692, -8.543382, 0, 1.5, 0.5, 0.5
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
-4.797791, -3.952824, -0.48137, 0, -0.5, 0.5, 0.5,
-4.797791, -3.952824, -0.48137, 1, -0.5, 0.5, 0.5,
-4.797791, -3.952824, -0.48137, 1, 1.5, 0.5, 0.5,
-4.797791, -3.952824, -0.48137, 0, 1.5, 0.5, 0.5
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
-3, -2.987034, -6.682918,
3, -2.987034, -6.682918,
-3, -2.987034, -6.682918,
-3, -3.147999, -6.992995,
-2, -2.987034, -6.682918,
-2, -3.147999, -6.992995,
-1, -2.987034, -6.682918,
-1, -3.147999, -6.992995,
0, -2.987034, -6.682918,
0, -3.147999, -6.992995,
1, -2.987034, -6.682918,
1, -3.147999, -6.992995,
2, -2.987034, -6.682918,
2, -3.147999, -6.992995,
3, -2.987034, -6.682918,
3, -3.147999, -6.992995
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
-3, -3.469929, -7.61315, 0, -0.5, 0.5, 0.5,
-3, -3.469929, -7.61315, 1, -0.5, 0.5, 0.5,
-3, -3.469929, -7.61315, 1, 1.5, 0.5, 0.5,
-3, -3.469929, -7.61315, 0, 1.5, 0.5, 0.5,
-2, -3.469929, -7.61315, 0, -0.5, 0.5, 0.5,
-2, -3.469929, -7.61315, 1, -0.5, 0.5, 0.5,
-2, -3.469929, -7.61315, 1, 1.5, 0.5, 0.5,
-2, -3.469929, -7.61315, 0, 1.5, 0.5, 0.5,
-1, -3.469929, -7.61315, 0, -0.5, 0.5, 0.5,
-1, -3.469929, -7.61315, 1, -0.5, 0.5, 0.5,
-1, -3.469929, -7.61315, 1, 1.5, 0.5, 0.5,
-1, -3.469929, -7.61315, 0, 1.5, 0.5, 0.5,
0, -3.469929, -7.61315, 0, -0.5, 0.5, 0.5,
0, -3.469929, -7.61315, 1, -0.5, 0.5, 0.5,
0, -3.469929, -7.61315, 1, 1.5, 0.5, 0.5,
0, -3.469929, -7.61315, 0, 1.5, 0.5, 0.5,
1, -3.469929, -7.61315, 0, -0.5, 0.5, 0.5,
1, -3.469929, -7.61315, 1, -0.5, 0.5, 0.5,
1, -3.469929, -7.61315, 1, 1.5, 0.5, 0.5,
1, -3.469929, -7.61315, 0, 1.5, 0.5, 0.5,
2, -3.469929, -7.61315, 0, -0.5, 0.5, 0.5,
2, -3.469929, -7.61315, 1, -0.5, 0.5, 0.5,
2, -3.469929, -7.61315, 1, 1.5, 0.5, 0.5,
2, -3.469929, -7.61315, 0, 1.5, 0.5, 0.5,
3, -3.469929, -7.61315, 0, -0.5, 0.5, 0.5,
3, -3.469929, -7.61315, 1, -0.5, 0.5, 0.5,
3, -3.469929, -7.61315, 1, 1.5, 0.5, 0.5,
3, -3.469929, -7.61315, 0, 1.5, 0.5, 0.5
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
-3.756031, -2, -6.682918,
-3.756031, 3, -6.682918,
-3.756031, -2, -6.682918,
-3.929657, -2, -6.992995,
-3.756031, -1, -6.682918,
-3.929657, -1, -6.992995,
-3.756031, 0, -6.682918,
-3.929657, 0, -6.992995,
-3.756031, 1, -6.682918,
-3.929657, 1, -6.992995,
-3.756031, 2, -6.682918,
-3.929657, 2, -6.992995,
-3.756031, 3, -6.682918,
-3.929657, 3, -6.992995
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
-4.276911, -2, -7.61315, 0, -0.5, 0.5, 0.5,
-4.276911, -2, -7.61315, 1, -0.5, 0.5, 0.5,
-4.276911, -2, -7.61315, 1, 1.5, 0.5, 0.5,
-4.276911, -2, -7.61315, 0, 1.5, 0.5, 0.5,
-4.276911, -1, -7.61315, 0, -0.5, 0.5, 0.5,
-4.276911, -1, -7.61315, 1, -0.5, 0.5, 0.5,
-4.276911, -1, -7.61315, 1, 1.5, 0.5, 0.5,
-4.276911, -1, -7.61315, 0, 1.5, 0.5, 0.5,
-4.276911, 0, -7.61315, 0, -0.5, 0.5, 0.5,
-4.276911, 0, -7.61315, 1, -0.5, 0.5, 0.5,
-4.276911, 0, -7.61315, 1, 1.5, 0.5, 0.5,
-4.276911, 0, -7.61315, 0, 1.5, 0.5, 0.5,
-4.276911, 1, -7.61315, 0, -0.5, 0.5, 0.5,
-4.276911, 1, -7.61315, 1, -0.5, 0.5, 0.5,
-4.276911, 1, -7.61315, 1, 1.5, 0.5, 0.5,
-4.276911, 1, -7.61315, 0, 1.5, 0.5, 0.5,
-4.276911, 2, -7.61315, 0, -0.5, 0.5, 0.5,
-4.276911, 2, -7.61315, 1, -0.5, 0.5, 0.5,
-4.276911, 2, -7.61315, 1, 1.5, 0.5, 0.5,
-4.276911, 2, -7.61315, 0, 1.5, 0.5, 0.5,
-4.276911, 3, -7.61315, 0, -0.5, 0.5, 0.5,
-4.276911, 3, -7.61315, 1, -0.5, 0.5, 0.5,
-4.276911, 3, -7.61315, 1, 1.5, 0.5, 0.5,
-4.276911, 3, -7.61315, 0, 1.5, 0.5, 0.5
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
-3.756031, -2.987034, -6,
-3.756031, -2.987034, 4,
-3.756031, -2.987034, -6,
-3.929657, -3.147999, -6,
-3.756031, -2.987034, -4,
-3.929657, -3.147999, -4,
-3.756031, -2.987034, -2,
-3.929657, -3.147999, -2,
-3.756031, -2.987034, 0,
-3.929657, -3.147999, 0,
-3.756031, -2.987034, 2,
-3.929657, -3.147999, 2,
-3.756031, -2.987034, 4,
-3.929657, -3.147999, 4
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
"-6",
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
-4.276911, -3.469929, -6, 0, -0.5, 0.5, 0.5,
-4.276911, -3.469929, -6, 1, -0.5, 0.5, 0.5,
-4.276911, -3.469929, -6, 1, 1.5, 0.5, 0.5,
-4.276911, -3.469929, -6, 0, 1.5, 0.5, 0.5,
-4.276911, -3.469929, -4, 0, -0.5, 0.5, 0.5,
-4.276911, -3.469929, -4, 1, -0.5, 0.5, 0.5,
-4.276911, -3.469929, -4, 1, 1.5, 0.5, 0.5,
-4.276911, -3.469929, -4, 0, 1.5, 0.5, 0.5,
-4.276911, -3.469929, -2, 0, -0.5, 0.5, 0.5,
-4.276911, -3.469929, -2, 1, -0.5, 0.5, 0.5,
-4.276911, -3.469929, -2, 1, 1.5, 0.5, 0.5,
-4.276911, -3.469929, -2, 0, 1.5, 0.5, 0.5,
-4.276911, -3.469929, 0, 0, -0.5, 0.5, 0.5,
-4.276911, -3.469929, 0, 1, -0.5, 0.5, 0.5,
-4.276911, -3.469929, 0, 1, 1.5, 0.5, 0.5,
-4.276911, -3.469929, 0, 0, 1.5, 0.5, 0.5,
-4.276911, -3.469929, 2, 0, -0.5, 0.5, 0.5,
-4.276911, -3.469929, 2, 1, -0.5, 0.5, 0.5,
-4.276911, -3.469929, 2, 1, 1.5, 0.5, 0.5,
-4.276911, -3.469929, 2, 0, 1.5, 0.5, 0.5,
-4.276911, -3.469929, 4, 0, -0.5, 0.5, 0.5,
-4.276911, -3.469929, 4, 1, -0.5, 0.5, 0.5,
-4.276911, -3.469929, 4, 1, 1.5, 0.5, 0.5,
-4.276911, -3.469929, 4, 0, 1.5, 0.5, 0.5
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
-3.756031, -2.987034, -6.682918,
-3.756031, 3.451572, -6.682918,
-3.756031, -2.987034, 5.720178,
-3.756031, 3.451572, 5.720178,
-3.756031, -2.987034, -6.682918,
-3.756031, -2.987034, 5.720178,
-3.756031, 3.451572, -6.682918,
-3.756031, 3.451572, 5.720178,
-3.756031, -2.987034, -6.682918,
3.189035, -2.987034, -6.682918,
-3.756031, -2.987034, 5.720178,
3.189035, -2.987034, 5.720178,
-3.756031, 3.451572, -6.682918,
3.189035, 3.451572, -6.682918,
-3.756031, 3.451572, 5.720178,
3.189035, 3.451572, 5.720178,
3.189035, -2.987034, -6.682918,
3.189035, 3.451572, -6.682918,
3.189035, -2.987034, 5.720178,
3.189035, 3.451572, 5.720178,
3.189035, -2.987034, -6.682918,
3.189035, -2.987034, 5.720178,
3.189035, 3.451572, -6.682918,
3.189035, 3.451572, 5.720178
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
var radius = 8.332943;
var distance = 37.07421;
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
mvMatrix.translate( 0.283498, -0.2322692, 0.48137 );
mvMatrix.scale( 1.297287, 1.399331, 0.7264107 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.07421);
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
methoxycarbamate<-read.table("methoxycarbamate.xyz")
```

```
## Error in read.table("methoxycarbamate.xyz"): no lines available in input
```

```r
x<-methoxycarbamate$V2
```

```
## Error in eval(expr, envir, enclos): object 'methoxycarbamate' not found
```

```r
y<-methoxycarbamate$V3
```

```
## Error in eval(expr, envir, enclos): object 'methoxycarbamate' not found
```

```r
z<-methoxycarbamate$V4
```

```
## Error in eval(expr, envir, enclos): object 'methoxycarbamate' not found
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
-3.654889, -1.187977, -3.499154, 0, 0, 1, 1, 1,
-3.429525, 0.008488343, -0.9850622, 1, 0, 0, 1, 1,
-2.950416, 0.05966524, -0.3410652, 1, 0, 0, 1, 1,
-2.911414, -0.8158944, -1.842656, 1, 0, 0, 1, 1,
-2.573844, 0.8631846, -0.2045606, 1, 0, 0, 1, 1,
-2.547492, -0.669552, -1.323863, 1, 0, 0, 1, 1,
-2.522503, -0.7741085, -3.044574, 0, 0, 0, 1, 1,
-2.500564, 0.1944905, -0.1942363, 0, 0, 0, 1, 1,
-2.480902, 0.7030885, -1.817445, 0, 0, 0, 1, 1,
-2.45024, 1.268923, -2.37635, 0, 0, 0, 1, 1,
-2.441694, 0.6770564, -2.696223, 0, 0, 0, 1, 1,
-2.428296, -2.505944, -4.120465, 0, 0, 0, 1, 1,
-2.416192, 0.6217413, -1.440788, 0, 0, 0, 1, 1,
-2.3574, -0.05894806, -1.052898, 1, 1, 1, 1, 1,
-2.345461, -1.175063, -1.686639, 1, 1, 1, 1, 1,
-2.283879, 1.851027, -0.117571, 1, 1, 1, 1, 1,
-2.186899, -2.180466, -1.356138, 1, 1, 1, 1, 1,
-2.177677, -0.9863033, -1.340023, 1, 1, 1, 1, 1,
-2.118103, -0.0259819, -0.2906688, 1, 1, 1, 1, 1,
-2.10748, 0.8142005, -3.744649, 1, 1, 1, 1, 1,
-2.107363, 0.6494244, -2.136603, 1, 1, 1, 1, 1,
-2.07792, 0.4448266, -1.560461, 1, 1, 1, 1, 1,
-2.06614, 0.2309116, -1.888948, 1, 1, 1, 1, 1,
-2.060496, -0.1658714, -2.31239, 1, 1, 1, 1, 1,
-2.032808, -0.7552543, -1.005931, 1, 1, 1, 1, 1,
-2.02851, -0.9602886, -1.242938, 1, 1, 1, 1, 1,
-2.025361, 0.2729889, -1.876933, 1, 1, 1, 1, 1,
-2.016557, -0.3154705, 0.3517109, 1, 1, 1, 1, 1,
-2.011553, -2.108981, -1.095341, 0, 0, 1, 1, 1,
-2.00327, -0.3609616, -3.109168, 1, 0, 0, 1, 1,
-2.002643, 0.6965605, -1.181768, 1, 0, 0, 1, 1,
-1.966448, -1.300692, -2.840902, 1, 0, 0, 1, 1,
-1.954155, 0.8964858, -0.2685484, 1, 0, 0, 1, 1,
-1.952974, -0.1557883, -2.201103, 1, 0, 0, 1, 1,
-1.94176, -0.2403101, -1.3262, 0, 0, 0, 1, 1,
-1.923619, 1.394171, -2.095243, 0, 0, 0, 1, 1,
-1.919143, 0.1295444, -1.681227, 0, 0, 0, 1, 1,
-1.894205, 0.8824691, -0.9282495, 0, 0, 0, 1, 1,
-1.853279, 0.139164, -2.793444, 0, 0, 0, 1, 1,
-1.839362, -1.002487, -2.572528, 0, 0, 0, 1, 1,
-1.831601, -1.338164, -2.951058, 0, 0, 0, 1, 1,
-1.812223, 0.05263411, -0.8729708, 1, 1, 1, 1, 1,
-1.807574, -2.095379, -1.806713, 1, 1, 1, 1, 1,
-1.805839, 0.5794527, -1.165327, 1, 1, 1, 1, 1,
-1.759429, 0.3665535, -2.23537, 1, 1, 1, 1, 1,
-1.758711, -0.6775501, -3.172781, 1, 1, 1, 1, 1,
-1.756146, -0.8925493, -1.641688, 1, 1, 1, 1, 1,
-1.749384, 1.2312, 0.6354376, 1, 1, 1, 1, 1,
-1.745116, -0.5461546, -1.858246, 1, 1, 1, 1, 1,
-1.742537, 1.090227, 0.1631742, 1, 1, 1, 1, 1,
-1.725348, 0.4566172, 0.5408927, 1, 1, 1, 1, 1,
-1.715161, 0.2048787, -0.6658768, 1, 1, 1, 1, 1,
-1.713138, 0.6568016, -2.719277, 1, 1, 1, 1, 1,
-1.705624, -0.05074525, -2.911742, 1, 1, 1, 1, 1,
-1.702404, 0.1126321, -1.082551, 1, 1, 1, 1, 1,
-1.649934, 1.150357, -0.8329597, 1, 1, 1, 1, 1,
-1.64511, 1.047036, -1.0108, 0, 0, 1, 1, 1,
-1.627423, -0.1971551, -0.2097651, 1, 0, 0, 1, 1,
-1.59021, -1.323991, -1.843257, 1, 0, 0, 1, 1,
-1.585136, -0.7580827, -2.343195, 1, 0, 0, 1, 1,
-1.583731, -0.1980371, -3.636889, 1, 0, 0, 1, 1,
-1.576364, 0.120395, -1.696939, 1, 0, 0, 1, 1,
-1.573975, 0.07060184, -1.200526, 0, 0, 0, 1, 1,
-1.567325, 0.8596448, -2.51965, 0, 0, 0, 1, 1,
-1.554204, -0.5067148, -3.736244, 0, 0, 0, 1, 1,
-1.551411, 2.093919, -1.254727, 0, 0, 0, 1, 1,
-1.547381, 0.2196336, -1.995181, 0, 0, 0, 1, 1,
-1.532766, 0.09912445, -1.520043, 0, 0, 0, 1, 1,
-1.529249, -0.192933, -2.420042, 0, 0, 0, 1, 1,
-1.523044, 0.001138866, -2.369397, 1, 1, 1, 1, 1,
-1.516505, -0.2224994, -1.898327, 1, 1, 1, 1, 1,
-1.515879, 1.234116, 0.6025574, 1, 1, 1, 1, 1,
-1.511366, -0.2703485, -3.698123, 1, 1, 1, 1, 1,
-1.505111, -0.2087136, -0.2964507, 1, 1, 1, 1, 1,
-1.49145, 1.050127, 0.3184444, 1, 1, 1, 1, 1,
-1.479281, -0.8010501, -2.680664, 1, 1, 1, 1, 1,
-1.477845, 0.3656795, -1.063544, 1, 1, 1, 1, 1,
-1.475266, -0.05376843, -1.929346, 1, 1, 1, 1, 1,
-1.455909, 1.185562, -1.481691, 1, 1, 1, 1, 1,
-1.453437, -0.3126099, -1.265553, 1, 1, 1, 1, 1,
-1.450974, 0.0002606769, -2.900022, 1, 1, 1, 1, 1,
-1.441665, -0.6831884, -1.901743, 1, 1, 1, 1, 1,
-1.437809, 0.5505621, -2.353223, 1, 1, 1, 1, 1,
-1.429471, -0.8129953, -1.268913, 1, 1, 1, 1, 1,
-1.41652, -0.3108625, -3.588677, 0, 0, 1, 1, 1,
-1.413731, 0.3010083, -2.223812, 1, 0, 0, 1, 1,
-1.411972, -0.4335721, -2.443362, 1, 0, 0, 1, 1,
-1.410272, -0.8421958, -1.673876, 1, 0, 0, 1, 1,
-1.407066, -0.2611855, 0.1213369, 1, 0, 0, 1, 1,
-1.406681, -0.7976028, -4.750202, 1, 0, 0, 1, 1,
-1.373939, -0.6621911, -0.8925651, 0, 0, 0, 1, 1,
-1.370472, 0.4584702, -0.8080329, 0, 0, 0, 1, 1,
-1.369833, 0.6550638, -1.641785, 0, 0, 0, 1, 1,
-1.368703, 0.3341681, -0.4068979, 0, 0, 0, 1, 1,
-1.359212, 0.8364365, -1.355684, 0, 0, 0, 1, 1,
-1.346864, -0.718293, -0.9845369, 0, 0, 0, 1, 1,
-1.346797, -0.9857571, -2.261663, 0, 0, 0, 1, 1,
-1.335509, -0.5408465, -1.597045, 1, 1, 1, 1, 1,
-1.332411, 2.041383, 0.05209458, 1, 1, 1, 1, 1,
-1.331138, -0.3413966, -1.201319, 1, 1, 1, 1, 1,
-1.319924, 0.8346973, -2.662155, 1, 1, 1, 1, 1,
-1.319861, 1.212421, -1.597213, 1, 1, 1, 1, 1,
-1.31697, 0.2282676, -1.538762, 1, 1, 1, 1, 1,
-1.312686, 0.5203846, -1.231657, 1, 1, 1, 1, 1,
-1.312562, -0.2869513, -0.480556, 1, 1, 1, 1, 1,
-1.31088, 1.58376, -0.691277, 1, 1, 1, 1, 1,
-1.310419, 0.3533894, -0.8374415, 1, 1, 1, 1, 1,
-1.310276, -0.8696684, -2.243215, 1, 1, 1, 1, 1,
-1.309722, 0.1871, -2.774829, 1, 1, 1, 1, 1,
-1.30474, 0.1546157, -1.501688, 1, 1, 1, 1, 1,
-1.303274, 0.5222794, -0.3611598, 1, 1, 1, 1, 1,
-1.296112, -1.38173, -1.489058, 1, 1, 1, 1, 1,
-1.281467, -1.801435, -1.841601, 0, 0, 1, 1, 1,
-1.277138, -0.4251422, -3.18752, 1, 0, 0, 1, 1,
-1.274594, -0.4441392, -2.658477, 1, 0, 0, 1, 1,
-1.264376, 0.7885726, 0.1772771, 1, 0, 0, 1, 1,
-1.261436, -0.05164074, -1.61806, 1, 0, 0, 1, 1,
-1.259618, -0.5279911, -2.07275, 1, 0, 0, 1, 1,
-1.255279, 0.1829809, -2.431727, 0, 0, 0, 1, 1,
-1.254683, -0.2647183, -1.580255, 0, 0, 0, 1, 1,
-1.246948, -0.2342361, -2.977752, 0, 0, 0, 1, 1,
-1.23939, 1.3106, 0.3601058, 0, 0, 0, 1, 1,
-1.238279, -0.22994, -0.1300873, 0, 0, 0, 1, 1,
-1.224731, 0.4427212, 1.7776, 0, 0, 0, 1, 1,
-1.224644, -0.05821185, 0.3317799, 0, 0, 0, 1, 1,
-1.224603, 2.375018, -0.7402232, 1, 1, 1, 1, 1,
-1.223315, -1.252251, -1.844918, 1, 1, 1, 1, 1,
-1.222998, 0.2960086, -2.090816, 1, 1, 1, 1, 1,
-1.222922, -1.793246, -2.227384, 1, 1, 1, 1, 1,
-1.21366, 1.238086, 0.4070839, 1, 1, 1, 1, 1,
-1.20769, -1.105382, -2.164166, 1, 1, 1, 1, 1,
-1.205503, 0.6539136, -1.122893, 1, 1, 1, 1, 1,
-1.189756, 0.7966208, -2.995442, 1, 1, 1, 1, 1,
-1.189015, 1.033425, -0.5917116, 1, 1, 1, 1, 1,
-1.186937, 1.288934, -2.129516, 1, 1, 1, 1, 1,
-1.18662, 0.6563759, -0.4098897, 1, 1, 1, 1, 1,
-1.184768, -0.5127869, -0.4552951, 1, 1, 1, 1, 1,
-1.180482, 0.1111375, -2.913965, 1, 1, 1, 1, 1,
-1.177418, -1.465738, -1.36648, 1, 1, 1, 1, 1,
-1.170427, -0.3586331, -0.9766719, 1, 1, 1, 1, 1,
-1.161994, 1.340799, -0.4872139, 0, 0, 1, 1, 1,
-1.159953, 0.8527804, 0.6886058, 1, 0, 0, 1, 1,
-1.155659, -1.655153, -2.464284, 1, 0, 0, 1, 1,
-1.152628, 0.5218316, -1.177103, 1, 0, 0, 1, 1,
-1.140855, 0.2998526, -1.316831, 1, 0, 0, 1, 1,
-1.137447, -0.1308513, -1.963649, 1, 0, 0, 1, 1,
-1.132841, 0.04594256, -2.791, 0, 0, 0, 1, 1,
-1.129013, -0.1156611, -2.468368, 0, 0, 0, 1, 1,
-1.127379, 1.309988, -0.9257586, 0, 0, 0, 1, 1,
-1.127351, -0.440767, -1.519323, 0, 0, 0, 1, 1,
-1.123919, 0.3297514, -1.2317, 0, 0, 0, 1, 1,
-1.113706, 1.30126, 0.8820161, 0, 0, 0, 1, 1,
-1.105532, 2.043366, -0.5712644, 0, 0, 0, 1, 1,
-1.104048, -1.117567, -0.4773564, 1, 1, 1, 1, 1,
-1.103399, -0.2578777, -2.787404, 1, 1, 1, 1, 1,
-1.095594, 0.5141926, -1.647445, 1, 1, 1, 1, 1,
-1.084001, -0.2023247, -1.416376, 1, 1, 1, 1, 1,
-1.079945, -0.9198515, -3.064003, 1, 1, 1, 1, 1,
-1.071269, 1.017592, -0.3856848, 1, 1, 1, 1, 1,
-1.064334, -1.753314, -1.543765, 1, 1, 1, 1, 1,
-1.063541, 0.368017, -1.845845, 1, 1, 1, 1, 1,
-1.063463, -0.7556821, -1.689677, 1, 1, 1, 1, 1,
-1.054932, -1.03328, -0.8795604, 1, 1, 1, 1, 1,
-1.05136, -0.6105185, -0.5418532, 1, 1, 1, 1, 1,
-1.048494, -1.392367, -1.730906, 1, 1, 1, 1, 1,
-1.043634, -1.102862, -2.204478, 1, 1, 1, 1, 1,
-1.043342, 0.2382624, -1.499492, 1, 1, 1, 1, 1,
-1.040176, -0.7333303, -2.5776, 1, 1, 1, 1, 1,
-1.037517, -2.012252, -4.177112, 0, 0, 1, 1, 1,
-1.036713, 0.5057755, -2.380399, 1, 0, 0, 1, 1,
-1.036452, -1.513732, -1.446643, 1, 0, 0, 1, 1,
-1.035507, 0.3058527, 0.02684938, 1, 0, 0, 1, 1,
-1.034862, 0.3437787, -1.661131, 1, 0, 0, 1, 1,
-1.019277, -1.013666, -0.7703974, 1, 0, 0, 1, 1,
-1.01867, -0.8751895, -3.269124, 0, 0, 0, 1, 1,
-1.017615, 0.1772458, -0.5513186, 0, 0, 0, 1, 1,
-1.013766, -2.510288, -1.590549, 0, 0, 0, 1, 1,
-1.013523, -0.8728591, -1.992735, 0, 0, 0, 1, 1,
-1.012789, -0.4589558, -3.797879, 0, 0, 0, 1, 1,
-1.011639, 2.024628, 0.4850615, 0, 0, 0, 1, 1,
-1.003427, -0.2974945, -2.282198, 0, 0, 0, 1, 1,
-1.001714, 0.618719, -0.00341891, 1, 1, 1, 1, 1,
-0.9930612, 0.06673128, -1.714953, 1, 1, 1, 1, 1,
-0.9772025, -1.19194, -2.872593, 1, 1, 1, 1, 1,
-0.9765087, -0.2105902, -1.720709, 1, 1, 1, 1, 1,
-0.9749249, 1.081396, -0.1935199, 1, 1, 1, 1, 1,
-0.9748282, 0.7640772, 0.2033949, 1, 1, 1, 1, 1,
-0.9706455, 0.6663648, -0.4269076, 1, 1, 1, 1, 1,
-0.9695699, 0.8799428, -2.065018, 1, 1, 1, 1, 1,
-0.9694962, -0.5159179, -2.10236, 1, 1, 1, 1, 1,
-0.9672004, 0.9047332, -0.8395997, 1, 1, 1, 1, 1,
-0.9517652, 0.7827953, -0.7561314, 1, 1, 1, 1, 1,
-0.951632, 0.9297954, 0.5979975, 1, 1, 1, 1, 1,
-0.9488062, 0.09232929, -2.38344, 1, 1, 1, 1, 1,
-0.9444441, 1.116181, -1.185862, 1, 1, 1, 1, 1,
-0.9422743, -0.8358091, -1.632137, 1, 1, 1, 1, 1,
-0.9404261, 1.754791, -0.5934837, 0, 0, 1, 1, 1,
-0.934306, 0.9627051, -1.18482, 1, 0, 0, 1, 1,
-0.9317726, -0.2206324, -2.121102, 1, 0, 0, 1, 1,
-0.9265949, -1.121275, -2.262244, 1, 0, 0, 1, 1,
-0.9239929, 0.7297331, 0.8555538, 1, 0, 0, 1, 1,
-0.9235587, -0.3473208, -1.728887, 1, 0, 0, 1, 1,
-0.9231083, 1.667561, -1.24329, 0, 0, 0, 1, 1,
-0.9168155, -1.097726, -5.040462, 0, 0, 0, 1, 1,
-0.9146981, -0.734937, -1.683936, 0, 0, 0, 1, 1,
-0.9120979, -0.2433806, -2.091928, 0, 0, 0, 1, 1,
-0.902511, 0.8438794, -1.225907, 0, 0, 0, 1, 1,
-0.8980998, 1.62567, 0.1328877, 0, 0, 0, 1, 1,
-0.8912318, 0.2729329, -1.174657, 0, 0, 0, 1, 1,
-0.8855618, -0.5975647, -3.098145, 1, 1, 1, 1, 1,
-0.8722383, 0.3714091, -1.915419, 1, 1, 1, 1, 1,
-0.8694738, -0.585502, -0.341834, 1, 1, 1, 1, 1,
-0.8611197, -1.046309, -3.462802, 1, 1, 1, 1, 1,
-0.8585888, -0.1874732, -2.110663, 1, 1, 1, 1, 1,
-0.8542342, -0.3936543, -4.295789, 1, 1, 1, 1, 1,
-0.8505554, 1.833672, -0.01348017, 1, 1, 1, 1, 1,
-0.8429135, 0.1754735, -0.8812913, 1, 1, 1, 1, 1,
-0.8385915, 0.624719, -0.1135236, 1, 1, 1, 1, 1,
-0.8235927, 0.1567234, 0.8103314, 1, 1, 1, 1, 1,
-0.8221279, 1.42198, 0.04835703, 1, 1, 1, 1, 1,
-0.8220792, 0.8003601, 0.2051571, 1, 1, 1, 1, 1,
-0.8220282, -0.3316899, -2.624718, 1, 1, 1, 1, 1,
-0.8113434, 1.183007, -0.7835671, 1, 1, 1, 1, 1,
-0.8067724, -1.001535, -3.327936, 1, 1, 1, 1, 1,
-0.8024024, -0.703564, -2.563506, 0, 0, 1, 1, 1,
-0.7967637, 0.9313256, -1.494858, 1, 0, 0, 1, 1,
-0.7912081, -0.3728911, -2.580348, 1, 0, 0, 1, 1,
-0.789031, 0.9205476, -2.636412, 1, 0, 0, 1, 1,
-0.7866259, -0.6977572, -2.262527, 1, 0, 0, 1, 1,
-0.7803615, 0.4529206, -0.4826305, 1, 0, 0, 1, 1,
-0.7757383, -0.7221465, -0.6203595, 0, 0, 0, 1, 1,
-0.7735498, -1.392508, -1.079027, 0, 0, 0, 1, 1,
-0.7724131, -0.7579986, -0.5106623, 0, 0, 0, 1, 1,
-0.7721457, 0.6546512, -0.9310932, 0, 0, 0, 1, 1,
-0.7706066, 1.656387, -0.7278925, 0, 0, 0, 1, 1,
-0.7658442, 1.338141, 0.6191526, 0, 0, 0, 1, 1,
-0.765048, -1.042493, -2.461512, 0, 0, 0, 1, 1,
-0.7649254, 0.4535329, -1.365846, 1, 1, 1, 1, 1,
-0.7583641, 0.2996965, -2.829354, 1, 1, 1, 1, 1,
-0.7490641, 0.8753047, -0.7550539, 1, 1, 1, 1, 1,
-0.7360018, -0.3013062, -1.088607, 1, 1, 1, 1, 1,
-0.7344421, -1.095928, -3.143471, 1, 1, 1, 1, 1,
-0.7280606, -0.1116028, -0.9463829, 1, 1, 1, 1, 1,
-0.7250928, 1.107345, -1.315958, 1, 1, 1, 1, 1,
-0.7204192, 1.525506, -0.7385159, 1, 1, 1, 1, 1,
-0.7100386, -0.8426767, -4.126927, 1, 1, 1, 1, 1,
-0.705945, 0.9044015, -2.89006, 1, 1, 1, 1, 1,
-0.702855, 0.2531245, -0.9254767, 1, 1, 1, 1, 1,
-0.6862404, 0.2666461, -0.4459901, 1, 1, 1, 1, 1,
-0.6842583, -0.7469996, -2.721735, 1, 1, 1, 1, 1,
-0.6828338, -0.09982502, -1.370957, 1, 1, 1, 1, 1,
-0.6815288, -1.032992, -3.133164, 1, 1, 1, 1, 1,
-0.6719181, -2.138628, -1.992005, 0, 0, 1, 1, 1,
-0.6697271, -0.4585122, -2.988639, 1, 0, 0, 1, 1,
-0.663552, -0.8326755, -3.452823, 1, 0, 0, 1, 1,
-0.6480188, -0.2750955, -2.414385, 1, 0, 0, 1, 1,
-0.6470156, 1.921693, 0.7577306, 1, 0, 0, 1, 1,
-0.6408867, -1.24685, -2.537894, 1, 0, 0, 1, 1,
-0.6329803, -0.2558848, -1.903582, 0, 0, 0, 1, 1,
-0.6305074, -0.4248255, -3.853665, 0, 0, 0, 1, 1,
-0.629604, 0.465622, -1.947853, 0, 0, 0, 1, 1,
-0.6281784, 0.07777461, -0.3896097, 0, 0, 0, 1, 1,
-0.6229831, 2.380929, -0.7683408, 0, 0, 0, 1, 1,
-0.6223641, 1.520175, -2.205945, 0, 0, 0, 1, 1,
-0.6221686, -0.540599, -2.39811, 0, 0, 0, 1, 1,
-0.6200683, 1.447147, -0.5682823, 1, 1, 1, 1, 1,
-0.6162524, -0.05266739, -0.3724819, 1, 1, 1, 1, 1,
-0.610561, -0.1465771, -0.9315405, 1, 1, 1, 1, 1,
-0.6086541, 0.4433104, 0.3894607, 1, 1, 1, 1, 1,
-0.605633, -1.425951, -3.566322, 1, 1, 1, 1, 1,
-0.6019998, -1.781698, -2.056628, 1, 1, 1, 1, 1,
-0.5974981, 0.9804063, -1.302589, 1, 1, 1, 1, 1,
-0.5927899, -1.515734, -4.428213, 1, 1, 1, 1, 1,
-0.5884451, 0.2999549, -1.071271, 1, 1, 1, 1, 1,
-0.586512, 0.9342055, -2.324946, 1, 1, 1, 1, 1,
-0.5852808, -1.399822, -4.149279, 1, 1, 1, 1, 1,
-0.5836662, 1.731224, -1.328715, 1, 1, 1, 1, 1,
-0.5787649, 0.7032124, -0.2475167, 1, 1, 1, 1, 1,
-0.5785191, -0.9638001, -1.812059, 1, 1, 1, 1, 1,
-0.5783235, -0.3256268, -2.027017, 1, 1, 1, 1, 1,
-0.5754632, 0.3517879, -0.5021787, 0, 0, 1, 1, 1,
-0.5745683, 1.098001, -0.5455226, 1, 0, 0, 1, 1,
-0.5737467, 0.04298685, -0.3699276, 1, 0, 0, 1, 1,
-0.5714917, 0.8035859, -0.9041065, 1, 0, 0, 1, 1,
-0.5712776, -0.6909753, -0.7810788, 1, 0, 0, 1, 1,
-0.5636929, -0.05392643, -0.4988875, 1, 0, 0, 1, 1,
-0.5579019, 0.9267584, -0.6115515, 0, 0, 0, 1, 1,
-0.5534353, 0.6105248, -0.2043963, 0, 0, 0, 1, 1,
-0.5533989, 0.4262731, -2.260589, 0, 0, 0, 1, 1,
-0.5508645, 0.3535517, -0.6597335, 0, 0, 0, 1, 1,
-0.5469865, -0.1122136, -0.2539432, 0, 0, 0, 1, 1,
-0.536292, 0.08214585, -0.682531, 0, 0, 0, 1, 1,
-0.5321811, 1.022193, 0.6961914, 0, 0, 0, 1, 1,
-0.5260189, -2.22267, -2.488315, 1, 1, 1, 1, 1,
-0.5228677, -0.4388692, -1.065533, 1, 1, 1, 1, 1,
-0.5187282, -0.8737295, -4.967701, 1, 1, 1, 1, 1,
-0.5055279, -0.31725, -1.137127, 1, 1, 1, 1, 1,
-0.5047856, -0.4458964, -1.847204, 1, 1, 1, 1, 1,
-0.502919, 1.314188, -0.03100044, 1, 1, 1, 1, 1,
-0.501884, -1.151703, -1.139163, 1, 1, 1, 1, 1,
-0.5016816, 0.5095622, -0.009498762, 1, 1, 1, 1, 1,
-0.4916937, 1.213262, -0.9374965, 1, 1, 1, 1, 1,
-0.4840467, -1.171166, -3.320804, 1, 1, 1, 1, 1,
-0.4821161, -0.352265, 0.7030038, 1, 1, 1, 1, 1,
-0.4780899, 1.030498, -0.07530924, 1, 1, 1, 1, 1,
-0.4761375, -0.8009059, -2.33923, 1, 1, 1, 1, 1,
-0.4740953, 0.1221355, -0.824766, 1, 1, 1, 1, 1,
-0.4705032, 0.631637, -0.3943471, 1, 1, 1, 1, 1,
-0.4697743, -0.4962962, -2.905656, 0, 0, 1, 1, 1,
-0.4695387, -0.6741145, -2.555743, 1, 0, 0, 1, 1,
-0.4690254, -0.4740057, -1.909011, 1, 0, 0, 1, 1,
-0.4678001, 1.618747, -0.2782929, 1, 0, 0, 1, 1,
-0.4554375, 0.5138956, -0.7824252, 1, 0, 0, 1, 1,
-0.4517352, 0.3465375, -2.565577, 1, 0, 0, 1, 1,
-0.4471153, 0.1057753, -1.056123, 0, 0, 0, 1, 1,
-0.4443856, 0.1884767, -1.974179, 0, 0, 0, 1, 1,
-0.4423993, -0.508979, -2.39703, 0, 0, 0, 1, 1,
-0.4398493, 1.069802, 0.6151748, 0, 0, 0, 1, 1,
-0.4362878, 0.8880975, -0.7402326, 0, 0, 0, 1, 1,
-0.4316231, -0.2836589, 0.409444, 0, 0, 0, 1, 1,
-0.430119, 1.286662, -0.2491044, 0, 0, 0, 1, 1,
-0.4263131, 0.02331603, -1.654015, 1, 1, 1, 1, 1,
-0.42182, -0.2797295, -4.168154, 1, 1, 1, 1, 1,
-0.4157243, 0.2437863, 0.3765742, 1, 1, 1, 1, 1,
-0.4130156, -0.2028681, -1.877023, 1, 1, 1, 1, 1,
-0.4117182, 0.08089431, -1.56613, 1, 1, 1, 1, 1,
-0.409771, -0.1467433, -2.256422, 1, 1, 1, 1, 1,
-0.4069163, -1.040052, -3.293321, 1, 1, 1, 1, 1,
-0.4054183, 0.4142181, 0.02629433, 1, 1, 1, 1, 1,
-0.4040511, 0.2581987, 0.139431, 1, 1, 1, 1, 1,
-0.4030499, 0.2093625, -0.6061399, 1, 1, 1, 1, 1,
-0.4002104, -0.2448932, -2.362214, 1, 1, 1, 1, 1,
-0.3982354, -1.743381, -2.254548, 1, 1, 1, 1, 1,
-0.3959498, -0.2196522, -2.975291, 1, 1, 1, 1, 1,
-0.3950272, 1.689013, -2.048023, 1, 1, 1, 1, 1,
-0.3937696, -0.3184474, -2.579678, 1, 1, 1, 1, 1,
-0.3928441, -0.08818913, -2.488697, 0, 0, 1, 1, 1,
-0.3845908, -0.5719525, -2.767421, 1, 0, 0, 1, 1,
-0.3845681, -0.01156584, -2.296693, 1, 0, 0, 1, 1,
-0.3819787, 1.014737, 0.433861, 1, 0, 0, 1, 1,
-0.3791428, 0.3234243, -2.53411, 1, 0, 0, 1, 1,
-0.3789783, -1.041785, -3.137004, 1, 0, 0, 1, 1,
-0.3787064, -1.081892, -1.880739, 0, 0, 0, 1, 1,
-0.3741284, 0.7056261, -1.640325, 0, 0, 0, 1, 1,
-0.369673, 1.377941, -1.753847, 0, 0, 0, 1, 1,
-0.3645765, -0.004153029, -1.707646, 0, 0, 0, 1, 1,
-0.364239, 2.400132, 0.6211429, 0, 0, 0, 1, 1,
-0.357805, -1.595929, -2.534205, 0, 0, 0, 1, 1,
-0.3530414, -1.232183, -3.807956, 0, 0, 0, 1, 1,
-0.3525153, 1.731059, 0.04864316, 1, 1, 1, 1, 1,
-0.3517469, -0.597784, -1.134465, 1, 1, 1, 1, 1,
-0.3504609, 0.6663976, -1.552532, 1, 1, 1, 1, 1,
-0.3481961, -1.197261, -4.690335, 1, 1, 1, 1, 1,
-0.3453408, -0.2838652, -2.72283, 1, 1, 1, 1, 1,
-0.3395492, -0.8119339, -2.704452, 1, 1, 1, 1, 1,
-0.3355661, 0.9272254, 1.927158, 1, 1, 1, 1, 1,
-0.3348463, 0.4753442, -3.688671, 1, 1, 1, 1, 1,
-0.3268677, 0.3841999, 1.398757, 1, 1, 1, 1, 1,
-0.3248855, 0.1942602, -1.99769, 1, 1, 1, 1, 1,
-0.3230844, -1.178424, -1.684646, 1, 1, 1, 1, 1,
-0.3221799, -0.7964204, -3.312152, 1, 1, 1, 1, 1,
-0.3180563, -0.04602317, -0.5265884, 1, 1, 1, 1, 1,
-0.3091591, 1.3424, 0.2460483, 1, 1, 1, 1, 1,
-0.3088684, -1.359257, -4.831642, 1, 1, 1, 1, 1,
-0.3072734, 0.404336, -2.102522, 0, 0, 1, 1, 1,
-0.3061633, -0.0687549, -1.576375, 1, 0, 0, 1, 1,
-0.3054524, -1.047142, -2.021359, 1, 0, 0, 1, 1,
-0.29813, -1.107156, -2.132277, 1, 0, 0, 1, 1,
-0.2973498, 0.8687022, 0.8606049, 1, 0, 0, 1, 1,
-0.293391, -0.6894723, -2.967811, 1, 0, 0, 1, 1,
-0.2902984, -0.6580829, -2.44235, 0, 0, 0, 1, 1,
-0.2836856, 1.023866, -1.171806, 0, 0, 0, 1, 1,
-0.2767954, -2.401368, -4.816629, 0, 0, 0, 1, 1,
-0.2726707, 1.573027, 0.8323045, 0, 0, 0, 1, 1,
-0.2723572, 0.8371903, -1.656396, 0, 0, 0, 1, 1,
-0.2695987, 0.6936963, 1.024612, 0, 0, 0, 1, 1,
-0.2683052, 0.6258728, -0.7435294, 0, 0, 0, 1, 1,
-0.2655374, 0.4681717, 1.246119, 1, 1, 1, 1, 1,
-0.2638048, -0.5199158, -3.601562, 1, 1, 1, 1, 1,
-0.259754, -0.959133, -1.846421, 1, 1, 1, 1, 1,
-0.2594656, 1.299729, -0.2164263, 1, 1, 1, 1, 1,
-0.2583688, 0.3360388, 0.04039049, 1, 1, 1, 1, 1,
-0.2572397, -0.9879669, -3.645698, 1, 1, 1, 1, 1,
-0.2502588, -1.235498, -3.015964, 1, 1, 1, 1, 1,
-0.249049, -1.238349, -1.15091, 1, 1, 1, 1, 1,
-0.2450632, 0.5792173, -1.866459, 1, 1, 1, 1, 1,
-0.2446078, -1.269046, -2.744089, 1, 1, 1, 1, 1,
-0.2444293, 0.1142487, -0.2478788, 1, 1, 1, 1, 1,
-0.2443651, -0.4979737, -1.641688, 1, 1, 1, 1, 1,
-0.2428558, 0.9585267, -1.265912, 1, 1, 1, 1, 1,
-0.2400967, -0.5321431, -2.26857, 1, 1, 1, 1, 1,
-0.2399444, 0.608116, -2.428872, 1, 1, 1, 1, 1,
-0.2395074, -0.5043078, -1.611283, 0, 0, 1, 1, 1,
-0.2367341, -0.1249902, -3.718634, 1, 0, 0, 1, 1,
-0.2325535, 2.135484, -0.5444067, 1, 0, 0, 1, 1,
-0.2274094, -0.4567265, -2.409919, 1, 0, 0, 1, 1,
-0.2215645, 0.129947, -0.8183937, 1, 0, 0, 1, 1,
-0.2186928, 1.038754, -1.480349, 1, 0, 0, 1, 1,
-0.2179215, 0.6726608, 0.2052805, 0, 0, 0, 1, 1,
-0.2148923, -0.0372655, -1.933739, 0, 0, 0, 1, 1,
-0.2127419, 0.834153, 1.532739, 0, 0, 0, 1, 1,
-0.2116607, 1.658624, 0.3624152, 0, 0, 0, 1, 1,
-0.2109456, 0.4426546, -0.608359, 0, 0, 0, 1, 1,
-0.2081429, -0.2228346, -1.808039, 0, 0, 0, 1, 1,
-0.2062793, -0.04034066, -2.10851, 0, 0, 0, 1, 1,
-0.1991564, 0.3368005, -0.9770311, 1, 1, 1, 1, 1,
-0.1984299, -1.071018, -3.395128, 1, 1, 1, 1, 1,
-0.1980933, -0.61542, -0.9593665, 1, 1, 1, 1, 1,
-0.1974472, 0.6667487, -0.6595035, 1, 1, 1, 1, 1,
-0.189873, -0.2159334, -0.2047859, 1, 1, 1, 1, 1,
-0.1883439, 0.6954567, -0.01435961, 1, 1, 1, 1, 1,
-0.1806654, 0.2668076, 1.332945, 1, 1, 1, 1, 1,
-0.1790697, -0.2517555, -4.771899, 1, 1, 1, 1, 1,
-0.1745328, -0.3338849, -0.7921244, 1, 1, 1, 1, 1,
-0.1646535, -0.1674119, -2.416279, 1, 1, 1, 1, 1,
-0.1616989, 0.7588707, -0.9229823, 1, 1, 1, 1, 1,
-0.1546109, -1.963673, -2.029723, 1, 1, 1, 1, 1,
-0.1511871, -0.2804177, -2.441188, 1, 1, 1, 1, 1,
-0.147862, 0.02274431, -0.9855549, 1, 1, 1, 1, 1,
-0.1473601, -1.178889, -4.359448, 1, 1, 1, 1, 1,
-0.14565, -0.7170122, -3.916348, 0, 0, 1, 1, 1,
-0.1428307, -0.3116624, -0.3787583, 1, 0, 0, 1, 1,
-0.1424797, -0.2511771, -2.565292, 1, 0, 0, 1, 1,
-0.1414445, 0.9752578, -0.7798609, 1, 0, 0, 1, 1,
-0.140955, 0.08735094, -0.9117926, 1, 0, 0, 1, 1,
-0.1385971, 0.6073244, 1.322873, 1, 0, 0, 1, 1,
-0.1383453, -0.544737, -4.684484, 0, 0, 0, 1, 1,
-0.1379507, -1.005777, -3.479668, 0, 0, 0, 1, 1,
-0.133169, -1.179873, -3.925174, 0, 0, 0, 1, 1,
-0.1326554, 0.4317456, 1.213521, 0, 0, 0, 1, 1,
-0.1317488, 0.6163327, -0.9979796, 0, 0, 0, 1, 1,
-0.1278997, -0.3672115, -2.961942, 0, 0, 0, 1, 1,
-0.1254309, 0.6581304, 0.1741193, 0, 0, 0, 1, 1,
-0.1251244, 2.186399, 0.6139725, 1, 1, 1, 1, 1,
-0.1197561, -2.097353, -2.596032, 1, 1, 1, 1, 1,
-0.1181597, -1.105666, -2.608911, 1, 1, 1, 1, 1,
-0.1156621, 0.1746397, 1.0172, 1, 1, 1, 1, 1,
-0.1135945, 0.4896055, -0.4181164, 1, 1, 1, 1, 1,
-0.1122079, -0.7715629, -2.287146, 1, 1, 1, 1, 1,
-0.1116802, -0.2907481, -4.241937, 1, 1, 1, 1, 1,
-0.1070014, 0.3269411, -0.4610074, 1, 1, 1, 1, 1,
-0.1069576, 1.483509, -1.391873, 1, 1, 1, 1, 1,
-0.1064995, 1.142323, 2.409831, 1, 1, 1, 1, 1,
-0.09936842, 2.15167, -0.1974595, 1, 1, 1, 1, 1,
-0.09730883, -0.5256834, -2.453951, 1, 1, 1, 1, 1,
-0.09564105, 0.4047437, -0.5829731, 1, 1, 1, 1, 1,
-0.09207735, -2.624843, -0.705332, 1, 1, 1, 1, 1,
-0.09189651, 0.09893695, -1.283795, 1, 1, 1, 1, 1,
-0.08717985, 2.098165, -1.93033, 0, 0, 1, 1, 1,
-0.08364254, 0.266024, 0.756999, 1, 0, 0, 1, 1,
-0.08083852, -0.4264245, -2.630372, 1, 0, 0, 1, 1,
-0.07848664, 0.2119741, -3.028155, 1, 0, 0, 1, 1,
-0.07527895, 0.0631794, -0.5965228, 1, 0, 0, 1, 1,
-0.07524662, -1.848888, -6.50229, 1, 0, 0, 1, 1,
-0.06785822, -0.09855594, -1.756013, 0, 0, 0, 1, 1,
-0.06709149, 0.194096, -0.4130799, 0, 0, 0, 1, 1,
-0.06463382, -0.01501879, -2.719808, 0, 0, 0, 1, 1,
-0.05869297, 1.065414, 0.4262393, 0, 0, 0, 1, 1,
-0.05676153, -0.1364749, -4.041555, 0, 0, 0, 1, 1,
-0.05664554, 0.09521829, -0.1369565, 0, 0, 0, 1, 1,
-0.04847348, -0.4078779, -4.378296, 0, 0, 0, 1, 1,
-0.04718348, -0.2202079, -2.379084, 1, 1, 1, 1, 1,
-0.04644003, 1.717243, -0.2376301, 1, 1, 1, 1, 1,
-0.04318994, -1.147352, -0.5794199, 1, 1, 1, 1, 1,
-0.04175218, 0.7273082, 0.4432823, 1, 1, 1, 1, 1,
-0.04169444, 0.7017097, 0.7186457, 1, 1, 1, 1, 1,
-0.03822145, -1.65531, -3.535057, 1, 1, 1, 1, 1,
-0.03813059, -0.2197562, -2.373075, 1, 1, 1, 1, 1,
-0.03796905, 1.18391, -0.4779074, 1, 1, 1, 1, 1,
-0.03443684, 1.363464, 1.965271, 1, 1, 1, 1, 1,
-0.02631442, 0.03617527, 0.3489387, 1, 1, 1, 1, 1,
-0.0243273, 0.9317785, -1.207619, 1, 1, 1, 1, 1,
-0.02231429, -0.2709328, -3.598351, 1, 1, 1, 1, 1,
-0.021787, -0.4406973, -3.047441, 1, 1, 1, 1, 1,
-0.02123024, 0.4195049, 0.1479345, 1, 1, 1, 1, 1,
-0.01886792, -1.396373, -2.742944, 1, 1, 1, 1, 1,
-0.0170277, 1.701488, -0.02431954, 0, 0, 1, 1, 1,
-0.0162154, -0.3472012, -3.573849, 1, 0, 0, 1, 1,
-0.01525059, -0.0743041, -5.346668, 1, 0, 0, 1, 1,
-0.01036098, 1.810561, 1.083917, 1, 0, 0, 1, 1,
-0.008743998, 1.885742, -0.1340354, 1, 0, 0, 1, 1,
-0.006213551, -1.358095, -2.764168, 1, 0, 0, 1, 1,
-0.004630879, 0.08745484, 1.214945, 0, 0, 0, 1, 1,
-0.002634781, -0.845453, -4.283444, 0, 0, 0, 1, 1,
0.0009205242, -2.188835, 2.77581, 0, 0, 0, 1, 1,
0.001074605, -0.8103302, 2.298095, 0, 0, 0, 1, 1,
0.005781765, 1.411875, 0.3469385, 0, 0, 0, 1, 1,
0.007586741, -0.2384819, 3.643936, 0, 0, 0, 1, 1,
0.009632342, -0.7379959, 2.420252, 0, 0, 0, 1, 1,
0.01197153, -0.8844951, 2.992692, 1, 1, 1, 1, 1,
0.01395811, 1.046132, -1.305173, 1, 1, 1, 1, 1,
0.01421835, 0.2848285, -0.5887175, 1, 1, 1, 1, 1,
0.01543038, -0.6750027, 4.461047, 1, 1, 1, 1, 1,
0.01564606, -1.429178, 3.648437, 1, 1, 1, 1, 1,
0.01616918, -1.172823, 1.675579, 1, 1, 1, 1, 1,
0.02693859, 0.6679997, -0.7640496, 1, 1, 1, 1, 1,
0.02930314, -0.5718936, 5.458113, 1, 1, 1, 1, 1,
0.03027457, 1.261958, 0.06333232, 1, 1, 1, 1, 1,
0.04010168, 0.4262254, 0.8093072, 1, 1, 1, 1, 1,
0.04077234, -0.2418654, 3.837947, 1, 1, 1, 1, 1,
0.041667, 1.090166, 0.7193196, 1, 1, 1, 1, 1,
0.04515573, 0.3244775, 0.4668103, 1, 1, 1, 1, 1,
0.04717025, -1.349313, 2.614833, 1, 1, 1, 1, 1,
0.0485866, -1.655143, 2.101735, 1, 1, 1, 1, 1,
0.04956208, -0.3798756, 2.368103, 0, 0, 1, 1, 1,
0.04965628, -0.2378798, 2.86236, 1, 0, 0, 1, 1,
0.05091145, -1.438388, 3.377541, 1, 0, 0, 1, 1,
0.05247982, -0.8478615, 2.347005, 1, 0, 0, 1, 1,
0.05436967, -0.8102097, 2.708595, 1, 0, 0, 1, 1,
0.05473926, 0.3334524, 0.5540681, 1, 0, 0, 1, 1,
0.06147167, -1.078668, 2.911537, 0, 0, 0, 1, 1,
0.06276004, -1.93366, 3.563099, 0, 0, 0, 1, 1,
0.06882393, -1.866241, 3.58431, 0, 0, 0, 1, 1,
0.06913383, -0.1795124, 2.355082, 0, 0, 0, 1, 1,
0.07349441, 1.014232, 0.3376483, 0, 0, 0, 1, 1,
0.07642172, 0.6626161, 0.2421955, 0, 0, 0, 1, 1,
0.07994664, 0.1473182, 0.3579696, 0, 0, 0, 1, 1,
0.08312734, -1.226341, 2.563326, 1, 1, 1, 1, 1,
0.08445752, -0.2375085, 2.793499, 1, 1, 1, 1, 1,
0.08572696, 0.3650148, 0.1657319, 1, 1, 1, 1, 1,
0.08620819, -0.1354212, 2.312285, 1, 1, 1, 1, 1,
0.08989946, 0.2697936, 2.508749, 1, 1, 1, 1, 1,
0.09170505, -2.215369, 4.073456, 1, 1, 1, 1, 1,
0.09235132, 1.65057, -0.8724493, 1, 1, 1, 1, 1,
0.09318826, -0.09162856, 1.59027, 1, 1, 1, 1, 1,
0.09430341, 0.8044476, -0.1551586, 1, 1, 1, 1, 1,
0.09460036, 1.501803, -1.500417, 1, 1, 1, 1, 1,
0.09527266, -1.435103, 4.775399, 1, 1, 1, 1, 1,
0.1026285, 0.9108664, -0.7571848, 1, 1, 1, 1, 1,
0.1070743, -1.137629, 3.113849, 1, 1, 1, 1, 1,
0.1078855, -2.800584, 0.9639139, 1, 1, 1, 1, 1,
0.110105, 0.730455, 0.9147884, 1, 1, 1, 1, 1,
0.1128536, -0.4033535, 3.513868, 0, 0, 1, 1, 1,
0.1138278, 0.5771443, -0.07288331, 1, 0, 0, 1, 1,
0.1179594, -0.8857069, 3.193056, 1, 0, 0, 1, 1,
0.1183116, -0.3917416, 2.386366, 1, 0, 0, 1, 1,
0.1197409, 1.257032, -0.2764175, 1, 0, 0, 1, 1,
0.1221118, -0.09047752, 3.188444, 1, 0, 0, 1, 1,
0.1231764, 1.571325, -2.707792, 0, 0, 0, 1, 1,
0.1235439, 1.989746, 0.5535192, 0, 0, 0, 1, 1,
0.1251483, -0.5082943, 3.350621, 0, 0, 0, 1, 1,
0.1296761, 1.211088, -0.9570278, 0, 0, 0, 1, 1,
0.1353928, -0.5633509, 5.53955, 0, 0, 0, 1, 1,
0.1379233, 0.06583231, 0.2787351, 0, 0, 0, 1, 1,
0.1418325, 0.06956393, 1.711127, 0, 0, 0, 1, 1,
0.1443118, -0.7063206, 1.411436, 1, 1, 1, 1, 1,
0.1485074, -0.174295, 1.312653, 1, 1, 1, 1, 1,
0.1494509, -0.5301774, 4.484871, 1, 1, 1, 1, 1,
0.1515834, -0.9321659, 4.063287, 1, 1, 1, 1, 1,
0.1558492, -0.6076269, 1.095209, 1, 1, 1, 1, 1,
0.1620594, 0.2347691, 0.5124578, 1, 1, 1, 1, 1,
0.1627229, -0.6368233, 4.806056, 1, 1, 1, 1, 1,
0.1630065, -0.3472086, 2.634131, 1, 1, 1, 1, 1,
0.1680771, 2.098928, 1.78189, 1, 1, 1, 1, 1,
0.1688133, -2.444282, 3.266672, 1, 1, 1, 1, 1,
0.1711744, -0.7286203, 1.765974, 1, 1, 1, 1, 1,
0.1719442, 1.388236, -0.3064381, 1, 1, 1, 1, 1,
0.1721374, 0.6545261, 1.098318, 1, 1, 1, 1, 1,
0.1748654, -0.3778107, 3.893525, 1, 1, 1, 1, 1,
0.1766645, -0.5245385, 1.743317, 1, 1, 1, 1, 1,
0.1823138, -0.3613458, 2.904292, 0, 0, 1, 1, 1,
0.1849827, -0.1133746, 4.157739, 1, 0, 0, 1, 1,
0.189255, -0.3284006, 2.522239, 1, 0, 0, 1, 1,
0.1912423, -1.676129, 3.534089, 1, 0, 0, 1, 1,
0.201508, -0.456758, 2.426708, 1, 0, 0, 1, 1,
0.2075052, -0.4670106, 3.127487, 1, 0, 0, 1, 1,
0.2081916, -1.233734, 2.497358, 0, 0, 0, 1, 1,
0.2115754, -0.1226437, 0.8430912, 0, 0, 0, 1, 1,
0.2125065, -0.9387624, 3.429044, 0, 0, 0, 1, 1,
0.2145452, -1.757705, 1.778125, 0, 0, 0, 1, 1,
0.2157274, 1.259802, 0.5047874, 0, 0, 0, 1, 1,
0.2162052, 0.5968468, -1.076926, 0, 0, 0, 1, 1,
0.2184345, 1.189755, -0.7298642, 0, 0, 0, 1, 1,
0.2184711, 0.6043154, 0.770137, 1, 1, 1, 1, 1,
0.2216581, -0.4741589, 2.882899, 1, 1, 1, 1, 1,
0.221679, -0.1178273, 1.998312, 1, 1, 1, 1, 1,
0.2234785, -0.9050606, 1.826804, 1, 1, 1, 1, 1,
0.2270541, 1.013355, -1.425465, 1, 1, 1, 1, 1,
0.2278819, -0.484872, 2.837529, 1, 1, 1, 1, 1,
0.2286368, -0.1199195, 2.74799, 1, 1, 1, 1, 1,
0.2330441, 1.000096, 0.6994797, 1, 1, 1, 1, 1,
0.2452338, 0.2492184, 0.4645713, 1, 1, 1, 1, 1,
0.2467698, 1.277238, 1.644627, 1, 1, 1, 1, 1,
0.2478315, 0.8240675, 0.9821952, 1, 1, 1, 1, 1,
0.2482886, -1.581507, 4.257963, 1, 1, 1, 1, 1,
0.2523595, -0.4128383, 3.684665, 1, 1, 1, 1, 1,
0.2534161, 1.481067, 0.339344, 1, 1, 1, 1, 1,
0.2545586, 0.325783, 0.03293527, 1, 1, 1, 1, 1,
0.2579472, -0.06746487, 1.762205, 0, 0, 1, 1, 1,
0.2610034, -1.792172, 4.135811, 1, 0, 0, 1, 1,
0.2643974, -0.1924143, 1.549772, 1, 0, 0, 1, 1,
0.2669489, -0.3639612, 4.763889, 1, 0, 0, 1, 1,
0.2713791, -1.18448, 2.977771, 1, 0, 0, 1, 1,
0.2744052, 0.5003002, 0.8271982, 1, 0, 0, 1, 1,
0.2748267, -0.2843279, 3.19056, 0, 0, 0, 1, 1,
0.2750975, -0.1657896, 3.013482, 0, 0, 0, 1, 1,
0.2758643, 1.289661, -0.07631741, 0, 0, 0, 1, 1,
0.2770207, 0.2416638, 0.8511497, 0, 0, 0, 1, 1,
0.2785044, 0.3611906, 0.110877, 0, 0, 0, 1, 1,
0.2831607, -0.6029091, 1.901929, 0, 0, 0, 1, 1,
0.2855784, -0.3858519, 1.815027, 0, 0, 0, 1, 1,
0.2880023, 0.4107822, 2.259332, 1, 1, 1, 1, 1,
0.2955826, 3.082732, 0.2952741, 1, 1, 1, 1, 1,
0.2959569, -1.002856, 2.693127, 1, 1, 1, 1, 1,
0.2961459, 1.608524, 0.0214972, 1, 1, 1, 1, 1,
0.2965398, 1.540297, -0.8326963, 1, 1, 1, 1, 1,
0.303497, -1.190012, 2.858994, 1, 1, 1, 1, 1,
0.3061929, 1.50837, 0.7372729, 1, 1, 1, 1, 1,
0.3068866, 1.02166, -1.432443, 1, 1, 1, 1, 1,
0.3092631, -0.7342887, 3.051929, 1, 1, 1, 1, 1,
0.3100301, -0.5373768, 2.814062, 1, 1, 1, 1, 1,
0.3127307, -1.570104, 2.672273, 1, 1, 1, 1, 1,
0.3203442, -0.1091698, 4.275164, 1, 1, 1, 1, 1,
0.3203731, 1.870719, 0.1056027, 1, 1, 1, 1, 1,
0.3254592, 0.2197607, 1.229512, 1, 1, 1, 1, 1,
0.3267561, -0.9482086, 1.952635, 1, 1, 1, 1, 1,
0.329983, -0.5531123, 2.04589, 0, 0, 1, 1, 1,
0.3333062, -1.134, 2.344152, 1, 0, 0, 1, 1,
0.3351335, -0.8005531, 1.338351, 1, 0, 0, 1, 1,
0.3365085, 0.4636053, 0.6098719, 1, 0, 0, 1, 1,
0.3372048, -0.5958278, 2.600931, 1, 0, 0, 1, 1,
0.3380294, -0.08531132, 1.891906, 1, 0, 0, 1, 1,
0.3384676, -0.8559196, 3.008732, 0, 0, 0, 1, 1,
0.3393061, -0.007884747, 0.7417918, 0, 0, 0, 1, 1,
0.3401796, 0.37756, 0.1700867, 0, 0, 0, 1, 1,
0.3406951, -0.9649606, 4.132146, 0, 0, 0, 1, 1,
0.3448515, -0.2704659, 2.624066, 0, 0, 0, 1, 1,
0.3462248, 0.4016151, 1.927652, 0, 0, 0, 1, 1,
0.3501521, -0.06753764, 1.768457, 0, 0, 0, 1, 1,
0.3586361, 1.611508, 0.2002877, 1, 1, 1, 1, 1,
0.3637837, -0.4895401, 1.104985, 1, 1, 1, 1, 1,
0.3670304, -0.3163909, 1.383843, 1, 1, 1, 1, 1,
0.3673559, -1.36718, 2.310548, 1, 1, 1, 1, 1,
0.3708548, 0.956125, -0.01123828, 1, 1, 1, 1, 1,
0.3738354, -0.8167195, 2.726997, 1, 1, 1, 1, 1,
0.3770204, 0.5446221, -0.9781354, 1, 1, 1, 1, 1,
0.3771084, -0.09073221, 2.7415, 1, 1, 1, 1, 1,
0.378523, -1.626834, 4.448778, 1, 1, 1, 1, 1,
0.3848925, 0.3280241, 2.594184, 1, 1, 1, 1, 1,
0.3893569, -0.8754798, 3.637861, 1, 1, 1, 1, 1,
0.3895623, 1.2819, 0.2268163, 1, 1, 1, 1, 1,
0.3919555, 0.8839118, 0.4217653, 1, 1, 1, 1, 1,
0.3924645, 0.2864371, 0.6798277, 1, 1, 1, 1, 1,
0.3952333, 1.343474, 0.02755336, 1, 1, 1, 1, 1,
0.3983771, -1.002654, 3.384128, 0, 0, 1, 1, 1,
0.3996242, -0.4036269, 1.89628, 1, 0, 0, 1, 1,
0.3999766, -0.4115549, -0.07779273, 1, 0, 0, 1, 1,
0.4011402, -0.1080156, 1.061249, 1, 0, 0, 1, 1,
0.4013646, 0.5660362, 1.129791, 1, 0, 0, 1, 1,
0.4015852, 0.6788694, 1.481244, 1, 0, 0, 1, 1,
0.4057692, -0.4957736, 3.515949, 0, 0, 0, 1, 1,
0.4063998, -1.632545, 1.566649, 0, 0, 0, 1, 1,
0.4074844, 1.500902, 0.3193995, 0, 0, 0, 1, 1,
0.4082276, -0.1872138, 3.25452, 0, 0, 0, 1, 1,
0.4087673, 0.1816954, 0.5409957, 0, 0, 0, 1, 1,
0.4109528, -1.662244, 1.906407, 0, 0, 0, 1, 1,
0.4127547, 1.985336, 1.462908, 0, 0, 0, 1, 1,
0.4170169, 1.850452, -0.08032852, 1, 1, 1, 1, 1,
0.421315, -0.01450001, 0.7180433, 1, 1, 1, 1, 1,
0.4213255, -0.2244025, 0.8248914, 1, 1, 1, 1, 1,
0.4214903, -1.15602, 3.58316, 1, 1, 1, 1, 1,
0.4280708, 0.0328881, 1.318169, 1, 1, 1, 1, 1,
0.4282272, 0.8015314, 0.4412031, 1, 1, 1, 1, 1,
0.4305086, -1.305079, 3.782902, 1, 1, 1, 1, 1,
0.4309667, -1.107029, 1.745043, 1, 1, 1, 1, 1,
0.4340115, -1.119191, 2.046485, 1, 1, 1, 1, 1,
0.4395951, -0.1673765, 1.156171, 1, 1, 1, 1, 1,
0.442674, 3.357806, 0.5361453, 1, 1, 1, 1, 1,
0.4430429, -1.744166, 1.986746, 1, 1, 1, 1, 1,
0.4445699, -0.06084282, 1.085571, 1, 1, 1, 1, 1,
0.4457219, -2.112129, 2.976481, 1, 1, 1, 1, 1,
0.4474049, -0.8397864, 3.31561, 1, 1, 1, 1, 1,
0.4479249, 0.9316021, -2.303694, 0, 0, 1, 1, 1,
0.4509786, 1.002337, -0.05594089, 1, 0, 0, 1, 1,
0.4532208, 0.5476571, -0.01592875, 1, 0, 0, 1, 1,
0.4570737, 0.1948941, 1.093976, 1, 0, 0, 1, 1,
0.4599186, -0.8055639, 2.234931, 1, 0, 0, 1, 1,
0.4618681, 0.880008, 0.2105206, 1, 0, 0, 1, 1,
0.4648412, -1.184608, 2.43889, 0, 0, 0, 1, 1,
0.4648805, -0.319607, 2.6658, 0, 0, 0, 1, 1,
0.4653366, -0.1017406, 3.689794, 0, 0, 0, 1, 1,
0.468208, 0.3807135, 0.09264158, 0, 0, 0, 1, 1,
0.4690089, 0.4167194, 0.2861214, 0, 0, 0, 1, 1,
0.4718203, -0.8310831, 3.640512, 0, 0, 0, 1, 1,
0.4809763, -1.173528, 2.580492, 0, 0, 0, 1, 1,
0.4836931, -0.173084, 2.328006, 1, 1, 1, 1, 1,
0.4841403, -0.1798533, 1.993919, 1, 1, 1, 1, 1,
0.4875644, 1.096139, 0.1249023, 1, 1, 1, 1, 1,
0.4879394, 1.242618, -1.068248, 1, 1, 1, 1, 1,
0.4883174, -1.212716, 4.008996, 1, 1, 1, 1, 1,
0.4899096, -2.264569, 2.158636, 1, 1, 1, 1, 1,
0.5008541, -0.3773774, 2.777411, 1, 1, 1, 1, 1,
0.5009376, -0.5952454, 1.07539, 1, 1, 1, 1, 1,
0.5072137, -0.4827317, 2.884514, 1, 1, 1, 1, 1,
0.5138084, -0.3339279, 1.95737, 1, 1, 1, 1, 1,
0.5197077, -0.9316037, 3.171905, 1, 1, 1, 1, 1,
0.5202466, -0.03683701, 1.349114, 1, 1, 1, 1, 1,
0.5287755, -1.183392, 2.754627, 1, 1, 1, 1, 1,
0.5306678, 0.3032936, 1.186669, 1, 1, 1, 1, 1,
0.5325655, 1.470527, -1.26135, 1, 1, 1, 1, 1,
0.5337538, 1.051881, 0.1570426, 0, 0, 1, 1, 1,
0.544567, -1.742373, 2.303628, 1, 0, 0, 1, 1,
0.5474205, -1.114633, 2.376377, 1, 0, 0, 1, 1,
0.5488954, -1.609922, 0.9730392, 1, 0, 0, 1, 1,
0.5574786, 0.2931732, -0.2257149, 1, 0, 0, 1, 1,
0.5597209, 0.3186575, 0.3508749, 1, 0, 0, 1, 1,
0.5666898, 0.3716759, 1.450042, 0, 0, 0, 1, 1,
0.5672114, -0.526403, 2.226582, 0, 0, 0, 1, 1,
0.5672382, -1.36437, 3.792418, 0, 0, 0, 1, 1,
0.5677462, -0.2629888, 0.6976985, 0, 0, 0, 1, 1,
0.5683924, 0.8021357, -0.1499342, 0, 0, 0, 1, 1,
0.5745461, -0.4740893, 1.89571, 0, 0, 0, 1, 1,
0.5762321, -0.3594584, 1.055986, 0, 0, 0, 1, 1,
0.5805147, -2.499169, 1.840041, 1, 1, 1, 1, 1,
0.5811675, 0.3200368, 0.7029823, 1, 1, 1, 1, 1,
0.583043, 0.08760196, 1.338034, 1, 1, 1, 1, 1,
0.5830499, 0.6835144, -0.1683521, 1, 1, 1, 1, 1,
0.5884448, 0.6265697, 0.2854651, 1, 1, 1, 1, 1,
0.5906929, 1.342116, 1.051666, 1, 1, 1, 1, 1,
0.592076, -0.2908406, 1.570272, 1, 1, 1, 1, 1,
0.5928459, -1.174054, 3.835075, 1, 1, 1, 1, 1,
0.6015312, -0.4336045, 1.151109, 1, 1, 1, 1, 1,
0.6037918, 0.9723417, -0.7665182, 1, 1, 1, 1, 1,
0.6051893, -1.91509, 2.885987, 1, 1, 1, 1, 1,
0.6054372, 0.3441993, -1.39363, 1, 1, 1, 1, 1,
0.6060327, -0.3372318, 3.084275, 1, 1, 1, 1, 1,
0.6078588, 0.3175873, 1.538634, 1, 1, 1, 1, 1,
0.6097886, -0.5118289, 0.8199195, 1, 1, 1, 1, 1,
0.6103985, -1.763517, 3.943399, 0, 0, 1, 1, 1,
0.6126114, 2.05758, 0.03549104, 1, 0, 0, 1, 1,
0.6136063, -0.1543618, 1.752024, 1, 0, 0, 1, 1,
0.6153597, -0.1836047, 3.333432, 1, 0, 0, 1, 1,
0.6155239, -1.51779, 4.776471, 1, 0, 0, 1, 1,
0.6183489, -0.6619653, 2.959669, 1, 0, 0, 1, 1,
0.6195405, -0.3078828, 1.018413, 0, 0, 0, 1, 1,
0.6239485, -0.9814601, 2.78154, 0, 0, 0, 1, 1,
0.6300111, 1.691625, -0.7659504, 0, 0, 0, 1, 1,
0.6302789, 0.03694519, 2.102502, 0, 0, 0, 1, 1,
0.6335057, 0.4540592, 0.8333634, 0, 0, 0, 1, 1,
0.6362787, 1.522702, 1.598259, 0, 0, 0, 1, 1,
0.6415782, -0.141602, 1.650385, 0, 0, 0, 1, 1,
0.6429301, -0.8288359, 1.266832, 1, 1, 1, 1, 1,
0.6453948, -0.5871729, 1.473403, 1, 1, 1, 1, 1,
0.6506206, -0.7594358, 3.823088, 1, 1, 1, 1, 1,
0.6536123, -1.433565, 2.16499, 1, 1, 1, 1, 1,
0.654245, 0.002483546, -0.8090979, 1, 1, 1, 1, 1,
0.6542767, -0.5291874, 2.005772, 1, 1, 1, 1, 1,
0.6574364, -0.08428364, 1.931312, 1, 1, 1, 1, 1,
0.6609653, -0.008361056, 0.2373472, 1, 1, 1, 1, 1,
0.6722882, -1.16714, 1.284583, 1, 1, 1, 1, 1,
0.6728078, 0.6129158, 3.121294, 1, 1, 1, 1, 1,
0.6735498, 0.1320001, 2.338415, 1, 1, 1, 1, 1,
0.6746531, 0.6381788, -0.5375561, 1, 1, 1, 1, 1,
0.6768678, 1.503785, -0.4550437, 1, 1, 1, 1, 1,
0.6811508, 0.5041309, -0.1996648, 1, 1, 1, 1, 1,
0.6816477, 1.31445, -0.1373938, 1, 1, 1, 1, 1,
0.6825489, 1.472035, 0.1837517, 0, 0, 1, 1, 1,
0.6898932, -1.239503, 2.197109, 1, 0, 0, 1, 1,
0.6909117, 0.2109873, 0.7459338, 1, 0, 0, 1, 1,
0.6913643, 0.7860499, 1.471524, 1, 0, 0, 1, 1,
0.6915314, -1.215894, 3.177369, 1, 0, 0, 1, 1,
0.6916475, -1.604798, 1.466455, 1, 0, 0, 1, 1,
0.6934859, -0.7991387, 0.9159529, 0, 0, 0, 1, 1,
0.693508, 0.9828562, 2.358048, 0, 0, 0, 1, 1,
0.6961621, -0.7394596, 3.912752, 0, 0, 0, 1, 1,
0.6971144, -0.2208782, 1.454112, 0, 0, 0, 1, 1,
0.6982273, -0.7947146, 2.604486, 0, 0, 0, 1, 1,
0.702101, 2.148976, -0.6001958, 0, 0, 0, 1, 1,
0.7035463, -0.3266687, 1.431144, 0, 0, 0, 1, 1,
0.7066938, -0.3488351, -0.1022418, 1, 1, 1, 1, 1,
0.7066951, 0.03431771, 2.435797, 1, 1, 1, 1, 1,
0.7076293, -1.306467, 2.411, 1, 1, 1, 1, 1,
0.7094896, -0.2246746, 1.482362, 1, 1, 1, 1, 1,
0.7172247, -0.4680762, 1.384803, 1, 1, 1, 1, 1,
0.7217404, 0.06140696, 2.15222, 1, 1, 1, 1, 1,
0.7222486, 0.2030033, 0.5216759, 1, 1, 1, 1, 1,
0.7243119, 0.13023, 2.280923, 1, 1, 1, 1, 1,
0.72531, 1.069744, 1.614313, 1, 1, 1, 1, 1,
0.7288787, -0.446164, 2.479899, 1, 1, 1, 1, 1,
0.7339213, 0.5646377, 2.267689, 1, 1, 1, 1, 1,
0.7376161, 2.233608, 0.4942904, 1, 1, 1, 1, 1,
0.7382264, -0.4430183, 2.85676, 1, 1, 1, 1, 1,
0.7404971, -2.442878, 3.370862, 1, 1, 1, 1, 1,
0.7408518, 2.890176, 2.290462, 1, 1, 1, 1, 1,
0.7449689, 1.884954, 0.5236244, 0, 0, 1, 1, 1,
0.7497208, 0.3338128, 1.357229, 1, 0, 0, 1, 1,
0.7641829, 0.3097917, 1.415473, 1, 0, 0, 1, 1,
0.7734306, 1.89899, -0.1912973, 1, 0, 0, 1, 1,
0.7763759, 0.1036787, 3.795857, 1, 0, 0, 1, 1,
0.7801095, -0.7271908, 3.453548, 1, 0, 0, 1, 1,
0.7808132, 2.110242, 0.161155, 0, 0, 0, 1, 1,
0.7831667, 0.7395861, 1.475438, 0, 0, 0, 1, 1,
0.7841386, -2.488936, 2.808476, 0, 0, 0, 1, 1,
0.7914893, -0.3394568, 1.559948, 0, 0, 0, 1, 1,
0.7941256, -1.217464, 1.298125, 0, 0, 0, 1, 1,
0.7962401, -1.818024, 2.775727, 0, 0, 0, 1, 1,
0.7967615, 0.8819838, 0.3441953, 0, 0, 0, 1, 1,
0.7970019, -1.137199, 1.490045, 1, 1, 1, 1, 1,
0.797668, 1.603973, -0.5957181, 1, 1, 1, 1, 1,
0.8031511, 1.461552, -0.5514879, 1, 1, 1, 1, 1,
0.806378, -1.49051, 2.773276, 1, 1, 1, 1, 1,
0.8074771, -1.132104, 2.246025, 1, 1, 1, 1, 1,
0.8113252, -0.2026687, 1.94501, 1, 1, 1, 1, 1,
0.8166559, 0.01401642, -0.7125266, 1, 1, 1, 1, 1,
0.8192862, 1.12474, 0.8110839, 1, 1, 1, 1, 1,
0.8207325, 0.2376873, 0.9465808, 1, 1, 1, 1, 1,
0.8223953, -0.2039385, 1.13075, 1, 1, 1, 1, 1,
0.8339694, 2.307417, 1.500009, 1, 1, 1, 1, 1,
0.8341956, 0.9111108, -0.855787, 1, 1, 1, 1, 1,
0.8367105, 0.7227836, 1.292746, 1, 1, 1, 1, 1,
0.8405037, -1.323578, 2.959345, 1, 1, 1, 1, 1,
0.8420619, -0.3951076, 0.6464082, 1, 1, 1, 1, 1,
0.8474542, -1.575457, 3.051215, 0, 0, 1, 1, 1,
0.8475496, 1.004931, 0.6985502, 1, 0, 0, 1, 1,
0.8521699, 0.8065659, -1.225623, 1, 0, 0, 1, 1,
0.8526776, -0.4817977, 2.87936, 1, 0, 0, 1, 1,
0.8569694, 0.1298728, 1.648103, 1, 0, 0, 1, 1,
0.8652844, 1.22468, -1.881114, 1, 0, 0, 1, 1,
0.8670503, 1.10353, 1.056463, 0, 0, 0, 1, 1,
0.8675448, -0.06194747, 2.498819, 0, 0, 0, 1, 1,
0.8683805, 2.353833, -0.8170871, 0, 0, 0, 1, 1,
0.8726372, -0.1772994, 2.799235, 0, 0, 0, 1, 1,
0.8775416, -0.5294219, 0.5076865, 0, 0, 0, 1, 1,
0.8791233, 1.189285, 2.894955, 0, 0, 0, 1, 1,
0.883742, 0.2076838, 1.757145, 0, 0, 0, 1, 1,
0.8894552, -0.1435524, 1.8533, 1, 1, 1, 1, 1,
0.8922862, 0.2125522, 0.6205908, 1, 1, 1, 1, 1,
0.8939335, -1.128628, 2.888287, 1, 1, 1, 1, 1,
0.8962164, -0.6405746, 1.706068, 1, 1, 1, 1, 1,
0.8989229, 0.4138075, -1.267829, 1, 1, 1, 1, 1,
0.9026307, -0.8568021, 2.787917, 1, 1, 1, 1, 1,
0.9133878, -0.4252915, 1.950507, 1, 1, 1, 1, 1,
0.9142043, 2.896127, 0.6387224, 1, 1, 1, 1, 1,
0.9149084, -1.690255, 2.329465, 1, 1, 1, 1, 1,
0.922274, 0.3809868, 0.8200161, 1, 1, 1, 1, 1,
0.923276, 2.423923, 0.83523, 1, 1, 1, 1, 1,
0.9240803, -0.6282882, 0.8902473, 1, 1, 1, 1, 1,
0.9247009, 0.7212229, 0.9679283, 1, 1, 1, 1, 1,
0.9262397, 1.355536, -0.8453699, 1, 1, 1, 1, 1,
0.9271972, 1.047493, 0.3082266, 1, 1, 1, 1, 1,
0.9272999, 0.6600361, 0.6978627, 0, 0, 1, 1, 1,
0.937639, -0.5250003, 0.9404192, 1, 0, 0, 1, 1,
0.937788, -0.4487719, 2.149691, 1, 0, 0, 1, 1,
0.9403356, -0.2155325, 3.137114, 1, 0, 0, 1, 1,
0.9451749, 0.6204145, 0.7596678, 1, 0, 0, 1, 1,
0.9471498, 1.320758, 0.4425734, 1, 0, 0, 1, 1,
0.9519633, -1.20826, 4.547474, 0, 0, 0, 1, 1,
0.9692785, -1.068255, 3.22827, 0, 0, 0, 1, 1,
0.9696581, 0.224932, 1.92995, 0, 0, 0, 1, 1,
0.9803869, 0.9512708, 1.423744, 0, 0, 0, 1, 1,
0.9825515, -1.746346, 1.798396, 0, 0, 0, 1, 1,
1.010248, -0.003209265, 1.003956, 0, 0, 0, 1, 1,
1.012205, -1.339465, 3.691224, 0, 0, 0, 1, 1,
1.013407, 1.576674, 0.274407, 1, 1, 1, 1, 1,
1.016293, 0.967441, 0.269401, 1, 1, 1, 1, 1,
1.017846, 1.313807, 0.4133272, 1, 1, 1, 1, 1,
1.019229, 0.6296776, 0.9993128, 1, 1, 1, 1, 1,
1.025705, 1.072827, 0.8922436, 1, 1, 1, 1, 1,
1.027242, 0.3526584, 2.222279, 1, 1, 1, 1, 1,
1.029219, 0.8989775, 1.454082, 1, 1, 1, 1, 1,
1.038245, -0.09149735, 1.533599, 1, 1, 1, 1, 1,
1.043808, 1.969564, -0.3630537, 1, 1, 1, 1, 1,
1.047153, 1.821981, 0.2157638, 1, 1, 1, 1, 1,
1.051588, -1.384332, 3.293561, 1, 1, 1, 1, 1,
1.060863, 1.231109, 0.2069492, 1, 1, 1, 1, 1,
1.078828, 0.3586662, 1.307625, 1, 1, 1, 1, 1,
1.079329, 0.4477751, 1.004333, 1, 1, 1, 1, 1,
1.079525, -0.7242283, 1.630622, 1, 1, 1, 1, 1,
1.082386, -0.6744633, 2.52347, 0, 0, 1, 1, 1,
1.085162, -0.4882203, 0.9048442, 1, 0, 0, 1, 1,
1.086056, 0.6813891, 0.7594773, 1, 0, 0, 1, 1,
1.090085, 1.048694, 1.027893, 1, 0, 0, 1, 1,
1.090165, 0.6224417, 1.290429, 1, 0, 0, 1, 1,
1.092459, -0.5501417, 2.959904, 1, 0, 0, 1, 1,
1.099311, -0.3646364, 1.459381, 0, 0, 0, 1, 1,
1.101085, -0.618764, 1.239001, 0, 0, 0, 1, 1,
1.105648, 0.6191154, 1.088463, 0, 0, 0, 1, 1,
1.106959, -0.8101462, 2.482637, 0, 0, 0, 1, 1,
1.107816, 0.4735531, 1.777194, 0, 0, 0, 1, 1,
1.108162, -1.817038, 1.635299, 0, 0, 0, 1, 1,
1.114275, -1.713668, 2.579959, 0, 0, 0, 1, 1,
1.115164, 2.230518, 0.1049937, 1, 1, 1, 1, 1,
1.116451, 1.928329, 0.8128474, 1, 1, 1, 1, 1,
1.118511, 0.7115733, 1.658501, 1, 1, 1, 1, 1,
1.122449, -0.5270693, 2.655426, 1, 1, 1, 1, 1,
1.128249, -0.3106852, 2.40175, 1, 1, 1, 1, 1,
1.130416, -1.105966, 2.502643, 1, 1, 1, 1, 1,
1.139761, 0.9378917, 0.4152776, 1, 1, 1, 1, 1,
1.142046, 1.642557, 0.7354062, 1, 1, 1, 1, 1,
1.142223, -0.176512, 1.284328, 1, 1, 1, 1, 1,
1.152377, 0.4396718, 1.672383, 1, 1, 1, 1, 1,
1.15342, -2.189657, 1.040426, 1, 1, 1, 1, 1,
1.160707, -0.2249095, 0.4351262, 1, 1, 1, 1, 1,
1.165018, 1.128357, 1.803002, 1, 1, 1, 1, 1,
1.168557, -0.5022567, 2.012821, 1, 1, 1, 1, 1,
1.169403, -0.5218534, 1.714384, 1, 1, 1, 1, 1,
1.173231, -0.1121319, 4.278765, 0, 0, 1, 1, 1,
1.173793, -2.110572, 3.22437, 1, 0, 0, 1, 1,
1.17818, -0.08870281, 2.758472, 1, 0, 0, 1, 1,
1.17933, 0.06205254, 1.171769, 1, 0, 0, 1, 1,
1.202611, -1.883825, 2.518642, 1, 0, 0, 1, 1,
1.20725, 0.7955019, -0.4488109, 1, 0, 0, 1, 1,
1.213872, 0.5340632, 1.472333, 0, 0, 0, 1, 1,
1.230472, -0.2135032, 1.708627, 0, 0, 0, 1, 1,
1.232835, 0.07834157, 0.5092562, 0, 0, 0, 1, 1,
1.236943, -0.08647802, 0.1590527, 0, 0, 0, 1, 1,
1.237654, 0.5728174, 1.503243, 0, 0, 0, 1, 1,
1.243962, 0.6234967, 1.120472, 0, 0, 0, 1, 1,
1.244047, 0.1013231, 1.042294, 0, 0, 0, 1, 1,
1.253152, -0.4475886, 2.666662, 1, 1, 1, 1, 1,
1.256817, 0.7808878, 0.2148673, 1, 1, 1, 1, 1,
1.272932, -0.6253707, 0.8387502, 1, 1, 1, 1, 1,
1.273582, 0.007683881, 2.137827, 1, 1, 1, 1, 1,
1.273977, -0.9478494, 3.610092, 1, 1, 1, 1, 1,
1.281079, -0.1782727, -0.0004224828, 1, 1, 1, 1, 1,
1.281109, 0.9778121, 2.256468, 1, 1, 1, 1, 1,
1.293741, -2.092295, 2.203808, 1, 1, 1, 1, 1,
1.316015, -0.2508387, 1.332607, 1, 1, 1, 1, 1,
1.31796, -0.5661105, 2.537198, 1, 1, 1, 1, 1,
1.322784, 2.234321, 2.506879, 1, 1, 1, 1, 1,
1.327765, 0.1848598, 1.171814, 1, 1, 1, 1, 1,
1.330129, -0.7809721, 3.153996, 1, 1, 1, 1, 1,
1.332549, -0.5876731, 1.355523, 1, 1, 1, 1, 1,
1.334959, -2.893267, 3.758053, 1, 1, 1, 1, 1,
1.343042, -1.002297, 2.036877, 0, 0, 1, 1, 1,
1.351507, 0.7035759, 0.7182444, 1, 0, 0, 1, 1,
1.352238, -0.9287337, 2.73602, 1, 0, 0, 1, 1,
1.357377, 0.864465, 0.6160021, 1, 0, 0, 1, 1,
1.365025, -0.3461964, 1.894479, 1, 0, 0, 1, 1,
1.366473, -2.314956, 2.069167, 1, 0, 0, 1, 1,
1.3769, 0.40549, 1.110284, 0, 0, 0, 1, 1,
1.395999, -1.859876, 3.03552, 0, 0, 0, 1, 1,
1.401035, 0.7809668, 1.750683, 0, 0, 0, 1, 1,
1.403981, 1.616937, 0.6239206, 0, 0, 0, 1, 1,
1.405803, 0.4317062, 2.523088, 0, 0, 0, 1, 1,
1.41177, -0.7363161, 3.852278, 0, 0, 0, 1, 1,
1.422168, 0.7845997, 1.718185, 0, 0, 0, 1, 1,
1.422717, 0.4574227, 3.347629, 1, 1, 1, 1, 1,
1.424125, -0.8052144, 0.4706545, 1, 1, 1, 1, 1,
1.427065, -0.2519272, 2.986755, 1, 1, 1, 1, 1,
1.431858, 0.30202, 1.013617, 1, 1, 1, 1, 1,
1.435779, -1.866773, 2.049674, 1, 1, 1, 1, 1,
1.437758, -0.481446, 1.318604, 1, 1, 1, 1, 1,
1.445098, 0.278773, 0.4023573, 1, 1, 1, 1, 1,
1.450802, -1.964778, 3.90865, 1, 1, 1, 1, 1,
1.452995, 1.384224, 0.982473, 1, 1, 1, 1, 1,
1.482922, -0.7614824, 3.390302, 1, 1, 1, 1, 1,
1.492805, 0.6434291, 1.20439, 1, 1, 1, 1, 1,
1.500761, 0.6988323, 2.330974, 1, 1, 1, 1, 1,
1.515167, 1.772697, 1.59757, 1, 1, 1, 1, 1,
1.526069, 0.3082218, 1.042206, 1, 1, 1, 1, 1,
1.557038, 0.1360325, 1.606509, 1, 1, 1, 1, 1,
1.564415, -0.3042616, 0.1581649, 0, 0, 1, 1, 1,
1.584008, -0.3792794, 1.850239, 1, 0, 0, 1, 1,
1.605782, 0.08678775, 0.9819229, 1, 0, 0, 1, 1,
1.607648, -0.7078968, 2.08106, 1, 0, 0, 1, 1,
1.614384, 0.4433213, -0.4443026, 1, 0, 0, 1, 1,
1.622499, -0.4228258, 1.562222, 1, 0, 0, 1, 1,
1.626305, 0.1059915, 1.765301, 0, 0, 0, 1, 1,
1.634475, 0.4132501, 0.3255583, 0, 0, 0, 1, 1,
1.640199, -0.648062, 1.191141, 0, 0, 0, 1, 1,
1.657995, 1.389681, -0.7057453, 0, 0, 0, 1, 1,
1.662958, -1.474278, 3.29462, 0, 0, 0, 1, 1,
1.664893, 1.134462, 0.2803398, 0, 0, 0, 1, 1,
1.668515, -1.909158, 2.625831, 0, 0, 0, 1, 1,
1.709164, -0.05727153, 2.084863, 1, 1, 1, 1, 1,
1.715133, 1.084603, 1.531052, 1, 1, 1, 1, 1,
1.72225, 1.517485, 0.4807863, 1, 1, 1, 1, 1,
1.76151, 0.9002308, 0.3085033, 1, 1, 1, 1, 1,
1.762224, -0.7096488, 4.658358, 1, 1, 1, 1, 1,
1.763429, 0.3439667, 1.768512, 1, 1, 1, 1, 1,
1.767115, 0.3159859, 1.731044, 1, 1, 1, 1, 1,
1.788933, 0.9975123, 3.693572, 1, 1, 1, 1, 1,
1.793555, 1.741159, 0.1607309, 1, 1, 1, 1, 1,
1.814463, 1.436394, 0.4250151, 1, 1, 1, 1, 1,
1.838041, 0.02145022, 0.7177738, 1, 1, 1, 1, 1,
1.840886, -1.23706, 0.8239397, 1, 1, 1, 1, 1,
1.874179, 0.6214132, 0.1720713, 1, 1, 1, 1, 1,
1.874448, 1.204282, 0.3847986, 1, 1, 1, 1, 1,
1.887269, -0.6932701, 1.131966, 1, 1, 1, 1, 1,
1.996175, -0.5890241, 2.783068, 0, 0, 1, 1, 1,
1.999066, -0.6793706, 0.8486464, 1, 0, 0, 1, 1,
2.071456, -0.3991883, 1.799679, 1, 0, 0, 1, 1,
2.095516, -1.613832, 2.308305, 1, 0, 0, 1, 1,
2.137483, -0.5538055, 0.2623147, 1, 0, 0, 1, 1,
2.15835, 0.3625993, 0.3552787, 1, 0, 0, 1, 1,
2.162799, -0.1246732, 1.895001, 0, 0, 0, 1, 1,
2.189813, -1.222549, 0.5974098, 0, 0, 0, 1, 1,
2.190535, -0.7044972, 2.823807, 0, 0, 0, 1, 1,
2.226862, 1.795473, 2.241256, 0, 0, 0, 1, 1,
2.241502, 0.3420652, 0.6041427, 0, 0, 0, 1, 1,
2.262926, 0.1027264, 1.396773, 0, 0, 0, 1, 1,
2.289416, 0.7664135, 2.18253, 0, 0, 0, 1, 1,
2.362212, 0.1321381, 3.678866, 1, 1, 1, 1, 1,
2.380956, 0.6419906, 0.84212, 1, 1, 1, 1, 1,
2.535155, 0.6996266, 1.066192, 1, 1, 1, 1, 1,
2.551321, 0.03988233, 1.662291, 1, 1, 1, 1, 1,
2.552431, -0.9147462, 1.155828, 1, 1, 1, 1, 1,
2.586906, 1.423137, 2.360802, 1, 1, 1, 1, 1,
3.087893, -0.2629052, -0.03303383, 1, 1, 1, 1, 1
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
var radius = 10.16667;
var distance = 35.70999;
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
mvMatrix.translate( 0.283498, -0.2322692, 0.48137 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.70999);
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
