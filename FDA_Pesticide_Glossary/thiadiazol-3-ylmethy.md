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
-3.393719, 0.6000264, -3.704104, 1, 0, 0, 1,
-2.956313, 0.1432381, -2.220231, 1, 0.007843138, 0, 1,
-2.752823, 2.175015, -0.7435316, 1, 0.01176471, 0, 1,
-2.65978, -0.7911807, -2.066762, 1, 0.01960784, 0, 1,
-2.562429, 0.6284955, -2.083441, 1, 0.02352941, 0, 1,
-2.526579, 0.3934113, -1.5872, 1, 0.03137255, 0, 1,
-2.486379, -1.32959, -3.104827, 1, 0.03529412, 0, 1,
-2.382519, 0.9945816, -1.521388, 1, 0.04313726, 0, 1,
-2.310673, 0.2909544, -0.9676161, 1, 0.04705882, 0, 1,
-2.278741, 0.05826428, -2.899751, 1, 0.05490196, 0, 1,
-2.268423, 0.3264268, -1.054254, 1, 0.05882353, 0, 1,
-2.189909, -0.7463061, -2.53822, 1, 0.06666667, 0, 1,
-2.122306, -0.6814024, -1.788745, 1, 0.07058824, 0, 1,
-2.120442, 0.4157145, -2.593646, 1, 0.07843138, 0, 1,
-2.110708, 0.1274017, -2.835914, 1, 0.08235294, 0, 1,
-2.100164, -0.05307952, -1.858904, 1, 0.09019608, 0, 1,
-2.097093, 0.2132429, -1.063714, 1, 0.09411765, 0, 1,
-2.097066, -0.6365255, -1.178076, 1, 0.1019608, 0, 1,
-2.081146, -0.5519706, -0.9948779, 1, 0.1098039, 0, 1,
-2.07657, 0.7899336, -0.5522246, 1, 0.1137255, 0, 1,
-2.055407, 0.2706181, 0.4627379, 1, 0.1215686, 0, 1,
-2.012499, -1.178908, -1.995532, 1, 0.1254902, 0, 1,
-1.997993, -0.08834536, -2.793753, 1, 0.1333333, 0, 1,
-1.974778, 0.7467553, -1.221766, 1, 0.1372549, 0, 1,
-1.965241, -2.808401, -1.41708, 1, 0.145098, 0, 1,
-1.842514, -1.232341, -3.08059, 1, 0.1490196, 0, 1,
-1.839181, 0.08182344, -1.264469, 1, 0.1568628, 0, 1,
-1.82988, -0.331536, -2.63211, 1, 0.1607843, 0, 1,
-1.822072, 1.819272, -0.5575178, 1, 0.1686275, 0, 1,
-1.81695, 0.9064119, -1.763298, 1, 0.172549, 0, 1,
-1.804587, 0.1783149, -2.224458, 1, 0.1803922, 0, 1,
-1.802869, -1.166163, -3.396282, 1, 0.1843137, 0, 1,
-1.744347, -0.6199799, -2.193639, 1, 0.1921569, 0, 1,
-1.734723, -0.5608445, -1.807923, 1, 0.1960784, 0, 1,
-1.721684, 0.1820736, -1.595043, 1, 0.2039216, 0, 1,
-1.717032, -0.3644946, -1.074967, 1, 0.2117647, 0, 1,
-1.694258, 2.250149, -1.797547, 1, 0.2156863, 0, 1,
-1.688948, 0.1722144, -1.946254, 1, 0.2235294, 0, 1,
-1.688186, -0.2821516, -2.485808, 1, 0.227451, 0, 1,
-1.687172, -0.5076032, -2.838381, 1, 0.2352941, 0, 1,
-1.682704, -0.566364, -3.651926, 1, 0.2392157, 0, 1,
-1.662213, -0.8038353, -1.738286, 1, 0.2470588, 0, 1,
-1.642771, 0.7812427, -1.409268, 1, 0.2509804, 0, 1,
-1.630191, 1.074782, -1.70856, 1, 0.2588235, 0, 1,
-1.612364, 1.024944, -1.314098, 1, 0.2627451, 0, 1,
-1.57788, 0.1570105, -2.613649, 1, 0.2705882, 0, 1,
-1.557151, 0.5041288, -0.7355359, 1, 0.2745098, 0, 1,
-1.535935, 0.8654774, -2.138861, 1, 0.282353, 0, 1,
-1.525333, -0.829404, -1.511962, 1, 0.2862745, 0, 1,
-1.524496, 0.8465335, -1.40353, 1, 0.2941177, 0, 1,
-1.51809, -0.2760903, -0.8337481, 1, 0.3019608, 0, 1,
-1.498138, 0.07880504, -2.552459, 1, 0.3058824, 0, 1,
-1.495574, -0.6413759, -1.626461, 1, 0.3137255, 0, 1,
-1.47716, -0.901881, -1.059417, 1, 0.3176471, 0, 1,
-1.463648, 0.2009813, -1.207172, 1, 0.3254902, 0, 1,
-1.460434, -0.06230021, -3.531301, 1, 0.3294118, 0, 1,
-1.45991, -0.3184068, -3.76785, 1, 0.3372549, 0, 1,
-1.44211, -0.9420564, -1.692217, 1, 0.3411765, 0, 1,
-1.437588, -0.1865782, -0.5603997, 1, 0.3490196, 0, 1,
-1.428945, 0.9032459, -1.610944, 1, 0.3529412, 0, 1,
-1.416784, -2.229534, -3.127195, 1, 0.3607843, 0, 1,
-1.411961, 0.1934458, -2.654495, 1, 0.3647059, 0, 1,
-1.410908, -0.9398177, -0.8057765, 1, 0.372549, 0, 1,
-1.40955, 0.2110255, -3.683682, 1, 0.3764706, 0, 1,
-1.379427, -0.4106359, -1.33998, 1, 0.3843137, 0, 1,
-1.371928, 0.3787615, -1.15822, 1, 0.3882353, 0, 1,
-1.36263, -0.4367972, -1.885831, 1, 0.3960784, 0, 1,
-1.360789, 1.140585, -1.855008, 1, 0.4039216, 0, 1,
-1.360618, -1.075727, -2.799909, 1, 0.4078431, 0, 1,
-1.354374, 1.091251, -1.344238, 1, 0.4156863, 0, 1,
-1.35405, 0.497473, -1.433022, 1, 0.4196078, 0, 1,
-1.344325, 0.1048019, -2.322455, 1, 0.427451, 0, 1,
-1.331584, 0.913146, -1.006153, 1, 0.4313726, 0, 1,
-1.309786, 0.576876, -1.55542, 1, 0.4392157, 0, 1,
-1.298699, -0.3495767, -0.9142465, 1, 0.4431373, 0, 1,
-1.294345, -0.4369819, -0.9539518, 1, 0.4509804, 0, 1,
-1.291955, 0.3278415, -2.320669, 1, 0.454902, 0, 1,
-1.290801, -1.507743, -1.812023, 1, 0.4627451, 0, 1,
-1.290705, 1.053969, -2.052098, 1, 0.4666667, 0, 1,
-1.284148, -0.5574642, -2.901854, 1, 0.4745098, 0, 1,
-1.277092, -0.5019277, -1.70241, 1, 0.4784314, 0, 1,
-1.27659, 1.43057, -0.5443172, 1, 0.4862745, 0, 1,
-1.273901, 1.172843, -1.656737, 1, 0.4901961, 0, 1,
-1.242784, 0.2069413, -1.880909, 1, 0.4980392, 0, 1,
-1.240484, 0.1219713, -2.490093, 1, 0.5058824, 0, 1,
-1.239433, 0.9690409, -1.131651, 1, 0.509804, 0, 1,
-1.237342, 0.1037402, -1.43044, 1, 0.5176471, 0, 1,
-1.231992, -1.400451, -2.321049, 1, 0.5215687, 0, 1,
-1.218491, -0.9821971, -2.368951, 1, 0.5294118, 0, 1,
-1.213974, 0.1875947, 0.7702568, 1, 0.5333334, 0, 1,
-1.212492, -1.125163, -2.062807, 1, 0.5411765, 0, 1,
-1.208757, -0.6420323, -0.4943599, 1, 0.5450981, 0, 1,
-1.208706, -0.86472, -0.2832749, 1, 0.5529412, 0, 1,
-1.206092, 1.659451, 0.115628, 1, 0.5568628, 0, 1,
-1.181364, 0.8889539, 1.613942, 1, 0.5647059, 0, 1,
-1.180099, 1.152385, -1.519908, 1, 0.5686275, 0, 1,
-1.1748, -2.435967, -3.201801, 1, 0.5764706, 0, 1,
-1.164507, 0.6565566, -2.619812, 1, 0.5803922, 0, 1,
-1.159357, -0.00969295, -1.414662, 1, 0.5882353, 0, 1,
-1.154699, -0.1392648, -3.331591, 1, 0.5921569, 0, 1,
-1.150383, 0.1904856, 1.304685, 1, 0.6, 0, 1,
-1.148839, -0.244889, -2.210735, 1, 0.6078432, 0, 1,
-1.143841, -0.7118266, -4.289906, 1, 0.6117647, 0, 1,
-1.134328, 2.031448, 0.1994523, 1, 0.6196079, 0, 1,
-1.131872, 0.2316664, -0.2757171, 1, 0.6235294, 0, 1,
-1.116443, -0.1250753, -1.161281, 1, 0.6313726, 0, 1,
-1.108322, -0.5042499, -2.027836, 1, 0.6352941, 0, 1,
-1.106115, -1.292359, -2.097159, 1, 0.6431373, 0, 1,
-1.097455, 0.8389822, -0.4300002, 1, 0.6470588, 0, 1,
-1.091851, -0.7234209, -2.580628, 1, 0.654902, 0, 1,
-1.091241, 0.6854544, -2.258582, 1, 0.6588235, 0, 1,
-1.086154, 2.538754, -1.580863, 1, 0.6666667, 0, 1,
-1.085874, -0.6726876, -1.822845, 1, 0.6705883, 0, 1,
-1.084599, -0.1790536, -1.001002, 1, 0.6784314, 0, 1,
-1.076863, -0.2438472, -2.045301, 1, 0.682353, 0, 1,
-1.07458, 1.053588, 0.002147052, 1, 0.6901961, 0, 1,
-1.07005, 0.955136, 0.3887361, 1, 0.6941177, 0, 1,
-1.046377, 0.4455482, -1.166161, 1, 0.7019608, 0, 1,
-1.041346, -0.3205377, -0.6550586, 1, 0.7098039, 0, 1,
-1.041116, -0.2352335, -2.898203, 1, 0.7137255, 0, 1,
-1.036054, 0.5822648, -0.7975481, 1, 0.7215686, 0, 1,
-1.030693, 0.01212496, -0.6241433, 1, 0.7254902, 0, 1,
-1.029949, 0.6124446, -3.101708, 1, 0.7333333, 0, 1,
-1.026707, 1.440865, 0.4498243, 1, 0.7372549, 0, 1,
-1.025316, 0.3088462, -0.5430228, 1, 0.7450981, 0, 1,
-1.022638, 0.2483455, -2.911501, 1, 0.7490196, 0, 1,
-1.020846, -0.2897942, -3.663833, 1, 0.7568628, 0, 1,
-0.9974971, 1.507531, 0.9100162, 1, 0.7607843, 0, 1,
-0.9949181, -0.8262259, -3.979522, 1, 0.7686275, 0, 1,
-0.9889622, -0.1717743, -2.187785, 1, 0.772549, 0, 1,
-0.9786432, 0.9677103, 0.3079422, 1, 0.7803922, 0, 1,
-0.9757451, -0.2416137, -2.973634, 1, 0.7843137, 0, 1,
-0.9735845, -1.851874, -1.639226, 1, 0.7921569, 0, 1,
-0.9660465, 0.6147885, -0.003150837, 1, 0.7960784, 0, 1,
-0.9641697, 1.005164, 0.5800174, 1, 0.8039216, 0, 1,
-0.9612552, -1.956694, -1.411265, 1, 0.8117647, 0, 1,
-0.9607738, -0.7902533, -2.837896, 1, 0.8156863, 0, 1,
-0.9580445, 0.9919525, 0.01169331, 1, 0.8235294, 0, 1,
-0.9574851, 0.6487017, -2.080839, 1, 0.827451, 0, 1,
-0.9528942, -1.070856, -2.509501, 1, 0.8352941, 0, 1,
-0.9525329, 0.7413475, -2.848719, 1, 0.8392157, 0, 1,
-0.9474336, 0.05513112, -2.184899, 1, 0.8470588, 0, 1,
-0.9423925, 0.3793566, -1.828616, 1, 0.8509804, 0, 1,
-0.9405329, -0.1419252, -1.547926, 1, 0.8588235, 0, 1,
-0.9336545, 1.323586, -0.915027, 1, 0.8627451, 0, 1,
-0.929455, -0.7010998, -3.860099, 1, 0.8705882, 0, 1,
-0.9282783, 0.9772407, 0.674728, 1, 0.8745098, 0, 1,
-0.9269364, 0.1986237, 0.2706646, 1, 0.8823529, 0, 1,
-0.926738, 0.1364835, -0.9253221, 1, 0.8862745, 0, 1,
-0.923413, 1.007139, -1.051533, 1, 0.8941177, 0, 1,
-0.9227912, 0.6059619, -1.751363, 1, 0.8980392, 0, 1,
-0.9182474, -1.25674, -1.788326, 1, 0.9058824, 0, 1,
-0.9158518, 0.7416028, -1.095085, 1, 0.9137255, 0, 1,
-0.9134349, 1.012767, -1.124492, 1, 0.9176471, 0, 1,
-0.9117899, -1.901396, -3.262395, 1, 0.9254902, 0, 1,
-0.9073389, 1.696756, 0.07322695, 1, 0.9294118, 0, 1,
-0.9049871, 1.0717, -2.527666, 1, 0.9372549, 0, 1,
-0.8990646, 0.1351924, -2.503073, 1, 0.9411765, 0, 1,
-0.8974839, 1.182026, -2.351536, 1, 0.9490196, 0, 1,
-0.8961182, 0.2303479, -1.498615, 1, 0.9529412, 0, 1,
-0.8937597, -0.3069935, -2.520838, 1, 0.9607843, 0, 1,
-0.8807685, -1.14895, -3.45117, 1, 0.9647059, 0, 1,
-0.8774875, -2.068825, -3.335309, 1, 0.972549, 0, 1,
-0.8764756, 0.0961009, -2.088441, 1, 0.9764706, 0, 1,
-0.8654178, 0.7955636, 0.05726116, 1, 0.9843137, 0, 1,
-0.8577787, -1.495582, -2.429575, 1, 0.9882353, 0, 1,
-0.8514539, 0.1058458, -1.776036, 1, 0.9960784, 0, 1,
-0.8513554, -0.7598028, -2.299228, 0.9960784, 1, 0, 1,
-0.8497403, -0.5785004, -3.373732, 0.9921569, 1, 0, 1,
-0.848249, 0.08422855, 0.4594566, 0.9843137, 1, 0, 1,
-0.8441597, 0.7565013, -0.00490287, 0.9803922, 1, 0, 1,
-0.8420603, -1.185431, -0.2858815, 0.972549, 1, 0, 1,
-0.8343277, 0.2704293, -0.483902, 0.9686275, 1, 0, 1,
-0.834192, 1.746469, 0.1719284, 0.9607843, 1, 0, 1,
-0.8310648, -1.137727, -0.7299486, 0.9568627, 1, 0, 1,
-0.8263146, 0.7393044, -0.8056312, 0.9490196, 1, 0, 1,
-0.8167838, -0.07807735, -0.672172, 0.945098, 1, 0, 1,
-0.8126315, -1.389142, -2.467833, 0.9372549, 1, 0, 1,
-0.8097129, 0.1124209, -1.601336, 0.9333333, 1, 0, 1,
-0.8020331, -0.2103874, -2.89285, 0.9254902, 1, 0, 1,
-0.7993606, -0.5978237, -1.594019, 0.9215686, 1, 0, 1,
-0.79677, 1.496502, -0.3010293, 0.9137255, 1, 0, 1,
-0.7946007, 0.610572, -1.30829, 0.9098039, 1, 0, 1,
-0.7936631, -0.4910853, -2.937355, 0.9019608, 1, 0, 1,
-0.7872231, 0.2486463, -0.2898689, 0.8941177, 1, 0, 1,
-0.7832038, -0.4413039, -1.328743, 0.8901961, 1, 0, 1,
-0.7811509, -0.4213545, -1.728085, 0.8823529, 1, 0, 1,
-0.7793398, -0.4904056, -1.490381, 0.8784314, 1, 0, 1,
-0.7774132, 0.5625528, -1.857873, 0.8705882, 1, 0, 1,
-0.7745678, -1.371535, -1.52954, 0.8666667, 1, 0, 1,
-0.7717577, -1.988513, -2.449571, 0.8588235, 1, 0, 1,
-0.7682967, -1.685481, -2.326978, 0.854902, 1, 0, 1,
-0.7676397, -0.8535194, -1.831506, 0.8470588, 1, 0, 1,
-0.7660133, 0.5565586, -0.4111252, 0.8431373, 1, 0, 1,
-0.76381, 0.4287284, -1.736118, 0.8352941, 1, 0, 1,
-0.7615475, 0.07007664, -1.8025, 0.8313726, 1, 0, 1,
-0.7608568, -0.6908366, -1.178411, 0.8235294, 1, 0, 1,
-0.7607919, 0.6641821, -0.7019665, 0.8196079, 1, 0, 1,
-0.7557691, -0.02125971, -1.844233, 0.8117647, 1, 0, 1,
-0.7537643, -1.721804, -2.243919, 0.8078431, 1, 0, 1,
-0.7460548, -2.235423, -0.3682207, 0.8, 1, 0, 1,
-0.7349687, -0.780524, -2.798599, 0.7921569, 1, 0, 1,
-0.7281497, 1.738856, -2.944268, 0.7882353, 1, 0, 1,
-0.7279246, -0.8609594, -4.930633, 0.7803922, 1, 0, 1,
-0.7172416, -0.9762778, -0.9130309, 0.7764706, 1, 0, 1,
-0.7118009, -1.580154, -2.04584, 0.7686275, 1, 0, 1,
-0.7060611, 1.13659, -1.856885, 0.7647059, 1, 0, 1,
-0.7036563, 0.550288, -0.7509147, 0.7568628, 1, 0, 1,
-0.6994823, -0.4533366, -2.824387, 0.7529412, 1, 0, 1,
-0.6993668, 0.1807132, -2.990658, 0.7450981, 1, 0, 1,
-0.695523, 0.7984284, -1.02965, 0.7411765, 1, 0, 1,
-0.6926152, -0.2485022, -1.875016, 0.7333333, 1, 0, 1,
-0.6925415, -1.63971, -2.035378, 0.7294118, 1, 0, 1,
-0.6901972, -0.8105178, -3.219898, 0.7215686, 1, 0, 1,
-0.68911, 1.84324, -1.21469, 0.7176471, 1, 0, 1,
-0.6842031, -0.7210699, -2.933521, 0.7098039, 1, 0, 1,
-0.6815171, -0.2586676, -2.901672, 0.7058824, 1, 0, 1,
-0.6778261, -1.423839, -3.68977, 0.6980392, 1, 0, 1,
-0.6773561, -1.011914, -3.639621, 0.6901961, 1, 0, 1,
-0.6766968, 0.4273455, -1.764901, 0.6862745, 1, 0, 1,
-0.6760004, -0.4257449, -1.597507, 0.6784314, 1, 0, 1,
-0.675752, -0.9915472, -2.573785, 0.6745098, 1, 0, 1,
-0.675315, 0.3413249, 0.9155887, 0.6666667, 1, 0, 1,
-0.6738375, -0.4079325, -1.513642, 0.6627451, 1, 0, 1,
-0.6726688, 0.6219203, 1.617825, 0.654902, 1, 0, 1,
-0.6726277, 0.516888, -0.3709478, 0.6509804, 1, 0, 1,
-0.6679783, 1.442303, -1.721517, 0.6431373, 1, 0, 1,
-0.6596127, 0.7806686, -1.712462, 0.6392157, 1, 0, 1,
-0.6589242, -0.5977122, -1.330979, 0.6313726, 1, 0, 1,
-0.6551493, -0.4895526, -1.6962, 0.627451, 1, 0, 1,
-0.6546945, 0.1242405, -0.228085, 0.6196079, 1, 0, 1,
-0.6539991, 1.498711, 1.035747, 0.6156863, 1, 0, 1,
-0.6504038, -0.5621372, 0.02523863, 0.6078432, 1, 0, 1,
-0.6443713, -0.7190869, -0.7070125, 0.6039216, 1, 0, 1,
-0.6401706, -1.729041, -1.939126, 0.5960785, 1, 0, 1,
-0.6385552, 0.9513266, -2.363682, 0.5882353, 1, 0, 1,
-0.6371382, -0.3630273, -3.395195, 0.5843138, 1, 0, 1,
-0.6363203, -1.110597, -3.309949, 0.5764706, 1, 0, 1,
-0.6337694, 0.2618292, -1.151099, 0.572549, 1, 0, 1,
-0.6322429, 0.8053915, -1.557898, 0.5647059, 1, 0, 1,
-0.6213828, 1.281065, -1.71262, 0.5607843, 1, 0, 1,
-0.6212198, 0.3362378, -2.125662, 0.5529412, 1, 0, 1,
-0.6192589, 0.1074892, -0.595987, 0.5490196, 1, 0, 1,
-0.6148038, -0.963129, -2.042512, 0.5411765, 1, 0, 1,
-0.614595, 1.153672, -0.09814074, 0.5372549, 1, 0, 1,
-0.6082754, -0.3452747, -1.995673, 0.5294118, 1, 0, 1,
-0.6078196, -0.1815652, -1.887266, 0.5254902, 1, 0, 1,
-0.6063864, 0.8024521, -1.607422, 0.5176471, 1, 0, 1,
-0.6063814, -0.06754389, -2.226, 0.5137255, 1, 0, 1,
-0.6051131, 0.5255518, 0.249284, 0.5058824, 1, 0, 1,
-0.6040538, -0.1731534, -4.166254, 0.5019608, 1, 0, 1,
-0.6016294, -0.6399922, -2.712378, 0.4941176, 1, 0, 1,
-0.5987983, 2.038502, -0.3593138, 0.4862745, 1, 0, 1,
-0.5973502, 1.272275, 0.1293809, 0.4823529, 1, 0, 1,
-0.5949548, 0.02901635, -0.6544521, 0.4745098, 1, 0, 1,
-0.5924227, -1.129924, -3.217949, 0.4705882, 1, 0, 1,
-0.5912591, -1.787816, -4.35174, 0.4627451, 1, 0, 1,
-0.5888612, 0.1831266, -0.7312472, 0.4588235, 1, 0, 1,
-0.5841202, 0.03644235, -2.806833, 0.4509804, 1, 0, 1,
-0.5802892, -0.5943996, -2.3921, 0.4470588, 1, 0, 1,
-0.5782657, 0.1681477, -1.292814, 0.4392157, 1, 0, 1,
-0.5778543, -0.1123077, -3.117036, 0.4352941, 1, 0, 1,
-0.5766455, -0.6199856, -2.526908, 0.427451, 1, 0, 1,
-0.5744455, -0.6173393, -3.019737, 0.4235294, 1, 0, 1,
-0.5731749, 0.4308712, -0.8038026, 0.4156863, 1, 0, 1,
-0.5697094, 1.406063, 1.113488, 0.4117647, 1, 0, 1,
-0.5679528, -0.4518584, -2.572619, 0.4039216, 1, 0, 1,
-0.5672407, 0.2882718, 0.5083508, 0.3960784, 1, 0, 1,
-0.5667059, 0.7359173, -3.286657, 0.3921569, 1, 0, 1,
-0.5661579, 1.001108, -1.319248, 0.3843137, 1, 0, 1,
-0.5595793, -0.07551879, -1.239442, 0.3803922, 1, 0, 1,
-0.5585222, -1.033409, -1.480939, 0.372549, 1, 0, 1,
-0.5564868, -0.1480443, -2.849002, 0.3686275, 1, 0, 1,
-0.5557606, 0.1502558, -0.125314, 0.3607843, 1, 0, 1,
-0.5555586, -2.49702, -4.169634, 0.3568628, 1, 0, 1,
-0.5543928, -0.3723043, -0.5677999, 0.3490196, 1, 0, 1,
-0.5495684, 0.2261563, -1.364085, 0.345098, 1, 0, 1,
-0.5488259, -0.7577756, -2.999789, 0.3372549, 1, 0, 1,
-0.5429941, 0.233262, 1.567127, 0.3333333, 1, 0, 1,
-0.5427523, 3.593008, -2.148223, 0.3254902, 1, 0, 1,
-0.5416206, 0.5577326, 0.6507489, 0.3215686, 1, 0, 1,
-0.5378761, -0.4167512, -3.090821, 0.3137255, 1, 0, 1,
-0.5358012, 1.862316, -0.6865163, 0.3098039, 1, 0, 1,
-0.5347285, 1.081461, -1.262465, 0.3019608, 1, 0, 1,
-0.5307856, 1.178916, -0.5665694, 0.2941177, 1, 0, 1,
-0.521042, -0.7564773, -1.806802, 0.2901961, 1, 0, 1,
-0.5167193, -1.728785, -2.248526, 0.282353, 1, 0, 1,
-0.503673, 0.9678061, 0.3002283, 0.2784314, 1, 0, 1,
-0.5036326, 0.9916093, -1.545892, 0.2705882, 1, 0, 1,
-0.503322, -0.6635972, -3.971089, 0.2666667, 1, 0, 1,
-0.5027551, 0.5897647, -0.7682214, 0.2588235, 1, 0, 1,
-0.4958387, 2.175406, 1.144474, 0.254902, 1, 0, 1,
-0.4942508, 1.422624, 1.510538, 0.2470588, 1, 0, 1,
-0.483906, 0.3666996, -0.3610098, 0.2431373, 1, 0, 1,
-0.481679, 1.025349, -0.04031822, 0.2352941, 1, 0, 1,
-0.4778701, 0.6764752, 1.806858, 0.2313726, 1, 0, 1,
-0.4742744, 0.07164195, -1.559662, 0.2235294, 1, 0, 1,
-0.4724225, 0.1514717, -0.3825324, 0.2196078, 1, 0, 1,
-0.4690506, 1.92755, -0.4987493, 0.2117647, 1, 0, 1,
-0.4673122, -0.3238448, -1.540536, 0.2078431, 1, 0, 1,
-0.4595134, -0.8914126, -1.446406, 0.2, 1, 0, 1,
-0.4490854, 1.349851, -0.4662293, 0.1921569, 1, 0, 1,
-0.447546, -0.1437259, -1.760339, 0.1882353, 1, 0, 1,
-0.4457524, -0.5808838, -0.8378356, 0.1803922, 1, 0, 1,
-0.4415331, -0.7577357, -2.080856, 0.1764706, 1, 0, 1,
-0.4394687, -0.7521315, -3.708834, 0.1686275, 1, 0, 1,
-0.4376252, -1.735478, -1.603047, 0.1647059, 1, 0, 1,
-0.43478, -0.7163281, -2.42744, 0.1568628, 1, 0, 1,
-0.4266945, 1.348984, -1.39513, 0.1529412, 1, 0, 1,
-0.4250681, -0.1992793, -1.715512, 0.145098, 1, 0, 1,
-0.4239213, 0.7459643, -0.7765132, 0.1411765, 1, 0, 1,
-0.4237577, -1.323722, -2.349818, 0.1333333, 1, 0, 1,
-0.4185575, -0.868403, -2.989812, 0.1294118, 1, 0, 1,
-0.4182073, 1.410212, -0.2551534, 0.1215686, 1, 0, 1,
-0.4125243, -2.130197, -2.91394, 0.1176471, 1, 0, 1,
-0.4096101, 0.1811077, -0.9932984, 0.1098039, 1, 0, 1,
-0.4022304, -1.163913, -2.384634, 0.1058824, 1, 0, 1,
-0.4011419, -1.310249, -2.455671, 0.09803922, 1, 0, 1,
-0.3971714, 0.4066974, -2.513964, 0.09019608, 1, 0, 1,
-0.3944205, 1.817508, -0.6176338, 0.08627451, 1, 0, 1,
-0.3929755, 1.36482, -0.09891789, 0.07843138, 1, 0, 1,
-0.3901023, 0.8546714, -0.6532361, 0.07450981, 1, 0, 1,
-0.3884194, -0.3319781, -1.537393, 0.06666667, 1, 0, 1,
-0.3876906, 0.4018928, -0.3332357, 0.0627451, 1, 0, 1,
-0.3871046, 0.8568795, -0.3949999, 0.05490196, 1, 0, 1,
-0.386902, 0.0266682, -0.7446172, 0.05098039, 1, 0, 1,
-0.3839687, -1.63717, -4.596163, 0.04313726, 1, 0, 1,
-0.3807818, 0.3869713, 0.1670891, 0.03921569, 1, 0, 1,
-0.3800498, -0.2311679, -2.562401, 0.03137255, 1, 0, 1,
-0.3794715, 0.2732533, -1.370209, 0.02745098, 1, 0, 1,
-0.3729362, 0.8568568, -1.099644, 0.01960784, 1, 0, 1,
-0.3724572, -1.474865, -2.85946, 0.01568628, 1, 0, 1,
-0.3709556, -0.2156208, -1.173088, 0.007843138, 1, 0, 1,
-0.3681125, -0.8518015, -3.927735, 0.003921569, 1, 0, 1,
-0.3667504, 0.3170435, -1.523469, 0, 1, 0.003921569, 1,
-0.3663531, 0.01800816, 0.562432, 0, 1, 0.01176471, 1,
-0.3653335, -0.8569978, -2.856688, 0, 1, 0.01568628, 1,
-0.362584, -1.350627, -2.294148, 0, 1, 0.02352941, 1,
-0.3619092, 0.7823696, 0.132158, 0, 1, 0.02745098, 1,
-0.3610331, 0.512329, -0.8468607, 0, 1, 0.03529412, 1,
-0.3576404, -0.06450088, -3.245276, 0, 1, 0.03921569, 1,
-0.3575744, -0.171943, -3.175145, 0, 1, 0.04705882, 1,
-0.3559145, 0.0006210923, -3.549328, 0, 1, 0.05098039, 1,
-0.3480604, 0.2503038, -2.573112, 0, 1, 0.05882353, 1,
-0.3463141, -1.506207, -3.283635, 0, 1, 0.0627451, 1,
-0.341198, -1.733926, -1.346203, 0, 1, 0.07058824, 1,
-0.3393419, -0.8200815, -2.205283, 0, 1, 0.07450981, 1,
-0.3390784, 0.094221, 0.003196453, 0, 1, 0.08235294, 1,
-0.3384524, -0.1319371, -1.632328, 0, 1, 0.08627451, 1,
-0.3320284, 0.7248429, -0.9857792, 0, 1, 0.09411765, 1,
-0.3305007, -1.198188, -3.08643, 0, 1, 0.1019608, 1,
-0.323229, -0.7073858, -4.771672, 0, 1, 0.1058824, 1,
-0.3207647, -0.2205442, -1.544667, 0, 1, 0.1137255, 1,
-0.3203191, -0.5078962, -3.188817, 0, 1, 0.1176471, 1,
-0.3196289, -0.6395496, -2.280414, 0, 1, 0.1254902, 1,
-0.3182567, -0.9075174, -3.483273, 0, 1, 0.1294118, 1,
-0.3093133, -0.4586849, -3.36496, 0, 1, 0.1372549, 1,
-0.3092987, -0.2949688, -1.589181, 0, 1, 0.1411765, 1,
-0.3089783, 0.9374265, 0.4928282, 0, 1, 0.1490196, 1,
-0.3058246, -0.4455995, -2.295957, 0, 1, 0.1529412, 1,
-0.3048675, -0.1301768, -2.105636, 0, 1, 0.1607843, 1,
-0.3047292, -2.331526, -2.528628, 0, 1, 0.1647059, 1,
-0.3047248, -1.063007, -2.875738, 0, 1, 0.172549, 1,
-0.303539, 1.09966, -0.02400465, 0, 1, 0.1764706, 1,
-0.3009648, 0.4078566, -0.858857, 0, 1, 0.1843137, 1,
-0.3009115, 0.4875096, -0.5198289, 0, 1, 0.1882353, 1,
-0.2963906, 0.2115437, -0.7717773, 0, 1, 0.1960784, 1,
-0.2899583, -2.178264, -3.505084, 0, 1, 0.2039216, 1,
-0.2872115, -0.2818503, -1.0704, 0, 1, 0.2078431, 1,
-0.2868263, -1.616159, -3.926823, 0, 1, 0.2156863, 1,
-0.2842929, -0.110034, -0.2911555, 0, 1, 0.2196078, 1,
-0.283152, -0.3174552, -3.04345, 0, 1, 0.227451, 1,
-0.2775111, -0.07260413, -3.352522, 0, 1, 0.2313726, 1,
-0.2770995, 1.009917, -1.399418, 0, 1, 0.2392157, 1,
-0.2752468, 1.518113, -0.2124837, 0, 1, 0.2431373, 1,
-0.268621, 0.9513751, 0.9421697, 0, 1, 0.2509804, 1,
-0.2668363, 0.9873832, -0.2961645, 0, 1, 0.254902, 1,
-0.265301, -0.5397691, -3.289415, 0, 1, 0.2627451, 1,
-0.2614181, 1.662544, 1.409609, 0, 1, 0.2666667, 1,
-0.2583043, 2.243812, 0.2337402, 0, 1, 0.2745098, 1,
-0.2526492, -0.5358654, -1.082894, 0, 1, 0.2784314, 1,
-0.2515391, -1.342385, -2.11693, 0, 1, 0.2862745, 1,
-0.2506844, -0.491354, -2.954936, 0, 1, 0.2901961, 1,
-0.2478023, -0.9270412, -2.564177, 0, 1, 0.2980392, 1,
-0.239389, -0.0994837, -1.165821, 0, 1, 0.3058824, 1,
-0.2371224, -0.8025969, -1.912014, 0, 1, 0.3098039, 1,
-0.2364919, -0.1217961, -2.952528, 0, 1, 0.3176471, 1,
-0.2360044, -0.7100642, -3.27719, 0, 1, 0.3215686, 1,
-0.2343878, -0.9407346, -3.013369, 0, 1, 0.3294118, 1,
-0.2318198, 0.3898924, 0.7806253, 0, 1, 0.3333333, 1,
-0.2308549, 0.9417474, 1.103989, 0, 1, 0.3411765, 1,
-0.2273309, -1.848696, -1.291072, 0, 1, 0.345098, 1,
-0.2261879, 1.48734, -0.4180231, 0, 1, 0.3529412, 1,
-0.2252592, 0.5756979, -1.318174, 0, 1, 0.3568628, 1,
-0.2216764, -0.05615325, -1.685758, 0, 1, 0.3647059, 1,
-0.2180217, -0.1149304, -3.845131, 0, 1, 0.3686275, 1,
-0.2160691, -1.207453, -2.079453, 0, 1, 0.3764706, 1,
-0.2126688, 1.388209, 0.3054305, 0, 1, 0.3803922, 1,
-0.2089208, -0.4577113, -2.464997, 0, 1, 0.3882353, 1,
-0.2060115, 0.1398262, -1.003899, 0, 1, 0.3921569, 1,
-0.2037279, 0.1898468, -1.634346, 0, 1, 0.4, 1,
-0.2017682, 0.6266915, -1.07109, 0, 1, 0.4078431, 1,
-0.2013287, 0.6085799, -0.2775009, 0, 1, 0.4117647, 1,
-0.2012263, 0.7455854, 0.4864537, 0, 1, 0.4196078, 1,
-0.195853, -0.2060811, -2.083455, 0, 1, 0.4235294, 1,
-0.1908126, -0.985729, -2.225503, 0, 1, 0.4313726, 1,
-0.1877624, -0.2979247, -4.243306, 0, 1, 0.4352941, 1,
-0.1865993, -0.3986844, -2.166742, 0, 1, 0.4431373, 1,
-0.185758, -0.7538607, -1.674139, 0, 1, 0.4470588, 1,
-0.1851562, -1.416364, -3.570654, 0, 1, 0.454902, 1,
-0.1832229, 0.02917217, -0.4849351, 0, 1, 0.4588235, 1,
-0.178258, 0.4851052, -1.754704, 0, 1, 0.4666667, 1,
-0.1728761, -0.06989167, -1.441791, 0, 1, 0.4705882, 1,
-0.1718337, 0.01611408, -1.985976, 0, 1, 0.4784314, 1,
-0.1708208, 0.0728598, -0.9441705, 0, 1, 0.4823529, 1,
-0.1699313, 0.2419089, -0.551563, 0, 1, 0.4901961, 1,
-0.1698616, 2.242503, -0.8568019, 0, 1, 0.4941176, 1,
-0.1664524, 1.390486, 0.3326342, 0, 1, 0.5019608, 1,
-0.1638902, 0.6651664, 0.05277122, 0, 1, 0.509804, 1,
-0.1604407, 2.262159, -1.73934, 0, 1, 0.5137255, 1,
-0.1530658, 0.9352335, -0.6194344, 0, 1, 0.5215687, 1,
-0.1529178, 0.3144704, -1.214466, 0, 1, 0.5254902, 1,
-0.1521777, 1.270837, 0.333197, 0, 1, 0.5333334, 1,
-0.1450052, -0.2453747, -3.772911, 0, 1, 0.5372549, 1,
-0.1438531, 1.026927, 0.5254995, 0, 1, 0.5450981, 1,
-0.1432704, 0.6475288, 0.6232826, 0, 1, 0.5490196, 1,
-0.1422491, 0.3877482, 0.4846427, 0, 1, 0.5568628, 1,
-0.1421174, 0.06177341, -1.143297, 0, 1, 0.5607843, 1,
-0.141185, 0.5716163, -0.8879591, 0, 1, 0.5686275, 1,
-0.1381369, -0.9563589, -2.245822, 0, 1, 0.572549, 1,
-0.1378019, -1.335111, -1.544785, 0, 1, 0.5803922, 1,
-0.1331182, -1.645495, -3.814474, 0, 1, 0.5843138, 1,
-0.1326801, 0.4171578, -1.890569, 0, 1, 0.5921569, 1,
-0.1314166, 0.3297176, 0.4140611, 0, 1, 0.5960785, 1,
-0.1295964, 0.1508041, 1.521984, 0, 1, 0.6039216, 1,
-0.1222692, 0.0898767, -0.9659004, 0, 1, 0.6117647, 1,
-0.1197097, -0.1668319, -2.59412, 0, 1, 0.6156863, 1,
-0.1191529, -0.8432679, -2.638265, 0, 1, 0.6235294, 1,
-0.1179924, -0.1291333, -3.625782, 0, 1, 0.627451, 1,
-0.1178778, -0.5091401, -2.485979, 0, 1, 0.6352941, 1,
-0.1112337, -0.04112434, -2.650398, 0, 1, 0.6392157, 1,
-0.1102224, -0.08433112, -2.205972, 0, 1, 0.6470588, 1,
-0.1002946, -0.1570692, -4.109095, 0, 1, 0.6509804, 1,
-0.09773153, 1.650211, -1.094496, 0, 1, 0.6588235, 1,
-0.09379088, 1.253144, -1.27903, 0, 1, 0.6627451, 1,
-0.08471525, -2.820518, -2.82847, 0, 1, 0.6705883, 1,
-0.08280712, -1.970004, -3.895308, 0, 1, 0.6745098, 1,
-0.08233019, -1.69559, -2.165348, 0, 1, 0.682353, 1,
-0.07907763, 1.720616, 0.6924562, 0, 1, 0.6862745, 1,
-0.07517098, -0.3885416, -2.497754, 0, 1, 0.6941177, 1,
-0.07269797, 0.3799842, -0.7556643, 0, 1, 0.7019608, 1,
-0.07182012, 0.5357832, -1.297867, 0, 1, 0.7058824, 1,
-0.07057743, -0.4574947, -4.8028, 0, 1, 0.7137255, 1,
-0.07022601, -0.07426335, -1.882378, 0, 1, 0.7176471, 1,
-0.06993548, -0.21555, -3.740422, 0, 1, 0.7254902, 1,
-0.06885198, 0.5856271, -1.346696, 0, 1, 0.7294118, 1,
-0.06693019, 1.445634, 0.4765618, 0, 1, 0.7372549, 1,
-0.06624968, 0.2021772, -0.7237548, 0, 1, 0.7411765, 1,
-0.05639523, 1.57082, -0.5631618, 0, 1, 0.7490196, 1,
-0.05502816, -1.827979, -3.245246, 0, 1, 0.7529412, 1,
-0.05493639, -0.2633368, -0.9132637, 0, 1, 0.7607843, 1,
-0.05417937, -0.5874248, -4.199668, 0, 1, 0.7647059, 1,
-0.05062911, 2.534626, -0.8532255, 0, 1, 0.772549, 1,
-0.0498575, -1.082649, -1.846875, 0, 1, 0.7764706, 1,
-0.04867146, -0.3453495, -2.52527, 0, 1, 0.7843137, 1,
-0.04814498, -0.3048306, -5.637031, 0, 1, 0.7882353, 1,
-0.04707709, -0.7669895, -1.685583, 0, 1, 0.7960784, 1,
-0.04649344, -0.4084798, -3.099984, 0, 1, 0.8039216, 1,
-0.04327307, -0.008980012, -2.434973, 0, 1, 0.8078431, 1,
-0.04299589, 2.036822, -0.2167435, 0, 1, 0.8156863, 1,
-0.04032809, 1.614201, -0.4737038, 0, 1, 0.8196079, 1,
-0.03997253, -0.0917058, -3.474699, 0, 1, 0.827451, 1,
-0.03918907, -0.08182091, -3.294842, 0, 1, 0.8313726, 1,
-0.03896007, 1.64043, -0.2037603, 0, 1, 0.8392157, 1,
-0.03883692, -0.613242, -5.318779, 0, 1, 0.8431373, 1,
-0.03770133, 0.06586908, 0.08216815, 0, 1, 0.8509804, 1,
-0.03686463, -0.9465784, -3.073085, 0, 1, 0.854902, 1,
-0.03664483, -1.521069, -5.145052, 0, 1, 0.8627451, 1,
-0.0345671, 1.687468, -0.223134, 0, 1, 0.8666667, 1,
-0.02246711, -0.1694087, -2.032792, 0, 1, 0.8745098, 1,
-0.02075932, -0.8293346, -2.906867, 0, 1, 0.8784314, 1,
-0.02008375, 0.2470218, 0.09019307, 0, 1, 0.8862745, 1,
-0.01917924, -0.271125, -1.518322, 0, 1, 0.8901961, 1,
-0.01045371, -2.705975, -4.234521, 0, 1, 0.8980392, 1,
-0.008907652, 1.244752, 1.266364, 0, 1, 0.9058824, 1,
-0.008653871, -2.521068, -3.515888, 0, 1, 0.9098039, 1,
-0.007688788, -1.020386, -3.413207, 0, 1, 0.9176471, 1,
-0.004156895, -0.3175524, -2.245255, 0, 1, 0.9215686, 1,
-0.004153477, -0.569787, -4.060427, 0, 1, 0.9294118, 1,
-0.00193123, 0.7048493, -0.003526517, 0, 1, 0.9333333, 1,
-0.001181148, -0.2385519, -3.818218, 0, 1, 0.9411765, 1,
-0.0007664803, -0.4942228, -3.723678, 0, 1, 0.945098, 1,
0.002422858, -0.5259812, 3.676566, 0, 1, 0.9529412, 1,
0.003778129, -0.8796081, 2.46719, 0, 1, 0.9568627, 1,
0.005830656, -1.995978, 2.121512, 0, 1, 0.9647059, 1,
0.009001501, -0.2837872, 4.350505, 0, 1, 0.9686275, 1,
0.01213178, -1.262665, 2.440189, 0, 1, 0.9764706, 1,
0.01419822, 1.311674, 0.9961516, 0, 1, 0.9803922, 1,
0.0150505, -0.3043516, 1.298574, 0, 1, 0.9882353, 1,
0.02403731, -0.3544568, 4.943774, 0, 1, 0.9921569, 1,
0.02566347, 0.04956179, 0.8013804, 0, 1, 1, 1,
0.02587, -0.5296822, 2.204841, 0, 0.9921569, 1, 1,
0.02943646, -0.6994358, 2.498402, 0, 0.9882353, 1, 1,
0.02960286, -0.2827958, 4.136099, 0, 0.9803922, 1, 1,
0.03005675, -0.6541347, 4.909105, 0, 0.9764706, 1, 1,
0.04135156, 1.044261, -0.4655495, 0, 0.9686275, 1, 1,
0.0429336, -0.352965, 2.680161, 0, 0.9647059, 1, 1,
0.04359219, 1.672849, -0.02278593, 0, 0.9568627, 1, 1,
0.0459498, -1.873007, 1.496958, 0, 0.9529412, 1, 1,
0.0465047, -0.3820194, 2.674817, 0, 0.945098, 1, 1,
0.04690371, 2.629096, 0.5295127, 0, 0.9411765, 1, 1,
0.04826071, -0.6765363, 2.102048, 0, 0.9333333, 1, 1,
0.05487114, 2.567361, -0.6074183, 0, 0.9294118, 1, 1,
0.05673398, 0.8622283, 0.4719236, 0, 0.9215686, 1, 1,
0.05763569, -0.1431469, 3.320706, 0, 0.9176471, 1, 1,
0.0605835, 0.2616239, 0.9169073, 0, 0.9098039, 1, 1,
0.06314071, 1.104841, 0.6510531, 0, 0.9058824, 1, 1,
0.07306902, 1.364556, -0.5522192, 0, 0.8980392, 1, 1,
0.07957131, -0.690443, 2.17894, 0, 0.8901961, 1, 1,
0.08296058, -0.3452557, 3.055208, 0, 0.8862745, 1, 1,
0.08651333, -1.249435, 1.657187, 0, 0.8784314, 1, 1,
0.08680757, 0.1284768, -0.0657253, 0, 0.8745098, 1, 1,
0.09759368, 0.02755339, 1.610583, 0, 0.8666667, 1, 1,
0.09807538, 0.6575904, 0.07561125, 0, 0.8627451, 1, 1,
0.1003338, 0.7087449, 0.9156996, 0, 0.854902, 1, 1,
0.1015049, -0.5215146, 3.80445, 0, 0.8509804, 1, 1,
0.1031138, -1.521081, 4.813018, 0, 0.8431373, 1, 1,
0.1093128, -1.33352, 3.697539, 0, 0.8392157, 1, 1,
0.1109891, 1.410097, 0.6745909, 0, 0.8313726, 1, 1,
0.113, -0.2051399, 3.083967, 0, 0.827451, 1, 1,
0.1132022, 0.5769205, 0.318351, 0, 0.8196079, 1, 1,
0.1169703, 0.3034533, 1.021441, 0, 0.8156863, 1, 1,
0.1190821, -0.2471577, 2.508296, 0, 0.8078431, 1, 1,
0.1207682, 1.131946, -1.539718, 0, 0.8039216, 1, 1,
0.1215184, -1.989484, 2.56933, 0, 0.7960784, 1, 1,
0.1247473, 0.6808413, 0.08853723, 0, 0.7882353, 1, 1,
0.12694, -0.1693198, 1.779587, 0, 0.7843137, 1, 1,
0.1290245, 0.1577729, 0.08438485, 0, 0.7764706, 1, 1,
0.1311483, 0.2521825, -0.0398874, 0, 0.772549, 1, 1,
0.1314486, 1.214792, -0.142832, 0, 0.7647059, 1, 1,
0.1329921, -0.2915066, 3.374294, 0, 0.7607843, 1, 1,
0.1373544, -0.9788289, 4.270676, 0, 0.7529412, 1, 1,
0.140246, -0.5120631, 3.870659, 0, 0.7490196, 1, 1,
0.1412301, 0.9791291, 0.7167547, 0, 0.7411765, 1, 1,
0.1435613, 0.2002289, -0.05950252, 0, 0.7372549, 1, 1,
0.1454628, 1.074471, -0.3330615, 0, 0.7294118, 1, 1,
0.1455213, 0.2331053, 1.189855, 0, 0.7254902, 1, 1,
0.1463687, -0.2853365, 2.560496, 0, 0.7176471, 1, 1,
0.1491187, 1.018943, 0.360797, 0, 0.7137255, 1, 1,
0.1514476, -1.317896, 3.08297, 0, 0.7058824, 1, 1,
0.1536998, 0.6461227, 0.4521422, 0, 0.6980392, 1, 1,
0.1590189, -1.019913, 3.499483, 0, 0.6941177, 1, 1,
0.1596731, -0.6644134, 4.695505, 0, 0.6862745, 1, 1,
0.1630139, 0.585613, -0.8657108, 0, 0.682353, 1, 1,
0.1661493, -1.047445, 3.22929, 0, 0.6745098, 1, 1,
0.1668787, -0.7880201, 1.411539, 0, 0.6705883, 1, 1,
0.1737945, -0.5509724, 4.425328, 0, 0.6627451, 1, 1,
0.1740528, 1.501258, -0.2954845, 0, 0.6588235, 1, 1,
0.1753373, 2.006749, -2.278704, 0, 0.6509804, 1, 1,
0.1772302, -0.706335, 2.695694, 0, 0.6470588, 1, 1,
0.1794812, -1.624356, 4.004439, 0, 0.6392157, 1, 1,
0.1821841, 0.2112386, 0.03730348, 0, 0.6352941, 1, 1,
0.1874093, 1.037202, 2.321359, 0, 0.627451, 1, 1,
0.1898285, 0.3264832, 0.2768978, 0, 0.6235294, 1, 1,
0.1983164, 1.791302, -0.5130704, 0, 0.6156863, 1, 1,
0.2034378, -0.2019553, 3.273574, 0, 0.6117647, 1, 1,
0.2056151, -0.1827881, 2.714448, 0, 0.6039216, 1, 1,
0.2110744, -0.9336894, 2.442195, 0, 0.5960785, 1, 1,
0.2127837, -1.024497, 4.194679, 0, 0.5921569, 1, 1,
0.2149726, -0.05453574, 3.239187, 0, 0.5843138, 1, 1,
0.2212963, -0.957491, 3.035806, 0, 0.5803922, 1, 1,
0.2229893, 1.492318, -0.1879296, 0, 0.572549, 1, 1,
0.2239005, -0.857391, 3.156033, 0, 0.5686275, 1, 1,
0.2282923, 0.8370343, 1.741777, 0, 0.5607843, 1, 1,
0.2300609, 0.6369138, 0.01731722, 0, 0.5568628, 1, 1,
0.2324134, -0.1031064, 2.286925, 0, 0.5490196, 1, 1,
0.236073, 0.8523892, -0.9579641, 0, 0.5450981, 1, 1,
0.2414507, 1.984685, 1.829516, 0, 0.5372549, 1, 1,
0.2429235, -0.01926689, 3.580237, 0, 0.5333334, 1, 1,
0.243003, 0.4292031, 0.002668751, 0, 0.5254902, 1, 1,
0.2431448, -1.957263, 3.149279, 0, 0.5215687, 1, 1,
0.2445476, -1.897408, 3.040426, 0, 0.5137255, 1, 1,
0.2455497, -0.5726891, 0.9916283, 0, 0.509804, 1, 1,
0.2461467, 0.7642221, 0.3831427, 0, 0.5019608, 1, 1,
0.2502201, -0.6223974, 2.089849, 0, 0.4941176, 1, 1,
0.2505276, -0.8367487, 2.426381, 0, 0.4901961, 1, 1,
0.2510406, 0.079696, 2.365464, 0, 0.4823529, 1, 1,
0.2555768, -0.6230638, 4.728074, 0, 0.4784314, 1, 1,
0.2560353, 0.3825713, 0.8546932, 0, 0.4705882, 1, 1,
0.2569908, -0.1598286, 3.592044, 0, 0.4666667, 1, 1,
0.257423, -0.3926482, 4.1027, 0, 0.4588235, 1, 1,
0.2581421, 0.529256, -0.8472422, 0, 0.454902, 1, 1,
0.2586845, 1.592633, -0.5514383, 0, 0.4470588, 1, 1,
0.2587339, 1.408301, -0.209429, 0, 0.4431373, 1, 1,
0.2588108, 0.4696281, 0.1131712, 0, 0.4352941, 1, 1,
0.2620916, 1.441682, 0.166402, 0, 0.4313726, 1, 1,
0.2621388, 0.4366491, 0.5860204, 0, 0.4235294, 1, 1,
0.2636738, -2.701544, 1.559067, 0, 0.4196078, 1, 1,
0.2637456, -0.7384586, 3.962, 0, 0.4117647, 1, 1,
0.2649044, -0.7302846, 3.163191, 0, 0.4078431, 1, 1,
0.2656752, -0.5841858, 0.3532292, 0, 0.4, 1, 1,
0.2725896, -0.1141878, 1.218334, 0, 0.3921569, 1, 1,
0.2727542, 0.03359928, 1.290888, 0, 0.3882353, 1, 1,
0.2731563, 0.2895574, 1.278455, 0, 0.3803922, 1, 1,
0.2756115, -1.016517, 3.062958, 0, 0.3764706, 1, 1,
0.2773074, 0.1537983, 1.603264, 0, 0.3686275, 1, 1,
0.2801394, -0.1310354, 2.450073, 0, 0.3647059, 1, 1,
0.286266, 1.359587, 1.723403, 0, 0.3568628, 1, 1,
0.2869688, -0.2990983, 0.3330577, 0, 0.3529412, 1, 1,
0.2875007, -0.7993069, 0.9703799, 0, 0.345098, 1, 1,
0.290234, -0.4076697, 2.150494, 0, 0.3411765, 1, 1,
0.2928828, 0.9229865, -1.534641, 0, 0.3333333, 1, 1,
0.2959096, -2.033606, 2.909108, 0, 0.3294118, 1, 1,
0.2961421, 2.1144, 0.9255688, 0, 0.3215686, 1, 1,
0.29703, -2.388002, 3.151822, 0, 0.3176471, 1, 1,
0.2974224, 1.318331, 1.02497, 0, 0.3098039, 1, 1,
0.2981119, -0.8209961, 2.776502, 0, 0.3058824, 1, 1,
0.299218, 0.2279484, 1.961822, 0, 0.2980392, 1, 1,
0.3025241, 0.1470435, 1.990784, 0, 0.2901961, 1, 1,
0.3035359, 1.460926, -0.6131682, 0, 0.2862745, 1, 1,
0.3078977, -1.641461, 2.761226, 0, 0.2784314, 1, 1,
0.3081369, -0.8183755, 3.160743, 0, 0.2745098, 1, 1,
0.308344, 0.1002919, 1.378516, 0, 0.2666667, 1, 1,
0.3087317, 1.40806, -1.024915, 0, 0.2627451, 1, 1,
0.3102212, 1.081894, -0.7547828, 0, 0.254902, 1, 1,
0.3109688, -0.04042482, 1.34453, 0, 0.2509804, 1, 1,
0.3137012, -0.5853244, 0.9656186, 0, 0.2431373, 1, 1,
0.3204925, 1.064533, -0.9722263, 0, 0.2392157, 1, 1,
0.3268544, 1.794116, -0.2593567, 0, 0.2313726, 1, 1,
0.3269854, 0.2332935, 1.702186, 0, 0.227451, 1, 1,
0.3281485, -0.9985529, 2.682789, 0, 0.2196078, 1, 1,
0.3329148, 0.1739965, 2.085695, 0, 0.2156863, 1, 1,
0.3342251, 1.102889, 0.8266369, 0, 0.2078431, 1, 1,
0.3345928, -0.04473827, 2.098664, 0, 0.2039216, 1, 1,
0.3353497, 0.2996187, 0.6358442, 0, 0.1960784, 1, 1,
0.3376901, -1.214248, 2.615915, 0, 0.1882353, 1, 1,
0.3397795, -0.7646812, 3.753978, 0, 0.1843137, 1, 1,
0.3415758, -0.732401, 0.2239123, 0, 0.1764706, 1, 1,
0.343899, -0.7443371, 2.441544, 0, 0.172549, 1, 1,
0.3491683, -0.1135633, 1.439122, 0, 0.1647059, 1, 1,
0.3513534, -0.06046468, 4.076437, 0, 0.1607843, 1, 1,
0.3538577, -0.01158732, 0.5710068, 0, 0.1529412, 1, 1,
0.3577729, -0.1800423, 2.263493, 0, 0.1490196, 1, 1,
0.358637, -0.5774279, 1.112096, 0, 0.1411765, 1, 1,
0.3590192, 0.623881, 1.091575, 0, 0.1372549, 1, 1,
0.3640289, -2.552341, 2.876702, 0, 0.1294118, 1, 1,
0.3652444, 0.09039699, 1.050992, 0, 0.1254902, 1, 1,
0.3655629, -1.621971, 1.870578, 0, 0.1176471, 1, 1,
0.3666021, -1.84481, 2.623286, 0, 0.1137255, 1, 1,
0.3675419, -0.5111261, 2.577986, 0, 0.1058824, 1, 1,
0.3680659, -0.142651, 2.537596, 0, 0.09803922, 1, 1,
0.3696032, -0.4676796, 4.459793, 0, 0.09411765, 1, 1,
0.3707741, -0.6836586, 2.427761, 0, 0.08627451, 1, 1,
0.3730206, 0.9208184, 0.2126739, 0, 0.08235294, 1, 1,
0.3739263, 1.451345, 0.2296669, 0, 0.07450981, 1, 1,
0.3765614, -0.662586, 4.176147, 0, 0.07058824, 1, 1,
0.3794879, 0.03896273, 2.237349, 0, 0.0627451, 1, 1,
0.3797358, -0.292796, -0.7725601, 0, 0.05882353, 1, 1,
0.3816386, -0.2639651, 2.891188, 0, 0.05098039, 1, 1,
0.3824376, -0.2037525, 3.267001, 0, 0.04705882, 1, 1,
0.3834155, 0.7318614, -0.7674614, 0, 0.03921569, 1, 1,
0.3869782, -1.157296, 2.441769, 0, 0.03529412, 1, 1,
0.3876044, -0.7226574, 3.707306, 0, 0.02745098, 1, 1,
0.3882764, 0.4627939, 0.1868733, 0, 0.02352941, 1, 1,
0.3893999, 0.1247021, 1.294092, 0, 0.01568628, 1, 1,
0.4021709, -0.1881893, 1.559534, 0, 0.01176471, 1, 1,
0.4029452, 1.789075, 2.065415, 0, 0.003921569, 1, 1,
0.4031917, 2.319915, 0.9938092, 0.003921569, 0, 1, 1,
0.4074985, -0.0651504, -0.0006135038, 0.007843138, 0, 1, 1,
0.4079262, 0.1079231, 1.243772, 0.01568628, 0, 1, 1,
0.4083791, 0.03754277, 1.032753, 0.01960784, 0, 1, 1,
0.4138475, 1.45531, 1.185265, 0.02745098, 0, 1, 1,
0.4155193, 0.2141842, 0.9880286, 0.03137255, 0, 1, 1,
0.416741, 0.3261487, 2.150465, 0.03921569, 0, 1, 1,
0.4262399, 1.374013, 0.5464702, 0.04313726, 0, 1, 1,
0.4292861, -1.353883, 2.117943, 0.05098039, 0, 1, 1,
0.4323135, -0.0552774, 0.6337278, 0.05490196, 0, 1, 1,
0.4339048, -1.259173, 3.643641, 0.0627451, 0, 1, 1,
0.4368215, -1.532647, 4.499496, 0.06666667, 0, 1, 1,
0.4387473, 0.3516003, 1.270532, 0.07450981, 0, 1, 1,
0.4400606, -0.897104, 3.342349, 0.07843138, 0, 1, 1,
0.4453039, -1.022014, 3.065899, 0.08627451, 0, 1, 1,
0.4479477, -2.111914, 4.460652, 0.09019608, 0, 1, 1,
0.4489802, 0.1095825, 1.806384, 0.09803922, 0, 1, 1,
0.4512109, -0.1025112, 2.320856, 0.1058824, 0, 1, 1,
0.4522556, -1.534272, 2.23355, 0.1098039, 0, 1, 1,
0.4523688, -0.6594663, 1.924951, 0.1176471, 0, 1, 1,
0.4528827, 1.475952, -1.113466, 0.1215686, 0, 1, 1,
0.4541172, -0.1955819, 2.241074, 0.1294118, 0, 1, 1,
0.4542675, -0.5742883, 0.3301945, 0.1333333, 0, 1, 1,
0.459159, 0.3086258, 1.892881, 0.1411765, 0, 1, 1,
0.4599722, 0.6153842, -0.603857, 0.145098, 0, 1, 1,
0.4656302, -1.982101, 3.049343, 0.1529412, 0, 1, 1,
0.4701253, 0.4963974, -0.3225598, 0.1568628, 0, 1, 1,
0.4724823, 1.403759, 1.256949, 0.1647059, 0, 1, 1,
0.4731337, -0.7877081, 2.309547, 0.1686275, 0, 1, 1,
0.4735278, -1.775276, 4.037323, 0.1764706, 0, 1, 1,
0.4761374, -1.466894, 2.851497, 0.1803922, 0, 1, 1,
0.4767724, -0.6448612, 3.070293, 0.1882353, 0, 1, 1,
0.4793107, -0.6977019, 1.453357, 0.1921569, 0, 1, 1,
0.4809745, 0.02930327, 1.359774, 0.2, 0, 1, 1,
0.4822955, -1.871318, 3.408584, 0.2078431, 0, 1, 1,
0.4833037, -0.004340386, 0.550621, 0.2117647, 0, 1, 1,
0.4869563, 0.9851387, 1.311841, 0.2196078, 0, 1, 1,
0.4872184, -0.3862599, 3.906229, 0.2235294, 0, 1, 1,
0.4874923, -0.9215721, 1.826119, 0.2313726, 0, 1, 1,
0.4899975, 0.2320652, 0.3685353, 0.2352941, 0, 1, 1,
0.4905953, -0.6644006, 3.296045, 0.2431373, 0, 1, 1,
0.4928776, 1.309555, -0.9347026, 0.2470588, 0, 1, 1,
0.4945767, -1.289818, 1.494674, 0.254902, 0, 1, 1,
0.4946404, 0.2478307, 1.422001, 0.2588235, 0, 1, 1,
0.4967116, -0.4069664, 1.516788, 0.2666667, 0, 1, 1,
0.4994754, 0.9165288, -0.7091519, 0.2705882, 0, 1, 1,
0.50382, 1.883396, 0.1124503, 0.2784314, 0, 1, 1,
0.5049341, -0.2528484, 1.581682, 0.282353, 0, 1, 1,
0.5121647, 2.012997, 0.7934221, 0.2901961, 0, 1, 1,
0.5137188, -0.4638548, 0.3503562, 0.2941177, 0, 1, 1,
0.5146941, 0.8361881, 0.5961646, 0.3019608, 0, 1, 1,
0.5239985, 0.1773342, -1.545504, 0.3098039, 0, 1, 1,
0.528981, 0.4015883, 0.6412817, 0.3137255, 0, 1, 1,
0.5293047, -0.8241343, 1.786994, 0.3215686, 0, 1, 1,
0.5318806, -1.05254, 3.659545, 0.3254902, 0, 1, 1,
0.5391916, -1.114013, 3.174034, 0.3333333, 0, 1, 1,
0.5397379, 0.4302716, 1.487181, 0.3372549, 0, 1, 1,
0.5438743, -1.50902, 4.280908, 0.345098, 0, 1, 1,
0.5442672, 0.1693416, 2.370704, 0.3490196, 0, 1, 1,
0.5455694, 1.830831, -0.1028953, 0.3568628, 0, 1, 1,
0.5465239, 1.150279, -1.856703, 0.3607843, 0, 1, 1,
0.5491814, -0.6755686, 2.223191, 0.3686275, 0, 1, 1,
0.5527993, 1.768177, -0.5917252, 0.372549, 0, 1, 1,
0.5577279, -0.9216775, 1.895444, 0.3803922, 0, 1, 1,
0.5649059, -0.9185932, 1.854144, 0.3843137, 0, 1, 1,
0.5733064, -1.599679, 2.069882, 0.3921569, 0, 1, 1,
0.574021, 0.2719212, 3.01474, 0.3960784, 0, 1, 1,
0.5758781, -0.2538695, 0.4824333, 0.4039216, 0, 1, 1,
0.5768516, 0.3126128, 1.73457, 0.4117647, 0, 1, 1,
0.5784473, -0.7328838, 2.047863, 0.4156863, 0, 1, 1,
0.5853234, -0.935565, 2.160722, 0.4235294, 0, 1, 1,
0.5866426, -0.6663883, 1.84492, 0.427451, 0, 1, 1,
0.5928966, 0.5581955, 0.5209181, 0.4352941, 0, 1, 1,
0.5953766, -0.5916132, 1.394511, 0.4392157, 0, 1, 1,
0.5956455, 1.525113, 1.004616, 0.4470588, 0, 1, 1,
0.596428, -1.167561, 2.691939, 0.4509804, 0, 1, 1,
0.5990328, -1.017803, 2.835434, 0.4588235, 0, 1, 1,
0.5995975, -0.9594826, 2.270355, 0.4627451, 0, 1, 1,
0.6000522, -0.6025174, 2.202671, 0.4705882, 0, 1, 1,
0.6010169, 0.06878898, 1.12522, 0.4745098, 0, 1, 1,
0.6053339, -1.770099, 3.052363, 0.4823529, 0, 1, 1,
0.6059561, -1.135753, 3.420538, 0.4862745, 0, 1, 1,
0.606447, 0.7789379, 0.251106, 0.4941176, 0, 1, 1,
0.6108199, 0.3626549, 0.7065837, 0.5019608, 0, 1, 1,
0.6129679, -0.9183642, 3.639287, 0.5058824, 0, 1, 1,
0.6151686, -0.7246027, 3.094574, 0.5137255, 0, 1, 1,
0.6160579, -1.529916, 2.369249, 0.5176471, 0, 1, 1,
0.616666, 1.167932, -0.247245, 0.5254902, 0, 1, 1,
0.6246629, 0.1987418, 1.94819, 0.5294118, 0, 1, 1,
0.6252021, 1.507571, 0.04927624, 0.5372549, 0, 1, 1,
0.6297426, -0.7314342, 2.966893, 0.5411765, 0, 1, 1,
0.6345857, -0.1994014, 2.760036, 0.5490196, 0, 1, 1,
0.6419851, -0.2243275, 2.026122, 0.5529412, 0, 1, 1,
0.6439875, 0.2654224, 1.959922, 0.5607843, 0, 1, 1,
0.6452279, 0.5960384, 0.9629954, 0.5647059, 0, 1, 1,
0.6461283, 0.4385394, 1.262886, 0.572549, 0, 1, 1,
0.653093, -0.7142251, 3.377642, 0.5764706, 0, 1, 1,
0.6556811, -0.6298292, 3.45711, 0.5843138, 0, 1, 1,
0.6562407, -0.8628083, 3.227272, 0.5882353, 0, 1, 1,
0.6609568, -1.043416, 0.9089165, 0.5960785, 0, 1, 1,
0.6626021, -0.5716878, 4.359057, 0.6039216, 0, 1, 1,
0.662619, 0.1180382, 2.779134, 0.6078432, 0, 1, 1,
0.6626624, -0.4979539, 1.628333, 0.6156863, 0, 1, 1,
0.6634269, -0.8857687, 0.4228311, 0.6196079, 0, 1, 1,
0.668021, 1.463649, -1.35901, 0.627451, 0, 1, 1,
0.6744641, 1.818814, 1.08269, 0.6313726, 0, 1, 1,
0.6829277, -0.6778422, 1.534981, 0.6392157, 0, 1, 1,
0.6862733, -0.05456404, 0.3949546, 0.6431373, 0, 1, 1,
0.6895252, -0.7036518, 1.811619, 0.6509804, 0, 1, 1,
0.6927326, -0.3766266, 0.7472069, 0.654902, 0, 1, 1,
0.6975024, -0.4413648, 1.905034, 0.6627451, 0, 1, 1,
0.6992067, 1.87815, 0.7604864, 0.6666667, 0, 1, 1,
0.6999491, -1.020737, 1.92751, 0.6745098, 0, 1, 1,
0.7035863, 1.552899, -1.471001, 0.6784314, 0, 1, 1,
0.7046846, 0.6068349, 1.039242, 0.6862745, 0, 1, 1,
0.7087203, -1.295839, 2.677382, 0.6901961, 0, 1, 1,
0.7133964, 0.08489916, 1.599746, 0.6980392, 0, 1, 1,
0.717707, 0.9158189, 1.634443, 0.7058824, 0, 1, 1,
0.7191882, 0.6477078, -0.9981231, 0.7098039, 0, 1, 1,
0.7241231, 1.78455, -1.128968, 0.7176471, 0, 1, 1,
0.7267691, 0.5618752, 1.519207, 0.7215686, 0, 1, 1,
0.7313929, -0.5492522, 3.064426, 0.7294118, 0, 1, 1,
0.7328801, 1.731316, 2.215961, 0.7333333, 0, 1, 1,
0.7529522, 0.533103, 1.299404, 0.7411765, 0, 1, 1,
0.7565957, -1.722267, 2.051708, 0.7450981, 0, 1, 1,
0.757099, 0.4645176, 2.300339, 0.7529412, 0, 1, 1,
0.7606732, -0.05695099, 3.153971, 0.7568628, 0, 1, 1,
0.7654385, 1.133857, 1.608994, 0.7647059, 0, 1, 1,
0.7693901, 0.4940774, 1.528651, 0.7686275, 0, 1, 1,
0.7758902, 0.2311585, 1.263472, 0.7764706, 0, 1, 1,
0.7788594, 2.80138, 0.3395844, 0.7803922, 0, 1, 1,
0.7797236, -0.1278863, 0.8603413, 0.7882353, 0, 1, 1,
0.7829222, 0.2697928, 1.656784, 0.7921569, 0, 1, 1,
0.7887391, -0.1307796, 2.917144, 0.8, 0, 1, 1,
0.792096, 1.363992, 0.7292868, 0.8078431, 0, 1, 1,
0.7931662, 0.7877869, 3.327219, 0.8117647, 0, 1, 1,
0.7936538, 0.1274794, 1.94868, 0.8196079, 0, 1, 1,
0.7938849, 0.4199463, 0.7853848, 0.8235294, 0, 1, 1,
0.7952992, -0.2442229, 2.504013, 0.8313726, 0, 1, 1,
0.7967587, 0.06842326, 1.530412, 0.8352941, 0, 1, 1,
0.7976039, -1.566672, 4.999013, 0.8431373, 0, 1, 1,
0.8020697, 0.364099, 2.019042, 0.8470588, 0, 1, 1,
0.8073142, -0.7288142, 1.768103, 0.854902, 0, 1, 1,
0.8106717, 2.284421, -0.2246176, 0.8588235, 0, 1, 1,
0.8145661, -1.035001, 0.9139057, 0.8666667, 0, 1, 1,
0.8234707, 0.3040411, -0.4028497, 0.8705882, 0, 1, 1,
0.8295473, -1.266163, 2.65822, 0.8784314, 0, 1, 1,
0.8297303, -1.306697, 2.634376, 0.8823529, 0, 1, 1,
0.8312482, -1.168439, 3.765689, 0.8901961, 0, 1, 1,
0.8333662, 1.103009, 1.467637, 0.8941177, 0, 1, 1,
0.8353218, 0.7857147, 0.5871851, 0.9019608, 0, 1, 1,
0.835722, -0.5533069, 2.696584, 0.9098039, 0, 1, 1,
0.8358721, -0.6055859, 3.41484, 0.9137255, 0, 1, 1,
0.841171, -0.05891498, 0.2348818, 0.9215686, 0, 1, 1,
0.8454808, -1.175426, 1.751863, 0.9254902, 0, 1, 1,
0.8464584, 1.299664, -0.6610963, 0.9333333, 0, 1, 1,
0.8553888, 0.1224675, 1.340298, 0.9372549, 0, 1, 1,
0.8599679, 0.3623714, 2.228616, 0.945098, 0, 1, 1,
0.8616123, 0.1362346, -0.01634718, 0.9490196, 0, 1, 1,
0.8670799, -0.6996671, 2.908273, 0.9568627, 0, 1, 1,
0.8698086, -0.068959, 0.6737381, 0.9607843, 0, 1, 1,
0.870793, -2.623746, 3.199191, 0.9686275, 0, 1, 1,
0.871863, 0.1600208, 1.576626, 0.972549, 0, 1, 1,
0.881605, 0.1888608, 2.650287, 0.9803922, 0, 1, 1,
0.8821043, 1.058177, 1.251762, 0.9843137, 0, 1, 1,
0.8850704, -0.8788188, 0.9065778, 0.9921569, 0, 1, 1,
0.8925871, 0.4101886, 0.8287203, 0.9960784, 0, 1, 1,
0.8941727, 0.0009425234, 2.791226, 1, 0, 0.9960784, 1,
0.8966151, -1.090508, 1.943959, 1, 0, 0.9882353, 1,
0.9034495, -0.6568513, 0.705047, 1, 0, 0.9843137, 1,
0.9044415, 0.1651129, 1.744749, 1, 0, 0.9764706, 1,
0.906786, 1.069772, 0.2209342, 1, 0, 0.972549, 1,
0.9085743, 0.5695682, 0.5692163, 1, 0, 0.9647059, 1,
0.9479006, 0.7653295, 0.4290297, 1, 0, 0.9607843, 1,
0.9554823, 0.3048599, 0.5210946, 1, 0, 0.9529412, 1,
0.958412, -0.7617236, 2.878989, 1, 0, 0.9490196, 1,
0.9691713, -0.2461154, 1.802998, 1, 0, 0.9411765, 1,
0.9703194, 0.2289435, -0.01676974, 1, 0, 0.9372549, 1,
0.9751129, 0.4895539, 1.268512, 1, 0, 0.9294118, 1,
0.9765869, -1.033942, 1.999848, 1, 0, 0.9254902, 1,
0.9787737, 0.2133665, 1.996231, 1, 0, 0.9176471, 1,
0.9880303, -0.8591624, 2.78277, 1, 0, 0.9137255, 1,
0.9978424, -0.1977814, 1.169925, 1, 0, 0.9058824, 1,
1.001379, 0.03172735, 1.976188, 1, 0, 0.9019608, 1,
1.003541, 1.657588, 0.5693977, 1, 0, 0.8941177, 1,
1.005385, 2.294665, 2.889692, 1, 0, 0.8862745, 1,
1.010394, -0.07343028, 1.428587, 1, 0, 0.8823529, 1,
1.014256, 0.5830299, -0.3891102, 1, 0, 0.8745098, 1,
1.01955, 0.7013007, 0.8365117, 1, 0, 0.8705882, 1,
1.03024, -0.009165233, 0.6643175, 1, 0, 0.8627451, 1,
1.031752, 0.5419617, 0.7634649, 1, 0, 0.8588235, 1,
1.032273, 2.192274, -0.6072069, 1, 0, 0.8509804, 1,
1.034677, -0.908791, 2.852235, 1, 0, 0.8470588, 1,
1.045007, -0.6347409, 1.962984, 1, 0, 0.8392157, 1,
1.045546, -1.835465, 1.658266, 1, 0, 0.8352941, 1,
1.05445, 0.7728948, 0.01699895, 1, 0, 0.827451, 1,
1.056311, -0.4234746, 0.3448566, 1, 0, 0.8235294, 1,
1.063819, -1.547903, 2.325256, 1, 0, 0.8156863, 1,
1.071244, -0.9062123, 1.379591, 1, 0, 0.8117647, 1,
1.084577, 0.3441169, 1.714378, 1, 0, 0.8039216, 1,
1.104346, 1.683586, 2.529513, 1, 0, 0.7960784, 1,
1.107018, 1.678296, 0.6436823, 1, 0, 0.7921569, 1,
1.107945, 0.1142107, 0.790626, 1, 0, 0.7843137, 1,
1.108541, -1.242302, 2.93113, 1, 0, 0.7803922, 1,
1.113986, 1.679504, 1.317141, 1, 0, 0.772549, 1,
1.127495, -1.096747, 2.909917, 1, 0, 0.7686275, 1,
1.130875, 0.7984281, 0.9251288, 1, 0, 0.7607843, 1,
1.133541, 0.8975942, 2.036971, 1, 0, 0.7568628, 1,
1.140681, -1.470274, 3.841282, 1, 0, 0.7490196, 1,
1.141666, -1.885527, 1.603116, 1, 0, 0.7450981, 1,
1.151474, 0.06070511, 1.442604, 1, 0, 0.7372549, 1,
1.155176, -1.431381, 2.302786, 1, 0, 0.7333333, 1,
1.159374, -1.045738, 2.562168, 1, 0, 0.7254902, 1,
1.182068, 0.8632275, 1.487275, 1, 0, 0.7215686, 1,
1.190851, 0.01132497, 1.296927, 1, 0, 0.7137255, 1,
1.191665, -0.9719265, 0.4079862, 1, 0, 0.7098039, 1,
1.195609, -0.6235332, 1.446055, 1, 0, 0.7019608, 1,
1.196449, 0.2168657, 0.7456331, 1, 0, 0.6941177, 1,
1.198729, 0.5386168, 1.877658, 1, 0, 0.6901961, 1,
1.20428, 1.074585, -1.533502, 1, 0, 0.682353, 1,
1.210695, -1.350673, 2.536156, 1, 0, 0.6784314, 1,
1.218851, 0.1710618, 2.754004, 1, 0, 0.6705883, 1,
1.219111, -1.664517, 1.540975, 1, 0, 0.6666667, 1,
1.219479, -0.8035459, 2.700757, 1, 0, 0.6588235, 1,
1.220983, -0.8846059, 2.94505, 1, 0, 0.654902, 1,
1.233761, 1.07172, 1.543567, 1, 0, 0.6470588, 1,
1.239311, 0.6783193, 1.094182, 1, 0, 0.6431373, 1,
1.241145, -2.510243, 2.460625, 1, 0, 0.6352941, 1,
1.250145, 0.02056542, 1.598183, 1, 0, 0.6313726, 1,
1.270131, -0.425157, 1.023674, 1, 0, 0.6235294, 1,
1.279058, -0.340285, 3.341059, 1, 0, 0.6196079, 1,
1.280512, -0.7906956, 3.252393, 1, 0, 0.6117647, 1,
1.285153, 0.1341329, 0.0720631, 1, 0, 0.6078432, 1,
1.287289, -1.081742, 1.583615, 1, 0, 0.6, 1,
1.290546, -0.4241605, 1.83832, 1, 0, 0.5921569, 1,
1.293229, 0.1851951, 1.115257, 1, 0, 0.5882353, 1,
1.295685, -1.448567, 2.700204, 1, 0, 0.5803922, 1,
1.311056, -0.0726509, 2.383997, 1, 0, 0.5764706, 1,
1.318253, -1.078064, 2.866106, 1, 0, 0.5686275, 1,
1.319571, -1.967119, 3.524688, 1, 0, 0.5647059, 1,
1.321576, -0.2769658, 2.258718, 1, 0, 0.5568628, 1,
1.335309, 0.7304713, 1.900771, 1, 0, 0.5529412, 1,
1.339669, 0.05386417, 1.030217, 1, 0, 0.5450981, 1,
1.347723, 1.122371, 0.2902578, 1, 0, 0.5411765, 1,
1.36258, 1.074672, 1.892458, 1, 0, 0.5333334, 1,
1.364715, 1.756518, 0.3476295, 1, 0, 0.5294118, 1,
1.365467, 0.9742187, 2.198867, 1, 0, 0.5215687, 1,
1.36942, 1.767416, 0.9610562, 1, 0, 0.5176471, 1,
1.405535, 1.996004, -1.279873, 1, 0, 0.509804, 1,
1.415182, -0.1636741, 1.287399, 1, 0, 0.5058824, 1,
1.426048, -0.5986133, 1.517038, 1, 0, 0.4980392, 1,
1.445793, -0.9548324, 1.806189, 1, 0, 0.4901961, 1,
1.454754, -1.485644, 1.227523, 1, 0, 0.4862745, 1,
1.459162, -1.014853, 1.579745, 1, 0, 0.4784314, 1,
1.462626, 1.144005, 0.9594982, 1, 0, 0.4745098, 1,
1.471056, -0.4570015, 2.222536, 1, 0, 0.4666667, 1,
1.473548, 1.94559, 0.06203229, 1, 0, 0.4627451, 1,
1.473981, -0.1036974, 1.226479, 1, 0, 0.454902, 1,
1.474251, 1.855205, 0.8139245, 1, 0, 0.4509804, 1,
1.478778, 2.222341, 0.4266288, 1, 0, 0.4431373, 1,
1.479879, 0.2176377, 1.23454, 1, 0, 0.4392157, 1,
1.488282, -0.9072853, 3.298201, 1, 0, 0.4313726, 1,
1.494834, -0.005956832, 1.789401, 1, 0, 0.427451, 1,
1.499575, 1.07883, -1.082129, 1, 0, 0.4196078, 1,
1.508512, 0.7299137, 0.3825424, 1, 0, 0.4156863, 1,
1.509104, -0.7976898, 1.062213, 1, 0, 0.4078431, 1,
1.517114, -1.61726, 2.209301, 1, 0, 0.4039216, 1,
1.521145, 0.262659, 1.96759, 1, 0, 0.3960784, 1,
1.524433, 0.6926778, -0.2275841, 1, 0, 0.3882353, 1,
1.528035, 0.9366916, 1.389905, 1, 0, 0.3843137, 1,
1.528232, 1.183473, 0.7543733, 1, 0, 0.3764706, 1,
1.536933, 0.3996286, 0.9862689, 1, 0, 0.372549, 1,
1.540813, -0.9443772, 1.317974, 1, 0, 0.3647059, 1,
1.555944, 1.334776, 0.4401051, 1, 0, 0.3607843, 1,
1.558718, -0.3243277, 2.040282, 1, 0, 0.3529412, 1,
1.572898, -1.438681, 1.454382, 1, 0, 0.3490196, 1,
1.576588, 0.9015177, -1.037056, 1, 0, 0.3411765, 1,
1.594213, -1.732436, 2.727783, 1, 0, 0.3372549, 1,
1.605373, 1.811351, -0.1716383, 1, 0, 0.3294118, 1,
1.611913, -0.317103, 2.281227, 1, 0, 0.3254902, 1,
1.622506, -0.1414597, 3.031515, 1, 0, 0.3176471, 1,
1.640402, 0.4079574, 3.262837, 1, 0, 0.3137255, 1,
1.64048, 0.002352909, 1.4677, 1, 0, 0.3058824, 1,
1.640912, 0.2215471, 1.412344, 1, 0, 0.2980392, 1,
1.66478, -1.043394, 2.753789, 1, 0, 0.2941177, 1,
1.688352, -2.269461, 3.780275, 1, 0, 0.2862745, 1,
1.697694, 0.02375599, 1.589116, 1, 0, 0.282353, 1,
1.702656, -0.7666295, 0.3028935, 1, 0, 0.2745098, 1,
1.704507, 1.358683, 0.5313883, 1, 0, 0.2705882, 1,
1.70499, 0.2859389, 1.86012, 1, 0, 0.2627451, 1,
1.714413, -0.2764617, 0.3078697, 1, 0, 0.2588235, 1,
1.730776, -0.877682, 3.314605, 1, 0, 0.2509804, 1,
1.745574, -0.3184854, 3.514499, 1, 0, 0.2470588, 1,
1.750434, 0.2029788, 0.7130392, 1, 0, 0.2392157, 1,
1.761959, -0.918256, 1.738292, 1, 0, 0.2352941, 1,
1.778789, 0.2826765, 0.09899467, 1, 0, 0.227451, 1,
1.781603, 0.6071436, 0.5417016, 1, 0, 0.2235294, 1,
1.788296, -0.3418497, 3.974203, 1, 0, 0.2156863, 1,
1.810364, 0.09630663, 1.656188, 1, 0, 0.2117647, 1,
1.831629, 0.5225688, 0.9615503, 1, 0, 0.2039216, 1,
1.833511, -1.896004, 2.89239, 1, 0, 0.1960784, 1,
1.846611, 0.6008898, 0.4991094, 1, 0, 0.1921569, 1,
1.847078, 1.06233, 1.983409, 1, 0, 0.1843137, 1,
1.862083, 0.9662424, 1.381132, 1, 0, 0.1803922, 1,
1.873853, 0.9282239, 0.01759518, 1, 0, 0.172549, 1,
1.890943, -0.3033991, 1.473788, 1, 0, 0.1686275, 1,
1.916133, 0.9670386, 2.062779, 1, 0, 0.1607843, 1,
1.91825, -0.189383, 1.322503, 1, 0, 0.1568628, 1,
1.926783, -0.4332993, 2.774544, 1, 0, 0.1490196, 1,
1.939484, -2.125945, 1.483731, 1, 0, 0.145098, 1,
1.950381, -1.221412, 3.324586, 1, 0, 0.1372549, 1,
1.953662, -1.740362, 0.9742144, 1, 0, 0.1333333, 1,
1.981451, 0.6825225, 1.879773, 1, 0, 0.1254902, 1,
1.984061, -1.216305, 0.8791045, 1, 0, 0.1215686, 1,
1.991187, -2.461479, 2.437906, 1, 0, 0.1137255, 1,
1.9981, 0.9588109, 0.04901284, 1, 0, 0.1098039, 1,
2.031091, 0.6403799, 1.635799, 1, 0, 0.1019608, 1,
2.038857, -0.5552787, 1.578533, 1, 0, 0.09411765, 1,
2.047496, 1.053077, 0.8317548, 1, 0, 0.09019608, 1,
2.112821, -0.1440878, 0.7187245, 1, 0, 0.08235294, 1,
2.112988, 1.888162, 2.543903, 1, 0, 0.07843138, 1,
2.122182, 0.925315, 2.318433, 1, 0, 0.07058824, 1,
2.134477, -0.241055, 0.5484021, 1, 0, 0.06666667, 1,
2.159626, 1.508387, -0.03292852, 1, 0, 0.05882353, 1,
2.226058, 0.2716662, 0.4929344, 1, 0, 0.05490196, 1,
2.240933, -1.265904, 0.8072669, 1, 0, 0.04705882, 1,
2.266027, 0.3078565, 0.5341313, 1, 0, 0.04313726, 1,
2.340396, -0.6765473, 0.7364898, 1, 0, 0.03529412, 1,
2.367461, -0.5722432, 0.5457425, 1, 0, 0.03137255, 1,
2.43719, 0.1276495, 1.083312, 1, 0, 0.02352941, 1,
2.811111, 0.2787909, 3.239534, 1, 0, 0.01960784, 1,
2.910523, -1.381983, -0.0973108, 1, 0, 0.01176471, 1,
3.038624, -0.9846136, 1.530055, 1, 0, 0.007843138, 1
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
-0.1775476, -3.90761, -7.43984, 0, -0.5, 0.5, 0.5,
-0.1775476, -3.90761, -7.43984, 1, -0.5, 0.5, 0.5,
-0.1775476, -3.90761, -7.43984, 1, 1.5, 0.5, 0.5,
-0.1775476, -3.90761, -7.43984, 0, 1.5, 0.5, 0.5
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
-4.484001, 0.3862451, -7.43984, 0, -0.5, 0.5, 0.5,
-4.484001, 0.3862451, -7.43984, 1, -0.5, 0.5, 0.5,
-4.484001, 0.3862451, -7.43984, 1, 1.5, 0.5, 0.5,
-4.484001, 0.3862451, -7.43984, 0, 1.5, 0.5, 0.5
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
-4.484001, -3.90761, -0.3190091, 0, -0.5, 0.5, 0.5,
-4.484001, -3.90761, -0.3190091, 1, -0.5, 0.5, 0.5,
-4.484001, -3.90761, -0.3190091, 1, 1.5, 0.5, 0.5,
-4.484001, -3.90761, -0.3190091, 0, 1.5, 0.5, 0.5
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
-3, -2.916721, -5.796572,
3, -2.916721, -5.796572,
-3, -2.916721, -5.796572,
-3, -3.081869, -6.07045,
-2, -2.916721, -5.796572,
-2, -3.081869, -6.07045,
-1, -2.916721, -5.796572,
-1, -3.081869, -6.07045,
0, -2.916721, -5.796572,
0, -3.081869, -6.07045,
1, -2.916721, -5.796572,
1, -3.081869, -6.07045,
2, -2.916721, -5.796572,
2, -3.081869, -6.07045,
3, -2.916721, -5.796572,
3, -3.081869, -6.07045
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
-3, -3.412166, -6.618206, 0, -0.5, 0.5, 0.5,
-3, -3.412166, -6.618206, 1, -0.5, 0.5, 0.5,
-3, -3.412166, -6.618206, 1, 1.5, 0.5, 0.5,
-3, -3.412166, -6.618206, 0, 1.5, 0.5, 0.5,
-2, -3.412166, -6.618206, 0, -0.5, 0.5, 0.5,
-2, -3.412166, -6.618206, 1, -0.5, 0.5, 0.5,
-2, -3.412166, -6.618206, 1, 1.5, 0.5, 0.5,
-2, -3.412166, -6.618206, 0, 1.5, 0.5, 0.5,
-1, -3.412166, -6.618206, 0, -0.5, 0.5, 0.5,
-1, -3.412166, -6.618206, 1, -0.5, 0.5, 0.5,
-1, -3.412166, -6.618206, 1, 1.5, 0.5, 0.5,
-1, -3.412166, -6.618206, 0, 1.5, 0.5, 0.5,
0, -3.412166, -6.618206, 0, -0.5, 0.5, 0.5,
0, -3.412166, -6.618206, 1, -0.5, 0.5, 0.5,
0, -3.412166, -6.618206, 1, 1.5, 0.5, 0.5,
0, -3.412166, -6.618206, 0, 1.5, 0.5, 0.5,
1, -3.412166, -6.618206, 0, -0.5, 0.5, 0.5,
1, -3.412166, -6.618206, 1, -0.5, 0.5, 0.5,
1, -3.412166, -6.618206, 1, 1.5, 0.5, 0.5,
1, -3.412166, -6.618206, 0, 1.5, 0.5, 0.5,
2, -3.412166, -6.618206, 0, -0.5, 0.5, 0.5,
2, -3.412166, -6.618206, 1, -0.5, 0.5, 0.5,
2, -3.412166, -6.618206, 1, 1.5, 0.5, 0.5,
2, -3.412166, -6.618206, 0, 1.5, 0.5, 0.5,
3, -3.412166, -6.618206, 0, -0.5, 0.5, 0.5,
3, -3.412166, -6.618206, 1, -0.5, 0.5, 0.5,
3, -3.412166, -6.618206, 1, 1.5, 0.5, 0.5,
3, -3.412166, -6.618206, 0, 1.5, 0.5, 0.5
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
-3.490204, -2, -5.796572,
-3.490204, 3, -5.796572,
-3.490204, -2, -5.796572,
-3.655837, -2, -6.07045,
-3.490204, -1, -5.796572,
-3.655837, -1, -6.07045,
-3.490204, 0, -5.796572,
-3.655837, 0, -6.07045,
-3.490204, 1, -5.796572,
-3.655837, 1, -6.07045,
-3.490204, 2, -5.796572,
-3.655837, 2, -6.07045,
-3.490204, 3, -5.796572,
-3.655837, 3, -6.07045
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
-3.987103, -2, -6.618206, 0, -0.5, 0.5, 0.5,
-3.987103, -2, -6.618206, 1, -0.5, 0.5, 0.5,
-3.987103, -2, -6.618206, 1, 1.5, 0.5, 0.5,
-3.987103, -2, -6.618206, 0, 1.5, 0.5, 0.5,
-3.987103, -1, -6.618206, 0, -0.5, 0.5, 0.5,
-3.987103, -1, -6.618206, 1, -0.5, 0.5, 0.5,
-3.987103, -1, -6.618206, 1, 1.5, 0.5, 0.5,
-3.987103, -1, -6.618206, 0, 1.5, 0.5, 0.5,
-3.987103, 0, -6.618206, 0, -0.5, 0.5, 0.5,
-3.987103, 0, -6.618206, 1, -0.5, 0.5, 0.5,
-3.987103, 0, -6.618206, 1, 1.5, 0.5, 0.5,
-3.987103, 0, -6.618206, 0, 1.5, 0.5, 0.5,
-3.987103, 1, -6.618206, 0, -0.5, 0.5, 0.5,
-3.987103, 1, -6.618206, 1, -0.5, 0.5, 0.5,
-3.987103, 1, -6.618206, 1, 1.5, 0.5, 0.5,
-3.987103, 1, -6.618206, 0, 1.5, 0.5, 0.5,
-3.987103, 2, -6.618206, 0, -0.5, 0.5, 0.5,
-3.987103, 2, -6.618206, 1, -0.5, 0.5, 0.5,
-3.987103, 2, -6.618206, 1, 1.5, 0.5, 0.5,
-3.987103, 2, -6.618206, 0, 1.5, 0.5, 0.5,
-3.987103, 3, -6.618206, 0, -0.5, 0.5, 0.5,
-3.987103, 3, -6.618206, 1, -0.5, 0.5, 0.5,
-3.987103, 3, -6.618206, 1, 1.5, 0.5, 0.5,
-3.987103, 3, -6.618206, 0, 1.5, 0.5, 0.5
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
-3.490204, -2.916721, -4,
-3.490204, -2.916721, 4,
-3.490204, -2.916721, -4,
-3.655837, -3.081869, -4,
-3.490204, -2.916721, -2,
-3.655837, -3.081869, -2,
-3.490204, -2.916721, 0,
-3.655837, -3.081869, 0,
-3.490204, -2.916721, 2,
-3.655837, -3.081869, 2,
-3.490204, -2.916721, 4,
-3.655837, -3.081869, 4
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
-3.987103, -3.412166, -4, 0, -0.5, 0.5, 0.5,
-3.987103, -3.412166, -4, 1, -0.5, 0.5, 0.5,
-3.987103, -3.412166, -4, 1, 1.5, 0.5, 0.5,
-3.987103, -3.412166, -4, 0, 1.5, 0.5, 0.5,
-3.987103, -3.412166, -2, 0, -0.5, 0.5, 0.5,
-3.987103, -3.412166, -2, 1, -0.5, 0.5, 0.5,
-3.987103, -3.412166, -2, 1, 1.5, 0.5, 0.5,
-3.987103, -3.412166, -2, 0, 1.5, 0.5, 0.5,
-3.987103, -3.412166, 0, 0, -0.5, 0.5, 0.5,
-3.987103, -3.412166, 0, 1, -0.5, 0.5, 0.5,
-3.987103, -3.412166, 0, 1, 1.5, 0.5, 0.5,
-3.987103, -3.412166, 0, 0, 1.5, 0.5, 0.5,
-3.987103, -3.412166, 2, 0, -0.5, 0.5, 0.5,
-3.987103, -3.412166, 2, 1, -0.5, 0.5, 0.5,
-3.987103, -3.412166, 2, 1, 1.5, 0.5, 0.5,
-3.987103, -3.412166, 2, 0, 1.5, 0.5, 0.5,
-3.987103, -3.412166, 4, 0, -0.5, 0.5, 0.5,
-3.987103, -3.412166, 4, 1, -0.5, 0.5, 0.5,
-3.987103, -3.412166, 4, 1, 1.5, 0.5, 0.5,
-3.987103, -3.412166, 4, 0, 1.5, 0.5, 0.5
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
-3.490204, -2.916721, -5.796572,
-3.490204, 3.689211, -5.796572,
-3.490204, -2.916721, 5.158554,
-3.490204, 3.689211, 5.158554,
-3.490204, -2.916721, -5.796572,
-3.490204, -2.916721, 5.158554,
-3.490204, 3.689211, -5.796572,
-3.490204, 3.689211, 5.158554,
-3.490204, -2.916721, -5.796572,
3.135109, -2.916721, -5.796572,
-3.490204, -2.916721, 5.158554,
3.135109, -2.916721, 5.158554,
-3.490204, 3.689211, -5.796572,
3.135109, 3.689211, -5.796572,
-3.490204, 3.689211, 5.158554,
3.135109, 3.689211, 5.158554,
3.135109, -2.916721, -5.796572,
3.135109, 3.689211, -5.796572,
3.135109, -2.916721, 5.158554,
3.135109, 3.689211, 5.158554,
3.135109, -2.916721, -5.796572,
3.135109, -2.916721, 5.158554,
3.135109, 3.689211, -5.796572,
3.135109, 3.689211, 5.158554
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
var radius = 7.692803;
var distance = 34.22615;
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
mvMatrix.translate( 0.1775476, -0.3862451, 0.3190091 );
mvMatrix.scale( 1.255429, 1.259112, 0.7592437 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.22615);
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
thiadiazol-3-ylmethy<-read.table("thiadiazol-3-ylmethy.xyz")
```

```
## Error in read.table("thiadiazol-3-ylmethy.xyz"): no lines available in input
```

```r
x<-thiadiazol-3-ylmethy$V2
```

```
## Error in eval(expr, envir, enclos): object 'thiadiazol' not found
```

```r
y<-thiadiazol-3-ylmethy$V3
```

```
## Error in eval(expr, envir, enclos): object 'thiadiazol' not found
```

```r
z<-thiadiazol-3-ylmethy$V4
```

```
## Error in eval(expr, envir, enclos): object 'thiadiazol' not found
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
-3.393719, 0.6000264, -3.704104, 0, 0, 1, 1, 1,
-2.956313, 0.1432381, -2.220231, 1, 0, 0, 1, 1,
-2.752823, 2.175015, -0.7435316, 1, 0, 0, 1, 1,
-2.65978, -0.7911807, -2.066762, 1, 0, 0, 1, 1,
-2.562429, 0.6284955, -2.083441, 1, 0, 0, 1, 1,
-2.526579, 0.3934113, -1.5872, 1, 0, 0, 1, 1,
-2.486379, -1.32959, -3.104827, 0, 0, 0, 1, 1,
-2.382519, 0.9945816, -1.521388, 0, 0, 0, 1, 1,
-2.310673, 0.2909544, -0.9676161, 0, 0, 0, 1, 1,
-2.278741, 0.05826428, -2.899751, 0, 0, 0, 1, 1,
-2.268423, 0.3264268, -1.054254, 0, 0, 0, 1, 1,
-2.189909, -0.7463061, -2.53822, 0, 0, 0, 1, 1,
-2.122306, -0.6814024, -1.788745, 0, 0, 0, 1, 1,
-2.120442, 0.4157145, -2.593646, 1, 1, 1, 1, 1,
-2.110708, 0.1274017, -2.835914, 1, 1, 1, 1, 1,
-2.100164, -0.05307952, -1.858904, 1, 1, 1, 1, 1,
-2.097093, 0.2132429, -1.063714, 1, 1, 1, 1, 1,
-2.097066, -0.6365255, -1.178076, 1, 1, 1, 1, 1,
-2.081146, -0.5519706, -0.9948779, 1, 1, 1, 1, 1,
-2.07657, 0.7899336, -0.5522246, 1, 1, 1, 1, 1,
-2.055407, 0.2706181, 0.4627379, 1, 1, 1, 1, 1,
-2.012499, -1.178908, -1.995532, 1, 1, 1, 1, 1,
-1.997993, -0.08834536, -2.793753, 1, 1, 1, 1, 1,
-1.974778, 0.7467553, -1.221766, 1, 1, 1, 1, 1,
-1.965241, -2.808401, -1.41708, 1, 1, 1, 1, 1,
-1.842514, -1.232341, -3.08059, 1, 1, 1, 1, 1,
-1.839181, 0.08182344, -1.264469, 1, 1, 1, 1, 1,
-1.82988, -0.331536, -2.63211, 1, 1, 1, 1, 1,
-1.822072, 1.819272, -0.5575178, 0, 0, 1, 1, 1,
-1.81695, 0.9064119, -1.763298, 1, 0, 0, 1, 1,
-1.804587, 0.1783149, -2.224458, 1, 0, 0, 1, 1,
-1.802869, -1.166163, -3.396282, 1, 0, 0, 1, 1,
-1.744347, -0.6199799, -2.193639, 1, 0, 0, 1, 1,
-1.734723, -0.5608445, -1.807923, 1, 0, 0, 1, 1,
-1.721684, 0.1820736, -1.595043, 0, 0, 0, 1, 1,
-1.717032, -0.3644946, -1.074967, 0, 0, 0, 1, 1,
-1.694258, 2.250149, -1.797547, 0, 0, 0, 1, 1,
-1.688948, 0.1722144, -1.946254, 0, 0, 0, 1, 1,
-1.688186, -0.2821516, -2.485808, 0, 0, 0, 1, 1,
-1.687172, -0.5076032, -2.838381, 0, 0, 0, 1, 1,
-1.682704, -0.566364, -3.651926, 0, 0, 0, 1, 1,
-1.662213, -0.8038353, -1.738286, 1, 1, 1, 1, 1,
-1.642771, 0.7812427, -1.409268, 1, 1, 1, 1, 1,
-1.630191, 1.074782, -1.70856, 1, 1, 1, 1, 1,
-1.612364, 1.024944, -1.314098, 1, 1, 1, 1, 1,
-1.57788, 0.1570105, -2.613649, 1, 1, 1, 1, 1,
-1.557151, 0.5041288, -0.7355359, 1, 1, 1, 1, 1,
-1.535935, 0.8654774, -2.138861, 1, 1, 1, 1, 1,
-1.525333, -0.829404, -1.511962, 1, 1, 1, 1, 1,
-1.524496, 0.8465335, -1.40353, 1, 1, 1, 1, 1,
-1.51809, -0.2760903, -0.8337481, 1, 1, 1, 1, 1,
-1.498138, 0.07880504, -2.552459, 1, 1, 1, 1, 1,
-1.495574, -0.6413759, -1.626461, 1, 1, 1, 1, 1,
-1.47716, -0.901881, -1.059417, 1, 1, 1, 1, 1,
-1.463648, 0.2009813, -1.207172, 1, 1, 1, 1, 1,
-1.460434, -0.06230021, -3.531301, 1, 1, 1, 1, 1,
-1.45991, -0.3184068, -3.76785, 0, 0, 1, 1, 1,
-1.44211, -0.9420564, -1.692217, 1, 0, 0, 1, 1,
-1.437588, -0.1865782, -0.5603997, 1, 0, 0, 1, 1,
-1.428945, 0.9032459, -1.610944, 1, 0, 0, 1, 1,
-1.416784, -2.229534, -3.127195, 1, 0, 0, 1, 1,
-1.411961, 0.1934458, -2.654495, 1, 0, 0, 1, 1,
-1.410908, -0.9398177, -0.8057765, 0, 0, 0, 1, 1,
-1.40955, 0.2110255, -3.683682, 0, 0, 0, 1, 1,
-1.379427, -0.4106359, -1.33998, 0, 0, 0, 1, 1,
-1.371928, 0.3787615, -1.15822, 0, 0, 0, 1, 1,
-1.36263, -0.4367972, -1.885831, 0, 0, 0, 1, 1,
-1.360789, 1.140585, -1.855008, 0, 0, 0, 1, 1,
-1.360618, -1.075727, -2.799909, 0, 0, 0, 1, 1,
-1.354374, 1.091251, -1.344238, 1, 1, 1, 1, 1,
-1.35405, 0.497473, -1.433022, 1, 1, 1, 1, 1,
-1.344325, 0.1048019, -2.322455, 1, 1, 1, 1, 1,
-1.331584, 0.913146, -1.006153, 1, 1, 1, 1, 1,
-1.309786, 0.576876, -1.55542, 1, 1, 1, 1, 1,
-1.298699, -0.3495767, -0.9142465, 1, 1, 1, 1, 1,
-1.294345, -0.4369819, -0.9539518, 1, 1, 1, 1, 1,
-1.291955, 0.3278415, -2.320669, 1, 1, 1, 1, 1,
-1.290801, -1.507743, -1.812023, 1, 1, 1, 1, 1,
-1.290705, 1.053969, -2.052098, 1, 1, 1, 1, 1,
-1.284148, -0.5574642, -2.901854, 1, 1, 1, 1, 1,
-1.277092, -0.5019277, -1.70241, 1, 1, 1, 1, 1,
-1.27659, 1.43057, -0.5443172, 1, 1, 1, 1, 1,
-1.273901, 1.172843, -1.656737, 1, 1, 1, 1, 1,
-1.242784, 0.2069413, -1.880909, 1, 1, 1, 1, 1,
-1.240484, 0.1219713, -2.490093, 0, 0, 1, 1, 1,
-1.239433, 0.9690409, -1.131651, 1, 0, 0, 1, 1,
-1.237342, 0.1037402, -1.43044, 1, 0, 0, 1, 1,
-1.231992, -1.400451, -2.321049, 1, 0, 0, 1, 1,
-1.218491, -0.9821971, -2.368951, 1, 0, 0, 1, 1,
-1.213974, 0.1875947, 0.7702568, 1, 0, 0, 1, 1,
-1.212492, -1.125163, -2.062807, 0, 0, 0, 1, 1,
-1.208757, -0.6420323, -0.4943599, 0, 0, 0, 1, 1,
-1.208706, -0.86472, -0.2832749, 0, 0, 0, 1, 1,
-1.206092, 1.659451, 0.115628, 0, 0, 0, 1, 1,
-1.181364, 0.8889539, 1.613942, 0, 0, 0, 1, 1,
-1.180099, 1.152385, -1.519908, 0, 0, 0, 1, 1,
-1.1748, -2.435967, -3.201801, 0, 0, 0, 1, 1,
-1.164507, 0.6565566, -2.619812, 1, 1, 1, 1, 1,
-1.159357, -0.00969295, -1.414662, 1, 1, 1, 1, 1,
-1.154699, -0.1392648, -3.331591, 1, 1, 1, 1, 1,
-1.150383, 0.1904856, 1.304685, 1, 1, 1, 1, 1,
-1.148839, -0.244889, -2.210735, 1, 1, 1, 1, 1,
-1.143841, -0.7118266, -4.289906, 1, 1, 1, 1, 1,
-1.134328, 2.031448, 0.1994523, 1, 1, 1, 1, 1,
-1.131872, 0.2316664, -0.2757171, 1, 1, 1, 1, 1,
-1.116443, -0.1250753, -1.161281, 1, 1, 1, 1, 1,
-1.108322, -0.5042499, -2.027836, 1, 1, 1, 1, 1,
-1.106115, -1.292359, -2.097159, 1, 1, 1, 1, 1,
-1.097455, 0.8389822, -0.4300002, 1, 1, 1, 1, 1,
-1.091851, -0.7234209, -2.580628, 1, 1, 1, 1, 1,
-1.091241, 0.6854544, -2.258582, 1, 1, 1, 1, 1,
-1.086154, 2.538754, -1.580863, 1, 1, 1, 1, 1,
-1.085874, -0.6726876, -1.822845, 0, 0, 1, 1, 1,
-1.084599, -0.1790536, -1.001002, 1, 0, 0, 1, 1,
-1.076863, -0.2438472, -2.045301, 1, 0, 0, 1, 1,
-1.07458, 1.053588, 0.002147052, 1, 0, 0, 1, 1,
-1.07005, 0.955136, 0.3887361, 1, 0, 0, 1, 1,
-1.046377, 0.4455482, -1.166161, 1, 0, 0, 1, 1,
-1.041346, -0.3205377, -0.6550586, 0, 0, 0, 1, 1,
-1.041116, -0.2352335, -2.898203, 0, 0, 0, 1, 1,
-1.036054, 0.5822648, -0.7975481, 0, 0, 0, 1, 1,
-1.030693, 0.01212496, -0.6241433, 0, 0, 0, 1, 1,
-1.029949, 0.6124446, -3.101708, 0, 0, 0, 1, 1,
-1.026707, 1.440865, 0.4498243, 0, 0, 0, 1, 1,
-1.025316, 0.3088462, -0.5430228, 0, 0, 0, 1, 1,
-1.022638, 0.2483455, -2.911501, 1, 1, 1, 1, 1,
-1.020846, -0.2897942, -3.663833, 1, 1, 1, 1, 1,
-0.9974971, 1.507531, 0.9100162, 1, 1, 1, 1, 1,
-0.9949181, -0.8262259, -3.979522, 1, 1, 1, 1, 1,
-0.9889622, -0.1717743, -2.187785, 1, 1, 1, 1, 1,
-0.9786432, 0.9677103, 0.3079422, 1, 1, 1, 1, 1,
-0.9757451, -0.2416137, -2.973634, 1, 1, 1, 1, 1,
-0.9735845, -1.851874, -1.639226, 1, 1, 1, 1, 1,
-0.9660465, 0.6147885, -0.003150837, 1, 1, 1, 1, 1,
-0.9641697, 1.005164, 0.5800174, 1, 1, 1, 1, 1,
-0.9612552, -1.956694, -1.411265, 1, 1, 1, 1, 1,
-0.9607738, -0.7902533, -2.837896, 1, 1, 1, 1, 1,
-0.9580445, 0.9919525, 0.01169331, 1, 1, 1, 1, 1,
-0.9574851, 0.6487017, -2.080839, 1, 1, 1, 1, 1,
-0.9528942, -1.070856, -2.509501, 1, 1, 1, 1, 1,
-0.9525329, 0.7413475, -2.848719, 0, 0, 1, 1, 1,
-0.9474336, 0.05513112, -2.184899, 1, 0, 0, 1, 1,
-0.9423925, 0.3793566, -1.828616, 1, 0, 0, 1, 1,
-0.9405329, -0.1419252, -1.547926, 1, 0, 0, 1, 1,
-0.9336545, 1.323586, -0.915027, 1, 0, 0, 1, 1,
-0.929455, -0.7010998, -3.860099, 1, 0, 0, 1, 1,
-0.9282783, 0.9772407, 0.674728, 0, 0, 0, 1, 1,
-0.9269364, 0.1986237, 0.2706646, 0, 0, 0, 1, 1,
-0.926738, 0.1364835, -0.9253221, 0, 0, 0, 1, 1,
-0.923413, 1.007139, -1.051533, 0, 0, 0, 1, 1,
-0.9227912, 0.6059619, -1.751363, 0, 0, 0, 1, 1,
-0.9182474, -1.25674, -1.788326, 0, 0, 0, 1, 1,
-0.9158518, 0.7416028, -1.095085, 0, 0, 0, 1, 1,
-0.9134349, 1.012767, -1.124492, 1, 1, 1, 1, 1,
-0.9117899, -1.901396, -3.262395, 1, 1, 1, 1, 1,
-0.9073389, 1.696756, 0.07322695, 1, 1, 1, 1, 1,
-0.9049871, 1.0717, -2.527666, 1, 1, 1, 1, 1,
-0.8990646, 0.1351924, -2.503073, 1, 1, 1, 1, 1,
-0.8974839, 1.182026, -2.351536, 1, 1, 1, 1, 1,
-0.8961182, 0.2303479, -1.498615, 1, 1, 1, 1, 1,
-0.8937597, -0.3069935, -2.520838, 1, 1, 1, 1, 1,
-0.8807685, -1.14895, -3.45117, 1, 1, 1, 1, 1,
-0.8774875, -2.068825, -3.335309, 1, 1, 1, 1, 1,
-0.8764756, 0.0961009, -2.088441, 1, 1, 1, 1, 1,
-0.8654178, 0.7955636, 0.05726116, 1, 1, 1, 1, 1,
-0.8577787, -1.495582, -2.429575, 1, 1, 1, 1, 1,
-0.8514539, 0.1058458, -1.776036, 1, 1, 1, 1, 1,
-0.8513554, -0.7598028, -2.299228, 1, 1, 1, 1, 1,
-0.8497403, -0.5785004, -3.373732, 0, 0, 1, 1, 1,
-0.848249, 0.08422855, 0.4594566, 1, 0, 0, 1, 1,
-0.8441597, 0.7565013, -0.00490287, 1, 0, 0, 1, 1,
-0.8420603, -1.185431, -0.2858815, 1, 0, 0, 1, 1,
-0.8343277, 0.2704293, -0.483902, 1, 0, 0, 1, 1,
-0.834192, 1.746469, 0.1719284, 1, 0, 0, 1, 1,
-0.8310648, -1.137727, -0.7299486, 0, 0, 0, 1, 1,
-0.8263146, 0.7393044, -0.8056312, 0, 0, 0, 1, 1,
-0.8167838, -0.07807735, -0.672172, 0, 0, 0, 1, 1,
-0.8126315, -1.389142, -2.467833, 0, 0, 0, 1, 1,
-0.8097129, 0.1124209, -1.601336, 0, 0, 0, 1, 1,
-0.8020331, -0.2103874, -2.89285, 0, 0, 0, 1, 1,
-0.7993606, -0.5978237, -1.594019, 0, 0, 0, 1, 1,
-0.79677, 1.496502, -0.3010293, 1, 1, 1, 1, 1,
-0.7946007, 0.610572, -1.30829, 1, 1, 1, 1, 1,
-0.7936631, -0.4910853, -2.937355, 1, 1, 1, 1, 1,
-0.7872231, 0.2486463, -0.2898689, 1, 1, 1, 1, 1,
-0.7832038, -0.4413039, -1.328743, 1, 1, 1, 1, 1,
-0.7811509, -0.4213545, -1.728085, 1, 1, 1, 1, 1,
-0.7793398, -0.4904056, -1.490381, 1, 1, 1, 1, 1,
-0.7774132, 0.5625528, -1.857873, 1, 1, 1, 1, 1,
-0.7745678, -1.371535, -1.52954, 1, 1, 1, 1, 1,
-0.7717577, -1.988513, -2.449571, 1, 1, 1, 1, 1,
-0.7682967, -1.685481, -2.326978, 1, 1, 1, 1, 1,
-0.7676397, -0.8535194, -1.831506, 1, 1, 1, 1, 1,
-0.7660133, 0.5565586, -0.4111252, 1, 1, 1, 1, 1,
-0.76381, 0.4287284, -1.736118, 1, 1, 1, 1, 1,
-0.7615475, 0.07007664, -1.8025, 1, 1, 1, 1, 1,
-0.7608568, -0.6908366, -1.178411, 0, 0, 1, 1, 1,
-0.7607919, 0.6641821, -0.7019665, 1, 0, 0, 1, 1,
-0.7557691, -0.02125971, -1.844233, 1, 0, 0, 1, 1,
-0.7537643, -1.721804, -2.243919, 1, 0, 0, 1, 1,
-0.7460548, -2.235423, -0.3682207, 1, 0, 0, 1, 1,
-0.7349687, -0.780524, -2.798599, 1, 0, 0, 1, 1,
-0.7281497, 1.738856, -2.944268, 0, 0, 0, 1, 1,
-0.7279246, -0.8609594, -4.930633, 0, 0, 0, 1, 1,
-0.7172416, -0.9762778, -0.9130309, 0, 0, 0, 1, 1,
-0.7118009, -1.580154, -2.04584, 0, 0, 0, 1, 1,
-0.7060611, 1.13659, -1.856885, 0, 0, 0, 1, 1,
-0.7036563, 0.550288, -0.7509147, 0, 0, 0, 1, 1,
-0.6994823, -0.4533366, -2.824387, 0, 0, 0, 1, 1,
-0.6993668, 0.1807132, -2.990658, 1, 1, 1, 1, 1,
-0.695523, 0.7984284, -1.02965, 1, 1, 1, 1, 1,
-0.6926152, -0.2485022, -1.875016, 1, 1, 1, 1, 1,
-0.6925415, -1.63971, -2.035378, 1, 1, 1, 1, 1,
-0.6901972, -0.8105178, -3.219898, 1, 1, 1, 1, 1,
-0.68911, 1.84324, -1.21469, 1, 1, 1, 1, 1,
-0.6842031, -0.7210699, -2.933521, 1, 1, 1, 1, 1,
-0.6815171, -0.2586676, -2.901672, 1, 1, 1, 1, 1,
-0.6778261, -1.423839, -3.68977, 1, 1, 1, 1, 1,
-0.6773561, -1.011914, -3.639621, 1, 1, 1, 1, 1,
-0.6766968, 0.4273455, -1.764901, 1, 1, 1, 1, 1,
-0.6760004, -0.4257449, -1.597507, 1, 1, 1, 1, 1,
-0.675752, -0.9915472, -2.573785, 1, 1, 1, 1, 1,
-0.675315, 0.3413249, 0.9155887, 1, 1, 1, 1, 1,
-0.6738375, -0.4079325, -1.513642, 1, 1, 1, 1, 1,
-0.6726688, 0.6219203, 1.617825, 0, 0, 1, 1, 1,
-0.6726277, 0.516888, -0.3709478, 1, 0, 0, 1, 1,
-0.6679783, 1.442303, -1.721517, 1, 0, 0, 1, 1,
-0.6596127, 0.7806686, -1.712462, 1, 0, 0, 1, 1,
-0.6589242, -0.5977122, -1.330979, 1, 0, 0, 1, 1,
-0.6551493, -0.4895526, -1.6962, 1, 0, 0, 1, 1,
-0.6546945, 0.1242405, -0.228085, 0, 0, 0, 1, 1,
-0.6539991, 1.498711, 1.035747, 0, 0, 0, 1, 1,
-0.6504038, -0.5621372, 0.02523863, 0, 0, 0, 1, 1,
-0.6443713, -0.7190869, -0.7070125, 0, 0, 0, 1, 1,
-0.6401706, -1.729041, -1.939126, 0, 0, 0, 1, 1,
-0.6385552, 0.9513266, -2.363682, 0, 0, 0, 1, 1,
-0.6371382, -0.3630273, -3.395195, 0, 0, 0, 1, 1,
-0.6363203, -1.110597, -3.309949, 1, 1, 1, 1, 1,
-0.6337694, 0.2618292, -1.151099, 1, 1, 1, 1, 1,
-0.6322429, 0.8053915, -1.557898, 1, 1, 1, 1, 1,
-0.6213828, 1.281065, -1.71262, 1, 1, 1, 1, 1,
-0.6212198, 0.3362378, -2.125662, 1, 1, 1, 1, 1,
-0.6192589, 0.1074892, -0.595987, 1, 1, 1, 1, 1,
-0.6148038, -0.963129, -2.042512, 1, 1, 1, 1, 1,
-0.614595, 1.153672, -0.09814074, 1, 1, 1, 1, 1,
-0.6082754, -0.3452747, -1.995673, 1, 1, 1, 1, 1,
-0.6078196, -0.1815652, -1.887266, 1, 1, 1, 1, 1,
-0.6063864, 0.8024521, -1.607422, 1, 1, 1, 1, 1,
-0.6063814, -0.06754389, -2.226, 1, 1, 1, 1, 1,
-0.6051131, 0.5255518, 0.249284, 1, 1, 1, 1, 1,
-0.6040538, -0.1731534, -4.166254, 1, 1, 1, 1, 1,
-0.6016294, -0.6399922, -2.712378, 1, 1, 1, 1, 1,
-0.5987983, 2.038502, -0.3593138, 0, 0, 1, 1, 1,
-0.5973502, 1.272275, 0.1293809, 1, 0, 0, 1, 1,
-0.5949548, 0.02901635, -0.6544521, 1, 0, 0, 1, 1,
-0.5924227, -1.129924, -3.217949, 1, 0, 0, 1, 1,
-0.5912591, -1.787816, -4.35174, 1, 0, 0, 1, 1,
-0.5888612, 0.1831266, -0.7312472, 1, 0, 0, 1, 1,
-0.5841202, 0.03644235, -2.806833, 0, 0, 0, 1, 1,
-0.5802892, -0.5943996, -2.3921, 0, 0, 0, 1, 1,
-0.5782657, 0.1681477, -1.292814, 0, 0, 0, 1, 1,
-0.5778543, -0.1123077, -3.117036, 0, 0, 0, 1, 1,
-0.5766455, -0.6199856, -2.526908, 0, 0, 0, 1, 1,
-0.5744455, -0.6173393, -3.019737, 0, 0, 0, 1, 1,
-0.5731749, 0.4308712, -0.8038026, 0, 0, 0, 1, 1,
-0.5697094, 1.406063, 1.113488, 1, 1, 1, 1, 1,
-0.5679528, -0.4518584, -2.572619, 1, 1, 1, 1, 1,
-0.5672407, 0.2882718, 0.5083508, 1, 1, 1, 1, 1,
-0.5667059, 0.7359173, -3.286657, 1, 1, 1, 1, 1,
-0.5661579, 1.001108, -1.319248, 1, 1, 1, 1, 1,
-0.5595793, -0.07551879, -1.239442, 1, 1, 1, 1, 1,
-0.5585222, -1.033409, -1.480939, 1, 1, 1, 1, 1,
-0.5564868, -0.1480443, -2.849002, 1, 1, 1, 1, 1,
-0.5557606, 0.1502558, -0.125314, 1, 1, 1, 1, 1,
-0.5555586, -2.49702, -4.169634, 1, 1, 1, 1, 1,
-0.5543928, -0.3723043, -0.5677999, 1, 1, 1, 1, 1,
-0.5495684, 0.2261563, -1.364085, 1, 1, 1, 1, 1,
-0.5488259, -0.7577756, -2.999789, 1, 1, 1, 1, 1,
-0.5429941, 0.233262, 1.567127, 1, 1, 1, 1, 1,
-0.5427523, 3.593008, -2.148223, 1, 1, 1, 1, 1,
-0.5416206, 0.5577326, 0.6507489, 0, 0, 1, 1, 1,
-0.5378761, -0.4167512, -3.090821, 1, 0, 0, 1, 1,
-0.5358012, 1.862316, -0.6865163, 1, 0, 0, 1, 1,
-0.5347285, 1.081461, -1.262465, 1, 0, 0, 1, 1,
-0.5307856, 1.178916, -0.5665694, 1, 0, 0, 1, 1,
-0.521042, -0.7564773, -1.806802, 1, 0, 0, 1, 1,
-0.5167193, -1.728785, -2.248526, 0, 0, 0, 1, 1,
-0.503673, 0.9678061, 0.3002283, 0, 0, 0, 1, 1,
-0.5036326, 0.9916093, -1.545892, 0, 0, 0, 1, 1,
-0.503322, -0.6635972, -3.971089, 0, 0, 0, 1, 1,
-0.5027551, 0.5897647, -0.7682214, 0, 0, 0, 1, 1,
-0.4958387, 2.175406, 1.144474, 0, 0, 0, 1, 1,
-0.4942508, 1.422624, 1.510538, 0, 0, 0, 1, 1,
-0.483906, 0.3666996, -0.3610098, 1, 1, 1, 1, 1,
-0.481679, 1.025349, -0.04031822, 1, 1, 1, 1, 1,
-0.4778701, 0.6764752, 1.806858, 1, 1, 1, 1, 1,
-0.4742744, 0.07164195, -1.559662, 1, 1, 1, 1, 1,
-0.4724225, 0.1514717, -0.3825324, 1, 1, 1, 1, 1,
-0.4690506, 1.92755, -0.4987493, 1, 1, 1, 1, 1,
-0.4673122, -0.3238448, -1.540536, 1, 1, 1, 1, 1,
-0.4595134, -0.8914126, -1.446406, 1, 1, 1, 1, 1,
-0.4490854, 1.349851, -0.4662293, 1, 1, 1, 1, 1,
-0.447546, -0.1437259, -1.760339, 1, 1, 1, 1, 1,
-0.4457524, -0.5808838, -0.8378356, 1, 1, 1, 1, 1,
-0.4415331, -0.7577357, -2.080856, 1, 1, 1, 1, 1,
-0.4394687, -0.7521315, -3.708834, 1, 1, 1, 1, 1,
-0.4376252, -1.735478, -1.603047, 1, 1, 1, 1, 1,
-0.43478, -0.7163281, -2.42744, 1, 1, 1, 1, 1,
-0.4266945, 1.348984, -1.39513, 0, 0, 1, 1, 1,
-0.4250681, -0.1992793, -1.715512, 1, 0, 0, 1, 1,
-0.4239213, 0.7459643, -0.7765132, 1, 0, 0, 1, 1,
-0.4237577, -1.323722, -2.349818, 1, 0, 0, 1, 1,
-0.4185575, -0.868403, -2.989812, 1, 0, 0, 1, 1,
-0.4182073, 1.410212, -0.2551534, 1, 0, 0, 1, 1,
-0.4125243, -2.130197, -2.91394, 0, 0, 0, 1, 1,
-0.4096101, 0.1811077, -0.9932984, 0, 0, 0, 1, 1,
-0.4022304, -1.163913, -2.384634, 0, 0, 0, 1, 1,
-0.4011419, -1.310249, -2.455671, 0, 0, 0, 1, 1,
-0.3971714, 0.4066974, -2.513964, 0, 0, 0, 1, 1,
-0.3944205, 1.817508, -0.6176338, 0, 0, 0, 1, 1,
-0.3929755, 1.36482, -0.09891789, 0, 0, 0, 1, 1,
-0.3901023, 0.8546714, -0.6532361, 1, 1, 1, 1, 1,
-0.3884194, -0.3319781, -1.537393, 1, 1, 1, 1, 1,
-0.3876906, 0.4018928, -0.3332357, 1, 1, 1, 1, 1,
-0.3871046, 0.8568795, -0.3949999, 1, 1, 1, 1, 1,
-0.386902, 0.0266682, -0.7446172, 1, 1, 1, 1, 1,
-0.3839687, -1.63717, -4.596163, 1, 1, 1, 1, 1,
-0.3807818, 0.3869713, 0.1670891, 1, 1, 1, 1, 1,
-0.3800498, -0.2311679, -2.562401, 1, 1, 1, 1, 1,
-0.3794715, 0.2732533, -1.370209, 1, 1, 1, 1, 1,
-0.3729362, 0.8568568, -1.099644, 1, 1, 1, 1, 1,
-0.3724572, -1.474865, -2.85946, 1, 1, 1, 1, 1,
-0.3709556, -0.2156208, -1.173088, 1, 1, 1, 1, 1,
-0.3681125, -0.8518015, -3.927735, 1, 1, 1, 1, 1,
-0.3667504, 0.3170435, -1.523469, 1, 1, 1, 1, 1,
-0.3663531, 0.01800816, 0.562432, 1, 1, 1, 1, 1,
-0.3653335, -0.8569978, -2.856688, 0, 0, 1, 1, 1,
-0.362584, -1.350627, -2.294148, 1, 0, 0, 1, 1,
-0.3619092, 0.7823696, 0.132158, 1, 0, 0, 1, 1,
-0.3610331, 0.512329, -0.8468607, 1, 0, 0, 1, 1,
-0.3576404, -0.06450088, -3.245276, 1, 0, 0, 1, 1,
-0.3575744, -0.171943, -3.175145, 1, 0, 0, 1, 1,
-0.3559145, 0.0006210923, -3.549328, 0, 0, 0, 1, 1,
-0.3480604, 0.2503038, -2.573112, 0, 0, 0, 1, 1,
-0.3463141, -1.506207, -3.283635, 0, 0, 0, 1, 1,
-0.341198, -1.733926, -1.346203, 0, 0, 0, 1, 1,
-0.3393419, -0.8200815, -2.205283, 0, 0, 0, 1, 1,
-0.3390784, 0.094221, 0.003196453, 0, 0, 0, 1, 1,
-0.3384524, -0.1319371, -1.632328, 0, 0, 0, 1, 1,
-0.3320284, 0.7248429, -0.9857792, 1, 1, 1, 1, 1,
-0.3305007, -1.198188, -3.08643, 1, 1, 1, 1, 1,
-0.323229, -0.7073858, -4.771672, 1, 1, 1, 1, 1,
-0.3207647, -0.2205442, -1.544667, 1, 1, 1, 1, 1,
-0.3203191, -0.5078962, -3.188817, 1, 1, 1, 1, 1,
-0.3196289, -0.6395496, -2.280414, 1, 1, 1, 1, 1,
-0.3182567, -0.9075174, -3.483273, 1, 1, 1, 1, 1,
-0.3093133, -0.4586849, -3.36496, 1, 1, 1, 1, 1,
-0.3092987, -0.2949688, -1.589181, 1, 1, 1, 1, 1,
-0.3089783, 0.9374265, 0.4928282, 1, 1, 1, 1, 1,
-0.3058246, -0.4455995, -2.295957, 1, 1, 1, 1, 1,
-0.3048675, -0.1301768, -2.105636, 1, 1, 1, 1, 1,
-0.3047292, -2.331526, -2.528628, 1, 1, 1, 1, 1,
-0.3047248, -1.063007, -2.875738, 1, 1, 1, 1, 1,
-0.303539, 1.09966, -0.02400465, 1, 1, 1, 1, 1,
-0.3009648, 0.4078566, -0.858857, 0, 0, 1, 1, 1,
-0.3009115, 0.4875096, -0.5198289, 1, 0, 0, 1, 1,
-0.2963906, 0.2115437, -0.7717773, 1, 0, 0, 1, 1,
-0.2899583, -2.178264, -3.505084, 1, 0, 0, 1, 1,
-0.2872115, -0.2818503, -1.0704, 1, 0, 0, 1, 1,
-0.2868263, -1.616159, -3.926823, 1, 0, 0, 1, 1,
-0.2842929, -0.110034, -0.2911555, 0, 0, 0, 1, 1,
-0.283152, -0.3174552, -3.04345, 0, 0, 0, 1, 1,
-0.2775111, -0.07260413, -3.352522, 0, 0, 0, 1, 1,
-0.2770995, 1.009917, -1.399418, 0, 0, 0, 1, 1,
-0.2752468, 1.518113, -0.2124837, 0, 0, 0, 1, 1,
-0.268621, 0.9513751, 0.9421697, 0, 0, 0, 1, 1,
-0.2668363, 0.9873832, -0.2961645, 0, 0, 0, 1, 1,
-0.265301, -0.5397691, -3.289415, 1, 1, 1, 1, 1,
-0.2614181, 1.662544, 1.409609, 1, 1, 1, 1, 1,
-0.2583043, 2.243812, 0.2337402, 1, 1, 1, 1, 1,
-0.2526492, -0.5358654, -1.082894, 1, 1, 1, 1, 1,
-0.2515391, -1.342385, -2.11693, 1, 1, 1, 1, 1,
-0.2506844, -0.491354, -2.954936, 1, 1, 1, 1, 1,
-0.2478023, -0.9270412, -2.564177, 1, 1, 1, 1, 1,
-0.239389, -0.0994837, -1.165821, 1, 1, 1, 1, 1,
-0.2371224, -0.8025969, -1.912014, 1, 1, 1, 1, 1,
-0.2364919, -0.1217961, -2.952528, 1, 1, 1, 1, 1,
-0.2360044, -0.7100642, -3.27719, 1, 1, 1, 1, 1,
-0.2343878, -0.9407346, -3.013369, 1, 1, 1, 1, 1,
-0.2318198, 0.3898924, 0.7806253, 1, 1, 1, 1, 1,
-0.2308549, 0.9417474, 1.103989, 1, 1, 1, 1, 1,
-0.2273309, -1.848696, -1.291072, 1, 1, 1, 1, 1,
-0.2261879, 1.48734, -0.4180231, 0, 0, 1, 1, 1,
-0.2252592, 0.5756979, -1.318174, 1, 0, 0, 1, 1,
-0.2216764, -0.05615325, -1.685758, 1, 0, 0, 1, 1,
-0.2180217, -0.1149304, -3.845131, 1, 0, 0, 1, 1,
-0.2160691, -1.207453, -2.079453, 1, 0, 0, 1, 1,
-0.2126688, 1.388209, 0.3054305, 1, 0, 0, 1, 1,
-0.2089208, -0.4577113, -2.464997, 0, 0, 0, 1, 1,
-0.2060115, 0.1398262, -1.003899, 0, 0, 0, 1, 1,
-0.2037279, 0.1898468, -1.634346, 0, 0, 0, 1, 1,
-0.2017682, 0.6266915, -1.07109, 0, 0, 0, 1, 1,
-0.2013287, 0.6085799, -0.2775009, 0, 0, 0, 1, 1,
-0.2012263, 0.7455854, 0.4864537, 0, 0, 0, 1, 1,
-0.195853, -0.2060811, -2.083455, 0, 0, 0, 1, 1,
-0.1908126, -0.985729, -2.225503, 1, 1, 1, 1, 1,
-0.1877624, -0.2979247, -4.243306, 1, 1, 1, 1, 1,
-0.1865993, -0.3986844, -2.166742, 1, 1, 1, 1, 1,
-0.185758, -0.7538607, -1.674139, 1, 1, 1, 1, 1,
-0.1851562, -1.416364, -3.570654, 1, 1, 1, 1, 1,
-0.1832229, 0.02917217, -0.4849351, 1, 1, 1, 1, 1,
-0.178258, 0.4851052, -1.754704, 1, 1, 1, 1, 1,
-0.1728761, -0.06989167, -1.441791, 1, 1, 1, 1, 1,
-0.1718337, 0.01611408, -1.985976, 1, 1, 1, 1, 1,
-0.1708208, 0.0728598, -0.9441705, 1, 1, 1, 1, 1,
-0.1699313, 0.2419089, -0.551563, 1, 1, 1, 1, 1,
-0.1698616, 2.242503, -0.8568019, 1, 1, 1, 1, 1,
-0.1664524, 1.390486, 0.3326342, 1, 1, 1, 1, 1,
-0.1638902, 0.6651664, 0.05277122, 1, 1, 1, 1, 1,
-0.1604407, 2.262159, -1.73934, 1, 1, 1, 1, 1,
-0.1530658, 0.9352335, -0.6194344, 0, 0, 1, 1, 1,
-0.1529178, 0.3144704, -1.214466, 1, 0, 0, 1, 1,
-0.1521777, 1.270837, 0.333197, 1, 0, 0, 1, 1,
-0.1450052, -0.2453747, -3.772911, 1, 0, 0, 1, 1,
-0.1438531, 1.026927, 0.5254995, 1, 0, 0, 1, 1,
-0.1432704, 0.6475288, 0.6232826, 1, 0, 0, 1, 1,
-0.1422491, 0.3877482, 0.4846427, 0, 0, 0, 1, 1,
-0.1421174, 0.06177341, -1.143297, 0, 0, 0, 1, 1,
-0.141185, 0.5716163, -0.8879591, 0, 0, 0, 1, 1,
-0.1381369, -0.9563589, -2.245822, 0, 0, 0, 1, 1,
-0.1378019, -1.335111, -1.544785, 0, 0, 0, 1, 1,
-0.1331182, -1.645495, -3.814474, 0, 0, 0, 1, 1,
-0.1326801, 0.4171578, -1.890569, 0, 0, 0, 1, 1,
-0.1314166, 0.3297176, 0.4140611, 1, 1, 1, 1, 1,
-0.1295964, 0.1508041, 1.521984, 1, 1, 1, 1, 1,
-0.1222692, 0.0898767, -0.9659004, 1, 1, 1, 1, 1,
-0.1197097, -0.1668319, -2.59412, 1, 1, 1, 1, 1,
-0.1191529, -0.8432679, -2.638265, 1, 1, 1, 1, 1,
-0.1179924, -0.1291333, -3.625782, 1, 1, 1, 1, 1,
-0.1178778, -0.5091401, -2.485979, 1, 1, 1, 1, 1,
-0.1112337, -0.04112434, -2.650398, 1, 1, 1, 1, 1,
-0.1102224, -0.08433112, -2.205972, 1, 1, 1, 1, 1,
-0.1002946, -0.1570692, -4.109095, 1, 1, 1, 1, 1,
-0.09773153, 1.650211, -1.094496, 1, 1, 1, 1, 1,
-0.09379088, 1.253144, -1.27903, 1, 1, 1, 1, 1,
-0.08471525, -2.820518, -2.82847, 1, 1, 1, 1, 1,
-0.08280712, -1.970004, -3.895308, 1, 1, 1, 1, 1,
-0.08233019, -1.69559, -2.165348, 1, 1, 1, 1, 1,
-0.07907763, 1.720616, 0.6924562, 0, 0, 1, 1, 1,
-0.07517098, -0.3885416, -2.497754, 1, 0, 0, 1, 1,
-0.07269797, 0.3799842, -0.7556643, 1, 0, 0, 1, 1,
-0.07182012, 0.5357832, -1.297867, 1, 0, 0, 1, 1,
-0.07057743, -0.4574947, -4.8028, 1, 0, 0, 1, 1,
-0.07022601, -0.07426335, -1.882378, 1, 0, 0, 1, 1,
-0.06993548, -0.21555, -3.740422, 0, 0, 0, 1, 1,
-0.06885198, 0.5856271, -1.346696, 0, 0, 0, 1, 1,
-0.06693019, 1.445634, 0.4765618, 0, 0, 0, 1, 1,
-0.06624968, 0.2021772, -0.7237548, 0, 0, 0, 1, 1,
-0.05639523, 1.57082, -0.5631618, 0, 0, 0, 1, 1,
-0.05502816, -1.827979, -3.245246, 0, 0, 0, 1, 1,
-0.05493639, -0.2633368, -0.9132637, 0, 0, 0, 1, 1,
-0.05417937, -0.5874248, -4.199668, 1, 1, 1, 1, 1,
-0.05062911, 2.534626, -0.8532255, 1, 1, 1, 1, 1,
-0.0498575, -1.082649, -1.846875, 1, 1, 1, 1, 1,
-0.04867146, -0.3453495, -2.52527, 1, 1, 1, 1, 1,
-0.04814498, -0.3048306, -5.637031, 1, 1, 1, 1, 1,
-0.04707709, -0.7669895, -1.685583, 1, 1, 1, 1, 1,
-0.04649344, -0.4084798, -3.099984, 1, 1, 1, 1, 1,
-0.04327307, -0.008980012, -2.434973, 1, 1, 1, 1, 1,
-0.04299589, 2.036822, -0.2167435, 1, 1, 1, 1, 1,
-0.04032809, 1.614201, -0.4737038, 1, 1, 1, 1, 1,
-0.03997253, -0.0917058, -3.474699, 1, 1, 1, 1, 1,
-0.03918907, -0.08182091, -3.294842, 1, 1, 1, 1, 1,
-0.03896007, 1.64043, -0.2037603, 1, 1, 1, 1, 1,
-0.03883692, -0.613242, -5.318779, 1, 1, 1, 1, 1,
-0.03770133, 0.06586908, 0.08216815, 1, 1, 1, 1, 1,
-0.03686463, -0.9465784, -3.073085, 0, 0, 1, 1, 1,
-0.03664483, -1.521069, -5.145052, 1, 0, 0, 1, 1,
-0.0345671, 1.687468, -0.223134, 1, 0, 0, 1, 1,
-0.02246711, -0.1694087, -2.032792, 1, 0, 0, 1, 1,
-0.02075932, -0.8293346, -2.906867, 1, 0, 0, 1, 1,
-0.02008375, 0.2470218, 0.09019307, 1, 0, 0, 1, 1,
-0.01917924, -0.271125, -1.518322, 0, 0, 0, 1, 1,
-0.01045371, -2.705975, -4.234521, 0, 0, 0, 1, 1,
-0.008907652, 1.244752, 1.266364, 0, 0, 0, 1, 1,
-0.008653871, -2.521068, -3.515888, 0, 0, 0, 1, 1,
-0.007688788, -1.020386, -3.413207, 0, 0, 0, 1, 1,
-0.004156895, -0.3175524, -2.245255, 0, 0, 0, 1, 1,
-0.004153477, -0.569787, -4.060427, 0, 0, 0, 1, 1,
-0.00193123, 0.7048493, -0.003526517, 1, 1, 1, 1, 1,
-0.001181148, -0.2385519, -3.818218, 1, 1, 1, 1, 1,
-0.0007664803, -0.4942228, -3.723678, 1, 1, 1, 1, 1,
0.002422858, -0.5259812, 3.676566, 1, 1, 1, 1, 1,
0.003778129, -0.8796081, 2.46719, 1, 1, 1, 1, 1,
0.005830656, -1.995978, 2.121512, 1, 1, 1, 1, 1,
0.009001501, -0.2837872, 4.350505, 1, 1, 1, 1, 1,
0.01213178, -1.262665, 2.440189, 1, 1, 1, 1, 1,
0.01419822, 1.311674, 0.9961516, 1, 1, 1, 1, 1,
0.0150505, -0.3043516, 1.298574, 1, 1, 1, 1, 1,
0.02403731, -0.3544568, 4.943774, 1, 1, 1, 1, 1,
0.02566347, 0.04956179, 0.8013804, 1, 1, 1, 1, 1,
0.02587, -0.5296822, 2.204841, 1, 1, 1, 1, 1,
0.02943646, -0.6994358, 2.498402, 1, 1, 1, 1, 1,
0.02960286, -0.2827958, 4.136099, 1, 1, 1, 1, 1,
0.03005675, -0.6541347, 4.909105, 0, 0, 1, 1, 1,
0.04135156, 1.044261, -0.4655495, 1, 0, 0, 1, 1,
0.0429336, -0.352965, 2.680161, 1, 0, 0, 1, 1,
0.04359219, 1.672849, -0.02278593, 1, 0, 0, 1, 1,
0.0459498, -1.873007, 1.496958, 1, 0, 0, 1, 1,
0.0465047, -0.3820194, 2.674817, 1, 0, 0, 1, 1,
0.04690371, 2.629096, 0.5295127, 0, 0, 0, 1, 1,
0.04826071, -0.6765363, 2.102048, 0, 0, 0, 1, 1,
0.05487114, 2.567361, -0.6074183, 0, 0, 0, 1, 1,
0.05673398, 0.8622283, 0.4719236, 0, 0, 0, 1, 1,
0.05763569, -0.1431469, 3.320706, 0, 0, 0, 1, 1,
0.0605835, 0.2616239, 0.9169073, 0, 0, 0, 1, 1,
0.06314071, 1.104841, 0.6510531, 0, 0, 0, 1, 1,
0.07306902, 1.364556, -0.5522192, 1, 1, 1, 1, 1,
0.07957131, -0.690443, 2.17894, 1, 1, 1, 1, 1,
0.08296058, -0.3452557, 3.055208, 1, 1, 1, 1, 1,
0.08651333, -1.249435, 1.657187, 1, 1, 1, 1, 1,
0.08680757, 0.1284768, -0.0657253, 1, 1, 1, 1, 1,
0.09759368, 0.02755339, 1.610583, 1, 1, 1, 1, 1,
0.09807538, 0.6575904, 0.07561125, 1, 1, 1, 1, 1,
0.1003338, 0.7087449, 0.9156996, 1, 1, 1, 1, 1,
0.1015049, -0.5215146, 3.80445, 1, 1, 1, 1, 1,
0.1031138, -1.521081, 4.813018, 1, 1, 1, 1, 1,
0.1093128, -1.33352, 3.697539, 1, 1, 1, 1, 1,
0.1109891, 1.410097, 0.6745909, 1, 1, 1, 1, 1,
0.113, -0.2051399, 3.083967, 1, 1, 1, 1, 1,
0.1132022, 0.5769205, 0.318351, 1, 1, 1, 1, 1,
0.1169703, 0.3034533, 1.021441, 1, 1, 1, 1, 1,
0.1190821, -0.2471577, 2.508296, 0, 0, 1, 1, 1,
0.1207682, 1.131946, -1.539718, 1, 0, 0, 1, 1,
0.1215184, -1.989484, 2.56933, 1, 0, 0, 1, 1,
0.1247473, 0.6808413, 0.08853723, 1, 0, 0, 1, 1,
0.12694, -0.1693198, 1.779587, 1, 0, 0, 1, 1,
0.1290245, 0.1577729, 0.08438485, 1, 0, 0, 1, 1,
0.1311483, 0.2521825, -0.0398874, 0, 0, 0, 1, 1,
0.1314486, 1.214792, -0.142832, 0, 0, 0, 1, 1,
0.1329921, -0.2915066, 3.374294, 0, 0, 0, 1, 1,
0.1373544, -0.9788289, 4.270676, 0, 0, 0, 1, 1,
0.140246, -0.5120631, 3.870659, 0, 0, 0, 1, 1,
0.1412301, 0.9791291, 0.7167547, 0, 0, 0, 1, 1,
0.1435613, 0.2002289, -0.05950252, 0, 0, 0, 1, 1,
0.1454628, 1.074471, -0.3330615, 1, 1, 1, 1, 1,
0.1455213, 0.2331053, 1.189855, 1, 1, 1, 1, 1,
0.1463687, -0.2853365, 2.560496, 1, 1, 1, 1, 1,
0.1491187, 1.018943, 0.360797, 1, 1, 1, 1, 1,
0.1514476, -1.317896, 3.08297, 1, 1, 1, 1, 1,
0.1536998, 0.6461227, 0.4521422, 1, 1, 1, 1, 1,
0.1590189, -1.019913, 3.499483, 1, 1, 1, 1, 1,
0.1596731, -0.6644134, 4.695505, 1, 1, 1, 1, 1,
0.1630139, 0.585613, -0.8657108, 1, 1, 1, 1, 1,
0.1661493, -1.047445, 3.22929, 1, 1, 1, 1, 1,
0.1668787, -0.7880201, 1.411539, 1, 1, 1, 1, 1,
0.1737945, -0.5509724, 4.425328, 1, 1, 1, 1, 1,
0.1740528, 1.501258, -0.2954845, 1, 1, 1, 1, 1,
0.1753373, 2.006749, -2.278704, 1, 1, 1, 1, 1,
0.1772302, -0.706335, 2.695694, 1, 1, 1, 1, 1,
0.1794812, -1.624356, 4.004439, 0, 0, 1, 1, 1,
0.1821841, 0.2112386, 0.03730348, 1, 0, 0, 1, 1,
0.1874093, 1.037202, 2.321359, 1, 0, 0, 1, 1,
0.1898285, 0.3264832, 0.2768978, 1, 0, 0, 1, 1,
0.1983164, 1.791302, -0.5130704, 1, 0, 0, 1, 1,
0.2034378, -0.2019553, 3.273574, 1, 0, 0, 1, 1,
0.2056151, -0.1827881, 2.714448, 0, 0, 0, 1, 1,
0.2110744, -0.9336894, 2.442195, 0, 0, 0, 1, 1,
0.2127837, -1.024497, 4.194679, 0, 0, 0, 1, 1,
0.2149726, -0.05453574, 3.239187, 0, 0, 0, 1, 1,
0.2212963, -0.957491, 3.035806, 0, 0, 0, 1, 1,
0.2229893, 1.492318, -0.1879296, 0, 0, 0, 1, 1,
0.2239005, -0.857391, 3.156033, 0, 0, 0, 1, 1,
0.2282923, 0.8370343, 1.741777, 1, 1, 1, 1, 1,
0.2300609, 0.6369138, 0.01731722, 1, 1, 1, 1, 1,
0.2324134, -0.1031064, 2.286925, 1, 1, 1, 1, 1,
0.236073, 0.8523892, -0.9579641, 1, 1, 1, 1, 1,
0.2414507, 1.984685, 1.829516, 1, 1, 1, 1, 1,
0.2429235, -0.01926689, 3.580237, 1, 1, 1, 1, 1,
0.243003, 0.4292031, 0.002668751, 1, 1, 1, 1, 1,
0.2431448, -1.957263, 3.149279, 1, 1, 1, 1, 1,
0.2445476, -1.897408, 3.040426, 1, 1, 1, 1, 1,
0.2455497, -0.5726891, 0.9916283, 1, 1, 1, 1, 1,
0.2461467, 0.7642221, 0.3831427, 1, 1, 1, 1, 1,
0.2502201, -0.6223974, 2.089849, 1, 1, 1, 1, 1,
0.2505276, -0.8367487, 2.426381, 1, 1, 1, 1, 1,
0.2510406, 0.079696, 2.365464, 1, 1, 1, 1, 1,
0.2555768, -0.6230638, 4.728074, 1, 1, 1, 1, 1,
0.2560353, 0.3825713, 0.8546932, 0, 0, 1, 1, 1,
0.2569908, -0.1598286, 3.592044, 1, 0, 0, 1, 1,
0.257423, -0.3926482, 4.1027, 1, 0, 0, 1, 1,
0.2581421, 0.529256, -0.8472422, 1, 0, 0, 1, 1,
0.2586845, 1.592633, -0.5514383, 1, 0, 0, 1, 1,
0.2587339, 1.408301, -0.209429, 1, 0, 0, 1, 1,
0.2588108, 0.4696281, 0.1131712, 0, 0, 0, 1, 1,
0.2620916, 1.441682, 0.166402, 0, 0, 0, 1, 1,
0.2621388, 0.4366491, 0.5860204, 0, 0, 0, 1, 1,
0.2636738, -2.701544, 1.559067, 0, 0, 0, 1, 1,
0.2637456, -0.7384586, 3.962, 0, 0, 0, 1, 1,
0.2649044, -0.7302846, 3.163191, 0, 0, 0, 1, 1,
0.2656752, -0.5841858, 0.3532292, 0, 0, 0, 1, 1,
0.2725896, -0.1141878, 1.218334, 1, 1, 1, 1, 1,
0.2727542, 0.03359928, 1.290888, 1, 1, 1, 1, 1,
0.2731563, 0.2895574, 1.278455, 1, 1, 1, 1, 1,
0.2756115, -1.016517, 3.062958, 1, 1, 1, 1, 1,
0.2773074, 0.1537983, 1.603264, 1, 1, 1, 1, 1,
0.2801394, -0.1310354, 2.450073, 1, 1, 1, 1, 1,
0.286266, 1.359587, 1.723403, 1, 1, 1, 1, 1,
0.2869688, -0.2990983, 0.3330577, 1, 1, 1, 1, 1,
0.2875007, -0.7993069, 0.9703799, 1, 1, 1, 1, 1,
0.290234, -0.4076697, 2.150494, 1, 1, 1, 1, 1,
0.2928828, 0.9229865, -1.534641, 1, 1, 1, 1, 1,
0.2959096, -2.033606, 2.909108, 1, 1, 1, 1, 1,
0.2961421, 2.1144, 0.9255688, 1, 1, 1, 1, 1,
0.29703, -2.388002, 3.151822, 1, 1, 1, 1, 1,
0.2974224, 1.318331, 1.02497, 1, 1, 1, 1, 1,
0.2981119, -0.8209961, 2.776502, 0, 0, 1, 1, 1,
0.299218, 0.2279484, 1.961822, 1, 0, 0, 1, 1,
0.3025241, 0.1470435, 1.990784, 1, 0, 0, 1, 1,
0.3035359, 1.460926, -0.6131682, 1, 0, 0, 1, 1,
0.3078977, -1.641461, 2.761226, 1, 0, 0, 1, 1,
0.3081369, -0.8183755, 3.160743, 1, 0, 0, 1, 1,
0.308344, 0.1002919, 1.378516, 0, 0, 0, 1, 1,
0.3087317, 1.40806, -1.024915, 0, 0, 0, 1, 1,
0.3102212, 1.081894, -0.7547828, 0, 0, 0, 1, 1,
0.3109688, -0.04042482, 1.34453, 0, 0, 0, 1, 1,
0.3137012, -0.5853244, 0.9656186, 0, 0, 0, 1, 1,
0.3204925, 1.064533, -0.9722263, 0, 0, 0, 1, 1,
0.3268544, 1.794116, -0.2593567, 0, 0, 0, 1, 1,
0.3269854, 0.2332935, 1.702186, 1, 1, 1, 1, 1,
0.3281485, -0.9985529, 2.682789, 1, 1, 1, 1, 1,
0.3329148, 0.1739965, 2.085695, 1, 1, 1, 1, 1,
0.3342251, 1.102889, 0.8266369, 1, 1, 1, 1, 1,
0.3345928, -0.04473827, 2.098664, 1, 1, 1, 1, 1,
0.3353497, 0.2996187, 0.6358442, 1, 1, 1, 1, 1,
0.3376901, -1.214248, 2.615915, 1, 1, 1, 1, 1,
0.3397795, -0.7646812, 3.753978, 1, 1, 1, 1, 1,
0.3415758, -0.732401, 0.2239123, 1, 1, 1, 1, 1,
0.343899, -0.7443371, 2.441544, 1, 1, 1, 1, 1,
0.3491683, -0.1135633, 1.439122, 1, 1, 1, 1, 1,
0.3513534, -0.06046468, 4.076437, 1, 1, 1, 1, 1,
0.3538577, -0.01158732, 0.5710068, 1, 1, 1, 1, 1,
0.3577729, -0.1800423, 2.263493, 1, 1, 1, 1, 1,
0.358637, -0.5774279, 1.112096, 1, 1, 1, 1, 1,
0.3590192, 0.623881, 1.091575, 0, 0, 1, 1, 1,
0.3640289, -2.552341, 2.876702, 1, 0, 0, 1, 1,
0.3652444, 0.09039699, 1.050992, 1, 0, 0, 1, 1,
0.3655629, -1.621971, 1.870578, 1, 0, 0, 1, 1,
0.3666021, -1.84481, 2.623286, 1, 0, 0, 1, 1,
0.3675419, -0.5111261, 2.577986, 1, 0, 0, 1, 1,
0.3680659, -0.142651, 2.537596, 0, 0, 0, 1, 1,
0.3696032, -0.4676796, 4.459793, 0, 0, 0, 1, 1,
0.3707741, -0.6836586, 2.427761, 0, 0, 0, 1, 1,
0.3730206, 0.9208184, 0.2126739, 0, 0, 0, 1, 1,
0.3739263, 1.451345, 0.2296669, 0, 0, 0, 1, 1,
0.3765614, -0.662586, 4.176147, 0, 0, 0, 1, 1,
0.3794879, 0.03896273, 2.237349, 0, 0, 0, 1, 1,
0.3797358, -0.292796, -0.7725601, 1, 1, 1, 1, 1,
0.3816386, -0.2639651, 2.891188, 1, 1, 1, 1, 1,
0.3824376, -0.2037525, 3.267001, 1, 1, 1, 1, 1,
0.3834155, 0.7318614, -0.7674614, 1, 1, 1, 1, 1,
0.3869782, -1.157296, 2.441769, 1, 1, 1, 1, 1,
0.3876044, -0.7226574, 3.707306, 1, 1, 1, 1, 1,
0.3882764, 0.4627939, 0.1868733, 1, 1, 1, 1, 1,
0.3893999, 0.1247021, 1.294092, 1, 1, 1, 1, 1,
0.4021709, -0.1881893, 1.559534, 1, 1, 1, 1, 1,
0.4029452, 1.789075, 2.065415, 1, 1, 1, 1, 1,
0.4031917, 2.319915, 0.9938092, 1, 1, 1, 1, 1,
0.4074985, -0.0651504, -0.0006135038, 1, 1, 1, 1, 1,
0.4079262, 0.1079231, 1.243772, 1, 1, 1, 1, 1,
0.4083791, 0.03754277, 1.032753, 1, 1, 1, 1, 1,
0.4138475, 1.45531, 1.185265, 1, 1, 1, 1, 1,
0.4155193, 0.2141842, 0.9880286, 0, 0, 1, 1, 1,
0.416741, 0.3261487, 2.150465, 1, 0, 0, 1, 1,
0.4262399, 1.374013, 0.5464702, 1, 0, 0, 1, 1,
0.4292861, -1.353883, 2.117943, 1, 0, 0, 1, 1,
0.4323135, -0.0552774, 0.6337278, 1, 0, 0, 1, 1,
0.4339048, -1.259173, 3.643641, 1, 0, 0, 1, 1,
0.4368215, -1.532647, 4.499496, 0, 0, 0, 1, 1,
0.4387473, 0.3516003, 1.270532, 0, 0, 0, 1, 1,
0.4400606, -0.897104, 3.342349, 0, 0, 0, 1, 1,
0.4453039, -1.022014, 3.065899, 0, 0, 0, 1, 1,
0.4479477, -2.111914, 4.460652, 0, 0, 0, 1, 1,
0.4489802, 0.1095825, 1.806384, 0, 0, 0, 1, 1,
0.4512109, -0.1025112, 2.320856, 0, 0, 0, 1, 1,
0.4522556, -1.534272, 2.23355, 1, 1, 1, 1, 1,
0.4523688, -0.6594663, 1.924951, 1, 1, 1, 1, 1,
0.4528827, 1.475952, -1.113466, 1, 1, 1, 1, 1,
0.4541172, -0.1955819, 2.241074, 1, 1, 1, 1, 1,
0.4542675, -0.5742883, 0.3301945, 1, 1, 1, 1, 1,
0.459159, 0.3086258, 1.892881, 1, 1, 1, 1, 1,
0.4599722, 0.6153842, -0.603857, 1, 1, 1, 1, 1,
0.4656302, -1.982101, 3.049343, 1, 1, 1, 1, 1,
0.4701253, 0.4963974, -0.3225598, 1, 1, 1, 1, 1,
0.4724823, 1.403759, 1.256949, 1, 1, 1, 1, 1,
0.4731337, -0.7877081, 2.309547, 1, 1, 1, 1, 1,
0.4735278, -1.775276, 4.037323, 1, 1, 1, 1, 1,
0.4761374, -1.466894, 2.851497, 1, 1, 1, 1, 1,
0.4767724, -0.6448612, 3.070293, 1, 1, 1, 1, 1,
0.4793107, -0.6977019, 1.453357, 1, 1, 1, 1, 1,
0.4809745, 0.02930327, 1.359774, 0, 0, 1, 1, 1,
0.4822955, -1.871318, 3.408584, 1, 0, 0, 1, 1,
0.4833037, -0.004340386, 0.550621, 1, 0, 0, 1, 1,
0.4869563, 0.9851387, 1.311841, 1, 0, 0, 1, 1,
0.4872184, -0.3862599, 3.906229, 1, 0, 0, 1, 1,
0.4874923, -0.9215721, 1.826119, 1, 0, 0, 1, 1,
0.4899975, 0.2320652, 0.3685353, 0, 0, 0, 1, 1,
0.4905953, -0.6644006, 3.296045, 0, 0, 0, 1, 1,
0.4928776, 1.309555, -0.9347026, 0, 0, 0, 1, 1,
0.4945767, -1.289818, 1.494674, 0, 0, 0, 1, 1,
0.4946404, 0.2478307, 1.422001, 0, 0, 0, 1, 1,
0.4967116, -0.4069664, 1.516788, 0, 0, 0, 1, 1,
0.4994754, 0.9165288, -0.7091519, 0, 0, 0, 1, 1,
0.50382, 1.883396, 0.1124503, 1, 1, 1, 1, 1,
0.5049341, -0.2528484, 1.581682, 1, 1, 1, 1, 1,
0.5121647, 2.012997, 0.7934221, 1, 1, 1, 1, 1,
0.5137188, -0.4638548, 0.3503562, 1, 1, 1, 1, 1,
0.5146941, 0.8361881, 0.5961646, 1, 1, 1, 1, 1,
0.5239985, 0.1773342, -1.545504, 1, 1, 1, 1, 1,
0.528981, 0.4015883, 0.6412817, 1, 1, 1, 1, 1,
0.5293047, -0.8241343, 1.786994, 1, 1, 1, 1, 1,
0.5318806, -1.05254, 3.659545, 1, 1, 1, 1, 1,
0.5391916, -1.114013, 3.174034, 1, 1, 1, 1, 1,
0.5397379, 0.4302716, 1.487181, 1, 1, 1, 1, 1,
0.5438743, -1.50902, 4.280908, 1, 1, 1, 1, 1,
0.5442672, 0.1693416, 2.370704, 1, 1, 1, 1, 1,
0.5455694, 1.830831, -0.1028953, 1, 1, 1, 1, 1,
0.5465239, 1.150279, -1.856703, 1, 1, 1, 1, 1,
0.5491814, -0.6755686, 2.223191, 0, 0, 1, 1, 1,
0.5527993, 1.768177, -0.5917252, 1, 0, 0, 1, 1,
0.5577279, -0.9216775, 1.895444, 1, 0, 0, 1, 1,
0.5649059, -0.9185932, 1.854144, 1, 0, 0, 1, 1,
0.5733064, -1.599679, 2.069882, 1, 0, 0, 1, 1,
0.574021, 0.2719212, 3.01474, 1, 0, 0, 1, 1,
0.5758781, -0.2538695, 0.4824333, 0, 0, 0, 1, 1,
0.5768516, 0.3126128, 1.73457, 0, 0, 0, 1, 1,
0.5784473, -0.7328838, 2.047863, 0, 0, 0, 1, 1,
0.5853234, -0.935565, 2.160722, 0, 0, 0, 1, 1,
0.5866426, -0.6663883, 1.84492, 0, 0, 0, 1, 1,
0.5928966, 0.5581955, 0.5209181, 0, 0, 0, 1, 1,
0.5953766, -0.5916132, 1.394511, 0, 0, 0, 1, 1,
0.5956455, 1.525113, 1.004616, 1, 1, 1, 1, 1,
0.596428, -1.167561, 2.691939, 1, 1, 1, 1, 1,
0.5990328, -1.017803, 2.835434, 1, 1, 1, 1, 1,
0.5995975, -0.9594826, 2.270355, 1, 1, 1, 1, 1,
0.6000522, -0.6025174, 2.202671, 1, 1, 1, 1, 1,
0.6010169, 0.06878898, 1.12522, 1, 1, 1, 1, 1,
0.6053339, -1.770099, 3.052363, 1, 1, 1, 1, 1,
0.6059561, -1.135753, 3.420538, 1, 1, 1, 1, 1,
0.606447, 0.7789379, 0.251106, 1, 1, 1, 1, 1,
0.6108199, 0.3626549, 0.7065837, 1, 1, 1, 1, 1,
0.6129679, -0.9183642, 3.639287, 1, 1, 1, 1, 1,
0.6151686, -0.7246027, 3.094574, 1, 1, 1, 1, 1,
0.6160579, -1.529916, 2.369249, 1, 1, 1, 1, 1,
0.616666, 1.167932, -0.247245, 1, 1, 1, 1, 1,
0.6246629, 0.1987418, 1.94819, 1, 1, 1, 1, 1,
0.6252021, 1.507571, 0.04927624, 0, 0, 1, 1, 1,
0.6297426, -0.7314342, 2.966893, 1, 0, 0, 1, 1,
0.6345857, -0.1994014, 2.760036, 1, 0, 0, 1, 1,
0.6419851, -0.2243275, 2.026122, 1, 0, 0, 1, 1,
0.6439875, 0.2654224, 1.959922, 1, 0, 0, 1, 1,
0.6452279, 0.5960384, 0.9629954, 1, 0, 0, 1, 1,
0.6461283, 0.4385394, 1.262886, 0, 0, 0, 1, 1,
0.653093, -0.7142251, 3.377642, 0, 0, 0, 1, 1,
0.6556811, -0.6298292, 3.45711, 0, 0, 0, 1, 1,
0.6562407, -0.8628083, 3.227272, 0, 0, 0, 1, 1,
0.6609568, -1.043416, 0.9089165, 0, 0, 0, 1, 1,
0.6626021, -0.5716878, 4.359057, 0, 0, 0, 1, 1,
0.662619, 0.1180382, 2.779134, 0, 0, 0, 1, 1,
0.6626624, -0.4979539, 1.628333, 1, 1, 1, 1, 1,
0.6634269, -0.8857687, 0.4228311, 1, 1, 1, 1, 1,
0.668021, 1.463649, -1.35901, 1, 1, 1, 1, 1,
0.6744641, 1.818814, 1.08269, 1, 1, 1, 1, 1,
0.6829277, -0.6778422, 1.534981, 1, 1, 1, 1, 1,
0.6862733, -0.05456404, 0.3949546, 1, 1, 1, 1, 1,
0.6895252, -0.7036518, 1.811619, 1, 1, 1, 1, 1,
0.6927326, -0.3766266, 0.7472069, 1, 1, 1, 1, 1,
0.6975024, -0.4413648, 1.905034, 1, 1, 1, 1, 1,
0.6992067, 1.87815, 0.7604864, 1, 1, 1, 1, 1,
0.6999491, -1.020737, 1.92751, 1, 1, 1, 1, 1,
0.7035863, 1.552899, -1.471001, 1, 1, 1, 1, 1,
0.7046846, 0.6068349, 1.039242, 1, 1, 1, 1, 1,
0.7087203, -1.295839, 2.677382, 1, 1, 1, 1, 1,
0.7133964, 0.08489916, 1.599746, 1, 1, 1, 1, 1,
0.717707, 0.9158189, 1.634443, 0, 0, 1, 1, 1,
0.7191882, 0.6477078, -0.9981231, 1, 0, 0, 1, 1,
0.7241231, 1.78455, -1.128968, 1, 0, 0, 1, 1,
0.7267691, 0.5618752, 1.519207, 1, 0, 0, 1, 1,
0.7313929, -0.5492522, 3.064426, 1, 0, 0, 1, 1,
0.7328801, 1.731316, 2.215961, 1, 0, 0, 1, 1,
0.7529522, 0.533103, 1.299404, 0, 0, 0, 1, 1,
0.7565957, -1.722267, 2.051708, 0, 0, 0, 1, 1,
0.757099, 0.4645176, 2.300339, 0, 0, 0, 1, 1,
0.7606732, -0.05695099, 3.153971, 0, 0, 0, 1, 1,
0.7654385, 1.133857, 1.608994, 0, 0, 0, 1, 1,
0.7693901, 0.4940774, 1.528651, 0, 0, 0, 1, 1,
0.7758902, 0.2311585, 1.263472, 0, 0, 0, 1, 1,
0.7788594, 2.80138, 0.3395844, 1, 1, 1, 1, 1,
0.7797236, -0.1278863, 0.8603413, 1, 1, 1, 1, 1,
0.7829222, 0.2697928, 1.656784, 1, 1, 1, 1, 1,
0.7887391, -0.1307796, 2.917144, 1, 1, 1, 1, 1,
0.792096, 1.363992, 0.7292868, 1, 1, 1, 1, 1,
0.7931662, 0.7877869, 3.327219, 1, 1, 1, 1, 1,
0.7936538, 0.1274794, 1.94868, 1, 1, 1, 1, 1,
0.7938849, 0.4199463, 0.7853848, 1, 1, 1, 1, 1,
0.7952992, -0.2442229, 2.504013, 1, 1, 1, 1, 1,
0.7967587, 0.06842326, 1.530412, 1, 1, 1, 1, 1,
0.7976039, -1.566672, 4.999013, 1, 1, 1, 1, 1,
0.8020697, 0.364099, 2.019042, 1, 1, 1, 1, 1,
0.8073142, -0.7288142, 1.768103, 1, 1, 1, 1, 1,
0.8106717, 2.284421, -0.2246176, 1, 1, 1, 1, 1,
0.8145661, -1.035001, 0.9139057, 1, 1, 1, 1, 1,
0.8234707, 0.3040411, -0.4028497, 0, 0, 1, 1, 1,
0.8295473, -1.266163, 2.65822, 1, 0, 0, 1, 1,
0.8297303, -1.306697, 2.634376, 1, 0, 0, 1, 1,
0.8312482, -1.168439, 3.765689, 1, 0, 0, 1, 1,
0.8333662, 1.103009, 1.467637, 1, 0, 0, 1, 1,
0.8353218, 0.7857147, 0.5871851, 1, 0, 0, 1, 1,
0.835722, -0.5533069, 2.696584, 0, 0, 0, 1, 1,
0.8358721, -0.6055859, 3.41484, 0, 0, 0, 1, 1,
0.841171, -0.05891498, 0.2348818, 0, 0, 0, 1, 1,
0.8454808, -1.175426, 1.751863, 0, 0, 0, 1, 1,
0.8464584, 1.299664, -0.6610963, 0, 0, 0, 1, 1,
0.8553888, 0.1224675, 1.340298, 0, 0, 0, 1, 1,
0.8599679, 0.3623714, 2.228616, 0, 0, 0, 1, 1,
0.8616123, 0.1362346, -0.01634718, 1, 1, 1, 1, 1,
0.8670799, -0.6996671, 2.908273, 1, 1, 1, 1, 1,
0.8698086, -0.068959, 0.6737381, 1, 1, 1, 1, 1,
0.870793, -2.623746, 3.199191, 1, 1, 1, 1, 1,
0.871863, 0.1600208, 1.576626, 1, 1, 1, 1, 1,
0.881605, 0.1888608, 2.650287, 1, 1, 1, 1, 1,
0.8821043, 1.058177, 1.251762, 1, 1, 1, 1, 1,
0.8850704, -0.8788188, 0.9065778, 1, 1, 1, 1, 1,
0.8925871, 0.4101886, 0.8287203, 1, 1, 1, 1, 1,
0.8941727, 0.0009425234, 2.791226, 1, 1, 1, 1, 1,
0.8966151, -1.090508, 1.943959, 1, 1, 1, 1, 1,
0.9034495, -0.6568513, 0.705047, 1, 1, 1, 1, 1,
0.9044415, 0.1651129, 1.744749, 1, 1, 1, 1, 1,
0.906786, 1.069772, 0.2209342, 1, 1, 1, 1, 1,
0.9085743, 0.5695682, 0.5692163, 1, 1, 1, 1, 1,
0.9479006, 0.7653295, 0.4290297, 0, 0, 1, 1, 1,
0.9554823, 0.3048599, 0.5210946, 1, 0, 0, 1, 1,
0.958412, -0.7617236, 2.878989, 1, 0, 0, 1, 1,
0.9691713, -0.2461154, 1.802998, 1, 0, 0, 1, 1,
0.9703194, 0.2289435, -0.01676974, 1, 0, 0, 1, 1,
0.9751129, 0.4895539, 1.268512, 1, 0, 0, 1, 1,
0.9765869, -1.033942, 1.999848, 0, 0, 0, 1, 1,
0.9787737, 0.2133665, 1.996231, 0, 0, 0, 1, 1,
0.9880303, -0.8591624, 2.78277, 0, 0, 0, 1, 1,
0.9978424, -0.1977814, 1.169925, 0, 0, 0, 1, 1,
1.001379, 0.03172735, 1.976188, 0, 0, 0, 1, 1,
1.003541, 1.657588, 0.5693977, 0, 0, 0, 1, 1,
1.005385, 2.294665, 2.889692, 0, 0, 0, 1, 1,
1.010394, -0.07343028, 1.428587, 1, 1, 1, 1, 1,
1.014256, 0.5830299, -0.3891102, 1, 1, 1, 1, 1,
1.01955, 0.7013007, 0.8365117, 1, 1, 1, 1, 1,
1.03024, -0.009165233, 0.6643175, 1, 1, 1, 1, 1,
1.031752, 0.5419617, 0.7634649, 1, 1, 1, 1, 1,
1.032273, 2.192274, -0.6072069, 1, 1, 1, 1, 1,
1.034677, -0.908791, 2.852235, 1, 1, 1, 1, 1,
1.045007, -0.6347409, 1.962984, 1, 1, 1, 1, 1,
1.045546, -1.835465, 1.658266, 1, 1, 1, 1, 1,
1.05445, 0.7728948, 0.01699895, 1, 1, 1, 1, 1,
1.056311, -0.4234746, 0.3448566, 1, 1, 1, 1, 1,
1.063819, -1.547903, 2.325256, 1, 1, 1, 1, 1,
1.071244, -0.9062123, 1.379591, 1, 1, 1, 1, 1,
1.084577, 0.3441169, 1.714378, 1, 1, 1, 1, 1,
1.104346, 1.683586, 2.529513, 1, 1, 1, 1, 1,
1.107018, 1.678296, 0.6436823, 0, 0, 1, 1, 1,
1.107945, 0.1142107, 0.790626, 1, 0, 0, 1, 1,
1.108541, -1.242302, 2.93113, 1, 0, 0, 1, 1,
1.113986, 1.679504, 1.317141, 1, 0, 0, 1, 1,
1.127495, -1.096747, 2.909917, 1, 0, 0, 1, 1,
1.130875, 0.7984281, 0.9251288, 1, 0, 0, 1, 1,
1.133541, 0.8975942, 2.036971, 0, 0, 0, 1, 1,
1.140681, -1.470274, 3.841282, 0, 0, 0, 1, 1,
1.141666, -1.885527, 1.603116, 0, 0, 0, 1, 1,
1.151474, 0.06070511, 1.442604, 0, 0, 0, 1, 1,
1.155176, -1.431381, 2.302786, 0, 0, 0, 1, 1,
1.159374, -1.045738, 2.562168, 0, 0, 0, 1, 1,
1.182068, 0.8632275, 1.487275, 0, 0, 0, 1, 1,
1.190851, 0.01132497, 1.296927, 1, 1, 1, 1, 1,
1.191665, -0.9719265, 0.4079862, 1, 1, 1, 1, 1,
1.195609, -0.6235332, 1.446055, 1, 1, 1, 1, 1,
1.196449, 0.2168657, 0.7456331, 1, 1, 1, 1, 1,
1.198729, 0.5386168, 1.877658, 1, 1, 1, 1, 1,
1.20428, 1.074585, -1.533502, 1, 1, 1, 1, 1,
1.210695, -1.350673, 2.536156, 1, 1, 1, 1, 1,
1.218851, 0.1710618, 2.754004, 1, 1, 1, 1, 1,
1.219111, -1.664517, 1.540975, 1, 1, 1, 1, 1,
1.219479, -0.8035459, 2.700757, 1, 1, 1, 1, 1,
1.220983, -0.8846059, 2.94505, 1, 1, 1, 1, 1,
1.233761, 1.07172, 1.543567, 1, 1, 1, 1, 1,
1.239311, 0.6783193, 1.094182, 1, 1, 1, 1, 1,
1.241145, -2.510243, 2.460625, 1, 1, 1, 1, 1,
1.250145, 0.02056542, 1.598183, 1, 1, 1, 1, 1,
1.270131, -0.425157, 1.023674, 0, 0, 1, 1, 1,
1.279058, -0.340285, 3.341059, 1, 0, 0, 1, 1,
1.280512, -0.7906956, 3.252393, 1, 0, 0, 1, 1,
1.285153, 0.1341329, 0.0720631, 1, 0, 0, 1, 1,
1.287289, -1.081742, 1.583615, 1, 0, 0, 1, 1,
1.290546, -0.4241605, 1.83832, 1, 0, 0, 1, 1,
1.293229, 0.1851951, 1.115257, 0, 0, 0, 1, 1,
1.295685, -1.448567, 2.700204, 0, 0, 0, 1, 1,
1.311056, -0.0726509, 2.383997, 0, 0, 0, 1, 1,
1.318253, -1.078064, 2.866106, 0, 0, 0, 1, 1,
1.319571, -1.967119, 3.524688, 0, 0, 0, 1, 1,
1.321576, -0.2769658, 2.258718, 0, 0, 0, 1, 1,
1.335309, 0.7304713, 1.900771, 0, 0, 0, 1, 1,
1.339669, 0.05386417, 1.030217, 1, 1, 1, 1, 1,
1.347723, 1.122371, 0.2902578, 1, 1, 1, 1, 1,
1.36258, 1.074672, 1.892458, 1, 1, 1, 1, 1,
1.364715, 1.756518, 0.3476295, 1, 1, 1, 1, 1,
1.365467, 0.9742187, 2.198867, 1, 1, 1, 1, 1,
1.36942, 1.767416, 0.9610562, 1, 1, 1, 1, 1,
1.405535, 1.996004, -1.279873, 1, 1, 1, 1, 1,
1.415182, -0.1636741, 1.287399, 1, 1, 1, 1, 1,
1.426048, -0.5986133, 1.517038, 1, 1, 1, 1, 1,
1.445793, -0.9548324, 1.806189, 1, 1, 1, 1, 1,
1.454754, -1.485644, 1.227523, 1, 1, 1, 1, 1,
1.459162, -1.014853, 1.579745, 1, 1, 1, 1, 1,
1.462626, 1.144005, 0.9594982, 1, 1, 1, 1, 1,
1.471056, -0.4570015, 2.222536, 1, 1, 1, 1, 1,
1.473548, 1.94559, 0.06203229, 1, 1, 1, 1, 1,
1.473981, -0.1036974, 1.226479, 0, 0, 1, 1, 1,
1.474251, 1.855205, 0.8139245, 1, 0, 0, 1, 1,
1.478778, 2.222341, 0.4266288, 1, 0, 0, 1, 1,
1.479879, 0.2176377, 1.23454, 1, 0, 0, 1, 1,
1.488282, -0.9072853, 3.298201, 1, 0, 0, 1, 1,
1.494834, -0.005956832, 1.789401, 1, 0, 0, 1, 1,
1.499575, 1.07883, -1.082129, 0, 0, 0, 1, 1,
1.508512, 0.7299137, 0.3825424, 0, 0, 0, 1, 1,
1.509104, -0.7976898, 1.062213, 0, 0, 0, 1, 1,
1.517114, -1.61726, 2.209301, 0, 0, 0, 1, 1,
1.521145, 0.262659, 1.96759, 0, 0, 0, 1, 1,
1.524433, 0.6926778, -0.2275841, 0, 0, 0, 1, 1,
1.528035, 0.9366916, 1.389905, 0, 0, 0, 1, 1,
1.528232, 1.183473, 0.7543733, 1, 1, 1, 1, 1,
1.536933, 0.3996286, 0.9862689, 1, 1, 1, 1, 1,
1.540813, -0.9443772, 1.317974, 1, 1, 1, 1, 1,
1.555944, 1.334776, 0.4401051, 1, 1, 1, 1, 1,
1.558718, -0.3243277, 2.040282, 1, 1, 1, 1, 1,
1.572898, -1.438681, 1.454382, 1, 1, 1, 1, 1,
1.576588, 0.9015177, -1.037056, 1, 1, 1, 1, 1,
1.594213, -1.732436, 2.727783, 1, 1, 1, 1, 1,
1.605373, 1.811351, -0.1716383, 1, 1, 1, 1, 1,
1.611913, -0.317103, 2.281227, 1, 1, 1, 1, 1,
1.622506, -0.1414597, 3.031515, 1, 1, 1, 1, 1,
1.640402, 0.4079574, 3.262837, 1, 1, 1, 1, 1,
1.64048, 0.002352909, 1.4677, 1, 1, 1, 1, 1,
1.640912, 0.2215471, 1.412344, 1, 1, 1, 1, 1,
1.66478, -1.043394, 2.753789, 1, 1, 1, 1, 1,
1.688352, -2.269461, 3.780275, 0, 0, 1, 1, 1,
1.697694, 0.02375599, 1.589116, 1, 0, 0, 1, 1,
1.702656, -0.7666295, 0.3028935, 1, 0, 0, 1, 1,
1.704507, 1.358683, 0.5313883, 1, 0, 0, 1, 1,
1.70499, 0.2859389, 1.86012, 1, 0, 0, 1, 1,
1.714413, -0.2764617, 0.3078697, 1, 0, 0, 1, 1,
1.730776, -0.877682, 3.314605, 0, 0, 0, 1, 1,
1.745574, -0.3184854, 3.514499, 0, 0, 0, 1, 1,
1.750434, 0.2029788, 0.7130392, 0, 0, 0, 1, 1,
1.761959, -0.918256, 1.738292, 0, 0, 0, 1, 1,
1.778789, 0.2826765, 0.09899467, 0, 0, 0, 1, 1,
1.781603, 0.6071436, 0.5417016, 0, 0, 0, 1, 1,
1.788296, -0.3418497, 3.974203, 0, 0, 0, 1, 1,
1.810364, 0.09630663, 1.656188, 1, 1, 1, 1, 1,
1.831629, 0.5225688, 0.9615503, 1, 1, 1, 1, 1,
1.833511, -1.896004, 2.89239, 1, 1, 1, 1, 1,
1.846611, 0.6008898, 0.4991094, 1, 1, 1, 1, 1,
1.847078, 1.06233, 1.983409, 1, 1, 1, 1, 1,
1.862083, 0.9662424, 1.381132, 1, 1, 1, 1, 1,
1.873853, 0.9282239, 0.01759518, 1, 1, 1, 1, 1,
1.890943, -0.3033991, 1.473788, 1, 1, 1, 1, 1,
1.916133, 0.9670386, 2.062779, 1, 1, 1, 1, 1,
1.91825, -0.189383, 1.322503, 1, 1, 1, 1, 1,
1.926783, -0.4332993, 2.774544, 1, 1, 1, 1, 1,
1.939484, -2.125945, 1.483731, 1, 1, 1, 1, 1,
1.950381, -1.221412, 3.324586, 1, 1, 1, 1, 1,
1.953662, -1.740362, 0.9742144, 1, 1, 1, 1, 1,
1.981451, 0.6825225, 1.879773, 1, 1, 1, 1, 1,
1.984061, -1.216305, 0.8791045, 0, 0, 1, 1, 1,
1.991187, -2.461479, 2.437906, 1, 0, 0, 1, 1,
1.9981, 0.9588109, 0.04901284, 1, 0, 0, 1, 1,
2.031091, 0.6403799, 1.635799, 1, 0, 0, 1, 1,
2.038857, -0.5552787, 1.578533, 1, 0, 0, 1, 1,
2.047496, 1.053077, 0.8317548, 1, 0, 0, 1, 1,
2.112821, -0.1440878, 0.7187245, 0, 0, 0, 1, 1,
2.112988, 1.888162, 2.543903, 0, 0, 0, 1, 1,
2.122182, 0.925315, 2.318433, 0, 0, 0, 1, 1,
2.134477, -0.241055, 0.5484021, 0, 0, 0, 1, 1,
2.159626, 1.508387, -0.03292852, 0, 0, 0, 1, 1,
2.226058, 0.2716662, 0.4929344, 0, 0, 0, 1, 1,
2.240933, -1.265904, 0.8072669, 0, 0, 0, 1, 1,
2.266027, 0.3078565, 0.5341313, 1, 1, 1, 1, 1,
2.340396, -0.6765473, 0.7364898, 1, 1, 1, 1, 1,
2.367461, -0.5722432, 0.5457425, 1, 1, 1, 1, 1,
2.43719, 0.1276495, 1.083312, 1, 1, 1, 1, 1,
2.811111, 0.2787909, 3.239534, 1, 1, 1, 1, 1,
2.910523, -1.381983, -0.0973108, 1, 1, 1, 1, 1,
3.038624, -0.9846136, 1.530055, 1, 1, 1, 1, 1
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
var radius = 9.551038;
var distance = 33.54762;
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
mvMatrix.translate( 0.1775475, -0.3862451, 0.3190091 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.54762);
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
