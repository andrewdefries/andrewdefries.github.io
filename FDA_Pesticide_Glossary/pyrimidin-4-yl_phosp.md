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
-2.994819, 0.5646991, -0.7666327, 1, 0, 0, 1,
-2.923506, 0.404288, -4.100633, 1, 0.007843138, 0, 1,
-2.703824, 1.772393, -1.056671, 1, 0.01176471, 0, 1,
-2.698902, 1.126872, -0.2405699, 1, 0.01960784, 0, 1,
-2.676176, -0.2543045, -1.540321, 1, 0.02352941, 0, 1,
-2.66585, 0.05624447, -1.721541, 1, 0.03137255, 0, 1,
-2.662812, 0.2373991, -1.402139, 1, 0.03529412, 0, 1,
-2.626296, 2.787619, 0.05047972, 1, 0.04313726, 0, 1,
-2.618302, -0.8178318, -2.300972, 1, 0.04705882, 0, 1,
-2.563977, -0.6418862, -4.341655, 1, 0.05490196, 0, 1,
-2.443841, -1.2026, -0.3255675, 1, 0.05882353, 0, 1,
-2.404168, 0.1816545, -3.058917, 1, 0.06666667, 0, 1,
-2.299739, 0.05816045, -0.6537669, 1, 0.07058824, 0, 1,
-2.232351, -1.938983, -1.346641, 1, 0.07843138, 0, 1,
-2.136638, 0.5950996, -1.177353, 1, 0.08235294, 0, 1,
-2.133621, -0.811434, -2.300297, 1, 0.09019608, 0, 1,
-2.095323, -0.443659, -1.428257, 1, 0.09411765, 0, 1,
-2.080415, 1.033259, -1.180854, 1, 0.1019608, 0, 1,
-2.013201, -1.676911, -2.016832, 1, 0.1098039, 0, 1,
-1.962838, -0.8206202, -3.93594, 1, 0.1137255, 0, 1,
-1.961126, 1.823943, -0.08713782, 1, 0.1215686, 0, 1,
-1.931415, 1.409462, -1.12284, 1, 0.1254902, 0, 1,
-1.890589, -1.235697, -1.80355, 1, 0.1333333, 0, 1,
-1.876534, -1.360227, -3.793882, 1, 0.1372549, 0, 1,
-1.860101, -0.876106, -4.476733, 1, 0.145098, 0, 1,
-1.844272, 1.141023, -0.8729034, 1, 0.1490196, 0, 1,
-1.824589, -0.169752, -2.594396, 1, 0.1568628, 0, 1,
-1.812357, -0.6266614, -1.733839, 1, 0.1607843, 0, 1,
-1.797704, 1.042744, -0.108531, 1, 0.1686275, 0, 1,
-1.76213, -0.7756125, -2.079279, 1, 0.172549, 0, 1,
-1.750573, -0.4662221, -1.358695, 1, 0.1803922, 0, 1,
-1.749458, 0.376923, -0.8005654, 1, 0.1843137, 0, 1,
-1.745144, 2.020395, 1.617221, 1, 0.1921569, 0, 1,
-1.743558, -2.056, -2.71158, 1, 0.1960784, 0, 1,
-1.743143, -0.1321539, -3.039832, 1, 0.2039216, 0, 1,
-1.742622, 0.4591115, -2.159225, 1, 0.2117647, 0, 1,
-1.730804, 0.1804333, -1.076726, 1, 0.2156863, 0, 1,
-1.723387, -1.783177, -2.459893, 1, 0.2235294, 0, 1,
-1.717722, -1.93559, -2.359724, 1, 0.227451, 0, 1,
-1.717558, -0.2629168, -2.101935, 1, 0.2352941, 0, 1,
-1.716299, 0.2128044, -3.172978, 1, 0.2392157, 0, 1,
-1.714823, -2.224621, -2.913966, 1, 0.2470588, 0, 1,
-1.708234, -0.6286452, -1.045821, 1, 0.2509804, 0, 1,
-1.706033, 0.7389455, -1.134899, 1, 0.2588235, 0, 1,
-1.705439, 0.04947731, -2.625442, 1, 0.2627451, 0, 1,
-1.702922, -0.1624538, -2.12348, 1, 0.2705882, 0, 1,
-1.687133, 0.3201842, -0.9333794, 1, 0.2745098, 0, 1,
-1.66631, -0.2673392, -0.392487, 1, 0.282353, 0, 1,
-1.663451, -0.02936595, -1.539353, 1, 0.2862745, 0, 1,
-1.643408, 2.640499, -0.6296021, 1, 0.2941177, 0, 1,
-1.637031, -1.880018, -2.786541, 1, 0.3019608, 0, 1,
-1.632857, 0.4454331, -1.89463, 1, 0.3058824, 0, 1,
-1.62363, -0.475161, -0.909778, 1, 0.3137255, 0, 1,
-1.604721, -0.1181208, -2.037786, 1, 0.3176471, 0, 1,
-1.593558, -0.6040106, -1.261632, 1, 0.3254902, 0, 1,
-1.586588, 0.6180708, -0.4481992, 1, 0.3294118, 0, 1,
-1.570554, -0.5660982, -1.000222, 1, 0.3372549, 0, 1,
-1.56631, -0.8543488, -1.117617, 1, 0.3411765, 0, 1,
-1.562484, -0.3501495, -1.366526, 1, 0.3490196, 0, 1,
-1.560172, -0.7797176, -2.569947, 1, 0.3529412, 0, 1,
-1.556192, 2.234461, -1.212434, 1, 0.3607843, 0, 1,
-1.554855, -0.1017857, -2.862907, 1, 0.3647059, 0, 1,
-1.546073, -1.105589, -0.9168602, 1, 0.372549, 0, 1,
-1.542884, 0.1359006, -0.7570019, 1, 0.3764706, 0, 1,
-1.533956, 0.01434485, -1.482991, 1, 0.3843137, 0, 1,
-1.505778, -0.3990945, -2.094292, 1, 0.3882353, 0, 1,
-1.492108, 1.773409, -0.8906403, 1, 0.3960784, 0, 1,
-1.458763, 2.03767, -0.3536482, 1, 0.4039216, 0, 1,
-1.447936, 1.413703, -0.4884226, 1, 0.4078431, 0, 1,
-1.434509, -0.5395894, -1.694975, 1, 0.4156863, 0, 1,
-1.427603, -0.5101582, -2.308237, 1, 0.4196078, 0, 1,
-1.426878, 0.7769963, 0.6296389, 1, 0.427451, 0, 1,
-1.419987, 1.146192, 0.7523766, 1, 0.4313726, 0, 1,
-1.419561, -2.201274, -2.337135, 1, 0.4392157, 0, 1,
-1.418576, 0.6448294, -0.7021455, 1, 0.4431373, 0, 1,
-1.390883, -1.041347, -1.035361, 1, 0.4509804, 0, 1,
-1.385635, -0.2534395, -2.331611, 1, 0.454902, 0, 1,
-1.38513, 0.05705622, -1.947645, 1, 0.4627451, 0, 1,
-1.384122, 0.5387814, -1.501858, 1, 0.4666667, 0, 1,
-1.38195, -0.6117185, -2.057551, 1, 0.4745098, 0, 1,
-1.376596, 0.2749414, -1.456733, 1, 0.4784314, 0, 1,
-1.375593, -0.2743082, -0.6422969, 1, 0.4862745, 0, 1,
-1.357701, 0.1149145, -1.30285, 1, 0.4901961, 0, 1,
-1.356824, -0.1175512, -1.231334, 1, 0.4980392, 0, 1,
-1.344424, 0.6251814, -1.488513, 1, 0.5058824, 0, 1,
-1.34326, -0.9302249, -2.214464, 1, 0.509804, 0, 1,
-1.340492, 0.7486855, -2.114846, 1, 0.5176471, 0, 1,
-1.335494, -0.3711492, -2.116654, 1, 0.5215687, 0, 1,
-1.329552, 0.0335414, -2.391237, 1, 0.5294118, 0, 1,
-1.326835, 0.3667987, -3.232296, 1, 0.5333334, 0, 1,
-1.318699, -0.08376873, -2.214182, 1, 0.5411765, 0, 1,
-1.317062, 1.560152, -0.08417616, 1, 0.5450981, 0, 1,
-1.314845, -0.1385033, -1.970188, 1, 0.5529412, 0, 1,
-1.297777, 1.017796, -0.1786676, 1, 0.5568628, 0, 1,
-1.29674, 1.5907, -1.365221, 1, 0.5647059, 0, 1,
-1.294329, 0.6734873, -2.089464, 1, 0.5686275, 0, 1,
-1.291659, 0.4353648, -2.445562, 1, 0.5764706, 0, 1,
-1.278227, 0.02329497, 0.007983264, 1, 0.5803922, 0, 1,
-1.269928, 0.9905835, 0.6885814, 1, 0.5882353, 0, 1,
-1.268881, 0.1533822, 0.7069792, 1, 0.5921569, 0, 1,
-1.265983, -0.8869154, -2.225642, 1, 0.6, 0, 1,
-1.259557, 1.154642, -1.910676, 1, 0.6078432, 0, 1,
-1.251255, -0.9978015, -2.911732, 1, 0.6117647, 0, 1,
-1.234869, -0.8786451, -5.017705, 1, 0.6196079, 0, 1,
-1.233414, -1.372424, -1.835171, 1, 0.6235294, 0, 1,
-1.231224, -0.70194, -2.066223, 1, 0.6313726, 0, 1,
-1.225355, -0.597177, -0.9825045, 1, 0.6352941, 0, 1,
-1.224855, -1.565709, -1.619448, 1, 0.6431373, 0, 1,
-1.212589, 0.4617676, -0.3504805, 1, 0.6470588, 0, 1,
-1.211332, 0.03183327, -0.2888308, 1, 0.654902, 0, 1,
-1.210021, 0.1423599, -2.390486, 1, 0.6588235, 0, 1,
-1.193052, 0.4032912, -2.225424, 1, 0.6666667, 0, 1,
-1.185228, 0.1460867, -2.003709, 1, 0.6705883, 0, 1,
-1.177814, -0.9799198, -1.595142, 1, 0.6784314, 0, 1,
-1.175506, 0.2270606, -0.6176652, 1, 0.682353, 0, 1,
-1.163218, 0.4932123, -2.957213, 1, 0.6901961, 0, 1,
-1.161902, -0.5944083, -2.578789, 1, 0.6941177, 0, 1,
-1.160293, -0.4511083, -2.463115, 1, 0.7019608, 0, 1,
-1.157295, 0.9107828, -0.3710219, 1, 0.7098039, 0, 1,
-1.156321, -1.513288, -3.862373, 1, 0.7137255, 0, 1,
-1.155467, 0.2424987, -1.54607, 1, 0.7215686, 0, 1,
-1.155363, -0.229658, -0.6869323, 1, 0.7254902, 0, 1,
-1.152707, 1.315627, -0.4774214, 1, 0.7333333, 0, 1,
-1.150441, -0.2403051, -2.573991, 1, 0.7372549, 0, 1,
-1.14862, -1.903336, -3.436078, 1, 0.7450981, 0, 1,
-1.144034, -0.4387694, -3.510628, 1, 0.7490196, 0, 1,
-1.14362, 1.237686, 0.1499183, 1, 0.7568628, 0, 1,
-1.14064, -1.234937, 0.2204471, 1, 0.7607843, 0, 1,
-1.139233, -1.611144, -3.488578, 1, 0.7686275, 0, 1,
-1.136678, 0.9865988, -0.5249558, 1, 0.772549, 0, 1,
-1.132665, -1.527928, -2.426514, 1, 0.7803922, 0, 1,
-1.132611, -0.004252962, -1.237129, 1, 0.7843137, 0, 1,
-1.131147, -2.105136, -3.81135, 1, 0.7921569, 0, 1,
-1.130429, -0.682292, -2.248845, 1, 0.7960784, 0, 1,
-1.115469, 0.2389062, -1.782814, 1, 0.8039216, 0, 1,
-1.108915, -1.590124, -1.874257, 1, 0.8117647, 0, 1,
-1.107864, 1.105439, -0.361767, 1, 0.8156863, 0, 1,
-1.103297, -0.3198229, -2.25102, 1, 0.8235294, 0, 1,
-1.098519, 1.850343, 1.163338, 1, 0.827451, 0, 1,
-1.092274, 0.5324265, -1.4189, 1, 0.8352941, 0, 1,
-1.090781, -0.5541084, -3.13002, 1, 0.8392157, 0, 1,
-1.084507, 1.105704, -0.5904201, 1, 0.8470588, 0, 1,
-1.084422, -1.753738, -4.169489, 1, 0.8509804, 0, 1,
-1.078879, -0.8169195, -2.446969, 1, 0.8588235, 0, 1,
-1.078385, 0.8406959, -0.8522285, 1, 0.8627451, 0, 1,
-1.075673, 0.8022313, -1.594157, 1, 0.8705882, 0, 1,
-1.072661, 0.7677146, -2.203477, 1, 0.8745098, 0, 1,
-1.069245, -1.9916, -2.002055, 1, 0.8823529, 0, 1,
-1.056533, -0.4777858, -3.476034, 1, 0.8862745, 0, 1,
-1.049535, 0.3406024, -0.8793527, 1, 0.8941177, 0, 1,
-1.046881, -0.1390458, -1.181695, 1, 0.8980392, 0, 1,
-1.039177, 2.567554, 0.2967148, 1, 0.9058824, 0, 1,
-1.036463, 0.9967458, -1.350814, 1, 0.9137255, 0, 1,
-1.023936, 0.5491168, 0.125478, 1, 0.9176471, 0, 1,
-1.014647, 1.899668, 1.563976, 1, 0.9254902, 0, 1,
-1.010712, 0.1080166, -2.418214, 1, 0.9294118, 0, 1,
-1.003079, 0.3703609, -1.540499, 1, 0.9372549, 0, 1,
-1.001936, 0.8896159, -0.3069414, 1, 0.9411765, 0, 1,
-0.9999907, 1.096625, -1.681438, 1, 0.9490196, 0, 1,
-0.9972397, -1.535879, -2.928737, 1, 0.9529412, 0, 1,
-0.991793, 0.4458878, -0.9071489, 1, 0.9607843, 0, 1,
-0.9851398, 0.8873356, 1.44527, 1, 0.9647059, 0, 1,
-0.9827783, 1.723873, 1.882859, 1, 0.972549, 0, 1,
-0.9808419, 0.5882862, -1.57995, 1, 0.9764706, 0, 1,
-0.9780763, 0.3731076, -2.092077, 1, 0.9843137, 0, 1,
-0.956121, -1.073876, -1.878673, 1, 0.9882353, 0, 1,
-0.9496002, -1.233601, -2.37707, 1, 0.9960784, 0, 1,
-0.9443575, -1.85992, -1.747188, 0.9960784, 1, 0, 1,
-0.9441947, 0.1056964, -0.07186708, 0.9921569, 1, 0, 1,
-0.9369107, 0.2848204, -1.364886, 0.9843137, 1, 0, 1,
-0.932416, -1.764094, -2.298962, 0.9803922, 1, 0, 1,
-0.9316913, -1.300533, -2.720401, 0.972549, 1, 0, 1,
-0.9252245, 0.7265356, -0.5559336, 0.9686275, 1, 0, 1,
-0.9212768, 0.2121438, -1.162449, 0.9607843, 1, 0, 1,
-0.9169698, 2.090322, 0.04782338, 0.9568627, 1, 0, 1,
-0.9090753, -0.212478, -1.395809, 0.9490196, 1, 0, 1,
-0.9085185, 0.1689231, -0.9714119, 0.945098, 1, 0, 1,
-0.9054376, -0.4322096, -3.40528, 0.9372549, 1, 0, 1,
-0.9011605, 1.103877, -1.193817, 0.9333333, 1, 0, 1,
-0.900459, 0.6521765, -1.326455, 0.9254902, 1, 0, 1,
-0.900046, -0.1667967, -1.557123, 0.9215686, 1, 0, 1,
-0.8971047, 0.4922766, -0.441727, 0.9137255, 1, 0, 1,
-0.8934354, -0.1242517, -0.5886344, 0.9098039, 1, 0, 1,
-0.893425, 1.292717, -0.7071815, 0.9019608, 1, 0, 1,
-0.8913127, 0.529303, -0.4445508, 0.8941177, 1, 0, 1,
-0.8913087, 1.001274, -0.8071285, 0.8901961, 1, 0, 1,
-0.8911889, 0.3424688, -0.0323182, 0.8823529, 1, 0, 1,
-0.8874947, 1.175044, 0.8544369, 0.8784314, 1, 0, 1,
-0.8860995, -0.5843017, -3.933133, 0.8705882, 1, 0, 1,
-0.8842548, 1.565219, -0.5985638, 0.8666667, 1, 0, 1,
-0.8762276, 0.5632736, 1.363317, 0.8588235, 1, 0, 1,
-0.8754062, -0.3820581, -3.270299, 0.854902, 1, 0, 1,
-0.8748714, 0.824075, -0.7772429, 0.8470588, 1, 0, 1,
-0.874256, 0.8524962, -2.385116, 0.8431373, 1, 0, 1,
-0.8729528, -0.01799818, -2.836487, 0.8352941, 1, 0, 1,
-0.8667015, 0.5257724, -0.7400366, 0.8313726, 1, 0, 1,
-0.8652313, 1.348007, -0.4406648, 0.8235294, 1, 0, 1,
-0.8630949, -1.397662, -2.029132, 0.8196079, 1, 0, 1,
-0.8527868, 0.7044238, -2.403014, 0.8117647, 1, 0, 1,
-0.8501317, 1.047428, 0.5915237, 0.8078431, 1, 0, 1,
-0.849876, -0.397072, -3.316264, 0.8, 1, 0, 1,
-0.831373, 0.2913483, -2.807015, 0.7921569, 1, 0, 1,
-0.8255735, -0.2430028, -0.9707132, 0.7882353, 1, 0, 1,
-0.8249316, -0.3720874, -1.638334, 0.7803922, 1, 0, 1,
-0.8240024, -0.7550773, -3.74435, 0.7764706, 1, 0, 1,
-0.8237053, -0.4134163, -0.4311708, 0.7686275, 1, 0, 1,
-0.8232187, 1.010975, -1.958827, 0.7647059, 1, 0, 1,
-0.8231541, 0.3394753, -2.358742, 0.7568628, 1, 0, 1,
-0.8196907, 0.1406749, -1.8802, 0.7529412, 1, 0, 1,
-0.8119359, 0.2442797, -1.142872, 0.7450981, 1, 0, 1,
-0.8119314, 0.4596303, 2.381864, 0.7411765, 1, 0, 1,
-0.8096527, 1.058944, -3.160073, 0.7333333, 1, 0, 1,
-0.8093691, 0.3367146, -0.3761622, 0.7294118, 1, 0, 1,
-0.8037813, 1.344759, -1.396078, 0.7215686, 1, 0, 1,
-0.8027505, 1.820359, 0.03615988, 0.7176471, 1, 0, 1,
-0.7965623, 0.7281008, -0.4487377, 0.7098039, 1, 0, 1,
-0.796051, -0.8140608, -2.452887, 0.7058824, 1, 0, 1,
-0.7953231, 0.971379, -1.447376, 0.6980392, 1, 0, 1,
-0.786808, -0.1811778, -0.4940478, 0.6901961, 1, 0, 1,
-0.7855883, -0.2079721, -2.941083, 0.6862745, 1, 0, 1,
-0.7822707, -1.406012, -2.060313, 0.6784314, 1, 0, 1,
-0.7793192, -0.9032402, -3.950729, 0.6745098, 1, 0, 1,
-0.7786542, -0.6920918, -2.581511, 0.6666667, 1, 0, 1,
-0.7779054, -1.755899, -3.108288, 0.6627451, 1, 0, 1,
-0.7758152, 0.8055026, -0.607175, 0.654902, 1, 0, 1,
-0.7745835, 1.650535, -0.4975968, 0.6509804, 1, 0, 1,
-0.7738276, 1.429546, 0.04539348, 0.6431373, 1, 0, 1,
-0.7694926, -1.579046, -3.47547, 0.6392157, 1, 0, 1,
-0.7646298, -1.011558, -1.249244, 0.6313726, 1, 0, 1,
-0.7553745, 0.5747722, -0.8173614, 0.627451, 1, 0, 1,
-0.7526189, -0.2207901, -2.884544, 0.6196079, 1, 0, 1,
-0.7454652, -0.06544665, -2.022811, 0.6156863, 1, 0, 1,
-0.7419353, 0.05997967, -2.04316, 0.6078432, 1, 0, 1,
-0.7394406, -0.1584287, -1.317789, 0.6039216, 1, 0, 1,
-0.7372833, 0.4801574, -1.316772, 0.5960785, 1, 0, 1,
-0.7370072, 0.5478218, -0.3270423, 0.5882353, 1, 0, 1,
-0.7332712, -0.9728413, -3.370255, 0.5843138, 1, 0, 1,
-0.73266, -0.1605782, -0.7096307, 0.5764706, 1, 0, 1,
-0.7297278, 0.322231, 0.006286087, 0.572549, 1, 0, 1,
-0.7270007, 0.6309732, -0.5189903, 0.5647059, 1, 0, 1,
-0.7241775, -1.241738, -2.40447, 0.5607843, 1, 0, 1,
-0.718454, 0.2283414, 0.2039859, 0.5529412, 1, 0, 1,
-0.7178832, -0.1821366, -1.867676, 0.5490196, 1, 0, 1,
-0.704825, -0.1447717, -2.676484, 0.5411765, 1, 0, 1,
-0.7039672, 0.67203, 0.5107313, 0.5372549, 1, 0, 1,
-0.7028587, -0.4131051, -2.924792, 0.5294118, 1, 0, 1,
-0.7020358, -0.1937747, -2.379834, 0.5254902, 1, 0, 1,
-0.6993497, 0.5351748, -2.381531, 0.5176471, 1, 0, 1,
-0.6969267, 0.2552305, -0.6541474, 0.5137255, 1, 0, 1,
-0.6869994, -1.426423, -2.221034, 0.5058824, 1, 0, 1,
-0.6866322, 1.943756, 1.512657, 0.5019608, 1, 0, 1,
-0.6840388, 1.236642, 0.4020259, 0.4941176, 1, 0, 1,
-0.6778713, 0.1292455, -2.650689, 0.4862745, 1, 0, 1,
-0.6767673, -2.304651, -3.491605, 0.4823529, 1, 0, 1,
-0.6724802, -0.4497405, -1.136961, 0.4745098, 1, 0, 1,
-0.6710716, 0.3854746, -2.34588, 0.4705882, 1, 0, 1,
-0.6670718, -0.6313204, -2.943741, 0.4627451, 1, 0, 1,
-0.6595294, 0.5535713, -2.258379, 0.4588235, 1, 0, 1,
-0.6568248, -1.727341, -1.730142, 0.4509804, 1, 0, 1,
-0.6511662, 0.7128715, -1.074905, 0.4470588, 1, 0, 1,
-0.6491318, -0.1768334, -1.857641, 0.4392157, 1, 0, 1,
-0.6450952, 0.0187017, -0.5243097, 0.4352941, 1, 0, 1,
-0.6449797, 0.8325848, -0.1447465, 0.427451, 1, 0, 1,
-0.6418357, 0.334357, 0.1330295, 0.4235294, 1, 0, 1,
-0.6353087, -0.8458614, -4.722195, 0.4156863, 1, 0, 1,
-0.6334891, 0.8023742, -0.9857051, 0.4117647, 1, 0, 1,
-0.6286126, -0.09778419, -0.2385132, 0.4039216, 1, 0, 1,
-0.6253986, 0.8481547, -0.2854315, 0.3960784, 1, 0, 1,
-0.6248773, 0.8331549, -0.5012669, 0.3921569, 1, 0, 1,
-0.622997, -0.9454934, -1.850082, 0.3843137, 1, 0, 1,
-0.6194195, -0.3046692, -2.375143, 0.3803922, 1, 0, 1,
-0.6153502, 0.8692758, 0.4051085, 0.372549, 1, 0, 1,
-0.611298, -0.8038189, -2.598964, 0.3686275, 1, 0, 1,
-0.6110755, -2.045171, -2.633494, 0.3607843, 1, 0, 1,
-0.6098104, -1.31631, -3.479719, 0.3568628, 1, 0, 1,
-0.6049115, 0.8251005, -0.7380328, 0.3490196, 1, 0, 1,
-0.6047603, -0.4763344, -1.979792, 0.345098, 1, 0, 1,
-0.5990479, 1.341408, -1.562086, 0.3372549, 1, 0, 1,
-0.5928714, 1.194458, -0.4984242, 0.3333333, 1, 0, 1,
-0.585795, -0.3234692, -1.067742, 0.3254902, 1, 0, 1,
-0.5832019, 0.2242443, -2.139287, 0.3215686, 1, 0, 1,
-0.5825813, 0.7991648, -0.6577678, 0.3137255, 1, 0, 1,
-0.576475, -0.3069984, -2.650202, 0.3098039, 1, 0, 1,
-0.5720203, 0.1664953, -2.077838, 0.3019608, 1, 0, 1,
-0.5706972, -0.3083816, -2.603949, 0.2941177, 1, 0, 1,
-0.5704654, 0.6634111, -2.028266, 0.2901961, 1, 0, 1,
-0.5651913, 1.108986, -0.600859, 0.282353, 1, 0, 1,
-0.5615088, -1.21683, -1.393664, 0.2784314, 1, 0, 1,
-0.5587866, -0.7268188, -1.114687, 0.2705882, 1, 0, 1,
-0.5571527, 0.875609, 0.5915381, 0.2666667, 1, 0, 1,
-0.5552872, 0.7528283, -1.401815, 0.2588235, 1, 0, 1,
-0.5550926, 0.3786786, -1.472162, 0.254902, 1, 0, 1,
-0.5508367, 0.3699403, -2.915675, 0.2470588, 1, 0, 1,
-0.5481533, -0.8971814, -3.66013, 0.2431373, 1, 0, 1,
-0.5451053, -1.098653, -3.530841, 0.2352941, 1, 0, 1,
-0.5377109, 1.665238, 0.09920907, 0.2313726, 1, 0, 1,
-0.5376623, -1.15267, -2.580013, 0.2235294, 1, 0, 1,
-0.5293254, -1.243983, -3.352717, 0.2196078, 1, 0, 1,
-0.5269107, -0.3742605, -4.436659, 0.2117647, 1, 0, 1,
-0.5268787, 0.5603546, 0.2429165, 0.2078431, 1, 0, 1,
-0.5252534, -0.5027111, -1.962381, 0.2, 1, 0, 1,
-0.5248703, 0.3965081, -0.3751374, 0.1921569, 1, 0, 1,
-0.5194331, 0.368271, -2.488663, 0.1882353, 1, 0, 1,
-0.5182121, 0.4392866, 0.2284794, 0.1803922, 1, 0, 1,
-0.5139754, 1.090392, 0.0684061, 0.1764706, 1, 0, 1,
-0.5064598, -0.662559, -0.9031633, 0.1686275, 1, 0, 1,
-0.5028394, -1.473792, -5.442176, 0.1647059, 1, 0, 1,
-0.5006782, 0.08587854, -0.7731074, 0.1568628, 1, 0, 1,
-0.4934831, 0.8006085, -1.584941, 0.1529412, 1, 0, 1,
-0.4906368, -1.111215, -4.425922, 0.145098, 1, 0, 1,
-0.4895588, 0.9432485, -1.501669, 0.1411765, 1, 0, 1,
-0.4891044, -1.263177, -3.75653, 0.1333333, 1, 0, 1,
-0.4876688, -0.4364854, -1.918809, 0.1294118, 1, 0, 1,
-0.4869521, -0.1665142, -1.934068, 0.1215686, 1, 0, 1,
-0.485292, -0.4609699, -1.869264, 0.1176471, 1, 0, 1,
-0.4833572, 0.2632481, -2.755468, 0.1098039, 1, 0, 1,
-0.4825144, 0.9478936, -0.009131601, 0.1058824, 1, 0, 1,
-0.4738239, -1.711586, -3.791571, 0.09803922, 1, 0, 1,
-0.4704375, -0.1918945, -3.278496, 0.09019608, 1, 0, 1,
-0.4703191, -0.1858087, -2.061994, 0.08627451, 1, 0, 1,
-0.4695108, 0.675666, -1.299429, 0.07843138, 1, 0, 1,
-0.4692426, 0.0960827, -0.6163914, 0.07450981, 1, 0, 1,
-0.4689052, -1.755229, -3.344414, 0.06666667, 1, 0, 1,
-0.4656938, -0.0905711, -0.9949493, 0.0627451, 1, 0, 1,
-0.4585319, 0.6344216, -0.0861748, 0.05490196, 1, 0, 1,
-0.4580825, -2.267123, -1.08364, 0.05098039, 1, 0, 1,
-0.4569678, 0.7787575, -0.9659632, 0.04313726, 1, 0, 1,
-0.456432, -0.4809711, -1.446917, 0.03921569, 1, 0, 1,
-0.4534462, 0.770371, 0.6967257, 0.03137255, 1, 0, 1,
-0.4513167, -0.9772209, -2.420957, 0.02745098, 1, 0, 1,
-0.4323173, 1.149605, 0.00951534, 0.01960784, 1, 0, 1,
-0.432166, -0.2837176, -3.151754, 0.01568628, 1, 0, 1,
-0.4308253, -0.5834957, -2.64775, 0.007843138, 1, 0, 1,
-0.4282618, 0.6139403, -0.1831209, 0.003921569, 1, 0, 1,
-0.424426, -1.838469, -2.804823, 0, 1, 0.003921569, 1,
-0.4164017, -0.4799524, -1.623172, 0, 1, 0.01176471, 1,
-0.4157526, -1.024247, -1.782086, 0, 1, 0.01568628, 1,
-0.4120854, -0.5051093, -2.287765, 0, 1, 0.02352941, 1,
-0.4105696, 1.093393, -1.169441, 0, 1, 0.02745098, 1,
-0.409989, -0.4275944, -1.649059, 0, 1, 0.03529412, 1,
-0.4082295, -1.074151, -3.450025, 0, 1, 0.03921569, 1,
-0.4034681, -0.03641822, -1.475306, 0, 1, 0.04705882, 1,
-0.4004166, 1.336895, -0.105093, 0, 1, 0.05098039, 1,
-0.3980586, -1.252586, -3.825938, 0, 1, 0.05882353, 1,
-0.3938985, -2.073744, -2.67666, 0, 1, 0.0627451, 1,
-0.3932474, -0.1793649, -1.116401, 0, 1, 0.07058824, 1,
-0.3860607, 0.03328954, -1.393498, 0, 1, 0.07450981, 1,
-0.3834882, -1.531451, -3.815704, 0, 1, 0.08235294, 1,
-0.3832589, 0.01905844, -0.9213956, 0, 1, 0.08627451, 1,
-0.3818272, 1.076944, -0.6890057, 0, 1, 0.09411765, 1,
-0.3813691, -0.1986356, -1.242151, 0, 1, 0.1019608, 1,
-0.3775247, -1.339383, -2.248192, 0, 1, 0.1058824, 1,
-0.3759441, -0.3627531, -4.13575, 0, 1, 0.1137255, 1,
-0.373727, 0.2469031, -0.3668494, 0, 1, 0.1176471, 1,
-0.3714274, -1.692753, -1.410218, 0, 1, 0.1254902, 1,
-0.3687159, -0.8920704, -2.391104, 0, 1, 0.1294118, 1,
-0.3683952, -0.4808449, -2.889827, 0, 1, 0.1372549, 1,
-0.3673289, -0.2399202, -1.638666, 0, 1, 0.1411765, 1,
-0.3638564, -0.4789546, -2.949101, 0, 1, 0.1490196, 1,
-0.3630272, 0.6207622, 0.8528463, 0, 1, 0.1529412, 1,
-0.3621042, -1.364333, -3.250676, 0, 1, 0.1607843, 1,
-0.3616383, -0.04122869, -2.101776, 0, 1, 0.1647059, 1,
-0.3607268, 0.828804, -1.982111, 0, 1, 0.172549, 1,
-0.3553176, 0.9388778, -0.5247018, 0, 1, 0.1764706, 1,
-0.3491103, -0.1249034, -0.9120052, 0, 1, 0.1843137, 1,
-0.348879, 0.7067361, -1.270375, 0, 1, 0.1882353, 1,
-0.3468448, 0.4978448, -0.3357537, 0, 1, 0.1960784, 1,
-0.3453381, -1.299521, -2.070079, 0, 1, 0.2039216, 1,
-0.3439942, -0.9213586, -2.652966, 0, 1, 0.2078431, 1,
-0.3439564, 1.722639, 0.1374303, 0, 1, 0.2156863, 1,
-0.3416039, -0.959932, -0.982027, 0, 1, 0.2196078, 1,
-0.339175, -0.3347851, -1.850448, 0, 1, 0.227451, 1,
-0.3357159, -1.372755, -3.481797, 0, 1, 0.2313726, 1,
-0.3347315, -0.6680592, -0.6441751, 0, 1, 0.2392157, 1,
-0.3339624, 0.4706204, -1.075462, 0, 1, 0.2431373, 1,
-0.3331521, -0.7713635, -2.515651, 0, 1, 0.2509804, 1,
-0.3329493, -1.294034, -2.482217, 0, 1, 0.254902, 1,
-0.3320308, 0.4945007, -0.3693891, 0, 1, 0.2627451, 1,
-0.3302179, 0.4051521, 0.9775866, 0, 1, 0.2666667, 1,
-0.3285218, 1.647416, 0.03928139, 0, 1, 0.2745098, 1,
-0.3281919, -0.4686571, -3.411072, 0, 1, 0.2784314, 1,
-0.3274648, 0.9699989, 0.8573479, 0, 1, 0.2862745, 1,
-0.3271891, -0.9063732, -4.017782, 0, 1, 0.2901961, 1,
-0.3250954, -0.582343, -0.8852013, 0, 1, 0.2980392, 1,
-0.3245512, 0.2573523, -1.453745, 0, 1, 0.3058824, 1,
-0.3230782, 0.9021811, -1.214419, 0, 1, 0.3098039, 1,
-0.3223893, 0.2726921, -1.57401, 0, 1, 0.3176471, 1,
-0.3213169, 0.3963796, -1.702539, 0, 1, 0.3215686, 1,
-0.3195343, -0.0800886, -1.418082, 0, 1, 0.3294118, 1,
-0.3183569, 0.1156633, -2.007772, 0, 1, 0.3333333, 1,
-0.3180451, 0.6286879, -1.863244, 0, 1, 0.3411765, 1,
-0.3170599, -1.468628, -3.638072, 0, 1, 0.345098, 1,
-0.3146176, 1.271643, 2.147611, 0, 1, 0.3529412, 1,
-0.3129101, -1.429567, -1.927339, 0, 1, 0.3568628, 1,
-0.3120066, 1.429784, -1.099655, 0, 1, 0.3647059, 1,
-0.3110214, 0.3073361, -1.425946, 0, 1, 0.3686275, 1,
-0.3104813, 1.3108, 0.5222977, 0, 1, 0.3764706, 1,
-0.3060127, 0.7695366, -3.062192, 0, 1, 0.3803922, 1,
-0.3039775, 1.151789, -1.447861, 0, 1, 0.3882353, 1,
-0.3038678, 0.4312181, -0.9912983, 0, 1, 0.3921569, 1,
-0.303609, -0.63302, -4.604774, 0, 1, 0.4, 1,
-0.3021091, -1.22492, -3.793303, 0, 1, 0.4078431, 1,
-0.3020883, -0.4760573, -1.674607, 0, 1, 0.4117647, 1,
-0.3019228, 0.4989176, 0.4306777, 0, 1, 0.4196078, 1,
-0.3017332, 0.05207941, -1.084532, 0, 1, 0.4235294, 1,
-0.3014812, 2.722671, 0.2334828, 0, 1, 0.4313726, 1,
-0.2940464, 0.4532594, 0.5102661, 0, 1, 0.4352941, 1,
-0.2927274, 0.02918134, -0.1551406, 0, 1, 0.4431373, 1,
-0.292438, -1.37186, -2.620927, 0, 1, 0.4470588, 1,
-0.283601, -0.4212265, -3.854715, 0, 1, 0.454902, 1,
-0.2826821, 0.1640828, -1.263713, 0, 1, 0.4588235, 1,
-0.2823652, -1.087257, -2.292355, 0, 1, 0.4666667, 1,
-0.2765031, 0.4316607, -1.237606, 0, 1, 0.4705882, 1,
-0.2751834, -0.591167, -2.640193, 0, 1, 0.4784314, 1,
-0.2751601, -0.890821, -2.53311, 0, 1, 0.4823529, 1,
-0.2735745, -1.020247, -3.040849, 0, 1, 0.4901961, 1,
-0.2723666, -0.492337, -3.462411, 0, 1, 0.4941176, 1,
-0.2664156, 0.6246323, -0.1353945, 0, 1, 0.5019608, 1,
-0.2644369, -0.01396891, -1.537442, 0, 1, 0.509804, 1,
-0.2610516, -0.5407388, -3.990135, 0, 1, 0.5137255, 1,
-0.2540783, 0.8153089, -0.4945072, 0, 1, 0.5215687, 1,
-0.2497248, -0.9580591, -0.6969264, 0, 1, 0.5254902, 1,
-0.2491676, -1.351119, -2.213345, 0, 1, 0.5333334, 1,
-0.2490072, -1.024306, -2.109449, 0, 1, 0.5372549, 1,
-0.2474014, -1.174393, -2.126057, 0, 1, 0.5450981, 1,
-0.2464503, -0.9685518, -1.619249, 0, 1, 0.5490196, 1,
-0.2464252, -1.006593, -4.486661, 0, 1, 0.5568628, 1,
-0.2421395, 0.009261606, -0.5136009, 0, 1, 0.5607843, 1,
-0.2418733, 0.8488209, -1.907883, 0, 1, 0.5686275, 1,
-0.2408167, -2.227731, -4.686102, 0, 1, 0.572549, 1,
-0.2377442, -0.6260273, -2.905337, 0, 1, 0.5803922, 1,
-0.2371691, -0.3072231, -2.75214, 0, 1, 0.5843138, 1,
-0.2348019, 0.6889806, -0.9246039, 0, 1, 0.5921569, 1,
-0.2309271, -0.1460701, -2.001831, 0, 1, 0.5960785, 1,
-0.2237005, -0.3861345, -1.602935, 0, 1, 0.6039216, 1,
-0.2214548, 1.078954, -1.059757, 0, 1, 0.6117647, 1,
-0.2171306, -1.964682, -2.176723, 0, 1, 0.6156863, 1,
-0.2025433, 0.3749044, -0.709828, 0, 1, 0.6235294, 1,
-0.2023121, 2.070978, -1.21199, 0, 1, 0.627451, 1,
-0.2011129, -0.4447814, -3.460257, 0, 1, 0.6352941, 1,
-0.1977348, 0.3346485, -0.6489314, 0, 1, 0.6392157, 1,
-0.194253, 0.1345473, -1.33894, 0, 1, 0.6470588, 1,
-0.193281, -0.4504974, -1.459546, 0, 1, 0.6509804, 1,
-0.192247, 1.070869, 0.1292383, 0, 1, 0.6588235, 1,
-0.1890065, 0.2316762, -0.6217332, 0, 1, 0.6627451, 1,
-0.1876181, -0.7312165, -2.612558, 0, 1, 0.6705883, 1,
-0.186372, 0.8194967, 1.17041, 0, 1, 0.6745098, 1,
-0.180878, 1.470889, -1.04076, 0, 1, 0.682353, 1,
-0.1774398, 1.412019, 0.6185163, 0, 1, 0.6862745, 1,
-0.1764184, -0.1226202, -1.483261, 0, 1, 0.6941177, 1,
-0.1757087, 0.09496529, 1.40787, 0, 1, 0.7019608, 1,
-0.1747919, 0.9210663, -1.513009, 0, 1, 0.7058824, 1,
-0.1719786, -0.4350812, -4.395586, 0, 1, 0.7137255, 1,
-0.1718115, -0.8022732, -3.105202, 0, 1, 0.7176471, 1,
-0.1716066, 1.120992, 0.7875033, 0, 1, 0.7254902, 1,
-0.1670754, 0.7029282, -0.6367829, 0, 1, 0.7294118, 1,
-0.1643705, -0.261012, -1.863018, 0, 1, 0.7372549, 1,
-0.1620249, -0.9260802, -3.300236, 0, 1, 0.7411765, 1,
-0.1583356, -0.7560088, -1.221708, 0, 1, 0.7490196, 1,
-0.1569888, -0.3739003, -3.772803, 0, 1, 0.7529412, 1,
-0.1459124, -1.137748, -1.851647, 0, 1, 0.7607843, 1,
-0.1456976, -0.9701487, -1.959324, 0, 1, 0.7647059, 1,
-0.1404493, 2.515535, -0.9343598, 0, 1, 0.772549, 1,
-0.1378632, 1.052349, -0.5784431, 0, 1, 0.7764706, 1,
-0.1361067, -1.397309, -3.520123, 0, 1, 0.7843137, 1,
-0.1327201, 0.2576474, -1.2815, 0, 1, 0.7882353, 1,
-0.1278596, 0.1742818, 0.01774897, 0, 1, 0.7960784, 1,
-0.1260584, 0.3676664, -0.7181085, 0, 1, 0.8039216, 1,
-0.1251265, -0.09575678, -0.2470414, 0, 1, 0.8078431, 1,
-0.1212582, -1.298918, -2.113476, 0, 1, 0.8156863, 1,
-0.1112427, -0.1286486, -1.22827, 0, 1, 0.8196079, 1,
-0.110852, -0.5446787, -2.910814, 0, 1, 0.827451, 1,
-0.1044542, -0.5969705, -1.564731, 0, 1, 0.8313726, 1,
-0.1019679, -1.077509, -3.082187, 0, 1, 0.8392157, 1,
-0.1009951, -0.6243805, -2.384284, 0, 1, 0.8431373, 1,
-0.1005223, -1.415591, -3.695968, 0, 1, 0.8509804, 1,
-0.09960551, 1.314871, 0.0691187, 0, 1, 0.854902, 1,
-0.098007, -1.950545, -3.664152, 0, 1, 0.8627451, 1,
-0.09728365, -1.124346, -2.895786, 0, 1, 0.8666667, 1,
-0.09365273, 1.980355, -2.044842, 0, 1, 0.8745098, 1,
-0.09332123, 0.4450458, -1.530761, 0, 1, 0.8784314, 1,
-0.09290428, 0.6152163, 0.4682566, 0, 1, 0.8862745, 1,
-0.09286153, -0.8823044, -2.135813, 0, 1, 0.8901961, 1,
-0.08702308, -1.272463, -1.094176, 0, 1, 0.8980392, 1,
-0.08583888, 1.194477, 0.2424025, 0, 1, 0.9058824, 1,
-0.07943556, -0.3615052, -1.858347, 0, 1, 0.9098039, 1,
-0.07605166, 0.7185362, 0.5590904, 0, 1, 0.9176471, 1,
-0.07034373, -0.7406464, -1.848883, 0, 1, 0.9215686, 1,
-0.0668929, -0.8045123, -0.8423529, 0, 1, 0.9294118, 1,
-0.06239884, 0.6692437, 0.6255503, 0, 1, 0.9333333, 1,
-0.06153016, -0.1466353, -2.715276, 0, 1, 0.9411765, 1,
-0.05899365, -0.9112091, -1.257434, 0, 1, 0.945098, 1,
-0.05895058, -0.1628083, -1.66062, 0, 1, 0.9529412, 1,
-0.05717864, -1.193597, -2.973756, 0, 1, 0.9568627, 1,
-0.05587905, 0.06068309, -0.3906774, 0, 1, 0.9647059, 1,
-0.04753252, -0.9085016, -3.227094, 0, 1, 0.9686275, 1,
-0.04651502, -1.291296, -2.172402, 0, 1, 0.9764706, 1,
-0.04630491, -1.526501, -1.549214, 0, 1, 0.9803922, 1,
-0.03849719, 0.3307721, 1.367776, 0, 1, 0.9882353, 1,
-0.03629282, -0.3569221, -1.191564, 0, 1, 0.9921569, 1,
-0.03597656, -0.1580163, -3.408724, 0, 1, 1, 1,
-0.0359694, -0.3941849, -4.440982, 0, 0.9921569, 1, 1,
-0.02491892, 0.630704, 0.9791719, 0, 0.9882353, 1, 1,
-0.02353861, 0.9075156, -0.1808251, 0, 0.9803922, 1, 1,
-0.02174405, 0.6173533, 0.7779949, 0, 0.9764706, 1, 1,
-0.02105487, 1.632846, 0.4952824, 0, 0.9686275, 1, 1,
-0.02011587, -1.623872, -3.419337, 0, 0.9647059, 1, 1,
-0.0188139, 0.8951588, 1.514632, 0, 0.9568627, 1, 1,
-0.01428636, 0.3137238, 0.5725086, 0, 0.9529412, 1, 1,
-0.01298898, -0.6385796, -2.765159, 0, 0.945098, 1, 1,
-0.008558586, 0.2389891, -0.6606073, 0, 0.9411765, 1, 1,
-0.007544877, 1.252431, -0.7509202, 0, 0.9333333, 1, 1,
-0.002585698, -1.119227, -2.424599, 0, 0.9294118, 1, 1,
0.0005719165, -0.7824814, 2.417267, 0, 0.9215686, 1, 1,
0.000824525, 0.9035575, 1.030478, 0, 0.9176471, 1, 1,
0.00347882, 0.5930355, 0.9070621, 0, 0.9098039, 1, 1,
0.005255462, 0.1719892, -0.6084397, 0, 0.9058824, 1, 1,
0.01210073, 0.8584472, 1.607204, 0, 0.8980392, 1, 1,
0.0137468, -0.3460954, 2.351543, 0, 0.8901961, 1, 1,
0.01774356, 0.02833418, -0.2716573, 0, 0.8862745, 1, 1,
0.01867939, 0.385611, 0.2304593, 0, 0.8784314, 1, 1,
0.02122124, 0.3932201, -0.8156269, 0, 0.8745098, 1, 1,
0.02176, -0.1002773, 2.441843, 0, 0.8666667, 1, 1,
0.02546383, -0.08978951, 2.361762, 0, 0.8627451, 1, 1,
0.02855836, -0.9867307, 4.837297, 0, 0.854902, 1, 1,
0.03099157, -0.9942288, 1.268561, 0, 0.8509804, 1, 1,
0.03366188, -1.287531, 3.253517, 0, 0.8431373, 1, 1,
0.03392154, -1.436207, 4.624269, 0, 0.8392157, 1, 1,
0.03619097, -1.19083, 3.017451, 0, 0.8313726, 1, 1,
0.03825205, -1.872554, 2.220454, 0, 0.827451, 1, 1,
0.04586202, -1.75095, 4.215724, 0, 0.8196079, 1, 1,
0.0525375, -0.7343938, 1.579957, 0, 0.8156863, 1, 1,
0.05253978, -0.3828735, 2.277084, 0, 0.8078431, 1, 1,
0.05423209, 0.805916, 1.976804, 0, 0.8039216, 1, 1,
0.05660634, -0.7526808, 2.559102, 0, 0.7960784, 1, 1,
0.06004793, 0.8167517, -0.5252841, 0, 0.7882353, 1, 1,
0.06032925, 0.6191977, 0.1182773, 0, 0.7843137, 1, 1,
0.06316462, -0.1233406, 4.046674, 0, 0.7764706, 1, 1,
0.06413919, -0.4222378, 2.065369, 0, 0.772549, 1, 1,
0.06418607, -1.213372, 3.604035, 0, 0.7647059, 1, 1,
0.06497566, 0.2809087, -0.3345892, 0, 0.7607843, 1, 1,
0.06578741, 0.8292274, 0.7946959, 0, 0.7529412, 1, 1,
0.0666416, -0.6742945, 1.650237, 0, 0.7490196, 1, 1,
0.06887353, 0.2589599, 1.996309, 0, 0.7411765, 1, 1,
0.07088436, 1.80334, 0.1089603, 0, 0.7372549, 1, 1,
0.07122896, -1.590057, 3.191291, 0, 0.7294118, 1, 1,
0.07249144, 0.2919765, 0.4783357, 0, 0.7254902, 1, 1,
0.07369304, 0.07981361, -1.260167, 0, 0.7176471, 1, 1,
0.07751372, 0.4099964, 2.786189, 0, 0.7137255, 1, 1,
0.0790493, -1.558964, 1.892594, 0, 0.7058824, 1, 1,
0.08711626, -0.09188798, 3.298193, 0, 0.6980392, 1, 1,
0.0930071, 1.085821, -0.4660894, 0, 0.6941177, 1, 1,
0.09370623, -0.7455007, 2.566657, 0, 0.6862745, 1, 1,
0.09456575, -0.2631373, 3.067824, 0, 0.682353, 1, 1,
0.09808935, -1.045138, 3.081652, 0, 0.6745098, 1, 1,
0.09980776, -0.1167345, 4.007699, 0, 0.6705883, 1, 1,
0.1000197, 0.09926669, 1.628722, 0, 0.6627451, 1, 1,
0.1013573, -0.02549664, 2.229791, 0, 0.6588235, 1, 1,
0.1014127, -0.5227497, 2.967858, 0, 0.6509804, 1, 1,
0.1028468, 0.6344184, 0.8224395, 0, 0.6470588, 1, 1,
0.1103796, -0.4488334, 2.518013, 0, 0.6392157, 1, 1,
0.1120637, -1.478332, 4.354502, 0, 0.6352941, 1, 1,
0.1134813, 0.3868368, -0.3788638, 0, 0.627451, 1, 1,
0.1185298, 0.9472753, -1.336342, 0, 0.6235294, 1, 1,
0.1187316, 0.04921177, -0.3414608, 0, 0.6156863, 1, 1,
0.1200659, 1.213592, 2.679381, 0, 0.6117647, 1, 1,
0.1279554, -0.1886716, 1.5612, 0, 0.6039216, 1, 1,
0.1300091, -1.377164, 4.165641, 0, 0.5960785, 1, 1,
0.1309995, 0.4129937, -1.291639, 0, 0.5921569, 1, 1,
0.1349065, 0.3639763, -0.5457177, 0, 0.5843138, 1, 1,
0.1367455, 0.3535375, 0.5117625, 0, 0.5803922, 1, 1,
0.1400479, 1.483701, -0.4858229, 0, 0.572549, 1, 1,
0.1443449, 1.202008, 1.287602, 0, 0.5686275, 1, 1,
0.1478792, 0.01884665, 0.6804374, 0, 0.5607843, 1, 1,
0.153356, 0.4803281, -0.185597, 0, 0.5568628, 1, 1,
0.1574555, -0.4593909, 3.028919, 0, 0.5490196, 1, 1,
0.1612788, 0.5767931, -0.4057795, 0, 0.5450981, 1, 1,
0.1625119, 0.6045687, 0.923862, 0, 0.5372549, 1, 1,
0.1642538, -0.1832481, 2.763945, 0, 0.5333334, 1, 1,
0.1650889, 1.091472, 1.129627, 0, 0.5254902, 1, 1,
0.1669985, -0.4609794, 2.760363, 0, 0.5215687, 1, 1,
0.1699959, -1.223687, 2.802422, 0, 0.5137255, 1, 1,
0.173177, -1.501286, 1.6826, 0, 0.509804, 1, 1,
0.1745292, -0.9604437, 2.381948, 0, 0.5019608, 1, 1,
0.1808573, -1.713042, 6.121905, 0, 0.4941176, 1, 1,
0.1824003, -0.06526091, -0.1637311, 0, 0.4901961, 1, 1,
0.1892098, 0.1058425, -0.2805951, 0, 0.4823529, 1, 1,
0.19032, 1.724505, -1.823471, 0, 0.4784314, 1, 1,
0.1913714, 0.6078788, -0.9643292, 0, 0.4705882, 1, 1,
0.1927506, 0.6210956, -0.9000231, 0, 0.4666667, 1, 1,
0.19381, -0.2557647, 1.898781, 0, 0.4588235, 1, 1,
0.1962171, -0.9172893, 3.935369, 0, 0.454902, 1, 1,
0.198486, -1.315467, 2.381211, 0, 0.4470588, 1, 1,
0.2063489, 0.171129, 0.7707608, 0, 0.4431373, 1, 1,
0.2114142, 0.9101347, 1.178078, 0, 0.4352941, 1, 1,
0.2116465, 1.14568, 0.4434754, 0, 0.4313726, 1, 1,
0.2146429, -0.8254003, 2.233647, 0, 0.4235294, 1, 1,
0.2172833, -0.01133291, 1.263963, 0, 0.4196078, 1, 1,
0.2174033, 0.006831347, 0.6206058, 0, 0.4117647, 1, 1,
0.2198028, -1.290388, 3.29544, 0, 0.4078431, 1, 1,
0.2233819, -1.106832, 3.83385, 0, 0.4, 1, 1,
0.2234707, -0.07979287, 3.410688, 0, 0.3921569, 1, 1,
0.2252237, 0.8560164, 1.261113, 0, 0.3882353, 1, 1,
0.228695, -1.850623, 3.96876, 0, 0.3803922, 1, 1,
0.2307882, -0.2210357, 4.386727, 0, 0.3764706, 1, 1,
0.2308431, 0.9326443, 0.1146048, 0, 0.3686275, 1, 1,
0.2415016, -1.004939, 2.741557, 0, 0.3647059, 1, 1,
0.241952, -0.8759457, 4.988246, 0, 0.3568628, 1, 1,
0.2450027, -0.2324392, 3.171101, 0, 0.3529412, 1, 1,
0.2459415, -0.3981098, 3.488094, 0, 0.345098, 1, 1,
0.2464725, -1.051063, 3.59805, 0, 0.3411765, 1, 1,
0.2469865, 0.576537, -0.08586317, 0, 0.3333333, 1, 1,
0.2491011, 1.358344, -0.3776504, 0, 0.3294118, 1, 1,
0.2510408, -1.398988, 2.526931, 0, 0.3215686, 1, 1,
0.2532102, -1.504302, 2.639083, 0, 0.3176471, 1, 1,
0.2538534, 2.069915, -1.775663, 0, 0.3098039, 1, 1,
0.2550086, -1.050583, 3.26506, 0, 0.3058824, 1, 1,
0.2551743, 1.240739, 0.002347951, 0, 0.2980392, 1, 1,
0.2558914, 0.2979538, 1.641011, 0, 0.2901961, 1, 1,
0.2570935, 0.9654521, -1.040297, 0, 0.2862745, 1, 1,
0.258911, 1.410447, -2.322028, 0, 0.2784314, 1, 1,
0.2592705, 0.6844304, 0.5260605, 0, 0.2745098, 1, 1,
0.2608584, 0.6558659, 1.976479, 0, 0.2666667, 1, 1,
0.2633972, -0.475018, 3.049087, 0, 0.2627451, 1, 1,
0.2723605, 0.61677, 0.348385, 0, 0.254902, 1, 1,
0.2725086, 0.646837, 0.2634919, 0, 0.2509804, 1, 1,
0.2737161, 1.008823, -2.479526, 0, 0.2431373, 1, 1,
0.2776442, 0.4054632, 0.2203142, 0, 0.2392157, 1, 1,
0.2822531, -0.08196323, 1.276663, 0, 0.2313726, 1, 1,
0.2877261, -0.1997508, 3.439409, 0, 0.227451, 1, 1,
0.2895359, -1.425995, 2.878686, 0, 0.2196078, 1, 1,
0.2935607, -0.1735687, 3.543009, 0, 0.2156863, 1, 1,
0.2955673, -0.6732696, 1.972352, 0, 0.2078431, 1, 1,
0.302619, -0.4295551, 1.52055, 0, 0.2039216, 1, 1,
0.3034885, -1.540176, 2.862594, 0, 0.1960784, 1, 1,
0.3035439, -1.073101, 1.085525, 0, 0.1882353, 1, 1,
0.3054017, 0.03398343, 3.641988, 0, 0.1843137, 1, 1,
0.3095835, -1.512384, 3.262602, 0, 0.1764706, 1, 1,
0.313409, -0.3354779, 2.132295, 0, 0.172549, 1, 1,
0.3155731, -0.6399437, 2.793098, 0, 0.1647059, 1, 1,
0.3204668, -2.181816, 2.594512, 0, 0.1607843, 1, 1,
0.3267317, 0.5001467, -0.5219904, 0, 0.1529412, 1, 1,
0.3273254, 1.126767, 1.460692, 0, 0.1490196, 1, 1,
0.3274343, -0.9962893, 1.626126, 0, 0.1411765, 1, 1,
0.3313418, -0.0004139777, 0.6515737, 0, 0.1372549, 1, 1,
0.3331399, -0.9042424, 2.934642, 0, 0.1294118, 1, 1,
0.3331738, 0.2164422, 1.108531, 0, 0.1254902, 1, 1,
0.3337472, -1.735008, 3.914532, 0, 0.1176471, 1, 1,
0.3342639, 0.3662519, 1.716506, 0, 0.1137255, 1, 1,
0.3361171, 0.5619659, -0.2304723, 0, 0.1058824, 1, 1,
0.337031, 1.86932, -0.5848541, 0, 0.09803922, 1, 1,
0.3376134, 0.7258953, 0.7471015, 0, 0.09411765, 1, 1,
0.3469687, 0.1043672, 1.431189, 0, 0.08627451, 1, 1,
0.3492515, 0.2311879, 0.8384085, 0, 0.08235294, 1, 1,
0.3512948, -0.4448598, 4.702703, 0, 0.07450981, 1, 1,
0.3575139, 1.467302, 1.200555, 0, 0.07058824, 1, 1,
0.3595779, -1.084496, 2.130651, 0, 0.0627451, 1, 1,
0.3600649, -0.6160113, 2.598244, 0, 0.05882353, 1, 1,
0.3600962, 0.06547736, 0.1198359, 0, 0.05098039, 1, 1,
0.3655763, 2.954739, -0.4281785, 0, 0.04705882, 1, 1,
0.3661613, 1.032355, 1.197185, 0, 0.03921569, 1, 1,
0.3663467, -0.7334695, 2.987514, 0, 0.03529412, 1, 1,
0.3666603, 1.255964, -0.8732411, 0, 0.02745098, 1, 1,
0.3721891, 0.3767925, 1.307251, 0, 0.02352941, 1, 1,
0.3738095, 0.4202535, 2.04467, 0, 0.01568628, 1, 1,
0.3744056, 0.3682294, 1.00478, 0, 0.01176471, 1, 1,
0.3745896, -0.8162964, 3.075412, 0, 0.003921569, 1, 1,
0.3749857, -1.323273, 3.319044, 0.003921569, 0, 1, 1,
0.3760253, -0.9011016, 3.593003, 0.007843138, 0, 1, 1,
0.3780188, -1.545381, 1.964478, 0.01568628, 0, 1, 1,
0.380771, 0.4241557, 0.9369779, 0.01960784, 0, 1, 1,
0.3838645, -1.24844, 4.458736, 0.02745098, 0, 1, 1,
0.3843624, 0.4807128, 1.330191, 0.03137255, 0, 1, 1,
0.3936707, 0.5875089, 1.520576, 0.03921569, 0, 1, 1,
0.3966237, 1.021933, 1.507576, 0.04313726, 0, 1, 1,
0.3971467, 0.05492726, 1.272839, 0.05098039, 0, 1, 1,
0.4008706, 0.4251821, 2.029387, 0.05490196, 0, 1, 1,
0.4014814, 0.169408, -0.1897009, 0.0627451, 0, 1, 1,
0.4016082, -0.8753929, 3.497272, 0.06666667, 0, 1, 1,
0.4047631, -0.2013553, 1.293514, 0.07450981, 0, 1, 1,
0.4063392, 0.6018701, -0.3599835, 0.07843138, 0, 1, 1,
0.4066712, 0.5953031, -0.2076745, 0.08627451, 0, 1, 1,
0.4076444, 0.2218196, 0.7511335, 0.09019608, 0, 1, 1,
0.4082284, 1.257971, 0.5505949, 0.09803922, 0, 1, 1,
0.4084599, 0.5216683, -0.1829143, 0.1058824, 0, 1, 1,
0.4092628, 0.3269936, 0.5803839, 0.1098039, 0, 1, 1,
0.4114375, 1.656023, -0.6759807, 0.1176471, 0, 1, 1,
0.4138083, 0.3451447, 1.678015, 0.1215686, 0, 1, 1,
0.4161952, 0.5265307, 1.456257, 0.1294118, 0, 1, 1,
0.4182456, 1.33093, 0.7182426, 0.1333333, 0, 1, 1,
0.4187443, 0.5434182, 1.133049, 0.1411765, 0, 1, 1,
0.4223136, 0.9176749, 0.1531309, 0.145098, 0, 1, 1,
0.4240049, -1.947289, 3.685798, 0.1529412, 0, 1, 1,
0.4256305, 0.7260361, 1.356337, 0.1568628, 0, 1, 1,
0.4281194, 1.402568, 1.579943, 0.1647059, 0, 1, 1,
0.4288264, -0.580992, 2.259554, 0.1686275, 0, 1, 1,
0.4303388, -0.02995775, 0.5104221, 0.1764706, 0, 1, 1,
0.4357974, 0.6476309, 0.3298003, 0.1803922, 0, 1, 1,
0.4380538, -0.4722791, 2.787334, 0.1882353, 0, 1, 1,
0.4395396, 0.9844453, 0.852676, 0.1921569, 0, 1, 1,
0.4400808, 0.3199784, 1.62105, 0.2, 0, 1, 1,
0.4438509, -0.09494528, 2.492521, 0.2078431, 0, 1, 1,
0.4466461, -1.388481, 2.561973, 0.2117647, 0, 1, 1,
0.4501899, 1.242885, 0.1296293, 0.2196078, 0, 1, 1,
0.4512849, 0.6343041, 1.346942, 0.2235294, 0, 1, 1,
0.4570183, 1.751801, 0.6242245, 0.2313726, 0, 1, 1,
0.4570583, 1.677269, 1.443782, 0.2352941, 0, 1, 1,
0.4615805, 0.1831987, 2.675551, 0.2431373, 0, 1, 1,
0.4646921, -0.8480341, 1.716344, 0.2470588, 0, 1, 1,
0.4723817, -0.8534809, 3.199992, 0.254902, 0, 1, 1,
0.4767033, -0.3173892, 2.700576, 0.2588235, 0, 1, 1,
0.4768979, 1.0242, 0.08482754, 0.2666667, 0, 1, 1,
0.4771497, 0.449276, -0.7458239, 0.2705882, 0, 1, 1,
0.4944454, -1.9004, 2.099397, 0.2784314, 0, 1, 1,
0.4944473, 1.051989, 1.267672, 0.282353, 0, 1, 1,
0.4947737, -0.3149201, 0.9786314, 0.2901961, 0, 1, 1,
0.4950937, -0.2198334, 3.781254, 0.2941177, 0, 1, 1,
0.4956954, -0.8108513, 4.102256, 0.3019608, 0, 1, 1,
0.4991298, -0.2959531, 2.002181, 0.3098039, 0, 1, 1,
0.5011253, 0.1916277, 1.138858, 0.3137255, 0, 1, 1,
0.5026368, 0.09468231, 2.016703, 0.3215686, 0, 1, 1,
0.5027419, -1.039755, 2.228818, 0.3254902, 0, 1, 1,
0.5077153, 0.8854436, 1.311738, 0.3333333, 0, 1, 1,
0.5121884, 0.9822477, 0.3518522, 0.3372549, 0, 1, 1,
0.5122921, 0.9609856, -0.455615, 0.345098, 0, 1, 1,
0.5175208, -2.301534, 2.168555, 0.3490196, 0, 1, 1,
0.5235714, -0.3005415, 2.134734, 0.3568628, 0, 1, 1,
0.5251046, -0.02035891, 0.8779039, 0.3607843, 0, 1, 1,
0.531482, 1.53577, -0.05588986, 0.3686275, 0, 1, 1,
0.5315923, 0.1070995, 1.319375, 0.372549, 0, 1, 1,
0.5338986, -0.8336707, 3.336363, 0.3803922, 0, 1, 1,
0.5353512, 0.4934955, 3.342381, 0.3843137, 0, 1, 1,
0.5390157, -0.3130677, 1.926897, 0.3921569, 0, 1, 1,
0.5402902, 0.7152293, 1.080475, 0.3960784, 0, 1, 1,
0.5415277, 0.8379247, 0.3733129, 0.4039216, 0, 1, 1,
0.5478812, -0.09941836, 3.913406, 0.4117647, 0, 1, 1,
0.5488356, 1.21971, 0.7780536, 0.4156863, 0, 1, 1,
0.5512579, -1.600528, 2.003314, 0.4235294, 0, 1, 1,
0.5522882, -1.094141, 2.224737, 0.427451, 0, 1, 1,
0.5544654, -0.305608, 1.916445, 0.4352941, 0, 1, 1,
0.557512, -0.8314328, 3.115864, 0.4392157, 0, 1, 1,
0.561869, -0.2714828, 1.866949, 0.4470588, 0, 1, 1,
0.564883, -1.891058, 3.89728, 0.4509804, 0, 1, 1,
0.5656618, 0.4428972, -0.1589445, 0.4588235, 0, 1, 1,
0.5677769, -0.5454483, 3.704438, 0.4627451, 0, 1, 1,
0.5697963, -0.007233424, 1.593621, 0.4705882, 0, 1, 1,
0.5711374, -0.7464772, 2.31116, 0.4745098, 0, 1, 1,
0.5764977, -0.1334328, 1.586029, 0.4823529, 0, 1, 1,
0.5800276, 1.475625, 0.3900249, 0.4862745, 0, 1, 1,
0.5807298, -0.8836041, 3.420958, 0.4941176, 0, 1, 1,
0.5814429, -0.4132248, 1.90642, 0.5019608, 0, 1, 1,
0.5831969, -0.4745287, 1.238907, 0.5058824, 0, 1, 1,
0.5859684, -0.03209908, -0.04705266, 0.5137255, 0, 1, 1,
0.5865632, 0.8649943, 1.585162, 0.5176471, 0, 1, 1,
0.58703, 1.83065, -1.490902, 0.5254902, 0, 1, 1,
0.5884946, 0.2679929, 0.9251625, 0.5294118, 0, 1, 1,
0.5954719, -0.1085908, 2.161611, 0.5372549, 0, 1, 1,
0.6016474, -1.8684, 4.386447, 0.5411765, 0, 1, 1,
0.6041619, -0.8094595, 2.263001, 0.5490196, 0, 1, 1,
0.6061072, -0.8700963, 1.175997, 0.5529412, 0, 1, 1,
0.6143819, 1.693138, 1.192877, 0.5607843, 0, 1, 1,
0.6177881, -1.58112, 4.088555, 0.5647059, 0, 1, 1,
0.6190328, 0.5387339, 0.6746727, 0.572549, 0, 1, 1,
0.6211492, -0.7693614, 1.722169, 0.5764706, 0, 1, 1,
0.6240569, 0.408595, 0.03970525, 0.5843138, 0, 1, 1,
0.6254618, 1.164086, 0.4384485, 0.5882353, 0, 1, 1,
0.6292424, 0.1024684, 0.8591397, 0.5960785, 0, 1, 1,
0.633512, -0.9729605, 2.214174, 0.6039216, 0, 1, 1,
0.6387818, -0.8289416, 3.702552, 0.6078432, 0, 1, 1,
0.6417977, 0.002625281, 2.322905, 0.6156863, 0, 1, 1,
0.6456449, 1.565372, -0.06144456, 0.6196079, 0, 1, 1,
0.6481864, 0.8051437, 0.3545749, 0.627451, 0, 1, 1,
0.6490653, -0.4756068, 1.541668, 0.6313726, 0, 1, 1,
0.6591178, 0.4099018, -1.571443, 0.6392157, 0, 1, 1,
0.6597286, -0.5533507, 0.3286328, 0.6431373, 0, 1, 1,
0.6614498, 0.4761246, 1.452025, 0.6509804, 0, 1, 1,
0.6634952, -0.8677996, 2.935224, 0.654902, 0, 1, 1,
0.6683369, -1.062395, 3.184243, 0.6627451, 0, 1, 1,
0.6745108, 1.757632, -0.7102078, 0.6666667, 0, 1, 1,
0.6802431, -0.2065766, 1.916159, 0.6745098, 0, 1, 1,
0.6855341, -0.5778462, 1.647781, 0.6784314, 0, 1, 1,
0.6898347, 0.1926745, 1.443614, 0.6862745, 0, 1, 1,
0.6942326, 2.638499, 0.4096776, 0.6901961, 0, 1, 1,
0.6984202, -0.3390978, 2.771235, 0.6980392, 0, 1, 1,
0.700568, -0.1580567, 3.147639, 0.7058824, 0, 1, 1,
0.7031812, -0.6689969, 3.255431, 0.7098039, 0, 1, 1,
0.7049884, 0.01289608, 0.9668037, 0.7176471, 0, 1, 1,
0.7054812, 0.2958093, 0.8627837, 0.7215686, 0, 1, 1,
0.70907, -0.09068976, 2.168897, 0.7294118, 0, 1, 1,
0.717405, 1.326136, 0.2642403, 0.7333333, 0, 1, 1,
0.7238438, -1.281443, -0.5425528, 0.7411765, 0, 1, 1,
0.7245314, -0.9019528, 2.394703, 0.7450981, 0, 1, 1,
0.725006, 0.8445166, 1.184644, 0.7529412, 0, 1, 1,
0.7292041, 0.3189731, -0.4927743, 0.7568628, 0, 1, 1,
0.7370557, -0.5081426, 1.643518, 0.7647059, 0, 1, 1,
0.7382939, -0.4188468, 3.863583, 0.7686275, 0, 1, 1,
0.7401618, -0.4684641, 2.890402, 0.7764706, 0, 1, 1,
0.7426856, -0.9985281, 3.31821, 0.7803922, 0, 1, 1,
0.7453429, 1.379887, -0.8190842, 0.7882353, 0, 1, 1,
0.7472656, -0.2073223, 3.094011, 0.7921569, 0, 1, 1,
0.7477775, -1.057029, 2.820917, 0.8, 0, 1, 1,
0.7509732, 1.119959, -0.702683, 0.8078431, 0, 1, 1,
0.7572562, 0.3233616, 0.6561333, 0.8117647, 0, 1, 1,
0.7592539, 0.07691912, 0.5290836, 0.8196079, 0, 1, 1,
0.7612337, 1.13997, 1.61306, 0.8235294, 0, 1, 1,
0.7649087, -0.1637296, 1.266877, 0.8313726, 0, 1, 1,
0.7695695, -1.50968, 0.2970923, 0.8352941, 0, 1, 1,
0.7709818, -0.4443337, 2.212534, 0.8431373, 0, 1, 1,
0.7714471, 0.9908651, -0.3826206, 0.8470588, 0, 1, 1,
0.7728431, -1.069849, 2.098649, 0.854902, 0, 1, 1,
0.773101, -1.814861, 3.478759, 0.8588235, 0, 1, 1,
0.7753795, -0.7297671, 1.810714, 0.8666667, 0, 1, 1,
0.7759786, -0.6148626, 3.723469, 0.8705882, 0, 1, 1,
0.7820216, 0.2558222, 1.372612, 0.8784314, 0, 1, 1,
0.7840912, -1.257327, 2.352664, 0.8823529, 0, 1, 1,
0.7888893, -0.332036, 2.833342, 0.8901961, 0, 1, 1,
0.7898084, -0.5380017, 1.314898, 0.8941177, 0, 1, 1,
0.8084353, 1.24185, 1.116988, 0.9019608, 0, 1, 1,
0.8093953, -0.1536662, 0.839903, 0.9098039, 0, 1, 1,
0.8104357, 0.08995444, 1.591264, 0.9137255, 0, 1, 1,
0.8133567, 0.851221, -0.9794114, 0.9215686, 0, 1, 1,
0.8148128, 1.460346, 0.3708333, 0.9254902, 0, 1, 1,
0.8172617, -0.4278866, 2.000758, 0.9333333, 0, 1, 1,
0.8262872, -1.148262, 2.376187, 0.9372549, 0, 1, 1,
0.8301452, -0.2812063, 2.889502, 0.945098, 0, 1, 1,
0.8305177, -1.100801, 3.226672, 0.9490196, 0, 1, 1,
0.8338425, -0.2707513, 2.111828, 0.9568627, 0, 1, 1,
0.849488, 0.4597345, 0.2500892, 0.9607843, 0, 1, 1,
0.855798, 0.4861368, 1.381902, 0.9686275, 0, 1, 1,
0.8575654, -0.6747543, 2.57544, 0.972549, 0, 1, 1,
0.8602194, -0.6085649, 1.617601, 0.9803922, 0, 1, 1,
0.867279, -2.079439, 2.704641, 0.9843137, 0, 1, 1,
0.8686725, 0.5627206, 1.172981, 0.9921569, 0, 1, 1,
0.8707696, 0.4477731, 0.3755845, 0.9960784, 0, 1, 1,
0.8709927, -0.334576, 0.1454406, 1, 0, 0.9960784, 1,
0.8711748, -1.378924, 2.983584, 1, 0, 0.9882353, 1,
0.8735337, 0.09055389, 1.029634, 1, 0, 0.9843137, 1,
0.8783565, -0.5134302, 1.19787, 1, 0, 0.9764706, 1,
0.8850996, 0.1122852, 0.9326428, 1, 0, 0.972549, 1,
0.8911291, -0.3477285, 1.75374, 1, 0, 0.9647059, 1,
0.8956482, 0.07661294, 1.908597, 1, 0, 0.9607843, 1,
0.9002795, -0.8981263, 2.018424, 1, 0, 0.9529412, 1,
0.9014814, -0.3037843, 2.042461, 1, 0, 0.9490196, 1,
0.9110635, -0.1589286, 3.032879, 1, 0, 0.9411765, 1,
0.915464, -0.2376314, 2.006444, 1, 0, 0.9372549, 1,
0.9214261, 0.5342474, 1.428173, 1, 0, 0.9294118, 1,
0.9225261, 0.06944995, -1.640258, 1, 0, 0.9254902, 1,
0.9248565, 0.3627769, 1.343209, 1, 0, 0.9176471, 1,
0.9269826, -0.3270958, 3.064426, 1, 0, 0.9137255, 1,
0.9277131, 0.4147317, 1.179661, 1, 0, 0.9058824, 1,
0.9387612, -0.1775373, 2.143592, 1, 0, 0.9019608, 1,
0.9395611, 0.7223758, 0.5976874, 1, 0, 0.8941177, 1,
0.9408629, 0.6895243, 2.520405, 1, 0, 0.8862745, 1,
0.9460881, -1.596012, 2.181232, 1, 0, 0.8823529, 1,
0.9496284, 1.381602, 0.8481828, 1, 0, 0.8745098, 1,
0.9535511, -0.4449605, 2.679733, 1, 0, 0.8705882, 1,
0.9582137, 1.43839, -1.454706, 1, 0, 0.8627451, 1,
0.9631501, 0.8985873, 0.2737259, 1, 0, 0.8588235, 1,
0.9702249, 1.30025, 1.033094, 1, 0, 0.8509804, 1,
0.9737265, 0.9724844, 1.24797, 1, 0, 0.8470588, 1,
0.977035, 0.412321, 0.4664347, 1, 0, 0.8392157, 1,
0.9784566, 0.6037023, -1.344206, 1, 0, 0.8352941, 1,
0.9806381, -0.6191987, 1.971797, 1, 0, 0.827451, 1,
0.9875457, 0.7415686, 0.7535741, 1, 0, 0.8235294, 1,
0.9896483, -0.9008576, 1.177282, 1, 0, 0.8156863, 1,
0.9959392, 0.09247381, 0.9651591, 1, 0, 0.8117647, 1,
1.001781, -0.6008106, 1.099352, 1, 0, 0.8039216, 1,
1.006192, -1.359839, 2.417418, 1, 0, 0.7960784, 1,
1.010412, -1.881022, 1.932958, 1, 0, 0.7921569, 1,
1.012797, 0.3849043, 0.9528956, 1, 0, 0.7843137, 1,
1.016256, -0.5973179, 2.360098, 1, 0, 0.7803922, 1,
1.019332, -0.2284024, 2.311424, 1, 0, 0.772549, 1,
1.025587, -0.7316433, 2.253738, 1, 0, 0.7686275, 1,
1.044552, -0.01563993, 2.844791, 1, 0, 0.7607843, 1,
1.050164, -0.7285597, 3.860012, 1, 0, 0.7568628, 1,
1.05665, 1.293756, -0.01613008, 1, 0, 0.7490196, 1,
1.062759, 0.4193035, 0.701212, 1, 0, 0.7450981, 1,
1.065953, 0.9709117, -1.236568, 1, 0, 0.7372549, 1,
1.069407, -2.248916, 2.863072, 1, 0, 0.7333333, 1,
1.074988, 0.4198391, 1.580881, 1, 0, 0.7254902, 1,
1.0755, -0.7916186, 1.153393, 1, 0, 0.7215686, 1,
1.084341, -0.7170653, 3.853187, 1, 0, 0.7137255, 1,
1.088082, -0.4117205, 1.020498, 1, 0, 0.7098039, 1,
1.094196, -0.02591117, 2.622222, 1, 0, 0.7019608, 1,
1.096987, 0.2117803, -0.2428649, 1, 0, 0.6941177, 1,
1.102617, -0.7183111, 1.138097, 1, 0, 0.6901961, 1,
1.116757, 0.3756723, -0.0300127, 1, 0, 0.682353, 1,
1.124009, 1.012645, 0.9683552, 1, 0, 0.6784314, 1,
1.144693, -0.2794607, 2.761976, 1, 0, 0.6705883, 1,
1.151462, 0.2698211, 2.439856, 1, 0, 0.6666667, 1,
1.165258, -1.327277, 2.51728, 1, 0, 0.6588235, 1,
1.169249, 0.07935736, 0.5216225, 1, 0, 0.654902, 1,
1.17632, -0.2081609, 1.469728, 1, 0, 0.6470588, 1,
1.178491, -1.908873, 2.470602, 1, 0, 0.6431373, 1,
1.181078, 1.959486, 2.174457, 1, 0, 0.6352941, 1,
1.187462, -0.5651363, 2.181107, 1, 0, 0.6313726, 1,
1.203154, 0.3379037, -0.09167494, 1, 0, 0.6235294, 1,
1.217394, 0.1931224, 0.1906221, 1, 0, 0.6196079, 1,
1.229382, -1.5128, 2.984053, 1, 0, 0.6117647, 1,
1.236894, 1.159136, 0.6240331, 1, 0, 0.6078432, 1,
1.248525, 0.50086, 0.4196678, 1, 0, 0.6, 1,
1.24929, 1.2192, 1.072588, 1, 0, 0.5921569, 1,
1.254312, -0.9366225, 2.346377, 1, 0, 0.5882353, 1,
1.256006, 0.3178461, -1.277635, 1, 0, 0.5803922, 1,
1.256972, -0.7713993, 2.008824, 1, 0, 0.5764706, 1,
1.258192, 0.015193, 1.20493, 1, 0, 0.5686275, 1,
1.258865, -0.3447973, 2.460986, 1, 0, 0.5647059, 1,
1.26118, 1.11203, -0.1611905, 1, 0, 0.5568628, 1,
1.26289, -1.025629, 2.752253, 1, 0, 0.5529412, 1,
1.263839, 0.6101096, 2.517049, 1, 0, 0.5450981, 1,
1.26666, -0.654771, 0.7852889, 1, 0, 0.5411765, 1,
1.28584, -0.9921173, 3.402074, 1, 0, 0.5333334, 1,
1.299335, -0.03326619, 2.347194, 1, 0, 0.5294118, 1,
1.300975, 1.541571, 0.1644803, 1, 0, 0.5215687, 1,
1.304398, 0.4978979, 3.05623, 1, 0, 0.5176471, 1,
1.304883, -0.3011974, 3.34903, 1, 0, 0.509804, 1,
1.317494, 1.837153, -0.04993282, 1, 0, 0.5058824, 1,
1.324321, -0.7758682, 0.2108894, 1, 0, 0.4980392, 1,
1.331844, 0.09749609, 0.8582933, 1, 0, 0.4901961, 1,
1.33488, 0.5981136, 1.527295, 1, 0, 0.4862745, 1,
1.340893, 0.8856332, 1.094347, 1, 0, 0.4784314, 1,
1.342045, 0.2537223, 0.3709844, 1, 0, 0.4745098, 1,
1.357343, 0.5965868, 1.477332, 1, 0, 0.4666667, 1,
1.357808, 0.9021137, 2.169116, 1, 0, 0.4627451, 1,
1.363465, 1.181755, 1.386154, 1, 0, 0.454902, 1,
1.370044, 0.5881534, 1.552309, 1, 0, 0.4509804, 1,
1.379265, -0.06584618, 2.202853, 1, 0, 0.4431373, 1,
1.385315, 0.6212105, 0.7927625, 1, 0, 0.4392157, 1,
1.387324, -0.9543367, 2.010265, 1, 0, 0.4313726, 1,
1.41721, -0.6323848, 1.574076, 1, 0, 0.427451, 1,
1.419191, 0.7371896, 0.7234358, 1, 0, 0.4196078, 1,
1.423319, -0.3586707, -0.3742074, 1, 0, 0.4156863, 1,
1.425676, 0.9505002, -0.3717372, 1, 0, 0.4078431, 1,
1.430978, -1.268189, 3.337201, 1, 0, 0.4039216, 1,
1.43366, 0.4750433, 0.8796354, 1, 0, 0.3960784, 1,
1.440067, -0.931541, 0.2547182, 1, 0, 0.3882353, 1,
1.45293, -0.634388, -0.8466852, 1, 0, 0.3843137, 1,
1.453498, -0.5075562, 3.498849, 1, 0, 0.3764706, 1,
1.457916, 0.4163515, 0.9653044, 1, 0, 0.372549, 1,
1.466638, 0.1740946, -0.5780977, 1, 0, 0.3647059, 1,
1.468153, 0.1592621, 2.007107, 1, 0, 0.3607843, 1,
1.471635, 0.1699692, 0.6984809, 1, 0, 0.3529412, 1,
1.477902, -0.2481215, 2.629763, 1, 0, 0.3490196, 1,
1.507664, 1.147224, 1.669832, 1, 0, 0.3411765, 1,
1.51019, -2.282174, 3.767193, 1, 0, 0.3372549, 1,
1.514401, 0.5122854, 0.4696582, 1, 0, 0.3294118, 1,
1.529311, -0.3852299, 3.456721, 1, 0, 0.3254902, 1,
1.541427, 0.6409439, -0.1609084, 1, 0, 0.3176471, 1,
1.590905, -0.6341227, 0.06313072, 1, 0, 0.3137255, 1,
1.595721, 2.304625, 2.177435, 1, 0, 0.3058824, 1,
1.598008, 1.79855, 0.9796053, 1, 0, 0.2980392, 1,
1.605214, -0.07035564, 3.440739, 1, 0, 0.2941177, 1,
1.619731, -0.809389, 1.513209, 1, 0, 0.2862745, 1,
1.622859, -0.5308433, 3.290626, 1, 0, 0.282353, 1,
1.625075, -0.5155945, 1.584953, 1, 0, 0.2745098, 1,
1.635946, -0.2736441, 0.2685653, 1, 0, 0.2705882, 1,
1.639826, 0.9473782, 2.444128, 1, 0, 0.2627451, 1,
1.710104, -0.3054152, 2.035702, 1, 0, 0.2588235, 1,
1.716912, -0.1776264, 2.0412, 1, 0, 0.2509804, 1,
1.719892, 0.5558386, 1.797799, 1, 0, 0.2470588, 1,
1.733793, -0.6875503, 1.023104, 1, 0, 0.2392157, 1,
1.756366, 1.582125, -0.8912778, 1, 0, 0.2352941, 1,
1.764403, 0.4834938, 1.932157, 1, 0, 0.227451, 1,
1.78932, 1.592237, 2.206529, 1, 0, 0.2235294, 1,
1.810241, -1.487862, 1.156625, 1, 0, 0.2156863, 1,
1.843961, -0.3635056, 0.7579122, 1, 0, 0.2117647, 1,
1.851847, -0.7185479, 3.192451, 1, 0, 0.2039216, 1,
1.858018, 0.8951542, 2.05366, 1, 0, 0.1960784, 1,
1.900661, -0.609715, 1.294393, 1, 0, 0.1921569, 1,
1.904901, 0.5921859, 0.5580242, 1, 0, 0.1843137, 1,
1.908963, 1.308487, 0.6633265, 1, 0, 0.1803922, 1,
1.909781, 0.7465541, 2.947563, 1, 0, 0.172549, 1,
1.910602, -2.223426, 4.862591, 1, 0, 0.1686275, 1,
1.924859, 0.408273, 2.219845, 1, 0, 0.1607843, 1,
1.926216, -0.4271531, 2.472297, 1, 0, 0.1568628, 1,
1.982148, -0.7910793, 1.045335, 1, 0, 0.1490196, 1,
1.998451, -2.396557, 2.986033, 1, 0, 0.145098, 1,
2.035372, 0.03549695, 0.1581629, 1, 0, 0.1372549, 1,
2.036002, -0.2303538, 2.945848, 1, 0, 0.1333333, 1,
2.074715, 1.001925, -0.4991721, 1, 0, 0.1254902, 1,
2.11791, -0.8138615, 1.483738, 1, 0, 0.1215686, 1,
2.152372, -0.3027979, 0.1455413, 1, 0, 0.1137255, 1,
2.157634, -0.3028124, 2.800756, 1, 0, 0.1098039, 1,
2.165448, 0.3891501, 0.7351393, 1, 0, 0.1019608, 1,
2.177153, -0.2641907, 2.686779, 1, 0, 0.09411765, 1,
2.187868, 1.533754, -0.6966537, 1, 0, 0.09019608, 1,
2.238918, 2.513505, 0.3740688, 1, 0, 0.08235294, 1,
2.274296, -1.097983, 2.9743, 1, 0, 0.07843138, 1,
2.275777, 0.1174534, 1.593097, 1, 0, 0.07058824, 1,
2.304347, -1.465046, 4.220482, 1, 0, 0.06666667, 1,
2.484101, 0.00958243, 2.105841, 1, 0, 0.05882353, 1,
2.512813, 0.8801519, 0.9651476, 1, 0, 0.05490196, 1,
2.580392, -0.3908231, 0.6566592, 1, 0, 0.04705882, 1,
2.610343, -0.9894065, 3.030311, 1, 0, 0.04313726, 1,
2.636362, -2.038666, 2.434674, 1, 0, 0.03529412, 1,
2.636695, 1.19884, 2.387716, 1, 0, 0.03137255, 1,
2.82897, -0.002504881, 2.498443, 1, 0, 0.02352941, 1,
2.899357, -1.063559, 1.503399, 1, 0, 0.01960784, 1,
2.91385, 0.3013956, 1.890442, 1, 0, 0.01176471, 1,
3.486499, 1.097953, 2.185654, 1, 0, 0.007843138, 1
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
0.2458398, -3.303602, -7.402288, 0, -0.5, 0.5, 0.5,
0.2458398, -3.303602, -7.402288, 1, -0.5, 0.5, 0.5,
0.2458398, -3.303602, -7.402288, 1, 1.5, 0.5, 0.5,
0.2458398, -3.303602, -7.402288, 0, 1.5, 0.5, 0.5
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
-4.093403, 0.279091, -7.402288, 0, -0.5, 0.5, 0.5,
-4.093403, 0.279091, -7.402288, 1, -0.5, 0.5, 0.5,
-4.093403, 0.279091, -7.402288, 1, 1.5, 0.5, 0.5,
-4.093403, 0.279091, -7.402288, 0, 1.5, 0.5, 0.5
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
-4.093403, -3.303602, 0.3398645, 0, -0.5, 0.5, 0.5,
-4.093403, -3.303602, 0.3398645, 1, -0.5, 0.5, 0.5,
-4.093403, -3.303602, 0.3398645, 1, 1.5, 0.5, 0.5,
-4.093403, -3.303602, 0.3398645, 0, 1.5, 0.5, 0.5
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
-2, -2.476827, -5.615638,
3, -2.476827, -5.615638,
-2, -2.476827, -5.615638,
-2, -2.614623, -5.913413,
-1, -2.476827, -5.615638,
-1, -2.614623, -5.913413,
0, -2.476827, -5.615638,
0, -2.614623, -5.913413,
1, -2.476827, -5.615638,
1, -2.614623, -5.913413,
2, -2.476827, -5.615638,
2, -2.614623, -5.913413,
3, -2.476827, -5.615638,
3, -2.614623, -5.913413
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
-2, -2.890214, -6.508963, 0, -0.5, 0.5, 0.5,
-2, -2.890214, -6.508963, 1, -0.5, 0.5, 0.5,
-2, -2.890214, -6.508963, 1, 1.5, 0.5, 0.5,
-2, -2.890214, -6.508963, 0, 1.5, 0.5, 0.5,
-1, -2.890214, -6.508963, 0, -0.5, 0.5, 0.5,
-1, -2.890214, -6.508963, 1, -0.5, 0.5, 0.5,
-1, -2.890214, -6.508963, 1, 1.5, 0.5, 0.5,
-1, -2.890214, -6.508963, 0, 1.5, 0.5, 0.5,
0, -2.890214, -6.508963, 0, -0.5, 0.5, 0.5,
0, -2.890214, -6.508963, 1, -0.5, 0.5, 0.5,
0, -2.890214, -6.508963, 1, 1.5, 0.5, 0.5,
0, -2.890214, -6.508963, 0, 1.5, 0.5, 0.5,
1, -2.890214, -6.508963, 0, -0.5, 0.5, 0.5,
1, -2.890214, -6.508963, 1, -0.5, 0.5, 0.5,
1, -2.890214, -6.508963, 1, 1.5, 0.5, 0.5,
1, -2.890214, -6.508963, 0, 1.5, 0.5, 0.5,
2, -2.890214, -6.508963, 0, -0.5, 0.5, 0.5,
2, -2.890214, -6.508963, 1, -0.5, 0.5, 0.5,
2, -2.890214, -6.508963, 1, 1.5, 0.5, 0.5,
2, -2.890214, -6.508963, 0, 1.5, 0.5, 0.5,
3, -2.890214, -6.508963, 0, -0.5, 0.5, 0.5,
3, -2.890214, -6.508963, 1, -0.5, 0.5, 0.5,
3, -2.890214, -6.508963, 1, 1.5, 0.5, 0.5,
3, -2.890214, -6.508963, 0, 1.5, 0.5, 0.5
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
-3.092039, -2, -5.615638,
-3.092039, 2, -5.615638,
-3.092039, -2, -5.615638,
-3.258933, -2, -5.913413,
-3.092039, -1, -5.615638,
-3.258933, -1, -5.913413,
-3.092039, 0, -5.615638,
-3.258933, 0, -5.913413,
-3.092039, 1, -5.615638,
-3.258933, 1, -5.913413,
-3.092039, 2, -5.615638,
-3.258933, 2, -5.913413
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
-3.592721, -2, -6.508963, 0, -0.5, 0.5, 0.5,
-3.592721, -2, -6.508963, 1, -0.5, 0.5, 0.5,
-3.592721, -2, -6.508963, 1, 1.5, 0.5, 0.5,
-3.592721, -2, -6.508963, 0, 1.5, 0.5, 0.5,
-3.592721, -1, -6.508963, 0, -0.5, 0.5, 0.5,
-3.592721, -1, -6.508963, 1, -0.5, 0.5, 0.5,
-3.592721, -1, -6.508963, 1, 1.5, 0.5, 0.5,
-3.592721, -1, -6.508963, 0, 1.5, 0.5, 0.5,
-3.592721, 0, -6.508963, 0, -0.5, 0.5, 0.5,
-3.592721, 0, -6.508963, 1, -0.5, 0.5, 0.5,
-3.592721, 0, -6.508963, 1, 1.5, 0.5, 0.5,
-3.592721, 0, -6.508963, 0, 1.5, 0.5, 0.5,
-3.592721, 1, -6.508963, 0, -0.5, 0.5, 0.5,
-3.592721, 1, -6.508963, 1, -0.5, 0.5, 0.5,
-3.592721, 1, -6.508963, 1, 1.5, 0.5, 0.5,
-3.592721, 1, -6.508963, 0, 1.5, 0.5, 0.5,
-3.592721, 2, -6.508963, 0, -0.5, 0.5, 0.5,
-3.592721, 2, -6.508963, 1, -0.5, 0.5, 0.5,
-3.592721, 2, -6.508963, 1, 1.5, 0.5, 0.5,
-3.592721, 2, -6.508963, 0, 1.5, 0.5, 0.5
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
-3.092039, -2.476827, -4,
-3.092039, -2.476827, 6,
-3.092039, -2.476827, -4,
-3.258933, -2.614623, -4,
-3.092039, -2.476827, -2,
-3.258933, -2.614623, -2,
-3.092039, -2.476827, 0,
-3.258933, -2.614623, 0,
-3.092039, -2.476827, 2,
-3.258933, -2.614623, 2,
-3.092039, -2.476827, 4,
-3.258933, -2.614623, 4,
-3.092039, -2.476827, 6,
-3.258933, -2.614623, 6
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
-3.592721, -2.890214, -4, 0, -0.5, 0.5, 0.5,
-3.592721, -2.890214, -4, 1, -0.5, 0.5, 0.5,
-3.592721, -2.890214, -4, 1, 1.5, 0.5, 0.5,
-3.592721, -2.890214, -4, 0, 1.5, 0.5, 0.5,
-3.592721, -2.890214, -2, 0, -0.5, 0.5, 0.5,
-3.592721, -2.890214, -2, 1, -0.5, 0.5, 0.5,
-3.592721, -2.890214, -2, 1, 1.5, 0.5, 0.5,
-3.592721, -2.890214, -2, 0, 1.5, 0.5, 0.5,
-3.592721, -2.890214, 0, 0, -0.5, 0.5, 0.5,
-3.592721, -2.890214, 0, 1, -0.5, 0.5, 0.5,
-3.592721, -2.890214, 0, 1, 1.5, 0.5, 0.5,
-3.592721, -2.890214, 0, 0, 1.5, 0.5, 0.5,
-3.592721, -2.890214, 2, 0, -0.5, 0.5, 0.5,
-3.592721, -2.890214, 2, 1, -0.5, 0.5, 0.5,
-3.592721, -2.890214, 2, 1, 1.5, 0.5, 0.5,
-3.592721, -2.890214, 2, 0, 1.5, 0.5, 0.5,
-3.592721, -2.890214, 4, 0, -0.5, 0.5, 0.5,
-3.592721, -2.890214, 4, 1, -0.5, 0.5, 0.5,
-3.592721, -2.890214, 4, 1, 1.5, 0.5, 0.5,
-3.592721, -2.890214, 4, 0, 1.5, 0.5, 0.5,
-3.592721, -2.890214, 6, 0, -0.5, 0.5, 0.5,
-3.592721, -2.890214, 6, 1, -0.5, 0.5, 0.5,
-3.592721, -2.890214, 6, 1, 1.5, 0.5, 0.5,
-3.592721, -2.890214, 6, 0, 1.5, 0.5, 0.5
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
-3.092039, -2.476827, -5.615638,
-3.092039, 3.035009, -5.615638,
-3.092039, -2.476827, 6.295367,
-3.092039, 3.035009, 6.295367,
-3.092039, -2.476827, -5.615638,
-3.092039, -2.476827, 6.295367,
-3.092039, 3.035009, -5.615638,
-3.092039, 3.035009, 6.295367,
-3.092039, -2.476827, -5.615638,
3.583719, -2.476827, -5.615638,
-3.092039, -2.476827, 6.295367,
3.583719, -2.476827, 6.295367,
-3.092039, 3.035009, -5.615638,
3.583719, 3.035009, -5.615638,
-3.092039, 3.035009, 6.295367,
3.583719, 3.035009, 6.295367,
3.583719, -2.476827, -5.615638,
3.583719, 3.035009, -5.615638,
3.583719, -2.476827, 6.295367,
3.583719, 3.035009, 6.295367,
3.583719, -2.476827, -5.615638,
3.583719, -2.476827, 6.295367,
3.583719, 3.035009, -5.615638,
3.583719, 3.035009, 6.295367
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
var radius = 7.862727;
var distance = 34.98216;
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
mvMatrix.translate( -0.2458398, -0.279091, -0.3398645 );
mvMatrix.scale( 1.273464, 1.542378, 0.7137379 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.98216);
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
pyrimidin-4-yl_phosp<-read.table("pyrimidin-4-yl_phosp.xyz")
```

```
## Error in read.table("pyrimidin-4-yl_phosp.xyz"): no lines available in input
```

```r
x<-pyrimidin-4-yl_phosp$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyrimidin' not found
```

```r
y<-pyrimidin-4-yl_phosp$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyrimidin' not found
```

```r
z<-pyrimidin-4-yl_phosp$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyrimidin' not found
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
-2.994819, 0.5646991, -0.7666327, 0, 0, 1, 1, 1,
-2.923506, 0.404288, -4.100633, 1, 0, 0, 1, 1,
-2.703824, 1.772393, -1.056671, 1, 0, 0, 1, 1,
-2.698902, 1.126872, -0.2405699, 1, 0, 0, 1, 1,
-2.676176, -0.2543045, -1.540321, 1, 0, 0, 1, 1,
-2.66585, 0.05624447, -1.721541, 1, 0, 0, 1, 1,
-2.662812, 0.2373991, -1.402139, 0, 0, 0, 1, 1,
-2.626296, 2.787619, 0.05047972, 0, 0, 0, 1, 1,
-2.618302, -0.8178318, -2.300972, 0, 0, 0, 1, 1,
-2.563977, -0.6418862, -4.341655, 0, 0, 0, 1, 1,
-2.443841, -1.2026, -0.3255675, 0, 0, 0, 1, 1,
-2.404168, 0.1816545, -3.058917, 0, 0, 0, 1, 1,
-2.299739, 0.05816045, -0.6537669, 0, 0, 0, 1, 1,
-2.232351, -1.938983, -1.346641, 1, 1, 1, 1, 1,
-2.136638, 0.5950996, -1.177353, 1, 1, 1, 1, 1,
-2.133621, -0.811434, -2.300297, 1, 1, 1, 1, 1,
-2.095323, -0.443659, -1.428257, 1, 1, 1, 1, 1,
-2.080415, 1.033259, -1.180854, 1, 1, 1, 1, 1,
-2.013201, -1.676911, -2.016832, 1, 1, 1, 1, 1,
-1.962838, -0.8206202, -3.93594, 1, 1, 1, 1, 1,
-1.961126, 1.823943, -0.08713782, 1, 1, 1, 1, 1,
-1.931415, 1.409462, -1.12284, 1, 1, 1, 1, 1,
-1.890589, -1.235697, -1.80355, 1, 1, 1, 1, 1,
-1.876534, -1.360227, -3.793882, 1, 1, 1, 1, 1,
-1.860101, -0.876106, -4.476733, 1, 1, 1, 1, 1,
-1.844272, 1.141023, -0.8729034, 1, 1, 1, 1, 1,
-1.824589, -0.169752, -2.594396, 1, 1, 1, 1, 1,
-1.812357, -0.6266614, -1.733839, 1, 1, 1, 1, 1,
-1.797704, 1.042744, -0.108531, 0, 0, 1, 1, 1,
-1.76213, -0.7756125, -2.079279, 1, 0, 0, 1, 1,
-1.750573, -0.4662221, -1.358695, 1, 0, 0, 1, 1,
-1.749458, 0.376923, -0.8005654, 1, 0, 0, 1, 1,
-1.745144, 2.020395, 1.617221, 1, 0, 0, 1, 1,
-1.743558, -2.056, -2.71158, 1, 0, 0, 1, 1,
-1.743143, -0.1321539, -3.039832, 0, 0, 0, 1, 1,
-1.742622, 0.4591115, -2.159225, 0, 0, 0, 1, 1,
-1.730804, 0.1804333, -1.076726, 0, 0, 0, 1, 1,
-1.723387, -1.783177, -2.459893, 0, 0, 0, 1, 1,
-1.717722, -1.93559, -2.359724, 0, 0, 0, 1, 1,
-1.717558, -0.2629168, -2.101935, 0, 0, 0, 1, 1,
-1.716299, 0.2128044, -3.172978, 0, 0, 0, 1, 1,
-1.714823, -2.224621, -2.913966, 1, 1, 1, 1, 1,
-1.708234, -0.6286452, -1.045821, 1, 1, 1, 1, 1,
-1.706033, 0.7389455, -1.134899, 1, 1, 1, 1, 1,
-1.705439, 0.04947731, -2.625442, 1, 1, 1, 1, 1,
-1.702922, -0.1624538, -2.12348, 1, 1, 1, 1, 1,
-1.687133, 0.3201842, -0.9333794, 1, 1, 1, 1, 1,
-1.66631, -0.2673392, -0.392487, 1, 1, 1, 1, 1,
-1.663451, -0.02936595, -1.539353, 1, 1, 1, 1, 1,
-1.643408, 2.640499, -0.6296021, 1, 1, 1, 1, 1,
-1.637031, -1.880018, -2.786541, 1, 1, 1, 1, 1,
-1.632857, 0.4454331, -1.89463, 1, 1, 1, 1, 1,
-1.62363, -0.475161, -0.909778, 1, 1, 1, 1, 1,
-1.604721, -0.1181208, -2.037786, 1, 1, 1, 1, 1,
-1.593558, -0.6040106, -1.261632, 1, 1, 1, 1, 1,
-1.586588, 0.6180708, -0.4481992, 1, 1, 1, 1, 1,
-1.570554, -0.5660982, -1.000222, 0, 0, 1, 1, 1,
-1.56631, -0.8543488, -1.117617, 1, 0, 0, 1, 1,
-1.562484, -0.3501495, -1.366526, 1, 0, 0, 1, 1,
-1.560172, -0.7797176, -2.569947, 1, 0, 0, 1, 1,
-1.556192, 2.234461, -1.212434, 1, 0, 0, 1, 1,
-1.554855, -0.1017857, -2.862907, 1, 0, 0, 1, 1,
-1.546073, -1.105589, -0.9168602, 0, 0, 0, 1, 1,
-1.542884, 0.1359006, -0.7570019, 0, 0, 0, 1, 1,
-1.533956, 0.01434485, -1.482991, 0, 0, 0, 1, 1,
-1.505778, -0.3990945, -2.094292, 0, 0, 0, 1, 1,
-1.492108, 1.773409, -0.8906403, 0, 0, 0, 1, 1,
-1.458763, 2.03767, -0.3536482, 0, 0, 0, 1, 1,
-1.447936, 1.413703, -0.4884226, 0, 0, 0, 1, 1,
-1.434509, -0.5395894, -1.694975, 1, 1, 1, 1, 1,
-1.427603, -0.5101582, -2.308237, 1, 1, 1, 1, 1,
-1.426878, 0.7769963, 0.6296389, 1, 1, 1, 1, 1,
-1.419987, 1.146192, 0.7523766, 1, 1, 1, 1, 1,
-1.419561, -2.201274, -2.337135, 1, 1, 1, 1, 1,
-1.418576, 0.6448294, -0.7021455, 1, 1, 1, 1, 1,
-1.390883, -1.041347, -1.035361, 1, 1, 1, 1, 1,
-1.385635, -0.2534395, -2.331611, 1, 1, 1, 1, 1,
-1.38513, 0.05705622, -1.947645, 1, 1, 1, 1, 1,
-1.384122, 0.5387814, -1.501858, 1, 1, 1, 1, 1,
-1.38195, -0.6117185, -2.057551, 1, 1, 1, 1, 1,
-1.376596, 0.2749414, -1.456733, 1, 1, 1, 1, 1,
-1.375593, -0.2743082, -0.6422969, 1, 1, 1, 1, 1,
-1.357701, 0.1149145, -1.30285, 1, 1, 1, 1, 1,
-1.356824, -0.1175512, -1.231334, 1, 1, 1, 1, 1,
-1.344424, 0.6251814, -1.488513, 0, 0, 1, 1, 1,
-1.34326, -0.9302249, -2.214464, 1, 0, 0, 1, 1,
-1.340492, 0.7486855, -2.114846, 1, 0, 0, 1, 1,
-1.335494, -0.3711492, -2.116654, 1, 0, 0, 1, 1,
-1.329552, 0.0335414, -2.391237, 1, 0, 0, 1, 1,
-1.326835, 0.3667987, -3.232296, 1, 0, 0, 1, 1,
-1.318699, -0.08376873, -2.214182, 0, 0, 0, 1, 1,
-1.317062, 1.560152, -0.08417616, 0, 0, 0, 1, 1,
-1.314845, -0.1385033, -1.970188, 0, 0, 0, 1, 1,
-1.297777, 1.017796, -0.1786676, 0, 0, 0, 1, 1,
-1.29674, 1.5907, -1.365221, 0, 0, 0, 1, 1,
-1.294329, 0.6734873, -2.089464, 0, 0, 0, 1, 1,
-1.291659, 0.4353648, -2.445562, 0, 0, 0, 1, 1,
-1.278227, 0.02329497, 0.007983264, 1, 1, 1, 1, 1,
-1.269928, 0.9905835, 0.6885814, 1, 1, 1, 1, 1,
-1.268881, 0.1533822, 0.7069792, 1, 1, 1, 1, 1,
-1.265983, -0.8869154, -2.225642, 1, 1, 1, 1, 1,
-1.259557, 1.154642, -1.910676, 1, 1, 1, 1, 1,
-1.251255, -0.9978015, -2.911732, 1, 1, 1, 1, 1,
-1.234869, -0.8786451, -5.017705, 1, 1, 1, 1, 1,
-1.233414, -1.372424, -1.835171, 1, 1, 1, 1, 1,
-1.231224, -0.70194, -2.066223, 1, 1, 1, 1, 1,
-1.225355, -0.597177, -0.9825045, 1, 1, 1, 1, 1,
-1.224855, -1.565709, -1.619448, 1, 1, 1, 1, 1,
-1.212589, 0.4617676, -0.3504805, 1, 1, 1, 1, 1,
-1.211332, 0.03183327, -0.2888308, 1, 1, 1, 1, 1,
-1.210021, 0.1423599, -2.390486, 1, 1, 1, 1, 1,
-1.193052, 0.4032912, -2.225424, 1, 1, 1, 1, 1,
-1.185228, 0.1460867, -2.003709, 0, 0, 1, 1, 1,
-1.177814, -0.9799198, -1.595142, 1, 0, 0, 1, 1,
-1.175506, 0.2270606, -0.6176652, 1, 0, 0, 1, 1,
-1.163218, 0.4932123, -2.957213, 1, 0, 0, 1, 1,
-1.161902, -0.5944083, -2.578789, 1, 0, 0, 1, 1,
-1.160293, -0.4511083, -2.463115, 1, 0, 0, 1, 1,
-1.157295, 0.9107828, -0.3710219, 0, 0, 0, 1, 1,
-1.156321, -1.513288, -3.862373, 0, 0, 0, 1, 1,
-1.155467, 0.2424987, -1.54607, 0, 0, 0, 1, 1,
-1.155363, -0.229658, -0.6869323, 0, 0, 0, 1, 1,
-1.152707, 1.315627, -0.4774214, 0, 0, 0, 1, 1,
-1.150441, -0.2403051, -2.573991, 0, 0, 0, 1, 1,
-1.14862, -1.903336, -3.436078, 0, 0, 0, 1, 1,
-1.144034, -0.4387694, -3.510628, 1, 1, 1, 1, 1,
-1.14362, 1.237686, 0.1499183, 1, 1, 1, 1, 1,
-1.14064, -1.234937, 0.2204471, 1, 1, 1, 1, 1,
-1.139233, -1.611144, -3.488578, 1, 1, 1, 1, 1,
-1.136678, 0.9865988, -0.5249558, 1, 1, 1, 1, 1,
-1.132665, -1.527928, -2.426514, 1, 1, 1, 1, 1,
-1.132611, -0.004252962, -1.237129, 1, 1, 1, 1, 1,
-1.131147, -2.105136, -3.81135, 1, 1, 1, 1, 1,
-1.130429, -0.682292, -2.248845, 1, 1, 1, 1, 1,
-1.115469, 0.2389062, -1.782814, 1, 1, 1, 1, 1,
-1.108915, -1.590124, -1.874257, 1, 1, 1, 1, 1,
-1.107864, 1.105439, -0.361767, 1, 1, 1, 1, 1,
-1.103297, -0.3198229, -2.25102, 1, 1, 1, 1, 1,
-1.098519, 1.850343, 1.163338, 1, 1, 1, 1, 1,
-1.092274, 0.5324265, -1.4189, 1, 1, 1, 1, 1,
-1.090781, -0.5541084, -3.13002, 0, 0, 1, 1, 1,
-1.084507, 1.105704, -0.5904201, 1, 0, 0, 1, 1,
-1.084422, -1.753738, -4.169489, 1, 0, 0, 1, 1,
-1.078879, -0.8169195, -2.446969, 1, 0, 0, 1, 1,
-1.078385, 0.8406959, -0.8522285, 1, 0, 0, 1, 1,
-1.075673, 0.8022313, -1.594157, 1, 0, 0, 1, 1,
-1.072661, 0.7677146, -2.203477, 0, 0, 0, 1, 1,
-1.069245, -1.9916, -2.002055, 0, 0, 0, 1, 1,
-1.056533, -0.4777858, -3.476034, 0, 0, 0, 1, 1,
-1.049535, 0.3406024, -0.8793527, 0, 0, 0, 1, 1,
-1.046881, -0.1390458, -1.181695, 0, 0, 0, 1, 1,
-1.039177, 2.567554, 0.2967148, 0, 0, 0, 1, 1,
-1.036463, 0.9967458, -1.350814, 0, 0, 0, 1, 1,
-1.023936, 0.5491168, 0.125478, 1, 1, 1, 1, 1,
-1.014647, 1.899668, 1.563976, 1, 1, 1, 1, 1,
-1.010712, 0.1080166, -2.418214, 1, 1, 1, 1, 1,
-1.003079, 0.3703609, -1.540499, 1, 1, 1, 1, 1,
-1.001936, 0.8896159, -0.3069414, 1, 1, 1, 1, 1,
-0.9999907, 1.096625, -1.681438, 1, 1, 1, 1, 1,
-0.9972397, -1.535879, -2.928737, 1, 1, 1, 1, 1,
-0.991793, 0.4458878, -0.9071489, 1, 1, 1, 1, 1,
-0.9851398, 0.8873356, 1.44527, 1, 1, 1, 1, 1,
-0.9827783, 1.723873, 1.882859, 1, 1, 1, 1, 1,
-0.9808419, 0.5882862, -1.57995, 1, 1, 1, 1, 1,
-0.9780763, 0.3731076, -2.092077, 1, 1, 1, 1, 1,
-0.956121, -1.073876, -1.878673, 1, 1, 1, 1, 1,
-0.9496002, -1.233601, -2.37707, 1, 1, 1, 1, 1,
-0.9443575, -1.85992, -1.747188, 1, 1, 1, 1, 1,
-0.9441947, 0.1056964, -0.07186708, 0, 0, 1, 1, 1,
-0.9369107, 0.2848204, -1.364886, 1, 0, 0, 1, 1,
-0.932416, -1.764094, -2.298962, 1, 0, 0, 1, 1,
-0.9316913, -1.300533, -2.720401, 1, 0, 0, 1, 1,
-0.9252245, 0.7265356, -0.5559336, 1, 0, 0, 1, 1,
-0.9212768, 0.2121438, -1.162449, 1, 0, 0, 1, 1,
-0.9169698, 2.090322, 0.04782338, 0, 0, 0, 1, 1,
-0.9090753, -0.212478, -1.395809, 0, 0, 0, 1, 1,
-0.9085185, 0.1689231, -0.9714119, 0, 0, 0, 1, 1,
-0.9054376, -0.4322096, -3.40528, 0, 0, 0, 1, 1,
-0.9011605, 1.103877, -1.193817, 0, 0, 0, 1, 1,
-0.900459, 0.6521765, -1.326455, 0, 0, 0, 1, 1,
-0.900046, -0.1667967, -1.557123, 0, 0, 0, 1, 1,
-0.8971047, 0.4922766, -0.441727, 1, 1, 1, 1, 1,
-0.8934354, -0.1242517, -0.5886344, 1, 1, 1, 1, 1,
-0.893425, 1.292717, -0.7071815, 1, 1, 1, 1, 1,
-0.8913127, 0.529303, -0.4445508, 1, 1, 1, 1, 1,
-0.8913087, 1.001274, -0.8071285, 1, 1, 1, 1, 1,
-0.8911889, 0.3424688, -0.0323182, 1, 1, 1, 1, 1,
-0.8874947, 1.175044, 0.8544369, 1, 1, 1, 1, 1,
-0.8860995, -0.5843017, -3.933133, 1, 1, 1, 1, 1,
-0.8842548, 1.565219, -0.5985638, 1, 1, 1, 1, 1,
-0.8762276, 0.5632736, 1.363317, 1, 1, 1, 1, 1,
-0.8754062, -0.3820581, -3.270299, 1, 1, 1, 1, 1,
-0.8748714, 0.824075, -0.7772429, 1, 1, 1, 1, 1,
-0.874256, 0.8524962, -2.385116, 1, 1, 1, 1, 1,
-0.8729528, -0.01799818, -2.836487, 1, 1, 1, 1, 1,
-0.8667015, 0.5257724, -0.7400366, 1, 1, 1, 1, 1,
-0.8652313, 1.348007, -0.4406648, 0, 0, 1, 1, 1,
-0.8630949, -1.397662, -2.029132, 1, 0, 0, 1, 1,
-0.8527868, 0.7044238, -2.403014, 1, 0, 0, 1, 1,
-0.8501317, 1.047428, 0.5915237, 1, 0, 0, 1, 1,
-0.849876, -0.397072, -3.316264, 1, 0, 0, 1, 1,
-0.831373, 0.2913483, -2.807015, 1, 0, 0, 1, 1,
-0.8255735, -0.2430028, -0.9707132, 0, 0, 0, 1, 1,
-0.8249316, -0.3720874, -1.638334, 0, 0, 0, 1, 1,
-0.8240024, -0.7550773, -3.74435, 0, 0, 0, 1, 1,
-0.8237053, -0.4134163, -0.4311708, 0, 0, 0, 1, 1,
-0.8232187, 1.010975, -1.958827, 0, 0, 0, 1, 1,
-0.8231541, 0.3394753, -2.358742, 0, 0, 0, 1, 1,
-0.8196907, 0.1406749, -1.8802, 0, 0, 0, 1, 1,
-0.8119359, 0.2442797, -1.142872, 1, 1, 1, 1, 1,
-0.8119314, 0.4596303, 2.381864, 1, 1, 1, 1, 1,
-0.8096527, 1.058944, -3.160073, 1, 1, 1, 1, 1,
-0.8093691, 0.3367146, -0.3761622, 1, 1, 1, 1, 1,
-0.8037813, 1.344759, -1.396078, 1, 1, 1, 1, 1,
-0.8027505, 1.820359, 0.03615988, 1, 1, 1, 1, 1,
-0.7965623, 0.7281008, -0.4487377, 1, 1, 1, 1, 1,
-0.796051, -0.8140608, -2.452887, 1, 1, 1, 1, 1,
-0.7953231, 0.971379, -1.447376, 1, 1, 1, 1, 1,
-0.786808, -0.1811778, -0.4940478, 1, 1, 1, 1, 1,
-0.7855883, -0.2079721, -2.941083, 1, 1, 1, 1, 1,
-0.7822707, -1.406012, -2.060313, 1, 1, 1, 1, 1,
-0.7793192, -0.9032402, -3.950729, 1, 1, 1, 1, 1,
-0.7786542, -0.6920918, -2.581511, 1, 1, 1, 1, 1,
-0.7779054, -1.755899, -3.108288, 1, 1, 1, 1, 1,
-0.7758152, 0.8055026, -0.607175, 0, 0, 1, 1, 1,
-0.7745835, 1.650535, -0.4975968, 1, 0, 0, 1, 1,
-0.7738276, 1.429546, 0.04539348, 1, 0, 0, 1, 1,
-0.7694926, -1.579046, -3.47547, 1, 0, 0, 1, 1,
-0.7646298, -1.011558, -1.249244, 1, 0, 0, 1, 1,
-0.7553745, 0.5747722, -0.8173614, 1, 0, 0, 1, 1,
-0.7526189, -0.2207901, -2.884544, 0, 0, 0, 1, 1,
-0.7454652, -0.06544665, -2.022811, 0, 0, 0, 1, 1,
-0.7419353, 0.05997967, -2.04316, 0, 0, 0, 1, 1,
-0.7394406, -0.1584287, -1.317789, 0, 0, 0, 1, 1,
-0.7372833, 0.4801574, -1.316772, 0, 0, 0, 1, 1,
-0.7370072, 0.5478218, -0.3270423, 0, 0, 0, 1, 1,
-0.7332712, -0.9728413, -3.370255, 0, 0, 0, 1, 1,
-0.73266, -0.1605782, -0.7096307, 1, 1, 1, 1, 1,
-0.7297278, 0.322231, 0.006286087, 1, 1, 1, 1, 1,
-0.7270007, 0.6309732, -0.5189903, 1, 1, 1, 1, 1,
-0.7241775, -1.241738, -2.40447, 1, 1, 1, 1, 1,
-0.718454, 0.2283414, 0.2039859, 1, 1, 1, 1, 1,
-0.7178832, -0.1821366, -1.867676, 1, 1, 1, 1, 1,
-0.704825, -0.1447717, -2.676484, 1, 1, 1, 1, 1,
-0.7039672, 0.67203, 0.5107313, 1, 1, 1, 1, 1,
-0.7028587, -0.4131051, -2.924792, 1, 1, 1, 1, 1,
-0.7020358, -0.1937747, -2.379834, 1, 1, 1, 1, 1,
-0.6993497, 0.5351748, -2.381531, 1, 1, 1, 1, 1,
-0.6969267, 0.2552305, -0.6541474, 1, 1, 1, 1, 1,
-0.6869994, -1.426423, -2.221034, 1, 1, 1, 1, 1,
-0.6866322, 1.943756, 1.512657, 1, 1, 1, 1, 1,
-0.6840388, 1.236642, 0.4020259, 1, 1, 1, 1, 1,
-0.6778713, 0.1292455, -2.650689, 0, 0, 1, 1, 1,
-0.6767673, -2.304651, -3.491605, 1, 0, 0, 1, 1,
-0.6724802, -0.4497405, -1.136961, 1, 0, 0, 1, 1,
-0.6710716, 0.3854746, -2.34588, 1, 0, 0, 1, 1,
-0.6670718, -0.6313204, -2.943741, 1, 0, 0, 1, 1,
-0.6595294, 0.5535713, -2.258379, 1, 0, 0, 1, 1,
-0.6568248, -1.727341, -1.730142, 0, 0, 0, 1, 1,
-0.6511662, 0.7128715, -1.074905, 0, 0, 0, 1, 1,
-0.6491318, -0.1768334, -1.857641, 0, 0, 0, 1, 1,
-0.6450952, 0.0187017, -0.5243097, 0, 0, 0, 1, 1,
-0.6449797, 0.8325848, -0.1447465, 0, 0, 0, 1, 1,
-0.6418357, 0.334357, 0.1330295, 0, 0, 0, 1, 1,
-0.6353087, -0.8458614, -4.722195, 0, 0, 0, 1, 1,
-0.6334891, 0.8023742, -0.9857051, 1, 1, 1, 1, 1,
-0.6286126, -0.09778419, -0.2385132, 1, 1, 1, 1, 1,
-0.6253986, 0.8481547, -0.2854315, 1, 1, 1, 1, 1,
-0.6248773, 0.8331549, -0.5012669, 1, 1, 1, 1, 1,
-0.622997, -0.9454934, -1.850082, 1, 1, 1, 1, 1,
-0.6194195, -0.3046692, -2.375143, 1, 1, 1, 1, 1,
-0.6153502, 0.8692758, 0.4051085, 1, 1, 1, 1, 1,
-0.611298, -0.8038189, -2.598964, 1, 1, 1, 1, 1,
-0.6110755, -2.045171, -2.633494, 1, 1, 1, 1, 1,
-0.6098104, -1.31631, -3.479719, 1, 1, 1, 1, 1,
-0.6049115, 0.8251005, -0.7380328, 1, 1, 1, 1, 1,
-0.6047603, -0.4763344, -1.979792, 1, 1, 1, 1, 1,
-0.5990479, 1.341408, -1.562086, 1, 1, 1, 1, 1,
-0.5928714, 1.194458, -0.4984242, 1, 1, 1, 1, 1,
-0.585795, -0.3234692, -1.067742, 1, 1, 1, 1, 1,
-0.5832019, 0.2242443, -2.139287, 0, 0, 1, 1, 1,
-0.5825813, 0.7991648, -0.6577678, 1, 0, 0, 1, 1,
-0.576475, -0.3069984, -2.650202, 1, 0, 0, 1, 1,
-0.5720203, 0.1664953, -2.077838, 1, 0, 0, 1, 1,
-0.5706972, -0.3083816, -2.603949, 1, 0, 0, 1, 1,
-0.5704654, 0.6634111, -2.028266, 1, 0, 0, 1, 1,
-0.5651913, 1.108986, -0.600859, 0, 0, 0, 1, 1,
-0.5615088, -1.21683, -1.393664, 0, 0, 0, 1, 1,
-0.5587866, -0.7268188, -1.114687, 0, 0, 0, 1, 1,
-0.5571527, 0.875609, 0.5915381, 0, 0, 0, 1, 1,
-0.5552872, 0.7528283, -1.401815, 0, 0, 0, 1, 1,
-0.5550926, 0.3786786, -1.472162, 0, 0, 0, 1, 1,
-0.5508367, 0.3699403, -2.915675, 0, 0, 0, 1, 1,
-0.5481533, -0.8971814, -3.66013, 1, 1, 1, 1, 1,
-0.5451053, -1.098653, -3.530841, 1, 1, 1, 1, 1,
-0.5377109, 1.665238, 0.09920907, 1, 1, 1, 1, 1,
-0.5376623, -1.15267, -2.580013, 1, 1, 1, 1, 1,
-0.5293254, -1.243983, -3.352717, 1, 1, 1, 1, 1,
-0.5269107, -0.3742605, -4.436659, 1, 1, 1, 1, 1,
-0.5268787, 0.5603546, 0.2429165, 1, 1, 1, 1, 1,
-0.5252534, -0.5027111, -1.962381, 1, 1, 1, 1, 1,
-0.5248703, 0.3965081, -0.3751374, 1, 1, 1, 1, 1,
-0.5194331, 0.368271, -2.488663, 1, 1, 1, 1, 1,
-0.5182121, 0.4392866, 0.2284794, 1, 1, 1, 1, 1,
-0.5139754, 1.090392, 0.0684061, 1, 1, 1, 1, 1,
-0.5064598, -0.662559, -0.9031633, 1, 1, 1, 1, 1,
-0.5028394, -1.473792, -5.442176, 1, 1, 1, 1, 1,
-0.5006782, 0.08587854, -0.7731074, 1, 1, 1, 1, 1,
-0.4934831, 0.8006085, -1.584941, 0, 0, 1, 1, 1,
-0.4906368, -1.111215, -4.425922, 1, 0, 0, 1, 1,
-0.4895588, 0.9432485, -1.501669, 1, 0, 0, 1, 1,
-0.4891044, -1.263177, -3.75653, 1, 0, 0, 1, 1,
-0.4876688, -0.4364854, -1.918809, 1, 0, 0, 1, 1,
-0.4869521, -0.1665142, -1.934068, 1, 0, 0, 1, 1,
-0.485292, -0.4609699, -1.869264, 0, 0, 0, 1, 1,
-0.4833572, 0.2632481, -2.755468, 0, 0, 0, 1, 1,
-0.4825144, 0.9478936, -0.009131601, 0, 0, 0, 1, 1,
-0.4738239, -1.711586, -3.791571, 0, 0, 0, 1, 1,
-0.4704375, -0.1918945, -3.278496, 0, 0, 0, 1, 1,
-0.4703191, -0.1858087, -2.061994, 0, 0, 0, 1, 1,
-0.4695108, 0.675666, -1.299429, 0, 0, 0, 1, 1,
-0.4692426, 0.0960827, -0.6163914, 1, 1, 1, 1, 1,
-0.4689052, -1.755229, -3.344414, 1, 1, 1, 1, 1,
-0.4656938, -0.0905711, -0.9949493, 1, 1, 1, 1, 1,
-0.4585319, 0.6344216, -0.0861748, 1, 1, 1, 1, 1,
-0.4580825, -2.267123, -1.08364, 1, 1, 1, 1, 1,
-0.4569678, 0.7787575, -0.9659632, 1, 1, 1, 1, 1,
-0.456432, -0.4809711, -1.446917, 1, 1, 1, 1, 1,
-0.4534462, 0.770371, 0.6967257, 1, 1, 1, 1, 1,
-0.4513167, -0.9772209, -2.420957, 1, 1, 1, 1, 1,
-0.4323173, 1.149605, 0.00951534, 1, 1, 1, 1, 1,
-0.432166, -0.2837176, -3.151754, 1, 1, 1, 1, 1,
-0.4308253, -0.5834957, -2.64775, 1, 1, 1, 1, 1,
-0.4282618, 0.6139403, -0.1831209, 1, 1, 1, 1, 1,
-0.424426, -1.838469, -2.804823, 1, 1, 1, 1, 1,
-0.4164017, -0.4799524, -1.623172, 1, 1, 1, 1, 1,
-0.4157526, -1.024247, -1.782086, 0, 0, 1, 1, 1,
-0.4120854, -0.5051093, -2.287765, 1, 0, 0, 1, 1,
-0.4105696, 1.093393, -1.169441, 1, 0, 0, 1, 1,
-0.409989, -0.4275944, -1.649059, 1, 0, 0, 1, 1,
-0.4082295, -1.074151, -3.450025, 1, 0, 0, 1, 1,
-0.4034681, -0.03641822, -1.475306, 1, 0, 0, 1, 1,
-0.4004166, 1.336895, -0.105093, 0, 0, 0, 1, 1,
-0.3980586, -1.252586, -3.825938, 0, 0, 0, 1, 1,
-0.3938985, -2.073744, -2.67666, 0, 0, 0, 1, 1,
-0.3932474, -0.1793649, -1.116401, 0, 0, 0, 1, 1,
-0.3860607, 0.03328954, -1.393498, 0, 0, 0, 1, 1,
-0.3834882, -1.531451, -3.815704, 0, 0, 0, 1, 1,
-0.3832589, 0.01905844, -0.9213956, 0, 0, 0, 1, 1,
-0.3818272, 1.076944, -0.6890057, 1, 1, 1, 1, 1,
-0.3813691, -0.1986356, -1.242151, 1, 1, 1, 1, 1,
-0.3775247, -1.339383, -2.248192, 1, 1, 1, 1, 1,
-0.3759441, -0.3627531, -4.13575, 1, 1, 1, 1, 1,
-0.373727, 0.2469031, -0.3668494, 1, 1, 1, 1, 1,
-0.3714274, -1.692753, -1.410218, 1, 1, 1, 1, 1,
-0.3687159, -0.8920704, -2.391104, 1, 1, 1, 1, 1,
-0.3683952, -0.4808449, -2.889827, 1, 1, 1, 1, 1,
-0.3673289, -0.2399202, -1.638666, 1, 1, 1, 1, 1,
-0.3638564, -0.4789546, -2.949101, 1, 1, 1, 1, 1,
-0.3630272, 0.6207622, 0.8528463, 1, 1, 1, 1, 1,
-0.3621042, -1.364333, -3.250676, 1, 1, 1, 1, 1,
-0.3616383, -0.04122869, -2.101776, 1, 1, 1, 1, 1,
-0.3607268, 0.828804, -1.982111, 1, 1, 1, 1, 1,
-0.3553176, 0.9388778, -0.5247018, 1, 1, 1, 1, 1,
-0.3491103, -0.1249034, -0.9120052, 0, 0, 1, 1, 1,
-0.348879, 0.7067361, -1.270375, 1, 0, 0, 1, 1,
-0.3468448, 0.4978448, -0.3357537, 1, 0, 0, 1, 1,
-0.3453381, -1.299521, -2.070079, 1, 0, 0, 1, 1,
-0.3439942, -0.9213586, -2.652966, 1, 0, 0, 1, 1,
-0.3439564, 1.722639, 0.1374303, 1, 0, 0, 1, 1,
-0.3416039, -0.959932, -0.982027, 0, 0, 0, 1, 1,
-0.339175, -0.3347851, -1.850448, 0, 0, 0, 1, 1,
-0.3357159, -1.372755, -3.481797, 0, 0, 0, 1, 1,
-0.3347315, -0.6680592, -0.6441751, 0, 0, 0, 1, 1,
-0.3339624, 0.4706204, -1.075462, 0, 0, 0, 1, 1,
-0.3331521, -0.7713635, -2.515651, 0, 0, 0, 1, 1,
-0.3329493, -1.294034, -2.482217, 0, 0, 0, 1, 1,
-0.3320308, 0.4945007, -0.3693891, 1, 1, 1, 1, 1,
-0.3302179, 0.4051521, 0.9775866, 1, 1, 1, 1, 1,
-0.3285218, 1.647416, 0.03928139, 1, 1, 1, 1, 1,
-0.3281919, -0.4686571, -3.411072, 1, 1, 1, 1, 1,
-0.3274648, 0.9699989, 0.8573479, 1, 1, 1, 1, 1,
-0.3271891, -0.9063732, -4.017782, 1, 1, 1, 1, 1,
-0.3250954, -0.582343, -0.8852013, 1, 1, 1, 1, 1,
-0.3245512, 0.2573523, -1.453745, 1, 1, 1, 1, 1,
-0.3230782, 0.9021811, -1.214419, 1, 1, 1, 1, 1,
-0.3223893, 0.2726921, -1.57401, 1, 1, 1, 1, 1,
-0.3213169, 0.3963796, -1.702539, 1, 1, 1, 1, 1,
-0.3195343, -0.0800886, -1.418082, 1, 1, 1, 1, 1,
-0.3183569, 0.1156633, -2.007772, 1, 1, 1, 1, 1,
-0.3180451, 0.6286879, -1.863244, 1, 1, 1, 1, 1,
-0.3170599, -1.468628, -3.638072, 1, 1, 1, 1, 1,
-0.3146176, 1.271643, 2.147611, 0, 0, 1, 1, 1,
-0.3129101, -1.429567, -1.927339, 1, 0, 0, 1, 1,
-0.3120066, 1.429784, -1.099655, 1, 0, 0, 1, 1,
-0.3110214, 0.3073361, -1.425946, 1, 0, 0, 1, 1,
-0.3104813, 1.3108, 0.5222977, 1, 0, 0, 1, 1,
-0.3060127, 0.7695366, -3.062192, 1, 0, 0, 1, 1,
-0.3039775, 1.151789, -1.447861, 0, 0, 0, 1, 1,
-0.3038678, 0.4312181, -0.9912983, 0, 0, 0, 1, 1,
-0.303609, -0.63302, -4.604774, 0, 0, 0, 1, 1,
-0.3021091, -1.22492, -3.793303, 0, 0, 0, 1, 1,
-0.3020883, -0.4760573, -1.674607, 0, 0, 0, 1, 1,
-0.3019228, 0.4989176, 0.4306777, 0, 0, 0, 1, 1,
-0.3017332, 0.05207941, -1.084532, 0, 0, 0, 1, 1,
-0.3014812, 2.722671, 0.2334828, 1, 1, 1, 1, 1,
-0.2940464, 0.4532594, 0.5102661, 1, 1, 1, 1, 1,
-0.2927274, 0.02918134, -0.1551406, 1, 1, 1, 1, 1,
-0.292438, -1.37186, -2.620927, 1, 1, 1, 1, 1,
-0.283601, -0.4212265, -3.854715, 1, 1, 1, 1, 1,
-0.2826821, 0.1640828, -1.263713, 1, 1, 1, 1, 1,
-0.2823652, -1.087257, -2.292355, 1, 1, 1, 1, 1,
-0.2765031, 0.4316607, -1.237606, 1, 1, 1, 1, 1,
-0.2751834, -0.591167, -2.640193, 1, 1, 1, 1, 1,
-0.2751601, -0.890821, -2.53311, 1, 1, 1, 1, 1,
-0.2735745, -1.020247, -3.040849, 1, 1, 1, 1, 1,
-0.2723666, -0.492337, -3.462411, 1, 1, 1, 1, 1,
-0.2664156, 0.6246323, -0.1353945, 1, 1, 1, 1, 1,
-0.2644369, -0.01396891, -1.537442, 1, 1, 1, 1, 1,
-0.2610516, -0.5407388, -3.990135, 1, 1, 1, 1, 1,
-0.2540783, 0.8153089, -0.4945072, 0, 0, 1, 1, 1,
-0.2497248, -0.9580591, -0.6969264, 1, 0, 0, 1, 1,
-0.2491676, -1.351119, -2.213345, 1, 0, 0, 1, 1,
-0.2490072, -1.024306, -2.109449, 1, 0, 0, 1, 1,
-0.2474014, -1.174393, -2.126057, 1, 0, 0, 1, 1,
-0.2464503, -0.9685518, -1.619249, 1, 0, 0, 1, 1,
-0.2464252, -1.006593, -4.486661, 0, 0, 0, 1, 1,
-0.2421395, 0.009261606, -0.5136009, 0, 0, 0, 1, 1,
-0.2418733, 0.8488209, -1.907883, 0, 0, 0, 1, 1,
-0.2408167, -2.227731, -4.686102, 0, 0, 0, 1, 1,
-0.2377442, -0.6260273, -2.905337, 0, 0, 0, 1, 1,
-0.2371691, -0.3072231, -2.75214, 0, 0, 0, 1, 1,
-0.2348019, 0.6889806, -0.9246039, 0, 0, 0, 1, 1,
-0.2309271, -0.1460701, -2.001831, 1, 1, 1, 1, 1,
-0.2237005, -0.3861345, -1.602935, 1, 1, 1, 1, 1,
-0.2214548, 1.078954, -1.059757, 1, 1, 1, 1, 1,
-0.2171306, -1.964682, -2.176723, 1, 1, 1, 1, 1,
-0.2025433, 0.3749044, -0.709828, 1, 1, 1, 1, 1,
-0.2023121, 2.070978, -1.21199, 1, 1, 1, 1, 1,
-0.2011129, -0.4447814, -3.460257, 1, 1, 1, 1, 1,
-0.1977348, 0.3346485, -0.6489314, 1, 1, 1, 1, 1,
-0.194253, 0.1345473, -1.33894, 1, 1, 1, 1, 1,
-0.193281, -0.4504974, -1.459546, 1, 1, 1, 1, 1,
-0.192247, 1.070869, 0.1292383, 1, 1, 1, 1, 1,
-0.1890065, 0.2316762, -0.6217332, 1, 1, 1, 1, 1,
-0.1876181, -0.7312165, -2.612558, 1, 1, 1, 1, 1,
-0.186372, 0.8194967, 1.17041, 1, 1, 1, 1, 1,
-0.180878, 1.470889, -1.04076, 1, 1, 1, 1, 1,
-0.1774398, 1.412019, 0.6185163, 0, 0, 1, 1, 1,
-0.1764184, -0.1226202, -1.483261, 1, 0, 0, 1, 1,
-0.1757087, 0.09496529, 1.40787, 1, 0, 0, 1, 1,
-0.1747919, 0.9210663, -1.513009, 1, 0, 0, 1, 1,
-0.1719786, -0.4350812, -4.395586, 1, 0, 0, 1, 1,
-0.1718115, -0.8022732, -3.105202, 1, 0, 0, 1, 1,
-0.1716066, 1.120992, 0.7875033, 0, 0, 0, 1, 1,
-0.1670754, 0.7029282, -0.6367829, 0, 0, 0, 1, 1,
-0.1643705, -0.261012, -1.863018, 0, 0, 0, 1, 1,
-0.1620249, -0.9260802, -3.300236, 0, 0, 0, 1, 1,
-0.1583356, -0.7560088, -1.221708, 0, 0, 0, 1, 1,
-0.1569888, -0.3739003, -3.772803, 0, 0, 0, 1, 1,
-0.1459124, -1.137748, -1.851647, 0, 0, 0, 1, 1,
-0.1456976, -0.9701487, -1.959324, 1, 1, 1, 1, 1,
-0.1404493, 2.515535, -0.9343598, 1, 1, 1, 1, 1,
-0.1378632, 1.052349, -0.5784431, 1, 1, 1, 1, 1,
-0.1361067, -1.397309, -3.520123, 1, 1, 1, 1, 1,
-0.1327201, 0.2576474, -1.2815, 1, 1, 1, 1, 1,
-0.1278596, 0.1742818, 0.01774897, 1, 1, 1, 1, 1,
-0.1260584, 0.3676664, -0.7181085, 1, 1, 1, 1, 1,
-0.1251265, -0.09575678, -0.2470414, 1, 1, 1, 1, 1,
-0.1212582, -1.298918, -2.113476, 1, 1, 1, 1, 1,
-0.1112427, -0.1286486, -1.22827, 1, 1, 1, 1, 1,
-0.110852, -0.5446787, -2.910814, 1, 1, 1, 1, 1,
-0.1044542, -0.5969705, -1.564731, 1, 1, 1, 1, 1,
-0.1019679, -1.077509, -3.082187, 1, 1, 1, 1, 1,
-0.1009951, -0.6243805, -2.384284, 1, 1, 1, 1, 1,
-0.1005223, -1.415591, -3.695968, 1, 1, 1, 1, 1,
-0.09960551, 1.314871, 0.0691187, 0, 0, 1, 1, 1,
-0.098007, -1.950545, -3.664152, 1, 0, 0, 1, 1,
-0.09728365, -1.124346, -2.895786, 1, 0, 0, 1, 1,
-0.09365273, 1.980355, -2.044842, 1, 0, 0, 1, 1,
-0.09332123, 0.4450458, -1.530761, 1, 0, 0, 1, 1,
-0.09290428, 0.6152163, 0.4682566, 1, 0, 0, 1, 1,
-0.09286153, -0.8823044, -2.135813, 0, 0, 0, 1, 1,
-0.08702308, -1.272463, -1.094176, 0, 0, 0, 1, 1,
-0.08583888, 1.194477, 0.2424025, 0, 0, 0, 1, 1,
-0.07943556, -0.3615052, -1.858347, 0, 0, 0, 1, 1,
-0.07605166, 0.7185362, 0.5590904, 0, 0, 0, 1, 1,
-0.07034373, -0.7406464, -1.848883, 0, 0, 0, 1, 1,
-0.0668929, -0.8045123, -0.8423529, 0, 0, 0, 1, 1,
-0.06239884, 0.6692437, 0.6255503, 1, 1, 1, 1, 1,
-0.06153016, -0.1466353, -2.715276, 1, 1, 1, 1, 1,
-0.05899365, -0.9112091, -1.257434, 1, 1, 1, 1, 1,
-0.05895058, -0.1628083, -1.66062, 1, 1, 1, 1, 1,
-0.05717864, -1.193597, -2.973756, 1, 1, 1, 1, 1,
-0.05587905, 0.06068309, -0.3906774, 1, 1, 1, 1, 1,
-0.04753252, -0.9085016, -3.227094, 1, 1, 1, 1, 1,
-0.04651502, -1.291296, -2.172402, 1, 1, 1, 1, 1,
-0.04630491, -1.526501, -1.549214, 1, 1, 1, 1, 1,
-0.03849719, 0.3307721, 1.367776, 1, 1, 1, 1, 1,
-0.03629282, -0.3569221, -1.191564, 1, 1, 1, 1, 1,
-0.03597656, -0.1580163, -3.408724, 1, 1, 1, 1, 1,
-0.0359694, -0.3941849, -4.440982, 1, 1, 1, 1, 1,
-0.02491892, 0.630704, 0.9791719, 1, 1, 1, 1, 1,
-0.02353861, 0.9075156, -0.1808251, 1, 1, 1, 1, 1,
-0.02174405, 0.6173533, 0.7779949, 0, 0, 1, 1, 1,
-0.02105487, 1.632846, 0.4952824, 1, 0, 0, 1, 1,
-0.02011587, -1.623872, -3.419337, 1, 0, 0, 1, 1,
-0.0188139, 0.8951588, 1.514632, 1, 0, 0, 1, 1,
-0.01428636, 0.3137238, 0.5725086, 1, 0, 0, 1, 1,
-0.01298898, -0.6385796, -2.765159, 1, 0, 0, 1, 1,
-0.008558586, 0.2389891, -0.6606073, 0, 0, 0, 1, 1,
-0.007544877, 1.252431, -0.7509202, 0, 0, 0, 1, 1,
-0.002585698, -1.119227, -2.424599, 0, 0, 0, 1, 1,
0.0005719165, -0.7824814, 2.417267, 0, 0, 0, 1, 1,
0.000824525, 0.9035575, 1.030478, 0, 0, 0, 1, 1,
0.00347882, 0.5930355, 0.9070621, 0, 0, 0, 1, 1,
0.005255462, 0.1719892, -0.6084397, 0, 0, 0, 1, 1,
0.01210073, 0.8584472, 1.607204, 1, 1, 1, 1, 1,
0.0137468, -0.3460954, 2.351543, 1, 1, 1, 1, 1,
0.01774356, 0.02833418, -0.2716573, 1, 1, 1, 1, 1,
0.01867939, 0.385611, 0.2304593, 1, 1, 1, 1, 1,
0.02122124, 0.3932201, -0.8156269, 1, 1, 1, 1, 1,
0.02176, -0.1002773, 2.441843, 1, 1, 1, 1, 1,
0.02546383, -0.08978951, 2.361762, 1, 1, 1, 1, 1,
0.02855836, -0.9867307, 4.837297, 1, 1, 1, 1, 1,
0.03099157, -0.9942288, 1.268561, 1, 1, 1, 1, 1,
0.03366188, -1.287531, 3.253517, 1, 1, 1, 1, 1,
0.03392154, -1.436207, 4.624269, 1, 1, 1, 1, 1,
0.03619097, -1.19083, 3.017451, 1, 1, 1, 1, 1,
0.03825205, -1.872554, 2.220454, 1, 1, 1, 1, 1,
0.04586202, -1.75095, 4.215724, 1, 1, 1, 1, 1,
0.0525375, -0.7343938, 1.579957, 1, 1, 1, 1, 1,
0.05253978, -0.3828735, 2.277084, 0, 0, 1, 1, 1,
0.05423209, 0.805916, 1.976804, 1, 0, 0, 1, 1,
0.05660634, -0.7526808, 2.559102, 1, 0, 0, 1, 1,
0.06004793, 0.8167517, -0.5252841, 1, 0, 0, 1, 1,
0.06032925, 0.6191977, 0.1182773, 1, 0, 0, 1, 1,
0.06316462, -0.1233406, 4.046674, 1, 0, 0, 1, 1,
0.06413919, -0.4222378, 2.065369, 0, 0, 0, 1, 1,
0.06418607, -1.213372, 3.604035, 0, 0, 0, 1, 1,
0.06497566, 0.2809087, -0.3345892, 0, 0, 0, 1, 1,
0.06578741, 0.8292274, 0.7946959, 0, 0, 0, 1, 1,
0.0666416, -0.6742945, 1.650237, 0, 0, 0, 1, 1,
0.06887353, 0.2589599, 1.996309, 0, 0, 0, 1, 1,
0.07088436, 1.80334, 0.1089603, 0, 0, 0, 1, 1,
0.07122896, -1.590057, 3.191291, 1, 1, 1, 1, 1,
0.07249144, 0.2919765, 0.4783357, 1, 1, 1, 1, 1,
0.07369304, 0.07981361, -1.260167, 1, 1, 1, 1, 1,
0.07751372, 0.4099964, 2.786189, 1, 1, 1, 1, 1,
0.0790493, -1.558964, 1.892594, 1, 1, 1, 1, 1,
0.08711626, -0.09188798, 3.298193, 1, 1, 1, 1, 1,
0.0930071, 1.085821, -0.4660894, 1, 1, 1, 1, 1,
0.09370623, -0.7455007, 2.566657, 1, 1, 1, 1, 1,
0.09456575, -0.2631373, 3.067824, 1, 1, 1, 1, 1,
0.09808935, -1.045138, 3.081652, 1, 1, 1, 1, 1,
0.09980776, -0.1167345, 4.007699, 1, 1, 1, 1, 1,
0.1000197, 0.09926669, 1.628722, 1, 1, 1, 1, 1,
0.1013573, -0.02549664, 2.229791, 1, 1, 1, 1, 1,
0.1014127, -0.5227497, 2.967858, 1, 1, 1, 1, 1,
0.1028468, 0.6344184, 0.8224395, 1, 1, 1, 1, 1,
0.1103796, -0.4488334, 2.518013, 0, 0, 1, 1, 1,
0.1120637, -1.478332, 4.354502, 1, 0, 0, 1, 1,
0.1134813, 0.3868368, -0.3788638, 1, 0, 0, 1, 1,
0.1185298, 0.9472753, -1.336342, 1, 0, 0, 1, 1,
0.1187316, 0.04921177, -0.3414608, 1, 0, 0, 1, 1,
0.1200659, 1.213592, 2.679381, 1, 0, 0, 1, 1,
0.1279554, -0.1886716, 1.5612, 0, 0, 0, 1, 1,
0.1300091, -1.377164, 4.165641, 0, 0, 0, 1, 1,
0.1309995, 0.4129937, -1.291639, 0, 0, 0, 1, 1,
0.1349065, 0.3639763, -0.5457177, 0, 0, 0, 1, 1,
0.1367455, 0.3535375, 0.5117625, 0, 0, 0, 1, 1,
0.1400479, 1.483701, -0.4858229, 0, 0, 0, 1, 1,
0.1443449, 1.202008, 1.287602, 0, 0, 0, 1, 1,
0.1478792, 0.01884665, 0.6804374, 1, 1, 1, 1, 1,
0.153356, 0.4803281, -0.185597, 1, 1, 1, 1, 1,
0.1574555, -0.4593909, 3.028919, 1, 1, 1, 1, 1,
0.1612788, 0.5767931, -0.4057795, 1, 1, 1, 1, 1,
0.1625119, 0.6045687, 0.923862, 1, 1, 1, 1, 1,
0.1642538, -0.1832481, 2.763945, 1, 1, 1, 1, 1,
0.1650889, 1.091472, 1.129627, 1, 1, 1, 1, 1,
0.1669985, -0.4609794, 2.760363, 1, 1, 1, 1, 1,
0.1699959, -1.223687, 2.802422, 1, 1, 1, 1, 1,
0.173177, -1.501286, 1.6826, 1, 1, 1, 1, 1,
0.1745292, -0.9604437, 2.381948, 1, 1, 1, 1, 1,
0.1808573, -1.713042, 6.121905, 1, 1, 1, 1, 1,
0.1824003, -0.06526091, -0.1637311, 1, 1, 1, 1, 1,
0.1892098, 0.1058425, -0.2805951, 1, 1, 1, 1, 1,
0.19032, 1.724505, -1.823471, 1, 1, 1, 1, 1,
0.1913714, 0.6078788, -0.9643292, 0, 0, 1, 1, 1,
0.1927506, 0.6210956, -0.9000231, 1, 0, 0, 1, 1,
0.19381, -0.2557647, 1.898781, 1, 0, 0, 1, 1,
0.1962171, -0.9172893, 3.935369, 1, 0, 0, 1, 1,
0.198486, -1.315467, 2.381211, 1, 0, 0, 1, 1,
0.2063489, 0.171129, 0.7707608, 1, 0, 0, 1, 1,
0.2114142, 0.9101347, 1.178078, 0, 0, 0, 1, 1,
0.2116465, 1.14568, 0.4434754, 0, 0, 0, 1, 1,
0.2146429, -0.8254003, 2.233647, 0, 0, 0, 1, 1,
0.2172833, -0.01133291, 1.263963, 0, 0, 0, 1, 1,
0.2174033, 0.006831347, 0.6206058, 0, 0, 0, 1, 1,
0.2198028, -1.290388, 3.29544, 0, 0, 0, 1, 1,
0.2233819, -1.106832, 3.83385, 0, 0, 0, 1, 1,
0.2234707, -0.07979287, 3.410688, 1, 1, 1, 1, 1,
0.2252237, 0.8560164, 1.261113, 1, 1, 1, 1, 1,
0.228695, -1.850623, 3.96876, 1, 1, 1, 1, 1,
0.2307882, -0.2210357, 4.386727, 1, 1, 1, 1, 1,
0.2308431, 0.9326443, 0.1146048, 1, 1, 1, 1, 1,
0.2415016, -1.004939, 2.741557, 1, 1, 1, 1, 1,
0.241952, -0.8759457, 4.988246, 1, 1, 1, 1, 1,
0.2450027, -0.2324392, 3.171101, 1, 1, 1, 1, 1,
0.2459415, -0.3981098, 3.488094, 1, 1, 1, 1, 1,
0.2464725, -1.051063, 3.59805, 1, 1, 1, 1, 1,
0.2469865, 0.576537, -0.08586317, 1, 1, 1, 1, 1,
0.2491011, 1.358344, -0.3776504, 1, 1, 1, 1, 1,
0.2510408, -1.398988, 2.526931, 1, 1, 1, 1, 1,
0.2532102, -1.504302, 2.639083, 1, 1, 1, 1, 1,
0.2538534, 2.069915, -1.775663, 1, 1, 1, 1, 1,
0.2550086, -1.050583, 3.26506, 0, 0, 1, 1, 1,
0.2551743, 1.240739, 0.002347951, 1, 0, 0, 1, 1,
0.2558914, 0.2979538, 1.641011, 1, 0, 0, 1, 1,
0.2570935, 0.9654521, -1.040297, 1, 0, 0, 1, 1,
0.258911, 1.410447, -2.322028, 1, 0, 0, 1, 1,
0.2592705, 0.6844304, 0.5260605, 1, 0, 0, 1, 1,
0.2608584, 0.6558659, 1.976479, 0, 0, 0, 1, 1,
0.2633972, -0.475018, 3.049087, 0, 0, 0, 1, 1,
0.2723605, 0.61677, 0.348385, 0, 0, 0, 1, 1,
0.2725086, 0.646837, 0.2634919, 0, 0, 0, 1, 1,
0.2737161, 1.008823, -2.479526, 0, 0, 0, 1, 1,
0.2776442, 0.4054632, 0.2203142, 0, 0, 0, 1, 1,
0.2822531, -0.08196323, 1.276663, 0, 0, 0, 1, 1,
0.2877261, -0.1997508, 3.439409, 1, 1, 1, 1, 1,
0.2895359, -1.425995, 2.878686, 1, 1, 1, 1, 1,
0.2935607, -0.1735687, 3.543009, 1, 1, 1, 1, 1,
0.2955673, -0.6732696, 1.972352, 1, 1, 1, 1, 1,
0.302619, -0.4295551, 1.52055, 1, 1, 1, 1, 1,
0.3034885, -1.540176, 2.862594, 1, 1, 1, 1, 1,
0.3035439, -1.073101, 1.085525, 1, 1, 1, 1, 1,
0.3054017, 0.03398343, 3.641988, 1, 1, 1, 1, 1,
0.3095835, -1.512384, 3.262602, 1, 1, 1, 1, 1,
0.313409, -0.3354779, 2.132295, 1, 1, 1, 1, 1,
0.3155731, -0.6399437, 2.793098, 1, 1, 1, 1, 1,
0.3204668, -2.181816, 2.594512, 1, 1, 1, 1, 1,
0.3267317, 0.5001467, -0.5219904, 1, 1, 1, 1, 1,
0.3273254, 1.126767, 1.460692, 1, 1, 1, 1, 1,
0.3274343, -0.9962893, 1.626126, 1, 1, 1, 1, 1,
0.3313418, -0.0004139777, 0.6515737, 0, 0, 1, 1, 1,
0.3331399, -0.9042424, 2.934642, 1, 0, 0, 1, 1,
0.3331738, 0.2164422, 1.108531, 1, 0, 0, 1, 1,
0.3337472, -1.735008, 3.914532, 1, 0, 0, 1, 1,
0.3342639, 0.3662519, 1.716506, 1, 0, 0, 1, 1,
0.3361171, 0.5619659, -0.2304723, 1, 0, 0, 1, 1,
0.337031, 1.86932, -0.5848541, 0, 0, 0, 1, 1,
0.3376134, 0.7258953, 0.7471015, 0, 0, 0, 1, 1,
0.3469687, 0.1043672, 1.431189, 0, 0, 0, 1, 1,
0.3492515, 0.2311879, 0.8384085, 0, 0, 0, 1, 1,
0.3512948, -0.4448598, 4.702703, 0, 0, 0, 1, 1,
0.3575139, 1.467302, 1.200555, 0, 0, 0, 1, 1,
0.3595779, -1.084496, 2.130651, 0, 0, 0, 1, 1,
0.3600649, -0.6160113, 2.598244, 1, 1, 1, 1, 1,
0.3600962, 0.06547736, 0.1198359, 1, 1, 1, 1, 1,
0.3655763, 2.954739, -0.4281785, 1, 1, 1, 1, 1,
0.3661613, 1.032355, 1.197185, 1, 1, 1, 1, 1,
0.3663467, -0.7334695, 2.987514, 1, 1, 1, 1, 1,
0.3666603, 1.255964, -0.8732411, 1, 1, 1, 1, 1,
0.3721891, 0.3767925, 1.307251, 1, 1, 1, 1, 1,
0.3738095, 0.4202535, 2.04467, 1, 1, 1, 1, 1,
0.3744056, 0.3682294, 1.00478, 1, 1, 1, 1, 1,
0.3745896, -0.8162964, 3.075412, 1, 1, 1, 1, 1,
0.3749857, -1.323273, 3.319044, 1, 1, 1, 1, 1,
0.3760253, -0.9011016, 3.593003, 1, 1, 1, 1, 1,
0.3780188, -1.545381, 1.964478, 1, 1, 1, 1, 1,
0.380771, 0.4241557, 0.9369779, 1, 1, 1, 1, 1,
0.3838645, -1.24844, 4.458736, 1, 1, 1, 1, 1,
0.3843624, 0.4807128, 1.330191, 0, 0, 1, 1, 1,
0.3936707, 0.5875089, 1.520576, 1, 0, 0, 1, 1,
0.3966237, 1.021933, 1.507576, 1, 0, 0, 1, 1,
0.3971467, 0.05492726, 1.272839, 1, 0, 0, 1, 1,
0.4008706, 0.4251821, 2.029387, 1, 0, 0, 1, 1,
0.4014814, 0.169408, -0.1897009, 1, 0, 0, 1, 1,
0.4016082, -0.8753929, 3.497272, 0, 0, 0, 1, 1,
0.4047631, -0.2013553, 1.293514, 0, 0, 0, 1, 1,
0.4063392, 0.6018701, -0.3599835, 0, 0, 0, 1, 1,
0.4066712, 0.5953031, -0.2076745, 0, 0, 0, 1, 1,
0.4076444, 0.2218196, 0.7511335, 0, 0, 0, 1, 1,
0.4082284, 1.257971, 0.5505949, 0, 0, 0, 1, 1,
0.4084599, 0.5216683, -0.1829143, 0, 0, 0, 1, 1,
0.4092628, 0.3269936, 0.5803839, 1, 1, 1, 1, 1,
0.4114375, 1.656023, -0.6759807, 1, 1, 1, 1, 1,
0.4138083, 0.3451447, 1.678015, 1, 1, 1, 1, 1,
0.4161952, 0.5265307, 1.456257, 1, 1, 1, 1, 1,
0.4182456, 1.33093, 0.7182426, 1, 1, 1, 1, 1,
0.4187443, 0.5434182, 1.133049, 1, 1, 1, 1, 1,
0.4223136, 0.9176749, 0.1531309, 1, 1, 1, 1, 1,
0.4240049, -1.947289, 3.685798, 1, 1, 1, 1, 1,
0.4256305, 0.7260361, 1.356337, 1, 1, 1, 1, 1,
0.4281194, 1.402568, 1.579943, 1, 1, 1, 1, 1,
0.4288264, -0.580992, 2.259554, 1, 1, 1, 1, 1,
0.4303388, -0.02995775, 0.5104221, 1, 1, 1, 1, 1,
0.4357974, 0.6476309, 0.3298003, 1, 1, 1, 1, 1,
0.4380538, -0.4722791, 2.787334, 1, 1, 1, 1, 1,
0.4395396, 0.9844453, 0.852676, 1, 1, 1, 1, 1,
0.4400808, 0.3199784, 1.62105, 0, 0, 1, 1, 1,
0.4438509, -0.09494528, 2.492521, 1, 0, 0, 1, 1,
0.4466461, -1.388481, 2.561973, 1, 0, 0, 1, 1,
0.4501899, 1.242885, 0.1296293, 1, 0, 0, 1, 1,
0.4512849, 0.6343041, 1.346942, 1, 0, 0, 1, 1,
0.4570183, 1.751801, 0.6242245, 1, 0, 0, 1, 1,
0.4570583, 1.677269, 1.443782, 0, 0, 0, 1, 1,
0.4615805, 0.1831987, 2.675551, 0, 0, 0, 1, 1,
0.4646921, -0.8480341, 1.716344, 0, 0, 0, 1, 1,
0.4723817, -0.8534809, 3.199992, 0, 0, 0, 1, 1,
0.4767033, -0.3173892, 2.700576, 0, 0, 0, 1, 1,
0.4768979, 1.0242, 0.08482754, 0, 0, 0, 1, 1,
0.4771497, 0.449276, -0.7458239, 0, 0, 0, 1, 1,
0.4944454, -1.9004, 2.099397, 1, 1, 1, 1, 1,
0.4944473, 1.051989, 1.267672, 1, 1, 1, 1, 1,
0.4947737, -0.3149201, 0.9786314, 1, 1, 1, 1, 1,
0.4950937, -0.2198334, 3.781254, 1, 1, 1, 1, 1,
0.4956954, -0.8108513, 4.102256, 1, 1, 1, 1, 1,
0.4991298, -0.2959531, 2.002181, 1, 1, 1, 1, 1,
0.5011253, 0.1916277, 1.138858, 1, 1, 1, 1, 1,
0.5026368, 0.09468231, 2.016703, 1, 1, 1, 1, 1,
0.5027419, -1.039755, 2.228818, 1, 1, 1, 1, 1,
0.5077153, 0.8854436, 1.311738, 1, 1, 1, 1, 1,
0.5121884, 0.9822477, 0.3518522, 1, 1, 1, 1, 1,
0.5122921, 0.9609856, -0.455615, 1, 1, 1, 1, 1,
0.5175208, -2.301534, 2.168555, 1, 1, 1, 1, 1,
0.5235714, -0.3005415, 2.134734, 1, 1, 1, 1, 1,
0.5251046, -0.02035891, 0.8779039, 1, 1, 1, 1, 1,
0.531482, 1.53577, -0.05588986, 0, 0, 1, 1, 1,
0.5315923, 0.1070995, 1.319375, 1, 0, 0, 1, 1,
0.5338986, -0.8336707, 3.336363, 1, 0, 0, 1, 1,
0.5353512, 0.4934955, 3.342381, 1, 0, 0, 1, 1,
0.5390157, -0.3130677, 1.926897, 1, 0, 0, 1, 1,
0.5402902, 0.7152293, 1.080475, 1, 0, 0, 1, 1,
0.5415277, 0.8379247, 0.3733129, 0, 0, 0, 1, 1,
0.5478812, -0.09941836, 3.913406, 0, 0, 0, 1, 1,
0.5488356, 1.21971, 0.7780536, 0, 0, 0, 1, 1,
0.5512579, -1.600528, 2.003314, 0, 0, 0, 1, 1,
0.5522882, -1.094141, 2.224737, 0, 0, 0, 1, 1,
0.5544654, -0.305608, 1.916445, 0, 0, 0, 1, 1,
0.557512, -0.8314328, 3.115864, 0, 0, 0, 1, 1,
0.561869, -0.2714828, 1.866949, 1, 1, 1, 1, 1,
0.564883, -1.891058, 3.89728, 1, 1, 1, 1, 1,
0.5656618, 0.4428972, -0.1589445, 1, 1, 1, 1, 1,
0.5677769, -0.5454483, 3.704438, 1, 1, 1, 1, 1,
0.5697963, -0.007233424, 1.593621, 1, 1, 1, 1, 1,
0.5711374, -0.7464772, 2.31116, 1, 1, 1, 1, 1,
0.5764977, -0.1334328, 1.586029, 1, 1, 1, 1, 1,
0.5800276, 1.475625, 0.3900249, 1, 1, 1, 1, 1,
0.5807298, -0.8836041, 3.420958, 1, 1, 1, 1, 1,
0.5814429, -0.4132248, 1.90642, 1, 1, 1, 1, 1,
0.5831969, -0.4745287, 1.238907, 1, 1, 1, 1, 1,
0.5859684, -0.03209908, -0.04705266, 1, 1, 1, 1, 1,
0.5865632, 0.8649943, 1.585162, 1, 1, 1, 1, 1,
0.58703, 1.83065, -1.490902, 1, 1, 1, 1, 1,
0.5884946, 0.2679929, 0.9251625, 1, 1, 1, 1, 1,
0.5954719, -0.1085908, 2.161611, 0, 0, 1, 1, 1,
0.6016474, -1.8684, 4.386447, 1, 0, 0, 1, 1,
0.6041619, -0.8094595, 2.263001, 1, 0, 0, 1, 1,
0.6061072, -0.8700963, 1.175997, 1, 0, 0, 1, 1,
0.6143819, 1.693138, 1.192877, 1, 0, 0, 1, 1,
0.6177881, -1.58112, 4.088555, 1, 0, 0, 1, 1,
0.6190328, 0.5387339, 0.6746727, 0, 0, 0, 1, 1,
0.6211492, -0.7693614, 1.722169, 0, 0, 0, 1, 1,
0.6240569, 0.408595, 0.03970525, 0, 0, 0, 1, 1,
0.6254618, 1.164086, 0.4384485, 0, 0, 0, 1, 1,
0.6292424, 0.1024684, 0.8591397, 0, 0, 0, 1, 1,
0.633512, -0.9729605, 2.214174, 0, 0, 0, 1, 1,
0.6387818, -0.8289416, 3.702552, 0, 0, 0, 1, 1,
0.6417977, 0.002625281, 2.322905, 1, 1, 1, 1, 1,
0.6456449, 1.565372, -0.06144456, 1, 1, 1, 1, 1,
0.6481864, 0.8051437, 0.3545749, 1, 1, 1, 1, 1,
0.6490653, -0.4756068, 1.541668, 1, 1, 1, 1, 1,
0.6591178, 0.4099018, -1.571443, 1, 1, 1, 1, 1,
0.6597286, -0.5533507, 0.3286328, 1, 1, 1, 1, 1,
0.6614498, 0.4761246, 1.452025, 1, 1, 1, 1, 1,
0.6634952, -0.8677996, 2.935224, 1, 1, 1, 1, 1,
0.6683369, -1.062395, 3.184243, 1, 1, 1, 1, 1,
0.6745108, 1.757632, -0.7102078, 1, 1, 1, 1, 1,
0.6802431, -0.2065766, 1.916159, 1, 1, 1, 1, 1,
0.6855341, -0.5778462, 1.647781, 1, 1, 1, 1, 1,
0.6898347, 0.1926745, 1.443614, 1, 1, 1, 1, 1,
0.6942326, 2.638499, 0.4096776, 1, 1, 1, 1, 1,
0.6984202, -0.3390978, 2.771235, 1, 1, 1, 1, 1,
0.700568, -0.1580567, 3.147639, 0, 0, 1, 1, 1,
0.7031812, -0.6689969, 3.255431, 1, 0, 0, 1, 1,
0.7049884, 0.01289608, 0.9668037, 1, 0, 0, 1, 1,
0.7054812, 0.2958093, 0.8627837, 1, 0, 0, 1, 1,
0.70907, -0.09068976, 2.168897, 1, 0, 0, 1, 1,
0.717405, 1.326136, 0.2642403, 1, 0, 0, 1, 1,
0.7238438, -1.281443, -0.5425528, 0, 0, 0, 1, 1,
0.7245314, -0.9019528, 2.394703, 0, 0, 0, 1, 1,
0.725006, 0.8445166, 1.184644, 0, 0, 0, 1, 1,
0.7292041, 0.3189731, -0.4927743, 0, 0, 0, 1, 1,
0.7370557, -0.5081426, 1.643518, 0, 0, 0, 1, 1,
0.7382939, -0.4188468, 3.863583, 0, 0, 0, 1, 1,
0.7401618, -0.4684641, 2.890402, 0, 0, 0, 1, 1,
0.7426856, -0.9985281, 3.31821, 1, 1, 1, 1, 1,
0.7453429, 1.379887, -0.8190842, 1, 1, 1, 1, 1,
0.7472656, -0.2073223, 3.094011, 1, 1, 1, 1, 1,
0.7477775, -1.057029, 2.820917, 1, 1, 1, 1, 1,
0.7509732, 1.119959, -0.702683, 1, 1, 1, 1, 1,
0.7572562, 0.3233616, 0.6561333, 1, 1, 1, 1, 1,
0.7592539, 0.07691912, 0.5290836, 1, 1, 1, 1, 1,
0.7612337, 1.13997, 1.61306, 1, 1, 1, 1, 1,
0.7649087, -0.1637296, 1.266877, 1, 1, 1, 1, 1,
0.7695695, -1.50968, 0.2970923, 1, 1, 1, 1, 1,
0.7709818, -0.4443337, 2.212534, 1, 1, 1, 1, 1,
0.7714471, 0.9908651, -0.3826206, 1, 1, 1, 1, 1,
0.7728431, -1.069849, 2.098649, 1, 1, 1, 1, 1,
0.773101, -1.814861, 3.478759, 1, 1, 1, 1, 1,
0.7753795, -0.7297671, 1.810714, 1, 1, 1, 1, 1,
0.7759786, -0.6148626, 3.723469, 0, 0, 1, 1, 1,
0.7820216, 0.2558222, 1.372612, 1, 0, 0, 1, 1,
0.7840912, -1.257327, 2.352664, 1, 0, 0, 1, 1,
0.7888893, -0.332036, 2.833342, 1, 0, 0, 1, 1,
0.7898084, -0.5380017, 1.314898, 1, 0, 0, 1, 1,
0.8084353, 1.24185, 1.116988, 1, 0, 0, 1, 1,
0.8093953, -0.1536662, 0.839903, 0, 0, 0, 1, 1,
0.8104357, 0.08995444, 1.591264, 0, 0, 0, 1, 1,
0.8133567, 0.851221, -0.9794114, 0, 0, 0, 1, 1,
0.8148128, 1.460346, 0.3708333, 0, 0, 0, 1, 1,
0.8172617, -0.4278866, 2.000758, 0, 0, 0, 1, 1,
0.8262872, -1.148262, 2.376187, 0, 0, 0, 1, 1,
0.8301452, -0.2812063, 2.889502, 0, 0, 0, 1, 1,
0.8305177, -1.100801, 3.226672, 1, 1, 1, 1, 1,
0.8338425, -0.2707513, 2.111828, 1, 1, 1, 1, 1,
0.849488, 0.4597345, 0.2500892, 1, 1, 1, 1, 1,
0.855798, 0.4861368, 1.381902, 1, 1, 1, 1, 1,
0.8575654, -0.6747543, 2.57544, 1, 1, 1, 1, 1,
0.8602194, -0.6085649, 1.617601, 1, 1, 1, 1, 1,
0.867279, -2.079439, 2.704641, 1, 1, 1, 1, 1,
0.8686725, 0.5627206, 1.172981, 1, 1, 1, 1, 1,
0.8707696, 0.4477731, 0.3755845, 1, 1, 1, 1, 1,
0.8709927, -0.334576, 0.1454406, 1, 1, 1, 1, 1,
0.8711748, -1.378924, 2.983584, 1, 1, 1, 1, 1,
0.8735337, 0.09055389, 1.029634, 1, 1, 1, 1, 1,
0.8783565, -0.5134302, 1.19787, 1, 1, 1, 1, 1,
0.8850996, 0.1122852, 0.9326428, 1, 1, 1, 1, 1,
0.8911291, -0.3477285, 1.75374, 1, 1, 1, 1, 1,
0.8956482, 0.07661294, 1.908597, 0, 0, 1, 1, 1,
0.9002795, -0.8981263, 2.018424, 1, 0, 0, 1, 1,
0.9014814, -0.3037843, 2.042461, 1, 0, 0, 1, 1,
0.9110635, -0.1589286, 3.032879, 1, 0, 0, 1, 1,
0.915464, -0.2376314, 2.006444, 1, 0, 0, 1, 1,
0.9214261, 0.5342474, 1.428173, 1, 0, 0, 1, 1,
0.9225261, 0.06944995, -1.640258, 0, 0, 0, 1, 1,
0.9248565, 0.3627769, 1.343209, 0, 0, 0, 1, 1,
0.9269826, -0.3270958, 3.064426, 0, 0, 0, 1, 1,
0.9277131, 0.4147317, 1.179661, 0, 0, 0, 1, 1,
0.9387612, -0.1775373, 2.143592, 0, 0, 0, 1, 1,
0.9395611, 0.7223758, 0.5976874, 0, 0, 0, 1, 1,
0.9408629, 0.6895243, 2.520405, 0, 0, 0, 1, 1,
0.9460881, -1.596012, 2.181232, 1, 1, 1, 1, 1,
0.9496284, 1.381602, 0.8481828, 1, 1, 1, 1, 1,
0.9535511, -0.4449605, 2.679733, 1, 1, 1, 1, 1,
0.9582137, 1.43839, -1.454706, 1, 1, 1, 1, 1,
0.9631501, 0.8985873, 0.2737259, 1, 1, 1, 1, 1,
0.9702249, 1.30025, 1.033094, 1, 1, 1, 1, 1,
0.9737265, 0.9724844, 1.24797, 1, 1, 1, 1, 1,
0.977035, 0.412321, 0.4664347, 1, 1, 1, 1, 1,
0.9784566, 0.6037023, -1.344206, 1, 1, 1, 1, 1,
0.9806381, -0.6191987, 1.971797, 1, 1, 1, 1, 1,
0.9875457, 0.7415686, 0.7535741, 1, 1, 1, 1, 1,
0.9896483, -0.9008576, 1.177282, 1, 1, 1, 1, 1,
0.9959392, 0.09247381, 0.9651591, 1, 1, 1, 1, 1,
1.001781, -0.6008106, 1.099352, 1, 1, 1, 1, 1,
1.006192, -1.359839, 2.417418, 1, 1, 1, 1, 1,
1.010412, -1.881022, 1.932958, 0, 0, 1, 1, 1,
1.012797, 0.3849043, 0.9528956, 1, 0, 0, 1, 1,
1.016256, -0.5973179, 2.360098, 1, 0, 0, 1, 1,
1.019332, -0.2284024, 2.311424, 1, 0, 0, 1, 1,
1.025587, -0.7316433, 2.253738, 1, 0, 0, 1, 1,
1.044552, -0.01563993, 2.844791, 1, 0, 0, 1, 1,
1.050164, -0.7285597, 3.860012, 0, 0, 0, 1, 1,
1.05665, 1.293756, -0.01613008, 0, 0, 0, 1, 1,
1.062759, 0.4193035, 0.701212, 0, 0, 0, 1, 1,
1.065953, 0.9709117, -1.236568, 0, 0, 0, 1, 1,
1.069407, -2.248916, 2.863072, 0, 0, 0, 1, 1,
1.074988, 0.4198391, 1.580881, 0, 0, 0, 1, 1,
1.0755, -0.7916186, 1.153393, 0, 0, 0, 1, 1,
1.084341, -0.7170653, 3.853187, 1, 1, 1, 1, 1,
1.088082, -0.4117205, 1.020498, 1, 1, 1, 1, 1,
1.094196, -0.02591117, 2.622222, 1, 1, 1, 1, 1,
1.096987, 0.2117803, -0.2428649, 1, 1, 1, 1, 1,
1.102617, -0.7183111, 1.138097, 1, 1, 1, 1, 1,
1.116757, 0.3756723, -0.0300127, 1, 1, 1, 1, 1,
1.124009, 1.012645, 0.9683552, 1, 1, 1, 1, 1,
1.144693, -0.2794607, 2.761976, 1, 1, 1, 1, 1,
1.151462, 0.2698211, 2.439856, 1, 1, 1, 1, 1,
1.165258, -1.327277, 2.51728, 1, 1, 1, 1, 1,
1.169249, 0.07935736, 0.5216225, 1, 1, 1, 1, 1,
1.17632, -0.2081609, 1.469728, 1, 1, 1, 1, 1,
1.178491, -1.908873, 2.470602, 1, 1, 1, 1, 1,
1.181078, 1.959486, 2.174457, 1, 1, 1, 1, 1,
1.187462, -0.5651363, 2.181107, 1, 1, 1, 1, 1,
1.203154, 0.3379037, -0.09167494, 0, 0, 1, 1, 1,
1.217394, 0.1931224, 0.1906221, 1, 0, 0, 1, 1,
1.229382, -1.5128, 2.984053, 1, 0, 0, 1, 1,
1.236894, 1.159136, 0.6240331, 1, 0, 0, 1, 1,
1.248525, 0.50086, 0.4196678, 1, 0, 0, 1, 1,
1.24929, 1.2192, 1.072588, 1, 0, 0, 1, 1,
1.254312, -0.9366225, 2.346377, 0, 0, 0, 1, 1,
1.256006, 0.3178461, -1.277635, 0, 0, 0, 1, 1,
1.256972, -0.7713993, 2.008824, 0, 0, 0, 1, 1,
1.258192, 0.015193, 1.20493, 0, 0, 0, 1, 1,
1.258865, -0.3447973, 2.460986, 0, 0, 0, 1, 1,
1.26118, 1.11203, -0.1611905, 0, 0, 0, 1, 1,
1.26289, -1.025629, 2.752253, 0, 0, 0, 1, 1,
1.263839, 0.6101096, 2.517049, 1, 1, 1, 1, 1,
1.26666, -0.654771, 0.7852889, 1, 1, 1, 1, 1,
1.28584, -0.9921173, 3.402074, 1, 1, 1, 1, 1,
1.299335, -0.03326619, 2.347194, 1, 1, 1, 1, 1,
1.300975, 1.541571, 0.1644803, 1, 1, 1, 1, 1,
1.304398, 0.4978979, 3.05623, 1, 1, 1, 1, 1,
1.304883, -0.3011974, 3.34903, 1, 1, 1, 1, 1,
1.317494, 1.837153, -0.04993282, 1, 1, 1, 1, 1,
1.324321, -0.7758682, 0.2108894, 1, 1, 1, 1, 1,
1.331844, 0.09749609, 0.8582933, 1, 1, 1, 1, 1,
1.33488, 0.5981136, 1.527295, 1, 1, 1, 1, 1,
1.340893, 0.8856332, 1.094347, 1, 1, 1, 1, 1,
1.342045, 0.2537223, 0.3709844, 1, 1, 1, 1, 1,
1.357343, 0.5965868, 1.477332, 1, 1, 1, 1, 1,
1.357808, 0.9021137, 2.169116, 1, 1, 1, 1, 1,
1.363465, 1.181755, 1.386154, 0, 0, 1, 1, 1,
1.370044, 0.5881534, 1.552309, 1, 0, 0, 1, 1,
1.379265, -0.06584618, 2.202853, 1, 0, 0, 1, 1,
1.385315, 0.6212105, 0.7927625, 1, 0, 0, 1, 1,
1.387324, -0.9543367, 2.010265, 1, 0, 0, 1, 1,
1.41721, -0.6323848, 1.574076, 1, 0, 0, 1, 1,
1.419191, 0.7371896, 0.7234358, 0, 0, 0, 1, 1,
1.423319, -0.3586707, -0.3742074, 0, 0, 0, 1, 1,
1.425676, 0.9505002, -0.3717372, 0, 0, 0, 1, 1,
1.430978, -1.268189, 3.337201, 0, 0, 0, 1, 1,
1.43366, 0.4750433, 0.8796354, 0, 0, 0, 1, 1,
1.440067, -0.931541, 0.2547182, 0, 0, 0, 1, 1,
1.45293, -0.634388, -0.8466852, 0, 0, 0, 1, 1,
1.453498, -0.5075562, 3.498849, 1, 1, 1, 1, 1,
1.457916, 0.4163515, 0.9653044, 1, 1, 1, 1, 1,
1.466638, 0.1740946, -0.5780977, 1, 1, 1, 1, 1,
1.468153, 0.1592621, 2.007107, 1, 1, 1, 1, 1,
1.471635, 0.1699692, 0.6984809, 1, 1, 1, 1, 1,
1.477902, -0.2481215, 2.629763, 1, 1, 1, 1, 1,
1.507664, 1.147224, 1.669832, 1, 1, 1, 1, 1,
1.51019, -2.282174, 3.767193, 1, 1, 1, 1, 1,
1.514401, 0.5122854, 0.4696582, 1, 1, 1, 1, 1,
1.529311, -0.3852299, 3.456721, 1, 1, 1, 1, 1,
1.541427, 0.6409439, -0.1609084, 1, 1, 1, 1, 1,
1.590905, -0.6341227, 0.06313072, 1, 1, 1, 1, 1,
1.595721, 2.304625, 2.177435, 1, 1, 1, 1, 1,
1.598008, 1.79855, 0.9796053, 1, 1, 1, 1, 1,
1.605214, -0.07035564, 3.440739, 1, 1, 1, 1, 1,
1.619731, -0.809389, 1.513209, 0, 0, 1, 1, 1,
1.622859, -0.5308433, 3.290626, 1, 0, 0, 1, 1,
1.625075, -0.5155945, 1.584953, 1, 0, 0, 1, 1,
1.635946, -0.2736441, 0.2685653, 1, 0, 0, 1, 1,
1.639826, 0.9473782, 2.444128, 1, 0, 0, 1, 1,
1.710104, -0.3054152, 2.035702, 1, 0, 0, 1, 1,
1.716912, -0.1776264, 2.0412, 0, 0, 0, 1, 1,
1.719892, 0.5558386, 1.797799, 0, 0, 0, 1, 1,
1.733793, -0.6875503, 1.023104, 0, 0, 0, 1, 1,
1.756366, 1.582125, -0.8912778, 0, 0, 0, 1, 1,
1.764403, 0.4834938, 1.932157, 0, 0, 0, 1, 1,
1.78932, 1.592237, 2.206529, 0, 0, 0, 1, 1,
1.810241, -1.487862, 1.156625, 0, 0, 0, 1, 1,
1.843961, -0.3635056, 0.7579122, 1, 1, 1, 1, 1,
1.851847, -0.7185479, 3.192451, 1, 1, 1, 1, 1,
1.858018, 0.8951542, 2.05366, 1, 1, 1, 1, 1,
1.900661, -0.609715, 1.294393, 1, 1, 1, 1, 1,
1.904901, 0.5921859, 0.5580242, 1, 1, 1, 1, 1,
1.908963, 1.308487, 0.6633265, 1, 1, 1, 1, 1,
1.909781, 0.7465541, 2.947563, 1, 1, 1, 1, 1,
1.910602, -2.223426, 4.862591, 1, 1, 1, 1, 1,
1.924859, 0.408273, 2.219845, 1, 1, 1, 1, 1,
1.926216, -0.4271531, 2.472297, 1, 1, 1, 1, 1,
1.982148, -0.7910793, 1.045335, 1, 1, 1, 1, 1,
1.998451, -2.396557, 2.986033, 1, 1, 1, 1, 1,
2.035372, 0.03549695, 0.1581629, 1, 1, 1, 1, 1,
2.036002, -0.2303538, 2.945848, 1, 1, 1, 1, 1,
2.074715, 1.001925, -0.4991721, 1, 1, 1, 1, 1,
2.11791, -0.8138615, 1.483738, 0, 0, 1, 1, 1,
2.152372, -0.3027979, 0.1455413, 1, 0, 0, 1, 1,
2.157634, -0.3028124, 2.800756, 1, 0, 0, 1, 1,
2.165448, 0.3891501, 0.7351393, 1, 0, 0, 1, 1,
2.177153, -0.2641907, 2.686779, 1, 0, 0, 1, 1,
2.187868, 1.533754, -0.6966537, 1, 0, 0, 1, 1,
2.238918, 2.513505, 0.3740688, 0, 0, 0, 1, 1,
2.274296, -1.097983, 2.9743, 0, 0, 0, 1, 1,
2.275777, 0.1174534, 1.593097, 0, 0, 0, 1, 1,
2.304347, -1.465046, 4.220482, 0, 0, 0, 1, 1,
2.484101, 0.00958243, 2.105841, 0, 0, 0, 1, 1,
2.512813, 0.8801519, 0.9651476, 0, 0, 0, 1, 1,
2.580392, -0.3908231, 0.6566592, 0, 0, 0, 1, 1,
2.610343, -0.9894065, 3.030311, 1, 1, 1, 1, 1,
2.636362, -2.038666, 2.434674, 1, 1, 1, 1, 1,
2.636695, 1.19884, 2.387716, 1, 1, 1, 1, 1,
2.82897, -0.002504881, 2.498443, 1, 1, 1, 1, 1,
2.899357, -1.063559, 1.503399, 1, 1, 1, 1, 1,
2.91385, 0.3013956, 1.890442, 1, 1, 1, 1, 1,
3.486499, 1.097953, 2.185654, 1, 1, 1, 1, 1
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
var radius = 9.683103;
var distance = 34.01149;
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
mvMatrix.translate( -0.2458397, -0.279091, -0.3398645 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.01149);
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
