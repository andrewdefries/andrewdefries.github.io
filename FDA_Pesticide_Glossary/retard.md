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
-3.579597, -0.3309953, -2.682568, 1, 0, 0, 1,
-3.169292, -0.4062506, -3.778252, 1, 0.007843138, 0, 1,
-3.148129, 1.863375, -0.8462676, 1, 0.01176471, 0, 1,
-2.909521, 0.4369608, -2.539894, 1, 0.01960784, 0, 1,
-2.746057, -0.710871, -0.5812072, 1, 0.02352941, 0, 1,
-2.57482, 0.667347, -0.6293746, 1, 0.03137255, 0, 1,
-2.566128, 0.7200779, -2.132701, 1, 0.03529412, 0, 1,
-2.54971, -0.5327314, -1.963335, 1, 0.04313726, 0, 1,
-2.486595, -0.252336, -1.387863, 1, 0.04705882, 0, 1,
-2.413904, -0.6055912, -2.070508, 1, 0.05490196, 0, 1,
-2.358906, -1.577047, -1.527251, 1, 0.05882353, 0, 1,
-2.326461, -0.6153175, -0.4376837, 1, 0.06666667, 0, 1,
-2.303221, 0.9058663, -0.7464318, 1, 0.07058824, 0, 1,
-2.296739, 0.7262433, -0.9261532, 1, 0.07843138, 0, 1,
-2.212095, -0.235388, -1.65243, 1, 0.08235294, 0, 1,
-2.146656, -2.460022, -3.499064, 1, 0.09019608, 0, 1,
-2.082014, 0.7575033, -3.148453, 1, 0.09411765, 0, 1,
-2.062351, -0.5160198, -2.329337, 1, 0.1019608, 0, 1,
-2.000479, 0.3962703, 0.3713073, 1, 0.1098039, 0, 1,
-1.987048, -1.019737, -1.730653, 1, 0.1137255, 0, 1,
-1.964313, -0.1009364, -1.270827, 1, 0.1215686, 0, 1,
-1.917731, 0.2681504, -2.868411, 1, 0.1254902, 0, 1,
-1.906941, 0.08333767, -1.768555, 1, 0.1333333, 0, 1,
-1.903107, 0.6563977, -1.312875, 1, 0.1372549, 0, 1,
-1.900403, 1.43965, 0.816436, 1, 0.145098, 0, 1,
-1.889101, 0.3648685, -1.164524, 1, 0.1490196, 0, 1,
-1.883595, -0.03412786, -4.007022, 1, 0.1568628, 0, 1,
-1.882759, 1.120029, -2.607201, 1, 0.1607843, 0, 1,
-1.850934, -1.676733, -1.844872, 1, 0.1686275, 0, 1,
-1.824057, -0.4284673, -2.144338, 1, 0.172549, 0, 1,
-1.810403, -0.9514439, -3.214757, 1, 0.1803922, 0, 1,
-1.787071, 0.7220952, 1.656701, 1, 0.1843137, 0, 1,
-1.781679, 0.651373, -1.299783, 1, 0.1921569, 0, 1,
-1.757936, -0.008347568, -0.7781325, 1, 0.1960784, 0, 1,
-1.756792, 0.6049876, -0.9106243, 1, 0.2039216, 0, 1,
-1.749167, -0.1452468, -1.364943, 1, 0.2117647, 0, 1,
-1.746921, -1.121805, -1.33277, 1, 0.2156863, 0, 1,
-1.745057, -0.5555678, -1.059383, 1, 0.2235294, 0, 1,
-1.738557, 0.1373606, -3.713554, 1, 0.227451, 0, 1,
-1.733182, -0.004504556, -2.44442, 1, 0.2352941, 0, 1,
-1.725077, 0.1276859, -2.191713, 1, 0.2392157, 0, 1,
-1.720766, -0.2733932, -1.582361, 1, 0.2470588, 0, 1,
-1.716649, -0.8554903, 0.007655517, 1, 0.2509804, 0, 1,
-1.710443, 0.184514, -1.543207, 1, 0.2588235, 0, 1,
-1.702517, 1.015314, -0.7637646, 1, 0.2627451, 0, 1,
-1.700092, -1.222929, -1.65438, 1, 0.2705882, 0, 1,
-1.699084, -0.1810369, -2.437161, 1, 0.2745098, 0, 1,
-1.683429, 1.098795, -1.791681, 1, 0.282353, 0, 1,
-1.679728, -0.3835215, -2.915486, 1, 0.2862745, 0, 1,
-1.677331, -0.4694328, -1.103944, 1, 0.2941177, 0, 1,
-1.670436, -0.5607446, -1.926509, 1, 0.3019608, 0, 1,
-1.658311, 0.2982981, -2.069016, 1, 0.3058824, 0, 1,
-1.64638, 2.431828, 0.1949698, 1, 0.3137255, 0, 1,
-1.638061, -0.4436506, -0.1980877, 1, 0.3176471, 0, 1,
-1.629171, -0.7041449, -3.349496, 1, 0.3254902, 0, 1,
-1.626446, -2.399232, -2.065155, 1, 0.3294118, 0, 1,
-1.615183, 0.1794558, -2.729026, 1, 0.3372549, 0, 1,
-1.614692, -1.204202, -1.202655, 1, 0.3411765, 0, 1,
-1.612974, 0.4595467, -0.4342195, 1, 0.3490196, 0, 1,
-1.591888, 0.2036757, -1.720028, 1, 0.3529412, 0, 1,
-1.587695, -0.7492781, -1.551507, 1, 0.3607843, 0, 1,
-1.57099, -0.8634358, 1.405103, 1, 0.3647059, 0, 1,
-1.569023, -0.007524424, -2.531441, 1, 0.372549, 0, 1,
-1.549868, -0.8819297, -0.7221226, 1, 0.3764706, 0, 1,
-1.549205, 0.4527654, -1.211179, 1, 0.3843137, 0, 1,
-1.532527, 1.943005, -1.452197, 1, 0.3882353, 0, 1,
-1.528136, -0.5929554, -2.243479, 1, 0.3960784, 0, 1,
-1.522125, 1.25505, -3.245595, 1, 0.4039216, 0, 1,
-1.52022, 0.9812979, -0.2766868, 1, 0.4078431, 0, 1,
-1.516655, 0.1141977, -0.4701106, 1, 0.4156863, 0, 1,
-1.503581, -2.399551, -1.230745, 1, 0.4196078, 0, 1,
-1.500247, -0.9872668, -1.42645, 1, 0.427451, 0, 1,
-1.499902, -0.8670242, -1.751191, 1, 0.4313726, 0, 1,
-1.490632, -2.011163, -1.673645, 1, 0.4392157, 0, 1,
-1.480326, 0.9192241, -2.446493, 1, 0.4431373, 0, 1,
-1.461789, 0.8489317, -0.6695467, 1, 0.4509804, 0, 1,
-1.456337, -0.1679462, -1.663053, 1, 0.454902, 0, 1,
-1.452198, -0.9365848, -0.8991331, 1, 0.4627451, 0, 1,
-1.450367, 1.275835, 0.05795283, 1, 0.4666667, 0, 1,
-1.448964, -0.4269421, -1.75637, 1, 0.4745098, 0, 1,
-1.448322, 0.4885889, -0.2244976, 1, 0.4784314, 0, 1,
-1.43872, -1.651568, -3.082244, 1, 0.4862745, 0, 1,
-1.437716, -1.026902, -2.124697, 1, 0.4901961, 0, 1,
-1.434425, 0.4309983, -3.712409, 1, 0.4980392, 0, 1,
-1.43345, -1.204224, -1.561004, 1, 0.5058824, 0, 1,
-1.432321, 0.2168922, -2.390174, 1, 0.509804, 0, 1,
-1.428211, 1.795987, -1.209201, 1, 0.5176471, 0, 1,
-1.419693, -0.8587944, -1.385707, 1, 0.5215687, 0, 1,
-1.417356, 1.539867, -2.871142, 1, 0.5294118, 0, 1,
-1.404421, -1.172198, -1.471558, 1, 0.5333334, 0, 1,
-1.401752, 0.6032028, -1.331368, 1, 0.5411765, 0, 1,
-1.395355, -0.6378673, -2.402677, 1, 0.5450981, 0, 1,
-1.387885, -0.8812302, -1.964651, 1, 0.5529412, 0, 1,
-1.366233, 0.04189106, 1.068116, 1, 0.5568628, 0, 1,
-1.359075, -0.9569874, -1.417254, 1, 0.5647059, 0, 1,
-1.358608, -0.02879273, -0.9704913, 1, 0.5686275, 0, 1,
-1.357227, -0.255032, -2.469729, 1, 0.5764706, 0, 1,
-1.349541, 0.4932524, -1.807697, 1, 0.5803922, 0, 1,
-1.343295, 1.121384, -1.262875, 1, 0.5882353, 0, 1,
-1.329225, 1.41538, -0.1305262, 1, 0.5921569, 0, 1,
-1.303468, 0.2667375, -0.9967107, 1, 0.6, 0, 1,
-1.293817, -0.1696089, -0.9394795, 1, 0.6078432, 0, 1,
-1.293349, -0.4550585, -1.513669, 1, 0.6117647, 0, 1,
-1.280967, 0.4352938, -1.208989, 1, 0.6196079, 0, 1,
-1.276211, 1.502959, -0.9169443, 1, 0.6235294, 0, 1,
-1.273796, 1.035612, -0.1705114, 1, 0.6313726, 0, 1,
-1.261942, -1.726643, -4.286791, 1, 0.6352941, 0, 1,
-1.254238, -2.873932, -5.911369, 1, 0.6431373, 0, 1,
-1.251682, -0.721532, -1.926971, 1, 0.6470588, 0, 1,
-1.248515, -0.3063677, -0.6938294, 1, 0.654902, 0, 1,
-1.235409, -0.6531249, -1.247042, 1, 0.6588235, 0, 1,
-1.233533, 0.4318688, -1.1724, 1, 0.6666667, 0, 1,
-1.219082, -0.9081829, -1.858288, 1, 0.6705883, 0, 1,
-1.214252, 2.045768, -1.027907, 1, 0.6784314, 0, 1,
-1.202615, -0.3981716, -1.993526, 1, 0.682353, 0, 1,
-1.190597, 0.4063472, -0.9759416, 1, 0.6901961, 0, 1,
-1.189866, -0.7268159, -1.170795, 1, 0.6941177, 0, 1,
-1.189399, -0.4219375, -1.270019, 1, 0.7019608, 0, 1,
-1.188753, 0.3300477, -0.7278563, 1, 0.7098039, 0, 1,
-1.187474, -1.004825, -1.897527, 1, 0.7137255, 0, 1,
-1.186829, -0.317974, -2.112558, 1, 0.7215686, 0, 1,
-1.186148, 0.3782996, -1.187206, 1, 0.7254902, 0, 1,
-1.185913, -0.3991564, -3.008509, 1, 0.7333333, 0, 1,
-1.18374, 0.3155118, -3.022074, 1, 0.7372549, 0, 1,
-1.16635, 0.3262695, -1.125628, 1, 0.7450981, 0, 1,
-1.15387, 0.2840439, 0.01449477, 1, 0.7490196, 0, 1,
-1.153688, -0.5954118, 0.2322626, 1, 0.7568628, 0, 1,
-1.15083, -0.2115818, -1.801403, 1, 0.7607843, 0, 1,
-1.148314, 0.9835304, 0.1687604, 1, 0.7686275, 0, 1,
-1.147135, -1.919255, -1.380014, 1, 0.772549, 0, 1,
-1.140169, 0.7213167, -2.749063, 1, 0.7803922, 0, 1,
-1.136011, -1.285292, -2.56593, 1, 0.7843137, 0, 1,
-1.135055, -0.5376088, -1.478228, 1, 0.7921569, 0, 1,
-1.13444, -0.2159099, -0.4892436, 1, 0.7960784, 0, 1,
-1.133255, 0.3352239, -1.282438, 1, 0.8039216, 0, 1,
-1.126814, 0.8127078, -1.449143, 1, 0.8117647, 0, 1,
-1.125455, -0.9528547, -2.372261, 1, 0.8156863, 0, 1,
-1.124874, 1.417305, -1.385509, 1, 0.8235294, 0, 1,
-1.120638, -1.168568, -2.827776, 1, 0.827451, 0, 1,
-1.120041, 0.4540974, -0.8533249, 1, 0.8352941, 0, 1,
-1.11341, -0.740923, -0.9644189, 1, 0.8392157, 0, 1,
-1.110867, -0.9283999, -3.103296, 1, 0.8470588, 0, 1,
-1.110265, -1.046393, -0.3545646, 1, 0.8509804, 0, 1,
-1.106709, 2.390429, -1.889497, 1, 0.8588235, 0, 1,
-1.096731, 1.034263, -2.68386, 1, 0.8627451, 0, 1,
-1.08516, 0.2360809, -1.958834, 1, 0.8705882, 0, 1,
-1.066413, -1.168747, -2.072399, 1, 0.8745098, 0, 1,
-1.065361, 1.041443, -1.502746, 1, 0.8823529, 0, 1,
-1.056164, 1.275403, -0.7326487, 1, 0.8862745, 0, 1,
-1.055092, -0.312622, -1.768062, 1, 0.8941177, 0, 1,
-1.05472, 1.99674, -0.481269, 1, 0.8980392, 0, 1,
-1.054582, -0.6921805, 0.7653869, 1, 0.9058824, 0, 1,
-1.054343, 0.8441288, -0.4815798, 1, 0.9137255, 0, 1,
-1.054275, -0.04803493, -2.578351, 1, 0.9176471, 0, 1,
-1.048883, 1.012853, -2.551209, 1, 0.9254902, 0, 1,
-1.047896, 0.06332945, -3.098142, 1, 0.9294118, 0, 1,
-1.044975, 0.9423937, -1.375457, 1, 0.9372549, 0, 1,
-1.039135, -0.07019597, -2.575602, 1, 0.9411765, 0, 1,
-1.03796, 0.3632945, 0.05658778, 1, 0.9490196, 0, 1,
-1.035537, -1.062039, -2.129035, 1, 0.9529412, 0, 1,
-1.035217, 1.070676, -0.2013635, 1, 0.9607843, 0, 1,
-1.033322, -0.1827149, -1.721732, 1, 0.9647059, 0, 1,
-1.026316, 0.5080383, -0.7145761, 1, 0.972549, 0, 1,
-1.021619, 0.4510335, -1.390342, 1, 0.9764706, 0, 1,
-1.021587, -0.09496874, -2.358176, 1, 0.9843137, 0, 1,
-1.017401, 0.3995221, -0.9218356, 1, 0.9882353, 0, 1,
-1.017268, 0.3601164, 0.7669962, 1, 0.9960784, 0, 1,
-1.017002, -1.865226, -2.535681, 0.9960784, 1, 0, 1,
-1.01655, -2.579198, -4.186199, 0.9921569, 1, 0, 1,
-1.015336, -0.9184995, -3.903049, 0.9843137, 1, 0, 1,
-1.013958, -0.2543184, -2.875683, 0.9803922, 1, 0, 1,
-1.01362, 1.321197, -0.9061916, 0.972549, 1, 0, 1,
-0.9950985, 0.5698882, -1.170113, 0.9686275, 1, 0, 1,
-0.9778939, -0.1179908, -0.8389464, 0.9607843, 1, 0, 1,
-0.9730529, 0.3327077, -3.277769, 0.9568627, 1, 0, 1,
-0.9702193, -1.547175, -3.181852, 0.9490196, 1, 0, 1,
-0.9643915, -0.06861893, -0.9422131, 0.945098, 1, 0, 1,
-0.9553691, 0.6323164, 0.05966199, 0.9372549, 1, 0, 1,
-0.9473174, -0.2919818, -1.357438, 0.9333333, 1, 0, 1,
-0.9470218, -0.9715508, -4.207876, 0.9254902, 1, 0, 1,
-0.9461536, -0.1400883, -0.6975769, 0.9215686, 1, 0, 1,
-0.9450592, -0.2129208, -1.765423, 0.9137255, 1, 0, 1,
-0.9440309, -0.9591017, -1.722063, 0.9098039, 1, 0, 1,
-0.9409277, 0.3885302, -1.969255, 0.9019608, 1, 0, 1,
-0.9191218, 1.035887, -1.752033, 0.8941177, 1, 0, 1,
-0.9169647, 1.016901, -0.04016265, 0.8901961, 1, 0, 1,
-0.9137119, 0.5232961, -0.2352504, 0.8823529, 1, 0, 1,
-0.9126439, 0.4628679, -2.2435, 0.8784314, 1, 0, 1,
-0.9076698, -0.8220276, -3.971228, 0.8705882, 1, 0, 1,
-0.9049804, -0.9069376, -1.342052, 0.8666667, 1, 0, 1,
-0.9023768, 1.358017, -1.592689, 0.8588235, 1, 0, 1,
-0.8967734, -0.6891201, -2.520212, 0.854902, 1, 0, 1,
-0.8820752, -0.3629873, -0.4820182, 0.8470588, 1, 0, 1,
-0.8798715, 0.1493613, -0.7705474, 0.8431373, 1, 0, 1,
-0.8790982, -0.7747375, -1.108887, 0.8352941, 1, 0, 1,
-0.8702098, -1.139922, -2.5589, 0.8313726, 1, 0, 1,
-0.8649552, 1.309664, -1.088443, 0.8235294, 1, 0, 1,
-0.8572221, -0.1523546, -0.2778955, 0.8196079, 1, 0, 1,
-0.8551186, -0.04314227, -2.105646, 0.8117647, 1, 0, 1,
-0.8515301, -1.361106, -1.863854, 0.8078431, 1, 0, 1,
-0.8510368, 0.6393495, -1.538996, 0.8, 1, 0, 1,
-0.8377568, -0.8718919, -1.919895, 0.7921569, 1, 0, 1,
-0.834987, -1.697061, -2.89688, 0.7882353, 1, 0, 1,
-0.8339971, 0.1738954, -0.3959204, 0.7803922, 1, 0, 1,
-0.8312309, 1.998189, -0.5483629, 0.7764706, 1, 0, 1,
-0.8284707, -0.5914962, -1.289663, 0.7686275, 1, 0, 1,
-0.8275447, 1.388009, 0.5563135, 0.7647059, 1, 0, 1,
-0.8222526, 0.5115591, -0.6682019, 0.7568628, 1, 0, 1,
-0.819833, 0.3301381, -1.017042, 0.7529412, 1, 0, 1,
-0.8163895, 0.2446345, -1.029841, 0.7450981, 1, 0, 1,
-0.8123019, -0.4164121, -2.72393, 0.7411765, 1, 0, 1,
-0.8109874, 1.454642, -1.344096, 0.7333333, 1, 0, 1,
-0.8063558, 0.5689184, 0.6232778, 0.7294118, 1, 0, 1,
-0.8034652, -1.385292, -0.7892375, 0.7215686, 1, 0, 1,
-0.8024423, 1.051397, -1.359063, 0.7176471, 1, 0, 1,
-0.8000274, -0.3875599, -1.405254, 0.7098039, 1, 0, 1,
-0.7984272, 0.6567922, 0.08367784, 0.7058824, 1, 0, 1,
-0.7969636, -1.643882, -1.496546, 0.6980392, 1, 0, 1,
-0.7969326, 1.499158, 0.666701, 0.6901961, 1, 0, 1,
-0.7963498, 0.1930176, -2.617474, 0.6862745, 1, 0, 1,
-0.7948562, -0.1017576, -1.105179, 0.6784314, 1, 0, 1,
-0.7883429, 0.4819659, -1.622707, 0.6745098, 1, 0, 1,
-0.7842658, 0.5363528, 0.03672593, 0.6666667, 1, 0, 1,
-0.7838786, 0.4246923, -0.602262, 0.6627451, 1, 0, 1,
-0.7789243, -0.1484239, -3.522557, 0.654902, 1, 0, 1,
-0.7786753, 0.4413334, -0.9213666, 0.6509804, 1, 0, 1,
-0.7774948, 1.133713, -1.67285, 0.6431373, 1, 0, 1,
-0.7765622, 0.8949395, -0.1935949, 0.6392157, 1, 0, 1,
-0.7755736, 0.9175026, -1.157321, 0.6313726, 1, 0, 1,
-0.7742391, 0.8113421, -2.543499, 0.627451, 1, 0, 1,
-0.7717913, 1.226635, -1.220278, 0.6196079, 1, 0, 1,
-0.7695842, -0.4458217, -1.959811, 0.6156863, 1, 0, 1,
-0.7562605, -0.6798386, -2.000623, 0.6078432, 1, 0, 1,
-0.7441047, -0.2397165, -1.761579, 0.6039216, 1, 0, 1,
-0.7423768, -0.1636173, -2.378735, 0.5960785, 1, 0, 1,
-0.7399734, 2.991549, -1.633425, 0.5882353, 1, 0, 1,
-0.7394429, -0.4859665, -2.301622, 0.5843138, 1, 0, 1,
-0.7327179, -2.500882, -3.503918, 0.5764706, 1, 0, 1,
-0.7295629, -0.07291623, -1.427918, 0.572549, 1, 0, 1,
-0.7195834, -0.4024521, -5.940302, 0.5647059, 1, 0, 1,
-0.7180856, -1.289769, -2.721927, 0.5607843, 1, 0, 1,
-0.7169438, 0.1661832, -1.149697, 0.5529412, 1, 0, 1,
-0.7155719, 1.108227, -0.008245607, 0.5490196, 1, 0, 1,
-0.7142011, 0.7762638, -1.837697, 0.5411765, 1, 0, 1,
-0.7055749, -0.5960056, -1.311274, 0.5372549, 1, 0, 1,
-0.7052755, 1.010657, 0.4656753, 0.5294118, 1, 0, 1,
-0.7006071, -1.448631, -2.086, 0.5254902, 1, 0, 1,
-0.7003927, 0.4591516, -0.5824333, 0.5176471, 1, 0, 1,
-0.6986086, 0.3580788, -0.2064753, 0.5137255, 1, 0, 1,
-0.6971602, -0.3947306, -2.109847, 0.5058824, 1, 0, 1,
-0.6880068, 0.9752137, -2.081421, 0.5019608, 1, 0, 1,
-0.678398, 2.084634, -0.1528519, 0.4941176, 1, 0, 1,
-0.6780856, -0.38329, -1.661208, 0.4862745, 1, 0, 1,
-0.6763728, -0.6304405, -3.074452, 0.4823529, 1, 0, 1,
-0.6671243, -3.042438, -3.603751, 0.4745098, 1, 0, 1,
-0.6633198, 1.826298, -1.500335, 0.4705882, 1, 0, 1,
-0.6614326, -1.094055, -3.51197, 0.4627451, 1, 0, 1,
-0.6599004, 1.123538, 0.2988525, 0.4588235, 1, 0, 1,
-0.6582669, 1.926517, -0.9561729, 0.4509804, 1, 0, 1,
-0.6575267, 2.34504, -0.2373184, 0.4470588, 1, 0, 1,
-0.6529987, 0.4248748, -1.680043, 0.4392157, 1, 0, 1,
-0.6512595, 1.166228, 0.2045714, 0.4352941, 1, 0, 1,
-0.6493968, 0.7120094, 0.4054685, 0.427451, 1, 0, 1,
-0.648628, 0.2090889, -0.9217759, 0.4235294, 1, 0, 1,
-0.6467954, -0.4216464, -0.3331335, 0.4156863, 1, 0, 1,
-0.6391836, 0.4756464, -0.7002332, 0.4117647, 1, 0, 1,
-0.6286891, 0.4580553, -1.825514, 0.4039216, 1, 0, 1,
-0.6285439, -0.1392389, 0.3080752, 0.3960784, 1, 0, 1,
-0.6269609, 1.581834, -0.7995273, 0.3921569, 1, 0, 1,
-0.6212922, -0.8199389, -2.34862, 0.3843137, 1, 0, 1,
-0.6127464, 1.351495, -0.8694468, 0.3803922, 1, 0, 1,
-0.6103662, 0.1510114, -0.7701911, 0.372549, 1, 0, 1,
-0.6062959, 0.347772, -0.9093634, 0.3686275, 1, 0, 1,
-0.6017947, -0.08387052, -0.9756461, 0.3607843, 1, 0, 1,
-0.6000565, 0.8717183, -0.910742, 0.3568628, 1, 0, 1,
-0.5949048, -0.06919207, -1.763084, 0.3490196, 1, 0, 1,
-0.5938579, 1.615167, 1.19312, 0.345098, 1, 0, 1,
-0.5925683, -1.194289, -3.785148, 0.3372549, 1, 0, 1,
-0.5907161, 0.9518119, -2.635588, 0.3333333, 1, 0, 1,
-0.5819721, 0.5817269, -0.521145, 0.3254902, 1, 0, 1,
-0.5779431, -0.7959027, -2.629797, 0.3215686, 1, 0, 1,
-0.5769014, -1.752637, -3.829839, 0.3137255, 1, 0, 1,
-0.5757213, 1.004988, -1.920543, 0.3098039, 1, 0, 1,
-0.5732009, -1.093133, -2.079437, 0.3019608, 1, 0, 1,
-0.5645617, -0.01336596, -1.278093, 0.2941177, 1, 0, 1,
-0.5619871, 0.9608204, -0.9133759, 0.2901961, 1, 0, 1,
-0.5592489, 0.2635346, -0.5102277, 0.282353, 1, 0, 1,
-0.5581775, -1.608975, -1.386143, 0.2784314, 1, 0, 1,
-0.5575498, 0.07899245, -0.3221688, 0.2705882, 1, 0, 1,
-0.5523449, 0.08687933, -0.6877014, 0.2666667, 1, 0, 1,
-0.5495634, 0.6527959, 1.381413, 0.2588235, 1, 0, 1,
-0.5492655, 0.03087843, -0.5758926, 0.254902, 1, 0, 1,
-0.5475478, 0.9109852, -2.055715, 0.2470588, 1, 0, 1,
-0.5420571, -0.02376921, -2.737355, 0.2431373, 1, 0, 1,
-0.5416113, 1.548029, -2.429835, 0.2352941, 1, 0, 1,
-0.5371809, 1.105707, -2.033508, 0.2313726, 1, 0, 1,
-0.5339644, 0.5398847, -2.385966, 0.2235294, 1, 0, 1,
-0.5271585, -0.8561461, -2.227931, 0.2196078, 1, 0, 1,
-0.5270232, -0.01655742, -1.683257, 0.2117647, 1, 0, 1,
-0.5183243, -1.17185, -1.376401, 0.2078431, 1, 0, 1,
-0.5176426, 0.4496808, -1.176343, 0.2, 1, 0, 1,
-0.5170048, -1.124711, -2.442513, 0.1921569, 1, 0, 1,
-0.5110095, 0.1550434, -0.4107829, 0.1882353, 1, 0, 1,
-0.5097596, 0.1674847, -1.347691, 0.1803922, 1, 0, 1,
-0.5079843, 0.3748481, 1.334497, 0.1764706, 1, 0, 1,
-0.5073378, 0.1208941, -1.435103, 0.1686275, 1, 0, 1,
-0.5055287, -0.373925, -2.102072, 0.1647059, 1, 0, 1,
-0.5036693, 1.620906, 0.06483008, 0.1568628, 1, 0, 1,
-0.5007246, -0.05431186, -1.51505, 0.1529412, 1, 0, 1,
-0.4991612, -0.8605549, -2.791413, 0.145098, 1, 0, 1,
-0.4951297, 0.650543, -1.663455, 0.1411765, 1, 0, 1,
-0.4893417, 0.533877, -0.1017731, 0.1333333, 1, 0, 1,
-0.4880154, 0.163269, -1.681123, 0.1294118, 1, 0, 1,
-0.4872719, 0.8265563, -1.857017, 0.1215686, 1, 0, 1,
-0.480077, 0.5421346, -0.444509, 0.1176471, 1, 0, 1,
-0.4795529, -0.3662906, -2.840853, 0.1098039, 1, 0, 1,
-0.473501, 0.2061132, 0.02910703, 0.1058824, 1, 0, 1,
-0.4697196, -1.790347, -2.298703, 0.09803922, 1, 0, 1,
-0.4696993, -1.631848, -1.770649, 0.09019608, 1, 0, 1,
-0.4657006, 1.627035, 0.7184348, 0.08627451, 1, 0, 1,
-0.4584286, 1.292953, -1.654816, 0.07843138, 1, 0, 1,
-0.45124, 0.6239482, -0.2045383, 0.07450981, 1, 0, 1,
-0.4497412, -0.06182076, -2.724343, 0.06666667, 1, 0, 1,
-0.4456171, -1.188061, -0.3353621, 0.0627451, 1, 0, 1,
-0.4441334, -0.002401949, -1.764701, 0.05490196, 1, 0, 1,
-0.4435781, 1.008631, 0.1138235, 0.05098039, 1, 0, 1,
-0.4408877, -0.2233096, -1.206134, 0.04313726, 1, 0, 1,
-0.4374685, -1.497762, -0.7908463, 0.03921569, 1, 0, 1,
-0.4341874, 0.3173638, -1.301545, 0.03137255, 1, 0, 1,
-0.4275932, -0.799385, -0.6479831, 0.02745098, 1, 0, 1,
-0.4220145, -0.2937161, -2.361161, 0.01960784, 1, 0, 1,
-0.4211368, 2.258246, -2.094031, 0.01568628, 1, 0, 1,
-0.417466, -2.520325, -3.327842, 0.007843138, 1, 0, 1,
-0.4153088, 1.193599, -0.3995477, 0.003921569, 1, 0, 1,
-0.4152524, 0.4646102, -0.6834565, 0, 1, 0.003921569, 1,
-0.4132756, -0.3065555, -3.636932, 0, 1, 0.01176471, 1,
-0.4127089, 1.155999, -1.087614, 0, 1, 0.01568628, 1,
-0.4124119, 2.200138, -0.1587807, 0, 1, 0.02352941, 1,
-0.4104921, 0.1606953, -1.428726, 0, 1, 0.02745098, 1,
-0.4085403, -0.1890174, -1.063388, 0, 1, 0.03529412, 1,
-0.4041236, 0.03555173, -1.551457, 0, 1, 0.03921569, 1,
-0.399244, -1.090656, -4.638277, 0, 1, 0.04705882, 1,
-0.3989471, -1.268587, -1.007834, 0, 1, 0.05098039, 1,
-0.3979653, 1.73722, -0.4261591, 0, 1, 0.05882353, 1,
-0.3975223, 0.4565238, -1.43645, 0, 1, 0.0627451, 1,
-0.3970291, -0.206189, -0.7795674, 0, 1, 0.07058824, 1,
-0.3953885, -0.05717346, -2.440096, 0, 1, 0.07450981, 1,
-0.3941285, -0.471444, -2.316385, 0, 1, 0.08235294, 1,
-0.3913904, -0.1648061, -4.744797, 0, 1, 0.08627451, 1,
-0.3871008, -0.5675061, -0.8663908, 0, 1, 0.09411765, 1,
-0.3856605, 0.249632, -0.1359511, 0, 1, 0.1019608, 1,
-0.3855081, 2.012433, -1.049532, 0, 1, 0.1058824, 1,
-0.3818633, -0.6426176, -2.770859, 0, 1, 0.1137255, 1,
-0.3810467, -0.908932, -1.180728, 0, 1, 0.1176471, 1,
-0.3807057, -0.4895941, -2.187734, 0, 1, 0.1254902, 1,
-0.3723155, -1.292224, -2.040525, 0, 1, 0.1294118, 1,
-0.3671697, 1.404075, 0.467618, 0, 1, 0.1372549, 1,
-0.3663726, 0.3560376, 0.05133102, 0, 1, 0.1411765, 1,
-0.3620752, 0.6399544, -1.325621, 0, 1, 0.1490196, 1,
-0.3577501, -0.6334907, -2.644037, 0, 1, 0.1529412, 1,
-0.3552029, -0.9237099, -2.749282, 0, 1, 0.1607843, 1,
-0.3535813, 0.09909542, -0.3722629, 0, 1, 0.1647059, 1,
-0.3512216, -1.680894, -3.313408, 0, 1, 0.172549, 1,
-0.3511326, 0.229098, 1.48881, 0, 1, 0.1764706, 1,
-0.3507122, 1.750145, 1.558785, 0, 1, 0.1843137, 1,
-0.3497117, -0.2472956, -0.5346805, 0, 1, 0.1882353, 1,
-0.3474288, -0.8372668, -2.829346, 0, 1, 0.1960784, 1,
-0.3404833, -1.710205, -2.770447, 0, 1, 0.2039216, 1,
-0.3345367, -0.671169, -3.66487, 0, 1, 0.2078431, 1,
-0.3319601, 0.04964645, -1.785241, 0, 1, 0.2156863, 1,
-0.3286148, -1.241168, -2.696579, 0, 1, 0.2196078, 1,
-0.327443, -1.08939, -2.732005, 0, 1, 0.227451, 1,
-0.3207994, 0.6256673, -0.9243119, 0, 1, 0.2313726, 1,
-0.3191897, 0.1871895, -1.400463, 0, 1, 0.2392157, 1,
-0.317704, -0.3801772, -3.410972, 0, 1, 0.2431373, 1,
-0.3126389, 0.9018479, 1.225196, 0, 1, 0.2509804, 1,
-0.3057136, 0.3939933, -0.7651684, 0, 1, 0.254902, 1,
-0.2992119, 0.9445457, -0.1427668, 0, 1, 0.2627451, 1,
-0.2979104, 1.437248, -0.815034, 0, 1, 0.2666667, 1,
-0.2924196, -2.384513, -3.150226, 0, 1, 0.2745098, 1,
-0.2890666, 0.3009569, -0.8888582, 0, 1, 0.2784314, 1,
-0.2871332, 0.9469971, -1.1681, 0, 1, 0.2862745, 1,
-0.2865354, 0.3694877, 0.8428746, 0, 1, 0.2901961, 1,
-0.2855547, 0.2676354, -1.908158, 0, 1, 0.2980392, 1,
-0.2809909, -0.1449204, 0.4930663, 0, 1, 0.3058824, 1,
-0.2748987, 1.543856, -0.655226, 0, 1, 0.3098039, 1,
-0.2719214, -0.4385736, -0.1412818, 0, 1, 0.3176471, 1,
-0.2716563, -0.0676167, -1.587576, 0, 1, 0.3215686, 1,
-0.2679545, -3.455048, -3.416273, 0, 1, 0.3294118, 1,
-0.2670323, -0.9895886, -3.937289, 0, 1, 0.3333333, 1,
-0.2663257, -0.6264492, -3.590187, 0, 1, 0.3411765, 1,
-0.2637921, 0.01229778, -2.382281, 0, 1, 0.345098, 1,
-0.2630333, -0.2039583, -2.010389, 0, 1, 0.3529412, 1,
-0.2569309, 2.510041, -1.33516, 0, 1, 0.3568628, 1,
-0.2568356, 0.1923549, -2.493931, 0, 1, 0.3647059, 1,
-0.2543832, -0.6610973, -2.450646, 0, 1, 0.3686275, 1,
-0.2449556, 0.4017139, 0.7617059, 0, 1, 0.3764706, 1,
-0.2437477, -1.166837, -3.210894, 0, 1, 0.3803922, 1,
-0.2381539, -1.342562, -2.029041, 0, 1, 0.3882353, 1,
-0.2371382, -0.4820222, -3.568297, 0, 1, 0.3921569, 1,
-0.2369933, 0.6964597, -0.2329579, 0, 1, 0.4, 1,
-0.2337112, 2.347159, -0.4039307, 0, 1, 0.4078431, 1,
-0.2315517, 0.6250699, -0.4154377, 0, 1, 0.4117647, 1,
-0.2290975, -0.316749, -3.597543, 0, 1, 0.4196078, 1,
-0.2272961, 2.62717, 2.662539, 0, 1, 0.4235294, 1,
-0.2262915, 1.023921, -1.249211, 0, 1, 0.4313726, 1,
-0.2232287, 1.605063, -0.4380355, 0, 1, 0.4352941, 1,
-0.2158749, 0.4078696, -0.2590346, 0, 1, 0.4431373, 1,
-0.2097683, -0.5380818, -3.057752, 0, 1, 0.4470588, 1,
-0.2076686, 0.3035391, -0.4866134, 0, 1, 0.454902, 1,
-0.2037797, 0.4378814, -0.5489265, 0, 1, 0.4588235, 1,
-0.2015821, -1.686502, -3.406833, 0, 1, 0.4666667, 1,
-0.2007263, -1.953445, -3.681057, 0, 1, 0.4705882, 1,
-0.2002948, -0.6186426, -3.646859, 0, 1, 0.4784314, 1,
-0.1998423, 1.362374, 0.0771446, 0, 1, 0.4823529, 1,
-0.1974885, -0.06274763, -3.253263, 0, 1, 0.4901961, 1,
-0.1970708, 1.44861, 1.136717, 0, 1, 0.4941176, 1,
-0.195259, 0.1363326, -1.261114, 0, 1, 0.5019608, 1,
-0.1949986, -2.208664, -3.707744, 0, 1, 0.509804, 1,
-0.1945428, 0.2674193, -1.279674, 0, 1, 0.5137255, 1,
-0.1933229, -1.240191, -3.827888, 0, 1, 0.5215687, 1,
-0.1825106, -0.1806504, -1.215493, 0, 1, 0.5254902, 1,
-0.1813642, -0.08367682, -2.258985, 0, 1, 0.5333334, 1,
-0.1782507, 0.4603037, -1.416339, 0, 1, 0.5372549, 1,
-0.1747113, -0.7017232, -2.735458, 0, 1, 0.5450981, 1,
-0.1714336, 1.582403, -1.233432, 0, 1, 0.5490196, 1,
-0.1694702, 0.4276308, -0.7377895, 0, 1, 0.5568628, 1,
-0.1687219, 1.922013, -1.745453, 0, 1, 0.5607843, 1,
-0.1666967, 2.550959, -0.6317258, 0, 1, 0.5686275, 1,
-0.1657425, 0.9136521, 0.8029694, 0, 1, 0.572549, 1,
-0.1641394, -0.7741364, -2.88473, 0, 1, 0.5803922, 1,
-0.1616412, -1.329196, -1.561082, 0, 1, 0.5843138, 1,
-0.159243, 0.5752785, -0.382753, 0, 1, 0.5921569, 1,
-0.1552407, 1.831688, -0.5379159, 0, 1, 0.5960785, 1,
-0.1489868, -0.02590157, -2.061121, 0, 1, 0.6039216, 1,
-0.147238, -0.4682723, -3.095405, 0, 1, 0.6117647, 1,
-0.1453975, 0.8028427, -1.576826, 0, 1, 0.6156863, 1,
-0.1445676, -0.4736975, -4.671166, 0, 1, 0.6235294, 1,
-0.1440824, -0.6700069, -3.007488, 0, 1, 0.627451, 1,
-0.1437206, -0.3043959, -3.1315, 0, 1, 0.6352941, 1,
-0.1420685, 0.02026252, -1.452177, 0, 1, 0.6392157, 1,
-0.141542, -0.6522634, -2.411785, 0, 1, 0.6470588, 1,
-0.1405116, 0.5913399, -1.43725, 0, 1, 0.6509804, 1,
-0.138148, -0.3058232, -0.6842234, 0, 1, 0.6588235, 1,
-0.1378554, -0.05343384, -1.766504, 0, 1, 0.6627451, 1,
-0.1303857, -1.445935, -5.744504, 0, 1, 0.6705883, 1,
-0.1282248, -0.05047239, -1.364402, 0, 1, 0.6745098, 1,
-0.1255908, 0.2637299, -2.790139, 0, 1, 0.682353, 1,
-0.1251543, -0.6726921, -3.771127, 0, 1, 0.6862745, 1,
-0.1220102, 1.185871, -0.1156186, 0, 1, 0.6941177, 1,
-0.1198284, 1.117012, -0.668414, 0, 1, 0.7019608, 1,
-0.1195978, 0.5316603, -0.8287857, 0, 1, 0.7058824, 1,
-0.1194363, 0.1597695, 0.7748042, 0, 1, 0.7137255, 1,
-0.1180603, 0.1238602, 1.110511, 0, 1, 0.7176471, 1,
-0.115999, -0.3234294, -2.995404, 0, 1, 0.7254902, 1,
-0.1132009, -0.860376, -2.073212, 0, 1, 0.7294118, 1,
-0.111871, -0.3084428, -2.363343, 0, 1, 0.7372549, 1,
-0.1090506, -0.6093454, -3.482059, 0, 1, 0.7411765, 1,
-0.1060629, -0.03799852, -3.264134, 0, 1, 0.7490196, 1,
-0.1026146, 0.312837, -1.909842, 0, 1, 0.7529412, 1,
-0.1008795, -1.187584, -4.432309, 0, 1, 0.7607843, 1,
-0.09774847, 1.148114, -0.155958, 0, 1, 0.7647059, 1,
-0.09456835, 1.07808, 1.015661, 0, 1, 0.772549, 1,
-0.09339167, 0.467931, 2.232172, 0, 1, 0.7764706, 1,
-0.09248087, 0.0605036, 0.9418711, 0, 1, 0.7843137, 1,
-0.09176716, 0.8248678, 0.2474613, 0, 1, 0.7882353, 1,
-0.09079595, 0.1514578, -0.4697025, 0, 1, 0.7960784, 1,
-0.0894086, -0.5999891, -3.767263, 0, 1, 0.8039216, 1,
-0.08832926, -1.070791, -4.11867, 0, 1, 0.8078431, 1,
-0.08670559, -0.8277727, -3.292333, 0, 1, 0.8156863, 1,
-0.08341178, -0.01011949, -1.877069, 0, 1, 0.8196079, 1,
-0.08220418, 0.1029849, -0.276286, 0, 1, 0.827451, 1,
-0.08012466, 1.258819, -0.6206148, 0, 1, 0.8313726, 1,
-0.07828113, 1.038582, -0.4962507, 0, 1, 0.8392157, 1,
-0.07724417, 1.375668, -0.5391733, 0, 1, 0.8431373, 1,
-0.07521874, -0.084228, -3.671783, 0, 1, 0.8509804, 1,
-0.0738617, -2.043873, -2.150907, 0, 1, 0.854902, 1,
-0.07103811, 0.5169079, -1.372184, 0, 1, 0.8627451, 1,
-0.06969032, -0.9092358, -0.6589858, 0, 1, 0.8666667, 1,
-0.06752823, -0.1373515, -1.691501, 0, 1, 0.8745098, 1,
-0.06577598, 0.4959415, -1.24131, 0, 1, 0.8784314, 1,
-0.06327637, 0.6761032, -0.7706432, 0, 1, 0.8862745, 1,
-0.06306331, 1.300729, 0.4066334, 0, 1, 0.8901961, 1,
-0.05968661, 1.399048, 2.008055, 0, 1, 0.8980392, 1,
-0.05843827, 0.6603165, 1.16005, 0, 1, 0.9058824, 1,
-0.05644175, 2.504219, 0.06240319, 0, 1, 0.9098039, 1,
-0.05245413, 0.2076984, 0.3499657, 0, 1, 0.9176471, 1,
-0.04479241, -0.08006937, -0.2683213, 0, 1, 0.9215686, 1,
-0.04451538, -0.7417859, -3.300062, 0, 1, 0.9294118, 1,
-0.04261313, 2.19439, -0.563318, 0, 1, 0.9333333, 1,
-0.04007327, 1.006587, -1.685917, 0, 1, 0.9411765, 1,
-0.03719612, 0.5474659, -1.36509, 0, 1, 0.945098, 1,
-0.03502863, 1.300554, -1.95366, 0, 1, 0.9529412, 1,
-0.03395675, -0.3369347, -3.102421, 0, 1, 0.9568627, 1,
-0.03315156, -0.3548305, -2.313354, 0, 1, 0.9647059, 1,
-0.03146752, -0.2535143, -3.628068, 0, 1, 0.9686275, 1,
-0.03063194, 0.1223992, 0.8407229, 0, 1, 0.9764706, 1,
-0.02954703, 1.745542, -0.5371383, 0, 1, 0.9803922, 1,
-0.02557256, 1.90606, 0.3701918, 0, 1, 0.9882353, 1,
-0.02538241, -1.426374, -2.515224, 0, 1, 0.9921569, 1,
-0.02019288, -1.376889, -1.983358, 0, 1, 1, 1,
-0.01932459, 1.320422, 1.275658, 0, 0.9921569, 1, 1,
-0.01931155, 0.802147, -1.077743, 0, 0.9882353, 1, 1,
-0.01385191, -1.21371, -3.720271, 0, 0.9803922, 1, 1,
-0.009387466, -1.013453, -2.274325, 0, 0.9764706, 1, 1,
-0.009085972, 0.1347494, 1.367162, 0, 0.9686275, 1, 1,
-0.003234967, -0.5677174, -5.004645, 0, 0.9647059, 1, 1,
-0.002318613, 1.642012, -1.209773, 0, 0.9568627, 1, 1,
-0.002035946, -0.08939245, -3.5036, 0, 0.9529412, 1, 1,
-0.001914808, -0.2125697, -3.417539, 0, 0.945098, 1, 1,
0.0007276776, -0.6918898, 3.530375, 0, 0.9411765, 1, 1,
0.006580226, -2.320426, 4.39228, 0, 0.9333333, 1, 1,
0.01061175, -1.406236, 2.417718, 0, 0.9294118, 1, 1,
0.01610103, 0.5062437, -2.726198, 0, 0.9215686, 1, 1,
0.02199253, -0.3087028, 2.79528, 0, 0.9176471, 1, 1,
0.02297889, -0.3323703, 2.630077, 0, 0.9098039, 1, 1,
0.03099128, 1.08598, 1.299587, 0, 0.9058824, 1, 1,
0.0335376, -0.3377247, 3.990156, 0, 0.8980392, 1, 1,
0.03403629, -1.157945, 1.631847, 0, 0.8901961, 1, 1,
0.03472012, -0.7230572, 4.126564, 0, 0.8862745, 1, 1,
0.04368798, -1.061268, 1.480634, 0, 0.8784314, 1, 1,
0.04827986, 0.2998194, -0.00781645, 0, 0.8745098, 1, 1,
0.04935582, -1.167539, 2.126476, 0, 0.8666667, 1, 1,
0.04980687, -0.1121982, 2.752761, 0, 0.8627451, 1, 1,
0.05031009, -1.182621, 4.426984, 0, 0.854902, 1, 1,
0.05216606, -0.7326189, 4.70286, 0, 0.8509804, 1, 1,
0.05746694, -0.4244078, 4.184458, 0, 0.8431373, 1, 1,
0.06018909, 1.694984, 0.8099899, 0, 0.8392157, 1, 1,
0.0668468, 0.9178759, -0.07296764, 0, 0.8313726, 1, 1,
0.06908114, -1.502151, 3.384, 0, 0.827451, 1, 1,
0.06918612, -0.1056927, 3.107246, 0, 0.8196079, 1, 1,
0.06992748, -0.1861403, 3.301997, 0, 0.8156863, 1, 1,
0.07314011, -0.1870722, 2.103507, 0, 0.8078431, 1, 1,
0.07314477, -1.069928, 3.65995, 0, 0.8039216, 1, 1,
0.0742932, -0.7418154, 2.595447, 0, 0.7960784, 1, 1,
0.07791378, -0.7823921, 2.905853, 0, 0.7882353, 1, 1,
0.07936092, 0.5929968, 1.054815, 0, 0.7843137, 1, 1,
0.08358437, -0.7927903, 3.356267, 0, 0.7764706, 1, 1,
0.08454588, 0.9784176, -0.8776795, 0, 0.772549, 1, 1,
0.0880276, -0.3004239, 1.918758, 0, 0.7647059, 1, 1,
0.08869281, -0.7117155, 3.145676, 0, 0.7607843, 1, 1,
0.089396, 1.325559, 0.125732, 0, 0.7529412, 1, 1,
0.08999413, 0.3392304, -0.5916681, 0, 0.7490196, 1, 1,
0.09459993, 0.7987294, -1.745129, 0, 0.7411765, 1, 1,
0.09489189, 0.7427416, 0.3960472, 0, 0.7372549, 1, 1,
0.100012, 0.4770356, -0.04241159, 0, 0.7294118, 1, 1,
0.1024395, -0.7022993, 4.061332, 0, 0.7254902, 1, 1,
0.1026051, -0.3657214, 4.706537, 0, 0.7176471, 1, 1,
0.1057657, 0.0919024, 2.23931, 0, 0.7137255, 1, 1,
0.1086496, 0.04678019, 1.612164, 0, 0.7058824, 1, 1,
0.1102452, -0.8799267, 2.133668, 0, 0.6980392, 1, 1,
0.1132544, 0.6286888, -0.8533156, 0, 0.6941177, 1, 1,
0.1189963, -0.9438555, 3.721854, 0, 0.6862745, 1, 1,
0.1193082, 0.05349924, 1.786425, 0, 0.682353, 1, 1,
0.121106, 1.873051, 0.4975968, 0, 0.6745098, 1, 1,
0.1223955, -1.718772, 3.883067, 0, 0.6705883, 1, 1,
0.1246344, 0.4017337, 0.8476804, 0, 0.6627451, 1, 1,
0.1279887, 0.7654642, -0.1600382, 0, 0.6588235, 1, 1,
0.1320894, -0.045207, 0.8440773, 0, 0.6509804, 1, 1,
0.1321715, 0.9403133, -0.7753238, 0, 0.6470588, 1, 1,
0.1321852, -0.02370034, 2.203149, 0, 0.6392157, 1, 1,
0.1332257, -1.468635, 1.950998, 0, 0.6352941, 1, 1,
0.1367347, -0.3776895, 3.575264, 0, 0.627451, 1, 1,
0.1397246, -0.2116544, 3.388422, 0, 0.6235294, 1, 1,
0.1406531, 1.103893, -1.059474, 0, 0.6156863, 1, 1,
0.1414687, 1.179518, 1.283883, 0, 0.6117647, 1, 1,
0.1459642, -0.4497065, 2.494476, 0, 0.6039216, 1, 1,
0.148482, 0.6674538, -0.007777261, 0, 0.5960785, 1, 1,
0.1500636, 2.259799, 1.021667, 0, 0.5921569, 1, 1,
0.1512882, -0.3630259, 2.249388, 0, 0.5843138, 1, 1,
0.1536584, -1.129969, 4.338231, 0, 0.5803922, 1, 1,
0.1556454, -1.779765, 3.51833, 0, 0.572549, 1, 1,
0.1589964, 0.09123989, 0.2002726, 0, 0.5686275, 1, 1,
0.166147, 0.9312161, 1.042147, 0, 0.5607843, 1, 1,
0.1725675, 1.619937, -0.3672936, 0, 0.5568628, 1, 1,
0.1746392, -0.7318767, 4.790263, 0, 0.5490196, 1, 1,
0.1796873, 0.2953716, 1.072105, 0, 0.5450981, 1, 1,
0.1900053, -1.25982, 1.430976, 0, 0.5372549, 1, 1,
0.194094, -0.6863853, 2.865351, 0, 0.5333334, 1, 1,
0.1959356, -0.01105652, 1.425481, 0, 0.5254902, 1, 1,
0.1962619, 0.9717376, -0.8435439, 0, 0.5215687, 1, 1,
0.1970796, 0.3828436, 0.4758363, 0, 0.5137255, 1, 1,
0.1988821, 0.552269, 0.9109327, 0, 0.509804, 1, 1,
0.2035737, 0.08055346, 1.537499, 0, 0.5019608, 1, 1,
0.2061283, -0.2426194, 1.518987, 0, 0.4941176, 1, 1,
0.2065329, 0.4876007, -1.886058, 0, 0.4901961, 1, 1,
0.2092274, 1.06086, 0.6358094, 0, 0.4823529, 1, 1,
0.2102508, -0.6220879, 1.490344, 0, 0.4784314, 1, 1,
0.2169887, 1.027961, 0.5986404, 0, 0.4705882, 1, 1,
0.2190713, 0.9580982, -1.553447, 0, 0.4666667, 1, 1,
0.2207477, 1.321143, 0.7733414, 0, 0.4588235, 1, 1,
0.2225227, 0.3033423, 0.5674056, 0, 0.454902, 1, 1,
0.2227444, 0.7777066, 0.7785556, 0, 0.4470588, 1, 1,
0.2230812, -1.032177, 4.149363, 0, 0.4431373, 1, 1,
0.2248687, -0.3367025, 2.48758, 0, 0.4352941, 1, 1,
0.2252496, -0.1647685, 3.121961, 0, 0.4313726, 1, 1,
0.2253707, 0.4394207, -0.1924038, 0, 0.4235294, 1, 1,
0.2256173, -0.7184906, 3.386131, 0, 0.4196078, 1, 1,
0.2275964, 0.1865136, 0.07909656, 0, 0.4117647, 1, 1,
0.2277979, -0.551872, 2.858667, 0, 0.4078431, 1, 1,
0.2317717, 1.558726, 0.4599744, 0, 0.4, 1, 1,
0.2374887, -0.8759031, 2.491246, 0, 0.3921569, 1, 1,
0.2393582, -0.8089676, -0.8515945, 0, 0.3882353, 1, 1,
0.2404938, -0.5199728, 1.70514, 0, 0.3803922, 1, 1,
0.242905, 0.232191, 0.8638101, 0, 0.3764706, 1, 1,
0.2465854, 0.1142422, 0.8697699, 0, 0.3686275, 1, 1,
0.2476364, 1.029209, -0.9491461, 0, 0.3647059, 1, 1,
0.2493939, -0.8665568, 3.173251, 0, 0.3568628, 1, 1,
0.2502989, 1.527032, 1.856875, 0, 0.3529412, 1, 1,
0.2637164, -2.481855, 2.658465, 0, 0.345098, 1, 1,
0.2639575, 0.1544207, -0.8608798, 0, 0.3411765, 1, 1,
0.2649818, -0.6075536, 2.442779, 0, 0.3333333, 1, 1,
0.2666284, -0.2882187, 2.965019, 0, 0.3294118, 1, 1,
0.2747629, -0.03654013, 1.174671, 0, 0.3215686, 1, 1,
0.2750024, -0.06766144, 2.07329, 0, 0.3176471, 1, 1,
0.2767259, -0.3744077, 2.493427, 0, 0.3098039, 1, 1,
0.2772254, -1.123746, 2.395866, 0, 0.3058824, 1, 1,
0.277833, 1.376136, 1.619501, 0, 0.2980392, 1, 1,
0.2789109, 0.8773478, -0.1106234, 0, 0.2901961, 1, 1,
0.2791797, -1.214341, 4.687353, 0, 0.2862745, 1, 1,
0.279685, -1.146499, 4.146239, 0, 0.2784314, 1, 1,
0.2808101, 0.4835803, 0.746984, 0, 0.2745098, 1, 1,
0.2818923, 0.1213777, 0.3245288, 0, 0.2666667, 1, 1,
0.2836493, 0.303322, -0.1502313, 0, 0.2627451, 1, 1,
0.2879322, -1.064535, 3.490227, 0, 0.254902, 1, 1,
0.2963188, 1.606692, -0.6624553, 0, 0.2509804, 1, 1,
0.2987601, -0.07601604, 1.887476, 0, 0.2431373, 1, 1,
0.3043454, -1.300382, 4.175251, 0, 0.2392157, 1, 1,
0.3047324, -0.4742779, 3.907398, 0, 0.2313726, 1, 1,
0.3067808, -0.6460331, 0.5484573, 0, 0.227451, 1, 1,
0.3068244, 0.1590553, 0.1587323, 0, 0.2196078, 1, 1,
0.3111112, 1.236242, -1.854943, 0, 0.2156863, 1, 1,
0.3143525, 0.7341961, 1.583472, 0, 0.2078431, 1, 1,
0.3158011, 0.1240712, -0.06059007, 0, 0.2039216, 1, 1,
0.3201486, -1.445673, 2.623658, 0, 0.1960784, 1, 1,
0.3241043, 0.5690529, 0.912901, 0, 0.1882353, 1, 1,
0.3241214, 0.07104798, 0.7185558, 0, 0.1843137, 1, 1,
0.3284022, -0.2318535, 1.201986, 0, 0.1764706, 1, 1,
0.3345198, -0.9112265, 1.987908, 0, 0.172549, 1, 1,
0.3367882, -2.196631, 3.969428, 0, 0.1647059, 1, 1,
0.3371593, -0.06996366, 0.8879365, 0, 0.1607843, 1, 1,
0.3373651, -0.1779716, 2.930571, 0, 0.1529412, 1, 1,
0.341661, -1.722564, 4.365927, 0, 0.1490196, 1, 1,
0.3425833, -1.378754, 1.952544, 0, 0.1411765, 1, 1,
0.3465886, -0.8839219, 3.89101, 0, 0.1372549, 1, 1,
0.3484881, -0.4627777, 1.654987, 0, 0.1294118, 1, 1,
0.3536813, -0.450653, 2.792045, 0, 0.1254902, 1, 1,
0.3549324, -0.4637325, 1.337677, 0, 0.1176471, 1, 1,
0.3557436, -0.2159565, 2.177796, 0, 0.1137255, 1, 1,
0.3561006, -1.068663, 3.557435, 0, 0.1058824, 1, 1,
0.3562464, 0.3209428, 1.389668, 0, 0.09803922, 1, 1,
0.3574055, 1.06741, -0.3089601, 0, 0.09411765, 1, 1,
0.3606334, 1.269738, 0.2451181, 0, 0.08627451, 1, 1,
0.3622523, 0.8982468, -0.5586134, 0, 0.08235294, 1, 1,
0.3669098, -1.473634, 2.052633, 0, 0.07450981, 1, 1,
0.3671535, -0.4633534, 0.8075808, 0, 0.07058824, 1, 1,
0.3695251, -0.2194821, 2.543187, 0, 0.0627451, 1, 1,
0.3712123, -0.7737108, 4.184111, 0, 0.05882353, 1, 1,
0.3717649, 2.299977, 1.281061, 0, 0.05098039, 1, 1,
0.3727412, 1.26145, 0.2316769, 0, 0.04705882, 1, 1,
0.3747746, 0.7389763, 1.349946, 0, 0.03921569, 1, 1,
0.3753072, 2.129291, 0.4454556, 0, 0.03529412, 1, 1,
0.3775237, 2.250257, -0.4526846, 0, 0.02745098, 1, 1,
0.3816173, 0.8812997, -0.455393, 0, 0.02352941, 1, 1,
0.3818777, 0.2458276, 0.1375173, 0, 0.01568628, 1, 1,
0.3821837, -0.2323296, 0.6286046, 0, 0.01176471, 1, 1,
0.3856981, 0.1762764, 1.616071, 0, 0.003921569, 1, 1,
0.3882766, -1.305415, 3.591156, 0.003921569, 0, 1, 1,
0.3893514, 0.6102822, -0.9994628, 0.007843138, 0, 1, 1,
0.3928111, -1.91011, 3.72296, 0.01568628, 0, 1, 1,
0.3941835, 0.8070719, -0.9711149, 0.01960784, 0, 1, 1,
0.3951938, -1.311594, 2.691518, 0.02745098, 0, 1, 1,
0.3971184, -0.7919753, 2.183686, 0.03137255, 0, 1, 1,
0.3994823, -0.5096236, 2.625636, 0.03921569, 0, 1, 1,
0.3998394, 1.923607, 0.5245035, 0.04313726, 0, 1, 1,
0.400818, 0.3209021, 0.9951121, 0.05098039, 0, 1, 1,
0.4014419, -0.03780751, 3.045948, 0.05490196, 0, 1, 1,
0.4035785, 0.6073958, 1.269659, 0.0627451, 0, 1, 1,
0.4093675, 1.369445, 2.480055, 0.06666667, 0, 1, 1,
0.4097916, -0.3494179, 2.952887, 0.07450981, 0, 1, 1,
0.4111055, 0.3154391, 2.444083, 0.07843138, 0, 1, 1,
0.4139204, 0.1262857, 1.718583, 0.08627451, 0, 1, 1,
0.4331477, 0.4102929, 2.068391, 0.09019608, 0, 1, 1,
0.4391279, 0.953435, -0.03783184, 0.09803922, 0, 1, 1,
0.4416591, -1.755366, 2.875074, 0.1058824, 0, 1, 1,
0.4433599, 0.0205403, 1.775679, 0.1098039, 0, 1, 1,
0.4488959, -0.87261, 3.225228, 0.1176471, 0, 1, 1,
0.4510285, -0.009591397, 1.985464, 0.1215686, 0, 1, 1,
0.4516232, 1.108407, 0.503137, 0.1294118, 0, 1, 1,
0.4535932, 0.7098929, 1.904948, 0.1333333, 0, 1, 1,
0.4538767, 0.0215344, 1.103094, 0.1411765, 0, 1, 1,
0.4576573, -1.228332, 4.519474, 0.145098, 0, 1, 1,
0.4577734, -0.09272551, 0.7972705, 0.1529412, 0, 1, 1,
0.4631083, 0.959713, 0.3079661, 0.1568628, 0, 1, 1,
0.4684306, 1.385093, 0.5075195, 0.1647059, 0, 1, 1,
0.4770381, 0.9633037, 0.3217223, 0.1686275, 0, 1, 1,
0.4834756, -0.4482371, 4.559964, 0.1764706, 0, 1, 1,
0.4835231, -0.9474241, 3.215705, 0.1803922, 0, 1, 1,
0.4845049, -0.4556011, 1.075627, 0.1882353, 0, 1, 1,
0.4855962, -0.2009314, 2.152289, 0.1921569, 0, 1, 1,
0.4878963, 0.04602771, 2.99353, 0.2, 0, 1, 1,
0.4895609, -1.19217, 2.940487, 0.2078431, 0, 1, 1,
0.4898023, -0.8321531, 3.951313, 0.2117647, 0, 1, 1,
0.4924185, 1.295768, 1.182939, 0.2196078, 0, 1, 1,
0.4978698, -0.1140279, 3.261951, 0.2235294, 0, 1, 1,
0.4983067, -1.540153, 1.739643, 0.2313726, 0, 1, 1,
0.5051279, -1.062993, 2.451891, 0.2352941, 0, 1, 1,
0.5087869, 2.434849, 1.203797, 0.2431373, 0, 1, 1,
0.5120389, -0.3975648, 3.030352, 0.2470588, 0, 1, 1,
0.5200899, -1.56896, 2.815592, 0.254902, 0, 1, 1,
0.5287039, -1.436501, 3.78145, 0.2588235, 0, 1, 1,
0.5295526, 0.6538523, -0.3390678, 0.2666667, 0, 1, 1,
0.5334244, -0.6534377, 3.467961, 0.2705882, 0, 1, 1,
0.5364037, -0.9677408, 3.459383, 0.2784314, 0, 1, 1,
0.5403308, -0.5574406, 0.7311109, 0.282353, 0, 1, 1,
0.5403922, 0.7586324, -0.0262431, 0.2901961, 0, 1, 1,
0.5439004, -0.03057536, -0.09508839, 0.2941177, 0, 1, 1,
0.5467788, 1.09375, 0.06838005, 0.3019608, 0, 1, 1,
0.5497487, -1.365869, 1.964674, 0.3098039, 0, 1, 1,
0.5506231, -0.8404323, 4.240369, 0.3137255, 0, 1, 1,
0.5547122, 1.408546, 1.178292, 0.3215686, 0, 1, 1,
0.5561144, -0.705512, 3.61084, 0.3254902, 0, 1, 1,
0.5561477, 0.0546244, 1.804441, 0.3333333, 0, 1, 1,
0.5586033, 0.9496223, -0.6597427, 0.3372549, 0, 1, 1,
0.5591673, -0.965937, 1.733157, 0.345098, 0, 1, 1,
0.5623878, 1.494547, -0.3602015, 0.3490196, 0, 1, 1,
0.5636208, 0.9013285, 1.083756, 0.3568628, 0, 1, 1,
0.5669848, -0.3824996, 3.198389, 0.3607843, 0, 1, 1,
0.5688205, 0.6603042, 1.873577, 0.3686275, 0, 1, 1,
0.569097, 1.376746, -1.497322, 0.372549, 0, 1, 1,
0.5716668, 0.2316569, 3.129301, 0.3803922, 0, 1, 1,
0.5724708, 0.5940802, 0.6864712, 0.3843137, 0, 1, 1,
0.5780505, 0.2267517, 0.4669826, 0.3921569, 0, 1, 1,
0.5805076, -0.5252523, 2.206174, 0.3960784, 0, 1, 1,
0.5805174, 0.3513833, 2.782045, 0.4039216, 0, 1, 1,
0.5818386, -0.2795318, 2.581182, 0.4117647, 0, 1, 1,
0.5844777, 2.065452, 0.981755, 0.4156863, 0, 1, 1,
0.5872248, 0.7925373, 1.592201, 0.4235294, 0, 1, 1,
0.598838, -0.6466285, 3.917562, 0.427451, 0, 1, 1,
0.6002512, -2.468256, 3.00616, 0.4352941, 0, 1, 1,
0.6049967, 0.738198, 2.357672, 0.4392157, 0, 1, 1,
0.6065263, -0.8336655, 3.461885, 0.4470588, 0, 1, 1,
0.6103388, -1.070535, 3.075241, 0.4509804, 0, 1, 1,
0.6116048, -0.3509702, 2.131774, 0.4588235, 0, 1, 1,
0.6118735, -0.3746, 2.835715, 0.4627451, 0, 1, 1,
0.6131251, -1.197127, 2.803421, 0.4705882, 0, 1, 1,
0.6173039, -0.7151576, 0.5064198, 0.4745098, 0, 1, 1,
0.624598, 0.374387, 1.96298, 0.4823529, 0, 1, 1,
0.6249575, 0.946609, 1.549094, 0.4862745, 0, 1, 1,
0.6275628, 0.5692412, 0.1728062, 0.4941176, 0, 1, 1,
0.6398754, 2.029563, -1.337471, 0.5019608, 0, 1, 1,
0.6423374, 1.204293, -1.318328, 0.5058824, 0, 1, 1,
0.6448378, -1.29567, 2.682661, 0.5137255, 0, 1, 1,
0.6490729, -0.3027571, 2.095365, 0.5176471, 0, 1, 1,
0.6503414, -0.03375886, 2.573965, 0.5254902, 0, 1, 1,
0.668563, -0.2527515, 2.25711, 0.5294118, 0, 1, 1,
0.6715896, -0.9777918, 3.588485, 0.5372549, 0, 1, 1,
0.6724997, -0.7556688, 3.346385, 0.5411765, 0, 1, 1,
0.6737218, -0.7667653, 2.709378, 0.5490196, 0, 1, 1,
0.6744848, -0.2309242, 2.788422, 0.5529412, 0, 1, 1,
0.6792846, 1.523, 0.811497, 0.5607843, 0, 1, 1,
0.6802984, -0.4321705, 1.531516, 0.5647059, 0, 1, 1,
0.6899572, 0.1441133, 2.028163, 0.572549, 0, 1, 1,
0.698247, 0.8533093, 0.8893222, 0.5764706, 0, 1, 1,
0.701093, -1.118716, 1.66261, 0.5843138, 0, 1, 1,
0.702372, -0.3913112, 1.090923, 0.5882353, 0, 1, 1,
0.7046102, 1.344795, 2.042905, 0.5960785, 0, 1, 1,
0.7056931, 0.8958628, -0.6782216, 0.6039216, 0, 1, 1,
0.7072245, -0.3216264, 0.9539226, 0.6078432, 0, 1, 1,
0.7127512, -0.4743196, 1.131487, 0.6156863, 0, 1, 1,
0.7187169, 0.4565097, 1.842246, 0.6196079, 0, 1, 1,
0.7277295, -1.544535, 3.677407, 0.627451, 0, 1, 1,
0.7462039, -0.08530606, 1.470292, 0.6313726, 0, 1, 1,
0.7488065, 0.4626254, 2.045924, 0.6392157, 0, 1, 1,
0.7523321, -1.077835, 2.350155, 0.6431373, 0, 1, 1,
0.7530248, -0.05442886, 0.9851497, 0.6509804, 0, 1, 1,
0.7532011, 0.1550574, -0.1092858, 0.654902, 0, 1, 1,
0.753923, 1.706597, 0.7398328, 0.6627451, 0, 1, 1,
0.7637203, -0.6498397, 4.396908, 0.6666667, 0, 1, 1,
0.7780898, -0.2286599, 0.6696729, 0.6745098, 0, 1, 1,
0.7789173, 1.155946, -1.305114, 0.6784314, 0, 1, 1,
0.7847525, 1.942061, 1.636334, 0.6862745, 0, 1, 1,
0.800937, -0.8004676, 3.509167, 0.6901961, 0, 1, 1,
0.8017151, -0.242869, 3.260803, 0.6980392, 0, 1, 1,
0.8031601, 0.7561824, -0.1296681, 0.7058824, 0, 1, 1,
0.8046621, 0.2573016, 1.339046, 0.7098039, 0, 1, 1,
0.807257, -0.6798164, 2.364316, 0.7176471, 0, 1, 1,
0.8117023, 0.1855253, 1.832018, 0.7215686, 0, 1, 1,
0.8149381, -1.208603, 3.870223, 0.7294118, 0, 1, 1,
0.8223314, 0.7431202, 3.306213, 0.7333333, 0, 1, 1,
0.8256786, -0.01325773, 1.604526, 0.7411765, 0, 1, 1,
0.8283027, 0.3064319, 2.949893, 0.7450981, 0, 1, 1,
0.8310395, -0.8156873, 2.686153, 0.7529412, 0, 1, 1,
0.8378114, 0.3386201, 3.951086, 0.7568628, 0, 1, 1,
0.8435206, 0.325637, 1.007528, 0.7647059, 0, 1, 1,
0.8448713, 1.07585, 0.05533145, 0.7686275, 0, 1, 1,
0.8467724, -0.1881744, 3.22613, 0.7764706, 0, 1, 1,
0.8524331, -1.869031, 2.493474, 0.7803922, 0, 1, 1,
0.8566751, -2.164907, 2.478473, 0.7882353, 0, 1, 1,
0.8610167, 0.5002598, 0.6800853, 0.7921569, 0, 1, 1,
0.8675996, -0.2902034, 0.6945174, 0.8, 0, 1, 1,
0.8794114, -0.01778848, 1.066689, 0.8078431, 0, 1, 1,
0.883855, -0.1164002, 1.00987, 0.8117647, 0, 1, 1,
0.8914932, 0.2998819, -0.209152, 0.8196079, 0, 1, 1,
0.8997525, -0.5810584, 2.945971, 0.8235294, 0, 1, 1,
0.9040193, -0.2749974, 2.764849, 0.8313726, 0, 1, 1,
0.9064706, -0.6013983, 1.022855, 0.8352941, 0, 1, 1,
0.9133979, -1.000955, 2.297307, 0.8431373, 0, 1, 1,
0.9187336, -1.718727, 3.742917, 0.8470588, 0, 1, 1,
0.9189789, 2.00618, 1.662263, 0.854902, 0, 1, 1,
0.9323803, 1.046218, 1.643749, 0.8588235, 0, 1, 1,
0.9374868, 0.09673347, 2.263134, 0.8666667, 0, 1, 1,
0.9415951, -0.8233402, 1.18015, 0.8705882, 0, 1, 1,
0.9431489, 1.2906, -0.2342495, 0.8784314, 0, 1, 1,
0.9477229, -0.3421501, 1.897258, 0.8823529, 0, 1, 1,
0.9494199, 0.7061313, 0.5977628, 0.8901961, 0, 1, 1,
0.9513589, -0.3222377, 0.8630779, 0.8941177, 0, 1, 1,
0.9547479, 1.048626, 0.03792234, 0.9019608, 0, 1, 1,
0.9617933, -0.1459552, 1.959925, 0.9098039, 0, 1, 1,
0.9659486, 2.270315, 0.4668514, 0.9137255, 0, 1, 1,
0.968989, 0.3571897, -0.4527243, 0.9215686, 0, 1, 1,
0.9696708, -1.248948, 4.495269, 0.9254902, 0, 1, 1,
0.9713545, 0.9340452, 1.786494, 0.9333333, 0, 1, 1,
0.9714778, -1.192963, 2.688025, 0.9372549, 0, 1, 1,
0.9793884, 0.7757072, 2.023131, 0.945098, 0, 1, 1,
0.98072, 0.3808679, 0.9691166, 0.9490196, 0, 1, 1,
0.9852812, 0.6901991, 1.212027, 0.9568627, 0, 1, 1,
0.9857164, -1.115944, 2.999991, 0.9607843, 0, 1, 1,
0.9953333, 0.4084617, 1.284319, 0.9686275, 0, 1, 1,
0.9983957, 0.08681741, 1.00668, 0.972549, 0, 1, 1,
1.000998, 0.709508, 1.156902, 0.9803922, 0, 1, 1,
1.001173, -0.2291863, 1.630018, 0.9843137, 0, 1, 1,
1.006516, -0.3889945, 1.0743, 0.9921569, 0, 1, 1,
1.011572, 0.4848624, 0.407503, 0.9960784, 0, 1, 1,
1.014834, -1.093642, 0.7529618, 1, 0, 0.9960784, 1,
1.022201, -1.773755, 3.886443, 1, 0, 0.9882353, 1,
1.026219, -0.7408971, 3.438462, 1, 0, 0.9843137, 1,
1.034973, -0.6634662, 2.805319, 1, 0, 0.9764706, 1,
1.037012, -1.715376, 3.17768, 1, 0, 0.972549, 1,
1.040519, -1.325743, 2.445746, 1, 0, 0.9647059, 1,
1.042842, 0.2296456, 2.567594, 1, 0, 0.9607843, 1,
1.047772, -0.8769625, 2.826683, 1, 0, 0.9529412, 1,
1.04811, 0.08845773, 0.5569302, 1, 0, 0.9490196, 1,
1.048361, 1.069066, 2.387057, 1, 0, 0.9411765, 1,
1.050589, -0.8665353, 1.165888, 1, 0, 0.9372549, 1,
1.059984, 2.097958, 2.28777, 1, 0, 0.9294118, 1,
1.060701, 1.629131, 0.3634268, 1, 0, 0.9254902, 1,
1.064287, -0.3763308, 1.979666, 1, 0, 0.9176471, 1,
1.069185, -1.167335, 2.819314, 1, 0, 0.9137255, 1,
1.069678, -0.1395566, 2.098912, 1, 0, 0.9058824, 1,
1.071737, -0.3032977, 1.160338, 1, 0, 0.9019608, 1,
1.075609, 2.170903, -1.234942, 1, 0, 0.8941177, 1,
1.076881, 1.662855, 0.3502195, 1, 0, 0.8862745, 1,
1.078085, 0.7905145, 2.56275, 1, 0, 0.8823529, 1,
1.078304, -0.2727622, 2.503409, 1, 0, 0.8745098, 1,
1.07934, 0.01636359, 0.7071283, 1, 0, 0.8705882, 1,
1.094468, -1.447845, 4.377389, 1, 0, 0.8627451, 1,
1.09616, 0.1463541, 2.745153, 1, 0, 0.8588235, 1,
1.102086, -0.1227443, 1.274192, 1, 0, 0.8509804, 1,
1.102695, -1.34974, 0.5127161, 1, 0, 0.8470588, 1,
1.10312, -0.1833401, 1.321819, 1, 0, 0.8392157, 1,
1.104488, -2.81128, 2.565735, 1, 0, 0.8352941, 1,
1.106405, -0.09181143, 0.484851, 1, 0, 0.827451, 1,
1.113663, 0.246508, 0.1692378, 1, 0, 0.8235294, 1,
1.114065, -0.4684485, 1.31545, 1, 0, 0.8156863, 1,
1.121682, -0.381364, 3.495471, 1, 0, 0.8117647, 1,
1.125775, -2.890276, 1.993822, 1, 0, 0.8039216, 1,
1.129314, -1.006007, 1.904978, 1, 0, 0.7960784, 1,
1.129968, 0.01558609, 1.529909, 1, 0, 0.7921569, 1,
1.153048, 0.4345224, 0.9273944, 1, 0, 0.7843137, 1,
1.156319, 0.4120478, 1.575014, 1, 0, 0.7803922, 1,
1.158834, 0.1861605, 1.026659, 1, 0, 0.772549, 1,
1.160618, 1.800707, 0.7403235, 1, 0, 0.7686275, 1,
1.169926, 1.104893, -1.096111, 1, 0, 0.7607843, 1,
1.1733, -0.3491493, 1.527088, 1, 0, 0.7568628, 1,
1.173951, 0.5935153, 0.5072476, 1, 0, 0.7490196, 1,
1.176677, 0.5917839, 2.484677, 1, 0, 0.7450981, 1,
1.181619, -2.427851, 3.604721, 1, 0, 0.7372549, 1,
1.185702, 0.1825635, 1.439117, 1, 0, 0.7333333, 1,
1.193613, 0.2405668, 0.6032058, 1, 0, 0.7254902, 1,
1.194052, 0.6466802, 3.078988, 1, 0, 0.7215686, 1,
1.207738, 1.047136, 3.408556, 1, 0, 0.7137255, 1,
1.209339, -3.036728, 2.017426, 1, 0, 0.7098039, 1,
1.213608, -0.5762906, 3.631848, 1, 0, 0.7019608, 1,
1.218859, -0.1044349, 1.565408, 1, 0, 0.6941177, 1,
1.223247, 0.6098937, 2.149637, 1, 0, 0.6901961, 1,
1.237654, -1.864937, 1.823226, 1, 0, 0.682353, 1,
1.238702, 0.9283852, 0.6372662, 1, 0, 0.6784314, 1,
1.249151, -0.3349627, 1.852772, 1, 0, 0.6705883, 1,
1.262938, -0.2449298, 2.787994, 1, 0, 0.6666667, 1,
1.27155, -2.198805, 2.579245, 1, 0, 0.6588235, 1,
1.272912, -0.3634759, 1.921575, 1, 0, 0.654902, 1,
1.276518, -1.063232, 1.560487, 1, 0, 0.6470588, 1,
1.282475, -0.9993008, 2.025704, 1, 0, 0.6431373, 1,
1.282818, -1.343057, 1.87883, 1, 0, 0.6352941, 1,
1.290247, 0.6186253, 3.298175, 1, 0, 0.6313726, 1,
1.290529, 1.20401, -0.7186447, 1, 0, 0.6235294, 1,
1.317526, 1.326883, 1.772491, 1, 0, 0.6196079, 1,
1.323442, -0.5172195, 2.968426, 1, 0, 0.6117647, 1,
1.324337, -1.153113, 1.659289, 1, 0, 0.6078432, 1,
1.326898, 0.5620345, 0.2528322, 1, 0, 0.6, 1,
1.327538, 1.711762, 2.042002, 1, 0, 0.5921569, 1,
1.332108, -0.5306323, 0.4579453, 1, 0, 0.5882353, 1,
1.334, -0.6858044, 2.660412, 1, 0, 0.5803922, 1,
1.334489, -0.6173975, 0.4286521, 1, 0, 0.5764706, 1,
1.338487, -0.3220558, 3.387231, 1, 0, 0.5686275, 1,
1.347533, -0.8252054, 0.3606526, 1, 0, 0.5647059, 1,
1.348899, 0.2390134, 2.000934, 1, 0, 0.5568628, 1,
1.350544, 0.62011, 2.633082, 1, 0, 0.5529412, 1,
1.352839, -0.4977752, 1.185462, 1, 0, 0.5450981, 1,
1.353104, -0.3723593, 2.516653, 1, 0, 0.5411765, 1,
1.354525, -0.8536816, 1.942152, 1, 0, 0.5333334, 1,
1.356843, 2.396497, 2.738564, 1, 0, 0.5294118, 1,
1.357076, 0.8784097, 0.7541397, 1, 0, 0.5215687, 1,
1.36051, -0.6029593, 1.900094, 1, 0, 0.5176471, 1,
1.366457, 0.9662701, 0.6662854, 1, 0, 0.509804, 1,
1.379218, -0.9111161, 1.788579, 1, 0, 0.5058824, 1,
1.380344, -1.215123, 1.067547, 1, 0, 0.4980392, 1,
1.382405, 0.2568749, -0.6273799, 1, 0, 0.4901961, 1,
1.387663, 1.33618, -0.553616, 1, 0, 0.4862745, 1,
1.393679, 1.632984, 0.6889105, 1, 0, 0.4784314, 1,
1.412368, 1.938713, -2.20425, 1, 0, 0.4745098, 1,
1.415943, -0.09490961, 1.480868, 1, 0, 0.4666667, 1,
1.425621, 0.1110135, 1.088148, 1, 0, 0.4627451, 1,
1.427317, -0.1641628, 2.425527, 1, 0, 0.454902, 1,
1.432572, -2.312044, 2.533337, 1, 0, 0.4509804, 1,
1.435081, -2.328032, 1.865741, 1, 0, 0.4431373, 1,
1.445448, 1.164839, 0.6247607, 1, 0, 0.4392157, 1,
1.452101, -0.7251804, 2.276236, 1, 0, 0.4313726, 1,
1.458574, 0.838806, 0.6479669, 1, 0, 0.427451, 1,
1.464174, -0.8105731, 0.8465623, 1, 0, 0.4196078, 1,
1.465601, -1.231505, 2.273528, 1, 0, 0.4156863, 1,
1.47547, 0.8404096, 1.917952, 1, 0, 0.4078431, 1,
1.476895, 0.8809065, 0.2452993, 1, 0, 0.4039216, 1,
1.482129, 0.04892794, 1.388188, 1, 0, 0.3960784, 1,
1.484161, 0.1786799, 1.03868, 1, 0, 0.3882353, 1,
1.488464, 0.3480845, -1.500514, 1, 0, 0.3843137, 1,
1.502493, -0.3231992, 2.295346, 1, 0, 0.3764706, 1,
1.503006, 0.4796911, -0.1163684, 1, 0, 0.372549, 1,
1.505212, -0.8881829, 2.076868, 1, 0, 0.3647059, 1,
1.513771, 0.4053349, 3.311029, 1, 0, 0.3607843, 1,
1.524287, 1.003863, 2.785494, 1, 0, 0.3529412, 1,
1.549215, -0.2731084, 1.646523, 1, 0, 0.3490196, 1,
1.5527, 0.4870706, 2.658683, 1, 0, 0.3411765, 1,
1.565009, 1.094402, 0.7668929, 1, 0, 0.3372549, 1,
1.566656, 1.679601, 1.769668, 1, 0, 0.3294118, 1,
1.575371, 0.4433963, 2.213762, 1, 0, 0.3254902, 1,
1.577434, -1.160845, 3.450201, 1, 0, 0.3176471, 1,
1.583441, 0.9772509, 0.05921644, 1, 0, 0.3137255, 1,
1.587706, 0.779179, 1.046953, 1, 0, 0.3058824, 1,
1.595898, -0.6343325, 1.052804, 1, 0, 0.2980392, 1,
1.597923, -0.2498836, 3.715334, 1, 0, 0.2941177, 1,
1.598983, -0.7798338, 2.238927, 1, 0, 0.2862745, 1,
1.606555, -0.6268764, 1.46571, 1, 0, 0.282353, 1,
1.616212, 0.2956046, 2.992222, 1, 0, 0.2745098, 1,
1.636543, 1.067904, 0.3683988, 1, 0, 0.2705882, 1,
1.654457, -2.10508, 3.46836, 1, 0, 0.2627451, 1,
1.662981, -1.270034, 2.454138, 1, 0, 0.2588235, 1,
1.674146, 0.789303, 1.32867, 1, 0, 0.2509804, 1,
1.677614, 1.59757, 0.1027937, 1, 0, 0.2470588, 1,
1.692487, -0.3260857, 2.114017, 1, 0, 0.2392157, 1,
1.709965, -0.6841766, 1.300424, 1, 0, 0.2352941, 1,
1.721777, -0.6724504, -0.49059, 1, 0, 0.227451, 1,
1.724495, -0.4874894, 1.495859, 1, 0, 0.2235294, 1,
1.742685, 0.9314118, 2.050929, 1, 0, 0.2156863, 1,
1.751305, 0.4944839, 2.847763, 1, 0, 0.2117647, 1,
1.753549, 1.585749, 0.4071801, 1, 0, 0.2039216, 1,
1.757015, -1.594009, 1.134223, 1, 0, 0.1960784, 1,
1.772003, -0.3467072, 2.279997, 1, 0, 0.1921569, 1,
1.772474, -0.7954146, 2.098288, 1, 0, 0.1843137, 1,
1.802141, 0.5941142, 1.273779, 1, 0, 0.1803922, 1,
1.818984, -0.8767512, 1.765659, 1, 0, 0.172549, 1,
1.823187, -1.37406, 1.720373, 1, 0, 0.1686275, 1,
1.848689, 0.7552119, 1.410899, 1, 0, 0.1607843, 1,
1.866221, 0.4857696, 1.245694, 1, 0, 0.1568628, 1,
1.955283, -0.1121535, 0.7093172, 1, 0, 0.1490196, 1,
2.00754, -1.111394, 2.428718, 1, 0, 0.145098, 1,
2.023676, 0.1836064, 1.172333, 1, 0, 0.1372549, 1,
2.032881, -0.9147481, 0.3241141, 1, 0, 0.1333333, 1,
2.038465, -0.353011, 2.012078, 1, 0, 0.1254902, 1,
2.064831, -0.2078902, 1.402651, 1, 0, 0.1215686, 1,
2.108801, -0.6931139, 3.072005, 1, 0, 0.1137255, 1,
2.125574, 0.766234, 0.5918335, 1, 0, 0.1098039, 1,
2.127045, -0.1001245, 1.242852, 1, 0, 0.1019608, 1,
2.155637, 0.7688875, -0.1132225, 1, 0, 0.09411765, 1,
2.16142, 0.4857019, 2.142777, 1, 0, 0.09019608, 1,
2.167366, -0.4917376, 2.469828, 1, 0, 0.08235294, 1,
2.18247, 0.856702, 0.9083798, 1, 0, 0.07843138, 1,
2.209159, 0.2184664, 0.9971564, 1, 0, 0.07058824, 1,
2.215657, 0.4774944, 2.48638, 1, 0, 0.06666667, 1,
2.228418, -0.1501078, 2.991183, 1, 0, 0.05882353, 1,
2.260634, -0.04755009, 2.943803, 1, 0, 0.05490196, 1,
2.342974, 0.8087403, 1.263326, 1, 0, 0.04705882, 1,
2.423023, -0.1855964, 1.06952, 1, 0, 0.04313726, 1,
2.432969, 0.08533717, 3.614242, 1, 0, 0.03529412, 1,
2.497391, 0.3194748, 1.394816, 1, 0, 0.03137255, 1,
2.533649, -0.7759213, 0.3237362, 1, 0, 0.02352941, 1,
2.664395, -1.467231, 2.41475, 1, 0, 0.01960784, 1,
2.82922, -0.8997422, 2.348458, 1, 0, 0.01176471, 1,
2.874311, 1.020306, -0.04622839, 1, 0, 0.007843138, 1
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
-0.3526427, -4.547747, -7.759133, 0, -0.5, 0.5, 0.5,
-0.3526427, -4.547747, -7.759133, 1, -0.5, 0.5, 0.5,
-0.3526427, -4.547747, -7.759133, 1, 1.5, 0.5, 0.5,
-0.3526427, -4.547747, -7.759133, 0, 1.5, 0.5, 0.5
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
-4.673534, -0.2317494, -7.759133, 0, -0.5, 0.5, 0.5,
-4.673534, -0.2317494, -7.759133, 1, -0.5, 0.5, 0.5,
-4.673534, -0.2317494, -7.759133, 1, 1.5, 0.5, 0.5,
-4.673534, -0.2317494, -7.759133, 0, 1.5, 0.5, 0.5
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
-4.673534, -4.547747, -0.5750196, 0, -0.5, 0.5, 0.5,
-4.673534, -4.547747, -0.5750196, 1, -0.5, 0.5, 0.5,
-4.673534, -4.547747, -0.5750196, 1, 1.5, 0.5, 0.5,
-4.673534, -4.547747, -0.5750196, 0, 1.5, 0.5, 0.5
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
-3, -3.551747, -6.101261,
2, -3.551747, -6.101261,
-3, -3.551747, -6.101261,
-3, -3.717747, -6.377573,
-2, -3.551747, -6.101261,
-2, -3.717747, -6.377573,
-1, -3.551747, -6.101261,
-1, -3.717747, -6.377573,
0, -3.551747, -6.101261,
0, -3.717747, -6.377573,
1, -3.551747, -6.101261,
1, -3.717747, -6.377573,
2, -3.551747, -6.101261,
2, -3.717747, -6.377573
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
-3, -4.049747, -6.930197, 0, -0.5, 0.5, 0.5,
-3, -4.049747, -6.930197, 1, -0.5, 0.5, 0.5,
-3, -4.049747, -6.930197, 1, 1.5, 0.5, 0.5,
-3, -4.049747, -6.930197, 0, 1.5, 0.5, 0.5,
-2, -4.049747, -6.930197, 0, -0.5, 0.5, 0.5,
-2, -4.049747, -6.930197, 1, -0.5, 0.5, 0.5,
-2, -4.049747, -6.930197, 1, 1.5, 0.5, 0.5,
-2, -4.049747, -6.930197, 0, 1.5, 0.5, 0.5,
-1, -4.049747, -6.930197, 0, -0.5, 0.5, 0.5,
-1, -4.049747, -6.930197, 1, -0.5, 0.5, 0.5,
-1, -4.049747, -6.930197, 1, 1.5, 0.5, 0.5,
-1, -4.049747, -6.930197, 0, 1.5, 0.5, 0.5,
0, -4.049747, -6.930197, 0, -0.5, 0.5, 0.5,
0, -4.049747, -6.930197, 1, -0.5, 0.5, 0.5,
0, -4.049747, -6.930197, 1, 1.5, 0.5, 0.5,
0, -4.049747, -6.930197, 0, 1.5, 0.5, 0.5,
1, -4.049747, -6.930197, 0, -0.5, 0.5, 0.5,
1, -4.049747, -6.930197, 1, -0.5, 0.5, 0.5,
1, -4.049747, -6.930197, 1, 1.5, 0.5, 0.5,
1, -4.049747, -6.930197, 0, 1.5, 0.5, 0.5,
2, -4.049747, -6.930197, 0, -0.5, 0.5, 0.5,
2, -4.049747, -6.930197, 1, -0.5, 0.5, 0.5,
2, -4.049747, -6.930197, 1, 1.5, 0.5, 0.5,
2, -4.049747, -6.930197, 0, 1.5, 0.5, 0.5
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
-3.676405, -3, -6.101261,
-3.676405, 2, -6.101261,
-3.676405, -3, -6.101261,
-3.842593, -3, -6.377573,
-3.676405, -2, -6.101261,
-3.842593, -2, -6.377573,
-3.676405, -1, -6.101261,
-3.842593, -1, -6.377573,
-3.676405, 0, -6.101261,
-3.842593, 0, -6.377573,
-3.676405, 1, -6.101261,
-3.842593, 1, -6.377573,
-3.676405, 2, -6.101261,
-3.842593, 2, -6.377573
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
-4.17497, -3, -6.930197, 0, -0.5, 0.5, 0.5,
-4.17497, -3, -6.930197, 1, -0.5, 0.5, 0.5,
-4.17497, -3, -6.930197, 1, 1.5, 0.5, 0.5,
-4.17497, -3, -6.930197, 0, 1.5, 0.5, 0.5,
-4.17497, -2, -6.930197, 0, -0.5, 0.5, 0.5,
-4.17497, -2, -6.930197, 1, -0.5, 0.5, 0.5,
-4.17497, -2, -6.930197, 1, 1.5, 0.5, 0.5,
-4.17497, -2, -6.930197, 0, 1.5, 0.5, 0.5,
-4.17497, -1, -6.930197, 0, -0.5, 0.5, 0.5,
-4.17497, -1, -6.930197, 1, -0.5, 0.5, 0.5,
-4.17497, -1, -6.930197, 1, 1.5, 0.5, 0.5,
-4.17497, -1, -6.930197, 0, 1.5, 0.5, 0.5,
-4.17497, 0, -6.930197, 0, -0.5, 0.5, 0.5,
-4.17497, 0, -6.930197, 1, -0.5, 0.5, 0.5,
-4.17497, 0, -6.930197, 1, 1.5, 0.5, 0.5,
-4.17497, 0, -6.930197, 0, 1.5, 0.5, 0.5,
-4.17497, 1, -6.930197, 0, -0.5, 0.5, 0.5,
-4.17497, 1, -6.930197, 1, -0.5, 0.5, 0.5,
-4.17497, 1, -6.930197, 1, 1.5, 0.5, 0.5,
-4.17497, 1, -6.930197, 0, 1.5, 0.5, 0.5,
-4.17497, 2, -6.930197, 0, -0.5, 0.5, 0.5,
-4.17497, 2, -6.930197, 1, -0.5, 0.5, 0.5,
-4.17497, 2, -6.930197, 1, 1.5, 0.5, 0.5,
-4.17497, 2, -6.930197, 0, 1.5, 0.5, 0.5
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
-3.676405, -3.551747, -4,
-3.676405, -3.551747, 4,
-3.676405, -3.551747, -4,
-3.842593, -3.717747, -4,
-3.676405, -3.551747, -2,
-3.842593, -3.717747, -2,
-3.676405, -3.551747, 0,
-3.842593, -3.717747, 0,
-3.676405, -3.551747, 2,
-3.842593, -3.717747, 2,
-3.676405, -3.551747, 4,
-3.842593, -3.717747, 4
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
-4.17497, -4.049747, -4, 0, -0.5, 0.5, 0.5,
-4.17497, -4.049747, -4, 1, -0.5, 0.5, 0.5,
-4.17497, -4.049747, -4, 1, 1.5, 0.5, 0.5,
-4.17497, -4.049747, -4, 0, 1.5, 0.5, 0.5,
-4.17497, -4.049747, -2, 0, -0.5, 0.5, 0.5,
-4.17497, -4.049747, -2, 1, -0.5, 0.5, 0.5,
-4.17497, -4.049747, -2, 1, 1.5, 0.5, 0.5,
-4.17497, -4.049747, -2, 0, 1.5, 0.5, 0.5,
-4.17497, -4.049747, 0, 0, -0.5, 0.5, 0.5,
-4.17497, -4.049747, 0, 1, -0.5, 0.5, 0.5,
-4.17497, -4.049747, 0, 1, 1.5, 0.5, 0.5,
-4.17497, -4.049747, 0, 0, 1.5, 0.5, 0.5,
-4.17497, -4.049747, 2, 0, -0.5, 0.5, 0.5,
-4.17497, -4.049747, 2, 1, -0.5, 0.5, 0.5,
-4.17497, -4.049747, 2, 1, 1.5, 0.5, 0.5,
-4.17497, -4.049747, 2, 0, 1.5, 0.5, 0.5,
-4.17497, -4.049747, 4, 0, -0.5, 0.5, 0.5,
-4.17497, -4.049747, 4, 1, -0.5, 0.5, 0.5,
-4.17497, -4.049747, 4, 1, 1.5, 0.5, 0.5,
-4.17497, -4.049747, 4, 0, 1.5, 0.5, 0.5
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
-3.676405, -3.551747, -6.101261,
-3.676405, 3.088248, -6.101261,
-3.676405, -3.551747, 4.951221,
-3.676405, 3.088248, 4.951221,
-3.676405, -3.551747, -6.101261,
-3.676405, -3.551747, 4.951221,
-3.676405, 3.088248, -6.101261,
-3.676405, 3.088248, 4.951221,
-3.676405, -3.551747, -6.101261,
2.97112, -3.551747, -6.101261,
-3.676405, -3.551747, 4.951221,
2.97112, -3.551747, 4.951221,
-3.676405, 3.088248, -6.101261,
2.97112, 3.088248, -6.101261,
-3.676405, 3.088248, 4.951221,
2.97112, 3.088248, 4.951221,
2.97112, -3.551747, -6.101261,
2.97112, 3.088248, -6.101261,
2.97112, -3.551747, 4.951221,
2.97112, 3.088248, 4.951221,
2.97112, -3.551747, -6.101261,
2.97112, -3.551747, 4.951221,
2.97112, 3.088248, -6.101261,
2.97112, 3.088248, 4.951221
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
var radius = 7.746152;
var distance = 34.4635;
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
mvMatrix.translate( 0.3526427, 0.2317494, 0.5750196 );
mvMatrix.scale( 1.259911, 1.26134, 0.7577747 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.4635);
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
retard<-read.table("retard.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-retard$V2
```

```
## Error in eval(expr, envir, enclos): object 'retard' not found
```

```r
y<-retard$V3
```

```
## Error in eval(expr, envir, enclos): object 'retard' not found
```

```r
z<-retard$V4
```

```
## Error in eval(expr, envir, enclos): object 'retard' not found
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
-3.579597, -0.3309953, -2.682568, 0, 0, 1, 1, 1,
-3.169292, -0.4062506, -3.778252, 1, 0, 0, 1, 1,
-3.148129, 1.863375, -0.8462676, 1, 0, 0, 1, 1,
-2.909521, 0.4369608, -2.539894, 1, 0, 0, 1, 1,
-2.746057, -0.710871, -0.5812072, 1, 0, 0, 1, 1,
-2.57482, 0.667347, -0.6293746, 1, 0, 0, 1, 1,
-2.566128, 0.7200779, -2.132701, 0, 0, 0, 1, 1,
-2.54971, -0.5327314, -1.963335, 0, 0, 0, 1, 1,
-2.486595, -0.252336, -1.387863, 0, 0, 0, 1, 1,
-2.413904, -0.6055912, -2.070508, 0, 0, 0, 1, 1,
-2.358906, -1.577047, -1.527251, 0, 0, 0, 1, 1,
-2.326461, -0.6153175, -0.4376837, 0, 0, 0, 1, 1,
-2.303221, 0.9058663, -0.7464318, 0, 0, 0, 1, 1,
-2.296739, 0.7262433, -0.9261532, 1, 1, 1, 1, 1,
-2.212095, -0.235388, -1.65243, 1, 1, 1, 1, 1,
-2.146656, -2.460022, -3.499064, 1, 1, 1, 1, 1,
-2.082014, 0.7575033, -3.148453, 1, 1, 1, 1, 1,
-2.062351, -0.5160198, -2.329337, 1, 1, 1, 1, 1,
-2.000479, 0.3962703, 0.3713073, 1, 1, 1, 1, 1,
-1.987048, -1.019737, -1.730653, 1, 1, 1, 1, 1,
-1.964313, -0.1009364, -1.270827, 1, 1, 1, 1, 1,
-1.917731, 0.2681504, -2.868411, 1, 1, 1, 1, 1,
-1.906941, 0.08333767, -1.768555, 1, 1, 1, 1, 1,
-1.903107, 0.6563977, -1.312875, 1, 1, 1, 1, 1,
-1.900403, 1.43965, 0.816436, 1, 1, 1, 1, 1,
-1.889101, 0.3648685, -1.164524, 1, 1, 1, 1, 1,
-1.883595, -0.03412786, -4.007022, 1, 1, 1, 1, 1,
-1.882759, 1.120029, -2.607201, 1, 1, 1, 1, 1,
-1.850934, -1.676733, -1.844872, 0, 0, 1, 1, 1,
-1.824057, -0.4284673, -2.144338, 1, 0, 0, 1, 1,
-1.810403, -0.9514439, -3.214757, 1, 0, 0, 1, 1,
-1.787071, 0.7220952, 1.656701, 1, 0, 0, 1, 1,
-1.781679, 0.651373, -1.299783, 1, 0, 0, 1, 1,
-1.757936, -0.008347568, -0.7781325, 1, 0, 0, 1, 1,
-1.756792, 0.6049876, -0.9106243, 0, 0, 0, 1, 1,
-1.749167, -0.1452468, -1.364943, 0, 0, 0, 1, 1,
-1.746921, -1.121805, -1.33277, 0, 0, 0, 1, 1,
-1.745057, -0.5555678, -1.059383, 0, 0, 0, 1, 1,
-1.738557, 0.1373606, -3.713554, 0, 0, 0, 1, 1,
-1.733182, -0.004504556, -2.44442, 0, 0, 0, 1, 1,
-1.725077, 0.1276859, -2.191713, 0, 0, 0, 1, 1,
-1.720766, -0.2733932, -1.582361, 1, 1, 1, 1, 1,
-1.716649, -0.8554903, 0.007655517, 1, 1, 1, 1, 1,
-1.710443, 0.184514, -1.543207, 1, 1, 1, 1, 1,
-1.702517, 1.015314, -0.7637646, 1, 1, 1, 1, 1,
-1.700092, -1.222929, -1.65438, 1, 1, 1, 1, 1,
-1.699084, -0.1810369, -2.437161, 1, 1, 1, 1, 1,
-1.683429, 1.098795, -1.791681, 1, 1, 1, 1, 1,
-1.679728, -0.3835215, -2.915486, 1, 1, 1, 1, 1,
-1.677331, -0.4694328, -1.103944, 1, 1, 1, 1, 1,
-1.670436, -0.5607446, -1.926509, 1, 1, 1, 1, 1,
-1.658311, 0.2982981, -2.069016, 1, 1, 1, 1, 1,
-1.64638, 2.431828, 0.1949698, 1, 1, 1, 1, 1,
-1.638061, -0.4436506, -0.1980877, 1, 1, 1, 1, 1,
-1.629171, -0.7041449, -3.349496, 1, 1, 1, 1, 1,
-1.626446, -2.399232, -2.065155, 1, 1, 1, 1, 1,
-1.615183, 0.1794558, -2.729026, 0, 0, 1, 1, 1,
-1.614692, -1.204202, -1.202655, 1, 0, 0, 1, 1,
-1.612974, 0.4595467, -0.4342195, 1, 0, 0, 1, 1,
-1.591888, 0.2036757, -1.720028, 1, 0, 0, 1, 1,
-1.587695, -0.7492781, -1.551507, 1, 0, 0, 1, 1,
-1.57099, -0.8634358, 1.405103, 1, 0, 0, 1, 1,
-1.569023, -0.007524424, -2.531441, 0, 0, 0, 1, 1,
-1.549868, -0.8819297, -0.7221226, 0, 0, 0, 1, 1,
-1.549205, 0.4527654, -1.211179, 0, 0, 0, 1, 1,
-1.532527, 1.943005, -1.452197, 0, 0, 0, 1, 1,
-1.528136, -0.5929554, -2.243479, 0, 0, 0, 1, 1,
-1.522125, 1.25505, -3.245595, 0, 0, 0, 1, 1,
-1.52022, 0.9812979, -0.2766868, 0, 0, 0, 1, 1,
-1.516655, 0.1141977, -0.4701106, 1, 1, 1, 1, 1,
-1.503581, -2.399551, -1.230745, 1, 1, 1, 1, 1,
-1.500247, -0.9872668, -1.42645, 1, 1, 1, 1, 1,
-1.499902, -0.8670242, -1.751191, 1, 1, 1, 1, 1,
-1.490632, -2.011163, -1.673645, 1, 1, 1, 1, 1,
-1.480326, 0.9192241, -2.446493, 1, 1, 1, 1, 1,
-1.461789, 0.8489317, -0.6695467, 1, 1, 1, 1, 1,
-1.456337, -0.1679462, -1.663053, 1, 1, 1, 1, 1,
-1.452198, -0.9365848, -0.8991331, 1, 1, 1, 1, 1,
-1.450367, 1.275835, 0.05795283, 1, 1, 1, 1, 1,
-1.448964, -0.4269421, -1.75637, 1, 1, 1, 1, 1,
-1.448322, 0.4885889, -0.2244976, 1, 1, 1, 1, 1,
-1.43872, -1.651568, -3.082244, 1, 1, 1, 1, 1,
-1.437716, -1.026902, -2.124697, 1, 1, 1, 1, 1,
-1.434425, 0.4309983, -3.712409, 1, 1, 1, 1, 1,
-1.43345, -1.204224, -1.561004, 0, 0, 1, 1, 1,
-1.432321, 0.2168922, -2.390174, 1, 0, 0, 1, 1,
-1.428211, 1.795987, -1.209201, 1, 0, 0, 1, 1,
-1.419693, -0.8587944, -1.385707, 1, 0, 0, 1, 1,
-1.417356, 1.539867, -2.871142, 1, 0, 0, 1, 1,
-1.404421, -1.172198, -1.471558, 1, 0, 0, 1, 1,
-1.401752, 0.6032028, -1.331368, 0, 0, 0, 1, 1,
-1.395355, -0.6378673, -2.402677, 0, 0, 0, 1, 1,
-1.387885, -0.8812302, -1.964651, 0, 0, 0, 1, 1,
-1.366233, 0.04189106, 1.068116, 0, 0, 0, 1, 1,
-1.359075, -0.9569874, -1.417254, 0, 0, 0, 1, 1,
-1.358608, -0.02879273, -0.9704913, 0, 0, 0, 1, 1,
-1.357227, -0.255032, -2.469729, 0, 0, 0, 1, 1,
-1.349541, 0.4932524, -1.807697, 1, 1, 1, 1, 1,
-1.343295, 1.121384, -1.262875, 1, 1, 1, 1, 1,
-1.329225, 1.41538, -0.1305262, 1, 1, 1, 1, 1,
-1.303468, 0.2667375, -0.9967107, 1, 1, 1, 1, 1,
-1.293817, -0.1696089, -0.9394795, 1, 1, 1, 1, 1,
-1.293349, -0.4550585, -1.513669, 1, 1, 1, 1, 1,
-1.280967, 0.4352938, -1.208989, 1, 1, 1, 1, 1,
-1.276211, 1.502959, -0.9169443, 1, 1, 1, 1, 1,
-1.273796, 1.035612, -0.1705114, 1, 1, 1, 1, 1,
-1.261942, -1.726643, -4.286791, 1, 1, 1, 1, 1,
-1.254238, -2.873932, -5.911369, 1, 1, 1, 1, 1,
-1.251682, -0.721532, -1.926971, 1, 1, 1, 1, 1,
-1.248515, -0.3063677, -0.6938294, 1, 1, 1, 1, 1,
-1.235409, -0.6531249, -1.247042, 1, 1, 1, 1, 1,
-1.233533, 0.4318688, -1.1724, 1, 1, 1, 1, 1,
-1.219082, -0.9081829, -1.858288, 0, 0, 1, 1, 1,
-1.214252, 2.045768, -1.027907, 1, 0, 0, 1, 1,
-1.202615, -0.3981716, -1.993526, 1, 0, 0, 1, 1,
-1.190597, 0.4063472, -0.9759416, 1, 0, 0, 1, 1,
-1.189866, -0.7268159, -1.170795, 1, 0, 0, 1, 1,
-1.189399, -0.4219375, -1.270019, 1, 0, 0, 1, 1,
-1.188753, 0.3300477, -0.7278563, 0, 0, 0, 1, 1,
-1.187474, -1.004825, -1.897527, 0, 0, 0, 1, 1,
-1.186829, -0.317974, -2.112558, 0, 0, 0, 1, 1,
-1.186148, 0.3782996, -1.187206, 0, 0, 0, 1, 1,
-1.185913, -0.3991564, -3.008509, 0, 0, 0, 1, 1,
-1.18374, 0.3155118, -3.022074, 0, 0, 0, 1, 1,
-1.16635, 0.3262695, -1.125628, 0, 0, 0, 1, 1,
-1.15387, 0.2840439, 0.01449477, 1, 1, 1, 1, 1,
-1.153688, -0.5954118, 0.2322626, 1, 1, 1, 1, 1,
-1.15083, -0.2115818, -1.801403, 1, 1, 1, 1, 1,
-1.148314, 0.9835304, 0.1687604, 1, 1, 1, 1, 1,
-1.147135, -1.919255, -1.380014, 1, 1, 1, 1, 1,
-1.140169, 0.7213167, -2.749063, 1, 1, 1, 1, 1,
-1.136011, -1.285292, -2.56593, 1, 1, 1, 1, 1,
-1.135055, -0.5376088, -1.478228, 1, 1, 1, 1, 1,
-1.13444, -0.2159099, -0.4892436, 1, 1, 1, 1, 1,
-1.133255, 0.3352239, -1.282438, 1, 1, 1, 1, 1,
-1.126814, 0.8127078, -1.449143, 1, 1, 1, 1, 1,
-1.125455, -0.9528547, -2.372261, 1, 1, 1, 1, 1,
-1.124874, 1.417305, -1.385509, 1, 1, 1, 1, 1,
-1.120638, -1.168568, -2.827776, 1, 1, 1, 1, 1,
-1.120041, 0.4540974, -0.8533249, 1, 1, 1, 1, 1,
-1.11341, -0.740923, -0.9644189, 0, 0, 1, 1, 1,
-1.110867, -0.9283999, -3.103296, 1, 0, 0, 1, 1,
-1.110265, -1.046393, -0.3545646, 1, 0, 0, 1, 1,
-1.106709, 2.390429, -1.889497, 1, 0, 0, 1, 1,
-1.096731, 1.034263, -2.68386, 1, 0, 0, 1, 1,
-1.08516, 0.2360809, -1.958834, 1, 0, 0, 1, 1,
-1.066413, -1.168747, -2.072399, 0, 0, 0, 1, 1,
-1.065361, 1.041443, -1.502746, 0, 0, 0, 1, 1,
-1.056164, 1.275403, -0.7326487, 0, 0, 0, 1, 1,
-1.055092, -0.312622, -1.768062, 0, 0, 0, 1, 1,
-1.05472, 1.99674, -0.481269, 0, 0, 0, 1, 1,
-1.054582, -0.6921805, 0.7653869, 0, 0, 0, 1, 1,
-1.054343, 0.8441288, -0.4815798, 0, 0, 0, 1, 1,
-1.054275, -0.04803493, -2.578351, 1, 1, 1, 1, 1,
-1.048883, 1.012853, -2.551209, 1, 1, 1, 1, 1,
-1.047896, 0.06332945, -3.098142, 1, 1, 1, 1, 1,
-1.044975, 0.9423937, -1.375457, 1, 1, 1, 1, 1,
-1.039135, -0.07019597, -2.575602, 1, 1, 1, 1, 1,
-1.03796, 0.3632945, 0.05658778, 1, 1, 1, 1, 1,
-1.035537, -1.062039, -2.129035, 1, 1, 1, 1, 1,
-1.035217, 1.070676, -0.2013635, 1, 1, 1, 1, 1,
-1.033322, -0.1827149, -1.721732, 1, 1, 1, 1, 1,
-1.026316, 0.5080383, -0.7145761, 1, 1, 1, 1, 1,
-1.021619, 0.4510335, -1.390342, 1, 1, 1, 1, 1,
-1.021587, -0.09496874, -2.358176, 1, 1, 1, 1, 1,
-1.017401, 0.3995221, -0.9218356, 1, 1, 1, 1, 1,
-1.017268, 0.3601164, 0.7669962, 1, 1, 1, 1, 1,
-1.017002, -1.865226, -2.535681, 1, 1, 1, 1, 1,
-1.01655, -2.579198, -4.186199, 0, 0, 1, 1, 1,
-1.015336, -0.9184995, -3.903049, 1, 0, 0, 1, 1,
-1.013958, -0.2543184, -2.875683, 1, 0, 0, 1, 1,
-1.01362, 1.321197, -0.9061916, 1, 0, 0, 1, 1,
-0.9950985, 0.5698882, -1.170113, 1, 0, 0, 1, 1,
-0.9778939, -0.1179908, -0.8389464, 1, 0, 0, 1, 1,
-0.9730529, 0.3327077, -3.277769, 0, 0, 0, 1, 1,
-0.9702193, -1.547175, -3.181852, 0, 0, 0, 1, 1,
-0.9643915, -0.06861893, -0.9422131, 0, 0, 0, 1, 1,
-0.9553691, 0.6323164, 0.05966199, 0, 0, 0, 1, 1,
-0.9473174, -0.2919818, -1.357438, 0, 0, 0, 1, 1,
-0.9470218, -0.9715508, -4.207876, 0, 0, 0, 1, 1,
-0.9461536, -0.1400883, -0.6975769, 0, 0, 0, 1, 1,
-0.9450592, -0.2129208, -1.765423, 1, 1, 1, 1, 1,
-0.9440309, -0.9591017, -1.722063, 1, 1, 1, 1, 1,
-0.9409277, 0.3885302, -1.969255, 1, 1, 1, 1, 1,
-0.9191218, 1.035887, -1.752033, 1, 1, 1, 1, 1,
-0.9169647, 1.016901, -0.04016265, 1, 1, 1, 1, 1,
-0.9137119, 0.5232961, -0.2352504, 1, 1, 1, 1, 1,
-0.9126439, 0.4628679, -2.2435, 1, 1, 1, 1, 1,
-0.9076698, -0.8220276, -3.971228, 1, 1, 1, 1, 1,
-0.9049804, -0.9069376, -1.342052, 1, 1, 1, 1, 1,
-0.9023768, 1.358017, -1.592689, 1, 1, 1, 1, 1,
-0.8967734, -0.6891201, -2.520212, 1, 1, 1, 1, 1,
-0.8820752, -0.3629873, -0.4820182, 1, 1, 1, 1, 1,
-0.8798715, 0.1493613, -0.7705474, 1, 1, 1, 1, 1,
-0.8790982, -0.7747375, -1.108887, 1, 1, 1, 1, 1,
-0.8702098, -1.139922, -2.5589, 1, 1, 1, 1, 1,
-0.8649552, 1.309664, -1.088443, 0, 0, 1, 1, 1,
-0.8572221, -0.1523546, -0.2778955, 1, 0, 0, 1, 1,
-0.8551186, -0.04314227, -2.105646, 1, 0, 0, 1, 1,
-0.8515301, -1.361106, -1.863854, 1, 0, 0, 1, 1,
-0.8510368, 0.6393495, -1.538996, 1, 0, 0, 1, 1,
-0.8377568, -0.8718919, -1.919895, 1, 0, 0, 1, 1,
-0.834987, -1.697061, -2.89688, 0, 0, 0, 1, 1,
-0.8339971, 0.1738954, -0.3959204, 0, 0, 0, 1, 1,
-0.8312309, 1.998189, -0.5483629, 0, 0, 0, 1, 1,
-0.8284707, -0.5914962, -1.289663, 0, 0, 0, 1, 1,
-0.8275447, 1.388009, 0.5563135, 0, 0, 0, 1, 1,
-0.8222526, 0.5115591, -0.6682019, 0, 0, 0, 1, 1,
-0.819833, 0.3301381, -1.017042, 0, 0, 0, 1, 1,
-0.8163895, 0.2446345, -1.029841, 1, 1, 1, 1, 1,
-0.8123019, -0.4164121, -2.72393, 1, 1, 1, 1, 1,
-0.8109874, 1.454642, -1.344096, 1, 1, 1, 1, 1,
-0.8063558, 0.5689184, 0.6232778, 1, 1, 1, 1, 1,
-0.8034652, -1.385292, -0.7892375, 1, 1, 1, 1, 1,
-0.8024423, 1.051397, -1.359063, 1, 1, 1, 1, 1,
-0.8000274, -0.3875599, -1.405254, 1, 1, 1, 1, 1,
-0.7984272, 0.6567922, 0.08367784, 1, 1, 1, 1, 1,
-0.7969636, -1.643882, -1.496546, 1, 1, 1, 1, 1,
-0.7969326, 1.499158, 0.666701, 1, 1, 1, 1, 1,
-0.7963498, 0.1930176, -2.617474, 1, 1, 1, 1, 1,
-0.7948562, -0.1017576, -1.105179, 1, 1, 1, 1, 1,
-0.7883429, 0.4819659, -1.622707, 1, 1, 1, 1, 1,
-0.7842658, 0.5363528, 0.03672593, 1, 1, 1, 1, 1,
-0.7838786, 0.4246923, -0.602262, 1, 1, 1, 1, 1,
-0.7789243, -0.1484239, -3.522557, 0, 0, 1, 1, 1,
-0.7786753, 0.4413334, -0.9213666, 1, 0, 0, 1, 1,
-0.7774948, 1.133713, -1.67285, 1, 0, 0, 1, 1,
-0.7765622, 0.8949395, -0.1935949, 1, 0, 0, 1, 1,
-0.7755736, 0.9175026, -1.157321, 1, 0, 0, 1, 1,
-0.7742391, 0.8113421, -2.543499, 1, 0, 0, 1, 1,
-0.7717913, 1.226635, -1.220278, 0, 0, 0, 1, 1,
-0.7695842, -0.4458217, -1.959811, 0, 0, 0, 1, 1,
-0.7562605, -0.6798386, -2.000623, 0, 0, 0, 1, 1,
-0.7441047, -0.2397165, -1.761579, 0, 0, 0, 1, 1,
-0.7423768, -0.1636173, -2.378735, 0, 0, 0, 1, 1,
-0.7399734, 2.991549, -1.633425, 0, 0, 0, 1, 1,
-0.7394429, -0.4859665, -2.301622, 0, 0, 0, 1, 1,
-0.7327179, -2.500882, -3.503918, 1, 1, 1, 1, 1,
-0.7295629, -0.07291623, -1.427918, 1, 1, 1, 1, 1,
-0.7195834, -0.4024521, -5.940302, 1, 1, 1, 1, 1,
-0.7180856, -1.289769, -2.721927, 1, 1, 1, 1, 1,
-0.7169438, 0.1661832, -1.149697, 1, 1, 1, 1, 1,
-0.7155719, 1.108227, -0.008245607, 1, 1, 1, 1, 1,
-0.7142011, 0.7762638, -1.837697, 1, 1, 1, 1, 1,
-0.7055749, -0.5960056, -1.311274, 1, 1, 1, 1, 1,
-0.7052755, 1.010657, 0.4656753, 1, 1, 1, 1, 1,
-0.7006071, -1.448631, -2.086, 1, 1, 1, 1, 1,
-0.7003927, 0.4591516, -0.5824333, 1, 1, 1, 1, 1,
-0.6986086, 0.3580788, -0.2064753, 1, 1, 1, 1, 1,
-0.6971602, -0.3947306, -2.109847, 1, 1, 1, 1, 1,
-0.6880068, 0.9752137, -2.081421, 1, 1, 1, 1, 1,
-0.678398, 2.084634, -0.1528519, 1, 1, 1, 1, 1,
-0.6780856, -0.38329, -1.661208, 0, 0, 1, 1, 1,
-0.6763728, -0.6304405, -3.074452, 1, 0, 0, 1, 1,
-0.6671243, -3.042438, -3.603751, 1, 0, 0, 1, 1,
-0.6633198, 1.826298, -1.500335, 1, 0, 0, 1, 1,
-0.6614326, -1.094055, -3.51197, 1, 0, 0, 1, 1,
-0.6599004, 1.123538, 0.2988525, 1, 0, 0, 1, 1,
-0.6582669, 1.926517, -0.9561729, 0, 0, 0, 1, 1,
-0.6575267, 2.34504, -0.2373184, 0, 0, 0, 1, 1,
-0.6529987, 0.4248748, -1.680043, 0, 0, 0, 1, 1,
-0.6512595, 1.166228, 0.2045714, 0, 0, 0, 1, 1,
-0.6493968, 0.7120094, 0.4054685, 0, 0, 0, 1, 1,
-0.648628, 0.2090889, -0.9217759, 0, 0, 0, 1, 1,
-0.6467954, -0.4216464, -0.3331335, 0, 0, 0, 1, 1,
-0.6391836, 0.4756464, -0.7002332, 1, 1, 1, 1, 1,
-0.6286891, 0.4580553, -1.825514, 1, 1, 1, 1, 1,
-0.6285439, -0.1392389, 0.3080752, 1, 1, 1, 1, 1,
-0.6269609, 1.581834, -0.7995273, 1, 1, 1, 1, 1,
-0.6212922, -0.8199389, -2.34862, 1, 1, 1, 1, 1,
-0.6127464, 1.351495, -0.8694468, 1, 1, 1, 1, 1,
-0.6103662, 0.1510114, -0.7701911, 1, 1, 1, 1, 1,
-0.6062959, 0.347772, -0.9093634, 1, 1, 1, 1, 1,
-0.6017947, -0.08387052, -0.9756461, 1, 1, 1, 1, 1,
-0.6000565, 0.8717183, -0.910742, 1, 1, 1, 1, 1,
-0.5949048, -0.06919207, -1.763084, 1, 1, 1, 1, 1,
-0.5938579, 1.615167, 1.19312, 1, 1, 1, 1, 1,
-0.5925683, -1.194289, -3.785148, 1, 1, 1, 1, 1,
-0.5907161, 0.9518119, -2.635588, 1, 1, 1, 1, 1,
-0.5819721, 0.5817269, -0.521145, 1, 1, 1, 1, 1,
-0.5779431, -0.7959027, -2.629797, 0, 0, 1, 1, 1,
-0.5769014, -1.752637, -3.829839, 1, 0, 0, 1, 1,
-0.5757213, 1.004988, -1.920543, 1, 0, 0, 1, 1,
-0.5732009, -1.093133, -2.079437, 1, 0, 0, 1, 1,
-0.5645617, -0.01336596, -1.278093, 1, 0, 0, 1, 1,
-0.5619871, 0.9608204, -0.9133759, 1, 0, 0, 1, 1,
-0.5592489, 0.2635346, -0.5102277, 0, 0, 0, 1, 1,
-0.5581775, -1.608975, -1.386143, 0, 0, 0, 1, 1,
-0.5575498, 0.07899245, -0.3221688, 0, 0, 0, 1, 1,
-0.5523449, 0.08687933, -0.6877014, 0, 0, 0, 1, 1,
-0.5495634, 0.6527959, 1.381413, 0, 0, 0, 1, 1,
-0.5492655, 0.03087843, -0.5758926, 0, 0, 0, 1, 1,
-0.5475478, 0.9109852, -2.055715, 0, 0, 0, 1, 1,
-0.5420571, -0.02376921, -2.737355, 1, 1, 1, 1, 1,
-0.5416113, 1.548029, -2.429835, 1, 1, 1, 1, 1,
-0.5371809, 1.105707, -2.033508, 1, 1, 1, 1, 1,
-0.5339644, 0.5398847, -2.385966, 1, 1, 1, 1, 1,
-0.5271585, -0.8561461, -2.227931, 1, 1, 1, 1, 1,
-0.5270232, -0.01655742, -1.683257, 1, 1, 1, 1, 1,
-0.5183243, -1.17185, -1.376401, 1, 1, 1, 1, 1,
-0.5176426, 0.4496808, -1.176343, 1, 1, 1, 1, 1,
-0.5170048, -1.124711, -2.442513, 1, 1, 1, 1, 1,
-0.5110095, 0.1550434, -0.4107829, 1, 1, 1, 1, 1,
-0.5097596, 0.1674847, -1.347691, 1, 1, 1, 1, 1,
-0.5079843, 0.3748481, 1.334497, 1, 1, 1, 1, 1,
-0.5073378, 0.1208941, -1.435103, 1, 1, 1, 1, 1,
-0.5055287, -0.373925, -2.102072, 1, 1, 1, 1, 1,
-0.5036693, 1.620906, 0.06483008, 1, 1, 1, 1, 1,
-0.5007246, -0.05431186, -1.51505, 0, 0, 1, 1, 1,
-0.4991612, -0.8605549, -2.791413, 1, 0, 0, 1, 1,
-0.4951297, 0.650543, -1.663455, 1, 0, 0, 1, 1,
-0.4893417, 0.533877, -0.1017731, 1, 0, 0, 1, 1,
-0.4880154, 0.163269, -1.681123, 1, 0, 0, 1, 1,
-0.4872719, 0.8265563, -1.857017, 1, 0, 0, 1, 1,
-0.480077, 0.5421346, -0.444509, 0, 0, 0, 1, 1,
-0.4795529, -0.3662906, -2.840853, 0, 0, 0, 1, 1,
-0.473501, 0.2061132, 0.02910703, 0, 0, 0, 1, 1,
-0.4697196, -1.790347, -2.298703, 0, 0, 0, 1, 1,
-0.4696993, -1.631848, -1.770649, 0, 0, 0, 1, 1,
-0.4657006, 1.627035, 0.7184348, 0, 0, 0, 1, 1,
-0.4584286, 1.292953, -1.654816, 0, 0, 0, 1, 1,
-0.45124, 0.6239482, -0.2045383, 1, 1, 1, 1, 1,
-0.4497412, -0.06182076, -2.724343, 1, 1, 1, 1, 1,
-0.4456171, -1.188061, -0.3353621, 1, 1, 1, 1, 1,
-0.4441334, -0.002401949, -1.764701, 1, 1, 1, 1, 1,
-0.4435781, 1.008631, 0.1138235, 1, 1, 1, 1, 1,
-0.4408877, -0.2233096, -1.206134, 1, 1, 1, 1, 1,
-0.4374685, -1.497762, -0.7908463, 1, 1, 1, 1, 1,
-0.4341874, 0.3173638, -1.301545, 1, 1, 1, 1, 1,
-0.4275932, -0.799385, -0.6479831, 1, 1, 1, 1, 1,
-0.4220145, -0.2937161, -2.361161, 1, 1, 1, 1, 1,
-0.4211368, 2.258246, -2.094031, 1, 1, 1, 1, 1,
-0.417466, -2.520325, -3.327842, 1, 1, 1, 1, 1,
-0.4153088, 1.193599, -0.3995477, 1, 1, 1, 1, 1,
-0.4152524, 0.4646102, -0.6834565, 1, 1, 1, 1, 1,
-0.4132756, -0.3065555, -3.636932, 1, 1, 1, 1, 1,
-0.4127089, 1.155999, -1.087614, 0, 0, 1, 1, 1,
-0.4124119, 2.200138, -0.1587807, 1, 0, 0, 1, 1,
-0.4104921, 0.1606953, -1.428726, 1, 0, 0, 1, 1,
-0.4085403, -0.1890174, -1.063388, 1, 0, 0, 1, 1,
-0.4041236, 0.03555173, -1.551457, 1, 0, 0, 1, 1,
-0.399244, -1.090656, -4.638277, 1, 0, 0, 1, 1,
-0.3989471, -1.268587, -1.007834, 0, 0, 0, 1, 1,
-0.3979653, 1.73722, -0.4261591, 0, 0, 0, 1, 1,
-0.3975223, 0.4565238, -1.43645, 0, 0, 0, 1, 1,
-0.3970291, -0.206189, -0.7795674, 0, 0, 0, 1, 1,
-0.3953885, -0.05717346, -2.440096, 0, 0, 0, 1, 1,
-0.3941285, -0.471444, -2.316385, 0, 0, 0, 1, 1,
-0.3913904, -0.1648061, -4.744797, 0, 0, 0, 1, 1,
-0.3871008, -0.5675061, -0.8663908, 1, 1, 1, 1, 1,
-0.3856605, 0.249632, -0.1359511, 1, 1, 1, 1, 1,
-0.3855081, 2.012433, -1.049532, 1, 1, 1, 1, 1,
-0.3818633, -0.6426176, -2.770859, 1, 1, 1, 1, 1,
-0.3810467, -0.908932, -1.180728, 1, 1, 1, 1, 1,
-0.3807057, -0.4895941, -2.187734, 1, 1, 1, 1, 1,
-0.3723155, -1.292224, -2.040525, 1, 1, 1, 1, 1,
-0.3671697, 1.404075, 0.467618, 1, 1, 1, 1, 1,
-0.3663726, 0.3560376, 0.05133102, 1, 1, 1, 1, 1,
-0.3620752, 0.6399544, -1.325621, 1, 1, 1, 1, 1,
-0.3577501, -0.6334907, -2.644037, 1, 1, 1, 1, 1,
-0.3552029, -0.9237099, -2.749282, 1, 1, 1, 1, 1,
-0.3535813, 0.09909542, -0.3722629, 1, 1, 1, 1, 1,
-0.3512216, -1.680894, -3.313408, 1, 1, 1, 1, 1,
-0.3511326, 0.229098, 1.48881, 1, 1, 1, 1, 1,
-0.3507122, 1.750145, 1.558785, 0, 0, 1, 1, 1,
-0.3497117, -0.2472956, -0.5346805, 1, 0, 0, 1, 1,
-0.3474288, -0.8372668, -2.829346, 1, 0, 0, 1, 1,
-0.3404833, -1.710205, -2.770447, 1, 0, 0, 1, 1,
-0.3345367, -0.671169, -3.66487, 1, 0, 0, 1, 1,
-0.3319601, 0.04964645, -1.785241, 1, 0, 0, 1, 1,
-0.3286148, -1.241168, -2.696579, 0, 0, 0, 1, 1,
-0.327443, -1.08939, -2.732005, 0, 0, 0, 1, 1,
-0.3207994, 0.6256673, -0.9243119, 0, 0, 0, 1, 1,
-0.3191897, 0.1871895, -1.400463, 0, 0, 0, 1, 1,
-0.317704, -0.3801772, -3.410972, 0, 0, 0, 1, 1,
-0.3126389, 0.9018479, 1.225196, 0, 0, 0, 1, 1,
-0.3057136, 0.3939933, -0.7651684, 0, 0, 0, 1, 1,
-0.2992119, 0.9445457, -0.1427668, 1, 1, 1, 1, 1,
-0.2979104, 1.437248, -0.815034, 1, 1, 1, 1, 1,
-0.2924196, -2.384513, -3.150226, 1, 1, 1, 1, 1,
-0.2890666, 0.3009569, -0.8888582, 1, 1, 1, 1, 1,
-0.2871332, 0.9469971, -1.1681, 1, 1, 1, 1, 1,
-0.2865354, 0.3694877, 0.8428746, 1, 1, 1, 1, 1,
-0.2855547, 0.2676354, -1.908158, 1, 1, 1, 1, 1,
-0.2809909, -0.1449204, 0.4930663, 1, 1, 1, 1, 1,
-0.2748987, 1.543856, -0.655226, 1, 1, 1, 1, 1,
-0.2719214, -0.4385736, -0.1412818, 1, 1, 1, 1, 1,
-0.2716563, -0.0676167, -1.587576, 1, 1, 1, 1, 1,
-0.2679545, -3.455048, -3.416273, 1, 1, 1, 1, 1,
-0.2670323, -0.9895886, -3.937289, 1, 1, 1, 1, 1,
-0.2663257, -0.6264492, -3.590187, 1, 1, 1, 1, 1,
-0.2637921, 0.01229778, -2.382281, 1, 1, 1, 1, 1,
-0.2630333, -0.2039583, -2.010389, 0, 0, 1, 1, 1,
-0.2569309, 2.510041, -1.33516, 1, 0, 0, 1, 1,
-0.2568356, 0.1923549, -2.493931, 1, 0, 0, 1, 1,
-0.2543832, -0.6610973, -2.450646, 1, 0, 0, 1, 1,
-0.2449556, 0.4017139, 0.7617059, 1, 0, 0, 1, 1,
-0.2437477, -1.166837, -3.210894, 1, 0, 0, 1, 1,
-0.2381539, -1.342562, -2.029041, 0, 0, 0, 1, 1,
-0.2371382, -0.4820222, -3.568297, 0, 0, 0, 1, 1,
-0.2369933, 0.6964597, -0.2329579, 0, 0, 0, 1, 1,
-0.2337112, 2.347159, -0.4039307, 0, 0, 0, 1, 1,
-0.2315517, 0.6250699, -0.4154377, 0, 0, 0, 1, 1,
-0.2290975, -0.316749, -3.597543, 0, 0, 0, 1, 1,
-0.2272961, 2.62717, 2.662539, 0, 0, 0, 1, 1,
-0.2262915, 1.023921, -1.249211, 1, 1, 1, 1, 1,
-0.2232287, 1.605063, -0.4380355, 1, 1, 1, 1, 1,
-0.2158749, 0.4078696, -0.2590346, 1, 1, 1, 1, 1,
-0.2097683, -0.5380818, -3.057752, 1, 1, 1, 1, 1,
-0.2076686, 0.3035391, -0.4866134, 1, 1, 1, 1, 1,
-0.2037797, 0.4378814, -0.5489265, 1, 1, 1, 1, 1,
-0.2015821, -1.686502, -3.406833, 1, 1, 1, 1, 1,
-0.2007263, -1.953445, -3.681057, 1, 1, 1, 1, 1,
-0.2002948, -0.6186426, -3.646859, 1, 1, 1, 1, 1,
-0.1998423, 1.362374, 0.0771446, 1, 1, 1, 1, 1,
-0.1974885, -0.06274763, -3.253263, 1, 1, 1, 1, 1,
-0.1970708, 1.44861, 1.136717, 1, 1, 1, 1, 1,
-0.195259, 0.1363326, -1.261114, 1, 1, 1, 1, 1,
-0.1949986, -2.208664, -3.707744, 1, 1, 1, 1, 1,
-0.1945428, 0.2674193, -1.279674, 1, 1, 1, 1, 1,
-0.1933229, -1.240191, -3.827888, 0, 0, 1, 1, 1,
-0.1825106, -0.1806504, -1.215493, 1, 0, 0, 1, 1,
-0.1813642, -0.08367682, -2.258985, 1, 0, 0, 1, 1,
-0.1782507, 0.4603037, -1.416339, 1, 0, 0, 1, 1,
-0.1747113, -0.7017232, -2.735458, 1, 0, 0, 1, 1,
-0.1714336, 1.582403, -1.233432, 1, 0, 0, 1, 1,
-0.1694702, 0.4276308, -0.7377895, 0, 0, 0, 1, 1,
-0.1687219, 1.922013, -1.745453, 0, 0, 0, 1, 1,
-0.1666967, 2.550959, -0.6317258, 0, 0, 0, 1, 1,
-0.1657425, 0.9136521, 0.8029694, 0, 0, 0, 1, 1,
-0.1641394, -0.7741364, -2.88473, 0, 0, 0, 1, 1,
-0.1616412, -1.329196, -1.561082, 0, 0, 0, 1, 1,
-0.159243, 0.5752785, -0.382753, 0, 0, 0, 1, 1,
-0.1552407, 1.831688, -0.5379159, 1, 1, 1, 1, 1,
-0.1489868, -0.02590157, -2.061121, 1, 1, 1, 1, 1,
-0.147238, -0.4682723, -3.095405, 1, 1, 1, 1, 1,
-0.1453975, 0.8028427, -1.576826, 1, 1, 1, 1, 1,
-0.1445676, -0.4736975, -4.671166, 1, 1, 1, 1, 1,
-0.1440824, -0.6700069, -3.007488, 1, 1, 1, 1, 1,
-0.1437206, -0.3043959, -3.1315, 1, 1, 1, 1, 1,
-0.1420685, 0.02026252, -1.452177, 1, 1, 1, 1, 1,
-0.141542, -0.6522634, -2.411785, 1, 1, 1, 1, 1,
-0.1405116, 0.5913399, -1.43725, 1, 1, 1, 1, 1,
-0.138148, -0.3058232, -0.6842234, 1, 1, 1, 1, 1,
-0.1378554, -0.05343384, -1.766504, 1, 1, 1, 1, 1,
-0.1303857, -1.445935, -5.744504, 1, 1, 1, 1, 1,
-0.1282248, -0.05047239, -1.364402, 1, 1, 1, 1, 1,
-0.1255908, 0.2637299, -2.790139, 1, 1, 1, 1, 1,
-0.1251543, -0.6726921, -3.771127, 0, 0, 1, 1, 1,
-0.1220102, 1.185871, -0.1156186, 1, 0, 0, 1, 1,
-0.1198284, 1.117012, -0.668414, 1, 0, 0, 1, 1,
-0.1195978, 0.5316603, -0.8287857, 1, 0, 0, 1, 1,
-0.1194363, 0.1597695, 0.7748042, 1, 0, 0, 1, 1,
-0.1180603, 0.1238602, 1.110511, 1, 0, 0, 1, 1,
-0.115999, -0.3234294, -2.995404, 0, 0, 0, 1, 1,
-0.1132009, -0.860376, -2.073212, 0, 0, 0, 1, 1,
-0.111871, -0.3084428, -2.363343, 0, 0, 0, 1, 1,
-0.1090506, -0.6093454, -3.482059, 0, 0, 0, 1, 1,
-0.1060629, -0.03799852, -3.264134, 0, 0, 0, 1, 1,
-0.1026146, 0.312837, -1.909842, 0, 0, 0, 1, 1,
-0.1008795, -1.187584, -4.432309, 0, 0, 0, 1, 1,
-0.09774847, 1.148114, -0.155958, 1, 1, 1, 1, 1,
-0.09456835, 1.07808, 1.015661, 1, 1, 1, 1, 1,
-0.09339167, 0.467931, 2.232172, 1, 1, 1, 1, 1,
-0.09248087, 0.0605036, 0.9418711, 1, 1, 1, 1, 1,
-0.09176716, 0.8248678, 0.2474613, 1, 1, 1, 1, 1,
-0.09079595, 0.1514578, -0.4697025, 1, 1, 1, 1, 1,
-0.0894086, -0.5999891, -3.767263, 1, 1, 1, 1, 1,
-0.08832926, -1.070791, -4.11867, 1, 1, 1, 1, 1,
-0.08670559, -0.8277727, -3.292333, 1, 1, 1, 1, 1,
-0.08341178, -0.01011949, -1.877069, 1, 1, 1, 1, 1,
-0.08220418, 0.1029849, -0.276286, 1, 1, 1, 1, 1,
-0.08012466, 1.258819, -0.6206148, 1, 1, 1, 1, 1,
-0.07828113, 1.038582, -0.4962507, 1, 1, 1, 1, 1,
-0.07724417, 1.375668, -0.5391733, 1, 1, 1, 1, 1,
-0.07521874, -0.084228, -3.671783, 1, 1, 1, 1, 1,
-0.0738617, -2.043873, -2.150907, 0, 0, 1, 1, 1,
-0.07103811, 0.5169079, -1.372184, 1, 0, 0, 1, 1,
-0.06969032, -0.9092358, -0.6589858, 1, 0, 0, 1, 1,
-0.06752823, -0.1373515, -1.691501, 1, 0, 0, 1, 1,
-0.06577598, 0.4959415, -1.24131, 1, 0, 0, 1, 1,
-0.06327637, 0.6761032, -0.7706432, 1, 0, 0, 1, 1,
-0.06306331, 1.300729, 0.4066334, 0, 0, 0, 1, 1,
-0.05968661, 1.399048, 2.008055, 0, 0, 0, 1, 1,
-0.05843827, 0.6603165, 1.16005, 0, 0, 0, 1, 1,
-0.05644175, 2.504219, 0.06240319, 0, 0, 0, 1, 1,
-0.05245413, 0.2076984, 0.3499657, 0, 0, 0, 1, 1,
-0.04479241, -0.08006937, -0.2683213, 0, 0, 0, 1, 1,
-0.04451538, -0.7417859, -3.300062, 0, 0, 0, 1, 1,
-0.04261313, 2.19439, -0.563318, 1, 1, 1, 1, 1,
-0.04007327, 1.006587, -1.685917, 1, 1, 1, 1, 1,
-0.03719612, 0.5474659, -1.36509, 1, 1, 1, 1, 1,
-0.03502863, 1.300554, -1.95366, 1, 1, 1, 1, 1,
-0.03395675, -0.3369347, -3.102421, 1, 1, 1, 1, 1,
-0.03315156, -0.3548305, -2.313354, 1, 1, 1, 1, 1,
-0.03146752, -0.2535143, -3.628068, 1, 1, 1, 1, 1,
-0.03063194, 0.1223992, 0.8407229, 1, 1, 1, 1, 1,
-0.02954703, 1.745542, -0.5371383, 1, 1, 1, 1, 1,
-0.02557256, 1.90606, 0.3701918, 1, 1, 1, 1, 1,
-0.02538241, -1.426374, -2.515224, 1, 1, 1, 1, 1,
-0.02019288, -1.376889, -1.983358, 1, 1, 1, 1, 1,
-0.01932459, 1.320422, 1.275658, 1, 1, 1, 1, 1,
-0.01931155, 0.802147, -1.077743, 1, 1, 1, 1, 1,
-0.01385191, -1.21371, -3.720271, 1, 1, 1, 1, 1,
-0.009387466, -1.013453, -2.274325, 0, 0, 1, 1, 1,
-0.009085972, 0.1347494, 1.367162, 1, 0, 0, 1, 1,
-0.003234967, -0.5677174, -5.004645, 1, 0, 0, 1, 1,
-0.002318613, 1.642012, -1.209773, 1, 0, 0, 1, 1,
-0.002035946, -0.08939245, -3.5036, 1, 0, 0, 1, 1,
-0.001914808, -0.2125697, -3.417539, 1, 0, 0, 1, 1,
0.0007276776, -0.6918898, 3.530375, 0, 0, 0, 1, 1,
0.006580226, -2.320426, 4.39228, 0, 0, 0, 1, 1,
0.01061175, -1.406236, 2.417718, 0, 0, 0, 1, 1,
0.01610103, 0.5062437, -2.726198, 0, 0, 0, 1, 1,
0.02199253, -0.3087028, 2.79528, 0, 0, 0, 1, 1,
0.02297889, -0.3323703, 2.630077, 0, 0, 0, 1, 1,
0.03099128, 1.08598, 1.299587, 0, 0, 0, 1, 1,
0.0335376, -0.3377247, 3.990156, 1, 1, 1, 1, 1,
0.03403629, -1.157945, 1.631847, 1, 1, 1, 1, 1,
0.03472012, -0.7230572, 4.126564, 1, 1, 1, 1, 1,
0.04368798, -1.061268, 1.480634, 1, 1, 1, 1, 1,
0.04827986, 0.2998194, -0.00781645, 1, 1, 1, 1, 1,
0.04935582, -1.167539, 2.126476, 1, 1, 1, 1, 1,
0.04980687, -0.1121982, 2.752761, 1, 1, 1, 1, 1,
0.05031009, -1.182621, 4.426984, 1, 1, 1, 1, 1,
0.05216606, -0.7326189, 4.70286, 1, 1, 1, 1, 1,
0.05746694, -0.4244078, 4.184458, 1, 1, 1, 1, 1,
0.06018909, 1.694984, 0.8099899, 1, 1, 1, 1, 1,
0.0668468, 0.9178759, -0.07296764, 1, 1, 1, 1, 1,
0.06908114, -1.502151, 3.384, 1, 1, 1, 1, 1,
0.06918612, -0.1056927, 3.107246, 1, 1, 1, 1, 1,
0.06992748, -0.1861403, 3.301997, 1, 1, 1, 1, 1,
0.07314011, -0.1870722, 2.103507, 0, 0, 1, 1, 1,
0.07314477, -1.069928, 3.65995, 1, 0, 0, 1, 1,
0.0742932, -0.7418154, 2.595447, 1, 0, 0, 1, 1,
0.07791378, -0.7823921, 2.905853, 1, 0, 0, 1, 1,
0.07936092, 0.5929968, 1.054815, 1, 0, 0, 1, 1,
0.08358437, -0.7927903, 3.356267, 1, 0, 0, 1, 1,
0.08454588, 0.9784176, -0.8776795, 0, 0, 0, 1, 1,
0.0880276, -0.3004239, 1.918758, 0, 0, 0, 1, 1,
0.08869281, -0.7117155, 3.145676, 0, 0, 0, 1, 1,
0.089396, 1.325559, 0.125732, 0, 0, 0, 1, 1,
0.08999413, 0.3392304, -0.5916681, 0, 0, 0, 1, 1,
0.09459993, 0.7987294, -1.745129, 0, 0, 0, 1, 1,
0.09489189, 0.7427416, 0.3960472, 0, 0, 0, 1, 1,
0.100012, 0.4770356, -0.04241159, 1, 1, 1, 1, 1,
0.1024395, -0.7022993, 4.061332, 1, 1, 1, 1, 1,
0.1026051, -0.3657214, 4.706537, 1, 1, 1, 1, 1,
0.1057657, 0.0919024, 2.23931, 1, 1, 1, 1, 1,
0.1086496, 0.04678019, 1.612164, 1, 1, 1, 1, 1,
0.1102452, -0.8799267, 2.133668, 1, 1, 1, 1, 1,
0.1132544, 0.6286888, -0.8533156, 1, 1, 1, 1, 1,
0.1189963, -0.9438555, 3.721854, 1, 1, 1, 1, 1,
0.1193082, 0.05349924, 1.786425, 1, 1, 1, 1, 1,
0.121106, 1.873051, 0.4975968, 1, 1, 1, 1, 1,
0.1223955, -1.718772, 3.883067, 1, 1, 1, 1, 1,
0.1246344, 0.4017337, 0.8476804, 1, 1, 1, 1, 1,
0.1279887, 0.7654642, -0.1600382, 1, 1, 1, 1, 1,
0.1320894, -0.045207, 0.8440773, 1, 1, 1, 1, 1,
0.1321715, 0.9403133, -0.7753238, 1, 1, 1, 1, 1,
0.1321852, -0.02370034, 2.203149, 0, 0, 1, 1, 1,
0.1332257, -1.468635, 1.950998, 1, 0, 0, 1, 1,
0.1367347, -0.3776895, 3.575264, 1, 0, 0, 1, 1,
0.1397246, -0.2116544, 3.388422, 1, 0, 0, 1, 1,
0.1406531, 1.103893, -1.059474, 1, 0, 0, 1, 1,
0.1414687, 1.179518, 1.283883, 1, 0, 0, 1, 1,
0.1459642, -0.4497065, 2.494476, 0, 0, 0, 1, 1,
0.148482, 0.6674538, -0.007777261, 0, 0, 0, 1, 1,
0.1500636, 2.259799, 1.021667, 0, 0, 0, 1, 1,
0.1512882, -0.3630259, 2.249388, 0, 0, 0, 1, 1,
0.1536584, -1.129969, 4.338231, 0, 0, 0, 1, 1,
0.1556454, -1.779765, 3.51833, 0, 0, 0, 1, 1,
0.1589964, 0.09123989, 0.2002726, 0, 0, 0, 1, 1,
0.166147, 0.9312161, 1.042147, 1, 1, 1, 1, 1,
0.1725675, 1.619937, -0.3672936, 1, 1, 1, 1, 1,
0.1746392, -0.7318767, 4.790263, 1, 1, 1, 1, 1,
0.1796873, 0.2953716, 1.072105, 1, 1, 1, 1, 1,
0.1900053, -1.25982, 1.430976, 1, 1, 1, 1, 1,
0.194094, -0.6863853, 2.865351, 1, 1, 1, 1, 1,
0.1959356, -0.01105652, 1.425481, 1, 1, 1, 1, 1,
0.1962619, 0.9717376, -0.8435439, 1, 1, 1, 1, 1,
0.1970796, 0.3828436, 0.4758363, 1, 1, 1, 1, 1,
0.1988821, 0.552269, 0.9109327, 1, 1, 1, 1, 1,
0.2035737, 0.08055346, 1.537499, 1, 1, 1, 1, 1,
0.2061283, -0.2426194, 1.518987, 1, 1, 1, 1, 1,
0.2065329, 0.4876007, -1.886058, 1, 1, 1, 1, 1,
0.2092274, 1.06086, 0.6358094, 1, 1, 1, 1, 1,
0.2102508, -0.6220879, 1.490344, 1, 1, 1, 1, 1,
0.2169887, 1.027961, 0.5986404, 0, 0, 1, 1, 1,
0.2190713, 0.9580982, -1.553447, 1, 0, 0, 1, 1,
0.2207477, 1.321143, 0.7733414, 1, 0, 0, 1, 1,
0.2225227, 0.3033423, 0.5674056, 1, 0, 0, 1, 1,
0.2227444, 0.7777066, 0.7785556, 1, 0, 0, 1, 1,
0.2230812, -1.032177, 4.149363, 1, 0, 0, 1, 1,
0.2248687, -0.3367025, 2.48758, 0, 0, 0, 1, 1,
0.2252496, -0.1647685, 3.121961, 0, 0, 0, 1, 1,
0.2253707, 0.4394207, -0.1924038, 0, 0, 0, 1, 1,
0.2256173, -0.7184906, 3.386131, 0, 0, 0, 1, 1,
0.2275964, 0.1865136, 0.07909656, 0, 0, 0, 1, 1,
0.2277979, -0.551872, 2.858667, 0, 0, 0, 1, 1,
0.2317717, 1.558726, 0.4599744, 0, 0, 0, 1, 1,
0.2374887, -0.8759031, 2.491246, 1, 1, 1, 1, 1,
0.2393582, -0.8089676, -0.8515945, 1, 1, 1, 1, 1,
0.2404938, -0.5199728, 1.70514, 1, 1, 1, 1, 1,
0.242905, 0.232191, 0.8638101, 1, 1, 1, 1, 1,
0.2465854, 0.1142422, 0.8697699, 1, 1, 1, 1, 1,
0.2476364, 1.029209, -0.9491461, 1, 1, 1, 1, 1,
0.2493939, -0.8665568, 3.173251, 1, 1, 1, 1, 1,
0.2502989, 1.527032, 1.856875, 1, 1, 1, 1, 1,
0.2637164, -2.481855, 2.658465, 1, 1, 1, 1, 1,
0.2639575, 0.1544207, -0.8608798, 1, 1, 1, 1, 1,
0.2649818, -0.6075536, 2.442779, 1, 1, 1, 1, 1,
0.2666284, -0.2882187, 2.965019, 1, 1, 1, 1, 1,
0.2747629, -0.03654013, 1.174671, 1, 1, 1, 1, 1,
0.2750024, -0.06766144, 2.07329, 1, 1, 1, 1, 1,
0.2767259, -0.3744077, 2.493427, 1, 1, 1, 1, 1,
0.2772254, -1.123746, 2.395866, 0, 0, 1, 1, 1,
0.277833, 1.376136, 1.619501, 1, 0, 0, 1, 1,
0.2789109, 0.8773478, -0.1106234, 1, 0, 0, 1, 1,
0.2791797, -1.214341, 4.687353, 1, 0, 0, 1, 1,
0.279685, -1.146499, 4.146239, 1, 0, 0, 1, 1,
0.2808101, 0.4835803, 0.746984, 1, 0, 0, 1, 1,
0.2818923, 0.1213777, 0.3245288, 0, 0, 0, 1, 1,
0.2836493, 0.303322, -0.1502313, 0, 0, 0, 1, 1,
0.2879322, -1.064535, 3.490227, 0, 0, 0, 1, 1,
0.2963188, 1.606692, -0.6624553, 0, 0, 0, 1, 1,
0.2987601, -0.07601604, 1.887476, 0, 0, 0, 1, 1,
0.3043454, -1.300382, 4.175251, 0, 0, 0, 1, 1,
0.3047324, -0.4742779, 3.907398, 0, 0, 0, 1, 1,
0.3067808, -0.6460331, 0.5484573, 1, 1, 1, 1, 1,
0.3068244, 0.1590553, 0.1587323, 1, 1, 1, 1, 1,
0.3111112, 1.236242, -1.854943, 1, 1, 1, 1, 1,
0.3143525, 0.7341961, 1.583472, 1, 1, 1, 1, 1,
0.3158011, 0.1240712, -0.06059007, 1, 1, 1, 1, 1,
0.3201486, -1.445673, 2.623658, 1, 1, 1, 1, 1,
0.3241043, 0.5690529, 0.912901, 1, 1, 1, 1, 1,
0.3241214, 0.07104798, 0.7185558, 1, 1, 1, 1, 1,
0.3284022, -0.2318535, 1.201986, 1, 1, 1, 1, 1,
0.3345198, -0.9112265, 1.987908, 1, 1, 1, 1, 1,
0.3367882, -2.196631, 3.969428, 1, 1, 1, 1, 1,
0.3371593, -0.06996366, 0.8879365, 1, 1, 1, 1, 1,
0.3373651, -0.1779716, 2.930571, 1, 1, 1, 1, 1,
0.341661, -1.722564, 4.365927, 1, 1, 1, 1, 1,
0.3425833, -1.378754, 1.952544, 1, 1, 1, 1, 1,
0.3465886, -0.8839219, 3.89101, 0, 0, 1, 1, 1,
0.3484881, -0.4627777, 1.654987, 1, 0, 0, 1, 1,
0.3536813, -0.450653, 2.792045, 1, 0, 0, 1, 1,
0.3549324, -0.4637325, 1.337677, 1, 0, 0, 1, 1,
0.3557436, -0.2159565, 2.177796, 1, 0, 0, 1, 1,
0.3561006, -1.068663, 3.557435, 1, 0, 0, 1, 1,
0.3562464, 0.3209428, 1.389668, 0, 0, 0, 1, 1,
0.3574055, 1.06741, -0.3089601, 0, 0, 0, 1, 1,
0.3606334, 1.269738, 0.2451181, 0, 0, 0, 1, 1,
0.3622523, 0.8982468, -0.5586134, 0, 0, 0, 1, 1,
0.3669098, -1.473634, 2.052633, 0, 0, 0, 1, 1,
0.3671535, -0.4633534, 0.8075808, 0, 0, 0, 1, 1,
0.3695251, -0.2194821, 2.543187, 0, 0, 0, 1, 1,
0.3712123, -0.7737108, 4.184111, 1, 1, 1, 1, 1,
0.3717649, 2.299977, 1.281061, 1, 1, 1, 1, 1,
0.3727412, 1.26145, 0.2316769, 1, 1, 1, 1, 1,
0.3747746, 0.7389763, 1.349946, 1, 1, 1, 1, 1,
0.3753072, 2.129291, 0.4454556, 1, 1, 1, 1, 1,
0.3775237, 2.250257, -0.4526846, 1, 1, 1, 1, 1,
0.3816173, 0.8812997, -0.455393, 1, 1, 1, 1, 1,
0.3818777, 0.2458276, 0.1375173, 1, 1, 1, 1, 1,
0.3821837, -0.2323296, 0.6286046, 1, 1, 1, 1, 1,
0.3856981, 0.1762764, 1.616071, 1, 1, 1, 1, 1,
0.3882766, -1.305415, 3.591156, 1, 1, 1, 1, 1,
0.3893514, 0.6102822, -0.9994628, 1, 1, 1, 1, 1,
0.3928111, -1.91011, 3.72296, 1, 1, 1, 1, 1,
0.3941835, 0.8070719, -0.9711149, 1, 1, 1, 1, 1,
0.3951938, -1.311594, 2.691518, 1, 1, 1, 1, 1,
0.3971184, -0.7919753, 2.183686, 0, 0, 1, 1, 1,
0.3994823, -0.5096236, 2.625636, 1, 0, 0, 1, 1,
0.3998394, 1.923607, 0.5245035, 1, 0, 0, 1, 1,
0.400818, 0.3209021, 0.9951121, 1, 0, 0, 1, 1,
0.4014419, -0.03780751, 3.045948, 1, 0, 0, 1, 1,
0.4035785, 0.6073958, 1.269659, 1, 0, 0, 1, 1,
0.4093675, 1.369445, 2.480055, 0, 0, 0, 1, 1,
0.4097916, -0.3494179, 2.952887, 0, 0, 0, 1, 1,
0.4111055, 0.3154391, 2.444083, 0, 0, 0, 1, 1,
0.4139204, 0.1262857, 1.718583, 0, 0, 0, 1, 1,
0.4331477, 0.4102929, 2.068391, 0, 0, 0, 1, 1,
0.4391279, 0.953435, -0.03783184, 0, 0, 0, 1, 1,
0.4416591, -1.755366, 2.875074, 0, 0, 0, 1, 1,
0.4433599, 0.0205403, 1.775679, 1, 1, 1, 1, 1,
0.4488959, -0.87261, 3.225228, 1, 1, 1, 1, 1,
0.4510285, -0.009591397, 1.985464, 1, 1, 1, 1, 1,
0.4516232, 1.108407, 0.503137, 1, 1, 1, 1, 1,
0.4535932, 0.7098929, 1.904948, 1, 1, 1, 1, 1,
0.4538767, 0.0215344, 1.103094, 1, 1, 1, 1, 1,
0.4576573, -1.228332, 4.519474, 1, 1, 1, 1, 1,
0.4577734, -0.09272551, 0.7972705, 1, 1, 1, 1, 1,
0.4631083, 0.959713, 0.3079661, 1, 1, 1, 1, 1,
0.4684306, 1.385093, 0.5075195, 1, 1, 1, 1, 1,
0.4770381, 0.9633037, 0.3217223, 1, 1, 1, 1, 1,
0.4834756, -0.4482371, 4.559964, 1, 1, 1, 1, 1,
0.4835231, -0.9474241, 3.215705, 1, 1, 1, 1, 1,
0.4845049, -0.4556011, 1.075627, 1, 1, 1, 1, 1,
0.4855962, -0.2009314, 2.152289, 1, 1, 1, 1, 1,
0.4878963, 0.04602771, 2.99353, 0, 0, 1, 1, 1,
0.4895609, -1.19217, 2.940487, 1, 0, 0, 1, 1,
0.4898023, -0.8321531, 3.951313, 1, 0, 0, 1, 1,
0.4924185, 1.295768, 1.182939, 1, 0, 0, 1, 1,
0.4978698, -0.1140279, 3.261951, 1, 0, 0, 1, 1,
0.4983067, -1.540153, 1.739643, 1, 0, 0, 1, 1,
0.5051279, -1.062993, 2.451891, 0, 0, 0, 1, 1,
0.5087869, 2.434849, 1.203797, 0, 0, 0, 1, 1,
0.5120389, -0.3975648, 3.030352, 0, 0, 0, 1, 1,
0.5200899, -1.56896, 2.815592, 0, 0, 0, 1, 1,
0.5287039, -1.436501, 3.78145, 0, 0, 0, 1, 1,
0.5295526, 0.6538523, -0.3390678, 0, 0, 0, 1, 1,
0.5334244, -0.6534377, 3.467961, 0, 0, 0, 1, 1,
0.5364037, -0.9677408, 3.459383, 1, 1, 1, 1, 1,
0.5403308, -0.5574406, 0.7311109, 1, 1, 1, 1, 1,
0.5403922, 0.7586324, -0.0262431, 1, 1, 1, 1, 1,
0.5439004, -0.03057536, -0.09508839, 1, 1, 1, 1, 1,
0.5467788, 1.09375, 0.06838005, 1, 1, 1, 1, 1,
0.5497487, -1.365869, 1.964674, 1, 1, 1, 1, 1,
0.5506231, -0.8404323, 4.240369, 1, 1, 1, 1, 1,
0.5547122, 1.408546, 1.178292, 1, 1, 1, 1, 1,
0.5561144, -0.705512, 3.61084, 1, 1, 1, 1, 1,
0.5561477, 0.0546244, 1.804441, 1, 1, 1, 1, 1,
0.5586033, 0.9496223, -0.6597427, 1, 1, 1, 1, 1,
0.5591673, -0.965937, 1.733157, 1, 1, 1, 1, 1,
0.5623878, 1.494547, -0.3602015, 1, 1, 1, 1, 1,
0.5636208, 0.9013285, 1.083756, 1, 1, 1, 1, 1,
0.5669848, -0.3824996, 3.198389, 1, 1, 1, 1, 1,
0.5688205, 0.6603042, 1.873577, 0, 0, 1, 1, 1,
0.569097, 1.376746, -1.497322, 1, 0, 0, 1, 1,
0.5716668, 0.2316569, 3.129301, 1, 0, 0, 1, 1,
0.5724708, 0.5940802, 0.6864712, 1, 0, 0, 1, 1,
0.5780505, 0.2267517, 0.4669826, 1, 0, 0, 1, 1,
0.5805076, -0.5252523, 2.206174, 1, 0, 0, 1, 1,
0.5805174, 0.3513833, 2.782045, 0, 0, 0, 1, 1,
0.5818386, -0.2795318, 2.581182, 0, 0, 0, 1, 1,
0.5844777, 2.065452, 0.981755, 0, 0, 0, 1, 1,
0.5872248, 0.7925373, 1.592201, 0, 0, 0, 1, 1,
0.598838, -0.6466285, 3.917562, 0, 0, 0, 1, 1,
0.6002512, -2.468256, 3.00616, 0, 0, 0, 1, 1,
0.6049967, 0.738198, 2.357672, 0, 0, 0, 1, 1,
0.6065263, -0.8336655, 3.461885, 1, 1, 1, 1, 1,
0.6103388, -1.070535, 3.075241, 1, 1, 1, 1, 1,
0.6116048, -0.3509702, 2.131774, 1, 1, 1, 1, 1,
0.6118735, -0.3746, 2.835715, 1, 1, 1, 1, 1,
0.6131251, -1.197127, 2.803421, 1, 1, 1, 1, 1,
0.6173039, -0.7151576, 0.5064198, 1, 1, 1, 1, 1,
0.624598, 0.374387, 1.96298, 1, 1, 1, 1, 1,
0.6249575, 0.946609, 1.549094, 1, 1, 1, 1, 1,
0.6275628, 0.5692412, 0.1728062, 1, 1, 1, 1, 1,
0.6398754, 2.029563, -1.337471, 1, 1, 1, 1, 1,
0.6423374, 1.204293, -1.318328, 1, 1, 1, 1, 1,
0.6448378, -1.29567, 2.682661, 1, 1, 1, 1, 1,
0.6490729, -0.3027571, 2.095365, 1, 1, 1, 1, 1,
0.6503414, -0.03375886, 2.573965, 1, 1, 1, 1, 1,
0.668563, -0.2527515, 2.25711, 1, 1, 1, 1, 1,
0.6715896, -0.9777918, 3.588485, 0, 0, 1, 1, 1,
0.6724997, -0.7556688, 3.346385, 1, 0, 0, 1, 1,
0.6737218, -0.7667653, 2.709378, 1, 0, 0, 1, 1,
0.6744848, -0.2309242, 2.788422, 1, 0, 0, 1, 1,
0.6792846, 1.523, 0.811497, 1, 0, 0, 1, 1,
0.6802984, -0.4321705, 1.531516, 1, 0, 0, 1, 1,
0.6899572, 0.1441133, 2.028163, 0, 0, 0, 1, 1,
0.698247, 0.8533093, 0.8893222, 0, 0, 0, 1, 1,
0.701093, -1.118716, 1.66261, 0, 0, 0, 1, 1,
0.702372, -0.3913112, 1.090923, 0, 0, 0, 1, 1,
0.7046102, 1.344795, 2.042905, 0, 0, 0, 1, 1,
0.7056931, 0.8958628, -0.6782216, 0, 0, 0, 1, 1,
0.7072245, -0.3216264, 0.9539226, 0, 0, 0, 1, 1,
0.7127512, -0.4743196, 1.131487, 1, 1, 1, 1, 1,
0.7187169, 0.4565097, 1.842246, 1, 1, 1, 1, 1,
0.7277295, -1.544535, 3.677407, 1, 1, 1, 1, 1,
0.7462039, -0.08530606, 1.470292, 1, 1, 1, 1, 1,
0.7488065, 0.4626254, 2.045924, 1, 1, 1, 1, 1,
0.7523321, -1.077835, 2.350155, 1, 1, 1, 1, 1,
0.7530248, -0.05442886, 0.9851497, 1, 1, 1, 1, 1,
0.7532011, 0.1550574, -0.1092858, 1, 1, 1, 1, 1,
0.753923, 1.706597, 0.7398328, 1, 1, 1, 1, 1,
0.7637203, -0.6498397, 4.396908, 1, 1, 1, 1, 1,
0.7780898, -0.2286599, 0.6696729, 1, 1, 1, 1, 1,
0.7789173, 1.155946, -1.305114, 1, 1, 1, 1, 1,
0.7847525, 1.942061, 1.636334, 1, 1, 1, 1, 1,
0.800937, -0.8004676, 3.509167, 1, 1, 1, 1, 1,
0.8017151, -0.242869, 3.260803, 1, 1, 1, 1, 1,
0.8031601, 0.7561824, -0.1296681, 0, 0, 1, 1, 1,
0.8046621, 0.2573016, 1.339046, 1, 0, 0, 1, 1,
0.807257, -0.6798164, 2.364316, 1, 0, 0, 1, 1,
0.8117023, 0.1855253, 1.832018, 1, 0, 0, 1, 1,
0.8149381, -1.208603, 3.870223, 1, 0, 0, 1, 1,
0.8223314, 0.7431202, 3.306213, 1, 0, 0, 1, 1,
0.8256786, -0.01325773, 1.604526, 0, 0, 0, 1, 1,
0.8283027, 0.3064319, 2.949893, 0, 0, 0, 1, 1,
0.8310395, -0.8156873, 2.686153, 0, 0, 0, 1, 1,
0.8378114, 0.3386201, 3.951086, 0, 0, 0, 1, 1,
0.8435206, 0.325637, 1.007528, 0, 0, 0, 1, 1,
0.8448713, 1.07585, 0.05533145, 0, 0, 0, 1, 1,
0.8467724, -0.1881744, 3.22613, 0, 0, 0, 1, 1,
0.8524331, -1.869031, 2.493474, 1, 1, 1, 1, 1,
0.8566751, -2.164907, 2.478473, 1, 1, 1, 1, 1,
0.8610167, 0.5002598, 0.6800853, 1, 1, 1, 1, 1,
0.8675996, -0.2902034, 0.6945174, 1, 1, 1, 1, 1,
0.8794114, -0.01778848, 1.066689, 1, 1, 1, 1, 1,
0.883855, -0.1164002, 1.00987, 1, 1, 1, 1, 1,
0.8914932, 0.2998819, -0.209152, 1, 1, 1, 1, 1,
0.8997525, -0.5810584, 2.945971, 1, 1, 1, 1, 1,
0.9040193, -0.2749974, 2.764849, 1, 1, 1, 1, 1,
0.9064706, -0.6013983, 1.022855, 1, 1, 1, 1, 1,
0.9133979, -1.000955, 2.297307, 1, 1, 1, 1, 1,
0.9187336, -1.718727, 3.742917, 1, 1, 1, 1, 1,
0.9189789, 2.00618, 1.662263, 1, 1, 1, 1, 1,
0.9323803, 1.046218, 1.643749, 1, 1, 1, 1, 1,
0.9374868, 0.09673347, 2.263134, 1, 1, 1, 1, 1,
0.9415951, -0.8233402, 1.18015, 0, 0, 1, 1, 1,
0.9431489, 1.2906, -0.2342495, 1, 0, 0, 1, 1,
0.9477229, -0.3421501, 1.897258, 1, 0, 0, 1, 1,
0.9494199, 0.7061313, 0.5977628, 1, 0, 0, 1, 1,
0.9513589, -0.3222377, 0.8630779, 1, 0, 0, 1, 1,
0.9547479, 1.048626, 0.03792234, 1, 0, 0, 1, 1,
0.9617933, -0.1459552, 1.959925, 0, 0, 0, 1, 1,
0.9659486, 2.270315, 0.4668514, 0, 0, 0, 1, 1,
0.968989, 0.3571897, -0.4527243, 0, 0, 0, 1, 1,
0.9696708, -1.248948, 4.495269, 0, 0, 0, 1, 1,
0.9713545, 0.9340452, 1.786494, 0, 0, 0, 1, 1,
0.9714778, -1.192963, 2.688025, 0, 0, 0, 1, 1,
0.9793884, 0.7757072, 2.023131, 0, 0, 0, 1, 1,
0.98072, 0.3808679, 0.9691166, 1, 1, 1, 1, 1,
0.9852812, 0.6901991, 1.212027, 1, 1, 1, 1, 1,
0.9857164, -1.115944, 2.999991, 1, 1, 1, 1, 1,
0.9953333, 0.4084617, 1.284319, 1, 1, 1, 1, 1,
0.9983957, 0.08681741, 1.00668, 1, 1, 1, 1, 1,
1.000998, 0.709508, 1.156902, 1, 1, 1, 1, 1,
1.001173, -0.2291863, 1.630018, 1, 1, 1, 1, 1,
1.006516, -0.3889945, 1.0743, 1, 1, 1, 1, 1,
1.011572, 0.4848624, 0.407503, 1, 1, 1, 1, 1,
1.014834, -1.093642, 0.7529618, 1, 1, 1, 1, 1,
1.022201, -1.773755, 3.886443, 1, 1, 1, 1, 1,
1.026219, -0.7408971, 3.438462, 1, 1, 1, 1, 1,
1.034973, -0.6634662, 2.805319, 1, 1, 1, 1, 1,
1.037012, -1.715376, 3.17768, 1, 1, 1, 1, 1,
1.040519, -1.325743, 2.445746, 1, 1, 1, 1, 1,
1.042842, 0.2296456, 2.567594, 0, 0, 1, 1, 1,
1.047772, -0.8769625, 2.826683, 1, 0, 0, 1, 1,
1.04811, 0.08845773, 0.5569302, 1, 0, 0, 1, 1,
1.048361, 1.069066, 2.387057, 1, 0, 0, 1, 1,
1.050589, -0.8665353, 1.165888, 1, 0, 0, 1, 1,
1.059984, 2.097958, 2.28777, 1, 0, 0, 1, 1,
1.060701, 1.629131, 0.3634268, 0, 0, 0, 1, 1,
1.064287, -0.3763308, 1.979666, 0, 0, 0, 1, 1,
1.069185, -1.167335, 2.819314, 0, 0, 0, 1, 1,
1.069678, -0.1395566, 2.098912, 0, 0, 0, 1, 1,
1.071737, -0.3032977, 1.160338, 0, 0, 0, 1, 1,
1.075609, 2.170903, -1.234942, 0, 0, 0, 1, 1,
1.076881, 1.662855, 0.3502195, 0, 0, 0, 1, 1,
1.078085, 0.7905145, 2.56275, 1, 1, 1, 1, 1,
1.078304, -0.2727622, 2.503409, 1, 1, 1, 1, 1,
1.07934, 0.01636359, 0.7071283, 1, 1, 1, 1, 1,
1.094468, -1.447845, 4.377389, 1, 1, 1, 1, 1,
1.09616, 0.1463541, 2.745153, 1, 1, 1, 1, 1,
1.102086, -0.1227443, 1.274192, 1, 1, 1, 1, 1,
1.102695, -1.34974, 0.5127161, 1, 1, 1, 1, 1,
1.10312, -0.1833401, 1.321819, 1, 1, 1, 1, 1,
1.104488, -2.81128, 2.565735, 1, 1, 1, 1, 1,
1.106405, -0.09181143, 0.484851, 1, 1, 1, 1, 1,
1.113663, 0.246508, 0.1692378, 1, 1, 1, 1, 1,
1.114065, -0.4684485, 1.31545, 1, 1, 1, 1, 1,
1.121682, -0.381364, 3.495471, 1, 1, 1, 1, 1,
1.125775, -2.890276, 1.993822, 1, 1, 1, 1, 1,
1.129314, -1.006007, 1.904978, 1, 1, 1, 1, 1,
1.129968, 0.01558609, 1.529909, 0, 0, 1, 1, 1,
1.153048, 0.4345224, 0.9273944, 1, 0, 0, 1, 1,
1.156319, 0.4120478, 1.575014, 1, 0, 0, 1, 1,
1.158834, 0.1861605, 1.026659, 1, 0, 0, 1, 1,
1.160618, 1.800707, 0.7403235, 1, 0, 0, 1, 1,
1.169926, 1.104893, -1.096111, 1, 0, 0, 1, 1,
1.1733, -0.3491493, 1.527088, 0, 0, 0, 1, 1,
1.173951, 0.5935153, 0.5072476, 0, 0, 0, 1, 1,
1.176677, 0.5917839, 2.484677, 0, 0, 0, 1, 1,
1.181619, -2.427851, 3.604721, 0, 0, 0, 1, 1,
1.185702, 0.1825635, 1.439117, 0, 0, 0, 1, 1,
1.193613, 0.2405668, 0.6032058, 0, 0, 0, 1, 1,
1.194052, 0.6466802, 3.078988, 0, 0, 0, 1, 1,
1.207738, 1.047136, 3.408556, 1, 1, 1, 1, 1,
1.209339, -3.036728, 2.017426, 1, 1, 1, 1, 1,
1.213608, -0.5762906, 3.631848, 1, 1, 1, 1, 1,
1.218859, -0.1044349, 1.565408, 1, 1, 1, 1, 1,
1.223247, 0.6098937, 2.149637, 1, 1, 1, 1, 1,
1.237654, -1.864937, 1.823226, 1, 1, 1, 1, 1,
1.238702, 0.9283852, 0.6372662, 1, 1, 1, 1, 1,
1.249151, -0.3349627, 1.852772, 1, 1, 1, 1, 1,
1.262938, -0.2449298, 2.787994, 1, 1, 1, 1, 1,
1.27155, -2.198805, 2.579245, 1, 1, 1, 1, 1,
1.272912, -0.3634759, 1.921575, 1, 1, 1, 1, 1,
1.276518, -1.063232, 1.560487, 1, 1, 1, 1, 1,
1.282475, -0.9993008, 2.025704, 1, 1, 1, 1, 1,
1.282818, -1.343057, 1.87883, 1, 1, 1, 1, 1,
1.290247, 0.6186253, 3.298175, 1, 1, 1, 1, 1,
1.290529, 1.20401, -0.7186447, 0, 0, 1, 1, 1,
1.317526, 1.326883, 1.772491, 1, 0, 0, 1, 1,
1.323442, -0.5172195, 2.968426, 1, 0, 0, 1, 1,
1.324337, -1.153113, 1.659289, 1, 0, 0, 1, 1,
1.326898, 0.5620345, 0.2528322, 1, 0, 0, 1, 1,
1.327538, 1.711762, 2.042002, 1, 0, 0, 1, 1,
1.332108, -0.5306323, 0.4579453, 0, 0, 0, 1, 1,
1.334, -0.6858044, 2.660412, 0, 0, 0, 1, 1,
1.334489, -0.6173975, 0.4286521, 0, 0, 0, 1, 1,
1.338487, -0.3220558, 3.387231, 0, 0, 0, 1, 1,
1.347533, -0.8252054, 0.3606526, 0, 0, 0, 1, 1,
1.348899, 0.2390134, 2.000934, 0, 0, 0, 1, 1,
1.350544, 0.62011, 2.633082, 0, 0, 0, 1, 1,
1.352839, -0.4977752, 1.185462, 1, 1, 1, 1, 1,
1.353104, -0.3723593, 2.516653, 1, 1, 1, 1, 1,
1.354525, -0.8536816, 1.942152, 1, 1, 1, 1, 1,
1.356843, 2.396497, 2.738564, 1, 1, 1, 1, 1,
1.357076, 0.8784097, 0.7541397, 1, 1, 1, 1, 1,
1.36051, -0.6029593, 1.900094, 1, 1, 1, 1, 1,
1.366457, 0.9662701, 0.6662854, 1, 1, 1, 1, 1,
1.379218, -0.9111161, 1.788579, 1, 1, 1, 1, 1,
1.380344, -1.215123, 1.067547, 1, 1, 1, 1, 1,
1.382405, 0.2568749, -0.6273799, 1, 1, 1, 1, 1,
1.387663, 1.33618, -0.553616, 1, 1, 1, 1, 1,
1.393679, 1.632984, 0.6889105, 1, 1, 1, 1, 1,
1.412368, 1.938713, -2.20425, 1, 1, 1, 1, 1,
1.415943, -0.09490961, 1.480868, 1, 1, 1, 1, 1,
1.425621, 0.1110135, 1.088148, 1, 1, 1, 1, 1,
1.427317, -0.1641628, 2.425527, 0, 0, 1, 1, 1,
1.432572, -2.312044, 2.533337, 1, 0, 0, 1, 1,
1.435081, -2.328032, 1.865741, 1, 0, 0, 1, 1,
1.445448, 1.164839, 0.6247607, 1, 0, 0, 1, 1,
1.452101, -0.7251804, 2.276236, 1, 0, 0, 1, 1,
1.458574, 0.838806, 0.6479669, 1, 0, 0, 1, 1,
1.464174, -0.8105731, 0.8465623, 0, 0, 0, 1, 1,
1.465601, -1.231505, 2.273528, 0, 0, 0, 1, 1,
1.47547, 0.8404096, 1.917952, 0, 0, 0, 1, 1,
1.476895, 0.8809065, 0.2452993, 0, 0, 0, 1, 1,
1.482129, 0.04892794, 1.388188, 0, 0, 0, 1, 1,
1.484161, 0.1786799, 1.03868, 0, 0, 0, 1, 1,
1.488464, 0.3480845, -1.500514, 0, 0, 0, 1, 1,
1.502493, -0.3231992, 2.295346, 1, 1, 1, 1, 1,
1.503006, 0.4796911, -0.1163684, 1, 1, 1, 1, 1,
1.505212, -0.8881829, 2.076868, 1, 1, 1, 1, 1,
1.513771, 0.4053349, 3.311029, 1, 1, 1, 1, 1,
1.524287, 1.003863, 2.785494, 1, 1, 1, 1, 1,
1.549215, -0.2731084, 1.646523, 1, 1, 1, 1, 1,
1.5527, 0.4870706, 2.658683, 1, 1, 1, 1, 1,
1.565009, 1.094402, 0.7668929, 1, 1, 1, 1, 1,
1.566656, 1.679601, 1.769668, 1, 1, 1, 1, 1,
1.575371, 0.4433963, 2.213762, 1, 1, 1, 1, 1,
1.577434, -1.160845, 3.450201, 1, 1, 1, 1, 1,
1.583441, 0.9772509, 0.05921644, 1, 1, 1, 1, 1,
1.587706, 0.779179, 1.046953, 1, 1, 1, 1, 1,
1.595898, -0.6343325, 1.052804, 1, 1, 1, 1, 1,
1.597923, -0.2498836, 3.715334, 1, 1, 1, 1, 1,
1.598983, -0.7798338, 2.238927, 0, 0, 1, 1, 1,
1.606555, -0.6268764, 1.46571, 1, 0, 0, 1, 1,
1.616212, 0.2956046, 2.992222, 1, 0, 0, 1, 1,
1.636543, 1.067904, 0.3683988, 1, 0, 0, 1, 1,
1.654457, -2.10508, 3.46836, 1, 0, 0, 1, 1,
1.662981, -1.270034, 2.454138, 1, 0, 0, 1, 1,
1.674146, 0.789303, 1.32867, 0, 0, 0, 1, 1,
1.677614, 1.59757, 0.1027937, 0, 0, 0, 1, 1,
1.692487, -0.3260857, 2.114017, 0, 0, 0, 1, 1,
1.709965, -0.6841766, 1.300424, 0, 0, 0, 1, 1,
1.721777, -0.6724504, -0.49059, 0, 0, 0, 1, 1,
1.724495, -0.4874894, 1.495859, 0, 0, 0, 1, 1,
1.742685, 0.9314118, 2.050929, 0, 0, 0, 1, 1,
1.751305, 0.4944839, 2.847763, 1, 1, 1, 1, 1,
1.753549, 1.585749, 0.4071801, 1, 1, 1, 1, 1,
1.757015, -1.594009, 1.134223, 1, 1, 1, 1, 1,
1.772003, -0.3467072, 2.279997, 1, 1, 1, 1, 1,
1.772474, -0.7954146, 2.098288, 1, 1, 1, 1, 1,
1.802141, 0.5941142, 1.273779, 1, 1, 1, 1, 1,
1.818984, -0.8767512, 1.765659, 1, 1, 1, 1, 1,
1.823187, -1.37406, 1.720373, 1, 1, 1, 1, 1,
1.848689, 0.7552119, 1.410899, 1, 1, 1, 1, 1,
1.866221, 0.4857696, 1.245694, 1, 1, 1, 1, 1,
1.955283, -0.1121535, 0.7093172, 1, 1, 1, 1, 1,
2.00754, -1.111394, 2.428718, 1, 1, 1, 1, 1,
2.023676, 0.1836064, 1.172333, 1, 1, 1, 1, 1,
2.032881, -0.9147481, 0.3241141, 1, 1, 1, 1, 1,
2.038465, -0.353011, 2.012078, 1, 1, 1, 1, 1,
2.064831, -0.2078902, 1.402651, 0, 0, 1, 1, 1,
2.108801, -0.6931139, 3.072005, 1, 0, 0, 1, 1,
2.125574, 0.766234, 0.5918335, 1, 0, 0, 1, 1,
2.127045, -0.1001245, 1.242852, 1, 0, 0, 1, 1,
2.155637, 0.7688875, -0.1132225, 1, 0, 0, 1, 1,
2.16142, 0.4857019, 2.142777, 1, 0, 0, 1, 1,
2.167366, -0.4917376, 2.469828, 0, 0, 0, 1, 1,
2.18247, 0.856702, 0.9083798, 0, 0, 0, 1, 1,
2.209159, 0.2184664, 0.9971564, 0, 0, 0, 1, 1,
2.215657, 0.4774944, 2.48638, 0, 0, 0, 1, 1,
2.228418, -0.1501078, 2.991183, 0, 0, 0, 1, 1,
2.260634, -0.04755009, 2.943803, 0, 0, 0, 1, 1,
2.342974, 0.8087403, 1.263326, 0, 0, 0, 1, 1,
2.423023, -0.1855964, 1.06952, 1, 1, 1, 1, 1,
2.432969, 0.08533717, 3.614242, 1, 1, 1, 1, 1,
2.497391, 0.3194748, 1.394816, 1, 1, 1, 1, 1,
2.533649, -0.7759213, 0.3237362, 1, 1, 1, 1, 1,
2.664395, -1.467231, 2.41475, 1, 1, 1, 1, 1,
2.82922, -0.8997422, 2.348458, 1, 1, 1, 1, 1,
2.874311, 1.020306, -0.04622839, 1, 1, 1, 1, 1
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
var radius = 9.603461;
var distance = 33.73175;
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
mvMatrix.translate( 0.3526427, 0.2317495, 0.5750196 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.73175);
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
