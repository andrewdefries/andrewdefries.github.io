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
-3.579014, -0.194915, -1.86148, 1, 0, 0, 1,
-2.855978, 0.3976543, -2.884832, 1, 0.007843138, 0, 1,
-2.592111, 1.224068, -0.7088763, 1, 0.01176471, 0, 1,
-2.515298, -1.080848, -0.8453243, 1, 0.01960784, 0, 1,
-2.399595, 0.1468031, -0.789712, 1, 0.02352941, 0, 1,
-2.37085, -0.648811, -1.279995, 1, 0.03137255, 0, 1,
-2.308413, 1.380649, -1.90597, 1, 0.03529412, 0, 1,
-2.307682, -0.4598792, -2.595257, 1, 0.04313726, 0, 1,
-2.296531, 0.1493473, -1.080637, 1, 0.04705882, 0, 1,
-2.285136, 0.1730683, -0.5956007, 1, 0.05490196, 0, 1,
-2.278156, 0.0731976, -2.627151, 1, 0.05882353, 0, 1,
-2.263393, -1.017089, -1.991974, 1, 0.06666667, 0, 1,
-2.157958, 0.3583362, -2.329193, 1, 0.07058824, 0, 1,
-2.106084, -1.755046, -4.664791, 1, 0.07843138, 0, 1,
-2.076807, 0.1293688, -1.635143, 1, 0.08235294, 0, 1,
-2.060053, 2.191069, -0.5103105, 1, 0.09019608, 0, 1,
-2.045039, -1.198703, -3.215409, 1, 0.09411765, 0, 1,
-2.012446, -0.6188066, -1.699047, 1, 0.1019608, 0, 1,
-1.998834, 0.04996691, -1.8369, 1, 0.1098039, 0, 1,
-1.973599, 1.006817, -0.8242769, 1, 0.1137255, 0, 1,
-1.925323, -1.92545, -3.493052, 1, 0.1215686, 0, 1,
-1.919414, -0.7623965, -1.428528, 1, 0.1254902, 0, 1,
-1.916577, -0.5661481, -2.766222, 1, 0.1333333, 0, 1,
-1.903509, 0.2995274, -1.81305, 1, 0.1372549, 0, 1,
-1.891403, 2.232821, -0.9750429, 1, 0.145098, 0, 1,
-1.88853, 0.6631383, -1.598909, 1, 0.1490196, 0, 1,
-1.886151, -1.04441, -1.336063, 1, 0.1568628, 0, 1,
-1.874444, -2.00763, -2.206131, 1, 0.1607843, 0, 1,
-1.866413, -1.08417, -1.752663, 1, 0.1686275, 0, 1,
-1.853478, 0.516232, -1.605627, 1, 0.172549, 0, 1,
-1.834038, -0.1216878, -1.626848, 1, 0.1803922, 0, 1,
-1.819057, 1.144859, -0.1475296, 1, 0.1843137, 0, 1,
-1.793749, -0.6214076, -0.1381454, 1, 0.1921569, 0, 1,
-1.787451, 1.073214, 0.0890611, 1, 0.1960784, 0, 1,
-1.787148, -0.5223922, -0.4533815, 1, 0.2039216, 0, 1,
-1.779166, 0.3823196, -1.050816, 1, 0.2117647, 0, 1,
-1.770263, 0.7019514, 0.1137868, 1, 0.2156863, 0, 1,
-1.760745, 0.06371419, -1.788678, 1, 0.2235294, 0, 1,
-1.758001, -0.6204373, -4.109402, 1, 0.227451, 0, 1,
-1.703209, -1.062344, -1.900053, 1, 0.2352941, 0, 1,
-1.69613, -0.6344913, -3.483399, 1, 0.2392157, 0, 1,
-1.688709, 0.4857638, -1.464087, 1, 0.2470588, 0, 1,
-1.683907, 0.6317726, -1.107151, 1, 0.2509804, 0, 1,
-1.679469, 1.355111, -2.568567, 1, 0.2588235, 0, 1,
-1.670874, -0.1750485, -1.378375, 1, 0.2627451, 0, 1,
-1.65933, -0.3899459, -2.618004, 1, 0.2705882, 0, 1,
-1.645471, -0.02026855, -1.527339, 1, 0.2745098, 0, 1,
-1.643877, -0.8026057, -2.608367, 1, 0.282353, 0, 1,
-1.631393, 1.357237, -3.081853, 1, 0.2862745, 0, 1,
-1.614748, -0.7494032, -1.607231, 1, 0.2941177, 0, 1,
-1.609917, -0.4612081, -2.992908, 1, 0.3019608, 0, 1,
-1.564903, -0.02655167, -2.555528, 1, 0.3058824, 0, 1,
-1.56189, -0.320924, -2.892545, 1, 0.3137255, 0, 1,
-1.55472, -0.3625971, 0.9892681, 1, 0.3176471, 0, 1,
-1.552032, 0.8443816, -2.703323, 1, 0.3254902, 0, 1,
-1.550893, 0.7182674, -0.6946365, 1, 0.3294118, 0, 1,
-1.536515, 1.085337, 0.5228219, 1, 0.3372549, 0, 1,
-1.532085, 0.1993788, -1.331584, 1, 0.3411765, 0, 1,
-1.521889, 0.4885179, -0.09636592, 1, 0.3490196, 0, 1,
-1.520019, 1.614929, -0.4563529, 1, 0.3529412, 0, 1,
-1.50536, -1.33003, -1.303459, 1, 0.3607843, 0, 1,
-1.504361, -0.3852833, -4.534656, 1, 0.3647059, 0, 1,
-1.503169, -0.3698342, -2.053392, 1, 0.372549, 0, 1,
-1.486423, 0.4482997, -1.086659, 1, 0.3764706, 0, 1,
-1.483464, 1.152829, -1.49425, 1, 0.3843137, 0, 1,
-1.481483, -0.2170382, -1.046173, 1, 0.3882353, 0, 1,
-1.474145, 0.4063321, -1.249897, 1, 0.3960784, 0, 1,
-1.472337, -0.9495449, -2.240901, 1, 0.4039216, 0, 1,
-1.467822, -0.3305579, -2.05923, 1, 0.4078431, 0, 1,
-1.460606, 0.9490268, -2.034315, 1, 0.4156863, 0, 1,
-1.460468, -0.4033782, -1.002562, 1, 0.4196078, 0, 1,
-1.458446, -0.9366784, -4.389861, 1, 0.427451, 0, 1,
-1.445456, -1.036988, -2.902924, 1, 0.4313726, 0, 1,
-1.442731, 1.232093, -0.4811189, 1, 0.4392157, 0, 1,
-1.439594, 1.459313, -0.2220655, 1, 0.4431373, 0, 1,
-1.439122, -0.1018421, -1.439169, 1, 0.4509804, 0, 1,
-1.424045, 1.845579, -2.187193, 1, 0.454902, 0, 1,
-1.415143, -1.345072, -1.863925, 1, 0.4627451, 0, 1,
-1.410836, -0.4128928, 0.06851525, 1, 0.4666667, 0, 1,
-1.401622, 1.166757, -1.887985, 1, 0.4745098, 0, 1,
-1.401292, -0.3439601, -0.3395258, 1, 0.4784314, 0, 1,
-1.390025, -1.045806, -1.323191, 1, 0.4862745, 0, 1,
-1.370843, 0.3838818, -2.453521, 1, 0.4901961, 0, 1,
-1.362977, -0.8473616, -0.7506475, 1, 0.4980392, 0, 1,
-1.35991, -1.3681, -2.998431, 1, 0.5058824, 0, 1,
-1.355521, 1.326137, 0.2066969, 1, 0.509804, 0, 1,
-1.348289, 1.602529, -0.6655111, 1, 0.5176471, 0, 1,
-1.343157, 0.1851401, -2.081265, 1, 0.5215687, 0, 1,
-1.320653, 0.3039524, 0.3542254, 1, 0.5294118, 0, 1,
-1.319953, 0.6372747, 0.04303459, 1, 0.5333334, 0, 1,
-1.30004, 0.8521747, -0.4196103, 1, 0.5411765, 0, 1,
-1.297947, -0.660238, -1.216185, 1, 0.5450981, 0, 1,
-1.293345, 0.6037745, -2.242249, 1, 0.5529412, 0, 1,
-1.287259, 1.417627, -2.834992, 1, 0.5568628, 0, 1,
-1.286398, -1.575887, -0.7186731, 1, 0.5647059, 0, 1,
-1.284914, 0.07263827, -0.5027546, 1, 0.5686275, 0, 1,
-1.275006, 1.983831, -0.2363831, 1, 0.5764706, 0, 1,
-1.266029, -0.8164802, -2.768449, 1, 0.5803922, 0, 1,
-1.262488, 0.4956609, 0.5327087, 1, 0.5882353, 0, 1,
-1.260087, 1.74821, -0.2220802, 1, 0.5921569, 0, 1,
-1.246015, 0.2352991, -1.88486, 1, 0.6, 0, 1,
-1.237578, -1.160853, -3.236602, 1, 0.6078432, 0, 1,
-1.234605, -1.396991, -1.518538, 1, 0.6117647, 0, 1,
-1.228259, -0.2310967, -0.540402, 1, 0.6196079, 0, 1,
-1.224572, 1.442806, 0.4141728, 1, 0.6235294, 0, 1,
-1.21602, 0.2919139, -0.4201511, 1, 0.6313726, 0, 1,
-1.215909, 1.02319, -0.2826081, 1, 0.6352941, 0, 1,
-1.206773, 1.320356, -0.5767416, 1, 0.6431373, 0, 1,
-1.194835, -0.3490902, -2.969573, 1, 0.6470588, 0, 1,
-1.193485, 0.7558027, -1.342265, 1, 0.654902, 0, 1,
-1.185252, -0.2555208, -2.473947, 1, 0.6588235, 0, 1,
-1.183063, 1.127672, -1.161248, 1, 0.6666667, 0, 1,
-1.179053, 0.0145343, -2.148279, 1, 0.6705883, 0, 1,
-1.173, -0.5818264, -4.614549, 1, 0.6784314, 0, 1,
-1.172113, -0.3021981, -2.50333, 1, 0.682353, 0, 1,
-1.169403, -0.5614567, -1.671346, 1, 0.6901961, 0, 1,
-1.169001, -0.26197, -3.386121, 1, 0.6941177, 0, 1,
-1.168003, -1.457676, -2.455994, 1, 0.7019608, 0, 1,
-1.160955, 0.09553348, 0.03930901, 1, 0.7098039, 0, 1,
-1.160828, -0.6366501, 0.01354184, 1, 0.7137255, 0, 1,
-1.154152, -1.590679, -1.60679, 1, 0.7215686, 0, 1,
-1.145804, -0.05673773, -1.45633, 1, 0.7254902, 0, 1,
-1.142941, 0.949251, -0.7302178, 1, 0.7333333, 0, 1,
-1.137312, -1.099638, -1.469218, 1, 0.7372549, 0, 1,
-1.136002, -0.3394528, -3.394882, 1, 0.7450981, 0, 1,
-1.130621, 0.1660165, -0.02547504, 1, 0.7490196, 0, 1,
-1.125512, 2.026507, 0.2960003, 1, 0.7568628, 0, 1,
-1.125387, -0.1236006, -1.520095, 1, 0.7607843, 0, 1,
-1.116227, -1.37829, -2.109916, 1, 0.7686275, 0, 1,
-1.112928, 0.2632583, -1.510304, 1, 0.772549, 0, 1,
-1.103573, -1.178505, -1.997396, 1, 0.7803922, 0, 1,
-1.101815, -0.3144715, -2.909973, 1, 0.7843137, 0, 1,
-1.084668, 0.6822261, -1.074398, 1, 0.7921569, 0, 1,
-1.080186, 1.01692, -0.7805008, 1, 0.7960784, 0, 1,
-1.073216, 0.03445921, -0.9989911, 1, 0.8039216, 0, 1,
-1.07292, -1.461855, -2.7727, 1, 0.8117647, 0, 1,
-1.072136, 1.484424, -1.703423, 1, 0.8156863, 0, 1,
-1.067912, -2.054351, -1.018909, 1, 0.8235294, 0, 1,
-1.063906, -0.926175, -2.970206, 1, 0.827451, 0, 1,
-1.061939, -0.6891341, -2.366343, 1, 0.8352941, 0, 1,
-1.050746, 0.2701094, -0.641292, 1, 0.8392157, 0, 1,
-1.049706, 0.4585655, -2.616725, 1, 0.8470588, 0, 1,
-1.047707, 0.2602378, -1.16816, 1, 0.8509804, 0, 1,
-1.045927, -0.6331714, -1.498958, 1, 0.8588235, 0, 1,
-1.040888, -0.4522082, -2.518577, 1, 0.8627451, 0, 1,
-1.033863, 0.2868, -1.606485, 1, 0.8705882, 0, 1,
-1.015474, -1.226589, -2.99078, 1, 0.8745098, 0, 1,
-1.01543, -0.3505214, -0.5203279, 1, 0.8823529, 0, 1,
-1.014359, -0.4805236, -1.554555, 1, 0.8862745, 0, 1,
-1.014306, -1.736916, -2.228732, 1, 0.8941177, 0, 1,
-1.011261, 0.08799291, -2.579027, 1, 0.8980392, 0, 1,
-1.009651, -0.5465011, -1.362474, 1, 0.9058824, 0, 1,
-1.003543, 0.4672181, -0.1712961, 1, 0.9137255, 0, 1,
-0.9999288, -0.9962822, -1.437345, 1, 0.9176471, 0, 1,
-0.9956045, 0.6675436, -1.624618, 1, 0.9254902, 0, 1,
-0.9942263, 0.3514696, -1.712304, 1, 0.9294118, 0, 1,
-0.990965, -1.539812, -3.372782, 1, 0.9372549, 0, 1,
-0.9907442, -1.336497, -2.987297, 1, 0.9411765, 0, 1,
-0.990157, 0.286546, -1.604833, 1, 0.9490196, 0, 1,
-0.9802467, 2.079998, 0.3589684, 1, 0.9529412, 0, 1,
-0.9795807, -0.6072029, -0.8935696, 1, 0.9607843, 0, 1,
-0.9735557, -2.025379, -2.730685, 1, 0.9647059, 0, 1,
-0.9730096, -0.1972347, -2.458149, 1, 0.972549, 0, 1,
-0.9701678, -0.4457706, -1.820155, 1, 0.9764706, 0, 1,
-0.9629939, 1.179403, 0.3693742, 1, 0.9843137, 0, 1,
-0.9591534, -0.7246832, -2.065287, 1, 0.9882353, 0, 1,
-0.954975, 0.5999635, -1.089824, 1, 0.9960784, 0, 1,
-0.9516649, -0.8327932, -1.542099, 0.9960784, 1, 0, 1,
-0.9502898, 0.4513071, -1.490555, 0.9921569, 1, 0, 1,
-0.9493806, 1.046863, -0.7612825, 0.9843137, 1, 0, 1,
-0.9461399, -0.1866774, -1.374868, 0.9803922, 1, 0, 1,
-0.9426221, -0.5064169, -2.203439, 0.972549, 1, 0, 1,
-0.9421564, -0.1150576, -2.275434, 0.9686275, 1, 0, 1,
-0.9417174, 0.1019929, -1.838162, 0.9607843, 1, 0, 1,
-0.9348499, 1.480821, -0.01566406, 0.9568627, 1, 0, 1,
-0.9343776, 1.432339, -0.305135, 0.9490196, 1, 0, 1,
-0.9332762, -0.582064, -1.931868, 0.945098, 1, 0, 1,
-0.9145895, -0.4073442, -2.587971, 0.9372549, 1, 0, 1,
-0.9110361, 0.6142455, -0.9772786, 0.9333333, 1, 0, 1,
-0.9109998, 0.8053905, -0.1794024, 0.9254902, 1, 0, 1,
-0.9107839, 0.09011134, -0.6840339, 0.9215686, 1, 0, 1,
-0.9086317, 0.2993909, 0.1499996, 0.9137255, 1, 0, 1,
-0.9083133, 1.42448, -0.275537, 0.9098039, 1, 0, 1,
-0.9077148, -0.09980521, -1.90457, 0.9019608, 1, 0, 1,
-0.9038844, -0.7396092, -0.9813962, 0.8941177, 1, 0, 1,
-0.9015456, 0.2099779, -0.7764918, 0.8901961, 1, 0, 1,
-0.9005433, 1.035864, -1.649493, 0.8823529, 1, 0, 1,
-0.898514, -0.3160269, -1.759848, 0.8784314, 1, 0, 1,
-0.8979067, -0.1542714, -0.7547391, 0.8705882, 1, 0, 1,
-0.8926568, 0.2457396, -1.699227, 0.8666667, 1, 0, 1,
-0.891984, -0.3953482, -0.7470395, 0.8588235, 1, 0, 1,
-0.8857195, -1.420874, -2.897138, 0.854902, 1, 0, 1,
-0.8784891, 0.1364565, 0.1509366, 0.8470588, 1, 0, 1,
-0.8772996, 1.744003, 0.1707669, 0.8431373, 1, 0, 1,
-0.8752538, 0.7568349, -0.9903564, 0.8352941, 1, 0, 1,
-0.8661466, 0.6813405, -0.2208373, 0.8313726, 1, 0, 1,
-0.8659066, 0.8412606, -1.708765, 0.8235294, 1, 0, 1,
-0.8587373, -0.3038627, -0.5697154, 0.8196079, 1, 0, 1,
-0.854077, 1.46971, -0.6821959, 0.8117647, 1, 0, 1,
-0.8475472, -2.642867, -2.117156, 0.8078431, 1, 0, 1,
-0.8451545, -1.4093, -2.202589, 0.8, 1, 0, 1,
-0.8426616, 2.078999, 0.8060831, 0.7921569, 1, 0, 1,
-0.8340222, 0.9181414, -2.137182, 0.7882353, 1, 0, 1,
-0.8276541, -0.094456, -1.287174, 0.7803922, 1, 0, 1,
-0.8248675, 0.7804874, -1.429924, 0.7764706, 1, 0, 1,
-0.822286, -0.004611759, -0.09615017, 0.7686275, 1, 0, 1,
-0.8164812, 1.042451, -1.30727, 0.7647059, 1, 0, 1,
-0.8143715, 0.1737267, -1.052788, 0.7568628, 1, 0, 1,
-0.8115989, -0.1568352, -1.95781, 0.7529412, 1, 0, 1,
-0.8071709, -0.9612969, -1.302879, 0.7450981, 1, 0, 1,
-0.8049802, -0.9853377, -0.7416918, 0.7411765, 1, 0, 1,
-0.8008729, -0.257438, -1.594536, 0.7333333, 1, 0, 1,
-0.7993223, 1.787278, 0.02634963, 0.7294118, 1, 0, 1,
-0.7980248, 0.6160126, -1.324526, 0.7215686, 1, 0, 1,
-0.7963814, -0.8287282, -2.647017, 0.7176471, 1, 0, 1,
-0.7924587, -0.005588881, -0.6841908, 0.7098039, 1, 0, 1,
-0.7922722, -0.3921739, -1.6278, 0.7058824, 1, 0, 1,
-0.7886311, 0.845034, -1.89676, 0.6980392, 1, 0, 1,
-0.7859271, 0.2027134, -1.375192, 0.6901961, 1, 0, 1,
-0.7829942, -1.084596, -2.440574, 0.6862745, 1, 0, 1,
-0.7817083, -1.451689, -2.489267, 0.6784314, 1, 0, 1,
-0.7812572, -0.6236058, 0.3742431, 0.6745098, 1, 0, 1,
-0.7808057, 1.372767, -0.9770365, 0.6666667, 1, 0, 1,
-0.7749851, 0.6255559, -1.319804, 0.6627451, 1, 0, 1,
-0.7725298, -1.178559, -1.583442, 0.654902, 1, 0, 1,
-0.7716931, 0.4319948, -0.9362784, 0.6509804, 1, 0, 1,
-0.7692146, -0.6764923, -3.203357, 0.6431373, 1, 0, 1,
-0.7667977, -1.452912, -2.898229, 0.6392157, 1, 0, 1,
-0.7653027, 1.444436, -0.158802, 0.6313726, 1, 0, 1,
-0.7627255, 0.6578411, -2.878166, 0.627451, 1, 0, 1,
-0.7618924, 0.7365019, -1.154197, 0.6196079, 1, 0, 1,
-0.7614555, -0.2384195, -1.814663, 0.6156863, 1, 0, 1,
-0.7597469, -0.003674969, -1.894888, 0.6078432, 1, 0, 1,
-0.7595392, -0.9698586, -1.952176, 0.6039216, 1, 0, 1,
-0.7588398, 1.238206, -0.3573799, 0.5960785, 1, 0, 1,
-0.7587274, -1.500149, -2.344354, 0.5882353, 1, 0, 1,
-0.7561802, -0.5755107, -3.738294, 0.5843138, 1, 0, 1,
-0.7556872, 0.6394107, -1.427702, 0.5764706, 1, 0, 1,
-0.7490497, -0.3356031, -2.354952, 0.572549, 1, 0, 1,
-0.7484166, -0.4162506, -3.444639, 0.5647059, 1, 0, 1,
-0.7469091, -1.220233, -3.498708, 0.5607843, 1, 0, 1,
-0.7448432, 1.031268, 0.431311, 0.5529412, 1, 0, 1,
-0.7445082, -1.418705, -4.291439, 0.5490196, 1, 0, 1,
-0.7410199, 1.557214, 1.103925, 0.5411765, 1, 0, 1,
-0.73858, -0.156765, -3.23617, 0.5372549, 1, 0, 1,
-0.7376685, 0.1159676, -1.327742, 0.5294118, 1, 0, 1,
-0.7375569, 1.314913, -1.023192, 0.5254902, 1, 0, 1,
-0.7316557, 0.3325281, -2.60308, 0.5176471, 1, 0, 1,
-0.72731, -0.3589382, -2.078776, 0.5137255, 1, 0, 1,
-0.7253423, 0.2205644, -1.844504, 0.5058824, 1, 0, 1,
-0.7225599, -0.05350978, -1.819115, 0.5019608, 1, 0, 1,
-0.7195233, 1.027718, -0.4037814, 0.4941176, 1, 0, 1,
-0.7154549, 0.8765396, -1.32434, 0.4862745, 1, 0, 1,
-0.7082249, -0.3128355, -1.866979, 0.4823529, 1, 0, 1,
-0.7060858, 0.06563044, -1.573835, 0.4745098, 1, 0, 1,
-0.7046552, 1.832501, 1.084115, 0.4705882, 1, 0, 1,
-0.7033905, 1.289138, -1.076224, 0.4627451, 1, 0, 1,
-0.7012618, -1.93726, -2.104639, 0.4588235, 1, 0, 1,
-0.7007284, 0.7262489, 1.240908, 0.4509804, 1, 0, 1,
-0.6996152, 1.439674, 0.1211083, 0.4470588, 1, 0, 1,
-0.6954799, -0.5880455, -1.876124, 0.4392157, 1, 0, 1,
-0.6949589, -1.183329, -3.048619, 0.4352941, 1, 0, 1,
-0.6911399, 0.3674212, 0.7918259, 0.427451, 1, 0, 1,
-0.6839609, 0.5670472, -2.231073, 0.4235294, 1, 0, 1,
-0.6833156, 0.3594497, -0.2096071, 0.4156863, 1, 0, 1,
-0.6806262, -0.2472236, -3.588087, 0.4117647, 1, 0, 1,
-0.678409, -0.1800639, -2.15742, 0.4039216, 1, 0, 1,
-0.673632, 0.8390237, -0.1883996, 0.3960784, 1, 0, 1,
-0.6714445, -0.9987037, -1.832245, 0.3921569, 1, 0, 1,
-0.6668905, -2.114486, -3.543453, 0.3843137, 1, 0, 1,
-0.6665719, -2.354749, -2.525728, 0.3803922, 1, 0, 1,
-0.6659958, 0.2923297, -2.311595, 0.372549, 1, 0, 1,
-0.6608543, -0.6210463, -3.070254, 0.3686275, 1, 0, 1,
-0.6567896, -0.4564278, -0.873063, 0.3607843, 1, 0, 1,
-0.6523892, 1.115106, -0.827018, 0.3568628, 1, 0, 1,
-0.6522921, -0.7778251, -2.443173, 0.3490196, 1, 0, 1,
-0.6459538, 1.485311, -1.02683, 0.345098, 1, 0, 1,
-0.6449317, -1.0238, -0.2865385, 0.3372549, 1, 0, 1,
-0.6413386, 0.2289547, -1.620135, 0.3333333, 1, 0, 1,
-0.6377117, -0.1837505, -1.593249, 0.3254902, 1, 0, 1,
-0.6373342, -0.2807651, -2.195316, 0.3215686, 1, 0, 1,
-0.6369395, -0.9851527, -3.033187, 0.3137255, 1, 0, 1,
-0.6341057, 0.25052, -0.7489253, 0.3098039, 1, 0, 1,
-0.633236, 0.01781383, -0.7274168, 0.3019608, 1, 0, 1,
-0.6256692, 1.076042, 0.2944434, 0.2941177, 1, 0, 1,
-0.620288, 0.4252979, -0.4234984, 0.2901961, 1, 0, 1,
-0.6135026, 0.5767621, -1.74151, 0.282353, 1, 0, 1,
-0.607048, 1.056931, 0.1208263, 0.2784314, 1, 0, 1,
-0.6037537, -0.2608033, -1.735291, 0.2705882, 1, 0, 1,
-0.5949941, -1.073272, -1.822404, 0.2666667, 1, 0, 1,
-0.5948267, 0.3794859, -1.41795, 0.2588235, 1, 0, 1,
-0.593632, -3.60591, -1.354982, 0.254902, 1, 0, 1,
-0.592419, -0.1069002, -1.36071, 0.2470588, 1, 0, 1,
-0.5889566, 0.9652963, -0.5617356, 0.2431373, 1, 0, 1,
-0.5861754, -0.137872, -2.068977, 0.2352941, 1, 0, 1,
-0.5851182, 0.5254039, -0.5069858, 0.2313726, 1, 0, 1,
-0.5644867, 0.8103434, 0.8115033, 0.2235294, 1, 0, 1,
-0.5609262, 0.4029624, -1.249188, 0.2196078, 1, 0, 1,
-0.5603616, -0.4185037, -0.4597864, 0.2117647, 1, 0, 1,
-0.5569931, -0.6902682, -3.50127, 0.2078431, 1, 0, 1,
-0.5530838, 0.553149, 0.4800446, 0.2, 1, 0, 1,
-0.5525245, -1.425257, -2.645245, 0.1921569, 1, 0, 1,
-0.5516214, 0.0945748, -2.147576, 0.1882353, 1, 0, 1,
-0.5487257, -1.22578, -4.181287, 0.1803922, 1, 0, 1,
-0.5483927, -0.6405393, -1.663433, 0.1764706, 1, 0, 1,
-0.5483317, -1.127354, -1.898686, 0.1686275, 1, 0, 1,
-0.5434514, 0.8532419, -2.489223, 0.1647059, 1, 0, 1,
-0.5358984, 0.815851, 0.1635817, 0.1568628, 1, 0, 1,
-0.5316963, 0.9245036, 0.8007118, 0.1529412, 1, 0, 1,
-0.5295112, 1.0602, -1.203929, 0.145098, 1, 0, 1,
-0.5185556, 0.00868661, 0.7334675, 0.1411765, 1, 0, 1,
-0.511425, 0.742498, -1.838105, 0.1333333, 1, 0, 1,
-0.5105638, 0.2131768, -1.607667, 0.1294118, 1, 0, 1,
-0.5104682, 0.1422172, -3.126377, 0.1215686, 1, 0, 1,
-0.5092903, -1.738361, -2.864977, 0.1176471, 1, 0, 1,
-0.5062072, 1.162356, -0.9467931, 0.1098039, 1, 0, 1,
-0.5061163, -0.747624, -2.836885, 0.1058824, 1, 0, 1,
-0.5041128, 0.02087752, -2.446851, 0.09803922, 1, 0, 1,
-0.5031498, -0.9769862, -1.226646, 0.09019608, 1, 0, 1,
-0.4983284, -0.07981742, -2.744216, 0.08627451, 1, 0, 1,
-0.4971974, 0.5933548, -0.6509807, 0.07843138, 1, 0, 1,
-0.4965515, -1.123394, -1.762974, 0.07450981, 1, 0, 1,
-0.49371, 0.4113259, 0.1544125, 0.06666667, 1, 0, 1,
-0.4909589, 1.447346, -0.6833456, 0.0627451, 1, 0, 1,
-0.4859975, 1.294803, -0.08243787, 0.05490196, 1, 0, 1,
-0.4748002, 0.1685079, -0.5699988, 0.05098039, 1, 0, 1,
-0.468384, -0.339708, -1.538921, 0.04313726, 1, 0, 1,
-0.4656275, -0.560225, -2.459063, 0.03921569, 1, 0, 1,
-0.4645282, 0.9675221, -0.7089828, 0.03137255, 1, 0, 1,
-0.4636626, -0.404846, -3.540822, 0.02745098, 1, 0, 1,
-0.4634913, 1.316771, 1.283684, 0.01960784, 1, 0, 1,
-0.4634585, 0.8150863, -1.813187, 0.01568628, 1, 0, 1,
-0.462371, 0.7601674, -0.4597422, 0.007843138, 1, 0, 1,
-0.4609632, 0.3893074, -0.1971671, 0.003921569, 1, 0, 1,
-0.4572661, 2.583128, -0.6910077, 0, 1, 0.003921569, 1,
-0.4571865, 1.200182, -1.564422, 0, 1, 0.01176471, 1,
-0.4570116, -0.4946536, -2.212751, 0, 1, 0.01568628, 1,
-0.4496752, 0.3147956, -1.782512, 0, 1, 0.02352941, 1,
-0.4494791, -2.734452, -3.29099, 0, 1, 0.02745098, 1,
-0.4488341, -1.337188, -5.980405, 0, 1, 0.03529412, 1,
-0.4483616, -0.8456196, -3.245847, 0, 1, 0.03921569, 1,
-0.4452822, 1.148649, -1.963316, 0, 1, 0.04705882, 1,
-0.4445629, 0.6067497, 1.079363, 0, 1, 0.05098039, 1,
-0.4444505, 1.458269, 2.179857, 0, 1, 0.05882353, 1,
-0.4415789, 0.8022754, -0.09249336, 0, 1, 0.0627451, 1,
-0.4370937, -0.193101, -1.809815, 0, 1, 0.07058824, 1,
-0.4353988, -0.8796488, -1.666, 0, 1, 0.07450981, 1,
-0.4349839, -1.14385, -1.956584, 0, 1, 0.08235294, 1,
-0.4302911, -0.9711034, -3.492931, 0, 1, 0.08627451, 1,
-0.4299791, 0.7680285, -2.024797, 0, 1, 0.09411765, 1,
-0.4270604, -0.3250163, -1.852681, 0, 1, 0.1019608, 1,
-0.424554, -0.07310791, 0.3465331, 0, 1, 0.1058824, 1,
-0.4206853, -0.9695491, -2.619421, 0, 1, 0.1137255, 1,
-0.4202227, -0.8684643, -1.548938, 0, 1, 0.1176471, 1,
-0.4136544, 1.962625, -2.598229, 0, 1, 0.1254902, 1,
-0.4074957, -1.939564, -2.491397, 0, 1, 0.1294118, 1,
-0.4053484, 0.6303111, -0.7744226, 0, 1, 0.1372549, 1,
-0.4041957, 1.229041, 1.52744, 0, 1, 0.1411765, 1,
-0.4003081, -0.277999, -1.540061, 0, 1, 0.1490196, 1,
-0.3988042, -0.2408873, -4.414976, 0, 1, 0.1529412, 1,
-0.3978951, 0.3235247, -0.9200734, 0, 1, 0.1607843, 1,
-0.3973426, 0.895536, -1.54923, 0, 1, 0.1647059, 1,
-0.3962485, -1.120074, -3.930012, 0, 1, 0.172549, 1,
-0.3954416, 0.8757384, -1.380581, 0, 1, 0.1764706, 1,
-0.3936986, 0.2128559, -0.5450829, 0, 1, 0.1843137, 1,
-0.3929195, -1.134448, -3.110463, 0, 1, 0.1882353, 1,
-0.390877, -1.667305, -4.997338, 0, 1, 0.1960784, 1,
-0.3907224, 0.2073234, -1.668961, 0, 1, 0.2039216, 1,
-0.3798396, -1.026618, -1.884005, 0, 1, 0.2078431, 1,
-0.3775222, 1.244551, 0.4942184, 0, 1, 0.2156863, 1,
-0.3707936, 0.3803963, -3.286096, 0, 1, 0.2196078, 1,
-0.3690123, 0.4125461, -1.119928, 0, 1, 0.227451, 1,
-0.368245, -0.2928257, -0.300349, 0, 1, 0.2313726, 1,
-0.3679549, -0.7284613, -1.427231, 0, 1, 0.2392157, 1,
-0.3634979, -0.2394759, -0.02320893, 0, 1, 0.2431373, 1,
-0.3629045, -1.14531, -3.097603, 0, 1, 0.2509804, 1,
-0.3619279, 1.462682, -1.143237, 0, 1, 0.254902, 1,
-0.3586026, -0.6318799, -2.54884, 0, 1, 0.2627451, 1,
-0.357017, -1.208098, -3.472062, 0, 1, 0.2666667, 1,
-0.3546562, -0.3692872, -2.568047, 0, 1, 0.2745098, 1,
-0.3516078, -2.835499, -3.67482, 0, 1, 0.2784314, 1,
-0.3505748, -0.413887, -1.978203, 0, 1, 0.2862745, 1,
-0.3501334, 0.5338961, -1.116831, 0, 1, 0.2901961, 1,
-0.3486919, 0.9383695, -0.1665593, 0, 1, 0.2980392, 1,
-0.3482041, 1.052025, 0.809418, 0, 1, 0.3058824, 1,
-0.3394887, 0.9092274, -0.1240435, 0, 1, 0.3098039, 1,
-0.3328945, 1.099495, -1.029462, 0, 1, 0.3176471, 1,
-0.3294089, 1.239603, -3.404002, 0, 1, 0.3215686, 1,
-0.3288417, 2.595679, -2.215088, 0, 1, 0.3294118, 1,
-0.3273411, -1.161062, -3.08604, 0, 1, 0.3333333, 1,
-0.3222053, -0.6393145, -2.378664, 0, 1, 0.3411765, 1,
-0.321677, 0.1515475, -3.444349, 0, 1, 0.345098, 1,
-0.320235, 0.012555, -2.07077, 0, 1, 0.3529412, 1,
-0.3164979, 0.2826893, -0.4425127, 0, 1, 0.3568628, 1,
-0.3055407, 2.41076, 1.344037, 0, 1, 0.3647059, 1,
-0.3055141, -0.7976201, -2.512955, 0, 1, 0.3686275, 1,
-0.3047579, 1.539215, -1.167297, 0, 1, 0.3764706, 1,
-0.3044776, -1.236961, -4.53826, 0, 1, 0.3803922, 1,
-0.3032013, -0.5326575, -2.837124, 0, 1, 0.3882353, 1,
-0.3023909, -1.210599, -3.739084, 0, 1, 0.3921569, 1,
-0.3007341, -1.766889, -2.825533, 0, 1, 0.4, 1,
-0.3003904, -1.765029, -1.295448, 0, 1, 0.4078431, 1,
-0.299036, 0.2697479, -0.7844508, 0, 1, 0.4117647, 1,
-0.2935941, -0.9070705, -2.237511, 0, 1, 0.4196078, 1,
-0.2930703, -0.8312438, -2.916236, 0, 1, 0.4235294, 1,
-0.292044, 0.09279525, -0.8473209, 0, 1, 0.4313726, 1,
-0.2917186, 0.3227261, -1.141854, 0, 1, 0.4352941, 1,
-0.2870972, -1.584471, -2.771566, 0, 1, 0.4431373, 1,
-0.280217, -0.2958594, -2.571291, 0, 1, 0.4470588, 1,
-0.2796176, 0.5582027, -0.0291298, 0, 1, 0.454902, 1,
-0.2772845, -0.8785836, -3.783753, 0, 1, 0.4588235, 1,
-0.2753201, 1.912826, -0.455325, 0, 1, 0.4666667, 1,
-0.2746598, -0.9594439, -2.630656, 0, 1, 0.4705882, 1,
-0.2703853, 2.192168, 1.208768, 0, 1, 0.4784314, 1,
-0.2687938, 0.8272224, -1.238701, 0, 1, 0.4823529, 1,
-0.2687349, 0.6093896, -0.1375649, 0, 1, 0.4901961, 1,
-0.2673692, -0.6130939, -3.561683, 0, 1, 0.4941176, 1,
-0.2659603, -0.0233107, -1.56278, 0, 1, 0.5019608, 1,
-0.2656066, -1.6851, -3.17277, 0, 1, 0.509804, 1,
-0.2650343, 0.4684107, 0.5049056, 0, 1, 0.5137255, 1,
-0.2633793, 0.367322, 0.1864242, 0, 1, 0.5215687, 1,
-0.2626304, 1.773313, 1.186292, 0, 1, 0.5254902, 1,
-0.2626146, -0.1309571, -3.609276, 0, 1, 0.5333334, 1,
-0.2601656, -0.008916968, -3.926424, 0, 1, 0.5372549, 1,
-0.2580186, -0.3532832, -2.371424, 0, 1, 0.5450981, 1,
-0.2556267, 1.153538, -0.06869525, 0, 1, 0.5490196, 1,
-0.2512051, -0.07196529, -1.765892, 0, 1, 0.5568628, 1,
-0.2469622, 0.4808464, 1.050809, 0, 1, 0.5607843, 1,
-0.2454263, -0.6245229, -3.211519, 0, 1, 0.5686275, 1,
-0.2448366, -0.9083857, -3.977729, 0, 1, 0.572549, 1,
-0.2400398, 0.04047797, -1.131603, 0, 1, 0.5803922, 1,
-0.2398577, 0.3007742, 0.7829026, 0, 1, 0.5843138, 1,
-0.2392427, -1.419398, -3.0849, 0, 1, 0.5921569, 1,
-0.2364838, -0.1602079, -1.973459, 0, 1, 0.5960785, 1,
-0.2344668, -0.3695657, -2.849182, 0, 1, 0.6039216, 1,
-0.2342898, -1.935818, -3.486889, 0, 1, 0.6117647, 1,
-0.2334725, -1.208021, -3.869759, 0, 1, 0.6156863, 1,
-0.2316384, -3.045033, -1.431967, 0, 1, 0.6235294, 1,
-0.2289844, -0.8299894, -3.15344, 0, 1, 0.627451, 1,
-0.2239277, 0.4736145, -0.1290302, 0, 1, 0.6352941, 1,
-0.219185, -0.9446776, -2.018722, 0, 1, 0.6392157, 1,
-0.2157274, 0.35803, -0.7327303, 0, 1, 0.6470588, 1,
-0.2150058, -1.156255, -1.669254, 0, 1, 0.6509804, 1,
-0.2140336, 0.840134, 0.5606232, 0, 1, 0.6588235, 1,
-0.2104765, -0.1829452, -1.476889, 0, 1, 0.6627451, 1,
-0.2039389, 0.1959387, 0.07813759, 0, 1, 0.6705883, 1,
-0.2023938, -1.657032, -3.858359, 0, 1, 0.6745098, 1,
-0.1945081, 2.245223, 1.100395, 0, 1, 0.682353, 1,
-0.1944955, -0.3145714, -1.888442, 0, 1, 0.6862745, 1,
-0.1936535, -0.09682854, -1.09416, 0, 1, 0.6941177, 1,
-0.1904413, -0.7510482, -2.840132, 0, 1, 0.7019608, 1,
-0.1840037, -1.330923, -0.6944364, 0, 1, 0.7058824, 1,
-0.1753835, 0.5702271, -0.9490066, 0, 1, 0.7137255, 1,
-0.1743895, 0.1374452, -1.573921, 0, 1, 0.7176471, 1,
-0.1722845, -1.476489, -3.922346, 0, 1, 0.7254902, 1,
-0.1720823, 0.05590766, -1.518905, 0, 1, 0.7294118, 1,
-0.169132, -1.190998, -4.156954, 0, 1, 0.7372549, 1,
-0.1665244, -1.606954, -3.533194, 0, 1, 0.7411765, 1,
-0.165635, -2.91311, -2.933693, 0, 1, 0.7490196, 1,
-0.1649238, 0.1539257, 0.1351259, 0, 1, 0.7529412, 1,
-0.1637037, -0.008445851, -0.4090281, 0, 1, 0.7607843, 1,
-0.1538495, 0.1762452, -0.6719911, 0, 1, 0.7647059, 1,
-0.1507096, 0.02691625, -2.04651, 0, 1, 0.772549, 1,
-0.1497416, 0.5633368, -0.9795063, 0, 1, 0.7764706, 1,
-0.1469379, 0.1218788, 0.01682033, 0, 1, 0.7843137, 1,
-0.1465788, 0.2995378, -0.7602292, 0, 1, 0.7882353, 1,
-0.1460839, -0.1471641, -2.509634, 0, 1, 0.7960784, 1,
-0.1455401, 1.098849, 0.6810164, 0, 1, 0.8039216, 1,
-0.1432012, -0.7599257, -1.967925, 0, 1, 0.8078431, 1,
-0.132735, 1.235488, 0.9220251, 0, 1, 0.8156863, 1,
-0.1319268, -0.1837638, -2.271869, 0, 1, 0.8196079, 1,
-0.1271291, -0.3294294, -0.4027118, 0, 1, 0.827451, 1,
-0.1234509, 1.279344, 1.479499, 0, 1, 0.8313726, 1,
-0.1074389, -0.4860339, -2.178634, 0, 1, 0.8392157, 1,
-0.1066759, -0.8034547, -2.949664, 0, 1, 0.8431373, 1,
-0.1052023, -0.01058977, -0.7053697, 0, 1, 0.8509804, 1,
-0.1036804, -0.4231536, -3.800493, 0, 1, 0.854902, 1,
-0.09550211, 0.6679421, 1.473713, 0, 1, 0.8627451, 1,
-0.09453971, -1.058231, -3.575713, 0, 1, 0.8666667, 1,
-0.09406991, 0.6708032, 1.420847, 0, 1, 0.8745098, 1,
-0.09356274, -0.7301949, -4.052577, 0, 1, 0.8784314, 1,
-0.09035708, 1.81548, 0.05747815, 0, 1, 0.8862745, 1,
-0.08970945, -0.2547288, -3.981772, 0, 1, 0.8901961, 1,
-0.08943074, -0.4257441, -4.57972, 0, 1, 0.8980392, 1,
-0.08870971, -1.294454, -4.385961, 0, 1, 0.9058824, 1,
-0.08640152, 1.506786, 0.2210088, 0, 1, 0.9098039, 1,
-0.08621559, -0.2104549, -2.166632, 0, 1, 0.9176471, 1,
-0.08464344, 0.2512768, 0.0280754, 0, 1, 0.9215686, 1,
-0.0844485, -0.1947951, -3.459715, 0, 1, 0.9294118, 1,
-0.07870353, 0.7736789, 2.688126, 0, 1, 0.9333333, 1,
-0.07614256, 0.2802892, -0.4824219, 0, 1, 0.9411765, 1,
-0.07403687, -0.4591383, -2.387203, 0, 1, 0.945098, 1,
-0.07172766, 0.09929612, -0.102519, 0, 1, 0.9529412, 1,
-0.07068395, 2.832068, -1.56316, 0, 1, 0.9568627, 1,
-0.06996297, 1.358698, 0.7263126, 0, 1, 0.9647059, 1,
-0.06857942, 1.624548, 0.200668, 0, 1, 0.9686275, 1,
-0.06838479, -1.320112, -4.513383, 0, 1, 0.9764706, 1,
-0.0636999, -0.6133974, -2.48902, 0, 1, 0.9803922, 1,
-0.05987131, 0.05383615, 1.159193, 0, 1, 0.9882353, 1,
-0.05778079, -0.2111996, -2.690188, 0, 1, 0.9921569, 1,
-0.05764626, -0.1700167, -3.928723, 0, 1, 1, 1,
-0.05455563, -0.7516417, -3.056859, 0, 0.9921569, 1, 1,
-0.05290617, 1.089212, -1.055315, 0, 0.9882353, 1, 1,
-0.04982767, 0.1141525, -0.3676732, 0, 0.9803922, 1, 1,
-0.04869747, 0.639694, 1.355765, 0, 0.9764706, 1, 1,
-0.04429274, -1.392322, -3.567309, 0, 0.9686275, 1, 1,
-0.04039708, -1.172374, -2.272058, 0, 0.9647059, 1, 1,
-0.03986446, 0.1392201, -0.9507917, 0, 0.9568627, 1, 1,
-0.03649738, -0.9868066, -3.037885, 0, 0.9529412, 1, 1,
-0.02325268, -0.9742578, -2.802197, 0, 0.945098, 1, 1,
-0.01647347, -1.387096, -3.98132, 0, 0.9411765, 1, 1,
-0.01071666, 0.2816915, 0.6112691, 0, 0.9333333, 1, 1,
-0.008492869, 0.6239311, 0.6292334, 0, 0.9294118, 1, 1,
-0.003260945, 1.098087, 1.167482, 0, 0.9215686, 1, 1,
-0.003036101, 1.167631, 0.02595958, 0, 0.9176471, 1, 1,
-0.002511079, -1.599475, -1.854381, 0, 0.9098039, 1, 1,
-0.002035596, -0.4032099, -1.591897, 0, 0.9058824, 1, 1,
2.317399e-05, -0.769461, 4.466575, 0, 0.8980392, 1, 1,
0.0002070162, 0.1137415, 0.460507, 0, 0.8901961, 1, 1,
0.0007903356, 0.457316, 0.5138924, 0, 0.8862745, 1, 1,
0.003625403, 1.624343, 0.02122842, 0, 0.8784314, 1, 1,
0.005725037, -0.6364348, 3.713749, 0, 0.8745098, 1, 1,
0.01236587, 1.618021, 0.5919656, 0, 0.8666667, 1, 1,
0.01427454, 0.5349809, 0.9427499, 0, 0.8627451, 1, 1,
0.01626437, -1.809352, 2.743482, 0, 0.854902, 1, 1,
0.01967807, -0.7136725, 2.83218, 0, 0.8509804, 1, 1,
0.02337968, -1.069705, 3.798536, 0, 0.8431373, 1, 1,
0.02369311, -0.324881, 4.027798, 0, 0.8392157, 1, 1,
0.02373465, -0.8159177, 3.105331, 0, 0.8313726, 1, 1,
0.02444257, 0.2390004, -0.577395, 0, 0.827451, 1, 1,
0.02519082, 1.182473, 1.111437, 0, 0.8196079, 1, 1,
0.03096768, -0.4972505, 4.4417, 0, 0.8156863, 1, 1,
0.04208047, 0.1424439, 1.235673, 0, 0.8078431, 1, 1,
0.04512416, -0.4603872, 3.739679, 0, 0.8039216, 1, 1,
0.05149587, -1.052425, 1.618495, 0, 0.7960784, 1, 1,
0.05189622, 1.47516, -0.4233632, 0, 0.7882353, 1, 1,
0.05529047, 1.103816, 0.5988588, 0, 0.7843137, 1, 1,
0.05756803, -0.4419147, 2.496396, 0, 0.7764706, 1, 1,
0.05933375, -0.8382788, 2.350643, 0, 0.772549, 1, 1,
0.06154761, -0.4851025, 4.303045, 0, 0.7647059, 1, 1,
0.06159117, -0.2187299, 3.725341, 0, 0.7607843, 1, 1,
0.06159218, 0.581044, 0.9154115, 0, 0.7529412, 1, 1,
0.06741177, -0.1431568, 2.758814, 0, 0.7490196, 1, 1,
0.07213987, -0.3004923, 4.687786, 0, 0.7411765, 1, 1,
0.07515305, 2.713386, 0.6512684, 0, 0.7372549, 1, 1,
0.07652674, -1.597182, 3.973289, 0, 0.7294118, 1, 1,
0.07770965, 0.2874718, 0.02060094, 0, 0.7254902, 1, 1,
0.07795672, 0.2315754, -0.1414251, 0, 0.7176471, 1, 1,
0.07800844, -0.4132522, 3.934585, 0, 0.7137255, 1, 1,
0.08328169, -1.348525, 5.790263, 0, 0.7058824, 1, 1,
0.08335424, 1.753731, -1.017436, 0, 0.6980392, 1, 1,
0.08425801, -0.4444608, 2.321357, 0, 0.6941177, 1, 1,
0.08730238, -0.5903692, 3.956173, 0, 0.6862745, 1, 1,
0.08779562, -0.3639982, 1.796445, 0, 0.682353, 1, 1,
0.0887184, 1.802707, 0.215124, 0, 0.6745098, 1, 1,
0.09073787, 0.4962958, -0.382804, 0, 0.6705883, 1, 1,
0.09235005, 1.050435, 0.3101988, 0, 0.6627451, 1, 1,
0.09363115, -1.096655, 3.110838, 0, 0.6588235, 1, 1,
0.1003786, 1.047972, 0.8808441, 0, 0.6509804, 1, 1,
0.1010711, -0.4552121, 3.038748, 0, 0.6470588, 1, 1,
0.1012745, -0.2725784, 2.659029, 0, 0.6392157, 1, 1,
0.1067585, -0.5023131, 4.742835, 0, 0.6352941, 1, 1,
0.1138165, 0.5260381, 1.867386, 0, 0.627451, 1, 1,
0.1204145, -1.046777, 2.120974, 0, 0.6235294, 1, 1,
0.1366812, 0.7110372, 0.9411727, 0, 0.6156863, 1, 1,
0.1409099, -0.9462129, 3.747513, 0, 0.6117647, 1, 1,
0.1434449, -1.758057, 3.256036, 0, 0.6039216, 1, 1,
0.1469168, -0.165935, 3.816586, 0, 0.5960785, 1, 1,
0.1479909, -0.7333873, 2.867221, 0, 0.5921569, 1, 1,
0.1537529, 0.8079773, -1.242995, 0, 0.5843138, 1, 1,
0.1540945, -0.1730606, 3.409092, 0, 0.5803922, 1, 1,
0.1563553, 1.351434, 0.7265026, 0, 0.572549, 1, 1,
0.1578368, 0.8631909, 0.2874295, 0, 0.5686275, 1, 1,
0.1578958, 1.371194, -0.1969164, 0, 0.5607843, 1, 1,
0.1589629, 1.162763, 0.7475694, 0, 0.5568628, 1, 1,
0.165869, 1.999502, -1.652788, 0, 0.5490196, 1, 1,
0.1706009, 0.7379637, -1.333109, 0, 0.5450981, 1, 1,
0.1724998, 0.1607601, 0.9068295, 0, 0.5372549, 1, 1,
0.1730134, -1.649547, 4.51871, 0, 0.5333334, 1, 1,
0.1748548, -1.002364, 2.077137, 0, 0.5254902, 1, 1,
0.1754098, 1.409028, -0.118009, 0, 0.5215687, 1, 1,
0.1759905, -0.466834, 2.29508, 0, 0.5137255, 1, 1,
0.1802253, -0.07214476, 2.01737, 0, 0.509804, 1, 1,
0.1853134, 0.2963881, 1.091902, 0, 0.5019608, 1, 1,
0.1875467, 0.9350502, 1.872824, 0, 0.4941176, 1, 1,
0.1883289, -0.05648481, 2.461735, 0, 0.4901961, 1, 1,
0.1905852, -1.009768, 2.176922, 0, 0.4823529, 1, 1,
0.1976951, -1.014808, 2.718173, 0, 0.4784314, 1, 1,
0.1994764, 0.7590734, 1.230295, 0, 0.4705882, 1, 1,
0.199908, -1.479911, 1.870303, 0, 0.4666667, 1, 1,
0.2020685, -0.1643795, 2.12039, 0, 0.4588235, 1, 1,
0.2028146, -1.035031, 1.214088, 0, 0.454902, 1, 1,
0.2032017, -0.4957494, 3.162674, 0, 0.4470588, 1, 1,
0.2138714, -0.78708, 2.348244, 0, 0.4431373, 1, 1,
0.2141353, -0.2822495, 2.657689, 0, 0.4352941, 1, 1,
0.215093, -1.584614, 3.865004, 0, 0.4313726, 1, 1,
0.218363, -0.8659348, 2.994392, 0, 0.4235294, 1, 1,
0.2233382, 1.81231, 0.742429, 0, 0.4196078, 1, 1,
0.2279357, 1.275363, 1.506744, 0, 0.4117647, 1, 1,
0.2296692, -0.5925984, 3.362351, 0, 0.4078431, 1, 1,
0.2333145, 0.002356154, 3.672823, 0, 0.4, 1, 1,
0.2333868, 0.5844743, 1.291884, 0, 0.3921569, 1, 1,
0.2393943, -1.115037, 2.568673, 0, 0.3882353, 1, 1,
0.2434937, -0.2187342, 2.754963, 0, 0.3803922, 1, 1,
0.2439199, -0.9018089, 2.789913, 0, 0.3764706, 1, 1,
0.2496208, -1.929546, 2.652261, 0, 0.3686275, 1, 1,
0.2503738, 1.958982, 1.491025, 0, 0.3647059, 1, 1,
0.2506826, -0.2426367, 3.587499, 0, 0.3568628, 1, 1,
0.2507734, 0.5527882, 0.3895021, 0, 0.3529412, 1, 1,
0.251227, 0.04062596, 1.66995, 0, 0.345098, 1, 1,
0.2550914, -0.3520039, 2.836348, 0, 0.3411765, 1, 1,
0.2560538, 1.265777, 1.191412, 0, 0.3333333, 1, 1,
0.2587571, 0.5873666, 0.4443094, 0, 0.3294118, 1, 1,
0.2600824, 2.439112, 0.4544352, 0, 0.3215686, 1, 1,
0.2609845, -0.3450688, 1.873517, 0, 0.3176471, 1, 1,
0.268332, 2.153701, -1.176616, 0, 0.3098039, 1, 1,
0.2684901, -0.2518465, 0.9639639, 0, 0.3058824, 1, 1,
0.2749728, -0.4349728, 3.264883, 0, 0.2980392, 1, 1,
0.2758892, -1.408962, 2.167232, 0, 0.2901961, 1, 1,
0.2806204, -1.45492, 4.504702, 0, 0.2862745, 1, 1,
0.2845843, 0.1924545, 1.245475, 0, 0.2784314, 1, 1,
0.2888436, -0.9781097, 2.305336, 0, 0.2745098, 1, 1,
0.2889976, -0.6976879, 2.663812, 0, 0.2666667, 1, 1,
0.2918271, -1.024928, 1.384606, 0, 0.2627451, 1, 1,
0.2932344, -0.03676573, 3.33298, 0, 0.254902, 1, 1,
0.2965622, -0.07858883, 0.7831085, 0, 0.2509804, 1, 1,
0.2983955, 1.658219, -0.9921022, 0, 0.2431373, 1, 1,
0.301024, -0.1047533, 1.793633, 0, 0.2392157, 1, 1,
0.3026375, -0.01312298, 1.166015, 0, 0.2313726, 1, 1,
0.3041528, 0.5529236, 0.8609054, 0, 0.227451, 1, 1,
0.3065463, -0.3088378, 1.128936, 0, 0.2196078, 1, 1,
0.3088891, 1.04815, -0.4876033, 0, 0.2156863, 1, 1,
0.3121306, 0.39189, 3.175315, 0, 0.2078431, 1, 1,
0.313236, -0.3645294, 0.5512384, 0, 0.2039216, 1, 1,
0.3151311, -0.08580188, 0.7677421, 0, 0.1960784, 1, 1,
0.31759, 1.368945, -0.2808167, 0, 0.1882353, 1, 1,
0.3177525, -0.1433971, 2.108497, 0, 0.1843137, 1, 1,
0.3184552, 0.4508797, 0.7561527, 0, 0.1764706, 1, 1,
0.3190126, -0.06089918, -0.278008, 0, 0.172549, 1, 1,
0.3272685, -0.5770761, 4.620541, 0, 0.1647059, 1, 1,
0.3314613, -0.3354603, 1.226949, 0, 0.1607843, 1, 1,
0.3363055, 0.9460755, 0.3395282, 0, 0.1529412, 1, 1,
0.3392307, 1.103412, 1.911634, 0, 0.1490196, 1, 1,
0.350806, 1.640847, -0.7496698, 0, 0.1411765, 1, 1,
0.356554, -1.880141, 2.692796, 0, 0.1372549, 1, 1,
0.3596053, 0.009372517, 0.5349913, 0, 0.1294118, 1, 1,
0.3716156, 1.36114, 0.6912187, 0, 0.1254902, 1, 1,
0.3721242, -0.1432349, 1.828419, 0, 0.1176471, 1, 1,
0.3734252, 1.378163, 1.784741, 0, 0.1137255, 1, 1,
0.3763624, 0.4912247, 1.595344, 0, 0.1058824, 1, 1,
0.3783653, 0.9432217, 0.6216354, 0, 0.09803922, 1, 1,
0.3789184, 0.7152449, -0.353471, 0, 0.09411765, 1, 1,
0.3819727, 0.01060541, -0.5254885, 0, 0.08627451, 1, 1,
0.3829634, 0.6242132, 0.5550462, 0, 0.08235294, 1, 1,
0.3838151, 0.1881966, 1.170321, 0, 0.07450981, 1, 1,
0.3854451, 0.4126452, 0.302472, 0, 0.07058824, 1, 1,
0.3898437, -1.208685, 4.941986, 0, 0.0627451, 1, 1,
0.3902628, 0.5142866, 0.1873962, 0, 0.05882353, 1, 1,
0.3910382, -1.818095, 3.056357, 0, 0.05098039, 1, 1,
0.394676, -1.330782, 4.285165, 0, 0.04705882, 1, 1,
0.3955936, 0.8596169, -0.8735771, 0, 0.03921569, 1, 1,
0.4033155, 0.168915, 1.290979, 0, 0.03529412, 1, 1,
0.4050294, 1.766932, 1.10047, 0, 0.02745098, 1, 1,
0.4062144, -0.3099697, 3.367439, 0, 0.02352941, 1, 1,
0.4115417, 0.4278907, 0.2555795, 0, 0.01568628, 1, 1,
0.4147685, -0.9913879, 3.338995, 0, 0.01176471, 1, 1,
0.4203468, 0.5574527, -0.2094664, 0, 0.003921569, 1, 1,
0.4228436, -1.243412, 1.603599, 0.003921569, 0, 1, 1,
0.4248206, -1.657167, 2.949721, 0.007843138, 0, 1, 1,
0.426514, 1.100118, -0.5299522, 0.01568628, 0, 1, 1,
0.4288645, 1.125258, 1.540339, 0.01960784, 0, 1, 1,
0.4349212, 1.297953, -0.114353, 0.02745098, 0, 1, 1,
0.4362772, 0.1501592, -0.2893439, 0.03137255, 0, 1, 1,
0.4385269, 1.499154, 1.538686, 0.03921569, 0, 1, 1,
0.4449397, 0.3964581, 0.8382939, 0.04313726, 0, 1, 1,
0.4470927, 0.76047, 0.5715131, 0.05098039, 0, 1, 1,
0.4486557, 1.668328, 0.5488627, 0.05490196, 0, 1, 1,
0.4495314, -0.4866498, 1.887429, 0.0627451, 0, 1, 1,
0.4542595, 0.4825128, 1.355367, 0.06666667, 0, 1, 1,
0.4566162, -0.06071524, 2.448963, 0.07450981, 0, 1, 1,
0.4575541, -0.1574529, 0.7558807, 0.07843138, 0, 1, 1,
0.4593277, -0.2490512, 1.696299, 0.08627451, 0, 1, 1,
0.4611574, -2.191788, 4.51802, 0.09019608, 0, 1, 1,
0.4637934, -0.2639866, 3.449762, 0.09803922, 0, 1, 1,
0.4683709, -0.9742664, 2.923438, 0.1058824, 0, 1, 1,
0.469282, 1.098112, 0.9736784, 0.1098039, 0, 1, 1,
0.4705441, 0.02943566, 0.9268866, 0.1176471, 0, 1, 1,
0.4709609, -0.3578965, 3.406349, 0.1215686, 0, 1, 1,
0.4710568, -0.1453496, 3.697808, 0.1294118, 0, 1, 1,
0.4741185, 1.756145, -0.1180447, 0.1333333, 0, 1, 1,
0.4748549, -0.6489723, 1.749303, 0.1411765, 0, 1, 1,
0.4780512, 0.2629683, 2.733223, 0.145098, 0, 1, 1,
0.4799778, 0.002080565, 0.9585654, 0.1529412, 0, 1, 1,
0.4954789, -0.8029971, 2.75276, 0.1568628, 0, 1, 1,
0.4956988, 0.8151364, -0.3203779, 0.1647059, 0, 1, 1,
0.4991045, 1.678292, 0.744661, 0.1686275, 0, 1, 1,
0.5033275, -1.086727, 2.340786, 0.1764706, 0, 1, 1,
0.503887, 0.8399789, 0.9910179, 0.1803922, 0, 1, 1,
0.5092639, -0.02428425, 1.656683, 0.1882353, 0, 1, 1,
0.5135039, 0.5967402, 0.4587317, 0.1921569, 0, 1, 1,
0.5152243, -0.2741659, 2.55512, 0.2, 0, 1, 1,
0.5153873, 0.9811242, -0.5829303, 0.2078431, 0, 1, 1,
0.516162, 1.326384, 2.720618, 0.2117647, 0, 1, 1,
0.5199609, -0.5267262, 3.026386, 0.2196078, 0, 1, 1,
0.5227001, -2.075735, 2.813365, 0.2235294, 0, 1, 1,
0.523995, -3.071365, 3.75417, 0.2313726, 0, 1, 1,
0.5243548, -0.2869201, 2.481794, 0.2352941, 0, 1, 1,
0.528171, -0.4119368, 2.009398, 0.2431373, 0, 1, 1,
0.5298915, -0.734781, 3.167254, 0.2470588, 0, 1, 1,
0.5310004, 0.9757156, 0.530066, 0.254902, 0, 1, 1,
0.5346612, 0.9567463, 1.164283, 0.2588235, 0, 1, 1,
0.5352153, -1.507178, 1.921696, 0.2666667, 0, 1, 1,
0.5395465, -0.6770645, 1.957632, 0.2705882, 0, 1, 1,
0.5396228, 1.392719, -0.4168959, 0.2784314, 0, 1, 1,
0.5404667, 0.2131685, 4.564374, 0.282353, 0, 1, 1,
0.5418174, -1.255738, 3.383733, 0.2901961, 0, 1, 1,
0.5418324, 0.1904408, 1.137565, 0.2941177, 0, 1, 1,
0.5481043, -1.537112, 3.698367, 0.3019608, 0, 1, 1,
0.5493277, 1.386512, -1.059285, 0.3098039, 0, 1, 1,
0.5527138, -0.4797749, 2.052116, 0.3137255, 0, 1, 1,
0.55981, -0.667993, 3.267573, 0.3215686, 0, 1, 1,
0.5624154, 1.885585, -0.7927414, 0.3254902, 0, 1, 1,
0.5628845, 1.058458, 0.3525155, 0.3333333, 0, 1, 1,
0.5631445, 1.150971, 0.4674388, 0.3372549, 0, 1, 1,
0.5686361, -0.6791036, 2.361938, 0.345098, 0, 1, 1,
0.5696559, 1.054086, 0.3133397, 0.3490196, 0, 1, 1,
0.5744634, 0.366109, 0.7796133, 0.3568628, 0, 1, 1,
0.5764793, -1.141802, 3.758386, 0.3607843, 0, 1, 1,
0.5816942, -0.2079417, 2.243694, 0.3686275, 0, 1, 1,
0.5844726, -0.1856918, 3.786368, 0.372549, 0, 1, 1,
0.5883465, 1.580837, -1.440943, 0.3803922, 0, 1, 1,
0.5912015, -1.399075, 2.317467, 0.3843137, 0, 1, 1,
0.5915024, 0.3883583, -0.001567266, 0.3921569, 0, 1, 1,
0.5992654, -1.655484, 2.182939, 0.3960784, 0, 1, 1,
0.6032284, 0.6235603, 1.233504, 0.4039216, 0, 1, 1,
0.6057077, 0.3202343, 1.880862, 0.4117647, 0, 1, 1,
0.6099678, -0.2323065, 1.983922, 0.4156863, 0, 1, 1,
0.6104115, -0.09834606, 2.908178, 0.4235294, 0, 1, 1,
0.6115484, 1.833706, 0.2627566, 0.427451, 0, 1, 1,
0.6120663, 1.523688, -0.5379525, 0.4352941, 0, 1, 1,
0.6129815, -0.8606224, 2.688774, 0.4392157, 0, 1, 1,
0.616024, 0.3986134, 1.085132, 0.4470588, 0, 1, 1,
0.6270128, 0.7128516, 1.627108, 0.4509804, 0, 1, 1,
0.6306212, 1.455014, 1.181378, 0.4588235, 0, 1, 1,
0.6471825, -1.857348, 2.45937, 0.4627451, 0, 1, 1,
0.6488256, 1.898578, -0.1743183, 0.4705882, 0, 1, 1,
0.6498049, -0.6345006, 3.377018, 0.4745098, 0, 1, 1,
0.6529398, -0.7715214, 4.39294, 0.4823529, 0, 1, 1,
0.6576169, 1.676767, 0.4974072, 0.4862745, 0, 1, 1,
0.657758, 1.292755, -1.247288, 0.4941176, 0, 1, 1,
0.6598548, 0.9790543, 0.03435669, 0.5019608, 0, 1, 1,
0.6642693, -1.211742, 0.7745973, 0.5058824, 0, 1, 1,
0.6689118, -0.2648862, 1.096668, 0.5137255, 0, 1, 1,
0.6707762, -1.399484, 1.534272, 0.5176471, 0, 1, 1,
0.6717272, 0.1826442, 1.670104, 0.5254902, 0, 1, 1,
0.6720157, 2.071058, -0.1665306, 0.5294118, 0, 1, 1,
0.6848338, 0.2755605, 0.6159891, 0.5372549, 0, 1, 1,
0.6873443, -0.7325452, 3.256038, 0.5411765, 0, 1, 1,
0.6887334, -0.6634979, 3.698113, 0.5490196, 0, 1, 1,
0.6888562, 0.9559127, 0.3457232, 0.5529412, 0, 1, 1,
0.690753, -0.1867909, 1.268688, 0.5607843, 0, 1, 1,
0.6963588, 1.368501, 2.510496, 0.5647059, 0, 1, 1,
0.6989903, 1.729474, 0.5510047, 0.572549, 0, 1, 1,
0.6995736, -0.1016121, 1.567317, 0.5764706, 0, 1, 1,
0.7018654, 0.2358325, 1.676289, 0.5843138, 0, 1, 1,
0.7041609, -0.05943472, 4.164026, 0.5882353, 0, 1, 1,
0.7088041, -0.2119599, 3.169876, 0.5960785, 0, 1, 1,
0.7202727, -0.1246902, 3.101474, 0.6039216, 0, 1, 1,
0.727343, 0.4700956, 0.7641571, 0.6078432, 0, 1, 1,
0.7278602, -1.035812, 3.108038, 0.6156863, 0, 1, 1,
0.7284467, 0.7753413, -0.1786002, 0.6196079, 0, 1, 1,
0.7300437, -0.1894501, 2.444539, 0.627451, 0, 1, 1,
0.7316155, 1.509911, -0.5224649, 0.6313726, 0, 1, 1,
0.7324961, 1.45399, 2.423865, 0.6392157, 0, 1, 1,
0.7334157, -0.4895139, 1.807884, 0.6431373, 0, 1, 1,
0.7352965, -0.006328324, 2.743294, 0.6509804, 0, 1, 1,
0.7363446, -0.4123991, 3.168693, 0.654902, 0, 1, 1,
0.7418842, 0.06660618, 2.365106, 0.6627451, 0, 1, 1,
0.7453842, -1.048123, 4.241502, 0.6666667, 0, 1, 1,
0.7506406, 1.054883, -0.200961, 0.6745098, 0, 1, 1,
0.7509013, -0.3884287, 1.869201, 0.6784314, 0, 1, 1,
0.7517143, 1.847332, 0.2852757, 0.6862745, 0, 1, 1,
0.7611295, -0.8996843, 2.224784, 0.6901961, 0, 1, 1,
0.762392, 0.6988248, -1.22491, 0.6980392, 0, 1, 1,
0.762685, 0.1159557, 1.823555, 0.7058824, 0, 1, 1,
0.7627462, 0.2187497, 0.9403215, 0.7098039, 0, 1, 1,
0.7634227, 0.5105512, 2.718631, 0.7176471, 0, 1, 1,
0.7641228, -1.288185, 3.461171, 0.7215686, 0, 1, 1,
0.7659292, 0.111512, 2.406585, 0.7294118, 0, 1, 1,
0.7712575, -1.394063, 1.944093, 0.7333333, 0, 1, 1,
0.7782896, -1.553824, 1.835024, 0.7411765, 0, 1, 1,
0.7792337, -1.098116, 2.334191, 0.7450981, 0, 1, 1,
0.779498, -0.8451477, 2.566947, 0.7529412, 0, 1, 1,
0.7804746, -0.00590055, 1.899307, 0.7568628, 0, 1, 1,
0.7892217, 0.8905115, -0.3164072, 0.7647059, 0, 1, 1,
0.7895121, 0.1349659, 0.1193113, 0.7686275, 0, 1, 1,
0.7899982, -1.851349, 3.507135, 0.7764706, 0, 1, 1,
0.7937555, -2.192529, 3.109864, 0.7803922, 0, 1, 1,
0.7973653, -0.7076059, 3.07839, 0.7882353, 0, 1, 1,
0.8006504, 1.290501, -0.125775, 0.7921569, 0, 1, 1,
0.8016708, 0.9190409, 0.05631525, 0.8, 0, 1, 1,
0.8027429, 0.4236946, 1.080671, 0.8078431, 0, 1, 1,
0.8055381, 0.2499237, 2.58912, 0.8117647, 0, 1, 1,
0.8076335, 0.3893273, 0.2156213, 0.8196079, 0, 1, 1,
0.8208596, 0.8382595, 1.357944, 0.8235294, 0, 1, 1,
0.8229956, -0.335492, 0.8737301, 0.8313726, 0, 1, 1,
0.8266688, 0.7257453, 0.6340206, 0.8352941, 0, 1, 1,
0.828984, 0.737371, 0.447491, 0.8431373, 0, 1, 1,
0.8314642, 0.3327983, -0.7272791, 0.8470588, 0, 1, 1,
0.8335419, 0.1657366, 1.288813, 0.854902, 0, 1, 1,
0.8361834, 0.09562169, 1.054597, 0.8588235, 0, 1, 1,
0.8398086, -1.113148, 0.4064268, 0.8666667, 0, 1, 1,
0.842553, 1.257434, 0.7699226, 0.8705882, 0, 1, 1,
0.8471385, -1.314503, 2.091368, 0.8784314, 0, 1, 1,
0.8495234, 0.3663611, 3.056751, 0.8823529, 0, 1, 1,
0.861012, -2.87856, 2.731271, 0.8901961, 0, 1, 1,
0.8623455, 0.007300529, 3.282214, 0.8941177, 0, 1, 1,
0.8630943, -0.588232, 3.849771, 0.9019608, 0, 1, 1,
0.8640816, -1.14164, 2.285323, 0.9098039, 0, 1, 1,
0.8651421, 0.1599467, 2.071539, 0.9137255, 0, 1, 1,
0.8656683, 0.2151736, 1.485325, 0.9215686, 0, 1, 1,
0.8683608, 0.3912601, 2.733803, 0.9254902, 0, 1, 1,
0.8716561, -0.86558, 2.88063, 0.9333333, 0, 1, 1,
0.874155, -1.58596, 1.692324, 0.9372549, 0, 1, 1,
0.8744692, 0.3994838, 1.633178, 0.945098, 0, 1, 1,
0.8775275, 0.2702931, 1.473976, 0.9490196, 0, 1, 1,
0.8871663, -0.2458575, 1.266821, 0.9568627, 0, 1, 1,
0.9056956, 0.54696, 1.939533, 0.9607843, 0, 1, 1,
0.9072599, 0.7161574, 1.000634, 0.9686275, 0, 1, 1,
0.9100864, 0.8228776, 0.4212396, 0.972549, 0, 1, 1,
0.913815, -0.9002655, 0.722473, 0.9803922, 0, 1, 1,
0.9203408, -0.7646955, 2.64423, 0.9843137, 0, 1, 1,
0.92622, -1.112928, 2.658371, 0.9921569, 0, 1, 1,
0.9272143, 1.141676, 1.147206, 0.9960784, 0, 1, 1,
0.9365292, 0.665081, 0.7640505, 1, 0, 0.9960784, 1,
0.9365424, 0.5297325, 0.2067524, 1, 0, 0.9882353, 1,
0.9393314, 0.2969031, 1.267112, 1, 0, 0.9843137, 1,
0.946687, 1.310131, 1.268508, 1, 0, 0.9764706, 1,
0.9483256, -0.5025198, 2.144635, 1, 0, 0.972549, 1,
0.9490185, 0.3029242, 2.709922, 1, 0, 0.9647059, 1,
0.9592075, 0.5165876, 1.580831, 1, 0, 0.9607843, 1,
0.9595434, -0.4635142, 2.190697, 1, 0, 0.9529412, 1,
0.9671831, -1.048277, 3.937535, 1, 0, 0.9490196, 1,
0.9709769, -0.1175015, 2.030196, 1, 0, 0.9411765, 1,
0.9730325, -1.050408, 2.077985, 1, 0, 0.9372549, 1,
0.9737944, -2.385541, 1.352895, 1, 0, 0.9294118, 1,
0.9772262, 1.247958, 1.415385, 1, 0, 0.9254902, 1,
0.9804325, -2.231441, 2.463369, 1, 0, 0.9176471, 1,
0.982088, 1.549474, 1.190833, 1, 0, 0.9137255, 1,
0.9856895, 1.163408, 1.217099, 1, 0, 0.9058824, 1,
0.9891881, -1.084816, 1.603892, 1, 0, 0.9019608, 1,
0.9995257, -1.111668, 0.9763281, 1, 0, 0.8941177, 1,
1.002373, -0.9229817, 2.696688, 1, 0, 0.8862745, 1,
1.004169, 0.7810475, 1.378804, 1, 0, 0.8823529, 1,
1.006888, -0.004102162, 1.555549, 1, 0, 0.8745098, 1,
1.009141, -0.5647365, 2.973504, 1, 0, 0.8705882, 1,
1.012698, -0.7633834, 1.962949, 1, 0, 0.8627451, 1,
1.014386, 0.1558477, 0.2529853, 1, 0, 0.8588235, 1,
1.015192, -1.193178, 2.929932, 1, 0, 0.8509804, 1,
1.015754, -0.01243888, 2.250127, 1, 0, 0.8470588, 1,
1.017318, 0.3272037, 2.069527, 1, 0, 0.8392157, 1,
1.029311, -0.7464448, 2.539824, 1, 0, 0.8352941, 1,
1.031716, -0.6529254, 1.99064, 1, 0, 0.827451, 1,
1.040745, -1.51054, 1.688612, 1, 0, 0.8235294, 1,
1.042549, -1.376123, 2.259251, 1, 0, 0.8156863, 1,
1.044976, 0.3349562, 0.4330728, 1, 0, 0.8117647, 1,
1.046324, 0.04413898, 0.6816099, 1, 0, 0.8039216, 1,
1.050685, 0.1319553, 1.697821, 1, 0, 0.7960784, 1,
1.051156, -0.3124666, 3.754317, 1, 0, 0.7921569, 1,
1.06425, -1.211047, 0.9636232, 1, 0, 0.7843137, 1,
1.07557, 1.602126, 2.034643, 1, 0, 0.7803922, 1,
1.07703, 0.805539, 1.314186, 1, 0, 0.772549, 1,
1.07854, 0.2842163, 1.999427, 1, 0, 0.7686275, 1,
1.098529, 1.051164, 0.6092352, 1, 0, 0.7607843, 1,
1.107194, -1.034214, 2.193289, 1, 0, 0.7568628, 1,
1.123649, -0.370808, 1.222551, 1, 0, 0.7490196, 1,
1.12559, -1.756166, 2.603529, 1, 0, 0.7450981, 1,
1.130027, -0.3382019, 3.612597, 1, 0, 0.7372549, 1,
1.139527, 1.084381, 0.485597, 1, 0, 0.7333333, 1,
1.151145, 1.125814, 0.02708556, 1, 0, 0.7254902, 1,
1.152306, 1.344422, -0.06953096, 1, 0, 0.7215686, 1,
1.169343, -1.073688, 0.593064, 1, 0, 0.7137255, 1,
1.171762, 0.6471646, 1.818014, 1, 0, 0.7098039, 1,
1.177507, -1.878603, 3.427999, 1, 0, 0.7019608, 1,
1.187984, 1.053175, 2.196561, 1, 0, 0.6941177, 1,
1.211109, 1.510957, -0.9725228, 1, 0, 0.6901961, 1,
1.21209, -0.03113304, 0.439547, 1, 0, 0.682353, 1,
1.216183, 0.7450789, 1.807433, 1, 0, 0.6784314, 1,
1.227278, 0.3338496, -0.03354709, 1, 0, 0.6705883, 1,
1.242095, -1.059351, 0.1293404, 1, 0, 0.6666667, 1,
1.24441, 0.3623085, 1.449617, 1, 0, 0.6588235, 1,
1.255857, 1.042997, -0.3516712, 1, 0, 0.654902, 1,
1.260048, -0.9477592, 2.723386, 1, 0, 0.6470588, 1,
1.260764, 0.3599544, -0.3457161, 1, 0, 0.6431373, 1,
1.261535, -0.9317009, 1.665911, 1, 0, 0.6352941, 1,
1.267562, -0.3723788, 1.330462, 1, 0, 0.6313726, 1,
1.269904, 0.8294798, -0.1201848, 1, 0, 0.6235294, 1,
1.273643, 1.266062, 0.8325084, 1, 0, 0.6196079, 1,
1.280672, -0.8032383, 1.807137, 1, 0, 0.6117647, 1,
1.283549, 1.125817, 1.416034, 1, 0, 0.6078432, 1,
1.28405, 1.200802, 0.6056929, 1, 0, 0.6, 1,
1.290731, 0.07981934, 1.842529, 1, 0, 0.5921569, 1,
1.301447, 0.4725749, 1.674447, 1, 0, 0.5882353, 1,
1.314244, 0.3400505, 1.45028, 1, 0, 0.5803922, 1,
1.318032, -0.4124353, 2.017635, 1, 0, 0.5764706, 1,
1.32186, -1.828573, 2.376139, 1, 0, 0.5686275, 1,
1.333528, 1.626974, 0.5380146, 1, 0, 0.5647059, 1,
1.336077, -0.1784711, 0.9730135, 1, 0, 0.5568628, 1,
1.336444, 1.011047, 0.3108426, 1, 0, 0.5529412, 1,
1.341254, 0.7970871, 0.511157, 1, 0, 0.5450981, 1,
1.345574, 0.8379366, 1.629234, 1, 0, 0.5411765, 1,
1.351967, -1.402513, 1.14139, 1, 0, 0.5333334, 1,
1.360974, -1.816978, 2.046542, 1, 0, 0.5294118, 1,
1.360977, -0.1618628, -0.09744917, 1, 0, 0.5215687, 1,
1.366994, 0.4624706, 1.52222, 1, 0, 0.5176471, 1,
1.370263, -0.9320544, 2.706386, 1, 0, 0.509804, 1,
1.375421, 0.7553887, -0.6118992, 1, 0, 0.5058824, 1,
1.383472, -0.1175664, 2.103659, 1, 0, 0.4980392, 1,
1.387982, -0.9452953, 3.414824, 1, 0, 0.4901961, 1,
1.390906, 0.0009426893, 0.5221539, 1, 0, 0.4862745, 1,
1.392067, 0.2603157, 1.656496, 1, 0, 0.4784314, 1,
1.395978, 0.5583782, 1.291374, 1, 0, 0.4745098, 1,
1.39683, -0.1606451, 2.083452, 1, 0, 0.4666667, 1,
1.397024, 1.910817, 2.428037, 1, 0, 0.4627451, 1,
1.401347, 0.4992351, 0.392495, 1, 0, 0.454902, 1,
1.40178, 0.6231808, 1.110164, 1, 0, 0.4509804, 1,
1.404305, -1.526572, 2.04899, 1, 0, 0.4431373, 1,
1.405511, 0.3323322, 1.12199, 1, 0, 0.4392157, 1,
1.411896, -0.07266593, 2.182861, 1, 0, 0.4313726, 1,
1.417848, -1.349822, 3.636517, 1, 0, 0.427451, 1,
1.419844, 2.332644, 1.035667, 1, 0, 0.4196078, 1,
1.423456, -1.760075, 2.659574, 1, 0, 0.4156863, 1,
1.427976, -0.3092031, 1.555376, 1, 0, 0.4078431, 1,
1.445239, -1.283715, 1.071254, 1, 0, 0.4039216, 1,
1.451179, 1.219139, 0.1179161, 1, 0, 0.3960784, 1,
1.465279, -0.7945325, 4.066382, 1, 0, 0.3882353, 1,
1.476527, -0.7548853, 0.607401, 1, 0, 0.3843137, 1,
1.499673, 0.3449813, 0.9935306, 1, 0, 0.3764706, 1,
1.511184, -1.729407, 2.377512, 1, 0, 0.372549, 1,
1.513318, -0.4165685, 3.033116, 1, 0, 0.3647059, 1,
1.514592, -0.940356, 2.727191, 1, 0, 0.3607843, 1,
1.527134, -0.5240666, 2.822411, 1, 0, 0.3529412, 1,
1.55741, -0.1986014, 1.604336, 1, 0, 0.3490196, 1,
1.573316, 2.246432, 0.5193422, 1, 0, 0.3411765, 1,
1.574967, 0.1201043, 1.126711, 1, 0, 0.3372549, 1,
1.594204, -0.6589592, 3.633757, 1, 0, 0.3294118, 1,
1.596708, -0.1260583, 0.7895467, 1, 0, 0.3254902, 1,
1.60701, -1.370233, 3.483785, 1, 0, 0.3176471, 1,
1.608947, 0.2590465, 0.2819678, 1, 0, 0.3137255, 1,
1.627132, -0.1313698, 0.6161967, 1, 0, 0.3058824, 1,
1.652081, -0.8865627, 2.047486, 1, 0, 0.2980392, 1,
1.661928, -0.9978207, 2.457673, 1, 0, 0.2941177, 1,
1.6685, -0.6073788, 1.155495, 1, 0, 0.2862745, 1,
1.678114, -1.162639, 0.7883469, 1, 0, 0.282353, 1,
1.697474, -1.305572, 2.505796, 1, 0, 0.2745098, 1,
1.713167, -1.319175, 2.518175, 1, 0, 0.2705882, 1,
1.723605, 1.751853, 2.127813, 1, 0, 0.2627451, 1,
1.733121, -0.002121457, 0.3551854, 1, 0, 0.2588235, 1,
1.739863, 0.08028224, 2.136963, 1, 0, 0.2509804, 1,
1.749124, -0.08593977, 4.98997, 1, 0, 0.2470588, 1,
1.762568, -1.791255, 4.9731, 1, 0, 0.2392157, 1,
1.800228, -0.203249, 0.4472622, 1, 0, 0.2352941, 1,
1.801793, -0.2469262, 0.6079747, 1, 0, 0.227451, 1,
1.807562, -1.184201, 3.313211, 1, 0, 0.2235294, 1,
1.836231, 0.2436747, 1.439075, 1, 0, 0.2156863, 1,
1.844536, -0.5253825, 1.958971, 1, 0, 0.2117647, 1,
1.847333, 0.4720419, 1.998505, 1, 0, 0.2039216, 1,
1.924432, 0.8956051, 1.38394, 1, 0, 0.1960784, 1,
1.931296, -0.3007661, 1.35259, 1, 0, 0.1921569, 1,
1.953257, -0.8079348, 1.481662, 1, 0, 0.1843137, 1,
1.960238, 0.3325649, 0.5220202, 1, 0, 0.1803922, 1,
1.977718, 0.1525026, 0.8708714, 1, 0, 0.172549, 1,
1.984492, -0.6766107, 3.315207, 1, 0, 0.1686275, 1,
1.98902, -2.274474, 2.641553, 1, 0, 0.1607843, 1,
1.9913, 0.231955, 1.460267, 1, 0, 0.1568628, 1,
2.018475, 0.8603218, 0.002345318, 1, 0, 0.1490196, 1,
2.031677, 0.02895303, 0.6864353, 1, 0, 0.145098, 1,
2.052529, -0.8541146, 1.554722, 1, 0, 0.1372549, 1,
2.054123, 0.1553629, 2.742216, 1, 0, 0.1333333, 1,
2.060676, 0.3173636, 1.207376, 1, 0, 0.1254902, 1,
2.077887, -0.8874464, 3.463936, 1, 0, 0.1215686, 1,
2.106687, -0.8503368, 1.465638, 1, 0, 0.1137255, 1,
2.144199, 0.5771046, 1.126875, 1, 0, 0.1098039, 1,
2.181678, -2.071958, 4.303397, 1, 0, 0.1019608, 1,
2.204316, -0.5694385, 0.4945151, 1, 0, 0.09411765, 1,
2.218735, 0.7836324, 1.732637, 1, 0, 0.09019608, 1,
2.297871, -2.221185, 2.082587, 1, 0, 0.08235294, 1,
2.326354, -1.118765, 0.320048, 1, 0, 0.07843138, 1,
2.337954, -1.863895, 1.744329, 1, 0, 0.07058824, 1,
2.343914, -1.811358, 1.929077, 1, 0, 0.06666667, 1,
2.364766, 0.177712, 1.486112, 1, 0, 0.05882353, 1,
2.371304, 0.05065146, 2.077475, 1, 0, 0.05490196, 1,
2.401507, 1.096708, 2.004177, 1, 0, 0.04705882, 1,
2.425095, 0.02328584, 2.06227, 1, 0, 0.04313726, 1,
2.609542, -0.05844313, 3.137269, 1, 0, 0.03529412, 1,
2.640534, -2.860414, 3.752648, 1, 0, 0.03137255, 1,
2.769483, 2.256215, 1.604146, 1, 0, 0.02352941, 1,
2.770504, 0.9699906, 2.057587, 1, 0, 0.01960784, 1,
2.916278, 1.378459, 2.073996, 1, 0, 0.01176471, 1,
3.253324, -0.5343011, 0.2075405, 1, 0, 0.007843138, 1
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
-0.1628448, -4.697147, -7.975533, 0, -0.5, 0.5, 0.5,
-0.1628448, -4.697147, -7.975533, 1, -0.5, 0.5, 0.5,
-0.1628448, -4.697147, -7.975533, 1, 1.5, 0.5, 0.5,
-0.1628448, -4.697147, -7.975533, 0, 1.5, 0.5, 0.5
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
-4.737095, -0.3869208, -7.975533, 0, -0.5, 0.5, 0.5,
-4.737095, -0.3869208, -7.975533, 1, -0.5, 0.5, 0.5,
-4.737095, -0.3869208, -7.975533, 1, 1.5, 0.5, 0.5,
-4.737095, -0.3869208, -7.975533, 0, 1.5, 0.5, 0.5
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
-4.737095, -4.697147, -0.09507108, 0, -0.5, 0.5, 0.5,
-4.737095, -4.697147, -0.09507108, 1, -0.5, 0.5, 0.5,
-4.737095, -4.697147, -0.09507108, 1, 1.5, 0.5, 0.5,
-4.737095, -4.697147, -0.09507108, 0, 1.5, 0.5, 0.5
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
-3, -3.70248, -6.156965,
3, -3.70248, -6.156965,
-3, -3.70248, -6.156965,
-3, -3.868258, -6.46006,
-2, -3.70248, -6.156965,
-2, -3.868258, -6.46006,
-1, -3.70248, -6.156965,
-1, -3.868258, -6.46006,
0, -3.70248, -6.156965,
0, -3.868258, -6.46006,
1, -3.70248, -6.156965,
1, -3.868258, -6.46006,
2, -3.70248, -6.156965,
2, -3.868258, -6.46006,
3, -3.70248, -6.156965,
3, -3.868258, -6.46006
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
-3, -4.199813, -7.066249, 0, -0.5, 0.5, 0.5,
-3, -4.199813, -7.066249, 1, -0.5, 0.5, 0.5,
-3, -4.199813, -7.066249, 1, 1.5, 0.5, 0.5,
-3, -4.199813, -7.066249, 0, 1.5, 0.5, 0.5,
-2, -4.199813, -7.066249, 0, -0.5, 0.5, 0.5,
-2, -4.199813, -7.066249, 1, -0.5, 0.5, 0.5,
-2, -4.199813, -7.066249, 1, 1.5, 0.5, 0.5,
-2, -4.199813, -7.066249, 0, 1.5, 0.5, 0.5,
-1, -4.199813, -7.066249, 0, -0.5, 0.5, 0.5,
-1, -4.199813, -7.066249, 1, -0.5, 0.5, 0.5,
-1, -4.199813, -7.066249, 1, 1.5, 0.5, 0.5,
-1, -4.199813, -7.066249, 0, 1.5, 0.5, 0.5,
0, -4.199813, -7.066249, 0, -0.5, 0.5, 0.5,
0, -4.199813, -7.066249, 1, -0.5, 0.5, 0.5,
0, -4.199813, -7.066249, 1, 1.5, 0.5, 0.5,
0, -4.199813, -7.066249, 0, 1.5, 0.5, 0.5,
1, -4.199813, -7.066249, 0, -0.5, 0.5, 0.5,
1, -4.199813, -7.066249, 1, -0.5, 0.5, 0.5,
1, -4.199813, -7.066249, 1, 1.5, 0.5, 0.5,
1, -4.199813, -7.066249, 0, 1.5, 0.5, 0.5,
2, -4.199813, -7.066249, 0, -0.5, 0.5, 0.5,
2, -4.199813, -7.066249, 1, -0.5, 0.5, 0.5,
2, -4.199813, -7.066249, 1, 1.5, 0.5, 0.5,
2, -4.199813, -7.066249, 0, 1.5, 0.5, 0.5,
3, -4.199813, -7.066249, 0, -0.5, 0.5, 0.5,
3, -4.199813, -7.066249, 1, -0.5, 0.5, 0.5,
3, -4.199813, -7.066249, 1, 1.5, 0.5, 0.5,
3, -4.199813, -7.066249, 0, 1.5, 0.5, 0.5
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
-3.681499, -3, -6.156965,
-3.681499, 2, -6.156965,
-3.681499, -3, -6.156965,
-3.857431, -3, -6.46006,
-3.681499, -2, -6.156965,
-3.857431, -2, -6.46006,
-3.681499, -1, -6.156965,
-3.857431, -1, -6.46006,
-3.681499, 0, -6.156965,
-3.857431, 0, -6.46006,
-3.681499, 1, -6.156965,
-3.857431, 1, -6.46006,
-3.681499, 2, -6.156965,
-3.857431, 2, -6.46006
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
-4.209297, -3, -7.066249, 0, -0.5, 0.5, 0.5,
-4.209297, -3, -7.066249, 1, -0.5, 0.5, 0.5,
-4.209297, -3, -7.066249, 1, 1.5, 0.5, 0.5,
-4.209297, -3, -7.066249, 0, 1.5, 0.5, 0.5,
-4.209297, -2, -7.066249, 0, -0.5, 0.5, 0.5,
-4.209297, -2, -7.066249, 1, -0.5, 0.5, 0.5,
-4.209297, -2, -7.066249, 1, 1.5, 0.5, 0.5,
-4.209297, -2, -7.066249, 0, 1.5, 0.5, 0.5,
-4.209297, -1, -7.066249, 0, -0.5, 0.5, 0.5,
-4.209297, -1, -7.066249, 1, -0.5, 0.5, 0.5,
-4.209297, -1, -7.066249, 1, 1.5, 0.5, 0.5,
-4.209297, -1, -7.066249, 0, 1.5, 0.5, 0.5,
-4.209297, 0, -7.066249, 0, -0.5, 0.5, 0.5,
-4.209297, 0, -7.066249, 1, -0.5, 0.5, 0.5,
-4.209297, 0, -7.066249, 1, 1.5, 0.5, 0.5,
-4.209297, 0, -7.066249, 0, 1.5, 0.5, 0.5,
-4.209297, 1, -7.066249, 0, -0.5, 0.5, 0.5,
-4.209297, 1, -7.066249, 1, -0.5, 0.5, 0.5,
-4.209297, 1, -7.066249, 1, 1.5, 0.5, 0.5,
-4.209297, 1, -7.066249, 0, 1.5, 0.5, 0.5,
-4.209297, 2, -7.066249, 0, -0.5, 0.5, 0.5,
-4.209297, 2, -7.066249, 1, -0.5, 0.5, 0.5,
-4.209297, 2, -7.066249, 1, 1.5, 0.5, 0.5,
-4.209297, 2, -7.066249, 0, 1.5, 0.5, 0.5
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
-3.681499, -3.70248, -4,
-3.681499, -3.70248, 4,
-3.681499, -3.70248, -4,
-3.857431, -3.868258, -4,
-3.681499, -3.70248, -2,
-3.857431, -3.868258, -2,
-3.681499, -3.70248, 0,
-3.857431, -3.868258, 0,
-3.681499, -3.70248, 2,
-3.857431, -3.868258, 2,
-3.681499, -3.70248, 4,
-3.857431, -3.868258, 4
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
-4.209297, -4.199813, -4, 0, -0.5, 0.5, 0.5,
-4.209297, -4.199813, -4, 1, -0.5, 0.5, 0.5,
-4.209297, -4.199813, -4, 1, 1.5, 0.5, 0.5,
-4.209297, -4.199813, -4, 0, 1.5, 0.5, 0.5,
-4.209297, -4.199813, -2, 0, -0.5, 0.5, 0.5,
-4.209297, -4.199813, -2, 1, -0.5, 0.5, 0.5,
-4.209297, -4.199813, -2, 1, 1.5, 0.5, 0.5,
-4.209297, -4.199813, -2, 0, 1.5, 0.5, 0.5,
-4.209297, -4.199813, 0, 0, -0.5, 0.5, 0.5,
-4.209297, -4.199813, 0, 1, -0.5, 0.5, 0.5,
-4.209297, -4.199813, 0, 1, 1.5, 0.5, 0.5,
-4.209297, -4.199813, 0, 0, 1.5, 0.5, 0.5,
-4.209297, -4.199813, 2, 0, -0.5, 0.5, 0.5,
-4.209297, -4.199813, 2, 1, -0.5, 0.5, 0.5,
-4.209297, -4.199813, 2, 1, 1.5, 0.5, 0.5,
-4.209297, -4.199813, 2, 0, 1.5, 0.5, 0.5,
-4.209297, -4.199813, 4, 0, -0.5, 0.5, 0.5,
-4.209297, -4.199813, 4, 1, -0.5, 0.5, 0.5,
-4.209297, -4.199813, 4, 1, 1.5, 0.5, 0.5,
-4.209297, -4.199813, 4, 0, 1.5, 0.5, 0.5
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
-3.681499, -3.70248, -6.156965,
-3.681499, 2.928638, -6.156965,
-3.681499, -3.70248, 5.966823,
-3.681499, 2.928638, 5.966823,
-3.681499, -3.70248, -6.156965,
-3.681499, -3.70248, 5.966823,
-3.681499, 2.928638, -6.156965,
-3.681499, 2.928638, 5.966823,
-3.681499, -3.70248, -6.156965,
3.355809, -3.70248, -6.156965,
-3.681499, -3.70248, 5.966823,
3.355809, -3.70248, 5.966823,
-3.681499, 2.928638, -6.156965,
3.355809, 2.928638, -6.156965,
-3.681499, 2.928638, 5.966823,
3.355809, 2.928638, 5.966823,
3.355809, -3.70248, -6.156965,
3.355809, 2.928638, -6.156965,
3.355809, -3.70248, 5.966823,
3.355809, 2.928638, 5.966823,
3.355809, -3.70248, -6.156965,
3.355809, -3.70248, 5.966823,
3.355809, 2.928638, -6.156965,
3.355809, 2.928638, 5.966823
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
var radius = 8.280688;
var distance = 36.84172;
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
mvMatrix.translate( 0.1628448, 0.3869208, 0.09507108 );
mvMatrix.scale( 1.272254, 1.350186, 0.7384856 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.84172);
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
princep<-read.table("princep.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-princep$V2
```

```
## Error in eval(expr, envir, enclos): object 'princep' not found
```

```r
y<-princep$V3
```

```
## Error in eval(expr, envir, enclos): object 'princep' not found
```

```r
z<-princep$V4
```

```
## Error in eval(expr, envir, enclos): object 'princep' not found
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
-3.579014, -0.194915, -1.86148, 0, 0, 1, 1, 1,
-2.855978, 0.3976543, -2.884832, 1, 0, 0, 1, 1,
-2.592111, 1.224068, -0.7088763, 1, 0, 0, 1, 1,
-2.515298, -1.080848, -0.8453243, 1, 0, 0, 1, 1,
-2.399595, 0.1468031, -0.789712, 1, 0, 0, 1, 1,
-2.37085, -0.648811, -1.279995, 1, 0, 0, 1, 1,
-2.308413, 1.380649, -1.90597, 0, 0, 0, 1, 1,
-2.307682, -0.4598792, -2.595257, 0, 0, 0, 1, 1,
-2.296531, 0.1493473, -1.080637, 0, 0, 0, 1, 1,
-2.285136, 0.1730683, -0.5956007, 0, 0, 0, 1, 1,
-2.278156, 0.0731976, -2.627151, 0, 0, 0, 1, 1,
-2.263393, -1.017089, -1.991974, 0, 0, 0, 1, 1,
-2.157958, 0.3583362, -2.329193, 0, 0, 0, 1, 1,
-2.106084, -1.755046, -4.664791, 1, 1, 1, 1, 1,
-2.076807, 0.1293688, -1.635143, 1, 1, 1, 1, 1,
-2.060053, 2.191069, -0.5103105, 1, 1, 1, 1, 1,
-2.045039, -1.198703, -3.215409, 1, 1, 1, 1, 1,
-2.012446, -0.6188066, -1.699047, 1, 1, 1, 1, 1,
-1.998834, 0.04996691, -1.8369, 1, 1, 1, 1, 1,
-1.973599, 1.006817, -0.8242769, 1, 1, 1, 1, 1,
-1.925323, -1.92545, -3.493052, 1, 1, 1, 1, 1,
-1.919414, -0.7623965, -1.428528, 1, 1, 1, 1, 1,
-1.916577, -0.5661481, -2.766222, 1, 1, 1, 1, 1,
-1.903509, 0.2995274, -1.81305, 1, 1, 1, 1, 1,
-1.891403, 2.232821, -0.9750429, 1, 1, 1, 1, 1,
-1.88853, 0.6631383, -1.598909, 1, 1, 1, 1, 1,
-1.886151, -1.04441, -1.336063, 1, 1, 1, 1, 1,
-1.874444, -2.00763, -2.206131, 1, 1, 1, 1, 1,
-1.866413, -1.08417, -1.752663, 0, 0, 1, 1, 1,
-1.853478, 0.516232, -1.605627, 1, 0, 0, 1, 1,
-1.834038, -0.1216878, -1.626848, 1, 0, 0, 1, 1,
-1.819057, 1.144859, -0.1475296, 1, 0, 0, 1, 1,
-1.793749, -0.6214076, -0.1381454, 1, 0, 0, 1, 1,
-1.787451, 1.073214, 0.0890611, 1, 0, 0, 1, 1,
-1.787148, -0.5223922, -0.4533815, 0, 0, 0, 1, 1,
-1.779166, 0.3823196, -1.050816, 0, 0, 0, 1, 1,
-1.770263, 0.7019514, 0.1137868, 0, 0, 0, 1, 1,
-1.760745, 0.06371419, -1.788678, 0, 0, 0, 1, 1,
-1.758001, -0.6204373, -4.109402, 0, 0, 0, 1, 1,
-1.703209, -1.062344, -1.900053, 0, 0, 0, 1, 1,
-1.69613, -0.6344913, -3.483399, 0, 0, 0, 1, 1,
-1.688709, 0.4857638, -1.464087, 1, 1, 1, 1, 1,
-1.683907, 0.6317726, -1.107151, 1, 1, 1, 1, 1,
-1.679469, 1.355111, -2.568567, 1, 1, 1, 1, 1,
-1.670874, -0.1750485, -1.378375, 1, 1, 1, 1, 1,
-1.65933, -0.3899459, -2.618004, 1, 1, 1, 1, 1,
-1.645471, -0.02026855, -1.527339, 1, 1, 1, 1, 1,
-1.643877, -0.8026057, -2.608367, 1, 1, 1, 1, 1,
-1.631393, 1.357237, -3.081853, 1, 1, 1, 1, 1,
-1.614748, -0.7494032, -1.607231, 1, 1, 1, 1, 1,
-1.609917, -0.4612081, -2.992908, 1, 1, 1, 1, 1,
-1.564903, -0.02655167, -2.555528, 1, 1, 1, 1, 1,
-1.56189, -0.320924, -2.892545, 1, 1, 1, 1, 1,
-1.55472, -0.3625971, 0.9892681, 1, 1, 1, 1, 1,
-1.552032, 0.8443816, -2.703323, 1, 1, 1, 1, 1,
-1.550893, 0.7182674, -0.6946365, 1, 1, 1, 1, 1,
-1.536515, 1.085337, 0.5228219, 0, 0, 1, 1, 1,
-1.532085, 0.1993788, -1.331584, 1, 0, 0, 1, 1,
-1.521889, 0.4885179, -0.09636592, 1, 0, 0, 1, 1,
-1.520019, 1.614929, -0.4563529, 1, 0, 0, 1, 1,
-1.50536, -1.33003, -1.303459, 1, 0, 0, 1, 1,
-1.504361, -0.3852833, -4.534656, 1, 0, 0, 1, 1,
-1.503169, -0.3698342, -2.053392, 0, 0, 0, 1, 1,
-1.486423, 0.4482997, -1.086659, 0, 0, 0, 1, 1,
-1.483464, 1.152829, -1.49425, 0, 0, 0, 1, 1,
-1.481483, -0.2170382, -1.046173, 0, 0, 0, 1, 1,
-1.474145, 0.4063321, -1.249897, 0, 0, 0, 1, 1,
-1.472337, -0.9495449, -2.240901, 0, 0, 0, 1, 1,
-1.467822, -0.3305579, -2.05923, 0, 0, 0, 1, 1,
-1.460606, 0.9490268, -2.034315, 1, 1, 1, 1, 1,
-1.460468, -0.4033782, -1.002562, 1, 1, 1, 1, 1,
-1.458446, -0.9366784, -4.389861, 1, 1, 1, 1, 1,
-1.445456, -1.036988, -2.902924, 1, 1, 1, 1, 1,
-1.442731, 1.232093, -0.4811189, 1, 1, 1, 1, 1,
-1.439594, 1.459313, -0.2220655, 1, 1, 1, 1, 1,
-1.439122, -0.1018421, -1.439169, 1, 1, 1, 1, 1,
-1.424045, 1.845579, -2.187193, 1, 1, 1, 1, 1,
-1.415143, -1.345072, -1.863925, 1, 1, 1, 1, 1,
-1.410836, -0.4128928, 0.06851525, 1, 1, 1, 1, 1,
-1.401622, 1.166757, -1.887985, 1, 1, 1, 1, 1,
-1.401292, -0.3439601, -0.3395258, 1, 1, 1, 1, 1,
-1.390025, -1.045806, -1.323191, 1, 1, 1, 1, 1,
-1.370843, 0.3838818, -2.453521, 1, 1, 1, 1, 1,
-1.362977, -0.8473616, -0.7506475, 1, 1, 1, 1, 1,
-1.35991, -1.3681, -2.998431, 0, 0, 1, 1, 1,
-1.355521, 1.326137, 0.2066969, 1, 0, 0, 1, 1,
-1.348289, 1.602529, -0.6655111, 1, 0, 0, 1, 1,
-1.343157, 0.1851401, -2.081265, 1, 0, 0, 1, 1,
-1.320653, 0.3039524, 0.3542254, 1, 0, 0, 1, 1,
-1.319953, 0.6372747, 0.04303459, 1, 0, 0, 1, 1,
-1.30004, 0.8521747, -0.4196103, 0, 0, 0, 1, 1,
-1.297947, -0.660238, -1.216185, 0, 0, 0, 1, 1,
-1.293345, 0.6037745, -2.242249, 0, 0, 0, 1, 1,
-1.287259, 1.417627, -2.834992, 0, 0, 0, 1, 1,
-1.286398, -1.575887, -0.7186731, 0, 0, 0, 1, 1,
-1.284914, 0.07263827, -0.5027546, 0, 0, 0, 1, 1,
-1.275006, 1.983831, -0.2363831, 0, 0, 0, 1, 1,
-1.266029, -0.8164802, -2.768449, 1, 1, 1, 1, 1,
-1.262488, 0.4956609, 0.5327087, 1, 1, 1, 1, 1,
-1.260087, 1.74821, -0.2220802, 1, 1, 1, 1, 1,
-1.246015, 0.2352991, -1.88486, 1, 1, 1, 1, 1,
-1.237578, -1.160853, -3.236602, 1, 1, 1, 1, 1,
-1.234605, -1.396991, -1.518538, 1, 1, 1, 1, 1,
-1.228259, -0.2310967, -0.540402, 1, 1, 1, 1, 1,
-1.224572, 1.442806, 0.4141728, 1, 1, 1, 1, 1,
-1.21602, 0.2919139, -0.4201511, 1, 1, 1, 1, 1,
-1.215909, 1.02319, -0.2826081, 1, 1, 1, 1, 1,
-1.206773, 1.320356, -0.5767416, 1, 1, 1, 1, 1,
-1.194835, -0.3490902, -2.969573, 1, 1, 1, 1, 1,
-1.193485, 0.7558027, -1.342265, 1, 1, 1, 1, 1,
-1.185252, -0.2555208, -2.473947, 1, 1, 1, 1, 1,
-1.183063, 1.127672, -1.161248, 1, 1, 1, 1, 1,
-1.179053, 0.0145343, -2.148279, 0, 0, 1, 1, 1,
-1.173, -0.5818264, -4.614549, 1, 0, 0, 1, 1,
-1.172113, -0.3021981, -2.50333, 1, 0, 0, 1, 1,
-1.169403, -0.5614567, -1.671346, 1, 0, 0, 1, 1,
-1.169001, -0.26197, -3.386121, 1, 0, 0, 1, 1,
-1.168003, -1.457676, -2.455994, 1, 0, 0, 1, 1,
-1.160955, 0.09553348, 0.03930901, 0, 0, 0, 1, 1,
-1.160828, -0.6366501, 0.01354184, 0, 0, 0, 1, 1,
-1.154152, -1.590679, -1.60679, 0, 0, 0, 1, 1,
-1.145804, -0.05673773, -1.45633, 0, 0, 0, 1, 1,
-1.142941, 0.949251, -0.7302178, 0, 0, 0, 1, 1,
-1.137312, -1.099638, -1.469218, 0, 0, 0, 1, 1,
-1.136002, -0.3394528, -3.394882, 0, 0, 0, 1, 1,
-1.130621, 0.1660165, -0.02547504, 1, 1, 1, 1, 1,
-1.125512, 2.026507, 0.2960003, 1, 1, 1, 1, 1,
-1.125387, -0.1236006, -1.520095, 1, 1, 1, 1, 1,
-1.116227, -1.37829, -2.109916, 1, 1, 1, 1, 1,
-1.112928, 0.2632583, -1.510304, 1, 1, 1, 1, 1,
-1.103573, -1.178505, -1.997396, 1, 1, 1, 1, 1,
-1.101815, -0.3144715, -2.909973, 1, 1, 1, 1, 1,
-1.084668, 0.6822261, -1.074398, 1, 1, 1, 1, 1,
-1.080186, 1.01692, -0.7805008, 1, 1, 1, 1, 1,
-1.073216, 0.03445921, -0.9989911, 1, 1, 1, 1, 1,
-1.07292, -1.461855, -2.7727, 1, 1, 1, 1, 1,
-1.072136, 1.484424, -1.703423, 1, 1, 1, 1, 1,
-1.067912, -2.054351, -1.018909, 1, 1, 1, 1, 1,
-1.063906, -0.926175, -2.970206, 1, 1, 1, 1, 1,
-1.061939, -0.6891341, -2.366343, 1, 1, 1, 1, 1,
-1.050746, 0.2701094, -0.641292, 0, 0, 1, 1, 1,
-1.049706, 0.4585655, -2.616725, 1, 0, 0, 1, 1,
-1.047707, 0.2602378, -1.16816, 1, 0, 0, 1, 1,
-1.045927, -0.6331714, -1.498958, 1, 0, 0, 1, 1,
-1.040888, -0.4522082, -2.518577, 1, 0, 0, 1, 1,
-1.033863, 0.2868, -1.606485, 1, 0, 0, 1, 1,
-1.015474, -1.226589, -2.99078, 0, 0, 0, 1, 1,
-1.01543, -0.3505214, -0.5203279, 0, 0, 0, 1, 1,
-1.014359, -0.4805236, -1.554555, 0, 0, 0, 1, 1,
-1.014306, -1.736916, -2.228732, 0, 0, 0, 1, 1,
-1.011261, 0.08799291, -2.579027, 0, 0, 0, 1, 1,
-1.009651, -0.5465011, -1.362474, 0, 0, 0, 1, 1,
-1.003543, 0.4672181, -0.1712961, 0, 0, 0, 1, 1,
-0.9999288, -0.9962822, -1.437345, 1, 1, 1, 1, 1,
-0.9956045, 0.6675436, -1.624618, 1, 1, 1, 1, 1,
-0.9942263, 0.3514696, -1.712304, 1, 1, 1, 1, 1,
-0.990965, -1.539812, -3.372782, 1, 1, 1, 1, 1,
-0.9907442, -1.336497, -2.987297, 1, 1, 1, 1, 1,
-0.990157, 0.286546, -1.604833, 1, 1, 1, 1, 1,
-0.9802467, 2.079998, 0.3589684, 1, 1, 1, 1, 1,
-0.9795807, -0.6072029, -0.8935696, 1, 1, 1, 1, 1,
-0.9735557, -2.025379, -2.730685, 1, 1, 1, 1, 1,
-0.9730096, -0.1972347, -2.458149, 1, 1, 1, 1, 1,
-0.9701678, -0.4457706, -1.820155, 1, 1, 1, 1, 1,
-0.9629939, 1.179403, 0.3693742, 1, 1, 1, 1, 1,
-0.9591534, -0.7246832, -2.065287, 1, 1, 1, 1, 1,
-0.954975, 0.5999635, -1.089824, 1, 1, 1, 1, 1,
-0.9516649, -0.8327932, -1.542099, 1, 1, 1, 1, 1,
-0.9502898, 0.4513071, -1.490555, 0, 0, 1, 1, 1,
-0.9493806, 1.046863, -0.7612825, 1, 0, 0, 1, 1,
-0.9461399, -0.1866774, -1.374868, 1, 0, 0, 1, 1,
-0.9426221, -0.5064169, -2.203439, 1, 0, 0, 1, 1,
-0.9421564, -0.1150576, -2.275434, 1, 0, 0, 1, 1,
-0.9417174, 0.1019929, -1.838162, 1, 0, 0, 1, 1,
-0.9348499, 1.480821, -0.01566406, 0, 0, 0, 1, 1,
-0.9343776, 1.432339, -0.305135, 0, 0, 0, 1, 1,
-0.9332762, -0.582064, -1.931868, 0, 0, 0, 1, 1,
-0.9145895, -0.4073442, -2.587971, 0, 0, 0, 1, 1,
-0.9110361, 0.6142455, -0.9772786, 0, 0, 0, 1, 1,
-0.9109998, 0.8053905, -0.1794024, 0, 0, 0, 1, 1,
-0.9107839, 0.09011134, -0.6840339, 0, 0, 0, 1, 1,
-0.9086317, 0.2993909, 0.1499996, 1, 1, 1, 1, 1,
-0.9083133, 1.42448, -0.275537, 1, 1, 1, 1, 1,
-0.9077148, -0.09980521, -1.90457, 1, 1, 1, 1, 1,
-0.9038844, -0.7396092, -0.9813962, 1, 1, 1, 1, 1,
-0.9015456, 0.2099779, -0.7764918, 1, 1, 1, 1, 1,
-0.9005433, 1.035864, -1.649493, 1, 1, 1, 1, 1,
-0.898514, -0.3160269, -1.759848, 1, 1, 1, 1, 1,
-0.8979067, -0.1542714, -0.7547391, 1, 1, 1, 1, 1,
-0.8926568, 0.2457396, -1.699227, 1, 1, 1, 1, 1,
-0.891984, -0.3953482, -0.7470395, 1, 1, 1, 1, 1,
-0.8857195, -1.420874, -2.897138, 1, 1, 1, 1, 1,
-0.8784891, 0.1364565, 0.1509366, 1, 1, 1, 1, 1,
-0.8772996, 1.744003, 0.1707669, 1, 1, 1, 1, 1,
-0.8752538, 0.7568349, -0.9903564, 1, 1, 1, 1, 1,
-0.8661466, 0.6813405, -0.2208373, 1, 1, 1, 1, 1,
-0.8659066, 0.8412606, -1.708765, 0, 0, 1, 1, 1,
-0.8587373, -0.3038627, -0.5697154, 1, 0, 0, 1, 1,
-0.854077, 1.46971, -0.6821959, 1, 0, 0, 1, 1,
-0.8475472, -2.642867, -2.117156, 1, 0, 0, 1, 1,
-0.8451545, -1.4093, -2.202589, 1, 0, 0, 1, 1,
-0.8426616, 2.078999, 0.8060831, 1, 0, 0, 1, 1,
-0.8340222, 0.9181414, -2.137182, 0, 0, 0, 1, 1,
-0.8276541, -0.094456, -1.287174, 0, 0, 0, 1, 1,
-0.8248675, 0.7804874, -1.429924, 0, 0, 0, 1, 1,
-0.822286, -0.004611759, -0.09615017, 0, 0, 0, 1, 1,
-0.8164812, 1.042451, -1.30727, 0, 0, 0, 1, 1,
-0.8143715, 0.1737267, -1.052788, 0, 0, 0, 1, 1,
-0.8115989, -0.1568352, -1.95781, 0, 0, 0, 1, 1,
-0.8071709, -0.9612969, -1.302879, 1, 1, 1, 1, 1,
-0.8049802, -0.9853377, -0.7416918, 1, 1, 1, 1, 1,
-0.8008729, -0.257438, -1.594536, 1, 1, 1, 1, 1,
-0.7993223, 1.787278, 0.02634963, 1, 1, 1, 1, 1,
-0.7980248, 0.6160126, -1.324526, 1, 1, 1, 1, 1,
-0.7963814, -0.8287282, -2.647017, 1, 1, 1, 1, 1,
-0.7924587, -0.005588881, -0.6841908, 1, 1, 1, 1, 1,
-0.7922722, -0.3921739, -1.6278, 1, 1, 1, 1, 1,
-0.7886311, 0.845034, -1.89676, 1, 1, 1, 1, 1,
-0.7859271, 0.2027134, -1.375192, 1, 1, 1, 1, 1,
-0.7829942, -1.084596, -2.440574, 1, 1, 1, 1, 1,
-0.7817083, -1.451689, -2.489267, 1, 1, 1, 1, 1,
-0.7812572, -0.6236058, 0.3742431, 1, 1, 1, 1, 1,
-0.7808057, 1.372767, -0.9770365, 1, 1, 1, 1, 1,
-0.7749851, 0.6255559, -1.319804, 1, 1, 1, 1, 1,
-0.7725298, -1.178559, -1.583442, 0, 0, 1, 1, 1,
-0.7716931, 0.4319948, -0.9362784, 1, 0, 0, 1, 1,
-0.7692146, -0.6764923, -3.203357, 1, 0, 0, 1, 1,
-0.7667977, -1.452912, -2.898229, 1, 0, 0, 1, 1,
-0.7653027, 1.444436, -0.158802, 1, 0, 0, 1, 1,
-0.7627255, 0.6578411, -2.878166, 1, 0, 0, 1, 1,
-0.7618924, 0.7365019, -1.154197, 0, 0, 0, 1, 1,
-0.7614555, -0.2384195, -1.814663, 0, 0, 0, 1, 1,
-0.7597469, -0.003674969, -1.894888, 0, 0, 0, 1, 1,
-0.7595392, -0.9698586, -1.952176, 0, 0, 0, 1, 1,
-0.7588398, 1.238206, -0.3573799, 0, 0, 0, 1, 1,
-0.7587274, -1.500149, -2.344354, 0, 0, 0, 1, 1,
-0.7561802, -0.5755107, -3.738294, 0, 0, 0, 1, 1,
-0.7556872, 0.6394107, -1.427702, 1, 1, 1, 1, 1,
-0.7490497, -0.3356031, -2.354952, 1, 1, 1, 1, 1,
-0.7484166, -0.4162506, -3.444639, 1, 1, 1, 1, 1,
-0.7469091, -1.220233, -3.498708, 1, 1, 1, 1, 1,
-0.7448432, 1.031268, 0.431311, 1, 1, 1, 1, 1,
-0.7445082, -1.418705, -4.291439, 1, 1, 1, 1, 1,
-0.7410199, 1.557214, 1.103925, 1, 1, 1, 1, 1,
-0.73858, -0.156765, -3.23617, 1, 1, 1, 1, 1,
-0.7376685, 0.1159676, -1.327742, 1, 1, 1, 1, 1,
-0.7375569, 1.314913, -1.023192, 1, 1, 1, 1, 1,
-0.7316557, 0.3325281, -2.60308, 1, 1, 1, 1, 1,
-0.72731, -0.3589382, -2.078776, 1, 1, 1, 1, 1,
-0.7253423, 0.2205644, -1.844504, 1, 1, 1, 1, 1,
-0.7225599, -0.05350978, -1.819115, 1, 1, 1, 1, 1,
-0.7195233, 1.027718, -0.4037814, 1, 1, 1, 1, 1,
-0.7154549, 0.8765396, -1.32434, 0, 0, 1, 1, 1,
-0.7082249, -0.3128355, -1.866979, 1, 0, 0, 1, 1,
-0.7060858, 0.06563044, -1.573835, 1, 0, 0, 1, 1,
-0.7046552, 1.832501, 1.084115, 1, 0, 0, 1, 1,
-0.7033905, 1.289138, -1.076224, 1, 0, 0, 1, 1,
-0.7012618, -1.93726, -2.104639, 1, 0, 0, 1, 1,
-0.7007284, 0.7262489, 1.240908, 0, 0, 0, 1, 1,
-0.6996152, 1.439674, 0.1211083, 0, 0, 0, 1, 1,
-0.6954799, -0.5880455, -1.876124, 0, 0, 0, 1, 1,
-0.6949589, -1.183329, -3.048619, 0, 0, 0, 1, 1,
-0.6911399, 0.3674212, 0.7918259, 0, 0, 0, 1, 1,
-0.6839609, 0.5670472, -2.231073, 0, 0, 0, 1, 1,
-0.6833156, 0.3594497, -0.2096071, 0, 0, 0, 1, 1,
-0.6806262, -0.2472236, -3.588087, 1, 1, 1, 1, 1,
-0.678409, -0.1800639, -2.15742, 1, 1, 1, 1, 1,
-0.673632, 0.8390237, -0.1883996, 1, 1, 1, 1, 1,
-0.6714445, -0.9987037, -1.832245, 1, 1, 1, 1, 1,
-0.6668905, -2.114486, -3.543453, 1, 1, 1, 1, 1,
-0.6665719, -2.354749, -2.525728, 1, 1, 1, 1, 1,
-0.6659958, 0.2923297, -2.311595, 1, 1, 1, 1, 1,
-0.6608543, -0.6210463, -3.070254, 1, 1, 1, 1, 1,
-0.6567896, -0.4564278, -0.873063, 1, 1, 1, 1, 1,
-0.6523892, 1.115106, -0.827018, 1, 1, 1, 1, 1,
-0.6522921, -0.7778251, -2.443173, 1, 1, 1, 1, 1,
-0.6459538, 1.485311, -1.02683, 1, 1, 1, 1, 1,
-0.6449317, -1.0238, -0.2865385, 1, 1, 1, 1, 1,
-0.6413386, 0.2289547, -1.620135, 1, 1, 1, 1, 1,
-0.6377117, -0.1837505, -1.593249, 1, 1, 1, 1, 1,
-0.6373342, -0.2807651, -2.195316, 0, 0, 1, 1, 1,
-0.6369395, -0.9851527, -3.033187, 1, 0, 0, 1, 1,
-0.6341057, 0.25052, -0.7489253, 1, 0, 0, 1, 1,
-0.633236, 0.01781383, -0.7274168, 1, 0, 0, 1, 1,
-0.6256692, 1.076042, 0.2944434, 1, 0, 0, 1, 1,
-0.620288, 0.4252979, -0.4234984, 1, 0, 0, 1, 1,
-0.6135026, 0.5767621, -1.74151, 0, 0, 0, 1, 1,
-0.607048, 1.056931, 0.1208263, 0, 0, 0, 1, 1,
-0.6037537, -0.2608033, -1.735291, 0, 0, 0, 1, 1,
-0.5949941, -1.073272, -1.822404, 0, 0, 0, 1, 1,
-0.5948267, 0.3794859, -1.41795, 0, 0, 0, 1, 1,
-0.593632, -3.60591, -1.354982, 0, 0, 0, 1, 1,
-0.592419, -0.1069002, -1.36071, 0, 0, 0, 1, 1,
-0.5889566, 0.9652963, -0.5617356, 1, 1, 1, 1, 1,
-0.5861754, -0.137872, -2.068977, 1, 1, 1, 1, 1,
-0.5851182, 0.5254039, -0.5069858, 1, 1, 1, 1, 1,
-0.5644867, 0.8103434, 0.8115033, 1, 1, 1, 1, 1,
-0.5609262, 0.4029624, -1.249188, 1, 1, 1, 1, 1,
-0.5603616, -0.4185037, -0.4597864, 1, 1, 1, 1, 1,
-0.5569931, -0.6902682, -3.50127, 1, 1, 1, 1, 1,
-0.5530838, 0.553149, 0.4800446, 1, 1, 1, 1, 1,
-0.5525245, -1.425257, -2.645245, 1, 1, 1, 1, 1,
-0.5516214, 0.0945748, -2.147576, 1, 1, 1, 1, 1,
-0.5487257, -1.22578, -4.181287, 1, 1, 1, 1, 1,
-0.5483927, -0.6405393, -1.663433, 1, 1, 1, 1, 1,
-0.5483317, -1.127354, -1.898686, 1, 1, 1, 1, 1,
-0.5434514, 0.8532419, -2.489223, 1, 1, 1, 1, 1,
-0.5358984, 0.815851, 0.1635817, 1, 1, 1, 1, 1,
-0.5316963, 0.9245036, 0.8007118, 0, 0, 1, 1, 1,
-0.5295112, 1.0602, -1.203929, 1, 0, 0, 1, 1,
-0.5185556, 0.00868661, 0.7334675, 1, 0, 0, 1, 1,
-0.511425, 0.742498, -1.838105, 1, 0, 0, 1, 1,
-0.5105638, 0.2131768, -1.607667, 1, 0, 0, 1, 1,
-0.5104682, 0.1422172, -3.126377, 1, 0, 0, 1, 1,
-0.5092903, -1.738361, -2.864977, 0, 0, 0, 1, 1,
-0.5062072, 1.162356, -0.9467931, 0, 0, 0, 1, 1,
-0.5061163, -0.747624, -2.836885, 0, 0, 0, 1, 1,
-0.5041128, 0.02087752, -2.446851, 0, 0, 0, 1, 1,
-0.5031498, -0.9769862, -1.226646, 0, 0, 0, 1, 1,
-0.4983284, -0.07981742, -2.744216, 0, 0, 0, 1, 1,
-0.4971974, 0.5933548, -0.6509807, 0, 0, 0, 1, 1,
-0.4965515, -1.123394, -1.762974, 1, 1, 1, 1, 1,
-0.49371, 0.4113259, 0.1544125, 1, 1, 1, 1, 1,
-0.4909589, 1.447346, -0.6833456, 1, 1, 1, 1, 1,
-0.4859975, 1.294803, -0.08243787, 1, 1, 1, 1, 1,
-0.4748002, 0.1685079, -0.5699988, 1, 1, 1, 1, 1,
-0.468384, -0.339708, -1.538921, 1, 1, 1, 1, 1,
-0.4656275, -0.560225, -2.459063, 1, 1, 1, 1, 1,
-0.4645282, 0.9675221, -0.7089828, 1, 1, 1, 1, 1,
-0.4636626, -0.404846, -3.540822, 1, 1, 1, 1, 1,
-0.4634913, 1.316771, 1.283684, 1, 1, 1, 1, 1,
-0.4634585, 0.8150863, -1.813187, 1, 1, 1, 1, 1,
-0.462371, 0.7601674, -0.4597422, 1, 1, 1, 1, 1,
-0.4609632, 0.3893074, -0.1971671, 1, 1, 1, 1, 1,
-0.4572661, 2.583128, -0.6910077, 1, 1, 1, 1, 1,
-0.4571865, 1.200182, -1.564422, 1, 1, 1, 1, 1,
-0.4570116, -0.4946536, -2.212751, 0, 0, 1, 1, 1,
-0.4496752, 0.3147956, -1.782512, 1, 0, 0, 1, 1,
-0.4494791, -2.734452, -3.29099, 1, 0, 0, 1, 1,
-0.4488341, -1.337188, -5.980405, 1, 0, 0, 1, 1,
-0.4483616, -0.8456196, -3.245847, 1, 0, 0, 1, 1,
-0.4452822, 1.148649, -1.963316, 1, 0, 0, 1, 1,
-0.4445629, 0.6067497, 1.079363, 0, 0, 0, 1, 1,
-0.4444505, 1.458269, 2.179857, 0, 0, 0, 1, 1,
-0.4415789, 0.8022754, -0.09249336, 0, 0, 0, 1, 1,
-0.4370937, -0.193101, -1.809815, 0, 0, 0, 1, 1,
-0.4353988, -0.8796488, -1.666, 0, 0, 0, 1, 1,
-0.4349839, -1.14385, -1.956584, 0, 0, 0, 1, 1,
-0.4302911, -0.9711034, -3.492931, 0, 0, 0, 1, 1,
-0.4299791, 0.7680285, -2.024797, 1, 1, 1, 1, 1,
-0.4270604, -0.3250163, -1.852681, 1, 1, 1, 1, 1,
-0.424554, -0.07310791, 0.3465331, 1, 1, 1, 1, 1,
-0.4206853, -0.9695491, -2.619421, 1, 1, 1, 1, 1,
-0.4202227, -0.8684643, -1.548938, 1, 1, 1, 1, 1,
-0.4136544, 1.962625, -2.598229, 1, 1, 1, 1, 1,
-0.4074957, -1.939564, -2.491397, 1, 1, 1, 1, 1,
-0.4053484, 0.6303111, -0.7744226, 1, 1, 1, 1, 1,
-0.4041957, 1.229041, 1.52744, 1, 1, 1, 1, 1,
-0.4003081, -0.277999, -1.540061, 1, 1, 1, 1, 1,
-0.3988042, -0.2408873, -4.414976, 1, 1, 1, 1, 1,
-0.3978951, 0.3235247, -0.9200734, 1, 1, 1, 1, 1,
-0.3973426, 0.895536, -1.54923, 1, 1, 1, 1, 1,
-0.3962485, -1.120074, -3.930012, 1, 1, 1, 1, 1,
-0.3954416, 0.8757384, -1.380581, 1, 1, 1, 1, 1,
-0.3936986, 0.2128559, -0.5450829, 0, 0, 1, 1, 1,
-0.3929195, -1.134448, -3.110463, 1, 0, 0, 1, 1,
-0.390877, -1.667305, -4.997338, 1, 0, 0, 1, 1,
-0.3907224, 0.2073234, -1.668961, 1, 0, 0, 1, 1,
-0.3798396, -1.026618, -1.884005, 1, 0, 0, 1, 1,
-0.3775222, 1.244551, 0.4942184, 1, 0, 0, 1, 1,
-0.3707936, 0.3803963, -3.286096, 0, 0, 0, 1, 1,
-0.3690123, 0.4125461, -1.119928, 0, 0, 0, 1, 1,
-0.368245, -0.2928257, -0.300349, 0, 0, 0, 1, 1,
-0.3679549, -0.7284613, -1.427231, 0, 0, 0, 1, 1,
-0.3634979, -0.2394759, -0.02320893, 0, 0, 0, 1, 1,
-0.3629045, -1.14531, -3.097603, 0, 0, 0, 1, 1,
-0.3619279, 1.462682, -1.143237, 0, 0, 0, 1, 1,
-0.3586026, -0.6318799, -2.54884, 1, 1, 1, 1, 1,
-0.357017, -1.208098, -3.472062, 1, 1, 1, 1, 1,
-0.3546562, -0.3692872, -2.568047, 1, 1, 1, 1, 1,
-0.3516078, -2.835499, -3.67482, 1, 1, 1, 1, 1,
-0.3505748, -0.413887, -1.978203, 1, 1, 1, 1, 1,
-0.3501334, 0.5338961, -1.116831, 1, 1, 1, 1, 1,
-0.3486919, 0.9383695, -0.1665593, 1, 1, 1, 1, 1,
-0.3482041, 1.052025, 0.809418, 1, 1, 1, 1, 1,
-0.3394887, 0.9092274, -0.1240435, 1, 1, 1, 1, 1,
-0.3328945, 1.099495, -1.029462, 1, 1, 1, 1, 1,
-0.3294089, 1.239603, -3.404002, 1, 1, 1, 1, 1,
-0.3288417, 2.595679, -2.215088, 1, 1, 1, 1, 1,
-0.3273411, -1.161062, -3.08604, 1, 1, 1, 1, 1,
-0.3222053, -0.6393145, -2.378664, 1, 1, 1, 1, 1,
-0.321677, 0.1515475, -3.444349, 1, 1, 1, 1, 1,
-0.320235, 0.012555, -2.07077, 0, 0, 1, 1, 1,
-0.3164979, 0.2826893, -0.4425127, 1, 0, 0, 1, 1,
-0.3055407, 2.41076, 1.344037, 1, 0, 0, 1, 1,
-0.3055141, -0.7976201, -2.512955, 1, 0, 0, 1, 1,
-0.3047579, 1.539215, -1.167297, 1, 0, 0, 1, 1,
-0.3044776, -1.236961, -4.53826, 1, 0, 0, 1, 1,
-0.3032013, -0.5326575, -2.837124, 0, 0, 0, 1, 1,
-0.3023909, -1.210599, -3.739084, 0, 0, 0, 1, 1,
-0.3007341, -1.766889, -2.825533, 0, 0, 0, 1, 1,
-0.3003904, -1.765029, -1.295448, 0, 0, 0, 1, 1,
-0.299036, 0.2697479, -0.7844508, 0, 0, 0, 1, 1,
-0.2935941, -0.9070705, -2.237511, 0, 0, 0, 1, 1,
-0.2930703, -0.8312438, -2.916236, 0, 0, 0, 1, 1,
-0.292044, 0.09279525, -0.8473209, 1, 1, 1, 1, 1,
-0.2917186, 0.3227261, -1.141854, 1, 1, 1, 1, 1,
-0.2870972, -1.584471, -2.771566, 1, 1, 1, 1, 1,
-0.280217, -0.2958594, -2.571291, 1, 1, 1, 1, 1,
-0.2796176, 0.5582027, -0.0291298, 1, 1, 1, 1, 1,
-0.2772845, -0.8785836, -3.783753, 1, 1, 1, 1, 1,
-0.2753201, 1.912826, -0.455325, 1, 1, 1, 1, 1,
-0.2746598, -0.9594439, -2.630656, 1, 1, 1, 1, 1,
-0.2703853, 2.192168, 1.208768, 1, 1, 1, 1, 1,
-0.2687938, 0.8272224, -1.238701, 1, 1, 1, 1, 1,
-0.2687349, 0.6093896, -0.1375649, 1, 1, 1, 1, 1,
-0.2673692, -0.6130939, -3.561683, 1, 1, 1, 1, 1,
-0.2659603, -0.0233107, -1.56278, 1, 1, 1, 1, 1,
-0.2656066, -1.6851, -3.17277, 1, 1, 1, 1, 1,
-0.2650343, 0.4684107, 0.5049056, 1, 1, 1, 1, 1,
-0.2633793, 0.367322, 0.1864242, 0, 0, 1, 1, 1,
-0.2626304, 1.773313, 1.186292, 1, 0, 0, 1, 1,
-0.2626146, -0.1309571, -3.609276, 1, 0, 0, 1, 1,
-0.2601656, -0.008916968, -3.926424, 1, 0, 0, 1, 1,
-0.2580186, -0.3532832, -2.371424, 1, 0, 0, 1, 1,
-0.2556267, 1.153538, -0.06869525, 1, 0, 0, 1, 1,
-0.2512051, -0.07196529, -1.765892, 0, 0, 0, 1, 1,
-0.2469622, 0.4808464, 1.050809, 0, 0, 0, 1, 1,
-0.2454263, -0.6245229, -3.211519, 0, 0, 0, 1, 1,
-0.2448366, -0.9083857, -3.977729, 0, 0, 0, 1, 1,
-0.2400398, 0.04047797, -1.131603, 0, 0, 0, 1, 1,
-0.2398577, 0.3007742, 0.7829026, 0, 0, 0, 1, 1,
-0.2392427, -1.419398, -3.0849, 0, 0, 0, 1, 1,
-0.2364838, -0.1602079, -1.973459, 1, 1, 1, 1, 1,
-0.2344668, -0.3695657, -2.849182, 1, 1, 1, 1, 1,
-0.2342898, -1.935818, -3.486889, 1, 1, 1, 1, 1,
-0.2334725, -1.208021, -3.869759, 1, 1, 1, 1, 1,
-0.2316384, -3.045033, -1.431967, 1, 1, 1, 1, 1,
-0.2289844, -0.8299894, -3.15344, 1, 1, 1, 1, 1,
-0.2239277, 0.4736145, -0.1290302, 1, 1, 1, 1, 1,
-0.219185, -0.9446776, -2.018722, 1, 1, 1, 1, 1,
-0.2157274, 0.35803, -0.7327303, 1, 1, 1, 1, 1,
-0.2150058, -1.156255, -1.669254, 1, 1, 1, 1, 1,
-0.2140336, 0.840134, 0.5606232, 1, 1, 1, 1, 1,
-0.2104765, -0.1829452, -1.476889, 1, 1, 1, 1, 1,
-0.2039389, 0.1959387, 0.07813759, 1, 1, 1, 1, 1,
-0.2023938, -1.657032, -3.858359, 1, 1, 1, 1, 1,
-0.1945081, 2.245223, 1.100395, 1, 1, 1, 1, 1,
-0.1944955, -0.3145714, -1.888442, 0, 0, 1, 1, 1,
-0.1936535, -0.09682854, -1.09416, 1, 0, 0, 1, 1,
-0.1904413, -0.7510482, -2.840132, 1, 0, 0, 1, 1,
-0.1840037, -1.330923, -0.6944364, 1, 0, 0, 1, 1,
-0.1753835, 0.5702271, -0.9490066, 1, 0, 0, 1, 1,
-0.1743895, 0.1374452, -1.573921, 1, 0, 0, 1, 1,
-0.1722845, -1.476489, -3.922346, 0, 0, 0, 1, 1,
-0.1720823, 0.05590766, -1.518905, 0, 0, 0, 1, 1,
-0.169132, -1.190998, -4.156954, 0, 0, 0, 1, 1,
-0.1665244, -1.606954, -3.533194, 0, 0, 0, 1, 1,
-0.165635, -2.91311, -2.933693, 0, 0, 0, 1, 1,
-0.1649238, 0.1539257, 0.1351259, 0, 0, 0, 1, 1,
-0.1637037, -0.008445851, -0.4090281, 0, 0, 0, 1, 1,
-0.1538495, 0.1762452, -0.6719911, 1, 1, 1, 1, 1,
-0.1507096, 0.02691625, -2.04651, 1, 1, 1, 1, 1,
-0.1497416, 0.5633368, -0.9795063, 1, 1, 1, 1, 1,
-0.1469379, 0.1218788, 0.01682033, 1, 1, 1, 1, 1,
-0.1465788, 0.2995378, -0.7602292, 1, 1, 1, 1, 1,
-0.1460839, -0.1471641, -2.509634, 1, 1, 1, 1, 1,
-0.1455401, 1.098849, 0.6810164, 1, 1, 1, 1, 1,
-0.1432012, -0.7599257, -1.967925, 1, 1, 1, 1, 1,
-0.132735, 1.235488, 0.9220251, 1, 1, 1, 1, 1,
-0.1319268, -0.1837638, -2.271869, 1, 1, 1, 1, 1,
-0.1271291, -0.3294294, -0.4027118, 1, 1, 1, 1, 1,
-0.1234509, 1.279344, 1.479499, 1, 1, 1, 1, 1,
-0.1074389, -0.4860339, -2.178634, 1, 1, 1, 1, 1,
-0.1066759, -0.8034547, -2.949664, 1, 1, 1, 1, 1,
-0.1052023, -0.01058977, -0.7053697, 1, 1, 1, 1, 1,
-0.1036804, -0.4231536, -3.800493, 0, 0, 1, 1, 1,
-0.09550211, 0.6679421, 1.473713, 1, 0, 0, 1, 1,
-0.09453971, -1.058231, -3.575713, 1, 0, 0, 1, 1,
-0.09406991, 0.6708032, 1.420847, 1, 0, 0, 1, 1,
-0.09356274, -0.7301949, -4.052577, 1, 0, 0, 1, 1,
-0.09035708, 1.81548, 0.05747815, 1, 0, 0, 1, 1,
-0.08970945, -0.2547288, -3.981772, 0, 0, 0, 1, 1,
-0.08943074, -0.4257441, -4.57972, 0, 0, 0, 1, 1,
-0.08870971, -1.294454, -4.385961, 0, 0, 0, 1, 1,
-0.08640152, 1.506786, 0.2210088, 0, 0, 0, 1, 1,
-0.08621559, -0.2104549, -2.166632, 0, 0, 0, 1, 1,
-0.08464344, 0.2512768, 0.0280754, 0, 0, 0, 1, 1,
-0.0844485, -0.1947951, -3.459715, 0, 0, 0, 1, 1,
-0.07870353, 0.7736789, 2.688126, 1, 1, 1, 1, 1,
-0.07614256, 0.2802892, -0.4824219, 1, 1, 1, 1, 1,
-0.07403687, -0.4591383, -2.387203, 1, 1, 1, 1, 1,
-0.07172766, 0.09929612, -0.102519, 1, 1, 1, 1, 1,
-0.07068395, 2.832068, -1.56316, 1, 1, 1, 1, 1,
-0.06996297, 1.358698, 0.7263126, 1, 1, 1, 1, 1,
-0.06857942, 1.624548, 0.200668, 1, 1, 1, 1, 1,
-0.06838479, -1.320112, -4.513383, 1, 1, 1, 1, 1,
-0.0636999, -0.6133974, -2.48902, 1, 1, 1, 1, 1,
-0.05987131, 0.05383615, 1.159193, 1, 1, 1, 1, 1,
-0.05778079, -0.2111996, -2.690188, 1, 1, 1, 1, 1,
-0.05764626, -0.1700167, -3.928723, 1, 1, 1, 1, 1,
-0.05455563, -0.7516417, -3.056859, 1, 1, 1, 1, 1,
-0.05290617, 1.089212, -1.055315, 1, 1, 1, 1, 1,
-0.04982767, 0.1141525, -0.3676732, 1, 1, 1, 1, 1,
-0.04869747, 0.639694, 1.355765, 0, 0, 1, 1, 1,
-0.04429274, -1.392322, -3.567309, 1, 0, 0, 1, 1,
-0.04039708, -1.172374, -2.272058, 1, 0, 0, 1, 1,
-0.03986446, 0.1392201, -0.9507917, 1, 0, 0, 1, 1,
-0.03649738, -0.9868066, -3.037885, 1, 0, 0, 1, 1,
-0.02325268, -0.9742578, -2.802197, 1, 0, 0, 1, 1,
-0.01647347, -1.387096, -3.98132, 0, 0, 0, 1, 1,
-0.01071666, 0.2816915, 0.6112691, 0, 0, 0, 1, 1,
-0.008492869, 0.6239311, 0.6292334, 0, 0, 0, 1, 1,
-0.003260945, 1.098087, 1.167482, 0, 0, 0, 1, 1,
-0.003036101, 1.167631, 0.02595958, 0, 0, 0, 1, 1,
-0.002511079, -1.599475, -1.854381, 0, 0, 0, 1, 1,
-0.002035596, -0.4032099, -1.591897, 0, 0, 0, 1, 1,
2.317399e-05, -0.769461, 4.466575, 1, 1, 1, 1, 1,
0.0002070162, 0.1137415, 0.460507, 1, 1, 1, 1, 1,
0.0007903356, 0.457316, 0.5138924, 1, 1, 1, 1, 1,
0.003625403, 1.624343, 0.02122842, 1, 1, 1, 1, 1,
0.005725037, -0.6364348, 3.713749, 1, 1, 1, 1, 1,
0.01236587, 1.618021, 0.5919656, 1, 1, 1, 1, 1,
0.01427454, 0.5349809, 0.9427499, 1, 1, 1, 1, 1,
0.01626437, -1.809352, 2.743482, 1, 1, 1, 1, 1,
0.01967807, -0.7136725, 2.83218, 1, 1, 1, 1, 1,
0.02337968, -1.069705, 3.798536, 1, 1, 1, 1, 1,
0.02369311, -0.324881, 4.027798, 1, 1, 1, 1, 1,
0.02373465, -0.8159177, 3.105331, 1, 1, 1, 1, 1,
0.02444257, 0.2390004, -0.577395, 1, 1, 1, 1, 1,
0.02519082, 1.182473, 1.111437, 1, 1, 1, 1, 1,
0.03096768, -0.4972505, 4.4417, 1, 1, 1, 1, 1,
0.04208047, 0.1424439, 1.235673, 0, 0, 1, 1, 1,
0.04512416, -0.4603872, 3.739679, 1, 0, 0, 1, 1,
0.05149587, -1.052425, 1.618495, 1, 0, 0, 1, 1,
0.05189622, 1.47516, -0.4233632, 1, 0, 0, 1, 1,
0.05529047, 1.103816, 0.5988588, 1, 0, 0, 1, 1,
0.05756803, -0.4419147, 2.496396, 1, 0, 0, 1, 1,
0.05933375, -0.8382788, 2.350643, 0, 0, 0, 1, 1,
0.06154761, -0.4851025, 4.303045, 0, 0, 0, 1, 1,
0.06159117, -0.2187299, 3.725341, 0, 0, 0, 1, 1,
0.06159218, 0.581044, 0.9154115, 0, 0, 0, 1, 1,
0.06741177, -0.1431568, 2.758814, 0, 0, 0, 1, 1,
0.07213987, -0.3004923, 4.687786, 0, 0, 0, 1, 1,
0.07515305, 2.713386, 0.6512684, 0, 0, 0, 1, 1,
0.07652674, -1.597182, 3.973289, 1, 1, 1, 1, 1,
0.07770965, 0.2874718, 0.02060094, 1, 1, 1, 1, 1,
0.07795672, 0.2315754, -0.1414251, 1, 1, 1, 1, 1,
0.07800844, -0.4132522, 3.934585, 1, 1, 1, 1, 1,
0.08328169, -1.348525, 5.790263, 1, 1, 1, 1, 1,
0.08335424, 1.753731, -1.017436, 1, 1, 1, 1, 1,
0.08425801, -0.4444608, 2.321357, 1, 1, 1, 1, 1,
0.08730238, -0.5903692, 3.956173, 1, 1, 1, 1, 1,
0.08779562, -0.3639982, 1.796445, 1, 1, 1, 1, 1,
0.0887184, 1.802707, 0.215124, 1, 1, 1, 1, 1,
0.09073787, 0.4962958, -0.382804, 1, 1, 1, 1, 1,
0.09235005, 1.050435, 0.3101988, 1, 1, 1, 1, 1,
0.09363115, -1.096655, 3.110838, 1, 1, 1, 1, 1,
0.1003786, 1.047972, 0.8808441, 1, 1, 1, 1, 1,
0.1010711, -0.4552121, 3.038748, 1, 1, 1, 1, 1,
0.1012745, -0.2725784, 2.659029, 0, 0, 1, 1, 1,
0.1067585, -0.5023131, 4.742835, 1, 0, 0, 1, 1,
0.1138165, 0.5260381, 1.867386, 1, 0, 0, 1, 1,
0.1204145, -1.046777, 2.120974, 1, 0, 0, 1, 1,
0.1366812, 0.7110372, 0.9411727, 1, 0, 0, 1, 1,
0.1409099, -0.9462129, 3.747513, 1, 0, 0, 1, 1,
0.1434449, -1.758057, 3.256036, 0, 0, 0, 1, 1,
0.1469168, -0.165935, 3.816586, 0, 0, 0, 1, 1,
0.1479909, -0.7333873, 2.867221, 0, 0, 0, 1, 1,
0.1537529, 0.8079773, -1.242995, 0, 0, 0, 1, 1,
0.1540945, -0.1730606, 3.409092, 0, 0, 0, 1, 1,
0.1563553, 1.351434, 0.7265026, 0, 0, 0, 1, 1,
0.1578368, 0.8631909, 0.2874295, 0, 0, 0, 1, 1,
0.1578958, 1.371194, -0.1969164, 1, 1, 1, 1, 1,
0.1589629, 1.162763, 0.7475694, 1, 1, 1, 1, 1,
0.165869, 1.999502, -1.652788, 1, 1, 1, 1, 1,
0.1706009, 0.7379637, -1.333109, 1, 1, 1, 1, 1,
0.1724998, 0.1607601, 0.9068295, 1, 1, 1, 1, 1,
0.1730134, -1.649547, 4.51871, 1, 1, 1, 1, 1,
0.1748548, -1.002364, 2.077137, 1, 1, 1, 1, 1,
0.1754098, 1.409028, -0.118009, 1, 1, 1, 1, 1,
0.1759905, -0.466834, 2.29508, 1, 1, 1, 1, 1,
0.1802253, -0.07214476, 2.01737, 1, 1, 1, 1, 1,
0.1853134, 0.2963881, 1.091902, 1, 1, 1, 1, 1,
0.1875467, 0.9350502, 1.872824, 1, 1, 1, 1, 1,
0.1883289, -0.05648481, 2.461735, 1, 1, 1, 1, 1,
0.1905852, -1.009768, 2.176922, 1, 1, 1, 1, 1,
0.1976951, -1.014808, 2.718173, 1, 1, 1, 1, 1,
0.1994764, 0.7590734, 1.230295, 0, 0, 1, 1, 1,
0.199908, -1.479911, 1.870303, 1, 0, 0, 1, 1,
0.2020685, -0.1643795, 2.12039, 1, 0, 0, 1, 1,
0.2028146, -1.035031, 1.214088, 1, 0, 0, 1, 1,
0.2032017, -0.4957494, 3.162674, 1, 0, 0, 1, 1,
0.2138714, -0.78708, 2.348244, 1, 0, 0, 1, 1,
0.2141353, -0.2822495, 2.657689, 0, 0, 0, 1, 1,
0.215093, -1.584614, 3.865004, 0, 0, 0, 1, 1,
0.218363, -0.8659348, 2.994392, 0, 0, 0, 1, 1,
0.2233382, 1.81231, 0.742429, 0, 0, 0, 1, 1,
0.2279357, 1.275363, 1.506744, 0, 0, 0, 1, 1,
0.2296692, -0.5925984, 3.362351, 0, 0, 0, 1, 1,
0.2333145, 0.002356154, 3.672823, 0, 0, 0, 1, 1,
0.2333868, 0.5844743, 1.291884, 1, 1, 1, 1, 1,
0.2393943, -1.115037, 2.568673, 1, 1, 1, 1, 1,
0.2434937, -0.2187342, 2.754963, 1, 1, 1, 1, 1,
0.2439199, -0.9018089, 2.789913, 1, 1, 1, 1, 1,
0.2496208, -1.929546, 2.652261, 1, 1, 1, 1, 1,
0.2503738, 1.958982, 1.491025, 1, 1, 1, 1, 1,
0.2506826, -0.2426367, 3.587499, 1, 1, 1, 1, 1,
0.2507734, 0.5527882, 0.3895021, 1, 1, 1, 1, 1,
0.251227, 0.04062596, 1.66995, 1, 1, 1, 1, 1,
0.2550914, -0.3520039, 2.836348, 1, 1, 1, 1, 1,
0.2560538, 1.265777, 1.191412, 1, 1, 1, 1, 1,
0.2587571, 0.5873666, 0.4443094, 1, 1, 1, 1, 1,
0.2600824, 2.439112, 0.4544352, 1, 1, 1, 1, 1,
0.2609845, -0.3450688, 1.873517, 1, 1, 1, 1, 1,
0.268332, 2.153701, -1.176616, 1, 1, 1, 1, 1,
0.2684901, -0.2518465, 0.9639639, 0, 0, 1, 1, 1,
0.2749728, -0.4349728, 3.264883, 1, 0, 0, 1, 1,
0.2758892, -1.408962, 2.167232, 1, 0, 0, 1, 1,
0.2806204, -1.45492, 4.504702, 1, 0, 0, 1, 1,
0.2845843, 0.1924545, 1.245475, 1, 0, 0, 1, 1,
0.2888436, -0.9781097, 2.305336, 1, 0, 0, 1, 1,
0.2889976, -0.6976879, 2.663812, 0, 0, 0, 1, 1,
0.2918271, -1.024928, 1.384606, 0, 0, 0, 1, 1,
0.2932344, -0.03676573, 3.33298, 0, 0, 0, 1, 1,
0.2965622, -0.07858883, 0.7831085, 0, 0, 0, 1, 1,
0.2983955, 1.658219, -0.9921022, 0, 0, 0, 1, 1,
0.301024, -0.1047533, 1.793633, 0, 0, 0, 1, 1,
0.3026375, -0.01312298, 1.166015, 0, 0, 0, 1, 1,
0.3041528, 0.5529236, 0.8609054, 1, 1, 1, 1, 1,
0.3065463, -0.3088378, 1.128936, 1, 1, 1, 1, 1,
0.3088891, 1.04815, -0.4876033, 1, 1, 1, 1, 1,
0.3121306, 0.39189, 3.175315, 1, 1, 1, 1, 1,
0.313236, -0.3645294, 0.5512384, 1, 1, 1, 1, 1,
0.3151311, -0.08580188, 0.7677421, 1, 1, 1, 1, 1,
0.31759, 1.368945, -0.2808167, 1, 1, 1, 1, 1,
0.3177525, -0.1433971, 2.108497, 1, 1, 1, 1, 1,
0.3184552, 0.4508797, 0.7561527, 1, 1, 1, 1, 1,
0.3190126, -0.06089918, -0.278008, 1, 1, 1, 1, 1,
0.3272685, -0.5770761, 4.620541, 1, 1, 1, 1, 1,
0.3314613, -0.3354603, 1.226949, 1, 1, 1, 1, 1,
0.3363055, 0.9460755, 0.3395282, 1, 1, 1, 1, 1,
0.3392307, 1.103412, 1.911634, 1, 1, 1, 1, 1,
0.350806, 1.640847, -0.7496698, 1, 1, 1, 1, 1,
0.356554, -1.880141, 2.692796, 0, 0, 1, 1, 1,
0.3596053, 0.009372517, 0.5349913, 1, 0, 0, 1, 1,
0.3716156, 1.36114, 0.6912187, 1, 0, 0, 1, 1,
0.3721242, -0.1432349, 1.828419, 1, 0, 0, 1, 1,
0.3734252, 1.378163, 1.784741, 1, 0, 0, 1, 1,
0.3763624, 0.4912247, 1.595344, 1, 0, 0, 1, 1,
0.3783653, 0.9432217, 0.6216354, 0, 0, 0, 1, 1,
0.3789184, 0.7152449, -0.353471, 0, 0, 0, 1, 1,
0.3819727, 0.01060541, -0.5254885, 0, 0, 0, 1, 1,
0.3829634, 0.6242132, 0.5550462, 0, 0, 0, 1, 1,
0.3838151, 0.1881966, 1.170321, 0, 0, 0, 1, 1,
0.3854451, 0.4126452, 0.302472, 0, 0, 0, 1, 1,
0.3898437, -1.208685, 4.941986, 0, 0, 0, 1, 1,
0.3902628, 0.5142866, 0.1873962, 1, 1, 1, 1, 1,
0.3910382, -1.818095, 3.056357, 1, 1, 1, 1, 1,
0.394676, -1.330782, 4.285165, 1, 1, 1, 1, 1,
0.3955936, 0.8596169, -0.8735771, 1, 1, 1, 1, 1,
0.4033155, 0.168915, 1.290979, 1, 1, 1, 1, 1,
0.4050294, 1.766932, 1.10047, 1, 1, 1, 1, 1,
0.4062144, -0.3099697, 3.367439, 1, 1, 1, 1, 1,
0.4115417, 0.4278907, 0.2555795, 1, 1, 1, 1, 1,
0.4147685, -0.9913879, 3.338995, 1, 1, 1, 1, 1,
0.4203468, 0.5574527, -0.2094664, 1, 1, 1, 1, 1,
0.4228436, -1.243412, 1.603599, 1, 1, 1, 1, 1,
0.4248206, -1.657167, 2.949721, 1, 1, 1, 1, 1,
0.426514, 1.100118, -0.5299522, 1, 1, 1, 1, 1,
0.4288645, 1.125258, 1.540339, 1, 1, 1, 1, 1,
0.4349212, 1.297953, -0.114353, 1, 1, 1, 1, 1,
0.4362772, 0.1501592, -0.2893439, 0, 0, 1, 1, 1,
0.4385269, 1.499154, 1.538686, 1, 0, 0, 1, 1,
0.4449397, 0.3964581, 0.8382939, 1, 0, 0, 1, 1,
0.4470927, 0.76047, 0.5715131, 1, 0, 0, 1, 1,
0.4486557, 1.668328, 0.5488627, 1, 0, 0, 1, 1,
0.4495314, -0.4866498, 1.887429, 1, 0, 0, 1, 1,
0.4542595, 0.4825128, 1.355367, 0, 0, 0, 1, 1,
0.4566162, -0.06071524, 2.448963, 0, 0, 0, 1, 1,
0.4575541, -0.1574529, 0.7558807, 0, 0, 0, 1, 1,
0.4593277, -0.2490512, 1.696299, 0, 0, 0, 1, 1,
0.4611574, -2.191788, 4.51802, 0, 0, 0, 1, 1,
0.4637934, -0.2639866, 3.449762, 0, 0, 0, 1, 1,
0.4683709, -0.9742664, 2.923438, 0, 0, 0, 1, 1,
0.469282, 1.098112, 0.9736784, 1, 1, 1, 1, 1,
0.4705441, 0.02943566, 0.9268866, 1, 1, 1, 1, 1,
0.4709609, -0.3578965, 3.406349, 1, 1, 1, 1, 1,
0.4710568, -0.1453496, 3.697808, 1, 1, 1, 1, 1,
0.4741185, 1.756145, -0.1180447, 1, 1, 1, 1, 1,
0.4748549, -0.6489723, 1.749303, 1, 1, 1, 1, 1,
0.4780512, 0.2629683, 2.733223, 1, 1, 1, 1, 1,
0.4799778, 0.002080565, 0.9585654, 1, 1, 1, 1, 1,
0.4954789, -0.8029971, 2.75276, 1, 1, 1, 1, 1,
0.4956988, 0.8151364, -0.3203779, 1, 1, 1, 1, 1,
0.4991045, 1.678292, 0.744661, 1, 1, 1, 1, 1,
0.5033275, -1.086727, 2.340786, 1, 1, 1, 1, 1,
0.503887, 0.8399789, 0.9910179, 1, 1, 1, 1, 1,
0.5092639, -0.02428425, 1.656683, 1, 1, 1, 1, 1,
0.5135039, 0.5967402, 0.4587317, 1, 1, 1, 1, 1,
0.5152243, -0.2741659, 2.55512, 0, 0, 1, 1, 1,
0.5153873, 0.9811242, -0.5829303, 1, 0, 0, 1, 1,
0.516162, 1.326384, 2.720618, 1, 0, 0, 1, 1,
0.5199609, -0.5267262, 3.026386, 1, 0, 0, 1, 1,
0.5227001, -2.075735, 2.813365, 1, 0, 0, 1, 1,
0.523995, -3.071365, 3.75417, 1, 0, 0, 1, 1,
0.5243548, -0.2869201, 2.481794, 0, 0, 0, 1, 1,
0.528171, -0.4119368, 2.009398, 0, 0, 0, 1, 1,
0.5298915, -0.734781, 3.167254, 0, 0, 0, 1, 1,
0.5310004, 0.9757156, 0.530066, 0, 0, 0, 1, 1,
0.5346612, 0.9567463, 1.164283, 0, 0, 0, 1, 1,
0.5352153, -1.507178, 1.921696, 0, 0, 0, 1, 1,
0.5395465, -0.6770645, 1.957632, 0, 0, 0, 1, 1,
0.5396228, 1.392719, -0.4168959, 1, 1, 1, 1, 1,
0.5404667, 0.2131685, 4.564374, 1, 1, 1, 1, 1,
0.5418174, -1.255738, 3.383733, 1, 1, 1, 1, 1,
0.5418324, 0.1904408, 1.137565, 1, 1, 1, 1, 1,
0.5481043, -1.537112, 3.698367, 1, 1, 1, 1, 1,
0.5493277, 1.386512, -1.059285, 1, 1, 1, 1, 1,
0.5527138, -0.4797749, 2.052116, 1, 1, 1, 1, 1,
0.55981, -0.667993, 3.267573, 1, 1, 1, 1, 1,
0.5624154, 1.885585, -0.7927414, 1, 1, 1, 1, 1,
0.5628845, 1.058458, 0.3525155, 1, 1, 1, 1, 1,
0.5631445, 1.150971, 0.4674388, 1, 1, 1, 1, 1,
0.5686361, -0.6791036, 2.361938, 1, 1, 1, 1, 1,
0.5696559, 1.054086, 0.3133397, 1, 1, 1, 1, 1,
0.5744634, 0.366109, 0.7796133, 1, 1, 1, 1, 1,
0.5764793, -1.141802, 3.758386, 1, 1, 1, 1, 1,
0.5816942, -0.2079417, 2.243694, 0, 0, 1, 1, 1,
0.5844726, -0.1856918, 3.786368, 1, 0, 0, 1, 1,
0.5883465, 1.580837, -1.440943, 1, 0, 0, 1, 1,
0.5912015, -1.399075, 2.317467, 1, 0, 0, 1, 1,
0.5915024, 0.3883583, -0.001567266, 1, 0, 0, 1, 1,
0.5992654, -1.655484, 2.182939, 1, 0, 0, 1, 1,
0.6032284, 0.6235603, 1.233504, 0, 0, 0, 1, 1,
0.6057077, 0.3202343, 1.880862, 0, 0, 0, 1, 1,
0.6099678, -0.2323065, 1.983922, 0, 0, 0, 1, 1,
0.6104115, -0.09834606, 2.908178, 0, 0, 0, 1, 1,
0.6115484, 1.833706, 0.2627566, 0, 0, 0, 1, 1,
0.6120663, 1.523688, -0.5379525, 0, 0, 0, 1, 1,
0.6129815, -0.8606224, 2.688774, 0, 0, 0, 1, 1,
0.616024, 0.3986134, 1.085132, 1, 1, 1, 1, 1,
0.6270128, 0.7128516, 1.627108, 1, 1, 1, 1, 1,
0.6306212, 1.455014, 1.181378, 1, 1, 1, 1, 1,
0.6471825, -1.857348, 2.45937, 1, 1, 1, 1, 1,
0.6488256, 1.898578, -0.1743183, 1, 1, 1, 1, 1,
0.6498049, -0.6345006, 3.377018, 1, 1, 1, 1, 1,
0.6529398, -0.7715214, 4.39294, 1, 1, 1, 1, 1,
0.6576169, 1.676767, 0.4974072, 1, 1, 1, 1, 1,
0.657758, 1.292755, -1.247288, 1, 1, 1, 1, 1,
0.6598548, 0.9790543, 0.03435669, 1, 1, 1, 1, 1,
0.6642693, -1.211742, 0.7745973, 1, 1, 1, 1, 1,
0.6689118, -0.2648862, 1.096668, 1, 1, 1, 1, 1,
0.6707762, -1.399484, 1.534272, 1, 1, 1, 1, 1,
0.6717272, 0.1826442, 1.670104, 1, 1, 1, 1, 1,
0.6720157, 2.071058, -0.1665306, 1, 1, 1, 1, 1,
0.6848338, 0.2755605, 0.6159891, 0, 0, 1, 1, 1,
0.6873443, -0.7325452, 3.256038, 1, 0, 0, 1, 1,
0.6887334, -0.6634979, 3.698113, 1, 0, 0, 1, 1,
0.6888562, 0.9559127, 0.3457232, 1, 0, 0, 1, 1,
0.690753, -0.1867909, 1.268688, 1, 0, 0, 1, 1,
0.6963588, 1.368501, 2.510496, 1, 0, 0, 1, 1,
0.6989903, 1.729474, 0.5510047, 0, 0, 0, 1, 1,
0.6995736, -0.1016121, 1.567317, 0, 0, 0, 1, 1,
0.7018654, 0.2358325, 1.676289, 0, 0, 0, 1, 1,
0.7041609, -0.05943472, 4.164026, 0, 0, 0, 1, 1,
0.7088041, -0.2119599, 3.169876, 0, 0, 0, 1, 1,
0.7202727, -0.1246902, 3.101474, 0, 0, 0, 1, 1,
0.727343, 0.4700956, 0.7641571, 0, 0, 0, 1, 1,
0.7278602, -1.035812, 3.108038, 1, 1, 1, 1, 1,
0.7284467, 0.7753413, -0.1786002, 1, 1, 1, 1, 1,
0.7300437, -0.1894501, 2.444539, 1, 1, 1, 1, 1,
0.7316155, 1.509911, -0.5224649, 1, 1, 1, 1, 1,
0.7324961, 1.45399, 2.423865, 1, 1, 1, 1, 1,
0.7334157, -0.4895139, 1.807884, 1, 1, 1, 1, 1,
0.7352965, -0.006328324, 2.743294, 1, 1, 1, 1, 1,
0.7363446, -0.4123991, 3.168693, 1, 1, 1, 1, 1,
0.7418842, 0.06660618, 2.365106, 1, 1, 1, 1, 1,
0.7453842, -1.048123, 4.241502, 1, 1, 1, 1, 1,
0.7506406, 1.054883, -0.200961, 1, 1, 1, 1, 1,
0.7509013, -0.3884287, 1.869201, 1, 1, 1, 1, 1,
0.7517143, 1.847332, 0.2852757, 1, 1, 1, 1, 1,
0.7611295, -0.8996843, 2.224784, 1, 1, 1, 1, 1,
0.762392, 0.6988248, -1.22491, 1, 1, 1, 1, 1,
0.762685, 0.1159557, 1.823555, 0, 0, 1, 1, 1,
0.7627462, 0.2187497, 0.9403215, 1, 0, 0, 1, 1,
0.7634227, 0.5105512, 2.718631, 1, 0, 0, 1, 1,
0.7641228, -1.288185, 3.461171, 1, 0, 0, 1, 1,
0.7659292, 0.111512, 2.406585, 1, 0, 0, 1, 1,
0.7712575, -1.394063, 1.944093, 1, 0, 0, 1, 1,
0.7782896, -1.553824, 1.835024, 0, 0, 0, 1, 1,
0.7792337, -1.098116, 2.334191, 0, 0, 0, 1, 1,
0.779498, -0.8451477, 2.566947, 0, 0, 0, 1, 1,
0.7804746, -0.00590055, 1.899307, 0, 0, 0, 1, 1,
0.7892217, 0.8905115, -0.3164072, 0, 0, 0, 1, 1,
0.7895121, 0.1349659, 0.1193113, 0, 0, 0, 1, 1,
0.7899982, -1.851349, 3.507135, 0, 0, 0, 1, 1,
0.7937555, -2.192529, 3.109864, 1, 1, 1, 1, 1,
0.7973653, -0.7076059, 3.07839, 1, 1, 1, 1, 1,
0.8006504, 1.290501, -0.125775, 1, 1, 1, 1, 1,
0.8016708, 0.9190409, 0.05631525, 1, 1, 1, 1, 1,
0.8027429, 0.4236946, 1.080671, 1, 1, 1, 1, 1,
0.8055381, 0.2499237, 2.58912, 1, 1, 1, 1, 1,
0.8076335, 0.3893273, 0.2156213, 1, 1, 1, 1, 1,
0.8208596, 0.8382595, 1.357944, 1, 1, 1, 1, 1,
0.8229956, -0.335492, 0.8737301, 1, 1, 1, 1, 1,
0.8266688, 0.7257453, 0.6340206, 1, 1, 1, 1, 1,
0.828984, 0.737371, 0.447491, 1, 1, 1, 1, 1,
0.8314642, 0.3327983, -0.7272791, 1, 1, 1, 1, 1,
0.8335419, 0.1657366, 1.288813, 1, 1, 1, 1, 1,
0.8361834, 0.09562169, 1.054597, 1, 1, 1, 1, 1,
0.8398086, -1.113148, 0.4064268, 1, 1, 1, 1, 1,
0.842553, 1.257434, 0.7699226, 0, 0, 1, 1, 1,
0.8471385, -1.314503, 2.091368, 1, 0, 0, 1, 1,
0.8495234, 0.3663611, 3.056751, 1, 0, 0, 1, 1,
0.861012, -2.87856, 2.731271, 1, 0, 0, 1, 1,
0.8623455, 0.007300529, 3.282214, 1, 0, 0, 1, 1,
0.8630943, -0.588232, 3.849771, 1, 0, 0, 1, 1,
0.8640816, -1.14164, 2.285323, 0, 0, 0, 1, 1,
0.8651421, 0.1599467, 2.071539, 0, 0, 0, 1, 1,
0.8656683, 0.2151736, 1.485325, 0, 0, 0, 1, 1,
0.8683608, 0.3912601, 2.733803, 0, 0, 0, 1, 1,
0.8716561, -0.86558, 2.88063, 0, 0, 0, 1, 1,
0.874155, -1.58596, 1.692324, 0, 0, 0, 1, 1,
0.8744692, 0.3994838, 1.633178, 0, 0, 0, 1, 1,
0.8775275, 0.2702931, 1.473976, 1, 1, 1, 1, 1,
0.8871663, -0.2458575, 1.266821, 1, 1, 1, 1, 1,
0.9056956, 0.54696, 1.939533, 1, 1, 1, 1, 1,
0.9072599, 0.7161574, 1.000634, 1, 1, 1, 1, 1,
0.9100864, 0.8228776, 0.4212396, 1, 1, 1, 1, 1,
0.913815, -0.9002655, 0.722473, 1, 1, 1, 1, 1,
0.9203408, -0.7646955, 2.64423, 1, 1, 1, 1, 1,
0.92622, -1.112928, 2.658371, 1, 1, 1, 1, 1,
0.9272143, 1.141676, 1.147206, 1, 1, 1, 1, 1,
0.9365292, 0.665081, 0.7640505, 1, 1, 1, 1, 1,
0.9365424, 0.5297325, 0.2067524, 1, 1, 1, 1, 1,
0.9393314, 0.2969031, 1.267112, 1, 1, 1, 1, 1,
0.946687, 1.310131, 1.268508, 1, 1, 1, 1, 1,
0.9483256, -0.5025198, 2.144635, 1, 1, 1, 1, 1,
0.9490185, 0.3029242, 2.709922, 1, 1, 1, 1, 1,
0.9592075, 0.5165876, 1.580831, 0, 0, 1, 1, 1,
0.9595434, -0.4635142, 2.190697, 1, 0, 0, 1, 1,
0.9671831, -1.048277, 3.937535, 1, 0, 0, 1, 1,
0.9709769, -0.1175015, 2.030196, 1, 0, 0, 1, 1,
0.9730325, -1.050408, 2.077985, 1, 0, 0, 1, 1,
0.9737944, -2.385541, 1.352895, 1, 0, 0, 1, 1,
0.9772262, 1.247958, 1.415385, 0, 0, 0, 1, 1,
0.9804325, -2.231441, 2.463369, 0, 0, 0, 1, 1,
0.982088, 1.549474, 1.190833, 0, 0, 0, 1, 1,
0.9856895, 1.163408, 1.217099, 0, 0, 0, 1, 1,
0.9891881, -1.084816, 1.603892, 0, 0, 0, 1, 1,
0.9995257, -1.111668, 0.9763281, 0, 0, 0, 1, 1,
1.002373, -0.9229817, 2.696688, 0, 0, 0, 1, 1,
1.004169, 0.7810475, 1.378804, 1, 1, 1, 1, 1,
1.006888, -0.004102162, 1.555549, 1, 1, 1, 1, 1,
1.009141, -0.5647365, 2.973504, 1, 1, 1, 1, 1,
1.012698, -0.7633834, 1.962949, 1, 1, 1, 1, 1,
1.014386, 0.1558477, 0.2529853, 1, 1, 1, 1, 1,
1.015192, -1.193178, 2.929932, 1, 1, 1, 1, 1,
1.015754, -0.01243888, 2.250127, 1, 1, 1, 1, 1,
1.017318, 0.3272037, 2.069527, 1, 1, 1, 1, 1,
1.029311, -0.7464448, 2.539824, 1, 1, 1, 1, 1,
1.031716, -0.6529254, 1.99064, 1, 1, 1, 1, 1,
1.040745, -1.51054, 1.688612, 1, 1, 1, 1, 1,
1.042549, -1.376123, 2.259251, 1, 1, 1, 1, 1,
1.044976, 0.3349562, 0.4330728, 1, 1, 1, 1, 1,
1.046324, 0.04413898, 0.6816099, 1, 1, 1, 1, 1,
1.050685, 0.1319553, 1.697821, 1, 1, 1, 1, 1,
1.051156, -0.3124666, 3.754317, 0, 0, 1, 1, 1,
1.06425, -1.211047, 0.9636232, 1, 0, 0, 1, 1,
1.07557, 1.602126, 2.034643, 1, 0, 0, 1, 1,
1.07703, 0.805539, 1.314186, 1, 0, 0, 1, 1,
1.07854, 0.2842163, 1.999427, 1, 0, 0, 1, 1,
1.098529, 1.051164, 0.6092352, 1, 0, 0, 1, 1,
1.107194, -1.034214, 2.193289, 0, 0, 0, 1, 1,
1.123649, -0.370808, 1.222551, 0, 0, 0, 1, 1,
1.12559, -1.756166, 2.603529, 0, 0, 0, 1, 1,
1.130027, -0.3382019, 3.612597, 0, 0, 0, 1, 1,
1.139527, 1.084381, 0.485597, 0, 0, 0, 1, 1,
1.151145, 1.125814, 0.02708556, 0, 0, 0, 1, 1,
1.152306, 1.344422, -0.06953096, 0, 0, 0, 1, 1,
1.169343, -1.073688, 0.593064, 1, 1, 1, 1, 1,
1.171762, 0.6471646, 1.818014, 1, 1, 1, 1, 1,
1.177507, -1.878603, 3.427999, 1, 1, 1, 1, 1,
1.187984, 1.053175, 2.196561, 1, 1, 1, 1, 1,
1.211109, 1.510957, -0.9725228, 1, 1, 1, 1, 1,
1.21209, -0.03113304, 0.439547, 1, 1, 1, 1, 1,
1.216183, 0.7450789, 1.807433, 1, 1, 1, 1, 1,
1.227278, 0.3338496, -0.03354709, 1, 1, 1, 1, 1,
1.242095, -1.059351, 0.1293404, 1, 1, 1, 1, 1,
1.24441, 0.3623085, 1.449617, 1, 1, 1, 1, 1,
1.255857, 1.042997, -0.3516712, 1, 1, 1, 1, 1,
1.260048, -0.9477592, 2.723386, 1, 1, 1, 1, 1,
1.260764, 0.3599544, -0.3457161, 1, 1, 1, 1, 1,
1.261535, -0.9317009, 1.665911, 1, 1, 1, 1, 1,
1.267562, -0.3723788, 1.330462, 1, 1, 1, 1, 1,
1.269904, 0.8294798, -0.1201848, 0, 0, 1, 1, 1,
1.273643, 1.266062, 0.8325084, 1, 0, 0, 1, 1,
1.280672, -0.8032383, 1.807137, 1, 0, 0, 1, 1,
1.283549, 1.125817, 1.416034, 1, 0, 0, 1, 1,
1.28405, 1.200802, 0.6056929, 1, 0, 0, 1, 1,
1.290731, 0.07981934, 1.842529, 1, 0, 0, 1, 1,
1.301447, 0.4725749, 1.674447, 0, 0, 0, 1, 1,
1.314244, 0.3400505, 1.45028, 0, 0, 0, 1, 1,
1.318032, -0.4124353, 2.017635, 0, 0, 0, 1, 1,
1.32186, -1.828573, 2.376139, 0, 0, 0, 1, 1,
1.333528, 1.626974, 0.5380146, 0, 0, 0, 1, 1,
1.336077, -0.1784711, 0.9730135, 0, 0, 0, 1, 1,
1.336444, 1.011047, 0.3108426, 0, 0, 0, 1, 1,
1.341254, 0.7970871, 0.511157, 1, 1, 1, 1, 1,
1.345574, 0.8379366, 1.629234, 1, 1, 1, 1, 1,
1.351967, -1.402513, 1.14139, 1, 1, 1, 1, 1,
1.360974, -1.816978, 2.046542, 1, 1, 1, 1, 1,
1.360977, -0.1618628, -0.09744917, 1, 1, 1, 1, 1,
1.366994, 0.4624706, 1.52222, 1, 1, 1, 1, 1,
1.370263, -0.9320544, 2.706386, 1, 1, 1, 1, 1,
1.375421, 0.7553887, -0.6118992, 1, 1, 1, 1, 1,
1.383472, -0.1175664, 2.103659, 1, 1, 1, 1, 1,
1.387982, -0.9452953, 3.414824, 1, 1, 1, 1, 1,
1.390906, 0.0009426893, 0.5221539, 1, 1, 1, 1, 1,
1.392067, 0.2603157, 1.656496, 1, 1, 1, 1, 1,
1.395978, 0.5583782, 1.291374, 1, 1, 1, 1, 1,
1.39683, -0.1606451, 2.083452, 1, 1, 1, 1, 1,
1.397024, 1.910817, 2.428037, 1, 1, 1, 1, 1,
1.401347, 0.4992351, 0.392495, 0, 0, 1, 1, 1,
1.40178, 0.6231808, 1.110164, 1, 0, 0, 1, 1,
1.404305, -1.526572, 2.04899, 1, 0, 0, 1, 1,
1.405511, 0.3323322, 1.12199, 1, 0, 0, 1, 1,
1.411896, -0.07266593, 2.182861, 1, 0, 0, 1, 1,
1.417848, -1.349822, 3.636517, 1, 0, 0, 1, 1,
1.419844, 2.332644, 1.035667, 0, 0, 0, 1, 1,
1.423456, -1.760075, 2.659574, 0, 0, 0, 1, 1,
1.427976, -0.3092031, 1.555376, 0, 0, 0, 1, 1,
1.445239, -1.283715, 1.071254, 0, 0, 0, 1, 1,
1.451179, 1.219139, 0.1179161, 0, 0, 0, 1, 1,
1.465279, -0.7945325, 4.066382, 0, 0, 0, 1, 1,
1.476527, -0.7548853, 0.607401, 0, 0, 0, 1, 1,
1.499673, 0.3449813, 0.9935306, 1, 1, 1, 1, 1,
1.511184, -1.729407, 2.377512, 1, 1, 1, 1, 1,
1.513318, -0.4165685, 3.033116, 1, 1, 1, 1, 1,
1.514592, -0.940356, 2.727191, 1, 1, 1, 1, 1,
1.527134, -0.5240666, 2.822411, 1, 1, 1, 1, 1,
1.55741, -0.1986014, 1.604336, 1, 1, 1, 1, 1,
1.573316, 2.246432, 0.5193422, 1, 1, 1, 1, 1,
1.574967, 0.1201043, 1.126711, 1, 1, 1, 1, 1,
1.594204, -0.6589592, 3.633757, 1, 1, 1, 1, 1,
1.596708, -0.1260583, 0.7895467, 1, 1, 1, 1, 1,
1.60701, -1.370233, 3.483785, 1, 1, 1, 1, 1,
1.608947, 0.2590465, 0.2819678, 1, 1, 1, 1, 1,
1.627132, -0.1313698, 0.6161967, 1, 1, 1, 1, 1,
1.652081, -0.8865627, 2.047486, 1, 1, 1, 1, 1,
1.661928, -0.9978207, 2.457673, 1, 1, 1, 1, 1,
1.6685, -0.6073788, 1.155495, 0, 0, 1, 1, 1,
1.678114, -1.162639, 0.7883469, 1, 0, 0, 1, 1,
1.697474, -1.305572, 2.505796, 1, 0, 0, 1, 1,
1.713167, -1.319175, 2.518175, 1, 0, 0, 1, 1,
1.723605, 1.751853, 2.127813, 1, 0, 0, 1, 1,
1.733121, -0.002121457, 0.3551854, 1, 0, 0, 1, 1,
1.739863, 0.08028224, 2.136963, 0, 0, 0, 1, 1,
1.749124, -0.08593977, 4.98997, 0, 0, 0, 1, 1,
1.762568, -1.791255, 4.9731, 0, 0, 0, 1, 1,
1.800228, -0.203249, 0.4472622, 0, 0, 0, 1, 1,
1.801793, -0.2469262, 0.6079747, 0, 0, 0, 1, 1,
1.807562, -1.184201, 3.313211, 0, 0, 0, 1, 1,
1.836231, 0.2436747, 1.439075, 0, 0, 0, 1, 1,
1.844536, -0.5253825, 1.958971, 1, 1, 1, 1, 1,
1.847333, 0.4720419, 1.998505, 1, 1, 1, 1, 1,
1.924432, 0.8956051, 1.38394, 1, 1, 1, 1, 1,
1.931296, -0.3007661, 1.35259, 1, 1, 1, 1, 1,
1.953257, -0.8079348, 1.481662, 1, 1, 1, 1, 1,
1.960238, 0.3325649, 0.5220202, 1, 1, 1, 1, 1,
1.977718, 0.1525026, 0.8708714, 1, 1, 1, 1, 1,
1.984492, -0.6766107, 3.315207, 1, 1, 1, 1, 1,
1.98902, -2.274474, 2.641553, 1, 1, 1, 1, 1,
1.9913, 0.231955, 1.460267, 1, 1, 1, 1, 1,
2.018475, 0.8603218, 0.002345318, 1, 1, 1, 1, 1,
2.031677, 0.02895303, 0.6864353, 1, 1, 1, 1, 1,
2.052529, -0.8541146, 1.554722, 1, 1, 1, 1, 1,
2.054123, 0.1553629, 2.742216, 1, 1, 1, 1, 1,
2.060676, 0.3173636, 1.207376, 1, 1, 1, 1, 1,
2.077887, -0.8874464, 3.463936, 0, 0, 1, 1, 1,
2.106687, -0.8503368, 1.465638, 1, 0, 0, 1, 1,
2.144199, 0.5771046, 1.126875, 1, 0, 0, 1, 1,
2.181678, -2.071958, 4.303397, 1, 0, 0, 1, 1,
2.204316, -0.5694385, 0.4945151, 1, 0, 0, 1, 1,
2.218735, 0.7836324, 1.732637, 1, 0, 0, 1, 1,
2.297871, -2.221185, 2.082587, 0, 0, 0, 1, 1,
2.326354, -1.118765, 0.320048, 0, 0, 0, 1, 1,
2.337954, -1.863895, 1.744329, 0, 0, 0, 1, 1,
2.343914, -1.811358, 1.929077, 0, 0, 0, 1, 1,
2.364766, 0.177712, 1.486112, 0, 0, 0, 1, 1,
2.371304, 0.05065146, 2.077475, 0, 0, 0, 1, 1,
2.401507, 1.096708, 2.004177, 0, 0, 0, 1, 1,
2.425095, 0.02328584, 2.06227, 1, 1, 1, 1, 1,
2.609542, -0.05844313, 3.137269, 1, 1, 1, 1, 1,
2.640534, -2.860414, 3.752648, 1, 1, 1, 1, 1,
2.769483, 2.256215, 1.604146, 1, 1, 1, 1, 1,
2.770504, 0.9699906, 2.057587, 1, 1, 1, 1, 1,
2.916278, 1.378459, 2.073996, 1, 1, 1, 1, 1,
3.253324, -0.5343011, 0.2075405, 1, 1, 1, 1, 1
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
var radius = 10.1242;
var distance = 35.56082;
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
mvMatrix.translate( 0.1628449, 0.3869209, 0.09507108 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.56082);
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
