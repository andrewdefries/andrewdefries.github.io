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
-2.577698, 0.5571137, -2.727215, 1, 0, 0, 1,
-2.551545, -0.6073129, -1.235016, 1, 0.007843138, 0, 1,
-2.501202, 1.215592, -0.3644338, 1, 0.01176471, 0, 1,
-2.44342, -1.518643, -0.3090531, 1, 0.01960784, 0, 1,
-2.398789, -0.8398325, -1.703352, 1, 0.02352941, 0, 1,
-2.292409, -0.2289543, -1.874816, 1, 0.03137255, 0, 1,
-2.270918, -0.2612597, -0.1461158, 1, 0.03529412, 0, 1,
-2.22422, -0.2390633, -2.175838, 1, 0.04313726, 0, 1,
-2.217876, 0.8369843, -0.8511233, 1, 0.04705882, 0, 1,
-2.207125, -0.3829504, -2.175806, 1, 0.05490196, 0, 1,
-2.204243, 1.098661, -1.730193, 1, 0.05882353, 0, 1,
-2.190765, -0.07291458, -1.275537, 1, 0.06666667, 0, 1,
-2.149708, -0.508359, -3.22262, 1, 0.07058824, 0, 1,
-2.0818, 0.5680249, -1.052089, 1, 0.07843138, 0, 1,
-2.069716, 0.9267349, -2.220981, 1, 0.08235294, 0, 1,
-2.066688, 0.9811754, -2.930182, 1, 0.09019608, 0, 1,
-2.05913, -0.8314275, -2.196601, 1, 0.09411765, 0, 1,
-2.022376, -0.2022671, -1.215261, 1, 0.1019608, 0, 1,
-2.021425, 2.083465, 0.7170713, 1, 0.1098039, 0, 1,
-1.965388, 1.23946, -0.2032832, 1, 0.1137255, 0, 1,
-1.949129, -2.220675, -0.8370107, 1, 0.1215686, 0, 1,
-1.942204, -0.1188758, -3.374274, 1, 0.1254902, 0, 1,
-1.911618, -1.866508, -1.145526, 1, 0.1333333, 0, 1,
-1.909082, 0.8858695, -0.9872677, 1, 0.1372549, 0, 1,
-1.892192, 1.232916, -0.1978583, 1, 0.145098, 0, 1,
-1.857034, 0.8115579, -0.885664, 1, 0.1490196, 0, 1,
-1.839457, 0.8945357, 0.001794209, 1, 0.1568628, 0, 1,
-1.822743, 1.088066, -3.070361, 1, 0.1607843, 0, 1,
-1.819372, 1.327551, -0.4986141, 1, 0.1686275, 0, 1,
-1.809206, 1.05158, -2.247666, 1, 0.172549, 0, 1,
-1.774835, -0.1617561, -0.8700185, 1, 0.1803922, 0, 1,
-1.769046, 0.1679255, -0.07575647, 1, 0.1843137, 0, 1,
-1.754261, -1.378902, -1.573361, 1, 0.1921569, 0, 1,
-1.74336, 2.660763, -1.431762, 1, 0.1960784, 0, 1,
-1.725661, -1.581974, -3.868289, 1, 0.2039216, 0, 1,
-1.71584, -2.150974, -0.4790733, 1, 0.2117647, 0, 1,
-1.712071, 0.4914644, -0.7062806, 1, 0.2156863, 0, 1,
-1.705652, 1.26385, -0.3570664, 1, 0.2235294, 0, 1,
-1.701452, -1.474204, -1.083208, 1, 0.227451, 0, 1,
-1.679277, -0.008550228, -0.9284723, 1, 0.2352941, 0, 1,
-1.66905, 0.3831166, 0.5158379, 1, 0.2392157, 0, 1,
-1.664591, -0.6822696, -2.814048, 1, 0.2470588, 0, 1,
-1.660759, -0.03666264, -2.687847, 1, 0.2509804, 0, 1,
-1.636426, 0.09110352, -1.284433, 1, 0.2588235, 0, 1,
-1.629978, 0.7124539, -1.819554, 1, 0.2627451, 0, 1,
-1.625227, 0.1857486, -1.595934, 1, 0.2705882, 0, 1,
-1.613346, 0.2291929, -2.504976, 1, 0.2745098, 0, 1,
-1.608176, 0.07945412, -0.5247171, 1, 0.282353, 0, 1,
-1.606761, -0.4973297, -2.737406, 1, 0.2862745, 0, 1,
-1.597429, 0.4966748, -1.307339, 1, 0.2941177, 0, 1,
-1.593374, -0.2248703, -1.707404, 1, 0.3019608, 0, 1,
-1.590176, 0.3578169, -0.7956102, 1, 0.3058824, 0, 1,
-1.576297, -0.01359526, -0.9485751, 1, 0.3137255, 0, 1,
-1.570396, 0.9748705, -2.402354, 1, 0.3176471, 0, 1,
-1.562546, 0.1503596, -1.665725, 1, 0.3254902, 0, 1,
-1.553538, 0.08045855, -0.4087717, 1, 0.3294118, 0, 1,
-1.544857, -0.06676979, -1.82076, 1, 0.3372549, 0, 1,
-1.527245, -0.41838, -0.6740612, 1, 0.3411765, 0, 1,
-1.504381, -0.6987998, -1.491769, 1, 0.3490196, 0, 1,
-1.503988, -0.1675069, -2.966722, 1, 0.3529412, 0, 1,
-1.493751, 0.1455114, -0.8264138, 1, 0.3607843, 0, 1,
-1.490855, 1.222288, -1.277658, 1, 0.3647059, 0, 1,
-1.489009, 1.442923, -0.1804204, 1, 0.372549, 0, 1,
-1.482647, 0.5620316, -1.72524, 1, 0.3764706, 0, 1,
-1.48105, -0.8347449, -3.90153, 1, 0.3843137, 0, 1,
-1.473364, 1.25271, -0.3381196, 1, 0.3882353, 0, 1,
-1.460828, 0.3474503, -0.516343, 1, 0.3960784, 0, 1,
-1.46064, -1.735065, -2.670419, 1, 0.4039216, 0, 1,
-1.454696, 0.3544649, -1.289783, 1, 0.4078431, 0, 1,
-1.449619, -1.739196, -1.796062, 1, 0.4156863, 0, 1,
-1.448925, 0.1545957, -1.690726, 1, 0.4196078, 0, 1,
-1.446397, 1.500363, -2.656991, 1, 0.427451, 0, 1,
-1.43985, 1.965674, -1.619982, 1, 0.4313726, 0, 1,
-1.43237, -0.7834946, -0.8165518, 1, 0.4392157, 0, 1,
-1.432279, -0.1983856, -1.202046, 1, 0.4431373, 0, 1,
-1.429821, -0.02633258, -0.8134804, 1, 0.4509804, 0, 1,
-1.427222, -0.2493051, -2.416941, 1, 0.454902, 0, 1,
-1.414759, -0.3761832, -1.57387, 1, 0.4627451, 0, 1,
-1.410689, 1.132333, -0.6263445, 1, 0.4666667, 0, 1,
-1.404011, -0.5285434, -3.054026, 1, 0.4745098, 0, 1,
-1.385779, 1.359944, -1.191239, 1, 0.4784314, 0, 1,
-1.37573, 2.011045, -0.2283997, 1, 0.4862745, 0, 1,
-1.3742, -1.039212, -2.017167, 1, 0.4901961, 0, 1,
-1.369866, 1.492557, 0.2216609, 1, 0.4980392, 0, 1,
-1.364444, -1.162882, -1.553503, 1, 0.5058824, 0, 1,
-1.357705, 1.493907, -0.1434408, 1, 0.509804, 0, 1,
-1.355634, 0.09759625, -0.9552266, 1, 0.5176471, 0, 1,
-1.355502, -0.3283484, -2.44, 1, 0.5215687, 0, 1,
-1.349974, -0.9336185, -1.797856, 1, 0.5294118, 0, 1,
-1.348357, -0.7334816, -3.139547, 1, 0.5333334, 0, 1,
-1.341895, -0.3675088, -4.287377, 1, 0.5411765, 0, 1,
-1.339984, -0.6614116, -0.8880254, 1, 0.5450981, 0, 1,
-1.332435, -0.7825789, -0.7220003, 1, 0.5529412, 0, 1,
-1.326862, 0.1077475, -1.248685, 1, 0.5568628, 0, 1,
-1.289619, 0.8016343, -0.32705, 1, 0.5647059, 0, 1,
-1.288505, -1.412239, -2.543682, 1, 0.5686275, 0, 1,
-1.287594, -0.4863119, -2.87943, 1, 0.5764706, 0, 1,
-1.28643, 0.2922451, -3.066482, 1, 0.5803922, 0, 1,
-1.281335, 0.4854713, 1.322193, 1, 0.5882353, 0, 1,
-1.275759, 1.708699, -0.5617824, 1, 0.5921569, 0, 1,
-1.273013, 1.198695, -1.445939, 1, 0.6, 0, 1,
-1.263718, -1.516631, -0.905184, 1, 0.6078432, 0, 1,
-1.258553, 1.08721, 0.4139415, 1, 0.6117647, 0, 1,
-1.252945, -0.3676737, -1.751047, 1, 0.6196079, 0, 1,
-1.247006, -0.07221843, -0.979695, 1, 0.6235294, 0, 1,
-1.242241, -0.8914499, -2.531452, 1, 0.6313726, 0, 1,
-1.238708, 0.2692019, -2.863422, 1, 0.6352941, 0, 1,
-1.236146, -0.5073565, -2.567544, 1, 0.6431373, 0, 1,
-1.229453, -1.23528, -2.791894, 1, 0.6470588, 0, 1,
-1.228248, 0.6316352, -0.8960177, 1, 0.654902, 0, 1,
-1.220976, -0.4174263, -0.8757744, 1, 0.6588235, 0, 1,
-1.220363, -0.6992968, -1.21281, 1, 0.6666667, 0, 1,
-1.210374, 0.7732129, -0.5798046, 1, 0.6705883, 0, 1,
-1.207942, 1.243867, 0.5749965, 1, 0.6784314, 0, 1,
-1.204272, 0.1579055, -3.392622, 1, 0.682353, 0, 1,
-1.202183, 1.598427, 0.03448265, 1, 0.6901961, 0, 1,
-1.192577, 0.920494, -3.458412, 1, 0.6941177, 0, 1,
-1.190066, 1.59, 0.1771311, 1, 0.7019608, 0, 1,
-1.182625, -0.9804348, -2.184514, 1, 0.7098039, 0, 1,
-1.17337, -1.903067, -5.123157, 1, 0.7137255, 0, 1,
-1.166265, 1.10259, -0.5683062, 1, 0.7215686, 0, 1,
-1.160347, 2.331665, -0.9948487, 1, 0.7254902, 0, 1,
-1.15512, 0.5028874, -1.2413, 1, 0.7333333, 0, 1,
-1.144498, 1.060959, -0.128525, 1, 0.7372549, 0, 1,
-1.141516, 0.6859276, -0.4121308, 1, 0.7450981, 0, 1,
-1.138214, 1.851846, -0.753242, 1, 0.7490196, 0, 1,
-1.137488, -0.5321798, 0.2814005, 1, 0.7568628, 0, 1,
-1.132162, -1.262624, -2.731104, 1, 0.7607843, 0, 1,
-1.129841, -0.2085802, -2.79909, 1, 0.7686275, 0, 1,
-1.128045, -0.4167765, -3.140954, 1, 0.772549, 0, 1,
-1.126304, 0.8141302, -1.567763, 1, 0.7803922, 0, 1,
-1.110279, -0.5664119, -0.6448145, 1, 0.7843137, 0, 1,
-1.102841, 1.035379, -1.254205, 1, 0.7921569, 0, 1,
-1.094376, -1.031309, -2.85147, 1, 0.7960784, 0, 1,
-1.086342, -2.223333, -2.806151, 1, 0.8039216, 0, 1,
-1.076533, 0.2556142, -0.5451176, 1, 0.8117647, 0, 1,
-1.064242, 0.198396, -2.603719, 1, 0.8156863, 0, 1,
-1.051608, -1.650334, -1.324025, 1, 0.8235294, 0, 1,
-1.05139, 0.117207, -0.2375914, 1, 0.827451, 0, 1,
-1.048133, 1.576049, -2.732775, 1, 0.8352941, 0, 1,
-1.047103, 2.111307, 1.121554, 1, 0.8392157, 0, 1,
-1.044431, 2.264972, -0.5823373, 1, 0.8470588, 0, 1,
-1.043917, -0.3342125, -2.837321, 1, 0.8509804, 0, 1,
-1.038366, -1.160284, -1.751952, 1, 0.8588235, 0, 1,
-1.036395, 0.8646845, 0.1709279, 1, 0.8627451, 0, 1,
-1.030062, -0.1353914, -1.911463, 1, 0.8705882, 0, 1,
-1.029154, 0.1510443, -1.940645, 1, 0.8745098, 0, 1,
-1.028999, 0.8556697, -0.8447869, 1, 0.8823529, 0, 1,
-1.028565, 0.0848927, -1.286809, 1, 0.8862745, 0, 1,
-1.019545, -1.779677, -3.057858, 1, 0.8941177, 0, 1,
-1.017769, 0.5934465, -0.1534662, 1, 0.8980392, 0, 1,
-1.012982, 0.2507063, -0.3477069, 1, 0.9058824, 0, 1,
-1.012882, -0.2972387, -2.793513, 1, 0.9137255, 0, 1,
-1.010834, 0.8140125, 0.285964, 1, 0.9176471, 0, 1,
-1.010164, 0.7969832, -1.346283, 1, 0.9254902, 0, 1,
-1.009388, -0.4290415, -1.424571, 1, 0.9294118, 0, 1,
-1.008651, -1.146867, -2.084111, 1, 0.9372549, 0, 1,
-1.004701, 1.477633, -0.1502357, 1, 0.9411765, 0, 1,
-0.9955435, 1.116216, -0.58901, 1, 0.9490196, 0, 1,
-0.9938809, 0.6694613, -0.9366806, 1, 0.9529412, 0, 1,
-0.9937744, -0.02472949, -2.414213, 1, 0.9607843, 0, 1,
-0.9933705, -0.5806632, -3.034773, 1, 0.9647059, 0, 1,
-0.9772905, 0.9012924, 0.4354489, 1, 0.972549, 0, 1,
-0.9735259, -0.106548, -1.910824, 1, 0.9764706, 0, 1,
-0.9732956, -1.781623, -2.820008, 1, 0.9843137, 0, 1,
-0.9716125, 1.575289, 1.353126, 1, 0.9882353, 0, 1,
-0.9685088, 2.022312, -0.9604185, 1, 0.9960784, 0, 1,
-0.9503244, 0.04622891, -1.663864, 0.9960784, 1, 0, 1,
-0.9451262, 1.074825, 1.029929, 0.9921569, 1, 0, 1,
-0.9359066, -1.61992, -3.365302, 0.9843137, 1, 0, 1,
-0.9307464, 0.5138741, 0.4312402, 0.9803922, 1, 0, 1,
-0.9289821, 0.9520415, -0.3135796, 0.972549, 1, 0, 1,
-0.9277817, 1.157827, 0.2004305, 0.9686275, 1, 0, 1,
-0.9268335, 1.882858, -1.392865, 0.9607843, 1, 0, 1,
-0.922914, -0.9273511, -1.779218, 0.9568627, 1, 0, 1,
-0.9205157, -0.4712591, -1.132855, 0.9490196, 1, 0, 1,
-0.9195173, -1.294314, -1.589178, 0.945098, 1, 0, 1,
-0.9167458, -1.248862, -2.907136, 0.9372549, 1, 0, 1,
-0.9059515, 0.8686597, -0.4153075, 0.9333333, 1, 0, 1,
-0.9029545, 1.970627, -3.509435, 0.9254902, 1, 0, 1,
-0.9021728, -0.5372924, -1.598454, 0.9215686, 1, 0, 1,
-0.8956936, -0.3566971, -3.825558, 0.9137255, 1, 0, 1,
-0.8952528, 0.4967591, -0.0654955, 0.9098039, 1, 0, 1,
-0.8893583, 0.2735971, -0.2221122, 0.9019608, 1, 0, 1,
-0.8856136, 1.091069, -0.004557339, 0.8941177, 1, 0, 1,
-0.8835803, -0.5848759, -2.035864, 0.8901961, 1, 0, 1,
-0.8820398, -0.6082369, -2.011722, 0.8823529, 1, 0, 1,
-0.8803235, -0.189843, -0.2603042, 0.8784314, 1, 0, 1,
-0.8762221, -1.294508, -0.2929234, 0.8705882, 1, 0, 1,
-0.8733579, -0.5856115, -1.692742, 0.8666667, 1, 0, 1,
-0.8648186, 2.657906, 0.9998424, 0.8588235, 1, 0, 1,
-0.8637689, -1.396161, -3.817142, 0.854902, 1, 0, 1,
-0.8593629, -0.3865799, -1.362707, 0.8470588, 1, 0, 1,
-0.8527964, 0.9027845, 0.002409852, 0.8431373, 1, 0, 1,
-0.8467897, -0.4260369, -2.289894, 0.8352941, 1, 0, 1,
-0.8407508, 0.6838617, -1.220377, 0.8313726, 1, 0, 1,
-0.8387683, -0.7578605, -2.264511, 0.8235294, 1, 0, 1,
-0.8365782, -0.701259, -1.266959, 0.8196079, 1, 0, 1,
-0.8358565, -0.3744367, -2.744466, 0.8117647, 1, 0, 1,
-0.8342307, 0.2519167, -0.7470883, 0.8078431, 1, 0, 1,
-0.8277543, -1.64351, -3.877423, 0.8, 1, 0, 1,
-0.8265047, -0.8104374, -3.072616, 0.7921569, 1, 0, 1,
-0.8244112, -0.4216876, -3.752243, 0.7882353, 1, 0, 1,
-0.8191188, -0.7635776, -1.065945, 0.7803922, 1, 0, 1,
-0.8136928, 1.172316, -1.552228, 0.7764706, 1, 0, 1,
-0.8054347, -0.4473951, -2.460759, 0.7686275, 1, 0, 1,
-0.8031023, 0.4669512, -0.4454754, 0.7647059, 1, 0, 1,
-0.8027078, 0.2868117, -2.298331, 0.7568628, 1, 0, 1,
-0.8010154, 2.022912, 0.2179991, 0.7529412, 1, 0, 1,
-0.7990245, 1.436172, -0.822033, 0.7450981, 1, 0, 1,
-0.7973585, 0.2745785, -0.05685821, 0.7411765, 1, 0, 1,
-0.7754065, -0.1671496, -1.009992, 0.7333333, 1, 0, 1,
-0.773607, 0.8681802, 0.3571129, 0.7294118, 1, 0, 1,
-0.7720221, 0.181137, -1.009512, 0.7215686, 1, 0, 1,
-0.7674155, -0.5858987, -1.273174, 0.7176471, 1, 0, 1,
-0.7672389, -1.158944, -3.191182, 0.7098039, 1, 0, 1,
-0.7623874, -0.03386211, -1.124277, 0.7058824, 1, 0, 1,
-0.761883, 0.7492773, -0.453631, 0.6980392, 1, 0, 1,
-0.7615127, -1.200993, -1.043204, 0.6901961, 1, 0, 1,
-0.7572128, 1.602081, 0.9428467, 0.6862745, 1, 0, 1,
-0.7565788, -0.9653965, -1.390381, 0.6784314, 1, 0, 1,
-0.7559083, -0.9634743, -1.981031, 0.6745098, 1, 0, 1,
-0.7489674, 0.5540907, -2.902465, 0.6666667, 1, 0, 1,
-0.7479703, -0.3407107, -2.885333, 0.6627451, 1, 0, 1,
-0.7478478, -0.6401013, -3.055039, 0.654902, 1, 0, 1,
-0.7446077, -1.090011, -2.389324, 0.6509804, 1, 0, 1,
-0.7415355, -1.903754, -1.567685, 0.6431373, 1, 0, 1,
-0.7400092, -0.4376176, -2.819577, 0.6392157, 1, 0, 1,
-0.734736, -0.2139517, -2.063059, 0.6313726, 1, 0, 1,
-0.730104, -0.0313964, -0.1233694, 0.627451, 1, 0, 1,
-0.7251245, 0.1256259, -1.080266, 0.6196079, 1, 0, 1,
-0.724637, -0.3051905, -3.576917, 0.6156863, 1, 0, 1,
-0.723205, 0.7726188, 0.4074062, 0.6078432, 1, 0, 1,
-0.7222204, 0.8369631, 0.2428409, 0.6039216, 1, 0, 1,
-0.7172776, -0.4571146, -1.728713, 0.5960785, 1, 0, 1,
-0.7170595, 0.3457559, 0.08071119, 0.5882353, 1, 0, 1,
-0.7151386, -0.2066261, -2.596514, 0.5843138, 1, 0, 1,
-0.7146987, -0.06671336, -1.517814, 0.5764706, 1, 0, 1,
-0.7088898, 0.9431748, -1.612361, 0.572549, 1, 0, 1,
-0.7049869, -0.690169, -1.7306, 0.5647059, 1, 0, 1,
-0.7043716, 0.6183283, -0.3653048, 0.5607843, 1, 0, 1,
-0.7006046, 0.02824202, -1.608435, 0.5529412, 1, 0, 1,
-0.6947121, -1.632544, -1.945368, 0.5490196, 1, 0, 1,
-0.6924255, 0.5089921, -0.414235, 0.5411765, 1, 0, 1,
-0.6906564, 0.9011815, 1.058761, 0.5372549, 1, 0, 1,
-0.6857984, 0.9540469, 0.651033, 0.5294118, 1, 0, 1,
-0.6845616, 1.087444, -0.5725151, 0.5254902, 1, 0, 1,
-0.6815207, 1.631055, -1.051904, 0.5176471, 1, 0, 1,
-0.6809456, 1.214251, -2.278601, 0.5137255, 1, 0, 1,
-0.6651686, 0.4263017, -2.244047, 0.5058824, 1, 0, 1,
-0.6633972, 0.4298056, -1.945214, 0.5019608, 1, 0, 1,
-0.6628617, -0.9316996, -0.770762, 0.4941176, 1, 0, 1,
-0.6603282, 0.4483667, -1.916788, 0.4862745, 1, 0, 1,
-0.6597784, -0.01708504, 1.122379, 0.4823529, 1, 0, 1,
-0.6585355, -0.2105428, -2.007691, 0.4745098, 1, 0, 1,
-0.655902, 0.3878801, -1.582399, 0.4705882, 1, 0, 1,
-0.6527529, -1.164481, -1.660749, 0.4627451, 1, 0, 1,
-0.6508842, -0.4841556, -1.841513, 0.4588235, 1, 0, 1,
-0.6430428, -0.1449859, 0.1272158, 0.4509804, 1, 0, 1,
-0.6393121, -0.05887678, -3.276284, 0.4470588, 1, 0, 1,
-0.6374375, -0.128271, -2.558118, 0.4392157, 1, 0, 1,
-0.6302218, -0.4149139, -1.641067, 0.4352941, 1, 0, 1,
-0.6296405, -1.247233, -4.027949, 0.427451, 1, 0, 1,
-0.6277483, -0.9132125, -4.496643, 0.4235294, 1, 0, 1,
-0.6220711, -2.737447, -3.225508, 0.4156863, 1, 0, 1,
-0.6205872, 0.4721717, -1.065771, 0.4117647, 1, 0, 1,
-0.620391, -0.394303, -2.46613, 0.4039216, 1, 0, 1,
-0.6179853, -0.3002086, -2.791012, 0.3960784, 1, 0, 1,
-0.6141983, -1.562452, -1.196627, 0.3921569, 1, 0, 1,
-0.6103042, -0.7777188, -2.274937, 0.3843137, 1, 0, 1,
-0.6072216, 0.03115851, -0.6060125, 0.3803922, 1, 0, 1,
-0.6067777, 0.4166722, -1.953478, 0.372549, 1, 0, 1,
-0.6060082, -0.02344005, -0.5664963, 0.3686275, 1, 0, 1,
-0.6024855, 0.6002944, -2.026323, 0.3607843, 1, 0, 1,
-0.6014259, 0.831288, -0.965893, 0.3568628, 1, 0, 1,
-0.5973814, 0.467027, -1.620191, 0.3490196, 1, 0, 1,
-0.5948064, -1.656692, -4.010709, 0.345098, 1, 0, 1,
-0.5934377, -0.7614074, -0.6954246, 0.3372549, 1, 0, 1,
-0.587599, 0.5587433, -1.824941, 0.3333333, 1, 0, 1,
-0.5864283, 0.2287473, -2.331089, 0.3254902, 1, 0, 1,
-0.5863838, -0.8441747, -2.265625, 0.3215686, 1, 0, 1,
-0.5835992, -1.87534, -2.61565, 0.3137255, 1, 0, 1,
-0.5832645, 0.6207181, -0.4522814, 0.3098039, 1, 0, 1,
-0.5766348, 0.7418221, -0.9193551, 0.3019608, 1, 0, 1,
-0.5648651, 0.6596226, -2.337539, 0.2941177, 1, 0, 1,
-0.5636798, 0.2340592, -1.708814, 0.2901961, 1, 0, 1,
-0.5616811, 2.2127, -0.05039355, 0.282353, 1, 0, 1,
-0.5596774, 1.763017, 0.2675431, 0.2784314, 1, 0, 1,
-0.558466, 0.08203278, -1.853447, 0.2705882, 1, 0, 1,
-0.5583359, 0.5934253, -1.793058, 0.2666667, 1, 0, 1,
-0.5538179, 0.6396533, -3.131509, 0.2588235, 1, 0, 1,
-0.5515069, 1.268505, -0.6709401, 0.254902, 1, 0, 1,
-0.5505204, -1.794996, -2.422657, 0.2470588, 1, 0, 1,
-0.5497932, -0.6582341, -2.430506, 0.2431373, 1, 0, 1,
-0.5483055, -1.484899, -3.314516, 0.2352941, 1, 0, 1,
-0.5418539, 0.2688362, -1.627091, 0.2313726, 1, 0, 1,
-0.541746, 1.265893, 0.2984965, 0.2235294, 1, 0, 1,
-0.540932, -0.2094231, -0.9994369, 0.2196078, 1, 0, 1,
-0.5393211, 1.010345, -2.111467, 0.2117647, 1, 0, 1,
-0.5369262, 0.2001916, -2.379725, 0.2078431, 1, 0, 1,
-0.535717, -0.7099704, -1.799264, 0.2, 1, 0, 1,
-0.5337516, 0.0671812, -0.5187851, 0.1921569, 1, 0, 1,
-0.5301623, 0.4273141, -0.08855332, 0.1882353, 1, 0, 1,
-0.5272086, 1.03316, -0.009555113, 0.1803922, 1, 0, 1,
-0.5191395, 1.314831, 0.7302766, 0.1764706, 1, 0, 1,
-0.5163863, -0.09131623, -1.978304, 0.1686275, 1, 0, 1,
-0.5147027, 0.4387523, -0.9544885, 0.1647059, 1, 0, 1,
-0.5079144, 1.233627, -1.526914, 0.1568628, 1, 0, 1,
-0.5060712, 1.188167, 0.8480377, 0.1529412, 1, 0, 1,
-0.503803, -0.9578055, -2.361921, 0.145098, 1, 0, 1,
-0.5034919, 0.8034641, -0.1525244, 0.1411765, 1, 0, 1,
-0.4971302, 0.4716344, 1.586577, 0.1333333, 1, 0, 1,
-0.4962741, -0.1466693, -2.114982, 0.1294118, 1, 0, 1,
-0.4891847, -1.094552, -4.087432, 0.1215686, 1, 0, 1,
-0.48664, -1.475936, -2.936094, 0.1176471, 1, 0, 1,
-0.4822223, 0.2345308, 0.4435703, 0.1098039, 1, 0, 1,
-0.479352, -1.40094, -2.431268, 0.1058824, 1, 0, 1,
-0.4762641, -1.13749, -2.753308, 0.09803922, 1, 0, 1,
-0.470101, 0.6161104, -1.759803, 0.09019608, 1, 0, 1,
-0.4668883, 0.09491225, 0.5636968, 0.08627451, 1, 0, 1,
-0.4665827, 1.306685, -1.099396, 0.07843138, 1, 0, 1,
-0.465308, 0.6851619, -1.677965, 0.07450981, 1, 0, 1,
-0.452443, 0.7134876, -1.119701, 0.06666667, 1, 0, 1,
-0.4454917, -0.8928056, -3.981078, 0.0627451, 1, 0, 1,
-0.4449151, -0.5054068, -1.368144, 0.05490196, 1, 0, 1,
-0.4431192, 0.02203373, -0.495226, 0.05098039, 1, 0, 1,
-0.4384001, -1.296739, -2.521167, 0.04313726, 1, 0, 1,
-0.4349133, -0.2603445, -2.087728, 0.03921569, 1, 0, 1,
-0.4239926, -0.9365113, -1.569996, 0.03137255, 1, 0, 1,
-0.4239243, -0.9284862, -1.816517, 0.02745098, 1, 0, 1,
-0.4177192, 0.533951, -1.262059, 0.01960784, 1, 0, 1,
-0.4128259, -0.2775048, -1.806316, 0.01568628, 1, 0, 1,
-0.4115264, 0.3343128, -0.2457051, 0.007843138, 1, 0, 1,
-0.4048168, -1.382256, -2.791685, 0.003921569, 1, 0, 1,
-0.4031944, -1.928596, -3.72982, 0, 1, 0.003921569, 1,
-0.4026912, 0.9742834, -0.4946478, 0, 1, 0.01176471, 1,
-0.3994727, -0.3829266, -3.147886, 0, 1, 0.01568628, 1,
-0.3987663, -1.396248, -1.573273, 0, 1, 0.02352941, 1,
-0.3981532, 0.2207932, 0.1058307, 0, 1, 0.02745098, 1,
-0.395913, -3.012357, -4.285297, 0, 1, 0.03529412, 1,
-0.3947731, -1.046392, -2.463491, 0, 1, 0.03921569, 1,
-0.3932938, 0.7009585, -0.4458944, 0, 1, 0.04705882, 1,
-0.388817, 0.764366, -1.158433, 0, 1, 0.05098039, 1,
-0.3764218, -1.855879, -3.696515, 0, 1, 0.05882353, 1,
-0.3752452, -0.3688013, -2.8057, 0, 1, 0.0627451, 1,
-0.3750848, 0.8989529, 0.4667754, 0, 1, 0.07058824, 1,
-0.365011, 0.1959023, -0.7867171, 0, 1, 0.07450981, 1,
-0.3628262, -0.4995275, -1.897787, 0, 1, 0.08235294, 1,
-0.3589906, 1.103281, -0.7400271, 0, 1, 0.08627451, 1,
-0.3587626, -2.053644, -3.992585, 0, 1, 0.09411765, 1,
-0.3538083, -0.5187038, -2.993584, 0, 1, 0.1019608, 1,
-0.3515255, 1.009765, 1.023093, 0, 1, 0.1058824, 1,
-0.347973, 1.006158, 0.4375429, 0, 1, 0.1137255, 1,
-0.3383787, -0.816702, -2.446142, 0, 1, 0.1176471, 1,
-0.3378172, -0.2046104, -2.448645, 0, 1, 0.1254902, 1,
-0.3367513, -0.5321194, -0.8852857, 0, 1, 0.1294118, 1,
-0.3334682, -2.151254, -2.91781, 0, 1, 0.1372549, 1,
-0.3324201, -0.7453673, -2.587382, 0, 1, 0.1411765, 1,
-0.327998, -0.677423, -2.999863, 0, 1, 0.1490196, 1,
-0.3267996, 1.216826, -0.4027104, 0, 1, 0.1529412, 1,
-0.3233131, 2.17609, -1.057379, 0, 1, 0.1607843, 1,
-0.3217747, 1.782177, -0.4646923, 0, 1, 0.1647059, 1,
-0.3176347, 1.806931, 1.129081, 0, 1, 0.172549, 1,
-0.3167845, 0.7089282, -0.1264599, 0, 1, 0.1764706, 1,
-0.3134418, 0.6672877, 0.5709461, 0, 1, 0.1843137, 1,
-0.3121088, 0.5067692, -0.6827488, 0, 1, 0.1882353, 1,
-0.3109868, 0.7380087, -0.8760393, 0, 1, 0.1960784, 1,
-0.3108615, -0.9972097, -4.219687, 0, 1, 0.2039216, 1,
-0.3088903, -1.751741, -2.699293, 0, 1, 0.2078431, 1,
-0.3069371, -2.761389, -3.695254, 0, 1, 0.2156863, 1,
-0.302108, -1.323974, -2.207586, 0, 1, 0.2196078, 1,
-0.2991803, 0.2094923, -1.270424, 0, 1, 0.227451, 1,
-0.2949654, 1.138705, -0.05818925, 0, 1, 0.2313726, 1,
-0.2948515, -0.3403062, -3.826886, 0, 1, 0.2392157, 1,
-0.286969, -0.152703, -1.609075, 0, 1, 0.2431373, 1,
-0.2830252, 1.112268, 0.3003462, 0, 1, 0.2509804, 1,
-0.2808657, -0.01487654, -1.790787, 0, 1, 0.254902, 1,
-0.2743122, 1.125749, -0.886205, 0, 1, 0.2627451, 1,
-0.2725809, -0.05877721, -2.507683, 0, 1, 0.2666667, 1,
-0.2713891, 0.1133849, -1.385256, 0, 1, 0.2745098, 1,
-0.2707604, -1.469327, -2.183768, 0, 1, 0.2784314, 1,
-0.2682904, 1.753754, 1.290378, 0, 1, 0.2862745, 1,
-0.2650304, 3.71525, 1.643734, 0, 1, 0.2901961, 1,
-0.261853, -0.110635, -2.475688, 0, 1, 0.2980392, 1,
-0.2593023, -0.5614017, -1.812824, 0, 1, 0.3058824, 1,
-0.2581137, -0.6866518, -2.576641, 0, 1, 0.3098039, 1,
-0.2554746, -0.9942412, -3.059382, 0, 1, 0.3176471, 1,
-0.246749, 0.5930507, -1.597584, 0, 1, 0.3215686, 1,
-0.2459926, -1.129421, -2.429445, 0, 1, 0.3294118, 1,
-0.2459481, 0.6694835, -0.343158, 0, 1, 0.3333333, 1,
-0.244854, -0.001072033, -2.410912, 0, 1, 0.3411765, 1,
-0.2442366, -0.2826084, -0.7355302, 0, 1, 0.345098, 1,
-0.2432587, -1.0654, -3.817598, 0, 1, 0.3529412, 1,
-0.2418285, -1.111802, -1.278793, 0, 1, 0.3568628, 1,
-0.2370193, -0.08827624, -2.439208, 0, 1, 0.3647059, 1,
-0.2370029, -0.3878537, -2.666807, 0, 1, 0.3686275, 1,
-0.2333077, 0.1164501, -0.8948389, 0, 1, 0.3764706, 1,
-0.2329105, -0.6736383, -2.925981, 0, 1, 0.3803922, 1,
-0.2320576, 0.2629243, -0.7049221, 0, 1, 0.3882353, 1,
-0.227444, 1.540896, -0.4132786, 0, 1, 0.3921569, 1,
-0.2272963, -0.5730971, -3.186304, 0, 1, 0.4, 1,
-0.2266025, -0.8418061, -2.632039, 0, 1, 0.4078431, 1,
-0.2241576, -1.763791, -2.257219, 0, 1, 0.4117647, 1,
-0.2197552, 1.087208, 0.6788633, 0, 1, 0.4196078, 1,
-0.218914, 0.3122239, -0.5096043, 0, 1, 0.4235294, 1,
-0.2165523, 0.5179905, -1.460575, 0, 1, 0.4313726, 1,
-0.2094394, -1.893295, -3.044932, 0, 1, 0.4352941, 1,
-0.2082281, 0.6277355, -1.585556, 0, 1, 0.4431373, 1,
-0.2065535, 0.992743, -0.4990275, 0, 1, 0.4470588, 1,
-0.2034001, -0.6980031, -4.447163, 0, 1, 0.454902, 1,
-0.2032837, 0.1565596, -1.075174, 0, 1, 0.4588235, 1,
-0.2019006, -0.3441589, -2.181189, 0, 1, 0.4666667, 1,
-0.2017138, -0.4023401, -3.492347, 0, 1, 0.4705882, 1,
-0.2004785, -1.374263, -5.047317, 0, 1, 0.4784314, 1,
-0.1999623, 1.11061, 0.08274261, 0, 1, 0.4823529, 1,
-0.1973202, 0.09992826, -2.325131, 0, 1, 0.4901961, 1,
-0.1972621, 0.05578338, -1.676207, 0, 1, 0.4941176, 1,
-0.1952752, 0.5768047, -0.4213216, 0, 1, 0.5019608, 1,
-0.1910097, -0.05068398, -2.103339, 0, 1, 0.509804, 1,
-0.1881431, -0.1871557, -2.440192, 0, 1, 0.5137255, 1,
-0.1863207, 1.76472, -0.5175943, 0, 1, 0.5215687, 1,
-0.1814701, -2.790397, -2.500942, 0, 1, 0.5254902, 1,
-0.1772732, -1.638187, -1.262174, 0, 1, 0.5333334, 1,
-0.172968, 0.6843671, 1.019601, 0, 1, 0.5372549, 1,
-0.1694051, -2.277183, -2.411816, 0, 1, 0.5450981, 1,
-0.1671781, -1.184759, -1.959094, 0, 1, 0.5490196, 1,
-0.1668934, 0.09820265, -0.05254888, 0, 1, 0.5568628, 1,
-0.1636562, -0.8580838, -4.365725, 0, 1, 0.5607843, 1,
-0.1616831, 0.644445, 0.4886804, 0, 1, 0.5686275, 1,
-0.1587505, -0.9462509, -2.508581, 0, 1, 0.572549, 1,
-0.1587328, -1.262719, -3.506769, 0, 1, 0.5803922, 1,
-0.1535849, 0.7826713, -0.8551816, 0, 1, 0.5843138, 1,
-0.1487825, 1.156715, 0.6170751, 0, 1, 0.5921569, 1,
-0.144311, 2.919339, -0.310398, 0, 1, 0.5960785, 1,
-0.1441544, 0.9967613, -1.668258, 0, 1, 0.6039216, 1,
-0.1428068, 0.7219158, -0.3987037, 0, 1, 0.6117647, 1,
-0.1426084, -2.318083, -2.791674, 0, 1, 0.6156863, 1,
-0.1390582, -0.08035143, -2.168753, 0, 1, 0.6235294, 1,
-0.1377925, -0.9865173, -3.176685, 0, 1, 0.627451, 1,
-0.1371931, -0.2598774, -2.046848, 0, 1, 0.6352941, 1,
-0.1348438, 1.420592, -0.3344455, 0, 1, 0.6392157, 1,
-0.1288776, 0.3688358, -0.4794701, 0, 1, 0.6470588, 1,
-0.1261148, 0.7886062, 0.4908972, 0, 1, 0.6509804, 1,
-0.1228137, -0.1080126, -1.153723, 0, 1, 0.6588235, 1,
-0.1208359, -0.3796664, -3.193424, 0, 1, 0.6627451, 1,
-0.1190012, 0.1166979, -1.859922, 0, 1, 0.6705883, 1,
-0.1180323, 1.638571, -0.663192, 0, 1, 0.6745098, 1,
-0.1160384, -0.5125607, -0.8453647, 0, 1, 0.682353, 1,
-0.1110565, -2.035241, -3.865111, 0, 1, 0.6862745, 1,
-0.1063153, 1.500589, 0.7440859, 0, 1, 0.6941177, 1,
-0.1063141, -0.4020953, -1.723866, 0, 1, 0.7019608, 1,
-0.1041397, -0.8772802, -1.852187, 0, 1, 0.7058824, 1,
-0.10401, -0.3825074, -1.366844, 0, 1, 0.7137255, 1,
-0.1002043, 0.8595507, -0.08704214, 0, 1, 0.7176471, 1,
-0.09821069, 0.5245899, -1.40118, 0, 1, 0.7254902, 1,
-0.09599391, 0.6026039, 0.4746922, 0, 1, 0.7294118, 1,
-0.09409641, -0.502127, -2.70679, 0, 1, 0.7372549, 1,
-0.09403749, -1.532674, -1.007304, 0, 1, 0.7411765, 1,
-0.0882982, -0.4003755, -2.732909, 0, 1, 0.7490196, 1,
-0.08666331, -1.068774, -3.359176, 0, 1, 0.7529412, 1,
-0.08434057, 0.4721177, 1.155307, 0, 1, 0.7607843, 1,
-0.08160724, 0.2642814, -1.841464, 0, 1, 0.7647059, 1,
-0.08140453, 1.732748, -2.306254, 0, 1, 0.772549, 1,
-0.06543127, 0.3885914, -0.5672305, 0, 1, 0.7764706, 1,
-0.06305899, -0.3690306, -3.033911, 0, 1, 0.7843137, 1,
-0.06212105, -0.879278, -2.124152, 0, 1, 0.7882353, 1,
-0.05981505, -0.03437125, -1.274321, 0, 1, 0.7960784, 1,
-0.05754088, 0.4261231, -1.228288, 0, 1, 0.8039216, 1,
-0.05440101, 0.8688751, 0.574423, 0, 1, 0.8078431, 1,
-0.05219439, -1.245962, -3.844804, 0, 1, 0.8156863, 1,
-0.04926099, -0.5027625, -2.437006, 0, 1, 0.8196079, 1,
-0.04611373, -0.9217188, -2.78944, 0, 1, 0.827451, 1,
-0.04445466, -1.450407, -2.245717, 0, 1, 0.8313726, 1,
-0.04263203, 2.209684, 3.114053, 0, 1, 0.8392157, 1,
-0.04239706, -0.547839, -3.680491, 0, 1, 0.8431373, 1,
-0.04216805, 0.4078916, -0.5320058, 0, 1, 0.8509804, 1,
-0.03725398, -0.8615336, -3.402989, 0, 1, 0.854902, 1,
-0.035614, 0.6739055, -0.6887769, 0, 1, 0.8627451, 1,
-0.02326997, 0.110157, 0.7205199, 0, 1, 0.8666667, 1,
-0.02203197, -0.3873437, -2.748516, 0, 1, 0.8745098, 1,
-0.02159727, 0.5379062, -0.7176387, 0, 1, 0.8784314, 1,
-0.02093313, 0.6938507, -2.038964, 0, 1, 0.8862745, 1,
-0.02032728, 0.779695, -0.8977039, 0, 1, 0.8901961, 1,
-0.01921616, -0.4890188, -3.433092, 0, 1, 0.8980392, 1,
-0.01657191, -1.027911, -3.06799, 0, 1, 0.9058824, 1,
-0.01595679, 0.04260025, -0.7922108, 0, 1, 0.9098039, 1,
-0.01178598, 0.801046, -0.8515754, 0, 1, 0.9176471, 1,
-0.009572119, 0.8452325, -0.05016321, 0, 1, 0.9215686, 1,
-0.006259935, 1.410008, 0.6598252, 0, 1, 0.9294118, 1,
-0.004866909, 0.5579942, -0.2840692, 0, 1, 0.9333333, 1,
-0.004032874, 0.144317, 0.8952675, 0, 1, 0.9411765, 1,
-0.001251677, -1.695086, -1.229012, 0, 1, 0.945098, 1,
0.004153775, -0.8994316, 2.474937, 0, 1, 0.9529412, 1,
0.004957724, -0.2687152, 2.163424, 0, 1, 0.9568627, 1,
0.008373253, 1.201701, 1.500176, 0, 1, 0.9647059, 1,
0.01225498, 0.1626253, 1.674922, 0, 1, 0.9686275, 1,
0.01412956, 2.008936, 0.3714949, 0, 1, 0.9764706, 1,
0.01613736, 0.5194433, -0.7073109, 0, 1, 0.9803922, 1,
0.01639959, 1.036782, -0.8520651, 0, 1, 0.9882353, 1,
0.02126884, -0.7528394, 2.85032, 0, 1, 0.9921569, 1,
0.02207575, -1.66323, 3.911188, 0, 1, 1, 1,
0.02929171, 0.006077101, 2.449429, 0, 0.9921569, 1, 1,
0.03023949, -0.489873, 3.089507, 0, 0.9882353, 1, 1,
0.0310444, 2.114609, 0.4765013, 0, 0.9803922, 1, 1,
0.03231096, -2.260826, 3.190072, 0, 0.9764706, 1, 1,
0.032961, -1.146142, 5.137698, 0, 0.9686275, 1, 1,
0.03445141, -1.075896, 1.924309, 0, 0.9647059, 1, 1,
0.0347316, 0.01643858, 1.095229, 0, 0.9568627, 1, 1,
0.04232112, -0.3081188, 2.410866, 0, 0.9529412, 1, 1,
0.0453207, -1.458812, 4.321314, 0, 0.945098, 1, 1,
0.04625488, -0.415354, 1.884924, 0, 0.9411765, 1, 1,
0.04969575, 0.9802374, 0.436089, 0, 0.9333333, 1, 1,
0.05117098, -0.4061161, 0.05205786, 0, 0.9294118, 1, 1,
0.05862835, -0.86052, 4.203605, 0, 0.9215686, 1, 1,
0.06095028, 0.6665137, -0.4419371, 0, 0.9176471, 1, 1,
0.06129521, 0.5510146, 0.7429733, 0, 0.9098039, 1, 1,
0.06999085, -0.3379368, 2.477743, 0, 0.9058824, 1, 1,
0.07063462, 0.4599634, 0.05329041, 0, 0.8980392, 1, 1,
0.07164141, -0.2523851, 3.6513, 0, 0.8901961, 1, 1,
0.07275866, -1.664758, 3.465966, 0, 0.8862745, 1, 1,
0.07407811, -0.6834114, 2.995903, 0, 0.8784314, 1, 1,
0.07922716, -0.2872899, 4.048473, 0, 0.8745098, 1, 1,
0.08079936, -0.4039879, 2.759928, 0, 0.8666667, 1, 1,
0.08568656, -0.2269682, 1.879127, 0, 0.8627451, 1, 1,
0.08597047, -0.7244338, 3.118128, 0, 0.854902, 1, 1,
0.08648154, -1.939977, 2.548922, 0, 0.8509804, 1, 1,
0.08884975, 0.3997142, 0.837496, 0, 0.8431373, 1, 1,
0.08903455, 0.7490336, 1.140099, 0, 0.8392157, 1, 1,
0.08948991, -0.0461382, 1.768984, 0, 0.8313726, 1, 1,
0.09185462, -0.8815573, 3.037995, 0, 0.827451, 1, 1,
0.09362197, 0.8438329, -1.540067, 0, 0.8196079, 1, 1,
0.09707363, 0.7413072, -0.4903843, 0, 0.8156863, 1, 1,
0.09752864, -0.2380725, 2.950214, 0, 0.8078431, 1, 1,
0.09759121, 0.6318369, -0.2147458, 0, 0.8039216, 1, 1,
0.09776121, 1.659026, 0.0811416, 0, 0.7960784, 1, 1,
0.1028276, 0.3694206, 0.5108021, 0, 0.7882353, 1, 1,
0.1053203, 0.4137412, 2.623721, 0, 0.7843137, 1, 1,
0.107195, -1.144594, 1.579354, 0, 0.7764706, 1, 1,
0.108005, 1.099114, 0.446986, 0, 0.772549, 1, 1,
0.1088013, -0.5477343, 3.171275, 0, 0.7647059, 1, 1,
0.1099632, -0.8065728, 1.213044, 0, 0.7607843, 1, 1,
0.1105411, 0.3374372, 0.2372116, 0, 0.7529412, 1, 1,
0.1117213, 2.147739, -0.2402198, 0, 0.7490196, 1, 1,
0.1138539, 0.02940139, 1.688525, 0, 0.7411765, 1, 1,
0.1180046, -1.403731, 2.024413, 0, 0.7372549, 1, 1,
0.1189184, -0.4813123, 3.140045, 0, 0.7294118, 1, 1,
0.1225542, -0.8137105, 2.20252, 0, 0.7254902, 1, 1,
0.1269141, 1.366633, 0.9955969, 0, 0.7176471, 1, 1,
0.1288496, -1.504512, 1.341123, 0, 0.7137255, 1, 1,
0.1291151, 0.5782495, 1.148142, 0, 0.7058824, 1, 1,
0.1313747, -0.5337012, 4.635995, 0, 0.6980392, 1, 1,
0.1345195, -0.2001341, 3.635549, 0, 0.6941177, 1, 1,
0.1348805, 2.576265, -0.08889801, 0, 0.6862745, 1, 1,
0.1415581, -0.4569847, 1.339139, 0, 0.682353, 1, 1,
0.1426818, -0.2889081, 4.464575, 0, 0.6745098, 1, 1,
0.1440214, -0.4278946, 1.678198, 0, 0.6705883, 1, 1,
0.1482593, -0.764536, 3.840949, 0, 0.6627451, 1, 1,
0.1503674, -0.277535, 3.24595, 0, 0.6588235, 1, 1,
0.1561898, -1.846206, 4.028438, 0, 0.6509804, 1, 1,
0.1575951, -0.2155339, 2.497164, 0, 0.6470588, 1, 1,
0.1653004, 0.07025906, 1.289511, 0, 0.6392157, 1, 1,
0.1655626, 1.622836, 0.6085289, 0, 0.6352941, 1, 1,
0.1675964, -1.605799, 3.479704, 0, 0.627451, 1, 1,
0.1694522, -2.012424, 3.718194, 0, 0.6235294, 1, 1,
0.1741527, -0.430116, 2.929284, 0, 0.6156863, 1, 1,
0.1748356, 0.7485103, 0.8403401, 0, 0.6117647, 1, 1,
0.1765259, 0.4928055, -0.703604, 0, 0.6039216, 1, 1,
0.1863769, 0.4980767, 1.463055, 0, 0.5960785, 1, 1,
0.1869427, -1.14618, 2.101229, 0, 0.5921569, 1, 1,
0.1880217, 0.900663, 0.2090058, 0, 0.5843138, 1, 1,
0.1903829, -1.136297, 2.002353, 0, 0.5803922, 1, 1,
0.1922378, 0.3348698, 0.669261, 0, 0.572549, 1, 1,
0.197883, -1.423417, 3.472826, 0, 0.5686275, 1, 1,
0.1999474, 0.4156643, 2.328629, 0, 0.5607843, 1, 1,
0.2003689, 0.9179665, -1.167027, 0, 0.5568628, 1, 1,
0.2007458, 0.5409008, 0.4490778, 0, 0.5490196, 1, 1,
0.2017526, 1.323579, 0.1283313, 0, 0.5450981, 1, 1,
0.2039381, -0.2420047, 3.828107, 0, 0.5372549, 1, 1,
0.2043216, 0.4790525, 0.4952683, 0, 0.5333334, 1, 1,
0.2068377, -0.93086, 4.257466, 0, 0.5254902, 1, 1,
0.2118405, -0.6904651, 3.571547, 0, 0.5215687, 1, 1,
0.2123823, 0.0132723, 2.051298, 0, 0.5137255, 1, 1,
0.2176513, -1.519987, 4.430488, 0, 0.509804, 1, 1,
0.2212206, 0.9098465, 0.2451851, 0, 0.5019608, 1, 1,
0.2216643, -0.1104662, 3.486622, 0, 0.4941176, 1, 1,
0.2274491, 0.3466294, -0.128533, 0, 0.4901961, 1, 1,
0.2275988, -0.5701396, 2.465104, 0, 0.4823529, 1, 1,
0.2283689, 0.02290558, 0.5863032, 0, 0.4784314, 1, 1,
0.2290719, -0.9445246, 0.7148135, 0, 0.4705882, 1, 1,
0.2332226, 0.8406032, -0.1495584, 0, 0.4666667, 1, 1,
0.2365466, -1.404575, 2.810174, 0, 0.4588235, 1, 1,
0.2398996, 0.04970453, 0.9567175, 0, 0.454902, 1, 1,
0.2422551, 1.104695, 0.1899192, 0, 0.4470588, 1, 1,
0.2480692, -0.3337298, 1.236269, 0, 0.4431373, 1, 1,
0.2491781, -0.1954733, 1.483453, 0, 0.4352941, 1, 1,
0.2496752, 0.4761504, 0.2885806, 0, 0.4313726, 1, 1,
0.249979, 0.6840162, -0.9990701, 0, 0.4235294, 1, 1,
0.2538741, 3.187032, 1.497575, 0, 0.4196078, 1, 1,
0.2553485, 0.7572474, 1.341673, 0, 0.4117647, 1, 1,
0.2560303, -1.500259, 3.109473, 0, 0.4078431, 1, 1,
0.2564232, 1.094169, 0.4612091, 0, 0.4, 1, 1,
0.2571979, -1.893443, 2.43811, 0, 0.3921569, 1, 1,
0.2574483, 2.443204, 0.1456615, 0, 0.3882353, 1, 1,
0.2597924, -0.7836775, 2.104509, 0, 0.3803922, 1, 1,
0.2623131, 0.3470451, 0.2452483, 0, 0.3764706, 1, 1,
0.2630838, -1.196626, 2.473636, 0, 0.3686275, 1, 1,
0.2675914, 0.2657808, 1.168854, 0, 0.3647059, 1, 1,
0.268673, 1.057986, 0.1727946, 0, 0.3568628, 1, 1,
0.2714688, 0.5277976, -0.7100339, 0, 0.3529412, 1, 1,
0.2726137, 0.7191846, -0.5279894, 0, 0.345098, 1, 1,
0.2755029, -0.3752885, 2.554156, 0, 0.3411765, 1, 1,
0.2767574, 0.8426109, 1.927398, 0, 0.3333333, 1, 1,
0.2782851, -0.766433, 2.346709, 0, 0.3294118, 1, 1,
0.2830676, 0.4461121, 1.452215, 0, 0.3215686, 1, 1,
0.2846671, 1.868884, 0.6136554, 0, 0.3176471, 1, 1,
0.2878611, 0.9308669, 0.03918495, 0, 0.3098039, 1, 1,
0.2885923, 0.6876648, -0.5145206, 0, 0.3058824, 1, 1,
0.2887064, 1.061195, 0.7715069, 0, 0.2980392, 1, 1,
0.2910149, 0.09584869, 0.6399376, 0, 0.2901961, 1, 1,
0.2911746, 0.04048279, 0.7276851, 0, 0.2862745, 1, 1,
0.2937561, 0.06626511, 1.742831, 0, 0.2784314, 1, 1,
0.2978911, 1.671522, -0.1643681, 0, 0.2745098, 1, 1,
0.2981063, -0.7966383, 1.484323, 0, 0.2666667, 1, 1,
0.2983663, 0.2525101, 2.734428, 0, 0.2627451, 1, 1,
0.3024715, -2.0007, 3.231653, 0, 0.254902, 1, 1,
0.3061573, 1.262098, -0.7695205, 0, 0.2509804, 1, 1,
0.3089803, 1.760782, -0.3699129, 0, 0.2431373, 1, 1,
0.3117847, 0.5561394, -0.4984589, 0, 0.2392157, 1, 1,
0.3131781, 0.3860086, 1.086077, 0, 0.2313726, 1, 1,
0.3137902, 0.001070701, 0.4856147, 0, 0.227451, 1, 1,
0.3148438, 0.6318191, 1.626804, 0, 0.2196078, 1, 1,
0.3161698, -0.2117105, 0.1383131, 0, 0.2156863, 1, 1,
0.3201606, 0.5309394, 2.170339, 0, 0.2078431, 1, 1,
0.3205381, -2.048002, 3.773741, 0, 0.2039216, 1, 1,
0.3217015, -1.181768, 2.14827, 0, 0.1960784, 1, 1,
0.3226877, -0.344782, 1.667283, 0, 0.1882353, 1, 1,
0.3233176, -0.2956817, 1.348568, 0, 0.1843137, 1, 1,
0.3250593, -0.6276519, 0.7594526, 0, 0.1764706, 1, 1,
0.327172, 0.3519908, -0.3417025, 0, 0.172549, 1, 1,
0.3295493, -1.413829, 4.022685, 0, 0.1647059, 1, 1,
0.331022, 0.1081391, 1.861084, 0, 0.1607843, 1, 1,
0.3323267, -1.340187, 3.600286, 0, 0.1529412, 1, 1,
0.3354957, 0.2219698, 1.598871, 0, 0.1490196, 1, 1,
0.3356827, 0.3338752, 1.413967, 0, 0.1411765, 1, 1,
0.3357931, 0.2907057, 0.5197465, 0, 0.1372549, 1, 1,
0.3480948, 0.5478464, -0.4164511, 0, 0.1294118, 1, 1,
0.3498584, -0.6346039, 3.223605, 0, 0.1254902, 1, 1,
0.3499531, 0.3798646, -0.3257497, 0, 0.1176471, 1, 1,
0.3506147, -0.1100666, 2.456144, 0, 0.1137255, 1, 1,
0.353352, 1.304883, 0.6541771, 0, 0.1058824, 1, 1,
0.3573874, 0.4515477, -1.159291, 0, 0.09803922, 1, 1,
0.3575033, 0.1956878, 0.4116294, 0, 0.09411765, 1, 1,
0.3598252, 0.8401788, 0.875048, 0, 0.08627451, 1, 1,
0.3600023, -0.1748776, 1.454874, 0, 0.08235294, 1, 1,
0.3606218, -0.4731019, 4.157421, 0, 0.07450981, 1, 1,
0.3655499, 1.452391, -0.5472367, 0, 0.07058824, 1, 1,
0.3691691, -0.4326878, 3.235247, 0, 0.0627451, 1, 1,
0.3712445, 0.4971531, -0.02051395, 0, 0.05882353, 1, 1,
0.3718377, 0.2088169, 1.104566, 0, 0.05098039, 1, 1,
0.37512, -0.6995685, 2.147486, 0, 0.04705882, 1, 1,
0.37526, 1.179417, -2.678714, 0, 0.03921569, 1, 1,
0.3753368, 0.3515127, 0.6547751, 0, 0.03529412, 1, 1,
0.3780712, -0.09358338, 1.348748, 0, 0.02745098, 1, 1,
0.3785289, 0.4760526, 1.090902, 0, 0.02352941, 1, 1,
0.3818192, 1.841073, -1.403169, 0, 0.01568628, 1, 1,
0.382123, 0.1241537, 1.459427, 0, 0.01176471, 1, 1,
0.3859729, -0.7329175, 1.497862, 0, 0.003921569, 1, 1,
0.3931751, -0.3171399, 2.081321, 0.003921569, 0, 1, 1,
0.3997955, -1.338788, 3.706996, 0.007843138, 0, 1, 1,
0.4039637, 1.373767, -0.1403681, 0.01568628, 0, 1, 1,
0.411797, 0.632606, -2.107072, 0.01960784, 0, 1, 1,
0.4153628, -0.6731654, 2.740651, 0.02745098, 0, 1, 1,
0.4182071, -1.192262, 2.669311, 0.03137255, 0, 1, 1,
0.4196854, -0.744928, 1.209334, 0.03921569, 0, 1, 1,
0.4222248, -1.080426, 4.475511, 0.04313726, 0, 1, 1,
0.4232645, -1.284243, 4.076742, 0.05098039, 0, 1, 1,
0.4290954, 0.5188485, 0.472133, 0.05490196, 0, 1, 1,
0.4305403, 1.198017, 0.6464315, 0.0627451, 0, 1, 1,
0.4341762, 1.806305, -0.06996339, 0.06666667, 0, 1, 1,
0.4344095, -1.659716, 3.933804, 0.07450981, 0, 1, 1,
0.4382309, -0.717253, 4.568645, 0.07843138, 0, 1, 1,
0.4408109, -0.3576105, 2.537501, 0.08627451, 0, 1, 1,
0.4418298, 0.5088502, 0.3864433, 0.09019608, 0, 1, 1,
0.4419272, -1.318051, 2.215274, 0.09803922, 0, 1, 1,
0.4487597, 0.8855717, -0.1643509, 0.1058824, 0, 1, 1,
0.4561957, -1.306656, 3.320858, 0.1098039, 0, 1, 1,
0.4571384, -2.558947, 3.194221, 0.1176471, 0, 1, 1,
0.458757, -1.656067, 4.996962, 0.1215686, 0, 1, 1,
0.4607289, -0.855874, 2.598318, 0.1294118, 0, 1, 1,
0.4667363, -1.027654, 2.209763, 0.1333333, 0, 1, 1,
0.4702969, 0.8503155, 0.2315304, 0.1411765, 0, 1, 1,
0.4741333, -0.1936637, 3.586647, 0.145098, 0, 1, 1,
0.4749202, 0.7861825, 0.1588535, 0.1529412, 0, 1, 1,
0.4772082, 0.3985237, -0.2577069, 0.1568628, 0, 1, 1,
0.4845271, -1.446746, 2.985534, 0.1647059, 0, 1, 1,
0.4872812, -0.09867819, -0.2338122, 0.1686275, 0, 1, 1,
0.4902323, -0.9851432, 1.120525, 0.1764706, 0, 1, 1,
0.4982949, 1.04319, -2.210507, 0.1803922, 0, 1, 1,
0.5066095, -0.5590343, 3.431827, 0.1882353, 0, 1, 1,
0.5100922, 0.1292561, 0.7397208, 0.1921569, 0, 1, 1,
0.5157861, -1.078332, 3.546897, 0.2, 0, 1, 1,
0.5182198, 0.9245132, 0.2035576, 0.2078431, 0, 1, 1,
0.5182275, 1.614278, 1.101829, 0.2117647, 0, 1, 1,
0.5205091, 0.5703009, 2.467513, 0.2196078, 0, 1, 1,
0.520668, 0.3100558, 1.039723, 0.2235294, 0, 1, 1,
0.52297, -0.4253849, 1.879077, 0.2313726, 0, 1, 1,
0.5282579, -0.7789782, 4.571401, 0.2352941, 0, 1, 1,
0.5292322, -0.1457472, 1.300614, 0.2431373, 0, 1, 1,
0.5341911, 0.6169805, -0.1714414, 0.2470588, 0, 1, 1,
0.5381552, 0.5891704, 1.428617, 0.254902, 0, 1, 1,
0.5418159, -1.404423, 2.634813, 0.2588235, 0, 1, 1,
0.55057, -0.125209, 0.9381075, 0.2666667, 0, 1, 1,
0.551689, -0.2135602, 1.676135, 0.2705882, 0, 1, 1,
0.5543463, -1.810771, 3.035613, 0.2784314, 0, 1, 1,
0.5685478, 0.4518855, 0.5628967, 0.282353, 0, 1, 1,
0.5688254, -0.8192303, 5.324417, 0.2901961, 0, 1, 1,
0.5750632, 0.2324801, 1.954508, 0.2941177, 0, 1, 1,
0.5757245, 1.624482, 0.6018718, 0.3019608, 0, 1, 1,
0.5794459, -0.3872159, 2.034545, 0.3098039, 0, 1, 1,
0.579957, 1.778163, -0.7016802, 0.3137255, 0, 1, 1,
0.5804543, -1.080832, 3.099838, 0.3215686, 0, 1, 1,
0.5842956, -1.771044, 2.259243, 0.3254902, 0, 1, 1,
0.5857797, -1.367397, 1.929781, 0.3333333, 0, 1, 1,
0.5921172, 1.361756, 0.5315096, 0.3372549, 0, 1, 1,
0.5938265, -0.1849047, 2.727005, 0.345098, 0, 1, 1,
0.5939168, 0.03241763, 1.543358, 0.3490196, 0, 1, 1,
0.6000463, -0.7481387, 2.917976, 0.3568628, 0, 1, 1,
0.6036138, -0.6817999, 1.706722, 0.3607843, 0, 1, 1,
0.6076499, -0.4476188, 2.642563, 0.3686275, 0, 1, 1,
0.6081417, -0.6223669, 2.475865, 0.372549, 0, 1, 1,
0.6088805, -1.011808, 3.571046, 0.3803922, 0, 1, 1,
0.6153821, -0.4136146, 2.270458, 0.3843137, 0, 1, 1,
0.6206444, -1.129202, 3.128732, 0.3921569, 0, 1, 1,
0.6208939, -1.058205, 1.089495, 0.3960784, 0, 1, 1,
0.621979, -1.234271, 1.783663, 0.4039216, 0, 1, 1,
0.6225383, -1.30951, 3.080518, 0.4117647, 0, 1, 1,
0.62748, 0.151123, 0.5282224, 0.4156863, 0, 1, 1,
0.6279438, 0.4639658, 0.9214023, 0.4235294, 0, 1, 1,
0.6279546, -0.05097522, 1.267817, 0.427451, 0, 1, 1,
0.6281041, 0.3500602, -0.3605447, 0.4352941, 0, 1, 1,
0.6318179, 0.687428, 1.757536, 0.4392157, 0, 1, 1,
0.6323918, 0.8746338, -1.10534, 0.4470588, 0, 1, 1,
0.6348715, -0.4282854, 1.844465, 0.4509804, 0, 1, 1,
0.6391833, -0.7085632, 2.38256, 0.4588235, 0, 1, 1,
0.640633, 0.9772269, 1.29889, 0.4627451, 0, 1, 1,
0.6419139, -0.6510555, 1.995413, 0.4705882, 0, 1, 1,
0.6427028, 0.399481, 0.8468886, 0.4745098, 0, 1, 1,
0.6446457, -0.5064492, 2.725852, 0.4823529, 0, 1, 1,
0.6458078, 0.1561746, 1.57939, 0.4862745, 0, 1, 1,
0.6535504, 1.886567, 0.7331815, 0.4941176, 0, 1, 1,
0.6557637, 0.5883683, 0.9750339, 0.5019608, 0, 1, 1,
0.6583791, -0.3004047, 2.794853, 0.5058824, 0, 1, 1,
0.6668399, -0.2764664, 1.790171, 0.5137255, 0, 1, 1,
0.6686218, -1.059419, 1.055745, 0.5176471, 0, 1, 1,
0.6686692, -0.9022812, 3.055079, 0.5254902, 0, 1, 1,
0.6709866, -0.8099642, 4.199026, 0.5294118, 0, 1, 1,
0.6771005, -0.5404364, 1.557441, 0.5372549, 0, 1, 1,
0.6783147, 0.5705976, 2.292205, 0.5411765, 0, 1, 1,
0.6885938, -0.9132795, 2.465063, 0.5490196, 0, 1, 1,
0.6906797, 0.5325086, -0.4396927, 0.5529412, 0, 1, 1,
0.6912695, -0.3187056, 2.269439, 0.5607843, 0, 1, 1,
0.6953229, -1.379055, 3.503876, 0.5647059, 0, 1, 1,
0.6979903, 0.3175681, 1.934747, 0.572549, 0, 1, 1,
0.7008326, 0.1693803, 2.382495, 0.5764706, 0, 1, 1,
0.7012109, -0.3976647, 1.298594, 0.5843138, 0, 1, 1,
0.7028869, 1.214859, 1.408612, 0.5882353, 0, 1, 1,
0.708941, -0.08298415, 1.626018, 0.5960785, 0, 1, 1,
0.7175952, 0.6307001, 1.01231, 0.6039216, 0, 1, 1,
0.7185514, 0.6141633, 0.200928, 0.6078432, 0, 1, 1,
0.7194442, 0.98826, 1.056098, 0.6156863, 0, 1, 1,
0.7254747, -0.6126875, 2.677334, 0.6196079, 0, 1, 1,
0.7259753, -2.410839, 1.447025, 0.627451, 0, 1, 1,
0.7309507, 0.9886988, 1.582377, 0.6313726, 0, 1, 1,
0.7327896, -0.7153049, 3.761715, 0.6392157, 0, 1, 1,
0.7331457, 0.6753094, 0.5266698, 0.6431373, 0, 1, 1,
0.7335387, -0.001295137, 0.1036388, 0.6509804, 0, 1, 1,
0.7335711, 1.164879, -0.7595662, 0.654902, 0, 1, 1,
0.7368194, -0.7755784, 2.49288, 0.6627451, 0, 1, 1,
0.7395415, -1.227839, 2.360405, 0.6666667, 0, 1, 1,
0.7410731, 1.913873, 0.5193248, 0.6745098, 0, 1, 1,
0.7419692, 0.7583078, 0.4513545, 0.6784314, 0, 1, 1,
0.7438154, 1.182186, -0.219364, 0.6862745, 0, 1, 1,
0.7455901, 0.8564249, 0.6069682, 0.6901961, 0, 1, 1,
0.7468756, -1.17768, 2.136568, 0.6980392, 0, 1, 1,
0.7527635, -0.8581421, 3.550844, 0.7058824, 0, 1, 1,
0.7560018, -1.731847, 2.476946, 0.7098039, 0, 1, 1,
0.7562692, 0.304103, 0.3440603, 0.7176471, 0, 1, 1,
0.7564387, 0.761947, 1.135836, 0.7215686, 0, 1, 1,
0.760293, 0.4791102, 1.060543, 0.7294118, 0, 1, 1,
0.7608684, -0.3097588, 1.210138, 0.7333333, 0, 1, 1,
0.7611094, -0.4010341, 1.509928, 0.7411765, 0, 1, 1,
0.7643214, -0.06886168, 1.853572, 0.7450981, 0, 1, 1,
0.7681952, 0.3518052, 0.4295402, 0.7529412, 0, 1, 1,
0.7808357, 0.6978687, 0.1212892, 0.7568628, 0, 1, 1,
0.7821141, -1.819917, 1.461988, 0.7647059, 0, 1, 1,
0.7837167, 0.177579, 2.01231, 0.7686275, 0, 1, 1,
0.7922466, -0.1753128, 1.107503, 0.7764706, 0, 1, 1,
0.8025492, 0.5278061, 0.5522083, 0.7803922, 0, 1, 1,
0.8050407, 1.020882, 1.484016, 0.7882353, 0, 1, 1,
0.8134549, -0.373439, 2.04196, 0.7921569, 0, 1, 1,
0.8180799, 1.132038, 0.2069398, 0.8, 0, 1, 1,
0.8190708, 2.19587, 0.8418152, 0.8078431, 0, 1, 1,
0.8198195, 0.6850094, 0.2072634, 0.8117647, 0, 1, 1,
0.8215786, -1.095029, 4.016131, 0.8196079, 0, 1, 1,
0.8232469, -1.028434, 3.48883, 0.8235294, 0, 1, 1,
0.8257741, 1.148641, 1.214291, 0.8313726, 0, 1, 1,
0.8272057, -0.6672033, 1.4684, 0.8352941, 0, 1, 1,
0.8313407, -0.02620623, 2.429911, 0.8431373, 0, 1, 1,
0.8333556, 0.6011301, 0.8389078, 0.8470588, 0, 1, 1,
0.8476488, 0.5612835, 2.161403, 0.854902, 0, 1, 1,
0.8521051, 1.388867, -0.8683895, 0.8588235, 0, 1, 1,
0.8564233, 0.1144642, 0.06593586, 0.8666667, 0, 1, 1,
0.8625557, -1.705505, 1.767994, 0.8705882, 0, 1, 1,
0.8705937, -0.1494533, 1.446347, 0.8784314, 0, 1, 1,
0.872591, 1.148278, 1.176486, 0.8823529, 0, 1, 1,
0.8737574, 0.2790544, 0.9254449, 0.8901961, 0, 1, 1,
0.8750058, -1.301479, 2.115074, 0.8941177, 0, 1, 1,
0.8792461, -0.2219014, 0.988218, 0.9019608, 0, 1, 1,
0.879462, 1.348432, 0.176925, 0.9098039, 0, 1, 1,
0.8819399, 0.9058653, 0.9079432, 0.9137255, 0, 1, 1,
0.882557, 1.78548, 0.7042466, 0.9215686, 0, 1, 1,
0.8882014, -0.4964882, 1.924376, 0.9254902, 0, 1, 1,
0.8942157, -1.036272, 3.007959, 0.9333333, 0, 1, 1,
0.8960208, 1.572879, 1.380797, 0.9372549, 0, 1, 1,
0.8999892, -1.030818, 3.310564, 0.945098, 0, 1, 1,
0.9047919, 0.5778976, 1.329905, 0.9490196, 0, 1, 1,
0.9080704, -1.869395, 2.36061, 0.9568627, 0, 1, 1,
0.9203721, -0.9312572, 1.310225, 0.9607843, 0, 1, 1,
0.9288952, 0.2969578, 1.181623, 0.9686275, 0, 1, 1,
0.9314939, -0.176228, 2.715219, 0.972549, 0, 1, 1,
0.9339903, 1.236928, 1.471135, 0.9803922, 0, 1, 1,
0.9401825, -2.602782, 3.990164, 0.9843137, 0, 1, 1,
0.9405787, -0.7201411, 2.244864, 0.9921569, 0, 1, 1,
0.943752, 0.855918, -1.421019, 0.9960784, 0, 1, 1,
0.9493224, 1.039464, 1.654576, 1, 0, 0.9960784, 1,
0.956562, 0.4594673, 0.7807202, 1, 0, 0.9882353, 1,
0.9573037, -1.265894, 2.565771, 1, 0, 0.9843137, 1,
0.9693839, -1.748477, 3.326052, 1, 0, 0.9764706, 1,
0.9716005, -0.5378389, 2.295089, 1, 0, 0.972549, 1,
0.9747773, 0.2379848, 1.038414, 1, 0, 0.9647059, 1,
0.9782252, 0.5111418, 1.791596, 1, 0, 0.9607843, 1,
0.97903, 0.8354114, 1.280086, 1, 0, 0.9529412, 1,
0.9867429, 2.544594, -0.4404745, 1, 0, 0.9490196, 1,
0.9931952, 0.1897167, 0.4986169, 1, 0, 0.9411765, 1,
1.00264, -0.3225173, 0.4793746, 1, 0, 0.9372549, 1,
1.003337, -0.3745694, 2.013848, 1, 0, 0.9294118, 1,
1.008906, 0.05151924, 0.2947765, 1, 0, 0.9254902, 1,
1.014722, 1.708479, 0.1168957, 1, 0, 0.9176471, 1,
1.025308, -1.146397, 3.339947, 1, 0, 0.9137255, 1,
1.027741, -0.04106568, 1.151472, 1, 0, 0.9058824, 1,
1.028192, 0.1206749, 2.546479, 1, 0, 0.9019608, 1,
1.029674, -0.2504775, 3.230373, 1, 0, 0.8941177, 1,
1.038386, -0.9871999, 0.4324237, 1, 0, 0.8862745, 1,
1.039008, 1.181225, -0.03938589, 1, 0, 0.8823529, 1,
1.041066, -1.324189, 2.095852, 1, 0, 0.8745098, 1,
1.047755, -0.3820516, 2.809046, 1, 0, 0.8705882, 1,
1.052058, -3.378848, 3.068729, 1, 0, 0.8627451, 1,
1.054482, -1.238491, 2.803001, 1, 0, 0.8588235, 1,
1.065116, 0.3868787, 0.4335303, 1, 0, 0.8509804, 1,
1.067523, -0.5864308, 1.28175, 1, 0, 0.8470588, 1,
1.069645, 1.662268, 1.777073, 1, 0, 0.8392157, 1,
1.069683, -2.20098, 1.168475, 1, 0, 0.8352941, 1,
1.074464, -1.324413, 2.364191, 1, 0, 0.827451, 1,
1.081936, -0.9682291, 2.798843, 1, 0, 0.8235294, 1,
1.08718, 0.7354013, 0.7332843, 1, 0, 0.8156863, 1,
1.089553, 0.160541, 0.08910167, 1, 0, 0.8117647, 1,
1.09021, -0.6594318, 2.063371, 1, 0, 0.8039216, 1,
1.106672, 0.8752122, -0.05564311, 1, 0, 0.7960784, 1,
1.107159, -0.003176618, 0.7643306, 1, 0, 0.7921569, 1,
1.11214, -0.2587814, -0.04811509, 1, 0, 0.7843137, 1,
1.125516, -0.2547994, -0.1986618, 1, 0, 0.7803922, 1,
1.12884, -2.11487, 3.779317, 1, 0, 0.772549, 1,
1.129301, 0.2613154, 1.604278, 1, 0, 0.7686275, 1,
1.130226, -1.322076, 1.770271, 1, 0, 0.7607843, 1,
1.140318, -0.716481, 3.325315, 1, 0, 0.7568628, 1,
1.149784, -0.1366808, 2.972966, 1, 0, 0.7490196, 1,
1.150432, -0.0452959, 3.760266, 1, 0, 0.7450981, 1,
1.155561, -0.04024551, -0.2184722, 1, 0, 0.7372549, 1,
1.160994, 0.9629458, 0.999186, 1, 0, 0.7333333, 1,
1.161115, 0.09264202, 1.702109, 1, 0, 0.7254902, 1,
1.161433, 0.05026592, 1.340615, 1, 0, 0.7215686, 1,
1.168607, -1.148592, 2.587651, 1, 0, 0.7137255, 1,
1.178949, -1.697888, 2.132899, 1, 0, 0.7098039, 1,
1.180934, 0.6627811, 0.5860355, 1, 0, 0.7019608, 1,
1.192842, 1.289946, 1.623085, 1, 0, 0.6941177, 1,
1.204521, -0.4259667, 2.574297, 1, 0, 0.6901961, 1,
1.210902, 0.1552071, 1.176093, 1, 0, 0.682353, 1,
1.212027, 0.6047501, 2.248674, 1, 0, 0.6784314, 1,
1.214673, -0.5275779, 2.346173, 1, 0, 0.6705883, 1,
1.217427, 1.319003, 1.146134, 1, 0, 0.6666667, 1,
1.217949, 0.1427654, 0.2195383, 1, 0, 0.6588235, 1,
1.224579, 1.808645, 0.2214381, 1, 0, 0.654902, 1,
1.227406, 0.6678917, 0.8108434, 1, 0, 0.6470588, 1,
1.237463, 0.8042093, 0.2896161, 1, 0, 0.6431373, 1,
1.251376, -1.020895, 2.043006, 1, 0, 0.6352941, 1,
1.251608, -0.596055, 2.048027, 1, 0, 0.6313726, 1,
1.259631, -0.1286924, 0.0948523, 1, 0, 0.6235294, 1,
1.276269, -0.8208051, 2.246497, 1, 0, 0.6196079, 1,
1.281473, 1.172353, 1.837645, 1, 0, 0.6117647, 1,
1.281749, -0.674653, 2.183627, 1, 0, 0.6078432, 1,
1.304378, 0.5638827, 1.519368, 1, 0, 0.6, 1,
1.318515, -0.4407893, 2.203871, 1, 0, 0.5921569, 1,
1.318669, 0.7940248, -1.172403, 1, 0, 0.5882353, 1,
1.351508, -0.2210388, 3.660049, 1, 0, 0.5803922, 1,
1.369059, 0.4068841, 1.920931, 1, 0, 0.5764706, 1,
1.371178, -0.1317624, 2.489131, 1, 0, 0.5686275, 1,
1.371431, 0.3192959, 2.470993, 1, 0, 0.5647059, 1,
1.374226, 0.4063653, 1.385673, 1, 0, 0.5568628, 1,
1.379902, 0.4799239, 1.653662, 1, 0, 0.5529412, 1,
1.385305, -0.5319792, 0.7184818, 1, 0, 0.5450981, 1,
1.389616, -0.142271, -0.05657435, 1, 0, 0.5411765, 1,
1.40162, -0.05613887, 1.019137, 1, 0, 0.5333334, 1,
1.413849, -0.1629938, 2.532461, 1, 0, 0.5294118, 1,
1.418183, 0.5978568, 1.88941, 1, 0, 0.5215687, 1,
1.419514, 0.02253335, 0.3443092, 1, 0, 0.5176471, 1,
1.4319, 0.566283, 0.5012128, 1, 0, 0.509804, 1,
1.435712, 1.912906, 0.1952951, 1, 0, 0.5058824, 1,
1.440188, 0.09358685, 1.512233, 1, 0, 0.4980392, 1,
1.446748, 1.212309, 1.322004, 1, 0, 0.4901961, 1,
1.450554, 0.3179286, 0.02386699, 1, 0, 0.4862745, 1,
1.474496, 0.3008355, 0.4999916, 1, 0, 0.4784314, 1,
1.477392, -2.267481, 1.567245, 1, 0, 0.4745098, 1,
1.477527, -0.5597149, 2.897147, 1, 0, 0.4666667, 1,
1.49998, 1.114839, 1.503966, 1, 0, 0.4627451, 1,
1.503187, 0.09709966, -0.3843537, 1, 0, 0.454902, 1,
1.505414, 1.159219, 2.01299, 1, 0, 0.4509804, 1,
1.506516, 0.5457129, 2.642272, 1, 0, 0.4431373, 1,
1.507453, 0.6513169, 1.885496, 1, 0, 0.4392157, 1,
1.509391, 0.1047262, 1.433596, 1, 0, 0.4313726, 1,
1.511579, 0.1590294, 1.248018, 1, 0, 0.427451, 1,
1.520334, -0.2534932, 2.744895, 1, 0, 0.4196078, 1,
1.525865, 0.6797534, -0.8142851, 1, 0, 0.4156863, 1,
1.529814, -1.927823, 1.55722, 1, 0, 0.4078431, 1,
1.532345, -0.5297238, 2.407744, 1, 0, 0.4039216, 1,
1.547282, -1.13235, 3.643325, 1, 0, 0.3960784, 1,
1.547572, 0.6415358, -0.6167722, 1, 0, 0.3882353, 1,
1.55412, -0.6132865, 0.9899156, 1, 0, 0.3843137, 1,
1.557012, 1.592796, 0.8980275, 1, 0, 0.3764706, 1,
1.561805, 0.1932611, 0.6732374, 1, 0, 0.372549, 1,
1.58076, -0.3619731, 0.7163097, 1, 0, 0.3647059, 1,
1.584521, -1.401564, 2.980187, 1, 0, 0.3607843, 1,
1.591168, 0.7922847, 0.8316736, 1, 0, 0.3529412, 1,
1.602448, -0.37794, 1.731906, 1, 0, 0.3490196, 1,
1.633993, 1.09108, 2.983058, 1, 0, 0.3411765, 1,
1.634234, 2.313522, 1.775461, 1, 0, 0.3372549, 1,
1.649142, 0.4809445, 0.7411634, 1, 0, 0.3294118, 1,
1.652891, 0.9113044, 1.284884, 1, 0, 0.3254902, 1,
1.657908, 0.9362869, 2.588418, 1, 0, 0.3176471, 1,
1.68976, -0.6506941, 2.251736, 1, 0, 0.3137255, 1,
1.693025, -1.134975, 2.371609, 1, 0, 0.3058824, 1,
1.705597, -0.8106261, 1.377952, 1, 0, 0.2980392, 1,
1.71826, -1.280686, 1.356813, 1, 0, 0.2941177, 1,
1.719332, 1.11832, 1.739737, 1, 0, 0.2862745, 1,
1.730425, 0.3501691, 1.153049, 1, 0, 0.282353, 1,
1.735324, -0.6858736, 3.136494, 1, 0, 0.2745098, 1,
1.744154, -0.444001, 2.635189, 1, 0, 0.2705882, 1,
1.744224, 0.08251826, 3.122755, 1, 0, 0.2627451, 1,
1.747279, 1.912603, 0.798328, 1, 0, 0.2588235, 1,
1.750721, 0.3204978, 1.789139, 1, 0, 0.2509804, 1,
1.7602, 0.1610877, 1.79509, 1, 0, 0.2470588, 1,
1.770656, -1.208635, 2.019488, 1, 0, 0.2392157, 1,
1.790665, -0.9463713, 2.0316, 1, 0, 0.2352941, 1,
1.805236, 0.006647432, 4.607869, 1, 0, 0.227451, 1,
1.846141, -0.6797286, 1.03861, 1, 0, 0.2235294, 1,
1.851681, -0.3616047, 0.8247505, 1, 0, 0.2156863, 1,
1.89427, -2.147048, 1.602994, 1, 0, 0.2117647, 1,
1.900638, 0.8407281, 1.72451, 1, 0, 0.2039216, 1,
1.915594, -1.040621, 0.6600381, 1, 0, 0.1960784, 1,
1.957349, 0.5401176, 1.444153, 1, 0, 0.1921569, 1,
1.957616, -0.4488221, 2.952693, 1, 0, 0.1843137, 1,
1.973622, 0.5500034, 2.626693, 1, 0, 0.1803922, 1,
1.993135, 0.412176, 0.3864096, 1, 0, 0.172549, 1,
1.99481, 0.718956, 0.7676907, 1, 0, 0.1686275, 1,
2.018274, 1.422287, -0.3808166, 1, 0, 0.1607843, 1,
2.022375, 1.100101, 0.6647849, 1, 0, 0.1568628, 1,
2.037678, -0.1538409, 1.417555, 1, 0, 0.1490196, 1,
2.037752, -0.06258848, 0.7899937, 1, 0, 0.145098, 1,
2.03813, 0.6230914, 0.4410266, 1, 0, 0.1372549, 1,
2.058172, -0.3432872, 1.873772, 1, 0, 0.1333333, 1,
2.070607, 0.9064345, 1.962287, 1, 0, 0.1254902, 1,
2.07473, -0.7021216, 1.908778, 1, 0, 0.1215686, 1,
2.08313, 0.018246, 2.220829, 1, 0, 0.1137255, 1,
2.096205, -0.9184484, 3.013687, 1, 0, 0.1098039, 1,
2.110029, 0.6900393, 1.016128, 1, 0, 0.1019608, 1,
2.118508, 0.5189776, 1.92491, 1, 0, 0.09411765, 1,
2.138756, -0.2716487, 1.392716, 1, 0, 0.09019608, 1,
2.158831, -2.043042, 1.327958, 1, 0, 0.08235294, 1,
2.17389, -0.2371448, 0.1786297, 1, 0, 0.07843138, 1,
2.225969, -0.8336484, 1.00273, 1, 0, 0.07058824, 1,
2.307244, 0.8825656, 1.724974, 1, 0, 0.06666667, 1,
2.316943, 2.032123, 0.9742611, 1, 0, 0.05882353, 1,
2.334281, 1.425098, 1.93665, 1, 0, 0.05490196, 1,
2.389327, -1.588054, 2.421249, 1, 0, 0.04705882, 1,
2.42826, 0.1686702, 1.879967, 1, 0, 0.04313726, 1,
2.457124, 1.373376, 0.8828574, 1, 0, 0.03529412, 1,
2.544285, 0.6980208, 0.6148986, 1, 0, 0.03137255, 1,
2.763722, -0.05757612, 0.8720173, 1, 0, 0.02352941, 1,
2.769398, -0.0204191, 1.487814, 1, 0, 0.01960784, 1,
2.890637, 1.542779, 1.588912, 1, 0, 0.01176471, 1,
3.057639, 0.9933552, 0.8927248, 1, 0, 0.007843138, 1
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
0.2399703, -4.581297, -6.89402, 0, -0.5, 0.5, 0.5,
0.2399703, -4.581297, -6.89402, 1, -0.5, 0.5, 0.5,
0.2399703, -4.581297, -6.89402, 1, 1.5, 0.5, 0.5,
0.2399703, -4.581297, -6.89402, 0, 1.5, 0.5, 0.5
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
-3.532887, 0.1682007, -6.89402, 0, -0.5, 0.5, 0.5,
-3.532887, 0.1682007, -6.89402, 1, -0.5, 0.5, 0.5,
-3.532887, 0.1682007, -6.89402, 1, 1.5, 0.5, 0.5,
-3.532887, 0.1682007, -6.89402, 0, 1.5, 0.5, 0.5
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
-3.532887, -4.581297, 0.10063, 0, -0.5, 0.5, 0.5,
-3.532887, -4.581297, 0.10063, 1, -0.5, 0.5, 0.5,
-3.532887, -4.581297, 0.10063, 1, 1.5, 0.5, 0.5,
-3.532887, -4.581297, 0.10063, 0, 1.5, 0.5, 0.5
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
-2, -3.48526, -5.27987,
3, -3.48526, -5.27987,
-2, -3.48526, -5.27987,
-2, -3.667933, -5.548895,
-1, -3.48526, -5.27987,
-1, -3.667933, -5.548895,
0, -3.48526, -5.27987,
0, -3.667933, -5.548895,
1, -3.48526, -5.27987,
1, -3.667933, -5.548895,
2, -3.48526, -5.27987,
2, -3.667933, -5.548895,
3, -3.48526, -5.27987,
3, -3.667933, -5.548895
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
-2, -4.033278, -6.086945, 0, -0.5, 0.5, 0.5,
-2, -4.033278, -6.086945, 1, -0.5, 0.5, 0.5,
-2, -4.033278, -6.086945, 1, 1.5, 0.5, 0.5,
-2, -4.033278, -6.086945, 0, 1.5, 0.5, 0.5,
-1, -4.033278, -6.086945, 0, -0.5, 0.5, 0.5,
-1, -4.033278, -6.086945, 1, -0.5, 0.5, 0.5,
-1, -4.033278, -6.086945, 1, 1.5, 0.5, 0.5,
-1, -4.033278, -6.086945, 0, 1.5, 0.5, 0.5,
0, -4.033278, -6.086945, 0, -0.5, 0.5, 0.5,
0, -4.033278, -6.086945, 1, -0.5, 0.5, 0.5,
0, -4.033278, -6.086945, 1, 1.5, 0.5, 0.5,
0, -4.033278, -6.086945, 0, 1.5, 0.5, 0.5,
1, -4.033278, -6.086945, 0, -0.5, 0.5, 0.5,
1, -4.033278, -6.086945, 1, -0.5, 0.5, 0.5,
1, -4.033278, -6.086945, 1, 1.5, 0.5, 0.5,
1, -4.033278, -6.086945, 0, 1.5, 0.5, 0.5,
2, -4.033278, -6.086945, 0, -0.5, 0.5, 0.5,
2, -4.033278, -6.086945, 1, -0.5, 0.5, 0.5,
2, -4.033278, -6.086945, 1, 1.5, 0.5, 0.5,
2, -4.033278, -6.086945, 0, 1.5, 0.5, 0.5,
3, -4.033278, -6.086945, 0, -0.5, 0.5, 0.5,
3, -4.033278, -6.086945, 1, -0.5, 0.5, 0.5,
3, -4.033278, -6.086945, 1, 1.5, 0.5, 0.5,
3, -4.033278, -6.086945, 0, 1.5, 0.5, 0.5
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
-2.662228, -2, -5.27987,
-2.662228, 2, -5.27987,
-2.662228, -2, -5.27987,
-2.807338, -2, -5.548895,
-2.662228, 0, -5.27987,
-2.807338, 0, -5.548895,
-2.662228, 2, -5.27987,
-2.807338, 2, -5.548895
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
"0",
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
-3.097558, -2, -6.086945, 0, -0.5, 0.5, 0.5,
-3.097558, -2, -6.086945, 1, -0.5, 0.5, 0.5,
-3.097558, -2, -6.086945, 1, 1.5, 0.5, 0.5,
-3.097558, -2, -6.086945, 0, 1.5, 0.5, 0.5,
-3.097558, 0, -6.086945, 0, -0.5, 0.5, 0.5,
-3.097558, 0, -6.086945, 1, -0.5, 0.5, 0.5,
-3.097558, 0, -6.086945, 1, 1.5, 0.5, 0.5,
-3.097558, 0, -6.086945, 0, 1.5, 0.5, 0.5,
-3.097558, 2, -6.086945, 0, -0.5, 0.5, 0.5,
-3.097558, 2, -6.086945, 1, -0.5, 0.5, 0.5,
-3.097558, 2, -6.086945, 1, 1.5, 0.5, 0.5,
-3.097558, 2, -6.086945, 0, 1.5, 0.5, 0.5
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
-2.662228, -3.48526, -4,
-2.662228, -3.48526, 4,
-2.662228, -3.48526, -4,
-2.807338, -3.667933, -4,
-2.662228, -3.48526, -2,
-2.807338, -3.667933, -2,
-2.662228, -3.48526, 0,
-2.807338, -3.667933, 0,
-2.662228, -3.48526, 2,
-2.807338, -3.667933, 2,
-2.662228, -3.48526, 4,
-2.807338, -3.667933, 4
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
-3.097558, -4.033278, -4, 0, -0.5, 0.5, 0.5,
-3.097558, -4.033278, -4, 1, -0.5, 0.5, 0.5,
-3.097558, -4.033278, -4, 1, 1.5, 0.5, 0.5,
-3.097558, -4.033278, -4, 0, 1.5, 0.5, 0.5,
-3.097558, -4.033278, -2, 0, -0.5, 0.5, 0.5,
-3.097558, -4.033278, -2, 1, -0.5, 0.5, 0.5,
-3.097558, -4.033278, -2, 1, 1.5, 0.5, 0.5,
-3.097558, -4.033278, -2, 0, 1.5, 0.5, 0.5,
-3.097558, -4.033278, 0, 0, -0.5, 0.5, 0.5,
-3.097558, -4.033278, 0, 1, -0.5, 0.5, 0.5,
-3.097558, -4.033278, 0, 1, 1.5, 0.5, 0.5,
-3.097558, -4.033278, 0, 0, 1.5, 0.5, 0.5,
-3.097558, -4.033278, 2, 0, -0.5, 0.5, 0.5,
-3.097558, -4.033278, 2, 1, -0.5, 0.5, 0.5,
-3.097558, -4.033278, 2, 1, 1.5, 0.5, 0.5,
-3.097558, -4.033278, 2, 0, 1.5, 0.5, 0.5,
-3.097558, -4.033278, 4, 0, -0.5, 0.5, 0.5,
-3.097558, -4.033278, 4, 1, -0.5, 0.5, 0.5,
-3.097558, -4.033278, 4, 1, 1.5, 0.5, 0.5,
-3.097558, -4.033278, 4, 0, 1.5, 0.5, 0.5
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
-2.662228, -3.48526, -5.27987,
-2.662228, 3.821661, -5.27987,
-2.662228, -3.48526, 5.48113,
-2.662228, 3.821661, 5.48113,
-2.662228, -3.48526, -5.27987,
-2.662228, -3.48526, 5.48113,
-2.662228, 3.821661, -5.27987,
-2.662228, 3.821661, 5.48113,
-2.662228, -3.48526, -5.27987,
3.142169, -3.48526, -5.27987,
-2.662228, -3.48526, 5.48113,
3.142169, -3.48526, 5.48113,
-2.662228, 3.821661, -5.27987,
3.142169, 3.821661, -5.27987,
-2.662228, 3.821661, 5.48113,
3.142169, 3.821661, 5.48113,
3.142169, -3.48526, -5.27987,
3.142169, 3.821661, -5.27987,
3.142169, -3.48526, 5.48113,
3.142169, 3.821661, 5.48113,
3.142169, -3.48526, -5.27987,
3.142169, -3.48526, 5.48113,
3.142169, 3.821661, -5.27987,
3.142169, 3.821661, 5.48113
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
var radius = 7.605826;
var distance = 33.83918;
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
mvMatrix.translate( -0.2399703, -0.1682007, -0.10063 );
mvMatrix.scale( 1.416783, 1.125449, 0.7642011 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.83918);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
silvex<-read.table("silvex.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-silvex$V2
```

```
## Error in eval(expr, envir, enclos): object 'silvex' not found
```

```r
y<-silvex$V3
```

```
## Error in eval(expr, envir, enclos): object 'silvex' not found
```

```r
z<-silvex$V4
```

```
## Error in eval(expr, envir, enclos): object 'silvex' not found
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
-2.577698, 0.5571137, -2.727215, 0, 0, 1, 1, 1,
-2.551545, -0.6073129, -1.235016, 1, 0, 0, 1, 1,
-2.501202, 1.215592, -0.3644338, 1, 0, 0, 1, 1,
-2.44342, -1.518643, -0.3090531, 1, 0, 0, 1, 1,
-2.398789, -0.8398325, -1.703352, 1, 0, 0, 1, 1,
-2.292409, -0.2289543, -1.874816, 1, 0, 0, 1, 1,
-2.270918, -0.2612597, -0.1461158, 0, 0, 0, 1, 1,
-2.22422, -0.2390633, -2.175838, 0, 0, 0, 1, 1,
-2.217876, 0.8369843, -0.8511233, 0, 0, 0, 1, 1,
-2.207125, -0.3829504, -2.175806, 0, 0, 0, 1, 1,
-2.204243, 1.098661, -1.730193, 0, 0, 0, 1, 1,
-2.190765, -0.07291458, -1.275537, 0, 0, 0, 1, 1,
-2.149708, -0.508359, -3.22262, 0, 0, 0, 1, 1,
-2.0818, 0.5680249, -1.052089, 1, 1, 1, 1, 1,
-2.069716, 0.9267349, -2.220981, 1, 1, 1, 1, 1,
-2.066688, 0.9811754, -2.930182, 1, 1, 1, 1, 1,
-2.05913, -0.8314275, -2.196601, 1, 1, 1, 1, 1,
-2.022376, -0.2022671, -1.215261, 1, 1, 1, 1, 1,
-2.021425, 2.083465, 0.7170713, 1, 1, 1, 1, 1,
-1.965388, 1.23946, -0.2032832, 1, 1, 1, 1, 1,
-1.949129, -2.220675, -0.8370107, 1, 1, 1, 1, 1,
-1.942204, -0.1188758, -3.374274, 1, 1, 1, 1, 1,
-1.911618, -1.866508, -1.145526, 1, 1, 1, 1, 1,
-1.909082, 0.8858695, -0.9872677, 1, 1, 1, 1, 1,
-1.892192, 1.232916, -0.1978583, 1, 1, 1, 1, 1,
-1.857034, 0.8115579, -0.885664, 1, 1, 1, 1, 1,
-1.839457, 0.8945357, 0.001794209, 1, 1, 1, 1, 1,
-1.822743, 1.088066, -3.070361, 1, 1, 1, 1, 1,
-1.819372, 1.327551, -0.4986141, 0, 0, 1, 1, 1,
-1.809206, 1.05158, -2.247666, 1, 0, 0, 1, 1,
-1.774835, -0.1617561, -0.8700185, 1, 0, 0, 1, 1,
-1.769046, 0.1679255, -0.07575647, 1, 0, 0, 1, 1,
-1.754261, -1.378902, -1.573361, 1, 0, 0, 1, 1,
-1.74336, 2.660763, -1.431762, 1, 0, 0, 1, 1,
-1.725661, -1.581974, -3.868289, 0, 0, 0, 1, 1,
-1.71584, -2.150974, -0.4790733, 0, 0, 0, 1, 1,
-1.712071, 0.4914644, -0.7062806, 0, 0, 0, 1, 1,
-1.705652, 1.26385, -0.3570664, 0, 0, 0, 1, 1,
-1.701452, -1.474204, -1.083208, 0, 0, 0, 1, 1,
-1.679277, -0.008550228, -0.9284723, 0, 0, 0, 1, 1,
-1.66905, 0.3831166, 0.5158379, 0, 0, 0, 1, 1,
-1.664591, -0.6822696, -2.814048, 1, 1, 1, 1, 1,
-1.660759, -0.03666264, -2.687847, 1, 1, 1, 1, 1,
-1.636426, 0.09110352, -1.284433, 1, 1, 1, 1, 1,
-1.629978, 0.7124539, -1.819554, 1, 1, 1, 1, 1,
-1.625227, 0.1857486, -1.595934, 1, 1, 1, 1, 1,
-1.613346, 0.2291929, -2.504976, 1, 1, 1, 1, 1,
-1.608176, 0.07945412, -0.5247171, 1, 1, 1, 1, 1,
-1.606761, -0.4973297, -2.737406, 1, 1, 1, 1, 1,
-1.597429, 0.4966748, -1.307339, 1, 1, 1, 1, 1,
-1.593374, -0.2248703, -1.707404, 1, 1, 1, 1, 1,
-1.590176, 0.3578169, -0.7956102, 1, 1, 1, 1, 1,
-1.576297, -0.01359526, -0.9485751, 1, 1, 1, 1, 1,
-1.570396, 0.9748705, -2.402354, 1, 1, 1, 1, 1,
-1.562546, 0.1503596, -1.665725, 1, 1, 1, 1, 1,
-1.553538, 0.08045855, -0.4087717, 1, 1, 1, 1, 1,
-1.544857, -0.06676979, -1.82076, 0, 0, 1, 1, 1,
-1.527245, -0.41838, -0.6740612, 1, 0, 0, 1, 1,
-1.504381, -0.6987998, -1.491769, 1, 0, 0, 1, 1,
-1.503988, -0.1675069, -2.966722, 1, 0, 0, 1, 1,
-1.493751, 0.1455114, -0.8264138, 1, 0, 0, 1, 1,
-1.490855, 1.222288, -1.277658, 1, 0, 0, 1, 1,
-1.489009, 1.442923, -0.1804204, 0, 0, 0, 1, 1,
-1.482647, 0.5620316, -1.72524, 0, 0, 0, 1, 1,
-1.48105, -0.8347449, -3.90153, 0, 0, 0, 1, 1,
-1.473364, 1.25271, -0.3381196, 0, 0, 0, 1, 1,
-1.460828, 0.3474503, -0.516343, 0, 0, 0, 1, 1,
-1.46064, -1.735065, -2.670419, 0, 0, 0, 1, 1,
-1.454696, 0.3544649, -1.289783, 0, 0, 0, 1, 1,
-1.449619, -1.739196, -1.796062, 1, 1, 1, 1, 1,
-1.448925, 0.1545957, -1.690726, 1, 1, 1, 1, 1,
-1.446397, 1.500363, -2.656991, 1, 1, 1, 1, 1,
-1.43985, 1.965674, -1.619982, 1, 1, 1, 1, 1,
-1.43237, -0.7834946, -0.8165518, 1, 1, 1, 1, 1,
-1.432279, -0.1983856, -1.202046, 1, 1, 1, 1, 1,
-1.429821, -0.02633258, -0.8134804, 1, 1, 1, 1, 1,
-1.427222, -0.2493051, -2.416941, 1, 1, 1, 1, 1,
-1.414759, -0.3761832, -1.57387, 1, 1, 1, 1, 1,
-1.410689, 1.132333, -0.6263445, 1, 1, 1, 1, 1,
-1.404011, -0.5285434, -3.054026, 1, 1, 1, 1, 1,
-1.385779, 1.359944, -1.191239, 1, 1, 1, 1, 1,
-1.37573, 2.011045, -0.2283997, 1, 1, 1, 1, 1,
-1.3742, -1.039212, -2.017167, 1, 1, 1, 1, 1,
-1.369866, 1.492557, 0.2216609, 1, 1, 1, 1, 1,
-1.364444, -1.162882, -1.553503, 0, 0, 1, 1, 1,
-1.357705, 1.493907, -0.1434408, 1, 0, 0, 1, 1,
-1.355634, 0.09759625, -0.9552266, 1, 0, 0, 1, 1,
-1.355502, -0.3283484, -2.44, 1, 0, 0, 1, 1,
-1.349974, -0.9336185, -1.797856, 1, 0, 0, 1, 1,
-1.348357, -0.7334816, -3.139547, 1, 0, 0, 1, 1,
-1.341895, -0.3675088, -4.287377, 0, 0, 0, 1, 1,
-1.339984, -0.6614116, -0.8880254, 0, 0, 0, 1, 1,
-1.332435, -0.7825789, -0.7220003, 0, 0, 0, 1, 1,
-1.326862, 0.1077475, -1.248685, 0, 0, 0, 1, 1,
-1.289619, 0.8016343, -0.32705, 0, 0, 0, 1, 1,
-1.288505, -1.412239, -2.543682, 0, 0, 0, 1, 1,
-1.287594, -0.4863119, -2.87943, 0, 0, 0, 1, 1,
-1.28643, 0.2922451, -3.066482, 1, 1, 1, 1, 1,
-1.281335, 0.4854713, 1.322193, 1, 1, 1, 1, 1,
-1.275759, 1.708699, -0.5617824, 1, 1, 1, 1, 1,
-1.273013, 1.198695, -1.445939, 1, 1, 1, 1, 1,
-1.263718, -1.516631, -0.905184, 1, 1, 1, 1, 1,
-1.258553, 1.08721, 0.4139415, 1, 1, 1, 1, 1,
-1.252945, -0.3676737, -1.751047, 1, 1, 1, 1, 1,
-1.247006, -0.07221843, -0.979695, 1, 1, 1, 1, 1,
-1.242241, -0.8914499, -2.531452, 1, 1, 1, 1, 1,
-1.238708, 0.2692019, -2.863422, 1, 1, 1, 1, 1,
-1.236146, -0.5073565, -2.567544, 1, 1, 1, 1, 1,
-1.229453, -1.23528, -2.791894, 1, 1, 1, 1, 1,
-1.228248, 0.6316352, -0.8960177, 1, 1, 1, 1, 1,
-1.220976, -0.4174263, -0.8757744, 1, 1, 1, 1, 1,
-1.220363, -0.6992968, -1.21281, 1, 1, 1, 1, 1,
-1.210374, 0.7732129, -0.5798046, 0, 0, 1, 1, 1,
-1.207942, 1.243867, 0.5749965, 1, 0, 0, 1, 1,
-1.204272, 0.1579055, -3.392622, 1, 0, 0, 1, 1,
-1.202183, 1.598427, 0.03448265, 1, 0, 0, 1, 1,
-1.192577, 0.920494, -3.458412, 1, 0, 0, 1, 1,
-1.190066, 1.59, 0.1771311, 1, 0, 0, 1, 1,
-1.182625, -0.9804348, -2.184514, 0, 0, 0, 1, 1,
-1.17337, -1.903067, -5.123157, 0, 0, 0, 1, 1,
-1.166265, 1.10259, -0.5683062, 0, 0, 0, 1, 1,
-1.160347, 2.331665, -0.9948487, 0, 0, 0, 1, 1,
-1.15512, 0.5028874, -1.2413, 0, 0, 0, 1, 1,
-1.144498, 1.060959, -0.128525, 0, 0, 0, 1, 1,
-1.141516, 0.6859276, -0.4121308, 0, 0, 0, 1, 1,
-1.138214, 1.851846, -0.753242, 1, 1, 1, 1, 1,
-1.137488, -0.5321798, 0.2814005, 1, 1, 1, 1, 1,
-1.132162, -1.262624, -2.731104, 1, 1, 1, 1, 1,
-1.129841, -0.2085802, -2.79909, 1, 1, 1, 1, 1,
-1.128045, -0.4167765, -3.140954, 1, 1, 1, 1, 1,
-1.126304, 0.8141302, -1.567763, 1, 1, 1, 1, 1,
-1.110279, -0.5664119, -0.6448145, 1, 1, 1, 1, 1,
-1.102841, 1.035379, -1.254205, 1, 1, 1, 1, 1,
-1.094376, -1.031309, -2.85147, 1, 1, 1, 1, 1,
-1.086342, -2.223333, -2.806151, 1, 1, 1, 1, 1,
-1.076533, 0.2556142, -0.5451176, 1, 1, 1, 1, 1,
-1.064242, 0.198396, -2.603719, 1, 1, 1, 1, 1,
-1.051608, -1.650334, -1.324025, 1, 1, 1, 1, 1,
-1.05139, 0.117207, -0.2375914, 1, 1, 1, 1, 1,
-1.048133, 1.576049, -2.732775, 1, 1, 1, 1, 1,
-1.047103, 2.111307, 1.121554, 0, 0, 1, 1, 1,
-1.044431, 2.264972, -0.5823373, 1, 0, 0, 1, 1,
-1.043917, -0.3342125, -2.837321, 1, 0, 0, 1, 1,
-1.038366, -1.160284, -1.751952, 1, 0, 0, 1, 1,
-1.036395, 0.8646845, 0.1709279, 1, 0, 0, 1, 1,
-1.030062, -0.1353914, -1.911463, 1, 0, 0, 1, 1,
-1.029154, 0.1510443, -1.940645, 0, 0, 0, 1, 1,
-1.028999, 0.8556697, -0.8447869, 0, 0, 0, 1, 1,
-1.028565, 0.0848927, -1.286809, 0, 0, 0, 1, 1,
-1.019545, -1.779677, -3.057858, 0, 0, 0, 1, 1,
-1.017769, 0.5934465, -0.1534662, 0, 0, 0, 1, 1,
-1.012982, 0.2507063, -0.3477069, 0, 0, 0, 1, 1,
-1.012882, -0.2972387, -2.793513, 0, 0, 0, 1, 1,
-1.010834, 0.8140125, 0.285964, 1, 1, 1, 1, 1,
-1.010164, 0.7969832, -1.346283, 1, 1, 1, 1, 1,
-1.009388, -0.4290415, -1.424571, 1, 1, 1, 1, 1,
-1.008651, -1.146867, -2.084111, 1, 1, 1, 1, 1,
-1.004701, 1.477633, -0.1502357, 1, 1, 1, 1, 1,
-0.9955435, 1.116216, -0.58901, 1, 1, 1, 1, 1,
-0.9938809, 0.6694613, -0.9366806, 1, 1, 1, 1, 1,
-0.9937744, -0.02472949, -2.414213, 1, 1, 1, 1, 1,
-0.9933705, -0.5806632, -3.034773, 1, 1, 1, 1, 1,
-0.9772905, 0.9012924, 0.4354489, 1, 1, 1, 1, 1,
-0.9735259, -0.106548, -1.910824, 1, 1, 1, 1, 1,
-0.9732956, -1.781623, -2.820008, 1, 1, 1, 1, 1,
-0.9716125, 1.575289, 1.353126, 1, 1, 1, 1, 1,
-0.9685088, 2.022312, -0.9604185, 1, 1, 1, 1, 1,
-0.9503244, 0.04622891, -1.663864, 1, 1, 1, 1, 1,
-0.9451262, 1.074825, 1.029929, 0, 0, 1, 1, 1,
-0.9359066, -1.61992, -3.365302, 1, 0, 0, 1, 1,
-0.9307464, 0.5138741, 0.4312402, 1, 0, 0, 1, 1,
-0.9289821, 0.9520415, -0.3135796, 1, 0, 0, 1, 1,
-0.9277817, 1.157827, 0.2004305, 1, 0, 0, 1, 1,
-0.9268335, 1.882858, -1.392865, 1, 0, 0, 1, 1,
-0.922914, -0.9273511, -1.779218, 0, 0, 0, 1, 1,
-0.9205157, -0.4712591, -1.132855, 0, 0, 0, 1, 1,
-0.9195173, -1.294314, -1.589178, 0, 0, 0, 1, 1,
-0.9167458, -1.248862, -2.907136, 0, 0, 0, 1, 1,
-0.9059515, 0.8686597, -0.4153075, 0, 0, 0, 1, 1,
-0.9029545, 1.970627, -3.509435, 0, 0, 0, 1, 1,
-0.9021728, -0.5372924, -1.598454, 0, 0, 0, 1, 1,
-0.8956936, -0.3566971, -3.825558, 1, 1, 1, 1, 1,
-0.8952528, 0.4967591, -0.0654955, 1, 1, 1, 1, 1,
-0.8893583, 0.2735971, -0.2221122, 1, 1, 1, 1, 1,
-0.8856136, 1.091069, -0.004557339, 1, 1, 1, 1, 1,
-0.8835803, -0.5848759, -2.035864, 1, 1, 1, 1, 1,
-0.8820398, -0.6082369, -2.011722, 1, 1, 1, 1, 1,
-0.8803235, -0.189843, -0.2603042, 1, 1, 1, 1, 1,
-0.8762221, -1.294508, -0.2929234, 1, 1, 1, 1, 1,
-0.8733579, -0.5856115, -1.692742, 1, 1, 1, 1, 1,
-0.8648186, 2.657906, 0.9998424, 1, 1, 1, 1, 1,
-0.8637689, -1.396161, -3.817142, 1, 1, 1, 1, 1,
-0.8593629, -0.3865799, -1.362707, 1, 1, 1, 1, 1,
-0.8527964, 0.9027845, 0.002409852, 1, 1, 1, 1, 1,
-0.8467897, -0.4260369, -2.289894, 1, 1, 1, 1, 1,
-0.8407508, 0.6838617, -1.220377, 1, 1, 1, 1, 1,
-0.8387683, -0.7578605, -2.264511, 0, 0, 1, 1, 1,
-0.8365782, -0.701259, -1.266959, 1, 0, 0, 1, 1,
-0.8358565, -0.3744367, -2.744466, 1, 0, 0, 1, 1,
-0.8342307, 0.2519167, -0.7470883, 1, 0, 0, 1, 1,
-0.8277543, -1.64351, -3.877423, 1, 0, 0, 1, 1,
-0.8265047, -0.8104374, -3.072616, 1, 0, 0, 1, 1,
-0.8244112, -0.4216876, -3.752243, 0, 0, 0, 1, 1,
-0.8191188, -0.7635776, -1.065945, 0, 0, 0, 1, 1,
-0.8136928, 1.172316, -1.552228, 0, 0, 0, 1, 1,
-0.8054347, -0.4473951, -2.460759, 0, 0, 0, 1, 1,
-0.8031023, 0.4669512, -0.4454754, 0, 0, 0, 1, 1,
-0.8027078, 0.2868117, -2.298331, 0, 0, 0, 1, 1,
-0.8010154, 2.022912, 0.2179991, 0, 0, 0, 1, 1,
-0.7990245, 1.436172, -0.822033, 1, 1, 1, 1, 1,
-0.7973585, 0.2745785, -0.05685821, 1, 1, 1, 1, 1,
-0.7754065, -0.1671496, -1.009992, 1, 1, 1, 1, 1,
-0.773607, 0.8681802, 0.3571129, 1, 1, 1, 1, 1,
-0.7720221, 0.181137, -1.009512, 1, 1, 1, 1, 1,
-0.7674155, -0.5858987, -1.273174, 1, 1, 1, 1, 1,
-0.7672389, -1.158944, -3.191182, 1, 1, 1, 1, 1,
-0.7623874, -0.03386211, -1.124277, 1, 1, 1, 1, 1,
-0.761883, 0.7492773, -0.453631, 1, 1, 1, 1, 1,
-0.7615127, -1.200993, -1.043204, 1, 1, 1, 1, 1,
-0.7572128, 1.602081, 0.9428467, 1, 1, 1, 1, 1,
-0.7565788, -0.9653965, -1.390381, 1, 1, 1, 1, 1,
-0.7559083, -0.9634743, -1.981031, 1, 1, 1, 1, 1,
-0.7489674, 0.5540907, -2.902465, 1, 1, 1, 1, 1,
-0.7479703, -0.3407107, -2.885333, 1, 1, 1, 1, 1,
-0.7478478, -0.6401013, -3.055039, 0, 0, 1, 1, 1,
-0.7446077, -1.090011, -2.389324, 1, 0, 0, 1, 1,
-0.7415355, -1.903754, -1.567685, 1, 0, 0, 1, 1,
-0.7400092, -0.4376176, -2.819577, 1, 0, 0, 1, 1,
-0.734736, -0.2139517, -2.063059, 1, 0, 0, 1, 1,
-0.730104, -0.0313964, -0.1233694, 1, 0, 0, 1, 1,
-0.7251245, 0.1256259, -1.080266, 0, 0, 0, 1, 1,
-0.724637, -0.3051905, -3.576917, 0, 0, 0, 1, 1,
-0.723205, 0.7726188, 0.4074062, 0, 0, 0, 1, 1,
-0.7222204, 0.8369631, 0.2428409, 0, 0, 0, 1, 1,
-0.7172776, -0.4571146, -1.728713, 0, 0, 0, 1, 1,
-0.7170595, 0.3457559, 0.08071119, 0, 0, 0, 1, 1,
-0.7151386, -0.2066261, -2.596514, 0, 0, 0, 1, 1,
-0.7146987, -0.06671336, -1.517814, 1, 1, 1, 1, 1,
-0.7088898, 0.9431748, -1.612361, 1, 1, 1, 1, 1,
-0.7049869, -0.690169, -1.7306, 1, 1, 1, 1, 1,
-0.7043716, 0.6183283, -0.3653048, 1, 1, 1, 1, 1,
-0.7006046, 0.02824202, -1.608435, 1, 1, 1, 1, 1,
-0.6947121, -1.632544, -1.945368, 1, 1, 1, 1, 1,
-0.6924255, 0.5089921, -0.414235, 1, 1, 1, 1, 1,
-0.6906564, 0.9011815, 1.058761, 1, 1, 1, 1, 1,
-0.6857984, 0.9540469, 0.651033, 1, 1, 1, 1, 1,
-0.6845616, 1.087444, -0.5725151, 1, 1, 1, 1, 1,
-0.6815207, 1.631055, -1.051904, 1, 1, 1, 1, 1,
-0.6809456, 1.214251, -2.278601, 1, 1, 1, 1, 1,
-0.6651686, 0.4263017, -2.244047, 1, 1, 1, 1, 1,
-0.6633972, 0.4298056, -1.945214, 1, 1, 1, 1, 1,
-0.6628617, -0.9316996, -0.770762, 1, 1, 1, 1, 1,
-0.6603282, 0.4483667, -1.916788, 0, 0, 1, 1, 1,
-0.6597784, -0.01708504, 1.122379, 1, 0, 0, 1, 1,
-0.6585355, -0.2105428, -2.007691, 1, 0, 0, 1, 1,
-0.655902, 0.3878801, -1.582399, 1, 0, 0, 1, 1,
-0.6527529, -1.164481, -1.660749, 1, 0, 0, 1, 1,
-0.6508842, -0.4841556, -1.841513, 1, 0, 0, 1, 1,
-0.6430428, -0.1449859, 0.1272158, 0, 0, 0, 1, 1,
-0.6393121, -0.05887678, -3.276284, 0, 0, 0, 1, 1,
-0.6374375, -0.128271, -2.558118, 0, 0, 0, 1, 1,
-0.6302218, -0.4149139, -1.641067, 0, 0, 0, 1, 1,
-0.6296405, -1.247233, -4.027949, 0, 0, 0, 1, 1,
-0.6277483, -0.9132125, -4.496643, 0, 0, 0, 1, 1,
-0.6220711, -2.737447, -3.225508, 0, 0, 0, 1, 1,
-0.6205872, 0.4721717, -1.065771, 1, 1, 1, 1, 1,
-0.620391, -0.394303, -2.46613, 1, 1, 1, 1, 1,
-0.6179853, -0.3002086, -2.791012, 1, 1, 1, 1, 1,
-0.6141983, -1.562452, -1.196627, 1, 1, 1, 1, 1,
-0.6103042, -0.7777188, -2.274937, 1, 1, 1, 1, 1,
-0.6072216, 0.03115851, -0.6060125, 1, 1, 1, 1, 1,
-0.6067777, 0.4166722, -1.953478, 1, 1, 1, 1, 1,
-0.6060082, -0.02344005, -0.5664963, 1, 1, 1, 1, 1,
-0.6024855, 0.6002944, -2.026323, 1, 1, 1, 1, 1,
-0.6014259, 0.831288, -0.965893, 1, 1, 1, 1, 1,
-0.5973814, 0.467027, -1.620191, 1, 1, 1, 1, 1,
-0.5948064, -1.656692, -4.010709, 1, 1, 1, 1, 1,
-0.5934377, -0.7614074, -0.6954246, 1, 1, 1, 1, 1,
-0.587599, 0.5587433, -1.824941, 1, 1, 1, 1, 1,
-0.5864283, 0.2287473, -2.331089, 1, 1, 1, 1, 1,
-0.5863838, -0.8441747, -2.265625, 0, 0, 1, 1, 1,
-0.5835992, -1.87534, -2.61565, 1, 0, 0, 1, 1,
-0.5832645, 0.6207181, -0.4522814, 1, 0, 0, 1, 1,
-0.5766348, 0.7418221, -0.9193551, 1, 0, 0, 1, 1,
-0.5648651, 0.6596226, -2.337539, 1, 0, 0, 1, 1,
-0.5636798, 0.2340592, -1.708814, 1, 0, 0, 1, 1,
-0.5616811, 2.2127, -0.05039355, 0, 0, 0, 1, 1,
-0.5596774, 1.763017, 0.2675431, 0, 0, 0, 1, 1,
-0.558466, 0.08203278, -1.853447, 0, 0, 0, 1, 1,
-0.5583359, 0.5934253, -1.793058, 0, 0, 0, 1, 1,
-0.5538179, 0.6396533, -3.131509, 0, 0, 0, 1, 1,
-0.5515069, 1.268505, -0.6709401, 0, 0, 0, 1, 1,
-0.5505204, -1.794996, -2.422657, 0, 0, 0, 1, 1,
-0.5497932, -0.6582341, -2.430506, 1, 1, 1, 1, 1,
-0.5483055, -1.484899, -3.314516, 1, 1, 1, 1, 1,
-0.5418539, 0.2688362, -1.627091, 1, 1, 1, 1, 1,
-0.541746, 1.265893, 0.2984965, 1, 1, 1, 1, 1,
-0.540932, -0.2094231, -0.9994369, 1, 1, 1, 1, 1,
-0.5393211, 1.010345, -2.111467, 1, 1, 1, 1, 1,
-0.5369262, 0.2001916, -2.379725, 1, 1, 1, 1, 1,
-0.535717, -0.7099704, -1.799264, 1, 1, 1, 1, 1,
-0.5337516, 0.0671812, -0.5187851, 1, 1, 1, 1, 1,
-0.5301623, 0.4273141, -0.08855332, 1, 1, 1, 1, 1,
-0.5272086, 1.03316, -0.009555113, 1, 1, 1, 1, 1,
-0.5191395, 1.314831, 0.7302766, 1, 1, 1, 1, 1,
-0.5163863, -0.09131623, -1.978304, 1, 1, 1, 1, 1,
-0.5147027, 0.4387523, -0.9544885, 1, 1, 1, 1, 1,
-0.5079144, 1.233627, -1.526914, 1, 1, 1, 1, 1,
-0.5060712, 1.188167, 0.8480377, 0, 0, 1, 1, 1,
-0.503803, -0.9578055, -2.361921, 1, 0, 0, 1, 1,
-0.5034919, 0.8034641, -0.1525244, 1, 0, 0, 1, 1,
-0.4971302, 0.4716344, 1.586577, 1, 0, 0, 1, 1,
-0.4962741, -0.1466693, -2.114982, 1, 0, 0, 1, 1,
-0.4891847, -1.094552, -4.087432, 1, 0, 0, 1, 1,
-0.48664, -1.475936, -2.936094, 0, 0, 0, 1, 1,
-0.4822223, 0.2345308, 0.4435703, 0, 0, 0, 1, 1,
-0.479352, -1.40094, -2.431268, 0, 0, 0, 1, 1,
-0.4762641, -1.13749, -2.753308, 0, 0, 0, 1, 1,
-0.470101, 0.6161104, -1.759803, 0, 0, 0, 1, 1,
-0.4668883, 0.09491225, 0.5636968, 0, 0, 0, 1, 1,
-0.4665827, 1.306685, -1.099396, 0, 0, 0, 1, 1,
-0.465308, 0.6851619, -1.677965, 1, 1, 1, 1, 1,
-0.452443, 0.7134876, -1.119701, 1, 1, 1, 1, 1,
-0.4454917, -0.8928056, -3.981078, 1, 1, 1, 1, 1,
-0.4449151, -0.5054068, -1.368144, 1, 1, 1, 1, 1,
-0.4431192, 0.02203373, -0.495226, 1, 1, 1, 1, 1,
-0.4384001, -1.296739, -2.521167, 1, 1, 1, 1, 1,
-0.4349133, -0.2603445, -2.087728, 1, 1, 1, 1, 1,
-0.4239926, -0.9365113, -1.569996, 1, 1, 1, 1, 1,
-0.4239243, -0.9284862, -1.816517, 1, 1, 1, 1, 1,
-0.4177192, 0.533951, -1.262059, 1, 1, 1, 1, 1,
-0.4128259, -0.2775048, -1.806316, 1, 1, 1, 1, 1,
-0.4115264, 0.3343128, -0.2457051, 1, 1, 1, 1, 1,
-0.4048168, -1.382256, -2.791685, 1, 1, 1, 1, 1,
-0.4031944, -1.928596, -3.72982, 1, 1, 1, 1, 1,
-0.4026912, 0.9742834, -0.4946478, 1, 1, 1, 1, 1,
-0.3994727, -0.3829266, -3.147886, 0, 0, 1, 1, 1,
-0.3987663, -1.396248, -1.573273, 1, 0, 0, 1, 1,
-0.3981532, 0.2207932, 0.1058307, 1, 0, 0, 1, 1,
-0.395913, -3.012357, -4.285297, 1, 0, 0, 1, 1,
-0.3947731, -1.046392, -2.463491, 1, 0, 0, 1, 1,
-0.3932938, 0.7009585, -0.4458944, 1, 0, 0, 1, 1,
-0.388817, 0.764366, -1.158433, 0, 0, 0, 1, 1,
-0.3764218, -1.855879, -3.696515, 0, 0, 0, 1, 1,
-0.3752452, -0.3688013, -2.8057, 0, 0, 0, 1, 1,
-0.3750848, 0.8989529, 0.4667754, 0, 0, 0, 1, 1,
-0.365011, 0.1959023, -0.7867171, 0, 0, 0, 1, 1,
-0.3628262, -0.4995275, -1.897787, 0, 0, 0, 1, 1,
-0.3589906, 1.103281, -0.7400271, 0, 0, 0, 1, 1,
-0.3587626, -2.053644, -3.992585, 1, 1, 1, 1, 1,
-0.3538083, -0.5187038, -2.993584, 1, 1, 1, 1, 1,
-0.3515255, 1.009765, 1.023093, 1, 1, 1, 1, 1,
-0.347973, 1.006158, 0.4375429, 1, 1, 1, 1, 1,
-0.3383787, -0.816702, -2.446142, 1, 1, 1, 1, 1,
-0.3378172, -0.2046104, -2.448645, 1, 1, 1, 1, 1,
-0.3367513, -0.5321194, -0.8852857, 1, 1, 1, 1, 1,
-0.3334682, -2.151254, -2.91781, 1, 1, 1, 1, 1,
-0.3324201, -0.7453673, -2.587382, 1, 1, 1, 1, 1,
-0.327998, -0.677423, -2.999863, 1, 1, 1, 1, 1,
-0.3267996, 1.216826, -0.4027104, 1, 1, 1, 1, 1,
-0.3233131, 2.17609, -1.057379, 1, 1, 1, 1, 1,
-0.3217747, 1.782177, -0.4646923, 1, 1, 1, 1, 1,
-0.3176347, 1.806931, 1.129081, 1, 1, 1, 1, 1,
-0.3167845, 0.7089282, -0.1264599, 1, 1, 1, 1, 1,
-0.3134418, 0.6672877, 0.5709461, 0, 0, 1, 1, 1,
-0.3121088, 0.5067692, -0.6827488, 1, 0, 0, 1, 1,
-0.3109868, 0.7380087, -0.8760393, 1, 0, 0, 1, 1,
-0.3108615, -0.9972097, -4.219687, 1, 0, 0, 1, 1,
-0.3088903, -1.751741, -2.699293, 1, 0, 0, 1, 1,
-0.3069371, -2.761389, -3.695254, 1, 0, 0, 1, 1,
-0.302108, -1.323974, -2.207586, 0, 0, 0, 1, 1,
-0.2991803, 0.2094923, -1.270424, 0, 0, 0, 1, 1,
-0.2949654, 1.138705, -0.05818925, 0, 0, 0, 1, 1,
-0.2948515, -0.3403062, -3.826886, 0, 0, 0, 1, 1,
-0.286969, -0.152703, -1.609075, 0, 0, 0, 1, 1,
-0.2830252, 1.112268, 0.3003462, 0, 0, 0, 1, 1,
-0.2808657, -0.01487654, -1.790787, 0, 0, 0, 1, 1,
-0.2743122, 1.125749, -0.886205, 1, 1, 1, 1, 1,
-0.2725809, -0.05877721, -2.507683, 1, 1, 1, 1, 1,
-0.2713891, 0.1133849, -1.385256, 1, 1, 1, 1, 1,
-0.2707604, -1.469327, -2.183768, 1, 1, 1, 1, 1,
-0.2682904, 1.753754, 1.290378, 1, 1, 1, 1, 1,
-0.2650304, 3.71525, 1.643734, 1, 1, 1, 1, 1,
-0.261853, -0.110635, -2.475688, 1, 1, 1, 1, 1,
-0.2593023, -0.5614017, -1.812824, 1, 1, 1, 1, 1,
-0.2581137, -0.6866518, -2.576641, 1, 1, 1, 1, 1,
-0.2554746, -0.9942412, -3.059382, 1, 1, 1, 1, 1,
-0.246749, 0.5930507, -1.597584, 1, 1, 1, 1, 1,
-0.2459926, -1.129421, -2.429445, 1, 1, 1, 1, 1,
-0.2459481, 0.6694835, -0.343158, 1, 1, 1, 1, 1,
-0.244854, -0.001072033, -2.410912, 1, 1, 1, 1, 1,
-0.2442366, -0.2826084, -0.7355302, 1, 1, 1, 1, 1,
-0.2432587, -1.0654, -3.817598, 0, 0, 1, 1, 1,
-0.2418285, -1.111802, -1.278793, 1, 0, 0, 1, 1,
-0.2370193, -0.08827624, -2.439208, 1, 0, 0, 1, 1,
-0.2370029, -0.3878537, -2.666807, 1, 0, 0, 1, 1,
-0.2333077, 0.1164501, -0.8948389, 1, 0, 0, 1, 1,
-0.2329105, -0.6736383, -2.925981, 1, 0, 0, 1, 1,
-0.2320576, 0.2629243, -0.7049221, 0, 0, 0, 1, 1,
-0.227444, 1.540896, -0.4132786, 0, 0, 0, 1, 1,
-0.2272963, -0.5730971, -3.186304, 0, 0, 0, 1, 1,
-0.2266025, -0.8418061, -2.632039, 0, 0, 0, 1, 1,
-0.2241576, -1.763791, -2.257219, 0, 0, 0, 1, 1,
-0.2197552, 1.087208, 0.6788633, 0, 0, 0, 1, 1,
-0.218914, 0.3122239, -0.5096043, 0, 0, 0, 1, 1,
-0.2165523, 0.5179905, -1.460575, 1, 1, 1, 1, 1,
-0.2094394, -1.893295, -3.044932, 1, 1, 1, 1, 1,
-0.2082281, 0.6277355, -1.585556, 1, 1, 1, 1, 1,
-0.2065535, 0.992743, -0.4990275, 1, 1, 1, 1, 1,
-0.2034001, -0.6980031, -4.447163, 1, 1, 1, 1, 1,
-0.2032837, 0.1565596, -1.075174, 1, 1, 1, 1, 1,
-0.2019006, -0.3441589, -2.181189, 1, 1, 1, 1, 1,
-0.2017138, -0.4023401, -3.492347, 1, 1, 1, 1, 1,
-0.2004785, -1.374263, -5.047317, 1, 1, 1, 1, 1,
-0.1999623, 1.11061, 0.08274261, 1, 1, 1, 1, 1,
-0.1973202, 0.09992826, -2.325131, 1, 1, 1, 1, 1,
-0.1972621, 0.05578338, -1.676207, 1, 1, 1, 1, 1,
-0.1952752, 0.5768047, -0.4213216, 1, 1, 1, 1, 1,
-0.1910097, -0.05068398, -2.103339, 1, 1, 1, 1, 1,
-0.1881431, -0.1871557, -2.440192, 1, 1, 1, 1, 1,
-0.1863207, 1.76472, -0.5175943, 0, 0, 1, 1, 1,
-0.1814701, -2.790397, -2.500942, 1, 0, 0, 1, 1,
-0.1772732, -1.638187, -1.262174, 1, 0, 0, 1, 1,
-0.172968, 0.6843671, 1.019601, 1, 0, 0, 1, 1,
-0.1694051, -2.277183, -2.411816, 1, 0, 0, 1, 1,
-0.1671781, -1.184759, -1.959094, 1, 0, 0, 1, 1,
-0.1668934, 0.09820265, -0.05254888, 0, 0, 0, 1, 1,
-0.1636562, -0.8580838, -4.365725, 0, 0, 0, 1, 1,
-0.1616831, 0.644445, 0.4886804, 0, 0, 0, 1, 1,
-0.1587505, -0.9462509, -2.508581, 0, 0, 0, 1, 1,
-0.1587328, -1.262719, -3.506769, 0, 0, 0, 1, 1,
-0.1535849, 0.7826713, -0.8551816, 0, 0, 0, 1, 1,
-0.1487825, 1.156715, 0.6170751, 0, 0, 0, 1, 1,
-0.144311, 2.919339, -0.310398, 1, 1, 1, 1, 1,
-0.1441544, 0.9967613, -1.668258, 1, 1, 1, 1, 1,
-0.1428068, 0.7219158, -0.3987037, 1, 1, 1, 1, 1,
-0.1426084, -2.318083, -2.791674, 1, 1, 1, 1, 1,
-0.1390582, -0.08035143, -2.168753, 1, 1, 1, 1, 1,
-0.1377925, -0.9865173, -3.176685, 1, 1, 1, 1, 1,
-0.1371931, -0.2598774, -2.046848, 1, 1, 1, 1, 1,
-0.1348438, 1.420592, -0.3344455, 1, 1, 1, 1, 1,
-0.1288776, 0.3688358, -0.4794701, 1, 1, 1, 1, 1,
-0.1261148, 0.7886062, 0.4908972, 1, 1, 1, 1, 1,
-0.1228137, -0.1080126, -1.153723, 1, 1, 1, 1, 1,
-0.1208359, -0.3796664, -3.193424, 1, 1, 1, 1, 1,
-0.1190012, 0.1166979, -1.859922, 1, 1, 1, 1, 1,
-0.1180323, 1.638571, -0.663192, 1, 1, 1, 1, 1,
-0.1160384, -0.5125607, -0.8453647, 1, 1, 1, 1, 1,
-0.1110565, -2.035241, -3.865111, 0, 0, 1, 1, 1,
-0.1063153, 1.500589, 0.7440859, 1, 0, 0, 1, 1,
-0.1063141, -0.4020953, -1.723866, 1, 0, 0, 1, 1,
-0.1041397, -0.8772802, -1.852187, 1, 0, 0, 1, 1,
-0.10401, -0.3825074, -1.366844, 1, 0, 0, 1, 1,
-0.1002043, 0.8595507, -0.08704214, 1, 0, 0, 1, 1,
-0.09821069, 0.5245899, -1.40118, 0, 0, 0, 1, 1,
-0.09599391, 0.6026039, 0.4746922, 0, 0, 0, 1, 1,
-0.09409641, -0.502127, -2.70679, 0, 0, 0, 1, 1,
-0.09403749, -1.532674, -1.007304, 0, 0, 0, 1, 1,
-0.0882982, -0.4003755, -2.732909, 0, 0, 0, 1, 1,
-0.08666331, -1.068774, -3.359176, 0, 0, 0, 1, 1,
-0.08434057, 0.4721177, 1.155307, 0, 0, 0, 1, 1,
-0.08160724, 0.2642814, -1.841464, 1, 1, 1, 1, 1,
-0.08140453, 1.732748, -2.306254, 1, 1, 1, 1, 1,
-0.06543127, 0.3885914, -0.5672305, 1, 1, 1, 1, 1,
-0.06305899, -0.3690306, -3.033911, 1, 1, 1, 1, 1,
-0.06212105, -0.879278, -2.124152, 1, 1, 1, 1, 1,
-0.05981505, -0.03437125, -1.274321, 1, 1, 1, 1, 1,
-0.05754088, 0.4261231, -1.228288, 1, 1, 1, 1, 1,
-0.05440101, 0.8688751, 0.574423, 1, 1, 1, 1, 1,
-0.05219439, -1.245962, -3.844804, 1, 1, 1, 1, 1,
-0.04926099, -0.5027625, -2.437006, 1, 1, 1, 1, 1,
-0.04611373, -0.9217188, -2.78944, 1, 1, 1, 1, 1,
-0.04445466, -1.450407, -2.245717, 1, 1, 1, 1, 1,
-0.04263203, 2.209684, 3.114053, 1, 1, 1, 1, 1,
-0.04239706, -0.547839, -3.680491, 1, 1, 1, 1, 1,
-0.04216805, 0.4078916, -0.5320058, 1, 1, 1, 1, 1,
-0.03725398, -0.8615336, -3.402989, 0, 0, 1, 1, 1,
-0.035614, 0.6739055, -0.6887769, 1, 0, 0, 1, 1,
-0.02326997, 0.110157, 0.7205199, 1, 0, 0, 1, 1,
-0.02203197, -0.3873437, -2.748516, 1, 0, 0, 1, 1,
-0.02159727, 0.5379062, -0.7176387, 1, 0, 0, 1, 1,
-0.02093313, 0.6938507, -2.038964, 1, 0, 0, 1, 1,
-0.02032728, 0.779695, -0.8977039, 0, 0, 0, 1, 1,
-0.01921616, -0.4890188, -3.433092, 0, 0, 0, 1, 1,
-0.01657191, -1.027911, -3.06799, 0, 0, 0, 1, 1,
-0.01595679, 0.04260025, -0.7922108, 0, 0, 0, 1, 1,
-0.01178598, 0.801046, -0.8515754, 0, 0, 0, 1, 1,
-0.009572119, 0.8452325, -0.05016321, 0, 0, 0, 1, 1,
-0.006259935, 1.410008, 0.6598252, 0, 0, 0, 1, 1,
-0.004866909, 0.5579942, -0.2840692, 1, 1, 1, 1, 1,
-0.004032874, 0.144317, 0.8952675, 1, 1, 1, 1, 1,
-0.001251677, -1.695086, -1.229012, 1, 1, 1, 1, 1,
0.004153775, -0.8994316, 2.474937, 1, 1, 1, 1, 1,
0.004957724, -0.2687152, 2.163424, 1, 1, 1, 1, 1,
0.008373253, 1.201701, 1.500176, 1, 1, 1, 1, 1,
0.01225498, 0.1626253, 1.674922, 1, 1, 1, 1, 1,
0.01412956, 2.008936, 0.3714949, 1, 1, 1, 1, 1,
0.01613736, 0.5194433, -0.7073109, 1, 1, 1, 1, 1,
0.01639959, 1.036782, -0.8520651, 1, 1, 1, 1, 1,
0.02126884, -0.7528394, 2.85032, 1, 1, 1, 1, 1,
0.02207575, -1.66323, 3.911188, 1, 1, 1, 1, 1,
0.02929171, 0.006077101, 2.449429, 1, 1, 1, 1, 1,
0.03023949, -0.489873, 3.089507, 1, 1, 1, 1, 1,
0.0310444, 2.114609, 0.4765013, 1, 1, 1, 1, 1,
0.03231096, -2.260826, 3.190072, 0, 0, 1, 1, 1,
0.032961, -1.146142, 5.137698, 1, 0, 0, 1, 1,
0.03445141, -1.075896, 1.924309, 1, 0, 0, 1, 1,
0.0347316, 0.01643858, 1.095229, 1, 0, 0, 1, 1,
0.04232112, -0.3081188, 2.410866, 1, 0, 0, 1, 1,
0.0453207, -1.458812, 4.321314, 1, 0, 0, 1, 1,
0.04625488, -0.415354, 1.884924, 0, 0, 0, 1, 1,
0.04969575, 0.9802374, 0.436089, 0, 0, 0, 1, 1,
0.05117098, -0.4061161, 0.05205786, 0, 0, 0, 1, 1,
0.05862835, -0.86052, 4.203605, 0, 0, 0, 1, 1,
0.06095028, 0.6665137, -0.4419371, 0, 0, 0, 1, 1,
0.06129521, 0.5510146, 0.7429733, 0, 0, 0, 1, 1,
0.06999085, -0.3379368, 2.477743, 0, 0, 0, 1, 1,
0.07063462, 0.4599634, 0.05329041, 1, 1, 1, 1, 1,
0.07164141, -0.2523851, 3.6513, 1, 1, 1, 1, 1,
0.07275866, -1.664758, 3.465966, 1, 1, 1, 1, 1,
0.07407811, -0.6834114, 2.995903, 1, 1, 1, 1, 1,
0.07922716, -0.2872899, 4.048473, 1, 1, 1, 1, 1,
0.08079936, -0.4039879, 2.759928, 1, 1, 1, 1, 1,
0.08568656, -0.2269682, 1.879127, 1, 1, 1, 1, 1,
0.08597047, -0.7244338, 3.118128, 1, 1, 1, 1, 1,
0.08648154, -1.939977, 2.548922, 1, 1, 1, 1, 1,
0.08884975, 0.3997142, 0.837496, 1, 1, 1, 1, 1,
0.08903455, 0.7490336, 1.140099, 1, 1, 1, 1, 1,
0.08948991, -0.0461382, 1.768984, 1, 1, 1, 1, 1,
0.09185462, -0.8815573, 3.037995, 1, 1, 1, 1, 1,
0.09362197, 0.8438329, -1.540067, 1, 1, 1, 1, 1,
0.09707363, 0.7413072, -0.4903843, 1, 1, 1, 1, 1,
0.09752864, -0.2380725, 2.950214, 0, 0, 1, 1, 1,
0.09759121, 0.6318369, -0.2147458, 1, 0, 0, 1, 1,
0.09776121, 1.659026, 0.0811416, 1, 0, 0, 1, 1,
0.1028276, 0.3694206, 0.5108021, 1, 0, 0, 1, 1,
0.1053203, 0.4137412, 2.623721, 1, 0, 0, 1, 1,
0.107195, -1.144594, 1.579354, 1, 0, 0, 1, 1,
0.108005, 1.099114, 0.446986, 0, 0, 0, 1, 1,
0.1088013, -0.5477343, 3.171275, 0, 0, 0, 1, 1,
0.1099632, -0.8065728, 1.213044, 0, 0, 0, 1, 1,
0.1105411, 0.3374372, 0.2372116, 0, 0, 0, 1, 1,
0.1117213, 2.147739, -0.2402198, 0, 0, 0, 1, 1,
0.1138539, 0.02940139, 1.688525, 0, 0, 0, 1, 1,
0.1180046, -1.403731, 2.024413, 0, 0, 0, 1, 1,
0.1189184, -0.4813123, 3.140045, 1, 1, 1, 1, 1,
0.1225542, -0.8137105, 2.20252, 1, 1, 1, 1, 1,
0.1269141, 1.366633, 0.9955969, 1, 1, 1, 1, 1,
0.1288496, -1.504512, 1.341123, 1, 1, 1, 1, 1,
0.1291151, 0.5782495, 1.148142, 1, 1, 1, 1, 1,
0.1313747, -0.5337012, 4.635995, 1, 1, 1, 1, 1,
0.1345195, -0.2001341, 3.635549, 1, 1, 1, 1, 1,
0.1348805, 2.576265, -0.08889801, 1, 1, 1, 1, 1,
0.1415581, -0.4569847, 1.339139, 1, 1, 1, 1, 1,
0.1426818, -0.2889081, 4.464575, 1, 1, 1, 1, 1,
0.1440214, -0.4278946, 1.678198, 1, 1, 1, 1, 1,
0.1482593, -0.764536, 3.840949, 1, 1, 1, 1, 1,
0.1503674, -0.277535, 3.24595, 1, 1, 1, 1, 1,
0.1561898, -1.846206, 4.028438, 1, 1, 1, 1, 1,
0.1575951, -0.2155339, 2.497164, 1, 1, 1, 1, 1,
0.1653004, 0.07025906, 1.289511, 0, 0, 1, 1, 1,
0.1655626, 1.622836, 0.6085289, 1, 0, 0, 1, 1,
0.1675964, -1.605799, 3.479704, 1, 0, 0, 1, 1,
0.1694522, -2.012424, 3.718194, 1, 0, 0, 1, 1,
0.1741527, -0.430116, 2.929284, 1, 0, 0, 1, 1,
0.1748356, 0.7485103, 0.8403401, 1, 0, 0, 1, 1,
0.1765259, 0.4928055, -0.703604, 0, 0, 0, 1, 1,
0.1863769, 0.4980767, 1.463055, 0, 0, 0, 1, 1,
0.1869427, -1.14618, 2.101229, 0, 0, 0, 1, 1,
0.1880217, 0.900663, 0.2090058, 0, 0, 0, 1, 1,
0.1903829, -1.136297, 2.002353, 0, 0, 0, 1, 1,
0.1922378, 0.3348698, 0.669261, 0, 0, 0, 1, 1,
0.197883, -1.423417, 3.472826, 0, 0, 0, 1, 1,
0.1999474, 0.4156643, 2.328629, 1, 1, 1, 1, 1,
0.2003689, 0.9179665, -1.167027, 1, 1, 1, 1, 1,
0.2007458, 0.5409008, 0.4490778, 1, 1, 1, 1, 1,
0.2017526, 1.323579, 0.1283313, 1, 1, 1, 1, 1,
0.2039381, -0.2420047, 3.828107, 1, 1, 1, 1, 1,
0.2043216, 0.4790525, 0.4952683, 1, 1, 1, 1, 1,
0.2068377, -0.93086, 4.257466, 1, 1, 1, 1, 1,
0.2118405, -0.6904651, 3.571547, 1, 1, 1, 1, 1,
0.2123823, 0.0132723, 2.051298, 1, 1, 1, 1, 1,
0.2176513, -1.519987, 4.430488, 1, 1, 1, 1, 1,
0.2212206, 0.9098465, 0.2451851, 1, 1, 1, 1, 1,
0.2216643, -0.1104662, 3.486622, 1, 1, 1, 1, 1,
0.2274491, 0.3466294, -0.128533, 1, 1, 1, 1, 1,
0.2275988, -0.5701396, 2.465104, 1, 1, 1, 1, 1,
0.2283689, 0.02290558, 0.5863032, 1, 1, 1, 1, 1,
0.2290719, -0.9445246, 0.7148135, 0, 0, 1, 1, 1,
0.2332226, 0.8406032, -0.1495584, 1, 0, 0, 1, 1,
0.2365466, -1.404575, 2.810174, 1, 0, 0, 1, 1,
0.2398996, 0.04970453, 0.9567175, 1, 0, 0, 1, 1,
0.2422551, 1.104695, 0.1899192, 1, 0, 0, 1, 1,
0.2480692, -0.3337298, 1.236269, 1, 0, 0, 1, 1,
0.2491781, -0.1954733, 1.483453, 0, 0, 0, 1, 1,
0.2496752, 0.4761504, 0.2885806, 0, 0, 0, 1, 1,
0.249979, 0.6840162, -0.9990701, 0, 0, 0, 1, 1,
0.2538741, 3.187032, 1.497575, 0, 0, 0, 1, 1,
0.2553485, 0.7572474, 1.341673, 0, 0, 0, 1, 1,
0.2560303, -1.500259, 3.109473, 0, 0, 0, 1, 1,
0.2564232, 1.094169, 0.4612091, 0, 0, 0, 1, 1,
0.2571979, -1.893443, 2.43811, 1, 1, 1, 1, 1,
0.2574483, 2.443204, 0.1456615, 1, 1, 1, 1, 1,
0.2597924, -0.7836775, 2.104509, 1, 1, 1, 1, 1,
0.2623131, 0.3470451, 0.2452483, 1, 1, 1, 1, 1,
0.2630838, -1.196626, 2.473636, 1, 1, 1, 1, 1,
0.2675914, 0.2657808, 1.168854, 1, 1, 1, 1, 1,
0.268673, 1.057986, 0.1727946, 1, 1, 1, 1, 1,
0.2714688, 0.5277976, -0.7100339, 1, 1, 1, 1, 1,
0.2726137, 0.7191846, -0.5279894, 1, 1, 1, 1, 1,
0.2755029, -0.3752885, 2.554156, 1, 1, 1, 1, 1,
0.2767574, 0.8426109, 1.927398, 1, 1, 1, 1, 1,
0.2782851, -0.766433, 2.346709, 1, 1, 1, 1, 1,
0.2830676, 0.4461121, 1.452215, 1, 1, 1, 1, 1,
0.2846671, 1.868884, 0.6136554, 1, 1, 1, 1, 1,
0.2878611, 0.9308669, 0.03918495, 1, 1, 1, 1, 1,
0.2885923, 0.6876648, -0.5145206, 0, 0, 1, 1, 1,
0.2887064, 1.061195, 0.7715069, 1, 0, 0, 1, 1,
0.2910149, 0.09584869, 0.6399376, 1, 0, 0, 1, 1,
0.2911746, 0.04048279, 0.7276851, 1, 0, 0, 1, 1,
0.2937561, 0.06626511, 1.742831, 1, 0, 0, 1, 1,
0.2978911, 1.671522, -0.1643681, 1, 0, 0, 1, 1,
0.2981063, -0.7966383, 1.484323, 0, 0, 0, 1, 1,
0.2983663, 0.2525101, 2.734428, 0, 0, 0, 1, 1,
0.3024715, -2.0007, 3.231653, 0, 0, 0, 1, 1,
0.3061573, 1.262098, -0.7695205, 0, 0, 0, 1, 1,
0.3089803, 1.760782, -0.3699129, 0, 0, 0, 1, 1,
0.3117847, 0.5561394, -0.4984589, 0, 0, 0, 1, 1,
0.3131781, 0.3860086, 1.086077, 0, 0, 0, 1, 1,
0.3137902, 0.001070701, 0.4856147, 1, 1, 1, 1, 1,
0.3148438, 0.6318191, 1.626804, 1, 1, 1, 1, 1,
0.3161698, -0.2117105, 0.1383131, 1, 1, 1, 1, 1,
0.3201606, 0.5309394, 2.170339, 1, 1, 1, 1, 1,
0.3205381, -2.048002, 3.773741, 1, 1, 1, 1, 1,
0.3217015, -1.181768, 2.14827, 1, 1, 1, 1, 1,
0.3226877, -0.344782, 1.667283, 1, 1, 1, 1, 1,
0.3233176, -0.2956817, 1.348568, 1, 1, 1, 1, 1,
0.3250593, -0.6276519, 0.7594526, 1, 1, 1, 1, 1,
0.327172, 0.3519908, -0.3417025, 1, 1, 1, 1, 1,
0.3295493, -1.413829, 4.022685, 1, 1, 1, 1, 1,
0.331022, 0.1081391, 1.861084, 1, 1, 1, 1, 1,
0.3323267, -1.340187, 3.600286, 1, 1, 1, 1, 1,
0.3354957, 0.2219698, 1.598871, 1, 1, 1, 1, 1,
0.3356827, 0.3338752, 1.413967, 1, 1, 1, 1, 1,
0.3357931, 0.2907057, 0.5197465, 0, 0, 1, 1, 1,
0.3480948, 0.5478464, -0.4164511, 1, 0, 0, 1, 1,
0.3498584, -0.6346039, 3.223605, 1, 0, 0, 1, 1,
0.3499531, 0.3798646, -0.3257497, 1, 0, 0, 1, 1,
0.3506147, -0.1100666, 2.456144, 1, 0, 0, 1, 1,
0.353352, 1.304883, 0.6541771, 1, 0, 0, 1, 1,
0.3573874, 0.4515477, -1.159291, 0, 0, 0, 1, 1,
0.3575033, 0.1956878, 0.4116294, 0, 0, 0, 1, 1,
0.3598252, 0.8401788, 0.875048, 0, 0, 0, 1, 1,
0.3600023, -0.1748776, 1.454874, 0, 0, 0, 1, 1,
0.3606218, -0.4731019, 4.157421, 0, 0, 0, 1, 1,
0.3655499, 1.452391, -0.5472367, 0, 0, 0, 1, 1,
0.3691691, -0.4326878, 3.235247, 0, 0, 0, 1, 1,
0.3712445, 0.4971531, -0.02051395, 1, 1, 1, 1, 1,
0.3718377, 0.2088169, 1.104566, 1, 1, 1, 1, 1,
0.37512, -0.6995685, 2.147486, 1, 1, 1, 1, 1,
0.37526, 1.179417, -2.678714, 1, 1, 1, 1, 1,
0.3753368, 0.3515127, 0.6547751, 1, 1, 1, 1, 1,
0.3780712, -0.09358338, 1.348748, 1, 1, 1, 1, 1,
0.3785289, 0.4760526, 1.090902, 1, 1, 1, 1, 1,
0.3818192, 1.841073, -1.403169, 1, 1, 1, 1, 1,
0.382123, 0.1241537, 1.459427, 1, 1, 1, 1, 1,
0.3859729, -0.7329175, 1.497862, 1, 1, 1, 1, 1,
0.3931751, -0.3171399, 2.081321, 1, 1, 1, 1, 1,
0.3997955, -1.338788, 3.706996, 1, 1, 1, 1, 1,
0.4039637, 1.373767, -0.1403681, 1, 1, 1, 1, 1,
0.411797, 0.632606, -2.107072, 1, 1, 1, 1, 1,
0.4153628, -0.6731654, 2.740651, 1, 1, 1, 1, 1,
0.4182071, -1.192262, 2.669311, 0, 0, 1, 1, 1,
0.4196854, -0.744928, 1.209334, 1, 0, 0, 1, 1,
0.4222248, -1.080426, 4.475511, 1, 0, 0, 1, 1,
0.4232645, -1.284243, 4.076742, 1, 0, 0, 1, 1,
0.4290954, 0.5188485, 0.472133, 1, 0, 0, 1, 1,
0.4305403, 1.198017, 0.6464315, 1, 0, 0, 1, 1,
0.4341762, 1.806305, -0.06996339, 0, 0, 0, 1, 1,
0.4344095, -1.659716, 3.933804, 0, 0, 0, 1, 1,
0.4382309, -0.717253, 4.568645, 0, 0, 0, 1, 1,
0.4408109, -0.3576105, 2.537501, 0, 0, 0, 1, 1,
0.4418298, 0.5088502, 0.3864433, 0, 0, 0, 1, 1,
0.4419272, -1.318051, 2.215274, 0, 0, 0, 1, 1,
0.4487597, 0.8855717, -0.1643509, 0, 0, 0, 1, 1,
0.4561957, -1.306656, 3.320858, 1, 1, 1, 1, 1,
0.4571384, -2.558947, 3.194221, 1, 1, 1, 1, 1,
0.458757, -1.656067, 4.996962, 1, 1, 1, 1, 1,
0.4607289, -0.855874, 2.598318, 1, 1, 1, 1, 1,
0.4667363, -1.027654, 2.209763, 1, 1, 1, 1, 1,
0.4702969, 0.8503155, 0.2315304, 1, 1, 1, 1, 1,
0.4741333, -0.1936637, 3.586647, 1, 1, 1, 1, 1,
0.4749202, 0.7861825, 0.1588535, 1, 1, 1, 1, 1,
0.4772082, 0.3985237, -0.2577069, 1, 1, 1, 1, 1,
0.4845271, -1.446746, 2.985534, 1, 1, 1, 1, 1,
0.4872812, -0.09867819, -0.2338122, 1, 1, 1, 1, 1,
0.4902323, -0.9851432, 1.120525, 1, 1, 1, 1, 1,
0.4982949, 1.04319, -2.210507, 1, 1, 1, 1, 1,
0.5066095, -0.5590343, 3.431827, 1, 1, 1, 1, 1,
0.5100922, 0.1292561, 0.7397208, 1, 1, 1, 1, 1,
0.5157861, -1.078332, 3.546897, 0, 0, 1, 1, 1,
0.5182198, 0.9245132, 0.2035576, 1, 0, 0, 1, 1,
0.5182275, 1.614278, 1.101829, 1, 0, 0, 1, 1,
0.5205091, 0.5703009, 2.467513, 1, 0, 0, 1, 1,
0.520668, 0.3100558, 1.039723, 1, 0, 0, 1, 1,
0.52297, -0.4253849, 1.879077, 1, 0, 0, 1, 1,
0.5282579, -0.7789782, 4.571401, 0, 0, 0, 1, 1,
0.5292322, -0.1457472, 1.300614, 0, 0, 0, 1, 1,
0.5341911, 0.6169805, -0.1714414, 0, 0, 0, 1, 1,
0.5381552, 0.5891704, 1.428617, 0, 0, 0, 1, 1,
0.5418159, -1.404423, 2.634813, 0, 0, 0, 1, 1,
0.55057, -0.125209, 0.9381075, 0, 0, 0, 1, 1,
0.551689, -0.2135602, 1.676135, 0, 0, 0, 1, 1,
0.5543463, -1.810771, 3.035613, 1, 1, 1, 1, 1,
0.5685478, 0.4518855, 0.5628967, 1, 1, 1, 1, 1,
0.5688254, -0.8192303, 5.324417, 1, 1, 1, 1, 1,
0.5750632, 0.2324801, 1.954508, 1, 1, 1, 1, 1,
0.5757245, 1.624482, 0.6018718, 1, 1, 1, 1, 1,
0.5794459, -0.3872159, 2.034545, 1, 1, 1, 1, 1,
0.579957, 1.778163, -0.7016802, 1, 1, 1, 1, 1,
0.5804543, -1.080832, 3.099838, 1, 1, 1, 1, 1,
0.5842956, -1.771044, 2.259243, 1, 1, 1, 1, 1,
0.5857797, -1.367397, 1.929781, 1, 1, 1, 1, 1,
0.5921172, 1.361756, 0.5315096, 1, 1, 1, 1, 1,
0.5938265, -0.1849047, 2.727005, 1, 1, 1, 1, 1,
0.5939168, 0.03241763, 1.543358, 1, 1, 1, 1, 1,
0.6000463, -0.7481387, 2.917976, 1, 1, 1, 1, 1,
0.6036138, -0.6817999, 1.706722, 1, 1, 1, 1, 1,
0.6076499, -0.4476188, 2.642563, 0, 0, 1, 1, 1,
0.6081417, -0.6223669, 2.475865, 1, 0, 0, 1, 1,
0.6088805, -1.011808, 3.571046, 1, 0, 0, 1, 1,
0.6153821, -0.4136146, 2.270458, 1, 0, 0, 1, 1,
0.6206444, -1.129202, 3.128732, 1, 0, 0, 1, 1,
0.6208939, -1.058205, 1.089495, 1, 0, 0, 1, 1,
0.621979, -1.234271, 1.783663, 0, 0, 0, 1, 1,
0.6225383, -1.30951, 3.080518, 0, 0, 0, 1, 1,
0.62748, 0.151123, 0.5282224, 0, 0, 0, 1, 1,
0.6279438, 0.4639658, 0.9214023, 0, 0, 0, 1, 1,
0.6279546, -0.05097522, 1.267817, 0, 0, 0, 1, 1,
0.6281041, 0.3500602, -0.3605447, 0, 0, 0, 1, 1,
0.6318179, 0.687428, 1.757536, 0, 0, 0, 1, 1,
0.6323918, 0.8746338, -1.10534, 1, 1, 1, 1, 1,
0.6348715, -0.4282854, 1.844465, 1, 1, 1, 1, 1,
0.6391833, -0.7085632, 2.38256, 1, 1, 1, 1, 1,
0.640633, 0.9772269, 1.29889, 1, 1, 1, 1, 1,
0.6419139, -0.6510555, 1.995413, 1, 1, 1, 1, 1,
0.6427028, 0.399481, 0.8468886, 1, 1, 1, 1, 1,
0.6446457, -0.5064492, 2.725852, 1, 1, 1, 1, 1,
0.6458078, 0.1561746, 1.57939, 1, 1, 1, 1, 1,
0.6535504, 1.886567, 0.7331815, 1, 1, 1, 1, 1,
0.6557637, 0.5883683, 0.9750339, 1, 1, 1, 1, 1,
0.6583791, -0.3004047, 2.794853, 1, 1, 1, 1, 1,
0.6668399, -0.2764664, 1.790171, 1, 1, 1, 1, 1,
0.6686218, -1.059419, 1.055745, 1, 1, 1, 1, 1,
0.6686692, -0.9022812, 3.055079, 1, 1, 1, 1, 1,
0.6709866, -0.8099642, 4.199026, 1, 1, 1, 1, 1,
0.6771005, -0.5404364, 1.557441, 0, 0, 1, 1, 1,
0.6783147, 0.5705976, 2.292205, 1, 0, 0, 1, 1,
0.6885938, -0.9132795, 2.465063, 1, 0, 0, 1, 1,
0.6906797, 0.5325086, -0.4396927, 1, 0, 0, 1, 1,
0.6912695, -0.3187056, 2.269439, 1, 0, 0, 1, 1,
0.6953229, -1.379055, 3.503876, 1, 0, 0, 1, 1,
0.6979903, 0.3175681, 1.934747, 0, 0, 0, 1, 1,
0.7008326, 0.1693803, 2.382495, 0, 0, 0, 1, 1,
0.7012109, -0.3976647, 1.298594, 0, 0, 0, 1, 1,
0.7028869, 1.214859, 1.408612, 0, 0, 0, 1, 1,
0.708941, -0.08298415, 1.626018, 0, 0, 0, 1, 1,
0.7175952, 0.6307001, 1.01231, 0, 0, 0, 1, 1,
0.7185514, 0.6141633, 0.200928, 0, 0, 0, 1, 1,
0.7194442, 0.98826, 1.056098, 1, 1, 1, 1, 1,
0.7254747, -0.6126875, 2.677334, 1, 1, 1, 1, 1,
0.7259753, -2.410839, 1.447025, 1, 1, 1, 1, 1,
0.7309507, 0.9886988, 1.582377, 1, 1, 1, 1, 1,
0.7327896, -0.7153049, 3.761715, 1, 1, 1, 1, 1,
0.7331457, 0.6753094, 0.5266698, 1, 1, 1, 1, 1,
0.7335387, -0.001295137, 0.1036388, 1, 1, 1, 1, 1,
0.7335711, 1.164879, -0.7595662, 1, 1, 1, 1, 1,
0.7368194, -0.7755784, 2.49288, 1, 1, 1, 1, 1,
0.7395415, -1.227839, 2.360405, 1, 1, 1, 1, 1,
0.7410731, 1.913873, 0.5193248, 1, 1, 1, 1, 1,
0.7419692, 0.7583078, 0.4513545, 1, 1, 1, 1, 1,
0.7438154, 1.182186, -0.219364, 1, 1, 1, 1, 1,
0.7455901, 0.8564249, 0.6069682, 1, 1, 1, 1, 1,
0.7468756, -1.17768, 2.136568, 1, 1, 1, 1, 1,
0.7527635, -0.8581421, 3.550844, 0, 0, 1, 1, 1,
0.7560018, -1.731847, 2.476946, 1, 0, 0, 1, 1,
0.7562692, 0.304103, 0.3440603, 1, 0, 0, 1, 1,
0.7564387, 0.761947, 1.135836, 1, 0, 0, 1, 1,
0.760293, 0.4791102, 1.060543, 1, 0, 0, 1, 1,
0.7608684, -0.3097588, 1.210138, 1, 0, 0, 1, 1,
0.7611094, -0.4010341, 1.509928, 0, 0, 0, 1, 1,
0.7643214, -0.06886168, 1.853572, 0, 0, 0, 1, 1,
0.7681952, 0.3518052, 0.4295402, 0, 0, 0, 1, 1,
0.7808357, 0.6978687, 0.1212892, 0, 0, 0, 1, 1,
0.7821141, -1.819917, 1.461988, 0, 0, 0, 1, 1,
0.7837167, 0.177579, 2.01231, 0, 0, 0, 1, 1,
0.7922466, -0.1753128, 1.107503, 0, 0, 0, 1, 1,
0.8025492, 0.5278061, 0.5522083, 1, 1, 1, 1, 1,
0.8050407, 1.020882, 1.484016, 1, 1, 1, 1, 1,
0.8134549, -0.373439, 2.04196, 1, 1, 1, 1, 1,
0.8180799, 1.132038, 0.2069398, 1, 1, 1, 1, 1,
0.8190708, 2.19587, 0.8418152, 1, 1, 1, 1, 1,
0.8198195, 0.6850094, 0.2072634, 1, 1, 1, 1, 1,
0.8215786, -1.095029, 4.016131, 1, 1, 1, 1, 1,
0.8232469, -1.028434, 3.48883, 1, 1, 1, 1, 1,
0.8257741, 1.148641, 1.214291, 1, 1, 1, 1, 1,
0.8272057, -0.6672033, 1.4684, 1, 1, 1, 1, 1,
0.8313407, -0.02620623, 2.429911, 1, 1, 1, 1, 1,
0.8333556, 0.6011301, 0.8389078, 1, 1, 1, 1, 1,
0.8476488, 0.5612835, 2.161403, 1, 1, 1, 1, 1,
0.8521051, 1.388867, -0.8683895, 1, 1, 1, 1, 1,
0.8564233, 0.1144642, 0.06593586, 1, 1, 1, 1, 1,
0.8625557, -1.705505, 1.767994, 0, 0, 1, 1, 1,
0.8705937, -0.1494533, 1.446347, 1, 0, 0, 1, 1,
0.872591, 1.148278, 1.176486, 1, 0, 0, 1, 1,
0.8737574, 0.2790544, 0.9254449, 1, 0, 0, 1, 1,
0.8750058, -1.301479, 2.115074, 1, 0, 0, 1, 1,
0.8792461, -0.2219014, 0.988218, 1, 0, 0, 1, 1,
0.879462, 1.348432, 0.176925, 0, 0, 0, 1, 1,
0.8819399, 0.9058653, 0.9079432, 0, 0, 0, 1, 1,
0.882557, 1.78548, 0.7042466, 0, 0, 0, 1, 1,
0.8882014, -0.4964882, 1.924376, 0, 0, 0, 1, 1,
0.8942157, -1.036272, 3.007959, 0, 0, 0, 1, 1,
0.8960208, 1.572879, 1.380797, 0, 0, 0, 1, 1,
0.8999892, -1.030818, 3.310564, 0, 0, 0, 1, 1,
0.9047919, 0.5778976, 1.329905, 1, 1, 1, 1, 1,
0.9080704, -1.869395, 2.36061, 1, 1, 1, 1, 1,
0.9203721, -0.9312572, 1.310225, 1, 1, 1, 1, 1,
0.9288952, 0.2969578, 1.181623, 1, 1, 1, 1, 1,
0.9314939, -0.176228, 2.715219, 1, 1, 1, 1, 1,
0.9339903, 1.236928, 1.471135, 1, 1, 1, 1, 1,
0.9401825, -2.602782, 3.990164, 1, 1, 1, 1, 1,
0.9405787, -0.7201411, 2.244864, 1, 1, 1, 1, 1,
0.943752, 0.855918, -1.421019, 1, 1, 1, 1, 1,
0.9493224, 1.039464, 1.654576, 1, 1, 1, 1, 1,
0.956562, 0.4594673, 0.7807202, 1, 1, 1, 1, 1,
0.9573037, -1.265894, 2.565771, 1, 1, 1, 1, 1,
0.9693839, -1.748477, 3.326052, 1, 1, 1, 1, 1,
0.9716005, -0.5378389, 2.295089, 1, 1, 1, 1, 1,
0.9747773, 0.2379848, 1.038414, 1, 1, 1, 1, 1,
0.9782252, 0.5111418, 1.791596, 0, 0, 1, 1, 1,
0.97903, 0.8354114, 1.280086, 1, 0, 0, 1, 1,
0.9867429, 2.544594, -0.4404745, 1, 0, 0, 1, 1,
0.9931952, 0.1897167, 0.4986169, 1, 0, 0, 1, 1,
1.00264, -0.3225173, 0.4793746, 1, 0, 0, 1, 1,
1.003337, -0.3745694, 2.013848, 1, 0, 0, 1, 1,
1.008906, 0.05151924, 0.2947765, 0, 0, 0, 1, 1,
1.014722, 1.708479, 0.1168957, 0, 0, 0, 1, 1,
1.025308, -1.146397, 3.339947, 0, 0, 0, 1, 1,
1.027741, -0.04106568, 1.151472, 0, 0, 0, 1, 1,
1.028192, 0.1206749, 2.546479, 0, 0, 0, 1, 1,
1.029674, -0.2504775, 3.230373, 0, 0, 0, 1, 1,
1.038386, -0.9871999, 0.4324237, 0, 0, 0, 1, 1,
1.039008, 1.181225, -0.03938589, 1, 1, 1, 1, 1,
1.041066, -1.324189, 2.095852, 1, 1, 1, 1, 1,
1.047755, -0.3820516, 2.809046, 1, 1, 1, 1, 1,
1.052058, -3.378848, 3.068729, 1, 1, 1, 1, 1,
1.054482, -1.238491, 2.803001, 1, 1, 1, 1, 1,
1.065116, 0.3868787, 0.4335303, 1, 1, 1, 1, 1,
1.067523, -0.5864308, 1.28175, 1, 1, 1, 1, 1,
1.069645, 1.662268, 1.777073, 1, 1, 1, 1, 1,
1.069683, -2.20098, 1.168475, 1, 1, 1, 1, 1,
1.074464, -1.324413, 2.364191, 1, 1, 1, 1, 1,
1.081936, -0.9682291, 2.798843, 1, 1, 1, 1, 1,
1.08718, 0.7354013, 0.7332843, 1, 1, 1, 1, 1,
1.089553, 0.160541, 0.08910167, 1, 1, 1, 1, 1,
1.09021, -0.6594318, 2.063371, 1, 1, 1, 1, 1,
1.106672, 0.8752122, -0.05564311, 1, 1, 1, 1, 1,
1.107159, -0.003176618, 0.7643306, 0, 0, 1, 1, 1,
1.11214, -0.2587814, -0.04811509, 1, 0, 0, 1, 1,
1.125516, -0.2547994, -0.1986618, 1, 0, 0, 1, 1,
1.12884, -2.11487, 3.779317, 1, 0, 0, 1, 1,
1.129301, 0.2613154, 1.604278, 1, 0, 0, 1, 1,
1.130226, -1.322076, 1.770271, 1, 0, 0, 1, 1,
1.140318, -0.716481, 3.325315, 0, 0, 0, 1, 1,
1.149784, -0.1366808, 2.972966, 0, 0, 0, 1, 1,
1.150432, -0.0452959, 3.760266, 0, 0, 0, 1, 1,
1.155561, -0.04024551, -0.2184722, 0, 0, 0, 1, 1,
1.160994, 0.9629458, 0.999186, 0, 0, 0, 1, 1,
1.161115, 0.09264202, 1.702109, 0, 0, 0, 1, 1,
1.161433, 0.05026592, 1.340615, 0, 0, 0, 1, 1,
1.168607, -1.148592, 2.587651, 1, 1, 1, 1, 1,
1.178949, -1.697888, 2.132899, 1, 1, 1, 1, 1,
1.180934, 0.6627811, 0.5860355, 1, 1, 1, 1, 1,
1.192842, 1.289946, 1.623085, 1, 1, 1, 1, 1,
1.204521, -0.4259667, 2.574297, 1, 1, 1, 1, 1,
1.210902, 0.1552071, 1.176093, 1, 1, 1, 1, 1,
1.212027, 0.6047501, 2.248674, 1, 1, 1, 1, 1,
1.214673, -0.5275779, 2.346173, 1, 1, 1, 1, 1,
1.217427, 1.319003, 1.146134, 1, 1, 1, 1, 1,
1.217949, 0.1427654, 0.2195383, 1, 1, 1, 1, 1,
1.224579, 1.808645, 0.2214381, 1, 1, 1, 1, 1,
1.227406, 0.6678917, 0.8108434, 1, 1, 1, 1, 1,
1.237463, 0.8042093, 0.2896161, 1, 1, 1, 1, 1,
1.251376, -1.020895, 2.043006, 1, 1, 1, 1, 1,
1.251608, -0.596055, 2.048027, 1, 1, 1, 1, 1,
1.259631, -0.1286924, 0.0948523, 0, 0, 1, 1, 1,
1.276269, -0.8208051, 2.246497, 1, 0, 0, 1, 1,
1.281473, 1.172353, 1.837645, 1, 0, 0, 1, 1,
1.281749, -0.674653, 2.183627, 1, 0, 0, 1, 1,
1.304378, 0.5638827, 1.519368, 1, 0, 0, 1, 1,
1.318515, -0.4407893, 2.203871, 1, 0, 0, 1, 1,
1.318669, 0.7940248, -1.172403, 0, 0, 0, 1, 1,
1.351508, -0.2210388, 3.660049, 0, 0, 0, 1, 1,
1.369059, 0.4068841, 1.920931, 0, 0, 0, 1, 1,
1.371178, -0.1317624, 2.489131, 0, 0, 0, 1, 1,
1.371431, 0.3192959, 2.470993, 0, 0, 0, 1, 1,
1.374226, 0.4063653, 1.385673, 0, 0, 0, 1, 1,
1.379902, 0.4799239, 1.653662, 0, 0, 0, 1, 1,
1.385305, -0.5319792, 0.7184818, 1, 1, 1, 1, 1,
1.389616, -0.142271, -0.05657435, 1, 1, 1, 1, 1,
1.40162, -0.05613887, 1.019137, 1, 1, 1, 1, 1,
1.413849, -0.1629938, 2.532461, 1, 1, 1, 1, 1,
1.418183, 0.5978568, 1.88941, 1, 1, 1, 1, 1,
1.419514, 0.02253335, 0.3443092, 1, 1, 1, 1, 1,
1.4319, 0.566283, 0.5012128, 1, 1, 1, 1, 1,
1.435712, 1.912906, 0.1952951, 1, 1, 1, 1, 1,
1.440188, 0.09358685, 1.512233, 1, 1, 1, 1, 1,
1.446748, 1.212309, 1.322004, 1, 1, 1, 1, 1,
1.450554, 0.3179286, 0.02386699, 1, 1, 1, 1, 1,
1.474496, 0.3008355, 0.4999916, 1, 1, 1, 1, 1,
1.477392, -2.267481, 1.567245, 1, 1, 1, 1, 1,
1.477527, -0.5597149, 2.897147, 1, 1, 1, 1, 1,
1.49998, 1.114839, 1.503966, 1, 1, 1, 1, 1,
1.503187, 0.09709966, -0.3843537, 0, 0, 1, 1, 1,
1.505414, 1.159219, 2.01299, 1, 0, 0, 1, 1,
1.506516, 0.5457129, 2.642272, 1, 0, 0, 1, 1,
1.507453, 0.6513169, 1.885496, 1, 0, 0, 1, 1,
1.509391, 0.1047262, 1.433596, 1, 0, 0, 1, 1,
1.511579, 0.1590294, 1.248018, 1, 0, 0, 1, 1,
1.520334, -0.2534932, 2.744895, 0, 0, 0, 1, 1,
1.525865, 0.6797534, -0.8142851, 0, 0, 0, 1, 1,
1.529814, -1.927823, 1.55722, 0, 0, 0, 1, 1,
1.532345, -0.5297238, 2.407744, 0, 0, 0, 1, 1,
1.547282, -1.13235, 3.643325, 0, 0, 0, 1, 1,
1.547572, 0.6415358, -0.6167722, 0, 0, 0, 1, 1,
1.55412, -0.6132865, 0.9899156, 0, 0, 0, 1, 1,
1.557012, 1.592796, 0.8980275, 1, 1, 1, 1, 1,
1.561805, 0.1932611, 0.6732374, 1, 1, 1, 1, 1,
1.58076, -0.3619731, 0.7163097, 1, 1, 1, 1, 1,
1.584521, -1.401564, 2.980187, 1, 1, 1, 1, 1,
1.591168, 0.7922847, 0.8316736, 1, 1, 1, 1, 1,
1.602448, -0.37794, 1.731906, 1, 1, 1, 1, 1,
1.633993, 1.09108, 2.983058, 1, 1, 1, 1, 1,
1.634234, 2.313522, 1.775461, 1, 1, 1, 1, 1,
1.649142, 0.4809445, 0.7411634, 1, 1, 1, 1, 1,
1.652891, 0.9113044, 1.284884, 1, 1, 1, 1, 1,
1.657908, 0.9362869, 2.588418, 1, 1, 1, 1, 1,
1.68976, -0.6506941, 2.251736, 1, 1, 1, 1, 1,
1.693025, -1.134975, 2.371609, 1, 1, 1, 1, 1,
1.705597, -0.8106261, 1.377952, 1, 1, 1, 1, 1,
1.71826, -1.280686, 1.356813, 1, 1, 1, 1, 1,
1.719332, 1.11832, 1.739737, 0, 0, 1, 1, 1,
1.730425, 0.3501691, 1.153049, 1, 0, 0, 1, 1,
1.735324, -0.6858736, 3.136494, 1, 0, 0, 1, 1,
1.744154, -0.444001, 2.635189, 1, 0, 0, 1, 1,
1.744224, 0.08251826, 3.122755, 1, 0, 0, 1, 1,
1.747279, 1.912603, 0.798328, 1, 0, 0, 1, 1,
1.750721, 0.3204978, 1.789139, 0, 0, 0, 1, 1,
1.7602, 0.1610877, 1.79509, 0, 0, 0, 1, 1,
1.770656, -1.208635, 2.019488, 0, 0, 0, 1, 1,
1.790665, -0.9463713, 2.0316, 0, 0, 0, 1, 1,
1.805236, 0.006647432, 4.607869, 0, 0, 0, 1, 1,
1.846141, -0.6797286, 1.03861, 0, 0, 0, 1, 1,
1.851681, -0.3616047, 0.8247505, 0, 0, 0, 1, 1,
1.89427, -2.147048, 1.602994, 1, 1, 1, 1, 1,
1.900638, 0.8407281, 1.72451, 1, 1, 1, 1, 1,
1.915594, -1.040621, 0.6600381, 1, 1, 1, 1, 1,
1.957349, 0.5401176, 1.444153, 1, 1, 1, 1, 1,
1.957616, -0.4488221, 2.952693, 1, 1, 1, 1, 1,
1.973622, 0.5500034, 2.626693, 1, 1, 1, 1, 1,
1.993135, 0.412176, 0.3864096, 1, 1, 1, 1, 1,
1.99481, 0.718956, 0.7676907, 1, 1, 1, 1, 1,
2.018274, 1.422287, -0.3808166, 1, 1, 1, 1, 1,
2.022375, 1.100101, 0.6647849, 1, 1, 1, 1, 1,
2.037678, -0.1538409, 1.417555, 1, 1, 1, 1, 1,
2.037752, -0.06258848, 0.7899937, 1, 1, 1, 1, 1,
2.03813, 0.6230914, 0.4410266, 1, 1, 1, 1, 1,
2.058172, -0.3432872, 1.873772, 1, 1, 1, 1, 1,
2.070607, 0.9064345, 1.962287, 1, 1, 1, 1, 1,
2.07473, -0.7021216, 1.908778, 0, 0, 1, 1, 1,
2.08313, 0.018246, 2.220829, 1, 0, 0, 1, 1,
2.096205, -0.9184484, 3.013687, 1, 0, 0, 1, 1,
2.110029, 0.6900393, 1.016128, 1, 0, 0, 1, 1,
2.118508, 0.5189776, 1.92491, 1, 0, 0, 1, 1,
2.138756, -0.2716487, 1.392716, 1, 0, 0, 1, 1,
2.158831, -2.043042, 1.327958, 0, 0, 0, 1, 1,
2.17389, -0.2371448, 0.1786297, 0, 0, 0, 1, 1,
2.225969, -0.8336484, 1.00273, 0, 0, 0, 1, 1,
2.307244, 0.8825656, 1.724974, 0, 0, 0, 1, 1,
2.316943, 2.032123, 0.9742611, 0, 0, 0, 1, 1,
2.334281, 1.425098, 1.93665, 0, 0, 0, 1, 1,
2.389327, -1.588054, 2.421249, 0, 0, 0, 1, 1,
2.42826, 0.1686702, 1.879967, 1, 1, 1, 1, 1,
2.457124, 1.373376, 0.8828574, 1, 1, 1, 1, 1,
2.544285, 0.6980208, 0.6148986, 1, 1, 1, 1, 1,
2.763722, -0.05757612, 0.8720173, 1, 1, 1, 1, 1,
2.769398, -0.0204191, 1.487814, 1, 1, 1, 1, 1,
2.890637, 1.542779, 1.588912, 1, 1, 1, 1, 1,
3.057639, 0.9933552, 0.8927248, 1, 1, 1, 1, 1
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
var radius = 9.461648;
var distance = 33.23363;
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
mvMatrix.translate( -0.2399703, -0.1682007, -0.10063 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.23363);
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
