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
-3.588632, 0.2366661, -0.5972373, 1, 0, 0, 1,
-3.212218, 1.190051, -0.9681152, 1, 0.007843138, 0, 1,
-3.057363, 0.1821172, -1.191397, 1, 0.01176471, 0, 1,
-2.948163, -0.9875586, -3.456015, 1, 0.01960784, 0, 1,
-2.86639, -0.5116668, -3.075325, 1, 0.02352941, 0, 1,
-2.860962, 0.6488308, -1.706572, 1, 0.03137255, 0, 1,
-2.766526, -0.5557508, -1.919501, 1, 0.03529412, 0, 1,
-2.7344, -0.4867684, -1.911539, 1, 0.04313726, 0, 1,
-2.702809, -0.7226358, -1.951127, 1, 0.04705882, 0, 1,
-2.672437, 1.046701, -2.265593, 1, 0.05490196, 0, 1,
-2.576143, 0.400464, -2.177764, 1, 0.05882353, 0, 1,
-2.547719, 1.781887, -0.6004, 1, 0.06666667, 0, 1,
-2.538895, -1.211774, -2.694238, 1, 0.07058824, 0, 1,
-2.442303, 0.3565144, -2.511061, 1, 0.07843138, 0, 1,
-2.408818, 0.2306596, -2.559569, 1, 0.08235294, 0, 1,
-2.356536, -0.3118837, -1.149709, 1, 0.09019608, 0, 1,
-2.336639, 0.8779263, -1.595286, 1, 0.09411765, 0, 1,
-2.265349, 1.105663, -0.7381197, 1, 0.1019608, 0, 1,
-2.179407, 1.289643, -1.416996, 1, 0.1098039, 0, 1,
-2.168762, 0.3590855, -0.572657, 1, 0.1137255, 0, 1,
-2.115683, -1.832102, -2.018978, 1, 0.1215686, 0, 1,
-2.110708, 0.001901636, -0.4844914, 1, 0.1254902, 0, 1,
-2.106323, -1.300548, -2.287014, 1, 0.1333333, 0, 1,
-2.095889, -0.5281001, -1.691844, 1, 0.1372549, 0, 1,
-2.050078, 0.8995641, -2.287596, 1, 0.145098, 0, 1,
-2.041274, 0.3317412, -0.6694511, 1, 0.1490196, 0, 1,
-2.041179, 0.9144959, -1.639324, 1, 0.1568628, 0, 1,
-2.020006, 2.575193, -0.5481375, 1, 0.1607843, 0, 1,
-1.997615, -1.126009, -2.002805, 1, 0.1686275, 0, 1,
-1.997367, -0.8646661, -2.388627, 1, 0.172549, 0, 1,
-1.94337, -0.04502289, -1.600059, 1, 0.1803922, 0, 1,
-1.900509, 0.3922688, -1.318656, 1, 0.1843137, 0, 1,
-1.893886, 0.803208, -1.877493, 1, 0.1921569, 0, 1,
-1.888069, -0.3117608, -2.048328, 1, 0.1960784, 0, 1,
-1.886334, 0.8734629, -0.4859115, 1, 0.2039216, 0, 1,
-1.87576, 1.96562, -1.624048, 1, 0.2117647, 0, 1,
-1.875292, 0.7379911, -1.733973, 1, 0.2156863, 0, 1,
-1.874442, -1.18075, -1.792627, 1, 0.2235294, 0, 1,
-1.850054, 0.2315369, -0.3404622, 1, 0.227451, 0, 1,
-1.849797, 0.06152533, 0.5479324, 1, 0.2352941, 0, 1,
-1.848524, -0.9179461, -2.678496, 1, 0.2392157, 0, 1,
-1.840276, -0.8725266, -0.7480288, 1, 0.2470588, 0, 1,
-1.823611, -0.523748, -5.268605, 1, 0.2509804, 0, 1,
-1.805653, 0.6710269, -1.92132, 1, 0.2588235, 0, 1,
-1.79437, -1.878232, -2.099305, 1, 0.2627451, 0, 1,
-1.780481, 0.1294248, -1.336181, 1, 0.2705882, 0, 1,
-1.777378, 0.8333641, -2.034228, 1, 0.2745098, 0, 1,
-1.73987, -0.4248884, -3.352391, 1, 0.282353, 0, 1,
-1.737377, 0.5279915, -2.059486, 1, 0.2862745, 0, 1,
-1.728471, -0.4753776, -1.084855, 1, 0.2941177, 0, 1,
-1.726613, 2.554454, 0.07904734, 1, 0.3019608, 0, 1,
-1.71673, 1.083562, -1.542905, 1, 0.3058824, 0, 1,
-1.710443, -0.03723394, -1.545087, 1, 0.3137255, 0, 1,
-1.687211, -0.7050903, -1.715767, 1, 0.3176471, 0, 1,
-1.676006, -0.2060219, -1.568557, 1, 0.3254902, 0, 1,
-1.65583, 0.02016913, -1.597506, 1, 0.3294118, 0, 1,
-1.651625, 0.8782144, 0.8897971, 1, 0.3372549, 0, 1,
-1.640326, -0.8539543, -1.863152, 1, 0.3411765, 0, 1,
-1.63856, 1.587353, -0.9113758, 1, 0.3490196, 0, 1,
-1.635603, -0.8083584, -0.8093219, 1, 0.3529412, 0, 1,
-1.603401, 0.706125, -1.718626, 1, 0.3607843, 0, 1,
-1.59665, 1.038912, -0.7045651, 1, 0.3647059, 0, 1,
-1.568195, 0.5897138, -0.04510194, 1, 0.372549, 0, 1,
-1.557731, -2.011657, -0.5647305, 1, 0.3764706, 0, 1,
-1.55161, -1.83116, -3.91628, 1, 0.3843137, 0, 1,
-1.539442, -0.1046881, -1.477456, 1, 0.3882353, 0, 1,
-1.527109, -0.03374663, -2.935747, 1, 0.3960784, 0, 1,
-1.524969, -0.5950151, -1.258807, 1, 0.4039216, 0, 1,
-1.524647, -1.7448, -3.484497, 1, 0.4078431, 0, 1,
-1.521254, 0.2068893, -1.37825, 1, 0.4156863, 0, 1,
-1.516101, -0.694711, -1.412144, 1, 0.4196078, 0, 1,
-1.514594, -0.4320079, -2.57157, 1, 0.427451, 0, 1,
-1.514253, -0.6735541, -0.9877348, 1, 0.4313726, 0, 1,
-1.507947, 0.7988225, -1.828689, 1, 0.4392157, 0, 1,
-1.500212, -0.9788502, -1.30149, 1, 0.4431373, 0, 1,
-1.497888, -1.175885, -1.156289, 1, 0.4509804, 0, 1,
-1.493671, -0.4186855, -2.664914, 1, 0.454902, 0, 1,
-1.484439, -1.600676, -4.225981, 1, 0.4627451, 0, 1,
-1.477341, -0.5558242, -0.780454, 1, 0.4666667, 0, 1,
-1.465428, 1.451007, 0.3086066, 1, 0.4745098, 0, 1,
-1.443636, -0.9588289, -1.827079, 1, 0.4784314, 0, 1,
-1.436189, 0.237795, -1.05415, 1, 0.4862745, 0, 1,
-1.433198, 0.5716406, -2.279353, 1, 0.4901961, 0, 1,
-1.417791, 0.1082228, -0.8552694, 1, 0.4980392, 0, 1,
-1.414769, -0.2519478, -0.02522727, 1, 0.5058824, 0, 1,
-1.412628, 0.2818469, -1.953512, 1, 0.509804, 0, 1,
-1.409741, -1.065878, -1.23644, 1, 0.5176471, 0, 1,
-1.391947, 1.644233, -0.2909494, 1, 0.5215687, 0, 1,
-1.388611, -0.3266396, 0.1043506, 1, 0.5294118, 0, 1,
-1.381127, 0.0867372, -1.328284, 1, 0.5333334, 0, 1,
-1.363318, 0.1430155, -1.142444, 1, 0.5411765, 0, 1,
-1.361197, -2.487884, -1.812837, 1, 0.5450981, 0, 1,
-1.35903, -0.01994734, -2.28271, 1, 0.5529412, 0, 1,
-1.356599, -0.2290261, -1.23826, 1, 0.5568628, 0, 1,
-1.355631, -1.953515, -2.670112, 1, 0.5647059, 0, 1,
-1.335314, 1.337032, -2.286597, 1, 0.5686275, 0, 1,
-1.33121, -0.3876424, -0.5406852, 1, 0.5764706, 0, 1,
-1.324014, 1.677654, -1.251038, 1, 0.5803922, 0, 1,
-1.319682, 0.4079412, -3.46849, 1, 0.5882353, 0, 1,
-1.314149, -1.521738, -3.127358, 1, 0.5921569, 0, 1,
-1.306654, 2.486831, 0.3627221, 1, 0.6, 0, 1,
-1.295097, -1.185065, -1.537256, 1, 0.6078432, 0, 1,
-1.285098, 0.8193577, 0.5981683, 1, 0.6117647, 0, 1,
-1.284963, -0.9105908, -2.491836, 1, 0.6196079, 0, 1,
-1.271054, -0.01007313, -0.4374935, 1, 0.6235294, 0, 1,
-1.269959, 0.3298558, -1.555368, 1, 0.6313726, 0, 1,
-1.263698, 0.133747, -2.699551, 1, 0.6352941, 0, 1,
-1.259867, 0.978829, 1.403572, 1, 0.6431373, 0, 1,
-1.253275, 0.585493, -0.8552566, 1, 0.6470588, 0, 1,
-1.252221, -0.7570151, -1.353828, 1, 0.654902, 0, 1,
-1.251953, -0.4065836, -2.21058, 1, 0.6588235, 0, 1,
-1.250822, -0.1241883, -0.6619079, 1, 0.6666667, 0, 1,
-1.230189, -1.686394, -1.010538, 1, 0.6705883, 0, 1,
-1.22846, -1.115463, -2.867712, 1, 0.6784314, 0, 1,
-1.226673, 0.3573153, -0.3826242, 1, 0.682353, 0, 1,
-1.222845, 0.9146465, -0.8039845, 1, 0.6901961, 0, 1,
-1.21925, -1.889401, -3.001664, 1, 0.6941177, 0, 1,
-1.209095, 0.8011476, 0.1812987, 1, 0.7019608, 0, 1,
-1.206445, -0.1864705, -3.239881, 1, 0.7098039, 0, 1,
-1.191605, 0.6347321, -1.709004, 1, 0.7137255, 0, 1,
-1.185005, 0.561038, -1.995483, 1, 0.7215686, 0, 1,
-1.180904, 0.452799, -3.116642, 1, 0.7254902, 0, 1,
-1.17815, 0.3908896, 0.8989018, 1, 0.7333333, 0, 1,
-1.166446, -2.241858, -4.678196, 1, 0.7372549, 0, 1,
-1.160863, 0.1656701, -1.86955, 1, 0.7450981, 0, 1,
-1.158279, 0.1268687, -1.083065, 1, 0.7490196, 0, 1,
-1.156407, -0.4144505, -2.312006, 1, 0.7568628, 0, 1,
-1.156279, 1.541923, -0.2224628, 1, 0.7607843, 0, 1,
-1.144978, 0.6493946, -1.995597, 1, 0.7686275, 0, 1,
-1.141724, -1.372302, -3.552746, 1, 0.772549, 0, 1,
-1.139115, -0.263074, -1.792543, 1, 0.7803922, 0, 1,
-1.135226, -0.4285091, 0.7872233, 1, 0.7843137, 0, 1,
-1.128789, -0.292702, -1.351053, 1, 0.7921569, 0, 1,
-1.128142, 1.001817, -1.69476, 1, 0.7960784, 0, 1,
-1.124652, 0.5513073, -1.53084, 1, 0.8039216, 0, 1,
-1.1179, -0.3653604, -0.5026581, 1, 0.8117647, 0, 1,
-1.116336, -1.369409, -3.690709, 1, 0.8156863, 0, 1,
-1.115565, 0.3160509, -1.895563, 1, 0.8235294, 0, 1,
-1.107007, 1.215876, -1.059458, 1, 0.827451, 0, 1,
-1.105312, 1.154562, -0.69155, 1, 0.8352941, 0, 1,
-1.096392, 0.3481158, -1.695778, 1, 0.8392157, 0, 1,
-1.09626, 1.132139, 0.2737493, 1, 0.8470588, 0, 1,
-1.093608, -0.7040912, -1.424517, 1, 0.8509804, 0, 1,
-1.093258, -0.7056579, -2.09269, 1, 0.8588235, 0, 1,
-1.088416, -0.2209607, -2.615248, 1, 0.8627451, 0, 1,
-1.07983, 1.204472, -0.9936522, 1, 0.8705882, 0, 1,
-1.074758, -0.1922157, -0.3376387, 1, 0.8745098, 0, 1,
-1.071665, 0.8330876, -2.288565, 1, 0.8823529, 0, 1,
-1.068901, 1.778586, 0.5420132, 1, 0.8862745, 0, 1,
-1.068725, 2.836944, -3.095048, 1, 0.8941177, 0, 1,
-1.064483, -0.9875851, -0.5215673, 1, 0.8980392, 0, 1,
-1.0628, 0.5019282, -1.423572, 1, 0.9058824, 0, 1,
-1.05303, 1.777143, -1.31219, 1, 0.9137255, 0, 1,
-1.049092, 0.04948042, -1.674861, 1, 0.9176471, 0, 1,
-1.04655, -0.2105965, -2.077425, 1, 0.9254902, 0, 1,
-1.044956, -1.150952, -4.390636, 1, 0.9294118, 0, 1,
-1.042881, -0.08429271, -2.127978, 1, 0.9372549, 0, 1,
-1.038423, 0.3520499, -1.810289, 1, 0.9411765, 0, 1,
-1.029358, -2.183908, -3.514277, 1, 0.9490196, 0, 1,
-1.023018, -0.5120773, -2.585768, 1, 0.9529412, 0, 1,
-1.022044, -1.997832, -1.1256, 1, 0.9607843, 0, 1,
-1.020174, 0.9090252, 0.0003166829, 1, 0.9647059, 0, 1,
-1.00903, -0.9225945, -0.3361416, 1, 0.972549, 0, 1,
-1.007561, -0.5608758, -3.515998, 1, 0.9764706, 0, 1,
-0.9986905, 1.224048, -1.338413, 1, 0.9843137, 0, 1,
-0.9874935, 0.7168747, -0.6837178, 1, 0.9882353, 0, 1,
-0.9858344, 0.3049614, 0.2679798, 1, 0.9960784, 0, 1,
-0.9856, 0.5097292, -0.6101869, 0.9960784, 1, 0, 1,
-0.9821408, -0.2410453, -2.293101, 0.9921569, 1, 0, 1,
-0.9812736, 1.208578, -3.072878, 0.9843137, 1, 0, 1,
-0.9775279, -1.271264, -2.844512, 0.9803922, 1, 0, 1,
-0.9773565, -1.495181, -0.7378514, 0.972549, 1, 0, 1,
-0.9707528, 0.7047119, -1.528805, 0.9686275, 1, 0, 1,
-0.9700242, 0.2118933, -3.681149, 0.9607843, 1, 0, 1,
-0.964344, 0.2625536, -0.03647225, 0.9568627, 1, 0, 1,
-0.9618023, 0.6390126, -1.3274, 0.9490196, 1, 0, 1,
-0.953209, 0.3960486, -2.426383, 0.945098, 1, 0, 1,
-0.9511194, -0.6609824, -2.30218, 0.9372549, 1, 0, 1,
-0.9473006, -0.9724286, -2.070464, 0.9333333, 1, 0, 1,
-0.9460893, -1.867805, -2.871876, 0.9254902, 1, 0, 1,
-0.9369718, 1.535194, -0.1242891, 0.9215686, 1, 0, 1,
-0.9287724, 1.725728, -0.4489015, 0.9137255, 1, 0, 1,
-0.9221357, 0.01097178, -1.153562, 0.9098039, 1, 0, 1,
-0.9214958, -0.5224212, -1.726416, 0.9019608, 1, 0, 1,
-0.9206762, -1.08807, -1.770285, 0.8941177, 1, 0, 1,
-0.9172252, -0.2190406, -1.741374, 0.8901961, 1, 0, 1,
-0.9152758, -0.6013665, -1.574889, 0.8823529, 1, 0, 1,
-0.9148543, -1.487481, -4.063349, 0.8784314, 1, 0, 1,
-0.9099175, -2.060721, -3.041404, 0.8705882, 1, 0, 1,
-0.8998929, -0.4445303, -2.469787, 0.8666667, 1, 0, 1,
-0.8953197, 0.2119184, -1.769901, 0.8588235, 1, 0, 1,
-0.893115, 0.1199075, -3.685955, 0.854902, 1, 0, 1,
-0.8752601, 0.2040271, 0.06270671, 0.8470588, 1, 0, 1,
-0.8688493, 0.1179255, -2.789492, 0.8431373, 1, 0, 1,
-0.8551273, -1.903914, -2.973371, 0.8352941, 1, 0, 1,
-0.8526031, 0.1017266, -1.572038, 0.8313726, 1, 0, 1,
-0.8521711, -0.6342341, -0.2935657, 0.8235294, 1, 0, 1,
-0.8511431, -1.635939, -2.823807, 0.8196079, 1, 0, 1,
-0.8460624, -0.1581622, -3.088824, 0.8117647, 1, 0, 1,
-0.8380843, -0.5564743, -1.239855, 0.8078431, 1, 0, 1,
-0.8362883, -0.2317567, -2.690331, 0.8, 1, 0, 1,
-0.8358707, 1.088545, -2.437248, 0.7921569, 1, 0, 1,
-0.8358245, -0.6537386, -1.947433, 0.7882353, 1, 0, 1,
-0.833234, -3.137413, -1.518661, 0.7803922, 1, 0, 1,
-0.8315535, -0.3967142, -2.01246, 0.7764706, 1, 0, 1,
-0.8304024, 0.5471284, -1.434513, 0.7686275, 1, 0, 1,
-0.8257948, 0.4204786, -1.909937, 0.7647059, 1, 0, 1,
-0.8248122, 0.2802288, -1.286412, 0.7568628, 1, 0, 1,
-0.8228069, -0.2079345, -1.949829, 0.7529412, 1, 0, 1,
-0.8210961, -0.181667, -0.2765317, 0.7450981, 1, 0, 1,
-0.8158692, -0.8456235, -2.154256, 0.7411765, 1, 0, 1,
-0.815519, -1.718329, -2.608899, 0.7333333, 1, 0, 1,
-0.8106845, 1.140375, -0.1517055, 0.7294118, 1, 0, 1,
-0.8053935, -0.8999391, -2.721604, 0.7215686, 1, 0, 1,
-0.8011717, -0.5162055, -0.9924716, 0.7176471, 1, 0, 1,
-0.7997834, -1.441406, -2.996541, 0.7098039, 1, 0, 1,
-0.7946176, 1.060139, 0.05768666, 0.7058824, 1, 0, 1,
-0.7916785, -1.08666, -3.071604, 0.6980392, 1, 0, 1,
-0.7879235, -0.6862351, -2.590643, 0.6901961, 1, 0, 1,
-0.7846619, 0.8711091, -0.008405224, 0.6862745, 1, 0, 1,
-0.7830524, -0.2533603, -1.943565, 0.6784314, 1, 0, 1,
-0.7829257, -0.5330127, -0.8684691, 0.6745098, 1, 0, 1,
-0.7807527, 1.756179, -0.5053546, 0.6666667, 1, 0, 1,
-0.7799827, -1.006587, -0.7182347, 0.6627451, 1, 0, 1,
-0.7793171, 0.1648334, -3.254044, 0.654902, 1, 0, 1,
-0.7772108, -0.9077315, -1.894155, 0.6509804, 1, 0, 1,
-0.7673024, 0.5332129, 0.1918997, 0.6431373, 1, 0, 1,
-0.7621567, -1.771068, -2.755113, 0.6392157, 1, 0, 1,
-0.7529227, 1.735081, -1.642482, 0.6313726, 1, 0, 1,
-0.751793, -0.5273471, -3.160213, 0.627451, 1, 0, 1,
-0.7435405, 0.7580535, -1.768677, 0.6196079, 1, 0, 1,
-0.7375414, -0.4517203, -2.196084, 0.6156863, 1, 0, 1,
-0.7374032, 0.353667, -1.135655, 0.6078432, 1, 0, 1,
-0.733754, 1.518229, -1.754672, 0.6039216, 1, 0, 1,
-0.7222956, 0.7348859, -0.7979505, 0.5960785, 1, 0, 1,
-0.7208266, -1.107326, -0.7989882, 0.5882353, 1, 0, 1,
-0.7192596, -0.5100223, -2.281624, 0.5843138, 1, 0, 1,
-0.7188932, 0.7340587, -0.3419847, 0.5764706, 1, 0, 1,
-0.7179457, 0.1208061, -2.591854, 0.572549, 1, 0, 1,
-0.7125624, 0.06337594, -1.935459, 0.5647059, 1, 0, 1,
-0.7091282, 1.585864, -0.9756945, 0.5607843, 1, 0, 1,
-0.7008762, -0.6557346, -2.148611, 0.5529412, 1, 0, 1,
-0.6941047, -0.666602, -1.688219, 0.5490196, 1, 0, 1,
-0.6939487, 1.082803, -2.358726, 0.5411765, 1, 0, 1,
-0.6913781, -0.7549776, -1.105804, 0.5372549, 1, 0, 1,
-0.6882383, -0.3786277, -3.089021, 0.5294118, 1, 0, 1,
-0.6880583, 0.2345306, 0.007994264, 0.5254902, 1, 0, 1,
-0.6859105, 0.7092424, -0.2224177, 0.5176471, 1, 0, 1,
-0.6841761, 0.3017631, -0.8033635, 0.5137255, 1, 0, 1,
-0.6762686, 0.02510224, -1.129482, 0.5058824, 1, 0, 1,
-0.6757098, -1.739427, -4.464604, 0.5019608, 1, 0, 1,
-0.6757098, -0.5940505, -3.251187, 0.4941176, 1, 0, 1,
-0.6597177, -1.159042, -3.105365, 0.4862745, 1, 0, 1,
-0.6521615, 1.884229, 2.018557, 0.4823529, 1, 0, 1,
-0.6420925, 0.9208866, -0.9169328, 0.4745098, 1, 0, 1,
-0.6396534, -0.1217757, -1.812348, 0.4705882, 1, 0, 1,
-0.6334978, -1.08508, -3.326004, 0.4627451, 1, 0, 1,
-0.6328094, -0.03246691, -1.974471, 0.4588235, 1, 0, 1,
-0.6317657, -1.995389, -2.084372, 0.4509804, 1, 0, 1,
-0.6316103, 0.204649, -1.104065, 0.4470588, 1, 0, 1,
-0.6258278, -2.397189, -2.001777, 0.4392157, 1, 0, 1,
-0.6246268, 0.7173405, -1.837216, 0.4352941, 1, 0, 1,
-0.6186927, -0.5951304, -3.235323, 0.427451, 1, 0, 1,
-0.6174394, -1.435407, -3.692883, 0.4235294, 1, 0, 1,
-0.6162187, 0.2673249, -1.488483, 0.4156863, 1, 0, 1,
-0.6129003, 0.2353403, -2.408916, 0.4117647, 1, 0, 1,
-0.6128358, -0.6563045, -1.957819, 0.4039216, 1, 0, 1,
-0.6115309, 0.1521376, -0.356013, 0.3960784, 1, 0, 1,
-0.609882, 0.08572987, -0.4562343, 0.3921569, 1, 0, 1,
-0.6078614, -1.093169, -2.985684, 0.3843137, 1, 0, 1,
-0.6056843, 0.2318622, -0.7420979, 0.3803922, 1, 0, 1,
-0.6035616, 0.677514, -0.6707022, 0.372549, 1, 0, 1,
-0.5995532, -0.8372668, -3.703722, 0.3686275, 1, 0, 1,
-0.5983869, -0.6262009, -3.119757, 0.3607843, 1, 0, 1,
-0.5978717, 1.006728, 0.7625757, 0.3568628, 1, 0, 1,
-0.5953096, -0.2145419, -1.872491, 0.3490196, 1, 0, 1,
-0.589999, -0.5615386, -3.751135, 0.345098, 1, 0, 1,
-0.5882517, -0.5215881, -2.854773, 0.3372549, 1, 0, 1,
-0.582555, 1.057107, 0.6084446, 0.3333333, 1, 0, 1,
-0.5795666, 1.632841, 0.205598, 0.3254902, 1, 0, 1,
-0.5793181, -0.2050617, -3.070207, 0.3215686, 1, 0, 1,
-0.5792683, -0.7834304, -2.798902, 0.3137255, 1, 0, 1,
-0.5789649, -0.49294, -0.3244634, 0.3098039, 1, 0, 1,
-0.5785298, -0.9704841, -1.634383, 0.3019608, 1, 0, 1,
-0.5777521, 0.1260199, -0.466688, 0.2941177, 1, 0, 1,
-0.5775051, -0.4856348, -2.123731, 0.2901961, 1, 0, 1,
-0.5761662, 0.2132445, -0.02237214, 0.282353, 1, 0, 1,
-0.5648447, 1.182101, -0.5307161, 0.2784314, 1, 0, 1,
-0.5483043, 0.5744287, -1.736385, 0.2705882, 1, 0, 1,
-0.5434133, 0.122218, -0.497056, 0.2666667, 1, 0, 1,
-0.5404865, 0.1024038, -2.485502, 0.2588235, 1, 0, 1,
-0.5397888, 1.373444, 0.09769963, 0.254902, 1, 0, 1,
-0.5318388, -0.7458207, -3.591727, 0.2470588, 1, 0, 1,
-0.5295186, -0.5845132, -2.35011, 0.2431373, 1, 0, 1,
-0.5279454, 0.1784651, -2.428184, 0.2352941, 1, 0, 1,
-0.5270762, 1.44834, -0.9484295, 0.2313726, 1, 0, 1,
-0.5247185, -2.330134, -2.443801, 0.2235294, 1, 0, 1,
-0.5237564, 1.082245, -0.216108, 0.2196078, 1, 0, 1,
-0.5179461, -0.9780965, -2.411728, 0.2117647, 1, 0, 1,
-0.5133989, 0.9769077, -1.406319, 0.2078431, 1, 0, 1,
-0.5119715, -0.9482806, -2.961188, 0.2, 1, 0, 1,
-0.5084708, 1.910243, -1.995326, 0.1921569, 1, 0, 1,
-0.5046042, 0.2030336, -0.4971743, 0.1882353, 1, 0, 1,
-0.5014053, 0.09510037, -1.718619, 0.1803922, 1, 0, 1,
-0.499325, -0.1007917, -2.722342, 0.1764706, 1, 0, 1,
-0.4990127, -0.1689664, -0.6739966, 0.1686275, 1, 0, 1,
-0.496857, -0.1301261, -2.06565, 0.1647059, 1, 0, 1,
-0.4932572, -0.1370933, -0.8338176, 0.1568628, 1, 0, 1,
-0.4842084, -1.190426, -4.097116, 0.1529412, 1, 0, 1,
-0.4835614, -0.05858548, -0.1402474, 0.145098, 1, 0, 1,
-0.4813363, -1.310115, -2.766918, 0.1411765, 1, 0, 1,
-0.4811006, -1.854024, -1.430164, 0.1333333, 1, 0, 1,
-0.4810111, -0.7557715, -2.428714, 0.1294118, 1, 0, 1,
-0.4804931, -0.9786856, -1.716316, 0.1215686, 1, 0, 1,
-0.4786664, -0.1198935, -1.144291, 0.1176471, 1, 0, 1,
-0.4783076, 0.0562897, -0.7548498, 0.1098039, 1, 0, 1,
-0.4754748, -0.8334731, -1.127295, 0.1058824, 1, 0, 1,
-0.4750818, -0.5658476, -1.495256, 0.09803922, 1, 0, 1,
-0.4743159, -1.354307, -2.891903, 0.09019608, 1, 0, 1,
-0.4720992, -1.249374, -3.86311, 0.08627451, 1, 0, 1,
-0.4716959, 0.959725, 1.085245, 0.07843138, 1, 0, 1,
-0.4649577, 2.278408, 0.6961939, 0.07450981, 1, 0, 1,
-0.4637223, -0.3430523, -2.158775, 0.06666667, 1, 0, 1,
-0.4626118, 0.1177605, -0.4267241, 0.0627451, 1, 0, 1,
-0.4608701, -2.339645, -2.372021, 0.05490196, 1, 0, 1,
-0.4542806, -0.5543924, -2.533753, 0.05098039, 1, 0, 1,
-0.4414885, -0.09297765, -1.164925, 0.04313726, 1, 0, 1,
-0.4412356, 1.505929, -0.6210068, 0.03921569, 1, 0, 1,
-0.4382672, -1.9305, -3.671066, 0.03137255, 1, 0, 1,
-0.4362372, -0.93903, -4.794416, 0.02745098, 1, 0, 1,
-0.4354729, 1.280179, -0.5498183, 0.01960784, 1, 0, 1,
-0.4344338, 0.02804, -1.771502, 0.01568628, 1, 0, 1,
-0.4298413, 1.355351, -1.304071, 0.007843138, 1, 0, 1,
-0.4275001, 1.685966, -0.9168621, 0.003921569, 1, 0, 1,
-0.4256859, 0.9289022, -0.6751161, 0, 1, 0.003921569, 1,
-0.423115, 0.2169841, -1.050748, 0, 1, 0.01176471, 1,
-0.4217322, 1.016856, 0.9216549, 0, 1, 0.01568628, 1,
-0.417604, 0.9067311, -0.6425101, 0, 1, 0.02352941, 1,
-0.4173467, -1.282246, -4.689687, 0, 1, 0.02745098, 1,
-0.4152866, 0.4708291, -0.885662, 0, 1, 0.03529412, 1,
-0.4135482, -0.3084657, -1.493098, 0, 1, 0.03921569, 1,
-0.4119818, 0.5714501, -0.9022374, 0, 1, 0.04705882, 1,
-0.4051601, 1.502868, 0.65411, 0, 1, 0.05098039, 1,
-0.3838874, -2.093939, -4.988689, 0, 1, 0.05882353, 1,
-0.3819587, -1.545556, -4.091745, 0, 1, 0.0627451, 1,
-0.3793481, 2.132695, -1.25029, 0, 1, 0.07058824, 1,
-0.3763916, -0.3059903, -2.013758, 0, 1, 0.07450981, 1,
-0.3618472, 0.09636998, 0.2310957, 0, 1, 0.08235294, 1,
-0.3595588, -0.648869, -2.35021, 0, 1, 0.08627451, 1,
-0.3589647, 0.1663646, -2.575945, 0, 1, 0.09411765, 1,
-0.3586853, -0.2551108, -3.736823, 0, 1, 0.1019608, 1,
-0.3580305, 0.0553994, 0.3443336, 0, 1, 0.1058824, 1,
-0.3574852, -0.1421202, -1.230935, 0, 1, 0.1137255, 1,
-0.3571233, 0.8648902, -0.4489199, 0, 1, 0.1176471, 1,
-0.3507028, -2.095181, -4.20983, 0, 1, 0.1254902, 1,
-0.3498797, 0.7312173, -0.8130236, 0, 1, 0.1294118, 1,
-0.3494214, -0.5243486, -2.178044, 0, 1, 0.1372549, 1,
-0.3479659, 0.1009087, -0.628932, 0, 1, 0.1411765, 1,
-0.3429861, 1.726009, -0.2748213, 0, 1, 0.1490196, 1,
-0.3423718, 1.070978, -0.2664099, 0, 1, 0.1529412, 1,
-0.338816, 0.6257913, -1.149533, 0, 1, 0.1607843, 1,
-0.336078, -1.470986, -4.774188, 0, 1, 0.1647059, 1,
-0.3316416, 1.785413, 0.1977815, 0, 1, 0.172549, 1,
-0.328441, -0.1309293, -3.60213, 0, 1, 0.1764706, 1,
-0.3093351, -0.5716712, -2.142385, 0, 1, 0.1843137, 1,
-0.3090337, -0.3070146, -2.493893, 0, 1, 0.1882353, 1,
-0.2997622, 1.040048, 0.5853, 0, 1, 0.1960784, 1,
-0.2989255, -0.6633132, -2.202164, 0, 1, 0.2039216, 1,
-0.2908351, 0.3323199, -1.155444, 0, 1, 0.2078431, 1,
-0.2902049, -0.2914397, -2.280227, 0, 1, 0.2156863, 1,
-0.289962, 0.3710387, -1.219228, 0, 1, 0.2196078, 1,
-0.289069, 0.2013596, -0.5587365, 0, 1, 0.227451, 1,
-0.2876549, 2.714831, 0.3977132, 0, 1, 0.2313726, 1,
-0.2863471, 0.707072, 0.9024721, 0, 1, 0.2392157, 1,
-0.2810923, -0.3617315, -3.422668, 0, 1, 0.2431373, 1,
-0.2796108, 0.5097827, -0.3303678, 0, 1, 0.2509804, 1,
-0.2760673, 0.7189264, -0.5869579, 0, 1, 0.254902, 1,
-0.2760072, -0.5676703, -1.17959, 0, 1, 0.2627451, 1,
-0.2660865, -0.6582047, -2.092096, 0, 1, 0.2666667, 1,
-0.2651388, 1.185554, 0.8205314, 0, 1, 0.2745098, 1,
-0.2617282, -1.31251, -3.915908, 0, 1, 0.2784314, 1,
-0.2615471, -1.214215, -3.685226, 0, 1, 0.2862745, 1,
-0.2613538, -0.5184829, -1.42795, 0, 1, 0.2901961, 1,
-0.2583904, -0.3339489, -2.090849, 0, 1, 0.2980392, 1,
-0.256704, 1.582841, -0.6839382, 0, 1, 0.3058824, 1,
-0.2564656, -0.3521048, -0.9216065, 0, 1, 0.3098039, 1,
-0.2561224, -0.528132, -0.7701342, 0, 1, 0.3176471, 1,
-0.2500699, -0.887067, -2.190297, 0, 1, 0.3215686, 1,
-0.2497898, 0.5973272, -0.4526686, 0, 1, 0.3294118, 1,
-0.2368258, 0.4751768, -0.4688624, 0, 1, 0.3333333, 1,
-0.236707, 0.7886558, -0.6755115, 0, 1, 0.3411765, 1,
-0.2366744, 2.011325, 0.7223417, 0, 1, 0.345098, 1,
-0.2339155, 0.6818289, -0.3531531, 0, 1, 0.3529412, 1,
-0.2323739, -0.102079, -3.567564, 0, 1, 0.3568628, 1,
-0.2296099, -0.7776562, -2.757504, 0, 1, 0.3647059, 1,
-0.2294695, 0.4985008, 1.207594, 0, 1, 0.3686275, 1,
-0.2294254, 2.136696, 1.689675, 0, 1, 0.3764706, 1,
-0.2243163, 1.856938, 0.7505805, 0, 1, 0.3803922, 1,
-0.2209301, 1.279529, 0.3310274, 0, 1, 0.3882353, 1,
-0.2196168, -0.9059578, -3.114051, 0, 1, 0.3921569, 1,
-0.2186373, 1.155364, 0.3070929, 0, 1, 0.4, 1,
-0.2160158, -1.202499, -3.326351, 0, 1, 0.4078431, 1,
-0.2139262, -0.4765769, -1.816758, 0, 1, 0.4117647, 1,
-0.2115262, -0.4299434, -3.463715, 0, 1, 0.4196078, 1,
-0.2056054, 0.03603428, -0.5952563, 0, 1, 0.4235294, 1,
-0.2046763, -0.04614898, -2.944354, 0, 1, 0.4313726, 1,
-0.2046721, 1.040102, 0.6689131, 0, 1, 0.4352941, 1,
-0.2002555, 0.1962102, 0.118102, 0, 1, 0.4431373, 1,
-0.1899973, -0.4952857, -2.705323, 0, 1, 0.4470588, 1,
-0.1888893, -0.3667381, -2.27847, 0, 1, 0.454902, 1,
-0.1876175, -1.294221, -4.379234, 0, 1, 0.4588235, 1,
-0.1873843, -1.181723, -3.366385, 0, 1, 0.4666667, 1,
-0.1830328, 0.6870862, -1.429153, 0, 1, 0.4705882, 1,
-0.1799204, 0.2329521, -1.395666, 0, 1, 0.4784314, 1,
-0.1778491, 1.399825, 0.05723637, 0, 1, 0.4823529, 1,
-0.1738293, 0.700074, -1.712684, 0, 1, 0.4901961, 1,
-0.1693549, 1.305567, 1.350864, 0, 1, 0.4941176, 1,
-0.16619, 0.9611797, -1.097836, 0, 1, 0.5019608, 1,
-0.1644225, -0.9509379, -4.225441, 0, 1, 0.509804, 1,
-0.1628047, -1.005341, -2.862085, 0, 1, 0.5137255, 1,
-0.1623434, -1.150761, -3.75452, 0, 1, 0.5215687, 1,
-0.1588338, 0.376753, 1.280024, 0, 1, 0.5254902, 1,
-0.1579616, -0.7251691, -4.36494, 0, 1, 0.5333334, 1,
-0.1566799, -0.2563091, -1.781918, 0, 1, 0.5372549, 1,
-0.1499404, -0.5782263, -2.93103, 0, 1, 0.5450981, 1,
-0.1498203, -0.9486781, -1.465288, 0, 1, 0.5490196, 1,
-0.1455716, -0.885823, -3.616096, 0, 1, 0.5568628, 1,
-0.1437656, 2.750401, -1.335118, 0, 1, 0.5607843, 1,
-0.1405781, -0.4805139, -2.37519, 0, 1, 0.5686275, 1,
-0.1395659, -1.52214, -3.366657, 0, 1, 0.572549, 1,
-0.1349754, 1.782879, -0.02878454, 0, 1, 0.5803922, 1,
-0.1337913, -0.05010332, -1.518182, 0, 1, 0.5843138, 1,
-0.1285682, 0.01166509, -1.529361, 0, 1, 0.5921569, 1,
-0.1278213, -0.1840383, -2.400604, 0, 1, 0.5960785, 1,
-0.1276213, -0.9106001, -3.246512, 0, 1, 0.6039216, 1,
-0.1268125, -1.019746, -4.180333, 0, 1, 0.6117647, 1,
-0.1252159, 0.2055136, -0.4602507, 0, 1, 0.6156863, 1,
-0.1247474, -0.8810647, -1.381107, 0, 1, 0.6235294, 1,
-0.1246611, -0.1272317, -2.296843, 0, 1, 0.627451, 1,
-0.1232228, 1.682362, -0.2381972, 0, 1, 0.6352941, 1,
-0.1210047, 0.453368, -1.284143, 0, 1, 0.6392157, 1,
-0.1148737, 0.5287514, -1.575482, 0, 1, 0.6470588, 1,
-0.1130319, 1.352268, -0.283533, 0, 1, 0.6509804, 1,
-0.1107892, 0.4320796, 0.6129794, 0, 1, 0.6588235, 1,
-0.1102017, -0.7979923, -2.101348, 0, 1, 0.6627451, 1,
-0.1085297, -1.189005, -3.827132, 0, 1, 0.6705883, 1,
-0.1063055, 0.8578011, -0.08948619, 0, 1, 0.6745098, 1,
-0.1034912, -0.4270963, -0.9326432, 0, 1, 0.682353, 1,
-0.1014756, 1.65453, -1.323699, 0, 1, 0.6862745, 1,
-0.09738921, -0.4268078, -3.368247, 0, 1, 0.6941177, 1,
-0.09707172, -1.844835, -2.173801, 0, 1, 0.7019608, 1,
-0.09616791, 0.5816424, -0.4802, 0, 1, 0.7058824, 1,
-0.09476462, 0.967672, 0.5210063, 0, 1, 0.7137255, 1,
-0.09409723, 1.011042, -0.5645754, 0, 1, 0.7176471, 1,
-0.09367085, 0.005015792, -1.46742, 0, 1, 0.7254902, 1,
-0.09348962, 0.2417779, -0.4799091, 0, 1, 0.7294118, 1,
-0.09312749, 0.9857808, -1.725754, 0, 1, 0.7372549, 1,
-0.09171156, 0.1957948, 0.9880608, 0, 1, 0.7411765, 1,
-0.09098154, -1.184582, -2.944418, 0, 1, 0.7490196, 1,
-0.08960863, -0.5778211, -2.705635, 0, 1, 0.7529412, 1,
-0.0870183, 1.029926, -0.5012041, 0, 1, 0.7607843, 1,
-0.08464254, 1.485526, 2.249494, 0, 1, 0.7647059, 1,
-0.08273033, -0.2052123, -4.153723, 0, 1, 0.772549, 1,
-0.08100188, -0.4116284, -2.589177, 0, 1, 0.7764706, 1,
-0.08079208, 1.747108, -0.2783767, 0, 1, 0.7843137, 1,
-0.08060012, 0.1054122, -0.7560657, 0, 1, 0.7882353, 1,
-0.0776711, 0.3891076, -0.4697136, 0, 1, 0.7960784, 1,
-0.07513187, 0.7607741, 1.337661, 0, 1, 0.8039216, 1,
-0.06687802, -0.2914377, -2.351641, 0, 1, 0.8078431, 1,
-0.06614488, -1.124966, -3.14933, 0, 1, 0.8156863, 1,
-0.06059451, -0.7703494, -2.195203, 0, 1, 0.8196079, 1,
-0.05396584, -0.06964999, -2.829757, 0, 1, 0.827451, 1,
-0.04756042, 0.396353, 0.05868404, 0, 1, 0.8313726, 1,
-0.03622708, -0.4051218, -2.803141, 0, 1, 0.8392157, 1,
-0.03576149, -0.1017256, -3.805699, 0, 1, 0.8431373, 1,
-0.03546508, -0.9451258, -1.121014, 0, 1, 0.8509804, 1,
-0.03443901, -1.240621, -5.632955, 0, 1, 0.854902, 1,
-0.03120699, -0.3807904, -3.17748, 0, 1, 0.8627451, 1,
-0.02616241, -0.2406918, -1.537248, 0, 1, 0.8666667, 1,
-0.02209596, 0.237475, 0.5255731, 0, 1, 0.8745098, 1,
-0.0220891, 0.09853403, -0.8234106, 0, 1, 0.8784314, 1,
-0.02014208, 0.3815137, -0.9258034, 0, 1, 0.8862745, 1,
-0.01222166, -0.2406373, -3.75397, 0, 1, 0.8901961, 1,
-0.01174074, 0.1139508, -0.7310878, 0, 1, 0.8980392, 1,
-0.01033151, -0.9498725, -3.116951, 0, 1, 0.9058824, 1,
-0.007984197, -0.1994707, -2.222999, 0, 1, 0.9098039, 1,
-0.007965576, 0.1146446, 0.2801599, 0, 1, 0.9176471, 1,
-0.007875558, -0.3873839, -2.975607, 0, 1, 0.9215686, 1,
-0.007804892, 0.1807895, 0.8911749, 0, 1, 0.9294118, 1,
-0.003894944, -1.102063, -3.199754, 0, 1, 0.9333333, 1,
-0.003798881, 1.246167, 1.387238, 0, 1, 0.9411765, 1,
-0.003296132, -1.683064, -1.518748, 0, 1, 0.945098, 1,
-0.00213708, -0.2838753, -2.841891, 0, 1, 0.9529412, 1,
0.001779738, 0.4169587, -0.3056099, 0, 1, 0.9568627, 1,
0.002210291, 1.68179, 1.429183, 0, 1, 0.9647059, 1,
0.00658431, 0.9764962, -0.3437832, 0, 1, 0.9686275, 1,
0.01172274, 0.2091307, -0.3576339, 0, 1, 0.9764706, 1,
0.01184096, 1.988478, 1.632213, 0, 1, 0.9803922, 1,
0.01272882, 1.366422, -1.51387, 0, 1, 0.9882353, 1,
0.01761972, 1.100048, 0.7803366, 0, 1, 0.9921569, 1,
0.02437827, -0.3210473, 3.568162, 0, 1, 1, 1,
0.03371974, 1.976998, 0.06960221, 0, 0.9921569, 1, 1,
0.03387824, -0.5656093, 3.358275, 0, 0.9882353, 1, 1,
0.04141068, -0.8440959, 3.469607, 0, 0.9803922, 1, 1,
0.048548, 0.01517394, 1.757039, 0, 0.9764706, 1, 1,
0.04889912, -1.014343, 4.122762, 0, 0.9686275, 1, 1,
0.05221119, -1.930547, 4.197483, 0, 0.9647059, 1, 1,
0.05513084, -0.1217853, 1.986789, 0, 0.9568627, 1, 1,
0.06159675, -0.9118267, 1.544891, 0, 0.9529412, 1, 1,
0.06418079, -1.400865, 2.585169, 0, 0.945098, 1, 1,
0.07567311, -0.1328393, 3.683944, 0, 0.9411765, 1, 1,
0.07612594, 0.2944562, -0.4680563, 0, 0.9333333, 1, 1,
0.07885937, -0.8758979, 3.743061, 0, 0.9294118, 1, 1,
0.08335818, -0.04369712, 3.048983, 0, 0.9215686, 1, 1,
0.0842694, 0.2606227, 0.0763092, 0, 0.9176471, 1, 1,
0.09009781, 1.177354, -0.8343543, 0, 0.9098039, 1, 1,
0.09064838, -0.5046127, 5.361726, 0, 0.9058824, 1, 1,
0.09311691, -0.4632555, 1.829839, 0, 0.8980392, 1, 1,
0.09915841, -0.1142343, 3.096414, 0, 0.8901961, 1, 1,
0.1036177, -0.2332179, 1.828202, 0, 0.8862745, 1, 1,
0.1077175, 0.1427605, 1.780512, 0, 0.8784314, 1, 1,
0.1083073, -0.7414215, 3.84961, 0, 0.8745098, 1, 1,
0.1091778, 0.1996778, 2.613862, 0, 0.8666667, 1, 1,
0.1097054, 0.9591249, 1.248171, 0, 0.8627451, 1, 1,
0.1171287, 0.5303549, 1.82102, 0, 0.854902, 1, 1,
0.1211863, -0.7012632, 1.828724, 0, 0.8509804, 1, 1,
0.1214844, 0.9565233, 0.2341406, 0, 0.8431373, 1, 1,
0.1239664, -0.7759184, 2.945548, 0, 0.8392157, 1, 1,
0.1263136, 1.136362, 1.123926, 0, 0.8313726, 1, 1,
0.1299853, 1.678344, 1.167133, 0, 0.827451, 1, 1,
0.1330849, 0.1298329, 1.202468, 0, 0.8196079, 1, 1,
0.1350082, -0.6739048, 3.560107, 0, 0.8156863, 1, 1,
0.1405961, -0.07097722, 1.898805, 0, 0.8078431, 1, 1,
0.1474025, 1.237802, 0.2716004, 0, 0.8039216, 1, 1,
0.1482637, -1.780915, 2.725149, 0, 0.7960784, 1, 1,
0.1560448, 0.5308817, -1.493285, 0, 0.7882353, 1, 1,
0.1563533, -0.3507751, 3.496073, 0, 0.7843137, 1, 1,
0.1572006, 0.6248626, 0.9776306, 0, 0.7764706, 1, 1,
0.1600736, -0.003402818, 0.3151621, 0, 0.772549, 1, 1,
0.1606131, -0.8658556, 5.112208, 0, 0.7647059, 1, 1,
0.1661143, -1.591317, 4.801769, 0, 0.7607843, 1, 1,
0.1675614, -2.071766, 3.998049, 0, 0.7529412, 1, 1,
0.1678796, 0.2636811, -1.62921, 0, 0.7490196, 1, 1,
0.1685729, 0.2981772, 1.25496, 0, 0.7411765, 1, 1,
0.1693581, -1.925591, 2.696503, 0, 0.7372549, 1, 1,
0.1700047, 1.803657, -0.3401308, 0, 0.7294118, 1, 1,
0.1767568, -0.5376438, 2.085399, 0, 0.7254902, 1, 1,
0.1795459, 1.443443, -1.080699, 0, 0.7176471, 1, 1,
0.1851619, -0.1427898, 0.1455033, 0, 0.7137255, 1, 1,
0.1870072, 2.496583, -0.6574819, 0, 0.7058824, 1, 1,
0.1886574, -1.110331, 2.749801, 0, 0.6980392, 1, 1,
0.191514, 0.311069, 0.3778996, 0, 0.6941177, 1, 1,
0.1935814, 0.8724611, 0.6672232, 0, 0.6862745, 1, 1,
0.1950011, -0.7765275, 4.562871, 0, 0.682353, 1, 1,
0.1955032, -0.6533726, 2.010113, 0, 0.6745098, 1, 1,
0.1958532, -0.02357038, 0.8364665, 0, 0.6705883, 1, 1,
0.1972063, -1.027981, 3.876449, 0, 0.6627451, 1, 1,
0.1996451, -1.265128, 3.001748, 0, 0.6588235, 1, 1,
0.2010846, -0.8564256, 2.511729, 0, 0.6509804, 1, 1,
0.2012547, 0.4194923, -0.1215976, 0, 0.6470588, 1, 1,
0.2065122, -0.6939513, 3.15479, 0, 0.6392157, 1, 1,
0.2091306, 0.4008678, -1.087281, 0, 0.6352941, 1, 1,
0.2091867, 1.303522, -0.8289297, 0, 0.627451, 1, 1,
0.2178842, 1.284596, -0.3703759, 0, 0.6235294, 1, 1,
0.2241884, -0.2997655, 4.091286, 0, 0.6156863, 1, 1,
0.2275331, -0.5643156, 2.269742, 0, 0.6117647, 1, 1,
0.2285905, 1.064112, 1.381138, 0, 0.6039216, 1, 1,
0.2289795, 0.2958292, 2.475322, 0, 0.5960785, 1, 1,
0.2335312, -1.119883, 1.958188, 0, 0.5921569, 1, 1,
0.233545, 0.7411662, -0.6952782, 0, 0.5843138, 1, 1,
0.2357187, 0.268084, 0.7942197, 0, 0.5803922, 1, 1,
0.2387427, -0.643406, 1.944823, 0, 0.572549, 1, 1,
0.2390115, -1.724339, 2.909632, 0, 0.5686275, 1, 1,
0.2418555, 1.201489, 0.4410089, 0, 0.5607843, 1, 1,
0.2419171, 0.986872, 2.149705, 0, 0.5568628, 1, 1,
0.2439366, -1.100139, 1.846357, 0, 0.5490196, 1, 1,
0.246578, -1.497897, 3.075589, 0, 0.5450981, 1, 1,
0.2478701, 0.7298529, -2.330041, 0, 0.5372549, 1, 1,
0.2503496, -0.4845105, 1.753404, 0, 0.5333334, 1, 1,
0.2563445, -0.9385034, 4.567539, 0, 0.5254902, 1, 1,
0.2566324, -0.8623007, 1.688548, 0, 0.5215687, 1, 1,
0.2622751, -1.420471, 3.429275, 0, 0.5137255, 1, 1,
0.2642733, 0.9666769, -0.1339594, 0, 0.509804, 1, 1,
0.2669724, 0.4096344, 0.2296678, 0, 0.5019608, 1, 1,
0.2690242, 0.5828491, 0.5865934, 0, 0.4941176, 1, 1,
0.27259, -1.108406, 1.483785, 0, 0.4901961, 1, 1,
0.2763562, -0.2284176, 1.013543, 0, 0.4823529, 1, 1,
0.2782026, -1.010346, 1.392021, 0, 0.4784314, 1, 1,
0.2787398, 0.01864352, 2.324265, 0, 0.4705882, 1, 1,
0.2845426, 1.835719, 0.4832117, 0, 0.4666667, 1, 1,
0.2875796, 0.3613063, 1.638876, 0, 0.4588235, 1, 1,
0.2881365, 0.2877164, -0.3158462, 0, 0.454902, 1, 1,
0.2893627, 0.1730438, 0.7636889, 0, 0.4470588, 1, 1,
0.2905296, -0.7179573, 2.019311, 0, 0.4431373, 1, 1,
0.2914042, -1.66441, 3.754108, 0, 0.4352941, 1, 1,
0.2922504, -0.8561198, 1.311049, 0, 0.4313726, 1, 1,
0.2984852, 0.4196317, -0.1239155, 0, 0.4235294, 1, 1,
0.299757, 1.081772, -0.1311226, 0, 0.4196078, 1, 1,
0.3006715, 2.711985, -0.2444399, 0, 0.4117647, 1, 1,
0.3021203, -0.8587784, 2.938442, 0, 0.4078431, 1, 1,
0.3041423, -0.8967328, 2.423256, 0, 0.4, 1, 1,
0.3103061, -1.943634, 1.936985, 0, 0.3921569, 1, 1,
0.3160753, -0.456107, 2.095561, 0, 0.3882353, 1, 1,
0.3237701, 0.4954717, 1.043677, 0, 0.3803922, 1, 1,
0.3277035, -0.4543988, 2.054945, 0, 0.3764706, 1, 1,
0.329439, -1.146401, 2.502238, 0, 0.3686275, 1, 1,
0.3320734, -1.492912, 3.694077, 0, 0.3647059, 1, 1,
0.3354751, 0.8952231, 1.347183, 0, 0.3568628, 1, 1,
0.3366739, -0.4164486, 1.59055, 0, 0.3529412, 1, 1,
0.3368066, -0.3515809, 2.806234, 0, 0.345098, 1, 1,
0.3397256, -0.1004868, 0.5593945, 0, 0.3411765, 1, 1,
0.34001, -0.1367546, 4.581144, 0, 0.3333333, 1, 1,
0.3408527, -0.3893431, 0.9260014, 0, 0.3294118, 1, 1,
0.3449742, -0.6527918, 1.561167, 0, 0.3215686, 1, 1,
0.3492697, 0.267079, -1.024431, 0, 0.3176471, 1, 1,
0.3496114, -0.7785034, 3.464766, 0, 0.3098039, 1, 1,
0.3537677, -0.149409, 1.975369, 0, 0.3058824, 1, 1,
0.3537794, 0.2814755, -0.2835218, 0, 0.2980392, 1, 1,
0.3548733, 0.171214, -0.6441124, 0, 0.2901961, 1, 1,
0.3553218, -1.757764, 2.865179, 0, 0.2862745, 1, 1,
0.3587449, 1.168433, 1.803937, 0, 0.2784314, 1, 1,
0.3596561, 2.784086, 0.3003573, 0, 0.2745098, 1, 1,
0.3601384, -0.2506162, -0.3474506, 0, 0.2666667, 1, 1,
0.3614406, 1.129068, 0.2316986, 0, 0.2627451, 1, 1,
0.3621763, -0.7870247, 2.42754, 0, 0.254902, 1, 1,
0.3742301, 0.6023604, 1.34381, 0, 0.2509804, 1, 1,
0.3753966, -1.232132, 3.151799, 0, 0.2431373, 1, 1,
0.3760457, -0.6869851, 3.249711, 0, 0.2392157, 1, 1,
0.3806719, 0.6115333, -1.122429, 0, 0.2313726, 1, 1,
0.3836359, -0.6831463, 2.344879, 0, 0.227451, 1, 1,
0.3852854, 1.205121, 1.701393, 0, 0.2196078, 1, 1,
0.3870471, -0.2070451, 1.663517, 0, 0.2156863, 1, 1,
0.3885596, -2.044698, 2.627359, 0, 0.2078431, 1, 1,
0.3894633, -1.544177, 2.797255, 0, 0.2039216, 1, 1,
0.3928566, -0.718047, 1.24558, 0, 0.1960784, 1, 1,
0.3980288, -0.2253909, 3.590499, 0, 0.1882353, 1, 1,
0.4076209, 0.7950881, 0.3920873, 0, 0.1843137, 1, 1,
0.4108062, -0.3127914, 2.760137, 0, 0.1764706, 1, 1,
0.4157999, -0.01737128, 2.069481, 0, 0.172549, 1, 1,
0.4168877, 0.4504698, 1.846502, 0, 0.1647059, 1, 1,
0.4173885, 0.5657417, 1.814459, 0, 0.1607843, 1, 1,
0.4239443, 1.244823, -0.1041097, 0, 0.1529412, 1, 1,
0.4241765, -1.552067, 2.843839, 0, 0.1490196, 1, 1,
0.4271224, 1.457118, 0.7503422, 0, 0.1411765, 1, 1,
0.4288374, 0.008575609, 1.257882, 0, 0.1372549, 1, 1,
0.430118, 0.2186419, 0.5992415, 0, 0.1294118, 1, 1,
0.4349118, -1.058067, 3.103991, 0, 0.1254902, 1, 1,
0.4355415, 1.697991, -0.3156266, 0, 0.1176471, 1, 1,
0.4431238, 1.362342, -0.9224676, 0, 0.1137255, 1, 1,
0.4438567, -0.4283614, 3.28035, 0, 0.1058824, 1, 1,
0.4444209, 0.1897215, 2.765248, 0, 0.09803922, 1, 1,
0.4471866, 0.4160192, 2.639346, 0, 0.09411765, 1, 1,
0.4482085, -0.8798, 3.044477, 0, 0.08627451, 1, 1,
0.4511422, 0.3241664, 0.3510356, 0, 0.08235294, 1, 1,
0.4523641, 0.8276314, 0.5873377, 0, 0.07450981, 1, 1,
0.4529299, -0.386627, 2.700193, 0, 0.07058824, 1, 1,
0.455644, 1.152413, 0.5966662, 0, 0.0627451, 1, 1,
0.4564887, -0.01794336, 0.9382008, 0, 0.05882353, 1, 1,
0.4600738, -0.01399866, 1.800299, 0, 0.05098039, 1, 1,
0.4641971, 0.5585656, 2.351406, 0, 0.04705882, 1, 1,
0.4642065, -0.5403293, 2.442144, 0, 0.03921569, 1, 1,
0.471079, -1.161973, 2.886414, 0, 0.03529412, 1, 1,
0.4801731, 2.406397, 1.029338, 0, 0.02745098, 1, 1,
0.4809238, 1.69756, 1.355243, 0, 0.02352941, 1, 1,
0.4810273, -1.278014, 2.476752, 0, 0.01568628, 1, 1,
0.4822421, 0.3962014, 0.5204651, 0, 0.01176471, 1, 1,
0.496, -0.8313334, 3.417704, 0, 0.003921569, 1, 1,
0.49617, -0.2959523, 0.4718149, 0.003921569, 0, 1, 1,
0.5001382, -0.6986964, 2.914871, 0.007843138, 0, 1, 1,
0.5004491, 0.3532264, 1.378725, 0.01568628, 0, 1, 1,
0.5016525, 0.647218, 1.801139, 0.01960784, 0, 1, 1,
0.5022405, -0.01437571, 1.951031, 0.02745098, 0, 1, 1,
0.5022463, -0.08262421, 1.547262, 0.03137255, 0, 1, 1,
0.5028632, 1.581665, 1.878815, 0.03921569, 0, 1, 1,
0.5040349, 0.7688824, 0.9573914, 0.04313726, 0, 1, 1,
0.5059749, 0.800943, 1.012505, 0.05098039, 0, 1, 1,
0.5095474, -0.9747548, 3.012161, 0.05490196, 0, 1, 1,
0.5151691, -1.074129, 2.601636, 0.0627451, 0, 1, 1,
0.5182765, -1.81705, 1.669091, 0.06666667, 0, 1, 1,
0.5226202, -1.56146, 2.826787, 0.07450981, 0, 1, 1,
0.5271433, 0.9871175, -1.412638, 0.07843138, 0, 1, 1,
0.5302088, -1.078117, 2.139521, 0.08627451, 0, 1, 1,
0.5378579, -1.351617, 3.882886, 0.09019608, 0, 1, 1,
0.5381028, 1.455792, 0.3563335, 0.09803922, 0, 1, 1,
0.539732, -0.8678249, 2.267747, 0.1058824, 0, 1, 1,
0.5416162, -0.2090396, 2.529692, 0.1098039, 0, 1, 1,
0.5418051, -1.414343, 1.561274, 0.1176471, 0, 1, 1,
0.5469262, -0.575052, 1.711197, 0.1215686, 0, 1, 1,
0.551043, -0.7929395, 3.593208, 0.1294118, 0, 1, 1,
0.5519892, 0.3954239, -0.9132599, 0.1333333, 0, 1, 1,
0.5532534, 1.354979, 0.1954409, 0.1411765, 0, 1, 1,
0.5533372, -0.9847488, 3.069303, 0.145098, 0, 1, 1,
0.5559986, 0.3066608, 0.5365676, 0.1529412, 0, 1, 1,
0.5573699, 1.424799, -0.8755943, 0.1568628, 0, 1, 1,
0.5581777, 1.430785, 1.09976, 0.1647059, 0, 1, 1,
0.5624909, -0.9342058, 3.058545, 0.1686275, 0, 1, 1,
0.56626, 0.9087456, 1.265608, 0.1764706, 0, 1, 1,
0.566372, -0.5262023, 3.034175, 0.1803922, 0, 1, 1,
0.5676985, 0.119095, 2.031618, 0.1882353, 0, 1, 1,
0.5692447, 0.6456799, 0.3487224, 0.1921569, 0, 1, 1,
0.5713473, -0.5022424, 2.718974, 0.2, 0, 1, 1,
0.5756391, 1.049469, -1.849432, 0.2078431, 0, 1, 1,
0.57581, -0.5333448, 2.692851, 0.2117647, 0, 1, 1,
0.5800984, 1.316946, 0.777203, 0.2196078, 0, 1, 1,
0.5824044, -0.7269073, 3.286747, 0.2235294, 0, 1, 1,
0.5829164, -1.650992, 2.425916, 0.2313726, 0, 1, 1,
0.5832372, 0.5356061, 1.75321, 0.2352941, 0, 1, 1,
0.5850346, 0.9285942, -0.7581643, 0.2431373, 0, 1, 1,
0.5880008, -3.927035, 2.973744, 0.2470588, 0, 1, 1,
0.5919866, 0.1084101, -0.02387996, 0.254902, 0, 1, 1,
0.5931499, 0.2281735, 0.5712317, 0.2588235, 0, 1, 1,
0.5938877, -0.5742371, 2.069094, 0.2666667, 0, 1, 1,
0.5948542, 0.5773448, 1.325252, 0.2705882, 0, 1, 1,
0.5973678, 2.222804, 0.9448306, 0.2784314, 0, 1, 1,
0.598819, 1.438929, 0.4809006, 0.282353, 0, 1, 1,
0.6028431, -0.4100713, 3.286298, 0.2901961, 0, 1, 1,
0.6063053, 0.3462878, 2.140822, 0.2941177, 0, 1, 1,
0.6091391, -1.420513, 3.121365, 0.3019608, 0, 1, 1,
0.6147842, 0.6099869, -0.713581, 0.3098039, 0, 1, 1,
0.6181664, -0.5250573, 1.829998, 0.3137255, 0, 1, 1,
0.6215599, 0.8688547, -0.9363797, 0.3215686, 0, 1, 1,
0.6223814, 0.5841188, 1.19196, 0.3254902, 0, 1, 1,
0.6240863, -0.1810267, 2.080436, 0.3333333, 0, 1, 1,
0.6295035, -0.1532991, 0.0353009, 0.3372549, 0, 1, 1,
0.6314347, 0.3231874, 1.430393, 0.345098, 0, 1, 1,
0.6332874, 1.294848, 1.260992, 0.3490196, 0, 1, 1,
0.6357388, -0.7395276, 1.980257, 0.3568628, 0, 1, 1,
0.6362355, 1.858454, -0.8469545, 0.3607843, 0, 1, 1,
0.6366869, 1.453775, 1.451413, 0.3686275, 0, 1, 1,
0.6393599, 0.2116421, 2.034927, 0.372549, 0, 1, 1,
0.6420825, -0.8181254, 2.261178, 0.3803922, 0, 1, 1,
0.6464784, -1.164542, 1.606917, 0.3843137, 0, 1, 1,
0.650041, 0.5763183, 1.232891, 0.3921569, 0, 1, 1,
0.6522759, -1.429179, 2.912731, 0.3960784, 0, 1, 1,
0.656948, -0.1385655, 4.044271, 0.4039216, 0, 1, 1,
0.6578115, -0.5948012, 2.151732, 0.4117647, 0, 1, 1,
0.6582458, -0.5053242, 2.844342, 0.4156863, 0, 1, 1,
0.6594828, 0.8372669, 0.4921868, 0.4235294, 0, 1, 1,
0.6629795, -0.05256759, 1.308085, 0.427451, 0, 1, 1,
0.6674815, -1.619233, 2.972425, 0.4352941, 0, 1, 1,
0.66782, -1.327546, 3.067508, 0.4392157, 0, 1, 1,
0.6703928, 0.6805794, 3.208811, 0.4470588, 0, 1, 1,
0.6704534, -1.109469, 3.984146, 0.4509804, 0, 1, 1,
0.6763979, -2.045624, 3.76769, 0.4588235, 0, 1, 1,
0.6799923, 0.485781, 1.925595, 0.4627451, 0, 1, 1,
0.6801915, 1.129076, 0.04952207, 0.4705882, 0, 1, 1,
0.6911337, -0.7194954, 2.330833, 0.4745098, 0, 1, 1,
0.6927176, -1.291945, 1.656132, 0.4823529, 0, 1, 1,
0.693486, -0.6784887, 1.84414, 0.4862745, 0, 1, 1,
0.6989831, 0.3829446, 0.7949994, 0.4941176, 0, 1, 1,
0.7014523, 0.009192948, 1.052234, 0.5019608, 0, 1, 1,
0.7028353, 0.1274084, 1.323796, 0.5058824, 0, 1, 1,
0.704695, -0.6652583, 2.693135, 0.5137255, 0, 1, 1,
0.7064379, -0.9031441, 2.152208, 0.5176471, 0, 1, 1,
0.7072862, -0.0731096, 0.3014544, 0.5254902, 0, 1, 1,
0.7131204, -0.3052499, 2.105475, 0.5294118, 0, 1, 1,
0.714773, 0.8142697, -0.338163, 0.5372549, 0, 1, 1,
0.7266511, -0.4412803, 1.474568, 0.5411765, 0, 1, 1,
0.7335095, -1.605833, 1.620534, 0.5490196, 0, 1, 1,
0.7356971, 0.9638124, 1.02566, 0.5529412, 0, 1, 1,
0.7375064, 0.6713542, 0.8763983, 0.5607843, 0, 1, 1,
0.7395636, -0.7321267, 2.689609, 0.5647059, 0, 1, 1,
0.739951, 1.154982, 0.3083086, 0.572549, 0, 1, 1,
0.7479148, -0.4366502, 2.710182, 0.5764706, 0, 1, 1,
0.752005, -0.6705245, 3.006511, 0.5843138, 0, 1, 1,
0.7560157, 0.3593968, 2.556197, 0.5882353, 0, 1, 1,
0.7604286, 0.7295858, 0.137302, 0.5960785, 0, 1, 1,
0.7616667, -0.5027952, 1.379588, 0.6039216, 0, 1, 1,
0.7705668, 1.573813, 0.3314783, 0.6078432, 0, 1, 1,
0.772231, -0.638512, 2.201363, 0.6156863, 0, 1, 1,
0.773339, -0.6803584, 1.906151, 0.6196079, 0, 1, 1,
0.776099, 0.7051774, 1.602919, 0.627451, 0, 1, 1,
0.7796406, -1.412127, 1.916616, 0.6313726, 0, 1, 1,
0.7850527, 1.995512, 0.1821483, 0.6392157, 0, 1, 1,
0.7890545, 0.4836085, 0.8661085, 0.6431373, 0, 1, 1,
0.7987516, -0.6884804, 3.45848, 0.6509804, 0, 1, 1,
0.8008516, 1.416087, -0.1127441, 0.654902, 0, 1, 1,
0.8022518, 0.01179881, 3.148232, 0.6627451, 0, 1, 1,
0.8030532, -0.06336523, -1.144206, 0.6666667, 0, 1, 1,
0.8052422, -0.5135813, 2.235272, 0.6745098, 0, 1, 1,
0.8084245, -0.6722064, 1.693574, 0.6784314, 0, 1, 1,
0.8086883, 0.2053868, 1.701382, 0.6862745, 0, 1, 1,
0.8096991, 2.079652, 0.5075498, 0.6901961, 0, 1, 1,
0.8100458, -0.7361051, 1.731114, 0.6980392, 0, 1, 1,
0.8149457, 0.627044, 0.9416714, 0.7058824, 0, 1, 1,
0.8247061, -0.08949776, 1.803657, 0.7098039, 0, 1, 1,
0.8316202, 0.04691745, 0.04344458, 0.7176471, 0, 1, 1,
0.8379581, -0.7234187, 2.827275, 0.7215686, 0, 1, 1,
0.8380688, -0.6218255, 0.7822706, 0.7294118, 0, 1, 1,
0.8408763, -0.158154, 3.272084, 0.7333333, 0, 1, 1,
0.8461822, 0.6073356, 3.364449, 0.7411765, 0, 1, 1,
0.847078, 0.1973931, 0.4160752, 0.7450981, 0, 1, 1,
0.8522105, 0.136984, 2.491088, 0.7529412, 0, 1, 1,
0.8578491, 0.6632629, 2.305211, 0.7568628, 0, 1, 1,
0.8625575, 0.9870507, 0.3011515, 0.7647059, 0, 1, 1,
0.8682725, -0.160038, 0.2715559, 0.7686275, 0, 1, 1,
0.8702373, -1.78183, 2.991347, 0.7764706, 0, 1, 1,
0.8730117, 1.221579, 0.613121, 0.7803922, 0, 1, 1,
0.8747762, -2.056468, 2.306139, 0.7882353, 0, 1, 1,
0.8794391, 1.029163, 1.760286, 0.7921569, 0, 1, 1,
0.8798857, 1.206017, 1.358181, 0.8, 0, 1, 1,
0.8813135, -0.3077514, 1.106358, 0.8078431, 0, 1, 1,
0.8818777, 0.770789, 1.69755, 0.8117647, 0, 1, 1,
0.8820397, 0.1753331, 1.143607, 0.8196079, 0, 1, 1,
0.8825766, -0.2986153, 4.046222, 0.8235294, 0, 1, 1,
0.889101, -1.091898, 3.656944, 0.8313726, 0, 1, 1,
0.9060173, 0.2316503, -0.1918492, 0.8352941, 0, 1, 1,
0.9095927, -0.3141747, 2.09578, 0.8431373, 0, 1, 1,
0.9096906, -1.143422, 1.70084, 0.8470588, 0, 1, 1,
0.9147881, 0.9923916, 0.7485024, 0.854902, 0, 1, 1,
0.9222414, -1.798208, 2.162583, 0.8588235, 0, 1, 1,
0.9222887, 0.08034788, 1.831059, 0.8666667, 0, 1, 1,
0.925137, -0.1575974, 1.670699, 0.8705882, 0, 1, 1,
0.9325084, -0.7845465, 2.668418, 0.8784314, 0, 1, 1,
0.9353921, -0.6001588, 2.822963, 0.8823529, 0, 1, 1,
0.9378697, 0.063912, 2.127119, 0.8901961, 0, 1, 1,
0.9393759, 0.9980533, 0.775971, 0.8941177, 0, 1, 1,
0.9421818, -1.232295, 3.302684, 0.9019608, 0, 1, 1,
0.9499075, -0.5873754, 1.491205, 0.9098039, 0, 1, 1,
0.9534908, -0.5671932, 3.24028, 0.9137255, 0, 1, 1,
0.9548613, 0.6731679, 1.489604, 0.9215686, 0, 1, 1,
0.956293, -1.023912, 1.835439, 0.9254902, 0, 1, 1,
0.9701079, -1.831642, 3.263684, 0.9333333, 0, 1, 1,
0.9708536, -0.7362052, 2.643417, 0.9372549, 0, 1, 1,
0.9721477, -1.950726, 3.072303, 0.945098, 0, 1, 1,
0.9786047, 0.5542883, 1.315944, 0.9490196, 0, 1, 1,
0.9792253, 0.7567052, 0.7881706, 0.9568627, 0, 1, 1,
0.9792332, -0.5340534, 1.583999, 0.9607843, 0, 1, 1,
0.9810253, -1.6798, 1.704061, 0.9686275, 0, 1, 1,
0.9838967, -0.6213809, 0.6960241, 0.972549, 0, 1, 1,
0.9899577, 0.05751824, 1.646616, 0.9803922, 0, 1, 1,
0.9926561, 1.636601, 1.364784, 0.9843137, 0, 1, 1,
1.000949, -0.7249513, 4.157312, 0.9921569, 0, 1, 1,
1.005845, 0.2558759, 0.5328321, 0.9960784, 0, 1, 1,
1.010615, -0.3724169, 2.723585, 1, 0, 0.9960784, 1,
1.011506, 1.025921, 0.9706268, 1, 0, 0.9882353, 1,
1.012267, 0.8622271, 2.828478, 1, 0, 0.9843137, 1,
1.015074, -0.2530249, 3.101312, 1, 0, 0.9764706, 1,
1.025308, 0.5528117, 0.04684865, 1, 0, 0.972549, 1,
1.043367, 0.0003215128, 0.1145662, 1, 0, 0.9647059, 1,
1.054828, 0.1183083, 1.240178, 1, 0, 0.9607843, 1,
1.071473, 0.1771015, 3.388327, 1, 0, 0.9529412, 1,
1.08482, -0.2680196, 0.6443803, 1, 0, 0.9490196, 1,
1.09491, -0.4836799, 1.292695, 1, 0, 0.9411765, 1,
1.095653, -0.9819588, 1.862882, 1, 0, 0.9372549, 1,
1.096223, 0.7482601, 0.4673755, 1, 0, 0.9294118, 1,
1.09854, 2.522979, -0.3417843, 1, 0, 0.9254902, 1,
1.10453, -0.5176879, 2.138576, 1, 0, 0.9176471, 1,
1.110273, -1.100657, 1.170023, 1, 0, 0.9137255, 1,
1.113265, 1.955483, 2.170464, 1, 0, 0.9058824, 1,
1.116597, -0.2339385, 0.9142517, 1, 0, 0.9019608, 1,
1.11663, 0.2776379, 2.539778, 1, 0, 0.8941177, 1,
1.118128, 0.3843762, 0.5849254, 1, 0, 0.8862745, 1,
1.125116, -0.8288562, 2.035392, 1, 0, 0.8823529, 1,
1.126688, 0.768386, 1.06013, 1, 0, 0.8745098, 1,
1.130306, 1.337732, 0.8076429, 1, 0, 0.8705882, 1,
1.132907, 0.9006817, -0.3079449, 1, 0, 0.8627451, 1,
1.135117, -0.9476332, 2.174875, 1, 0, 0.8588235, 1,
1.135587, -0.2483777, 0.5698404, 1, 0, 0.8509804, 1,
1.136725, -1.129271, 1.313837, 1, 0, 0.8470588, 1,
1.137436, 0.3416288, 0.2346997, 1, 0, 0.8392157, 1,
1.14174, -0.4723677, 0.5734912, 1, 0, 0.8352941, 1,
1.147306, -0.1154095, 1.617252, 1, 0, 0.827451, 1,
1.15163, 1.454403, 0.4747064, 1, 0, 0.8235294, 1,
1.152728, 0.7867056, -0.3620411, 1, 0, 0.8156863, 1,
1.160877, 1.192005, -0.0001818139, 1, 0, 0.8117647, 1,
1.17119, -1.50599, 1.197771, 1, 0, 0.8039216, 1,
1.186857, -1.136149, 0.783893, 1, 0, 0.7960784, 1,
1.19307, -0.5123141, 4.041205, 1, 0, 0.7921569, 1,
1.193844, 0.5901552, 1.525975, 1, 0, 0.7843137, 1,
1.194053, -0.2855481, 1.111016, 1, 0, 0.7803922, 1,
1.200259, -2.092093, 2.193822, 1, 0, 0.772549, 1,
1.202643, 2.328096, -0.5522727, 1, 0, 0.7686275, 1,
1.204571, 0.9314784, 0.802645, 1, 0, 0.7607843, 1,
1.204823, 0.009954266, 2.211337, 1, 0, 0.7568628, 1,
1.206166, 0.03456328, 3.71009, 1, 0, 0.7490196, 1,
1.210641, -2.159976, 3.49519, 1, 0, 0.7450981, 1,
1.210778, -0.8438683, 4.213805, 1, 0, 0.7372549, 1,
1.213306, 1.396896, 0.956543, 1, 0, 0.7333333, 1,
1.215185, 1.404609, 0.4294061, 1, 0, 0.7254902, 1,
1.225242, -0.9956757, 1.866085, 1, 0, 0.7215686, 1,
1.228323, 1.871547, -0.3016811, 1, 0, 0.7137255, 1,
1.229691, -0.3016936, 4.195712, 1, 0, 0.7098039, 1,
1.23016, 0.5164794, 1.006996, 1, 0, 0.7019608, 1,
1.243524, -0.9119142, 4.129626, 1, 0, 0.6941177, 1,
1.244731, 0.017385, 1.552758, 1, 0, 0.6901961, 1,
1.247072, 0.6638539, 0.5514007, 1, 0, 0.682353, 1,
1.247853, -0.2944593, 2.480522, 1, 0, 0.6784314, 1,
1.252047, 1.915029, 2.076855, 1, 0, 0.6705883, 1,
1.262693, -1.71399, 3.467432, 1, 0, 0.6666667, 1,
1.279721, -0.3419606, 1.010843, 1, 0, 0.6588235, 1,
1.280038, -1.104734, 3.3583, 1, 0, 0.654902, 1,
1.281862, -0.1158943, 0.9619115, 1, 0, 0.6470588, 1,
1.284597, -0.1315693, 2.627409, 1, 0, 0.6431373, 1,
1.284836, -0.4309011, 2.588836, 1, 0, 0.6352941, 1,
1.286489, -1.257648, 3.204809, 1, 0, 0.6313726, 1,
1.287568, -1.117846, 2.32263, 1, 0, 0.6235294, 1,
1.289052, -0.06957836, -1.46165, 1, 0, 0.6196079, 1,
1.289924, -0.6766986, 2.985922, 1, 0, 0.6117647, 1,
1.292478, 0.1691673, 0.5781451, 1, 0, 0.6078432, 1,
1.294363, 1.299551, -0.5130048, 1, 0, 0.6, 1,
1.303201, -1.265199, 2.197515, 1, 0, 0.5921569, 1,
1.306396, 1.054809, 1.155698, 1, 0, 0.5882353, 1,
1.31691, 0.9306782, 0.1399988, 1, 0, 0.5803922, 1,
1.318642, 0.4517681, 1.615255, 1, 0, 0.5764706, 1,
1.319703, 1.119033, -0.3284169, 1, 0, 0.5686275, 1,
1.32863, 0.4069566, 0.8644335, 1, 0, 0.5647059, 1,
1.334744, 1.485469, 1.600559, 1, 0, 0.5568628, 1,
1.335829, -1.727831, 2.021155, 1, 0, 0.5529412, 1,
1.33629, 0.9366223, 0.310466, 1, 0, 0.5450981, 1,
1.338849, -0.1840048, 2.399598, 1, 0, 0.5411765, 1,
1.348126, -1.34376, 1.022903, 1, 0, 0.5333334, 1,
1.349679, 0.8019323, 1.542021, 1, 0, 0.5294118, 1,
1.356669, 0.2125716, 1.78458, 1, 0, 0.5215687, 1,
1.357082, 0.6881147, 1.767719, 1, 0, 0.5176471, 1,
1.361, 1.785228, 0.979448, 1, 0, 0.509804, 1,
1.363657, -0.3088254, 0.9985096, 1, 0, 0.5058824, 1,
1.364568, 1.020667, -0.2940778, 1, 0, 0.4980392, 1,
1.365406, -0.6598691, 1.55454, 1, 0, 0.4901961, 1,
1.372109, -2.124807, 4.001792, 1, 0, 0.4862745, 1,
1.404066, -1.789979, 2.869711, 1, 0, 0.4784314, 1,
1.406242, -1.860313, 2.577189, 1, 0, 0.4745098, 1,
1.413365, 1.676098, -0.9370793, 1, 0, 0.4666667, 1,
1.421231, 0.05680677, 0.4710511, 1, 0, 0.4627451, 1,
1.430256, -0.03437617, 1.699303, 1, 0, 0.454902, 1,
1.440397, -0.3022827, 2.198073, 1, 0, 0.4509804, 1,
1.452598, -0.3836822, 1.804062, 1, 0, 0.4431373, 1,
1.471984, -0.3722979, 1.884266, 1, 0, 0.4392157, 1,
1.481371, -1.486145, 0.03759174, 1, 0, 0.4313726, 1,
1.488529, 1.420048, 1.17277, 1, 0, 0.427451, 1,
1.493787, -0.2646015, 1.422622, 1, 0, 0.4196078, 1,
1.513907, 1.13435, 0.41298, 1, 0, 0.4156863, 1,
1.516785, -0.214843, 1.424788, 1, 0, 0.4078431, 1,
1.520826, -0.2791366, 0.4014314, 1, 0, 0.4039216, 1,
1.540369, -1.349583, 1.295145, 1, 0, 0.3960784, 1,
1.555287, 0.7955268, 0.8377324, 1, 0, 0.3882353, 1,
1.559075, 0.9149912, 1.175808, 1, 0, 0.3843137, 1,
1.592566, -1.387418, 2.88648, 1, 0, 0.3764706, 1,
1.597956, 0.02282208, 1.023186, 1, 0, 0.372549, 1,
1.599106, -0.1261302, 2.250082, 1, 0, 0.3647059, 1,
1.603276, 0.97737, 0.2479142, 1, 0, 0.3607843, 1,
1.603597, -0.8697484, 1.554643, 1, 0, 0.3529412, 1,
1.62672, 1.643168, -1.787804, 1, 0, 0.3490196, 1,
1.627862, -0.04461572, 0.5512832, 1, 0, 0.3411765, 1,
1.64438, 0.2052744, 1.667307, 1, 0, 0.3372549, 1,
1.645473, -0.8729116, 3.20884, 1, 0, 0.3294118, 1,
1.651622, 0.2965673, 0.2573529, 1, 0, 0.3254902, 1,
1.653119, 0.1749341, 0.01438526, 1, 0, 0.3176471, 1,
1.667882, -0.2524928, 2.650333, 1, 0, 0.3137255, 1,
1.678036, -0.3349847, 1.328013, 1, 0, 0.3058824, 1,
1.679688, 0.42368, 0.9695833, 1, 0, 0.2980392, 1,
1.682911, -2.979978, 4.356005, 1, 0, 0.2941177, 1,
1.683314, -1.130573, 1.766314, 1, 0, 0.2862745, 1,
1.693662, -1.783571, 3.266372, 1, 0, 0.282353, 1,
1.707217, -1.528733, 3.638679, 1, 0, 0.2745098, 1,
1.728953, 1.895469, 3.190966, 1, 0, 0.2705882, 1,
1.738352, 0.1872281, 1.087955, 1, 0, 0.2627451, 1,
1.741117, -0.5505999, 0.2368519, 1, 0, 0.2588235, 1,
1.745804, 0.4049377, 2.702072, 1, 0, 0.2509804, 1,
1.751599, -0.009856476, 1.302796, 1, 0, 0.2470588, 1,
1.780722, 0.0768797, 3.859765, 1, 0, 0.2392157, 1,
1.785988, 1.105522, 1.237563, 1, 0, 0.2352941, 1,
1.826169, 1.664123, 1.767866, 1, 0, 0.227451, 1,
1.912275, 1.304959, -0.4083496, 1, 0, 0.2235294, 1,
1.912567, 0.947872, 2.358518, 1, 0, 0.2156863, 1,
1.926716, -0.9591653, 2.87081, 1, 0, 0.2117647, 1,
1.928506, -0.5676531, 2.67969, 1, 0, 0.2039216, 1,
1.935319, -2.167025, 2.803535, 1, 0, 0.1960784, 1,
1.940118, 0.4110792, 0.8963613, 1, 0, 0.1921569, 1,
1.946107, 0.3503337, 1.375703, 1, 0, 0.1843137, 1,
1.947724, -0.05479461, 2.893696, 1, 0, 0.1803922, 1,
1.955116, 0.3408787, 2.318142, 1, 0, 0.172549, 1,
1.956684, 0.684489, 0.5034899, 1, 0, 0.1686275, 1,
1.980797, -1.128453, 1.309628, 1, 0, 0.1607843, 1,
1.991511, -0.09467294, 0.4705603, 1, 0, 0.1568628, 1,
1.993444, -1.312563, 3.450095, 1, 0, 0.1490196, 1,
2.00104, -0.2890191, 1.988195, 1, 0, 0.145098, 1,
2.012163, 1.632049, 1.441258, 1, 0, 0.1372549, 1,
2.027322, -0.9827377, 0.8497874, 1, 0, 0.1333333, 1,
2.042207, -0.1307902, -1.078301, 1, 0, 0.1254902, 1,
2.047251, -0.04734348, 2.004734, 1, 0, 0.1215686, 1,
2.067932, 0.5843769, 1.844273, 1, 0, 0.1137255, 1,
2.107141, -0.6362537, 2.944338, 1, 0, 0.1098039, 1,
2.124861, -0.275753, 1.505763, 1, 0, 0.1019608, 1,
2.199208, 1.52736, 1.050368, 1, 0, 0.09411765, 1,
2.220204, -0.7918718, 0.2773184, 1, 0, 0.09019608, 1,
2.231806, -0.5435929, 3.017663, 1, 0, 0.08235294, 1,
2.23779, 1.101295, 2.100867, 1, 0, 0.07843138, 1,
2.25737, 0.02217252, 0.3154853, 1, 0, 0.07058824, 1,
2.314801, -0.4133661, 1.719565, 1, 0, 0.06666667, 1,
2.314823, 0.06739354, 0.08571971, 1, 0, 0.05882353, 1,
2.335222, -0.4151632, 2.393729, 1, 0, 0.05490196, 1,
2.339269, 2.025472, 1.700261, 1, 0, 0.04705882, 1,
2.343365, -0.4600534, 1.108272, 1, 0, 0.04313726, 1,
2.348261, 0.181112, 0.4167508, 1, 0, 0.03529412, 1,
2.464786, 0.05412754, 1.592706, 1, 0, 0.03137255, 1,
2.473534, -1.523156, 1.688128, 1, 0, 0.02352941, 1,
2.517008, -0.8089287, 0.99423, 1, 0, 0.01960784, 1,
2.996307, 0.2785482, 0.506389, 1, 0, 0.01176471, 1,
3.229905, -0.8192508, 0.5504711, 1, 0, 0.007843138, 1
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
-0.1793636, -5.07353, -7.496553, 0, -0.5, 0.5, 0.5,
-0.1793636, -5.07353, -7.496553, 1, -0.5, 0.5, 0.5,
-0.1793636, -5.07353, -7.496553, 1, 1.5, 0.5, 0.5,
-0.1793636, -5.07353, -7.496553, 0, 1.5, 0.5, 0.5
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
-4.744374, -0.5450457, -7.496553, 0, -0.5, 0.5, 0.5,
-4.744374, -0.5450457, -7.496553, 1, -0.5, 0.5, 0.5,
-4.744374, -0.5450457, -7.496553, 1, 1.5, 0.5, 0.5,
-4.744374, -0.5450457, -7.496553, 0, 1.5, 0.5, 0.5
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
-4.744374, -5.07353, -0.1356144, 0, -0.5, 0.5, 0.5,
-4.744374, -5.07353, -0.1356144, 1, -0.5, 0.5, 0.5,
-4.744374, -5.07353, -0.1356144, 1, 1.5, 0.5, 0.5,
-4.744374, -5.07353, -0.1356144, 0, 1.5, 0.5, 0.5
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
-3, -4.028495, -5.797875,
3, -4.028495, -5.797875,
-3, -4.028495, -5.797875,
-3, -4.202668, -6.080988,
-2, -4.028495, -5.797875,
-2, -4.202668, -6.080988,
-1, -4.028495, -5.797875,
-1, -4.202668, -6.080988,
0, -4.028495, -5.797875,
0, -4.202668, -6.080988,
1, -4.028495, -5.797875,
1, -4.202668, -6.080988,
2, -4.028495, -5.797875,
2, -4.202668, -6.080988,
3, -4.028495, -5.797875,
3, -4.202668, -6.080988
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
-3, -4.551013, -6.647214, 0, -0.5, 0.5, 0.5,
-3, -4.551013, -6.647214, 1, -0.5, 0.5, 0.5,
-3, -4.551013, -6.647214, 1, 1.5, 0.5, 0.5,
-3, -4.551013, -6.647214, 0, 1.5, 0.5, 0.5,
-2, -4.551013, -6.647214, 0, -0.5, 0.5, 0.5,
-2, -4.551013, -6.647214, 1, -0.5, 0.5, 0.5,
-2, -4.551013, -6.647214, 1, 1.5, 0.5, 0.5,
-2, -4.551013, -6.647214, 0, 1.5, 0.5, 0.5,
-1, -4.551013, -6.647214, 0, -0.5, 0.5, 0.5,
-1, -4.551013, -6.647214, 1, -0.5, 0.5, 0.5,
-1, -4.551013, -6.647214, 1, 1.5, 0.5, 0.5,
-1, -4.551013, -6.647214, 0, 1.5, 0.5, 0.5,
0, -4.551013, -6.647214, 0, -0.5, 0.5, 0.5,
0, -4.551013, -6.647214, 1, -0.5, 0.5, 0.5,
0, -4.551013, -6.647214, 1, 1.5, 0.5, 0.5,
0, -4.551013, -6.647214, 0, 1.5, 0.5, 0.5,
1, -4.551013, -6.647214, 0, -0.5, 0.5, 0.5,
1, -4.551013, -6.647214, 1, -0.5, 0.5, 0.5,
1, -4.551013, -6.647214, 1, 1.5, 0.5, 0.5,
1, -4.551013, -6.647214, 0, 1.5, 0.5, 0.5,
2, -4.551013, -6.647214, 0, -0.5, 0.5, 0.5,
2, -4.551013, -6.647214, 1, -0.5, 0.5, 0.5,
2, -4.551013, -6.647214, 1, 1.5, 0.5, 0.5,
2, -4.551013, -6.647214, 0, 1.5, 0.5, 0.5,
3, -4.551013, -6.647214, 0, -0.5, 0.5, 0.5,
3, -4.551013, -6.647214, 1, -0.5, 0.5, 0.5,
3, -4.551013, -6.647214, 1, 1.5, 0.5, 0.5,
3, -4.551013, -6.647214, 0, 1.5, 0.5, 0.5
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
-3.69091, -3, -5.797875,
-3.69091, 2, -5.797875,
-3.69091, -3, -5.797875,
-3.866487, -3, -6.080988,
-3.69091, -2, -5.797875,
-3.866487, -2, -6.080988,
-3.69091, -1, -5.797875,
-3.866487, -1, -6.080988,
-3.69091, 0, -5.797875,
-3.866487, 0, -6.080988,
-3.69091, 1, -5.797875,
-3.866487, 1, -6.080988,
-3.69091, 2, -5.797875,
-3.866487, 2, -6.080988
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
-4.217642, -3, -6.647214, 0, -0.5, 0.5, 0.5,
-4.217642, -3, -6.647214, 1, -0.5, 0.5, 0.5,
-4.217642, -3, -6.647214, 1, 1.5, 0.5, 0.5,
-4.217642, -3, -6.647214, 0, 1.5, 0.5, 0.5,
-4.217642, -2, -6.647214, 0, -0.5, 0.5, 0.5,
-4.217642, -2, -6.647214, 1, -0.5, 0.5, 0.5,
-4.217642, -2, -6.647214, 1, 1.5, 0.5, 0.5,
-4.217642, -2, -6.647214, 0, 1.5, 0.5, 0.5,
-4.217642, -1, -6.647214, 0, -0.5, 0.5, 0.5,
-4.217642, -1, -6.647214, 1, -0.5, 0.5, 0.5,
-4.217642, -1, -6.647214, 1, 1.5, 0.5, 0.5,
-4.217642, -1, -6.647214, 0, 1.5, 0.5, 0.5,
-4.217642, 0, -6.647214, 0, -0.5, 0.5, 0.5,
-4.217642, 0, -6.647214, 1, -0.5, 0.5, 0.5,
-4.217642, 0, -6.647214, 1, 1.5, 0.5, 0.5,
-4.217642, 0, -6.647214, 0, 1.5, 0.5, 0.5,
-4.217642, 1, -6.647214, 0, -0.5, 0.5, 0.5,
-4.217642, 1, -6.647214, 1, -0.5, 0.5, 0.5,
-4.217642, 1, -6.647214, 1, 1.5, 0.5, 0.5,
-4.217642, 1, -6.647214, 0, 1.5, 0.5, 0.5,
-4.217642, 2, -6.647214, 0, -0.5, 0.5, 0.5,
-4.217642, 2, -6.647214, 1, -0.5, 0.5, 0.5,
-4.217642, 2, -6.647214, 1, 1.5, 0.5, 0.5,
-4.217642, 2, -6.647214, 0, 1.5, 0.5, 0.5
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
-3.69091, -4.028495, -4,
-3.69091, -4.028495, 4,
-3.69091, -4.028495, -4,
-3.866487, -4.202668, -4,
-3.69091, -4.028495, -2,
-3.866487, -4.202668, -2,
-3.69091, -4.028495, 0,
-3.866487, -4.202668, 0,
-3.69091, -4.028495, 2,
-3.866487, -4.202668, 2,
-3.69091, -4.028495, 4,
-3.866487, -4.202668, 4
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
-4.217642, -4.551013, -4, 0, -0.5, 0.5, 0.5,
-4.217642, -4.551013, -4, 1, -0.5, 0.5, 0.5,
-4.217642, -4.551013, -4, 1, 1.5, 0.5, 0.5,
-4.217642, -4.551013, -4, 0, 1.5, 0.5, 0.5,
-4.217642, -4.551013, -2, 0, -0.5, 0.5, 0.5,
-4.217642, -4.551013, -2, 1, -0.5, 0.5, 0.5,
-4.217642, -4.551013, -2, 1, 1.5, 0.5, 0.5,
-4.217642, -4.551013, -2, 0, 1.5, 0.5, 0.5,
-4.217642, -4.551013, 0, 0, -0.5, 0.5, 0.5,
-4.217642, -4.551013, 0, 1, -0.5, 0.5, 0.5,
-4.217642, -4.551013, 0, 1, 1.5, 0.5, 0.5,
-4.217642, -4.551013, 0, 0, 1.5, 0.5, 0.5,
-4.217642, -4.551013, 2, 0, -0.5, 0.5, 0.5,
-4.217642, -4.551013, 2, 1, -0.5, 0.5, 0.5,
-4.217642, -4.551013, 2, 1, 1.5, 0.5, 0.5,
-4.217642, -4.551013, 2, 0, 1.5, 0.5, 0.5,
-4.217642, -4.551013, 4, 0, -0.5, 0.5, 0.5,
-4.217642, -4.551013, 4, 1, -0.5, 0.5, 0.5,
-4.217642, -4.551013, 4, 1, 1.5, 0.5, 0.5,
-4.217642, -4.551013, 4, 0, 1.5, 0.5, 0.5
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
-3.69091, -4.028495, -5.797875,
-3.69091, 2.938404, -5.797875,
-3.69091, -4.028495, 5.526646,
-3.69091, 2.938404, 5.526646,
-3.69091, -4.028495, -5.797875,
-3.69091, -4.028495, 5.526646,
-3.69091, 2.938404, -5.797875,
-3.69091, 2.938404, 5.526646,
-3.69091, -4.028495, -5.797875,
3.332183, -4.028495, -5.797875,
-3.69091, -4.028495, 5.526646,
3.332183, -4.028495, 5.526646,
-3.69091, 2.938404, -5.797875,
3.332183, 2.938404, -5.797875,
-3.69091, 2.938404, 5.526646,
3.332183, 2.938404, 5.526646,
3.332183, -4.028495, -5.797875,
3.332183, 2.938404, -5.797875,
3.332183, -4.028495, 5.526646,
3.332183, 2.938404, 5.526646,
3.332183, -4.028495, -5.797875,
3.332183, -4.028495, 5.526646,
3.332183, 2.938404, -5.797875,
3.332183, 2.938404, 5.526646
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
var radius = 8.029376;
var distance = 35.7236;
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
mvMatrix.translate( 0.1793636, 0.5450457, 0.1356144 );
mvMatrix.scale( 1.236139, 1.246109, 0.7666124 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.7236);
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
pentachlorobenzene<-read.table("pentachlorobenzene.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pentachlorobenzene$V2
```

```
## Error in eval(expr, envir, enclos): object 'pentachlorobenzene' not found
```

```r
y<-pentachlorobenzene$V3
```

```
## Error in eval(expr, envir, enclos): object 'pentachlorobenzene' not found
```

```r
z<-pentachlorobenzene$V4
```

```
## Error in eval(expr, envir, enclos): object 'pentachlorobenzene' not found
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
-3.588632, 0.2366661, -0.5972373, 0, 0, 1, 1, 1,
-3.212218, 1.190051, -0.9681152, 1, 0, 0, 1, 1,
-3.057363, 0.1821172, -1.191397, 1, 0, 0, 1, 1,
-2.948163, -0.9875586, -3.456015, 1, 0, 0, 1, 1,
-2.86639, -0.5116668, -3.075325, 1, 0, 0, 1, 1,
-2.860962, 0.6488308, -1.706572, 1, 0, 0, 1, 1,
-2.766526, -0.5557508, -1.919501, 0, 0, 0, 1, 1,
-2.7344, -0.4867684, -1.911539, 0, 0, 0, 1, 1,
-2.702809, -0.7226358, -1.951127, 0, 0, 0, 1, 1,
-2.672437, 1.046701, -2.265593, 0, 0, 0, 1, 1,
-2.576143, 0.400464, -2.177764, 0, 0, 0, 1, 1,
-2.547719, 1.781887, -0.6004, 0, 0, 0, 1, 1,
-2.538895, -1.211774, -2.694238, 0, 0, 0, 1, 1,
-2.442303, 0.3565144, -2.511061, 1, 1, 1, 1, 1,
-2.408818, 0.2306596, -2.559569, 1, 1, 1, 1, 1,
-2.356536, -0.3118837, -1.149709, 1, 1, 1, 1, 1,
-2.336639, 0.8779263, -1.595286, 1, 1, 1, 1, 1,
-2.265349, 1.105663, -0.7381197, 1, 1, 1, 1, 1,
-2.179407, 1.289643, -1.416996, 1, 1, 1, 1, 1,
-2.168762, 0.3590855, -0.572657, 1, 1, 1, 1, 1,
-2.115683, -1.832102, -2.018978, 1, 1, 1, 1, 1,
-2.110708, 0.001901636, -0.4844914, 1, 1, 1, 1, 1,
-2.106323, -1.300548, -2.287014, 1, 1, 1, 1, 1,
-2.095889, -0.5281001, -1.691844, 1, 1, 1, 1, 1,
-2.050078, 0.8995641, -2.287596, 1, 1, 1, 1, 1,
-2.041274, 0.3317412, -0.6694511, 1, 1, 1, 1, 1,
-2.041179, 0.9144959, -1.639324, 1, 1, 1, 1, 1,
-2.020006, 2.575193, -0.5481375, 1, 1, 1, 1, 1,
-1.997615, -1.126009, -2.002805, 0, 0, 1, 1, 1,
-1.997367, -0.8646661, -2.388627, 1, 0, 0, 1, 1,
-1.94337, -0.04502289, -1.600059, 1, 0, 0, 1, 1,
-1.900509, 0.3922688, -1.318656, 1, 0, 0, 1, 1,
-1.893886, 0.803208, -1.877493, 1, 0, 0, 1, 1,
-1.888069, -0.3117608, -2.048328, 1, 0, 0, 1, 1,
-1.886334, 0.8734629, -0.4859115, 0, 0, 0, 1, 1,
-1.87576, 1.96562, -1.624048, 0, 0, 0, 1, 1,
-1.875292, 0.7379911, -1.733973, 0, 0, 0, 1, 1,
-1.874442, -1.18075, -1.792627, 0, 0, 0, 1, 1,
-1.850054, 0.2315369, -0.3404622, 0, 0, 0, 1, 1,
-1.849797, 0.06152533, 0.5479324, 0, 0, 0, 1, 1,
-1.848524, -0.9179461, -2.678496, 0, 0, 0, 1, 1,
-1.840276, -0.8725266, -0.7480288, 1, 1, 1, 1, 1,
-1.823611, -0.523748, -5.268605, 1, 1, 1, 1, 1,
-1.805653, 0.6710269, -1.92132, 1, 1, 1, 1, 1,
-1.79437, -1.878232, -2.099305, 1, 1, 1, 1, 1,
-1.780481, 0.1294248, -1.336181, 1, 1, 1, 1, 1,
-1.777378, 0.8333641, -2.034228, 1, 1, 1, 1, 1,
-1.73987, -0.4248884, -3.352391, 1, 1, 1, 1, 1,
-1.737377, 0.5279915, -2.059486, 1, 1, 1, 1, 1,
-1.728471, -0.4753776, -1.084855, 1, 1, 1, 1, 1,
-1.726613, 2.554454, 0.07904734, 1, 1, 1, 1, 1,
-1.71673, 1.083562, -1.542905, 1, 1, 1, 1, 1,
-1.710443, -0.03723394, -1.545087, 1, 1, 1, 1, 1,
-1.687211, -0.7050903, -1.715767, 1, 1, 1, 1, 1,
-1.676006, -0.2060219, -1.568557, 1, 1, 1, 1, 1,
-1.65583, 0.02016913, -1.597506, 1, 1, 1, 1, 1,
-1.651625, 0.8782144, 0.8897971, 0, 0, 1, 1, 1,
-1.640326, -0.8539543, -1.863152, 1, 0, 0, 1, 1,
-1.63856, 1.587353, -0.9113758, 1, 0, 0, 1, 1,
-1.635603, -0.8083584, -0.8093219, 1, 0, 0, 1, 1,
-1.603401, 0.706125, -1.718626, 1, 0, 0, 1, 1,
-1.59665, 1.038912, -0.7045651, 1, 0, 0, 1, 1,
-1.568195, 0.5897138, -0.04510194, 0, 0, 0, 1, 1,
-1.557731, -2.011657, -0.5647305, 0, 0, 0, 1, 1,
-1.55161, -1.83116, -3.91628, 0, 0, 0, 1, 1,
-1.539442, -0.1046881, -1.477456, 0, 0, 0, 1, 1,
-1.527109, -0.03374663, -2.935747, 0, 0, 0, 1, 1,
-1.524969, -0.5950151, -1.258807, 0, 0, 0, 1, 1,
-1.524647, -1.7448, -3.484497, 0, 0, 0, 1, 1,
-1.521254, 0.2068893, -1.37825, 1, 1, 1, 1, 1,
-1.516101, -0.694711, -1.412144, 1, 1, 1, 1, 1,
-1.514594, -0.4320079, -2.57157, 1, 1, 1, 1, 1,
-1.514253, -0.6735541, -0.9877348, 1, 1, 1, 1, 1,
-1.507947, 0.7988225, -1.828689, 1, 1, 1, 1, 1,
-1.500212, -0.9788502, -1.30149, 1, 1, 1, 1, 1,
-1.497888, -1.175885, -1.156289, 1, 1, 1, 1, 1,
-1.493671, -0.4186855, -2.664914, 1, 1, 1, 1, 1,
-1.484439, -1.600676, -4.225981, 1, 1, 1, 1, 1,
-1.477341, -0.5558242, -0.780454, 1, 1, 1, 1, 1,
-1.465428, 1.451007, 0.3086066, 1, 1, 1, 1, 1,
-1.443636, -0.9588289, -1.827079, 1, 1, 1, 1, 1,
-1.436189, 0.237795, -1.05415, 1, 1, 1, 1, 1,
-1.433198, 0.5716406, -2.279353, 1, 1, 1, 1, 1,
-1.417791, 0.1082228, -0.8552694, 1, 1, 1, 1, 1,
-1.414769, -0.2519478, -0.02522727, 0, 0, 1, 1, 1,
-1.412628, 0.2818469, -1.953512, 1, 0, 0, 1, 1,
-1.409741, -1.065878, -1.23644, 1, 0, 0, 1, 1,
-1.391947, 1.644233, -0.2909494, 1, 0, 0, 1, 1,
-1.388611, -0.3266396, 0.1043506, 1, 0, 0, 1, 1,
-1.381127, 0.0867372, -1.328284, 1, 0, 0, 1, 1,
-1.363318, 0.1430155, -1.142444, 0, 0, 0, 1, 1,
-1.361197, -2.487884, -1.812837, 0, 0, 0, 1, 1,
-1.35903, -0.01994734, -2.28271, 0, 0, 0, 1, 1,
-1.356599, -0.2290261, -1.23826, 0, 0, 0, 1, 1,
-1.355631, -1.953515, -2.670112, 0, 0, 0, 1, 1,
-1.335314, 1.337032, -2.286597, 0, 0, 0, 1, 1,
-1.33121, -0.3876424, -0.5406852, 0, 0, 0, 1, 1,
-1.324014, 1.677654, -1.251038, 1, 1, 1, 1, 1,
-1.319682, 0.4079412, -3.46849, 1, 1, 1, 1, 1,
-1.314149, -1.521738, -3.127358, 1, 1, 1, 1, 1,
-1.306654, 2.486831, 0.3627221, 1, 1, 1, 1, 1,
-1.295097, -1.185065, -1.537256, 1, 1, 1, 1, 1,
-1.285098, 0.8193577, 0.5981683, 1, 1, 1, 1, 1,
-1.284963, -0.9105908, -2.491836, 1, 1, 1, 1, 1,
-1.271054, -0.01007313, -0.4374935, 1, 1, 1, 1, 1,
-1.269959, 0.3298558, -1.555368, 1, 1, 1, 1, 1,
-1.263698, 0.133747, -2.699551, 1, 1, 1, 1, 1,
-1.259867, 0.978829, 1.403572, 1, 1, 1, 1, 1,
-1.253275, 0.585493, -0.8552566, 1, 1, 1, 1, 1,
-1.252221, -0.7570151, -1.353828, 1, 1, 1, 1, 1,
-1.251953, -0.4065836, -2.21058, 1, 1, 1, 1, 1,
-1.250822, -0.1241883, -0.6619079, 1, 1, 1, 1, 1,
-1.230189, -1.686394, -1.010538, 0, 0, 1, 1, 1,
-1.22846, -1.115463, -2.867712, 1, 0, 0, 1, 1,
-1.226673, 0.3573153, -0.3826242, 1, 0, 0, 1, 1,
-1.222845, 0.9146465, -0.8039845, 1, 0, 0, 1, 1,
-1.21925, -1.889401, -3.001664, 1, 0, 0, 1, 1,
-1.209095, 0.8011476, 0.1812987, 1, 0, 0, 1, 1,
-1.206445, -0.1864705, -3.239881, 0, 0, 0, 1, 1,
-1.191605, 0.6347321, -1.709004, 0, 0, 0, 1, 1,
-1.185005, 0.561038, -1.995483, 0, 0, 0, 1, 1,
-1.180904, 0.452799, -3.116642, 0, 0, 0, 1, 1,
-1.17815, 0.3908896, 0.8989018, 0, 0, 0, 1, 1,
-1.166446, -2.241858, -4.678196, 0, 0, 0, 1, 1,
-1.160863, 0.1656701, -1.86955, 0, 0, 0, 1, 1,
-1.158279, 0.1268687, -1.083065, 1, 1, 1, 1, 1,
-1.156407, -0.4144505, -2.312006, 1, 1, 1, 1, 1,
-1.156279, 1.541923, -0.2224628, 1, 1, 1, 1, 1,
-1.144978, 0.6493946, -1.995597, 1, 1, 1, 1, 1,
-1.141724, -1.372302, -3.552746, 1, 1, 1, 1, 1,
-1.139115, -0.263074, -1.792543, 1, 1, 1, 1, 1,
-1.135226, -0.4285091, 0.7872233, 1, 1, 1, 1, 1,
-1.128789, -0.292702, -1.351053, 1, 1, 1, 1, 1,
-1.128142, 1.001817, -1.69476, 1, 1, 1, 1, 1,
-1.124652, 0.5513073, -1.53084, 1, 1, 1, 1, 1,
-1.1179, -0.3653604, -0.5026581, 1, 1, 1, 1, 1,
-1.116336, -1.369409, -3.690709, 1, 1, 1, 1, 1,
-1.115565, 0.3160509, -1.895563, 1, 1, 1, 1, 1,
-1.107007, 1.215876, -1.059458, 1, 1, 1, 1, 1,
-1.105312, 1.154562, -0.69155, 1, 1, 1, 1, 1,
-1.096392, 0.3481158, -1.695778, 0, 0, 1, 1, 1,
-1.09626, 1.132139, 0.2737493, 1, 0, 0, 1, 1,
-1.093608, -0.7040912, -1.424517, 1, 0, 0, 1, 1,
-1.093258, -0.7056579, -2.09269, 1, 0, 0, 1, 1,
-1.088416, -0.2209607, -2.615248, 1, 0, 0, 1, 1,
-1.07983, 1.204472, -0.9936522, 1, 0, 0, 1, 1,
-1.074758, -0.1922157, -0.3376387, 0, 0, 0, 1, 1,
-1.071665, 0.8330876, -2.288565, 0, 0, 0, 1, 1,
-1.068901, 1.778586, 0.5420132, 0, 0, 0, 1, 1,
-1.068725, 2.836944, -3.095048, 0, 0, 0, 1, 1,
-1.064483, -0.9875851, -0.5215673, 0, 0, 0, 1, 1,
-1.0628, 0.5019282, -1.423572, 0, 0, 0, 1, 1,
-1.05303, 1.777143, -1.31219, 0, 0, 0, 1, 1,
-1.049092, 0.04948042, -1.674861, 1, 1, 1, 1, 1,
-1.04655, -0.2105965, -2.077425, 1, 1, 1, 1, 1,
-1.044956, -1.150952, -4.390636, 1, 1, 1, 1, 1,
-1.042881, -0.08429271, -2.127978, 1, 1, 1, 1, 1,
-1.038423, 0.3520499, -1.810289, 1, 1, 1, 1, 1,
-1.029358, -2.183908, -3.514277, 1, 1, 1, 1, 1,
-1.023018, -0.5120773, -2.585768, 1, 1, 1, 1, 1,
-1.022044, -1.997832, -1.1256, 1, 1, 1, 1, 1,
-1.020174, 0.9090252, 0.0003166829, 1, 1, 1, 1, 1,
-1.00903, -0.9225945, -0.3361416, 1, 1, 1, 1, 1,
-1.007561, -0.5608758, -3.515998, 1, 1, 1, 1, 1,
-0.9986905, 1.224048, -1.338413, 1, 1, 1, 1, 1,
-0.9874935, 0.7168747, -0.6837178, 1, 1, 1, 1, 1,
-0.9858344, 0.3049614, 0.2679798, 1, 1, 1, 1, 1,
-0.9856, 0.5097292, -0.6101869, 1, 1, 1, 1, 1,
-0.9821408, -0.2410453, -2.293101, 0, 0, 1, 1, 1,
-0.9812736, 1.208578, -3.072878, 1, 0, 0, 1, 1,
-0.9775279, -1.271264, -2.844512, 1, 0, 0, 1, 1,
-0.9773565, -1.495181, -0.7378514, 1, 0, 0, 1, 1,
-0.9707528, 0.7047119, -1.528805, 1, 0, 0, 1, 1,
-0.9700242, 0.2118933, -3.681149, 1, 0, 0, 1, 1,
-0.964344, 0.2625536, -0.03647225, 0, 0, 0, 1, 1,
-0.9618023, 0.6390126, -1.3274, 0, 0, 0, 1, 1,
-0.953209, 0.3960486, -2.426383, 0, 0, 0, 1, 1,
-0.9511194, -0.6609824, -2.30218, 0, 0, 0, 1, 1,
-0.9473006, -0.9724286, -2.070464, 0, 0, 0, 1, 1,
-0.9460893, -1.867805, -2.871876, 0, 0, 0, 1, 1,
-0.9369718, 1.535194, -0.1242891, 0, 0, 0, 1, 1,
-0.9287724, 1.725728, -0.4489015, 1, 1, 1, 1, 1,
-0.9221357, 0.01097178, -1.153562, 1, 1, 1, 1, 1,
-0.9214958, -0.5224212, -1.726416, 1, 1, 1, 1, 1,
-0.9206762, -1.08807, -1.770285, 1, 1, 1, 1, 1,
-0.9172252, -0.2190406, -1.741374, 1, 1, 1, 1, 1,
-0.9152758, -0.6013665, -1.574889, 1, 1, 1, 1, 1,
-0.9148543, -1.487481, -4.063349, 1, 1, 1, 1, 1,
-0.9099175, -2.060721, -3.041404, 1, 1, 1, 1, 1,
-0.8998929, -0.4445303, -2.469787, 1, 1, 1, 1, 1,
-0.8953197, 0.2119184, -1.769901, 1, 1, 1, 1, 1,
-0.893115, 0.1199075, -3.685955, 1, 1, 1, 1, 1,
-0.8752601, 0.2040271, 0.06270671, 1, 1, 1, 1, 1,
-0.8688493, 0.1179255, -2.789492, 1, 1, 1, 1, 1,
-0.8551273, -1.903914, -2.973371, 1, 1, 1, 1, 1,
-0.8526031, 0.1017266, -1.572038, 1, 1, 1, 1, 1,
-0.8521711, -0.6342341, -0.2935657, 0, 0, 1, 1, 1,
-0.8511431, -1.635939, -2.823807, 1, 0, 0, 1, 1,
-0.8460624, -0.1581622, -3.088824, 1, 0, 0, 1, 1,
-0.8380843, -0.5564743, -1.239855, 1, 0, 0, 1, 1,
-0.8362883, -0.2317567, -2.690331, 1, 0, 0, 1, 1,
-0.8358707, 1.088545, -2.437248, 1, 0, 0, 1, 1,
-0.8358245, -0.6537386, -1.947433, 0, 0, 0, 1, 1,
-0.833234, -3.137413, -1.518661, 0, 0, 0, 1, 1,
-0.8315535, -0.3967142, -2.01246, 0, 0, 0, 1, 1,
-0.8304024, 0.5471284, -1.434513, 0, 0, 0, 1, 1,
-0.8257948, 0.4204786, -1.909937, 0, 0, 0, 1, 1,
-0.8248122, 0.2802288, -1.286412, 0, 0, 0, 1, 1,
-0.8228069, -0.2079345, -1.949829, 0, 0, 0, 1, 1,
-0.8210961, -0.181667, -0.2765317, 1, 1, 1, 1, 1,
-0.8158692, -0.8456235, -2.154256, 1, 1, 1, 1, 1,
-0.815519, -1.718329, -2.608899, 1, 1, 1, 1, 1,
-0.8106845, 1.140375, -0.1517055, 1, 1, 1, 1, 1,
-0.8053935, -0.8999391, -2.721604, 1, 1, 1, 1, 1,
-0.8011717, -0.5162055, -0.9924716, 1, 1, 1, 1, 1,
-0.7997834, -1.441406, -2.996541, 1, 1, 1, 1, 1,
-0.7946176, 1.060139, 0.05768666, 1, 1, 1, 1, 1,
-0.7916785, -1.08666, -3.071604, 1, 1, 1, 1, 1,
-0.7879235, -0.6862351, -2.590643, 1, 1, 1, 1, 1,
-0.7846619, 0.8711091, -0.008405224, 1, 1, 1, 1, 1,
-0.7830524, -0.2533603, -1.943565, 1, 1, 1, 1, 1,
-0.7829257, -0.5330127, -0.8684691, 1, 1, 1, 1, 1,
-0.7807527, 1.756179, -0.5053546, 1, 1, 1, 1, 1,
-0.7799827, -1.006587, -0.7182347, 1, 1, 1, 1, 1,
-0.7793171, 0.1648334, -3.254044, 0, 0, 1, 1, 1,
-0.7772108, -0.9077315, -1.894155, 1, 0, 0, 1, 1,
-0.7673024, 0.5332129, 0.1918997, 1, 0, 0, 1, 1,
-0.7621567, -1.771068, -2.755113, 1, 0, 0, 1, 1,
-0.7529227, 1.735081, -1.642482, 1, 0, 0, 1, 1,
-0.751793, -0.5273471, -3.160213, 1, 0, 0, 1, 1,
-0.7435405, 0.7580535, -1.768677, 0, 0, 0, 1, 1,
-0.7375414, -0.4517203, -2.196084, 0, 0, 0, 1, 1,
-0.7374032, 0.353667, -1.135655, 0, 0, 0, 1, 1,
-0.733754, 1.518229, -1.754672, 0, 0, 0, 1, 1,
-0.7222956, 0.7348859, -0.7979505, 0, 0, 0, 1, 1,
-0.7208266, -1.107326, -0.7989882, 0, 0, 0, 1, 1,
-0.7192596, -0.5100223, -2.281624, 0, 0, 0, 1, 1,
-0.7188932, 0.7340587, -0.3419847, 1, 1, 1, 1, 1,
-0.7179457, 0.1208061, -2.591854, 1, 1, 1, 1, 1,
-0.7125624, 0.06337594, -1.935459, 1, 1, 1, 1, 1,
-0.7091282, 1.585864, -0.9756945, 1, 1, 1, 1, 1,
-0.7008762, -0.6557346, -2.148611, 1, 1, 1, 1, 1,
-0.6941047, -0.666602, -1.688219, 1, 1, 1, 1, 1,
-0.6939487, 1.082803, -2.358726, 1, 1, 1, 1, 1,
-0.6913781, -0.7549776, -1.105804, 1, 1, 1, 1, 1,
-0.6882383, -0.3786277, -3.089021, 1, 1, 1, 1, 1,
-0.6880583, 0.2345306, 0.007994264, 1, 1, 1, 1, 1,
-0.6859105, 0.7092424, -0.2224177, 1, 1, 1, 1, 1,
-0.6841761, 0.3017631, -0.8033635, 1, 1, 1, 1, 1,
-0.6762686, 0.02510224, -1.129482, 1, 1, 1, 1, 1,
-0.6757098, -1.739427, -4.464604, 1, 1, 1, 1, 1,
-0.6757098, -0.5940505, -3.251187, 1, 1, 1, 1, 1,
-0.6597177, -1.159042, -3.105365, 0, 0, 1, 1, 1,
-0.6521615, 1.884229, 2.018557, 1, 0, 0, 1, 1,
-0.6420925, 0.9208866, -0.9169328, 1, 0, 0, 1, 1,
-0.6396534, -0.1217757, -1.812348, 1, 0, 0, 1, 1,
-0.6334978, -1.08508, -3.326004, 1, 0, 0, 1, 1,
-0.6328094, -0.03246691, -1.974471, 1, 0, 0, 1, 1,
-0.6317657, -1.995389, -2.084372, 0, 0, 0, 1, 1,
-0.6316103, 0.204649, -1.104065, 0, 0, 0, 1, 1,
-0.6258278, -2.397189, -2.001777, 0, 0, 0, 1, 1,
-0.6246268, 0.7173405, -1.837216, 0, 0, 0, 1, 1,
-0.6186927, -0.5951304, -3.235323, 0, 0, 0, 1, 1,
-0.6174394, -1.435407, -3.692883, 0, 0, 0, 1, 1,
-0.6162187, 0.2673249, -1.488483, 0, 0, 0, 1, 1,
-0.6129003, 0.2353403, -2.408916, 1, 1, 1, 1, 1,
-0.6128358, -0.6563045, -1.957819, 1, 1, 1, 1, 1,
-0.6115309, 0.1521376, -0.356013, 1, 1, 1, 1, 1,
-0.609882, 0.08572987, -0.4562343, 1, 1, 1, 1, 1,
-0.6078614, -1.093169, -2.985684, 1, 1, 1, 1, 1,
-0.6056843, 0.2318622, -0.7420979, 1, 1, 1, 1, 1,
-0.6035616, 0.677514, -0.6707022, 1, 1, 1, 1, 1,
-0.5995532, -0.8372668, -3.703722, 1, 1, 1, 1, 1,
-0.5983869, -0.6262009, -3.119757, 1, 1, 1, 1, 1,
-0.5978717, 1.006728, 0.7625757, 1, 1, 1, 1, 1,
-0.5953096, -0.2145419, -1.872491, 1, 1, 1, 1, 1,
-0.589999, -0.5615386, -3.751135, 1, 1, 1, 1, 1,
-0.5882517, -0.5215881, -2.854773, 1, 1, 1, 1, 1,
-0.582555, 1.057107, 0.6084446, 1, 1, 1, 1, 1,
-0.5795666, 1.632841, 0.205598, 1, 1, 1, 1, 1,
-0.5793181, -0.2050617, -3.070207, 0, 0, 1, 1, 1,
-0.5792683, -0.7834304, -2.798902, 1, 0, 0, 1, 1,
-0.5789649, -0.49294, -0.3244634, 1, 0, 0, 1, 1,
-0.5785298, -0.9704841, -1.634383, 1, 0, 0, 1, 1,
-0.5777521, 0.1260199, -0.466688, 1, 0, 0, 1, 1,
-0.5775051, -0.4856348, -2.123731, 1, 0, 0, 1, 1,
-0.5761662, 0.2132445, -0.02237214, 0, 0, 0, 1, 1,
-0.5648447, 1.182101, -0.5307161, 0, 0, 0, 1, 1,
-0.5483043, 0.5744287, -1.736385, 0, 0, 0, 1, 1,
-0.5434133, 0.122218, -0.497056, 0, 0, 0, 1, 1,
-0.5404865, 0.1024038, -2.485502, 0, 0, 0, 1, 1,
-0.5397888, 1.373444, 0.09769963, 0, 0, 0, 1, 1,
-0.5318388, -0.7458207, -3.591727, 0, 0, 0, 1, 1,
-0.5295186, -0.5845132, -2.35011, 1, 1, 1, 1, 1,
-0.5279454, 0.1784651, -2.428184, 1, 1, 1, 1, 1,
-0.5270762, 1.44834, -0.9484295, 1, 1, 1, 1, 1,
-0.5247185, -2.330134, -2.443801, 1, 1, 1, 1, 1,
-0.5237564, 1.082245, -0.216108, 1, 1, 1, 1, 1,
-0.5179461, -0.9780965, -2.411728, 1, 1, 1, 1, 1,
-0.5133989, 0.9769077, -1.406319, 1, 1, 1, 1, 1,
-0.5119715, -0.9482806, -2.961188, 1, 1, 1, 1, 1,
-0.5084708, 1.910243, -1.995326, 1, 1, 1, 1, 1,
-0.5046042, 0.2030336, -0.4971743, 1, 1, 1, 1, 1,
-0.5014053, 0.09510037, -1.718619, 1, 1, 1, 1, 1,
-0.499325, -0.1007917, -2.722342, 1, 1, 1, 1, 1,
-0.4990127, -0.1689664, -0.6739966, 1, 1, 1, 1, 1,
-0.496857, -0.1301261, -2.06565, 1, 1, 1, 1, 1,
-0.4932572, -0.1370933, -0.8338176, 1, 1, 1, 1, 1,
-0.4842084, -1.190426, -4.097116, 0, 0, 1, 1, 1,
-0.4835614, -0.05858548, -0.1402474, 1, 0, 0, 1, 1,
-0.4813363, -1.310115, -2.766918, 1, 0, 0, 1, 1,
-0.4811006, -1.854024, -1.430164, 1, 0, 0, 1, 1,
-0.4810111, -0.7557715, -2.428714, 1, 0, 0, 1, 1,
-0.4804931, -0.9786856, -1.716316, 1, 0, 0, 1, 1,
-0.4786664, -0.1198935, -1.144291, 0, 0, 0, 1, 1,
-0.4783076, 0.0562897, -0.7548498, 0, 0, 0, 1, 1,
-0.4754748, -0.8334731, -1.127295, 0, 0, 0, 1, 1,
-0.4750818, -0.5658476, -1.495256, 0, 0, 0, 1, 1,
-0.4743159, -1.354307, -2.891903, 0, 0, 0, 1, 1,
-0.4720992, -1.249374, -3.86311, 0, 0, 0, 1, 1,
-0.4716959, 0.959725, 1.085245, 0, 0, 0, 1, 1,
-0.4649577, 2.278408, 0.6961939, 1, 1, 1, 1, 1,
-0.4637223, -0.3430523, -2.158775, 1, 1, 1, 1, 1,
-0.4626118, 0.1177605, -0.4267241, 1, 1, 1, 1, 1,
-0.4608701, -2.339645, -2.372021, 1, 1, 1, 1, 1,
-0.4542806, -0.5543924, -2.533753, 1, 1, 1, 1, 1,
-0.4414885, -0.09297765, -1.164925, 1, 1, 1, 1, 1,
-0.4412356, 1.505929, -0.6210068, 1, 1, 1, 1, 1,
-0.4382672, -1.9305, -3.671066, 1, 1, 1, 1, 1,
-0.4362372, -0.93903, -4.794416, 1, 1, 1, 1, 1,
-0.4354729, 1.280179, -0.5498183, 1, 1, 1, 1, 1,
-0.4344338, 0.02804, -1.771502, 1, 1, 1, 1, 1,
-0.4298413, 1.355351, -1.304071, 1, 1, 1, 1, 1,
-0.4275001, 1.685966, -0.9168621, 1, 1, 1, 1, 1,
-0.4256859, 0.9289022, -0.6751161, 1, 1, 1, 1, 1,
-0.423115, 0.2169841, -1.050748, 1, 1, 1, 1, 1,
-0.4217322, 1.016856, 0.9216549, 0, 0, 1, 1, 1,
-0.417604, 0.9067311, -0.6425101, 1, 0, 0, 1, 1,
-0.4173467, -1.282246, -4.689687, 1, 0, 0, 1, 1,
-0.4152866, 0.4708291, -0.885662, 1, 0, 0, 1, 1,
-0.4135482, -0.3084657, -1.493098, 1, 0, 0, 1, 1,
-0.4119818, 0.5714501, -0.9022374, 1, 0, 0, 1, 1,
-0.4051601, 1.502868, 0.65411, 0, 0, 0, 1, 1,
-0.3838874, -2.093939, -4.988689, 0, 0, 0, 1, 1,
-0.3819587, -1.545556, -4.091745, 0, 0, 0, 1, 1,
-0.3793481, 2.132695, -1.25029, 0, 0, 0, 1, 1,
-0.3763916, -0.3059903, -2.013758, 0, 0, 0, 1, 1,
-0.3618472, 0.09636998, 0.2310957, 0, 0, 0, 1, 1,
-0.3595588, -0.648869, -2.35021, 0, 0, 0, 1, 1,
-0.3589647, 0.1663646, -2.575945, 1, 1, 1, 1, 1,
-0.3586853, -0.2551108, -3.736823, 1, 1, 1, 1, 1,
-0.3580305, 0.0553994, 0.3443336, 1, 1, 1, 1, 1,
-0.3574852, -0.1421202, -1.230935, 1, 1, 1, 1, 1,
-0.3571233, 0.8648902, -0.4489199, 1, 1, 1, 1, 1,
-0.3507028, -2.095181, -4.20983, 1, 1, 1, 1, 1,
-0.3498797, 0.7312173, -0.8130236, 1, 1, 1, 1, 1,
-0.3494214, -0.5243486, -2.178044, 1, 1, 1, 1, 1,
-0.3479659, 0.1009087, -0.628932, 1, 1, 1, 1, 1,
-0.3429861, 1.726009, -0.2748213, 1, 1, 1, 1, 1,
-0.3423718, 1.070978, -0.2664099, 1, 1, 1, 1, 1,
-0.338816, 0.6257913, -1.149533, 1, 1, 1, 1, 1,
-0.336078, -1.470986, -4.774188, 1, 1, 1, 1, 1,
-0.3316416, 1.785413, 0.1977815, 1, 1, 1, 1, 1,
-0.328441, -0.1309293, -3.60213, 1, 1, 1, 1, 1,
-0.3093351, -0.5716712, -2.142385, 0, 0, 1, 1, 1,
-0.3090337, -0.3070146, -2.493893, 1, 0, 0, 1, 1,
-0.2997622, 1.040048, 0.5853, 1, 0, 0, 1, 1,
-0.2989255, -0.6633132, -2.202164, 1, 0, 0, 1, 1,
-0.2908351, 0.3323199, -1.155444, 1, 0, 0, 1, 1,
-0.2902049, -0.2914397, -2.280227, 1, 0, 0, 1, 1,
-0.289962, 0.3710387, -1.219228, 0, 0, 0, 1, 1,
-0.289069, 0.2013596, -0.5587365, 0, 0, 0, 1, 1,
-0.2876549, 2.714831, 0.3977132, 0, 0, 0, 1, 1,
-0.2863471, 0.707072, 0.9024721, 0, 0, 0, 1, 1,
-0.2810923, -0.3617315, -3.422668, 0, 0, 0, 1, 1,
-0.2796108, 0.5097827, -0.3303678, 0, 0, 0, 1, 1,
-0.2760673, 0.7189264, -0.5869579, 0, 0, 0, 1, 1,
-0.2760072, -0.5676703, -1.17959, 1, 1, 1, 1, 1,
-0.2660865, -0.6582047, -2.092096, 1, 1, 1, 1, 1,
-0.2651388, 1.185554, 0.8205314, 1, 1, 1, 1, 1,
-0.2617282, -1.31251, -3.915908, 1, 1, 1, 1, 1,
-0.2615471, -1.214215, -3.685226, 1, 1, 1, 1, 1,
-0.2613538, -0.5184829, -1.42795, 1, 1, 1, 1, 1,
-0.2583904, -0.3339489, -2.090849, 1, 1, 1, 1, 1,
-0.256704, 1.582841, -0.6839382, 1, 1, 1, 1, 1,
-0.2564656, -0.3521048, -0.9216065, 1, 1, 1, 1, 1,
-0.2561224, -0.528132, -0.7701342, 1, 1, 1, 1, 1,
-0.2500699, -0.887067, -2.190297, 1, 1, 1, 1, 1,
-0.2497898, 0.5973272, -0.4526686, 1, 1, 1, 1, 1,
-0.2368258, 0.4751768, -0.4688624, 1, 1, 1, 1, 1,
-0.236707, 0.7886558, -0.6755115, 1, 1, 1, 1, 1,
-0.2366744, 2.011325, 0.7223417, 1, 1, 1, 1, 1,
-0.2339155, 0.6818289, -0.3531531, 0, 0, 1, 1, 1,
-0.2323739, -0.102079, -3.567564, 1, 0, 0, 1, 1,
-0.2296099, -0.7776562, -2.757504, 1, 0, 0, 1, 1,
-0.2294695, 0.4985008, 1.207594, 1, 0, 0, 1, 1,
-0.2294254, 2.136696, 1.689675, 1, 0, 0, 1, 1,
-0.2243163, 1.856938, 0.7505805, 1, 0, 0, 1, 1,
-0.2209301, 1.279529, 0.3310274, 0, 0, 0, 1, 1,
-0.2196168, -0.9059578, -3.114051, 0, 0, 0, 1, 1,
-0.2186373, 1.155364, 0.3070929, 0, 0, 0, 1, 1,
-0.2160158, -1.202499, -3.326351, 0, 0, 0, 1, 1,
-0.2139262, -0.4765769, -1.816758, 0, 0, 0, 1, 1,
-0.2115262, -0.4299434, -3.463715, 0, 0, 0, 1, 1,
-0.2056054, 0.03603428, -0.5952563, 0, 0, 0, 1, 1,
-0.2046763, -0.04614898, -2.944354, 1, 1, 1, 1, 1,
-0.2046721, 1.040102, 0.6689131, 1, 1, 1, 1, 1,
-0.2002555, 0.1962102, 0.118102, 1, 1, 1, 1, 1,
-0.1899973, -0.4952857, -2.705323, 1, 1, 1, 1, 1,
-0.1888893, -0.3667381, -2.27847, 1, 1, 1, 1, 1,
-0.1876175, -1.294221, -4.379234, 1, 1, 1, 1, 1,
-0.1873843, -1.181723, -3.366385, 1, 1, 1, 1, 1,
-0.1830328, 0.6870862, -1.429153, 1, 1, 1, 1, 1,
-0.1799204, 0.2329521, -1.395666, 1, 1, 1, 1, 1,
-0.1778491, 1.399825, 0.05723637, 1, 1, 1, 1, 1,
-0.1738293, 0.700074, -1.712684, 1, 1, 1, 1, 1,
-0.1693549, 1.305567, 1.350864, 1, 1, 1, 1, 1,
-0.16619, 0.9611797, -1.097836, 1, 1, 1, 1, 1,
-0.1644225, -0.9509379, -4.225441, 1, 1, 1, 1, 1,
-0.1628047, -1.005341, -2.862085, 1, 1, 1, 1, 1,
-0.1623434, -1.150761, -3.75452, 0, 0, 1, 1, 1,
-0.1588338, 0.376753, 1.280024, 1, 0, 0, 1, 1,
-0.1579616, -0.7251691, -4.36494, 1, 0, 0, 1, 1,
-0.1566799, -0.2563091, -1.781918, 1, 0, 0, 1, 1,
-0.1499404, -0.5782263, -2.93103, 1, 0, 0, 1, 1,
-0.1498203, -0.9486781, -1.465288, 1, 0, 0, 1, 1,
-0.1455716, -0.885823, -3.616096, 0, 0, 0, 1, 1,
-0.1437656, 2.750401, -1.335118, 0, 0, 0, 1, 1,
-0.1405781, -0.4805139, -2.37519, 0, 0, 0, 1, 1,
-0.1395659, -1.52214, -3.366657, 0, 0, 0, 1, 1,
-0.1349754, 1.782879, -0.02878454, 0, 0, 0, 1, 1,
-0.1337913, -0.05010332, -1.518182, 0, 0, 0, 1, 1,
-0.1285682, 0.01166509, -1.529361, 0, 0, 0, 1, 1,
-0.1278213, -0.1840383, -2.400604, 1, 1, 1, 1, 1,
-0.1276213, -0.9106001, -3.246512, 1, 1, 1, 1, 1,
-0.1268125, -1.019746, -4.180333, 1, 1, 1, 1, 1,
-0.1252159, 0.2055136, -0.4602507, 1, 1, 1, 1, 1,
-0.1247474, -0.8810647, -1.381107, 1, 1, 1, 1, 1,
-0.1246611, -0.1272317, -2.296843, 1, 1, 1, 1, 1,
-0.1232228, 1.682362, -0.2381972, 1, 1, 1, 1, 1,
-0.1210047, 0.453368, -1.284143, 1, 1, 1, 1, 1,
-0.1148737, 0.5287514, -1.575482, 1, 1, 1, 1, 1,
-0.1130319, 1.352268, -0.283533, 1, 1, 1, 1, 1,
-0.1107892, 0.4320796, 0.6129794, 1, 1, 1, 1, 1,
-0.1102017, -0.7979923, -2.101348, 1, 1, 1, 1, 1,
-0.1085297, -1.189005, -3.827132, 1, 1, 1, 1, 1,
-0.1063055, 0.8578011, -0.08948619, 1, 1, 1, 1, 1,
-0.1034912, -0.4270963, -0.9326432, 1, 1, 1, 1, 1,
-0.1014756, 1.65453, -1.323699, 0, 0, 1, 1, 1,
-0.09738921, -0.4268078, -3.368247, 1, 0, 0, 1, 1,
-0.09707172, -1.844835, -2.173801, 1, 0, 0, 1, 1,
-0.09616791, 0.5816424, -0.4802, 1, 0, 0, 1, 1,
-0.09476462, 0.967672, 0.5210063, 1, 0, 0, 1, 1,
-0.09409723, 1.011042, -0.5645754, 1, 0, 0, 1, 1,
-0.09367085, 0.005015792, -1.46742, 0, 0, 0, 1, 1,
-0.09348962, 0.2417779, -0.4799091, 0, 0, 0, 1, 1,
-0.09312749, 0.9857808, -1.725754, 0, 0, 0, 1, 1,
-0.09171156, 0.1957948, 0.9880608, 0, 0, 0, 1, 1,
-0.09098154, -1.184582, -2.944418, 0, 0, 0, 1, 1,
-0.08960863, -0.5778211, -2.705635, 0, 0, 0, 1, 1,
-0.0870183, 1.029926, -0.5012041, 0, 0, 0, 1, 1,
-0.08464254, 1.485526, 2.249494, 1, 1, 1, 1, 1,
-0.08273033, -0.2052123, -4.153723, 1, 1, 1, 1, 1,
-0.08100188, -0.4116284, -2.589177, 1, 1, 1, 1, 1,
-0.08079208, 1.747108, -0.2783767, 1, 1, 1, 1, 1,
-0.08060012, 0.1054122, -0.7560657, 1, 1, 1, 1, 1,
-0.0776711, 0.3891076, -0.4697136, 1, 1, 1, 1, 1,
-0.07513187, 0.7607741, 1.337661, 1, 1, 1, 1, 1,
-0.06687802, -0.2914377, -2.351641, 1, 1, 1, 1, 1,
-0.06614488, -1.124966, -3.14933, 1, 1, 1, 1, 1,
-0.06059451, -0.7703494, -2.195203, 1, 1, 1, 1, 1,
-0.05396584, -0.06964999, -2.829757, 1, 1, 1, 1, 1,
-0.04756042, 0.396353, 0.05868404, 1, 1, 1, 1, 1,
-0.03622708, -0.4051218, -2.803141, 1, 1, 1, 1, 1,
-0.03576149, -0.1017256, -3.805699, 1, 1, 1, 1, 1,
-0.03546508, -0.9451258, -1.121014, 1, 1, 1, 1, 1,
-0.03443901, -1.240621, -5.632955, 0, 0, 1, 1, 1,
-0.03120699, -0.3807904, -3.17748, 1, 0, 0, 1, 1,
-0.02616241, -0.2406918, -1.537248, 1, 0, 0, 1, 1,
-0.02209596, 0.237475, 0.5255731, 1, 0, 0, 1, 1,
-0.0220891, 0.09853403, -0.8234106, 1, 0, 0, 1, 1,
-0.02014208, 0.3815137, -0.9258034, 1, 0, 0, 1, 1,
-0.01222166, -0.2406373, -3.75397, 0, 0, 0, 1, 1,
-0.01174074, 0.1139508, -0.7310878, 0, 0, 0, 1, 1,
-0.01033151, -0.9498725, -3.116951, 0, 0, 0, 1, 1,
-0.007984197, -0.1994707, -2.222999, 0, 0, 0, 1, 1,
-0.007965576, 0.1146446, 0.2801599, 0, 0, 0, 1, 1,
-0.007875558, -0.3873839, -2.975607, 0, 0, 0, 1, 1,
-0.007804892, 0.1807895, 0.8911749, 0, 0, 0, 1, 1,
-0.003894944, -1.102063, -3.199754, 1, 1, 1, 1, 1,
-0.003798881, 1.246167, 1.387238, 1, 1, 1, 1, 1,
-0.003296132, -1.683064, -1.518748, 1, 1, 1, 1, 1,
-0.00213708, -0.2838753, -2.841891, 1, 1, 1, 1, 1,
0.001779738, 0.4169587, -0.3056099, 1, 1, 1, 1, 1,
0.002210291, 1.68179, 1.429183, 1, 1, 1, 1, 1,
0.00658431, 0.9764962, -0.3437832, 1, 1, 1, 1, 1,
0.01172274, 0.2091307, -0.3576339, 1, 1, 1, 1, 1,
0.01184096, 1.988478, 1.632213, 1, 1, 1, 1, 1,
0.01272882, 1.366422, -1.51387, 1, 1, 1, 1, 1,
0.01761972, 1.100048, 0.7803366, 1, 1, 1, 1, 1,
0.02437827, -0.3210473, 3.568162, 1, 1, 1, 1, 1,
0.03371974, 1.976998, 0.06960221, 1, 1, 1, 1, 1,
0.03387824, -0.5656093, 3.358275, 1, 1, 1, 1, 1,
0.04141068, -0.8440959, 3.469607, 1, 1, 1, 1, 1,
0.048548, 0.01517394, 1.757039, 0, 0, 1, 1, 1,
0.04889912, -1.014343, 4.122762, 1, 0, 0, 1, 1,
0.05221119, -1.930547, 4.197483, 1, 0, 0, 1, 1,
0.05513084, -0.1217853, 1.986789, 1, 0, 0, 1, 1,
0.06159675, -0.9118267, 1.544891, 1, 0, 0, 1, 1,
0.06418079, -1.400865, 2.585169, 1, 0, 0, 1, 1,
0.07567311, -0.1328393, 3.683944, 0, 0, 0, 1, 1,
0.07612594, 0.2944562, -0.4680563, 0, 0, 0, 1, 1,
0.07885937, -0.8758979, 3.743061, 0, 0, 0, 1, 1,
0.08335818, -0.04369712, 3.048983, 0, 0, 0, 1, 1,
0.0842694, 0.2606227, 0.0763092, 0, 0, 0, 1, 1,
0.09009781, 1.177354, -0.8343543, 0, 0, 0, 1, 1,
0.09064838, -0.5046127, 5.361726, 0, 0, 0, 1, 1,
0.09311691, -0.4632555, 1.829839, 1, 1, 1, 1, 1,
0.09915841, -0.1142343, 3.096414, 1, 1, 1, 1, 1,
0.1036177, -0.2332179, 1.828202, 1, 1, 1, 1, 1,
0.1077175, 0.1427605, 1.780512, 1, 1, 1, 1, 1,
0.1083073, -0.7414215, 3.84961, 1, 1, 1, 1, 1,
0.1091778, 0.1996778, 2.613862, 1, 1, 1, 1, 1,
0.1097054, 0.9591249, 1.248171, 1, 1, 1, 1, 1,
0.1171287, 0.5303549, 1.82102, 1, 1, 1, 1, 1,
0.1211863, -0.7012632, 1.828724, 1, 1, 1, 1, 1,
0.1214844, 0.9565233, 0.2341406, 1, 1, 1, 1, 1,
0.1239664, -0.7759184, 2.945548, 1, 1, 1, 1, 1,
0.1263136, 1.136362, 1.123926, 1, 1, 1, 1, 1,
0.1299853, 1.678344, 1.167133, 1, 1, 1, 1, 1,
0.1330849, 0.1298329, 1.202468, 1, 1, 1, 1, 1,
0.1350082, -0.6739048, 3.560107, 1, 1, 1, 1, 1,
0.1405961, -0.07097722, 1.898805, 0, 0, 1, 1, 1,
0.1474025, 1.237802, 0.2716004, 1, 0, 0, 1, 1,
0.1482637, -1.780915, 2.725149, 1, 0, 0, 1, 1,
0.1560448, 0.5308817, -1.493285, 1, 0, 0, 1, 1,
0.1563533, -0.3507751, 3.496073, 1, 0, 0, 1, 1,
0.1572006, 0.6248626, 0.9776306, 1, 0, 0, 1, 1,
0.1600736, -0.003402818, 0.3151621, 0, 0, 0, 1, 1,
0.1606131, -0.8658556, 5.112208, 0, 0, 0, 1, 1,
0.1661143, -1.591317, 4.801769, 0, 0, 0, 1, 1,
0.1675614, -2.071766, 3.998049, 0, 0, 0, 1, 1,
0.1678796, 0.2636811, -1.62921, 0, 0, 0, 1, 1,
0.1685729, 0.2981772, 1.25496, 0, 0, 0, 1, 1,
0.1693581, -1.925591, 2.696503, 0, 0, 0, 1, 1,
0.1700047, 1.803657, -0.3401308, 1, 1, 1, 1, 1,
0.1767568, -0.5376438, 2.085399, 1, 1, 1, 1, 1,
0.1795459, 1.443443, -1.080699, 1, 1, 1, 1, 1,
0.1851619, -0.1427898, 0.1455033, 1, 1, 1, 1, 1,
0.1870072, 2.496583, -0.6574819, 1, 1, 1, 1, 1,
0.1886574, -1.110331, 2.749801, 1, 1, 1, 1, 1,
0.191514, 0.311069, 0.3778996, 1, 1, 1, 1, 1,
0.1935814, 0.8724611, 0.6672232, 1, 1, 1, 1, 1,
0.1950011, -0.7765275, 4.562871, 1, 1, 1, 1, 1,
0.1955032, -0.6533726, 2.010113, 1, 1, 1, 1, 1,
0.1958532, -0.02357038, 0.8364665, 1, 1, 1, 1, 1,
0.1972063, -1.027981, 3.876449, 1, 1, 1, 1, 1,
0.1996451, -1.265128, 3.001748, 1, 1, 1, 1, 1,
0.2010846, -0.8564256, 2.511729, 1, 1, 1, 1, 1,
0.2012547, 0.4194923, -0.1215976, 1, 1, 1, 1, 1,
0.2065122, -0.6939513, 3.15479, 0, 0, 1, 1, 1,
0.2091306, 0.4008678, -1.087281, 1, 0, 0, 1, 1,
0.2091867, 1.303522, -0.8289297, 1, 0, 0, 1, 1,
0.2178842, 1.284596, -0.3703759, 1, 0, 0, 1, 1,
0.2241884, -0.2997655, 4.091286, 1, 0, 0, 1, 1,
0.2275331, -0.5643156, 2.269742, 1, 0, 0, 1, 1,
0.2285905, 1.064112, 1.381138, 0, 0, 0, 1, 1,
0.2289795, 0.2958292, 2.475322, 0, 0, 0, 1, 1,
0.2335312, -1.119883, 1.958188, 0, 0, 0, 1, 1,
0.233545, 0.7411662, -0.6952782, 0, 0, 0, 1, 1,
0.2357187, 0.268084, 0.7942197, 0, 0, 0, 1, 1,
0.2387427, -0.643406, 1.944823, 0, 0, 0, 1, 1,
0.2390115, -1.724339, 2.909632, 0, 0, 0, 1, 1,
0.2418555, 1.201489, 0.4410089, 1, 1, 1, 1, 1,
0.2419171, 0.986872, 2.149705, 1, 1, 1, 1, 1,
0.2439366, -1.100139, 1.846357, 1, 1, 1, 1, 1,
0.246578, -1.497897, 3.075589, 1, 1, 1, 1, 1,
0.2478701, 0.7298529, -2.330041, 1, 1, 1, 1, 1,
0.2503496, -0.4845105, 1.753404, 1, 1, 1, 1, 1,
0.2563445, -0.9385034, 4.567539, 1, 1, 1, 1, 1,
0.2566324, -0.8623007, 1.688548, 1, 1, 1, 1, 1,
0.2622751, -1.420471, 3.429275, 1, 1, 1, 1, 1,
0.2642733, 0.9666769, -0.1339594, 1, 1, 1, 1, 1,
0.2669724, 0.4096344, 0.2296678, 1, 1, 1, 1, 1,
0.2690242, 0.5828491, 0.5865934, 1, 1, 1, 1, 1,
0.27259, -1.108406, 1.483785, 1, 1, 1, 1, 1,
0.2763562, -0.2284176, 1.013543, 1, 1, 1, 1, 1,
0.2782026, -1.010346, 1.392021, 1, 1, 1, 1, 1,
0.2787398, 0.01864352, 2.324265, 0, 0, 1, 1, 1,
0.2845426, 1.835719, 0.4832117, 1, 0, 0, 1, 1,
0.2875796, 0.3613063, 1.638876, 1, 0, 0, 1, 1,
0.2881365, 0.2877164, -0.3158462, 1, 0, 0, 1, 1,
0.2893627, 0.1730438, 0.7636889, 1, 0, 0, 1, 1,
0.2905296, -0.7179573, 2.019311, 1, 0, 0, 1, 1,
0.2914042, -1.66441, 3.754108, 0, 0, 0, 1, 1,
0.2922504, -0.8561198, 1.311049, 0, 0, 0, 1, 1,
0.2984852, 0.4196317, -0.1239155, 0, 0, 0, 1, 1,
0.299757, 1.081772, -0.1311226, 0, 0, 0, 1, 1,
0.3006715, 2.711985, -0.2444399, 0, 0, 0, 1, 1,
0.3021203, -0.8587784, 2.938442, 0, 0, 0, 1, 1,
0.3041423, -0.8967328, 2.423256, 0, 0, 0, 1, 1,
0.3103061, -1.943634, 1.936985, 1, 1, 1, 1, 1,
0.3160753, -0.456107, 2.095561, 1, 1, 1, 1, 1,
0.3237701, 0.4954717, 1.043677, 1, 1, 1, 1, 1,
0.3277035, -0.4543988, 2.054945, 1, 1, 1, 1, 1,
0.329439, -1.146401, 2.502238, 1, 1, 1, 1, 1,
0.3320734, -1.492912, 3.694077, 1, 1, 1, 1, 1,
0.3354751, 0.8952231, 1.347183, 1, 1, 1, 1, 1,
0.3366739, -0.4164486, 1.59055, 1, 1, 1, 1, 1,
0.3368066, -0.3515809, 2.806234, 1, 1, 1, 1, 1,
0.3397256, -0.1004868, 0.5593945, 1, 1, 1, 1, 1,
0.34001, -0.1367546, 4.581144, 1, 1, 1, 1, 1,
0.3408527, -0.3893431, 0.9260014, 1, 1, 1, 1, 1,
0.3449742, -0.6527918, 1.561167, 1, 1, 1, 1, 1,
0.3492697, 0.267079, -1.024431, 1, 1, 1, 1, 1,
0.3496114, -0.7785034, 3.464766, 1, 1, 1, 1, 1,
0.3537677, -0.149409, 1.975369, 0, 0, 1, 1, 1,
0.3537794, 0.2814755, -0.2835218, 1, 0, 0, 1, 1,
0.3548733, 0.171214, -0.6441124, 1, 0, 0, 1, 1,
0.3553218, -1.757764, 2.865179, 1, 0, 0, 1, 1,
0.3587449, 1.168433, 1.803937, 1, 0, 0, 1, 1,
0.3596561, 2.784086, 0.3003573, 1, 0, 0, 1, 1,
0.3601384, -0.2506162, -0.3474506, 0, 0, 0, 1, 1,
0.3614406, 1.129068, 0.2316986, 0, 0, 0, 1, 1,
0.3621763, -0.7870247, 2.42754, 0, 0, 0, 1, 1,
0.3742301, 0.6023604, 1.34381, 0, 0, 0, 1, 1,
0.3753966, -1.232132, 3.151799, 0, 0, 0, 1, 1,
0.3760457, -0.6869851, 3.249711, 0, 0, 0, 1, 1,
0.3806719, 0.6115333, -1.122429, 0, 0, 0, 1, 1,
0.3836359, -0.6831463, 2.344879, 1, 1, 1, 1, 1,
0.3852854, 1.205121, 1.701393, 1, 1, 1, 1, 1,
0.3870471, -0.2070451, 1.663517, 1, 1, 1, 1, 1,
0.3885596, -2.044698, 2.627359, 1, 1, 1, 1, 1,
0.3894633, -1.544177, 2.797255, 1, 1, 1, 1, 1,
0.3928566, -0.718047, 1.24558, 1, 1, 1, 1, 1,
0.3980288, -0.2253909, 3.590499, 1, 1, 1, 1, 1,
0.4076209, 0.7950881, 0.3920873, 1, 1, 1, 1, 1,
0.4108062, -0.3127914, 2.760137, 1, 1, 1, 1, 1,
0.4157999, -0.01737128, 2.069481, 1, 1, 1, 1, 1,
0.4168877, 0.4504698, 1.846502, 1, 1, 1, 1, 1,
0.4173885, 0.5657417, 1.814459, 1, 1, 1, 1, 1,
0.4239443, 1.244823, -0.1041097, 1, 1, 1, 1, 1,
0.4241765, -1.552067, 2.843839, 1, 1, 1, 1, 1,
0.4271224, 1.457118, 0.7503422, 1, 1, 1, 1, 1,
0.4288374, 0.008575609, 1.257882, 0, 0, 1, 1, 1,
0.430118, 0.2186419, 0.5992415, 1, 0, 0, 1, 1,
0.4349118, -1.058067, 3.103991, 1, 0, 0, 1, 1,
0.4355415, 1.697991, -0.3156266, 1, 0, 0, 1, 1,
0.4431238, 1.362342, -0.9224676, 1, 0, 0, 1, 1,
0.4438567, -0.4283614, 3.28035, 1, 0, 0, 1, 1,
0.4444209, 0.1897215, 2.765248, 0, 0, 0, 1, 1,
0.4471866, 0.4160192, 2.639346, 0, 0, 0, 1, 1,
0.4482085, -0.8798, 3.044477, 0, 0, 0, 1, 1,
0.4511422, 0.3241664, 0.3510356, 0, 0, 0, 1, 1,
0.4523641, 0.8276314, 0.5873377, 0, 0, 0, 1, 1,
0.4529299, -0.386627, 2.700193, 0, 0, 0, 1, 1,
0.455644, 1.152413, 0.5966662, 0, 0, 0, 1, 1,
0.4564887, -0.01794336, 0.9382008, 1, 1, 1, 1, 1,
0.4600738, -0.01399866, 1.800299, 1, 1, 1, 1, 1,
0.4641971, 0.5585656, 2.351406, 1, 1, 1, 1, 1,
0.4642065, -0.5403293, 2.442144, 1, 1, 1, 1, 1,
0.471079, -1.161973, 2.886414, 1, 1, 1, 1, 1,
0.4801731, 2.406397, 1.029338, 1, 1, 1, 1, 1,
0.4809238, 1.69756, 1.355243, 1, 1, 1, 1, 1,
0.4810273, -1.278014, 2.476752, 1, 1, 1, 1, 1,
0.4822421, 0.3962014, 0.5204651, 1, 1, 1, 1, 1,
0.496, -0.8313334, 3.417704, 1, 1, 1, 1, 1,
0.49617, -0.2959523, 0.4718149, 1, 1, 1, 1, 1,
0.5001382, -0.6986964, 2.914871, 1, 1, 1, 1, 1,
0.5004491, 0.3532264, 1.378725, 1, 1, 1, 1, 1,
0.5016525, 0.647218, 1.801139, 1, 1, 1, 1, 1,
0.5022405, -0.01437571, 1.951031, 1, 1, 1, 1, 1,
0.5022463, -0.08262421, 1.547262, 0, 0, 1, 1, 1,
0.5028632, 1.581665, 1.878815, 1, 0, 0, 1, 1,
0.5040349, 0.7688824, 0.9573914, 1, 0, 0, 1, 1,
0.5059749, 0.800943, 1.012505, 1, 0, 0, 1, 1,
0.5095474, -0.9747548, 3.012161, 1, 0, 0, 1, 1,
0.5151691, -1.074129, 2.601636, 1, 0, 0, 1, 1,
0.5182765, -1.81705, 1.669091, 0, 0, 0, 1, 1,
0.5226202, -1.56146, 2.826787, 0, 0, 0, 1, 1,
0.5271433, 0.9871175, -1.412638, 0, 0, 0, 1, 1,
0.5302088, -1.078117, 2.139521, 0, 0, 0, 1, 1,
0.5378579, -1.351617, 3.882886, 0, 0, 0, 1, 1,
0.5381028, 1.455792, 0.3563335, 0, 0, 0, 1, 1,
0.539732, -0.8678249, 2.267747, 0, 0, 0, 1, 1,
0.5416162, -0.2090396, 2.529692, 1, 1, 1, 1, 1,
0.5418051, -1.414343, 1.561274, 1, 1, 1, 1, 1,
0.5469262, -0.575052, 1.711197, 1, 1, 1, 1, 1,
0.551043, -0.7929395, 3.593208, 1, 1, 1, 1, 1,
0.5519892, 0.3954239, -0.9132599, 1, 1, 1, 1, 1,
0.5532534, 1.354979, 0.1954409, 1, 1, 1, 1, 1,
0.5533372, -0.9847488, 3.069303, 1, 1, 1, 1, 1,
0.5559986, 0.3066608, 0.5365676, 1, 1, 1, 1, 1,
0.5573699, 1.424799, -0.8755943, 1, 1, 1, 1, 1,
0.5581777, 1.430785, 1.09976, 1, 1, 1, 1, 1,
0.5624909, -0.9342058, 3.058545, 1, 1, 1, 1, 1,
0.56626, 0.9087456, 1.265608, 1, 1, 1, 1, 1,
0.566372, -0.5262023, 3.034175, 1, 1, 1, 1, 1,
0.5676985, 0.119095, 2.031618, 1, 1, 1, 1, 1,
0.5692447, 0.6456799, 0.3487224, 1, 1, 1, 1, 1,
0.5713473, -0.5022424, 2.718974, 0, 0, 1, 1, 1,
0.5756391, 1.049469, -1.849432, 1, 0, 0, 1, 1,
0.57581, -0.5333448, 2.692851, 1, 0, 0, 1, 1,
0.5800984, 1.316946, 0.777203, 1, 0, 0, 1, 1,
0.5824044, -0.7269073, 3.286747, 1, 0, 0, 1, 1,
0.5829164, -1.650992, 2.425916, 1, 0, 0, 1, 1,
0.5832372, 0.5356061, 1.75321, 0, 0, 0, 1, 1,
0.5850346, 0.9285942, -0.7581643, 0, 0, 0, 1, 1,
0.5880008, -3.927035, 2.973744, 0, 0, 0, 1, 1,
0.5919866, 0.1084101, -0.02387996, 0, 0, 0, 1, 1,
0.5931499, 0.2281735, 0.5712317, 0, 0, 0, 1, 1,
0.5938877, -0.5742371, 2.069094, 0, 0, 0, 1, 1,
0.5948542, 0.5773448, 1.325252, 0, 0, 0, 1, 1,
0.5973678, 2.222804, 0.9448306, 1, 1, 1, 1, 1,
0.598819, 1.438929, 0.4809006, 1, 1, 1, 1, 1,
0.6028431, -0.4100713, 3.286298, 1, 1, 1, 1, 1,
0.6063053, 0.3462878, 2.140822, 1, 1, 1, 1, 1,
0.6091391, -1.420513, 3.121365, 1, 1, 1, 1, 1,
0.6147842, 0.6099869, -0.713581, 1, 1, 1, 1, 1,
0.6181664, -0.5250573, 1.829998, 1, 1, 1, 1, 1,
0.6215599, 0.8688547, -0.9363797, 1, 1, 1, 1, 1,
0.6223814, 0.5841188, 1.19196, 1, 1, 1, 1, 1,
0.6240863, -0.1810267, 2.080436, 1, 1, 1, 1, 1,
0.6295035, -0.1532991, 0.0353009, 1, 1, 1, 1, 1,
0.6314347, 0.3231874, 1.430393, 1, 1, 1, 1, 1,
0.6332874, 1.294848, 1.260992, 1, 1, 1, 1, 1,
0.6357388, -0.7395276, 1.980257, 1, 1, 1, 1, 1,
0.6362355, 1.858454, -0.8469545, 1, 1, 1, 1, 1,
0.6366869, 1.453775, 1.451413, 0, 0, 1, 1, 1,
0.6393599, 0.2116421, 2.034927, 1, 0, 0, 1, 1,
0.6420825, -0.8181254, 2.261178, 1, 0, 0, 1, 1,
0.6464784, -1.164542, 1.606917, 1, 0, 0, 1, 1,
0.650041, 0.5763183, 1.232891, 1, 0, 0, 1, 1,
0.6522759, -1.429179, 2.912731, 1, 0, 0, 1, 1,
0.656948, -0.1385655, 4.044271, 0, 0, 0, 1, 1,
0.6578115, -0.5948012, 2.151732, 0, 0, 0, 1, 1,
0.6582458, -0.5053242, 2.844342, 0, 0, 0, 1, 1,
0.6594828, 0.8372669, 0.4921868, 0, 0, 0, 1, 1,
0.6629795, -0.05256759, 1.308085, 0, 0, 0, 1, 1,
0.6674815, -1.619233, 2.972425, 0, 0, 0, 1, 1,
0.66782, -1.327546, 3.067508, 0, 0, 0, 1, 1,
0.6703928, 0.6805794, 3.208811, 1, 1, 1, 1, 1,
0.6704534, -1.109469, 3.984146, 1, 1, 1, 1, 1,
0.6763979, -2.045624, 3.76769, 1, 1, 1, 1, 1,
0.6799923, 0.485781, 1.925595, 1, 1, 1, 1, 1,
0.6801915, 1.129076, 0.04952207, 1, 1, 1, 1, 1,
0.6911337, -0.7194954, 2.330833, 1, 1, 1, 1, 1,
0.6927176, -1.291945, 1.656132, 1, 1, 1, 1, 1,
0.693486, -0.6784887, 1.84414, 1, 1, 1, 1, 1,
0.6989831, 0.3829446, 0.7949994, 1, 1, 1, 1, 1,
0.7014523, 0.009192948, 1.052234, 1, 1, 1, 1, 1,
0.7028353, 0.1274084, 1.323796, 1, 1, 1, 1, 1,
0.704695, -0.6652583, 2.693135, 1, 1, 1, 1, 1,
0.7064379, -0.9031441, 2.152208, 1, 1, 1, 1, 1,
0.7072862, -0.0731096, 0.3014544, 1, 1, 1, 1, 1,
0.7131204, -0.3052499, 2.105475, 1, 1, 1, 1, 1,
0.714773, 0.8142697, -0.338163, 0, 0, 1, 1, 1,
0.7266511, -0.4412803, 1.474568, 1, 0, 0, 1, 1,
0.7335095, -1.605833, 1.620534, 1, 0, 0, 1, 1,
0.7356971, 0.9638124, 1.02566, 1, 0, 0, 1, 1,
0.7375064, 0.6713542, 0.8763983, 1, 0, 0, 1, 1,
0.7395636, -0.7321267, 2.689609, 1, 0, 0, 1, 1,
0.739951, 1.154982, 0.3083086, 0, 0, 0, 1, 1,
0.7479148, -0.4366502, 2.710182, 0, 0, 0, 1, 1,
0.752005, -0.6705245, 3.006511, 0, 0, 0, 1, 1,
0.7560157, 0.3593968, 2.556197, 0, 0, 0, 1, 1,
0.7604286, 0.7295858, 0.137302, 0, 0, 0, 1, 1,
0.7616667, -0.5027952, 1.379588, 0, 0, 0, 1, 1,
0.7705668, 1.573813, 0.3314783, 0, 0, 0, 1, 1,
0.772231, -0.638512, 2.201363, 1, 1, 1, 1, 1,
0.773339, -0.6803584, 1.906151, 1, 1, 1, 1, 1,
0.776099, 0.7051774, 1.602919, 1, 1, 1, 1, 1,
0.7796406, -1.412127, 1.916616, 1, 1, 1, 1, 1,
0.7850527, 1.995512, 0.1821483, 1, 1, 1, 1, 1,
0.7890545, 0.4836085, 0.8661085, 1, 1, 1, 1, 1,
0.7987516, -0.6884804, 3.45848, 1, 1, 1, 1, 1,
0.8008516, 1.416087, -0.1127441, 1, 1, 1, 1, 1,
0.8022518, 0.01179881, 3.148232, 1, 1, 1, 1, 1,
0.8030532, -0.06336523, -1.144206, 1, 1, 1, 1, 1,
0.8052422, -0.5135813, 2.235272, 1, 1, 1, 1, 1,
0.8084245, -0.6722064, 1.693574, 1, 1, 1, 1, 1,
0.8086883, 0.2053868, 1.701382, 1, 1, 1, 1, 1,
0.8096991, 2.079652, 0.5075498, 1, 1, 1, 1, 1,
0.8100458, -0.7361051, 1.731114, 1, 1, 1, 1, 1,
0.8149457, 0.627044, 0.9416714, 0, 0, 1, 1, 1,
0.8247061, -0.08949776, 1.803657, 1, 0, 0, 1, 1,
0.8316202, 0.04691745, 0.04344458, 1, 0, 0, 1, 1,
0.8379581, -0.7234187, 2.827275, 1, 0, 0, 1, 1,
0.8380688, -0.6218255, 0.7822706, 1, 0, 0, 1, 1,
0.8408763, -0.158154, 3.272084, 1, 0, 0, 1, 1,
0.8461822, 0.6073356, 3.364449, 0, 0, 0, 1, 1,
0.847078, 0.1973931, 0.4160752, 0, 0, 0, 1, 1,
0.8522105, 0.136984, 2.491088, 0, 0, 0, 1, 1,
0.8578491, 0.6632629, 2.305211, 0, 0, 0, 1, 1,
0.8625575, 0.9870507, 0.3011515, 0, 0, 0, 1, 1,
0.8682725, -0.160038, 0.2715559, 0, 0, 0, 1, 1,
0.8702373, -1.78183, 2.991347, 0, 0, 0, 1, 1,
0.8730117, 1.221579, 0.613121, 1, 1, 1, 1, 1,
0.8747762, -2.056468, 2.306139, 1, 1, 1, 1, 1,
0.8794391, 1.029163, 1.760286, 1, 1, 1, 1, 1,
0.8798857, 1.206017, 1.358181, 1, 1, 1, 1, 1,
0.8813135, -0.3077514, 1.106358, 1, 1, 1, 1, 1,
0.8818777, 0.770789, 1.69755, 1, 1, 1, 1, 1,
0.8820397, 0.1753331, 1.143607, 1, 1, 1, 1, 1,
0.8825766, -0.2986153, 4.046222, 1, 1, 1, 1, 1,
0.889101, -1.091898, 3.656944, 1, 1, 1, 1, 1,
0.9060173, 0.2316503, -0.1918492, 1, 1, 1, 1, 1,
0.9095927, -0.3141747, 2.09578, 1, 1, 1, 1, 1,
0.9096906, -1.143422, 1.70084, 1, 1, 1, 1, 1,
0.9147881, 0.9923916, 0.7485024, 1, 1, 1, 1, 1,
0.9222414, -1.798208, 2.162583, 1, 1, 1, 1, 1,
0.9222887, 0.08034788, 1.831059, 1, 1, 1, 1, 1,
0.925137, -0.1575974, 1.670699, 0, 0, 1, 1, 1,
0.9325084, -0.7845465, 2.668418, 1, 0, 0, 1, 1,
0.9353921, -0.6001588, 2.822963, 1, 0, 0, 1, 1,
0.9378697, 0.063912, 2.127119, 1, 0, 0, 1, 1,
0.9393759, 0.9980533, 0.775971, 1, 0, 0, 1, 1,
0.9421818, -1.232295, 3.302684, 1, 0, 0, 1, 1,
0.9499075, -0.5873754, 1.491205, 0, 0, 0, 1, 1,
0.9534908, -0.5671932, 3.24028, 0, 0, 0, 1, 1,
0.9548613, 0.6731679, 1.489604, 0, 0, 0, 1, 1,
0.956293, -1.023912, 1.835439, 0, 0, 0, 1, 1,
0.9701079, -1.831642, 3.263684, 0, 0, 0, 1, 1,
0.9708536, -0.7362052, 2.643417, 0, 0, 0, 1, 1,
0.9721477, -1.950726, 3.072303, 0, 0, 0, 1, 1,
0.9786047, 0.5542883, 1.315944, 1, 1, 1, 1, 1,
0.9792253, 0.7567052, 0.7881706, 1, 1, 1, 1, 1,
0.9792332, -0.5340534, 1.583999, 1, 1, 1, 1, 1,
0.9810253, -1.6798, 1.704061, 1, 1, 1, 1, 1,
0.9838967, -0.6213809, 0.6960241, 1, 1, 1, 1, 1,
0.9899577, 0.05751824, 1.646616, 1, 1, 1, 1, 1,
0.9926561, 1.636601, 1.364784, 1, 1, 1, 1, 1,
1.000949, -0.7249513, 4.157312, 1, 1, 1, 1, 1,
1.005845, 0.2558759, 0.5328321, 1, 1, 1, 1, 1,
1.010615, -0.3724169, 2.723585, 1, 1, 1, 1, 1,
1.011506, 1.025921, 0.9706268, 1, 1, 1, 1, 1,
1.012267, 0.8622271, 2.828478, 1, 1, 1, 1, 1,
1.015074, -0.2530249, 3.101312, 1, 1, 1, 1, 1,
1.025308, 0.5528117, 0.04684865, 1, 1, 1, 1, 1,
1.043367, 0.0003215128, 0.1145662, 1, 1, 1, 1, 1,
1.054828, 0.1183083, 1.240178, 0, 0, 1, 1, 1,
1.071473, 0.1771015, 3.388327, 1, 0, 0, 1, 1,
1.08482, -0.2680196, 0.6443803, 1, 0, 0, 1, 1,
1.09491, -0.4836799, 1.292695, 1, 0, 0, 1, 1,
1.095653, -0.9819588, 1.862882, 1, 0, 0, 1, 1,
1.096223, 0.7482601, 0.4673755, 1, 0, 0, 1, 1,
1.09854, 2.522979, -0.3417843, 0, 0, 0, 1, 1,
1.10453, -0.5176879, 2.138576, 0, 0, 0, 1, 1,
1.110273, -1.100657, 1.170023, 0, 0, 0, 1, 1,
1.113265, 1.955483, 2.170464, 0, 0, 0, 1, 1,
1.116597, -0.2339385, 0.9142517, 0, 0, 0, 1, 1,
1.11663, 0.2776379, 2.539778, 0, 0, 0, 1, 1,
1.118128, 0.3843762, 0.5849254, 0, 0, 0, 1, 1,
1.125116, -0.8288562, 2.035392, 1, 1, 1, 1, 1,
1.126688, 0.768386, 1.06013, 1, 1, 1, 1, 1,
1.130306, 1.337732, 0.8076429, 1, 1, 1, 1, 1,
1.132907, 0.9006817, -0.3079449, 1, 1, 1, 1, 1,
1.135117, -0.9476332, 2.174875, 1, 1, 1, 1, 1,
1.135587, -0.2483777, 0.5698404, 1, 1, 1, 1, 1,
1.136725, -1.129271, 1.313837, 1, 1, 1, 1, 1,
1.137436, 0.3416288, 0.2346997, 1, 1, 1, 1, 1,
1.14174, -0.4723677, 0.5734912, 1, 1, 1, 1, 1,
1.147306, -0.1154095, 1.617252, 1, 1, 1, 1, 1,
1.15163, 1.454403, 0.4747064, 1, 1, 1, 1, 1,
1.152728, 0.7867056, -0.3620411, 1, 1, 1, 1, 1,
1.160877, 1.192005, -0.0001818139, 1, 1, 1, 1, 1,
1.17119, -1.50599, 1.197771, 1, 1, 1, 1, 1,
1.186857, -1.136149, 0.783893, 1, 1, 1, 1, 1,
1.19307, -0.5123141, 4.041205, 0, 0, 1, 1, 1,
1.193844, 0.5901552, 1.525975, 1, 0, 0, 1, 1,
1.194053, -0.2855481, 1.111016, 1, 0, 0, 1, 1,
1.200259, -2.092093, 2.193822, 1, 0, 0, 1, 1,
1.202643, 2.328096, -0.5522727, 1, 0, 0, 1, 1,
1.204571, 0.9314784, 0.802645, 1, 0, 0, 1, 1,
1.204823, 0.009954266, 2.211337, 0, 0, 0, 1, 1,
1.206166, 0.03456328, 3.71009, 0, 0, 0, 1, 1,
1.210641, -2.159976, 3.49519, 0, 0, 0, 1, 1,
1.210778, -0.8438683, 4.213805, 0, 0, 0, 1, 1,
1.213306, 1.396896, 0.956543, 0, 0, 0, 1, 1,
1.215185, 1.404609, 0.4294061, 0, 0, 0, 1, 1,
1.225242, -0.9956757, 1.866085, 0, 0, 0, 1, 1,
1.228323, 1.871547, -0.3016811, 1, 1, 1, 1, 1,
1.229691, -0.3016936, 4.195712, 1, 1, 1, 1, 1,
1.23016, 0.5164794, 1.006996, 1, 1, 1, 1, 1,
1.243524, -0.9119142, 4.129626, 1, 1, 1, 1, 1,
1.244731, 0.017385, 1.552758, 1, 1, 1, 1, 1,
1.247072, 0.6638539, 0.5514007, 1, 1, 1, 1, 1,
1.247853, -0.2944593, 2.480522, 1, 1, 1, 1, 1,
1.252047, 1.915029, 2.076855, 1, 1, 1, 1, 1,
1.262693, -1.71399, 3.467432, 1, 1, 1, 1, 1,
1.279721, -0.3419606, 1.010843, 1, 1, 1, 1, 1,
1.280038, -1.104734, 3.3583, 1, 1, 1, 1, 1,
1.281862, -0.1158943, 0.9619115, 1, 1, 1, 1, 1,
1.284597, -0.1315693, 2.627409, 1, 1, 1, 1, 1,
1.284836, -0.4309011, 2.588836, 1, 1, 1, 1, 1,
1.286489, -1.257648, 3.204809, 1, 1, 1, 1, 1,
1.287568, -1.117846, 2.32263, 0, 0, 1, 1, 1,
1.289052, -0.06957836, -1.46165, 1, 0, 0, 1, 1,
1.289924, -0.6766986, 2.985922, 1, 0, 0, 1, 1,
1.292478, 0.1691673, 0.5781451, 1, 0, 0, 1, 1,
1.294363, 1.299551, -0.5130048, 1, 0, 0, 1, 1,
1.303201, -1.265199, 2.197515, 1, 0, 0, 1, 1,
1.306396, 1.054809, 1.155698, 0, 0, 0, 1, 1,
1.31691, 0.9306782, 0.1399988, 0, 0, 0, 1, 1,
1.318642, 0.4517681, 1.615255, 0, 0, 0, 1, 1,
1.319703, 1.119033, -0.3284169, 0, 0, 0, 1, 1,
1.32863, 0.4069566, 0.8644335, 0, 0, 0, 1, 1,
1.334744, 1.485469, 1.600559, 0, 0, 0, 1, 1,
1.335829, -1.727831, 2.021155, 0, 0, 0, 1, 1,
1.33629, 0.9366223, 0.310466, 1, 1, 1, 1, 1,
1.338849, -0.1840048, 2.399598, 1, 1, 1, 1, 1,
1.348126, -1.34376, 1.022903, 1, 1, 1, 1, 1,
1.349679, 0.8019323, 1.542021, 1, 1, 1, 1, 1,
1.356669, 0.2125716, 1.78458, 1, 1, 1, 1, 1,
1.357082, 0.6881147, 1.767719, 1, 1, 1, 1, 1,
1.361, 1.785228, 0.979448, 1, 1, 1, 1, 1,
1.363657, -0.3088254, 0.9985096, 1, 1, 1, 1, 1,
1.364568, 1.020667, -0.2940778, 1, 1, 1, 1, 1,
1.365406, -0.6598691, 1.55454, 1, 1, 1, 1, 1,
1.372109, -2.124807, 4.001792, 1, 1, 1, 1, 1,
1.404066, -1.789979, 2.869711, 1, 1, 1, 1, 1,
1.406242, -1.860313, 2.577189, 1, 1, 1, 1, 1,
1.413365, 1.676098, -0.9370793, 1, 1, 1, 1, 1,
1.421231, 0.05680677, 0.4710511, 1, 1, 1, 1, 1,
1.430256, -0.03437617, 1.699303, 0, 0, 1, 1, 1,
1.440397, -0.3022827, 2.198073, 1, 0, 0, 1, 1,
1.452598, -0.3836822, 1.804062, 1, 0, 0, 1, 1,
1.471984, -0.3722979, 1.884266, 1, 0, 0, 1, 1,
1.481371, -1.486145, 0.03759174, 1, 0, 0, 1, 1,
1.488529, 1.420048, 1.17277, 1, 0, 0, 1, 1,
1.493787, -0.2646015, 1.422622, 0, 0, 0, 1, 1,
1.513907, 1.13435, 0.41298, 0, 0, 0, 1, 1,
1.516785, -0.214843, 1.424788, 0, 0, 0, 1, 1,
1.520826, -0.2791366, 0.4014314, 0, 0, 0, 1, 1,
1.540369, -1.349583, 1.295145, 0, 0, 0, 1, 1,
1.555287, 0.7955268, 0.8377324, 0, 0, 0, 1, 1,
1.559075, 0.9149912, 1.175808, 0, 0, 0, 1, 1,
1.592566, -1.387418, 2.88648, 1, 1, 1, 1, 1,
1.597956, 0.02282208, 1.023186, 1, 1, 1, 1, 1,
1.599106, -0.1261302, 2.250082, 1, 1, 1, 1, 1,
1.603276, 0.97737, 0.2479142, 1, 1, 1, 1, 1,
1.603597, -0.8697484, 1.554643, 1, 1, 1, 1, 1,
1.62672, 1.643168, -1.787804, 1, 1, 1, 1, 1,
1.627862, -0.04461572, 0.5512832, 1, 1, 1, 1, 1,
1.64438, 0.2052744, 1.667307, 1, 1, 1, 1, 1,
1.645473, -0.8729116, 3.20884, 1, 1, 1, 1, 1,
1.651622, 0.2965673, 0.2573529, 1, 1, 1, 1, 1,
1.653119, 0.1749341, 0.01438526, 1, 1, 1, 1, 1,
1.667882, -0.2524928, 2.650333, 1, 1, 1, 1, 1,
1.678036, -0.3349847, 1.328013, 1, 1, 1, 1, 1,
1.679688, 0.42368, 0.9695833, 1, 1, 1, 1, 1,
1.682911, -2.979978, 4.356005, 1, 1, 1, 1, 1,
1.683314, -1.130573, 1.766314, 0, 0, 1, 1, 1,
1.693662, -1.783571, 3.266372, 1, 0, 0, 1, 1,
1.707217, -1.528733, 3.638679, 1, 0, 0, 1, 1,
1.728953, 1.895469, 3.190966, 1, 0, 0, 1, 1,
1.738352, 0.1872281, 1.087955, 1, 0, 0, 1, 1,
1.741117, -0.5505999, 0.2368519, 1, 0, 0, 1, 1,
1.745804, 0.4049377, 2.702072, 0, 0, 0, 1, 1,
1.751599, -0.009856476, 1.302796, 0, 0, 0, 1, 1,
1.780722, 0.0768797, 3.859765, 0, 0, 0, 1, 1,
1.785988, 1.105522, 1.237563, 0, 0, 0, 1, 1,
1.826169, 1.664123, 1.767866, 0, 0, 0, 1, 1,
1.912275, 1.304959, -0.4083496, 0, 0, 0, 1, 1,
1.912567, 0.947872, 2.358518, 0, 0, 0, 1, 1,
1.926716, -0.9591653, 2.87081, 1, 1, 1, 1, 1,
1.928506, -0.5676531, 2.67969, 1, 1, 1, 1, 1,
1.935319, -2.167025, 2.803535, 1, 1, 1, 1, 1,
1.940118, 0.4110792, 0.8963613, 1, 1, 1, 1, 1,
1.946107, 0.3503337, 1.375703, 1, 1, 1, 1, 1,
1.947724, -0.05479461, 2.893696, 1, 1, 1, 1, 1,
1.955116, 0.3408787, 2.318142, 1, 1, 1, 1, 1,
1.956684, 0.684489, 0.5034899, 1, 1, 1, 1, 1,
1.980797, -1.128453, 1.309628, 1, 1, 1, 1, 1,
1.991511, -0.09467294, 0.4705603, 1, 1, 1, 1, 1,
1.993444, -1.312563, 3.450095, 1, 1, 1, 1, 1,
2.00104, -0.2890191, 1.988195, 1, 1, 1, 1, 1,
2.012163, 1.632049, 1.441258, 1, 1, 1, 1, 1,
2.027322, -0.9827377, 0.8497874, 1, 1, 1, 1, 1,
2.042207, -0.1307902, -1.078301, 1, 1, 1, 1, 1,
2.047251, -0.04734348, 2.004734, 0, 0, 1, 1, 1,
2.067932, 0.5843769, 1.844273, 1, 0, 0, 1, 1,
2.107141, -0.6362537, 2.944338, 1, 0, 0, 1, 1,
2.124861, -0.275753, 1.505763, 1, 0, 0, 1, 1,
2.199208, 1.52736, 1.050368, 1, 0, 0, 1, 1,
2.220204, -0.7918718, 0.2773184, 1, 0, 0, 1, 1,
2.231806, -0.5435929, 3.017663, 0, 0, 0, 1, 1,
2.23779, 1.101295, 2.100867, 0, 0, 0, 1, 1,
2.25737, 0.02217252, 0.3154853, 0, 0, 0, 1, 1,
2.314801, -0.4133661, 1.719565, 0, 0, 0, 1, 1,
2.314823, 0.06739354, 0.08571971, 0, 0, 0, 1, 1,
2.335222, -0.4151632, 2.393729, 0, 0, 0, 1, 1,
2.339269, 2.025472, 1.700261, 0, 0, 0, 1, 1,
2.343365, -0.4600534, 1.108272, 1, 1, 1, 1, 1,
2.348261, 0.181112, 0.4167508, 1, 1, 1, 1, 1,
2.464786, 0.05412754, 1.592706, 1, 1, 1, 1, 1,
2.473534, -1.523156, 1.688128, 1, 1, 1, 1, 1,
2.517008, -0.8089287, 0.99423, 1, 1, 1, 1, 1,
2.996307, 0.2785482, 0.506389, 1, 1, 1, 1, 1,
3.229905, -0.8192508, 0.5504711, 1, 1, 1, 1, 1
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
var radius = 9.891374;
var distance = 34.74303;
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
mvMatrix.translate( 0.1793635, 0.5450457, 0.1356144 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.74303);
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
