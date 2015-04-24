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
-2.905854, 1.399599, -1.276844, 1, 0, 0, 1,
-2.891083, -1.089935, -1.283246, 1, 0.007843138, 0, 1,
-2.884229, 0.9207327, -2.258029, 1, 0.01176471, 0, 1,
-2.806135, 1.460542, 0.2750801, 1, 0.01960784, 0, 1,
-2.701396, -1.949267, -1.487105, 1, 0.02352941, 0, 1,
-2.650333, -1.146884, -1.221731, 1, 0.03137255, 0, 1,
-2.593098, -0.0471746, -1.084909, 1, 0.03529412, 0, 1,
-2.475263, -1.14823, -1.291736, 1, 0.04313726, 0, 1,
-2.401868, 0.4276455, -1.565943, 1, 0.04705882, 0, 1,
-2.353079, 1.287862, -1.023773, 1, 0.05490196, 0, 1,
-2.351703, -0.555554, -1.931219, 1, 0.05882353, 0, 1,
-2.278761, 0.7778972, -1.921458, 1, 0.06666667, 0, 1,
-2.216844, -0.5907791, -1.934522, 1, 0.07058824, 0, 1,
-2.215366, 0.3637198, -2.334121, 1, 0.07843138, 0, 1,
-2.155072, -0.5607821, -1.614906, 1, 0.08235294, 0, 1,
-2.105974, 0.9739345, 0.005341339, 1, 0.09019608, 0, 1,
-2.101266, -0.7564691, -2.160236, 1, 0.09411765, 0, 1,
-2.072382, 0.7681642, -2.941131, 1, 0.1019608, 0, 1,
-2.054149, -0.6421324, -2.153185, 1, 0.1098039, 0, 1,
-2.037178, 0.2056964, -1.479583, 1, 0.1137255, 0, 1,
-2.012155, -0.4157009, -1.701364, 1, 0.1215686, 0, 1,
-1.994414, -1.062856, -2.523964, 1, 0.1254902, 0, 1,
-1.987334, 1.398649, -1.956675, 1, 0.1333333, 0, 1,
-1.979273, 0.42435, -2.20445, 1, 0.1372549, 0, 1,
-1.963884, 0.8887208, 0.6839433, 1, 0.145098, 0, 1,
-1.96293, 0.02790776, -2.533407, 1, 0.1490196, 0, 1,
-1.94803, 0.1309071, -2.033422, 1, 0.1568628, 0, 1,
-1.94468, -0.6681595, -2.315319, 1, 0.1607843, 0, 1,
-1.913281, 0.3734065, -1.256139, 1, 0.1686275, 0, 1,
-1.909346, 0.8081065, -3.149196, 1, 0.172549, 0, 1,
-1.900297, 1.296856, -1.048894, 1, 0.1803922, 0, 1,
-1.877967, -0.3397913, -1.109661, 1, 0.1843137, 0, 1,
-1.860036, 0.1996443, -2.489288, 1, 0.1921569, 0, 1,
-1.856903, -1.324216, -3.815385, 1, 0.1960784, 0, 1,
-1.852968, -0.5643083, -1.592607, 1, 0.2039216, 0, 1,
-1.842658, 0.9736763, -0.8747476, 1, 0.2117647, 0, 1,
-1.839227, -1.700966, -3.136781, 1, 0.2156863, 0, 1,
-1.819514, -1.115797, -1.829389, 1, 0.2235294, 0, 1,
-1.805381, -0.7309144, -2.503738, 1, 0.227451, 0, 1,
-1.795193, 0.6768289, -0.08301275, 1, 0.2352941, 0, 1,
-1.768386, -0.09048502, -2.754704, 1, 0.2392157, 0, 1,
-1.762809, -1.130741, -2.377431, 1, 0.2470588, 0, 1,
-1.757335, -1.131902, -2.787773, 1, 0.2509804, 0, 1,
-1.754711, 1.45223, 0.618918, 1, 0.2588235, 0, 1,
-1.736759, 0.8264437, -0.426075, 1, 0.2627451, 0, 1,
-1.736006, -1.332279, -3.106326, 1, 0.2705882, 0, 1,
-1.73291, 1.22486, -1.143594, 1, 0.2745098, 0, 1,
-1.732354, 0.1041373, -1.488422, 1, 0.282353, 0, 1,
-1.711148, 0.3295472, -1.316864, 1, 0.2862745, 0, 1,
-1.705496, 0.9229255, 0.8294221, 1, 0.2941177, 0, 1,
-1.699874, 1.330331, -1.351589, 1, 0.3019608, 0, 1,
-1.664996, 1.374139, -2.747682, 1, 0.3058824, 0, 1,
-1.648009, 1.323685, -0.2593972, 1, 0.3137255, 0, 1,
-1.647112, -0.3729918, -1.167987, 1, 0.3176471, 0, 1,
-1.646571, 0.08117587, -1.851686, 1, 0.3254902, 0, 1,
-1.635191, -0.7340705, -1.592792, 1, 0.3294118, 0, 1,
-1.633286, 0.2672663, -1.497818, 1, 0.3372549, 0, 1,
-1.629117, 0.7036746, -2.784687, 1, 0.3411765, 0, 1,
-1.625305, -1.447974, -1.612342, 1, 0.3490196, 0, 1,
-1.612848, 0.308544, -0.820952, 1, 0.3529412, 0, 1,
-1.610038, 0.2222846, -0.774911, 1, 0.3607843, 0, 1,
-1.604858, -2.611555, -2.121634, 1, 0.3647059, 0, 1,
-1.600131, 1.308555, -0.6661731, 1, 0.372549, 0, 1,
-1.599659, -0.1474635, -1.296346, 1, 0.3764706, 0, 1,
-1.598223, -0.2489465, -3.312116, 1, 0.3843137, 0, 1,
-1.598199, 1.566048, 1.108384, 1, 0.3882353, 0, 1,
-1.595097, -0.8171745, -0.7112194, 1, 0.3960784, 0, 1,
-1.590203, 0.6043381, -2.280397, 1, 0.4039216, 0, 1,
-1.537423, -0.3302238, -1.266964, 1, 0.4078431, 0, 1,
-1.533946, -0.5865853, -1.897768, 1, 0.4156863, 0, 1,
-1.526219, 0.5284564, -1.690039, 1, 0.4196078, 0, 1,
-1.497849, -0.6329852, -2.853324, 1, 0.427451, 0, 1,
-1.49198, -0.9608258, -1.983375, 1, 0.4313726, 0, 1,
-1.483754, -0.3940387, -2.922157, 1, 0.4392157, 0, 1,
-1.481526, 0.5582605, 0.2648188, 1, 0.4431373, 0, 1,
-1.47695, -0.1288504, -0.1973252, 1, 0.4509804, 0, 1,
-1.46515, -1.255356, -0.3742875, 1, 0.454902, 0, 1,
-1.460865, -0.4283925, -2.48316, 1, 0.4627451, 0, 1,
-1.456869, 1.263178, -1.396154, 1, 0.4666667, 0, 1,
-1.438672, 0.3697608, -1.104001, 1, 0.4745098, 0, 1,
-1.437127, 0.6412659, 0.7730862, 1, 0.4784314, 0, 1,
-1.434905, 1.304317, 0.1832284, 1, 0.4862745, 0, 1,
-1.426703, 1.105104, -2.038818, 1, 0.4901961, 0, 1,
-1.424839, 1.988632, -0.9386966, 1, 0.4980392, 0, 1,
-1.424749, 0.3079186, -2.801284, 1, 0.5058824, 0, 1,
-1.42289, -0.7743759, -2.147745, 1, 0.509804, 0, 1,
-1.412569, 0.01708726, -1.465369, 1, 0.5176471, 0, 1,
-1.39645, -0.9840511, -1.500373, 1, 0.5215687, 0, 1,
-1.394446, 1.235872, -1.258449, 1, 0.5294118, 0, 1,
-1.384159, -1.981917, -2.009533, 1, 0.5333334, 0, 1,
-1.367877, -1.65374, -2.914189, 1, 0.5411765, 0, 1,
-1.366719, 0.2204316, -2.139198, 1, 0.5450981, 0, 1,
-1.364078, -0.502254, -2.251345, 1, 0.5529412, 0, 1,
-1.360222, 1.760588, -0.5303477, 1, 0.5568628, 0, 1,
-1.356523, 0.04230191, -1.152579, 1, 0.5647059, 0, 1,
-1.340481, -1.583892, -3.948033, 1, 0.5686275, 0, 1,
-1.338756, 0.9907817, -1.59337, 1, 0.5764706, 0, 1,
-1.334218, -1.513362, -3.027456, 1, 0.5803922, 0, 1,
-1.333039, 0.5840862, 0.4634594, 1, 0.5882353, 0, 1,
-1.327619, -0.3066097, -2.608415, 1, 0.5921569, 0, 1,
-1.322948, -0.9094561, -3.790655, 1, 0.6, 0, 1,
-1.322809, 1.552748, 0.3669276, 1, 0.6078432, 0, 1,
-1.32225, 0.2675558, -1.980461, 1, 0.6117647, 0, 1,
-1.320235, 0.3440147, -1.631841, 1, 0.6196079, 0, 1,
-1.309425, -0.374722, -1.67668, 1, 0.6235294, 0, 1,
-1.304869, 0.5939411, -2.391373, 1, 0.6313726, 0, 1,
-1.297482, 0.4158097, -0.6985725, 1, 0.6352941, 0, 1,
-1.297108, -1.252473, -1.443055, 1, 0.6431373, 0, 1,
-1.293416, 1.531504, -0.2893482, 1, 0.6470588, 0, 1,
-1.288487, 0.8953007, -1.916862, 1, 0.654902, 0, 1,
-1.287056, 0.2903315, -0.1698339, 1, 0.6588235, 0, 1,
-1.284512, 0.1724162, 0.8396291, 1, 0.6666667, 0, 1,
-1.278656, 0.6466393, -1.534478, 1, 0.6705883, 0, 1,
-1.270934, 2.027181, -1.908399, 1, 0.6784314, 0, 1,
-1.268416, -0.280885, -1.176778, 1, 0.682353, 0, 1,
-1.266071, -0.2149274, -0.7603447, 1, 0.6901961, 0, 1,
-1.249819, -0.6525258, -2.196066, 1, 0.6941177, 0, 1,
-1.233049, -1.173285, -2.460718, 1, 0.7019608, 0, 1,
-1.23016, 1.218933, -1.26867, 1, 0.7098039, 0, 1,
-1.227703, -0.8665603, -1.906954, 1, 0.7137255, 0, 1,
-1.227615, -0.5225732, -0.7101543, 1, 0.7215686, 0, 1,
-1.222783, -0.3559981, -1.103407, 1, 0.7254902, 0, 1,
-1.205268, -0.3455418, -2.568769, 1, 0.7333333, 0, 1,
-1.201491, -0.4018398, -1.45649, 1, 0.7372549, 0, 1,
-1.199969, -0.1101321, -0.1892238, 1, 0.7450981, 0, 1,
-1.198778, -0.1326084, -1.454939, 1, 0.7490196, 0, 1,
-1.196893, 0.4673482, -2.331114, 1, 0.7568628, 0, 1,
-1.194503, -0.994782, -1.37788, 1, 0.7607843, 0, 1,
-1.192311, -2.690061, -5.682139, 1, 0.7686275, 0, 1,
-1.190376, 1.541464, -1.18013, 1, 0.772549, 0, 1,
-1.180672, 1.495847, -0.7675306, 1, 0.7803922, 0, 1,
-1.164405, -0.4248594, -1.430105, 1, 0.7843137, 0, 1,
-1.158263, -2.884494, -2.538534, 1, 0.7921569, 0, 1,
-1.152994, -0.3549298, -1.211621, 1, 0.7960784, 0, 1,
-1.15208, -0.4417406, -1.718504, 1, 0.8039216, 0, 1,
-1.147786, -0.005015093, -1.001904, 1, 0.8117647, 0, 1,
-1.143156, 0.3305508, -2.399947, 1, 0.8156863, 0, 1,
-1.140632, -1.962478, -2.450102, 1, 0.8235294, 0, 1,
-1.137411, -2.420206, -2.975757, 1, 0.827451, 0, 1,
-1.131985, -0.2400514, -2.204434, 1, 0.8352941, 0, 1,
-1.126122, 0.07179897, -1.232817, 1, 0.8392157, 0, 1,
-1.124696, 0.04421664, -1.957549, 1, 0.8470588, 0, 1,
-1.117959, 1.638921, -1.194898, 1, 0.8509804, 0, 1,
-1.116872, -0.2719762, -1.727606, 1, 0.8588235, 0, 1,
-1.114616, 1.195625, 0.1239833, 1, 0.8627451, 0, 1,
-1.098589, 0.4034238, -1.941892, 1, 0.8705882, 0, 1,
-1.097929, 0.0443619, -0.3930965, 1, 0.8745098, 0, 1,
-1.081481, 0.4761457, 0.03016475, 1, 0.8823529, 0, 1,
-1.068898, -1.154715, -2.114344, 1, 0.8862745, 0, 1,
-1.054155, 0.03315728, -0.1415348, 1, 0.8941177, 0, 1,
-1.050134, 0.2333298, -2.05021, 1, 0.8980392, 0, 1,
-1.04958, 1.090375, -0.1209716, 1, 0.9058824, 0, 1,
-1.047729, 1.077231, -2.560064, 1, 0.9137255, 0, 1,
-1.044238, -1.213698, -2.893746, 1, 0.9176471, 0, 1,
-1.04066, -0.6512833, -3.64067, 1, 0.9254902, 0, 1,
-1.035159, -0.3181289, -1.763961, 1, 0.9294118, 0, 1,
-1.034708, -0.7263917, -2.614713, 1, 0.9372549, 0, 1,
-1.033555, 0.02660332, -0.4772241, 1, 0.9411765, 0, 1,
-1.022732, -0.2216177, -0.4411392, 1, 0.9490196, 0, 1,
-1.015447, 1.149594, -0.6966025, 1, 0.9529412, 0, 1,
-1.014019, 1.317474, -2.283005, 1, 0.9607843, 0, 1,
-1.00717, -0.3055418, -1.488893, 1, 0.9647059, 0, 1,
-1.003199, 1.614481, -0.4231141, 1, 0.972549, 0, 1,
-0.9990884, -1.250789, -0.3783201, 1, 0.9764706, 0, 1,
-0.9973809, -0.8007703, -3.631244, 1, 0.9843137, 0, 1,
-0.9942555, -0.4465913, -1.481162, 1, 0.9882353, 0, 1,
-0.9938029, -1.455932, -5.218373, 1, 0.9960784, 0, 1,
-0.9935417, -0.6352902, -3.063812, 0.9960784, 1, 0, 1,
-0.9824848, -1.345112, -2.869515, 0.9921569, 1, 0, 1,
-0.9793856, 1.293404, -0.09084961, 0.9843137, 1, 0, 1,
-0.9791654, 0.5012094, -1.741332, 0.9803922, 1, 0, 1,
-0.973448, -0.9706671, -3.112869, 0.972549, 1, 0, 1,
-0.961566, -0.02774267, -1.164401, 0.9686275, 1, 0, 1,
-0.9599302, -1.612738, -2.602362, 0.9607843, 1, 0, 1,
-0.9565356, -0.08178509, -2.098945, 0.9568627, 1, 0, 1,
-0.954314, -0.1239276, -1.648714, 0.9490196, 1, 0, 1,
-0.9522185, 0.1317143, -1.742905, 0.945098, 1, 0, 1,
-0.939737, 0.9106547, -0.02887244, 0.9372549, 1, 0, 1,
-0.9383369, -0.6401806, -2.492693, 0.9333333, 1, 0, 1,
-0.9338249, 1.051484, -0.7184888, 0.9254902, 1, 0, 1,
-0.9248419, -0.8203577, -1.992414, 0.9215686, 1, 0, 1,
-0.9218661, -0.3544229, -1.825984, 0.9137255, 1, 0, 1,
-0.9218181, 0.2964828, 0.1092275, 0.9098039, 1, 0, 1,
-0.9189448, -1.487242, -2.446074, 0.9019608, 1, 0, 1,
-0.9147184, 1.69246, -1.03341, 0.8941177, 1, 0, 1,
-0.8966408, -0.476048, -3.271554, 0.8901961, 1, 0, 1,
-0.8911303, 0.1364679, -1.762536, 0.8823529, 1, 0, 1,
-0.8883631, -1.354542, -0.9364177, 0.8784314, 1, 0, 1,
-0.8880742, 0.1956156, -1.403199, 0.8705882, 1, 0, 1,
-0.8745156, -1.84702, -3.039975, 0.8666667, 1, 0, 1,
-0.8712528, 0.6224729, 0.1089516, 0.8588235, 1, 0, 1,
-0.8572885, 0.3494982, -0.756312, 0.854902, 1, 0, 1,
-0.8525705, -1.819558, -3.108014, 0.8470588, 1, 0, 1,
-0.8517999, 2.678556, -0.1437923, 0.8431373, 1, 0, 1,
-0.8449206, 0.1200905, -1.959633, 0.8352941, 1, 0, 1,
-0.8282367, -0.2421069, -2.933536, 0.8313726, 1, 0, 1,
-0.8252958, 2.048187, 0.2540381, 0.8235294, 1, 0, 1,
-0.8242343, -0.5200837, -1.813157, 0.8196079, 1, 0, 1,
-0.8190315, -0.0975219, -0.9539718, 0.8117647, 1, 0, 1,
-0.8159612, -0.9538336, -2.215165, 0.8078431, 1, 0, 1,
-0.8154946, 1.258766, -0.4058489, 0.8, 1, 0, 1,
-0.8148222, -0.855646, -2.48042, 0.7921569, 1, 0, 1,
-0.8082241, -0.4341245, -0.3153783, 0.7882353, 1, 0, 1,
-0.8021348, -0.1467501, -2.060447, 0.7803922, 1, 0, 1,
-0.8012151, 0.008480914, -1.521145, 0.7764706, 1, 0, 1,
-0.7923268, -0.4001582, -3.015369, 0.7686275, 1, 0, 1,
-0.7807984, -0.4678327, -4.150557, 0.7647059, 1, 0, 1,
-0.7770699, 0.06169768, -2.080098, 0.7568628, 1, 0, 1,
-0.7768942, 0.06772173, -3.828807, 0.7529412, 1, 0, 1,
-0.7728941, -0.80497, -4.661735, 0.7450981, 1, 0, 1,
-0.7716885, -0.6798747, -2.767958, 0.7411765, 1, 0, 1,
-0.7657948, -0.02308911, -1.379543, 0.7333333, 1, 0, 1,
-0.7652981, 0.8161101, -1.793624, 0.7294118, 1, 0, 1,
-0.7599456, -0.03196825, -1.925905, 0.7215686, 1, 0, 1,
-0.758534, 0.4955611, -0.834792, 0.7176471, 1, 0, 1,
-0.7578782, 0.8507875, -0.260245, 0.7098039, 1, 0, 1,
-0.7494342, 1.106757, -1.639964, 0.7058824, 1, 0, 1,
-0.7468532, -0.713266, -3.43023, 0.6980392, 1, 0, 1,
-0.7462847, 2.178778, 0.5953424, 0.6901961, 1, 0, 1,
-0.7450976, -0.3791467, -2.345647, 0.6862745, 1, 0, 1,
-0.7385703, 0.715949, 0.7330807, 0.6784314, 1, 0, 1,
-0.7265046, 0.02054498, -1.802834, 0.6745098, 1, 0, 1,
-0.7250004, 0.7502964, -1.378076, 0.6666667, 1, 0, 1,
-0.7241855, 0.6865472, -0.2990099, 0.6627451, 1, 0, 1,
-0.7220961, -0.1320096, -3.582497, 0.654902, 1, 0, 1,
-0.7168679, 0.6567803, 0.4801834, 0.6509804, 1, 0, 1,
-0.7118812, -0.3363748, -0.8099949, 0.6431373, 1, 0, 1,
-0.71071, 1.375095, -0.8257418, 0.6392157, 1, 0, 1,
-0.7085689, -1.270699, -3.625505, 0.6313726, 1, 0, 1,
-0.7080498, 0.7176691, -0.4384226, 0.627451, 1, 0, 1,
-0.7076011, 1.349931, -0.8697457, 0.6196079, 1, 0, 1,
-0.7038879, -0.7168947, -1.517955, 0.6156863, 1, 0, 1,
-0.7002678, 1.676095, -0.4243301, 0.6078432, 1, 0, 1,
-0.6932444, 1.174669, 0.3186374, 0.6039216, 1, 0, 1,
-0.6922143, -2.3433, -3.269275, 0.5960785, 1, 0, 1,
-0.6920635, 2.145727, -0.9003559, 0.5882353, 1, 0, 1,
-0.6879255, -0.7956599, -3.412259, 0.5843138, 1, 0, 1,
-0.6833319, 0.3556929, -3.086897, 0.5764706, 1, 0, 1,
-0.6788151, 1.424744, -0.2280521, 0.572549, 1, 0, 1,
-0.6776577, 1.073753, -0.466593, 0.5647059, 1, 0, 1,
-0.6753725, -0.5972991, -1.561359, 0.5607843, 1, 0, 1,
-0.6672097, 0.5198987, -1.972316, 0.5529412, 1, 0, 1,
-0.6633586, -0.8551472, -1.356224, 0.5490196, 1, 0, 1,
-0.6600338, 2.318805, 0.005659442, 0.5411765, 1, 0, 1,
-0.6551862, -0.5231209, -1.598561, 0.5372549, 1, 0, 1,
-0.6527727, 0.7405195, -1.062002, 0.5294118, 1, 0, 1,
-0.6508583, 0.09993082, -1.759933, 0.5254902, 1, 0, 1,
-0.6483999, -1.755435, -2.735128, 0.5176471, 1, 0, 1,
-0.6454188, 0.7825338, -1.065385, 0.5137255, 1, 0, 1,
-0.6443573, 0.03225029, -1.765275, 0.5058824, 1, 0, 1,
-0.6442938, -1.212569, -2.932829, 0.5019608, 1, 0, 1,
-0.6367415, -0.5333243, -2.815284, 0.4941176, 1, 0, 1,
-0.6317006, 0.09302958, -0.1745956, 0.4862745, 1, 0, 1,
-0.6297486, 0.6686456, -0.4567793, 0.4823529, 1, 0, 1,
-0.6276406, 0.0743523, 0.1303914, 0.4745098, 1, 0, 1,
-0.625858, 1.078976, -1.276134, 0.4705882, 1, 0, 1,
-0.6249674, 0.3543869, -1.177893, 0.4627451, 1, 0, 1,
-0.6241173, -0.0670817, -1.602602, 0.4588235, 1, 0, 1,
-0.6204544, -0.335533, -1.329087, 0.4509804, 1, 0, 1,
-0.6165586, 0.03800317, -2.295398, 0.4470588, 1, 0, 1,
-0.6163472, 1.437365, -0.06798785, 0.4392157, 1, 0, 1,
-0.6159703, -1.376823, -3.108901, 0.4352941, 1, 0, 1,
-0.6143691, 0.02630462, -1.58803, 0.427451, 1, 0, 1,
-0.6127747, 1.244245, 0.484158, 0.4235294, 1, 0, 1,
-0.6091282, -0.9164266, -4.046612, 0.4156863, 1, 0, 1,
-0.6056432, -0.2461242, -2.812659, 0.4117647, 1, 0, 1,
-0.6037796, -1.269877, -1.5729, 0.4039216, 1, 0, 1,
-0.5983206, 0.3003555, -1.301144, 0.3960784, 1, 0, 1,
-0.5980728, 1.607738, 0.189802, 0.3921569, 1, 0, 1,
-0.5951149, -1.697144, -3.854945, 0.3843137, 1, 0, 1,
-0.5905786, 0.5209376, -2.53195, 0.3803922, 1, 0, 1,
-0.588703, -0.4541021, -2.361058, 0.372549, 1, 0, 1,
-0.5879302, -0.3350933, -2.991949, 0.3686275, 1, 0, 1,
-0.5848464, -1.757357, -4.859824, 0.3607843, 1, 0, 1,
-0.5821467, -1.250489, -3.472143, 0.3568628, 1, 0, 1,
-0.5816556, -0.4469266, -1.55104, 0.3490196, 1, 0, 1,
-0.5807112, -0.1711195, -1.937205, 0.345098, 1, 0, 1,
-0.5802028, -1.506963, -2.819561, 0.3372549, 1, 0, 1,
-0.5742071, -0.3315253, -2.237983, 0.3333333, 1, 0, 1,
-0.5718524, 0.7711895, -0.7692412, 0.3254902, 1, 0, 1,
-0.5716739, 1.000164, -0.849411, 0.3215686, 1, 0, 1,
-0.5708482, 0.8516196, -1.468111, 0.3137255, 1, 0, 1,
-0.5680631, 1.203099, 0.8176343, 0.3098039, 1, 0, 1,
-0.5657658, 0.9530286, -1.050128, 0.3019608, 1, 0, 1,
-0.5613709, 0.4685102, -0.9552225, 0.2941177, 1, 0, 1,
-0.5601877, 1.055649, -0.383272, 0.2901961, 1, 0, 1,
-0.5597515, 0.794189, 0.6389676, 0.282353, 1, 0, 1,
-0.5568174, 2.038305, 1.581487, 0.2784314, 1, 0, 1,
-0.5567414, 1.404786, -1.335421, 0.2705882, 1, 0, 1,
-0.5523868, -0.8261516, -2.23756, 0.2666667, 1, 0, 1,
-0.5488556, 1.494144, 0.6006422, 0.2588235, 1, 0, 1,
-0.5466505, 0.3797739, -1.365828, 0.254902, 1, 0, 1,
-0.5447317, -0.02700291, -0.9630258, 0.2470588, 1, 0, 1,
-0.5296083, -0.3312919, -1.154548, 0.2431373, 1, 0, 1,
-0.5193816, 0.2562358, -1.858971, 0.2352941, 1, 0, 1,
-0.5168299, -0.2850658, -1.72963, 0.2313726, 1, 0, 1,
-0.5119365, -0.4513436, -1.555279, 0.2235294, 1, 0, 1,
-0.511236, 0.993973, -0.3009743, 0.2196078, 1, 0, 1,
-0.5106267, 0.06411348, -0.891547, 0.2117647, 1, 0, 1,
-0.5077863, 1.529106, -0.8387468, 0.2078431, 1, 0, 1,
-0.5071103, -0.3483839, -1.99153, 0.2, 1, 0, 1,
-0.5000358, 0.9464929, 0.455755, 0.1921569, 1, 0, 1,
-0.4978605, 1.737355, -0.9853898, 0.1882353, 1, 0, 1,
-0.4945151, -0.3948214, -1.670286, 0.1803922, 1, 0, 1,
-0.4867426, -0.5386934, -2.846262, 0.1764706, 1, 0, 1,
-0.4850689, -0.1853452, -1.24468, 0.1686275, 1, 0, 1,
-0.4828045, -1.09423, -1.620272, 0.1647059, 1, 0, 1,
-0.4821635, -0.2292496, -0.945689, 0.1568628, 1, 0, 1,
-0.4804823, -0.7890674, -3.584644, 0.1529412, 1, 0, 1,
-0.4796897, -1.024127, -3.038138, 0.145098, 1, 0, 1,
-0.4781407, -0.779828, -1.74716, 0.1411765, 1, 0, 1,
-0.477935, -1.348843, -2.196663, 0.1333333, 1, 0, 1,
-0.4724239, -1.102071, -2.594295, 0.1294118, 1, 0, 1,
-0.4687249, -0.4443928, -0.6860116, 0.1215686, 1, 0, 1,
-0.4680172, -0.9244033, -1.763228, 0.1176471, 1, 0, 1,
-0.467913, 0.8103088, -2.714981, 0.1098039, 1, 0, 1,
-0.4678015, 0.01072055, -1.145906, 0.1058824, 1, 0, 1,
-0.4647232, 1.465898, -0.240669, 0.09803922, 1, 0, 1,
-0.458873, -1.28428, -2.995907, 0.09019608, 1, 0, 1,
-0.4570543, 0.5441006, -1.114805, 0.08627451, 1, 0, 1,
-0.456008, -0.7748469, -5.033266, 0.07843138, 1, 0, 1,
-0.4559138, -0.2986211, -4.956555, 0.07450981, 1, 0, 1,
-0.4559124, -0.4746086, -4.579994, 0.06666667, 1, 0, 1,
-0.4551771, 0.8449426, -2.059653, 0.0627451, 1, 0, 1,
-0.4531193, 0.5545121, -1.524396, 0.05490196, 1, 0, 1,
-0.4492897, -1.892788, -3.018347, 0.05098039, 1, 0, 1,
-0.4421484, -1.123914, -2.504721, 0.04313726, 1, 0, 1,
-0.4367475, -0.2839861, -1.239338, 0.03921569, 1, 0, 1,
-0.4341195, -0.9762048, -5.198029, 0.03137255, 1, 0, 1,
-0.43363, -1.658142, -3.771727, 0.02745098, 1, 0, 1,
-0.4330068, -0.6937597, -3.89118, 0.01960784, 1, 0, 1,
-0.4319784, -0.4541423, -1.065649, 0.01568628, 1, 0, 1,
-0.4316096, 0.3935701, -1.670851, 0.007843138, 1, 0, 1,
-0.431493, -0.709904, -1.25877, 0.003921569, 1, 0, 1,
-0.4308274, -0.9836037, -3.583248, 0, 1, 0.003921569, 1,
-0.4295784, 0.837375, -2.444893, 0, 1, 0.01176471, 1,
-0.4281645, 0.6323631, -1.225565, 0, 1, 0.01568628, 1,
-0.427153, -1.302991, -2.68631, 0, 1, 0.02352941, 1,
-0.4263584, 1.050949, 0.04764242, 0, 1, 0.02745098, 1,
-0.4239657, -0.8423803, -3.623131, 0, 1, 0.03529412, 1,
-0.4215105, 0.5549051, -1.344995, 0, 1, 0.03921569, 1,
-0.4211949, -0.6393058, -2.024262, 0, 1, 0.04705882, 1,
-0.4195569, 1.277395, 0.4908629, 0, 1, 0.05098039, 1,
-0.4121093, -0.5469348, -2.58374, 0, 1, 0.05882353, 1,
-0.4108405, -0.5485398, -1.508925, 0, 1, 0.0627451, 1,
-0.408257, 0.3009315, -2.005298, 0, 1, 0.07058824, 1,
-0.4072487, -0.150412, -2.455035, 0, 1, 0.07450981, 1,
-0.4059623, 0.752459, -1.435385, 0, 1, 0.08235294, 1,
-0.4027564, -1.031874, -3.13137, 0, 1, 0.08627451, 1,
-0.3943891, -0.9058378, -1.557828, 0, 1, 0.09411765, 1,
-0.3906519, -1.008114, -1.632004, 0, 1, 0.1019608, 1,
-0.3906055, -1.934576, -1.864374, 0, 1, 0.1058824, 1,
-0.3819109, -0.3019344, -2.233138, 0, 1, 0.1137255, 1,
-0.3818992, -0.2450077, -1.640092, 0, 1, 0.1176471, 1,
-0.3754234, -0.8647144, -2.02124, 0, 1, 0.1254902, 1,
-0.374466, 0.9128259, -0.7067534, 0, 1, 0.1294118, 1,
-0.3742004, 1.807279, -0.6727039, 0, 1, 0.1372549, 1,
-0.3724263, -0.6327035, -3.441726, 0, 1, 0.1411765, 1,
-0.3699106, -0.7011703, -0.8226371, 0, 1, 0.1490196, 1,
-0.3669813, 0.1708984, -1.807282, 0, 1, 0.1529412, 1,
-0.3669457, 0.3920929, -0.7950742, 0, 1, 0.1607843, 1,
-0.3583212, -0.3220462, -1.519483, 0, 1, 0.1647059, 1,
-0.357747, -1.028461, -1.441837, 0, 1, 0.172549, 1,
-0.3567778, 1.477966, -1.191659, 0, 1, 0.1764706, 1,
-0.3526916, 0.4298054, -0.889191, 0, 1, 0.1843137, 1,
-0.3525875, -0.1952638, -2.462907, 0, 1, 0.1882353, 1,
-0.3524555, 0.9806744, -0.2505325, 0, 1, 0.1960784, 1,
-0.3506803, -0.2087345, -1.941797, 0, 1, 0.2039216, 1,
-0.3505573, 1.028253, -1.165438, 0, 1, 0.2078431, 1,
-0.3472036, 0.5878833, -2.04069, 0, 1, 0.2156863, 1,
-0.3417887, 0.1354753, -1.373971, 0, 1, 0.2196078, 1,
-0.3410651, 0.02991843, -2.413969, 0, 1, 0.227451, 1,
-0.3351412, 0.00449377, -2.945231, 0, 1, 0.2313726, 1,
-0.3348833, 0.4116185, -2.457653, 0, 1, 0.2392157, 1,
-0.3343872, 0.2097388, -1.720286, 0, 1, 0.2431373, 1,
-0.3341534, -0.9231687, -1.621387, 0, 1, 0.2509804, 1,
-0.3335353, -0.5809165, -3.805732, 0, 1, 0.254902, 1,
-0.3288658, 0.3807587, -2.233998, 0, 1, 0.2627451, 1,
-0.326613, -0.4026807, -2.367525, 0, 1, 0.2666667, 1,
-0.3226771, 0.5854421, -1.20632, 0, 1, 0.2745098, 1,
-0.3219296, -0.3087606, -1.781348, 0, 1, 0.2784314, 1,
-0.3201671, -0.2485807, 0.7828956, 0, 1, 0.2862745, 1,
-0.3097855, 1.051975, 1.090253, 0, 1, 0.2901961, 1,
-0.3092469, 0.2289901, -1.161115, 0, 1, 0.2980392, 1,
-0.3076059, 0.5661824, -2.00657, 0, 1, 0.3058824, 1,
-0.2998274, 0.4500977, -0.7525856, 0, 1, 0.3098039, 1,
-0.2970484, 0.7000618, -0.1009622, 0, 1, 0.3176471, 1,
-0.2907797, 0.2146971, -0.6270666, 0, 1, 0.3215686, 1,
-0.2854463, 1.187868, -1.117641, 0, 1, 0.3294118, 1,
-0.2843217, -0.1037789, -1.060832, 0, 1, 0.3333333, 1,
-0.2810458, 0.03029672, -1.668179, 0, 1, 0.3411765, 1,
-0.2794564, 0.6760477, -0.3962687, 0, 1, 0.345098, 1,
-0.2727852, 0.7811424, 0.4329466, 0, 1, 0.3529412, 1,
-0.27176, -1.363529, -4.318569, 0, 1, 0.3568628, 1,
-0.2680331, -2.431314, -3.225366, 0, 1, 0.3647059, 1,
-0.2644572, 0.2167965, -0.6138082, 0, 1, 0.3686275, 1,
-0.2614137, 0.1970776, -1.115001, 0, 1, 0.3764706, 1,
-0.2583871, 0.2529896, -2.002407, 0, 1, 0.3803922, 1,
-0.2577729, 0.1659557, -0.3785316, 0, 1, 0.3882353, 1,
-0.2492276, 0.8839087, -0.4668465, 0, 1, 0.3921569, 1,
-0.2488789, -0.7639682, -1.621518, 0, 1, 0.4, 1,
-0.2479866, 1.317476, -0.2733102, 0, 1, 0.4078431, 1,
-0.2417026, -0.3092456, -2.294921, 0, 1, 0.4117647, 1,
-0.2404274, 0.8886216, -0.6801995, 0, 1, 0.4196078, 1,
-0.2367943, -0.6059414, -0.7764137, 0, 1, 0.4235294, 1,
-0.2347268, 0.004781947, -2.526783, 0, 1, 0.4313726, 1,
-0.2342796, -0.236763, -3.019415, 0, 1, 0.4352941, 1,
-0.2337945, 1.071055, 1.715333, 0, 1, 0.4431373, 1,
-0.2336372, 1.185071, -0.04594295, 0, 1, 0.4470588, 1,
-0.2309386, 1.631903, -1.896963, 0, 1, 0.454902, 1,
-0.2257387, -0.2609084, -3.954936, 0, 1, 0.4588235, 1,
-0.2241043, -0.7135479, -3.062011, 0, 1, 0.4666667, 1,
-0.2234587, 1.009167, 0.846482, 0, 1, 0.4705882, 1,
-0.213691, 0.8779603, -0.8284043, 0, 1, 0.4784314, 1,
-0.2098866, 1.034559, 0.1209562, 0, 1, 0.4823529, 1,
-0.2086655, -0.7719041, -1.610662, 0, 1, 0.4901961, 1,
-0.20861, -0.2172938, -1.786574, 0, 1, 0.4941176, 1,
-0.2042831, -0.3901409, -3.218811, 0, 1, 0.5019608, 1,
-0.2026925, 2.31171, 1.591506, 0, 1, 0.509804, 1,
-0.202127, -0.3563384, -1.771445, 0, 1, 0.5137255, 1,
-0.1970377, -1.354167, -4.569014, 0, 1, 0.5215687, 1,
-0.1954375, 1.682564, 0.2586321, 0, 1, 0.5254902, 1,
-0.1930711, 0.3056995, -1.440551, 0, 1, 0.5333334, 1,
-0.1878698, 0.4478869, -0.5071281, 0, 1, 0.5372549, 1,
-0.1754997, 0.5870185, -0.5846024, 0, 1, 0.5450981, 1,
-0.174137, 0.6985795, 1.071612, 0, 1, 0.5490196, 1,
-0.1724339, -0.9618497, -2.366504, 0, 1, 0.5568628, 1,
-0.1719618, -1.623333, -3.918424, 0, 1, 0.5607843, 1,
-0.1663161, -0.9606394, -3.118545, 0, 1, 0.5686275, 1,
-0.1644204, 0.7210221, -1.872367, 0, 1, 0.572549, 1,
-0.1625196, -0.6685128, -2.854086, 0, 1, 0.5803922, 1,
-0.1587487, -0.4416839, -5.109788, 0, 1, 0.5843138, 1,
-0.1545329, -0.001641364, -0.07658477, 0, 1, 0.5921569, 1,
-0.1541293, -0.6983255, -4.52979, 0, 1, 0.5960785, 1,
-0.1514451, 0.03164509, -1.716105, 0, 1, 0.6039216, 1,
-0.151263, 2.540337, -0.2405044, 0, 1, 0.6117647, 1,
-0.1503778, 0.1339438, -0.9724874, 0, 1, 0.6156863, 1,
-0.1476882, 0.009722572, -1.72383, 0, 1, 0.6235294, 1,
-0.1471239, -2.081169, -2.813946, 0, 1, 0.627451, 1,
-0.1437329, -0.4726523, -3.921616, 0, 1, 0.6352941, 1,
-0.1414074, 0.8617529, -0.5248601, 0, 1, 0.6392157, 1,
-0.1404467, -1.391681, -2.640991, 0, 1, 0.6470588, 1,
-0.1386992, -0.9228844, -3.668416, 0, 1, 0.6509804, 1,
-0.1358454, -0.1541543, -3.863961, 0, 1, 0.6588235, 1,
-0.1348368, -0.9807721, -4.227038, 0, 1, 0.6627451, 1,
-0.132647, -0.2650898, -2.46611, 0, 1, 0.6705883, 1,
-0.1321602, -0.8075373, -3.293394, 0, 1, 0.6745098, 1,
-0.1318717, -0.7565353, -2.898097, 0, 1, 0.682353, 1,
-0.1316794, 0.364858, -0.7288557, 0, 1, 0.6862745, 1,
-0.1300308, 0.9817629, -0.8954927, 0, 1, 0.6941177, 1,
-0.1283197, -1.023217, -3.136662, 0, 1, 0.7019608, 1,
-0.12728, 0.7210364, -0.6359375, 0, 1, 0.7058824, 1,
-0.1230619, 2.053044, -1.395231, 0, 1, 0.7137255, 1,
-0.1224483, -0.7867984, -3.420185, 0, 1, 0.7176471, 1,
-0.1220279, 0.6704969, -0.007814351, 0, 1, 0.7254902, 1,
-0.1207035, 0.6411605, -0.6168488, 0, 1, 0.7294118, 1,
-0.1172168, -0.8534586, -2.514554, 0, 1, 0.7372549, 1,
-0.1152209, -0.4398794, -3.276731, 0, 1, 0.7411765, 1,
-0.1151393, -0.645366, -3.000657, 0, 1, 0.7490196, 1,
-0.1132316, 1.119954, 0.8546119, 0, 1, 0.7529412, 1,
-0.110325, -0.6112059, -2.720775, 0, 1, 0.7607843, 1,
-0.1084428, -0.2729513, -3.646196, 0, 1, 0.7647059, 1,
-0.1081737, 0.06923677, -1.081065, 0, 1, 0.772549, 1,
-0.1079682, -0.3785013, -1.756807, 0, 1, 0.7764706, 1,
-0.1072031, 0.2498479, 1.382607, 0, 1, 0.7843137, 1,
-0.08996229, -0.6560695, -3.502762, 0, 1, 0.7882353, 1,
-0.08975392, -1.442381, -3.016157, 0, 1, 0.7960784, 1,
-0.08809743, -2.285091, -2.584858, 0, 1, 0.8039216, 1,
-0.08726782, 0.5172648, -1.381102, 0, 1, 0.8078431, 1,
-0.08538979, -0.8023607, -3.444036, 0, 1, 0.8156863, 1,
-0.08379498, 0.6133154, 0.6928208, 0, 1, 0.8196079, 1,
-0.08270209, -1.066442, -2.957006, 0, 1, 0.827451, 1,
-0.0780941, -0.05925316, -2.904742, 0, 1, 0.8313726, 1,
-0.07747731, -0.6831273, -2.723817, 0, 1, 0.8392157, 1,
-0.07720658, -0.157598, -1.910123, 0, 1, 0.8431373, 1,
-0.07688273, -0.2760358, -2.530553, 0, 1, 0.8509804, 1,
-0.07085399, -0.3214816, -3.340107, 0, 1, 0.854902, 1,
-0.06690668, 0.6882535, -1.660236, 0, 1, 0.8627451, 1,
-0.06620079, 0.3919635, -0.6894524, 0, 1, 0.8666667, 1,
-0.06368713, -0.4884444, -3.475985, 0, 1, 0.8745098, 1,
-0.06180327, 0.4751151, 0.9246324, 0, 1, 0.8784314, 1,
-0.06035459, -1.473984, -2.632787, 0, 1, 0.8862745, 1,
-0.05753566, -0.1837241, -2.710639, 0, 1, 0.8901961, 1,
-0.05557168, 0.8429753, -1.21745, 0, 1, 0.8980392, 1,
-0.04429346, -1.276622, -1.252016, 0, 1, 0.9058824, 1,
-0.04202265, -1.479645, -4.285476, 0, 1, 0.9098039, 1,
-0.04153185, 1.070929, 0.9474791, 0, 1, 0.9176471, 1,
-0.03819511, 0.5584719, 0.1816384, 0, 1, 0.9215686, 1,
-0.03795868, 1.909998, -1.402635, 0, 1, 0.9294118, 1,
-0.03755517, 0.1127627, 0.2628286, 0, 1, 0.9333333, 1,
-0.03478908, -1.358424, -4.302579, 0, 1, 0.9411765, 1,
-0.02401749, -0.1808383, -3.800096, 0, 1, 0.945098, 1,
-0.02211939, 1.423899, -1.28638, 0, 1, 0.9529412, 1,
-0.01644449, -0.900942, -3.67978, 0, 1, 0.9568627, 1,
-0.006517527, -0.1759179, -3.132902, 0, 1, 0.9647059, 1,
-0.002749165, -0.910069, -3.164198, 0, 1, 0.9686275, 1,
0.01200325, 0.4806701, -1.895891, 0, 1, 0.9764706, 1,
0.01323391, 0.6242418, -0.3306618, 0, 1, 0.9803922, 1,
0.01470432, 0.2835079, 0.3383144, 0, 1, 0.9882353, 1,
0.01772273, 0.5555374, -1.010291, 0, 1, 0.9921569, 1,
0.01859909, -1.324827, 2.208347, 0, 1, 1, 1,
0.02123684, 1.464077, 0.139451, 0, 0.9921569, 1, 1,
0.02216577, -0.1305889, 4.25623, 0, 0.9882353, 1, 1,
0.02356827, -1.080589, 2.799984, 0, 0.9803922, 1, 1,
0.02411743, -0.009688364, 2.07705, 0, 0.9764706, 1, 1,
0.02694057, -1.340097, 1.514675, 0, 0.9686275, 1, 1,
0.03114572, 0.781978, 1.465583, 0, 0.9647059, 1, 1,
0.04105371, -0.6213798, 2.371272, 0, 0.9568627, 1, 1,
0.04113901, -0.01163724, 1.00908, 0, 0.9529412, 1, 1,
0.04434169, -0.9307288, 3.125532, 0, 0.945098, 1, 1,
0.0477398, 2.265244, -0.7283128, 0, 0.9411765, 1, 1,
0.05184784, 1.084316, 1.443915, 0, 0.9333333, 1, 1,
0.05215894, -0.6054351, 3.633985, 0, 0.9294118, 1, 1,
0.05368825, -0.2341706, 3.045864, 0, 0.9215686, 1, 1,
0.05549771, 0.07660417, 1.60462, 0, 0.9176471, 1, 1,
0.05962863, -0.6653038, 2.933694, 0, 0.9098039, 1, 1,
0.06763919, 0.745647, -0.08401196, 0, 0.9058824, 1, 1,
0.06899571, 1.390095, 0.8026229, 0, 0.8980392, 1, 1,
0.06970336, -0.3937301, 3.672923, 0, 0.8901961, 1, 1,
0.07167755, -0.313114, 4.23879, 0, 0.8862745, 1, 1,
0.07270887, 1.142003, 0.3300879, 0, 0.8784314, 1, 1,
0.07318279, 1.948442, -1.586935, 0, 0.8745098, 1, 1,
0.07860332, 0.2352345, 0.3463608, 0, 0.8666667, 1, 1,
0.08071154, 0.3400756, 0.5229889, 0, 0.8627451, 1, 1,
0.08110419, -0.1394879, 4.135772, 0, 0.854902, 1, 1,
0.08119732, -0.650071, 1.769495, 0, 0.8509804, 1, 1,
0.0814869, -0.7719823, 3.229961, 0, 0.8431373, 1, 1,
0.08223284, 0.2613145, 0.2928821, 0, 0.8392157, 1, 1,
0.08367481, 1.042975, -0.1385415, 0, 0.8313726, 1, 1,
0.08845906, 0.463962, 0.7816942, 0, 0.827451, 1, 1,
0.08969031, 0.7836263, -1.983434, 0, 0.8196079, 1, 1,
0.09553874, -0.7828156, 5.661084, 0, 0.8156863, 1, 1,
0.09644848, -0.330842, 1.603426, 0, 0.8078431, 1, 1,
0.1005112, 0.3602337, -0.788529, 0, 0.8039216, 1, 1,
0.1028804, -0.5700416, 0.8155167, 0, 0.7960784, 1, 1,
0.1031466, -0.3710349, 3.493279, 0, 0.7882353, 1, 1,
0.1067987, -0.5821308, 1.378524, 0, 0.7843137, 1, 1,
0.1091013, 0.6198723, -1.363326, 0, 0.7764706, 1, 1,
0.1102414, -0.7773902, 3.918602, 0, 0.772549, 1, 1,
0.1120245, 0.97334, -1.281732, 0, 0.7647059, 1, 1,
0.1136027, -0.03773468, 0.7020339, 0, 0.7607843, 1, 1,
0.1186074, 0.4880358, -0.9719164, 0, 0.7529412, 1, 1,
0.1188337, -2.260798, 4.312346, 0, 0.7490196, 1, 1,
0.1196792, 0.5288276, -1.221531, 0, 0.7411765, 1, 1,
0.119953, -0.2531115, 0.7136756, 0, 0.7372549, 1, 1,
0.1203664, -0.3787498, 1.332807, 0, 0.7294118, 1, 1,
0.1236325, -0.5903468, 2.442485, 0, 0.7254902, 1, 1,
0.1265954, 0.8091627, -1.020254, 0, 0.7176471, 1, 1,
0.1274565, -0.2167441, 1.222557, 0, 0.7137255, 1, 1,
0.1314748, 1.28829, 1.284111, 0, 0.7058824, 1, 1,
0.132278, 1.5071, -0.2478376, 0, 0.6980392, 1, 1,
0.139765, -0.7904752, 4.79353, 0, 0.6941177, 1, 1,
0.1428815, -0.6946018, 3.079221, 0, 0.6862745, 1, 1,
0.1478398, 1.575814, 1.864048, 0, 0.682353, 1, 1,
0.1482761, 0.4663962, -0.4754333, 0, 0.6745098, 1, 1,
0.149647, 0.5023297, 0.07272813, 0, 0.6705883, 1, 1,
0.1519065, 0.8820773, 0.4441939, 0, 0.6627451, 1, 1,
0.1520707, 1.219661, -1.250094, 0, 0.6588235, 1, 1,
0.1566246, -0.5051811, 2.739903, 0, 0.6509804, 1, 1,
0.1637618, 1.811192, -1.210386, 0, 0.6470588, 1, 1,
0.1642242, -0.1471846, 2.352427, 0, 0.6392157, 1, 1,
0.1666524, -0.5142706, 1.618082, 0, 0.6352941, 1, 1,
0.1674, -0.530165, 2.006353, 0, 0.627451, 1, 1,
0.1709415, 0.2533469, 0.6940557, 0, 0.6235294, 1, 1,
0.1720984, -0.2133036, 3.091011, 0, 0.6156863, 1, 1,
0.1763004, -0.6646464, 0.9835936, 0, 0.6117647, 1, 1,
0.1799926, 1.107775, 0.5793262, 0, 0.6039216, 1, 1,
0.1802154, -0.8697707, 1.952865, 0, 0.5960785, 1, 1,
0.1818558, 1.592755, 0.4300318, 0, 0.5921569, 1, 1,
0.1826511, 0.5590701, 0.6323865, 0, 0.5843138, 1, 1,
0.1863778, -1.021847, 2.697844, 0, 0.5803922, 1, 1,
0.1920253, -0.3461704, 2.512256, 0, 0.572549, 1, 1,
0.1921229, -0.007866386, 0.7793421, 0, 0.5686275, 1, 1,
0.1960595, 0.2631025, 1.064138, 0, 0.5607843, 1, 1,
0.1974617, 0.89442, 0.7146606, 0, 0.5568628, 1, 1,
0.1979375, -0.3761501, 2.370306, 0, 0.5490196, 1, 1,
0.2032839, -0.5449765, 2.885033, 0, 0.5450981, 1, 1,
0.2097364, 0.3659388, -0.4085537, 0, 0.5372549, 1, 1,
0.2147426, -0.07577165, 1.594435, 0, 0.5333334, 1, 1,
0.2168773, 0.1355521, 1.580072, 0, 0.5254902, 1, 1,
0.2180581, 1.647341, 1.602212, 0, 0.5215687, 1, 1,
0.2205815, 0.1572314, 0.6976702, 0, 0.5137255, 1, 1,
0.2230727, -0.4490107, 1.589574, 0, 0.509804, 1, 1,
0.2236177, 0.05522043, 4.624585, 0, 0.5019608, 1, 1,
0.228175, 0.8015856, 0.5065456, 0, 0.4941176, 1, 1,
0.2302002, -0.630405, 2.494925, 0, 0.4901961, 1, 1,
0.230904, -0.1387646, 1.25706, 0, 0.4823529, 1, 1,
0.2331541, -0.9572715, 1.647694, 0, 0.4784314, 1, 1,
0.2367567, -0.9034806, 4.712805, 0, 0.4705882, 1, 1,
0.2368395, 0.2439846, 2.864029, 0, 0.4666667, 1, 1,
0.2386311, -1.377812, 2.431232, 0, 0.4588235, 1, 1,
0.2440751, -0.7452957, 2.550231, 0, 0.454902, 1, 1,
0.2460057, 1.914677, 1.259218, 0, 0.4470588, 1, 1,
0.2463818, -0.7597378, 1.679214, 0, 0.4431373, 1, 1,
0.2500108, -0.5763834, 1.808529, 0, 0.4352941, 1, 1,
0.2513565, 0.4202512, 1.451399, 0, 0.4313726, 1, 1,
0.2610026, 0.1594187, 0.7766184, 0, 0.4235294, 1, 1,
0.2694893, 0.148606, 0.7504936, 0, 0.4196078, 1, 1,
0.2697629, 0.625888, -1.312485, 0, 0.4117647, 1, 1,
0.2697632, 0.5456529, 0.9621, 0, 0.4078431, 1, 1,
0.2698255, 0.8533592, 0.05456156, 0, 0.4, 1, 1,
0.2702011, 0.8607401, -0.2785977, 0, 0.3921569, 1, 1,
0.2743143, -1.286372, 2.71894, 0, 0.3882353, 1, 1,
0.2748177, 0.04743566, 0.6740457, 0, 0.3803922, 1, 1,
0.2785141, -0.05059289, 2.676808, 0, 0.3764706, 1, 1,
0.2800263, -1.415871, 2.980829, 0, 0.3686275, 1, 1,
0.2801029, -0.8293896, 2.087457, 0, 0.3647059, 1, 1,
0.2811921, -1.266543, 3.60006, 0, 0.3568628, 1, 1,
0.2817211, -2.168429, 3.40016, 0, 0.3529412, 1, 1,
0.2906536, -1.628241, 2.574419, 0, 0.345098, 1, 1,
0.2911481, -0.1386431, 3.250091, 0, 0.3411765, 1, 1,
0.2932006, 1.363422, 0.625362, 0, 0.3333333, 1, 1,
0.296461, -1.068072, 1.803573, 0, 0.3294118, 1, 1,
0.2981803, -0.4718369, 1.499321, 0, 0.3215686, 1, 1,
0.298541, -1.191719, 2.155739, 0, 0.3176471, 1, 1,
0.2986159, 0.6410863, -0.1027953, 0, 0.3098039, 1, 1,
0.2999, -0.04894451, 1.950636, 0, 0.3058824, 1, 1,
0.3001056, 2.829862, 1.299049, 0, 0.2980392, 1, 1,
0.3008462, 0.5951847, 0.9200582, 0, 0.2901961, 1, 1,
0.3021587, 1.259324, -0.3444653, 0, 0.2862745, 1, 1,
0.3027734, 0.7943063, -0.3057659, 0, 0.2784314, 1, 1,
0.3083922, -0.04725125, 1.673499, 0, 0.2745098, 1, 1,
0.3125399, -0.8642643, 4.098457, 0, 0.2666667, 1, 1,
0.3169341, -1.338626, 3.460818, 0, 0.2627451, 1, 1,
0.3170956, 0.3086609, -1.039416, 0, 0.254902, 1, 1,
0.3318039, 0.6521597, 0.8195624, 0, 0.2509804, 1, 1,
0.3344986, -0.225073, 0.8337935, 0, 0.2431373, 1, 1,
0.3357849, -0.3131842, 1.38763, 0, 0.2392157, 1, 1,
0.3415071, 1.236309, -0.3630613, 0, 0.2313726, 1, 1,
0.3422735, -0.696009, 1.601308, 0, 0.227451, 1, 1,
0.3424828, 1.652547, 0.189859, 0, 0.2196078, 1, 1,
0.346306, 1.206731, 0.7101141, 0, 0.2156863, 1, 1,
0.3474037, -0.1627507, 1.077089, 0, 0.2078431, 1, 1,
0.3500582, 0.2462377, -0.304841, 0, 0.2039216, 1, 1,
0.3563641, 0.4876905, -0.2539596, 0, 0.1960784, 1, 1,
0.3579797, -0.7879018, 1.859239, 0, 0.1882353, 1, 1,
0.3596081, 0.7573074, 0.6526622, 0, 0.1843137, 1, 1,
0.3666182, -1.262469, 2.500384, 0, 0.1764706, 1, 1,
0.3703915, 0.2734886, -0.2624284, 0, 0.172549, 1, 1,
0.3817199, -0.6691787, 1.814698, 0, 0.1647059, 1, 1,
0.3847804, -2.176974, 2.775815, 0, 0.1607843, 1, 1,
0.3935778, 0.1811923, 1.229934, 0, 0.1529412, 1, 1,
0.395427, 0.03324142, 0.5045432, 0, 0.1490196, 1, 1,
0.4018817, 0.09152921, -0.1423178, 0, 0.1411765, 1, 1,
0.4028979, 0.364656, 0.5321109, 0, 0.1372549, 1, 1,
0.4041145, 1.442138, -0.8108783, 0, 0.1294118, 1, 1,
0.405975, -0.8151923, 2.403915, 0, 0.1254902, 1, 1,
0.4065591, 0.4614606, 2.089412, 0, 0.1176471, 1, 1,
0.4085617, 0.5212654, 0.2467034, 0, 0.1137255, 1, 1,
0.4134209, -0.2445408, 2.453989, 0, 0.1058824, 1, 1,
0.4140789, -0.3137251, 2.830382, 0, 0.09803922, 1, 1,
0.4147917, 1.184259, -1.029068, 0, 0.09411765, 1, 1,
0.416513, 2.145415, 1.226424, 0, 0.08627451, 1, 1,
0.4183801, -0.005283566, 3.326016, 0, 0.08235294, 1, 1,
0.4208138, 1.028809, -0.4624391, 0, 0.07450981, 1, 1,
0.4222921, 0.2510506, 0.7247596, 0, 0.07058824, 1, 1,
0.4236761, 0.04758596, 1.917421, 0, 0.0627451, 1, 1,
0.4247193, 1.311803, 0.4955347, 0, 0.05882353, 1, 1,
0.4253429, -0.8943387, 1.396059, 0, 0.05098039, 1, 1,
0.4255489, -0.00491621, 1.274126, 0, 0.04705882, 1, 1,
0.4297815, -1.617298, 3.487486, 0, 0.03921569, 1, 1,
0.4299442, -0.5044847, 0.9703544, 0, 0.03529412, 1, 1,
0.4341166, 0.1938611, -0.2341221, 0, 0.02745098, 1, 1,
0.4371403, 0.4391329, 0.783406, 0, 0.02352941, 1, 1,
0.4383412, -0.8423047, 3.440247, 0, 0.01568628, 1, 1,
0.4391477, -1.102207, 3.129464, 0, 0.01176471, 1, 1,
0.4394279, 0.3501027, -0.9569185, 0, 0.003921569, 1, 1,
0.4423441, -0.9746597, 2.63459, 0.003921569, 0, 1, 1,
0.4435762, 0.1019747, 0.8887892, 0.007843138, 0, 1, 1,
0.4457505, -0.5459151, 2.019022, 0.01568628, 0, 1, 1,
0.4464409, -2.046116, 2.805666, 0.01960784, 0, 1, 1,
0.4474464, 1.354744, -0.08162203, 0.02745098, 0, 1, 1,
0.4502082, -0.2655564, 1.736751, 0.03137255, 0, 1, 1,
0.4589921, -1.574449, 2.733879, 0.03921569, 0, 1, 1,
0.4597293, -1.063723, 2.606753, 0.04313726, 0, 1, 1,
0.4600383, 1.831835, 0.6498705, 0.05098039, 0, 1, 1,
0.4615302, 0.4940591, 1.345299, 0.05490196, 0, 1, 1,
0.4660819, -0.02884735, 2.269018, 0.0627451, 0, 1, 1,
0.4670149, -0.2405667, 1.480604, 0.06666667, 0, 1, 1,
0.4680478, 2.203785, 0.4999552, 0.07450981, 0, 1, 1,
0.4709919, 2.206713, 0.8981799, 0.07843138, 0, 1, 1,
0.4714735, -1.962131, 1.877658, 0.08627451, 0, 1, 1,
0.4716552, -0.9254714, 2.751868, 0.09019608, 0, 1, 1,
0.473414, 0.2689424, -1.842162, 0.09803922, 0, 1, 1,
0.4739361, 0.9233778, -1.027105, 0.1058824, 0, 1, 1,
0.4753097, 0.664141, -0.5471075, 0.1098039, 0, 1, 1,
0.4772938, -1.074003, 2.593208, 0.1176471, 0, 1, 1,
0.4776297, -0.562813, 2.381172, 0.1215686, 0, 1, 1,
0.4820606, 1.061434, -0.4935536, 0.1294118, 0, 1, 1,
0.4824152, -0.08787356, 3.168996, 0.1333333, 0, 1, 1,
0.4839472, 0.414573, -0.2253443, 0.1411765, 0, 1, 1,
0.4845781, 0.9777817, 0.1018125, 0.145098, 0, 1, 1,
0.4854923, -0.4123437, 3.375805, 0.1529412, 0, 1, 1,
0.4926969, -0.8228273, 0.6850371, 0.1568628, 0, 1, 1,
0.4959488, -1.302804, 1.626203, 0.1647059, 0, 1, 1,
0.4965453, 0.2607996, 0.4565156, 0.1686275, 0, 1, 1,
0.4993747, -1.055431, 0.8977975, 0.1764706, 0, 1, 1,
0.5003487, -0.8337466, 1.992613, 0.1803922, 0, 1, 1,
0.5029491, -0.2369389, 1.522544, 0.1882353, 0, 1, 1,
0.5070208, 1.177932, 0.6710629, 0.1921569, 0, 1, 1,
0.5086503, 0.8699021, 2.452765, 0.2, 0, 1, 1,
0.510271, -1.548745, 3.754363, 0.2078431, 0, 1, 1,
0.5103344, -0.8305217, 2.768266, 0.2117647, 0, 1, 1,
0.5135939, 0.5554695, 1.907768, 0.2196078, 0, 1, 1,
0.5168875, 0.5494463, -0.281924, 0.2235294, 0, 1, 1,
0.5195305, 0.5324296, 0.4946687, 0.2313726, 0, 1, 1,
0.5232109, 0.4454079, 2.343055, 0.2352941, 0, 1, 1,
0.5263764, -0.3366889, 2.85265, 0.2431373, 0, 1, 1,
0.5299227, 0.543976, -0.9185008, 0.2470588, 0, 1, 1,
0.5316932, 0.8030876, 2.370428, 0.254902, 0, 1, 1,
0.5329972, -0.2517774, 3.366343, 0.2588235, 0, 1, 1,
0.5347484, 0.5287485, 0.2306404, 0.2666667, 0, 1, 1,
0.5401542, 0.1599977, 1.252434, 0.2705882, 0, 1, 1,
0.5455115, -1.639026, 2.706372, 0.2784314, 0, 1, 1,
0.5466771, 0.4795495, 0.1261365, 0.282353, 0, 1, 1,
0.5480591, -0.7075905, 2.292311, 0.2901961, 0, 1, 1,
0.5494931, -0.3846879, 2.645133, 0.2941177, 0, 1, 1,
0.551038, -0.03789253, 2.819381, 0.3019608, 0, 1, 1,
0.5513878, 0.6945933, -0.07535513, 0.3098039, 0, 1, 1,
0.5600903, -0.3975826, 2.039488, 0.3137255, 0, 1, 1,
0.5604312, -0.6788962, 2.788628, 0.3215686, 0, 1, 1,
0.5610108, 1.325479, 0.9489014, 0.3254902, 0, 1, 1,
0.5612121, 0.6509011, 0.9531516, 0.3333333, 0, 1, 1,
0.5618972, -0.1299604, 2.450473, 0.3372549, 0, 1, 1,
0.5635997, 1.531737, 0.08355317, 0.345098, 0, 1, 1,
0.5646862, -0.6035624, 4.102173, 0.3490196, 0, 1, 1,
0.5654337, 0.9565234, 2.052531, 0.3568628, 0, 1, 1,
0.5675311, -0.8376048, 2.336215, 0.3607843, 0, 1, 1,
0.5746536, -0.3043323, 2.387009, 0.3686275, 0, 1, 1,
0.5749933, -2.177023, 1.61543, 0.372549, 0, 1, 1,
0.5757247, 0.307108, 0.2567304, 0.3803922, 0, 1, 1,
0.5780676, 0.8814318, 0.1058453, 0.3843137, 0, 1, 1,
0.5876274, -1.113806, 1.922079, 0.3921569, 0, 1, 1,
0.5997354, 1.773327, 0.9433089, 0.3960784, 0, 1, 1,
0.6003654, -0.8962571, 0.4762092, 0.4039216, 0, 1, 1,
0.6025178, -0.2898985, 1.725392, 0.4117647, 0, 1, 1,
0.6034265, 0.8286759, 1.248273, 0.4156863, 0, 1, 1,
0.6058365, -0.6675738, 1.34221, 0.4235294, 0, 1, 1,
0.6062022, 0.6604679, 0.2947719, 0.427451, 0, 1, 1,
0.60869, -0.1452664, 1.328044, 0.4352941, 0, 1, 1,
0.6218575, 1.096252, -0.5174381, 0.4392157, 0, 1, 1,
0.6226425, -0.8890211, 1.452326, 0.4470588, 0, 1, 1,
0.6228462, -0.2834896, 2.242164, 0.4509804, 0, 1, 1,
0.6286381, -0.955106, 0.5069804, 0.4588235, 0, 1, 1,
0.6335551, -0.3562316, 2.720139, 0.4627451, 0, 1, 1,
0.641425, 0.7417279, 0.9189458, 0.4705882, 0, 1, 1,
0.644626, -0.1572777, 0.5749168, 0.4745098, 0, 1, 1,
0.645821, -0.2136949, 0.6446236, 0.4823529, 0, 1, 1,
0.6489345, 0.6066735, 0.2170829, 0.4862745, 0, 1, 1,
0.649489, -1.474079, 3.466226, 0.4941176, 0, 1, 1,
0.6498904, 0.6616945, 0.9776942, 0.5019608, 0, 1, 1,
0.6502636, 1.087977, 0.7883777, 0.5058824, 0, 1, 1,
0.6516032, 0.3391156, 1.740175, 0.5137255, 0, 1, 1,
0.6595464, -1.16415, 2.000794, 0.5176471, 0, 1, 1,
0.6634099, 0.2232234, 2.862074, 0.5254902, 0, 1, 1,
0.6636188, 0.03951092, 0.4796242, 0.5294118, 0, 1, 1,
0.6666828, -0.08803328, 1.489205, 0.5372549, 0, 1, 1,
0.6743028, -0.6262853, 0.6820328, 0.5411765, 0, 1, 1,
0.6854349, 1.252916, -0.06395958, 0.5490196, 0, 1, 1,
0.6855352, 0.5986921, 0.27879, 0.5529412, 0, 1, 1,
0.6856477, -0.1884929, 1.619508, 0.5607843, 0, 1, 1,
0.6899524, -0.4950774, 1.900572, 0.5647059, 0, 1, 1,
0.6945658, -0.10342, 3.629916, 0.572549, 0, 1, 1,
0.7019371, -0.7353026, 2.765751, 0.5764706, 0, 1, 1,
0.7025435, -0.9221662, 5.312693, 0.5843138, 0, 1, 1,
0.7173668, 1.463888, 1.449039, 0.5882353, 0, 1, 1,
0.7187983, 1.390181, 0.1675093, 0.5960785, 0, 1, 1,
0.7203934, -0.2848484, 2.492475, 0.6039216, 0, 1, 1,
0.720964, -0.08924997, 1.706169, 0.6078432, 0, 1, 1,
0.7215472, -0.7863126, 1.901731, 0.6156863, 0, 1, 1,
0.7229137, 0.207463, 1.543847, 0.6196079, 0, 1, 1,
0.723106, -1.919212, 2.675043, 0.627451, 0, 1, 1,
0.7232014, 0.9355275, 0.4782656, 0.6313726, 0, 1, 1,
0.7253767, -0.7264302, 2.663487, 0.6392157, 0, 1, 1,
0.7297398, -0.2796238, 1.922136, 0.6431373, 0, 1, 1,
0.7315344, -0.5517353, 2.199293, 0.6509804, 0, 1, 1,
0.7345663, 0.5418752, 1.467602, 0.654902, 0, 1, 1,
0.7375286, -0.1207718, 2.590594, 0.6627451, 0, 1, 1,
0.7431134, 0.002759729, 1.01678, 0.6666667, 0, 1, 1,
0.745671, 0.07161362, 1.564788, 0.6745098, 0, 1, 1,
0.7488373, -0.02718519, 3.070867, 0.6784314, 0, 1, 1,
0.7496797, 0.1232452, 1.648472, 0.6862745, 0, 1, 1,
0.7541847, -1.086516, 0.731331, 0.6901961, 0, 1, 1,
0.7572384, -0.2800145, 1.221983, 0.6980392, 0, 1, 1,
0.7573236, -0.2268911, 2.137074, 0.7058824, 0, 1, 1,
0.7638565, 0.02850455, 2.040006, 0.7098039, 0, 1, 1,
0.7647129, -2.350592, 3.379599, 0.7176471, 0, 1, 1,
0.7647652, 0.324711, -0.7856967, 0.7215686, 0, 1, 1,
0.7657977, -1.584145, 3.298274, 0.7294118, 0, 1, 1,
0.7666343, 0.281845, 1.13368, 0.7333333, 0, 1, 1,
0.7750309, -0.0111823, 2.029003, 0.7411765, 0, 1, 1,
0.7786717, 2.064494, 1.105322, 0.7450981, 0, 1, 1,
0.7830166, 0.3703907, 1.158682, 0.7529412, 0, 1, 1,
0.7830905, 0.2549995, 1.791811, 0.7568628, 0, 1, 1,
0.7885011, 0.2546101, 0.6843077, 0.7647059, 0, 1, 1,
0.7916301, -0.9102183, 3.630019, 0.7686275, 0, 1, 1,
0.798075, -0.3475605, 2.845561, 0.7764706, 0, 1, 1,
0.7999817, -2.635354, 4.005067, 0.7803922, 0, 1, 1,
0.8001244, 0.2537908, -0.6355539, 0.7882353, 0, 1, 1,
0.8013943, 0.4070392, 0.8873742, 0.7921569, 0, 1, 1,
0.8024384, 0.6184654, 2.142927, 0.8, 0, 1, 1,
0.8106636, -0.580595, 2.026211, 0.8078431, 0, 1, 1,
0.8156554, -1.130856, 1.939272, 0.8117647, 0, 1, 1,
0.8180679, 0.2894471, 3.41939, 0.8196079, 0, 1, 1,
0.8203806, 0.3474183, 1.668584, 0.8235294, 0, 1, 1,
0.8215273, 0.4968823, 1.530281, 0.8313726, 0, 1, 1,
0.8231173, -0.7289121, 3.263741, 0.8352941, 0, 1, 1,
0.8340704, 1.245457, 0.6644824, 0.8431373, 0, 1, 1,
0.8541229, -0.01162293, 2.579402, 0.8470588, 0, 1, 1,
0.8542564, -0.1382464, 1.198052, 0.854902, 0, 1, 1,
0.8558965, 0.3251613, 1.615668, 0.8588235, 0, 1, 1,
0.857944, 0.5923597, -0.4120604, 0.8666667, 0, 1, 1,
0.8609338, -2.137197, 2.892197, 0.8705882, 0, 1, 1,
0.8690314, -1.200139, 2.183256, 0.8784314, 0, 1, 1,
0.8711786, -0.5910553, 2.946745, 0.8823529, 0, 1, 1,
0.8733938, 1.039985, -0.167901, 0.8901961, 0, 1, 1,
0.8773202, -1.588412, 2.628234, 0.8941177, 0, 1, 1,
0.8778783, -0.8549053, 2.749406, 0.9019608, 0, 1, 1,
0.8814247, 0.2517529, 3.108158, 0.9098039, 0, 1, 1,
0.8822213, 0.05276797, 1.444059, 0.9137255, 0, 1, 1,
0.8916469, -2.064634, 0.3851044, 0.9215686, 0, 1, 1,
0.8927038, -0.7761237, 1.508199, 0.9254902, 0, 1, 1,
0.8950418, -1.274098, 1.036451, 0.9333333, 0, 1, 1,
0.895321, 0.6240748, 0.4299855, 0.9372549, 0, 1, 1,
0.9071867, -1.124646, 2.657521, 0.945098, 0, 1, 1,
0.9077397, -0.8707348, -0.6875093, 0.9490196, 0, 1, 1,
0.9084845, 0.4613, 0.01462989, 0.9568627, 0, 1, 1,
0.9172753, 1.845957, 0.737994, 0.9607843, 0, 1, 1,
0.9248542, -0.3234758, 3.74075, 0.9686275, 0, 1, 1,
0.9255609, 1.337022, 0.438988, 0.972549, 0, 1, 1,
0.9382051, 0.3770567, 1.53294, 0.9803922, 0, 1, 1,
0.9385042, 0.7873864, 0.01834431, 0.9843137, 0, 1, 1,
0.9404836, 0.4890107, 1.14548, 0.9921569, 0, 1, 1,
0.946273, 1.200165, 0.8233454, 0.9960784, 0, 1, 1,
0.9490053, -0.8112674, 1.805387, 1, 0, 0.9960784, 1,
0.9589678, -0.3952395, 1.25363, 1, 0, 0.9882353, 1,
0.9629194, 0.8223755, 2.246675, 1, 0, 0.9843137, 1,
0.9636865, 1.279933, 1.576559, 1, 0, 0.9764706, 1,
0.9689645, 1.05886, -0.2705318, 1, 0, 0.972549, 1,
0.9761606, -1.046568, 3.04989, 1, 0, 0.9647059, 1,
0.9800843, -2.475149, 3.443253, 1, 0, 0.9607843, 1,
0.9879456, -0.4469657, 1.088698, 1, 0, 0.9529412, 1,
0.9880059, 1.848857, -0.3587502, 1, 0, 0.9490196, 1,
0.9887617, -0.9178497, 4.400809, 1, 0, 0.9411765, 1,
0.989379, -0.06602468, 2.052976, 1, 0, 0.9372549, 1,
0.9926115, 0.4898794, -0.1594529, 1, 0, 0.9294118, 1,
0.9960898, 2.095107, -0.2741018, 1, 0, 0.9254902, 1,
1.002146, 0.4370642, 1.375038, 1, 0, 0.9176471, 1,
1.00834, -1.347153, 2.360008, 1, 0, 0.9137255, 1,
1.014961, 0.6010127, 0.6969733, 1, 0, 0.9058824, 1,
1.020477, 0.2117736, 2.303246, 1, 0, 0.9019608, 1,
1.031073, -1.357499, 3.90796, 1, 0, 0.8941177, 1,
1.043458, -0.3061188, 1.368598, 1, 0, 0.8862745, 1,
1.044553, -0.5867413, 0.882632, 1, 0, 0.8823529, 1,
1.050038, -1.51975, 3.314896, 1, 0, 0.8745098, 1,
1.051176, -0.3884011, 2.751101, 1, 0, 0.8705882, 1,
1.051434, 1.423102, 0.7687113, 1, 0, 0.8627451, 1,
1.059071, 0.8385416, 0.9266142, 1, 0, 0.8588235, 1,
1.061781, -0.8018602, 2.900826, 1, 0, 0.8509804, 1,
1.062704, -2.085329, 3.865758, 1, 0, 0.8470588, 1,
1.070477, 0.7262535, 0.4593259, 1, 0, 0.8392157, 1,
1.070631, 0.466476, 1.609776, 1, 0, 0.8352941, 1,
1.080491, -0.6709125, 2.307818, 1, 0, 0.827451, 1,
1.080895, -1.31073, 0.5658516, 1, 0, 0.8235294, 1,
1.085494, 1.166219, 0.9136487, 1, 0, 0.8156863, 1,
1.088304, 2.086735, -0.1037623, 1, 0, 0.8117647, 1,
1.103469, 0.1327057, 0.9825086, 1, 0, 0.8039216, 1,
1.108927, 1.678057, 1.658801, 1, 0, 0.7960784, 1,
1.11621, 0.3204613, 2.797889, 1, 0, 0.7921569, 1,
1.119483, -1.322785, 3.365542, 1, 0, 0.7843137, 1,
1.123158, -0.01715591, 1.040159, 1, 0, 0.7803922, 1,
1.128974, 1.944869, 1.539788, 1, 0, 0.772549, 1,
1.129837, 0.08587636, 1.370973, 1, 0, 0.7686275, 1,
1.131884, -0.3353375, 2.163291, 1, 0, 0.7607843, 1,
1.137835, 0.7533845, -0.8281486, 1, 0, 0.7568628, 1,
1.13826, -1.187488, 1.046152, 1, 0, 0.7490196, 1,
1.141332, 1.352252, 1.386679, 1, 0, 0.7450981, 1,
1.14481, 0.1536042, 1.335204, 1, 0, 0.7372549, 1,
1.14551, -0.7136716, 2.556067, 1, 0, 0.7333333, 1,
1.149822, -0.1834796, 0.8749715, 1, 0, 0.7254902, 1,
1.153442, 0.8657025, 0.8748533, 1, 0, 0.7215686, 1,
1.155452, 1.76678, 0.1070653, 1, 0, 0.7137255, 1,
1.166448, 0.2560877, 0.1346067, 1, 0, 0.7098039, 1,
1.167345, 2.058846, 1.176581, 1, 0, 0.7019608, 1,
1.169979, -0.8642455, 1.972018, 1, 0, 0.6941177, 1,
1.171414, -0.6312865, 4.468655, 1, 0, 0.6901961, 1,
1.179555, 0.03906652, 1.061411, 1, 0, 0.682353, 1,
1.18138, -0.3815026, 1.373903, 1, 0, 0.6784314, 1,
1.18671, -1.802777, 2.882854, 1, 0, 0.6705883, 1,
1.190933, 1.768212, 0.8383784, 1, 0, 0.6666667, 1,
1.19162, -0.7895629, 1.024349, 1, 0, 0.6588235, 1,
1.193365, 0.2637802, 1.343326, 1, 0, 0.654902, 1,
1.200152, 1.90084, 1.544276, 1, 0, 0.6470588, 1,
1.200703, 0.6118433, 1.209048, 1, 0, 0.6431373, 1,
1.202888, 1.994134, -0.1523943, 1, 0, 0.6352941, 1,
1.212485, -0.5791702, 2.084089, 1, 0, 0.6313726, 1,
1.212963, -0.2255975, 0.9601425, 1, 0, 0.6235294, 1,
1.223771, -0.6045308, 2.184705, 1, 0, 0.6196079, 1,
1.229013, -0.9344632, 2.45676, 1, 0, 0.6117647, 1,
1.23218, -1.238769, 1.89153, 1, 0, 0.6078432, 1,
1.242792, 0.08487322, 1.05762, 1, 0, 0.6, 1,
1.263553, 0.4539351, 1.211923, 1, 0, 0.5921569, 1,
1.265225, 1.110121, 2.121506, 1, 0, 0.5882353, 1,
1.26849, -2.66579, 2.196265, 1, 0, 0.5803922, 1,
1.271855, 0.3712761, 0.9402752, 1, 0, 0.5764706, 1,
1.280386, 1.049566, 1.337099, 1, 0, 0.5686275, 1,
1.28214, 0.7407116, -0.1571459, 1, 0, 0.5647059, 1,
1.299994, 0.1149205, 2.263993, 1, 0, 0.5568628, 1,
1.309911, -1.355069, 3.465395, 1, 0, 0.5529412, 1,
1.310955, -0.8715844, 1.147463, 1, 0, 0.5450981, 1,
1.315687, -0.08083612, 1.418344, 1, 0, 0.5411765, 1,
1.316287, -1.212813, 2.809153, 1, 0, 0.5333334, 1,
1.333771, -2.001266, 2.756049, 1, 0, 0.5294118, 1,
1.34303, -0.008691942, 2.025527, 1, 0, 0.5215687, 1,
1.349945, 0.656055, -0.4621643, 1, 0, 0.5176471, 1,
1.354131, 0.1104156, 2.05148, 1, 0, 0.509804, 1,
1.355776, -0.9904702, -0.1554441, 1, 0, 0.5058824, 1,
1.36599, 0.1693367, 0.805948, 1, 0, 0.4980392, 1,
1.368921, 0.6937848, 0.648667, 1, 0, 0.4901961, 1,
1.369323, -0.3381838, 0.9197041, 1, 0, 0.4862745, 1,
1.373969, -0.1025693, 2.152851, 1, 0, 0.4784314, 1,
1.385748, 0.02314302, 0.7449647, 1, 0, 0.4745098, 1,
1.392282, -0.298293, 3.330213, 1, 0, 0.4666667, 1,
1.392855, -0.6097229, 2.830244, 1, 0, 0.4627451, 1,
1.39834, 0.3594068, -1.242628, 1, 0, 0.454902, 1,
1.405794, 0.3147529, 0.9536216, 1, 0, 0.4509804, 1,
1.426185, -1.805818, 3.34093, 1, 0, 0.4431373, 1,
1.42712, -0.3222687, 0.9772527, 1, 0, 0.4392157, 1,
1.433583, 0.8632347, 1.956562, 1, 0, 0.4313726, 1,
1.444989, 1.42659, -0.1285587, 1, 0, 0.427451, 1,
1.452482, -0.2572475, 0.6546227, 1, 0, 0.4196078, 1,
1.452721, -1.100504, 0.6156098, 1, 0, 0.4156863, 1,
1.461831, 0.2794564, 2.744781, 1, 0, 0.4078431, 1,
1.482129, 1.913614, 1.715335, 1, 0, 0.4039216, 1,
1.487616, -2.560002, 2.638485, 1, 0, 0.3960784, 1,
1.488674, 1.258487, 1.661151, 1, 0, 0.3882353, 1,
1.498413, 1.049112, 1.377373, 1, 0, 0.3843137, 1,
1.51157, -0.4847041, 2.661243, 1, 0, 0.3764706, 1,
1.551737, 0.8156502, 1.134264, 1, 0, 0.372549, 1,
1.551928, 0.0186302, 1.727708, 1, 0, 0.3647059, 1,
1.582359, 0.2390274, 0.3328667, 1, 0, 0.3607843, 1,
1.593479, -0.2366012, 2.540264, 1, 0, 0.3529412, 1,
1.624233, 1.077885, 0.332568, 1, 0, 0.3490196, 1,
1.630932, -0.5481304, 0.9931007, 1, 0, 0.3411765, 1,
1.633257, -1.375245, 1.998294, 1, 0, 0.3372549, 1,
1.651776, -0.3518264, 1.333929, 1, 0, 0.3294118, 1,
1.671856, -0.006347448, -0.5510445, 1, 0, 0.3254902, 1,
1.699869, 0.2161293, 2.096468, 1, 0, 0.3176471, 1,
1.70465, -0.2888719, 1.777022, 1, 0, 0.3137255, 1,
1.706213, -0.4280597, 0.6557136, 1, 0, 0.3058824, 1,
1.709107, 1.091686, -1.330767, 1, 0, 0.2980392, 1,
1.712653, -1.000804, 2.71103, 1, 0, 0.2941177, 1,
1.72742, -0.1649627, 0.5297431, 1, 0, 0.2862745, 1,
1.735329, 0.2998381, -0.03531771, 1, 0, 0.282353, 1,
1.740586, 0.4302971, 1.442687, 1, 0, 0.2745098, 1,
1.753222, 0.5008565, 1.141108, 1, 0, 0.2705882, 1,
1.771739, -0.3211863, 0.7405761, 1, 0, 0.2627451, 1,
1.785338, -2.974556, 2.071239, 1, 0, 0.2588235, 1,
1.787847, 0.6255908, 1.22402, 1, 0, 0.2509804, 1,
1.791371, 1.103269, 1.339635, 1, 0, 0.2470588, 1,
1.795475, 1.917357, 2.039218, 1, 0, 0.2392157, 1,
1.811011, -0.913051, 2.134331, 1, 0, 0.2352941, 1,
1.819047, 0.4603954, 2.109857, 1, 0, 0.227451, 1,
1.822956, -0.4213648, 2.960901, 1, 0, 0.2235294, 1,
1.824474, 0.3837239, 1.904354, 1, 0, 0.2156863, 1,
1.834638, 0.05839474, 0.9891594, 1, 0, 0.2117647, 1,
1.851715, -0.468605, 0.2171627, 1, 0, 0.2039216, 1,
1.862372, 0.4359956, 1.579801, 1, 0, 0.1960784, 1,
1.872022, -1.144842, 1.669483, 1, 0, 0.1921569, 1,
1.87797, -0.1340044, 1.639415, 1, 0, 0.1843137, 1,
1.894517, -0.3395916, 2.03748, 1, 0, 0.1803922, 1,
1.918286, -0.4467725, -0.3430897, 1, 0, 0.172549, 1,
1.92247, -0.244555, 3.839483, 1, 0, 0.1686275, 1,
1.948229, -1.093572, 2.46762, 1, 0, 0.1607843, 1,
1.954633, -1.246409, 2.831752, 1, 0, 0.1568628, 1,
1.95554, 0.3219303, 1.437533, 1, 0, 0.1490196, 1,
1.95681, -0.5577811, 2.478185, 1, 0, 0.145098, 1,
1.97239, 1.679495, 1.600322, 1, 0, 0.1372549, 1,
1.977322, 1.663112, 0.4592908, 1, 0, 0.1333333, 1,
2.006206, 0.7331114, 1.312982, 1, 0, 0.1254902, 1,
2.007808, 0.5756527, 2.402006, 1, 0, 0.1215686, 1,
2.031013, 0.2059892, 2.123286, 1, 0, 0.1137255, 1,
2.069136, -0.6094204, 2.664902, 1, 0, 0.1098039, 1,
2.072468, -1.239966, 0.4572996, 1, 0, 0.1019608, 1,
2.075533, -0.2739876, 2.464777, 1, 0, 0.09411765, 1,
2.094297, -0.02496279, 1.144809, 1, 0, 0.09019608, 1,
2.100726, 0.5692003, 1.56439, 1, 0, 0.08235294, 1,
2.106325, -0.1597343, 0.6441205, 1, 0, 0.07843138, 1,
2.151804, -0.715503, 1.193537, 1, 0, 0.07058824, 1,
2.167348, 0.560348, 1.600032, 1, 0, 0.06666667, 1,
2.171771, -1.165638, 1.800468, 1, 0, 0.05882353, 1,
2.174309, -0.002804912, 1.44945, 1, 0, 0.05490196, 1,
2.211387, -0.5711851, 0.303573, 1, 0, 0.04705882, 1,
2.212828, -0.214867, 0.7313585, 1, 0, 0.04313726, 1,
2.419016, 1.576305, 0.2486888, 1, 0, 0.03529412, 1,
2.758318, -0.5223309, 1.682303, 1, 0, 0.03137255, 1,
2.971014, 0.9502305, 0.9835812, 1, 0, 0.02352941, 1,
3.045959, 0.1398818, 1.747158, 1, 0, 0.01960784, 1,
3.146762, -0.4466515, 1.72153, 1, 0, 0.01176471, 1,
4.10236, -0.1048962, 1.420249, 1, 0, 0.007843138, 1
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
0.5982531, -3.958405, -7.604816, 0, -0.5, 0.5, 0.5,
0.5982531, -3.958405, -7.604816, 1, -0.5, 0.5, 0.5,
0.5982531, -3.958405, -7.604816, 1, 1.5, 0.5, 0.5,
0.5982531, -3.958405, -7.604816, 0, 1.5, 0.5, 0.5
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
-4.093746, -0.07234716, -7.604816, 0, -0.5, 0.5, 0.5,
-4.093746, -0.07234716, -7.604816, 1, -0.5, 0.5, 0.5,
-4.093746, -0.07234716, -7.604816, 1, 1.5, 0.5, 0.5,
-4.093746, -0.07234716, -7.604816, 0, 1.5, 0.5, 0.5
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
-4.093746, -3.958405, -0.01052761, 0, -0.5, 0.5, 0.5,
-4.093746, -3.958405, -0.01052761, 1, -0.5, 0.5, 0.5,
-4.093746, -3.958405, -0.01052761, 1, 1.5, 0.5, 0.5,
-4.093746, -3.958405, -0.01052761, 0, 1.5, 0.5, 0.5
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
-2, -3.061622, -5.852288,
4, -3.061622, -5.852288,
-2, -3.061622, -5.852288,
-2, -3.211086, -6.144376,
0, -3.061622, -5.852288,
0, -3.211086, -6.144376,
2, -3.061622, -5.852288,
2, -3.211086, -6.144376,
4, -3.061622, -5.852288,
4, -3.211086, -6.144376
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
"2",
"4"
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
-2, -3.510014, -6.728552, 0, -0.5, 0.5, 0.5,
-2, -3.510014, -6.728552, 1, -0.5, 0.5, 0.5,
-2, -3.510014, -6.728552, 1, 1.5, 0.5, 0.5,
-2, -3.510014, -6.728552, 0, 1.5, 0.5, 0.5,
0, -3.510014, -6.728552, 0, -0.5, 0.5, 0.5,
0, -3.510014, -6.728552, 1, -0.5, 0.5, 0.5,
0, -3.510014, -6.728552, 1, 1.5, 0.5, 0.5,
0, -3.510014, -6.728552, 0, 1.5, 0.5, 0.5,
2, -3.510014, -6.728552, 0, -0.5, 0.5, 0.5,
2, -3.510014, -6.728552, 1, -0.5, 0.5, 0.5,
2, -3.510014, -6.728552, 1, 1.5, 0.5, 0.5,
2, -3.510014, -6.728552, 0, 1.5, 0.5, 0.5,
4, -3.510014, -6.728552, 0, -0.5, 0.5, 0.5,
4, -3.510014, -6.728552, 1, -0.5, 0.5, 0.5,
4, -3.510014, -6.728552, 1, 1.5, 0.5, 0.5,
4, -3.510014, -6.728552, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.010977, -2, -5.852288,
-3.010977, 2, -5.852288,
-3.010977, -2, -5.852288,
-3.191439, -2, -6.144376,
-3.010977, -1, -5.852288,
-3.191439, -1, -6.144376,
-3.010977, 0, -5.852288,
-3.191439, 0, -6.144376,
-3.010977, 1, -5.852288,
-3.191439, 1, -6.144376,
-3.010977, 2, -5.852288,
-3.191439, 2, -6.144376
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
-3.552362, -2, -6.728552, 0, -0.5, 0.5, 0.5,
-3.552362, -2, -6.728552, 1, -0.5, 0.5, 0.5,
-3.552362, -2, -6.728552, 1, 1.5, 0.5, 0.5,
-3.552362, -2, -6.728552, 0, 1.5, 0.5, 0.5,
-3.552362, -1, -6.728552, 0, -0.5, 0.5, 0.5,
-3.552362, -1, -6.728552, 1, -0.5, 0.5, 0.5,
-3.552362, -1, -6.728552, 1, 1.5, 0.5, 0.5,
-3.552362, -1, -6.728552, 0, 1.5, 0.5, 0.5,
-3.552362, 0, -6.728552, 0, -0.5, 0.5, 0.5,
-3.552362, 0, -6.728552, 1, -0.5, 0.5, 0.5,
-3.552362, 0, -6.728552, 1, 1.5, 0.5, 0.5,
-3.552362, 0, -6.728552, 0, 1.5, 0.5, 0.5,
-3.552362, 1, -6.728552, 0, -0.5, 0.5, 0.5,
-3.552362, 1, -6.728552, 1, -0.5, 0.5, 0.5,
-3.552362, 1, -6.728552, 1, 1.5, 0.5, 0.5,
-3.552362, 1, -6.728552, 0, 1.5, 0.5, 0.5,
-3.552362, 2, -6.728552, 0, -0.5, 0.5, 0.5,
-3.552362, 2, -6.728552, 1, -0.5, 0.5, 0.5,
-3.552362, 2, -6.728552, 1, 1.5, 0.5, 0.5,
-3.552362, 2, -6.728552, 0, 1.5, 0.5, 0.5
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
-3.010977, -3.061622, -4,
-3.010977, -3.061622, 4,
-3.010977, -3.061622, -4,
-3.191439, -3.211086, -4,
-3.010977, -3.061622, -2,
-3.191439, -3.211086, -2,
-3.010977, -3.061622, 0,
-3.191439, -3.211086, 0,
-3.010977, -3.061622, 2,
-3.191439, -3.211086, 2,
-3.010977, -3.061622, 4,
-3.191439, -3.211086, 4
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
-3.552362, -3.510014, -4, 0, -0.5, 0.5, 0.5,
-3.552362, -3.510014, -4, 1, -0.5, 0.5, 0.5,
-3.552362, -3.510014, -4, 1, 1.5, 0.5, 0.5,
-3.552362, -3.510014, -4, 0, 1.5, 0.5, 0.5,
-3.552362, -3.510014, -2, 0, -0.5, 0.5, 0.5,
-3.552362, -3.510014, -2, 1, -0.5, 0.5, 0.5,
-3.552362, -3.510014, -2, 1, 1.5, 0.5, 0.5,
-3.552362, -3.510014, -2, 0, 1.5, 0.5, 0.5,
-3.552362, -3.510014, 0, 0, -0.5, 0.5, 0.5,
-3.552362, -3.510014, 0, 1, -0.5, 0.5, 0.5,
-3.552362, -3.510014, 0, 1, 1.5, 0.5, 0.5,
-3.552362, -3.510014, 0, 0, 1.5, 0.5, 0.5,
-3.552362, -3.510014, 2, 0, -0.5, 0.5, 0.5,
-3.552362, -3.510014, 2, 1, -0.5, 0.5, 0.5,
-3.552362, -3.510014, 2, 1, 1.5, 0.5, 0.5,
-3.552362, -3.510014, 2, 0, 1.5, 0.5, 0.5,
-3.552362, -3.510014, 4, 0, -0.5, 0.5, 0.5,
-3.552362, -3.510014, 4, 1, -0.5, 0.5, 0.5,
-3.552362, -3.510014, 4, 1, 1.5, 0.5, 0.5,
-3.552362, -3.510014, 4, 0, 1.5, 0.5, 0.5
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
-3.010977, -3.061622, -5.852288,
-3.010977, 2.916928, -5.852288,
-3.010977, -3.061622, 5.831233,
-3.010977, 2.916928, 5.831233,
-3.010977, -3.061622, -5.852288,
-3.010977, -3.061622, 5.831233,
-3.010977, 2.916928, -5.852288,
-3.010977, 2.916928, 5.831233,
-3.010977, -3.061622, -5.852288,
4.207483, -3.061622, -5.852288,
-3.010977, -3.061622, 5.831233,
4.207483, -3.061622, 5.831233,
-3.010977, 2.916928, -5.852288,
4.207483, 2.916928, -5.852288,
-3.010977, 2.916928, 5.831233,
4.207483, 2.916928, 5.831233,
4.207483, -3.061622, -5.852288,
4.207483, 2.916928, -5.852288,
4.207483, -3.061622, 5.831233,
4.207483, 2.916928, 5.831233,
4.207483, -3.061622, -5.852288,
4.207483, -3.061622, 5.831233,
4.207483, 2.916928, -5.852288,
4.207483, 2.916928, 5.831233
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
var radius = 7.9982;
var distance = 35.5849;
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
mvMatrix.translate( -0.5982531, 0.07234716, 0.01052761 );
mvMatrix.scale( 1.198013, 1.446473, 0.7401717 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.5849);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
oxaziclomefone<-read.table("oxaziclomefone.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-oxaziclomefone$V2
```

```
## Error in eval(expr, envir, enclos): object 'oxaziclomefone' not found
```

```r
y<-oxaziclomefone$V3
```

```
## Error in eval(expr, envir, enclos): object 'oxaziclomefone' not found
```

```r
z<-oxaziclomefone$V4
```

```
## Error in eval(expr, envir, enclos): object 'oxaziclomefone' not found
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
-2.905854, 1.399599, -1.276844, 0, 0, 1, 1, 1,
-2.891083, -1.089935, -1.283246, 1, 0, 0, 1, 1,
-2.884229, 0.9207327, -2.258029, 1, 0, 0, 1, 1,
-2.806135, 1.460542, 0.2750801, 1, 0, 0, 1, 1,
-2.701396, -1.949267, -1.487105, 1, 0, 0, 1, 1,
-2.650333, -1.146884, -1.221731, 1, 0, 0, 1, 1,
-2.593098, -0.0471746, -1.084909, 0, 0, 0, 1, 1,
-2.475263, -1.14823, -1.291736, 0, 0, 0, 1, 1,
-2.401868, 0.4276455, -1.565943, 0, 0, 0, 1, 1,
-2.353079, 1.287862, -1.023773, 0, 0, 0, 1, 1,
-2.351703, -0.555554, -1.931219, 0, 0, 0, 1, 1,
-2.278761, 0.7778972, -1.921458, 0, 0, 0, 1, 1,
-2.216844, -0.5907791, -1.934522, 0, 0, 0, 1, 1,
-2.215366, 0.3637198, -2.334121, 1, 1, 1, 1, 1,
-2.155072, -0.5607821, -1.614906, 1, 1, 1, 1, 1,
-2.105974, 0.9739345, 0.005341339, 1, 1, 1, 1, 1,
-2.101266, -0.7564691, -2.160236, 1, 1, 1, 1, 1,
-2.072382, 0.7681642, -2.941131, 1, 1, 1, 1, 1,
-2.054149, -0.6421324, -2.153185, 1, 1, 1, 1, 1,
-2.037178, 0.2056964, -1.479583, 1, 1, 1, 1, 1,
-2.012155, -0.4157009, -1.701364, 1, 1, 1, 1, 1,
-1.994414, -1.062856, -2.523964, 1, 1, 1, 1, 1,
-1.987334, 1.398649, -1.956675, 1, 1, 1, 1, 1,
-1.979273, 0.42435, -2.20445, 1, 1, 1, 1, 1,
-1.963884, 0.8887208, 0.6839433, 1, 1, 1, 1, 1,
-1.96293, 0.02790776, -2.533407, 1, 1, 1, 1, 1,
-1.94803, 0.1309071, -2.033422, 1, 1, 1, 1, 1,
-1.94468, -0.6681595, -2.315319, 1, 1, 1, 1, 1,
-1.913281, 0.3734065, -1.256139, 0, 0, 1, 1, 1,
-1.909346, 0.8081065, -3.149196, 1, 0, 0, 1, 1,
-1.900297, 1.296856, -1.048894, 1, 0, 0, 1, 1,
-1.877967, -0.3397913, -1.109661, 1, 0, 0, 1, 1,
-1.860036, 0.1996443, -2.489288, 1, 0, 0, 1, 1,
-1.856903, -1.324216, -3.815385, 1, 0, 0, 1, 1,
-1.852968, -0.5643083, -1.592607, 0, 0, 0, 1, 1,
-1.842658, 0.9736763, -0.8747476, 0, 0, 0, 1, 1,
-1.839227, -1.700966, -3.136781, 0, 0, 0, 1, 1,
-1.819514, -1.115797, -1.829389, 0, 0, 0, 1, 1,
-1.805381, -0.7309144, -2.503738, 0, 0, 0, 1, 1,
-1.795193, 0.6768289, -0.08301275, 0, 0, 0, 1, 1,
-1.768386, -0.09048502, -2.754704, 0, 0, 0, 1, 1,
-1.762809, -1.130741, -2.377431, 1, 1, 1, 1, 1,
-1.757335, -1.131902, -2.787773, 1, 1, 1, 1, 1,
-1.754711, 1.45223, 0.618918, 1, 1, 1, 1, 1,
-1.736759, 0.8264437, -0.426075, 1, 1, 1, 1, 1,
-1.736006, -1.332279, -3.106326, 1, 1, 1, 1, 1,
-1.73291, 1.22486, -1.143594, 1, 1, 1, 1, 1,
-1.732354, 0.1041373, -1.488422, 1, 1, 1, 1, 1,
-1.711148, 0.3295472, -1.316864, 1, 1, 1, 1, 1,
-1.705496, 0.9229255, 0.8294221, 1, 1, 1, 1, 1,
-1.699874, 1.330331, -1.351589, 1, 1, 1, 1, 1,
-1.664996, 1.374139, -2.747682, 1, 1, 1, 1, 1,
-1.648009, 1.323685, -0.2593972, 1, 1, 1, 1, 1,
-1.647112, -0.3729918, -1.167987, 1, 1, 1, 1, 1,
-1.646571, 0.08117587, -1.851686, 1, 1, 1, 1, 1,
-1.635191, -0.7340705, -1.592792, 1, 1, 1, 1, 1,
-1.633286, 0.2672663, -1.497818, 0, 0, 1, 1, 1,
-1.629117, 0.7036746, -2.784687, 1, 0, 0, 1, 1,
-1.625305, -1.447974, -1.612342, 1, 0, 0, 1, 1,
-1.612848, 0.308544, -0.820952, 1, 0, 0, 1, 1,
-1.610038, 0.2222846, -0.774911, 1, 0, 0, 1, 1,
-1.604858, -2.611555, -2.121634, 1, 0, 0, 1, 1,
-1.600131, 1.308555, -0.6661731, 0, 0, 0, 1, 1,
-1.599659, -0.1474635, -1.296346, 0, 0, 0, 1, 1,
-1.598223, -0.2489465, -3.312116, 0, 0, 0, 1, 1,
-1.598199, 1.566048, 1.108384, 0, 0, 0, 1, 1,
-1.595097, -0.8171745, -0.7112194, 0, 0, 0, 1, 1,
-1.590203, 0.6043381, -2.280397, 0, 0, 0, 1, 1,
-1.537423, -0.3302238, -1.266964, 0, 0, 0, 1, 1,
-1.533946, -0.5865853, -1.897768, 1, 1, 1, 1, 1,
-1.526219, 0.5284564, -1.690039, 1, 1, 1, 1, 1,
-1.497849, -0.6329852, -2.853324, 1, 1, 1, 1, 1,
-1.49198, -0.9608258, -1.983375, 1, 1, 1, 1, 1,
-1.483754, -0.3940387, -2.922157, 1, 1, 1, 1, 1,
-1.481526, 0.5582605, 0.2648188, 1, 1, 1, 1, 1,
-1.47695, -0.1288504, -0.1973252, 1, 1, 1, 1, 1,
-1.46515, -1.255356, -0.3742875, 1, 1, 1, 1, 1,
-1.460865, -0.4283925, -2.48316, 1, 1, 1, 1, 1,
-1.456869, 1.263178, -1.396154, 1, 1, 1, 1, 1,
-1.438672, 0.3697608, -1.104001, 1, 1, 1, 1, 1,
-1.437127, 0.6412659, 0.7730862, 1, 1, 1, 1, 1,
-1.434905, 1.304317, 0.1832284, 1, 1, 1, 1, 1,
-1.426703, 1.105104, -2.038818, 1, 1, 1, 1, 1,
-1.424839, 1.988632, -0.9386966, 1, 1, 1, 1, 1,
-1.424749, 0.3079186, -2.801284, 0, 0, 1, 1, 1,
-1.42289, -0.7743759, -2.147745, 1, 0, 0, 1, 1,
-1.412569, 0.01708726, -1.465369, 1, 0, 0, 1, 1,
-1.39645, -0.9840511, -1.500373, 1, 0, 0, 1, 1,
-1.394446, 1.235872, -1.258449, 1, 0, 0, 1, 1,
-1.384159, -1.981917, -2.009533, 1, 0, 0, 1, 1,
-1.367877, -1.65374, -2.914189, 0, 0, 0, 1, 1,
-1.366719, 0.2204316, -2.139198, 0, 0, 0, 1, 1,
-1.364078, -0.502254, -2.251345, 0, 0, 0, 1, 1,
-1.360222, 1.760588, -0.5303477, 0, 0, 0, 1, 1,
-1.356523, 0.04230191, -1.152579, 0, 0, 0, 1, 1,
-1.340481, -1.583892, -3.948033, 0, 0, 0, 1, 1,
-1.338756, 0.9907817, -1.59337, 0, 0, 0, 1, 1,
-1.334218, -1.513362, -3.027456, 1, 1, 1, 1, 1,
-1.333039, 0.5840862, 0.4634594, 1, 1, 1, 1, 1,
-1.327619, -0.3066097, -2.608415, 1, 1, 1, 1, 1,
-1.322948, -0.9094561, -3.790655, 1, 1, 1, 1, 1,
-1.322809, 1.552748, 0.3669276, 1, 1, 1, 1, 1,
-1.32225, 0.2675558, -1.980461, 1, 1, 1, 1, 1,
-1.320235, 0.3440147, -1.631841, 1, 1, 1, 1, 1,
-1.309425, -0.374722, -1.67668, 1, 1, 1, 1, 1,
-1.304869, 0.5939411, -2.391373, 1, 1, 1, 1, 1,
-1.297482, 0.4158097, -0.6985725, 1, 1, 1, 1, 1,
-1.297108, -1.252473, -1.443055, 1, 1, 1, 1, 1,
-1.293416, 1.531504, -0.2893482, 1, 1, 1, 1, 1,
-1.288487, 0.8953007, -1.916862, 1, 1, 1, 1, 1,
-1.287056, 0.2903315, -0.1698339, 1, 1, 1, 1, 1,
-1.284512, 0.1724162, 0.8396291, 1, 1, 1, 1, 1,
-1.278656, 0.6466393, -1.534478, 0, 0, 1, 1, 1,
-1.270934, 2.027181, -1.908399, 1, 0, 0, 1, 1,
-1.268416, -0.280885, -1.176778, 1, 0, 0, 1, 1,
-1.266071, -0.2149274, -0.7603447, 1, 0, 0, 1, 1,
-1.249819, -0.6525258, -2.196066, 1, 0, 0, 1, 1,
-1.233049, -1.173285, -2.460718, 1, 0, 0, 1, 1,
-1.23016, 1.218933, -1.26867, 0, 0, 0, 1, 1,
-1.227703, -0.8665603, -1.906954, 0, 0, 0, 1, 1,
-1.227615, -0.5225732, -0.7101543, 0, 0, 0, 1, 1,
-1.222783, -0.3559981, -1.103407, 0, 0, 0, 1, 1,
-1.205268, -0.3455418, -2.568769, 0, 0, 0, 1, 1,
-1.201491, -0.4018398, -1.45649, 0, 0, 0, 1, 1,
-1.199969, -0.1101321, -0.1892238, 0, 0, 0, 1, 1,
-1.198778, -0.1326084, -1.454939, 1, 1, 1, 1, 1,
-1.196893, 0.4673482, -2.331114, 1, 1, 1, 1, 1,
-1.194503, -0.994782, -1.37788, 1, 1, 1, 1, 1,
-1.192311, -2.690061, -5.682139, 1, 1, 1, 1, 1,
-1.190376, 1.541464, -1.18013, 1, 1, 1, 1, 1,
-1.180672, 1.495847, -0.7675306, 1, 1, 1, 1, 1,
-1.164405, -0.4248594, -1.430105, 1, 1, 1, 1, 1,
-1.158263, -2.884494, -2.538534, 1, 1, 1, 1, 1,
-1.152994, -0.3549298, -1.211621, 1, 1, 1, 1, 1,
-1.15208, -0.4417406, -1.718504, 1, 1, 1, 1, 1,
-1.147786, -0.005015093, -1.001904, 1, 1, 1, 1, 1,
-1.143156, 0.3305508, -2.399947, 1, 1, 1, 1, 1,
-1.140632, -1.962478, -2.450102, 1, 1, 1, 1, 1,
-1.137411, -2.420206, -2.975757, 1, 1, 1, 1, 1,
-1.131985, -0.2400514, -2.204434, 1, 1, 1, 1, 1,
-1.126122, 0.07179897, -1.232817, 0, 0, 1, 1, 1,
-1.124696, 0.04421664, -1.957549, 1, 0, 0, 1, 1,
-1.117959, 1.638921, -1.194898, 1, 0, 0, 1, 1,
-1.116872, -0.2719762, -1.727606, 1, 0, 0, 1, 1,
-1.114616, 1.195625, 0.1239833, 1, 0, 0, 1, 1,
-1.098589, 0.4034238, -1.941892, 1, 0, 0, 1, 1,
-1.097929, 0.0443619, -0.3930965, 0, 0, 0, 1, 1,
-1.081481, 0.4761457, 0.03016475, 0, 0, 0, 1, 1,
-1.068898, -1.154715, -2.114344, 0, 0, 0, 1, 1,
-1.054155, 0.03315728, -0.1415348, 0, 0, 0, 1, 1,
-1.050134, 0.2333298, -2.05021, 0, 0, 0, 1, 1,
-1.04958, 1.090375, -0.1209716, 0, 0, 0, 1, 1,
-1.047729, 1.077231, -2.560064, 0, 0, 0, 1, 1,
-1.044238, -1.213698, -2.893746, 1, 1, 1, 1, 1,
-1.04066, -0.6512833, -3.64067, 1, 1, 1, 1, 1,
-1.035159, -0.3181289, -1.763961, 1, 1, 1, 1, 1,
-1.034708, -0.7263917, -2.614713, 1, 1, 1, 1, 1,
-1.033555, 0.02660332, -0.4772241, 1, 1, 1, 1, 1,
-1.022732, -0.2216177, -0.4411392, 1, 1, 1, 1, 1,
-1.015447, 1.149594, -0.6966025, 1, 1, 1, 1, 1,
-1.014019, 1.317474, -2.283005, 1, 1, 1, 1, 1,
-1.00717, -0.3055418, -1.488893, 1, 1, 1, 1, 1,
-1.003199, 1.614481, -0.4231141, 1, 1, 1, 1, 1,
-0.9990884, -1.250789, -0.3783201, 1, 1, 1, 1, 1,
-0.9973809, -0.8007703, -3.631244, 1, 1, 1, 1, 1,
-0.9942555, -0.4465913, -1.481162, 1, 1, 1, 1, 1,
-0.9938029, -1.455932, -5.218373, 1, 1, 1, 1, 1,
-0.9935417, -0.6352902, -3.063812, 1, 1, 1, 1, 1,
-0.9824848, -1.345112, -2.869515, 0, 0, 1, 1, 1,
-0.9793856, 1.293404, -0.09084961, 1, 0, 0, 1, 1,
-0.9791654, 0.5012094, -1.741332, 1, 0, 0, 1, 1,
-0.973448, -0.9706671, -3.112869, 1, 0, 0, 1, 1,
-0.961566, -0.02774267, -1.164401, 1, 0, 0, 1, 1,
-0.9599302, -1.612738, -2.602362, 1, 0, 0, 1, 1,
-0.9565356, -0.08178509, -2.098945, 0, 0, 0, 1, 1,
-0.954314, -0.1239276, -1.648714, 0, 0, 0, 1, 1,
-0.9522185, 0.1317143, -1.742905, 0, 0, 0, 1, 1,
-0.939737, 0.9106547, -0.02887244, 0, 0, 0, 1, 1,
-0.9383369, -0.6401806, -2.492693, 0, 0, 0, 1, 1,
-0.9338249, 1.051484, -0.7184888, 0, 0, 0, 1, 1,
-0.9248419, -0.8203577, -1.992414, 0, 0, 0, 1, 1,
-0.9218661, -0.3544229, -1.825984, 1, 1, 1, 1, 1,
-0.9218181, 0.2964828, 0.1092275, 1, 1, 1, 1, 1,
-0.9189448, -1.487242, -2.446074, 1, 1, 1, 1, 1,
-0.9147184, 1.69246, -1.03341, 1, 1, 1, 1, 1,
-0.8966408, -0.476048, -3.271554, 1, 1, 1, 1, 1,
-0.8911303, 0.1364679, -1.762536, 1, 1, 1, 1, 1,
-0.8883631, -1.354542, -0.9364177, 1, 1, 1, 1, 1,
-0.8880742, 0.1956156, -1.403199, 1, 1, 1, 1, 1,
-0.8745156, -1.84702, -3.039975, 1, 1, 1, 1, 1,
-0.8712528, 0.6224729, 0.1089516, 1, 1, 1, 1, 1,
-0.8572885, 0.3494982, -0.756312, 1, 1, 1, 1, 1,
-0.8525705, -1.819558, -3.108014, 1, 1, 1, 1, 1,
-0.8517999, 2.678556, -0.1437923, 1, 1, 1, 1, 1,
-0.8449206, 0.1200905, -1.959633, 1, 1, 1, 1, 1,
-0.8282367, -0.2421069, -2.933536, 1, 1, 1, 1, 1,
-0.8252958, 2.048187, 0.2540381, 0, 0, 1, 1, 1,
-0.8242343, -0.5200837, -1.813157, 1, 0, 0, 1, 1,
-0.8190315, -0.0975219, -0.9539718, 1, 0, 0, 1, 1,
-0.8159612, -0.9538336, -2.215165, 1, 0, 0, 1, 1,
-0.8154946, 1.258766, -0.4058489, 1, 0, 0, 1, 1,
-0.8148222, -0.855646, -2.48042, 1, 0, 0, 1, 1,
-0.8082241, -0.4341245, -0.3153783, 0, 0, 0, 1, 1,
-0.8021348, -0.1467501, -2.060447, 0, 0, 0, 1, 1,
-0.8012151, 0.008480914, -1.521145, 0, 0, 0, 1, 1,
-0.7923268, -0.4001582, -3.015369, 0, 0, 0, 1, 1,
-0.7807984, -0.4678327, -4.150557, 0, 0, 0, 1, 1,
-0.7770699, 0.06169768, -2.080098, 0, 0, 0, 1, 1,
-0.7768942, 0.06772173, -3.828807, 0, 0, 0, 1, 1,
-0.7728941, -0.80497, -4.661735, 1, 1, 1, 1, 1,
-0.7716885, -0.6798747, -2.767958, 1, 1, 1, 1, 1,
-0.7657948, -0.02308911, -1.379543, 1, 1, 1, 1, 1,
-0.7652981, 0.8161101, -1.793624, 1, 1, 1, 1, 1,
-0.7599456, -0.03196825, -1.925905, 1, 1, 1, 1, 1,
-0.758534, 0.4955611, -0.834792, 1, 1, 1, 1, 1,
-0.7578782, 0.8507875, -0.260245, 1, 1, 1, 1, 1,
-0.7494342, 1.106757, -1.639964, 1, 1, 1, 1, 1,
-0.7468532, -0.713266, -3.43023, 1, 1, 1, 1, 1,
-0.7462847, 2.178778, 0.5953424, 1, 1, 1, 1, 1,
-0.7450976, -0.3791467, -2.345647, 1, 1, 1, 1, 1,
-0.7385703, 0.715949, 0.7330807, 1, 1, 1, 1, 1,
-0.7265046, 0.02054498, -1.802834, 1, 1, 1, 1, 1,
-0.7250004, 0.7502964, -1.378076, 1, 1, 1, 1, 1,
-0.7241855, 0.6865472, -0.2990099, 1, 1, 1, 1, 1,
-0.7220961, -0.1320096, -3.582497, 0, 0, 1, 1, 1,
-0.7168679, 0.6567803, 0.4801834, 1, 0, 0, 1, 1,
-0.7118812, -0.3363748, -0.8099949, 1, 0, 0, 1, 1,
-0.71071, 1.375095, -0.8257418, 1, 0, 0, 1, 1,
-0.7085689, -1.270699, -3.625505, 1, 0, 0, 1, 1,
-0.7080498, 0.7176691, -0.4384226, 1, 0, 0, 1, 1,
-0.7076011, 1.349931, -0.8697457, 0, 0, 0, 1, 1,
-0.7038879, -0.7168947, -1.517955, 0, 0, 0, 1, 1,
-0.7002678, 1.676095, -0.4243301, 0, 0, 0, 1, 1,
-0.6932444, 1.174669, 0.3186374, 0, 0, 0, 1, 1,
-0.6922143, -2.3433, -3.269275, 0, 0, 0, 1, 1,
-0.6920635, 2.145727, -0.9003559, 0, 0, 0, 1, 1,
-0.6879255, -0.7956599, -3.412259, 0, 0, 0, 1, 1,
-0.6833319, 0.3556929, -3.086897, 1, 1, 1, 1, 1,
-0.6788151, 1.424744, -0.2280521, 1, 1, 1, 1, 1,
-0.6776577, 1.073753, -0.466593, 1, 1, 1, 1, 1,
-0.6753725, -0.5972991, -1.561359, 1, 1, 1, 1, 1,
-0.6672097, 0.5198987, -1.972316, 1, 1, 1, 1, 1,
-0.6633586, -0.8551472, -1.356224, 1, 1, 1, 1, 1,
-0.6600338, 2.318805, 0.005659442, 1, 1, 1, 1, 1,
-0.6551862, -0.5231209, -1.598561, 1, 1, 1, 1, 1,
-0.6527727, 0.7405195, -1.062002, 1, 1, 1, 1, 1,
-0.6508583, 0.09993082, -1.759933, 1, 1, 1, 1, 1,
-0.6483999, -1.755435, -2.735128, 1, 1, 1, 1, 1,
-0.6454188, 0.7825338, -1.065385, 1, 1, 1, 1, 1,
-0.6443573, 0.03225029, -1.765275, 1, 1, 1, 1, 1,
-0.6442938, -1.212569, -2.932829, 1, 1, 1, 1, 1,
-0.6367415, -0.5333243, -2.815284, 1, 1, 1, 1, 1,
-0.6317006, 0.09302958, -0.1745956, 0, 0, 1, 1, 1,
-0.6297486, 0.6686456, -0.4567793, 1, 0, 0, 1, 1,
-0.6276406, 0.0743523, 0.1303914, 1, 0, 0, 1, 1,
-0.625858, 1.078976, -1.276134, 1, 0, 0, 1, 1,
-0.6249674, 0.3543869, -1.177893, 1, 0, 0, 1, 1,
-0.6241173, -0.0670817, -1.602602, 1, 0, 0, 1, 1,
-0.6204544, -0.335533, -1.329087, 0, 0, 0, 1, 1,
-0.6165586, 0.03800317, -2.295398, 0, 0, 0, 1, 1,
-0.6163472, 1.437365, -0.06798785, 0, 0, 0, 1, 1,
-0.6159703, -1.376823, -3.108901, 0, 0, 0, 1, 1,
-0.6143691, 0.02630462, -1.58803, 0, 0, 0, 1, 1,
-0.6127747, 1.244245, 0.484158, 0, 0, 0, 1, 1,
-0.6091282, -0.9164266, -4.046612, 0, 0, 0, 1, 1,
-0.6056432, -0.2461242, -2.812659, 1, 1, 1, 1, 1,
-0.6037796, -1.269877, -1.5729, 1, 1, 1, 1, 1,
-0.5983206, 0.3003555, -1.301144, 1, 1, 1, 1, 1,
-0.5980728, 1.607738, 0.189802, 1, 1, 1, 1, 1,
-0.5951149, -1.697144, -3.854945, 1, 1, 1, 1, 1,
-0.5905786, 0.5209376, -2.53195, 1, 1, 1, 1, 1,
-0.588703, -0.4541021, -2.361058, 1, 1, 1, 1, 1,
-0.5879302, -0.3350933, -2.991949, 1, 1, 1, 1, 1,
-0.5848464, -1.757357, -4.859824, 1, 1, 1, 1, 1,
-0.5821467, -1.250489, -3.472143, 1, 1, 1, 1, 1,
-0.5816556, -0.4469266, -1.55104, 1, 1, 1, 1, 1,
-0.5807112, -0.1711195, -1.937205, 1, 1, 1, 1, 1,
-0.5802028, -1.506963, -2.819561, 1, 1, 1, 1, 1,
-0.5742071, -0.3315253, -2.237983, 1, 1, 1, 1, 1,
-0.5718524, 0.7711895, -0.7692412, 1, 1, 1, 1, 1,
-0.5716739, 1.000164, -0.849411, 0, 0, 1, 1, 1,
-0.5708482, 0.8516196, -1.468111, 1, 0, 0, 1, 1,
-0.5680631, 1.203099, 0.8176343, 1, 0, 0, 1, 1,
-0.5657658, 0.9530286, -1.050128, 1, 0, 0, 1, 1,
-0.5613709, 0.4685102, -0.9552225, 1, 0, 0, 1, 1,
-0.5601877, 1.055649, -0.383272, 1, 0, 0, 1, 1,
-0.5597515, 0.794189, 0.6389676, 0, 0, 0, 1, 1,
-0.5568174, 2.038305, 1.581487, 0, 0, 0, 1, 1,
-0.5567414, 1.404786, -1.335421, 0, 0, 0, 1, 1,
-0.5523868, -0.8261516, -2.23756, 0, 0, 0, 1, 1,
-0.5488556, 1.494144, 0.6006422, 0, 0, 0, 1, 1,
-0.5466505, 0.3797739, -1.365828, 0, 0, 0, 1, 1,
-0.5447317, -0.02700291, -0.9630258, 0, 0, 0, 1, 1,
-0.5296083, -0.3312919, -1.154548, 1, 1, 1, 1, 1,
-0.5193816, 0.2562358, -1.858971, 1, 1, 1, 1, 1,
-0.5168299, -0.2850658, -1.72963, 1, 1, 1, 1, 1,
-0.5119365, -0.4513436, -1.555279, 1, 1, 1, 1, 1,
-0.511236, 0.993973, -0.3009743, 1, 1, 1, 1, 1,
-0.5106267, 0.06411348, -0.891547, 1, 1, 1, 1, 1,
-0.5077863, 1.529106, -0.8387468, 1, 1, 1, 1, 1,
-0.5071103, -0.3483839, -1.99153, 1, 1, 1, 1, 1,
-0.5000358, 0.9464929, 0.455755, 1, 1, 1, 1, 1,
-0.4978605, 1.737355, -0.9853898, 1, 1, 1, 1, 1,
-0.4945151, -0.3948214, -1.670286, 1, 1, 1, 1, 1,
-0.4867426, -0.5386934, -2.846262, 1, 1, 1, 1, 1,
-0.4850689, -0.1853452, -1.24468, 1, 1, 1, 1, 1,
-0.4828045, -1.09423, -1.620272, 1, 1, 1, 1, 1,
-0.4821635, -0.2292496, -0.945689, 1, 1, 1, 1, 1,
-0.4804823, -0.7890674, -3.584644, 0, 0, 1, 1, 1,
-0.4796897, -1.024127, -3.038138, 1, 0, 0, 1, 1,
-0.4781407, -0.779828, -1.74716, 1, 0, 0, 1, 1,
-0.477935, -1.348843, -2.196663, 1, 0, 0, 1, 1,
-0.4724239, -1.102071, -2.594295, 1, 0, 0, 1, 1,
-0.4687249, -0.4443928, -0.6860116, 1, 0, 0, 1, 1,
-0.4680172, -0.9244033, -1.763228, 0, 0, 0, 1, 1,
-0.467913, 0.8103088, -2.714981, 0, 0, 0, 1, 1,
-0.4678015, 0.01072055, -1.145906, 0, 0, 0, 1, 1,
-0.4647232, 1.465898, -0.240669, 0, 0, 0, 1, 1,
-0.458873, -1.28428, -2.995907, 0, 0, 0, 1, 1,
-0.4570543, 0.5441006, -1.114805, 0, 0, 0, 1, 1,
-0.456008, -0.7748469, -5.033266, 0, 0, 0, 1, 1,
-0.4559138, -0.2986211, -4.956555, 1, 1, 1, 1, 1,
-0.4559124, -0.4746086, -4.579994, 1, 1, 1, 1, 1,
-0.4551771, 0.8449426, -2.059653, 1, 1, 1, 1, 1,
-0.4531193, 0.5545121, -1.524396, 1, 1, 1, 1, 1,
-0.4492897, -1.892788, -3.018347, 1, 1, 1, 1, 1,
-0.4421484, -1.123914, -2.504721, 1, 1, 1, 1, 1,
-0.4367475, -0.2839861, -1.239338, 1, 1, 1, 1, 1,
-0.4341195, -0.9762048, -5.198029, 1, 1, 1, 1, 1,
-0.43363, -1.658142, -3.771727, 1, 1, 1, 1, 1,
-0.4330068, -0.6937597, -3.89118, 1, 1, 1, 1, 1,
-0.4319784, -0.4541423, -1.065649, 1, 1, 1, 1, 1,
-0.4316096, 0.3935701, -1.670851, 1, 1, 1, 1, 1,
-0.431493, -0.709904, -1.25877, 1, 1, 1, 1, 1,
-0.4308274, -0.9836037, -3.583248, 1, 1, 1, 1, 1,
-0.4295784, 0.837375, -2.444893, 1, 1, 1, 1, 1,
-0.4281645, 0.6323631, -1.225565, 0, 0, 1, 1, 1,
-0.427153, -1.302991, -2.68631, 1, 0, 0, 1, 1,
-0.4263584, 1.050949, 0.04764242, 1, 0, 0, 1, 1,
-0.4239657, -0.8423803, -3.623131, 1, 0, 0, 1, 1,
-0.4215105, 0.5549051, -1.344995, 1, 0, 0, 1, 1,
-0.4211949, -0.6393058, -2.024262, 1, 0, 0, 1, 1,
-0.4195569, 1.277395, 0.4908629, 0, 0, 0, 1, 1,
-0.4121093, -0.5469348, -2.58374, 0, 0, 0, 1, 1,
-0.4108405, -0.5485398, -1.508925, 0, 0, 0, 1, 1,
-0.408257, 0.3009315, -2.005298, 0, 0, 0, 1, 1,
-0.4072487, -0.150412, -2.455035, 0, 0, 0, 1, 1,
-0.4059623, 0.752459, -1.435385, 0, 0, 0, 1, 1,
-0.4027564, -1.031874, -3.13137, 0, 0, 0, 1, 1,
-0.3943891, -0.9058378, -1.557828, 1, 1, 1, 1, 1,
-0.3906519, -1.008114, -1.632004, 1, 1, 1, 1, 1,
-0.3906055, -1.934576, -1.864374, 1, 1, 1, 1, 1,
-0.3819109, -0.3019344, -2.233138, 1, 1, 1, 1, 1,
-0.3818992, -0.2450077, -1.640092, 1, 1, 1, 1, 1,
-0.3754234, -0.8647144, -2.02124, 1, 1, 1, 1, 1,
-0.374466, 0.9128259, -0.7067534, 1, 1, 1, 1, 1,
-0.3742004, 1.807279, -0.6727039, 1, 1, 1, 1, 1,
-0.3724263, -0.6327035, -3.441726, 1, 1, 1, 1, 1,
-0.3699106, -0.7011703, -0.8226371, 1, 1, 1, 1, 1,
-0.3669813, 0.1708984, -1.807282, 1, 1, 1, 1, 1,
-0.3669457, 0.3920929, -0.7950742, 1, 1, 1, 1, 1,
-0.3583212, -0.3220462, -1.519483, 1, 1, 1, 1, 1,
-0.357747, -1.028461, -1.441837, 1, 1, 1, 1, 1,
-0.3567778, 1.477966, -1.191659, 1, 1, 1, 1, 1,
-0.3526916, 0.4298054, -0.889191, 0, 0, 1, 1, 1,
-0.3525875, -0.1952638, -2.462907, 1, 0, 0, 1, 1,
-0.3524555, 0.9806744, -0.2505325, 1, 0, 0, 1, 1,
-0.3506803, -0.2087345, -1.941797, 1, 0, 0, 1, 1,
-0.3505573, 1.028253, -1.165438, 1, 0, 0, 1, 1,
-0.3472036, 0.5878833, -2.04069, 1, 0, 0, 1, 1,
-0.3417887, 0.1354753, -1.373971, 0, 0, 0, 1, 1,
-0.3410651, 0.02991843, -2.413969, 0, 0, 0, 1, 1,
-0.3351412, 0.00449377, -2.945231, 0, 0, 0, 1, 1,
-0.3348833, 0.4116185, -2.457653, 0, 0, 0, 1, 1,
-0.3343872, 0.2097388, -1.720286, 0, 0, 0, 1, 1,
-0.3341534, -0.9231687, -1.621387, 0, 0, 0, 1, 1,
-0.3335353, -0.5809165, -3.805732, 0, 0, 0, 1, 1,
-0.3288658, 0.3807587, -2.233998, 1, 1, 1, 1, 1,
-0.326613, -0.4026807, -2.367525, 1, 1, 1, 1, 1,
-0.3226771, 0.5854421, -1.20632, 1, 1, 1, 1, 1,
-0.3219296, -0.3087606, -1.781348, 1, 1, 1, 1, 1,
-0.3201671, -0.2485807, 0.7828956, 1, 1, 1, 1, 1,
-0.3097855, 1.051975, 1.090253, 1, 1, 1, 1, 1,
-0.3092469, 0.2289901, -1.161115, 1, 1, 1, 1, 1,
-0.3076059, 0.5661824, -2.00657, 1, 1, 1, 1, 1,
-0.2998274, 0.4500977, -0.7525856, 1, 1, 1, 1, 1,
-0.2970484, 0.7000618, -0.1009622, 1, 1, 1, 1, 1,
-0.2907797, 0.2146971, -0.6270666, 1, 1, 1, 1, 1,
-0.2854463, 1.187868, -1.117641, 1, 1, 1, 1, 1,
-0.2843217, -0.1037789, -1.060832, 1, 1, 1, 1, 1,
-0.2810458, 0.03029672, -1.668179, 1, 1, 1, 1, 1,
-0.2794564, 0.6760477, -0.3962687, 1, 1, 1, 1, 1,
-0.2727852, 0.7811424, 0.4329466, 0, 0, 1, 1, 1,
-0.27176, -1.363529, -4.318569, 1, 0, 0, 1, 1,
-0.2680331, -2.431314, -3.225366, 1, 0, 0, 1, 1,
-0.2644572, 0.2167965, -0.6138082, 1, 0, 0, 1, 1,
-0.2614137, 0.1970776, -1.115001, 1, 0, 0, 1, 1,
-0.2583871, 0.2529896, -2.002407, 1, 0, 0, 1, 1,
-0.2577729, 0.1659557, -0.3785316, 0, 0, 0, 1, 1,
-0.2492276, 0.8839087, -0.4668465, 0, 0, 0, 1, 1,
-0.2488789, -0.7639682, -1.621518, 0, 0, 0, 1, 1,
-0.2479866, 1.317476, -0.2733102, 0, 0, 0, 1, 1,
-0.2417026, -0.3092456, -2.294921, 0, 0, 0, 1, 1,
-0.2404274, 0.8886216, -0.6801995, 0, 0, 0, 1, 1,
-0.2367943, -0.6059414, -0.7764137, 0, 0, 0, 1, 1,
-0.2347268, 0.004781947, -2.526783, 1, 1, 1, 1, 1,
-0.2342796, -0.236763, -3.019415, 1, 1, 1, 1, 1,
-0.2337945, 1.071055, 1.715333, 1, 1, 1, 1, 1,
-0.2336372, 1.185071, -0.04594295, 1, 1, 1, 1, 1,
-0.2309386, 1.631903, -1.896963, 1, 1, 1, 1, 1,
-0.2257387, -0.2609084, -3.954936, 1, 1, 1, 1, 1,
-0.2241043, -0.7135479, -3.062011, 1, 1, 1, 1, 1,
-0.2234587, 1.009167, 0.846482, 1, 1, 1, 1, 1,
-0.213691, 0.8779603, -0.8284043, 1, 1, 1, 1, 1,
-0.2098866, 1.034559, 0.1209562, 1, 1, 1, 1, 1,
-0.2086655, -0.7719041, -1.610662, 1, 1, 1, 1, 1,
-0.20861, -0.2172938, -1.786574, 1, 1, 1, 1, 1,
-0.2042831, -0.3901409, -3.218811, 1, 1, 1, 1, 1,
-0.2026925, 2.31171, 1.591506, 1, 1, 1, 1, 1,
-0.202127, -0.3563384, -1.771445, 1, 1, 1, 1, 1,
-0.1970377, -1.354167, -4.569014, 0, 0, 1, 1, 1,
-0.1954375, 1.682564, 0.2586321, 1, 0, 0, 1, 1,
-0.1930711, 0.3056995, -1.440551, 1, 0, 0, 1, 1,
-0.1878698, 0.4478869, -0.5071281, 1, 0, 0, 1, 1,
-0.1754997, 0.5870185, -0.5846024, 1, 0, 0, 1, 1,
-0.174137, 0.6985795, 1.071612, 1, 0, 0, 1, 1,
-0.1724339, -0.9618497, -2.366504, 0, 0, 0, 1, 1,
-0.1719618, -1.623333, -3.918424, 0, 0, 0, 1, 1,
-0.1663161, -0.9606394, -3.118545, 0, 0, 0, 1, 1,
-0.1644204, 0.7210221, -1.872367, 0, 0, 0, 1, 1,
-0.1625196, -0.6685128, -2.854086, 0, 0, 0, 1, 1,
-0.1587487, -0.4416839, -5.109788, 0, 0, 0, 1, 1,
-0.1545329, -0.001641364, -0.07658477, 0, 0, 0, 1, 1,
-0.1541293, -0.6983255, -4.52979, 1, 1, 1, 1, 1,
-0.1514451, 0.03164509, -1.716105, 1, 1, 1, 1, 1,
-0.151263, 2.540337, -0.2405044, 1, 1, 1, 1, 1,
-0.1503778, 0.1339438, -0.9724874, 1, 1, 1, 1, 1,
-0.1476882, 0.009722572, -1.72383, 1, 1, 1, 1, 1,
-0.1471239, -2.081169, -2.813946, 1, 1, 1, 1, 1,
-0.1437329, -0.4726523, -3.921616, 1, 1, 1, 1, 1,
-0.1414074, 0.8617529, -0.5248601, 1, 1, 1, 1, 1,
-0.1404467, -1.391681, -2.640991, 1, 1, 1, 1, 1,
-0.1386992, -0.9228844, -3.668416, 1, 1, 1, 1, 1,
-0.1358454, -0.1541543, -3.863961, 1, 1, 1, 1, 1,
-0.1348368, -0.9807721, -4.227038, 1, 1, 1, 1, 1,
-0.132647, -0.2650898, -2.46611, 1, 1, 1, 1, 1,
-0.1321602, -0.8075373, -3.293394, 1, 1, 1, 1, 1,
-0.1318717, -0.7565353, -2.898097, 1, 1, 1, 1, 1,
-0.1316794, 0.364858, -0.7288557, 0, 0, 1, 1, 1,
-0.1300308, 0.9817629, -0.8954927, 1, 0, 0, 1, 1,
-0.1283197, -1.023217, -3.136662, 1, 0, 0, 1, 1,
-0.12728, 0.7210364, -0.6359375, 1, 0, 0, 1, 1,
-0.1230619, 2.053044, -1.395231, 1, 0, 0, 1, 1,
-0.1224483, -0.7867984, -3.420185, 1, 0, 0, 1, 1,
-0.1220279, 0.6704969, -0.007814351, 0, 0, 0, 1, 1,
-0.1207035, 0.6411605, -0.6168488, 0, 0, 0, 1, 1,
-0.1172168, -0.8534586, -2.514554, 0, 0, 0, 1, 1,
-0.1152209, -0.4398794, -3.276731, 0, 0, 0, 1, 1,
-0.1151393, -0.645366, -3.000657, 0, 0, 0, 1, 1,
-0.1132316, 1.119954, 0.8546119, 0, 0, 0, 1, 1,
-0.110325, -0.6112059, -2.720775, 0, 0, 0, 1, 1,
-0.1084428, -0.2729513, -3.646196, 1, 1, 1, 1, 1,
-0.1081737, 0.06923677, -1.081065, 1, 1, 1, 1, 1,
-0.1079682, -0.3785013, -1.756807, 1, 1, 1, 1, 1,
-0.1072031, 0.2498479, 1.382607, 1, 1, 1, 1, 1,
-0.08996229, -0.6560695, -3.502762, 1, 1, 1, 1, 1,
-0.08975392, -1.442381, -3.016157, 1, 1, 1, 1, 1,
-0.08809743, -2.285091, -2.584858, 1, 1, 1, 1, 1,
-0.08726782, 0.5172648, -1.381102, 1, 1, 1, 1, 1,
-0.08538979, -0.8023607, -3.444036, 1, 1, 1, 1, 1,
-0.08379498, 0.6133154, 0.6928208, 1, 1, 1, 1, 1,
-0.08270209, -1.066442, -2.957006, 1, 1, 1, 1, 1,
-0.0780941, -0.05925316, -2.904742, 1, 1, 1, 1, 1,
-0.07747731, -0.6831273, -2.723817, 1, 1, 1, 1, 1,
-0.07720658, -0.157598, -1.910123, 1, 1, 1, 1, 1,
-0.07688273, -0.2760358, -2.530553, 1, 1, 1, 1, 1,
-0.07085399, -0.3214816, -3.340107, 0, 0, 1, 1, 1,
-0.06690668, 0.6882535, -1.660236, 1, 0, 0, 1, 1,
-0.06620079, 0.3919635, -0.6894524, 1, 0, 0, 1, 1,
-0.06368713, -0.4884444, -3.475985, 1, 0, 0, 1, 1,
-0.06180327, 0.4751151, 0.9246324, 1, 0, 0, 1, 1,
-0.06035459, -1.473984, -2.632787, 1, 0, 0, 1, 1,
-0.05753566, -0.1837241, -2.710639, 0, 0, 0, 1, 1,
-0.05557168, 0.8429753, -1.21745, 0, 0, 0, 1, 1,
-0.04429346, -1.276622, -1.252016, 0, 0, 0, 1, 1,
-0.04202265, -1.479645, -4.285476, 0, 0, 0, 1, 1,
-0.04153185, 1.070929, 0.9474791, 0, 0, 0, 1, 1,
-0.03819511, 0.5584719, 0.1816384, 0, 0, 0, 1, 1,
-0.03795868, 1.909998, -1.402635, 0, 0, 0, 1, 1,
-0.03755517, 0.1127627, 0.2628286, 1, 1, 1, 1, 1,
-0.03478908, -1.358424, -4.302579, 1, 1, 1, 1, 1,
-0.02401749, -0.1808383, -3.800096, 1, 1, 1, 1, 1,
-0.02211939, 1.423899, -1.28638, 1, 1, 1, 1, 1,
-0.01644449, -0.900942, -3.67978, 1, 1, 1, 1, 1,
-0.006517527, -0.1759179, -3.132902, 1, 1, 1, 1, 1,
-0.002749165, -0.910069, -3.164198, 1, 1, 1, 1, 1,
0.01200325, 0.4806701, -1.895891, 1, 1, 1, 1, 1,
0.01323391, 0.6242418, -0.3306618, 1, 1, 1, 1, 1,
0.01470432, 0.2835079, 0.3383144, 1, 1, 1, 1, 1,
0.01772273, 0.5555374, -1.010291, 1, 1, 1, 1, 1,
0.01859909, -1.324827, 2.208347, 1, 1, 1, 1, 1,
0.02123684, 1.464077, 0.139451, 1, 1, 1, 1, 1,
0.02216577, -0.1305889, 4.25623, 1, 1, 1, 1, 1,
0.02356827, -1.080589, 2.799984, 1, 1, 1, 1, 1,
0.02411743, -0.009688364, 2.07705, 0, 0, 1, 1, 1,
0.02694057, -1.340097, 1.514675, 1, 0, 0, 1, 1,
0.03114572, 0.781978, 1.465583, 1, 0, 0, 1, 1,
0.04105371, -0.6213798, 2.371272, 1, 0, 0, 1, 1,
0.04113901, -0.01163724, 1.00908, 1, 0, 0, 1, 1,
0.04434169, -0.9307288, 3.125532, 1, 0, 0, 1, 1,
0.0477398, 2.265244, -0.7283128, 0, 0, 0, 1, 1,
0.05184784, 1.084316, 1.443915, 0, 0, 0, 1, 1,
0.05215894, -0.6054351, 3.633985, 0, 0, 0, 1, 1,
0.05368825, -0.2341706, 3.045864, 0, 0, 0, 1, 1,
0.05549771, 0.07660417, 1.60462, 0, 0, 0, 1, 1,
0.05962863, -0.6653038, 2.933694, 0, 0, 0, 1, 1,
0.06763919, 0.745647, -0.08401196, 0, 0, 0, 1, 1,
0.06899571, 1.390095, 0.8026229, 1, 1, 1, 1, 1,
0.06970336, -0.3937301, 3.672923, 1, 1, 1, 1, 1,
0.07167755, -0.313114, 4.23879, 1, 1, 1, 1, 1,
0.07270887, 1.142003, 0.3300879, 1, 1, 1, 1, 1,
0.07318279, 1.948442, -1.586935, 1, 1, 1, 1, 1,
0.07860332, 0.2352345, 0.3463608, 1, 1, 1, 1, 1,
0.08071154, 0.3400756, 0.5229889, 1, 1, 1, 1, 1,
0.08110419, -0.1394879, 4.135772, 1, 1, 1, 1, 1,
0.08119732, -0.650071, 1.769495, 1, 1, 1, 1, 1,
0.0814869, -0.7719823, 3.229961, 1, 1, 1, 1, 1,
0.08223284, 0.2613145, 0.2928821, 1, 1, 1, 1, 1,
0.08367481, 1.042975, -0.1385415, 1, 1, 1, 1, 1,
0.08845906, 0.463962, 0.7816942, 1, 1, 1, 1, 1,
0.08969031, 0.7836263, -1.983434, 1, 1, 1, 1, 1,
0.09553874, -0.7828156, 5.661084, 1, 1, 1, 1, 1,
0.09644848, -0.330842, 1.603426, 0, 0, 1, 1, 1,
0.1005112, 0.3602337, -0.788529, 1, 0, 0, 1, 1,
0.1028804, -0.5700416, 0.8155167, 1, 0, 0, 1, 1,
0.1031466, -0.3710349, 3.493279, 1, 0, 0, 1, 1,
0.1067987, -0.5821308, 1.378524, 1, 0, 0, 1, 1,
0.1091013, 0.6198723, -1.363326, 1, 0, 0, 1, 1,
0.1102414, -0.7773902, 3.918602, 0, 0, 0, 1, 1,
0.1120245, 0.97334, -1.281732, 0, 0, 0, 1, 1,
0.1136027, -0.03773468, 0.7020339, 0, 0, 0, 1, 1,
0.1186074, 0.4880358, -0.9719164, 0, 0, 0, 1, 1,
0.1188337, -2.260798, 4.312346, 0, 0, 0, 1, 1,
0.1196792, 0.5288276, -1.221531, 0, 0, 0, 1, 1,
0.119953, -0.2531115, 0.7136756, 0, 0, 0, 1, 1,
0.1203664, -0.3787498, 1.332807, 1, 1, 1, 1, 1,
0.1236325, -0.5903468, 2.442485, 1, 1, 1, 1, 1,
0.1265954, 0.8091627, -1.020254, 1, 1, 1, 1, 1,
0.1274565, -0.2167441, 1.222557, 1, 1, 1, 1, 1,
0.1314748, 1.28829, 1.284111, 1, 1, 1, 1, 1,
0.132278, 1.5071, -0.2478376, 1, 1, 1, 1, 1,
0.139765, -0.7904752, 4.79353, 1, 1, 1, 1, 1,
0.1428815, -0.6946018, 3.079221, 1, 1, 1, 1, 1,
0.1478398, 1.575814, 1.864048, 1, 1, 1, 1, 1,
0.1482761, 0.4663962, -0.4754333, 1, 1, 1, 1, 1,
0.149647, 0.5023297, 0.07272813, 1, 1, 1, 1, 1,
0.1519065, 0.8820773, 0.4441939, 1, 1, 1, 1, 1,
0.1520707, 1.219661, -1.250094, 1, 1, 1, 1, 1,
0.1566246, -0.5051811, 2.739903, 1, 1, 1, 1, 1,
0.1637618, 1.811192, -1.210386, 1, 1, 1, 1, 1,
0.1642242, -0.1471846, 2.352427, 0, 0, 1, 1, 1,
0.1666524, -0.5142706, 1.618082, 1, 0, 0, 1, 1,
0.1674, -0.530165, 2.006353, 1, 0, 0, 1, 1,
0.1709415, 0.2533469, 0.6940557, 1, 0, 0, 1, 1,
0.1720984, -0.2133036, 3.091011, 1, 0, 0, 1, 1,
0.1763004, -0.6646464, 0.9835936, 1, 0, 0, 1, 1,
0.1799926, 1.107775, 0.5793262, 0, 0, 0, 1, 1,
0.1802154, -0.8697707, 1.952865, 0, 0, 0, 1, 1,
0.1818558, 1.592755, 0.4300318, 0, 0, 0, 1, 1,
0.1826511, 0.5590701, 0.6323865, 0, 0, 0, 1, 1,
0.1863778, -1.021847, 2.697844, 0, 0, 0, 1, 1,
0.1920253, -0.3461704, 2.512256, 0, 0, 0, 1, 1,
0.1921229, -0.007866386, 0.7793421, 0, 0, 0, 1, 1,
0.1960595, 0.2631025, 1.064138, 1, 1, 1, 1, 1,
0.1974617, 0.89442, 0.7146606, 1, 1, 1, 1, 1,
0.1979375, -0.3761501, 2.370306, 1, 1, 1, 1, 1,
0.2032839, -0.5449765, 2.885033, 1, 1, 1, 1, 1,
0.2097364, 0.3659388, -0.4085537, 1, 1, 1, 1, 1,
0.2147426, -0.07577165, 1.594435, 1, 1, 1, 1, 1,
0.2168773, 0.1355521, 1.580072, 1, 1, 1, 1, 1,
0.2180581, 1.647341, 1.602212, 1, 1, 1, 1, 1,
0.2205815, 0.1572314, 0.6976702, 1, 1, 1, 1, 1,
0.2230727, -0.4490107, 1.589574, 1, 1, 1, 1, 1,
0.2236177, 0.05522043, 4.624585, 1, 1, 1, 1, 1,
0.228175, 0.8015856, 0.5065456, 1, 1, 1, 1, 1,
0.2302002, -0.630405, 2.494925, 1, 1, 1, 1, 1,
0.230904, -0.1387646, 1.25706, 1, 1, 1, 1, 1,
0.2331541, -0.9572715, 1.647694, 1, 1, 1, 1, 1,
0.2367567, -0.9034806, 4.712805, 0, 0, 1, 1, 1,
0.2368395, 0.2439846, 2.864029, 1, 0, 0, 1, 1,
0.2386311, -1.377812, 2.431232, 1, 0, 0, 1, 1,
0.2440751, -0.7452957, 2.550231, 1, 0, 0, 1, 1,
0.2460057, 1.914677, 1.259218, 1, 0, 0, 1, 1,
0.2463818, -0.7597378, 1.679214, 1, 0, 0, 1, 1,
0.2500108, -0.5763834, 1.808529, 0, 0, 0, 1, 1,
0.2513565, 0.4202512, 1.451399, 0, 0, 0, 1, 1,
0.2610026, 0.1594187, 0.7766184, 0, 0, 0, 1, 1,
0.2694893, 0.148606, 0.7504936, 0, 0, 0, 1, 1,
0.2697629, 0.625888, -1.312485, 0, 0, 0, 1, 1,
0.2697632, 0.5456529, 0.9621, 0, 0, 0, 1, 1,
0.2698255, 0.8533592, 0.05456156, 0, 0, 0, 1, 1,
0.2702011, 0.8607401, -0.2785977, 1, 1, 1, 1, 1,
0.2743143, -1.286372, 2.71894, 1, 1, 1, 1, 1,
0.2748177, 0.04743566, 0.6740457, 1, 1, 1, 1, 1,
0.2785141, -0.05059289, 2.676808, 1, 1, 1, 1, 1,
0.2800263, -1.415871, 2.980829, 1, 1, 1, 1, 1,
0.2801029, -0.8293896, 2.087457, 1, 1, 1, 1, 1,
0.2811921, -1.266543, 3.60006, 1, 1, 1, 1, 1,
0.2817211, -2.168429, 3.40016, 1, 1, 1, 1, 1,
0.2906536, -1.628241, 2.574419, 1, 1, 1, 1, 1,
0.2911481, -0.1386431, 3.250091, 1, 1, 1, 1, 1,
0.2932006, 1.363422, 0.625362, 1, 1, 1, 1, 1,
0.296461, -1.068072, 1.803573, 1, 1, 1, 1, 1,
0.2981803, -0.4718369, 1.499321, 1, 1, 1, 1, 1,
0.298541, -1.191719, 2.155739, 1, 1, 1, 1, 1,
0.2986159, 0.6410863, -0.1027953, 1, 1, 1, 1, 1,
0.2999, -0.04894451, 1.950636, 0, 0, 1, 1, 1,
0.3001056, 2.829862, 1.299049, 1, 0, 0, 1, 1,
0.3008462, 0.5951847, 0.9200582, 1, 0, 0, 1, 1,
0.3021587, 1.259324, -0.3444653, 1, 0, 0, 1, 1,
0.3027734, 0.7943063, -0.3057659, 1, 0, 0, 1, 1,
0.3083922, -0.04725125, 1.673499, 1, 0, 0, 1, 1,
0.3125399, -0.8642643, 4.098457, 0, 0, 0, 1, 1,
0.3169341, -1.338626, 3.460818, 0, 0, 0, 1, 1,
0.3170956, 0.3086609, -1.039416, 0, 0, 0, 1, 1,
0.3318039, 0.6521597, 0.8195624, 0, 0, 0, 1, 1,
0.3344986, -0.225073, 0.8337935, 0, 0, 0, 1, 1,
0.3357849, -0.3131842, 1.38763, 0, 0, 0, 1, 1,
0.3415071, 1.236309, -0.3630613, 0, 0, 0, 1, 1,
0.3422735, -0.696009, 1.601308, 1, 1, 1, 1, 1,
0.3424828, 1.652547, 0.189859, 1, 1, 1, 1, 1,
0.346306, 1.206731, 0.7101141, 1, 1, 1, 1, 1,
0.3474037, -0.1627507, 1.077089, 1, 1, 1, 1, 1,
0.3500582, 0.2462377, -0.304841, 1, 1, 1, 1, 1,
0.3563641, 0.4876905, -0.2539596, 1, 1, 1, 1, 1,
0.3579797, -0.7879018, 1.859239, 1, 1, 1, 1, 1,
0.3596081, 0.7573074, 0.6526622, 1, 1, 1, 1, 1,
0.3666182, -1.262469, 2.500384, 1, 1, 1, 1, 1,
0.3703915, 0.2734886, -0.2624284, 1, 1, 1, 1, 1,
0.3817199, -0.6691787, 1.814698, 1, 1, 1, 1, 1,
0.3847804, -2.176974, 2.775815, 1, 1, 1, 1, 1,
0.3935778, 0.1811923, 1.229934, 1, 1, 1, 1, 1,
0.395427, 0.03324142, 0.5045432, 1, 1, 1, 1, 1,
0.4018817, 0.09152921, -0.1423178, 1, 1, 1, 1, 1,
0.4028979, 0.364656, 0.5321109, 0, 0, 1, 1, 1,
0.4041145, 1.442138, -0.8108783, 1, 0, 0, 1, 1,
0.405975, -0.8151923, 2.403915, 1, 0, 0, 1, 1,
0.4065591, 0.4614606, 2.089412, 1, 0, 0, 1, 1,
0.4085617, 0.5212654, 0.2467034, 1, 0, 0, 1, 1,
0.4134209, -0.2445408, 2.453989, 1, 0, 0, 1, 1,
0.4140789, -0.3137251, 2.830382, 0, 0, 0, 1, 1,
0.4147917, 1.184259, -1.029068, 0, 0, 0, 1, 1,
0.416513, 2.145415, 1.226424, 0, 0, 0, 1, 1,
0.4183801, -0.005283566, 3.326016, 0, 0, 0, 1, 1,
0.4208138, 1.028809, -0.4624391, 0, 0, 0, 1, 1,
0.4222921, 0.2510506, 0.7247596, 0, 0, 0, 1, 1,
0.4236761, 0.04758596, 1.917421, 0, 0, 0, 1, 1,
0.4247193, 1.311803, 0.4955347, 1, 1, 1, 1, 1,
0.4253429, -0.8943387, 1.396059, 1, 1, 1, 1, 1,
0.4255489, -0.00491621, 1.274126, 1, 1, 1, 1, 1,
0.4297815, -1.617298, 3.487486, 1, 1, 1, 1, 1,
0.4299442, -0.5044847, 0.9703544, 1, 1, 1, 1, 1,
0.4341166, 0.1938611, -0.2341221, 1, 1, 1, 1, 1,
0.4371403, 0.4391329, 0.783406, 1, 1, 1, 1, 1,
0.4383412, -0.8423047, 3.440247, 1, 1, 1, 1, 1,
0.4391477, -1.102207, 3.129464, 1, 1, 1, 1, 1,
0.4394279, 0.3501027, -0.9569185, 1, 1, 1, 1, 1,
0.4423441, -0.9746597, 2.63459, 1, 1, 1, 1, 1,
0.4435762, 0.1019747, 0.8887892, 1, 1, 1, 1, 1,
0.4457505, -0.5459151, 2.019022, 1, 1, 1, 1, 1,
0.4464409, -2.046116, 2.805666, 1, 1, 1, 1, 1,
0.4474464, 1.354744, -0.08162203, 1, 1, 1, 1, 1,
0.4502082, -0.2655564, 1.736751, 0, 0, 1, 1, 1,
0.4589921, -1.574449, 2.733879, 1, 0, 0, 1, 1,
0.4597293, -1.063723, 2.606753, 1, 0, 0, 1, 1,
0.4600383, 1.831835, 0.6498705, 1, 0, 0, 1, 1,
0.4615302, 0.4940591, 1.345299, 1, 0, 0, 1, 1,
0.4660819, -0.02884735, 2.269018, 1, 0, 0, 1, 1,
0.4670149, -0.2405667, 1.480604, 0, 0, 0, 1, 1,
0.4680478, 2.203785, 0.4999552, 0, 0, 0, 1, 1,
0.4709919, 2.206713, 0.8981799, 0, 0, 0, 1, 1,
0.4714735, -1.962131, 1.877658, 0, 0, 0, 1, 1,
0.4716552, -0.9254714, 2.751868, 0, 0, 0, 1, 1,
0.473414, 0.2689424, -1.842162, 0, 0, 0, 1, 1,
0.4739361, 0.9233778, -1.027105, 0, 0, 0, 1, 1,
0.4753097, 0.664141, -0.5471075, 1, 1, 1, 1, 1,
0.4772938, -1.074003, 2.593208, 1, 1, 1, 1, 1,
0.4776297, -0.562813, 2.381172, 1, 1, 1, 1, 1,
0.4820606, 1.061434, -0.4935536, 1, 1, 1, 1, 1,
0.4824152, -0.08787356, 3.168996, 1, 1, 1, 1, 1,
0.4839472, 0.414573, -0.2253443, 1, 1, 1, 1, 1,
0.4845781, 0.9777817, 0.1018125, 1, 1, 1, 1, 1,
0.4854923, -0.4123437, 3.375805, 1, 1, 1, 1, 1,
0.4926969, -0.8228273, 0.6850371, 1, 1, 1, 1, 1,
0.4959488, -1.302804, 1.626203, 1, 1, 1, 1, 1,
0.4965453, 0.2607996, 0.4565156, 1, 1, 1, 1, 1,
0.4993747, -1.055431, 0.8977975, 1, 1, 1, 1, 1,
0.5003487, -0.8337466, 1.992613, 1, 1, 1, 1, 1,
0.5029491, -0.2369389, 1.522544, 1, 1, 1, 1, 1,
0.5070208, 1.177932, 0.6710629, 1, 1, 1, 1, 1,
0.5086503, 0.8699021, 2.452765, 0, 0, 1, 1, 1,
0.510271, -1.548745, 3.754363, 1, 0, 0, 1, 1,
0.5103344, -0.8305217, 2.768266, 1, 0, 0, 1, 1,
0.5135939, 0.5554695, 1.907768, 1, 0, 0, 1, 1,
0.5168875, 0.5494463, -0.281924, 1, 0, 0, 1, 1,
0.5195305, 0.5324296, 0.4946687, 1, 0, 0, 1, 1,
0.5232109, 0.4454079, 2.343055, 0, 0, 0, 1, 1,
0.5263764, -0.3366889, 2.85265, 0, 0, 0, 1, 1,
0.5299227, 0.543976, -0.9185008, 0, 0, 0, 1, 1,
0.5316932, 0.8030876, 2.370428, 0, 0, 0, 1, 1,
0.5329972, -0.2517774, 3.366343, 0, 0, 0, 1, 1,
0.5347484, 0.5287485, 0.2306404, 0, 0, 0, 1, 1,
0.5401542, 0.1599977, 1.252434, 0, 0, 0, 1, 1,
0.5455115, -1.639026, 2.706372, 1, 1, 1, 1, 1,
0.5466771, 0.4795495, 0.1261365, 1, 1, 1, 1, 1,
0.5480591, -0.7075905, 2.292311, 1, 1, 1, 1, 1,
0.5494931, -0.3846879, 2.645133, 1, 1, 1, 1, 1,
0.551038, -0.03789253, 2.819381, 1, 1, 1, 1, 1,
0.5513878, 0.6945933, -0.07535513, 1, 1, 1, 1, 1,
0.5600903, -0.3975826, 2.039488, 1, 1, 1, 1, 1,
0.5604312, -0.6788962, 2.788628, 1, 1, 1, 1, 1,
0.5610108, 1.325479, 0.9489014, 1, 1, 1, 1, 1,
0.5612121, 0.6509011, 0.9531516, 1, 1, 1, 1, 1,
0.5618972, -0.1299604, 2.450473, 1, 1, 1, 1, 1,
0.5635997, 1.531737, 0.08355317, 1, 1, 1, 1, 1,
0.5646862, -0.6035624, 4.102173, 1, 1, 1, 1, 1,
0.5654337, 0.9565234, 2.052531, 1, 1, 1, 1, 1,
0.5675311, -0.8376048, 2.336215, 1, 1, 1, 1, 1,
0.5746536, -0.3043323, 2.387009, 0, 0, 1, 1, 1,
0.5749933, -2.177023, 1.61543, 1, 0, 0, 1, 1,
0.5757247, 0.307108, 0.2567304, 1, 0, 0, 1, 1,
0.5780676, 0.8814318, 0.1058453, 1, 0, 0, 1, 1,
0.5876274, -1.113806, 1.922079, 1, 0, 0, 1, 1,
0.5997354, 1.773327, 0.9433089, 1, 0, 0, 1, 1,
0.6003654, -0.8962571, 0.4762092, 0, 0, 0, 1, 1,
0.6025178, -0.2898985, 1.725392, 0, 0, 0, 1, 1,
0.6034265, 0.8286759, 1.248273, 0, 0, 0, 1, 1,
0.6058365, -0.6675738, 1.34221, 0, 0, 0, 1, 1,
0.6062022, 0.6604679, 0.2947719, 0, 0, 0, 1, 1,
0.60869, -0.1452664, 1.328044, 0, 0, 0, 1, 1,
0.6218575, 1.096252, -0.5174381, 0, 0, 0, 1, 1,
0.6226425, -0.8890211, 1.452326, 1, 1, 1, 1, 1,
0.6228462, -0.2834896, 2.242164, 1, 1, 1, 1, 1,
0.6286381, -0.955106, 0.5069804, 1, 1, 1, 1, 1,
0.6335551, -0.3562316, 2.720139, 1, 1, 1, 1, 1,
0.641425, 0.7417279, 0.9189458, 1, 1, 1, 1, 1,
0.644626, -0.1572777, 0.5749168, 1, 1, 1, 1, 1,
0.645821, -0.2136949, 0.6446236, 1, 1, 1, 1, 1,
0.6489345, 0.6066735, 0.2170829, 1, 1, 1, 1, 1,
0.649489, -1.474079, 3.466226, 1, 1, 1, 1, 1,
0.6498904, 0.6616945, 0.9776942, 1, 1, 1, 1, 1,
0.6502636, 1.087977, 0.7883777, 1, 1, 1, 1, 1,
0.6516032, 0.3391156, 1.740175, 1, 1, 1, 1, 1,
0.6595464, -1.16415, 2.000794, 1, 1, 1, 1, 1,
0.6634099, 0.2232234, 2.862074, 1, 1, 1, 1, 1,
0.6636188, 0.03951092, 0.4796242, 1, 1, 1, 1, 1,
0.6666828, -0.08803328, 1.489205, 0, 0, 1, 1, 1,
0.6743028, -0.6262853, 0.6820328, 1, 0, 0, 1, 1,
0.6854349, 1.252916, -0.06395958, 1, 0, 0, 1, 1,
0.6855352, 0.5986921, 0.27879, 1, 0, 0, 1, 1,
0.6856477, -0.1884929, 1.619508, 1, 0, 0, 1, 1,
0.6899524, -0.4950774, 1.900572, 1, 0, 0, 1, 1,
0.6945658, -0.10342, 3.629916, 0, 0, 0, 1, 1,
0.7019371, -0.7353026, 2.765751, 0, 0, 0, 1, 1,
0.7025435, -0.9221662, 5.312693, 0, 0, 0, 1, 1,
0.7173668, 1.463888, 1.449039, 0, 0, 0, 1, 1,
0.7187983, 1.390181, 0.1675093, 0, 0, 0, 1, 1,
0.7203934, -0.2848484, 2.492475, 0, 0, 0, 1, 1,
0.720964, -0.08924997, 1.706169, 0, 0, 0, 1, 1,
0.7215472, -0.7863126, 1.901731, 1, 1, 1, 1, 1,
0.7229137, 0.207463, 1.543847, 1, 1, 1, 1, 1,
0.723106, -1.919212, 2.675043, 1, 1, 1, 1, 1,
0.7232014, 0.9355275, 0.4782656, 1, 1, 1, 1, 1,
0.7253767, -0.7264302, 2.663487, 1, 1, 1, 1, 1,
0.7297398, -0.2796238, 1.922136, 1, 1, 1, 1, 1,
0.7315344, -0.5517353, 2.199293, 1, 1, 1, 1, 1,
0.7345663, 0.5418752, 1.467602, 1, 1, 1, 1, 1,
0.7375286, -0.1207718, 2.590594, 1, 1, 1, 1, 1,
0.7431134, 0.002759729, 1.01678, 1, 1, 1, 1, 1,
0.745671, 0.07161362, 1.564788, 1, 1, 1, 1, 1,
0.7488373, -0.02718519, 3.070867, 1, 1, 1, 1, 1,
0.7496797, 0.1232452, 1.648472, 1, 1, 1, 1, 1,
0.7541847, -1.086516, 0.731331, 1, 1, 1, 1, 1,
0.7572384, -0.2800145, 1.221983, 1, 1, 1, 1, 1,
0.7573236, -0.2268911, 2.137074, 0, 0, 1, 1, 1,
0.7638565, 0.02850455, 2.040006, 1, 0, 0, 1, 1,
0.7647129, -2.350592, 3.379599, 1, 0, 0, 1, 1,
0.7647652, 0.324711, -0.7856967, 1, 0, 0, 1, 1,
0.7657977, -1.584145, 3.298274, 1, 0, 0, 1, 1,
0.7666343, 0.281845, 1.13368, 1, 0, 0, 1, 1,
0.7750309, -0.0111823, 2.029003, 0, 0, 0, 1, 1,
0.7786717, 2.064494, 1.105322, 0, 0, 0, 1, 1,
0.7830166, 0.3703907, 1.158682, 0, 0, 0, 1, 1,
0.7830905, 0.2549995, 1.791811, 0, 0, 0, 1, 1,
0.7885011, 0.2546101, 0.6843077, 0, 0, 0, 1, 1,
0.7916301, -0.9102183, 3.630019, 0, 0, 0, 1, 1,
0.798075, -0.3475605, 2.845561, 0, 0, 0, 1, 1,
0.7999817, -2.635354, 4.005067, 1, 1, 1, 1, 1,
0.8001244, 0.2537908, -0.6355539, 1, 1, 1, 1, 1,
0.8013943, 0.4070392, 0.8873742, 1, 1, 1, 1, 1,
0.8024384, 0.6184654, 2.142927, 1, 1, 1, 1, 1,
0.8106636, -0.580595, 2.026211, 1, 1, 1, 1, 1,
0.8156554, -1.130856, 1.939272, 1, 1, 1, 1, 1,
0.8180679, 0.2894471, 3.41939, 1, 1, 1, 1, 1,
0.8203806, 0.3474183, 1.668584, 1, 1, 1, 1, 1,
0.8215273, 0.4968823, 1.530281, 1, 1, 1, 1, 1,
0.8231173, -0.7289121, 3.263741, 1, 1, 1, 1, 1,
0.8340704, 1.245457, 0.6644824, 1, 1, 1, 1, 1,
0.8541229, -0.01162293, 2.579402, 1, 1, 1, 1, 1,
0.8542564, -0.1382464, 1.198052, 1, 1, 1, 1, 1,
0.8558965, 0.3251613, 1.615668, 1, 1, 1, 1, 1,
0.857944, 0.5923597, -0.4120604, 1, 1, 1, 1, 1,
0.8609338, -2.137197, 2.892197, 0, 0, 1, 1, 1,
0.8690314, -1.200139, 2.183256, 1, 0, 0, 1, 1,
0.8711786, -0.5910553, 2.946745, 1, 0, 0, 1, 1,
0.8733938, 1.039985, -0.167901, 1, 0, 0, 1, 1,
0.8773202, -1.588412, 2.628234, 1, 0, 0, 1, 1,
0.8778783, -0.8549053, 2.749406, 1, 0, 0, 1, 1,
0.8814247, 0.2517529, 3.108158, 0, 0, 0, 1, 1,
0.8822213, 0.05276797, 1.444059, 0, 0, 0, 1, 1,
0.8916469, -2.064634, 0.3851044, 0, 0, 0, 1, 1,
0.8927038, -0.7761237, 1.508199, 0, 0, 0, 1, 1,
0.8950418, -1.274098, 1.036451, 0, 0, 0, 1, 1,
0.895321, 0.6240748, 0.4299855, 0, 0, 0, 1, 1,
0.9071867, -1.124646, 2.657521, 0, 0, 0, 1, 1,
0.9077397, -0.8707348, -0.6875093, 1, 1, 1, 1, 1,
0.9084845, 0.4613, 0.01462989, 1, 1, 1, 1, 1,
0.9172753, 1.845957, 0.737994, 1, 1, 1, 1, 1,
0.9248542, -0.3234758, 3.74075, 1, 1, 1, 1, 1,
0.9255609, 1.337022, 0.438988, 1, 1, 1, 1, 1,
0.9382051, 0.3770567, 1.53294, 1, 1, 1, 1, 1,
0.9385042, 0.7873864, 0.01834431, 1, 1, 1, 1, 1,
0.9404836, 0.4890107, 1.14548, 1, 1, 1, 1, 1,
0.946273, 1.200165, 0.8233454, 1, 1, 1, 1, 1,
0.9490053, -0.8112674, 1.805387, 1, 1, 1, 1, 1,
0.9589678, -0.3952395, 1.25363, 1, 1, 1, 1, 1,
0.9629194, 0.8223755, 2.246675, 1, 1, 1, 1, 1,
0.9636865, 1.279933, 1.576559, 1, 1, 1, 1, 1,
0.9689645, 1.05886, -0.2705318, 1, 1, 1, 1, 1,
0.9761606, -1.046568, 3.04989, 1, 1, 1, 1, 1,
0.9800843, -2.475149, 3.443253, 0, 0, 1, 1, 1,
0.9879456, -0.4469657, 1.088698, 1, 0, 0, 1, 1,
0.9880059, 1.848857, -0.3587502, 1, 0, 0, 1, 1,
0.9887617, -0.9178497, 4.400809, 1, 0, 0, 1, 1,
0.989379, -0.06602468, 2.052976, 1, 0, 0, 1, 1,
0.9926115, 0.4898794, -0.1594529, 1, 0, 0, 1, 1,
0.9960898, 2.095107, -0.2741018, 0, 0, 0, 1, 1,
1.002146, 0.4370642, 1.375038, 0, 0, 0, 1, 1,
1.00834, -1.347153, 2.360008, 0, 0, 0, 1, 1,
1.014961, 0.6010127, 0.6969733, 0, 0, 0, 1, 1,
1.020477, 0.2117736, 2.303246, 0, 0, 0, 1, 1,
1.031073, -1.357499, 3.90796, 0, 0, 0, 1, 1,
1.043458, -0.3061188, 1.368598, 0, 0, 0, 1, 1,
1.044553, -0.5867413, 0.882632, 1, 1, 1, 1, 1,
1.050038, -1.51975, 3.314896, 1, 1, 1, 1, 1,
1.051176, -0.3884011, 2.751101, 1, 1, 1, 1, 1,
1.051434, 1.423102, 0.7687113, 1, 1, 1, 1, 1,
1.059071, 0.8385416, 0.9266142, 1, 1, 1, 1, 1,
1.061781, -0.8018602, 2.900826, 1, 1, 1, 1, 1,
1.062704, -2.085329, 3.865758, 1, 1, 1, 1, 1,
1.070477, 0.7262535, 0.4593259, 1, 1, 1, 1, 1,
1.070631, 0.466476, 1.609776, 1, 1, 1, 1, 1,
1.080491, -0.6709125, 2.307818, 1, 1, 1, 1, 1,
1.080895, -1.31073, 0.5658516, 1, 1, 1, 1, 1,
1.085494, 1.166219, 0.9136487, 1, 1, 1, 1, 1,
1.088304, 2.086735, -0.1037623, 1, 1, 1, 1, 1,
1.103469, 0.1327057, 0.9825086, 1, 1, 1, 1, 1,
1.108927, 1.678057, 1.658801, 1, 1, 1, 1, 1,
1.11621, 0.3204613, 2.797889, 0, 0, 1, 1, 1,
1.119483, -1.322785, 3.365542, 1, 0, 0, 1, 1,
1.123158, -0.01715591, 1.040159, 1, 0, 0, 1, 1,
1.128974, 1.944869, 1.539788, 1, 0, 0, 1, 1,
1.129837, 0.08587636, 1.370973, 1, 0, 0, 1, 1,
1.131884, -0.3353375, 2.163291, 1, 0, 0, 1, 1,
1.137835, 0.7533845, -0.8281486, 0, 0, 0, 1, 1,
1.13826, -1.187488, 1.046152, 0, 0, 0, 1, 1,
1.141332, 1.352252, 1.386679, 0, 0, 0, 1, 1,
1.14481, 0.1536042, 1.335204, 0, 0, 0, 1, 1,
1.14551, -0.7136716, 2.556067, 0, 0, 0, 1, 1,
1.149822, -0.1834796, 0.8749715, 0, 0, 0, 1, 1,
1.153442, 0.8657025, 0.8748533, 0, 0, 0, 1, 1,
1.155452, 1.76678, 0.1070653, 1, 1, 1, 1, 1,
1.166448, 0.2560877, 0.1346067, 1, 1, 1, 1, 1,
1.167345, 2.058846, 1.176581, 1, 1, 1, 1, 1,
1.169979, -0.8642455, 1.972018, 1, 1, 1, 1, 1,
1.171414, -0.6312865, 4.468655, 1, 1, 1, 1, 1,
1.179555, 0.03906652, 1.061411, 1, 1, 1, 1, 1,
1.18138, -0.3815026, 1.373903, 1, 1, 1, 1, 1,
1.18671, -1.802777, 2.882854, 1, 1, 1, 1, 1,
1.190933, 1.768212, 0.8383784, 1, 1, 1, 1, 1,
1.19162, -0.7895629, 1.024349, 1, 1, 1, 1, 1,
1.193365, 0.2637802, 1.343326, 1, 1, 1, 1, 1,
1.200152, 1.90084, 1.544276, 1, 1, 1, 1, 1,
1.200703, 0.6118433, 1.209048, 1, 1, 1, 1, 1,
1.202888, 1.994134, -0.1523943, 1, 1, 1, 1, 1,
1.212485, -0.5791702, 2.084089, 1, 1, 1, 1, 1,
1.212963, -0.2255975, 0.9601425, 0, 0, 1, 1, 1,
1.223771, -0.6045308, 2.184705, 1, 0, 0, 1, 1,
1.229013, -0.9344632, 2.45676, 1, 0, 0, 1, 1,
1.23218, -1.238769, 1.89153, 1, 0, 0, 1, 1,
1.242792, 0.08487322, 1.05762, 1, 0, 0, 1, 1,
1.263553, 0.4539351, 1.211923, 1, 0, 0, 1, 1,
1.265225, 1.110121, 2.121506, 0, 0, 0, 1, 1,
1.26849, -2.66579, 2.196265, 0, 0, 0, 1, 1,
1.271855, 0.3712761, 0.9402752, 0, 0, 0, 1, 1,
1.280386, 1.049566, 1.337099, 0, 0, 0, 1, 1,
1.28214, 0.7407116, -0.1571459, 0, 0, 0, 1, 1,
1.299994, 0.1149205, 2.263993, 0, 0, 0, 1, 1,
1.309911, -1.355069, 3.465395, 0, 0, 0, 1, 1,
1.310955, -0.8715844, 1.147463, 1, 1, 1, 1, 1,
1.315687, -0.08083612, 1.418344, 1, 1, 1, 1, 1,
1.316287, -1.212813, 2.809153, 1, 1, 1, 1, 1,
1.333771, -2.001266, 2.756049, 1, 1, 1, 1, 1,
1.34303, -0.008691942, 2.025527, 1, 1, 1, 1, 1,
1.349945, 0.656055, -0.4621643, 1, 1, 1, 1, 1,
1.354131, 0.1104156, 2.05148, 1, 1, 1, 1, 1,
1.355776, -0.9904702, -0.1554441, 1, 1, 1, 1, 1,
1.36599, 0.1693367, 0.805948, 1, 1, 1, 1, 1,
1.368921, 0.6937848, 0.648667, 1, 1, 1, 1, 1,
1.369323, -0.3381838, 0.9197041, 1, 1, 1, 1, 1,
1.373969, -0.1025693, 2.152851, 1, 1, 1, 1, 1,
1.385748, 0.02314302, 0.7449647, 1, 1, 1, 1, 1,
1.392282, -0.298293, 3.330213, 1, 1, 1, 1, 1,
1.392855, -0.6097229, 2.830244, 1, 1, 1, 1, 1,
1.39834, 0.3594068, -1.242628, 0, 0, 1, 1, 1,
1.405794, 0.3147529, 0.9536216, 1, 0, 0, 1, 1,
1.426185, -1.805818, 3.34093, 1, 0, 0, 1, 1,
1.42712, -0.3222687, 0.9772527, 1, 0, 0, 1, 1,
1.433583, 0.8632347, 1.956562, 1, 0, 0, 1, 1,
1.444989, 1.42659, -0.1285587, 1, 0, 0, 1, 1,
1.452482, -0.2572475, 0.6546227, 0, 0, 0, 1, 1,
1.452721, -1.100504, 0.6156098, 0, 0, 0, 1, 1,
1.461831, 0.2794564, 2.744781, 0, 0, 0, 1, 1,
1.482129, 1.913614, 1.715335, 0, 0, 0, 1, 1,
1.487616, -2.560002, 2.638485, 0, 0, 0, 1, 1,
1.488674, 1.258487, 1.661151, 0, 0, 0, 1, 1,
1.498413, 1.049112, 1.377373, 0, 0, 0, 1, 1,
1.51157, -0.4847041, 2.661243, 1, 1, 1, 1, 1,
1.551737, 0.8156502, 1.134264, 1, 1, 1, 1, 1,
1.551928, 0.0186302, 1.727708, 1, 1, 1, 1, 1,
1.582359, 0.2390274, 0.3328667, 1, 1, 1, 1, 1,
1.593479, -0.2366012, 2.540264, 1, 1, 1, 1, 1,
1.624233, 1.077885, 0.332568, 1, 1, 1, 1, 1,
1.630932, -0.5481304, 0.9931007, 1, 1, 1, 1, 1,
1.633257, -1.375245, 1.998294, 1, 1, 1, 1, 1,
1.651776, -0.3518264, 1.333929, 1, 1, 1, 1, 1,
1.671856, -0.006347448, -0.5510445, 1, 1, 1, 1, 1,
1.699869, 0.2161293, 2.096468, 1, 1, 1, 1, 1,
1.70465, -0.2888719, 1.777022, 1, 1, 1, 1, 1,
1.706213, -0.4280597, 0.6557136, 1, 1, 1, 1, 1,
1.709107, 1.091686, -1.330767, 1, 1, 1, 1, 1,
1.712653, -1.000804, 2.71103, 1, 1, 1, 1, 1,
1.72742, -0.1649627, 0.5297431, 0, 0, 1, 1, 1,
1.735329, 0.2998381, -0.03531771, 1, 0, 0, 1, 1,
1.740586, 0.4302971, 1.442687, 1, 0, 0, 1, 1,
1.753222, 0.5008565, 1.141108, 1, 0, 0, 1, 1,
1.771739, -0.3211863, 0.7405761, 1, 0, 0, 1, 1,
1.785338, -2.974556, 2.071239, 1, 0, 0, 1, 1,
1.787847, 0.6255908, 1.22402, 0, 0, 0, 1, 1,
1.791371, 1.103269, 1.339635, 0, 0, 0, 1, 1,
1.795475, 1.917357, 2.039218, 0, 0, 0, 1, 1,
1.811011, -0.913051, 2.134331, 0, 0, 0, 1, 1,
1.819047, 0.4603954, 2.109857, 0, 0, 0, 1, 1,
1.822956, -0.4213648, 2.960901, 0, 0, 0, 1, 1,
1.824474, 0.3837239, 1.904354, 0, 0, 0, 1, 1,
1.834638, 0.05839474, 0.9891594, 1, 1, 1, 1, 1,
1.851715, -0.468605, 0.2171627, 1, 1, 1, 1, 1,
1.862372, 0.4359956, 1.579801, 1, 1, 1, 1, 1,
1.872022, -1.144842, 1.669483, 1, 1, 1, 1, 1,
1.87797, -0.1340044, 1.639415, 1, 1, 1, 1, 1,
1.894517, -0.3395916, 2.03748, 1, 1, 1, 1, 1,
1.918286, -0.4467725, -0.3430897, 1, 1, 1, 1, 1,
1.92247, -0.244555, 3.839483, 1, 1, 1, 1, 1,
1.948229, -1.093572, 2.46762, 1, 1, 1, 1, 1,
1.954633, -1.246409, 2.831752, 1, 1, 1, 1, 1,
1.95554, 0.3219303, 1.437533, 1, 1, 1, 1, 1,
1.95681, -0.5577811, 2.478185, 1, 1, 1, 1, 1,
1.97239, 1.679495, 1.600322, 1, 1, 1, 1, 1,
1.977322, 1.663112, 0.4592908, 1, 1, 1, 1, 1,
2.006206, 0.7331114, 1.312982, 1, 1, 1, 1, 1,
2.007808, 0.5756527, 2.402006, 0, 0, 1, 1, 1,
2.031013, 0.2059892, 2.123286, 1, 0, 0, 1, 1,
2.069136, -0.6094204, 2.664902, 1, 0, 0, 1, 1,
2.072468, -1.239966, 0.4572996, 1, 0, 0, 1, 1,
2.075533, -0.2739876, 2.464777, 1, 0, 0, 1, 1,
2.094297, -0.02496279, 1.144809, 1, 0, 0, 1, 1,
2.100726, 0.5692003, 1.56439, 0, 0, 0, 1, 1,
2.106325, -0.1597343, 0.6441205, 0, 0, 0, 1, 1,
2.151804, -0.715503, 1.193537, 0, 0, 0, 1, 1,
2.167348, 0.560348, 1.600032, 0, 0, 0, 1, 1,
2.171771, -1.165638, 1.800468, 0, 0, 0, 1, 1,
2.174309, -0.002804912, 1.44945, 0, 0, 0, 1, 1,
2.211387, -0.5711851, 0.303573, 0, 0, 0, 1, 1,
2.212828, -0.214867, 0.7313585, 1, 1, 1, 1, 1,
2.419016, 1.576305, 0.2486888, 1, 1, 1, 1, 1,
2.758318, -0.5223309, 1.682303, 1, 1, 1, 1, 1,
2.971014, 0.9502305, 0.9835812, 1, 1, 1, 1, 1,
3.045959, 0.1398818, 1.747158, 1, 1, 1, 1, 1,
3.146762, -0.4466515, 1.72153, 1, 1, 1, 1, 1,
4.10236, -0.1048962, 1.420249, 1, 1, 1, 1, 1
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
var radius = 9.840213;
var distance = 34.56333;
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
mvMatrix.translate( -0.5982531, 0.07234716, 0.01052761 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.56333);
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