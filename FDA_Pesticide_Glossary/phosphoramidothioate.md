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
-3.189998, -0.8576155, -0.1149372, 1, 0, 0, 1,
-2.818909, -1.422527, -2.267512, 1, 0.007843138, 0, 1,
-2.623106, 0.8883638, -1.843526, 1, 0.01176471, 0, 1,
-2.533893, -0.5739867, -3.046592, 1, 0.01960784, 0, 1,
-2.443517, 0.4698699, -0.3043927, 1, 0.02352941, 0, 1,
-2.345052, -1.152984, -1.534678, 1, 0.03137255, 0, 1,
-2.340692, -0.4940057, -1.696425, 1, 0.03529412, 0, 1,
-2.32911, 0.2914981, -1.242014, 1, 0.04313726, 0, 1,
-2.258268, 1.285708, -0.5109106, 1, 0.04705882, 0, 1,
-2.227732, -0.2448859, -3.206093, 1, 0.05490196, 0, 1,
-2.210355, -0.5125834, -0.9619558, 1, 0.05882353, 0, 1,
-2.154032, -0.8197368, -0.6159856, 1, 0.06666667, 0, 1,
-2.131911, 0.2828766, 0.04586304, 1, 0.07058824, 0, 1,
-2.118465, -1.018114, -1.689502, 1, 0.07843138, 0, 1,
-2.110892, 0.8392974, -2.205228, 1, 0.08235294, 0, 1,
-2.109756, 0.8006943, -3.034652, 1, 0.09019608, 0, 1,
-2.08633, -0.8677433, 1.008992, 1, 0.09411765, 0, 1,
-2.054516, 1.9117, 0.2312165, 1, 0.1019608, 0, 1,
-2.024745, 0.9479524, -0.3647448, 1, 0.1098039, 0, 1,
-2.010196, -1.891407, -3.530661, 1, 0.1137255, 0, 1,
-1.98903, -0.7636821, -1.571373, 1, 0.1215686, 0, 1,
-1.988555, -0.8908728, -1.713157, 1, 0.1254902, 0, 1,
-1.979268, -0.4227404, -2.42312, 1, 0.1333333, 0, 1,
-1.958619, 0.05827326, -2.327207, 1, 0.1372549, 0, 1,
-1.958127, -0.08343581, -2.111689, 1, 0.145098, 0, 1,
-1.950885, 0.490567, -1.791221, 1, 0.1490196, 0, 1,
-1.944551, 0.2749571, -0.1484203, 1, 0.1568628, 0, 1,
-1.942947, -1.049938, -2.494575, 1, 0.1607843, 0, 1,
-1.935766, 1.068219, -1.161246, 1, 0.1686275, 0, 1,
-1.931307, -0.8851716, -0.6352765, 1, 0.172549, 0, 1,
-1.921125, -0.8011972, -1.373949, 1, 0.1803922, 0, 1,
-1.910036, 0.763722, 0.168642, 1, 0.1843137, 0, 1,
-1.908228, -0.8269273, -1.211411, 1, 0.1921569, 0, 1,
-1.899101, 2.031253, -0.8396628, 1, 0.1960784, 0, 1,
-1.897929, 0.09706947, -1.807509, 1, 0.2039216, 0, 1,
-1.855733, 0.2119067, -3.858868, 1, 0.2117647, 0, 1,
-1.8505, -0.1167731, -0.777473, 1, 0.2156863, 0, 1,
-1.843392, 0.1355042, -0.6493524, 1, 0.2235294, 0, 1,
-1.785422, 1.106052, -2.223167, 1, 0.227451, 0, 1,
-1.750074, -0.306153, -1.852579, 1, 0.2352941, 0, 1,
-1.74994, 0.4247162, 0.3041328, 1, 0.2392157, 0, 1,
-1.749647, -1.805411, -2.863118, 1, 0.2470588, 0, 1,
-1.723388, -0.5255563, -2.775039, 1, 0.2509804, 0, 1,
-1.705926, -0.7356175, -0.264247, 1, 0.2588235, 0, 1,
-1.705763, 1.024789, -0.2839148, 1, 0.2627451, 0, 1,
-1.681044, -0.03731638, -1.436784, 1, 0.2705882, 0, 1,
-1.679768, -0.2342514, -1.817604, 1, 0.2745098, 0, 1,
-1.672158, 1.140005, -0.445821, 1, 0.282353, 0, 1,
-1.660858, -0.9482589, -3.494674, 1, 0.2862745, 0, 1,
-1.660549, 0.9070676, -1.028855, 1, 0.2941177, 0, 1,
-1.650782, -0.1793375, -0.5231718, 1, 0.3019608, 0, 1,
-1.644745, -0.3455822, -1.113163, 1, 0.3058824, 0, 1,
-1.641757, 1.300587, -1.407465, 1, 0.3137255, 0, 1,
-1.636852, -0.4041511, -1.317521, 1, 0.3176471, 0, 1,
-1.624106, -0.2796477, -2.23078, 1, 0.3254902, 0, 1,
-1.622482, 1.577856, -0.3431346, 1, 0.3294118, 0, 1,
-1.61749, 0.3975522, -3.334489, 1, 0.3372549, 0, 1,
-1.612651, -0.2766941, -1.117591, 1, 0.3411765, 0, 1,
-1.609689, -1.45886, -4.324798, 1, 0.3490196, 0, 1,
-1.607924, -1.435678, -2.927737, 1, 0.3529412, 0, 1,
-1.606733, -1.367369, -1.067156, 1, 0.3607843, 0, 1,
-1.598152, -0.04936817, -1.625341, 1, 0.3647059, 0, 1,
-1.586195, 0.2171904, -3.387223, 1, 0.372549, 0, 1,
-1.580477, -0.6531634, -1.890282, 1, 0.3764706, 0, 1,
-1.580469, 0.3264361, -0.9446536, 1, 0.3843137, 0, 1,
-1.576001, -0.0991848, -1.205174, 1, 0.3882353, 0, 1,
-1.568716, -0.3336217, -2.102371, 1, 0.3960784, 0, 1,
-1.56239, 1.48989, -1.562962, 1, 0.4039216, 0, 1,
-1.548157, -0.6073804, -2.076252, 1, 0.4078431, 0, 1,
-1.540334, 0.1214908, -2.925373, 1, 0.4156863, 0, 1,
-1.519349, 1.024458, -1.059806, 1, 0.4196078, 0, 1,
-1.518511, 0.8156041, -0.7492771, 1, 0.427451, 0, 1,
-1.498605, 1.689214, -1.876217, 1, 0.4313726, 0, 1,
-1.491906, 0.293676, -1.362946, 1, 0.4392157, 0, 1,
-1.471138, -1.086253, -1.993142, 1, 0.4431373, 0, 1,
-1.470814, 0.726441, -0.2200553, 1, 0.4509804, 0, 1,
-1.466577, -1.595837, -2.795326, 1, 0.454902, 0, 1,
-1.465346, 1.202903, -0.9840046, 1, 0.4627451, 0, 1,
-1.464924, -0.4061652, -2.768899, 1, 0.4666667, 0, 1,
-1.45893, -0.7081794, -0.5889728, 1, 0.4745098, 0, 1,
-1.454847, -1.284795, -1.712373, 1, 0.4784314, 0, 1,
-1.443293, -0.5190115, -1.498538, 1, 0.4862745, 0, 1,
-1.39464, -0.5702016, -1.128706, 1, 0.4901961, 0, 1,
-1.378935, 1.061796, -0.3697165, 1, 0.4980392, 0, 1,
-1.364948, 0.07530172, -2.832145, 1, 0.5058824, 0, 1,
-1.354059, -2.101878, -1.247474, 1, 0.509804, 0, 1,
-1.349486, 0.04531295, -0.5124326, 1, 0.5176471, 0, 1,
-1.348886, 0.2264145, -2.123259, 1, 0.5215687, 0, 1,
-1.348639, 0.1328152, -0.0669108, 1, 0.5294118, 0, 1,
-1.346229, 0.9759033, -0.3663922, 1, 0.5333334, 0, 1,
-1.345158, 0.3482308, -2.751813, 1, 0.5411765, 0, 1,
-1.333207, 0.2740061, -2.935193, 1, 0.5450981, 0, 1,
-1.326775, -0.0832077, -2.224773, 1, 0.5529412, 0, 1,
-1.32329, 0.389468, -1.870084, 1, 0.5568628, 0, 1,
-1.321825, -0.1269963, -0.9887617, 1, 0.5647059, 0, 1,
-1.318075, 0.08460662, -1.856039, 1, 0.5686275, 0, 1,
-1.316349, -0.4742935, -2.251881, 1, 0.5764706, 0, 1,
-1.314201, 0.4595093, -0.8748199, 1, 0.5803922, 0, 1,
-1.303519, 1.244003, -1.489539, 1, 0.5882353, 0, 1,
-1.294535, -0.4110177, -2.484243, 1, 0.5921569, 0, 1,
-1.287924, 1.271242, -1.025694, 1, 0.6, 0, 1,
-1.287113, 0.2533771, 0.9966562, 1, 0.6078432, 0, 1,
-1.28327, -0.5477189, -1.111069, 1, 0.6117647, 0, 1,
-1.27934, -1.131989, -1.583954, 1, 0.6196079, 0, 1,
-1.278281, -0.5135184, -2.31203, 1, 0.6235294, 0, 1,
-1.261008, 0.274633, 0.005428554, 1, 0.6313726, 0, 1,
-1.259182, 0.0587666, -1.187384, 1, 0.6352941, 0, 1,
-1.241041, -0.4354723, -2.854242, 1, 0.6431373, 0, 1,
-1.236795, 0.782981, -1.552112, 1, 0.6470588, 0, 1,
-1.233845, -0.3762518, -1.884531, 1, 0.654902, 0, 1,
-1.233087, 1.758552, -1.058412, 1, 0.6588235, 0, 1,
-1.229786, 0.2499897, -1.615264, 1, 0.6666667, 0, 1,
-1.227168, 0.7457284, -1.650956, 1, 0.6705883, 0, 1,
-1.224287, 0.7889946, -0.9231806, 1, 0.6784314, 0, 1,
-1.219209, 2.855551, 0.3392761, 1, 0.682353, 0, 1,
-1.214177, -0.7810786, -1.675626, 1, 0.6901961, 0, 1,
-1.20729, 0.1113119, -0.5417523, 1, 0.6941177, 0, 1,
-1.205563, 0.8499636, 0.1334928, 1, 0.7019608, 0, 1,
-1.204831, -0.182167, -2.615263, 1, 0.7098039, 0, 1,
-1.198724, 0.769214, 0.1885722, 1, 0.7137255, 0, 1,
-1.197053, 0.1240907, -1.726799, 1, 0.7215686, 0, 1,
-1.190711, 0.2643357, -2.812282, 1, 0.7254902, 0, 1,
-1.189959, 1.486237, -0.5825953, 1, 0.7333333, 0, 1,
-1.18317, -0.393898, -3.130906, 1, 0.7372549, 0, 1,
-1.173108, 0.3987619, -1.837355, 1, 0.7450981, 0, 1,
-1.16699, -0.6170035, -0.9241493, 1, 0.7490196, 0, 1,
-1.165812, 0.1273074, 0.04044168, 1, 0.7568628, 0, 1,
-1.153174, 1.216641, -0.5824044, 1, 0.7607843, 0, 1,
-1.142058, 0.5334472, -2.315619, 1, 0.7686275, 0, 1,
-1.134822, 1.906191, -0.07397164, 1, 0.772549, 0, 1,
-1.133559, 2.044566, -1.810217, 1, 0.7803922, 0, 1,
-1.133037, 0.1557955, -0.8130776, 1, 0.7843137, 0, 1,
-1.130138, 0.1546164, -1.571262, 1, 0.7921569, 0, 1,
-1.127879, 0.7427225, -2.53039, 1, 0.7960784, 0, 1,
-1.12777, 0.001254902, -1.044175, 1, 0.8039216, 0, 1,
-1.124238, -1.089377, -2.842731, 1, 0.8117647, 0, 1,
-1.122592, -0.4926607, -1.159201, 1, 0.8156863, 0, 1,
-1.117775, 0.3980017, -0.7923469, 1, 0.8235294, 0, 1,
-1.110736, -0.1158873, -2.293677, 1, 0.827451, 0, 1,
-1.091103, -0.1633588, -0.6657882, 1, 0.8352941, 0, 1,
-1.088932, -0.1073434, -2.187398, 1, 0.8392157, 0, 1,
-1.088201, 0.3294897, -1.046488, 1, 0.8470588, 0, 1,
-1.088099, -1.066771, -1.356629, 1, 0.8509804, 0, 1,
-1.079691, -0.580617, -3.115796, 1, 0.8588235, 0, 1,
-1.075739, -1.170629, -0.6243429, 1, 0.8627451, 0, 1,
-1.074188, 0.9941159, -0.1724251, 1, 0.8705882, 0, 1,
-1.073063, -0.8984612, -2.669986, 1, 0.8745098, 0, 1,
-1.065622, -0.8303939, -0.9572763, 1, 0.8823529, 0, 1,
-1.065488, -0.7345456, -1.831138, 1, 0.8862745, 0, 1,
-1.064515, -0.410564, -1.460793, 1, 0.8941177, 0, 1,
-1.064013, -0.7341501, -1.981181, 1, 0.8980392, 0, 1,
-1.061911, 0.4409831, -1.409972, 1, 0.9058824, 0, 1,
-1.060382, -0.5104001, -1.843617, 1, 0.9137255, 0, 1,
-1.05693, 0.3912134, 1.745907, 1, 0.9176471, 0, 1,
-1.055143, 3.066241, 0.5356506, 1, 0.9254902, 0, 1,
-1.048568, -0.9579032, -2.027666, 1, 0.9294118, 0, 1,
-1.046148, -0.3622689, -1.687997, 1, 0.9372549, 0, 1,
-1.044869, 1.056547, -0.4962828, 1, 0.9411765, 0, 1,
-1.039355, 1.530859, 1.676019, 1, 0.9490196, 0, 1,
-1.032743, 1.589171, 0.1868926, 1, 0.9529412, 0, 1,
-1.015422, 0.4904622, -1.410513, 1, 0.9607843, 0, 1,
-1.013175, 1.605309, -0.4206859, 1, 0.9647059, 0, 1,
-1.013116, -0.6914884, -0.2514582, 1, 0.972549, 0, 1,
-1.012155, -0.3628223, -2.534028, 1, 0.9764706, 0, 1,
-1.004445, -0.2107289, -0.3331921, 1, 0.9843137, 0, 1,
-0.9935798, 2.58027, -0.5182694, 1, 0.9882353, 0, 1,
-0.9929815, 0.4303594, -1.162057, 1, 0.9960784, 0, 1,
-0.9921008, 0.3264777, -2.342757, 0.9960784, 1, 0, 1,
-0.9881583, 0.337418, -2.336803, 0.9921569, 1, 0, 1,
-0.9826167, -1.442843, -2.252499, 0.9843137, 1, 0, 1,
-0.9771582, 0.01631096, -1.299843, 0.9803922, 1, 0, 1,
-0.9484825, -1.423167, -1.878386, 0.972549, 1, 0, 1,
-0.9483639, -0.8187273, -0.8068611, 0.9686275, 1, 0, 1,
-0.9479738, -1.790653, -3.145644, 0.9607843, 1, 0, 1,
-0.9430237, -1.022935, -2.314423, 0.9568627, 1, 0, 1,
-0.942215, 0.3160177, -2.08144, 0.9490196, 1, 0, 1,
-0.9413335, -0.1787099, -0.6681319, 0.945098, 1, 0, 1,
-0.9402969, -0.2241934, -0.3136883, 0.9372549, 1, 0, 1,
-0.9376271, -0.8403689, -2.471555, 0.9333333, 1, 0, 1,
-0.9374667, 0.2871225, -0.8280584, 0.9254902, 1, 0, 1,
-0.9337356, 0.8483843, -2.446814, 0.9215686, 1, 0, 1,
-0.9334526, 0.2200975, -3.096022, 0.9137255, 1, 0, 1,
-0.9301125, 0.4486572, -1.046558, 0.9098039, 1, 0, 1,
-0.9300172, -0.5514906, -1.805224, 0.9019608, 1, 0, 1,
-0.9299245, 0.4039528, -1.313275, 0.8941177, 1, 0, 1,
-0.9197378, -0.003843212, -1.543668, 0.8901961, 1, 0, 1,
-0.9181024, -1.457587, -4.554236, 0.8823529, 1, 0, 1,
-0.9179391, 0.07294457, -0.6538336, 0.8784314, 1, 0, 1,
-0.9148858, 0.3939213, -0.2047788, 0.8705882, 1, 0, 1,
-0.9120584, 0.1989846, -1.902354, 0.8666667, 1, 0, 1,
-0.9116008, 0.08408263, -1.126054, 0.8588235, 1, 0, 1,
-0.9085807, 1.299775, -2.477677, 0.854902, 1, 0, 1,
-0.9083365, 0.345585, -0.3267891, 0.8470588, 1, 0, 1,
-0.9072295, 0.9220711, -0.4744816, 0.8431373, 1, 0, 1,
-0.9012379, 1.767535, 0.718834, 0.8352941, 1, 0, 1,
-0.9000111, -0.4915626, -2.279359, 0.8313726, 1, 0, 1,
-0.8979962, -1.477524, -3.775581, 0.8235294, 1, 0, 1,
-0.894228, -0.4120218, -1.676128, 0.8196079, 1, 0, 1,
-0.8934116, -0.4863738, -1.199586, 0.8117647, 1, 0, 1,
-0.8916991, 0.208287, -0.7432871, 0.8078431, 1, 0, 1,
-0.8862566, 0.7473028, 0.7267237, 0.8, 1, 0, 1,
-0.8859485, 0.6256137, -0.9986495, 0.7921569, 1, 0, 1,
-0.8763317, 1.185908, -3.084859, 0.7882353, 1, 0, 1,
-0.8751141, -1.434296, -3.005162, 0.7803922, 1, 0, 1,
-0.8750854, 2.196815, -0.7712828, 0.7764706, 1, 0, 1,
-0.8709554, -0.6003259, -3.802379, 0.7686275, 1, 0, 1,
-0.8702855, 0.9431857, -0.7185288, 0.7647059, 1, 0, 1,
-0.8701074, 0.2503374, -1.096383, 0.7568628, 1, 0, 1,
-0.8685166, 0.4638924, 0.2211464, 0.7529412, 1, 0, 1,
-0.8653906, 0.9219544, -1.960343, 0.7450981, 1, 0, 1,
-0.8625518, 0.3455583, -0.05174778, 0.7411765, 1, 0, 1,
-0.8619418, 0.7598099, -0.765588, 0.7333333, 1, 0, 1,
-0.8610384, 1.002008, 0.223594, 0.7294118, 1, 0, 1,
-0.8568738, -0.5609655, -3.349122, 0.7215686, 1, 0, 1,
-0.8464667, 0.9064831, 0.3881696, 0.7176471, 1, 0, 1,
-0.8453178, 0.430123, -2.062563, 0.7098039, 1, 0, 1,
-0.8439902, 1.24669, -0.4188458, 0.7058824, 1, 0, 1,
-0.8419209, -0.8968732, -1.559873, 0.6980392, 1, 0, 1,
-0.8379118, -1.987768, -2.592073, 0.6901961, 1, 0, 1,
-0.8366649, 0.1869483, -1.509986, 0.6862745, 1, 0, 1,
-0.8329233, 0.205305, -3.236811, 0.6784314, 1, 0, 1,
-0.8314046, 0.9854435, -0.1665569, 0.6745098, 1, 0, 1,
-0.8311567, -0.4791608, -0.7627638, 0.6666667, 1, 0, 1,
-0.8279471, 1.455233, -0.9170446, 0.6627451, 1, 0, 1,
-0.8196982, 1.563229, 0.003663235, 0.654902, 1, 0, 1,
-0.8175799, 1.706834, 0.2175252, 0.6509804, 1, 0, 1,
-0.8158677, 0.75098, -0.6885658, 0.6431373, 1, 0, 1,
-0.8151523, 0.5861779, -1.450774, 0.6392157, 1, 0, 1,
-0.8096943, 0.8679855, -0.6970489, 0.6313726, 1, 0, 1,
-0.8091527, 2.385254, -0.1253316, 0.627451, 1, 0, 1,
-0.8086238, 1.025819, -1.38356, 0.6196079, 1, 0, 1,
-0.8080177, -0.1400781, -2.062422, 0.6156863, 1, 0, 1,
-0.8077177, -2.726881, -1.363512, 0.6078432, 1, 0, 1,
-0.8014035, -0.6309747, -1.742017, 0.6039216, 1, 0, 1,
-0.7994436, 0.394621, -1.372558, 0.5960785, 1, 0, 1,
-0.792693, -0.5040694, -0.9296088, 0.5882353, 1, 0, 1,
-0.7877647, -1.756857, -4.0173, 0.5843138, 1, 0, 1,
-0.7865855, -1.437155, -3.242051, 0.5764706, 1, 0, 1,
-0.785603, 1.90766, -1.983816, 0.572549, 1, 0, 1,
-0.7842034, -0.4572963, -3.174668, 0.5647059, 1, 0, 1,
-0.7838951, 0.1824206, -0.9686903, 0.5607843, 1, 0, 1,
-0.7838562, -0.1046235, -2.570316, 0.5529412, 1, 0, 1,
-0.7753671, 0.6795612, 0.2399197, 0.5490196, 1, 0, 1,
-0.7745122, 0.1674458, -2.135174, 0.5411765, 1, 0, 1,
-0.7727634, 0.6871342, -0.9133195, 0.5372549, 1, 0, 1,
-0.7675357, -1.112485, -4.118892, 0.5294118, 1, 0, 1,
-0.7630022, 0.4025731, -1.318589, 0.5254902, 1, 0, 1,
-0.7614244, 0.4194632, 0.221089, 0.5176471, 1, 0, 1,
-0.7605144, 0.3967429, -1.209846, 0.5137255, 1, 0, 1,
-0.7547509, -0.439848, -3.507879, 0.5058824, 1, 0, 1,
-0.7539184, -1.376558, -1.442669, 0.5019608, 1, 0, 1,
-0.7521569, 0.7993431, -2.708177, 0.4941176, 1, 0, 1,
-0.744705, -2.462482, -3.06318, 0.4862745, 1, 0, 1,
-0.7434183, -1.376346, -1.264708, 0.4823529, 1, 0, 1,
-0.7366153, -1.156112, -2.795436, 0.4745098, 1, 0, 1,
-0.7332627, 0.7003145, -0.7213618, 0.4705882, 1, 0, 1,
-0.7326455, -0.1108667, -0.9496439, 0.4627451, 1, 0, 1,
-0.7325916, -0.07074358, -1.641493, 0.4588235, 1, 0, 1,
-0.7232633, -0.7063251, -2.451342, 0.4509804, 1, 0, 1,
-0.7212669, 1.414967, -1.106827, 0.4470588, 1, 0, 1,
-0.7185894, -0.1858955, -0.894414, 0.4392157, 1, 0, 1,
-0.7179304, 0.5061538, -0.07518215, 0.4352941, 1, 0, 1,
-0.7167208, -0.5459214, -1.304206, 0.427451, 1, 0, 1,
-0.7154257, 0.7498789, -1.885923, 0.4235294, 1, 0, 1,
-0.7096829, -0.2079948, -0.1770878, 0.4156863, 1, 0, 1,
-0.7073393, -1.103519, -3.059811, 0.4117647, 1, 0, 1,
-0.6960164, -1.082847, -2.797991, 0.4039216, 1, 0, 1,
-0.693065, 1.996422, -0.6427876, 0.3960784, 1, 0, 1,
-0.6923187, 0.8892707, 0.4997891, 0.3921569, 1, 0, 1,
-0.6903937, -1.159661, -2.902792, 0.3843137, 1, 0, 1,
-0.6879176, 1.160044, -0.4457604, 0.3803922, 1, 0, 1,
-0.6794433, -0.424083, 0.7273642, 0.372549, 1, 0, 1,
-0.677123, 0.9088023, -0.6947009, 0.3686275, 1, 0, 1,
-0.6758055, -0.7445785, -0.634295, 0.3607843, 1, 0, 1,
-0.6742235, 1.231155, -1.325814, 0.3568628, 1, 0, 1,
-0.6736948, -0.9813814, -0.7223876, 0.3490196, 1, 0, 1,
-0.6725528, 0.09634019, -1.602709, 0.345098, 1, 0, 1,
-0.6697845, -1.009754, -3.13455, 0.3372549, 1, 0, 1,
-0.669448, -0.4281163, -2.181741, 0.3333333, 1, 0, 1,
-0.6688716, 1.045046, -0.6773247, 0.3254902, 1, 0, 1,
-0.6683031, 1.203954, -1.04269, 0.3215686, 1, 0, 1,
-0.6670819, 0.4408081, -2.278454, 0.3137255, 1, 0, 1,
-0.6567414, 1.319316, -0.5733045, 0.3098039, 1, 0, 1,
-0.655463, -1.275616, -4.440753, 0.3019608, 1, 0, 1,
-0.649998, -1.109168, -2.88022, 0.2941177, 1, 0, 1,
-0.6422782, 1.075358, -1.410118, 0.2901961, 1, 0, 1,
-0.6376816, 1.66407, 1.766404, 0.282353, 1, 0, 1,
-0.6311879, 0.8117248, -0.4692406, 0.2784314, 1, 0, 1,
-0.6281247, 1.767616, 0.5793254, 0.2705882, 1, 0, 1,
-0.6234982, 0.754234, -1.638884, 0.2666667, 1, 0, 1,
-0.6199864, -0.1406724, -1.982493, 0.2588235, 1, 0, 1,
-0.6137955, -0.7766333, -2.039216, 0.254902, 1, 0, 1,
-0.5993915, 0.9549983, -1.22712, 0.2470588, 1, 0, 1,
-0.5887888, -0.01843139, -2.923413, 0.2431373, 1, 0, 1,
-0.5886313, 0.7574599, 1.07301, 0.2352941, 1, 0, 1,
-0.5857986, 1.719443, -1.605059, 0.2313726, 1, 0, 1,
-0.5834957, -0.05529294, -1.103224, 0.2235294, 1, 0, 1,
-0.581134, 0.2822057, 0.07817706, 0.2196078, 1, 0, 1,
-0.5764143, -0.4060936, -2.654692, 0.2117647, 1, 0, 1,
-0.5746899, 0.4717505, -0.8213082, 0.2078431, 1, 0, 1,
-0.5712149, -0.2989552, -2.410721, 0.2, 1, 0, 1,
-0.5706555, 0.7432073, -0.5566456, 0.1921569, 1, 0, 1,
-0.5671388, 1.137981, -1.655653, 0.1882353, 1, 0, 1,
-0.5669024, -0.1851449, -1.792281, 0.1803922, 1, 0, 1,
-0.5641047, 0.3125187, -1.698138, 0.1764706, 1, 0, 1,
-0.562173, -0.8843213, -2.10216, 0.1686275, 1, 0, 1,
-0.5616959, -0.9193033, -1.948694, 0.1647059, 1, 0, 1,
-0.5564556, 0.8389818, -0.4949864, 0.1568628, 1, 0, 1,
-0.5562375, -0.1856996, -2.05145, 0.1529412, 1, 0, 1,
-0.5524082, -1.086738, -1.792874, 0.145098, 1, 0, 1,
-0.5409181, 0.6985736, -0.8474979, 0.1411765, 1, 0, 1,
-0.538043, -0.6241015, -1.620491, 0.1333333, 1, 0, 1,
-0.537376, -0.3227493, -1.917147, 0.1294118, 1, 0, 1,
-0.5368686, 0.2438244, -1.328771, 0.1215686, 1, 0, 1,
-0.5364301, 0.1115994, -1.747941, 0.1176471, 1, 0, 1,
-0.531363, -0.438951, -2.441066, 0.1098039, 1, 0, 1,
-0.5287108, 1.088778, -1.543613, 0.1058824, 1, 0, 1,
-0.5282272, 0.3291757, -0.1357716, 0.09803922, 1, 0, 1,
-0.5228413, -0.7807051, -3.183649, 0.09019608, 1, 0, 1,
-0.519142, -1.311014, -3.718063, 0.08627451, 1, 0, 1,
-0.5182224, 0.07719819, -0.9347028, 0.07843138, 1, 0, 1,
-0.5167338, 0.5976461, 0.9676621, 0.07450981, 1, 0, 1,
-0.516061, -0.5283671, -2.243367, 0.06666667, 1, 0, 1,
-0.5133274, -0.2413754, -2.186243, 0.0627451, 1, 0, 1,
-0.5120427, 0.1529158, -1.21643, 0.05490196, 1, 0, 1,
-0.506647, -2.114798, -1.860811, 0.05098039, 1, 0, 1,
-0.5060098, 0.6866729, 0.1423825, 0.04313726, 1, 0, 1,
-0.5039631, -0.3320757, -1.51779, 0.03921569, 1, 0, 1,
-0.5030388, 0.8921669, -0.04474046, 0.03137255, 1, 0, 1,
-0.5007867, 0.1929742, -0.6388602, 0.02745098, 1, 0, 1,
-0.492351, -0.7900699, -2.580301, 0.01960784, 1, 0, 1,
-0.4915306, 0.2402514, -1.953813, 0.01568628, 1, 0, 1,
-0.4893862, -1.535547, -2.462009, 0.007843138, 1, 0, 1,
-0.4891556, -1.618019, -2.467699, 0.003921569, 1, 0, 1,
-0.4860197, 0.5100442, -0.2843547, 0, 1, 0.003921569, 1,
-0.4836411, -0.7390642, -1.434435, 0, 1, 0.01176471, 1,
-0.4829444, -0.168279, -0.6933828, 0, 1, 0.01568628, 1,
-0.4825891, 1.102091, 0.06914023, 0, 1, 0.02352941, 1,
-0.4797015, -0.2048632, -1.218176, 0, 1, 0.02745098, 1,
-0.4779213, -0.9279296, -2.568567, 0, 1, 0.03529412, 1,
-0.4772952, -0.4176887, -2.674453, 0, 1, 0.03921569, 1,
-0.475614, -0.2985626, -2.218817, 0, 1, 0.04705882, 1,
-0.4747377, -0.4546867, -2.242826, 0, 1, 0.05098039, 1,
-0.4698886, 2.130254, -1.842633, 0, 1, 0.05882353, 1,
-0.4698113, -0.9285845, -2.644254, 0, 1, 0.0627451, 1,
-0.4697733, -0.1195152, -1.092619, 0, 1, 0.07058824, 1,
-0.4692329, 1.311656, 0.07985324, 0, 1, 0.07450981, 1,
-0.4663898, -0.4175782, -1.878161, 0, 1, 0.08235294, 1,
-0.4644165, 0.1863124, -2.223727, 0, 1, 0.08627451, 1,
-0.4599315, 0.2869984, -1.238209, 0, 1, 0.09411765, 1,
-0.4594792, 1.731214, 0.3329048, 0, 1, 0.1019608, 1,
-0.4544656, 0.4186392, -1.771038, 0, 1, 0.1058824, 1,
-0.4535276, -1.386495, -3.304422, 0, 1, 0.1137255, 1,
-0.4468963, -0.7046283, -1.758267, 0, 1, 0.1176471, 1,
-0.4436383, 1.05056, -1.885757, 0, 1, 0.1254902, 1,
-0.4396568, 1.482427, -0.4639703, 0, 1, 0.1294118, 1,
-0.438742, 0.5014794, -0.9454175, 0, 1, 0.1372549, 1,
-0.4362118, -2.768573, -2.127628, 0, 1, 0.1411765, 1,
-0.4360772, -2.589044, -3.008972, 0, 1, 0.1490196, 1,
-0.4346115, 0.05540893, -2.238995, 0, 1, 0.1529412, 1,
-0.4335464, -0.7406396, -1.893118, 0, 1, 0.1607843, 1,
-0.4305026, -1.742706, -2.164931, 0, 1, 0.1647059, 1,
-0.4288395, -1.247931, -2.341047, 0, 1, 0.172549, 1,
-0.4275658, 0.405629, -1.550656, 0, 1, 0.1764706, 1,
-0.4254666, -0.8412947, -2.733816, 0, 1, 0.1843137, 1,
-0.4222168, 0.4969522, -1.156685, 0, 1, 0.1882353, 1,
-0.4212063, -1.069687, -2.852734, 0, 1, 0.1960784, 1,
-0.4210641, 1.517015, 0.5594715, 0, 1, 0.2039216, 1,
-0.4181432, 1.228188, -0.09127255, 0, 1, 0.2078431, 1,
-0.4162617, -0.09886891, -2.213881, 0, 1, 0.2156863, 1,
-0.4115508, 0.5481765, -4.145365, 0, 1, 0.2196078, 1,
-0.4096576, 2.188162, -0.3334744, 0, 1, 0.227451, 1,
-0.4083369, -0.527918, -1.623695, 0, 1, 0.2313726, 1,
-0.3992113, 0.6225395, -2.11041, 0, 1, 0.2392157, 1,
-0.3948722, 0.6332533, -3.078984, 0, 1, 0.2431373, 1,
-0.394803, 0.04354734, -0.8893685, 0, 1, 0.2509804, 1,
-0.3930278, 0.7285772, -1.112449, 0, 1, 0.254902, 1,
-0.390871, 1.201063, -0.2041308, 0, 1, 0.2627451, 1,
-0.3902279, -0.4663865, -2.666474, 0, 1, 0.2666667, 1,
-0.3885739, 2.213115, -0.1364786, 0, 1, 0.2745098, 1,
-0.387258, 0.08721137, -2.021515, 0, 1, 0.2784314, 1,
-0.3822291, -0.08853341, -2.153142, 0, 1, 0.2862745, 1,
-0.3813861, 0.3022355, -1.024804, 0, 1, 0.2901961, 1,
-0.3780865, -0.4682186, -3.665823, 0, 1, 0.2980392, 1,
-0.3730685, -1.419521, -3.700151, 0, 1, 0.3058824, 1,
-0.3717935, -0.2220655, -2.491138, 0, 1, 0.3098039, 1,
-0.3711532, 1.249861, 0.2365523, 0, 1, 0.3176471, 1,
-0.3670966, -0.6409398, -3.703756, 0, 1, 0.3215686, 1,
-0.3666295, 0.5992934, -0.0990391, 0, 1, 0.3294118, 1,
-0.3558581, 0.7699833, -0.1263263, 0, 1, 0.3333333, 1,
-0.350103, -1.752263, -3.528676, 0, 1, 0.3411765, 1,
-0.3454813, 0.9336407, -0.9325436, 0, 1, 0.345098, 1,
-0.3447835, -0.9118584, -3.322738, 0, 1, 0.3529412, 1,
-0.3322254, -0.876865, -2.829953, 0, 1, 0.3568628, 1,
-0.331811, 0.8261352, 0.06987575, 0, 1, 0.3647059, 1,
-0.3316227, 0.2514656, -1.086035, 0, 1, 0.3686275, 1,
-0.3249483, 0.3565872, -1.971919, 0, 1, 0.3764706, 1,
-0.3221229, -1.340884, -1.968189, 0, 1, 0.3803922, 1,
-0.3214948, 0.2973358, -2.412871, 0, 1, 0.3882353, 1,
-0.3143498, 1.76742, 0.7136748, 0, 1, 0.3921569, 1,
-0.3126678, -0.07497378, -0.5185426, 0, 1, 0.4, 1,
-0.3099216, 0.2254109, 0.1171016, 0, 1, 0.4078431, 1,
-0.3084151, -0.3733633, -3.777457, 0, 1, 0.4117647, 1,
-0.3058871, 0.8930993, -1.314457, 0, 1, 0.4196078, 1,
-0.3018287, 1.188599, 0.1652967, 0, 1, 0.4235294, 1,
-0.3017349, 1.549842, -0.136381, 0, 1, 0.4313726, 1,
-0.2944012, -0.2071747, -1.073231, 0, 1, 0.4352941, 1,
-0.2928486, 2.715355, 1.886786, 0, 1, 0.4431373, 1,
-0.2891614, 0.4706778, -1.018044, 0, 1, 0.4470588, 1,
-0.2835892, 0.7135715, -0.420197, 0, 1, 0.454902, 1,
-0.283174, 0.5442657, 0.4455706, 0, 1, 0.4588235, 1,
-0.2824249, -0.2331716, -3.155874, 0, 1, 0.4666667, 1,
-0.2788132, 0.05961199, -1.663335, 0, 1, 0.4705882, 1,
-0.2767985, -0.1821155, -1.039495, 0, 1, 0.4784314, 1,
-0.2685779, -0.7666394, -2.862644, 0, 1, 0.4823529, 1,
-0.2668575, -0.3208612, -3.766019, 0, 1, 0.4901961, 1,
-0.2640598, -1.005815, -1.920418, 0, 1, 0.4941176, 1,
-0.2633657, -1.269086, -1.520276, 0, 1, 0.5019608, 1,
-0.2615354, 0.5428239, 0.7677464, 0, 1, 0.509804, 1,
-0.2591035, 1.308991, 0.7942834, 0, 1, 0.5137255, 1,
-0.2543511, -1.582294, -2.749643, 0, 1, 0.5215687, 1,
-0.2542368, -0.5078478, -4.562548, 0, 1, 0.5254902, 1,
-0.2405682, 0.253299, -0.3215754, 0, 1, 0.5333334, 1,
-0.23645, -1.205969, -3.311334, 0, 1, 0.5372549, 1,
-0.2346621, -1.176431, -2.495402, 0, 1, 0.5450981, 1,
-0.231134, -0.417775, -2.290889, 0, 1, 0.5490196, 1,
-0.2201186, 0.3076239, 0.2645701, 0, 1, 0.5568628, 1,
-0.215382, -0.1004372, -0.347186, 0, 1, 0.5607843, 1,
-0.2139395, -0.6655298, -3.544017, 0, 1, 0.5686275, 1,
-0.2114131, -0.2366015, -5.735776, 0, 1, 0.572549, 1,
-0.2096072, -0.4526125, -2.88623, 0, 1, 0.5803922, 1,
-0.1982401, -0.2594722, -2.327694, 0, 1, 0.5843138, 1,
-0.1979378, -0.2222172, -1.505093, 0, 1, 0.5921569, 1,
-0.1954707, 0.2544434, -0.9659677, 0, 1, 0.5960785, 1,
-0.190326, 0.3316829, 0.361652, 0, 1, 0.6039216, 1,
-0.189674, 0.9161208, -0.4937458, 0, 1, 0.6117647, 1,
-0.1833123, -0.1721538, -1.089499, 0, 1, 0.6156863, 1,
-0.1825543, 0.4032823, 0.2535559, 0, 1, 0.6235294, 1,
-0.1819865, -1.319677, -3.450288, 0, 1, 0.627451, 1,
-0.1775571, -0.8645388, -2.321276, 0, 1, 0.6352941, 1,
-0.1771335, 0.7338185, -1.536889, 0, 1, 0.6392157, 1,
-0.1770945, -1.107395, -2.810797, 0, 1, 0.6470588, 1,
-0.1770846, 0.01098697, 0.5130937, 0, 1, 0.6509804, 1,
-0.1769761, 2.600227, 0.4951282, 0, 1, 0.6588235, 1,
-0.1734284, 1.708249, -1.444423, 0, 1, 0.6627451, 1,
-0.1619216, -0.4715533, -3.829806, 0, 1, 0.6705883, 1,
-0.1566216, 0.3053187, -2.762524, 0, 1, 0.6745098, 1,
-0.1525923, -0.01139327, -1.036231, 0, 1, 0.682353, 1,
-0.1476438, 2.133082, 0.5493469, 0, 1, 0.6862745, 1,
-0.1377984, -0.6774168, -3.467584, 0, 1, 0.6941177, 1,
-0.1366323, 0.3798309, 0.7220427, 0, 1, 0.7019608, 1,
-0.1344283, 0.04592057, -1.306412, 0, 1, 0.7058824, 1,
-0.1306082, -0.06945107, -2.769171, 0, 1, 0.7137255, 1,
-0.1265591, -0.7637549, -3.492637, 0, 1, 0.7176471, 1,
-0.1228087, 0.5893939, -0.2097007, 0, 1, 0.7254902, 1,
-0.120911, 1.469212, 0.3406449, 0, 1, 0.7294118, 1,
-0.1207475, 1.070811, -0.5740842, 0, 1, 0.7372549, 1,
-0.1141092, 2.081169, -0.3969918, 0, 1, 0.7411765, 1,
-0.1094823, -0.08075107, -4.17649, 0, 1, 0.7490196, 1,
-0.1041525, 0.5963789, -0.6508484, 0, 1, 0.7529412, 1,
-0.1033176, -1.377497, -2.797759, 0, 1, 0.7607843, 1,
-0.1031816, -0.03227848, -0.8852226, 0, 1, 0.7647059, 1,
-0.08562918, -0.9412508, -3.484656, 0, 1, 0.772549, 1,
-0.08369936, 0.3413525, 0.3159358, 0, 1, 0.7764706, 1,
-0.08047727, 0.6755055, 1.405685, 0, 1, 0.7843137, 1,
-0.07975728, 0.2570564, 0.5646335, 0, 1, 0.7882353, 1,
-0.07813702, 0.655809, 1.83147, 0, 1, 0.7960784, 1,
-0.07682437, 0.4382271, -1.426826, 0, 1, 0.8039216, 1,
-0.07480302, 0.2749335, -0.2449609, 0, 1, 0.8078431, 1,
-0.07343631, -1.26732, -0.5961211, 0, 1, 0.8156863, 1,
-0.07112134, 0.4904199, -0.8738757, 0, 1, 0.8196079, 1,
-0.07081015, 0.8900921, -0.1323818, 0, 1, 0.827451, 1,
-0.06963136, 0.7393448, -1.36079, 0, 1, 0.8313726, 1,
-0.06890211, 1.218783, -0.4405523, 0, 1, 0.8392157, 1,
-0.06318709, -1.456902, -4.124903, 0, 1, 0.8431373, 1,
-0.0625352, -0.1762953, -4.127227, 0, 1, 0.8509804, 1,
-0.06119016, -1.711223, -4.053397, 0, 1, 0.854902, 1,
-0.05736548, -0.03604533, -1.741679, 0, 1, 0.8627451, 1,
-0.0571637, 0.8651949, -1.667501, 0, 1, 0.8666667, 1,
-0.05566414, 1.053951, 0.1969799, 0, 1, 0.8745098, 1,
-0.05405338, 1.661479, 1.604723, 0, 1, 0.8784314, 1,
-0.05155033, 0.2929291, 0.03286839, 0, 1, 0.8862745, 1,
-0.0465142, 0.6207467, -1.121508, 0, 1, 0.8901961, 1,
-0.04344127, -0.5310874, -3.019319, 0, 1, 0.8980392, 1,
-0.04257189, -0.3833715, -2.717255, 0, 1, 0.9058824, 1,
-0.04167598, 1.022373, -0.2812461, 0, 1, 0.9098039, 1,
-0.04161377, -1.222817, -3.354349, 0, 1, 0.9176471, 1,
-0.04008561, 0.2328896, 0.208592, 0, 1, 0.9215686, 1,
-0.03381783, 0.2809791, -0.610482, 0, 1, 0.9294118, 1,
-0.02934237, -0.9145645, -3.319765, 0, 1, 0.9333333, 1,
-0.02329825, 0.5711724, -3.013754, 0, 1, 0.9411765, 1,
-0.01847945, 0.5702251, 0.9950129, 0, 1, 0.945098, 1,
-0.01545381, 0.3503874, 0.5211125, 0, 1, 0.9529412, 1,
-0.01095753, -0.4388038, -2.938623, 0, 1, 0.9568627, 1,
-0.01025778, -0.02927837, -1.991346, 0, 1, 0.9647059, 1,
-0.01003868, 1.735317, 0.2782309, 0, 1, 0.9686275, 1,
-0.009889217, -0.07131246, -2.716751, 0, 1, 0.9764706, 1,
-0.009374351, -0.9029743, -3.339626, 0, 1, 0.9803922, 1,
-0.002138744, 0.7088338, 1.544283, 0, 1, 0.9882353, 1,
0.006579485, -0.3845601, 2.32476, 0, 1, 0.9921569, 1,
0.01058423, 0.4604197, -0.6407285, 0, 1, 1, 1,
0.01315729, 1.326005, 1.215439, 0, 0.9921569, 1, 1,
0.01497355, -1.18785, 0.4546712, 0, 0.9882353, 1, 1,
0.01534916, -0.1710136, 2.156635, 0, 0.9803922, 1, 1,
0.01935112, 0.8857657, -0.3893102, 0, 0.9764706, 1, 1,
0.02176769, -0.3581523, 2.279526, 0, 0.9686275, 1, 1,
0.02297387, 1.79199, -1.156771, 0, 0.9647059, 1, 1,
0.02322869, 1.070133, -0.6031424, 0, 0.9568627, 1, 1,
0.02370609, 0.8123297, -1.423184, 0, 0.9529412, 1, 1,
0.02403591, -1.744073, 2.067989, 0, 0.945098, 1, 1,
0.02617944, 1.206866, 1.452425, 0, 0.9411765, 1, 1,
0.02836564, 0.1360587, 0.812381, 0, 0.9333333, 1, 1,
0.0293423, -0.6180358, 3.528564, 0, 0.9294118, 1, 1,
0.03148189, -0.983245, 5.58726, 0, 0.9215686, 1, 1,
0.03671027, 1.121882, 0.6056769, 0, 0.9176471, 1, 1,
0.04151518, 1.159656, -0.5911819, 0, 0.9098039, 1, 1,
0.04176638, 0.2173989, 1.035797, 0, 0.9058824, 1, 1,
0.04476983, 0.5655301, -0.340308, 0, 0.8980392, 1, 1,
0.05615318, 2.082566, 2.194803, 0, 0.8901961, 1, 1,
0.05645997, -1.69763, 3.345134, 0, 0.8862745, 1, 1,
0.05781138, -0.1002507, 2.211917, 0, 0.8784314, 1, 1,
0.05872174, -0.4716328, 3.03525, 0, 0.8745098, 1, 1,
0.06628025, 0.5125946, -0.7087123, 0, 0.8666667, 1, 1,
0.06713204, -2.194219, 3.352209, 0, 0.8627451, 1, 1,
0.06963144, 0.9650083, 0.05269052, 0, 0.854902, 1, 1,
0.07042617, 0.06708395, 0.9487254, 0, 0.8509804, 1, 1,
0.07120006, 1.679072, 1.34317, 0, 0.8431373, 1, 1,
0.07315713, -0.03574309, 0.5889132, 0, 0.8392157, 1, 1,
0.07522532, 0.3986638, -0.9580609, 0, 0.8313726, 1, 1,
0.07576353, -2.285303, 2.841722, 0, 0.827451, 1, 1,
0.07896077, -0.1026767, 3.045259, 0, 0.8196079, 1, 1,
0.08066317, 0.01533073, 0.6087191, 0, 0.8156863, 1, 1,
0.08251656, -0.7138764, 4.043488, 0, 0.8078431, 1, 1,
0.08601438, -1.50458, 3.382147, 0, 0.8039216, 1, 1,
0.08742887, -0.9516004, 4.181839, 0, 0.7960784, 1, 1,
0.09047763, -0.5346789, 1.228031, 0, 0.7882353, 1, 1,
0.0923363, 0.7962158, 1.00339, 0, 0.7843137, 1, 1,
0.09477353, 0.3000602, 0.3180597, 0, 0.7764706, 1, 1,
0.09498698, 0.8770128, 1.299995, 0, 0.772549, 1, 1,
0.09648946, 0.8573888, 0.8577224, 0, 0.7647059, 1, 1,
0.0967382, 1.118332, 0.3889396, 0, 0.7607843, 1, 1,
0.1010102, -0.5461575, 2.702121, 0, 0.7529412, 1, 1,
0.1092602, 1.452076, 1.003454, 0, 0.7490196, 1, 1,
0.1112309, -0.09990143, 2.423505, 0, 0.7411765, 1, 1,
0.1122806, 0.1627298, -0.5281687, 0, 0.7372549, 1, 1,
0.1143097, -1.413661, 3.302525, 0, 0.7294118, 1, 1,
0.1171173, -0.03810918, 2.071392, 0, 0.7254902, 1, 1,
0.1171757, 0.05434584, -0.07907835, 0, 0.7176471, 1, 1,
0.1204342, 0.4668563, -0.2616467, 0, 0.7137255, 1, 1,
0.1253556, -0.1926776, 2.215255, 0, 0.7058824, 1, 1,
0.1278653, 0.525551, -0.377389, 0, 0.6980392, 1, 1,
0.1323814, 0.4923203, -0.6130417, 0, 0.6941177, 1, 1,
0.1332268, 1.481301, -1.795924, 0, 0.6862745, 1, 1,
0.1333001, -1.481232, 2.400876, 0, 0.682353, 1, 1,
0.1336164, -0.9963382, 3.190221, 0, 0.6745098, 1, 1,
0.1394169, -0.2902055, 4.293087, 0, 0.6705883, 1, 1,
0.1395329, -0.3179528, 2.881427, 0, 0.6627451, 1, 1,
0.1432726, 0.2819083, 1.803452, 0, 0.6588235, 1, 1,
0.1470104, 1.691427, 0.1097068, 0, 0.6509804, 1, 1,
0.1477321, -1.905882, 2.399781, 0, 0.6470588, 1, 1,
0.1513567, 0.5963157, -0.7444319, 0, 0.6392157, 1, 1,
0.1513745, -0.05381513, 2.510276, 0, 0.6352941, 1, 1,
0.1533996, -0.7734033, 1.842452, 0, 0.627451, 1, 1,
0.1549775, -0.1384856, 1.806237, 0, 0.6235294, 1, 1,
0.1576013, -1.34291, 2.146217, 0, 0.6156863, 1, 1,
0.1587791, 1.095843, -1.640525, 0, 0.6117647, 1, 1,
0.1737152, -1.892594, 4.586707, 0, 0.6039216, 1, 1,
0.174495, 1.91259, -1.177216, 0, 0.5960785, 1, 1,
0.1770574, 0.1480355, 1.901378, 0, 0.5921569, 1, 1,
0.1776398, -0.4923311, 2.533887, 0, 0.5843138, 1, 1,
0.1840141, -0.01471849, 1.609982, 0, 0.5803922, 1, 1,
0.184153, -0.5666276, 2.98891, 0, 0.572549, 1, 1,
0.1853193, 0.003581873, 0.1398775, 0, 0.5686275, 1, 1,
0.187432, -0.3294759, 3.768468, 0, 0.5607843, 1, 1,
0.187456, 0.8646739, 0.003160528, 0, 0.5568628, 1, 1,
0.1931267, 0.9975774, 0.7346947, 0, 0.5490196, 1, 1,
0.1942778, 0.4370818, 0.7505685, 0, 0.5450981, 1, 1,
0.1945603, 2.589897, 0.8754492, 0, 0.5372549, 1, 1,
0.1993676, -1.064522, 4.266313, 0, 0.5333334, 1, 1,
0.1995526, 1.617009, 1.542378, 0, 0.5254902, 1, 1,
0.2012151, -0.2759684, 3.114499, 0, 0.5215687, 1, 1,
0.2033247, 0.2161521, 1.047245, 0, 0.5137255, 1, 1,
0.2042888, 0.7306154, 2.000923, 0, 0.509804, 1, 1,
0.205028, 0.1568939, 2.522469, 0, 0.5019608, 1, 1,
0.2055994, 0.4981181, -0.5201356, 0, 0.4941176, 1, 1,
0.2064091, -1.659167, 2.730359, 0, 0.4901961, 1, 1,
0.2099531, 0.5291322, -0.2786618, 0, 0.4823529, 1, 1,
0.2127073, -0.4737512, 2.016823, 0, 0.4784314, 1, 1,
0.2156725, 0.65969, -0.06809547, 0, 0.4705882, 1, 1,
0.2172295, -0.6244047, 3.222106, 0, 0.4666667, 1, 1,
0.2178576, -1.193112, 1.577182, 0, 0.4588235, 1, 1,
0.2197147, -0.4564587, 3.668074, 0, 0.454902, 1, 1,
0.2242961, -0.2207301, 1.46592, 0, 0.4470588, 1, 1,
0.2254989, -0.2863621, 2.784719, 0, 0.4431373, 1, 1,
0.2263254, 1.389914, -0.3580517, 0, 0.4352941, 1, 1,
0.228152, -1.509426, 4.163992, 0, 0.4313726, 1, 1,
0.2298183, 0.5868075, 1.794269, 0, 0.4235294, 1, 1,
0.2306812, 1.25043, -0.1142237, 0, 0.4196078, 1, 1,
0.231982, 0.336328, 2.169316, 0, 0.4117647, 1, 1,
0.2342196, 1.452822, 0.5168729, 0, 0.4078431, 1, 1,
0.2355976, 0.4344803, -0.96666, 0, 0.4, 1, 1,
0.2368244, -1.169688, 3.785155, 0, 0.3921569, 1, 1,
0.2381307, -0.5906543, 1.6881, 0, 0.3882353, 1, 1,
0.2402943, 0.9666092, 1.822559, 0, 0.3803922, 1, 1,
0.2423236, -0.8988003, 1.133503, 0, 0.3764706, 1, 1,
0.2439166, 0.1461573, 2.208784, 0, 0.3686275, 1, 1,
0.2475046, -0.1082202, 2.134627, 0, 0.3647059, 1, 1,
0.249195, -0.5478139, 2.526687, 0, 0.3568628, 1, 1,
0.2502626, 0.2650482, 1.075571, 0, 0.3529412, 1, 1,
0.2537258, -1.162656, 1.314568, 0, 0.345098, 1, 1,
0.2551872, 0.3883447, 0.08686775, 0, 0.3411765, 1, 1,
0.2558235, -0.5852259, 3.147132, 0, 0.3333333, 1, 1,
0.2560078, 0.7080145, 0.7522692, 0, 0.3294118, 1, 1,
0.2565036, -0.7424753, 3.621795, 0, 0.3215686, 1, 1,
0.2582261, -0.7143807, 1.316183, 0, 0.3176471, 1, 1,
0.260394, -0.791101, 3.168735, 0, 0.3098039, 1, 1,
0.2637741, 0.262092, 0.8143525, 0, 0.3058824, 1, 1,
0.2656997, -1.830417, 2.760806, 0, 0.2980392, 1, 1,
0.2657913, -0.8801781, 1.436742, 0, 0.2901961, 1, 1,
0.2696637, -0.5538951, 2.222799, 0, 0.2862745, 1, 1,
0.2745425, -1.626722, 2.969292, 0, 0.2784314, 1, 1,
0.2761951, 0.8239387, 1.489044, 0, 0.2745098, 1, 1,
0.2780786, -1.56488, 4.652961, 0, 0.2666667, 1, 1,
0.2800342, -1.146752, 2.591998, 0, 0.2627451, 1, 1,
0.2805962, 1.068493, 1.70909, 0, 0.254902, 1, 1,
0.282492, -0.5730828, 1.677391, 0, 0.2509804, 1, 1,
0.286072, 0.4331767, 1.734779, 0, 0.2431373, 1, 1,
0.2887405, -1.308393, 4.074809, 0, 0.2392157, 1, 1,
0.2901027, 1.631432, 0.6560959, 0, 0.2313726, 1, 1,
0.301609, -0.09646998, 2.482082, 0, 0.227451, 1, 1,
0.3051563, 1.017215, 0.1875251, 0, 0.2196078, 1, 1,
0.3200367, 1.08344, 0.240813, 0, 0.2156863, 1, 1,
0.3215802, 1.0531, 0.9020711, 0, 0.2078431, 1, 1,
0.3216368, 0.3203462, -0.5142331, 0, 0.2039216, 1, 1,
0.3284384, 0.6617968, 0.6614599, 0, 0.1960784, 1, 1,
0.3300207, 1.265418, 0.7213951, 0, 0.1882353, 1, 1,
0.3301319, 0.5997874, 1.614497, 0, 0.1843137, 1, 1,
0.3322592, -0.9977869, 2.854995, 0, 0.1764706, 1, 1,
0.3326264, -1.864068, 3.593369, 0, 0.172549, 1, 1,
0.3331707, -1.513444, 2.095313, 0, 0.1647059, 1, 1,
0.3394497, -0.4569673, 3.696797, 0, 0.1607843, 1, 1,
0.3506105, 0.9571574, 1.502124, 0, 0.1529412, 1, 1,
0.3506139, 0.2947428, 2.383212, 0, 0.1490196, 1, 1,
0.3506376, -0.5153587, 3.537588, 0, 0.1411765, 1, 1,
0.3520654, 0.9130049, -1.256996, 0, 0.1372549, 1, 1,
0.3539208, 0.7708666, -0.7306965, 0, 0.1294118, 1, 1,
0.3584497, 0.1008234, 2.768563, 0, 0.1254902, 1, 1,
0.3588079, 0.3579465, -0.09280833, 0, 0.1176471, 1, 1,
0.3607855, -1.837228, 1.611493, 0, 0.1137255, 1, 1,
0.3656022, 0.6209643, 0.508159, 0, 0.1058824, 1, 1,
0.3664886, 2.003531, -0.9551237, 0, 0.09803922, 1, 1,
0.370761, -1.826185, 3.322854, 0, 0.09411765, 1, 1,
0.3734388, -0.893686, 2.819471, 0, 0.08627451, 1, 1,
0.3741018, -1.008787, 3.647922, 0, 0.08235294, 1, 1,
0.3799208, -0.7856902, 3.027152, 0, 0.07450981, 1, 1,
0.3825349, -1.546781, 5.002943, 0, 0.07058824, 1, 1,
0.383878, 0.7313547, 0.04653231, 0, 0.0627451, 1, 1,
0.3840856, -0.4886735, 3.037375, 0, 0.05882353, 1, 1,
0.3850992, 0.05924527, 0.8730059, 0, 0.05098039, 1, 1,
0.3874765, 0.4294035, 1.009372, 0, 0.04705882, 1, 1,
0.391448, 0.9118774, 0.7120122, 0, 0.03921569, 1, 1,
0.3926569, 0.5551317, -0.1614837, 0, 0.03529412, 1, 1,
0.3935781, -1.457397, 1.984883, 0, 0.02745098, 1, 1,
0.3978458, -1.868627, 4.691567, 0, 0.02352941, 1, 1,
0.3992942, -1.746281, 4.122962, 0, 0.01568628, 1, 1,
0.4002855, -0.4868965, 3.68177, 0, 0.01176471, 1, 1,
0.400377, -0.2026115, 2.231796, 0, 0.003921569, 1, 1,
0.4040084, 1.076069, 2.038851, 0.003921569, 0, 1, 1,
0.4063501, -2.032346, 0.8720493, 0.007843138, 0, 1, 1,
0.4072187, -1.153709, 3.46927, 0.01568628, 0, 1, 1,
0.4097943, -0.3714895, 3.222038, 0.01960784, 0, 1, 1,
0.4098267, 0.2923035, 0.9126958, 0.02745098, 0, 1, 1,
0.4100014, 1.596602, 0.006250811, 0.03137255, 0, 1, 1,
0.4117965, -1.773261, 2.554444, 0.03921569, 0, 1, 1,
0.4124137, -0.03801826, 1.534764, 0.04313726, 0, 1, 1,
0.4124797, -2.291186, 4.958992, 0.05098039, 0, 1, 1,
0.4136865, -1.107377, 2.047026, 0.05490196, 0, 1, 1,
0.4169316, -0.4950248, 2.546066, 0.0627451, 0, 1, 1,
0.4183908, -0.002794179, 0.4420522, 0.06666667, 0, 1, 1,
0.419914, 0.2751136, -0.1952056, 0.07450981, 0, 1, 1,
0.424794, 0.2841794, 1.521051, 0.07843138, 0, 1, 1,
0.4277121, 0.555686, 0.2809037, 0.08627451, 0, 1, 1,
0.4298315, 1.96733, 0.6916703, 0.09019608, 0, 1, 1,
0.4347311, 1.383779, 1.04072, 0.09803922, 0, 1, 1,
0.4459667, -1.282898, 3.357021, 0.1058824, 0, 1, 1,
0.4471039, -0.361915, 2.866156, 0.1098039, 0, 1, 1,
0.4527756, 0.378525, 2.257248, 0.1176471, 0, 1, 1,
0.4546736, -0.4224698, 2.474309, 0.1215686, 0, 1, 1,
0.4566196, -1.171155, 4.159647, 0.1294118, 0, 1, 1,
0.4581749, -1.165722, 4.005536, 0.1333333, 0, 1, 1,
0.4600662, -1.233255, 3.830672, 0.1411765, 0, 1, 1,
0.4602364, 0.3936715, 1.716264, 0.145098, 0, 1, 1,
0.4633939, -0.2504543, 0.4811686, 0.1529412, 0, 1, 1,
0.4669781, -0.6048855, 2.725465, 0.1568628, 0, 1, 1,
0.4671273, -1.911882, 3.517479, 0.1647059, 0, 1, 1,
0.4700531, -0.749942, 2.724719, 0.1686275, 0, 1, 1,
0.4750645, 0.1309309, 2.9548, 0.1764706, 0, 1, 1,
0.4762314, 1.173714, 1.235016, 0.1803922, 0, 1, 1,
0.4775641, 0.3980787, 0.55044, 0.1882353, 0, 1, 1,
0.4810786, -0.1888007, 1.259648, 0.1921569, 0, 1, 1,
0.4841366, -0.3667721, 1.573271, 0.2, 0, 1, 1,
0.4871466, -0.09372129, 3.211919, 0.2078431, 0, 1, 1,
0.4875272, 1.346071, 0.04791566, 0.2117647, 0, 1, 1,
0.4877153, -0.2882328, 2.109113, 0.2196078, 0, 1, 1,
0.4905443, -0.8508812, 3.116102, 0.2235294, 0, 1, 1,
0.4943429, -0.01356808, -0.007802223, 0.2313726, 0, 1, 1,
0.4995912, 0.6305891, 1.157699, 0.2352941, 0, 1, 1,
0.5088719, -0.04916815, 0.6257135, 0.2431373, 0, 1, 1,
0.512067, -0.6995946, 3.48776, 0.2470588, 0, 1, 1,
0.5127487, -2.097012, 0.6697179, 0.254902, 0, 1, 1,
0.5136807, -0.3463194, 1.034658, 0.2588235, 0, 1, 1,
0.5143979, -1.16371, 4.607836, 0.2666667, 0, 1, 1,
0.515155, 1.1049, -0.4594131, 0.2705882, 0, 1, 1,
0.5166132, 1.334184, 0.4458396, 0.2784314, 0, 1, 1,
0.5171307, -0.3051388, 1.562834, 0.282353, 0, 1, 1,
0.5204762, -0.3583401, 1.473699, 0.2901961, 0, 1, 1,
0.5235858, 0.2138514, 2.652923, 0.2941177, 0, 1, 1,
0.527306, 0.6673958, 0.7649324, 0.3019608, 0, 1, 1,
0.5296257, 0.547212, 1.219807, 0.3098039, 0, 1, 1,
0.5333084, 0.2704653, -0.2327996, 0.3137255, 0, 1, 1,
0.5413418, -0.08897106, 1.074793, 0.3215686, 0, 1, 1,
0.5413629, 1.396429, -0.03657258, 0.3254902, 0, 1, 1,
0.5419071, -1.538369, 1.948096, 0.3333333, 0, 1, 1,
0.5458196, -0.8536525, 1.913815, 0.3372549, 0, 1, 1,
0.5468118, -0.3175888, 2.465948, 0.345098, 0, 1, 1,
0.5516241, -0.2865969, 2.424548, 0.3490196, 0, 1, 1,
0.5538358, -0.06263309, 0.7936337, 0.3568628, 0, 1, 1,
0.5548616, -0.8187067, 3.380922, 0.3607843, 0, 1, 1,
0.5568912, -0.5115495, 1.702594, 0.3686275, 0, 1, 1,
0.5604873, 1.000448, 1.048752, 0.372549, 0, 1, 1,
0.5629752, 0.100251, -1.29793, 0.3803922, 0, 1, 1,
0.5634838, -0.289407, 2.407184, 0.3843137, 0, 1, 1,
0.5641215, 2.040534, -1.313539, 0.3921569, 0, 1, 1,
0.5642849, 0.08465499, 2.572476, 0.3960784, 0, 1, 1,
0.5651122, -0.4623923, 1.937304, 0.4039216, 0, 1, 1,
0.5654632, -0.7448172, 3.525557, 0.4117647, 0, 1, 1,
0.5655118, 1.118067, 1.164775, 0.4156863, 0, 1, 1,
0.5702099, -0.7544577, 1.687964, 0.4235294, 0, 1, 1,
0.5710251, 0.8468964, 0.07263752, 0.427451, 0, 1, 1,
0.580402, -1.121754, 3.278535, 0.4352941, 0, 1, 1,
0.5820535, -1.441918, 3.475339, 0.4392157, 0, 1, 1,
0.5834219, 0.8410718, 0.6507351, 0.4470588, 0, 1, 1,
0.5857225, 1.071363, 2.079506, 0.4509804, 0, 1, 1,
0.5873314, 1.522159, -0.08121714, 0.4588235, 0, 1, 1,
0.5891504, -0.320656, 3.003333, 0.4627451, 0, 1, 1,
0.5892313, -2.339276, 3.543586, 0.4705882, 0, 1, 1,
0.5913216, 0.3227595, 0.5742204, 0.4745098, 0, 1, 1,
0.5944963, 1.148965, -0.9889331, 0.4823529, 0, 1, 1,
0.5951375, 0.8438619, 1.345444, 0.4862745, 0, 1, 1,
0.5967247, 0.6723093, 0.5013519, 0.4941176, 0, 1, 1,
0.5989649, 0.8110004, 0.6318247, 0.5019608, 0, 1, 1,
0.6019754, -0.01346264, 0.318424, 0.5058824, 0, 1, 1,
0.6045464, 0.4867711, 2.709213, 0.5137255, 0, 1, 1,
0.6084821, -1.601785, 3.142827, 0.5176471, 0, 1, 1,
0.6100231, -0.08889991, 2.170929, 0.5254902, 0, 1, 1,
0.611538, -0.8196621, 1.762467, 0.5294118, 0, 1, 1,
0.613609, 1.300063, 2.124521, 0.5372549, 0, 1, 1,
0.6143579, 0.1660577, 2.356338, 0.5411765, 0, 1, 1,
0.6155561, -0.1736812, 1.615376, 0.5490196, 0, 1, 1,
0.62067, 0.3028711, 0.2940643, 0.5529412, 0, 1, 1,
0.6281437, 0.5223284, -0.6270199, 0.5607843, 0, 1, 1,
0.6402851, 0.6440427, 1.02656, 0.5647059, 0, 1, 1,
0.6408501, -0.4285556, 3.239189, 0.572549, 0, 1, 1,
0.6418052, -0.7643667, 3.281728, 0.5764706, 0, 1, 1,
0.6425737, -0.342764, 3.276956, 0.5843138, 0, 1, 1,
0.6460889, 0.1017492, 1.485713, 0.5882353, 0, 1, 1,
0.6481385, 0.06565952, 0.9900333, 0.5960785, 0, 1, 1,
0.6505771, -0.1969707, 0.5879002, 0.6039216, 0, 1, 1,
0.6584542, 0.7536268, 0.642864, 0.6078432, 0, 1, 1,
0.661149, -0.210109, -0.3991015, 0.6156863, 0, 1, 1,
0.6647885, -1.328826, 2.010675, 0.6196079, 0, 1, 1,
0.6671945, 0.9634032, 2.046593, 0.627451, 0, 1, 1,
0.6688449, -2.161909, 3.201544, 0.6313726, 0, 1, 1,
0.6691844, 0.08741292, 0.4683368, 0.6392157, 0, 1, 1,
0.6738653, -2.210665, 1.899539, 0.6431373, 0, 1, 1,
0.6807409, 1.422599, 1.316624, 0.6509804, 0, 1, 1,
0.682146, 0.1881206, 2.297839, 0.654902, 0, 1, 1,
0.6859996, -0.1942829, 1.805394, 0.6627451, 0, 1, 1,
0.6930465, -1.413338, 1.009106, 0.6666667, 0, 1, 1,
0.6966111, 1.3573, 0.8468208, 0.6745098, 0, 1, 1,
0.6971023, 0.3048893, 1.137565, 0.6784314, 0, 1, 1,
0.7108226, -0.3377852, 2.432267, 0.6862745, 0, 1, 1,
0.7129315, -0.06244502, 2.423884, 0.6901961, 0, 1, 1,
0.7144545, 0.3270088, 0.68132, 0.6980392, 0, 1, 1,
0.7149119, -0.6932192, 3.549905, 0.7058824, 0, 1, 1,
0.718661, 1.196029, 2.42283, 0.7098039, 0, 1, 1,
0.7224349, -1.19919, 2.803725, 0.7176471, 0, 1, 1,
0.7254739, 0.9810877, 2.170187, 0.7215686, 0, 1, 1,
0.7274666, -0.4350312, 0.9337692, 0.7294118, 0, 1, 1,
0.7284128, -0.7485946, 2.840837, 0.7333333, 0, 1, 1,
0.7295787, 2.064036, -0.9045429, 0.7411765, 0, 1, 1,
0.730023, -0.8458745, 2.424558, 0.7450981, 0, 1, 1,
0.7356141, 1.041418, 0.6856785, 0.7529412, 0, 1, 1,
0.7443824, 1.138987, 0.5386403, 0.7568628, 0, 1, 1,
0.755686, -0.4635097, 3.079368, 0.7647059, 0, 1, 1,
0.7583734, -0.2830942, 2.051803, 0.7686275, 0, 1, 1,
0.7605435, -1.58748, 1.099307, 0.7764706, 0, 1, 1,
0.7637442, 0.7819014, 1.732315, 0.7803922, 0, 1, 1,
0.7637606, 0.5478944, 0.7380704, 0.7882353, 0, 1, 1,
0.7645451, -1.410796, 2.97473, 0.7921569, 0, 1, 1,
0.7694492, -1.596252, 0.758495, 0.8, 0, 1, 1,
0.7699019, -0.1648371, 1.248215, 0.8078431, 0, 1, 1,
0.7700341, 0.9121287, -0.9793068, 0.8117647, 0, 1, 1,
0.7701201, -0.867465, 2.493446, 0.8196079, 0, 1, 1,
0.7799047, -0.05844439, 0.9590417, 0.8235294, 0, 1, 1,
0.7820857, 0.3266498, 2.715062, 0.8313726, 0, 1, 1,
0.793238, -1.842178, 2.818059, 0.8352941, 0, 1, 1,
0.8015589, -0.9240044, 2.152173, 0.8431373, 0, 1, 1,
0.805528, 0.07672086, 1.90979, 0.8470588, 0, 1, 1,
0.8066053, 1.244397, -0.3875018, 0.854902, 0, 1, 1,
0.8096327, -0.274757, 2.920456, 0.8588235, 0, 1, 1,
0.8226048, -0.5803128, 1.14436, 0.8666667, 0, 1, 1,
0.8237678, -0.8117602, 2.085741, 0.8705882, 0, 1, 1,
0.8240201, -0.8520126, 1.420157, 0.8784314, 0, 1, 1,
0.8248364, -0.9825959, 2.31252, 0.8823529, 0, 1, 1,
0.8271438, -1.605842, 3.48026, 0.8901961, 0, 1, 1,
0.8283656, 0.3758685, 1.397164, 0.8941177, 0, 1, 1,
0.8315511, 0.893304, -0.2293722, 0.9019608, 0, 1, 1,
0.8317646, -0.02435192, 1.265747, 0.9098039, 0, 1, 1,
0.8336968, 0.1982263, 1.331802, 0.9137255, 0, 1, 1,
0.8392034, -0.1517498, 2.369327, 0.9215686, 0, 1, 1,
0.8527265, 0.6188197, 0.1895056, 0.9254902, 0, 1, 1,
0.8530657, 1.524342, 0.3553515, 0.9333333, 0, 1, 1,
0.8532616, -0.8817457, 2.767851, 0.9372549, 0, 1, 1,
0.856316, 0.4816935, 0.2563944, 0.945098, 0, 1, 1,
0.8568678, -1.105879, 1.609485, 0.9490196, 0, 1, 1,
0.8592, 1.577385, -0.2512184, 0.9568627, 0, 1, 1,
0.8599584, 0.6257432, 2.191958, 0.9607843, 0, 1, 1,
0.8629717, -0.4789979, 1.060405, 0.9686275, 0, 1, 1,
0.8640233, 0.7733291, 0.3025634, 0.972549, 0, 1, 1,
0.8689392, 0.7327713, 0.9240363, 0.9803922, 0, 1, 1,
0.8774651, -0.1342528, 2.717648, 0.9843137, 0, 1, 1,
0.8839965, -1.217884, 2.664283, 0.9921569, 0, 1, 1,
0.8879994, 0.9380437, 1.31664, 0.9960784, 0, 1, 1,
0.8884189, -0.7526432, 2.15063, 1, 0, 0.9960784, 1,
0.8915334, -0.3165267, 1.76005, 1, 0, 0.9882353, 1,
0.8919526, 1.592983, 1.078762, 1, 0, 0.9843137, 1,
0.8950897, -0.1089655, 1.015812, 1, 0, 0.9764706, 1,
0.9019784, -0.2085862, 1.682709, 1, 0, 0.972549, 1,
0.9036534, 0.9334772, 0.7670954, 1, 0, 0.9647059, 1,
0.9088306, 1.566411, -1.379514, 1, 0, 0.9607843, 1,
0.9157778, 0.199296, 0.5407697, 1, 0, 0.9529412, 1,
0.9186765, -1.762994, 3.952366, 1, 0, 0.9490196, 1,
0.927013, 0.384285, 3.398467, 1, 0, 0.9411765, 1,
0.9301295, 0.5223547, 0.6577471, 1, 0, 0.9372549, 1,
0.9338009, 0.5540063, 0.7274758, 1, 0, 0.9294118, 1,
0.9341349, -0.2358844, 0.5603257, 1, 0, 0.9254902, 1,
0.9347078, 1.118954, 0.6923428, 1, 0, 0.9176471, 1,
0.9366665, -0.3056756, -0.490233, 1, 0, 0.9137255, 1,
0.9445106, -0.1291614, 2.417416, 1, 0, 0.9058824, 1,
0.9535016, -0.7330116, 1.724137, 1, 0, 0.9019608, 1,
0.9571436, -1.313224, 0.6475689, 1, 0, 0.8941177, 1,
0.9601206, 0.04922297, 2.509507, 1, 0, 0.8862745, 1,
0.9608482, -0.2624648, 0.8164354, 1, 0, 0.8823529, 1,
0.9626756, 0.3825105, 1.734994, 1, 0, 0.8745098, 1,
0.9645101, 0.08361671, 1.688717, 1, 0, 0.8705882, 1,
0.9708166, 2.082734, -0.8383839, 1, 0, 0.8627451, 1,
0.9736373, 0.5369838, 2.828229, 1, 0, 0.8588235, 1,
0.9761716, -0.06131396, 1.16818, 1, 0, 0.8509804, 1,
0.9807935, 0.4934459, 1.34492, 1, 0, 0.8470588, 1,
0.9857204, 2.458195, 0.1243316, 1, 0, 0.8392157, 1,
0.9880031, -0.629275, 2.185164, 1, 0, 0.8352941, 1,
0.9893436, -0.1542273, 0.1065704, 1, 0, 0.827451, 1,
1.000034, 0.651742, 1.231623, 1, 0, 0.8235294, 1,
1.003135, 0.5828245, 0.4797523, 1, 0, 0.8156863, 1,
1.00582, -0.589873, 3.524188, 1, 0, 0.8117647, 1,
1.006494, 0.1334454, 0.4133719, 1, 0, 0.8039216, 1,
1.008799, -2.234753, 2.907689, 1, 0, 0.7960784, 1,
1.012766, -0.4076372, 2.824375, 1, 0, 0.7921569, 1,
1.016719, 0.2966177, 0.2438511, 1, 0, 0.7843137, 1,
1.016988, 0.602511, 1.255771, 1, 0, 0.7803922, 1,
1.0175, -0.03293558, 1.927654, 1, 0, 0.772549, 1,
1.02811, 0.3559096, 0.3994907, 1, 0, 0.7686275, 1,
1.031942, 0.3037081, 0.1012167, 1, 0, 0.7607843, 1,
1.037442, -0.1410339, 1.227381, 1, 0, 0.7568628, 1,
1.038972, 1.13984, -0.1666798, 1, 0, 0.7490196, 1,
1.043931, 0.7299571, 1.052248, 1, 0, 0.7450981, 1,
1.043978, 0.2235973, 1.48186, 1, 0, 0.7372549, 1,
1.047219, -0.2577406, 2.589911, 1, 0, 0.7333333, 1,
1.061418, -0.7010334, 3.244282, 1, 0, 0.7254902, 1,
1.071019, 1.077802, 1.419889, 1, 0, 0.7215686, 1,
1.075966, 0.3872856, 0.4230433, 1, 0, 0.7137255, 1,
1.081355, 0.06433537, 0.9005436, 1, 0, 0.7098039, 1,
1.081553, -1.039663, 2.623912, 1, 0, 0.7019608, 1,
1.085047, 1.118116, -0.1612919, 1, 0, 0.6941177, 1,
1.086891, 1.015137, -0.06009106, 1, 0, 0.6901961, 1,
1.091075, 0.125401, 1.255073, 1, 0, 0.682353, 1,
1.103767, -1.294345, 1.425299, 1, 0, 0.6784314, 1,
1.106917, 0.01660085, 0.8192592, 1, 0, 0.6705883, 1,
1.107907, -1.761575, 2.655809, 1, 0, 0.6666667, 1,
1.111323, 0.684843, 1.780721, 1, 0, 0.6588235, 1,
1.112877, 0.1036702, 1.522331, 1, 0, 0.654902, 1,
1.113062, 0.8879155, -0.748176, 1, 0, 0.6470588, 1,
1.116552, -0.2319349, 1.19743, 1, 0, 0.6431373, 1,
1.120466, 1.026802, -0.7960663, 1, 0, 0.6352941, 1,
1.120934, 0.8349606, 0.3977806, 1, 0, 0.6313726, 1,
1.128975, 1.507491, 0.7204956, 1, 0, 0.6235294, 1,
1.134918, -1.825389, 1.957146, 1, 0, 0.6196079, 1,
1.13569, -0.4736259, 1.513553, 1, 0, 0.6117647, 1,
1.149344, -1.277163, 2.837603, 1, 0, 0.6078432, 1,
1.152092, 0.3186484, 0.9168431, 1, 0, 0.6, 1,
1.15243, 0.6485919, 3.918179, 1, 0, 0.5921569, 1,
1.154766, 0.749029, 0.9910362, 1, 0, 0.5882353, 1,
1.158648, -0.936194, 3.330156, 1, 0, 0.5803922, 1,
1.170558, -0.2049018, 1.172595, 1, 0, 0.5764706, 1,
1.176195, -0.7515638, 2.663832, 1, 0, 0.5686275, 1,
1.185903, 0.729892, -0.6663534, 1, 0, 0.5647059, 1,
1.190589, 0.06542741, 1.197453, 1, 0, 0.5568628, 1,
1.194955, 0.4767309, 0.01005275, 1, 0, 0.5529412, 1,
1.198523, 2.274161, 0.9187315, 1, 0, 0.5450981, 1,
1.202971, -0.1052045, 1.184413, 1, 0, 0.5411765, 1,
1.206895, -0.1615459, 1.710961, 1, 0, 0.5333334, 1,
1.218736, -0.1381458, 2.46768, 1, 0, 0.5294118, 1,
1.243429, 0.5698678, 1.282108, 1, 0, 0.5215687, 1,
1.249484, -0.01607222, 2.938904, 1, 0, 0.5176471, 1,
1.261996, 0.9928594, 0.4738071, 1, 0, 0.509804, 1,
1.270238, 1.5363, 1.916129, 1, 0, 0.5058824, 1,
1.273761, -0.1160648, 2.937876, 1, 0, 0.4980392, 1,
1.281299, 0.03813336, 2.974824, 1, 0, 0.4901961, 1,
1.285967, 0.8765026, 3.527617, 1, 0, 0.4862745, 1,
1.299765, -0.1406685, 1.736243, 1, 0, 0.4784314, 1,
1.303994, -0.2223189, 1.19065, 1, 0, 0.4745098, 1,
1.316676, -0.8685811, 1.109913, 1, 0, 0.4666667, 1,
1.319605, 1.668522, 1.114217, 1, 0, 0.4627451, 1,
1.329072, -0.486069, 0.7768891, 1, 0, 0.454902, 1,
1.331962, 0.6638188, 1.511944, 1, 0, 0.4509804, 1,
1.334163, -0.2858741, 1.53834, 1, 0, 0.4431373, 1,
1.348629, 0.7438029, 0.8689489, 1, 0, 0.4392157, 1,
1.3577, 0.9114267, 2.503287, 1, 0, 0.4313726, 1,
1.365642, 0.1649874, 1.946753, 1, 0, 0.427451, 1,
1.366996, 0.8053808, 2.262563, 1, 0, 0.4196078, 1,
1.371259, -2.240626, 1.05562, 1, 0, 0.4156863, 1,
1.371863, 0.8677148, 1.120307, 1, 0, 0.4078431, 1,
1.381356, -0.7244785, 2.205739, 1, 0, 0.4039216, 1,
1.390654, 0.635012, 1.424026, 1, 0, 0.3960784, 1,
1.410105, 0.968715, -0.08690891, 1, 0, 0.3882353, 1,
1.415426, 1.654046, -0.9133716, 1, 0, 0.3843137, 1,
1.420467, 1.943357, -0.1963126, 1, 0, 0.3764706, 1,
1.43025, 0.341681, -0.5173535, 1, 0, 0.372549, 1,
1.435286, 1.771865, 1.076661, 1, 0, 0.3647059, 1,
1.461493, -0.9419487, 4.402436, 1, 0, 0.3607843, 1,
1.476466, -0.1847844, 0.9620612, 1, 0, 0.3529412, 1,
1.477392, -0.6350762, 1.890809, 1, 0, 0.3490196, 1,
1.481836, 0.2184198, 0.5807778, 1, 0, 0.3411765, 1,
1.493338, -0.2249316, 2.26499, 1, 0, 0.3372549, 1,
1.497312, 0.7435036, -0.5356669, 1, 0, 0.3294118, 1,
1.499136, -0.2809666, 0.6516623, 1, 0, 0.3254902, 1,
1.513488, -0.6286253, 2.738247, 1, 0, 0.3176471, 1,
1.514687, 2.607964, 0.6613883, 1, 0, 0.3137255, 1,
1.533908, -1.3344, 4.465736, 1, 0, 0.3058824, 1,
1.537062, 1.3857, 1.375619, 1, 0, 0.2980392, 1,
1.549811, -1.205491, 1.681231, 1, 0, 0.2941177, 1,
1.568048, 0.2720433, 3.008615, 1, 0, 0.2862745, 1,
1.585317, 1.029253, 1.797937, 1, 0, 0.282353, 1,
1.5895, -1.300069, 2.996207, 1, 0, 0.2745098, 1,
1.592417, -0.1763346, 1.651889, 1, 0, 0.2705882, 1,
1.613356, -0.3696652, 1.536761, 1, 0, 0.2627451, 1,
1.613716, 0.6703236, 1.556862, 1, 0, 0.2588235, 1,
1.618997, 1.941456, -0.2441928, 1, 0, 0.2509804, 1,
1.621786, 1.164689, 1.321253, 1, 0, 0.2470588, 1,
1.629116, -0.4657111, 1.589987, 1, 0, 0.2392157, 1,
1.64912, 0.1622095, 1.474559, 1, 0, 0.2352941, 1,
1.651088, -0.1148882, 1.843294, 1, 0, 0.227451, 1,
1.699807, -2.532744, 2.145919, 1, 0, 0.2235294, 1,
1.721932, 0.07236569, 2.798679, 1, 0, 0.2156863, 1,
1.730446, 0.9597071, 0.3463544, 1, 0, 0.2117647, 1,
1.738771, -2.026834, 4.103222, 1, 0, 0.2039216, 1,
1.739426, -0.522693, 2.374441, 1, 0, 0.1960784, 1,
1.745375, -1.008755, 2.596382, 1, 0, 0.1921569, 1,
1.754261, 0.1209989, 2.042934, 1, 0, 0.1843137, 1,
1.775079, -0.5016011, 2.871766, 1, 0, 0.1803922, 1,
1.788946, 0.1869634, 1.32417, 1, 0, 0.172549, 1,
1.791877, 0.5104141, 0.5554342, 1, 0, 0.1686275, 1,
1.796175, -0.513141, 2.476086, 1, 0, 0.1607843, 1,
1.797052, 0.1507011, 3.345459, 1, 0, 0.1568628, 1,
1.816905, 1.353819, -0.08119956, 1, 0, 0.1490196, 1,
1.822838, -0.2342617, 1.638924, 1, 0, 0.145098, 1,
1.839004, -0.4827147, 0.5247964, 1, 0, 0.1372549, 1,
1.844383, -0.5433722, 1.676184, 1, 0, 0.1333333, 1,
1.852434, -0.2057102, 1.585181, 1, 0, 0.1254902, 1,
1.854365, -1.273251, 2.116067, 1, 0, 0.1215686, 1,
1.894413, -0.1747569, 1.637349, 1, 0, 0.1137255, 1,
1.906722, 0.3280439, 1.249792, 1, 0, 0.1098039, 1,
1.91093, 0.4369166, -1.813689, 1, 0, 0.1019608, 1,
1.927592, 0.584345, 2.256248, 1, 0, 0.09411765, 1,
2.069058, -0.01233854, 2.149264, 1, 0, 0.09019608, 1,
2.133132, 0.7724293, 1.919823, 1, 0, 0.08235294, 1,
2.188907, -0.2640589, 1.732841, 1, 0, 0.07843138, 1,
2.224728, -0.1379944, 1.601272, 1, 0, 0.07058824, 1,
2.242049, 1.048437, 2.394027, 1, 0, 0.06666667, 1,
2.351034, -0.3566736, 0.1825038, 1, 0, 0.05882353, 1,
2.40152, -1.215075, 1.588496, 1, 0, 0.05490196, 1,
2.47368, 0.7834273, 3.108398, 1, 0, 0.04705882, 1,
2.48875, 0.05666807, 1.798216, 1, 0, 0.04313726, 1,
2.588639, 1.849041, 3.284239, 1, 0, 0.03529412, 1,
2.63372, -0.2022052, 1.035139, 1, 0, 0.03137255, 1,
2.692451, -2.895509, 3.067019, 1, 0, 0.02352941, 1,
2.69541, -0.3873861, 1.651129, 1, 0, 0.01960784, 1,
2.895938, 0.8803889, 3.274375, 1, 0, 0.01176471, 1,
2.972037, 0.8214903, 2.052893, 1, 0, 0.007843138, 1
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
-0.1089805, -3.906026, -7.655031, 0, -0.5, 0.5, 0.5,
-0.1089805, -3.906026, -7.655031, 1, -0.5, 0.5, 0.5,
-0.1089805, -3.906026, -7.655031, 1, 1.5, 0.5, 0.5,
-0.1089805, -3.906026, -7.655031, 0, 1.5, 0.5, 0.5
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
-4.234463, 0.08536577, -7.655031, 0, -0.5, 0.5, 0.5,
-4.234463, 0.08536577, -7.655031, 1, -0.5, 0.5, 0.5,
-4.234463, 0.08536577, -7.655031, 1, 1.5, 0.5, 0.5,
-4.234463, 0.08536577, -7.655031, 0, 1.5, 0.5, 0.5
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
-4.234463, -3.906026, -0.07425809, 0, -0.5, 0.5, 0.5,
-4.234463, -3.906026, -0.07425809, 1, -0.5, 0.5, 0.5,
-4.234463, -3.906026, -0.07425809, 1, 1.5, 0.5, 0.5,
-4.234463, -3.906026, -0.07425809, 0, 1.5, 0.5, 0.5
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
-3, -2.984936, -5.905622,
2, -2.984936, -5.905622,
-3, -2.984936, -5.905622,
-3, -3.138451, -6.19719,
-2, -2.984936, -5.905622,
-2, -3.138451, -6.19719,
-1, -2.984936, -5.905622,
-1, -3.138451, -6.19719,
0, -2.984936, -5.905622,
0, -3.138451, -6.19719,
1, -2.984936, -5.905622,
1, -3.138451, -6.19719,
2, -2.984936, -5.905622,
2, -3.138451, -6.19719
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
-3, -3.445481, -6.780326, 0, -0.5, 0.5, 0.5,
-3, -3.445481, -6.780326, 1, -0.5, 0.5, 0.5,
-3, -3.445481, -6.780326, 1, 1.5, 0.5, 0.5,
-3, -3.445481, -6.780326, 0, 1.5, 0.5, 0.5,
-2, -3.445481, -6.780326, 0, -0.5, 0.5, 0.5,
-2, -3.445481, -6.780326, 1, -0.5, 0.5, 0.5,
-2, -3.445481, -6.780326, 1, 1.5, 0.5, 0.5,
-2, -3.445481, -6.780326, 0, 1.5, 0.5, 0.5,
-1, -3.445481, -6.780326, 0, -0.5, 0.5, 0.5,
-1, -3.445481, -6.780326, 1, -0.5, 0.5, 0.5,
-1, -3.445481, -6.780326, 1, 1.5, 0.5, 0.5,
-1, -3.445481, -6.780326, 0, 1.5, 0.5, 0.5,
0, -3.445481, -6.780326, 0, -0.5, 0.5, 0.5,
0, -3.445481, -6.780326, 1, -0.5, 0.5, 0.5,
0, -3.445481, -6.780326, 1, 1.5, 0.5, 0.5,
0, -3.445481, -6.780326, 0, 1.5, 0.5, 0.5,
1, -3.445481, -6.780326, 0, -0.5, 0.5, 0.5,
1, -3.445481, -6.780326, 1, -0.5, 0.5, 0.5,
1, -3.445481, -6.780326, 1, 1.5, 0.5, 0.5,
1, -3.445481, -6.780326, 0, 1.5, 0.5, 0.5,
2, -3.445481, -6.780326, 0, -0.5, 0.5, 0.5,
2, -3.445481, -6.780326, 1, -0.5, 0.5, 0.5,
2, -3.445481, -6.780326, 1, 1.5, 0.5, 0.5,
2, -3.445481, -6.780326, 0, 1.5, 0.5, 0.5
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
-3.282429, -2, -5.905622,
-3.282429, 3, -5.905622,
-3.282429, -2, -5.905622,
-3.441101, -2, -6.19719,
-3.282429, -1, -5.905622,
-3.441101, -1, -6.19719,
-3.282429, 0, -5.905622,
-3.441101, 0, -6.19719,
-3.282429, 1, -5.905622,
-3.441101, 1, -6.19719,
-3.282429, 2, -5.905622,
-3.441101, 2, -6.19719,
-3.282429, 3, -5.905622,
-3.441101, 3, -6.19719
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
-3.758446, -2, -6.780326, 0, -0.5, 0.5, 0.5,
-3.758446, -2, -6.780326, 1, -0.5, 0.5, 0.5,
-3.758446, -2, -6.780326, 1, 1.5, 0.5, 0.5,
-3.758446, -2, -6.780326, 0, 1.5, 0.5, 0.5,
-3.758446, -1, -6.780326, 0, -0.5, 0.5, 0.5,
-3.758446, -1, -6.780326, 1, -0.5, 0.5, 0.5,
-3.758446, -1, -6.780326, 1, 1.5, 0.5, 0.5,
-3.758446, -1, -6.780326, 0, 1.5, 0.5, 0.5,
-3.758446, 0, -6.780326, 0, -0.5, 0.5, 0.5,
-3.758446, 0, -6.780326, 1, -0.5, 0.5, 0.5,
-3.758446, 0, -6.780326, 1, 1.5, 0.5, 0.5,
-3.758446, 0, -6.780326, 0, 1.5, 0.5, 0.5,
-3.758446, 1, -6.780326, 0, -0.5, 0.5, 0.5,
-3.758446, 1, -6.780326, 1, -0.5, 0.5, 0.5,
-3.758446, 1, -6.780326, 1, 1.5, 0.5, 0.5,
-3.758446, 1, -6.780326, 0, 1.5, 0.5, 0.5,
-3.758446, 2, -6.780326, 0, -0.5, 0.5, 0.5,
-3.758446, 2, -6.780326, 1, -0.5, 0.5, 0.5,
-3.758446, 2, -6.780326, 1, 1.5, 0.5, 0.5,
-3.758446, 2, -6.780326, 0, 1.5, 0.5, 0.5,
-3.758446, 3, -6.780326, 0, -0.5, 0.5, 0.5,
-3.758446, 3, -6.780326, 1, -0.5, 0.5, 0.5,
-3.758446, 3, -6.780326, 1, 1.5, 0.5, 0.5,
-3.758446, 3, -6.780326, 0, 1.5, 0.5, 0.5
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
-3.282429, -2.984936, -4,
-3.282429, -2.984936, 4,
-3.282429, -2.984936, -4,
-3.441101, -3.138451, -4,
-3.282429, -2.984936, -2,
-3.441101, -3.138451, -2,
-3.282429, -2.984936, 0,
-3.441101, -3.138451, 0,
-3.282429, -2.984936, 2,
-3.441101, -3.138451, 2,
-3.282429, -2.984936, 4,
-3.441101, -3.138451, 4
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
-3.758446, -3.445481, -4, 0, -0.5, 0.5, 0.5,
-3.758446, -3.445481, -4, 1, -0.5, 0.5, 0.5,
-3.758446, -3.445481, -4, 1, 1.5, 0.5, 0.5,
-3.758446, -3.445481, -4, 0, 1.5, 0.5, 0.5,
-3.758446, -3.445481, -2, 0, -0.5, 0.5, 0.5,
-3.758446, -3.445481, -2, 1, -0.5, 0.5, 0.5,
-3.758446, -3.445481, -2, 1, 1.5, 0.5, 0.5,
-3.758446, -3.445481, -2, 0, 1.5, 0.5, 0.5,
-3.758446, -3.445481, 0, 0, -0.5, 0.5, 0.5,
-3.758446, -3.445481, 0, 1, -0.5, 0.5, 0.5,
-3.758446, -3.445481, 0, 1, 1.5, 0.5, 0.5,
-3.758446, -3.445481, 0, 0, 1.5, 0.5, 0.5,
-3.758446, -3.445481, 2, 0, -0.5, 0.5, 0.5,
-3.758446, -3.445481, 2, 1, -0.5, 0.5, 0.5,
-3.758446, -3.445481, 2, 1, 1.5, 0.5, 0.5,
-3.758446, -3.445481, 2, 0, 1.5, 0.5, 0.5,
-3.758446, -3.445481, 4, 0, -0.5, 0.5, 0.5,
-3.758446, -3.445481, 4, 1, -0.5, 0.5, 0.5,
-3.758446, -3.445481, 4, 1, 1.5, 0.5, 0.5,
-3.758446, -3.445481, 4, 0, 1.5, 0.5, 0.5
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
-3.282429, -2.984936, -5.905622,
-3.282429, 3.155667, -5.905622,
-3.282429, -2.984936, 5.757105,
-3.282429, 3.155667, 5.757105,
-3.282429, -2.984936, -5.905622,
-3.282429, -2.984936, 5.757105,
-3.282429, 3.155667, -5.905622,
-3.282429, 3.155667, 5.757105,
-3.282429, -2.984936, -5.905622,
3.064468, -2.984936, -5.905622,
-3.282429, -2.984936, 5.757105,
3.064468, -2.984936, 5.757105,
-3.282429, 3.155667, -5.905622,
3.064468, 3.155667, -5.905622,
-3.282429, 3.155667, 5.757105,
3.064468, 3.155667, 5.757105,
3.064468, -2.984936, -5.905622,
3.064468, 3.155667, -5.905622,
3.064468, -2.984936, 5.757105,
3.064468, 3.155667, 5.757105,
3.064468, -2.984936, -5.905622,
3.064468, -2.984936, 5.757105,
3.064468, 3.155667, -5.905622,
3.064468, 3.155667, 5.757105
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
var radius = 7.811632;
var distance = 34.75483;
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
mvMatrix.translate( 0.1089805, -0.08536577, 0.07425809 );
mvMatrix.scale( 1.330743, 1.37545, 0.7241951 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.75483);
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
phosphoramidothioate<-read.table("phosphoramidothioate.xyz")
```

```
## Error in read.table("phosphoramidothioate.xyz"): no lines available in input
```

```r
x<-phosphoramidothioate$V2
```

```
## Error in eval(expr, envir, enclos): object 'phosphoramidothioate' not found
```

```r
y<-phosphoramidothioate$V3
```

```
## Error in eval(expr, envir, enclos): object 'phosphoramidothioate' not found
```

```r
z<-phosphoramidothioate$V4
```

```
## Error in eval(expr, envir, enclos): object 'phosphoramidothioate' not found
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
-3.189998, -0.8576155, -0.1149372, 0, 0, 1, 1, 1,
-2.818909, -1.422527, -2.267512, 1, 0, 0, 1, 1,
-2.623106, 0.8883638, -1.843526, 1, 0, 0, 1, 1,
-2.533893, -0.5739867, -3.046592, 1, 0, 0, 1, 1,
-2.443517, 0.4698699, -0.3043927, 1, 0, 0, 1, 1,
-2.345052, -1.152984, -1.534678, 1, 0, 0, 1, 1,
-2.340692, -0.4940057, -1.696425, 0, 0, 0, 1, 1,
-2.32911, 0.2914981, -1.242014, 0, 0, 0, 1, 1,
-2.258268, 1.285708, -0.5109106, 0, 0, 0, 1, 1,
-2.227732, -0.2448859, -3.206093, 0, 0, 0, 1, 1,
-2.210355, -0.5125834, -0.9619558, 0, 0, 0, 1, 1,
-2.154032, -0.8197368, -0.6159856, 0, 0, 0, 1, 1,
-2.131911, 0.2828766, 0.04586304, 0, 0, 0, 1, 1,
-2.118465, -1.018114, -1.689502, 1, 1, 1, 1, 1,
-2.110892, 0.8392974, -2.205228, 1, 1, 1, 1, 1,
-2.109756, 0.8006943, -3.034652, 1, 1, 1, 1, 1,
-2.08633, -0.8677433, 1.008992, 1, 1, 1, 1, 1,
-2.054516, 1.9117, 0.2312165, 1, 1, 1, 1, 1,
-2.024745, 0.9479524, -0.3647448, 1, 1, 1, 1, 1,
-2.010196, -1.891407, -3.530661, 1, 1, 1, 1, 1,
-1.98903, -0.7636821, -1.571373, 1, 1, 1, 1, 1,
-1.988555, -0.8908728, -1.713157, 1, 1, 1, 1, 1,
-1.979268, -0.4227404, -2.42312, 1, 1, 1, 1, 1,
-1.958619, 0.05827326, -2.327207, 1, 1, 1, 1, 1,
-1.958127, -0.08343581, -2.111689, 1, 1, 1, 1, 1,
-1.950885, 0.490567, -1.791221, 1, 1, 1, 1, 1,
-1.944551, 0.2749571, -0.1484203, 1, 1, 1, 1, 1,
-1.942947, -1.049938, -2.494575, 1, 1, 1, 1, 1,
-1.935766, 1.068219, -1.161246, 0, 0, 1, 1, 1,
-1.931307, -0.8851716, -0.6352765, 1, 0, 0, 1, 1,
-1.921125, -0.8011972, -1.373949, 1, 0, 0, 1, 1,
-1.910036, 0.763722, 0.168642, 1, 0, 0, 1, 1,
-1.908228, -0.8269273, -1.211411, 1, 0, 0, 1, 1,
-1.899101, 2.031253, -0.8396628, 1, 0, 0, 1, 1,
-1.897929, 0.09706947, -1.807509, 0, 0, 0, 1, 1,
-1.855733, 0.2119067, -3.858868, 0, 0, 0, 1, 1,
-1.8505, -0.1167731, -0.777473, 0, 0, 0, 1, 1,
-1.843392, 0.1355042, -0.6493524, 0, 0, 0, 1, 1,
-1.785422, 1.106052, -2.223167, 0, 0, 0, 1, 1,
-1.750074, -0.306153, -1.852579, 0, 0, 0, 1, 1,
-1.74994, 0.4247162, 0.3041328, 0, 0, 0, 1, 1,
-1.749647, -1.805411, -2.863118, 1, 1, 1, 1, 1,
-1.723388, -0.5255563, -2.775039, 1, 1, 1, 1, 1,
-1.705926, -0.7356175, -0.264247, 1, 1, 1, 1, 1,
-1.705763, 1.024789, -0.2839148, 1, 1, 1, 1, 1,
-1.681044, -0.03731638, -1.436784, 1, 1, 1, 1, 1,
-1.679768, -0.2342514, -1.817604, 1, 1, 1, 1, 1,
-1.672158, 1.140005, -0.445821, 1, 1, 1, 1, 1,
-1.660858, -0.9482589, -3.494674, 1, 1, 1, 1, 1,
-1.660549, 0.9070676, -1.028855, 1, 1, 1, 1, 1,
-1.650782, -0.1793375, -0.5231718, 1, 1, 1, 1, 1,
-1.644745, -0.3455822, -1.113163, 1, 1, 1, 1, 1,
-1.641757, 1.300587, -1.407465, 1, 1, 1, 1, 1,
-1.636852, -0.4041511, -1.317521, 1, 1, 1, 1, 1,
-1.624106, -0.2796477, -2.23078, 1, 1, 1, 1, 1,
-1.622482, 1.577856, -0.3431346, 1, 1, 1, 1, 1,
-1.61749, 0.3975522, -3.334489, 0, 0, 1, 1, 1,
-1.612651, -0.2766941, -1.117591, 1, 0, 0, 1, 1,
-1.609689, -1.45886, -4.324798, 1, 0, 0, 1, 1,
-1.607924, -1.435678, -2.927737, 1, 0, 0, 1, 1,
-1.606733, -1.367369, -1.067156, 1, 0, 0, 1, 1,
-1.598152, -0.04936817, -1.625341, 1, 0, 0, 1, 1,
-1.586195, 0.2171904, -3.387223, 0, 0, 0, 1, 1,
-1.580477, -0.6531634, -1.890282, 0, 0, 0, 1, 1,
-1.580469, 0.3264361, -0.9446536, 0, 0, 0, 1, 1,
-1.576001, -0.0991848, -1.205174, 0, 0, 0, 1, 1,
-1.568716, -0.3336217, -2.102371, 0, 0, 0, 1, 1,
-1.56239, 1.48989, -1.562962, 0, 0, 0, 1, 1,
-1.548157, -0.6073804, -2.076252, 0, 0, 0, 1, 1,
-1.540334, 0.1214908, -2.925373, 1, 1, 1, 1, 1,
-1.519349, 1.024458, -1.059806, 1, 1, 1, 1, 1,
-1.518511, 0.8156041, -0.7492771, 1, 1, 1, 1, 1,
-1.498605, 1.689214, -1.876217, 1, 1, 1, 1, 1,
-1.491906, 0.293676, -1.362946, 1, 1, 1, 1, 1,
-1.471138, -1.086253, -1.993142, 1, 1, 1, 1, 1,
-1.470814, 0.726441, -0.2200553, 1, 1, 1, 1, 1,
-1.466577, -1.595837, -2.795326, 1, 1, 1, 1, 1,
-1.465346, 1.202903, -0.9840046, 1, 1, 1, 1, 1,
-1.464924, -0.4061652, -2.768899, 1, 1, 1, 1, 1,
-1.45893, -0.7081794, -0.5889728, 1, 1, 1, 1, 1,
-1.454847, -1.284795, -1.712373, 1, 1, 1, 1, 1,
-1.443293, -0.5190115, -1.498538, 1, 1, 1, 1, 1,
-1.39464, -0.5702016, -1.128706, 1, 1, 1, 1, 1,
-1.378935, 1.061796, -0.3697165, 1, 1, 1, 1, 1,
-1.364948, 0.07530172, -2.832145, 0, 0, 1, 1, 1,
-1.354059, -2.101878, -1.247474, 1, 0, 0, 1, 1,
-1.349486, 0.04531295, -0.5124326, 1, 0, 0, 1, 1,
-1.348886, 0.2264145, -2.123259, 1, 0, 0, 1, 1,
-1.348639, 0.1328152, -0.0669108, 1, 0, 0, 1, 1,
-1.346229, 0.9759033, -0.3663922, 1, 0, 0, 1, 1,
-1.345158, 0.3482308, -2.751813, 0, 0, 0, 1, 1,
-1.333207, 0.2740061, -2.935193, 0, 0, 0, 1, 1,
-1.326775, -0.0832077, -2.224773, 0, 0, 0, 1, 1,
-1.32329, 0.389468, -1.870084, 0, 0, 0, 1, 1,
-1.321825, -0.1269963, -0.9887617, 0, 0, 0, 1, 1,
-1.318075, 0.08460662, -1.856039, 0, 0, 0, 1, 1,
-1.316349, -0.4742935, -2.251881, 0, 0, 0, 1, 1,
-1.314201, 0.4595093, -0.8748199, 1, 1, 1, 1, 1,
-1.303519, 1.244003, -1.489539, 1, 1, 1, 1, 1,
-1.294535, -0.4110177, -2.484243, 1, 1, 1, 1, 1,
-1.287924, 1.271242, -1.025694, 1, 1, 1, 1, 1,
-1.287113, 0.2533771, 0.9966562, 1, 1, 1, 1, 1,
-1.28327, -0.5477189, -1.111069, 1, 1, 1, 1, 1,
-1.27934, -1.131989, -1.583954, 1, 1, 1, 1, 1,
-1.278281, -0.5135184, -2.31203, 1, 1, 1, 1, 1,
-1.261008, 0.274633, 0.005428554, 1, 1, 1, 1, 1,
-1.259182, 0.0587666, -1.187384, 1, 1, 1, 1, 1,
-1.241041, -0.4354723, -2.854242, 1, 1, 1, 1, 1,
-1.236795, 0.782981, -1.552112, 1, 1, 1, 1, 1,
-1.233845, -0.3762518, -1.884531, 1, 1, 1, 1, 1,
-1.233087, 1.758552, -1.058412, 1, 1, 1, 1, 1,
-1.229786, 0.2499897, -1.615264, 1, 1, 1, 1, 1,
-1.227168, 0.7457284, -1.650956, 0, 0, 1, 1, 1,
-1.224287, 0.7889946, -0.9231806, 1, 0, 0, 1, 1,
-1.219209, 2.855551, 0.3392761, 1, 0, 0, 1, 1,
-1.214177, -0.7810786, -1.675626, 1, 0, 0, 1, 1,
-1.20729, 0.1113119, -0.5417523, 1, 0, 0, 1, 1,
-1.205563, 0.8499636, 0.1334928, 1, 0, 0, 1, 1,
-1.204831, -0.182167, -2.615263, 0, 0, 0, 1, 1,
-1.198724, 0.769214, 0.1885722, 0, 0, 0, 1, 1,
-1.197053, 0.1240907, -1.726799, 0, 0, 0, 1, 1,
-1.190711, 0.2643357, -2.812282, 0, 0, 0, 1, 1,
-1.189959, 1.486237, -0.5825953, 0, 0, 0, 1, 1,
-1.18317, -0.393898, -3.130906, 0, 0, 0, 1, 1,
-1.173108, 0.3987619, -1.837355, 0, 0, 0, 1, 1,
-1.16699, -0.6170035, -0.9241493, 1, 1, 1, 1, 1,
-1.165812, 0.1273074, 0.04044168, 1, 1, 1, 1, 1,
-1.153174, 1.216641, -0.5824044, 1, 1, 1, 1, 1,
-1.142058, 0.5334472, -2.315619, 1, 1, 1, 1, 1,
-1.134822, 1.906191, -0.07397164, 1, 1, 1, 1, 1,
-1.133559, 2.044566, -1.810217, 1, 1, 1, 1, 1,
-1.133037, 0.1557955, -0.8130776, 1, 1, 1, 1, 1,
-1.130138, 0.1546164, -1.571262, 1, 1, 1, 1, 1,
-1.127879, 0.7427225, -2.53039, 1, 1, 1, 1, 1,
-1.12777, 0.001254902, -1.044175, 1, 1, 1, 1, 1,
-1.124238, -1.089377, -2.842731, 1, 1, 1, 1, 1,
-1.122592, -0.4926607, -1.159201, 1, 1, 1, 1, 1,
-1.117775, 0.3980017, -0.7923469, 1, 1, 1, 1, 1,
-1.110736, -0.1158873, -2.293677, 1, 1, 1, 1, 1,
-1.091103, -0.1633588, -0.6657882, 1, 1, 1, 1, 1,
-1.088932, -0.1073434, -2.187398, 0, 0, 1, 1, 1,
-1.088201, 0.3294897, -1.046488, 1, 0, 0, 1, 1,
-1.088099, -1.066771, -1.356629, 1, 0, 0, 1, 1,
-1.079691, -0.580617, -3.115796, 1, 0, 0, 1, 1,
-1.075739, -1.170629, -0.6243429, 1, 0, 0, 1, 1,
-1.074188, 0.9941159, -0.1724251, 1, 0, 0, 1, 1,
-1.073063, -0.8984612, -2.669986, 0, 0, 0, 1, 1,
-1.065622, -0.8303939, -0.9572763, 0, 0, 0, 1, 1,
-1.065488, -0.7345456, -1.831138, 0, 0, 0, 1, 1,
-1.064515, -0.410564, -1.460793, 0, 0, 0, 1, 1,
-1.064013, -0.7341501, -1.981181, 0, 0, 0, 1, 1,
-1.061911, 0.4409831, -1.409972, 0, 0, 0, 1, 1,
-1.060382, -0.5104001, -1.843617, 0, 0, 0, 1, 1,
-1.05693, 0.3912134, 1.745907, 1, 1, 1, 1, 1,
-1.055143, 3.066241, 0.5356506, 1, 1, 1, 1, 1,
-1.048568, -0.9579032, -2.027666, 1, 1, 1, 1, 1,
-1.046148, -0.3622689, -1.687997, 1, 1, 1, 1, 1,
-1.044869, 1.056547, -0.4962828, 1, 1, 1, 1, 1,
-1.039355, 1.530859, 1.676019, 1, 1, 1, 1, 1,
-1.032743, 1.589171, 0.1868926, 1, 1, 1, 1, 1,
-1.015422, 0.4904622, -1.410513, 1, 1, 1, 1, 1,
-1.013175, 1.605309, -0.4206859, 1, 1, 1, 1, 1,
-1.013116, -0.6914884, -0.2514582, 1, 1, 1, 1, 1,
-1.012155, -0.3628223, -2.534028, 1, 1, 1, 1, 1,
-1.004445, -0.2107289, -0.3331921, 1, 1, 1, 1, 1,
-0.9935798, 2.58027, -0.5182694, 1, 1, 1, 1, 1,
-0.9929815, 0.4303594, -1.162057, 1, 1, 1, 1, 1,
-0.9921008, 0.3264777, -2.342757, 1, 1, 1, 1, 1,
-0.9881583, 0.337418, -2.336803, 0, 0, 1, 1, 1,
-0.9826167, -1.442843, -2.252499, 1, 0, 0, 1, 1,
-0.9771582, 0.01631096, -1.299843, 1, 0, 0, 1, 1,
-0.9484825, -1.423167, -1.878386, 1, 0, 0, 1, 1,
-0.9483639, -0.8187273, -0.8068611, 1, 0, 0, 1, 1,
-0.9479738, -1.790653, -3.145644, 1, 0, 0, 1, 1,
-0.9430237, -1.022935, -2.314423, 0, 0, 0, 1, 1,
-0.942215, 0.3160177, -2.08144, 0, 0, 0, 1, 1,
-0.9413335, -0.1787099, -0.6681319, 0, 0, 0, 1, 1,
-0.9402969, -0.2241934, -0.3136883, 0, 0, 0, 1, 1,
-0.9376271, -0.8403689, -2.471555, 0, 0, 0, 1, 1,
-0.9374667, 0.2871225, -0.8280584, 0, 0, 0, 1, 1,
-0.9337356, 0.8483843, -2.446814, 0, 0, 0, 1, 1,
-0.9334526, 0.2200975, -3.096022, 1, 1, 1, 1, 1,
-0.9301125, 0.4486572, -1.046558, 1, 1, 1, 1, 1,
-0.9300172, -0.5514906, -1.805224, 1, 1, 1, 1, 1,
-0.9299245, 0.4039528, -1.313275, 1, 1, 1, 1, 1,
-0.9197378, -0.003843212, -1.543668, 1, 1, 1, 1, 1,
-0.9181024, -1.457587, -4.554236, 1, 1, 1, 1, 1,
-0.9179391, 0.07294457, -0.6538336, 1, 1, 1, 1, 1,
-0.9148858, 0.3939213, -0.2047788, 1, 1, 1, 1, 1,
-0.9120584, 0.1989846, -1.902354, 1, 1, 1, 1, 1,
-0.9116008, 0.08408263, -1.126054, 1, 1, 1, 1, 1,
-0.9085807, 1.299775, -2.477677, 1, 1, 1, 1, 1,
-0.9083365, 0.345585, -0.3267891, 1, 1, 1, 1, 1,
-0.9072295, 0.9220711, -0.4744816, 1, 1, 1, 1, 1,
-0.9012379, 1.767535, 0.718834, 1, 1, 1, 1, 1,
-0.9000111, -0.4915626, -2.279359, 1, 1, 1, 1, 1,
-0.8979962, -1.477524, -3.775581, 0, 0, 1, 1, 1,
-0.894228, -0.4120218, -1.676128, 1, 0, 0, 1, 1,
-0.8934116, -0.4863738, -1.199586, 1, 0, 0, 1, 1,
-0.8916991, 0.208287, -0.7432871, 1, 0, 0, 1, 1,
-0.8862566, 0.7473028, 0.7267237, 1, 0, 0, 1, 1,
-0.8859485, 0.6256137, -0.9986495, 1, 0, 0, 1, 1,
-0.8763317, 1.185908, -3.084859, 0, 0, 0, 1, 1,
-0.8751141, -1.434296, -3.005162, 0, 0, 0, 1, 1,
-0.8750854, 2.196815, -0.7712828, 0, 0, 0, 1, 1,
-0.8709554, -0.6003259, -3.802379, 0, 0, 0, 1, 1,
-0.8702855, 0.9431857, -0.7185288, 0, 0, 0, 1, 1,
-0.8701074, 0.2503374, -1.096383, 0, 0, 0, 1, 1,
-0.8685166, 0.4638924, 0.2211464, 0, 0, 0, 1, 1,
-0.8653906, 0.9219544, -1.960343, 1, 1, 1, 1, 1,
-0.8625518, 0.3455583, -0.05174778, 1, 1, 1, 1, 1,
-0.8619418, 0.7598099, -0.765588, 1, 1, 1, 1, 1,
-0.8610384, 1.002008, 0.223594, 1, 1, 1, 1, 1,
-0.8568738, -0.5609655, -3.349122, 1, 1, 1, 1, 1,
-0.8464667, 0.9064831, 0.3881696, 1, 1, 1, 1, 1,
-0.8453178, 0.430123, -2.062563, 1, 1, 1, 1, 1,
-0.8439902, 1.24669, -0.4188458, 1, 1, 1, 1, 1,
-0.8419209, -0.8968732, -1.559873, 1, 1, 1, 1, 1,
-0.8379118, -1.987768, -2.592073, 1, 1, 1, 1, 1,
-0.8366649, 0.1869483, -1.509986, 1, 1, 1, 1, 1,
-0.8329233, 0.205305, -3.236811, 1, 1, 1, 1, 1,
-0.8314046, 0.9854435, -0.1665569, 1, 1, 1, 1, 1,
-0.8311567, -0.4791608, -0.7627638, 1, 1, 1, 1, 1,
-0.8279471, 1.455233, -0.9170446, 1, 1, 1, 1, 1,
-0.8196982, 1.563229, 0.003663235, 0, 0, 1, 1, 1,
-0.8175799, 1.706834, 0.2175252, 1, 0, 0, 1, 1,
-0.8158677, 0.75098, -0.6885658, 1, 0, 0, 1, 1,
-0.8151523, 0.5861779, -1.450774, 1, 0, 0, 1, 1,
-0.8096943, 0.8679855, -0.6970489, 1, 0, 0, 1, 1,
-0.8091527, 2.385254, -0.1253316, 1, 0, 0, 1, 1,
-0.8086238, 1.025819, -1.38356, 0, 0, 0, 1, 1,
-0.8080177, -0.1400781, -2.062422, 0, 0, 0, 1, 1,
-0.8077177, -2.726881, -1.363512, 0, 0, 0, 1, 1,
-0.8014035, -0.6309747, -1.742017, 0, 0, 0, 1, 1,
-0.7994436, 0.394621, -1.372558, 0, 0, 0, 1, 1,
-0.792693, -0.5040694, -0.9296088, 0, 0, 0, 1, 1,
-0.7877647, -1.756857, -4.0173, 0, 0, 0, 1, 1,
-0.7865855, -1.437155, -3.242051, 1, 1, 1, 1, 1,
-0.785603, 1.90766, -1.983816, 1, 1, 1, 1, 1,
-0.7842034, -0.4572963, -3.174668, 1, 1, 1, 1, 1,
-0.7838951, 0.1824206, -0.9686903, 1, 1, 1, 1, 1,
-0.7838562, -0.1046235, -2.570316, 1, 1, 1, 1, 1,
-0.7753671, 0.6795612, 0.2399197, 1, 1, 1, 1, 1,
-0.7745122, 0.1674458, -2.135174, 1, 1, 1, 1, 1,
-0.7727634, 0.6871342, -0.9133195, 1, 1, 1, 1, 1,
-0.7675357, -1.112485, -4.118892, 1, 1, 1, 1, 1,
-0.7630022, 0.4025731, -1.318589, 1, 1, 1, 1, 1,
-0.7614244, 0.4194632, 0.221089, 1, 1, 1, 1, 1,
-0.7605144, 0.3967429, -1.209846, 1, 1, 1, 1, 1,
-0.7547509, -0.439848, -3.507879, 1, 1, 1, 1, 1,
-0.7539184, -1.376558, -1.442669, 1, 1, 1, 1, 1,
-0.7521569, 0.7993431, -2.708177, 1, 1, 1, 1, 1,
-0.744705, -2.462482, -3.06318, 0, 0, 1, 1, 1,
-0.7434183, -1.376346, -1.264708, 1, 0, 0, 1, 1,
-0.7366153, -1.156112, -2.795436, 1, 0, 0, 1, 1,
-0.7332627, 0.7003145, -0.7213618, 1, 0, 0, 1, 1,
-0.7326455, -0.1108667, -0.9496439, 1, 0, 0, 1, 1,
-0.7325916, -0.07074358, -1.641493, 1, 0, 0, 1, 1,
-0.7232633, -0.7063251, -2.451342, 0, 0, 0, 1, 1,
-0.7212669, 1.414967, -1.106827, 0, 0, 0, 1, 1,
-0.7185894, -0.1858955, -0.894414, 0, 0, 0, 1, 1,
-0.7179304, 0.5061538, -0.07518215, 0, 0, 0, 1, 1,
-0.7167208, -0.5459214, -1.304206, 0, 0, 0, 1, 1,
-0.7154257, 0.7498789, -1.885923, 0, 0, 0, 1, 1,
-0.7096829, -0.2079948, -0.1770878, 0, 0, 0, 1, 1,
-0.7073393, -1.103519, -3.059811, 1, 1, 1, 1, 1,
-0.6960164, -1.082847, -2.797991, 1, 1, 1, 1, 1,
-0.693065, 1.996422, -0.6427876, 1, 1, 1, 1, 1,
-0.6923187, 0.8892707, 0.4997891, 1, 1, 1, 1, 1,
-0.6903937, -1.159661, -2.902792, 1, 1, 1, 1, 1,
-0.6879176, 1.160044, -0.4457604, 1, 1, 1, 1, 1,
-0.6794433, -0.424083, 0.7273642, 1, 1, 1, 1, 1,
-0.677123, 0.9088023, -0.6947009, 1, 1, 1, 1, 1,
-0.6758055, -0.7445785, -0.634295, 1, 1, 1, 1, 1,
-0.6742235, 1.231155, -1.325814, 1, 1, 1, 1, 1,
-0.6736948, -0.9813814, -0.7223876, 1, 1, 1, 1, 1,
-0.6725528, 0.09634019, -1.602709, 1, 1, 1, 1, 1,
-0.6697845, -1.009754, -3.13455, 1, 1, 1, 1, 1,
-0.669448, -0.4281163, -2.181741, 1, 1, 1, 1, 1,
-0.6688716, 1.045046, -0.6773247, 1, 1, 1, 1, 1,
-0.6683031, 1.203954, -1.04269, 0, 0, 1, 1, 1,
-0.6670819, 0.4408081, -2.278454, 1, 0, 0, 1, 1,
-0.6567414, 1.319316, -0.5733045, 1, 0, 0, 1, 1,
-0.655463, -1.275616, -4.440753, 1, 0, 0, 1, 1,
-0.649998, -1.109168, -2.88022, 1, 0, 0, 1, 1,
-0.6422782, 1.075358, -1.410118, 1, 0, 0, 1, 1,
-0.6376816, 1.66407, 1.766404, 0, 0, 0, 1, 1,
-0.6311879, 0.8117248, -0.4692406, 0, 0, 0, 1, 1,
-0.6281247, 1.767616, 0.5793254, 0, 0, 0, 1, 1,
-0.6234982, 0.754234, -1.638884, 0, 0, 0, 1, 1,
-0.6199864, -0.1406724, -1.982493, 0, 0, 0, 1, 1,
-0.6137955, -0.7766333, -2.039216, 0, 0, 0, 1, 1,
-0.5993915, 0.9549983, -1.22712, 0, 0, 0, 1, 1,
-0.5887888, -0.01843139, -2.923413, 1, 1, 1, 1, 1,
-0.5886313, 0.7574599, 1.07301, 1, 1, 1, 1, 1,
-0.5857986, 1.719443, -1.605059, 1, 1, 1, 1, 1,
-0.5834957, -0.05529294, -1.103224, 1, 1, 1, 1, 1,
-0.581134, 0.2822057, 0.07817706, 1, 1, 1, 1, 1,
-0.5764143, -0.4060936, -2.654692, 1, 1, 1, 1, 1,
-0.5746899, 0.4717505, -0.8213082, 1, 1, 1, 1, 1,
-0.5712149, -0.2989552, -2.410721, 1, 1, 1, 1, 1,
-0.5706555, 0.7432073, -0.5566456, 1, 1, 1, 1, 1,
-0.5671388, 1.137981, -1.655653, 1, 1, 1, 1, 1,
-0.5669024, -0.1851449, -1.792281, 1, 1, 1, 1, 1,
-0.5641047, 0.3125187, -1.698138, 1, 1, 1, 1, 1,
-0.562173, -0.8843213, -2.10216, 1, 1, 1, 1, 1,
-0.5616959, -0.9193033, -1.948694, 1, 1, 1, 1, 1,
-0.5564556, 0.8389818, -0.4949864, 1, 1, 1, 1, 1,
-0.5562375, -0.1856996, -2.05145, 0, 0, 1, 1, 1,
-0.5524082, -1.086738, -1.792874, 1, 0, 0, 1, 1,
-0.5409181, 0.6985736, -0.8474979, 1, 0, 0, 1, 1,
-0.538043, -0.6241015, -1.620491, 1, 0, 0, 1, 1,
-0.537376, -0.3227493, -1.917147, 1, 0, 0, 1, 1,
-0.5368686, 0.2438244, -1.328771, 1, 0, 0, 1, 1,
-0.5364301, 0.1115994, -1.747941, 0, 0, 0, 1, 1,
-0.531363, -0.438951, -2.441066, 0, 0, 0, 1, 1,
-0.5287108, 1.088778, -1.543613, 0, 0, 0, 1, 1,
-0.5282272, 0.3291757, -0.1357716, 0, 0, 0, 1, 1,
-0.5228413, -0.7807051, -3.183649, 0, 0, 0, 1, 1,
-0.519142, -1.311014, -3.718063, 0, 0, 0, 1, 1,
-0.5182224, 0.07719819, -0.9347028, 0, 0, 0, 1, 1,
-0.5167338, 0.5976461, 0.9676621, 1, 1, 1, 1, 1,
-0.516061, -0.5283671, -2.243367, 1, 1, 1, 1, 1,
-0.5133274, -0.2413754, -2.186243, 1, 1, 1, 1, 1,
-0.5120427, 0.1529158, -1.21643, 1, 1, 1, 1, 1,
-0.506647, -2.114798, -1.860811, 1, 1, 1, 1, 1,
-0.5060098, 0.6866729, 0.1423825, 1, 1, 1, 1, 1,
-0.5039631, -0.3320757, -1.51779, 1, 1, 1, 1, 1,
-0.5030388, 0.8921669, -0.04474046, 1, 1, 1, 1, 1,
-0.5007867, 0.1929742, -0.6388602, 1, 1, 1, 1, 1,
-0.492351, -0.7900699, -2.580301, 1, 1, 1, 1, 1,
-0.4915306, 0.2402514, -1.953813, 1, 1, 1, 1, 1,
-0.4893862, -1.535547, -2.462009, 1, 1, 1, 1, 1,
-0.4891556, -1.618019, -2.467699, 1, 1, 1, 1, 1,
-0.4860197, 0.5100442, -0.2843547, 1, 1, 1, 1, 1,
-0.4836411, -0.7390642, -1.434435, 1, 1, 1, 1, 1,
-0.4829444, -0.168279, -0.6933828, 0, 0, 1, 1, 1,
-0.4825891, 1.102091, 0.06914023, 1, 0, 0, 1, 1,
-0.4797015, -0.2048632, -1.218176, 1, 0, 0, 1, 1,
-0.4779213, -0.9279296, -2.568567, 1, 0, 0, 1, 1,
-0.4772952, -0.4176887, -2.674453, 1, 0, 0, 1, 1,
-0.475614, -0.2985626, -2.218817, 1, 0, 0, 1, 1,
-0.4747377, -0.4546867, -2.242826, 0, 0, 0, 1, 1,
-0.4698886, 2.130254, -1.842633, 0, 0, 0, 1, 1,
-0.4698113, -0.9285845, -2.644254, 0, 0, 0, 1, 1,
-0.4697733, -0.1195152, -1.092619, 0, 0, 0, 1, 1,
-0.4692329, 1.311656, 0.07985324, 0, 0, 0, 1, 1,
-0.4663898, -0.4175782, -1.878161, 0, 0, 0, 1, 1,
-0.4644165, 0.1863124, -2.223727, 0, 0, 0, 1, 1,
-0.4599315, 0.2869984, -1.238209, 1, 1, 1, 1, 1,
-0.4594792, 1.731214, 0.3329048, 1, 1, 1, 1, 1,
-0.4544656, 0.4186392, -1.771038, 1, 1, 1, 1, 1,
-0.4535276, -1.386495, -3.304422, 1, 1, 1, 1, 1,
-0.4468963, -0.7046283, -1.758267, 1, 1, 1, 1, 1,
-0.4436383, 1.05056, -1.885757, 1, 1, 1, 1, 1,
-0.4396568, 1.482427, -0.4639703, 1, 1, 1, 1, 1,
-0.438742, 0.5014794, -0.9454175, 1, 1, 1, 1, 1,
-0.4362118, -2.768573, -2.127628, 1, 1, 1, 1, 1,
-0.4360772, -2.589044, -3.008972, 1, 1, 1, 1, 1,
-0.4346115, 0.05540893, -2.238995, 1, 1, 1, 1, 1,
-0.4335464, -0.7406396, -1.893118, 1, 1, 1, 1, 1,
-0.4305026, -1.742706, -2.164931, 1, 1, 1, 1, 1,
-0.4288395, -1.247931, -2.341047, 1, 1, 1, 1, 1,
-0.4275658, 0.405629, -1.550656, 1, 1, 1, 1, 1,
-0.4254666, -0.8412947, -2.733816, 0, 0, 1, 1, 1,
-0.4222168, 0.4969522, -1.156685, 1, 0, 0, 1, 1,
-0.4212063, -1.069687, -2.852734, 1, 0, 0, 1, 1,
-0.4210641, 1.517015, 0.5594715, 1, 0, 0, 1, 1,
-0.4181432, 1.228188, -0.09127255, 1, 0, 0, 1, 1,
-0.4162617, -0.09886891, -2.213881, 1, 0, 0, 1, 1,
-0.4115508, 0.5481765, -4.145365, 0, 0, 0, 1, 1,
-0.4096576, 2.188162, -0.3334744, 0, 0, 0, 1, 1,
-0.4083369, -0.527918, -1.623695, 0, 0, 0, 1, 1,
-0.3992113, 0.6225395, -2.11041, 0, 0, 0, 1, 1,
-0.3948722, 0.6332533, -3.078984, 0, 0, 0, 1, 1,
-0.394803, 0.04354734, -0.8893685, 0, 0, 0, 1, 1,
-0.3930278, 0.7285772, -1.112449, 0, 0, 0, 1, 1,
-0.390871, 1.201063, -0.2041308, 1, 1, 1, 1, 1,
-0.3902279, -0.4663865, -2.666474, 1, 1, 1, 1, 1,
-0.3885739, 2.213115, -0.1364786, 1, 1, 1, 1, 1,
-0.387258, 0.08721137, -2.021515, 1, 1, 1, 1, 1,
-0.3822291, -0.08853341, -2.153142, 1, 1, 1, 1, 1,
-0.3813861, 0.3022355, -1.024804, 1, 1, 1, 1, 1,
-0.3780865, -0.4682186, -3.665823, 1, 1, 1, 1, 1,
-0.3730685, -1.419521, -3.700151, 1, 1, 1, 1, 1,
-0.3717935, -0.2220655, -2.491138, 1, 1, 1, 1, 1,
-0.3711532, 1.249861, 0.2365523, 1, 1, 1, 1, 1,
-0.3670966, -0.6409398, -3.703756, 1, 1, 1, 1, 1,
-0.3666295, 0.5992934, -0.0990391, 1, 1, 1, 1, 1,
-0.3558581, 0.7699833, -0.1263263, 1, 1, 1, 1, 1,
-0.350103, -1.752263, -3.528676, 1, 1, 1, 1, 1,
-0.3454813, 0.9336407, -0.9325436, 1, 1, 1, 1, 1,
-0.3447835, -0.9118584, -3.322738, 0, 0, 1, 1, 1,
-0.3322254, -0.876865, -2.829953, 1, 0, 0, 1, 1,
-0.331811, 0.8261352, 0.06987575, 1, 0, 0, 1, 1,
-0.3316227, 0.2514656, -1.086035, 1, 0, 0, 1, 1,
-0.3249483, 0.3565872, -1.971919, 1, 0, 0, 1, 1,
-0.3221229, -1.340884, -1.968189, 1, 0, 0, 1, 1,
-0.3214948, 0.2973358, -2.412871, 0, 0, 0, 1, 1,
-0.3143498, 1.76742, 0.7136748, 0, 0, 0, 1, 1,
-0.3126678, -0.07497378, -0.5185426, 0, 0, 0, 1, 1,
-0.3099216, 0.2254109, 0.1171016, 0, 0, 0, 1, 1,
-0.3084151, -0.3733633, -3.777457, 0, 0, 0, 1, 1,
-0.3058871, 0.8930993, -1.314457, 0, 0, 0, 1, 1,
-0.3018287, 1.188599, 0.1652967, 0, 0, 0, 1, 1,
-0.3017349, 1.549842, -0.136381, 1, 1, 1, 1, 1,
-0.2944012, -0.2071747, -1.073231, 1, 1, 1, 1, 1,
-0.2928486, 2.715355, 1.886786, 1, 1, 1, 1, 1,
-0.2891614, 0.4706778, -1.018044, 1, 1, 1, 1, 1,
-0.2835892, 0.7135715, -0.420197, 1, 1, 1, 1, 1,
-0.283174, 0.5442657, 0.4455706, 1, 1, 1, 1, 1,
-0.2824249, -0.2331716, -3.155874, 1, 1, 1, 1, 1,
-0.2788132, 0.05961199, -1.663335, 1, 1, 1, 1, 1,
-0.2767985, -0.1821155, -1.039495, 1, 1, 1, 1, 1,
-0.2685779, -0.7666394, -2.862644, 1, 1, 1, 1, 1,
-0.2668575, -0.3208612, -3.766019, 1, 1, 1, 1, 1,
-0.2640598, -1.005815, -1.920418, 1, 1, 1, 1, 1,
-0.2633657, -1.269086, -1.520276, 1, 1, 1, 1, 1,
-0.2615354, 0.5428239, 0.7677464, 1, 1, 1, 1, 1,
-0.2591035, 1.308991, 0.7942834, 1, 1, 1, 1, 1,
-0.2543511, -1.582294, -2.749643, 0, 0, 1, 1, 1,
-0.2542368, -0.5078478, -4.562548, 1, 0, 0, 1, 1,
-0.2405682, 0.253299, -0.3215754, 1, 0, 0, 1, 1,
-0.23645, -1.205969, -3.311334, 1, 0, 0, 1, 1,
-0.2346621, -1.176431, -2.495402, 1, 0, 0, 1, 1,
-0.231134, -0.417775, -2.290889, 1, 0, 0, 1, 1,
-0.2201186, 0.3076239, 0.2645701, 0, 0, 0, 1, 1,
-0.215382, -0.1004372, -0.347186, 0, 0, 0, 1, 1,
-0.2139395, -0.6655298, -3.544017, 0, 0, 0, 1, 1,
-0.2114131, -0.2366015, -5.735776, 0, 0, 0, 1, 1,
-0.2096072, -0.4526125, -2.88623, 0, 0, 0, 1, 1,
-0.1982401, -0.2594722, -2.327694, 0, 0, 0, 1, 1,
-0.1979378, -0.2222172, -1.505093, 0, 0, 0, 1, 1,
-0.1954707, 0.2544434, -0.9659677, 1, 1, 1, 1, 1,
-0.190326, 0.3316829, 0.361652, 1, 1, 1, 1, 1,
-0.189674, 0.9161208, -0.4937458, 1, 1, 1, 1, 1,
-0.1833123, -0.1721538, -1.089499, 1, 1, 1, 1, 1,
-0.1825543, 0.4032823, 0.2535559, 1, 1, 1, 1, 1,
-0.1819865, -1.319677, -3.450288, 1, 1, 1, 1, 1,
-0.1775571, -0.8645388, -2.321276, 1, 1, 1, 1, 1,
-0.1771335, 0.7338185, -1.536889, 1, 1, 1, 1, 1,
-0.1770945, -1.107395, -2.810797, 1, 1, 1, 1, 1,
-0.1770846, 0.01098697, 0.5130937, 1, 1, 1, 1, 1,
-0.1769761, 2.600227, 0.4951282, 1, 1, 1, 1, 1,
-0.1734284, 1.708249, -1.444423, 1, 1, 1, 1, 1,
-0.1619216, -0.4715533, -3.829806, 1, 1, 1, 1, 1,
-0.1566216, 0.3053187, -2.762524, 1, 1, 1, 1, 1,
-0.1525923, -0.01139327, -1.036231, 1, 1, 1, 1, 1,
-0.1476438, 2.133082, 0.5493469, 0, 0, 1, 1, 1,
-0.1377984, -0.6774168, -3.467584, 1, 0, 0, 1, 1,
-0.1366323, 0.3798309, 0.7220427, 1, 0, 0, 1, 1,
-0.1344283, 0.04592057, -1.306412, 1, 0, 0, 1, 1,
-0.1306082, -0.06945107, -2.769171, 1, 0, 0, 1, 1,
-0.1265591, -0.7637549, -3.492637, 1, 0, 0, 1, 1,
-0.1228087, 0.5893939, -0.2097007, 0, 0, 0, 1, 1,
-0.120911, 1.469212, 0.3406449, 0, 0, 0, 1, 1,
-0.1207475, 1.070811, -0.5740842, 0, 0, 0, 1, 1,
-0.1141092, 2.081169, -0.3969918, 0, 0, 0, 1, 1,
-0.1094823, -0.08075107, -4.17649, 0, 0, 0, 1, 1,
-0.1041525, 0.5963789, -0.6508484, 0, 0, 0, 1, 1,
-0.1033176, -1.377497, -2.797759, 0, 0, 0, 1, 1,
-0.1031816, -0.03227848, -0.8852226, 1, 1, 1, 1, 1,
-0.08562918, -0.9412508, -3.484656, 1, 1, 1, 1, 1,
-0.08369936, 0.3413525, 0.3159358, 1, 1, 1, 1, 1,
-0.08047727, 0.6755055, 1.405685, 1, 1, 1, 1, 1,
-0.07975728, 0.2570564, 0.5646335, 1, 1, 1, 1, 1,
-0.07813702, 0.655809, 1.83147, 1, 1, 1, 1, 1,
-0.07682437, 0.4382271, -1.426826, 1, 1, 1, 1, 1,
-0.07480302, 0.2749335, -0.2449609, 1, 1, 1, 1, 1,
-0.07343631, -1.26732, -0.5961211, 1, 1, 1, 1, 1,
-0.07112134, 0.4904199, -0.8738757, 1, 1, 1, 1, 1,
-0.07081015, 0.8900921, -0.1323818, 1, 1, 1, 1, 1,
-0.06963136, 0.7393448, -1.36079, 1, 1, 1, 1, 1,
-0.06890211, 1.218783, -0.4405523, 1, 1, 1, 1, 1,
-0.06318709, -1.456902, -4.124903, 1, 1, 1, 1, 1,
-0.0625352, -0.1762953, -4.127227, 1, 1, 1, 1, 1,
-0.06119016, -1.711223, -4.053397, 0, 0, 1, 1, 1,
-0.05736548, -0.03604533, -1.741679, 1, 0, 0, 1, 1,
-0.0571637, 0.8651949, -1.667501, 1, 0, 0, 1, 1,
-0.05566414, 1.053951, 0.1969799, 1, 0, 0, 1, 1,
-0.05405338, 1.661479, 1.604723, 1, 0, 0, 1, 1,
-0.05155033, 0.2929291, 0.03286839, 1, 0, 0, 1, 1,
-0.0465142, 0.6207467, -1.121508, 0, 0, 0, 1, 1,
-0.04344127, -0.5310874, -3.019319, 0, 0, 0, 1, 1,
-0.04257189, -0.3833715, -2.717255, 0, 0, 0, 1, 1,
-0.04167598, 1.022373, -0.2812461, 0, 0, 0, 1, 1,
-0.04161377, -1.222817, -3.354349, 0, 0, 0, 1, 1,
-0.04008561, 0.2328896, 0.208592, 0, 0, 0, 1, 1,
-0.03381783, 0.2809791, -0.610482, 0, 0, 0, 1, 1,
-0.02934237, -0.9145645, -3.319765, 1, 1, 1, 1, 1,
-0.02329825, 0.5711724, -3.013754, 1, 1, 1, 1, 1,
-0.01847945, 0.5702251, 0.9950129, 1, 1, 1, 1, 1,
-0.01545381, 0.3503874, 0.5211125, 1, 1, 1, 1, 1,
-0.01095753, -0.4388038, -2.938623, 1, 1, 1, 1, 1,
-0.01025778, -0.02927837, -1.991346, 1, 1, 1, 1, 1,
-0.01003868, 1.735317, 0.2782309, 1, 1, 1, 1, 1,
-0.009889217, -0.07131246, -2.716751, 1, 1, 1, 1, 1,
-0.009374351, -0.9029743, -3.339626, 1, 1, 1, 1, 1,
-0.002138744, 0.7088338, 1.544283, 1, 1, 1, 1, 1,
0.006579485, -0.3845601, 2.32476, 1, 1, 1, 1, 1,
0.01058423, 0.4604197, -0.6407285, 1, 1, 1, 1, 1,
0.01315729, 1.326005, 1.215439, 1, 1, 1, 1, 1,
0.01497355, -1.18785, 0.4546712, 1, 1, 1, 1, 1,
0.01534916, -0.1710136, 2.156635, 1, 1, 1, 1, 1,
0.01935112, 0.8857657, -0.3893102, 0, 0, 1, 1, 1,
0.02176769, -0.3581523, 2.279526, 1, 0, 0, 1, 1,
0.02297387, 1.79199, -1.156771, 1, 0, 0, 1, 1,
0.02322869, 1.070133, -0.6031424, 1, 0, 0, 1, 1,
0.02370609, 0.8123297, -1.423184, 1, 0, 0, 1, 1,
0.02403591, -1.744073, 2.067989, 1, 0, 0, 1, 1,
0.02617944, 1.206866, 1.452425, 0, 0, 0, 1, 1,
0.02836564, 0.1360587, 0.812381, 0, 0, 0, 1, 1,
0.0293423, -0.6180358, 3.528564, 0, 0, 0, 1, 1,
0.03148189, -0.983245, 5.58726, 0, 0, 0, 1, 1,
0.03671027, 1.121882, 0.6056769, 0, 0, 0, 1, 1,
0.04151518, 1.159656, -0.5911819, 0, 0, 0, 1, 1,
0.04176638, 0.2173989, 1.035797, 0, 0, 0, 1, 1,
0.04476983, 0.5655301, -0.340308, 1, 1, 1, 1, 1,
0.05615318, 2.082566, 2.194803, 1, 1, 1, 1, 1,
0.05645997, -1.69763, 3.345134, 1, 1, 1, 1, 1,
0.05781138, -0.1002507, 2.211917, 1, 1, 1, 1, 1,
0.05872174, -0.4716328, 3.03525, 1, 1, 1, 1, 1,
0.06628025, 0.5125946, -0.7087123, 1, 1, 1, 1, 1,
0.06713204, -2.194219, 3.352209, 1, 1, 1, 1, 1,
0.06963144, 0.9650083, 0.05269052, 1, 1, 1, 1, 1,
0.07042617, 0.06708395, 0.9487254, 1, 1, 1, 1, 1,
0.07120006, 1.679072, 1.34317, 1, 1, 1, 1, 1,
0.07315713, -0.03574309, 0.5889132, 1, 1, 1, 1, 1,
0.07522532, 0.3986638, -0.9580609, 1, 1, 1, 1, 1,
0.07576353, -2.285303, 2.841722, 1, 1, 1, 1, 1,
0.07896077, -0.1026767, 3.045259, 1, 1, 1, 1, 1,
0.08066317, 0.01533073, 0.6087191, 1, 1, 1, 1, 1,
0.08251656, -0.7138764, 4.043488, 0, 0, 1, 1, 1,
0.08601438, -1.50458, 3.382147, 1, 0, 0, 1, 1,
0.08742887, -0.9516004, 4.181839, 1, 0, 0, 1, 1,
0.09047763, -0.5346789, 1.228031, 1, 0, 0, 1, 1,
0.0923363, 0.7962158, 1.00339, 1, 0, 0, 1, 1,
0.09477353, 0.3000602, 0.3180597, 1, 0, 0, 1, 1,
0.09498698, 0.8770128, 1.299995, 0, 0, 0, 1, 1,
0.09648946, 0.8573888, 0.8577224, 0, 0, 0, 1, 1,
0.0967382, 1.118332, 0.3889396, 0, 0, 0, 1, 1,
0.1010102, -0.5461575, 2.702121, 0, 0, 0, 1, 1,
0.1092602, 1.452076, 1.003454, 0, 0, 0, 1, 1,
0.1112309, -0.09990143, 2.423505, 0, 0, 0, 1, 1,
0.1122806, 0.1627298, -0.5281687, 0, 0, 0, 1, 1,
0.1143097, -1.413661, 3.302525, 1, 1, 1, 1, 1,
0.1171173, -0.03810918, 2.071392, 1, 1, 1, 1, 1,
0.1171757, 0.05434584, -0.07907835, 1, 1, 1, 1, 1,
0.1204342, 0.4668563, -0.2616467, 1, 1, 1, 1, 1,
0.1253556, -0.1926776, 2.215255, 1, 1, 1, 1, 1,
0.1278653, 0.525551, -0.377389, 1, 1, 1, 1, 1,
0.1323814, 0.4923203, -0.6130417, 1, 1, 1, 1, 1,
0.1332268, 1.481301, -1.795924, 1, 1, 1, 1, 1,
0.1333001, -1.481232, 2.400876, 1, 1, 1, 1, 1,
0.1336164, -0.9963382, 3.190221, 1, 1, 1, 1, 1,
0.1394169, -0.2902055, 4.293087, 1, 1, 1, 1, 1,
0.1395329, -0.3179528, 2.881427, 1, 1, 1, 1, 1,
0.1432726, 0.2819083, 1.803452, 1, 1, 1, 1, 1,
0.1470104, 1.691427, 0.1097068, 1, 1, 1, 1, 1,
0.1477321, -1.905882, 2.399781, 1, 1, 1, 1, 1,
0.1513567, 0.5963157, -0.7444319, 0, 0, 1, 1, 1,
0.1513745, -0.05381513, 2.510276, 1, 0, 0, 1, 1,
0.1533996, -0.7734033, 1.842452, 1, 0, 0, 1, 1,
0.1549775, -0.1384856, 1.806237, 1, 0, 0, 1, 1,
0.1576013, -1.34291, 2.146217, 1, 0, 0, 1, 1,
0.1587791, 1.095843, -1.640525, 1, 0, 0, 1, 1,
0.1737152, -1.892594, 4.586707, 0, 0, 0, 1, 1,
0.174495, 1.91259, -1.177216, 0, 0, 0, 1, 1,
0.1770574, 0.1480355, 1.901378, 0, 0, 0, 1, 1,
0.1776398, -0.4923311, 2.533887, 0, 0, 0, 1, 1,
0.1840141, -0.01471849, 1.609982, 0, 0, 0, 1, 1,
0.184153, -0.5666276, 2.98891, 0, 0, 0, 1, 1,
0.1853193, 0.003581873, 0.1398775, 0, 0, 0, 1, 1,
0.187432, -0.3294759, 3.768468, 1, 1, 1, 1, 1,
0.187456, 0.8646739, 0.003160528, 1, 1, 1, 1, 1,
0.1931267, 0.9975774, 0.7346947, 1, 1, 1, 1, 1,
0.1942778, 0.4370818, 0.7505685, 1, 1, 1, 1, 1,
0.1945603, 2.589897, 0.8754492, 1, 1, 1, 1, 1,
0.1993676, -1.064522, 4.266313, 1, 1, 1, 1, 1,
0.1995526, 1.617009, 1.542378, 1, 1, 1, 1, 1,
0.2012151, -0.2759684, 3.114499, 1, 1, 1, 1, 1,
0.2033247, 0.2161521, 1.047245, 1, 1, 1, 1, 1,
0.2042888, 0.7306154, 2.000923, 1, 1, 1, 1, 1,
0.205028, 0.1568939, 2.522469, 1, 1, 1, 1, 1,
0.2055994, 0.4981181, -0.5201356, 1, 1, 1, 1, 1,
0.2064091, -1.659167, 2.730359, 1, 1, 1, 1, 1,
0.2099531, 0.5291322, -0.2786618, 1, 1, 1, 1, 1,
0.2127073, -0.4737512, 2.016823, 1, 1, 1, 1, 1,
0.2156725, 0.65969, -0.06809547, 0, 0, 1, 1, 1,
0.2172295, -0.6244047, 3.222106, 1, 0, 0, 1, 1,
0.2178576, -1.193112, 1.577182, 1, 0, 0, 1, 1,
0.2197147, -0.4564587, 3.668074, 1, 0, 0, 1, 1,
0.2242961, -0.2207301, 1.46592, 1, 0, 0, 1, 1,
0.2254989, -0.2863621, 2.784719, 1, 0, 0, 1, 1,
0.2263254, 1.389914, -0.3580517, 0, 0, 0, 1, 1,
0.228152, -1.509426, 4.163992, 0, 0, 0, 1, 1,
0.2298183, 0.5868075, 1.794269, 0, 0, 0, 1, 1,
0.2306812, 1.25043, -0.1142237, 0, 0, 0, 1, 1,
0.231982, 0.336328, 2.169316, 0, 0, 0, 1, 1,
0.2342196, 1.452822, 0.5168729, 0, 0, 0, 1, 1,
0.2355976, 0.4344803, -0.96666, 0, 0, 0, 1, 1,
0.2368244, -1.169688, 3.785155, 1, 1, 1, 1, 1,
0.2381307, -0.5906543, 1.6881, 1, 1, 1, 1, 1,
0.2402943, 0.9666092, 1.822559, 1, 1, 1, 1, 1,
0.2423236, -0.8988003, 1.133503, 1, 1, 1, 1, 1,
0.2439166, 0.1461573, 2.208784, 1, 1, 1, 1, 1,
0.2475046, -0.1082202, 2.134627, 1, 1, 1, 1, 1,
0.249195, -0.5478139, 2.526687, 1, 1, 1, 1, 1,
0.2502626, 0.2650482, 1.075571, 1, 1, 1, 1, 1,
0.2537258, -1.162656, 1.314568, 1, 1, 1, 1, 1,
0.2551872, 0.3883447, 0.08686775, 1, 1, 1, 1, 1,
0.2558235, -0.5852259, 3.147132, 1, 1, 1, 1, 1,
0.2560078, 0.7080145, 0.7522692, 1, 1, 1, 1, 1,
0.2565036, -0.7424753, 3.621795, 1, 1, 1, 1, 1,
0.2582261, -0.7143807, 1.316183, 1, 1, 1, 1, 1,
0.260394, -0.791101, 3.168735, 1, 1, 1, 1, 1,
0.2637741, 0.262092, 0.8143525, 0, 0, 1, 1, 1,
0.2656997, -1.830417, 2.760806, 1, 0, 0, 1, 1,
0.2657913, -0.8801781, 1.436742, 1, 0, 0, 1, 1,
0.2696637, -0.5538951, 2.222799, 1, 0, 0, 1, 1,
0.2745425, -1.626722, 2.969292, 1, 0, 0, 1, 1,
0.2761951, 0.8239387, 1.489044, 1, 0, 0, 1, 1,
0.2780786, -1.56488, 4.652961, 0, 0, 0, 1, 1,
0.2800342, -1.146752, 2.591998, 0, 0, 0, 1, 1,
0.2805962, 1.068493, 1.70909, 0, 0, 0, 1, 1,
0.282492, -0.5730828, 1.677391, 0, 0, 0, 1, 1,
0.286072, 0.4331767, 1.734779, 0, 0, 0, 1, 1,
0.2887405, -1.308393, 4.074809, 0, 0, 0, 1, 1,
0.2901027, 1.631432, 0.6560959, 0, 0, 0, 1, 1,
0.301609, -0.09646998, 2.482082, 1, 1, 1, 1, 1,
0.3051563, 1.017215, 0.1875251, 1, 1, 1, 1, 1,
0.3200367, 1.08344, 0.240813, 1, 1, 1, 1, 1,
0.3215802, 1.0531, 0.9020711, 1, 1, 1, 1, 1,
0.3216368, 0.3203462, -0.5142331, 1, 1, 1, 1, 1,
0.3284384, 0.6617968, 0.6614599, 1, 1, 1, 1, 1,
0.3300207, 1.265418, 0.7213951, 1, 1, 1, 1, 1,
0.3301319, 0.5997874, 1.614497, 1, 1, 1, 1, 1,
0.3322592, -0.9977869, 2.854995, 1, 1, 1, 1, 1,
0.3326264, -1.864068, 3.593369, 1, 1, 1, 1, 1,
0.3331707, -1.513444, 2.095313, 1, 1, 1, 1, 1,
0.3394497, -0.4569673, 3.696797, 1, 1, 1, 1, 1,
0.3506105, 0.9571574, 1.502124, 1, 1, 1, 1, 1,
0.3506139, 0.2947428, 2.383212, 1, 1, 1, 1, 1,
0.3506376, -0.5153587, 3.537588, 1, 1, 1, 1, 1,
0.3520654, 0.9130049, -1.256996, 0, 0, 1, 1, 1,
0.3539208, 0.7708666, -0.7306965, 1, 0, 0, 1, 1,
0.3584497, 0.1008234, 2.768563, 1, 0, 0, 1, 1,
0.3588079, 0.3579465, -0.09280833, 1, 0, 0, 1, 1,
0.3607855, -1.837228, 1.611493, 1, 0, 0, 1, 1,
0.3656022, 0.6209643, 0.508159, 1, 0, 0, 1, 1,
0.3664886, 2.003531, -0.9551237, 0, 0, 0, 1, 1,
0.370761, -1.826185, 3.322854, 0, 0, 0, 1, 1,
0.3734388, -0.893686, 2.819471, 0, 0, 0, 1, 1,
0.3741018, -1.008787, 3.647922, 0, 0, 0, 1, 1,
0.3799208, -0.7856902, 3.027152, 0, 0, 0, 1, 1,
0.3825349, -1.546781, 5.002943, 0, 0, 0, 1, 1,
0.383878, 0.7313547, 0.04653231, 0, 0, 0, 1, 1,
0.3840856, -0.4886735, 3.037375, 1, 1, 1, 1, 1,
0.3850992, 0.05924527, 0.8730059, 1, 1, 1, 1, 1,
0.3874765, 0.4294035, 1.009372, 1, 1, 1, 1, 1,
0.391448, 0.9118774, 0.7120122, 1, 1, 1, 1, 1,
0.3926569, 0.5551317, -0.1614837, 1, 1, 1, 1, 1,
0.3935781, -1.457397, 1.984883, 1, 1, 1, 1, 1,
0.3978458, -1.868627, 4.691567, 1, 1, 1, 1, 1,
0.3992942, -1.746281, 4.122962, 1, 1, 1, 1, 1,
0.4002855, -0.4868965, 3.68177, 1, 1, 1, 1, 1,
0.400377, -0.2026115, 2.231796, 1, 1, 1, 1, 1,
0.4040084, 1.076069, 2.038851, 1, 1, 1, 1, 1,
0.4063501, -2.032346, 0.8720493, 1, 1, 1, 1, 1,
0.4072187, -1.153709, 3.46927, 1, 1, 1, 1, 1,
0.4097943, -0.3714895, 3.222038, 1, 1, 1, 1, 1,
0.4098267, 0.2923035, 0.9126958, 1, 1, 1, 1, 1,
0.4100014, 1.596602, 0.006250811, 0, 0, 1, 1, 1,
0.4117965, -1.773261, 2.554444, 1, 0, 0, 1, 1,
0.4124137, -0.03801826, 1.534764, 1, 0, 0, 1, 1,
0.4124797, -2.291186, 4.958992, 1, 0, 0, 1, 1,
0.4136865, -1.107377, 2.047026, 1, 0, 0, 1, 1,
0.4169316, -0.4950248, 2.546066, 1, 0, 0, 1, 1,
0.4183908, -0.002794179, 0.4420522, 0, 0, 0, 1, 1,
0.419914, 0.2751136, -0.1952056, 0, 0, 0, 1, 1,
0.424794, 0.2841794, 1.521051, 0, 0, 0, 1, 1,
0.4277121, 0.555686, 0.2809037, 0, 0, 0, 1, 1,
0.4298315, 1.96733, 0.6916703, 0, 0, 0, 1, 1,
0.4347311, 1.383779, 1.04072, 0, 0, 0, 1, 1,
0.4459667, -1.282898, 3.357021, 0, 0, 0, 1, 1,
0.4471039, -0.361915, 2.866156, 1, 1, 1, 1, 1,
0.4527756, 0.378525, 2.257248, 1, 1, 1, 1, 1,
0.4546736, -0.4224698, 2.474309, 1, 1, 1, 1, 1,
0.4566196, -1.171155, 4.159647, 1, 1, 1, 1, 1,
0.4581749, -1.165722, 4.005536, 1, 1, 1, 1, 1,
0.4600662, -1.233255, 3.830672, 1, 1, 1, 1, 1,
0.4602364, 0.3936715, 1.716264, 1, 1, 1, 1, 1,
0.4633939, -0.2504543, 0.4811686, 1, 1, 1, 1, 1,
0.4669781, -0.6048855, 2.725465, 1, 1, 1, 1, 1,
0.4671273, -1.911882, 3.517479, 1, 1, 1, 1, 1,
0.4700531, -0.749942, 2.724719, 1, 1, 1, 1, 1,
0.4750645, 0.1309309, 2.9548, 1, 1, 1, 1, 1,
0.4762314, 1.173714, 1.235016, 1, 1, 1, 1, 1,
0.4775641, 0.3980787, 0.55044, 1, 1, 1, 1, 1,
0.4810786, -0.1888007, 1.259648, 1, 1, 1, 1, 1,
0.4841366, -0.3667721, 1.573271, 0, 0, 1, 1, 1,
0.4871466, -0.09372129, 3.211919, 1, 0, 0, 1, 1,
0.4875272, 1.346071, 0.04791566, 1, 0, 0, 1, 1,
0.4877153, -0.2882328, 2.109113, 1, 0, 0, 1, 1,
0.4905443, -0.8508812, 3.116102, 1, 0, 0, 1, 1,
0.4943429, -0.01356808, -0.007802223, 1, 0, 0, 1, 1,
0.4995912, 0.6305891, 1.157699, 0, 0, 0, 1, 1,
0.5088719, -0.04916815, 0.6257135, 0, 0, 0, 1, 1,
0.512067, -0.6995946, 3.48776, 0, 0, 0, 1, 1,
0.5127487, -2.097012, 0.6697179, 0, 0, 0, 1, 1,
0.5136807, -0.3463194, 1.034658, 0, 0, 0, 1, 1,
0.5143979, -1.16371, 4.607836, 0, 0, 0, 1, 1,
0.515155, 1.1049, -0.4594131, 0, 0, 0, 1, 1,
0.5166132, 1.334184, 0.4458396, 1, 1, 1, 1, 1,
0.5171307, -0.3051388, 1.562834, 1, 1, 1, 1, 1,
0.5204762, -0.3583401, 1.473699, 1, 1, 1, 1, 1,
0.5235858, 0.2138514, 2.652923, 1, 1, 1, 1, 1,
0.527306, 0.6673958, 0.7649324, 1, 1, 1, 1, 1,
0.5296257, 0.547212, 1.219807, 1, 1, 1, 1, 1,
0.5333084, 0.2704653, -0.2327996, 1, 1, 1, 1, 1,
0.5413418, -0.08897106, 1.074793, 1, 1, 1, 1, 1,
0.5413629, 1.396429, -0.03657258, 1, 1, 1, 1, 1,
0.5419071, -1.538369, 1.948096, 1, 1, 1, 1, 1,
0.5458196, -0.8536525, 1.913815, 1, 1, 1, 1, 1,
0.5468118, -0.3175888, 2.465948, 1, 1, 1, 1, 1,
0.5516241, -0.2865969, 2.424548, 1, 1, 1, 1, 1,
0.5538358, -0.06263309, 0.7936337, 1, 1, 1, 1, 1,
0.5548616, -0.8187067, 3.380922, 1, 1, 1, 1, 1,
0.5568912, -0.5115495, 1.702594, 0, 0, 1, 1, 1,
0.5604873, 1.000448, 1.048752, 1, 0, 0, 1, 1,
0.5629752, 0.100251, -1.29793, 1, 0, 0, 1, 1,
0.5634838, -0.289407, 2.407184, 1, 0, 0, 1, 1,
0.5641215, 2.040534, -1.313539, 1, 0, 0, 1, 1,
0.5642849, 0.08465499, 2.572476, 1, 0, 0, 1, 1,
0.5651122, -0.4623923, 1.937304, 0, 0, 0, 1, 1,
0.5654632, -0.7448172, 3.525557, 0, 0, 0, 1, 1,
0.5655118, 1.118067, 1.164775, 0, 0, 0, 1, 1,
0.5702099, -0.7544577, 1.687964, 0, 0, 0, 1, 1,
0.5710251, 0.8468964, 0.07263752, 0, 0, 0, 1, 1,
0.580402, -1.121754, 3.278535, 0, 0, 0, 1, 1,
0.5820535, -1.441918, 3.475339, 0, 0, 0, 1, 1,
0.5834219, 0.8410718, 0.6507351, 1, 1, 1, 1, 1,
0.5857225, 1.071363, 2.079506, 1, 1, 1, 1, 1,
0.5873314, 1.522159, -0.08121714, 1, 1, 1, 1, 1,
0.5891504, -0.320656, 3.003333, 1, 1, 1, 1, 1,
0.5892313, -2.339276, 3.543586, 1, 1, 1, 1, 1,
0.5913216, 0.3227595, 0.5742204, 1, 1, 1, 1, 1,
0.5944963, 1.148965, -0.9889331, 1, 1, 1, 1, 1,
0.5951375, 0.8438619, 1.345444, 1, 1, 1, 1, 1,
0.5967247, 0.6723093, 0.5013519, 1, 1, 1, 1, 1,
0.5989649, 0.8110004, 0.6318247, 1, 1, 1, 1, 1,
0.6019754, -0.01346264, 0.318424, 1, 1, 1, 1, 1,
0.6045464, 0.4867711, 2.709213, 1, 1, 1, 1, 1,
0.6084821, -1.601785, 3.142827, 1, 1, 1, 1, 1,
0.6100231, -0.08889991, 2.170929, 1, 1, 1, 1, 1,
0.611538, -0.8196621, 1.762467, 1, 1, 1, 1, 1,
0.613609, 1.300063, 2.124521, 0, 0, 1, 1, 1,
0.6143579, 0.1660577, 2.356338, 1, 0, 0, 1, 1,
0.6155561, -0.1736812, 1.615376, 1, 0, 0, 1, 1,
0.62067, 0.3028711, 0.2940643, 1, 0, 0, 1, 1,
0.6281437, 0.5223284, -0.6270199, 1, 0, 0, 1, 1,
0.6402851, 0.6440427, 1.02656, 1, 0, 0, 1, 1,
0.6408501, -0.4285556, 3.239189, 0, 0, 0, 1, 1,
0.6418052, -0.7643667, 3.281728, 0, 0, 0, 1, 1,
0.6425737, -0.342764, 3.276956, 0, 0, 0, 1, 1,
0.6460889, 0.1017492, 1.485713, 0, 0, 0, 1, 1,
0.6481385, 0.06565952, 0.9900333, 0, 0, 0, 1, 1,
0.6505771, -0.1969707, 0.5879002, 0, 0, 0, 1, 1,
0.6584542, 0.7536268, 0.642864, 0, 0, 0, 1, 1,
0.661149, -0.210109, -0.3991015, 1, 1, 1, 1, 1,
0.6647885, -1.328826, 2.010675, 1, 1, 1, 1, 1,
0.6671945, 0.9634032, 2.046593, 1, 1, 1, 1, 1,
0.6688449, -2.161909, 3.201544, 1, 1, 1, 1, 1,
0.6691844, 0.08741292, 0.4683368, 1, 1, 1, 1, 1,
0.6738653, -2.210665, 1.899539, 1, 1, 1, 1, 1,
0.6807409, 1.422599, 1.316624, 1, 1, 1, 1, 1,
0.682146, 0.1881206, 2.297839, 1, 1, 1, 1, 1,
0.6859996, -0.1942829, 1.805394, 1, 1, 1, 1, 1,
0.6930465, -1.413338, 1.009106, 1, 1, 1, 1, 1,
0.6966111, 1.3573, 0.8468208, 1, 1, 1, 1, 1,
0.6971023, 0.3048893, 1.137565, 1, 1, 1, 1, 1,
0.7108226, -0.3377852, 2.432267, 1, 1, 1, 1, 1,
0.7129315, -0.06244502, 2.423884, 1, 1, 1, 1, 1,
0.7144545, 0.3270088, 0.68132, 1, 1, 1, 1, 1,
0.7149119, -0.6932192, 3.549905, 0, 0, 1, 1, 1,
0.718661, 1.196029, 2.42283, 1, 0, 0, 1, 1,
0.7224349, -1.19919, 2.803725, 1, 0, 0, 1, 1,
0.7254739, 0.9810877, 2.170187, 1, 0, 0, 1, 1,
0.7274666, -0.4350312, 0.9337692, 1, 0, 0, 1, 1,
0.7284128, -0.7485946, 2.840837, 1, 0, 0, 1, 1,
0.7295787, 2.064036, -0.9045429, 0, 0, 0, 1, 1,
0.730023, -0.8458745, 2.424558, 0, 0, 0, 1, 1,
0.7356141, 1.041418, 0.6856785, 0, 0, 0, 1, 1,
0.7443824, 1.138987, 0.5386403, 0, 0, 0, 1, 1,
0.755686, -0.4635097, 3.079368, 0, 0, 0, 1, 1,
0.7583734, -0.2830942, 2.051803, 0, 0, 0, 1, 1,
0.7605435, -1.58748, 1.099307, 0, 0, 0, 1, 1,
0.7637442, 0.7819014, 1.732315, 1, 1, 1, 1, 1,
0.7637606, 0.5478944, 0.7380704, 1, 1, 1, 1, 1,
0.7645451, -1.410796, 2.97473, 1, 1, 1, 1, 1,
0.7694492, -1.596252, 0.758495, 1, 1, 1, 1, 1,
0.7699019, -0.1648371, 1.248215, 1, 1, 1, 1, 1,
0.7700341, 0.9121287, -0.9793068, 1, 1, 1, 1, 1,
0.7701201, -0.867465, 2.493446, 1, 1, 1, 1, 1,
0.7799047, -0.05844439, 0.9590417, 1, 1, 1, 1, 1,
0.7820857, 0.3266498, 2.715062, 1, 1, 1, 1, 1,
0.793238, -1.842178, 2.818059, 1, 1, 1, 1, 1,
0.8015589, -0.9240044, 2.152173, 1, 1, 1, 1, 1,
0.805528, 0.07672086, 1.90979, 1, 1, 1, 1, 1,
0.8066053, 1.244397, -0.3875018, 1, 1, 1, 1, 1,
0.8096327, -0.274757, 2.920456, 1, 1, 1, 1, 1,
0.8226048, -0.5803128, 1.14436, 1, 1, 1, 1, 1,
0.8237678, -0.8117602, 2.085741, 0, 0, 1, 1, 1,
0.8240201, -0.8520126, 1.420157, 1, 0, 0, 1, 1,
0.8248364, -0.9825959, 2.31252, 1, 0, 0, 1, 1,
0.8271438, -1.605842, 3.48026, 1, 0, 0, 1, 1,
0.8283656, 0.3758685, 1.397164, 1, 0, 0, 1, 1,
0.8315511, 0.893304, -0.2293722, 1, 0, 0, 1, 1,
0.8317646, -0.02435192, 1.265747, 0, 0, 0, 1, 1,
0.8336968, 0.1982263, 1.331802, 0, 0, 0, 1, 1,
0.8392034, -0.1517498, 2.369327, 0, 0, 0, 1, 1,
0.8527265, 0.6188197, 0.1895056, 0, 0, 0, 1, 1,
0.8530657, 1.524342, 0.3553515, 0, 0, 0, 1, 1,
0.8532616, -0.8817457, 2.767851, 0, 0, 0, 1, 1,
0.856316, 0.4816935, 0.2563944, 0, 0, 0, 1, 1,
0.8568678, -1.105879, 1.609485, 1, 1, 1, 1, 1,
0.8592, 1.577385, -0.2512184, 1, 1, 1, 1, 1,
0.8599584, 0.6257432, 2.191958, 1, 1, 1, 1, 1,
0.8629717, -0.4789979, 1.060405, 1, 1, 1, 1, 1,
0.8640233, 0.7733291, 0.3025634, 1, 1, 1, 1, 1,
0.8689392, 0.7327713, 0.9240363, 1, 1, 1, 1, 1,
0.8774651, -0.1342528, 2.717648, 1, 1, 1, 1, 1,
0.8839965, -1.217884, 2.664283, 1, 1, 1, 1, 1,
0.8879994, 0.9380437, 1.31664, 1, 1, 1, 1, 1,
0.8884189, -0.7526432, 2.15063, 1, 1, 1, 1, 1,
0.8915334, -0.3165267, 1.76005, 1, 1, 1, 1, 1,
0.8919526, 1.592983, 1.078762, 1, 1, 1, 1, 1,
0.8950897, -0.1089655, 1.015812, 1, 1, 1, 1, 1,
0.9019784, -0.2085862, 1.682709, 1, 1, 1, 1, 1,
0.9036534, 0.9334772, 0.7670954, 1, 1, 1, 1, 1,
0.9088306, 1.566411, -1.379514, 0, 0, 1, 1, 1,
0.9157778, 0.199296, 0.5407697, 1, 0, 0, 1, 1,
0.9186765, -1.762994, 3.952366, 1, 0, 0, 1, 1,
0.927013, 0.384285, 3.398467, 1, 0, 0, 1, 1,
0.9301295, 0.5223547, 0.6577471, 1, 0, 0, 1, 1,
0.9338009, 0.5540063, 0.7274758, 1, 0, 0, 1, 1,
0.9341349, -0.2358844, 0.5603257, 0, 0, 0, 1, 1,
0.9347078, 1.118954, 0.6923428, 0, 0, 0, 1, 1,
0.9366665, -0.3056756, -0.490233, 0, 0, 0, 1, 1,
0.9445106, -0.1291614, 2.417416, 0, 0, 0, 1, 1,
0.9535016, -0.7330116, 1.724137, 0, 0, 0, 1, 1,
0.9571436, -1.313224, 0.6475689, 0, 0, 0, 1, 1,
0.9601206, 0.04922297, 2.509507, 0, 0, 0, 1, 1,
0.9608482, -0.2624648, 0.8164354, 1, 1, 1, 1, 1,
0.9626756, 0.3825105, 1.734994, 1, 1, 1, 1, 1,
0.9645101, 0.08361671, 1.688717, 1, 1, 1, 1, 1,
0.9708166, 2.082734, -0.8383839, 1, 1, 1, 1, 1,
0.9736373, 0.5369838, 2.828229, 1, 1, 1, 1, 1,
0.9761716, -0.06131396, 1.16818, 1, 1, 1, 1, 1,
0.9807935, 0.4934459, 1.34492, 1, 1, 1, 1, 1,
0.9857204, 2.458195, 0.1243316, 1, 1, 1, 1, 1,
0.9880031, -0.629275, 2.185164, 1, 1, 1, 1, 1,
0.9893436, -0.1542273, 0.1065704, 1, 1, 1, 1, 1,
1.000034, 0.651742, 1.231623, 1, 1, 1, 1, 1,
1.003135, 0.5828245, 0.4797523, 1, 1, 1, 1, 1,
1.00582, -0.589873, 3.524188, 1, 1, 1, 1, 1,
1.006494, 0.1334454, 0.4133719, 1, 1, 1, 1, 1,
1.008799, -2.234753, 2.907689, 1, 1, 1, 1, 1,
1.012766, -0.4076372, 2.824375, 0, 0, 1, 1, 1,
1.016719, 0.2966177, 0.2438511, 1, 0, 0, 1, 1,
1.016988, 0.602511, 1.255771, 1, 0, 0, 1, 1,
1.0175, -0.03293558, 1.927654, 1, 0, 0, 1, 1,
1.02811, 0.3559096, 0.3994907, 1, 0, 0, 1, 1,
1.031942, 0.3037081, 0.1012167, 1, 0, 0, 1, 1,
1.037442, -0.1410339, 1.227381, 0, 0, 0, 1, 1,
1.038972, 1.13984, -0.1666798, 0, 0, 0, 1, 1,
1.043931, 0.7299571, 1.052248, 0, 0, 0, 1, 1,
1.043978, 0.2235973, 1.48186, 0, 0, 0, 1, 1,
1.047219, -0.2577406, 2.589911, 0, 0, 0, 1, 1,
1.061418, -0.7010334, 3.244282, 0, 0, 0, 1, 1,
1.071019, 1.077802, 1.419889, 0, 0, 0, 1, 1,
1.075966, 0.3872856, 0.4230433, 1, 1, 1, 1, 1,
1.081355, 0.06433537, 0.9005436, 1, 1, 1, 1, 1,
1.081553, -1.039663, 2.623912, 1, 1, 1, 1, 1,
1.085047, 1.118116, -0.1612919, 1, 1, 1, 1, 1,
1.086891, 1.015137, -0.06009106, 1, 1, 1, 1, 1,
1.091075, 0.125401, 1.255073, 1, 1, 1, 1, 1,
1.103767, -1.294345, 1.425299, 1, 1, 1, 1, 1,
1.106917, 0.01660085, 0.8192592, 1, 1, 1, 1, 1,
1.107907, -1.761575, 2.655809, 1, 1, 1, 1, 1,
1.111323, 0.684843, 1.780721, 1, 1, 1, 1, 1,
1.112877, 0.1036702, 1.522331, 1, 1, 1, 1, 1,
1.113062, 0.8879155, -0.748176, 1, 1, 1, 1, 1,
1.116552, -0.2319349, 1.19743, 1, 1, 1, 1, 1,
1.120466, 1.026802, -0.7960663, 1, 1, 1, 1, 1,
1.120934, 0.8349606, 0.3977806, 1, 1, 1, 1, 1,
1.128975, 1.507491, 0.7204956, 0, 0, 1, 1, 1,
1.134918, -1.825389, 1.957146, 1, 0, 0, 1, 1,
1.13569, -0.4736259, 1.513553, 1, 0, 0, 1, 1,
1.149344, -1.277163, 2.837603, 1, 0, 0, 1, 1,
1.152092, 0.3186484, 0.9168431, 1, 0, 0, 1, 1,
1.15243, 0.6485919, 3.918179, 1, 0, 0, 1, 1,
1.154766, 0.749029, 0.9910362, 0, 0, 0, 1, 1,
1.158648, -0.936194, 3.330156, 0, 0, 0, 1, 1,
1.170558, -0.2049018, 1.172595, 0, 0, 0, 1, 1,
1.176195, -0.7515638, 2.663832, 0, 0, 0, 1, 1,
1.185903, 0.729892, -0.6663534, 0, 0, 0, 1, 1,
1.190589, 0.06542741, 1.197453, 0, 0, 0, 1, 1,
1.194955, 0.4767309, 0.01005275, 0, 0, 0, 1, 1,
1.198523, 2.274161, 0.9187315, 1, 1, 1, 1, 1,
1.202971, -0.1052045, 1.184413, 1, 1, 1, 1, 1,
1.206895, -0.1615459, 1.710961, 1, 1, 1, 1, 1,
1.218736, -0.1381458, 2.46768, 1, 1, 1, 1, 1,
1.243429, 0.5698678, 1.282108, 1, 1, 1, 1, 1,
1.249484, -0.01607222, 2.938904, 1, 1, 1, 1, 1,
1.261996, 0.9928594, 0.4738071, 1, 1, 1, 1, 1,
1.270238, 1.5363, 1.916129, 1, 1, 1, 1, 1,
1.273761, -0.1160648, 2.937876, 1, 1, 1, 1, 1,
1.281299, 0.03813336, 2.974824, 1, 1, 1, 1, 1,
1.285967, 0.8765026, 3.527617, 1, 1, 1, 1, 1,
1.299765, -0.1406685, 1.736243, 1, 1, 1, 1, 1,
1.303994, -0.2223189, 1.19065, 1, 1, 1, 1, 1,
1.316676, -0.8685811, 1.109913, 1, 1, 1, 1, 1,
1.319605, 1.668522, 1.114217, 1, 1, 1, 1, 1,
1.329072, -0.486069, 0.7768891, 0, 0, 1, 1, 1,
1.331962, 0.6638188, 1.511944, 1, 0, 0, 1, 1,
1.334163, -0.2858741, 1.53834, 1, 0, 0, 1, 1,
1.348629, 0.7438029, 0.8689489, 1, 0, 0, 1, 1,
1.3577, 0.9114267, 2.503287, 1, 0, 0, 1, 1,
1.365642, 0.1649874, 1.946753, 1, 0, 0, 1, 1,
1.366996, 0.8053808, 2.262563, 0, 0, 0, 1, 1,
1.371259, -2.240626, 1.05562, 0, 0, 0, 1, 1,
1.371863, 0.8677148, 1.120307, 0, 0, 0, 1, 1,
1.381356, -0.7244785, 2.205739, 0, 0, 0, 1, 1,
1.390654, 0.635012, 1.424026, 0, 0, 0, 1, 1,
1.410105, 0.968715, -0.08690891, 0, 0, 0, 1, 1,
1.415426, 1.654046, -0.9133716, 0, 0, 0, 1, 1,
1.420467, 1.943357, -0.1963126, 1, 1, 1, 1, 1,
1.43025, 0.341681, -0.5173535, 1, 1, 1, 1, 1,
1.435286, 1.771865, 1.076661, 1, 1, 1, 1, 1,
1.461493, -0.9419487, 4.402436, 1, 1, 1, 1, 1,
1.476466, -0.1847844, 0.9620612, 1, 1, 1, 1, 1,
1.477392, -0.6350762, 1.890809, 1, 1, 1, 1, 1,
1.481836, 0.2184198, 0.5807778, 1, 1, 1, 1, 1,
1.493338, -0.2249316, 2.26499, 1, 1, 1, 1, 1,
1.497312, 0.7435036, -0.5356669, 1, 1, 1, 1, 1,
1.499136, -0.2809666, 0.6516623, 1, 1, 1, 1, 1,
1.513488, -0.6286253, 2.738247, 1, 1, 1, 1, 1,
1.514687, 2.607964, 0.6613883, 1, 1, 1, 1, 1,
1.533908, -1.3344, 4.465736, 1, 1, 1, 1, 1,
1.537062, 1.3857, 1.375619, 1, 1, 1, 1, 1,
1.549811, -1.205491, 1.681231, 1, 1, 1, 1, 1,
1.568048, 0.2720433, 3.008615, 0, 0, 1, 1, 1,
1.585317, 1.029253, 1.797937, 1, 0, 0, 1, 1,
1.5895, -1.300069, 2.996207, 1, 0, 0, 1, 1,
1.592417, -0.1763346, 1.651889, 1, 0, 0, 1, 1,
1.613356, -0.3696652, 1.536761, 1, 0, 0, 1, 1,
1.613716, 0.6703236, 1.556862, 1, 0, 0, 1, 1,
1.618997, 1.941456, -0.2441928, 0, 0, 0, 1, 1,
1.621786, 1.164689, 1.321253, 0, 0, 0, 1, 1,
1.629116, -0.4657111, 1.589987, 0, 0, 0, 1, 1,
1.64912, 0.1622095, 1.474559, 0, 0, 0, 1, 1,
1.651088, -0.1148882, 1.843294, 0, 0, 0, 1, 1,
1.699807, -2.532744, 2.145919, 0, 0, 0, 1, 1,
1.721932, 0.07236569, 2.798679, 0, 0, 0, 1, 1,
1.730446, 0.9597071, 0.3463544, 1, 1, 1, 1, 1,
1.738771, -2.026834, 4.103222, 1, 1, 1, 1, 1,
1.739426, -0.522693, 2.374441, 1, 1, 1, 1, 1,
1.745375, -1.008755, 2.596382, 1, 1, 1, 1, 1,
1.754261, 0.1209989, 2.042934, 1, 1, 1, 1, 1,
1.775079, -0.5016011, 2.871766, 1, 1, 1, 1, 1,
1.788946, 0.1869634, 1.32417, 1, 1, 1, 1, 1,
1.791877, 0.5104141, 0.5554342, 1, 1, 1, 1, 1,
1.796175, -0.513141, 2.476086, 1, 1, 1, 1, 1,
1.797052, 0.1507011, 3.345459, 1, 1, 1, 1, 1,
1.816905, 1.353819, -0.08119956, 1, 1, 1, 1, 1,
1.822838, -0.2342617, 1.638924, 1, 1, 1, 1, 1,
1.839004, -0.4827147, 0.5247964, 1, 1, 1, 1, 1,
1.844383, -0.5433722, 1.676184, 1, 1, 1, 1, 1,
1.852434, -0.2057102, 1.585181, 1, 1, 1, 1, 1,
1.854365, -1.273251, 2.116067, 0, 0, 1, 1, 1,
1.894413, -0.1747569, 1.637349, 1, 0, 0, 1, 1,
1.906722, 0.3280439, 1.249792, 1, 0, 0, 1, 1,
1.91093, 0.4369166, -1.813689, 1, 0, 0, 1, 1,
1.927592, 0.584345, 2.256248, 1, 0, 0, 1, 1,
2.069058, -0.01233854, 2.149264, 1, 0, 0, 1, 1,
2.133132, 0.7724293, 1.919823, 0, 0, 0, 1, 1,
2.188907, -0.2640589, 1.732841, 0, 0, 0, 1, 1,
2.224728, -0.1379944, 1.601272, 0, 0, 0, 1, 1,
2.242049, 1.048437, 2.394027, 0, 0, 0, 1, 1,
2.351034, -0.3566736, 0.1825038, 0, 0, 0, 1, 1,
2.40152, -1.215075, 1.588496, 0, 0, 0, 1, 1,
2.47368, 0.7834273, 3.108398, 0, 0, 0, 1, 1,
2.48875, 0.05666807, 1.798216, 1, 1, 1, 1, 1,
2.588639, 1.849041, 3.284239, 1, 1, 1, 1, 1,
2.63372, -0.2022052, 1.035139, 1, 1, 1, 1, 1,
2.692451, -2.895509, 3.067019, 1, 1, 1, 1, 1,
2.69541, -0.3873861, 1.651129, 1, 1, 1, 1, 1,
2.895938, 0.8803889, 3.274375, 1, 1, 1, 1, 1,
2.972037, 0.8214903, 2.052893, 1, 1, 1, 1, 1
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
var radius = 9.644804;
var distance = 33.87696;
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
mvMatrix.translate( 0.1089805, -0.08536577, 0.07425809 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.87696);
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
