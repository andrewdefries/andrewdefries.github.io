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
-3.541854, 1.336115, -2.478822, 1, 0, 0, 1,
-3.13693, 0.02919324, -2.207957, 1, 0.007843138, 0, 1,
-3.116943, -0.4226969, -0.2854549, 1, 0.01176471, 0, 1,
-3.039821, -0.893926, -2.503847, 1, 0.01960784, 0, 1,
-2.804999, 1.234292, -1.350724, 1, 0.02352941, 0, 1,
-2.52504, 0.6430021, 0.01066938, 1, 0.03137255, 0, 1,
-2.49621, -1.839304, -1.710945, 1, 0.03529412, 0, 1,
-2.441282, 1.536897, -1.426551, 1, 0.04313726, 0, 1,
-2.399552, 1.009768, -1.562226, 1, 0.04705882, 0, 1,
-2.388953, -0.9967945, -0.8803802, 1, 0.05490196, 0, 1,
-2.370222, -0.05830954, -3.2521, 1, 0.05882353, 0, 1,
-2.274973, 0.6545905, -0.6507983, 1, 0.06666667, 0, 1,
-2.166812, -0.3685525, -2.546519, 1, 0.07058824, 0, 1,
-2.145144, -0.5992287, -2.681449, 1, 0.07843138, 0, 1,
-2.127445, -0.4408135, -1.046061, 1, 0.08235294, 0, 1,
-2.122744, -0.7331041, -1.186776, 1, 0.09019608, 0, 1,
-2.095133, 0.4123566, -3.38332, 1, 0.09411765, 0, 1,
-2.072492, 0.4807694, -2.630616, 1, 0.1019608, 0, 1,
-2.033532, -1.383252, -1.635778, 1, 0.1098039, 0, 1,
-2.017834, 0.9438413, 0.8495385, 1, 0.1137255, 0, 1,
-2.017081, 0.8332327, -1.892334, 1, 0.1215686, 0, 1,
-2.009263, -0.778466, -1.620866, 1, 0.1254902, 0, 1,
-1.9993, 0.07785137, -1.070542, 1, 0.1333333, 0, 1,
-1.984135, -0.8243871, -1.35205, 1, 0.1372549, 0, 1,
-1.982264, -0.7814636, -1.071425, 1, 0.145098, 0, 1,
-1.960002, 0.9040226, -0.318967, 1, 0.1490196, 0, 1,
-1.958519, -0.8787885, -1.774066, 1, 0.1568628, 0, 1,
-1.948903, 0.1712922, -1.836237, 1, 0.1607843, 0, 1,
-1.929375, 0.376866, -1.049083, 1, 0.1686275, 0, 1,
-1.908201, 0.9418184, -0.9255478, 1, 0.172549, 0, 1,
-1.90401, -0.5640607, -2.437728, 1, 0.1803922, 0, 1,
-1.886262, -0.1624998, -1.9799, 1, 0.1843137, 0, 1,
-1.872668, -0.2023369, -0.1006436, 1, 0.1921569, 0, 1,
-1.86902, -2.308869, -1.65216, 1, 0.1960784, 0, 1,
-1.847984, -0.9063981, -2.363991, 1, 0.2039216, 0, 1,
-1.833427, -0.4353875, -0.6492558, 1, 0.2117647, 0, 1,
-1.813287, 1.002257, -1.284567, 1, 0.2156863, 0, 1,
-1.800543, 0.1972883, -1.094041, 1, 0.2235294, 0, 1,
-1.777748, -0.4230842, -1.258505, 1, 0.227451, 0, 1,
-1.759902, 1.144426, -0.1696182, 1, 0.2352941, 0, 1,
-1.748394, 2.036305, 1.322299, 1, 0.2392157, 0, 1,
-1.739647, 0.841058, -1.051983, 1, 0.2470588, 0, 1,
-1.732573, -0.05634954, -2.141731, 1, 0.2509804, 0, 1,
-1.731305, 0.624402, -0.9181676, 1, 0.2588235, 0, 1,
-1.71865, -0.5794038, -2.509303, 1, 0.2627451, 0, 1,
-1.716547, 0.06766846, -1.029914, 1, 0.2705882, 0, 1,
-1.714607, 0.6653038, -2.070772, 1, 0.2745098, 0, 1,
-1.710213, 0.6542981, -0.3460942, 1, 0.282353, 0, 1,
-1.695647, -0.4566872, -2.711711, 1, 0.2862745, 0, 1,
-1.682199, -0.3174681, -2.729753, 1, 0.2941177, 0, 1,
-1.6802, 1.367578, -1.691975, 1, 0.3019608, 0, 1,
-1.679131, -1.097356, -3.209991, 1, 0.3058824, 0, 1,
-1.673209, -0.5311471, -2.646184, 1, 0.3137255, 0, 1,
-1.671399, -2.880852, -3.406183, 1, 0.3176471, 0, 1,
-1.667592, -0.3877639, -0.9583484, 1, 0.3254902, 0, 1,
-1.638834, 0.3300254, -0.8386045, 1, 0.3294118, 0, 1,
-1.63878, 0.06095547, -3.34264, 1, 0.3372549, 0, 1,
-1.627412, -0.0838303, -2.049229, 1, 0.3411765, 0, 1,
-1.606678, 1.348079, -0.2072664, 1, 0.3490196, 0, 1,
-1.604118, -1.653937, 0.2557736, 1, 0.3529412, 0, 1,
-1.591031, 0.04929092, -2.425033, 1, 0.3607843, 0, 1,
-1.582656, 0.4739283, 0.1235517, 1, 0.3647059, 0, 1,
-1.574731, 0.9413553, -2.368791, 1, 0.372549, 0, 1,
-1.568455, 0.6575142, -1.268089, 1, 0.3764706, 0, 1,
-1.568317, -1.509084, -3.941525, 1, 0.3843137, 0, 1,
-1.553626, -0.116749, -0.8353356, 1, 0.3882353, 0, 1,
-1.548286, 0.1684915, -2.502757, 1, 0.3960784, 0, 1,
-1.546763, -0.03761942, -1.075527, 1, 0.4039216, 0, 1,
-1.541081, 1.074857, -1.642937, 1, 0.4078431, 0, 1,
-1.53892, 0.1842007, 0.0550597, 1, 0.4156863, 0, 1,
-1.534004, -1.654461, -0.6790347, 1, 0.4196078, 0, 1,
-1.530474, 0.6517128, -0.3189946, 1, 0.427451, 0, 1,
-1.525155, -2.301493, -2.485146, 1, 0.4313726, 0, 1,
-1.521104, 0.2521694, -2.045687, 1, 0.4392157, 0, 1,
-1.517153, -0.507493, -3.091, 1, 0.4431373, 0, 1,
-1.516896, -0.8695437, -2.963502, 1, 0.4509804, 0, 1,
-1.505196, 0.7375496, -1.043181, 1, 0.454902, 0, 1,
-1.486971, 0.5372061, -1.488398, 1, 0.4627451, 0, 1,
-1.469081, -0.426193, -2.517716, 1, 0.4666667, 0, 1,
-1.463209, -0.00611077, -1.697085, 1, 0.4745098, 0, 1,
-1.456196, 0.682035, -1.434081, 1, 0.4784314, 0, 1,
-1.444797, -1.99448, -2.940244, 1, 0.4862745, 0, 1,
-1.438656, -1.296784, -1.735785, 1, 0.4901961, 0, 1,
-1.438449, 1.09352, -2.007495, 1, 0.4980392, 0, 1,
-1.438252, 1.028872, -1.390569, 1, 0.5058824, 0, 1,
-1.427999, 0.01216103, 0.09870957, 1, 0.509804, 0, 1,
-1.424085, -0.03239259, 0.1938624, 1, 0.5176471, 0, 1,
-1.420748, -1.641364, -2.204828, 1, 0.5215687, 0, 1,
-1.371931, -0.6676842, -3.092965, 1, 0.5294118, 0, 1,
-1.371254, 0.7534364, -0.386943, 1, 0.5333334, 0, 1,
-1.369015, 0.635066, -1.723492, 1, 0.5411765, 0, 1,
-1.367992, -1.639248, -0.8473403, 1, 0.5450981, 0, 1,
-1.36083, -0.4637938, 0.2707236, 1, 0.5529412, 0, 1,
-1.356477, -0.7662833, -4.692788, 1, 0.5568628, 0, 1,
-1.348881, -0.6923245, -3.581565, 1, 0.5647059, 0, 1,
-1.345867, -0.266304, -0.172642, 1, 0.5686275, 0, 1,
-1.336317, 0.6477521, -1.054063, 1, 0.5764706, 0, 1,
-1.335505, 0.1025762, -2.724416, 1, 0.5803922, 0, 1,
-1.322084, 0.3065645, -1.243275, 1, 0.5882353, 0, 1,
-1.321238, -0.0517739, -1.448551, 1, 0.5921569, 0, 1,
-1.320564, 2.38393, -1.021842, 1, 0.6, 0, 1,
-1.301542, 0.6129975, -1.261015, 1, 0.6078432, 0, 1,
-1.298433, 0.4356504, -0.5809451, 1, 0.6117647, 0, 1,
-1.298138, -1.651017, -2.370462, 1, 0.6196079, 0, 1,
-1.29751, 0.5177373, -1.057844, 1, 0.6235294, 0, 1,
-1.294891, -0.2242307, -2.00796, 1, 0.6313726, 0, 1,
-1.275999, -1.246185, -2.082777, 1, 0.6352941, 0, 1,
-1.264303, -0.3019917, -3.278568, 1, 0.6431373, 0, 1,
-1.263339, -0.9884617, -2.97403, 1, 0.6470588, 0, 1,
-1.262323, 0.8509718, -2.103964, 1, 0.654902, 0, 1,
-1.247751, 0.4081888, 0.1438998, 1, 0.6588235, 0, 1,
-1.237062, -0.206038, -2.515977, 1, 0.6666667, 0, 1,
-1.234006, 0.2661184, -0.7669154, 1, 0.6705883, 0, 1,
-1.232823, 0.4299996, -0.7710996, 1, 0.6784314, 0, 1,
-1.231121, -0.3994779, -1.36553, 1, 0.682353, 0, 1,
-1.215753, -0.08366124, -3.730497, 1, 0.6901961, 0, 1,
-1.20831, -1.162632, -2.619585, 1, 0.6941177, 0, 1,
-1.185781, -0.1235852, -2.236868, 1, 0.7019608, 0, 1,
-1.185136, -0.5779156, -2.716456, 1, 0.7098039, 0, 1,
-1.170768, -0.1525941, -4.647529, 1, 0.7137255, 0, 1,
-1.169073, 0.4341891, -0.9211618, 1, 0.7215686, 0, 1,
-1.15874, -0.8301882, -2.029046, 1, 0.7254902, 0, 1,
-1.147848, 0.1461403, -2.292367, 1, 0.7333333, 0, 1,
-1.142709, 0.3812805, -2.416365, 1, 0.7372549, 0, 1,
-1.123752, -1.830015, -3.491785, 1, 0.7450981, 0, 1,
-1.119284, 0.5837963, 2.008752, 1, 0.7490196, 0, 1,
-1.118808, -0.0003433829, -1.354885, 1, 0.7568628, 0, 1,
-1.115946, -0.6070287, -2.519815, 1, 0.7607843, 0, 1,
-1.113839, 1.520884, -1.794835, 1, 0.7686275, 0, 1,
-1.089925, 0.5534917, -1.393001, 1, 0.772549, 0, 1,
-1.081421, -1.233249, -1.968079, 1, 0.7803922, 0, 1,
-1.07929, 1.446335, -1.074156, 1, 0.7843137, 0, 1,
-1.070394, 0.8626807, -1.478226, 1, 0.7921569, 0, 1,
-1.063602, -0.8552627, -1.989812, 1, 0.7960784, 0, 1,
-1.060843, 0.1691028, -0.7050308, 1, 0.8039216, 0, 1,
-1.052462, -0.0940903, -2.015507, 1, 0.8117647, 0, 1,
-1.051375, 0.004365929, -1.856714, 1, 0.8156863, 0, 1,
-1.046875, -2.019709, -2.082408, 1, 0.8235294, 0, 1,
-1.046298, -0.5875723, -2.112105, 1, 0.827451, 0, 1,
-1.041426, -1.002471, -1.58426, 1, 0.8352941, 0, 1,
-1.039314, -0.8245974, -1.288377, 1, 0.8392157, 0, 1,
-1.020664, 1.051463, -1.690548, 1, 0.8470588, 0, 1,
-1.01608, 0.4593972, -0.03534047, 1, 0.8509804, 0, 1,
-1.012098, -1.824625, -3.159571, 1, 0.8588235, 0, 1,
-1.006751, -0.02522998, -2.398354, 1, 0.8627451, 0, 1,
-0.9823915, -1.003194, -3.350852, 1, 0.8705882, 0, 1,
-0.9738181, 1.26324, 0.3364102, 1, 0.8745098, 0, 1,
-0.9645469, 0.7861208, -0.9034815, 1, 0.8823529, 0, 1,
-0.9638456, -0.6810744, -1.715946, 1, 0.8862745, 0, 1,
-0.9623519, -0.176679, -0.8288959, 1, 0.8941177, 0, 1,
-0.96029, -0.1478662, -2.099969, 1, 0.8980392, 0, 1,
-0.953802, 1.13302, -0.6656345, 1, 0.9058824, 0, 1,
-0.9514358, 0.2724852, -2.877379, 1, 0.9137255, 0, 1,
-0.9437446, -0.7568514, -2.686948, 1, 0.9176471, 0, 1,
-0.932421, 0.729837, -0.8270969, 1, 0.9254902, 0, 1,
-0.9300417, -0.3133724, -2.500813, 1, 0.9294118, 0, 1,
-0.925272, 0.623682, -2.290968, 1, 0.9372549, 0, 1,
-0.9248213, -0.9985389, -4.238099, 1, 0.9411765, 0, 1,
-0.9214736, 0.244432, -2.352525, 1, 0.9490196, 0, 1,
-0.9106643, -0.1092911, 0.2133367, 1, 0.9529412, 0, 1,
-0.9100749, 1.641692, 0.4448526, 1, 0.9607843, 0, 1,
-0.890542, -1.270414, -2.133153, 1, 0.9647059, 0, 1,
-0.8904794, -1.929981, -2.724635, 1, 0.972549, 0, 1,
-0.8881176, -0.935981, -3.391311, 1, 0.9764706, 0, 1,
-0.883806, 1.181125, -2.375845, 1, 0.9843137, 0, 1,
-0.8794605, -0.9699357, -2.417529, 1, 0.9882353, 0, 1,
-0.8706126, -0.4079087, -2.223597, 1, 0.9960784, 0, 1,
-0.8697973, -0.2903546, -1.416526, 0.9960784, 1, 0, 1,
-0.8675147, 0.340723, -1.82385, 0.9921569, 1, 0, 1,
-0.8616312, -0.4216759, -2.160464, 0.9843137, 1, 0, 1,
-0.8559107, 0.110034, -1.838514, 0.9803922, 1, 0, 1,
-0.8508654, 0.1083873, -0.9338805, 0.972549, 1, 0, 1,
-0.849815, 0.5970198, 0.9681194, 0.9686275, 1, 0, 1,
-0.8489659, 0.4078702, -0.8210528, 0.9607843, 1, 0, 1,
-0.8489479, -1.434076, -3.145973, 0.9568627, 1, 0, 1,
-0.8466234, -1.268988, -1.489035, 0.9490196, 1, 0, 1,
-0.8442407, 0.261574, -1.058648, 0.945098, 1, 0, 1,
-0.8412336, 0.7549806, -1.674619, 0.9372549, 1, 0, 1,
-0.8376817, 0.1245414, -1.224363, 0.9333333, 1, 0, 1,
-0.8274601, -1.234023, -2.30853, 0.9254902, 1, 0, 1,
-0.8243271, 1.14962, 0.19509, 0.9215686, 1, 0, 1,
-0.8234436, -0.468824, -1.535716, 0.9137255, 1, 0, 1,
-0.8157482, 1.02165, -2.471411, 0.9098039, 1, 0, 1,
-0.806657, -0.6944509, -1.86748, 0.9019608, 1, 0, 1,
-0.8063169, -0.752804, -1.261107, 0.8941177, 1, 0, 1,
-0.8046911, 0.2344557, -1.390713, 0.8901961, 1, 0, 1,
-0.801976, -0.1320132, -1.307194, 0.8823529, 1, 0, 1,
-0.801006, 1.047889, 0.1012639, 0.8784314, 1, 0, 1,
-0.7984884, 0.7018571, -0.4584092, 0.8705882, 1, 0, 1,
-0.7915837, -0.8863813, -2.016917, 0.8666667, 1, 0, 1,
-0.788206, -1.194429, -2.847631, 0.8588235, 1, 0, 1,
-0.7875249, -0.4281957, -3.206007, 0.854902, 1, 0, 1,
-0.7797741, -1.441858, -3.637088, 0.8470588, 1, 0, 1,
-0.7786966, 0.3158517, -1.196009, 0.8431373, 1, 0, 1,
-0.7740621, -1.047155, -2.349516, 0.8352941, 1, 0, 1,
-0.7732435, 0.2039981, -1.487548, 0.8313726, 1, 0, 1,
-0.7713618, 0.7603037, -0.2745762, 0.8235294, 1, 0, 1,
-0.771341, -0.5145009, -2.706234, 0.8196079, 1, 0, 1,
-0.7560634, 0.7041503, -0.5932015, 0.8117647, 1, 0, 1,
-0.7552819, -0.5619549, -1.845293, 0.8078431, 1, 0, 1,
-0.7512163, -0.2916038, -0.1818491, 0.8, 1, 0, 1,
-0.7500083, -0.6888053, -3.996492, 0.7921569, 1, 0, 1,
-0.7477148, -1.435769, -1.468242, 0.7882353, 1, 0, 1,
-0.7445939, -0.3778288, -2.390077, 0.7803922, 1, 0, 1,
-0.7440547, 0.235402, -1.718608, 0.7764706, 1, 0, 1,
-0.7413958, -1.0691, -3.67827, 0.7686275, 1, 0, 1,
-0.7403897, 0.511512, -2.173844, 0.7647059, 1, 0, 1,
-0.7397016, 0.2443382, 0.03835763, 0.7568628, 1, 0, 1,
-0.7356299, -1.196346, -1.703305, 0.7529412, 1, 0, 1,
-0.7347988, 0.756103, -1.442074, 0.7450981, 1, 0, 1,
-0.7333322, 0.9569473, -2.084455, 0.7411765, 1, 0, 1,
-0.7328431, 3.10538, 0.3623944, 0.7333333, 1, 0, 1,
-0.7292748, 0.1379792, 0.327149, 0.7294118, 1, 0, 1,
-0.7271274, 0.5932523, -0.542512, 0.7215686, 1, 0, 1,
-0.725916, 0.6661688, -2.121037, 0.7176471, 1, 0, 1,
-0.7195473, -0.9615068, -2.342735, 0.7098039, 1, 0, 1,
-0.717777, -0.7673571, -4.608813, 0.7058824, 1, 0, 1,
-0.7167975, 1.501311, -2.304272, 0.6980392, 1, 0, 1,
-0.715107, 0.1119018, -2.239551, 0.6901961, 1, 0, 1,
-0.7133137, -0.16248, -2.09136, 0.6862745, 1, 0, 1,
-0.7071362, -0.3212937, -0.8074548, 0.6784314, 1, 0, 1,
-0.6981673, -1.488182, -4.007699, 0.6745098, 1, 0, 1,
-0.6969715, -1.282678, -2.517454, 0.6666667, 1, 0, 1,
-0.6924921, 0.05842525, -1.114085, 0.6627451, 1, 0, 1,
-0.690952, -0.5558672, -1.819941, 0.654902, 1, 0, 1,
-0.6876199, -1.663099, -2.90161, 0.6509804, 1, 0, 1,
-0.6874075, -0.2866583, 0.0455089, 0.6431373, 1, 0, 1,
-0.6858904, 0.9133626, -0.71132, 0.6392157, 1, 0, 1,
-0.6849334, -0.583991, -0.977675, 0.6313726, 1, 0, 1,
-0.6765832, -0.5971029, -2.828081, 0.627451, 1, 0, 1,
-0.675221, -1.044109, -2.355854, 0.6196079, 1, 0, 1,
-0.6742629, 0.3933907, -1.633973, 0.6156863, 1, 0, 1,
-0.6726022, -0.05443871, -1.320299, 0.6078432, 1, 0, 1,
-0.6703661, 0.4122966, 0.6481167, 0.6039216, 1, 0, 1,
-0.6688175, 0.3994153, -2.077011, 0.5960785, 1, 0, 1,
-0.6603429, -0.09941953, -4.876194, 0.5882353, 1, 0, 1,
-0.6586376, 0.9534162, 0.2871465, 0.5843138, 1, 0, 1,
-0.6577169, 2.017243, 0.3093954, 0.5764706, 1, 0, 1,
-0.6526642, -0.1216871, -3.279598, 0.572549, 1, 0, 1,
-0.6519748, -1.41517, -3.10166, 0.5647059, 1, 0, 1,
-0.6494661, 1.230917, 0.5952648, 0.5607843, 1, 0, 1,
-0.6439092, 1.28169, -1.108705, 0.5529412, 1, 0, 1,
-0.6398611, -0.56794, -2.201918, 0.5490196, 1, 0, 1,
-0.6314467, 1.286158, 0.05662085, 0.5411765, 1, 0, 1,
-0.6290835, 0.06757981, -4.006516, 0.5372549, 1, 0, 1,
-0.6209272, 1.729952, 0.5087739, 0.5294118, 1, 0, 1,
-0.6135562, -1.06356, -0.8868657, 0.5254902, 1, 0, 1,
-0.6134658, 0.5672187, -0.3552919, 0.5176471, 1, 0, 1,
-0.6072849, 0.02040936, -1.083038, 0.5137255, 1, 0, 1,
-0.6062305, -1.329116, -1.720778, 0.5058824, 1, 0, 1,
-0.6036685, 0.843801, -1.806612, 0.5019608, 1, 0, 1,
-0.6018288, -0.03188305, -1.884082, 0.4941176, 1, 0, 1,
-0.600467, 1.195157, -1.115418, 0.4862745, 1, 0, 1,
-0.5985436, -2.141223, -3.99472, 0.4823529, 1, 0, 1,
-0.5984607, 1.464655, -0.4203174, 0.4745098, 1, 0, 1,
-0.5979418, 1.011019, 0.01605709, 0.4705882, 1, 0, 1,
-0.5978433, 1.548494, -0.2486191, 0.4627451, 1, 0, 1,
-0.5960774, 0.1972184, -0.1152442, 0.4588235, 1, 0, 1,
-0.595888, 0.2157228, -2.395433, 0.4509804, 1, 0, 1,
-0.5949711, -0.2933299, -3.081163, 0.4470588, 1, 0, 1,
-0.5921113, -0.9542072, -1.829248, 0.4392157, 1, 0, 1,
-0.5889907, 0.3930339, -1.95075, 0.4352941, 1, 0, 1,
-0.5888605, 3.098566, 1.863223, 0.427451, 1, 0, 1,
-0.5877187, -0.3610988, -2.18581, 0.4235294, 1, 0, 1,
-0.5876664, 0.801358, -1.743386, 0.4156863, 1, 0, 1,
-0.5812767, 1.777322, 0.1293294, 0.4117647, 1, 0, 1,
-0.5787504, 0.4537748, -0.7791553, 0.4039216, 1, 0, 1,
-0.5779712, -2.076249, -3.035193, 0.3960784, 1, 0, 1,
-0.5738231, 0.2745517, -0.3393482, 0.3921569, 1, 0, 1,
-0.5659899, -1.97768, -3.705839, 0.3843137, 1, 0, 1,
-0.5615045, 1.419404, -0.6682681, 0.3803922, 1, 0, 1,
-0.5609442, -1.026856, -2.367008, 0.372549, 1, 0, 1,
-0.5547325, -0.2709934, -1.80638, 0.3686275, 1, 0, 1,
-0.5526549, -0.2177746, -0.9335338, 0.3607843, 1, 0, 1,
-0.5517102, 1.479281, -0.3750242, 0.3568628, 1, 0, 1,
-0.5515587, 1.019986, -0.713313, 0.3490196, 1, 0, 1,
-0.5503824, 1.270443, -0.6146941, 0.345098, 1, 0, 1,
-0.5493522, -2.122798, -2.977768, 0.3372549, 1, 0, 1,
-0.5472751, 0.05970043, -0.1606274, 0.3333333, 1, 0, 1,
-0.5409199, -0.05350067, -1.740113, 0.3254902, 1, 0, 1,
-0.5343574, -1.833292, -2.642306, 0.3215686, 1, 0, 1,
-0.5338038, -2.115304, -3.9557, 0.3137255, 1, 0, 1,
-0.5308056, -0.05342874, -1.195408, 0.3098039, 1, 0, 1,
-0.5306557, 0.9030046, 0.1728488, 0.3019608, 1, 0, 1,
-0.5306242, 0.07422794, -0.9305844, 0.2941177, 1, 0, 1,
-0.5241004, 0.5065199, -1.401715, 0.2901961, 1, 0, 1,
-0.5213562, 0.3886432, 0.5269294, 0.282353, 1, 0, 1,
-0.5207492, -0.2921129, -1.500335, 0.2784314, 1, 0, 1,
-0.5206989, -1.253518, -4.642566, 0.2705882, 1, 0, 1,
-0.5201964, 0.808226, -0.2187658, 0.2666667, 1, 0, 1,
-0.5198535, 0.31793, 0.05848689, 0.2588235, 1, 0, 1,
-0.5140362, -2.105695, -3.597107, 0.254902, 1, 0, 1,
-0.5126457, 0.6237782, -1.667386, 0.2470588, 1, 0, 1,
-0.5102262, -0.8658804, -2.697809, 0.2431373, 1, 0, 1,
-0.5100786, 1.126389, -0.2354033, 0.2352941, 1, 0, 1,
-0.5092919, 1.201142, -0.9902627, 0.2313726, 1, 0, 1,
-0.5064927, 0.1075868, -2.063385, 0.2235294, 1, 0, 1,
-0.5061387, -0.2107069, -1.156705, 0.2196078, 1, 0, 1,
-0.5039198, -0.6511469, -2.662556, 0.2117647, 1, 0, 1,
-0.5006707, -0.1698247, -1.197121, 0.2078431, 1, 0, 1,
-0.4970036, -0.1841321, -2.64642, 0.2, 1, 0, 1,
-0.4968717, -0.75884, -3.238203, 0.1921569, 1, 0, 1,
-0.4904117, -1.024962, -1.439253, 0.1882353, 1, 0, 1,
-0.4879814, 0.1489617, -2.848939, 0.1803922, 1, 0, 1,
-0.4855481, -1.198779, -1.502791, 0.1764706, 1, 0, 1,
-0.4846223, 0.2661107, -1.397127, 0.1686275, 1, 0, 1,
-0.4841949, -0.2268258, -2.67456, 0.1647059, 1, 0, 1,
-0.4784886, 0.8344308, 0.09200455, 0.1568628, 1, 0, 1,
-0.4765882, -2.394915, -2.012895, 0.1529412, 1, 0, 1,
-0.4764456, -2.073071, -1.8018, 0.145098, 1, 0, 1,
-0.4757553, -1.092539, -3.033286, 0.1411765, 1, 0, 1,
-0.4707939, 0.499019, -0.2575644, 0.1333333, 1, 0, 1,
-0.4671786, -0.3079677, -1.137619, 0.1294118, 1, 0, 1,
-0.4652672, -0.7087982, -2.089345, 0.1215686, 1, 0, 1,
-0.4616943, 0.4686994, -1.3695, 0.1176471, 1, 0, 1,
-0.4558187, 1.031346, -1.254399, 0.1098039, 1, 0, 1,
-0.4530387, 0.8174967, 0.1463753, 0.1058824, 1, 0, 1,
-0.4483951, -0.01839616, -0.3532988, 0.09803922, 1, 0, 1,
-0.4474035, 0.03063299, -1.718006, 0.09019608, 1, 0, 1,
-0.4463391, 0.7014852, -0.885016, 0.08627451, 1, 0, 1,
-0.4460818, -1.653306, -2.970647, 0.07843138, 1, 0, 1,
-0.4435598, 0.1710843, -1.919721, 0.07450981, 1, 0, 1,
-0.4409824, -0.5606068, -2.205653, 0.06666667, 1, 0, 1,
-0.4389442, 0.2707556, -2.781836, 0.0627451, 1, 0, 1,
-0.4345956, -1.195405, -2.756416, 0.05490196, 1, 0, 1,
-0.4333343, -1.921031, -6.29523, 0.05098039, 1, 0, 1,
-0.4307306, 0.4075311, -2.220299, 0.04313726, 1, 0, 1,
-0.4297497, -1.835312, -1.898425, 0.03921569, 1, 0, 1,
-0.4291905, -0.1905671, -0.9521815, 0.03137255, 1, 0, 1,
-0.4250062, 0.1858225, -1.000614, 0.02745098, 1, 0, 1,
-0.4215539, -0.7132, -3.324907, 0.01960784, 1, 0, 1,
-0.419976, -0.3970145, -2.436681, 0.01568628, 1, 0, 1,
-0.4193387, 0.06482831, -1.118757, 0.007843138, 1, 0, 1,
-0.4191385, 0.2809609, -0.1269791, 0.003921569, 1, 0, 1,
-0.4144122, -0.6105689, -2.630892, 0, 1, 0.003921569, 1,
-0.4110953, -0.9905661, -2.337265, 0, 1, 0.01176471, 1,
-0.4097703, -1.093676, -2.747478, 0, 1, 0.01568628, 1,
-0.4086851, 0.6486779, -1.337503, 0, 1, 0.02352941, 1,
-0.4037269, 0.8327218, -0.1264514, 0, 1, 0.02745098, 1,
-0.3906485, 0.5074915, -0.3233207, 0, 1, 0.03529412, 1,
-0.3876724, -0.8822072, -3.400842, 0, 1, 0.03921569, 1,
-0.3796082, -0.474023, -1.6849, 0, 1, 0.04705882, 1,
-0.3795183, 0.08993842, -1.387984, 0, 1, 0.05098039, 1,
-0.379251, -0.6323133, -1.851878, 0, 1, 0.05882353, 1,
-0.3756972, 0.3941013, -1.114613, 0, 1, 0.0627451, 1,
-0.3738326, 0.5450062, -0.008331225, 0, 1, 0.07058824, 1,
-0.3707268, 1.171787, 0.04210788, 0, 1, 0.07450981, 1,
-0.3673872, 0.2623772, -0.2323708, 0, 1, 0.08235294, 1,
-0.3671522, 1.220065, -0.7734296, 0, 1, 0.08627451, 1,
-0.3665217, 0.476378, -0.2326203, 0, 1, 0.09411765, 1,
-0.3620513, 1.085605, -0.926902, 0, 1, 0.1019608, 1,
-0.3619277, 0.7069103, -0.5180981, 0, 1, 0.1058824, 1,
-0.3616233, 0.8223991, -1.575198, 0, 1, 0.1137255, 1,
-0.3580663, 0.07872555, -1.780775, 0, 1, 0.1176471, 1,
-0.3553034, -0.7886161, -1.298944, 0, 1, 0.1254902, 1,
-0.3389948, 1.031338, -2.152106, 0, 1, 0.1294118, 1,
-0.3376966, 1.035318, -1.045961, 0, 1, 0.1372549, 1,
-0.3366402, -0.2534905, -0.3558287, 0, 1, 0.1411765, 1,
-0.3292316, 0.7838026, 0.9340795, 0, 1, 0.1490196, 1,
-0.3282215, -0.4741734, -1.994466, 0, 1, 0.1529412, 1,
-0.3252405, 1.107663, 0.8886921, 0, 1, 0.1607843, 1,
-0.3245263, -0.6231008, -2.668314, 0, 1, 0.1647059, 1,
-0.3220533, -1.436009, -2.305809, 0, 1, 0.172549, 1,
-0.3165651, -0.9550409, -1.208193, 0, 1, 0.1764706, 1,
-0.3094351, 0.9995528, -0.4171418, 0, 1, 0.1843137, 1,
-0.3073932, 0.1604787, -1.831387, 0, 1, 0.1882353, 1,
-0.3070055, -0.1207164, -2.982366, 0, 1, 0.1960784, 1,
-0.3069213, -0.2601902, -5.09552, 0, 1, 0.2039216, 1,
-0.3044941, 0.07185969, -0.7709774, 0, 1, 0.2078431, 1,
-0.3038993, 0.1443174, -3.625006, 0, 1, 0.2156863, 1,
-0.3020279, -0.8294202, -1.952303, 0, 1, 0.2196078, 1,
-0.3019319, -2.131645, -3.496085, 0, 1, 0.227451, 1,
-0.3017805, 0.782465, -1.800963, 0, 1, 0.2313726, 1,
-0.3005936, -0.8312165, -1.677814, 0, 1, 0.2392157, 1,
-0.3001239, -0.1472156, 0.03421788, 0, 1, 0.2431373, 1,
-0.299875, 1.612303, 0.09188346, 0, 1, 0.2509804, 1,
-0.2973764, 0.7526522, -1.310798, 0, 1, 0.254902, 1,
-0.2967093, 0.6314666, -1.178844, 0, 1, 0.2627451, 1,
-0.2964606, -0.2413365, -1.134903, 0, 1, 0.2666667, 1,
-0.2902847, -0.3759338, -3.769608, 0, 1, 0.2745098, 1,
-0.2888122, 0.9326326, -2.089927, 0, 1, 0.2784314, 1,
-0.2818677, -0.9987202, -1.858767, 0, 1, 0.2862745, 1,
-0.2811384, -1.02158, -3.353422, 0, 1, 0.2901961, 1,
-0.2782706, -0.005951904, -0.9901868, 0, 1, 0.2980392, 1,
-0.27781, -1.266952, -3.90517, 0, 1, 0.3058824, 1,
-0.2764325, 0.03129582, -2.796953, 0, 1, 0.3098039, 1,
-0.2684402, 1.774556, 0.9997249, 0, 1, 0.3176471, 1,
-0.2679051, -0.3664345, -1.478424, 0, 1, 0.3215686, 1,
-0.2666664, -1.504532, -1.840389, 0, 1, 0.3294118, 1,
-0.2666221, 1.26937, 1.075539, 0, 1, 0.3333333, 1,
-0.262993, 1.171155, -1.380664, 0, 1, 0.3411765, 1,
-0.260689, 0.1377248, -2.787608, 0, 1, 0.345098, 1,
-0.2562675, 0.6988069, 0.7202968, 0, 1, 0.3529412, 1,
-0.2554688, -1.382525, -4.306401, 0, 1, 0.3568628, 1,
-0.2535086, -0.5701141, -3.381666, 0, 1, 0.3647059, 1,
-0.2532665, 0.002510899, -1.885877, 0, 1, 0.3686275, 1,
-0.2528572, 0.8378149, 0.2127454, 0, 1, 0.3764706, 1,
-0.2496896, -0.2621543, -3.74782, 0, 1, 0.3803922, 1,
-0.2492374, -0.1409732, -2.32577, 0, 1, 0.3882353, 1,
-0.2474864, -0.3796008, -2.480565, 0, 1, 0.3921569, 1,
-0.2459133, -0.7767958, -3.929099, 0, 1, 0.4, 1,
-0.2438791, -0.3050315, -1.681928, 0, 1, 0.4078431, 1,
-0.2437941, 1.605785, -0.3119404, 0, 1, 0.4117647, 1,
-0.243712, 1.341428, -1.423691, 0, 1, 0.4196078, 1,
-0.2378413, -0.8602708, -2.583318, 0, 1, 0.4235294, 1,
-0.2377779, 0.7907669, 0.2936184, 0, 1, 0.4313726, 1,
-0.2376723, 0.1594175, -1.654477, 0, 1, 0.4352941, 1,
-0.2366599, -1.532328, -3.114318, 0, 1, 0.4431373, 1,
-0.2338182, -0.1688936, -2.734429, 0, 1, 0.4470588, 1,
-0.2274746, -0.2201466, -1.992559, 0, 1, 0.454902, 1,
-0.2266381, -0.06383231, -1.861783, 0, 1, 0.4588235, 1,
-0.2249116, 0.8796185, 0.2780701, 0, 1, 0.4666667, 1,
-0.2178929, -0.1056601, -2.898308, 0, 1, 0.4705882, 1,
-0.2174346, -0.1861529, -2.462664, 0, 1, 0.4784314, 1,
-0.2140685, 0.214445, -1.447192, 0, 1, 0.4823529, 1,
-0.2099044, -0.875665, -4.348277, 0, 1, 0.4901961, 1,
-0.2084949, 2.239799, -1.823581, 0, 1, 0.4941176, 1,
-0.2084609, -0.06951856, -1.21058, 0, 1, 0.5019608, 1,
-0.2076272, -0.891049, -4.439681, 0, 1, 0.509804, 1,
-0.2055031, -1.28114, -1.193875, 0, 1, 0.5137255, 1,
-0.2048389, 0.9532463, -0.7438809, 0, 1, 0.5215687, 1,
-0.2035369, -0.1908313, -2.846512, 0, 1, 0.5254902, 1,
-0.2030857, 0.3637179, -0.1175364, 0, 1, 0.5333334, 1,
-0.2025473, -0.484843, -2.439909, 0, 1, 0.5372549, 1,
-0.1976651, -0.5507971, -3.312597, 0, 1, 0.5450981, 1,
-0.1962109, 0.9463735, 1.362828, 0, 1, 0.5490196, 1,
-0.193964, -1.097854, -1.802538, 0, 1, 0.5568628, 1,
-0.191476, 0.5507708, -0.2870037, 0, 1, 0.5607843, 1,
-0.1903138, 1.339149, -2.049658, 0, 1, 0.5686275, 1,
-0.1894307, 1.365225, -0.9829386, 0, 1, 0.572549, 1,
-0.1872254, 0.8908765, -0.6741971, 0, 1, 0.5803922, 1,
-0.1802747, -0.02088883, -0.302287, 0, 1, 0.5843138, 1,
-0.1797974, -0.8128663, -1.693049, 0, 1, 0.5921569, 1,
-0.1793543, 0.09986272, -0.5604905, 0, 1, 0.5960785, 1,
-0.1783074, -0.8238252, -3.702037, 0, 1, 0.6039216, 1,
-0.1779281, -0.09745635, -4.926635, 0, 1, 0.6117647, 1,
-0.1726667, -1.125445, -4.095655, 0, 1, 0.6156863, 1,
-0.171914, 0.4221579, 0.09545165, 0, 1, 0.6235294, 1,
-0.1670673, -0.03479602, -3.057032, 0, 1, 0.627451, 1,
-0.156261, 2.558054, 1.528691, 0, 1, 0.6352941, 1,
-0.1560742, 1.475195, -1.076198, 0, 1, 0.6392157, 1,
-0.1554352, -0.6818639, -4.562598, 0, 1, 0.6470588, 1,
-0.1491173, 0.217873, -1.155207, 0, 1, 0.6509804, 1,
-0.1468565, -0.02669866, -2.053355, 0, 1, 0.6588235, 1,
-0.1441459, -1.349725, -2.60809, 0, 1, 0.6627451, 1,
-0.1436746, -0.9647579, -2.01656, 0, 1, 0.6705883, 1,
-0.1419179, -0.3982001, -2.50329, 0, 1, 0.6745098, 1,
-0.1394681, 1.354073, -0.4495133, 0, 1, 0.682353, 1,
-0.1391785, -0.360364, -3.224017, 0, 1, 0.6862745, 1,
-0.1369076, 1.160259, 0.3447607, 0, 1, 0.6941177, 1,
-0.1358573, 0.391889, 0.833456, 0, 1, 0.7019608, 1,
-0.1343665, 0.504113, 0.2696024, 0, 1, 0.7058824, 1,
-0.1313, 2.050058, -1.178932, 0, 1, 0.7137255, 1,
-0.1287722, -0.1116466, -2.295105, 0, 1, 0.7176471, 1,
-0.1262731, -0.9163384, -1.998682, 0, 1, 0.7254902, 1,
-0.1250862, -0.5620782, -4.637984, 0, 1, 0.7294118, 1,
-0.1235308, 0.1377955, -0.3609268, 0, 1, 0.7372549, 1,
-0.1231258, -1.051117, -3.068063, 0, 1, 0.7411765, 1,
-0.1226435, -1.928138, -2.34747, 0, 1, 0.7490196, 1,
-0.1192844, -1.582074, -4.396058, 0, 1, 0.7529412, 1,
-0.1177395, 0.1543692, -0.7823782, 0, 1, 0.7607843, 1,
-0.1084405, 0.2692875, 0.7747313, 0, 1, 0.7647059, 1,
-0.1072723, 0.614885, -0.5387796, 0, 1, 0.772549, 1,
-0.1033702, -0.03452668, -2.964371, 0, 1, 0.7764706, 1,
-0.1010977, -1.251774, -4.131094, 0, 1, 0.7843137, 1,
-0.1006148, -0.8176223, -2.793964, 0, 1, 0.7882353, 1,
-0.09837178, 1.218951, 0.7515044, 0, 1, 0.7960784, 1,
-0.09813695, -0.5861134, -2.449791, 0, 1, 0.8039216, 1,
-0.09683741, -1.822997, -2.57753, 0, 1, 0.8078431, 1,
-0.0963229, 1.038582, 0.5100119, 0, 1, 0.8156863, 1,
-0.09322791, -0.9847263, -0.7606371, 0, 1, 0.8196079, 1,
-0.09072023, -2.379775, -3.592093, 0, 1, 0.827451, 1,
-0.08903585, -1.362977, -3.732289, 0, 1, 0.8313726, 1,
-0.08344525, 1.266434, -0.4570617, 0, 1, 0.8392157, 1,
-0.08039532, 0.05683911, -0.5612187, 0, 1, 0.8431373, 1,
-0.07502162, 0.5147084, 0.5560624, 0, 1, 0.8509804, 1,
-0.0724085, 0.9756021, -1.061794, 0, 1, 0.854902, 1,
-0.07237002, -0.4209158, -3.029383, 0, 1, 0.8627451, 1,
-0.06857742, -1.086618, -0.9385931, 0, 1, 0.8666667, 1,
-0.06606768, -1.729071, -3.873863, 0, 1, 0.8745098, 1,
-0.06551472, 1.561679, -0.07667854, 0, 1, 0.8784314, 1,
-0.06396373, -1.474846, -4.119482, 0, 1, 0.8862745, 1,
-0.06173042, 0.6055903, -0.7262068, 0, 1, 0.8901961, 1,
-0.05547401, 1.391191, -0.6441563, 0, 1, 0.8980392, 1,
-0.0513482, -0.09516663, -3.686706, 0, 1, 0.9058824, 1,
-0.04914951, 1.52295, -1.54311, 0, 1, 0.9098039, 1,
-0.04569763, 1.427697, -0.9490119, 0, 1, 0.9176471, 1,
-0.04521216, -0.4714748, -2.118228, 0, 1, 0.9215686, 1,
-0.04468917, 0.610247, -0.6227554, 0, 1, 0.9294118, 1,
-0.0375205, 0.4890477, 1.15254, 0, 1, 0.9333333, 1,
-0.03489495, -0.1248894, -0.4267344, 0, 1, 0.9411765, 1,
-0.03415437, 0.8740055, 1.316326, 0, 1, 0.945098, 1,
-0.03328243, -1.619308, -3.255486, 0, 1, 0.9529412, 1,
-0.02831163, 0.7393853, -0.3171934, 0, 1, 0.9568627, 1,
-0.02704147, 0.1460832, -0.2300214, 0, 1, 0.9647059, 1,
-0.02669785, -1.509128, -1.801482, 0, 1, 0.9686275, 1,
-0.02640192, -0.7849405, -1.712103, 0, 1, 0.9764706, 1,
-0.02607642, -0.2716261, -1.891894, 0, 1, 0.9803922, 1,
-0.02307842, 1.948266, 0.233019, 0, 1, 0.9882353, 1,
-0.02151712, 1.382927, -1.405051, 0, 1, 0.9921569, 1,
-0.02081953, 0.3469392, -1.012399, 0, 1, 1, 1,
-0.02062603, 0.02366772, -1.758765, 0, 0.9921569, 1, 1,
-0.01889619, 1.376477, -0.02275956, 0, 0.9882353, 1, 1,
-0.01279699, -0.4128784, -1.078368, 0, 0.9803922, 1, 1,
-0.007415227, -1.100551, -1.127161, 0, 0.9764706, 1, 1,
0.005267145, -0.64118, 3.641235, 0, 0.9686275, 1, 1,
0.01181679, 0.03934326, 0.7950462, 0, 0.9647059, 1, 1,
0.01335985, 0.4208074, -0.4902287, 0, 0.9568627, 1, 1,
0.01630848, 1.214833, -1.30256, 0, 0.9529412, 1, 1,
0.01973666, 0.2936024, 0.541342, 0, 0.945098, 1, 1,
0.02019493, 0.0185878, 4.203494, 0, 0.9411765, 1, 1,
0.02127808, -1.38222, 3.305233, 0, 0.9333333, 1, 1,
0.02226136, -0.02386304, 1.158985, 0, 0.9294118, 1, 1,
0.02573811, 1.459395, -0.3558862, 0, 0.9215686, 1, 1,
0.03516074, -0.1020072, 4.824175, 0, 0.9176471, 1, 1,
0.0355613, 1.545399, 0.974179, 0, 0.9098039, 1, 1,
0.03914297, -0.6833318, 1.90655, 0, 0.9058824, 1, 1,
0.04298596, 0.27572, 0.2922724, 0, 0.8980392, 1, 1,
0.04902573, 1.540457, -0.2621828, 0, 0.8901961, 1, 1,
0.05075897, -0.7423422, 2.816428, 0, 0.8862745, 1, 1,
0.05348863, 0.6002008, 0.939266, 0, 0.8784314, 1, 1,
0.05781803, 1.504022, 0.8159231, 0, 0.8745098, 1, 1,
0.06026802, 2.045381, -2.262825, 0, 0.8666667, 1, 1,
0.06793974, -1.131727, 2.923468, 0, 0.8627451, 1, 1,
0.06820855, -1.499622, 3.316059, 0, 0.854902, 1, 1,
0.06924395, -0.6436502, 3.722317, 0, 0.8509804, 1, 1,
0.06937187, -0.4174742, 3.218553, 0, 0.8431373, 1, 1,
0.07379685, -0.8811127, 4.423765, 0, 0.8392157, 1, 1,
0.07615437, -0.4989185, 2.968982, 0, 0.8313726, 1, 1,
0.07868832, 0.6042503, 1.036685, 0, 0.827451, 1, 1,
0.07887615, 0.4124664, 2.425315, 0, 0.8196079, 1, 1,
0.08156867, 0.1893418, 1.200088, 0, 0.8156863, 1, 1,
0.08487882, -1.467429, 2.662378, 0, 0.8078431, 1, 1,
0.0855067, -0.8192769, 3.499902, 0, 0.8039216, 1, 1,
0.08823627, -1.110703, 5.38494, 0, 0.7960784, 1, 1,
0.08823702, 0.6675332, 1.584144, 0, 0.7882353, 1, 1,
0.09091199, -0.2011269, 1.948172, 0, 0.7843137, 1, 1,
0.09218383, -0.8513638, 3.995406, 0, 0.7764706, 1, 1,
0.09457856, -1.676387, 2.643942, 0, 0.772549, 1, 1,
0.09671494, 1.561864, -0.06297781, 0, 0.7647059, 1, 1,
0.09986547, 1.267658, -0.1770936, 0, 0.7607843, 1, 1,
0.1010517, 0.2770184, 0.509232, 0, 0.7529412, 1, 1,
0.1034774, 0.7892704, -1.128626, 0, 0.7490196, 1, 1,
0.1045031, -0.0009134084, -0.3841215, 0, 0.7411765, 1, 1,
0.104658, 1.190182, 0.6970718, 0, 0.7372549, 1, 1,
0.1054044, -0.1864704, 2.73615, 0, 0.7294118, 1, 1,
0.1064328, -0.05626519, 1.681903, 0, 0.7254902, 1, 1,
0.10721, -3.098243, 1.943606, 0, 0.7176471, 1, 1,
0.1073142, 0.4060414, -1.157018, 0, 0.7137255, 1, 1,
0.1086434, 1.328153, 0.680918, 0, 0.7058824, 1, 1,
0.1130603, 0.5833235, -0.3416421, 0, 0.6980392, 1, 1,
0.1141748, -0.9547287, 2.076327, 0, 0.6941177, 1, 1,
0.1159981, -0.4221151, 3.280081, 0, 0.6862745, 1, 1,
0.1161401, -0.07822561, 3.570179, 0, 0.682353, 1, 1,
0.1166017, 0.01812867, 3.145703, 0, 0.6745098, 1, 1,
0.119564, -0.7665654, 2.336274, 0, 0.6705883, 1, 1,
0.1244601, -0.8957458, 3.741643, 0, 0.6627451, 1, 1,
0.1270484, 1.700806, -0.727072, 0, 0.6588235, 1, 1,
0.132048, 0.4275479, 0.7464239, 0, 0.6509804, 1, 1,
0.1322929, 0.5276175, -0.1449559, 0, 0.6470588, 1, 1,
0.1331114, 0.4128452, 0.3426143, 0, 0.6392157, 1, 1,
0.1334599, -1.228478, 2.730498, 0, 0.6352941, 1, 1,
0.1336735, -2.065728, 1.863156, 0, 0.627451, 1, 1,
0.1378356, -0.1501351, 3.724591, 0, 0.6235294, 1, 1,
0.139597, -0.3831922, 1.843805, 0, 0.6156863, 1, 1,
0.1399229, -0.5618283, 3.332035, 0, 0.6117647, 1, 1,
0.1520783, 1.465377, 0.1962707, 0, 0.6039216, 1, 1,
0.153975, 0.7994931, 0.3697295, 0, 0.5960785, 1, 1,
0.1564968, -0.2820722, 2.183966, 0, 0.5921569, 1, 1,
0.1567597, -0.2556789, 3.702942, 0, 0.5843138, 1, 1,
0.1640978, 1.448507, -0.2966318, 0, 0.5803922, 1, 1,
0.1674011, 1.520327, 0.958882, 0, 0.572549, 1, 1,
0.170562, -0.5161253, 2.955393, 0, 0.5686275, 1, 1,
0.1738673, -0.7060387, 1.195258, 0, 0.5607843, 1, 1,
0.1830546, 0.659717, 0.1822746, 0, 0.5568628, 1, 1,
0.1899984, -0.7563616, 2.911046, 0, 0.5490196, 1, 1,
0.1914923, 1.553166, -0.1995306, 0, 0.5450981, 1, 1,
0.1941717, 0.2683975, 0.6080751, 0, 0.5372549, 1, 1,
0.1943333, -0.7895784, 4.054415, 0, 0.5333334, 1, 1,
0.1956681, -0.08630706, 1.719509, 0, 0.5254902, 1, 1,
0.2042367, 0.03876155, 0.4028876, 0, 0.5215687, 1, 1,
0.2069607, -1.237972, 2.884048, 0, 0.5137255, 1, 1,
0.2089395, 0.701411, 0.7797392, 0, 0.509804, 1, 1,
0.2137796, 1.308363, -0.4293025, 0, 0.5019608, 1, 1,
0.215252, 0.1627574, 2.583432, 0, 0.4941176, 1, 1,
0.2194073, -0.8401489, 2.69568, 0, 0.4901961, 1, 1,
0.2244507, -1.492769, 3.883934, 0, 0.4823529, 1, 1,
0.2252989, 0.1098202, -0.6615559, 0, 0.4784314, 1, 1,
0.2333823, 1.565372, 0.2903651, 0, 0.4705882, 1, 1,
0.2357132, -0.8912951, 3.010752, 0, 0.4666667, 1, 1,
0.236546, -1.102191, 2.429152, 0, 0.4588235, 1, 1,
0.2405303, 1.801399, 0.1762582, 0, 0.454902, 1, 1,
0.2410688, 0.3686122, 2.060157, 0, 0.4470588, 1, 1,
0.2505866, 1.41834, -0.7505674, 0, 0.4431373, 1, 1,
0.2526517, 0.9000276, 1.171339, 0, 0.4352941, 1, 1,
0.2542175, -0.1867, 0.8669147, 0, 0.4313726, 1, 1,
0.2609711, -0.8613476, 2.12108, 0, 0.4235294, 1, 1,
0.264923, -1.288295, 3.872753, 0, 0.4196078, 1, 1,
0.2675499, -0.2847736, 1.466695, 0, 0.4117647, 1, 1,
0.2700221, 0.1994416, 1.601743, 0, 0.4078431, 1, 1,
0.2733614, 1.129791, 0.2356085, 0, 0.4, 1, 1,
0.2755831, -0.6226734, 1.046686, 0, 0.3921569, 1, 1,
0.2769462, 0.7405248, -0.6109481, 0, 0.3882353, 1, 1,
0.2769933, -0.08390488, 2.27684, 0, 0.3803922, 1, 1,
0.2794624, 0.06539708, 1.934927, 0, 0.3764706, 1, 1,
0.2799846, 0.9354156, 1.050392, 0, 0.3686275, 1, 1,
0.2840063, -0.2168678, 2.899361, 0, 0.3647059, 1, 1,
0.2841946, 0.5296866, 0.2315077, 0, 0.3568628, 1, 1,
0.2968341, 0.0213415, 1.551579, 0, 0.3529412, 1, 1,
0.3007372, -0.2876583, 1.006983, 0, 0.345098, 1, 1,
0.3007679, -2.820669, 2.892715, 0, 0.3411765, 1, 1,
0.301149, 0.1421345, 1.15898, 0, 0.3333333, 1, 1,
0.3075449, 0.8350018, -1.307744, 0, 0.3294118, 1, 1,
0.3138107, 0.1609005, 1.06199, 0, 0.3215686, 1, 1,
0.3155752, 0.7517637, 2.541468, 0, 0.3176471, 1, 1,
0.3159176, -0.286697, 3.2438, 0, 0.3098039, 1, 1,
0.3166995, -0.03698418, 2.72343, 0, 0.3058824, 1, 1,
0.3187768, -1.380945, 2.966501, 0, 0.2980392, 1, 1,
0.3249703, -0.5558224, 2.613248, 0, 0.2901961, 1, 1,
0.3295592, 0.1450822, 2.753459, 0, 0.2862745, 1, 1,
0.3305902, 1.379928, 1.212204, 0, 0.2784314, 1, 1,
0.337109, -1.280012, 3.400607, 0, 0.2745098, 1, 1,
0.3401999, -0.08961825, 1.15468, 0, 0.2666667, 1, 1,
0.3424159, -2.812354, 2.749154, 0, 0.2627451, 1, 1,
0.3467537, 0.3641154, 0.7527901, 0, 0.254902, 1, 1,
0.3473784, 1.615761, -0.3604662, 0, 0.2509804, 1, 1,
0.3482184, -0.1448968, 1.484624, 0, 0.2431373, 1, 1,
0.3488367, -1.065808, 2.889705, 0, 0.2392157, 1, 1,
0.3492195, -0.3949461, 4.047138, 0, 0.2313726, 1, 1,
0.3508347, 0.7460036, 1.049704, 0, 0.227451, 1, 1,
0.3520537, -1.136919, 3.603497, 0, 0.2196078, 1, 1,
0.3538343, 0.4699043, -0.5775901, 0, 0.2156863, 1, 1,
0.3626514, 0.7624621, -0.8489059, 0, 0.2078431, 1, 1,
0.3630492, 0.5749375, 0.2664493, 0, 0.2039216, 1, 1,
0.3632358, -0.2191991, 3.245424, 0, 0.1960784, 1, 1,
0.3691664, 1.986711, 2.174025, 0, 0.1882353, 1, 1,
0.3699093, 0.7122653, -0.01110513, 0, 0.1843137, 1, 1,
0.3706169, 2.123895, -0.2439289, 0, 0.1764706, 1, 1,
0.3743146, -1.579008, 3.006729, 0, 0.172549, 1, 1,
0.374775, -0.7536186, 2.047176, 0, 0.1647059, 1, 1,
0.3748963, 0.2305446, 0.6878306, 0, 0.1607843, 1, 1,
0.3822044, 0.5174222, -1.366703, 0, 0.1529412, 1, 1,
0.3843657, -0.493113, 3.090405, 0, 0.1490196, 1, 1,
0.3858066, 0.5120764, 0.0260786, 0, 0.1411765, 1, 1,
0.3882078, 0.8435693, 0.005485084, 0, 0.1372549, 1, 1,
0.3937271, 0.1358997, -0.08164196, 0, 0.1294118, 1, 1,
0.3937769, -1.380129, 2.00247, 0, 0.1254902, 1, 1,
0.3955393, -0.5035303, 3.844748, 0, 0.1176471, 1, 1,
0.3989513, -0.975518, 3.380595, 0, 0.1137255, 1, 1,
0.4000331, 1.01519, 2.117081, 0, 0.1058824, 1, 1,
0.4025204, 1.166705, 0.149, 0, 0.09803922, 1, 1,
0.4035396, -0.3533638, 1.903923, 0, 0.09411765, 1, 1,
0.4054814, -1.355016, 2.443658, 0, 0.08627451, 1, 1,
0.4123613, -1.198165, 2.305103, 0, 0.08235294, 1, 1,
0.4229064, -0.3728088, 2.238775, 0, 0.07450981, 1, 1,
0.4262612, 0.4513025, 0.4999434, 0, 0.07058824, 1, 1,
0.428132, -2.506582, 6.128532, 0, 0.0627451, 1, 1,
0.4309105, -0.3236628, 1.249268, 0, 0.05882353, 1, 1,
0.4336574, 1.011842, 0.5720801, 0, 0.05098039, 1, 1,
0.4345191, -0.679782, 3.319408, 0, 0.04705882, 1, 1,
0.4349118, 1.727421, -0.1579293, 0, 0.03921569, 1, 1,
0.4376619, 0.4054531, 0.1863326, 0, 0.03529412, 1, 1,
0.4415297, 0.6640588, 0.7953447, 0, 0.02745098, 1, 1,
0.4424984, -1.41079, 3.128486, 0, 0.02352941, 1, 1,
0.4480721, 0.2673727, 2.460882, 0, 0.01568628, 1, 1,
0.4484608, -0.7070527, 3.436752, 0, 0.01176471, 1, 1,
0.45292, 1.006393, 0.1685869, 0, 0.003921569, 1, 1,
0.4538869, -0.05976043, 1.442072, 0.003921569, 0, 1, 1,
0.4572174, 1.259002, 2.349786, 0.007843138, 0, 1, 1,
0.4578259, 0.3069535, 0.3804318, 0.01568628, 0, 1, 1,
0.4578918, 0.3997554, 2.065888, 0.01960784, 0, 1, 1,
0.4583411, 0.04665041, 0.189615, 0.02745098, 0, 1, 1,
0.4610495, 0.0655721, -0.5643759, 0.03137255, 0, 1, 1,
0.4615415, -0.07627723, 1.43544, 0.03921569, 0, 1, 1,
0.4635557, 0.2327434, 0.3739222, 0.04313726, 0, 1, 1,
0.4655725, -0.1029807, 1.132669, 0.05098039, 0, 1, 1,
0.4674675, -0.2076923, 2.524439, 0.05490196, 0, 1, 1,
0.4683301, 0.5264956, 0.4947746, 0.0627451, 0, 1, 1,
0.4701304, 1.02316, -0.1991221, 0.06666667, 0, 1, 1,
0.4728343, 0.3695599, 1.792039, 0.07450981, 0, 1, 1,
0.47584, -0.49876, 2.071894, 0.07843138, 0, 1, 1,
0.4766349, -0.07649194, 2.181022, 0.08627451, 0, 1, 1,
0.4841746, 1.724742, -0.3818652, 0.09019608, 0, 1, 1,
0.4862154, 0.5850366, 1.773131, 0.09803922, 0, 1, 1,
0.4865552, -0.5629284, 2.04252, 0.1058824, 0, 1, 1,
0.4909012, -0.9526519, 1.143269, 0.1098039, 0, 1, 1,
0.4921686, 0.1102889, 1.364761, 0.1176471, 0, 1, 1,
0.4949709, -1.326713, 3.041781, 0.1215686, 0, 1, 1,
0.4967999, 0.2888937, 0.7016348, 0.1294118, 0, 1, 1,
0.4974404, 0.5806885, -0.2107684, 0.1333333, 0, 1, 1,
0.5018458, 0.5262466, 2.199157, 0.1411765, 0, 1, 1,
0.5063125, -0.2026621, 2.139702, 0.145098, 0, 1, 1,
0.5133685, -1.270209, 3.171975, 0.1529412, 0, 1, 1,
0.5134895, -0.7084403, 2.543466, 0.1568628, 0, 1, 1,
0.5187554, 0.115656, 1.46234, 0.1647059, 0, 1, 1,
0.5202225, 0.04178293, 3.198149, 0.1686275, 0, 1, 1,
0.5221316, -0.7860899, 2.522556, 0.1764706, 0, 1, 1,
0.5280999, 0.2111147, 0.1779026, 0.1803922, 0, 1, 1,
0.5294046, -0.302653, 2.638965, 0.1882353, 0, 1, 1,
0.5297326, 0.4407765, -0.2565842, 0.1921569, 0, 1, 1,
0.5305376, 0.1137987, 2.869138, 0.2, 0, 1, 1,
0.5322157, -0.2146809, 2.228477, 0.2078431, 0, 1, 1,
0.5335004, 0.2822366, 0.755217, 0.2117647, 0, 1, 1,
0.5357485, -2.157451, 3.612161, 0.2196078, 0, 1, 1,
0.53804, -1.134961, 4.178717, 0.2235294, 0, 1, 1,
0.5390592, -0.8884686, 2.297702, 0.2313726, 0, 1, 1,
0.5486064, 0.6021396, -1.184853, 0.2352941, 0, 1, 1,
0.5607269, 1.283497, -1.470317, 0.2431373, 0, 1, 1,
0.5633601, 0.9791192, 1.090304, 0.2470588, 0, 1, 1,
0.5699565, 2.033512, 0.9777321, 0.254902, 0, 1, 1,
0.5750827, 0.9760185, 1.501994, 0.2588235, 0, 1, 1,
0.5755982, 0.09793577, 1.98276, 0.2666667, 0, 1, 1,
0.5766275, 0.0997619, 2.092068, 0.2705882, 0, 1, 1,
0.5823087, 0.09847713, 2.2717, 0.2784314, 0, 1, 1,
0.5896764, -0.0365832, 0.8986165, 0.282353, 0, 1, 1,
0.5912033, -0.6595339, 3.382298, 0.2901961, 0, 1, 1,
0.5919265, 0.3324101, 0.5767493, 0.2941177, 0, 1, 1,
0.5927524, 0.2985974, 2.105031, 0.3019608, 0, 1, 1,
0.5934117, 0.04402545, 1.565594, 0.3098039, 0, 1, 1,
0.5958071, 2.360233, 0.6390139, 0.3137255, 0, 1, 1,
0.60218, 1.844335, -1.131558, 0.3215686, 0, 1, 1,
0.6074791, -0.6886809, 3.993957, 0.3254902, 0, 1, 1,
0.6086254, -0.1266237, 2.639674, 0.3333333, 0, 1, 1,
0.623036, -0.3932587, -0.008710984, 0.3372549, 0, 1, 1,
0.6239029, -1.530133, 2.1135, 0.345098, 0, 1, 1,
0.6266336, -1.800118, 1.573478, 0.3490196, 0, 1, 1,
0.6339294, 1.801878, -1.376742, 0.3568628, 0, 1, 1,
0.6358517, -0.3919153, 3.545274, 0.3607843, 0, 1, 1,
0.6389499, 0.2462285, 1.135217, 0.3686275, 0, 1, 1,
0.6396006, 2.842498, 1.159328, 0.372549, 0, 1, 1,
0.6417941, -0.9239774, 0.6963396, 0.3803922, 0, 1, 1,
0.6419951, 0.1261296, 2.207004, 0.3843137, 0, 1, 1,
0.6431832, -0.2145912, 1.06656, 0.3921569, 0, 1, 1,
0.6461407, -1.930163, 2.920543, 0.3960784, 0, 1, 1,
0.6489063, 0.8921422, 0.8423668, 0.4039216, 0, 1, 1,
0.6597247, 0.4987641, 0.2383176, 0.4117647, 0, 1, 1,
0.6711338, -0.04583468, 2.590027, 0.4156863, 0, 1, 1,
0.685006, 1.335497, -0.3462078, 0.4235294, 0, 1, 1,
0.688205, 2.791209, -0.9237927, 0.427451, 0, 1, 1,
0.6925721, -0.5976443, 1.206206, 0.4352941, 0, 1, 1,
0.6957511, 0.5724923, 1.192569, 0.4392157, 0, 1, 1,
0.6961113, -1.339061, 4.760953, 0.4470588, 0, 1, 1,
0.7044834, 1.687576, 0.3844288, 0.4509804, 0, 1, 1,
0.7081187, -1.521236, 3.676531, 0.4588235, 0, 1, 1,
0.7086416, -0.8145161, 2.418811, 0.4627451, 0, 1, 1,
0.7099235, -0.2897566, 2.572713, 0.4705882, 0, 1, 1,
0.7122745, 2.033823, 1.677558, 0.4745098, 0, 1, 1,
0.7123785, 2.300361, 0.1520049, 0.4823529, 0, 1, 1,
0.7166504, 0.3816175, 1.195834, 0.4862745, 0, 1, 1,
0.7234286, -0.05439607, 0.4833755, 0.4941176, 0, 1, 1,
0.7236108, -1.139341, 3.856022, 0.5019608, 0, 1, 1,
0.7250764, -1.5926, 1.08957, 0.5058824, 0, 1, 1,
0.727694, -0.6371506, 1.630842, 0.5137255, 0, 1, 1,
0.7306194, 0.1969133, 0.7190518, 0.5176471, 0, 1, 1,
0.73287, 0.7208357, 1.452426, 0.5254902, 0, 1, 1,
0.7330323, 1.896133, -0.4458778, 0.5294118, 0, 1, 1,
0.7374521, 0.3777027, 0.7059925, 0.5372549, 0, 1, 1,
0.7384684, 0.2177285, 0.8938507, 0.5411765, 0, 1, 1,
0.7395862, -0.8721998, 1.811787, 0.5490196, 0, 1, 1,
0.740153, 0.7399987, -0.4524278, 0.5529412, 0, 1, 1,
0.7402107, 0.02762893, 0.8977085, 0.5607843, 0, 1, 1,
0.7422395, 0.4431141, -0.6795964, 0.5647059, 0, 1, 1,
0.7427, 0.5348919, 1.98206, 0.572549, 0, 1, 1,
0.7448472, -0.6113161, 3.561879, 0.5764706, 0, 1, 1,
0.7450159, 0.7845953, 1.98221, 0.5843138, 0, 1, 1,
0.7450445, 1.354783, 0.2694393, 0.5882353, 0, 1, 1,
0.7453541, 0.946556, -0.3329384, 0.5960785, 0, 1, 1,
0.7465596, 0.4022038, 1.531239, 0.6039216, 0, 1, 1,
0.746657, 0.5734114, 1.49415, 0.6078432, 0, 1, 1,
0.7504898, -1.007594, 1.566309, 0.6156863, 0, 1, 1,
0.7505952, 1.028707, -1.559719, 0.6196079, 0, 1, 1,
0.7577922, -0.6954114, 2.522423, 0.627451, 0, 1, 1,
0.7578766, -0.001897512, 0.0380978, 0.6313726, 0, 1, 1,
0.7623442, 0.9191109, -0.9258581, 0.6392157, 0, 1, 1,
0.7641349, -0.4464696, 2.056708, 0.6431373, 0, 1, 1,
0.7690777, -1.079293, 3.941077, 0.6509804, 0, 1, 1,
0.7749325, -0.4593535, 2.049248, 0.654902, 0, 1, 1,
0.7756656, 0.7326519, 1.247514, 0.6627451, 0, 1, 1,
0.7784355, 0.1553964, 1.971949, 0.6666667, 0, 1, 1,
0.7842465, 0.91054, 1.516429, 0.6745098, 0, 1, 1,
0.7908429, -1.142516, 2.017747, 0.6784314, 0, 1, 1,
0.7940355, -2.26764, 4.454954, 0.6862745, 0, 1, 1,
0.7967123, 0.2985974, 3.428648, 0.6901961, 0, 1, 1,
0.8030044, -1.133591, 3.865386, 0.6980392, 0, 1, 1,
0.8090389, -0.6784905, 2.869271, 0.7058824, 0, 1, 1,
0.8096732, -0.7606428, 3.827045, 0.7098039, 0, 1, 1,
0.8155627, -0.3943702, 0.5825567, 0.7176471, 0, 1, 1,
0.8235222, 0.7019641, 0.9225558, 0.7215686, 0, 1, 1,
0.8243404, -0.0948804, 1.898465, 0.7294118, 0, 1, 1,
0.8245832, 0.5532547, 1.235915, 0.7333333, 0, 1, 1,
0.8289262, -0.8436776, 4.227538, 0.7411765, 0, 1, 1,
0.8297678, 0.4113504, 0.9099209, 0.7450981, 0, 1, 1,
0.8300646, 0.2465601, 0.5343388, 0.7529412, 0, 1, 1,
0.8314336, -1.030338, 1.814064, 0.7568628, 0, 1, 1,
0.8343178, -1.254483, 1.969933, 0.7647059, 0, 1, 1,
0.8498524, -0.6482857, 3.273618, 0.7686275, 0, 1, 1,
0.8508231, -0.6089429, 1.926785, 0.7764706, 0, 1, 1,
0.8528442, 1.325848, 0.4485119, 0.7803922, 0, 1, 1,
0.8605892, -1.252782, 3.11507, 0.7882353, 0, 1, 1,
0.865731, 0.7365803, 1.867599, 0.7921569, 0, 1, 1,
0.8730301, 0.4431549, 1.648697, 0.8, 0, 1, 1,
0.8731689, -0.02802538, 1.603811, 0.8078431, 0, 1, 1,
0.8739832, 0.04767068, -0.7523966, 0.8117647, 0, 1, 1,
0.8782603, -0.4713104, 3.418118, 0.8196079, 0, 1, 1,
0.880141, 0.1976601, 1.832857, 0.8235294, 0, 1, 1,
0.890739, 2.454406, -0.9767355, 0.8313726, 0, 1, 1,
0.8947841, 0.2084673, 1.592686, 0.8352941, 0, 1, 1,
0.9028168, 0.4544332, -1.940716, 0.8431373, 0, 1, 1,
0.9041374, -1.513548, 0.8123193, 0.8470588, 0, 1, 1,
0.9051394, -1.183591, 3.36686, 0.854902, 0, 1, 1,
0.9068974, 1.841188, 0.3892709, 0.8588235, 0, 1, 1,
0.9090231, -2.033115, 2.257127, 0.8666667, 0, 1, 1,
0.9095795, 0.7664632, 1.313804, 0.8705882, 0, 1, 1,
0.911059, 1.028672, 0.1013516, 0.8784314, 0, 1, 1,
0.9174274, -1.017763, 2.506015, 0.8823529, 0, 1, 1,
0.9250915, -1.840042, 1.061764, 0.8901961, 0, 1, 1,
0.927036, 1.957971, 0.7321182, 0.8941177, 0, 1, 1,
0.9271182, -0.9418805, 2.549427, 0.9019608, 0, 1, 1,
0.9293955, 0.3219681, 1.532287, 0.9098039, 0, 1, 1,
0.9324261, 0.6254615, 1.15146, 0.9137255, 0, 1, 1,
0.9341936, 0.9313868, 1.413609, 0.9215686, 0, 1, 1,
0.9345114, -0.4585113, 0.1660002, 0.9254902, 0, 1, 1,
0.9378084, -0.3532785, 2.998505, 0.9333333, 0, 1, 1,
0.9388476, 0.5914239, 0.1336903, 0.9372549, 0, 1, 1,
0.9419208, -0.9261168, 2.882638, 0.945098, 0, 1, 1,
0.9486958, -0.7700576, 0.5536618, 0.9490196, 0, 1, 1,
0.9513365, -0.4807, 2.671451, 0.9568627, 0, 1, 1,
0.9552059, 0.1920327, 1.362032, 0.9607843, 0, 1, 1,
0.9591808, 0.542935, 1.429916, 0.9686275, 0, 1, 1,
0.9593729, -0.5006391, 2.328838, 0.972549, 0, 1, 1,
0.9613758, -0.6114348, 1.897873, 0.9803922, 0, 1, 1,
0.9652851, 2.417507, -0.2526351, 0.9843137, 0, 1, 1,
0.9768842, -0.1114282, 1.251324, 0.9921569, 0, 1, 1,
0.9828616, 2.169102, 1.414083, 0.9960784, 0, 1, 1,
0.9857656, -0.9108846, 1.065883, 1, 0, 0.9960784, 1,
0.9896457, -0.3446217, 1.130828, 1, 0, 0.9882353, 1,
0.9907019, -1.141264, 4.815805, 1, 0, 0.9843137, 1,
0.9908726, -0.4168772, 1.851041, 1, 0, 0.9764706, 1,
0.9909528, -1.706199, 2.179415, 1, 0, 0.972549, 1,
0.993196, 0.864535, 1.832109, 1, 0, 0.9647059, 1,
0.9938714, -0.3053497, 1.355528, 1, 0, 0.9607843, 1,
0.993957, -0.4385561, 2.721045, 1, 0, 0.9529412, 1,
0.9956661, 0.8457237, 0.8375329, 1, 0, 0.9490196, 1,
0.9963246, -1.657327, 3.343521, 1, 0, 0.9411765, 1,
1.003975, -0.3445866, 0.2716116, 1, 0, 0.9372549, 1,
1.004555, 2.716563, 1.351105, 1, 0, 0.9294118, 1,
1.005744, 0.1995403, 4.155416, 1, 0, 0.9254902, 1,
1.017884, -1.033056, 2.623159, 1, 0, 0.9176471, 1,
1.022536, -0.5104089, 1.934936, 1, 0, 0.9137255, 1,
1.027736, -0.121277, 0.8511617, 1, 0, 0.9058824, 1,
1.035129, -2.215431, 2.939902, 1, 0, 0.9019608, 1,
1.039248, -0.2903805, 0.1465408, 1, 0, 0.8941177, 1,
1.040361, 1.61205, 1.752596, 1, 0, 0.8862745, 1,
1.042289, 0.2551288, 0.9098498, 1, 0, 0.8823529, 1,
1.043133, -1.054682, 1.559527, 1, 0, 0.8745098, 1,
1.04992, 1.893076, 1.13024, 1, 0, 0.8705882, 1,
1.053675, -0.453462, 2.705163, 1, 0, 0.8627451, 1,
1.05519, 1.251064, 0.7026476, 1, 0, 0.8588235, 1,
1.057214, -0.8281246, 1.263189, 1, 0, 0.8509804, 1,
1.063781, -1.512205, 3.003001, 1, 0, 0.8470588, 1,
1.07734, 0.5260268, 2.407471, 1, 0, 0.8392157, 1,
1.08239, 0.6359353, 1.574065, 1, 0, 0.8352941, 1,
1.087066, -1.063421, 1.661686, 1, 0, 0.827451, 1,
1.08964, -0.2115962, 3.662801, 1, 0, 0.8235294, 1,
1.091731, 0.3872961, 1.137239, 1, 0, 0.8156863, 1,
1.092112, 1.050452, -0.9833668, 1, 0, 0.8117647, 1,
1.094769, -0.2030154, 0.2173066, 1, 0, 0.8039216, 1,
1.100519, -0.1352198, -0.2412976, 1, 0, 0.7960784, 1,
1.101055, -0.8009026, 3.339416, 1, 0, 0.7921569, 1,
1.10299, -0.3074887, 2.656354, 1, 0, 0.7843137, 1,
1.104853, -0.7235954, 2.219136, 1, 0, 0.7803922, 1,
1.105876, -1.895853, 3.300186, 1, 0, 0.772549, 1,
1.111299, 0.5481842, 0.7392884, 1, 0, 0.7686275, 1,
1.112246, -1.1782, 2.708943, 1, 0, 0.7607843, 1,
1.114881, 0.3829446, 2.689513, 1, 0, 0.7568628, 1,
1.116005, -0.1383658, 1.777258, 1, 0, 0.7490196, 1,
1.116199, -0.927927, 1.38719, 1, 0, 0.7450981, 1,
1.123455, 0.8775464, 1.383945, 1, 0, 0.7372549, 1,
1.126123, 0.06572899, 1.879171, 1, 0, 0.7333333, 1,
1.132615, -1.235291, 0.8433201, 1, 0, 0.7254902, 1,
1.140676, 0.7561581, 0.2307422, 1, 0, 0.7215686, 1,
1.1462, -0.3100537, 0.6588246, 1, 0, 0.7137255, 1,
1.152711, -0.1966153, 2.377806, 1, 0, 0.7098039, 1,
1.157968, -0.8346284, 3.081276, 1, 0, 0.7019608, 1,
1.162475, -0.4747819, 1.969568, 1, 0, 0.6941177, 1,
1.163129, 0.3022246, 1.795491, 1, 0, 0.6901961, 1,
1.175483, 0.1198248, 1.69048, 1, 0, 0.682353, 1,
1.180268, -1.035223, 1.431647, 1, 0, 0.6784314, 1,
1.182052, 1.312677, 0.264074, 1, 0, 0.6705883, 1,
1.184421, 1.547094, -0.6444958, 1, 0, 0.6666667, 1,
1.184769, -0.0991179, 1.296496, 1, 0, 0.6588235, 1,
1.200478, 0.01513899, 0.3213186, 1, 0, 0.654902, 1,
1.202151, -0.1402214, 0.435181, 1, 0, 0.6470588, 1,
1.205251, 2.359681, -0.7257292, 1, 0, 0.6431373, 1,
1.21192, 0.8653222, -0.7022346, 1, 0, 0.6352941, 1,
1.217653, -0.6711177, 1.494156, 1, 0, 0.6313726, 1,
1.218318, -0.9538977, 1.71189, 1, 0, 0.6235294, 1,
1.228693, 0.9932378, 0.8275529, 1, 0, 0.6196079, 1,
1.229702, -0.4259176, 2.221403, 1, 0, 0.6117647, 1,
1.230616, 0.1726005, 1.084775, 1, 0, 0.6078432, 1,
1.233218, 0.0979182, 0.01687343, 1, 0, 0.6, 1,
1.235136, -0.0211114, 2.547714, 1, 0, 0.5921569, 1,
1.238383, -0.422765, 1.957109, 1, 0, 0.5882353, 1,
1.240833, 1.842926, 0.3743946, 1, 0, 0.5803922, 1,
1.247834, -0.943041, 2.047226, 1, 0, 0.5764706, 1,
1.258327, -1.648613, 2.93797, 1, 0, 0.5686275, 1,
1.270383, -1.702303, 0.9669225, 1, 0, 0.5647059, 1,
1.272127, 0.8267207, 1.590367, 1, 0, 0.5568628, 1,
1.276251, -0.3034293, 2.454558, 1, 0, 0.5529412, 1,
1.278595, -1.945457, 3.616551, 1, 0, 0.5450981, 1,
1.283185, -0.1411991, 1.625175, 1, 0, 0.5411765, 1,
1.292095, -0.00701597, 2.518586, 1, 0, 0.5333334, 1,
1.298528, 2.310894, 0.4739755, 1, 0, 0.5294118, 1,
1.307711, 0.4123059, 2.002048, 1, 0, 0.5215687, 1,
1.309779, -1.384685, 0.5884702, 1, 0, 0.5176471, 1,
1.312921, 1.234126, 0.4263577, 1, 0, 0.509804, 1,
1.317465, -1.214907, 1.465262, 1, 0, 0.5058824, 1,
1.31859, -0.2958819, 3.786119, 1, 0, 0.4980392, 1,
1.325106, -0.3161571, 2.450816, 1, 0, 0.4901961, 1,
1.325836, -0.3368406, 1.624976, 1, 0, 0.4862745, 1,
1.331851, 0.4034247, 2.573529, 1, 0, 0.4784314, 1,
1.338172, 0.4374953, 3.67173, 1, 0, 0.4745098, 1,
1.361455, 1.828422, -0.0723506, 1, 0, 0.4666667, 1,
1.363133, -0.1440666, 1.349436, 1, 0, 0.4627451, 1,
1.367943, 1.098086, 1.389328, 1, 0, 0.454902, 1,
1.380612, -1.016212, 1.338064, 1, 0, 0.4509804, 1,
1.381699, -0.07374347, 0.7646845, 1, 0, 0.4431373, 1,
1.384224, 1.678195, 0.6128802, 1, 0, 0.4392157, 1,
1.393391, 0.9356056, 1.052449, 1, 0, 0.4313726, 1,
1.435516, 0.0452573, 1.398434, 1, 0, 0.427451, 1,
1.439778, -0.3569163, 2.863338, 1, 0, 0.4196078, 1,
1.44223, 0.7510368, 0.1263369, 1, 0, 0.4156863, 1,
1.444507, -0.2193286, 2.856223, 1, 0, 0.4078431, 1,
1.453389, 0.298737, 3.059897, 1, 0, 0.4039216, 1,
1.470983, -0.7231266, 2.3054, 1, 0, 0.3960784, 1,
1.472333, 1.952844, 0.3965531, 1, 0, 0.3882353, 1,
1.475786, 1.869899, 0.4850449, 1, 0, 0.3843137, 1,
1.507075, 0.3287254, 0.6931297, 1, 0, 0.3764706, 1,
1.510493, 0.6936067, 0.3891218, 1, 0, 0.372549, 1,
1.512117, 1.485477, 0.7636261, 1, 0, 0.3647059, 1,
1.514301, 1.094334, 1.530311, 1, 0, 0.3607843, 1,
1.52876, 0.5160593, 0.1776548, 1, 0, 0.3529412, 1,
1.528906, 0.3114241, -0.2642555, 1, 0, 0.3490196, 1,
1.539921, -0.2155374, -0.2095868, 1, 0, 0.3411765, 1,
1.545712, 0.9008868, -0.5116396, 1, 0, 0.3372549, 1,
1.555385, 0.9213133, 3.726021, 1, 0, 0.3294118, 1,
1.56106, -0.4064427, 2.473367, 1, 0, 0.3254902, 1,
1.574749, 0.7700704, 3.004264, 1, 0, 0.3176471, 1,
1.581406, 1.15102, 0.9811363, 1, 0, 0.3137255, 1,
1.584117, -0.3632559, 2.055581, 1, 0, 0.3058824, 1,
1.585799, 1.430449, -0.3903972, 1, 0, 0.2980392, 1,
1.600006, -0.756471, 0.7284539, 1, 0, 0.2941177, 1,
1.607589, 0.1272886, 0.6650882, 1, 0, 0.2862745, 1,
1.618728, -0.8010883, 1.857869, 1, 0, 0.282353, 1,
1.624628, 1.811431, 1.801625, 1, 0, 0.2745098, 1,
1.625416, 0.2317093, 1.139256, 1, 0, 0.2705882, 1,
1.64305, -0.0386257, 0.7642702, 1, 0, 0.2627451, 1,
1.645872, 1.922872, 0.2338097, 1, 0, 0.2588235, 1,
1.6483, 0.5134644, 3.145715, 1, 0, 0.2509804, 1,
1.651785, 0.5621971, 1.302033, 1, 0, 0.2470588, 1,
1.652815, 0.05539915, 2.275395, 1, 0, 0.2392157, 1,
1.679127, -1.901631, 2.713848, 1, 0, 0.2352941, 1,
1.689339, 0.4228334, 1.438249, 1, 0, 0.227451, 1,
1.691001, 1.268679, 1.416302, 1, 0, 0.2235294, 1,
1.718657, 0.2659024, -0.07790139, 1, 0, 0.2156863, 1,
1.726908, 2.039418, 1.178316, 1, 0, 0.2117647, 1,
1.76368, 1.607031, -1.656661, 1, 0, 0.2039216, 1,
1.773135, -1.299614, 1.99457, 1, 0, 0.1960784, 1,
1.77688, 0.002666711, 0.3623896, 1, 0, 0.1921569, 1,
1.805739, 0.02171157, 2.170584, 1, 0, 0.1843137, 1,
1.81778, 0.1223799, 2.189507, 1, 0, 0.1803922, 1,
1.82, 0.9422455, 0.4621087, 1, 0, 0.172549, 1,
1.888952, 0.796276, 2.332244, 1, 0, 0.1686275, 1,
1.897701, 0.6623712, 2.46226, 1, 0, 0.1607843, 1,
1.904719, -0.5133929, 1.510314, 1, 0, 0.1568628, 1,
1.94607, 0.4744403, 1.859397, 1, 0, 0.1490196, 1,
1.971493, -0.4233304, 3.670427, 1, 0, 0.145098, 1,
1.985528, -0.4748612, 0.7936115, 1, 0, 0.1372549, 1,
1.987502, -1.51799, 1.461017, 1, 0, 0.1333333, 1,
2.001093, 0.3208438, 2.066484, 1, 0, 0.1254902, 1,
2.011147, -0.6168223, 3.461819, 1, 0, 0.1215686, 1,
2.014279, 0.5243654, 0.4677171, 1, 0, 0.1137255, 1,
2.018896, -1.032623, 1.875613, 1, 0, 0.1098039, 1,
2.047196, -0.8760761, 1.606611, 1, 0, 0.1019608, 1,
2.114351, -1.036577, 1.804281, 1, 0, 0.09411765, 1,
2.126816, 0.2223453, 1.944001, 1, 0, 0.09019608, 1,
2.208788, -0.9151782, 1.02111, 1, 0, 0.08235294, 1,
2.211115, -0.8430569, 1.348939, 1, 0, 0.07843138, 1,
2.252442, -1.433455, 3.142812, 1, 0, 0.07058824, 1,
2.257562, -2.156677, 2.981379, 1, 0, 0.06666667, 1,
2.280747, 1.312745, 1.047107, 1, 0, 0.05882353, 1,
2.296935, -0.8247336, 2.424482, 1, 0, 0.05490196, 1,
2.402206, 1.201228, 0.4923506, 1, 0, 0.04705882, 1,
2.405288, -0.7016136, 2.219994, 1, 0, 0.04313726, 1,
2.418024, 1.324955, -0.8031859, 1, 0, 0.03529412, 1,
2.439637, 1.309618, 2.55356, 1, 0, 0.03137255, 1,
2.446776, 1.26817, 2.190711, 1, 0, 0.02352941, 1,
2.650683, 1.882021, 0.8886889, 1, 0, 0.01960784, 1,
2.666453, 0.4734598, 1.062386, 1, 0, 0.01176471, 1,
3.341895, -1.512284, 2.193931, 1, 0, 0.007843138, 1
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
-0.09997952, -4.149757, -8.401057, 0, -0.5, 0.5, 0.5,
-0.09997952, -4.149757, -8.401057, 1, -0.5, 0.5, 0.5,
-0.09997952, -4.149757, -8.401057, 1, 1.5, 0.5, 0.5,
-0.09997952, -4.149757, -8.401057, 0, 1.5, 0.5, 0.5
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
-4.708649, 0.003568053, -8.401057, 0, -0.5, 0.5, 0.5,
-4.708649, 0.003568053, -8.401057, 1, -0.5, 0.5, 0.5,
-4.708649, 0.003568053, -8.401057, 1, 1.5, 0.5, 0.5,
-4.708649, 0.003568053, -8.401057, 0, 1.5, 0.5, 0.5
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
-4.708649, -4.149757, -0.08334899, 0, -0.5, 0.5, 0.5,
-4.708649, -4.149757, -0.08334899, 1, -0.5, 0.5, 0.5,
-4.708649, -4.149757, -0.08334899, 1, 1.5, 0.5, 0.5,
-4.708649, -4.149757, -0.08334899, 0, 1.5, 0.5, 0.5
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
-3, -3.191298, -6.481586,
3, -3.191298, -6.481586,
-3, -3.191298, -6.481586,
-3, -3.351041, -6.801498,
-2, -3.191298, -6.481586,
-2, -3.351041, -6.801498,
-1, -3.191298, -6.481586,
-1, -3.351041, -6.801498,
0, -3.191298, -6.481586,
0, -3.351041, -6.801498,
1, -3.191298, -6.481586,
1, -3.351041, -6.801498,
2, -3.191298, -6.481586,
2, -3.351041, -6.801498,
3, -3.191298, -6.481586,
3, -3.351041, -6.801498
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
-3, -3.670528, -7.441322, 0, -0.5, 0.5, 0.5,
-3, -3.670528, -7.441322, 1, -0.5, 0.5, 0.5,
-3, -3.670528, -7.441322, 1, 1.5, 0.5, 0.5,
-3, -3.670528, -7.441322, 0, 1.5, 0.5, 0.5,
-2, -3.670528, -7.441322, 0, -0.5, 0.5, 0.5,
-2, -3.670528, -7.441322, 1, -0.5, 0.5, 0.5,
-2, -3.670528, -7.441322, 1, 1.5, 0.5, 0.5,
-2, -3.670528, -7.441322, 0, 1.5, 0.5, 0.5,
-1, -3.670528, -7.441322, 0, -0.5, 0.5, 0.5,
-1, -3.670528, -7.441322, 1, -0.5, 0.5, 0.5,
-1, -3.670528, -7.441322, 1, 1.5, 0.5, 0.5,
-1, -3.670528, -7.441322, 0, 1.5, 0.5, 0.5,
0, -3.670528, -7.441322, 0, -0.5, 0.5, 0.5,
0, -3.670528, -7.441322, 1, -0.5, 0.5, 0.5,
0, -3.670528, -7.441322, 1, 1.5, 0.5, 0.5,
0, -3.670528, -7.441322, 0, 1.5, 0.5, 0.5,
1, -3.670528, -7.441322, 0, -0.5, 0.5, 0.5,
1, -3.670528, -7.441322, 1, -0.5, 0.5, 0.5,
1, -3.670528, -7.441322, 1, 1.5, 0.5, 0.5,
1, -3.670528, -7.441322, 0, 1.5, 0.5, 0.5,
2, -3.670528, -7.441322, 0, -0.5, 0.5, 0.5,
2, -3.670528, -7.441322, 1, -0.5, 0.5, 0.5,
2, -3.670528, -7.441322, 1, 1.5, 0.5, 0.5,
2, -3.670528, -7.441322, 0, 1.5, 0.5, 0.5,
3, -3.670528, -7.441322, 0, -0.5, 0.5, 0.5,
3, -3.670528, -7.441322, 1, -0.5, 0.5, 0.5,
3, -3.670528, -7.441322, 1, 1.5, 0.5, 0.5,
3, -3.670528, -7.441322, 0, 1.5, 0.5, 0.5
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
-3.64511, -3, -6.481586,
-3.64511, 3, -6.481586,
-3.64511, -3, -6.481586,
-3.822367, -3, -6.801498,
-3.64511, -2, -6.481586,
-3.822367, -2, -6.801498,
-3.64511, -1, -6.481586,
-3.822367, -1, -6.801498,
-3.64511, 0, -6.481586,
-3.822367, 0, -6.801498,
-3.64511, 1, -6.481586,
-3.822367, 1, -6.801498,
-3.64511, 2, -6.481586,
-3.822367, 2, -6.801498,
-3.64511, 3, -6.481586,
-3.822367, 3, -6.801498
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
-4.17688, -3, -7.441322, 0, -0.5, 0.5, 0.5,
-4.17688, -3, -7.441322, 1, -0.5, 0.5, 0.5,
-4.17688, -3, -7.441322, 1, 1.5, 0.5, 0.5,
-4.17688, -3, -7.441322, 0, 1.5, 0.5, 0.5,
-4.17688, -2, -7.441322, 0, -0.5, 0.5, 0.5,
-4.17688, -2, -7.441322, 1, -0.5, 0.5, 0.5,
-4.17688, -2, -7.441322, 1, 1.5, 0.5, 0.5,
-4.17688, -2, -7.441322, 0, 1.5, 0.5, 0.5,
-4.17688, -1, -7.441322, 0, -0.5, 0.5, 0.5,
-4.17688, -1, -7.441322, 1, -0.5, 0.5, 0.5,
-4.17688, -1, -7.441322, 1, 1.5, 0.5, 0.5,
-4.17688, -1, -7.441322, 0, 1.5, 0.5, 0.5,
-4.17688, 0, -7.441322, 0, -0.5, 0.5, 0.5,
-4.17688, 0, -7.441322, 1, -0.5, 0.5, 0.5,
-4.17688, 0, -7.441322, 1, 1.5, 0.5, 0.5,
-4.17688, 0, -7.441322, 0, 1.5, 0.5, 0.5,
-4.17688, 1, -7.441322, 0, -0.5, 0.5, 0.5,
-4.17688, 1, -7.441322, 1, -0.5, 0.5, 0.5,
-4.17688, 1, -7.441322, 1, 1.5, 0.5, 0.5,
-4.17688, 1, -7.441322, 0, 1.5, 0.5, 0.5,
-4.17688, 2, -7.441322, 0, -0.5, 0.5, 0.5,
-4.17688, 2, -7.441322, 1, -0.5, 0.5, 0.5,
-4.17688, 2, -7.441322, 1, 1.5, 0.5, 0.5,
-4.17688, 2, -7.441322, 0, 1.5, 0.5, 0.5,
-4.17688, 3, -7.441322, 0, -0.5, 0.5, 0.5,
-4.17688, 3, -7.441322, 1, -0.5, 0.5, 0.5,
-4.17688, 3, -7.441322, 1, 1.5, 0.5, 0.5,
-4.17688, 3, -7.441322, 0, 1.5, 0.5, 0.5
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
-3.64511, -3.191298, -6,
-3.64511, -3.191298, 6,
-3.64511, -3.191298, -6,
-3.822367, -3.351041, -6,
-3.64511, -3.191298, -4,
-3.822367, -3.351041, -4,
-3.64511, -3.191298, -2,
-3.822367, -3.351041, -2,
-3.64511, -3.191298, 0,
-3.822367, -3.351041, 0,
-3.64511, -3.191298, 2,
-3.822367, -3.351041, 2,
-3.64511, -3.191298, 4,
-3.822367, -3.351041, 4,
-3.64511, -3.191298, 6,
-3.822367, -3.351041, 6
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
-4.17688, -3.670528, -6, 0, -0.5, 0.5, 0.5,
-4.17688, -3.670528, -6, 1, -0.5, 0.5, 0.5,
-4.17688, -3.670528, -6, 1, 1.5, 0.5, 0.5,
-4.17688, -3.670528, -6, 0, 1.5, 0.5, 0.5,
-4.17688, -3.670528, -4, 0, -0.5, 0.5, 0.5,
-4.17688, -3.670528, -4, 1, -0.5, 0.5, 0.5,
-4.17688, -3.670528, -4, 1, 1.5, 0.5, 0.5,
-4.17688, -3.670528, -4, 0, 1.5, 0.5, 0.5,
-4.17688, -3.670528, -2, 0, -0.5, 0.5, 0.5,
-4.17688, -3.670528, -2, 1, -0.5, 0.5, 0.5,
-4.17688, -3.670528, -2, 1, 1.5, 0.5, 0.5,
-4.17688, -3.670528, -2, 0, 1.5, 0.5, 0.5,
-4.17688, -3.670528, 0, 0, -0.5, 0.5, 0.5,
-4.17688, -3.670528, 0, 1, -0.5, 0.5, 0.5,
-4.17688, -3.670528, 0, 1, 1.5, 0.5, 0.5,
-4.17688, -3.670528, 0, 0, 1.5, 0.5, 0.5,
-4.17688, -3.670528, 2, 0, -0.5, 0.5, 0.5,
-4.17688, -3.670528, 2, 1, -0.5, 0.5, 0.5,
-4.17688, -3.670528, 2, 1, 1.5, 0.5, 0.5,
-4.17688, -3.670528, 2, 0, 1.5, 0.5, 0.5,
-4.17688, -3.670528, 4, 0, -0.5, 0.5, 0.5,
-4.17688, -3.670528, 4, 1, -0.5, 0.5, 0.5,
-4.17688, -3.670528, 4, 1, 1.5, 0.5, 0.5,
-4.17688, -3.670528, 4, 0, 1.5, 0.5, 0.5,
-4.17688, -3.670528, 6, 0, -0.5, 0.5, 0.5,
-4.17688, -3.670528, 6, 1, -0.5, 0.5, 0.5,
-4.17688, -3.670528, 6, 1, 1.5, 0.5, 0.5,
-4.17688, -3.670528, 6, 0, 1.5, 0.5, 0.5
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
-3.64511, -3.191298, -6.481586,
-3.64511, 3.198434, -6.481586,
-3.64511, -3.191298, 6.314888,
-3.64511, 3.198434, 6.314888,
-3.64511, -3.191298, -6.481586,
-3.64511, -3.191298, 6.314888,
-3.64511, 3.198434, -6.481586,
-3.64511, 3.198434, 6.314888,
-3.64511, -3.191298, -6.481586,
3.445151, -3.191298, -6.481586,
-3.64511, -3.191298, 6.314888,
3.445151, -3.191298, 6.314888,
-3.64511, 3.198434, -6.481586,
3.445151, 3.198434, -6.481586,
-3.64511, 3.198434, 6.314888,
3.445151, 3.198434, 6.314888,
3.445151, -3.191298, -6.481586,
3.445151, 3.198434, -6.481586,
3.445151, -3.191298, 6.314888,
3.445151, 3.198434, 6.314888,
3.445151, -3.191298, -6.481586,
3.445151, -3.191298, 6.314888,
3.445151, 3.198434, -6.481586,
3.445151, 3.198434, 6.314888
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
var radius = 8.524482;
var distance = 37.92638;
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
mvMatrix.translate( 0.09997952, -0.003568053, 0.08334899 );
mvMatrix.scale( 1.299929, 1.442445, 0.7202637 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.92638);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
pyrazole-5-carboxami<-read.table("pyrazole-5-carboxami.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pyrazole-5-carboxami$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyrazole' not found
```

```r
y<-pyrazole-5-carboxami$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyrazole' not found
```

```r
z<-pyrazole-5-carboxami$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyrazole' not found
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
-3.541854, 1.336115, -2.478822, 0, 0, 1, 1, 1,
-3.13693, 0.02919324, -2.207957, 1, 0, 0, 1, 1,
-3.116943, -0.4226969, -0.2854549, 1, 0, 0, 1, 1,
-3.039821, -0.893926, -2.503847, 1, 0, 0, 1, 1,
-2.804999, 1.234292, -1.350724, 1, 0, 0, 1, 1,
-2.52504, 0.6430021, 0.01066938, 1, 0, 0, 1, 1,
-2.49621, -1.839304, -1.710945, 0, 0, 0, 1, 1,
-2.441282, 1.536897, -1.426551, 0, 0, 0, 1, 1,
-2.399552, 1.009768, -1.562226, 0, 0, 0, 1, 1,
-2.388953, -0.9967945, -0.8803802, 0, 0, 0, 1, 1,
-2.370222, -0.05830954, -3.2521, 0, 0, 0, 1, 1,
-2.274973, 0.6545905, -0.6507983, 0, 0, 0, 1, 1,
-2.166812, -0.3685525, -2.546519, 0, 0, 0, 1, 1,
-2.145144, -0.5992287, -2.681449, 1, 1, 1, 1, 1,
-2.127445, -0.4408135, -1.046061, 1, 1, 1, 1, 1,
-2.122744, -0.7331041, -1.186776, 1, 1, 1, 1, 1,
-2.095133, 0.4123566, -3.38332, 1, 1, 1, 1, 1,
-2.072492, 0.4807694, -2.630616, 1, 1, 1, 1, 1,
-2.033532, -1.383252, -1.635778, 1, 1, 1, 1, 1,
-2.017834, 0.9438413, 0.8495385, 1, 1, 1, 1, 1,
-2.017081, 0.8332327, -1.892334, 1, 1, 1, 1, 1,
-2.009263, -0.778466, -1.620866, 1, 1, 1, 1, 1,
-1.9993, 0.07785137, -1.070542, 1, 1, 1, 1, 1,
-1.984135, -0.8243871, -1.35205, 1, 1, 1, 1, 1,
-1.982264, -0.7814636, -1.071425, 1, 1, 1, 1, 1,
-1.960002, 0.9040226, -0.318967, 1, 1, 1, 1, 1,
-1.958519, -0.8787885, -1.774066, 1, 1, 1, 1, 1,
-1.948903, 0.1712922, -1.836237, 1, 1, 1, 1, 1,
-1.929375, 0.376866, -1.049083, 0, 0, 1, 1, 1,
-1.908201, 0.9418184, -0.9255478, 1, 0, 0, 1, 1,
-1.90401, -0.5640607, -2.437728, 1, 0, 0, 1, 1,
-1.886262, -0.1624998, -1.9799, 1, 0, 0, 1, 1,
-1.872668, -0.2023369, -0.1006436, 1, 0, 0, 1, 1,
-1.86902, -2.308869, -1.65216, 1, 0, 0, 1, 1,
-1.847984, -0.9063981, -2.363991, 0, 0, 0, 1, 1,
-1.833427, -0.4353875, -0.6492558, 0, 0, 0, 1, 1,
-1.813287, 1.002257, -1.284567, 0, 0, 0, 1, 1,
-1.800543, 0.1972883, -1.094041, 0, 0, 0, 1, 1,
-1.777748, -0.4230842, -1.258505, 0, 0, 0, 1, 1,
-1.759902, 1.144426, -0.1696182, 0, 0, 0, 1, 1,
-1.748394, 2.036305, 1.322299, 0, 0, 0, 1, 1,
-1.739647, 0.841058, -1.051983, 1, 1, 1, 1, 1,
-1.732573, -0.05634954, -2.141731, 1, 1, 1, 1, 1,
-1.731305, 0.624402, -0.9181676, 1, 1, 1, 1, 1,
-1.71865, -0.5794038, -2.509303, 1, 1, 1, 1, 1,
-1.716547, 0.06766846, -1.029914, 1, 1, 1, 1, 1,
-1.714607, 0.6653038, -2.070772, 1, 1, 1, 1, 1,
-1.710213, 0.6542981, -0.3460942, 1, 1, 1, 1, 1,
-1.695647, -0.4566872, -2.711711, 1, 1, 1, 1, 1,
-1.682199, -0.3174681, -2.729753, 1, 1, 1, 1, 1,
-1.6802, 1.367578, -1.691975, 1, 1, 1, 1, 1,
-1.679131, -1.097356, -3.209991, 1, 1, 1, 1, 1,
-1.673209, -0.5311471, -2.646184, 1, 1, 1, 1, 1,
-1.671399, -2.880852, -3.406183, 1, 1, 1, 1, 1,
-1.667592, -0.3877639, -0.9583484, 1, 1, 1, 1, 1,
-1.638834, 0.3300254, -0.8386045, 1, 1, 1, 1, 1,
-1.63878, 0.06095547, -3.34264, 0, 0, 1, 1, 1,
-1.627412, -0.0838303, -2.049229, 1, 0, 0, 1, 1,
-1.606678, 1.348079, -0.2072664, 1, 0, 0, 1, 1,
-1.604118, -1.653937, 0.2557736, 1, 0, 0, 1, 1,
-1.591031, 0.04929092, -2.425033, 1, 0, 0, 1, 1,
-1.582656, 0.4739283, 0.1235517, 1, 0, 0, 1, 1,
-1.574731, 0.9413553, -2.368791, 0, 0, 0, 1, 1,
-1.568455, 0.6575142, -1.268089, 0, 0, 0, 1, 1,
-1.568317, -1.509084, -3.941525, 0, 0, 0, 1, 1,
-1.553626, -0.116749, -0.8353356, 0, 0, 0, 1, 1,
-1.548286, 0.1684915, -2.502757, 0, 0, 0, 1, 1,
-1.546763, -0.03761942, -1.075527, 0, 0, 0, 1, 1,
-1.541081, 1.074857, -1.642937, 0, 0, 0, 1, 1,
-1.53892, 0.1842007, 0.0550597, 1, 1, 1, 1, 1,
-1.534004, -1.654461, -0.6790347, 1, 1, 1, 1, 1,
-1.530474, 0.6517128, -0.3189946, 1, 1, 1, 1, 1,
-1.525155, -2.301493, -2.485146, 1, 1, 1, 1, 1,
-1.521104, 0.2521694, -2.045687, 1, 1, 1, 1, 1,
-1.517153, -0.507493, -3.091, 1, 1, 1, 1, 1,
-1.516896, -0.8695437, -2.963502, 1, 1, 1, 1, 1,
-1.505196, 0.7375496, -1.043181, 1, 1, 1, 1, 1,
-1.486971, 0.5372061, -1.488398, 1, 1, 1, 1, 1,
-1.469081, -0.426193, -2.517716, 1, 1, 1, 1, 1,
-1.463209, -0.00611077, -1.697085, 1, 1, 1, 1, 1,
-1.456196, 0.682035, -1.434081, 1, 1, 1, 1, 1,
-1.444797, -1.99448, -2.940244, 1, 1, 1, 1, 1,
-1.438656, -1.296784, -1.735785, 1, 1, 1, 1, 1,
-1.438449, 1.09352, -2.007495, 1, 1, 1, 1, 1,
-1.438252, 1.028872, -1.390569, 0, 0, 1, 1, 1,
-1.427999, 0.01216103, 0.09870957, 1, 0, 0, 1, 1,
-1.424085, -0.03239259, 0.1938624, 1, 0, 0, 1, 1,
-1.420748, -1.641364, -2.204828, 1, 0, 0, 1, 1,
-1.371931, -0.6676842, -3.092965, 1, 0, 0, 1, 1,
-1.371254, 0.7534364, -0.386943, 1, 0, 0, 1, 1,
-1.369015, 0.635066, -1.723492, 0, 0, 0, 1, 1,
-1.367992, -1.639248, -0.8473403, 0, 0, 0, 1, 1,
-1.36083, -0.4637938, 0.2707236, 0, 0, 0, 1, 1,
-1.356477, -0.7662833, -4.692788, 0, 0, 0, 1, 1,
-1.348881, -0.6923245, -3.581565, 0, 0, 0, 1, 1,
-1.345867, -0.266304, -0.172642, 0, 0, 0, 1, 1,
-1.336317, 0.6477521, -1.054063, 0, 0, 0, 1, 1,
-1.335505, 0.1025762, -2.724416, 1, 1, 1, 1, 1,
-1.322084, 0.3065645, -1.243275, 1, 1, 1, 1, 1,
-1.321238, -0.0517739, -1.448551, 1, 1, 1, 1, 1,
-1.320564, 2.38393, -1.021842, 1, 1, 1, 1, 1,
-1.301542, 0.6129975, -1.261015, 1, 1, 1, 1, 1,
-1.298433, 0.4356504, -0.5809451, 1, 1, 1, 1, 1,
-1.298138, -1.651017, -2.370462, 1, 1, 1, 1, 1,
-1.29751, 0.5177373, -1.057844, 1, 1, 1, 1, 1,
-1.294891, -0.2242307, -2.00796, 1, 1, 1, 1, 1,
-1.275999, -1.246185, -2.082777, 1, 1, 1, 1, 1,
-1.264303, -0.3019917, -3.278568, 1, 1, 1, 1, 1,
-1.263339, -0.9884617, -2.97403, 1, 1, 1, 1, 1,
-1.262323, 0.8509718, -2.103964, 1, 1, 1, 1, 1,
-1.247751, 0.4081888, 0.1438998, 1, 1, 1, 1, 1,
-1.237062, -0.206038, -2.515977, 1, 1, 1, 1, 1,
-1.234006, 0.2661184, -0.7669154, 0, 0, 1, 1, 1,
-1.232823, 0.4299996, -0.7710996, 1, 0, 0, 1, 1,
-1.231121, -0.3994779, -1.36553, 1, 0, 0, 1, 1,
-1.215753, -0.08366124, -3.730497, 1, 0, 0, 1, 1,
-1.20831, -1.162632, -2.619585, 1, 0, 0, 1, 1,
-1.185781, -0.1235852, -2.236868, 1, 0, 0, 1, 1,
-1.185136, -0.5779156, -2.716456, 0, 0, 0, 1, 1,
-1.170768, -0.1525941, -4.647529, 0, 0, 0, 1, 1,
-1.169073, 0.4341891, -0.9211618, 0, 0, 0, 1, 1,
-1.15874, -0.8301882, -2.029046, 0, 0, 0, 1, 1,
-1.147848, 0.1461403, -2.292367, 0, 0, 0, 1, 1,
-1.142709, 0.3812805, -2.416365, 0, 0, 0, 1, 1,
-1.123752, -1.830015, -3.491785, 0, 0, 0, 1, 1,
-1.119284, 0.5837963, 2.008752, 1, 1, 1, 1, 1,
-1.118808, -0.0003433829, -1.354885, 1, 1, 1, 1, 1,
-1.115946, -0.6070287, -2.519815, 1, 1, 1, 1, 1,
-1.113839, 1.520884, -1.794835, 1, 1, 1, 1, 1,
-1.089925, 0.5534917, -1.393001, 1, 1, 1, 1, 1,
-1.081421, -1.233249, -1.968079, 1, 1, 1, 1, 1,
-1.07929, 1.446335, -1.074156, 1, 1, 1, 1, 1,
-1.070394, 0.8626807, -1.478226, 1, 1, 1, 1, 1,
-1.063602, -0.8552627, -1.989812, 1, 1, 1, 1, 1,
-1.060843, 0.1691028, -0.7050308, 1, 1, 1, 1, 1,
-1.052462, -0.0940903, -2.015507, 1, 1, 1, 1, 1,
-1.051375, 0.004365929, -1.856714, 1, 1, 1, 1, 1,
-1.046875, -2.019709, -2.082408, 1, 1, 1, 1, 1,
-1.046298, -0.5875723, -2.112105, 1, 1, 1, 1, 1,
-1.041426, -1.002471, -1.58426, 1, 1, 1, 1, 1,
-1.039314, -0.8245974, -1.288377, 0, 0, 1, 1, 1,
-1.020664, 1.051463, -1.690548, 1, 0, 0, 1, 1,
-1.01608, 0.4593972, -0.03534047, 1, 0, 0, 1, 1,
-1.012098, -1.824625, -3.159571, 1, 0, 0, 1, 1,
-1.006751, -0.02522998, -2.398354, 1, 0, 0, 1, 1,
-0.9823915, -1.003194, -3.350852, 1, 0, 0, 1, 1,
-0.9738181, 1.26324, 0.3364102, 0, 0, 0, 1, 1,
-0.9645469, 0.7861208, -0.9034815, 0, 0, 0, 1, 1,
-0.9638456, -0.6810744, -1.715946, 0, 0, 0, 1, 1,
-0.9623519, -0.176679, -0.8288959, 0, 0, 0, 1, 1,
-0.96029, -0.1478662, -2.099969, 0, 0, 0, 1, 1,
-0.953802, 1.13302, -0.6656345, 0, 0, 0, 1, 1,
-0.9514358, 0.2724852, -2.877379, 0, 0, 0, 1, 1,
-0.9437446, -0.7568514, -2.686948, 1, 1, 1, 1, 1,
-0.932421, 0.729837, -0.8270969, 1, 1, 1, 1, 1,
-0.9300417, -0.3133724, -2.500813, 1, 1, 1, 1, 1,
-0.925272, 0.623682, -2.290968, 1, 1, 1, 1, 1,
-0.9248213, -0.9985389, -4.238099, 1, 1, 1, 1, 1,
-0.9214736, 0.244432, -2.352525, 1, 1, 1, 1, 1,
-0.9106643, -0.1092911, 0.2133367, 1, 1, 1, 1, 1,
-0.9100749, 1.641692, 0.4448526, 1, 1, 1, 1, 1,
-0.890542, -1.270414, -2.133153, 1, 1, 1, 1, 1,
-0.8904794, -1.929981, -2.724635, 1, 1, 1, 1, 1,
-0.8881176, -0.935981, -3.391311, 1, 1, 1, 1, 1,
-0.883806, 1.181125, -2.375845, 1, 1, 1, 1, 1,
-0.8794605, -0.9699357, -2.417529, 1, 1, 1, 1, 1,
-0.8706126, -0.4079087, -2.223597, 1, 1, 1, 1, 1,
-0.8697973, -0.2903546, -1.416526, 1, 1, 1, 1, 1,
-0.8675147, 0.340723, -1.82385, 0, 0, 1, 1, 1,
-0.8616312, -0.4216759, -2.160464, 1, 0, 0, 1, 1,
-0.8559107, 0.110034, -1.838514, 1, 0, 0, 1, 1,
-0.8508654, 0.1083873, -0.9338805, 1, 0, 0, 1, 1,
-0.849815, 0.5970198, 0.9681194, 1, 0, 0, 1, 1,
-0.8489659, 0.4078702, -0.8210528, 1, 0, 0, 1, 1,
-0.8489479, -1.434076, -3.145973, 0, 0, 0, 1, 1,
-0.8466234, -1.268988, -1.489035, 0, 0, 0, 1, 1,
-0.8442407, 0.261574, -1.058648, 0, 0, 0, 1, 1,
-0.8412336, 0.7549806, -1.674619, 0, 0, 0, 1, 1,
-0.8376817, 0.1245414, -1.224363, 0, 0, 0, 1, 1,
-0.8274601, -1.234023, -2.30853, 0, 0, 0, 1, 1,
-0.8243271, 1.14962, 0.19509, 0, 0, 0, 1, 1,
-0.8234436, -0.468824, -1.535716, 1, 1, 1, 1, 1,
-0.8157482, 1.02165, -2.471411, 1, 1, 1, 1, 1,
-0.806657, -0.6944509, -1.86748, 1, 1, 1, 1, 1,
-0.8063169, -0.752804, -1.261107, 1, 1, 1, 1, 1,
-0.8046911, 0.2344557, -1.390713, 1, 1, 1, 1, 1,
-0.801976, -0.1320132, -1.307194, 1, 1, 1, 1, 1,
-0.801006, 1.047889, 0.1012639, 1, 1, 1, 1, 1,
-0.7984884, 0.7018571, -0.4584092, 1, 1, 1, 1, 1,
-0.7915837, -0.8863813, -2.016917, 1, 1, 1, 1, 1,
-0.788206, -1.194429, -2.847631, 1, 1, 1, 1, 1,
-0.7875249, -0.4281957, -3.206007, 1, 1, 1, 1, 1,
-0.7797741, -1.441858, -3.637088, 1, 1, 1, 1, 1,
-0.7786966, 0.3158517, -1.196009, 1, 1, 1, 1, 1,
-0.7740621, -1.047155, -2.349516, 1, 1, 1, 1, 1,
-0.7732435, 0.2039981, -1.487548, 1, 1, 1, 1, 1,
-0.7713618, 0.7603037, -0.2745762, 0, 0, 1, 1, 1,
-0.771341, -0.5145009, -2.706234, 1, 0, 0, 1, 1,
-0.7560634, 0.7041503, -0.5932015, 1, 0, 0, 1, 1,
-0.7552819, -0.5619549, -1.845293, 1, 0, 0, 1, 1,
-0.7512163, -0.2916038, -0.1818491, 1, 0, 0, 1, 1,
-0.7500083, -0.6888053, -3.996492, 1, 0, 0, 1, 1,
-0.7477148, -1.435769, -1.468242, 0, 0, 0, 1, 1,
-0.7445939, -0.3778288, -2.390077, 0, 0, 0, 1, 1,
-0.7440547, 0.235402, -1.718608, 0, 0, 0, 1, 1,
-0.7413958, -1.0691, -3.67827, 0, 0, 0, 1, 1,
-0.7403897, 0.511512, -2.173844, 0, 0, 0, 1, 1,
-0.7397016, 0.2443382, 0.03835763, 0, 0, 0, 1, 1,
-0.7356299, -1.196346, -1.703305, 0, 0, 0, 1, 1,
-0.7347988, 0.756103, -1.442074, 1, 1, 1, 1, 1,
-0.7333322, 0.9569473, -2.084455, 1, 1, 1, 1, 1,
-0.7328431, 3.10538, 0.3623944, 1, 1, 1, 1, 1,
-0.7292748, 0.1379792, 0.327149, 1, 1, 1, 1, 1,
-0.7271274, 0.5932523, -0.542512, 1, 1, 1, 1, 1,
-0.725916, 0.6661688, -2.121037, 1, 1, 1, 1, 1,
-0.7195473, -0.9615068, -2.342735, 1, 1, 1, 1, 1,
-0.717777, -0.7673571, -4.608813, 1, 1, 1, 1, 1,
-0.7167975, 1.501311, -2.304272, 1, 1, 1, 1, 1,
-0.715107, 0.1119018, -2.239551, 1, 1, 1, 1, 1,
-0.7133137, -0.16248, -2.09136, 1, 1, 1, 1, 1,
-0.7071362, -0.3212937, -0.8074548, 1, 1, 1, 1, 1,
-0.6981673, -1.488182, -4.007699, 1, 1, 1, 1, 1,
-0.6969715, -1.282678, -2.517454, 1, 1, 1, 1, 1,
-0.6924921, 0.05842525, -1.114085, 1, 1, 1, 1, 1,
-0.690952, -0.5558672, -1.819941, 0, 0, 1, 1, 1,
-0.6876199, -1.663099, -2.90161, 1, 0, 0, 1, 1,
-0.6874075, -0.2866583, 0.0455089, 1, 0, 0, 1, 1,
-0.6858904, 0.9133626, -0.71132, 1, 0, 0, 1, 1,
-0.6849334, -0.583991, -0.977675, 1, 0, 0, 1, 1,
-0.6765832, -0.5971029, -2.828081, 1, 0, 0, 1, 1,
-0.675221, -1.044109, -2.355854, 0, 0, 0, 1, 1,
-0.6742629, 0.3933907, -1.633973, 0, 0, 0, 1, 1,
-0.6726022, -0.05443871, -1.320299, 0, 0, 0, 1, 1,
-0.6703661, 0.4122966, 0.6481167, 0, 0, 0, 1, 1,
-0.6688175, 0.3994153, -2.077011, 0, 0, 0, 1, 1,
-0.6603429, -0.09941953, -4.876194, 0, 0, 0, 1, 1,
-0.6586376, 0.9534162, 0.2871465, 0, 0, 0, 1, 1,
-0.6577169, 2.017243, 0.3093954, 1, 1, 1, 1, 1,
-0.6526642, -0.1216871, -3.279598, 1, 1, 1, 1, 1,
-0.6519748, -1.41517, -3.10166, 1, 1, 1, 1, 1,
-0.6494661, 1.230917, 0.5952648, 1, 1, 1, 1, 1,
-0.6439092, 1.28169, -1.108705, 1, 1, 1, 1, 1,
-0.6398611, -0.56794, -2.201918, 1, 1, 1, 1, 1,
-0.6314467, 1.286158, 0.05662085, 1, 1, 1, 1, 1,
-0.6290835, 0.06757981, -4.006516, 1, 1, 1, 1, 1,
-0.6209272, 1.729952, 0.5087739, 1, 1, 1, 1, 1,
-0.6135562, -1.06356, -0.8868657, 1, 1, 1, 1, 1,
-0.6134658, 0.5672187, -0.3552919, 1, 1, 1, 1, 1,
-0.6072849, 0.02040936, -1.083038, 1, 1, 1, 1, 1,
-0.6062305, -1.329116, -1.720778, 1, 1, 1, 1, 1,
-0.6036685, 0.843801, -1.806612, 1, 1, 1, 1, 1,
-0.6018288, -0.03188305, -1.884082, 1, 1, 1, 1, 1,
-0.600467, 1.195157, -1.115418, 0, 0, 1, 1, 1,
-0.5985436, -2.141223, -3.99472, 1, 0, 0, 1, 1,
-0.5984607, 1.464655, -0.4203174, 1, 0, 0, 1, 1,
-0.5979418, 1.011019, 0.01605709, 1, 0, 0, 1, 1,
-0.5978433, 1.548494, -0.2486191, 1, 0, 0, 1, 1,
-0.5960774, 0.1972184, -0.1152442, 1, 0, 0, 1, 1,
-0.595888, 0.2157228, -2.395433, 0, 0, 0, 1, 1,
-0.5949711, -0.2933299, -3.081163, 0, 0, 0, 1, 1,
-0.5921113, -0.9542072, -1.829248, 0, 0, 0, 1, 1,
-0.5889907, 0.3930339, -1.95075, 0, 0, 0, 1, 1,
-0.5888605, 3.098566, 1.863223, 0, 0, 0, 1, 1,
-0.5877187, -0.3610988, -2.18581, 0, 0, 0, 1, 1,
-0.5876664, 0.801358, -1.743386, 0, 0, 0, 1, 1,
-0.5812767, 1.777322, 0.1293294, 1, 1, 1, 1, 1,
-0.5787504, 0.4537748, -0.7791553, 1, 1, 1, 1, 1,
-0.5779712, -2.076249, -3.035193, 1, 1, 1, 1, 1,
-0.5738231, 0.2745517, -0.3393482, 1, 1, 1, 1, 1,
-0.5659899, -1.97768, -3.705839, 1, 1, 1, 1, 1,
-0.5615045, 1.419404, -0.6682681, 1, 1, 1, 1, 1,
-0.5609442, -1.026856, -2.367008, 1, 1, 1, 1, 1,
-0.5547325, -0.2709934, -1.80638, 1, 1, 1, 1, 1,
-0.5526549, -0.2177746, -0.9335338, 1, 1, 1, 1, 1,
-0.5517102, 1.479281, -0.3750242, 1, 1, 1, 1, 1,
-0.5515587, 1.019986, -0.713313, 1, 1, 1, 1, 1,
-0.5503824, 1.270443, -0.6146941, 1, 1, 1, 1, 1,
-0.5493522, -2.122798, -2.977768, 1, 1, 1, 1, 1,
-0.5472751, 0.05970043, -0.1606274, 1, 1, 1, 1, 1,
-0.5409199, -0.05350067, -1.740113, 1, 1, 1, 1, 1,
-0.5343574, -1.833292, -2.642306, 0, 0, 1, 1, 1,
-0.5338038, -2.115304, -3.9557, 1, 0, 0, 1, 1,
-0.5308056, -0.05342874, -1.195408, 1, 0, 0, 1, 1,
-0.5306557, 0.9030046, 0.1728488, 1, 0, 0, 1, 1,
-0.5306242, 0.07422794, -0.9305844, 1, 0, 0, 1, 1,
-0.5241004, 0.5065199, -1.401715, 1, 0, 0, 1, 1,
-0.5213562, 0.3886432, 0.5269294, 0, 0, 0, 1, 1,
-0.5207492, -0.2921129, -1.500335, 0, 0, 0, 1, 1,
-0.5206989, -1.253518, -4.642566, 0, 0, 0, 1, 1,
-0.5201964, 0.808226, -0.2187658, 0, 0, 0, 1, 1,
-0.5198535, 0.31793, 0.05848689, 0, 0, 0, 1, 1,
-0.5140362, -2.105695, -3.597107, 0, 0, 0, 1, 1,
-0.5126457, 0.6237782, -1.667386, 0, 0, 0, 1, 1,
-0.5102262, -0.8658804, -2.697809, 1, 1, 1, 1, 1,
-0.5100786, 1.126389, -0.2354033, 1, 1, 1, 1, 1,
-0.5092919, 1.201142, -0.9902627, 1, 1, 1, 1, 1,
-0.5064927, 0.1075868, -2.063385, 1, 1, 1, 1, 1,
-0.5061387, -0.2107069, -1.156705, 1, 1, 1, 1, 1,
-0.5039198, -0.6511469, -2.662556, 1, 1, 1, 1, 1,
-0.5006707, -0.1698247, -1.197121, 1, 1, 1, 1, 1,
-0.4970036, -0.1841321, -2.64642, 1, 1, 1, 1, 1,
-0.4968717, -0.75884, -3.238203, 1, 1, 1, 1, 1,
-0.4904117, -1.024962, -1.439253, 1, 1, 1, 1, 1,
-0.4879814, 0.1489617, -2.848939, 1, 1, 1, 1, 1,
-0.4855481, -1.198779, -1.502791, 1, 1, 1, 1, 1,
-0.4846223, 0.2661107, -1.397127, 1, 1, 1, 1, 1,
-0.4841949, -0.2268258, -2.67456, 1, 1, 1, 1, 1,
-0.4784886, 0.8344308, 0.09200455, 1, 1, 1, 1, 1,
-0.4765882, -2.394915, -2.012895, 0, 0, 1, 1, 1,
-0.4764456, -2.073071, -1.8018, 1, 0, 0, 1, 1,
-0.4757553, -1.092539, -3.033286, 1, 0, 0, 1, 1,
-0.4707939, 0.499019, -0.2575644, 1, 0, 0, 1, 1,
-0.4671786, -0.3079677, -1.137619, 1, 0, 0, 1, 1,
-0.4652672, -0.7087982, -2.089345, 1, 0, 0, 1, 1,
-0.4616943, 0.4686994, -1.3695, 0, 0, 0, 1, 1,
-0.4558187, 1.031346, -1.254399, 0, 0, 0, 1, 1,
-0.4530387, 0.8174967, 0.1463753, 0, 0, 0, 1, 1,
-0.4483951, -0.01839616, -0.3532988, 0, 0, 0, 1, 1,
-0.4474035, 0.03063299, -1.718006, 0, 0, 0, 1, 1,
-0.4463391, 0.7014852, -0.885016, 0, 0, 0, 1, 1,
-0.4460818, -1.653306, -2.970647, 0, 0, 0, 1, 1,
-0.4435598, 0.1710843, -1.919721, 1, 1, 1, 1, 1,
-0.4409824, -0.5606068, -2.205653, 1, 1, 1, 1, 1,
-0.4389442, 0.2707556, -2.781836, 1, 1, 1, 1, 1,
-0.4345956, -1.195405, -2.756416, 1, 1, 1, 1, 1,
-0.4333343, -1.921031, -6.29523, 1, 1, 1, 1, 1,
-0.4307306, 0.4075311, -2.220299, 1, 1, 1, 1, 1,
-0.4297497, -1.835312, -1.898425, 1, 1, 1, 1, 1,
-0.4291905, -0.1905671, -0.9521815, 1, 1, 1, 1, 1,
-0.4250062, 0.1858225, -1.000614, 1, 1, 1, 1, 1,
-0.4215539, -0.7132, -3.324907, 1, 1, 1, 1, 1,
-0.419976, -0.3970145, -2.436681, 1, 1, 1, 1, 1,
-0.4193387, 0.06482831, -1.118757, 1, 1, 1, 1, 1,
-0.4191385, 0.2809609, -0.1269791, 1, 1, 1, 1, 1,
-0.4144122, -0.6105689, -2.630892, 1, 1, 1, 1, 1,
-0.4110953, -0.9905661, -2.337265, 1, 1, 1, 1, 1,
-0.4097703, -1.093676, -2.747478, 0, 0, 1, 1, 1,
-0.4086851, 0.6486779, -1.337503, 1, 0, 0, 1, 1,
-0.4037269, 0.8327218, -0.1264514, 1, 0, 0, 1, 1,
-0.3906485, 0.5074915, -0.3233207, 1, 0, 0, 1, 1,
-0.3876724, -0.8822072, -3.400842, 1, 0, 0, 1, 1,
-0.3796082, -0.474023, -1.6849, 1, 0, 0, 1, 1,
-0.3795183, 0.08993842, -1.387984, 0, 0, 0, 1, 1,
-0.379251, -0.6323133, -1.851878, 0, 0, 0, 1, 1,
-0.3756972, 0.3941013, -1.114613, 0, 0, 0, 1, 1,
-0.3738326, 0.5450062, -0.008331225, 0, 0, 0, 1, 1,
-0.3707268, 1.171787, 0.04210788, 0, 0, 0, 1, 1,
-0.3673872, 0.2623772, -0.2323708, 0, 0, 0, 1, 1,
-0.3671522, 1.220065, -0.7734296, 0, 0, 0, 1, 1,
-0.3665217, 0.476378, -0.2326203, 1, 1, 1, 1, 1,
-0.3620513, 1.085605, -0.926902, 1, 1, 1, 1, 1,
-0.3619277, 0.7069103, -0.5180981, 1, 1, 1, 1, 1,
-0.3616233, 0.8223991, -1.575198, 1, 1, 1, 1, 1,
-0.3580663, 0.07872555, -1.780775, 1, 1, 1, 1, 1,
-0.3553034, -0.7886161, -1.298944, 1, 1, 1, 1, 1,
-0.3389948, 1.031338, -2.152106, 1, 1, 1, 1, 1,
-0.3376966, 1.035318, -1.045961, 1, 1, 1, 1, 1,
-0.3366402, -0.2534905, -0.3558287, 1, 1, 1, 1, 1,
-0.3292316, 0.7838026, 0.9340795, 1, 1, 1, 1, 1,
-0.3282215, -0.4741734, -1.994466, 1, 1, 1, 1, 1,
-0.3252405, 1.107663, 0.8886921, 1, 1, 1, 1, 1,
-0.3245263, -0.6231008, -2.668314, 1, 1, 1, 1, 1,
-0.3220533, -1.436009, -2.305809, 1, 1, 1, 1, 1,
-0.3165651, -0.9550409, -1.208193, 1, 1, 1, 1, 1,
-0.3094351, 0.9995528, -0.4171418, 0, 0, 1, 1, 1,
-0.3073932, 0.1604787, -1.831387, 1, 0, 0, 1, 1,
-0.3070055, -0.1207164, -2.982366, 1, 0, 0, 1, 1,
-0.3069213, -0.2601902, -5.09552, 1, 0, 0, 1, 1,
-0.3044941, 0.07185969, -0.7709774, 1, 0, 0, 1, 1,
-0.3038993, 0.1443174, -3.625006, 1, 0, 0, 1, 1,
-0.3020279, -0.8294202, -1.952303, 0, 0, 0, 1, 1,
-0.3019319, -2.131645, -3.496085, 0, 0, 0, 1, 1,
-0.3017805, 0.782465, -1.800963, 0, 0, 0, 1, 1,
-0.3005936, -0.8312165, -1.677814, 0, 0, 0, 1, 1,
-0.3001239, -0.1472156, 0.03421788, 0, 0, 0, 1, 1,
-0.299875, 1.612303, 0.09188346, 0, 0, 0, 1, 1,
-0.2973764, 0.7526522, -1.310798, 0, 0, 0, 1, 1,
-0.2967093, 0.6314666, -1.178844, 1, 1, 1, 1, 1,
-0.2964606, -0.2413365, -1.134903, 1, 1, 1, 1, 1,
-0.2902847, -0.3759338, -3.769608, 1, 1, 1, 1, 1,
-0.2888122, 0.9326326, -2.089927, 1, 1, 1, 1, 1,
-0.2818677, -0.9987202, -1.858767, 1, 1, 1, 1, 1,
-0.2811384, -1.02158, -3.353422, 1, 1, 1, 1, 1,
-0.2782706, -0.005951904, -0.9901868, 1, 1, 1, 1, 1,
-0.27781, -1.266952, -3.90517, 1, 1, 1, 1, 1,
-0.2764325, 0.03129582, -2.796953, 1, 1, 1, 1, 1,
-0.2684402, 1.774556, 0.9997249, 1, 1, 1, 1, 1,
-0.2679051, -0.3664345, -1.478424, 1, 1, 1, 1, 1,
-0.2666664, -1.504532, -1.840389, 1, 1, 1, 1, 1,
-0.2666221, 1.26937, 1.075539, 1, 1, 1, 1, 1,
-0.262993, 1.171155, -1.380664, 1, 1, 1, 1, 1,
-0.260689, 0.1377248, -2.787608, 1, 1, 1, 1, 1,
-0.2562675, 0.6988069, 0.7202968, 0, 0, 1, 1, 1,
-0.2554688, -1.382525, -4.306401, 1, 0, 0, 1, 1,
-0.2535086, -0.5701141, -3.381666, 1, 0, 0, 1, 1,
-0.2532665, 0.002510899, -1.885877, 1, 0, 0, 1, 1,
-0.2528572, 0.8378149, 0.2127454, 1, 0, 0, 1, 1,
-0.2496896, -0.2621543, -3.74782, 1, 0, 0, 1, 1,
-0.2492374, -0.1409732, -2.32577, 0, 0, 0, 1, 1,
-0.2474864, -0.3796008, -2.480565, 0, 0, 0, 1, 1,
-0.2459133, -0.7767958, -3.929099, 0, 0, 0, 1, 1,
-0.2438791, -0.3050315, -1.681928, 0, 0, 0, 1, 1,
-0.2437941, 1.605785, -0.3119404, 0, 0, 0, 1, 1,
-0.243712, 1.341428, -1.423691, 0, 0, 0, 1, 1,
-0.2378413, -0.8602708, -2.583318, 0, 0, 0, 1, 1,
-0.2377779, 0.7907669, 0.2936184, 1, 1, 1, 1, 1,
-0.2376723, 0.1594175, -1.654477, 1, 1, 1, 1, 1,
-0.2366599, -1.532328, -3.114318, 1, 1, 1, 1, 1,
-0.2338182, -0.1688936, -2.734429, 1, 1, 1, 1, 1,
-0.2274746, -0.2201466, -1.992559, 1, 1, 1, 1, 1,
-0.2266381, -0.06383231, -1.861783, 1, 1, 1, 1, 1,
-0.2249116, 0.8796185, 0.2780701, 1, 1, 1, 1, 1,
-0.2178929, -0.1056601, -2.898308, 1, 1, 1, 1, 1,
-0.2174346, -0.1861529, -2.462664, 1, 1, 1, 1, 1,
-0.2140685, 0.214445, -1.447192, 1, 1, 1, 1, 1,
-0.2099044, -0.875665, -4.348277, 1, 1, 1, 1, 1,
-0.2084949, 2.239799, -1.823581, 1, 1, 1, 1, 1,
-0.2084609, -0.06951856, -1.21058, 1, 1, 1, 1, 1,
-0.2076272, -0.891049, -4.439681, 1, 1, 1, 1, 1,
-0.2055031, -1.28114, -1.193875, 1, 1, 1, 1, 1,
-0.2048389, 0.9532463, -0.7438809, 0, 0, 1, 1, 1,
-0.2035369, -0.1908313, -2.846512, 1, 0, 0, 1, 1,
-0.2030857, 0.3637179, -0.1175364, 1, 0, 0, 1, 1,
-0.2025473, -0.484843, -2.439909, 1, 0, 0, 1, 1,
-0.1976651, -0.5507971, -3.312597, 1, 0, 0, 1, 1,
-0.1962109, 0.9463735, 1.362828, 1, 0, 0, 1, 1,
-0.193964, -1.097854, -1.802538, 0, 0, 0, 1, 1,
-0.191476, 0.5507708, -0.2870037, 0, 0, 0, 1, 1,
-0.1903138, 1.339149, -2.049658, 0, 0, 0, 1, 1,
-0.1894307, 1.365225, -0.9829386, 0, 0, 0, 1, 1,
-0.1872254, 0.8908765, -0.6741971, 0, 0, 0, 1, 1,
-0.1802747, -0.02088883, -0.302287, 0, 0, 0, 1, 1,
-0.1797974, -0.8128663, -1.693049, 0, 0, 0, 1, 1,
-0.1793543, 0.09986272, -0.5604905, 1, 1, 1, 1, 1,
-0.1783074, -0.8238252, -3.702037, 1, 1, 1, 1, 1,
-0.1779281, -0.09745635, -4.926635, 1, 1, 1, 1, 1,
-0.1726667, -1.125445, -4.095655, 1, 1, 1, 1, 1,
-0.171914, 0.4221579, 0.09545165, 1, 1, 1, 1, 1,
-0.1670673, -0.03479602, -3.057032, 1, 1, 1, 1, 1,
-0.156261, 2.558054, 1.528691, 1, 1, 1, 1, 1,
-0.1560742, 1.475195, -1.076198, 1, 1, 1, 1, 1,
-0.1554352, -0.6818639, -4.562598, 1, 1, 1, 1, 1,
-0.1491173, 0.217873, -1.155207, 1, 1, 1, 1, 1,
-0.1468565, -0.02669866, -2.053355, 1, 1, 1, 1, 1,
-0.1441459, -1.349725, -2.60809, 1, 1, 1, 1, 1,
-0.1436746, -0.9647579, -2.01656, 1, 1, 1, 1, 1,
-0.1419179, -0.3982001, -2.50329, 1, 1, 1, 1, 1,
-0.1394681, 1.354073, -0.4495133, 1, 1, 1, 1, 1,
-0.1391785, -0.360364, -3.224017, 0, 0, 1, 1, 1,
-0.1369076, 1.160259, 0.3447607, 1, 0, 0, 1, 1,
-0.1358573, 0.391889, 0.833456, 1, 0, 0, 1, 1,
-0.1343665, 0.504113, 0.2696024, 1, 0, 0, 1, 1,
-0.1313, 2.050058, -1.178932, 1, 0, 0, 1, 1,
-0.1287722, -0.1116466, -2.295105, 1, 0, 0, 1, 1,
-0.1262731, -0.9163384, -1.998682, 0, 0, 0, 1, 1,
-0.1250862, -0.5620782, -4.637984, 0, 0, 0, 1, 1,
-0.1235308, 0.1377955, -0.3609268, 0, 0, 0, 1, 1,
-0.1231258, -1.051117, -3.068063, 0, 0, 0, 1, 1,
-0.1226435, -1.928138, -2.34747, 0, 0, 0, 1, 1,
-0.1192844, -1.582074, -4.396058, 0, 0, 0, 1, 1,
-0.1177395, 0.1543692, -0.7823782, 0, 0, 0, 1, 1,
-0.1084405, 0.2692875, 0.7747313, 1, 1, 1, 1, 1,
-0.1072723, 0.614885, -0.5387796, 1, 1, 1, 1, 1,
-0.1033702, -0.03452668, -2.964371, 1, 1, 1, 1, 1,
-0.1010977, -1.251774, -4.131094, 1, 1, 1, 1, 1,
-0.1006148, -0.8176223, -2.793964, 1, 1, 1, 1, 1,
-0.09837178, 1.218951, 0.7515044, 1, 1, 1, 1, 1,
-0.09813695, -0.5861134, -2.449791, 1, 1, 1, 1, 1,
-0.09683741, -1.822997, -2.57753, 1, 1, 1, 1, 1,
-0.0963229, 1.038582, 0.5100119, 1, 1, 1, 1, 1,
-0.09322791, -0.9847263, -0.7606371, 1, 1, 1, 1, 1,
-0.09072023, -2.379775, -3.592093, 1, 1, 1, 1, 1,
-0.08903585, -1.362977, -3.732289, 1, 1, 1, 1, 1,
-0.08344525, 1.266434, -0.4570617, 1, 1, 1, 1, 1,
-0.08039532, 0.05683911, -0.5612187, 1, 1, 1, 1, 1,
-0.07502162, 0.5147084, 0.5560624, 1, 1, 1, 1, 1,
-0.0724085, 0.9756021, -1.061794, 0, 0, 1, 1, 1,
-0.07237002, -0.4209158, -3.029383, 1, 0, 0, 1, 1,
-0.06857742, -1.086618, -0.9385931, 1, 0, 0, 1, 1,
-0.06606768, -1.729071, -3.873863, 1, 0, 0, 1, 1,
-0.06551472, 1.561679, -0.07667854, 1, 0, 0, 1, 1,
-0.06396373, -1.474846, -4.119482, 1, 0, 0, 1, 1,
-0.06173042, 0.6055903, -0.7262068, 0, 0, 0, 1, 1,
-0.05547401, 1.391191, -0.6441563, 0, 0, 0, 1, 1,
-0.0513482, -0.09516663, -3.686706, 0, 0, 0, 1, 1,
-0.04914951, 1.52295, -1.54311, 0, 0, 0, 1, 1,
-0.04569763, 1.427697, -0.9490119, 0, 0, 0, 1, 1,
-0.04521216, -0.4714748, -2.118228, 0, 0, 0, 1, 1,
-0.04468917, 0.610247, -0.6227554, 0, 0, 0, 1, 1,
-0.0375205, 0.4890477, 1.15254, 1, 1, 1, 1, 1,
-0.03489495, -0.1248894, -0.4267344, 1, 1, 1, 1, 1,
-0.03415437, 0.8740055, 1.316326, 1, 1, 1, 1, 1,
-0.03328243, -1.619308, -3.255486, 1, 1, 1, 1, 1,
-0.02831163, 0.7393853, -0.3171934, 1, 1, 1, 1, 1,
-0.02704147, 0.1460832, -0.2300214, 1, 1, 1, 1, 1,
-0.02669785, -1.509128, -1.801482, 1, 1, 1, 1, 1,
-0.02640192, -0.7849405, -1.712103, 1, 1, 1, 1, 1,
-0.02607642, -0.2716261, -1.891894, 1, 1, 1, 1, 1,
-0.02307842, 1.948266, 0.233019, 1, 1, 1, 1, 1,
-0.02151712, 1.382927, -1.405051, 1, 1, 1, 1, 1,
-0.02081953, 0.3469392, -1.012399, 1, 1, 1, 1, 1,
-0.02062603, 0.02366772, -1.758765, 1, 1, 1, 1, 1,
-0.01889619, 1.376477, -0.02275956, 1, 1, 1, 1, 1,
-0.01279699, -0.4128784, -1.078368, 1, 1, 1, 1, 1,
-0.007415227, -1.100551, -1.127161, 0, 0, 1, 1, 1,
0.005267145, -0.64118, 3.641235, 1, 0, 0, 1, 1,
0.01181679, 0.03934326, 0.7950462, 1, 0, 0, 1, 1,
0.01335985, 0.4208074, -0.4902287, 1, 0, 0, 1, 1,
0.01630848, 1.214833, -1.30256, 1, 0, 0, 1, 1,
0.01973666, 0.2936024, 0.541342, 1, 0, 0, 1, 1,
0.02019493, 0.0185878, 4.203494, 0, 0, 0, 1, 1,
0.02127808, -1.38222, 3.305233, 0, 0, 0, 1, 1,
0.02226136, -0.02386304, 1.158985, 0, 0, 0, 1, 1,
0.02573811, 1.459395, -0.3558862, 0, 0, 0, 1, 1,
0.03516074, -0.1020072, 4.824175, 0, 0, 0, 1, 1,
0.0355613, 1.545399, 0.974179, 0, 0, 0, 1, 1,
0.03914297, -0.6833318, 1.90655, 0, 0, 0, 1, 1,
0.04298596, 0.27572, 0.2922724, 1, 1, 1, 1, 1,
0.04902573, 1.540457, -0.2621828, 1, 1, 1, 1, 1,
0.05075897, -0.7423422, 2.816428, 1, 1, 1, 1, 1,
0.05348863, 0.6002008, 0.939266, 1, 1, 1, 1, 1,
0.05781803, 1.504022, 0.8159231, 1, 1, 1, 1, 1,
0.06026802, 2.045381, -2.262825, 1, 1, 1, 1, 1,
0.06793974, -1.131727, 2.923468, 1, 1, 1, 1, 1,
0.06820855, -1.499622, 3.316059, 1, 1, 1, 1, 1,
0.06924395, -0.6436502, 3.722317, 1, 1, 1, 1, 1,
0.06937187, -0.4174742, 3.218553, 1, 1, 1, 1, 1,
0.07379685, -0.8811127, 4.423765, 1, 1, 1, 1, 1,
0.07615437, -0.4989185, 2.968982, 1, 1, 1, 1, 1,
0.07868832, 0.6042503, 1.036685, 1, 1, 1, 1, 1,
0.07887615, 0.4124664, 2.425315, 1, 1, 1, 1, 1,
0.08156867, 0.1893418, 1.200088, 1, 1, 1, 1, 1,
0.08487882, -1.467429, 2.662378, 0, 0, 1, 1, 1,
0.0855067, -0.8192769, 3.499902, 1, 0, 0, 1, 1,
0.08823627, -1.110703, 5.38494, 1, 0, 0, 1, 1,
0.08823702, 0.6675332, 1.584144, 1, 0, 0, 1, 1,
0.09091199, -0.2011269, 1.948172, 1, 0, 0, 1, 1,
0.09218383, -0.8513638, 3.995406, 1, 0, 0, 1, 1,
0.09457856, -1.676387, 2.643942, 0, 0, 0, 1, 1,
0.09671494, 1.561864, -0.06297781, 0, 0, 0, 1, 1,
0.09986547, 1.267658, -0.1770936, 0, 0, 0, 1, 1,
0.1010517, 0.2770184, 0.509232, 0, 0, 0, 1, 1,
0.1034774, 0.7892704, -1.128626, 0, 0, 0, 1, 1,
0.1045031, -0.0009134084, -0.3841215, 0, 0, 0, 1, 1,
0.104658, 1.190182, 0.6970718, 0, 0, 0, 1, 1,
0.1054044, -0.1864704, 2.73615, 1, 1, 1, 1, 1,
0.1064328, -0.05626519, 1.681903, 1, 1, 1, 1, 1,
0.10721, -3.098243, 1.943606, 1, 1, 1, 1, 1,
0.1073142, 0.4060414, -1.157018, 1, 1, 1, 1, 1,
0.1086434, 1.328153, 0.680918, 1, 1, 1, 1, 1,
0.1130603, 0.5833235, -0.3416421, 1, 1, 1, 1, 1,
0.1141748, -0.9547287, 2.076327, 1, 1, 1, 1, 1,
0.1159981, -0.4221151, 3.280081, 1, 1, 1, 1, 1,
0.1161401, -0.07822561, 3.570179, 1, 1, 1, 1, 1,
0.1166017, 0.01812867, 3.145703, 1, 1, 1, 1, 1,
0.119564, -0.7665654, 2.336274, 1, 1, 1, 1, 1,
0.1244601, -0.8957458, 3.741643, 1, 1, 1, 1, 1,
0.1270484, 1.700806, -0.727072, 1, 1, 1, 1, 1,
0.132048, 0.4275479, 0.7464239, 1, 1, 1, 1, 1,
0.1322929, 0.5276175, -0.1449559, 1, 1, 1, 1, 1,
0.1331114, 0.4128452, 0.3426143, 0, 0, 1, 1, 1,
0.1334599, -1.228478, 2.730498, 1, 0, 0, 1, 1,
0.1336735, -2.065728, 1.863156, 1, 0, 0, 1, 1,
0.1378356, -0.1501351, 3.724591, 1, 0, 0, 1, 1,
0.139597, -0.3831922, 1.843805, 1, 0, 0, 1, 1,
0.1399229, -0.5618283, 3.332035, 1, 0, 0, 1, 1,
0.1520783, 1.465377, 0.1962707, 0, 0, 0, 1, 1,
0.153975, 0.7994931, 0.3697295, 0, 0, 0, 1, 1,
0.1564968, -0.2820722, 2.183966, 0, 0, 0, 1, 1,
0.1567597, -0.2556789, 3.702942, 0, 0, 0, 1, 1,
0.1640978, 1.448507, -0.2966318, 0, 0, 0, 1, 1,
0.1674011, 1.520327, 0.958882, 0, 0, 0, 1, 1,
0.170562, -0.5161253, 2.955393, 0, 0, 0, 1, 1,
0.1738673, -0.7060387, 1.195258, 1, 1, 1, 1, 1,
0.1830546, 0.659717, 0.1822746, 1, 1, 1, 1, 1,
0.1899984, -0.7563616, 2.911046, 1, 1, 1, 1, 1,
0.1914923, 1.553166, -0.1995306, 1, 1, 1, 1, 1,
0.1941717, 0.2683975, 0.6080751, 1, 1, 1, 1, 1,
0.1943333, -0.7895784, 4.054415, 1, 1, 1, 1, 1,
0.1956681, -0.08630706, 1.719509, 1, 1, 1, 1, 1,
0.2042367, 0.03876155, 0.4028876, 1, 1, 1, 1, 1,
0.2069607, -1.237972, 2.884048, 1, 1, 1, 1, 1,
0.2089395, 0.701411, 0.7797392, 1, 1, 1, 1, 1,
0.2137796, 1.308363, -0.4293025, 1, 1, 1, 1, 1,
0.215252, 0.1627574, 2.583432, 1, 1, 1, 1, 1,
0.2194073, -0.8401489, 2.69568, 1, 1, 1, 1, 1,
0.2244507, -1.492769, 3.883934, 1, 1, 1, 1, 1,
0.2252989, 0.1098202, -0.6615559, 1, 1, 1, 1, 1,
0.2333823, 1.565372, 0.2903651, 0, 0, 1, 1, 1,
0.2357132, -0.8912951, 3.010752, 1, 0, 0, 1, 1,
0.236546, -1.102191, 2.429152, 1, 0, 0, 1, 1,
0.2405303, 1.801399, 0.1762582, 1, 0, 0, 1, 1,
0.2410688, 0.3686122, 2.060157, 1, 0, 0, 1, 1,
0.2505866, 1.41834, -0.7505674, 1, 0, 0, 1, 1,
0.2526517, 0.9000276, 1.171339, 0, 0, 0, 1, 1,
0.2542175, -0.1867, 0.8669147, 0, 0, 0, 1, 1,
0.2609711, -0.8613476, 2.12108, 0, 0, 0, 1, 1,
0.264923, -1.288295, 3.872753, 0, 0, 0, 1, 1,
0.2675499, -0.2847736, 1.466695, 0, 0, 0, 1, 1,
0.2700221, 0.1994416, 1.601743, 0, 0, 0, 1, 1,
0.2733614, 1.129791, 0.2356085, 0, 0, 0, 1, 1,
0.2755831, -0.6226734, 1.046686, 1, 1, 1, 1, 1,
0.2769462, 0.7405248, -0.6109481, 1, 1, 1, 1, 1,
0.2769933, -0.08390488, 2.27684, 1, 1, 1, 1, 1,
0.2794624, 0.06539708, 1.934927, 1, 1, 1, 1, 1,
0.2799846, 0.9354156, 1.050392, 1, 1, 1, 1, 1,
0.2840063, -0.2168678, 2.899361, 1, 1, 1, 1, 1,
0.2841946, 0.5296866, 0.2315077, 1, 1, 1, 1, 1,
0.2968341, 0.0213415, 1.551579, 1, 1, 1, 1, 1,
0.3007372, -0.2876583, 1.006983, 1, 1, 1, 1, 1,
0.3007679, -2.820669, 2.892715, 1, 1, 1, 1, 1,
0.301149, 0.1421345, 1.15898, 1, 1, 1, 1, 1,
0.3075449, 0.8350018, -1.307744, 1, 1, 1, 1, 1,
0.3138107, 0.1609005, 1.06199, 1, 1, 1, 1, 1,
0.3155752, 0.7517637, 2.541468, 1, 1, 1, 1, 1,
0.3159176, -0.286697, 3.2438, 1, 1, 1, 1, 1,
0.3166995, -0.03698418, 2.72343, 0, 0, 1, 1, 1,
0.3187768, -1.380945, 2.966501, 1, 0, 0, 1, 1,
0.3249703, -0.5558224, 2.613248, 1, 0, 0, 1, 1,
0.3295592, 0.1450822, 2.753459, 1, 0, 0, 1, 1,
0.3305902, 1.379928, 1.212204, 1, 0, 0, 1, 1,
0.337109, -1.280012, 3.400607, 1, 0, 0, 1, 1,
0.3401999, -0.08961825, 1.15468, 0, 0, 0, 1, 1,
0.3424159, -2.812354, 2.749154, 0, 0, 0, 1, 1,
0.3467537, 0.3641154, 0.7527901, 0, 0, 0, 1, 1,
0.3473784, 1.615761, -0.3604662, 0, 0, 0, 1, 1,
0.3482184, -0.1448968, 1.484624, 0, 0, 0, 1, 1,
0.3488367, -1.065808, 2.889705, 0, 0, 0, 1, 1,
0.3492195, -0.3949461, 4.047138, 0, 0, 0, 1, 1,
0.3508347, 0.7460036, 1.049704, 1, 1, 1, 1, 1,
0.3520537, -1.136919, 3.603497, 1, 1, 1, 1, 1,
0.3538343, 0.4699043, -0.5775901, 1, 1, 1, 1, 1,
0.3626514, 0.7624621, -0.8489059, 1, 1, 1, 1, 1,
0.3630492, 0.5749375, 0.2664493, 1, 1, 1, 1, 1,
0.3632358, -0.2191991, 3.245424, 1, 1, 1, 1, 1,
0.3691664, 1.986711, 2.174025, 1, 1, 1, 1, 1,
0.3699093, 0.7122653, -0.01110513, 1, 1, 1, 1, 1,
0.3706169, 2.123895, -0.2439289, 1, 1, 1, 1, 1,
0.3743146, -1.579008, 3.006729, 1, 1, 1, 1, 1,
0.374775, -0.7536186, 2.047176, 1, 1, 1, 1, 1,
0.3748963, 0.2305446, 0.6878306, 1, 1, 1, 1, 1,
0.3822044, 0.5174222, -1.366703, 1, 1, 1, 1, 1,
0.3843657, -0.493113, 3.090405, 1, 1, 1, 1, 1,
0.3858066, 0.5120764, 0.0260786, 1, 1, 1, 1, 1,
0.3882078, 0.8435693, 0.005485084, 0, 0, 1, 1, 1,
0.3937271, 0.1358997, -0.08164196, 1, 0, 0, 1, 1,
0.3937769, -1.380129, 2.00247, 1, 0, 0, 1, 1,
0.3955393, -0.5035303, 3.844748, 1, 0, 0, 1, 1,
0.3989513, -0.975518, 3.380595, 1, 0, 0, 1, 1,
0.4000331, 1.01519, 2.117081, 1, 0, 0, 1, 1,
0.4025204, 1.166705, 0.149, 0, 0, 0, 1, 1,
0.4035396, -0.3533638, 1.903923, 0, 0, 0, 1, 1,
0.4054814, -1.355016, 2.443658, 0, 0, 0, 1, 1,
0.4123613, -1.198165, 2.305103, 0, 0, 0, 1, 1,
0.4229064, -0.3728088, 2.238775, 0, 0, 0, 1, 1,
0.4262612, 0.4513025, 0.4999434, 0, 0, 0, 1, 1,
0.428132, -2.506582, 6.128532, 0, 0, 0, 1, 1,
0.4309105, -0.3236628, 1.249268, 1, 1, 1, 1, 1,
0.4336574, 1.011842, 0.5720801, 1, 1, 1, 1, 1,
0.4345191, -0.679782, 3.319408, 1, 1, 1, 1, 1,
0.4349118, 1.727421, -0.1579293, 1, 1, 1, 1, 1,
0.4376619, 0.4054531, 0.1863326, 1, 1, 1, 1, 1,
0.4415297, 0.6640588, 0.7953447, 1, 1, 1, 1, 1,
0.4424984, -1.41079, 3.128486, 1, 1, 1, 1, 1,
0.4480721, 0.2673727, 2.460882, 1, 1, 1, 1, 1,
0.4484608, -0.7070527, 3.436752, 1, 1, 1, 1, 1,
0.45292, 1.006393, 0.1685869, 1, 1, 1, 1, 1,
0.4538869, -0.05976043, 1.442072, 1, 1, 1, 1, 1,
0.4572174, 1.259002, 2.349786, 1, 1, 1, 1, 1,
0.4578259, 0.3069535, 0.3804318, 1, 1, 1, 1, 1,
0.4578918, 0.3997554, 2.065888, 1, 1, 1, 1, 1,
0.4583411, 0.04665041, 0.189615, 1, 1, 1, 1, 1,
0.4610495, 0.0655721, -0.5643759, 0, 0, 1, 1, 1,
0.4615415, -0.07627723, 1.43544, 1, 0, 0, 1, 1,
0.4635557, 0.2327434, 0.3739222, 1, 0, 0, 1, 1,
0.4655725, -0.1029807, 1.132669, 1, 0, 0, 1, 1,
0.4674675, -0.2076923, 2.524439, 1, 0, 0, 1, 1,
0.4683301, 0.5264956, 0.4947746, 1, 0, 0, 1, 1,
0.4701304, 1.02316, -0.1991221, 0, 0, 0, 1, 1,
0.4728343, 0.3695599, 1.792039, 0, 0, 0, 1, 1,
0.47584, -0.49876, 2.071894, 0, 0, 0, 1, 1,
0.4766349, -0.07649194, 2.181022, 0, 0, 0, 1, 1,
0.4841746, 1.724742, -0.3818652, 0, 0, 0, 1, 1,
0.4862154, 0.5850366, 1.773131, 0, 0, 0, 1, 1,
0.4865552, -0.5629284, 2.04252, 0, 0, 0, 1, 1,
0.4909012, -0.9526519, 1.143269, 1, 1, 1, 1, 1,
0.4921686, 0.1102889, 1.364761, 1, 1, 1, 1, 1,
0.4949709, -1.326713, 3.041781, 1, 1, 1, 1, 1,
0.4967999, 0.2888937, 0.7016348, 1, 1, 1, 1, 1,
0.4974404, 0.5806885, -0.2107684, 1, 1, 1, 1, 1,
0.5018458, 0.5262466, 2.199157, 1, 1, 1, 1, 1,
0.5063125, -0.2026621, 2.139702, 1, 1, 1, 1, 1,
0.5133685, -1.270209, 3.171975, 1, 1, 1, 1, 1,
0.5134895, -0.7084403, 2.543466, 1, 1, 1, 1, 1,
0.5187554, 0.115656, 1.46234, 1, 1, 1, 1, 1,
0.5202225, 0.04178293, 3.198149, 1, 1, 1, 1, 1,
0.5221316, -0.7860899, 2.522556, 1, 1, 1, 1, 1,
0.5280999, 0.2111147, 0.1779026, 1, 1, 1, 1, 1,
0.5294046, -0.302653, 2.638965, 1, 1, 1, 1, 1,
0.5297326, 0.4407765, -0.2565842, 1, 1, 1, 1, 1,
0.5305376, 0.1137987, 2.869138, 0, 0, 1, 1, 1,
0.5322157, -0.2146809, 2.228477, 1, 0, 0, 1, 1,
0.5335004, 0.2822366, 0.755217, 1, 0, 0, 1, 1,
0.5357485, -2.157451, 3.612161, 1, 0, 0, 1, 1,
0.53804, -1.134961, 4.178717, 1, 0, 0, 1, 1,
0.5390592, -0.8884686, 2.297702, 1, 0, 0, 1, 1,
0.5486064, 0.6021396, -1.184853, 0, 0, 0, 1, 1,
0.5607269, 1.283497, -1.470317, 0, 0, 0, 1, 1,
0.5633601, 0.9791192, 1.090304, 0, 0, 0, 1, 1,
0.5699565, 2.033512, 0.9777321, 0, 0, 0, 1, 1,
0.5750827, 0.9760185, 1.501994, 0, 0, 0, 1, 1,
0.5755982, 0.09793577, 1.98276, 0, 0, 0, 1, 1,
0.5766275, 0.0997619, 2.092068, 0, 0, 0, 1, 1,
0.5823087, 0.09847713, 2.2717, 1, 1, 1, 1, 1,
0.5896764, -0.0365832, 0.8986165, 1, 1, 1, 1, 1,
0.5912033, -0.6595339, 3.382298, 1, 1, 1, 1, 1,
0.5919265, 0.3324101, 0.5767493, 1, 1, 1, 1, 1,
0.5927524, 0.2985974, 2.105031, 1, 1, 1, 1, 1,
0.5934117, 0.04402545, 1.565594, 1, 1, 1, 1, 1,
0.5958071, 2.360233, 0.6390139, 1, 1, 1, 1, 1,
0.60218, 1.844335, -1.131558, 1, 1, 1, 1, 1,
0.6074791, -0.6886809, 3.993957, 1, 1, 1, 1, 1,
0.6086254, -0.1266237, 2.639674, 1, 1, 1, 1, 1,
0.623036, -0.3932587, -0.008710984, 1, 1, 1, 1, 1,
0.6239029, -1.530133, 2.1135, 1, 1, 1, 1, 1,
0.6266336, -1.800118, 1.573478, 1, 1, 1, 1, 1,
0.6339294, 1.801878, -1.376742, 1, 1, 1, 1, 1,
0.6358517, -0.3919153, 3.545274, 1, 1, 1, 1, 1,
0.6389499, 0.2462285, 1.135217, 0, 0, 1, 1, 1,
0.6396006, 2.842498, 1.159328, 1, 0, 0, 1, 1,
0.6417941, -0.9239774, 0.6963396, 1, 0, 0, 1, 1,
0.6419951, 0.1261296, 2.207004, 1, 0, 0, 1, 1,
0.6431832, -0.2145912, 1.06656, 1, 0, 0, 1, 1,
0.6461407, -1.930163, 2.920543, 1, 0, 0, 1, 1,
0.6489063, 0.8921422, 0.8423668, 0, 0, 0, 1, 1,
0.6597247, 0.4987641, 0.2383176, 0, 0, 0, 1, 1,
0.6711338, -0.04583468, 2.590027, 0, 0, 0, 1, 1,
0.685006, 1.335497, -0.3462078, 0, 0, 0, 1, 1,
0.688205, 2.791209, -0.9237927, 0, 0, 0, 1, 1,
0.6925721, -0.5976443, 1.206206, 0, 0, 0, 1, 1,
0.6957511, 0.5724923, 1.192569, 0, 0, 0, 1, 1,
0.6961113, -1.339061, 4.760953, 1, 1, 1, 1, 1,
0.7044834, 1.687576, 0.3844288, 1, 1, 1, 1, 1,
0.7081187, -1.521236, 3.676531, 1, 1, 1, 1, 1,
0.7086416, -0.8145161, 2.418811, 1, 1, 1, 1, 1,
0.7099235, -0.2897566, 2.572713, 1, 1, 1, 1, 1,
0.7122745, 2.033823, 1.677558, 1, 1, 1, 1, 1,
0.7123785, 2.300361, 0.1520049, 1, 1, 1, 1, 1,
0.7166504, 0.3816175, 1.195834, 1, 1, 1, 1, 1,
0.7234286, -0.05439607, 0.4833755, 1, 1, 1, 1, 1,
0.7236108, -1.139341, 3.856022, 1, 1, 1, 1, 1,
0.7250764, -1.5926, 1.08957, 1, 1, 1, 1, 1,
0.727694, -0.6371506, 1.630842, 1, 1, 1, 1, 1,
0.7306194, 0.1969133, 0.7190518, 1, 1, 1, 1, 1,
0.73287, 0.7208357, 1.452426, 1, 1, 1, 1, 1,
0.7330323, 1.896133, -0.4458778, 1, 1, 1, 1, 1,
0.7374521, 0.3777027, 0.7059925, 0, 0, 1, 1, 1,
0.7384684, 0.2177285, 0.8938507, 1, 0, 0, 1, 1,
0.7395862, -0.8721998, 1.811787, 1, 0, 0, 1, 1,
0.740153, 0.7399987, -0.4524278, 1, 0, 0, 1, 1,
0.7402107, 0.02762893, 0.8977085, 1, 0, 0, 1, 1,
0.7422395, 0.4431141, -0.6795964, 1, 0, 0, 1, 1,
0.7427, 0.5348919, 1.98206, 0, 0, 0, 1, 1,
0.7448472, -0.6113161, 3.561879, 0, 0, 0, 1, 1,
0.7450159, 0.7845953, 1.98221, 0, 0, 0, 1, 1,
0.7450445, 1.354783, 0.2694393, 0, 0, 0, 1, 1,
0.7453541, 0.946556, -0.3329384, 0, 0, 0, 1, 1,
0.7465596, 0.4022038, 1.531239, 0, 0, 0, 1, 1,
0.746657, 0.5734114, 1.49415, 0, 0, 0, 1, 1,
0.7504898, -1.007594, 1.566309, 1, 1, 1, 1, 1,
0.7505952, 1.028707, -1.559719, 1, 1, 1, 1, 1,
0.7577922, -0.6954114, 2.522423, 1, 1, 1, 1, 1,
0.7578766, -0.001897512, 0.0380978, 1, 1, 1, 1, 1,
0.7623442, 0.9191109, -0.9258581, 1, 1, 1, 1, 1,
0.7641349, -0.4464696, 2.056708, 1, 1, 1, 1, 1,
0.7690777, -1.079293, 3.941077, 1, 1, 1, 1, 1,
0.7749325, -0.4593535, 2.049248, 1, 1, 1, 1, 1,
0.7756656, 0.7326519, 1.247514, 1, 1, 1, 1, 1,
0.7784355, 0.1553964, 1.971949, 1, 1, 1, 1, 1,
0.7842465, 0.91054, 1.516429, 1, 1, 1, 1, 1,
0.7908429, -1.142516, 2.017747, 1, 1, 1, 1, 1,
0.7940355, -2.26764, 4.454954, 1, 1, 1, 1, 1,
0.7967123, 0.2985974, 3.428648, 1, 1, 1, 1, 1,
0.8030044, -1.133591, 3.865386, 1, 1, 1, 1, 1,
0.8090389, -0.6784905, 2.869271, 0, 0, 1, 1, 1,
0.8096732, -0.7606428, 3.827045, 1, 0, 0, 1, 1,
0.8155627, -0.3943702, 0.5825567, 1, 0, 0, 1, 1,
0.8235222, 0.7019641, 0.9225558, 1, 0, 0, 1, 1,
0.8243404, -0.0948804, 1.898465, 1, 0, 0, 1, 1,
0.8245832, 0.5532547, 1.235915, 1, 0, 0, 1, 1,
0.8289262, -0.8436776, 4.227538, 0, 0, 0, 1, 1,
0.8297678, 0.4113504, 0.9099209, 0, 0, 0, 1, 1,
0.8300646, 0.2465601, 0.5343388, 0, 0, 0, 1, 1,
0.8314336, -1.030338, 1.814064, 0, 0, 0, 1, 1,
0.8343178, -1.254483, 1.969933, 0, 0, 0, 1, 1,
0.8498524, -0.6482857, 3.273618, 0, 0, 0, 1, 1,
0.8508231, -0.6089429, 1.926785, 0, 0, 0, 1, 1,
0.8528442, 1.325848, 0.4485119, 1, 1, 1, 1, 1,
0.8605892, -1.252782, 3.11507, 1, 1, 1, 1, 1,
0.865731, 0.7365803, 1.867599, 1, 1, 1, 1, 1,
0.8730301, 0.4431549, 1.648697, 1, 1, 1, 1, 1,
0.8731689, -0.02802538, 1.603811, 1, 1, 1, 1, 1,
0.8739832, 0.04767068, -0.7523966, 1, 1, 1, 1, 1,
0.8782603, -0.4713104, 3.418118, 1, 1, 1, 1, 1,
0.880141, 0.1976601, 1.832857, 1, 1, 1, 1, 1,
0.890739, 2.454406, -0.9767355, 1, 1, 1, 1, 1,
0.8947841, 0.2084673, 1.592686, 1, 1, 1, 1, 1,
0.9028168, 0.4544332, -1.940716, 1, 1, 1, 1, 1,
0.9041374, -1.513548, 0.8123193, 1, 1, 1, 1, 1,
0.9051394, -1.183591, 3.36686, 1, 1, 1, 1, 1,
0.9068974, 1.841188, 0.3892709, 1, 1, 1, 1, 1,
0.9090231, -2.033115, 2.257127, 1, 1, 1, 1, 1,
0.9095795, 0.7664632, 1.313804, 0, 0, 1, 1, 1,
0.911059, 1.028672, 0.1013516, 1, 0, 0, 1, 1,
0.9174274, -1.017763, 2.506015, 1, 0, 0, 1, 1,
0.9250915, -1.840042, 1.061764, 1, 0, 0, 1, 1,
0.927036, 1.957971, 0.7321182, 1, 0, 0, 1, 1,
0.9271182, -0.9418805, 2.549427, 1, 0, 0, 1, 1,
0.9293955, 0.3219681, 1.532287, 0, 0, 0, 1, 1,
0.9324261, 0.6254615, 1.15146, 0, 0, 0, 1, 1,
0.9341936, 0.9313868, 1.413609, 0, 0, 0, 1, 1,
0.9345114, -0.4585113, 0.1660002, 0, 0, 0, 1, 1,
0.9378084, -0.3532785, 2.998505, 0, 0, 0, 1, 1,
0.9388476, 0.5914239, 0.1336903, 0, 0, 0, 1, 1,
0.9419208, -0.9261168, 2.882638, 0, 0, 0, 1, 1,
0.9486958, -0.7700576, 0.5536618, 1, 1, 1, 1, 1,
0.9513365, -0.4807, 2.671451, 1, 1, 1, 1, 1,
0.9552059, 0.1920327, 1.362032, 1, 1, 1, 1, 1,
0.9591808, 0.542935, 1.429916, 1, 1, 1, 1, 1,
0.9593729, -0.5006391, 2.328838, 1, 1, 1, 1, 1,
0.9613758, -0.6114348, 1.897873, 1, 1, 1, 1, 1,
0.9652851, 2.417507, -0.2526351, 1, 1, 1, 1, 1,
0.9768842, -0.1114282, 1.251324, 1, 1, 1, 1, 1,
0.9828616, 2.169102, 1.414083, 1, 1, 1, 1, 1,
0.9857656, -0.9108846, 1.065883, 1, 1, 1, 1, 1,
0.9896457, -0.3446217, 1.130828, 1, 1, 1, 1, 1,
0.9907019, -1.141264, 4.815805, 1, 1, 1, 1, 1,
0.9908726, -0.4168772, 1.851041, 1, 1, 1, 1, 1,
0.9909528, -1.706199, 2.179415, 1, 1, 1, 1, 1,
0.993196, 0.864535, 1.832109, 1, 1, 1, 1, 1,
0.9938714, -0.3053497, 1.355528, 0, 0, 1, 1, 1,
0.993957, -0.4385561, 2.721045, 1, 0, 0, 1, 1,
0.9956661, 0.8457237, 0.8375329, 1, 0, 0, 1, 1,
0.9963246, -1.657327, 3.343521, 1, 0, 0, 1, 1,
1.003975, -0.3445866, 0.2716116, 1, 0, 0, 1, 1,
1.004555, 2.716563, 1.351105, 1, 0, 0, 1, 1,
1.005744, 0.1995403, 4.155416, 0, 0, 0, 1, 1,
1.017884, -1.033056, 2.623159, 0, 0, 0, 1, 1,
1.022536, -0.5104089, 1.934936, 0, 0, 0, 1, 1,
1.027736, -0.121277, 0.8511617, 0, 0, 0, 1, 1,
1.035129, -2.215431, 2.939902, 0, 0, 0, 1, 1,
1.039248, -0.2903805, 0.1465408, 0, 0, 0, 1, 1,
1.040361, 1.61205, 1.752596, 0, 0, 0, 1, 1,
1.042289, 0.2551288, 0.9098498, 1, 1, 1, 1, 1,
1.043133, -1.054682, 1.559527, 1, 1, 1, 1, 1,
1.04992, 1.893076, 1.13024, 1, 1, 1, 1, 1,
1.053675, -0.453462, 2.705163, 1, 1, 1, 1, 1,
1.05519, 1.251064, 0.7026476, 1, 1, 1, 1, 1,
1.057214, -0.8281246, 1.263189, 1, 1, 1, 1, 1,
1.063781, -1.512205, 3.003001, 1, 1, 1, 1, 1,
1.07734, 0.5260268, 2.407471, 1, 1, 1, 1, 1,
1.08239, 0.6359353, 1.574065, 1, 1, 1, 1, 1,
1.087066, -1.063421, 1.661686, 1, 1, 1, 1, 1,
1.08964, -0.2115962, 3.662801, 1, 1, 1, 1, 1,
1.091731, 0.3872961, 1.137239, 1, 1, 1, 1, 1,
1.092112, 1.050452, -0.9833668, 1, 1, 1, 1, 1,
1.094769, -0.2030154, 0.2173066, 1, 1, 1, 1, 1,
1.100519, -0.1352198, -0.2412976, 1, 1, 1, 1, 1,
1.101055, -0.8009026, 3.339416, 0, 0, 1, 1, 1,
1.10299, -0.3074887, 2.656354, 1, 0, 0, 1, 1,
1.104853, -0.7235954, 2.219136, 1, 0, 0, 1, 1,
1.105876, -1.895853, 3.300186, 1, 0, 0, 1, 1,
1.111299, 0.5481842, 0.7392884, 1, 0, 0, 1, 1,
1.112246, -1.1782, 2.708943, 1, 0, 0, 1, 1,
1.114881, 0.3829446, 2.689513, 0, 0, 0, 1, 1,
1.116005, -0.1383658, 1.777258, 0, 0, 0, 1, 1,
1.116199, -0.927927, 1.38719, 0, 0, 0, 1, 1,
1.123455, 0.8775464, 1.383945, 0, 0, 0, 1, 1,
1.126123, 0.06572899, 1.879171, 0, 0, 0, 1, 1,
1.132615, -1.235291, 0.8433201, 0, 0, 0, 1, 1,
1.140676, 0.7561581, 0.2307422, 0, 0, 0, 1, 1,
1.1462, -0.3100537, 0.6588246, 1, 1, 1, 1, 1,
1.152711, -0.1966153, 2.377806, 1, 1, 1, 1, 1,
1.157968, -0.8346284, 3.081276, 1, 1, 1, 1, 1,
1.162475, -0.4747819, 1.969568, 1, 1, 1, 1, 1,
1.163129, 0.3022246, 1.795491, 1, 1, 1, 1, 1,
1.175483, 0.1198248, 1.69048, 1, 1, 1, 1, 1,
1.180268, -1.035223, 1.431647, 1, 1, 1, 1, 1,
1.182052, 1.312677, 0.264074, 1, 1, 1, 1, 1,
1.184421, 1.547094, -0.6444958, 1, 1, 1, 1, 1,
1.184769, -0.0991179, 1.296496, 1, 1, 1, 1, 1,
1.200478, 0.01513899, 0.3213186, 1, 1, 1, 1, 1,
1.202151, -0.1402214, 0.435181, 1, 1, 1, 1, 1,
1.205251, 2.359681, -0.7257292, 1, 1, 1, 1, 1,
1.21192, 0.8653222, -0.7022346, 1, 1, 1, 1, 1,
1.217653, -0.6711177, 1.494156, 1, 1, 1, 1, 1,
1.218318, -0.9538977, 1.71189, 0, 0, 1, 1, 1,
1.228693, 0.9932378, 0.8275529, 1, 0, 0, 1, 1,
1.229702, -0.4259176, 2.221403, 1, 0, 0, 1, 1,
1.230616, 0.1726005, 1.084775, 1, 0, 0, 1, 1,
1.233218, 0.0979182, 0.01687343, 1, 0, 0, 1, 1,
1.235136, -0.0211114, 2.547714, 1, 0, 0, 1, 1,
1.238383, -0.422765, 1.957109, 0, 0, 0, 1, 1,
1.240833, 1.842926, 0.3743946, 0, 0, 0, 1, 1,
1.247834, -0.943041, 2.047226, 0, 0, 0, 1, 1,
1.258327, -1.648613, 2.93797, 0, 0, 0, 1, 1,
1.270383, -1.702303, 0.9669225, 0, 0, 0, 1, 1,
1.272127, 0.8267207, 1.590367, 0, 0, 0, 1, 1,
1.276251, -0.3034293, 2.454558, 0, 0, 0, 1, 1,
1.278595, -1.945457, 3.616551, 1, 1, 1, 1, 1,
1.283185, -0.1411991, 1.625175, 1, 1, 1, 1, 1,
1.292095, -0.00701597, 2.518586, 1, 1, 1, 1, 1,
1.298528, 2.310894, 0.4739755, 1, 1, 1, 1, 1,
1.307711, 0.4123059, 2.002048, 1, 1, 1, 1, 1,
1.309779, -1.384685, 0.5884702, 1, 1, 1, 1, 1,
1.312921, 1.234126, 0.4263577, 1, 1, 1, 1, 1,
1.317465, -1.214907, 1.465262, 1, 1, 1, 1, 1,
1.31859, -0.2958819, 3.786119, 1, 1, 1, 1, 1,
1.325106, -0.3161571, 2.450816, 1, 1, 1, 1, 1,
1.325836, -0.3368406, 1.624976, 1, 1, 1, 1, 1,
1.331851, 0.4034247, 2.573529, 1, 1, 1, 1, 1,
1.338172, 0.4374953, 3.67173, 1, 1, 1, 1, 1,
1.361455, 1.828422, -0.0723506, 1, 1, 1, 1, 1,
1.363133, -0.1440666, 1.349436, 1, 1, 1, 1, 1,
1.367943, 1.098086, 1.389328, 0, 0, 1, 1, 1,
1.380612, -1.016212, 1.338064, 1, 0, 0, 1, 1,
1.381699, -0.07374347, 0.7646845, 1, 0, 0, 1, 1,
1.384224, 1.678195, 0.6128802, 1, 0, 0, 1, 1,
1.393391, 0.9356056, 1.052449, 1, 0, 0, 1, 1,
1.435516, 0.0452573, 1.398434, 1, 0, 0, 1, 1,
1.439778, -0.3569163, 2.863338, 0, 0, 0, 1, 1,
1.44223, 0.7510368, 0.1263369, 0, 0, 0, 1, 1,
1.444507, -0.2193286, 2.856223, 0, 0, 0, 1, 1,
1.453389, 0.298737, 3.059897, 0, 0, 0, 1, 1,
1.470983, -0.7231266, 2.3054, 0, 0, 0, 1, 1,
1.472333, 1.952844, 0.3965531, 0, 0, 0, 1, 1,
1.475786, 1.869899, 0.4850449, 0, 0, 0, 1, 1,
1.507075, 0.3287254, 0.6931297, 1, 1, 1, 1, 1,
1.510493, 0.6936067, 0.3891218, 1, 1, 1, 1, 1,
1.512117, 1.485477, 0.7636261, 1, 1, 1, 1, 1,
1.514301, 1.094334, 1.530311, 1, 1, 1, 1, 1,
1.52876, 0.5160593, 0.1776548, 1, 1, 1, 1, 1,
1.528906, 0.3114241, -0.2642555, 1, 1, 1, 1, 1,
1.539921, -0.2155374, -0.2095868, 1, 1, 1, 1, 1,
1.545712, 0.9008868, -0.5116396, 1, 1, 1, 1, 1,
1.555385, 0.9213133, 3.726021, 1, 1, 1, 1, 1,
1.56106, -0.4064427, 2.473367, 1, 1, 1, 1, 1,
1.574749, 0.7700704, 3.004264, 1, 1, 1, 1, 1,
1.581406, 1.15102, 0.9811363, 1, 1, 1, 1, 1,
1.584117, -0.3632559, 2.055581, 1, 1, 1, 1, 1,
1.585799, 1.430449, -0.3903972, 1, 1, 1, 1, 1,
1.600006, -0.756471, 0.7284539, 1, 1, 1, 1, 1,
1.607589, 0.1272886, 0.6650882, 0, 0, 1, 1, 1,
1.618728, -0.8010883, 1.857869, 1, 0, 0, 1, 1,
1.624628, 1.811431, 1.801625, 1, 0, 0, 1, 1,
1.625416, 0.2317093, 1.139256, 1, 0, 0, 1, 1,
1.64305, -0.0386257, 0.7642702, 1, 0, 0, 1, 1,
1.645872, 1.922872, 0.2338097, 1, 0, 0, 1, 1,
1.6483, 0.5134644, 3.145715, 0, 0, 0, 1, 1,
1.651785, 0.5621971, 1.302033, 0, 0, 0, 1, 1,
1.652815, 0.05539915, 2.275395, 0, 0, 0, 1, 1,
1.679127, -1.901631, 2.713848, 0, 0, 0, 1, 1,
1.689339, 0.4228334, 1.438249, 0, 0, 0, 1, 1,
1.691001, 1.268679, 1.416302, 0, 0, 0, 1, 1,
1.718657, 0.2659024, -0.07790139, 0, 0, 0, 1, 1,
1.726908, 2.039418, 1.178316, 1, 1, 1, 1, 1,
1.76368, 1.607031, -1.656661, 1, 1, 1, 1, 1,
1.773135, -1.299614, 1.99457, 1, 1, 1, 1, 1,
1.77688, 0.002666711, 0.3623896, 1, 1, 1, 1, 1,
1.805739, 0.02171157, 2.170584, 1, 1, 1, 1, 1,
1.81778, 0.1223799, 2.189507, 1, 1, 1, 1, 1,
1.82, 0.9422455, 0.4621087, 1, 1, 1, 1, 1,
1.888952, 0.796276, 2.332244, 1, 1, 1, 1, 1,
1.897701, 0.6623712, 2.46226, 1, 1, 1, 1, 1,
1.904719, -0.5133929, 1.510314, 1, 1, 1, 1, 1,
1.94607, 0.4744403, 1.859397, 1, 1, 1, 1, 1,
1.971493, -0.4233304, 3.670427, 1, 1, 1, 1, 1,
1.985528, -0.4748612, 0.7936115, 1, 1, 1, 1, 1,
1.987502, -1.51799, 1.461017, 1, 1, 1, 1, 1,
2.001093, 0.3208438, 2.066484, 1, 1, 1, 1, 1,
2.011147, -0.6168223, 3.461819, 0, 0, 1, 1, 1,
2.014279, 0.5243654, 0.4677171, 1, 0, 0, 1, 1,
2.018896, -1.032623, 1.875613, 1, 0, 0, 1, 1,
2.047196, -0.8760761, 1.606611, 1, 0, 0, 1, 1,
2.114351, -1.036577, 1.804281, 1, 0, 0, 1, 1,
2.126816, 0.2223453, 1.944001, 1, 0, 0, 1, 1,
2.208788, -0.9151782, 1.02111, 0, 0, 0, 1, 1,
2.211115, -0.8430569, 1.348939, 0, 0, 0, 1, 1,
2.252442, -1.433455, 3.142812, 0, 0, 0, 1, 1,
2.257562, -2.156677, 2.981379, 0, 0, 0, 1, 1,
2.280747, 1.312745, 1.047107, 0, 0, 0, 1, 1,
2.296935, -0.8247336, 2.424482, 0, 0, 0, 1, 1,
2.402206, 1.201228, 0.4923506, 0, 0, 0, 1, 1,
2.405288, -0.7016136, 2.219994, 1, 1, 1, 1, 1,
2.418024, 1.324955, -0.8031859, 1, 1, 1, 1, 1,
2.439637, 1.309618, 2.55356, 1, 1, 1, 1, 1,
2.446776, 1.26817, 2.190711, 1, 1, 1, 1, 1,
2.650683, 1.882021, 0.8886889, 1, 1, 1, 1, 1,
2.666453, 0.4734598, 1.062386, 1, 1, 1, 1, 1,
3.341895, -1.512284, 2.193931, 1, 1, 1, 1, 1
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
var radius = 10.35207;
var distance = 36.36119;
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
mvMatrix.translate( 0.0999794, -0.003567934, 0.08334899 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.36119);
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
