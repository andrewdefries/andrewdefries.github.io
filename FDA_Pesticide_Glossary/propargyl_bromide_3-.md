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
-2.930496, 0.5865312, 0.8396046, 1, 0, 0, 1,
-2.808105, -0.4583544, -2.71839, 1, 0.007843138, 0, 1,
-2.683966, 0.6512809, 0.6728244, 1, 0.01176471, 0, 1,
-2.675915, 0.09229131, -0.220314, 1, 0.01960784, 0, 1,
-2.666061, 0.7348499, -1.954823, 1, 0.02352941, 0, 1,
-2.655054, -0.339142, -1.915897, 1, 0.03137255, 0, 1,
-2.548198, -0.3913897, -0.4399754, 1, 0.03529412, 0, 1,
-2.534166, 1.323344, -2.279719, 1, 0.04313726, 0, 1,
-2.462869, -0.4034183, -1.861995, 1, 0.04705882, 0, 1,
-2.434183, 0.1264949, 0.6334296, 1, 0.05490196, 0, 1,
-2.410643, -2.001325, -2.774281, 1, 0.05882353, 0, 1,
-2.375731, -0.2894904, -1.301619, 1, 0.06666667, 0, 1,
-2.374697, -0.1860687, -2.249796, 1, 0.07058824, 0, 1,
-2.369061, -0.6670161, -2.323633, 1, 0.07843138, 0, 1,
-2.362603, 0.4496166, -2.738277, 1, 0.08235294, 0, 1,
-2.346639, -0.8059789, -3.138808, 1, 0.09019608, 0, 1,
-2.333525, 0.8496871, -0.918124, 1, 0.09411765, 0, 1,
-2.333153, 0.03133941, -0.9141986, 1, 0.1019608, 0, 1,
-2.295922, 1.390402, 0.8715521, 1, 0.1098039, 0, 1,
-2.285146, 0.7691557, -3.252939, 1, 0.1137255, 0, 1,
-2.25582, -0.714191, -1.711313, 1, 0.1215686, 0, 1,
-2.249882, -0.02513767, -3.491672, 1, 0.1254902, 0, 1,
-2.236651, 1.497953, -1.269252, 1, 0.1333333, 0, 1,
-2.203931, -0.7075963, -1.245503, 1, 0.1372549, 0, 1,
-2.191732, -1.767352, -3.021506, 1, 0.145098, 0, 1,
-2.153869, -1.244776, -2.003194, 1, 0.1490196, 0, 1,
-2.135857, -0.03559927, -1.138333, 1, 0.1568628, 0, 1,
-2.133038, 1.614697, -0.8953794, 1, 0.1607843, 0, 1,
-2.088528, 0.03937889, -1.570814, 1, 0.1686275, 0, 1,
-2.067623, 1.749903, -2.435947, 1, 0.172549, 0, 1,
-2.066396, -0.02159796, -2.494819, 1, 0.1803922, 0, 1,
-2.06163, -1.317455, -2.319124, 1, 0.1843137, 0, 1,
-2.028303, -0.6029793, -1.074623, 1, 0.1921569, 0, 1,
-1.976873, 1.144946, -0.6820005, 1, 0.1960784, 0, 1,
-1.952048, -0.06896076, -2.423858, 1, 0.2039216, 0, 1,
-1.949556, -0.9958868, -3.625673, 1, 0.2117647, 0, 1,
-1.913324, 0.3177129, 0.4551044, 1, 0.2156863, 0, 1,
-1.902664, -1.235266, -2.259181, 1, 0.2235294, 0, 1,
-1.898222, 0.01325812, -2.7276, 1, 0.227451, 0, 1,
-1.897776, 0.1979108, -2.575998, 1, 0.2352941, 0, 1,
-1.889302, -0.5538536, -1.592422, 1, 0.2392157, 0, 1,
-1.876704, -0.3337743, -2.461675, 1, 0.2470588, 0, 1,
-1.83242, 1.72271, -0.9316024, 1, 0.2509804, 0, 1,
-1.82813, 0.9895187, -3.178097, 1, 0.2588235, 0, 1,
-1.795501, -0.6000745, -1.923131, 1, 0.2627451, 0, 1,
-1.752971, -1.546878, -3.651001, 1, 0.2705882, 0, 1,
-1.732289, -1.129927, -2.206633, 1, 0.2745098, 0, 1,
-1.72409, 0.2973465, -1.868208, 1, 0.282353, 0, 1,
-1.70894, -0.5763717, -0.7861392, 1, 0.2862745, 0, 1,
-1.706376, -1.29212, -2.201074, 1, 0.2941177, 0, 1,
-1.679647, 0.9839417, -0.09037745, 1, 0.3019608, 0, 1,
-1.677141, 0.4152695, -0.9838584, 1, 0.3058824, 0, 1,
-1.652078, 0.7672292, -4.180169, 1, 0.3137255, 0, 1,
-1.628132, 0.2651713, -2.267657, 1, 0.3176471, 0, 1,
-1.628024, -1.697106, -4.160121, 1, 0.3254902, 0, 1,
-1.609851, -1.436538, -2.071436, 1, 0.3294118, 0, 1,
-1.593887, 0.08996068, -2.988405, 1, 0.3372549, 0, 1,
-1.589894, 0.1686172, -0.07999545, 1, 0.3411765, 0, 1,
-1.58203, -0.7220361, -2.17273, 1, 0.3490196, 0, 1,
-1.576762, 0.04500747, 0.0963012, 1, 0.3529412, 0, 1,
-1.563919, -1.548379, -2.282769, 1, 0.3607843, 0, 1,
-1.559619, 0.7420162, -0.1819909, 1, 0.3647059, 0, 1,
-1.545775, 2.007198, 0.7377877, 1, 0.372549, 0, 1,
-1.545565, -0.09521476, -0.9466399, 1, 0.3764706, 0, 1,
-1.525127, 0.5718328, -0.6873987, 1, 0.3843137, 0, 1,
-1.514434, -0.673083, -2.990649, 1, 0.3882353, 0, 1,
-1.507938, 0.7836326, -1.093284, 1, 0.3960784, 0, 1,
-1.501562, -0.8408018, -2.073873, 1, 0.4039216, 0, 1,
-1.500008, -1.933939, -2.291966, 1, 0.4078431, 0, 1,
-1.499851, 0.8806779, -0.9020881, 1, 0.4156863, 0, 1,
-1.488953, 0.9013183, -0.1650167, 1, 0.4196078, 0, 1,
-1.484271, -0.5512816, -3.584448, 1, 0.427451, 0, 1,
-1.447744, 0.1170905, -0.635812, 1, 0.4313726, 0, 1,
-1.439621, 1.912651, -1.080874, 1, 0.4392157, 0, 1,
-1.436641, 0.3687636, -1.997823, 1, 0.4431373, 0, 1,
-1.433037, 0.2481806, -2.865819, 1, 0.4509804, 0, 1,
-1.418172, -0.07375417, -0.7038857, 1, 0.454902, 0, 1,
-1.415575, -1.52725, -3.234979, 1, 0.4627451, 0, 1,
-1.406637, 0.1663622, -0.1152161, 1, 0.4666667, 0, 1,
-1.400988, -0.3067303, -2.10488, 1, 0.4745098, 0, 1,
-1.398822, 0.8215323, -1.336686, 1, 0.4784314, 0, 1,
-1.393359, -1.605269, -2.706604, 1, 0.4862745, 0, 1,
-1.392978, -0.5848719, -1.315609, 1, 0.4901961, 0, 1,
-1.378378, -0.5430748, -2.577989, 1, 0.4980392, 0, 1,
-1.359851, -0.4318292, -1.423886, 1, 0.5058824, 0, 1,
-1.352093, -0.2284884, -1.050923, 1, 0.509804, 0, 1,
-1.351715, -0.4457726, -2.843569, 1, 0.5176471, 0, 1,
-1.348892, 1.389207, -0.3910103, 1, 0.5215687, 0, 1,
-1.342524, -0.2948665, -1.933207, 1, 0.5294118, 0, 1,
-1.333814, -0.7224717, -1.476453, 1, 0.5333334, 0, 1,
-1.32543, -0.5880855, -2.063522, 1, 0.5411765, 0, 1,
-1.322799, 0.7975275, -1.327743, 1, 0.5450981, 0, 1,
-1.321998, -0.5496786, -0.8776631, 1, 0.5529412, 0, 1,
-1.321078, -1.544604, -3.612987, 1, 0.5568628, 0, 1,
-1.320597, -1.3397, -2.886999, 1, 0.5647059, 0, 1,
-1.316155, -0.2646161, -2.217425, 1, 0.5686275, 0, 1,
-1.315906, -1.365568, -1.478224, 1, 0.5764706, 0, 1,
-1.30741, -0.1990541, -2.374703, 1, 0.5803922, 0, 1,
-1.307146, 1.338892, 0.6434458, 1, 0.5882353, 0, 1,
-1.300786, 1.829286, -0.4762128, 1, 0.5921569, 0, 1,
-1.293916, -0.6775728, -1.588994, 1, 0.6, 0, 1,
-1.291728, -1.596307, -2.757728, 1, 0.6078432, 0, 1,
-1.29093, -1.173356, -3.17656, 1, 0.6117647, 0, 1,
-1.28077, 0.285926, -0.05003556, 1, 0.6196079, 0, 1,
-1.272469, 0.9270169, -1.74515, 1, 0.6235294, 0, 1,
-1.267725, -0.008607429, -2.329883, 1, 0.6313726, 0, 1,
-1.254232, 0.624889, -2.697759, 1, 0.6352941, 0, 1,
-1.240922, -0.8546459, -2.651083, 1, 0.6431373, 0, 1,
-1.239526, -1.255052, -2.741614, 1, 0.6470588, 0, 1,
-1.239279, -1.614719, -1.702241, 1, 0.654902, 0, 1,
-1.233263, 1.086081, -1.593491, 1, 0.6588235, 0, 1,
-1.230275, 1.240585, -0.2272205, 1, 0.6666667, 0, 1,
-1.229956, 0.3603363, -0.8319278, 1, 0.6705883, 0, 1,
-1.229167, -1.50459, -2.150076, 1, 0.6784314, 0, 1,
-1.227289, -0.2762255, -2.931617, 1, 0.682353, 0, 1,
-1.226136, 0.1168722, -0.4437415, 1, 0.6901961, 0, 1,
-1.220148, -0.6249307, -3.18739, 1, 0.6941177, 0, 1,
-1.217001, -0.5220363, -2.169745, 1, 0.7019608, 0, 1,
-1.216923, 0.3900736, -0.9162728, 1, 0.7098039, 0, 1,
-1.214078, -1.070594, -1.623519, 1, 0.7137255, 0, 1,
-1.208547, -0.2634424, 0.705804, 1, 0.7215686, 0, 1,
-1.202749, -0.7269434, -3.807177, 1, 0.7254902, 0, 1,
-1.202512, 0.8852167, 3.451778, 1, 0.7333333, 0, 1,
-1.198194, -1.823664, -3.320058, 1, 0.7372549, 0, 1,
-1.195853, 0.3638403, 0.03776006, 1, 0.7450981, 0, 1,
-1.194414, 1.801224, -0.5248178, 1, 0.7490196, 0, 1,
-1.192684, -0.08467732, -1.472438, 1, 0.7568628, 0, 1,
-1.186775, -0.5516649, -2.131074, 1, 0.7607843, 0, 1,
-1.183998, 0.737124, -0.4071887, 1, 0.7686275, 0, 1,
-1.177153, 1.00133, -0.5393191, 1, 0.772549, 0, 1,
-1.174232, 0.9291202, -0.6625964, 1, 0.7803922, 0, 1,
-1.174086, 1.43368, -0.7071984, 1, 0.7843137, 0, 1,
-1.171358, 0.3273596, -0.8666863, 1, 0.7921569, 0, 1,
-1.170207, 0.7224239, -1.866161, 1, 0.7960784, 0, 1,
-1.168202, -1.685498, -3.5932, 1, 0.8039216, 0, 1,
-1.166849, -0.4319259, -1.217275, 1, 0.8117647, 0, 1,
-1.163789, -0.9818423, -3.663162, 1, 0.8156863, 0, 1,
-1.161192, -0.01636113, -1.52931, 1, 0.8235294, 0, 1,
-1.152637, 2.633162, -0.2540925, 1, 0.827451, 0, 1,
-1.14588, 0.8934125, -1.342509, 1, 0.8352941, 0, 1,
-1.137563, 1.521379, -0.3174961, 1, 0.8392157, 0, 1,
-1.134485, 1.36603, -1.615751, 1, 0.8470588, 0, 1,
-1.131693, 0.7972487, 0.3483503, 1, 0.8509804, 0, 1,
-1.126756, 0.7006422, -0.9891052, 1, 0.8588235, 0, 1,
-1.121507, 1.327559, 0.5392311, 1, 0.8627451, 0, 1,
-1.117977, -1.309657, -2.997684, 1, 0.8705882, 0, 1,
-1.107951, 1.107146, -2.062525, 1, 0.8745098, 0, 1,
-1.105839, -1.379568, -3.150649, 1, 0.8823529, 0, 1,
-1.100865, 0.2323939, -2.5606, 1, 0.8862745, 0, 1,
-1.092155, -1.61886, -3.383126, 1, 0.8941177, 0, 1,
-1.080257, 1.055457, -1.593249, 1, 0.8980392, 0, 1,
-1.080063, -1.108464, -3.625909, 1, 0.9058824, 0, 1,
-1.080011, -0.0824706, -0.7897463, 1, 0.9137255, 0, 1,
-1.07713, -1.080183, -1.685311, 1, 0.9176471, 0, 1,
-1.076652, 0.5621395, -1.709009, 1, 0.9254902, 0, 1,
-1.073446, 0.1289889, -2.157825, 1, 0.9294118, 0, 1,
-1.073358, -1.38414, -1.81008, 1, 0.9372549, 0, 1,
-1.052351, 1.928346, -0.7281191, 1, 0.9411765, 0, 1,
-1.050067, 0.7222514, -1.592219, 1, 0.9490196, 0, 1,
-1.047358, 0.8174439, -0.3037758, 1, 0.9529412, 0, 1,
-1.037305, -1.070581, -1.30286, 1, 0.9607843, 0, 1,
-1.026964, 0.2396879, -1.741535, 1, 0.9647059, 0, 1,
-1.024286, -0.2653624, -3.094532, 1, 0.972549, 0, 1,
-1.022507, 0.0261109, -2.206258, 1, 0.9764706, 0, 1,
-1.016341, -1.127169, -3.064755, 1, 0.9843137, 0, 1,
-1.012445, -1.435742, -3.352061, 1, 0.9882353, 0, 1,
-1.010957, 1.556927, -0.07527573, 1, 0.9960784, 0, 1,
-1.010167, -0.4131592, -1.54706, 0.9960784, 1, 0, 1,
-0.9898688, 0.6257847, -0.3068845, 0.9921569, 1, 0, 1,
-0.9869185, 1.183026, -1.853619, 0.9843137, 1, 0, 1,
-0.9833902, -0.198775, -1.901373, 0.9803922, 1, 0, 1,
-0.9810784, 0.8802773, 0.4070845, 0.972549, 1, 0, 1,
-0.9802803, -1.720878, -3.971668, 0.9686275, 1, 0, 1,
-0.9799967, 0.5886987, -2.207064, 0.9607843, 1, 0, 1,
-0.9790089, -0.6227468, -1.817097, 0.9568627, 1, 0, 1,
-0.9751648, 0.9277226, -1.994394, 0.9490196, 1, 0, 1,
-0.9697244, 1.55136, -1.05973, 0.945098, 1, 0, 1,
-0.9680758, -1.601615, -4.205286, 0.9372549, 1, 0, 1,
-0.9661148, -0.4098544, -3.470014, 0.9333333, 1, 0, 1,
-0.9657016, 0.6290382, 0.1314572, 0.9254902, 1, 0, 1,
-0.9608544, -0.9560944, -2.80829, 0.9215686, 1, 0, 1,
-0.9518497, 0.6534621, -1.557883, 0.9137255, 1, 0, 1,
-0.9458974, 1.23286, -0.747627, 0.9098039, 1, 0, 1,
-0.9441589, 0.2573934, -0.5070609, 0.9019608, 1, 0, 1,
-0.9440402, -0.6621528, -0.3666382, 0.8941177, 1, 0, 1,
-0.9328563, 0.5565827, -1.348417, 0.8901961, 1, 0, 1,
-0.9267542, -0.3969534, -3.4487, 0.8823529, 1, 0, 1,
-0.9255644, 0.861625, -0.132661, 0.8784314, 1, 0, 1,
-0.9247277, -1.762427, -3.500419, 0.8705882, 1, 0, 1,
-0.92364, 1.114564, -1.709244, 0.8666667, 1, 0, 1,
-0.9223709, 1.277809, 0.4998857, 0.8588235, 1, 0, 1,
-0.9134277, -0.635984, -1.824271, 0.854902, 1, 0, 1,
-0.9109572, 1.380136, -0.7658291, 0.8470588, 1, 0, 1,
-0.9073684, -0.1206287, -0.7059078, 0.8431373, 1, 0, 1,
-0.9038609, -1.14684, -3.208028, 0.8352941, 1, 0, 1,
-0.902169, 0.8976799, -1.693889, 0.8313726, 1, 0, 1,
-0.9012694, -1.190975, -2.142721, 0.8235294, 1, 0, 1,
-0.9002969, -1.378675, -3.266306, 0.8196079, 1, 0, 1,
-0.8998299, 0.8261926, -1.793751, 0.8117647, 1, 0, 1,
-0.8905362, -1.578145, -2.419702, 0.8078431, 1, 0, 1,
-0.890474, 0.2650825, -1.079965, 0.8, 1, 0, 1,
-0.8862473, -0.1503829, -1.564909, 0.7921569, 1, 0, 1,
-0.8775069, 0.6183457, -1.357183, 0.7882353, 1, 0, 1,
-0.8755994, -0.9841869, -2.27305, 0.7803922, 1, 0, 1,
-0.8746582, -0.6239677, -1.688773, 0.7764706, 1, 0, 1,
-0.8745781, 0.5717214, -2.002552, 0.7686275, 1, 0, 1,
-0.8696095, 0.008042698, -2.261472, 0.7647059, 1, 0, 1,
-0.8643999, -0.7383318, -2.191365, 0.7568628, 1, 0, 1,
-0.8569667, -0.7600142, -2.844896, 0.7529412, 1, 0, 1,
-0.8506572, -0.03820087, -2.205777, 0.7450981, 1, 0, 1,
-0.8493792, -0.6834846, -2.061752, 0.7411765, 1, 0, 1,
-0.8476483, 1.582601, 0.0662675, 0.7333333, 1, 0, 1,
-0.846509, -0.213715, -2.030115, 0.7294118, 1, 0, 1,
-0.8399534, -1.471072, -3.906855, 0.7215686, 1, 0, 1,
-0.8350514, 0.8159524, -1.501638, 0.7176471, 1, 0, 1,
-0.8344549, -0.2401379, -0.3054307, 0.7098039, 1, 0, 1,
-0.8326089, -0.6186474, -3.103475, 0.7058824, 1, 0, 1,
-0.8304382, -0.4205312, -2.401644, 0.6980392, 1, 0, 1,
-0.8298163, 1.156339, -0.4079178, 0.6901961, 1, 0, 1,
-0.8297427, 0.4827255, -0.7858136, 0.6862745, 1, 0, 1,
-0.8247595, -0.05896197, -1.071695, 0.6784314, 1, 0, 1,
-0.8235876, 0.5442202, 0.9854738, 0.6745098, 1, 0, 1,
-0.8200135, -0.07220025, 0.2696574, 0.6666667, 1, 0, 1,
-0.8193244, 0.05270989, -0.8666608, 0.6627451, 1, 0, 1,
-0.8074814, 2.06894, -0.4359658, 0.654902, 1, 0, 1,
-0.807099, 0.779525, -0.1724095, 0.6509804, 1, 0, 1,
-0.8038967, -1.462161, -4.337729, 0.6431373, 1, 0, 1,
-0.8028188, -0.8735204, -2.050088, 0.6392157, 1, 0, 1,
-0.7956052, -1.278368, -2.656313, 0.6313726, 1, 0, 1,
-0.790858, 1.423729, -1.796101, 0.627451, 1, 0, 1,
-0.7880687, -1.246116, -3.413063, 0.6196079, 1, 0, 1,
-0.7875151, -1.462376, -2.036306, 0.6156863, 1, 0, 1,
-0.7812526, -0.9281966, -0.7281777, 0.6078432, 1, 0, 1,
-0.7795331, 0.2187491, -3.131727, 0.6039216, 1, 0, 1,
-0.7752811, 1.103052, -0.8832119, 0.5960785, 1, 0, 1,
-0.7734457, 0.637097, -1.901731, 0.5882353, 1, 0, 1,
-0.7733662, 0.00472604, -1.180694, 0.5843138, 1, 0, 1,
-0.7681627, -0.4288298, -2.338083, 0.5764706, 1, 0, 1,
-0.7675933, -2.039898, -2.200739, 0.572549, 1, 0, 1,
-0.7581241, 0.8552428, -1.114538, 0.5647059, 1, 0, 1,
-0.7541104, -0.2127364, -2.849942, 0.5607843, 1, 0, 1,
-0.7504612, 1.864817, 0.5991473, 0.5529412, 1, 0, 1,
-0.7501222, 0.9490135, -2.667559, 0.5490196, 1, 0, 1,
-0.7467762, 0.01210699, -3.404417, 0.5411765, 1, 0, 1,
-0.7413691, 0.5091006, -1.43121, 0.5372549, 1, 0, 1,
-0.7299797, -0.7616628, -1.924402, 0.5294118, 1, 0, 1,
-0.7287737, 0.2114807, 0.1970502, 0.5254902, 1, 0, 1,
-0.7264542, 0.381312, -1.192894, 0.5176471, 1, 0, 1,
-0.7214472, -0.1407448, -2.357865, 0.5137255, 1, 0, 1,
-0.7204517, -0.1415088, -0.5660952, 0.5058824, 1, 0, 1,
-0.7177994, -0.4701236, -1.881873, 0.5019608, 1, 0, 1,
-0.7017825, -1.849505, -2.502171, 0.4941176, 1, 0, 1,
-0.7006167, 1.273358, -1.153365, 0.4862745, 1, 0, 1,
-0.6967865, 1.258711, -1.314606, 0.4823529, 1, 0, 1,
-0.6941296, 0.3253334, -2.433907, 0.4745098, 1, 0, 1,
-0.6893439, 0.2323378, 1.01792, 0.4705882, 1, 0, 1,
-0.6886908, 1.465711, -0.5692379, 0.4627451, 1, 0, 1,
-0.6862449, -1.331372, -1.416825, 0.4588235, 1, 0, 1,
-0.6836187, 0.8572376, 0.8823329, 0.4509804, 1, 0, 1,
-0.6822248, 0.7144458, -0.4649074, 0.4470588, 1, 0, 1,
-0.6804821, 0.4169407, -0.9301341, 0.4392157, 1, 0, 1,
-0.6794579, 0.3161685, -1.662706, 0.4352941, 1, 0, 1,
-0.6746839, 0.5133479, 0.5585995, 0.427451, 1, 0, 1,
-0.6711374, -0.7346888, -2.512392, 0.4235294, 1, 0, 1,
-0.6696747, 0.04510109, -3.375134, 0.4156863, 1, 0, 1,
-0.6657436, -0.1569402, -1.743867, 0.4117647, 1, 0, 1,
-0.65052, -2.553692, -2.919664, 0.4039216, 1, 0, 1,
-0.6467486, -1.610394, -2.627789, 0.3960784, 1, 0, 1,
-0.6410341, 0.4879259, 0.7480822, 0.3921569, 1, 0, 1,
-0.6371121, 1.216215, -1.413037, 0.3843137, 1, 0, 1,
-0.6345087, -0.1066926, -0.7333135, 0.3803922, 1, 0, 1,
-0.6282402, 0.557569, -0.767417, 0.372549, 1, 0, 1,
-0.6238741, 0.3170011, -1.876226, 0.3686275, 1, 0, 1,
-0.6208287, 0.05273245, -1.831028, 0.3607843, 1, 0, 1,
-0.6192252, -0.07986202, -1.168743, 0.3568628, 1, 0, 1,
-0.6158642, -3.369245, -3.592754, 0.3490196, 1, 0, 1,
-0.6118352, 0.4428061, -0.9474782, 0.345098, 1, 0, 1,
-0.6113952, 0.1097412, -0.4314309, 0.3372549, 1, 0, 1,
-0.6077312, 1.336568, -0.6119501, 0.3333333, 1, 0, 1,
-0.6067418, 0.2072865, -1.922464, 0.3254902, 1, 0, 1,
-0.5975669, -0.335696, -3.905177, 0.3215686, 1, 0, 1,
-0.5935046, 2.433305, -1.566863, 0.3137255, 1, 0, 1,
-0.5928684, 0.4784544, -1.844807, 0.3098039, 1, 0, 1,
-0.5926698, 0.5391719, 0.3058833, 0.3019608, 1, 0, 1,
-0.5916667, -0.7875405, -2.503526, 0.2941177, 1, 0, 1,
-0.5892172, 1.200917, -1.980756, 0.2901961, 1, 0, 1,
-0.5889261, 0.8357051, -0.009085283, 0.282353, 1, 0, 1,
-0.58729, 1.772679, 0.5950809, 0.2784314, 1, 0, 1,
-0.5825055, -1.682226, -3.320476, 0.2705882, 1, 0, 1,
-0.5770444, 1.533038, -0.4364368, 0.2666667, 1, 0, 1,
-0.5729606, 0.5977001, -1.638931, 0.2588235, 1, 0, 1,
-0.5701877, -2.216202, -3.323436, 0.254902, 1, 0, 1,
-0.5699306, -0.1580726, -1.160404, 0.2470588, 1, 0, 1,
-0.5690234, -0.2198876, -0.09412837, 0.2431373, 1, 0, 1,
-0.5656253, 1.922467, -1.108623, 0.2352941, 1, 0, 1,
-0.5645465, -0.1115369, -2.667418, 0.2313726, 1, 0, 1,
-0.5581108, 0.4041003, 0.07346394, 0.2235294, 1, 0, 1,
-0.5572391, -0.9503792, -3.802148, 0.2196078, 1, 0, 1,
-0.5552295, -0.02303355, -0.8549613, 0.2117647, 1, 0, 1,
-0.5476348, -0.1265917, -0.4746105, 0.2078431, 1, 0, 1,
-0.5460701, -1.374837, -0.7406721, 0.2, 1, 0, 1,
-0.5445098, 1.965747, -1.670409, 0.1921569, 1, 0, 1,
-0.5420672, 0.2381111, -1.13462, 0.1882353, 1, 0, 1,
-0.5409947, 0.445856, -1.382279, 0.1803922, 1, 0, 1,
-0.5400305, 0.04087463, 0.4632536, 0.1764706, 1, 0, 1,
-0.5387743, -0.3221287, -2.753806, 0.1686275, 1, 0, 1,
-0.5319161, -0.6013474, -2.990286, 0.1647059, 1, 0, 1,
-0.5264962, 0.0877979, -2.498087, 0.1568628, 1, 0, 1,
-0.524098, -0.7909097, -1.263699, 0.1529412, 1, 0, 1,
-0.5238652, 1.220479, 0.2057445, 0.145098, 1, 0, 1,
-0.5211658, 1.506849, -1.69855, 0.1411765, 1, 0, 1,
-0.5196401, -0.7403923, -1.874279, 0.1333333, 1, 0, 1,
-0.5188131, -0.409239, -3.554299, 0.1294118, 1, 0, 1,
-0.5164478, 2.28285, -0.9958789, 0.1215686, 1, 0, 1,
-0.5133398, -0.6714052, -3.461083, 0.1176471, 1, 0, 1,
-0.4955736, -0.4947557, -3.609142, 0.1098039, 1, 0, 1,
-0.4948775, 0.1837374, 0.1692039, 0.1058824, 1, 0, 1,
-0.4902077, 2.183519, -0.8579943, 0.09803922, 1, 0, 1,
-0.486623, -1.011531, -1.892244, 0.09019608, 1, 0, 1,
-0.4854638, -0.1365063, -2.818838, 0.08627451, 1, 0, 1,
-0.4847457, 0.4430116, -0.6713778, 0.07843138, 1, 0, 1,
-0.4784098, -0.2414804, -3.915124, 0.07450981, 1, 0, 1,
-0.4753871, 1.180092, 0.1321029, 0.06666667, 1, 0, 1,
-0.4744115, -0.4474335, -0.8930023, 0.0627451, 1, 0, 1,
-0.4679868, -0.5905427, -2.642492, 0.05490196, 1, 0, 1,
-0.4636781, -0.3748879, -1.741592, 0.05098039, 1, 0, 1,
-0.4625828, 0.1812869, -2.317242, 0.04313726, 1, 0, 1,
-0.4601472, 0.6484742, -0.3357583, 0.03921569, 1, 0, 1,
-0.4564688, -0.1941694, -2.632006, 0.03137255, 1, 0, 1,
-0.4513339, -1.091413, -3.012464, 0.02745098, 1, 0, 1,
-0.4486119, -0.4127707, -1.534868, 0.01960784, 1, 0, 1,
-0.4460667, 1.236846, -0.7497313, 0.01568628, 1, 0, 1,
-0.4439893, -0.1589025, -2.118516, 0.007843138, 1, 0, 1,
-0.4418588, -0.1884002, -2.20397, 0.003921569, 1, 0, 1,
-0.4392059, 0.3538179, -0.9108025, 0, 1, 0.003921569, 1,
-0.4382379, -0.8784465, -2.344406, 0, 1, 0.01176471, 1,
-0.4373168, 1.075459, -0.2668194, 0, 1, 0.01568628, 1,
-0.4360929, -0.7796388, -4.277336, 0, 1, 0.02352941, 1,
-0.4277885, -0.208532, -0.7157319, 0, 1, 0.02745098, 1,
-0.4272813, -0.2361345, -2.493444, 0, 1, 0.03529412, 1,
-0.4231631, -0.4062719, -3.017635, 0, 1, 0.03921569, 1,
-0.4228709, -0.6559803, -2.76971, 0, 1, 0.04705882, 1,
-0.4211228, -0.5232789, -3.676785, 0, 1, 0.05098039, 1,
-0.4187153, -0.3215974, -2.993742, 0, 1, 0.05882353, 1,
-0.4162697, 0.5795612, -0.5893033, 0, 1, 0.0627451, 1,
-0.4120264, 1.196822, -1.421414, 0, 1, 0.07058824, 1,
-0.4101892, -0.2462331, -2.064722, 0, 1, 0.07450981, 1,
-0.4071953, 0.5604386, -0.577204, 0, 1, 0.08235294, 1,
-0.4033562, 0.08164093, -1.434229, 0, 1, 0.08627451, 1,
-0.4024767, 2.215316, -0.1458932, 0, 1, 0.09411765, 1,
-0.4006843, 0.4460289, -1.33485, 0, 1, 0.1019608, 1,
-0.3983529, -0.6051157, -2.579406, 0, 1, 0.1058824, 1,
-0.3946897, 0.07815319, -1.41239, 0, 1, 0.1137255, 1,
-0.3936477, -1.020775, -1.122434, 0, 1, 0.1176471, 1,
-0.3927859, -0.6493442, -3.006324, 0, 1, 0.1254902, 1,
-0.3904541, -1.822304, -3.147769, 0, 1, 0.1294118, 1,
-0.3900236, -0.3435259, -3.35381, 0, 1, 0.1372549, 1,
-0.3898807, -0.1161649, -2.20862, 0, 1, 0.1411765, 1,
-0.3887092, 1.363577, -0.4954685, 0, 1, 0.1490196, 1,
-0.3863208, 0.0227068, -1.547957, 0, 1, 0.1529412, 1,
-0.3824981, -1.466421, -2.767206, 0, 1, 0.1607843, 1,
-0.3792668, 0.1356119, -0.549211, 0, 1, 0.1647059, 1,
-0.3774311, -2.133373, -2.881604, 0, 1, 0.172549, 1,
-0.3729633, 0.4180668, -0.988863, 0, 1, 0.1764706, 1,
-0.3713832, -0.06349407, -2.528287, 0, 1, 0.1843137, 1,
-0.3688966, 0.4809965, -0.4494823, 0, 1, 0.1882353, 1,
-0.3686262, -0.283865, -0.9364442, 0, 1, 0.1960784, 1,
-0.3650051, -0.6120558, -3.649612, 0, 1, 0.2039216, 1,
-0.3618889, 0.5830593, -0.8183784, 0, 1, 0.2078431, 1,
-0.3589675, -1.025106, -5.112543, 0, 1, 0.2156863, 1,
-0.3555095, -2.909252, -4.165823, 0, 1, 0.2196078, 1,
-0.3548838, -0.8278058, -2.770997, 0, 1, 0.227451, 1,
-0.3505901, -0.8090594, -2.074659, 0, 1, 0.2313726, 1,
-0.3496959, 1.083166, -0.5375894, 0, 1, 0.2392157, 1,
-0.3478563, -0.8425792, -4.015653, 0, 1, 0.2431373, 1,
-0.3466745, -0.1586125, -2.178424, 0, 1, 0.2509804, 1,
-0.3441313, -0.9138659, -2.236686, 0, 1, 0.254902, 1,
-0.3433018, 0.81662, 0.3393812, 0, 1, 0.2627451, 1,
-0.3407961, -1.656417, -3.127446, 0, 1, 0.2666667, 1,
-0.3354148, -0.02766776, -0.550105, 0, 1, 0.2745098, 1,
-0.335267, -0.4323545, -3.805924, 0, 1, 0.2784314, 1,
-0.3352532, -0.04283274, -2.239104, 0, 1, 0.2862745, 1,
-0.3350383, 1.187884, 0.3248134, 0, 1, 0.2901961, 1,
-0.3331194, -0.5422175, -3.958541, 0, 1, 0.2980392, 1,
-0.3329788, 0.1851577, -0.1986507, 0, 1, 0.3058824, 1,
-0.3310767, 0.3257562, -0.855738, 0, 1, 0.3098039, 1,
-0.3291932, -0.6892563, -2.117774, 0, 1, 0.3176471, 1,
-0.3276905, 0.3246607, -1.941873, 0, 1, 0.3215686, 1,
-0.3233037, -1.062373, -3.721343, 0, 1, 0.3294118, 1,
-0.3215975, 0.1956193, -1.582907, 0, 1, 0.3333333, 1,
-0.31659, -1.143435, -2.157348, 0, 1, 0.3411765, 1,
-0.3156939, -2.230374, -2.567379, 0, 1, 0.345098, 1,
-0.3143969, 0.4887454, -1.153671, 0, 1, 0.3529412, 1,
-0.3094962, 1.31644, -0.3342674, 0, 1, 0.3568628, 1,
-0.3090295, -0.8997706, -3.201807, 0, 1, 0.3647059, 1,
-0.2995723, 0.7452121, -1.308899, 0, 1, 0.3686275, 1,
-0.2984691, -0.1625721, -1.848659, 0, 1, 0.3764706, 1,
-0.2981127, -0.05294234, -1.361625, 0, 1, 0.3803922, 1,
-0.2960334, -1.898507, -4.557262, 0, 1, 0.3882353, 1,
-0.2955331, -0.02089398, -2.36656, 0, 1, 0.3921569, 1,
-0.2847675, 0.6634537, 0.5790979, 0, 1, 0.4, 1,
-0.2828264, -0.6329971, -2.455902, 0, 1, 0.4078431, 1,
-0.2737343, 0.006399985, -1.947874, 0, 1, 0.4117647, 1,
-0.2705744, -0.3439323, -0.7696798, 0, 1, 0.4196078, 1,
-0.2692769, 0.02672119, -0.8458413, 0, 1, 0.4235294, 1,
-0.2671156, -0.3615302, -1.402273, 0, 1, 0.4313726, 1,
-0.265349, -0.291911, -3.748616, 0, 1, 0.4352941, 1,
-0.2639671, 0.6758305, -1.777744, 0, 1, 0.4431373, 1,
-0.261817, 0.5440231, 1.158013, 0, 1, 0.4470588, 1,
-0.2608753, -0.06331404, -0.1562732, 0, 1, 0.454902, 1,
-0.2605794, 0.8549199, -0.7231417, 0, 1, 0.4588235, 1,
-0.2577551, -1.457334, -3.211507, 0, 1, 0.4666667, 1,
-0.2566479, -0.2602837, -1.62212, 0, 1, 0.4705882, 1,
-0.2529361, -0.5191246, -3.78463, 0, 1, 0.4784314, 1,
-0.2512504, -1.778063, -3.198587, 0, 1, 0.4823529, 1,
-0.2511765, -1.275526, -2.701582, 0, 1, 0.4901961, 1,
-0.2503488, -0.3890319, -3.462993, 0, 1, 0.4941176, 1,
-0.2495442, -0.6735325, -2.424582, 0, 1, 0.5019608, 1,
-0.2478228, 0.530849, -0.5962375, 0, 1, 0.509804, 1,
-0.2459996, 1.841836, 0.8701075, 0, 1, 0.5137255, 1,
-0.2450386, 0.480183, 0.06140466, 0, 1, 0.5215687, 1,
-0.2413061, 0.6335478, 0.7075633, 0, 1, 0.5254902, 1,
-0.2404576, -0.1103582, -0.6942167, 0, 1, 0.5333334, 1,
-0.2336404, -0.2908763, -2.050353, 0, 1, 0.5372549, 1,
-0.2299424, -0.6877779, -3.292406, 0, 1, 0.5450981, 1,
-0.2257874, 0.2211262, -1.147125, 0, 1, 0.5490196, 1,
-0.2244741, 0.5768558, -0.5552347, 0, 1, 0.5568628, 1,
-0.2226913, -0.851051, -2.178366, 0, 1, 0.5607843, 1,
-0.2217667, -0.2599141, -2.853649, 0, 1, 0.5686275, 1,
-0.22092, 0.5357756, -1.534554, 0, 1, 0.572549, 1,
-0.2199891, 1.298072, 0.6333642, 0, 1, 0.5803922, 1,
-0.2181513, -0.6665168, -2.471279, 0, 1, 0.5843138, 1,
-0.2166419, 0.7955914, -1.36208, 0, 1, 0.5921569, 1,
-0.2073063, 1.16741, -1.772082, 0, 1, 0.5960785, 1,
-0.2072663, 0.7927281, -0.8587651, 0, 1, 0.6039216, 1,
-0.2066817, 0.6558844, 1.666957, 0, 1, 0.6117647, 1,
-0.2002522, 0.7605754, -0.2615561, 0, 1, 0.6156863, 1,
-0.1982974, -0.467325, -3.854487, 0, 1, 0.6235294, 1,
-0.1979718, 2.133828, 0.6811486, 0, 1, 0.627451, 1,
-0.1958358, -0.7899803, -4.461536, 0, 1, 0.6352941, 1,
-0.193209, -0.5539147, -5.065545, 0, 1, 0.6392157, 1,
-0.1915684, -0.006247164, -1.51042, 0, 1, 0.6470588, 1,
-0.1883142, -1.749247, -3.917041, 0, 1, 0.6509804, 1,
-0.1853472, 0.8368767, -0.821377, 0, 1, 0.6588235, 1,
-0.1832682, -0.7998444, -2.82666, 0, 1, 0.6627451, 1,
-0.1794403, -0.10222, -3.381008, 0, 1, 0.6705883, 1,
-0.1710003, -0.1372885, -0.8020167, 0, 1, 0.6745098, 1,
-0.1707194, 1.461363, -0.3412256, 0, 1, 0.682353, 1,
-0.1702188, 0.7180572, -0.5173962, 0, 1, 0.6862745, 1,
-0.1678445, 0.13392, -0.7955309, 0, 1, 0.6941177, 1,
-0.1594176, 0.707536, -0.4633249, 0, 1, 0.7019608, 1,
-0.1564158, 0.9161605, -0.8637971, 0, 1, 0.7058824, 1,
-0.1485033, 1.46555, -0.07715522, 0, 1, 0.7137255, 1,
-0.1477383, -0.9266994, -2.936958, 0, 1, 0.7176471, 1,
-0.1432841, 0.3043504, -1.307114, 0, 1, 0.7254902, 1,
-0.1385436, -0.498302, -3.197666, 0, 1, 0.7294118, 1,
-0.1368731, -0.501708, -3.864587, 0, 1, 0.7372549, 1,
-0.1357366, 1.594127, -0.6043587, 0, 1, 0.7411765, 1,
-0.1350381, 0.2600259, -0.5118919, 0, 1, 0.7490196, 1,
-0.1339971, -0.6941203, -2.703066, 0, 1, 0.7529412, 1,
-0.1334845, -1.281933, -4.415483, 0, 1, 0.7607843, 1,
-0.1250681, -1.634652, -4.065946, 0, 1, 0.7647059, 1,
-0.1221842, -0.406831, -3.75992, 0, 1, 0.772549, 1,
-0.1216028, 2.707109, 0.3159217, 0, 1, 0.7764706, 1,
-0.1191041, -0.3846822, -4.396031, 0, 1, 0.7843137, 1,
-0.1172423, -0.02172416, -1.39804, 0, 1, 0.7882353, 1,
-0.1148305, 1.798508, -0.2911302, 0, 1, 0.7960784, 1,
-0.1140213, -0.4935379, -2.590865, 0, 1, 0.8039216, 1,
-0.1126064, -0.1992186, -4.407084, 0, 1, 0.8078431, 1,
-0.1109788, -0.7397922, -2.838609, 0, 1, 0.8156863, 1,
-0.1101046, -0.5615977, -4.572566, 0, 1, 0.8196079, 1,
-0.1044853, 0.8079352, 1.450514, 0, 1, 0.827451, 1,
-0.1032566, -1.339893, -2.237921, 0, 1, 0.8313726, 1,
-0.1032479, 0.8998758, 0.2450376, 0, 1, 0.8392157, 1,
-0.100723, 0.1592736, -1.341988, 0, 1, 0.8431373, 1,
-0.09643203, -0.9770854, -5.265406, 0, 1, 0.8509804, 1,
-0.09607565, -0.5007825, -2.635191, 0, 1, 0.854902, 1,
-0.0954269, -0.2109774, -2.473166, 0, 1, 0.8627451, 1,
-0.08752662, 0.9261527, 1.357615, 0, 1, 0.8666667, 1,
-0.08434442, 0.9891341, 0.2096364, 0, 1, 0.8745098, 1,
-0.08040518, 0.9795078, -0.6006852, 0, 1, 0.8784314, 1,
-0.0783149, -0.5185708, -2.392347, 0, 1, 0.8862745, 1,
-0.07811975, -0.1179358, -2.869918, 0, 1, 0.8901961, 1,
-0.07450333, 0.7219121, 0.7621685, 0, 1, 0.8980392, 1,
-0.07298285, 0.3639439, -1.37889, 0, 1, 0.9058824, 1,
-0.07177749, -1.02102, -3.676639, 0, 1, 0.9098039, 1,
-0.06547731, -1.056348, -3.69853, 0, 1, 0.9176471, 1,
-0.06476804, 1.428934, -0.5007111, 0, 1, 0.9215686, 1,
-0.06220431, 0.1477427, -1.883539, 0, 1, 0.9294118, 1,
-0.05745789, 1.401845, -0.09535865, 0, 1, 0.9333333, 1,
-0.05596916, -1.230845, -2.478795, 0, 1, 0.9411765, 1,
-0.05413458, -0.9703863, -2.327185, 0, 1, 0.945098, 1,
-0.05333509, 0.6648193, -0.6521015, 0, 1, 0.9529412, 1,
-0.05251924, 0.7792269, 0.9516132, 0, 1, 0.9568627, 1,
-0.04908792, 0.1922468, 0.7910395, 0, 1, 0.9647059, 1,
-0.04564729, 1.267304, -0.1951978, 0, 1, 0.9686275, 1,
-0.04477501, 0.6987642, 1.662761, 0, 1, 0.9764706, 1,
-0.03694077, -0.6058539, -2.304414, 0, 1, 0.9803922, 1,
-0.03650253, -0.2304718, -3.285983, 0, 1, 0.9882353, 1,
-0.03178576, -2.881016, -3.151843, 0, 1, 0.9921569, 1,
-0.03167497, -0.1663547, -4.689996, 0, 1, 1, 1,
-0.03063576, 1.633549, 0.05655252, 0, 0.9921569, 1, 1,
-0.02997313, -0.4194779, -2.333287, 0, 0.9882353, 1, 1,
-0.02985683, 2.257044, -0.8227966, 0, 0.9803922, 1, 1,
-0.02959991, -1.60417, -5.38833, 0, 0.9764706, 1, 1,
-0.02757259, 0.8591285, 0.5950012, 0, 0.9686275, 1, 1,
-0.02712049, -0.2513631, -3.033375, 0, 0.9647059, 1, 1,
-0.02670427, 0.02435621, -0.4579647, 0, 0.9568627, 1, 1,
-0.02188863, -0.3136626, -2.409928, 0, 0.9529412, 1, 1,
-0.02150491, 0.2311904, -0.2913324, 0, 0.945098, 1, 1,
-0.02129801, 0.8518344, -1.092544, 0, 0.9411765, 1, 1,
-0.02099845, 0.3460118, 1.804306, 0, 0.9333333, 1, 1,
-0.01586607, 0.4781507, 0.6455532, 0, 0.9294118, 1, 1,
-0.001451784, 0.9358373, -1.606772, 0, 0.9215686, 1, 1,
-0.00111399, 0.3374111, 0.4448806, 0, 0.9176471, 1, 1,
0.002076514, 0.5427742, 1.139442, 0, 0.9098039, 1, 1,
0.004888307, 0.5956435, 0.6438694, 0, 0.9058824, 1, 1,
0.007994892, 0.07013112, -0.9315573, 0, 0.8980392, 1, 1,
0.01309643, 1.731173, 0.6106067, 0, 0.8901961, 1, 1,
0.0161723, -1.393669, 2.677058, 0, 0.8862745, 1, 1,
0.01771481, 1.715705, 0.5072563, 0, 0.8784314, 1, 1,
0.01819138, 0.372054, -1.148782, 0, 0.8745098, 1, 1,
0.01957225, 1.723678, 1.385669, 0, 0.8666667, 1, 1,
0.02650852, 0.8204778, 1.097065, 0, 0.8627451, 1, 1,
0.02721358, 0.2566792, 0.254652, 0, 0.854902, 1, 1,
0.02912895, -0.1901782, 3.703, 0, 0.8509804, 1, 1,
0.03228058, -1.17473, 2.096371, 0, 0.8431373, 1, 1,
0.03337612, 0.04109761, 0.4692892, 0, 0.8392157, 1, 1,
0.034805, -0.8776121, 2.068536, 0, 0.8313726, 1, 1,
0.03500536, -0.2281541, 2.5761, 0, 0.827451, 1, 1,
0.03708053, 1.464658, 1.641927, 0, 0.8196079, 1, 1,
0.03771427, -1.291449, 2.709636, 0, 0.8156863, 1, 1,
0.03820538, 0.8556722, -0.4749664, 0, 0.8078431, 1, 1,
0.03857697, 0.581176, -0.8630383, 0, 0.8039216, 1, 1,
0.04034381, -0.07589223, 1.862744, 0, 0.7960784, 1, 1,
0.0466981, 1.424935, -0.08904795, 0, 0.7882353, 1, 1,
0.04679725, 0.7126743, -1.152901, 0, 0.7843137, 1, 1,
0.04935129, 2.16478, 0.4768942, 0, 0.7764706, 1, 1,
0.05024069, -1.200147, 4.771552, 0, 0.772549, 1, 1,
0.05187687, 0.353311, -0.5904675, 0, 0.7647059, 1, 1,
0.05955663, -0.7864766, 3.38315, 0, 0.7607843, 1, 1,
0.06116764, -1.676323, 1.323211, 0, 0.7529412, 1, 1,
0.06378181, -1.163237, 4.034733, 0, 0.7490196, 1, 1,
0.06569266, 0.5300136, -1.245671, 0, 0.7411765, 1, 1,
0.06677309, -0.892189, 2.596809, 0, 0.7372549, 1, 1,
0.06687806, 0.4805788, 0.4181574, 0, 0.7294118, 1, 1,
0.06698208, -0.4160164, 3.717116, 0, 0.7254902, 1, 1,
0.06847207, 1.079101, 0.3180586, 0, 0.7176471, 1, 1,
0.06916346, 1.26703, 0.5559797, 0, 0.7137255, 1, 1,
0.07624738, 1.847305, -0.9144467, 0, 0.7058824, 1, 1,
0.08280571, 0.9278377, 0.2818609, 0, 0.6980392, 1, 1,
0.08539412, 0.451851, -0.4624204, 0, 0.6941177, 1, 1,
0.08647919, 0.2896277, 0.4414988, 0, 0.6862745, 1, 1,
0.09599249, -0.4646206, 3.305988, 0, 0.682353, 1, 1,
0.09721363, -0.3077038, 1.774451, 0, 0.6745098, 1, 1,
0.09783335, 0.2257436, -0.08880008, 0, 0.6705883, 1, 1,
0.09794306, 1.887567, -1.205577, 0, 0.6627451, 1, 1,
0.09880655, -0.2972899, 3.276092, 0, 0.6588235, 1, 1,
0.1012596, -0.8086722, 3.960864, 0, 0.6509804, 1, 1,
0.10413, -1.070432, 2.322181, 0, 0.6470588, 1, 1,
0.1041685, 0.8306082, -0.275036, 0, 0.6392157, 1, 1,
0.1094633, -0.4208673, 0.8996255, 0, 0.6352941, 1, 1,
0.1168251, -0.4511602, 2.289748, 0, 0.627451, 1, 1,
0.1187681, -1.149612, 2.344736, 0, 0.6235294, 1, 1,
0.1201906, 0.1190459, 1.997342, 0, 0.6156863, 1, 1,
0.125881, -0.8540666, 3.138441, 0, 0.6117647, 1, 1,
0.1267789, -1.101019, 3.246826, 0, 0.6039216, 1, 1,
0.1275964, -0.6879524, 3.006532, 0, 0.5960785, 1, 1,
0.1291071, 1.405806, 1.072244, 0, 0.5921569, 1, 1,
0.1291851, 0.2210359, 1.14159, 0, 0.5843138, 1, 1,
0.1329508, -0.4787555, 3.777151, 0, 0.5803922, 1, 1,
0.1337447, -0.508188, 3.320075, 0, 0.572549, 1, 1,
0.1357181, 1.548568, 0.1581794, 0, 0.5686275, 1, 1,
0.1418162, -0.135918, 2.796715, 0, 0.5607843, 1, 1,
0.1422185, -0.5566767, 3.414687, 0, 0.5568628, 1, 1,
0.1422528, -1.353138, 4.520696, 0, 0.5490196, 1, 1,
0.1464053, 1.370284, 0.716068, 0, 0.5450981, 1, 1,
0.1491328, 1.08356, -1.258201, 0, 0.5372549, 1, 1,
0.1515771, 0.838241, -1.003222, 0, 0.5333334, 1, 1,
0.1557078, -0.2744824, 1.774426, 0, 0.5254902, 1, 1,
0.157634, -0.8560129, 2.668653, 0, 0.5215687, 1, 1,
0.157745, -0.9252712, 1.774601, 0, 0.5137255, 1, 1,
0.1582824, 0.1516089, 0.4261864, 0, 0.509804, 1, 1,
0.1619133, 0.2434937, 0.2417952, 0, 0.5019608, 1, 1,
0.1654776, 0.1305582, 1.598656, 0, 0.4941176, 1, 1,
0.1663338, -1.46658, 2.838263, 0, 0.4901961, 1, 1,
0.1689867, 0.4617441, 0.1650401, 0, 0.4823529, 1, 1,
0.1692938, 0.2637219, 0.06627645, 0, 0.4784314, 1, 1,
0.1705616, -0.3729666, 1.70699, 0, 0.4705882, 1, 1,
0.1735366, 0.2361989, -0.3242304, 0, 0.4666667, 1, 1,
0.1758035, -1.143101, 4.296334, 0, 0.4588235, 1, 1,
0.1759564, 1.837425, 0.3957725, 0, 0.454902, 1, 1,
0.1794643, -1.157236, 2.941693, 0, 0.4470588, 1, 1,
0.1831466, -0.2349991, 0.6803501, 0, 0.4431373, 1, 1,
0.1850076, 0.4652958, -0.2317812, 0, 0.4352941, 1, 1,
0.1871308, -0.2071853, 3.319964, 0, 0.4313726, 1, 1,
0.1912049, -0.8473769, 2.974617, 0, 0.4235294, 1, 1,
0.1961813, 1.024497, 0.2183581, 0, 0.4196078, 1, 1,
0.1992053, 0.2416642, 1.792809, 0, 0.4117647, 1, 1,
0.2036297, -0.9925213, 3.686691, 0, 0.4078431, 1, 1,
0.2064782, -0.8923287, 0.5709271, 0, 0.4, 1, 1,
0.2142918, 0.2508895, 0.3072229, 0, 0.3921569, 1, 1,
0.2146041, 0.8218028, 1.008488, 0, 0.3882353, 1, 1,
0.2161082, -0.01228074, 0.8781726, 0, 0.3803922, 1, 1,
0.2217464, 0.04532387, 1.498489, 0, 0.3764706, 1, 1,
0.2220399, 0.5532071, -2.141509, 0, 0.3686275, 1, 1,
0.2239772, 1.140683, 0.2730161, 0, 0.3647059, 1, 1,
0.2272111, 1.044156, -0.7685858, 0, 0.3568628, 1, 1,
0.2279229, -0.01847399, 2.02235, 0, 0.3529412, 1, 1,
0.228161, 0.6727759, 0.5509518, 0, 0.345098, 1, 1,
0.234355, -2.329885, 3.585324, 0, 0.3411765, 1, 1,
0.2366978, -0.1603065, 2.019068, 0, 0.3333333, 1, 1,
0.2406022, -0.3825925, 3.142985, 0, 0.3294118, 1, 1,
0.2451445, -1.649161, 2.564671, 0, 0.3215686, 1, 1,
0.2489239, 0.408814, -0.04767682, 0, 0.3176471, 1, 1,
0.2492676, -0.178087, 1.484138, 0, 0.3098039, 1, 1,
0.2497459, -1.763472, 1.812404, 0, 0.3058824, 1, 1,
0.2557783, 2.195119, -0.9501282, 0, 0.2980392, 1, 1,
0.2563155, -0.08834718, 2.034816, 0, 0.2901961, 1, 1,
0.2674477, -0.5897297, 2.219913, 0, 0.2862745, 1, 1,
0.2698583, 1.25087, 2.196056, 0, 0.2784314, 1, 1,
0.2702034, -0.9155606, 3.618453, 0, 0.2745098, 1, 1,
0.2716123, 1.067572, -0.8388883, 0, 0.2666667, 1, 1,
0.2747211, -2.180609, 3.727439, 0, 0.2627451, 1, 1,
0.2755379, -1.081093, 3.028975, 0, 0.254902, 1, 1,
0.2887221, 0.3531392, 1.07315, 0, 0.2509804, 1, 1,
0.2892185, 1.686909, 0.05427607, 0, 0.2431373, 1, 1,
0.2935061, 1.081803, -0.4441145, 0, 0.2392157, 1, 1,
0.2937852, -0.8701678, 3.359925, 0, 0.2313726, 1, 1,
0.2942659, 1.656709, -0.04181919, 0, 0.227451, 1, 1,
0.2942819, -0.2582335, 2.129015, 0, 0.2196078, 1, 1,
0.2997338, -1.303064, 5.142018, 0, 0.2156863, 1, 1,
0.302404, -1.851318, 2.363141, 0, 0.2078431, 1, 1,
0.3030742, 0.3073757, -0.09474067, 0, 0.2039216, 1, 1,
0.3069569, 0.2594019, 0.7529793, 0, 0.1960784, 1, 1,
0.3134881, -1.642073, 4.139668, 0, 0.1882353, 1, 1,
0.3151479, 0.1488988, 0.8368646, 0, 0.1843137, 1, 1,
0.3207462, 0.2486565, -0.5765226, 0, 0.1764706, 1, 1,
0.3221755, 1.751464, 2.189941, 0, 0.172549, 1, 1,
0.322647, 0.3638076, 1.618303, 0, 0.1647059, 1, 1,
0.3243804, 1.388399, 0.3391935, 0, 0.1607843, 1, 1,
0.3244118, 1.390371, 1.034132, 0, 0.1529412, 1, 1,
0.3264607, 0.8866264, 2.01512, 0, 0.1490196, 1, 1,
0.3301149, 0.6162276, 1.168436, 0, 0.1411765, 1, 1,
0.3313087, 0.5046652, -0.8209165, 0, 0.1372549, 1, 1,
0.3327463, -0.7835972, 3.900449, 0, 0.1294118, 1, 1,
0.3355226, -0.2174885, 3.458903, 0, 0.1254902, 1, 1,
0.3356941, 0.2274186, -0.06078347, 0, 0.1176471, 1, 1,
0.3361626, -0.3643183, 0.8769409, 0, 0.1137255, 1, 1,
0.3383709, 1.161718, 0.3042305, 0, 0.1058824, 1, 1,
0.3471758, 0.9245327, -0.175053, 0, 0.09803922, 1, 1,
0.3608155, -0.470119, 2.226954, 0, 0.09411765, 1, 1,
0.3701704, 0.691398, 0.2067652, 0, 0.08627451, 1, 1,
0.371233, -1.695411, 6.162142, 0, 0.08235294, 1, 1,
0.3723676, 0.7977316, -1.162986, 0, 0.07450981, 1, 1,
0.3803155, -0.1371236, 2.088732, 0, 0.07058824, 1, 1,
0.3878886, -1.271595, 4.007962, 0, 0.0627451, 1, 1,
0.3880405, -1.046124, 3.271683, 0, 0.05882353, 1, 1,
0.3889292, -1.31416, 1.450049, 0, 0.05098039, 1, 1,
0.3908712, 0.5076607, 0.4055705, 0, 0.04705882, 1, 1,
0.3916729, -0.1796959, 3.134547, 0, 0.03921569, 1, 1,
0.3963947, 0.4693349, 0.6488537, 0, 0.03529412, 1, 1,
0.4001073, 1.075328, -0.9146132, 0, 0.02745098, 1, 1,
0.4049136, -1.588368, 2.964343, 0, 0.02352941, 1, 1,
0.407164, -1.08648, 4.005391, 0, 0.01568628, 1, 1,
0.4162456, -1.536015, 1.912988, 0, 0.01176471, 1, 1,
0.4208898, -1.510968, 3.306876, 0, 0.003921569, 1, 1,
0.4218196, -0.3167616, 0.169326, 0.003921569, 0, 1, 1,
0.4235314, 1.797635, 1.518969, 0.007843138, 0, 1, 1,
0.4251337, -0.7009371, 3.665729, 0.01568628, 0, 1, 1,
0.4262621, 0.01972013, 0.7721031, 0.01960784, 0, 1, 1,
0.4304871, 2.401787, 0.5921177, 0.02745098, 0, 1, 1,
0.4325584, -1.128088, 2.662704, 0.03137255, 0, 1, 1,
0.4330357, 1.341391, -1.005896, 0.03921569, 0, 1, 1,
0.4355058, -0.7369344, 2.640315, 0.04313726, 0, 1, 1,
0.4360959, -1.569552, 3.264409, 0.05098039, 0, 1, 1,
0.438411, 0.7291772, 0.2984219, 0.05490196, 0, 1, 1,
0.4398588, -0.2075162, 1.005561, 0.0627451, 0, 1, 1,
0.4420733, 1.003387, 0.7039182, 0.06666667, 0, 1, 1,
0.4421622, -0.6745906, 3.369259, 0.07450981, 0, 1, 1,
0.4466737, 1.187545, 0.6570076, 0.07843138, 0, 1, 1,
0.4519557, -0.4756819, 3.668164, 0.08627451, 0, 1, 1,
0.4527892, 1.732327, 1.633658, 0.09019608, 0, 1, 1,
0.4549347, -0.0964784, 2.844497, 0.09803922, 0, 1, 1,
0.4603162, -0.30186, 2.727627, 0.1058824, 0, 1, 1,
0.4651853, -0.6419649, 3.174503, 0.1098039, 0, 1, 1,
0.4733892, -0.5004508, 3.872955, 0.1176471, 0, 1, 1,
0.4767412, 0.2776925, 1.883321, 0.1215686, 0, 1, 1,
0.4901671, 1.925403, 0.1383142, 0.1294118, 0, 1, 1,
0.4904954, 1.009328, 1.030391, 0.1333333, 0, 1, 1,
0.4915356, 1.895307, -1.068492, 0.1411765, 0, 1, 1,
0.4935772, 0.4295915, 0.5211453, 0.145098, 0, 1, 1,
0.5023615, -0.1583699, 1.402306, 0.1529412, 0, 1, 1,
0.5026674, -1.0061, 3.189742, 0.1568628, 0, 1, 1,
0.5108075, -0.2000995, 4.075468, 0.1647059, 0, 1, 1,
0.5141906, -1.018325, 3.731223, 0.1686275, 0, 1, 1,
0.5148532, -0.6301754, 2.585815, 0.1764706, 0, 1, 1,
0.515665, 0.6515527, 0.9286579, 0.1803922, 0, 1, 1,
0.5184674, 0.597822, 0.4602795, 0.1882353, 0, 1, 1,
0.5217022, -0.350293, 1.982244, 0.1921569, 0, 1, 1,
0.5337479, 1.113971, 0.1156696, 0.2, 0, 1, 1,
0.5362696, -0.4442132, 1.96075, 0.2078431, 0, 1, 1,
0.5376379, -0.8475153, 2.828194, 0.2117647, 0, 1, 1,
0.5405189, 0.2882681, 0.08766667, 0.2196078, 0, 1, 1,
0.5524774, -1.01754, 4.341081, 0.2235294, 0, 1, 1,
0.5576287, -1.28122, 1.920606, 0.2313726, 0, 1, 1,
0.5596229, 0.1141123, 0.6751572, 0.2352941, 0, 1, 1,
0.5601337, 2.363957, -0.1971133, 0.2431373, 0, 1, 1,
0.5638172, -0.6015934, 2.377558, 0.2470588, 0, 1, 1,
0.5648651, -1.078465, 1.997886, 0.254902, 0, 1, 1,
0.5661926, 0.7921581, -1.001976, 0.2588235, 0, 1, 1,
0.5664981, 0.6260108, 0.467173, 0.2666667, 0, 1, 1,
0.5785903, -0.01471456, 2.112147, 0.2705882, 0, 1, 1,
0.5822132, -0.6382772, 0.3494594, 0.2784314, 0, 1, 1,
0.5837823, -1.651112, 1.222943, 0.282353, 0, 1, 1,
0.5856439, -1.268694, 3.992502, 0.2901961, 0, 1, 1,
0.5873767, -0.09737109, 4.419107, 0.2941177, 0, 1, 1,
0.5917419, -0.74712, 4.489794, 0.3019608, 0, 1, 1,
0.59715, 0.7302005, 0.05970122, 0.3098039, 0, 1, 1,
0.5995483, 0.9008139, 1.414087, 0.3137255, 0, 1, 1,
0.6003144, -0.6790609, 1.968277, 0.3215686, 0, 1, 1,
0.6004276, -1.645848, 3.047999, 0.3254902, 0, 1, 1,
0.6105329, -0.0241748, 2.417114, 0.3333333, 0, 1, 1,
0.6108453, 1.465517, 1.192651, 0.3372549, 0, 1, 1,
0.6147436, 1.19141, -0.6822674, 0.345098, 0, 1, 1,
0.6157457, 1.3575, 0.957376, 0.3490196, 0, 1, 1,
0.6178129, 0.640797, 0.4474503, 0.3568628, 0, 1, 1,
0.6187252, -1.539985, 3.180284, 0.3607843, 0, 1, 1,
0.6233107, -0.3650579, 2.50352, 0.3686275, 0, 1, 1,
0.6255033, 0.3887601, 2.252037, 0.372549, 0, 1, 1,
0.6258732, -2.032955, 2.32177, 0.3803922, 0, 1, 1,
0.6275192, 0.8641542, 0.3493917, 0.3843137, 0, 1, 1,
0.6279778, 0.1903493, 1.465296, 0.3921569, 0, 1, 1,
0.6282611, 1.557641, 0.259906, 0.3960784, 0, 1, 1,
0.6293215, 0.9203952, 2.178284, 0.4039216, 0, 1, 1,
0.6337478, 0.4971392, 0.7078524, 0.4117647, 0, 1, 1,
0.6378347, -1.969627, 2.058532, 0.4156863, 0, 1, 1,
0.6393648, -0.4474574, 4.443968, 0.4235294, 0, 1, 1,
0.6395435, -1.592602, 2.121238, 0.427451, 0, 1, 1,
0.6418279, 0.8415809, -0.4607807, 0.4352941, 0, 1, 1,
0.6421241, 0.8407831, -1.24382, 0.4392157, 0, 1, 1,
0.6428542, 0.4528124, -0.2973709, 0.4470588, 0, 1, 1,
0.6431254, -0.2542963, 2.46632, 0.4509804, 0, 1, 1,
0.6433018, 0.004935207, 2.62076, 0.4588235, 0, 1, 1,
0.648182, -1.171589, 3.735863, 0.4627451, 0, 1, 1,
0.6496744, -0.1281684, -0.00985063, 0.4705882, 0, 1, 1,
0.6554404, -3.558695, 3.22826, 0.4745098, 0, 1, 1,
0.6620301, 0.964291, -0.7921209, 0.4823529, 0, 1, 1,
0.6629621, -0.6039257, 1.882521, 0.4862745, 0, 1, 1,
0.6641055, 0.3086172, 1.647148, 0.4941176, 0, 1, 1,
0.6665161, 1.157381, 0.1591843, 0.5019608, 0, 1, 1,
0.666986, 0.6628287, 0.698381, 0.5058824, 0, 1, 1,
0.6698902, -1.487909, 1.796157, 0.5137255, 0, 1, 1,
0.6733603, -1.353733, 1.943637, 0.5176471, 0, 1, 1,
0.6737392, -0.6330449, 1.645334, 0.5254902, 0, 1, 1,
0.6751345, 0.9142071, 0.9426147, 0.5294118, 0, 1, 1,
0.6819267, 1.109043, 1.153162, 0.5372549, 0, 1, 1,
0.6830187, 1.353803, 0.4854444, 0.5411765, 0, 1, 1,
0.6832192, -0.6704344, 1.541136, 0.5490196, 0, 1, 1,
0.6888177, -1.718284, 3.008256, 0.5529412, 0, 1, 1,
0.6916343, 0.4069291, 1.033428, 0.5607843, 0, 1, 1,
0.6921744, -0.7737082, 0.9630417, 0.5647059, 0, 1, 1,
0.6994976, 1.229062, 0.1838025, 0.572549, 0, 1, 1,
0.7000683, 1.639588, 0.4975913, 0.5764706, 0, 1, 1,
0.7011636, 0.7494497, 0.9837404, 0.5843138, 0, 1, 1,
0.7019654, 2.049195, -0.3518715, 0.5882353, 0, 1, 1,
0.7048079, -1.082061, 2.551495, 0.5960785, 0, 1, 1,
0.7067608, 1.811467, 0.6551318, 0.6039216, 0, 1, 1,
0.7137777, 0.8844807, -0.3719804, 0.6078432, 0, 1, 1,
0.7151235, 1.238602, 0.201423, 0.6156863, 0, 1, 1,
0.7155489, -1.753667, 3.002836, 0.6196079, 0, 1, 1,
0.7168496, 0.01319016, 2.606471, 0.627451, 0, 1, 1,
0.7231867, -0.7243025, 3.038805, 0.6313726, 0, 1, 1,
0.72561, -0.5555042, 2.283372, 0.6392157, 0, 1, 1,
0.7325881, 0.619046, 0.5491813, 0.6431373, 0, 1, 1,
0.7380731, -0.8612816, 2.586158, 0.6509804, 0, 1, 1,
0.742237, 1.359653, 0.05367292, 0.654902, 0, 1, 1,
0.7465682, 1.084998, -0.3969543, 0.6627451, 0, 1, 1,
0.7487892, 1.781079, 0.1705648, 0.6666667, 0, 1, 1,
0.7488843, 0.167183, 1.269216, 0.6745098, 0, 1, 1,
0.7543028, 0.8846386, 0.6090743, 0.6784314, 0, 1, 1,
0.7577463, 1.031615, 2.382879, 0.6862745, 0, 1, 1,
0.7587858, 1.314032, -0.5328687, 0.6901961, 0, 1, 1,
0.7609538, 0.2258893, 2.366295, 0.6980392, 0, 1, 1,
0.7657141, 0.09375845, -0.09366932, 0.7058824, 0, 1, 1,
0.7671367, 1.030138, 2.52771, 0.7098039, 0, 1, 1,
0.7676728, 1.444535, 2.61011, 0.7176471, 0, 1, 1,
0.7717906, -1.686626, 1.891302, 0.7215686, 0, 1, 1,
0.7729244, 0.1461665, 2.1148, 0.7294118, 0, 1, 1,
0.7746457, 0.1689783, 1.956289, 0.7333333, 0, 1, 1,
0.7750294, 0.7924659, 3.165249, 0.7411765, 0, 1, 1,
0.777631, -0.3944837, 1.896751, 0.7450981, 0, 1, 1,
0.7786791, 0.8442434, 1.934512, 0.7529412, 0, 1, 1,
0.7815353, -0.3571146, 2.50852, 0.7568628, 0, 1, 1,
0.781829, -0.3413329, 1.013107, 0.7647059, 0, 1, 1,
0.7882398, -1.18303, 0.7163758, 0.7686275, 0, 1, 1,
0.7883963, 0.5146385, 0.840124, 0.7764706, 0, 1, 1,
0.7924687, 0.828279, 1.93586, 0.7803922, 0, 1, 1,
0.7949746, 1.048948, 1.61461, 0.7882353, 0, 1, 1,
0.7974667, 0.6964621, 0.2547091, 0.7921569, 0, 1, 1,
0.8051168, 0.6374829, 0.9777481, 0.8, 0, 1, 1,
0.8055389, 0.4383065, 0.4079926, 0.8078431, 0, 1, 1,
0.8060127, -0.9464809, 2.714715, 0.8117647, 0, 1, 1,
0.8073381, -0.5799747, 2.540954, 0.8196079, 0, 1, 1,
0.8082073, -0.8339902, 0.7634454, 0.8235294, 0, 1, 1,
0.8093455, -0.7587991, 0.8280123, 0.8313726, 0, 1, 1,
0.8095887, 0.5528134, 2.142416, 0.8352941, 0, 1, 1,
0.8105558, -0.7792932, 1.421808, 0.8431373, 0, 1, 1,
0.8119822, -0.4542513, 2.182549, 0.8470588, 0, 1, 1,
0.8197414, -0.4495277, 3.898895, 0.854902, 0, 1, 1,
0.8211573, 1.404032, 1.340212, 0.8588235, 0, 1, 1,
0.8245148, -1.49227, 2.25529, 0.8666667, 0, 1, 1,
0.8465532, -0.4742392, 3.614122, 0.8705882, 0, 1, 1,
0.8533331, 0.9400814, -0.7679209, 0.8784314, 0, 1, 1,
0.8616417, -1.852299, 1.287677, 0.8823529, 0, 1, 1,
0.8694459, -0.3217279, 2.487113, 0.8901961, 0, 1, 1,
0.8886663, -0.9542965, 1.266034, 0.8941177, 0, 1, 1,
0.8896472, -1.659878, 2.284732, 0.9019608, 0, 1, 1,
0.8909836, 0.9592957, 0.05617174, 0.9098039, 0, 1, 1,
0.8950925, -0.07584113, 0.8062947, 0.9137255, 0, 1, 1,
0.9027793, 1.343398, 0.9270696, 0.9215686, 0, 1, 1,
0.9055564, 1.128592, 1.333177, 0.9254902, 0, 1, 1,
0.915863, 1.270629, 0.6232376, 0.9333333, 0, 1, 1,
0.9234006, 1.426491, 0.2878315, 0.9372549, 0, 1, 1,
0.9290956, -0.9335353, 3.073395, 0.945098, 0, 1, 1,
0.932662, -0.6474691, 1.748003, 0.9490196, 0, 1, 1,
0.9403291, 1.342288, -0.2159292, 0.9568627, 0, 1, 1,
0.9442071, -1.098427, 1.886679, 0.9607843, 0, 1, 1,
0.9480323, -0.3237512, 2.201023, 0.9686275, 0, 1, 1,
0.9485285, 0.1163694, 2.382194, 0.972549, 0, 1, 1,
0.9486667, -0.9817237, 1.632723, 0.9803922, 0, 1, 1,
0.9490659, -0.9313169, 3.655559, 0.9843137, 0, 1, 1,
0.951863, -0.7086959, 2.500526, 0.9921569, 0, 1, 1,
0.9519082, -1.784135, 1.054245, 0.9960784, 0, 1, 1,
0.9566664, 0.9743369, 1.586038, 1, 0, 0.9960784, 1,
0.9635776, 0.2291859, -0.3285028, 1, 0, 0.9882353, 1,
0.9649976, -1.112525, 1.372004, 1, 0, 0.9843137, 1,
0.9779206, 0.3710862, 2.233248, 1, 0, 0.9764706, 1,
0.9803821, -0.2981036, 2.452735, 1, 0, 0.972549, 1,
0.9815509, -0.7910234, 0.9872752, 1, 0, 0.9647059, 1,
0.990743, 0.4041409, 0.9447731, 1, 0, 0.9607843, 1,
0.9962597, 0.04978057, 1.396302, 1, 0, 0.9529412, 1,
1.002668, -0.6587396, 2.601235, 1, 0, 0.9490196, 1,
1.014913, 0.1120895, 2.203373, 1, 0, 0.9411765, 1,
1.015282, -0.911617, 1.252076, 1, 0, 0.9372549, 1,
1.019359, 0.646552, 0.6727375, 1, 0, 0.9294118, 1,
1.025445, 0.1719895, 3.320783, 1, 0, 0.9254902, 1,
1.030279, -0.4559217, -0.33037, 1, 0, 0.9176471, 1,
1.034169, 1.209681, 2.28563, 1, 0, 0.9137255, 1,
1.034631, -0.5219509, 2.051713, 1, 0, 0.9058824, 1,
1.03471, 0.6390004, 1.169514, 1, 0, 0.9019608, 1,
1.037156, 0.003697583, 2.130309, 1, 0, 0.8941177, 1,
1.0405, -0.08656224, 2.501219, 1, 0, 0.8862745, 1,
1.042192, 1.910824, 1.516498, 1, 0, 0.8823529, 1,
1.04658, -0.2774302, 2.291521, 1, 0, 0.8745098, 1,
1.052741, -0.1778472, 1.02851, 1, 0, 0.8705882, 1,
1.065132, -0.5197291, 1.157716, 1, 0, 0.8627451, 1,
1.067111, 0.2076773, 2.624785, 1, 0, 0.8588235, 1,
1.074207, 0.8303671, 2.455709, 1, 0, 0.8509804, 1,
1.07515, 0.1434293, 2.872961, 1, 0, 0.8470588, 1,
1.079894, 0.9574591, -0.4275442, 1, 0, 0.8392157, 1,
1.089841, -0.1418902, -0.2716787, 1, 0, 0.8352941, 1,
1.090396, 0.2001635, 0.6514615, 1, 0, 0.827451, 1,
1.09152, -0.5141212, 1.504227, 1, 0, 0.8235294, 1,
1.093198, -0.1064536, 2.655897, 1, 0, 0.8156863, 1,
1.093659, -1.855979, 1.777851, 1, 0, 0.8117647, 1,
1.097607, -1.367337, 1.657509, 1, 0, 0.8039216, 1,
1.10246, 0.5072145, 0.9167231, 1, 0, 0.7960784, 1,
1.103424, 0.5546278, 3.016997, 1, 0, 0.7921569, 1,
1.103805, 0.4127668, 0.3770849, 1, 0, 0.7843137, 1,
1.106223, -0.6900812, 0.4735662, 1, 0, 0.7803922, 1,
1.10747, -0.0621438, 1.725412, 1, 0, 0.772549, 1,
1.108494, 0.368564, 1.405246, 1, 0, 0.7686275, 1,
1.114419, 0.6018553, 1.66183, 1, 0, 0.7607843, 1,
1.121548, -0.05815853, 1.06334, 1, 0, 0.7568628, 1,
1.125326, 0.1858014, 0.5903921, 1, 0, 0.7490196, 1,
1.132472, -1.434373, 4.224728, 1, 0, 0.7450981, 1,
1.132905, -1.039278, 2.30979, 1, 0, 0.7372549, 1,
1.136059, -0.9272292, 2.965708, 1, 0, 0.7333333, 1,
1.138771, 1.61527, 0.2567161, 1, 0, 0.7254902, 1,
1.141603, 0.4267298, 0.820471, 1, 0, 0.7215686, 1,
1.154535, 1.763339, 1.276264, 1, 0, 0.7137255, 1,
1.156068, 0.931873, 2.327677, 1, 0, 0.7098039, 1,
1.160192, 0.3878444, 2.420411, 1, 0, 0.7019608, 1,
1.161612, -0.7819973, 4.37312, 1, 0, 0.6941177, 1,
1.167092, -0.1964478, 1.564158, 1, 0, 0.6901961, 1,
1.167246, 0.03308279, -0.2973751, 1, 0, 0.682353, 1,
1.172987, -0.7573363, 3.245728, 1, 0, 0.6784314, 1,
1.173575, -0.7853941, 3.769552, 1, 0, 0.6705883, 1,
1.180028, 1.539812, 1.063263, 1, 0, 0.6666667, 1,
1.186583, -0.2172254, 0.9965734, 1, 0, 0.6588235, 1,
1.214593, 1.897518, 1.043124, 1, 0, 0.654902, 1,
1.235887, -1.024615, 2.772594, 1, 0, 0.6470588, 1,
1.245204, -0.1661748, 1.843233, 1, 0, 0.6431373, 1,
1.246103, -0.7320592, 1.792318, 1, 0, 0.6352941, 1,
1.25162, 0.6542001, -0.8271685, 1, 0, 0.6313726, 1,
1.25778, 1.068541, 1.966513, 1, 0, 0.6235294, 1,
1.26483, 0.6133251, 1.001261, 1, 0, 0.6196079, 1,
1.265171, 0.3559505, 0.4377354, 1, 0, 0.6117647, 1,
1.269387, 1.868279, -2.293303, 1, 0, 0.6078432, 1,
1.272968, 2.038714, -1.598243, 1, 0, 0.6, 1,
1.27878, 0.1173642, 0.9584084, 1, 0, 0.5921569, 1,
1.302591, 1.650701, 2.701448, 1, 0, 0.5882353, 1,
1.308493, 0.05842905, 2.015581, 1, 0, 0.5803922, 1,
1.323024, 2.066983, 0.8798605, 1, 0, 0.5764706, 1,
1.327074, -0.2050347, 2.392891, 1, 0, 0.5686275, 1,
1.32839, 0.5346676, 1.179327, 1, 0, 0.5647059, 1,
1.347168, 1.392415, 2.664831, 1, 0, 0.5568628, 1,
1.350019, 1.572642, -0.09903534, 1, 0, 0.5529412, 1,
1.352786, -0.112875, 0.3711718, 1, 0, 0.5450981, 1,
1.359102, -0.5870901, 2.648815, 1, 0, 0.5411765, 1,
1.370458, 1.307067, 0.6103936, 1, 0, 0.5333334, 1,
1.373115, 0.6325144, -0.2004376, 1, 0, 0.5294118, 1,
1.40117, -0.8035036, 2.185628, 1, 0, 0.5215687, 1,
1.416373, -1.376621, 2.534054, 1, 0, 0.5176471, 1,
1.41881, 0.4550206, 0.08701933, 1, 0, 0.509804, 1,
1.424223, -0.4448785, 3.28219, 1, 0, 0.5058824, 1,
1.424768, -0.4064831, 1.73712, 1, 0, 0.4980392, 1,
1.425674, 0.8932821, 0.2853234, 1, 0, 0.4901961, 1,
1.427936, -0.05069664, 0.8430542, 1, 0, 0.4862745, 1,
1.434088, 0.1388494, 1.324711, 1, 0, 0.4784314, 1,
1.444293, 0.1344165, 1.208932, 1, 0, 0.4745098, 1,
1.445818, 0.1259395, 0.4124171, 1, 0, 0.4666667, 1,
1.447939, 0.8584492, 0.9081919, 1, 0, 0.4627451, 1,
1.456061, 0.7645774, -0.2178047, 1, 0, 0.454902, 1,
1.461682, 1.696659, 0.9114951, 1, 0, 0.4509804, 1,
1.469192, -1.245094, 1.804413, 1, 0, 0.4431373, 1,
1.475171, 0.5704219, 0.7433165, 1, 0, 0.4392157, 1,
1.499428, 1.82088, 0.8161301, 1, 0, 0.4313726, 1,
1.50176, 1.094845, 1.798716, 1, 0, 0.427451, 1,
1.507847, -1.778779, 2.562136, 1, 0, 0.4196078, 1,
1.510491, 1.18907, 2.578637, 1, 0, 0.4156863, 1,
1.516804, -1.176202, 1.50361, 1, 0, 0.4078431, 1,
1.534966, -0.2420895, 1.837845, 1, 0, 0.4039216, 1,
1.535988, -0.7326395, 2.722975, 1, 0, 0.3960784, 1,
1.536746, -0.1550524, 0.2835474, 1, 0, 0.3882353, 1,
1.554239, -1.287544, 1.234519, 1, 0, 0.3843137, 1,
1.558628, -0.5249386, 1.012268, 1, 0, 0.3764706, 1,
1.578208, -1.310551, 3.097044, 1, 0, 0.372549, 1,
1.597826, -0.2074744, 1.119602, 1, 0, 0.3647059, 1,
1.603318, -0.5959746, 2.016813, 1, 0, 0.3607843, 1,
1.604588, 0.5495625, 2.617437, 1, 0, 0.3529412, 1,
1.631123, -0.2109533, 4.279586, 1, 0, 0.3490196, 1,
1.647475, 1.00234, 0.6102523, 1, 0, 0.3411765, 1,
1.674849, 1.537181, 0.07024108, 1, 0, 0.3372549, 1,
1.683923, -0.7015355, 0.9602424, 1, 0, 0.3294118, 1,
1.70299, 0.09289394, 1.631954, 1, 0, 0.3254902, 1,
1.72339, -1.442116, 2.696375, 1, 0, 0.3176471, 1,
1.726196, 0.541792, 1.358026, 1, 0, 0.3137255, 1,
1.73816, -0.0120009, 0.5116547, 1, 0, 0.3058824, 1,
1.742363, -0.0956468, 2.462617, 1, 0, 0.2980392, 1,
1.76351, -0.5152175, 2.129956, 1, 0, 0.2941177, 1,
1.781069, 0.5100273, 1.250924, 1, 0, 0.2862745, 1,
1.786956, 1.661931, -0.3448068, 1, 0, 0.282353, 1,
1.796639, 0.971013, 1.637348, 1, 0, 0.2745098, 1,
1.818843, 0.8649858, 1.621652, 1, 0, 0.2705882, 1,
1.824568, 0.7650853, 0.04066104, 1, 0, 0.2627451, 1,
1.835488, 0.6770872, 1.837903, 1, 0, 0.2588235, 1,
1.837211, 1.228052, 1.108562, 1, 0, 0.2509804, 1,
1.840446, 1.715914, 1.50772, 1, 0, 0.2470588, 1,
1.843993, -1.105623, 3.421278, 1, 0, 0.2392157, 1,
1.850723, -0.3401556, 1.248531, 1, 0, 0.2352941, 1,
1.852422, 0.9978272, 1.539661, 1, 0, 0.227451, 1,
1.881304, -0.04558037, 2.45717, 1, 0, 0.2235294, 1,
1.898635, 0.6274371, 3.672634, 1, 0, 0.2156863, 1,
1.904999, 0.4059677, 0.1523357, 1, 0, 0.2117647, 1,
1.906013, 0.01908232, 2.591695, 1, 0, 0.2039216, 1,
1.931362, -1.095469, 2.84702, 1, 0, 0.1960784, 1,
1.940026, 2.728667, 1.331136, 1, 0, 0.1921569, 1,
1.94041, 0.6322583, 1.745628, 1, 0, 0.1843137, 1,
1.947068, -1.159524, 1.63726, 1, 0, 0.1803922, 1,
1.960927, 0.9140616, -0.1831137, 1, 0, 0.172549, 1,
1.962731, -1.118948, 2.387974, 1, 0, 0.1686275, 1,
1.972079, -1.478025, 1.990747, 1, 0, 0.1607843, 1,
1.974896, 0.7505987, 1.477803, 1, 0, 0.1568628, 1,
1.977555, 0.2973809, 1.883416, 1, 0, 0.1490196, 1,
1.989674, -1.113135, 1.926782, 1, 0, 0.145098, 1,
1.991955, -3.15105, 1.690106, 1, 0, 0.1372549, 1,
2.027016, -0.6306305, 2.348983, 1, 0, 0.1333333, 1,
2.041435, -0.01252548, 2.41872, 1, 0, 0.1254902, 1,
2.050105, 0.2514013, 3.353094, 1, 0, 0.1215686, 1,
2.071817, 0.4062667, 2.088757, 1, 0, 0.1137255, 1,
2.08859, -0.1684109, 2.875242, 1, 0, 0.1098039, 1,
2.093077, 0.4023748, -0.586207, 1, 0, 0.1019608, 1,
2.153896, -0.648145, 1.09705, 1, 0, 0.09411765, 1,
2.162152, 1.956119, 0.6721838, 1, 0, 0.09019608, 1,
2.197531, 0.4898573, 0.9246828, 1, 0, 0.08235294, 1,
2.198535, -0.5011401, 1.236881, 1, 0, 0.07843138, 1,
2.21986, 0.412104, 3.594583, 1, 0, 0.07058824, 1,
2.222878, -0.4948346, 2.568845, 1, 0, 0.06666667, 1,
2.252052, -0.1638968, 1.087362, 1, 0, 0.05882353, 1,
2.309978, -1.129084, 2.025799, 1, 0, 0.05490196, 1,
2.370501, -1.797419, 2.055378, 1, 0, 0.04705882, 1,
2.388593, -0.517906, 2.505032, 1, 0, 0.04313726, 1,
2.413295, 0.3122465, 1.334746, 1, 0, 0.03529412, 1,
2.503898, 1.953539, 1.149413, 1, 0, 0.03137255, 1,
2.606823, -0.8966502, 2.376554, 1, 0, 0.02352941, 1,
2.75765, -0.2379957, -0.2272182, 1, 0, 0.01960784, 1,
3.009336, 1.202777, 2.055524, 1, 0, 0.01176471, 1,
3.06102, -2.061669, 2.660841, 1, 0, 0.007843138, 1
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
0.06526172, -4.624403, -7.346135, 0, -0.5, 0.5, 0.5,
0.06526172, -4.624403, -7.346135, 1, -0.5, 0.5, 0.5,
0.06526172, -4.624403, -7.346135, 1, 1.5, 0.5, 0.5,
0.06526172, -4.624403, -7.346135, 0, 1.5, 0.5, 0.5
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
-3.946058, -0.415014, -7.346135, 0, -0.5, 0.5, 0.5,
-3.946058, -0.415014, -7.346135, 1, -0.5, 0.5, 0.5,
-3.946058, -0.415014, -7.346135, 1, 1.5, 0.5, 0.5,
-3.946058, -0.415014, -7.346135, 0, 1.5, 0.5, 0.5
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
-3.946058, -4.624403, 0.3869064, 0, -0.5, 0.5, 0.5,
-3.946058, -4.624403, 0.3869064, 1, -0.5, 0.5, 0.5,
-3.946058, -4.624403, 0.3869064, 1, 1.5, 0.5, 0.5,
-3.946058, -4.624403, 0.3869064, 0, 1.5, 0.5, 0.5
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
-2, -3.653006, -5.561586,
3, -3.653006, -5.561586,
-2, -3.653006, -5.561586,
-2, -3.814905, -5.859011,
-1, -3.653006, -5.561586,
-1, -3.814905, -5.859011,
0, -3.653006, -5.561586,
0, -3.814905, -5.859011,
1, -3.653006, -5.561586,
1, -3.814905, -5.859011,
2, -3.653006, -5.561586,
2, -3.814905, -5.859011,
3, -3.653006, -5.561586,
3, -3.814905, -5.859011
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
-2, -4.138704, -6.453861, 0, -0.5, 0.5, 0.5,
-2, -4.138704, -6.453861, 1, -0.5, 0.5, 0.5,
-2, -4.138704, -6.453861, 1, 1.5, 0.5, 0.5,
-2, -4.138704, -6.453861, 0, 1.5, 0.5, 0.5,
-1, -4.138704, -6.453861, 0, -0.5, 0.5, 0.5,
-1, -4.138704, -6.453861, 1, -0.5, 0.5, 0.5,
-1, -4.138704, -6.453861, 1, 1.5, 0.5, 0.5,
-1, -4.138704, -6.453861, 0, 1.5, 0.5, 0.5,
0, -4.138704, -6.453861, 0, -0.5, 0.5, 0.5,
0, -4.138704, -6.453861, 1, -0.5, 0.5, 0.5,
0, -4.138704, -6.453861, 1, 1.5, 0.5, 0.5,
0, -4.138704, -6.453861, 0, 1.5, 0.5, 0.5,
1, -4.138704, -6.453861, 0, -0.5, 0.5, 0.5,
1, -4.138704, -6.453861, 1, -0.5, 0.5, 0.5,
1, -4.138704, -6.453861, 1, 1.5, 0.5, 0.5,
1, -4.138704, -6.453861, 0, 1.5, 0.5, 0.5,
2, -4.138704, -6.453861, 0, -0.5, 0.5, 0.5,
2, -4.138704, -6.453861, 1, -0.5, 0.5, 0.5,
2, -4.138704, -6.453861, 1, 1.5, 0.5, 0.5,
2, -4.138704, -6.453861, 0, 1.5, 0.5, 0.5,
3, -4.138704, -6.453861, 0, -0.5, 0.5, 0.5,
3, -4.138704, -6.453861, 1, -0.5, 0.5, 0.5,
3, -4.138704, -6.453861, 1, 1.5, 0.5, 0.5,
3, -4.138704, -6.453861, 0, 1.5, 0.5, 0.5
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
-3.020369, -3, -5.561586,
-3.020369, 2, -5.561586,
-3.020369, -3, -5.561586,
-3.17465, -3, -5.859011,
-3.020369, -2, -5.561586,
-3.17465, -2, -5.859011,
-3.020369, -1, -5.561586,
-3.17465, -1, -5.859011,
-3.020369, 0, -5.561586,
-3.17465, 0, -5.859011,
-3.020369, 1, -5.561586,
-3.17465, 1, -5.859011,
-3.020369, 2, -5.561586,
-3.17465, 2, -5.859011
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
-3.483214, -3, -6.453861, 0, -0.5, 0.5, 0.5,
-3.483214, -3, -6.453861, 1, -0.5, 0.5, 0.5,
-3.483214, -3, -6.453861, 1, 1.5, 0.5, 0.5,
-3.483214, -3, -6.453861, 0, 1.5, 0.5, 0.5,
-3.483214, -2, -6.453861, 0, -0.5, 0.5, 0.5,
-3.483214, -2, -6.453861, 1, -0.5, 0.5, 0.5,
-3.483214, -2, -6.453861, 1, 1.5, 0.5, 0.5,
-3.483214, -2, -6.453861, 0, 1.5, 0.5, 0.5,
-3.483214, -1, -6.453861, 0, -0.5, 0.5, 0.5,
-3.483214, -1, -6.453861, 1, -0.5, 0.5, 0.5,
-3.483214, -1, -6.453861, 1, 1.5, 0.5, 0.5,
-3.483214, -1, -6.453861, 0, 1.5, 0.5, 0.5,
-3.483214, 0, -6.453861, 0, -0.5, 0.5, 0.5,
-3.483214, 0, -6.453861, 1, -0.5, 0.5, 0.5,
-3.483214, 0, -6.453861, 1, 1.5, 0.5, 0.5,
-3.483214, 0, -6.453861, 0, 1.5, 0.5, 0.5,
-3.483214, 1, -6.453861, 0, -0.5, 0.5, 0.5,
-3.483214, 1, -6.453861, 1, -0.5, 0.5, 0.5,
-3.483214, 1, -6.453861, 1, 1.5, 0.5, 0.5,
-3.483214, 1, -6.453861, 0, 1.5, 0.5, 0.5,
-3.483214, 2, -6.453861, 0, -0.5, 0.5, 0.5,
-3.483214, 2, -6.453861, 1, -0.5, 0.5, 0.5,
-3.483214, 2, -6.453861, 1, 1.5, 0.5, 0.5,
-3.483214, 2, -6.453861, 0, 1.5, 0.5, 0.5
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
-3.020369, -3.653006, -4,
-3.020369, -3.653006, 6,
-3.020369, -3.653006, -4,
-3.17465, -3.814905, -4,
-3.020369, -3.653006, -2,
-3.17465, -3.814905, -2,
-3.020369, -3.653006, 0,
-3.17465, -3.814905, 0,
-3.020369, -3.653006, 2,
-3.17465, -3.814905, 2,
-3.020369, -3.653006, 4,
-3.17465, -3.814905, 4,
-3.020369, -3.653006, 6,
-3.17465, -3.814905, 6
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
"4",
"6"
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
-3.483214, -4.138704, -4, 0, -0.5, 0.5, 0.5,
-3.483214, -4.138704, -4, 1, -0.5, 0.5, 0.5,
-3.483214, -4.138704, -4, 1, 1.5, 0.5, 0.5,
-3.483214, -4.138704, -4, 0, 1.5, 0.5, 0.5,
-3.483214, -4.138704, -2, 0, -0.5, 0.5, 0.5,
-3.483214, -4.138704, -2, 1, -0.5, 0.5, 0.5,
-3.483214, -4.138704, -2, 1, 1.5, 0.5, 0.5,
-3.483214, -4.138704, -2, 0, 1.5, 0.5, 0.5,
-3.483214, -4.138704, 0, 0, -0.5, 0.5, 0.5,
-3.483214, -4.138704, 0, 1, -0.5, 0.5, 0.5,
-3.483214, -4.138704, 0, 1, 1.5, 0.5, 0.5,
-3.483214, -4.138704, 0, 0, 1.5, 0.5, 0.5,
-3.483214, -4.138704, 2, 0, -0.5, 0.5, 0.5,
-3.483214, -4.138704, 2, 1, -0.5, 0.5, 0.5,
-3.483214, -4.138704, 2, 1, 1.5, 0.5, 0.5,
-3.483214, -4.138704, 2, 0, 1.5, 0.5, 0.5,
-3.483214, -4.138704, 4, 0, -0.5, 0.5, 0.5,
-3.483214, -4.138704, 4, 1, -0.5, 0.5, 0.5,
-3.483214, -4.138704, 4, 1, 1.5, 0.5, 0.5,
-3.483214, -4.138704, 4, 0, 1.5, 0.5, 0.5,
-3.483214, -4.138704, 6, 0, -0.5, 0.5, 0.5,
-3.483214, -4.138704, 6, 1, -0.5, 0.5, 0.5,
-3.483214, -4.138704, 6, 1, 1.5, 0.5, 0.5,
-3.483214, -4.138704, 6, 0, 1.5, 0.5, 0.5
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
-3.020369, -3.653006, -5.561586,
-3.020369, 2.822978, -5.561586,
-3.020369, -3.653006, 6.335399,
-3.020369, 2.822978, 6.335399,
-3.020369, -3.653006, -5.561586,
-3.020369, -3.653006, 6.335399,
-3.020369, 2.822978, -5.561586,
-3.020369, 2.822978, 6.335399,
-3.020369, -3.653006, -5.561586,
3.150892, -3.653006, -5.561586,
-3.020369, -3.653006, 6.335399,
3.150892, -3.653006, 6.335399,
-3.020369, 2.822978, -5.561586,
3.150892, 2.822978, -5.561586,
-3.020369, 2.822978, 6.335399,
3.150892, 2.822978, 6.335399,
3.150892, -3.653006, -5.561586,
3.150892, 2.822978, -5.561586,
3.150892, -3.653006, 6.335399,
3.150892, 2.822978, 6.335399,
3.150892, -3.653006, -5.561586,
3.150892, -3.653006, 6.335399,
3.150892, 2.822978, -5.561586,
3.150892, 2.822978, 6.335399
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
var radius = 7.948263;
var distance = 35.36272;
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
mvMatrix.translate( -0.06526172, 0.415014, -0.3869064 );
mvMatrix.scale( 1.392554, 1.327029, 0.7223525 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.36272);
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


