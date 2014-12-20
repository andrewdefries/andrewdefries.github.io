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
-3.488326, -0.5807228, -2.974457, 1, 0, 0, 1,
-3.408224, 2.085083, -1.763212, 1, 0.007843138, 0, 1,
-3.404413, 0.3442198, -1.616499, 1, 0.01176471, 0, 1,
-2.890674, 2.240467, -0.09869403, 1, 0.01960784, 0, 1,
-2.874089, -0.9110441, -1.881032, 1, 0.02352941, 0, 1,
-2.833321, 0.6547339, -0.3748884, 1, 0.03137255, 0, 1,
-2.739535, 0.6248962, -0.9455702, 1, 0.03529412, 0, 1,
-2.627158, -0.5105734, -2.114797, 1, 0.04313726, 0, 1,
-2.438537, -2.71382, -3.712328, 1, 0.04705882, 0, 1,
-2.370886, -0.6869277, -0.2813358, 1, 0.05490196, 0, 1,
-2.337738, -1.137782, -1.993529, 1, 0.05882353, 0, 1,
-2.3342, -0.1882986, -0.3628624, 1, 0.06666667, 0, 1,
-2.26756, -0.7974795, -1.469631, 1, 0.07058824, 0, 1,
-2.257399, 0.3033361, 0.4155372, 1, 0.07843138, 0, 1,
-2.255032, 0.482555, -0.2221152, 1, 0.08235294, 0, 1,
-2.248643, -0.2451793, -2.492072, 1, 0.09019608, 0, 1,
-2.22908, 0.7851511, -1.076396, 1, 0.09411765, 0, 1,
-2.221198, 0.8541896, -0.5132764, 1, 0.1019608, 0, 1,
-2.176127, 0.5205463, -2.178077, 1, 0.1098039, 0, 1,
-2.150666, -2.070523, -2.509752, 1, 0.1137255, 0, 1,
-2.134055, 0.01138348, -1.700036, 1, 0.1215686, 0, 1,
-2.094473, -0.851949, -0.8595299, 1, 0.1254902, 0, 1,
-2.076898, 1.4159, -0.4805656, 1, 0.1333333, 0, 1,
-2.074466, -0.3139765, -0.4055261, 1, 0.1372549, 0, 1,
-2.069226, 0.02727049, -2.505504, 1, 0.145098, 0, 1,
-2.066782, -1.671271, -0.3862438, 1, 0.1490196, 0, 1,
-2.063125, 0.114736, -1.655284, 1, 0.1568628, 0, 1,
-2.038649, -0.3483109, -1.034004, 1, 0.1607843, 0, 1,
-2.01252, -1.088602, -0.6408038, 1, 0.1686275, 0, 1,
-2.006296, 1.81481, -0.5306029, 1, 0.172549, 0, 1,
-1.980993, -0.6442949, -1.952165, 1, 0.1803922, 0, 1,
-1.959913, 0.3148727, -2.036579, 1, 0.1843137, 0, 1,
-1.95699, 1.422233, -0.9004177, 1, 0.1921569, 0, 1,
-1.950222, -0.06031387, -0.9853486, 1, 0.1960784, 0, 1,
-1.944279, 2.666504, -0.1876041, 1, 0.2039216, 0, 1,
-1.940706, 0.33095, -0.2631846, 1, 0.2117647, 0, 1,
-1.937124, -1.739097, -3.428961, 1, 0.2156863, 0, 1,
-1.934097, 0.7059136, -0.3051318, 1, 0.2235294, 0, 1,
-1.930123, -1.402845, -3.058293, 1, 0.227451, 0, 1,
-1.918266, -0.07230178, -2.449195, 1, 0.2352941, 0, 1,
-1.912773, -1.351264, -1.132416, 1, 0.2392157, 0, 1,
-1.896785, 0.8264362, -0.608186, 1, 0.2470588, 0, 1,
-1.895717, -0.2945524, -1.309114, 1, 0.2509804, 0, 1,
-1.871954, -0.9424869, -1.355497, 1, 0.2588235, 0, 1,
-1.860862, -0.6416888, -2.490319, 1, 0.2627451, 0, 1,
-1.858425, -0.855547, -1.952175, 1, 0.2705882, 0, 1,
-1.84263, 0.07682144, -2.522853, 1, 0.2745098, 0, 1,
-1.833744, -2.139531, -0.7324426, 1, 0.282353, 0, 1,
-1.81938, -1.463602, -0.07824925, 1, 0.2862745, 0, 1,
-1.80481, 0.6231552, -0.910904, 1, 0.2941177, 0, 1,
-1.799931, 0.9581807, -2.123298, 1, 0.3019608, 0, 1,
-1.79509, -0.1923241, -2.130988, 1, 0.3058824, 0, 1,
-1.785335, 1.242475, -0.8758685, 1, 0.3137255, 0, 1,
-1.776502, -0.8908529, -3.471704, 1, 0.3176471, 0, 1,
-1.774715, -0.2578668, -2.776016, 1, 0.3254902, 0, 1,
-1.760334, 0.0156918, -2.488597, 1, 0.3294118, 0, 1,
-1.722667, 1.470472, -2.498234, 1, 0.3372549, 0, 1,
-1.705913, -0.2864892, -1.555062, 1, 0.3411765, 0, 1,
-1.701304, -1.83991, -0.9768829, 1, 0.3490196, 0, 1,
-1.687074, 0.2072391, -1.083616, 1, 0.3529412, 0, 1,
-1.685897, 0.2849737, -1.317649, 1, 0.3607843, 0, 1,
-1.678946, -0.7463121, -0.7630233, 1, 0.3647059, 0, 1,
-1.664318, -0.07029936, -2.576422, 1, 0.372549, 0, 1,
-1.655409, 1.043318, -1.158984, 1, 0.3764706, 0, 1,
-1.648673, -0.4204522, -2.102977, 1, 0.3843137, 0, 1,
-1.645301, 1.066304, -2.700477, 1, 0.3882353, 0, 1,
-1.639686, -0.7490862, -1.082932, 1, 0.3960784, 0, 1,
-1.633735, 0.2169004, -0.9452844, 1, 0.4039216, 0, 1,
-1.62351, 0.5098238, 0.1853444, 1, 0.4078431, 0, 1,
-1.623323, -1.80708, -2.783254, 1, 0.4156863, 0, 1,
-1.62211, -1.187206, -1.658634, 1, 0.4196078, 0, 1,
-1.612315, -0.1376033, -1.956924, 1, 0.427451, 0, 1,
-1.585451, 0.6654602, -1.729942, 1, 0.4313726, 0, 1,
-1.570011, -0.609167, -0.4520059, 1, 0.4392157, 0, 1,
-1.560945, -0.8411978, -3.059199, 1, 0.4431373, 0, 1,
-1.558319, -0.5860895, -3.379671, 1, 0.4509804, 0, 1,
-1.549058, 0.2944388, -1.073395, 1, 0.454902, 0, 1,
-1.539406, 1.377254, 0.6386899, 1, 0.4627451, 0, 1,
-1.527492, 1.854546, -1.04209, 1, 0.4666667, 0, 1,
-1.52284, -0.6355971, -2.645511, 1, 0.4745098, 0, 1,
-1.521503, -0.6261287, -3.215951, 1, 0.4784314, 0, 1,
-1.521067, 1.32634, -0.6454457, 1, 0.4862745, 0, 1,
-1.511502, -0.1080311, -1.867918, 1, 0.4901961, 0, 1,
-1.501951, 1.046625, 0.004739135, 1, 0.4980392, 0, 1,
-1.489346, -1.450422, -1.970347, 1, 0.5058824, 0, 1,
-1.46822, 0.8287008, -1.14024, 1, 0.509804, 0, 1,
-1.467231, -2.286625, -2.498985, 1, 0.5176471, 0, 1,
-1.463908, 0.8789229, -0.8208866, 1, 0.5215687, 0, 1,
-1.461378, 1.162808, -0.19009, 1, 0.5294118, 0, 1,
-1.450495, 0.9028023, -1.791465, 1, 0.5333334, 0, 1,
-1.44544, 0.04585536, -2.930703, 1, 0.5411765, 0, 1,
-1.425838, 1.626572, -2.094404, 1, 0.5450981, 0, 1,
-1.421334, -0.5117252, -2.98399, 1, 0.5529412, 0, 1,
-1.421012, 2.265418, -1.093175, 1, 0.5568628, 0, 1,
-1.416891, -0.3975126, -1.356535, 1, 0.5647059, 0, 1,
-1.413246, 0.3715234, -3.038468, 1, 0.5686275, 0, 1,
-1.397785, 1.394711, -0.3444407, 1, 0.5764706, 0, 1,
-1.394136, -0.361858, -2.26614, 1, 0.5803922, 0, 1,
-1.390105, -0.8441067, -2.991242, 1, 0.5882353, 0, 1,
-1.379437, -0.2167308, -3.355014, 1, 0.5921569, 0, 1,
-1.375821, -0.3023743, -3.757848, 1, 0.6, 0, 1,
-1.371801, -0.9143856, -1.389173, 1, 0.6078432, 0, 1,
-1.371291, -1.529702, -3.035486, 1, 0.6117647, 0, 1,
-1.367329, 0.8518344, -1.706278, 1, 0.6196079, 0, 1,
-1.362891, -0.5017455, -2.036027, 1, 0.6235294, 0, 1,
-1.351355, -0.04550172, -0.3353968, 1, 0.6313726, 0, 1,
-1.347401, -0.5051351, -2.558002, 1, 0.6352941, 0, 1,
-1.344339, 1.121324, 0.6322527, 1, 0.6431373, 0, 1,
-1.334729, -0.4740188, -0.1468515, 1, 0.6470588, 0, 1,
-1.330436, -0.6490169, -1.702308, 1, 0.654902, 0, 1,
-1.326909, 0.04784738, -1.331477, 1, 0.6588235, 0, 1,
-1.319824, -1.47944, 0.1451788, 1, 0.6666667, 0, 1,
-1.309302, 0.4791392, -1.32524, 1, 0.6705883, 0, 1,
-1.299415, 0.9865528, 1.162081, 1, 0.6784314, 0, 1,
-1.295562, 2.00152, -1.337391, 1, 0.682353, 0, 1,
-1.288318, 2.24184, -0.5055926, 1, 0.6901961, 0, 1,
-1.28453, -0.6147584, -0.4193363, 1, 0.6941177, 0, 1,
-1.284349, 1.828248, 0.1269702, 1, 0.7019608, 0, 1,
-1.280727, -0.4412246, -1.139628, 1, 0.7098039, 0, 1,
-1.277279, -0.3676261, -0.3098491, 1, 0.7137255, 0, 1,
-1.276835, 0.5493469, -2.402719, 1, 0.7215686, 0, 1,
-1.271389, 0.5717981, -1.13733, 1, 0.7254902, 0, 1,
-1.269525, -1.465691, -1.556369, 1, 0.7333333, 0, 1,
-1.267517, -1.883729, -3.393551, 1, 0.7372549, 0, 1,
-1.262767, -1.814523, -1.720789, 1, 0.7450981, 0, 1,
-1.262089, -2.237807, -2.69182, 1, 0.7490196, 0, 1,
-1.259232, 0.3912429, 0.4050554, 1, 0.7568628, 0, 1,
-1.244871, -2.019162, -3.560259, 1, 0.7607843, 0, 1,
-1.239732, 0.1515777, -3.115494, 1, 0.7686275, 0, 1,
-1.233764, -0.3428878, -3.525176, 1, 0.772549, 0, 1,
-1.227752, 0.858321, -0.7148277, 1, 0.7803922, 0, 1,
-1.224594, -0.1114023, -2.117085, 1, 0.7843137, 0, 1,
-1.219487, 2.043121, -2.420967, 1, 0.7921569, 0, 1,
-1.218997, -0.3474276, -1.630517, 1, 0.7960784, 0, 1,
-1.211701, 1.558599, -0.3082725, 1, 0.8039216, 0, 1,
-1.206924, 0.5972514, -2.199265, 1, 0.8117647, 0, 1,
-1.205651, -2.339401, -3.043422, 1, 0.8156863, 0, 1,
-1.199077, 0.7502223, -1.304261, 1, 0.8235294, 0, 1,
-1.188048, -0.9544591, -1.456638, 1, 0.827451, 0, 1,
-1.186309, 0.228891, -2.277302, 1, 0.8352941, 0, 1,
-1.186295, -0.9670358, -3.248066, 1, 0.8392157, 0, 1,
-1.174783, 1.796555, -0.3384815, 1, 0.8470588, 0, 1,
-1.17021, 0.9412606, -1.817779, 1, 0.8509804, 0, 1,
-1.168978, 0.2770686, -0.5419002, 1, 0.8588235, 0, 1,
-1.168151, 0.1744172, 0.4845272, 1, 0.8627451, 0, 1,
-1.167904, 0.2787203, -0.7393242, 1, 0.8705882, 0, 1,
-1.165678, -0.8435164, -2.823067, 1, 0.8745098, 0, 1,
-1.165333, -0.000558973, -1.648281, 1, 0.8823529, 0, 1,
-1.159279, 2.977502, 0.1817831, 1, 0.8862745, 0, 1,
-1.158722, -0.09250399, -1.55195, 1, 0.8941177, 0, 1,
-1.156647, -0.7746496, -1.58918, 1, 0.8980392, 0, 1,
-1.150772, -0.8375069, -2.075077, 1, 0.9058824, 0, 1,
-1.150766, 1.703817, -0.1475551, 1, 0.9137255, 0, 1,
-1.147148, -0.5842805, -3.376422, 1, 0.9176471, 0, 1,
-1.146749, 0.5482365, -1.574963, 1, 0.9254902, 0, 1,
-1.146345, 0.200529, -1.293623, 1, 0.9294118, 0, 1,
-1.139243, -1.406143, -2.751988, 1, 0.9372549, 0, 1,
-1.133647, -0.7889428, -3.685463, 1, 0.9411765, 0, 1,
-1.129481, -1.394525, 0.295151, 1, 0.9490196, 0, 1,
-1.123003, 0.4957696, -1.560298, 1, 0.9529412, 0, 1,
-1.119834, -0.6543183, -2.070591, 1, 0.9607843, 0, 1,
-1.11922, 1.150391, 0.8641125, 1, 0.9647059, 0, 1,
-1.1136, -1.221025, -2.073754, 1, 0.972549, 0, 1,
-1.112548, -0.5969866, -1.900384, 1, 0.9764706, 0, 1,
-1.10653, 0.3643625, -0.1352769, 1, 0.9843137, 0, 1,
-1.094788, 1.407361, -0.6195289, 1, 0.9882353, 0, 1,
-1.070835, -1.208939, -1.672257, 1, 0.9960784, 0, 1,
-1.068415, -1.65949, -2.202339, 0.9960784, 1, 0, 1,
-1.068355, -0.08063281, -1.162155, 0.9921569, 1, 0, 1,
-1.067988, 0.1280787, -3.05105, 0.9843137, 1, 0, 1,
-1.066947, -1.040271, -1.558931, 0.9803922, 1, 0, 1,
-1.066725, -2.13051, -3.807827, 0.972549, 1, 0, 1,
-1.05469, -0.8566803, -2.306768, 0.9686275, 1, 0, 1,
-1.051221, -0.196009, -2.225609, 0.9607843, 1, 0, 1,
-1.048489, -0.1683817, -2.178447, 0.9568627, 1, 0, 1,
-1.046089, -0.1688303, -2.230227, 0.9490196, 1, 0, 1,
-1.043414, -0.09183013, -1.361101, 0.945098, 1, 0, 1,
-1.042295, -0.08942956, -1.433367, 0.9372549, 1, 0, 1,
-1.036478, -1.243499, -1.796055, 0.9333333, 1, 0, 1,
-1.014467, 0.5001709, -2.181349, 0.9254902, 1, 0, 1,
-1.009063, 0.2439139, -1.520012, 0.9215686, 1, 0, 1,
-1.007518, 0.9028023, -0.9649554, 0.9137255, 1, 0, 1,
-1.007219, 0.7036277, -1.581412, 0.9098039, 1, 0, 1,
-1.006695, -0.3245322, -3.319378, 0.9019608, 1, 0, 1,
-0.9977025, 1.245344, 1.012726, 0.8941177, 1, 0, 1,
-0.9964555, 0.4578332, -1.743873, 0.8901961, 1, 0, 1,
-0.9957029, 0.9823084, -2.745339, 0.8823529, 1, 0, 1,
-0.9882329, -0.4747414, -3.859866, 0.8784314, 1, 0, 1,
-0.9818146, 0.1205033, -0.8770028, 0.8705882, 1, 0, 1,
-0.9784542, 0.8800875, 0.2158354, 0.8666667, 1, 0, 1,
-0.9719183, 0.1629963, -0.9538528, 0.8588235, 1, 0, 1,
-0.9690683, 0.07551423, -0.1155947, 0.854902, 1, 0, 1,
-0.9645826, 0.2491028, -1.280708, 0.8470588, 1, 0, 1,
-0.96293, -0.5995597, -1.72218, 0.8431373, 1, 0, 1,
-0.9622208, 1.279718, -1.860414, 0.8352941, 1, 0, 1,
-0.9578953, 0.5546894, -1.144736, 0.8313726, 1, 0, 1,
-0.946953, -0.8765622, -1.925995, 0.8235294, 1, 0, 1,
-0.9452733, 0.2230558, -0.4473461, 0.8196079, 1, 0, 1,
-0.9402938, -1.961242, -3.104842, 0.8117647, 1, 0, 1,
-0.9353372, -1.722496, -3.162077, 0.8078431, 1, 0, 1,
-0.9315016, -1.096442, -3.422499, 0.8, 1, 0, 1,
-0.9294274, -1.127981, -1.954485, 0.7921569, 1, 0, 1,
-0.9184746, -0.04453331, 0.5985835, 0.7882353, 1, 0, 1,
-0.9176311, 0.4116652, -1.231349, 0.7803922, 1, 0, 1,
-0.9132175, 0.8376329, -1.314404, 0.7764706, 1, 0, 1,
-0.9111554, 1.535627, -1.360203, 0.7686275, 1, 0, 1,
-0.9110886, -1.053906, -1.921125, 0.7647059, 1, 0, 1,
-0.9074755, 1.184077, -1.34949, 0.7568628, 1, 0, 1,
-0.9045044, 1.839265, 0.2105021, 0.7529412, 1, 0, 1,
-0.878154, -0.1020733, -1.09927, 0.7450981, 1, 0, 1,
-0.8771589, 0.2020628, -0.9181958, 0.7411765, 1, 0, 1,
-0.8753156, -1.411666, -2.898019, 0.7333333, 1, 0, 1,
-0.8672907, 0.9050856, -0.8652038, 0.7294118, 1, 0, 1,
-0.8640738, 0.06203515, -2.303914, 0.7215686, 1, 0, 1,
-0.8601877, -0.6849104, -1.304556, 0.7176471, 1, 0, 1,
-0.855526, 1.306767, -1.545607, 0.7098039, 1, 0, 1,
-0.8554047, 1.447571, -1.224752, 0.7058824, 1, 0, 1,
-0.8492635, -0.6679939, -1.306856, 0.6980392, 1, 0, 1,
-0.8465951, 1.03795, -1.483222, 0.6901961, 1, 0, 1,
-0.8451065, 1.622953, -0.5371076, 0.6862745, 1, 0, 1,
-0.8434182, -1.450674, -2.183792, 0.6784314, 1, 0, 1,
-0.8394522, 0.3885863, -2.206131, 0.6745098, 1, 0, 1,
-0.8381511, -0.5092626, -1.188315, 0.6666667, 1, 0, 1,
-0.8379781, 0.5105937, -0.4765432, 0.6627451, 1, 0, 1,
-0.8362845, -0.03225286, -1.094717, 0.654902, 1, 0, 1,
-0.8356304, 0.3426989, -0.2176055, 0.6509804, 1, 0, 1,
-0.8311978, 0.8434949, -1.343418, 0.6431373, 1, 0, 1,
-0.8255374, -1.061499, -2.467613, 0.6392157, 1, 0, 1,
-0.8245271, 1.520931, -0.7046235, 0.6313726, 1, 0, 1,
-0.8201659, 0.3621313, 0.7666798, 0.627451, 1, 0, 1,
-0.8172908, 0.4583729, -2.599869, 0.6196079, 1, 0, 1,
-0.8156357, 1.297822, 0.2559564, 0.6156863, 1, 0, 1,
-0.8151358, 0.6960976, -0.4151405, 0.6078432, 1, 0, 1,
-0.8147157, -1.589651, -2.126249, 0.6039216, 1, 0, 1,
-0.8143548, 1.728746, -2.726808, 0.5960785, 1, 0, 1,
-0.8116407, 0.1642392, -1.603677, 0.5882353, 1, 0, 1,
-0.8111413, -0.3059887, -1.964365, 0.5843138, 1, 0, 1,
-0.8110813, -0.1594499, -0.9731881, 0.5764706, 1, 0, 1,
-0.8064685, -1.132128, -1.913696, 0.572549, 1, 0, 1,
-0.8045517, 1.200803, -0.3051783, 0.5647059, 1, 0, 1,
-0.8032535, -0.3723276, -2.930506, 0.5607843, 1, 0, 1,
-0.8021882, -1.396426, -1.743212, 0.5529412, 1, 0, 1,
-0.7984691, -0.621203, -3.678484, 0.5490196, 1, 0, 1,
-0.7960265, -1.259023, -2.190864, 0.5411765, 1, 0, 1,
-0.7656262, -0.3043559, -1.739911, 0.5372549, 1, 0, 1,
-0.7630143, 1.944211, -1.101393, 0.5294118, 1, 0, 1,
-0.7611125, 0.2237491, -1.579785, 0.5254902, 1, 0, 1,
-0.7594705, 1.073397, 1.66531, 0.5176471, 1, 0, 1,
-0.755406, -0.785569, -2.601039, 0.5137255, 1, 0, 1,
-0.7537824, -0.9676784, -2.037193, 0.5058824, 1, 0, 1,
-0.7509127, -1.122026, -2.594618, 0.5019608, 1, 0, 1,
-0.7472656, -0.6510671, -1.904974, 0.4941176, 1, 0, 1,
-0.7471873, 0.8263889, -1.38559, 0.4862745, 1, 0, 1,
-0.7413771, -0.4284633, -4.065672, 0.4823529, 1, 0, 1,
-0.7360941, 0.007470279, -0.856073, 0.4745098, 1, 0, 1,
-0.7307296, 1.264979, -1.644273, 0.4705882, 1, 0, 1,
-0.7216491, 1.414165, -0.04003214, 0.4627451, 1, 0, 1,
-0.7176977, -0.4135545, -2.91763, 0.4588235, 1, 0, 1,
-0.7168901, 0.1951102, -1.029286, 0.4509804, 1, 0, 1,
-0.7150192, 1.347909, -2.543358, 0.4470588, 1, 0, 1,
-0.7145048, -0.4409464, -1.8422, 0.4392157, 1, 0, 1,
-0.712029, 0.4427311, -1.292012, 0.4352941, 1, 0, 1,
-0.7109249, -0.08229271, -2.453964, 0.427451, 1, 0, 1,
-0.7074961, -0.4885078, -1.365215, 0.4235294, 1, 0, 1,
-0.7034104, -1.15697, -2.876755, 0.4156863, 1, 0, 1,
-0.7004388, 0.6129003, -1.707366, 0.4117647, 1, 0, 1,
-0.6990281, 0.6847293, -0.1426646, 0.4039216, 1, 0, 1,
-0.6981016, -0.0374929, -2.465166, 0.3960784, 1, 0, 1,
-0.6956407, 0.4805756, -2.821194, 0.3921569, 1, 0, 1,
-0.6917858, 1.631545, -1.699381, 0.3843137, 1, 0, 1,
-0.6850963, 0.2336716, -1.759656, 0.3803922, 1, 0, 1,
-0.678539, -1.273099, -2.491871, 0.372549, 1, 0, 1,
-0.6710887, -0.2703398, -2.371285, 0.3686275, 1, 0, 1,
-0.670989, -0.4135693, -1.567122, 0.3607843, 1, 0, 1,
-0.6687305, -1.104328, -3.889735, 0.3568628, 1, 0, 1,
-0.6667888, -0.03736966, -1.462125, 0.3490196, 1, 0, 1,
-0.6610962, 1.4361, -1.68938, 0.345098, 1, 0, 1,
-0.659059, -0.9297608, -1.555973, 0.3372549, 1, 0, 1,
-0.6575555, 0.135049, -1.187172, 0.3333333, 1, 0, 1,
-0.6526349, 0.1880984, -2.178473, 0.3254902, 1, 0, 1,
-0.652541, 1.817534, -1.937769, 0.3215686, 1, 0, 1,
-0.6525078, -1.032731, -2.029334, 0.3137255, 1, 0, 1,
-0.6491405, 0.3490985, -1.418494, 0.3098039, 1, 0, 1,
-0.6482908, -0.139472, -1.339279, 0.3019608, 1, 0, 1,
-0.6481581, -1.361846, -3.12457, 0.2941177, 1, 0, 1,
-0.6408848, -0.1768605, -0.7267087, 0.2901961, 1, 0, 1,
-0.6404302, 1.445134, -2.085284, 0.282353, 1, 0, 1,
-0.6394065, 1.149617, -1.026106, 0.2784314, 1, 0, 1,
-0.6317159, 0.5003405, -0.2728815, 0.2705882, 1, 0, 1,
-0.6313165, -0.102746, -1.422481, 0.2666667, 1, 0, 1,
-0.6273828, 1.917268, -0.1062158, 0.2588235, 1, 0, 1,
-0.6241477, -0.6026107, -3.86522, 0.254902, 1, 0, 1,
-0.6214764, -1.392827, -3.755373, 0.2470588, 1, 0, 1,
-0.6130841, -1.249038, -2.803207, 0.2431373, 1, 0, 1,
-0.6112425, 0.3750628, -1.636233, 0.2352941, 1, 0, 1,
-0.6076292, 1.363442, -0.491237, 0.2313726, 1, 0, 1,
-0.6039326, -1.130898, -3.847579, 0.2235294, 1, 0, 1,
-0.6026293, -0.2086883, -1.387773, 0.2196078, 1, 0, 1,
-0.6018954, 0.2078635, -1.089301, 0.2117647, 1, 0, 1,
-0.5988348, 0.1008285, -2.931757, 0.2078431, 1, 0, 1,
-0.5909824, -0.5525259, -1.678461, 0.2, 1, 0, 1,
-0.5860664, 0.210399, -1.178576, 0.1921569, 1, 0, 1,
-0.5829481, -0.885983, -5.295061, 0.1882353, 1, 0, 1,
-0.577801, -1.340043, -1.976088, 0.1803922, 1, 0, 1,
-0.577458, 0.01489326, -1.792092, 0.1764706, 1, 0, 1,
-0.5768241, -1.282468, -2.773446, 0.1686275, 1, 0, 1,
-0.5747364, 0.8420077, -1.94784, 0.1647059, 1, 0, 1,
-0.5711462, 0.5926913, 0.271827, 0.1568628, 1, 0, 1,
-0.5692309, -1.336827, -2.30094, 0.1529412, 1, 0, 1,
-0.5664583, -0.1140561, -1.452318, 0.145098, 1, 0, 1,
-0.5664227, -1.287629, -0.9477606, 0.1411765, 1, 0, 1,
-0.5603111, -0.8533693, -4.398015, 0.1333333, 1, 0, 1,
-0.5590538, -0.4012237, -2.517787, 0.1294118, 1, 0, 1,
-0.5583748, 0.9678426, -3.020343, 0.1215686, 1, 0, 1,
-0.5555191, 0.5150698, -1.230332, 0.1176471, 1, 0, 1,
-0.5533044, 1.559881, 1.213894, 0.1098039, 1, 0, 1,
-0.5516116, 0.3566566, -1.12918, 0.1058824, 1, 0, 1,
-0.5466273, -0.3954776, -4.232112, 0.09803922, 1, 0, 1,
-0.5459997, 1.066495, 0.3714188, 0.09019608, 1, 0, 1,
-0.5405587, 0.8320776, 0.413701, 0.08627451, 1, 0, 1,
-0.5397572, 0.3019141, -0.6822065, 0.07843138, 1, 0, 1,
-0.539498, 0.8781613, -1.060099, 0.07450981, 1, 0, 1,
-0.5353655, -0.1507891, -1.936542, 0.06666667, 1, 0, 1,
-0.5253142, 0.3667019, -0.9973851, 0.0627451, 1, 0, 1,
-0.5183592, 0.8878831, 1.022855, 0.05490196, 1, 0, 1,
-0.5130726, 0.8921874, -0.5339953, 0.05098039, 1, 0, 1,
-0.5104194, -0.7423, -3.231704, 0.04313726, 1, 0, 1,
-0.5051758, 0.3131557, -2.116205, 0.03921569, 1, 0, 1,
-0.5038603, 0.5286788, -0.8040407, 0.03137255, 1, 0, 1,
-0.5036441, 1.048196, -0.9203698, 0.02745098, 1, 0, 1,
-0.503206, 0.1483573, -1.050511, 0.01960784, 1, 0, 1,
-0.5028186, 0.4068074, -0.2640206, 0.01568628, 1, 0, 1,
-0.4945956, 0.3378516, -0.9532069, 0.007843138, 1, 0, 1,
-0.4939049, -0.3441786, -2.826895, 0.003921569, 1, 0, 1,
-0.4921568, 0.3185755, -0.4744645, 0, 1, 0.003921569, 1,
-0.4915908, -0.8449301, -2.874388, 0, 1, 0.01176471, 1,
-0.4913174, 1.177787, -0.09625236, 0, 1, 0.01568628, 1,
-0.4901478, 0.561791, 0.6228876, 0, 1, 0.02352941, 1,
-0.4843816, -0.5532691, -2.817006, 0, 1, 0.02745098, 1,
-0.4826877, 0.4576255, 0.4730144, 0, 1, 0.03529412, 1,
-0.4779875, 2.101042, -0.1766414, 0, 1, 0.03921569, 1,
-0.4770391, 0.09095655, -1.767392, 0, 1, 0.04705882, 1,
-0.4754289, -0.5030699, -2.62873, 0, 1, 0.05098039, 1,
-0.471419, -0.1717761, -2.654832, 0, 1, 0.05882353, 1,
-0.4693156, 0.2352625, -1.645978, 0, 1, 0.0627451, 1,
-0.4672865, -0.2791059, -2.302851, 0, 1, 0.07058824, 1,
-0.4665835, 1.218322, 2.473506, 0, 1, 0.07450981, 1,
-0.4625816, -1.360494, -3.551689, 0, 1, 0.08235294, 1,
-0.4623234, 0.59342, 0.04869557, 0, 1, 0.08627451, 1,
-0.4615297, 0.15694, -1.364042, 0, 1, 0.09411765, 1,
-0.4600338, 0.1127544, -0.3698286, 0, 1, 0.1019608, 1,
-0.4573928, 0.9459836, -2.471273, 0, 1, 0.1058824, 1,
-0.4543041, 0.5625598, -1.47262, 0, 1, 0.1137255, 1,
-0.4517405, -1.001543, -2.599738, 0, 1, 0.1176471, 1,
-0.4437012, -0.3506928, -2.983823, 0, 1, 0.1254902, 1,
-0.4430881, -0.3522481, -2.631824, 0, 1, 0.1294118, 1,
-0.4424571, 0.02315423, -2.988235, 0, 1, 0.1372549, 1,
-0.4423701, 0.1474847, -1.52338, 0, 1, 0.1411765, 1,
-0.4382231, 0.536438, -0.3099302, 0, 1, 0.1490196, 1,
-0.4368864, 1.934842, -1.677422, 0, 1, 0.1529412, 1,
-0.4364831, 0.4839355, -0.2875661, 0, 1, 0.1607843, 1,
-0.4250042, -1.074128, -4.828063, 0, 1, 0.1647059, 1,
-0.4177922, 0.7444606, -0.2761337, 0, 1, 0.172549, 1,
-0.4132518, -1.397913, -2.98018, 0, 1, 0.1764706, 1,
-0.4114977, 1.107418, -0.6048417, 0, 1, 0.1843137, 1,
-0.4059715, 0.1620001, 0.1097251, 0, 1, 0.1882353, 1,
-0.4014451, 0.8375924, 0.2447332, 0, 1, 0.1960784, 1,
-0.3981378, 1.323548, 0.2592218, 0, 1, 0.2039216, 1,
-0.3943306, 0.02131437, -2.757981, 0, 1, 0.2078431, 1,
-0.3898228, -1.249845, -3.842227, 0, 1, 0.2156863, 1,
-0.3798814, 1.472441, -0.05208626, 0, 1, 0.2196078, 1,
-0.3779514, -0.1957147, -1.204876, 0, 1, 0.227451, 1,
-0.3776072, -0.6683426, -3.240625, 0, 1, 0.2313726, 1,
-0.3768791, -0.8312999, -2.715367, 0, 1, 0.2392157, 1,
-0.3768609, -0.6088307, -2.408204, 0, 1, 0.2431373, 1,
-0.3724197, 1.23196, -0.4992958, 0, 1, 0.2509804, 1,
-0.3724163, -0.5761505, -2.765144, 0, 1, 0.254902, 1,
-0.3693472, -0.3346925, -1.658736, 0, 1, 0.2627451, 1,
-0.3690941, 1.367793, -0.3025335, 0, 1, 0.2666667, 1,
-0.3658441, -1.380853, -1.371519, 0, 1, 0.2745098, 1,
-0.3610231, 0.06042893, -0.3506867, 0, 1, 0.2784314, 1,
-0.3575394, -1.029799, -0.9430698, 0, 1, 0.2862745, 1,
-0.3574894, 1.013426, 0.574334, 0, 1, 0.2901961, 1,
-0.357432, -0.783058, -3.589181, 0, 1, 0.2980392, 1,
-0.3572505, 0.3386707, -0.4163313, 0, 1, 0.3058824, 1,
-0.3570783, 0.05466708, -2.162597, 0, 1, 0.3098039, 1,
-0.3566373, -1.616493, -3.080939, 0, 1, 0.3176471, 1,
-0.3550588, 1.539086, 0.05933045, 0, 1, 0.3215686, 1,
-0.3519342, -0.8034621, -2.745701, 0, 1, 0.3294118, 1,
-0.3509202, -1.373299, -1.822236, 0, 1, 0.3333333, 1,
-0.3490717, 0.02083431, -1.571373, 0, 1, 0.3411765, 1,
-0.3474302, 0.7084208, 0.05723929, 0, 1, 0.345098, 1,
-0.3473836, 0.6701998, -0.05873408, 0, 1, 0.3529412, 1,
-0.336856, 0.3668055, 0.2096881, 0, 1, 0.3568628, 1,
-0.3361279, -1.20083, -4.140893, 0, 1, 0.3647059, 1,
-0.335862, -0.3395711, -2.457603, 0, 1, 0.3686275, 1,
-0.3355915, 0.1059615, -0.2290009, 0, 1, 0.3764706, 1,
-0.3355468, 1.111819, -1.255597, 0, 1, 0.3803922, 1,
-0.3328522, 2.136727, 0.9037082, 0, 1, 0.3882353, 1,
-0.3326804, 1.602419, 0.3245608, 0, 1, 0.3921569, 1,
-0.3299515, 0.03962924, -0.2632173, 0, 1, 0.4, 1,
-0.3274135, -0.1461816, -0.558444, 0, 1, 0.4078431, 1,
-0.3232761, -0.07333041, -2.185019, 0, 1, 0.4117647, 1,
-0.3216474, -0.179754, -0.1970028, 0, 1, 0.4196078, 1,
-0.315121, 0.2568983, -0.8504978, 0, 1, 0.4235294, 1,
-0.314448, -1.397857, -3.224183, 0, 1, 0.4313726, 1,
-0.3142568, 1.300984, 1.063592, 0, 1, 0.4352941, 1,
-0.3105818, 0.494534, 0.9959587, 0, 1, 0.4431373, 1,
-0.309626, -2.45539, -3.142961, 0, 1, 0.4470588, 1,
-0.3094638, 1.699677, 1.822186, 0, 1, 0.454902, 1,
-0.3088756, 0.3034386, -2.185503, 0, 1, 0.4588235, 1,
-0.3084458, -0.2395263, -1.769509, 0, 1, 0.4666667, 1,
-0.3083489, 0.8485401, -1.240033, 0, 1, 0.4705882, 1,
-0.308268, -1.251655, -5.032317, 0, 1, 0.4784314, 1,
-0.3038814, -2.379757, -3.141205, 0, 1, 0.4823529, 1,
-0.3023632, 0.2162869, -1.514922, 0, 1, 0.4901961, 1,
-0.2979296, -0.08916256, -1.290853, 0, 1, 0.4941176, 1,
-0.2974605, -0.9650033, -2.13103, 0, 1, 0.5019608, 1,
-0.2953953, 0.5510408, -0.1685954, 0, 1, 0.509804, 1,
-0.2867198, 1.470523, -2.506553, 0, 1, 0.5137255, 1,
-0.2827012, 1.660508, -0.3240845, 0, 1, 0.5215687, 1,
-0.2801841, -1.534569, -5.569434, 0, 1, 0.5254902, 1,
-0.2801521, -1.270051, -2.992407, 0, 1, 0.5333334, 1,
-0.2782166, 1.35621, -0.005753083, 0, 1, 0.5372549, 1,
-0.2723485, 0.6610916, 1.701944, 0, 1, 0.5450981, 1,
-0.2720677, -0.6779986, -2.62149, 0, 1, 0.5490196, 1,
-0.2707418, 1.105243, -0.05989851, 0, 1, 0.5568628, 1,
-0.2695158, 0.3418053, -0.8347253, 0, 1, 0.5607843, 1,
-0.2651086, -0.8616741, -4.109005, 0, 1, 0.5686275, 1,
-0.2640188, -1.295057, -2.299821, 0, 1, 0.572549, 1,
-0.2638851, 1.129738, 0.9441603, 0, 1, 0.5803922, 1,
-0.2611976, -1.478233, -1.771455, 0, 1, 0.5843138, 1,
-0.2556367, -1.384823, -2.833802, 0, 1, 0.5921569, 1,
-0.254679, -0.8445055, -2.323474, 0, 1, 0.5960785, 1,
-0.2525715, 1.233714, 0.8643402, 0, 1, 0.6039216, 1,
-0.2490318, 0.5360938, -0.3087143, 0, 1, 0.6117647, 1,
-0.2475993, 1.767784, -0.4297147, 0, 1, 0.6156863, 1,
-0.2457519, -0.371866, -2.893246, 0, 1, 0.6235294, 1,
-0.2417254, -0.6004744, -0.8122756, 0, 1, 0.627451, 1,
-0.240884, -0.5309195, -3.335711, 0, 1, 0.6352941, 1,
-0.2376462, -0.3806022, -2.313117, 0, 1, 0.6392157, 1,
-0.2339344, 0.231402, -1.775509, 0, 1, 0.6470588, 1,
-0.2279399, 0.5521242, -0.7124187, 0, 1, 0.6509804, 1,
-0.2251921, 0.3758982, 0.5467821, 0, 1, 0.6588235, 1,
-0.2241367, -0.9546229, -3.024723, 0, 1, 0.6627451, 1,
-0.2217965, 0.4428203, 0.492835, 0, 1, 0.6705883, 1,
-0.2143084, 0.5132064, -0.2660948, 0, 1, 0.6745098, 1,
-0.2094608, 1.123981, -0.3885053, 0, 1, 0.682353, 1,
-0.2075189, -0.3636087, -5.849462, 0, 1, 0.6862745, 1,
-0.2019499, -0.3259545, -2.86404, 0, 1, 0.6941177, 1,
-0.2010808, -0.4139157, -1.834779, 0, 1, 0.7019608, 1,
-0.1976164, -1.171611, -3.983438, 0, 1, 0.7058824, 1,
-0.1951696, -1.173798, -2.157186, 0, 1, 0.7137255, 1,
-0.1948357, 0.548608, 0.2433496, 0, 1, 0.7176471, 1,
-0.1931076, 0.03847784, -2.893973, 0, 1, 0.7254902, 1,
-0.1900951, -2.22704, -3.229966, 0, 1, 0.7294118, 1,
-0.1886459, -2.043432, -4.338789, 0, 1, 0.7372549, 1,
-0.1878344, -1.189184, -4.286044, 0, 1, 0.7411765, 1,
-0.1872637, -0.1130788, -0.1462721, 0, 1, 0.7490196, 1,
-0.1862187, -0.01582554, -3.498968, 0, 1, 0.7529412, 1,
-0.1852954, -1.266593, -2.60572, 0, 1, 0.7607843, 1,
-0.1846864, 0.9197492, -0.06878333, 0, 1, 0.7647059, 1,
-0.1835759, 0.705018, -0.8165081, 0, 1, 0.772549, 1,
-0.1827321, 0.6072414, -0.6489331, 0, 1, 0.7764706, 1,
-0.1825224, 0.6581898, -0.03204698, 0, 1, 0.7843137, 1,
-0.1823543, 0.3736762, -0.2767608, 0, 1, 0.7882353, 1,
-0.1808142, 0.8288897, -0.34787, 0, 1, 0.7960784, 1,
-0.1735958, 1.131815, -0.1796257, 0, 1, 0.8039216, 1,
-0.173557, 1.028286, -0.3769135, 0, 1, 0.8078431, 1,
-0.1724738, -0.505693, -1.944269, 0, 1, 0.8156863, 1,
-0.1724576, 1.096748, 0.2468229, 0, 1, 0.8196079, 1,
-0.1702642, 0.2042764, -2.057754, 0, 1, 0.827451, 1,
-0.1662107, 0.6313906, -3.132789, 0, 1, 0.8313726, 1,
-0.1646804, -1.369776, -3.65509, 0, 1, 0.8392157, 1,
-0.1626899, 0.521362, 0.7455308, 0, 1, 0.8431373, 1,
-0.1611672, 1.156423, 0.6032837, 0, 1, 0.8509804, 1,
-0.1576457, -0.6287366, -2.977331, 0, 1, 0.854902, 1,
-0.1566061, -0.5030806, -1.794409, 0, 1, 0.8627451, 1,
-0.1547035, -1.576171, -3.066158, 0, 1, 0.8666667, 1,
-0.1504594, 1.978338, 0.6228943, 0, 1, 0.8745098, 1,
-0.1484639, 1.274566, 0.2598851, 0, 1, 0.8784314, 1,
-0.1481598, 1.147655, -0.7925828, 0, 1, 0.8862745, 1,
-0.1458842, 0.8912267, 1.286819, 0, 1, 0.8901961, 1,
-0.145284, 0.1174559, -2.537838, 0, 1, 0.8980392, 1,
-0.1445136, 0.2240758, 0.3618594, 0, 1, 0.9058824, 1,
-0.1393862, 0.7447221, -1.709527, 0, 1, 0.9098039, 1,
-0.1379966, 0.462421, 0.1081341, 0, 1, 0.9176471, 1,
-0.1334325, -0.5789676, -2.236124, 0, 1, 0.9215686, 1,
-0.1328225, -1.191282, -2.567497, 0, 1, 0.9294118, 1,
-0.1287974, 1.47643, 0.3531926, 0, 1, 0.9333333, 1,
-0.1271275, -1.209753, -1.895505, 0, 1, 0.9411765, 1,
-0.1268951, -1.81764, -2.349783, 0, 1, 0.945098, 1,
-0.1254018, 0.4017858, -1.349651, 0, 1, 0.9529412, 1,
-0.1246728, -0.3848954, -2.880682, 0, 1, 0.9568627, 1,
-0.1234654, 1.384613, 0.05993582, 0, 1, 0.9647059, 1,
-0.1192288, 1.311862, -0.8765956, 0, 1, 0.9686275, 1,
-0.1151787, -0.9980242, -1.776286, 0, 1, 0.9764706, 1,
-0.1109366, 0.6696354, -1.398437, 0, 1, 0.9803922, 1,
-0.1094334, 0.2820944, -0.3244737, 0, 1, 0.9882353, 1,
-0.1074233, -0.1246099, -4.444493, 0, 1, 0.9921569, 1,
-0.1048115, 0.7459108, 2.489724, 0, 1, 1, 1,
-0.09833552, 1.765243, 0.4140383, 0, 0.9921569, 1, 1,
-0.09652568, 0.3457827, -0.7370178, 0, 0.9882353, 1, 1,
-0.09539403, -1.569733, -3.651929, 0, 0.9803922, 1, 1,
-0.09494848, -0.23758, -3.071478, 0, 0.9764706, 1, 1,
-0.09170998, 0.6439328, -0.03956219, 0, 0.9686275, 1, 1,
-0.09004691, -1.258069, -3.449832, 0, 0.9647059, 1, 1,
-0.08047372, 0.5419925, -3.407632, 0, 0.9568627, 1, 1,
-0.07841678, -1.440046, -2.725165, 0, 0.9529412, 1, 1,
-0.07607634, -0.3552214, -3.600098, 0, 0.945098, 1, 1,
-0.07006282, 0.7691783, 1.709918, 0, 0.9411765, 1, 1,
-0.06258033, 0.05017082, 0.3868564, 0, 0.9333333, 1, 1,
-0.05833478, 0.5969805, -0.4545696, 0, 0.9294118, 1, 1,
-0.05826068, -0.586655, -0.6036813, 0, 0.9215686, 1, 1,
-0.05330596, 1.621451, -0.03006122, 0, 0.9176471, 1, 1,
-0.05292904, -1.563438, -3.067524, 0, 0.9098039, 1, 1,
-0.04575793, -0.9859765, -4.011765, 0, 0.9058824, 1, 1,
-0.04509542, -0.7388522, -2.698301, 0, 0.8980392, 1, 1,
-0.04434391, 2.638341, 2.106863, 0, 0.8901961, 1, 1,
-0.03683494, -0.7498172, -3.977658, 0, 0.8862745, 1, 1,
-0.03462826, -0.324449, -2.569172, 0, 0.8784314, 1, 1,
-0.03445704, -0.0159644, -1.843246, 0, 0.8745098, 1, 1,
-0.03236414, 0.1521259, 2.16703, 0, 0.8666667, 1, 1,
-0.03028185, -0.2748843, -2.871804, 0, 0.8627451, 1, 1,
-0.02913873, 1.171506, 0.7882846, 0, 0.854902, 1, 1,
-0.02330846, 0.5648238, 0.2594747, 0, 0.8509804, 1, 1,
-0.02318673, -1.819989, -3.663865, 0, 0.8431373, 1, 1,
-0.02287323, -1.021974, -2.679206, 0, 0.8392157, 1, 1,
-0.021999, 0.3798914, 0.2319883, 0, 0.8313726, 1, 1,
-0.01961244, 0.3963867, -1.08637, 0, 0.827451, 1, 1,
-0.01872727, -0.5378786, -4.046154, 0, 0.8196079, 1, 1,
-0.0111835, 0.04903544, -0.8203682, 0, 0.8156863, 1, 1,
-0.008651463, -0.1657956, -3.440665, 0, 0.8078431, 1, 1,
-0.001505217, 1.798352, -0.1489757, 0, 0.8039216, 1, 1,
-0.001132849, -0.7273934, -3.442985, 0, 0.7960784, 1, 1,
0.0005701292, -1.43999, 3.137236, 0, 0.7882353, 1, 1,
0.006553662, -0.2127519, 3.276302, 0, 0.7843137, 1, 1,
0.01134667, -0.9530935, 3.635047, 0, 0.7764706, 1, 1,
0.01144509, 0.4233285, 1.137027, 0, 0.772549, 1, 1,
0.01428132, 0.3843749, 0.426476, 0, 0.7647059, 1, 1,
0.01675034, 2.046326, 0.5672827, 0, 0.7607843, 1, 1,
0.01736167, -0.163843, 3.234832, 0, 0.7529412, 1, 1,
0.01801423, 1.106824, -0.7557647, 0, 0.7490196, 1, 1,
0.03317635, 0.9002813, -2.395113, 0, 0.7411765, 1, 1,
0.03383501, -1.581985, 2.691259, 0, 0.7372549, 1, 1,
0.03520464, 0.1246221, -0.6974081, 0, 0.7294118, 1, 1,
0.03529237, -0.6175482, 3.245909, 0, 0.7254902, 1, 1,
0.04162067, -0.04369003, 1.593678, 0, 0.7176471, 1, 1,
0.04499652, 0.9704516, -0.6383693, 0, 0.7137255, 1, 1,
0.04775899, -0.3056506, 2.517435, 0, 0.7058824, 1, 1,
0.04947363, -1.09978, 5.28622, 0, 0.6980392, 1, 1,
0.05197312, -0.5198683, 2.245533, 0, 0.6941177, 1, 1,
0.05288872, -1.493276, 1.209552, 0, 0.6862745, 1, 1,
0.05353997, 1.336086, -1.024278, 0, 0.682353, 1, 1,
0.05500585, -0.5161068, 2.202158, 0, 0.6745098, 1, 1,
0.05542016, 1.221903, 0.007609467, 0, 0.6705883, 1, 1,
0.05623257, 1.204961, -1.119297, 0, 0.6627451, 1, 1,
0.06089967, -0.4714102, 3.855643, 0, 0.6588235, 1, 1,
0.06209599, -0.162694, 2.547163, 0, 0.6509804, 1, 1,
0.06288386, 0.7080885, -0.4919205, 0, 0.6470588, 1, 1,
0.06289288, 1.164363, -1.323318, 0, 0.6392157, 1, 1,
0.06417416, -1.109988, 1.870462, 0, 0.6352941, 1, 1,
0.06734842, 0.09485383, 1.615911, 0, 0.627451, 1, 1,
0.06743721, 2.081396, -1.573347, 0, 0.6235294, 1, 1,
0.06827198, -0.2269788, 3.307917, 0, 0.6156863, 1, 1,
0.07191785, -0.9762816, 4.053223, 0, 0.6117647, 1, 1,
0.07991324, -0.03034861, 1.605841, 0, 0.6039216, 1, 1,
0.08630751, 1.101106, 0.7757737, 0, 0.5960785, 1, 1,
0.09553251, 0.988238, -2.402928, 0, 0.5921569, 1, 1,
0.09666158, 1.272348, 0.6824487, 0, 0.5843138, 1, 1,
0.0984745, 1.916241, 2.381521, 0, 0.5803922, 1, 1,
0.09917456, 1.627488, -0.93937, 0, 0.572549, 1, 1,
0.1044295, 0.8274304, -1.354028, 0, 0.5686275, 1, 1,
0.116356, -2.442477, 4.583356, 0, 0.5607843, 1, 1,
0.1170739, -0.4688334, 2.916179, 0, 0.5568628, 1, 1,
0.1175449, -1.675592, 1.755546, 0, 0.5490196, 1, 1,
0.118824, 0.299096, 0.10617, 0, 0.5450981, 1, 1,
0.12091, -1.343185, 2.397957, 0, 0.5372549, 1, 1,
0.1221587, -1.278088, 2.984736, 0, 0.5333334, 1, 1,
0.1249348, 0.5827332, 0.4658511, 0, 0.5254902, 1, 1,
0.1263008, -1.114238, 2.246263, 0, 0.5215687, 1, 1,
0.1286071, -0.5833771, 3.304909, 0, 0.5137255, 1, 1,
0.130855, -0.7604504, 3.301633, 0, 0.509804, 1, 1,
0.130885, 1.169082, 0.3974957, 0, 0.5019608, 1, 1,
0.1314684, 0.7660027, -1.142679, 0, 0.4941176, 1, 1,
0.1316896, -0.860751, 3.14102, 0, 0.4901961, 1, 1,
0.1334995, 0.2612157, -0.3893453, 0, 0.4823529, 1, 1,
0.135445, 0.8075813, -0.04206555, 0, 0.4784314, 1, 1,
0.1376066, 0.6066494, 1.11032, 0, 0.4705882, 1, 1,
0.1449594, -1.37436, 3.521414, 0, 0.4666667, 1, 1,
0.1461759, 1.15748, 0.9139217, 0, 0.4588235, 1, 1,
0.1469506, -0.3017822, 3.682986, 0, 0.454902, 1, 1,
0.147788, -0.3023781, 2.475788, 0, 0.4470588, 1, 1,
0.1492728, -0.7525239, 0.6396395, 0, 0.4431373, 1, 1,
0.1494372, -1.053316, 2.87319, 0, 0.4352941, 1, 1,
0.1525381, 1.299454, -2.244308, 0, 0.4313726, 1, 1,
0.155898, -0.08334863, 0.9427083, 0, 0.4235294, 1, 1,
0.1570445, -0.7968405, 4.337112, 0, 0.4196078, 1, 1,
0.1576791, -1.138714, 1.344906, 0, 0.4117647, 1, 1,
0.1594998, 0.8246283, 0.5651007, 0, 0.4078431, 1, 1,
0.1629002, -1.477883, 2.977353, 0, 0.4, 1, 1,
0.1676612, 0.7865211, -0.5126451, 0, 0.3921569, 1, 1,
0.1726461, -1.524413, 2.849499, 0, 0.3882353, 1, 1,
0.1753383, -1.043896, 2.308563, 0, 0.3803922, 1, 1,
0.176795, -0.1596822, 2.021765, 0, 0.3764706, 1, 1,
0.1768834, 0.08850018, 1.848043, 0, 0.3686275, 1, 1,
0.1770385, 1.059281, 0.8843947, 0, 0.3647059, 1, 1,
0.1779452, -0.1008025, 2.764093, 0, 0.3568628, 1, 1,
0.1855594, -2.282919, 3.454331, 0, 0.3529412, 1, 1,
0.1865413, -0.3760178, 3.236342, 0, 0.345098, 1, 1,
0.1890245, -0.07053936, 1.883402, 0, 0.3411765, 1, 1,
0.1974749, 0.122999, 0.1277907, 0, 0.3333333, 1, 1,
0.1999976, -0.6852356, 3.812433, 0, 0.3294118, 1, 1,
0.2017396, 2.558379, -0.1313913, 0, 0.3215686, 1, 1,
0.2023138, 0.9949026, 0.2200588, 0, 0.3176471, 1, 1,
0.2051034, 0.2022014, -0.05127466, 0, 0.3098039, 1, 1,
0.2052742, -0.584846, 2.301717, 0, 0.3058824, 1, 1,
0.2105266, 0.2835882, -0.9188316, 0, 0.2980392, 1, 1,
0.2183715, -0.03488106, 3.465765, 0, 0.2901961, 1, 1,
0.222399, 0.6403087, 1.688368, 0, 0.2862745, 1, 1,
0.224116, 0.7849485, 0.6804541, 0, 0.2784314, 1, 1,
0.2309624, 0.5004259, -0.8291742, 0, 0.2745098, 1, 1,
0.2319579, 0.6608384, 1.370851, 0, 0.2666667, 1, 1,
0.2344259, -1.573981, 2.767657, 0, 0.2627451, 1, 1,
0.2462551, 0.947037, -0.5186917, 0, 0.254902, 1, 1,
0.2476702, 0.1231178, -0.7740673, 0, 0.2509804, 1, 1,
0.2490417, 1.407891, 0.04652624, 0, 0.2431373, 1, 1,
0.2495248, 1.286434, -1.128517, 0, 0.2392157, 1, 1,
0.2511346, 0.551944, 0.7544417, 0, 0.2313726, 1, 1,
0.2538707, 1.070016, 0.346832, 0, 0.227451, 1, 1,
0.2550229, 0.9451179, -0.7226914, 0, 0.2196078, 1, 1,
0.261703, -1.335511, 4.810993, 0, 0.2156863, 1, 1,
0.2620349, 0.9195227, 1.007241, 0, 0.2078431, 1, 1,
0.2637863, 0.04125211, 0.8871798, 0, 0.2039216, 1, 1,
0.269349, 0.2921228, 1.260616, 0, 0.1960784, 1, 1,
0.2728768, -1.102938, 5.133265, 0, 0.1882353, 1, 1,
0.2825018, -0.7414595, 2.52602, 0, 0.1843137, 1, 1,
0.284341, -1.301448, 2.800557, 0, 0.1764706, 1, 1,
0.2850014, -0.1207564, 2.136498, 0, 0.172549, 1, 1,
0.2866017, 0.1891419, 2.712388, 0, 0.1647059, 1, 1,
0.2921204, -0.3762321, 2.436606, 0, 0.1607843, 1, 1,
0.2927334, -0.2719837, 1.153709, 0, 0.1529412, 1, 1,
0.2929671, 0.8114008, 0.07080696, 0, 0.1490196, 1, 1,
0.2958419, -1.155956, 3.24303, 0, 0.1411765, 1, 1,
0.2982144, -1.317839, 4.294897, 0, 0.1372549, 1, 1,
0.3006064, -2.14696, 3.546198, 0, 0.1294118, 1, 1,
0.3032172, -0.9606764, 2.901693, 0, 0.1254902, 1, 1,
0.3052608, 0.7420099, -1.112641, 0, 0.1176471, 1, 1,
0.3109538, 0.6967341, -0.4145704, 0, 0.1137255, 1, 1,
0.317578, -0.4903056, 2.208606, 0, 0.1058824, 1, 1,
0.3219726, -0.4637595, 3.655378, 0, 0.09803922, 1, 1,
0.3320448, -0.1588347, 1.629669, 0, 0.09411765, 1, 1,
0.3343979, -0.5660216, 1.039723, 0, 0.08627451, 1, 1,
0.3374373, -0.3859841, 3.188744, 0, 0.08235294, 1, 1,
0.3399257, -0.1350823, 1.05665, 0, 0.07450981, 1, 1,
0.3469284, -0.1488074, 0.9637452, 0, 0.07058824, 1, 1,
0.3519674, 1.456511, 0.2155772, 0, 0.0627451, 1, 1,
0.3522388, -0.1543912, 0.3022399, 0, 0.05882353, 1, 1,
0.3550153, 0.7794721, 0.3015552, 0, 0.05098039, 1, 1,
0.3584093, 1.116754, 0.8937848, 0, 0.04705882, 1, 1,
0.3589415, -1.600905, 4.231184, 0, 0.03921569, 1, 1,
0.3596989, 2.071403, -0.3159525, 0, 0.03529412, 1, 1,
0.3649935, 0.8456098, -0.8215076, 0, 0.02745098, 1, 1,
0.365097, 0.3549676, 0.3169438, 0, 0.02352941, 1, 1,
0.3673437, -0.4603467, 1.944649, 0, 0.01568628, 1, 1,
0.3770001, -1.82866, 4.517883, 0, 0.01176471, 1, 1,
0.3788218, 0.9233919, -0.7953514, 0, 0.003921569, 1, 1,
0.3862662, 0.7482852, -0.005848255, 0.003921569, 0, 1, 1,
0.3918268, 1.523313, -1.169325, 0.007843138, 0, 1, 1,
0.3955576, -0.4489509, 0.3565609, 0.01568628, 0, 1, 1,
0.396404, 0.6904023, 0.9210038, 0.01960784, 0, 1, 1,
0.4005742, -0.9495878, 4.539278, 0.02745098, 0, 1, 1,
0.4031592, 0.5576727, 0.7677621, 0.03137255, 0, 1, 1,
0.4043298, -0.2293097, 0.5445446, 0.03921569, 0, 1, 1,
0.4047472, 0.5047796, 2.395977, 0.04313726, 0, 1, 1,
0.404912, -1.306935, 1.511552, 0.05098039, 0, 1, 1,
0.4091876, -0.2927061, 0.4882466, 0.05490196, 0, 1, 1,
0.4108814, -1.900902, 3.018476, 0.0627451, 0, 1, 1,
0.4117676, 1.294804, -1.458809, 0.06666667, 0, 1, 1,
0.4133204, 0.5842638, -1.153961, 0.07450981, 0, 1, 1,
0.4143137, 0.9279925, 0.7843745, 0.07843138, 0, 1, 1,
0.4143916, 0.6998153, -0.1481377, 0.08627451, 0, 1, 1,
0.4166717, 0.1193765, 0.100959, 0.09019608, 0, 1, 1,
0.4171813, -0.1894468, 0.0641655, 0.09803922, 0, 1, 1,
0.4251292, -0.5584394, 3.327191, 0.1058824, 0, 1, 1,
0.4413897, -0.06997681, -1.369441, 0.1098039, 0, 1, 1,
0.4438421, 1.185694, 1.559522, 0.1176471, 0, 1, 1,
0.4471732, 0.04983269, 1.833724, 0.1215686, 0, 1, 1,
0.4472042, -0.8376306, 1.6618, 0.1294118, 0, 1, 1,
0.4496724, 1.315505, 0.6302758, 0.1333333, 0, 1, 1,
0.4501277, -0.5967155, 4.073971, 0.1411765, 0, 1, 1,
0.4573314, -1.036809, 1.302492, 0.145098, 0, 1, 1,
0.462164, 1.869009, 2.294848, 0.1529412, 0, 1, 1,
0.4635261, 0.7981501, -0.2733852, 0.1568628, 0, 1, 1,
0.4664133, -0.5071863, 2.622652, 0.1647059, 0, 1, 1,
0.4709626, 0.6174923, 1.73747, 0.1686275, 0, 1, 1,
0.4741684, 0.528354, 1.23082, 0.1764706, 0, 1, 1,
0.4778861, 0.4797238, 1.946607, 0.1803922, 0, 1, 1,
0.4815513, -0.5544502, 1.513387, 0.1882353, 0, 1, 1,
0.4817283, 1.290546, -0.755832, 0.1921569, 0, 1, 1,
0.4844098, 0.9416016, 1.04849, 0.2, 0, 1, 1,
0.4935277, -0.01572086, 0.2291901, 0.2078431, 0, 1, 1,
0.4940113, -0.5332328, 2.837751, 0.2117647, 0, 1, 1,
0.4964105, -0.006145402, 1.325179, 0.2196078, 0, 1, 1,
0.4976133, -2.289799, 5.036162, 0.2235294, 0, 1, 1,
0.5073379, -0.4375955, 2.842267, 0.2313726, 0, 1, 1,
0.5083515, 0.8460144, 0.2932314, 0.2352941, 0, 1, 1,
0.5124729, 1.560523, 0.9472998, 0.2431373, 0, 1, 1,
0.5136924, 1.243276, -0.7880708, 0.2470588, 0, 1, 1,
0.5150674, -0.3331007, 3.749195, 0.254902, 0, 1, 1,
0.5163243, -0.2776125, 1.108799, 0.2588235, 0, 1, 1,
0.5214251, 1.081863, 1.835378, 0.2666667, 0, 1, 1,
0.523669, 0.4912417, 1.468005, 0.2705882, 0, 1, 1,
0.5252591, -0.2685443, 1.320769, 0.2784314, 0, 1, 1,
0.5277717, -0.8281192, 1.559091, 0.282353, 0, 1, 1,
0.5282118, 1.342863, 1.310427, 0.2901961, 0, 1, 1,
0.5302219, -2.099614, 2.874023, 0.2941177, 0, 1, 1,
0.5342717, -0.3734317, 2.149966, 0.3019608, 0, 1, 1,
0.541844, -1.878174, 2.60473, 0.3098039, 0, 1, 1,
0.5426867, -1.419977, 2.880956, 0.3137255, 0, 1, 1,
0.543544, -0.3836353, 2.306207, 0.3215686, 0, 1, 1,
0.5511525, -0.8767842, 2.589523, 0.3254902, 0, 1, 1,
0.5667641, -0.8125802, 0.6758085, 0.3333333, 0, 1, 1,
0.5675408, 0.01081661, 1.306803, 0.3372549, 0, 1, 1,
0.5677181, 0.04961495, 2.025052, 0.345098, 0, 1, 1,
0.5709394, -0.05498337, 0.07805709, 0.3490196, 0, 1, 1,
0.5727237, 0.3523484, 0.6237649, 0.3568628, 0, 1, 1,
0.5741565, -0.3708635, 0.993921, 0.3607843, 0, 1, 1,
0.5753626, 0.7640394, 0.9903489, 0.3686275, 0, 1, 1,
0.5778924, -0.131568, 2.318779, 0.372549, 0, 1, 1,
0.5786112, 0.8800511, 1.44751, 0.3803922, 0, 1, 1,
0.5798044, 0.3431009, 2.433808, 0.3843137, 0, 1, 1,
0.5815241, -1.223051, 1.578732, 0.3921569, 0, 1, 1,
0.5868, -0.3989419, 2.058725, 0.3960784, 0, 1, 1,
0.5877512, -0.6837977, 1.112275, 0.4039216, 0, 1, 1,
0.5883309, 1.091771, -0.3964283, 0.4117647, 0, 1, 1,
0.5910727, 0.6920437, 2.629488, 0.4156863, 0, 1, 1,
0.5940059, -0.7752332, 2.661711, 0.4235294, 0, 1, 1,
0.5986959, -2.245566, 3.579023, 0.427451, 0, 1, 1,
0.5995131, -1.989762, 3.331988, 0.4352941, 0, 1, 1,
0.6091354, 0.2112602, 0.3628275, 0.4392157, 0, 1, 1,
0.6093073, -1.084979, 2.205259, 0.4470588, 0, 1, 1,
0.6099804, -2.369871, 3.859798, 0.4509804, 0, 1, 1,
0.6135661, -1.771834, 2.300497, 0.4588235, 0, 1, 1,
0.6140216, 0.2863949, 1.704691, 0.4627451, 0, 1, 1,
0.6261086, 0.7241318, 0.9274499, 0.4705882, 0, 1, 1,
0.6282451, -0.01071787, 0.5530273, 0.4745098, 0, 1, 1,
0.6370114, -0.1306442, 1.740147, 0.4823529, 0, 1, 1,
0.6425903, 0.5421274, 1.952031, 0.4862745, 0, 1, 1,
0.6444639, -1.827108, 1.60539, 0.4941176, 0, 1, 1,
0.6449723, 0.6810531, 1.667087, 0.5019608, 0, 1, 1,
0.646001, 0.9366857, -0.3130213, 0.5058824, 0, 1, 1,
0.647596, 1.032519, 1.107561, 0.5137255, 0, 1, 1,
0.6477642, 1.269231, -0.3918708, 0.5176471, 0, 1, 1,
0.6479752, 0.3250118, 1.672893, 0.5254902, 0, 1, 1,
0.6508496, 1.408262, 1.873321, 0.5294118, 0, 1, 1,
0.6624969, -1.350949, 2.553816, 0.5372549, 0, 1, 1,
0.6637375, 0.4457408, 0.2488972, 0.5411765, 0, 1, 1,
0.6642295, -0.880353, 3.12186, 0.5490196, 0, 1, 1,
0.6715429, 0.2232042, 0.7680972, 0.5529412, 0, 1, 1,
0.6727636, -0.410202, 1.24309, 0.5607843, 0, 1, 1,
0.6772067, 0.0232675, 2.161822, 0.5647059, 0, 1, 1,
0.6781722, 0.1602627, 2.401327, 0.572549, 0, 1, 1,
0.6810006, 0.8650445, -0.3778816, 0.5764706, 0, 1, 1,
0.6825156, -0.2968458, 2.576559, 0.5843138, 0, 1, 1,
0.6967161, 0.771826, -0.4094792, 0.5882353, 0, 1, 1,
0.6984308, 0.2557518, 2.740851, 0.5960785, 0, 1, 1,
0.7008986, -0.07564282, 1.175835, 0.6039216, 0, 1, 1,
0.705068, -1.140305, 2.73673, 0.6078432, 0, 1, 1,
0.716383, 0.5691999, 0.188996, 0.6156863, 0, 1, 1,
0.7202464, -1.234911, 2.714134, 0.6196079, 0, 1, 1,
0.7233138, -0.8514268, 3.790052, 0.627451, 0, 1, 1,
0.7236741, 1.354089, -1.658496, 0.6313726, 0, 1, 1,
0.7313434, 2.308713, -0.2635238, 0.6392157, 0, 1, 1,
0.7383093, -1.413761, 4.131717, 0.6431373, 0, 1, 1,
0.7384312, 1.436426, 1.348792, 0.6509804, 0, 1, 1,
0.740833, -0.08576522, 2.833757, 0.654902, 0, 1, 1,
0.7452267, 1.187532, 0.1750586, 0.6627451, 0, 1, 1,
0.7469501, 0.01400865, 2.474433, 0.6666667, 0, 1, 1,
0.7492679, -0.5244253, 2.899451, 0.6745098, 0, 1, 1,
0.7520081, 0.236529, 0.4905673, 0.6784314, 0, 1, 1,
0.7566506, -0.4682455, 1.135264, 0.6862745, 0, 1, 1,
0.7595475, -0.6023234, 2.141526, 0.6901961, 0, 1, 1,
0.7597601, 0.5479636, 2.507099, 0.6980392, 0, 1, 1,
0.7619904, -0.6998475, 2.407187, 0.7058824, 0, 1, 1,
0.7641507, -0.7426832, 0.3247747, 0.7098039, 0, 1, 1,
0.7643138, 1.190909, 1.667466, 0.7176471, 0, 1, 1,
0.7645307, 0.7298021, -0.1293824, 0.7215686, 0, 1, 1,
0.7690125, 0.6117393, 1.424498, 0.7294118, 0, 1, 1,
0.7690198, -0.5473039, 2.360408, 0.7333333, 0, 1, 1,
0.772132, 2.186539, -0.2460537, 0.7411765, 0, 1, 1,
0.7736974, 0.9209759, 2.420422, 0.7450981, 0, 1, 1,
0.7840664, 1.729229, -1.027232, 0.7529412, 0, 1, 1,
0.7859292, -0.1128407, 2.062407, 0.7568628, 0, 1, 1,
0.7932532, -0.5647384, 2.740034, 0.7647059, 0, 1, 1,
0.798656, 1.311828, 0.8906928, 0.7686275, 0, 1, 1,
0.7988983, -0.1746972, 1.733425, 0.7764706, 0, 1, 1,
0.8008779, -1.40761, 2.578506, 0.7803922, 0, 1, 1,
0.802018, 0.3212683, 1.358681, 0.7882353, 0, 1, 1,
0.8021307, 0.7874392, 0.2831008, 0.7921569, 0, 1, 1,
0.8034839, 0.7974929, 1.353558, 0.8, 0, 1, 1,
0.8053516, -0.9544048, 4.451939, 0.8078431, 0, 1, 1,
0.8137619, -0.2059866, 2.656635, 0.8117647, 0, 1, 1,
0.8151135, -1.536029, 4.219435, 0.8196079, 0, 1, 1,
0.8202128, 0.724481, 0.889437, 0.8235294, 0, 1, 1,
0.8260475, -1.303211, 3.966939, 0.8313726, 0, 1, 1,
0.8288599, -1.393096, 4.523505, 0.8352941, 0, 1, 1,
0.8340663, -2.440356, 3.988444, 0.8431373, 0, 1, 1,
0.8359283, -0.5672822, 2.317533, 0.8470588, 0, 1, 1,
0.8503145, -0.9025818, 3.714322, 0.854902, 0, 1, 1,
0.8559158, 0.633568, 2.829563, 0.8588235, 0, 1, 1,
0.8586901, -0.1170414, 3.117816, 0.8666667, 0, 1, 1,
0.8711725, -0.005984253, 1.345874, 0.8705882, 0, 1, 1,
0.8785086, 0.3271642, 1.663968, 0.8784314, 0, 1, 1,
0.8874876, -0.4704046, 0.6409667, 0.8823529, 0, 1, 1,
0.8903112, 0.8812487, 1.33703, 0.8901961, 0, 1, 1,
0.8910328, 2.332861, 0.5557222, 0.8941177, 0, 1, 1,
0.8950278, 0.6182483, -0.4942911, 0.9019608, 0, 1, 1,
0.8993667, -0.1157227, 1.410521, 0.9098039, 0, 1, 1,
0.9013677, 0.9643912, 0.5909042, 0.9137255, 0, 1, 1,
0.90304, -1.791536, 4.588606, 0.9215686, 0, 1, 1,
0.9168873, -1.712639, 0.8449971, 0.9254902, 0, 1, 1,
0.920718, 0.7404962, 2.082264, 0.9333333, 0, 1, 1,
0.9218569, 0.15225, 1.078785, 0.9372549, 0, 1, 1,
0.9339535, 0.5976483, 1.293774, 0.945098, 0, 1, 1,
0.9350796, -0.1443477, 3.068338, 0.9490196, 0, 1, 1,
0.9353302, -0.6690724, 1.138354, 0.9568627, 0, 1, 1,
0.9381512, 0.464349, 1.112945, 0.9607843, 0, 1, 1,
0.9398148, 0.6650894, 3.913489, 0.9686275, 0, 1, 1,
0.9430504, -0.08248977, 1.941708, 0.972549, 0, 1, 1,
0.9704434, -1.437577, 2.291299, 0.9803922, 0, 1, 1,
0.9721244, 0.6782622, 0.4591689, 0.9843137, 0, 1, 1,
0.9732684, -0.8026972, 3.809601, 0.9921569, 0, 1, 1,
0.9739837, -1.54366, 1.898773, 0.9960784, 0, 1, 1,
0.9822863, -0.1018004, 1.623206, 1, 0, 0.9960784, 1,
0.9845605, 0.4105848, -0.3142776, 1, 0, 0.9882353, 1,
0.9998459, 1.149709, 0.6323116, 1, 0, 0.9843137, 1,
1.001742, 1.657122, -0.5286293, 1, 0, 0.9764706, 1,
1.003905, -1.172236, 3.400016, 1, 0, 0.972549, 1,
1.004376, 1.719752, -0.986573, 1, 0, 0.9647059, 1,
1.013013, 1.675716, 1.764425, 1, 0, 0.9607843, 1,
1.013518, 0.6926072, 0.2703903, 1, 0, 0.9529412, 1,
1.01388, -0.051257, 1.492292, 1, 0, 0.9490196, 1,
1.020232, -0.79978, 1.589176, 1, 0, 0.9411765, 1,
1.024166, -0.1641697, 1.413773, 1, 0, 0.9372549, 1,
1.025437, -1.017366, 2.862936, 1, 0, 0.9294118, 1,
1.029185, 0.4468861, 1.894199, 1, 0, 0.9254902, 1,
1.031983, -0.2598228, 1.977519, 1, 0, 0.9176471, 1,
1.035853, -0.6785496, 1.604696, 1, 0, 0.9137255, 1,
1.035876, -0.05468868, 1.391658, 1, 0, 0.9058824, 1,
1.036099, 0.890815, 2.059911, 1, 0, 0.9019608, 1,
1.03824, 0.5489276, 0.7762811, 1, 0, 0.8941177, 1,
1.038464, -0.5352107, 1.16618, 1, 0, 0.8862745, 1,
1.041222, -0.6712176, 1.263507, 1, 0, 0.8823529, 1,
1.052328, 0.8030275, 1.386674, 1, 0, 0.8745098, 1,
1.055577, 0.7246279, 1.582768, 1, 0, 0.8705882, 1,
1.059886, -1.302009, 4.066877, 1, 0, 0.8627451, 1,
1.06176, 1.021199, 1.712777, 1, 0, 0.8588235, 1,
1.064145, -0.1062674, 2.714552, 1, 0, 0.8509804, 1,
1.07369, 0.2110784, 1.442763, 1, 0, 0.8470588, 1,
1.07563, -0.1110171, 2.229634, 1, 0, 0.8392157, 1,
1.0896, 0.008906153, 1.266479, 1, 0, 0.8352941, 1,
1.096589, 0.1546224, 1.190319, 1, 0, 0.827451, 1,
1.0981, -1.188066, 1.175092, 1, 0, 0.8235294, 1,
1.109036, 0.9648815, 1.707485, 1, 0, 0.8156863, 1,
1.111651, 0.6158641, 1.714567, 1, 0, 0.8117647, 1,
1.11286, -1.80774, 2.642317, 1, 0, 0.8039216, 1,
1.114033, -0.2016649, 1.682803, 1, 0, 0.7960784, 1,
1.114046, -0.34143, 1.123484, 1, 0, 0.7921569, 1,
1.115361, -0.1849168, 0.4279186, 1, 0, 0.7843137, 1,
1.115706, -0.9610292, 2.877801, 1, 0, 0.7803922, 1,
1.123444, 1.850192, -0.911681, 1, 0, 0.772549, 1,
1.126047, -0.1282749, 2.197951, 1, 0, 0.7686275, 1,
1.14017, -0.2257142, 0.7168178, 1, 0, 0.7607843, 1,
1.153714, -0.3677875, 2.910612, 1, 0, 0.7568628, 1,
1.163004, 0.2148157, 1.340869, 1, 0, 0.7490196, 1,
1.165509, 0.5564257, 0.4835966, 1, 0, 0.7450981, 1,
1.165685, -1.168306, 3.107282, 1, 0, 0.7372549, 1,
1.172183, -0.8588938, 2.899866, 1, 0, 0.7333333, 1,
1.181847, -0.8110152, 2.474784, 1, 0, 0.7254902, 1,
1.182998, 0.4751917, 0.26293, 1, 0, 0.7215686, 1,
1.183613, -0.2374074, 1.005523, 1, 0, 0.7137255, 1,
1.185829, -0.8701934, 2.506168, 1, 0, 0.7098039, 1,
1.186533, -1.554045, 2.326268, 1, 0, 0.7019608, 1,
1.188518, 0.7196203, 0.7803143, 1, 0, 0.6941177, 1,
1.197261, -0.8698902, 3.511168, 1, 0, 0.6901961, 1,
1.205275, 0.307733, -0.2860717, 1, 0, 0.682353, 1,
1.205733, -0.001871484, 3.977077, 1, 0, 0.6784314, 1,
1.210297, 0.02649047, 1.613846, 1, 0, 0.6705883, 1,
1.215053, -1.634113, 2.456768, 1, 0, 0.6666667, 1,
1.219674, 0.8305297, 1.306349, 1, 0, 0.6588235, 1,
1.220141, 0.9768577, -1.223294, 1, 0, 0.654902, 1,
1.223118, -0.5830183, 2.748707, 1, 0, 0.6470588, 1,
1.237159, -2.198688, 2.340219, 1, 0, 0.6431373, 1,
1.247361, -0.08855272, 2.897103, 1, 0, 0.6352941, 1,
1.250751, -0.4395282, 0.840756, 1, 0, 0.6313726, 1,
1.258362, -0.2734442, 1.938592, 1, 0, 0.6235294, 1,
1.259444, -1.870396, 2.430055, 1, 0, 0.6196079, 1,
1.260657, -0.2424478, 0.8822494, 1, 0, 0.6117647, 1,
1.264854, 0.7146222, -0.8523359, 1, 0, 0.6078432, 1,
1.265918, -1.125925, 3.180714, 1, 0, 0.6, 1,
1.267118, 2.016368, 0.9807556, 1, 0, 0.5921569, 1,
1.269795, -0.4114163, 2.794897, 1, 0, 0.5882353, 1,
1.272894, 1.636743, 0.8771223, 1, 0, 0.5803922, 1,
1.279858, 0.8524714, 1.148433, 1, 0, 0.5764706, 1,
1.28123, -0.8389922, 1.142634, 1, 0, 0.5686275, 1,
1.28492, 0.6705009, 2.346051, 1, 0, 0.5647059, 1,
1.291588, 0.2247544, 0.5988803, 1, 0, 0.5568628, 1,
1.292285, -1.4704, 2.734914, 1, 0, 0.5529412, 1,
1.293113, -0.08056542, 2.966335, 1, 0, 0.5450981, 1,
1.293941, 1.216615, 0.5116811, 1, 0, 0.5411765, 1,
1.314753, 0.2071395, 1.798718, 1, 0, 0.5333334, 1,
1.317267, 0.08740461, 3.001729, 1, 0, 0.5294118, 1,
1.331031, 0.6097882, 0.7393098, 1, 0, 0.5215687, 1,
1.333947, -0.2853723, 0.7204385, 1, 0, 0.5176471, 1,
1.33804, -0.3849322, 1.312845, 1, 0, 0.509804, 1,
1.344409, -0.6891352, 1.864482, 1, 0, 0.5058824, 1,
1.353488, -0.1811357, 0.6328019, 1, 0, 0.4980392, 1,
1.368301, 0.1351749, 1.882958, 1, 0, 0.4901961, 1,
1.383674, 0.206615, 0.8829846, 1, 0, 0.4862745, 1,
1.390393, -1.150581, 0.1733352, 1, 0, 0.4784314, 1,
1.392221, 1.027702, 0.8190104, 1, 0, 0.4745098, 1,
1.404955, 0.3546018, 2.275051, 1, 0, 0.4666667, 1,
1.414981, 0.1984069, 0.8042559, 1, 0, 0.4627451, 1,
1.427751, -0.9519675, 2.932017, 1, 0, 0.454902, 1,
1.430287, -1.153196, 1.934626, 1, 0, 0.4509804, 1,
1.433504, -0.8096132, 3.783335, 1, 0, 0.4431373, 1,
1.434186, -0.4957643, 2.649701, 1, 0, 0.4392157, 1,
1.470286, 0.1119865, 1.493441, 1, 0, 0.4313726, 1,
1.494875, 2.266279, 0.1373059, 1, 0, 0.427451, 1,
1.495723, -0.9774888, 1.927949, 1, 0, 0.4196078, 1,
1.516201, 0.3913899, 1.959231, 1, 0, 0.4156863, 1,
1.536153, -1.584969, 1.620166, 1, 0, 0.4078431, 1,
1.539419, -1.770208, 3.022302, 1, 0, 0.4039216, 1,
1.541603, 0.2160199, 0.766548, 1, 0, 0.3960784, 1,
1.544592, -0.8334644, 1.590747, 1, 0, 0.3882353, 1,
1.545592, 0.4140786, 0.6213606, 1, 0, 0.3843137, 1,
1.549281, -0.1855515, 1.709877, 1, 0, 0.3764706, 1,
1.563597, -0.5328192, 2.342641, 1, 0, 0.372549, 1,
1.567471, 1.015807, 0.9646393, 1, 0, 0.3647059, 1,
1.570415, -0.3279917, 1.813231, 1, 0, 0.3607843, 1,
1.583825, 0.1420532, 3.651006, 1, 0, 0.3529412, 1,
1.590603, 1.554188, 1.032182, 1, 0, 0.3490196, 1,
1.594903, -1.263922, 2.66137, 1, 0, 0.3411765, 1,
1.597304, -0.0345866, 2.757968, 1, 0, 0.3372549, 1,
1.597442, -2.059646, 3.443447, 1, 0, 0.3294118, 1,
1.59965, -0.3478292, 1.228763, 1, 0, 0.3254902, 1,
1.600148, 0.803464, 1.93559, 1, 0, 0.3176471, 1,
1.603145, -0.7317308, 2.34711, 1, 0, 0.3137255, 1,
1.608, 1.014319, 2.106244, 1, 0, 0.3058824, 1,
1.61093, -0.4358024, 2.384007, 1, 0, 0.2980392, 1,
1.61674, -1.128847, 3.448364, 1, 0, 0.2941177, 1,
1.622835, 0.07593316, 1.207313, 1, 0, 0.2862745, 1,
1.625357, -1.625412, 2.803191, 1, 0, 0.282353, 1,
1.630318, 1.456197, 1.768647, 1, 0, 0.2745098, 1,
1.631201, 0.08225512, 1.365838, 1, 0, 0.2705882, 1,
1.633914, 0.5500311, 0.2057931, 1, 0, 0.2627451, 1,
1.638038, -0.2295862, 1.605839, 1, 0, 0.2588235, 1,
1.645169, -0.3811371, 1.293085, 1, 0, 0.2509804, 1,
1.65191, 0.2689284, -0.446587, 1, 0, 0.2470588, 1,
1.657878, -0.5804141, 3.282892, 1, 0, 0.2392157, 1,
1.659252, -0.01512741, 2.952729, 1, 0, 0.2352941, 1,
1.695368, 1.172728, -1.116172, 1, 0, 0.227451, 1,
1.695883, 0.9576836, -0.1854295, 1, 0, 0.2235294, 1,
1.70679, 1.509307, 2.639328, 1, 0, 0.2156863, 1,
1.743164, 0.9135441, 2.55962, 1, 0, 0.2117647, 1,
1.753151, -0.9380801, 1.204893, 1, 0, 0.2039216, 1,
1.758121, 1.547309, 0.3677601, 1, 0, 0.1960784, 1,
1.758692, -0.8424804, 3.004408, 1, 0, 0.1921569, 1,
1.789073, -1.191221, 3.195983, 1, 0, 0.1843137, 1,
1.833706, -0.838238, 1.673995, 1, 0, 0.1803922, 1,
1.848103, -0.2437013, 2.645946, 1, 0, 0.172549, 1,
1.85397, -0.2642638, 1.866629, 1, 0, 0.1686275, 1,
1.858105, -1.037034, 3.603062, 1, 0, 0.1607843, 1,
1.932086, -0.2727437, 2.019953, 1, 0, 0.1568628, 1,
1.934182, -0.9991008, 1.496936, 1, 0, 0.1490196, 1,
1.953836, 0.2572738, -0.7011003, 1, 0, 0.145098, 1,
1.966242, -1.629385, 1.818125, 1, 0, 0.1372549, 1,
1.970531, -1.964748, 1.474831, 1, 0, 0.1333333, 1,
2.003325, -0.5762497, -0.3619293, 1, 0, 0.1254902, 1,
2.031167, 0.7836857, -1.290216, 1, 0, 0.1215686, 1,
2.032608, -1.708443, 0.937272, 1, 0, 0.1137255, 1,
2.043148, 1.968298, -0.1827073, 1, 0, 0.1098039, 1,
2.051733, 1.499208, 1.61769, 1, 0, 0.1019608, 1,
2.055272, 0.4892064, 2.229152, 1, 0, 0.09411765, 1,
2.064175, -0.6339714, 1.168554, 1, 0, 0.09019608, 1,
2.110325, 1.071296, 4.219671, 1, 0, 0.08235294, 1,
2.120503, -2.573078, 2.478592, 1, 0, 0.07843138, 1,
2.12051, 2.244002, 0.4931237, 1, 0, 0.07058824, 1,
2.173849, -0.2786757, 0.1827084, 1, 0, 0.06666667, 1,
2.206185, 0.5304861, 1.267632, 1, 0, 0.05882353, 1,
2.265306, -0.684879, 1.085598, 1, 0, 0.05490196, 1,
2.270513, 0.3280097, -0.7378049, 1, 0, 0.04705882, 1,
2.300068, -1.863292, 3.645875, 1, 0, 0.04313726, 1,
2.328, 1.576636, 0.6011215, 1, 0, 0.03529412, 1,
2.470209, -1.804399, 4.123684, 1, 0, 0.03137255, 1,
2.602317, 1.234703, 2.149072, 1, 0, 0.02352941, 1,
2.630311, -0.9028789, 1.513852, 1, 0, 0.01960784, 1,
2.724453, -1.770407, 3.265039, 1, 0, 0.01176471, 1,
2.929228, 0.7164106, 1.575915, 1, 0, 0.007843138, 1
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
-0.2795491, -3.678499, -7.73696, 0, -0.5, 0.5, 0.5,
-0.2795491, -3.678499, -7.73696, 1, -0.5, 0.5, 0.5,
-0.2795491, -3.678499, -7.73696, 1, 1.5, 0.5, 0.5,
-0.2795491, -3.678499, -7.73696, 0, 1.5, 0.5, 0.5
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
-4.576102, 0.1318406, -7.73696, 0, -0.5, 0.5, 0.5,
-4.576102, 0.1318406, -7.73696, 1, -0.5, 0.5, 0.5,
-4.576102, 0.1318406, -7.73696, 1, 1.5, 0.5, 0.5,
-4.576102, 0.1318406, -7.73696, 0, 1.5, 0.5, 0.5
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
-4.576102, -3.678499, -0.281621, 0, -0.5, 0.5, 0.5,
-4.576102, -3.678499, -0.281621, 1, -0.5, 0.5, 0.5,
-4.576102, -3.678499, -0.281621, 1, 1.5, 0.5, 0.5,
-4.576102, -3.678499, -0.281621, 0, 1.5, 0.5, 0.5
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
-3, -2.79919, -6.016497,
2, -2.79919, -6.016497,
-3, -2.79919, -6.016497,
-3, -2.945742, -6.303241,
-2, -2.79919, -6.016497,
-2, -2.945742, -6.303241,
-1, -2.79919, -6.016497,
-1, -2.945742, -6.303241,
0, -2.79919, -6.016497,
0, -2.945742, -6.303241,
1, -2.79919, -6.016497,
1, -2.945742, -6.303241,
2, -2.79919, -6.016497,
2, -2.945742, -6.303241
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
-3, -3.238845, -6.876729, 0, -0.5, 0.5, 0.5,
-3, -3.238845, -6.876729, 1, -0.5, 0.5, 0.5,
-3, -3.238845, -6.876729, 1, 1.5, 0.5, 0.5,
-3, -3.238845, -6.876729, 0, 1.5, 0.5, 0.5,
-2, -3.238845, -6.876729, 0, -0.5, 0.5, 0.5,
-2, -3.238845, -6.876729, 1, -0.5, 0.5, 0.5,
-2, -3.238845, -6.876729, 1, 1.5, 0.5, 0.5,
-2, -3.238845, -6.876729, 0, 1.5, 0.5, 0.5,
-1, -3.238845, -6.876729, 0, -0.5, 0.5, 0.5,
-1, -3.238845, -6.876729, 1, -0.5, 0.5, 0.5,
-1, -3.238845, -6.876729, 1, 1.5, 0.5, 0.5,
-1, -3.238845, -6.876729, 0, 1.5, 0.5, 0.5,
0, -3.238845, -6.876729, 0, -0.5, 0.5, 0.5,
0, -3.238845, -6.876729, 1, -0.5, 0.5, 0.5,
0, -3.238845, -6.876729, 1, 1.5, 0.5, 0.5,
0, -3.238845, -6.876729, 0, 1.5, 0.5, 0.5,
1, -3.238845, -6.876729, 0, -0.5, 0.5, 0.5,
1, -3.238845, -6.876729, 1, -0.5, 0.5, 0.5,
1, -3.238845, -6.876729, 1, 1.5, 0.5, 0.5,
1, -3.238845, -6.876729, 0, 1.5, 0.5, 0.5,
2, -3.238845, -6.876729, 0, -0.5, 0.5, 0.5,
2, -3.238845, -6.876729, 1, -0.5, 0.5, 0.5,
2, -3.238845, -6.876729, 1, 1.5, 0.5, 0.5,
2, -3.238845, -6.876729, 0, 1.5, 0.5, 0.5
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
-3.58459, -2, -6.016497,
-3.58459, 2, -6.016497,
-3.58459, -2, -6.016497,
-3.749842, -2, -6.303241,
-3.58459, -1, -6.016497,
-3.749842, -1, -6.303241,
-3.58459, 0, -6.016497,
-3.749842, 0, -6.303241,
-3.58459, 1, -6.016497,
-3.749842, 1, -6.303241,
-3.58459, 2, -6.016497,
-3.749842, 2, -6.303241
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
-4.080346, -2, -6.876729, 0, -0.5, 0.5, 0.5,
-4.080346, -2, -6.876729, 1, -0.5, 0.5, 0.5,
-4.080346, -2, -6.876729, 1, 1.5, 0.5, 0.5,
-4.080346, -2, -6.876729, 0, 1.5, 0.5, 0.5,
-4.080346, -1, -6.876729, 0, -0.5, 0.5, 0.5,
-4.080346, -1, -6.876729, 1, -0.5, 0.5, 0.5,
-4.080346, -1, -6.876729, 1, 1.5, 0.5, 0.5,
-4.080346, -1, -6.876729, 0, 1.5, 0.5, 0.5,
-4.080346, 0, -6.876729, 0, -0.5, 0.5, 0.5,
-4.080346, 0, -6.876729, 1, -0.5, 0.5, 0.5,
-4.080346, 0, -6.876729, 1, 1.5, 0.5, 0.5,
-4.080346, 0, -6.876729, 0, 1.5, 0.5, 0.5,
-4.080346, 1, -6.876729, 0, -0.5, 0.5, 0.5,
-4.080346, 1, -6.876729, 1, -0.5, 0.5, 0.5,
-4.080346, 1, -6.876729, 1, 1.5, 0.5, 0.5,
-4.080346, 1, -6.876729, 0, 1.5, 0.5, 0.5,
-4.080346, 2, -6.876729, 0, -0.5, 0.5, 0.5,
-4.080346, 2, -6.876729, 1, -0.5, 0.5, 0.5,
-4.080346, 2, -6.876729, 1, 1.5, 0.5, 0.5,
-4.080346, 2, -6.876729, 0, 1.5, 0.5, 0.5
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
-3.58459, -2.79919, -4,
-3.58459, -2.79919, 4,
-3.58459, -2.79919, -4,
-3.749842, -2.945742, -4,
-3.58459, -2.79919, -2,
-3.749842, -2.945742, -2,
-3.58459, -2.79919, 0,
-3.749842, -2.945742, 0,
-3.58459, -2.79919, 2,
-3.749842, -2.945742, 2,
-3.58459, -2.79919, 4,
-3.749842, -2.945742, 4
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
-4.080346, -3.238845, -4, 0, -0.5, 0.5, 0.5,
-4.080346, -3.238845, -4, 1, -0.5, 0.5, 0.5,
-4.080346, -3.238845, -4, 1, 1.5, 0.5, 0.5,
-4.080346, -3.238845, -4, 0, 1.5, 0.5, 0.5,
-4.080346, -3.238845, -2, 0, -0.5, 0.5, 0.5,
-4.080346, -3.238845, -2, 1, -0.5, 0.5, 0.5,
-4.080346, -3.238845, -2, 1, 1.5, 0.5, 0.5,
-4.080346, -3.238845, -2, 0, 1.5, 0.5, 0.5,
-4.080346, -3.238845, 0, 0, -0.5, 0.5, 0.5,
-4.080346, -3.238845, 0, 1, -0.5, 0.5, 0.5,
-4.080346, -3.238845, 0, 1, 1.5, 0.5, 0.5,
-4.080346, -3.238845, 0, 0, 1.5, 0.5, 0.5,
-4.080346, -3.238845, 2, 0, -0.5, 0.5, 0.5,
-4.080346, -3.238845, 2, 1, -0.5, 0.5, 0.5,
-4.080346, -3.238845, 2, 1, 1.5, 0.5, 0.5,
-4.080346, -3.238845, 2, 0, 1.5, 0.5, 0.5,
-4.080346, -3.238845, 4, 0, -0.5, 0.5, 0.5,
-4.080346, -3.238845, 4, 1, -0.5, 0.5, 0.5,
-4.080346, -3.238845, 4, 1, 1.5, 0.5, 0.5,
-4.080346, -3.238845, 4, 0, 1.5, 0.5, 0.5
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
-3.58459, -2.79919, -6.016497,
-3.58459, 3.062871, -6.016497,
-3.58459, -2.79919, 5.453255,
-3.58459, 3.062871, 5.453255,
-3.58459, -2.79919, -6.016497,
-3.58459, -2.79919, 5.453255,
-3.58459, 3.062871, -6.016497,
-3.58459, 3.062871, 5.453255,
-3.58459, -2.79919, -6.016497,
3.025491, -2.79919, -6.016497,
-3.58459, -2.79919, 5.453255,
3.025491, -2.79919, 5.453255,
-3.58459, 3.062871, -6.016497,
3.025491, 3.062871, -6.016497,
-3.58459, 3.062871, 5.453255,
3.025491, 3.062871, 5.453255,
3.025491, -2.79919, -6.016497,
3.025491, 3.062871, -6.016497,
3.025491, -2.79919, 5.453255,
3.025491, 3.062871, 5.453255,
3.025491, -2.79919, -6.016497,
3.025491, -2.79919, 5.453255,
3.025491, 3.062871, -6.016497,
3.025491, 3.062871, 5.453255
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
var radius = 7.730965;
var distance = 34.39594;
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
mvMatrix.translate( 0.2795491, -0.1318406, 0.281621 );
mvMatrix.scale( 1.264564, 1.425927, 0.7287751 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.39594);
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
methylcarbamate_2-et<-read.table("methylcarbamate_2-et.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-methylcarbamate_2-et$V2
```

```
## Error in eval(expr, envir, enclos): object 'methylcarbamate_2' not found
```

```r
y<-methylcarbamate_2-et$V3
```

```
## Error in eval(expr, envir, enclos): object 'methylcarbamate_2' not found
```

```r
z<-methylcarbamate_2-et$V4
```

```
## Error in eval(expr, envir, enclos): object 'methylcarbamate_2' not found
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
-3.488326, -0.5807228, -2.974457, 0, 0, 1, 1, 1,
-3.408224, 2.085083, -1.763212, 1, 0, 0, 1, 1,
-3.404413, 0.3442198, -1.616499, 1, 0, 0, 1, 1,
-2.890674, 2.240467, -0.09869403, 1, 0, 0, 1, 1,
-2.874089, -0.9110441, -1.881032, 1, 0, 0, 1, 1,
-2.833321, 0.6547339, -0.3748884, 1, 0, 0, 1, 1,
-2.739535, 0.6248962, -0.9455702, 0, 0, 0, 1, 1,
-2.627158, -0.5105734, -2.114797, 0, 0, 0, 1, 1,
-2.438537, -2.71382, -3.712328, 0, 0, 0, 1, 1,
-2.370886, -0.6869277, -0.2813358, 0, 0, 0, 1, 1,
-2.337738, -1.137782, -1.993529, 0, 0, 0, 1, 1,
-2.3342, -0.1882986, -0.3628624, 0, 0, 0, 1, 1,
-2.26756, -0.7974795, -1.469631, 0, 0, 0, 1, 1,
-2.257399, 0.3033361, 0.4155372, 1, 1, 1, 1, 1,
-2.255032, 0.482555, -0.2221152, 1, 1, 1, 1, 1,
-2.248643, -0.2451793, -2.492072, 1, 1, 1, 1, 1,
-2.22908, 0.7851511, -1.076396, 1, 1, 1, 1, 1,
-2.221198, 0.8541896, -0.5132764, 1, 1, 1, 1, 1,
-2.176127, 0.5205463, -2.178077, 1, 1, 1, 1, 1,
-2.150666, -2.070523, -2.509752, 1, 1, 1, 1, 1,
-2.134055, 0.01138348, -1.700036, 1, 1, 1, 1, 1,
-2.094473, -0.851949, -0.8595299, 1, 1, 1, 1, 1,
-2.076898, 1.4159, -0.4805656, 1, 1, 1, 1, 1,
-2.074466, -0.3139765, -0.4055261, 1, 1, 1, 1, 1,
-2.069226, 0.02727049, -2.505504, 1, 1, 1, 1, 1,
-2.066782, -1.671271, -0.3862438, 1, 1, 1, 1, 1,
-2.063125, 0.114736, -1.655284, 1, 1, 1, 1, 1,
-2.038649, -0.3483109, -1.034004, 1, 1, 1, 1, 1,
-2.01252, -1.088602, -0.6408038, 0, 0, 1, 1, 1,
-2.006296, 1.81481, -0.5306029, 1, 0, 0, 1, 1,
-1.980993, -0.6442949, -1.952165, 1, 0, 0, 1, 1,
-1.959913, 0.3148727, -2.036579, 1, 0, 0, 1, 1,
-1.95699, 1.422233, -0.9004177, 1, 0, 0, 1, 1,
-1.950222, -0.06031387, -0.9853486, 1, 0, 0, 1, 1,
-1.944279, 2.666504, -0.1876041, 0, 0, 0, 1, 1,
-1.940706, 0.33095, -0.2631846, 0, 0, 0, 1, 1,
-1.937124, -1.739097, -3.428961, 0, 0, 0, 1, 1,
-1.934097, 0.7059136, -0.3051318, 0, 0, 0, 1, 1,
-1.930123, -1.402845, -3.058293, 0, 0, 0, 1, 1,
-1.918266, -0.07230178, -2.449195, 0, 0, 0, 1, 1,
-1.912773, -1.351264, -1.132416, 0, 0, 0, 1, 1,
-1.896785, 0.8264362, -0.608186, 1, 1, 1, 1, 1,
-1.895717, -0.2945524, -1.309114, 1, 1, 1, 1, 1,
-1.871954, -0.9424869, -1.355497, 1, 1, 1, 1, 1,
-1.860862, -0.6416888, -2.490319, 1, 1, 1, 1, 1,
-1.858425, -0.855547, -1.952175, 1, 1, 1, 1, 1,
-1.84263, 0.07682144, -2.522853, 1, 1, 1, 1, 1,
-1.833744, -2.139531, -0.7324426, 1, 1, 1, 1, 1,
-1.81938, -1.463602, -0.07824925, 1, 1, 1, 1, 1,
-1.80481, 0.6231552, -0.910904, 1, 1, 1, 1, 1,
-1.799931, 0.9581807, -2.123298, 1, 1, 1, 1, 1,
-1.79509, -0.1923241, -2.130988, 1, 1, 1, 1, 1,
-1.785335, 1.242475, -0.8758685, 1, 1, 1, 1, 1,
-1.776502, -0.8908529, -3.471704, 1, 1, 1, 1, 1,
-1.774715, -0.2578668, -2.776016, 1, 1, 1, 1, 1,
-1.760334, 0.0156918, -2.488597, 1, 1, 1, 1, 1,
-1.722667, 1.470472, -2.498234, 0, 0, 1, 1, 1,
-1.705913, -0.2864892, -1.555062, 1, 0, 0, 1, 1,
-1.701304, -1.83991, -0.9768829, 1, 0, 0, 1, 1,
-1.687074, 0.2072391, -1.083616, 1, 0, 0, 1, 1,
-1.685897, 0.2849737, -1.317649, 1, 0, 0, 1, 1,
-1.678946, -0.7463121, -0.7630233, 1, 0, 0, 1, 1,
-1.664318, -0.07029936, -2.576422, 0, 0, 0, 1, 1,
-1.655409, 1.043318, -1.158984, 0, 0, 0, 1, 1,
-1.648673, -0.4204522, -2.102977, 0, 0, 0, 1, 1,
-1.645301, 1.066304, -2.700477, 0, 0, 0, 1, 1,
-1.639686, -0.7490862, -1.082932, 0, 0, 0, 1, 1,
-1.633735, 0.2169004, -0.9452844, 0, 0, 0, 1, 1,
-1.62351, 0.5098238, 0.1853444, 0, 0, 0, 1, 1,
-1.623323, -1.80708, -2.783254, 1, 1, 1, 1, 1,
-1.62211, -1.187206, -1.658634, 1, 1, 1, 1, 1,
-1.612315, -0.1376033, -1.956924, 1, 1, 1, 1, 1,
-1.585451, 0.6654602, -1.729942, 1, 1, 1, 1, 1,
-1.570011, -0.609167, -0.4520059, 1, 1, 1, 1, 1,
-1.560945, -0.8411978, -3.059199, 1, 1, 1, 1, 1,
-1.558319, -0.5860895, -3.379671, 1, 1, 1, 1, 1,
-1.549058, 0.2944388, -1.073395, 1, 1, 1, 1, 1,
-1.539406, 1.377254, 0.6386899, 1, 1, 1, 1, 1,
-1.527492, 1.854546, -1.04209, 1, 1, 1, 1, 1,
-1.52284, -0.6355971, -2.645511, 1, 1, 1, 1, 1,
-1.521503, -0.6261287, -3.215951, 1, 1, 1, 1, 1,
-1.521067, 1.32634, -0.6454457, 1, 1, 1, 1, 1,
-1.511502, -0.1080311, -1.867918, 1, 1, 1, 1, 1,
-1.501951, 1.046625, 0.004739135, 1, 1, 1, 1, 1,
-1.489346, -1.450422, -1.970347, 0, 0, 1, 1, 1,
-1.46822, 0.8287008, -1.14024, 1, 0, 0, 1, 1,
-1.467231, -2.286625, -2.498985, 1, 0, 0, 1, 1,
-1.463908, 0.8789229, -0.8208866, 1, 0, 0, 1, 1,
-1.461378, 1.162808, -0.19009, 1, 0, 0, 1, 1,
-1.450495, 0.9028023, -1.791465, 1, 0, 0, 1, 1,
-1.44544, 0.04585536, -2.930703, 0, 0, 0, 1, 1,
-1.425838, 1.626572, -2.094404, 0, 0, 0, 1, 1,
-1.421334, -0.5117252, -2.98399, 0, 0, 0, 1, 1,
-1.421012, 2.265418, -1.093175, 0, 0, 0, 1, 1,
-1.416891, -0.3975126, -1.356535, 0, 0, 0, 1, 1,
-1.413246, 0.3715234, -3.038468, 0, 0, 0, 1, 1,
-1.397785, 1.394711, -0.3444407, 0, 0, 0, 1, 1,
-1.394136, -0.361858, -2.26614, 1, 1, 1, 1, 1,
-1.390105, -0.8441067, -2.991242, 1, 1, 1, 1, 1,
-1.379437, -0.2167308, -3.355014, 1, 1, 1, 1, 1,
-1.375821, -0.3023743, -3.757848, 1, 1, 1, 1, 1,
-1.371801, -0.9143856, -1.389173, 1, 1, 1, 1, 1,
-1.371291, -1.529702, -3.035486, 1, 1, 1, 1, 1,
-1.367329, 0.8518344, -1.706278, 1, 1, 1, 1, 1,
-1.362891, -0.5017455, -2.036027, 1, 1, 1, 1, 1,
-1.351355, -0.04550172, -0.3353968, 1, 1, 1, 1, 1,
-1.347401, -0.5051351, -2.558002, 1, 1, 1, 1, 1,
-1.344339, 1.121324, 0.6322527, 1, 1, 1, 1, 1,
-1.334729, -0.4740188, -0.1468515, 1, 1, 1, 1, 1,
-1.330436, -0.6490169, -1.702308, 1, 1, 1, 1, 1,
-1.326909, 0.04784738, -1.331477, 1, 1, 1, 1, 1,
-1.319824, -1.47944, 0.1451788, 1, 1, 1, 1, 1,
-1.309302, 0.4791392, -1.32524, 0, 0, 1, 1, 1,
-1.299415, 0.9865528, 1.162081, 1, 0, 0, 1, 1,
-1.295562, 2.00152, -1.337391, 1, 0, 0, 1, 1,
-1.288318, 2.24184, -0.5055926, 1, 0, 0, 1, 1,
-1.28453, -0.6147584, -0.4193363, 1, 0, 0, 1, 1,
-1.284349, 1.828248, 0.1269702, 1, 0, 0, 1, 1,
-1.280727, -0.4412246, -1.139628, 0, 0, 0, 1, 1,
-1.277279, -0.3676261, -0.3098491, 0, 0, 0, 1, 1,
-1.276835, 0.5493469, -2.402719, 0, 0, 0, 1, 1,
-1.271389, 0.5717981, -1.13733, 0, 0, 0, 1, 1,
-1.269525, -1.465691, -1.556369, 0, 0, 0, 1, 1,
-1.267517, -1.883729, -3.393551, 0, 0, 0, 1, 1,
-1.262767, -1.814523, -1.720789, 0, 0, 0, 1, 1,
-1.262089, -2.237807, -2.69182, 1, 1, 1, 1, 1,
-1.259232, 0.3912429, 0.4050554, 1, 1, 1, 1, 1,
-1.244871, -2.019162, -3.560259, 1, 1, 1, 1, 1,
-1.239732, 0.1515777, -3.115494, 1, 1, 1, 1, 1,
-1.233764, -0.3428878, -3.525176, 1, 1, 1, 1, 1,
-1.227752, 0.858321, -0.7148277, 1, 1, 1, 1, 1,
-1.224594, -0.1114023, -2.117085, 1, 1, 1, 1, 1,
-1.219487, 2.043121, -2.420967, 1, 1, 1, 1, 1,
-1.218997, -0.3474276, -1.630517, 1, 1, 1, 1, 1,
-1.211701, 1.558599, -0.3082725, 1, 1, 1, 1, 1,
-1.206924, 0.5972514, -2.199265, 1, 1, 1, 1, 1,
-1.205651, -2.339401, -3.043422, 1, 1, 1, 1, 1,
-1.199077, 0.7502223, -1.304261, 1, 1, 1, 1, 1,
-1.188048, -0.9544591, -1.456638, 1, 1, 1, 1, 1,
-1.186309, 0.228891, -2.277302, 1, 1, 1, 1, 1,
-1.186295, -0.9670358, -3.248066, 0, 0, 1, 1, 1,
-1.174783, 1.796555, -0.3384815, 1, 0, 0, 1, 1,
-1.17021, 0.9412606, -1.817779, 1, 0, 0, 1, 1,
-1.168978, 0.2770686, -0.5419002, 1, 0, 0, 1, 1,
-1.168151, 0.1744172, 0.4845272, 1, 0, 0, 1, 1,
-1.167904, 0.2787203, -0.7393242, 1, 0, 0, 1, 1,
-1.165678, -0.8435164, -2.823067, 0, 0, 0, 1, 1,
-1.165333, -0.000558973, -1.648281, 0, 0, 0, 1, 1,
-1.159279, 2.977502, 0.1817831, 0, 0, 0, 1, 1,
-1.158722, -0.09250399, -1.55195, 0, 0, 0, 1, 1,
-1.156647, -0.7746496, -1.58918, 0, 0, 0, 1, 1,
-1.150772, -0.8375069, -2.075077, 0, 0, 0, 1, 1,
-1.150766, 1.703817, -0.1475551, 0, 0, 0, 1, 1,
-1.147148, -0.5842805, -3.376422, 1, 1, 1, 1, 1,
-1.146749, 0.5482365, -1.574963, 1, 1, 1, 1, 1,
-1.146345, 0.200529, -1.293623, 1, 1, 1, 1, 1,
-1.139243, -1.406143, -2.751988, 1, 1, 1, 1, 1,
-1.133647, -0.7889428, -3.685463, 1, 1, 1, 1, 1,
-1.129481, -1.394525, 0.295151, 1, 1, 1, 1, 1,
-1.123003, 0.4957696, -1.560298, 1, 1, 1, 1, 1,
-1.119834, -0.6543183, -2.070591, 1, 1, 1, 1, 1,
-1.11922, 1.150391, 0.8641125, 1, 1, 1, 1, 1,
-1.1136, -1.221025, -2.073754, 1, 1, 1, 1, 1,
-1.112548, -0.5969866, -1.900384, 1, 1, 1, 1, 1,
-1.10653, 0.3643625, -0.1352769, 1, 1, 1, 1, 1,
-1.094788, 1.407361, -0.6195289, 1, 1, 1, 1, 1,
-1.070835, -1.208939, -1.672257, 1, 1, 1, 1, 1,
-1.068415, -1.65949, -2.202339, 1, 1, 1, 1, 1,
-1.068355, -0.08063281, -1.162155, 0, 0, 1, 1, 1,
-1.067988, 0.1280787, -3.05105, 1, 0, 0, 1, 1,
-1.066947, -1.040271, -1.558931, 1, 0, 0, 1, 1,
-1.066725, -2.13051, -3.807827, 1, 0, 0, 1, 1,
-1.05469, -0.8566803, -2.306768, 1, 0, 0, 1, 1,
-1.051221, -0.196009, -2.225609, 1, 0, 0, 1, 1,
-1.048489, -0.1683817, -2.178447, 0, 0, 0, 1, 1,
-1.046089, -0.1688303, -2.230227, 0, 0, 0, 1, 1,
-1.043414, -0.09183013, -1.361101, 0, 0, 0, 1, 1,
-1.042295, -0.08942956, -1.433367, 0, 0, 0, 1, 1,
-1.036478, -1.243499, -1.796055, 0, 0, 0, 1, 1,
-1.014467, 0.5001709, -2.181349, 0, 0, 0, 1, 1,
-1.009063, 0.2439139, -1.520012, 0, 0, 0, 1, 1,
-1.007518, 0.9028023, -0.9649554, 1, 1, 1, 1, 1,
-1.007219, 0.7036277, -1.581412, 1, 1, 1, 1, 1,
-1.006695, -0.3245322, -3.319378, 1, 1, 1, 1, 1,
-0.9977025, 1.245344, 1.012726, 1, 1, 1, 1, 1,
-0.9964555, 0.4578332, -1.743873, 1, 1, 1, 1, 1,
-0.9957029, 0.9823084, -2.745339, 1, 1, 1, 1, 1,
-0.9882329, -0.4747414, -3.859866, 1, 1, 1, 1, 1,
-0.9818146, 0.1205033, -0.8770028, 1, 1, 1, 1, 1,
-0.9784542, 0.8800875, 0.2158354, 1, 1, 1, 1, 1,
-0.9719183, 0.1629963, -0.9538528, 1, 1, 1, 1, 1,
-0.9690683, 0.07551423, -0.1155947, 1, 1, 1, 1, 1,
-0.9645826, 0.2491028, -1.280708, 1, 1, 1, 1, 1,
-0.96293, -0.5995597, -1.72218, 1, 1, 1, 1, 1,
-0.9622208, 1.279718, -1.860414, 1, 1, 1, 1, 1,
-0.9578953, 0.5546894, -1.144736, 1, 1, 1, 1, 1,
-0.946953, -0.8765622, -1.925995, 0, 0, 1, 1, 1,
-0.9452733, 0.2230558, -0.4473461, 1, 0, 0, 1, 1,
-0.9402938, -1.961242, -3.104842, 1, 0, 0, 1, 1,
-0.9353372, -1.722496, -3.162077, 1, 0, 0, 1, 1,
-0.9315016, -1.096442, -3.422499, 1, 0, 0, 1, 1,
-0.9294274, -1.127981, -1.954485, 1, 0, 0, 1, 1,
-0.9184746, -0.04453331, 0.5985835, 0, 0, 0, 1, 1,
-0.9176311, 0.4116652, -1.231349, 0, 0, 0, 1, 1,
-0.9132175, 0.8376329, -1.314404, 0, 0, 0, 1, 1,
-0.9111554, 1.535627, -1.360203, 0, 0, 0, 1, 1,
-0.9110886, -1.053906, -1.921125, 0, 0, 0, 1, 1,
-0.9074755, 1.184077, -1.34949, 0, 0, 0, 1, 1,
-0.9045044, 1.839265, 0.2105021, 0, 0, 0, 1, 1,
-0.878154, -0.1020733, -1.09927, 1, 1, 1, 1, 1,
-0.8771589, 0.2020628, -0.9181958, 1, 1, 1, 1, 1,
-0.8753156, -1.411666, -2.898019, 1, 1, 1, 1, 1,
-0.8672907, 0.9050856, -0.8652038, 1, 1, 1, 1, 1,
-0.8640738, 0.06203515, -2.303914, 1, 1, 1, 1, 1,
-0.8601877, -0.6849104, -1.304556, 1, 1, 1, 1, 1,
-0.855526, 1.306767, -1.545607, 1, 1, 1, 1, 1,
-0.8554047, 1.447571, -1.224752, 1, 1, 1, 1, 1,
-0.8492635, -0.6679939, -1.306856, 1, 1, 1, 1, 1,
-0.8465951, 1.03795, -1.483222, 1, 1, 1, 1, 1,
-0.8451065, 1.622953, -0.5371076, 1, 1, 1, 1, 1,
-0.8434182, -1.450674, -2.183792, 1, 1, 1, 1, 1,
-0.8394522, 0.3885863, -2.206131, 1, 1, 1, 1, 1,
-0.8381511, -0.5092626, -1.188315, 1, 1, 1, 1, 1,
-0.8379781, 0.5105937, -0.4765432, 1, 1, 1, 1, 1,
-0.8362845, -0.03225286, -1.094717, 0, 0, 1, 1, 1,
-0.8356304, 0.3426989, -0.2176055, 1, 0, 0, 1, 1,
-0.8311978, 0.8434949, -1.343418, 1, 0, 0, 1, 1,
-0.8255374, -1.061499, -2.467613, 1, 0, 0, 1, 1,
-0.8245271, 1.520931, -0.7046235, 1, 0, 0, 1, 1,
-0.8201659, 0.3621313, 0.7666798, 1, 0, 0, 1, 1,
-0.8172908, 0.4583729, -2.599869, 0, 0, 0, 1, 1,
-0.8156357, 1.297822, 0.2559564, 0, 0, 0, 1, 1,
-0.8151358, 0.6960976, -0.4151405, 0, 0, 0, 1, 1,
-0.8147157, -1.589651, -2.126249, 0, 0, 0, 1, 1,
-0.8143548, 1.728746, -2.726808, 0, 0, 0, 1, 1,
-0.8116407, 0.1642392, -1.603677, 0, 0, 0, 1, 1,
-0.8111413, -0.3059887, -1.964365, 0, 0, 0, 1, 1,
-0.8110813, -0.1594499, -0.9731881, 1, 1, 1, 1, 1,
-0.8064685, -1.132128, -1.913696, 1, 1, 1, 1, 1,
-0.8045517, 1.200803, -0.3051783, 1, 1, 1, 1, 1,
-0.8032535, -0.3723276, -2.930506, 1, 1, 1, 1, 1,
-0.8021882, -1.396426, -1.743212, 1, 1, 1, 1, 1,
-0.7984691, -0.621203, -3.678484, 1, 1, 1, 1, 1,
-0.7960265, -1.259023, -2.190864, 1, 1, 1, 1, 1,
-0.7656262, -0.3043559, -1.739911, 1, 1, 1, 1, 1,
-0.7630143, 1.944211, -1.101393, 1, 1, 1, 1, 1,
-0.7611125, 0.2237491, -1.579785, 1, 1, 1, 1, 1,
-0.7594705, 1.073397, 1.66531, 1, 1, 1, 1, 1,
-0.755406, -0.785569, -2.601039, 1, 1, 1, 1, 1,
-0.7537824, -0.9676784, -2.037193, 1, 1, 1, 1, 1,
-0.7509127, -1.122026, -2.594618, 1, 1, 1, 1, 1,
-0.7472656, -0.6510671, -1.904974, 1, 1, 1, 1, 1,
-0.7471873, 0.8263889, -1.38559, 0, 0, 1, 1, 1,
-0.7413771, -0.4284633, -4.065672, 1, 0, 0, 1, 1,
-0.7360941, 0.007470279, -0.856073, 1, 0, 0, 1, 1,
-0.7307296, 1.264979, -1.644273, 1, 0, 0, 1, 1,
-0.7216491, 1.414165, -0.04003214, 1, 0, 0, 1, 1,
-0.7176977, -0.4135545, -2.91763, 1, 0, 0, 1, 1,
-0.7168901, 0.1951102, -1.029286, 0, 0, 0, 1, 1,
-0.7150192, 1.347909, -2.543358, 0, 0, 0, 1, 1,
-0.7145048, -0.4409464, -1.8422, 0, 0, 0, 1, 1,
-0.712029, 0.4427311, -1.292012, 0, 0, 0, 1, 1,
-0.7109249, -0.08229271, -2.453964, 0, 0, 0, 1, 1,
-0.7074961, -0.4885078, -1.365215, 0, 0, 0, 1, 1,
-0.7034104, -1.15697, -2.876755, 0, 0, 0, 1, 1,
-0.7004388, 0.6129003, -1.707366, 1, 1, 1, 1, 1,
-0.6990281, 0.6847293, -0.1426646, 1, 1, 1, 1, 1,
-0.6981016, -0.0374929, -2.465166, 1, 1, 1, 1, 1,
-0.6956407, 0.4805756, -2.821194, 1, 1, 1, 1, 1,
-0.6917858, 1.631545, -1.699381, 1, 1, 1, 1, 1,
-0.6850963, 0.2336716, -1.759656, 1, 1, 1, 1, 1,
-0.678539, -1.273099, -2.491871, 1, 1, 1, 1, 1,
-0.6710887, -0.2703398, -2.371285, 1, 1, 1, 1, 1,
-0.670989, -0.4135693, -1.567122, 1, 1, 1, 1, 1,
-0.6687305, -1.104328, -3.889735, 1, 1, 1, 1, 1,
-0.6667888, -0.03736966, -1.462125, 1, 1, 1, 1, 1,
-0.6610962, 1.4361, -1.68938, 1, 1, 1, 1, 1,
-0.659059, -0.9297608, -1.555973, 1, 1, 1, 1, 1,
-0.6575555, 0.135049, -1.187172, 1, 1, 1, 1, 1,
-0.6526349, 0.1880984, -2.178473, 1, 1, 1, 1, 1,
-0.652541, 1.817534, -1.937769, 0, 0, 1, 1, 1,
-0.6525078, -1.032731, -2.029334, 1, 0, 0, 1, 1,
-0.6491405, 0.3490985, -1.418494, 1, 0, 0, 1, 1,
-0.6482908, -0.139472, -1.339279, 1, 0, 0, 1, 1,
-0.6481581, -1.361846, -3.12457, 1, 0, 0, 1, 1,
-0.6408848, -0.1768605, -0.7267087, 1, 0, 0, 1, 1,
-0.6404302, 1.445134, -2.085284, 0, 0, 0, 1, 1,
-0.6394065, 1.149617, -1.026106, 0, 0, 0, 1, 1,
-0.6317159, 0.5003405, -0.2728815, 0, 0, 0, 1, 1,
-0.6313165, -0.102746, -1.422481, 0, 0, 0, 1, 1,
-0.6273828, 1.917268, -0.1062158, 0, 0, 0, 1, 1,
-0.6241477, -0.6026107, -3.86522, 0, 0, 0, 1, 1,
-0.6214764, -1.392827, -3.755373, 0, 0, 0, 1, 1,
-0.6130841, -1.249038, -2.803207, 1, 1, 1, 1, 1,
-0.6112425, 0.3750628, -1.636233, 1, 1, 1, 1, 1,
-0.6076292, 1.363442, -0.491237, 1, 1, 1, 1, 1,
-0.6039326, -1.130898, -3.847579, 1, 1, 1, 1, 1,
-0.6026293, -0.2086883, -1.387773, 1, 1, 1, 1, 1,
-0.6018954, 0.2078635, -1.089301, 1, 1, 1, 1, 1,
-0.5988348, 0.1008285, -2.931757, 1, 1, 1, 1, 1,
-0.5909824, -0.5525259, -1.678461, 1, 1, 1, 1, 1,
-0.5860664, 0.210399, -1.178576, 1, 1, 1, 1, 1,
-0.5829481, -0.885983, -5.295061, 1, 1, 1, 1, 1,
-0.577801, -1.340043, -1.976088, 1, 1, 1, 1, 1,
-0.577458, 0.01489326, -1.792092, 1, 1, 1, 1, 1,
-0.5768241, -1.282468, -2.773446, 1, 1, 1, 1, 1,
-0.5747364, 0.8420077, -1.94784, 1, 1, 1, 1, 1,
-0.5711462, 0.5926913, 0.271827, 1, 1, 1, 1, 1,
-0.5692309, -1.336827, -2.30094, 0, 0, 1, 1, 1,
-0.5664583, -0.1140561, -1.452318, 1, 0, 0, 1, 1,
-0.5664227, -1.287629, -0.9477606, 1, 0, 0, 1, 1,
-0.5603111, -0.8533693, -4.398015, 1, 0, 0, 1, 1,
-0.5590538, -0.4012237, -2.517787, 1, 0, 0, 1, 1,
-0.5583748, 0.9678426, -3.020343, 1, 0, 0, 1, 1,
-0.5555191, 0.5150698, -1.230332, 0, 0, 0, 1, 1,
-0.5533044, 1.559881, 1.213894, 0, 0, 0, 1, 1,
-0.5516116, 0.3566566, -1.12918, 0, 0, 0, 1, 1,
-0.5466273, -0.3954776, -4.232112, 0, 0, 0, 1, 1,
-0.5459997, 1.066495, 0.3714188, 0, 0, 0, 1, 1,
-0.5405587, 0.8320776, 0.413701, 0, 0, 0, 1, 1,
-0.5397572, 0.3019141, -0.6822065, 0, 0, 0, 1, 1,
-0.539498, 0.8781613, -1.060099, 1, 1, 1, 1, 1,
-0.5353655, -0.1507891, -1.936542, 1, 1, 1, 1, 1,
-0.5253142, 0.3667019, -0.9973851, 1, 1, 1, 1, 1,
-0.5183592, 0.8878831, 1.022855, 1, 1, 1, 1, 1,
-0.5130726, 0.8921874, -0.5339953, 1, 1, 1, 1, 1,
-0.5104194, -0.7423, -3.231704, 1, 1, 1, 1, 1,
-0.5051758, 0.3131557, -2.116205, 1, 1, 1, 1, 1,
-0.5038603, 0.5286788, -0.8040407, 1, 1, 1, 1, 1,
-0.5036441, 1.048196, -0.9203698, 1, 1, 1, 1, 1,
-0.503206, 0.1483573, -1.050511, 1, 1, 1, 1, 1,
-0.5028186, 0.4068074, -0.2640206, 1, 1, 1, 1, 1,
-0.4945956, 0.3378516, -0.9532069, 1, 1, 1, 1, 1,
-0.4939049, -0.3441786, -2.826895, 1, 1, 1, 1, 1,
-0.4921568, 0.3185755, -0.4744645, 1, 1, 1, 1, 1,
-0.4915908, -0.8449301, -2.874388, 1, 1, 1, 1, 1,
-0.4913174, 1.177787, -0.09625236, 0, 0, 1, 1, 1,
-0.4901478, 0.561791, 0.6228876, 1, 0, 0, 1, 1,
-0.4843816, -0.5532691, -2.817006, 1, 0, 0, 1, 1,
-0.4826877, 0.4576255, 0.4730144, 1, 0, 0, 1, 1,
-0.4779875, 2.101042, -0.1766414, 1, 0, 0, 1, 1,
-0.4770391, 0.09095655, -1.767392, 1, 0, 0, 1, 1,
-0.4754289, -0.5030699, -2.62873, 0, 0, 0, 1, 1,
-0.471419, -0.1717761, -2.654832, 0, 0, 0, 1, 1,
-0.4693156, 0.2352625, -1.645978, 0, 0, 0, 1, 1,
-0.4672865, -0.2791059, -2.302851, 0, 0, 0, 1, 1,
-0.4665835, 1.218322, 2.473506, 0, 0, 0, 1, 1,
-0.4625816, -1.360494, -3.551689, 0, 0, 0, 1, 1,
-0.4623234, 0.59342, 0.04869557, 0, 0, 0, 1, 1,
-0.4615297, 0.15694, -1.364042, 1, 1, 1, 1, 1,
-0.4600338, 0.1127544, -0.3698286, 1, 1, 1, 1, 1,
-0.4573928, 0.9459836, -2.471273, 1, 1, 1, 1, 1,
-0.4543041, 0.5625598, -1.47262, 1, 1, 1, 1, 1,
-0.4517405, -1.001543, -2.599738, 1, 1, 1, 1, 1,
-0.4437012, -0.3506928, -2.983823, 1, 1, 1, 1, 1,
-0.4430881, -0.3522481, -2.631824, 1, 1, 1, 1, 1,
-0.4424571, 0.02315423, -2.988235, 1, 1, 1, 1, 1,
-0.4423701, 0.1474847, -1.52338, 1, 1, 1, 1, 1,
-0.4382231, 0.536438, -0.3099302, 1, 1, 1, 1, 1,
-0.4368864, 1.934842, -1.677422, 1, 1, 1, 1, 1,
-0.4364831, 0.4839355, -0.2875661, 1, 1, 1, 1, 1,
-0.4250042, -1.074128, -4.828063, 1, 1, 1, 1, 1,
-0.4177922, 0.7444606, -0.2761337, 1, 1, 1, 1, 1,
-0.4132518, -1.397913, -2.98018, 1, 1, 1, 1, 1,
-0.4114977, 1.107418, -0.6048417, 0, 0, 1, 1, 1,
-0.4059715, 0.1620001, 0.1097251, 1, 0, 0, 1, 1,
-0.4014451, 0.8375924, 0.2447332, 1, 0, 0, 1, 1,
-0.3981378, 1.323548, 0.2592218, 1, 0, 0, 1, 1,
-0.3943306, 0.02131437, -2.757981, 1, 0, 0, 1, 1,
-0.3898228, -1.249845, -3.842227, 1, 0, 0, 1, 1,
-0.3798814, 1.472441, -0.05208626, 0, 0, 0, 1, 1,
-0.3779514, -0.1957147, -1.204876, 0, 0, 0, 1, 1,
-0.3776072, -0.6683426, -3.240625, 0, 0, 0, 1, 1,
-0.3768791, -0.8312999, -2.715367, 0, 0, 0, 1, 1,
-0.3768609, -0.6088307, -2.408204, 0, 0, 0, 1, 1,
-0.3724197, 1.23196, -0.4992958, 0, 0, 0, 1, 1,
-0.3724163, -0.5761505, -2.765144, 0, 0, 0, 1, 1,
-0.3693472, -0.3346925, -1.658736, 1, 1, 1, 1, 1,
-0.3690941, 1.367793, -0.3025335, 1, 1, 1, 1, 1,
-0.3658441, -1.380853, -1.371519, 1, 1, 1, 1, 1,
-0.3610231, 0.06042893, -0.3506867, 1, 1, 1, 1, 1,
-0.3575394, -1.029799, -0.9430698, 1, 1, 1, 1, 1,
-0.3574894, 1.013426, 0.574334, 1, 1, 1, 1, 1,
-0.357432, -0.783058, -3.589181, 1, 1, 1, 1, 1,
-0.3572505, 0.3386707, -0.4163313, 1, 1, 1, 1, 1,
-0.3570783, 0.05466708, -2.162597, 1, 1, 1, 1, 1,
-0.3566373, -1.616493, -3.080939, 1, 1, 1, 1, 1,
-0.3550588, 1.539086, 0.05933045, 1, 1, 1, 1, 1,
-0.3519342, -0.8034621, -2.745701, 1, 1, 1, 1, 1,
-0.3509202, -1.373299, -1.822236, 1, 1, 1, 1, 1,
-0.3490717, 0.02083431, -1.571373, 1, 1, 1, 1, 1,
-0.3474302, 0.7084208, 0.05723929, 1, 1, 1, 1, 1,
-0.3473836, 0.6701998, -0.05873408, 0, 0, 1, 1, 1,
-0.336856, 0.3668055, 0.2096881, 1, 0, 0, 1, 1,
-0.3361279, -1.20083, -4.140893, 1, 0, 0, 1, 1,
-0.335862, -0.3395711, -2.457603, 1, 0, 0, 1, 1,
-0.3355915, 0.1059615, -0.2290009, 1, 0, 0, 1, 1,
-0.3355468, 1.111819, -1.255597, 1, 0, 0, 1, 1,
-0.3328522, 2.136727, 0.9037082, 0, 0, 0, 1, 1,
-0.3326804, 1.602419, 0.3245608, 0, 0, 0, 1, 1,
-0.3299515, 0.03962924, -0.2632173, 0, 0, 0, 1, 1,
-0.3274135, -0.1461816, -0.558444, 0, 0, 0, 1, 1,
-0.3232761, -0.07333041, -2.185019, 0, 0, 0, 1, 1,
-0.3216474, -0.179754, -0.1970028, 0, 0, 0, 1, 1,
-0.315121, 0.2568983, -0.8504978, 0, 0, 0, 1, 1,
-0.314448, -1.397857, -3.224183, 1, 1, 1, 1, 1,
-0.3142568, 1.300984, 1.063592, 1, 1, 1, 1, 1,
-0.3105818, 0.494534, 0.9959587, 1, 1, 1, 1, 1,
-0.309626, -2.45539, -3.142961, 1, 1, 1, 1, 1,
-0.3094638, 1.699677, 1.822186, 1, 1, 1, 1, 1,
-0.3088756, 0.3034386, -2.185503, 1, 1, 1, 1, 1,
-0.3084458, -0.2395263, -1.769509, 1, 1, 1, 1, 1,
-0.3083489, 0.8485401, -1.240033, 1, 1, 1, 1, 1,
-0.308268, -1.251655, -5.032317, 1, 1, 1, 1, 1,
-0.3038814, -2.379757, -3.141205, 1, 1, 1, 1, 1,
-0.3023632, 0.2162869, -1.514922, 1, 1, 1, 1, 1,
-0.2979296, -0.08916256, -1.290853, 1, 1, 1, 1, 1,
-0.2974605, -0.9650033, -2.13103, 1, 1, 1, 1, 1,
-0.2953953, 0.5510408, -0.1685954, 1, 1, 1, 1, 1,
-0.2867198, 1.470523, -2.506553, 1, 1, 1, 1, 1,
-0.2827012, 1.660508, -0.3240845, 0, 0, 1, 1, 1,
-0.2801841, -1.534569, -5.569434, 1, 0, 0, 1, 1,
-0.2801521, -1.270051, -2.992407, 1, 0, 0, 1, 1,
-0.2782166, 1.35621, -0.005753083, 1, 0, 0, 1, 1,
-0.2723485, 0.6610916, 1.701944, 1, 0, 0, 1, 1,
-0.2720677, -0.6779986, -2.62149, 1, 0, 0, 1, 1,
-0.2707418, 1.105243, -0.05989851, 0, 0, 0, 1, 1,
-0.2695158, 0.3418053, -0.8347253, 0, 0, 0, 1, 1,
-0.2651086, -0.8616741, -4.109005, 0, 0, 0, 1, 1,
-0.2640188, -1.295057, -2.299821, 0, 0, 0, 1, 1,
-0.2638851, 1.129738, 0.9441603, 0, 0, 0, 1, 1,
-0.2611976, -1.478233, -1.771455, 0, 0, 0, 1, 1,
-0.2556367, -1.384823, -2.833802, 0, 0, 0, 1, 1,
-0.254679, -0.8445055, -2.323474, 1, 1, 1, 1, 1,
-0.2525715, 1.233714, 0.8643402, 1, 1, 1, 1, 1,
-0.2490318, 0.5360938, -0.3087143, 1, 1, 1, 1, 1,
-0.2475993, 1.767784, -0.4297147, 1, 1, 1, 1, 1,
-0.2457519, -0.371866, -2.893246, 1, 1, 1, 1, 1,
-0.2417254, -0.6004744, -0.8122756, 1, 1, 1, 1, 1,
-0.240884, -0.5309195, -3.335711, 1, 1, 1, 1, 1,
-0.2376462, -0.3806022, -2.313117, 1, 1, 1, 1, 1,
-0.2339344, 0.231402, -1.775509, 1, 1, 1, 1, 1,
-0.2279399, 0.5521242, -0.7124187, 1, 1, 1, 1, 1,
-0.2251921, 0.3758982, 0.5467821, 1, 1, 1, 1, 1,
-0.2241367, -0.9546229, -3.024723, 1, 1, 1, 1, 1,
-0.2217965, 0.4428203, 0.492835, 1, 1, 1, 1, 1,
-0.2143084, 0.5132064, -0.2660948, 1, 1, 1, 1, 1,
-0.2094608, 1.123981, -0.3885053, 1, 1, 1, 1, 1,
-0.2075189, -0.3636087, -5.849462, 0, 0, 1, 1, 1,
-0.2019499, -0.3259545, -2.86404, 1, 0, 0, 1, 1,
-0.2010808, -0.4139157, -1.834779, 1, 0, 0, 1, 1,
-0.1976164, -1.171611, -3.983438, 1, 0, 0, 1, 1,
-0.1951696, -1.173798, -2.157186, 1, 0, 0, 1, 1,
-0.1948357, 0.548608, 0.2433496, 1, 0, 0, 1, 1,
-0.1931076, 0.03847784, -2.893973, 0, 0, 0, 1, 1,
-0.1900951, -2.22704, -3.229966, 0, 0, 0, 1, 1,
-0.1886459, -2.043432, -4.338789, 0, 0, 0, 1, 1,
-0.1878344, -1.189184, -4.286044, 0, 0, 0, 1, 1,
-0.1872637, -0.1130788, -0.1462721, 0, 0, 0, 1, 1,
-0.1862187, -0.01582554, -3.498968, 0, 0, 0, 1, 1,
-0.1852954, -1.266593, -2.60572, 0, 0, 0, 1, 1,
-0.1846864, 0.9197492, -0.06878333, 1, 1, 1, 1, 1,
-0.1835759, 0.705018, -0.8165081, 1, 1, 1, 1, 1,
-0.1827321, 0.6072414, -0.6489331, 1, 1, 1, 1, 1,
-0.1825224, 0.6581898, -0.03204698, 1, 1, 1, 1, 1,
-0.1823543, 0.3736762, -0.2767608, 1, 1, 1, 1, 1,
-0.1808142, 0.8288897, -0.34787, 1, 1, 1, 1, 1,
-0.1735958, 1.131815, -0.1796257, 1, 1, 1, 1, 1,
-0.173557, 1.028286, -0.3769135, 1, 1, 1, 1, 1,
-0.1724738, -0.505693, -1.944269, 1, 1, 1, 1, 1,
-0.1724576, 1.096748, 0.2468229, 1, 1, 1, 1, 1,
-0.1702642, 0.2042764, -2.057754, 1, 1, 1, 1, 1,
-0.1662107, 0.6313906, -3.132789, 1, 1, 1, 1, 1,
-0.1646804, -1.369776, -3.65509, 1, 1, 1, 1, 1,
-0.1626899, 0.521362, 0.7455308, 1, 1, 1, 1, 1,
-0.1611672, 1.156423, 0.6032837, 1, 1, 1, 1, 1,
-0.1576457, -0.6287366, -2.977331, 0, 0, 1, 1, 1,
-0.1566061, -0.5030806, -1.794409, 1, 0, 0, 1, 1,
-0.1547035, -1.576171, -3.066158, 1, 0, 0, 1, 1,
-0.1504594, 1.978338, 0.6228943, 1, 0, 0, 1, 1,
-0.1484639, 1.274566, 0.2598851, 1, 0, 0, 1, 1,
-0.1481598, 1.147655, -0.7925828, 1, 0, 0, 1, 1,
-0.1458842, 0.8912267, 1.286819, 0, 0, 0, 1, 1,
-0.145284, 0.1174559, -2.537838, 0, 0, 0, 1, 1,
-0.1445136, 0.2240758, 0.3618594, 0, 0, 0, 1, 1,
-0.1393862, 0.7447221, -1.709527, 0, 0, 0, 1, 1,
-0.1379966, 0.462421, 0.1081341, 0, 0, 0, 1, 1,
-0.1334325, -0.5789676, -2.236124, 0, 0, 0, 1, 1,
-0.1328225, -1.191282, -2.567497, 0, 0, 0, 1, 1,
-0.1287974, 1.47643, 0.3531926, 1, 1, 1, 1, 1,
-0.1271275, -1.209753, -1.895505, 1, 1, 1, 1, 1,
-0.1268951, -1.81764, -2.349783, 1, 1, 1, 1, 1,
-0.1254018, 0.4017858, -1.349651, 1, 1, 1, 1, 1,
-0.1246728, -0.3848954, -2.880682, 1, 1, 1, 1, 1,
-0.1234654, 1.384613, 0.05993582, 1, 1, 1, 1, 1,
-0.1192288, 1.311862, -0.8765956, 1, 1, 1, 1, 1,
-0.1151787, -0.9980242, -1.776286, 1, 1, 1, 1, 1,
-0.1109366, 0.6696354, -1.398437, 1, 1, 1, 1, 1,
-0.1094334, 0.2820944, -0.3244737, 1, 1, 1, 1, 1,
-0.1074233, -0.1246099, -4.444493, 1, 1, 1, 1, 1,
-0.1048115, 0.7459108, 2.489724, 1, 1, 1, 1, 1,
-0.09833552, 1.765243, 0.4140383, 1, 1, 1, 1, 1,
-0.09652568, 0.3457827, -0.7370178, 1, 1, 1, 1, 1,
-0.09539403, -1.569733, -3.651929, 1, 1, 1, 1, 1,
-0.09494848, -0.23758, -3.071478, 0, 0, 1, 1, 1,
-0.09170998, 0.6439328, -0.03956219, 1, 0, 0, 1, 1,
-0.09004691, -1.258069, -3.449832, 1, 0, 0, 1, 1,
-0.08047372, 0.5419925, -3.407632, 1, 0, 0, 1, 1,
-0.07841678, -1.440046, -2.725165, 1, 0, 0, 1, 1,
-0.07607634, -0.3552214, -3.600098, 1, 0, 0, 1, 1,
-0.07006282, 0.7691783, 1.709918, 0, 0, 0, 1, 1,
-0.06258033, 0.05017082, 0.3868564, 0, 0, 0, 1, 1,
-0.05833478, 0.5969805, -0.4545696, 0, 0, 0, 1, 1,
-0.05826068, -0.586655, -0.6036813, 0, 0, 0, 1, 1,
-0.05330596, 1.621451, -0.03006122, 0, 0, 0, 1, 1,
-0.05292904, -1.563438, -3.067524, 0, 0, 0, 1, 1,
-0.04575793, -0.9859765, -4.011765, 0, 0, 0, 1, 1,
-0.04509542, -0.7388522, -2.698301, 1, 1, 1, 1, 1,
-0.04434391, 2.638341, 2.106863, 1, 1, 1, 1, 1,
-0.03683494, -0.7498172, -3.977658, 1, 1, 1, 1, 1,
-0.03462826, -0.324449, -2.569172, 1, 1, 1, 1, 1,
-0.03445704, -0.0159644, -1.843246, 1, 1, 1, 1, 1,
-0.03236414, 0.1521259, 2.16703, 1, 1, 1, 1, 1,
-0.03028185, -0.2748843, -2.871804, 1, 1, 1, 1, 1,
-0.02913873, 1.171506, 0.7882846, 1, 1, 1, 1, 1,
-0.02330846, 0.5648238, 0.2594747, 1, 1, 1, 1, 1,
-0.02318673, -1.819989, -3.663865, 1, 1, 1, 1, 1,
-0.02287323, -1.021974, -2.679206, 1, 1, 1, 1, 1,
-0.021999, 0.3798914, 0.2319883, 1, 1, 1, 1, 1,
-0.01961244, 0.3963867, -1.08637, 1, 1, 1, 1, 1,
-0.01872727, -0.5378786, -4.046154, 1, 1, 1, 1, 1,
-0.0111835, 0.04903544, -0.8203682, 1, 1, 1, 1, 1,
-0.008651463, -0.1657956, -3.440665, 0, 0, 1, 1, 1,
-0.001505217, 1.798352, -0.1489757, 1, 0, 0, 1, 1,
-0.001132849, -0.7273934, -3.442985, 1, 0, 0, 1, 1,
0.0005701292, -1.43999, 3.137236, 1, 0, 0, 1, 1,
0.006553662, -0.2127519, 3.276302, 1, 0, 0, 1, 1,
0.01134667, -0.9530935, 3.635047, 1, 0, 0, 1, 1,
0.01144509, 0.4233285, 1.137027, 0, 0, 0, 1, 1,
0.01428132, 0.3843749, 0.426476, 0, 0, 0, 1, 1,
0.01675034, 2.046326, 0.5672827, 0, 0, 0, 1, 1,
0.01736167, -0.163843, 3.234832, 0, 0, 0, 1, 1,
0.01801423, 1.106824, -0.7557647, 0, 0, 0, 1, 1,
0.03317635, 0.9002813, -2.395113, 0, 0, 0, 1, 1,
0.03383501, -1.581985, 2.691259, 0, 0, 0, 1, 1,
0.03520464, 0.1246221, -0.6974081, 1, 1, 1, 1, 1,
0.03529237, -0.6175482, 3.245909, 1, 1, 1, 1, 1,
0.04162067, -0.04369003, 1.593678, 1, 1, 1, 1, 1,
0.04499652, 0.9704516, -0.6383693, 1, 1, 1, 1, 1,
0.04775899, -0.3056506, 2.517435, 1, 1, 1, 1, 1,
0.04947363, -1.09978, 5.28622, 1, 1, 1, 1, 1,
0.05197312, -0.5198683, 2.245533, 1, 1, 1, 1, 1,
0.05288872, -1.493276, 1.209552, 1, 1, 1, 1, 1,
0.05353997, 1.336086, -1.024278, 1, 1, 1, 1, 1,
0.05500585, -0.5161068, 2.202158, 1, 1, 1, 1, 1,
0.05542016, 1.221903, 0.007609467, 1, 1, 1, 1, 1,
0.05623257, 1.204961, -1.119297, 1, 1, 1, 1, 1,
0.06089967, -0.4714102, 3.855643, 1, 1, 1, 1, 1,
0.06209599, -0.162694, 2.547163, 1, 1, 1, 1, 1,
0.06288386, 0.7080885, -0.4919205, 1, 1, 1, 1, 1,
0.06289288, 1.164363, -1.323318, 0, 0, 1, 1, 1,
0.06417416, -1.109988, 1.870462, 1, 0, 0, 1, 1,
0.06734842, 0.09485383, 1.615911, 1, 0, 0, 1, 1,
0.06743721, 2.081396, -1.573347, 1, 0, 0, 1, 1,
0.06827198, -0.2269788, 3.307917, 1, 0, 0, 1, 1,
0.07191785, -0.9762816, 4.053223, 1, 0, 0, 1, 1,
0.07991324, -0.03034861, 1.605841, 0, 0, 0, 1, 1,
0.08630751, 1.101106, 0.7757737, 0, 0, 0, 1, 1,
0.09553251, 0.988238, -2.402928, 0, 0, 0, 1, 1,
0.09666158, 1.272348, 0.6824487, 0, 0, 0, 1, 1,
0.0984745, 1.916241, 2.381521, 0, 0, 0, 1, 1,
0.09917456, 1.627488, -0.93937, 0, 0, 0, 1, 1,
0.1044295, 0.8274304, -1.354028, 0, 0, 0, 1, 1,
0.116356, -2.442477, 4.583356, 1, 1, 1, 1, 1,
0.1170739, -0.4688334, 2.916179, 1, 1, 1, 1, 1,
0.1175449, -1.675592, 1.755546, 1, 1, 1, 1, 1,
0.118824, 0.299096, 0.10617, 1, 1, 1, 1, 1,
0.12091, -1.343185, 2.397957, 1, 1, 1, 1, 1,
0.1221587, -1.278088, 2.984736, 1, 1, 1, 1, 1,
0.1249348, 0.5827332, 0.4658511, 1, 1, 1, 1, 1,
0.1263008, -1.114238, 2.246263, 1, 1, 1, 1, 1,
0.1286071, -0.5833771, 3.304909, 1, 1, 1, 1, 1,
0.130855, -0.7604504, 3.301633, 1, 1, 1, 1, 1,
0.130885, 1.169082, 0.3974957, 1, 1, 1, 1, 1,
0.1314684, 0.7660027, -1.142679, 1, 1, 1, 1, 1,
0.1316896, -0.860751, 3.14102, 1, 1, 1, 1, 1,
0.1334995, 0.2612157, -0.3893453, 1, 1, 1, 1, 1,
0.135445, 0.8075813, -0.04206555, 1, 1, 1, 1, 1,
0.1376066, 0.6066494, 1.11032, 0, 0, 1, 1, 1,
0.1449594, -1.37436, 3.521414, 1, 0, 0, 1, 1,
0.1461759, 1.15748, 0.9139217, 1, 0, 0, 1, 1,
0.1469506, -0.3017822, 3.682986, 1, 0, 0, 1, 1,
0.147788, -0.3023781, 2.475788, 1, 0, 0, 1, 1,
0.1492728, -0.7525239, 0.6396395, 1, 0, 0, 1, 1,
0.1494372, -1.053316, 2.87319, 0, 0, 0, 1, 1,
0.1525381, 1.299454, -2.244308, 0, 0, 0, 1, 1,
0.155898, -0.08334863, 0.9427083, 0, 0, 0, 1, 1,
0.1570445, -0.7968405, 4.337112, 0, 0, 0, 1, 1,
0.1576791, -1.138714, 1.344906, 0, 0, 0, 1, 1,
0.1594998, 0.8246283, 0.5651007, 0, 0, 0, 1, 1,
0.1629002, -1.477883, 2.977353, 0, 0, 0, 1, 1,
0.1676612, 0.7865211, -0.5126451, 1, 1, 1, 1, 1,
0.1726461, -1.524413, 2.849499, 1, 1, 1, 1, 1,
0.1753383, -1.043896, 2.308563, 1, 1, 1, 1, 1,
0.176795, -0.1596822, 2.021765, 1, 1, 1, 1, 1,
0.1768834, 0.08850018, 1.848043, 1, 1, 1, 1, 1,
0.1770385, 1.059281, 0.8843947, 1, 1, 1, 1, 1,
0.1779452, -0.1008025, 2.764093, 1, 1, 1, 1, 1,
0.1855594, -2.282919, 3.454331, 1, 1, 1, 1, 1,
0.1865413, -0.3760178, 3.236342, 1, 1, 1, 1, 1,
0.1890245, -0.07053936, 1.883402, 1, 1, 1, 1, 1,
0.1974749, 0.122999, 0.1277907, 1, 1, 1, 1, 1,
0.1999976, -0.6852356, 3.812433, 1, 1, 1, 1, 1,
0.2017396, 2.558379, -0.1313913, 1, 1, 1, 1, 1,
0.2023138, 0.9949026, 0.2200588, 1, 1, 1, 1, 1,
0.2051034, 0.2022014, -0.05127466, 1, 1, 1, 1, 1,
0.2052742, -0.584846, 2.301717, 0, 0, 1, 1, 1,
0.2105266, 0.2835882, -0.9188316, 1, 0, 0, 1, 1,
0.2183715, -0.03488106, 3.465765, 1, 0, 0, 1, 1,
0.222399, 0.6403087, 1.688368, 1, 0, 0, 1, 1,
0.224116, 0.7849485, 0.6804541, 1, 0, 0, 1, 1,
0.2309624, 0.5004259, -0.8291742, 1, 0, 0, 1, 1,
0.2319579, 0.6608384, 1.370851, 0, 0, 0, 1, 1,
0.2344259, -1.573981, 2.767657, 0, 0, 0, 1, 1,
0.2462551, 0.947037, -0.5186917, 0, 0, 0, 1, 1,
0.2476702, 0.1231178, -0.7740673, 0, 0, 0, 1, 1,
0.2490417, 1.407891, 0.04652624, 0, 0, 0, 1, 1,
0.2495248, 1.286434, -1.128517, 0, 0, 0, 1, 1,
0.2511346, 0.551944, 0.7544417, 0, 0, 0, 1, 1,
0.2538707, 1.070016, 0.346832, 1, 1, 1, 1, 1,
0.2550229, 0.9451179, -0.7226914, 1, 1, 1, 1, 1,
0.261703, -1.335511, 4.810993, 1, 1, 1, 1, 1,
0.2620349, 0.9195227, 1.007241, 1, 1, 1, 1, 1,
0.2637863, 0.04125211, 0.8871798, 1, 1, 1, 1, 1,
0.269349, 0.2921228, 1.260616, 1, 1, 1, 1, 1,
0.2728768, -1.102938, 5.133265, 1, 1, 1, 1, 1,
0.2825018, -0.7414595, 2.52602, 1, 1, 1, 1, 1,
0.284341, -1.301448, 2.800557, 1, 1, 1, 1, 1,
0.2850014, -0.1207564, 2.136498, 1, 1, 1, 1, 1,
0.2866017, 0.1891419, 2.712388, 1, 1, 1, 1, 1,
0.2921204, -0.3762321, 2.436606, 1, 1, 1, 1, 1,
0.2927334, -0.2719837, 1.153709, 1, 1, 1, 1, 1,
0.2929671, 0.8114008, 0.07080696, 1, 1, 1, 1, 1,
0.2958419, -1.155956, 3.24303, 1, 1, 1, 1, 1,
0.2982144, -1.317839, 4.294897, 0, 0, 1, 1, 1,
0.3006064, -2.14696, 3.546198, 1, 0, 0, 1, 1,
0.3032172, -0.9606764, 2.901693, 1, 0, 0, 1, 1,
0.3052608, 0.7420099, -1.112641, 1, 0, 0, 1, 1,
0.3109538, 0.6967341, -0.4145704, 1, 0, 0, 1, 1,
0.317578, -0.4903056, 2.208606, 1, 0, 0, 1, 1,
0.3219726, -0.4637595, 3.655378, 0, 0, 0, 1, 1,
0.3320448, -0.1588347, 1.629669, 0, 0, 0, 1, 1,
0.3343979, -0.5660216, 1.039723, 0, 0, 0, 1, 1,
0.3374373, -0.3859841, 3.188744, 0, 0, 0, 1, 1,
0.3399257, -0.1350823, 1.05665, 0, 0, 0, 1, 1,
0.3469284, -0.1488074, 0.9637452, 0, 0, 0, 1, 1,
0.3519674, 1.456511, 0.2155772, 0, 0, 0, 1, 1,
0.3522388, -0.1543912, 0.3022399, 1, 1, 1, 1, 1,
0.3550153, 0.7794721, 0.3015552, 1, 1, 1, 1, 1,
0.3584093, 1.116754, 0.8937848, 1, 1, 1, 1, 1,
0.3589415, -1.600905, 4.231184, 1, 1, 1, 1, 1,
0.3596989, 2.071403, -0.3159525, 1, 1, 1, 1, 1,
0.3649935, 0.8456098, -0.8215076, 1, 1, 1, 1, 1,
0.365097, 0.3549676, 0.3169438, 1, 1, 1, 1, 1,
0.3673437, -0.4603467, 1.944649, 1, 1, 1, 1, 1,
0.3770001, -1.82866, 4.517883, 1, 1, 1, 1, 1,
0.3788218, 0.9233919, -0.7953514, 1, 1, 1, 1, 1,
0.3862662, 0.7482852, -0.005848255, 1, 1, 1, 1, 1,
0.3918268, 1.523313, -1.169325, 1, 1, 1, 1, 1,
0.3955576, -0.4489509, 0.3565609, 1, 1, 1, 1, 1,
0.396404, 0.6904023, 0.9210038, 1, 1, 1, 1, 1,
0.4005742, -0.9495878, 4.539278, 1, 1, 1, 1, 1,
0.4031592, 0.5576727, 0.7677621, 0, 0, 1, 1, 1,
0.4043298, -0.2293097, 0.5445446, 1, 0, 0, 1, 1,
0.4047472, 0.5047796, 2.395977, 1, 0, 0, 1, 1,
0.404912, -1.306935, 1.511552, 1, 0, 0, 1, 1,
0.4091876, -0.2927061, 0.4882466, 1, 0, 0, 1, 1,
0.4108814, -1.900902, 3.018476, 1, 0, 0, 1, 1,
0.4117676, 1.294804, -1.458809, 0, 0, 0, 1, 1,
0.4133204, 0.5842638, -1.153961, 0, 0, 0, 1, 1,
0.4143137, 0.9279925, 0.7843745, 0, 0, 0, 1, 1,
0.4143916, 0.6998153, -0.1481377, 0, 0, 0, 1, 1,
0.4166717, 0.1193765, 0.100959, 0, 0, 0, 1, 1,
0.4171813, -0.1894468, 0.0641655, 0, 0, 0, 1, 1,
0.4251292, -0.5584394, 3.327191, 0, 0, 0, 1, 1,
0.4413897, -0.06997681, -1.369441, 1, 1, 1, 1, 1,
0.4438421, 1.185694, 1.559522, 1, 1, 1, 1, 1,
0.4471732, 0.04983269, 1.833724, 1, 1, 1, 1, 1,
0.4472042, -0.8376306, 1.6618, 1, 1, 1, 1, 1,
0.4496724, 1.315505, 0.6302758, 1, 1, 1, 1, 1,
0.4501277, -0.5967155, 4.073971, 1, 1, 1, 1, 1,
0.4573314, -1.036809, 1.302492, 1, 1, 1, 1, 1,
0.462164, 1.869009, 2.294848, 1, 1, 1, 1, 1,
0.4635261, 0.7981501, -0.2733852, 1, 1, 1, 1, 1,
0.4664133, -0.5071863, 2.622652, 1, 1, 1, 1, 1,
0.4709626, 0.6174923, 1.73747, 1, 1, 1, 1, 1,
0.4741684, 0.528354, 1.23082, 1, 1, 1, 1, 1,
0.4778861, 0.4797238, 1.946607, 1, 1, 1, 1, 1,
0.4815513, -0.5544502, 1.513387, 1, 1, 1, 1, 1,
0.4817283, 1.290546, -0.755832, 1, 1, 1, 1, 1,
0.4844098, 0.9416016, 1.04849, 0, 0, 1, 1, 1,
0.4935277, -0.01572086, 0.2291901, 1, 0, 0, 1, 1,
0.4940113, -0.5332328, 2.837751, 1, 0, 0, 1, 1,
0.4964105, -0.006145402, 1.325179, 1, 0, 0, 1, 1,
0.4976133, -2.289799, 5.036162, 1, 0, 0, 1, 1,
0.5073379, -0.4375955, 2.842267, 1, 0, 0, 1, 1,
0.5083515, 0.8460144, 0.2932314, 0, 0, 0, 1, 1,
0.5124729, 1.560523, 0.9472998, 0, 0, 0, 1, 1,
0.5136924, 1.243276, -0.7880708, 0, 0, 0, 1, 1,
0.5150674, -0.3331007, 3.749195, 0, 0, 0, 1, 1,
0.5163243, -0.2776125, 1.108799, 0, 0, 0, 1, 1,
0.5214251, 1.081863, 1.835378, 0, 0, 0, 1, 1,
0.523669, 0.4912417, 1.468005, 0, 0, 0, 1, 1,
0.5252591, -0.2685443, 1.320769, 1, 1, 1, 1, 1,
0.5277717, -0.8281192, 1.559091, 1, 1, 1, 1, 1,
0.5282118, 1.342863, 1.310427, 1, 1, 1, 1, 1,
0.5302219, -2.099614, 2.874023, 1, 1, 1, 1, 1,
0.5342717, -0.3734317, 2.149966, 1, 1, 1, 1, 1,
0.541844, -1.878174, 2.60473, 1, 1, 1, 1, 1,
0.5426867, -1.419977, 2.880956, 1, 1, 1, 1, 1,
0.543544, -0.3836353, 2.306207, 1, 1, 1, 1, 1,
0.5511525, -0.8767842, 2.589523, 1, 1, 1, 1, 1,
0.5667641, -0.8125802, 0.6758085, 1, 1, 1, 1, 1,
0.5675408, 0.01081661, 1.306803, 1, 1, 1, 1, 1,
0.5677181, 0.04961495, 2.025052, 1, 1, 1, 1, 1,
0.5709394, -0.05498337, 0.07805709, 1, 1, 1, 1, 1,
0.5727237, 0.3523484, 0.6237649, 1, 1, 1, 1, 1,
0.5741565, -0.3708635, 0.993921, 1, 1, 1, 1, 1,
0.5753626, 0.7640394, 0.9903489, 0, 0, 1, 1, 1,
0.5778924, -0.131568, 2.318779, 1, 0, 0, 1, 1,
0.5786112, 0.8800511, 1.44751, 1, 0, 0, 1, 1,
0.5798044, 0.3431009, 2.433808, 1, 0, 0, 1, 1,
0.5815241, -1.223051, 1.578732, 1, 0, 0, 1, 1,
0.5868, -0.3989419, 2.058725, 1, 0, 0, 1, 1,
0.5877512, -0.6837977, 1.112275, 0, 0, 0, 1, 1,
0.5883309, 1.091771, -0.3964283, 0, 0, 0, 1, 1,
0.5910727, 0.6920437, 2.629488, 0, 0, 0, 1, 1,
0.5940059, -0.7752332, 2.661711, 0, 0, 0, 1, 1,
0.5986959, -2.245566, 3.579023, 0, 0, 0, 1, 1,
0.5995131, -1.989762, 3.331988, 0, 0, 0, 1, 1,
0.6091354, 0.2112602, 0.3628275, 0, 0, 0, 1, 1,
0.6093073, -1.084979, 2.205259, 1, 1, 1, 1, 1,
0.6099804, -2.369871, 3.859798, 1, 1, 1, 1, 1,
0.6135661, -1.771834, 2.300497, 1, 1, 1, 1, 1,
0.6140216, 0.2863949, 1.704691, 1, 1, 1, 1, 1,
0.6261086, 0.7241318, 0.9274499, 1, 1, 1, 1, 1,
0.6282451, -0.01071787, 0.5530273, 1, 1, 1, 1, 1,
0.6370114, -0.1306442, 1.740147, 1, 1, 1, 1, 1,
0.6425903, 0.5421274, 1.952031, 1, 1, 1, 1, 1,
0.6444639, -1.827108, 1.60539, 1, 1, 1, 1, 1,
0.6449723, 0.6810531, 1.667087, 1, 1, 1, 1, 1,
0.646001, 0.9366857, -0.3130213, 1, 1, 1, 1, 1,
0.647596, 1.032519, 1.107561, 1, 1, 1, 1, 1,
0.6477642, 1.269231, -0.3918708, 1, 1, 1, 1, 1,
0.6479752, 0.3250118, 1.672893, 1, 1, 1, 1, 1,
0.6508496, 1.408262, 1.873321, 1, 1, 1, 1, 1,
0.6624969, -1.350949, 2.553816, 0, 0, 1, 1, 1,
0.6637375, 0.4457408, 0.2488972, 1, 0, 0, 1, 1,
0.6642295, -0.880353, 3.12186, 1, 0, 0, 1, 1,
0.6715429, 0.2232042, 0.7680972, 1, 0, 0, 1, 1,
0.6727636, -0.410202, 1.24309, 1, 0, 0, 1, 1,
0.6772067, 0.0232675, 2.161822, 1, 0, 0, 1, 1,
0.6781722, 0.1602627, 2.401327, 0, 0, 0, 1, 1,
0.6810006, 0.8650445, -0.3778816, 0, 0, 0, 1, 1,
0.6825156, -0.2968458, 2.576559, 0, 0, 0, 1, 1,
0.6967161, 0.771826, -0.4094792, 0, 0, 0, 1, 1,
0.6984308, 0.2557518, 2.740851, 0, 0, 0, 1, 1,
0.7008986, -0.07564282, 1.175835, 0, 0, 0, 1, 1,
0.705068, -1.140305, 2.73673, 0, 0, 0, 1, 1,
0.716383, 0.5691999, 0.188996, 1, 1, 1, 1, 1,
0.7202464, -1.234911, 2.714134, 1, 1, 1, 1, 1,
0.7233138, -0.8514268, 3.790052, 1, 1, 1, 1, 1,
0.7236741, 1.354089, -1.658496, 1, 1, 1, 1, 1,
0.7313434, 2.308713, -0.2635238, 1, 1, 1, 1, 1,
0.7383093, -1.413761, 4.131717, 1, 1, 1, 1, 1,
0.7384312, 1.436426, 1.348792, 1, 1, 1, 1, 1,
0.740833, -0.08576522, 2.833757, 1, 1, 1, 1, 1,
0.7452267, 1.187532, 0.1750586, 1, 1, 1, 1, 1,
0.7469501, 0.01400865, 2.474433, 1, 1, 1, 1, 1,
0.7492679, -0.5244253, 2.899451, 1, 1, 1, 1, 1,
0.7520081, 0.236529, 0.4905673, 1, 1, 1, 1, 1,
0.7566506, -0.4682455, 1.135264, 1, 1, 1, 1, 1,
0.7595475, -0.6023234, 2.141526, 1, 1, 1, 1, 1,
0.7597601, 0.5479636, 2.507099, 1, 1, 1, 1, 1,
0.7619904, -0.6998475, 2.407187, 0, 0, 1, 1, 1,
0.7641507, -0.7426832, 0.3247747, 1, 0, 0, 1, 1,
0.7643138, 1.190909, 1.667466, 1, 0, 0, 1, 1,
0.7645307, 0.7298021, -0.1293824, 1, 0, 0, 1, 1,
0.7690125, 0.6117393, 1.424498, 1, 0, 0, 1, 1,
0.7690198, -0.5473039, 2.360408, 1, 0, 0, 1, 1,
0.772132, 2.186539, -0.2460537, 0, 0, 0, 1, 1,
0.7736974, 0.9209759, 2.420422, 0, 0, 0, 1, 1,
0.7840664, 1.729229, -1.027232, 0, 0, 0, 1, 1,
0.7859292, -0.1128407, 2.062407, 0, 0, 0, 1, 1,
0.7932532, -0.5647384, 2.740034, 0, 0, 0, 1, 1,
0.798656, 1.311828, 0.8906928, 0, 0, 0, 1, 1,
0.7988983, -0.1746972, 1.733425, 0, 0, 0, 1, 1,
0.8008779, -1.40761, 2.578506, 1, 1, 1, 1, 1,
0.802018, 0.3212683, 1.358681, 1, 1, 1, 1, 1,
0.8021307, 0.7874392, 0.2831008, 1, 1, 1, 1, 1,
0.8034839, 0.7974929, 1.353558, 1, 1, 1, 1, 1,
0.8053516, -0.9544048, 4.451939, 1, 1, 1, 1, 1,
0.8137619, -0.2059866, 2.656635, 1, 1, 1, 1, 1,
0.8151135, -1.536029, 4.219435, 1, 1, 1, 1, 1,
0.8202128, 0.724481, 0.889437, 1, 1, 1, 1, 1,
0.8260475, -1.303211, 3.966939, 1, 1, 1, 1, 1,
0.8288599, -1.393096, 4.523505, 1, 1, 1, 1, 1,
0.8340663, -2.440356, 3.988444, 1, 1, 1, 1, 1,
0.8359283, -0.5672822, 2.317533, 1, 1, 1, 1, 1,
0.8503145, -0.9025818, 3.714322, 1, 1, 1, 1, 1,
0.8559158, 0.633568, 2.829563, 1, 1, 1, 1, 1,
0.8586901, -0.1170414, 3.117816, 1, 1, 1, 1, 1,
0.8711725, -0.005984253, 1.345874, 0, 0, 1, 1, 1,
0.8785086, 0.3271642, 1.663968, 1, 0, 0, 1, 1,
0.8874876, -0.4704046, 0.6409667, 1, 0, 0, 1, 1,
0.8903112, 0.8812487, 1.33703, 1, 0, 0, 1, 1,
0.8910328, 2.332861, 0.5557222, 1, 0, 0, 1, 1,
0.8950278, 0.6182483, -0.4942911, 1, 0, 0, 1, 1,
0.8993667, -0.1157227, 1.410521, 0, 0, 0, 1, 1,
0.9013677, 0.9643912, 0.5909042, 0, 0, 0, 1, 1,
0.90304, -1.791536, 4.588606, 0, 0, 0, 1, 1,
0.9168873, -1.712639, 0.8449971, 0, 0, 0, 1, 1,
0.920718, 0.7404962, 2.082264, 0, 0, 0, 1, 1,
0.9218569, 0.15225, 1.078785, 0, 0, 0, 1, 1,
0.9339535, 0.5976483, 1.293774, 0, 0, 0, 1, 1,
0.9350796, -0.1443477, 3.068338, 1, 1, 1, 1, 1,
0.9353302, -0.6690724, 1.138354, 1, 1, 1, 1, 1,
0.9381512, 0.464349, 1.112945, 1, 1, 1, 1, 1,
0.9398148, 0.6650894, 3.913489, 1, 1, 1, 1, 1,
0.9430504, -0.08248977, 1.941708, 1, 1, 1, 1, 1,
0.9704434, -1.437577, 2.291299, 1, 1, 1, 1, 1,
0.9721244, 0.6782622, 0.4591689, 1, 1, 1, 1, 1,
0.9732684, -0.8026972, 3.809601, 1, 1, 1, 1, 1,
0.9739837, -1.54366, 1.898773, 1, 1, 1, 1, 1,
0.9822863, -0.1018004, 1.623206, 1, 1, 1, 1, 1,
0.9845605, 0.4105848, -0.3142776, 1, 1, 1, 1, 1,
0.9998459, 1.149709, 0.6323116, 1, 1, 1, 1, 1,
1.001742, 1.657122, -0.5286293, 1, 1, 1, 1, 1,
1.003905, -1.172236, 3.400016, 1, 1, 1, 1, 1,
1.004376, 1.719752, -0.986573, 1, 1, 1, 1, 1,
1.013013, 1.675716, 1.764425, 0, 0, 1, 1, 1,
1.013518, 0.6926072, 0.2703903, 1, 0, 0, 1, 1,
1.01388, -0.051257, 1.492292, 1, 0, 0, 1, 1,
1.020232, -0.79978, 1.589176, 1, 0, 0, 1, 1,
1.024166, -0.1641697, 1.413773, 1, 0, 0, 1, 1,
1.025437, -1.017366, 2.862936, 1, 0, 0, 1, 1,
1.029185, 0.4468861, 1.894199, 0, 0, 0, 1, 1,
1.031983, -0.2598228, 1.977519, 0, 0, 0, 1, 1,
1.035853, -0.6785496, 1.604696, 0, 0, 0, 1, 1,
1.035876, -0.05468868, 1.391658, 0, 0, 0, 1, 1,
1.036099, 0.890815, 2.059911, 0, 0, 0, 1, 1,
1.03824, 0.5489276, 0.7762811, 0, 0, 0, 1, 1,
1.038464, -0.5352107, 1.16618, 0, 0, 0, 1, 1,
1.041222, -0.6712176, 1.263507, 1, 1, 1, 1, 1,
1.052328, 0.8030275, 1.386674, 1, 1, 1, 1, 1,
1.055577, 0.7246279, 1.582768, 1, 1, 1, 1, 1,
1.059886, -1.302009, 4.066877, 1, 1, 1, 1, 1,
1.06176, 1.021199, 1.712777, 1, 1, 1, 1, 1,
1.064145, -0.1062674, 2.714552, 1, 1, 1, 1, 1,
1.07369, 0.2110784, 1.442763, 1, 1, 1, 1, 1,
1.07563, -0.1110171, 2.229634, 1, 1, 1, 1, 1,
1.0896, 0.008906153, 1.266479, 1, 1, 1, 1, 1,
1.096589, 0.1546224, 1.190319, 1, 1, 1, 1, 1,
1.0981, -1.188066, 1.175092, 1, 1, 1, 1, 1,
1.109036, 0.9648815, 1.707485, 1, 1, 1, 1, 1,
1.111651, 0.6158641, 1.714567, 1, 1, 1, 1, 1,
1.11286, -1.80774, 2.642317, 1, 1, 1, 1, 1,
1.114033, -0.2016649, 1.682803, 1, 1, 1, 1, 1,
1.114046, -0.34143, 1.123484, 0, 0, 1, 1, 1,
1.115361, -0.1849168, 0.4279186, 1, 0, 0, 1, 1,
1.115706, -0.9610292, 2.877801, 1, 0, 0, 1, 1,
1.123444, 1.850192, -0.911681, 1, 0, 0, 1, 1,
1.126047, -0.1282749, 2.197951, 1, 0, 0, 1, 1,
1.14017, -0.2257142, 0.7168178, 1, 0, 0, 1, 1,
1.153714, -0.3677875, 2.910612, 0, 0, 0, 1, 1,
1.163004, 0.2148157, 1.340869, 0, 0, 0, 1, 1,
1.165509, 0.5564257, 0.4835966, 0, 0, 0, 1, 1,
1.165685, -1.168306, 3.107282, 0, 0, 0, 1, 1,
1.172183, -0.8588938, 2.899866, 0, 0, 0, 1, 1,
1.181847, -0.8110152, 2.474784, 0, 0, 0, 1, 1,
1.182998, 0.4751917, 0.26293, 0, 0, 0, 1, 1,
1.183613, -0.2374074, 1.005523, 1, 1, 1, 1, 1,
1.185829, -0.8701934, 2.506168, 1, 1, 1, 1, 1,
1.186533, -1.554045, 2.326268, 1, 1, 1, 1, 1,
1.188518, 0.7196203, 0.7803143, 1, 1, 1, 1, 1,
1.197261, -0.8698902, 3.511168, 1, 1, 1, 1, 1,
1.205275, 0.307733, -0.2860717, 1, 1, 1, 1, 1,
1.205733, -0.001871484, 3.977077, 1, 1, 1, 1, 1,
1.210297, 0.02649047, 1.613846, 1, 1, 1, 1, 1,
1.215053, -1.634113, 2.456768, 1, 1, 1, 1, 1,
1.219674, 0.8305297, 1.306349, 1, 1, 1, 1, 1,
1.220141, 0.9768577, -1.223294, 1, 1, 1, 1, 1,
1.223118, -0.5830183, 2.748707, 1, 1, 1, 1, 1,
1.237159, -2.198688, 2.340219, 1, 1, 1, 1, 1,
1.247361, -0.08855272, 2.897103, 1, 1, 1, 1, 1,
1.250751, -0.4395282, 0.840756, 1, 1, 1, 1, 1,
1.258362, -0.2734442, 1.938592, 0, 0, 1, 1, 1,
1.259444, -1.870396, 2.430055, 1, 0, 0, 1, 1,
1.260657, -0.2424478, 0.8822494, 1, 0, 0, 1, 1,
1.264854, 0.7146222, -0.8523359, 1, 0, 0, 1, 1,
1.265918, -1.125925, 3.180714, 1, 0, 0, 1, 1,
1.267118, 2.016368, 0.9807556, 1, 0, 0, 1, 1,
1.269795, -0.4114163, 2.794897, 0, 0, 0, 1, 1,
1.272894, 1.636743, 0.8771223, 0, 0, 0, 1, 1,
1.279858, 0.8524714, 1.148433, 0, 0, 0, 1, 1,
1.28123, -0.8389922, 1.142634, 0, 0, 0, 1, 1,
1.28492, 0.6705009, 2.346051, 0, 0, 0, 1, 1,
1.291588, 0.2247544, 0.5988803, 0, 0, 0, 1, 1,
1.292285, -1.4704, 2.734914, 0, 0, 0, 1, 1,
1.293113, -0.08056542, 2.966335, 1, 1, 1, 1, 1,
1.293941, 1.216615, 0.5116811, 1, 1, 1, 1, 1,
1.314753, 0.2071395, 1.798718, 1, 1, 1, 1, 1,
1.317267, 0.08740461, 3.001729, 1, 1, 1, 1, 1,
1.331031, 0.6097882, 0.7393098, 1, 1, 1, 1, 1,
1.333947, -0.2853723, 0.7204385, 1, 1, 1, 1, 1,
1.33804, -0.3849322, 1.312845, 1, 1, 1, 1, 1,
1.344409, -0.6891352, 1.864482, 1, 1, 1, 1, 1,
1.353488, -0.1811357, 0.6328019, 1, 1, 1, 1, 1,
1.368301, 0.1351749, 1.882958, 1, 1, 1, 1, 1,
1.383674, 0.206615, 0.8829846, 1, 1, 1, 1, 1,
1.390393, -1.150581, 0.1733352, 1, 1, 1, 1, 1,
1.392221, 1.027702, 0.8190104, 1, 1, 1, 1, 1,
1.404955, 0.3546018, 2.275051, 1, 1, 1, 1, 1,
1.414981, 0.1984069, 0.8042559, 1, 1, 1, 1, 1,
1.427751, -0.9519675, 2.932017, 0, 0, 1, 1, 1,
1.430287, -1.153196, 1.934626, 1, 0, 0, 1, 1,
1.433504, -0.8096132, 3.783335, 1, 0, 0, 1, 1,
1.434186, -0.4957643, 2.649701, 1, 0, 0, 1, 1,
1.470286, 0.1119865, 1.493441, 1, 0, 0, 1, 1,
1.494875, 2.266279, 0.1373059, 1, 0, 0, 1, 1,
1.495723, -0.9774888, 1.927949, 0, 0, 0, 1, 1,
1.516201, 0.3913899, 1.959231, 0, 0, 0, 1, 1,
1.536153, -1.584969, 1.620166, 0, 0, 0, 1, 1,
1.539419, -1.770208, 3.022302, 0, 0, 0, 1, 1,
1.541603, 0.2160199, 0.766548, 0, 0, 0, 1, 1,
1.544592, -0.8334644, 1.590747, 0, 0, 0, 1, 1,
1.545592, 0.4140786, 0.6213606, 0, 0, 0, 1, 1,
1.549281, -0.1855515, 1.709877, 1, 1, 1, 1, 1,
1.563597, -0.5328192, 2.342641, 1, 1, 1, 1, 1,
1.567471, 1.015807, 0.9646393, 1, 1, 1, 1, 1,
1.570415, -0.3279917, 1.813231, 1, 1, 1, 1, 1,
1.583825, 0.1420532, 3.651006, 1, 1, 1, 1, 1,
1.590603, 1.554188, 1.032182, 1, 1, 1, 1, 1,
1.594903, -1.263922, 2.66137, 1, 1, 1, 1, 1,
1.597304, -0.0345866, 2.757968, 1, 1, 1, 1, 1,
1.597442, -2.059646, 3.443447, 1, 1, 1, 1, 1,
1.59965, -0.3478292, 1.228763, 1, 1, 1, 1, 1,
1.600148, 0.803464, 1.93559, 1, 1, 1, 1, 1,
1.603145, -0.7317308, 2.34711, 1, 1, 1, 1, 1,
1.608, 1.014319, 2.106244, 1, 1, 1, 1, 1,
1.61093, -0.4358024, 2.384007, 1, 1, 1, 1, 1,
1.61674, -1.128847, 3.448364, 1, 1, 1, 1, 1,
1.622835, 0.07593316, 1.207313, 0, 0, 1, 1, 1,
1.625357, -1.625412, 2.803191, 1, 0, 0, 1, 1,
1.630318, 1.456197, 1.768647, 1, 0, 0, 1, 1,
1.631201, 0.08225512, 1.365838, 1, 0, 0, 1, 1,
1.633914, 0.5500311, 0.2057931, 1, 0, 0, 1, 1,
1.638038, -0.2295862, 1.605839, 1, 0, 0, 1, 1,
1.645169, -0.3811371, 1.293085, 0, 0, 0, 1, 1,
1.65191, 0.2689284, -0.446587, 0, 0, 0, 1, 1,
1.657878, -0.5804141, 3.282892, 0, 0, 0, 1, 1,
1.659252, -0.01512741, 2.952729, 0, 0, 0, 1, 1,
1.695368, 1.172728, -1.116172, 0, 0, 0, 1, 1,
1.695883, 0.9576836, -0.1854295, 0, 0, 0, 1, 1,
1.70679, 1.509307, 2.639328, 0, 0, 0, 1, 1,
1.743164, 0.9135441, 2.55962, 1, 1, 1, 1, 1,
1.753151, -0.9380801, 1.204893, 1, 1, 1, 1, 1,
1.758121, 1.547309, 0.3677601, 1, 1, 1, 1, 1,
1.758692, -0.8424804, 3.004408, 1, 1, 1, 1, 1,
1.789073, -1.191221, 3.195983, 1, 1, 1, 1, 1,
1.833706, -0.838238, 1.673995, 1, 1, 1, 1, 1,
1.848103, -0.2437013, 2.645946, 1, 1, 1, 1, 1,
1.85397, -0.2642638, 1.866629, 1, 1, 1, 1, 1,
1.858105, -1.037034, 3.603062, 1, 1, 1, 1, 1,
1.932086, -0.2727437, 2.019953, 1, 1, 1, 1, 1,
1.934182, -0.9991008, 1.496936, 1, 1, 1, 1, 1,
1.953836, 0.2572738, -0.7011003, 1, 1, 1, 1, 1,
1.966242, -1.629385, 1.818125, 1, 1, 1, 1, 1,
1.970531, -1.964748, 1.474831, 1, 1, 1, 1, 1,
2.003325, -0.5762497, -0.3619293, 1, 1, 1, 1, 1,
2.031167, 0.7836857, -1.290216, 0, 0, 1, 1, 1,
2.032608, -1.708443, 0.937272, 1, 0, 0, 1, 1,
2.043148, 1.968298, -0.1827073, 1, 0, 0, 1, 1,
2.051733, 1.499208, 1.61769, 1, 0, 0, 1, 1,
2.055272, 0.4892064, 2.229152, 1, 0, 0, 1, 1,
2.064175, -0.6339714, 1.168554, 1, 0, 0, 1, 1,
2.110325, 1.071296, 4.219671, 0, 0, 0, 1, 1,
2.120503, -2.573078, 2.478592, 0, 0, 0, 1, 1,
2.12051, 2.244002, 0.4931237, 0, 0, 0, 1, 1,
2.173849, -0.2786757, 0.1827084, 0, 0, 0, 1, 1,
2.206185, 0.5304861, 1.267632, 0, 0, 0, 1, 1,
2.265306, -0.684879, 1.085598, 0, 0, 0, 1, 1,
2.270513, 0.3280097, -0.7378049, 0, 0, 0, 1, 1,
2.300068, -1.863292, 3.645875, 1, 1, 1, 1, 1,
2.328, 1.576636, 0.6011215, 1, 1, 1, 1, 1,
2.470209, -1.804399, 4.123684, 1, 1, 1, 1, 1,
2.602317, 1.234703, 2.149072, 1, 1, 1, 1, 1,
2.630311, -0.9028789, 1.513852, 1, 1, 1, 1, 1,
2.724453, -1.770407, 3.265039, 1, 1, 1, 1, 1,
2.929228, 0.7164106, 1.575915, 1, 1, 1, 1, 1
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
var radius = 9.566804;
var distance = 33.60299;
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
mvMatrix.translate( 0.279549, -0.1318406, 0.281621 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.60299);
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
