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
-3.19934, -0.6795176, -1.871045, 1, 0, 0, 1,
-2.456712, -1.428925, -0.5339209, 1, 0.007843138, 0, 1,
-2.408961, 0.5461507, -1.318613, 1, 0.01176471, 0, 1,
-2.38253, -0.3299176, 0.2843599, 1, 0.01960784, 0, 1,
-2.36668, -1.179305, -2.44583, 1, 0.02352941, 0, 1,
-2.349019, 0.7308793, -0.8959411, 1, 0.03137255, 0, 1,
-2.343446, 0.02914359, -1.641594, 1, 0.03529412, 0, 1,
-2.20652, 1.334861, -2.202965, 1, 0.04313726, 0, 1,
-2.198596, 0.1414632, -0.8443107, 1, 0.04705882, 0, 1,
-2.187899, -1.157886, -3.592326, 1, 0.05490196, 0, 1,
-2.179117, -0.7912754, -2.55613, 1, 0.05882353, 0, 1,
-2.121371, -0.6819419, -3.88682, 1, 0.06666667, 0, 1,
-2.11122, 1.77142, 0.9930291, 1, 0.07058824, 0, 1,
-2.032717, 0.2550888, -0.7992895, 1, 0.07843138, 0, 1,
-2.014321, 0.2154853, -2.589602, 1, 0.08235294, 0, 1,
-2.01224, -0.3230301, -2.614607, 1, 0.09019608, 0, 1,
-1.99455, 0.6492818, -1.090533, 1, 0.09411765, 0, 1,
-1.991862, -0.5286931, -0.6186735, 1, 0.1019608, 0, 1,
-1.987775, -2.324455, -1.177856, 1, 0.1098039, 0, 1,
-1.971663, -0.8868855, -0.6334035, 1, 0.1137255, 0, 1,
-1.959905, -0.239482, -1.171716, 1, 0.1215686, 0, 1,
-1.942411, -0.6843556, -2.228711, 1, 0.1254902, 0, 1,
-1.934541, 0.02232596, -0.4885038, 1, 0.1333333, 0, 1,
-1.903403, -0.2255328, -2.871096, 1, 0.1372549, 0, 1,
-1.894333, -0.4498083, -1.628137, 1, 0.145098, 0, 1,
-1.887392, 0.7791594, -2.645556, 1, 0.1490196, 0, 1,
-1.880816, 2.559103, -1.350659, 1, 0.1568628, 0, 1,
-1.829362, -0.9016278, -3.560917, 1, 0.1607843, 0, 1,
-1.82746, -1.150745, -0.4118946, 1, 0.1686275, 0, 1,
-1.81817, 2.351819, -0.693115, 1, 0.172549, 0, 1,
-1.817875, 0.08515977, -0.6690276, 1, 0.1803922, 0, 1,
-1.808513, -0.04966969, -1.599071, 1, 0.1843137, 0, 1,
-1.802907, -0.6568922, -2.842649, 1, 0.1921569, 0, 1,
-1.801192, 0.2387694, -0.8013219, 1, 0.1960784, 0, 1,
-1.797361, 0.5996962, -1.683703, 1, 0.2039216, 0, 1,
-1.789493, -1.739781, -2.752887, 1, 0.2117647, 0, 1,
-1.783601, 1.755135, -1.003385, 1, 0.2156863, 0, 1,
-1.78097, 1.036665, -1.227375, 1, 0.2235294, 0, 1,
-1.753547, 1.29807, -1.232504, 1, 0.227451, 0, 1,
-1.743379, -0.09979647, -2.547907, 1, 0.2352941, 0, 1,
-1.738318, 1.164871, -2.049351, 1, 0.2392157, 0, 1,
-1.73326, 0.5983722, -2.367074, 1, 0.2470588, 0, 1,
-1.727627, -0.8575267, -2.289241, 1, 0.2509804, 0, 1,
-1.714106, -0.9104767, -1.944316, 1, 0.2588235, 0, 1,
-1.694646, 0.2759257, 0.9266429, 1, 0.2627451, 0, 1,
-1.659659, 0.02542813, -1.858338, 1, 0.2705882, 0, 1,
-1.651682, 1.477658, -0.1088387, 1, 0.2745098, 0, 1,
-1.646931, 0.2051842, -0.721148, 1, 0.282353, 0, 1,
-1.642518, 0.8043712, -2.07707, 1, 0.2862745, 0, 1,
-1.618482, -0.6206036, -0.8659387, 1, 0.2941177, 0, 1,
-1.614674, -1.21093, -2.514303, 1, 0.3019608, 0, 1,
-1.611228, -0.6043706, -2.115793, 1, 0.3058824, 0, 1,
-1.609342, 0.8627326, -1.213856, 1, 0.3137255, 0, 1,
-1.60058, 0.2963824, -0.07777774, 1, 0.3176471, 0, 1,
-1.595475, 0.7178722, -1.244535, 1, 0.3254902, 0, 1,
-1.59457, -0.5183327, -2.771331, 1, 0.3294118, 0, 1,
-1.581779, 0.8913609, -2.207059, 1, 0.3372549, 0, 1,
-1.579131, -0.8712152, -2.282532, 1, 0.3411765, 0, 1,
-1.578905, 0.3111801, -2.285685, 1, 0.3490196, 0, 1,
-1.574233, -0.3214582, -1.343473, 1, 0.3529412, 0, 1,
-1.567848, -0.3112499, -1.20181, 1, 0.3607843, 0, 1,
-1.567282, -0.2614356, -1.564139, 1, 0.3647059, 0, 1,
-1.565691, 0.566546, -0.9053369, 1, 0.372549, 0, 1,
-1.564893, 0.5267853, -1.548706, 1, 0.3764706, 0, 1,
-1.556499, 1.088928, -0.5592798, 1, 0.3843137, 0, 1,
-1.536945, 0.3809538, -2.077718, 1, 0.3882353, 0, 1,
-1.521245, 0.5504728, -1.497218, 1, 0.3960784, 0, 1,
-1.514119, -0.5370635, -2.675317, 1, 0.4039216, 0, 1,
-1.496573, -1.258677, -0.6765316, 1, 0.4078431, 0, 1,
-1.480094, 0.8801968, -1.245458, 1, 0.4156863, 0, 1,
-1.478179, 0.5420391, -1.64239, 1, 0.4196078, 0, 1,
-1.465404, 0.9194984, -0.3866779, 1, 0.427451, 0, 1,
-1.452061, -0.4963606, -1.769781, 1, 0.4313726, 0, 1,
-1.44539, 0.1085112, -2.311798, 1, 0.4392157, 0, 1,
-1.435686, 1.396407, -1.457221, 1, 0.4431373, 0, 1,
-1.432667, 0.5003347, -1.383667, 1, 0.4509804, 0, 1,
-1.422386, 1.076662, 0.7013094, 1, 0.454902, 0, 1,
-1.412473, -0.3822346, -1.516025, 1, 0.4627451, 0, 1,
-1.410412, 0.2177972, -0.9622335, 1, 0.4666667, 0, 1,
-1.391495, -2.719408, -3.452356, 1, 0.4745098, 0, 1,
-1.388445, -1.020952, -1.825442, 1, 0.4784314, 0, 1,
-1.384008, -1.30348, -0.7690509, 1, 0.4862745, 0, 1,
-1.383703, -0.7732634, -1.639428, 1, 0.4901961, 0, 1,
-1.36236, -0.4325402, -0.7157915, 1, 0.4980392, 0, 1,
-1.347043, -0.1806172, -1.785715, 1, 0.5058824, 0, 1,
-1.334633, -0.5508887, -4.045819, 1, 0.509804, 0, 1,
-1.324328, -2.296758, -3.789082, 1, 0.5176471, 0, 1,
-1.3184, -0.6999834, -2.423926, 1, 0.5215687, 0, 1,
-1.318005, -1.212646, -2.438292, 1, 0.5294118, 0, 1,
-1.313067, 1.483874, -0.7190396, 1, 0.5333334, 0, 1,
-1.310783, 0.5569568, -1.022369, 1, 0.5411765, 0, 1,
-1.30132, 0.87224, -1.34261, 1, 0.5450981, 0, 1,
-1.297699, -0.878833, -3.331583, 1, 0.5529412, 0, 1,
-1.295602, 0.4533618, -0.2860751, 1, 0.5568628, 0, 1,
-1.293469, -0.6814071, -2.149359, 1, 0.5647059, 0, 1,
-1.293129, -0.2594216, -2.099455, 1, 0.5686275, 0, 1,
-1.280446, 0.302631, -0.9557897, 1, 0.5764706, 0, 1,
-1.276258, 0.9473398, -0.5090846, 1, 0.5803922, 0, 1,
-1.270206, 0.2928291, -0.3352559, 1, 0.5882353, 0, 1,
-1.263287, -0.403523, -2.456181, 1, 0.5921569, 0, 1,
-1.260778, 1.877977, 0.01729994, 1, 0.6, 0, 1,
-1.259268, 0.5146629, -0.8190317, 1, 0.6078432, 0, 1,
-1.258298, -0.2568641, -1.178949, 1, 0.6117647, 0, 1,
-1.246744, 0.0595727, -1.731034, 1, 0.6196079, 0, 1,
-1.234284, -0.8307776, 0.1854561, 1, 0.6235294, 0, 1,
-1.228617, -0.8302804, -2.441168, 1, 0.6313726, 0, 1,
-1.219667, 0.05654426, -1.916208, 1, 0.6352941, 0, 1,
-1.218609, -0.1259248, -2.067729, 1, 0.6431373, 0, 1,
-1.214175, -0.6115893, -3.395457, 1, 0.6470588, 0, 1,
-1.205575, 1.155044, 0.9844611, 1, 0.654902, 0, 1,
-1.202396, 0.3718145, -2.576327, 1, 0.6588235, 0, 1,
-1.201319, -0.4900099, -2.168524, 1, 0.6666667, 0, 1,
-1.189546, 0.4965441, -2.297181, 1, 0.6705883, 0, 1,
-1.189077, 0.6465243, -1.890788, 1, 0.6784314, 0, 1,
-1.188826, -1.685916, -2.155785, 1, 0.682353, 0, 1,
-1.18174, -1.312713, -3.80341, 1, 0.6901961, 0, 1,
-1.181663, -0.867552, -2.349651, 1, 0.6941177, 0, 1,
-1.17088, 0.8176802, -0.6829017, 1, 0.7019608, 0, 1,
-1.15593, -0.159423, -0.4928154, 1, 0.7098039, 0, 1,
-1.14503, 1.32731, -0.3660127, 1, 0.7137255, 0, 1,
-1.139405, 0.5579637, -2.012441, 1, 0.7215686, 0, 1,
-1.13778, -0.1027036, -2.293432, 1, 0.7254902, 0, 1,
-1.12939, 0.8290472, -0.3420871, 1, 0.7333333, 0, 1,
-1.12718, 1.65196, 0.3331559, 1, 0.7372549, 0, 1,
-1.126873, 1.289832, -1.357871, 1, 0.7450981, 0, 1,
-1.121261, -0.08090868, -1.01684, 1, 0.7490196, 0, 1,
-1.119689, 0.8057401, -0.862468, 1, 0.7568628, 0, 1,
-1.11124, 0.9289766, -0.03613516, 1, 0.7607843, 0, 1,
-1.101781, -1.306882, -4.415521, 1, 0.7686275, 0, 1,
-1.100615, -0.8281614, -2.213183, 1, 0.772549, 0, 1,
-1.100111, -1.360884, -1.470984, 1, 0.7803922, 0, 1,
-1.091906, 0.319054, 0.1491963, 1, 0.7843137, 0, 1,
-1.085497, 1.892455, -1.085748, 1, 0.7921569, 0, 1,
-1.082261, -0.4029212, -1.058211, 1, 0.7960784, 0, 1,
-1.079915, -1.323258, -2.684747, 1, 0.8039216, 0, 1,
-1.077043, 0.7046838, -0.4064029, 1, 0.8117647, 0, 1,
-1.06531, -1.066379, -0.4580606, 1, 0.8156863, 0, 1,
-1.053423, -0.05804624, -1.777095, 1, 0.8235294, 0, 1,
-1.051555, -0.6872696, -1.350155, 1, 0.827451, 0, 1,
-1.050099, -0.3519428, -2.000317, 1, 0.8352941, 0, 1,
-1.050092, 0.5005075, -1.677517, 1, 0.8392157, 0, 1,
-1.045678, -1.366177, -1.120335, 1, 0.8470588, 0, 1,
-1.04557, 1.309213, -1.226972, 1, 0.8509804, 0, 1,
-1.044857, -1.093536, -3.460281, 1, 0.8588235, 0, 1,
-1.038939, 1.404211, -1.17116, 1, 0.8627451, 0, 1,
-1.036729, 0.3464032, -1.125334, 1, 0.8705882, 0, 1,
-1.036674, -0.8779858, -0.856869, 1, 0.8745098, 0, 1,
-1.03585, -0.7079291, -3.626374, 1, 0.8823529, 0, 1,
-1.034976, 0.8500137, -1.113328, 1, 0.8862745, 0, 1,
-1.026978, 0.1868428, -2.996944, 1, 0.8941177, 0, 1,
-1.025358, -0.1751341, -1.797247, 1, 0.8980392, 0, 1,
-1.021748, 0.4933538, -1.246946, 1, 0.9058824, 0, 1,
-1.017873, -0.231146, -1.983919, 1, 0.9137255, 0, 1,
-1.015013, 0.5288562, -1.968042, 1, 0.9176471, 0, 1,
-1.00848, 0.3418293, -0.9618222, 1, 0.9254902, 0, 1,
-1.001351, 0.3069685, -1.014199, 1, 0.9294118, 0, 1,
-0.9960794, 0.1118026, -1.276107, 1, 0.9372549, 0, 1,
-0.9923216, 1.748618, -1.099294, 1, 0.9411765, 0, 1,
-0.9901459, 0.8673167, -1.78298, 1, 0.9490196, 0, 1,
-0.9842905, -0.84305, -0.3458163, 1, 0.9529412, 0, 1,
-0.9840968, 0.2361499, -0.5087966, 1, 0.9607843, 0, 1,
-0.9780943, -0.1266011, -1.210449, 1, 0.9647059, 0, 1,
-0.9710767, 0.4540291, -0.8963177, 1, 0.972549, 0, 1,
-0.9700129, -0.2490208, -0.7553513, 1, 0.9764706, 0, 1,
-0.9672442, -0.999518, -2.698605, 1, 0.9843137, 0, 1,
-0.9617708, -0.8531766, -2.072804, 1, 0.9882353, 0, 1,
-0.9585336, -1.565277, -4.081189, 1, 0.9960784, 0, 1,
-0.9580352, -0.9396706, -3.2754, 0.9960784, 1, 0, 1,
-0.9506095, 0.2385815, -1.822145, 0.9921569, 1, 0, 1,
-0.9484028, -1.395039, -3.5779, 0.9843137, 1, 0, 1,
-0.947758, -0.8378581, -2.087189, 0.9803922, 1, 0, 1,
-0.9435176, -0.7728589, -1.180605, 0.972549, 1, 0, 1,
-0.9405487, -2.13044, -3.612211, 0.9686275, 1, 0, 1,
-0.937762, -0.07429936, -0.6419868, 0.9607843, 1, 0, 1,
-0.9360657, 0.06506334, -1.354873, 0.9568627, 1, 0, 1,
-0.9338694, -0.3008978, -0.7858815, 0.9490196, 1, 0, 1,
-0.930161, 1.480577, -0.7077016, 0.945098, 1, 0, 1,
-0.9267455, -0.09561436, -2.630712, 0.9372549, 1, 0, 1,
-0.9261513, -0.7461607, -1.389297, 0.9333333, 1, 0, 1,
-0.9249641, 1.291975, -0.5552319, 0.9254902, 1, 0, 1,
-0.9199839, -0.0914182, -0.5171881, 0.9215686, 1, 0, 1,
-0.9172863, 0.4911696, 0.3858554, 0.9137255, 1, 0, 1,
-0.9156822, -0.1859887, -1.878717, 0.9098039, 1, 0, 1,
-0.9080171, 0.07148725, -2.230124, 0.9019608, 1, 0, 1,
-0.905937, 0.5064217, -1.898561, 0.8941177, 1, 0, 1,
-0.9045689, -0.5830093, -1.654951, 0.8901961, 1, 0, 1,
-0.9001514, -1.713721, -1.729151, 0.8823529, 1, 0, 1,
-0.8998964, 0.7730238, 0.3670799, 0.8784314, 1, 0, 1,
-0.8966938, 0.01116396, -0.1615131, 0.8705882, 1, 0, 1,
-0.8960886, -1.047922, -3.332865, 0.8666667, 1, 0, 1,
-0.8941395, 0.370032, -2.566798, 0.8588235, 1, 0, 1,
-0.8940755, 0.2736036, -1.599591, 0.854902, 1, 0, 1,
-0.8825524, -1.271, -3.16194, 0.8470588, 1, 0, 1,
-0.8798153, 0.3226318, -0.9818758, 0.8431373, 1, 0, 1,
-0.8773138, -0.2193008, -3.041689, 0.8352941, 1, 0, 1,
-0.876258, 1.496921, 0.900111, 0.8313726, 1, 0, 1,
-0.8743629, -0.9205399, -2.421244, 0.8235294, 1, 0, 1,
-0.8718609, -0.1654423, -1.276081, 0.8196079, 1, 0, 1,
-0.8636067, -1.573347, -0.8056425, 0.8117647, 1, 0, 1,
-0.8606005, -0.3024901, -3.238928, 0.8078431, 1, 0, 1,
-0.8587174, 0.7135673, 0.8814589, 0.8, 1, 0, 1,
-0.8532203, -1.583247, -1.0631, 0.7921569, 1, 0, 1,
-0.8475111, 0.2702492, -1.801655, 0.7882353, 1, 0, 1,
-0.8459504, 0.285068, 0.2355989, 0.7803922, 1, 0, 1,
-0.8459411, 0.1206671, -0.2992691, 0.7764706, 1, 0, 1,
-0.840368, -1.214768, -3.09539, 0.7686275, 1, 0, 1,
-0.8398541, -0.8781147, -2.645164, 0.7647059, 1, 0, 1,
-0.8362899, 1.768903, 0.8192877, 0.7568628, 1, 0, 1,
-0.8197203, -0.173686, -2.983105, 0.7529412, 1, 0, 1,
-0.807852, 0.4226245, -1.006467, 0.7450981, 1, 0, 1,
-0.7960802, 0.08872263, -2.072919, 0.7411765, 1, 0, 1,
-0.7953244, -0.5507849, -1.117473, 0.7333333, 1, 0, 1,
-0.7931794, -1.268353, -1.684597, 0.7294118, 1, 0, 1,
-0.7927179, -0.8467615, -2.497128, 0.7215686, 1, 0, 1,
-0.7873321, -0.4347218, -3.252719, 0.7176471, 1, 0, 1,
-0.7855806, -1.623122, -3.646552, 0.7098039, 1, 0, 1,
-0.7832173, 0.415914, -0.9766279, 0.7058824, 1, 0, 1,
-0.7826835, 0.6176703, -1.180765, 0.6980392, 1, 0, 1,
-0.7825504, 2.282798, -1.47586, 0.6901961, 1, 0, 1,
-0.7784483, 0.520501, 0.7441407, 0.6862745, 1, 0, 1,
-0.7767861, 0.2832406, 0.06664266, 0.6784314, 1, 0, 1,
-0.7667297, -0.03062236, -1.069389, 0.6745098, 1, 0, 1,
-0.7642442, -0.6087832, -4.080993, 0.6666667, 1, 0, 1,
-0.763937, -0.5144362, -3.5547, 0.6627451, 1, 0, 1,
-0.7477483, 1.166577, 0.1996007, 0.654902, 1, 0, 1,
-0.738101, 0.7187794, -0.1697346, 0.6509804, 1, 0, 1,
-0.7374895, -1.122994, -1.627524, 0.6431373, 1, 0, 1,
-0.7360899, -0.2435113, -1.621757, 0.6392157, 1, 0, 1,
-0.7348238, -0.2733981, -2.334577, 0.6313726, 1, 0, 1,
-0.7293429, 0.01028789, -1.352213, 0.627451, 1, 0, 1,
-0.7278147, -1.913649, -2.76659, 0.6196079, 1, 0, 1,
-0.7227429, -0.6587867, -2.3355, 0.6156863, 1, 0, 1,
-0.7227077, 0.7555909, -0.6054111, 0.6078432, 1, 0, 1,
-0.7203407, 0.4040461, 0.5725001, 0.6039216, 1, 0, 1,
-0.7123496, -0.3062178, -1.712515, 0.5960785, 1, 0, 1,
-0.7052569, -1.201339, -2.206395, 0.5882353, 1, 0, 1,
-0.7031109, -0.1842179, -2.32744, 0.5843138, 1, 0, 1,
-0.6987849, 1.088371, 0.2148814, 0.5764706, 1, 0, 1,
-0.695485, 1.02336, -0.2563187, 0.572549, 1, 0, 1,
-0.6941586, 0.5197392, 0.8943571, 0.5647059, 1, 0, 1,
-0.6938196, 1.671899, 1.216936, 0.5607843, 1, 0, 1,
-0.6925964, -0.5585316, -2.785093, 0.5529412, 1, 0, 1,
-0.6922361, -0.2608003, -1.290551, 0.5490196, 1, 0, 1,
-0.6916665, -1.342829, -1.316456, 0.5411765, 1, 0, 1,
-0.6912497, -0.8388684, -5.098342, 0.5372549, 1, 0, 1,
-0.6903795, 0.05532966, -1.4893, 0.5294118, 1, 0, 1,
-0.6878193, 2.011397, 0.7433364, 0.5254902, 1, 0, 1,
-0.6865035, 1.923742, -0.9040359, 0.5176471, 1, 0, 1,
-0.683796, 1.225251, -0.4466351, 0.5137255, 1, 0, 1,
-0.6818387, -0.3930712, -1.817096, 0.5058824, 1, 0, 1,
-0.6812271, -0.3131612, -1.536677, 0.5019608, 1, 0, 1,
-0.6772904, 0.08186343, -2.158135, 0.4941176, 1, 0, 1,
-0.6724949, 0.1757271, -1.55911, 0.4862745, 1, 0, 1,
-0.6690145, -0.1785651, -2.910156, 0.4823529, 1, 0, 1,
-0.6678094, 1.30175, 0.02547504, 0.4745098, 1, 0, 1,
-0.6669407, -0.03700829, -2.502022, 0.4705882, 1, 0, 1,
-0.6658524, -2.148967, -1.668454, 0.4627451, 1, 0, 1,
-0.6656255, 0.4341186, -2.270957, 0.4588235, 1, 0, 1,
-0.6640688, -0.8604935, -2.263398, 0.4509804, 1, 0, 1,
-0.6640359, -0.1564488, -1.436714, 0.4470588, 1, 0, 1,
-0.6637408, -1.409366, -3.109002, 0.4392157, 1, 0, 1,
-0.6555567, -3.183519, -1.881248, 0.4352941, 1, 0, 1,
-0.6501511, -0.510013, -1.471681, 0.427451, 1, 0, 1,
-0.649948, 0.2722913, -2.280293, 0.4235294, 1, 0, 1,
-0.6342073, 0.01704242, -2.693602, 0.4156863, 1, 0, 1,
-0.6338931, 1.872003, 0.2201562, 0.4117647, 1, 0, 1,
-0.6312149, 0.9177912, -1.37512, 0.4039216, 1, 0, 1,
-0.6297374, 0.2961091, -1.496968, 0.3960784, 1, 0, 1,
-0.6293898, 1.48552, -0.6859484, 0.3921569, 1, 0, 1,
-0.6283429, -1.861002, -3.777383, 0.3843137, 1, 0, 1,
-0.6277915, 2.805521, -0.4681098, 0.3803922, 1, 0, 1,
-0.6271692, -1.100919, -2.80153, 0.372549, 1, 0, 1,
-0.6266269, 0.5442152, 0.5038063, 0.3686275, 1, 0, 1,
-0.6239582, -0.7620528, -2.160931, 0.3607843, 1, 0, 1,
-0.6223931, 0.6426476, -0.2104709, 0.3568628, 1, 0, 1,
-0.6222413, 0.8828256, -0.7359334, 0.3490196, 1, 0, 1,
-0.6217443, -0.9889111, -2.242729, 0.345098, 1, 0, 1,
-0.6169853, 1.739734, 1.354796, 0.3372549, 1, 0, 1,
-0.613299, -0.1789656, -0.6496055, 0.3333333, 1, 0, 1,
-0.6105605, -0.1476933, 0.5464376, 0.3254902, 1, 0, 1,
-0.6047611, 0.04400664, -1.235298, 0.3215686, 1, 0, 1,
-0.6032176, 0.8707744, -0.7623015, 0.3137255, 1, 0, 1,
-0.6027004, 1.552927, -1.947589, 0.3098039, 1, 0, 1,
-0.5980397, -0.3511775, -0.8545186, 0.3019608, 1, 0, 1,
-0.5976623, -0.4811718, -3.481326, 0.2941177, 1, 0, 1,
-0.5944763, 2.488292, -1.578263, 0.2901961, 1, 0, 1,
-0.5913244, 0.379744, -0.2453968, 0.282353, 1, 0, 1,
-0.5823367, -0.6650087, -3.293047, 0.2784314, 1, 0, 1,
-0.5812346, -0.913798, -1.840155, 0.2705882, 1, 0, 1,
-0.5731242, -0.05972002, 0.887768, 0.2666667, 1, 0, 1,
-0.5720335, -1.239082, -2.829457, 0.2588235, 1, 0, 1,
-0.5659826, -0.9416342, -1.679396, 0.254902, 1, 0, 1,
-0.5513183, -1.406271, -2.024539, 0.2470588, 1, 0, 1,
-0.5511774, -0.03953361, -2.355554, 0.2431373, 1, 0, 1,
-0.5444664, -0.5206192, -0.8448985, 0.2352941, 1, 0, 1,
-0.5443269, 1.117973, 0.004053076, 0.2313726, 1, 0, 1,
-0.5441391, 1.006906, -0.5195105, 0.2235294, 1, 0, 1,
-0.5439856, -0.58674, -2.326484, 0.2196078, 1, 0, 1,
-0.5435094, -0.7388229, -0.4522453, 0.2117647, 1, 0, 1,
-0.5417353, -0.9005061, -1.538919, 0.2078431, 1, 0, 1,
-0.5381631, -0.617018, -2.635475, 0.2, 1, 0, 1,
-0.5378306, 0.8682318, -0.257976, 0.1921569, 1, 0, 1,
-0.5373666, 1.07038, -0.764056, 0.1882353, 1, 0, 1,
-0.5331517, -0.4425157, -4.248969, 0.1803922, 1, 0, 1,
-0.5318947, 0.6228542, -0.3542011, 0.1764706, 1, 0, 1,
-0.5313988, -1.738874, -0.4034881, 0.1686275, 1, 0, 1,
-0.5304151, 0.7103156, -0.5387366, 0.1647059, 1, 0, 1,
-0.5303989, 0.00648119, -1.757602, 0.1568628, 1, 0, 1,
-0.5296896, -0.0294946, -1.201909, 0.1529412, 1, 0, 1,
-0.5270312, -0.7475469, -2.581021, 0.145098, 1, 0, 1,
-0.5186842, -1.020626, -1.272092, 0.1411765, 1, 0, 1,
-0.5184864, -1.252176, -3.233188, 0.1333333, 1, 0, 1,
-0.5124651, 0.262885, 0.0890153, 0.1294118, 1, 0, 1,
-0.5114825, -2.25999, -2.945571, 0.1215686, 1, 0, 1,
-0.5086715, -0.2153704, -1.079351, 0.1176471, 1, 0, 1,
-0.5036855, -0.7901305, -2.399641, 0.1098039, 1, 0, 1,
-0.5035647, 0.9733638, -2.539286, 0.1058824, 1, 0, 1,
-0.5003007, 0.247556, -0.4673315, 0.09803922, 1, 0, 1,
-0.4991064, -0.1102239, -0.2312571, 0.09019608, 1, 0, 1,
-0.4986704, -0.3012572, -1.272679, 0.08627451, 1, 0, 1,
-0.4946233, -0.115805, 0.4224986, 0.07843138, 1, 0, 1,
-0.4874935, -1.100627, -2.685941, 0.07450981, 1, 0, 1,
-0.4816697, -0.3516099, -3.002277, 0.06666667, 1, 0, 1,
-0.4793122, -0.4857501, -4.077188, 0.0627451, 1, 0, 1,
-0.478507, -1.172652, -2.40142, 0.05490196, 1, 0, 1,
-0.4771343, -0.6528981, -3.217553, 0.05098039, 1, 0, 1,
-0.4727882, 1.079462, -0.8805412, 0.04313726, 1, 0, 1,
-0.4699169, -0.922118, -2.845385, 0.03921569, 1, 0, 1,
-0.4613143, -0.6070182, -3.491444, 0.03137255, 1, 0, 1,
-0.455463, 0.2599933, -0.9847502, 0.02745098, 1, 0, 1,
-0.4549271, 0.6382508, -0.1475029, 0.01960784, 1, 0, 1,
-0.4501507, -0.5755005, -2.401195, 0.01568628, 1, 0, 1,
-0.4391353, 0.3206626, -1.554801, 0.007843138, 1, 0, 1,
-0.4390106, 0.2121374, -2.850199, 0.003921569, 1, 0, 1,
-0.4336072, -0.3105385, -1.972974, 0, 1, 0.003921569, 1,
-0.4324774, -0.1691343, -0.8110972, 0, 1, 0.01176471, 1,
-0.431377, 0.383984, -0.1987826, 0, 1, 0.01568628, 1,
-0.4249965, 0.4689904, -0.1710199, 0, 1, 0.02352941, 1,
-0.4247026, -1.049907, -3.050261, 0, 1, 0.02745098, 1,
-0.4237598, 0.3897737, -2.016055, 0, 1, 0.03529412, 1,
-0.4177093, -1.747417, -2.993792, 0, 1, 0.03921569, 1,
-0.412237, 0.4303801, -0.9079646, 0, 1, 0.04705882, 1,
-0.4102202, -0.5798432, -3.11534, 0, 1, 0.05098039, 1,
-0.4094827, 0.1621807, -0.7391822, 0, 1, 0.05882353, 1,
-0.4082918, -1.962973, -1.614205, 0, 1, 0.0627451, 1,
-0.402529, -1.138617, -2.891885, 0, 1, 0.07058824, 1,
-0.3945971, 0.4048367, 0.7914514, 0, 1, 0.07450981, 1,
-0.3922775, -2.270576, -3.383486, 0, 1, 0.08235294, 1,
-0.3869486, 0.8192554, 0.01146035, 0, 1, 0.08627451, 1,
-0.3843778, -0.5483115, -2.731561, 0, 1, 0.09411765, 1,
-0.3833598, 1.251059, 0.6050782, 0, 1, 0.1019608, 1,
-0.3823403, -1.568772, -4.248647, 0, 1, 0.1058824, 1,
-0.3820431, -1.254065, -2.953629, 0, 1, 0.1137255, 1,
-0.3812357, -2.176642, -3.875093, 0, 1, 0.1176471, 1,
-0.3764095, 0.8345047, 0.1716175, 0, 1, 0.1254902, 1,
-0.3670232, 0.8530495, -1.585603, 0, 1, 0.1294118, 1,
-0.3656712, -0.3555801, -2.776006, 0, 1, 0.1372549, 1,
-0.3651064, 0.2915148, -0.1471107, 0, 1, 0.1411765, 1,
-0.3619193, -1.474964, -2.653529, 0, 1, 0.1490196, 1,
-0.3599758, 0.4705183, 0.6518928, 0, 1, 0.1529412, 1,
-0.3589455, -0.2849512, -3.43219, 0, 1, 0.1607843, 1,
-0.3536006, -0.9358447, -2.061878, 0, 1, 0.1647059, 1,
-0.3527585, -0.332937, -2.496211, 0, 1, 0.172549, 1,
-0.3527105, 0.6038418, -0.5692455, 0, 1, 0.1764706, 1,
-0.3514304, -0.5863137, -2.100044, 0, 1, 0.1843137, 1,
-0.3453791, 1.399284, -0.07314166, 0, 1, 0.1882353, 1,
-0.3412458, -1.538886, -3.162161, 0, 1, 0.1960784, 1,
-0.3396812, 0.540985, -1.476967, 0, 1, 0.2039216, 1,
-0.3287925, -1.813774, -3.398252, 0, 1, 0.2078431, 1,
-0.3251515, -0.2328052, -0.3813766, 0, 1, 0.2156863, 1,
-0.3239616, -1.173995, -0.5134049, 0, 1, 0.2196078, 1,
-0.3173682, -1.7997, -1.732108, 0, 1, 0.227451, 1,
-0.316034, -0.6599401, -2.362075, 0, 1, 0.2313726, 1,
-0.3132458, 0.3597745, 0.3426994, 0, 1, 0.2392157, 1,
-0.3127826, 0.1620178, -1.169188, 0, 1, 0.2431373, 1,
-0.3102978, -0.9829726, -3.874431, 0, 1, 0.2509804, 1,
-0.3099198, -0.4319177, -2.233232, 0, 1, 0.254902, 1,
-0.3055473, 0.07803626, -2.261124, 0, 1, 0.2627451, 1,
-0.3032437, 0.6776119, -0.9150781, 0, 1, 0.2666667, 1,
-0.2994446, -0.8806332, -2.432163, 0, 1, 0.2745098, 1,
-0.2986653, 0.1373582, 0.4611201, 0, 1, 0.2784314, 1,
-0.2986412, -0.8107634, -1.988191, 0, 1, 0.2862745, 1,
-0.2923295, 0.713765, 0.4852854, 0, 1, 0.2901961, 1,
-0.2902014, 0.003390904, -2.029513, 0, 1, 0.2980392, 1,
-0.2896587, -2.179283, -5.425029, 0, 1, 0.3058824, 1,
-0.2859833, -1.361573, -3.352361, 0, 1, 0.3098039, 1,
-0.2854437, -0.4025381, -2.996943, 0, 1, 0.3176471, 1,
-0.2821678, 1.256366, -0.6826252, 0, 1, 0.3215686, 1,
-0.2819716, -0.3600822, -2.552058, 0, 1, 0.3294118, 1,
-0.2769195, -0.4100988, -1.215697, 0, 1, 0.3333333, 1,
-0.2729828, -0.1190326, -1.064112, 0, 1, 0.3411765, 1,
-0.2695321, 1.0259, -1.171978, 0, 1, 0.345098, 1,
-0.2661459, 0.7348083, -1.143914, 0, 1, 0.3529412, 1,
-0.2632224, -0.2945281, -1.663908, 0, 1, 0.3568628, 1,
-0.2596543, 0.3093084, -0.08786821, 0, 1, 0.3647059, 1,
-0.2590835, 1.119803, -0.3756223, 0, 1, 0.3686275, 1,
-0.2572366, 1.599256, -0.4235021, 0, 1, 0.3764706, 1,
-0.2530561, -0.03308044, -0.6660772, 0, 1, 0.3803922, 1,
-0.2491682, -1.492245, -3.608016, 0, 1, 0.3882353, 1,
-0.2485726, -0.44457, -2.43558, 0, 1, 0.3921569, 1,
-0.2450216, 1.122161, 0.06481037, 0, 1, 0.4, 1,
-0.2441164, 0.02587901, -3.951241, 0, 1, 0.4078431, 1,
-0.2441056, -0.1358438, -2.216603, 0, 1, 0.4117647, 1,
-0.2390479, -0.2850501, -2.852134, 0, 1, 0.4196078, 1,
-0.2376101, 0.5009794, -0.541885, 0, 1, 0.4235294, 1,
-0.23713, -0.7541575, -2.868715, 0, 1, 0.4313726, 1,
-0.2366862, -0.7380688, -1.962645, 0, 1, 0.4352941, 1,
-0.2342288, 0.5651389, -0.3045042, 0, 1, 0.4431373, 1,
-0.2321334, -0.8395443, -2.711684, 0, 1, 0.4470588, 1,
-0.231469, 0.6003129, 0.4026306, 0, 1, 0.454902, 1,
-0.2306796, 1.654988, -1.507802, 0, 1, 0.4588235, 1,
-0.2293804, -0.2081407, -1.268599, 0, 1, 0.4666667, 1,
-0.2292906, 0.1607776, -0.7258914, 0, 1, 0.4705882, 1,
-0.2265619, 1.465047, 0.5704534, 0, 1, 0.4784314, 1,
-0.2194512, -0.4704554, -2.422806, 0, 1, 0.4823529, 1,
-0.2189329, 0.3400124, -1.290573, 0, 1, 0.4901961, 1,
-0.212485, 1.192377, -0.143528, 0, 1, 0.4941176, 1,
-0.2115495, 0.2701052, -2.012704, 0, 1, 0.5019608, 1,
-0.2006162, 1.185285, -0.07661947, 0, 1, 0.509804, 1,
-0.2003789, -1.785748, -2.075359, 0, 1, 0.5137255, 1,
-0.1974951, 1.927808, 0.4977735, 0, 1, 0.5215687, 1,
-0.1967862, 0.580267, -1.357433, 0, 1, 0.5254902, 1,
-0.1962253, 0.198749, -0.6007271, 0, 1, 0.5333334, 1,
-0.1858826, -0.1527155, -1.893044, 0, 1, 0.5372549, 1,
-0.1815503, -0.1969515, -2.63914, 0, 1, 0.5450981, 1,
-0.1811165, 1.162468, -0.6843531, 0, 1, 0.5490196, 1,
-0.1782274, 0.7450055, 0.7961721, 0, 1, 0.5568628, 1,
-0.1777547, -1.619588, -4.471167, 0, 1, 0.5607843, 1,
-0.1751285, 1.026765, -0.9244046, 0, 1, 0.5686275, 1,
-0.173858, 0.02984074, -0.8911898, 0, 1, 0.572549, 1,
-0.1718406, -1.482567, -2.903747, 0, 1, 0.5803922, 1,
-0.17109, -1.067181, -2.551337, 0, 1, 0.5843138, 1,
-0.1709817, 1.100662, 0.175712, 0, 1, 0.5921569, 1,
-0.1704998, -0.04316396, 0.06285764, 0, 1, 0.5960785, 1,
-0.1621204, -0.1552671, -1.949741, 0, 1, 0.6039216, 1,
-0.1615637, -0.6656778, -2.933155, 0, 1, 0.6117647, 1,
-0.1585196, -0.6911302, -2.548267, 0, 1, 0.6156863, 1,
-0.1547532, 1.144954, 1.299979, 0, 1, 0.6235294, 1,
-0.1472348, 1.51491, -0.6752278, 0, 1, 0.627451, 1,
-0.1461052, -0.9167909, -2.68184, 0, 1, 0.6352941, 1,
-0.1448364, -1.063128, -1.997377, 0, 1, 0.6392157, 1,
-0.1438306, 0.7359436, -1.19881, 0, 1, 0.6470588, 1,
-0.1414212, 0.1428926, -1.959114, 0, 1, 0.6509804, 1,
-0.136548, 0.539422, -1.313143, 0, 1, 0.6588235, 1,
-0.1330142, 0.1914027, -0.01786782, 0, 1, 0.6627451, 1,
-0.1280503, 1.826894, -0.5311153, 0, 1, 0.6705883, 1,
-0.1270405, 0.2742814, -2.187978, 0, 1, 0.6745098, 1,
-0.1226006, -0.5063509, -0.7285092, 0, 1, 0.682353, 1,
-0.1219881, -0.1070539, -3.638802, 0, 1, 0.6862745, 1,
-0.1178428, 2.107041, 0.6124896, 0, 1, 0.6941177, 1,
-0.1113441, -0.9852135, -3.027339, 0, 1, 0.7019608, 1,
-0.1110272, 1.762692, -0.3485509, 0, 1, 0.7058824, 1,
-0.1088504, 0.03847625, -3.018984, 0, 1, 0.7137255, 1,
-0.1084616, -0.2508277, -2.782788, 0, 1, 0.7176471, 1,
-0.1080672, -1.129559, -2.497242, 0, 1, 0.7254902, 1,
-0.1057726, 0.5646518, -1.094671, 0, 1, 0.7294118, 1,
-0.1017222, -0.2912975, -1.671939, 0, 1, 0.7372549, 1,
-0.09786896, -0.7433854, -2.802761, 0, 1, 0.7411765, 1,
-0.09681369, 0.4506659, -0.1029782, 0, 1, 0.7490196, 1,
-0.09588989, 0.3115063, -1.291119, 0, 1, 0.7529412, 1,
-0.09454266, -0.3181016, -3.835262, 0, 1, 0.7607843, 1,
-0.09224997, -0.3682609, -0.8338562, 0, 1, 0.7647059, 1,
-0.08991706, 0.4433347, -1.230789, 0, 1, 0.772549, 1,
-0.08801209, 1.372429, 0.2911828, 0, 1, 0.7764706, 1,
-0.08736779, -0.4905693, -1.359091, 0, 1, 0.7843137, 1,
-0.08729337, -0.2649251, -3.354337, 0, 1, 0.7882353, 1,
-0.08591067, -0.05718845, -2.725195, 0, 1, 0.7960784, 1,
-0.08281439, -0.4203854, -4.601614, 0, 1, 0.8039216, 1,
-0.07649014, 0.6906099, 0.02476223, 0, 1, 0.8078431, 1,
-0.07149726, -1.16806, -2.915174, 0, 1, 0.8156863, 1,
-0.06937839, -0.7093644, -3.319383, 0, 1, 0.8196079, 1,
-0.06647136, 0.1371733, -0.1425392, 0, 1, 0.827451, 1,
-0.06540725, -0.5870422, -1.655522, 0, 1, 0.8313726, 1,
-0.06454879, 0.6290042, 0.4470567, 0, 1, 0.8392157, 1,
-0.05990506, 0.03705584, -1.211363, 0, 1, 0.8431373, 1,
-0.05816299, 1.317817, -0.445176, 0, 1, 0.8509804, 1,
-0.05686122, 2.201263, 0.3712697, 0, 1, 0.854902, 1,
-0.05448801, 1.807978, 1.083748, 0, 1, 0.8627451, 1,
-0.05309723, -0.7448485, -1.519952, 0, 1, 0.8666667, 1,
-0.05180439, 1.064507, 0.008044784, 0, 1, 0.8745098, 1,
-0.05136599, -0.0164789, -0.9659832, 0, 1, 0.8784314, 1,
-0.05076733, -0.7531001, -2.723117, 0, 1, 0.8862745, 1,
-0.04344962, -0.6309057, -2.610725, 0, 1, 0.8901961, 1,
-0.04273189, -0.05831199, -3.040598, 0, 1, 0.8980392, 1,
-0.04258236, 2.07964, 1.513978, 0, 1, 0.9058824, 1,
-0.03254081, -0.9277008, -2.895135, 0, 1, 0.9098039, 1,
-0.03123721, 2.446117, 0.5108095, 0, 1, 0.9176471, 1,
-0.03066435, 1.571336, 1.152079, 0, 1, 0.9215686, 1,
-0.01449903, -0.7782046, -0.9492846, 0, 1, 0.9294118, 1,
-0.01436573, 0.5622928, 0.6649985, 0, 1, 0.9333333, 1,
-0.01317777, -1.231724, -2.221543, 0, 1, 0.9411765, 1,
-0.01163478, -0.792005, -4.097301, 0, 1, 0.945098, 1,
-0.01131847, 1.186158, 0.8913569, 0, 1, 0.9529412, 1,
-0.01095617, -1.647332, -3.083396, 0, 1, 0.9568627, 1,
-0.01038196, 0.5234287, 1.037372, 0, 1, 0.9647059, 1,
-0.009702197, 0.303255, -0.2757198, 0, 1, 0.9686275, 1,
-0.005845465, 0.3580565, -0.4364156, 0, 1, 0.9764706, 1,
-0.005346942, 0.8177615, 0.08528773, 0, 1, 0.9803922, 1,
-0.004294212, -0.8399568, -1.985134, 0, 1, 0.9882353, 1,
-0.003680059, 0.05208969, 1.220149, 0, 1, 0.9921569, 1,
-0.0008050479, 0.4019903, -0.09628337, 0, 1, 1, 1,
0.0003458344, 0.8194315, -0.246023, 0, 0.9921569, 1, 1,
0.0003478016, 0.03357735, 0.2797563, 0, 0.9882353, 1, 1,
0.00243, -0.7207598, 2.64247, 0, 0.9803922, 1, 1,
0.002901453, 0.7710098, -1.019528, 0, 0.9764706, 1, 1,
0.005737492, -1.654144, 4.128674, 0, 0.9686275, 1, 1,
0.006881736, 0.2709274, -0.8250166, 0, 0.9647059, 1, 1,
0.01067072, -0.2092995, 1.449783, 0, 0.9568627, 1, 1,
0.01160001, -2.163657, 3.497136, 0, 0.9529412, 1, 1,
0.01527345, -0.2591624, 3.874716, 0, 0.945098, 1, 1,
0.01559766, 0.8766657, 0.4104828, 0, 0.9411765, 1, 1,
0.01603749, 0.6310727, -1.079063, 0, 0.9333333, 1, 1,
0.02050103, 0.3694238, -0.5479033, 0, 0.9294118, 1, 1,
0.02534991, 0.4756287, -0.8931277, 0, 0.9215686, 1, 1,
0.02580494, 0.2101308, 1.184974, 0, 0.9176471, 1, 1,
0.02878381, -1.037088, 5.017549, 0, 0.9098039, 1, 1,
0.02970678, -0.7249571, 3.465204, 0, 0.9058824, 1, 1,
0.03005596, 0.3442756, 1.78028, 0, 0.8980392, 1, 1,
0.03157871, 1.391698, 0.4020049, 0, 0.8901961, 1, 1,
0.03206565, -1.387255, 1.181288, 0, 0.8862745, 1, 1,
0.03292499, -1.580654, 2.689333, 0, 0.8784314, 1, 1,
0.03417787, -0.2643598, 3.550701, 0, 0.8745098, 1, 1,
0.03451561, 1.383086, 0.8184456, 0, 0.8666667, 1, 1,
0.03801979, -1.410963, 2.865256, 0, 0.8627451, 1, 1,
0.03894137, -0.08379987, 4.536328, 0, 0.854902, 1, 1,
0.04189309, 2.258461, -0.83214, 0, 0.8509804, 1, 1,
0.04625919, 0.6324236, 0.4367695, 0, 0.8431373, 1, 1,
0.04633579, 3.388031, 0.8191931, 0, 0.8392157, 1, 1,
0.04925694, 0.3458385, 0.297246, 0, 0.8313726, 1, 1,
0.04935754, 1.163174, 0.6384991, 0, 0.827451, 1, 1,
0.0570626, 2.364339, -0.8979518, 0, 0.8196079, 1, 1,
0.05794845, 0.6152763, 0.02443161, 0, 0.8156863, 1, 1,
0.0591176, 1.305202, 0.1066305, 0, 0.8078431, 1, 1,
0.06226455, 0.682417, 0.3935401, 0, 0.8039216, 1, 1,
0.0622971, -0.8849841, 3.606731, 0, 0.7960784, 1, 1,
0.06924036, 1.704014, 1.339688, 0, 0.7882353, 1, 1,
0.07067937, 1.856098, 0.284097, 0, 0.7843137, 1, 1,
0.07081263, 0.3052886, 0.5362052, 0, 0.7764706, 1, 1,
0.07220592, -1.021871, 2.519991, 0, 0.772549, 1, 1,
0.07516144, -0.5413646, 1.695213, 0, 0.7647059, 1, 1,
0.07731798, -2.203878, 2.788292, 0, 0.7607843, 1, 1,
0.08191943, 1.077936, 0.6372348, 0, 0.7529412, 1, 1,
0.08327373, -0.1196199, 3.768901, 0, 0.7490196, 1, 1,
0.08428244, -0.288546, 3.73805, 0, 0.7411765, 1, 1,
0.08503161, -0.2551769, 3.296136, 0, 0.7372549, 1, 1,
0.08703165, -0.8008764, 2.283658, 0, 0.7294118, 1, 1,
0.09198759, 0.2746627, 0.357824, 0, 0.7254902, 1, 1,
0.09378821, 0.1083243, -0.8161249, 0, 0.7176471, 1, 1,
0.09624039, -0.3112961, 3.62383, 0, 0.7137255, 1, 1,
0.09983305, -0.4910075, 4.899709, 0, 0.7058824, 1, 1,
0.101712, -2.414106, 3.689574, 0, 0.6980392, 1, 1,
0.1048069, -0.06838393, 0.1087007, 0, 0.6941177, 1, 1,
0.1052024, -0.2338339, 2.965362, 0, 0.6862745, 1, 1,
0.1064826, 0.2161987, -0.8394593, 0, 0.682353, 1, 1,
0.107874, 0.8177403, 1.341733, 0, 0.6745098, 1, 1,
0.1105075, -0.689711, 2.49071, 0, 0.6705883, 1, 1,
0.113374, -0.6857024, 2.25719, 0, 0.6627451, 1, 1,
0.1159059, -0.3050683, 2.376009, 0, 0.6588235, 1, 1,
0.1199394, -1.334867, 3.418955, 0, 0.6509804, 1, 1,
0.122567, -2.290853, 1.874348, 0, 0.6470588, 1, 1,
0.1287723, -1.563031, 2.872467, 0, 0.6392157, 1, 1,
0.1304683, -1.39491, 3.757459, 0, 0.6352941, 1, 1,
0.1319329, -0.6438711, 0.6510681, 0, 0.627451, 1, 1,
0.132352, 0.7060444, 1.808297, 0, 0.6235294, 1, 1,
0.1335832, 0.3038083, 0.631424, 0, 0.6156863, 1, 1,
0.1370639, -0.3536564, 2.788512, 0, 0.6117647, 1, 1,
0.1377851, 1.141464, 1.103426, 0, 0.6039216, 1, 1,
0.1380742, -0.1501114, 2.240932, 0, 0.5960785, 1, 1,
0.1383454, -0.1784844, 2.470995, 0, 0.5921569, 1, 1,
0.1385457, -1.019146, 4.090171, 0, 0.5843138, 1, 1,
0.1385823, 0.7243208, 1.796931, 0, 0.5803922, 1, 1,
0.1386077, -0.9387143, 2.080079, 0, 0.572549, 1, 1,
0.1394404, 0.08081087, 1.571331, 0, 0.5686275, 1, 1,
0.1395941, 0.6019248, -0.4332768, 0, 0.5607843, 1, 1,
0.1402758, -1.568902, 2.170384, 0, 0.5568628, 1, 1,
0.1407009, -0.124348, 4.054606, 0, 0.5490196, 1, 1,
0.1420645, -1.64155, 3.844062, 0, 0.5450981, 1, 1,
0.1440601, -0.9402829, 3.139541, 0, 0.5372549, 1, 1,
0.1588411, -0.1000508, 2.042888, 0, 0.5333334, 1, 1,
0.1595462, -0.02062821, 0.4001909, 0, 0.5254902, 1, 1,
0.1616663, 0.9195971, -0.7031992, 0, 0.5215687, 1, 1,
0.1633434, 1.50856, -0.3002579, 0, 0.5137255, 1, 1,
0.1638258, 1.777213, 1.780348, 0, 0.509804, 1, 1,
0.168258, 0.2904153, 2.047171, 0, 0.5019608, 1, 1,
0.1685758, -1.574707, 3.519056, 0, 0.4941176, 1, 1,
0.1700977, 0.4320801, -0.781222, 0, 0.4901961, 1, 1,
0.1718577, -0.7670341, 2.91998, 0, 0.4823529, 1, 1,
0.1735769, 0.92203, -0.2506896, 0, 0.4784314, 1, 1,
0.178587, -0.6567292, 4.633816, 0, 0.4705882, 1, 1,
0.1792316, -1.270711, 2.849153, 0, 0.4666667, 1, 1,
0.1883629, 0.2256203, 0.9212565, 0, 0.4588235, 1, 1,
0.1888804, -1.14874, 3.303747, 0, 0.454902, 1, 1,
0.1893952, -1.08411, 1.390103, 0, 0.4470588, 1, 1,
0.1905104, 0.8203173, 0.3494543, 0, 0.4431373, 1, 1,
0.1950097, -0.3043105, 1.642074, 0, 0.4352941, 1, 1,
0.19844, -1.187006, 4.85229, 0, 0.4313726, 1, 1,
0.1988324, 0.4787567, 0.0128533, 0, 0.4235294, 1, 1,
0.1995616, -0.4886474, 3.202651, 0, 0.4196078, 1, 1,
0.1997402, -0.4851223, 2.932333, 0, 0.4117647, 1, 1,
0.2032293, 0.9549569, 1.012508, 0, 0.4078431, 1, 1,
0.2115737, 1.132128, 0.8953213, 0, 0.4, 1, 1,
0.2125349, -1.858646, 2.726905, 0, 0.3921569, 1, 1,
0.2130463, 0.2810243, -0.2916882, 0, 0.3882353, 1, 1,
0.2191841, 1.86815, 0.498824, 0, 0.3803922, 1, 1,
0.2210677, 1.481498, -0.3407878, 0, 0.3764706, 1, 1,
0.2236336, 0.5350613, 0.3979961, 0, 0.3686275, 1, 1,
0.2282283, -1.409544, 3.702545, 0, 0.3647059, 1, 1,
0.2286141, -0.5185039, 2.299573, 0, 0.3568628, 1, 1,
0.2380501, 1.772733, 0.29141, 0, 0.3529412, 1, 1,
0.2421783, 1.457976, -0.5894186, 0, 0.345098, 1, 1,
0.2468597, 0.61661, 0.5806703, 0, 0.3411765, 1, 1,
0.2481706, 0.7534549, 1.087523, 0, 0.3333333, 1, 1,
0.2485552, 0.006194845, -0.1990253, 0, 0.3294118, 1, 1,
0.251772, -0.5036717, 2.380663, 0, 0.3215686, 1, 1,
0.2611417, 0.6379749, 2.090378, 0, 0.3176471, 1, 1,
0.2647704, -0.2367471, 1.703585, 0, 0.3098039, 1, 1,
0.2666887, 0.8407526, 2.504686, 0, 0.3058824, 1, 1,
0.267801, -1.463096, 3.538481, 0, 0.2980392, 1, 1,
0.2711005, 0.7586452, 1.277915, 0, 0.2901961, 1, 1,
0.2762322, 0.2540847, 4.809418, 0, 0.2862745, 1, 1,
0.2770608, -0.1562906, 2.369879, 0, 0.2784314, 1, 1,
0.2781248, -1.137132, 3.815669, 0, 0.2745098, 1, 1,
0.2782279, 1.279171, 1.01661, 0, 0.2666667, 1, 1,
0.2809431, 1.639642, 1.419188, 0, 0.2627451, 1, 1,
0.2912459, -0.5086192, 1.960489, 0, 0.254902, 1, 1,
0.2963931, 1.173104, 0.2239216, 0, 0.2509804, 1, 1,
0.2996536, -1.013571, 2.166337, 0, 0.2431373, 1, 1,
0.3000098, -1.246633, 2.871065, 0, 0.2392157, 1, 1,
0.3022594, 0.6049464, 0.3048729, 0, 0.2313726, 1, 1,
0.303147, 0.03445698, 3.005152, 0, 0.227451, 1, 1,
0.3057638, 1.173812, 0.7973079, 0, 0.2196078, 1, 1,
0.3059215, -1.095618, 3.283985, 0, 0.2156863, 1, 1,
0.3147496, 0.3406097, 0.4651711, 0, 0.2078431, 1, 1,
0.3161191, -1.102801, 3.371165, 0, 0.2039216, 1, 1,
0.3242703, -1.748985, 2.302905, 0, 0.1960784, 1, 1,
0.3254157, 0.3605327, 0.8097034, 0, 0.1882353, 1, 1,
0.3335907, -1.61512, 2.949049, 0, 0.1843137, 1, 1,
0.3368846, -0.5869085, 3.353903, 0, 0.1764706, 1, 1,
0.3427621, 0.4438574, 1.178706, 0, 0.172549, 1, 1,
0.3526776, -1.830688, 2.440884, 0, 0.1647059, 1, 1,
0.3533756, 0.9374802, 0.5878758, 0, 0.1607843, 1, 1,
0.3542171, 0.2645547, 1.367869, 0, 0.1529412, 1, 1,
0.3545048, -0.5654086, 1.132004, 0, 0.1490196, 1, 1,
0.3550553, 0.02071449, 2.871831, 0, 0.1411765, 1, 1,
0.3565758, 0.3905877, 0.2700814, 0, 0.1372549, 1, 1,
0.3594586, -0.4689254, 1.135814, 0, 0.1294118, 1, 1,
0.3613088, 0.02162265, 1.523367, 0, 0.1254902, 1, 1,
0.3615212, -0.3253183, 3.410103, 0, 0.1176471, 1, 1,
0.3632212, 1.703549, 0.7639629, 0, 0.1137255, 1, 1,
0.3669231, -0.6040832, 2.499044, 0, 0.1058824, 1, 1,
0.3692732, 0.2162281, -0.8571327, 0, 0.09803922, 1, 1,
0.3699132, -0.4478444, 3.534265, 0, 0.09411765, 1, 1,
0.3711106, 1.016392, 0.3196953, 0, 0.08627451, 1, 1,
0.3743146, 0.07091571, 0.926124, 0, 0.08235294, 1, 1,
0.3785465, -0.8553045, 3.900273, 0, 0.07450981, 1, 1,
0.3788571, -0.4862253, 2.079294, 0, 0.07058824, 1, 1,
0.3846048, -2.490427, 3.845099, 0, 0.0627451, 1, 1,
0.3895746, 1.984395, 0.02848672, 0, 0.05882353, 1, 1,
0.3902135, -1.041339, 2.173866, 0, 0.05098039, 1, 1,
0.3914093, 0.6479459, 0.8068168, 0, 0.04705882, 1, 1,
0.3941897, 0.3318341, 0.6502786, 0, 0.03921569, 1, 1,
0.3950289, 0.9788212, 0.4158963, 0, 0.03529412, 1, 1,
0.4017143, -1.279497, 2.759092, 0, 0.02745098, 1, 1,
0.4036577, 0.415539, -0.9737867, 0, 0.02352941, 1, 1,
0.4077193, -1.181104, 1.406345, 0, 0.01568628, 1, 1,
0.4083433, 1.057991, 0.2091408, 0, 0.01176471, 1, 1,
0.4137678, 0.5273317, -0.4947496, 0, 0.003921569, 1, 1,
0.420372, 0.3275321, 0.4583363, 0.003921569, 0, 1, 1,
0.4217868, 0.2222021, 1.728185, 0.007843138, 0, 1, 1,
0.4252811, 0.09299757, 2.566411, 0.01568628, 0, 1, 1,
0.4330904, 0.5667461, 1.251019, 0.01960784, 0, 1, 1,
0.4337084, 0.3725597, 1.089721, 0.02745098, 0, 1, 1,
0.4349217, 0.9100893, -0.1890457, 0.03137255, 0, 1, 1,
0.4366212, -0.1355111, 2.630646, 0.03921569, 0, 1, 1,
0.4383846, -1.335923, 2.847182, 0.04313726, 0, 1, 1,
0.4398501, 1.125031, 0.01300942, 0.05098039, 0, 1, 1,
0.4420517, -0.5285244, 2.257884, 0.05490196, 0, 1, 1,
0.4477603, 0.8602641, 0.8254319, 0.0627451, 0, 1, 1,
0.4503519, -0.2351728, 0.538554, 0.06666667, 0, 1, 1,
0.45128, -0.8701071, 1.807687, 0.07450981, 0, 1, 1,
0.4539195, 0.8295283, -1.37625, 0.07843138, 0, 1, 1,
0.459289, 1.086853, 1.51885, 0.08627451, 0, 1, 1,
0.4646134, -0.2140703, 0.6444589, 0.09019608, 0, 1, 1,
0.4679872, -1.064677, 3.14217, 0.09803922, 0, 1, 1,
0.4688479, -0.3499272, 3.017439, 0.1058824, 0, 1, 1,
0.4699557, 1.28501, -0.1186003, 0.1098039, 0, 1, 1,
0.4710641, -0.3029427, 2.029173, 0.1176471, 0, 1, 1,
0.4747319, 1.424385, -0.4685205, 0.1215686, 0, 1, 1,
0.4758351, 0.7080101, 2.478977, 0.1294118, 0, 1, 1,
0.4774121, 1.357009, -0.1241476, 0.1333333, 0, 1, 1,
0.4837388, 1.170157, -0.3245656, 0.1411765, 0, 1, 1,
0.4843272, -1.303775, 2.124799, 0.145098, 0, 1, 1,
0.4851794, 0.6330061, 0.1008115, 0.1529412, 0, 1, 1,
0.4859162, 0.9223597, -1.34377, 0.1568628, 0, 1, 1,
0.4867885, -0.7623446, 3.59736, 0.1647059, 0, 1, 1,
0.4903403, -1.682742, 1.967751, 0.1686275, 0, 1, 1,
0.4929159, 0.4154156, 2.053858, 0.1764706, 0, 1, 1,
0.4943236, -0.6231797, 1.522643, 0.1803922, 0, 1, 1,
0.4975362, -0.3477776, 3.118559, 0.1882353, 0, 1, 1,
0.4994901, 1.047521, 0.9680501, 0.1921569, 0, 1, 1,
0.5086256, 0.1245943, 0.8425958, 0.2, 0, 1, 1,
0.5106414, -1.662256, 3.124723, 0.2078431, 0, 1, 1,
0.5206494, 1.408866, -0.1666295, 0.2117647, 0, 1, 1,
0.5211868, 0.5502286, -1.448519, 0.2196078, 0, 1, 1,
0.5218095, -0.997515, 2.429495, 0.2235294, 0, 1, 1,
0.5287852, -0.3891335, 3.161597, 0.2313726, 0, 1, 1,
0.5288367, 1.605162, -0.2698093, 0.2352941, 0, 1, 1,
0.536311, -0.9195907, 3.743287, 0.2431373, 0, 1, 1,
0.5418327, 2.159271, 0.1086944, 0.2470588, 0, 1, 1,
0.5419971, 1.320938, 2.119076, 0.254902, 0, 1, 1,
0.5440027, -2.610286, 1.256017, 0.2588235, 0, 1, 1,
0.5444663, -1.328833, 3.971417, 0.2666667, 0, 1, 1,
0.5458151, -1.925958, 2.138664, 0.2705882, 0, 1, 1,
0.5560277, 0.1322401, 0.730463, 0.2784314, 0, 1, 1,
0.5568249, -0.8708751, 2.684536, 0.282353, 0, 1, 1,
0.5617692, -0.4168572, 2.384093, 0.2901961, 0, 1, 1,
0.5633522, 0.5796132, 1.411689, 0.2941177, 0, 1, 1,
0.5645418, 0.09772629, 0.07467327, 0.3019608, 0, 1, 1,
0.5708572, 0.159091, 0.7255142, 0.3098039, 0, 1, 1,
0.5724375, 0.6175007, 0.338693, 0.3137255, 0, 1, 1,
0.5751718, -1.298877, 3.913542, 0.3215686, 0, 1, 1,
0.5816568, 0.2779295, 0.6363131, 0.3254902, 0, 1, 1,
0.590388, 0.2133438, 2.036273, 0.3333333, 0, 1, 1,
0.5943378, 0.5703903, 1.40827, 0.3372549, 0, 1, 1,
0.5974224, 0.4280904, -0.4961389, 0.345098, 0, 1, 1,
0.5978848, -0.8489574, 3.608726, 0.3490196, 0, 1, 1,
0.6003281, 0.3876107, 1.509511, 0.3568628, 0, 1, 1,
0.6006169, -0.6194692, 2.648161, 0.3607843, 0, 1, 1,
0.6040193, -0.6628853, 0.5901718, 0.3686275, 0, 1, 1,
0.6173816, -1.375092, 2.240294, 0.372549, 0, 1, 1,
0.6213946, -1.454448, 3.45804, 0.3803922, 0, 1, 1,
0.6244544, -0.9030761, 1.582865, 0.3843137, 0, 1, 1,
0.6272385, 1.0622, -0.3011641, 0.3921569, 0, 1, 1,
0.6282104, -0.645672, 1.143016, 0.3960784, 0, 1, 1,
0.6294721, 2.712586, 0.4977031, 0.4039216, 0, 1, 1,
0.6304316, -1.466567, 3.198049, 0.4117647, 0, 1, 1,
0.6360627, 1.030078, -0.24305, 0.4156863, 0, 1, 1,
0.6480091, -0.0900277, 3.314313, 0.4235294, 0, 1, 1,
0.6481369, -0.3793438, 1.048352, 0.427451, 0, 1, 1,
0.6507826, 0.4791622, -0.6301031, 0.4352941, 0, 1, 1,
0.6510751, 0.3727764, 0.5907758, 0.4392157, 0, 1, 1,
0.6663425, -0.1541518, 0.9711895, 0.4470588, 0, 1, 1,
0.6789822, 0.7261471, -0.5335984, 0.4509804, 0, 1, 1,
0.6808067, -0.03407506, 0.3039352, 0.4588235, 0, 1, 1,
0.6823035, -0.3632558, 2.751764, 0.4627451, 0, 1, 1,
0.6840478, -0.1376373, 0.9614785, 0.4705882, 0, 1, 1,
0.6845028, -0.7256547, 2.157296, 0.4745098, 0, 1, 1,
0.6880127, -0.04356319, 1.445392, 0.4823529, 0, 1, 1,
0.6923817, -1.828042, 4.283617, 0.4862745, 0, 1, 1,
0.6940066, 0.3406065, 1.05949, 0.4941176, 0, 1, 1,
0.6964285, -0.2261369, 2.490999, 0.5019608, 0, 1, 1,
0.6993066, -0.8139589, 1.886743, 0.5058824, 0, 1, 1,
0.7012369, 0.6929109, 1.787515, 0.5137255, 0, 1, 1,
0.701645, -0.0884922, 2.37818, 0.5176471, 0, 1, 1,
0.7042271, 0.8983371, 0.6219232, 0.5254902, 0, 1, 1,
0.7118176, 0.5121092, -0.05540607, 0.5294118, 0, 1, 1,
0.7165983, 0.2898878, 1.710608, 0.5372549, 0, 1, 1,
0.7183728, 0.6271045, -0.2329979, 0.5411765, 0, 1, 1,
0.720662, -0.07744806, 1.615245, 0.5490196, 0, 1, 1,
0.7220417, 0.6679006, -0.5526916, 0.5529412, 0, 1, 1,
0.72491, 0.4847817, 0.7113465, 0.5607843, 0, 1, 1,
0.7260562, 0.03401121, 0.8255444, 0.5647059, 0, 1, 1,
0.7269185, -0.03378742, 1.659766, 0.572549, 0, 1, 1,
0.7294152, 0.3088455, 2.171471, 0.5764706, 0, 1, 1,
0.7327757, -0.8113478, 0.3690357, 0.5843138, 0, 1, 1,
0.7344326, -1.560915, 1.886882, 0.5882353, 0, 1, 1,
0.7354207, -0.2050117, 2.154747, 0.5960785, 0, 1, 1,
0.7399304, 0.09214152, 2.751123, 0.6039216, 0, 1, 1,
0.756185, 1.619293, 1.261185, 0.6078432, 0, 1, 1,
0.7568508, 0.05219831, 2.521108, 0.6156863, 0, 1, 1,
0.76084, 0.8937705, 0.5442856, 0.6196079, 0, 1, 1,
0.7614166, -0.6595579, 3.433653, 0.627451, 0, 1, 1,
0.7675782, -0.3988838, 1.890502, 0.6313726, 0, 1, 1,
0.7735023, -0.4402047, 1.357704, 0.6392157, 0, 1, 1,
0.7759823, -0.3212605, 2.193731, 0.6431373, 0, 1, 1,
0.7762475, 0.1027465, 2.073627, 0.6509804, 0, 1, 1,
0.7762724, -0.5696615, 1.626911, 0.654902, 0, 1, 1,
0.776684, -1.089006, 3.33711, 0.6627451, 0, 1, 1,
0.7775357, -0.9256393, 1.12239, 0.6666667, 0, 1, 1,
0.7779226, 1.413041, -0.1440825, 0.6745098, 0, 1, 1,
0.779392, 0.6639982, 0.7124529, 0.6784314, 0, 1, 1,
0.781264, 0.0702067, 2.719174, 0.6862745, 0, 1, 1,
0.7845545, -1.112383, 3.330701, 0.6901961, 0, 1, 1,
0.7853377, 0.3594421, 0.04849974, 0.6980392, 0, 1, 1,
0.787436, 0.9783752, -0.9897087, 0.7058824, 0, 1, 1,
0.7956208, -0.5243065, 2.603593, 0.7098039, 0, 1, 1,
0.7981925, 1.743284, 0.6659811, 0.7176471, 0, 1, 1,
0.7995464, -0.4819192, 3.286953, 0.7215686, 0, 1, 1,
0.7995636, -0.5844959, 1.151384, 0.7294118, 0, 1, 1,
0.8077801, 0.5172259, 0.6648579, 0.7333333, 0, 1, 1,
0.8124601, 0.9583118, 0.9256757, 0.7411765, 0, 1, 1,
0.8138447, 0.1540314, 1.689096, 0.7450981, 0, 1, 1,
0.8190573, 0.917074, -0.6451376, 0.7529412, 0, 1, 1,
0.8282327, 0.5363128, 0.5233587, 0.7568628, 0, 1, 1,
0.8329476, -0.639519, 1.765947, 0.7647059, 0, 1, 1,
0.8334366, 0.2569847, 0.4681635, 0.7686275, 0, 1, 1,
0.8429548, -0.3719411, 2.336209, 0.7764706, 0, 1, 1,
0.8475383, 0.1514458, 3.564858, 0.7803922, 0, 1, 1,
0.8536041, -1.483146, 4.968534, 0.7882353, 0, 1, 1,
0.8553236, 1.338744, 1.858738, 0.7921569, 0, 1, 1,
0.8624639, -1.176766, 1.521275, 0.8, 0, 1, 1,
0.8641125, -0.4382086, 3.71026, 0.8078431, 0, 1, 1,
0.8660604, -0.2509894, 2.199658, 0.8117647, 0, 1, 1,
0.868073, 0.03459464, 1.499783, 0.8196079, 0, 1, 1,
0.8708512, 0.768788, 1.449705, 0.8235294, 0, 1, 1,
0.8708792, 0.2244805, 0.2635971, 0.8313726, 0, 1, 1,
0.8731092, 0.7334848, 0.7126788, 0.8352941, 0, 1, 1,
0.8782879, 0.431371, 1.532549, 0.8431373, 0, 1, 1,
0.8791825, -0.7420676, 1.626265, 0.8470588, 0, 1, 1,
0.8809965, -0.0375966, 2.371994, 0.854902, 0, 1, 1,
0.8814658, 1.447877, -0.3711281, 0.8588235, 0, 1, 1,
0.888099, 0.74945, 2.209546, 0.8666667, 0, 1, 1,
0.8963958, -1.14259, 2.191979, 0.8705882, 0, 1, 1,
0.8975183, -0.4371011, 1.617492, 0.8784314, 0, 1, 1,
0.9014426, 1.398446, 1.17023, 0.8823529, 0, 1, 1,
0.9054412, -0.236692, 1.595229, 0.8901961, 0, 1, 1,
0.9138762, 0.8295278, 1.971776, 0.8941177, 0, 1, 1,
0.9215397, 0.6313896, 1.046915, 0.9019608, 0, 1, 1,
0.9225199, -0.0678646, 2.043386, 0.9098039, 0, 1, 1,
0.9277624, -1.552028, 3.071798, 0.9137255, 0, 1, 1,
0.9284472, -1.850922, 0.1446527, 0.9215686, 0, 1, 1,
0.9362345, 0.7060527, -0.5820037, 0.9254902, 0, 1, 1,
0.9373817, 0.08359952, 1.485804, 0.9333333, 0, 1, 1,
0.9422349, 0.07137629, 1.188119, 0.9372549, 0, 1, 1,
0.9445174, -1.661353, 3.114289, 0.945098, 0, 1, 1,
0.9554358, -0.07978771, 1.049439, 0.9490196, 0, 1, 1,
0.9603433, -1.078988, 3.867013, 0.9568627, 0, 1, 1,
0.9609308, -1.280051, 2.790051, 0.9607843, 0, 1, 1,
0.9653001, -0.5508739, 2.400544, 0.9686275, 0, 1, 1,
0.972913, 0.7339296, 1.267998, 0.972549, 0, 1, 1,
0.9835169, -1.088873, 3.124021, 0.9803922, 0, 1, 1,
0.9874724, -0.7140163, 2.534171, 0.9843137, 0, 1, 1,
0.9882318, -0.0312221, 0.9934232, 0.9921569, 0, 1, 1,
0.9972469, -0.1652501, 0.8855693, 0.9960784, 0, 1, 1,
1.002339, -0.2148194, 0.7784771, 1, 0, 0.9960784, 1,
1.005453, 0.5726777, 1.609228, 1, 0, 0.9882353, 1,
1.007177, -1.481234, 2.049357, 1, 0, 0.9843137, 1,
1.01127, -0.8631369, 2.286031, 1, 0, 0.9764706, 1,
1.014998, -0.1843333, 2.738641, 1, 0, 0.972549, 1,
1.018508, -1.14653, 4.200605, 1, 0, 0.9647059, 1,
1.018804, -1.832132, 2.169264, 1, 0, 0.9607843, 1,
1.025663, 0.06438306, 2.052409, 1, 0, 0.9529412, 1,
1.040139, 0.6243501, 2.198155, 1, 0, 0.9490196, 1,
1.040335, 0.09408421, 2.140886, 1, 0, 0.9411765, 1,
1.040531, -0.2284113, 3.08618, 1, 0, 0.9372549, 1,
1.04653, 0.2214694, 1.232789, 1, 0, 0.9294118, 1,
1.053281, 0.01577849, 2.420746, 1, 0, 0.9254902, 1,
1.057781, 1.62032, 1.06925, 1, 0, 0.9176471, 1,
1.067697, 0.3612362, 0.4216159, 1, 0, 0.9137255, 1,
1.06883, 1.12551, 2.416543, 1, 0, 0.9058824, 1,
1.068915, 0.1330513, 1.738411, 1, 0, 0.9019608, 1,
1.07021, 0.3113328, 1.065773, 1, 0, 0.8941177, 1,
1.070897, -1.147065, 1.751433, 1, 0, 0.8862745, 1,
1.071388, 0.3523566, 3.145504, 1, 0, 0.8823529, 1,
1.082702, -0.2634573, 1.331116, 1, 0, 0.8745098, 1,
1.085655, -0.5930309, 1.651862, 1, 0, 0.8705882, 1,
1.089365, -0.05333926, 0.169794, 1, 0, 0.8627451, 1,
1.091038, -0.1901528, 2.203315, 1, 0, 0.8588235, 1,
1.092847, 1.168704, 1.013962, 1, 0, 0.8509804, 1,
1.09494, -1.852469, 1.196164, 1, 0, 0.8470588, 1,
1.096031, 1.641332, 0.002486332, 1, 0, 0.8392157, 1,
1.099215, -1.10904, 2.189172, 1, 0, 0.8352941, 1,
1.104655, -0.3415256, 2.604972, 1, 0, 0.827451, 1,
1.136746, 0.07049758, 0.6094458, 1, 0, 0.8235294, 1,
1.138135, -0.2356899, 1.267056, 1, 0, 0.8156863, 1,
1.141172, 0.875743, -1.802116, 1, 0, 0.8117647, 1,
1.144619, -0.8648844, 3.054549, 1, 0, 0.8039216, 1,
1.146544, -1.514634, 2.356407, 1, 0, 0.7960784, 1,
1.149993, 0.1461118, 0.8860442, 1, 0, 0.7921569, 1,
1.150077, -0.969579, 2.989371, 1, 0, 0.7843137, 1,
1.15792, -1.017628, 1.380157, 1, 0, 0.7803922, 1,
1.158151, -1.28303, 4.154905, 1, 0, 0.772549, 1,
1.158453, 1.15836, 1.407759, 1, 0, 0.7686275, 1,
1.163047, 0.9357513, 1.442144, 1, 0, 0.7607843, 1,
1.163396, -1.985078, 3.849201, 1, 0, 0.7568628, 1,
1.169439, -0.4612562, 2.133068, 1, 0, 0.7490196, 1,
1.17635, -0.5567217, 1.507819, 1, 0, 0.7450981, 1,
1.178959, -0.1204566, 1.008405, 1, 0, 0.7372549, 1,
1.180458, 1.02005, 1.106993, 1, 0, 0.7333333, 1,
1.183261, 0.7630386, -0.1788584, 1, 0, 0.7254902, 1,
1.196714, 0.4984908, 1.118756, 1, 0, 0.7215686, 1,
1.200682, -0.5647968, 1.036295, 1, 0, 0.7137255, 1,
1.202203, -0.5465662, 1.476538, 1, 0, 0.7098039, 1,
1.205765, 0.7309756, 1.812905, 1, 0, 0.7019608, 1,
1.208599, -0.581735, 0.8770909, 1, 0, 0.6941177, 1,
1.211725, 0.2714307, 2.497642, 1, 0, 0.6901961, 1,
1.234566, 1.045191, 0.8627331, 1, 0, 0.682353, 1,
1.23801, 1.052969, 2.073263, 1, 0, 0.6784314, 1,
1.245927, -0.7534498, 4.097126, 1, 0, 0.6705883, 1,
1.246052, -0.3307537, 0.2455197, 1, 0, 0.6666667, 1,
1.249295, -0.535453, 0.7138808, 1, 0, 0.6588235, 1,
1.249586, 1.745435, 0.1141671, 1, 0, 0.654902, 1,
1.254956, -1.002861, 1.76225, 1, 0, 0.6470588, 1,
1.25929, -0.7041724, 3.547185, 1, 0, 0.6431373, 1,
1.265228, 1.543444, 0.8918813, 1, 0, 0.6352941, 1,
1.267355, 1.31692, 0.1575044, 1, 0, 0.6313726, 1,
1.277172, 0.2740543, 1.140273, 1, 0, 0.6235294, 1,
1.283734, 1.247466, 2.230885, 1, 0, 0.6196079, 1,
1.284332, -0.8495791, 0.8339343, 1, 0, 0.6117647, 1,
1.291581, -0.2975634, 2.14158, 1, 0, 0.6078432, 1,
1.294824, 0.3746326, 1.573575, 1, 0, 0.6, 1,
1.298181, 0.9059762, 1.077718, 1, 0, 0.5921569, 1,
1.301749, 0.5151662, -0.1351455, 1, 0, 0.5882353, 1,
1.303145, -1.58316, 2.669367, 1, 0, 0.5803922, 1,
1.307816, 1.283228, 1.761975, 1, 0, 0.5764706, 1,
1.317804, -0.5758977, 3.226167, 1, 0, 0.5686275, 1,
1.317898, 0.2161399, 1.685557, 1, 0, 0.5647059, 1,
1.320659, -0.9388413, 1.566997, 1, 0, 0.5568628, 1,
1.322507, 2.00322, -0.1863541, 1, 0, 0.5529412, 1,
1.332457, 2.028794, -0.1363831, 1, 0, 0.5450981, 1,
1.33914, 0.4052173, 1.724527, 1, 0, 0.5411765, 1,
1.343792, -1.111708, 3.416665, 1, 0, 0.5333334, 1,
1.348479, -2.378069, 3.169852, 1, 0, 0.5294118, 1,
1.350796, 0.2976123, 2.104327, 1, 0, 0.5215687, 1,
1.366892, -0.7466878, 1.908533, 1, 0, 0.5176471, 1,
1.383945, -0.554326, 2.558745, 1, 0, 0.509804, 1,
1.399833, 0.2383505, 1.268012, 1, 0, 0.5058824, 1,
1.400574, -1.110515, 1.038848, 1, 0, 0.4980392, 1,
1.405847, 1.034153, 0.3001851, 1, 0, 0.4901961, 1,
1.407647, 2.463719, 0.1883071, 1, 0, 0.4862745, 1,
1.407988, -0.7185713, 1.863449, 1, 0, 0.4784314, 1,
1.439479, 0.895927, 0.4737712, 1, 0, 0.4745098, 1,
1.452666, 0.7833697, 0.07735918, 1, 0, 0.4666667, 1,
1.48017, 0.6349615, -0.7470939, 1, 0, 0.4627451, 1,
1.482029, 0.4798096, 0.1375827, 1, 0, 0.454902, 1,
1.486892, -0.5346987, 2.669197, 1, 0, 0.4509804, 1,
1.488778, 0.3063046, 2.015228, 1, 0, 0.4431373, 1,
1.494693, -0.4038418, 1.6731, 1, 0, 0.4392157, 1,
1.503488, 0.1270283, 4.253457, 1, 0, 0.4313726, 1,
1.521305, -1.893225, 2.386204, 1, 0, 0.427451, 1,
1.52285, 0.4900438, 0.3028194, 1, 0, 0.4196078, 1,
1.526048, -0.2542342, 0.7626282, 1, 0, 0.4156863, 1,
1.531563, -0.07223119, 2.431109, 1, 0, 0.4078431, 1,
1.532032, -1.329745, 2.884924, 1, 0, 0.4039216, 1,
1.550971, 1.30269, 1.657461, 1, 0, 0.3960784, 1,
1.551308, 0.4588073, 1.526055, 1, 0, 0.3882353, 1,
1.553369, 0.8820673, 2.394549, 1, 0, 0.3843137, 1,
1.588108, -0.09582438, 0.9986185, 1, 0, 0.3764706, 1,
1.593643, -0.2078595, 2.382662, 1, 0, 0.372549, 1,
1.618787, -0.4903575, 1.892366, 1, 0, 0.3647059, 1,
1.620872, 0.03357925, 1.175971, 1, 0, 0.3607843, 1,
1.621337, 0.9934705, 1.020821, 1, 0, 0.3529412, 1,
1.644984, 1.132223, -0.7570289, 1, 0, 0.3490196, 1,
1.646262, -0.4243067, 0.8176571, 1, 0, 0.3411765, 1,
1.650644, -0.4478564, 1.433459, 1, 0, 0.3372549, 1,
1.653343, 1.346626, 0.6141943, 1, 0, 0.3294118, 1,
1.657085, -0.2416073, 1.620444, 1, 0, 0.3254902, 1,
1.667794, 2.127596, -2.07513, 1, 0, 0.3176471, 1,
1.670873, -0.9957407, 2.713771, 1, 0, 0.3137255, 1,
1.677641, -0.8971729, 2.801671, 1, 0, 0.3058824, 1,
1.694291, 1.662704, 1.581731, 1, 0, 0.2980392, 1,
1.704285, -0.6623745, 2.389067, 1, 0, 0.2941177, 1,
1.707411, -0.0727677, 0.9084002, 1, 0, 0.2862745, 1,
1.71708, 2.516064, -0.2210858, 1, 0, 0.282353, 1,
1.719076, -1.023778, 1.732351, 1, 0, 0.2745098, 1,
1.719501, 0.09170911, 2.635119, 1, 0, 0.2705882, 1,
1.722519, 0.9967045, 0.9145215, 1, 0, 0.2627451, 1,
1.726247, 0.3469895, -0.5794088, 1, 0, 0.2588235, 1,
1.754629, -1.241482, 2.424077, 1, 0, 0.2509804, 1,
1.756957, 0.06933887, 1.678449, 1, 0, 0.2470588, 1,
1.767099, -1.849765, 3.173277, 1, 0, 0.2392157, 1,
1.779746, -0.117434, 0.8702011, 1, 0, 0.2352941, 1,
1.780031, -0.02374768, 2.633288, 1, 0, 0.227451, 1,
1.786686, 2.174891, 0.2352844, 1, 0, 0.2235294, 1,
1.792303, -1.076902, 4.431705, 1, 0, 0.2156863, 1,
1.80029, -0.6247815, 3.393641, 1, 0, 0.2117647, 1,
1.817909, 0.9497226, -0.02997671, 1, 0, 0.2039216, 1,
1.821074, 0.4825701, -0.2910167, 1, 0, 0.1960784, 1,
1.822138, 1.105551, 0.4119853, 1, 0, 0.1921569, 1,
1.832651, -0.6862409, 2.661938, 1, 0, 0.1843137, 1,
1.837967, -0.8855132, 2.789034, 1, 0, 0.1803922, 1,
1.864507, -1.207311, 1.619303, 1, 0, 0.172549, 1,
1.878751, 0.5332178, 0.9606222, 1, 0, 0.1686275, 1,
1.897915, -0.2980934, 1.84719, 1, 0, 0.1607843, 1,
1.910859, -0.6971645, 2.982211, 1, 0, 0.1568628, 1,
1.924963, 0.5574514, 2.251692, 1, 0, 0.1490196, 1,
1.936983, 0.8393374, 0.443008, 1, 0, 0.145098, 1,
1.950363, 0.3254228, 2.361289, 1, 0, 0.1372549, 1,
1.970341, 0.5116863, 2.670266, 1, 0, 0.1333333, 1,
2.004165, -0.2016265, 1.041235, 1, 0, 0.1254902, 1,
2.022657, -1.330426, 2.635104, 1, 0, 0.1215686, 1,
2.032882, 0.3189928, 1.777218, 1, 0, 0.1137255, 1,
2.039393, 0.05528834, 2.350518, 1, 0, 0.1098039, 1,
2.06677, 0.8923254, 3.812865, 1, 0, 0.1019608, 1,
2.112854, 0.1956164, 2.419781, 1, 0, 0.09411765, 1,
2.154872, -0.8041984, 2.751872, 1, 0, 0.09019608, 1,
2.156554, -0.4740648, 3.047484, 1, 0, 0.08235294, 1,
2.164719, -0.44564, 2.292848, 1, 0, 0.07843138, 1,
2.188457, -0.007432292, 1.282913, 1, 0, 0.07058824, 1,
2.236589, -3.129028, 2.863518, 1, 0, 0.06666667, 1,
2.326164, -0.08286189, 0.7005336, 1, 0, 0.05882353, 1,
2.329111, 1.214728, 1.024043, 1, 0, 0.05490196, 1,
2.332502, -0.8810089, 0.6729637, 1, 0, 0.04705882, 1,
2.434818, -0.29034, -0.3452931, 1, 0, 0.04313726, 1,
2.453081, 1.398492, 2.178106, 1, 0, 0.03529412, 1,
2.667926, 1.533012, -0.4487773, 1, 0, 0.03137255, 1,
2.668262, 0.2261172, 0.8807101, 1, 0, 0.02352941, 1,
2.7421, 1.089201, 1.018659, 1, 0, 0.01960784, 1,
2.744688, 0.1544862, 1.55775, 1, 0, 0.01176471, 1,
2.86008, 1.061801, 1.345738, 1, 0, 0.007843138, 1
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
-0.1696297, -4.297397, -7.195045, 0, -0.5, 0.5, 0.5,
-0.1696297, -4.297397, -7.195045, 1, -0.5, 0.5, 0.5,
-0.1696297, -4.297397, -7.195045, 1, 1.5, 0.5, 0.5,
-0.1696297, -4.297397, -7.195045, 0, 1.5, 0.5, 0.5
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
-4.226411, 0.1022559, -7.195045, 0, -0.5, 0.5, 0.5,
-4.226411, 0.1022559, -7.195045, 1, -0.5, 0.5, 0.5,
-4.226411, 0.1022559, -7.195045, 1, 1.5, 0.5, 0.5,
-4.226411, 0.1022559, -7.195045, 0, 1.5, 0.5, 0.5
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
-4.226411, -4.297397, -0.2037401, 0, -0.5, 0.5, 0.5,
-4.226411, -4.297397, -0.2037401, 1, -0.5, 0.5, 0.5,
-4.226411, -4.297397, -0.2037401, 1, 1.5, 0.5, 0.5,
-4.226411, -4.297397, -0.2037401, 0, 1.5, 0.5, 0.5
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
-3, -3.282092, -5.581667,
2, -3.282092, -5.581667,
-3, -3.282092, -5.581667,
-3, -3.451309, -5.850564,
-2, -3.282092, -5.581667,
-2, -3.451309, -5.850564,
-1, -3.282092, -5.581667,
-1, -3.451309, -5.850564,
0, -3.282092, -5.581667,
0, -3.451309, -5.850564,
1, -3.282092, -5.581667,
1, -3.451309, -5.850564,
2, -3.282092, -5.581667,
2, -3.451309, -5.850564
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
-3, -3.789744, -6.388357, 0, -0.5, 0.5, 0.5,
-3, -3.789744, -6.388357, 1, -0.5, 0.5, 0.5,
-3, -3.789744, -6.388357, 1, 1.5, 0.5, 0.5,
-3, -3.789744, -6.388357, 0, 1.5, 0.5, 0.5,
-2, -3.789744, -6.388357, 0, -0.5, 0.5, 0.5,
-2, -3.789744, -6.388357, 1, -0.5, 0.5, 0.5,
-2, -3.789744, -6.388357, 1, 1.5, 0.5, 0.5,
-2, -3.789744, -6.388357, 0, 1.5, 0.5, 0.5,
-1, -3.789744, -6.388357, 0, -0.5, 0.5, 0.5,
-1, -3.789744, -6.388357, 1, -0.5, 0.5, 0.5,
-1, -3.789744, -6.388357, 1, 1.5, 0.5, 0.5,
-1, -3.789744, -6.388357, 0, 1.5, 0.5, 0.5,
0, -3.789744, -6.388357, 0, -0.5, 0.5, 0.5,
0, -3.789744, -6.388357, 1, -0.5, 0.5, 0.5,
0, -3.789744, -6.388357, 1, 1.5, 0.5, 0.5,
0, -3.789744, -6.388357, 0, 1.5, 0.5, 0.5,
1, -3.789744, -6.388357, 0, -0.5, 0.5, 0.5,
1, -3.789744, -6.388357, 1, -0.5, 0.5, 0.5,
1, -3.789744, -6.388357, 1, 1.5, 0.5, 0.5,
1, -3.789744, -6.388357, 0, 1.5, 0.5, 0.5,
2, -3.789744, -6.388357, 0, -0.5, 0.5, 0.5,
2, -3.789744, -6.388357, 1, -0.5, 0.5, 0.5,
2, -3.789744, -6.388357, 1, 1.5, 0.5, 0.5,
2, -3.789744, -6.388357, 0, 1.5, 0.5, 0.5
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
-3.290231, -3, -5.581667,
-3.290231, 3, -5.581667,
-3.290231, -3, -5.581667,
-3.446261, -3, -5.850564,
-3.290231, -2, -5.581667,
-3.446261, -2, -5.850564,
-3.290231, -1, -5.581667,
-3.446261, -1, -5.850564,
-3.290231, 0, -5.581667,
-3.446261, 0, -5.850564,
-3.290231, 1, -5.581667,
-3.446261, 1, -5.850564,
-3.290231, 2, -5.581667,
-3.446261, 2, -5.850564,
-3.290231, 3, -5.581667,
-3.446261, 3, -5.850564
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
-3.758321, -3, -6.388357, 0, -0.5, 0.5, 0.5,
-3.758321, -3, -6.388357, 1, -0.5, 0.5, 0.5,
-3.758321, -3, -6.388357, 1, 1.5, 0.5, 0.5,
-3.758321, -3, -6.388357, 0, 1.5, 0.5, 0.5,
-3.758321, -2, -6.388357, 0, -0.5, 0.5, 0.5,
-3.758321, -2, -6.388357, 1, -0.5, 0.5, 0.5,
-3.758321, -2, -6.388357, 1, 1.5, 0.5, 0.5,
-3.758321, -2, -6.388357, 0, 1.5, 0.5, 0.5,
-3.758321, -1, -6.388357, 0, -0.5, 0.5, 0.5,
-3.758321, -1, -6.388357, 1, -0.5, 0.5, 0.5,
-3.758321, -1, -6.388357, 1, 1.5, 0.5, 0.5,
-3.758321, -1, -6.388357, 0, 1.5, 0.5, 0.5,
-3.758321, 0, -6.388357, 0, -0.5, 0.5, 0.5,
-3.758321, 0, -6.388357, 1, -0.5, 0.5, 0.5,
-3.758321, 0, -6.388357, 1, 1.5, 0.5, 0.5,
-3.758321, 0, -6.388357, 0, 1.5, 0.5, 0.5,
-3.758321, 1, -6.388357, 0, -0.5, 0.5, 0.5,
-3.758321, 1, -6.388357, 1, -0.5, 0.5, 0.5,
-3.758321, 1, -6.388357, 1, 1.5, 0.5, 0.5,
-3.758321, 1, -6.388357, 0, 1.5, 0.5, 0.5,
-3.758321, 2, -6.388357, 0, -0.5, 0.5, 0.5,
-3.758321, 2, -6.388357, 1, -0.5, 0.5, 0.5,
-3.758321, 2, -6.388357, 1, 1.5, 0.5, 0.5,
-3.758321, 2, -6.388357, 0, 1.5, 0.5, 0.5,
-3.758321, 3, -6.388357, 0, -0.5, 0.5, 0.5,
-3.758321, 3, -6.388357, 1, -0.5, 0.5, 0.5,
-3.758321, 3, -6.388357, 1, 1.5, 0.5, 0.5,
-3.758321, 3, -6.388357, 0, 1.5, 0.5, 0.5
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
-3.290231, -3.282092, -4,
-3.290231, -3.282092, 4,
-3.290231, -3.282092, -4,
-3.446261, -3.451309, -4,
-3.290231, -3.282092, -2,
-3.446261, -3.451309, -2,
-3.290231, -3.282092, 0,
-3.446261, -3.451309, 0,
-3.290231, -3.282092, 2,
-3.446261, -3.451309, 2,
-3.290231, -3.282092, 4,
-3.446261, -3.451309, 4
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
-3.758321, -3.789744, -4, 0, -0.5, 0.5, 0.5,
-3.758321, -3.789744, -4, 1, -0.5, 0.5, 0.5,
-3.758321, -3.789744, -4, 1, 1.5, 0.5, 0.5,
-3.758321, -3.789744, -4, 0, 1.5, 0.5, 0.5,
-3.758321, -3.789744, -2, 0, -0.5, 0.5, 0.5,
-3.758321, -3.789744, -2, 1, -0.5, 0.5, 0.5,
-3.758321, -3.789744, -2, 1, 1.5, 0.5, 0.5,
-3.758321, -3.789744, -2, 0, 1.5, 0.5, 0.5,
-3.758321, -3.789744, 0, 0, -0.5, 0.5, 0.5,
-3.758321, -3.789744, 0, 1, -0.5, 0.5, 0.5,
-3.758321, -3.789744, 0, 1, 1.5, 0.5, 0.5,
-3.758321, -3.789744, 0, 0, 1.5, 0.5, 0.5,
-3.758321, -3.789744, 2, 0, -0.5, 0.5, 0.5,
-3.758321, -3.789744, 2, 1, -0.5, 0.5, 0.5,
-3.758321, -3.789744, 2, 1, 1.5, 0.5, 0.5,
-3.758321, -3.789744, 2, 0, 1.5, 0.5, 0.5,
-3.758321, -3.789744, 4, 0, -0.5, 0.5, 0.5,
-3.758321, -3.789744, 4, 1, -0.5, 0.5, 0.5,
-3.758321, -3.789744, 4, 1, 1.5, 0.5, 0.5,
-3.758321, -3.789744, 4, 0, 1.5, 0.5, 0.5
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
-3.290231, -3.282092, -5.581667,
-3.290231, 3.486604, -5.581667,
-3.290231, -3.282092, 5.174187,
-3.290231, 3.486604, 5.174187,
-3.290231, -3.282092, -5.581667,
-3.290231, -3.282092, 5.174187,
-3.290231, 3.486604, -5.581667,
-3.290231, 3.486604, 5.174187,
-3.290231, -3.282092, -5.581667,
2.950972, -3.282092, -5.581667,
-3.290231, -3.282092, 5.174187,
2.950972, -3.282092, 5.174187,
-3.290231, 3.486604, -5.581667,
2.950972, 3.486604, -5.581667,
-3.290231, 3.486604, 5.174187,
2.950972, 3.486604, 5.174187,
2.950972, -3.282092, -5.581667,
2.950972, 3.486604, -5.581667,
2.950972, -3.282092, 5.174187,
2.950972, 3.486604, 5.174187,
2.950972, -3.282092, -5.581667,
2.950972, -3.282092, 5.174187,
2.950972, 3.486604, -5.581667,
2.950972, 3.486604, 5.174187
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
var radius = 7.560235;
var distance = 33.63634;
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
mvMatrix.translate( 0.1696297, -0.1022559, 0.2037401 );
mvMatrix.scale( 1.309727, 1.207659, 0.7599837 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.63634);
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
monomethylarsonic_ac<-read.table("monomethylarsonic_ac.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-monomethylarsonic_ac$V2
```

```
## Error in eval(expr, envir, enclos): object 'monomethylarsonic_ac' not found
```

```r
y<-monomethylarsonic_ac$V3
```

```
## Error in eval(expr, envir, enclos): object 'monomethylarsonic_ac' not found
```

```r
z<-monomethylarsonic_ac$V4
```

```
## Error in eval(expr, envir, enclos): object 'monomethylarsonic_ac' not found
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
-3.19934, -0.6795176, -1.871045, 0, 0, 1, 1, 1,
-2.456712, -1.428925, -0.5339209, 1, 0, 0, 1, 1,
-2.408961, 0.5461507, -1.318613, 1, 0, 0, 1, 1,
-2.38253, -0.3299176, 0.2843599, 1, 0, 0, 1, 1,
-2.36668, -1.179305, -2.44583, 1, 0, 0, 1, 1,
-2.349019, 0.7308793, -0.8959411, 1, 0, 0, 1, 1,
-2.343446, 0.02914359, -1.641594, 0, 0, 0, 1, 1,
-2.20652, 1.334861, -2.202965, 0, 0, 0, 1, 1,
-2.198596, 0.1414632, -0.8443107, 0, 0, 0, 1, 1,
-2.187899, -1.157886, -3.592326, 0, 0, 0, 1, 1,
-2.179117, -0.7912754, -2.55613, 0, 0, 0, 1, 1,
-2.121371, -0.6819419, -3.88682, 0, 0, 0, 1, 1,
-2.11122, 1.77142, 0.9930291, 0, 0, 0, 1, 1,
-2.032717, 0.2550888, -0.7992895, 1, 1, 1, 1, 1,
-2.014321, 0.2154853, -2.589602, 1, 1, 1, 1, 1,
-2.01224, -0.3230301, -2.614607, 1, 1, 1, 1, 1,
-1.99455, 0.6492818, -1.090533, 1, 1, 1, 1, 1,
-1.991862, -0.5286931, -0.6186735, 1, 1, 1, 1, 1,
-1.987775, -2.324455, -1.177856, 1, 1, 1, 1, 1,
-1.971663, -0.8868855, -0.6334035, 1, 1, 1, 1, 1,
-1.959905, -0.239482, -1.171716, 1, 1, 1, 1, 1,
-1.942411, -0.6843556, -2.228711, 1, 1, 1, 1, 1,
-1.934541, 0.02232596, -0.4885038, 1, 1, 1, 1, 1,
-1.903403, -0.2255328, -2.871096, 1, 1, 1, 1, 1,
-1.894333, -0.4498083, -1.628137, 1, 1, 1, 1, 1,
-1.887392, 0.7791594, -2.645556, 1, 1, 1, 1, 1,
-1.880816, 2.559103, -1.350659, 1, 1, 1, 1, 1,
-1.829362, -0.9016278, -3.560917, 1, 1, 1, 1, 1,
-1.82746, -1.150745, -0.4118946, 0, 0, 1, 1, 1,
-1.81817, 2.351819, -0.693115, 1, 0, 0, 1, 1,
-1.817875, 0.08515977, -0.6690276, 1, 0, 0, 1, 1,
-1.808513, -0.04966969, -1.599071, 1, 0, 0, 1, 1,
-1.802907, -0.6568922, -2.842649, 1, 0, 0, 1, 1,
-1.801192, 0.2387694, -0.8013219, 1, 0, 0, 1, 1,
-1.797361, 0.5996962, -1.683703, 0, 0, 0, 1, 1,
-1.789493, -1.739781, -2.752887, 0, 0, 0, 1, 1,
-1.783601, 1.755135, -1.003385, 0, 0, 0, 1, 1,
-1.78097, 1.036665, -1.227375, 0, 0, 0, 1, 1,
-1.753547, 1.29807, -1.232504, 0, 0, 0, 1, 1,
-1.743379, -0.09979647, -2.547907, 0, 0, 0, 1, 1,
-1.738318, 1.164871, -2.049351, 0, 0, 0, 1, 1,
-1.73326, 0.5983722, -2.367074, 1, 1, 1, 1, 1,
-1.727627, -0.8575267, -2.289241, 1, 1, 1, 1, 1,
-1.714106, -0.9104767, -1.944316, 1, 1, 1, 1, 1,
-1.694646, 0.2759257, 0.9266429, 1, 1, 1, 1, 1,
-1.659659, 0.02542813, -1.858338, 1, 1, 1, 1, 1,
-1.651682, 1.477658, -0.1088387, 1, 1, 1, 1, 1,
-1.646931, 0.2051842, -0.721148, 1, 1, 1, 1, 1,
-1.642518, 0.8043712, -2.07707, 1, 1, 1, 1, 1,
-1.618482, -0.6206036, -0.8659387, 1, 1, 1, 1, 1,
-1.614674, -1.21093, -2.514303, 1, 1, 1, 1, 1,
-1.611228, -0.6043706, -2.115793, 1, 1, 1, 1, 1,
-1.609342, 0.8627326, -1.213856, 1, 1, 1, 1, 1,
-1.60058, 0.2963824, -0.07777774, 1, 1, 1, 1, 1,
-1.595475, 0.7178722, -1.244535, 1, 1, 1, 1, 1,
-1.59457, -0.5183327, -2.771331, 1, 1, 1, 1, 1,
-1.581779, 0.8913609, -2.207059, 0, 0, 1, 1, 1,
-1.579131, -0.8712152, -2.282532, 1, 0, 0, 1, 1,
-1.578905, 0.3111801, -2.285685, 1, 0, 0, 1, 1,
-1.574233, -0.3214582, -1.343473, 1, 0, 0, 1, 1,
-1.567848, -0.3112499, -1.20181, 1, 0, 0, 1, 1,
-1.567282, -0.2614356, -1.564139, 1, 0, 0, 1, 1,
-1.565691, 0.566546, -0.9053369, 0, 0, 0, 1, 1,
-1.564893, 0.5267853, -1.548706, 0, 0, 0, 1, 1,
-1.556499, 1.088928, -0.5592798, 0, 0, 0, 1, 1,
-1.536945, 0.3809538, -2.077718, 0, 0, 0, 1, 1,
-1.521245, 0.5504728, -1.497218, 0, 0, 0, 1, 1,
-1.514119, -0.5370635, -2.675317, 0, 0, 0, 1, 1,
-1.496573, -1.258677, -0.6765316, 0, 0, 0, 1, 1,
-1.480094, 0.8801968, -1.245458, 1, 1, 1, 1, 1,
-1.478179, 0.5420391, -1.64239, 1, 1, 1, 1, 1,
-1.465404, 0.9194984, -0.3866779, 1, 1, 1, 1, 1,
-1.452061, -0.4963606, -1.769781, 1, 1, 1, 1, 1,
-1.44539, 0.1085112, -2.311798, 1, 1, 1, 1, 1,
-1.435686, 1.396407, -1.457221, 1, 1, 1, 1, 1,
-1.432667, 0.5003347, -1.383667, 1, 1, 1, 1, 1,
-1.422386, 1.076662, 0.7013094, 1, 1, 1, 1, 1,
-1.412473, -0.3822346, -1.516025, 1, 1, 1, 1, 1,
-1.410412, 0.2177972, -0.9622335, 1, 1, 1, 1, 1,
-1.391495, -2.719408, -3.452356, 1, 1, 1, 1, 1,
-1.388445, -1.020952, -1.825442, 1, 1, 1, 1, 1,
-1.384008, -1.30348, -0.7690509, 1, 1, 1, 1, 1,
-1.383703, -0.7732634, -1.639428, 1, 1, 1, 1, 1,
-1.36236, -0.4325402, -0.7157915, 1, 1, 1, 1, 1,
-1.347043, -0.1806172, -1.785715, 0, 0, 1, 1, 1,
-1.334633, -0.5508887, -4.045819, 1, 0, 0, 1, 1,
-1.324328, -2.296758, -3.789082, 1, 0, 0, 1, 1,
-1.3184, -0.6999834, -2.423926, 1, 0, 0, 1, 1,
-1.318005, -1.212646, -2.438292, 1, 0, 0, 1, 1,
-1.313067, 1.483874, -0.7190396, 1, 0, 0, 1, 1,
-1.310783, 0.5569568, -1.022369, 0, 0, 0, 1, 1,
-1.30132, 0.87224, -1.34261, 0, 0, 0, 1, 1,
-1.297699, -0.878833, -3.331583, 0, 0, 0, 1, 1,
-1.295602, 0.4533618, -0.2860751, 0, 0, 0, 1, 1,
-1.293469, -0.6814071, -2.149359, 0, 0, 0, 1, 1,
-1.293129, -0.2594216, -2.099455, 0, 0, 0, 1, 1,
-1.280446, 0.302631, -0.9557897, 0, 0, 0, 1, 1,
-1.276258, 0.9473398, -0.5090846, 1, 1, 1, 1, 1,
-1.270206, 0.2928291, -0.3352559, 1, 1, 1, 1, 1,
-1.263287, -0.403523, -2.456181, 1, 1, 1, 1, 1,
-1.260778, 1.877977, 0.01729994, 1, 1, 1, 1, 1,
-1.259268, 0.5146629, -0.8190317, 1, 1, 1, 1, 1,
-1.258298, -0.2568641, -1.178949, 1, 1, 1, 1, 1,
-1.246744, 0.0595727, -1.731034, 1, 1, 1, 1, 1,
-1.234284, -0.8307776, 0.1854561, 1, 1, 1, 1, 1,
-1.228617, -0.8302804, -2.441168, 1, 1, 1, 1, 1,
-1.219667, 0.05654426, -1.916208, 1, 1, 1, 1, 1,
-1.218609, -0.1259248, -2.067729, 1, 1, 1, 1, 1,
-1.214175, -0.6115893, -3.395457, 1, 1, 1, 1, 1,
-1.205575, 1.155044, 0.9844611, 1, 1, 1, 1, 1,
-1.202396, 0.3718145, -2.576327, 1, 1, 1, 1, 1,
-1.201319, -0.4900099, -2.168524, 1, 1, 1, 1, 1,
-1.189546, 0.4965441, -2.297181, 0, 0, 1, 1, 1,
-1.189077, 0.6465243, -1.890788, 1, 0, 0, 1, 1,
-1.188826, -1.685916, -2.155785, 1, 0, 0, 1, 1,
-1.18174, -1.312713, -3.80341, 1, 0, 0, 1, 1,
-1.181663, -0.867552, -2.349651, 1, 0, 0, 1, 1,
-1.17088, 0.8176802, -0.6829017, 1, 0, 0, 1, 1,
-1.15593, -0.159423, -0.4928154, 0, 0, 0, 1, 1,
-1.14503, 1.32731, -0.3660127, 0, 0, 0, 1, 1,
-1.139405, 0.5579637, -2.012441, 0, 0, 0, 1, 1,
-1.13778, -0.1027036, -2.293432, 0, 0, 0, 1, 1,
-1.12939, 0.8290472, -0.3420871, 0, 0, 0, 1, 1,
-1.12718, 1.65196, 0.3331559, 0, 0, 0, 1, 1,
-1.126873, 1.289832, -1.357871, 0, 0, 0, 1, 1,
-1.121261, -0.08090868, -1.01684, 1, 1, 1, 1, 1,
-1.119689, 0.8057401, -0.862468, 1, 1, 1, 1, 1,
-1.11124, 0.9289766, -0.03613516, 1, 1, 1, 1, 1,
-1.101781, -1.306882, -4.415521, 1, 1, 1, 1, 1,
-1.100615, -0.8281614, -2.213183, 1, 1, 1, 1, 1,
-1.100111, -1.360884, -1.470984, 1, 1, 1, 1, 1,
-1.091906, 0.319054, 0.1491963, 1, 1, 1, 1, 1,
-1.085497, 1.892455, -1.085748, 1, 1, 1, 1, 1,
-1.082261, -0.4029212, -1.058211, 1, 1, 1, 1, 1,
-1.079915, -1.323258, -2.684747, 1, 1, 1, 1, 1,
-1.077043, 0.7046838, -0.4064029, 1, 1, 1, 1, 1,
-1.06531, -1.066379, -0.4580606, 1, 1, 1, 1, 1,
-1.053423, -0.05804624, -1.777095, 1, 1, 1, 1, 1,
-1.051555, -0.6872696, -1.350155, 1, 1, 1, 1, 1,
-1.050099, -0.3519428, -2.000317, 1, 1, 1, 1, 1,
-1.050092, 0.5005075, -1.677517, 0, 0, 1, 1, 1,
-1.045678, -1.366177, -1.120335, 1, 0, 0, 1, 1,
-1.04557, 1.309213, -1.226972, 1, 0, 0, 1, 1,
-1.044857, -1.093536, -3.460281, 1, 0, 0, 1, 1,
-1.038939, 1.404211, -1.17116, 1, 0, 0, 1, 1,
-1.036729, 0.3464032, -1.125334, 1, 0, 0, 1, 1,
-1.036674, -0.8779858, -0.856869, 0, 0, 0, 1, 1,
-1.03585, -0.7079291, -3.626374, 0, 0, 0, 1, 1,
-1.034976, 0.8500137, -1.113328, 0, 0, 0, 1, 1,
-1.026978, 0.1868428, -2.996944, 0, 0, 0, 1, 1,
-1.025358, -0.1751341, -1.797247, 0, 0, 0, 1, 1,
-1.021748, 0.4933538, -1.246946, 0, 0, 0, 1, 1,
-1.017873, -0.231146, -1.983919, 0, 0, 0, 1, 1,
-1.015013, 0.5288562, -1.968042, 1, 1, 1, 1, 1,
-1.00848, 0.3418293, -0.9618222, 1, 1, 1, 1, 1,
-1.001351, 0.3069685, -1.014199, 1, 1, 1, 1, 1,
-0.9960794, 0.1118026, -1.276107, 1, 1, 1, 1, 1,
-0.9923216, 1.748618, -1.099294, 1, 1, 1, 1, 1,
-0.9901459, 0.8673167, -1.78298, 1, 1, 1, 1, 1,
-0.9842905, -0.84305, -0.3458163, 1, 1, 1, 1, 1,
-0.9840968, 0.2361499, -0.5087966, 1, 1, 1, 1, 1,
-0.9780943, -0.1266011, -1.210449, 1, 1, 1, 1, 1,
-0.9710767, 0.4540291, -0.8963177, 1, 1, 1, 1, 1,
-0.9700129, -0.2490208, -0.7553513, 1, 1, 1, 1, 1,
-0.9672442, -0.999518, -2.698605, 1, 1, 1, 1, 1,
-0.9617708, -0.8531766, -2.072804, 1, 1, 1, 1, 1,
-0.9585336, -1.565277, -4.081189, 1, 1, 1, 1, 1,
-0.9580352, -0.9396706, -3.2754, 1, 1, 1, 1, 1,
-0.9506095, 0.2385815, -1.822145, 0, 0, 1, 1, 1,
-0.9484028, -1.395039, -3.5779, 1, 0, 0, 1, 1,
-0.947758, -0.8378581, -2.087189, 1, 0, 0, 1, 1,
-0.9435176, -0.7728589, -1.180605, 1, 0, 0, 1, 1,
-0.9405487, -2.13044, -3.612211, 1, 0, 0, 1, 1,
-0.937762, -0.07429936, -0.6419868, 1, 0, 0, 1, 1,
-0.9360657, 0.06506334, -1.354873, 0, 0, 0, 1, 1,
-0.9338694, -0.3008978, -0.7858815, 0, 0, 0, 1, 1,
-0.930161, 1.480577, -0.7077016, 0, 0, 0, 1, 1,
-0.9267455, -0.09561436, -2.630712, 0, 0, 0, 1, 1,
-0.9261513, -0.7461607, -1.389297, 0, 0, 0, 1, 1,
-0.9249641, 1.291975, -0.5552319, 0, 0, 0, 1, 1,
-0.9199839, -0.0914182, -0.5171881, 0, 0, 0, 1, 1,
-0.9172863, 0.4911696, 0.3858554, 1, 1, 1, 1, 1,
-0.9156822, -0.1859887, -1.878717, 1, 1, 1, 1, 1,
-0.9080171, 0.07148725, -2.230124, 1, 1, 1, 1, 1,
-0.905937, 0.5064217, -1.898561, 1, 1, 1, 1, 1,
-0.9045689, -0.5830093, -1.654951, 1, 1, 1, 1, 1,
-0.9001514, -1.713721, -1.729151, 1, 1, 1, 1, 1,
-0.8998964, 0.7730238, 0.3670799, 1, 1, 1, 1, 1,
-0.8966938, 0.01116396, -0.1615131, 1, 1, 1, 1, 1,
-0.8960886, -1.047922, -3.332865, 1, 1, 1, 1, 1,
-0.8941395, 0.370032, -2.566798, 1, 1, 1, 1, 1,
-0.8940755, 0.2736036, -1.599591, 1, 1, 1, 1, 1,
-0.8825524, -1.271, -3.16194, 1, 1, 1, 1, 1,
-0.8798153, 0.3226318, -0.9818758, 1, 1, 1, 1, 1,
-0.8773138, -0.2193008, -3.041689, 1, 1, 1, 1, 1,
-0.876258, 1.496921, 0.900111, 1, 1, 1, 1, 1,
-0.8743629, -0.9205399, -2.421244, 0, 0, 1, 1, 1,
-0.8718609, -0.1654423, -1.276081, 1, 0, 0, 1, 1,
-0.8636067, -1.573347, -0.8056425, 1, 0, 0, 1, 1,
-0.8606005, -0.3024901, -3.238928, 1, 0, 0, 1, 1,
-0.8587174, 0.7135673, 0.8814589, 1, 0, 0, 1, 1,
-0.8532203, -1.583247, -1.0631, 1, 0, 0, 1, 1,
-0.8475111, 0.2702492, -1.801655, 0, 0, 0, 1, 1,
-0.8459504, 0.285068, 0.2355989, 0, 0, 0, 1, 1,
-0.8459411, 0.1206671, -0.2992691, 0, 0, 0, 1, 1,
-0.840368, -1.214768, -3.09539, 0, 0, 0, 1, 1,
-0.8398541, -0.8781147, -2.645164, 0, 0, 0, 1, 1,
-0.8362899, 1.768903, 0.8192877, 0, 0, 0, 1, 1,
-0.8197203, -0.173686, -2.983105, 0, 0, 0, 1, 1,
-0.807852, 0.4226245, -1.006467, 1, 1, 1, 1, 1,
-0.7960802, 0.08872263, -2.072919, 1, 1, 1, 1, 1,
-0.7953244, -0.5507849, -1.117473, 1, 1, 1, 1, 1,
-0.7931794, -1.268353, -1.684597, 1, 1, 1, 1, 1,
-0.7927179, -0.8467615, -2.497128, 1, 1, 1, 1, 1,
-0.7873321, -0.4347218, -3.252719, 1, 1, 1, 1, 1,
-0.7855806, -1.623122, -3.646552, 1, 1, 1, 1, 1,
-0.7832173, 0.415914, -0.9766279, 1, 1, 1, 1, 1,
-0.7826835, 0.6176703, -1.180765, 1, 1, 1, 1, 1,
-0.7825504, 2.282798, -1.47586, 1, 1, 1, 1, 1,
-0.7784483, 0.520501, 0.7441407, 1, 1, 1, 1, 1,
-0.7767861, 0.2832406, 0.06664266, 1, 1, 1, 1, 1,
-0.7667297, -0.03062236, -1.069389, 1, 1, 1, 1, 1,
-0.7642442, -0.6087832, -4.080993, 1, 1, 1, 1, 1,
-0.763937, -0.5144362, -3.5547, 1, 1, 1, 1, 1,
-0.7477483, 1.166577, 0.1996007, 0, 0, 1, 1, 1,
-0.738101, 0.7187794, -0.1697346, 1, 0, 0, 1, 1,
-0.7374895, -1.122994, -1.627524, 1, 0, 0, 1, 1,
-0.7360899, -0.2435113, -1.621757, 1, 0, 0, 1, 1,
-0.7348238, -0.2733981, -2.334577, 1, 0, 0, 1, 1,
-0.7293429, 0.01028789, -1.352213, 1, 0, 0, 1, 1,
-0.7278147, -1.913649, -2.76659, 0, 0, 0, 1, 1,
-0.7227429, -0.6587867, -2.3355, 0, 0, 0, 1, 1,
-0.7227077, 0.7555909, -0.6054111, 0, 0, 0, 1, 1,
-0.7203407, 0.4040461, 0.5725001, 0, 0, 0, 1, 1,
-0.7123496, -0.3062178, -1.712515, 0, 0, 0, 1, 1,
-0.7052569, -1.201339, -2.206395, 0, 0, 0, 1, 1,
-0.7031109, -0.1842179, -2.32744, 0, 0, 0, 1, 1,
-0.6987849, 1.088371, 0.2148814, 1, 1, 1, 1, 1,
-0.695485, 1.02336, -0.2563187, 1, 1, 1, 1, 1,
-0.6941586, 0.5197392, 0.8943571, 1, 1, 1, 1, 1,
-0.6938196, 1.671899, 1.216936, 1, 1, 1, 1, 1,
-0.6925964, -0.5585316, -2.785093, 1, 1, 1, 1, 1,
-0.6922361, -0.2608003, -1.290551, 1, 1, 1, 1, 1,
-0.6916665, -1.342829, -1.316456, 1, 1, 1, 1, 1,
-0.6912497, -0.8388684, -5.098342, 1, 1, 1, 1, 1,
-0.6903795, 0.05532966, -1.4893, 1, 1, 1, 1, 1,
-0.6878193, 2.011397, 0.7433364, 1, 1, 1, 1, 1,
-0.6865035, 1.923742, -0.9040359, 1, 1, 1, 1, 1,
-0.683796, 1.225251, -0.4466351, 1, 1, 1, 1, 1,
-0.6818387, -0.3930712, -1.817096, 1, 1, 1, 1, 1,
-0.6812271, -0.3131612, -1.536677, 1, 1, 1, 1, 1,
-0.6772904, 0.08186343, -2.158135, 1, 1, 1, 1, 1,
-0.6724949, 0.1757271, -1.55911, 0, 0, 1, 1, 1,
-0.6690145, -0.1785651, -2.910156, 1, 0, 0, 1, 1,
-0.6678094, 1.30175, 0.02547504, 1, 0, 0, 1, 1,
-0.6669407, -0.03700829, -2.502022, 1, 0, 0, 1, 1,
-0.6658524, -2.148967, -1.668454, 1, 0, 0, 1, 1,
-0.6656255, 0.4341186, -2.270957, 1, 0, 0, 1, 1,
-0.6640688, -0.8604935, -2.263398, 0, 0, 0, 1, 1,
-0.6640359, -0.1564488, -1.436714, 0, 0, 0, 1, 1,
-0.6637408, -1.409366, -3.109002, 0, 0, 0, 1, 1,
-0.6555567, -3.183519, -1.881248, 0, 0, 0, 1, 1,
-0.6501511, -0.510013, -1.471681, 0, 0, 0, 1, 1,
-0.649948, 0.2722913, -2.280293, 0, 0, 0, 1, 1,
-0.6342073, 0.01704242, -2.693602, 0, 0, 0, 1, 1,
-0.6338931, 1.872003, 0.2201562, 1, 1, 1, 1, 1,
-0.6312149, 0.9177912, -1.37512, 1, 1, 1, 1, 1,
-0.6297374, 0.2961091, -1.496968, 1, 1, 1, 1, 1,
-0.6293898, 1.48552, -0.6859484, 1, 1, 1, 1, 1,
-0.6283429, -1.861002, -3.777383, 1, 1, 1, 1, 1,
-0.6277915, 2.805521, -0.4681098, 1, 1, 1, 1, 1,
-0.6271692, -1.100919, -2.80153, 1, 1, 1, 1, 1,
-0.6266269, 0.5442152, 0.5038063, 1, 1, 1, 1, 1,
-0.6239582, -0.7620528, -2.160931, 1, 1, 1, 1, 1,
-0.6223931, 0.6426476, -0.2104709, 1, 1, 1, 1, 1,
-0.6222413, 0.8828256, -0.7359334, 1, 1, 1, 1, 1,
-0.6217443, -0.9889111, -2.242729, 1, 1, 1, 1, 1,
-0.6169853, 1.739734, 1.354796, 1, 1, 1, 1, 1,
-0.613299, -0.1789656, -0.6496055, 1, 1, 1, 1, 1,
-0.6105605, -0.1476933, 0.5464376, 1, 1, 1, 1, 1,
-0.6047611, 0.04400664, -1.235298, 0, 0, 1, 1, 1,
-0.6032176, 0.8707744, -0.7623015, 1, 0, 0, 1, 1,
-0.6027004, 1.552927, -1.947589, 1, 0, 0, 1, 1,
-0.5980397, -0.3511775, -0.8545186, 1, 0, 0, 1, 1,
-0.5976623, -0.4811718, -3.481326, 1, 0, 0, 1, 1,
-0.5944763, 2.488292, -1.578263, 1, 0, 0, 1, 1,
-0.5913244, 0.379744, -0.2453968, 0, 0, 0, 1, 1,
-0.5823367, -0.6650087, -3.293047, 0, 0, 0, 1, 1,
-0.5812346, -0.913798, -1.840155, 0, 0, 0, 1, 1,
-0.5731242, -0.05972002, 0.887768, 0, 0, 0, 1, 1,
-0.5720335, -1.239082, -2.829457, 0, 0, 0, 1, 1,
-0.5659826, -0.9416342, -1.679396, 0, 0, 0, 1, 1,
-0.5513183, -1.406271, -2.024539, 0, 0, 0, 1, 1,
-0.5511774, -0.03953361, -2.355554, 1, 1, 1, 1, 1,
-0.5444664, -0.5206192, -0.8448985, 1, 1, 1, 1, 1,
-0.5443269, 1.117973, 0.004053076, 1, 1, 1, 1, 1,
-0.5441391, 1.006906, -0.5195105, 1, 1, 1, 1, 1,
-0.5439856, -0.58674, -2.326484, 1, 1, 1, 1, 1,
-0.5435094, -0.7388229, -0.4522453, 1, 1, 1, 1, 1,
-0.5417353, -0.9005061, -1.538919, 1, 1, 1, 1, 1,
-0.5381631, -0.617018, -2.635475, 1, 1, 1, 1, 1,
-0.5378306, 0.8682318, -0.257976, 1, 1, 1, 1, 1,
-0.5373666, 1.07038, -0.764056, 1, 1, 1, 1, 1,
-0.5331517, -0.4425157, -4.248969, 1, 1, 1, 1, 1,
-0.5318947, 0.6228542, -0.3542011, 1, 1, 1, 1, 1,
-0.5313988, -1.738874, -0.4034881, 1, 1, 1, 1, 1,
-0.5304151, 0.7103156, -0.5387366, 1, 1, 1, 1, 1,
-0.5303989, 0.00648119, -1.757602, 1, 1, 1, 1, 1,
-0.5296896, -0.0294946, -1.201909, 0, 0, 1, 1, 1,
-0.5270312, -0.7475469, -2.581021, 1, 0, 0, 1, 1,
-0.5186842, -1.020626, -1.272092, 1, 0, 0, 1, 1,
-0.5184864, -1.252176, -3.233188, 1, 0, 0, 1, 1,
-0.5124651, 0.262885, 0.0890153, 1, 0, 0, 1, 1,
-0.5114825, -2.25999, -2.945571, 1, 0, 0, 1, 1,
-0.5086715, -0.2153704, -1.079351, 0, 0, 0, 1, 1,
-0.5036855, -0.7901305, -2.399641, 0, 0, 0, 1, 1,
-0.5035647, 0.9733638, -2.539286, 0, 0, 0, 1, 1,
-0.5003007, 0.247556, -0.4673315, 0, 0, 0, 1, 1,
-0.4991064, -0.1102239, -0.2312571, 0, 0, 0, 1, 1,
-0.4986704, -0.3012572, -1.272679, 0, 0, 0, 1, 1,
-0.4946233, -0.115805, 0.4224986, 0, 0, 0, 1, 1,
-0.4874935, -1.100627, -2.685941, 1, 1, 1, 1, 1,
-0.4816697, -0.3516099, -3.002277, 1, 1, 1, 1, 1,
-0.4793122, -0.4857501, -4.077188, 1, 1, 1, 1, 1,
-0.478507, -1.172652, -2.40142, 1, 1, 1, 1, 1,
-0.4771343, -0.6528981, -3.217553, 1, 1, 1, 1, 1,
-0.4727882, 1.079462, -0.8805412, 1, 1, 1, 1, 1,
-0.4699169, -0.922118, -2.845385, 1, 1, 1, 1, 1,
-0.4613143, -0.6070182, -3.491444, 1, 1, 1, 1, 1,
-0.455463, 0.2599933, -0.9847502, 1, 1, 1, 1, 1,
-0.4549271, 0.6382508, -0.1475029, 1, 1, 1, 1, 1,
-0.4501507, -0.5755005, -2.401195, 1, 1, 1, 1, 1,
-0.4391353, 0.3206626, -1.554801, 1, 1, 1, 1, 1,
-0.4390106, 0.2121374, -2.850199, 1, 1, 1, 1, 1,
-0.4336072, -0.3105385, -1.972974, 1, 1, 1, 1, 1,
-0.4324774, -0.1691343, -0.8110972, 1, 1, 1, 1, 1,
-0.431377, 0.383984, -0.1987826, 0, 0, 1, 1, 1,
-0.4249965, 0.4689904, -0.1710199, 1, 0, 0, 1, 1,
-0.4247026, -1.049907, -3.050261, 1, 0, 0, 1, 1,
-0.4237598, 0.3897737, -2.016055, 1, 0, 0, 1, 1,
-0.4177093, -1.747417, -2.993792, 1, 0, 0, 1, 1,
-0.412237, 0.4303801, -0.9079646, 1, 0, 0, 1, 1,
-0.4102202, -0.5798432, -3.11534, 0, 0, 0, 1, 1,
-0.4094827, 0.1621807, -0.7391822, 0, 0, 0, 1, 1,
-0.4082918, -1.962973, -1.614205, 0, 0, 0, 1, 1,
-0.402529, -1.138617, -2.891885, 0, 0, 0, 1, 1,
-0.3945971, 0.4048367, 0.7914514, 0, 0, 0, 1, 1,
-0.3922775, -2.270576, -3.383486, 0, 0, 0, 1, 1,
-0.3869486, 0.8192554, 0.01146035, 0, 0, 0, 1, 1,
-0.3843778, -0.5483115, -2.731561, 1, 1, 1, 1, 1,
-0.3833598, 1.251059, 0.6050782, 1, 1, 1, 1, 1,
-0.3823403, -1.568772, -4.248647, 1, 1, 1, 1, 1,
-0.3820431, -1.254065, -2.953629, 1, 1, 1, 1, 1,
-0.3812357, -2.176642, -3.875093, 1, 1, 1, 1, 1,
-0.3764095, 0.8345047, 0.1716175, 1, 1, 1, 1, 1,
-0.3670232, 0.8530495, -1.585603, 1, 1, 1, 1, 1,
-0.3656712, -0.3555801, -2.776006, 1, 1, 1, 1, 1,
-0.3651064, 0.2915148, -0.1471107, 1, 1, 1, 1, 1,
-0.3619193, -1.474964, -2.653529, 1, 1, 1, 1, 1,
-0.3599758, 0.4705183, 0.6518928, 1, 1, 1, 1, 1,
-0.3589455, -0.2849512, -3.43219, 1, 1, 1, 1, 1,
-0.3536006, -0.9358447, -2.061878, 1, 1, 1, 1, 1,
-0.3527585, -0.332937, -2.496211, 1, 1, 1, 1, 1,
-0.3527105, 0.6038418, -0.5692455, 1, 1, 1, 1, 1,
-0.3514304, -0.5863137, -2.100044, 0, 0, 1, 1, 1,
-0.3453791, 1.399284, -0.07314166, 1, 0, 0, 1, 1,
-0.3412458, -1.538886, -3.162161, 1, 0, 0, 1, 1,
-0.3396812, 0.540985, -1.476967, 1, 0, 0, 1, 1,
-0.3287925, -1.813774, -3.398252, 1, 0, 0, 1, 1,
-0.3251515, -0.2328052, -0.3813766, 1, 0, 0, 1, 1,
-0.3239616, -1.173995, -0.5134049, 0, 0, 0, 1, 1,
-0.3173682, -1.7997, -1.732108, 0, 0, 0, 1, 1,
-0.316034, -0.6599401, -2.362075, 0, 0, 0, 1, 1,
-0.3132458, 0.3597745, 0.3426994, 0, 0, 0, 1, 1,
-0.3127826, 0.1620178, -1.169188, 0, 0, 0, 1, 1,
-0.3102978, -0.9829726, -3.874431, 0, 0, 0, 1, 1,
-0.3099198, -0.4319177, -2.233232, 0, 0, 0, 1, 1,
-0.3055473, 0.07803626, -2.261124, 1, 1, 1, 1, 1,
-0.3032437, 0.6776119, -0.9150781, 1, 1, 1, 1, 1,
-0.2994446, -0.8806332, -2.432163, 1, 1, 1, 1, 1,
-0.2986653, 0.1373582, 0.4611201, 1, 1, 1, 1, 1,
-0.2986412, -0.8107634, -1.988191, 1, 1, 1, 1, 1,
-0.2923295, 0.713765, 0.4852854, 1, 1, 1, 1, 1,
-0.2902014, 0.003390904, -2.029513, 1, 1, 1, 1, 1,
-0.2896587, -2.179283, -5.425029, 1, 1, 1, 1, 1,
-0.2859833, -1.361573, -3.352361, 1, 1, 1, 1, 1,
-0.2854437, -0.4025381, -2.996943, 1, 1, 1, 1, 1,
-0.2821678, 1.256366, -0.6826252, 1, 1, 1, 1, 1,
-0.2819716, -0.3600822, -2.552058, 1, 1, 1, 1, 1,
-0.2769195, -0.4100988, -1.215697, 1, 1, 1, 1, 1,
-0.2729828, -0.1190326, -1.064112, 1, 1, 1, 1, 1,
-0.2695321, 1.0259, -1.171978, 1, 1, 1, 1, 1,
-0.2661459, 0.7348083, -1.143914, 0, 0, 1, 1, 1,
-0.2632224, -0.2945281, -1.663908, 1, 0, 0, 1, 1,
-0.2596543, 0.3093084, -0.08786821, 1, 0, 0, 1, 1,
-0.2590835, 1.119803, -0.3756223, 1, 0, 0, 1, 1,
-0.2572366, 1.599256, -0.4235021, 1, 0, 0, 1, 1,
-0.2530561, -0.03308044, -0.6660772, 1, 0, 0, 1, 1,
-0.2491682, -1.492245, -3.608016, 0, 0, 0, 1, 1,
-0.2485726, -0.44457, -2.43558, 0, 0, 0, 1, 1,
-0.2450216, 1.122161, 0.06481037, 0, 0, 0, 1, 1,
-0.2441164, 0.02587901, -3.951241, 0, 0, 0, 1, 1,
-0.2441056, -0.1358438, -2.216603, 0, 0, 0, 1, 1,
-0.2390479, -0.2850501, -2.852134, 0, 0, 0, 1, 1,
-0.2376101, 0.5009794, -0.541885, 0, 0, 0, 1, 1,
-0.23713, -0.7541575, -2.868715, 1, 1, 1, 1, 1,
-0.2366862, -0.7380688, -1.962645, 1, 1, 1, 1, 1,
-0.2342288, 0.5651389, -0.3045042, 1, 1, 1, 1, 1,
-0.2321334, -0.8395443, -2.711684, 1, 1, 1, 1, 1,
-0.231469, 0.6003129, 0.4026306, 1, 1, 1, 1, 1,
-0.2306796, 1.654988, -1.507802, 1, 1, 1, 1, 1,
-0.2293804, -0.2081407, -1.268599, 1, 1, 1, 1, 1,
-0.2292906, 0.1607776, -0.7258914, 1, 1, 1, 1, 1,
-0.2265619, 1.465047, 0.5704534, 1, 1, 1, 1, 1,
-0.2194512, -0.4704554, -2.422806, 1, 1, 1, 1, 1,
-0.2189329, 0.3400124, -1.290573, 1, 1, 1, 1, 1,
-0.212485, 1.192377, -0.143528, 1, 1, 1, 1, 1,
-0.2115495, 0.2701052, -2.012704, 1, 1, 1, 1, 1,
-0.2006162, 1.185285, -0.07661947, 1, 1, 1, 1, 1,
-0.2003789, -1.785748, -2.075359, 1, 1, 1, 1, 1,
-0.1974951, 1.927808, 0.4977735, 0, 0, 1, 1, 1,
-0.1967862, 0.580267, -1.357433, 1, 0, 0, 1, 1,
-0.1962253, 0.198749, -0.6007271, 1, 0, 0, 1, 1,
-0.1858826, -0.1527155, -1.893044, 1, 0, 0, 1, 1,
-0.1815503, -0.1969515, -2.63914, 1, 0, 0, 1, 1,
-0.1811165, 1.162468, -0.6843531, 1, 0, 0, 1, 1,
-0.1782274, 0.7450055, 0.7961721, 0, 0, 0, 1, 1,
-0.1777547, -1.619588, -4.471167, 0, 0, 0, 1, 1,
-0.1751285, 1.026765, -0.9244046, 0, 0, 0, 1, 1,
-0.173858, 0.02984074, -0.8911898, 0, 0, 0, 1, 1,
-0.1718406, -1.482567, -2.903747, 0, 0, 0, 1, 1,
-0.17109, -1.067181, -2.551337, 0, 0, 0, 1, 1,
-0.1709817, 1.100662, 0.175712, 0, 0, 0, 1, 1,
-0.1704998, -0.04316396, 0.06285764, 1, 1, 1, 1, 1,
-0.1621204, -0.1552671, -1.949741, 1, 1, 1, 1, 1,
-0.1615637, -0.6656778, -2.933155, 1, 1, 1, 1, 1,
-0.1585196, -0.6911302, -2.548267, 1, 1, 1, 1, 1,
-0.1547532, 1.144954, 1.299979, 1, 1, 1, 1, 1,
-0.1472348, 1.51491, -0.6752278, 1, 1, 1, 1, 1,
-0.1461052, -0.9167909, -2.68184, 1, 1, 1, 1, 1,
-0.1448364, -1.063128, -1.997377, 1, 1, 1, 1, 1,
-0.1438306, 0.7359436, -1.19881, 1, 1, 1, 1, 1,
-0.1414212, 0.1428926, -1.959114, 1, 1, 1, 1, 1,
-0.136548, 0.539422, -1.313143, 1, 1, 1, 1, 1,
-0.1330142, 0.1914027, -0.01786782, 1, 1, 1, 1, 1,
-0.1280503, 1.826894, -0.5311153, 1, 1, 1, 1, 1,
-0.1270405, 0.2742814, -2.187978, 1, 1, 1, 1, 1,
-0.1226006, -0.5063509, -0.7285092, 1, 1, 1, 1, 1,
-0.1219881, -0.1070539, -3.638802, 0, 0, 1, 1, 1,
-0.1178428, 2.107041, 0.6124896, 1, 0, 0, 1, 1,
-0.1113441, -0.9852135, -3.027339, 1, 0, 0, 1, 1,
-0.1110272, 1.762692, -0.3485509, 1, 0, 0, 1, 1,
-0.1088504, 0.03847625, -3.018984, 1, 0, 0, 1, 1,
-0.1084616, -0.2508277, -2.782788, 1, 0, 0, 1, 1,
-0.1080672, -1.129559, -2.497242, 0, 0, 0, 1, 1,
-0.1057726, 0.5646518, -1.094671, 0, 0, 0, 1, 1,
-0.1017222, -0.2912975, -1.671939, 0, 0, 0, 1, 1,
-0.09786896, -0.7433854, -2.802761, 0, 0, 0, 1, 1,
-0.09681369, 0.4506659, -0.1029782, 0, 0, 0, 1, 1,
-0.09588989, 0.3115063, -1.291119, 0, 0, 0, 1, 1,
-0.09454266, -0.3181016, -3.835262, 0, 0, 0, 1, 1,
-0.09224997, -0.3682609, -0.8338562, 1, 1, 1, 1, 1,
-0.08991706, 0.4433347, -1.230789, 1, 1, 1, 1, 1,
-0.08801209, 1.372429, 0.2911828, 1, 1, 1, 1, 1,
-0.08736779, -0.4905693, -1.359091, 1, 1, 1, 1, 1,
-0.08729337, -0.2649251, -3.354337, 1, 1, 1, 1, 1,
-0.08591067, -0.05718845, -2.725195, 1, 1, 1, 1, 1,
-0.08281439, -0.4203854, -4.601614, 1, 1, 1, 1, 1,
-0.07649014, 0.6906099, 0.02476223, 1, 1, 1, 1, 1,
-0.07149726, -1.16806, -2.915174, 1, 1, 1, 1, 1,
-0.06937839, -0.7093644, -3.319383, 1, 1, 1, 1, 1,
-0.06647136, 0.1371733, -0.1425392, 1, 1, 1, 1, 1,
-0.06540725, -0.5870422, -1.655522, 1, 1, 1, 1, 1,
-0.06454879, 0.6290042, 0.4470567, 1, 1, 1, 1, 1,
-0.05990506, 0.03705584, -1.211363, 1, 1, 1, 1, 1,
-0.05816299, 1.317817, -0.445176, 1, 1, 1, 1, 1,
-0.05686122, 2.201263, 0.3712697, 0, 0, 1, 1, 1,
-0.05448801, 1.807978, 1.083748, 1, 0, 0, 1, 1,
-0.05309723, -0.7448485, -1.519952, 1, 0, 0, 1, 1,
-0.05180439, 1.064507, 0.008044784, 1, 0, 0, 1, 1,
-0.05136599, -0.0164789, -0.9659832, 1, 0, 0, 1, 1,
-0.05076733, -0.7531001, -2.723117, 1, 0, 0, 1, 1,
-0.04344962, -0.6309057, -2.610725, 0, 0, 0, 1, 1,
-0.04273189, -0.05831199, -3.040598, 0, 0, 0, 1, 1,
-0.04258236, 2.07964, 1.513978, 0, 0, 0, 1, 1,
-0.03254081, -0.9277008, -2.895135, 0, 0, 0, 1, 1,
-0.03123721, 2.446117, 0.5108095, 0, 0, 0, 1, 1,
-0.03066435, 1.571336, 1.152079, 0, 0, 0, 1, 1,
-0.01449903, -0.7782046, -0.9492846, 0, 0, 0, 1, 1,
-0.01436573, 0.5622928, 0.6649985, 1, 1, 1, 1, 1,
-0.01317777, -1.231724, -2.221543, 1, 1, 1, 1, 1,
-0.01163478, -0.792005, -4.097301, 1, 1, 1, 1, 1,
-0.01131847, 1.186158, 0.8913569, 1, 1, 1, 1, 1,
-0.01095617, -1.647332, -3.083396, 1, 1, 1, 1, 1,
-0.01038196, 0.5234287, 1.037372, 1, 1, 1, 1, 1,
-0.009702197, 0.303255, -0.2757198, 1, 1, 1, 1, 1,
-0.005845465, 0.3580565, -0.4364156, 1, 1, 1, 1, 1,
-0.005346942, 0.8177615, 0.08528773, 1, 1, 1, 1, 1,
-0.004294212, -0.8399568, -1.985134, 1, 1, 1, 1, 1,
-0.003680059, 0.05208969, 1.220149, 1, 1, 1, 1, 1,
-0.0008050479, 0.4019903, -0.09628337, 1, 1, 1, 1, 1,
0.0003458344, 0.8194315, -0.246023, 1, 1, 1, 1, 1,
0.0003478016, 0.03357735, 0.2797563, 1, 1, 1, 1, 1,
0.00243, -0.7207598, 2.64247, 1, 1, 1, 1, 1,
0.002901453, 0.7710098, -1.019528, 0, 0, 1, 1, 1,
0.005737492, -1.654144, 4.128674, 1, 0, 0, 1, 1,
0.006881736, 0.2709274, -0.8250166, 1, 0, 0, 1, 1,
0.01067072, -0.2092995, 1.449783, 1, 0, 0, 1, 1,
0.01160001, -2.163657, 3.497136, 1, 0, 0, 1, 1,
0.01527345, -0.2591624, 3.874716, 1, 0, 0, 1, 1,
0.01559766, 0.8766657, 0.4104828, 0, 0, 0, 1, 1,
0.01603749, 0.6310727, -1.079063, 0, 0, 0, 1, 1,
0.02050103, 0.3694238, -0.5479033, 0, 0, 0, 1, 1,
0.02534991, 0.4756287, -0.8931277, 0, 0, 0, 1, 1,
0.02580494, 0.2101308, 1.184974, 0, 0, 0, 1, 1,
0.02878381, -1.037088, 5.017549, 0, 0, 0, 1, 1,
0.02970678, -0.7249571, 3.465204, 0, 0, 0, 1, 1,
0.03005596, 0.3442756, 1.78028, 1, 1, 1, 1, 1,
0.03157871, 1.391698, 0.4020049, 1, 1, 1, 1, 1,
0.03206565, -1.387255, 1.181288, 1, 1, 1, 1, 1,
0.03292499, -1.580654, 2.689333, 1, 1, 1, 1, 1,
0.03417787, -0.2643598, 3.550701, 1, 1, 1, 1, 1,
0.03451561, 1.383086, 0.8184456, 1, 1, 1, 1, 1,
0.03801979, -1.410963, 2.865256, 1, 1, 1, 1, 1,
0.03894137, -0.08379987, 4.536328, 1, 1, 1, 1, 1,
0.04189309, 2.258461, -0.83214, 1, 1, 1, 1, 1,
0.04625919, 0.6324236, 0.4367695, 1, 1, 1, 1, 1,
0.04633579, 3.388031, 0.8191931, 1, 1, 1, 1, 1,
0.04925694, 0.3458385, 0.297246, 1, 1, 1, 1, 1,
0.04935754, 1.163174, 0.6384991, 1, 1, 1, 1, 1,
0.0570626, 2.364339, -0.8979518, 1, 1, 1, 1, 1,
0.05794845, 0.6152763, 0.02443161, 1, 1, 1, 1, 1,
0.0591176, 1.305202, 0.1066305, 0, 0, 1, 1, 1,
0.06226455, 0.682417, 0.3935401, 1, 0, 0, 1, 1,
0.0622971, -0.8849841, 3.606731, 1, 0, 0, 1, 1,
0.06924036, 1.704014, 1.339688, 1, 0, 0, 1, 1,
0.07067937, 1.856098, 0.284097, 1, 0, 0, 1, 1,
0.07081263, 0.3052886, 0.5362052, 1, 0, 0, 1, 1,
0.07220592, -1.021871, 2.519991, 0, 0, 0, 1, 1,
0.07516144, -0.5413646, 1.695213, 0, 0, 0, 1, 1,
0.07731798, -2.203878, 2.788292, 0, 0, 0, 1, 1,
0.08191943, 1.077936, 0.6372348, 0, 0, 0, 1, 1,
0.08327373, -0.1196199, 3.768901, 0, 0, 0, 1, 1,
0.08428244, -0.288546, 3.73805, 0, 0, 0, 1, 1,
0.08503161, -0.2551769, 3.296136, 0, 0, 0, 1, 1,
0.08703165, -0.8008764, 2.283658, 1, 1, 1, 1, 1,
0.09198759, 0.2746627, 0.357824, 1, 1, 1, 1, 1,
0.09378821, 0.1083243, -0.8161249, 1, 1, 1, 1, 1,
0.09624039, -0.3112961, 3.62383, 1, 1, 1, 1, 1,
0.09983305, -0.4910075, 4.899709, 1, 1, 1, 1, 1,
0.101712, -2.414106, 3.689574, 1, 1, 1, 1, 1,
0.1048069, -0.06838393, 0.1087007, 1, 1, 1, 1, 1,
0.1052024, -0.2338339, 2.965362, 1, 1, 1, 1, 1,
0.1064826, 0.2161987, -0.8394593, 1, 1, 1, 1, 1,
0.107874, 0.8177403, 1.341733, 1, 1, 1, 1, 1,
0.1105075, -0.689711, 2.49071, 1, 1, 1, 1, 1,
0.113374, -0.6857024, 2.25719, 1, 1, 1, 1, 1,
0.1159059, -0.3050683, 2.376009, 1, 1, 1, 1, 1,
0.1199394, -1.334867, 3.418955, 1, 1, 1, 1, 1,
0.122567, -2.290853, 1.874348, 1, 1, 1, 1, 1,
0.1287723, -1.563031, 2.872467, 0, 0, 1, 1, 1,
0.1304683, -1.39491, 3.757459, 1, 0, 0, 1, 1,
0.1319329, -0.6438711, 0.6510681, 1, 0, 0, 1, 1,
0.132352, 0.7060444, 1.808297, 1, 0, 0, 1, 1,
0.1335832, 0.3038083, 0.631424, 1, 0, 0, 1, 1,
0.1370639, -0.3536564, 2.788512, 1, 0, 0, 1, 1,
0.1377851, 1.141464, 1.103426, 0, 0, 0, 1, 1,
0.1380742, -0.1501114, 2.240932, 0, 0, 0, 1, 1,
0.1383454, -0.1784844, 2.470995, 0, 0, 0, 1, 1,
0.1385457, -1.019146, 4.090171, 0, 0, 0, 1, 1,
0.1385823, 0.7243208, 1.796931, 0, 0, 0, 1, 1,
0.1386077, -0.9387143, 2.080079, 0, 0, 0, 1, 1,
0.1394404, 0.08081087, 1.571331, 0, 0, 0, 1, 1,
0.1395941, 0.6019248, -0.4332768, 1, 1, 1, 1, 1,
0.1402758, -1.568902, 2.170384, 1, 1, 1, 1, 1,
0.1407009, -0.124348, 4.054606, 1, 1, 1, 1, 1,
0.1420645, -1.64155, 3.844062, 1, 1, 1, 1, 1,
0.1440601, -0.9402829, 3.139541, 1, 1, 1, 1, 1,
0.1588411, -0.1000508, 2.042888, 1, 1, 1, 1, 1,
0.1595462, -0.02062821, 0.4001909, 1, 1, 1, 1, 1,
0.1616663, 0.9195971, -0.7031992, 1, 1, 1, 1, 1,
0.1633434, 1.50856, -0.3002579, 1, 1, 1, 1, 1,
0.1638258, 1.777213, 1.780348, 1, 1, 1, 1, 1,
0.168258, 0.2904153, 2.047171, 1, 1, 1, 1, 1,
0.1685758, -1.574707, 3.519056, 1, 1, 1, 1, 1,
0.1700977, 0.4320801, -0.781222, 1, 1, 1, 1, 1,
0.1718577, -0.7670341, 2.91998, 1, 1, 1, 1, 1,
0.1735769, 0.92203, -0.2506896, 1, 1, 1, 1, 1,
0.178587, -0.6567292, 4.633816, 0, 0, 1, 1, 1,
0.1792316, -1.270711, 2.849153, 1, 0, 0, 1, 1,
0.1883629, 0.2256203, 0.9212565, 1, 0, 0, 1, 1,
0.1888804, -1.14874, 3.303747, 1, 0, 0, 1, 1,
0.1893952, -1.08411, 1.390103, 1, 0, 0, 1, 1,
0.1905104, 0.8203173, 0.3494543, 1, 0, 0, 1, 1,
0.1950097, -0.3043105, 1.642074, 0, 0, 0, 1, 1,
0.19844, -1.187006, 4.85229, 0, 0, 0, 1, 1,
0.1988324, 0.4787567, 0.0128533, 0, 0, 0, 1, 1,
0.1995616, -0.4886474, 3.202651, 0, 0, 0, 1, 1,
0.1997402, -0.4851223, 2.932333, 0, 0, 0, 1, 1,
0.2032293, 0.9549569, 1.012508, 0, 0, 0, 1, 1,
0.2115737, 1.132128, 0.8953213, 0, 0, 0, 1, 1,
0.2125349, -1.858646, 2.726905, 1, 1, 1, 1, 1,
0.2130463, 0.2810243, -0.2916882, 1, 1, 1, 1, 1,
0.2191841, 1.86815, 0.498824, 1, 1, 1, 1, 1,
0.2210677, 1.481498, -0.3407878, 1, 1, 1, 1, 1,
0.2236336, 0.5350613, 0.3979961, 1, 1, 1, 1, 1,
0.2282283, -1.409544, 3.702545, 1, 1, 1, 1, 1,
0.2286141, -0.5185039, 2.299573, 1, 1, 1, 1, 1,
0.2380501, 1.772733, 0.29141, 1, 1, 1, 1, 1,
0.2421783, 1.457976, -0.5894186, 1, 1, 1, 1, 1,
0.2468597, 0.61661, 0.5806703, 1, 1, 1, 1, 1,
0.2481706, 0.7534549, 1.087523, 1, 1, 1, 1, 1,
0.2485552, 0.006194845, -0.1990253, 1, 1, 1, 1, 1,
0.251772, -0.5036717, 2.380663, 1, 1, 1, 1, 1,
0.2611417, 0.6379749, 2.090378, 1, 1, 1, 1, 1,
0.2647704, -0.2367471, 1.703585, 1, 1, 1, 1, 1,
0.2666887, 0.8407526, 2.504686, 0, 0, 1, 1, 1,
0.267801, -1.463096, 3.538481, 1, 0, 0, 1, 1,
0.2711005, 0.7586452, 1.277915, 1, 0, 0, 1, 1,
0.2762322, 0.2540847, 4.809418, 1, 0, 0, 1, 1,
0.2770608, -0.1562906, 2.369879, 1, 0, 0, 1, 1,
0.2781248, -1.137132, 3.815669, 1, 0, 0, 1, 1,
0.2782279, 1.279171, 1.01661, 0, 0, 0, 1, 1,
0.2809431, 1.639642, 1.419188, 0, 0, 0, 1, 1,
0.2912459, -0.5086192, 1.960489, 0, 0, 0, 1, 1,
0.2963931, 1.173104, 0.2239216, 0, 0, 0, 1, 1,
0.2996536, -1.013571, 2.166337, 0, 0, 0, 1, 1,
0.3000098, -1.246633, 2.871065, 0, 0, 0, 1, 1,
0.3022594, 0.6049464, 0.3048729, 0, 0, 0, 1, 1,
0.303147, 0.03445698, 3.005152, 1, 1, 1, 1, 1,
0.3057638, 1.173812, 0.7973079, 1, 1, 1, 1, 1,
0.3059215, -1.095618, 3.283985, 1, 1, 1, 1, 1,
0.3147496, 0.3406097, 0.4651711, 1, 1, 1, 1, 1,
0.3161191, -1.102801, 3.371165, 1, 1, 1, 1, 1,
0.3242703, -1.748985, 2.302905, 1, 1, 1, 1, 1,
0.3254157, 0.3605327, 0.8097034, 1, 1, 1, 1, 1,
0.3335907, -1.61512, 2.949049, 1, 1, 1, 1, 1,
0.3368846, -0.5869085, 3.353903, 1, 1, 1, 1, 1,
0.3427621, 0.4438574, 1.178706, 1, 1, 1, 1, 1,
0.3526776, -1.830688, 2.440884, 1, 1, 1, 1, 1,
0.3533756, 0.9374802, 0.5878758, 1, 1, 1, 1, 1,
0.3542171, 0.2645547, 1.367869, 1, 1, 1, 1, 1,
0.3545048, -0.5654086, 1.132004, 1, 1, 1, 1, 1,
0.3550553, 0.02071449, 2.871831, 1, 1, 1, 1, 1,
0.3565758, 0.3905877, 0.2700814, 0, 0, 1, 1, 1,
0.3594586, -0.4689254, 1.135814, 1, 0, 0, 1, 1,
0.3613088, 0.02162265, 1.523367, 1, 0, 0, 1, 1,
0.3615212, -0.3253183, 3.410103, 1, 0, 0, 1, 1,
0.3632212, 1.703549, 0.7639629, 1, 0, 0, 1, 1,
0.3669231, -0.6040832, 2.499044, 1, 0, 0, 1, 1,
0.3692732, 0.2162281, -0.8571327, 0, 0, 0, 1, 1,
0.3699132, -0.4478444, 3.534265, 0, 0, 0, 1, 1,
0.3711106, 1.016392, 0.3196953, 0, 0, 0, 1, 1,
0.3743146, 0.07091571, 0.926124, 0, 0, 0, 1, 1,
0.3785465, -0.8553045, 3.900273, 0, 0, 0, 1, 1,
0.3788571, -0.4862253, 2.079294, 0, 0, 0, 1, 1,
0.3846048, -2.490427, 3.845099, 0, 0, 0, 1, 1,
0.3895746, 1.984395, 0.02848672, 1, 1, 1, 1, 1,
0.3902135, -1.041339, 2.173866, 1, 1, 1, 1, 1,
0.3914093, 0.6479459, 0.8068168, 1, 1, 1, 1, 1,
0.3941897, 0.3318341, 0.6502786, 1, 1, 1, 1, 1,
0.3950289, 0.9788212, 0.4158963, 1, 1, 1, 1, 1,
0.4017143, -1.279497, 2.759092, 1, 1, 1, 1, 1,
0.4036577, 0.415539, -0.9737867, 1, 1, 1, 1, 1,
0.4077193, -1.181104, 1.406345, 1, 1, 1, 1, 1,
0.4083433, 1.057991, 0.2091408, 1, 1, 1, 1, 1,
0.4137678, 0.5273317, -0.4947496, 1, 1, 1, 1, 1,
0.420372, 0.3275321, 0.4583363, 1, 1, 1, 1, 1,
0.4217868, 0.2222021, 1.728185, 1, 1, 1, 1, 1,
0.4252811, 0.09299757, 2.566411, 1, 1, 1, 1, 1,
0.4330904, 0.5667461, 1.251019, 1, 1, 1, 1, 1,
0.4337084, 0.3725597, 1.089721, 1, 1, 1, 1, 1,
0.4349217, 0.9100893, -0.1890457, 0, 0, 1, 1, 1,
0.4366212, -0.1355111, 2.630646, 1, 0, 0, 1, 1,
0.4383846, -1.335923, 2.847182, 1, 0, 0, 1, 1,
0.4398501, 1.125031, 0.01300942, 1, 0, 0, 1, 1,
0.4420517, -0.5285244, 2.257884, 1, 0, 0, 1, 1,
0.4477603, 0.8602641, 0.8254319, 1, 0, 0, 1, 1,
0.4503519, -0.2351728, 0.538554, 0, 0, 0, 1, 1,
0.45128, -0.8701071, 1.807687, 0, 0, 0, 1, 1,
0.4539195, 0.8295283, -1.37625, 0, 0, 0, 1, 1,
0.459289, 1.086853, 1.51885, 0, 0, 0, 1, 1,
0.4646134, -0.2140703, 0.6444589, 0, 0, 0, 1, 1,
0.4679872, -1.064677, 3.14217, 0, 0, 0, 1, 1,
0.4688479, -0.3499272, 3.017439, 0, 0, 0, 1, 1,
0.4699557, 1.28501, -0.1186003, 1, 1, 1, 1, 1,
0.4710641, -0.3029427, 2.029173, 1, 1, 1, 1, 1,
0.4747319, 1.424385, -0.4685205, 1, 1, 1, 1, 1,
0.4758351, 0.7080101, 2.478977, 1, 1, 1, 1, 1,
0.4774121, 1.357009, -0.1241476, 1, 1, 1, 1, 1,
0.4837388, 1.170157, -0.3245656, 1, 1, 1, 1, 1,
0.4843272, -1.303775, 2.124799, 1, 1, 1, 1, 1,
0.4851794, 0.6330061, 0.1008115, 1, 1, 1, 1, 1,
0.4859162, 0.9223597, -1.34377, 1, 1, 1, 1, 1,
0.4867885, -0.7623446, 3.59736, 1, 1, 1, 1, 1,
0.4903403, -1.682742, 1.967751, 1, 1, 1, 1, 1,
0.4929159, 0.4154156, 2.053858, 1, 1, 1, 1, 1,
0.4943236, -0.6231797, 1.522643, 1, 1, 1, 1, 1,
0.4975362, -0.3477776, 3.118559, 1, 1, 1, 1, 1,
0.4994901, 1.047521, 0.9680501, 1, 1, 1, 1, 1,
0.5086256, 0.1245943, 0.8425958, 0, 0, 1, 1, 1,
0.5106414, -1.662256, 3.124723, 1, 0, 0, 1, 1,
0.5206494, 1.408866, -0.1666295, 1, 0, 0, 1, 1,
0.5211868, 0.5502286, -1.448519, 1, 0, 0, 1, 1,
0.5218095, -0.997515, 2.429495, 1, 0, 0, 1, 1,
0.5287852, -0.3891335, 3.161597, 1, 0, 0, 1, 1,
0.5288367, 1.605162, -0.2698093, 0, 0, 0, 1, 1,
0.536311, -0.9195907, 3.743287, 0, 0, 0, 1, 1,
0.5418327, 2.159271, 0.1086944, 0, 0, 0, 1, 1,
0.5419971, 1.320938, 2.119076, 0, 0, 0, 1, 1,
0.5440027, -2.610286, 1.256017, 0, 0, 0, 1, 1,
0.5444663, -1.328833, 3.971417, 0, 0, 0, 1, 1,
0.5458151, -1.925958, 2.138664, 0, 0, 0, 1, 1,
0.5560277, 0.1322401, 0.730463, 1, 1, 1, 1, 1,
0.5568249, -0.8708751, 2.684536, 1, 1, 1, 1, 1,
0.5617692, -0.4168572, 2.384093, 1, 1, 1, 1, 1,
0.5633522, 0.5796132, 1.411689, 1, 1, 1, 1, 1,
0.5645418, 0.09772629, 0.07467327, 1, 1, 1, 1, 1,
0.5708572, 0.159091, 0.7255142, 1, 1, 1, 1, 1,
0.5724375, 0.6175007, 0.338693, 1, 1, 1, 1, 1,
0.5751718, -1.298877, 3.913542, 1, 1, 1, 1, 1,
0.5816568, 0.2779295, 0.6363131, 1, 1, 1, 1, 1,
0.590388, 0.2133438, 2.036273, 1, 1, 1, 1, 1,
0.5943378, 0.5703903, 1.40827, 1, 1, 1, 1, 1,
0.5974224, 0.4280904, -0.4961389, 1, 1, 1, 1, 1,
0.5978848, -0.8489574, 3.608726, 1, 1, 1, 1, 1,
0.6003281, 0.3876107, 1.509511, 1, 1, 1, 1, 1,
0.6006169, -0.6194692, 2.648161, 1, 1, 1, 1, 1,
0.6040193, -0.6628853, 0.5901718, 0, 0, 1, 1, 1,
0.6173816, -1.375092, 2.240294, 1, 0, 0, 1, 1,
0.6213946, -1.454448, 3.45804, 1, 0, 0, 1, 1,
0.6244544, -0.9030761, 1.582865, 1, 0, 0, 1, 1,
0.6272385, 1.0622, -0.3011641, 1, 0, 0, 1, 1,
0.6282104, -0.645672, 1.143016, 1, 0, 0, 1, 1,
0.6294721, 2.712586, 0.4977031, 0, 0, 0, 1, 1,
0.6304316, -1.466567, 3.198049, 0, 0, 0, 1, 1,
0.6360627, 1.030078, -0.24305, 0, 0, 0, 1, 1,
0.6480091, -0.0900277, 3.314313, 0, 0, 0, 1, 1,
0.6481369, -0.3793438, 1.048352, 0, 0, 0, 1, 1,
0.6507826, 0.4791622, -0.6301031, 0, 0, 0, 1, 1,
0.6510751, 0.3727764, 0.5907758, 0, 0, 0, 1, 1,
0.6663425, -0.1541518, 0.9711895, 1, 1, 1, 1, 1,
0.6789822, 0.7261471, -0.5335984, 1, 1, 1, 1, 1,
0.6808067, -0.03407506, 0.3039352, 1, 1, 1, 1, 1,
0.6823035, -0.3632558, 2.751764, 1, 1, 1, 1, 1,
0.6840478, -0.1376373, 0.9614785, 1, 1, 1, 1, 1,
0.6845028, -0.7256547, 2.157296, 1, 1, 1, 1, 1,
0.6880127, -0.04356319, 1.445392, 1, 1, 1, 1, 1,
0.6923817, -1.828042, 4.283617, 1, 1, 1, 1, 1,
0.6940066, 0.3406065, 1.05949, 1, 1, 1, 1, 1,
0.6964285, -0.2261369, 2.490999, 1, 1, 1, 1, 1,
0.6993066, -0.8139589, 1.886743, 1, 1, 1, 1, 1,
0.7012369, 0.6929109, 1.787515, 1, 1, 1, 1, 1,
0.701645, -0.0884922, 2.37818, 1, 1, 1, 1, 1,
0.7042271, 0.8983371, 0.6219232, 1, 1, 1, 1, 1,
0.7118176, 0.5121092, -0.05540607, 1, 1, 1, 1, 1,
0.7165983, 0.2898878, 1.710608, 0, 0, 1, 1, 1,
0.7183728, 0.6271045, -0.2329979, 1, 0, 0, 1, 1,
0.720662, -0.07744806, 1.615245, 1, 0, 0, 1, 1,
0.7220417, 0.6679006, -0.5526916, 1, 0, 0, 1, 1,
0.72491, 0.4847817, 0.7113465, 1, 0, 0, 1, 1,
0.7260562, 0.03401121, 0.8255444, 1, 0, 0, 1, 1,
0.7269185, -0.03378742, 1.659766, 0, 0, 0, 1, 1,
0.7294152, 0.3088455, 2.171471, 0, 0, 0, 1, 1,
0.7327757, -0.8113478, 0.3690357, 0, 0, 0, 1, 1,
0.7344326, -1.560915, 1.886882, 0, 0, 0, 1, 1,
0.7354207, -0.2050117, 2.154747, 0, 0, 0, 1, 1,
0.7399304, 0.09214152, 2.751123, 0, 0, 0, 1, 1,
0.756185, 1.619293, 1.261185, 0, 0, 0, 1, 1,
0.7568508, 0.05219831, 2.521108, 1, 1, 1, 1, 1,
0.76084, 0.8937705, 0.5442856, 1, 1, 1, 1, 1,
0.7614166, -0.6595579, 3.433653, 1, 1, 1, 1, 1,
0.7675782, -0.3988838, 1.890502, 1, 1, 1, 1, 1,
0.7735023, -0.4402047, 1.357704, 1, 1, 1, 1, 1,
0.7759823, -0.3212605, 2.193731, 1, 1, 1, 1, 1,
0.7762475, 0.1027465, 2.073627, 1, 1, 1, 1, 1,
0.7762724, -0.5696615, 1.626911, 1, 1, 1, 1, 1,
0.776684, -1.089006, 3.33711, 1, 1, 1, 1, 1,
0.7775357, -0.9256393, 1.12239, 1, 1, 1, 1, 1,
0.7779226, 1.413041, -0.1440825, 1, 1, 1, 1, 1,
0.779392, 0.6639982, 0.7124529, 1, 1, 1, 1, 1,
0.781264, 0.0702067, 2.719174, 1, 1, 1, 1, 1,
0.7845545, -1.112383, 3.330701, 1, 1, 1, 1, 1,
0.7853377, 0.3594421, 0.04849974, 1, 1, 1, 1, 1,
0.787436, 0.9783752, -0.9897087, 0, 0, 1, 1, 1,
0.7956208, -0.5243065, 2.603593, 1, 0, 0, 1, 1,
0.7981925, 1.743284, 0.6659811, 1, 0, 0, 1, 1,
0.7995464, -0.4819192, 3.286953, 1, 0, 0, 1, 1,
0.7995636, -0.5844959, 1.151384, 1, 0, 0, 1, 1,
0.8077801, 0.5172259, 0.6648579, 1, 0, 0, 1, 1,
0.8124601, 0.9583118, 0.9256757, 0, 0, 0, 1, 1,
0.8138447, 0.1540314, 1.689096, 0, 0, 0, 1, 1,
0.8190573, 0.917074, -0.6451376, 0, 0, 0, 1, 1,
0.8282327, 0.5363128, 0.5233587, 0, 0, 0, 1, 1,
0.8329476, -0.639519, 1.765947, 0, 0, 0, 1, 1,
0.8334366, 0.2569847, 0.4681635, 0, 0, 0, 1, 1,
0.8429548, -0.3719411, 2.336209, 0, 0, 0, 1, 1,
0.8475383, 0.1514458, 3.564858, 1, 1, 1, 1, 1,
0.8536041, -1.483146, 4.968534, 1, 1, 1, 1, 1,
0.8553236, 1.338744, 1.858738, 1, 1, 1, 1, 1,
0.8624639, -1.176766, 1.521275, 1, 1, 1, 1, 1,
0.8641125, -0.4382086, 3.71026, 1, 1, 1, 1, 1,
0.8660604, -0.2509894, 2.199658, 1, 1, 1, 1, 1,
0.868073, 0.03459464, 1.499783, 1, 1, 1, 1, 1,
0.8708512, 0.768788, 1.449705, 1, 1, 1, 1, 1,
0.8708792, 0.2244805, 0.2635971, 1, 1, 1, 1, 1,
0.8731092, 0.7334848, 0.7126788, 1, 1, 1, 1, 1,
0.8782879, 0.431371, 1.532549, 1, 1, 1, 1, 1,
0.8791825, -0.7420676, 1.626265, 1, 1, 1, 1, 1,
0.8809965, -0.0375966, 2.371994, 1, 1, 1, 1, 1,
0.8814658, 1.447877, -0.3711281, 1, 1, 1, 1, 1,
0.888099, 0.74945, 2.209546, 1, 1, 1, 1, 1,
0.8963958, -1.14259, 2.191979, 0, 0, 1, 1, 1,
0.8975183, -0.4371011, 1.617492, 1, 0, 0, 1, 1,
0.9014426, 1.398446, 1.17023, 1, 0, 0, 1, 1,
0.9054412, -0.236692, 1.595229, 1, 0, 0, 1, 1,
0.9138762, 0.8295278, 1.971776, 1, 0, 0, 1, 1,
0.9215397, 0.6313896, 1.046915, 1, 0, 0, 1, 1,
0.9225199, -0.0678646, 2.043386, 0, 0, 0, 1, 1,
0.9277624, -1.552028, 3.071798, 0, 0, 0, 1, 1,
0.9284472, -1.850922, 0.1446527, 0, 0, 0, 1, 1,
0.9362345, 0.7060527, -0.5820037, 0, 0, 0, 1, 1,
0.9373817, 0.08359952, 1.485804, 0, 0, 0, 1, 1,
0.9422349, 0.07137629, 1.188119, 0, 0, 0, 1, 1,
0.9445174, -1.661353, 3.114289, 0, 0, 0, 1, 1,
0.9554358, -0.07978771, 1.049439, 1, 1, 1, 1, 1,
0.9603433, -1.078988, 3.867013, 1, 1, 1, 1, 1,
0.9609308, -1.280051, 2.790051, 1, 1, 1, 1, 1,
0.9653001, -0.5508739, 2.400544, 1, 1, 1, 1, 1,
0.972913, 0.7339296, 1.267998, 1, 1, 1, 1, 1,
0.9835169, -1.088873, 3.124021, 1, 1, 1, 1, 1,
0.9874724, -0.7140163, 2.534171, 1, 1, 1, 1, 1,
0.9882318, -0.0312221, 0.9934232, 1, 1, 1, 1, 1,
0.9972469, -0.1652501, 0.8855693, 1, 1, 1, 1, 1,
1.002339, -0.2148194, 0.7784771, 1, 1, 1, 1, 1,
1.005453, 0.5726777, 1.609228, 1, 1, 1, 1, 1,
1.007177, -1.481234, 2.049357, 1, 1, 1, 1, 1,
1.01127, -0.8631369, 2.286031, 1, 1, 1, 1, 1,
1.014998, -0.1843333, 2.738641, 1, 1, 1, 1, 1,
1.018508, -1.14653, 4.200605, 1, 1, 1, 1, 1,
1.018804, -1.832132, 2.169264, 0, 0, 1, 1, 1,
1.025663, 0.06438306, 2.052409, 1, 0, 0, 1, 1,
1.040139, 0.6243501, 2.198155, 1, 0, 0, 1, 1,
1.040335, 0.09408421, 2.140886, 1, 0, 0, 1, 1,
1.040531, -0.2284113, 3.08618, 1, 0, 0, 1, 1,
1.04653, 0.2214694, 1.232789, 1, 0, 0, 1, 1,
1.053281, 0.01577849, 2.420746, 0, 0, 0, 1, 1,
1.057781, 1.62032, 1.06925, 0, 0, 0, 1, 1,
1.067697, 0.3612362, 0.4216159, 0, 0, 0, 1, 1,
1.06883, 1.12551, 2.416543, 0, 0, 0, 1, 1,
1.068915, 0.1330513, 1.738411, 0, 0, 0, 1, 1,
1.07021, 0.3113328, 1.065773, 0, 0, 0, 1, 1,
1.070897, -1.147065, 1.751433, 0, 0, 0, 1, 1,
1.071388, 0.3523566, 3.145504, 1, 1, 1, 1, 1,
1.082702, -0.2634573, 1.331116, 1, 1, 1, 1, 1,
1.085655, -0.5930309, 1.651862, 1, 1, 1, 1, 1,
1.089365, -0.05333926, 0.169794, 1, 1, 1, 1, 1,
1.091038, -0.1901528, 2.203315, 1, 1, 1, 1, 1,
1.092847, 1.168704, 1.013962, 1, 1, 1, 1, 1,
1.09494, -1.852469, 1.196164, 1, 1, 1, 1, 1,
1.096031, 1.641332, 0.002486332, 1, 1, 1, 1, 1,
1.099215, -1.10904, 2.189172, 1, 1, 1, 1, 1,
1.104655, -0.3415256, 2.604972, 1, 1, 1, 1, 1,
1.136746, 0.07049758, 0.6094458, 1, 1, 1, 1, 1,
1.138135, -0.2356899, 1.267056, 1, 1, 1, 1, 1,
1.141172, 0.875743, -1.802116, 1, 1, 1, 1, 1,
1.144619, -0.8648844, 3.054549, 1, 1, 1, 1, 1,
1.146544, -1.514634, 2.356407, 1, 1, 1, 1, 1,
1.149993, 0.1461118, 0.8860442, 0, 0, 1, 1, 1,
1.150077, -0.969579, 2.989371, 1, 0, 0, 1, 1,
1.15792, -1.017628, 1.380157, 1, 0, 0, 1, 1,
1.158151, -1.28303, 4.154905, 1, 0, 0, 1, 1,
1.158453, 1.15836, 1.407759, 1, 0, 0, 1, 1,
1.163047, 0.9357513, 1.442144, 1, 0, 0, 1, 1,
1.163396, -1.985078, 3.849201, 0, 0, 0, 1, 1,
1.169439, -0.4612562, 2.133068, 0, 0, 0, 1, 1,
1.17635, -0.5567217, 1.507819, 0, 0, 0, 1, 1,
1.178959, -0.1204566, 1.008405, 0, 0, 0, 1, 1,
1.180458, 1.02005, 1.106993, 0, 0, 0, 1, 1,
1.183261, 0.7630386, -0.1788584, 0, 0, 0, 1, 1,
1.196714, 0.4984908, 1.118756, 0, 0, 0, 1, 1,
1.200682, -0.5647968, 1.036295, 1, 1, 1, 1, 1,
1.202203, -0.5465662, 1.476538, 1, 1, 1, 1, 1,
1.205765, 0.7309756, 1.812905, 1, 1, 1, 1, 1,
1.208599, -0.581735, 0.8770909, 1, 1, 1, 1, 1,
1.211725, 0.2714307, 2.497642, 1, 1, 1, 1, 1,
1.234566, 1.045191, 0.8627331, 1, 1, 1, 1, 1,
1.23801, 1.052969, 2.073263, 1, 1, 1, 1, 1,
1.245927, -0.7534498, 4.097126, 1, 1, 1, 1, 1,
1.246052, -0.3307537, 0.2455197, 1, 1, 1, 1, 1,
1.249295, -0.535453, 0.7138808, 1, 1, 1, 1, 1,
1.249586, 1.745435, 0.1141671, 1, 1, 1, 1, 1,
1.254956, -1.002861, 1.76225, 1, 1, 1, 1, 1,
1.25929, -0.7041724, 3.547185, 1, 1, 1, 1, 1,
1.265228, 1.543444, 0.8918813, 1, 1, 1, 1, 1,
1.267355, 1.31692, 0.1575044, 1, 1, 1, 1, 1,
1.277172, 0.2740543, 1.140273, 0, 0, 1, 1, 1,
1.283734, 1.247466, 2.230885, 1, 0, 0, 1, 1,
1.284332, -0.8495791, 0.8339343, 1, 0, 0, 1, 1,
1.291581, -0.2975634, 2.14158, 1, 0, 0, 1, 1,
1.294824, 0.3746326, 1.573575, 1, 0, 0, 1, 1,
1.298181, 0.9059762, 1.077718, 1, 0, 0, 1, 1,
1.301749, 0.5151662, -0.1351455, 0, 0, 0, 1, 1,
1.303145, -1.58316, 2.669367, 0, 0, 0, 1, 1,
1.307816, 1.283228, 1.761975, 0, 0, 0, 1, 1,
1.317804, -0.5758977, 3.226167, 0, 0, 0, 1, 1,
1.317898, 0.2161399, 1.685557, 0, 0, 0, 1, 1,
1.320659, -0.9388413, 1.566997, 0, 0, 0, 1, 1,
1.322507, 2.00322, -0.1863541, 0, 0, 0, 1, 1,
1.332457, 2.028794, -0.1363831, 1, 1, 1, 1, 1,
1.33914, 0.4052173, 1.724527, 1, 1, 1, 1, 1,
1.343792, -1.111708, 3.416665, 1, 1, 1, 1, 1,
1.348479, -2.378069, 3.169852, 1, 1, 1, 1, 1,
1.350796, 0.2976123, 2.104327, 1, 1, 1, 1, 1,
1.366892, -0.7466878, 1.908533, 1, 1, 1, 1, 1,
1.383945, -0.554326, 2.558745, 1, 1, 1, 1, 1,
1.399833, 0.2383505, 1.268012, 1, 1, 1, 1, 1,
1.400574, -1.110515, 1.038848, 1, 1, 1, 1, 1,
1.405847, 1.034153, 0.3001851, 1, 1, 1, 1, 1,
1.407647, 2.463719, 0.1883071, 1, 1, 1, 1, 1,
1.407988, -0.7185713, 1.863449, 1, 1, 1, 1, 1,
1.439479, 0.895927, 0.4737712, 1, 1, 1, 1, 1,
1.452666, 0.7833697, 0.07735918, 1, 1, 1, 1, 1,
1.48017, 0.6349615, -0.7470939, 1, 1, 1, 1, 1,
1.482029, 0.4798096, 0.1375827, 0, 0, 1, 1, 1,
1.486892, -0.5346987, 2.669197, 1, 0, 0, 1, 1,
1.488778, 0.3063046, 2.015228, 1, 0, 0, 1, 1,
1.494693, -0.4038418, 1.6731, 1, 0, 0, 1, 1,
1.503488, 0.1270283, 4.253457, 1, 0, 0, 1, 1,
1.521305, -1.893225, 2.386204, 1, 0, 0, 1, 1,
1.52285, 0.4900438, 0.3028194, 0, 0, 0, 1, 1,
1.526048, -0.2542342, 0.7626282, 0, 0, 0, 1, 1,
1.531563, -0.07223119, 2.431109, 0, 0, 0, 1, 1,
1.532032, -1.329745, 2.884924, 0, 0, 0, 1, 1,
1.550971, 1.30269, 1.657461, 0, 0, 0, 1, 1,
1.551308, 0.4588073, 1.526055, 0, 0, 0, 1, 1,
1.553369, 0.8820673, 2.394549, 0, 0, 0, 1, 1,
1.588108, -0.09582438, 0.9986185, 1, 1, 1, 1, 1,
1.593643, -0.2078595, 2.382662, 1, 1, 1, 1, 1,
1.618787, -0.4903575, 1.892366, 1, 1, 1, 1, 1,
1.620872, 0.03357925, 1.175971, 1, 1, 1, 1, 1,
1.621337, 0.9934705, 1.020821, 1, 1, 1, 1, 1,
1.644984, 1.132223, -0.7570289, 1, 1, 1, 1, 1,
1.646262, -0.4243067, 0.8176571, 1, 1, 1, 1, 1,
1.650644, -0.4478564, 1.433459, 1, 1, 1, 1, 1,
1.653343, 1.346626, 0.6141943, 1, 1, 1, 1, 1,
1.657085, -0.2416073, 1.620444, 1, 1, 1, 1, 1,
1.667794, 2.127596, -2.07513, 1, 1, 1, 1, 1,
1.670873, -0.9957407, 2.713771, 1, 1, 1, 1, 1,
1.677641, -0.8971729, 2.801671, 1, 1, 1, 1, 1,
1.694291, 1.662704, 1.581731, 1, 1, 1, 1, 1,
1.704285, -0.6623745, 2.389067, 1, 1, 1, 1, 1,
1.707411, -0.0727677, 0.9084002, 0, 0, 1, 1, 1,
1.71708, 2.516064, -0.2210858, 1, 0, 0, 1, 1,
1.719076, -1.023778, 1.732351, 1, 0, 0, 1, 1,
1.719501, 0.09170911, 2.635119, 1, 0, 0, 1, 1,
1.722519, 0.9967045, 0.9145215, 1, 0, 0, 1, 1,
1.726247, 0.3469895, -0.5794088, 1, 0, 0, 1, 1,
1.754629, -1.241482, 2.424077, 0, 0, 0, 1, 1,
1.756957, 0.06933887, 1.678449, 0, 0, 0, 1, 1,
1.767099, -1.849765, 3.173277, 0, 0, 0, 1, 1,
1.779746, -0.117434, 0.8702011, 0, 0, 0, 1, 1,
1.780031, -0.02374768, 2.633288, 0, 0, 0, 1, 1,
1.786686, 2.174891, 0.2352844, 0, 0, 0, 1, 1,
1.792303, -1.076902, 4.431705, 0, 0, 0, 1, 1,
1.80029, -0.6247815, 3.393641, 1, 1, 1, 1, 1,
1.817909, 0.9497226, -0.02997671, 1, 1, 1, 1, 1,
1.821074, 0.4825701, -0.2910167, 1, 1, 1, 1, 1,
1.822138, 1.105551, 0.4119853, 1, 1, 1, 1, 1,
1.832651, -0.6862409, 2.661938, 1, 1, 1, 1, 1,
1.837967, -0.8855132, 2.789034, 1, 1, 1, 1, 1,
1.864507, -1.207311, 1.619303, 1, 1, 1, 1, 1,
1.878751, 0.5332178, 0.9606222, 1, 1, 1, 1, 1,
1.897915, -0.2980934, 1.84719, 1, 1, 1, 1, 1,
1.910859, -0.6971645, 2.982211, 1, 1, 1, 1, 1,
1.924963, 0.5574514, 2.251692, 1, 1, 1, 1, 1,
1.936983, 0.8393374, 0.443008, 1, 1, 1, 1, 1,
1.950363, 0.3254228, 2.361289, 1, 1, 1, 1, 1,
1.970341, 0.5116863, 2.670266, 1, 1, 1, 1, 1,
2.004165, -0.2016265, 1.041235, 1, 1, 1, 1, 1,
2.022657, -1.330426, 2.635104, 0, 0, 1, 1, 1,
2.032882, 0.3189928, 1.777218, 1, 0, 0, 1, 1,
2.039393, 0.05528834, 2.350518, 1, 0, 0, 1, 1,
2.06677, 0.8923254, 3.812865, 1, 0, 0, 1, 1,
2.112854, 0.1956164, 2.419781, 1, 0, 0, 1, 1,
2.154872, -0.8041984, 2.751872, 1, 0, 0, 1, 1,
2.156554, -0.4740648, 3.047484, 0, 0, 0, 1, 1,
2.164719, -0.44564, 2.292848, 0, 0, 0, 1, 1,
2.188457, -0.007432292, 1.282913, 0, 0, 0, 1, 1,
2.236589, -3.129028, 2.863518, 0, 0, 0, 1, 1,
2.326164, -0.08286189, 0.7005336, 0, 0, 0, 1, 1,
2.329111, 1.214728, 1.024043, 0, 0, 0, 1, 1,
2.332502, -0.8810089, 0.6729637, 0, 0, 0, 1, 1,
2.434818, -0.29034, -0.3452931, 1, 1, 1, 1, 1,
2.453081, 1.398492, 2.178106, 1, 1, 1, 1, 1,
2.667926, 1.533012, -0.4487773, 1, 1, 1, 1, 1,
2.668262, 0.2261172, 0.8807101, 1, 1, 1, 1, 1,
2.7421, 1.089201, 1.018659, 1, 1, 1, 1, 1,
2.744688, 0.1544862, 1.55775, 1, 1, 1, 1, 1,
2.86008, 1.061801, 1.345738, 1, 1, 1, 1, 1
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
var radius = 9.418394;
var distance = 33.08171;
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
mvMatrix.translate( 0.1696298, -0.1022561, 0.2037401 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.08171);
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
