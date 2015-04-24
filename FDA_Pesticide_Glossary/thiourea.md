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
-3.093518, -0.323231, -0.7236404, 1, 0, 0, 1,
-3.092501, -0.9123083, -3.837786, 1, 0.007843138, 0, 1,
-2.869306, 1.221985, -2.116041, 1, 0.01176471, 0, 1,
-2.838791, -0.7050921, -1.460148, 1, 0.01960784, 0, 1,
-2.782479, -0.01431025, -1.996165, 1, 0.02352941, 0, 1,
-2.625036, 0.6983088, -1.208406, 1, 0.03137255, 0, 1,
-2.620761, -1.350886, -3.372579, 1, 0.03529412, 0, 1,
-2.612591, 0.3206567, -1.402825, 1, 0.04313726, 0, 1,
-2.605239, -0.6940619, -1.474525, 1, 0.04705882, 0, 1,
-2.495976, 0.4863583, -1.325111, 1, 0.05490196, 0, 1,
-2.478326, -1.970788, -1.840002, 1, 0.05882353, 0, 1,
-2.453744, -0.6693162, -2.129323, 1, 0.06666667, 0, 1,
-2.437615, -1.403826, -1.972541, 1, 0.07058824, 0, 1,
-2.385211, -0.5520507, 1.067652, 1, 0.07843138, 0, 1,
-2.359557, -1.416735, -3.060964, 1, 0.08235294, 0, 1,
-2.356068, -0.4866914, -1.443355, 1, 0.09019608, 0, 1,
-2.303045, -0.3399418, -1.750964, 1, 0.09411765, 0, 1,
-2.270393, 0.6380754, -1.253365, 1, 0.1019608, 0, 1,
-2.259465, 0.5795592, 1.339158, 1, 0.1098039, 0, 1,
-2.239853, -0.3329693, -1.422964, 1, 0.1137255, 0, 1,
-2.225519, -1.288323, -1.220696, 1, 0.1215686, 0, 1,
-2.22401, 1.397168, 0.1253319, 1, 0.1254902, 0, 1,
-2.20326, 0.3143705, -1.533707, 1, 0.1333333, 0, 1,
-2.201778, 2.314967, -0.8127372, 1, 0.1372549, 0, 1,
-2.19636, 0.2048765, -1.261233, 1, 0.145098, 0, 1,
-2.16007, -1.020594, -2.751168, 1, 0.1490196, 0, 1,
-2.119713, 0.8326731, 1.203465, 1, 0.1568628, 0, 1,
-2.106802, 0.04554705, -2.556432, 1, 0.1607843, 0, 1,
-2.100873, 0.7594486, -1.150852, 1, 0.1686275, 0, 1,
-2.099971, -0.195653, -0.1478853, 1, 0.172549, 0, 1,
-2.097348, 0.9823347, -0.7400371, 1, 0.1803922, 0, 1,
-2.090071, -1.256056, -2.793097, 1, 0.1843137, 0, 1,
-2.069004, -0.7196749, -1.615028, 1, 0.1921569, 0, 1,
-2.038723, 0.2235688, -2.894076, 1, 0.1960784, 0, 1,
-2.026571, 1.023584, -1.784789, 1, 0.2039216, 0, 1,
-1.964931, 0.7978848, -1.142927, 1, 0.2117647, 0, 1,
-1.938796, 0.2128296, -2.28571, 1, 0.2156863, 0, 1,
-1.926571, -1.196386, -2.80108, 1, 0.2235294, 0, 1,
-1.923021, -0.07984293, -1.10723, 1, 0.227451, 0, 1,
-1.918768, 0.04148826, -1.353792, 1, 0.2352941, 0, 1,
-1.893551, 0.1330506, -2.549678, 1, 0.2392157, 0, 1,
-1.892701, 1.00216, -0.1505747, 1, 0.2470588, 0, 1,
-1.880531, 0.8904567, -2.240102, 1, 0.2509804, 0, 1,
-1.877009, -0.9679939, -4.067719, 1, 0.2588235, 0, 1,
-1.860161, 0.09292895, -1.343625, 1, 0.2627451, 0, 1,
-1.838169, -0.624955, -1.560011, 1, 0.2705882, 0, 1,
-1.837882, -0.9463917, -1.770867, 1, 0.2745098, 0, 1,
-1.814196, -1.186825, -0.8733836, 1, 0.282353, 0, 1,
-1.794126, -0.9382012, -1.567809, 1, 0.2862745, 0, 1,
-1.788978, 0.4226158, -2.288319, 1, 0.2941177, 0, 1,
-1.787597, -0.5877244, -3.481744, 1, 0.3019608, 0, 1,
-1.766244, 0.2903071, -1.095727, 1, 0.3058824, 0, 1,
-1.759527, 0.2134532, -0.3365899, 1, 0.3137255, 0, 1,
-1.745103, 0.2361038, -1.862805, 1, 0.3176471, 0, 1,
-1.73737, 0.6555627, -1.542764, 1, 0.3254902, 0, 1,
-1.727758, -0.3312382, -0.4482845, 1, 0.3294118, 0, 1,
-1.717331, 0.2959903, -0.2892979, 1, 0.3372549, 0, 1,
-1.710558, -0.6236446, -3.389266, 1, 0.3411765, 0, 1,
-1.707106, 0.3759361, -2.256422, 1, 0.3490196, 0, 1,
-1.706426, -1.861677, -2.694654, 1, 0.3529412, 0, 1,
-1.705819, -1.807771, -2.446394, 1, 0.3607843, 0, 1,
-1.702361, -0.00871488, -1.787252, 1, 0.3647059, 0, 1,
-1.685059, -0.7491696, -2.614885, 1, 0.372549, 0, 1,
-1.681638, 1.223176, -1.953998, 1, 0.3764706, 0, 1,
-1.679218, -0.000898702, -1.044551, 1, 0.3843137, 0, 1,
-1.646385, -1.752926, -3.514358, 1, 0.3882353, 0, 1,
-1.635427, 0.940008, 1.094756, 1, 0.3960784, 0, 1,
-1.631176, 0.2258277, -1.778634, 1, 0.4039216, 0, 1,
-1.629459, 0.0255499, -2.169551, 1, 0.4078431, 0, 1,
-1.629184, 0.7485938, -3.767297, 1, 0.4156863, 0, 1,
-1.628093, 0.9824558, -1.086699, 1, 0.4196078, 0, 1,
-1.620999, 1.427094, -0.9522275, 1, 0.427451, 0, 1,
-1.590363, 0.2571392, -1.241671, 1, 0.4313726, 0, 1,
-1.587308, -1.447852, -1.286585, 1, 0.4392157, 0, 1,
-1.583827, -0.8289943, -1.44165, 1, 0.4431373, 0, 1,
-1.57271, -0.2408948, -1.897653, 1, 0.4509804, 0, 1,
-1.572131, 0.2842036, -2.646164, 1, 0.454902, 0, 1,
-1.558896, 0.2699932, -2.747721, 1, 0.4627451, 0, 1,
-1.548231, -0.07663728, -3.985005, 1, 0.4666667, 0, 1,
-1.547766, -2.050196, -1.529005, 1, 0.4745098, 0, 1,
-1.547644, 0.7004768, -1.442283, 1, 0.4784314, 0, 1,
-1.54216, -0.2533624, -3.151825, 1, 0.4862745, 0, 1,
-1.537396, 0.6661612, 0.6081133, 1, 0.4901961, 0, 1,
-1.528093, 1.613454, 1.074589, 1, 0.4980392, 0, 1,
-1.516745, -0.5168229, -2.814851, 1, 0.5058824, 0, 1,
-1.493392, -0.7906825, -3.779878, 1, 0.509804, 0, 1,
-1.487458, -0.5186282, -2.52838, 1, 0.5176471, 0, 1,
-1.485921, -0.2368927, 0.4564904, 1, 0.5215687, 0, 1,
-1.478615, -1.038801, -1.811822, 1, 0.5294118, 0, 1,
-1.476404, 1.492144, -0.1547488, 1, 0.5333334, 0, 1,
-1.473387, -1.540087, -1.671572, 1, 0.5411765, 0, 1,
-1.468082, -0.4516175, -1.895546, 1, 0.5450981, 0, 1,
-1.461861, -0.7102977, -0.7179617, 1, 0.5529412, 0, 1,
-1.461552, -1.055986, -0.9235893, 1, 0.5568628, 0, 1,
-1.460876, -0.6844541, -2.696918, 1, 0.5647059, 0, 1,
-1.459427, 1.104841, -1.059036, 1, 0.5686275, 0, 1,
-1.454555, 0.3889362, -2.28972, 1, 0.5764706, 0, 1,
-1.44535, -0.5709704, -1.56744, 1, 0.5803922, 0, 1,
-1.4411, -0.007217141, -2.184267, 1, 0.5882353, 0, 1,
-1.438994, 1.188414, -0.2338494, 1, 0.5921569, 0, 1,
-1.436649, -0.5749621, -2.025904, 1, 0.6, 0, 1,
-1.432473, 1.290809, -1.845747, 1, 0.6078432, 0, 1,
-1.423515, -0.7317164, -1.594701, 1, 0.6117647, 0, 1,
-1.419845, 0.5253723, -0.6907508, 1, 0.6196079, 0, 1,
-1.415287, -1.634178, -3.736127, 1, 0.6235294, 0, 1,
-1.412742, 0.9768325, -3.684748, 1, 0.6313726, 0, 1,
-1.406523, 0.969025, -1.033218, 1, 0.6352941, 0, 1,
-1.40455, -0.8593997, -1.959333, 1, 0.6431373, 0, 1,
-1.4018, -0.3364697, -1.834986, 1, 0.6470588, 0, 1,
-1.395265, 1.175065, -0.9105585, 1, 0.654902, 0, 1,
-1.384693, 0.1329762, -1.45503, 1, 0.6588235, 0, 1,
-1.381243, 1.376012, -0.8824459, 1, 0.6666667, 0, 1,
-1.379952, 0.895667, -0.5392947, 1, 0.6705883, 0, 1,
-1.378222, -0.1909348, -1.670368, 1, 0.6784314, 0, 1,
-1.370765, 0.1605717, -0.3914253, 1, 0.682353, 0, 1,
-1.346269, 0.6441393, -1.995633, 1, 0.6901961, 0, 1,
-1.328502, -1.610015, -3.1843, 1, 0.6941177, 0, 1,
-1.324242, 1.616331, -0.9111444, 1, 0.7019608, 0, 1,
-1.323671, 0.4054721, -1.32377, 1, 0.7098039, 0, 1,
-1.321371, -1.14569, -1.81089, 1, 0.7137255, 0, 1,
-1.315751, -1.59234, -3.4459, 1, 0.7215686, 0, 1,
-1.309209, 0.8007236, -1.277482, 1, 0.7254902, 0, 1,
-1.294678, 1.027903, -0.8623744, 1, 0.7333333, 0, 1,
-1.269533, -0.5621414, -2.748179, 1, 0.7372549, 0, 1,
-1.257012, 1.565668, 0.03921175, 1, 0.7450981, 0, 1,
-1.250068, -1.072586, -2.087743, 1, 0.7490196, 0, 1,
-1.242216, 0.3176062, -2.049486, 1, 0.7568628, 0, 1,
-1.241285, 1.817452, 2.397765, 1, 0.7607843, 0, 1,
-1.235121, -0.4913825, -1.565126, 1, 0.7686275, 0, 1,
-1.233659, 0.08313182, -3.679916, 1, 0.772549, 0, 1,
-1.219797, -2.133608, -2.408986, 1, 0.7803922, 0, 1,
-1.214345, 0.07506203, -1.591599, 1, 0.7843137, 0, 1,
-1.212696, -1.419341, -1.089307, 1, 0.7921569, 0, 1,
-1.199917, 1.834891, -2.341797, 1, 0.7960784, 0, 1,
-1.196831, 0.284359, -2.528079, 1, 0.8039216, 0, 1,
-1.190198, -0.9946732, -2.328847, 1, 0.8117647, 0, 1,
-1.139263, 1.623309, -1.218672, 1, 0.8156863, 0, 1,
-1.12694, -1.294379, -1.11018, 1, 0.8235294, 0, 1,
-1.125234, -0.9275394, -3.707683, 1, 0.827451, 0, 1,
-1.121497, 0.5201094, -0.7721688, 1, 0.8352941, 0, 1,
-1.119656, -0.5555422, -2.354598, 1, 0.8392157, 0, 1,
-1.114863, -1.23541, -3.60713, 1, 0.8470588, 0, 1,
-1.111033, -0.2222556, -1.862514, 1, 0.8509804, 0, 1,
-1.109906, 0.2395468, -0.3501258, 1, 0.8588235, 0, 1,
-1.109871, 0.6215227, -2.428865, 1, 0.8627451, 0, 1,
-1.109675, -0.1482978, -0.3998804, 1, 0.8705882, 0, 1,
-1.108672, 0.03590716, -2.085482, 1, 0.8745098, 0, 1,
-1.105986, -2.624579, -3.536185, 1, 0.8823529, 0, 1,
-1.10491, -0.7912723, -2.447388, 1, 0.8862745, 0, 1,
-1.095994, 0.6773753, -4.576383, 1, 0.8941177, 0, 1,
-1.095397, 0.5323629, -2.082631, 1, 0.8980392, 0, 1,
-1.092198, -0.8041075, -1.3271, 1, 0.9058824, 0, 1,
-1.091617, 0.5642282, 0.1822263, 1, 0.9137255, 0, 1,
-1.091293, -0.9024383, -1.275388, 1, 0.9176471, 0, 1,
-1.089749, -2.620667, -2.940192, 1, 0.9254902, 0, 1,
-1.085704, -0.9918823, -1.146508, 1, 0.9294118, 0, 1,
-1.079232, -0.4635258, -2.112808, 1, 0.9372549, 0, 1,
-1.074102, -0.7523516, -2.544985, 1, 0.9411765, 0, 1,
-1.071558, -0.1587051, -2.296788, 1, 0.9490196, 0, 1,
-1.068356, -2.559173, -2.398562, 1, 0.9529412, 0, 1,
-1.063982, 1.702698, 0.2064184, 1, 0.9607843, 0, 1,
-1.048065, 0.8682234, -0.9289355, 1, 0.9647059, 0, 1,
-1.045032, 0.7774, -0.8171805, 1, 0.972549, 0, 1,
-1.033039, 0.5628057, -1.100266, 1, 0.9764706, 0, 1,
-1.026932, -1.036305, -3.120967, 1, 0.9843137, 0, 1,
-1.021461, -1.1489, -2.634107, 1, 0.9882353, 0, 1,
-1.013614, 1.361205, -0.6507667, 1, 0.9960784, 0, 1,
-1.005367, -1.409906, -3.838514, 0.9960784, 1, 0, 1,
-1.004094, -0.08011787, -1.184886, 0.9921569, 1, 0, 1,
-0.998532, 0.3235403, -2.717243, 0.9843137, 1, 0, 1,
-0.9933621, -0.2767392, -1.495004, 0.9803922, 1, 0, 1,
-0.9829178, 0.9726382, -0.2587945, 0.972549, 1, 0, 1,
-0.9796623, 0.0261729, -1.849787, 0.9686275, 1, 0, 1,
-0.9774003, 0.1013714, -2.575864, 0.9607843, 1, 0, 1,
-0.9739779, -1.041074, -2.755811, 0.9568627, 1, 0, 1,
-0.9679414, -1.095054, -1.969233, 0.9490196, 1, 0, 1,
-0.9576781, 1.383963, -0.7871028, 0.945098, 1, 0, 1,
-0.9507164, -1.376539, -1.849408, 0.9372549, 1, 0, 1,
-0.9492676, 0.7057768, -1.41655, 0.9333333, 1, 0, 1,
-0.947854, -1.27753, -2.957821, 0.9254902, 1, 0, 1,
-0.9399188, 0.6512489, -0.1211997, 0.9215686, 1, 0, 1,
-0.9364719, -1.169063, -4.066139, 0.9137255, 1, 0, 1,
-0.9331816, -0.6564575, -2.190844, 0.9098039, 1, 0, 1,
-0.933073, -2.420415, -3.622669, 0.9019608, 1, 0, 1,
-0.9291782, -3.303148, -2.977364, 0.8941177, 1, 0, 1,
-0.9248387, 2.419457, -0.8761446, 0.8901961, 1, 0, 1,
-0.9229671, -0.03456809, 0.664833, 0.8823529, 1, 0, 1,
-0.918883, -0.1292354, -1.414873, 0.8784314, 1, 0, 1,
-0.9158281, -1.240968, -4.722682, 0.8705882, 1, 0, 1,
-0.9070542, -0.3716433, -1.025056, 0.8666667, 1, 0, 1,
-0.9055817, 0.5040721, -2.769303, 0.8588235, 1, 0, 1,
-0.9041647, -0.002405292, -1.600644, 0.854902, 1, 0, 1,
-0.8983398, 0.07983726, -1.742953, 0.8470588, 1, 0, 1,
-0.8965446, -1.059902, -2.456617, 0.8431373, 1, 0, 1,
-0.8907516, -1.682066, -2.384822, 0.8352941, 1, 0, 1,
-0.8846239, -0.2873039, -1.170366, 0.8313726, 1, 0, 1,
-0.8845225, 1.464527, -0.5960189, 0.8235294, 1, 0, 1,
-0.8798732, -0.6136465, -1.560802, 0.8196079, 1, 0, 1,
-0.8793445, -1.210097, -2.397409, 0.8117647, 1, 0, 1,
-0.8719049, 0.4874392, -0.6623538, 0.8078431, 1, 0, 1,
-0.8641284, 0.8360627, -0.4393644, 0.8, 1, 0, 1,
-0.861635, 0.87053, -1.677409, 0.7921569, 1, 0, 1,
-0.8567275, -1.263274, -1.263302, 0.7882353, 1, 0, 1,
-0.8556556, 0.0411196, -1.699452, 0.7803922, 1, 0, 1,
-0.8502485, -1.109605, -1.364578, 0.7764706, 1, 0, 1,
-0.8482626, 0.8308417, 0.8293595, 0.7686275, 1, 0, 1,
-0.8442651, 0.950458, -0.8872975, 0.7647059, 1, 0, 1,
-0.841586, -0.9463308, -0.903037, 0.7568628, 1, 0, 1,
-0.8319467, -0.2670106, -2.715713, 0.7529412, 1, 0, 1,
-0.8241479, -0.5832368, -1.93601, 0.7450981, 1, 0, 1,
-0.8190848, -1.363646, -3.978014, 0.7411765, 1, 0, 1,
-0.8185893, -0.7080713, -0.9115354, 0.7333333, 1, 0, 1,
-0.8134167, 0.7494655, 0.5931636, 0.7294118, 1, 0, 1,
-0.8122567, 0.7765959, -0.5292781, 0.7215686, 1, 0, 1,
-0.8108511, 2.006098, 0.01833898, 0.7176471, 1, 0, 1,
-0.8086202, -1.449028, -2.563533, 0.7098039, 1, 0, 1,
-0.8079581, -0.3329867, -1.364025, 0.7058824, 1, 0, 1,
-0.8053662, -1.35434, -3.634236, 0.6980392, 1, 0, 1,
-0.7983726, 0.2235422, -0.412093, 0.6901961, 1, 0, 1,
-0.7975075, 0.2724572, -2.805073, 0.6862745, 1, 0, 1,
-0.7960589, 1.696458, -0.2726535, 0.6784314, 1, 0, 1,
-0.7870947, 1.251216, -0.09043436, 0.6745098, 1, 0, 1,
-0.7777867, 0.5578404, -0.9897127, 0.6666667, 1, 0, 1,
-0.7773694, 0.7585518, -1.657049, 0.6627451, 1, 0, 1,
-0.7723761, 0.9067733, 0.6029211, 0.654902, 1, 0, 1,
-0.7714167, -1.001544, -5.035787, 0.6509804, 1, 0, 1,
-0.7684948, 1.26841, -0.5574449, 0.6431373, 1, 0, 1,
-0.7619923, -2.12762, -2.479896, 0.6392157, 1, 0, 1,
-0.761591, -0.5921803, -0.957761, 0.6313726, 1, 0, 1,
-0.759915, 0.1962562, -0.5619901, 0.627451, 1, 0, 1,
-0.7532332, 0.5197602, 1.056363, 0.6196079, 1, 0, 1,
-0.7518719, 1.058553, -1.533605, 0.6156863, 1, 0, 1,
-0.7499652, -0.3156464, -1.636783, 0.6078432, 1, 0, 1,
-0.7486463, -0.5137488, -1.87274, 0.6039216, 1, 0, 1,
-0.7463837, -1.405618, -3.091638, 0.5960785, 1, 0, 1,
-0.7412732, 0.0863155, -0.8971877, 0.5882353, 1, 0, 1,
-0.7380828, 0.7622927, 1.416753, 0.5843138, 1, 0, 1,
-0.7335991, -0.6130093, -3.87733, 0.5764706, 1, 0, 1,
-0.7324858, -0.4090585, -1.3001, 0.572549, 1, 0, 1,
-0.7245674, -0.03680931, -2.791271, 0.5647059, 1, 0, 1,
-0.7190558, 0.889393, -0.06856515, 0.5607843, 1, 0, 1,
-0.7124605, -0.7874423, -1.187115, 0.5529412, 1, 0, 1,
-0.7098204, -1.007322, -2.380055, 0.5490196, 1, 0, 1,
-0.7061909, -0.6046083, -2.229757, 0.5411765, 1, 0, 1,
-0.6905794, 0.1437169, -2.865852, 0.5372549, 1, 0, 1,
-0.6881702, -0.9716697, -3.723174, 0.5294118, 1, 0, 1,
-0.6875656, 0.1210444, -1.191693, 0.5254902, 1, 0, 1,
-0.6858267, 1.25711, -1.041902, 0.5176471, 1, 0, 1,
-0.6851456, 0.6206087, -1.20838, 0.5137255, 1, 0, 1,
-0.6812195, 0.4319764, -0.4741904, 0.5058824, 1, 0, 1,
-0.6778736, 0.04750474, -0.4747497, 0.5019608, 1, 0, 1,
-0.6778269, 0.4040529, -0.6606492, 0.4941176, 1, 0, 1,
-0.6757252, -0.9759297, -2.977766, 0.4862745, 1, 0, 1,
-0.6704272, -1.932912, -2.809834, 0.4823529, 1, 0, 1,
-0.6515891, -0.8131868, -1.131272, 0.4745098, 1, 0, 1,
-0.6482704, -0.6050642, -1.371363, 0.4705882, 1, 0, 1,
-0.6481631, 0.7776866, -0.6490889, 0.4627451, 1, 0, 1,
-0.6459482, -0.6189773, -2.191479, 0.4588235, 1, 0, 1,
-0.6447562, 1.756281, 0.609112, 0.4509804, 1, 0, 1,
-0.6397557, 0.399701, -0.5065734, 0.4470588, 1, 0, 1,
-0.6374627, 0.7390524, -0.29764, 0.4392157, 1, 0, 1,
-0.6353998, -0.3746833, -2.14019, 0.4352941, 1, 0, 1,
-0.6324292, -1.794458, -3.153563, 0.427451, 1, 0, 1,
-0.6244274, -1.057848, -2.165717, 0.4235294, 1, 0, 1,
-0.6177229, -0.06600688, -0.4470131, 0.4156863, 1, 0, 1,
-0.6167889, -0.05986436, -2.155063, 0.4117647, 1, 0, 1,
-0.6167254, -0.7967263, -2.332953, 0.4039216, 1, 0, 1,
-0.6149671, 0.4971943, -3.099628, 0.3960784, 1, 0, 1,
-0.6138391, 0.07971458, -0.4501732, 0.3921569, 1, 0, 1,
-0.6066833, -0.3007832, -2.378067, 0.3843137, 1, 0, 1,
-0.5959596, -0.9040825, -0.6438507, 0.3803922, 1, 0, 1,
-0.5946631, 0.9534912, 0.04237534, 0.372549, 1, 0, 1,
-0.5920239, -0.7027432, -3.225357, 0.3686275, 1, 0, 1,
-0.5917589, -0.4962527, -3.436294, 0.3607843, 1, 0, 1,
-0.5890996, -1.088012, -1.656367, 0.3568628, 1, 0, 1,
-0.5879436, 0.04381431, -2.876774, 0.3490196, 1, 0, 1,
-0.5867792, -2.734521, -2.790814, 0.345098, 1, 0, 1,
-0.5848335, -0.1007885, -0.2649319, 0.3372549, 1, 0, 1,
-0.5801385, 0.05263171, -2.41994, 0.3333333, 1, 0, 1,
-0.579031, 0.8705418, -2.246905, 0.3254902, 1, 0, 1,
-0.5755558, 0.3656685, -1.2927, 0.3215686, 1, 0, 1,
-0.5712574, 0.1298897, -0.6290309, 0.3137255, 1, 0, 1,
-0.57017, 0.8706126, -1.920762, 0.3098039, 1, 0, 1,
-0.5688964, -1.640669, -3.827831, 0.3019608, 1, 0, 1,
-0.5684514, 0.1953699, -0.7205213, 0.2941177, 1, 0, 1,
-0.5675509, -0.280268, -3.896441, 0.2901961, 1, 0, 1,
-0.5638861, 0.369927, -1.099409, 0.282353, 1, 0, 1,
-0.5620508, 1.01168, 0.0402266, 0.2784314, 1, 0, 1,
-0.56116, 0.1797404, -2.472732, 0.2705882, 1, 0, 1,
-0.5599509, 0.4537058, -1.235599, 0.2666667, 1, 0, 1,
-0.5577348, -0.1723879, -0.932501, 0.2588235, 1, 0, 1,
-0.5560539, 0.3958785, -2.342146, 0.254902, 1, 0, 1,
-0.5548293, -0.6925824, -2.100061, 0.2470588, 1, 0, 1,
-0.5545405, 1.15682, 0.5882435, 0.2431373, 1, 0, 1,
-0.5518481, -0.3038551, -3.184524, 0.2352941, 1, 0, 1,
-0.5516419, -0.2898436, -3.044068, 0.2313726, 1, 0, 1,
-0.550912, -0.03812594, -3.465812, 0.2235294, 1, 0, 1,
-0.5501668, -1.586579, -3.172113, 0.2196078, 1, 0, 1,
-0.5498145, -1.09501, -5.191398, 0.2117647, 1, 0, 1,
-0.5496699, -0.9265581, -2.177298, 0.2078431, 1, 0, 1,
-0.5439913, 0.6210665, 0.2065234, 0.2, 1, 0, 1,
-0.5439192, -1.606162, -5.411217, 0.1921569, 1, 0, 1,
-0.5434623, 0.01300027, -1.149387, 0.1882353, 1, 0, 1,
-0.5426864, 0.2768675, -1.382481, 0.1803922, 1, 0, 1,
-0.5400373, -0.2499178, -2.797219, 0.1764706, 1, 0, 1,
-0.5384431, 0.1873045, -2.500062, 0.1686275, 1, 0, 1,
-0.5382797, -0.187492, -2.766951, 0.1647059, 1, 0, 1,
-0.5377232, 1.358253, 1.653615, 0.1568628, 1, 0, 1,
-0.5375829, -0.1015157, -2.338822, 0.1529412, 1, 0, 1,
-0.532443, -0.02262864, -0.2574313, 0.145098, 1, 0, 1,
-0.5264802, 1.624688, -1.121364, 0.1411765, 1, 0, 1,
-0.523653, -1.208641, -2.78581, 0.1333333, 1, 0, 1,
-0.522594, 0.3422867, -2.462463, 0.1294118, 1, 0, 1,
-0.5203928, 0.3276686, -0.9435045, 0.1215686, 1, 0, 1,
-0.5162045, 0.06721985, -1.584102, 0.1176471, 1, 0, 1,
-0.5121652, -0.9507653, -0.9169208, 0.1098039, 1, 0, 1,
-0.510082, 0.9009127, 0.5439284, 0.1058824, 1, 0, 1,
-0.5010515, -0.07710383, -2.749529, 0.09803922, 1, 0, 1,
-0.4995522, 2.206301, -0.5724857, 0.09019608, 1, 0, 1,
-0.4940587, 1.442952, -0.8680132, 0.08627451, 1, 0, 1,
-0.4914175, -1.205391, -2.0824, 0.07843138, 1, 0, 1,
-0.4879925, -0.04384959, -1.300207, 0.07450981, 1, 0, 1,
-0.4866134, -0.3060824, -2.558113, 0.06666667, 1, 0, 1,
-0.4847337, 0.6874422, -0.7466143, 0.0627451, 1, 0, 1,
-0.4842094, -0.4123846, -2.161569, 0.05490196, 1, 0, 1,
-0.477467, -0.5609711, -2.038025, 0.05098039, 1, 0, 1,
-0.4769175, 1.195574, -0.5497113, 0.04313726, 1, 0, 1,
-0.4769131, 0.2036372, -2.312502, 0.03921569, 1, 0, 1,
-0.4760407, 0.5487125, -1.180986, 0.03137255, 1, 0, 1,
-0.472499, -0.06083317, -3.090776, 0.02745098, 1, 0, 1,
-0.4714062, -0.5302689, -3.30053, 0.01960784, 1, 0, 1,
-0.4710113, 0.3193326, -0.6449645, 0.01568628, 1, 0, 1,
-0.4676077, 0.5422239, -1.699852, 0.007843138, 1, 0, 1,
-0.4673635, 0.2335257, -0.5182038, 0.003921569, 1, 0, 1,
-0.4667899, -1.28149, -3.178375, 0, 1, 0.003921569, 1,
-0.4656166, 0.02892614, -1.512032, 0, 1, 0.01176471, 1,
-0.462519, -0.5411207, -3.176043, 0, 1, 0.01568628, 1,
-0.4621436, 0.2401158, -0.5051314, 0, 1, 0.02352941, 1,
-0.460433, 0.260332, -0.3609243, 0, 1, 0.02745098, 1,
-0.4586988, -0.6709507, -2.063688, 0, 1, 0.03529412, 1,
-0.4558115, -2.270519, -2.836043, 0, 1, 0.03921569, 1,
-0.4557199, 1.154607, -1.257175, 0, 1, 0.04705882, 1,
-0.4556197, 0.05709588, -0.886779, 0, 1, 0.05098039, 1,
-0.4545859, -0.07010273, -1.714029, 0, 1, 0.05882353, 1,
-0.4537645, -0.02747268, -0.4946667, 0, 1, 0.0627451, 1,
-0.4532061, -0.8040358, -2.7047, 0, 1, 0.07058824, 1,
-0.451889, 0.3133791, -0.08714149, 0, 1, 0.07450981, 1,
-0.4516001, 0.1967576, -0.659097, 0, 1, 0.08235294, 1,
-0.4459754, -1.511259, -3.683049, 0, 1, 0.08627451, 1,
-0.4376974, 0.7105471, 0.3689885, 0, 1, 0.09411765, 1,
-0.4373169, 0.01399674, -1.342832, 0, 1, 0.1019608, 1,
-0.434097, 0.07842698, -0.5757526, 0, 1, 0.1058824, 1,
-0.4338284, -1.288131, -3.046608, 0, 1, 0.1137255, 1,
-0.4279744, 1.446573, 0.5667472, 0, 1, 0.1176471, 1,
-0.4278527, 1.364077, -0.2567923, 0, 1, 0.1254902, 1,
-0.4202928, -0.4629123, -1.720455, 0, 1, 0.1294118, 1,
-0.4134791, -0.684009, -3.230455, 0, 1, 0.1372549, 1,
-0.411227, -1.292418, -5.226437, 0, 1, 0.1411765, 1,
-0.4054357, -0.2960232, -3.577741, 0, 1, 0.1490196, 1,
-0.4011488, -1.777693, -2.829893, 0, 1, 0.1529412, 1,
-0.4004964, -0.1665354, -2.125639, 0, 1, 0.1607843, 1,
-0.4002752, -1.575315, -3.286438, 0, 1, 0.1647059, 1,
-0.3967334, 0.6678376, -0.7275906, 0, 1, 0.172549, 1,
-0.3917434, -0.681007, -2.551588, 0, 1, 0.1764706, 1,
-0.3870135, 2.017451, -1.38293, 0, 1, 0.1843137, 1,
-0.3850793, -0.3878143, -2.375479, 0, 1, 0.1882353, 1,
-0.3827988, 0.9766786, 0.3066154, 0, 1, 0.1960784, 1,
-0.3800109, -1.045983, -2.800653, 0, 1, 0.2039216, 1,
-0.3798424, 0.4439986, -2.4106, 0, 1, 0.2078431, 1,
-0.3663624, 1.612483, -1.019075, 0, 1, 0.2156863, 1,
-0.3653643, 0.1864293, -0.8253449, 0, 1, 0.2196078, 1,
-0.3635165, -1.76248, -4.225523, 0, 1, 0.227451, 1,
-0.3609655, -1.112283, -3.44631, 0, 1, 0.2313726, 1,
-0.3522774, -1.120425, -0.3028957, 0, 1, 0.2392157, 1,
-0.3522059, -0.01445926, -2.745493, 0, 1, 0.2431373, 1,
-0.3511756, -1.79228, -2.208218, 0, 1, 0.2509804, 1,
-0.350691, -0.5270237, -3.276601, 0, 1, 0.254902, 1,
-0.3487092, -0.8459684, -4.093535, 0, 1, 0.2627451, 1,
-0.3472845, -1.113339, -3.755397, 0, 1, 0.2666667, 1,
-0.3466487, 1.002996, 0.3961495, 0, 1, 0.2745098, 1,
-0.3463542, 0.1500062, -0.4660294, 0, 1, 0.2784314, 1,
-0.3434582, -0.4378101, -1.924173, 0, 1, 0.2862745, 1,
-0.342761, 1.119158, 0.1585741, 0, 1, 0.2901961, 1,
-0.3422095, 1.170605, 0.1053332, 0, 1, 0.2980392, 1,
-0.3399219, 0.5335445, -0.391643, 0, 1, 0.3058824, 1,
-0.3357933, 0.08397388, -2.02682, 0, 1, 0.3098039, 1,
-0.3357235, -0.3502084, -3.333128, 0, 1, 0.3176471, 1,
-0.3352285, 1.150505, 0.5741775, 0, 1, 0.3215686, 1,
-0.3351801, 0.6983787, -0.1786896, 0, 1, 0.3294118, 1,
-0.3331027, -1.122989, -4.909287, 0, 1, 0.3333333, 1,
-0.3325683, 0.09669401, -0.4374264, 0, 1, 0.3411765, 1,
-0.3264185, -1.330151, -4.538066, 0, 1, 0.345098, 1,
-0.323999, -1.228664, -2.648294, 0, 1, 0.3529412, 1,
-0.3238418, -0.8762664, -3.207084, 0, 1, 0.3568628, 1,
-0.3222426, -0.3466191, -2.594635, 0, 1, 0.3647059, 1,
-0.3213053, 0.04397301, -3.776074, 0, 1, 0.3686275, 1,
-0.3195585, 0.03255915, -0.3922679, 0, 1, 0.3764706, 1,
-0.3146719, 0.3148823, -0.4719062, 0, 1, 0.3803922, 1,
-0.3136152, -0.3917911, -3.557614, 0, 1, 0.3882353, 1,
-0.310609, -1.105429, -3.935456, 0, 1, 0.3921569, 1,
-0.3100756, -1.140471, -3.516428, 0, 1, 0.4, 1,
-0.3075258, 0.614961, -0.4809595, 0, 1, 0.4078431, 1,
-0.3016827, 0.8621357, -1.140708, 0, 1, 0.4117647, 1,
-0.3011245, -1.88339, -2.715569, 0, 1, 0.4196078, 1,
-0.2998323, 0.2137021, -2.983981, 0, 1, 0.4235294, 1,
-0.2968287, 0.09144938, -0.9709332, 0, 1, 0.4313726, 1,
-0.2935703, 0.5798596, -2.652377, 0, 1, 0.4352941, 1,
-0.2925985, -1.131491, -2.60932, 0, 1, 0.4431373, 1,
-0.2914919, 1.429168, -0.4528513, 0, 1, 0.4470588, 1,
-0.2890645, -0.6786971, -3.477741, 0, 1, 0.454902, 1,
-0.2885184, -0.7090987, -2.029146, 0, 1, 0.4588235, 1,
-0.2865933, -0.690884, -3.783878, 0, 1, 0.4666667, 1,
-0.2861038, 1.019591, 1.49281, 0, 1, 0.4705882, 1,
-0.2858511, -0.6737391, -2.840649, 0, 1, 0.4784314, 1,
-0.285724, 0.5669917, 0.8920835, 0, 1, 0.4823529, 1,
-0.2844281, 1.57207, -0.244208, 0, 1, 0.4901961, 1,
-0.2811367, -0.3860355, -4.24491, 0, 1, 0.4941176, 1,
-0.2807229, 0.2809765, 0.4990975, 0, 1, 0.5019608, 1,
-0.2800016, -0.1532781, -2.165628, 0, 1, 0.509804, 1,
-0.2797072, -2.535916, -2.602667, 0, 1, 0.5137255, 1,
-0.2774483, -0.4445196, -1.328178, 0, 1, 0.5215687, 1,
-0.2773589, 2.124164, -0.07392479, 0, 1, 0.5254902, 1,
-0.2710469, -0.7676384, -1.990523, 0, 1, 0.5333334, 1,
-0.2681161, -0.395252, -4.083968, 0, 1, 0.5372549, 1,
-0.2661246, -1.137041, -1.30391, 0, 1, 0.5450981, 1,
-0.2652949, -0.7500479, -2.269517, 0, 1, 0.5490196, 1,
-0.264012, -0.378713, -3.77088, 0, 1, 0.5568628, 1,
-0.2626865, 0.579995, -0.7058528, 0, 1, 0.5607843, 1,
-0.2593212, -2.7131, -3.732529, 0, 1, 0.5686275, 1,
-0.2583896, -0.8279752, -2.393985, 0, 1, 0.572549, 1,
-0.2583147, 1.093986, -0.8073412, 0, 1, 0.5803922, 1,
-0.2573302, -0.5715727, -1.476275, 0, 1, 0.5843138, 1,
-0.2569094, -1.021354, -2.258074, 0, 1, 0.5921569, 1,
-0.2525959, 0.822432, -1.196418, 0, 1, 0.5960785, 1,
-0.2517846, -0.3592034, -4.246786, 0, 1, 0.6039216, 1,
-0.2473166, -2.095864, -2.876084, 0, 1, 0.6117647, 1,
-0.245802, 0.1117433, 0.00560667, 0, 1, 0.6156863, 1,
-0.2394999, -1.078237, -3.10643, 0, 1, 0.6235294, 1,
-0.2376126, 0.1061174, -1.717742, 0, 1, 0.627451, 1,
-0.2368911, 0.1757224, -0.7217804, 0, 1, 0.6352941, 1,
-0.2355493, -0.5837077, -2.873345, 0, 1, 0.6392157, 1,
-0.2341774, -0.7742813, -3.215577, 0, 1, 0.6470588, 1,
-0.2341759, 0.5644802, -0.3642966, 0, 1, 0.6509804, 1,
-0.2338593, 0.4881175, -0.003905451, 0, 1, 0.6588235, 1,
-0.2268053, -0.6841531, -2.420123, 0, 1, 0.6627451, 1,
-0.2250569, 0.4171825, -1.236596, 0, 1, 0.6705883, 1,
-0.2249892, 0.7968052, 1.032041, 0, 1, 0.6745098, 1,
-0.2229748, 0.2022812, -0.2676398, 0, 1, 0.682353, 1,
-0.2188713, 1.590769, 0.6288598, 0, 1, 0.6862745, 1,
-0.2186948, 0.2979371, 0.8027828, 0, 1, 0.6941177, 1,
-0.2179078, -0.216814, -2.085403, 0, 1, 0.7019608, 1,
-0.2155128, 0.1843289, -2.689361, 0, 1, 0.7058824, 1,
-0.2121769, 0.9134034, -0.8087175, 0, 1, 0.7137255, 1,
-0.2107607, 1.054968, 1.443633, 0, 1, 0.7176471, 1,
-0.2049555, -0.4947696, -2.521799, 0, 1, 0.7254902, 1,
-0.2043872, 0.85471, 1.093629, 0, 1, 0.7294118, 1,
-0.1999409, -2.27829, -4.019881, 0, 1, 0.7372549, 1,
-0.1923561, -2.123742, -4.591511, 0, 1, 0.7411765, 1,
-0.190229, -0.5640992, -1.076736, 0, 1, 0.7490196, 1,
-0.1884673, -0.3309058, -1.873022, 0, 1, 0.7529412, 1,
-0.1881791, 0.8968426, 0.3100816, 0, 1, 0.7607843, 1,
-0.185591, 0.7239428, -1.575929, 0, 1, 0.7647059, 1,
-0.1848752, -2.759004, -1.429319, 0, 1, 0.772549, 1,
-0.179265, 0.7963446, 1.028121, 0, 1, 0.7764706, 1,
-0.1778673, -0.9594665, -2.54354, 0, 1, 0.7843137, 1,
-0.1766732, 1.413691, -1.233676, 0, 1, 0.7882353, 1,
-0.176388, 0.4568681, -1.947095, 0, 1, 0.7960784, 1,
-0.1758774, -3.967901, -2.323709, 0, 1, 0.8039216, 1,
-0.1738169, -1.053012, -3.632939, 0, 1, 0.8078431, 1,
-0.1728458, 0.5306387, -1.425772, 0, 1, 0.8156863, 1,
-0.1717279, -1.429626, -1.611017, 0, 1, 0.8196079, 1,
-0.1706051, 1.13328, -1.340741, 0, 1, 0.827451, 1,
-0.1670681, -0.195026, -2.812545, 0, 1, 0.8313726, 1,
-0.1622932, -0.3515811, -2.221155, 0, 1, 0.8392157, 1,
-0.1600916, 0.4873948, 0.4248914, 0, 1, 0.8431373, 1,
-0.1586214, -0.9196298, -1.814474, 0, 1, 0.8509804, 1,
-0.158465, -0.7950955, -2.791653, 0, 1, 0.854902, 1,
-0.1548733, 0.2937333, -1.430893, 0, 1, 0.8627451, 1,
-0.1544913, 0.4985644, -1.230256, 0, 1, 0.8666667, 1,
-0.1485243, 2.522089, -0.8894417, 0, 1, 0.8745098, 1,
-0.1475921, -0.2237733, -3.013984, 0, 1, 0.8784314, 1,
-0.1464499, -0.2883059, -2.760426, 0, 1, 0.8862745, 1,
-0.1397712, 0.05538003, 0.8082658, 0, 1, 0.8901961, 1,
-0.1378402, -1.029641, -1.550132, 0, 1, 0.8980392, 1,
-0.1331682, 0.3599849, 0.0528252, 0, 1, 0.9058824, 1,
-0.1307232, -0.2202267, -3.987289, 0, 1, 0.9098039, 1,
-0.1245179, -0.2610599, -3.166455, 0, 1, 0.9176471, 1,
-0.1230738, -1.498086, -0.8218046, 0, 1, 0.9215686, 1,
-0.1198188, -1.0186, -3.410417, 0, 1, 0.9294118, 1,
-0.1167771, -0.1408685, -1.845069, 0, 1, 0.9333333, 1,
-0.109101, -1.085553, -1.886931, 0, 1, 0.9411765, 1,
-0.1068765, -0.8140267, -1.34145, 0, 1, 0.945098, 1,
-0.1032893, -0.9258918, -4.038154, 0, 1, 0.9529412, 1,
-0.09958194, 0.09127539, -0.7221078, 0, 1, 0.9568627, 1,
-0.09192172, -0.4300581, -3.330817, 0, 1, 0.9647059, 1,
-0.09166139, 0.3597768, 0.1071901, 0, 1, 0.9686275, 1,
-0.09135724, 0.1206585, 0.635565, 0, 1, 0.9764706, 1,
-0.08995525, 0.3138403, -0.8193812, 0, 1, 0.9803922, 1,
-0.08349347, 0.4692029, -2.152416, 0, 1, 0.9882353, 1,
-0.08087779, -0.8473482, -0.8168283, 0, 1, 0.9921569, 1,
-0.07446527, 0.0003883087, -1.005359, 0, 1, 1, 1,
-0.07247561, -0.7688651, -2.829127, 0, 0.9921569, 1, 1,
-0.0690209, -0.9054316, -2.075141, 0, 0.9882353, 1, 1,
-0.06495746, -0.9135035, -0.8593802, 0, 0.9803922, 1, 1,
-0.06445243, -0.03392663, -1.489016, 0, 0.9764706, 1, 1,
-0.06442557, -0.3904505, -5.45576, 0, 0.9686275, 1, 1,
-0.0620318, -0.01455816, -2.105891, 0, 0.9647059, 1, 1,
-0.06151031, 0.008676227, -2.263429, 0, 0.9568627, 1, 1,
-0.05543248, -0.1400007, -2.109626, 0, 0.9529412, 1, 1,
-0.05307283, 0.05243706, -1.125957, 0, 0.945098, 1, 1,
-0.05262148, 0.005994224, -1.04576, 0, 0.9411765, 1, 1,
-0.04365584, -1.132128, -2.344903, 0, 0.9333333, 1, 1,
-0.03977913, 0.5578519, -0.05911778, 0, 0.9294118, 1, 1,
-0.03443881, 0.3247086, 0.5238454, 0, 0.9215686, 1, 1,
-0.03288772, 1.290993, 0.5267701, 0, 0.9176471, 1, 1,
-0.02858821, -0.5304177, -3.506747, 0, 0.9098039, 1, 1,
-0.02669125, 1.412648, 1.640856, 0, 0.9058824, 1, 1,
-0.02324219, 0.02667309, -0.1620087, 0, 0.8980392, 1, 1,
-0.02228019, 0.7078544, 0.8725521, 0, 0.8901961, 1, 1,
-0.02122267, -0.4426004, -4.370262, 0, 0.8862745, 1, 1,
-0.01935528, -1.995984, -2.03659, 0, 0.8784314, 1, 1,
-0.01817239, -0.1569559, -3.442434, 0, 0.8745098, 1, 1,
-0.01230312, -1.186987, -3.166569, 0, 0.8666667, 1, 1,
-0.01124268, -0.5807479, -3.344271, 0, 0.8627451, 1, 1,
-0.008782391, -1.08367, -3.457785, 0, 0.854902, 1, 1,
-0.006950232, 0.3885671, -1.223289, 0, 0.8509804, 1, 1,
-6.078087e-05, 1.661477, 0.4634053, 0, 0.8431373, 1, 1,
0.002034298, -0.2566196, 3.281598, 0, 0.8392157, 1, 1,
0.006699321, -1.430541, 1.457398, 0, 0.8313726, 1, 1,
0.007669119, 1.603038, -1.275621, 0, 0.827451, 1, 1,
0.008956975, 0.02510197, 0.7254486, 0, 0.8196079, 1, 1,
0.01048282, -0.2881755, 2.986722, 0, 0.8156863, 1, 1,
0.01211774, -0.3794252, 1.934221, 0, 0.8078431, 1, 1,
0.01983177, 0.3626679, -1.162253, 0, 0.8039216, 1, 1,
0.02119476, -0.4936642, 2.509013, 0, 0.7960784, 1, 1,
0.02404449, 0.4911354, 0.1988733, 0, 0.7882353, 1, 1,
0.02623481, 1.139312, 0.0129056, 0, 0.7843137, 1, 1,
0.02734023, -0.7535946, 1.998442, 0, 0.7764706, 1, 1,
0.02979063, -0.1746185, 1.455837, 0, 0.772549, 1, 1,
0.03511102, -0.708037, 3.401813, 0, 0.7647059, 1, 1,
0.03607647, -1.012806, 3.946133, 0, 0.7607843, 1, 1,
0.03657359, 0.3857228, 0.06851177, 0, 0.7529412, 1, 1,
0.03775832, 0.09270401, 1.118132, 0, 0.7490196, 1, 1,
0.03787503, -0.3974283, 3.091352, 0, 0.7411765, 1, 1,
0.04397238, 0.6684547, 0.8683342, 0, 0.7372549, 1, 1,
0.04586117, -1.247497, 3.295836, 0, 0.7294118, 1, 1,
0.04799496, 0.78626, -0.005658598, 0, 0.7254902, 1, 1,
0.05143808, -0.1045265, 4.369151, 0, 0.7176471, 1, 1,
0.05327205, -0.01236299, 2.526892, 0, 0.7137255, 1, 1,
0.0543582, -1.599816, 4.952859, 0, 0.7058824, 1, 1,
0.05470688, 0.2665401, -0.02228196, 0, 0.6980392, 1, 1,
0.0547263, -0.4470081, 3.551516, 0, 0.6941177, 1, 1,
0.05544909, -0.9500656, 2.731663, 0, 0.6862745, 1, 1,
0.05617283, -0.4061394, 3.438408, 0, 0.682353, 1, 1,
0.05666715, 0.9367179, -2.495486, 0, 0.6745098, 1, 1,
0.05937839, -0.6079781, 3.188443, 0, 0.6705883, 1, 1,
0.06037302, -2.504509, 3.899681, 0, 0.6627451, 1, 1,
0.06815282, -1.029147, 2.027678, 0, 0.6588235, 1, 1,
0.08024535, 0.1823301, 2.16835, 0, 0.6509804, 1, 1,
0.08973681, 0.04856529, -0.3266935, 0, 0.6470588, 1, 1,
0.09129968, 0.5544028, -1.068758, 0, 0.6392157, 1, 1,
0.09244405, -0.9526336, 3.083353, 0, 0.6352941, 1, 1,
0.09267477, -1.119323, 3.910829, 0, 0.627451, 1, 1,
0.09299029, -1.992997, 3.232296, 0, 0.6235294, 1, 1,
0.09364691, -1.541252, 3.784082, 0, 0.6156863, 1, 1,
0.0938086, -0.9460615, 1.915305, 0, 0.6117647, 1, 1,
0.09523915, -0.6589631, 4.322629, 0, 0.6039216, 1, 1,
0.09780055, -0.9080377, 3.431723, 0, 0.5960785, 1, 1,
0.1020766, -0.3869819, 3.338602, 0, 0.5921569, 1, 1,
0.1021, 0.06127523, 1.611752, 0, 0.5843138, 1, 1,
0.1031549, -2.299652, 2.315415, 0, 0.5803922, 1, 1,
0.1033295, -0.2513875, 2.376962, 0, 0.572549, 1, 1,
0.1057781, -1.190232, 3.146717, 0, 0.5686275, 1, 1,
0.1058008, -0.5330655, 3.230484, 0, 0.5607843, 1, 1,
0.1101553, 0.03499982, 1.655993, 0, 0.5568628, 1, 1,
0.1224049, -0.3422251, 2.562336, 0, 0.5490196, 1, 1,
0.1257553, 0.979846, -1.096715, 0, 0.5450981, 1, 1,
0.1259575, 0.156104, 1.270678, 0, 0.5372549, 1, 1,
0.127602, -0.04168386, 1.642729, 0, 0.5333334, 1, 1,
0.1295222, -0.1431144, 0.5814357, 0, 0.5254902, 1, 1,
0.1310792, 0.1686757, 1.108323, 0, 0.5215687, 1, 1,
0.1310848, -1.825933, 3.529761, 0, 0.5137255, 1, 1,
0.1316804, 0.1811601, 1.615024, 0, 0.509804, 1, 1,
0.13276, 1.283946, 1.167199, 0, 0.5019608, 1, 1,
0.1329078, 0.4759258, 1.328033, 0, 0.4941176, 1, 1,
0.1345593, 0.5290088, 0.7336568, 0, 0.4901961, 1, 1,
0.1356444, 0.8169966, 2.241556, 0, 0.4823529, 1, 1,
0.1394726, 0.7190949, 0.5792607, 0, 0.4784314, 1, 1,
0.140506, 0.3272758, 1.787448, 0, 0.4705882, 1, 1,
0.1462169, -1.599653, 4.026837, 0, 0.4666667, 1, 1,
0.1466865, 1.28798, 0.03056366, 0, 0.4588235, 1, 1,
0.1478447, 1.90363, -0.3758268, 0, 0.454902, 1, 1,
0.1482422, 0.76073, -0.207003, 0, 0.4470588, 1, 1,
0.1487129, -0.5712747, 3.804104, 0, 0.4431373, 1, 1,
0.15092, 0.63148, -1.493006, 0, 0.4352941, 1, 1,
0.1527917, 0.2628184, 2.417581, 0, 0.4313726, 1, 1,
0.1550814, -1.146324, 4.041195, 0, 0.4235294, 1, 1,
0.1553725, 0.3759474, 1.045114, 0, 0.4196078, 1, 1,
0.1554131, 2.019666, -1.386091, 0, 0.4117647, 1, 1,
0.1554801, -0.3574903, 2.352996, 0, 0.4078431, 1, 1,
0.1570772, -0.7825367, 3.195147, 0, 0.4, 1, 1,
0.1578289, 0.135792, 1.418808, 0, 0.3921569, 1, 1,
0.1590394, -1.320604, 3.455975, 0, 0.3882353, 1, 1,
0.1604461, 1.411759, 0.4542974, 0, 0.3803922, 1, 1,
0.162357, 1.477959, -0.4160227, 0, 0.3764706, 1, 1,
0.1694586, -0.7552475, 1.096614, 0, 0.3686275, 1, 1,
0.1701197, -1.786407, 3.815511, 0, 0.3647059, 1, 1,
0.172361, -0.5575079, 2.259863, 0, 0.3568628, 1, 1,
0.1775835, 0.6873604, -1.180204, 0, 0.3529412, 1, 1,
0.1802645, 0.595834, 1.503376, 0, 0.345098, 1, 1,
0.1880015, 1.719306, 1.036951, 0, 0.3411765, 1, 1,
0.1941586, 0.2436365, 0.037196, 0, 0.3333333, 1, 1,
0.1983073, -0.6140534, 2.889932, 0, 0.3294118, 1, 1,
0.1996493, 0.4815999, -0.8581667, 0, 0.3215686, 1, 1,
0.2013459, -0.978585, 2.401841, 0, 0.3176471, 1, 1,
0.2045157, 0.8902544, -1.290777, 0, 0.3098039, 1, 1,
0.204539, 0.5150014, 0.5079324, 0, 0.3058824, 1, 1,
0.2090804, -0.7951776, 2.48991, 0, 0.2980392, 1, 1,
0.2141317, 0.6547281, 0.7122291, 0, 0.2901961, 1, 1,
0.2151002, -0.6162921, 2.956654, 0, 0.2862745, 1, 1,
0.2180457, -0.4507571, 2.577741, 0, 0.2784314, 1, 1,
0.2182155, 0.4021573, 0.2734776, 0, 0.2745098, 1, 1,
0.220491, 0.1353071, 0.1702817, 0, 0.2666667, 1, 1,
0.2216821, 0.09335539, 1.859701, 0, 0.2627451, 1, 1,
0.2217753, 1.320254, 0.1370331, 0, 0.254902, 1, 1,
0.2243813, 0.2995821, 3.106528, 0, 0.2509804, 1, 1,
0.224543, 0.1617659, 0.456635, 0, 0.2431373, 1, 1,
0.2256328, -0.8134249, 3.710732, 0, 0.2392157, 1, 1,
0.2271814, 0.120583, 1.418387, 0, 0.2313726, 1, 1,
0.2273309, -2.664584, 1.92105, 0, 0.227451, 1, 1,
0.232312, -1.921709, 1.968089, 0, 0.2196078, 1, 1,
0.2338981, -0.06069068, 1.168136, 0, 0.2156863, 1, 1,
0.2395064, -1.169111, 3.489351, 0, 0.2078431, 1, 1,
0.2412475, 1.513914, -0.429415, 0, 0.2039216, 1, 1,
0.241492, -0.9374206, 4.025554, 0, 0.1960784, 1, 1,
0.2438814, 0.2802716, 1.937654, 0, 0.1882353, 1, 1,
0.2465098, 1.198559, -0.2527906, 0, 0.1843137, 1, 1,
0.2478848, 0.32292, -0.5812926, 0, 0.1764706, 1, 1,
0.2512454, -0.5247592, 5.489996, 0, 0.172549, 1, 1,
0.252045, 2.011195, 0.6429167, 0, 0.1647059, 1, 1,
0.2546468, -0.3845225, 2.375216, 0, 0.1607843, 1, 1,
0.254973, 0.1712241, 2.301139, 0, 0.1529412, 1, 1,
0.2557293, -0.3449968, 3.018044, 0, 0.1490196, 1, 1,
0.2562706, 0.1392721, 1.004892, 0, 0.1411765, 1, 1,
0.2563964, 0.4387971, 0.512787, 0, 0.1372549, 1, 1,
0.2598892, 0.1753038, 1.514754, 0, 0.1294118, 1, 1,
0.2636125, 0.8781519, -0.3578623, 0, 0.1254902, 1, 1,
0.2636492, -0.2509478, 3.001951, 0, 0.1176471, 1, 1,
0.2644291, -0.8748357, 2.234398, 0, 0.1137255, 1, 1,
0.2648384, 1.585834, 0.2674105, 0, 0.1058824, 1, 1,
0.2747882, 0.5585095, 0.7971904, 0, 0.09803922, 1, 1,
0.2841388, -0.6846683, 3.298229, 0, 0.09411765, 1, 1,
0.2948588, 1.633017, -1.500213, 0, 0.08627451, 1, 1,
0.295286, 0.3143565, -0.8495376, 0, 0.08235294, 1, 1,
0.2983548, 0.7943557, 0.2802297, 0, 0.07450981, 1, 1,
0.298974, -0.4408897, 0.9752607, 0, 0.07058824, 1, 1,
0.3014978, 0.7380742, 0.4921812, 0, 0.0627451, 1, 1,
0.3059818, 0.1216974, 0.9089068, 0, 0.05882353, 1, 1,
0.3123655, -0.09126806, 1.842876, 0, 0.05098039, 1, 1,
0.3125674, -1.06218, 3.290805, 0, 0.04705882, 1, 1,
0.319935, -0.582074, 2.927122, 0, 0.03921569, 1, 1,
0.3199901, -0.2477752, 2.219845, 0, 0.03529412, 1, 1,
0.3239441, -1.218592, 1.151113, 0, 0.02745098, 1, 1,
0.3250613, -0.792182, 2.109499, 0, 0.02352941, 1, 1,
0.3264319, -2.240052, 3.175541, 0, 0.01568628, 1, 1,
0.3264384, 0.0139754, 0.8718655, 0, 0.01176471, 1, 1,
0.3273906, 1.209773, -1.247301, 0, 0.003921569, 1, 1,
0.3290845, 0.4923601, -0.2577441, 0.003921569, 0, 1, 1,
0.3325582, -0.5036991, 2.806481, 0.007843138, 0, 1, 1,
0.3344886, -0.3031949, 3.446524, 0.01568628, 0, 1, 1,
0.3372017, 1.049101, 0.459335, 0.01960784, 0, 1, 1,
0.3407595, 2.01905, 1.447841, 0.02745098, 0, 1, 1,
0.3410048, -0.429996, 2.673285, 0.03137255, 0, 1, 1,
0.3435116, 0.8155339, 0.5560396, 0.03921569, 0, 1, 1,
0.343852, -0.6514457, 3.808801, 0.04313726, 0, 1, 1,
0.3555669, -0.9554525, 2.310615, 0.05098039, 0, 1, 1,
0.3556883, -2.152045, 2.687248, 0.05490196, 0, 1, 1,
0.3557249, -0.02596661, 0.9924366, 0.0627451, 0, 1, 1,
0.3615882, 1.136405, -1.442862, 0.06666667, 0, 1, 1,
0.3623533, 0.0679065, 1.872537, 0.07450981, 0, 1, 1,
0.3690635, 0.824513, 2.236689, 0.07843138, 0, 1, 1,
0.3726809, 0.554656, -1.478705, 0.08627451, 0, 1, 1,
0.3756025, 0.4554948, 0.4458683, 0.09019608, 0, 1, 1,
0.3814662, -1.60657, 2.457061, 0.09803922, 0, 1, 1,
0.3849393, 0.8352528, 0.8592676, 0.1058824, 0, 1, 1,
0.3854783, -0.7666789, 1.648146, 0.1098039, 0, 1, 1,
0.3864847, 0.2494591, 1.167135, 0.1176471, 0, 1, 1,
0.387431, 1.42596, -0.5116376, 0.1215686, 0, 1, 1,
0.3888046, -0.9402097, 4.19778, 0.1294118, 0, 1, 1,
0.3918585, -1.907347, 4.678879, 0.1333333, 0, 1, 1,
0.3936411, 2.486493, 0.561501, 0.1411765, 0, 1, 1,
0.4007534, 0.01706729, 2.612922, 0.145098, 0, 1, 1,
0.416567, 2.30868, -0.9812648, 0.1529412, 0, 1, 1,
0.4172157, 0.4203205, 1.075841, 0.1568628, 0, 1, 1,
0.4182836, 1.399344, -0.3297047, 0.1647059, 0, 1, 1,
0.421506, 0.02840142, 2.194505, 0.1686275, 0, 1, 1,
0.4240689, 1.169632, 1.719944, 0.1764706, 0, 1, 1,
0.4283418, -0.0009740546, 0.8551531, 0.1803922, 0, 1, 1,
0.432499, 1.311446, 1.194197, 0.1882353, 0, 1, 1,
0.4354826, 0.2322558, 0.09581872, 0.1921569, 0, 1, 1,
0.4447994, -1.230771, 3.023918, 0.2, 0, 1, 1,
0.4451061, -0.4492582, 2.295312, 0.2078431, 0, 1, 1,
0.4491883, -0.122054, 1.075159, 0.2117647, 0, 1, 1,
0.4512636, 0.2704767, -0.3001466, 0.2196078, 0, 1, 1,
0.4534023, 0.5837701, 0.5060285, 0.2235294, 0, 1, 1,
0.4599735, 0.6862538, 0.3504108, 0.2313726, 0, 1, 1,
0.4602101, 0.0735851, 1.677943, 0.2352941, 0, 1, 1,
0.4605452, -0.7461274, 2.516706, 0.2431373, 0, 1, 1,
0.4616569, -0.5504541, 2.955605, 0.2470588, 0, 1, 1,
0.4649737, -0.6932908, 3.119927, 0.254902, 0, 1, 1,
0.4703811, -0.1718892, 2.243602, 0.2588235, 0, 1, 1,
0.4726132, 1.112957, 0.1524329, 0.2666667, 0, 1, 1,
0.4752078, 1.313717, 0.6261293, 0.2705882, 0, 1, 1,
0.4767664, -1.028209, 3.839346, 0.2784314, 0, 1, 1,
0.4775369, 1.788054, 1.40088, 0.282353, 0, 1, 1,
0.4802781, 0.01597893, 0.9739802, 0.2901961, 0, 1, 1,
0.4807835, 0.3717513, 0.8720481, 0.2941177, 0, 1, 1,
0.4830645, -0.3349032, 1.986856, 0.3019608, 0, 1, 1,
0.4836677, 1.51171, 2.017195, 0.3098039, 0, 1, 1,
0.4873052, -0.1210122, 0.1703434, 0.3137255, 0, 1, 1,
0.4873284, 0.4725647, -0.5873936, 0.3215686, 0, 1, 1,
0.4886105, -0.9084772, 3.955538, 0.3254902, 0, 1, 1,
0.4896674, 1.006131, 0.5749938, 0.3333333, 0, 1, 1,
0.4959301, -0.1771396, 2.437905, 0.3372549, 0, 1, 1,
0.4959624, -0.5594532, 2.058166, 0.345098, 0, 1, 1,
0.4976022, 0.9052818, 1.895656, 0.3490196, 0, 1, 1,
0.501938, 0.3704461, 0.7556325, 0.3568628, 0, 1, 1,
0.5019739, -0.5929841, 0.3728563, 0.3607843, 0, 1, 1,
0.5082777, 0.1635883, -0.2610068, 0.3686275, 0, 1, 1,
0.5099694, -0.3897998, 0.3883612, 0.372549, 0, 1, 1,
0.5161233, -0.2500737, 1.901735, 0.3803922, 0, 1, 1,
0.521766, -0.3992158, 2.444491, 0.3843137, 0, 1, 1,
0.5283489, 0.07891107, 2.14465, 0.3921569, 0, 1, 1,
0.5292636, -0.1449721, 0.04761468, 0.3960784, 0, 1, 1,
0.5299997, 0.3886125, -0.1561714, 0.4039216, 0, 1, 1,
0.5326104, -0.3483841, 2.400694, 0.4117647, 0, 1, 1,
0.5335413, -0.4717495, 4.052161, 0.4156863, 0, 1, 1,
0.5391853, 0.4784035, 0.03631236, 0.4235294, 0, 1, 1,
0.5448491, -0.5087844, 2.906419, 0.427451, 0, 1, 1,
0.5451279, -0.588913, 3.150609, 0.4352941, 0, 1, 1,
0.5471969, 1.36236, 0.6884903, 0.4392157, 0, 1, 1,
0.5485487, -2.220037, 3.036984, 0.4470588, 0, 1, 1,
0.5485913, -0.3065251, 3.386643, 0.4509804, 0, 1, 1,
0.5517554, 1.549698, 0.6371404, 0.4588235, 0, 1, 1,
0.5539837, 0.3915502, 1.026469, 0.4627451, 0, 1, 1,
0.5541641, -0.5551699, 2.498287, 0.4705882, 0, 1, 1,
0.5576656, -1.173811, 2.529816, 0.4745098, 0, 1, 1,
0.5626917, 0.9046464, 1.327369, 0.4823529, 0, 1, 1,
0.5671283, -1.577523, 2.413112, 0.4862745, 0, 1, 1,
0.5692213, -1.212823, 3.471193, 0.4941176, 0, 1, 1,
0.5813743, 0.2122812, 0.1889323, 0.5019608, 0, 1, 1,
0.5819246, 0.567869, 0.8478054, 0.5058824, 0, 1, 1,
0.5829009, 0.7970905, 0.14213, 0.5137255, 0, 1, 1,
0.5870332, 0.5719577, 2.00623, 0.5176471, 0, 1, 1,
0.5892288, -0.1034013, 0.1983298, 0.5254902, 0, 1, 1,
0.6014034, -0.636349, 4.096923, 0.5294118, 0, 1, 1,
0.602109, -0.698523, 3.301631, 0.5372549, 0, 1, 1,
0.6025674, -0.2340685, 1.843294, 0.5411765, 0, 1, 1,
0.6041617, 0.9705003, 0.552246, 0.5490196, 0, 1, 1,
0.6044806, -0.06406523, 1.748969, 0.5529412, 0, 1, 1,
0.6163929, -0.6085212, 2.521038, 0.5607843, 0, 1, 1,
0.6195771, -0.7150257, 2.620546, 0.5647059, 0, 1, 1,
0.6196986, 0.5126203, 1.778596, 0.572549, 0, 1, 1,
0.6262947, -1.03143, 2.916259, 0.5764706, 0, 1, 1,
0.6287063, -1.757508, 2.229564, 0.5843138, 0, 1, 1,
0.6361629, 1.287601, 0.7409753, 0.5882353, 0, 1, 1,
0.6421251, -0.8055915, 3.320299, 0.5960785, 0, 1, 1,
0.6442133, -0.001587751, 2.359143, 0.6039216, 0, 1, 1,
0.6501598, -0.9093928, 1.498564, 0.6078432, 0, 1, 1,
0.6548604, 1.061853, 0.03836325, 0.6156863, 0, 1, 1,
0.6551108, -1.116816, 1.988267, 0.6196079, 0, 1, 1,
0.6560518, 1.661376, 0.1927999, 0.627451, 0, 1, 1,
0.6570075, -1.218946, 3.015692, 0.6313726, 0, 1, 1,
0.6571888, 2.705559, 1.6403, 0.6392157, 0, 1, 1,
0.6593174, 0.3052529, 1.455138, 0.6431373, 0, 1, 1,
0.6597072, -0.5629123, 3.571483, 0.6509804, 0, 1, 1,
0.660549, 0.9400231, 1.252057, 0.654902, 0, 1, 1,
0.661687, 1.178504, -0.3929219, 0.6627451, 0, 1, 1,
0.6652995, 0.5661542, 0.3061628, 0.6666667, 0, 1, 1,
0.6693975, 0.1807193, 1.218318, 0.6745098, 0, 1, 1,
0.6718611, -0.9733772, 2.618103, 0.6784314, 0, 1, 1,
0.6725121, 0.5169633, 1.519648, 0.6862745, 0, 1, 1,
0.6770294, -1.232667, 3.552538, 0.6901961, 0, 1, 1,
0.6839437, 0.3619501, 0.6220117, 0.6980392, 0, 1, 1,
0.6865376, -0.05450597, 0.9791619, 0.7058824, 0, 1, 1,
0.6938519, -1.5545, 3.607166, 0.7098039, 0, 1, 1,
0.6943347, -1.160919, 2.45191, 0.7176471, 0, 1, 1,
0.705296, 0.4761815, 3.257713, 0.7215686, 0, 1, 1,
0.7071662, 0.6737106, -0.6651217, 0.7294118, 0, 1, 1,
0.7082496, -0.8806567, 2.549958, 0.7333333, 0, 1, 1,
0.7190213, -1.019828, 4.558117, 0.7411765, 0, 1, 1,
0.7192286, 0.4544599, 2.349082, 0.7450981, 0, 1, 1,
0.7235857, 0.6747584, -0.4325213, 0.7529412, 0, 1, 1,
0.7254837, 0.1918017, 1.222077, 0.7568628, 0, 1, 1,
0.7275982, -1.128638, 1.404644, 0.7647059, 0, 1, 1,
0.7417625, -0.5198084, 1.476153, 0.7686275, 0, 1, 1,
0.7437755, -1.142543, 3.803682, 0.7764706, 0, 1, 1,
0.7452757, -2.048919, 2.400642, 0.7803922, 0, 1, 1,
0.7508216, -0.7570283, 2.155947, 0.7882353, 0, 1, 1,
0.7539763, -0.714536, 2.210524, 0.7921569, 0, 1, 1,
0.7553927, 0.1995043, 0.1255516, 0.8, 0, 1, 1,
0.7661511, 0.2016856, 3.320637, 0.8078431, 0, 1, 1,
0.7713814, 2.260667, 0.9284189, 0.8117647, 0, 1, 1,
0.7878219, 0.8046828, -0.1172222, 0.8196079, 0, 1, 1,
0.8018157, -0.359479, 2.428727, 0.8235294, 0, 1, 1,
0.8021415, -0.7754606, 0.8217126, 0.8313726, 0, 1, 1,
0.80564, 0.5298278, 1.516532, 0.8352941, 0, 1, 1,
0.8092863, -0.08792665, -0.1620017, 0.8431373, 0, 1, 1,
0.8137164, -0.5933011, 2.707703, 0.8470588, 0, 1, 1,
0.8182707, 0.6504462, -0.115677, 0.854902, 0, 1, 1,
0.8234867, -0.1418105, 1.291216, 0.8588235, 0, 1, 1,
0.8253769, 0.8150077, 0.6976212, 0.8666667, 0, 1, 1,
0.8262863, -0.706485, 3.286336, 0.8705882, 0, 1, 1,
0.8264689, -0.5320839, 1.388305, 0.8784314, 0, 1, 1,
0.8317811, 0.9167234, 0.8703139, 0.8823529, 0, 1, 1,
0.832261, 0.4386896, 1.247585, 0.8901961, 0, 1, 1,
0.8397499, 0.1961912, 1.257529, 0.8941177, 0, 1, 1,
0.8441223, -0.2411546, 0.09139428, 0.9019608, 0, 1, 1,
0.8462731, 0.2403044, 2.226881, 0.9098039, 0, 1, 1,
0.8535482, -0.2437602, 3.258819, 0.9137255, 0, 1, 1,
0.8566613, -1.14156, 0.7966509, 0.9215686, 0, 1, 1,
0.8638837, -0.194775, 1.831119, 0.9254902, 0, 1, 1,
0.8658829, -1.787461, 3.149447, 0.9333333, 0, 1, 1,
0.867283, 0.2453325, 2.073834, 0.9372549, 0, 1, 1,
0.8793178, -0.591549, 1.711435, 0.945098, 0, 1, 1,
0.880792, -1.089715, 2.223797, 0.9490196, 0, 1, 1,
0.8925377, -1.203241, 2.605844, 0.9568627, 0, 1, 1,
0.8952984, -2.288134, 2.600264, 0.9607843, 0, 1, 1,
0.9086991, 0.8438551, -1.989059, 0.9686275, 0, 1, 1,
0.9089344, 0.9649284, 2.569273, 0.972549, 0, 1, 1,
0.9089917, 1.672231, 0.1617242, 0.9803922, 0, 1, 1,
0.9117836, 0.8266982, -0.760466, 0.9843137, 0, 1, 1,
0.9146535, 0.6868372, 0.2722101, 0.9921569, 0, 1, 1,
0.9314469, -0.5576224, 2.798661, 0.9960784, 0, 1, 1,
0.9319943, -1.090403, 2.79951, 1, 0, 0.9960784, 1,
0.9343614, -0.8443894, 3.504671, 1, 0, 0.9882353, 1,
0.9441369, -0.1524789, 2.782122, 1, 0, 0.9843137, 1,
0.957021, 1.711272, -0.05331845, 1, 0, 0.9764706, 1,
0.9698125, -0.170553, 1.966813, 1, 0, 0.972549, 1,
0.9717296, 0.3278363, 0.9149641, 1, 0, 0.9647059, 1,
0.9722708, -0.6949118, 2.174614, 1, 0, 0.9607843, 1,
0.9730087, 1.417395, 1.909397, 1, 0, 0.9529412, 1,
0.9766909, 0.1942031, 2.132891, 1, 0, 0.9490196, 1,
0.9877064, -0.2087735, 2.82562, 1, 0, 0.9411765, 1,
0.988554, -0.2771134, 2.18805, 1, 0, 0.9372549, 1,
0.9970937, 0.8269188, 0.6108969, 1, 0, 0.9294118, 1,
0.9980968, -0.05207876, 1.443748, 1, 0, 0.9254902, 1,
0.9993533, 0.05865085, -0.4482753, 1, 0, 0.9176471, 1,
1.001965, -1.911344, 3.588514, 1, 0, 0.9137255, 1,
1.004206, 0.5087615, 0.7361162, 1, 0, 0.9058824, 1,
1.007724, -0.9716234, 0.2969416, 1, 0, 0.9019608, 1,
1.014829, 1.14023, 0.9978966, 1, 0, 0.8941177, 1,
1.017698, 0.5837257, 0.6388731, 1, 0, 0.8862745, 1,
1.019505, -0.1591423, 1.53307, 1, 0, 0.8823529, 1,
1.019831, -2.467155, 2.82924, 1, 0, 0.8745098, 1,
1.0223, 1.267225, 0.4992301, 1, 0, 0.8705882, 1,
1.023268, 1.322326, 1.768598, 1, 0, 0.8627451, 1,
1.032496, 1.530448, -0.5014458, 1, 0, 0.8588235, 1,
1.03318, 0.6416101, 2.125302, 1, 0, 0.8509804, 1,
1.035607, 1.221266, 0.6578482, 1, 0, 0.8470588, 1,
1.036795, -0.4826787, 1.734376, 1, 0, 0.8392157, 1,
1.04496, -1.423041, 0.4681798, 1, 0, 0.8352941, 1,
1.049574, -1.273216, 3.20493, 1, 0, 0.827451, 1,
1.058342, -0.2500217, 0.3129839, 1, 0, 0.8235294, 1,
1.066737, 0.4851463, 0.3506404, 1, 0, 0.8156863, 1,
1.069637, -0.4513194, 2.757942, 1, 0, 0.8117647, 1,
1.072438, -0.5041796, 1.814314, 1, 0, 0.8039216, 1,
1.082161, 1.041488, 1.774971, 1, 0, 0.7960784, 1,
1.095064, 0.3412724, 2.651934, 1, 0, 0.7921569, 1,
1.095136, -0.4974778, 0.9945549, 1, 0, 0.7843137, 1,
1.102719, -0.4155245, 0.9866127, 1, 0, 0.7803922, 1,
1.110647, 0.4722021, -1.162443, 1, 0, 0.772549, 1,
1.128326, -0.8204765, 3.512699, 1, 0, 0.7686275, 1,
1.132763, -1.528015, 2.572746, 1, 0, 0.7607843, 1,
1.136555, 0.2253511, 0.5870237, 1, 0, 0.7568628, 1,
1.158584, 0.5424294, 0.3724448, 1, 0, 0.7490196, 1,
1.163444, 0.4451466, 2.768092, 1, 0, 0.7450981, 1,
1.16645, 3.234305, 0.5087003, 1, 0, 0.7372549, 1,
1.169189, -0.8502136, 2.416253, 1, 0, 0.7333333, 1,
1.171898, -0.606669, 1.149415, 1, 0, 0.7254902, 1,
1.179282, 0.4353611, 2.40106, 1, 0, 0.7215686, 1,
1.182328, -0.4702289, 3.00514, 1, 0, 0.7137255, 1,
1.186092, 0.4117292, 0.4487431, 1, 0, 0.7098039, 1,
1.186354, 1.14467, 1.696169, 1, 0, 0.7019608, 1,
1.195911, -1.252474, 1.581191, 1, 0, 0.6941177, 1,
1.207336, -1.065296, 2.012195, 1, 0, 0.6901961, 1,
1.212721, 0.8036875, 0.4295281, 1, 0, 0.682353, 1,
1.212897, -1.117229, 1.953635, 1, 0, 0.6784314, 1,
1.21591, -1.295511, 1.317433, 1, 0, 0.6705883, 1,
1.216025, 1.774241, 1.040301, 1, 0, 0.6666667, 1,
1.223394, -2.352271, 1.590797, 1, 0, 0.6588235, 1,
1.224538, 0.4864118, 1.280764, 1, 0, 0.654902, 1,
1.231546, 0.9675997, 2.327692, 1, 0, 0.6470588, 1,
1.236248, -1.771062, 1.003282, 1, 0, 0.6431373, 1,
1.237753, 1.067244, 2.255639, 1, 0, 0.6352941, 1,
1.238849, 0.2338868, 1.775303, 1, 0, 0.6313726, 1,
1.244301, -0.779525, 2.714204, 1, 0, 0.6235294, 1,
1.250827, -1.348473, 2.178694, 1, 0, 0.6196079, 1,
1.254068, 1.196389, 1.448494, 1, 0, 0.6117647, 1,
1.257748, 0.2064095, 0.4534396, 1, 0, 0.6078432, 1,
1.26283, -2.250548, 3.35286, 1, 0, 0.6, 1,
1.265421, 0.9337294, -0.6296237, 1, 0, 0.5921569, 1,
1.273275, 0.2330079, 1.247693, 1, 0, 0.5882353, 1,
1.276409, 0.06196183, 0.4458074, 1, 0, 0.5803922, 1,
1.285113, 0.8280437, 0.1721915, 1, 0, 0.5764706, 1,
1.304789, -1.726294, 1.44567, 1, 0, 0.5686275, 1,
1.315034, -0.1934156, 2.157061, 1, 0, 0.5647059, 1,
1.316818, -2.687798, 2.845168, 1, 0, 0.5568628, 1,
1.33291, 1.124154, 1.881865, 1, 0, 0.5529412, 1,
1.334415, 1.680328, 1.43138, 1, 0, 0.5450981, 1,
1.339451, 0.1087071, 1.081825, 1, 0, 0.5411765, 1,
1.345304, -0.154733, 2.254616, 1, 0, 0.5333334, 1,
1.347351, -0.9995999, 1.796238, 1, 0, 0.5294118, 1,
1.354908, -0.3556592, 2.781598, 1, 0, 0.5215687, 1,
1.356002, -0.1027301, -0.08655093, 1, 0, 0.5176471, 1,
1.371547, 0.008859294, 2.421745, 1, 0, 0.509804, 1,
1.379449, 0.02726934, 0.1949041, 1, 0, 0.5058824, 1,
1.381145, 0.1745791, -0.1506308, 1, 0, 0.4980392, 1,
1.385957, 0.578232, -0.06037473, 1, 0, 0.4901961, 1,
1.386978, -1.789229, 3.220652, 1, 0, 0.4862745, 1,
1.390347, -0.9705823, 1.562254, 1, 0, 0.4784314, 1,
1.392693, -0.4069744, 3.842562, 1, 0, 0.4745098, 1,
1.393597, 1.082452, 2.143386, 1, 0, 0.4666667, 1,
1.41316, -0.616402, 0.6616272, 1, 0, 0.4627451, 1,
1.416228, -0.4926284, 3.288321, 1, 0, 0.454902, 1,
1.422434, 0.7129639, 1.459453, 1, 0, 0.4509804, 1,
1.423116, -0.3987996, 0.8597122, 1, 0, 0.4431373, 1,
1.423323, -1.37666, 2.81024, 1, 0, 0.4392157, 1,
1.446043, 0.1943732, 1.533867, 1, 0, 0.4313726, 1,
1.451037, -1.889645, 2.218385, 1, 0, 0.427451, 1,
1.453175, 0.7406185, -0.3914183, 1, 0, 0.4196078, 1,
1.494052, 0.6666939, 1.868183, 1, 0, 0.4156863, 1,
1.511074, 0.5905923, 0.8676234, 1, 0, 0.4078431, 1,
1.511707, 0.03392652, 0.9310869, 1, 0, 0.4039216, 1,
1.525983, 0.6814017, 0.1141947, 1, 0, 0.3960784, 1,
1.52964, -0.5329188, 1.593597, 1, 0, 0.3882353, 1,
1.532614, -1.122739, 3.350819, 1, 0, 0.3843137, 1,
1.546406, -0.07441348, 1.25945, 1, 0, 0.3764706, 1,
1.555508, -0.8173817, 1.716172, 1, 0, 0.372549, 1,
1.558096, 0.1281852, 1.086014, 1, 0, 0.3647059, 1,
1.583845, 1.193188, 2.302722, 1, 0, 0.3607843, 1,
1.599388, -0.7127313, 3.601893, 1, 0, 0.3529412, 1,
1.599778, 1.749747, -0.1723376, 1, 0, 0.3490196, 1,
1.601794, -1.208095, 1.934991, 1, 0, 0.3411765, 1,
1.603546, -0.3270082, 1.635676, 1, 0, 0.3372549, 1,
1.626959, -0.16412, 1.918159, 1, 0, 0.3294118, 1,
1.644931, 0.8489788, 1.276421, 1, 0, 0.3254902, 1,
1.670484, -0.05983447, 0.971805, 1, 0, 0.3176471, 1,
1.679718, -0.7898079, 1.30357, 1, 0, 0.3137255, 1,
1.695708, 0.5489218, 0.4083354, 1, 0, 0.3058824, 1,
1.711939, -1.395614, 1.654518, 1, 0, 0.2980392, 1,
1.714048, 0.2528741, 2.534739, 1, 0, 0.2941177, 1,
1.749002, 0.5439571, 2.144443, 1, 0, 0.2862745, 1,
1.769799, 2.534304, 2.262046, 1, 0, 0.282353, 1,
1.780606, -0.4767648, 0.1390452, 1, 0, 0.2745098, 1,
1.802434, 1.965605, 0.4108974, 1, 0, 0.2705882, 1,
1.802526, 0.8729319, -0.4964499, 1, 0, 0.2627451, 1,
1.804944, 0.8799669, -0.07652316, 1, 0, 0.2588235, 1,
1.809482, -0.0969675, 3.736555, 1, 0, 0.2509804, 1,
1.844338, -1.247606, 2.596194, 1, 0, 0.2470588, 1,
1.845449, -0.2726174, 3.298093, 1, 0, 0.2392157, 1,
1.863925, 0.7082276, -0.831858, 1, 0, 0.2352941, 1,
1.86833, 0.3901885, 1.450855, 1, 0, 0.227451, 1,
1.901065, 0.08025755, 2.425645, 1, 0, 0.2235294, 1,
1.912547, 0.3015725, 1.37483, 1, 0, 0.2156863, 1,
1.923173, -0.004944571, 0.2160165, 1, 0, 0.2117647, 1,
1.924704, -0.00446591, 2.632884, 1, 0, 0.2039216, 1,
1.92867, -0.06442287, 0.3414832, 1, 0, 0.1960784, 1,
1.956854, -1.83456, 1.702375, 1, 0, 0.1921569, 1,
1.9682, -0.3251557, 1.404564, 1, 0, 0.1843137, 1,
1.969953, 0.649268, 1.403724, 1, 0, 0.1803922, 1,
1.982094, 2.323906, 2.113642, 1, 0, 0.172549, 1,
1.988159, -1.614546, 2.805247, 1, 0, 0.1686275, 1,
2.001212, 0.1816869, 1.538446, 1, 0, 0.1607843, 1,
2.010987, 1.901767, -0.1100176, 1, 0, 0.1568628, 1,
2.023467, 1.770548, 0.7256083, 1, 0, 0.1490196, 1,
2.028381, -0.7421213, 3.321413, 1, 0, 0.145098, 1,
2.070786, 0.01906512, 1.326376, 1, 0, 0.1372549, 1,
2.096588, 2.21721, 0.5820999, 1, 0, 0.1333333, 1,
2.100899, -0.290106, 2.196107, 1, 0, 0.1254902, 1,
2.111382, 1.959171, -0.6386901, 1, 0, 0.1215686, 1,
2.126348, -0.01474536, 0.1732278, 1, 0, 0.1137255, 1,
2.137076, 2.390128, 0.9742507, 1, 0, 0.1098039, 1,
2.142363, -0.1836545, 0.6133404, 1, 0, 0.1019608, 1,
2.171437, 1.614244, 2.097097, 1, 0, 0.09411765, 1,
2.244707, -1.923284, 2.729603, 1, 0, 0.09019608, 1,
2.313773, -2.193761, 3.562198, 1, 0, 0.08235294, 1,
2.323558, 0.4649175, -0.5377095, 1, 0, 0.07843138, 1,
2.327717, 0.7670218, 0.8281996, 1, 0, 0.07058824, 1,
2.378652, -0.7475305, 3.336645, 1, 0, 0.06666667, 1,
2.426852, -0.06657818, 1.139543, 1, 0, 0.05882353, 1,
2.430532, 0.08740047, -0.2677256, 1, 0, 0.05490196, 1,
2.478705, 0.05875421, 1.156551, 1, 0, 0.04705882, 1,
2.524142, 0.4658479, 1.568801, 1, 0, 0.04313726, 1,
2.534007, -0.7364483, 2.622607, 1, 0, 0.03529412, 1,
2.658823, 0.3569371, 1.283537, 1, 0, 0.03137255, 1,
2.871439, -0.8289898, 2.992959, 1, 0, 0.02352941, 1,
2.897185, -0.6788404, 1.316072, 1, 0, 0.01960784, 1,
2.987085, -0.09429302, 1.431961, 1, 0, 0.01176471, 1,
3.17402, 0.1106819, 0.9712858, 1, 0, 0.007843138, 1
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
0.04025066, -5.188675, -7.311065, 0, -0.5, 0.5, 0.5,
0.04025066, -5.188675, -7.311065, 1, -0.5, 0.5, 0.5,
0.04025066, -5.188675, -7.311065, 1, 1.5, 0.5, 0.5,
0.04025066, -5.188675, -7.311065, 0, 1.5, 0.5, 0.5
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
-4.155866, -0.366798, -7.311065, 0, -0.5, 0.5, 0.5,
-4.155866, -0.366798, -7.311065, 1, -0.5, 0.5, 0.5,
-4.155866, -0.366798, -7.311065, 1, 1.5, 0.5, 0.5,
-4.155866, -0.366798, -7.311065, 0, 1.5, 0.5, 0.5
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
-4.155866, -5.188675, 0.01711822, 0, -0.5, 0.5, 0.5,
-4.155866, -5.188675, 0.01711822, 1, -0.5, 0.5, 0.5,
-4.155866, -5.188675, 0.01711822, 1, 1.5, 0.5, 0.5,
-4.155866, -5.188675, 0.01711822, 0, 1.5, 0.5, 0.5
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
-3, -4.075934, -5.619946,
3, -4.075934, -5.619946,
-3, -4.075934, -5.619946,
-3, -4.261391, -5.901799,
-2, -4.075934, -5.619946,
-2, -4.261391, -5.901799,
-1, -4.075934, -5.619946,
-1, -4.261391, -5.901799,
0, -4.075934, -5.619946,
0, -4.261391, -5.901799,
1, -4.075934, -5.619946,
1, -4.261391, -5.901799,
2, -4.075934, -5.619946,
2, -4.261391, -5.901799,
3, -4.075934, -5.619946,
3, -4.261391, -5.901799
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
-3, -4.632305, -6.465506, 0, -0.5, 0.5, 0.5,
-3, -4.632305, -6.465506, 1, -0.5, 0.5, 0.5,
-3, -4.632305, -6.465506, 1, 1.5, 0.5, 0.5,
-3, -4.632305, -6.465506, 0, 1.5, 0.5, 0.5,
-2, -4.632305, -6.465506, 0, -0.5, 0.5, 0.5,
-2, -4.632305, -6.465506, 1, -0.5, 0.5, 0.5,
-2, -4.632305, -6.465506, 1, 1.5, 0.5, 0.5,
-2, -4.632305, -6.465506, 0, 1.5, 0.5, 0.5,
-1, -4.632305, -6.465506, 0, -0.5, 0.5, 0.5,
-1, -4.632305, -6.465506, 1, -0.5, 0.5, 0.5,
-1, -4.632305, -6.465506, 1, 1.5, 0.5, 0.5,
-1, -4.632305, -6.465506, 0, 1.5, 0.5, 0.5,
0, -4.632305, -6.465506, 0, -0.5, 0.5, 0.5,
0, -4.632305, -6.465506, 1, -0.5, 0.5, 0.5,
0, -4.632305, -6.465506, 1, 1.5, 0.5, 0.5,
0, -4.632305, -6.465506, 0, 1.5, 0.5, 0.5,
1, -4.632305, -6.465506, 0, -0.5, 0.5, 0.5,
1, -4.632305, -6.465506, 1, -0.5, 0.5, 0.5,
1, -4.632305, -6.465506, 1, 1.5, 0.5, 0.5,
1, -4.632305, -6.465506, 0, 1.5, 0.5, 0.5,
2, -4.632305, -6.465506, 0, -0.5, 0.5, 0.5,
2, -4.632305, -6.465506, 1, -0.5, 0.5, 0.5,
2, -4.632305, -6.465506, 1, 1.5, 0.5, 0.5,
2, -4.632305, -6.465506, 0, 1.5, 0.5, 0.5,
3, -4.632305, -6.465506, 0, -0.5, 0.5, 0.5,
3, -4.632305, -6.465506, 1, -0.5, 0.5, 0.5,
3, -4.632305, -6.465506, 1, 1.5, 0.5, 0.5,
3, -4.632305, -6.465506, 0, 1.5, 0.5, 0.5
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
-3.187531, -2, -5.619946,
-3.187531, 2, -5.619946,
-3.187531, -2, -5.619946,
-3.348921, -2, -5.901799,
-3.187531, 0, -5.619946,
-3.348921, 0, -5.901799,
-3.187531, 2, -5.619946,
-3.348921, 2, -5.901799
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
-3.671699, -2, -6.465506, 0, -0.5, 0.5, 0.5,
-3.671699, -2, -6.465506, 1, -0.5, 0.5, 0.5,
-3.671699, -2, -6.465506, 1, 1.5, 0.5, 0.5,
-3.671699, -2, -6.465506, 0, 1.5, 0.5, 0.5,
-3.671699, 0, -6.465506, 0, -0.5, 0.5, 0.5,
-3.671699, 0, -6.465506, 1, -0.5, 0.5, 0.5,
-3.671699, 0, -6.465506, 1, 1.5, 0.5, 0.5,
-3.671699, 0, -6.465506, 0, 1.5, 0.5, 0.5,
-3.671699, 2, -6.465506, 0, -0.5, 0.5, 0.5,
-3.671699, 2, -6.465506, 1, -0.5, 0.5, 0.5,
-3.671699, 2, -6.465506, 1, 1.5, 0.5, 0.5,
-3.671699, 2, -6.465506, 0, 1.5, 0.5, 0.5
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
-3.187531, -4.075934, -4,
-3.187531, -4.075934, 4,
-3.187531, -4.075934, -4,
-3.348921, -4.261391, -4,
-3.187531, -4.075934, -2,
-3.348921, -4.261391, -2,
-3.187531, -4.075934, 0,
-3.348921, -4.261391, 0,
-3.187531, -4.075934, 2,
-3.348921, -4.261391, 2,
-3.187531, -4.075934, 4,
-3.348921, -4.261391, 4
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
-3.671699, -4.632305, -4, 0, -0.5, 0.5, 0.5,
-3.671699, -4.632305, -4, 1, -0.5, 0.5, 0.5,
-3.671699, -4.632305, -4, 1, 1.5, 0.5, 0.5,
-3.671699, -4.632305, -4, 0, 1.5, 0.5, 0.5,
-3.671699, -4.632305, -2, 0, -0.5, 0.5, 0.5,
-3.671699, -4.632305, -2, 1, -0.5, 0.5, 0.5,
-3.671699, -4.632305, -2, 1, 1.5, 0.5, 0.5,
-3.671699, -4.632305, -2, 0, 1.5, 0.5, 0.5,
-3.671699, -4.632305, 0, 0, -0.5, 0.5, 0.5,
-3.671699, -4.632305, 0, 1, -0.5, 0.5, 0.5,
-3.671699, -4.632305, 0, 1, 1.5, 0.5, 0.5,
-3.671699, -4.632305, 0, 0, 1.5, 0.5, 0.5,
-3.671699, -4.632305, 2, 0, -0.5, 0.5, 0.5,
-3.671699, -4.632305, 2, 1, -0.5, 0.5, 0.5,
-3.671699, -4.632305, 2, 1, 1.5, 0.5, 0.5,
-3.671699, -4.632305, 2, 0, 1.5, 0.5, 0.5,
-3.671699, -4.632305, 4, 0, -0.5, 0.5, 0.5,
-3.671699, -4.632305, 4, 1, -0.5, 0.5, 0.5,
-3.671699, -4.632305, 4, 1, 1.5, 0.5, 0.5,
-3.671699, -4.632305, 4, 0, 1.5, 0.5, 0.5
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
-3.187531, -4.075934, -5.619946,
-3.187531, 3.342339, -5.619946,
-3.187531, -4.075934, 5.654182,
-3.187531, 3.342339, 5.654182,
-3.187531, -4.075934, -5.619946,
-3.187531, -4.075934, 5.654182,
-3.187531, 3.342339, -5.619946,
-3.187531, 3.342339, 5.654182,
-3.187531, -4.075934, -5.619946,
3.268033, -4.075934, -5.619946,
-3.187531, -4.075934, 5.654182,
3.268033, -4.075934, 5.654182,
-3.187531, 3.342339, -5.619946,
3.268033, 3.342339, -5.619946,
-3.187531, 3.342339, 5.654182,
3.268033, 3.342339, 5.654182,
3.268033, -4.075934, -5.619946,
3.268033, 3.342339, -5.619946,
3.268033, -4.075934, 5.654182,
3.268033, 3.342339, 5.654182,
3.268033, -4.075934, -5.619946,
3.268033, -4.075934, 5.654182,
3.268033, 3.342339, -5.619946,
3.268033, 3.342339, 5.654182
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
var radius = 7.988518;
var distance = 35.54182;
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
mvMatrix.translate( -0.04025066, 0.366798, -0.01711822 );
mvMatrix.scale( 1.337969, 1.164333, 0.7661207 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.54182);
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
thiourea<-read.table("thiourea.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-thiourea$V2
```

```
## Error in eval(expr, envir, enclos): object 'thiourea' not found
```

```r
y<-thiourea$V3
```

```
## Error in eval(expr, envir, enclos): object 'thiourea' not found
```

```r
z<-thiourea$V4
```

```
## Error in eval(expr, envir, enclos): object 'thiourea' not found
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
-3.093518, -0.323231, -0.7236404, 0, 0, 1, 1, 1,
-3.092501, -0.9123083, -3.837786, 1, 0, 0, 1, 1,
-2.869306, 1.221985, -2.116041, 1, 0, 0, 1, 1,
-2.838791, -0.7050921, -1.460148, 1, 0, 0, 1, 1,
-2.782479, -0.01431025, -1.996165, 1, 0, 0, 1, 1,
-2.625036, 0.6983088, -1.208406, 1, 0, 0, 1, 1,
-2.620761, -1.350886, -3.372579, 0, 0, 0, 1, 1,
-2.612591, 0.3206567, -1.402825, 0, 0, 0, 1, 1,
-2.605239, -0.6940619, -1.474525, 0, 0, 0, 1, 1,
-2.495976, 0.4863583, -1.325111, 0, 0, 0, 1, 1,
-2.478326, -1.970788, -1.840002, 0, 0, 0, 1, 1,
-2.453744, -0.6693162, -2.129323, 0, 0, 0, 1, 1,
-2.437615, -1.403826, -1.972541, 0, 0, 0, 1, 1,
-2.385211, -0.5520507, 1.067652, 1, 1, 1, 1, 1,
-2.359557, -1.416735, -3.060964, 1, 1, 1, 1, 1,
-2.356068, -0.4866914, -1.443355, 1, 1, 1, 1, 1,
-2.303045, -0.3399418, -1.750964, 1, 1, 1, 1, 1,
-2.270393, 0.6380754, -1.253365, 1, 1, 1, 1, 1,
-2.259465, 0.5795592, 1.339158, 1, 1, 1, 1, 1,
-2.239853, -0.3329693, -1.422964, 1, 1, 1, 1, 1,
-2.225519, -1.288323, -1.220696, 1, 1, 1, 1, 1,
-2.22401, 1.397168, 0.1253319, 1, 1, 1, 1, 1,
-2.20326, 0.3143705, -1.533707, 1, 1, 1, 1, 1,
-2.201778, 2.314967, -0.8127372, 1, 1, 1, 1, 1,
-2.19636, 0.2048765, -1.261233, 1, 1, 1, 1, 1,
-2.16007, -1.020594, -2.751168, 1, 1, 1, 1, 1,
-2.119713, 0.8326731, 1.203465, 1, 1, 1, 1, 1,
-2.106802, 0.04554705, -2.556432, 1, 1, 1, 1, 1,
-2.100873, 0.7594486, -1.150852, 0, 0, 1, 1, 1,
-2.099971, -0.195653, -0.1478853, 1, 0, 0, 1, 1,
-2.097348, 0.9823347, -0.7400371, 1, 0, 0, 1, 1,
-2.090071, -1.256056, -2.793097, 1, 0, 0, 1, 1,
-2.069004, -0.7196749, -1.615028, 1, 0, 0, 1, 1,
-2.038723, 0.2235688, -2.894076, 1, 0, 0, 1, 1,
-2.026571, 1.023584, -1.784789, 0, 0, 0, 1, 1,
-1.964931, 0.7978848, -1.142927, 0, 0, 0, 1, 1,
-1.938796, 0.2128296, -2.28571, 0, 0, 0, 1, 1,
-1.926571, -1.196386, -2.80108, 0, 0, 0, 1, 1,
-1.923021, -0.07984293, -1.10723, 0, 0, 0, 1, 1,
-1.918768, 0.04148826, -1.353792, 0, 0, 0, 1, 1,
-1.893551, 0.1330506, -2.549678, 0, 0, 0, 1, 1,
-1.892701, 1.00216, -0.1505747, 1, 1, 1, 1, 1,
-1.880531, 0.8904567, -2.240102, 1, 1, 1, 1, 1,
-1.877009, -0.9679939, -4.067719, 1, 1, 1, 1, 1,
-1.860161, 0.09292895, -1.343625, 1, 1, 1, 1, 1,
-1.838169, -0.624955, -1.560011, 1, 1, 1, 1, 1,
-1.837882, -0.9463917, -1.770867, 1, 1, 1, 1, 1,
-1.814196, -1.186825, -0.8733836, 1, 1, 1, 1, 1,
-1.794126, -0.9382012, -1.567809, 1, 1, 1, 1, 1,
-1.788978, 0.4226158, -2.288319, 1, 1, 1, 1, 1,
-1.787597, -0.5877244, -3.481744, 1, 1, 1, 1, 1,
-1.766244, 0.2903071, -1.095727, 1, 1, 1, 1, 1,
-1.759527, 0.2134532, -0.3365899, 1, 1, 1, 1, 1,
-1.745103, 0.2361038, -1.862805, 1, 1, 1, 1, 1,
-1.73737, 0.6555627, -1.542764, 1, 1, 1, 1, 1,
-1.727758, -0.3312382, -0.4482845, 1, 1, 1, 1, 1,
-1.717331, 0.2959903, -0.2892979, 0, 0, 1, 1, 1,
-1.710558, -0.6236446, -3.389266, 1, 0, 0, 1, 1,
-1.707106, 0.3759361, -2.256422, 1, 0, 0, 1, 1,
-1.706426, -1.861677, -2.694654, 1, 0, 0, 1, 1,
-1.705819, -1.807771, -2.446394, 1, 0, 0, 1, 1,
-1.702361, -0.00871488, -1.787252, 1, 0, 0, 1, 1,
-1.685059, -0.7491696, -2.614885, 0, 0, 0, 1, 1,
-1.681638, 1.223176, -1.953998, 0, 0, 0, 1, 1,
-1.679218, -0.000898702, -1.044551, 0, 0, 0, 1, 1,
-1.646385, -1.752926, -3.514358, 0, 0, 0, 1, 1,
-1.635427, 0.940008, 1.094756, 0, 0, 0, 1, 1,
-1.631176, 0.2258277, -1.778634, 0, 0, 0, 1, 1,
-1.629459, 0.0255499, -2.169551, 0, 0, 0, 1, 1,
-1.629184, 0.7485938, -3.767297, 1, 1, 1, 1, 1,
-1.628093, 0.9824558, -1.086699, 1, 1, 1, 1, 1,
-1.620999, 1.427094, -0.9522275, 1, 1, 1, 1, 1,
-1.590363, 0.2571392, -1.241671, 1, 1, 1, 1, 1,
-1.587308, -1.447852, -1.286585, 1, 1, 1, 1, 1,
-1.583827, -0.8289943, -1.44165, 1, 1, 1, 1, 1,
-1.57271, -0.2408948, -1.897653, 1, 1, 1, 1, 1,
-1.572131, 0.2842036, -2.646164, 1, 1, 1, 1, 1,
-1.558896, 0.2699932, -2.747721, 1, 1, 1, 1, 1,
-1.548231, -0.07663728, -3.985005, 1, 1, 1, 1, 1,
-1.547766, -2.050196, -1.529005, 1, 1, 1, 1, 1,
-1.547644, 0.7004768, -1.442283, 1, 1, 1, 1, 1,
-1.54216, -0.2533624, -3.151825, 1, 1, 1, 1, 1,
-1.537396, 0.6661612, 0.6081133, 1, 1, 1, 1, 1,
-1.528093, 1.613454, 1.074589, 1, 1, 1, 1, 1,
-1.516745, -0.5168229, -2.814851, 0, 0, 1, 1, 1,
-1.493392, -0.7906825, -3.779878, 1, 0, 0, 1, 1,
-1.487458, -0.5186282, -2.52838, 1, 0, 0, 1, 1,
-1.485921, -0.2368927, 0.4564904, 1, 0, 0, 1, 1,
-1.478615, -1.038801, -1.811822, 1, 0, 0, 1, 1,
-1.476404, 1.492144, -0.1547488, 1, 0, 0, 1, 1,
-1.473387, -1.540087, -1.671572, 0, 0, 0, 1, 1,
-1.468082, -0.4516175, -1.895546, 0, 0, 0, 1, 1,
-1.461861, -0.7102977, -0.7179617, 0, 0, 0, 1, 1,
-1.461552, -1.055986, -0.9235893, 0, 0, 0, 1, 1,
-1.460876, -0.6844541, -2.696918, 0, 0, 0, 1, 1,
-1.459427, 1.104841, -1.059036, 0, 0, 0, 1, 1,
-1.454555, 0.3889362, -2.28972, 0, 0, 0, 1, 1,
-1.44535, -0.5709704, -1.56744, 1, 1, 1, 1, 1,
-1.4411, -0.007217141, -2.184267, 1, 1, 1, 1, 1,
-1.438994, 1.188414, -0.2338494, 1, 1, 1, 1, 1,
-1.436649, -0.5749621, -2.025904, 1, 1, 1, 1, 1,
-1.432473, 1.290809, -1.845747, 1, 1, 1, 1, 1,
-1.423515, -0.7317164, -1.594701, 1, 1, 1, 1, 1,
-1.419845, 0.5253723, -0.6907508, 1, 1, 1, 1, 1,
-1.415287, -1.634178, -3.736127, 1, 1, 1, 1, 1,
-1.412742, 0.9768325, -3.684748, 1, 1, 1, 1, 1,
-1.406523, 0.969025, -1.033218, 1, 1, 1, 1, 1,
-1.40455, -0.8593997, -1.959333, 1, 1, 1, 1, 1,
-1.4018, -0.3364697, -1.834986, 1, 1, 1, 1, 1,
-1.395265, 1.175065, -0.9105585, 1, 1, 1, 1, 1,
-1.384693, 0.1329762, -1.45503, 1, 1, 1, 1, 1,
-1.381243, 1.376012, -0.8824459, 1, 1, 1, 1, 1,
-1.379952, 0.895667, -0.5392947, 0, 0, 1, 1, 1,
-1.378222, -0.1909348, -1.670368, 1, 0, 0, 1, 1,
-1.370765, 0.1605717, -0.3914253, 1, 0, 0, 1, 1,
-1.346269, 0.6441393, -1.995633, 1, 0, 0, 1, 1,
-1.328502, -1.610015, -3.1843, 1, 0, 0, 1, 1,
-1.324242, 1.616331, -0.9111444, 1, 0, 0, 1, 1,
-1.323671, 0.4054721, -1.32377, 0, 0, 0, 1, 1,
-1.321371, -1.14569, -1.81089, 0, 0, 0, 1, 1,
-1.315751, -1.59234, -3.4459, 0, 0, 0, 1, 1,
-1.309209, 0.8007236, -1.277482, 0, 0, 0, 1, 1,
-1.294678, 1.027903, -0.8623744, 0, 0, 0, 1, 1,
-1.269533, -0.5621414, -2.748179, 0, 0, 0, 1, 1,
-1.257012, 1.565668, 0.03921175, 0, 0, 0, 1, 1,
-1.250068, -1.072586, -2.087743, 1, 1, 1, 1, 1,
-1.242216, 0.3176062, -2.049486, 1, 1, 1, 1, 1,
-1.241285, 1.817452, 2.397765, 1, 1, 1, 1, 1,
-1.235121, -0.4913825, -1.565126, 1, 1, 1, 1, 1,
-1.233659, 0.08313182, -3.679916, 1, 1, 1, 1, 1,
-1.219797, -2.133608, -2.408986, 1, 1, 1, 1, 1,
-1.214345, 0.07506203, -1.591599, 1, 1, 1, 1, 1,
-1.212696, -1.419341, -1.089307, 1, 1, 1, 1, 1,
-1.199917, 1.834891, -2.341797, 1, 1, 1, 1, 1,
-1.196831, 0.284359, -2.528079, 1, 1, 1, 1, 1,
-1.190198, -0.9946732, -2.328847, 1, 1, 1, 1, 1,
-1.139263, 1.623309, -1.218672, 1, 1, 1, 1, 1,
-1.12694, -1.294379, -1.11018, 1, 1, 1, 1, 1,
-1.125234, -0.9275394, -3.707683, 1, 1, 1, 1, 1,
-1.121497, 0.5201094, -0.7721688, 1, 1, 1, 1, 1,
-1.119656, -0.5555422, -2.354598, 0, 0, 1, 1, 1,
-1.114863, -1.23541, -3.60713, 1, 0, 0, 1, 1,
-1.111033, -0.2222556, -1.862514, 1, 0, 0, 1, 1,
-1.109906, 0.2395468, -0.3501258, 1, 0, 0, 1, 1,
-1.109871, 0.6215227, -2.428865, 1, 0, 0, 1, 1,
-1.109675, -0.1482978, -0.3998804, 1, 0, 0, 1, 1,
-1.108672, 0.03590716, -2.085482, 0, 0, 0, 1, 1,
-1.105986, -2.624579, -3.536185, 0, 0, 0, 1, 1,
-1.10491, -0.7912723, -2.447388, 0, 0, 0, 1, 1,
-1.095994, 0.6773753, -4.576383, 0, 0, 0, 1, 1,
-1.095397, 0.5323629, -2.082631, 0, 0, 0, 1, 1,
-1.092198, -0.8041075, -1.3271, 0, 0, 0, 1, 1,
-1.091617, 0.5642282, 0.1822263, 0, 0, 0, 1, 1,
-1.091293, -0.9024383, -1.275388, 1, 1, 1, 1, 1,
-1.089749, -2.620667, -2.940192, 1, 1, 1, 1, 1,
-1.085704, -0.9918823, -1.146508, 1, 1, 1, 1, 1,
-1.079232, -0.4635258, -2.112808, 1, 1, 1, 1, 1,
-1.074102, -0.7523516, -2.544985, 1, 1, 1, 1, 1,
-1.071558, -0.1587051, -2.296788, 1, 1, 1, 1, 1,
-1.068356, -2.559173, -2.398562, 1, 1, 1, 1, 1,
-1.063982, 1.702698, 0.2064184, 1, 1, 1, 1, 1,
-1.048065, 0.8682234, -0.9289355, 1, 1, 1, 1, 1,
-1.045032, 0.7774, -0.8171805, 1, 1, 1, 1, 1,
-1.033039, 0.5628057, -1.100266, 1, 1, 1, 1, 1,
-1.026932, -1.036305, -3.120967, 1, 1, 1, 1, 1,
-1.021461, -1.1489, -2.634107, 1, 1, 1, 1, 1,
-1.013614, 1.361205, -0.6507667, 1, 1, 1, 1, 1,
-1.005367, -1.409906, -3.838514, 1, 1, 1, 1, 1,
-1.004094, -0.08011787, -1.184886, 0, 0, 1, 1, 1,
-0.998532, 0.3235403, -2.717243, 1, 0, 0, 1, 1,
-0.9933621, -0.2767392, -1.495004, 1, 0, 0, 1, 1,
-0.9829178, 0.9726382, -0.2587945, 1, 0, 0, 1, 1,
-0.9796623, 0.0261729, -1.849787, 1, 0, 0, 1, 1,
-0.9774003, 0.1013714, -2.575864, 1, 0, 0, 1, 1,
-0.9739779, -1.041074, -2.755811, 0, 0, 0, 1, 1,
-0.9679414, -1.095054, -1.969233, 0, 0, 0, 1, 1,
-0.9576781, 1.383963, -0.7871028, 0, 0, 0, 1, 1,
-0.9507164, -1.376539, -1.849408, 0, 0, 0, 1, 1,
-0.9492676, 0.7057768, -1.41655, 0, 0, 0, 1, 1,
-0.947854, -1.27753, -2.957821, 0, 0, 0, 1, 1,
-0.9399188, 0.6512489, -0.1211997, 0, 0, 0, 1, 1,
-0.9364719, -1.169063, -4.066139, 1, 1, 1, 1, 1,
-0.9331816, -0.6564575, -2.190844, 1, 1, 1, 1, 1,
-0.933073, -2.420415, -3.622669, 1, 1, 1, 1, 1,
-0.9291782, -3.303148, -2.977364, 1, 1, 1, 1, 1,
-0.9248387, 2.419457, -0.8761446, 1, 1, 1, 1, 1,
-0.9229671, -0.03456809, 0.664833, 1, 1, 1, 1, 1,
-0.918883, -0.1292354, -1.414873, 1, 1, 1, 1, 1,
-0.9158281, -1.240968, -4.722682, 1, 1, 1, 1, 1,
-0.9070542, -0.3716433, -1.025056, 1, 1, 1, 1, 1,
-0.9055817, 0.5040721, -2.769303, 1, 1, 1, 1, 1,
-0.9041647, -0.002405292, -1.600644, 1, 1, 1, 1, 1,
-0.8983398, 0.07983726, -1.742953, 1, 1, 1, 1, 1,
-0.8965446, -1.059902, -2.456617, 1, 1, 1, 1, 1,
-0.8907516, -1.682066, -2.384822, 1, 1, 1, 1, 1,
-0.8846239, -0.2873039, -1.170366, 1, 1, 1, 1, 1,
-0.8845225, 1.464527, -0.5960189, 0, 0, 1, 1, 1,
-0.8798732, -0.6136465, -1.560802, 1, 0, 0, 1, 1,
-0.8793445, -1.210097, -2.397409, 1, 0, 0, 1, 1,
-0.8719049, 0.4874392, -0.6623538, 1, 0, 0, 1, 1,
-0.8641284, 0.8360627, -0.4393644, 1, 0, 0, 1, 1,
-0.861635, 0.87053, -1.677409, 1, 0, 0, 1, 1,
-0.8567275, -1.263274, -1.263302, 0, 0, 0, 1, 1,
-0.8556556, 0.0411196, -1.699452, 0, 0, 0, 1, 1,
-0.8502485, -1.109605, -1.364578, 0, 0, 0, 1, 1,
-0.8482626, 0.8308417, 0.8293595, 0, 0, 0, 1, 1,
-0.8442651, 0.950458, -0.8872975, 0, 0, 0, 1, 1,
-0.841586, -0.9463308, -0.903037, 0, 0, 0, 1, 1,
-0.8319467, -0.2670106, -2.715713, 0, 0, 0, 1, 1,
-0.8241479, -0.5832368, -1.93601, 1, 1, 1, 1, 1,
-0.8190848, -1.363646, -3.978014, 1, 1, 1, 1, 1,
-0.8185893, -0.7080713, -0.9115354, 1, 1, 1, 1, 1,
-0.8134167, 0.7494655, 0.5931636, 1, 1, 1, 1, 1,
-0.8122567, 0.7765959, -0.5292781, 1, 1, 1, 1, 1,
-0.8108511, 2.006098, 0.01833898, 1, 1, 1, 1, 1,
-0.8086202, -1.449028, -2.563533, 1, 1, 1, 1, 1,
-0.8079581, -0.3329867, -1.364025, 1, 1, 1, 1, 1,
-0.8053662, -1.35434, -3.634236, 1, 1, 1, 1, 1,
-0.7983726, 0.2235422, -0.412093, 1, 1, 1, 1, 1,
-0.7975075, 0.2724572, -2.805073, 1, 1, 1, 1, 1,
-0.7960589, 1.696458, -0.2726535, 1, 1, 1, 1, 1,
-0.7870947, 1.251216, -0.09043436, 1, 1, 1, 1, 1,
-0.7777867, 0.5578404, -0.9897127, 1, 1, 1, 1, 1,
-0.7773694, 0.7585518, -1.657049, 1, 1, 1, 1, 1,
-0.7723761, 0.9067733, 0.6029211, 0, 0, 1, 1, 1,
-0.7714167, -1.001544, -5.035787, 1, 0, 0, 1, 1,
-0.7684948, 1.26841, -0.5574449, 1, 0, 0, 1, 1,
-0.7619923, -2.12762, -2.479896, 1, 0, 0, 1, 1,
-0.761591, -0.5921803, -0.957761, 1, 0, 0, 1, 1,
-0.759915, 0.1962562, -0.5619901, 1, 0, 0, 1, 1,
-0.7532332, 0.5197602, 1.056363, 0, 0, 0, 1, 1,
-0.7518719, 1.058553, -1.533605, 0, 0, 0, 1, 1,
-0.7499652, -0.3156464, -1.636783, 0, 0, 0, 1, 1,
-0.7486463, -0.5137488, -1.87274, 0, 0, 0, 1, 1,
-0.7463837, -1.405618, -3.091638, 0, 0, 0, 1, 1,
-0.7412732, 0.0863155, -0.8971877, 0, 0, 0, 1, 1,
-0.7380828, 0.7622927, 1.416753, 0, 0, 0, 1, 1,
-0.7335991, -0.6130093, -3.87733, 1, 1, 1, 1, 1,
-0.7324858, -0.4090585, -1.3001, 1, 1, 1, 1, 1,
-0.7245674, -0.03680931, -2.791271, 1, 1, 1, 1, 1,
-0.7190558, 0.889393, -0.06856515, 1, 1, 1, 1, 1,
-0.7124605, -0.7874423, -1.187115, 1, 1, 1, 1, 1,
-0.7098204, -1.007322, -2.380055, 1, 1, 1, 1, 1,
-0.7061909, -0.6046083, -2.229757, 1, 1, 1, 1, 1,
-0.6905794, 0.1437169, -2.865852, 1, 1, 1, 1, 1,
-0.6881702, -0.9716697, -3.723174, 1, 1, 1, 1, 1,
-0.6875656, 0.1210444, -1.191693, 1, 1, 1, 1, 1,
-0.6858267, 1.25711, -1.041902, 1, 1, 1, 1, 1,
-0.6851456, 0.6206087, -1.20838, 1, 1, 1, 1, 1,
-0.6812195, 0.4319764, -0.4741904, 1, 1, 1, 1, 1,
-0.6778736, 0.04750474, -0.4747497, 1, 1, 1, 1, 1,
-0.6778269, 0.4040529, -0.6606492, 1, 1, 1, 1, 1,
-0.6757252, -0.9759297, -2.977766, 0, 0, 1, 1, 1,
-0.6704272, -1.932912, -2.809834, 1, 0, 0, 1, 1,
-0.6515891, -0.8131868, -1.131272, 1, 0, 0, 1, 1,
-0.6482704, -0.6050642, -1.371363, 1, 0, 0, 1, 1,
-0.6481631, 0.7776866, -0.6490889, 1, 0, 0, 1, 1,
-0.6459482, -0.6189773, -2.191479, 1, 0, 0, 1, 1,
-0.6447562, 1.756281, 0.609112, 0, 0, 0, 1, 1,
-0.6397557, 0.399701, -0.5065734, 0, 0, 0, 1, 1,
-0.6374627, 0.7390524, -0.29764, 0, 0, 0, 1, 1,
-0.6353998, -0.3746833, -2.14019, 0, 0, 0, 1, 1,
-0.6324292, -1.794458, -3.153563, 0, 0, 0, 1, 1,
-0.6244274, -1.057848, -2.165717, 0, 0, 0, 1, 1,
-0.6177229, -0.06600688, -0.4470131, 0, 0, 0, 1, 1,
-0.6167889, -0.05986436, -2.155063, 1, 1, 1, 1, 1,
-0.6167254, -0.7967263, -2.332953, 1, 1, 1, 1, 1,
-0.6149671, 0.4971943, -3.099628, 1, 1, 1, 1, 1,
-0.6138391, 0.07971458, -0.4501732, 1, 1, 1, 1, 1,
-0.6066833, -0.3007832, -2.378067, 1, 1, 1, 1, 1,
-0.5959596, -0.9040825, -0.6438507, 1, 1, 1, 1, 1,
-0.5946631, 0.9534912, 0.04237534, 1, 1, 1, 1, 1,
-0.5920239, -0.7027432, -3.225357, 1, 1, 1, 1, 1,
-0.5917589, -0.4962527, -3.436294, 1, 1, 1, 1, 1,
-0.5890996, -1.088012, -1.656367, 1, 1, 1, 1, 1,
-0.5879436, 0.04381431, -2.876774, 1, 1, 1, 1, 1,
-0.5867792, -2.734521, -2.790814, 1, 1, 1, 1, 1,
-0.5848335, -0.1007885, -0.2649319, 1, 1, 1, 1, 1,
-0.5801385, 0.05263171, -2.41994, 1, 1, 1, 1, 1,
-0.579031, 0.8705418, -2.246905, 1, 1, 1, 1, 1,
-0.5755558, 0.3656685, -1.2927, 0, 0, 1, 1, 1,
-0.5712574, 0.1298897, -0.6290309, 1, 0, 0, 1, 1,
-0.57017, 0.8706126, -1.920762, 1, 0, 0, 1, 1,
-0.5688964, -1.640669, -3.827831, 1, 0, 0, 1, 1,
-0.5684514, 0.1953699, -0.7205213, 1, 0, 0, 1, 1,
-0.5675509, -0.280268, -3.896441, 1, 0, 0, 1, 1,
-0.5638861, 0.369927, -1.099409, 0, 0, 0, 1, 1,
-0.5620508, 1.01168, 0.0402266, 0, 0, 0, 1, 1,
-0.56116, 0.1797404, -2.472732, 0, 0, 0, 1, 1,
-0.5599509, 0.4537058, -1.235599, 0, 0, 0, 1, 1,
-0.5577348, -0.1723879, -0.932501, 0, 0, 0, 1, 1,
-0.5560539, 0.3958785, -2.342146, 0, 0, 0, 1, 1,
-0.5548293, -0.6925824, -2.100061, 0, 0, 0, 1, 1,
-0.5545405, 1.15682, 0.5882435, 1, 1, 1, 1, 1,
-0.5518481, -0.3038551, -3.184524, 1, 1, 1, 1, 1,
-0.5516419, -0.2898436, -3.044068, 1, 1, 1, 1, 1,
-0.550912, -0.03812594, -3.465812, 1, 1, 1, 1, 1,
-0.5501668, -1.586579, -3.172113, 1, 1, 1, 1, 1,
-0.5498145, -1.09501, -5.191398, 1, 1, 1, 1, 1,
-0.5496699, -0.9265581, -2.177298, 1, 1, 1, 1, 1,
-0.5439913, 0.6210665, 0.2065234, 1, 1, 1, 1, 1,
-0.5439192, -1.606162, -5.411217, 1, 1, 1, 1, 1,
-0.5434623, 0.01300027, -1.149387, 1, 1, 1, 1, 1,
-0.5426864, 0.2768675, -1.382481, 1, 1, 1, 1, 1,
-0.5400373, -0.2499178, -2.797219, 1, 1, 1, 1, 1,
-0.5384431, 0.1873045, -2.500062, 1, 1, 1, 1, 1,
-0.5382797, -0.187492, -2.766951, 1, 1, 1, 1, 1,
-0.5377232, 1.358253, 1.653615, 1, 1, 1, 1, 1,
-0.5375829, -0.1015157, -2.338822, 0, 0, 1, 1, 1,
-0.532443, -0.02262864, -0.2574313, 1, 0, 0, 1, 1,
-0.5264802, 1.624688, -1.121364, 1, 0, 0, 1, 1,
-0.523653, -1.208641, -2.78581, 1, 0, 0, 1, 1,
-0.522594, 0.3422867, -2.462463, 1, 0, 0, 1, 1,
-0.5203928, 0.3276686, -0.9435045, 1, 0, 0, 1, 1,
-0.5162045, 0.06721985, -1.584102, 0, 0, 0, 1, 1,
-0.5121652, -0.9507653, -0.9169208, 0, 0, 0, 1, 1,
-0.510082, 0.9009127, 0.5439284, 0, 0, 0, 1, 1,
-0.5010515, -0.07710383, -2.749529, 0, 0, 0, 1, 1,
-0.4995522, 2.206301, -0.5724857, 0, 0, 0, 1, 1,
-0.4940587, 1.442952, -0.8680132, 0, 0, 0, 1, 1,
-0.4914175, -1.205391, -2.0824, 0, 0, 0, 1, 1,
-0.4879925, -0.04384959, -1.300207, 1, 1, 1, 1, 1,
-0.4866134, -0.3060824, -2.558113, 1, 1, 1, 1, 1,
-0.4847337, 0.6874422, -0.7466143, 1, 1, 1, 1, 1,
-0.4842094, -0.4123846, -2.161569, 1, 1, 1, 1, 1,
-0.477467, -0.5609711, -2.038025, 1, 1, 1, 1, 1,
-0.4769175, 1.195574, -0.5497113, 1, 1, 1, 1, 1,
-0.4769131, 0.2036372, -2.312502, 1, 1, 1, 1, 1,
-0.4760407, 0.5487125, -1.180986, 1, 1, 1, 1, 1,
-0.472499, -0.06083317, -3.090776, 1, 1, 1, 1, 1,
-0.4714062, -0.5302689, -3.30053, 1, 1, 1, 1, 1,
-0.4710113, 0.3193326, -0.6449645, 1, 1, 1, 1, 1,
-0.4676077, 0.5422239, -1.699852, 1, 1, 1, 1, 1,
-0.4673635, 0.2335257, -0.5182038, 1, 1, 1, 1, 1,
-0.4667899, -1.28149, -3.178375, 1, 1, 1, 1, 1,
-0.4656166, 0.02892614, -1.512032, 1, 1, 1, 1, 1,
-0.462519, -0.5411207, -3.176043, 0, 0, 1, 1, 1,
-0.4621436, 0.2401158, -0.5051314, 1, 0, 0, 1, 1,
-0.460433, 0.260332, -0.3609243, 1, 0, 0, 1, 1,
-0.4586988, -0.6709507, -2.063688, 1, 0, 0, 1, 1,
-0.4558115, -2.270519, -2.836043, 1, 0, 0, 1, 1,
-0.4557199, 1.154607, -1.257175, 1, 0, 0, 1, 1,
-0.4556197, 0.05709588, -0.886779, 0, 0, 0, 1, 1,
-0.4545859, -0.07010273, -1.714029, 0, 0, 0, 1, 1,
-0.4537645, -0.02747268, -0.4946667, 0, 0, 0, 1, 1,
-0.4532061, -0.8040358, -2.7047, 0, 0, 0, 1, 1,
-0.451889, 0.3133791, -0.08714149, 0, 0, 0, 1, 1,
-0.4516001, 0.1967576, -0.659097, 0, 0, 0, 1, 1,
-0.4459754, -1.511259, -3.683049, 0, 0, 0, 1, 1,
-0.4376974, 0.7105471, 0.3689885, 1, 1, 1, 1, 1,
-0.4373169, 0.01399674, -1.342832, 1, 1, 1, 1, 1,
-0.434097, 0.07842698, -0.5757526, 1, 1, 1, 1, 1,
-0.4338284, -1.288131, -3.046608, 1, 1, 1, 1, 1,
-0.4279744, 1.446573, 0.5667472, 1, 1, 1, 1, 1,
-0.4278527, 1.364077, -0.2567923, 1, 1, 1, 1, 1,
-0.4202928, -0.4629123, -1.720455, 1, 1, 1, 1, 1,
-0.4134791, -0.684009, -3.230455, 1, 1, 1, 1, 1,
-0.411227, -1.292418, -5.226437, 1, 1, 1, 1, 1,
-0.4054357, -0.2960232, -3.577741, 1, 1, 1, 1, 1,
-0.4011488, -1.777693, -2.829893, 1, 1, 1, 1, 1,
-0.4004964, -0.1665354, -2.125639, 1, 1, 1, 1, 1,
-0.4002752, -1.575315, -3.286438, 1, 1, 1, 1, 1,
-0.3967334, 0.6678376, -0.7275906, 1, 1, 1, 1, 1,
-0.3917434, -0.681007, -2.551588, 1, 1, 1, 1, 1,
-0.3870135, 2.017451, -1.38293, 0, 0, 1, 1, 1,
-0.3850793, -0.3878143, -2.375479, 1, 0, 0, 1, 1,
-0.3827988, 0.9766786, 0.3066154, 1, 0, 0, 1, 1,
-0.3800109, -1.045983, -2.800653, 1, 0, 0, 1, 1,
-0.3798424, 0.4439986, -2.4106, 1, 0, 0, 1, 1,
-0.3663624, 1.612483, -1.019075, 1, 0, 0, 1, 1,
-0.3653643, 0.1864293, -0.8253449, 0, 0, 0, 1, 1,
-0.3635165, -1.76248, -4.225523, 0, 0, 0, 1, 1,
-0.3609655, -1.112283, -3.44631, 0, 0, 0, 1, 1,
-0.3522774, -1.120425, -0.3028957, 0, 0, 0, 1, 1,
-0.3522059, -0.01445926, -2.745493, 0, 0, 0, 1, 1,
-0.3511756, -1.79228, -2.208218, 0, 0, 0, 1, 1,
-0.350691, -0.5270237, -3.276601, 0, 0, 0, 1, 1,
-0.3487092, -0.8459684, -4.093535, 1, 1, 1, 1, 1,
-0.3472845, -1.113339, -3.755397, 1, 1, 1, 1, 1,
-0.3466487, 1.002996, 0.3961495, 1, 1, 1, 1, 1,
-0.3463542, 0.1500062, -0.4660294, 1, 1, 1, 1, 1,
-0.3434582, -0.4378101, -1.924173, 1, 1, 1, 1, 1,
-0.342761, 1.119158, 0.1585741, 1, 1, 1, 1, 1,
-0.3422095, 1.170605, 0.1053332, 1, 1, 1, 1, 1,
-0.3399219, 0.5335445, -0.391643, 1, 1, 1, 1, 1,
-0.3357933, 0.08397388, -2.02682, 1, 1, 1, 1, 1,
-0.3357235, -0.3502084, -3.333128, 1, 1, 1, 1, 1,
-0.3352285, 1.150505, 0.5741775, 1, 1, 1, 1, 1,
-0.3351801, 0.6983787, -0.1786896, 1, 1, 1, 1, 1,
-0.3331027, -1.122989, -4.909287, 1, 1, 1, 1, 1,
-0.3325683, 0.09669401, -0.4374264, 1, 1, 1, 1, 1,
-0.3264185, -1.330151, -4.538066, 1, 1, 1, 1, 1,
-0.323999, -1.228664, -2.648294, 0, 0, 1, 1, 1,
-0.3238418, -0.8762664, -3.207084, 1, 0, 0, 1, 1,
-0.3222426, -0.3466191, -2.594635, 1, 0, 0, 1, 1,
-0.3213053, 0.04397301, -3.776074, 1, 0, 0, 1, 1,
-0.3195585, 0.03255915, -0.3922679, 1, 0, 0, 1, 1,
-0.3146719, 0.3148823, -0.4719062, 1, 0, 0, 1, 1,
-0.3136152, -0.3917911, -3.557614, 0, 0, 0, 1, 1,
-0.310609, -1.105429, -3.935456, 0, 0, 0, 1, 1,
-0.3100756, -1.140471, -3.516428, 0, 0, 0, 1, 1,
-0.3075258, 0.614961, -0.4809595, 0, 0, 0, 1, 1,
-0.3016827, 0.8621357, -1.140708, 0, 0, 0, 1, 1,
-0.3011245, -1.88339, -2.715569, 0, 0, 0, 1, 1,
-0.2998323, 0.2137021, -2.983981, 0, 0, 0, 1, 1,
-0.2968287, 0.09144938, -0.9709332, 1, 1, 1, 1, 1,
-0.2935703, 0.5798596, -2.652377, 1, 1, 1, 1, 1,
-0.2925985, -1.131491, -2.60932, 1, 1, 1, 1, 1,
-0.2914919, 1.429168, -0.4528513, 1, 1, 1, 1, 1,
-0.2890645, -0.6786971, -3.477741, 1, 1, 1, 1, 1,
-0.2885184, -0.7090987, -2.029146, 1, 1, 1, 1, 1,
-0.2865933, -0.690884, -3.783878, 1, 1, 1, 1, 1,
-0.2861038, 1.019591, 1.49281, 1, 1, 1, 1, 1,
-0.2858511, -0.6737391, -2.840649, 1, 1, 1, 1, 1,
-0.285724, 0.5669917, 0.8920835, 1, 1, 1, 1, 1,
-0.2844281, 1.57207, -0.244208, 1, 1, 1, 1, 1,
-0.2811367, -0.3860355, -4.24491, 1, 1, 1, 1, 1,
-0.2807229, 0.2809765, 0.4990975, 1, 1, 1, 1, 1,
-0.2800016, -0.1532781, -2.165628, 1, 1, 1, 1, 1,
-0.2797072, -2.535916, -2.602667, 1, 1, 1, 1, 1,
-0.2774483, -0.4445196, -1.328178, 0, 0, 1, 1, 1,
-0.2773589, 2.124164, -0.07392479, 1, 0, 0, 1, 1,
-0.2710469, -0.7676384, -1.990523, 1, 0, 0, 1, 1,
-0.2681161, -0.395252, -4.083968, 1, 0, 0, 1, 1,
-0.2661246, -1.137041, -1.30391, 1, 0, 0, 1, 1,
-0.2652949, -0.7500479, -2.269517, 1, 0, 0, 1, 1,
-0.264012, -0.378713, -3.77088, 0, 0, 0, 1, 1,
-0.2626865, 0.579995, -0.7058528, 0, 0, 0, 1, 1,
-0.2593212, -2.7131, -3.732529, 0, 0, 0, 1, 1,
-0.2583896, -0.8279752, -2.393985, 0, 0, 0, 1, 1,
-0.2583147, 1.093986, -0.8073412, 0, 0, 0, 1, 1,
-0.2573302, -0.5715727, -1.476275, 0, 0, 0, 1, 1,
-0.2569094, -1.021354, -2.258074, 0, 0, 0, 1, 1,
-0.2525959, 0.822432, -1.196418, 1, 1, 1, 1, 1,
-0.2517846, -0.3592034, -4.246786, 1, 1, 1, 1, 1,
-0.2473166, -2.095864, -2.876084, 1, 1, 1, 1, 1,
-0.245802, 0.1117433, 0.00560667, 1, 1, 1, 1, 1,
-0.2394999, -1.078237, -3.10643, 1, 1, 1, 1, 1,
-0.2376126, 0.1061174, -1.717742, 1, 1, 1, 1, 1,
-0.2368911, 0.1757224, -0.7217804, 1, 1, 1, 1, 1,
-0.2355493, -0.5837077, -2.873345, 1, 1, 1, 1, 1,
-0.2341774, -0.7742813, -3.215577, 1, 1, 1, 1, 1,
-0.2341759, 0.5644802, -0.3642966, 1, 1, 1, 1, 1,
-0.2338593, 0.4881175, -0.003905451, 1, 1, 1, 1, 1,
-0.2268053, -0.6841531, -2.420123, 1, 1, 1, 1, 1,
-0.2250569, 0.4171825, -1.236596, 1, 1, 1, 1, 1,
-0.2249892, 0.7968052, 1.032041, 1, 1, 1, 1, 1,
-0.2229748, 0.2022812, -0.2676398, 1, 1, 1, 1, 1,
-0.2188713, 1.590769, 0.6288598, 0, 0, 1, 1, 1,
-0.2186948, 0.2979371, 0.8027828, 1, 0, 0, 1, 1,
-0.2179078, -0.216814, -2.085403, 1, 0, 0, 1, 1,
-0.2155128, 0.1843289, -2.689361, 1, 0, 0, 1, 1,
-0.2121769, 0.9134034, -0.8087175, 1, 0, 0, 1, 1,
-0.2107607, 1.054968, 1.443633, 1, 0, 0, 1, 1,
-0.2049555, -0.4947696, -2.521799, 0, 0, 0, 1, 1,
-0.2043872, 0.85471, 1.093629, 0, 0, 0, 1, 1,
-0.1999409, -2.27829, -4.019881, 0, 0, 0, 1, 1,
-0.1923561, -2.123742, -4.591511, 0, 0, 0, 1, 1,
-0.190229, -0.5640992, -1.076736, 0, 0, 0, 1, 1,
-0.1884673, -0.3309058, -1.873022, 0, 0, 0, 1, 1,
-0.1881791, 0.8968426, 0.3100816, 0, 0, 0, 1, 1,
-0.185591, 0.7239428, -1.575929, 1, 1, 1, 1, 1,
-0.1848752, -2.759004, -1.429319, 1, 1, 1, 1, 1,
-0.179265, 0.7963446, 1.028121, 1, 1, 1, 1, 1,
-0.1778673, -0.9594665, -2.54354, 1, 1, 1, 1, 1,
-0.1766732, 1.413691, -1.233676, 1, 1, 1, 1, 1,
-0.176388, 0.4568681, -1.947095, 1, 1, 1, 1, 1,
-0.1758774, -3.967901, -2.323709, 1, 1, 1, 1, 1,
-0.1738169, -1.053012, -3.632939, 1, 1, 1, 1, 1,
-0.1728458, 0.5306387, -1.425772, 1, 1, 1, 1, 1,
-0.1717279, -1.429626, -1.611017, 1, 1, 1, 1, 1,
-0.1706051, 1.13328, -1.340741, 1, 1, 1, 1, 1,
-0.1670681, -0.195026, -2.812545, 1, 1, 1, 1, 1,
-0.1622932, -0.3515811, -2.221155, 1, 1, 1, 1, 1,
-0.1600916, 0.4873948, 0.4248914, 1, 1, 1, 1, 1,
-0.1586214, -0.9196298, -1.814474, 1, 1, 1, 1, 1,
-0.158465, -0.7950955, -2.791653, 0, 0, 1, 1, 1,
-0.1548733, 0.2937333, -1.430893, 1, 0, 0, 1, 1,
-0.1544913, 0.4985644, -1.230256, 1, 0, 0, 1, 1,
-0.1485243, 2.522089, -0.8894417, 1, 0, 0, 1, 1,
-0.1475921, -0.2237733, -3.013984, 1, 0, 0, 1, 1,
-0.1464499, -0.2883059, -2.760426, 1, 0, 0, 1, 1,
-0.1397712, 0.05538003, 0.8082658, 0, 0, 0, 1, 1,
-0.1378402, -1.029641, -1.550132, 0, 0, 0, 1, 1,
-0.1331682, 0.3599849, 0.0528252, 0, 0, 0, 1, 1,
-0.1307232, -0.2202267, -3.987289, 0, 0, 0, 1, 1,
-0.1245179, -0.2610599, -3.166455, 0, 0, 0, 1, 1,
-0.1230738, -1.498086, -0.8218046, 0, 0, 0, 1, 1,
-0.1198188, -1.0186, -3.410417, 0, 0, 0, 1, 1,
-0.1167771, -0.1408685, -1.845069, 1, 1, 1, 1, 1,
-0.109101, -1.085553, -1.886931, 1, 1, 1, 1, 1,
-0.1068765, -0.8140267, -1.34145, 1, 1, 1, 1, 1,
-0.1032893, -0.9258918, -4.038154, 1, 1, 1, 1, 1,
-0.09958194, 0.09127539, -0.7221078, 1, 1, 1, 1, 1,
-0.09192172, -0.4300581, -3.330817, 1, 1, 1, 1, 1,
-0.09166139, 0.3597768, 0.1071901, 1, 1, 1, 1, 1,
-0.09135724, 0.1206585, 0.635565, 1, 1, 1, 1, 1,
-0.08995525, 0.3138403, -0.8193812, 1, 1, 1, 1, 1,
-0.08349347, 0.4692029, -2.152416, 1, 1, 1, 1, 1,
-0.08087779, -0.8473482, -0.8168283, 1, 1, 1, 1, 1,
-0.07446527, 0.0003883087, -1.005359, 1, 1, 1, 1, 1,
-0.07247561, -0.7688651, -2.829127, 1, 1, 1, 1, 1,
-0.0690209, -0.9054316, -2.075141, 1, 1, 1, 1, 1,
-0.06495746, -0.9135035, -0.8593802, 1, 1, 1, 1, 1,
-0.06445243, -0.03392663, -1.489016, 0, 0, 1, 1, 1,
-0.06442557, -0.3904505, -5.45576, 1, 0, 0, 1, 1,
-0.0620318, -0.01455816, -2.105891, 1, 0, 0, 1, 1,
-0.06151031, 0.008676227, -2.263429, 1, 0, 0, 1, 1,
-0.05543248, -0.1400007, -2.109626, 1, 0, 0, 1, 1,
-0.05307283, 0.05243706, -1.125957, 1, 0, 0, 1, 1,
-0.05262148, 0.005994224, -1.04576, 0, 0, 0, 1, 1,
-0.04365584, -1.132128, -2.344903, 0, 0, 0, 1, 1,
-0.03977913, 0.5578519, -0.05911778, 0, 0, 0, 1, 1,
-0.03443881, 0.3247086, 0.5238454, 0, 0, 0, 1, 1,
-0.03288772, 1.290993, 0.5267701, 0, 0, 0, 1, 1,
-0.02858821, -0.5304177, -3.506747, 0, 0, 0, 1, 1,
-0.02669125, 1.412648, 1.640856, 0, 0, 0, 1, 1,
-0.02324219, 0.02667309, -0.1620087, 1, 1, 1, 1, 1,
-0.02228019, 0.7078544, 0.8725521, 1, 1, 1, 1, 1,
-0.02122267, -0.4426004, -4.370262, 1, 1, 1, 1, 1,
-0.01935528, -1.995984, -2.03659, 1, 1, 1, 1, 1,
-0.01817239, -0.1569559, -3.442434, 1, 1, 1, 1, 1,
-0.01230312, -1.186987, -3.166569, 1, 1, 1, 1, 1,
-0.01124268, -0.5807479, -3.344271, 1, 1, 1, 1, 1,
-0.008782391, -1.08367, -3.457785, 1, 1, 1, 1, 1,
-0.006950232, 0.3885671, -1.223289, 1, 1, 1, 1, 1,
-6.078087e-05, 1.661477, 0.4634053, 1, 1, 1, 1, 1,
0.002034298, -0.2566196, 3.281598, 1, 1, 1, 1, 1,
0.006699321, -1.430541, 1.457398, 1, 1, 1, 1, 1,
0.007669119, 1.603038, -1.275621, 1, 1, 1, 1, 1,
0.008956975, 0.02510197, 0.7254486, 1, 1, 1, 1, 1,
0.01048282, -0.2881755, 2.986722, 1, 1, 1, 1, 1,
0.01211774, -0.3794252, 1.934221, 0, 0, 1, 1, 1,
0.01983177, 0.3626679, -1.162253, 1, 0, 0, 1, 1,
0.02119476, -0.4936642, 2.509013, 1, 0, 0, 1, 1,
0.02404449, 0.4911354, 0.1988733, 1, 0, 0, 1, 1,
0.02623481, 1.139312, 0.0129056, 1, 0, 0, 1, 1,
0.02734023, -0.7535946, 1.998442, 1, 0, 0, 1, 1,
0.02979063, -0.1746185, 1.455837, 0, 0, 0, 1, 1,
0.03511102, -0.708037, 3.401813, 0, 0, 0, 1, 1,
0.03607647, -1.012806, 3.946133, 0, 0, 0, 1, 1,
0.03657359, 0.3857228, 0.06851177, 0, 0, 0, 1, 1,
0.03775832, 0.09270401, 1.118132, 0, 0, 0, 1, 1,
0.03787503, -0.3974283, 3.091352, 0, 0, 0, 1, 1,
0.04397238, 0.6684547, 0.8683342, 0, 0, 0, 1, 1,
0.04586117, -1.247497, 3.295836, 1, 1, 1, 1, 1,
0.04799496, 0.78626, -0.005658598, 1, 1, 1, 1, 1,
0.05143808, -0.1045265, 4.369151, 1, 1, 1, 1, 1,
0.05327205, -0.01236299, 2.526892, 1, 1, 1, 1, 1,
0.0543582, -1.599816, 4.952859, 1, 1, 1, 1, 1,
0.05470688, 0.2665401, -0.02228196, 1, 1, 1, 1, 1,
0.0547263, -0.4470081, 3.551516, 1, 1, 1, 1, 1,
0.05544909, -0.9500656, 2.731663, 1, 1, 1, 1, 1,
0.05617283, -0.4061394, 3.438408, 1, 1, 1, 1, 1,
0.05666715, 0.9367179, -2.495486, 1, 1, 1, 1, 1,
0.05937839, -0.6079781, 3.188443, 1, 1, 1, 1, 1,
0.06037302, -2.504509, 3.899681, 1, 1, 1, 1, 1,
0.06815282, -1.029147, 2.027678, 1, 1, 1, 1, 1,
0.08024535, 0.1823301, 2.16835, 1, 1, 1, 1, 1,
0.08973681, 0.04856529, -0.3266935, 1, 1, 1, 1, 1,
0.09129968, 0.5544028, -1.068758, 0, 0, 1, 1, 1,
0.09244405, -0.9526336, 3.083353, 1, 0, 0, 1, 1,
0.09267477, -1.119323, 3.910829, 1, 0, 0, 1, 1,
0.09299029, -1.992997, 3.232296, 1, 0, 0, 1, 1,
0.09364691, -1.541252, 3.784082, 1, 0, 0, 1, 1,
0.0938086, -0.9460615, 1.915305, 1, 0, 0, 1, 1,
0.09523915, -0.6589631, 4.322629, 0, 0, 0, 1, 1,
0.09780055, -0.9080377, 3.431723, 0, 0, 0, 1, 1,
0.1020766, -0.3869819, 3.338602, 0, 0, 0, 1, 1,
0.1021, 0.06127523, 1.611752, 0, 0, 0, 1, 1,
0.1031549, -2.299652, 2.315415, 0, 0, 0, 1, 1,
0.1033295, -0.2513875, 2.376962, 0, 0, 0, 1, 1,
0.1057781, -1.190232, 3.146717, 0, 0, 0, 1, 1,
0.1058008, -0.5330655, 3.230484, 1, 1, 1, 1, 1,
0.1101553, 0.03499982, 1.655993, 1, 1, 1, 1, 1,
0.1224049, -0.3422251, 2.562336, 1, 1, 1, 1, 1,
0.1257553, 0.979846, -1.096715, 1, 1, 1, 1, 1,
0.1259575, 0.156104, 1.270678, 1, 1, 1, 1, 1,
0.127602, -0.04168386, 1.642729, 1, 1, 1, 1, 1,
0.1295222, -0.1431144, 0.5814357, 1, 1, 1, 1, 1,
0.1310792, 0.1686757, 1.108323, 1, 1, 1, 1, 1,
0.1310848, -1.825933, 3.529761, 1, 1, 1, 1, 1,
0.1316804, 0.1811601, 1.615024, 1, 1, 1, 1, 1,
0.13276, 1.283946, 1.167199, 1, 1, 1, 1, 1,
0.1329078, 0.4759258, 1.328033, 1, 1, 1, 1, 1,
0.1345593, 0.5290088, 0.7336568, 1, 1, 1, 1, 1,
0.1356444, 0.8169966, 2.241556, 1, 1, 1, 1, 1,
0.1394726, 0.7190949, 0.5792607, 1, 1, 1, 1, 1,
0.140506, 0.3272758, 1.787448, 0, 0, 1, 1, 1,
0.1462169, -1.599653, 4.026837, 1, 0, 0, 1, 1,
0.1466865, 1.28798, 0.03056366, 1, 0, 0, 1, 1,
0.1478447, 1.90363, -0.3758268, 1, 0, 0, 1, 1,
0.1482422, 0.76073, -0.207003, 1, 0, 0, 1, 1,
0.1487129, -0.5712747, 3.804104, 1, 0, 0, 1, 1,
0.15092, 0.63148, -1.493006, 0, 0, 0, 1, 1,
0.1527917, 0.2628184, 2.417581, 0, 0, 0, 1, 1,
0.1550814, -1.146324, 4.041195, 0, 0, 0, 1, 1,
0.1553725, 0.3759474, 1.045114, 0, 0, 0, 1, 1,
0.1554131, 2.019666, -1.386091, 0, 0, 0, 1, 1,
0.1554801, -0.3574903, 2.352996, 0, 0, 0, 1, 1,
0.1570772, -0.7825367, 3.195147, 0, 0, 0, 1, 1,
0.1578289, 0.135792, 1.418808, 1, 1, 1, 1, 1,
0.1590394, -1.320604, 3.455975, 1, 1, 1, 1, 1,
0.1604461, 1.411759, 0.4542974, 1, 1, 1, 1, 1,
0.162357, 1.477959, -0.4160227, 1, 1, 1, 1, 1,
0.1694586, -0.7552475, 1.096614, 1, 1, 1, 1, 1,
0.1701197, -1.786407, 3.815511, 1, 1, 1, 1, 1,
0.172361, -0.5575079, 2.259863, 1, 1, 1, 1, 1,
0.1775835, 0.6873604, -1.180204, 1, 1, 1, 1, 1,
0.1802645, 0.595834, 1.503376, 1, 1, 1, 1, 1,
0.1880015, 1.719306, 1.036951, 1, 1, 1, 1, 1,
0.1941586, 0.2436365, 0.037196, 1, 1, 1, 1, 1,
0.1983073, -0.6140534, 2.889932, 1, 1, 1, 1, 1,
0.1996493, 0.4815999, -0.8581667, 1, 1, 1, 1, 1,
0.2013459, -0.978585, 2.401841, 1, 1, 1, 1, 1,
0.2045157, 0.8902544, -1.290777, 1, 1, 1, 1, 1,
0.204539, 0.5150014, 0.5079324, 0, 0, 1, 1, 1,
0.2090804, -0.7951776, 2.48991, 1, 0, 0, 1, 1,
0.2141317, 0.6547281, 0.7122291, 1, 0, 0, 1, 1,
0.2151002, -0.6162921, 2.956654, 1, 0, 0, 1, 1,
0.2180457, -0.4507571, 2.577741, 1, 0, 0, 1, 1,
0.2182155, 0.4021573, 0.2734776, 1, 0, 0, 1, 1,
0.220491, 0.1353071, 0.1702817, 0, 0, 0, 1, 1,
0.2216821, 0.09335539, 1.859701, 0, 0, 0, 1, 1,
0.2217753, 1.320254, 0.1370331, 0, 0, 0, 1, 1,
0.2243813, 0.2995821, 3.106528, 0, 0, 0, 1, 1,
0.224543, 0.1617659, 0.456635, 0, 0, 0, 1, 1,
0.2256328, -0.8134249, 3.710732, 0, 0, 0, 1, 1,
0.2271814, 0.120583, 1.418387, 0, 0, 0, 1, 1,
0.2273309, -2.664584, 1.92105, 1, 1, 1, 1, 1,
0.232312, -1.921709, 1.968089, 1, 1, 1, 1, 1,
0.2338981, -0.06069068, 1.168136, 1, 1, 1, 1, 1,
0.2395064, -1.169111, 3.489351, 1, 1, 1, 1, 1,
0.2412475, 1.513914, -0.429415, 1, 1, 1, 1, 1,
0.241492, -0.9374206, 4.025554, 1, 1, 1, 1, 1,
0.2438814, 0.2802716, 1.937654, 1, 1, 1, 1, 1,
0.2465098, 1.198559, -0.2527906, 1, 1, 1, 1, 1,
0.2478848, 0.32292, -0.5812926, 1, 1, 1, 1, 1,
0.2512454, -0.5247592, 5.489996, 1, 1, 1, 1, 1,
0.252045, 2.011195, 0.6429167, 1, 1, 1, 1, 1,
0.2546468, -0.3845225, 2.375216, 1, 1, 1, 1, 1,
0.254973, 0.1712241, 2.301139, 1, 1, 1, 1, 1,
0.2557293, -0.3449968, 3.018044, 1, 1, 1, 1, 1,
0.2562706, 0.1392721, 1.004892, 1, 1, 1, 1, 1,
0.2563964, 0.4387971, 0.512787, 0, 0, 1, 1, 1,
0.2598892, 0.1753038, 1.514754, 1, 0, 0, 1, 1,
0.2636125, 0.8781519, -0.3578623, 1, 0, 0, 1, 1,
0.2636492, -0.2509478, 3.001951, 1, 0, 0, 1, 1,
0.2644291, -0.8748357, 2.234398, 1, 0, 0, 1, 1,
0.2648384, 1.585834, 0.2674105, 1, 0, 0, 1, 1,
0.2747882, 0.5585095, 0.7971904, 0, 0, 0, 1, 1,
0.2841388, -0.6846683, 3.298229, 0, 0, 0, 1, 1,
0.2948588, 1.633017, -1.500213, 0, 0, 0, 1, 1,
0.295286, 0.3143565, -0.8495376, 0, 0, 0, 1, 1,
0.2983548, 0.7943557, 0.2802297, 0, 0, 0, 1, 1,
0.298974, -0.4408897, 0.9752607, 0, 0, 0, 1, 1,
0.3014978, 0.7380742, 0.4921812, 0, 0, 0, 1, 1,
0.3059818, 0.1216974, 0.9089068, 1, 1, 1, 1, 1,
0.3123655, -0.09126806, 1.842876, 1, 1, 1, 1, 1,
0.3125674, -1.06218, 3.290805, 1, 1, 1, 1, 1,
0.319935, -0.582074, 2.927122, 1, 1, 1, 1, 1,
0.3199901, -0.2477752, 2.219845, 1, 1, 1, 1, 1,
0.3239441, -1.218592, 1.151113, 1, 1, 1, 1, 1,
0.3250613, -0.792182, 2.109499, 1, 1, 1, 1, 1,
0.3264319, -2.240052, 3.175541, 1, 1, 1, 1, 1,
0.3264384, 0.0139754, 0.8718655, 1, 1, 1, 1, 1,
0.3273906, 1.209773, -1.247301, 1, 1, 1, 1, 1,
0.3290845, 0.4923601, -0.2577441, 1, 1, 1, 1, 1,
0.3325582, -0.5036991, 2.806481, 1, 1, 1, 1, 1,
0.3344886, -0.3031949, 3.446524, 1, 1, 1, 1, 1,
0.3372017, 1.049101, 0.459335, 1, 1, 1, 1, 1,
0.3407595, 2.01905, 1.447841, 1, 1, 1, 1, 1,
0.3410048, -0.429996, 2.673285, 0, 0, 1, 1, 1,
0.3435116, 0.8155339, 0.5560396, 1, 0, 0, 1, 1,
0.343852, -0.6514457, 3.808801, 1, 0, 0, 1, 1,
0.3555669, -0.9554525, 2.310615, 1, 0, 0, 1, 1,
0.3556883, -2.152045, 2.687248, 1, 0, 0, 1, 1,
0.3557249, -0.02596661, 0.9924366, 1, 0, 0, 1, 1,
0.3615882, 1.136405, -1.442862, 0, 0, 0, 1, 1,
0.3623533, 0.0679065, 1.872537, 0, 0, 0, 1, 1,
0.3690635, 0.824513, 2.236689, 0, 0, 0, 1, 1,
0.3726809, 0.554656, -1.478705, 0, 0, 0, 1, 1,
0.3756025, 0.4554948, 0.4458683, 0, 0, 0, 1, 1,
0.3814662, -1.60657, 2.457061, 0, 0, 0, 1, 1,
0.3849393, 0.8352528, 0.8592676, 0, 0, 0, 1, 1,
0.3854783, -0.7666789, 1.648146, 1, 1, 1, 1, 1,
0.3864847, 0.2494591, 1.167135, 1, 1, 1, 1, 1,
0.387431, 1.42596, -0.5116376, 1, 1, 1, 1, 1,
0.3888046, -0.9402097, 4.19778, 1, 1, 1, 1, 1,
0.3918585, -1.907347, 4.678879, 1, 1, 1, 1, 1,
0.3936411, 2.486493, 0.561501, 1, 1, 1, 1, 1,
0.4007534, 0.01706729, 2.612922, 1, 1, 1, 1, 1,
0.416567, 2.30868, -0.9812648, 1, 1, 1, 1, 1,
0.4172157, 0.4203205, 1.075841, 1, 1, 1, 1, 1,
0.4182836, 1.399344, -0.3297047, 1, 1, 1, 1, 1,
0.421506, 0.02840142, 2.194505, 1, 1, 1, 1, 1,
0.4240689, 1.169632, 1.719944, 1, 1, 1, 1, 1,
0.4283418, -0.0009740546, 0.8551531, 1, 1, 1, 1, 1,
0.432499, 1.311446, 1.194197, 1, 1, 1, 1, 1,
0.4354826, 0.2322558, 0.09581872, 1, 1, 1, 1, 1,
0.4447994, -1.230771, 3.023918, 0, 0, 1, 1, 1,
0.4451061, -0.4492582, 2.295312, 1, 0, 0, 1, 1,
0.4491883, -0.122054, 1.075159, 1, 0, 0, 1, 1,
0.4512636, 0.2704767, -0.3001466, 1, 0, 0, 1, 1,
0.4534023, 0.5837701, 0.5060285, 1, 0, 0, 1, 1,
0.4599735, 0.6862538, 0.3504108, 1, 0, 0, 1, 1,
0.4602101, 0.0735851, 1.677943, 0, 0, 0, 1, 1,
0.4605452, -0.7461274, 2.516706, 0, 0, 0, 1, 1,
0.4616569, -0.5504541, 2.955605, 0, 0, 0, 1, 1,
0.4649737, -0.6932908, 3.119927, 0, 0, 0, 1, 1,
0.4703811, -0.1718892, 2.243602, 0, 0, 0, 1, 1,
0.4726132, 1.112957, 0.1524329, 0, 0, 0, 1, 1,
0.4752078, 1.313717, 0.6261293, 0, 0, 0, 1, 1,
0.4767664, -1.028209, 3.839346, 1, 1, 1, 1, 1,
0.4775369, 1.788054, 1.40088, 1, 1, 1, 1, 1,
0.4802781, 0.01597893, 0.9739802, 1, 1, 1, 1, 1,
0.4807835, 0.3717513, 0.8720481, 1, 1, 1, 1, 1,
0.4830645, -0.3349032, 1.986856, 1, 1, 1, 1, 1,
0.4836677, 1.51171, 2.017195, 1, 1, 1, 1, 1,
0.4873052, -0.1210122, 0.1703434, 1, 1, 1, 1, 1,
0.4873284, 0.4725647, -0.5873936, 1, 1, 1, 1, 1,
0.4886105, -0.9084772, 3.955538, 1, 1, 1, 1, 1,
0.4896674, 1.006131, 0.5749938, 1, 1, 1, 1, 1,
0.4959301, -0.1771396, 2.437905, 1, 1, 1, 1, 1,
0.4959624, -0.5594532, 2.058166, 1, 1, 1, 1, 1,
0.4976022, 0.9052818, 1.895656, 1, 1, 1, 1, 1,
0.501938, 0.3704461, 0.7556325, 1, 1, 1, 1, 1,
0.5019739, -0.5929841, 0.3728563, 1, 1, 1, 1, 1,
0.5082777, 0.1635883, -0.2610068, 0, 0, 1, 1, 1,
0.5099694, -0.3897998, 0.3883612, 1, 0, 0, 1, 1,
0.5161233, -0.2500737, 1.901735, 1, 0, 0, 1, 1,
0.521766, -0.3992158, 2.444491, 1, 0, 0, 1, 1,
0.5283489, 0.07891107, 2.14465, 1, 0, 0, 1, 1,
0.5292636, -0.1449721, 0.04761468, 1, 0, 0, 1, 1,
0.5299997, 0.3886125, -0.1561714, 0, 0, 0, 1, 1,
0.5326104, -0.3483841, 2.400694, 0, 0, 0, 1, 1,
0.5335413, -0.4717495, 4.052161, 0, 0, 0, 1, 1,
0.5391853, 0.4784035, 0.03631236, 0, 0, 0, 1, 1,
0.5448491, -0.5087844, 2.906419, 0, 0, 0, 1, 1,
0.5451279, -0.588913, 3.150609, 0, 0, 0, 1, 1,
0.5471969, 1.36236, 0.6884903, 0, 0, 0, 1, 1,
0.5485487, -2.220037, 3.036984, 1, 1, 1, 1, 1,
0.5485913, -0.3065251, 3.386643, 1, 1, 1, 1, 1,
0.5517554, 1.549698, 0.6371404, 1, 1, 1, 1, 1,
0.5539837, 0.3915502, 1.026469, 1, 1, 1, 1, 1,
0.5541641, -0.5551699, 2.498287, 1, 1, 1, 1, 1,
0.5576656, -1.173811, 2.529816, 1, 1, 1, 1, 1,
0.5626917, 0.9046464, 1.327369, 1, 1, 1, 1, 1,
0.5671283, -1.577523, 2.413112, 1, 1, 1, 1, 1,
0.5692213, -1.212823, 3.471193, 1, 1, 1, 1, 1,
0.5813743, 0.2122812, 0.1889323, 1, 1, 1, 1, 1,
0.5819246, 0.567869, 0.8478054, 1, 1, 1, 1, 1,
0.5829009, 0.7970905, 0.14213, 1, 1, 1, 1, 1,
0.5870332, 0.5719577, 2.00623, 1, 1, 1, 1, 1,
0.5892288, -0.1034013, 0.1983298, 1, 1, 1, 1, 1,
0.6014034, -0.636349, 4.096923, 1, 1, 1, 1, 1,
0.602109, -0.698523, 3.301631, 0, 0, 1, 1, 1,
0.6025674, -0.2340685, 1.843294, 1, 0, 0, 1, 1,
0.6041617, 0.9705003, 0.552246, 1, 0, 0, 1, 1,
0.6044806, -0.06406523, 1.748969, 1, 0, 0, 1, 1,
0.6163929, -0.6085212, 2.521038, 1, 0, 0, 1, 1,
0.6195771, -0.7150257, 2.620546, 1, 0, 0, 1, 1,
0.6196986, 0.5126203, 1.778596, 0, 0, 0, 1, 1,
0.6262947, -1.03143, 2.916259, 0, 0, 0, 1, 1,
0.6287063, -1.757508, 2.229564, 0, 0, 0, 1, 1,
0.6361629, 1.287601, 0.7409753, 0, 0, 0, 1, 1,
0.6421251, -0.8055915, 3.320299, 0, 0, 0, 1, 1,
0.6442133, -0.001587751, 2.359143, 0, 0, 0, 1, 1,
0.6501598, -0.9093928, 1.498564, 0, 0, 0, 1, 1,
0.6548604, 1.061853, 0.03836325, 1, 1, 1, 1, 1,
0.6551108, -1.116816, 1.988267, 1, 1, 1, 1, 1,
0.6560518, 1.661376, 0.1927999, 1, 1, 1, 1, 1,
0.6570075, -1.218946, 3.015692, 1, 1, 1, 1, 1,
0.6571888, 2.705559, 1.6403, 1, 1, 1, 1, 1,
0.6593174, 0.3052529, 1.455138, 1, 1, 1, 1, 1,
0.6597072, -0.5629123, 3.571483, 1, 1, 1, 1, 1,
0.660549, 0.9400231, 1.252057, 1, 1, 1, 1, 1,
0.661687, 1.178504, -0.3929219, 1, 1, 1, 1, 1,
0.6652995, 0.5661542, 0.3061628, 1, 1, 1, 1, 1,
0.6693975, 0.1807193, 1.218318, 1, 1, 1, 1, 1,
0.6718611, -0.9733772, 2.618103, 1, 1, 1, 1, 1,
0.6725121, 0.5169633, 1.519648, 1, 1, 1, 1, 1,
0.6770294, -1.232667, 3.552538, 1, 1, 1, 1, 1,
0.6839437, 0.3619501, 0.6220117, 1, 1, 1, 1, 1,
0.6865376, -0.05450597, 0.9791619, 0, 0, 1, 1, 1,
0.6938519, -1.5545, 3.607166, 1, 0, 0, 1, 1,
0.6943347, -1.160919, 2.45191, 1, 0, 0, 1, 1,
0.705296, 0.4761815, 3.257713, 1, 0, 0, 1, 1,
0.7071662, 0.6737106, -0.6651217, 1, 0, 0, 1, 1,
0.7082496, -0.8806567, 2.549958, 1, 0, 0, 1, 1,
0.7190213, -1.019828, 4.558117, 0, 0, 0, 1, 1,
0.7192286, 0.4544599, 2.349082, 0, 0, 0, 1, 1,
0.7235857, 0.6747584, -0.4325213, 0, 0, 0, 1, 1,
0.7254837, 0.1918017, 1.222077, 0, 0, 0, 1, 1,
0.7275982, -1.128638, 1.404644, 0, 0, 0, 1, 1,
0.7417625, -0.5198084, 1.476153, 0, 0, 0, 1, 1,
0.7437755, -1.142543, 3.803682, 0, 0, 0, 1, 1,
0.7452757, -2.048919, 2.400642, 1, 1, 1, 1, 1,
0.7508216, -0.7570283, 2.155947, 1, 1, 1, 1, 1,
0.7539763, -0.714536, 2.210524, 1, 1, 1, 1, 1,
0.7553927, 0.1995043, 0.1255516, 1, 1, 1, 1, 1,
0.7661511, 0.2016856, 3.320637, 1, 1, 1, 1, 1,
0.7713814, 2.260667, 0.9284189, 1, 1, 1, 1, 1,
0.7878219, 0.8046828, -0.1172222, 1, 1, 1, 1, 1,
0.8018157, -0.359479, 2.428727, 1, 1, 1, 1, 1,
0.8021415, -0.7754606, 0.8217126, 1, 1, 1, 1, 1,
0.80564, 0.5298278, 1.516532, 1, 1, 1, 1, 1,
0.8092863, -0.08792665, -0.1620017, 1, 1, 1, 1, 1,
0.8137164, -0.5933011, 2.707703, 1, 1, 1, 1, 1,
0.8182707, 0.6504462, -0.115677, 1, 1, 1, 1, 1,
0.8234867, -0.1418105, 1.291216, 1, 1, 1, 1, 1,
0.8253769, 0.8150077, 0.6976212, 1, 1, 1, 1, 1,
0.8262863, -0.706485, 3.286336, 0, 0, 1, 1, 1,
0.8264689, -0.5320839, 1.388305, 1, 0, 0, 1, 1,
0.8317811, 0.9167234, 0.8703139, 1, 0, 0, 1, 1,
0.832261, 0.4386896, 1.247585, 1, 0, 0, 1, 1,
0.8397499, 0.1961912, 1.257529, 1, 0, 0, 1, 1,
0.8441223, -0.2411546, 0.09139428, 1, 0, 0, 1, 1,
0.8462731, 0.2403044, 2.226881, 0, 0, 0, 1, 1,
0.8535482, -0.2437602, 3.258819, 0, 0, 0, 1, 1,
0.8566613, -1.14156, 0.7966509, 0, 0, 0, 1, 1,
0.8638837, -0.194775, 1.831119, 0, 0, 0, 1, 1,
0.8658829, -1.787461, 3.149447, 0, 0, 0, 1, 1,
0.867283, 0.2453325, 2.073834, 0, 0, 0, 1, 1,
0.8793178, -0.591549, 1.711435, 0, 0, 0, 1, 1,
0.880792, -1.089715, 2.223797, 1, 1, 1, 1, 1,
0.8925377, -1.203241, 2.605844, 1, 1, 1, 1, 1,
0.8952984, -2.288134, 2.600264, 1, 1, 1, 1, 1,
0.9086991, 0.8438551, -1.989059, 1, 1, 1, 1, 1,
0.9089344, 0.9649284, 2.569273, 1, 1, 1, 1, 1,
0.9089917, 1.672231, 0.1617242, 1, 1, 1, 1, 1,
0.9117836, 0.8266982, -0.760466, 1, 1, 1, 1, 1,
0.9146535, 0.6868372, 0.2722101, 1, 1, 1, 1, 1,
0.9314469, -0.5576224, 2.798661, 1, 1, 1, 1, 1,
0.9319943, -1.090403, 2.79951, 1, 1, 1, 1, 1,
0.9343614, -0.8443894, 3.504671, 1, 1, 1, 1, 1,
0.9441369, -0.1524789, 2.782122, 1, 1, 1, 1, 1,
0.957021, 1.711272, -0.05331845, 1, 1, 1, 1, 1,
0.9698125, -0.170553, 1.966813, 1, 1, 1, 1, 1,
0.9717296, 0.3278363, 0.9149641, 1, 1, 1, 1, 1,
0.9722708, -0.6949118, 2.174614, 0, 0, 1, 1, 1,
0.9730087, 1.417395, 1.909397, 1, 0, 0, 1, 1,
0.9766909, 0.1942031, 2.132891, 1, 0, 0, 1, 1,
0.9877064, -0.2087735, 2.82562, 1, 0, 0, 1, 1,
0.988554, -0.2771134, 2.18805, 1, 0, 0, 1, 1,
0.9970937, 0.8269188, 0.6108969, 1, 0, 0, 1, 1,
0.9980968, -0.05207876, 1.443748, 0, 0, 0, 1, 1,
0.9993533, 0.05865085, -0.4482753, 0, 0, 0, 1, 1,
1.001965, -1.911344, 3.588514, 0, 0, 0, 1, 1,
1.004206, 0.5087615, 0.7361162, 0, 0, 0, 1, 1,
1.007724, -0.9716234, 0.2969416, 0, 0, 0, 1, 1,
1.014829, 1.14023, 0.9978966, 0, 0, 0, 1, 1,
1.017698, 0.5837257, 0.6388731, 0, 0, 0, 1, 1,
1.019505, -0.1591423, 1.53307, 1, 1, 1, 1, 1,
1.019831, -2.467155, 2.82924, 1, 1, 1, 1, 1,
1.0223, 1.267225, 0.4992301, 1, 1, 1, 1, 1,
1.023268, 1.322326, 1.768598, 1, 1, 1, 1, 1,
1.032496, 1.530448, -0.5014458, 1, 1, 1, 1, 1,
1.03318, 0.6416101, 2.125302, 1, 1, 1, 1, 1,
1.035607, 1.221266, 0.6578482, 1, 1, 1, 1, 1,
1.036795, -0.4826787, 1.734376, 1, 1, 1, 1, 1,
1.04496, -1.423041, 0.4681798, 1, 1, 1, 1, 1,
1.049574, -1.273216, 3.20493, 1, 1, 1, 1, 1,
1.058342, -0.2500217, 0.3129839, 1, 1, 1, 1, 1,
1.066737, 0.4851463, 0.3506404, 1, 1, 1, 1, 1,
1.069637, -0.4513194, 2.757942, 1, 1, 1, 1, 1,
1.072438, -0.5041796, 1.814314, 1, 1, 1, 1, 1,
1.082161, 1.041488, 1.774971, 1, 1, 1, 1, 1,
1.095064, 0.3412724, 2.651934, 0, 0, 1, 1, 1,
1.095136, -0.4974778, 0.9945549, 1, 0, 0, 1, 1,
1.102719, -0.4155245, 0.9866127, 1, 0, 0, 1, 1,
1.110647, 0.4722021, -1.162443, 1, 0, 0, 1, 1,
1.128326, -0.8204765, 3.512699, 1, 0, 0, 1, 1,
1.132763, -1.528015, 2.572746, 1, 0, 0, 1, 1,
1.136555, 0.2253511, 0.5870237, 0, 0, 0, 1, 1,
1.158584, 0.5424294, 0.3724448, 0, 0, 0, 1, 1,
1.163444, 0.4451466, 2.768092, 0, 0, 0, 1, 1,
1.16645, 3.234305, 0.5087003, 0, 0, 0, 1, 1,
1.169189, -0.8502136, 2.416253, 0, 0, 0, 1, 1,
1.171898, -0.606669, 1.149415, 0, 0, 0, 1, 1,
1.179282, 0.4353611, 2.40106, 0, 0, 0, 1, 1,
1.182328, -0.4702289, 3.00514, 1, 1, 1, 1, 1,
1.186092, 0.4117292, 0.4487431, 1, 1, 1, 1, 1,
1.186354, 1.14467, 1.696169, 1, 1, 1, 1, 1,
1.195911, -1.252474, 1.581191, 1, 1, 1, 1, 1,
1.207336, -1.065296, 2.012195, 1, 1, 1, 1, 1,
1.212721, 0.8036875, 0.4295281, 1, 1, 1, 1, 1,
1.212897, -1.117229, 1.953635, 1, 1, 1, 1, 1,
1.21591, -1.295511, 1.317433, 1, 1, 1, 1, 1,
1.216025, 1.774241, 1.040301, 1, 1, 1, 1, 1,
1.223394, -2.352271, 1.590797, 1, 1, 1, 1, 1,
1.224538, 0.4864118, 1.280764, 1, 1, 1, 1, 1,
1.231546, 0.9675997, 2.327692, 1, 1, 1, 1, 1,
1.236248, -1.771062, 1.003282, 1, 1, 1, 1, 1,
1.237753, 1.067244, 2.255639, 1, 1, 1, 1, 1,
1.238849, 0.2338868, 1.775303, 1, 1, 1, 1, 1,
1.244301, -0.779525, 2.714204, 0, 0, 1, 1, 1,
1.250827, -1.348473, 2.178694, 1, 0, 0, 1, 1,
1.254068, 1.196389, 1.448494, 1, 0, 0, 1, 1,
1.257748, 0.2064095, 0.4534396, 1, 0, 0, 1, 1,
1.26283, -2.250548, 3.35286, 1, 0, 0, 1, 1,
1.265421, 0.9337294, -0.6296237, 1, 0, 0, 1, 1,
1.273275, 0.2330079, 1.247693, 0, 0, 0, 1, 1,
1.276409, 0.06196183, 0.4458074, 0, 0, 0, 1, 1,
1.285113, 0.8280437, 0.1721915, 0, 0, 0, 1, 1,
1.304789, -1.726294, 1.44567, 0, 0, 0, 1, 1,
1.315034, -0.1934156, 2.157061, 0, 0, 0, 1, 1,
1.316818, -2.687798, 2.845168, 0, 0, 0, 1, 1,
1.33291, 1.124154, 1.881865, 0, 0, 0, 1, 1,
1.334415, 1.680328, 1.43138, 1, 1, 1, 1, 1,
1.339451, 0.1087071, 1.081825, 1, 1, 1, 1, 1,
1.345304, -0.154733, 2.254616, 1, 1, 1, 1, 1,
1.347351, -0.9995999, 1.796238, 1, 1, 1, 1, 1,
1.354908, -0.3556592, 2.781598, 1, 1, 1, 1, 1,
1.356002, -0.1027301, -0.08655093, 1, 1, 1, 1, 1,
1.371547, 0.008859294, 2.421745, 1, 1, 1, 1, 1,
1.379449, 0.02726934, 0.1949041, 1, 1, 1, 1, 1,
1.381145, 0.1745791, -0.1506308, 1, 1, 1, 1, 1,
1.385957, 0.578232, -0.06037473, 1, 1, 1, 1, 1,
1.386978, -1.789229, 3.220652, 1, 1, 1, 1, 1,
1.390347, -0.9705823, 1.562254, 1, 1, 1, 1, 1,
1.392693, -0.4069744, 3.842562, 1, 1, 1, 1, 1,
1.393597, 1.082452, 2.143386, 1, 1, 1, 1, 1,
1.41316, -0.616402, 0.6616272, 1, 1, 1, 1, 1,
1.416228, -0.4926284, 3.288321, 0, 0, 1, 1, 1,
1.422434, 0.7129639, 1.459453, 1, 0, 0, 1, 1,
1.423116, -0.3987996, 0.8597122, 1, 0, 0, 1, 1,
1.423323, -1.37666, 2.81024, 1, 0, 0, 1, 1,
1.446043, 0.1943732, 1.533867, 1, 0, 0, 1, 1,
1.451037, -1.889645, 2.218385, 1, 0, 0, 1, 1,
1.453175, 0.7406185, -0.3914183, 0, 0, 0, 1, 1,
1.494052, 0.6666939, 1.868183, 0, 0, 0, 1, 1,
1.511074, 0.5905923, 0.8676234, 0, 0, 0, 1, 1,
1.511707, 0.03392652, 0.9310869, 0, 0, 0, 1, 1,
1.525983, 0.6814017, 0.1141947, 0, 0, 0, 1, 1,
1.52964, -0.5329188, 1.593597, 0, 0, 0, 1, 1,
1.532614, -1.122739, 3.350819, 0, 0, 0, 1, 1,
1.546406, -0.07441348, 1.25945, 1, 1, 1, 1, 1,
1.555508, -0.8173817, 1.716172, 1, 1, 1, 1, 1,
1.558096, 0.1281852, 1.086014, 1, 1, 1, 1, 1,
1.583845, 1.193188, 2.302722, 1, 1, 1, 1, 1,
1.599388, -0.7127313, 3.601893, 1, 1, 1, 1, 1,
1.599778, 1.749747, -0.1723376, 1, 1, 1, 1, 1,
1.601794, -1.208095, 1.934991, 1, 1, 1, 1, 1,
1.603546, -0.3270082, 1.635676, 1, 1, 1, 1, 1,
1.626959, -0.16412, 1.918159, 1, 1, 1, 1, 1,
1.644931, 0.8489788, 1.276421, 1, 1, 1, 1, 1,
1.670484, -0.05983447, 0.971805, 1, 1, 1, 1, 1,
1.679718, -0.7898079, 1.30357, 1, 1, 1, 1, 1,
1.695708, 0.5489218, 0.4083354, 1, 1, 1, 1, 1,
1.711939, -1.395614, 1.654518, 1, 1, 1, 1, 1,
1.714048, 0.2528741, 2.534739, 1, 1, 1, 1, 1,
1.749002, 0.5439571, 2.144443, 0, 0, 1, 1, 1,
1.769799, 2.534304, 2.262046, 1, 0, 0, 1, 1,
1.780606, -0.4767648, 0.1390452, 1, 0, 0, 1, 1,
1.802434, 1.965605, 0.4108974, 1, 0, 0, 1, 1,
1.802526, 0.8729319, -0.4964499, 1, 0, 0, 1, 1,
1.804944, 0.8799669, -0.07652316, 1, 0, 0, 1, 1,
1.809482, -0.0969675, 3.736555, 0, 0, 0, 1, 1,
1.844338, -1.247606, 2.596194, 0, 0, 0, 1, 1,
1.845449, -0.2726174, 3.298093, 0, 0, 0, 1, 1,
1.863925, 0.7082276, -0.831858, 0, 0, 0, 1, 1,
1.86833, 0.3901885, 1.450855, 0, 0, 0, 1, 1,
1.901065, 0.08025755, 2.425645, 0, 0, 0, 1, 1,
1.912547, 0.3015725, 1.37483, 0, 0, 0, 1, 1,
1.923173, -0.004944571, 0.2160165, 1, 1, 1, 1, 1,
1.924704, -0.00446591, 2.632884, 1, 1, 1, 1, 1,
1.92867, -0.06442287, 0.3414832, 1, 1, 1, 1, 1,
1.956854, -1.83456, 1.702375, 1, 1, 1, 1, 1,
1.9682, -0.3251557, 1.404564, 1, 1, 1, 1, 1,
1.969953, 0.649268, 1.403724, 1, 1, 1, 1, 1,
1.982094, 2.323906, 2.113642, 1, 1, 1, 1, 1,
1.988159, -1.614546, 2.805247, 1, 1, 1, 1, 1,
2.001212, 0.1816869, 1.538446, 1, 1, 1, 1, 1,
2.010987, 1.901767, -0.1100176, 1, 1, 1, 1, 1,
2.023467, 1.770548, 0.7256083, 1, 1, 1, 1, 1,
2.028381, -0.7421213, 3.321413, 1, 1, 1, 1, 1,
2.070786, 0.01906512, 1.326376, 1, 1, 1, 1, 1,
2.096588, 2.21721, 0.5820999, 1, 1, 1, 1, 1,
2.100899, -0.290106, 2.196107, 1, 1, 1, 1, 1,
2.111382, 1.959171, -0.6386901, 0, 0, 1, 1, 1,
2.126348, -0.01474536, 0.1732278, 1, 0, 0, 1, 1,
2.137076, 2.390128, 0.9742507, 1, 0, 0, 1, 1,
2.142363, -0.1836545, 0.6133404, 1, 0, 0, 1, 1,
2.171437, 1.614244, 2.097097, 1, 0, 0, 1, 1,
2.244707, -1.923284, 2.729603, 1, 0, 0, 1, 1,
2.313773, -2.193761, 3.562198, 0, 0, 0, 1, 1,
2.323558, 0.4649175, -0.5377095, 0, 0, 0, 1, 1,
2.327717, 0.7670218, 0.8281996, 0, 0, 0, 1, 1,
2.378652, -0.7475305, 3.336645, 0, 0, 0, 1, 1,
2.426852, -0.06657818, 1.139543, 0, 0, 0, 1, 1,
2.430532, 0.08740047, -0.2677256, 0, 0, 0, 1, 1,
2.478705, 0.05875421, 1.156551, 0, 0, 0, 1, 1,
2.524142, 0.4658479, 1.568801, 1, 1, 1, 1, 1,
2.534007, -0.7364483, 2.622607, 1, 1, 1, 1, 1,
2.658823, 0.3569371, 1.283537, 1, 1, 1, 1, 1,
2.871439, -0.8289898, 2.992959, 1, 1, 1, 1, 1,
2.897185, -0.6788404, 1.316072, 1, 1, 1, 1, 1,
2.987085, -0.09429302, 1.431961, 1, 1, 1, 1, 1,
3.17402, 0.1106819, 0.9712858, 1, 1, 1, 1, 1
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
var radius = 9.848308;
var distance = 34.59177;
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
mvMatrix.translate( -0.04025078, 0.3667979, -0.01711822 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.59177);
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