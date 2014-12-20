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
-2.777932, 0.3046597, -2.470199, 1, 0, 0, 1,
-2.479323, -0.2919284, -1.710641, 1, 0.007843138, 0, 1,
-2.470776, 0.373169, -0.4075536, 1, 0.01176471, 0, 1,
-2.410116, 0.5440011, -1.825437, 1, 0.01960784, 0, 1,
-2.312965, 2.52146, -2.246394, 1, 0.02352941, 0, 1,
-2.248992, 1.346712, 0.002054798, 1, 0.03137255, 0, 1,
-2.241158, 0.05516174, -2.574961, 1, 0.03529412, 0, 1,
-2.217573, 1.849434, -1.153829, 1, 0.04313726, 0, 1,
-2.174495, -0.7308944, -2.257347, 1, 0.04705882, 0, 1,
-2.152415, -0.6458993, -0.7357777, 1, 0.05490196, 0, 1,
-2.124903, 0.8163041, -1.549901, 1, 0.05882353, 0, 1,
-2.105718, -1.881654, -1.492724, 1, 0.06666667, 0, 1,
-2.082743, 1.918137, -0.05930303, 1, 0.07058824, 0, 1,
-2.074881, -0.4088547, -3.233624, 1, 0.07843138, 0, 1,
-2.04647, -0.3559198, -2.41298, 1, 0.08235294, 0, 1,
-2.046302, -2.038782, -2.232501, 1, 0.09019608, 0, 1,
-2.039984, 0.03285163, -1.168359, 1, 0.09411765, 0, 1,
-2.039552, 0.7834632, -1.415646, 1, 0.1019608, 0, 1,
-2.023552, 0.3981715, -0.5985731, 1, 0.1098039, 0, 1,
-2.016807, 0.7295039, -1.370427, 1, 0.1137255, 0, 1,
-2.004375, -1.931439, -2.215447, 1, 0.1215686, 0, 1,
-2.000434, -1.946554, -1.41501, 1, 0.1254902, 0, 1,
-1.998066, 0.8745944, -1.040544, 1, 0.1333333, 0, 1,
-1.996716, 0.5049396, -1.179698, 1, 0.1372549, 0, 1,
-1.969863, -1.379185, -3.308747, 1, 0.145098, 0, 1,
-1.958007, -0.2910579, -3.034306, 1, 0.1490196, 0, 1,
-1.939986, 1.257652, -1.804434, 1, 0.1568628, 0, 1,
-1.935113, 0.417257, -2.239541, 1, 0.1607843, 0, 1,
-1.934047, -1.821457, -2.040826, 1, 0.1686275, 0, 1,
-1.911268, -0.05523906, -0.6754601, 1, 0.172549, 0, 1,
-1.907105, 0.1487636, -1.966254, 1, 0.1803922, 0, 1,
-1.878597, -0.02798208, -1.389109, 1, 0.1843137, 0, 1,
-1.876269, -0.227229, -2.070663, 1, 0.1921569, 0, 1,
-1.850546, 1.079488, 0.4803687, 1, 0.1960784, 0, 1,
-1.842939, 1.227872, 0.5186332, 1, 0.2039216, 0, 1,
-1.841979, 1.007908, -0.6655, 1, 0.2117647, 0, 1,
-1.80776, -0.4248919, -1.144447, 1, 0.2156863, 0, 1,
-1.79706, -0.9025179, -0.1417292, 1, 0.2235294, 0, 1,
-1.734333, 0.3200738, -0.7056741, 1, 0.227451, 0, 1,
-1.701649, -0.494932, -3.934258, 1, 0.2352941, 0, 1,
-1.679557, 0.07431208, -1.407661, 1, 0.2392157, 0, 1,
-1.672927, 1.099164, -1.415297, 1, 0.2470588, 0, 1,
-1.657553, 2.049654, 0.08118537, 1, 0.2509804, 0, 1,
-1.641876, 2.158907, -1.362673, 1, 0.2588235, 0, 1,
-1.630954, -1.068724, -1.24581, 1, 0.2627451, 0, 1,
-1.626379, 0.648967, -0.8284838, 1, 0.2705882, 0, 1,
-1.626073, 0.7308381, -0.9922969, 1, 0.2745098, 0, 1,
-1.625061, 1.013281, 0.1889086, 1, 0.282353, 0, 1,
-1.613691, -0.6249933, -0.4577653, 1, 0.2862745, 0, 1,
-1.610547, 0.6514449, -1.102596, 1, 0.2941177, 0, 1,
-1.602047, 1.448973, -1.431705, 1, 0.3019608, 0, 1,
-1.59791, -1.138986, -0.2519829, 1, 0.3058824, 0, 1,
-1.585006, 1.8235, 0.6871023, 1, 0.3137255, 0, 1,
-1.578176, 0.6416066, -0.8451003, 1, 0.3176471, 0, 1,
-1.577664, 0.2448116, -1.752658, 1, 0.3254902, 0, 1,
-1.570488, -1.55996, -2.601048, 1, 0.3294118, 0, 1,
-1.563686, -0.2195328, -0.7737539, 1, 0.3372549, 0, 1,
-1.560123, -0.8238218, -1.481635, 1, 0.3411765, 0, 1,
-1.53252, 0.8930416, -2.109219, 1, 0.3490196, 0, 1,
-1.531863, 1.186161, -4.007118, 1, 0.3529412, 0, 1,
-1.529825, -0.687327, -2.039421, 1, 0.3607843, 0, 1,
-1.518943, 2.224846, -1.003853, 1, 0.3647059, 0, 1,
-1.505698, -1.447356, -2.15426, 1, 0.372549, 0, 1,
-1.499888, -0.3202479, -2.20268, 1, 0.3764706, 0, 1,
-1.4911, -1.231074, -2.154929, 1, 0.3843137, 0, 1,
-1.475134, -0.3913045, -1.635732, 1, 0.3882353, 0, 1,
-1.459425, 0.03180198, -1.218316, 1, 0.3960784, 0, 1,
-1.457005, -0.3456589, -1.212203, 1, 0.4039216, 0, 1,
-1.439292, 1.86188, -3.139946, 1, 0.4078431, 0, 1,
-1.436429, -2.215603, -1.910046, 1, 0.4156863, 0, 1,
-1.418367, 0.004989798, -3.860006, 1, 0.4196078, 0, 1,
-1.402178, 1.105523, -0.7347382, 1, 0.427451, 0, 1,
-1.397849, -1.454327, -2.030152, 1, 0.4313726, 0, 1,
-1.369176, -0.2504357, -2.234784, 1, 0.4392157, 0, 1,
-1.367718, 1.578116, -1.047762, 1, 0.4431373, 0, 1,
-1.366327, 0.6348674, 0.7202155, 1, 0.4509804, 0, 1,
-1.358685, 1.043402, -1.225606, 1, 0.454902, 0, 1,
-1.354249, -0.3323943, -0.4109099, 1, 0.4627451, 0, 1,
-1.349171, 0.625901, -0.9391721, 1, 0.4666667, 0, 1,
-1.348992, 0.9844328, -0.8651094, 1, 0.4745098, 0, 1,
-1.34428, -0.4529182, -1.838002, 1, 0.4784314, 0, 1,
-1.340654, -0.5383676, -0.4976066, 1, 0.4862745, 0, 1,
-1.338598, -1.455596, -2.207192, 1, 0.4901961, 0, 1,
-1.335661, -2.475817, -3.101936, 1, 0.4980392, 0, 1,
-1.333616, -0.1350494, -1.037137, 1, 0.5058824, 0, 1,
-1.331578, -0.746884, -1.950839, 1, 0.509804, 0, 1,
-1.3278, 0.9105249, -1.480865, 1, 0.5176471, 0, 1,
-1.316704, 0.1957212, -2.192639, 1, 0.5215687, 0, 1,
-1.297542, 0.2558465, -1.715028, 1, 0.5294118, 0, 1,
-1.293816, 1.274599, -0.1036204, 1, 0.5333334, 0, 1,
-1.283467, 0.2140589, -0.598247, 1, 0.5411765, 0, 1,
-1.276441, 0.1935441, -0.933613, 1, 0.5450981, 0, 1,
-1.272846, 0.396149, -2.42804, 1, 0.5529412, 0, 1,
-1.268697, 0.8734092, -1.548601, 1, 0.5568628, 0, 1,
-1.268181, -2.093098, -1.726261, 1, 0.5647059, 0, 1,
-1.266188, -1.106799, -4.100704, 1, 0.5686275, 0, 1,
-1.265483, 1.160146, -0.3113064, 1, 0.5764706, 0, 1,
-1.261216, 0.07476357, -1.609785, 1, 0.5803922, 0, 1,
-1.255697, 0.5790713, -2.068639, 1, 0.5882353, 0, 1,
-1.246212, 0.2309837, -1.079993, 1, 0.5921569, 0, 1,
-1.242701, 0.5971227, -0.8160554, 1, 0.6, 0, 1,
-1.230191, -1.187312, -4.053518, 1, 0.6078432, 0, 1,
-1.218977, -0.3131084, -4.012196, 1, 0.6117647, 0, 1,
-1.212705, 0.7747287, -3.087175, 1, 0.6196079, 0, 1,
-1.20396, 0.1053031, 0.2039261, 1, 0.6235294, 0, 1,
-1.191884, 0.4636814, -2.140074, 1, 0.6313726, 0, 1,
-1.18782, 0.4321934, -0.3225608, 1, 0.6352941, 0, 1,
-1.180966, 1.648298, -1.469125, 1, 0.6431373, 0, 1,
-1.16769, 0.3983025, -1.264609, 1, 0.6470588, 0, 1,
-1.151851, 0.3581398, -3.287878, 1, 0.654902, 0, 1,
-1.146096, 0.1353274, 0.0487798, 1, 0.6588235, 0, 1,
-1.145744, -2.391651, -1.474965, 1, 0.6666667, 0, 1,
-1.136991, -2.968872, -4.484282, 1, 0.6705883, 0, 1,
-1.135911, -1.785315, -1.974774, 1, 0.6784314, 0, 1,
-1.132941, 2.569467, -1.115415, 1, 0.682353, 0, 1,
-1.132175, 1.903733, -1.550236, 1, 0.6901961, 0, 1,
-1.122931, -0.1929322, -1.525279, 1, 0.6941177, 0, 1,
-1.117941, 0.368265, -1.578121, 1, 0.7019608, 0, 1,
-1.114699, -0.4925882, -2.180224, 1, 0.7098039, 0, 1,
-1.114345, -0.8271575, -1.170184, 1, 0.7137255, 0, 1,
-1.109751, -0.9802033, -4.389056, 1, 0.7215686, 0, 1,
-1.109278, -1.367038, -2.66707, 1, 0.7254902, 0, 1,
-1.107435, 0.6467085, -1.048336, 1, 0.7333333, 0, 1,
-1.103697, -0.5404655, -1.972349, 1, 0.7372549, 0, 1,
-1.103632, 1.33172, -1.660303, 1, 0.7450981, 0, 1,
-1.099376, -0.6372226, -3.226235, 1, 0.7490196, 0, 1,
-1.091284, 1.357479, -1.042595, 1, 0.7568628, 0, 1,
-1.084126, -0.1835647, -0.6531304, 1, 0.7607843, 0, 1,
-1.08402, -0.7035738, -1.821796, 1, 0.7686275, 0, 1,
-1.072339, -1.130752, -3.510763, 1, 0.772549, 0, 1,
-1.07, -0.09320582, -0.2042005, 1, 0.7803922, 0, 1,
-1.067418, 0.8332461, 0.306563, 1, 0.7843137, 0, 1,
-1.061597, 0.1369998, -1.204118, 1, 0.7921569, 0, 1,
-1.060361, -0.7965545, -1.732847, 1, 0.7960784, 0, 1,
-1.053442, -0.07975233, -1.100112, 1, 0.8039216, 0, 1,
-1.04571, 0.2690476, -2.163406, 1, 0.8117647, 0, 1,
-1.033103, -0.5402519, -2.09992, 1, 0.8156863, 0, 1,
-1.030402, 0.7675038, -1.10095, 1, 0.8235294, 0, 1,
-1.027329, 0.08425537, -1.969122, 1, 0.827451, 0, 1,
-1.027081, 0.8506708, 0.3206001, 1, 0.8352941, 0, 1,
-1.020305, 1.386301, 0.7468431, 1, 0.8392157, 0, 1,
-1.019405, -0.6766934, -3.439135, 1, 0.8470588, 0, 1,
-1.017531, 1.137279, -0.2254855, 1, 0.8509804, 0, 1,
-1.016889, 0.6873562, -0.4105641, 1, 0.8588235, 0, 1,
-1.004665, 0.3161373, -2.247565, 1, 0.8627451, 0, 1,
-0.9976333, 0.02715204, -2.260617, 1, 0.8705882, 0, 1,
-0.9877213, -0.7410918, -2.967952, 1, 0.8745098, 0, 1,
-0.9859372, -0.2982748, -2.215678, 1, 0.8823529, 0, 1,
-0.9697974, -1.700227, -3.978371, 1, 0.8862745, 0, 1,
-0.9661996, -2.681039, -1.598648, 1, 0.8941177, 0, 1,
-0.9659581, -0.5427495, -3.439421, 1, 0.8980392, 0, 1,
-0.9642049, -1.106341, -2.69113, 1, 0.9058824, 0, 1,
-0.9621848, -0.5396363, -2.516458, 1, 0.9137255, 0, 1,
-0.9591036, -0.3508234, -3.358311, 1, 0.9176471, 0, 1,
-0.9562624, -2.178338, -2.243, 1, 0.9254902, 0, 1,
-0.9525677, 0.3812234, -1.097884, 1, 0.9294118, 0, 1,
-0.9507689, -0.7162437, -1.864963, 1, 0.9372549, 0, 1,
-0.9507187, -0.5017565, -1.295746, 1, 0.9411765, 0, 1,
-0.9496678, 1.127115, -1.589774, 1, 0.9490196, 0, 1,
-0.9458585, -1.712351, -2.157006, 1, 0.9529412, 0, 1,
-0.9384704, 0.7542289, -3.112631, 1, 0.9607843, 0, 1,
-0.9360371, -0.2441909, -2.18909, 1, 0.9647059, 0, 1,
-0.9308777, -0.1392733, -3.629258, 1, 0.972549, 0, 1,
-0.9300323, 1.039959, -0.8030949, 1, 0.9764706, 0, 1,
-0.9247309, -0.0683096, 0.3751558, 1, 0.9843137, 0, 1,
-0.9214025, 1.341755, -0.9791883, 1, 0.9882353, 0, 1,
-0.9191431, 1.000115, -1.578692, 1, 0.9960784, 0, 1,
-0.9163601, -0.3301801, -2.946415, 0.9960784, 1, 0, 1,
-0.9108383, 0.3937013, -0.3063898, 0.9921569, 1, 0, 1,
-0.910787, -0.4729744, -0.8872855, 0.9843137, 1, 0, 1,
-0.9102221, 2.648592, -1.877204, 0.9803922, 1, 0, 1,
-0.9064681, 0.8019947, -0.01883571, 0.972549, 1, 0, 1,
-0.9032166, 0.4331628, -2.646304, 0.9686275, 1, 0, 1,
-0.901507, -0.467364, -4.631642, 0.9607843, 1, 0, 1,
-0.8997688, -0.7791501, -2.506233, 0.9568627, 1, 0, 1,
-0.8993484, 1.035056, 0.321095, 0.9490196, 1, 0, 1,
-0.8900813, 0.05939939, -2.269656, 0.945098, 1, 0, 1,
-0.8888206, 0.8551562, -1.525743, 0.9372549, 1, 0, 1,
-0.8834751, 1.023511, -0.2557285, 0.9333333, 1, 0, 1,
-0.8831252, 1.55671, -0.05112357, 0.9254902, 1, 0, 1,
-0.8656576, -1.20888, -2.420614, 0.9215686, 1, 0, 1,
-0.8633558, -1.464573, -3.137902, 0.9137255, 1, 0, 1,
-0.8609905, -0.5498885, -1.47032, 0.9098039, 1, 0, 1,
-0.8563287, 0.4375304, -0.07281372, 0.9019608, 1, 0, 1,
-0.8457397, 0.2047123, -3.241462, 0.8941177, 1, 0, 1,
-0.8330479, -0.2479665, -1.052092, 0.8901961, 1, 0, 1,
-0.832715, 1.182273, 0.2452436, 0.8823529, 1, 0, 1,
-0.8307084, -0.008711395, -0.4967595, 0.8784314, 1, 0, 1,
-0.8270003, 0.7448444, -1.061005, 0.8705882, 1, 0, 1,
-0.8256267, 1.718993, -1.703097, 0.8666667, 1, 0, 1,
-0.8226821, -0.7683995, -2.49988, 0.8588235, 1, 0, 1,
-0.8119599, 0.3600774, -0.230231, 0.854902, 1, 0, 1,
-0.8040906, 0.9654714, -1.018027, 0.8470588, 1, 0, 1,
-0.8009642, -0.5776085, -3.458991, 0.8431373, 1, 0, 1,
-0.7996669, 0.4630561, -0.6412415, 0.8352941, 1, 0, 1,
-0.7975711, 0.9836046, -0.3772704, 0.8313726, 1, 0, 1,
-0.7954137, -0.7071297, -1.834836, 0.8235294, 1, 0, 1,
-0.7950626, -0.2231354, -0.3219068, 0.8196079, 1, 0, 1,
-0.7911128, -0.2989815, -0.7671699, 0.8117647, 1, 0, 1,
-0.788803, 0.2806493, -1.958052, 0.8078431, 1, 0, 1,
-0.7877005, 0.165678, -2.2851, 0.8, 1, 0, 1,
-0.7862927, 1.090055, -0.4277202, 0.7921569, 1, 0, 1,
-0.7848336, -0.04507494, -4.134818, 0.7882353, 1, 0, 1,
-0.7839872, -1.611002, -1.249147, 0.7803922, 1, 0, 1,
-0.7749543, -0.8701119, -1.800815, 0.7764706, 1, 0, 1,
-0.7718955, 1.40603, -0.1061237, 0.7686275, 1, 0, 1,
-0.7662825, 1.533137, -0.0853507, 0.7647059, 1, 0, 1,
-0.7575716, 1.069712, -1.897245, 0.7568628, 1, 0, 1,
-0.7568927, 0.678413, 0.07434749, 0.7529412, 1, 0, 1,
-0.7560328, 0.3737156, -0.629526, 0.7450981, 1, 0, 1,
-0.7547094, -0.7990312, -2.160003, 0.7411765, 1, 0, 1,
-0.7522455, 0.4044543, -2.14916, 0.7333333, 1, 0, 1,
-0.7495861, 0.4262087, -0.1812241, 0.7294118, 1, 0, 1,
-0.7473174, 0.652852, -1.655001, 0.7215686, 1, 0, 1,
-0.7460047, -0.3955379, -3.909299, 0.7176471, 1, 0, 1,
-0.7458134, -1.471961, -1.896884, 0.7098039, 1, 0, 1,
-0.7414222, -0.7008078, -1.640516, 0.7058824, 1, 0, 1,
-0.7375934, 0.8646876, -1.04439, 0.6980392, 1, 0, 1,
-0.7367378, -0.0226858, -2.404899, 0.6901961, 1, 0, 1,
-0.7354212, -2.16225, -3.775996, 0.6862745, 1, 0, 1,
-0.7330095, -1.352053, -0.444579, 0.6784314, 1, 0, 1,
-0.7323717, 1.255033, 0.499191, 0.6745098, 1, 0, 1,
-0.731646, -1.308501, -2.781258, 0.6666667, 1, 0, 1,
-0.7282045, -1.876443, -3.385399, 0.6627451, 1, 0, 1,
-0.7271523, -0.8161309, -2.994814, 0.654902, 1, 0, 1,
-0.7268267, -2.589033, -3.10965, 0.6509804, 1, 0, 1,
-0.7259699, -1.001885, -1.886977, 0.6431373, 1, 0, 1,
-0.7240381, 0.4138082, -1.878065, 0.6392157, 1, 0, 1,
-0.723124, 0.836232, 0.5936138, 0.6313726, 1, 0, 1,
-0.7205715, 0.08049785, -2.029997, 0.627451, 1, 0, 1,
-0.7203406, -1.162398, -4.477356, 0.6196079, 1, 0, 1,
-0.7192621, 0.2412882, -2.421023, 0.6156863, 1, 0, 1,
-0.7184182, -0.7211991, -0.8419375, 0.6078432, 1, 0, 1,
-0.7144838, 0.2772444, -1.136054, 0.6039216, 1, 0, 1,
-0.713261, 1.204123, -0.1372417, 0.5960785, 1, 0, 1,
-0.7117365, 0.7927478, -1.846591, 0.5882353, 1, 0, 1,
-0.7107525, -0.3637976, -2.079043, 0.5843138, 1, 0, 1,
-0.7065861, -0.7547196, -2.091226, 0.5764706, 1, 0, 1,
-0.7063565, -0.3762638, -2.282841, 0.572549, 1, 0, 1,
-0.7042086, -0.98896, -3.264499, 0.5647059, 1, 0, 1,
-0.7028015, -0.2937191, -1.732939, 0.5607843, 1, 0, 1,
-0.7011003, 1.421812, -0.05630432, 0.5529412, 1, 0, 1,
-0.6950272, 0.6240777, -2.68042, 0.5490196, 1, 0, 1,
-0.6943113, 0.5973283, -1.691891, 0.5411765, 1, 0, 1,
-0.6940919, 0.2198204, -1.009866, 0.5372549, 1, 0, 1,
-0.692808, -0.1699829, -1.366512, 0.5294118, 1, 0, 1,
-0.6907958, 0.6224101, -0.1676056, 0.5254902, 1, 0, 1,
-0.6902648, 0.0796831, -4.291828, 0.5176471, 1, 0, 1,
-0.6854399, 1.618111, -1.366179, 0.5137255, 1, 0, 1,
-0.6836026, -0.5045747, -1.293678, 0.5058824, 1, 0, 1,
-0.6829186, 0.8321511, -1.687281, 0.5019608, 1, 0, 1,
-0.6720129, -0.54086, -3.323089, 0.4941176, 1, 0, 1,
-0.6695873, 1.198519, -0.8817216, 0.4862745, 1, 0, 1,
-0.6605334, 1.5396, 0.3948189, 0.4823529, 1, 0, 1,
-0.6593, -0.338828, -1.99431, 0.4745098, 1, 0, 1,
-0.6565151, -0.9086014, -1.799183, 0.4705882, 1, 0, 1,
-0.6532602, 0.6671454, 0.2438043, 0.4627451, 1, 0, 1,
-0.6527289, -0.1588741, -0.5462113, 0.4588235, 1, 0, 1,
-0.6524682, 0.6658192, -1.119488, 0.4509804, 1, 0, 1,
-0.6452185, -0.7678486, -0.8538501, 0.4470588, 1, 0, 1,
-0.6415946, 0.4965009, -0.9581527, 0.4392157, 1, 0, 1,
-0.6399488, -0.6469996, -4.523092, 0.4352941, 1, 0, 1,
-0.6339288, 0.9129237, -2.090049, 0.427451, 1, 0, 1,
-0.6335162, -1.799504, -2.599948, 0.4235294, 1, 0, 1,
-0.6303477, -1.640458, -2.529197, 0.4156863, 1, 0, 1,
-0.6227914, 0.7864637, -2.88943, 0.4117647, 1, 0, 1,
-0.622588, 0.4347539, -1.530651, 0.4039216, 1, 0, 1,
-0.6157721, 0.535, 0.5239267, 0.3960784, 1, 0, 1,
-0.6140132, 1.218878, -1.120983, 0.3921569, 1, 0, 1,
-0.6133161, 1.613767, -0.6870654, 0.3843137, 1, 0, 1,
-0.6125951, -0.5914417, -1.37276, 0.3803922, 1, 0, 1,
-0.6082528, 1.614647, -0.6193661, 0.372549, 1, 0, 1,
-0.6002471, 0.8626503, 1.508234, 0.3686275, 1, 0, 1,
-0.6000629, -0.09805587, -3.718201, 0.3607843, 1, 0, 1,
-0.5992737, -1.037349, -4.113207, 0.3568628, 1, 0, 1,
-0.5970302, 0.6274602, 0.3025278, 0.3490196, 1, 0, 1,
-0.5877001, -2.313176, -4.657282, 0.345098, 1, 0, 1,
-0.58737, -1.437009, -1.691254, 0.3372549, 1, 0, 1,
-0.5862318, -0.6578049, -3.134012, 0.3333333, 1, 0, 1,
-0.5801388, -0.7142178, -1.768995, 0.3254902, 1, 0, 1,
-0.5719536, 0.5281285, 1.066814, 0.3215686, 1, 0, 1,
-0.5711802, -1.102193, -2.914886, 0.3137255, 1, 0, 1,
-0.567766, -1.090226, -1.388104, 0.3098039, 1, 0, 1,
-0.5667601, -2.230113, -1.228379, 0.3019608, 1, 0, 1,
-0.5667143, -0.9517834, -0.9602289, 0.2941177, 1, 0, 1,
-0.5666431, -1.639383, -0.6934259, 0.2901961, 1, 0, 1,
-0.5663099, -0.422368, -1.839982, 0.282353, 1, 0, 1,
-0.5627555, -1.839792, -2.76324, 0.2784314, 1, 0, 1,
-0.5594882, 0.9862, 1.042425, 0.2705882, 1, 0, 1,
-0.5582714, -1.558426, -1.189693, 0.2666667, 1, 0, 1,
-0.5581248, -0.03846106, -3.297273, 0.2588235, 1, 0, 1,
-0.5570921, -1.568174, -2.41879, 0.254902, 1, 0, 1,
-0.5557564, 0.423793, -1.230274, 0.2470588, 1, 0, 1,
-0.5461801, -1.085912, -4.190056, 0.2431373, 1, 0, 1,
-0.5404882, 1.113771, 0.2068135, 0.2352941, 1, 0, 1,
-0.5387374, -1.412665, -3.131958, 0.2313726, 1, 0, 1,
-0.5371348, 1.707443, -2.221588, 0.2235294, 1, 0, 1,
-0.5317, -0.5264657, -1.845838, 0.2196078, 1, 0, 1,
-0.5278339, 0.8561629, -0.5535838, 0.2117647, 1, 0, 1,
-0.5264893, -0.1737764, -2.475199, 0.2078431, 1, 0, 1,
-0.526441, -1.198512, -3.247123, 0.2, 1, 0, 1,
-0.5196545, 0.9311928, -0.4027748, 0.1921569, 1, 0, 1,
-0.5173803, -0.641556, -1.547447, 0.1882353, 1, 0, 1,
-0.5080063, -0.05959943, -0.9597436, 0.1803922, 1, 0, 1,
-0.5039783, -0.0470595, -3.281576, 0.1764706, 1, 0, 1,
-0.5035398, 1.208983, -1.740391, 0.1686275, 1, 0, 1,
-0.5023903, -0.1406361, -1.981709, 0.1647059, 1, 0, 1,
-0.4998576, -0.06243161, -0.2901949, 0.1568628, 1, 0, 1,
-0.4956968, 1.518289, 0.8975177, 0.1529412, 1, 0, 1,
-0.4951956, -1.045005, -4.062348, 0.145098, 1, 0, 1,
-0.4932919, -0.5766878, -1.861781, 0.1411765, 1, 0, 1,
-0.4917738, 0.0915504, 0.05439966, 0.1333333, 1, 0, 1,
-0.4888949, -0.1338997, -1.754534, 0.1294118, 1, 0, 1,
-0.4837271, 0.486551, -0.7309601, 0.1215686, 1, 0, 1,
-0.4757206, 1.679472, 0.310948, 0.1176471, 1, 0, 1,
-0.4739003, 0.3623926, -0.7586283, 0.1098039, 1, 0, 1,
-0.4707066, -0.8966046, -1.916823, 0.1058824, 1, 0, 1,
-0.4646499, -1.502439, -2.358778, 0.09803922, 1, 0, 1,
-0.4639755, -0.400479, -2.676625, 0.09019608, 1, 0, 1,
-0.4624617, -1.857183, -1.744902, 0.08627451, 1, 0, 1,
-0.4531775, 1.721888, -0.0388034, 0.07843138, 1, 0, 1,
-0.4499839, 0.4180492, -2.054319, 0.07450981, 1, 0, 1,
-0.4498162, -0.7329189, -2.858919, 0.06666667, 1, 0, 1,
-0.4458982, -0.8321996, -1.954349, 0.0627451, 1, 0, 1,
-0.4389382, 1.803122, -1.989146, 0.05490196, 1, 0, 1,
-0.4382817, -0.4085403, -1.66664, 0.05098039, 1, 0, 1,
-0.4375675, 1.971906, -0.9405115, 0.04313726, 1, 0, 1,
-0.4233254, 0.2466282, -1.793252, 0.03921569, 1, 0, 1,
-0.4214846, 1.86827, 0.6373245, 0.03137255, 1, 0, 1,
-0.4208084, -0.7024859, -2.119097, 0.02745098, 1, 0, 1,
-0.4193574, 0.3581407, -1.048231, 0.01960784, 1, 0, 1,
-0.4185549, 0.5851455, 0.7557138, 0.01568628, 1, 0, 1,
-0.418149, -1.128891, -3.031776, 0.007843138, 1, 0, 1,
-0.4178009, 1.117796, -0.04820365, 0.003921569, 1, 0, 1,
-0.414029, -1.174353, -3.485067, 0, 1, 0.003921569, 1,
-0.4136136, 0.3865629, 1.033571, 0, 1, 0.01176471, 1,
-0.404496, 0.003570775, -0.6284204, 0, 1, 0.01568628, 1,
-0.4012851, 0.3203101, -2.481753, 0, 1, 0.02352941, 1,
-0.3979184, 1.068289, -0.2206305, 0, 1, 0.02745098, 1,
-0.3971836, -1.202316, -2.450265, 0, 1, 0.03529412, 1,
-0.3966635, -1.459059, -3.265754, 0, 1, 0.03921569, 1,
-0.3965821, 1.025981, -0.8698447, 0, 1, 0.04705882, 1,
-0.3875628, -1.750735, -4.634572, 0, 1, 0.05098039, 1,
-0.3874544, -2.295137, -2.703015, 0, 1, 0.05882353, 1,
-0.386515, -1.458764, -3.11728, 0, 1, 0.0627451, 1,
-0.3810147, 0.9470646, 1.5368, 0, 1, 0.07058824, 1,
-0.3780475, 1.149577, 1.029506, 0, 1, 0.07450981, 1,
-0.3679803, 0.4580598, -0.01965189, 0, 1, 0.08235294, 1,
-0.3618673, -1.408614, -3.23719, 0, 1, 0.08627451, 1,
-0.3604994, 1.474042, 0.8667181, 0, 1, 0.09411765, 1,
-0.3578632, -0.9487199, -3.443918, 0, 1, 0.1019608, 1,
-0.3576871, -0.97302, -3.890266, 0, 1, 0.1058824, 1,
-0.354947, -1.05704, -0.9373065, 0, 1, 0.1137255, 1,
-0.3459585, 0.1777388, -1.922124, 0, 1, 0.1176471, 1,
-0.345633, -0.2364871, -2.582637, 0, 1, 0.1254902, 1,
-0.3452967, 0.6152309, -1.714121, 0, 1, 0.1294118, 1,
-0.3444012, 0.2804969, -0.8063624, 0, 1, 0.1372549, 1,
-0.3428123, 1.85032, -0.4062743, 0, 1, 0.1411765, 1,
-0.3367549, -0.5731153, -2.414244, 0, 1, 0.1490196, 1,
-0.3361998, 2.096522, -0.5590164, 0, 1, 0.1529412, 1,
-0.3352661, -0.2744111, -0.678696, 0, 1, 0.1607843, 1,
-0.331583, -2.207847, -3.11261, 0, 1, 0.1647059, 1,
-0.3306313, -1.022275, -2.791942, 0, 1, 0.172549, 1,
-0.3287752, 1.69651, 0.6836084, 0, 1, 0.1764706, 1,
-0.3271686, -0.1398475, -2.107021, 0, 1, 0.1843137, 1,
-0.3265273, 1.626571, -0.7006671, 0, 1, 0.1882353, 1,
-0.325941, 0.7245445, -2.464702, 0, 1, 0.1960784, 1,
-0.3248341, -0.7672617, -1.322662, 0, 1, 0.2039216, 1,
-0.3223239, -1.02275, -1.199846, 0, 1, 0.2078431, 1,
-0.3145607, -1.139007, -3.254027, 0, 1, 0.2156863, 1,
-0.312633, -0.4950566, -2.044919, 0, 1, 0.2196078, 1,
-0.3048799, 1.163327, -0.8485758, 0, 1, 0.227451, 1,
-0.3040978, -1.964015, -4.326478, 0, 1, 0.2313726, 1,
-0.2968191, -1.040482, -2.361655, 0, 1, 0.2392157, 1,
-0.2921578, 0.5576258, 0.5067956, 0, 1, 0.2431373, 1,
-0.283752, -0.4483195, -1.462972, 0, 1, 0.2509804, 1,
-0.2832954, 0.7106444, 0.3226167, 0, 1, 0.254902, 1,
-0.2794887, -0.5777054, -2.795044, 0, 1, 0.2627451, 1,
-0.2793142, 0.2391693, -0.531945, 0, 1, 0.2666667, 1,
-0.2781964, 0.5565203, 0.8581281, 0, 1, 0.2745098, 1,
-0.277382, 0.6270657, 0.4223009, 0, 1, 0.2784314, 1,
-0.2773384, -1.018363, -1.74337, 0, 1, 0.2862745, 1,
-0.2771313, -1.36308, -5.117358, 0, 1, 0.2901961, 1,
-0.2770016, -0.9883473, -3.853207, 0, 1, 0.2980392, 1,
-0.2767009, 1.839664, -0.8728878, 0, 1, 0.3058824, 1,
-0.2742956, -0.3054344, -4.178559, 0, 1, 0.3098039, 1,
-0.2710229, -0.4018341, -1.886771, 0, 1, 0.3176471, 1,
-0.2674631, -1.318532, -3.8412, 0, 1, 0.3215686, 1,
-0.2660224, -0.1818243, -3.109389, 0, 1, 0.3294118, 1,
-0.2650754, 0.0001544716, -1.435521, 0, 1, 0.3333333, 1,
-0.2587184, -0.1485958, -1.930516, 0, 1, 0.3411765, 1,
-0.2568509, -1.422533, -2.224929, 0, 1, 0.345098, 1,
-0.2563168, -1.394452, -3.691719, 0, 1, 0.3529412, 1,
-0.2476881, 1.350532, 0.8935558, 0, 1, 0.3568628, 1,
-0.2402243, 0.3222783, -0.8170246, 0, 1, 0.3647059, 1,
-0.2344316, -0.3795754, -1.784464, 0, 1, 0.3686275, 1,
-0.2288166, 0.4842913, 0.3658596, 0, 1, 0.3764706, 1,
-0.2285339, 1.592495, -0.6445004, 0, 1, 0.3803922, 1,
-0.2204442, 1.023209, -0.6793457, 0, 1, 0.3882353, 1,
-0.2202393, -0.6661589, -3.609185, 0, 1, 0.3921569, 1,
-0.21707, -1.511116, -2.280753, 0, 1, 0.4, 1,
-0.2139097, -1.201527, -3.60538, 0, 1, 0.4078431, 1,
-0.2129759, 0.3578071, -1.442947, 0, 1, 0.4117647, 1,
-0.2108629, 0.9118439, -0.2242115, 0, 1, 0.4196078, 1,
-0.2080178, 0.7075319, -0.7258599, 0, 1, 0.4235294, 1,
-0.2079106, -0.3940822, -2.181531, 0, 1, 0.4313726, 1,
-0.2077004, -0.2817714, -2.999768, 0, 1, 0.4352941, 1,
-0.2075564, 0.4773761, 0.4016935, 0, 1, 0.4431373, 1,
-0.2061543, -0.8525784, -3.5843, 0, 1, 0.4470588, 1,
-0.2052868, 1.593824, -0.4194323, 0, 1, 0.454902, 1,
-0.2038745, -0.4204074, -2.962293, 0, 1, 0.4588235, 1,
-0.2025606, 1.886406, 0.9046609, 0, 1, 0.4666667, 1,
-0.2023508, 0.3340257, 0.4599179, 0, 1, 0.4705882, 1,
-0.2005701, -0.5739424, -2.226104, 0, 1, 0.4784314, 1,
-0.2004271, -0.08525233, -3.851774, 0, 1, 0.4823529, 1,
-0.200252, -0.1940004, -1.238477, 0, 1, 0.4901961, 1,
-0.1957767, 1.426442, 0.03240531, 0, 1, 0.4941176, 1,
-0.1929493, -1.330037, -2.76491, 0, 1, 0.5019608, 1,
-0.1838786, 0.5543027, -0.3857334, 0, 1, 0.509804, 1,
-0.1806262, 0.251164, 0.02127312, 0, 1, 0.5137255, 1,
-0.1788784, -0.1988157, -1.979066, 0, 1, 0.5215687, 1,
-0.1737095, 0.0316629, -1.100277, 0, 1, 0.5254902, 1,
-0.170046, 0.7088263, -0.8324157, 0, 1, 0.5333334, 1,
-0.168807, 0.6080837, -0.3961534, 0, 1, 0.5372549, 1,
-0.166835, 0.183774, -2.434396, 0, 1, 0.5450981, 1,
-0.1661277, -0.06070089, -2.49625, 0, 1, 0.5490196, 1,
-0.1653238, 0.7238152, -1.501173, 0, 1, 0.5568628, 1,
-0.1620149, -0.7369079, -2.008648, 0, 1, 0.5607843, 1,
-0.1611525, -1.575806, -1.500566, 0, 1, 0.5686275, 1,
-0.1593633, -0.8907086, -1.720707, 0, 1, 0.572549, 1,
-0.1591398, -1.159221, -3.657903, 0, 1, 0.5803922, 1,
-0.15784, -1.08178, -1.984985, 0, 1, 0.5843138, 1,
-0.1527332, 1.396615, -1.64466, 0, 1, 0.5921569, 1,
-0.1485594, 0.9462067, -0.8434048, 0, 1, 0.5960785, 1,
-0.1484632, 0.3472046, -0.5450916, 0, 1, 0.6039216, 1,
-0.1469706, 0.177731, -1.10407, 0, 1, 0.6117647, 1,
-0.1437636, 0.7340044, 0.3004972, 0, 1, 0.6156863, 1,
-0.13784, -0.1379427, -3.010926, 0, 1, 0.6235294, 1,
-0.1368551, -1.109419, -4.010126, 0, 1, 0.627451, 1,
-0.1321933, 0.3777254, 0.2854687, 0, 1, 0.6352941, 1,
-0.1321471, -1.867861, -3.75573, 0, 1, 0.6392157, 1,
-0.1291696, -0.777167, -3.957778, 0, 1, 0.6470588, 1,
-0.1280849, 0.697075, -0.495558, 0, 1, 0.6509804, 1,
-0.1222656, -1.434896, -1.068687, 0, 1, 0.6588235, 1,
-0.1163724, -1.459548, -2.206976, 0, 1, 0.6627451, 1,
-0.1150697, -0.2783956, -3.030827, 0, 1, 0.6705883, 1,
-0.114743, 0.7426239, -0.6108056, 0, 1, 0.6745098, 1,
-0.1144821, 0.5040144, -1.867091, 0, 1, 0.682353, 1,
-0.1083182, 0.5597069, 0.8165265, 0, 1, 0.6862745, 1,
-0.103784, 0.6184884, -0.9553944, 0, 1, 0.6941177, 1,
-0.08692946, 0.3132761, 0.8904551, 0, 1, 0.7019608, 1,
-0.08269564, 0.7470894, 0.8190223, 0, 1, 0.7058824, 1,
-0.07970487, -0.5621549, -4.083748, 0, 1, 0.7137255, 1,
-0.07893453, -0.2366623, -1.23833, 0, 1, 0.7176471, 1,
-0.07855844, -0.6768702, -3.51959, 0, 1, 0.7254902, 1,
-0.07801906, 2.202332, -1.958492, 0, 1, 0.7294118, 1,
-0.0765368, 0.1664644, -0.5699372, 0, 1, 0.7372549, 1,
-0.07594019, 1.408503, -1.043543, 0, 1, 0.7411765, 1,
-0.0698309, 1.131391, -2.341839, 0, 1, 0.7490196, 1,
-0.06701043, -1.921056, -2.19588, 0, 1, 0.7529412, 1,
-0.06457973, -0.7128306, -3.136739, 0, 1, 0.7607843, 1,
-0.0645751, 0.2392312, -1.486796, 0, 1, 0.7647059, 1,
-0.05748041, 0.3874671, 0.1170997, 0, 1, 0.772549, 1,
-0.05339695, -0.06447878, -3.915493, 0, 1, 0.7764706, 1,
-0.04285249, 1.579738, 0.1797347, 0, 1, 0.7843137, 1,
-0.04127062, 1.319686, -0.6033466, 0, 1, 0.7882353, 1,
-0.04052943, -0.9216607, -4.35489, 0, 1, 0.7960784, 1,
-0.03979791, 0.3114918, 0.6614581, 0, 1, 0.8039216, 1,
-0.03627018, -0.503276, -2.162728, 0, 1, 0.8078431, 1,
-0.03445646, 0.3692751, -0.4846546, 0, 1, 0.8156863, 1,
-0.03400229, 1.432256, -0.6625746, 0, 1, 0.8196079, 1,
-0.03372239, 0.7522175, -0.408754, 0, 1, 0.827451, 1,
-0.03327968, -2.150747, -4.172182, 0, 1, 0.8313726, 1,
-0.02730173, 0.5432857, -0.07889935, 0, 1, 0.8392157, 1,
-0.02320823, 1.410253, 0.4819849, 0, 1, 0.8431373, 1,
-0.02077856, 0.3121885, 0.1716939, 0, 1, 0.8509804, 1,
-0.01975193, -1.412893, -1.584051, 0, 1, 0.854902, 1,
-0.01968853, 0.2895792, -1.320059, 0, 1, 0.8627451, 1,
-0.01932978, 1.20928, -0.4998054, 0, 1, 0.8666667, 1,
-0.01874935, 1.964567, -0.1226698, 0, 1, 0.8745098, 1,
-0.01534639, 0.6442553, -0.1080207, 0, 1, 0.8784314, 1,
-0.0129959, 1.352983, -1.879201, 0, 1, 0.8862745, 1,
-0.01271443, -1.53346, -4.958219, 0, 1, 0.8901961, 1,
-0.007960924, -1.211979, -1.072791, 0, 1, 0.8980392, 1,
-0.005871568, -1.459987, -3.334799, 0, 1, 0.9058824, 1,
-0.002959938, 1.454983, 1.095511, 0, 1, 0.9098039, 1,
-0.0007134235, -0.2401888, -3.103631, 0, 1, 0.9176471, 1,
-0.0001922184, -0.5526128, -2.542781, 0, 1, 0.9215686, 1,
0.002658787, -0.4512044, 2.919344, 0, 1, 0.9294118, 1,
0.01013242, -0.6299218, 2.795463, 0, 1, 0.9333333, 1,
0.01031317, -0.7885819, 2.904243, 0, 1, 0.9411765, 1,
0.01431628, -1.083686, 3.155732, 0, 1, 0.945098, 1,
0.01466357, 1.565502, -0.4600766, 0, 1, 0.9529412, 1,
0.01657599, -0.4007269, 3.542527, 0, 1, 0.9568627, 1,
0.01839338, -0.5291378, 3.439732, 0, 1, 0.9647059, 1,
0.01977348, 0.6263783, -0.8233311, 0, 1, 0.9686275, 1,
0.02012588, 1.112995, -1.248816, 0, 1, 0.9764706, 1,
0.02334678, -0.7854485, 4.789406, 0, 1, 0.9803922, 1,
0.02523534, 0.1574782, -1.181318, 0, 1, 0.9882353, 1,
0.02529246, 1.604322, 0.3392422, 0, 1, 0.9921569, 1,
0.02675029, -0.1348323, 2.954354, 0, 1, 1, 1,
0.02858327, 0.8652586, 1.589049, 0, 0.9921569, 1, 1,
0.03267846, 0.4187823, 1.565874, 0, 0.9882353, 1, 1,
0.03460671, 2.511389, 0.4605316, 0, 0.9803922, 1, 1,
0.0390863, -0.8372135, 3.731261, 0, 0.9764706, 1, 1,
0.04200925, 0.09889074, 0.5606486, 0, 0.9686275, 1, 1,
0.04252116, -0.6659263, 3.227444, 0, 0.9647059, 1, 1,
0.04886273, 1.864777, -0.04500858, 0, 0.9568627, 1, 1,
0.05137365, -0.1627496, 2.254982, 0, 0.9529412, 1, 1,
0.05705712, -1.125278, 4.217774, 0, 0.945098, 1, 1,
0.05821694, 0.1264696, 1.141812, 0, 0.9411765, 1, 1,
0.06091831, -0.2003764, 3.724729, 0, 0.9333333, 1, 1,
0.06135187, 0.2084223, 1.703622, 0, 0.9294118, 1, 1,
0.06149187, -1.610898, 4.296467, 0, 0.9215686, 1, 1,
0.06260718, -0.5258719, 2.703331, 0, 0.9176471, 1, 1,
0.06321029, 0.8010593, -1.45022, 0, 0.9098039, 1, 1,
0.06798824, -1.213157, 1.851715, 0, 0.9058824, 1, 1,
0.06802133, -0.02957429, 4.584655, 0, 0.8980392, 1, 1,
0.07285938, 0.6427075, -0.2245996, 0, 0.8901961, 1, 1,
0.07679535, -0.8185017, 4.909773, 0, 0.8862745, 1, 1,
0.0780631, 0.4163061, -0.9993392, 0, 0.8784314, 1, 1,
0.07960254, -1.421764, 3.634305, 0, 0.8745098, 1, 1,
0.0813796, -0.02943246, 3.574009, 0, 0.8666667, 1, 1,
0.08195528, -0.6103103, 0.502103, 0, 0.8627451, 1, 1,
0.09243903, 1.411348, -1.158468, 0, 0.854902, 1, 1,
0.0938127, 0.02074997, 0.9020888, 0, 0.8509804, 1, 1,
0.0957905, 0.4835679, -0.4672827, 0, 0.8431373, 1, 1,
0.09921056, -1.620868, 3.368254, 0, 0.8392157, 1, 1,
0.1018057, -1.0161, 3.14793, 0, 0.8313726, 1, 1,
0.1033139, 0.9473048, -0.4739717, 0, 0.827451, 1, 1,
0.1035065, 0.3750469, 0.7496305, 0, 0.8196079, 1, 1,
0.1072876, -0.0193418, 2.619433, 0, 0.8156863, 1, 1,
0.1084079, -0.9566074, 4.40088, 0, 0.8078431, 1, 1,
0.1086654, -0.1108074, 1.967335, 0, 0.8039216, 1, 1,
0.1089685, 2.158179, -1.41651, 0, 0.7960784, 1, 1,
0.1089813, 0.2832582, 0.7487786, 0, 0.7882353, 1, 1,
0.1142566, -0.8547544, 1.141052, 0, 0.7843137, 1, 1,
0.118352, -0.221552, 1.139048, 0, 0.7764706, 1, 1,
0.1207899, -0.6725493, 4.250451, 0, 0.772549, 1, 1,
0.1216212, 0.8705359, 0.1905099, 0, 0.7647059, 1, 1,
0.1230035, -0.4223747, 3.985478, 0, 0.7607843, 1, 1,
0.1262412, -1.095474, 2.07685, 0, 0.7529412, 1, 1,
0.1269188, -0.5989544, 1.753779, 0, 0.7490196, 1, 1,
0.132182, 1.003024, -0.1209728, 0, 0.7411765, 1, 1,
0.1346689, 0.670506, 1.17257, 0, 0.7372549, 1, 1,
0.1355129, 1.29217, -0.3451521, 0, 0.7294118, 1, 1,
0.1372129, -0.7015333, 2.1782, 0, 0.7254902, 1, 1,
0.1381134, -0.1779997, 3.711358, 0, 0.7176471, 1, 1,
0.1433358, 0.5285942, 0.5712334, 0, 0.7137255, 1, 1,
0.1434388, 1.468181, 0.4083315, 0, 0.7058824, 1, 1,
0.1456295, -0.07634126, 3.47356, 0, 0.6980392, 1, 1,
0.1485391, -0.06150136, 1.451916, 0, 0.6941177, 1, 1,
0.1492847, -0.4023085, 2.739141, 0, 0.6862745, 1, 1,
0.1501875, 0.1028578, -0.1021246, 0, 0.682353, 1, 1,
0.1526372, -0.5013952, 3.413807, 0, 0.6745098, 1, 1,
0.1527629, -0.8564465, 3.151399, 0, 0.6705883, 1, 1,
0.1535251, -2.040325, 4.889159, 0, 0.6627451, 1, 1,
0.1545199, -0.2388405, 1.336463, 0, 0.6588235, 1, 1,
0.1609835, 0.1227917, 1.280984, 0, 0.6509804, 1, 1,
0.1641574, -0.2329521, 1.732104, 0, 0.6470588, 1, 1,
0.1663353, -1.890594, 2.880715, 0, 0.6392157, 1, 1,
0.1673116, -0.5522342, 1.549412, 0, 0.6352941, 1, 1,
0.174041, 0.05414852, 1.030943, 0, 0.627451, 1, 1,
0.1753718, 0.2797584, -0.5207021, 0, 0.6235294, 1, 1,
0.1777237, -0.141661, 4.597293, 0, 0.6156863, 1, 1,
0.1779075, 0.6017808, -0.7423187, 0, 0.6117647, 1, 1,
0.1788158, -0.2568023, 3.526861, 0, 0.6039216, 1, 1,
0.1807653, 0.4723499, -0.5330723, 0, 0.5960785, 1, 1,
0.1823509, -0.8357517, 3.245575, 0, 0.5921569, 1, 1,
0.1897194, 1.729578, -0.05693336, 0, 0.5843138, 1, 1,
0.192886, -0.5453166, 1.571159, 0, 0.5803922, 1, 1,
0.1996424, 1.164036, 1.363706, 0, 0.572549, 1, 1,
0.2048398, 2.067772, 0.04324246, 0, 0.5686275, 1, 1,
0.2114092, 1.167925, -1.030438, 0, 0.5607843, 1, 1,
0.2130487, 0.9250935, -0.3749988, 0, 0.5568628, 1, 1,
0.2139795, 0.7823294, -0.8252941, 0, 0.5490196, 1, 1,
0.2141151, -0.4752962, 3.760482, 0, 0.5450981, 1, 1,
0.2153505, -0.7326667, 1.744737, 0, 0.5372549, 1, 1,
0.2166258, 0.2287004, 0.631504, 0, 0.5333334, 1, 1,
0.2225937, 0.09296443, 1.776748, 0, 0.5254902, 1, 1,
0.2226512, 1.138775, 2.021021, 0, 0.5215687, 1, 1,
0.2231457, 0.7574253, 1.273108, 0, 0.5137255, 1, 1,
0.2344584, -0.223122, 0.820093, 0, 0.509804, 1, 1,
0.2365355, -0.1341108, 2.405194, 0, 0.5019608, 1, 1,
0.2378134, 1.228966, -0.2400824, 0, 0.4941176, 1, 1,
0.2404462, 0.4637628, 1.571205, 0, 0.4901961, 1, 1,
0.243941, -0.6441258, 2.044919, 0, 0.4823529, 1, 1,
0.2448894, 0.2261648, 1.59588, 0, 0.4784314, 1, 1,
0.2471727, 0.9402081, -0.5981504, 0, 0.4705882, 1, 1,
0.2522304, 0.06978831, 0.1932952, 0, 0.4666667, 1, 1,
0.2535048, -0.6590201, 2.008568, 0, 0.4588235, 1, 1,
0.2597117, 0.7115099, -0.768395, 0, 0.454902, 1, 1,
0.260326, 0.4574777, 1.023986, 0, 0.4470588, 1, 1,
0.2665319, 0.5559546, -0.5277088, 0, 0.4431373, 1, 1,
0.2709497, -1.432322, 3.00509, 0, 0.4352941, 1, 1,
0.2718215, -0.421214, 2.041501, 0, 0.4313726, 1, 1,
0.2724638, -1.045627, 1.864073, 0, 0.4235294, 1, 1,
0.2742795, -1.95632, 3.356146, 0, 0.4196078, 1, 1,
0.2765206, 0.6660306, 0.7641001, 0, 0.4117647, 1, 1,
0.278351, 1.921108, -0.08108263, 0, 0.4078431, 1, 1,
0.2858272, 0.04549149, 1.987726, 0, 0.4, 1, 1,
0.2939572, 1.138245, 0.9079682, 0, 0.3921569, 1, 1,
0.2972516, -0.3147055, 2.02076, 0, 0.3882353, 1, 1,
0.3013893, 1.429104, -0.6974049, 0, 0.3803922, 1, 1,
0.30719, -0.4613028, 1.046912, 0, 0.3764706, 1, 1,
0.3095449, -2.00776, 2.45565, 0, 0.3686275, 1, 1,
0.3112821, 0.55612, 0.7267774, 0, 0.3647059, 1, 1,
0.3116987, -0.232756, 2.021846, 0, 0.3568628, 1, 1,
0.3161738, 0.08904026, 1.965672, 0, 0.3529412, 1, 1,
0.3204116, 0.726336, 0.1275789, 0, 0.345098, 1, 1,
0.3205182, -2.189, 1.973455, 0, 0.3411765, 1, 1,
0.3230206, 0.4108814, 0.8225442, 0, 0.3333333, 1, 1,
0.3255379, 1.97869, 0.8426782, 0, 0.3294118, 1, 1,
0.3298803, -0.7486573, 4.052191, 0, 0.3215686, 1, 1,
0.3306047, 0.7891158, 0.9511545, 0, 0.3176471, 1, 1,
0.3323668, -0.1880006, 3.137981, 0, 0.3098039, 1, 1,
0.3330387, 1.405136, -1.290848, 0, 0.3058824, 1, 1,
0.3357647, -1.237189, 2.83911, 0, 0.2980392, 1, 1,
0.3391739, 0.7143341, 0.1418375, 0, 0.2901961, 1, 1,
0.3453606, -1.810553, 1.642049, 0, 0.2862745, 1, 1,
0.3491641, -0.1382965, 3.168058, 0, 0.2784314, 1, 1,
0.349985, 0.7927688, 0.6434346, 0, 0.2745098, 1, 1,
0.3508633, -1.364577, 2.649826, 0, 0.2666667, 1, 1,
0.3510064, -0.2098173, 2.206159, 0, 0.2627451, 1, 1,
0.3553577, 0.6736569, 0.3252298, 0, 0.254902, 1, 1,
0.3562527, 0.2459841, 2.065001, 0, 0.2509804, 1, 1,
0.3615201, 0.2782725, 1.354493, 0, 0.2431373, 1, 1,
0.3629565, 1.002348, 1.019809, 0, 0.2392157, 1, 1,
0.3642993, 0.5523275, 1.534897, 0, 0.2313726, 1, 1,
0.3651742, -0.3974773, 0.2169247, 0, 0.227451, 1, 1,
0.3665254, 0.2461274, 0.104289, 0, 0.2196078, 1, 1,
0.3679275, 1.401406, 0.4977911, 0, 0.2156863, 1, 1,
0.3731501, 0.3648973, 2.031988, 0, 0.2078431, 1, 1,
0.3743377, -1.118703, 3.229813, 0, 0.2039216, 1, 1,
0.3748307, -0.09799647, 1.975186, 0, 0.1960784, 1, 1,
0.377694, -0.5270967, 3.107719, 0, 0.1882353, 1, 1,
0.3801518, -1.076706, 0.6875452, 0, 0.1843137, 1, 1,
0.3828631, -1.325475, 3.227511, 0, 0.1764706, 1, 1,
0.3851078, 0.02186018, -0.66409, 0, 0.172549, 1, 1,
0.3881021, -1.216308, 2.998148, 0, 0.1647059, 1, 1,
0.3899556, 1.93409, -0.04149388, 0, 0.1607843, 1, 1,
0.3921254, 1.260928, -3.040744, 0, 0.1529412, 1, 1,
0.393066, 1.020849, -0.529999, 0, 0.1490196, 1, 1,
0.395087, 0.1349313, 0.8428237, 0, 0.1411765, 1, 1,
0.397637, 1.345571, 0.3405989, 0, 0.1372549, 1, 1,
0.4044859, -0.6689273, 1.569601, 0, 0.1294118, 1, 1,
0.4049417, -0.191103, 3.253926, 0, 0.1254902, 1, 1,
0.4066794, 0.4473241, 1.385608, 0, 0.1176471, 1, 1,
0.4096765, 0.000100714, 0.4938977, 0, 0.1137255, 1, 1,
0.410072, -1.027258, 2.967635, 0, 0.1058824, 1, 1,
0.4135973, -0.06675547, 2.035035, 0, 0.09803922, 1, 1,
0.4151024, 0.8457137, 1.856812, 0, 0.09411765, 1, 1,
0.4207245, -0.6665231, 3.145303, 0, 0.08627451, 1, 1,
0.4209727, -0.8521094, 2.408148, 0, 0.08235294, 1, 1,
0.4234935, -0.6576055, 2.187107, 0, 0.07450981, 1, 1,
0.4251238, -0.7515543, 1.90701, 0, 0.07058824, 1, 1,
0.4261885, 0.3309382, 1.873993, 0, 0.0627451, 1, 1,
0.426897, -0.2249144, 2.928828, 0, 0.05882353, 1, 1,
0.4316778, -0.2887726, 2.274681, 0, 0.05098039, 1, 1,
0.4323291, 0.1385118, 1.041315, 0, 0.04705882, 1, 1,
0.4346686, -1.276062, 3.415407, 0, 0.03921569, 1, 1,
0.4356768, 0.02420334, 1.777137, 0, 0.03529412, 1, 1,
0.4388311, -1.368093, 2.298332, 0, 0.02745098, 1, 1,
0.4405169, -0.9325195, 2.295229, 0, 0.02352941, 1, 1,
0.4413953, -0.08467831, 0.7564093, 0, 0.01568628, 1, 1,
0.4419695, -0.6727636, 3.094513, 0, 0.01176471, 1, 1,
0.4456379, 1.213536, -1.022595, 0, 0.003921569, 1, 1,
0.4461416, -0.1315316, 0.5598952, 0.003921569, 0, 1, 1,
0.4496554, 1.770284, 0.3934101, 0.007843138, 0, 1, 1,
0.4523118, 1.050083, 0.07449436, 0.01568628, 0, 1, 1,
0.4560022, -2.523373, 1.691703, 0.01960784, 0, 1, 1,
0.4610622, -1.907171, 1.925771, 0.02745098, 0, 1, 1,
0.4638327, 0.5544587, 0.3073327, 0.03137255, 0, 1, 1,
0.4661335, 1.007852, 0.8178285, 0.03921569, 0, 1, 1,
0.4678468, -0.4950679, 2.404657, 0.04313726, 0, 1, 1,
0.4742688, -0.6033639, 1.445478, 0.05098039, 0, 1, 1,
0.4811331, 1.314139, -0.2446114, 0.05490196, 0, 1, 1,
0.4813119, 0.2967235, 0.5673473, 0.0627451, 0, 1, 1,
0.4814762, -0.2937682, 2.859603, 0.06666667, 0, 1, 1,
0.4818593, 0.7848172, 0.1902734, 0.07450981, 0, 1, 1,
0.48693, -0.1421427, 2.107666, 0.07843138, 0, 1, 1,
0.4872451, 2.025719, 0.4301634, 0.08627451, 0, 1, 1,
0.4923809, 0.3951965, 0.01937906, 0.09019608, 0, 1, 1,
0.4930836, 0.6720843, 1.416961, 0.09803922, 0, 1, 1,
0.4950182, 1.356487, 1.461171, 0.1058824, 0, 1, 1,
0.4968519, -1.062145, 2.783247, 0.1098039, 0, 1, 1,
0.4969367, -0.4869025, 4.850586, 0.1176471, 0, 1, 1,
0.505662, 0.3260453, 1.767966, 0.1215686, 0, 1, 1,
0.5084965, -0.3668362, 1.834206, 0.1294118, 0, 1, 1,
0.5134003, -0.2906586, 0.8776571, 0.1333333, 0, 1, 1,
0.51557, -0.4330617, 1.086352, 0.1411765, 0, 1, 1,
0.5195313, -1.669546, 2.43963, 0.145098, 0, 1, 1,
0.5196732, -1.371854, 3.695663, 0.1529412, 0, 1, 1,
0.5245004, 0.7766128, 0.999738, 0.1568628, 0, 1, 1,
0.5277779, 0.499678, 0.7910644, 0.1647059, 0, 1, 1,
0.5278939, -2.414369, 3.132639, 0.1686275, 0, 1, 1,
0.5292314, -0.6228296, 1.758452, 0.1764706, 0, 1, 1,
0.5293218, -0.1587077, 1.982084, 0.1803922, 0, 1, 1,
0.5353549, -0.1596067, 4.510844, 0.1882353, 0, 1, 1,
0.5371268, 0.4151328, 1.457556, 0.1921569, 0, 1, 1,
0.5376765, 1.581856, 1.661406, 0.2, 0, 1, 1,
0.5394508, 1.37904, -0.3912649, 0.2078431, 0, 1, 1,
0.5426669, -0.4444826, 2.118744, 0.2117647, 0, 1, 1,
0.5525586, 1.119682, 0.1923998, 0.2196078, 0, 1, 1,
0.5527654, -0.9713429, 4.08772, 0.2235294, 0, 1, 1,
0.5529614, -1.447119, 3.11278, 0.2313726, 0, 1, 1,
0.5540898, -1.396218, 3.349437, 0.2352941, 0, 1, 1,
0.5550792, -1.396721, 2.966468, 0.2431373, 0, 1, 1,
0.5556738, -0.7174911, 1.731927, 0.2470588, 0, 1, 1,
0.5619068, 0.1073444, 2.245739, 0.254902, 0, 1, 1,
0.5639387, 1.984831, 0.1639329, 0.2588235, 0, 1, 1,
0.5672367, 0.1796257, 2.831261, 0.2666667, 0, 1, 1,
0.5697196, 0.5715303, 1.42704, 0.2705882, 0, 1, 1,
0.5740612, -1.026917, 2.457626, 0.2784314, 0, 1, 1,
0.5751212, 0.009515462, 0.05244718, 0.282353, 0, 1, 1,
0.5764886, -0.6161886, 1.928368, 0.2901961, 0, 1, 1,
0.577216, 0.1410783, 1.623066, 0.2941177, 0, 1, 1,
0.5786009, 0.5273116, 0.7146121, 0.3019608, 0, 1, 1,
0.5791679, -0.6057065, 1.268236, 0.3098039, 0, 1, 1,
0.5815241, 1.437554, 0.7063931, 0.3137255, 0, 1, 1,
0.5819429, 0.2015426, 0.04841723, 0.3215686, 0, 1, 1,
0.5825487, 0.1076257, 0.6386862, 0.3254902, 0, 1, 1,
0.5851647, -0.2414382, 2.202836, 0.3333333, 0, 1, 1,
0.5899032, 0.3677151, 1.279722, 0.3372549, 0, 1, 1,
0.5940989, 0.0729396, 1.775651, 0.345098, 0, 1, 1,
0.5963439, 1.636179, 0.5391529, 0.3490196, 0, 1, 1,
0.5995149, -0.4941491, 1.537573, 0.3568628, 0, 1, 1,
0.5999773, -0.9571647, 3.20978, 0.3607843, 0, 1, 1,
0.6002954, 0.07993546, 1.632939, 0.3686275, 0, 1, 1,
0.6031067, -0.3199864, 3.550172, 0.372549, 0, 1, 1,
0.6051636, -0.2692098, 1.805419, 0.3803922, 0, 1, 1,
0.6051905, -0.0733835, 1.2987, 0.3843137, 0, 1, 1,
0.607189, 1.553431, 0.7215404, 0.3921569, 0, 1, 1,
0.6103716, -1.53614, 1.645527, 0.3960784, 0, 1, 1,
0.6131975, 1.138575, -0.2081068, 0.4039216, 0, 1, 1,
0.6143512, -1.201868, 4.483317, 0.4117647, 0, 1, 1,
0.6206661, 0.8054778, 0.05694823, 0.4156863, 0, 1, 1,
0.6261448, 1.044461, -0.1541916, 0.4235294, 0, 1, 1,
0.6338933, -1.478957, 2.694583, 0.427451, 0, 1, 1,
0.6362949, 1.274174, 1.309199, 0.4352941, 0, 1, 1,
0.6374597, 0.7646994, 0.7469825, 0.4392157, 0, 1, 1,
0.6377905, 1.33717, 2.185223, 0.4470588, 0, 1, 1,
0.6483793, 1.795798, 1.397558, 0.4509804, 0, 1, 1,
0.6486493, -2.116191, 2.582736, 0.4588235, 0, 1, 1,
0.6508629, 0.4246469, 0.7247636, 0.4627451, 0, 1, 1,
0.6546143, -0.09060018, 0.8359217, 0.4705882, 0, 1, 1,
0.6594471, 0.6326911, 0.7968682, 0.4745098, 0, 1, 1,
0.6599144, -0.6132494, 1.237244, 0.4823529, 0, 1, 1,
0.6609907, 0.7870985, 0.1171179, 0.4862745, 0, 1, 1,
0.6629803, -0.6295031, 2.621252, 0.4941176, 0, 1, 1,
0.6747328, 0.2874913, 0.03173762, 0.5019608, 0, 1, 1,
0.6757633, 1.28438, -0.2026017, 0.5058824, 0, 1, 1,
0.6771595, -0.9722145, 2.207882, 0.5137255, 0, 1, 1,
0.6785907, -0.1558741, 2.097119, 0.5176471, 0, 1, 1,
0.6798553, 1.092136, 0.2620939, 0.5254902, 0, 1, 1,
0.6802838, 1.329205, 1.481703, 0.5294118, 0, 1, 1,
0.680299, 0.8466212, 0.2063037, 0.5372549, 0, 1, 1,
0.6834722, 0.7037358, 0.7812835, 0.5411765, 0, 1, 1,
0.6884718, -0.4811358, 2.457716, 0.5490196, 0, 1, 1,
0.689695, -0.3004031, 2.39763, 0.5529412, 0, 1, 1,
0.6924309, -0.8533182, 3.53117, 0.5607843, 0, 1, 1,
0.698174, -2.017971, 1.944167, 0.5647059, 0, 1, 1,
0.7071046, 0.1554322, 1.538991, 0.572549, 0, 1, 1,
0.708104, -0.2328907, 0.4569358, 0.5764706, 0, 1, 1,
0.7095166, -0.02370179, 2.091967, 0.5843138, 0, 1, 1,
0.7098328, -0.03802058, 2.556719, 0.5882353, 0, 1, 1,
0.710626, 1.008172, -0.6207742, 0.5960785, 0, 1, 1,
0.7118168, -0.02036597, 0.6912918, 0.6039216, 0, 1, 1,
0.7123184, -1.863387, 3.125238, 0.6078432, 0, 1, 1,
0.7163567, 1.201083, 0.6823652, 0.6156863, 0, 1, 1,
0.7181839, 0.7262539, 2.007298, 0.6196079, 0, 1, 1,
0.7199702, 0.2143447, 2.226887, 0.627451, 0, 1, 1,
0.7213495, 0.5289583, 2.545038, 0.6313726, 0, 1, 1,
0.7216772, -1.121889, 2.023514, 0.6392157, 0, 1, 1,
0.7218568, -0.8391788, 1.415786, 0.6431373, 0, 1, 1,
0.7221093, -0.4025916, 1.683603, 0.6509804, 0, 1, 1,
0.7225605, -1.494104, 3.372744, 0.654902, 0, 1, 1,
0.725665, 0.8613034, 0.8944508, 0.6627451, 0, 1, 1,
0.7257102, 1.041085, 0.3619624, 0.6666667, 0, 1, 1,
0.7296031, 0.2827739, 1.086509, 0.6745098, 0, 1, 1,
0.7298738, -1.681981, 3.397326, 0.6784314, 0, 1, 1,
0.7326322, 0.7347091, 1.363453, 0.6862745, 0, 1, 1,
0.7332116, -0.1568491, 2.06322, 0.6901961, 0, 1, 1,
0.7335303, 0.148401, 1.819664, 0.6980392, 0, 1, 1,
0.7339703, -0.3943573, 1.947826, 0.7058824, 0, 1, 1,
0.7358514, -0.6515826, 1.003116, 0.7098039, 0, 1, 1,
0.7405745, 0.5926476, -0.1459595, 0.7176471, 0, 1, 1,
0.7454208, -2.066168, 1.025082, 0.7215686, 0, 1, 1,
0.7464074, -0.8662195, 1.797489, 0.7294118, 0, 1, 1,
0.747176, -0.5872181, 0.9000663, 0.7333333, 0, 1, 1,
0.7513612, -0.6228434, 4.29254, 0.7411765, 0, 1, 1,
0.7560208, 0.7910624, 2.326555, 0.7450981, 0, 1, 1,
0.7575845, -1.298033, 1.647508, 0.7529412, 0, 1, 1,
0.7630721, -0.7883691, 0.581647, 0.7568628, 0, 1, 1,
0.7670124, 0.2731008, 2.090453, 0.7647059, 0, 1, 1,
0.7671267, 0.3199462, 0.7294474, 0.7686275, 0, 1, 1,
0.769407, 0.7118615, 0.1387215, 0.7764706, 0, 1, 1,
0.7729624, 0.4129082, 2.016854, 0.7803922, 0, 1, 1,
0.7734134, -1.586281, 1.743339, 0.7882353, 0, 1, 1,
0.775139, -0.2333271, 1.878936, 0.7921569, 0, 1, 1,
0.7828694, -0.8543324, 3.849198, 0.8, 0, 1, 1,
0.7899312, -0.9868608, 2.987332, 0.8078431, 0, 1, 1,
0.7926275, -0.5656653, 3.855487, 0.8117647, 0, 1, 1,
0.7947155, -0.9141495, 1.81395, 0.8196079, 0, 1, 1,
0.797308, 0.1626069, 1.447418, 0.8235294, 0, 1, 1,
0.7984437, 1.123706, 0.2026498, 0.8313726, 0, 1, 1,
0.8057137, 0.2142471, -1.092276, 0.8352941, 0, 1, 1,
0.8154251, -0.2357511, 2.22522, 0.8431373, 0, 1, 1,
0.8183376, 0.5575014, 1.059228, 0.8470588, 0, 1, 1,
0.8198316, 1.068637, 0.4802319, 0.854902, 0, 1, 1,
0.8221406, -0.4485984, 0.3528756, 0.8588235, 0, 1, 1,
0.8230045, 0.9310592, 0.04533581, 0.8666667, 0, 1, 1,
0.8245484, 0.09866167, 1.761296, 0.8705882, 0, 1, 1,
0.8308238, -1.282304, 3.092814, 0.8784314, 0, 1, 1,
0.8325762, -0.4877846, 2.791662, 0.8823529, 0, 1, 1,
0.8391066, 1.024984, -0.379514, 0.8901961, 0, 1, 1,
0.8407841, 1.491934, -0.4767642, 0.8941177, 0, 1, 1,
0.8458741, 0.07814706, 0.5873327, 0.9019608, 0, 1, 1,
0.8513343, 0.3678335, 1.486467, 0.9098039, 0, 1, 1,
0.8563033, 1.130753, 0.2276846, 0.9137255, 0, 1, 1,
0.8619685, -0.2955229, 2.673586, 0.9215686, 0, 1, 1,
0.8653283, 1.24388, -0.03997495, 0.9254902, 0, 1, 1,
0.8666095, 2.317359, 2.243597, 0.9333333, 0, 1, 1,
0.8675026, -0.8134765, 1.349269, 0.9372549, 0, 1, 1,
0.8775018, 0.9425761, 1.340342, 0.945098, 0, 1, 1,
0.878397, -0.3187959, 1.679161, 0.9490196, 0, 1, 1,
0.8784525, 0.7124456, 1.967623, 0.9568627, 0, 1, 1,
0.878636, -0.2473481, 1.363832, 0.9607843, 0, 1, 1,
0.8786508, 0.3176586, 3.306466, 0.9686275, 0, 1, 1,
0.8830494, -1.152368, 2.879639, 0.972549, 0, 1, 1,
0.889181, -0.5318708, 4.196735, 0.9803922, 0, 1, 1,
0.889791, 0.09897365, 1.018323, 0.9843137, 0, 1, 1,
0.8941044, -1.080861, 3.455281, 0.9921569, 0, 1, 1,
0.8980309, 0.2561272, 0.8782668, 0.9960784, 0, 1, 1,
0.900491, 0.3702073, 2.108607, 1, 0, 0.9960784, 1,
0.901863, -0.22799, 1.941904, 1, 0, 0.9882353, 1,
0.9167492, 1.124784, 1.638251, 1, 0, 0.9843137, 1,
0.9181024, -0.2494411, 1.35901, 1, 0, 0.9764706, 1,
0.918741, 0.6785688, -0.749002, 1, 0, 0.972549, 1,
0.9213316, -0.5564788, 2.236745, 1, 0, 0.9647059, 1,
0.9257632, 2.023654, 0.5635844, 1, 0, 0.9607843, 1,
0.9299046, -0.002309271, 2.618478, 1, 0, 0.9529412, 1,
0.9351756, 0.2330049, 3.287756, 1, 0, 0.9490196, 1,
0.9424371, 0.4847013, 1.598941, 1, 0, 0.9411765, 1,
0.945074, 0.326981, 2.896724, 1, 0, 0.9372549, 1,
0.9490151, 0.9421481, -0.55934, 1, 0, 0.9294118, 1,
0.9515899, -0.4730171, 2.393251, 1, 0, 0.9254902, 1,
0.9522957, 0.9597015, 1.498144, 1, 0, 0.9176471, 1,
0.9550033, 0.2467201, 0.7539708, 1, 0, 0.9137255, 1,
0.963133, -0.7396513, 2.393185, 1, 0, 0.9058824, 1,
0.9648228, -1.544173, 1.864149, 1, 0, 0.9019608, 1,
0.9696051, -0.6684533, 2.281472, 1, 0, 0.8941177, 1,
0.9778135, -0.2518047, 0.5503821, 1, 0, 0.8862745, 1,
0.9782171, -0.4360062, 1.505083, 1, 0, 0.8823529, 1,
0.9797535, -1.301729, 2.143465, 1, 0, 0.8745098, 1,
0.9884802, 1.531449, 0.4394171, 1, 0, 0.8705882, 1,
0.9926929, -0.1825432, 1.027224, 1, 0, 0.8627451, 1,
1.00267, -0.7653481, 1.071669, 1, 0, 0.8588235, 1,
1.008211, 0.5856094, 1.945027, 1, 0, 0.8509804, 1,
1.010328, -0.4752846, 1.787174, 1, 0, 0.8470588, 1,
1.018707, 1.287299, 0.7794437, 1, 0, 0.8392157, 1,
1.020319, 1.281274, 0.6848271, 1, 0, 0.8352941, 1,
1.027216, -1.483929, 2.50866, 1, 0, 0.827451, 1,
1.042478, -0.1069678, 2.191502, 1, 0, 0.8235294, 1,
1.051473, -0.5108745, 1.962005, 1, 0, 0.8156863, 1,
1.052508, 0.9611632, -0.3916372, 1, 0, 0.8117647, 1,
1.059759, 0.625789, 2.588239, 1, 0, 0.8039216, 1,
1.063393, 0.2787123, -0.01767701, 1, 0, 0.7960784, 1,
1.064832, -1.78706, 2.225681, 1, 0, 0.7921569, 1,
1.065633, -1.417578, 2.339618, 1, 0, 0.7843137, 1,
1.066292, -1.534255, 1.518314, 1, 0, 0.7803922, 1,
1.078972, 0.6617766, 2.483514, 1, 0, 0.772549, 1,
1.084207, -0.3310993, -0.2500588, 1, 0, 0.7686275, 1,
1.085647, -0.7316661, 1.26735, 1, 0, 0.7607843, 1,
1.094182, -0.8671086, 1.918404, 1, 0, 0.7568628, 1,
1.107101, -0.1868047, 0.1231263, 1, 0, 0.7490196, 1,
1.110439, 0.3527973, 1.577513, 1, 0, 0.7450981, 1,
1.111531, 0.275473, 1.709202, 1, 0, 0.7372549, 1,
1.120279, -0.3573609, 2.582639, 1, 0, 0.7333333, 1,
1.128111, -1.048298, 2.118142, 1, 0, 0.7254902, 1,
1.136225, -0.2821558, 1.725525, 1, 0, 0.7215686, 1,
1.139623, -1.200904, 2.921209, 1, 0, 0.7137255, 1,
1.143677, 0.0006077744, 3.211097, 1, 0, 0.7098039, 1,
1.157509, -0.6110907, 1.137409, 1, 0, 0.7019608, 1,
1.162818, 0.4431028, 3.010026, 1, 0, 0.6941177, 1,
1.172658, 1.145066, 0.449172, 1, 0, 0.6901961, 1,
1.175183, 0.1587767, 3.12634, 1, 0, 0.682353, 1,
1.187862, -0.2825713, 1.279038, 1, 0, 0.6784314, 1,
1.192613, 1.193108, 1.497285, 1, 0, 0.6705883, 1,
1.204228, -1.73661, 2.627819, 1, 0, 0.6666667, 1,
1.204467, 0.1472652, -0.1882691, 1, 0, 0.6588235, 1,
1.206004, -0.1369551, 0.7310618, 1, 0, 0.654902, 1,
1.209062, -1.834836, 2.596437, 1, 0, 0.6470588, 1,
1.21575, -1.267138, 0.7145461, 1, 0, 0.6431373, 1,
1.216297, 1.124061, -1.752177, 1, 0, 0.6352941, 1,
1.221707, -0.7796703, 3.430136, 1, 0, 0.6313726, 1,
1.237884, -1.151478, 2.259235, 1, 0, 0.6235294, 1,
1.240437, 0.1885667, 0.4881015, 1, 0, 0.6196079, 1,
1.243044, -0.2471162, 0.8292943, 1, 0, 0.6117647, 1,
1.243068, 0.798287, 1.491993, 1, 0, 0.6078432, 1,
1.251476, 1.134943, 0.7819061, 1, 0, 0.6, 1,
1.252323, 1.6404, 0.05023455, 1, 0, 0.5921569, 1,
1.253566, -1.249847, 2.171001, 1, 0, 0.5882353, 1,
1.257087, -0.4165874, 0.6059692, 1, 0, 0.5803922, 1,
1.262012, -0.5913608, 2.324889, 1, 0, 0.5764706, 1,
1.265695, -0.4967372, 1.365027, 1, 0, 0.5686275, 1,
1.269271, -0.1366738, 2.27766, 1, 0, 0.5647059, 1,
1.269658, 0.04136391, 3.071236, 1, 0, 0.5568628, 1,
1.27432, 0.6100699, 2.100358, 1, 0, 0.5529412, 1,
1.275832, 2.358056, 0.8149386, 1, 0, 0.5450981, 1,
1.277128, -0.7899262, 2.477534, 1, 0, 0.5411765, 1,
1.284659, -1.630047, 2.608766, 1, 0, 0.5333334, 1,
1.298982, -0.8790316, 2.591063, 1, 0, 0.5294118, 1,
1.342415, 0.5575542, -0.4969147, 1, 0, 0.5215687, 1,
1.346278, -0.1266191, 1.78256, 1, 0, 0.5176471, 1,
1.347789, 1.504999, 3.125986, 1, 0, 0.509804, 1,
1.349067, 2.002764, 0.7033766, 1, 0, 0.5058824, 1,
1.350685, 0.6473122, -0.5627379, 1, 0, 0.4980392, 1,
1.35276, -0.4374431, 2.96825, 1, 0, 0.4901961, 1,
1.392683, 0.0645353, 1.00152, 1, 0, 0.4862745, 1,
1.395201, -0.07895935, 1.268866, 1, 0, 0.4784314, 1,
1.396327, 0.07202288, 1.040383, 1, 0, 0.4745098, 1,
1.401049, -1.604355, 2.647186, 1, 0, 0.4666667, 1,
1.407237, 1.835912, -0.4289767, 1, 0, 0.4627451, 1,
1.409857, -0.09657846, 0.5886207, 1, 0, 0.454902, 1,
1.416119, -0.2549155, 2.138197, 1, 0, 0.4509804, 1,
1.418573, -1.79049, 1.869443, 1, 0, 0.4431373, 1,
1.422627, 0.3167712, 0.6733419, 1, 0, 0.4392157, 1,
1.423438, -1.57955, 1.725159, 1, 0, 0.4313726, 1,
1.427213, 0.1167395, 3.211103, 1, 0, 0.427451, 1,
1.431391, -1.106684, 2.053531, 1, 0, 0.4196078, 1,
1.432136, 1.758574, 1.206236, 1, 0, 0.4156863, 1,
1.439217, 1.421659, 1.09119, 1, 0, 0.4078431, 1,
1.448934, 0.7260743, 0.1316497, 1, 0, 0.4039216, 1,
1.451949, -0.1163475, 0.3632632, 1, 0, 0.3960784, 1,
1.460319, -1.100936, 1.363863, 1, 0, 0.3882353, 1,
1.462223, 1.603447, 3.591692, 1, 0, 0.3843137, 1,
1.469707, -1.069602, 2.7167, 1, 0, 0.3764706, 1,
1.481126, 0.09397973, 1.050392, 1, 0, 0.372549, 1,
1.485447, -0.1038961, 0.9067554, 1, 0, 0.3647059, 1,
1.511496, 1.503788, -0.5187497, 1, 0, 0.3607843, 1,
1.516486, 0.1719756, 1.495981, 1, 0, 0.3529412, 1,
1.52856, -0.4276654, 2.488256, 1, 0, 0.3490196, 1,
1.534685, 1.161573, 1.46182, 1, 0, 0.3411765, 1,
1.54061, -0.3539051, 1.495651, 1, 0, 0.3372549, 1,
1.543995, -1.006067, 2.697006, 1, 0, 0.3294118, 1,
1.544503, 2.195378, -0.1030802, 1, 0, 0.3254902, 1,
1.548083, -0.6854783, 3.985452, 1, 0, 0.3176471, 1,
1.548882, 0.6290236, 1.428194, 1, 0, 0.3137255, 1,
1.571501, 0.0126263, 1.358721, 1, 0, 0.3058824, 1,
1.574258, -0.3649134, 0.08483974, 1, 0, 0.2980392, 1,
1.575297, 0.6391351, 0.8992485, 1, 0, 0.2941177, 1,
1.588985, 0.5932005, 1.235513, 1, 0, 0.2862745, 1,
1.599578, -0.8159739, 1.855057, 1, 0, 0.282353, 1,
1.60155, 0.4081847, 2.374669, 1, 0, 0.2745098, 1,
1.624073, -0.9208567, 2.000077, 1, 0, 0.2705882, 1,
1.639537, 0.7300347, 1.44199, 1, 0, 0.2627451, 1,
1.652968, 0.7767195, 2.162979, 1, 0, 0.2588235, 1,
1.66834, 1.217407, 1.811006, 1, 0, 0.2509804, 1,
1.676848, -0.2846684, 2.159857, 1, 0, 0.2470588, 1,
1.678793, 0.5045834, 0.6658671, 1, 0, 0.2392157, 1,
1.688429, -0.2895961, 2.37166, 1, 0, 0.2352941, 1,
1.69012, -0.6393049, 2.707607, 1, 0, 0.227451, 1,
1.695205, 0.7935311, 0.6712567, 1, 0, 0.2235294, 1,
1.708412, 0.1802545, 0.7449123, 1, 0, 0.2156863, 1,
1.723888, 0.6561208, 0.8778167, 1, 0, 0.2117647, 1,
1.746171, -0.5373634, 0.197835, 1, 0, 0.2039216, 1,
1.764269, 0.07345952, 2.885795, 1, 0, 0.1960784, 1,
1.766709, 1.453449, 2.245901, 1, 0, 0.1921569, 1,
1.769585, 0.04110089, 0.5373567, 1, 0, 0.1843137, 1,
1.772857, -1.258704, 2.432346, 1, 0, 0.1803922, 1,
1.778851, 1.577085, 2.148969, 1, 0, 0.172549, 1,
1.779417, 2.159683, -1.104548, 1, 0, 0.1686275, 1,
1.785251, -1.233478, 2.891696, 1, 0, 0.1607843, 1,
1.791531, -0.2915403, -0.003653407, 1, 0, 0.1568628, 1,
1.804626, 1.076956, 1.29435, 1, 0, 0.1490196, 1,
1.827103, -2.779678, 1.178453, 1, 0, 0.145098, 1,
1.827625, 0.1107597, 2.435859, 1, 0, 0.1372549, 1,
1.858514, -1.64153, 3.207288, 1, 0, 0.1333333, 1,
1.864991, 1.662091, 1.50956, 1, 0, 0.1254902, 1,
1.91621, -1.872445, 0.4525135, 1, 0, 0.1215686, 1,
1.94395, 1.278607, 0.137414, 1, 0, 0.1137255, 1,
1.956122, -0.03989948, 1.22387, 1, 0, 0.1098039, 1,
1.986686, 0.1308069, 1.343292, 1, 0, 0.1019608, 1,
2.036315, 1.511574, 1.4505, 1, 0, 0.09411765, 1,
2.055014, 0.4943625, 1.075543, 1, 0, 0.09019608, 1,
2.105422, -1.203157, 2.555678, 1, 0, 0.08235294, 1,
2.120559, -0.4598907, 3.509078, 1, 0, 0.07843138, 1,
2.120882, -0.9860727, 0.8370283, 1, 0, 0.07058824, 1,
2.128027, 0.8347054, 1.329881, 1, 0, 0.06666667, 1,
2.156064, -0.7585652, 2.439941, 1, 0, 0.05882353, 1,
2.184333, -1.834189, 2.16927, 1, 0, 0.05490196, 1,
2.221088, -1.515209, 3.067578, 1, 0, 0.04705882, 1,
2.261026, 0.3502957, 0.4945455, 1, 0, 0.04313726, 1,
2.310378, -0.7058113, 1.097172, 1, 0, 0.03529412, 1,
2.343245, 0.07461121, 1.313848, 1, 0, 0.03137255, 1,
2.454465, -1.430049, 1.050308, 1, 0, 0.02352941, 1,
2.469456, -1.664452, -0.5817504, 1, 0, 0.01960784, 1,
2.512149, 0.7594481, 1.517904, 1, 0, 0.01176471, 1,
2.690094, 0.8661165, 0.2946775, 1, 0, 0.007843138, 1
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
-0.04391885, -3.921032, -6.816957, 0, -0.5, 0.5, 0.5,
-0.04391885, -3.921032, -6.816957, 1, -0.5, 0.5, 0.5,
-0.04391885, -3.921032, -6.816957, 1, 1.5, 0.5, 0.5,
-0.04391885, -3.921032, -6.816957, 0, 1.5, 0.5, 0.5
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
-3.704763, -0.1601398, -6.816957, 0, -0.5, 0.5, 0.5,
-3.704763, -0.1601398, -6.816957, 1, -0.5, 0.5, 0.5,
-3.704763, -0.1601398, -6.816957, 1, 1.5, 0.5, 0.5,
-3.704763, -0.1601398, -6.816957, 0, 1.5, 0.5, 0.5
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
-3.704763, -3.921032, -0.1037924, 0, -0.5, 0.5, 0.5,
-3.704763, -3.921032, -0.1037924, 1, -0.5, 0.5, 0.5,
-3.704763, -3.921032, -0.1037924, 1, 1.5, 0.5, 0.5,
-3.704763, -3.921032, -0.1037924, 0, 1.5, 0.5, 0.5
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
-2, -3.053133, -5.267765,
2, -3.053133, -5.267765,
-2, -3.053133, -5.267765,
-2, -3.197783, -5.525963,
-1, -3.053133, -5.267765,
-1, -3.197783, -5.525963,
0, -3.053133, -5.267765,
0, -3.197783, -5.525963,
1, -3.053133, -5.267765,
1, -3.197783, -5.525963,
2, -3.053133, -5.267765,
2, -3.197783, -5.525963
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
-2, -3.487083, -6.04236, 0, -0.5, 0.5, 0.5,
-2, -3.487083, -6.04236, 1, -0.5, 0.5, 0.5,
-2, -3.487083, -6.04236, 1, 1.5, 0.5, 0.5,
-2, -3.487083, -6.04236, 0, 1.5, 0.5, 0.5,
-1, -3.487083, -6.04236, 0, -0.5, 0.5, 0.5,
-1, -3.487083, -6.04236, 1, -0.5, 0.5, 0.5,
-1, -3.487083, -6.04236, 1, 1.5, 0.5, 0.5,
-1, -3.487083, -6.04236, 0, 1.5, 0.5, 0.5,
0, -3.487083, -6.04236, 0, -0.5, 0.5, 0.5,
0, -3.487083, -6.04236, 1, -0.5, 0.5, 0.5,
0, -3.487083, -6.04236, 1, 1.5, 0.5, 0.5,
0, -3.487083, -6.04236, 0, 1.5, 0.5, 0.5,
1, -3.487083, -6.04236, 0, -0.5, 0.5, 0.5,
1, -3.487083, -6.04236, 1, -0.5, 0.5, 0.5,
1, -3.487083, -6.04236, 1, 1.5, 0.5, 0.5,
1, -3.487083, -6.04236, 0, 1.5, 0.5, 0.5,
2, -3.487083, -6.04236, 0, -0.5, 0.5, 0.5,
2, -3.487083, -6.04236, 1, -0.5, 0.5, 0.5,
2, -3.487083, -6.04236, 1, 1.5, 0.5, 0.5,
2, -3.487083, -6.04236, 0, 1.5, 0.5, 0.5
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
-2.859952, -2, -5.267765,
-2.859952, 2, -5.267765,
-2.859952, -2, -5.267765,
-3.000754, -2, -5.525963,
-2.859952, -1, -5.267765,
-3.000754, -1, -5.525963,
-2.859952, 0, -5.267765,
-3.000754, 0, -5.525963,
-2.859952, 1, -5.267765,
-3.000754, 1, -5.525963,
-2.859952, 2, -5.267765,
-3.000754, 2, -5.525963
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
-3.282358, -2, -6.04236, 0, -0.5, 0.5, 0.5,
-3.282358, -2, -6.04236, 1, -0.5, 0.5, 0.5,
-3.282358, -2, -6.04236, 1, 1.5, 0.5, 0.5,
-3.282358, -2, -6.04236, 0, 1.5, 0.5, 0.5,
-3.282358, -1, -6.04236, 0, -0.5, 0.5, 0.5,
-3.282358, -1, -6.04236, 1, -0.5, 0.5, 0.5,
-3.282358, -1, -6.04236, 1, 1.5, 0.5, 0.5,
-3.282358, -1, -6.04236, 0, 1.5, 0.5, 0.5,
-3.282358, 0, -6.04236, 0, -0.5, 0.5, 0.5,
-3.282358, 0, -6.04236, 1, -0.5, 0.5, 0.5,
-3.282358, 0, -6.04236, 1, 1.5, 0.5, 0.5,
-3.282358, 0, -6.04236, 0, 1.5, 0.5, 0.5,
-3.282358, 1, -6.04236, 0, -0.5, 0.5, 0.5,
-3.282358, 1, -6.04236, 1, -0.5, 0.5, 0.5,
-3.282358, 1, -6.04236, 1, 1.5, 0.5, 0.5,
-3.282358, 1, -6.04236, 0, 1.5, 0.5, 0.5,
-3.282358, 2, -6.04236, 0, -0.5, 0.5, 0.5,
-3.282358, 2, -6.04236, 1, -0.5, 0.5, 0.5,
-3.282358, 2, -6.04236, 1, 1.5, 0.5, 0.5,
-3.282358, 2, -6.04236, 0, 1.5, 0.5, 0.5
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
-2.859952, -3.053133, -4,
-2.859952, -3.053133, 4,
-2.859952, -3.053133, -4,
-3.000754, -3.197783, -4,
-2.859952, -3.053133, -2,
-3.000754, -3.197783, -2,
-2.859952, -3.053133, 0,
-3.000754, -3.197783, 0,
-2.859952, -3.053133, 2,
-3.000754, -3.197783, 2,
-2.859952, -3.053133, 4,
-3.000754, -3.197783, 4
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
-3.282358, -3.487083, -4, 0, -0.5, 0.5, 0.5,
-3.282358, -3.487083, -4, 1, -0.5, 0.5, 0.5,
-3.282358, -3.487083, -4, 1, 1.5, 0.5, 0.5,
-3.282358, -3.487083, -4, 0, 1.5, 0.5, 0.5,
-3.282358, -3.487083, -2, 0, -0.5, 0.5, 0.5,
-3.282358, -3.487083, -2, 1, -0.5, 0.5, 0.5,
-3.282358, -3.487083, -2, 1, 1.5, 0.5, 0.5,
-3.282358, -3.487083, -2, 0, 1.5, 0.5, 0.5,
-3.282358, -3.487083, 0, 0, -0.5, 0.5, 0.5,
-3.282358, -3.487083, 0, 1, -0.5, 0.5, 0.5,
-3.282358, -3.487083, 0, 1, 1.5, 0.5, 0.5,
-3.282358, -3.487083, 0, 0, 1.5, 0.5, 0.5,
-3.282358, -3.487083, 2, 0, -0.5, 0.5, 0.5,
-3.282358, -3.487083, 2, 1, -0.5, 0.5, 0.5,
-3.282358, -3.487083, 2, 1, 1.5, 0.5, 0.5,
-3.282358, -3.487083, 2, 0, 1.5, 0.5, 0.5,
-3.282358, -3.487083, 4, 0, -0.5, 0.5, 0.5,
-3.282358, -3.487083, 4, 1, -0.5, 0.5, 0.5,
-3.282358, -3.487083, 4, 1, 1.5, 0.5, 0.5,
-3.282358, -3.487083, 4, 0, 1.5, 0.5, 0.5
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
-2.859952, -3.053133, -5.267765,
-2.859952, 2.732854, -5.267765,
-2.859952, -3.053133, 5.06018,
-2.859952, 2.732854, 5.06018,
-2.859952, -3.053133, -5.267765,
-2.859952, -3.053133, 5.06018,
-2.859952, 2.732854, -5.267765,
-2.859952, 2.732854, 5.06018,
-2.859952, -3.053133, -5.267765,
2.772115, -3.053133, -5.267765,
-2.859952, -3.053133, 5.06018,
2.772115, -3.053133, 5.06018,
-2.859952, 2.732854, -5.267765,
2.772115, 2.732854, -5.267765,
-2.859952, 2.732854, 5.06018,
2.772115, 2.732854, 5.06018,
2.772115, -3.053133, -5.267765,
2.772115, 2.732854, -5.267765,
2.772115, -3.053133, 5.06018,
2.772115, 2.732854, 5.06018,
2.772115, -3.053133, -5.267765,
2.772115, -3.053133, 5.06018,
2.772115, 2.732854, -5.267765,
2.772115, 2.732854, 5.06018
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
var radius = 7.000326;
var distance = 31.14524;
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
mvMatrix.translate( 0.04391885, 0.1601398, 0.1037924 );
mvMatrix.scale( 1.343892, 1.308141, 0.7328554 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -31.14524);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
sulfallate<-read.table("sulfallate.xyz")
```

```
## Error in read.table("sulfallate.xyz"): no lines available in input
```

```r
x<-sulfallate$V2
```

```
## Error in eval(expr, envir, enclos): object 'sulfallate' not found
```

```r
y<-sulfallate$V3
```

```
## Error in eval(expr, envir, enclos): object 'sulfallate' not found
```

```r
z<-sulfallate$V4
```

```
## Error in eval(expr, envir, enclos): object 'sulfallate' not found
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
-2.777932, 0.3046597, -2.470199, 0, 0, 1, 1, 1,
-2.479323, -0.2919284, -1.710641, 1, 0, 0, 1, 1,
-2.470776, 0.373169, -0.4075536, 1, 0, 0, 1, 1,
-2.410116, 0.5440011, -1.825437, 1, 0, 0, 1, 1,
-2.312965, 2.52146, -2.246394, 1, 0, 0, 1, 1,
-2.248992, 1.346712, 0.002054798, 1, 0, 0, 1, 1,
-2.241158, 0.05516174, -2.574961, 0, 0, 0, 1, 1,
-2.217573, 1.849434, -1.153829, 0, 0, 0, 1, 1,
-2.174495, -0.7308944, -2.257347, 0, 0, 0, 1, 1,
-2.152415, -0.6458993, -0.7357777, 0, 0, 0, 1, 1,
-2.124903, 0.8163041, -1.549901, 0, 0, 0, 1, 1,
-2.105718, -1.881654, -1.492724, 0, 0, 0, 1, 1,
-2.082743, 1.918137, -0.05930303, 0, 0, 0, 1, 1,
-2.074881, -0.4088547, -3.233624, 1, 1, 1, 1, 1,
-2.04647, -0.3559198, -2.41298, 1, 1, 1, 1, 1,
-2.046302, -2.038782, -2.232501, 1, 1, 1, 1, 1,
-2.039984, 0.03285163, -1.168359, 1, 1, 1, 1, 1,
-2.039552, 0.7834632, -1.415646, 1, 1, 1, 1, 1,
-2.023552, 0.3981715, -0.5985731, 1, 1, 1, 1, 1,
-2.016807, 0.7295039, -1.370427, 1, 1, 1, 1, 1,
-2.004375, -1.931439, -2.215447, 1, 1, 1, 1, 1,
-2.000434, -1.946554, -1.41501, 1, 1, 1, 1, 1,
-1.998066, 0.8745944, -1.040544, 1, 1, 1, 1, 1,
-1.996716, 0.5049396, -1.179698, 1, 1, 1, 1, 1,
-1.969863, -1.379185, -3.308747, 1, 1, 1, 1, 1,
-1.958007, -0.2910579, -3.034306, 1, 1, 1, 1, 1,
-1.939986, 1.257652, -1.804434, 1, 1, 1, 1, 1,
-1.935113, 0.417257, -2.239541, 1, 1, 1, 1, 1,
-1.934047, -1.821457, -2.040826, 0, 0, 1, 1, 1,
-1.911268, -0.05523906, -0.6754601, 1, 0, 0, 1, 1,
-1.907105, 0.1487636, -1.966254, 1, 0, 0, 1, 1,
-1.878597, -0.02798208, -1.389109, 1, 0, 0, 1, 1,
-1.876269, -0.227229, -2.070663, 1, 0, 0, 1, 1,
-1.850546, 1.079488, 0.4803687, 1, 0, 0, 1, 1,
-1.842939, 1.227872, 0.5186332, 0, 0, 0, 1, 1,
-1.841979, 1.007908, -0.6655, 0, 0, 0, 1, 1,
-1.80776, -0.4248919, -1.144447, 0, 0, 0, 1, 1,
-1.79706, -0.9025179, -0.1417292, 0, 0, 0, 1, 1,
-1.734333, 0.3200738, -0.7056741, 0, 0, 0, 1, 1,
-1.701649, -0.494932, -3.934258, 0, 0, 0, 1, 1,
-1.679557, 0.07431208, -1.407661, 0, 0, 0, 1, 1,
-1.672927, 1.099164, -1.415297, 1, 1, 1, 1, 1,
-1.657553, 2.049654, 0.08118537, 1, 1, 1, 1, 1,
-1.641876, 2.158907, -1.362673, 1, 1, 1, 1, 1,
-1.630954, -1.068724, -1.24581, 1, 1, 1, 1, 1,
-1.626379, 0.648967, -0.8284838, 1, 1, 1, 1, 1,
-1.626073, 0.7308381, -0.9922969, 1, 1, 1, 1, 1,
-1.625061, 1.013281, 0.1889086, 1, 1, 1, 1, 1,
-1.613691, -0.6249933, -0.4577653, 1, 1, 1, 1, 1,
-1.610547, 0.6514449, -1.102596, 1, 1, 1, 1, 1,
-1.602047, 1.448973, -1.431705, 1, 1, 1, 1, 1,
-1.59791, -1.138986, -0.2519829, 1, 1, 1, 1, 1,
-1.585006, 1.8235, 0.6871023, 1, 1, 1, 1, 1,
-1.578176, 0.6416066, -0.8451003, 1, 1, 1, 1, 1,
-1.577664, 0.2448116, -1.752658, 1, 1, 1, 1, 1,
-1.570488, -1.55996, -2.601048, 1, 1, 1, 1, 1,
-1.563686, -0.2195328, -0.7737539, 0, 0, 1, 1, 1,
-1.560123, -0.8238218, -1.481635, 1, 0, 0, 1, 1,
-1.53252, 0.8930416, -2.109219, 1, 0, 0, 1, 1,
-1.531863, 1.186161, -4.007118, 1, 0, 0, 1, 1,
-1.529825, -0.687327, -2.039421, 1, 0, 0, 1, 1,
-1.518943, 2.224846, -1.003853, 1, 0, 0, 1, 1,
-1.505698, -1.447356, -2.15426, 0, 0, 0, 1, 1,
-1.499888, -0.3202479, -2.20268, 0, 0, 0, 1, 1,
-1.4911, -1.231074, -2.154929, 0, 0, 0, 1, 1,
-1.475134, -0.3913045, -1.635732, 0, 0, 0, 1, 1,
-1.459425, 0.03180198, -1.218316, 0, 0, 0, 1, 1,
-1.457005, -0.3456589, -1.212203, 0, 0, 0, 1, 1,
-1.439292, 1.86188, -3.139946, 0, 0, 0, 1, 1,
-1.436429, -2.215603, -1.910046, 1, 1, 1, 1, 1,
-1.418367, 0.004989798, -3.860006, 1, 1, 1, 1, 1,
-1.402178, 1.105523, -0.7347382, 1, 1, 1, 1, 1,
-1.397849, -1.454327, -2.030152, 1, 1, 1, 1, 1,
-1.369176, -0.2504357, -2.234784, 1, 1, 1, 1, 1,
-1.367718, 1.578116, -1.047762, 1, 1, 1, 1, 1,
-1.366327, 0.6348674, 0.7202155, 1, 1, 1, 1, 1,
-1.358685, 1.043402, -1.225606, 1, 1, 1, 1, 1,
-1.354249, -0.3323943, -0.4109099, 1, 1, 1, 1, 1,
-1.349171, 0.625901, -0.9391721, 1, 1, 1, 1, 1,
-1.348992, 0.9844328, -0.8651094, 1, 1, 1, 1, 1,
-1.34428, -0.4529182, -1.838002, 1, 1, 1, 1, 1,
-1.340654, -0.5383676, -0.4976066, 1, 1, 1, 1, 1,
-1.338598, -1.455596, -2.207192, 1, 1, 1, 1, 1,
-1.335661, -2.475817, -3.101936, 1, 1, 1, 1, 1,
-1.333616, -0.1350494, -1.037137, 0, 0, 1, 1, 1,
-1.331578, -0.746884, -1.950839, 1, 0, 0, 1, 1,
-1.3278, 0.9105249, -1.480865, 1, 0, 0, 1, 1,
-1.316704, 0.1957212, -2.192639, 1, 0, 0, 1, 1,
-1.297542, 0.2558465, -1.715028, 1, 0, 0, 1, 1,
-1.293816, 1.274599, -0.1036204, 1, 0, 0, 1, 1,
-1.283467, 0.2140589, -0.598247, 0, 0, 0, 1, 1,
-1.276441, 0.1935441, -0.933613, 0, 0, 0, 1, 1,
-1.272846, 0.396149, -2.42804, 0, 0, 0, 1, 1,
-1.268697, 0.8734092, -1.548601, 0, 0, 0, 1, 1,
-1.268181, -2.093098, -1.726261, 0, 0, 0, 1, 1,
-1.266188, -1.106799, -4.100704, 0, 0, 0, 1, 1,
-1.265483, 1.160146, -0.3113064, 0, 0, 0, 1, 1,
-1.261216, 0.07476357, -1.609785, 1, 1, 1, 1, 1,
-1.255697, 0.5790713, -2.068639, 1, 1, 1, 1, 1,
-1.246212, 0.2309837, -1.079993, 1, 1, 1, 1, 1,
-1.242701, 0.5971227, -0.8160554, 1, 1, 1, 1, 1,
-1.230191, -1.187312, -4.053518, 1, 1, 1, 1, 1,
-1.218977, -0.3131084, -4.012196, 1, 1, 1, 1, 1,
-1.212705, 0.7747287, -3.087175, 1, 1, 1, 1, 1,
-1.20396, 0.1053031, 0.2039261, 1, 1, 1, 1, 1,
-1.191884, 0.4636814, -2.140074, 1, 1, 1, 1, 1,
-1.18782, 0.4321934, -0.3225608, 1, 1, 1, 1, 1,
-1.180966, 1.648298, -1.469125, 1, 1, 1, 1, 1,
-1.16769, 0.3983025, -1.264609, 1, 1, 1, 1, 1,
-1.151851, 0.3581398, -3.287878, 1, 1, 1, 1, 1,
-1.146096, 0.1353274, 0.0487798, 1, 1, 1, 1, 1,
-1.145744, -2.391651, -1.474965, 1, 1, 1, 1, 1,
-1.136991, -2.968872, -4.484282, 0, 0, 1, 1, 1,
-1.135911, -1.785315, -1.974774, 1, 0, 0, 1, 1,
-1.132941, 2.569467, -1.115415, 1, 0, 0, 1, 1,
-1.132175, 1.903733, -1.550236, 1, 0, 0, 1, 1,
-1.122931, -0.1929322, -1.525279, 1, 0, 0, 1, 1,
-1.117941, 0.368265, -1.578121, 1, 0, 0, 1, 1,
-1.114699, -0.4925882, -2.180224, 0, 0, 0, 1, 1,
-1.114345, -0.8271575, -1.170184, 0, 0, 0, 1, 1,
-1.109751, -0.9802033, -4.389056, 0, 0, 0, 1, 1,
-1.109278, -1.367038, -2.66707, 0, 0, 0, 1, 1,
-1.107435, 0.6467085, -1.048336, 0, 0, 0, 1, 1,
-1.103697, -0.5404655, -1.972349, 0, 0, 0, 1, 1,
-1.103632, 1.33172, -1.660303, 0, 0, 0, 1, 1,
-1.099376, -0.6372226, -3.226235, 1, 1, 1, 1, 1,
-1.091284, 1.357479, -1.042595, 1, 1, 1, 1, 1,
-1.084126, -0.1835647, -0.6531304, 1, 1, 1, 1, 1,
-1.08402, -0.7035738, -1.821796, 1, 1, 1, 1, 1,
-1.072339, -1.130752, -3.510763, 1, 1, 1, 1, 1,
-1.07, -0.09320582, -0.2042005, 1, 1, 1, 1, 1,
-1.067418, 0.8332461, 0.306563, 1, 1, 1, 1, 1,
-1.061597, 0.1369998, -1.204118, 1, 1, 1, 1, 1,
-1.060361, -0.7965545, -1.732847, 1, 1, 1, 1, 1,
-1.053442, -0.07975233, -1.100112, 1, 1, 1, 1, 1,
-1.04571, 0.2690476, -2.163406, 1, 1, 1, 1, 1,
-1.033103, -0.5402519, -2.09992, 1, 1, 1, 1, 1,
-1.030402, 0.7675038, -1.10095, 1, 1, 1, 1, 1,
-1.027329, 0.08425537, -1.969122, 1, 1, 1, 1, 1,
-1.027081, 0.8506708, 0.3206001, 1, 1, 1, 1, 1,
-1.020305, 1.386301, 0.7468431, 0, 0, 1, 1, 1,
-1.019405, -0.6766934, -3.439135, 1, 0, 0, 1, 1,
-1.017531, 1.137279, -0.2254855, 1, 0, 0, 1, 1,
-1.016889, 0.6873562, -0.4105641, 1, 0, 0, 1, 1,
-1.004665, 0.3161373, -2.247565, 1, 0, 0, 1, 1,
-0.9976333, 0.02715204, -2.260617, 1, 0, 0, 1, 1,
-0.9877213, -0.7410918, -2.967952, 0, 0, 0, 1, 1,
-0.9859372, -0.2982748, -2.215678, 0, 0, 0, 1, 1,
-0.9697974, -1.700227, -3.978371, 0, 0, 0, 1, 1,
-0.9661996, -2.681039, -1.598648, 0, 0, 0, 1, 1,
-0.9659581, -0.5427495, -3.439421, 0, 0, 0, 1, 1,
-0.9642049, -1.106341, -2.69113, 0, 0, 0, 1, 1,
-0.9621848, -0.5396363, -2.516458, 0, 0, 0, 1, 1,
-0.9591036, -0.3508234, -3.358311, 1, 1, 1, 1, 1,
-0.9562624, -2.178338, -2.243, 1, 1, 1, 1, 1,
-0.9525677, 0.3812234, -1.097884, 1, 1, 1, 1, 1,
-0.9507689, -0.7162437, -1.864963, 1, 1, 1, 1, 1,
-0.9507187, -0.5017565, -1.295746, 1, 1, 1, 1, 1,
-0.9496678, 1.127115, -1.589774, 1, 1, 1, 1, 1,
-0.9458585, -1.712351, -2.157006, 1, 1, 1, 1, 1,
-0.9384704, 0.7542289, -3.112631, 1, 1, 1, 1, 1,
-0.9360371, -0.2441909, -2.18909, 1, 1, 1, 1, 1,
-0.9308777, -0.1392733, -3.629258, 1, 1, 1, 1, 1,
-0.9300323, 1.039959, -0.8030949, 1, 1, 1, 1, 1,
-0.9247309, -0.0683096, 0.3751558, 1, 1, 1, 1, 1,
-0.9214025, 1.341755, -0.9791883, 1, 1, 1, 1, 1,
-0.9191431, 1.000115, -1.578692, 1, 1, 1, 1, 1,
-0.9163601, -0.3301801, -2.946415, 1, 1, 1, 1, 1,
-0.9108383, 0.3937013, -0.3063898, 0, 0, 1, 1, 1,
-0.910787, -0.4729744, -0.8872855, 1, 0, 0, 1, 1,
-0.9102221, 2.648592, -1.877204, 1, 0, 0, 1, 1,
-0.9064681, 0.8019947, -0.01883571, 1, 0, 0, 1, 1,
-0.9032166, 0.4331628, -2.646304, 1, 0, 0, 1, 1,
-0.901507, -0.467364, -4.631642, 1, 0, 0, 1, 1,
-0.8997688, -0.7791501, -2.506233, 0, 0, 0, 1, 1,
-0.8993484, 1.035056, 0.321095, 0, 0, 0, 1, 1,
-0.8900813, 0.05939939, -2.269656, 0, 0, 0, 1, 1,
-0.8888206, 0.8551562, -1.525743, 0, 0, 0, 1, 1,
-0.8834751, 1.023511, -0.2557285, 0, 0, 0, 1, 1,
-0.8831252, 1.55671, -0.05112357, 0, 0, 0, 1, 1,
-0.8656576, -1.20888, -2.420614, 0, 0, 0, 1, 1,
-0.8633558, -1.464573, -3.137902, 1, 1, 1, 1, 1,
-0.8609905, -0.5498885, -1.47032, 1, 1, 1, 1, 1,
-0.8563287, 0.4375304, -0.07281372, 1, 1, 1, 1, 1,
-0.8457397, 0.2047123, -3.241462, 1, 1, 1, 1, 1,
-0.8330479, -0.2479665, -1.052092, 1, 1, 1, 1, 1,
-0.832715, 1.182273, 0.2452436, 1, 1, 1, 1, 1,
-0.8307084, -0.008711395, -0.4967595, 1, 1, 1, 1, 1,
-0.8270003, 0.7448444, -1.061005, 1, 1, 1, 1, 1,
-0.8256267, 1.718993, -1.703097, 1, 1, 1, 1, 1,
-0.8226821, -0.7683995, -2.49988, 1, 1, 1, 1, 1,
-0.8119599, 0.3600774, -0.230231, 1, 1, 1, 1, 1,
-0.8040906, 0.9654714, -1.018027, 1, 1, 1, 1, 1,
-0.8009642, -0.5776085, -3.458991, 1, 1, 1, 1, 1,
-0.7996669, 0.4630561, -0.6412415, 1, 1, 1, 1, 1,
-0.7975711, 0.9836046, -0.3772704, 1, 1, 1, 1, 1,
-0.7954137, -0.7071297, -1.834836, 0, 0, 1, 1, 1,
-0.7950626, -0.2231354, -0.3219068, 1, 0, 0, 1, 1,
-0.7911128, -0.2989815, -0.7671699, 1, 0, 0, 1, 1,
-0.788803, 0.2806493, -1.958052, 1, 0, 0, 1, 1,
-0.7877005, 0.165678, -2.2851, 1, 0, 0, 1, 1,
-0.7862927, 1.090055, -0.4277202, 1, 0, 0, 1, 1,
-0.7848336, -0.04507494, -4.134818, 0, 0, 0, 1, 1,
-0.7839872, -1.611002, -1.249147, 0, 0, 0, 1, 1,
-0.7749543, -0.8701119, -1.800815, 0, 0, 0, 1, 1,
-0.7718955, 1.40603, -0.1061237, 0, 0, 0, 1, 1,
-0.7662825, 1.533137, -0.0853507, 0, 0, 0, 1, 1,
-0.7575716, 1.069712, -1.897245, 0, 0, 0, 1, 1,
-0.7568927, 0.678413, 0.07434749, 0, 0, 0, 1, 1,
-0.7560328, 0.3737156, -0.629526, 1, 1, 1, 1, 1,
-0.7547094, -0.7990312, -2.160003, 1, 1, 1, 1, 1,
-0.7522455, 0.4044543, -2.14916, 1, 1, 1, 1, 1,
-0.7495861, 0.4262087, -0.1812241, 1, 1, 1, 1, 1,
-0.7473174, 0.652852, -1.655001, 1, 1, 1, 1, 1,
-0.7460047, -0.3955379, -3.909299, 1, 1, 1, 1, 1,
-0.7458134, -1.471961, -1.896884, 1, 1, 1, 1, 1,
-0.7414222, -0.7008078, -1.640516, 1, 1, 1, 1, 1,
-0.7375934, 0.8646876, -1.04439, 1, 1, 1, 1, 1,
-0.7367378, -0.0226858, -2.404899, 1, 1, 1, 1, 1,
-0.7354212, -2.16225, -3.775996, 1, 1, 1, 1, 1,
-0.7330095, -1.352053, -0.444579, 1, 1, 1, 1, 1,
-0.7323717, 1.255033, 0.499191, 1, 1, 1, 1, 1,
-0.731646, -1.308501, -2.781258, 1, 1, 1, 1, 1,
-0.7282045, -1.876443, -3.385399, 1, 1, 1, 1, 1,
-0.7271523, -0.8161309, -2.994814, 0, 0, 1, 1, 1,
-0.7268267, -2.589033, -3.10965, 1, 0, 0, 1, 1,
-0.7259699, -1.001885, -1.886977, 1, 0, 0, 1, 1,
-0.7240381, 0.4138082, -1.878065, 1, 0, 0, 1, 1,
-0.723124, 0.836232, 0.5936138, 1, 0, 0, 1, 1,
-0.7205715, 0.08049785, -2.029997, 1, 0, 0, 1, 1,
-0.7203406, -1.162398, -4.477356, 0, 0, 0, 1, 1,
-0.7192621, 0.2412882, -2.421023, 0, 0, 0, 1, 1,
-0.7184182, -0.7211991, -0.8419375, 0, 0, 0, 1, 1,
-0.7144838, 0.2772444, -1.136054, 0, 0, 0, 1, 1,
-0.713261, 1.204123, -0.1372417, 0, 0, 0, 1, 1,
-0.7117365, 0.7927478, -1.846591, 0, 0, 0, 1, 1,
-0.7107525, -0.3637976, -2.079043, 0, 0, 0, 1, 1,
-0.7065861, -0.7547196, -2.091226, 1, 1, 1, 1, 1,
-0.7063565, -0.3762638, -2.282841, 1, 1, 1, 1, 1,
-0.7042086, -0.98896, -3.264499, 1, 1, 1, 1, 1,
-0.7028015, -0.2937191, -1.732939, 1, 1, 1, 1, 1,
-0.7011003, 1.421812, -0.05630432, 1, 1, 1, 1, 1,
-0.6950272, 0.6240777, -2.68042, 1, 1, 1, 1, 1,
-0.6943113, 0.5973283, -1.691891, 1, 1, 1, 1, 1,
-0.6940919, 0.2198204, -1.009866, 1, 1, 1, 1, 1,
-0.692808, -0.1699829, -1.366512, 1, 1, 1, 1, 1,
-0.6907958, 0.6224101, -0.1676056, 1, 1, 1, 1, 1,
-0.6902648, 0.0796831, -4.291828, 1, 1, 1, 1, 1,
-0.6854399, 1.618111, -1.366179, 1, 1, 1, 1, 1,
-0.6836026, -0.5045747, -1.293678, 1, 1, 1, 1, 1,
-0.6829186, 0.8321511, -1.687281, 1, 1, 1, 1, 1,
-0.6720129, -0.54086, -3.323089, 1, 1, 1, 1, 1,
-0.6695873, 1.198519, -0.8817216, 0, 0, 1, 1, 1,
-0.6605334, 1.5396, 0.3948189, 1, 0, 0, 1, 1,
-0.6593, -0.338828, -1.99431, 1, 0, 0, 1, 1,
-0.6565151, -0.9086014, -1.799183, 1, 0, 0, 1, 1,
-0.6532602, 0.6671454, 0.2438043, 1, 0, 0, 1, 1,
-0.6527289, -0.1588741, -0.5462113, 1, 0, 0, 1, 1,
-0.6524682, 0.6658192, -1.119488, 0, 0, 0, 1, 1,
-0.6452185, -0.7678486, -0.8538501, 0, 0, 0, 1, 1,
-0.6415946, 0.4965009, -0.9581527, 0, 0, 0, 1, 1,
-0.6399488, -0.6469996, -4.523092, 0, 0, 0, 1, 1,
-0.6339288, 0.9129237, -2.090049, 0, 0, 0, 1, 1,
-0.6335162, -1.799504, -2.599948, 0, 0, 0, 1, 1,
-0.6303477, -1.640458, -2.529197, 0, 0, 0, 1, 1,
-0.6227914, 0.7864637, -2.88943, 1, 1, 1, 1, 1,
-0.622588, 0.4347539, -1.530651, 1, 1, 1, 1, 1,
-0.6157721, 0.535, 0.5239267, 1, 1, 1, 1, 1,
-0.6140132, 1.218878, -1.120983, 1, 1, 1, 1, 1,
-0.6133161, 1.613767, -0.6870654, 1, 1, 1, 1, 1,
-0.6125951, -0.5914417, -1.37276, 1, 1, 1, 1, 1,
-0.6082528, 1.614647, -0.6193661, 1, 1, 1, 1, 1,
-0.6002471, 0.8626503, 1.508234, 1, 1, 1, 1, 1,
-0.6000629, -0.09805587, -3.718201, 1, 1, 1, 1, 1,
-0.5992737, -1.037349, -4.113207, 1, 1, 1, 1, 1,
-0.5970302, 0.6274602, 0.3025278, 1, 1, 1, 1, 1,
-0.5877001, -2.313176, -4.657282, 1, 1, 1, 1, 1,
-0.58737, -1.437009, -1.691254, 1, 1, 1, 1, 1,
-0.5862318, -0.6578049, -3.134012, 1, 1, 1, 1, 1,
-0.5801388, -0.7142178, -1.768995, 1, 1, 1, 1, 1,
-0.5719536, 0.5281285, 1.066814, 0, 0, 1, 1, 1,
-0.5711802, -1.102193, -2.914886, 1, 0, 0, 1, 1,
-0.567766, -1.090226, -1.388104, 1, 0, 0, 1, 1,
-0.5667601, -2.230113, -1.228379, 1, 0, 0, 1, 1,
-0.5667143, -0.9517834, -0.9602289, 1, 0, 0, 1, 1,
-0.5666431, -1.639383, -0.6934259, 1, 0, 0, 1, 1,
-0.5663099, -0.422368, -1.839982, 0, 0, 0, 1, 1,
-0.5627555, -1.839792, -2.76324, 0, 0, 0, 1, 1,
-0.5594882, 0.9862, 1.042425, 0, 0, 0, 1, 1,
-0.5582714, -1.558426, -1.189693, 0, 0, 0, 1, 1,
-0.5581248, -0.03846106, -3.297273, 0, 0, 0, 1, 1,
-0.5570921, -1.568174, -2.41879, 0, 0, 0, 1, 1,
-0.5557564, 0.423793, -1.230274, 0, 0, 0, 1, 1,
-0.5461801, -1.085912, -4.190056, 1, 1, 1, 1, 1,
-0.5404882, 1.113771, 0.2068135, 1, 1, 1, 1, 1,
-0.5387374, -1.412665, -3.131958, 1, 1, 1, 1, 1,
-0.5371348, 1.707443, -2.221588, 1, 1, 1, 1, 1,
-0.5317, -0.5264657, -1.845838, 1, 1, 1, 1, 1,
-0.5278339, 0.8561629, -0.5535838, 1, 1, 1, 1, 1,
-0.5264893, -0.1737764, -2.475199, 1, 1, 1, 1, 1,
-0.526441, -1.198512, -3.247123, 1, 1, 1, 1, 1,
-0.5196545, 0.9311928, -0.4027748, 1, 1, 1, 1, 1,
-0.5173803, -0.641556, -1.547447, 1, 1, 1, 1, 1,
-0.5080063, -0.05959943, -0.9597436, 1, 1, 1, 1, 1,
-0.5039783, -0.0470595, -3.281576, 1, 1, 1, 1, 1,
-0.5035398, 1.208983, -1.740391, 1, 1, 1, 1, 1,
-0.5023903, -0.1406361, -1.981709, 1, 1, 1, 1, 1,
-0.4998576, -0.06243161, -0.2901949, 1, 1, 1, 1, 1,
-0.4956968, 1.518289, 0.8975177, 0, 0, 1, 1, 1,
-0.4951956, -1.045005, -4.062348, 1, 0, 0, 1, 1,
-0.4932919, -0.5766878, -1.861781, 1, 0, 0, 1, 1,
-0.4917738, 0.0915504, 0.05439966, 1, 0, 0, 1, 1,
-0.4888949, -0.1338997, -1.754534, 1, 0, 0, 1, 1,
-0.4837271, 0.486551, -0.7309601, 1, 0, 0, 1, 1,
-0.4757206, 1.679472, 0.310948, 0, 0, 0, 1, 1,
-0.4739003, 0.3623926, -0.7586283, 0, 0, 0, 1, 1,
-0.4707066, -0.8966046, -1.916823, 0, 0, 0, 1, 1,
-0.4646499, -1.502439, -2.358778, 0, 0, 0, 1, 1,
-0.4639755, -0.400479, -2.676625, 0, 0, 0, 1, 1,
-0.4624617, -1.857183, -1.744902, 0, 0, 0, 1, 1,
-0.4531775, 1.721888, -0.0388034, 0, 0, 0, 1, 1,
-0.4499839, 0.4180492, -2.054319, 1, 1, 1, 1, 1,
-0.4498162, -0.7329189, -2.858919, 1, 1, 1, 1, 1,
-0.4458982, -0.8321996, -1.954349, 1, 1, 1, 1, 1,
-0.4389382, 1.803122, -1.989146, 1, 1, 1, 1, 1,
-0.4382817, -0.4085403, -1.66664, 1, 1, 1, 1, 1,
-0.4375675, 1.971906, -0.9405115, 1, 1, 1, 1, 1,
-0.4233254, 0.2466282, -1.793252, 1, 1, 1, 1, 1,
-0.4214846, 1.86827, 0.6373245, 1, 1, 1, 1, 1,
-0.4208084, -0.7024859, -2.119097, 1, 1, 1, 1, 1,
-0.4193574, 0.3581407, -1.048231, 1, 1, 1, 1, 1,
-0.4185549, 0.5851455, 0.7557138, 1, 1, 1, 1, 1,
-0.418149, -1.128891, -3.031776, 1, 1, 1, 1, 1,
-0.4178009, 1.117796, -0.04820365, 1, 1, 1, 1, 1,
-0.414029, -1.174353, -3.485067, 1, 1, 1, 1, 1,
-0.4136136, 0.3865629, 1.033571, 1, 1, 1, 1, 1,
-0.404496, 0.003570775, -0.6284204, 0, 0, 1, 1, 1,
-0.4012851, 0.3203101, -2.481753, 1, 0, 0, 1, 1,
-0.3979184, 1.068289, -0.2206305, 1, 0, 0, 1, 1,
-0.3971836, -1.202316, -2.450265, 1, 0, 0, 1, 1,
-0.3966635, -1.459059, -3.265754, 1, 0, 0, 1, 1,
-0.3965821, 1.025981, -0.8698447, 1, 0, 0, 1, 1,
-0.3875628, -1.750735, -4.634572, 0, 0, 0, 1, 1,
-0.3874544, -2.295137, -2.703015, 0, 0, 0, 1, 1,
-0.386515, -1.458764, -3.11728, 0, 0, 0, 1, 1,
-0.3810147, 0.9470646, 1.5368, 0, 0, 0, 1, 1,
-0.3780475, 1.149577, 1.029506, 0, 0, 0, 1, 1,
-0.3679803, 0.4580598, -0.01965189, 0, 0, 0, 1, 1,
-0.3618673, -1.408614, -3.23719, 0, 0, 0, 1, 1,
-0.3604994, 1.474042, 0.8667181, 1, 1, 1, 1, 1,
-0.3578632, -0.9487199, -3.443918, 1, 1, 1, 1, 1,
-0.3576871, -0.97302, -3.890266, 1, 1, 1, 1, 1,
-0.354947, -1.05704, -0.9373065, 1, 1, 1, 1, 1,
-0.3459585, 0.1777388, -1.922124, 1, 1, 1, 1, 1,
-0.345633, -0.2364871, -2.582637, 1, 1, 1, 1, 1,
-0.3452967, 0.6152309, -1.714121, 1, 1, 1, 1, 1,
-0.3444012, 0.2804969, -0.8063624, 1, 1, 1, 1, 1,
-0.3428123, 1.85032, -0.4062743, 1, 1, 1, 1, 1,
-0.3367549, -0.5731153, -2.414244, 1, 1, 1, 1, 1,
-0.3361998, 2.096522, -0.5590164, 1, 1, 1, 1, 1,
-0.3352661, -0.2744111, -0.678696, 1, 1, 1, 1, 1,
-0.331583, -2.207847, -3.11261, 1, 1, 1, 1, 1,
-0.3306313, -1.022275, -2.791942, 1, 1, 1, 1, 1,
-0.3287752, 1.69651, 0.6836084, 1, 1, 1, 1, 1,
-0.3271686, -0.1398475, -2.107021, 0, 0, 1, 1, 1,
-0.3265273, 1.626571, -0.7006671, 1, 0, 0, 1, 1,
-0.325941, 0.7245445, -2.464702, 1, 0, 0, 1, 1,
-0.3248341, -0.7672617, -1.322662, 1, 0, 0, 1, 1,
-0.3223239, -1.02275, -1.199846, 1, 0, 0, 1, 1,
-0.3145607, -1.139007, -3.254027, 1, 0, 0, 1, 1,
-0.312633, -0.4950566, -2.044919, 0, 0, 0, 1, 1,
-0.3048799, 1.163327, -0.8485758, 0, 0, 0, 1, 1,
-0.3040978, -1.964015, -4.326478, 0, 0, 0, 1, 1,
-0.2968191, -1.040482, -2.361655, 0, 0, 0, 1, 1,
-0.2921578, 0.5576258, 0.5067956, 0, 0, 0, 1, 1,
-0.283752, -0.4483195, -1.462972, 0, 0, 0, 1, 1,
-0.2832954, 0.7106444, 0.3226167, 0, 0, 0, 1, 1,
-0.2794887, -0.5777054, -2.795044, 1, 1, 1, 1, 1,
-0.2793142, 0.2391693, -0.531945, 1, 1, 1, 1, 1,
-0.2781964, 0.5565203, 0.8581281, 1, 1, 1, 1, 1,
-0.277382, 0.6270657, 0.4223009, 1, 1, 1, 1, 1,
-0.2773384, -1.018363, -1.74337, 1, 1, 1, 1, 1,
-0.2771313, -1.36308, -5.117358, 1, 1, 1, 1, 1,
-0.2770016, -0.9883473, -3.853207, 1, 1, 1, 1, 1,
-0.2767009, 1.839664, -0.8728878, 1, 1, 1, 1, 1,
-0.2742956, -0.3054344, -4.178559, 1, 1, 1, 1, 1,
-0.2710229, -0.4018341, -1.886771, 1, 1, 1, 1, 1,
-0.2674631, -1.318532, -3.8412, 1, 1, 1, 1, 1,
-0.2660224, -0.1818243, -3.109389, 1, 1, 1, 1, 1,
-0.2650754, 0.0001544716, -1.435521, 1, 1, 1, 1, 1,
-0.2587184, -0.1485958, -1.930516, 1, 1, 1, 1, 1,
-0.2568509, -1.422533, -2.224929, 1, 1, 1, 1, 1,
-0.2563168, -1.394452, -3.691719, 0, 0, 1, 1, 1,
-0.2476881, 1.350532, 0.8935558, 1, 0, 0, 1, 1,
-0.2402243, 0.3222783, -0.8170246, 1, 0, 0, 1, 1,
-0.2344316, -0.3795754, -1.784464, 1, 0, 0, 1, 1,
-0.2288166, 0.4842913, 0.3658596, 1, 0, 0, 1, 1,
-0.2285339, 1.592495, -0.6445004, 1, 0, 0, 1, 1,
-0.2204442, 1.023209, -0.6793457, 0, 0, 0, 1, 1,
-0.2202393, -0.6661589, -3.609185, 0, 0, 0, 1, 1,
-0.21707, -1.511116, -2.280753, 0, 0, 0, 1, 1,
-0.2139097, -1.201527, -3.60538, 0, 0, 0, 1, 1,
-0.2129759, 0.3578071, -1.442947, 0, 0, 0, 1, 1,
-0.2108629, 0.9118439, -0.2242115, 0, 0, 0, 1, 1,
-0.2080178, 0.7075319, -0.7258599, 0, 0, 0, 1, 1,
-0.2079106, -0.3940822, -2.181531, 1, 1, 1, 1, 1,
-0.2077004, -0.2817714, -2.999768, 1, 1, 1, 1, 1,
-0.2075564, 0.4773761, 0.4016935, 1, 1, 1, 1, 1,
-0.2061543, -0.8525784, -3.5843, 1, 1, 1, 1, 1,
-0.2052868, 1.593824, -0.4194323, 1, 1, 1, 1, 1,
-0.2038745, -0.4204074, -2.962293, 1, 1, 1, 1, 1,
-0.2025606, 1.886406, 0.9046609, 1, 1, 1, 1, 1,
-0.2023508, 0.3340257, 0.4599179, 1, 1, 1, 1, 1,
-0.2005701, -0.5739424, -2.226104, 1, 1, 1, 1, 1,
-0.2004271, -0.08525233, -3.851774, 1, 1, 1, 1, 1,
-0.200252, -0.1940004, -1.238477, 1, 1, 1, 1, 1,
-0.1957767, 1.426442, 0.03240531, 1, 1, 1, 1, 1,
-0.1929493, -1.330037, -2.76491, 1, 1, 1, 1, 1,
-0.1838786, 0.5543027, -0.3857334, 1, 1, 1, 1, 1,
-0.1806262, 0.251164, 0.02127312, 1, 1, 1, 1, 1,
-0.1788784, -0.1988157, -1.979066, 0, 0, 1, 1, 1,
-0.1737095, 0.0316629, -1.100277, 1, 0, 0, 1, 1,
-0.170046, 0.7088263, -0.8324157, 1, 0, 0, 1, 1,
-0.168807, 0.6080837, -0.3961534, 1, 0, 0, 1, 1,
-0.166835, 0.183774, -2.434396, 1, 0, 0, 1, 1,
-0.1661277, -0.06070089, -2.49625, 1, 0, 0, 1, 1,
-0.1653238, 0.7238152, -1.501173, 0, 0, 0, 1, 1,
-0.1620149, -0.7369079, -2.008648, 0, 0, 0, 1, 1,
-0.1611525, -1.575806, -1.500566, 0, 0, 0, 1, 1,
-0.1593633, -0.8907086, -1.720707, 0, 0, 0, 1, 1,
-0.1591398, -1.159221, -3.657903, 0, 0, 0, 1, 1,
-0.15784, -1.08178, -1.984985, 0, 0, 0, 1, 1,
-0.1527332, 1.396615, -1.64466, 0, 0, 0, 1, 1,
-0.1485594, 0.9462067, -0.8434048, 1, 1, 1, 1, 1,
-0.1484632, 0.3472046, -0.5450916, 1, 1, 1, 1, 1,
-0.1469706, 0.177731, -1.10407, 1, 1, 1, 1, 1,
-0.1437636, 0.7340044, 0.3004972, 1, 1, 1, 1, 1,
-0.13784, -0.1379427, -3.010926, 1, 1, 1, 1, 1,
-0.1368551, -1.109419, -4.010126, 1, 1, 1, 1, 1,
-0.1321933, 0.3777254, 0.2854687, 1, 1, 1, 1, 1,
-0.1321471, -1.867861, -3.75573, 1, 1, 1, 1, 1,
-0.1291696, -0.777167, -3.957778, 1, 1, 1, 1, 1,
-0.1280849, 0.697075, -0.495558, 1, 1, 1, 1, 1,
-0.1222656, -1.434896, -1.068687, 1, 1, 1, 1, 1,
-0.1163724, -1.459548, -2.206976, 1, 1, 1, 1, 1,
-0.1150697, -0.2783956, -3.030827, 1, 1, 1, 1, 1,
-0.114743, 0.7426239, -0.6108056, 1, 1, 1, 1, 1,
-0.1144821, 0.5040144, -1.867091, 1, 1, 1, 1, 1,
-0.1083182, 0.5597069, 0.8165265, 0, 0, 1, 1, 1,
-0.103784, 0.6184884, -0.9553944, 1, 0, 0, 1, 1,
-0.08692946, 0.3132761, 0.8904551, 1, 0, 0, 1, 1,
-0.08269564, 0.7470894, 0.8190223, 1, 0, 0, 1, 1,
-0.07970487, -0.5621549, -4.083748, 1, 0, 0, 1, 1,
-0.07893453, -0.2366623, -1.23833, 1, 0, 0, 1, 1,
-0.07855844, -0.6768702, -3.51959, 0, 0, 0, 1, 1,
-0.07801906, 2.202332, -1.958492, 0, 0, 0, 1, 1,
-0.0765368, 0.1664644, -0.5699372, 0, 0, 0, 1, 1,
-0.07594019, 1.408503, -1.043543, 0, 0, 0, 1, 1,
-0.0698309, 1.131391, -2.341839, 0, 0, 0, 1, 1,
-0.06701043, -1.921056, -2.19588, 0, 0, 0, 1, 1,
-0.06457973, -0.7128306, -3.136739, 0, 0, 0, 1, 1,
-0.0645751, 0.2392312, -1.486796, 1, 1, 1, 1, 1,
-0.05748041, 0.3874671, 0.1170997, 1, 1, 1, 1, 1,
-0.05339695, -0.06447878, -3.915493, 1, 1, 1, 1, 1,
-0.04285249, 1.579738, 0.1797347, 1, 1, 1, 1, 1,
-0.04127062, 1.319686, -0.6033466, 1, 1, 1, 1, 1,
-0.04052943, -0.9216607, -4.35489, 1, 1, 1, 1, 1,
-0.03979791, 0.3114918, 0.6614581, 1, 1, 1, 1, 1,
-0.03627018, -0.503276, -2.162728, 1, 1, 1, 1, 1,
-0.03445646, 0.3692751, -0.4846546, 1, 1, 1, 1, 1,
-0.03400229, 1.432256, -0.6625746, 1, 1, 1, 1, 1,
-0.03372239, 0.7522175, -0.408754, 1, 1, 1, 1, 1,
-0.03327968, -2.150747, -4.172182, 1, 1, 1, 1, 1,
-0.02730173, 0.5432857, -0.07889935, 1, 1, 1, 1, 1,
-0.02320823, 1.410253, 0.4819849, 1, 1, 1, 1, 1,
-0.02077856, 0.3121885, 0.1716939, 1, 1, 1, 1, 1,
-0.01975193, -1.412893, -1.584051, 0, 0, 1, 1, 1,
-0.01968853, 0.2895792, -1.320059, 1, 0, 0, 1, 1,
-0.01932978, 1.20928, -0.4998054, 1, 0, 0, 1, 1,
-0.01874935, 1.964567, -0.1226698, 1, 0, 0, 1, 1,
-0.01534639, 0.6442553, -0.1080207, 1, 0, 0, 1, 1,
-0.0129959, 1.352983, -1.879201, 1, 0, 0, 1, 1,
-0.01271443, -1.53346, -4.958219, 0, 0, 0, 1, 1,
-0.007960924, -1.211979, -1.072791, 0, 0, 0, 1, 1,
-0.005871568, -1.459987, -3.334799, 0, 0, 0, 1, 1,
-0.002959938, 1.454983, 1.095511, 0, 0, 0, 1, 1,
-0.0007134235, -0.2401888, -3.103631, 0, 0, 0, 1, 1,
-0.0001922184, -0.5526128, -2.542781, 0, 0, 0, 1, 1,
0.002658787, -0.4512044, 2.919344, 0, 0, 0, 1, 1,
0.01013242, -0.6299218, 2.795463, 1, 1, 1, 1, 1,
0.01031317, -0.7885819, 2.904243, 1, 1, 1, 1, 1,
0.01431628, -1.083686, 3.155732, 1, 1, 1, 1, 1,
0.01466357, 1.565502, -0.4600766, 1, 1, 1, 1, 1,
0.01657599, -0.4007269, 3.542527, 1, 1, 1, 1, 1,
0.01839338, -0.5291378, 3.439732, 1, 1, 1, 1, 1,
0.01977348, 0.6263783, -0.8233311, 1, 1, 1, 1, 1,
0.02012588, 1.112995, -1.248816, 1, 1, 1, 1, 1,
0.02334678, -0.7854485, 4.789406, 1, 1, 1, 1, 1,
0.02523534, 0.1574782, -1.181318, 1, 1, 1, 1, 1,
0.02529246, 1.604322, 0.3392422, 1, 1, 1, 1, 1,
0.02675029, -0.1348323, 2.954354, 1, 1, 1, 1, 1,
0.02858327, 0.8652586, 1.589049, 1, 1, 1, 1, 1,
0.03267846, 0.4187823, 1.565874, 1, 1, 1, 1, 1,
0.03460671, 2.511389, 0.4605316, 1, 1, 1, 1, 1,
0.0390863, -0.8372135, 3.731261, 0, 0, 1, 1, 1,
0.04200925, 0.09889074, 0.5606486, 1, 0, 0, 1, 1,
0.04252116, -0.6659263, 3.227444, 1, 0, 0, 1, 1,
0.04886273, 1.864777, -0.04500858, 1, 0, 0, 1, 1,
0.05137365, -0.1627496, 2.254982, 1, 0, 0, 1, 1,
0.05705712, -1.125278, 4.217774, 1, 0, 0, 1, 1,
0.05821694, 0.1264696, 1.141812, 0, 0, 0, 1, 1,
0.06091831, -0.2003764, 3.724729, 0, 0, 0, 1, 1,
0.06135187, 0.2084223, 1.703622, 0, 0, 0, 1, 1,
0.06149187, -1.610898, 4.296467, 0, 0, 0, 1, 1,
0.06260718, -0.5258719, 2.703331, 0, 0, 0, 1, 1,
0.06321029, 0.8010593, -1.45022, 0, 0, 0, 1, 1,
0.06798824, -1.213157, 1.851715, 0, 0, 0, 1, 1,
0.06802133, -0.02957429, 4.584655, 1, 1, 1, 1, 1,
0.07285938, 0.6427075, -0.2245996, 1, 1, 1, 1, 1,
0.07679535, -0.8185017, 4.909773, 1, 1, 1, 1, 1,
0.0780631, 0.4163061, -0.9993392, 1, 1, 1, 1, 1,
0.07960254, -1.421764, 3.634305, 1, 1, 1, 1, 1,
0.0813796, -0.02943246, 3.574009, 1, 1, 1, 1, 1,
0.08195528, -0.6103103, 0.502103, 1, 1, 1, 1, 1,
0.09243903, 1.411348, -1.158468, 1, 1, 1, 1, 1,
0.0938127, 0.02074997, 0.9020888, 1, 1, 1, 1, 1,
0.0957905, 0.4835679, -0.4672827, 1, 1, 1, 1, 1,
0.09921056, -1.620868, 3.368254, 1, 1, 1, 1, 1,
0.1018057, -1.0161, 3.14793, 1, 1, 1, 1, 1,
0.1033139, 0.9473048, -0.4739717, 1, 1, 1, 1, 1,
0.1035065, 0.3750469, 0.7496305, 1, 1, 1, 1, 1,
0.1072876, -0.0193418, 2.619433, 1, 1, 1, 1, 1,
0.1084079, -0.9566074, 4.40088, 0, 0, 1, 1, 1,
0.1086654, -0.1108074, 1.967335, 1, 0, 0, 1, 1,
0.1089685, 2.158179, -1.41651, 1, 0, 0, 1, 1,
0.1089813, 0.2832582, 0.7487786, 1, 0, 0, 1, 1,
0.1142566, -0.8547544, 1.141052, 1, 0, 0, 1, 1,
0.118352, -0.221552, 1.139048, 1, 0, 0, 1, 1,
0.1207899, -0.6725493, 4.250451, 0, 0, 0, 1, 1,
0.1216212, 0.8705359, 0.1905099, 0, 0, 0, 1, 1,
0.1230035, -0.4223747, 3.985478, 0, 0, 0, 1, 1,
0.1262412, -1.095474, 2.07685, 0, 0, 0, 1, 1,
0.1269188, -0.5989544, 1.753779, 0, 0, 0, 1, 1,
0.132182, 1.003024, -0.1209728, 0, 0, 0, 1, 1,
0.1346689, 0.670506, 1.17257, 0, 0, 0, 1, 1,
0.1355129, 1.29217, -0.3451521, 1, 1, 1, 1, 1,
0.1372129, -0.7015333, 2.1782, 1, 1, 1, 1, 1,
0.1381134, -0.1779997, 3.711358, 1, 1, 1, 1, 1,
0.1433358, 0.5285942, 0.5712334, 1, 1, 1, 1, 1,
0.1434388, 1.468181, 0.4083315, 1, 1, 1, 1, 1,
0.1456295, -0.07634126, 3.47356, 1, 1, 1, 1, 1,
0.1485391, -0.06150136, 1.451916, 1, 1, 1, 1, 1,
0.1492847, -0.4023085, 2.739141, 1, 1, 1, 1, 1,
0.1501875, 0.1028578, -0.1021246, 1, 1, 1, 1, 1,
0.1526372, -0.5013952, 3.413807, 1, 1, 1, 1, 1,
0.1527629, -0.8564465, 3.151399, 1, 1, 1, 1, 1,
0.1535251, -2.040325, 4.889159, 1, 1, 1, 1, 1,
0.1545199, -0.2388405, 1.336463, 1, 1, 1, 1, 1,
0.1609835, 0.1227917, 1.280984, 1, 1, 1, 1, 1,
0.1641574, -0.2329521, 1.732104, 1, 1, 1, 1, 1,
0.1663353, -1.890594, 2.880715, 0, 0, 1, 1, 1,
0.1673116, -0.5522342, 1.549412, 1, 0, 0, 1, 1,
0.174041, 0.05414852, 1.030943, 1, 0, 0, 1, 1,
0.1753718, 0.2797584, -0.5207021, 1, 0, 0, 1, 1,
0.1777237, -0.141661, 4.597293, 1, 0, 0, 1, 1,
0.1779075, 0.6017808, -0.7423187, 1, 0, 0, 1, 1,
0.1788158, -0.2568023, 3.526861, 0, 0, 0, 1, 1,
0.1807653, 0.4723499, -0.5330723, 0, 0, 0, 1, 1,
0.1823509, -0.8357517, 3.245575, 0, 0, 0, 1, 1,
0.1897194, 1.729578, -0.05693336, 0, 0, 0, 1, 1,
0.192886, -0.5453166, 1.571159, 0, 0, 0, 1, 1,
0.1996424, 1.164036, 1.363706, 0, 0, 0, 1, 1,
0.2048398, 2.067772, 0.04324246, 0, 0, 0, 1, 1,
0.2114092, 1.167925, -1.030438, 1, 1, 1, 1, 1,
0.2130487, 0.9250935, -0.3749988, 1, 1, 1, 1, 1,
0.2139795, 0.7823294, -0.8252941, 1, 1, 1, 1, 1,
0.2141151, -0.4752962, 3.760482, 1, 1, 1, 1, 1,
0.2153505, -0.7326667, 1.744737, 1, 1, 1, 1, 1,
0.2166258, 0.2287004, 0.631504, 1, 1, 1, 1, 1,
0.2225937, 0.09296443, 1.776748, 1, 1, 1, 1, 1,
0.2226512, 1.138775, 2.021021, 1, 1, 1, 1, 1,
0.2231457, 0.7574253, 1.273108, 1, 1, 1, 1, 1,
0.2344584, -0.223122, 0.820093, 1, 1, 1, 1, 1,
0.2365355, -0.1341108, 2.405194, 1, 1, 1, 1, 1,
0.2378134, 1.228966, -0.2400824, 1, 1, 1, 1, 1,
0.2404462, 0.4637628, 1.571205, 1, 1, 1, 1, 1,
0.243941, -0.6441258, 2.044919, 1, 1, 1, 1, 1,
0.2448894, 0.2261648, 1.59588, 1, 1, 1, 1, 1,
0.2471727, 0.9402081, -0.5981504, 0, 0, 1, 1, 1,
0.2522304, 0.06978831, 0.1932952, 1, 0, 0, 1, 1,
0.2535048, -0.6590201, 2.008568, 1, 0, 0, 1, 1,
0.2597117, 0.7115099, -0.768395, 1, 0, 0, 1, 1,
0.260326, 0.4574777, 1.023986, 1, 0, 0, 1, 1,
0.2665319, 0.5559546, -0.5277088, 1, 0, 0, 1, 1,
0.2709497, -1.432322, 3.00509, 0, 0, 0, 1, 1,
0.2718215, -0.421214, 2.041501, 0, 0, 0, 1, 1,
0.2724638, -1.045627, 1.864073, 0, 0, 0, 1, 1,
0.2742795, -1.95632, 3.356146, 0, 0, 0, 1, 1,
0.2765206, 0.6660306, 0.7641001, 0, 0, 0, 1, 1,
0.278351, 1.921108, -0.08108263, 0, 0, 0, 1, 1,
0.2858272, 0.04549149, 1.987726, 0, 0, 0, 1, 1,
0.2939572, 1.138245, 0.9079682, 1, 1, 1, 1, 1,
0.2972516, -0.3147055, 2.02076, 1, 1, 1, 1, 1,
0.3013893, 1.429104, -0.6974049, 1, 1, 1, 1, 1,
0.30719, -0.4613028, 1.046912, 1, 1, 1, 1, 1,
0.3095449, -2.00776, 2.45565, 1, 1, 1, 1, 1,
0.3112821, 0.55612, 0.7267774, 1, 1, 1, 1, 1,
0.3116987, -0.232756, 2.021846, 1, 1, 1, 1, 1,
0.3161738, 0.08904026, 1.965672, 1, 1, 1, 1, 1,
0.3204116, 0.726336, 0.1275789, 1, 1, 1, 1, 1,
0.3205182, -2.189, 1.973455, 1, 1, 1, 1, 1,
0.3230206, 0.4108814, 0.8225442, 1, 1, 1, 1, 1,
0.3255379, 1.97869, 0.8426782, 1, 1, 1, 1, 1,
0.3298803, -0.7486573, 4.052191, 1, 1, 1, 1, 1,
0.3306047, 0.7891158, 0.9511545, 1, 1, 1, 1, 1,
0.3323668, -0.1880006, 3.137981, 1, 1, 1, 1, 1,
0.3330387, 1.405136, -1.290848, 0, 0, 1, 1, 1,
0.3357647, -1.237189, 2.83911, 1, 0, 0, 1, 1,
0.3391739, 0.7143341, 0.1418375, 1, 0, 0, 1, 1,
0.3453606, -1.810553, 1.642049, 1, 0, 0, 1, 1,
0.3491641, -0.1382965, 3.168058, 1, 0, 0, 1, 1,
0.349985, 0.7927688, 0.6434346, 1, 0, 0, 1, 1,
0.3508633, -1.364577, 2.649826, 0, 0, 0, 1, 1,
0.3510064, -0.2098173, 2.206159, 0, 0, 0, 1, 1,
0.3553577, 0.6736569, 0.3252298, 0, 0, 0, 1, 1,
0.3562527, 0.2459841, 2.065001, 0, 0, 0, 1, 1,
0.3615201, 0.2782725, 1.354493, 0, 0, 0, 1, 1,
0.3629565, 1.002348, 1.019809, 0, 0, 0, 1, 1,
0.3642993, 0.5523275, 1.534897, 0, 0, 0, 1, 1,
0.3651742, -0.3974773, 0.2169247, 1, 1, 1, 1, 1,
0.3665254, 0.2461274, 0.104289, 1, 1, 1, 1, 1,
0.3679275, 1.401406, 0.4977911, 1, 1, 1, 1, 1,
0.3731501, 0.3648973, 2.031988, 1, 1, 1, 1, 1,
0.3743377, -1.118703, 3.229813, 1, 1, 1, 1, 1,
0.3748307, -0.09799647, 1.975186, 1, 1, 1, 1, 1,
0.377694, -0.5270967, 3.107719, 1, 1, 1, 1, 1,
0.3801518, -1.076706, 0.6875452, 1, 1, 1, 1, 1,
0.3828631, -1.325475, 3.227511, 1, 1, 1, 1, 1,
0.3851078, 0.02186018, -0.66409, 1, 1, 1, 1, 1,
0.3881021, -1.216308, 2.998148, 1, 1, 1, 1, 1,
0.3899556, 1.93409, -0.04149388, 1, 1, 1, 1, 1,
0.3921254, 1.260928, -3.040744, 1, 1, 1, 1, 1,
0.393066, 1.020849, -0.529999, 1, 1, 1, 1, 1,
0.395087, 0.1349313, 0.8428237, 1, 1, 1, 1, 1,
0.397637, 1.345571, 0.3405989, 0, 0, 1, 1, 1,
0.4044859, -0.6689273, 1.569601, 1, 0, 0, 1, 1,
0.4049417, -0.191103, 3.253926, 1, 0, 0, 1, 1,
0.4066794, 0.4473241, 1.385608, 1, 0, 0, 1, 1,
0.4096765, 0.000100714, 0.4938977, 1, 0, 0, 1, 1,
0.410072, -1.027258, 2.967635, 1, 0, 0, 1, 1,
0.4135973, -0.06675547, 2.035035, 0, 0, 0, 1, 1,
0.4151024, 0.8457137, 1.856812, 0, 0, 0, 1, 1,
0.4207245, -0.6665231, 3.145303, 0, 0, 0, 1, 1,
0.4209727, -0.8521094, 2.408148, 0, 0, 0, 1, 1,
0.4234935, -0.6576055, 2.187107, 0, 0, 0, 1, 1,
0.4251238, -0.7515543, 1.90701, 0, 0, 0, 1, 1,
0.4261885, 0.3309382, 1.873993, 0, 0, 0, 1, 1,
0.426897, -0.2249144, 2.928828, 1, 1, 1, 1, 1,
0.4316778, -0.2887726, 2.274681, 1, 1, 1, 1, 1,
0.4323291, 0.1385118, 1.041315, 1, 1, 1, 1, 1,
0.4346686, -1.276062, 3.415407, 1, 1, 1, 1, 1,
0.4356768, 0.02420334, 1.777137, 1, 1, 1, 1, 1,
0.4388311, -1.368093, 2.298332, 1, 1, 1, 1, 1,
0.4405169, -0.9325195, 2.295229, 1, 1, 1, 1, 1,
0.4413953, -0.08467831, 0.7564093, 1, 1, 1, 1, 1,
0.4419695, -0.6727636, 3.094513, 1, 1, 1, 1, 1,
0.4456379, 1.213536, -1.022595, 1, 1, 1, 1, 1,
0.4461416, -0.1315316, 0.5598952, 1, 1, 1, 1, 1,
0.4496554, 1.770284, 0.3934101, 1, 1, 1, 1, 1,
0.4523118, 1.050083, 0.07449436, 1, 1, 1, 1, 1,
0.4560022, -2.523373, 1.691703, 1, 1, 1, 1, 1,
0.4610622, -1.907171, 1.925771, 1, 1, 1, 1, 1,
0.4638327, 0.5544587, 0.3073327, 0, 0, 1, 1, 1,
0.4661335, 1.007852, 0.8178285, 1, 0, 0, 1, 1,
0.4678468, -0.4950679, 2.404657, 1, 0, 0, 1, 1,
0.4742688, -0.6033639, 1.445478, 1, 0, 0, 1, 1,
0.4811331, 1.314139, -0.2446114, 1, 0, 0, 1, 1,
0.4813119, 0.2967235, 0.5673473, 1, 0, 0, 1, 1,
0.4814762, -0.2937682, 2.859603, 0, 0, 0, 1, 1,
0.4818593, 0.7848172, 0.1902734, 0, 0, 0, 1, 1,
0.48693, -0.1421427, 2.107666, 0, 0, 0, 1, 1,
0.4872451, 2.025719, 0.4301634, 0, 0, 0, 1, 1,
0.4923809, 0.3951965, 0.01937906, 0, 0, 0, 1, 1,
0.4930836, 0.6720843, 1.416961, 0, 0, 0, 1, 1,
0.4950182, 1.356487, 1.461171, 0, 0, 0, 1, 1,
0.4968519, -1.062145, 2.783247, 1, 1, 1, 1, 1,
0.4969367, -0.4869025, 4.850586, 1, 1, 1, 1, 1,
0.505662, 0.3260453, 1.767966, 1, 1, 1, 1, 1,
0.5084965, -0.3668362, 1.834206, 1, 1, 1, 1, 1,
0.5134003, -0.2906586, 0.8776571, 1, 1, 1, 1, 1,
0.51557, -0.4330617, 1.086352, 1, 1, 1, 1, 1,
0.5195313, -1.669546, 2.43963, 1, 1, 1, 1, 1,
0.5196732, -1.371854, 3.695663, 1, 1, 1, 1, 1,
0.5245004, 0.7766128, 0.999738, 1, 1, 1, 1, 1,
0.5277779, 0.499678, 0.7910644, 1, 1, 1, 1, 1,
0.5278939, -2.414369, 3.132639, 1, 1, 1, 1, 1,
0.5292314, -0.6228296, 1.758452, 1, 1, 1, 1, 1,
0.5293218, -0.1587077, 1.982084, 1, 1, 1, 1, 1,
0.5353549, -0.1596067, 4.510844, 1, 1, 1, 1, 1,
0.5371268, 0.4151328, 1.457556, 1, 1, 1, 1, 1,
0.5376765, 1.581856, 1.661406, 0, 0, 1, 1, 1,
0.5394508, 1.37904, -0.3912649, 1, 0, 0, 1, 1,
0.5426669, -0.4444826, 2.118744, 1, 0, 0, 1, 1,
0.5525586, 1.119682, 0.1923998, 1, 0, 0, 1, 1,
0.5527654, -0.9713429, 4.08772, 1, 0, 0, 1, 1,
0.5529614, -1.447119, 3.11278, 1, 0, 0, 1, 1,
0.5540898, -1.396218, 3.349437, 0, 0, 0, 1, 1,
0.5550792, -1.396721, 2.966468, 0, 0, 0, 1, 1,
0.5556738, -0.7174911, 1.731927, 0, 0, 0, 1, 1,
0.5619068, 0.1073444, 2.245739, 0, 0, 0, 1, 1,
0.5639387, 1.984831, 0.1639329, 0, 0, 0, 1, 1,
0.5672367, 0.1796257, 2.831261, 0, 0, 0, 1, 1,
0.5697196, 0.5715303, 1.42704, 0, 0, 0, 1, 1,
0.5740612, -1.026917, 2.457626, 1, 1, 1, 1, 1,
0.5751212, 0.009515462, 0.05244718, 1, 1, 1, 1, 1,
0.5764886, -0.6161886, 1.928368, 1, 1, 1, 1, 1,
0.577216, 0.1410783, 1.623066, 1, 1, 1, 1, 1,
0.5786009, 0.5273116, 0.7146121, 1, 1, 1, 1, 1,
0.5791679, -0.6057065, 1.268236, 1, 1, 1, 1, 1,
0.5815241, 1.437554, 0.7063931, 1, 1, 1, 1, 1,
0.5819429, 0.2015426, 0.04841723, 1, 1, 1, 1, 1,
0.5825487, 0.1076257, 0.6386862, 1, 1, 1, 1, 1,
0.5851647, -0.2414382, 2.202836, 1, 1, 1, 1, 1,
0.5899032, 0.3677151, 1.279722, 1, 1, 1, 1, 1,
0.5940989, 0.0729396, 1.775651, 1, 1, 1, 1, 1,
0.5963439, 1.636179, 0.5391529, 1, 1, 1, 1, 1,
0.5995149, -0.4941491, 1.537573, 1, 1, 1, 1, 1,
0.5999773, -0.9571647, 3.20978, 1, 1, 1, 1, 1,
0.6002954, 0.07993546, 1.632939, 0, 0, 1, 1, 1,
0.6031067, -0.3199864, 3.550172, 1, 0, 0, 1, 1,
0.6051636, -0.2692098, 1.805419, 1, 0, 0, 1, 1,
0.6051905, -0.0733835, 1.2987, 1, 0, 0, 1, 1,
0.607189, 1.553431, 0.7215404, 1, 0, 0, 1, 1,
0.6103716, -1.53614, 1.645527, 1, 0, 0, 1, 1,
0.6131975, 1.138575, -0.2081068, 0, 0, 0, 1, 1,
0.6143512, -1.201868, 4.483317, 0, 0, 0, 1, 1,
0.6206661, 0.8054778, 0.05694823, 0, 0, 0, 1, 1,
0.6261448, 1.044461, -0.1541916, 0, 0, 0, 1, 1,
0.6338933, -1.478957, 2.694583, 0, 0, 0, 1, 1,
0.6362949, 1.274174, 1.309199, 0, 0, 0, 1, 1,
0.6374597, 0.7646994, 0.7469825, 0, 0, 0, 1, 1,
0.6377905, 1.33717, 2.185223, 1, 1, 1, 1, 1,
0.6483793, 1.795798, 1.397558, 1, 1, 1, 1, 1,
0.6486493, -2.116191, 2.582736, 1, 1, 1, 1, 1,
0.6508629, 0.4246469, 0.7247636, 1, 1, 1, 1, 1,
0.6546143, -0.09060018, 0.8359217, 1, 1, 1, 1, 1,
0.6594471, 0.6326911, 0.7968682, 1, 1, 1, 1, 1,
0.6599144, -0.6132494, 1.237244, 1, 1, 1, 1, 1,
0.6609907, 0.7870985, 0.1171179, 1, 1, 1, 1, 1,
0.6629803, -0.6295031, 2.621252, 1, 1, 1, 1, 1,
0.6747328, 0.2874913, 0.03173762, 1, 1, 1, 1, 1,
0.6757633, 1.28438, -0.2026017, 1, 1, 1, 1, 1,
0.6771595, -0.9722145, 2.207882, 1, 1, 1, 1, 1,
0.6785907, -0.1558741, 2.097119, 1, 1, 1, 1, 1,
0.6798553, 1.092136, 0.2620939, 1, 1, 1, 1, 1,
0.6802838, 1.329205, 1.481703, 1, 1, 1, 1, 1,
0.680299, 0.8466212, 0.2063037, 0, 0, 1, 1, 1,
0.6834722, 0.7037358, 0.7812835, 1, 0, 0, 1, 1,
0.6884718, -0.4811358, 2.457716, 1, 0, 0, 1, 1,
0.689695, -0.3004031, 2.39763, 1, 0, 0, 1, 1,
0.6924309, -0.8533182, 3.53117, 1, 0, 0, 1, 1,
0.698174, -2.017971, 1.944167, 1, 0, 0, 1, 1,
0.7071046, 0.1554322, 1.538991, 0, 0, 0, 1, 1,
0.708104, -0.2328907, 0.4569358, 0, 0, 0, 1, 1,
0.7095166, -0.02370179, 2.091967, 0, 0, 0, 1, 1,
0.7098328, -0.03802058, 2.556719, 0, 0, 0, 1, 1,
0.710626, 1.008172, -0.6207742, 0, 0, 0, 1, 1,
0.7118168, -0.02036597, 0.6912918, 0, 0, 0, 1, 1,
0.7123184, -1.863387, 3.125238, 0, 0, 0, 1, 1,
0.7163567, 1.201083, 0.6823652, 1, 1, 1, 1, 1,
0.7181839, 0.7262539, 2.007298, 1, 1, 1, 1, 1,
0.7199702, 0.2143447, 2.226887, 1, 1, 1, 1, 1,
0.7213495, 0.5289583, 2.545038, 1, 1, 1, 1, 1,
0.7216772, -1.121889, 2.023514, 1, 1, 1, 1, 1,
0.7218568, -0.8391788, 1.415786, 1, 1, 1, 1, 1,
0.7221093, -0.4025916, 1.683603, 1, 1, 1, 1, 1,
0.7225605, -1.494104, 3.372744, 1, 1, 1, 1, 1,
0.725665, 0.8613034, 0.8944508, 1, 1, 1, 1, 1,
0.7257102, 1.041085, 0.3619624, 1, 1, 1, 1, 1,
0.7296031, 0.2827739, 1.086509, 1, 1, 1, 1, 1,
0.7298738, -1.681981, 3.397326, 1, 1, 1, 1, 1,
0.7326322, 0.7347091, 1.363453, 1, 1, 1, 1, 1,
0.7332116, -0.1568491, 2.06322, 1, 1, 1, 1, 1,
0.7335303, 0.148401, 1.819664, 1, 1, 1, 1, 1,
0.7339703, -0.3943573, 1.947826, 0, 0, 1, 1, 1,
0.7358514, -0.6515826, 1.003116, 1, 0, 0, 1, 1,
0.7405745, 0.5926476, -0.1459595, 1, 0, 0, 1, 1,
0.7454208, -2.066168, 1.025082, 1, 0, 0, 1, 1,
0.7464074, -0.8662195, 1.797489, 1, 0, 0, 1, 1,
0.747176, -0.5872181, 0.9000663, 1, 0, 0, 1, 1,
0.7513612, -0.6228434, 4.29254, 0, 0, 0, 1, 1,
0.7560208, 0.7910624, 2.326555, 0, 0, 0, 1, 1,
0.7575845, -1.298033, 1.647508, 0, 0, 0, 1, 1,
0.7630721, -0.7883691, 0.581647, 0, 0, 0, 1, 1,
0.7670124, 0.2731008, 2.090453, 0, 0, 0, 1, 1,
0.7671267, 0.3199462, 0.7294474, 0, 0, 0, 1, 1,
0.769407, 0.7118615, 0.1387215, 0, 0, 0, 1, 1,
0.7729624, 0.4129082, 2.016854, 1, 1, 1, 1, 1,
0.7734134, -1.586281, 1.743339, 1, 1, 1, 1, 1,
0.775139, -0.2333271, 1.878936, 1, 1, 1, 1, 1,
0.7828694, -0.8543324, 3.849198, 1, 1, 1, 1, 1,
0.7899312, -0.9868608, 2.987332, 1, 1, 1, 1, 1,
0.7926275, -0.5656653, 3.855487, 1, 1, 1, 1, 1,
0.7947155, -0.9141495, 1.81395, 1, 1, 1, 1, 1,
0.797308, 0.1626069, 1.447418, 1, 1, 1, 1, 1,
0.7984437, 1.123706, 0.2026498, 1, 1, 1, 1, 1,
0.8057137, 0.2142471, -1.092276, 1, 1, 1, 1, 1,
0.8154251, -0.2357511, 2.22522, 1, 1, 1, 1, 1,
0.8183376, 0.5575014, 1.059228, 1, 1, 1, 1, 1,
0.8198316, 1.068637, 0.4802319, 1, 1, 1, 1, 1,
0.8221406, -0.4485984, 0.3528756, 1, 1, 1, 1, 1,
0.8230045, 0.9310592, 0.04533581, 1, 1, 1, 1, 1,
0.8245484, 0.09866167, 1.761296, 0, 0, 1, 1, 1,
0.8308238, -1.282304, 3.092814, 1, 0, 0, 1, 1,
0.8325762, -0.4877846, 2.791662, 1, 0, 0, 1, 1,
0.8391066, 1.024984, -0.379514, 1, 0, 0, 1, 1,
0.8407841, 1.491934, -0.4767642, 1, 0, 0, 1, 1,
0.8458741, 0.07814706, 0.5873327, 1, 0, 0, 1, 1,
0.8513343, 0.3678335, 1.486467, 0, 0, 0, 1, 1,
0.8563033, 1.130753, 0.2276846, 0, 0, 0, 1, 1,
0.8619685, -0.2955229, 2.673586, 0, 0, 0, 1, 1,
0.8653283, 1.24388, -0.03997495, 0, 0, 0, 1, 1,
0.8666095, 2.317359, 2.243597, 0, 0, 0, 1, 1,
0.8675026, -0.8134765, 1.349269, 0, 0, 0, 1, 1,
0.8775018, 0.9425761, 1.340342, 0, 0, 0, 1, 1,
0.878397, -0.3187959, 1.679161, 1, 1, 1, 1, 1,
0.8784525, 0.7124456, 1.967623, 1, 1, 1, 1, 1,
0.878636, -0.2473481, 1.363832, 1, 1, 1, 1, 1,
0.8786508, 0.3176586, 3.306466, 1, 1, 1, 1, 1,
0.8830494, -1.152368, 2.879639, 1, 1, 1, 1, 1,
0.889181, -0.5318708, 4.196735, 1, 1, 1, 1, 1,
0.889791, 0.09897365, 1.018323, 1, 1, 1, 1, 1,
0.8941044, -1.080861, 3.455281, 1, 1, 1, 1, 1,
0.8980309, 0.2561272, 0.8782668, 1, 1, 1, 1, 1,
0.900491, 0.3702073, 2.108607, 1, 1, 1, 1, 1,
0.901863, -0.22799, 1.941904, 1, 1, 1, 1, 1,
0.9167492, 1.124784, 1.638251, 1, 1, 1, 1, 1,
0.9181024, -0.2494411, 1.35901, 1, 1, 1, 1, 1,
0.918741, 0.6785688, -0.749002, 1, 1, 1, 1, 1,
0.9213316, -0.5564788, 2.236745, 1, 1, 1, 1, 1,
0.9257632, 2.023654, 0.5635844, 0, 0, 1, 1, 1,
0.9299046, -0.002309271, 2.618478, 1, 0, 0, 1, 1,
0.9351756, 0.2330049, 3.287756, 1, 0, 0, 1, 1,
0.9424371, 0.4847013, 1.598941, 1, 0, 0, 1, 1,
0.945074, 0.326981, 2.896724, 1, 0, 0, 1, 1,
0.9490151, 0.9421481, -0.55934, 1, 0, 0, 1, 1,
0.9515899, -0.4730171, 2.393251, 0, 0, 0, 1, 1,
0.9522957, 0.9597015, 1.498144, 0, 0, 0, 1, 1,
0.9550033, 0.2467201, 0.7539708, 0, 0, 0, 1, 1,
0.963133, -0.7396513, 2.393185, 0, 0, 0, 1, 1,
0.9648228, -1.544173, 1.864149, 0, 0, 0, 1, 1,
0.9696051, -0.6684533, 2.281472, 0, 0, 0, 1, 1,
0.9778135, -0.2518047, 0.5503821, 0, 0, 0, 1, 1,
0.9782171, -0.4360062, 1.505083, 1, 1, 1, 1, 1,
0.9797535, -1.301729, 2.143465, 1, 1, 1, 1, 1,
0.9884802, 1.531449, 0.4394171, 1, 1, 1, 1, 1,
0.9926929, -0.1825432, 1.027224, 1, 1, 1, 1, 1,
1.00267, -0.7653481, 1.071669, 1, 1, 1, 1, 1,
1.008211, 0.5856094, 1.945027, 1, 1, 1, 1, 1,
1.010328, -0.4752846, 1.787174, 1, 1, 1, 1, 1,
1.018707, 1.287299, 0.7794437, 1, 1, 1, 1, 1,
1.020319, 1.281274, 0.6848271, 1, 1, 1, 1, 1,
1.027216, -1.483929, 2.50866, 1, 1, 1, 1, 1,
1.042478, -0.1069678, 2.191502, 1, 1, 1, 1, 1,
1.051473, -0.5108745, 1.962005, 1, 1, 1, 1, 1,
1.052508, 0.9611632, -0.3916372, 1, 1, 1, 1, 1,
1.059759, 0.625789, 2.588239, 1, 1, 1, 1, 1,
1.063393, 0.2787123, -0.01767701, 1, 1, 1, 1, 1,
1.064832, -1.78706, 2.225681, 0, 0, 1, 1, 1,
1.065633, -1.417578, 2.339618, 1, 0, 0, 1, 1,
1.066292, -1.534255, 1.518314, 1, 0, 0, 1, 1,
1.078972, 0.6617766, 2.483514, 1, 0, 0, 1, 1,
1.084207, -0.3310993, -0.2500588, 1, 0, 0, 1, 1,
1.085647, -0.7316661, 1.26735, 1, 0, 0, 1, 1,
1.094182, -0.8671086, 1.918404, 0, 0, 0, 1, 1,
1.107101, -0.1868047, 0.1231263, 0, 0, 0, 1, 1,
1.110439, 0.3527973, 1.577513, 0, 0, 0, 1, 1,
1.111531, 0.275473, 1.709202, 0, 0, 0, 1, 1,
1.120279, -0.3573609, 2.582639, 0, 0, 0, 1, 1,
1.128111, -1.048298, 2.118142, 0, 0, 0, 1, 1,
1.136225, -0.2821558, 1.725525, 0, 0, 0, 1, 1,
1.139623, -1.200904, 2.921209, 1, 1, 1, 1, 1,
1.143677, 0.0006077744, 3.211097, 1, 1, 1, 1, 1,
1.157509, -0.6110907, 1.137409, 1, 1, 1, 1, 1,
1.162818, 0.4431028, 3.010026, 1, 1, 1, 1, 1,
1.172658, 1.145066, 0.449172, 1, 1, 1, 1, 1,
1.175183, 0.1587767, 3.12634, 1, 1, 1, 1, 1,
1.187862, -0.2825713, 1.279038, 1, 1, 1, 1, 1,
1.192613, 1.193108, 1.497285, 1, 1, 1, 1, 1,
1.204228, -1.73661, 2.627819, 1, 1, 1, 1, 1,
1.204467, 0.1472652, -0.1882691, 1, 1, 1, 1, 1,
1.206004, -0.1369551, 0.7310618, 1, 1, 1, 1, 1,
1.209062, -1.834836, 2.596437, 1, 1, 1, 1, 1,
1.21575, -1.267138, 0.7145461, 1, 1, 1, 1, 1,
1.216297, 1.124061, -1.752177, 1, 1, 1, 1, 1,
1.221707, -0.7796703, 3.430136, 1, 1, 1, 1, 1,
1.237884, -1.151478, 2.259235, 0, 0, 1, 1, 1,
1.240437, 0.1885667, 0.4881015, 1, 0, 0, 1, 1,
1.243044, -0.2471162, 0.8292943, 1, 0, 0, 1, 1,
1.243068, 0.798287, 1.491993, 1, 0, 0, 1, 1,
1.251476, 1.134943, 0.7819061, 1, 0, 0, 1, 1,
1.252323, 1.6404, 0.05023455, 1, 0, 0, 1, 1,
1.253566, -1.249847, 2.171001, 0, 0, 0, 1, 1,
1.257087, -0.4165874, 0.6059692, 0, 0, 0, 1, 1,
1.262012, -0.5913608, 2.324889, 0, 0, 0, 1, 1,
1.265695, -0.4967372, 1.365027, 0, 0, 0, 1, 1,
1.269271, -0.1366738, 2.27766, 0, 0, 0, 1, 1,
1.269658, 0.04136391, 3.071236, 0, 0, 0, 1, 1,
1.27432, 0.6100699, 2.100358, 0, 0, 0, 1, 1,
1.275832, 2.358056, 0.8149386, 1, 1, 1, 1, 1,
1.277128, -0.7899262, 2.477534, 1, 1, 1, 1, 1,
1.284659, -1.630047, 2.608766, 1, 1, 1, 1, 1,
1.298982, -0.8790316, 2.591063, 1, 1, 1, 1, 1,
1.342415, 0.5575542, -0.4969147, 1, 1, 1, 1, 1,
1.346278, -0.1266191, 1.78256, 1, 1, 1, 1, 1,
1.347789, 1.504999, 3.125986, 1, 1, 1, 1, 1,
1.349067, 2.002764, 0.7033766, 1, 1, 1, 1, 1,
1.350685, 0.6473122, -0.5627379, 1, 1, 1, 1, 1,
1.35276, -0.4374431, 2.96825, 1, 1, 1, 1, 1,
1.392683, 0.0645353, 1.00152, 1, 1, 1, 1, 1,
1.395201, -0.07895935, 1.268866, 1, 1, 1, 1, 1,
1.396327, 0.07202288, 1.040383, 1, 1, 1, 1, 1,
1.401049, -1.604355, 2.647186, 1, 1, 1, 1, 1,
1.407237, 1.835912, -0.4289767, 1, 1, 1, 1, 1,
1.409857, -0.09657846, 0.5886207, 0, 0, 1, 1, 1,
1.416119, -0.2549155, 2.138197, 1, 0, 0, 1, 1,
1.418573, -1.79049, 1.869443, 1, 0, 0, 1, 1,
1.422627, 0.3167712, 0.6733419, 1, 0, 0, 1, 1,
1.423438, -1.57955, 1.725159, 1, 0, 0, 1, 1,
1.427213, 0.1167395, 3.211103, 1, 0, 0, 1, 1,
1.431391, -1.106684, 2.053531, 0, 0, 0, 1, 1,
1.432136, 1.758574, 1.206236, 0, 0, 0, 1, 1,
1.439217, 1.421659, 1.09119, 0, 0, 0, 1, 1,
1.448934, 0.7260743, 0.1316497, 0, 0, 0, 1, 1,
1.451949, -0.1163475, 0.3632632, 0, 0, 0, 1, 1,
1.460319, -1.100936, 1.363863, 0, 0, 0, 1, 1,
1.462223, 1.603447, 3.591692, 0, 0, 0, 1, 1,
1.469707, -1.069602, 2.7167, 1, 1, 1, 1, 1,
1.481126, 0.09397973, 1.050392, 1, 1, 1, 1, 1,
1.485447, -0.1038961, 0.9067554, 1, 1, 1, 1, 1,
1.511496, 1.503788, -0.5187497, 1, 1, 1, 1, 1,
1.516486, 0.1719756, 1.495981, 1, 1, 1, 1, 1,
1.52856, -0.4276654, 2.488256, 1, 1, 1, 1, 1,
1.534685, 1.161573, 1.46182, 1, 1, 1, 1, 1,
1.54061, -0.3539051, 1.495651, 1, 1, 1, 1, 1,
1.543995, -1.006067, 2.697006, 1, 1, 1, 1, 1,
1.544503, 2.195378, -0.1030802, 1, 1, 1, 1, 1,
1.548083, -0.6854783, 3.985452, 1, 1, 1, 1, 1,
1.548882, 0.6290236, 1.428194, 1, 1, 1, 1, 1,
1.571501, 0.0126263, 1.358721, 1, 1, 1, 1, 1,
1.574258, -0.3649134, 0.08483974, 1, 1, 1, 1, 1,
1.575297, 0.6391351, 0.8992485, 1, 1, 1, 1, 1,
1.588985, 0.5932005, 1.235513, 0, 0, 1, 1, 1,
1.599578, -0.8159739, 1.855057, 1, 0, 0, 1, 1,
1.60155, 0.4081847, 2.374669, 1, 0, 0, 1, 1,
1.624073, -0.9208567, 2.000077, 1, 0, 0, 1, 1,
1.639537, 0.7300347, 1.44199, 1, 0, 0, 1, 1,
1.652968, 0.7767195, 2.162979, 1, 0, 0, 1, 1,
1.66834, 1.217407, 1.811006, 0, 0, 0, 1, 1,
1.676848, -0.2846684, 2.159857, 0, 0, 0, 1, 1,
1.678793, 0.5045834, 0.6658671, 0, 0, 0, 1, 1,
1.688429, -0.2895961, 2.37166, 0, 0, 0, 1, 1,
1.69012, -0.6393049, 2.707607, 0, 0, 0, 1, 1,
1.695205, 0.7935311, 0.6712567, 0, 0, 0, 1, 1,
1.708412, 0.1802545, 0.7449123, 0, 0, 0, 1, 1,
1.723888, 0.6561208, 0.8778167, 1, 1, 1, 1, 1,
1.746171, -0.5373634, 0.197835, 1, 1, 1, 1, 1,
1.764269, 0.07345952, 2.885795, 1, 1, 1, 1, 1,
1.766709, 1.453449, 2.245901, 1, 1, 1, 1, 1,
1.769585, 0.04110089, 0.5373567, 1, 1, 1, 1, 1,
1.772857, -1.258704, 2.432346, 1, 1, 1, 1, 1,
1.778851, 1.577085, 2.148969, 1, 1, 1, 1, 1,
1.779417, 2.159683, -1.104548, 1, 1, 1, 1, 1,
1.785251, -1.233478, 2.891696, 1, 1, 1, 1, 1,
1.791531, -0.2915403, -0.003653407, 1, 1, 1, 1, 1,
1.804626, 1.076956, 1.29435, 1, 1, 1, 1, 1,
1.827103, -2.779678, 1.178453, 1, 1, 1, 1, 1,
1.827625, 0.1107597, 2.435859, 1, 1, 1, 1, 1,
1.858514, -1.64153, 3.207288, 1, 1, 1, 1, 1,
1.864991, 1.662091, 1.50956, 1, 1, 1, 1, 1,
1.91621, -1.872445, 0.4525135, 0, 0, 1, 1, 1,
1.94395, 1.278607, 0.137414, 1, 0, 0, 1, 1,
1.956122, -0.03989948, 1.22387, 1, 0, 0, 1, 1,
1.986686, 0.1308069, 1.343292, 1, 0, 0, 1, 1,
2.036315, 1.511574, 1.4505, 1, 0, 0, 1, 1,
2.055014, 0.4943625, 1.075543, 1, 0, 0, 1, 1,
2.105422, -1.203157, 2.555678, 0, 0, 0, 1, 1,
2.120559, -0.4598907, 3.509078, 0, 0, 0, 1, 1,
2.120882, -0.9860727, 0.8370283, 0, 0, 0, 1, 1,
2.128027, 0.8347054, 1.329881, 0, 0, 0, 1, 1,
2.156064, -0.7585652, 2.439941, 0, 0, 0, 1, 1,
2.184333, -1.834189, 2.16927, 0, 0, 0, 1, 1,
2.221088, -1.515209, 3.067578, 0, 0, 0, 1, 1,
2.261026, 0.3502957, 0.4945455, 1, 1, 1, 1, 1,
2.310378, -0.7058113, 1.097172, 1, 1, 1, 1, 1,
2.343245, 0.07461121, 1.313848, 1, 1, 1, 1, 1,
2.454465, -1.430049, 1.050308, 1, 1, 1, 1, 1,
2.469456, -1.664452, -0.5817504, 1, 1, 1, 1, 1,
2.512149, 0.7594481, 1.517904, 1, 1, 1, 1, 1,
2.690094, 0.8661165, 0.2946775, 1, 1, 1, 1, 1
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
var radius = 8.841993;
var distance = 31.05712;
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
mvMatrix.translate( 0.04391885, 0.1601398, 0.1037924 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -31.05712);
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
