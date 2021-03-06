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
-2.817149, -1.377897, -2.16605, 1, 0, 0, 1,
-2.756233, -0.1979965, 0.1324421, 1, 0.007843138, 0, 1,
-2.62332, -0.3125046, -1.247901, 1, 0.01176471, 0, 1,
-2.504071, -0.505905, -3.150687, 1, 0.01960784, 0, 1,
-2.47063, 1.42712, -1.502971, 1, 0.02352941, 0, 1,
-2.452247, -0.2741299, -1.550992, 1, 0.03137255, 0, 1,
-2.44452, -0.9728069, -3.439177, 1, 0.03529412, 0, 1,
-2.414254, 1.402534, -1.65921, 1, 0.04313726, 0, 1,
-2.361728, -1.498747, -2.271573, 1, 0.04705882, 0, 1,
-2.255691, 1.42915, -0.2497254, 1, 0.05490196, 0, 1,
-2.23773, 1.914515, -0.1899798, 1, 0.05882353, 0, 1,
-2.237693, -0.7093917, -1.1013, 1, 0.06666667, 0, 1,
-2.226842, -0.9523355, -1.855992, 1, 0.07058824, 0, 1,
-2.204549, -1.034268, -1.354679, 1, 0.07843138, 0, 1,
-2.189872, -1.734446, -1.204602, 1, 0.08235294, 0, 1,
-2.189729, 1.729303, -0.265507, 1, 0.09019608, 0, 1,
-2.14032, 0.03713397, -0.9084267, 1, 0.09411765, 0, 1,
-2.113927, 0.2338481, -2.186974, 1, 0.1019608, 0, 1,
-2.09925, -1.212533, -1.80435, 1, 0.1098039, 0, 1,
-2.090324, -0.6042567, -0.3559623, 1, 0.1137255, 0, 1,
-2.069151, 1.403223, -1.38366, 1, 0.1215686, 0, 1,
-2.067327, -1.385458, -0.5591589, 1, 0.1254902, 0, 1,
-2.048821, -0.2391758, -2.181598, 1, 0.1333333, 0, 1,
-2.043606, -0.346, -1.141345, 1, 0.1372549, 0, 1,
-2.043044, 1.117245, -0.4952459, 1, 0.145098, 0, 1,
-2.014948, -0.4413215, -1.706252, 1, 0.1490196, 0, 1,
-1.98756, -0.6200294, -4.24376, 1, 0.1568628, 0, 1,
-1.984188, -1.93162, -2.100935, 1, 0.1607843, 0, 1,
-1.980488, -0.7119548, -2.139267, 1, 0.1686275, 0, 1,
-1.973148, -0.4230621, -3.906102, 1, 0.172549, 0, 1,
-1.966481, -0.5363368, -0.8922392, 1, 0.1803922, 0, 1,
-1.963398, -0.7373212, -1.725363, 1, 0.1843137, 0, 1,
-1.958287, -0.3384896, -1.41174, 1, 0.1921569, 0, 1,
-1.933805, 0.1469472, -2.286955, 1, 0.1960784, 0, 1,
-1.922394, 0.5959975, -0.736993, 1, 0.2039216, 0, 1,
-1.921526, -1.251081, -1.549732, 1, 0.2117647, 0, 1,
-1.909599, -0.5633393, -2.79307, 1, 0.2156863, 0, 1,
-1.901906, -0.3372777, -1.405229, 1, 0.2235294, 0, 1,
-1.896444, -0.834241, -1.83028, 1, 0.227451, 0, 1,
-1.87992, -0.6401584, -3.388348, 1, 0.2352941, 0, 1,
-1.832545, 0.594011, -1.447966, 1, 0.2392157, 0, 1,
-1.820928, -1.303672, -1.839914, 1, 0.2470588, 0, 1,
-1.783689, 1.176805, -1.573585, 1, 0.2509804, 0, 1,
-1.760846, 0.822682, -1.539794, 1, 0.2588235, 0, 1,
-1.757474, 0.9509802, -2.71583, 1, 0.2627451, 0, 1,
-1.749328, 2.405796, 1.099335, 1, 0.2705882, 0, 1,
-1.741756, 0.1615309, -1.115893, 1, 0.2745098, 0, 1,
-1.716666, 0.5534147, -0.5374361, 1, 0.282353, 0, 1,
-1.702949, -0.7598552, -2.315745, 1, 0.2862745, 0, 1,
-1.647117, 0.4086358, -1.817773, 1, 0.2941177, 0, 1,
-1.635054, 0.2790408, -0.677942, 1, 0.3019608, 0, 1,
-1.59775, 1.126247, -0.03346148, 1, 0.3058824, 0, 1,
-1.596773, 1.714573, -2.732237, 1, 0.3137255, 0, 1,
-1.594134, -1.095062, -2.190697, 1, 0.3176471, 0, 1,
-1.585205, 0.03850017, -0.1550891, 1, 0.3254902, 0, 1,
-1.572289, -0.1553759, -1.188887, 1, 0.3294118, 0, 1,
-1.571678, -1.659687, -2.636866, 1, 0.3372549, 0, 1,
-1.567315, 0.04513906, -0.9956608, 1, 0.3411765, 0, 1,
-1.559925, 0.4856611, -0.5015693, 1, 0.3490196, 0, 1,
-1.556615, 0.656763, -2.392201, 1, 0.3529412, 0, 1,
-1.535187, 0.4303627, -1.511371, 1, 0.3607843, 0, 1,
-1.532111, -1.233433, -2.6792, 1, 0.3647059, 0, 1,
-1.531363, 0.1080014, -0.2723127, 1, 0.372549, 0, 1,
-1.527252, -0.5423088, -0.5200395, 1, 0.3764706, 0, 1,
-1.526289, -0.8675532, -3.172101, 1, 0.3843137, 0, 1,
-1.52194, -0.9814845, -2.258583, 1, 0.3882353, 0, 1,
-1.51534, 0.6234846, -0.1051043, 1, 0.3960784, 0, 1,
-1.513376, 1.07471, -0.320232, 1, 0.4039216, 0, 1,
-1.510547, -1.898867, -1.460117, 1, 0.4078431, 0, 1,
-1.507883, -0.3506653, -2.577017, 1, 0.4156863, 0, 1,
-1.507578, -1.058331, -3.749106, 1, 0.4196078, 0, 1,
-1.501263, -0.2129557, -1.46342, 1, 0.427451, 0, 1,
-1.492284, 0.6736442, -3.055766, 1, 0.4313726, 0, 1,
-1.479622, -0.5841132, -3.553791, 1, 0.4392157, 0, 1,
-1.478862, 0.3324504, -2.711954, 1, 0.4431373, 0, 1,
-1.461859, 0.7904119, -0.927396, 1, 0.4509804, 0, 1,
-1.432333, 0.6773561, -0.9219418, 1, 0.454902, 0, 1,
-1.430675, 0.4141793, -1.391255, 1, 0.4627451, 0, 1,
-1.42316, 0.6951247, -2.400803, 1, 0.4666667, 0, 1,
-1.4059, 0.4195462, 0.09664878, 1, 0.4745098, 0, 1,
-1.403256, 0.7866655, -1.480701, 1, 0.4784314, 0, 1,
-1.39896, -0.9056014, -1.952538, 1, 0.4862745, 0, 1,
-1.397303, 0.7323996, -2.476507, 1, 0.4901961, 0, 1,
-1.394929, -1.11953, -2.064636, 1, 0.4980392, 0, 1,
-1.393489, 1.007814, -1.09808, 1, 0.5058824, 0, 1,
-1.372973, 0.1365254, -1.550002, 1, 0.509804, 0, 1,
-1.368303, -1.141178, 0.5508431, 1, 0.5176471, 0, 1,
-1.359587, -1.038663, -0.969112, 1, 0.5215687, 0, 1,
-1.33053, 0.6387523, 0.3402619, 1, 0.5294118, 0, 1,
-1.33049, 1.174545, -3.091922, 1, 0.5333334, 0, 1,
-1.327687, -0.1364207, -1.086644, 1, 0.5411765, 0, 1,
-1.319965, -0.6801176, -1.732341, 1, 0.5450981, 0, 1,
-1.304744, -0.1235707, -2.693606, 1, 0.5529412, 0, 1,
-1.304513, -0.7616323, -2.753013, 1, 0.5568628, 0, 1,
-1.29378, -1.455441, -1.343126, 1, 0.5647059, 0, 1,
-1.292901, 0.5111772, -0.9968691, 1, 0.5686275, 0, 1,
-1.288827, 1.044629, 0.8418499, 1, 0.5764706, 0, 1,
-1.283452, -0.2365827, -2.530863, 1, 0.5803922, 0, 1,
-1.279927, -0.6250964, -1.638786, 1, 0.5882353, 0, 1,
-1.27914, 0.4814184, -1.173299, 1, 0.5921569, 0, 1,
-1.274091, 0.2155228, 0.3733799, 1, 0.6, 0, 1,
-1.272167, -0.1175568, -0.8283606, 1, 0.6078432, 0, 1,
-1.268451, -1.276649, -2.342594, 1, 0.6117647, 0, 1,
-1.263125, -1.515003, -3.219228, 1, 0.6196079, 0, 1,
-1.257209, 1.060409, -2.277757, 1, 0.6235294, 0, 1,
-1.252524, 1.344359, -0.7889151, 1, 0.6313726, 0, 1,
-1.251892, 0.6339745, -0.9660011, 1, 0.6352941, 0, 1,
-1.25189, -0.002137678, -1.482011, 1, 0.6431373, 0, 1,
-1.249593, -0.2300833, -0.11134, 1, 0.6470588, 0, 1,
-1.247738, 0.9958911, -2.116594, 1, 0.654902, 0, 1,
-1.244411, -0.02335001, -3.914023, 1, 0.6588235, 0, 1,
-1.22472, -0.2437586, -1.573698, 1, 0.6666667, 0, 1,
-1.212555, 0.7818472, 0.121038, 1, 0.6705883, 0, 1,
-1.210056, -2.230994, -1.896833, 1, 0.6784314, 0, 1,
-1.209362, 1.153548, -1.4813, 1, 0.682353, 0, 1,
-1.207501, 1.329719, -0.4681557, 1, 0.6901961, 0, 1,
-1.204097, 1.417782, -1.773647, 1, 0.6941177, 0, 1,
-1.20082, -0.4819021, -1.910346, 1, 0.7019608, 0, 1,
-1.199954, -0.03740903, -0.6541552, 1, 0.7098039, 0, 1,
-1.187734, -1.894858, -3.289268, 1, 0.7137255, 0, 1,
-1.186961, 0.3370098, -2.188876, 1, 0.7215686, 0, 1,
-1.183202, -0.6550165, -2.661635, 1, 0.7254902, 0, 1,
-1.180365, 0.1823755, -0.8360243, 1, 0.7333333, 0, 1,
-1.177176, 0.3724813, -1.542139, 1, 0.7372549, 0, 1,
-1.167605, 1.487965, -1.587663, 1, 0.7450981, 0, 1,
-1.15974, -0.9850091, -3.294421, 1, 0.7490196, 0, 1,
-1.159234, -1.180192, -0.525346, 1, 0.7568628, 0, 1,
-1.156377, 0.6028985, 1.276756, 1, 0.7607843, 0, 1,
-1.155977, -1.077428, -3.626172, 1, 0.7686275, 0, 1,
-1.144296, 0.3012546, -0.3625299, 1, 0.772549, 0, 1,
-1.119964, -0.3887011, -2.320491, 1, 0.7803922, 0, 1,
-1.11685, 1.294517, 0.6090239, 1, 0.7843137, 0, 1,
-1.116507, 1.753393, 1.129136, 1, 0.7921569, 0, 1,
-1.113794, -0.42745, -2.624122, 1, 0.7960784, 0, 1,
-1.11029, -0.4405863, -2.181194, 1, 0.8039216, 0, 1,
-1.104807, 0.5076532, -1.614883, 1, 0.8117647, 0, 1,
-1.103454, -0.434553, -1.470347, 1, 0.8156863, 0, 1,
-1.103134, 0.4387298, -1.819465, 1, 0.8235294, 0, 1,
-1.10019, -1.458741, -3.26183, 1, 0.827451, 0, 1,
-1.091277, 0.3273712, -1.175775, 1, 0.8352941, 0, 1,
-1.077739, 0.9016339, 1.335716, 1, 0.8392157, 0, 1,
-1.069696, -1.381418, -2.552504, 1, 0.8470588, 0, 1,
-1.063252, 0.9797356, 1.034971, 1, 0.8509804, 0, 1,
-1.056868, 0.8932554, -0.2736784, 1, 0.8588235, 0, 1,
-1.054222, 0.8075255, -1.050654, 1, 0.8627451, 0, 1,
-1.053202, -0.1248319, -1.105538, 1, 0.8705882, 0, 1,
-1.042795, 0.727752, -1.050074, 1, 0.8745098, 0, 1,
-1.039361, -0.4842859, -1.800786, 1, 0.8823529, 0, 1,
-1.035366, 1.034391, 0.03252397, 1, 0.8862745, 0, 1,
-1.030669, -0.06868292, -1.268659, 1, 0.8941177, 0, 1,
-1.019139, 0.4314678, -1.275009, 1, 0.8980392, 0, 1,
-1.015313, 0.2535611, 0.1276988, 1, 0.9058824, 0, 1,
-0.9930996, -0.1873748, -2.521186, 1, 0.9137255, 0, 1,
-0.9908478, 0.4307869, -0.4888652, 1, 0.9176471, 0, 1,
-0.9877593, -0.1753054, -0.01768047, 1, 0.9254902, 0, 1,
-0.9834521, 0.115036, -1.068847, 1, 0.9294118, 0, 1,
-0.9823187, 2.06112, -0.5743662, 1, 0.9372549, 0, 1,
-0.980292, -1.513549, -3.141952, 1, 0.9411765, 0, 1,
-0.9752885, -0.5654648, -1.268346, 1, 0.9490196, 0, 1,
-0.9361955, -0.4625269, -1.800846, 1, 0.9529412, 0, 1,
-0.932752, 0.97585, -1.329924, 1, 0.9607843, 0, 1,
-0.9297586, -0.3045513, -3.579701, 1, 0.9647059, 0, 1,
-0.929079, -0.2095315, -0.2285935, 1, 0.972549, 0, 1,
-0.9283755, -0.7580529, -0.8923585, 1, 0.9764706, 0, 1,
-0.9278206, 0.2556698, -1.239075, 1, 0.9843137, 0, 1,
-0.9268752, -2.04324, -3.49817, 1, 0.9882353, 0, 1,
-0.9222662, 0.2973923, -1.102201, 1, 0.9960784, 0, 1,
-0.921353, -1.294339, -1.636929, 0.9960784, 1, 0, 1,
-0.9162801, -0.3522734, -1.895172, 0.9921569, 1, 0, 1,
-0.9161058, -1.292173, -3.144796, 0.9843137, 1, 0, 1,
-0.9030268, 1.051895, -1.483796, 0.9803922, 1, 0, 1,
-0.9022692, -0.1359547, -2.714845, 0.972549, 1, 0, 1,
-0.8989129, -0.5146698, -2.947433, 0.9686275, 1, 0, 1,
-0.894816, -0.394258, -1.811181, 0.9607843, 1, 0, 1,
-0.8919047, 0.7652298, -1.526209, 0.9568627, 1, 0, 1,
-0.8916705, 0.7982971, -0.2983575, 0.9490196, 1, 0, 1,
-0.8894442, 0.3766642, -0.8921085, 0.945098, 1, 0, 1,
-0.8884805, -0.5629551, -2.703771, 0.9372549, 1, 0, 1,
-0.8855286, -0.5112421, -0.4969327, 0.9333333, 1, 0, 1,
-0.8805987, 2.652221, -2.013579, 0.9254902, 1, 0, 1,
-0.8777194, 0.2027779, -1.166661, 0.9215686, 1, 0, 1,
-0.872603, 0.4466329, -1.672498, 0.9137255, 1, 0, 1,
-0.8722078, 0.4583368, 0.005000288, 0.9098039, 1, 0, 1,
-0.8679038, -1.178148, -2.484574, 0.9019608, 1, 0, 1,
-0.865076, -0.3436548, -1.66632, 0.8941177, 1, 0, 1,
-0.8637588, -0.7995998, -2.615409, 0.8901961, 1, 0, 1,
-0.8637037, 0.1415531, -2.398334, 0.8823529, 1, 0, 1,
-0.8636878, 0.3557479, 0.1932002, 0.8784314, 1, 0, 1,
-0.8552154, -0.1038907, -3.294657, 0.8705882, 1, 0, 1,
-0.8538205, -1.520906, -3.2704, 0.8666667, 1, 0, 1,
-0.8536681, 2.06512, 0.1706885, 0.8588235, 1, 0, 1,
-0.8523943, 0.6054268, -0.9122969, 0.854902, 1, 0, 1,
-0.8491888, -0.5514929, -2.19765, 0.8470588, 1, 0, 1,
-0.8464867, -0.8825292, -2.523764, 0.8431373, 1, 0, 1,
-0.844198, -1.169733, -3.652172, 0.8352941, 1, 0, 1,
-0.8383781, 0.2967533, -2.604977, 0.8313726, 1, 0, 1,
-0.8337733, -0.04537953, -0.8713743, 0.8235294, 1, 0, 1,
-0.8268207, -0.7331625, -3.457183, 0.8196079, 1, 0, 1,
-0.8205713, 0.1201669, -1.355056, 0.8117647, 1, 0, 1,
-0.8134676, -1.322831, -1.058367, 0.8078431, 1, 0, 1,
-0.8128924, 1.801432, 0.9273348, 0.8, 1, 0, 1,
-0.8102227, -1.402122, -3.080056, 0.7921569, 1, 0, 1,
-0.8044441, -0.5869566, -3.202905, 0.7882353, 1, 0, 1,
-0.8032187, -0.5555708, -4.247672, 0.7803922, 1, 0, 1,
-0.7990214, -1.633521, -1.366197, 0.7764706, 1, 0, 1,
-0.7988182, 0.165253, -0.8152773, 0.7686275, 1, 0, 1,
-0.7951801, 0.2245627, -2.736373, 0.7647059, 1, 0, 1,
-0.7800911, 0.3117438, -1.600567, 0.7568628, 1, 0, 1,
-0.7732024, -1.865255, -1.301715, 0.7529412, 1, 0, 1,
-0.7729276, -0.8966357, -0.5332857, 0.7450981, 1, 0, 1,
-0.7728695, 0.02667164, -1.39936, 0.7411765, 1, 0, 1,
-0.7682758, -0.9103352, -1.798636, 0.7333333, 1, 0, 1,
-0.7587455, 0.7572557, -0.6788173, 0.7294118, 1, 0, 1,
-0.7507987, -1.013031, -1.980602, 0.7215686, 1, 0, 1,
-0.7441513, -0.7250355, -2.363805, 0.7176471, 1, 0, 1,
-0.7282578, 0.5034552, -1.869133, 0.7098039, 1, 0, 1,
-0.7269816, -0.7571086, -0.7711445, 0.7058824, 1, 0, 1,
-0.7268229, 0.9146699, -0.4097443, 0.6980392, 1, 0, 1,
-0.725174, -0.1917148, -2.57848, 0.6901961, 1, 0, 1,
-0.7232264, -0.9810461, -2.179648, 0.6862745, 1, 0, 1,
-0.7215867, 0.3991147, -0.8300541, 0.6784314, 1, 0, 1,
-0.7202783, -0.04363978, -2.048707, 0.6745098, 1, 0, 1,
-0.7202359, -1.93056, -2.721043, 0.6666667, 1, 0, 1,
-0.7149135, -0.2364901, -2.357513, 0.6627451, 1, 0, 1,
-0.7138003, 0.4034474, -0.4125296, 0.654902, 1, 0, 1,
-0.710733, 0.2503374, -2.519636, 0.6509804, 1, 0, 1,
-0.7104359, -0.0173407, -0.3653637, 0.6431373, 1, 0, 1,
-0.709142, -1.27065, -2.843856, 0.6392157, 1, 0, 1,
-0.7037271, -0.7951868, -4.303775, 0.6313726, 1, 0, 1,
-0.7032131, 1.349108, -0.8353203, 0.627451, 1, 0, 1,
-0.7011738, 1.379851, -0.8473685, 0.6196079, 1, 0, 1,
-0.6954303, 0.9438689, 0.4193083, 0.6156863, 1, 0, 1,
-0.6925654, -1.556848, -0.3658541, 0.6078432, 1, 0, 1,
-0.6924132, 0.1034954, -1.219472, 0.6039216, 1, 0, 1,
-0.6904429, 0.9862302, -0.1857546, 0.5960785, 1, 0, 1,
-0.6903407, -0.4067315, -0.9677275, 0.5882353, 1, 0, 1,
-0.6899012, -0.3696673, -1.009397, 0.5843138, 1, 0, 1,
-0.6874697, 0.5894506, 1.029324, 0.5764706, 1, 0, 1,
-0.6847143, 3.121916, -0.104175, 0.572549, 1, 0, 1,
-0.6796538, -1.123982, -3.651515, 0.5647059, 1, 0, 1,
-0.6720359, 2.054142, -1.657697, 0.5607843, 1, 0, 1,
-0.6655806, -0.3273704, -2.381477, 0.5529412, 1, 0, 1,
-0.6592004, 1.366582, -1.283499, 0.5490196, 1, 0, 1,
-0.6550897, -0.9163938, -2.400113, 0.5411765, 1, 0, 1,
-0.6539598, 0.4219021, -1.465439, 0.5372549, 1, 0, 1,
-0.6538414, -1.142495, -3.939859, 0.5294118, 1, 0, 1,
-0.651616, 1.495857, -1.951973, 0.5254902, 1, 0, 1,
-0.6510906, 1.039464, -0.4795201, 0.5176471, 1, 0, 1,
-0.6482956, -1.025852, -1.94879, 0.5137255, 1, 0, 1,
-0.644839, -0.01716055, -1.789009, 0.5058824, 1, 0, 1,
-0.6440077, -0.7288334, -3.873605, 0.5019608, 1, 0, 1,
-0.6431128, 1.385569, -1.309966, 0.4941176, 1, 0, 1,
-0.6426809, 0.7541158, -1.612827, 0.4862745, 1, 0, 1,
-0.6406555, 1.41707, -1.67573, 0.4823529, 1, 0, 1,
-0.6366432, 0.3126346, -2.466689, 0.4745098, 1, 0, 1,
-0.6359228, -0.1949444, -0.9675236, 0.4705882, 1, 0, 1,
-0.6355044, -0.6987208, -2.035929, 0.4627451, 1, 0, 1,
-0.6299645, 0.1707332, -2.0604, 0.4588235, 1, 0, 1,
-0.6231295, 0.3306359, -3.08564, 0.4509804, 1, 0, 1,
-0.6204637, 0.7946431, -1.938654, 0.4470588, 1, 0, 1,
-0.6130676, 1.123464, 0.2935041, 0.4392157, 1, 0, 1,
-0.6101027, -0.05926016, -2.539583, 0.4352941, 1, 0, 1,
-0.6061857, -0.09134759, -1.37475, 0.427451, 1, 0, 1,
-0.6021618, -0.9043005, -3.220884, 0.4235294, 1, 0, 1,
-0.6016649, -0.1371084, -0.4928931, 0.4156863, 1, 0, 1,
-0.5995704, -0.7679799, -2.224917, 0.4117647, 1, 0, 1,
-0.5995098, 1.594794, -0.4376251, 0.4039216, 1, 0, 1,
-0.5990847, -1.309156, -2.267039, 0.3960784, 1, 0, 1,
-0.598684, -3.9698, -2.506924, 0.3921569, 1, 0, 1,
-0.5874022, -0.6577671, -3.644287, 0.3843137, 1, 0, 1,
-0.5870953, -1.705093, -2.320909, 0.3803922, 1, 0, 1,
-0.5823013, 0.2859339, -1.387735, 0.372549, 1, 0, 1,
-0.57788, -2.462589, -2.669072, 0.3686275, 1, 0, 1,
-0.5775651, 0.358147, -3.025504, 0.3607843, 1, 0, 1,
-0.5714446, -0.3294491, -2.7969, 0.3568628, 1, 0, 1,
-0.5706781, -0.3157794, -2.753284, 0.3490196, 1, 0, 1,
-0.5704942, -0.2292535, -2.040006, 0.345098, 1, 0, 1,
-0.5682806, 0.5101643, -2.794498, 0.3372549, 1, 0, 1,
-0.5611447, 0.0720375, -1.931435, 0.3333333, 1, 0, 1,
-0.5573772, -1.287179, -2.566815, 0.3254902, 1, 0, 1,
-0.5518346, 1.193361, -0.09990978, 0.3215686, 1, 0, 1,
-0.5491408, -2.24813, -1.522696, 0.3137255, 1, 0, 1,
-0.5486019, 0.08535816, -1.516857, 0.3098039, 1, 0, 1,
-0.5477914, -2.061844, -4.094021, 0.3019608, 1, 0, 1,
-0.5454544, -0.996976, -2.491414, 0.2941177, 1, 0, 1,
-0.542752, 0.3690651, -2.088945, 0.2901961, 1, 0, 1,
-0.5424461, 1.109589, -0.08446433, 0.282353, 1, 0, 1,
-0.5418785, -0.008549804, -2.775224, 0.2784314, 1, 0, 1,
-0.5383079, -0.06203654, -2.350041, 0.2705882, 1, 0, 1,
-0.5350958, 0.3927536, -1.133915, 0.2666667, 1, 0, 1,
-0.5337594, 0.9671084, -1.483402, 0.2588235, 1, 0, 1,
-0.5312912, -0.08636107, -2.421622, 0.254902, 1, 0, 1,
-0.530847, 0.7885754, -0.4212329, 0.2470588, 1, 0, 1,
-0.5243486, 2.073493, -0.3983414, 0.2431373, 1, 0, 1,
-0.5240468, 2.235381, 0.07672536, 0.2352941, 1, 0, 1,
-0.5165465, -2.773665, -2.631594, 0.2313726, 1, 0, 1,
-0.513384, 0.2646825, -0.7453883, 0.2235294, 1, 0, 1,
-0.5128066, -0.6833183, -2.047306, 0.2196078, 1, 0, 1,
-0.5124688, 0.3670657, -0.5945321, 0.2117647, 1, 0, 1,
-0.5092531, -0.001786884, -2.750899, 0.2078431, 1, 0, 1,
-0.5085162, 0.3226081, 0.2466083, 0.2, 1, 0, 1,
-0.5045418, -0.2189154, -3.169348, 0.1921569, 1, 0, 1,
-0.4985765, -0.3385269, -0.775453, 0.1882353, 1, 0, 1,
-0.4976983, -0.4013222, 0.009737315, 0.1803922, 1, 0, 1,
-0.496047, -1.622553, -2.735185, 0.1764706, 1, 0, 1,
-0.4905663, 0.2326608, -1.403702, 0.1686275, 1, 0, 1,
-0.4866863, 0.921006, -1.990707, 0.1647059, 1, 0, 1,
-0.4845512, 1.92976, -1.312362, 0.1568628, 1, 0, 1,
-0.4798468, 2.247788, -3.235407, 0.1529412, 1, 0, 1,
-0.479489, 0.6731542, -1.206217, 0.145098, 1, 0, 1,
-0.4786572, 0.07494752, -0.9668159, 0.1411765, 1, 0, 1,
-0.4779114, -0.8585767, -3.097725, 0.1333333, 1, 0, 1,
-0.4775381, -0.7255226, -0.9912089, 0.1294118, 1, 0, 1,
-0.4738903, 0.2026875, -0.2912752, 0.1215686, 1, 0, 1,
-0.4720999, -0.137419, -1.180119, 0.1176471, 1, 0, 1,
-0.4681867, -1.708593, -2.747347, 0.1098039, 1, 0, 1,
-0.464415, 0.09444541, -1.932608, 0.1058824, 1, 0, 1,
-0.4642321, -0.6167672, -4.112655, 0.09803922, 1, 0, 1,
-0.4574049, -0.1703345, -0.833612, 0.09019608, 1, 0, 1,
-0.4562203, -1.458208, -3.783637, 0.08627451, 1, 0, 1,
-0.4525033, -0.226271, -3.101562, 0.07843138, 1, 0, 1,
-0.4505139, -0.2089412, -2.069794, 0.07450981, 1, 0, 1,
-0.4479252, -0.08956437, -0.9073932, 0.06666667, 1, 0, 1,
-0.4471442, -0.7278828, -1.787208, 0.0627451, 1, 0, 1,
-0.4470054, -1.083888, -2.221622, 0.05490196, 1, 0, 1,
-0.4458921, -0.6181143, -1.769147, 0.05098039, 1, 0, 1,
-0.4450604, -0.05355152, -1.532285, 0.04313726, 1, 0, 1,
-0.441236, 0.7454353, 0.1486109, 0.03921569, 1, 0, 1,
-0.4370343, 1.160167, 0.06299964, 0.03137255, 1, 0, 1,
-0.4368857, -0.4837328, -3.818336, 0.02745098, 1, 0, 1,
-0.4338461, 1.211755, -1.554217, 0.01960784, 1, 0, 1,
-0.4295818, -1.70396, -4.772114, 0.01568628, 1, 0, 1,
-0.4265299, -0.0942983, -1.007032, 0.007843138, 1, 0, 1,
-0.4217267, 0.1115525, -0.2687178, 0.003921569, 1, 0, 1,
-0.4151485, 0.180453, -0.05014066, 0, 1, 0.003921569, 1,
-0.4149246, 0.4468059, -0.5292754, 0, 1, 0.01176471, 1,
-0.4042146, 0.4821192, -2.118441, 0, 1, 0.01568628, 1,
-0.4040736, -0.4517317, -2.287288, 0, 1, 0.02352941, 1,
-0.3996014, -0.5676721, -2.446066, 0, 1, 0.02745098, 1,
-0.3981219, -0.7289499, -2.927274, 0, 1, 0.03529412, 1,
-0.3973117, -0.9742889, -2.169043, 0, 1, 0.03921569, 1,
-0.3938677, 0.6147714, -0.1779517, 0, 1, 0.04705882, 1,
-0.3936438, -0.9668413, -2.713023, 0, 1, 0.05098039, 1,
-0.3904522, -0.2402934, -2.557, 0, 1, 0.05882353, 1,
-0.3892766, 0.5971356, -2.232496, 0, 1, 0.0627451, 1,
-0.3880084, -2.077493, -2.839908, 0, 1, 0.07058824, 1,
-0.3795823, -1.709804, -3.237536, 0, 1, 0.07450981, 1,
-0.3767051, -0.2786039, -2.682189, 0, 1, 0.08235294, 1,
-0.3747263, 0.189245, -0.425043, 0, 1, 0.08627451, 1,
-0.3685322, 1.177676, 1.304961, 0, 1, 0.09411765, 1,
-0.3683597, 0.3947378, -1.322265, 0, 1, 0.1019608, 1,
-0.3673721, -0.1700818, -2.434081, 0, 1, 0.1058824, 1,
-0.3663659, 0.7120752, -0.6986621, 0, 1, 0.1137255, 1,
-0.362168, 0.1689875, -1.268234, 0, 1, 0.1176471, 1,
-0.3617382, 0.2854522, -1.377254, 0, 1, 0.1254902, 1,
-0.3592119, -1.021924, -2.263566, 0, 1, 0.1294118, 1,
-0.3576358, 0.6305221, 0.009873898, 0, 1, 0.1372549, 1,
-0.3570622, -0.4598061, -2.743368, 0, 1, 0.1411765, 1,
-0.3551126, 0.2126339, -0.03163114, 0, 1, 0.1490196, 1,
-0.3511546, 0.2835732, -0.7067919, 0, 1, 0.1529412, 1,
-0.3493748, -2.176596, -4.257991, 0, 1, 0.1607843, 1,
-0.3485091, -0.3523766, -3.357961, 0, 1, 0.1647059, 1,
-0.3476859, 0.3424952, 0.4865591, 0, 1, 0.172549, 1,
-0.342311, 0.01717315, -0.5939022, 0, 1, 0.1764706, 1,
-0.3396518, -1.462203, -3.038317, 0, 1, 0.1843137, 1,
-0.3391065, -0.1023386, -2.008571, 0, 1, 0.1882353, 1,
-0.3349257, 0.7472231, -0.1789721, 0, 1, 0.1960784, 1,
-0.3345125, -0.4305924, -3.385229, 0, 1, 0.2039216, 1,
-0.3294292, -0.1312733, -2.309881, 0, 1, 0.2078431, 1,
-0.3281651, 0.9082148, 1.654576, 0, 1, 0.2156863, 1,
-0.3277503, -1.393007, -1.997055, 0, 1, 0.2196078, 1,
-0.3251794, 1.054541, -0.4778155, 0, 1, 0.227451, 1,
-0.3242978, -0.2912662, -2.135226, 0, 1, 0.2313726, 1,
-0.3237804, 0.609701, -0.4430655, 0, 1, 0.2392157, 1,
-0.3222861, 0.5851827, 0.2842461, 0, 1, 0.2431373, 1,
-0.3206437, -0.1169439, -2.629958, 0, 1, 0.2509804, 1,
-0.3199993, 1.099927, 0.2853081, 0, 1, 0.254902, 1,
-0.314949, 0.4978877, -0.4816455, 0, 1, 0.2627451, 1,
-0.3138554, -0.7027045, -4.246051, 0, 1, 0.2666667, 1,
-0.310767, -0.8554404, -2.9287, 0, 1, 0.2745098, 1,
-0.3104496, 2.347627, -1.604612, 0, 1, 0.2784314, 1,
-0.3097813, 1.427059, 0.4879156, 0, 1, 0.2862745, 1,
-0.3042785, 1.714314, -0.02913443, 0, 1, 0.2901961, 1,
-0.2988613, -0.9783682, -4.771935, 0, 1, 0.2980392, 1,
-0.2901194, -0.9140895, -4.505354, 0, 1, 0.3058824, 1,
-0.2827931, 0.6589102, -0.2915065, 0, 1, 0.3098039, 1,
-0.2827727, 0.2130127, 0.09616664, 0, 1, 0.3176471, 1,
-0.2826713, 1.61861, -1.061919, 0, 1, 0.3215686, 1,
-0.2809384, -1.130686, -2.846146, 0, 1, 0.3294118, 1,
-0.2794142, -0.4895402, -2.993551, 0, 1, 0.3333333, 1,
-0.2757836, -0.9422598, -3.365943, 0, 1, 0.3411765, 1,
-0.2727298, -0.2547079, -3.272293, 0, 1, 0.345098, 1,
-0.271392, -1.590881, -2.847663, 0, 1, 0.3529412, 1,
-0.2704132, -0.6258169, -2.363336, 0, 1, 0.3568628, 1,
-0.2700735, 1.124164, -0.7925644, 0, 1, 0.3647059, 1,
-0.2684258, -0.2739881, -2.898667, 0, 1, 0.3686275, 1,
-0.2653387, -1.791722, -3.488552, 0, 1, 0.3764706, 1,
-0.2631597, 0.9619756, -0.08680167, 0, 1, 0.3803922, 1,
-0.2599281, -0.2495474, -0.7813405, 0, 1, 0.3882353, 1,
-0.2598687, -1.002754, -2.703101, 0, 1, 0.3921569, 1,
-0.256903, -0.4154652, -3.12826, 0, 1, 0.4, 1,
-0.2562159, 1.232802, 0.3466218, 0, 1, 0.4078431, 1,
-0.2511458, 0.303229, -0.2922792, 0, 1, 0.4117647, 1,
-0.2495275, -2.194307, -3.489755, 0, 1, 0.4196078, 1,
-0.2493134, -1.14398, -3.050186, 0, 1, 0.4235294, 1,
-0.248297, 0.4391083, -0.3457989, 0, 1, 0.4313726, 1,
-0.2469255, -0.6215179, -2.444431, 0, 1, 0.4352941, 1,
-0.2450401, 0.5504385, 0.2182538, 0, 1, 0.4431373, 1,
-0.2387727, 0.2307588, -2.411687, 0, 1, 0.4470588, 1,
-0.238394, -0.5700047, -2.36285, 0, 1, 0.454902, 1,
-0.2371526, 1.580518, -0.3121952, 0, 1, 0.4588235, 1,
-0.2351548, 0.740038, 0.1284471, 0, 1, 0.4666667, 1,
-0.2346843, 1.270434, 1.542107, 0, 1, 0.4705882, 1,
-0.229462, -0.7782051, -3.453596, 0, 1, 0.4784314, 1,
-0.2292845, -0.4800429, -2.332659, 0, 1, 0.4823529, 1,
-0.2287741, 1.216299, 1.949903, 0, 1, 0.4901961, 1,
-0.228125, -0.06658112, -2.141168, 0, 1, 0.4941176, 1,
-0.228112, 0.4085868, -1.163244, 0, 1, 0.5019608, 1,
-0.2273629, 0.3246268, -0.09937814, 0, 1, 0.509804, 1,
-0.2261112, -0.7290685, -4.933714, 0, 1, 0.5137255, 1,
-0.2230511, -1.023132, -4.078421, 0, 1, 0.5215687, 1,
-0.2215465, -0.004807253, -0.1834865, 0, 1, 0.5254902, 1,
-0.2176617, -1.773882, -3.066039, 0, 1, 0.5333334, 1,
-0.2134456, 1.56559, 1.51005, 0, 1, 0.5372549, 1,
-0.2125002, -0.05699331, -1.679102, 0, 1, 0.5450981, 1,
-0.2053062, 0.7204997, -0.2013516, 0, 1, 0.5490196, 1,
-0.205112, -1.725015, -2.797807, 0, 1, 0.5568628, 1,
-0.2045653, -1.881539, -1.595816, 0, 1, 0.5607843, 1,
-0.198789, 0.6792595, -0.3359374, 0, 1, 0.5686275, 1,
-0.1985174, 0.380845, -0.4918472, 0, 1, 0.572549, 1,
-0.1960542, 0.6792786, -1.967409, 0, 1, 0.5803922, 1,
-0.1945803, 0.04979257, -0.08947843, 0, 1, 0.5843138, 1,
-0.1944254, 0.4789603, 0.1889395, 0, 1, 0.5921569, 1,
-0.1908216, -0.6884873, -3.237323, 0, 1, 0.5960785, 1,
-0.1890843, -0.9886328, -1.071502, 0, 1, 0.6039216, 1,
-0.1798536, -0.8350086, -3.596941, 0, 1, 0.6117647, 1,
-0.1756435, -1.725794, -3.275623, 0, 1, 0.6156863, 1,
-0.1724641, 0.2942547, 1.110419, 0, 1, 0.6235294, 1,
-0.1724308, 0.3658887, -0.7167445, 0, 1, 0.627451, 1,
-0.1689363, -0.3125702, -4.191244, 0, 1, 0.6352941, 1,
-0.1633607, 0.6933328, 1.777251, 0, 1, 0.6392157, 1,
-0.1595586, 0.5177704, -0.5106634, 0, 1, 0.6470588, 1,
-0.157406, 1.604596, 1.222993, 0, 1, 0.6509804, 1,
-0.156437, 0.626762, 0.7632143, 0, 1, 0.6588235, 1,
-0.1540871, -0.2009439, -1.568049, 0, 1, 0.6627451, 1,
-0.1482236, -0.3175759, -3.78486, 0, 1, 0.6705883, 1,
-0.1474071, -1.16362, -3.899746, 0, 1, 0.6745098, 1,
-0.1461651, -0.3363155, -3.31397, 0, 1, 0.682353, 1,
-0.1393386, -1.025004, -2.799324, 0, 1, 0.6862745, 1,
-0.138765, -0.8057981, -3.424826, 0, 1, 0.6941177, 1,
-0.1354836, -0.6472619, -3.709892, 0, 1, 0.7019608, 1,
-0.1297613, 2.082217, -0.6687337, 0, 1, 0.7058824, 1,
-0.127439, 0.01873276, -0.1091689, 0, 1, 0.7137255, 1,
-0.1259415, 1.242311, -0.2865384, 0, 1, 0.7176471, 1,
-0.1253758, -0.951322, -1.75899, 0, 1, 0.7254902, 1,
-0.1245956, 1.281707, 0.1296739, 0, 1, 0.7294118, 1,
-0.1196332, -1.409473, -1.834408, 0, 1, 0.7372549, 1,
-0.1115922, -0.7787542, -3.688216, 0, 1, 0.7411765, 1,
-0.1078203, 0.959336, -0.6793376, 0, 1, 0.7490196, 1,
-0.1027959, 0.1283563, -0.09771699, 0, 1, 0.7529412, 1,
-0.1012169, 0.1042922, -0.8907986, 0, 1, 0.7607843, 1,
-0.09960524, -2.006325, -3.592807, 0, 1, 0.7647059, 1,
-0.09717078, -1.57236, -4.363959, 0, 1, 0.772549, 1,
-0.09680294, 0.1906095, -0.5536788, 0, 1, 0.7764706, 1,
-0.09622069, 0.1608377, -0.7289878, 0, 1, 0.7843137, 1,
-0.09553438, -0.7989086, -4.067357, 0, 1, 0.7882353, 1,
-0.09505997, 1.245264, 0.350505, 0, 1, 0.7960784, 1,
-0.09294159, 0.2857602, 0.2715426, 0, 1, 0.8039216, 1,
-0.08876986, 0.2856724, -0.4990531, 0, 1, 0.8078431, 1,
-0.08835431, 2.114285, 1.419385, 0, 1, 0.8156863, 1,
-0.08578203, -1.266082, -2.658737, 0, 1, 0.8196079, 1,
-0.08411658, 2.175017, 0.04245497, 0, 1, 0.827451, 1,
-0.08162992, 0.5309281, 0.3295498, 0, 1, 0.8313726, 1,
-0.08070686, -0.1726355, -2.669746, 0, 1, 0.8392157, 1,
-0.07950573, 1.789336, -0.9330053, 0, 1, 0.8431373, 1,
-0.07771906, -1.164887, -3.096091, 0, 1, 0.8509804, 1,
-0.0771572, -0.5493902, -3.416423, 0, 1, 0.854902, 1,
-0.07344809, 0.3840799, -0.2716201, 0, 1, 0.8627451, 1,
-0.07120355, -0.2788856, -3.887996, 0, 1, 0.8666667, 1,
-0.06890234, 0.06860321, -0.5371594, 0, 1, 0.8745098, 1,
-0.06728493, -0.6400698, -2.634064, 0, 1, 0.8784314, 1,
-0.06627402, 0.3199029, 1.900825, 0, 1, 0.8862745, 1,
-0.06461269, -1.156879, -3.722214, 0, 1, 0.8901961, 1,
-0.06390847, -1.021197, -3.65569, 0, 1, 0.8980392, 1,
-0.06348858, 1.110574, 0.477258, 0, 1, 0.9058824, 1,
-0.06155604, -0.2103463, -2.943471, 0, 1, 0.9098039, 1,
-0.05913159, 0.3879333, 0.1323927, 0, 1, 0.9176471, 1,
-0.05274315, 0.8991398, 0.384601, 0, 1, 0.9215686, 1,
-0.04727129, -1.665149, -2.562595, 0, 1, 0.9294118, 1,
-0.04485648, -2.801982, -4.68118, 0, 1, 0.9333333, 1,
-0.04484256, 0.3207471, 0.4820041, 0, 1, 0.9411765, 1,
-0.04196676, 0.6299653, -0.4729039, 0, 1, 0.945098, 1,
-0.03570713, -0.1052579, -3.663197, 0, 1, 0.9529412, 1,
-0.03382545, 0.9642781, 0.1589577, 0, 1, 0.9568627, 1,
-0.03317915, -1.521256, -3.592426, 0, 1, 0.9647059, 1,
-0.03253276, 1.293821, 1.122675, 0, 1, 0.9686275, 1,
-0.03142171, -0.1956419, -4.122283, 0, 1, 0.9764706, 1,
-0.03114329, 0.4358116, 0.1173749, 0, 1, 0.9803922, 1,
-0.02771411, -0.08480813, -4.796908, 0, 1, 0.9882353, 1,
-0.02638175, -0.3914274, -3.905499, 0, 1, 0.9921569, 1,
-0.02275596, 1.196275, 1.568834, 0, 1, 1, 1,
-0.01332557, 1.135868, 0.5125486, 0, 0.9921569, 1, 1,
-0.01194038, -0.3744028, -4.260267, 0, 0.9882353, 1, 1,
-0.009594846, 0.262752, -0.3957273, 0, 0.9803922, 1, 1,
-0.00692327, -1.914676, -2.358991, 0, 0.9764706, 1, 1,
-0.006916518, -0.448986, -3.513361, 0, 0.9686275, 1, 1,
-0.003871636, -1.912422, -4.499734, 0, 0.9647059, 1, 1,
-0.002768926, -0.2976092, -2.39127, 0, 0.9568627, 1, 1,
0.0001353478, 0.4191619, -2.39095, 0, 0.9529412, 1, 1,
0.006217252, 0.2140691, 0.595979, 0, 0.945098, 1, 1,
0.009318003, 0.7744936, -0.02209973, 0, 0.9411765, 1, 1,
0.01009121, -0.5881732, 3.047717, 0, 0.9333333, 1, 1,
0.01088749, -0.5614501, 3.778698, 0, 0.9294118, 1, 1,
0.01211093, -1.458551, 3.970823, 0, 0.9215686, 1, 1,
0.01245523, -0.2335279, 3.027688, 0, 0.9176471, 1, 1,
0.01556682, 1.961039, -0.2141172, 0, 0.9098039, 1, 1,
0.01907299, 1.955113, 0.2174001, 0, 0.9058824, 1, 1,
0.02253516, 1.328989, -0.7813765, 0, 0.8980392, 1, 1,
0.02382397, -1.404645, 2.36327, 0, 0.8901961, 1, 1,
0.02439357, 0.6193877, 0.3860446, 0, 0.8862745, 1, 1,
0.02490165, -0.0550419, 2.617428, 0, 0.8784314, 1, 1,
0.02820106, 1.11476, -1.575571, 0, 0.8745098, 1, 1,
0.03361766, -0.2719967, 2.536058, 0, 0.8666667, 1, 1,
0.0344409, -1.38923, 2.259629, 0, 0.8627451, 1, 1,
0.03457483, 1.575457, 2.244289, 0, 0.854902, 1, 1,
0.0426617, 0.5996112, 0.6308393, 0, 0.8509804, 1, 1,
0.04418863, -0.5204045, -0.05511841, 0, 0.8431373, 1, 1,
0.04438375, 0.1915253, -0.273727, 0, 0.8392157, 1, 1,
0.04498563, 0.8574803, -0.04414238, 0, 0.8313726, 1, 1,
0.04706972, 0.2108746, 1.10288, 0, 0.827451, 1, 1,
0.04723701, -1.066157, 2.361132, 0, 0.8196079, 1, 1,
0.04772279, -0.8465898, 3.792715, 0, 0.8156863, 1, 1,
0.04933531, 1.365644, 0.2929122, 0, 0.8078431, 1, 1,
0.05151095, 0.6427429, -0.263323, 0, 0.8039216, 1, 1,
0.0515128, 0.4481159, -0.5818896, 0, 0.7960784, 1, 1,
0.05302927, 0.6380996, -0.1915678, 0, 0.7882353, 1, 1,
0.05544784, 1.341217, -0.07167409, 0, 0.7843137, 1, 1,
0.05840515, -1.372555, 5.029777, 0, 0.7764706, 1, 1,
0.06105892, -2.439072, 2.712054, 0, 0.772549, 1, 1,
0.06463771, -1.826963, 3.484718, 0, 0.7647059, 1, 1,
0.06778357, 2.162968, -0.13255, 0, 0.7607843, 1, 1,
0.07218076, 1.355967, -0.6673521, 0, 0.7529412, 1, 1,
0.07246722, 0.540922, 2.654065, 0, 0.7490196, 1, 1,
0.07562973, -0.7030695, 1.542152, 0, 0.7411765, 1, 1,
0.07926961, 0.9199717, 1.02037, 0, 0.7372549, 1, 1,
0.08341819, -2.69217, 1.822699, 0, 0.7294118, 1, 1,
0.08388184, -1.720477, 3.221434, 0, 0.7254902, 1, 1,
0.08404588, 1.348852, -0.6584233, 0, 0.7176471, 1, 1,
0.08923387, -1.171088, 1.162458, 0, 0.7137255, 1, 1,
0.08971056, -0.3499302, 2.38671, 0, 0.7058824, 1, 1,
0.1013718, 0.7513232, -0.1418034, 0, 0.6980392, 1, 1,
0.1021517, -0.1195971, 2.038586, 0, 0.6941177, 1, 1,
0.1035887, 0.809953, 0.6736099, 0, 0.6862745, 1, 1,
0.1061669, 0.02468064, 2.285366, 0, 0.682353, 1, 1,
0.1088106, -0.7124809, 1.533619, 0, 0.6745098, 1, 1,
0.1140518, 0.6503873, -1.918661, 0, 0.6705883, 1, 1,
0.1142933, 2.217975, -0.7675099, 0, 0.6627451, 1, 1,
0.1147659, -0.004609749, 1.469036, 0, 0.6588235, 1, 1,
0.1149654, 0.7954964, 1.845566, 0, 0.6509804, 1, 1,
0.1189829, -0.6533168, 4.301234, 0, 0.6470588, 1, 1,
0.1200211, 0.2365897, -1.407409, 0, 0.6392157, 1, 1,
0.1220876, -1.204157, 2.632605, 0, 0.6352941, 1, 1,
0.1223043, 0.5828823, 0.5274217, 0, 0.627451, 1, 1,
0.1247532, 0.3592325, 1.432358, 0, 0.6235294, 1, 1,
0.1264832, -0.3302493, 1.635591, 0, 0.6156863, 1, 1,
0.1267634, -0.8288295, 1.821542, 0, 0.6117647, 1, 1,
0.1272903, -0.1003709, 0.9364346, 0, 0.6039216, 1, 1,
0.1325384, -1.002755, 4.262313, 0, 0.5960785, 1, 1,
0.1359946, -0.07446713, 1.460185, 0, 0.5921569, 1, 1,
0.1458597, -0.5794361, 3.968447, 0, 0.5843138, 1, 1,
0.1517368, 0.7337137, 0.3390345, 0, 0.5803922, 1, 1,
0.1538356, 0.6252223, 1.078379, 0, 0.572549, 1, 1,
0.1560244, -0.3100797, 0.2785385, 0, 0.5686275, 1, 1,
0.1585746, 0.2561451, 1.380971, 0, 0.5607843, 1, 1,
0.1595133, 1.762657, 0.2972648, 0, 0.5568628, 1, 1,
0.1608753, -0.4605207, 2.489838, 0, 0.5490196, 1, 1,
0.1633959, -0.02694925, 2.168055, 0, 0.5450981, 1, 1,
0.1704779, 0.9500269, -2.467274, 0, 0.5372549, 1, 1,
0.1721025, -1.030506, 2.430812, 0, 0.5333334, 1, 1,
0.1730123, -0.4312457, 3.36992, 0, 0.5254902, 1, 1,
0.1738185, -0.6204995, 1.507882, 0, 0.5215687, 1, 1,
0.1775507, -1.771845, 3.389128, 0, 0.5137255, 1, 1,
0.1779699, -0.8053224, 3.780313, 0, 0.509804, 1, 1,
0.1829675, -0.6490281, 3.309865, 0, 0.5019608, 1, 1,
0.1849153, -0.9593864, 3.49412, 0, 0.4941176, 1, 1,
0.1887324, 0.2863194, 0.2665796, 0, 0.4901961, 1, 1,
0.1909521, -1.46356, 3.443361, 0, 0.4823529, 1, 1,
0.1932382, -0.3339515, 3.300209, 0, 0.4784314, 1, 1,
0.1970079, 0.8535404, 0.5114616, 0, 0.4705882, 1, 1,
0.1993974, 1.508952, 1.20339, 0, 0.4666667, 1, 1,
0.1994311, -0.8246482, 2.023916, 0, 0.4588235, 1, 1,
0.2000177, -0.6968319, 3.837389, 0, 0.454902, 1, 1,
0.2057504, 1.363151, 0.5222182, 0, 0.4470588, 1, 1,
0.2066385, -0.9630632, 3.27256, 0, 0.4431373, 1, 1,
0.2117972, -0.982321, 4.772574, 0, 0.4352941, 1, 1,
0.2127244, 0.006586247, 1.448319, 0, 0.4313726, 1, 1,
0.2164506, -1.601569, 3.405756, 0, 0.4235294, 1, 1,
0.221333, 0.1082031, -0.01096609, 0, 0.4196078, 1, 1,
0.223466, 1.174563, -0.6755479, 0, 0.4117647, 1, 1,
0.2290865, 1.56586, 0.5308847, 0, 0.4078431, 1, 1,
0.2306937, -0.5535043, 0.7403891, 0, 0.4, 1, 1,
0.23386, 0.3718932, -0.209012, 0, 0.3921569, 1, 1,
0.2346707, 0.07047263, 2.805432, 0, 0.3882353, 1, 1,
0.2377672, -0.4198001, 4.35777, 0, 0.3803922, 1, 1,
0.2490357, -0.9494525, 3.009582, 0, 0.3764706, 1, 1,
0.2523634, 1.737788, 0.2903224, 0, 0.3686275, 1, 1,
0.2527162, -0.6240975, 2.182167, 0, 0.3647059, 1, 1,
0.2533678, -1.250884, 3.077012, 0, 0.3568628, 1, 1,
0.2552481, -0.4511438, 1.160718, 0, 0.3529412, 1, 1,
0.2592493, 1.169542, 0.5640675, 0, 0.345098, 1, 1,
0.2662196, -1.573836, 4.328711, 0, 0.3411765, 1, 1,
0.2695662, -1.943779, 2.338188, 0, 0.3333333, 1, 1,
0.2740794, -1.07605, 3.701156, 0, 0.3294118, 1, 1,
0.2802849, -0.8572035, 2.731149, 0, 0.3215686, 1, 1,
0.2905896, -1.488702, 3.552053, 0, 0.3176471, 1, 1,
0.2941916, 0.942432, 1.034167, 0, 0.3098039, 1, 1,
0.2962129, 2.6474, -1.026869, 0, 0.3058824, 1, 1,
0.3034978, -0.7125538, 2.399592, 0, 0.2980392, 1, 1,
0.3076584, -0.7231053, 0.7732145, 0, 0.2901961, 1, 1,
0.317681, -1.908165, 2.294583, 0, 0.2862745, 1, 1,
0.3261508, 0.7911637, -0.2936173, 0, 0.2784314, 1, 1,
0.3263216, -0.4038891, 1.996076, 0, 0.2745098, 1, 1,
0.3284907, 0.6062253, 0.796708, 0, 0.2666667, 1, 1,
0.333285, 1.05922, -0.2328887, 0, 0.2627451, 1, 1,
0.334572, -0.8322164, 1.732513, 0, 0.254902, 1, 1,
0.3358318, 0.4386501, -0.1280681, 0, 0.2509804, 1, 1,
0.3363916, -0.1575592, 1.28197, 0, 0.2431373, 1, 1,
0.3389681, -0.6639253, 3.942019, 0, 0.2392157, 1, 1,
0.3397836, 0.6478106, -0.9669408, 0, 0.2313726, 1, 1,
0.3426766, -0.4586156, 1.952652, 0, 0.227451, 1, 1,
0.3430426, 0.07164552, 2.676095, 0, 0.2196078, 1, 1,
0.3430997, -1.495768, 4.544158, 0, 0.2156863, 1, 1,
0.3434029, 2.362329, -1.522044, 0, 0.2078431, 1, 1,
0.3481861, -0.9367703, 1.73772, 0, 0.2039216, 1, 1,
0.3493102, -1.050309, 4.052196, 0, 0.1960784, 1, 1,
0.3496134, 0.02975227, 0.4546997, 0, 0.1882353, 1, 1,
0.3535776, -0.271033, 1.690151, 0, 0.1843137, 1, 1,
0.3537942, 1.482934, -0.3658047, 0, 0.1764706, 1, 1,
0.3542338, 1.440017, 0.5326432, 0, 0.172549, 1, 1,
0.3572412, 0.2923945, 0.3549409, 0, 0.1647059, 1, 1,
0.3576182, 0.3024647, -0.1908976, 0, 0.1607843, 1, 1,
0.3653148, -2.08309, 2.306251, 0, 0.1529412, 1, 1,
0.3681417, -0.3796378, 2.17506, 0, 0.1490196, 1, 1,
0.3765701, 0.7831286, 0.7983208, 0, 0.1411765, 1, 1,
0.380834, -2.25964, 3.377149, 0, 0.1372549, 1, 1,
0.3815708, -1.494784, 2.680401, 0, 0.1294118, 1, 1,
0.3828013, -0.1965221, 2.663925, 0, 0.1254902, 1, 1,
0.3848449, -0.5389649, 2.103114, 0, 0.1176471, 1, 1,
0.3854016, -0.7420027, 3.017183, 0, 0.1137255, 1, 1,
0.3896, 0.7750281, 1.151659, 0, 0.1058824, 1, 1,
0.3900075, -1.39606, 2.783197, 0, 0.09803922, 1, 1,
0.3940103, 1.013851, -0.3463872, 0, 0.09411765, 1, 1,
0.4069469, 0.3346417, 2.137289, 0, 0.08627451, 1, 1,
0.4091822, 1.875722, -0.1565986, 0, 0.08235294, 1, 1,
0.4098493, -1.684382, 4.37866, 0, 0.07450981, 1, 1,
0.4104075, -0.2647512, 1.686426, 0, 0.07058824, 1, 1,
0.4118002, -1.136795, 3.568684, 0, 0.0627451, 1, 1,
0.4127873, 1.37939, 1.360259, 0, 0.05882353, 1, 1,
0.4157512, 1.870199, -0.2568882, 0, 0.05098039, 1, 1,
0.4197123, 0.879329, 1.369983, 0, 0.04705882, 1, 1,
0.4254078, -0.4222355, 1.972516, 0, 0.03921569, 1, 1,
0.4270475, 0.7206199, 0.2612633, 0, 0.03529412, 1, 1,
0.4348471, -0.313462, 2.22711, 0, 0.02745098, 1, 1,
0.4372094, 0.3562883, 0.05326721, 0, 0.02352941, 1, 1,
0.4411024, 1.240592, 1.46072, 0, 0.01568628, 1, 1,
0.4439836, 0.7238132, -1.102331, 0, 0.01176471, 1, 1,
0.4472769, -0.6491536, 2.712874, 0, 0.003921569, 1, 1,
0.4489147, -0.5397389, 3.188049, 0.003921569, 0, 1, 1,
0.4497662, -0.556399, 1.310764, 0.007843138, 0, 1, 1,
0.4535923, -0.5571983, 2.488828, 0.01568628, 0, 1, 1,
0.4557307, -0.7380152, 2.994667, 0.01960784, 0, 1, 1,
0.4588959, -1.379706, 2.472317, 0.02745098, 0, 1, 1,
0.4603952, 0.8547944, 1.250549, 0.03137255, 0, 1, 1,
0.4659814, -0.9161943, 0.709155, 0.03921569, 0, 1, 1,
0.4665795, 0.4671389, 1.446034, 0.04313726, 0, 1, 1,
0.4735053, -0.2433031, 1.946516, 0.05098039, 0, 1, 1,
0.4739094, 0.3023147, 0.3426811, 0.05490196, 0, 1, 1,
0.4762419, 1.018644, -0.1646987, 0.0627451, 0, 1, 1,
0.4780303, 0.2412944, 1.593216, 0.06666667, 0, 1, 1,
0.4892867, -0.5859758, 2.876818, 0.07450981, 0, 1, 1,
0.4909901, 0.8906873, 1.388751, 0.07843138, 0, 1, 1,
0.4958257, -0.6086113, 1.859995, 0.08627451, 0, 1, 1,
0.4975751, -0.04021325, 1.270668, 0.09019608, 0, 1, 1,
0.5028085, -0.1801226, 1.319077, 0.09803922, 0, 1, 1,
0.5040231, 0.8258685, 2.330048, 0.1058824, 0, 1, 1,
0.5057188, 0.2436851, 1.810492, 0.1098039, 0, 1, 1,
0.5071319, -0.1360585, 2.389344, 0.1176471, 0, 1, 1,
0.5076283, -0.6003624, 2.963508, 0.1215686, 0, 1, 1,
0.5138577, -0.4720963, 2.132731, 0.1294118, 0, 1, 1,
0.514133, 2.318326, 0.08967148, 0.1333333, 0, 1, 1,
0.5173231, 0.999715, -0.3789673, 0.1411765, 0, 1, 1,
0.5173432, -1.663899, 1.934151, 0.145098, 0, 1, 1,
0.5196199, 0.260124, 2.229628, 0.1529412, 0, 1, 1,
0.5258672, 0.1436409, 1.570737, 0.1568628, 0, 1, 1,
0.5268671, 1.230557, -1.799705, 0.1647059, 0, 1, 1,
0.5291895, 0.603495, 1.457054, 0.1686275, 0, 1, 1,
0.5297727, -0.4338812, 1.420299, 0.1764706, 0, 1, 1,
0.5299142, -0.3657123, 2.996108, 0.1803922, 0, 1, 1,
0.5380235, 1.074396, -0.697374, 0.1882353, 0, 1, 1,
0.5391245, 2.328764, 0.5015283, 0.1921569, 0, 1, 1,
0.5469782, -2.504879, 3.45988, 0.2, 0, 1, 1,
0.5500223, -0.2742232, 3.307825, 0.2078431, 0, 1, 1,
0.5507192, 1.250576, 0.2131791, 0.2117647, 0, 1, 1,
0.5565898, -0.4477829, 3.180794, 0.2196078, 0, 1, 1,
0.5602999, 1.093008, -0.2391095, 0.2235294, 0, 1, 1,
0.5616596, -0.09406836, 2.498758, 0.2313726, 0, 1, 1,
0.5626057, -1.462756, 3.252618, 0.2352941, 0, 1, 1,
0.5652444, -0.7803234, 0.6098311, 0.2431373, 0, 1, 1,
0.5676243, -0.2857344, 2.753143, 0.2470588, 0, 1, 1,
0.5709737, 0.435563, -0.08010488, 0.254902, 0, 1, 1,
0.5734338, 0.5170288, 1.463387, 0.2588235, 0, 1, 1,
0.5782983, -0.4429962, 2.154511, 0.2666667, 0, 1, 1,
0.5863088, 0.2429438, 0.05664308, 0.2705882, 0, 1, 1,
0.5913754, -1.120761, 3.055613, 0.2784314, 0, 1, 1,
0.5925963, -0.606358, 2.830203, 0.282353, 0, 1, 1,
0.5962066, 1.643241, 0.3152874, 0.2901961, 0, 1, 1,
0.5974384, 0.6444888, 1.457886, 0.2941177, 0, 1, 1,
0.5981447, 0.5998752, 0.7149559, 0.3019608, 0, 1, 1,
0.5985033, 0.1142984, 4.702765, 0.3098039, 0, 1, 1,
0.6021591, -0.2927068, 4.253016, 0.3137255, 0, 1, 1,
0.6037822, 0.9853579, 1.912741, 0.3215686, 0, 1, 1,
0.6046294, -0.2644336, 0.7347126, 0.3254902, 0, 1, 1,
0.6050375, -1.969118, 3.076106, 0.3333333, 0, 1, 1,
0.6065074, 1.120134, 0.3561206, 0.3372549, 0, 1, 1,
0.6078028, -0.4154139, 2.213309, 0.345098, 0, 1, 1,
0.6136302, -0.07047065, 2.168619, 0.3490196, 0, 1, 1,
0.6162503, -0.9615029, 2.861885, 0.3568628, 0, 1, 1,
0.6199252, -0.5259641, 3.229938, 0.3607843, 0, 1, 1,
0.6212832, 0.05727163, 1.09854, 0.3686275, 0, 1, 1,
0.6227945, -1.420511, 1.74604, 0.372549, 0, 1, 1,
0.6260815, 0.3133215, 2.97403, 0.3803922, 0, 1, 1,
0.6277604, 0.1600428, 2.719886, 0.3843137, 0, 1, 1,
0.6352543, -0.6388675, 2.822088, 0.3921569, 0, 1, 1,
0.6363499, -1.140925, 0.565006, 0.3960784, 0, 1, 1,
0.6401591, 0.3429984, 2.417392, 0.4039216, 0, 1, 1,
0.64115, 0.4826593, 0.5046869, 0.4117647, 0, 1, 1,
0.641875, -0.2655612, 1.91447, 0.4156863, 0, 1, 1,
0.6469232, -0.4842, 2.469921, 0.4235294, 0, 1, 1,
0.660863, 0.06132584, 0.7069362, 0.427451, 0, 1, 1,
0.6642184, 0.1848841, 1.868677, 0.4352941, 0, 1, 1,
0.6698834, 1.3475, 0.8107631, 0.4392157, 0, 1, 1,
0.670689, 0.7176736, 0.5229275, 0.4470588, 0, 1, 1,
0.6732299, -0.2872823, 2.406649, 0.4509804, 0, 1, 1,
0.6735953, 0.2310784, 2.180914, 0.4588235, 0, 1, 1,
0.6749237, -0.1160973, 0.8930239, 0.4627451, 0, 1, 1,
0.6760227, -0.3963702, 2.190526, 0.4705882, 0, 1, 1,
0.6774127, -0.7750287, 0.9965174, 0.4745098, 0, 1, 1,
0.680738, 1.309602, 0.9931907, 0.4823529, 0, 1, 1,
0.6845145, 0.3162081, 1.647962, 0.4862745, 0, 1, 1,
0.6853496, -1.254322, 2.201105, 0.4941176, 0, 1, 1,
0.6906094, -1.985272, 2.300944, 0.5019608, 0, 1, 1,
0.6913623, 0.2302897, 2.365272, 0.5058824, 0, 1, 1,
0.6931998, -0.3900042, -0.2802161, 0.5137255, 0, 1, 1,
0.6961395, -1.609148, 3.557692, 0.5176471, 0, 1, 1,
0.6986185, -1.192078, 2.383378, 0.5254902, 0, 1, 1,
0.7014062, -0.1952243, 1.634396, 0.5294118, 0, 1, 1,
0.7056851, 0.3437711, 2.320742, 0.5372549, 0, 1, 1,
0.7098761, 0.3605568, 1.478938, 0.5411765, 0, 1, 1,
0.7122321, 0.5754719, 1.135897, 0.5490196, 0, 1, 1,
0.7137387, -0.05895057, 3.625344, 0.5529412, 0, 1, 1,
0.7141287, 1.05992, 0.5315877, 0.5607843, 0, 1, 1,
0.7200963, -0.3375284, 2.889576, 0.5647059, 0, 1, 1,
0.7256137, 1.620693, 0.1633714, 0.572549, 0, 1, 1,
0.7270228, -1.446934, 2.195757, 0.5764706, 0, 1, 1,
0.7429363, 2.722761, -0.01969492, 0.5843138, 0, 1, 1,
0.7450447, 0.03319656, 0.2462098, 0.5882353, 0, 1, 1,
0.7456819, 1.102275, 2.270503, 0.5960785, 0, 1, 1,
0.7457528, 0.2556829, 0.8031756, 0.6039216, 0, 1, 1,
0.7553472, 1.561259, 1.043451, 0.6078432, 0, 1, 1,
0.7608858, -2.643162, 4.854449, 0.6156863, 0, 1, 1,
0.7662383, 0.8402561, 1.262534, 0.6196079, 0, 1, 1,
0.7737375, 0.3211292, 0.3651414, 0.627451, 0, 1, 1,
0.7777929, 2.254678, -0.2448712, 0.6313726, 0, 1, 1,
0.7809862, 1.593096, 1.369749, 0.6392157, 0, 1, 1,
0.7812699, -0.1511528, 1.676596, 0.6431373, 0, 1, 1,
0.7818331, -1.270537, 1.312465, 0.6509804, 0, 1, 1,
0.7853287, 0.7582232, 0.09841145, 0.654902, 0, 1, 1,
0.7870255, 0.9759554, -0.7325664, 0.6627451, 0, 1, 1,
0.7888422, 0.2256968, 1.833361, 0.6666667, 0, 1, 1,
0.7890945, -0.02850842, 1.149488, 0.6745098, 0, 1, 1,
0.7919751, -1.712021, 2.384035, 0.6784314, 0, 1, 1,
0.7957849, 0.3432302, 0.7491512, 0.6862745, 0, 1, 1,
0.7996135, -1.450291, 4.540164, 0.6901961, 0, 1, 1,
0.800699, 0.9043942, 0.9290759, 0.6980392, 0, 1, 1,
0.8033808, 0.1519963, 1.128117, 0.7058824, 0, 1, 1,
0.804903, 0.690124, 0.7736141, 0.7098039, 0, 1, 1,
0.807675, -0.4873894, 1.077336, 0.7176471, 0, 1, 1,
0.8079713, 1.286324, 1.782581, 0.7215686, 0, 1, 1,
0.8097363, -0.2041434, 1.816354, 0.7294118, 0, 1, 1,
0.8126454, 0.7554986, -0.801132, 0.7333333, 0, 1, 1,
0.8127816, -0.07009529, 1.500241, 0.7411765, 0, 1, 1,
0.8131858, -0.8979192, 1.905571, 0.7450981, 0, 1, 1,
0.8139785, 1.021013, -0.1481542, 0.7529412, 0, 1, 1,
0.8144338, 0.114724, 0.8324487, 0.7568628, 0, 1, 1,
0.8167362, -0.2180512, 2.721659, 0.7647059, 0, 1, 1,
0.820663, 0.6893604, 0.9625366, 0.7686275, 0, 1, 1,
0.8234978, -0.8765515, 4.141846, 0.7764706, 0, 1, 1,
0.8246075, -0.7352282, 2.578019, 0.7803922, 0, 1, 1,
0.8269563, 1.19909, 1.116903, 0.7882353, 0, 1, 1,
0.833079, 0.9509843, 1.017557, 0.7921569, 0, 1, 1,
0.8376104, -0.2089777, 3.150808, 0.8, 0, 1, 1,
0.8376265, -0.1397659, -0.02609114, 0.8078431, 0, 1, 1,
0.8380122, 0.1688823, 0.1361928, 0.8117647, 0, 1, 1,
0.8393453, -0.3777958, 2.202431, 0.8196079, 0, 1, 1,
0.8425935, 1.707965, 0.3727511, 0.8235294, 0, 1, 1,
0.8527922, 0.6608588, 1.824943, 0.8313726, 0, 1, 1,
0.8530689, 0.6078232, 0.4875487, 0.8352941, 0, 1, 1,
0.8538873, -0.4573462, 1.670131, 0.8431373, 0, 1, 1,
0.8556592, 0.1623733, 1.420699, 0.8470588, 0, 1, 1,
0.8614004, 0.1806793, 3.666885, 0.854902, 0, 1, 1,
0.8707881, -0.8531667, 2.706114, 0.8588235, 0, 1, 1,
0.8728682, -1.25212, 2.480764, 0.8666667, 0, 1, 1,
0.8729628, -0.7653782, 3.102682, 0.8705882, 0, 1, 1,
0.8744084, 0.3722878, 0.5686659, 0.8784314, 0, 1, 1,
0.8793129, 0.6046929, 0.5498616, 0.8823529, 0, 1, 1,
0.8900375, 0.2461032, 0.5631524, 0.8901961, 0, 1, 1,
0.8910067, 1.604584, 1.507162, 0.8941177, 0, 1, 1,
0.8917691, 0.9429851, -0.1748359, 0.9019608, 0, 1, 1,
0.8930901, 0.03484332, 1.883818, 0.9098039, 0, 1, 1,
0.8971624, 0.4178189, 0.6899138, 0.9137255, 0, 1, 1,
0.8999646, 1.075654, -0.8255903, 0.9215686, 0, 1, 1,
0.9102467, -1.555412, 3.043546, 0.9254902, 0, 1, 1,
0.9114401, -0.7751904, 3.159602, 0.9333333, 0, 1, 1,
0.9167405, 1.777165, 2.456682, 0.9372549, 0, 1, 1,
0.9182582, -0.632184, 2.240774, 0.945098, 0, 1, 1,
0.9325848, -0.02204566, 1.802772, 0.9490196, 0, 1, 1,
0.9344089, 0.9913715, 1.352346, 0.9568627, 0, 1, 1,
0.9386364, -1.332597, 1.403824, 0.9607843, 0, 1, 1,
0.9516383, 0.8377093, 1.129227, 0.9686275, 0, 1, 1,
0.9662141, 0.9145894, 1.753678, 0.972549, 0, 1, 1,
0.9698003, -1.15964, 0.2226027, 0.9803922, 0, 1, 1,
0.9816123, 0.1076498, 2.361696, 0.9843137, 0, 1, 1,
0.9908631, 0.9230179, -0.1490926, 0.9921569, 0, 1, 1,
0.9948074, -1.013765, 2.149993, 0.9960784, 0, 1, 1,
0.9951339, -0.4087127, 2.036752, 1, 0, 0.9960784, 1,
0.996602, 0.249907, 2.468128, 1, 0, 0.9882353, 1,
1.006869, 1.058524, 1.062929, 1, 0, 0.9843137, 1,
1.008458, -1.624614, 3.660495, 1, 0, 0.9764706, 1,
1.009036, -1.15178, 2.432121, 1, 0, 0.972549, 1,
1.018907, 0.1763561, 0.8560371, 1, 0, 0.9647059, 1,
1.019528, 1.569032, 2.124992, 1, 0, 0.9607843, 1,
1.027038, 0.6210052, 2.188272, 1, 0, 0.9529412, 1,
1.027161, -0.2798953, -0.1978271, 1, 0, 0.9490196, 1,
1.030567, -1.789504, 1.937979, 1, 0, 0.9411765, 1,
1.033734, 1.082793, 0.2732762, 1, 0, 0.9372549, 1,
1.037559, -1.810225, 2.708977, 1, 0, 0.9294118, 1,
1.047132, -0.1589768, 1.998459, 1, 0, 0.9254902, 1,
1.048634, 0.09465503, 0.8310427, 1, 0, 0.9176471, 1,
1.048821, 1.159128, 0.5133844, 1, 0, 0.9137255, 1,
1.048843, 0.1605195, 1.274882, 1, 0, 0.9058824, 1,
1.050851, 0.3318373, -0.6886945, 1, 0, 0.9019608, 1,
1.05379, 0.2948915, 1.07873, 1, 0, 0.8941177, 1,
1.054618, 1.54702, 1.38344, 1, 0, 0.8862745, 1,
1.059154, 0.1503524, 0.5738051, 1, 0, 0.8823529, 1,
1.060372, -1.744455, 2.681303, 1, 0, 0.8745098, 1,
1.061172, -0.9271813, 2.425806, 1, 0, 0.8705882, 1,
1.061291, -0.5762829, 2.51487, 1, 0, 0.8627451, 1,
1.069206, 0.5595962, 0.2975262, 1, 0, 0.8588235, 1,
1.074163, -0.3374541, 1.008117, 1, 0, 0.8509804, 1,
1.075938, 0.2095588, 1.307003, 1, 0, 0.8470588, 1,
1.078921, 1.762353, -0.225625, 1, 0, 0.8392157, 1,
1.084137, 1.597585, 1.017618, 1, 0, 0.8352941, 1,
1.084706, 0.282884, 1.299177, 1, 0, 0.827451, 1,
1.084883, -0.5517549, 2.60026, 1, 0, 0.8235294, 1,
1.084918, 0.7422199, 2.622214, 1, 0, 0.8156863, 1,
1.092797, 0.2449954, 1.521955, 1, 0, 0.8117647, 1,
1.095887, 0.3797807, 0.02296109, 1, 0, 0.8039216, 1,
1.101358, 0.2785114, 1.064754, 1, 0, 0.7960784, 1,
1.128243, -0.9972556, 3.888568, 1, 0, 0.7921569, 1,
1.1296, 0.0963162, 0.5822181, 1, 0, 0.7843137, 1,
1.130737, 0.703258, -0.3994663, 1, 0, 0.7803922, 1,
1.145028, -0.546014, 1.61239, 1, 0, 0.772549, 1,
1.146704, -0.791966, 0.6017674, 1, 0, 0.7686275, 1,
1.148176, -0.05564639, 1.316894, 1, 0, 0.7607843, 1,
1.160112, 0.1976184, -0.510314, 1, 0, 0.7568628, 1,
1.161549, 0.5148947, 0.6563145, 1, 0, 0.7490196, 1,
1.16628, -0.9894918, 1.808943, 1, 0, 0.7450981, 1,
1.170266, -1.428535, 2.228148, 1, 0, 0.7372549, 1,
1.171407, -0.03638738, 2.03166, 1, 0, 0.7333333, 1,
1.174706, 0.4839022, 1.683939, 1, 0, 0.7254902, 1,
1.179116, -0.8148431, 1.008224, 1, 0, 0.7215686, 1,
1.18118, 1.270849, 0.9994758, 1, 0, 0.7137255, 1,
1.198343, -0.6822651, 1.514436, 1, 0, 0.7098039, 1,
1.206671, 0.4981558, 0.3774413, 1, 0, 0.7019608, 1,
1.208135, -1.575558, 2.563553, 1, 0, 0.6941177, 1,
1.219501, -1.05486, -0.04437706, 1, 0, 0.6901961, 1,
1.221649, 0.4810306, 0.7251145, 1, 0, 0.682353, 1,
1.223696, 2.1465, 0.04855558, 1, 0, 0.6784314, 1,
1.22605, -0.9661748, 2.727482, 1, 0, 0.6705883, 1,
1.226392, -0.07712077, 2.929998, 1, 0, 0.6666667, 1,
1.226569, -1.571454, 2.534983, 1, 0, 0.6588235, 1,
1.227334, -0.1446041, 0.1599759, 1, 0, 0.654902, 1,
1.230298, 1.047782, 2.141124, 1, 0, 0.6470588, 1,
1.232695, -0.3348753, 3.330967, 1, 0, 0.6431373, 1,
1.235747, -0.3697105, 1.953017, 1, 0, 0.6352941, 1,
1.249837, -0.406139, 1.975529, 1, 0, 0.6313726, 1,
1.25468, -1.068202, 2.435712, 1, 0, 0.6235294, 1,
1.257413, -0.7669075, 4.00816, 1, 0, 0.6196079, 1,
1.257581, -0.8424795, 0.6440919, 1, 0, 0.6117647, 1,
1.258654, -0.4657026, 1.901828, 1, 0, 0.6078432, 1,
1.259285, -0.3931074, 0.6418443, 1, 0, 0.6, 1,
1.271559, -0.9978341, 3.575723, 1, 0, 0.5921569, 1,
1.2744, 0.7182338, 0.08356134, 1, 0, 0.5882353, 1,
1.275894, -1.172281, 2.414574, 1, 0, 0.5803922, 1,
1.277979, 0.2955459, 1.745292, 1, 0, 0.5764706, 1,
1.279172, -0.4590484, 3.526906, 1, 0, 0.5686275, 1,
1.29027, 2.116334, 0.2860814, 1, 0, 0.5647059, 1,
1.293953, -1.624735, 4.231625, 1, 0, 0.5568628, 1,
1.295603, 0.3802475, 1.330564, 1, 0, 0.5529412, 1,
1.314592, 1.595568, 2.092182, 1, 0, 0.5450981, 1,
1.324678, 0.5201588, 0.3143432, 1, 0, 0.5411765, 1,
1.338129, -0.5592425, 2.035503, 1, 0, 0.5333334, 1,
1.345166, 0.1091122, 3.657641, 1, 0, 0.5294118, 1,
1.349197, 1.219867, 1.246421, 1, 0, 0.5215687, 1,
1.35989, 0.3887051, 2.724625, 1, 0, 0.5176471, 1,
1.375211, 1.137773, 1.078216, 1, 0, 0.509804, 1,
1.378362, 0.31429, 1.391332, 1, 0, 0.5058824, 1,
1.414922, 0.586232, 1.241746, 1, 0, 0.4980392, 1,
1.417321, 0.2649931, 1.407604, 1, 0, 0.4901961, 1,
1.421897, -0.6073101, 1.085371, 1, 0, 0.4862745, 1,
1.430734, 1.288666, -0.5891746, 1, 0, 0.4784314, 1,
1.458036, 1.74279, 0.6526495, 1, 0, 0.4745098, 1,
1.459033, -0.0745295, 2.069802, 1, 0, 0.4666667, 1,
1.465054, -3.024861, 1.160032, 1, 0, 0.4627451, 1,
1.466823, 0.9051256, 1.962935, 1, 0, 0.454902, 1,
1.467665, 1.210196, 1.399307, 1, 0, 0.4509804, 1,
1.468261, -0.5814746, 2.301501, 1, 0, 0.4431373, 1,
1.470462, -0.06366901, 1.241425, 1, 0, 0.4392157, 1,
1.470789, -0.9577186, 2.426326, 1, 0, 0.4313726, 1,
1.478519, -0.4411227, 2.202258, 1, 0, 0.427451, 1,
1.487583, 0.5444115, 0.6906717, 1, 0, 0.4196078, 1,
1.490813, -1.153749, 2.279524, 1, 0, 0.4156863, 1,
1.491479, 0.1982716, 2.795016, 1, 0, 0.4078431, 1,
1.509862, -0.6238357, 3.369549, 1, 0, 0.4039216, 1,
1.518541, -1.740904, 0.8617356, 1, 0, 0.3960784, 1,
1.520904, 0.6418468, 1.235723, 1, 0, 0.3882353, 1,
1.526519, 1.687201, 1.27127, 1, 0, 0.3843137, 1,
1.537056, -1.16447, 1.929325, 1, 0, 0.3764706, 1,
1.557534, 0.383314, 0.4028518, 1, 0, 0.372549, 1,
1.559201, -1.874007, 0.6093161, 1, 0, 0.3647059, 1,
1.5836, -0.3163578, 2.771514, 1, 0, 0.3607843, 1,
1.587303, 0.4914785, 1.786324, 1, 0, 0.3529412, 1,
1.595405, -0.7748722, 2.428772, 1, 0, 0.3490196, 1,
1.598538, 0.4222327, 2.096295, 1, 0, 0.3411765, 1,
1.600331, 0.6151995, 2.437709, 1, 0, 0.3372549, 1,
1.607215, -0.1197364, 2.787227, 1, 0, 0.3294118, 1,
1.628034, -0.08478171, 1.886344, 1, 0, 0.3254902, 1,
1.634612, -0.6271414, 1.13164, 1, 0, 0.3176471, 1,
1.637038, -0.8596285, 2.600992, 1, 0, 0.3137255, 1,
1.638951, 0.05113018, 2.049522, 1, 0, 0.3058824, 1,
1.651161, -0.6040845, 1.943437, 1, 0, 0.2980392, 1,
1.653243, -0.7254925, 1.666387, 1, 0, 0.2941177, 1,
1.654484, 0.007235649, 2.316607, 1, 0, 0.2862745, 1,
1.664531, 0.3398353, 3.345196, 1, 0, 0.282353, 1,
1.667926, 0.5330824, 0.7300969, 1, 0, 0.2745098, 1,
1.690719, -1.663302, 2.260071, 1, 0, 0.2705882, 1,
1.697517, 1.798698, 0.7689164, 1, 0, 0.2627451, 1,
1.698515, 1.092094, -0.5150118, 1, 0, 0.2588235, 1,
1.70891, 0.8691951, 1.078763, 1, 0, 0.2509804, 1,
1.717235, -0.2240342, 2.834925, 1, 0, 0.2470588, 1,
1.733104, -1.335996, 2.42923, 1, 0, 0.2392157, 1,
1.73907, -0.1915402, 1.094445, 1, 0, 0.2352941, 1,
1.743331, 0.8431662, 1.264523, 1, 0, 0.227451, 1,
1.745573, 0.137297, 0.8304755, 1, 0, 0.2235294, 1,
1.747434, 0.5660439, -0.430253, 1, 0, 0.2156863, 1,
1.756156, -0.8750975, 2.532317, 1, 0, 0.2117647, 1,
1.768679, -0.1029995, 2.663699, 1, 0, 0.2039216, 1,
1.769326, -0.1501315, 1.293319, 1, 0, 0.1960784, 1,
1.77341, -0.2691756, 0.01828675, 1, 0, 0.1921569, 1,
1.779674, 0.78601, 2.654248, 1, 0, 0.1843137, 1,
1.783605, -0.2579831, 2.257613, 1, 0, 0.1803922, 1,
1.786183, -1.516679, 2.702456, 1, 0, 0.172549, 1,
1.790559, -0.8111311, 1.897989, 1, 0, 0.1686275, 1,
1.801109, 0.732364, 1.163424, 1, 0, 0.1607843, 1,
1.80856, 1.25288, 2.112525, 1, 0, 0.1568628, 1,
1.861276, 1.126963, 1.829911, 1, 0, 0.1490196, 1,
1.87945, -0.468911, 2.989378, 1, 0, 0.145098, 1,
1.944273, -1.205099, 2.035506, 1, 0, 0.1372549, 1,
2.011814, 0.03955035, 2.589342, 1, 0, 0.1333333, 1,
2.058542, 1.262982, 1.680662, 1, 0, 0.1254902, 1,
2.065336, -1.561468, 1.581744, 1, 0, 0.1215686, 1,
2.116994, -0.3725347, 1.891189, 1, 0, 0.1137255, 1,
2.119493, 0.2535245, 3.384396, 1, 0, 0.1098039, 1,
2.130922, -1.535823, 0.7170277, 1, 0, 0.1019608, 1,
2.135807, -0.3180626, 1.199081, 1, 0, 0.09411765, 1,
2.140378, 0.3349502, 2.551816, 1, 0, 0.09019608, 1,
2.179766, -0.2864808, 1.106255, 1, 0, 0.08235294, 1,
2.225358, -0.9704947, 4.166557, 1, 0, 0.07843138, 1,
2.249275, 0.5533769, 0.5033207, 1, 0, 0.07058824, 1,
2.254058, 0.6438882, 0.9314553, 1, 0, 0.06666667, 1,
2.268118, -0.1221208, 0.3437032, 1, 0, 0.05882353, 1,
2.329528, -0.5520108, 1.293358, 1, 0, 0.05490196, 1,
2.370366, -2.214071, 2.297113, 1, 0, 0.04705882, 1,
2.408782, -1.245155, -0.4193481, 1, 0, 0.04313726, 1,
2.437958, -1.139907, 2.122944, 1, 0, 0.03529412, 1,
2.487152, -0.2263673, 1.573212, 1, 0, 0.03137255, 1,
2.535127, -0.7501258, 2.238317, 1, 0, 0.02352941, 1,
3.057552, 0.1047047, 2.113962, 1, 0, 0.01960784, 1,
3.099856, -0.05913236, 0.2582307, 1, 0, 0.01176471, 1,
3.458792, -1.546076, 3.154391, 1, 0, 0.007843138, 1
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
0.3208218, -5.171845, -6.622526, 0, -0.5, 0.5, 0.5,
0.3208218, -5.171845, -6.622526, 1, -0.5, 0.5, 0.5,
0.3208218, -5.171845, -6.622526, 1, 1.5, 0.5, 0.5,
0.3208218, -5.171845, -6.622526, 0, 1.5, 0.5, 0.5
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
-3.880921, -0.4239419, -6.622526, 0, -0.5, 0.5, 0.5,
-3.880921, -0.4239419, -6.622526, 1, -0.5, 0.5, 0.5,
-3.880921, -0.4239419, -6.622526, 1, 1.5, 0.5, 0.5,
-3.880921, -0.4239419, -6.622526, 0, 1.5, 0.5, 0.5
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
-3.880921, -5.171845, 0.04803109, 0, -0.5, 0.5, 0.5,
-3.880921, -5.171845, 0.04803109, 1, -0.5, 0.5, 0.5,
-3.880921, -5.171845, 0.04803109, 1, 1.5, 0.5, 0.5,
-3.880921, -5.171845, 0.04803109, 0, 1.5, 0.5, 0.5
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
-2, -4.076175, -5.083167,
3, -4.076175, -5.083167,
-2, -4.076175, -5.083167,
-2, -4.258787, -5.339726,
-1, -4.076175, -5.083167,
-1, -4.258787, -5.339726,
0, -4.076175, -5.083167,
0, -4.258787, -5.339726,
1, -4.076175, -5.083167,
1, -4.258787, -5.339726,
2, -4.076175, -5.083167,
2, -4.258787, -5.339726,
3, -4.076175, -5.083167,
3, -4.258787, -5.339726
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
-2, -4.62401, -5.852847, 0, -0.5, 0.5, 0.5,
-2, -4.62401, -5.852847, 1, -0.5, 0.5, 0.5,
-2, -4.62401, -5.852847, 1, 1.5, 0.5, 0.5,
-2, -4.62401, -5.852847, 0, 1.5, 0.5, 0.5,
-1, -4.62401, -5.852847, 0, -0.5, 0.5, 0.5,
-1, -4.62401, -5.852847, 1, -0.5, 0.5, 0.5,
-1, -4.62401, -5.852847, 1, 1.5, 0.5, 0.5,
-1, -4.62401, -5.852847, 0, 1.5, 0.5, 0.5,
0, -4.62401, -5.852847, 0, -0.5, 0.5, 0.5,
0, -4.62401, -5.852847, 1, -0.5, 0.5, 0.5,
0, -4.62401, -5.852847, 1, 1.5, 0.5, 0.5,
0, -4.62401, -5.852847, 0, 1.5, 0.5, 0.5,
1, -4.62401, -5.852847, 0, -0.5, 0.5, 0.5,
1, -4.62401, -5.852847, 1, -0.5, 0.5, 0.5,
1, -4.62401, -5.852847, 1, 1.5, 0.5, 0.5,
1, -4.62401, -5.852847, 0, 1.5, 0.5, 0.5,
2, -4.62401, -5.852847, 0, -0.5, 0.5, 0.5,
2, -4.62401, -5.852847, 1, -0.5, 0.5, 0.5,
2, -4.62401, -5.852847, 1, 1.5, 0.5, 0.5,
2, -4.62401, -5.852847, 0, 1.5, 0.5, 0.5,
3, -4.62401, -5.852847, 0, -0.5, 0.5, 0.5,
3, -4.62401, -5.852847, 1, -0.5, 0.5, 0.5,
3, -4.62401, -5.852847, 1, 1.5, 0.5, 0.5,
3, -4.62401, -5.852847, 0, 1.5, 0.5, 0.5
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
-2.911288, -2, -5.083167,
-2.911288, 2, -5.083167,
-2.911288, -2, -5.083167,
-3.072893, -2, -5.339726,
-2.911288, 0, -5.083167,
-3.072893, 0, -5.339726,
-2.911288, 2, -5.083167,
-3.072893, 2, -5.339726
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
-3.396104, -2, -5.852847, 0, -0.5, 0.5, 0.5,
-3.396104, -2, -5.852847, 1, -0.5, 0.5, 0.5,
-3.396104, -2, -5.852847, 1, 1.5, 0.5, 0.5,
-3.396104, -2, -5.852847, 0, 1.5, 0.5, 0.5,
-3.396104, 0, -5.852847, 0, -0.5, 0.5, 0.5,
-3.396104, 0, -5.852847, 1, -0.5, 0.5, 0.5,
-3.396104, 0, -5.852847, 1, 1.5, 0.5, 0.5,
-3.396104, 0, -5.852847, 0, 1.5, 0.5, 0.5,
-3.396104, 2, -5.852847, 0, -0.5, 0.5, 0.5,
-3.396104, 2, -5.852847, 1, -0.5, 0.5, 0.5,
-3.396104, 2, -5.852847, 1, 1.5, 0.5, 0.5,
-3.396104, 2, -5.852847, 0, 1.5, 0.5, 0.5
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
-2.911288, -4.076175, -4,
-2.911288, -4.076175, 4,
-2.911288, -4.076175, -4,
-3.072893, -4.258787, -4,
-2.911288, -4.076175, -2,
-3.072893, -4.258787, -2,
-2.911288, -4.076175, 0,
-3.072893, -4.258787, 0,
-2.911288, -4.076175, 2,
-3.072893, -4.258787, 2,
-2.911288, -4.076175, 4,
-3.072893, -4.258787, 4
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
-3.396104, -4.62401, -4, 0, -0.5, 0.5, 0.5,
-3.396104, -4.62401, -4, 1, -0.5, 0.5, 0.5,
-3.396104, -4.62401, -4, 1, 1.5, 0.5, 0.5,
-3.396104, -4.62401, -4, 0, 1.5, 0.5, 0.5,
-3.396104, -4.62401, -2, 0, -0.5, 0.5, 0.5,
-3.396104, -4.62401, -2, 1, -0.5, 0.5, 0.5,
-3.396104, -4.62401, -2, 1, 1.5, 0.5, 0.5,
-3.396104, -4.62401, -2, 0, 1.5, 0.5, 0.5,
-3.396104, -4.62401, 0, 0, -0.5, 0.5, 0.5,
-3.396104, -4.62401, 0, 1, -0.5, 0.5, 0.5,
-3.396104, -4.62401, 0, 1, 1.5, 0.5, 0.5,
-3.396104, -4.62401, 0, 0, 1.5, 0.5, 0.5,
-3.396104, -4.62401, 2, 0, -0.5, 0.5, 0.5,
-3.396104, -4.62401, 2, 1, -0.5, 0.5, 0.5,
-3.396104, -4.62401, 2, 1, 1.5, 0.5, 0.5,
-3.396104, -4.62401, 2, 0, 1.5, 0.5, 0.5,
-3.396104, -4.62401, 4, 0, -0.5, 0.5, 0.5,
-3.396104, -4.62401, 4, 1, -0.5, 0.5, 0.5,
-3.396104, -4.62401, 4, 1, 1.5, 0.5, 0.5,
-3.396104, -4.62401, 4, 0, 1.5, 0.5, 0.5
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
-2.911288, -4.076175, -5.083167,
-2.911288, 3.228292, -5.083167,
-2.911288, -4.076175, 5.179229,
-2.911288, 3.228292, 5.179229,
-2.911288, -4.076175, -5.083167,
-2.911288, -4.076175, 5.179229,
-2.911288, 3.228292, -5.083167,
-2.911288, 3.228292, 5.179229,
-2.911288, -4.076175, -5.083167,
3.552931, -4.076175, -5.083167,
-2.911288, -4.076175, 5.179229,
3.552931, -4.076175, 5.179229,
-2.911288, 3.228292, -5.083167,
3.552931, 3.228292, -5.083167,
-2.911288, 3.228292, 5.179229,
3.552931, 3.228292, 5.179229,
3.552931, -4.076175, -5.083167,
3.552931, 3.228292, -5.083167,
3.552931, -4.076175, 5.179229,
3.552931, 3.228292, 5.179229,
3.552931, -4.076175, -5.083167,
3.552931, -4.076175, 5.179229,
3.552931, 3.228292, -5.083167,
3.552931, 3.228292, 5.179229
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
var radius = 7.56027;
var distance = 33.63649;
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
mvMatrix.translate( -0.3208218, 0.4239419, -0.04803109 );
mvMatrix.scale( 1.264547, 1.119084, 0.7965306 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.63649);
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
terbacil<-read.table("terbacil.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-terbacil$V2
```

```
## Error in eval(expr, envir, enclos): object 'terbacil' not found
```

```r
y<-terbacil$V3
```

```
## Error in eval(expr, envir, enclos): object 'terbacil' not found
```

```r
z<-terbacil$V4
```

```
## Error in eval(expr, envir, enclos): object 'terbacil' not found
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
-2.817149, -1.377897, -2.16605, 0, 0, 1, 1, 1,
-2.756233, -0.1979965, 0.1324421, 1, 0, 0, 1, 1,
-2.62332, -0.3125046, -1.247901, 1, 0, 0, 1, 1,
-2.504071, -0.505905, -3.150687, 1, 0, 0, 1, 1,
-2.47063, 1.42712, -1.502971, 1, 0, 0, 1, 1,
-2.452247, -0.2741299, -1.550992, 1, 0, 0, 1, 1,
-2.44452, -0.9728069, -3.439177, 0, 0, 0, 1, 1,
-2.414254, 1.402534, -1.65921, 0, 0, 0, 1, 1,
-2.361728, -1.498747, -2.271573, 0, 0, 0, 1, 1,
-2.255691, 1.42915, -0.2497254, 0, 0, 0, 1, 1,
-2.23773, 1.914515, -0.1899798, 0, 0, 0, 1, 1,
-2.237693, -0.7093917, -1.1013, 0, 0, 0, 1, 1,
-2.226842, -0.9523355, -1.855992, 0, 0, 0, 1, 1,
-2.204549, -1.034268, -1.354679, 1, 1, 1, 1, 1,
-2.189872, -1.734446, -1.204602, 1, 1, 1, 1, 1,
-2.189729, 1.729303, -0.265507, 1, 1, 1, 1, 1,
-2.14032, 0.03713397, -0.9084267, 1, 1, 1, 1, 1,
-2.113927, 0.2338481, -2.186974, 1, 1, 1, 1, 1,
-2.09925, -1.212533, -1.80435, 1, 1, 1, 1, 1,
-2.090324, -0.6042567, -0.3559623, 1, 1, 1, 1, 1,
-2.069151, 1.403223, -1.38366, 1, 1, 1, 1, 1,
-2.067327, -1.385458, -0.5591589, 1, 1, 1, 1, 1,
-2.048821, -0.2391758, -2.181598, 1, 1, 1, 1, 1,
-2.043606, -0.346, -1.141345, 1, 1, 1, 1, 1,
-2.043044, 1.117245, -0.4952459, 1, 1, 1, 1, 1,
-2.014948, -0.4413215, -1.706252, 1, 1, 1, 1, 1,
-1.98756, -0.6200294, -4.24376, 1, 1, 1, 1, 1,
-1.984188, -1.93162, -2.100935, 1, 1, 1, 1, 1,
-1.980488, -0.7119548, -2.139267, 0, 0, 1, 1, 1,
-1.973148, -0.4230621, -3.906102, 1, 0, 0, 1, 1,
-1.966481, -0.5363368, -0.8922392, 1, 0, 0, 1, 1,
-1.963398, -0.7373212, -1.725363, 1, 0, 0, 1, 1,
-1.958287, -0.3384896, -1.41174, 1, 0, 0, 1, 1,
-1.933805, 0.1469472, -2.286955, 1, 0, 0, 1, 1,
-1.922394, 0.5959975, -0.736993, 0, 0, 0, 1, 1,
-1.921526, -1.251081, -1.549732, 0, 0, 0, 1, 1,
-1.909599, -0.5633393, -2.79307, 0, 0, 0, 1, 1,
-1.901906, -0.3372777, -1.405229, 0, 0, 0, 1, 1,
-1.896444, -0.834241, -1.83028, 0, 0, 0, 1, 1,
-1.87992, -0.6401584, -3.388348, 0, 0, 0, 1, 1,
-1.832545, 0.594011, -1.447966, 0, 0, 0, 1, 1,
-1.820928, -1.303672, -1.839914, 1, 1, 1, 1, 1,
-1.783689, 1.176805, -1.573585, 1, 1, 1, 1, 1,
-1.760846, 0.822682, -1.539794, 1, 1, 1, 1, 1,
-1.757474, 0.9509802, -2.71583, 1, 1, 1, 1, 1,
-1.749328, 2.405796, 1.099335, 1, 1, 1, 1, 1,
-1.741756, 0.1615309, -1.115893, 1, 1, 1, 1, 1,
-1.716666, 0.5534147, -0.5374361, 1, 1, 1, 1, 1,
-1.702949, -0.7598552, -2.315745, 1, 1, 1, 1, 1,
-1.647117, 0.4086358, -1.817773, 1, 1, 1, 1, 1,
-1.635054, 0.2790408, -0.677942, 1, 1, 1, 1, 1,
-1.59775, 1.126247, -0.03346148, 1, 1, 1, 1, 1,
-1.596773, 1.714573, -2.732237, 1, 1, 1, 1, 1,
-1.594134, -1.095062, -2.190697, 1, 1, 1, 1, 1,
-1.585205, 0.03850017, -0.1550891, 1, 1, 1, 1, 1,
-1.572289, -0.1553759, -1.188887, 1, 1, 1, 1, 1,
-1.571678, -1.659687, -2.636866, 0, 0, 1, 1, 1,
-1.567315, 0.04513906, -0.9956608, 1, 0, 0, 1, 1,
-1.559925, 0.4856611, -0.5015693, 1, 0, 0, 1, 1,
-1.556615, 0.656763, -2.392201, 1, 0, 0, 1, 1,
-1.535187, 0.4303627, -1.511371, 1, 0, 0, 1, 1,
-1.532111, -1.233433, -2.6792, 1, 0, 0, 1, 1,
-1.531363, 0.1080014, -0.2723127, 0, 0, 0, 1, 1,
-1.527252, -0.5423088, -0.5200395, 0, 0, 0, 1, 1,
-1.526289, -0.8675532, -3.172101, 0, 0, 0, 1, 1,
-1.52194, -0.9814845, -2.258583, 0, 0, 0, 1, 1,
-1.51534, 0.6234846, -0.1051043, 0, 0, 0, 1, 1,
-1.513376, 1.07471, -0.320232, 0, 0, 0, 1, 1,
-1.510547, -1.898867, -1.460117, 0, 0, 0, 1, 1,
-1.507883, -0.3506653, -2.577017, 1, 1, 1, 1, 1,
-1.507578, -1.058331, -3.749106, 1, 1, 1, 1, 1,
-1.501263, -0.2129557, -1.46342, 1, 1, 1, 1, 1,
-1.492284, 0.6736442, -3.055766, 1, 1, 1, 1, 1,
-1.479622, -0.5841132, -3.553791, 1, 1, 1, 1, 1,
-1.478862, 0.3324504, -2.711954, 1, 1, 1, 1, 1,
-1.461859, 0.7904119, -0.927396, 1, 1, 1, 1, 1,
-1.432333, 0.6773561, -0.9219418, 1, 1, 1, 1, 1,
-1.430675, 0.4141793, -1.391255, 1, 1, 1, 1, 1,
-1.42316, 0.6951247, -2.400803, 1, 1, 1, 1, 1,
-1.4059, 0.4195462, 0.09664878, 1, 1, 1, 1, 1,
-1.403256, 0.7866655, -1.480701, 1, 1, 1, 1, 1,
-1.39896, -0.9056014, -1.952538, 1, 1, 1, 1, 1,
-1.397303, 0.7323996, -2.476507, 1, 1, 1, 1, 1,
-1.394929, -1.11953, -2.064636, 1, 1, 1, 1, 1,
-1.393489, 1.007814, -1.09808, 0, 0, 1, 1, 1,
-1.372973, 0.1365254, -1.550002, 1, 0, 0, 1, 1,
-1.368303, -1.141178, 0.5508431, 1, 0, 0, 1, 1,
-1.359587, -1.038663, -0.969112, 1, 0, 0, 1, 1,
-1.33053, 0.6387523, 0.3402619, 1, 0, 0, 1, 1,
-1.33049, 1.174545, -3.091922, 1, 0, 0, 1, 1,
-1.327687, -0.1364207, -1.086644, 0, 0, 0, 1, 1,
-1.319965, -0.6801176, -1.732341, 0, 0, 0, 1, 1,
-1.304744, -0.1235707, -2.693606, 0, 0, 0, 1, 1,
-1.304513, -0.7616323, -2.753013, 0, 0, 0, 1, 1,
-1.29378, -1.455441, -1.343126, 0, 0, 0, 1, 1,
-1.292901, 0.5111772, -0.9968691, 0, 0, 0, 1, 1,
-1.288827, 1.044629, 0.8418499, 0, 0, 0, 1, 1,
-1.283452, -0.2365827, -2.530863, 1, 1, 1, 1, 1,
-1.279927, -0.6250964, -1.638786, 1, 1, 1, 1, 1,
-1.27914, 0.4814184, -1.173299, 1, 1, 1, 1, 1,
-1.274091, 0.2155228, 0.3733799, 1, 1, 1, 1, 1,
-1.272167, -0.1175568, -0.8283606, 1, 1, 1, 1, 1,
-1.268451, -1.276649, -2.342594, 1, 1, 1, 1, 1,
-1.263125, -1.515003, -3.219228, 1, 1, 1, 1, 1,
-1.257209, 1.060409, -2.277757, 1, 1, 1, 1, 1,
-1.252524, 1.344359, -0.7889151, 1, 1, 1, 1, 1,
-1.251892, 0.6339745, -0.9660011, 1, 1, 1, 1, 1,
-1.25189, -0.002137678, -1.482011, 1, 1, 1, 1, 1,
-1.249593, -0.2300833, -0.11134, 1, 1, 1, 1, 1,
-1.247738, 0.9958911, -2.116594, 1, 1, 1, 1, 1,
-1.244411, -0.02335001, -3.914023, 1, 1, 1, 1, 1,
-1.22472, -0.2437586, -1.573698, 1, 1, 1, 1, 1,
-1.212555, 0.7818472, 0.121038, 0, 0, 1, 1, 1,
-1.210056, -2.230994, -1.896833, 1, 0, 0, 1, 1,
-1.209362, 1.153548, -1.4813, 1, 0, 0, 1, 1,
-1.207501, 1.329719, -0.4681557, 1, 0, 0, 1, 1,
-1.204097, 1.417782, -1.773647, 1, 0, 0, 1, 1,
-1.20082, -0.4819021, -1.910346, 1, 0, 0, 1, 1,
-1.199954, -0.03740903, -0.6541552, 0, 0, 0, 1, 1,
-1.187734, -1.894858, -3.289268, 0, 0, 0, 1, 1,
-1.186961, 0.3370098, -2.188876, 0, 0, 0, 1, 1,
-1.183202, -0.6550165, -2.661635, 0, 0, 0, 1, 1,
-1.180365, 0.1823755, -0.8360243, 0, 0, 0, 1, 1,
-1.177176, 0.3724813, -1.542139, 0, 0, 0, 1, 1,
-1.167605, 1.487965, -1.587663, 0, 0, 0, 1, 1,
-1.15974, -0.9850091, -3.294421, 1, 1, 1, 1, 1,
-1.159234, -1.180192, -0.525346, 1, 1, 1, 1, 1,
-1.156377, 0.6028985, 1.276756, 1, 1, 1, 1, 1,
-1.155977, -1.077428, -3.626172, 1, 1, 1, 1, 1,
-1.144296, 0.3012546, -0.3625299, 1, 1, 1, 1, 1,
-1.119964, -0.3887011, -2.320491, 1, 1, 1, 1, 1,
-1.11685, 1.294517, 0.6090239, 1, 1, 1, 1, 1,
-1.116507, 1.753393, 1.129136, 1, 1, 1, 1, 1,
-1.113794, -0.42745, -2.624122, 1, 1, 1, 1, 1,
-1.11029, -0.4405863, -2.181194, 1, 1, 1, 1, 1,
-1.104807, 0.5076532, -1.614883, 1, 1, 1, 1, 1,
-1.103454, -0.434553, -1.470347, 1, 1, 1, 1, 1,
-1.103134, 0.4387298, -1.819465, 1, 1, 1, 1, 1,
-1.10019, -1.458741, -3.26183, 1, 1, 1, 1, 1,
-1.091277, 0.3273712, -1.175775, 1, 1, 1, 1, 1,
-1.077739, 0.9016339, 1.335716, 0, 0, 1, 1, 1,
-1.069696, -1.381418, -2.552504, 1, 0, 0, 1, 1,
-1.063252, 0.9797356, 1.034971, 1, 0, 0, 1, 1,
-1.056868, 0.8932554, -0.2736784, 1, 0, 0, 1, 1,
-1.054222, 0.8075255, -1.050654, 1, 0, 0, 1, 1,
-1.053202, -0.1248319, -1.105538, 1, 0, 0, 1, 1,
-1.042795, 0.727752, -1.050074, 0, 0, 0, 1, 1,
-1.039361, -0.4842859, -1.800786, 0, 0, 0, 1, 1,
-1.035366, 1.034391, 0.03252397, 0, 0, 0, 1, 1,
-1.030669, -0.06868292, -1.268659, 0, 0, 0, 1, 1,
-1.019139, 0.4314678, -1.275009, 0, 0, 0, 1, 1,
-1.015313, 0.2535611, 0.1276988, 0, 0, 0, 1, 1,
-0.9930996, -0.1873748, -2.521186, 0, 0, 0, 1, 1,
-0.9908478, 0.4307869, -0.4888652, 1, 1, 1, 1, 1,
-0.9877593, -0.1753054, -0.01768047, 1, 1, 1, 1, 1,
-0.9834521, 0.115036, -1.068847, 1, 1, 1, 1, 1,
-0.9823187, 2.06112, -0.5743662, 1, 1, 1, 1, 1,
-0.980292, -1.513549, -3.141952, 1, 1, 1, 1, 1,
-0.9752885, -0.5654648, -1.268346, 1, 1, 1, 1, 1,
-0.9361955, -0.4625269, -1.800846, 1, 1, 1, 1, 1,
-0.932752, 0.97585, -1.329924, 1, 1, 1, 1, 1,
-0.9297586, -0.3045513, -3.579701, 1, 1, 1, 1, 1,
-0.929079, -0.2095315, -0.2285935, 1, 1, 1, 1, 1,
-0.9283755, -0.7580529, -0.8923585, 1, 1, 1, 1, 1,
-0.9278206, 0.2556698, -1.239075, 1, 1, 1, 1, 1,
-0.9268752, -2.04324, -3.49817, 1, 1, 1, 1, 1,
-0.9222662, 0.2973923, -1.102201, 1, 1, 1, 1, 1,
-0.921353, -1.294339, -1.636929, 1, 1, 1, 1, 1,
-0.9162801, -0.3522734, -1.895172, 0, 0, 1, 1, 1,
-0.9161058, -1.292173, -3.144796, 1, 0, 0, 1, 1,
-0.9030268, 1.051895, -1.483796, 1, 0, 0, 1, 1,
-0.9022692, -0.1359547, -2.714845, 1, 0, 0, 1, 1,
-0.8989129, -0.5146698, -2.947433, 1, 0, 0, 1, 1,
-0.894816, -0.394258, -1.811181, 1, 0, 0, 1, 1,
-0.8919047, 0.7652298, -1.526209, 0, 0, 0, 1, 1,
-0.8916705, 0.7982971, -0.2983575, 0, 0, 0, 1, 1,
-0.8894442, 0.3766642, -0.8921085, 0, 0, 0, 1, 1,
-0.8884805, -0.5629551, -2.703771, 0, 0, 0, 1, 1,
-0.8855286, -0.5112421, -0.4969327, 0, 0, 0, 1, 1,
-0.8805987, 2.652221, -2.013579, 0, 0, 0, 1, 1,
-0.8777194, 0.2027779, -1.166661, 0, 0, 0, 1, 1,
-0.872603, 0.4466329, -1.672498, 1, 1, 1, 1, 1,
-0.8722078, 0.4583368, 0.005000288, 1, 1, 1, 1, 1,
-0.8679038, -1.178148, -2.484574, 1, 1, 1, 1, 1,
-0.865076, -0.3436548, -1.66632, 1, 1, 1, 1, 1,
-0.8637588, -0.7995998, -2.615409, 1, 1, 1, 1, 1,
-0.8637037, 0.1415531, -2.398334, 1, 1, 1, 1, 1,
-0.8636878, 0.3557479, 0.1932002, 1, 1, 1, 1, 1,
-0.8552154, -0.1038907, -3.294657, 1, 1, 1, 1, 1,
-0.8538205, -1.520906, -3.2704, 1, 1, 1, 1, 1,
-0.8536681, 2.06512, 0.1706885, 1, 1, 1, 1, 1,
-0.8523943, 0.6054268, -0.9122969, 1, 1, 1, 1, 1,
-0.8491888, -0.5514929, -2.19765, 1, 1, 1, 1, 1,
-0.8464867, -0.8825292, -2.523764, 1, 1, 1, 1, 1,
-0.844198, -1.169733, -3.652172, 1, 1, 1, 1, 1,
-0.8383781, 0.2967533, -2.604977, 1, 1, 1, 1, 1,
-0.8337733, -0.04537953, -0.8713743, 0, 0, 1, 1, 1,
-0.8268207, -0.7331625, -3.457183, 1, 0, 0, 1, 1,
-0.8205713, 0.1201669, -1.355056, 1, 0, 0, 1, 1,
-0.8134676, -1.322831, -1.058367, 1, 0, 0, 1, 1,
-0.8128924, 1.801432, 0.9273348, 1, 0, 0, 1, 1,
-0.8102227, -1.402122, -3.080056, 1, 0, 0, 1, 1,
-0.8044441, -0.5869566, -3.202905, 0, 0, 0, 1, 1,
-0.8032187, -0.5555708, -4.247672, 0, 0, 0, 1, 1,
-0.7990214, -1.633521, -1.366197, 0, 0, 0, 1, 1,
-0.7988182, 0.165253, -0.8152773, 0, 0, 0, 1, 1,
-0.7951801, 0.2245627, -2.736373, 0, 0, 0, 1, 1,
-0.7800911, 0.3117438, -1.600567, 0, 0, 0, 1, 1,
-0.7732024, -1.865255, -1.301715, 0, 0, 0, 1, 1,
-0.7729276, -0.8966357, -0.5332857, 1, 1, 1, 1, 1,
-0.7728695, 0.02667164, -1.39936, 1, 1, 1, 1, 1,
-0.7682758, -0.9103352, -1.798636, 1, 1, 1, 1, 1,
-0.7587455, 0.7572557, -0.6788173, 1, 1, 1, 1, 1,
-0.7507987, -1.013031, -1.980602, 1, 1, 1, 1, 1,
-0.7441513, -0.7250355, -2.363805, 1, 1, 1, 1, 1,
-0.7282578, 0.5034552, -1.869133, 1, 1, 1, 1, 1,
-0.7269816, -0.7571086, -0.7711445, 1, 1, 1, 1, 1,
-0.7268229, 0.9146699, -0.4097443, 1, 1, 1, 1, 1,
-0.725174, -0.1917148, -2.57848, 1, 1, 1, 1, 1,
-0.7232264, -0.9810461, -2.179648, 1, 1, 1, 1, 1,
-0.7215867, 0.3991147, -0.8300541, 1, 1, 1, 1, 1,
-0.7202783, -0.04363978, -2.048707, 1, 1, 1, 1, 1,
-0.7202359, -1.93056, -2.721043, 1, 1, 1, 1, 1,
-0.7149135, -0.2364901, -2.357513, 1, 1, 1, 1, 1,
-0.7138003, 0.4034474, -0.4125296, 0, 0, 1, 1, 1,
-0.710733, 0.2503374, -2.519636, 1, 0, 0, 1, 1,
-0.7104359, -0.0173407, -0.3653637, 1, 0, 0, 1, 1,
-0.709142, -1.27065, -2.843856, 1, 0, 0, 1, 1,
-0.7037271, -0.7951868, -4.303775, 1, 0, 0, 1, 1,
-0.7032131, 1.349108, -0.8353203, 1, 0, 0, 1, 1,
-0.7011738, 1.379851, -0.8473685, 0, 0, 0, 1, 1,
-0.6954303, 0.9438689, 0.4193083, 0, 0, 0, 1, 1,
-0.6925654, -1.556848, -0.3658541, 0, 0, 0, 1, 1,
-0.6924132, 0.1034954, -1.219472, 0, 0, 0, 1, 1,
-0.6904429, 0.9862302, -0.1857546, 0, 0, 0, 1, 1,
-0.6903407, -0.4067315, -0.9677275, 0, 0, 0, 1, 1,
-0.6899012, -0.3696673, -1.009397, 0, 0, 0, 1, 1,
-0.6874697, 0.5894506, 1.029324, 1, 1, 1, 1, 1,
-0.6847143, 3.121916, -0.104175, 1, 1, 1, 1, 1,
-0.6796538, -1.123982, -3.651515, 1, 1, 1, 1, 1,
-0.6720359, 2.054142, -1.657697, 1, 1, 1, 1, 1,
-0.6655806, -0.3273704, -2.381477, 1, 1, 1, 1, 1,
-0.6592004, 1.366582, -1.283499, 1, 1, 1, 1, 1,
-0.6550897, -0.9163938, -2.400113, 1, 1, 1, 1, 1,
-0.6539598, 0.4219021, -1.465439, 1, 1, 1, 1, 1,
-0.6538414, -1.142495, -3.939859, 1, 1, 1, 1, 1,
-0.651616, 1.495857, -1.951973, 1, 1, 1, 1, 1,
-0.6510906, 1.039464, -0.4795201, 1, 1, 1, 1, 1,
-0.6482956, -1.025852, -1.94879, 1, 1, 1, 1, 1,
-0.644839, -0.01716055, -1.789009, 1, 1, 1, 1, 1,
-0.6440077, -0.7288334, -3.873605, 1, 1, 1, 1, 1,
-0.6431128, 1.385569, -1.309966, 1, 1, 1, 1, 1,
-0.6426809, 0.7541158, -1.612827, 0, 0, 1, 1, 1,
-0.6406555, 1.41707, -1.67573, 1, 0, 0, 1, 1,
-0.6366432, 0.3126346, -2.466689, 1, 0, 0, 1, 1,
-0.6359228, -0.1949444, -0.9675236, 1, 0, 0, 1, 1,
-0.6355044, -0.6987208, -2.035929, 1, 0, 0, 1, 1,
-0.6299645, 0.1707332, -2.0604, 1, 0, 0, 1, 1,
-0.6231295, 0.3306359, -3.08564, 0, 0, 0, 1, 1,
-0.6204637, 0.7946431, -1.938654, 0, 0, 0, 1, 1,
-0.6130676, 1.123464, 0.2935041, 0, 0, 0, 1, 1,
-0.6101027, -0.05926016, -2.539583, 0, 0, 0, 1, 1,
-0.6061857, -0.09134759, -1.37475, 0, 0, 0, 1, 1,
-0.6021618, -0.9043005, -3.220884, 0, 0, 0, 1, 1,
-0.6016649, -0.1371084, -0.4928931, 0, 0, 0, 1, 1,
-0.5995704, -0.7679799, -2.224917, 1, 1, 1, 1, 1,
-0.5995098, 1.594794, -0.4376251, 1, 1, 1, 1, 1,
-0.5990847, -1.309156, -2.267039, 1, 1, 1, 1, 1,
-0.598684, -3.9698, -2.506924, 1, 1, 1, 1, 1,
-0.5874022, -0.6577671, -3.644287, 1, 1, 1, 1, 1,
-0.5870953, -1.705093, -2.320909, 1, 1, 1, 1, 1,
-0.5823013, 0.2859339, -1.387735, 1, 1, 1, 1, 1,
-0.57788, -2.462589, -2.669072, 1, 1, 1, 1, 1,
-0.5775651, 0.358147, -3.025504, 1, 1, 1, 1, 1,
-0.5714446, -0.3294491, -2.7969, 1, 1, 1, 1, 1,
-0.5706781, -0.3157794, -2.753284, 1, 1, 1, 1, 1,
-0.5704942, -0.2292535, -2.040006, 1, 1, 1, 1, 1,
-0.5682806, 0.5101643, -2.794498, 1, 1, 1, 1, 1,
-0.5611447, 0.0720375, -1.931435, 1, 1, 1, 1, 1,
-0.5573772, -1.287179, -2.566815, 1, 1, 1, 1, 1,
-0.5518346, 1.193361, -0.09990978, 0, 0, 1, 1, 1,
-0.5491408, -2.24813, -1.522696, 1, 0, 0, 1, 1,
-0.5486019, 0.08535816, -1.516857, 1, 0, 0, 1, 1,
-0.5477914, -2.061844, -4.094021, 1, 0, 0, 1, 1,
-0.5454544, -0.996976, -2.491414, 1, 0, 0, 1, 1,
-0.542752, 0.3690651, -2.088945, 1, 0, 0, 1, 1,
-0.5424461, 1.109589, -0.08446433, 0, 0, 0, 1, 1,
-0.5418785, -0.008549804, -2.775224, 0, 0, 0, 1, 1,
-0.5383079, -0.06203654, -2.350041, 0, 0, 0, 1, 1,
-0.5350958, 0.3927536, -1.133915, 0, 0, 0, 1, 1,
-0.5337594, 0.9671084, -1.483402, 0, 0, 0, 1, 1,
-0.5312912, -0.08636107, -2.421622, 0, 0, 0, 1, 1,
-0.530847, 0.7885754, -0.4212329, 0, 0, 0, 1, 1,
-0.5243486, 2.073493, -0.3983414, 1, 1, 1, 1, 1,
-0.5240468, 2.235381, 0.07672536, 1, 1, 1, 1, 1,
-0.5165465, -2.773665, -2.631594, 1, 1, 1, 1, 1,
-0.513384, 0.2646825, -0.7453883, 1, 1, 1, 1, 1,
-0.5128066, -0.6833183, -2.047306, 1, 1, 1, 1, 1,
-0.5124688, 0.3670657, -0.5945321, 1, 1, 1, 1, 1,
-0.5092531, -0.001786884, -2.750899, 1, 1, 1, 1, 1,
-0.5085162, 0.3226081, 0.2466083, 1, 1, 1, 1, 1,
-0.5045418, -0.2189154, -3.169348, 1, 1, 1, 1, 1,
-0.4985765, -0.3385269, -0.775453, 1, 1, 1, 1, 1,
-0.4976983, -0.4013222, 0.009737315, 1, 1, 1, 1, 1,
-0.496047, -1.622553, -2.735185, 1, 1, 1, 1, 1,
-0.4905663, 0.2326608, -1.403702, 1, 1, 1, 1, 1,
-0.4866863, 0.921006, -1.990707, 1, 1, 1, 1, 1,
-0.4845512, 1.92976, -1.312362, 1, 1, 1, 1, 1,
-0.4798468, 2.247788, -3.235407, 0, 0, 1, 1, 1,
-0.479489, 0.6731542, -1.206217, 1, 0, 0, 1, 1,
-0.4786572, 0.07494752, -0.9668159, 1, 0, 0, 1, 1,
-0.4779114, -0.8585767, -3.097725, 1, 0, 0, 1, 1,
-0.4775381, -0.7255226, -0.9912089, 1, 0, 0, 1, 1,
-0.4738903, 0.2026875, -0.2912752, 1, 0, 0, 1, 1,
-0.4720999, -0.137419, -1.180119, 0, 0, 0, 1, 1,
-0.4681867, -1.708593, -2.747347, 0, 0, 0, 1, 1,
-0.464415, 0.09444541, -1.932608, 0, 0, 0, 1, 1,
-0.4642321, -0.6167672, -4.112655, 0, 0, 0, 1, 1,
-0.4574049, -0.1703345, -0.833612, 0, 0, 0, 1, 1,
-0.4562203, -1.458208, -3.783637, 0, 0, 0, 1, 1,
-0.4525033, -0.226271, -3.101562, 0, 0, 0, 1, 1,
-0.4505139, -0.2089412, -2.069794, 1, 1, 1, 1, 1,
-0.4479252, -0.08956437, -0.9073932, 1, 1, 1, 1, 1,
-0.4471442, -0.7278828, -1.787208, 1, 1, 1, 1, 1,
-0.4470054, -1.083888, -2.221622, 1, 1, 1, 1, 1,
-0.4458921, -0.6181143, -1.769147, 1, 1, 1, 1, 1,
-0.4450604, -0.05355152, -1.532285, 1, 1, 1, 1, 1,
-0.441236, 0.7454353, 0.1486109, 1, 1, 1, 1, 1,
-0.4370343, 1.160167, 0.06299964, 1, 1, 1, 1, 1,
-0.4368857, -0.4837328, -3.818336, 1, 1, 1, 1, 1,
-0.4338461, 1.211755, -1.554217, 1, 1, 1, 1, 1,
-0.4295818, -1.70396, -4.772114, 1, 1, 1, 1, 1,
-0.4265299, -0.0942983, -1.007032, 1, 1, 1, 1, 1,
-0.4217267, 0.1115525, -0.2687178, 1, 1, 1, 1, 1,
-0.4151485, 0.180453, -0.05014066, 1, 1, 1, 1, 1,
-0.4149246, 0.4468059, -0.5292754, 1, 1, 1, 1, 1,
-0.4042146, 0.4821192, -2.118441, 0, 0, 1, 1, 1,
-0.4040736, -0.4517317, -2.287288, 1, 0, 0, 1, 1,
-0.3996014, -0.5676721, -2.446066, 1, 0, 0, 1, 1,
-0.3981219, -0.7289499, -2.927274, 1, 0, 0, 1, 1,
-0.3973117, -0.9742889, -2.169043, 1, 0, 0, 1, 1,
-0.3938677, 0.6147714, -0.1779517, 1, 0, 0, 1, 1,
-0.3936438, -0.9668413, -2.713023, 0, 0, 0, 1, 1,
-0.3904522, -0.2402934, -2.557, 0, 0, 0, 1, 1,
-0.3892766, 0.5971356, -2.232496, 0, 0, 0, 1, 1,
-0.3880084, -2.077493, -2.839908, 0, 0, 0, 1, 1,
-0.3795823, -1.709804, -3.237536, 0, 0, 0, 1, 1,
-0.3767051, -0.2786039, -2.682189, 0, 0, 0, 1, 1,
-0.3747263, 0.189245, -0.425043, 0, 0, 0, 1, 1,
-0.3685322, 1.177676, 1.304961, 1, 1, 1, 1, 1,
-0.3683597, 0.3947378, -1.322265, 1, 1, 1, 1, 1,
-0.3673721, -0.1700818, -2.434081, 1, 1, 1, 1, 1,
-0.3663659, 0.7120752, -0.6986621, 1, 1, 1, 1, 1,
-0.362168, 0.1689875, -1.268234, 1, 1, 1, 1, 1,
-0.3617382, 0.2854522, -1.377254, 1, 1, 1, 1, 1,
-0.3592119, -1.021924, -2.263566, 1, 1, 1, 1, 1,
-0.3576358, 0.6305221, 0.009873898, 1, 1, 1, 1, 1,
-0.3570622, -0.4598061, -2.743368, 1, 1, 1, 1, 1,
-0.3551126, 0.2126339, -0.03163114, 1, 1, 1, 1, 1,
-0.3511546, 0.2835732, -0.7067919, 1, 1, 1, 1, 1,
-0.3493748, -2.176596, -4.257991, 1, 1, 1, 1, 1,
-0.3485091, -0.3523766, -3.357961, 1, 1, 1, 1, 1,
-0.3476859, 0.3424952, 0.4865591, 1, 1, 1, 1, 1,
-0.342311, 0.01717315, -0.5939022, 1, 1, 1, 1, 1,
-0.3396518, -1.462203, -3.038317, 0, 0, 1, 1, 1,
-0.3391065, -0.1023386, -2.008571, 1, 0, 0, 1, 1,
-0.3349257, 0.7472231, -0.1789721, 1, 0, 0, 1, 1,
-0.3345125, -0.4305924, -3.385229, 1, 0, 0, 1, 1,
-0.3294292, -0.1312733, -2.309881, 1, 0, 0, 1, 1,
-0.3281651, 0.9082148, 1.654576, 1, 0, 0, 1, 1,
-0.3277503, -1.393007, -1.997055, 0, 0, 0, 1, 1,
-0.3251794, 1.054541, -0.4778155, 0, 0, 0, 1, 1,
-0.3242978, -0.2912662, -2.135226, 0, 0, 0, 1, 1,
-0.3237804, 0.609701, -0.4430655, 0, 0, 0, 1, 1,
-0.3222861, 0.5851827, 0.2842461, 0, 0, 0, 1, 1,
-0.3206437, -0.1169439, -2.629958, 0, 0, 0, 1, 1,
-0.3199993, 1.099927, 0.2853081, 0, 0, 0, 1, 1,
-0.314949, 0.4978877, -0.4816455, 1, 1, 1, 1, 1,
-0.3138554, -0.7027045, -4.246051, 1, 1, 1, 1, 1,
-0.310767, -0.8554404, -2.9287, 1, 1, 1, 1, 1,
-0.3104496, 2.347627, -1.604612, 1, 1, 1, 1, 1,
-0.3097813, 1.427059, 0.4879156, 1, 1, 1, 1, 1,
-0.3042785, 1.714314, -0.02913443, 1, 1, 1, 1, 1,
-0.2988613, -0.9783682, -4.771935, 1, 1, 1, 1, 1,
-0.2901194, -0.9140895, -4.505354, 1, 1, 1, 1, 1,
-0.2827931, 0.6589102, -0.2915065, 1, 1, 1, 1, 1,
-0.2827727, 0.2130127, 0.09616664, 1, 1, 1, 1, 1,
-0.2826713, 1.61861, -1.061919, 1, 1, 1, 1, 1,
-0.2809384, -1.130686, -2.846146, 1, 1, 1, 1, 1,
-0.2794142, -0.4895402, -2.993551, 1, 1, 1, 1, 1,
-0.2757836, -0.9422598, -3.365943, 1, 1, 1, 1, 1,
-0.2727298, -0.2547079, -3.272293, 1, 1, 1, 1, 1,
-0.271392, -1.590881, -2.847663, 0, 0, 1, 1, 1,
-0.2704132, -0.6258169, -2.363336, 1, 0, 0, 1, 1,
-0.2700735, 1.124164, -0.7925644, 1, 0, 0, 1, 1,
-0.2684258, -0.2739881, -2.898667, 1, 0, 0, 1, 1,
-0.2653387, -1.791722, -3.488552, 1, 0, 0, 1, 1,
-0.2631597, 0.9619756, -0.08680167, 1, 0, 0, 1, 1,
-0.2599281, -0.2495474, -0.7813405, 0, 0, 0, 1, 1,
-0.2598687, -1.002754, -2.703101, 0, 0, 0, 1, 1,
-0.256903, -0.4154652, -3.12826, 0, 0, 0, 1, 1,
-0.2562159, 1.232802, 0.3466218, 0, 0, 0, 1, 1,
-0.2511458, 0.303229, -0.2922792, 0, 0, 0, 1, 1,
-0.2495275, -2.194307, -3.489755, 0, 0, 0, 1, 1,
-0.2493134, -1.14398, -3.050186, 0, 0, 0, 1, 1,
-0.248297, 0.4391083, -0.3457989, 1, 1, 1, 1, 1,
-0.2469255, -0.6215179, -2.444431, 1, 1, 1, 1, 1,
-0.2450401, 0.5504385, 0.2182538, 1, 1, 1, 1, 1,
-0.2387727, 0.2307588, -2.411687, 1, 1, 1, 1, 1,
-0.238394, -0.5700047, -2.36285, 1, 1, 1, 1, 1,
-0.2371526, 1.580518, -0.3121952, 1, 1, 1, 1, 1,
-0.2351548, 0.740038, 0.1284471, 1, 1, 1, 1, 1,
-0.2346843, 1.270434, 1.542107, 1, 1, 1, 1, 1,
-0.229462, -0.7782051, -3.453596, 1, 1, 1, 1, 1,
-0.2292845, -0.4800429, -2.332659, 1, 1, 1, 1, 1,
-0.2287741, 1.216299, 1.949903, 1, 1, 1, 1, 1,
-0.228125, -0.06658112, -2.141168, 1, 1, 1, 1, 1,
-0.228112, 0.4085868, -1.163244, 1, 1, 1, 1, 1,
-0.2273629, 0.3246268, -0.09937814, 1, 1, 1, 1, 1,
-0.2261112, -0.7290685, -4.933714, 1, 1, 1, 1, 1,
-0.2230511, -1.023132, -4.078421, 0, 0, 1, 1, 1,
-0.2215465, -0.004807253, -0.1834865, 1, 0, 0, 1, 1,
-0.2176617, -1.773882, -3.066039, 1, 0, 0, 1, 1,
-0.2134456, 1.56559, 1.51005, 1, 0, 0, 1, 1,
-0.2125002, -0.05699331, -1.679102, 1, 0, 0, 1, 1,
-0.2053062, 0.7204997, -0.2013516, 1, 0, 0, 1, 1,
-0.205112, -1.725015, -2.797807, 0, 0, 0, 1, 1,
-0.2045653, -1.881539, -1.595816, 0, 0, 0, 1, 1,
-0.198789, 0.6792595, -0.3359374, 0, 0, 0, 1, 1,
-0.1985174, 0.380845, -0.4918472, 0, 0, 0, 1, 1,
-0.1960542, 0.6792786, -1.967409, 0, 0, 0, 1, 1,
-0.1945803, 0.04979257, -0.08947843, 0, 0, 0, 1, 1,
-0.1944254, 0.4789603, 0.1889395, 0, 0, 0, 1, 1,
-0.1908216, -0.6884873, -3.237323, 1, 1, 1, 1, 1,
-0.1890843, -0.9886328, -1.071502, 1, 1, 1, 1, 1,
-0.1798536, -0.8350086, -3.596941, 1, 1, 1, 1, 1,
-0.1756435, -1.725794, -3.275623, 1, 1, 1, 1, 1,
-0.1724641, 0.2942547, 1.110419, 1, 1, 1, 1, 1,
-0.1724308, 0.3658887, -0.7167445, 1, 1, 1, 1, 1,
-0.1689363, -0.3125702, -4.191244, 1, 1, 1, 1, 1,
-0.1633607, 0.6933328, 1.777251, 1, 1, 1, 1, 1,
-0.1595586, 0.5177704, -0.5106634, 1, 1, 1, 1, 1,
-0.157406, 1.604596, 1.222993, 1, 1, 1, 1, 1,
-0.156437, 0.626762, 0.7632143, 1, 1, 1, 1, 1,
-0.1540871, -0.2009439, -1.568049, 1, 1, 1, 1, 1,
-0.1482236, -0.3175759, -3.78486, 1, 1, 1, 1, 1,
-0.1474071, -1.16362, -3.899746, 1, 1, 1, 1, 1,
-0.1461651, -0.3363155, -3.31397, 1, 1, 1, 1, 1,
-0.1393386, -1.025004, -2.799324, 0, 0, 1, 1, 1,
-0.138765, -0.8057981, -3.424826, 1, 0, 0, 1, 1,
-0.1354836, -0.6472619, -3.709892, 1, 0, 0, 1, 1,
-0.1297613, 2.082217, -0.6687337, 1, 0, 0, 1, 1,
-0.127439, 0.01873276, -0.1091689, 1, 0, 0, 1, 1,
-0.1259415, 1.242311, -0.2865384, 1, 0, 0, 1, 1,
-0.1253758, -0.951322, -1.75899, 0, 0, 0, 1, 1,
-0.1245956, 1.281707, 0.1296739, 0, 0, 0, 1, 1,
-0.1196332, -1.409473, -1.834408, 0, 0, 0, 1, 1,
-0.1115922, -0.7787542, -3.688216, 0, 0, 0, 1, 1,
-0.1078203, 0.959336, -0.6793376, 0, 0, 0, 1, 1,
-0.1027959, 0.1283563, -0.09771699, 0, 0, 0, 1, 1,
-0.1012169, 0.1042922, -0.8907986, 0, 0, 0, 1, 1,
-0.09960524, -2.006325, -3.592807, 1, 1, 1, 1, 1,
-0.09717078, -1.57236, -4.363959, 1, 1, 1, 1, 1,
-0.09680294, 0.1906095, -0.5536788, 1, 1, 1, 1, 1,
-0.09622069, 0.1608377, -0.7289878, 1, 1, 1, 1, 1,
-0.09553438, -0.7989086, -4.067357, 1, 1, 1, 1, 1,
-0.09505997, 1.245264, 0.350505, 1, 1, 1, 1, 1,
-0.09294159, 0.2857602, 0.2715426, 1, 1, 1, 1, 1,
-0.08876986, 0.2856724, -0.4990531, 1, 1, 1, 1, 1,
-0.08835431, 2.114285, 1.419385, 1, 1, 1, 1, 1,
-0.08578203, -1.266082, -2.658737, 1, 1, 1, 1, 1,
-0.08411658, 2.175017, 0.04245497, 1, 1, 1, 1, 1,
-0.08162992, 0.5309281, 0.3295498, 1, 1, 1, 1, 1,
-0.08070686, -0.1726355, -2.669746, 1, 1, 1, 1, 1,
-0.07950573, 1.789336, -0.9330053, 1, 1, 1, 1, 1,
-0.07771906, -1.164887, -3.096091, 1, 1, 1, 1, 1,
-0.0771572, -0.5493902, -3.416423, 0, 0, 1, 1, 1,
-0.07344809, 0.3840799, -0.2716201, 1, 0, 0, 1, 1,
-0.07120355, -0.2788856, -3.887996, 1, 0, 0, 1, 1,
-0.06890234, 0.06860321, -0.5371594, 1, 0, 0, 1, 1,
-0.06728493, -0.6400698, -2.634064, 1, 0, 0, 1, 1,
-0.06627402, 0.3199029, 1.900825, 1, 0, 0, 1, 1,
-0.06461269, -1.156879, -3.722214, 0, 0, 0, 1, 1,
-0.06390847, -1.021197, -3.65569, 0, 0, 0, 1, 1,
-0.06348858, 1.110574, 0.477258, 0, 0, 0, 1, 1,
-0.06155604, -0.2103463, -2.943471, 0, 0, 0, 1, 1,
-0.05913159, 0.3879333, 0.1323927, 0, 0, 0, 1, 1,
-0.05274315, 0.8991398, 0.384601, 0, 0, 0, 1, 1,
-0.04727129, -1.665149, -2.562595, 0, 0, 0, 1, 1,
-0.04485648, -2.801982, -4.68118, 1, 1, 1, 1, 1,
-0.04484256, 0.3207471, 0.4820041, 1, 1, 1, 1, 1,
-0.04196676, 0.6299653, -0.4729039, 1, 1, 1, 1, 1,
-0.03570713, -0.1052579, -3.663197, 1, 1, 1, 1, 1,
-0.03382545, 0.9642781, 0.1589577, 1, 1, 1, 1, 1,
-0.03317915, -1.521256, -3.592426, 1, 1, 1, 1, 1,
-0.03253276, 1.293821, 1.122675, 1, 1, 1, 1, 1,
-0.03142171, -0.1956419, -4.122283, 1, 1, 1, 1, 1,
-0.03114329, 0.4358116, 0.1173749, 1, 1, 1, 1, 1,
-0.02771411, -0.08480813, -4.796908, 1, 1, 1, 1, 1,
-0.02638175, -0.3914274, -3.905499, 1, 1, 1, 1, 1,
-0.02275596, 1.196275, 1.568834, 1, 1, 1, 1, 1,
-0.01332557, 1.135868, 0.5125486, 1, 1, 1, 1, 1,
-0.01194038, -0.3744028, -4.260267, 1, 1, 1, 1, 1,
-0.009594846, 0.262752, -0.3957273, 1, 1, 1, 1, 1,
-0.00692327, -1.914676, -2.358991, 0, 0, 1, 1, 1,
-0.006916518, -0.448986, -3.513361, 1, 0, 0, 1, 1,
-0.003871636, -1.912422, -4.499734, 1, 0, 0, 1, 1,
-0.002768926, -0.2976092, -2.39127, 1, 0, 0, 1, 1,
0.0001353478, 0.4191619, -2.39095, 1, 0, 0, 1, 1,
0.006217252, 0.2140691, 0.595979, 1, 0, 0, 1, 1,
0.009318003, 0.7744936, -0.02209973, 0, 0, 0, 1, 1,
0.01009121, -0.5881732, 3.047717, 0, 0, 0, 1, 1,
0.01088749, -0.5614501, 3.778698, 0, 0, 0, 1, 1,
0.01211093, -1.458551, 3.970823, 0, 0, 0, 1, 1,
0.01245523, -0.2335279, 3.027688, 0, 0, 0, 1, 1,
0.01556682, 1.961039, -0.2141172, 0, 0, 0, 1, 1,
0.01907299, 1.955113, 0.2174001, 0, 0, 0, 1, 1,
0.02253516, 1.328989, -0.7813765, 1, 1, 1, 1, 1,
0.02382397, -1.404645, 2.36327, 1, 1, 1, 1, 1,
0.02439357, 0.6193877, 0.3860446, 1, 1, 1, 1, 1,
0.02490165, -0.0550419, 2.617428, 1, 1, 1, 1, 1,
0.02820106, 1.11476, -1.575571, 1, 1, 1, 1, 1,
0.03361766, -0.2719967, 2.536058, 1, 1, 1, 1, 1,
0.0344409, -1.38923, 2.259629, 1, 1, 1, 1, 1,
0.03457483, 1.575457, 2.244289, 1, 1, 1, 1, 1,
0.0426617, 0.5996112, 0.6308393, 1, 1, 1, 1, 1,
0.04418863, -0.5204045, -0.05511841, 1, 1, 1, 1, 1,
0.04438375, 0.1915253, -0.273727, 1, 1, 1, 1, 1,
0.04498563, 0.8574803, -0.04414238, 1, 1, 1, 1, 1,
0.04706972, 0.2108746, 1.10288, 1, 1, 1, 1, 1,
0.04723701, -1.066157, 2.361132, 1, 1, 1, 1, 1,
0.04772279, -0.8465898, 3.792715, 1, 1, 1, 1, 1,
0.04933531, 1.365644, 0.2929122, 0, 0, 1, 1, 1,
0.05151095, 0.6427429, -0.263323, 1, 0, 0, 1, 1,
0.0515128, 0.4481159, -0.5818896, 1, 0, 0, 1, 1,
0.05302927, 0.6380996, -0.1915678, 1, 0, 0, 1, 1,
0.05544784, 1.341217, -0.07167409, 1, 0, 0, 1, 1,
0.05840515, -1.372555, 5.029777, 1, 0, 0, 1, 1,
0.06105892, -2.439072, 2.712054, 0, 0, 0, 1, 1,
0.06463771, -1.826963, 3.484718, 0, 0, 0, 1, 1,
0.06778357, 2.162968, -0.13255, 0, 0, 0, 1, 1,
0.07218076, 1.355967, -0.6673521, 0, 0, 0, 1, 1,
0.07246722, 0.540922, 2.654065, 0, 0, 0, 1, 1,
0.07562973, -0.7030695, 1.542152, 0, 0, 0, 1, 1,
0.07926961, 0.9199717, 1.02037, 0, 0, 0, 1, 1,
0.08341819, -2.69217, 1.822699, 1, 1, 1, 1, 1,
0.08388184, -1.720477, 3.221434, 1, 1, 1, 1, 1,
0.08404588, 1.348852, -0.6584233, 1, 1, 1, 1, 1,
0.08923387, -1.171088, 1.162458, 1, 1, 1, 1, 1,
0.08971056, -0.3499302, 2.38671, 1, 1, 1, 1, 1,
0.1013718, 0.7513232, -0.1418034, 1, 1, 1, 1, 1,
0.1021517, -0.1195971, 2.038586, 1, 1, 1, 1, 1,
0.1035887, 0.809953, 0.6736099, 1, 1, 1, 1, 1,
0.1061669, 0.02468064, 2.285366, 1, 1, 1, 1, 1,
0.1088106, -0.7124809, 1.533619, 1, 1, 1, 1, 1,
0.1140518, 0.6503873, -1.918661, 1, 1, 1, 1, 1,
0.1142933, 2.217975, -0.7675099, 1, 1, 1, 1, 1,
0.1147659, -0.004609749, 1.469036, 1, 1, 1, 1, 1,
0.1149654, 0.7954964, 1.845566, 1, 1, 1, 1, 1,
0.1189829, -0.6533168, 4.301234, 1, 1, 1, 1, 1,
0.1200211, 0.2365897, -1.407409, 0, 0, 1, 1, 1,
0.1220876, -1.204157, 2.632605, 1, 0, 0, 1, 1,
0.1223043, 0.5828823, 0.5274217, 1, 0, 0, 1, 1,
0.1247532, 0.3592325, 1.432358, 1, 0, 0, 1, 1,
0.1264832, -0.3302493, 1.635591, 1, 0, 0, 1, 1,
0.1267634, -0.8288295, 1.821542, 1, 0, 0, 1, 1,
0.1272903, -0.1003709, 0.9364346, 0, 0, 0, 1, 1,
0.1325384, -1.002755, 4.262313, 0, 0, 0, 1, 1,
0.1359946, -0.07446713, 1.460185, 0, 0, 0, 1, 1,
0.1458597, -0.5794361, 3.968447, 0, 0, 0, 1, 1,
0.1517368, 0.7337137, 0.3390345, 0, 0, 0, 1, 1,
0.1538356, 0.6252223, 1.078379, 0, 0, 0, 1, 1,
0.1560244, -0.3100797, 0.2785385, 0, 0, 0, 1, 1,
0.1585746, 0.2561451, 1.380971, 1, 1, 1, 1, 1,
0.1595133, 1.762657, 0.2972648, 1, 1, 1, 1, 1,
0.1608753, -0.4605207, 2.489838, 1, 1, 1, 1, 1,
0.1633959, -0.02694925, 2.168055, 1, 1, 1, 1, 1,
0.1704779, 0.9500269, -2.467274, 1, 1, 1, 1, 1,
0.1721025, -1.030506, 2.430812, 1, 1, 1, 1, 1,
0.1730123, -0.4312457, 3.36992, 1, 1, 1, 1, 1,
0.1738185, -0.6204995, 1.507882, 1, 1, 1, 1, 1,
0.1775507, -1.771845, 3.389128, 1, 1, 1, 1, 1,
0.1779699, -0.8053224, 3.780313, 1, 1, 1, 1, 1,
0.1829675, -0.6490281, 3.309865, 1, 1, 1, 1, 1,
0.1849153, -0.9593864, 3.49412, 1, 1, 1, 1, 1,
0.1887324, 0.2863194, 0.2665796, 1, 1, 1, 1, 1,
0.1909521, -1.46356, 3.443361, 1, 1, 1, 1, 1,
0.1932382, -0.3339515, 3.300209, 1, 1, 1, 1, 1,
0.1970079, 0.8535404, 0.5114616, 0, 0, 1, 1, 1,
0.1993974, 1.508952, 1.20339, 1, 0, 0, 1, 1,
0.1994311, -0.8246482, 2.023916, 1, 0, 0, 1, 1,
0.2000177, -0.6968319, 3.837389, 1, 0, 0, 1, 1,
0.2057504, 1.363151, 0.5222182, 1, 0, 0, 1, 1,
0.2066385, -0.9630632, 3.27256, 1, 0, 0, 1, 1,
0.2117972, -0.982321, 4.772574, 0, 0, 0, 1, 1,
0.2127244, 0.006586247, 1.448319, 0, 0, 0, 1, 1,
0.2164506, -1.601569, 3.405756, 0, 0, 0, 1, 1,
0.221333, 0.1082031, -0.01096609, 0, 0, 0, 1, 1,
0.223466, 1.174563, -0.6755479, 0, 0, 0, 1, 1,
0.2290865, 1.56586, 0.5308847, 0, 0, 0, 1, 1,
0.2306937, -0.5535043, 0.7403891, 0, 0, 0, 1, 1,
0.23386, 0.3718932, -0.209012, 1, 1, 1, 1, 1,
0.2346707, 0.07047263, 2.805432, 1, 1, 1, 1, 1,
0.2377672, -0.4198001, 4.35777, 1, 1, 1, 1, 1,
0.2490357, -0.9494525, 3.009582, 1, 1, 1, 1, 1,
0.2523634, 1.737788, 0.2903224, 1, 1, 1, 1, 1,
0.2527162, -0.6240975, 2.182167, 1, 1, 1, 1, 1,
0.2533678, -1.250884, 3.077012, 1, 1, 1, 1, 1,
0.2552481, -0.4511438, 1.160718, 1, 1, 1, 1, 1,
0.2592493, 1.169542, 0.5640675, 1, 1, 1, 1, 1,
0.2662196, -1.573836, 4.328711, 1, 1, 1, 1, 1,
0.2695662, -1.943779, 2.338188, 1, 1, 1, 1, 1,
0.2740794, -1.07605, 3.701156, 1, 1, 1, 1, 1,
0.2802849, -0.8572035, 2.731149, 1, 1, 1, 1, 1,
0.2905896, -1.488702, 3.552053, 1, 1, 1, 1, 1,
0.2941916, 0.942432, 1.034167, 1, 1, 1, 1, 1,
0.2962129, 2.6474, -1.026869, 0, 0, 1, 1, 1,
0.3034978, -0.7125538, 2.399592, 1, 0, 0, 1, 1,
0.3076584, -0.7231053, 0.7732145, 1, 0, 0, 1, 1,
0.317681, -1.908165, 2.294583, 1, 0, 0, 1, 1,
0.3261508, 0.7911637, -0.2936173, 1, 0, 0, 1, 1,
0.3263216, -0.4038891, 1.996076, 1, 0, 0, 1, 1,
0.3284907, 0.6062253, 0.796708, 0, 0, 0, 1, 1,
0.333285, 1.05922, -0.2328887, 0, 0, 0, 1, 1,
0.334572, -0.8322164, 1.732513, 0, 0, 0, 1, 1,
0.3358318, 0.4386501, -0.1280681, 0, 0, 0, 1, 1,
0.3363916, -0.1575592, 1.28197, 0, 0, 0, 1, 1,
0.3389681, -0.6639253, 3.942019, 0, 0, 0, 1, 1,
0.3397836, 0.6478106, -0.9669408, 0, 0, 0, 1, 1,
0.3426766, -0.4586156, 1.952652, 1, 1, 1, 1, 1,
0.3430426, 0.07164552, 2.676095, 1, 1, 1, 1, 1,
0.3430997, -1.495768, 4.544158, 1, 1, 1, 1, 1,
0.3434029, 2.362329, -1.522044, 1, 1, 1, 1, 1,
0.3481861, -0.9367703, 1.73772, 1, 1, 1, 1, 1,
0.3493102, -1.050309, 4.052196, 1, 1, 1, 1, 1,
0.3496134, 0.02975227, 0.4546997, 1, 1, 1, 1, 1,
0.3535776, -0.271033, 1.690151, 1, 1, 1, 1, 1,
0.3537942, 1.482934, -0.3658047, 1, 1, 1, 1, 1,
0.3542338, 1.440017, 0.5326432, 1, 1, 1, 1, 1,
0.3572412, 0.2923945, 0.3549409, 1, 1, 1, 1, 1,
0.3576182, 0.3024647, -0.1908976, 1, 1, 1, 1, 1,
0.3653148, -2.08309, 2.306251, 1, 1, 1, 1, 1,
0.3681417, -0.3796378, 2.17506, 1, 1, 1, 1, 1,
0.3765701, 0.7831286, 0.7983208, 1, 1, 1, 1, 1,
0.380834, -2.25964, 3.377149, 0, 0, 1, 1, 1,
0.3815708, -1.494784, 2.680401, 1, 0, 0, 1, 1,
0.3828013, -0.1965221, 2.663925, 1, 0, 0, 1, 1,
0.3848449, -0.5389649, 2.103114, 1, 0, 0, 1, 1,
0.3854016, -0.7420027, 3.017183, 1, 0, 0, 1, 1,
0.3896, 0.7750281, 1.151659, 1, 0, 0, 1, 1,
0.3900075, -1.39606, 2.783197, 0, 0, 0, 1, 1,
0.3940103, 1.013851, -0.3463872, 0, 0, 0, 1, 1,
0.4069469, 0.3346417, 2.137289, 0, 0, 0, 1, 1,
0.4091822, 1.875722, -0.1565986, 0, 0, 0, 1, 1,
0.4098493, -1.684382, 4.37866, 0, 0, 0, 1, 1,
0.4104075, -0.2647512, 1.686426, 0, 0, 0, 1, 1,
0.4118002, -1.136795, 3.568684, 0, 0, 0, 1, 1,
0.4127873, 1.37939, 1.360259, 1, 1, 1, 1, 1,
0.4157512, 1.870199, -0.2568882, 1, 1, 1, 1, 1,
0.4197123, 0.879329, 1.369983, 1, 1, 1, 1, 1,
0.4254078, -0.4222355, 1.972516, 1, 1, 1, 1, 1,
0.4270475, 0.7206199, 0.2612633, 1, 1, 1, 1, 1,
0.4348471, -0.313462, 2.22711, 1, 1, 1, 1, 1,
0.4372094, 0.3562883, 0.05326721, 1, 1, 1, 1, 1,
0.4411024, 1.240592, 1.46072, 1, 1, 1, 1, 1,
0.4439836, 0.7238132, -1.102331, 1, 1, 1, 1, 1,
0.4472769, -0.6491536, 2.712874, 1, 1, 1, 1, 1,
0.4489147, -0.5397389, 3.188049, 1, 1, 1, 1, 1,
0.4497662, -0.556399, 1.310764, 1, 1, 1, 1, 1,
0.4535923, -0.5571983, 2.488828, 1, 1, 1, 1, 1,
0.4557307, -0.7380152, 2.994667, 1, 1, 1, 1, 1,
0.4588959, -1.379706, 2.472317, 1, 1, 1, 1, 1,
0.4603952, 0.8547944, 1.250549, 0, 0, 1, 1, 1,
0.4659814, -0.9161943, 0.709155, 1, 0, 0, 1, 1,
0.4665795, 0.4671389, 1.446034, 1, 0, 0, 1, 1,
0.4735053, -0.2433031, 1.946516, 1, 0, 0, 1, 1,
0.4739094, 0.3023147, 0.3426811, 1, 0, 0, 1, 1,
0.4762419, 1.018644, -0.1646987, 1, 0, 0, 1, 1,
0.4780303, 0.2412944, 1.593216, 0, 0, 0, 1, 1,
0.4892867, -0.5859758, 2.876818, 0, 0, 0, 1, 1,
0.4909901, 0.8906873, 1.388751, 0, 0, 0, 1, 1,
0.4958257, -0.6086113, 1.859995, 0, 0, 0, 1, 1,
0.4975751, -0.04021325, 1.270668, 0, 0, 0, 1, 1,
0.5028085, -0.1801226, 1.319077, 0, 0, 0, 1, 1,
0.5040231, 0.8258685, 2.330048, 0, 0, 0, 1, 1,
0.5057188, 0.2436851, 1.810492, 1, 1, 1, 1, 1,
0.5071319, -0.1360585, 2.389344, 1, 1, 1, 1, 1,
0.5076283, -0.6003624, 2.963508, 1, 1, 1, 1, 1,
0.5138577, -0.4720963, 2.132731, 1, 1, 1, 1, 1,
0.514133, 2.318326, 0.08967148, 1, 1, 1, 1, 1,
0.5173231, 0.999715, -0.3789673, 1, 1, 1, 1, 1,
0.5173432, -1.663899, 1.934151, 1, 1, 1, 1, 1,
0.5196199, 0.260124, 2.229628, 1, 1, 1, 1, 1,
0.5258672, 0.1436409, 1.570737, 1, 1, 1, 1, 1,
0.5268671, 1.230557, -1.799705, 1, 1, 1, 1, 1,
0.5291895, 0.603495, 1.457054, 1, 1, 1, 1, 1,
0.5297727, -0.4338812, 1.420299, 1, 1, 1, 1, 1,
0.5299142, -0.3657123, 2.996108, 1, 1, 1, 1, 1,
0.5380235, 1.074396, -0.697374, 1, 1, 1, 1, 1,
0.5391245, 2.328764, 0.5015283, 1, 1, 1, 1, 1,
0.5469782, -2.504879, 3.45988, 0, 0, 1, 1, 1,
0.5500223, -0.2742232, 3.307825, 1, 0, 0, 1, 1,
0.5507192, 1.250576, 0.2131791, 1, 0, 0, 1, 1,
0.5565898, -0.4477829, 3.180794, 1, 0, 0, 1, 1,
0.5602999, 1.093008, -0.2391095, 1, 0, 0, 1, 1,
0.5616596, -0.09406836, 2.498758, 1, 0, 0, 1, 1,
0.5626057, -1.462756, 3.252618, 0, 0, 0, 1, 1,
0.5652444, -0.7803234, 0.6098311, 0, 0, 0, 1, 1,
0.5676243, -0.2857344, 2.753143, 0, 0, 0, 1, 1,
0.5709737, 0.435563, -0.08010488, 0, 0, 0, 1, 1,
0.5734338, 0.5170288, 1.463387, 0, 0, 0, 1, 1,
0.5782983, -0.4429962, 2.154511, 0, 0, 0, 1, 1,
0.5863088, 0.2429438, 0.05664308, 0, 0, 0, 1, 1,
0.5913754, -1.120761, 3.055613, 1, 1, 1, 1, 1,
0.5925963, -0.606358, 2.830203, 1, 1, 1, 1, 1,
0.5962066, 1.643241, 0.3152874, 1, 1, 1, 1, 1,
0.5974384, 0.6444888, 1.457886, 1, 1, 1, 1, 1,
0.5981447, 0.5998752, 0.7149559, 1, 1, 1, 1, 1,
0.5985033, 0.1142984, 4.702765, 1, 1, 1, 1, 1,
0.6021591, -0.2927068, 4.253016, 1, 1, 1, 1, 1,
0.6037822, 0.9853579, 1.912741, 1, 1, 1, 1, 1,
0.6046294, -0.2644336, 0.7347126, 1, 1, 1, 1, 1,
0.6050375, -1.969118, 3.076106, 1, 1, 1, 1, 1,
0.6065074, 1.120134, 0.3561206, 1, 1, 1, 1, 1,
0.6078028, -0.4154139, 2.213309, 1, 1, 1, 1, 1,
0.6136302, -0.07047065, 2.168619, 1, 1, 1, 1, 1,
0.6162503, -0.9615029, 2.861885, 1, 1, 1, 1, 1,
0.6199252, -0.5259641, 3.229938, 1, 1, 1, 1, 1,
0.6212832, 0.05727163, 1.09854, 0, 0, 1, 1, 1,
0.6227945, -1.420511, 1.74604, 1, 0, 0, 1, 1,
0.6260815, 0.3133215, 2.97403, 1, 0, 0, 1, 1,
0.6277604, 0.1600428, 2.719886, 1, 0, 0, 1, 1,
0.6352543, -0.6388675, 2.822088, 1, 0, 0, 1, 1,
0.6363499, -1.140925, 0.565006, 1, 0, 0, 1, 1,
0.6401591, 0.3429984, 2.417392, 0, 0, 0, 1, 1,
0.64115, 0.4826593, 0.5046869, 0, 0, 0, 1, 1,
0.641875, -0.2655612, 1.91447, 0, 0, 0, 1, 1,
0.6469232, -0.4842, 2.469921, 0, 0, 0, 1, 1,
0.660863, 0.06132584, 0.7069362, 0, 0, 0, 1, 1,
0.6642184, 0.1848841, 1.868677, 0, 0, 0, 1, 1,
0.6698834, 1.3475, 0.8107631, 0, 0, 0, 1, 1,
0.670689, 0.7176736, 0.5229275, 1, 1, 1, 1, 1,
0.6732299, -0.2872823, 2.406649, 1, 1, 1, 1, 1,
0.6735953, 0.2310784, 2.180914, 1, 1, 1, 1, 1,
0.6749237, -0.1160973, 0.8930239, 1, 1, 1, 1, 1,
0.6760227, -0.3963702, 2.190526, 1, 1, 1, 1, 1,
0.6774127, -0.7750287, 0.9965174, 1, 1, 1, 1, 1,
0.680738, 1.309602, 0.9931907, 1, 1, 1, 1, 1,
0.6845145, 0.3162081, 1.647962, 1, 1, 1, 1, 1,
0.6853496, -1.254322, 2.201105, 1, 1, 1, 1, 1,
0.6906094, -1.985272, 2.300944, 1, 1, 1, 1, 1,
0.6913623, 0.2302897, 2.365272, 1, 1, 1, 1, 1,
0.6931998, -0.3900042, -0.2802161, 1, 1, 1, 1, 1,
0.6961395, -1.609148, 3.557692, 1, 1, 1, 1, 1,
0.6986185, -1.192078, 2.383378, 1, 1, 1, 1, 1,
0.7014062, -0.1952243, 1.634396, 1, 1, 1, 1, 1,
0.7056851, 0.3437711, 2.320742, 0, 0, 1, 1, 1,
0.7098761, 0.3605568, 1.478938, 1, 0, 0, 1, 1,
0.7122321, 0.5754719, 1.135897, 1, 0, 0, 1, 1,
0.7137387, -0.05895057, 3.625344, 1, 0, 0, 1, 1,
0.7141287, 1.05992, 0.5315877, 1, 0, 0, 1, 1,
0.7200963, -0.3375284, 2.889576, 1, 0, 0, 1, 1,
0.7256137, 1.620693, 0.1633714, 0, 0, 0, 1, 1,
0.7270228, -1.446934, 2.195757, 0, 0, 0, 1, 1,
0.7429363, 2.722761, -0.01969492, 0, 0, 0, 1, 1,
0.7450447, 0.03319656, 0.2462098, 0, 0, 0, 1, 1,
0.7456819, 1.102275, 2.270503, 0, 0, 0, 1, 1,
0.7457528, 0.2556829, 0.8031756, 0, 0, 0, 1, 1,
0.7553472, 1.561259, 1.043451, 0, 0, 0, 1, 1,
0.7608858, -2.643162, 4.854449, 1, 1, 1, 1, 1,
0.7662383, 0.8402561, 1.262534, 1, 1, 1, 1, 1,
0.7737375, 0.3211292, 0.3651414, 1, 1, 1, 1, 1,
0.7777929, 2.254678, -0.2448712, 1, 1, 1, 1, 1,
0.7809862, 1.593096, 1.369749, 1, 1, 1, 1, 1,
0.7812699, -0.1511528, 1.676596, 1, 1, 1, 1, 1,
0.7818331, -1.270537, 1.312465, 1, 1, 1, 1, 1,
0.7853287, 0.7582232, 0.09841145, 1, 1, 1, 1, 1,
0.7870255, 0.9759554, -0.7325664, 1, 1, 1, 1, 1,
0.7888422, 0.2256968, 1.833361, 1, 1, 1, 1, 1,
0.7890945, -0.02850842, 1.149488, 1, 1, 1, 1, 1,
0.7919751, -1.712021, 2.384035, 1, 1, 1, 1, 1,
0.7957849, 0.3432302, 0.7491512, 1, 1, 1, 1, 1,
0.7996135, -1.450291, 4.540164, 1, 1, 1, 1, 1,
0.800699, 0.9043942, 0.9290759, 1, 1, 1, 1, 1,
0.8033808, 0.1519963, 1.128117, 0, 0, 1, 1, 1,
0.804903, 0.690124, 0.7736141, 1, 0, 0, 1, 1,
0.807675, -0.4873894, 1.077336, 1, 0, 0, 1, 1,
0.8079713, 1.286324, 1.782581, 1, 0, 0, 1, 1,
0.8097363, -0.2041434, 1.816354, 1, 0, 0, 1, 1,
0.8126454, 0.7554986, -0.801132, 1, 0, 0, 1, 1,
0.8127816, -0.07009529, 1.500241, 0, 0, 0, 1, 1,
0.8131858, -0.8979192, 1.905571, 0, 0, 0, 1, 1,
0.8139785, 1.021013, -0.1481542, 0, 0, 0, 1, 1,
0.8144338, 0.114724, 0.8324487, 0, 0, 0, 1, 1,
0.8167362, -0.2180512, 2.721659, 0, 0, 0, 1, 1,
0.820663, 0.6893604, 0.9625366, 0, 0, 0, 1, 1,
0.8234978, -0.8765515, 4.141846, 0, 0, 0, 1, 1,
0.8246075, -0.7352282, 2.578019, 1, 1, 1, 1, 1,
0.8269563, 1.19909, 1.116903, 1, 1, 1, 1, 1,
0.833079, 0.9509843, 1.017557, 1, 1, 1, 1, 1,
0.8376104, -0.2089777, 3.150808, 1, 1, 1, 1, 1,
0.8376265, -0.1397659, -0.02609114, 1, 1, 1, 1, 1,
0.8380122, 0.1688823, 0.1361928, 1, 1, 1, 1, 1,
0.8393453, -0.3777958, 2.202431, 1, 1, 1, 1, 1,
0.8425935, 1.707965, 0.3727511, 1, 1, 1, 1, 1,
0.8527922, 0.6608588, 1.824943, 1, 1, 1, 1, 1,
0.8530689, 0.6078232, 0.4875487, 1, 1, 1, 1, 1,
0.8538873, -0.4573462, 1.670131, 1, 1, 1, 1, 1,
0.8556592, 0.1623733, 1.420699, 1, 1, 1, 1, 1,
0.8614004, 0.1806793, 3.666885, 1, 1, 1, 1, 1,
0.8707881, -0.8531667, 2.706114, 1, 1, 1, 1, 1,
0.8728682, -1.25212, 2.480764, 1, 1, 1, 1, 1,
0.8729628, -0.7653782, 3.102682, 0, 0, 1, 1, 1,
0.8744084, 0.3722878, 0.5686659, 1, 0, 0, 1, 1,
0.8793129, 0.6046929, 0.5498616, 1, 0, 0, 1, 1,
0.8900375, 0.2461032, 0.5631524, 1, 0, 0, 1, 1,
0.8910067, 1.604584, 1.507162, 1, 0, 0, 1, 1,
0.8917691, 0.9429851, -0.1748359, 1, 0, 0, 1, 1,
0.8930901, 0.03484332, 1.883818, 0, 0, 0, 1, 1,
0.8971624, 0.4178189, 0.6899138, 0, 0, 0, 1, 1,
0.8999646, 1.075654, -0.8255903, 0, 0, 0, 1, 1,
0.9102467, -1.555412, 3.043546, 0, 0, 0, 1, 1,
0.9114401, -0.7751904, 3.159602, 0, 0, 0, 1, 1,
0.9167405, 1.777165, 2.456682, 0, 0, 0, 1, 1,
0.9182582, -0.632184, 2.240774, 0, 0, 0, 1, 1,
0.9325848, -0.02204566, 1.802772, 1, 1, 1, 1, 1,
0.9344089, 0.9913715, 1.352346, 1, 1, 1, 1, 1,
0.9386364, -1.332597, 1.403824, 1, 1, 1, 1, 1,
0.9516383, 0.8377093, 1.129227, 1, 1, 1, 1, 1,
0.9662141, 0.9145894, 1.753678, 1, 1, 1, 1, 1,
0.9698003, -1.15964, 0.2226027, 1, 1, 1, 1, 1,
0.9816123, 0.1076498, 2.361696, 1, 1, 1, 1, 1,
0.9908631, 0.9230179, -0.1490926, 1, 1, 1, 1, 1,
0.9948074, -1.013765, 2.149993, 1, 1, 1, 1, 1,
0.9951339, -0.4087127, 2.036752, 1, 1, 1, 1, 1,
0.996602, 0.249907, 2.468128, 1, 1, 1, 1, 1,
1.006869, 1.058524, 1.062929, 1, 1, 1, 1, 1,
1.008458, -1.624614, 3.660495, 1, 1, 1, 1, 1,
1.009036, -1.15178, 2.432121, 1, 1, 1, 1, 1,
1.018907, 0.1763561, 0.8560371, 1, 1, 1, 1, 1,
1.019528, 1.569032, 2.124992, 0, 0, 1, 1, 1,
1.027038, 0.6210052, 2.188272, 1, 0, 0, 1, 1,
1.027161, -0.2798953, -0.1978271, 1, 0, 0, 1, 1,
1.030567, -1.789504, 1.937979, 1, 0, 0, 1, 1,
1.033734, 1.082793, 0.2732762, 1, 0, 0, 1, 1,
1.037559, -1.810225, 2.708977, 1, 0, 0, 1, 1,
1.047132, -0.1589768, 1.998459, 0, 0, 0, 1, 1,
1.048634, 0.09465503, 0.8310427, 0, 0, 0, 1, 1,
1.048821, 1.159128, 0.5133844, 0, 0, 0, 1, 1,
1.048843, 0.1605195, 1.274882, 0, 0, 0, 1, 1,
1.050851, 0.3318373, -0.6886945, 0, 0, 0, 1, 1,
1.05379, 0.2948915, 1.07873, 0, 0, 0, 1, 1,
1.054618, 1.54702, 1.38344, 0, 0, 0, 1, 1,
1.059154, 0.1503524, 0.5738051, 1, 1, 1, 1, 1,
1.060372, -1.744455, 2.681303, 1, 1, 1, 1, 1,
1.061172, -0.9271813, 2.425806, 1, 1, 1, 1, 1,
1.061291, -0.5762829, 2.51487, 1, 1, 1, 1, 1,
1.069206, 0.5595962, 0.2975262, 1, 1, 1, 1, 1,
1.074163, -0.3374541, 1.008117, 1, 1, 1, 1, 1,
1.075938, 0.2095588, 1.307003, 1, 1, 1, 1, 1,
1.078921, 1.762353, -0.225625, 1, 1, 1, 1, 1,
1.084137, 1.597585, 1.017618, 1, 1, 1, 1, 1,
1.084706, 0.282884, 1.299177, 1, 1, 1, 1, 1,
1.084883, -0.5517549, 2.60026, 1, 1, 1, 1, 1,
1.084918, 0.7422199, 2.622214, 1, 1, 1, 1, 1,
1.092797, 0.2449954, 1.521955, 1, 1, 1, 1, 1,
1.095887, 0.3797807, 0.02296109, 1, 1, 1, 1, 1,
1.101358, 0.2785114, 1.064754, 1, 1, 1, 1, 1,
1.128243, -0.9972556, 3.888568, 0, 0, 1, 1, 1,
1.1296, 0.0963162, 0.5822181, 1, 0, 0, 1, 1,
1.130737, 0.703258, -0.3994663, 1, 0, 0, 1, 1,
1.145028, -0.546014, 1.61239, 1, 0, 0, 1, 1,
1.146704, -0.791966, 0.6017674, 1, 0, 0, 1, 1,
1.148176, -0.05564639, 1.316894, 1, 0, 0, 1, 1,
1.160112, 0.1976184, -0.510314, 0, 0, 0, 1, 1,
1.161549, 0.5148947, 0.6563145, 0, 0, 0, 1, 1,
1.16628, -0.9894918, 1.808943, 0, 0, 0, 1, 1,
1.170266, -1.428535, 2.228148, 0, 0, 0, 1, 1,
1.171407, -0.03638738, 2.03166, 0, 0, 0, 1, 1,
1.174706, 0.4839022, 1.683939, 0, 0, 0, 1, 1,
1.179116, -0.8148431, 1.008224, 0, 0, 0, 1, 1,
1.18118, 1.270849, 0.9994758, 1, 1, 1, 1, 1,
1.198343, -0.6822651, 1.514436, 1, 1, 1, 1, 1,
1.206671, 0.4981558, 0.3774413, 1, 1, 1, 1, 1,
1.208135, -1.575558, 2.563553, 1, 1, 1, 1, 1,
1.219501, -1.05486, -0.04437706, 1, 1, 1, 1, 1,
1.221649, 0.4810306, 0.7251145, 1, 1, 1, 1, 1,
1.223696, 2.1465, 0.04855558, 1, 1, 1, 1, 1,
1.22605, -0.9661748, 2.727482, 1, 1, 1, 1, 1,
1.226392, -0.07712077, 2.929998, 1, 1, 1, 1, 1,
1.226569, -1.571454, 2.534983, 1, 1, 1, 1, 1,
1.227334, -0.1446041, 0.1599759, 1, 1, 1, 1, 1,
1.230298, 1.047782, 2.141124, 1, 1, 1, 1, 1,
1.232695, -0.3348753, 3.330967, 1, 1, 1, 1, 1,
1.235747, -0.3697105, 1.953017, 1, 1, 1, 1, 1,
1.249837, -0.406139, 1.975529, 1, 1, 1, 1, 1,
1.25468, -1.068202, 2.435712, 0, 0, 1, 1, 1,
1.257413, -0.7669075, 4.00816, 1, 0, 0, 1, 1,
1.257581, -0.8424795, 0.6440919, 1, 0, 0, 1, 1,
1.258654, -0.4657026, 1.901828, 1, 0, 0, 1, 1,
1.259285, -0.3931074, 0.6418443, 1, 0, 0, 1, 1,
1.271559, -0.9978341, 3.575723, 1, 0, 0, 1, 1,
1.2744, 0.7182338, 0.08356134, 0, 0, 0, 1, 1,
1.275894, -1.172281, 2.414574, 0, 0, 0, 1, 1,
1.277979, 0.2955459, 1.745292, 0, 0, 0, 1, 1,
1.279172, -0.4590484, 3.526906, 0, 0, 0, 1, 1,
1.29027, 2.116334, 0.2860814, 0, 0, 0, 1, 1,
1.293953, -1.624735, 4.231625, 0, 0, 0, 1, 1,
1.295603, 0.3802475, 1.330564, 0, 0, 0, 1, 1,
1.314592, 1.595568, 2.092182, 1, 1, 1, 1, 1,
1.324678, 0.5201588, 0.3143432, 1, 1, 1, 1, 1,
1.338129, -0.5592425, 2.035503, 1, 1, 1, 1, 1,
1.345166, 0.1091122, 3.657641, 1, 1, 1, 1, 1,
1.349197, 1.219867, 1.246421, 1, 1, 1, 1, 1,
1.35989, 0.3887051, 2.724625, 1, 1, 1, 1, 1,
1.375211, 1.137773, 1.078216, 1, 1, 1, 1, 1,
1.378362, 0.31429, 1.391332, 1, 1, 1, 1, 1,
1.414922, 0.586232, 1.241746, 1, 1, 1, 1, 1,
1.417321, 0.2649931, 1.407604, 1, 1, 1, 1, 1,
1.421897, -0.6073101, 1.085371, 1, 1, 1, 1, 1,
1.430734, 1.288666, -0.5891746, 1, 1, 1, 1, 1,
1.458036, 1.74279, 0.6526495, 1, 1, 1, 1, 1,
1.459033, -0.0745295, 2.069802, 1, 1, 1, 1, 1,
1.465054, -3.024861, 1.160032, 1, 1, 1, 1, 1,
1.466823, 0.9051256, 1.962935, 0, 0, 1, 1, 1,
1.467665, 1.210196, 1.399307, 1, 0, 0, 1, 1,
1.468261, -0.5814746, 2.301501, 1, 0, 0, 1, 1,
1.470462, -0.06366901, 1.241425, 1, 0, 0, 1, 1,
1.470789, -0.9577186, 2.426326, 1, 0, 0, 1, 1,
1.478519, -0.4411227, 2.202258, 1, 0, 0, 1, 1,
1.487583, 0.5444115, 0.6906717, 0, 0, 0, 1, 1,
1.490813, -1.153749, 2.279524, 0, 0, 0, 1, 1,
1.491479, 0.1982716, 2.795016, 0, 0, 0, 1, 1,
1.509862, -0.6238357, 3.369549, 0, 0, 0, 1, 1,
1.518541, -1.740904, 0.8617356, 0, 0, 0, 1, 1,
1.520904, 0.6418468, 1.235723, 0, 0, 0, 1, 1,
1.526519, 1.687201, 1.27127, 0, 0, 0, 1, 1,
1.537056, -1.16447, 1.929325, 1, 1, 1, 1, 1,
1.557534, 0.383314, 0.4028518, 1, 1, 1, 1, 1,
1.559201, -1.874007, 0.6093161, 1, 1, 1, 1, 1,
1.5836, -0.3163578, 2.771514, 1, 1, 1, 1, 1,
1.587303, 0.4914785, 1.786324, 1, 1, 1, 1, 1,
1.595405, -0.7748722, 2.428772, 1, 1, 1, 1, 1,
1.598538, 0.4222327, 2.096295, 1, 1, 1, 1, 1,
1.600331, 0.6151995, 2.437709, 1, 1, 1, 1, 1,
1.607215, -0.1197364, 2.787227, 1, 1, 1, 1, 1,
1.628034, -0.08478171, 1.886344, 1, 1, 1, 1, 1,
1.634612, -0.6271414, 1.13164, 1, 1, 1, 1, 1,
1.637038, -0.8596285, 2.600992, 1, 1, 1, 1, 1,
1.638951, 0.05113018, 2.049522, 1, 1, 1, 1, 1,
1.651161, -0.6040845, 1.943437, 1, 1, 1, 1, 1,
1.653243, -0.7254925, 1.666387, 1, 1, 1, 1, 1,
1.654484, 0.007235649, 2.316607, 0, 0, 1, 1, 1,
1.664531, 0.3398353, 3.345196, 1, 0, 0, 1, 1,
1.667926, 0.5330824, 0.7300969, 1, 0, 0, 1, 1,
1.690719, -1.663302, 2.260071, 1, 0, 0, 1, 1,
1.697517, 1.798698, 0.7689164, 1, 0, 0, 1, 1,
1.698515, 1.092094, -0.5150118, 1, 0, 0, 1, 1,
1.70891, 0.8691951, 1.078763, 0, 0, 0, 1, 1,
1.717235, -0.2240342, 2.834925, 0, 0, 0, 1, 1,
1.733104, -1.335996, 2.42923, 0, 0, 0, 1, 1,
1.73907, -0.1915402, 1.094445, 0, 0, 0, 1, 1,
1.743331, 0.8431662, 1.264523, 0, 0, 0, 1, 1,
1.745573, 0.137297, 0.8304755, 0, 0, 0, 1, 1,
1.747434, 0.5660439, -0.430253, 0, 0, 0, 1, 1,
1.756156, -0.8750975, 2.532317, 1, 1, 1, 1, 1,
1.768679, -0.1029995, 2.663699, 1, 1, 1, 1, 1,
1.769326, -0.1501315, 1.293319, 1, 1, 1, 1, 1,
1.77341, -0.2691756, 0.01828675, 1, 1, 1, 1, 1,
1.779674, 0.78601, 2.654248, 1, 1, 1, 1, 1,
1.783605, -0.2579831, 2.257613, 1, 1, 1, 1, 1,
1.786183, -1.516679, 2.702456, 1, 1, 1, 1, 1,
1.790559, -0.8111311, 1.897989, 1, 1, 1, 1, 1,
1.801109, 0.732364, 1.163424, 1, 1, 1, 1, 1,
1.80856, 1.25288, 2.112525, 1, 1, 1, 1, 1,
1.861276, 1.126963, 1.829911, 1, 1, 1, 1, 1,
1.87945, -0.468911, 2.989378, 1, 1, 1, 1, 1,
1.944273, -1.205099, 2.035506, 1, 1, 1, 1, 1,
2.011814, 0.03955035, 2.589342, 1, 1, 1, 1, 1,
2.058542, 1.262982, 1.680662, 1, 1, 1, 1, 1,
2.065336, -1.561468, 1.581744, 0, 0, 1, 1, 1,
2.116994, -0.3725347, 1.891189, 1, 0, 0, 1, 1,
2.119493, 0.2535245, 3.384396, 1, 0, 0, 1, 1,
2.130922, -1.535823, 0.7170277, 1, 0, 0, 1, 1,
2.135807, -0.3180626, 1.199081, 1, 0, 0, 1, 1,
2.140378, 0.3349502, 2.551816, 1, 0, 0, 1, 1,
2.179766, -0.2864808, 1.106255, 0, 0, 0, 1, 1,
2.225358, -0.9704947, 4.166557, 0, 0, 0, 1, 1,
2.249275, 0.5533769, 0.5033207, 0, 0, 0, 1, 1,
2.254058, 0.6438882, 0.9314553, 0, 0, 0, 1, 1,
2.268118, -0.1221208, 0.3437032, 0, 0, 0, 1, 1,
2.329528, -0.5520108, 1.293358, 0, 0, 0, 1, 1,
2.370366, -2.214071, 2.297113, 0, 0, 0, 1, 1,
2.408782, -1.245155, -0.4193481, 1, 1, 1, 1, 1,
2.437958, -1.139907, 2.122944, 1, 1, 1, 1, 1,
2.487152, -0.2263673, 1.573212, 1, 1, 1, 1, 1,
2.535127, -0.7501258, 2.238317, 1, 1, 1, 1, 1,
3.057552, 0.1047047, 2.113962, 1, 1, 1, 1, 1,
3.099856, -0.05913236, 0.2582307, 1, 1, 1, 1, 1,
3.458792, -1.546076, 3.154391, 1, 1, 1, 1, 1
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
var radius = 9.434955;
var distance = 33.13988;
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
mvMatrix.translate( -0.3208218, 0.4239419, -0.04803109 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.13988);
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
