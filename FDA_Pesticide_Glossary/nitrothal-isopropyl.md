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
-3.450332, -1.55996, -2.31461, 1, 0, 0, 1,
-2.968991, -1.361882, -2.914647, 1, 0.007843138, 0, 1,
-2.879549, -0.04749494, 0.1072514, 1, 0.01176471, 0, 1,
-2.837745, -1.436322, -0.9336367, 1, 0.01960784, 0, 1,
-2.647847, -0.3921321, -0.8218557, 1, 0.02352941, 0, 1,
-2.416243, -0.2430934, -2.32707, 1, 0.03137255, 0, 1,
-2.385281, 0.7094096, -1.960747, 1, 0.03529412, 0, 1,
-2.349267, -1.444767, -2.477151, 1, 0.04313726, 0, 1,
-2.29754, -1.303943, -2.143034, 1, 0.04705882, 0, 1,
-2.292295, 1.907599, -1.651721, 1, 0.05490196, 0, 1,
-2.272708, -0.437018, -2.805846, 1, 0.05882353, 0, 1,
-2.25541, 0.05028648, -1.859744, 1, 0.06666667, 0, 1,
-2.247439, -1.682368, -1.071205, 1, 0.07058824, 0, 1,
-2.207173, 0.6694192, -0.4173219, 1, 0.07843138, 0, 1,
-2.195553, 0.5469893, -1.720946, 1, 0.08235294, 0, 1,
-2.181242, -0.1643017, -2.020287, 1, 0.09019608, 0, 1,
-2.127639, 0.9571433, -1.523032, 1, 0.09411765, 0, 1,
-2.102966, 0.2707642, -2.520677, 1, 0.1019608, 0, 1,
-2.085499, -0.1249092, -0.9410319, 1, 0.1098039, 0, 1,
-2.06174, -0.6950564, -0.4516049, 1, 0.1137255, 0, 1,
-2.059424, -1.887833, -3.169275, 1, 0.1215686, 0, 1,
-2.027756, 0.1227172, -1.091757, 1, 0.1254902, 0, 1,
-2.002601, -0.5052381, -1.543326, 1, 0.1333333, 0, 1,
-1.994473, 1.861751, -3.227422, 1, 0.1372549, 0, 1,
-1.991508, 1.770445, -2.050683, 1, 0.145098, 0, 1,
-1.985903, 0.7382281, 0.4735146, 1, 0.1490196, 0, 1,
-1.979416, -0.02855648, -2.03634, 1, 0.1568628, 0, 1,
-1.964143, 0.9401274, -0.07186119, 1, 0.1607843, 0, 1,
-1.947911, -0.6088083, -1.873291, 1, 0.1686275, 0, 1,
-1.906964, -0.634416, -1.009033, 1, 0.172549, 0, 1,
-1.901347, 2.555158, 1.093251, 1, 0.1803922, 0, 1,
-1.840074, 0.5245611, -1.017381, 1, 0.1843137, 0, 1,
-1.827124, -0.2390231, -2.226877, 1, 0.1921569, 0, 1,
-1.803586, 0.4534461, -1.57488, 1, 0.1960784, 0, 1,
-1.786008, 0.2251535, -3.234987, 1, 0.2039216, 0, 1,
-1.775069, -1.396183, -1.827514, 1, 0.2117647, 0, 1,
-1.760629, -1.511897, -2.463042, 1, 0.2156863, 0, 1,
-1.759912, 0.03212485, -1.788236, 1, 0.2235294, 0, 1,
-1.712295, -0.6278676, -0.5757702, 1, 0.227451, 0, 1,
-1.703727, 1.172773, -1.141711, 1, 0.2352941, 0, 1,
-1.702295, -0.03576563, -1.27848, 1, 0.2392157, 0, 1,
-1.692027, 0.798518, -0.3950411, 1, 0.2470588, 0, 1,
-1.691961, -1.387916, -2.190097, 1, 0.2509804, 0, 1,
-1.675632, -2.268413, -2.998045, 1, 0.2588235, 0, 1,
-1.672867, 0.04441778, -1.077623, 1, 0.2627451, 0, 1,
-1.672473, 1.03752, 1.137355, 1, 0.2705882, 0, 1,
-1.663465, 2.061286, 0.2333462, 1, 0.2745098, 0, 1,
-1.661285, -1.565018, -3.260593, 1, 0.282353, 0, 1,
-1.648318, 0.276984, 0.4216008, 1, 0.2862745, 0, 1,
-1.63967, 0.9139704, -1.540762, 1, 0.2941177, 0, 1,
-1.635832, 0.5428514, -1.095294, 1, 0.3019608, 0, 1,
-1.632953, -0.3298195, -1.938984, 1, 0.3058824, 0, 1,
-1.607061, 1.137472, -1.136081, 1, 0.3137255, 0, 1,
-1.589318, 0.2983913, -2.173528, 1, 0.3176471, 0, 1,
-1.582847, 2.211238, -1.101134, 1, 0.3254902, 0, 1,
-1.564826, -0.2854528, -2.78501, 1, 0.3294118, 0, 1,
-1.542593, 0.266476, -0.6080387, 1, 0.3372549, 0, 1,
-1.538988, 0.1156029, 0.07910357, 1, 0.3411765, 0, 1,
-1.53164, -1.452928, -4.979695, 1, 0.3490196, 0, 1,
-1.522125, 1.004183, 1.030239, 1, 0.3529412, 0, 1,
-1.516975, 0.492516, -0.8410252, 1, 0.3607843, 0, 1,
-1.501146, -1.422173, -0.8786232, 1, 0.3647059, 0, 1,
-1.479089, 1.652849, 0.2760983, 1, 0.372549, 0, 1,
-1.477545, 0.08659428, -1.556967, 1, 0.3764706, 0, 1,
-1.468566, -1.792887, -2.188712, 1, 0.3843137, 0, 1,
-1.447865, -1.375057, -1.875294, 1, 0.3882353, 0, 1,
-1.442426, 0.358942, -2.938813, 1, 0.3960784, 0, 1,
-1.437817, 0.2059067, -2.462662, 1, 0.4039216, 0, 1,
-1.432541, -0.9065511, -1.302447, 1, 0.4078431, 0, 1,
-1.425902, 1.04127, -1.286856, 1, 0.4156863, 0, 1,
-1.424755, -0.8432653, -1.578459, 1, 0.4196078, 0, 1,
-1.420443, 0.431025, -1.21991, 1, 0.427451, 0, 1,
-1.41921, 0.1394404, -1.510773, 1, 0.4313726, 0, 1,
-1.41462, 0.03547501, -1.375146, 1, 0.4392157, 0, 1,
-1.409673, 0.2946875, -1.382374, 1, 0.4431373, 0, 1,
-1.392617, -0.01725391, 0.6709226, 1, 0.4509804, 0, 1,
-1.386551, -0.7599786, -4.308685, 1, 0.454902, 0, 1,
-1.380361, -0.9131325, -1.937439, 1, 0.4627451, 0, 1,
-1.367539, 0.4752536, -1.837416, 1, 0.4666667, 0, 1,
-1.356765, -0.3137529, -1.342914, 1, 0.4745098, 0, 1,
-1.35538, -0.272894, -0.6444296, 1, 0.4784314, 0, 1,
-1.343622, -0.05027624, -1.887026, 1, 0.4862745, 0, 1,
-1.334467, -0.1770157, -1.585609, 1, 0.4901961, 0, 1,
-1.328187, -0.2444499, -1.377671, 1, 0.4980392, 0, 1,
-1.328025, -0.07669259, -1.781248, 1, 0.5058824, 0, 1,
-1.32148, -0.1247159, -3.074901, 1, 0.509804, 0, 1,
-1.32136, -1.014207, -1.230468, 1, 0.5176471, 0, 1,
-1.321099, 0.2230257, -1.410049, 1, 0.5215687, 0, 1,
-1.304893, 0.2207471, -1.831183, 1, 0.5294118, 0, 1,
-1.301539, -0.07118311, -0.6403964, 1, 0.5333334, 0, 1,
-1.299735, 0.2658191, -1.438188, 1, 0.5411765, 0, 1,
-1.29289, 2.015694, 0.456351, 1, 0.5450981, 0, 1,
-1.288411, -0.04653681, -1.573229, 1, 0.5529412, 0, 1,
-1.283539, 0.08733457, -0.5079461, 1, 0.5568628, 0, 1,
-1.28202, -0.6319161, -1.30179, 1, 0.5647059, 0, 1,
-1.277744, -0.065855, -2.723339, 1, 0.5686275, 0, 1,
-1.269839, 0.3951143, -1.691359, 1, 0.5764706, 0, 1,
-1.269151, -0.03204034, -0.3709145, 1, 0.5803922, 0, 1,
-1.265546, 1.068475, -0.6464743, 1, 0.5882353, 0, 1,
-1.261233, -0.535723, -1.39012, 1, 0.5921569, 0, 1,
-1.255474, 0.7574652, -0.3405205, 1, 0.6, 0, 1,
-1.24481, -0.8776464, -4.003922, 1, 0.6078432, 0, 1,
-1.240337, -1.243201, -2.162441, 1, 0.6117647, 0, 1,
-1.237425, 0.2782419, -0.8960728, 1, 0.6196079, 0, 1,
-1.229695, -0.5654349, -2.30249, 1, 0.6235294, 0, 1,
-1.229614, -1.747949, -2.034763, 1, 0.6313726, 0, 1,
-1.223357, -0.1210219, -0.906318, 1, 0.6352941, 0, 1,
-1.219522, -1.094382, -4.159246, 1, 0.6431373, 0, 1,
-1.215507, -0.979766, -2.785342, 1, 0.6470588, 0, 1,
-1.211576, 0.1565335, -1.028528, 1, 0.654902, 0, 1,
-1.196094, -0.7630525, -3.584509, 1, 0.6588235, 0, 1,
-1.189308, 0.3599915, 0.02743855, 1, 0.6666667, 0, 1,
-1.189264, -0.4118601, -1.86512, 1, 0.6705883, 0, 1,
-1.185102, -0.7948532, -2.631671, 1, 0.6784314, 0, 1,
-1.180295, 0.8073746, -2.093533, 1, 0.682353, 0, 1,
-1.178877, -0.4980694, -4.741986, 1, 0.6901961, 0, 1,
-1.171357, 0.5699811, -2.170756, 1, 0.6941177, 0, 1,
-1.153428, -2.663231, -1.645389, 1, 0.7019608, 0, 1,
-1.150557, -0.6290296, -1.284443, 1, 0.7098039, 0, 1,
-1.149974, -1.572325, -3.916595, 1, 0.7137255, 0, 1,
-1.145415, -0.7440595, -1.221734, 1, 0.7215686, 0, 1,
-1.142872, 0.3287718, -0.5709218, 1, 0.7254902, 0, 1,
-1.141416, 0.5722055, -2.6563, 1, 0.7333333, 0, 1,
-1.125875, 1.182788, 0.8526902, 1, 0.7372549, 0, 1,
-1.125737, -1.633243, -1.605917, 1, 0.7450981, 0, 1,
-1.119906, -0.3913108, -2.600246, 1, 0.7490196, 0, 1,
-1.119763, 0.2758151, -1.996884, 1, 0.7568628, 0, 1,
-1.115124, -0.247608, -2.639612, 1, 0.7607843, 0, 1,
-1.112629, 0.30469, -0.1798461, 1, 0.7686275, 0, 1,
-1.107605, -0.6731974, -1.954413, 1, 0.772549, 0, 1,
-1.104805, -0.4148028, -0.4041482, 1, 0.7803922, 0, 1,
-1.102945, 0.7355519, -2.339813, 1, 0.7843137, 0, 1,
-1.087454, -1.254718, -2.142785, 1, 0.7921569, 0, 1,
-1.083646, 1.374253, -2.017734, 1, 0.7960784, 0, 1,
-1.082274, -0.2236598, -3.375117, 1, 0.8039216, 0, 1,
-1.080423, -1.168342, -2.523741, 1, 0.8117647, 0, 1,
-1.067779, -0.3242544, -3.486501, 1, 0.8156863, 0, 1,
-1.066509, -0.7110141, -0.8667676, 1, 0.8235294, 0, 1,
-1.064362, -0.8198081, -2.181426, 1, 0.827451, 0, 1,
-1.060747, -0.2207604, -1.917432, 1, 0.8352941, 0, 1,
-1.058486, -1.590856, -0.9889275, 1, 0.8392157, 0, 1,
-1.052061, -0.5987335, -2.73383, 1, 0.8470588, 0, 1,
-1.046628, 0.6992579, -0.8215913, 1, 0.8509804, 0, 1,
-1.046139, -0.3921184, -2.378328, 1, 0.8588235, 0, 1,
-1.036015, -1.422874, -1.78447, 1, 0.8627451, 0, 1,
-1.025981, 0.2059734, -1.319834, 1, 0.8705882, 0, 1,
-1.021074, 0.07664983, -2.848279, 1, 0.8745098, 0, 1,
-1.017027, 2.392698, -0.426963, 1, 0.8823529, 0, 1,
-1.015262, -0.7840605, -0.7855536, 1, 0.8862745, 0, 1,
-1.014686, 0.1879829, -1.294402, 1, 0.8941177, 0, 1,
-1.010084, 1.64623, -0.3731233, 1, 0.8980392, 0, 1,
-1.007792, 0.750079, -3.347071, 1, 0.9058824, 0, 1,
-1.000574, 0.43431, -1.183582, 1, 0.9137255, 0, 1,
-0.9968978, -1.245261, -1.234258, 1, 0.9176471, 0, 1,
-0.9953, -0.8740097, -1.904696, 1, 0.9254902, 0, 1,
-0.989933, 0.6202058, -2.213154, 1, 0.9294118, 0, 1,
-0.9854043, -0.2765045, -1.322864, 1, 0.9372549, 0, 1,
-0.9847836, 0.3934938, -1.465428, 1, 0.9411765, 0, 1,
-0.9842152, -0.4981211, -4.306327, 1, 0.9490196, 0, 1,
-0.9825051, 0.5366554, -2.392669, 1, 0.9529412, 0, 1,
-0.9821115, 0.4851338, -0.5287677, 1, 0.9607843, 0, 1,
-0.980671, -1.360734, -3.25544, 1, 0.9647059, 0, 1,
-0.9690705, 1.659318, 0.9641773, 1, 0.972549, 0, 1,
-0.9572275, -0.3694552, -2.403072, 1, 0.9764706, 0, 1,
-0.9400441, 1.497588, 0.5383642, 1, 0.9843137, 0, 1,
-0.939479, -0.482803, -0.6987395, 1, 0.9882353, 0, 1,
-0.9392644, 1.762619, 0.04584106, 1, 0.9960784, 0, 1,
-0.9261031, 1.19839, 0.718782, 0.9960784, 1, 0, 1,
-0.9228739, -0.9305859, -3.982555, 0.9921569, 1, 0, 1,
-0.921801, -1.632845, -0.7470086, 0.9843137, 1, 0, 1,
-0.9196862, 0.4648593, -1.398707, 0.9803922, 1, 0, 1,
-0.9158666, -1.372531, -2.818642, 0.972549, 1, 0, 1,
-0.9154097, -1.394407, -1.542168, 0.9686275, 1, 0, 1,
-0.9137818, -0.1609494, -1.101596, 0.9607843, 1, 0, 1,
-0.9056227, -1.347222, -2.045975, 0.9568627, 1, 0, 1,
-0.9042104, -3.272986, -3.081285, 0.9490196, 1, 0, 1,
-0.9001775, 0.6621514, -3.036571, 0.945098, 1, 0, 1,
-0.897378, 0.29757, -1.222728, 0.9372549, 1, 0, 1,
-0.8899812, 0.8935245, -1.237766, 0.9333333, 1, 0, 1,
-0.8882387, -1.250873, -2.432039, 0.9254902, 1, 0, 1,
-0.886419, 1.156942, -1.845603, 0.9215686, 1, 0, 1,
-0.884827, -0.4155527, -2.214638, 0.9137255, 1, 0, 1,
-0.8818738, -1.090162, -3.807151, 0.9098039, 1, 0, 1,
-0.8777997, 1.134863, -4.339134, 0.9019608, 1, 0, 1,
-0.8746182, -0.4089796, -2.053089, 0.8941177, 1, 0, 1,
-0.8735459, -1.272085, -0.9969271, 0.8901961, 1, 0, 1,
-0.8709106, 0.8611145, -0.8505104, 0.8823529, 1, 0, 1,
-0.8682714, 1.294128, 1.41185, 0.8784314, 1, 0, 1,
-0.8594723, -0.2601275, -2.245388, 0.8705882, 1, 0, 1,
-0.8574589, -1.253375, -1.936036, 0.8666667, 1, 0, 1,
-0.856775, -0.8453088, -0.8056843, 0.8588235, 1, 0, 1,
-0.8541711, 0.831847, -1.093834, 0.854902, 1, 0, 1,
-0.8493493, 1.586176, -0.7667885, 0.8470588, 1, 0, 1,
-0.8478055, 1.93228, -1.652859, 0.8431373, 1, 0, 1,
-0.8376439, -0.7379405, 0.1323536, 0.8352941, 1, 0, 1,
-0.8356901, -1.305467, -1.372254, 0.8313726, 1, 0, 1,
-0.835214, 0.7319698, -2.455465, 0.8235294, 1, 0, 1,
-0.8342572, -0.281136, -0.1269283, 0.8196079, 1, 0, 1,
-0.8319874, -0.05302823, -2.72927, 0.8117647, 1, 0, 1,
-0.8313904, 0.3452905, -0.6035957, 0.8078431, 1, 0, 1,
-0.8284992, -1.373604, -2.051071, 0.8, 1, 0, 1,
-0.825744, 0.6206037, -2.214026, 0.7921569, 1, 0, 1,
-0.8229483, -0.3115643, -3.820922, 0.7882353, 1, 0, 1,
-0.8214435, 0.1125674, -1.051673, 0.7803922, 1, 0, 1,
-0.8123162, -1.361201, -2.522733, 0.7764706, 1, 0, 1,
-0.8003367, 0.05989443, -0.9076821, 0.7686275, 1, 0, 1,
-0.7977143, -0.8260213, -1.748732, 0.7647059, 1, 0, 1,
-0.7941756, 0.1956723, -1.190593, 0.7568628, 1, 0, 1,
-0.7929806, 0.8128567, -1.281131, 0.7529412, 1, 0, 1,
-0.7839404, -0.8064972, -2.607031, 0.7450981, 1, 0, 1,
-0.7814781, 0.3462553, -0.8999993, 0.7411765, 1, 0, 1,
-0.7811803, 0.3577139, -2.011053, 0.7333333, 1, 0, 1,
-0.7778755, -0.3102595, -1.240848, 0.7294118, 1, 0, 1,
-0.7772104, -1.411514, -1.01667, 0.7215686, 1, 0, 1,
-0.7707624, 1.190477, -1.697162, 0.7176471, 1, 0, 1,
-0.7628338, 1.053736, 0.7061855, 0.7098039, 1, 0, 1,
-0.7604233, -0.7315361, -4.024299, 0.7058824, 1, 0, 1,
-0.7560081, -0.3246787, -2.780598, 0.6980392, 1, 0, 1,
-0.7548096, -1.812325, -2.665791, 0.6901961, 1, 0, 1,
-0.7527626, -1.349915, -3.192015, 0.6862745, 1, 0, 1,
-0.7519169, -0.1368762, -3.691191, 0.6784314, 1, 0, 1,
-0.7474639, 0.6512796, -1.5574, 0.6745098, 1, 0, 1,
-0.7458492, -1.290931, -1.255694, 0.6666667, 1, 0, 1,
-0.7328154, -0.07001147, -0.7679163, 0.6627451, 1, 0, 1,
-0.7325493, 0.4908728, -1.489071, 0.654902, 1, 0, 1,
-0.7301933, -0.3723866, -1.720334, 0.6509804, 1, 0, 1,
-0.7269278, -1.335139, -1.535248, 0.6431373, 1, 0, 1,
-0.7249923, 0.498414, -1.461094, 0.6392157, 1, 0, 1,
-0.7237655, 0.3883404, -1.436353, 0.6313726, 1, 0, 1,
-0.7230693, -0.6307891, -1.9018, 0.627451, 1, 0, 1,
-0.7163842, -0.3013339, -1.718893, 0.6196079, 1, 0, 1,
-0.7143497, 1.377556, -0.4926686, 0.6156863, 1, 0, 1,
-0.7043657, 0.2474964, -2.062935, 0.6078432, 1, 0, 1,
-0.6996249, 1.269311, -1.403831, 0.6039216, 1, 0, 1,
-0.6960936, 0.7687679, -0.9501522, 0.5960785, 1, 0, 1,
-0.6925406, -0.2171497, -2.671037, 0.5882353, 1, 0, 1,
-0.6917122, 0.8028953, -0.9452812, 0.5843138, 1, 0, 1,
-0.6873298, -0.4268029, -2.370889, 0.5764706, 1, 0, 1,
-0.6864716, -0.4342796, -1.571063, 0.572549, 1, 0, 1,
-0.6793023, -1.116977, -3.673873, 0.5647059, 1, 0, 1,
-0.6717052, 0.9790339, -0.8964826, 0.5607843, 1, 0, 1,
-0.6700364, 0.6033518, -0.3737167, 0.5529412, 1, 0, 1,
-0.6598368, -0.1186383, -1.510418, 0.5490196, 1, 0, 1,
-0.6564369, -1.054817, -3.594226, 0.5411765, 1, 0, 1,
-0.6505055, -1.589665, -2.949161, 0.5372549, 1, 0, 1,
-0.6486099, -0.03625361, -1.745392, 0.5294118, 1, 0, 1,
-0.6485416, 1.045828, -0.457176, 0.5254902, 1, 0, 1,
-0.6469365, -1.156497, -1.814313, 0.5176471, 1, 0, 1,
-0.6456933, 0.1361986, -2.760082, 0.5137255, 1, 0, 1,
-0.6433731, -0.4963474, -1.490259, 0.5058824, 1, 0, 1,
-0.6409974, -0.9613227, -4.524443, 0.5019608, 1, 0, 1,
-0.6372694, 2.792385, -0.9838207, 0.4941176, 1, 0, 1,
-0.6368732, -0.3422267, -2.760005, 0.4862745, 1, 0, 1,
-0.6348316, 0.1614968, -1.99814, 0.4823529, 1, 0, 1,
-0.6315576, -1.715825, -2.848991, 0.4745098, 1, 0, 1,
-0.6281453, -0.5266797, -2.575447, 0.4705882, 1, 0, 1,
-0.6169079, -0.02464023, -2.188694, 0.4627451, 1, 0, 1,
-0.6168547, 0.02088708, -0.2245794, 0.4588235, 1, 0, 1,
-0.6154326, -1.274346, -3.027892, 0.4509804, 1, 0, 1,
-0.6133399, 0.4381418, 0.107419, 0.4470588, 1, 0, 1,
-0.6093053, -0.5330928, -2.905367, 0.4392157, 1, 0, 1,
-0.605889, 1.187726, 0.6956948, 0.4352941, 1, 0, 1,
-0.6033359, -1.235682, -1.415277, 0.427451, 1, 0, 1,
-0.5983725, -1.00706, -1.814856, 0.4235294, 1, 0, 1,
-0.5953121, 0.5544915, 1.145577, 0.4156863, 1, 0, 1,
-0.5945501, 0.3135533, -1.556348, 0.4117647, 1, 0, 1,
-0.5925683, 0.1489442, -0.2426756, 0.4039216, 1, 0, 1,
-0.5901291, -0.2783845, -3.387419, 0.3960784, 1, 0, 1,
-0.5855064, 0.4984326, -0.3259535, 0.3921569, 1, 0, 1,
-0.585025, -0.8975406, -1.707487, 0.3843137, 1, 0, 1,
-0.5841526, 0.7558151, 1.677118, 0.3803922, 1, 0, 1,
-0.5788298, -0.3598381, -0.7168059, 0.372549, 1, 0, 1,
-0.5735552, -0.2747493, -2.609934, 0.3686275, 1, 0, 1,
-0.572917, 0.2189027, -0.2257759, 0.3607843, 1, 0, 1,
-0.5698197, 1.897263, 0.05059406, 0.3568628, 1, 0, 1,
-0.5692731, 1.106391, -0.7837177, 0.3490196, 1, 0, 1,
-0.5525377, 0.1352383, -0.7021034, 0.345098, 1, 0, 1,
-0.5491375, 1.713006, 0.4922808, 0.3372549, 1, 0, 1,
-0.5487742, -1.804957, -2.579631, 0.3333333, 1, 0, 1,
-0.5484048, -1.335452, -3.234951, 0.3254902, 1, 0, 1,
-0.5460162, 1.29175, -2.434788, 0.3215686, 1, 0, 1,
-0.5441078, 1.842323, -0.2743607, 0.3137255, 1, 0, 1,
-0.5434299, 1.65338, -0.3168463, 0.3098039, 1, 0, 1,
-0.5371557, -0.4728561, -3.123306, 0.3019608, 1, 0, 1,
-0.5344932, 0.4033095, -0.7930578, 0.2941177, 1, 0, 1,
-0.5330321, 0.5742107, -0.4733631, 0.2901961, 1, 0, 1,
-0.5323837, -0.05487055, -1.146903, 0.282353, 1, 0, 1,
-0.5312601, 2.450898, -0.7345477, 0.2784314, 1, 0, 1,
-0.5309401, 1.486483, -0.8818622, 0.2705882, 1, 0, 1,
-0.5303119, 1.12741, -0.06051929, 0.2666667, 1, 0, 1,
-0.5298256, -1.353254, -2.973426, 0.2588235, 1, 0, 1,
-0.5271139, 1.642308, -0.05096087, 0.254902, 1, 0, 1,
-0.5266408, -1.552697, -4.130691, 0.2470588, 1, 0, 1,
-0.5263676, -0.2329408, -2.599384, 0.2431373, 1, 0, 1,
-0.5202463, -1.948172, -3.566666, 0.2352941, 1, 0, 1,
-0.5170203, -0.6185581, -1.663695, 0.2313726, 1, 0, 1,
-0.5104621, 2.04661, 0.01046875, 0.2235294, 1, 0, 1,
-0.5096208, 0.9365525, 0.05525185, 0.2196078, 1, 0, 1,
-0.5059238, -1.543862, -2.508734, 0.2117647, 1, 0, 1,
-0.5035092, 0.8086782, 0.09190137, 0.2078431, 1, 0, 1,
-0.4876715, -2.756499, -2.499076, 0.2, 1, 0, 1,
-0.4841555, -0.8333112, -2.254501, 0.1921569, 1, 0, 1,
-0.4817865, 0.06841307, 0.02340447, 0.1882353, 1, 0, 1,
-0.4792984, 0.4521733, -1.611569, 0.1803922, 1, 0, 1,
-0.4741073, -0.2623436, -1.624791, 0.1764706, 1, 0, 1,
-0.4718635, 0.2393121, -1.876621, 0.1686275, 1, 0, 1,
-0.4686953, 0.9082992, -1.556936, 0.1647059, 1, 0, 1,
-0.4683536, 0.4765259, -0.5514733, 0.1568628, 1, 0, 1,
-0.4681231, -1.120628, -1.831294, 0.1529412, 1, 0, 1,
-0.459286, 1.492985, 0.7086602, 0.145098, 1, 0, 1,
-0.456679, 0.452311, 0.1763853, 0.1411765, 1, 0, 1,
-0.4516332, -1.572652, -4.718843, 0.1333333, 1, 0, 1,
-0.4476577, 0.2679138, -1.293942, 0.1294118, 1, 0, 1,
-0.4433331, 0.5959122, 0.9430283, 0.1215686, 1, 0, 1,
-0.4409234, -1.343567, -1.967728, 0.1176471, 1, 0, 1,
-0.4289919, -0.6445452, -3.28802, 0.1098039, 1, 0, 1,
-0.4243966, 0.8589626, 0.1255811, 0.1058824, 1, 0, 1,
-0.4224284, -1.991331, -5.031837, 0.09803922, 1, 0, 1,
-0.414443, 1.59697, -1.063121, 0.09019608, 1, 0, 1,
-0.4131856, 0.6023197, 1.871709, 0.08627451, 1, 0, 1,
-0.4116592, 1.611096, -0.896771, 0.07843138, 1, 0, 1,
-0.4108163, -0.6236727, -2.608499, 0.07450981, 1, 0, 1,
-0.4089167, 0.5847394, 0.8211889, 0.06666667, 1, 0, 1,
-0.4075179, 0.7158372, -0.05740717, 0.0627451, 1, 0, 1,
-0.4035922, -0.1402087, -1.961298, 0.05490196, 1, 0, 1,
-0.4025962, -1.351834, -2.172706, 0.05098039, 1, 0, 1,
-0.4011046, 0.6067276, 1.611235, 0.04313726, 1, 0, 1,
-0.3992191, -1.358675, -3.307675, 0.03921569, 1, 0, 1,
-0.3990161, -0.3851047, -2.111031, 0.03137255, 1, 0, 1,
-0.3944491, 0.5885203, 0.1635352, 0.02745098, 1, 0, 1,
-0.3906813, -0.3373822, -2.972001, 0.01960784, 1, 0, 1,
-0.3896978, 0.9382632, 0.3246284, 0.01568628, 1, 0, 1,
-0.3874578, -0.6521096, -1.473752, 0.007843138, 1, 0, 1,
-0.3872105, -0.1312112, -1.1632, 0.003921569, 1, 0, 1,
-0.3868854, 0.5456915, -0.03284237, 0, 1, 0.003921569, 1,
-0.3866116, 0.4104837, -2.835667, 0, 1, 0.01176471, 1,
-0.3854382, 0.9463013, 0.2893106, 0, 1, 0.01568628, 1,
-0.3835036, 2.323855, -1.183535, 0, 1, 0.02352941, 1,
-0.3824829, -0.7673907, -1.891564, 0, 1, 0.02745098, 1,
-0.3803185, 0.4736361, -1.529215, 0, 1, 0.03529412, 1,
-0.3783794, 1.307281, 0.2991876, 0, 1, 0.03921569, 1,
-0.377371, -1.721328, -3.354177, 0, 1, 0.04705882, 1,
-0.3754251, -0.04729725, -0.6247646, 0, 1, 0.05098039, 1,
-0.3726896, 0.2889873, -2.378083, 0, 1, 0.05882353, 1,
-0.3646949, -0.5994017, -1.762682, 0, 1, 0.0627451, 1,
-0.3629346, -0.7286162, -2.558698, 0, 1, 0.07058824, 1,
-0.3624654, 0.4774667, -1.169121, 0, 1, 0.07450981, 1,
-0.3556605, 0.8404981, 0.9293671, 0, 1, 0.08235294, 1,
-0.3546958, -0.3084861, -0.2660542, 0, 1, 0.08627451, 1,
-0.3533097, -1.397183, -2.939915, 0, 1, 0.09411765, 1,
-0.3504033, -0.04015557, -0.2314068, 0, 1, 0.1019608, 1,
-0.3479957, -0.5589005, -0.5108592, 0, 1, 0.1058824, 1,
-0.3458993, -0.2126389, -2.217659, 0, 1, 0.1137255, 1,
-0.3390647, 0.7909525, -0.1513606, 0, 1, 0.1176471, 1,
-0.3388733, -0.4873824, -2.489486, 0, 1, 0.1254902, 1,
-0.3360731, 1.118116, -1.325696, 0, 1, 0.1294118, 1,
-0.3242411, 1.836131, 1.640787, 0, 1, 0.1372549, 1,
-0.322601, -0.8237174, -2.921792, 0, 1, 0.1411765, 1,
-0.3222938, 0.5312374, -0.621712, 0, 1, 0.1490196, 1,
-0.3220485, 0.2937261, -1.037931, 0, 1, 0.1529412, 1,
-0.3212199, 0.1102063, 0.08637456, 0, 1, 0.1607843, 1,
-0.3192721, -0.02973488, 0.07554366, 0, 1, 0.1647059, 1,
-0.3187851, -0.5059455, -2.378458, 0, 1, 0.172549, 1,
-0.3093968, -0.3329516, -2.398301, 0, 1, 0.1764706, 1,
-0.3072166, 1.691138, -2.272475, 0, 1, 0.1843137, 1,
-0.3063211, -0.6965264, -2.799325, 0, 1, 0.1882353, 1,
-0.3060154, 0.2258889, 0.3785915, 0, 1, 0.1960784, 1,
-0.3045185, -1.485339, -3.605126, 0, 1, 0.2039216, 1,
-0.2994026, -0.1572161, -1.873285, 0, 1, 0.2078431, 1,
-0.2960978, 0.1958084, 0.4834186, 0, 1, 0.2156863, 1,
-0.2932686, -0.2767699, -1.882256, 0, 1, 0.2196078, 1,
-0.2923185, -0.03417338, -2.620604, 0, 1, 0.227451, 1,
-0.2872961, -1.548452, -3.461285, 0, 1, 0.2313726, 1,
-0.2856969, 1.375263, -0.01839134, 0, 1, 0.2392157, 1,
-0.2835537, 0.1009448, -1.220624, 0, 1, 0.2431373, 1,
-0.2806248, 0.3219025, 0.2389048, 0, 1, 0.2509804, 1,
-0.2770114, 0.3353141, 0.3106313, 0, 1, 0.254902, 1,
-0.2769827, -2.553394, -3.598033, 0, 1, 0.2627451, 1,
-0.2768495, 0.3310694, -2.017148, 0, 1, 0.2666667, 1,
-0.2651961, 0.6456942, -0.5917596, 0, 1, 0.2745098, 1,
-0.2583809, 0.9455495, 2.781918, 0, 1, 0.2784314, 1,
-0.2539009, 0.4151953, 1.078284, 0, 1, 0.2862745, 1,
-0.2536075, -0.3355288, -1.162661, 0, 1, 0.2901961, 1,
-0.2503294, 0.02906179, -1.858894, 0, 1, 0.2980392, 1,
-0.2465223, 0.7298696, 0.6332963, 0, 1, 0.3058824, 1,
-0.2441644, -1.452701, -4.838446, 0, 1, 0.3098039, 1,
-0.2434191, 0.2681513, -0.7832595, 0, 1, 0.3176471, 1,
-0.2434067, -0.06780916, -2.502662, 0, 1, 0.3215686, 1,
-0.2427206, -0.4181285, -2.877306, 0, 1, 0.3294118, 1,
-0.242448, 0.9452991, 1.240118, 0, 1, 0.3333333, 1,
-0.2416608, 0.6767899, -0.7770422, 0, 1, 0.3411765, 1,
-0.2378682, 0.7724247, 0.0699082, 0, 1, 0.345098, 1,
-0.2341403, -0.2870734, -3.146863, 0, 1, 0.3529412, 1,
-0.2319426, -2.619432, -4.174423, 0, 1, 0.3568628, 1,
-0.2316525, 0.4893601, 1.204492, 0, 1, 0.3647059, 1,
-0.2305386, 0.1149388, -1.035427, 0, 1, 0.3686275, 1,
-0.2301598, 0.003171641, -0.7199091, 0, 1, 0.3764706, 1,
-0.2287382, -0.6787865, -2.273147, 0, 1, 0.3803922, 1,
-0.2266479, 0.07133385, -1.854039, 0, 1, 0.3882353, 1,
-0.2229279, 0.5638793, -1.339061, 0, 1, 0.3921569, 1,
-0.21876, 2.67698, -1.518611, 0, 1, 0.4, 1,
-0.2175019, 0.2320119, 1.294182, 0, 1, 0.4078431, 1,
-0.2167796, 0.7456549, -1.057786, 0, 1, 0.4117647, 1,
-0.2165141, 0.01612261, -0.1281853, 0, 1, 0.4196078, 1,
-0.2161339, 1.116163, -1.163741, 0, 1, 0.4235294, 1,
-0.2148765, 0.00600314, -1.529698, 0, 1, 0.4313726, 1,
-0.2138565, -0.9765401, -3.289104, 0, 1, 0.4352941, 1,
-0.2124612, 1.754088, -0.8688429, 0, 1, 0.4431373, 1,
-0.2116103, -0.313489, -1.495589, 0, 1, 0.4470588, 1,
-0.2105187, -0.4444936, -3.097617, 0, 1, 0.454902, 1,
-0.2104134, -1.363438, -3.075072, 0, 1, 0.4588235, 1,
-0.2100632, -0.2087786, -3.603209, 0, 1, 0.4666667, 1,
-0.2077046, 1.757836, 0.3894344, 0, 1, 0.4705882, 1,
-0.207057, 0.7573518, -0.5534416, 0, 1, 0.4784314, 1,
-0.2069258, 0.4151264, 0.3984016, 0, 1, 0.4823529, 1,
-0.2040529, -0.2869403, -2.68498, 0, 1, 0.4901961, 1,
-0.2039112, 0.4641193, -0.8288772, 0, 1, 0.4941176, 1,
-0.1988957, 0.1302616, -2.10506, 0, 1, 0.5019608, 1,
-0.1976577, 0.2353545, -0.254753, 0, 1, 0.509804, 1,
-0.1972168, -2.528064, -2.997469, 0, 1, 0.5137255, 1,
-0.1870666, 0.8078281, 0.7210166, 0, 1, 0.5215687, 1,
-0.1837203, -1.175205, -3.455517, 0, 1, 0.5254902, 1,
-0.1803429, 0.9788646, -0.8225109, 0, 1, 0.5333334, 1,
-0.177389, -0.08251335, -1.699688, 0, 1, 0.5372549, 1,
-0.1762623, -1.056055, -1.233098, 0, 1, 0.5450981, 1,
-0.1742247, 0.4766222, 1.136319, 0, 1, 0.5490196, 1,
-0.1719522, -1.19706, -2.039277, 0, 1, 0.5568628, 1,
-0.1634024, 1.497939, -0.5227714, 0, 1, 0.5607843, 1,
-0.1478683, 1.119196, 1.776952, 0, 1, 0.5686275, 1,
-0.1473838, -0.557851, -2.151881, 0, 1, 0.572549, 1,
-0.1469127, -0.5634961, -4.405771, 0, 1, 0.5803922, 1,
-0.1376032, -1.27265, -3.636968, 0, 1, 0.5843138, 1,
-0.1363631, 0.3168263, 0.5484892, 0, 1, 0.5921569, 1,
-0.1350568, -0.3391351, -1.761143, 0, 1, 0.5960785, 1,
-0.1317963, -0.4001595, -1.687096, 0, 1, 0.6039216, 1,
-0.1312334, -3.494262, -3.794864, 0, 1, 0.6117647, 1,
-0.1287853, -1.052829, -2.181977, 0, 1, 0.6156863, 1,
-0.1255729, 0.2734579, -1.941224, 0, 1, 0.6235294, 1,
-0.1244823, -0.01917153, -3.594876, 0, 1, 0.627451, 1,
-0.1233659, 0.1188507, 0.4644103, 0, 1, 0.6352941, 1,
-0.1230606, 2.149938, 0.3897075, 0, 1, 0.6392157, 1,
-0.1217504, 0.5735796, 0.9889264, 0, 1, 0.6470588, 1,
-0.1200944, -0.3745256, -3.006798, 0, 1, 0.6509804, 1,
-0.1148758, -0.06287211, -2.344378, 0, 1, 0.6588235, 1,
-0.1141567, -0.670573, -2.041643, 0, 1, 0.6627451, 1,
-0.1138112, -1.181574, -3.291006, 0, 1, 0.6705883, 1,
-0.1089901, 1.751654, -0.6220691, 0, 1, 0.6745098, 1,
-0.1061255, 0.820577, -0.09937957, 0, 1, 0.682353, 1,
-0.1038514, 0.1521201, -0.6909557, 0, 1, 0.6862745, 1,
-0.1026179, 1.178811, 0.1231148, 0, 1, 0.6941177, 1,
-0.1003525, 0.6344449, 0.851352, 0, 1, 0.7019608, 1,
-0.0993914, 0.3250505, -0.4860942, 0, 1, 0.7058824, 1,
-0.09854714, -1.34671, -4.299365, 0, 1, 0.7137255, 1,
-0.09482207, -0.5122998, -4.335579, 0, 1, 0.7176471, 1,
-0.08704057, -0.09698226, -3.525023, 0, 1, 0.7254902, 1,
-0.07602935, -0.06996883, -1.64047, 0, 1, 0.7294118, 1,
-0.07534131, 0.8310613, 0.4130807, 0, 1, 0.7372549, 1,
-0.07502868, 0.7028779, 0.04273086, 0, 1, 0.7411765, 1,
-0.07223582, 0.7251662, 0.02373853, 0, 1, 0.7490196, 1,
-0.06922843, 0.5549766, -1.564584, 0, 1, 0.7529412, 1,
-0.0612617, -0.0625032, -0.5604874, 0, 1, 0.7607843, 1,
-0.05822038, -0.1925731, -3.044219, 0, 1, 0.7647059, 1,
-0.04893096, -0.6526697, -2.443335, 0, 1, 0.772549, 1,
-0.04871663, 0.464698, 0.7808442, 0, 1, 0.7764706, 1,
-0.04781904, 0.7827293, 0.4221681, 0, 1, 0.7843137, 1,
-0.0429137, 0.2050057, 0.6769074, 0, 1, 0.7882353, 1,
-0.04201655, -1.518218, -3.378805, 0, 1, 0.7960784, 1,
-0.04174246, -0.07951627, -3.502216, 0, 1, 0.8039216, 1,
-0.04079463, -0.3704607, -3.588682, 0, 1, 0.8078431, 1,
-0.04029807, 1.377847, 0.2264374, 0, 1, 0.8156863, 1,
-0.03617783, -0.6540688, -2.62641, 0, 1, 0.8196079, 1,
-0.0347537, 0.5471984, -1.438412, 0, 1, 0.827451, 1,
-0.03280543, -0.4120653, -3.799211, 0, 1, 0.8313726, 1,
-0.03110996, -1.933774, -5.953381, 0, 1, 0.8392157, 1,
-0.03090366, -0.2041862, -2.778377, 0, 1, 0.8431373, 1,
-0.03023679, 0.05863063, 0.340882, 0, 1, 0.8509804, 1,
-0.02862338, 0.1447612, 1.073359, 0, 1, 0.854902, 1,
-0.02807274, -0.022311, -1.859278, 0, 1, 0.8627451, 1,
-0.01944077, -0.3521301, -2.984764, 0, 1, 0.8666667, 1,
-0.01602802, 1.096854, 1.009309, 0, 1, 0.8745098, 1,
-0.01103075, 0.8793074, 1.346541, 0, 1, 0.8784314, 1,
-0.008506808, 0.2935447, -0.1797838, 0, 1, 0.8862745, 1,
-0.006486594, -0.6324327, -4.969958, 0, 1, 0.8901961, 1,
0.0005793772, -0.06022023, 4.652816, 0, 1, 0.8980392, 1,
0.003992484, -0.2600299, 2.615584, 0, 1, 0.9058824, 1,
0.004643121, 0.297481, -1.303596, 0, 1, 0.9098039, 1,
0.005215952, -1.910892, 3.172165, 0, 1, 0.9176471, 1,
0.005905308, 0.807792, -0.8107984, 0, 1, 0.9215686, 1,
0.01396495, 1.352023, -2.436581, 0, 1, 0.9294118, 1,
0.01504892, -1.196564, 3.578871, 0, 1, 0.9333333, 1,
0.02171014, -0.615311, 1.696284, 0, 1, 0.9411765, 1,
0.0223391, -0.2186517, 3.176836, 0, 1, 0.945098, 1,
0.02373047, -0.2064529, 3.144741, 0, 1, 0.9529412, 1,
0.02502186, 0.6275321, 0.8580454, 0, 1, 0.9568627, 1,
0.03031271, -0.4879688, 3.277965, 0, 1, 0.9647059, 1,
0.03053716, 0.2855853, -0.3689748, 0, 1, 0.9686275, 1,
0.03169443, -0.4195322, 4.069704, 0, 1, 0.9764706, 1,
0.03410474, 0.4517753, -0.4108535, 0, 1, 0.9803922, 1,
0.03672774, -0.6623003, 3.150843, 0, 1, 0.9882353, 1,
0.04098669, -0.07866624, 4.357594, 0, 1, 0.9921569, 1,
0.04186498, 1.486218, 0.2704092, 0, 1, 1, 1,
0.0495268, 1.15086, 0.4575949, 0, 0.9921569, 1, 1,
0.05313849, 1.248359, 0.8109541, 0, 0.9882353, 1, 1,
0.05374979, 1.844711, 0.6447793, 0, 0.9803922, 1, 1,
0.05502965, 0.5616036, 0.7947075, 0, 0.9764706, 1, 1,
0.05690007, 0.3329425, -1.158714, 0, 0.9686275, 1, 1,
0.05795873, 0.1139551, -0.6136585, 0, 0.9647059, 1, 1,
0.05975812, 1.078946, 1.940433, 0, 0.9568627, 1, 1,
0.06084723, 2.2913, 0.9671803, 0, 0.9529412, 1, 1,
0.06344201, 0.37991, -2.450482, 0, 0.945098, 1, 1,
0.06411429, 0.7224413, 1.36666, 0, 0.9411765, 1, 1,
0.06500691, -0.7517847, 2.581955, 0, 0.9333333, 1, 1,
0.06593861, -2.070241, 3.879131, 0, 0.9294118, 1, 1,
0.0730421, 0.5390657, -1.002244, 0, 0.9215686, 1, 1,
0.07686236, 0.166209, -0.8956021, 0, 0.9176471, 1, 1,
0.07748611, 1.366066, 2.684791, 0, 0.9098039, 1, 1,
0.07885779, -1.562184, 2.643023, 0, 0.9058824, 1, 1,
0.0807298, -0.2150059, 2.88615, 0, 0.8980392, 1, 1,
0.08428446, 0.8501554, -0.01103348, 0, 0.8901961, 1, 1,
0.09468801, -0.5255205, 3.430868, 0, 0.8862745, 1, 1,
0.1010693, -0.5117127, 3.426488, 0, 0.8784314, 1, 1,
0.1049116, -0.2517123, 2.157056, 0, 0.8745098, 1, 1,
0.1075095, 0.6244919, -0.6080077, 0, 0.8666667, 1, 1,
0.1079684, 0.6542788, 0.4371164, 0, 0.8627451, 1, 1,
0.1093249, 1.210538, 0.8042987, 0, 0.854902, 1, 1,
0.1094181, 0.1446753, -0.8510259, 0, 0.8509804, 1, 1,
0.1139043, -0.4138629, 1.822769, 0, 0.8431373, 1, 1,
0.116691, -1.176786, 1.940819, 0, 0.8392157, 1, 1,
0.1229012, 1.167652, 0.03407941, 0, 0.8313726, 1, 1,
0.1266067, 0.265479, -0.4869675, 0, 0.827451, 1, 1,
0.1363124, -2.539025, 1.862761, 0, 0.8196079, 1, 1,
0.1437721, 0.2068192, 1.73227, 0, 0.8156863, 1, 1,
0.1451949, 1.088417, 0.4601022, 0, 0.8078431, 1, 1,
0.1454486, 0.4622076, 1.971829, 0, 0.8039216, 1, 1,
0.1467378, -1.55514, 3.39817, 0, 0.7960784, 1, 1,
0.1486245, -0.1639927, 4.154202, 0, 0.7882353, 1, 1,
0.153388, 1.102687, -1.231299, 0, 0.7843137, 1, 1,
0.1551672, -0.4719976, 4.537685, 0, 0.7764706, 1, 1,
0.1563523, -1.289325, 2.900331, 0, 0.772549, 1, 1,
0.1616222, -0.6981991, 3.040358, 0, 0.7647059, 1, 1,
0.1628689, 1.840161, -1.147864, 0, 0.7607843, 1, 1,
0.1697093, -0.4393568, 1.643589, 0, 0.7529412, 1, 1,
0.1741656, 0.4371413, 1.199478, 0, 0.7490196, 1, 1,
0.1743139, 0.5517495, 1.988647, 0, 0.7411765, 1, 1,
0.1821747, -0.04015709, 1.700725, 0, 0.7372549, 1, 1,
0.1829048, 1.654515, -0.8437405, 0, 0.7294118, 1, 1,
0.1856212, 0.4240262, -0.4855857, 0, 0.7254902, 1, 1,
0.1879243, 0.338445, -0.301852, 0, 0.7176471, 1, 1,
0.1884368, 0.4897812, -1.338831, 0, 0.7137255, 1, 1,
0.1931993, 1.158331, -1.113907, 0, 0.7058824, 1, 1,
0.1950121, 2.044424, 0.2344546, 0, 0.6980392, 1, 1,
0.1952231, -0.1768245, 2.047469, 0, 0.6941177, 1, 1,
0.1974996, 0.2771125, -0.6586972, 0, 0.6862745, 1, 1,
0.2009837, -0.9177898, 2.693467, 0, 0.682353, 1, 1,
0.2014999, 0.413191, -0.03088452, 0, 0.6745098, 1, 1,
0.2021896, -1.063256, 2.543328, 0, 0.6705883, 1, 1,
0.2063328, -0.2611528, 3.782985, 0, 0.6627451, 1, 1,
0.2108951, 0.3756903, 1.784448, 0, 0.6588235, 1, 1,
0.2113484, -1.141142, 3.067143, 0, 0.6509804, 1, 1,
0.2115758, 1.434858, -0.09245255, 0, 0.6470588, 1, 1,
0.2168807, 0.04016089, 1.114725, 0, 0.6392157, 1, 1,
0.2170828, -0.2635536, 0.9800556, 0, 0.6352941, 1, 1,
0.2199644, -0.2488495, 0.903718, 0, 0.627451, 1, 1,
0.2214035, -1.007232, 3.262787, 0, 0.6235294, 1, 1,
0.2246569, 0.1988028, 2.384247, 0, 0.6156863, 1, 1,
0.2278183, -0.07365073, 1.46345, 0, 0.6117647, 1, 1,
0.2280639, 1.090059, 1.601199, 0, 0.6039216, 1, 1,
0.2286598, 0.3025476, 0.2733102, 0, 0.5960785, 1, 1,
0.2294201, 0.3494124, 1.448442, 0, 0.5921569, 1, 1,
0.2302441, -0.2852295, 2.545459, 0, 0.5843138, 1, 1,
0.2305732, 0.07435849, 0.5383021, 0, 0.5803922, 1, 1,
0.2305902, 0.4433761, 0.6348125, 0, 0.572549, 1, 1,
0.2313887, 2.329797, 0.1996506, 0, 0.5686275, 1, 1,
0.2314891, 0.06364146, 0.05681827, 0, 0.5607843, 1, 1,
0.2315211, -1.306467, 1.867838, 0, 0.5568628, 1, 1,
0.2358798, -1.65529, 3.664075, 0, 0.5490196, 1, 1,
0.2417435, -0.3530432, 2.039067, 0, 0.5450981, 1, 1,
0.242395, -0.6348007, 1.268348, 0, 0.5372549, 1, 1,
0.2480929, -0.9566735, 3.63773, 0, 0.5333334, 1, 1,
0.2505236, -1.035589, 2.435342, 0, 0.5254902, 1, 1,
0.2509491, -0.3485799, 5.144481, 0, 0.5215687, 1, 1,
0.2522998, 0.4022292, 0.7398751, 0, 0.5137255, 1, 1,
0.2525077, 0.05193914, 1.819502, 0, 0.509804, 1, 1,
0.2752035, -0.5261422, 2.972565, 0, 0.5019608, 1, 1,
0.2790167, -0.2876118, 0.7207589, 0, 0.4941176, 1, 1,
0.2805312, -0.270634, 3.029618, 0, 0.4901961, 1, 1,
0.2825201, 1.242749, 1.413176, 0, 0.4823529, 1, 1,
0.2826128, 1.287298, 0.1595368, 0, 0.4784314, 1, 1,
0.2837376, -0.1709532, 1.95079, 0, 0.4705882, 1, 1,
0.2848104, -0.2274269, 1.618821, 0, 0.4666667, 1, 1,
0.2855576, 0.6337468, -1.084371, 0, 0.4588235, 1, 1,
0.2919707, 0.3864342, -1.42621, 0, 0.454902, 1, 1,
0.2987927, 1.313602, -0.2895101, 0, 0.4470588, 1, 1,
0.3001314, 1.458038, -0.1342547, 0, 0.4431373, 1, 1,
0.3024178, -0.873209, 4.235629, 0, 0.4352941, 1, 1,
0.3025785, -0.447841, 2.144553, 0, 0.4313726, 1, 1,
0.3030266, 0.3895862, 0.3779491, 0, 0.4235294, 1, 1,
0.3034227, 0.06837883, 1.549313, 0, 0.4196078, 1, 1,
0.3039299, -0.9735458, 1.609705, 0, 0.4117647, 1, 1,
0.3059407, -1.89212, 3.350719, 0, 0.4078431, 1, 1,
0.3098079, -0.6404088, 3.08674, 0, 0.4, 1, 1,
0.314853, -0.5447342, 4.383992, 0, 0.3921569, 1, 1,
0.3161514, 0.2273921, 0.3833386, 0, 0.3882353, 1, 1,
0.3172301, -1.186299, 3.579792, 0, 0.3803922, 1, 1,
0.3174675, 0.3563123, 1.189973, 0, 0.3764706, 1, 1,
0.3187873, -0.03916414, 0.9378177, 0, 0.3686275, 1, 1,
0.3188407, -1.296237, 1.771501, 0, 0.3647059, 1, 1,
0.3189043, -0.1689686, 3.15177, 0, 0.3568628, 1, 1,
0.3224174, -1.965668, 1.480838, 0, 0.3529412, 1, 1,
0.324067, 0.9762161, -0.1466131, 0, 0.345098, 1, 1,
0.3246035, -0.2143736, 1.448532, 0, 0.3411765, 1, 1,
0.3334085, 0.4309125, 2.477735, 0, 0.3333333, 1, 1,
0.3411825, -0.917482, 2.833371, 0, 0.3294118, 1, 1,
0.3438726, -0.003011104, 0.6994886, 0, 0.3215686, 1, 1,
0.3439183, 0.7659508, 0.6303585, 0, 0.3176471, 1, 1,
0.3453747, -0.06126932, 2.858088, 0, 0.3098039, 1, 1,
0.3464873, 0.6925048, 3.550484, 0, 0.3058824, 1, 1,
0.3472732, 0.4101373, 1.232306, 0, 0.2980392, 1, 1,
0.3479275, -0.6151411, 1.793619, 0, 0.2901961, 1, 1,
0.3532444, 1.988317, 0.03437619, 0, 0.2862745, 1, 1,
0.353462, -0.7731261, 4.338347, 0, 0.2784314, 1, 1,
0.3579381, -0.9971122, 1.599962, 0, 0.2745098, 1, 1,
0.3625766, 1.481969, -0.5599141, 0, 0.2666667, 1, 1,
0.3652745, 0.2207031, 1.11876, 0, 0.2627451, 1, 1,
0.3680047, -0.2464255, 2.117212, 0, 0.254902, 1, 1,
0.3732946, 1.409031, -0.280719, 0, 0.2509804, 1, 1,
0.3757397, 0.924333, -1.256605, 0, 0.2431373, 1, 1,
0.37659, -0.2282432, 3.006869, 0, 0.2392157, 1, 1,
0.3774364, 0.8701057, 0.9752699, 0, 0.2313726, 1, 1,
0.3794593, -0.01526953, 2.90752, 0, 0.227451, 1, 1,
0.3845326, -0.1444833, 0.034074, 0, 0.2196078, 1, 1,
0.3856035, 1.389028, 0.3814734, 0, 0.2156863, 1, 1,
0.386663, -1.559324, 2.171961, 0, 0.2078431, 1, 1,
0.3875614, 0.7246655, 1.161615, 0, 0.2039216, 1, 1,
0.390732, 0.4496681, 0.866494, 0, 0.1960784, 1, 1,
0.3910602, 0.718466, -0.0808894, 0, 0.1882353, 1, 1,
0.3950887, -0.8713495, 0.4197664, 0, 0.1843137, 1, 1,
0.3968379, 0.2595067, 0.7079344, 0, 0.1764706, 1, 1,
0.3977949, -1.141688, 4.355421, 0, 0.172549, 1, 1,
0.4063824, 1.448389, 2.041122, 0, 0.1647059, 1, 1,
0.4084292, 0.6937292, -0.3001854, 0, 0.1607843, 1, 1,
0.4084859, -1.08878, 3.095017, 0, 0.1529412, 1, 1,
0.4087848, -1.187156, 3.862634, 0, 0.1490196, 1, 1,
0.4089482, -1.4706, 3.302586, 0, 0.1411765, 1, 1,
0.4091632, 1.971373, -0.9029578, 0, 0.1372549, 1, 1,
0.4108766, -1.953623, 1.433299, 0, 0.1294118, 1, 1,
0.4128214, -1.46603, 2.285595, 0, 0.1254902, 1, 1,
0.4150095, -0.8925, 5.294452, 0, 0.1176471, 1, 1,
0.4179272, 1.076663, -0.6861095, 0, 0.1137255, 1, 1,
0.4192061, -0.8278887, 2.444366, 0, 0.1058824, 1, 1,
0.4239347, 1.469872, 1.667843, 0, 0.09803922, 1, 1,
0.4260297, 0.8519214, 0.3848284, 0, 0.09411765, 1, 1,
0.4329226, -0.5939349, 3.679547, 0, 0.08627451, 1, 1,
0.4331442, -0.4456249, 2.816472, 0, 0.08235294, 1, 1,
0.4355622, -1.121161, 2.805485, 0, 0.07450981, 1, 1,
0.4380338, -0.7224536, 2.241645, 0, 0.07058824, 1, 1,
0.4392202, 0.1153115, 2.147045, 0, 0.0627451, 1, 1,
0.4404236, 0.8144088, 0.1462723, 0, 0.05882353, 1, 1,
0.44138, 0.3038404, -0.2813963, 0, 0.05098039, 1, 1,
0.442529, -0.09804986, 2.427606, 0, 0.04705882, 1, 1,
0.4439711, -2.496378, 1.649615, 0, 0.03921569, 1, 1,
0.4459376, 1.580886, 2.411458, 0, 0.03529412, 1, 1,
0.449016, 0.2817321, 1.445881, 0, 0.02745098, 1, 1,
0.4513266, 1.65916, 0.213026, 0, 0.02352941, 1, 1,
0.4525016, -0.2915414, 2.167585, 0, 0.01568628, 1, 1,
0.4530969, -0.9910108, 3.884475, 0, 0.01176471, 1, 1,
0.4548006, 0.586157, 0.07090739, 0, 0.003921569, 1, 1,
0.4553166, 0.401294, -0.06262073, 0.003921569, 0, 1, 1,
0.4581309, 0.3828478, 2.040522, 0.007843138, 0, 1, 1,
0.4593176, -1.078822, 2.51082, 0.01568628, 0, 1, 1,
0.462225, 0.5478784, 1.82757, 0.01960784, 0, 1, 1,
0.4682206, 0.8534706, 0.5019277, 0.02745098, 0, 1, 1,
0.4715264, -1.561112, 1.847546, 0.03137255, 0, 1, 1,
0.4720661, 0.6757002, 1.267976, 0.03921569, 0, 1, 1,
0.4751101, 0.8206103, -1.434632, 0.04313726, 0, 1, 1,
0.4755297, 0.04345705, 2.123556, 0.05098039, 0, 1, 1,
0.4786157, 0.975013, -0.8289076, 0.05490196, 0, 1, 1,
0.4903052, -0.3601226, 4.479639, 0.0627451, 0, 1, 1,
0.4924697, 0.9130026, 1.20843, 0.06666667, 0, 1, 1,
0.4932098, 1.110861, 1.501459, 0.07450981, 0, 1, 1,
0.4934287, -1.283533, 2.690051, 0.07843138, 0, 1, 1,
0.4948413, 1.481031, 0.4447447, 0.08627451, 0, 1, 1,
0.4971885, 1.583639, 0.769907, 0.09019608, 0, 1, 1,
0.4985524, -0.5725008, 2.425721, 0.09803922, 0, 1, 1,
0.5027791, 0.2863815, 0.4612487, 0.1058824, 0, 1, 1,
0.5105373, -1.136903, 3.871691, 0.1098039, 0, 1, 1,
0.5122187, 0.2250148, 0.6853502, 0.1176471, 0, 1, 1,
0.5126559, -0.4638369, 2.918418, 0.1215686, 0, 1, 1,
0.5159097, -0.2596524, 0.4805396, 0.1294118, 0, 1, 1,
0.5180578, 1.148553, 1.842486, 0.1333333, 0, 1, 1,
0.519129, 0.8105044, 0.1821307, 0.1411765, 0, 1, 1,
0.52035, -0.9480559, 3.241485, 0.145098, 0, 1, 1,
0.5214739, 0.002748624, 1.45784, 0.1529412, 0, 1, 1,
0.5242943, -0.09110293, 1.71502, 0.1568628, 0, 1, 1,
0.5250633, -1.120968, 2.842237, 0.1647059, 0, 1, 1,
0.5270456, 0.6072494, 2.628976, 0.1686275, 0, 1, 1,
0.5315596, 0.05780106, 1.509307, 0.1764706, 0, 1, 1,
0.5360891, -0.8702495, 3.23672, 0.1803922, 0, 1, 1,
0.5369841, -0.1211586, 1.694298, 0.1882353, 0, 1, 1,
0.5376701, -0.02834538, 1.655161, 0.1921569, 0, 1, 1,
0.5408997, -0.131851, 1.96107, 0.2, 0, 1, 1,
0.5432435, -0.1175911, -0.04970282, 0.2078431, 0, 1, 1,
0.5434916, -0.1651955, 1.103489, 0.2117647, 0, 1, 1,
0.5444821, 0.8312128, 1.79441, 0.2196078, 0, 1, 1,
0.5451825, -0.8400176, 2.619658, 0.2235294, 0, 1, 1,
0.5453896, 0.05294408, 0.5076073, 0.2313726, 0, 1, 1,
0.5495382, 0.3164665, 0.00836233, 0.2352941, 0, 1, 1,
0.5504835, 2.044855, -0.9661055, 0.2431373, 0, 1, 1,
0.5572337, -0.9828191, 0.8141981, 0.2470588, 0, 1, 1,
0.5619066, -1.356029, 2.779457, 0.254902, 0, 1, 1,
0.5676941, 0.6305174, 2.077998, 0.2588235, 0, 1, 1,
0.5759603, 0.5331814, -0.3476729, 0.2666667, 0, 1, 1,
0.5782789, -0.7350814, 2.359416, 0.2705882, 0, 1, 1,
0.5799409, -0.382795, 1.192256, 0.2784314, 0, 1, 1,
0.5890571, 0.4631032, -0.4958706, 0.282353, 0, 1, 1,
0.5893332, 0.7411315, 0.3821985, 0.2901961, 0, 1, 1,
0.5919474, 1.294754, -0.01083112, 0.2941177, 0, 1, 1,
0.5919525, -0.5001046, 2.239233, 0.3019608, 0, 1, 1,
0.595426, -1.080114, 1.847367, 0.3098039, 0, 1, 1,
0.6038225, -0.6383895, 2.304804, 0.3137255, 0, 1, 1,
0.6050701, 0.3325668, -0.2004161, 0.3215686, 0, 1, 1,
0.6088493, 1.2633, 1.348032, 0.3254902, 0, 1, 1,
0.6138503, 0.1993148, 2.109852, 0.3333333, 0, 1, 1,
0.6158941, -1.837457, 2.417845, 0.3372549, 0, 1, 1,
0.6170042, 2.159631, 0.8326743, 0.345098, 0, 1, 1,
0.6182787, -1.213158, 2.604603, 0.3490196, 0, 1, 1,
0.6282863, 0.5952274, 0.1847316, 0.3568628, 0, 1, 1,
0.6302589, 0.9086398, 0.8811295, 0.3607843, 0, 1, 1,
0.6354734, -1.304957, 3.483058, 0.3686275, 0, 1, 1,
0.6366479, 0.48373, 0.530346, 0.372549, 0, 1, 1,
0.6397558, -0.1866838, 2.056869, 0.3803922, 0, 1, 1,
0.6400585, 1.404434, 0.6793071, 0.3843137, 0, 1, 1,
0.6402146, -1.55198, 2.750388, 0.3921569, 0, 1, 1,
0.6406497, -0.2808332, 1.618705, 0.3960784, 0, 1, 1,
0.6434734, 0.1513807, 1.688235, 0.4039216, 0, 1, 1,
0.6441285, 0.4394754, 2.208526, 0.4117647, 0, 1, 1,
0.6444976, -0.2922191, 1.505716, 0.4156863, 0, 1, 1,
0.6497664, 1.098378, 0.215551, 0.4235294, 0, 1, 1,
0.6536613, 0.3236035, -0.2603852, 0.427451, 0, 1, 1,
0.6578514, -1.664973, 2.674754, 0.4352941, 0, 1, 1,
0.6622183, -0.4943964, 2.712721, 0.4392157, 0, 1, 1,
0.6679648, 0.3515431, -0.326694, 0.4470588, 0, 1, 1,
0.6689126, 0.6259682, -0.3799862, 0.4509804, 0, 1, 1,
0.6691238, -0.2112932, 3.013853, 0.4588235, 0, 1, 1,
0.6702501, 1.062757, -0.9661473, 0.4627451, 0, 1, 1,
0.6705275, 1.187879, 0.7658857, 0.4705882, 0, 1, 1,
0.6738412, -0.1044798, 1.132124, 0.4745098, 0, 1, 1,
0.6748093, 0.678452, -0.04071042, 0.4823529, 0, 1, 1,
0.6762704, -1.013174, 4.19511, 0.4862745, 0, 1, 1,
0.6790164, 0.244439, 1.410544, 0.4941176, 0, 1, 1,
0.6798481, -1.214323, 2.093995, 0.5019608, 0, 1, 1,
0.6801864, 0.6705398, 2.456355, 0.5058824, 0, 1, 1,
0.6811928, 0.7246795, 0.8495405, 0.5137255, 0, 1, 1,
0.6815273, 0.9137523, 0.6136926, 0.5176471, 0, 1, 1,
0.6870825, 1.242502, -0.5838423, 0.5254902, 0, 1, 1,
0.6887714, 0.1449089, 0.5238782, 0.5294118, 0, 1, 1,
0.6907694, -1.038279, 2.979003, 0.5372549, 0, 1, 1,
0.6921671, 0.4810346, 0.4713748, 0.5411765, 0, 1, 1,
0.6923959, 1.937714, 0.3223479, 0.5490196, 0, 1, 1,
0.6946138, 0.22116, 0.9783259, 0.5529412, 0, 1, 1,
0.6995098, -0.4250168, 2.374763, 0.5607843, 0, 1, 1,
0.7005588, 1.136633, -0.3714028, 0.5647059, 0, 1, 1,
0.7023839, 0.2079341, 0.5592729, 0.572549, 0, 1, 1,
0.7035455, -0.3298273, 1.263018, 0.5764706, 0, 1, 1,
0.7054967, -2.740752, 4.233722, 0.5843138, 0, 1, 1,
0.7266324, 0.6862302, 1.328681, 0.5882353, 0, 1, 1,
0.7347959, 1.810768, 0.02080438, 0.5960785, 0, 1, 1,
0.7421016, -0.4836017, 2.33484, 0.6039216, 0, 1, 1,
0.7447615, -0.7839865, 3.080746, 0.6078432, 0, 1, 1,
0.7466804, -0.2303561, 1.670706, 0.6156863, 0, 1, 1,
0.7518304, -0.956948, 2.536772, 0.6196079, 0, 1, 1,
0.7519936, 0.1949854, 0.8790113, 0.627451, 0, 1, 1,
0.7521762, -0.8664582, 3.18812, 0.6313726, 0, 1, 1,
0.7565376, 0.2302178, -0.02956537, 0.6392157, 0, 1, 1,
0.7601628, -0.1000326, 2.18671, 0.6431373, 0, 1, 1,
0.7653531, -0.4328258, 2.079345, 0.6509804, 0, 1, 1,
0.7669838, -0.713988, 2.246222, 0.654902, 0, 1, 1,
0.7705343, 0.8951255, 0.6103096, 0.6627451, 0, 1, 1,
0.7724483, 1.037923, 1.018786, 0.6666667, 0, 1, 1,
0.7785664, -0.9797868, 2.257471, 0.6745098, 0, 1, 1,
0.7794843, -0.2361189, 2.22324, 0.6784314, 0, 1, 1,
0.785301, 1.635299, 1.065718, 0.6862745, 0, 1, 1,
0.7891085, -0.9342767, 1.514389, 0.6901961, 0, 1, 1,
0.7931094, 1.358423, -0.2601999, 0.6980392, 0, 1, 1,
0.7946497, 0.5729666, -0.3116828, 0.7058824, 0, 1, 1,
0.7963959, 1.433878, 1.339479, 0.7098039, 0, 1, 1,
0.7988442, 0.6705659, 0.9238706, 0.7176471, 0, 1, 1,
0.802089, -1.436671, 2.577853, 0.7215686, 0, 1, 1,
0.8035255, -2.243294, 2.873325, 0.7294118, 0, 1, 1,
0.8043597, -0.4059602, 2.823164, 0.7333333, 0, 1, 1,
0.8088363, 0.3369699, 0.983867, 0.7411765, 0, 1, 1,
0.812292, -0.2092661, 1.086034, 0.7450981, 0, 1, 1,
0.8123957, 0.5152947, -0.03541794, 0.7529412, 0, 1, 1,
0.8137396, 1.294485, 1.741316, 0.7568628, 0, 1, 1,
0.8279695, 0.5513265, 1.224153, 0.7647059, 0, 1, 1,
0.8414998, 0.4036411, -0.0152495, 0.7686275, 0, 1, 1,
0.8445511, -0.7880906, 1.095537, 0.7764706, 0, 1, 1,
0.8539311, -0.5775225, 3.886012, 0.7803922, 0, 1, 1,
0.8571256, -0.1822345, 1.685009, 0.7882353, 0, 1, 1,
0.858587, -0.5698401, 3.061354, 0.7921569, 0, 1, 1,
0.8591393, 0.554015, 0.501829, 0.8, 0, 1, 1,
0.8684785, 0.6154434, 0.1305725, 0.8078431, 0, 1, 1,
0.8684889, -0.4837282, 2.398329, 0.8117647, 0, 1, 1,
0.8691835, -0.7152272, 0.3992736, 0.8196079, 0, 1, 1,
0.8719184, -0.3192782, 1.247033, 0.8235294, 0, 1, 1,
0.8735133, -0.07671417, 2.380978, 0.8313726, 0, 1, 1,
0.8748305, 1.049732, 0.5134598, 0.8352941, 0, 1, 1,
0.8786522, -0.01105627, 1.293578, 0.8431373, 0, 1, 1,
0.8794326, -1.090992, 2.456882, 0.8470588, 0, 1, 1,
0.887202, 1.209418, 0.8584172, 0.854902, 0, 1, 1,
0.8891112, 0.1886581, 2.178998, 0.8588235, 0, 1, 1,
0.8903236, 1.508663, -2.186447, 0.8666667, 0, 1, 1,
0.8951721, 0.1377714, 0.8896652, 0.8705882, 0, 1, 1,
0.8978879, -0.3424753, 2.198056, 0.8784314, 0, 1, 1,
0.9021696, 1.12675, 1.930216, 0.8823529, 0, 1, 1,
0.9072706, -0.6722424, 1.148657, 0.8901961, 0, 1, 1,
0.9099534, 1.134035, 1.419091, 0.8941177, 0, 1, 1,
0.9158341, 0.2734556, 1.041086, 0.9019608, 0, 1, 1,
0.9170136, 0.8726184, 2.54268, 0.9098039, 0, 1, 1,
0.9184557, 0.1099827, 1.667352, 0.9137255, 0, 1, 1,
0.9241406, 0.4402299, -0.04724342, 0.9215686, 0, 1, 1,
0.9246868, -0.024553, 3.563068, 0.9254902, 0, 1, 1,
0.9302694, 0.513819, 1.82459, 0.9333333, 0, 1, 1,
0.9335367, -0.2409245, 1.544974, 0.9372549, 0, 1, 1,
0.9353111, -2.247713, 2.441884, 0.945098, 0, 1, 1,
0.9371969, 0.9411982, 1.393264, 0.9490196, 0, 1, 1,
0.9436457, 1.093655, 0.8213766, 0.9568627, 0, 1, 1,
0.9481844, -1.64865, 2.827196, 0.9607843, 0, 1, 1,
0.948631, 1.571412, -0.9230791, 0.9686275, 0, 1, 1,
0.954434, 0.6592664, -0.1072917, 0.972549, 0, 1, 1,
0.95584, -0.01707759, 1.755169, 0.9803922, 0, 1, 1,
0.9597043, -0.1247547, 2.351147, 0.9843137, 0, 1, 1,
0.9597564, -0.6714066, 2.10951, 0.9921569, 0, 1, 1,
0.9701909, -0.3952282, 3.335366, 0.9960784, 0, 1, 1,
0.9719038, 0.6757386, -0.2236589, 1, 0, 0.9960784, 1,
0.979313, 0.225043, 1.28334, 1, 0, 0.9882353, 1,
0.9793881, -0.4354443, 1.70549, 1, 0, 0.9843137, 1,
0.9801722, 0.1623473, 2.167748, 1, 0, 0.9764706, 1,
0.9813766, -0.2502802, 2.664044, 1, 0, 0.972549, 1,
0.9854031, 1.481604, 1.241437, 1, 0, 0.9647059, 1,
0.9855736, -0.7124306, 3.239111, 1, 0, 0.9607843, 1,
0.9864222, 0.9349664, -0.1595479, 1, 0, 0.9529412, 1,
0.9904152, -1.220418, 3.188838, 1, 0, 0.9490196, 1,
0.9914746, -0.4961711, 2.525636, 1, 0, 0.9411765, 1,
0.9940692, -0.3730991, 2.23849, 1, 0, 0.9372549, 1,
0.9970064, -1.791868, 4.187763, 1, 0, 0.9294118, 1,
1.005069, -0.3934696, 1.722375, 1, 0, 0.9254902, 1,
1.006502, -0.9254584, 1.969279, 1, 0, 0.9176471, 1,
1.010282, 0.2731244, -0.4239921, 1, 0, 0.9137255, 1,
1.011298, -0.9849294, 2.815935, 1, 0, 0.9058824, 1,
1.013295, 0.505573, 0.808673, 1, 0, 0.9019608, 1,
1.013948, 0.8279226, 1.79855, 1, 0, 0.8941177, 1,
1.018374, -1.100493, 3.677963, 1, 0, 0.8862745, 1,
1.018954, 0.1019554, 2.015831, 1, 0, 0.8823529, 1,
1.024838, -0.1038953, 2.425184, 1, 0, 0.8745098, 1,
1.027752, 1.168001, 0.4532078, 1, 0, 0.8705882, 1,
1.030297, -0.3012734, 1.196507, 1, 0, 0.8627451, 1,
1.038669, -2.79564, 1.808876, 1, 0, 0.8588235, 1,
1.041445, 0.05278317, 1.700108, 1, 0, 0.8509804, 1,
1.041706, -0.5336437, 2.837962, 1, 0, 0.8470588, 1,
1.051688, -0.564886, 1.522816, 1, 0, 0.8392157, 1,
1.053651, -0.7609811, 1.937133, 1, 0, 0.8352941, 1,
1.054597, 0.1158893, 3.189377, 1, 0, 0.827451, 1,
1.065748, -1.446484, 1.556411, 1, 0, 0.8235294, 1,
1.075107, 1.443258, 1.095455, 1, 0, 0.8156863, 1,
1.080103, -0.1431538, 1.955173, 1, 0, 0.8117647, 1,
1.089175, -0.1104143, 3.060615, 1, 0, 0.8039216, 1,
1.094277, -0.3698297, 3.296499, 1, 0, 0.7960784, 1,
1.0969, -0.4459871, 2.313585, 1, 0, 0.7921569, 1,
1.119912, 0.9780433, 1.789446, 1, 0, 0.7843137, 1,
1.124956, 1.077986, 2.143359, 1, 0, 0.7803922, 1,
1.127519, -0.7582306, 2.599227, 1, 0, 0.772549, 1,
1.129974, 0.3951388, 0.07062113, 1, 0, 0.7686275, 1,
1.137033, -0.8645749, -0.2358829, 1, 0, 0.7607843, 1,
1.138578, 1.41444, -0.1146891, 1, 0, 0.7568628, 1,
1.145289, -0.9821347, 2.385889, 1, 0, 0.7490196, 1,
1.148308, 1.409326, 0.1817063, 1, 0, 0.7450981, 1,
1.15105, -0.04388126, 2.14901, 1, 0, 0.7372549, 1,
1.156119, 1.193467, 1.219586, 1, 0, 0.7333333, 1,
1.169801, -0.8581625, 2.576997, 1, 0, 0.7254902, 1,
1.170225, 0.06102818, 2.954144, 1, 0, 0.7215686, 1,
1.172425, 0.4493231, 0.7520846, 1, 0, 0.7137255, 1,
1.183267, 0.2023614, 2.76536, 1, 0, 0.7098039, 1,
1.187195, -0.1538554, 2.622898, 1, 0, 0.7019608, 1,
1.190348, -0.4586666, 1.864703, 1, 0, 0.6941177, 1,
1.194594, 0.3544235, 1.004567, 1, 0, 0.6901961, 1,
1.204826, 0.6715962, 1.869445, 1, 0, 0.682353, 1,
1.217543, 0.04177041, 2.691151, 1, 0, 0.6784314, 1,
1.225081, 0.2723043, 1.237224, 1, 0, 0.6705883, 1,
1.235995, 0.3572721, 3.03497, 1, 0, 0.6666667, 1,
1.238533, 0.3566309, 1.662002, 1, 0, 0.6588235, 1,
1.242501, 0.07430707, -0.006060024, 1, 0, 0.654902, 1,
1.243268, 0.2098857, 1.680338, 1, 0, 0.6470588, 1,
1.251244, 0.8507364, 2.727942, 1, 0, 0.6431373, 1,
1.254699, 0.1361112, 1.079517, 1, 0, 0.6352941, 1,
1.257379, 0.8035437, 0.3644534, 1, 0, 0.6313726, 1,
1.264701, 0.01749544, 0.304167, 1, 0, 0.6235294, 1,
1.265619, 1.569575, -1.358753, 1, 0, 0.6196079, 1,
1.268263, 0.5389835, 0.2800204, 1, 0, 0.6117647, 1,
1.269114, 0.8170643, 0.09608435, 1, 0, 0.6078432, 1,
1.270308, 0.6481479, 2.491339, 1, 0, 0.6, 1,
1.286834, -0.9916014, 1.317894, 1, 0, 0.5921569, 1,
1.286851, 1.934773, -0.1819874, 1, 0, 0.5882353, 1,
1.290335, -1.576827, 2.348982, 1, 0, 0.5803922, 1,
1.296095, -0.3393772, 2.209651, 1, 0, 0.5764706, 1,
1.307733, -0.8695977, 1.029281, 1, 0, 0.5686275, 1,
1.30838, -0.7891297, 3.144466, 1, 0, 0.5647059, 1,
1.309441, 1.323644, 0.3664159, 1, 0, 0.5568628, 1,
1.316474, -0.9902459, 2.120181, 1, 0, 0.5529412, 1,
1.317788, -0.8487733, 2.199532, 1, 0, 0.5450981, 1,
1.321831, -0.8309312, 1.790937, 1, 0, 0.5411765, 1,
1.323603, 0.7290564, 1.456358, 1, 0, 0.5333334, 1,
1.346216, -0.5555671, 2.016328, 1, 0, 0.5294118, 1,
1.361213, -0.5058892, 2.053861, 1, 0, 0.5215687, 1,
1.3652, -0.5148157, 2.95903, 1, 0, 0.5176471, 1,
1.367887, -0.2963485, 2.584769, 1, 0, 0.509804, 1,
1.371949, 0.08575081, 1.616441, 1, 0, 0.5058824, 1,
1.379763, -0.1730886, 2.817057, 1, 0, 0.4980392, 1,
1.380704, -1.330727, 2.406512, 1, 0, 0.4901961, 1,
1.398231, -0.5094199, 3.18262, 1, 0, 0.4862745, 1,
1.399103, -1.285505, 4.016129, 1, 0, 0.4784314, 1,
1.404986, 0.129098, 1.710239, 1, 0, 0.4745098, 1,
1.411459, -1.102685, 2.086772, 1, 0, 0.4666667, 1,
1.440011, 0.3932598, 2.43454, 1, 0, 0.4627451, 1,
1.443042, 1.405212, 2.516328, 1, 0, 0.454902, 1,
1.444912, -1.046881, 2.800208, 1, 0, 0.4509804, 1,
1.447685, 0.3425924, 0.4554176, 1, 0, 0.4431373, 1,
1.45015, 0.9267026, 0.4796502, 1, 0, 0.4392157, 1,
1.473824, 1.558799, -0.7016134, 1, 0, 0.4313726, 1,
1.47804, -1.0743, 2.955821, 1, 0, 0.427451, 1,
1.481792, 1.984361, 2.15901, 1, 0, 0.4196078, 1,
1.482911, 0.5991353, 0.4880728, 1, 0, 0.4156863, 1,
1.49773, -1.02525, 0.3852418, 1, 0, 0.4078431, 1,
1.521963, 0.8062695, -0.3491886, 1, 0, 0.4039216, 1,
1.524782, 0.7333796, -0.133158, 1, 0, 0.3960784, 1,
1.52482, -0.4168683, 1.47937, 1, 0, 0.3882353, 1,
1.534105, -1.316591, 1.002838, 1, 0, 0.3843137, 1,
1.545111, 1.397592, 0.2015814, 1, 0, 0.3764706, 1,
1.55668, -0.08880331, 1.213914, 1, 0, 0.372549, 1,
1.560307, 0.8203629, 0.06510886, 1, 0, 0.3647059, 1,
1.588129, -0.8048315, 1.984106, 1, 0, 0.3607843, 1,
1.596503, 0.6436735, -0.759524, 1, 0, 0.3529412, 1,
1.605694, -0.2271004, 0.8827505, 1, 0, 0.3490196, 1,
1.609124, 1.170184, 1.431289, 1, 0, 0.3411765, 1,
1.620113, 0.2915819, 2.453925, 1, 0, 0.3372549, 1,
1.635435, 1.457861, 1.188652, 1, 0, 0.3294118, 1,
1.636437, -0.1742641, 2.741739, 1, 0, 0.3254902, 1,
1.639994, -1.055885, 3.542921, 1, 0, 0.3176471, 1,
1.647986, 0.8728026, 0.9561356, 1, 0, 0.3137255, 1,
1.648576, -1.66327, 3.094641, 1, 0, 0.3058824, 1,
1.653633, -0.5577725, 0.9044554, 1, 0, 0.2980392, 1,
1.656105, -0.7353032, 3.263975, 1, 0, 0.2941177, 1,
1.657724, 2.126896, 2.014185, 1, 0, 0.2862745, 1,
1.662986, 0.940921, 2.84866, 1, 0, 0.282353, 1,
1.663765, -1.69607, 2.802652, 1, 0, 0.2745098, 1,
1.685437, -0.1040455, 1.589546, 1, 0, 0.2705882, 1,
1.695183, -0.03839362, 1.949765, 1, 0, 0.2627451, 1,
1.70275, 0.8653772, -0.1576123, 1, 0, 0.2588235, 1,
1.70781, -0.3034327, 1.950799, 1, 0, 0.2509804, 1,
1.707915, -0.4625884, 2.223017, 1, 0, 0.2470588, 1,
1.714278, 0.5875803, 0.04294558, 1, 0, 0.2392157, 1,
1.722895, 0.3868233, 2.662893, 1, 0, 0.2352941, 1,
1.731557, 2.624611, -0.5892718, 1, 0, 0.227451, 1,
1.744327, -0.2941843, 2.794138, 1, 0, 0.2235294, 1,
1.762369, 0.2018176, 0.05306705, 1, 0, 0.2156863, 1,
1.770546, -0.1423967, 0.310073, 1, 0, 0.2117647, 1,
1.774246, -1.467054, 2.120766, 1, 0, 0.2039216, 1,
1.778097, 0.4844304, 1.163551, 1, 0, 0.1960784, 1,
1.802758, 0.09208399, 0.9558863, 1, 0, 0.1921569, 1,
1.806552, -1.360301, 2.089412, 1, 0, 0.1843137, 1,
1.808065, -1.465099, 3.08727, 1, 0, 0.1803922, 1,
1.831518, -0.6996474, 1.631847, 1, 0, 0.172549, 1,
1.852608, 1.977169, 1.126818, 1, 0, 0.1686275, 1,
1.860634, 0.8286035, 0.04825093, 1, 0, 0.1607843, 1,
1.880314, 0.7799578, 2.978513, 1, 0, 0.1568628, 1,
1.886576, 1.051676, 1.582626, 1, 0, 0.1490196, 1,
1.88786, -1.175245, 1.194601, 1, 0, 0.145098, 1,
1.934112, 0.1915064, 0.4811949, 1, 0, 0.1372549, 1,
1.938542, 1.012075, 1.464517, 1, 0, 0.1333333, 1,
1.94311, 0.5432826, 2.684445, 1, 0, 0.1254902, 1,
1.947512, 1.255503, 1.708019, 1, 0, 0.1215686, 1,
1.967403, 2.368059, 1.151483, 1, 0, 0.1137255, 1,
1.992089, 0.2323659, -0.6295856, 1, 0, 0.1098039, 1,
1.993462, 2.548248, 1.300546, 1, 0, 0.1019608, 1,
2.001684, -0.2237446, 0.2673886, 1, 0, 0.09411765, 1,
2.010444, 1.772141, 0.1012088, 1, 0, 0.09019608, 1,
2.069119, -0.1602302, 0.3413543, 1, 0, 0.08235294, 1,
2.075389, 2.243261, 1.199799, 1, 0, 0.07843138, 1,
2.087617, -0.420471, 1.435183, 1, 0, 0.07058824, 1,
2.094313, 0.5359519, -0.5335274, 1, 0, 0.06666667, 1,
2.214409, -1.722559, 1.940292, 1, 0, 0.05882353, 1,
2.298929, 0.5703226, 1.904574, 1, 0, 0.05490196, 1,
2.324282, -0.3583319, 1.283164, 1, 0, 0.04705882, 1,
2.328387, 0.7850561, 1.496038, 1, 0, 0.04313726, 1,
2.519618, -0.4747819, 1.413937, 1, 0, 0.03529412, 1,
2.640789, 0.3607031, 1.62939, 1, 0, 0.03137255, 1,
2.724196, 0.7445235, 1.449207, 1, 0, 0.02352941, 1,
2.73752, -0.7262606, 2.095728, 1, 0, 0.01960784, 1,
2.776004, -1.012725, 3.004099, 1, 0, 0.01176471, 1,
3.809893, -0.7943833, 3.018256, 1, 0, 0.007843138, 1
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
0.1797806, -4.559849, -7.859888, 0, -0.5, 0.5, 0.5,
0.1797806, -4.559849, -7.859888, 1, -0.5, 0.5, 0.5,
0.1797806, -4.559849, -7.859888, 1, 1.5, 0.5, 0.5,
0.1797806, -4.559849, -7.859888, 0, 1.5, 0.5, 0.5
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
-4.68094, -0.3509384, -7.859888, 0, -0.5, 0.5, 0.5,
-4.68094, -0.3509384, -7.859888, 1, -0.5, 0.5, 0.5,
-4.68094, -0.3509384, -7.859888, 1, 1.5, 0.5, 0.5,
-4.68094, -0.3509384, -7.859888, 0, 1.5, 0.5, 0.5
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
-4.68094, -4.559849, -0.3294644, 0, -0.5, 0.5, 0.5,
-4.68094, -4.559849, -0.3294644, 1, -0.5, 0.5, 0.5,
-4.68094, -4.559849, -0.3294644, 1, 1.5, 0.5, 0.5,
-4.68094, -4.559849, -0.3294644, 0, 1.5, 0.5, 0.5
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
-2, -3.588562, -6.122098,
2, -3.588562, -6.122098,
-2, -3.588562, -6.122098,
-2, -3.750443, -6.41173,
0, -3.588562, -6.122098,
0, -3.750443, -6.41173,
2, -3.588562, -6.122098,
2, -3.750443, -6.41173
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
-2, -4.074205, -6.990993, 0, -0.5, 0.5, 0.5,
-2, -4.074205, -6.990993, 1, -0.5, 0.5, 0.5,
-2, -4.074205, -6.990993, 1, 1.5, 0.5, 0.5,
-2, -4.074205, -6.990993, 0, 1.5, 0.5, 0.5,
0, -4.074205, -6.990993, 0, -0.5, 0.5, 0.5,
0, -4.074205, -6.990993, 1, -0.5, 0.5, 0.5,
0, -4.074205, -6.990993, 1, 1.5, 0.5, 0.5,
0, -4.074205, -6.990993, 0, 1.5, 0.5, 0.5,
2, -4.074205, -6.990993, 0, -0.5, 0.5, 0.5,
2, -4.074205, -6.990993, 1, -0.5, 0.5, 0.5,
2, -4.074205, -6.990993, 1, 1.5, 0.5, 0.5,
2, -4.074205, -6.990993, 0, 1.5, 0.5, 0.5
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
-3.559235, -3, -6.122098,
-3.559235, 2, -6.122098,
-3.559235, -3, -6.122098,
-3.746186, -3, -6.41173,
-3.559235, -2, -6.122098,
-3.746186, -2, -6.41173,
-3.559235, -1, -6.122098,
-3.746186, -1, -6.41173,
-3.559235, 0, -6.122098,
-3.746186, 0, -6.41173,
-3.559235, 1, -6.122098,
-3.746186, 1, -6.41173,
-3.559235, 2, -6.122098,
-3.746186, 2, -6.41173
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
-4.120088, -3, -6.990993, 0, -0.5, 0.5, 0.5,
-4.120088, -3, -6.990993, 1, -0.5, 0.5, 0.5,
-4.120088, -3, -6.990993, 1, 1.5, 0.5, 0.5,
-4.120088, -3, -6.990993, 0, 1.5, 0.5, 0.5,
-4.120088, -2, -6.990993, 0, -0.5, 0.5, 0.5,
-4.120088, -2, -6.990993, 1, -0.5, 0.5, 0.5,
-4.120088, -2, -6.990993, 1, 1.5, 0.5, 0.5,
-4.120088, -2, -6.990993, 0, 1.5, 0.5, 0.5,
-4.120088, -1, -6.990993, 0, -0.5, 0.5, 0.5,
-4.120088, -1, -6.990993, 1, -0.5, 0.5, 0.5,
-4.120088, -1, -6.990993, 1, 1.5, 0.5, 0.5,
-4.120088, -1, -6.990993, 0, 1.5, 0.5, 0.5,
-4.120088, 0, -6.990993, 0, -0.5, 0.5, 0.5,
-4.120088, 0, -6.990993, 1, -0.5, 0.5, 0.5,
-4.120088, 0, -6.990993, 1, 1.5, 0.5, 0.5,
-4.120088, 0, -6.990993, 0, 1.5, 0.5, 0.5,
-4.120088, 1, -6.990993, 0, -0.5, 0.5, 0.5,
-4.120088, 1, -6.990993, 1, -0.5, 0.5, 0.5,
-4.120088, 1, -6.990993, 1, 1.5, 0.5, 0.5,
-4.120088, 1, -6.990993, 0, 1.5, 0.5, 0.5,
-4.120088, 2, -6.990993, 0, -0.5, 0.5, 0.5,
-4.120088, 2, -6.990993, 1, -0.5, 0.5, 0.5,
-4.120088, 2, -6.990993, 1, 1.5, 0.5, 0.5,
-4.120088, 2, -6.990993, 0, 1.5, 0.5, 0.5
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
-3.559235, -3.588562, -4,
-3.559235, -3.588562, 4,
-3.559235, -3.588562, -4,
-3.746186, -3.750443, -4,
-3.559235, -3.588562, -2,
-3.746186, -3.750443, -2,
-3.559235, -3.588562, 0,
-3.746186, -3.750443, 0,
-3.559235, -3.588562, 2,
-3.746186, -3.750443, 2,
-3.559235, -3.588562, 4,
-3.746186, -3.750443, 4
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
-4.120088, -4.074205, -4, 0, -0.5, 0.5, 0.5,
-4.120088, -4.074205, -4, 1, -0.5, 0.5, 0.5,
-4.120088, -4.074205, -4, 1, 1.5, 0.5, 0.5,
-4.120088, -4.074205, -4, 0, 1.5, 0.5, 0.5,
-4.120088, -4.074205, -2, 0, -0.5, 0.5, 0.5,
-4.120088, -4.074205, -2, 1, -0.5, 0.5, 0.5,
-4.120088, -4.074205, -2, 1, 1.5, 0.5, 0.5,
-4.120088, -4.074205, -2, 0, 1.5, 0.5, 0.5,
-4.120088, -4.074205, 0, 0, -0.5, 0.5, 0.5,
-4.120088, -4.074205, 0, 1, -0.5, 0.5, 0.5,
-4.120088, -4.074205, 0, 1, 1.5, 0.5, 0.5,
-4.120088, -4.074205, 0, 0, 1.5, 0.5, 0.5,
-4.120088, -4.074205, 2, 0, -0.5, 0.5, 0.5,
-4.120088, -4.074205, 2, 1, -0.5, 0.5, 0.5,
-4.120088, -4.074205, 2, 1, 1.5, 0.5, 0.5,
-4.120088, -4.074205, 2, 0, 1.5, 0.5, 0.5,
-4.120088, -4.074205, 4, 0, -0.5, 0.5, 0.5,
-4.120088, -4.074205, 4, 1, -0.5, 0.5, 0.5,
-4.120088, -4.074205, 4, 1, 1.5, 0.5, 0.5,
-4.120088, -4.074205, 4, 0, 1.5, 0.5, 0.5
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
-3.559235, -3.588562, -6.122098,
-3.559235, 2.886685, -6.122098,
-3.559235, -3.588562, 5.463169,
-3.559235, 2.886685, 5.463169,
-3.559235, -3.588562, -6.122098,
-3.559235, -3.588562, 5.463169,
-3.559235, 2.886685, -6.122098,
-3.559235, 2.886685, 5.463169,
-3.559235, -3.588562, -6.122098,
3.918796, -3.588562, -6.122098,
-3.559235, -3.588562, 5.463169,
3.918796, -3.588562, 5.463169,
-3.559235, 2.886685, -6.122098,
3.918796, 2.886685, -6.122098,
-3.559235, 2.886685, 5.463169,
3.918796, 2.886685, 5.463169,
3.918796, -3.588562, -6.122098,
3.918796, 2.886685, -6.122098,
3.918796, -3.588562, 5.463169,
3.918796, 2.886685, 5.463169,
3.918796, -3.588562, -6.122098,
3.918796, -3.588562, 5.463169,
3.918796, 2.886685, -6.122098,
3.918796, 2.886685, 5.463169
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
var radius = 8.134545;
var distance = 36.19151;
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
mvMatrix.translate( -0.1797806, 0.3509384, 0.3294644 );
mvMatrix.scale( 1.176142, 1.358285, 0.7591736 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.19151);
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
nitrothal-isopropyl<-read.table("nitrothal-isopropyl.xyz")
```

```
## Error in read.table("nitrothal-isopropyl.xyz"): no lines available in input
```

```r
x<-nitrothal-isopropyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'nitrothal' not found
```

```r
y<-nitrothal-isopropyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'nitrothal' not found
```

```r
z<-nitrothal-isopropyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'nitrothal' not found
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
-3.450332, -1.55996, -2.31461, 0, 0, 1, 1, 1,
-2.968991, -1.361882, -2.914647, 1, 0, 0, 1, 1,
-2.879549, -0.04749494, 0.1072514, 1, 0, 0, 1, 1,
-2.837745, -1.436322, -0.9336367, 1, 0, 0, 1, 1,
-2.647847, -0.3921321, -0.8218557, 1, 0, 0, 1, 1,
-2.416243, -0.2430934, -2.32707, 1, 0, 0, 1, 1,
-2.385281, 0.7094096, -1.960747, 0, 0, 0, 1, 1,
-2.349267, -1.444767, -2.477151, 0, 0, 0, 1, 1,
-2.29754, -1.303943, -2.143034, 0, 0, 0, 1, 1,
-2.292295, 1.907599, -1.651721, 0, 0, 0, 1, 1,
-2.272708, -0.437018, -2.805846, 0, 0, 0, 1, 1,
-2.25541, 0.05028648, -1.859744, 0, 0, 0, 1, 1,
-2.247439, -1.682368, -1.071205, 0, 0, 0, 1, 1,
-2.207173, 0.6694192, -0.4173219, 1, 1, 1, 1, 1,
-2.195553, 0.5469893, -1.720946, 1, 1, 1, 1, 1,
-2.181242, -0.1643017, -2.020287, 1, 1, 1, 1, 1,
-2.127639, 0.9571433, -1.523032, 1, 1, 1, 1, 1,
-2.102966, 0.2707642, -2.520677, 1, 1, 1, 1, 1,
-2.085499, -0.1249092, -0.9410319, 1, 1, 1, 1, 1,
-2.06174, -0.6950564, -0.4516049, 1, 1, 1, 1, 1,
-2.059424, -1.887833, -3.169275, 1, 1, 1, 1, 1,
-2.027756, 0.1227172, -1.091757, 1, 1, 1, 1, 1,
-2.002601, -0.5052381, -1.543326, 1, 1, 1, 1, 1,
-1.994473, 1.861751, -3.227422, 1, 1, 1, 1, 1,
-1.991508, 1.770445, -2.050683, 1, 1, 1, 1, 1,
-1.985903, 0.7382281, 0.4735146, 1, 1, 1, 1, 1,
-1.979416, -0.02855648, -2.03634, 1, 1, 1, 1, 1,
-1.964143, 0.9401274, -0.07186119, 1, 1, 1, 1, 1,
-1.947911, -0.6088083, -1.873291, 0, 0, 1, 1, 1,
-1.906964, -0.634416, -1.009033, 1, 0, 0, 1, 1,
-1.901347, 2.555158, 1.093251, 1, 0, 0, 1, 1,
-1.840074, 0.5245611, -1.017381, 1, 0, 0, 1, 1,
-1.827124, -0.2390231, -2.226877, 1, 0, 0, 1, 1,
-1.803586, 0.4534461, -1.57488, 1, 0, 0, 1, 1,
-1.786008, 0.2251535, -3.234987, 0, 0, 0, 1, 1,
-1.775069, -1.396183, -1.827514, 0, 0, 0, 1, 1,
-1.760629, -1.511897, -2.463042, 0, 0, 0, 1, 1,
-1.759912, 0.03212485, -1.788236, 0, 0, 0, 1, 1,
-1.712295, -0.6278676, -0.5757702, 0, 0, 0, 1, 1,
-1.703727, 1.172773, -1.141711, 0, 0, 0, 1, 1,
-1.702295, -0.03576563, -1.27848, 0, 0, 0, 1, 1,
-1.692027, 0.798518, -0.3950411, 1, 1, 1, 1, 1,
-1.691961, -1.387916, -2.190097, 1, 1, 1, 1, 1,
-1.675632, -2.268413, -2.998045, 1, 1, 1, 1, 1,
-1.672867, 0.04441778, -1.077623, 1, 1, 1, 1, 1,
-1.672473, 1.03752, 1.137355, 1, 1, 1, 1, 1,
-1.663465, 2.061286, 0.2333462, 1, 1, 1, 1, 1,
-1.661285, -1.565018, -3.260593, 1, 1, 1, 1, 1,
-1.648318, 0.276984, 0.4216008, 1, 1, 1, 1, 1,
-1.63967, 0.9139704, -1.540762, 1, 1, 1, 1, 1,
-1.635832, 0.5428514, -1.095294, 1, 1, 1, 1, 1,
-1.632953, -0.3298195, -1.938984, 1, 1, 1, 1, 1,
-1.607061, 1.137472, -1.136081, 1, 1, 1, 1, 1,
-1.589318, 0.2983913, -2.173528, 1, 1, 1, 1, 1,
-1.582847, 2.211238, -1.101134, 1, 1, 1, 1, 1,
-1.564826, -0.2854528, -2.78501, 1, 1, 1, 1, 1,
-1.542593, 0.266476, -0.6080387, 0, 0, 1, 1, 1,
-1.538988, 0.1156029, 0.07910357, 1, 0, 0, 1, 1,
-1.53164, -1.452928, -4.979695, 1, 0, 0, 1, 1,
-1.522125, 1.004183, 1.030239, 1, 0, 0, 1, 1,
-1.516975, 0.492516, -0.8410252, 1, 0, 0, 1, 1,
-1.501146, -1.422173, -0.8786232, 1, 0, 0, 1, 1,
-1.479089, 1.652849, 0.2760983, 0, 0, 0, 1, 1,
-1.477545, 0.08659428, -1.556967, 0, 0, 0, 1, 1,
-1.468566, -1.792887, -2.188712, 0, 0, 0, 1, 1,
-1.447865, -1.375057, -1.875294, 0, 0, 0, 1, 1,
-1.442426, 0.358942, -2.938813, 0, 0, 0, 1, 1,
-1.437817, 0.2059067, -2.462662, 0, 0, 0, 1, 1,
-1.432541, -0.9065511, -1.302447, 0, 0, 0, 1, 1,
-1.425902, 1.04127, -1.286856, 1, 1, 1, 1, 1,
-1.424755, -0.8432653, -1.578459, 1, 1, 1, 1, 1,
-1.420443, 0.431025, -1.21991, 1, 1, 1, 1, 1,
-1.41921, 0.1394404, -1.510773, 1, 1, 1, 1, 1,
-1.41462, 0.03547501, -1.375146, 1, 1, 1, 1, 1,
-1.409673, 0.2946875, -1.382374, 1, 1, 1, 1, 1,
-1.392617, -0.01725391, 0.6709226, 1, 1, 1, 1, 1,
-1.386551, -0.7599786, -4.308685, 1, 1, 1, 1, 1,
-1.380361, -0.9131325, -1.937439, 1, 1, 1, 1, 1,
-1.367539, 0.4752536, -1.837416, 1, 1, 1, 1, 1,
-1.356765, -0.3137529, -1.342914, 1, 1, 1, 1, 1,
-1.35538, -0.272894, -0.6444296, 1, 1, 1, 1, 1,
-1.343622, -0.05027624, -1.887026, 1, 1, 1, 1, 1,
-1.334467, -0.1770157, -1.585609, 1, 1, 1, 1, 1,
-1.328187, -0.2444499, -1.377671, 1, 1, 1, 1, 1,
-1.328025, -0.07669259, -1.781248, 0, 0, 1, 1, 1,
-1.32148, -0.1247159, -3.074901, 1, 0, 0, 1, 1,
-1.32136, -1.014207, -1.230468, 1, 0, 0, 1, 1,
-1.321099, 0.2230257, -1.410049, 1, 0, 0, 1, 1,
-1.304893, 0.2207471, -1.831183, 1, 0, 0, 1, 1,
-1.301539, -0.07118311, -0.6403964, 1, 0, 0, 1, 1,
-1.299735, 0.2658191, -1.438188, 0, 0, 0, 1, 1,
-1.29289, 2.015694, 0.456351, 0, 0, 0, 1, 1,
-1.288411, -0.04653681, -1.573229, 0, 0, 0, 1, 1,
-1.283539, 0.08733457, -0.5079461, 0, 0, 0, 1, 1,
-1.28202, -0.6319161, -1.30179, 0, 0, 0, 1, 1,
-1.277744, -0.065855, -2.723339, 0, 0, 0, 1, 1,
-1.269839, 0.3951143, -1.691359, 0, 0, 0, 1, 1,
-1.269151, -0.03204034, -0.3709145, 1, 1, 1, 1, 1,
-1.265546, 1.068475, -0.6464743, 1, 1, 1, 1, 1,
-1.261233, -0.535723, -1.39012, 1, 1, 1, 1, 1,
-1.255474, 0.7574652, -0.3405205, 1, 1, 1, 1, 1,
-1.24481, -0.8776464, -4.003922, 1, 1, 1, 1, 1,
-1.240337, -1.243201, -2.162441, 1, 1, 1, 1, 1,
-1.237425, 0.2782419, -0.8960728, 1, 1, 1, 1, 1,
-1.229695, -0.5654349, -2.30249, 1, 1, 1, 1, 1,
-1.229614, -1.747949, -2.034763, 1, 1, 1, 1, 1,
-1.223357, -0.1210219, -0.906318, 1, 1, 1, 1, 1,
-1.219522, -1.094382, -4.159246, 1, 1, 1, 1, 1,
-1.215507, -0.979766, -2.785342, 1, 1, 1, 1, 1,
-1.211576, 0.1565335, -1.028528, 1, 1, 1, 1, 1,
-1.196094, -0.7630525, -3.584509, 1, 1, 1, 1, 1,
-1.189308, 0.3599915, 0.02743855, 1, 1, 1, 1, 1,
-1.189264, -0.4118601, -1.86512, 0, 0, 1, 1, 1,
-1.185102, -0.7948532, -2.631671, 1, 0, 0, 1, 1,
-1.180295, 0.8073746, -2.093533, 1, 0, 0, 1, 1,
-1.178877, -0.4980694, -4.741986, 1, 0, 0, 1, 1,
-1.171357, 0.5699811, -2.170756, 1, 0, 0, 1, 1,
-1.153428, -2.663231, -1.645389, 1, 0, 0, 1, 1,
-1.150557, -0.6290296, -1.284443, 0, 0, 0, 1, 1,
-1.149974, -1.572325, -3.916595, 0, 0, 0, 1, 1,
-1.145415, -0.7440595, -1.221734, 0, 0, 0, 1, 1,
-1.142872, 0.3287718, -0.5709218, 0, 0, 0, 1, 1,
-1.141416, 0.5722055, -2.6563, 0, 0, 0, 1, 1,
-1.125875, 1.182788, 0.8526902, 0, 0, 0, 1, 1,
-1.125737, -1.633243, -1.605917, 0, 0, 0, 1, 1,
-1.119906, -0.3913108, -2.600246, 1, 1, 1, 1, 1,
-1.119763, 0.2758151, -1.996884, 1, 1, 1, 1, 1,
-1.115124, -0.247608, -2.639612, 1, 1, 1, 1, 1,
-1.112629, 0.30469, -0.1798461, 1, 1, 1, 1, 1,
-1.107605, -0.6731974, -1.954413, 1, 1, 1, 1, 1,
-1.104805, -0.4148028, -0.4041482, 1, 1, 1, 1, 1,
-1.102945, 0.7355519, -2.339813, 1, 1, 1, 1, 1,
-1.087454, -1.254718, -2.142785, 1, 1, 1, 1, 1,
-1.083646, 1.374253, -2.017734, 1, 1, 1, 1, 1,
-1.082274, -0.2236598, -3.375117, 1, 1, 1, 1, 1,
-1.080423, -1.168342, -2.523741, 1, 1, 1, 1, 1,
-1.067779, -0.3242544, -3.486501, 1, 1, 1, 1, 1,
-1.066509, -0.7110141, -0.8667676, 1, 1, 1, 1, 1,
-1.064362, -0.8198081, -2.181426, 1, 1, 1, 1, 1,
-1.060747, -0.2207604, -1.917432, 1, 1, 1, 1, 1,
-1.058486, -1.590856, -0.9889275, 0, 0, 1, 1, 1,
-1.052061, -0.5987335, -2.73383, 1, 0, 0, 1, 1,
-1.046628, 0.6992579, -0.8215913, 1, 0, 0, 1, 1,
-1.046139, -0.3921184, -2.378328, 1, 0, 0, 1, 1,
-1.036015, -1.422874, -1.78447, 1, 0, 0, 1, 1,
-1.025981, 0.2059734, -1.319834, 1, 0, 0, 1, 1,
-1.021074, 0.07664983, -2.848279, 0, 0, 0, 1, 1,
-1.017027, 2.392698, -0.426963, 0, 0, 0, 1, 1,
-1.015262, -0.7840605, -0.7855536, 0, 0, 0, 1, 1,
-1.014686, 0.1879829, -1.294402, 0, 0, 0, 1, 1,
-1.010084, 1.64623, -0.3731233, 0, 0, 0, 1, 1,
-1.007792, 0.750079, -3.347071, 0, 0, 0, 1, 1,
-1.000574, 0.43431, -1.183582, 0, 0, 0, 1, 1,
-0.9968978, -1.245261, -1.234258, 1, 1, 1, 1, 1,
-0.9953, -0.8740097, -1.904696, 1, 1, 1, 1, 1,
-0.989933, 0.6202058, -2.213154, 1, 1, 1, 1, 1,
-0.9854043, -0.2765045, -1.322864, 1, 1, 1, 1, 1,
-0.9847836, 0.3934938, -1.465428, 1, 1, 1, 1, 1,
-0.9842152, -0.4981211, -4.306327, 1, 1, 1, 1, 1,
-0.9825051, 0.5366554, -2.392669, 1, 1, 1, 1, 1,
-0.9821115, 0.4851338, -0.5287677, 1, 1, 1, 1, 1,
-0.980671, -1.360734, -3.25544, 1, 1, 1, 1, 1,
-0.9690705, 1.659318, 0.9641773, 1, 1, 1, 1, 1,
-0.9572275, -0.3694552, -2.403072, 1, 1, 1, 1, 1,
-0.9400441, 1.497588, 0.5383642, 1, 1, 1, 1, 1,
-0.939479, -0.482803, -0.6987395, 1, 1, 1, 1, 1,
-0.9392644, 1.762619, 0.04584106, 1, 1, 1, 1, 1,
-0.9261031, 1.19839, 0.718782, 1, 1, 1, 1, 1,
-0.9228739, -0.9305859, -3.982555, 0, 0, 1, 1, 1,
-0.921801, -1.632845, -0.7470086, 1, 0, 0, 1, 1,
-0.9196862, 0.4648593, -1.398707, 1, 0, 0, 1, 1,
-0.9158666, -1.372531, -2.818642, 1, 0, 0, 1, 1,
-0.9154097, -1.394407, -1.542168, 1, 0, 0, 1, 1,
-0.9137818, -0.1609494, -1.101596, 1, 0, 0, 1, 1,
-0.9056227, -1.347222, -2.045975, 0, 0, 0, 1, 1,
-0.9042104, -3.272986, -3.081285, 0, 0, 0, 1, 1,
-0.9001775, 0.6621514, -3.036571, 0, 0, 0, 1, 1,
-0.897378, 0.29757, -1.222728, 0, 0, 0, 1, 1,
-0.8899812, 0.8935245, -1.237766, 0, 0, 0, 1, 1,
-0.8882387, -1.250873, -2.432039, 0, 0, 0, 1, 1,
-0.886419, 1.156942, -1.845603, 0, 0, 0, 1, 1,
-0.884827, -0.4155527, -2.214638, 1, 1, 1, 1, 1,
-0.8818738, -1.090162, -3.807151, 1, 1, 1, 1, 1,
-0.8777997, 1.134863, -4.339134, 1, 1, 1, 1, 1,
-0.8746182, -0.4089796, -2.053089, 1, 1, 1, 1, 1,
-0.8735459, -1.272085, -0.9969271, 1, 1, 1, 1, 1,
-0.8709106, 0.8611145, -0.8505104, 1, 1, 1, 1, 1,
-0.8682714, 1.294128, 1.41185, 1, 1, 1, 1, 1,
-0.8594723, -0.2601275, -2.245388, 1, 1, 1, 1, 1,
-0.8574589, -1.253375, -1.936036, 1, 1, 1, 1, 1,
-0.856775, -0.8453088, -0.8056843, 1, 1, 1, 1, 1,
-0.8541711, 0.831847, -1.093834, 1, 1, 1, 1, 1,
-0.8493493, 1.586176, -0.7667885, 1, 1, 1, 1, 1,
-0.8478055, 1.93228, -1.652859, 1, 1, 1, 1, 1,
-0.8376439, -0.7379405, 0.1323536, 1, 1, 1, 1, 1,
-0.8356901, -1.305467, -1.372254, 1, 1, 1, 1, 1,
-0.835214, 0.7319698, -2.455465, 0, 0, 1, 1, 1,
-0.8342572, -0.281136, -0.1269283, 1, 0, 0, 1, 1,
-0.8319874, -0.05302823, -2.72927, 1, 0, 0, 1, 1,
-0.8313904, 0.3452905, -0.6035957, 1, 0, 0, 1, 1,
-0.8284992, -1.373604, -2.051071, 1, 0, 0, 1, 1,
-0.825744, 0.6206037, -2.214026, 1, 0, 0, 1, 1,
-0.8229483, -0.3115643, -3.820922, 0, 0, 0, 1, 1,
-0.8214435, 0.1125674, -1.051673, 0, 0, 0, 1, 1,
-0.8123162, -1.361201, -2.522733, 0, 0, 0, 1, 1,
-0.8003367, 0.05989443, -0.9076821, 0, 0, 0, 1, 1,
-0.7977143, -0.8260213, -1.748732, 0, 0, 0, 1, 1,
-0.7941756, 0.1956723, -1.190593, 0, 0, 0, 1, 1,
-0.7929806, 0.8128567, -1.281131, 0, 0, 0, 1, 1,
-0.7839404, -0.8064972, -2.607031, 1, 1, 1, 1, 1,
-0.7814781, 0.3462553, -0.8999993, 1, 1, 1, 1, 1,
-0.7811803, 0.3577139, -2.011053, 1, 1, 1, 1, 1,
-0.7778755, -0.3102595, -1.240848, 1, 1, 1, 1, 1,
-0.7772104, -1.411514, -1.01667, 1, 1, 1, 1, 1,
-0.7707624, 1.190477, -1.697162, 1, 1, 1, 1, 1,
-0.7628338, 1.053736, 0.7061855, 1, 1, 1, 1, 1,
-0.7604233, -0.7315361, -4.024299, 1, 1, 1, 1, 1,
-0.7560081, -0.3246787, -2.780598, 1, 1, 1, 1, 1,
-0.7548096, -1.812325, -2.665791, 1, 1, 1, 1, 1,
-0.7527626, -1.349915, -3.192015, 1, 1, 1, 1, 1,
-0.7519169, -0.1368762, -3.691191, 1, 1, 1, 1, 1,
-0.7474639, 0.6512796, -1.5574, 1, 1, 1, 1, 1,
-0.7458492, -1.290931, -1.255694, 1, 1, 1, 1, 1,
-0.7328154, -0.07001147, -0.7679163, 1, 1, 1, 1, 1,
-0.7325493, 0.4908728, -1.489071, 0, 0, 1, 1, 1,
-0.7301933, -0.3723866, -1.720334, 1, 0, 0, 1, 1,
-0.7269278, -1.335139, -1.535248, 1, 0, 0, 1, 1,
-0.7249923, 0.498414, -1.461094, 1, 0, 0, 1, 1,
-0.7237655, 0.3883404, -1.436353, 1, 0, 0, 1, 1,
-0.7230693, -0.6307891, -1.9018, 1, 0, 0, 1, 1,
-0.7163842, -0.3013339, -1.718893, 0, 0, 0, 1, 1,
-0.7143497, 1.377556, -0.4926686, 0, 0, 0, 1, 1,
-0.7043657, 0.2474964, -2.062935, 0, 0, 0, 1, 1,
-0.6996249, 1.269311, -1.403831, 0, 0, 0, 1, 1,
-0.6960936, 0.7687679, -0.9501522, 0, 0, 0, 1, 1,
-0.6925406, -0.2171497, -2.671037, 0, 0, 0, 1, 1,
-0.6917122, 0.8028953, -0.9452812, 0, 0, 0, 1, 1,
-0.6873298, -0.4268029, -2.370889, 1, 1, 1, 1, 1,
-0.6864716, -0.4342796, -1.571063, 1, 1, 1, 1, 1,
-0.6793023, -1.116977, -3.673873, 1, 1, 1, 1, 1,
-0.6717052, 0.9790339, -0.8964826, 1, 1, 1, 1, 1,
-0.6700364, 0.6033518, -0.3737167, 1, 1, 1, 1, 1,
-0.6598368, -0.1186383, -1.510418, 1, 1, 1, 1, 1,
-0.6564369, -1.054817, -3.594226, 1, 1, 1, 1, 1,
-0.6505055, -1.589665, -2.949161, 1, 1, 1, 1, 1,
-0.6486099, -0.03625361, -1.745392, 1, 1, 1, 1, 1,
-0.6485416, 1.045828, -0.457176, 1, 1, 1, 1, 1,
-0.6469365, -1.156497, -1.814313, 1, 1, 1, 1, 1,
-0.6456933, 0.1361986, -2.760082, 1, 1, 1, 1, 1,
-0.6433731, -0.4963474, -1.490259, 1, 1, 1, 1, 1,
-0.6409974, -0.9613227, -4.524443, 1, 1, 1, 1, 1,
-0.6372694, 2.792385, -0.9838207, 1, 1, 1, 1, 1,
-0.6368732, -0.3422267, -2.760005, 0, 0, 1, 1, 1,
-0.6348316, 0.1614968, -1.99814, 1, 0, 0, 1, 1,
-0.6315576, -1.715825, -2.848991, 1, 0, 0, 1, 1,
-0.6281453, -0.5266797, -2.575447, 1, 0, 0, 1, 1,
-0.6169079, -0.02464023, -2.188694, 1, 0, 0, 1, 1,
-0.6168547, 0.02088708, -0.2245794, 1, 0, 0, 1, 1,
-0.6154326, -1.274346, -3.027892, 0, 0, 0, 1, 1,
-0.6133399, 0.4381418, 0.107419, 0, 0, 0, 1, 1,
-0.6093053, -0.5330928, -2.905367, 0, 0, 0, 1, 1,
-0.605889, 1.187726, 0.6956948, 0, 0, 0, 1, 1,
-0.6033359, -1.235682, -1.415277, 0, 0, 0, 1, 1,
-0.5983725, -1.00706, -1.814856, 0, 0, 0, 1, 1,
-0.5953121, 0.5544915, 1.145577, 0, 0, 0, 1, 1,
-0.5945501, 0.3135533, -1.556348, 1, 1, 1, 1, 1,
-0.5925683, 0.1489442, -0.2426756, 1, 1, 1, 1, 1,
-0.5901291, -0.2783845, -3.387419, 1, 1, 1, 1, 1,
-0.5855064, 0.4984326, -0.3259535, 1, 1, 1, 1, 1,
-0.585025, -0.8975406, -1.707487, 1, 1, 1, 1, 1,
-0.5841526, 0.7558151, 1.677118, 1, 1, 1, 1, 1,
-0.5788298, -0.3598381, -0.7168059, 1, 1, 1, 1, 1,
-0.5735552, -0.2747493, -2.609934, 1, 1, 1, 1, 1,
-0.572917, 0.2189027, -0.2257759, 1, 1, 1, 1, 1,
-0.5698197, 1.897263, 0.05059406, 1, 1, 1, 1, 1,
-0.5692731, 1.106391, -0.7837177, 1, 1, 1, 1, 1,
-0.5525377, 0.1352383, -0.7021034, 1, 1, 1, 1, 1,
-0.5491375, 1.713006, 0.4922808, 1, 1, 1, 1, 1,
-0.5487742, -1.804957, -2.579631, 1, 1, 1, 1, 1,
-0.5484048, -1.335452, -3.234951, 1, 1, 1, 1, 1,
-0.5460162, 1.29175, -2.434788, 0, 0, 1, 1, 1,
-0.5441078, 1.842323, -0.2743607, 1, 0, 0, 1, 1,
-0.5434299, 1.65338, -0.3168463, 1, 0, 0, 1, 1,
-0.5371557, -0.4728561, -3.123306, 1, 0, 0, 1, 1,
-0.5344932, 0.4033095, -0.7930578, 1, 0, 0, 1, 1,
-0.5330321, 0.5742107, -0.4733631, 1, 0, 0, 1, 1,
-0.5323837, -0.05487055, -1.146903, 0, 0, 0, 1, 1,
-0.5312601, 2.450898, -0.7345477, 0, 0, 0, 1, 1,
-0.5309401, 1.486483, -0.8818622, 0, 0, 0, 1, 1,
-0.5303119, 1.12741, -0.06051929, 0, 0, 0, 1, 1,
-0.5298256, -1.353254, -2.973426, 0, 0, 0, 1, 1,
-0.5271139, 1.642308, -0.05096087, 0, 0, 0, 1, 1,
-0.5266408, -1.552697, -4.130691, 0, 0, 0, 1, 1,
-0.5263676, -0.2329408, -2.599384, 1, 1, 1, 1, 1,
-0.5202463, -1.948172, -3.566666, 1, 1, 1, 1, 1,
-0.5170203, -0.6185581, -1.663695, 1, 1, 1, 1, 1,
-0.5104621, 2.04661, 0.01046875, 1, 1, 1, 1, 1,
-0.5096208, 0.9365525, 0.05525185, 1, 1, 1, 1, 1,
-0.5059238, -1.543862, -2.508734, 1, 1, 1, 1, 1,
-0.5035092, 0.8086782, 0.09190137, 1, 1, 1, 1, 1,
-0.4876715, -2.756499, -2.499076, 1, 1, 1, 1, 1,
-0.4841555, -0.8333112, -2.254501, 1, 1, 1, 1, 1,
-0.4817865, 0.06841307, 0.02340447, 1, 1, 1, 1, 1,
-0.4792984, 0.4521733, -1.611569, 1, 1, 1, 1, 1,
-0.4741073, -0.2623436, -1.624791, 1, 1, 1, 1, 1,
-0.4718635, 0.2393121, -1.876621, 1, 1, 1, 1, 1,
-0.4686953, 0.9082992, -1.556936, 1, 1, 1, 1, 1,
-0.4683536, 0.4765259, -0.5514733, 1, 1, 1, 1, 1,
-0.4681231, -1.120628, -1.831294, 0, 0, 1, 1, 1,
-0.459286, 1.492985, 0.7086602, 1, 0, 0, 1, 1,
-0.456679, 0.452311, 0.1763853, 1, 0, 0, 1, 1,
-0.4516332, -1.572652, -4.718843, 1, 0, 0, 1, 1,
-0.4476577, 0.2679138, -1.293942, 1, 0, 0, 1, 1,
-0.4433331, 0.5959122, 0.9430283, 1, 0, 0, 1, 1,
-0.4409234, -1.343567, -1.967728, 0, 0, 0, 1, 1,
-0.4289919, -0.6445452, -3.28802, 0, 0, 0, 1, 1,
-0.4243966, 0.8589626, 0.1255811, 0, 0, 0, 1, 1,
-0.4224284, -1.991331, -5.031837, 0, 0, 0, 1, 1,
-0.414443, 1.59697, -1.063121, 0, 0, 0, 1, 1,
-0.4131856, 0.6023197, 1.871709, 0, 0, 0, 1, 1,
-0.4116592, 1.611096, -0.896771, 0, 0, 0, 1, 1,
-0.4108163, -0.6236727, -2.608499, 1, 1, 1, 1, 1,
-0.4089167, 0.5847394, 0.8211889, 1, 1, 1, 1, 1,
-0.4075179, 0.7158372, -0.05740717, 1, 1, 1, 1, 1,
-0.4035922, -0.1402087, -1.961298, 1, 1, 1, 1, 1,
-0.4025962, -1.351834, -2.172706, 1, 1, 1, 1, 1,
-0.4011046, 0.6067276, 1.611235, 1, 1, 1, 1, 1,
-0.3992191, -1.358675, -3.307675, 1, 1, 1, 1, 1,
-0.3990161, -0.3851047, -2.111031, 1, 1, 1, 1, 1,
-0.3944491, 0.5885203, 0.1635352, 1, 1, 1, 1, 1,
-0.3906813, -0.3373822, -2.972001, 1, 1, 1, 1, 1,
-0.3896978, 0.9382632, 0.3246284, 1, 1, 1, 1, 1,
-0.3874578, -0.6521096, -1.473752, 1, 1, 1, 1, 1,
-0.3872105, -0.1312112, -1.1632, 1, 1, 1, 1, 1,
-0.3868854, 0.5456915, -0.03284237, 1, 1, 1, 1, 1,
-0.3866116, 0.4104837, -2.835667, 1, 1, 1, 1, 1,
-0.3854382, 0.9463013, 0.2893106, 0, 0, 1, 1, 1,
-0.3835036, 2.323855, -1.183535, 1, 0, 0, 1, 1,
-0.3824829, -0.7673907, -1.891564, 1, 0, 0, 1, 1,
-0.3803185, 0.4736361, -1.529215, 1, 0, 0, 1, 1,
-0.3783794, 1.307281, 0.2991876, 1, 0, 0, 1, 1,
-0.377371, -1.721328, -3.354177, 1, 0, 0, 1, 1,
-0.3754251, -0.04729725, -0.6247646, 0, 0, 0, 1, 1,
-0.3726896, 0.2889873, -2.378083, 0, 0, 0, 1, 1,
-0.3646949, -0.5994017, -1.762682, 0, 0, 0, 1, 1,
-0.3629346, -0.7286162, -2.558698, 0, 0, 0, 1, 1,
-0.3624654, 0.4774667, -1.169121, 0, 0, 0, 1, 1,
-0.3556605, 0.8404981, 0.9293671, 0, 0, 0, 1, 1,
-0.3546958, -0.3084861, -0.2660542, 0, 0, 0, 1, 1,
-0.3533097, -1.397183, -2.939915, 1, 1, 1, 1, 1,
-0.3504033, -0.04015557, -0.2314068, 1, 1, 1, 1, 1,
-0.3479957, -0.5589005, -0.5108592, 1, 1, 1, 1, 1,
-0.3458993, -0.2126389, -2.217659, 1, 1, 1, 1, 1,
-0.3390647, 0.7909525, -0.1513606, 1, 1, 1, 1, 1,
-0.3388733, -0.4873824, -2.489486, 1, 1, 1, 1, 1,
-0.3360731, 1.118116, -1.325696, 1, 1, 1, 1, 1,
-0.3242411, 1.836131, 1.640787, 1, 1, 1, 1, 1,
-0.322601, -0.8237174, -2.921792, 1, 1, 1, 1, 1,
-0.3222938, 0.5312374, -0.621712, 1, 1, 1, 1, 1,
-0.3220485, 0.2937261, -1.037931, 1, 1, 1, 1, 1,
-0.3212199, 0.1102063, 0.08637456, 1, 1, 1, 1, 1,
-0.3192721, -0.02973488, 0.07554366, 1, 1, 1, 1, 1,
-0.3187851, -0.5059455, -2.378458, 1, 1, 1, 1, 1,
-0.3093968, -0.3329516, -2.398301, 1, 1, 1, 1, 1,
-0.3072166, 1.691138, -2.272475, 0, 0, 1, 1, 1,
-0.3063211, -0.6965264, -2.799325, 1, 0, 0, 1, 1,
-0.3060154, 0.2258889, 0.3785915, 1, 0, 0, 1, 1,
-0.3045185, -1.485339, -3.605126, 1, 0, 0, 1, 1,
-0.2994026, -0.1572161, -1.873285, 1, 0, 0, 1, 1,
-0.2960978, 0.1958084, 0.4834186, 1, 0, 0, 1, 1,
-0.2932686, -0.2767699, -1.882256, 0, 0, 0, 1, 1,
-0.2923185, -0.03417338, -2.620604, 0, 0, 0, 1, 1,
-0.2872961, -1.548452, -3.461285, 0, 0, 0, 1, 1,
-0.2856969, 1.375263, -0.01839134, 0, 0, 0, 1, 1,
-0.2835537, 0.1009448, -1.220624, 0, 0, 0, 1, 1,
-0.2806248, 0.3219025, 0.2389048, 0, 0, 0, 1, 1,
-0.2770114, 0.3353141, 0.3106313, 0, 0, 0, 1, 1,
-0.2769827, -2.553394, -3.598033, 1, 1, 1, 1, 1,
-0.2768495, 0.3310694, -2.017148, 1, 1, 1, 1, 1,
-0.2651961, 0.6456942, -0.5917596, 1, 1, 1, 1, 1,
-0.2583809, 0.9455495, 2.781918, 1, 1, 1, 1, 1,
-0.2539009, 0.4151953, 1.078284, 1, 1, 1, 1, 1,
-0.2536075, -0.3355288, -1.162661, 1, 1, 1, 1, 1,
-0.2503294, 0.02906179, -1.858894, 1, 1, 1, 1, 1,
-0.2465223, 0.7298696, 0.6332963, 1, 1, 1, 1, 1,
-0.2441644, -1.452701, -4.838446, 1, 1, 1, 1, 1,
-0.2434191, 0.2681513, -0.7832595, 1, 1, 1, 1, 1,
-0.2434067, -0.06780916, -2.502662, 1, 1, 1, 1, 1,
-0.2427206, -0.4181285, -2.877306, 1, 1, 1, 1, 1,
-0.242448, 0.9452991, 1.240118, 1, 1, 1, 1, 1,
-0.2416608, 0.6767899, -0.7770422, 1, 1, 1, 1, 1,
-0.2378682, 0.7724247, 0.0699082, 1, 1, 1, 1, 1,
-0.2341403, -0.2870734, -3.146863, 0, 0, 1, 1, 1,
-0.2319426, -2.619432, -4.174423, 1, 0, 0, 1, 1,
-0.2316525, 0.4893601, 1.204492, 1, 0, 0, 1, 1,
-0.2305386, 0.1149388, -1.035427, 1, 0, 0, 1, 1,
-0.2301598, 0.003171641, -0.7199091, 1, 0, 0, 1, 1,
-0.2287382, -0.6787865, -2.273147, 1, 0, 0, 1, 1,
-0.2266479, 0.07133385, -1.854039, 0, 0, 0, 1, 1,
-0.2229279, 0.5638793, -1.339061, 0, 0, 0, 1, 1,
-0.21876, 2.67698, -1.518611, 0, 0, 0, 1, 1,
-0.2175019, 0.2320119, 1.294182, 0, 0, 0, 1, 1,
-0.2167796, 0.7456549, -1.057786, 0, 0, 0, 1, 1,
-0.2165141, 0.01612261, -0.1281853, 0, 0, 0, 1, 1,
-0.2161339, 1.116163, -1.163741, 0, 0, 0, 1, 1,
-0.2148765, 0.00600314, -1.529698, 1, 1, 1, 1, 1,
-0.2138565, -0.9765401, -3.289104, 1, 1, 1, 1, 1,
-0.2124612, 1.754088, -0.8688429, 1, 1, 1, 1, 1,
-0.2116103, -0.313489, -1.495589, 1, 1, 1, 1, 1,
-0.2105187, -0.4444936, -3.097617, 1, 1, 1, 1, 1,
-0.2104134, -1.363438, -3.075072, 1, 1, 1, 1, 1,
-0.2100632, -0.2087786, -3.603209, 1, 1, 1, 1, 1,
-0.2077046, 1.757836, 0.3894344, 1, 1, 1, 1, 1,
-0.207057, 0.7573518, -0.5534416, 1, 1, 1, 1, 1,
-0.2069258, 0.4151264, 0.3984016, 1, 1, 1, 1, 1,
-0.2040529, -0.2869403, -2.68498, 1, 1, 1, 1, 1,
-0.2039112, 0.4641193, -0.8288772, 1, 1, 1, 1, 1,
-0.1988957, 0.1302616, -2.10506, 1, 1, 1, 1, 1,
-0.1976577, 0.2353545, -0.254753, 1, 1, 1, 1, 1,
-0.1972168, -2.528064, -2.997469, 1, 1, 1, 1, 1,
-0.1870666, 0.8078281, 0.7210166, 0, 0, 1, 1, 1,
-0.1837203, -1.175205, -3.455517, 1, 0, 0, 1, 1,
-0.1803429, 0.9788646, -0.8225109, 1, 0, 0, 1, 1,
-0.177389, -0.08251335, -1.699688, 1, 0, 0, 1, 1,
-0.1762623, -1.056055, -1.233098, 1, 0, 0, 1, 1,
-0.1742247, 0.4766222, 1.136319, 1, 0, 0, 1, 1,
-0.1719522, -1.19706, -2.039277, 0, 0, 0, 1, 1,
-0.1634024, 1.497939, -0.5227714, 0, 0, 0, 1, 1,
-0.1478683, 1.119196, 1.776952, 0, 0, 0, 1, 1,
-0.1473838, -0.557851, -2.151881, 0, 0, 0, 1, 1,
-0.1469127, -0.5634961, -4.405771, 0, 0, 0, 1, 1,
-0.1376032, -1.27265, -3.636968, 0, 0, 0, 1, 1,
-0.1363631, 0.3168263, 0.5484892, 0, 0, 0, 1, 1,
-0.1350568, -0.3391351, -1.761143, 1, 1, 1, 1, 1,
-0.1317963, -0.4001595, -1.687096, 1, 1, 1, 1, 1,
-0.1312334, -3.494262, -3.794864, 1, 1, 1, 1, 1,
-0.1287853, -1.052829, -2.181977, 1, 1, 1, 1, 1,
-0.1255729, 0.2734579, -1.941224, 1, 1, 1, 1, 1,
-0.1244823, -0.01917153, -3.594876, 1, 1, 1, 1, 1,
-0.1233659, 0.1188507, 0.4644103, 1, 1, 1, 1, 1,
-0.1230606, 2.149938, 0.3897075, 1, 1, 1, 1, 1,
-0.1217504, 0.5735796, 0.9889264, 1, 1, 1, 1, 1,
-0.1200944, -0.3745256, -3.006798, 1, 1, 1, 1, 1,
-0.1148758, -0.06287211, -2.344378, 1, 1, 1, 1, 1,
-0.1141567, -0.670573, -2.041643, 1, 1, 1, 1, 1,
-0.1138112, -1.181574, -3.291006, 1, 1, 1, 1, 1,
-0.1089901, 1.751654, -0.6220691, 1, 1, 1, 1, 1,
-0.1061255, 0.820577, -0.09937957, 1, 1, 1, 1, 1,
-0.1038514, 0.1521201, -0.6909557, 0, 0, 1, 1, 1,
-0.1026179, 1.178811, 0.1231148, 1, 0, 0, 1, 1,
-0.1003525, 0.6344449, 0.851352, 1, 0, 0, 1, 1,
-0.0993914, 0.3250505, -0.4860942, 1, 0, 0, 1, 1,
-0.09854714, -1.34671, -4.299365, 1, 0, 0, 1, 1,
-0.09482207, -0.5122998, -4.335579, 1, 0, 0, 1, 1,
-0.08704057, -0.09698226, -3.525023, 0, 0, 0, 1, 1,
-0.07602935, -0.06996883, -1.64047, 0, 0, 0, 1, 1,
-0.07534131, 0.8310613, 0.4130807, 0, 0, 0, 1, 1,
-0.07502868, 0.7028779, 0.04273086, 0, 0, 0, 1, 1,
-0.07223582, 0.7251662, 0.02373853, 0, 0, 0, 1, 1,
-0.06922843, 0.5549766, -1.564584, 0, 0, 0, 1, 1,
-0.0612617, -0.0625032, -0.5604874, 0, 0, 0, 1, 1,
-0.05822038, -0.1925731, -3.044219, 1, 1, 1, 1, 1,
-0.04893096, -0.6526697, -2.443335, 1, 1, 1, 1, 1,
-0.04871663, 0.464698, 0.7808442, 1, 1, 1, 1, 1,
-0.04781904, 0.7827293, 0.4221681, 1, 1, 1, 1, 1,
-0.0429137, 0.2050057, 0.6769074, 1, 1, 1, 1, 1,
-0.04201655, -1.518218, -3.378805, 1, 1, 1, 1, 1,
-0.04174246, -0.07951627, -3.502216, 1, 1, 1, 1, 1,
-0.04079463, -0.3704607, -3.588682, 1, 1, 1, 1, 1,
-0.04029807, 1.377847, 0.2264374, 1, 1, 1, 1, 1,
-0.03617783, -0.6540688, -2.62641, 1, 1, 1, 1, 1,
-0.0347537, 0.5471984, -1.438412, 1, 1, 1, 1, 1,
-0.03280543, -0.4120653, -3.799211, 1, 1, 1, 1, 1,
-0.03110996, -1.933774, -5.953381, 1, 1, 1, 1, 1,
-0.03090366, -0.2041862, -2.778377, 1, 1, 1, 1, 1,
-0.03023679, 0.05863063, 0.340882, 1, 1, 1, 1, 1,
-0.02862338, 0.1447612, 1.073359, 0, 0, 1, 1, 1,
-0.02807274, -0.022311, -1.859278, 1, 0, 0, 1, 1,
-0.01944077, -0.3521301, -2.984764, 1, 0, 0, 1, 1,
-0.01602802, 1.096854, 1.009309, 1, 0, 0, 1, 1,
-0.01103075, 0.8793074, 1.346541, 1, 0, 0, 1, 1,
-0.008506808, 0.2935447, -0.1797838, 1, 0, 0, 1, 1,
-0.006486594, -0.6324327, -4.969958, 0, 0, 0, 1, 1,
0.0005793772, -0.06022023, 4.652816, 0, 0, 0, 1, 1,
0.003992484, -0.2600299, 2.615584, 0, 0, 0, 1, 1,
0.004643121, 0.297481, -1.303596, 0, 0, 0, 1, 1,
0.005215952, -1.910892, 3.172165, 0, 0, 0, 1, 1,
0.005905308, 0.807792, -0.8107984, 0, 0, 0, 1, 1,
0.01396495, 1.352023, -2.436581, 0, 0, 0, 1, 1,
0.01504892, -1.196564, 3.578871, 1, 1, 1, 1, 1,
0.02171014, -0.615311, 1.696284, 1, 1, 1, 1, 1,
0.0223391, -0.2186517, 3.176836, 1, 1, 1, 1, 1,
0.02373047, -0.2064529, 3.144741, 1, 1, 1, 1, 1,
0.02502186, 0.6275321, 0.8580454, 1, 1, 1, 1, 1,
0.03031271, -0.4879688, 3.277965, 1, 1, 1, 1, 1,
0.03053716, 0.2855853, -0.3689748, 1, 1, 1, 1, 1,
0.03169443, -0.4195322, 4.069704, 1, 1, 1, 1, 1,
0.03410474, 0.4517753, -0.4108535, 1, 1, 1, 1, 1,
0.03672774, -0.6623003, 3.150843, 1, 1, 1, 1, 1,
0.04098669, -0.07866624, 4.357594, 1, 1, 1, 1, 1,
0.04186498, 1.486218, 0.2704092, 1, 1, 1, 1, 1,
0.0495268, 1.15086, 0.4575949, 1, 1, 1, 1, 1,
0.05313849, 1.248359, 0.8109541, 1, 1, 1, 1, 1,
0.05374979, 1.844711, 0.6447793, 1, 1, 1, 1, 1,
0.05502965, 0.5616036, 0.7947075, 0, 0, 1, 1, 1,
0.05690007, 0.3329425, -1.158714, 1, 0, 0, 1, 1,
0.05795873, 0.1139551, -0.6136585, 1, 0, 0, 1, 1,
0.05975812, 1.078946, 1.940433, 1, 0, 0, 1, 1,
0.06084723, 2.2913, 0.9671803, 1, 0, 0, 1, 1,
0.06344201, 0.37991, -2.450482, 1, 0, 0, 1, 1,
0.06411429, 0.7224413, 1.36666, 0, 0, 0, 1, 1,
0.06500691, -0.7517847, 2.581955, 0, 0, 0, 1, 1,
0.06593861, -2.070241, 3.879131, 0, 0, 0, 1, 1,
0.0730421, 0.5390657, -1.002244, 0, 0, 0, 1, 1,
0.07686236, 0.166209, -0.8956021, 0, 0, 0, 1, 1,
0.07748611, 1.366066, 2.684791, 0, 0, 0, 1, 1,
0.07885779, -1.562184, 2.643023, 0, 0, 0, 1, 1,
0.0807298, -0.2150059, 2.88615, 1, 1, 1, 1, 1,
0.08428446, 0.8501554, -0.01103348, 1, 1, 1, 1, 1,
0.09468801, -0.5255205, 3.430868, 1, 1, 1, 1, 1,
0.1010693, -0.5117127, 3.426488, 1, 1, 1, 1, 1,
0.1049116, -0.2517123, 2.157056, 1, 1, 1, 1, 1,
0.1075095, 0.6244919, -0.6080077, 1, 1, 1, 1, 1,
0.1079684, 0.6542788, 0.4371164, 1, 1, 1, 1, 1,
0.1093249, 1.210538, 0.8042987, 1, 1, 1, 1, 1,
0.1094181, 0.1446753, -0.8510259, 1, 1, 1, 1, 1,
0.1139043, -0.4138629, 1.822769, 1, 1, 1, 1, 1,
0.116691, -1.176786, 1.940819, 1, 1, 1, 1, 1,
0.1229012, 1.167652, 0.03407941, 1, 1, 1, 1, 1,
0.1266067, 0.265479, -0.4869675, 1, 1, 1, 1, 1,
0.1363124, -2.539025, 1.862761, 1, 1, 1, 1, 1,
0.1437721, 0.2068192, 1.73227, 1, 1, 1, 1, 1,
0.1451949, 1.088417, 0.4601022, 0, 0, 1, 1, 1,
0.1454486, 0.4622076, 1.971829, 1, 0, 0, 1, 1,
0.1467378, -1.55514, 3.39817, 1, 0, 0, 1, 1,
0.1486245, -0.1639927, 4.154202, 1, 0, 0, 1, 1,
0.153388, 1.102687, -1.231299, 1, 0, 0, 1, 1,
0.1551672, -0.4719976, 4.537685, 1, 0, 0, 1, 1,
0.1563523, -1.289325, 2.900331, 0, 0, 0, 1, 1,
0.1616222, -0.6981991, 3.040358, 0, 0, 0, 1, 1,
0.1628689, 1.840161, -1.147864, 0, 0, 0, 1, 1,
0.1697093, -0.4393568, 1.643589, 0, 0, 0, 1, 1,
0.1741656, 0.4371413, 1.199478, 0, 0, 0, 1, 1,
0.1743139, 0.5517495, 1.988647, 0, 0, 0, 1, 1,
0.1821747, -0.04015709, 1.700725, 0, 0, 0, 1, 1,
0.1829048, 1.654515, -0.8437405, 1, 1, 1, 1, 1,
0.1856212, 0.4240262, -0.4855857, 1, 1, 1, 1, 1,
0.1879243, 0.338445, -0.301852, 1, 1, 1, 1, 1,
0.1884368, 0.4897812, -1.338831, 1, 1, 1, 1, 1,
0.1931993, 1.158331, -1.113907, 1, 1, 1, 1, 1,
0.1950121, 2.044424, 0.2344546, 1, 1, 1, 1, 1,
0.1952231, -0.1768245, 2.047469, 1, 1, 1, 1, 1,
0.1974996, 0.2771125, -0.6586972, 1, 1, 1, 1, 1,
0.2009837, -0.9177898, 2.693467, 1, 1, 1, 1, 1,
0.2014999, 0.413191, -0.03088452, 1, 1, 1, 1, 1,
0.2021896, -1.063256, 2.543328, 1, 1, 1, 1, 1,
0.2063328, -0.2611528, 3.782985, 1, 1, 1, 1, 1,
0.2108951, 0.3756903, 1.784448, 1, 1, 1, 1, 1,
0.2113484, -1.141142, 3.067143, 1, 1, 1, 1, 1,
0.2115758, 1.434858, -0.09245255, 1, 1, 1, 1, 1,
0.2168807, 0.04016089, 1.114725, 0, 0, 1, 1, 1,
0.2170828, -0.2635536, 0.9800556, 1, 0, 0, 1, 1,
0.2199644, -0.2488495, 0.903718, 1, 0, 0, 1, 1,
0.2214035, -1.007232, 3.262787, 1, 0, 0, 1, 1,
0.2246569, 0.1988028, 2.384247, 1, 0, 0, 1, 1,
0.2278183, -0.07365073, 1.46345, 1, 0, 0, 1, 1,
0.2280639, 1.090059, 1.601199, 0, 0, 0, 1, 1,
0.2286598, 0.3025476, 0.2733102, 0, 0, 0, 1, 1,
0.2294201, 0.3494124, 1.448442, 0, 0, 0, 1, 1,
0.2302441, -0.2852295, 2.545459, 0, 0, 0, 1, 1,
0.2305732, 0.07435849, 0.5383021, 0, 0, 0, 1, 1,
0.2305902, 0.4433761, 0.6348125, 0, 0, 0, 1, 1,
0.2313887, 2.329797, 0.1996506, 0, 0, 0, 1, 1,
0.2314891, 0.06364146, 0.05681827, 1, 1, 1, 1, 1,
0.2315211, -1.306467, 1.867838, 1, 1, 1, 1, 1,
0.2358798, -1.65529, 3.664075, 1, 1, 1, 1, 1,
0.2417435, -0.3530432, 2.039067, 1, 1, 1, 1, 1,
0.242395, -0.6348007, 1.268348, 1, 1, 1, 1, 1,
0.2480929, -0.9566735, 3.63773, 1, 1, 1, 1, 1,
0.2505236, -1.035589, 2.435342, 1, 1, 1, 1, 1,
0.2509491, -0.3485799, 5.144481, 1, 1, 1, 1, 1,
0.2522998, 0.4022292, 0.7398751, 1, 1, 1, 1, 1,
0.2525077, 0.05193914, 1.819502, 1, 1, 1, 1, 1,
0.2752035, -0.5261422, 2.972565, 1, 1, 1, 1, 1,
0.2790167, -0.2876118, 0.7207589, 1, 1, 1, 1, 1,
0.2805312, -0.270634, 3.029618, 1, 1, 1, 1, 1,
0.2825201, 1.242749, 1.413176, 1, 1, 1, 1, 1,
0.2826128, 1.287298, 0.1595368, 1, 1, 1, 1, 1,
0.2837376, -0.1709532, 1.95079, 0, 0, 1, 1, 1,
0.2848104, -0.2274269, 1.618821, 1, 0, 0, 1, 1,
0.2855576, 0.6337468, -1.084371, 1, 0, 0, 1, 1,
0.2919707, 0.3864342, -1.42621, 1, 0, 0, 1, 1,
0.2987927, 1.313602, -0.2895101, 1, 0, 0, 1, 1,
0.3001314, 1.458038, -0.1342547, 1, 0, 0, 1, 1,
0.3024178, -0.873209, 4.235629, 0, 0, 0, 1, 1,
0.3025785, -0.447841, 2.144553, 0, 0, 0, 1, 1,
0.3030266, 0.3895862, 0.3779491, 0, 0, 0, 1, 1,
0.3034227, 0.06837883, 1.549313, 0, 0, 0, 1, 1,
0.3039299, -0.9735458, 1.609705, 0, 0, 0, 1, 1,
0.3059407, -1.89212, 3.350719, 0, 0, 0, 1, 1,
0.3098079, -0.6404088, 3.08674, 0, 0, 0, 1, 1,
0.314853, -0.5447342, 4.383992, 1, 1, 1, 1, 1,
0.3161514, 0.2273921, 0.3833386, 1, 1, 1, 1, 1,
0.3172301, -1.186299, 3.579792, 1, 1, 1, 1, 1,
0.3174675, 0.3563123, 1.189973, 1, 1, 1, 1, 1,
0.3187873, -0.03916414, 0.9378177, 1, 1, 1, 1, 1,
0.3188407, -1.296237, 1.771501, 1, 1, 1, 1, 1,
0.3189043, -0.1689686, 3.15177, 1, 1, 1, 1, 1,
0.3224174, -1.965668, 1.480838, 1, 1, 1, 1, 1,
0.324067, 0.9762161, -0.1466131, 1, 1, 1, 1, 1,
0.3246035, -0.2143736, 1.448532, 1, 1, 1, 1, 1,
0.3334085, 0.4309125, 2.477735, 1, 1, 1, 1, 1,
0.3411825, -0.917482, 2.833371, 1, 1, 1, 1, 1,
0.3438726, -0.003011104, 0.6994886, 1, 1, 1, 1, 1,
0.3439183, 0.7659508, 0.6303585, 1, 1, 1, 1, 1,
0.3453747, -0.06126932, 2.858088, 1, 1, 1, 1, 1,
0.3464873, 0.6925048, 3.550484, 0, 0, 1, 1, 1,
0.3472732, 0.4101373, 1.232306, 1, 0, 0, 1, 1,
0.3479275, -0.6151411, 1.793619, 1, 0, 0, 1, 1,
0.3532444, 1.988317, 0.03437619, 1, 0, 0, 1, 1,
0.353462, -0.7731261, 4.338347, 1, 0, 0, 1, 1,
0.3579381, -0.9971122, 1.599962, 1, 0, 0, 1, 1,
0.3625766, 1.481969, -0.5599141, 0, 0, 0, 1, 1,
0.3652745, 0.2207031, 1.11876, 0, 0, 0, 1, 1,
0.3680047, -0.2464255, 2.117212, 0, 0, 0, 1, 1,
0.3732946, 1.409031, -0.280719, 0, 0, 0, 1, 1,
0.3757397, 0.924333, -1.256605, 0, 0, 0, 1, 1,
0.37659, -0.2282432, 3.006869, 0, 0, 0, 1, 1,
0.3774364, 0.8701057, 0.9752699, 0, 0, 0, 1, 1,
0.3794593, -0.01526953, 2.90752, 1, 1, 1, 1, 1,
0.3845326, -0.1444833, 0.034074, 1, 1, 1, 1, 1,
0.3856035, 1.389028, 0.3814734, 1, 1, 1, 1, 1,
0.386663, -1.559324, 2.171961, 1, 1, 1, 1, 1,
0.3875614, 0.7246655, 1.161615, 1, 1, 1, 1, 1,
0.390732, 0.4496681, 0.866494, 1, 1, 1, 1, 1,
0.3910602, 0.718466, -0.0808894, 1, 1, 1, 1, 1,
0.3950887, -0.8713495, 0.4197664, 1, 1, 1, 1, 1,
0.3968379, 0.2595067, 0.7079344, 1, 1, 1, 1, 1,
0.3977949, -1.141688, 4.355421, 1, 1, 1, 1, 1,
0.4063824, 1.448389, 2.041122, 1, 1, 1, 1, 1,
0.4084292, 0.6937292, -0.3001854, 1, 1, 1, 1, 1,
0.4084859, -1.08878, 3.095017, 1, 1, 1, 1, 1,
0.4087848, -1.187156, 3.862634, 1, 1, 1, 1, 1,
0.4089482, -1.4706, 3.302586, 1, 1, 1, 1, 1,
0.4091632, 1.971373, -0.9029578, 0, 0, 1, 1, 1,
0.4108766, -1.953623, 1.433299, 1, 0, 0, 1, 1,
0.4128214, -1.46603, 2.285595, 1, 0, 0, 1, 1,
0.4150095, -0.8925, 5.294452, 1, 0, 0, 1, 1,
0.4179272, 1.076663, -0.6861095, 1, 0, 0, 1, 1,
0.4192061, -0.8278887, 2.444366, 1, 0, 0, 1, 1,
0.4239347, 1.469872, 1.667843, 0, 0, 0, 1, 1,
0.4260297, 0.8519214, 0.3848284, 0, 0, 0, 1, 1,
0.4329226, -0.5939349, 3.679547, 0, 0, 0, 1, 1,
0.4331442, -0.4456249, 2.816472, 0, 0, 0, 1, 1,
0.4355622, -1.121161, 2.805485, 0, 0, 0, 1, 1,
0.4380338, -0.7224536, 2.241645, 0, 0, 0, 1, 1,
0.4392202, 0.1153115, 2.147045, 0, 0, 0, 1, 1,
0.4404236, 0.8144088, 0.1462723, 1, 1, 1, 1, 1,
0.44138, 0.3038404, -0.2813963, 1, 1, 1, 1, 1,
0.442529, -0.09804986, 2.427606, 1, 1, 1, 1, 1,
0.4439711, -2.496378, 1.649615, 1, 1, 1, 1, 1,
0.4459376, 1.580886, 2.411458, 1, 1, 1, 1, 1,
0.449016, 0.2817321, 1.445881, 1, 1, 1, 1, 1,
0.4513266, 1.65916, 0.213026, 1, 1, 1, 1, 1,
0.4525016, -0.2915414, 2.167585, 1, 1, 1, 1, 1,
0.4530969, -0.9910108, 3.884475, 1, 1, 1, 1, 1,
0.4548006, 0.586157, 0.07090739, 1, 1, 1, 1, 1,
0.4553166, 0.401294, -0.06262073, 1, 1, 1, 1, 1,
0.4581309, 0.3828478, 2.040522, 1, 1, 1, 1, 1,
0.4593176, -1.078822, 2.51082, 1, 1, 1, 1, 1,
0.462225, 0.5478784, 1.82757, 1, 1, 1, 1, 1,
0.4682206, 0.8534706, 0.5019277, 1, 1, 1, 1, 1,
0.4715264, -1.561112, 1.847546, 0, 0, 1, 1, 1,
0.4720661, 0.6757002, 1.267976, 1, 0, 0, 1, 1,
0.4751101, 0.8206103, -1.434632, 1, 0, 0, 1, 1,
0.4755297, 0.04345705, 2.123556, 1, 0, 0, 1, 1,
0.4786157, 0.975013, -0.8289076, 1, 0, 0, 1, 1,
0.4903052, -0.3601226, 4.479639, 1, 0, 0, 1, 1,
0.4924697, 0.9130026, 1.20843, 0, 0, 0, 1, 1,
0.4932098, 1.110861, 1.501459, 0, 0, 0, 1, 1,
0.4934287, -1.283533, 2.690051, 0, 0, 0, 1, 1,
0.4948413, 1.481031, 0.4447447, 0, 0, 0, 1, 1,
0.4971885, 1.583639, 0.769907, 0, 0, 0, 1, 1,
0.4985524, -0.5725008, 2.425721, 0, 0, 0, 1, 1,
0.5027791, 0.2863815, 0.4612487, 0, 0, 0, 1, 1,
0.5105373, -1.136903, 3.871691, 1, 1, 1, 1, 1,
0.5122187, 0.2250148, 0.6853502, 1, 1, 1, 1, 1,
0.5126559, -0.4638369, 2.918418, 1, 1, 1, 1, 1,
0.5159097, -0.2596524, 0.4805396, 1, 1, 1, 1, 1,
0.5180578, 1.148553, 1.842486, 1, 1, 1, 1, 1,
0.519129, 0.8105044, 0.1821307, 1, 1, 1, 1, 1,
0.52035, -0.9480559, 3.241485, 1, 1, 1, 1, 1,
0.5214739, 0.002748624, 1.45784, 1, 1, 1, 1, 1,
0.5242943, -0.09110293, 1.71502, 1, 1, 1, 1, 1,
0.5250633, -1.120968, 2.842237, 1, 1, 1, 1, 1,
0.5270456, 0.6072494, 2.628976, 1, 1, 1, 1, 1,
0.5315596, 0.05780106, 1.509307, 1, 1, 1, 1, 1,
0.5360891, -0.8702495, 3.23672, 1, 1, 1, 1, 1,
0.5369841, -0.1211586, 1.694298, 1, 1, 1, 1, 1,
0.5376701, -0.02834538, 1.655161, 1, 1, 1, 1, 1,
0.5408997, -0.131851, 1.96107, 0, 0, 1, 1, 1,
0.5432435, -0.1175911, -0.04970282, 1, 0, 0, 1, 1,
0.5434916, -0.1651955, 1.103489, 1, 0, 0, 1, 1,
0.5444821, 0.8312128, 1.79441, 1, 0, 0, 1, 1,
0.5451825, -0.8400176, 2.619658, 1, 0, 0, 1, 1,
0.5453896, 0.05294408, 0.5076073, 1, 0, 0, 1, 1,
0.5495382, 0.3164665, 0.00836233, 0, 0, 0, 1, 1,
0.5504835, 2.044855, -0.9661055, 0, 0, 0, 1, 1,
0.5572337, -0.9828191, 0.8141981, 0, 0, 0, 1, 1,
0.5619066, -1.356029, 2.779457, 0, 0, 0, 1, 1,
0.5676941, 0.6305174, 2.077998, 0, 0, 0, 1, 1,
0.5759603, 0.5331814, -0.3476729, 0, 0, 0, 1, 1,
0.5782789, -0.7350814, 2.359416, 0, 0, 0, 1, 1,
0.5799409, -0.382795, 1.192256, 1, 1, 1, 1, 1,
0.5890571, 0.4631032, -0.4958706, 1, 1, 1, 1, 1,
0.5893332, 0.7411315, 0.3821985, 1, 1, 1, 1, 1,
0.5919474, 1.294754, -0.01083112, 1, 1, 1, 1, 1,
0.5919525, -0.5001046, 2.239233, 1, 1, 1, 1, 1,
0.595426, -1.080114, 1.847367, 1, 1, 1, 1, 1,
0.6038225, -0.6383895, 2.304804, 1, 1, 1, 1, 1,
0.6050701, 0.3325668, -0.2004161, 1, 1, 1, 1, 1,
0.6088493, 1.2633, 1.348032, 1, 1, 1, 1, 1,
0.6138503, 0.1993148, 2.109852, 1, 1, 1, 1, 1,
0.6158941, -1.837457, 2.417845, 1, 1, 1, 1, 1,
0.6170042, 2.159631, 0.8326743, 1, 1, 1, 1, 1,
0.6182787, -1.213158, 2.604603, 1, 1, 1, 1, 1,
0.6282863, 0.5952274, 0.1847316, 1, 1, 1, 1, 1,
0.6302589, 0.9086398, 0.8811295, 1, 1, 1, 1, 1,
0.6354734, -1.304957, 3.483058, 0, 0, 1, 1, 1,
0.6366479, 0.48373, 0.530346, 1, 0, 0, 1, 1,
0.6397558, -0.1866838, 2.056869, 1, 0, 0, 1, 1,
0.6400585, 1.404434, 0.6793071, 1, 0, 0, 1, 1,
0.6402146, -1.55198, 2.750388, 1, 0, 0, 1, 1,
0.6406497, -0.2808332, 1.618705, 1, 0, 0, 1, 1,
0.6434734, 0.1513807, 1.688235, 0, 0, 0, 1, 1,
0.6441285, 0.4394754, 2.208526, 0, 0, 0, 1, 1,
0.6444976, -0.2922191, 1.505716, 0, 0, 0, 1, 1,
0.6497664, 1.098378, 0.215551, 0, 0, 0, 1, 1,
0.6536613, 0.3236035, -0.2603852, 0, 0, 0, 1, 1,
0.6578514, -1.664973, 2.674754, 0, 0, 0, 1, 1,
0.6622183, -0.4943964, 2.712721, 0, 0, 0, 1, 1,
0.6679648, 0.3515431, -0.326694, 1, 1, 1, 1, 1,
0.6689126, 0.6259682, -0.3799862, 1, 1, 1, 1, 1,
0.6691238, -0.2112932, 3.013853, 1, 1, 1, 1, 1,
0.6702501, 1.062757, -0.9661473, 1, 1, 1, 1, 1,
0.6705275, 1.187879, 0.7658857, 1, 1, 1, 1, 1,
0.6738412, -0.1044798, 1.132124, 1, 1, 1, 1, 1,
0.6748093, 0.678452, -0.04071042, 1, 1, 1, 1, 1,
0.6762704, -1.013174, 4.19511, 1, 1, 1, 1, 1,
0.6790164, 0.244439, 1.410544, 1, 1, 1, 1, 1,
0.6798481, -1.214323, 2.093995, 1, 1, 1, 1, 1,
0.6801864, 0.6705398, 2.456355, 1, 1, 1, 1, 1,
0.6811928, 0.7246795, 0.8495405, 1, 1, 1, 1, 1,
0.6815273, 0.9137523, 0.6136926, 1, 1, 1, 1, 1,
0.6870825, 1.242502, -0.5838423, 1, 1, 1, 1, 1,
0.6887714, 0.1449089, 0.5238782, 1, 1, 1, 1, 1,
0.6907694, -1.038279, 2.979003, 0, 0, 1, 1, 1,
0.6921671, 0.4810346, 0.4713748, 1, 0, 0, 1, 1,
0.6923959, 1.937714, 0.3223479, 1, 0, 0, 1, 1,
0.6946138, 0.22116, 0.9783259, 1, 0, 0, 1, 1,
0.6995098, -0.4250168, 2.374763, 1, 0, 0, 1, 1,
0.7005588, 1.136633, -0.3714028, 1, 0, 0, 1, 1,
0.7023839, 0.2079341, 0.5592729, 0, 0, 0, 1, 1,
0.7035455, -0.3298273, 1.263018, 0, 0, 0, 1, 1,
0.7054967, -2.740752, 4.233722, 0, 0, 0, 1, 1,
0.7266324, 0.6862302, 1.328681, 0, 0, 0, 1, 1,
0.7347959, 1.810768, 0.02080438, 0, 0, 0, 1, 1,
0.7421016, -0.4836017, 2.33484, 0, 0, 0, 1, 1,
0.7447615, -0.7839865, 3.080746, 0, 0, 0, 1, 1,
0.7466804, -0.2303561, 1.670706, 1, 1, 1, 1, 1,
0.7518304, -0.956948, 2.536772, 1, 1, 1, 1, 1,
0.7519936, 0.1949854, 0.8790113, 1, 1, 1, 1, 1,
0.7521762, -0.8664582, 3.18812, 1, 1, 1, 1, 1,
0.7565376, 0.2302178, -0.02956537, 1, 1, 1, 1, 1,
0.7601628, -0.1000326, 2.18671, 1, 1, 1, 1, 1,
0.7653531, -0.4328258, 2.079345, 1, 1, 1, 1, 1,
0.7669838, -0.713988, 2.246222, 1, 1, 1, 1, 1,
0.7705343, 0.8951255, 0.6103096, 1, 1, 1, 1, 1,
0.7724483, 1.037923, 1.018786, 1, 1, 1, 1, 1,
0.7785664, -0.9797868, 2.257471, 1, 1, 1, 1, 1,
0.7794843, -0.2361189, 2.22324, 1, 1, 1, 1, 1,
0.785301, 1.635299, 1.065718, 1, 1, 1, 1, 1,
0.7891085, -0.9342767, 1.514389, 1, 1, 1, 1, 1,
0.7931094, 1.358423, -0.2601999, 1, 1, 1, 1, 1,
0.7946497, 0.5729666, -0.3116828, 0, 0, 1, 1, 1,
0.7963959, 1.433878, 1.339479, 1, 0, 0, 1, 1,
0.7988442, 0.6705659, 0.9238706, 1, 0, 0, 1, 1,
0.802089, -1.436671, 2.577853, 1, 0, 0, 1, 1,
0.8035255, -2.243294, 2.873325, 1, 0, 0, 1, 1,
0.8043597, -0.4059602, 2.823164, 1, 0, 0, 1, 1,
0.8088363, 0.3369699, 0.983867, 0, 0, 0, 1, 1,
0.812292, -0.2092661, 1.086034, 0, 0, 0, 1, 1,
0.8123957, 0.5152947, -0.03541794, 0, 0, 0, 1, 1,
0.8137396, 1.294485, 1.741316, 0, 0, 0, 1, 1,
0.8279695, 0.5513265, 1.224153, 0, 0, 0, 1, 1,
0.8414998, 0.4036411, -0.0152495, 0, 0, 0, 1, 1,
0.8445511, -0.7880906, 1.095537, 0, 0, 0, 1, 1,
0.8539311, -0.5775225, 3.886012, 1, 1, 1, 1, 1,
0.8571256, -0.1822345, 1.685009, 1, 1, 1, 1, 1,
0.858587, -0.5698401, 3.061354, 1, 1, 1, 1, 1,
0.8591393, 0.554015, 0.501829, 1, 1, 1, 1, 1,
0.8684785, 0.6154434, 0.1305725, 1, 1, 1, 1, 1,
0.8684889, -0.4837282, 2.398329, 1, 1, 1, 1, 1,
0.8691835, -0.7152272, 0.3992736, 1, 1, 1, 1, 1,
0.8719184, -0.3192782, 1.247033, 1, 1, 1, 1, 1,
0.8735133, -0.07671417, 2.380978, 1, 1, 1, 1, 1,
0.8748305, 1.049732, 0.5134598, 1, 1, 1, 1, 1,
0.8786522, -0.01105627, 1.293578, 1, 1, 1, 1, 1,
0.8794326, -1.090992, 2.456882, 1, 1, 1, 1, 1,
0.887202, 1.209418, 0.8584172, 1, 1, 1, 1, 1,
0.8891112, 0.1886581, 2.178998, 1, 1, 1, 1, 1,
0.8903236, 1.508663, -2.186447, 1, 1, 1, 1, 1,
0.8951721, 0.1377714, 0.8896652, 0, 0, 1, 1, 1,
0.8978879, -0.3424753, 2.198056, 1, 0, 0, 1, 1,
0.9021696, 1.12675, 1.930216, 1, 0, 0, 1, 1,
0.9072706, -0.6722424, 1.148657, 1, 0, 0, 1, 1,
0.9099534, 1.134035, 1.419091, 1, 0, 0, 1, 1,
0.9158341, 0.2734556, 1.041086, 1, 0, 0, 1, 1,
0.9170136, 0.8726184, 2.54268, 0, 0, 0, 1, 1,
0.9184557, 0.1099827, 1.667352, 0, 0, 0, 1, 1,
0.9241406, 0.4402299, -0.04724342, 0, 0, 0, 1, 1,
0.9246868, -0.024553, 3.563068, 0, 0, 0, 1, 1,
0.9302694, 0.513819, 1.82459, 0, 0, 0, 1, 1,
0.9335367, -0.2409245, 1.544974, 0, 0, 0, 1, 1,
0.9353111, -2.247713, 2.441884, 0, 0, 0, 1, 1,
0.9371969, 0.9411982, 1.393264, 1, 1, 1, 1, 1,
0.9436457, 1.093655, 0.8213766, 1, 1, 1, 1, 1,
0.9481844, -1.64865, 2.827196, 1, 1, 1, 1, 1,
0.948631, 1.571412, -0.9230791, 1, 1, 1, 1, 1,
0.954434, 0.6592664, -0.1072917, 1, 1, 1, 1, 1,
0.95584, -0.01707759, 1.755169, 1, 1, 1, 1, 1,
0.9597043, -0.1247547, 2.351147, 1, 1, 1, 1, 1,
0.9597564, -0.6714066, 2.10951, 1, 1, 1, 1, 1,
0.9701909, -0.3952282, 3.335366, 1, 1, 1, 1, 1,
0.9719038, 0.6757386, -0.2236589, 1, 1, 1, 1, 1,
0.979313, 0.225043, 1.28334, 1, 1, 1, 1, 1,
0.9793881, -0.4354443, 1.70549, 1, 1, 1, 1, 1,
0.9801722, 0.1623473, 2.167748, 1, 1, 1, 1, 1,
0.9813766, -0.2502802, 2.664044, 1, 1, 1, 1, 1,
0.9854031, 1.481604, 1.241437, 1, 1, 1, 1, 1,
0.9855736, -0.7124306, 3.239111, 0, 0, 1, 1, 1,
0.9864222, 0.9349664, -0.1595479, 1, 0, 0, 1, 1,
0.9904152, -1.220418, 3.188838, 1, 0, 0, 1, 1,
0.9914746, -0.4961711, 2.525636, 1, 0, 0, 1, 1,
0.9940692, -0.3730991, 2.23849, 1, 0, 0, 1, 1,
0.9970064, -1.791868, 4.187763, 1, 0, 0, 1, 1,
1.005069, -0.3934696, 1.722375, 0, 0, 0, 1, 1,
1.006502, -0.9254584, 1.969279, 0, 0, 0, 1, 1,
1.010282, 0.2731244, -0.4239921, 0, 0, 0, 1, 1,
1.011298, -0.9849294, 2.815935, 0, 0, 0, 1, 1,
1.013295, 0.505573, 0.808673, 0, 0, 0, 1, 1,
1.013948, 0.8279226, 1.79855, 0, 0, 0, 1, 1,
1.018374, -1.100493, 3.677963, 0, 0, 0, 1, 1,
1.018954, 0.1019554, 2.015831, 1, 1, 1, 1, 1,
1.024838, -0.1038953, 2.425184, 1, 1, 1, 1, 1,
1.027752, 1.168001, 0.4532078, 1, 1, 1, 1, 1,
1.030297, -0.3012734, 1.196507, 1, 1, 1, 1, 1,
1.038669, -2.79564, 1.808876, 1, 1, 1, 1, 1,
1.041445, 0.05278317, 1.700108, 1, 1, 1, 1, 1,
1.041706, -0.5336437, 2.837962, 1, 1, 1, 1, 1,
1.051688, -0.564886, 1.522816, 1, 1, 1, 1, 1,
1.053651, -0.7609811, 1.937133, 1, 1, 1, 1, 1,
1.054597, 0.1158893, 3.189377, 1, 1, 1, 1, 1,
1.065748, -1.446484, 1.556411, 1, 1, 1, 1, 1,
1.075107, 1.443258, 1.095455, 1, 1, 1, 1, 1,
1.080103, -0.1431538, 1.955173, 1, 1, 1, 1, 1,
1.089175, -0.1104143, 3.060615, 1, 1, 1, 1, 1,
1.094277, -0.3698297, 3.296499, 1, 1, 1, 1, 1,
1.0969, -0.4459871, 2.313585, 0, 0, 1, 1, 1,
1.119912, 0.9780433, 1.789446, 1, 0, 0, 1, 1,
1.124956, 1.077986, 2.143359, 1, 0, 0, 1, 1,
1.127519, -0.7582306, 2.599227, 1, 0, 0, 1, 1,
1.129974, 0.3951388, 0.07062113, 1, 0, 0, 1, 1,
1.137033, -0.8645749, -0.2358829, 1, 0, 0, 1, 1,
1.138578, 1.41444, -0.1146891, 0, 0, 0, 1, 1,
1.145289, -0.9821347, 2.385889, 0, 0, 0, 1, 1,
1.148308, 1.409326, 0.1817063, 0, 0, 0, 1, 1,
1.15105, -0.04388126, 2.14901, 0, 0, 0, 1, 1,
1.156119, 1.193467, 1.219586, 0, 0, 0, 1, 1,
1.169801, -0.8581625, 2.576997, 0, 0, 0, 1, 1,
1.170225, 0.06102818, 2.954144, 0, 0, 0, 1, 1,
1.172425, 0.4493231, 0.7520846, 1, 1, 1, 1, 1,
1.183267, 0.2023614, 2.76536, 1, 1, 1, 1, 1,
1.187195, -0.1538554, 2.622898, 1, 1, 1, 1, 1,
1.190348, -0.4586666, 1.864703, 1, 1, 1, 1, 1,
1.194594, 0.3544235, 1.004567, 1, 1, 1, 1, 1,
1.204826, 0.6715962, 1.869445, 1, 1, 1, 1, 1,
1.217543, 0.04177041, 2.691151, 1, 1, 1, 1, 1,
1.225081, 0.2723043, 1.237224, 1, 1, 1, 1, 1,
1.235995, 0.3572721, 3.03497, 1, 1, 1, 1, 1,
1.238533, 0.3566309, 1.662002, 1, 1, 1, 1, 1,
1.242501, 0.07430707, -0.006060024, 1, 1, 1, 1, 1,
1.243268, 0.2098857, 1.680338, 1, 1, 1, 1, 1,
1.251244, 0.8507364, 2.727942, 1, 1, 1, 1, 1,
1.254699, 0.1361112, 1.079517, 1, 1, 1, 1, 1,
1.257379, 0.8035437, 0.3644534, 1, 1, 1, 1, 1,
1.264701, 0.01749544, 0.304167, 0, 0, 1, 1, 1,
1.265619, 1.569575, -1.358753, 1, 0, 0, 1, 1,
1.268263, 0.5389835, 0.2800204, 1, 0, 0, 1, 1,
1.269114, 0.8170643, 0.09608435, 1, 0, 0, 1, 1,
1.270308, 0.6481479, 2.491339, 1, 0, 0, 1, 1,
1.286834, -0.9916014, 1.317894, 1, 0, 0, 1, 1,
1.286851, 1.934773, -0.1819874, 0, 0, 0, 1, 1,
1.290335, -1.576827, 2.348982, 0, 0, 0, 1, 1,
1.296095, -0.3393772, 2.209651, 0, 0, 0, 1, 1,
1.307733, -0.8695977, 1.029281, 0, 0, 0, 1, 1,
1.30838, -0.7891297, 3.144466, 0, 0, 0, 1, 1,
1.309441, 1.323644, 0.3664159, 0, 0, 0, 1, 1,
1.316474, -0.9902459, 2.120181, 0, 0, 0, 1, 1,
1.317788, -0.8487733, 2.199532, 1, 1, 1, 1, 1,
1.321831, -0.8309312, 1.790937, 1, 1, 1, 1, 1,
1.323603, 0.7290564, 1.456358, 1, 1, 1, 1, 1,
1.346216, -0.5555671, 2.016328, 1, 1, 1, 1, 1,
1.361213, -0.5058892, 2.053861, 1, 1, 1, 1, 1,
1.3652, -0.5148157, 2.95903, 1, 1, 1, 1, 1,
1.367887, -0.2963485, 2.584769, 1, 1, 1, 1, 1,
1.371949, 0.08575081, 1.616441, 1, 1, 1, 1, 1,
1.379763, -0.1730886, 2.817057, 1, 1, 1, 1, 1,
1.380704, -1.330727, 2.406512, 1, 1, 1, 1, 1,
1.398231, -0.5094199, 3.18262, 1, 1, 1, 1, 1,
1.399103, -1.285505, 4.016129, 1, 1, 1, 1, 1,
1.404986, 0.129098, 1.710239, 1, 1, 1, 1, 1,
1.411459, -1.102685, 2.086772, 1, 1, 1, 1, 1,
1.440011, 0.3932598, 2.43454, 1, 1, 1, 1, 1,
1.443042, 1.405212, 2.516328, 0, 0, 1, 1, 1,
1.444912, -1.046881, 2.800208, 1, 0, 0, 1, 1,
1.447685, 0.3425924, 0.4554176, 1, 0, 0, 1, 1,
1.45015, 0.9267026, 0.4796502, 1, 0, 0, 1, 1,
1.473824, 1.558799, -0.7016134, 1, 0, 0, 1, 1,
1.47804, -1.0743, 2.955821, 1, 0, 0, 1, 1,
1.481792, 1.984361, 2.15901, 0, 0, 0, 1, 1,
1.482911, 0.5991353, 0.4880728, 0, 0, 0, 1, 1,
1.49773, -1.02525, 0.3852418, 0, 0, 0, 1, 1,
1.521963, 0.8062695, -0.3491886, 0, 0, 0, 1, 1,
1.524782, 0.7333796, -0.133158, 0, 0, 0, 1, 1,
1.52482, -0.4168683, 1.47937, 0, 0, 0, 1, 1,
1.534105, -1.316591, 1.002838, 0, 0, 0, 1, 1,
1.545111, 1.397592, 0.2015814, 1, 1, 1, 1, 1,
1.55668, -0.08880331, 1.213914, 1, 1, 1, 1, 1,
1.560307, 0.8203629, 0.06510886, 1, 1, 1, 1, 1,
1.588129, -0.8048315, 1.984106, 1, 1, 1, 1, 1,
1.596503, 0.6436735, -0.759524, 1, 1, 1, 1, 1,
1.605694, -0.2271004, 0.8827505, 1, 1, 1, 1, 1,
1.609124, 1.170184, 1.431289, 1, 1, 1, 1, 1,
1.620113, 0.2915819, 2.453925, 1, 1, 1, 1, 1,
1.635435, 1.457861, 1.188652, 1, 1, 1, 1, 1,
1.636437, -0.1742641, 2.741739, 1, 1, 1, 1, 1,
1.639994, -1.055885, 3.542921, 1, 1, 1, 1, 1,
1.647986, 0.8728026, 0.9561356, 1, 1, 1, 1, 1,
1.648576, -1.66327, 3.094641, 1, 1, 1, 1, 1,
1.653633, -0.5577725, 0.9044554, 1, 1, 1, 1, 1,
1.656105, -0.7353032, 3.263975, 1, 1, 1, 1, 1,
1.657724, 2.126896, 2.014185, 0, 0, 1, 1, 1,
1.662986, 0.940921, 2.84866, 1, 0, 0, 1, 1,
1.663765, -1.69607, 2.802652, 1, 0, 0, 1, 1,
1.685437, -0.1040455, 1.589546, 1, 0, 0, 1, 1,
1.695183, -0.03839362, 1.949765, 1, 0, 0, 1, 1,
1.70275, 0.8653772, -0.1576123, 1, 0, 0, 1, 1,
1.70781, -0.3034327, 1.950799, 0, 0, 0, 1, 1,
1.707915, -0.4625884, 2.223017, 0, 0, 0, 1, 1,
1.714278, 0.5875803, 0.04294558, 0, 0, 0, 1, 1,
1.722895, 0.3868233, 2.662893, 0, 0, 0, 1, 1,
1.731557, 2.624611, -0.5892718, 0, 0, 0, 1, 1,
1.744327, -0.2941843, 2.794138, 0, 0, 0, 1, 1,
1.762369, 0.2018176, 0.05306705, 0, 0, 0, 1, 1,
1.770546, -0.1423967, 0.310073, 1, 1, 1, 1, 1,
1.774246, -1.467054, 2.120766, 1, 1, 1, 1, 1,
1.778097, 0.4844304, 1.163551, 1, 1, 1, 1, 1,
1.802758, 0.09208399, 0.9558863, 1, 1, 1, 1, 1,
1.806552, -1.360301, 2.089412, 1, 1, 1, 1, 1,
1.808065, -1.465099, 3.08727, 1, 1, 1, 1, 1,
1.831518, -0.6996474, 1.631847, 1, 1, 1, 1, 1,
1.852608, 1.977169, 1.126818, 1, 1, 1, 1, 1,
1.860634, 0.8286035, 0.04825093, 1, 1, 1, 1, 1,
1.880314, 0.7799578, 2.978513, 1, 1, 1, 1, 1,
1.886576, 1.051676, 1.582626, 1, 1, 1, 1, 1,
1.88786, -1.175245, 1.194601, 1, 1, 1, 1, 1,
1.934112, 0.1915064, 0.4811949, 1, 1, 1, 1, 1,
1.938542, 1.012075, 1.464517, 1, 1, 1, 1, 1,
1.94311, 0.5432826, 2.684445, 1, 1, 1, 1, 1,
1.947512, 1.255503, 1.708019, 0, 0, 1, 1, 1,
1.967403, 2.368059, 1.151483, 1, 0, 0, 1, 1,
1.992089, 0.2323659, -0.6295856, 1, 0, 0, 1, 1,
1.993462, 2.548248, 1.300546, 1, 0, 0, 1, 1,
2.001684, -0.2237446, 0.2673886, 1, 0, 0, 1, 1,
2.010444, 1.772141, 0.1012088, 1, 0, 0, 1, 1,
2.069119, -0.1602302, 0.3413543, 0, 0, 0, 1, 1,
2.075389, 2.243261, 1.199799, 0, 0, 0, 1, 1,
2.087617, -0.420471, 1.435183, 0, 0, 0, 1, 1,
2.094313, 0.5359519, -0.5335274, 0, 0, 0, 1, 1,
2.214409, -1.722559, 1.940292, 0, 0, 0, 1, 1,
2.298929, 0.5703226, 1.904574, 0, 0, 0, 1, 1,
2.324282, -0.3583319, 1.283164, 0, 0, 0, 1, 1,
2.328387, 0.7850561, 1.496038, 1, 1, 1, 1, 1,
2.519618, -0.4747819, 1.413937, 1, 1, 1, 1, 1,
2.640789, 0.3607031, 1.62939, 1, 1, 1, 1, 1,
2.724196, 0.7445235, 1.449207, 1, 1, 1, 1, 1,
2.73752, -0.7262606, 2.095728, 1, 1, 1, 1, 1,
2.776004, -1.012725, 3.004099, 1, 1, 1, 1, 1,
3.809893, -0.7943833, 3.018256, 1, 1, 1, 1, 1
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
var radius = 9.990116;
var distance = 35.08986;
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
mvMatrix.translate( -0.1797805, 0.3509383, 0.3294644 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.08986);
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
