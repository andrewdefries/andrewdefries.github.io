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
-3.424333, -1.710823, -0.4601679, 1, 0, 0, 1,
-3.22604, 1.22726, -0.3075069, 1, 0.007843138, 0, 1,
-2.875283, -0.6091459, -2.750103, 1, 0.01176471, 0, 1,
-2.717216, 0.204727, -1.94611, 1, 0.01960784, 0, 1,
-2.670263, 0.6513193, -0.10138, 1, 0.02352941, 0, 1,
-2.647194, 0.1519609, -1.736097, 1, 0.03137255, 0, 1,
-2.598118, 1.5594, -1.497677, 1, 0.03529412, 0, 1,
-2.477211, -0.3356574, -2.921323, 1, 0.04313726, 0, 1,
-2.42785, -1.703209, -2.833175, 1, 0.04705882, 0, 1,
-2.4118, -0.8292885, -0.1163165, 1, 0.05490196, 0, 1,
-2.368652, 1.591305, -0.377506, 1, 0.05882353, 0, 1,
-2.362718, 0.7166607, -1.645608, 1, 0.06666667, 0, 1,
-2.362047, -0.1852984, -2.919123, 1, 0.07058824, 0, 1,
-2.352813, 0.4288593, -0.6917093, 1, 0.07843138, 0, 1,
-2.342298, 1.473317, 0.7695845, 1, 0.08235294, 0, 1,
-2.265099, -1.167256, -2.633404, 1, 0.09019608, 0, 1,
-2.253688, -0.09123532, -3.124339, 1, 0.09411765, 0, 1,
-2.191886, -0.9869096, -3.971241, 1, 0.1019608, 0, 1,
-2.171193, 2.335936, -1.427632, 1, 0.1098039, 0, 1,
-2.121916, -1.626458, -2.069285, 1, 0.1137255, 0, 1,
-2.04808, -1.331388, -0.7675876, 1, 0.1215686, 0, 1,
-2.040134, 0.235116, -0.2899674, 1, 0.1254902, 0, 1,
-2.008479, -0.5036425, -3.220662, 1, 0.1333333, 0, 1,
-1.998396, 0.1314119, -2.402176, 1, 0.1372549, 0, 1,
-1.993895, 1.116957, -2.11728, 1, 0.145098, 0, 1,
-1.968837, -1.863042, -1.576464, 1, 0.1490196, 0, 1,
-1.945968, -0.681851, -0.9669247, 1, 0.1568628, 0, 1,
-1.908396, 0.4185939, -1.383034, 1, 0.1607843, 0, 1,
-1.895655, -0.9620295, -1.362376, 1, 0.1686275, 0, 1,
-1.878336, -1.168156, -0.8544147, 1, 0.172549, 0, 1,
-1.862959, -1.722205, -0.3285753, 1, 0.1803922, 0, 1,
-1.8518, 0.2885371, -0.09573088, 1, 0.1843137, 0, 1,
-1.818333, 0.03541379, -1.963615, 1, 0.1921569, 0, 1,
-1.780819, 0.5117738, -0.65222, 1, 0.1960784, 0, 1,
-1.774143, 0.3923505, 0.3483012, 1, 0.2039216, 0, 1,
-1.743235, -0.1402777, 1.315949, 1, 0.2117647, 0, 1,
-1.717557, -0.1172373, -3.140088, 1, 0.2156863, 0, 1,
-1.716543, 1.175346, -0.04787724, 1, 0.2235294, 0, 1,
-1.7132, -0.5919145, -1.154918, 1, 0.227451, 0, 1,
-1.668141, 0.9830942, -1.496641, 1, 0.2352941, 0, 1,
-1.66477, -1.122259, -2.861561, 1, 0.2392157, 0, 1,
-1.657005, 0.07580989, -0.5921543, 1, 0.2470588, 0, 1,
-1.656405, -0.8513206, -1.628579, 1, 0.2509804, 0, 1,
-1.652976, -1.56849, -0.445108, 1, 0.2588235, 0, 1,
-1.64659, -0.1433021, -1.355305, 1, 0.2627451, 0, 1,
-1.63781, -1.352897, -2.716957, 1, 0.2705882, 0, 1,
-1.635701, 1.870147, -0.5390248, 1, 0.2745098, 0, 1,
-1.601181, 0.1212939, -0.4185442, 1, 0.282353, 0, 1,
-1.588889, -0.1468545, -2.098912, 1, 0.2862745, 0, 1,
-1.575699, -0.02272796, -2.804813, 1, 0.2941177, 0, 1,
-1.569235, -0.5294386, -2.903768, 1, 0.3019608, 0, 1,
-1.562206, 0.1821201, -1.719129, 1, 0.3058824, 0, 1,
-1.554621, -1.298235, -3.551957, 1, 0.3137255, 0, 1,
-1.549235, -0.4032015, -1.972725, 1, 0.3176471, 0, 1,
-1.546721, 0.7826743, -1.834395, 1, 0.3254902, 0, 1,
-1.538578, -1.100267, -2.831681, 1, 0.3294118, 0, 1,
-1.53802, 1.043851, -1.792567, 1, 0.3372549, 0, 1,
-1.533509, -0.3415445, -2.04755, 1, 0.3411765, 0, 1,
-1.533083, 0.893906, -1.225531, 1, 0.3490196, 0, 1,
-1.52366, 0.03757612, -1.851418, 1, 0.3529412, 0, 1,
-1.518648, -1.018804, -2.666843, 1, 0.3607843, 0, 1,
-1.518117, 0.02083872, -1.421061, 1, 0.3647059, 0, 1,
-1.506422, -0.2435598, -2.812424, 1, 0.372549, 0, 1,
-1.472038, -1.096918, -2.013599, 1, 0.3764706, 0, 1,
-1.466914, -0.4775488, -2.856074, 1, 0.3843137, 0, 1,
-1.44283, 1.00492, -1.2878, 1, 0.3882353, 0, 1,
-1.423335, 0.224593, -2.393175, 1, 0.3960784, 0, 1,
-1.423141, -0.5504262, -1.901156, 1, 0.4039216, 0, 1,
-1.422155, 1.336546, -0.6080438, 1, 0.4078431, 0, 1,
-1.421343, 1.514554, -1.357145, 1, 0.4156863, 0, 1,
-1.408053, 1.030596, 1.094872, 1, 0.4196078, 0, 1,
-1.401642, -0.8935549, -1.829555, 1, 0.427451, 0, 1,
-1.395965, 0.7719372, -0.9793015, 1, 0.4313726, 0, 1,
-1.38663, -1.23547, -1.752265, 1, 0.4392157, 0, 1,
-1.381273, 0.4138554, -0.2096406, 1, 0.4431373, 0, 1,
-1.376948, 0.8721749, -1.355135, 1, 0.4509804, 0, 1,
-1.367291, 0.7962495, -0.6181779, 1, 0.454902, 0, 1,
-1.358175, 0.9695106, -1.651922, 1, 0.4627451, 0, 1,
-1.353533, 0.4031744, -2.797976, 1, 0.4666667, 0, 1,
-1.351411, 1.705517, -0.6435388, 1, 0.4745098, 0, 1,
-1.346165, 2.112719, -0.7708931, 1, 0.4784314, 0, 1,
-1.34027, -0.03071777, -1.73227, 1, 0.4862745, 0, 1,
-1.333827, -1.682913, -1.467106, 1, 0.4901961, 0, 1,
-1.330334, -1.075845, -3.862956, 1, 0.4980392, 0, 1,
-1.301382, 2.117667, -1.311583, 1, 0.5058824, 0, 1,
-1.285142, 0.848906, -0.5215439, 1, 0.509804, 0, 1,
-1.278165, 0.358882, -1.524163, 1, 0.5176471, 0, 1,
-1.275376, -1.200191, -0.669957, 1, 0.5215687, 0, 1,
-1.274924, 1.818138, -0.7056374, 1, 0.5294118, 0, 1,
-1.274354, -1.243748, -2.928382, 1, 0.5333334, 0, 1,
-1.274275, -0.5395663, -3.586364, 1, 0.5411765, 0, 1,
-1.272504, 0.7656153, -1.352357, 1, 0.5450981, 0, 1,
-1.267968, -0.4623186, -2.30607, 1, 0.5529412, 0, 1,
-1.26587, 0.2681464, -0.2614279, 1, 0.5568628, 0, 1,
-1.258039, -0.6263238, -2.699673, 1, 0.5647059, 0, 1,
-1.254228, 0.4248712, -1.465799, 1, 0.5686275, 0, 1,
-1.23762, -0.570021, -3.513362, 1, 0.5764706, 0, 1,
-1.229694, -0.6750033, -2.001384, 1, 0.5803922, 0, 1,
-1.228932, -1.534811, -1.584272, 1, 0.5882353, 0, 1,
-1.228071, 0.3922272, -1.286951, 1, 0.5921569, 0, 1,
-1.210512, -0.9768767, -2.59537, 1, 0.6, 0, 1,
-1.190924, -0.2194271, -3.306643, 1, 0.6078432, 0, 1,
-1.190645, 0.3725731, -1.461421, 1, 0.6117647, 0, 1,
-1.18908, 1.291627, 0.1957577, 1, 0.6196079, 0, 1,
-1.177888, 1.234138, 0.4226305, 1, 0.6235294, 0, 1,
-1.177307, 0.3154729, -0.8208825, 1, 0.6313726, 0, 1,
-1.173863, -0.7295016, 0.8851259, 1, 0.6352941, 0, 1,
-1.1695, -0.6828523, -1.347592, 1, 0.6431373, 0, 1,
-1.168605, -1.151638, -3.617989, 1, 0.6470588, 0, 1,
-1.167824, -1.40771, -0.3547632, 1, 0.654902, 0, 1,
-1.163925, 1.951375, 0.2567903, 1, 0.6588235, 0, 1,
-1.163105, 0.1012623, -1.330543, 1, 0.6666667, 0, 1,
-1.159488, 0.6050507, -0.4815313, 1, 0.6705883, 0, 1,
-1.154782, 0.9403207, -0.09067362, 1, 0.6784314, 0, 1,
-1.152676, 0.05718882, -1.968571, 1, 0.682353, 0, 1,
-1.151533, -1.288791, -2.598607, 1, 0.6901961, 0, 1,
-1.1489, -0.4528071, -0.4258304, 1, 0.6941177, 0, 1,
-1.145519, -0.09478483, -3.227283, 1, 0.7019608, 0, 1,
-1.144331, 1.532343, 1.045022, 1, 0.7098039, 0, 1,
-1.143825, 1.043878, -0.1050976, 1, 0.7137255, 0, 1,
-1.13572, -0.3402113, -2.361248, 1, 0.7215686, 0, 1,
-1.131602, -0.1436641, -2.799105, 1, 0.7254902, 0, 1,
-1.127981, -2.02772, -2.742894, 1, 0.7333333, 0, 1,
-1.125379, -0.1772744, -1.685398, 1, 0.7372549, 0, 1,
-1.123417, 0.3217215, -1.033335, 1, 0.7450981, 0, 1,
-1.122877, -1.069258, -3.660227, 1, 0.7490196, 0, 1,
-1.119159, -0.1668129, -2.120961, 1, 0.7568628, 0, 1,
-1.116033, 0.6129531, -2.44176, 1, 0.7607843, 0, 1,
-1.114085, 0.453592, -2.01512, 1, 0.7686275, 0, 1,
-1.111225, -0.7620316, 0.2144731, 1, 0.772549, 0, 1,
-1.111012, -0.6938574, -1.503572, 1, 0.7803922, 0, 1,
-1.108963, -0.2543941, -2.220826, 1, 0.7843137, 0, 1,
-1.091646, -1.49325, 0.09916905, 1, 0.7921569, 0, 1,
-1.085702, -0.543299, -1.940297, 1, 0.7960784, 0, 1,
-1.085403, 0.4407144, -1.261462, 1, 0.8039216, 0, 1,
-1.08374, -0.2551473, -1.801822, 1, 0.8117647, 0, 1,
-1.080187, 0.2383782, -3.025407, 1, 0.8156863, 0, 1,
-1.074433, 1.116917, -2.284203, 1, 0.8235294, 0, 1,
-1.069576, 2.829213, -0.5090002, 1, 0.827451, 0, 1,
-1.061076, 1.681072, -1.92127, 1, 0.8352941, 0, 1,
-1.060225, 0.2517883, -0.7789322, 1, 0.8392157, 0, 1,
-1.053834, 1.533987, -0.02891346, 1, 0.8470588, 0, 1,
-1.05157, 0.3473461, -0.6630346, 1, 0.8509804, 0, 1,
-1.049397, 1.051629, -1.545423, 1, 0.8588235, 0, 1,
-1.0396, 0.8791388, -1.180128, 1, 0.8627451, 0, 1,
-1.034442, -0.9681033, -1.616239, 1, 0.8705882, 0, 1,
-1.024919, 1.510422, -0.4054886, 1, 0.8745098, 0, 1,
-1.024721, -0.2238307, -1.650325, 1, 0.8823529, 0, 1,
-1.02184, 1.240548, -1.962556, 1, 0.8862745, 0, 1,
-1.021786, -0.7057613, -3.153283, 1, 0.8941177, 0, 1,
-1.021186, 0.7884092, -1.272906, 1, 0.8980392, 0, 1,
-1.017639, 1.356746, 0.5716857, 1, 0.9058824, 0, 1,
-1.013953, 0.8258233, -0.8045751, 1, 0.9137255, 0, 1,
-1.013885, 0.197655, -2.149832, 1, 0.9176471, 0, 1,
-1.006218, -0.4803545, -3.763216, 1, 0.9254902, 0, 1,
-1.000043, 0.01766895, -0.3948069, 1, 0.9294118, 0, 1,
-0.996744, -0.6937609, -1.940434, 1, 0.9372549, 0, 1,
-0.9961716, -0.742656, -2.753876, 1, 0.9411765, 0, 1,
-0.9901589, 1.534748, -0.8647371, 1, 0.9490196, 0, 1,
-0.9815096, 1.32732, -1.097972, 1, 0.9529412, 0, 1,
-0.9804384, -1.11584, -2.226431, 1, 0.9607843, 0, 1,
-0.9795977, -0.6321275, -2.873903, 1, 0.9647059, 0, 1,
-0.9791732, -0.3437409, -2.536293, 1, 0.972549, 0, 1,
-0.9787021, -2.189244, -2.854249, 1, 0.9764706, 0, 1,
-0.9783065, 1.108019, -0.1394059, 1, 0.9843137, 0, 1,
-0.9760858, -0.02786416, -2.31827, 1, 0.9882353, 0, 1,
-0.9752352, -0.3335594, -1.874446, 1, 0.9960784, 0, 1,
-0.9744561, 0.007285031, -2.443148, 0.9960784, 1, 0, 1,
-0.9738531, -0.9265548, -1.962195, 0.9921569, 1, 0, 1,
-0.972288, -1.137867, -1.65069, 0.9843137, 1, 0, 1,
-0.9682682, 1.436208, 0.3899546, 0.9803922, 1, 0, 1,
-0.963725, -0.7981933, -0.8278222, 0.972549, 1, 0, 1,
-0.9635434, 0.7376953, -0.7624613, 0.9686275, 1, 0, 1,
-0.9629068, 1.062374, -2.39161, 0.9607843, 1, 0, 1,
-0.9604278, -0.1259838, -2.37117, 0.9568627, 1, 0, 1,
-0.9580182, -0.2949197, -1.334934, 0.9490196, 1, 0, 1,
-0.9568854, -0.8732404, -2.785724, 0.945098, 1, 0, 1,
-0.9559104, 1.42711, -0.2849122, 0.9372549, 1, 0, 1,
-0.9499548, -1.787373, -3.662674, 0.9333333, 1, 0, 1,
-0.9479159, 0.1379462, -1.027532, 0.9254902, 1, 0, 1,
-0.9406107, -1.622012, -2.718567, 0.9215686, 1, 0, 1,
-0.9318041, 0.9975104, -0.3695971, 0.9137255, 1, 0, 1,
-0.9263669, 0.4902267, 0.1338372, 0.9098039, 1, 0, 1,
-0.9166077, 0.6679776, -1.122722, 0.9019608, 1, 0, 1,
-0.9125035, 0.1222354, -0.5307487, 0.8941177, 1, 0, 1,
-0.9054741, 0.6152388, -2.147525, 0.8901961, 1, 0, 1,
-0.9034028, -1.39912, -0.7530616, 0.8823529, 1, 0, 1,
-0.9002779, -1.374859, -1.912319, 0.8784314, 1, 0, 1,
-0.8997729, -0.4628706, -1.339808, 0.8705882, 1, 0, 1,
-0.8924793, -0.0214022, -1.890025, 0.8666667, 1, 0, 1,
-0.8870537, -1.159286, -3.99381, 0.8588235, 1, 0, 1,
-0.8838893, 1.30332, 0.5306091, 0.854902, 1, 0, 1,
-0.8830419, 0.5224211, -1.209099, 0.8470588, 1, 0, 1,
-0.8781071, 0.6349687, -0.7327562, 0.8431373, 1, 0, 1,
-0.8733033, 1.446746, -2.572524, 0.8352941, 1, 0, 1,
-0.8717396, 1.453536, -1.139565, 0.8313726, 1, 0, 1,
-0.8655667, 1.101263, -2.596911, 0.8235294, 1, 0, 1,
-0.8586487, -1.078448, -2.00556, 0.8196079, 1, 0, 1,
-0.8564714, 0.4921809, 0.2493676, 0.8117647, 1, 0, 1,
-0.8561473, -0.02549685, -1.92102, 0.8078431, 1, 0, 1,
-0.8499054, 1.736982, -0.24235, 0.8, 1, 0, 1,
-0.8346332, -0.3434252, -2.305412, 0.7921569, 1, 0, 1,
-0.8320384, -0.05893688, -0.0255263, 0.7882353, 1, 0, 1,
-0.8273883, 0.5437369, -0.8215232, 0.7803922, 1, 0, 1,
-0.8256702, 1.226784, -1.962071, 0.7764706, 1, 0, 1,
-0.8239401, 0.1320505, -0.6384184, 0.7686275, 1, 0, 1,
-0.8197994, 1.510464, 0.8357731, 0.7647059, 1, 0, 1,
-0.8153219, -1.028816, -1.750281, 0.7568628, 1, 0, 1,
-0.8081421, -0.2920955, -1.641015, 0.7529412, 1, 0, 1,
-0.807713, -0.3975497, -2.834002, 0.7450981, 1, 0, 1,
-0.8069182, -0.2485344, -0.776647, 0.7411765, 1, 0, 1,
-0.7999617, -0.5057197, -4.590533, 0.7333333, 1, 0, 1,
-0.7941487, -0.9219921, -1.665077, 0.7294118, 1, 0, 1,
-0.7815417, 0.9852528, -0.06410453, 0.7215686, 1, 0, 1,
-0.7676442, 0.903513, -1.238513, 0.7176471, 1, 0, 1,
-0.7650301, -0.04387666, -1.148969, 0.7098039, 1, 0, 1,
-0.7620779, 0.4510276, -0.3635754, 0.7058824, 1, 0, 1,
-0.7587314, 1.363716, -1.397703, 0.6980392, 1, 0, 1,
-0.7524537, 0.4639764, -0.6891946, 0.6901961, 1, 0, 1,
-0.7505957, 1.111936, -1.666308, 0.6862745, 1, 0, 1,
-0.7499258, -0.2411115, -1.178577, 0.6784314, 1, 0, 1,
-0.7456561, -1.011908, -3.949985, 0.6745098, 1, 0, 1,
-0.7452196, -0.4448316, -3.776805, 0.6666667, 1, 0, 1,
-0.7434154, 0.7906927, -0.3820583, 0.6627451, 1, 0, 1,
-0.7430433, -1.224988, -2.385912, 0.654902, 1, 0, 1,
-0.7413064, -0.6510573, -0.6190055, 0.6509804, 1, 0, 1,
-0.7339955, -1.60412, -3.061839, 0.6431373, 1, 0, 1,
-0.7338545, 0.6276846, -0.3502597, 0.6392157, 1, 0, 1,
-0.7333764, -0.1684146, -1.251985, 0.6313726, 1, 0, 1,
-0.7320089, 0.1223212, -1.026884, 0.627451, 1, 0, 1,
-0.730445, -1.72359, -2.534346, 0.6196079, 1, 0, 1,
-0.730005, -1.669875, -2.041724, 0.6156863, 1, 0, 1,
-0.7252194, 0.5923354, -0.7254008, 0.6078432, 1, 0, 1,
-0.7191784, -0.4393873, -3.520751, 0.6039216, 1, 0, 1,
-0.7191492, -1.009804, -1.416673, 0.5960785, 1, 0, 1,
-0.7143924, 0.9168181, -0.8998986, 0.5882353, 1, 0, 1,
-0.7130538, -0.3245616, -2.642142, 0.5843138, 1, 0, 1,
-0.709402, -1.273896, -3.256153, 0.5764706, 1, 0, 1,
-0.707202, -0.9923382, -2.697999, 0.572549, 1, 0, 1,
-0.7019997, -0.01516634, -1.76273, 0.5647059, 1, 0, 1,
-0.6978097, -2.060302, -2.996547, 0.5607843, 1, 0, 1,
-0.6912673, 1.052605, -1.122139, 0.5529412, 1, 0, 1,
-0.6877372, -0.6367825, -2.895702, 0.5490196, 1, 0, 1,
-0.6845547, -1.021564, -0.8087922, 0.5411765, 1, 0, 1,
-0.6774207, -1.187395, -1.617094, 0.5372549, 1, 0, 1,
-0.676159, -1.623836, -3.264735, 0.5294118, 1, 0, 1,
-0.6722147, 0.3365907, -0.5855539, 0.5254902, 1, 0, 1,
-0.6584127, -0.799041, -2.406581, 0.5176471, 1, 0, 1,
-0.6555791, 1.15254, 0.722434, 0.5137255, 1, 0, 1,
-0.6537799, -0.4338825, -2.064865, 0.5058824, 1, 0, 1,
-0.6514831, 0.7229908, 0.660666, 0.5019608, 1, 0, 1,
-0.6478868, -1.271115, -0.4876491, 0.4941176, 1, 0, 1,
-0.6401867, -0.4502466, -1.893589, 0.4862745, 1, 0, 1,
-0.6360243, -1.026728, -4.304961, 0.4823529, 1, 0, 1,
-0.6311995, 0.1077069, -0.7190882, 0.4745098, 1, 0, 1,
-0.6243179, 0.7350929, -3.733366, 0.4705882, 1, 0, 1,
-0.6231871, 0.2579659, -1.131989, 0.4627451, 1, 0, 1,
-0.621971, -0.04650301, -1.430095, 0.4588235, 1, 0, 1,
-0.6218705, 0.5637846, -0.723805, 0.4509804, 1, 0, 1,
-0.6204205, 0.3008577, 0.5689247, 0.4470588, 1, 0, 1,
-0.6133079, 1.417867, 0.8577442, 0.4392157, 1, 0, 1,
-0.6042169, 0.6420711, -1.612427, 0.4352941, 1, 0, 1,
-0.6015992, -0.7473811, -3.529463, 0.427451, 1, 0, 1,
-0.5999247, 0.6176003, -0.8291576, 0.4235294, 1, 0, 1,
-0.5878211, -1.080075, -2.090217, 0.4156863, 1, 0, 1,
-0.5862387, -0.2846185, -0.798274, 0.4117647, 1, 0, 1,
-0.5851679, 0.7170172, -2.444071, 0.4039216, 1, 0, 1,
-0.5849063, -0.1896258, -2.063578, 0.3960784, 1, 0, 1,
-0.5809979, 1.183282, -0.2151921, 0.3921569, 1, 0, 1,
-0.5800706, -1.423327, -3.430581, 0.3843137, 1, 0, 1,
-0.5782569, -0.3998579, -1.060912, 0.3803922, 1, 0, 1,
-0.5766492, -0.3160412, -1.367069, 0.372549, 1, 0, 1,
-0.575235, 0.5120376, 0.01237118, 0.3686275, 1, 0, 1,
-0.5740359, 0.04924028, -1.282418, 0.3607843, 1, 0, 1,
-0.5731925, 0.04117092, -1.969306, 0.3568628, 1, 0, 1,
-0.5718507, -0.5185959, -2.801007, 0.3490196, 1, 0, 1,
-0.5714721, -1.794037, -1.786885, 0.345098, 1, 0, 1,
-0.5655129, 0.4780208, -0.05392291, 0.3372549, 1, 0, 1,
-0.5642918, 0.5812308, 0.0006867676, 0.3333333, 1, 0, 1,
-0.559056, -1.802806, -3.248497, 0.3254902, 1, 0, 1,
-0.5587655, 0.6472573, -0.1311938, 0.3215686, 1, 0, 1,
-0.550244, 0.6725985, -2.391795, 0.3137255, 1, 0, 1,
-0.5393977, -0.01437006, -0.5979464, 0.3098039, 1, 0, 1,
-0.5393637, -0.9241678, -1.704151, 0.3019608, 1, 0, 1,
-0.5359265, -1.183737, -1.506673, 0.2941177, 1, 0, 1,
-0.5353524, 0.1338347, -2.137269, 0.2901961, 1, 0, 1,
-0.5290143, -0.1724816, -0.4340642, 0.282353, 1, 0, 1,
-0.5238538, 1.108553, 0.8602929, 0.2784314, 1, 0, 1,
-0.5223035, -0.1839132, -0.9027304, 0.2705882, 1, 0, 1,
-0.5101615, 1.852345, -2.807431, 0.2666667, 1, 0, 1,
-0.5070833, 0.5747248, -2.161488, 0.2588235, 1, 0, 1,
-0.5068574, 0.8686179, -0.3583671, 0.254902, 1, 0, 1,
-0.5063802, 0.2102142, -1.403656, 0.2470588, 1, 0, 1,
-0.5061992, -1.906501, -2.939445, 0.2431373, 1, 0, 1,
-0.5028956, 0.6490874, -0.107317, 0.2352941, 1, 0, 1,
-0.4987122, -0.1077945, -2.662137, 0.2313726, 1, 0, 1,
-0.4934509, 0.6895242, -0.2961729, 0.2235294, 1, 0, 1,
-0.4911363, -0.2713782, -1.554011, 0.2196078, 1, 0, 1,
-0.4871522, 1.254775, -1.835536, 0.2117647, 1, 0, 1,
-0.4819391, -0.4280465, -4.082163, 0.2078431, 1, 0, 1,
-0.4754296, 0.5552602, -1.958865, 0.2, 1, 0, 1,
-0.4732563, -1.536531, -2.281754, 0.1921569, 1, 0, 1,
-0.4712715, 0.7132837, -1.226892, 0.1882353, 1, 0, 1,
-0.4704628, 0.3853824, -1.639581, 0.1803922, 1, 0, 1,
-0.4680647, -0.4188848, -2.696611, 0.1764706, 1, 0, 1,
-0.4648395, -0.7500064, -1.928442, 0.1686275, 1, 0, 1,
-0.4616614, 0.3940155, -0.9658332, 0.1647059, 1, 0, 1,
-0.4586667, -2.507411, -2.338023, 0.1568628, 1, 0, 1,
-0.4575113, -1.162748, -1.401693, 0.1529412, 1, 0, 1,
-0.4566088, -0.08013061, -1.909392, 0.145098, 1, 0, 1,
-0.4545135, -0.7907679, -3.83666, 0.1411765, 1, 0, 1,
-0.4446185, -0.09568594, -1.883556, 0.1333333, 1, 0, 1,
-0.4393933, 0.175458, -0.9808714, 0.1294118, 1, 0, 1,
-0.4385855, 0.5908686, -1.428611, 0.1215686, 1, 0, 1,
-0.436083, 0.6304369, 1.020133, 0.1176471, 1, 0, 1,
-0.4336421, -0.3357644, -3.469015, 0.1098039, 1, 0, 1,
-0.4303899, -0.4146753, -3.852618, 0.1058824, 1, 0, 1,
-0.4281442, 0.3815528, -2.253749, 0.09803922, 1, 0, 1,
-0.4180624, -1.894612, -1.684998, 0.09019608, 1, 0, 1,
-0.4168147, -0.07556713, -1.648333, 0.08627451, 1, 0, 1,
-0.416344, -0.07178356, -0.8481231, 0.07843138, 1, 0, 1,
-0.4139046, -1.232419, -4.507442, 0.07450981, 1, 0, 1,
-0.4108978, -0.4599509, -2.500625, 0.06666667, 1, 0, 1,
-0.4087554, 1.109323, 0.2333841, 0.0627451, 1, 0, 1,
-0.4022653, -0.3897599, -1.624432, 0.05490196, 1, 0, 1,
-0.4021437, 0.3291984, -0.3723556, 0.05098039, 1, 0, 1,
-0.3996812, -0.07336986, -2.191084, 0.04313726, 1, 0, 1,
-0.3982878, 1.109318, -0.651909, 0.03921569, 1, 0, 1,
-0.3935119, -1.311586, -3.971484, 0.03137255, 1, 0, 1,
-0.3931766, 0.8967377, -0.561457, 0.02745098, 1, 0, 1,
-0.3922984, 0.6810607, 1.29169, 0.01960784, 1, 0, 1,
-0.3910616, -0.007159128, -1.03405, 0.01568628, 1, 0, 1,
-0.3883406, 0.5064533, -0.6586599, 0.007843138, 1, 0, 1,
-0.3833856, 0.8688, 0.8594928, 0.003921569, 1, 0, 1,
-0.3757371, 1.552419, 0.05671488, 0, 1, 0.003921569, 1,
-0.373508, -0.6799397, -1.624393, 0, 1, 0.01176471, 1,
-0.3730359, 0.4472886, -1.05691, 0, 1, 0.01568628, 1,
-0.370607, 0.4944646, -0.0635791, 0, 1, 0.02352941, 1,
-0.3689622, 0.07888947, -0.3697316, 0, 1, 0.02745098, 1,
-0.3684669, -0.9191169, -3.241597, 0, 1, 0.03529412, 1,
-0.3601717, 0.9534138, -0.6218206, 0, 1, 0.03921569, 1,
-0.3586119, 0.6503733, -1.091666, 0, 1, 0.04705882, 1,
-0.3523355, 1.915759, 1.216041, 0, 1, 0.05098039, 1,
-0.3519608, -0.8837453, -3.388345, 0, 1, 0.05882353, 1,
-0.3470898, 0.162236, -1.684758, 0, 1, 0.0627451, 1,
-0.3449048, -0.8602225, -4.408076, 0, 1, 0.07058824, 1,
-0.3407806, -0.1879278, -2.693294, 0, 1, 0.07450981, 1,
-0.3387263, 0.522824, 0.03902665, 0, 1, 0.08235294, 1,
-0.3329909, -0.5499591, -3.982275, 0, 1, 0.08627451, 1,
-0.3323212, -0.7440969, -3.066369, 0, 1, 0.09411765, 1,
-0.3263174, -0.1669495, -1.269555, 0, 1, 0.1019608, 1,
-0.3261837, -0.9145474, -3.638748, 0, 1, 0.1058824, 1,
-0.3215355, -1.696885, -2.699352, 0, 1, 0.1137255, 1,
-0.3193435, -0.07756488, -1.409592, 0, 1, 0.1176471, 1,
-0.3093022, -0.4508019, -1.450716, 0, 1, 0.1254902, 1,
-0.3090468, -0.2917698, -3.109538, 0, 1, 0.1294118, 1,
-0.3076381, -0.2054505, -1.533503, 0, 1, 0.1372549, 1,
-0.306711, 0.4465368, -1.985555, 0, 1, 0.1411765, 1,
-0.3060047, 0.9511275, -1.037909, 0, 1, 0.1490196, 1,
-0.3008705, 0.2338412, -1.68975, 0, 1, 0.1529412, 1,
-0.3007595, -0.5375844, -4.353433, 0, 1, 0.1607843, 1,
-0.3001482, -0.9764044, -1.103787, 0, 1, 0.1647059, 1,
-0.2990634, -0.9560186, -3.578677, 0, 1, 0.172549, 1,
-0.2935038, 2.623203, 0.3336099, 0, 1, 0.1764706, 1,
-0.2922927, 2.002491, 0.6240792, 0, 1, 0.1843137, 1,
-0.2894608, 2.640851, 0.8133346, 0, 1, 0.1882353, 1,
-0.2879664, 0.88273, -0.5223387, 0, 1, 0.1960784, 1,
-0.2849206, 1.503201, -1.326316, 0, 1, 0.2039216, 1,
-0.2836095, -1.162711, -2.328776, 0, 1, 0.2078431, 1,
-0.2810492, 1.694872, 0.3222342, 0, 1, 0.2156863, 1,
-0.2798213, -2.522628, -3.015982, 0, 1, 0.2196078, 1,
-0.2769372, -1.712192, -2.595892, 0, 1, 0.227451, 1,
-0.2722214, -0.8825923, -4.649433, 0, 1, 0.2313726, 1,
-0.2672655, 1.346523, -1.518592, 0, 1, 0.2392157, 1,
-0.2659324, -0.1658161, -2.394659, 0, 1, 0.2431373, 1,
-0.2654234, -0.8889974, -2.959217, 0, 1, 0.2509804, 1,
-0.2626272, -0.7849939, -1.75419, 0, 1, 0.254902, 1,
-0.2540339, -1.410452, -4.331417, 0, 1, 0.2627451, 1,
-0.2529859, 0.9679811, -1.226407, 0, 1, 0.2666667, 1,
-0.2500631, 1.571038, -0.489599, 0, 1, 0.2745098, 1,
-0.2449918, 2.20126, -1.035371, 0, 1, 0.2784314, 1,
-0.2443554, -1.630099, -2.767935, 0, 1, 0.2862745, 1,
-0.2430316, 0.324471, -0.4817031, 0, 1, 0.2901961, 1,
-0.237391, 0.5369071, -2.549581, 0, 1, 0.2980392, 1,
-0.236723, 1.570827, 0.8595234, 0, 1, 0.3058824, 1,
-0.235488, 0.8741273, 0.51583, 0, 1, 0.3098039, 1,
-0.2350945, -0.09037093, -0.02612311, 0, 1, 0.3176471, 1,
-0.2278166, 0.006185096, -0.8144719, 0, 1, 0.3215686, 1,
-0.225819, -0.1760631, -1.354089, 0, 1, 0.3294118, 1,
-0.2249202, 0.9860024, 0.85368, 0, 1, 0.3333333, 1,
-0.2235266, -0.0594929, -1.667171, 0, 1, 0.3411765, 1,
-0.2221775, -1.663397, -2.380082, 0, 1, 0.345098, 1,
-0.2220237, -0.6802037, -3.447601, 0, 1, 0.3529412, 1,
-0.2205963, 0.1508122, 1.322329, 0, 1, 0.3568628, 1,
-0.2160594, 0.2977555, -0.102039, 0, 1, 0.3647059, 1,
-0.2154716, 0.6747695, -0.3988363, 0, 1, 0.3686275, 1,
-0.2121742, -0.1762845, -1.893357, 0, 1, 0.3764706, 1,
-0.2105273, -0.6983203, -2.18701, 0, 1, 0.3803922, 1,
-0.2049717, -0.8021745, -3.830341, 0, 1, 0.3882353, 1,
-0.2036655, 0.1405943, -1.05803, 0, 1, 0.3921569, 1,
-0.2023142, -0.9350695, -2.314191, 0, 1, 0.4, 1,
-0.1975223, -1.133619, -3.346219, 0, 1, 0.4078431, 1,
-0.1955183, 1.106404, -1.219381, 0, 1, 0.4117647, 1,
-0.1941736, -0.4438777, -1.212952, 0, 1, 0.4196078, 1,
-0.1901062, 0.2607213, 0.09180164, 0, 1, 0.4235294, 1,
-0.1891381, -1.044887, -1.922244, 0, 1, 0.4313726, 1,
-0.188848, -0.1444786, -2.913451, 0, 1, 0.4352941, 1,
-0.1885206, 0.7015467, -2.081151, 0, 1, 0.4431373, 1,
-0.1879557, 1.070896, -1.395493, 0, 1, 0.4470588, 1,
-0.1854477, -1.514742, -3.598551, 0, 1, 0.454902, 1,
-0.1829604, -3.2796, -1.763369, 0, 1, 0.4588235, 1,
-0.1797037, -0.04202446, -1.515977, 0, 1, 0.4666667, 1,
-0.1781792, 0.01230363, -3.079803, 0, 1, 0.4705882, 1,
-0.1767292, 0.09944424, -1.582743, 0, 1, 0.4784314, 1,
-0.1765064, 0.9006777, -0.2889903, 0, 1, 0.4823529, 1,
-0.1744414, -0.6100465, -2.47961, 0, 1, 0.4901961, 1,
-0.1648634, 0.5453477, -0.676469, 0, 1, 0.4941176, 1,
-0.1644147, -1.112402, -3.600237, 0, 1, 0.5019608, 1,
-0.1641938, -0.03206721, -2.356869, 0, 1, 0.509804, 1,
-0.1526583, -0.6877935, -1.8403, 0, 1, 0.5137255, 1,
-0.1504204, 0.1694894, -0.7291609, 0, 1, 0.5215687, 1,
-0.146935, -1.015726, -2.639971, 0, 1, 0.5254902, 1,
-0.1415602, -0.301289, -1.92246, 0, 1, 0.5333334, 1,
-0.1400345, -0.2880809, -3.592494, 0, 1, 0.5372549, 1,
-0.1362699, 0.584655, -0.3652311, 0, 1, 0.5450981, 1,
-0.1341488, 0.06010105, -2.136778, 0, 1, 0.5490196, 1,
-0.1255532, -0.06029712, -3.187771, 0, 1, 0.5568628, 1,
-0.1217885, -0.1064998, -3.676924, 0, 1, 0.5607843, 1,
-0.1216413, -0.07764772, -3.108695, 0, 1, 0.5686275, 1,
-0.1213752, -0.5081508, -2.527872, 0, 1, 0.572549, 1,
-0.1173242, 1.695964, -0.3186007, 0, 1, 0.5803922, 1,
-0.1162437, -1.143096, -2.599368, 0, 1, 0.5843138, 1,
-0.1120369, 0.9912948, -0.0764275, 0, 1, 0.5921569, 1,
-0.10894, -0.4722814, -2.493003, 0, 1, 0.5960785, 1,
-0.1084474, 2.706896, -1.718866, 0, 1, 0.6039216, 1,
-0.108078, -1.625802, -3.038381, 0, 1, 0.6117647, 1,
-0.1062339, 1.448449, -1.213668, 0, 1, 0.6156863, 1,
-0.1008847, -0.642951, -2.879995, 0, 1, 0.6235294, 1,
-0.09639805, -1.250315, -2.225646, 0, 1, 0.627451, 1,
-0.09369037, 1.169899, 2.243308, 0, 1, 0.6352941, 1,
-0.08906711, -0.9439818, -2.68996, 0, 1, 0.6392157, 1,
-0.08871484, -1.519316, -2.291952, 0, 1, 0.6470588, 1,
-0.08863476, 1.183948, -0.01139152, 0, 1, 0.6509804, 1,
-0.08665568, -0.6097513, -2.697907, 0, 1, 0.6588235, 1,
-0.08618216, -0.8487732, -3.659279, 0, 1, 0.6627451, 1,
-0.08363625, -0.5254002, -2.882512, 0, 1, 0.6705883, 1,
-0.08057494, 2.736251, 0.6750731, 0, 1, 0.6745098, 1,
-0.07838719, -0.2062611, -3.186168, 0, 1, 0.682353, 1,
-0.07421977, 1.11079, -1.585912, 0, 1, 0.6862745, 1,
-0.06574524, 0.1553559, -0.6862357, 0, 1, 0.6941177, 1,
-0.06344803, -0.2914447, -1.066519, 0, 1, 0.7019608, 1,
-0.0623195, -0.3337634, -1.432073, 0, 1, 0.7058824, 1,
-0.06170246, -0.3264699, -2.62649, 0, 1, 0.7137255, 1,
-0.05962106, -0.705376, -2.854185, 0, 1, 0.7176471, 1,
-0.05947515, -0.9478893, -2.325555, 0, 1, 0.7254902, 1,
-0.05780854, 1.09545, -0.9408694, 0, 1, 0.7294118, 1,
-0.05623726, 0.9099219, -0.7240905, 0, 1, 0.7372549, 1,
-0.05580922, 2.07761, -1.615835, 0, 1, 0.7411765, 1,
-0.05370336, -0.6428681, -2.340313, 0, 1, 0.7490196, 1,
-0.05243088, 1.284953, 1.492367, 0, 1, 0.7529412, 1,
-0.04886862, 0.4179138, -0.2048255, 0, 1, 0.7607843, 1,
-0.047794, 0.7581661, -0.4130662, 0, 1, 0.7647059, 1,
-0.0466207, -0.2839302, -1.736741, 0, 1, 0.772549, 1,
-0.03979103, 0.6805867, -1.200209, 0, 1, 0.7764706, 1,
-0.0299, -1.199663, -3.615794, 0, 1, 0.7843137, 1,
-0.02962323, -0.710094, -4.631238, 0, 1, 0.7882353, 1,
-0.02821122, -0.5970381, -2.732866, 0, 1, 0.7960784, 1,
-0.02754409, -1.795769, -2.334933, 0, 1, 0.8039216, 1,
-0.02706063, -0.5723137, -3.218371, 0, 1, 0.8078431, 1,
-0.02519755, 0.2702352, 0.2929319, 0, 1, 0.8156863, 1,
-0.02475766, -0.1922369, -2.335837, 0, 1, 0.8196079, 1,
-0.02099475, -0.09119023, -3.88637, 0, 1, 0.827451, 1,
-0.02039649, 0.3023241, -0.3945043, 0, 1, 0.8313726, 1,
-0.01966924, -0.7864213, -4.075891, 0, 1, 0.8392157, 1,
-0.01435287, -0.9671103, -2.62206, 0, 1, 0.8431373, 1,
-0.01310624, -0.4539135, -3.117866, 0, 1, 0.8509804, 1,
-0.00877875, -0.01319664, -2.972722, 0, 1, 0.854902, 1,
-0.008006777, -1.532397, -2.767122, 0, 1, 0.8627451, 1,
-0.003260935, -0.3834157, -3.543283, 0, 1, 0.8666667, 1,
0.00163991, -1.272682, 5.215644, 0, 1, 0.8745098, 1,
0.004860427, -0.8017476, 2.458523, 0, 1, 0.8784314, 1,
0.00511835, -0.445237, 4.851219, 0, 1, 0.8862745, 1,
0.008067671, -0.8190348, 2.701468, 0, 1, 0.8901961, 1,
0.01339774, -0.147547, 1.483896, 0, 1, 0.8980392, 1,
0.01490432, -0.5890232, 3.815922, 0, 1, 0.9058824, 1,
0.01711618, -1.166511, 3.693059, 0, 1, 0.9098039, 1,
0.01895385, -0.6603059, 1.471875, 0, 1, 0.9176471, 1,
0.02225643, -0.8902396, 4.822181, 0, 1, 0.9215686, 1,
0.02532236, -0.08181917, 3.379435, 0, 1, 0.9294118, 1,
0.02948388, 0.1575974, -0.4310162, 0, 1, 0.9333333, 1,
0.02957463, -0.5754563, 3.96889, 0, 1, 0.9411765, 1,
0.03053957, -1.661363, 3.074509, 0, 1, 0.945098, 1,
0.03212445, -1.155424, 4.063353, 0, 1, 0.9529412, 1,
0.03994219, 0.3246801, -0.2749661, 0, 1, 0.9568627, 1,
0.04094272, -0.7756151, 4.86117, 0, 1, 0.9647059, 1,
0.04302192, -0.6469838, 3.369882, 0, 1, 0.9686275, 1,
0.04440672, -0.06769288, 2.338627, 0, 1, 0.9764706, 1,
0.04596618, 0.6384066, 0.6059374, 0, 1, 0.9803922, 1,
0.04894927, -1.515891, 3.061258, 0, 1, 0.9882353, 1,
0.04991372, -1.496812, 3.090004, 0, 1, 0.9921569, 1,
0.05130674, 0.9368576, 0.5965254, 0, 1, 1, 1,
0.05397908, 0.9644558, -0.800276, 0, 0.9921569, 1, 1,
0.0550538, 0.1856358, 1.950519, 0, 0.9882353, 1, 1,
0.05589549, 0.7629369, -0.9478542, 0, 0.9803922, 1, 1,
0.05690052, -0.6617483, 2.05964, 0, 0.9764706, 1, 1,
0.05903371, -0.5487494, 1.437095, 0, 0.9686275, 1, 1,
0.0619106, 0.0352811, 0.9919702, 0, 0.9647059, 1, 1,
0.06467874, -1.384434, 2.488739, 0, 0.9568627, 1, 1,
0.06976017, 0.4498855, -1.51598, 0, 0.9529412, 1, 1,
0.0709196, -1.006051, 4.844217, 0, 0.945098, 1, 1,
0.07198291, -2.104968, 2.199102, 0, 0.9411765, 1, 1,
0.07225068, -0.9450083, 4.092524, 0, 0.9333333, 1, 1,
0.07248777, -0.1126166, 0.8209601, 0, 0.9294118, 1, 1,
0.07266781, 0.825901, 0.1641304, 0, 0.9215686, 1, 1,
0.07389524, -0.2893555, 2.720144, 0, 0.9176471, 1, 1,
0.07646693, 0.337475, 1.484851, 0, 0.9098039, 1, 1,
0.07706636, -1.913041, 4.190767, 0, 0.9058824, 1, 1,
0.07749171, -1.065095, 3.577225, 0, 0.8980392, 1, 1,
0.07915953, -0.3172668, 2.795842, 0, 0.8901961, 1, 1,
0.08074798, -1.020251, 5.200082, 0, 0.8862745, 1, 1,
0.08372179, -0.9384556, 3.293101, 0, 0.8784314, 1, 1,
0.09109666, 0.3443816, 0.7154325, 0, 0.8745098, 1, 1,
0.09749489, 0.4661279, 0.08476696, 0, 0.8666667, 1, 1,
0.1047708, -0.08391278, 4.63201, 0, 0.8627451, 1, 1,
0.10501, 0.3743722, -0.6674102, 0, 0.854902, 1, 1,
0.1059544, 1.806747, 0.7663081, 0, 0.8509804, 1, 1,
0.1067563, -0.6668223, 3.003835, 0, 0.8431373, 1, 1,
0.106952, 2.251169, -1.142111, 0, 0.8392157, 1, 1,
0.1074657, -0.1923462, 3.29464, 0, 0.8313726, 1, 1,
0.1077065, 1.504801, 0.8756908, 0, 0.827451, 1, 1,
0.1143641, 1.129451, -0.5896329, 0, 0.8196079, 1, 1,
0.1175224, 1.192528, 0.1758721, 0, 0.8156863, 1, 1,
0.1204683, -0.1175796, 2.079588, 0, 0.8078431, 1, 1,
0.1205398, 0.194008, -1.181953, 0, 0.8039216, 1, 1,
0.1212341, -1.290496, 3.482976, 0, 0.7960784, 1, 1,
0.1256423, -0.4386101, 2.669184, 0, 0.7882353, 1, 1,
0.1294122, 0.9057277, 0.2220514, 0, 0.7843137, 1, 1,
0.1327496, -1.642017, 1.554558, 0, 0.7764706, 1, 1,
0.134507, -0.1233741, 2.407122, 0, 0.772549, 1, 1,
0.1351738, 0.202779, -1.723416, 0, 0.7647059, 1, 1,
0.1382785, 0.0869594, 0.5466582, 0, 0.7607843, 1, 1,
0.1383881, 0.5087149, 0.7708187, 0, 0.7529412, 1, 1,
0.1406817, 0.3941386, -0.9702521, 0, 0.7490196, 1, 1,
0.1446117, -0.986393, 2.024653, 0, 0.7411765, 1, 1,
0.1462346, -0.7741935, 2.668737, 0, 0.7372549, 1, 1,
0.1463835, -0.3328453, 2.365173, 0, 0.7294118, 1, 1,
0.1468421, -0.6385332, 4.211607, 0, 0.7254902, 1, 1,
0.150903, 0.2878377, 1.364626, 0, 0.7176471, 1, 1,
0.1516086, -1.421337, 3.377376, 0, 0.7137255, 1, 1,
0.1583967, -0.400064, 3.185631, 0, 0.7058824, 1, 1,
0.1605477, -0.9060708, 3.075826, 0, 0.6980392, 1, 1,
0.161014, -0.08743487, 1.66418, 0, 0.6941177, 1, 1,
0.1615247, -0.1182403, 3.042685, 0, 0.6862745, 1, 1,
0.1639846, 0.3431257, 0.2189232, 0, 0.682353, 1, 1,
0.1690779, 0.3447561, 1.367411, 0, 0.6745098, 1, 1,
0.1715295, -0.06550144, 2.059171, 0, 0.6705883, 1, 1,
0.1725614, -0.5941632, 4.287021, 0, 0.6627451, 1, 1,
0.1726625, -2.39657, 2.51329, 0, 0.6588235, 1, 1,
0.1739588, -0.1381505, 1.571097, 0, 0.6509804, 1, 1,
0.1750951, 0.4689352, 0.2646431, 0, 0.6470588, 1, 1,
0.1756011, -0.1943985, 1.115777, 0, 0.6392157, 1, 1,
0.1796843, 0.7402336, 0.9040135, 0, 0.6352941, 1, 1,
0.1838076, -0.3562656, 4.820756, 0, 0.627451, 1, 1,
0.1888424, 2.020591, -0.9775704, 0, 0.6235294, 1, 1,
0.1905837, 2.000988, -0.7506618, 0, 0.6156863, 1, 1,
0.1909183, -1.445, 2.537091, 0, 0.6117647, 1, 1,
0.1928775, -0.5383799, -0.1284733, 0, 0.6039216, 1, 1,
0.1953452, -2.769532, 3.481076, 0, 0.5960785, 1, 1,
0.1978458, 0.5722168, -0.7079014, 0, 0.5921569, 1, 1,
0.2018438, 1.586956, -0.7080476, 0, 0.5843138, 1, 1,
0.2068365, -0.3601703, 2.420996, 0, 0.5803922, 1, 1,
0.2094701, -2.304403, 1.715072, 0, 0.572549, 1, 1,
0.2105612, -0.7330176, 3.166837, 0, 0.5686275, 1, 1,
0.2137187, -0.7004478, 2.803405, 0, 0.5607843, 1, 1,
0.2137478, 1.265969, 0.6763328, 0, 0.5568628, 1, 1,
0.2138181, 0.9107109, 1.024624, 0, 0.5490196, 1, 1,
0.2155167, -0.9138222, 2.422853, 0, 0.5450981, 1, 1,
0.2158725, 0.5337499, 0.3054523, 0, 0.5372549, 1, 1,
0.2166687, -1.660774, 2.895446, 0, 0.5333334, 1, 1,
0.2187007, -1.851493, 2.717648, 0, 0.5254902, 1, 1,
0.2197812, 0.2819606, -0.6559278, 0, 0.5215687, 1, 1,
0.2214893, 0.5384944, 2.047078, 0, 0.5137255, 1, 1,
0.2251236, -0.2204379, 1.274579, 0, 0.509804, 1, 1,
0.2291229, -0.04902783, 2.170367, 0, 0.5019608, 1, 1,
0.2314164, 0.548661, 0.4749012, 0, 0.4941176, 1, 1,
0.2343722, 0.5167053, 1.104697, 0, 0.4901961, 1, 1,
0.2357963, -1.334268, 3.155407, 0, 0.4823529, 1, 1,
0.2364474, 1.163694, -0.9544019, 0, 0.4784314, 1, 1,
0.2483015, -0.01332127, -0.4289606, 0, 0.4705882, 1, 1,
0.2534304, 0.9628822, -0.5302775, 0, 0.4666667, 1, 1,
0.2552282, -0.7818712, 2.409994, 0, 0.4588235, 1, 1,
0.2611974, 1.501267, 1.892523, 0, 0.454902, 1, 1,
0.2678543, -1.190285, 2.839044, 0, 0.4470588, 1, 1,
0.2681313, 0.04667226, 1.027447, 0, 0.4431373, 1, 1,
0.2717931, -1.514529, 2.032048, 0, 0.4352941, 1, 1,
0.2719423, 1.042442, 0.8938479, 0, 0.4313726, 1, 1,
0.2770613, 0.2639103, 1.154713, 0, 0.4235294, 1, 1,
0.2785897, 0.8627158, 1.674702, 0, 0.4196078, 1, 1,
0.2802304, 0.6871483, 2.275354, 0, 0.4117647, 1, 1,
0.2844815, -0.6389192, 2.650687, 0, 0.4078431, 1, 1,
0.2875502, 0.3691324, 2.465586, 0, 0.4, 1, 1,
0.2954766, 0.6043929, -1.200348, 0, 0.3921569, 1, 1,
0.2975953, -0.7273917, 2.91589, 0, 0.3882353, 1, 1,
0.2986837, 1.353945, 0.1464673, 0, 0.3803922, 1, 1,
0.2997957, -0.8346097, 2.669092, 0, 0.3764706, 1, 1,
0.3018695, 0.7070308, 1.477491, 0, 0.3686275, 1, 1,
0.3026193, 0.6286962, -1.449371, 0, 0.3647059, 1, 1,
0.3050275, -0.9419845, 3.429502, 0, 0.3568628, 1, 1,
0.3085829, 0.4486915, 1.813652, 0, 0.3529412, 1, 1,
0.3089213, 0.5474778, -0.580828, 0, 0.345098, 1, 1,
0.309885, -2.389936, 2.238379, 0, 0.3411765, 1, 1,
0.3115839, 1.632952, 0.3372034, 0, 0.3333333, 1, 1,
0.3122887, -0.1155514, 3.236063, 0, 0.3294118, 1, 1,
0.3125411, -0.05704991, 2.417658, 0, 0.3215686, 1, 1,
0.3151202, 1.116364, -1.722103, 0, 0.3176471, 1, 1,
0.316514, 1.164478, 0.022726, 0, 0.3098039, 1, 1,
0.3170376, 0.06839183, 2.649112, 0, 0.3058824, 1, 1,
0.3210186, 2.175796, 1.183193, 0, 0.2980392, 1, 1,
0.321686, 1.56128, -1.223739, 0, 0.2901961, 1, 1,
0.3250554, -1.106988, 2.717324, 0, 0.2862745, 1, 1,
0.326449, 0.6440057, 1.731223, 0, 0.2784314, 1, 1,
0.3297139, 0.0955762, 0.1544963, 0, 0.2745098, 1, 1,
0.3299278, -0.4125318, 3.537, 0, 0.2666667, 1, 1,
0.3319804, 0.7839983, 2.705971, 0, 0.2627451, 1, 1,
0.3358578, -0.2438703, 1.972618, 0, 0.254902, 1, 1,
0.3389975, -2.381387, 2.791287, 0, 0.2509804, 1, 1,
0.3419249, 1.012386, 0.7761301, 0, 0.2431373, 1, 1,
0.3498717, -0.5611302, 3.166901, 0, 0.2392157, 1, 1,
0.3514503, 1.84922, 0.2977527, 0, 0.2313726, 1, 1,
0.3535675, -2.042275, 2.588869, 0, 0.227451, 1, 1,
0.3596582, 0.5092415, 0.9436116, 0, 0.2196078, 1, 1,
0.3609418, 0.310405, 0.8220033, 0, 0.2156863, 1, 1,
0.3614439, -0.932776, 2.065488, 0, 0.2078431, 1, 1,
0.367176, 0.5106871, 1.103704, 0, 0.2039216, 1, 1,
0.3679276, 0.01242035, 3.240011, 0, 0.1960784, 1, 1,
0.3755521, -0.7815762, 3.902171, 0, 0.1882353, 1, 1,
0.3776864, -0.4919093, 4.162548, 0, 0.1843137, 1, 1,
0.3813907, 0.1952611, 1.887844, 0, 0.1764706, 1, 1,
0.3845893, -0.1709818, 1.873345, 0, 0.172549, 1, 1,
0.3890575, -1.668816, 3.979636, 0, 0.1647059, 1, 1,
0.3901035, -0.5283131, 2.5603, 0, 0.1607843, 1, 1,
0.3931074, -0.00457288, 3.570441, 0, 0.1529412, 1, 1,
0.3958831, -1.40591, 2.275967, 0, 0.1490196, 1, 1,
0.3959782, -0.3119134, 2.531591, 0, 0.1411765, 1, 1,
0.397027, 0.9720813, -0.8081086, 0, 0.1372549, 1, 1,
0.3997477, -1.468427, 4.282691, 0, 0.1294118, 1, 1,
0.4008973, 0.2601675, 0.8027247, 0, 0.1254902, 1, 1,
0.4029005, 1.79468, -0.5317616, 0, 0.1176471, 1, 1,
0.4044513, 0.0841968, 1.072806, 0, 0.1137255, 1, 1,
0.4064867, -1.066569, 3.285195, 0, 0.1058824, 1, 1,
0.4075232, 0.9782213, -2.393492, 0, 0.09803922, 1, 1,
0.4083888, 2.50533, -1.092925, 0, 0.09411765, 1, 1,
0.4094385, -1.304368, 3.725133, 0, 0.08627451, 1, 1,
0.4151273, -0.4057469, 5.279001, 0, 0.08235294, 1, 1,
0.4152711, 0.2685179, -0.3028357, 0, 0.07450981, 1, 1,
0.4154202, -0.9590006, 2.158222, 0, 0.07058824, 1, 1,
0.4193133, -1.653877, 3.532503, 0, 0.0627451, 1, 1,
0.4198342, 1.278287, 0.8501822, 0, 0.05882353, 1, 1,
0.42158, -0.5762265, 1.647731, 0, 0.05098039, 1, 1,
0.4229494, -1.385102, 1.932901, 0, 0.04705882, 1, 1,
0.424546, -1.239331, 2.428671, 0, 0.03921569, 1, 1,
0.4259624, -0.1203862, 2.108745, 0, 0.03529412, 1, 1,
0.4308293, 0.1316265, -0.1323746, 0, 0.02745098, 1, 1,
0.4313124, 0.04527183, 2.705776, 0, 0.02352941, 1, 1,
0.4316273, -1.13636, 4.378986, 0, 0.01568628, 1, 1,
0.4318447, 1.033846, 0.4256692, 0, 0.01176471, 1, 1,
0.4355085, 1.059965, 1.054458, 0, 0.003921569, 1, 1,
0.4355608, 0.5665342, 0.1874858, 0.003921569, 0, 1, 1,
0.4372495, -0.4797933, 2.584032, 0.007843138, 0, 1, 1,
0.4385156, 0.2297535, 1.400477, 0.01568628, 0, 1, 1,
0.4401016, 0.4623007, 0.2683781, 0.01960784, 0, 1, 1,
0.4440208, -1.004241, 2.221749, 0.02745098, 0, 1, 1,
0.444588, -0.6819316, 2.984655, 0.03137255, 0, 1, 1,
0.4512987, 0.6196259, 1.613048, 0.03921569, 0, 1, 1,
0.4564505, -0.5720332, 1.267939, 0.04313726, 0, 1, 1,
0.459076, 1.276269, 0.2817572, 0.05098039, 0, 1, 1,
0.4598295, -0.3676728, 2.218039, 0.05490196, 0, 1, 1,
0.4663779, 1.80367, 0.1525925, 0.0627451, 0, 1, 1,
0.4670343, 0.04940462, 1.305372, 0.06666667, 0, 1, 1,
0.4737726, 1.520542, 1.531014, 0.07450981, 0, 1, 1,
0.4752826, 0.5599624, 2.198026, 0.07843138, 0, 1, 1,
0.4760088, -0.3625631, 1.241034, 0.08627451, 0, 1, 1,
0.4762978, -1.134906, -0.1373332, 0.09019608, 0, 1, 1,
0.4771578, -0.1682579, 1.915374, 0.09803922, 0, 1, 1,
0.4812924, -1.317291, 4.421186, 0.1058824, 0, 1, 1,
0.4824961, -1.39792, 3.475733, 0.1098039, 0, 1, 1,
0.4957095, -0.6396223, 2.546486, 0.1176471, 0, 1, 1,
0.496736, 0.7637153, -0.3406139, 0.1215686, 0, 1, 1,
0.4972513, -0.9751636, 4.884094, 0.1294118, 0, 1, 1,
0.4982417, 0.5433175, 0.507024, 0.1333333, 0, 1, 1,
0.5009302, -0.4688423, 0.5792745, 0.1411765, 0, 1, 1,
0.504906, 0.4847264, 0.5760776, 0.145098, 0, 1, 1,
0.5085136, -0.7186922, 3.043591, 0.1529412, 0, 1, 1,
0.5104397, 2.258126, 2.331298, 0.1568628, 0, 1, 1,
0.5113619, -1.662127, 2.282694, 0.1647059, 0, 1, 1,
0.5128216, -0.3947332, 3.669379, 0.1686275, 0, 1, 1,
0.5172524, 0.6323248, 0.9095402, 0.1764706, 0, 1, 1,
0.5208967, -0.1758718, 2.348037, 0.1803922, 0, 1, 1,
0.5240024, 0.2257944, 1.130068, 0.1882353, 0, 1, 1,
0.5242891, -0.7419916, 1.978596, 0.1921569, 0, 1, 1,
0.5293258, 0.2376985, 2.730996, 0.2, 0, 1, 1,
0.529814, -0.9077141, 3.783412, 0.2078431, 0, 1, 1,
0.5312761, -0.1486733, 3.136954, 0.2117647, 0, 1, 1,
0.5329409, 0.2975964, 0.5678532, 0.2196078, 0, 1, 1,
0.5378226, 0.7420814, -0.175266, 0.2235294, 0, 1, 1,
0.5401171, -1.077864, 3.604996, 0.2313726, 0, 1, 1,
0.5403689, 0.7009372, 0.6363451, 0.2352941, 0, 1, 1,
0.5424875, -0.2262402, 3.281214, 0.2431373, 0, 1, 1,
0.5477103, -1.17353, 1.900797, 0.2470588, 0, 1, 1,
0.5477391, -0.04785289, -0.2201055, 0.254902, 0, 1, 1,
0.5489655, 0.7645128, 1.683206, 0.2588235, 0, 1, 1,
0.5531893, 0.3531448, 1.660571, 0.2666667, 0, 1, 1,
0.553508, -1.834474, 1.345436, 0.2705882, 0, 1, 1,
0.5535188, 0.3077252, 1.306931, 0.2784314, 0, 1, 1,
0.5587987, 0.5229409, 0.3733332, 0.282353, 0, 1, 1,
0.5616679, -0.593356, 3.177611, 0.2901961, 0, 1, 1,
0.5683319, -0.5604874, 2.632506, 0.2941177, 0, 1, 1,
0.5692464, 0.3785723, 0.7519741, 0.3019608, 0, 1, 1,
0.5704319, -1.894141, 3.812194, 0.3098039, 0, 1, 1,
0.5705942, 0.8472013, 1.112227, 0.3137255, 0, 1, 1,
0.5739334, -0.4473317, 1.346562, 0.3215686, 0, 1, 1,
0.5747741, 0.8376818, 1.338071, 0.3254902, 0, 1, 1,
0.5805423, 1.048302, 0.4957497, 0.3333333, 0, 1, 1,
0.5807854, 1.689866, -1.485745, 0.3372549, 0, 1, 1,
0.5832115, -0.6995279, 0.640774, 0.345098, 0, 1, 1,
0.5842926, 0.8647243, 0.8024812, 0.3490196, 0, 1, 1,
0.5843549, -2.137623, 2.185341, 0.3568628, 0, 1, 1,
0.5858536, 0.5366392, 1.39568, 0.3607843, 0, 1, 1,
0.5914959, -0.8542284, 1.931512, 0.3686275, 0, 1, 1,
0.5943182, 1.703571, 1.240605, 0.372549, 0, 1, 1,
0.5958036, -0.631331, 3.175015, 0.3803922, 0, 1, 1,
0.6016052, 0.7150087, 0.7864013, 0.3843137, 0, 1, 1,
0.6084656, -0.3636105, -0.2287294, 0.3921569, 0, 1, 1,
0.6120058, -0.08686344, 2.765836, 0.3960784, 0, 1, 1,
0.6177821, -1.27128, 2.074213, 0.4039216, 0, 1, 1,
0.6202276, 0.754934, 2.000542, 0.4117647, 0, 1, 1,
0.6246356, 0.1661908, -0.5310345, 0.4156863, 0, 1, 1,
0.6258507, 0.205028, 0.7507682, 0.4235294, 0, 1, 1,
0.6258548, 0.8914191, -1.383606, 0.427451, 0, 1, 1,
0.640211, -0.9958287, 5.607081, 0.4352941, 0, 1, 1,
0.6439086, 0.2000488, 1.52385, 0.4392157, 0, 1, 1,
0.6455021, 0.5308364, 0.05317862, 0.4470588, 0, 1, 1,
0.648135, -0.8841045, 1.704559, 0.4509804, 0, 1, 1,
0.648797, -1.337785, 2.332551, 0.4588235, 0, 1, 1,
0.651149, 0.1984428, 3.006454, 0.4627451, 0, 1, 1,
0.6522886, 0.5931711, 1.535162, 0.4705882, 0, 1, 1,
0.6526986, 0.6646694, 0.4800852, 0.4745098, 0, 1, 1,
0.6530006, -0.202418, 1.104789, 0.4823529, 0, 1, 1,
0.6578136, 0.3487482, 0.6369852, 0.4862745, 0, 1, 1,
0.6587945, -0.5779908, 1.422168, 0.4941176, 0, 1, 1,
0.6599843, -0.04190419, 0.7262589, 0.5019608, 0, 1, 1,
0.6610138, 0.2569865, 0.7388328, 0.5058824, 0, 1, 1,
0.6613532, -1.370531, 2.152972, 0.5137255, 0, 1, 1,
0.6619913, -0.9254836, 1.223272, 0.5176471, 0, 1, 1,
0.6625864, 1.476009, 0.8048221, 0.5254902, 0, 1, 1,
0.678504, -1.217464, 1.825428, 0.5294118, 0, 1, 1,
0.6821562, -0.6418034, 0.6624716, 0.5372549, 0, 1, 1,
0.6875448, -1.805714, 1.906325, 0.5411765, 0, 1, 1,
0.6919353, 1.09371, 0.4687293, 0.5490196, 0, 1, 1,
0.6953338, 0.2611795, 1.149898, 0.5529412, 0, 1, 1,
0.6974338, -0.1541412, 0.7358889, 0.5607843, 0, 1, 1,
0.697908, 2.825132, 1.80433, 0.5647059, 0, 1, 1,
0.69875, -0.1975015, 1.905462, 0.572549, 0, 1, 1,
0.6997921, 0.007718981, 0.4065241, 0.5764706, 0, 1, 1,
0.7006563, -1.285009, 1.872863, 0.5843138, 0, 1, 1,
0.7019228, -0.2255412, 3.591786, 0.5882353, 0, 1, 1,
0.7028729, 0.7034363, 1.605186, 0.5960785, 0, 1, 1,
0.7031161, 2.928463, -1.048227, 0.6039216, 0, 1, 1,
0.7046924, -0.2316349, 3.011378, 0.6078432, 0, 1, 1,
0.7109863, 0.316841, 0.7388386, 0.6156863, 0, 1, 1,
0.7118948, -0.6549001, 1.601429, 0.6196079, 0, 1, 1,
0.712736, -0.04171262, 2.570786, 0.627451, 0, 1, 1,
0.7157798, -2.266236, 3.035248, 0.6313726, 0, 1, 1,
0.7242464, -0.1791618, 3.368819, 0.6392157, 0, 1, 1,
0.7255265, 0.6024572, 1.458287, 0.6431373, 0, 1, 1,
0.7263429, 0.6690077, -0.1379509, 0.6509804, 0, 1, 1,
0.7280982, -0.7440622, 2.861793, 0.654902, 0, 1, 1,
0.7292191, -0.6585081, 2.968194, 0.6627451, 0, 1, 1,
0.7301328, -1.815174, 2.693752, 0.6666667, 0, 1, 1,
0.7306827, 2.20188, 0.7480332, 0.6745098, 0, 1, 1,
0.7340599, 0.2747896, 2.121403, 0.6784314, 0, 1, 1,
0.7357283, 1.097875, -0.6710088, 0.6862745, 0, 1, 1,
0.7368141, -0.7679332, 1.61845, 0.6901961, 0, 1, 1,
0.7387663, -0.1323395, 2.486431, 0.6980392, 0, 1, 1,
0.7388778, -1.426188, 2.883113, 0.7058824, 0, 1, 1,
0.7389283, -0.9261096, 1.133399, 0.7098039, 0, 1, 1,
0.7397022, 0.3528531, 1.148896, 0.7176471, 0, 1, 1,
0.7400081, -0.2922304, 1.849157, 0.7215686, 0, 1, 1,
0.7406629, 0.83005, 0.6953471, 0.7294118, 0, 1, 1,
0.7440562, 0.01479199, -0.1711481, 0.7333333, 0, 1, 1,
0.7454949, 0.2810003, 1.074986, 0.7411765, 0, 1, 1,
0.7504075, 0.1465095, 3.224261, 0.7450981, 0, 1, 1,
0.7594752, -0.2516338, 0.8306318, 0.7529412, 0, 1, 1,
0.7600181, 1.070838, 0.2874001, 0.7568628, 0, 1, 1,
0.7614068, -0.4972856, 1.729313, 0.7647059, 0, 1, 1,
0.7639443, -1.779404, 2.011178, 0.7686275, 0, 1, 1,
0.7709019, 0.3494553, 0.594903, 0.7764706, 0, 1, 1,
0.7785235, -2.026333, 1.059755, 0.7803922, 0, 1, 1,
0.7798272, 0.1482122, 0.8153349, 0.7882353, 0, 1, 1,
0.7845187, -0.04498938, 1.865656, 0.7921569, 0, 1, 1,
0.7975605, 0.7557855, 2.329135, 0.8, 0, 1, 1,
0.7979278, -1.361345, 2.742757, 0.8078431, 0, 1, 1,
0.8064923, -0.7317975, 1.725039, 0.8117647, 0, 1, 1,
0.8109295, -1.146001, 2.099213, 0.8196079, 0, 1, 1,
0.8115606, -1.179371, 3.247754, 0.8235294, 0, 1, 1,
0.8128759, -0.3802039, 2.920308, 0.8313726, 0, 1, 1,
0.8152776, -0.07799223, 1.666764, 0.8352941, 0, 1, 1,
0.8153176, 1.699117, -1.596661, 0.8431373, 0, 1, 1,
0.8173686, 2.618203, 0.8446419, 0.8470588, 0, 1, 1,
0.821278, 0.6416165, 0.1920321, 0.854902, 0, 1, 1,
0.8265796, -0.3106506, 1.134374, 0.8588235, 0, 1, 1,
0.8327062, 1.012114, 1.285374, 0.8666667, 0, 1, 1,
0.8330405, 0.4783882, 0.8223621, 0.8705882, 0, 1, 1,
0.8333364, 0.0003795493, 3.357515, 0.8784314, 0, 1, 1,
0.8436716, -1.068072, 4.42771, 0.8823529, 0, 1, 1,
0.8440596, -0.6683103, 2.646533, 0.8901961, 0, 1, 1,
0.8489208, -0.04132025, 2.555341, 0.8941177, 0, 1, 1,
0.8523234, -0.4341694, 5.204063, 0.9019608, 0, 1, 1,
0.858223, -1.093874, 3.172014, 0.9098039, 0, 1, 1,
0.8594636, -0.07239557, 0.5200291, 0.9137255, 0, 1, 1,
0.8626297, -0.9314894, 3.48324, 0.9215686, 0, 1, 1,
0.872791, 1.118346, 1.773851, 0.9254902, 0, 1, 1,
0.8816618, 0.1870437, 2.175795, 0.9333333, 0, 1, 1,
0.8846911, -0.6024236, -0.4383913, 0.9372549, 0, 1, 1,
0.8912159, -0.3250177, 0.3398698, 0.945098, 0, 1, 1,
0.8915295, -1.146006, 1.517239, 0.9490196, 0, 1, 1,
0.9060701, -1.012303, 2.050139, 0.9568627, 0, 1, 1,
0.9065218, 0.5044032, 0.6400155, 0.9607843, 0, 1, 1,
0.9116673, -0.8293112, 2.269005, 0.9686275, 0, 1, 1,
0.9118192, -1.678029, 2.944952, 0.972549, 0, 1, 1,
0.9153853, -2.164773, 2.144837, 0.9803922, 0, 1, 1,
0.9211513, 0.4407343, 0.8606163, 0.9843137, 0, 1, 1,
0.9299808, -1.166106, 2.992218, 0.9921569, 0, 1, 1,
0.9379708, -0.6413336, 2.099275, 0.9960784, 0, 1, 1,
0.9503359, 0.1506751, 0.9371402, 1, 0, 0.9960784, 1,
0.9701795, 1.010733, -0.1813584, 1, 0, 0.9882353, 1,
0.975629, 0.5332072, 1.294974, 1, 0, 0.9843137, 1,
0.977077, 0.170118, 1.227541, 1, 0, 0.9764706, 1,
0.9778475, 0.7898281, 0.7824342, 1, 0, 0.972549, 1,
0.979315, 0.3764301, 2.742682, 1, 0, 0.9647059, 1,
0.9799936, 0.8336335, 0.3960315, 1, 0, 0.9607843, 1,
0.9812055, -1.83826, 1.595619, 1, 0, 0.9529412, 1,
0.9841866, -0.6058844, 0.6992749, 1, 0, 0.9490196, 1,
0.9898095, 0.1458895, 0.7550398, 1, 0, 0.9411765, 1,
0.9903297, 1.056276, 0.2625768, 1, 0, 0.9372549, 1,
0.9932794, 0.5468919, 1.911501, 1, 0, 0.9294118, 1,
0.9937441, 0.3354038, 2.871451, 1, 0, 0.9254902, 1,
0.9957781, -0.01224248, 1.751914, 1, 0, 0.9176471, 1,
0.9963017, 0.6407275, 1.577201, 1, 0, 0.9137255, 1,
0.9992853, -0.5637516, 1.996238, 1, 0, 0.9058824, 1,
1.001474, -0.5986155, 1.408675, 1, 0, 0.9019608, 1,
1.002788, -1.944237, 1.982201, 1, 0, 0.8941177, 1,
1.008078, -0.04983185, 1.717423, 1, 0, 0.8862745, 1,
1.027195, 0.08004615, 1.351969, 1, 0, 0.8823529, 1,
1.039059, -0.1864013, 2.523093, 1, 0, 0.8745098, 1,
1.040483, -0.85709, 2.323965, 1, 0, 0.8705882, 1,
1.047786, -1.105745, 1.661294, 1, 0, 0.8627451, 1,
1.048488, 1.204351, 0.4485906, 1, 0, 0.8588235, 1,
1.053494, -1.062101, 1.781146, 1, 0, 0.8509804, 1,
1.054583, 0.5952417, 1.401052, 1, 0, 0.8470588, 1,
1.05728, 1.33384, 0.7727402, 1, 0, 0.8392157, 1,
1.058738, -0.9691451, 1.518576, 1, 0, 0.8352941, 1,
1.06824, -0.5436408, 1.272791, 1, 0, 0.827451, 1,
1.069677, -0.09553272, 1.922091, 1, 0, 0.8235294, 1,
1.072151, 0.9161459, -0.3914573, 1, 0, 0.8156863, 1,
1.075569, 1.491542, -0.3387899, 1, 0, 0.8117647, 1,
1.076139, 2.434059, 1.875201, 1, 0, 0.8039216, 1,
1.0795, -0.474951, 2.809706, 1, 0, 0.7960784, 1,
1.08436, -1.18832, 2.554538, 1, 0, 0.7921569, 1,
1.08761, 1.4006, 1.438147, 1, 0, 0.7843137, 1,
1.102563, -0.8639532, 1.924369, 1, 0, 0.7803922, 1,
1.103732, -2.899739, 1.821169, 1, 0, 0.772549, 1,
1.107953, 1.019453, 0.7092245, 1, 0, 0.7686275, 1,
1.109831, 0.6016307, 0.9537392, 1, 0, 0.7607843, 1,
1.1105, 0.06205402, 1.28451, 1, 0, 0.7568628, 1,
1.114512, 1.602613, 2.348779, 1, 0, 0.7490196, 1,
1.126863, -2.025173, 3.942791, 1, 0, 0.7450981, 1,
1.131317, -1.461274, 3.962404, 1, 0, 0.7372549, 1,
1.13266, 0.405003, 0.2327239, 1, 0, 0.7333333, 1,
1.13664, -0.113492, 0.5758178, 1, 0, 0.7254902, 1,
1.137937, 1.550194, 1.786736, 1, 0, 0.7215686, 1,
1.144936, 2.469337, 0.4850622, 1, 0, 0.7137255, 1,
1.152586, -1.066629, 2.381505, 1, 0, 0.7098039, 1,
1.159305, 0.9120756, 2.961916, 1, 0, 0.7019608, 1,
1.16132, -0.9693812, 0.7863315, 1, 0, 0.6941177, 1,
1.161553, -0.4915745, 3.455487, 1, 0, 0.6901961, 1,
1.16652, 1.091458, 1.607827, 1, 0, 0.682353, 1,
1.171366, -0.7045754, 0.7418111, 1, 0, 0.6784314, 1,
1.18291, 0.491584, 1.741815, 1, 0, 0.6705883, 1,
1.18341, -0.2081296, 0.6431785, 1, 0, 0.6666667, 1,
1.186678, 1.131526, -0.5718194, 1, 0, 0.6588235, 1,
1.192024, 1.092095, 0.5215659, 1, 0, 0.654902, 1,
1.192656, -1.567548, 2.003093, 1, 0, 0.6470588, 1,
1.196688, 0.5863258, 0.5069838, 1, 0, 0.6431373, 1,
1.213525, -0.2342164, 0.2992892, 1, 0, 0.6352941, 1,
1.215807, 0.2447203, 1.149745, 1, 0, 0.6313726, 1,
1.222308, 0.04178079, 1.634788, 1, 0, 0.6235294, 1,
1.223636, 1.362094, -0.6260239, 1, 0, 0.6196079, 1,
1.234971, -0.6707356, 2.199906, 1, 0, 0.6117647, 1,
1.240494, 1.463562, -0.2136185, 1, 0, 0.6078432, 1,
1.24254, -1.122761, 0.85571, 1, 0, 0.6, 1,
1.244045, 0.0338825, 1.740036, 1, 0, 0.5921569, 1,
1.250781, -1.199543, 2.155886, 1, 0, 0.5882353, 1,
1.253597, 0.5918528, 0.6804061, 1, 0, 0.5803922, 1,
1.259123, -1.019083, 2.393351, 1, 0, 0.5764706, 1,
1.263762, 0.5614311, 0.6430614, 1, 0, 0.5686275, 1,
1.266139, -1.093026, 3.380979, 1, 0, 0.5647059, 1,
1.266315, 0.9145097, 0.8458598, 1, 0, 0.5568628, 1,
1.282692, 0.8789812, 0.5692685, 1, 0, 0.5529412, 1,
1.297391, -0.2326677, 0.9697073, 1, 0, 0.5450981, 1,
1.313482, -1.120462, 2.299518, 1, 0, 0.5411765, 1,
1.31851, 0.02725283, 0.7114481, 1, 0, 0.5333334, 1,
1.341434, -1.188131, 2.863369, 1, 0, 0.5294118, 1,
1.34434, 2.373524, 1.658132, 1, 0, 0.5215687, 1,
1.348981, 1.634083, 0.1979024, 1, 0, 0.5176471, 1,
1.355379, 1.716852, -0.04466976, 1, 0, 0.509804, 1,
1.372222, 0.2584334, 2.040834, 1, 0, 0.5058824, 1,
1.380839, 0.8931493, 1.070566, 1, 0, 0.4980392, 1,
1.385525, -0.909615, 3.063731, 1, 0, 0.4901961, 1,
1.402201, -0.9243588, 3.734913, 1, 0, 0.4862745, 1,
1.404035, -0.4181395, 2.671281, 1, 0, 0.4784314, 1,
1.410183, 0.9446042, 0.6699587, 1, 0, 0.4745098, 1,
1.419101, 1.55463, -0.8055664, 1, 0, 0.4666667, 1,
1.420741, -0.7405814, 3.843525, 1, 0, 0.4627451, 1,
1.421654, 0.4051751, 0.8111069, 1, 0, 0.454902, 1,
1.432146, 1.99115, 0.7258825, 1, 0, 0.4509804, 1,
1.452228, 0.597379, 1.209523, 1, 0, 0.4431373, 1,
1.455515, -1.211331, 1.991723, 1, 0, 0.4392157, 1,
1.455882, -1.541011, 0.02089524, 1, 0, 0.4313726, 1,
1.465746, 2.23208, 0.8013266, 1, 0, 0.427451, 1,
1.466361, -0.5171731, 1.864131, 1, 0, 0.4196078, 1,
1.470085, -1.00763, 3.664286, 1, 0, 0.4156863, 1,
1.470109, -2.071826, 3.207516, 1, 0, 0.4078431, 1,
1.471357, 0.3635036, 0.08667457, 1, 0, 0.4039216, 1,
1.474299, -0.8038985, 1.007404, 1, 0, 0.3960784, 1,
1.476292, -0.4523138, 1.289899, 1, 0, 0.3882353, 1,
1.477851, 0.4186352, 2.773755, 1, 0, 0.3843137, 1,
1.514308, 0.7963053, 1.575824, 1, 0, 0.3764706, 1,
1.533446, 0.3417134, 2.217928, 1, 0, 0.372549, 1,
1.540726, -1.64091, 2.23624, 1, 0, 0.3647059, 1,
1.544762, -0.3287238, 0.9804298, 1, 0, 0.3607843, 1,
1.565852, -0.2387355, 3.290759, 1, 0, 0.3529412, 1,
1.572392, -1.613776, 3.345286, 1, 0, 0.3490196, 1,
1.572722, 0.369212, 0.8306797, 1, 0, 0.3411765, 1,
1.573941, -0.4653569, 1.929298, 1, 0, 0.3372549, 1,
1.57445, -1.370804, 1.117769, 1, 0, 0.3294118, 1,
1.577444, -0.09284531, 1.811207, 1, 0, 0.3254902, 1,
1.586811, -0.01158064, 2.211465, 1, 0, 0.3176471, 1,
1.605453, -1.231109, 1.600505, 1, 0, 0.3137255, 1,
1.626546, 2.461495, -0.5884797, 1, 0, 0.3058824, 1,
1.635615, -0.5103031, 0.259763, 1, 0, 0.2980392, 1,
1.64088, -0.005258125, 1.650925, 1, 0, 0.2941177, 1,
1.641233, 0.3462629, 0.4798144, 1, 0, 0.2862745, 1,
1.659802, 0.03080447, 1.788678, 1, 0, 0.282353, 1,
1.663714, -2.63598, 2.645526, 1, 0, 0.2745098, 1,
1.66645, -0.7498703, 2.878569, 1, 0, 0.2705882, 1,
1.672063, -0.4731203, 1.54613, 1, 0, 0.2627451, 1,
1.680361, -1.200704, 1.368795, 1, 0, 0.2588235, 1,
1.702252, -0.1877901, 0.2833934, 1, 0, 0.2509804, 1,
1.717129, -1.493852, 2.103676, 1, 0, 0.2470588, 1,
1.718123, -1.171477, 2.02195, 1, 0, 0.2392157, 1,
1.720826, -0.9823731, 0.6728032, 1, 0, 0.2352941, 1,
1.753474, -0.1114044, 1.17837, 1, 0, 0.227451, 1,
1.757702, 0.04193933, 1.687902, 1, 0, 0.2235294, 1,
1.770109, -0.321117, 2.267903, 1, 0, 0.2156863, 1,
1.787513, 1.49286, 1.35036, 1, 0, 0.2117647, 1,
1.856336, -0.88851, 2.351515, 1, 0, 0.2039216, 1,
1.869417, 0.5947632, 2.637776, 1, 0, 0.1960784, 1,
1.877591, -2.44351, 1.630942, 1, 0, 0.1921569, 1,
1.901095, 1.781901, 1.238429, 1, 0, 0.1843137, 1,
1.919252, 2.356571, 0.5574853, 1, 0, 0.1803922, 1,
1.962938, 1.24942, -0.1078672, 1, 0, 0.172549, 1,
1.969591, -0.1302972, 1.225245, 1, 0, 0.1686275, 1,
1.977856, 0.4413638, 2.06366, 1, 0, 0.1607843, 1,
1.988616, 0.1682568, 1.641831, 1, 0, 0.1568628, 1,
2.041936, 0.1238255, 2.759734, 1, 0, 0.1490196, 1,
2.076539, -0.6687511, 1.77184, 1, 0, 0.145098, 1,
2.099904, 1.000615, 1.000978, 1, 0, 0.1372549, 1,
2.102018, 1.101986, 1.609667, 1, 0, 0.1333333, 1,
2.122962, 0.2993267, 0.9888492, 1, 0, 0.1254902, 1,
2.143586, -0.5491956, 2.832306, 1, 0, 0.1215686, 1,
2.207524, -0.3129897, 1.807472, 1, 0, 0.1137255, 1,
2.21082, -1.149391, 1.354075, 1, 0, 0.1098039, 1,
2.23092, 0.1806582, 1.64228, 1, 0, 0.1019608, 1,
2.264634, -0.1795882, 1.787131, 1, 0, 0.09411765, 1,
2.301818, 1.90431, 0.2666985, 1, 0, 0.09019608, 1,
2.330539, -0.6216412, -0.699319, 1, 0, 0.08235294, 1,
2.376173, 1.096581, -0.6060184, 1, 0, 0.07843138, 1,
2.376383, -0.6738629, 2.093651, 1, 0, 0.07058824, 1,
2.377331, 0.4786158, 2.043905, 1, 0, 0.06666667, 1,
2.409637, 0.2554923, 1.387079, 1, 0, 0.05882353, 1,
2.409964, -2.113218, 1.829737, 1, 0, 0.05490196, 1,
2.436958, -0.4815279, 1.744586, 1, 0, 0.04705882, 1,
2.463007, 1.156749, 1.872176, 1, 0, 0.04313726, 1,
2.698339, 0.8268843, -0.3265797, 1, 0, 0.03529412, 1,
2.70378, -0.6621397, 2.569129, 1, 0, 0.03137255, 1,
2.715232, 0.9855127, 0.2678247, 1, 0, 0.02352941, 1,
2.848755, -0.3212453, 1.861522, 1, 0, 0.01960784, 1,
2.925092, -1.176049, 1.624136, 1, 0, 0.01176471, 1,
3.417888, -0.8600739, 2.140711, 1, 0, 0.007843138, 1
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
-0.003222227, -4.331867, -6.387912, 0, -0.5, 0.5, 0.5,
-0.003222227, -4.331867, -6.387912, 1, -0.5, 0.5, 0.5,
-0.003222227, -4.331867, -6.387912, 1, 1.5, 0.5, 0.5,
-0.003222227, -4.331867, -6.387912, 0, 1.5, 0.5, 0.5
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
-4.584089, -0.1755686, -6.387912, 0, -0.5, 0.5, 0.5,
-4.584089, -0.1755686, -6.387912, 1, -0.5, 0.5, 0.5,
-4.584089, -0.1755686, -6.387912, 1, 1.5, 0.5, 0.5,
-4.584089, -0.1755686, -6.387912, 0, 1.5, 0.5, 0.5
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
-4.584089, -4.331867, 0.4788239, 0, -0.5, 0.5, 0.5,
-4.584089, -4.331867, 0.4788239, 1, -0.5, 0.5, 0.5,
-4.584089, -4.331867, 0.4788239, 1, 1.5, 0.5, 0.5,
-4.584089, -4.331867, 0.4788239, 0, 1.5, 0.5, 0.5
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
-3, -3.372721, -4.803281,
3, -3.372721, -4.803281,
-3, -3.372721, -4.803281,
-3, -3.532578, -5.067386,
-2, -3.372721, -4.803281,
-2, -3.532578, -5.067386,
-1, -3.372721, -4.803281,
-1, -3.532578, -5.067386,
0, -3.372721, -4.803281,
0, -3.532578, -5.067386,
1, -3.372721, -4.803281,
1, -3.532578, -5.067386,
2, -3.372721, -4.803281,
2, -3.532578, -5.067386,
3, -3.372721, -4.803281,
3, -3.532578, -5.067386
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
-3, -3.852294, -5.595597, 0, -0.5, 0.5, 0.5,
-3, -3.852294, -5.595597, 1, -0.5, 0.5, 0.5,
-3, -3.852294, -5.595597, 1, 1.5, 0.5, 0.5,
-3, -3.852294, -5.595597, 0, 1.5, 0.5, 0.5,
-2, -3.852294, -5.595597, 0, -0.5, 0.5, 0.5,
-2, -3.852294, -5.595597, 1, -0.5, 0.5, 0.5,
-2, -3.852294, -5.595597, 1, 1.5, 0.5, 0.5,
-2, -3.852294, -5.595597, 0, 1.5, 0.5, 0.5,
-1, -3.852294, -5.595597, 0, -0.5, 0.5, 0.5,
-1, -3.852294, -5.595597, 1, -0.5, 0.5, 0.5,
-1, -3.852294, -5.595597, 1, 1.5, 0.5, 0.5,
-1, -3.852294, -5.595597, 0, 1.5, 0.5, 0.5,
0, -3.852294, -5.595597, 0, -0.5, 0.5, 0.5,
0, -3.852294, -5.595597, 1, -0.5, 0.5, 0.5,
0, -3.852294, -5.595597, 1, 1.5, 0.5, 0.5,
0, -3.852294, -5.595597, 0, 1.5, 0.5, 0.5,
1, -3.852294, -5.595597, 0, -0.5, 0.5, 0.5,
1, -3.852294, -5.595597, 1, -0.5, 0.5, 0.5,
1, -3.852294, -5.595597, 1, 1.5, 0.5, 0.5,
1, -3.852294, -5.595597, 0, 1.5, 0.5, 0.5,
2, -3.852294, -5.595597, 0, -0.5, 0.5, 0.5,
2, -3.852294, -5.595597, 1, -0.5, 0.5, 0.5,
2, -3.852294, -5.595597, 1, 1.5, 0.5, 0.5,
2, -3.852294, -5.595597, 0, 1.5, 0.5, 0.5,
3, -3.852294, -5.595597, 0, -0.5, 0.5, 0.5,
3, -3.852294, -5.595597, 1, -0.5, 0.5, 0.5,
3, -3.852294, -5.595597, 1, 1.5, 0.5, 0.5,
3, -3.852294, -5.595597, 0, 1.5, 0.5, 0.5
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
-3.526966, -3, -4.803281,
-3.526966, 2, -4.803281,
-3.526966, -3, -4.803281,
-3.703153, -3, -5.067386,
-3.526966, -2, -4.803281,
-3.703153, -2, -5.067386,
-3.526966, -1, -4.803281,
-3.703153, -1, -5.067386,
-3.526966, 0, -4.803281,
-3.703153, 0, -5.067386,
-3.526966, 1, -4.803281,
-3.703153, 1, -5.067386,
-3.526966, 2, -4.803281,
-3.703153, 2, -5.067386
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
-4.055528, -3, -5.595597, 0, -0.5, 0.5, 0.5,
-4.055528, -3, -5.595597, 1, -0.5, 0.5, 0.5,
-4.055528, -3, -5.595597, 1, 1.5, 0.5, 0.5,
-4.055528, -3, -5.595597, 0, 1.5, 0.5, 0.5,
-4.055528, -2, -5.595597, 0, -0.5, 0.5, 0.5,
-4.055528, -2, -5.595597, 1, -0.5, 0.5, 0.5,
-4.055528, -2, -5.595597, 1, 1.5, 0.5, 0.5,
-4.055528, -2, -5.595597, 0, 1.5, 0.5, 0.5,
-4.055528, -1, -5.595597, 0, -0.5, 0.5, 0.5,
-4.055528, -1, -5.595597, 1, -0.5, 0.5, 0.5,
-4.055528, -1, -5.595597, 1, 1.5, 0.5, 0.5,
-4.055528, -1, -5.595597, 0, 1.5, 0.5, 0.5,
-4.055528, 0, -5.595597, 0, -0.5, 0.5, 0.5,
-4.055528, 0, -5.595597, 1, -0.5, 0.5, 0.5,
-4.055528, 0, -5.595597, 1, 1.5, 0.5, 0.5,
-4.055528, 0, -5.595597, 0, 1.5, 0.5, 0.5,
-4.055528, 1, -5.595597, 0, -0.5, 0.5, 0.5,
-4.055528, 1, -5.595597, 1, -0.5, 0.5, 0.5,
-4.055528, 1, -5.595597, 1, 1.5, 0.5, 0.5,
-4.055528, 1, -5.595597, 0, 1.5, 0.5, 0.5,
-4.055528, 2, -5.595597, 0, -0.5, 0.5, 0.5,
-4.055528, 2, -5.595597, 1, -0.5, 0.5, 0.5,
-4.055528, 2, -5.595597, 1, 1.5, 0.5, 0.5,
-4.055528, 2, -5.595597, 0, 1.5, 0.5, 0.5
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
-3.526966, -3.372721, -4,
-3.526966, -3.372721, 4,
-3.526966, -3.372721, -4,
-3.703153, -3.532578, -4,
-3.526966, -3.372721, -2,
-3.703153, -3.532578, -2,
-3.526966, -3.372721, 0,
-3.703153, -3.532578, 0,
-3.526966, -3.372721, 2,
-3.703153, -3.532578, 2,
-3.526966, -3.372721, 4,
-3.703153, -3.532578, 4
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
-4.055528, -3.852294, -4, 0, -0.5, 0.5, 0.5,
-4.055528, -3.852294, -4, 1, -0.5, 0.5, 0.5,
-4.055528, -3.852294, -4, 1, 1.5, 0.5, 0.5,
-4.055528, -3.852294, -4, 0, 1.5, 0.5, 0.5,
-4.055528, -3.852294, -2, 0, -0.5, 0.5, 0.5,
-4.055528, -3.852294, -2, 1, -0.5, 0.5, 0.5,
-4.055528, -3.852294, -2, 1, 1.5, 0.5, 0.5,
-4.055528, -3.852294, -2, 0, 1.5, 0.5, 0.5,
-4.055528, -3.852294, 0, 0, -0.5, 0.5, 0.5,
-4.055528, -3.852294, 0, 1, -0.5, 0.5, 0.5,
-4.055528, -3.852294, 0, 1, 1.5, 0.5, 0.5,
-4.055528, -3.852294, 0, 0, 1.5, 0.5, 0.5,
-4.055528, -3.852294, 2, 0, -0.5, 0.5, 0.5,
-4.055528, -3.852294, 2, 1, -0.5, 0.5, 0.5,
-4.055528, -3.852294, 2, 1, 1.5, 0.5, 0.5,
-4.055528, -3.852294, 2, 0, 1.5, 0.5, 0.5,
-4.055528, -3.852294, 4, 0, -0.5, 0.5, 0.5,
-4.055528, -3.852294, 4, 1, -0.5, 0.5, 0.5,
-4.055528, -3.852294, 4, 1, 1.5, 0.5, 0.5,
-4.055528, -3.852294, 4, 0, 1.5, 0.5, 0.5
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
-3.526966, -3.372721, -4.803281,
-3.526966, 3.021584, -4.803281,
-3.526966, -3.372721, 5.760929,
-3.526966, 3.021584, 5.760929,
-3.526966, -3.372721, -4.803281,
-3.526966, -3.372721, 5.760929,
-3.526966, 3.021584, -4.803281,
-3.526966, 3.021584, 5.760929,
-3.526966, -3.372721, -4.803281,
3.520521, -3.372721, -4.803281,
-3.526966, -3.372721, 5.760929,
3.520521, -3.372721, 5.760929,
-3.526966, 3.021584, -4.803281,
3.520521, 3.021584, -4.803281,
-3.526966, 3.021584, 5.760929,
3.520521, 3.021584, 5.760929,
3.520521, -3.372721, -4.803281,
3.520521, 3.021584, -4.803281,
3.520521, -3.372721, 5.760929,
3.520521, 3.021584, 5.760929,
3.520521, -3.372721, -4.803281,
3.520521, -3.372721, 5.760929,
3.520521, 3.021584, -4.803281,
3.520521, 3.021584, 5.760929
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
var radius = 7.592234;
var distance = 33.77871;
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
mvMatrix.translate( 0.003222227, 0.1755686, -0.4788239 );
mvMatrix.scale( 1.164794, 1.283779, 0.7770455 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.77871);
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
triazole-1-propaneni<-read.table("triazole-1-propaneni.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-triazole-1-propaneni$V2
```

```
## Error in eval(expr, envir, enclos): object 'triazole' not found
```

```r
y<-triazole-1-propaneni$V3
```

```
## Error in eval(expr, envir, enclos): object 'triazole' not found
```

```r
z<-triazole-1-propaneni$V4
```

```
## Error in eval(expr, envir, enclos): object 'triazole' not found
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
-3.424333, -1.710823, -0.4601679, 0, 0, 1, 1, 1,
-3.22604, 1.22726, -0.3075069, 1, 0, 0, 1, 1,
-2.875283, -0.6091459, -2.750103, 1, 0, 0, 1, 1,
-2.717216, 0.204727, -1.94611, 1, 0, 0, 1, 1,
-2.670263, 0.6513193, -0.10138, 1, 0, 0, 1, 1,
-2.647194, 0.1519609, -1.736097, 1, 0, 0, 1, 1,
-2.598118, 1.5594, -1.497677, 0, 0, 0, 1, 1,
-2.477211, -0.3356574, -2.921323, 0, 0, 0, 1, 1,
-2.42785, -1.703209, -2.833175, 0, 0, 0, 1, 1,
-2.4118, -0.8292885, -0.1163165, 0, 0, 0, 1, 1,
-2.368652, 1.591305, -0.377506, 0, 0, 0, 1, 1,
-2.362718, 0.7166607, -1.645608, 0, 0, 0, 1, 1,
-2.362047, -0.1852984, -2.919123, 0, 0, 0, 1, 1,
-2.352813, 0.4288593, -0.6917093, 1, 1, 1, 1, 1,
-2.342298, 1.473317, 0.7695845, 1, 1, 1, 1, 1,
-2.265099, -1.167256, -2.633404, 1, 1, 1, 1, 1,
-2.253688, -0.09123532, -3.124339, 1, 1, 1, 1, 1,
-2.191886, -0.9869096, -3.971241, 1, 1, 1, 1, 1,
-2.171193, 2.335936, -1.427632, 1, 1, 1, 1, 1,
-2.121916, -1.626458, -2.069285, 1, 1, 1, 1, 1,
-2.04808, -1.331388, -0.7675876, 1, 1, 1, 1, 1,
-2.040134, 0.235116, -0.2899674, 1, 1, 1, 1, 1,
-2.008479, -0.5036425, -3.220662, 1, 1, 1, 1, 1,
-1.998396, 0.1314119, -2.402176, 1, 1, 1, 1, 1,
-1.993895, 1.116957, -2.11728, 1, 1, 1, 1, 1,
-1.968837, -1.863042, -1.576464, 1, 1, 1, 1, 1,
-1.945968, -0.681851, -0.9669247, 1, 1, 1, 1, 1,
-1.908396, 0.4185939, -1.383034, 1, 1, 1, 1, 1,
-1.895655, -0.9620295, -1.362376, 0, 0, 1, 1, 1,
-1.878336, -1.168156, -0.8544147, 1, 0, 0, 1, 1,
-1.862959, -1.722205, -0.3285753, 1, 0, 0, 1, 1,
-1.8518, 0.2885371, -0.09573088, 1, 0, 0, 1, 1,
-1.818333, 0.03541379, -1.963615, 1, 0, 0, 1, 1,
-1.780819, 0.5117738, -0.65222, 1, 0, 0, 1, 1,
-1.774143, 0.3923505, 0.3483012, 0, 0, 0, 1, 1,
-1.743235, -0.1402777, 1.315949, 0, 0, 0, 1, 1,
-1.717557, -0.1172373, -3.140088, 0, 0, 0, 1, 1,
-1.716543, 1.175346, -0.04787724, 0, 0, 0, 1, 1,
-1.7132, -0.5919145, -1.154918, 0, 0, 0, 1, 1,
-1.668141, 0.9830942, -1.496641, 0, 0, 0, 1, 1,
-1.66477, -1.122259, -2.861561, 0, 0, 0, 1, 1,
-1.657005, 0.07580989, -0.5921543, 1, 1, 1, 1, 1,
-1.656405, -0.8513206, -1.628579, 1, 1, 1, 1, 1,
-1.652976, -1.56849, -0.445108, 1, 1, 1, 1, 1,
-1.64659, -0.1433021, -1.355305, 1, 1, 1, 1, 1,
-1.63781, -1.352897, -2.716957, 1, 1, 1, 1, 1,
-1.635701, 1.870147, -0.5390248, 1, 1, 1, 1, 1,
-1.601181, 0.1212939, -0.4185442, 1, 1, 1, 1, 1,
-1.588889, -0.1468545, -2.098912, 1, 1, 1, 1, 1,
-1.575699, -0.02272796, -2.804813, 1, 1, 1, 1, 1,
-1.569235, -0.5294386, -2.903768, 1, 1, 1, 1, 1,
-1.562206, 0.1821201, -1.719129, 1, 1, 1, 1, 1,
-1.554621, -1.298235, -3.551957, 1, 1, 1, 1, 1,
-1.549235, -0.4032015, -1.972725, 1, 1, 1, 1, 1,
-1.546721, 0.7826743, -1.834395, 1, 1, 1, 1, 1,
-1.538578, -1.100267, -2.831681, 1, 1, 1, 1, 1,
-1.53802, 1.043851, -1.792567, 0, 0, 1, 1, 1,
-1.533509, -0.3415445, -2.04755, 1, 0, 0, 1, 1,
-1.533083, 0.893906, -1.225531, 1, 0, 0, 1, 1,
-1.52366, 0.03757612, -1.851418, 1, 0, 0, 1, 1,
-1.518648, -1.018804, -2.666843, 1, 0, 0, 1, 1,
-1.518117, 0.02083872, -1.421061, 1, 0, 0, 1, 1,
-1.506422, -0.2435598, -2.812424, 0, 0, 0, 1, 1,
-1.472038, -1.096918, -2.013599, 0, 0, 0, 1, 1,
-1.466914, -0.4775488, -2.856074, 0, 0, 0, 1, 1,
-1.44283, 1.00492, -1.2878, 0, 0, 0, 1, 1,
-1.423335, 0.224593, -2.393175, 0, 0, 0, 1, 1,
-1.423141, -0.5504262, -1.901156, 0, 0, 0, 1, 1,
-1.422155, 1.336546, -0.6080438, 0, 0, 0, 1, 1,
-1.421343, 1.514554, -1.357145, 1, 1, 1, 1, 1,
-1.408053, 1.030596, 1.094872, 1, 1, 1, 1, 1,
-1.401642, -0.8935549, -1.829555, 1, 1, 1, 1, 1,
-1.395965, 0.7719372, -0.9793015, 1, 1, 1, 1, 1,
-1.38663, -1.23547, -1.752265, 1, 1, 1, 1, 1,
-1.381273, 0.4138554, -0.2096406, 1, 1, 1, 1, 1,
-1.376948, 0.8721749, -1.355135, 1, 1, 1, 1, 1,
-1.367291, 0.7962495, -0.6181779, 1, 1, 1, 1, 1,
-1.358175, 0.9695106, -1.651922, 1, 1, 1, 1, 1,
-1.353533, 0.4031744, -2.797976, 1, 1, 1, 1, 1,
-1.351411, 1.705517, -0.6435388, 1, 1, 1, 1, 1,
-1.346165, 2.112719, -0.7708931, 1, 1, 1, 1, 1,
-1.34027, -0.03071777, -1.73227, 1, 1, 1, 1, 1,
-1.333827, -1.682913, -1.467106, 1, 1, 1, 1, 1,
-1.330334, -1.075845, -3.862956, 1, 1, 1, 1, 1,
-1.301382, 2.117667, -1.311583, 0, 0, 1, 1, 1,
-1.285142, 0.848906, -0.5215439, 1, 0, 0, 1, 1,
-1.278165, 0.358882, -1.524163, 1, 0, 0, 1, 1,
-1.275376, -1.200191, -0.669957, 1, 0, 0, 1, 1,
-1.274924, 1.818138, -0.7056374, 1, 0, 0, 1, 1,
-1.274354, -1.243748, -2.928382, 1, 0, 0, 1, 1,
-1.274275, -0.5395663, -3.586364, 0, 0, 0, 1, 1,
-1.272504, 0.7656153, -1.352357, 0, 0, 0, 1, 1,
-1.267968, -0.4623186, -2.30607, 0, 0, 0, 1, 1,
-1.26587, 0.2681464, -0.2614279, 0, 0, 0, 1, 1,
-1.258039, -0.6263238, -2.699673, 0, 0, 0, 1, 1,
-1.254228, 0.4248712, -1.465799, 0, 0, 0, 1, 1,
-1.23762, -0.570021, -3.513362, 0, 0, 0, 1, 1,
-1.229694, -0.6750033, -2.001384, 1, 1, 1, 1, 1,
-1.228932, -1.534811, -1.584272, 1, 1, 1, 1, 1,
-1.228071, 0.3922272, -1.286951, 1, 1, 1, 1, 1,
-1.210512, -0.9768767, -2.59537, 1, 1, 1, 1, 1,
-1.190924, -0.2194271, -3.306643, 1, 1, 1, 1, 1,
-1.190645, 0.3725731, -1.461421, 1, 1, 1, 1, 1,
-1.18908, 1.291627, 0.1957577, 1, 1, 1, 1, 1,
-1.177888, 1.234138, 0.4226305, 1, 1, 1, 1, 1,
-1.177307, 0.3154729, -0.8208825, 1, 1, 1, 1, 1,
-1.173863, -0.7295016, 0.8851259, 1, 1, 1, 1, 1,
-1.1695, -0.6828523, -1.347592, 1, 1, 1, 1, 1,
-1.168605, -1.151638, -3.617989, 1, 1, 1, 1, 1,
-1.167824, -1.40771, -0.3547632, 1, 1, 1, 1, 1,
-1.163925, 1.951375, 0.2567903, 1, 1, 1, 1, 1,
-1.163105, 0.1012623, -1.330543, 1, 1, 1, 1, 1,
-1.159488, 0.6050507, -0.4815313, 0, 0, 1, 1, 1,
-1.154782, 0.9403207, -0.09067362, 1, 0, 0, 1, 1,
-1.152676, 0.05718882, -1.968571, 1, 0, 0, 1, 1,
-1.151533, -1.288791, -2.598607, 1, 0, 0, 1, 1,
-1.1489, -0.4528071, -0.4258304, 1, 0, 0, 1, 1,
-1.145519, -0.09478483, -3.227283, 1, 0, 0, 1, 1,
-1.144331, 1.532343, 1.045022, 0, 0, 0, 1, 1,
-1.143825, 1.043878, -0.1050976, 0, 0, 0, 1, 1,
-1.13572, -0.3402113, -2.361248, 0, 0, 0, 1, 1,
-1.131602, -0.1436641, -2.799105, 0, 0, 0, 1, 1,
-1.127981, -2.02772, -2.742894, 0, 0, 0, 1, 1,
-1.125379, -0.1772744, -1.685398, 0, 0, 0, 1, 1,
-1.123417, 0.3217215, -1.033335, 0, 0, 0, 1, 1,
-1.122877, -1.069258, -3.660227, 1, 1, 1, 1, 1,
-1.119159, -0.1668129, -2.120961, 1, 1, 1, 1, 1,
-1.116033, 0.6129531, -2.44176, 1, 1, 1, 1, 1,
-1.114085, 0.453592, -2.01512, 1, 1, 1, 1, 1,
-1.111225, -0.7620316, 0.2144731, 1, 1, 1, 1, 1,
-1.111012, -0.6938574, -1.503572, 1, 1, 1, 1, 1,
-1.108963, -0.2543941, -2.220826, 1, 1, 1, 1, 1,
-1.091646, -1.49325, 0.09916905, 1, 1, 1, 1, 1,
-1.085702, -0.543299, -1.940297, 1, 1, 1, 1, 1,
-1.085403, 0.4407144, -1.261462, 1, 1, 1, 1, 1,
-1.08374, -0.2551473, -1.801822, 1, 1, 1, 1, 1,
-1.080187, 0.2383782, -3.025407, 1, 1, 1, 1, 1,
-1.074433, 1.116917, -2.284203, 1, 1, 1, 1, 1,
-1.069576, 2.829213, -0.5090002, 1, 1, 1, 1, 1,
-1.061076, 1.681072, -1.92127, 1, 1, 1, 1, 1,
-1.060225, 0.2517883, -0.7789322, 0, 0, 1, 1, 1,
-1.053834, 1.533987, -0.02891346, 1, 0, 0, 1, 1,
-1.05157, 0.3473461, -0.6630346, 1, 0, 0, 1, 1,
-1.049397, 1.051629, -1.545423, 1, 0, 0, 1, 1,
-1.0396, 0.8791388, -1.180128, 1, 0, 0, 1, 1,
-1.034442, -0.9681033, -1.616239, 1, 0, 0, 1, 1,
-1.024919, 1.510422, -0.4054886, 0, 0, 0, 1, 1,
-1.024721, -0.2238307, -1.650325, 0, 0, 0, 1, 1,
-1.02184, 1.240548, -1.962556, 0, 0, 0, 1, 1,
-1.021786, -0.7057613, -3.153283, 0, 0, 0, 1, 1,
-1.021186, 0.7884092, -1.272906, 0, 0, 0, 1, 1,
-1.017639, 1.356746, 0.5716857, 0, 0, 0, 1, 1,
-1.013953, 0.8258233, -0.8045751, 0, 0, 0, 1, 1,
-1.013885, 0.197655, -2.149832, 1, 1, 1, 1, 1,
-1.006218, -0.4803545, -3.763216, 1, 1, 1, 1, 1,
-1.000043, 0.01766895, -0.3948069, 1, 1, 1, 1, 1,
-0.996744, -0.6937609, -1.940434, 1, 1, 1, 1, 1,
-0.9961716, -0.742656, -2.753876, 1, 1, 1, 1, 1,
-0.9901589, 1.534748, -0.8647371, 1, 1, 1, 1, 1,
-0.9815096, 1.32732, -1.097972, 1, 1, 1, 1, 1,
-0.9804384, -1.11584, -2.226431, 1, 1, 1, 1, 1,
-0.9795977, -0.6321275, -2.873903, 1, 1, 1, 1, 1,
-0.9791732, -0.3437409, -2.536293, 1, 1, 1, 1, 1,
-0.9787021, -2.189244, -2.854249, 1, 1, 1, 1, 1,
-0.9783065, 1.108019, -0.1394059, 1, 1, 1, 1, 1,
-0.9760858, -0.02786416, -2.31827, 1, 1, 1, 1, 1,
-0.9752352, -0.3335594, -1.874446, 1, 1, 1, 1, 1,
-0.9744561, 0.007285031, -2.443148, 1, 1, 1, 1, 1,
-0.9738531, -0.9265548, -1.962195, 0, 0, 1, 1, 1,
-0.972288, -1.137867, -1.65069, 1, 0, 0, 1, 1,
-0.9682682, 1.436208, 0.3899546, 1, 0, 0, 1, 1,
-0.963725, -0.7981933, -0.8278222, 1, 0, 0, 1, 1,
-0.9635434, 0.7376953, -0.7624613, 1, 0, 0, 1, 1,
-0.9629068, 1.062374, -2.39161, 1, 0, 0, 1, 1,
-0.9604278, -0.1259838, -2.37117, 0, 0, 0, 1, 1,
-0.9580182, -0.2949197, -1.334934, 0, 0, 0, 1, 1,
-0.9568854, -0.8732404, -2.785724, 0, 0, 0, 1, 1,
-0.9559104, 1.42711, -0.2849122, 0, 0, 0, 1, 1,
-0.9499548, -1.787373, -3.662674, 0, 0, 0, 1, 1,
-0.9479159, 0.1379462, -1.027532, 0, 0, 0, 1, 1,
-0.9406107, -1.622012, -2.718567, 0, 0, 0, 1, 1,
-0.9318041, 0.9975104, -0.3695971, 1, 1, 1, 1, 1,
-0.9263669, 0.4902267, 0.1338372, 1, 1, 1, 1, 1,
-0.9166077, 0.6679776, -1.122722, 1, 1, 1, 1, 1,
-0.9125035, 0.1222354, -0.5307487, 1, 1, 1, 1, 1,
-0.9054741, 0.6152388, -2.147525, 1, 1, 1, 1, 1,
-0.9034028, -1.39912, -0.7530616, 1, 1, 1, 1, 1,
-0.9002779, -1.374859, -1.912319, 1, 1, 1, 1, 1,
-0.8997729, -0.4628706, -1.339808, 1, 1, 1, 1, 1,
-0.8924793, -0.0214022, -1.890025, 1, 1, 1, 1, 1,
-0.8870537, -1.159286, -3.99381, 1, 1, 1, 1, 1,
-0.8838893, 1.30332, 0.5306091, 1, 1, 1, 1, 1,
-0.8830419, 0.5224211, -1.209099, 1, 1, 1, 1, 1,
-0.8781071, 0.6349687, -0.7327562, 1, 1, 1, 1, 1,
-0.8733033, 1.446746, -2.572524, 1, 1, 1, 1, 1,
-0.8717396, 1.453536, -1.139565, 1, 1, 1, 1, 1,
-0.8655667, 1.101263, -2.596911, 0, 0, 1, 1, 1,
-0.8586487, -1.078448, -2.00556, 1, 0, 0, 1, 1,
-0.8564714, 0.4921809, 0.2493676, 1, 0, 0, 1, 1,
-0.8561473, -0.02549685, -1.92102, 1, 0, 0, 1, 1,
-0.8499054, 1.736982, -0.24235, 1, 0, 0, 1, 1,
-0.8346332, -0.3434252, -2.305412, 1, 0, 0, 1, 1,
-0.8320384, -0.05893688, -0.0255263, 0, 0, 0, 1, 1,
-0.8273883, 0.5437369, -0.8215232, 0, 0, 0, 1, 1,
-0.8256702, 1.226784, -1.962071, 0, 0, 0, 1, 1,
-0.8239401, 0.1320505, -0.6384184, 0, 0, 0, 1, 1,
-0.8197994, 1.510464, 0.8357731, 0, 0, 0, 1, 1,
-0.8153219, -1.028816, -1.750281, 0, 0, 0, 1, 1,
-0.8081421, -0.2920955, -1.641015, 0, 0, 0, 1, 1,
-0.807713, -0.3975497, -2.834002, 1, 1, 1, 1, 1,
-0.8069182, -0.2485344, -0.776647, 1, 1, 1, 1, 1,
-0.7999617, -0.5057197, -4.590533, 1, 1, 1, 1, 1,
-0.7941487, -0.9219921, -1.665077, 1, 1, 1, 1, 1,
-0.7815417, 0.9852528, -0.06410453, 1, 1, 1, 1, 1,
-0.7676442, 0.903513, -1.238513, 1, 1, 1, 1, 1,
-0.7650301, -0.04387666, -1.148969, 1, 1, 1, 1, 1,
-0.7620779, 0.4510276, -0.3635754, 1, 1, 1, 1, 1,
-0.7587314, 1.363716, -1.397703, 1, 1, 1, 1, 1,
-0.7524537, 0.4639764, -0.6891946, 1, 1, 1, 1, 1,
-0.7505957, 1.111936, -1.666308, 1, 1, 1, 1, 1,
-0.7499258, -0.2411115, -1.178577, 1, 1, 1, 1, 1,
-0.7456561, -1.011908, -3.949985, 1, 1, 1, 1, 1,
-0.7452196, -0.4448316, -3.776805, 1, 1, 1, 1, 1,
-0.7434154, 0.7906927, -0.3820583, 1, 1, 1, 1, 1,
-0.7430433, -1.224988, -2.385912, 0, 0, 1, 1, 1,
-0.7413064, -0.6510573, -0.6190055, 1, 0, 0, 1, 1,
-0.7339955, -1.60412, -3.061839, 1, 0, 0, 1, 1,
-0.7338545, 0.6276846, -0.3502597, 1, 0, 0, 1, 1,
-0.7333764, -0.1684146, -1.251985, 1, 0, 0, 1, 1,
-0.7320089, 0.1223212, -1.026884, 1, 0, 0, 1, 1,
-0.730445, -1.72359, -2.534346, 0, 0, 0, 1, 1,
-0.730005, -1.669875, -2.041724, 0, 0, 0, 1, 1,
-0.7252194, 0.5923354, -0.7254008, 0, 0, 0, 1, 1,
-0.7191784, -0.4393873, -3.520751, 0, 0, 0, 1, 1,
-0.7191492, -1.009804, -1.416673, 0, 0, 0, 1, 1,
-0.7143924, 0.9168181, -0.8998986, 0, 0, 0, 1, 1,
-0.7130538, -0.3245616, -2.642142, 0, 0, 0, 1, 1,
-0.709402, -1.273896, -3.256153, 1, 1, 1, 1, 1,
-0.707202, -0.9923382, -2.697999, 1, 1, 1, 1, 1,
-0.7019997, -0.01516634, -1.76273, 1, 1, 1, 1, 1,
-0.6978097, -2.060302, -2.996547, 1, 1, 1, 1, 1,
-0.6912673, 1.052605, -1.122139, 1, 1, 1, 1, 1,
-0.6877372, -0.6367825, -2.895702, 1, 1, 1, 1, 1,
-0.6845547, -1.021564, -0.8087922, 1, 1, 1, 1, 1,
-0.6774207, -1.187395, -1.617094, 1, 1, 1, 1, 1,
-0.676159, -1.623836, -3.264735, 1, 1, 1, 1, 1,
-0.6722147, 0.3365907, -0.5855539, 1, 1, 1, 1, 1,
-0.6584127, -0.799041, -2.406581, 1, 1, 1, 1, 1,
-0.6555791, 1.15254, 0.722434, 1, 1, 1, 1, 1,
-0.6537799, -0.4338825, -2.064865, 1, 1, 1, 1, 1,
-0.6514831, 0.7229908, 0.660666, 1, 1, 1, 1, 1,
-0.6478868, -1.271115, -0.4876491, 1, 1, 1, 1, 1,
-0.6401867, -0.4502466, -1.893589, 0, 0, 1, 1, 1,
-0.6360243, -1.026728, -4.304961, 1, 0, 0, 1, 1,
-0.6311995, 0.1077069, -0.7190882, 1, 0, 0, 1, 1,
-0.6243179, 0.7350929, -3.733366, 1, 0, 0, 1, 1,
-0.6231871, 0.2579659, -1.131989, 1, 0, 0, 1, 1,
-0.621971, -0.04650301, -1.430095, 1, 0, 0, 1, 1,
-0.6218705, 0.5637846, -0.723805, 0, 0, 0, 1, 1,
-0.6204205, 0.3008577, 0.5689247, 0, 0, 0, 1, 1,
-0.6133079, 1.417867, 0.8577442, 0, 0, 0, 1, 1,
-0.6042169, 0.6420711, -1.612427, 0, 0, 0, 1, 1,
-0.6015992, -0.7473811, -3.529463, 0, 0, 0, 1, 1,
-0.5999247, 0.6176003, -0.8291576, 0, 0, 0, 1, 1,
-0.5878211, -1.080075, -2.090217, 0, 0, 0, 1, 1,
-0.5862387, -0.2846185, -0.798274, 1, 1, 1, 1, 1,
-0.5851679, 0.7170172, -2.444071, 1, 1, 1, 1, 1,
-0.5849063, -0.1896258, -2.063578, 1, 1, 1, 1, 1,
-0.5809979, 1.183282, -0.2151921, 1, 1, 1, 1, 1,
-0.5800706, -1.423327, -3.430581, 1, 1, 1, 1, 1,
-0.5782569, -0.3998579, -1.060912, 1, 1, 1, 1, 1,
-0.5766492, -0.3160412, -1.367069, 1, 1, 1, 1, 1,
-0.575235, 0.5120376, 0.01237118, 1, 1, 1, 1, 1,
-0.5740359, 0.04924028, -1.282418, 1, 1, 1, 1, 1,
-0.5731925, 0.04117092, -1.969306, 1, 1, 1, 1, 1,
-0.5718507, -0.5185959, -2.801007, 1, 1, 1, 1, 1,
-0.5714721, -1.794037, -1.786885, 1, 1, 1, 1, 1,
-0.5655129, 0.4780208, -0.05392291, 1, 1, 1, 1, 1,
-0.5642918, 0.5812308, 0.0006867676, 1, 1, 1, 1, 1,
-0.559056, -1.802806, -3.248497, 1, 1, 1, 1, 1,
-0.5587655, 0.6472573, -0.1311938, 0, 0, 1, 1, 1,
-0.550244, 0.6725985, -2.391795, 1, 0, 0, 1, 1,
-0.5393977, -0.01437006, -0.5979464, 1, 0, 0, 1, 1,
-0.5393637, -0.9241678, -1.704151, 1, 0, 0, 1, 1,
-0.5359265, -1.183737, -1.506673, 1, 0, 0, 1, 1,
-0.5353524, 0.1338347, -2.137269, 1, 0, 0, 1, 1,
-0.5290143, -0.1724816, -0.4340642, 0, 0, 0, 1, 1,
-0.5238538, 1.108553, 0.8602929, 0, 0, 0, 1, 1,
-0.5223035, -0.1839132, -0.9027304, 0, 0, 0, 1, 1,
-0.5101615, 1.852345, -2.807431, 0, 0, 0, 1, 1,
-0.5070833, 0.5747248, -2.161488, 0, 0, 0, 1, 1,
-0.5068574, 0.8686179, -0.3583671, 0, 0, 0, 1, 1,
-0.5063802, 0.2102142, -1.403656, 0, 0, 0, 1, 1,
-0.5061992, -1.906501, -2.939445, 1, 1, 1, 1, 1,
-0.5028956, 0.6490874, -0.107317, 1, 1, 1, 1, 1,
-0.4987122, -0.1077945, -2.662137, 1, 1, 1, 1, 1,
-0.4934509, 0.6895242, -0.2961729, 1, 1, 1, 1, 1,
-0.4911363, -0.2713782, -1.554011, 1, 1, 1, 1, 1,
-0.4871522, 1.254775, -1.835536, 1, 1, 1, 1, 1,
-0.4819391, -0.4280465, -4.082163, 1, 1, 1, 1, 1,
-0.4754296, 0.5552602, -1.958865, 1, 1, 1, 1, 1,
-0.4732563, -1.536531, -2.281754, 1, 1, 1, 1, 1,
-0.4712715, 0.7132837, -1.226892, 1, 1, 1, 1, 1,
-0.4704628, 0.3853824, -1.639581, 1, 1, 1, 1, 1,
-0.4680647, -0.4188848, -2.696611, 1, 1, 1, 1, 1,
-0.4648395, -0.7500064, -1.928442, 1, 1, 1, 1, 1,
-0.4616614, 0.3940155, -0.9658332, 1, 1, 1, 1, 1,
-0.4586667, -2.507411, -2.338023, 1, 1, 1, 1, 1,
-0.4575113, -1.162748, -1.401693, 0, 0, 1, 1, 1,
-0.4566088, -0.08013061, -1.909392, 1, 0, 0, 1, 1,
-0.4545135, -0.7907679, -3.83666, 1, 0, 0, 1, 1,
-0.4446185, -0.09568594, -1.883556, 1, 0, 0, 1, 1,
-0.4393933, 0.175458, -0.9808714, 1, 0, 0, 1, 1,
-0.4385855, 0.5908686, -1.428611, 1, 0, 0, 1, 1,
-0.436083, 0.6304369, 1.020133, 0, 0, 0, 1, 1,
-0.4336421, -0.3357644, -3.469015, 0, 0, 0, 1, 1,
-0.4303899, -0.4146753, -3.852618, 0, 0, 0, 1, 1,
-0.4281442, 0.3815528, -2.253749, 0, 0, 0, 1, 1,
-0.4180624, -1.894612, -1.684998, 0, 0, 0, 1, 1,
-0.4168147, -0.07556713, -1.648333, 0, 0, 0, 1, 1,
-0.416344, -0.07178356, -0.8481231, 0, 0, 0, 1, 1,
-0.4139046, -1.232419, -4.507442, 1, 1, 1, 1, 1,
-0.4108978, -0.4599509, -2.500625, 1, 1, 1, 1, 1,
-0.4087554, 1.109323, 0.2333841, 1, 1, 1, 1, 1,
-0.4022653, -0.3897599, -1.624432, 1, 1, 1, 1, 1,
-0.4021437, 0.3291984, -0.3723556, 1, 1, 1, 1, 1,
-0.3996812, -0.07336986, -2.191084, 1, 1, 1, 1, 1,
-0.3982878, 1.109318, -0.651909, 1, 1, 1, 1, 1,
-0.3935119, -1.311586, -3.971484, 1, 1, 1, 1, 1,
-0.3931766, 0.8967377, -0.561457, 1, 1, 1, 1, 1,
-0.3922984, 0.6810607, 1.29169, 1, 1, 1, 1, 1,
-0.3910616, -0.007159128, -1.03405, 1, 1, 1, 1, 1,
-0.3883406, 0.5064533, -0.6586599, 1, 1, 1, 1, 1,
-0.3833856, 0.8688, 0.8594928, 1, 1, 1, 1, 1,
-0.3757371, 1.552419, 0.05671488, 1, 1, 1, 1, 1,
-0.373508, -0.6799397, -1.624393, 1, 1, 1, 1, 1,
-0.3730359, 0.4472886, -1.05691, 0, 0, 1, 1, 1,
-0.370607, 0.4944646, -0.0635791, 1, 0, 0, 1, 1,
-0.3689622, 0.07888947, -0.3697316, 1, 0, 0, 1, 1,
-0.3684669, -0.9191169, -3.241597, 1, 0, 0, 1, 1,
-0.3601717, 0.9534138, -0.6218206, 1, 0, 0, 1, 1,
-0.3586119, 0.6503733, -1.091666, 1, 0, 0, 1, 1,
-0.3523355, 1.915759, 1.216041, 0, 0, 0, 1, 1,
-0.3519608, -0.8837453, -3.388345, 0, 0, 0, 1, 1,
-0.3470898, 0.162236, -1.684758, 0, 0, 0, 1, 1,
-0.3449048, -0.8602225, -4.408076, 0, 0, 0, 1, 1,
-0.3407806, -0.1879278, -2.693294, 0, 0, 0, 1, 1,
-0.3387263, 0.522824, 0.03902665, 0, 0, 0, 1, 1,
-0.3329909, -0.5499591, -3.982275, 0, 0, 0, 1, 1,
-0.3323212, -0.7440969, -3.066369, 1, 1, 1, 1, 1,
-0.3263174, -0.1669495, -1.269555, 1, 1, 1, 1, 1,
-0.3261837, -0.9145474, -3.638748, 1, 1, 1, 1, 1,
-0.3215355, -1.696885, -2.699352, 1, 1, 1, 1, 1,
-0.3193435, -0.07756488, -1.409592, 1, 1, 1, 1, 1,
-0.3093022, -0.4508019, -1.450716, 1, 1, 1, 1, 1,
-0.3090468, -0.2917698, -3.109538, 1, 1, 1, 1, 1,
-0.3076381, -0.2054505, -1.533503, 1, 1, 1, 1, 1,
-0.306711, 0.4465368, -1.985555, 1, 1, 1, 1, 1,
-0.3060047, 0.9511275, -1.037909, 1, 1, 1, 1, 1,
-0.3008705, 0.2338412, -1.68975, 1, 1, 1, 1, 1,
-0.3007595, -0.5375844, -4.353433, 1, 1, 1, 1, 1,
-0.3001482, -0.9764044, -1.103787, 1, 1, 1, 1, 1,
-0.2990634, -0.9560186, -3.578677, 1, 1, 1, 1, 1,
-0.2935038, 2.623203, 0.3336099, 1, 1, 1, 1, 1,
-0.2922927, 2.002491, 0.6240792, 0, 0, 1, 1, 1,
-0.2894608, 2.640851, 0.8133346, 1, 0, 0, 1, 1,
-0.2879664, 0.88273, -0.5223387, 1, 0, 0, 1, 1,
-0.2849206, 1.503201, -1.326316, 1, 0, 0, 1, 1,
-0.2836095, -1.162711, -2.328776, 1, 0, 0, 1, 1,
-0.2810492, 1.694872, 0.3222342, 1, 0, 0, 1, 1,
-0.2798213, -2.522628, -3.015982, 0, 0, 0, 1, 1,
-0.2769372, -1.712192, -2.595892, 0, 0, 0, 1, 1,
-0.2722214, -0.8825923, -4.649433, 0, 0, 0, 1, 1,
-0.2672655, 1.346523, -1.518592, 0, 0, 0, 1, 1,
-0.2659324, -0.1658161, -2.394659, 0, 0, 0, 1, 1,
-0.2654234, -0.8889974, -2.959217, 0, 0, 0, 1, 1,
-0.2626272, -0.7849939, -1.75419, 0, 0, 0, 1, 1,
-0.2540339, -1.410452, -4.331417, 1, 1, 1, 1, 1,
-0.2529859, 0.9679811, -1.226407, 1, 1, 1, 1, 1,
-0.2500631, 1.571038, -0.489599, 1, 1, 1, 1, 1,
-0.2449918, 2.20126, -1.035371, 1, 1, 1, 1, 1,
-0.2443554, -1.630099, -2.767935, 1, 1, 1, 1, 1,
-0.2430316, 0.324471, -0.4817031, 1, 1, 1, 1, 1,
-0.237391, 0.5369071, -2.549581, 1, 1, 1, 1, 1,
-0.236723, 1.570827, 0.8595234, 1, 1, 1, 1, 1,
-0.235488, 0.8741273, 0.51583, 1, 1, 1, 1, 1,
-0.2350945, -0.09037093, -0.02612311, 1, 1, 1, 1, 1,
-0.2278166, 0.006185096, -0.8144719, 1, 1, 1, 1, 1,
-0.225819, -0.1760631, -1.354089, 1, 1, 1, 1, 1,
-0.2249202, 0.9860024, 0.85368, 1, 1, 1, 1, 1,
-0.2235266, -0.0594929, -1.667171, 1, 1, 1, 1, 1,
-0.2221775, -1.663397, -2.380082, 1, 1, 1, 1, 1,
-0.2220237, -0.6802037, -3.447601, 0, 0, 1, 1, 1,
-0.2205963, 0.1508122, 1.322329, 1, 0, 0, 1, 1,
-0.2160594, 0.2977555, -0.102039, 1, 0, 0, 1, 1,
-0.2154716, 0.6747695, -0.3988363, 1, 0, 0, 1, 1,
-0.2121742, -0.1762845, -1.893357, 1, 0, 0, 1, 1,
-0.2105273, -0.6983203, -2.18701, 1, 0, 0, 1, 1,
-0.2049717, -0.8021745, -3.830341, 0, 0, 0, 1, 1,
-0.2036655, 0.1405943, -1.05803, 0, 0, 0, 1, 1,
-0.2023142, -0.9350695, -2.314191, 0, 0, 0, 1, 1,
-0.1975223, -1.133619, -3.346219, 0, 0, 0, 1, 1,
-0.1955183, 1.106404, -1.219381, 0, 0, 0, 1, 1,
-0.1941736, -0.4438777, -1.212952, 0, 0, 0, 1, 1,
-0.1901062, 0.2607213, 0.09180164, 0, 0, 0, 1, 1,
-0.1891381, -1.044887, -1.922244, 1, 1, 1, 1, 1,
-0.188848, -0.1444786, -2.913451, 1, 1, 1, 1, 1,
-0.1885206, 0.7015467, -2.081151, 1, 1, 1, 1, 1,
-0.1879557, 1.070896, -1.395493, 1, 1, 1, 1, 1,
-0.1854477, -1.514742, -3.598551, 1, 1, 1, 1, 1,
-0.1829604, -3.2796, -1.763369, 1, 1, 1, 1, 1,
-0.1797037, -0.04202446, -1.515977, 1, 1, 1, 1, 1,
-0.1781792, 0.01230363, -3.079803, 1, 1, 1, 1, 1,
-0.1767292, 0.09944424, -1.582743, 1, 1, 1, 1, 1,
-0.1765064, 0.9006777, -0.2889903, 1, 1, 1, 1, 1,
-0.1744414, -0.6100465, -2.47961, 1, 1, 1, 1, 1,
-0.1648634, 0.5453477, -0.676469, 1, 1, 1, 1, 1,
-0.1644147, -1.112402, -3.600237, 1, 1, 1, 1, 1,
-0.1641938, -0.03206721, -2.356869, 1, 1, 1, 1, 1,
-0.1526583, -0.6877935, -1.8403, 1, 1, 1, 1, 1,
-0.1504204, 0.1694894, -0.7291609, 0, 0, 1, 1, 1,
-0.146935, -1.015726, -2.639971, 1, 0, 0, 1, 1,
-0.1415602, -0.301289, -1.92246, 1, 0, 0, 1, 1,
-0.1400345, -0.2880809, -3.592494, 1, 0, 0, 1, 1,
-0.1362699, 0.584655, -0.3652311, 1, 0, 0, 1, 1,
-0.1341488, 0.06010105, -2.136778, 1, 0, 0, 1, 1,
-0.1255532, -0.06029712, -3.187771, 0, 0, 0, 1, 1,
-0.1217885, -0.1064998, -3.676924, 0, 0, 0, 1, 1,
-0.1216413, -0.07764772, -3.108695, 0, 0, 0, 1, 1,
-0.1213752, -0.5081508, -2.527872, 0, 0, 0, 1, 1,
-0.1173242, 1.695964, -0.3186007, 0, 0, 0, 1, 1,
-0.1162437, -1.143096, -2.599368, 0, 0, 0, 1, 1,
-0.1120369, 0.9912948, -0.0764275, 0, 0, 0, 1, 1,
-0.10894, -0.4722814, -2.493003, 1, 1, 1, 1, 1,
-0.1084474, 2.706896, -1.718866, 1, 1, 1, 1, 1,
-0.108078, -1.625802, -3.038381, 1, 1, 1, 1, 1,
-0.1062339, 1.448449, -1.213668, 1, 1, 1, 1, 1,
-0.1008847, -0.642951, -2.879995, 1, 1, 1, 1, 1,
-0.09639805, -1.250315, -2.225646, 1, 1, 1, 1, 1,
-0.09369037, 1.169899, 2.243308, 1, 1, 1, 1, 1,
-0.08906711, -0.9439818, -2.68996, 1, 1, 1, 1, 1,
-0.08871484, -1.519316, -2.291952, 1, 1, 1, 1, 1,
-0.08863476, 1.183948, -0.01139152, 1, 1, 1, 1, 1,
-0.08665568, -0.6097513, -2.697907, 1, 1, 1, 1, 1,
-0.08618216, -0.8487732, -3.659279, 1, 1, 1, 1, 1,
-0.08363625, -0.5254002, -2.882512, 1, 1, 1, 1, 1,
-0.08057494, 2.736251, 0.6750731, 1, 1, 1, 1, 1,
-0.07838719, -0.2062611, -3.186168, 1, 1, 1, 1, 1,
-0.07421977, 1.11079, -1.585912, 0, 0, 1, 1, 1,
-0.06574524, 0.1553559, -0.6862357, 1, 0, 0, 1, 1,
-0.06344803, -0.2914447, -1.066519, 1, 0, 0, 1, 1,
-0.0623195, -0.3337634, -1.432073, 1, 0, 0, 1, 1,
-0.06170246, -0.3264699, -2.62649, 1, 0, 0, 1, 1,
-0.05962106, -0.705376, -2.854185, 1, 0, 0, 1, 1,
-0.05947515, -0.9478893, -2.325555, 0, 0, 0, 1, 1,
-0.05780854, 1.09545, -0.9408694, 0, 0, 0, 1, 1,
-0.05623726, 0.9099219, -0.7240905, 0, 0, 0, 1, 1,
-0.05580922, 2.07761, -1.615835, 0, 0, 0, 1, 1,
-0.05370336, -0.6428681, -2.340313, 0, 0, 0, 1, 1,
-0.05243088, 1.284953, 1.492367, 0, 0, 0, 1, 1,
-0.04886862, 0.4179138, -0.2048255, 0, 0, 0, 1, 1,
-0.047794, 0.7581661, -0.4130662, 1, 1, 1, 1, 1,
-0.0466207, -0.2839302, -1.736741, 1, 1, 1, 1, 1,
-0.03979103, 0.6805867, -1.200209, 1, 1, 1, 1, 1,
-0.0299, -1.199663, -3.615794, 1, 1, 1, 1, 1,
-0.02962323, -0.710094, -4.631238, 1, 1, 1, 1, 1,
-0.02821122, -0.5970381, -2.732866, 1, 1, 1, 1, 1,
-0.02754409, -1.795769, -2.334933, 1, 1, 1, 1, 1,
-0.02706063, -0.5723137, -3.218371, 1, 1, 1, 1, 1,
-0.02519755, 0.2702352, 0.2929319, 1, 1, 1, 1, 1,
-0.02475766, -0.1922369, -2.335837, 1, 1, 1, 1, 1,
-0.02099475, -0.09119023, -3.88637, 1, 1, 1, 1, 1,
-0.02039649, 0.3023241, -0.3945043, 1, 1, 1, 1, 1,
-0.01966924, -0.7864213, -4.075891, 1, 1, 1, 1, 1,
-0.01435287, -0.9671103, -2.62206, 1, 1, 1, 1, 1,
-0.01310624, -0.4539135, -3.117866, 1, 1, 1, 1, 1,
-0.00877875, -0.01319664, -2.972722, 0, 0, 1, 1, 1,
-0.008006777, -1.532397, -2.767122, 1, 0, 0, 1, 1,
-0.003260935, -0.3834157, -3.543283, 1, 0, 0, 1, 1,
0.00163991, -1.272682, 5.215644, 1, 0, 0, 1, 1,
0.004860427, -0.8017476, 2.458523, 1, 0, 0, 1, 1,
0.00511835, -0.445237, 4.851219, 1, 0, 0, 1, 1,
0.008067671, -0.8190348, 2.701468, 0, 0, 0, 1, 1,
0.01339774, -0.147547, 1.483896, 0, 0, 0, 1, 1,
0.01490432, -0.5890232, 3.815922, 0, 0, 0, 1, 1,
0.01711618, -1.166511, 3.693059, 0, 0, 0, 1, 1,
0.01895385, -0.6603059, 1.471875, 0, 0, 0, 1, 1,
0.02225643, -0.8902396, 4.822181, 0, 0, 0, 1, 1,
0.02532236, -0.08181917, 3.379435, 0, 0, 0, 1, 1,
0.02948388, 0.1575974, -0.4310162, 1, 1, 1, 1, 1,
0.02957463, -0.5754563, 3.96889, 1, 1, 1, 1, 1,
0.03053957, -1.661363, 3.074509, 1, 1, 1, 1, 1,
0.03212445, -1.155424, 4.063353, 1, 1, 1, 1, 1,
0.03994219, 0.3246801, -0.2749661, 1, 1, 1, 1, 1,
0.04094272, -0.7756151, 4.86117, 1, 1, 1, 1, 1,
0.04302192, -0.6469838, 3.369882, 1, 1, 1, 1, 1,
0.04440672, -0.06769288, 2.338627, 1, 1, 1, 1, 1,
0.04596618, 0.6384066, 0.6059374, 1, 1, 1, 1, 1,
0.04894927, -1.515891, 3.061258, 1, 1, 1, 1, 1,
0.04991372, -1.496812, 3.090004, 1, 1, 1, 1, 1,
0.05130674, 0.9368576, 0.5965254, 1, 1, 1, 1, 1,
0.05397908, 0.9644558, -0.800276, 1, 1, 1, 1, 1,
0.0550538, 0.1856358, 1.950519, 1, 1, 1, 1, 1,
0.05589549, 0.7629369, -0.9478542, 1, 1, 1, 1, 1,
0.05690052, -0.6617483, 2.05964, 0, 0, 1, 1, 1,
0.05903371, -0.5487494, 1.437095, 1, 0, 0, 1, 1,
0.0619106, 0.0352811, 0.9919702, 1, 0, 0, 1, 1,
0.06467874, -1.384434, 2.488739, 1, 0, 0, 1, 1,
0.06976017, 0.4498855, -1.51598, 1, 0, 0, 1, 1,
0.0709196, -1.006051, 4.844217, 1, 0, 0, 1, 1,
0.07198291, -2.104968, 2.199102, 0, 0, 0, 1, 1,
0.07225068, -0.9450083, 4.092524, 0, 0, 0, 1, 1,
0.07248777, -0.1126166, 0.8209601, 0, 0, 0, 1, 1,
0.07266781, 0.825901, 0.1641304, 0, 0, 0, 1, 1,
0.07389524, -0.2893555, 2.720144, 0, 0, 0, 1, 1,
0.07646693, 0.337475, 1.484851, 0, 0, 0, 1, 1,
0.07706636, -1.913041, 4.190767, 0, 0, 0, 1, 1,
0.07749171, -1.065095, 3.577225, 1, 1, 1, 1, 1,
0.07915953, -0.3172668, 2.795842, 1, 1, 1, 1, 1,
0.08074798, -1.020251, 5.200082, 1, 1, 1, 1, 1,
0.08372179, -0.9384556, 3.293101, 1, 1, 1, 1, 1,
0.09109666, 0.3443816, 0.7154325, 1, 1, 1, 1, 1,
0.09749489, 0.4661279, 0.08476696, 1, 1, 1, 1, 1,
0.1047708, -0.08391278, 4.63201, 1, 1, 1, 1, 1,
0.10501, 0.3743722, -0.6674102, 1, 1, 1, 1, 1,
0.1059544, 1.806747, 0.7663081, 1, 1, 1, 1, 1,
0.1067563, -0.6668223, 3.003835, 1, 1, 1, 1, 1,
0.106952, 2.251169, -1.142111, 1, 1, 1, 1, 1,
0.1074657, -0.1923462, 3.29464, 1, 1, 1, 1, 1,
0.1077065, 1.504801, 0.8756908, 1, 1, 1, 1, 1,
0.1143641, 1.129451, -0.5896329, 1, 1, 1, 1, 1,
0.1175224, 1.192528, 0.1758721, 1, 1, 1, 1, 1,
0.1204683, -0.1175796, 2.079588, 0, 0, 1, 1, 1,
0.1205398, 0.194008, -1.181953, 1, 0, 0, 1, 1,
0.1212341, -1.290496, 3.482976, 1, 0, 0, 1, 1,
0.1256423, -0.4386101, 2.669184, 1, 0, 0, 1, 1,
0.1294122, 0.9057277, 0.2220514, 1, 0, 0, 1, 1,
0.1327496, -1.642017, 1.554558, 1, 0, 0, 1, 1,
0.134507, -0.1233741, 2.407122, 0, 0, 0, 1, 1,
0.1351738, 0.202779, -1.723416, 0, 0, 0, 1, 1,
0.1382785, 0.0869594, 0.5466582, 0, 0, 0, 1, 1,
0.1383881, 0.5087149, 0.7708187, 0, 0, 0, 1, 1,
0.1406817, 0.3941386, -0.9702521, 0, 0, 0, 1, 1,
0.1446117, -0.986393, 2.024653, 0, 0, 0, 1, 1,
0.1462346, -0.7741935, 2.668737, 0, 0, 0, 1, 1,
0.1463835, -0.3328453, 2.365173, 1, 1, 1, 1, 1,
0.1468421, -0.6385332, 4.211607, 1, 1, 1, 1, 1,
0.150903, 0.2878377, 1.364626, 1, 1, 1, 1, 1,
0.1516086, -1.421337, 3.377376, 1, 1, 1, 1, 1,
0.1583967, -0.400064, 3.185631, 1, 1, 1, 1, 1,
0.1605477, -0.9060708, 3.075826, 1, 1, 1, 1, 1,
0.161014, -0.08743487, 1.66418, 1, 1, 1, 1, 1,
0.1615247, -0.1182403, 3.042685, 1, 1, 1, 1, 1,
0.1639846, 0.3431257, 0.2189232, 1, 1, 1, 1, 1,
0.1690779, 0.3447561, 1.367411, 1, 1, 1, 1, 1,
0.1715295, -0.06550144, 2.059171, 1, 1, 1, 1, 1,
0.1725614, -0.5941632, 4.287021, 1, 1, 1, 1, 1,
0.1726625, -2.39657, 2.51329, 1, 1, 1, 1, 1,
0.1739588, -0.1381505, 1.571097, 1, 1, 1, 1, 1,
0.1750951, 0.4689352, 0.2646431, 1, 1, 1, 1, 1,
0.1756011, -0.1943985, 1.115777, 0, 0, 1, 1, 1,
0.1796843, 0.7402336, 0.9040135, 1, 0, 0, 1, 1,
0.1838076, -0.3562656, 4.820756, 1, 0, 0, 1, 1,
0.1888424, 2.020591, -0.9775704, 1, 0, 0, 1, 1,
0.1905837, 2.000988, -0.7506618, 1, 0, 0, 1, 1,
0.1909183, -1.445, 2.537091, 1, 0, 0, 1, 1,
0.1928775, -0.5383799, -0.1284733, 0, 0, 0, 1, 1,
0.1953452, -2.769532, 3.481076, 0, 0, 0, 1, 1,
0.1978458, 0.5722168, -0.7079014, 0, 0, 0, 1, 1,
0.2018438, 1.586956, -0.7080476, 0, 0, 0, 1, 1,
0.2068365, -0.3601703, 2.420996, 0, 0, 0, 1, 1,
0.2094701, -2.304403, 1.715072, 0, 0, 0, 1, 1,
0.2105612, -0.7330176, 3.166837, 0, 0, 0, 1, 1,
0.2137187, -0.7004478, 2.803405, 1, 1, 1, 1, 1,
0.2137478, 1.265969, 0.6763328, 1, 1, 1, 1, 1,
0.2138181, 0.9107109, 1.024624, 1, 1, 1, 1, 1,
0.2155167, -0.9138222, 2.422853, 1, 1, 1, 1, 1,
0.2158725, 0.5337499, 0.3054523, 1, 1, 1, 1, 1,
0.2166687, -1.660774, 2.895446, 1, 1, 1, 1, 1,
0.2187007, -1.851493, 2.717648, 1, 1, 1, 1, 1,
0.2197812, 0.2819606, -0.6559278, 1, 1, 1, 1, 1,
0.2214893, 0.5384944, 2.047078, 1, 1, 1, 1, 1,
0.2251236, -0.2204379, 1.274579, 1, 1, 1, 1, 1,
0.2291229, -0.04902783, 2.170367, 1, 1, 1, 1, 1,
0.2314164, 0.548661, 0.4749012, 1, 1, 1, 1, 1,
0.2343722, 0.5167053, 1.104697, 1, 1, 1, 1, 1,
0.2357963, -1.334268, 3.155407, 1, 1, 1, 1, 1,
0.2364474, 1.163694, -0.9544019, 1, 1, 1, 1, 1,
0.2483015, -0.01332127, -0.4289606, 0, 0, 1, 1, 1,
0.2534304, 0.9628822, -0.5302775, 1, 0, 0, 1, 1,
0.2552282, -0.7818712, 2.409994, 1, 0, 0, 1, 1,
0.2611974, 1.501267, 1.892523, 1, 0, 0, 1, 1,
0.2678543, -1.190285, 2.839044, 1, 0, 0, 1, 1,
0.2681313, 0.04667226, 1.027447, 1, 0, 0, 1, 1,
0.2717931, -1.514529, 2.032048, 0, 0, 0, 1, 1,
0.2719423, 1.042442, 0.8938479, 0, 0, 0, 1, 1,
0.2770613, 0.2639103, 1.154713, 0, 0, 0, 1, 1,
0.2785897, 0.8627158, 1.674702, 0, 0, 0, 1, 1,
0.2802304, 0.6871483, 2.275354, 0, 0, 0, 1, 1,
0.2844815, -0.6389192, 2.650687, 0, 0, 0, 1, 1,
0.2875502, 0.3691324, 2.465586, 0, 0, 0, 1, 1,
0.2954766, 0.6043929, -1.200348, 1, 1, 1, 1, 1,
0.2975953, -0.7273917, 2.91589, 1, 1, 1, 1, 1,
0.2986837, 1.353945, 0.1464673, 1, 1, 1, 1, 1,
0.2997957, -0.8346097, 2.669092, 1, 1, 1, 1, 1,
0.3018695, 0.7070308, 1.477491, 1, 1, 1, 1, 1,
0.3026193, 0.6286962, -1.449371, 1, 1, 1, 1, 1,
0.3050275, -0.9419845, 3.429502, 1, 1, 1, 1, 1,
0.3085829, 0.4486915, 1.813652, 1, 1, 1, 1, 1,
0.3089213, 0.5474778, -0.580828, 1, 1, 1, 1, 1,
0.309885, -2.389936, 2.238379, 1, 1, 1, 1, 1,
0.3115839, 1.632952, 0.3372034, 1, 1, 1, 1, 1,
0.3122887, -0.1155514, 3.236063, 1, 1, 1, 1, 1,
0.3125411, -0.05704991, 2.417658, 1, 1, 1, 1, 1,
0.3151202, 1.116364, -1.722103, 1, 1, 1, 1, 1,
0.316514, 1.164478, 0.022726, 1, 1, 1, 1, 1,
0.3170376, 0.06839183, 2.649112, 0, 0, 1, 1, 1,
0.3210186, 2.175796, 1.183193, 1, 0, 0, 1, 1,
0.321686, 1.56128, -1.223739, 1, 0, 0, 1, 1,
0.3250554, -1.106988, 2.717324, 1, 0, 0, 1, 1,
0.326449, 0.6440057, 1.731223, 1, 0, 0, 1, 1,
0.3297139, 0.0955762, 0.1544963, 1, 0, 0, 1, 1,
0.3299278, -0.4125318, 3.537, 0, 0, 0, 1, 1,
0.3319804, 0.7839983, 2.705971, 0, 0, 0, 1, 1,
0.3358578, -0.2438703, 1.972618, 0, 0, 0, 1, 1,
0.3389975, -2.381387, 2.791287, 0, 0, 0, 1, 1,
0.3419249, 1.012386, 0.7761301, 0, 0, 0, 1, 1,
0.3498717, -0.5611302, 3.166901, 0, 0, 0, 1, 1,
0.3514503, 1.84922, 0.2977527, 0, 0, 0, 1, 1,
0.3535675, -2.042275, 2.588869, 1, 1, 1, 1, 1,
0.3596582, 0.5092415, 0.9436116, 1, 1, 1, 1, 1,
0.3609418, 0.310405, 0.8220033, 1, 1, 1, 1, 1,
0.3614439, -0.932776, 2.065488, 1, 1, 1, 1, 1,
0.367176, 0.5106871, 1.103704, 1, 1, 1, 1, 1,
0.3679276, 0.01242035, 3.240011, 1, 1, 1, 1, 1,
0.3755521, -0.7815762, 3.902171, 1, 1, 1, 1, 1,
0.3776864, -0.4919093, 4.162548, 1, 1, 1, 1, 1,
0.3813907, 0.1952611, 1.887844, 1, 1, 1, 1, 1,
0.3845893, -0.1709818, 1.873345, 1, 1, 1, 1, 1,
0.3890575, -1.668816, 3.979636, 1, 1, 1, 1, 1,
0.3901035, -0.5283131, 2.5603, 1, 1, 1, 1, 1,
0.3931074, -0.00457288, 3.570441, 1, 1, 1, 1, 1,
0.3958831, -1.40591, 2.275967, 1, 1, 1, 1, 1,
0.3959782, -0.3119134, 2.531591, 1, 1, 1, 1, 1,
0.397027, 0.9720813, -0.8081086, 0, 0, 1, 1, 1,
0.3997477, -1.468427, 4.282691, 1, 0, 0, 1, 1,
0.4008973, 0.2601675, 0.8027247, 1, 0, 0, 1, 1,
0.4029005, 1.79468, -0.5317616, 1, 0, 0, 1, 1,
0.4044513, 0.0841968, 1.072806, 1, 0, 0, 1, 1,
0.4064867, -1.066569, 3.285195, 1, 0, 0, 1, 1,
0.4075232, 0.9782213, -2.393492, 0, 0, 0, 1, 1,
0.4083888, 2.50533, -1.092925, 0, 0, 0, 1, 1,
0.4094385, -1.304368, 3.725133, 0, 0, 0, 1, 1,
0.4151273, -0.4057469, 5.279001, 0, 0, 0, 1, 1,
0.4152711, 0.2685179, -0.3028357, 0, 0, 0, 1, 1,
0.4154202, -0.9590006, 2.158222, 0, 0, 0, 1, 1,
0.4193133, -1.653877, 3.532503, 0, 0, 0, 1, 1,
0.4198342, 1.278287, 0.8501822, 1, 1, 1, 1, 1,
0.42158, -0.5762265, 1.647731, 1, 1, 1, 1, 1,
0.4229494, -1.385102, 1.932901, 1, 1, 1, 1, 1,
0.424546, -1.239331, 2.428671, 1, 1, 1, 1, 1,
0.4259624, -0.1203862, 2.108745, 1, 1, 1, 1, 1,
0.4308293, 0.1316265, -0.1323746, 1, 1, 1, 1, 1,
0.4313124, 0.04527183, 2.705776, 1, 1, 1, 1, 1,
0.4316273, -1.13636, 4.378986, 1, 1, 1, 1, 1,
0.4318447, 1.033846, 0.4256692, 1, 1, 1, 1, 1,
0.4355085, 1.059965, 1.054458, 1, 1, 1, 1, 1,
0.4355608, 0.5665342, 0.1874858, 1, 1, 1, 1, 1,
0.4372495, -0.4797933, 2.584032, 1, 1, 1, 1, 1,
0.4385156, 0.2297535, 1.400477, 1, 1, 1, 1, 1,
0.4401016, 0.4623007, 0.2683781, 1, 1, 1, 1, 1,
0.4440208, -1.004241, 2.221749, 1, 1, 1, 1, 1,
0.444588, -0.6819316, 2.984655, 0, 0, 1, 1, 1,
0.4512987, 0.6196259, 1.613048, 1, 0, 0, 1, 1,
0.4564505, -0.5720332, 1.267939, 1, 0, 0, 1, 1,
0.459076, 1.276269, 0.2817572, 1, 0, 0, 1, 1,
0.4598295, -0.3676728, 2.218039, 1, 0, 0, 1, 1,
0.4663779, 1.80367, 0.1525925, 1, 0, 0, 1, 1,
0.4670343, 0.04940462, 1.305372, 0, 0, 0, 1, 1,
0.4737726, 1.520542, 1.531014, 0, 0, 0, 1, 1,
0.4752826, 0.5599624, 2.198026, 0, 0, 0, 1, 1,
0.4760088, -0.3625631, 1.241034, 0, 0, 0, 1, 1,
0.4762978, -1.134906, -0.1373332, 0, 0, 0, 1, 1,
0.4771578, -0.1682579, 1.915374, 0, 0, 0, 1, 1,
0.4812924, -1.317291, 4.421186, 0, 0, 0, 1, 1,
0.4824961, -1.39792, 3.475733, 1, 1, 1, 1, 1,
0.4957095, -0.6396223, 2.546486, 1, 1, 1, 1, 1,
0.496736, 0.7637153, -0.3406139, 1, 1, 1, 1, 1,
0.4972513, -0.9751636, 4.884094, 1, 1, 1, 1, 1,
0.4982417, 0.5433175, 0.507024, 1, 1, 1, 1, 1,
0.5009302, -0.4688423, 0.5792745, 1, 1, 1, 1, 1,
0.504906, 0.4847264, 0.5760776, 1, 1, 1, 1, 1,
0.5085136, -0.7186922, 3.043591, 1, 1, 1, 1, 1,
0.5104397, 2.258126, 2.331298, 1, 1, 1, 1, 1,
0.5113619, -1.662127, 2.282694, 1, 1, 1, 1, 1,
0.5128216, -0.3947332, 3.669379, 1, 1, 1, 1, 1,
0.5172524, 0.6323248, 0.9095402, 1, 1, 1, 1, 1,
0.5208967, -0.1758718, 2.348037, 1, 1, 1, 1, 1,
0.5240024, 0.2257944, 1.130068, 1, 1, 1, 1, 1,
0.5242891, -0.7419916, 1.978596, 1, 1, 1, 1, 1,
0.5293258, 0.2376985, 2.730996, 0, 0, 1, 1, 1,
0.529814, -0.9077141, 3.783412, 1, 0, 0, 1, 1,
0.5312761, -0.1486733, 3.136954, 1, 0, 0, 1, 1,
0.5329409, 0.2975964, 0.5678532, 1, 0, 0, 1, 1,
0.5378226, 0.7420814, -0.175266, 1, 0, 0, 1, 1,
0.5401171, -1.077864, 3.604996, 1, 0, 0, 1, 1,
0.5403689, 0.7009372, 0.6363451, 0, 0, 0, 1, 1,
0.5424875, -0.2262402, 3.281214, 0, 0, 0, 1, 1,
0.5477103, -1.17353, 1.900797, 0, 0, 0, 1, 1,
0.5477391, -0.04785289, -0.2201055, 0, 0, 0, 1, 1,
0.5489655, 0.7645128, 1.683206, 0, 0, 0, 1, 1,
0.5531893, 0.3531448, 1.660571, 0, 0, 0, 1, 1,
0.553508, -1.834474, 1.345436, 0, 0, 0, 1, 1,
0.5535188, 0.3077252, 1.306931, 1, 1, 1, 1, 1,
0.5587987, 0.5229409, 0.3733332, 1, 1, 1, 1, 1,
0.5616679, -0.593356, 3.177611, 1, 1, 1, 1, 1,
0.5683319, -0.5604874, 2.632506, 1, 1, 1, 1, 1,
0.5692464, 0.3785723, 0.7519741, 1, 1, 1, 1, 1,
0.5704319, -1.894141, 3.812194, 1, 1, 1, 1, 1,
0.5705942, 0.8472013, 1.112227, 1, 1, 1, 1, 1,
0.5739334, -0.4473317, 1.346562, 1, 1, 1, 1, 1,
0.5747741, 0.8376818, 1.338071, 1, 1, 1, 1, 1,
0.5805423, 1.048302, 0.4957497, 1, 1, 1, 1, 1,
0.5807854, 1.689866, -1.485745, 1, 1, 1, 1, 1,
0.5832115, -0.6995279, 0.640774, 1, 1, 1, 1, 1,
0.5842926, 0.8647243, 0.8024812, 1, 1, 1, 1, 1,
0.5843549, -2.137623, 2.185341, 1, 1, 1, 1, 1,
0.5858536, 0.5366392, 1.39568, 1, 1, 1, 1, 1,
0.5914959, -0.8542284, 1.931512, 0, 0, 1, 1, 1,
0.5943182, 1.703571, 1.240605, 1, 0, 0, 1, 1,
0.5958036, -0.631331, 3.175015, 1, 0, 0, 1, 1,
0.6016052, 0.7150087, 0.7864013, 1, 0, 0, 1, 1,
0.6084656, -0.3636105, -0.2287294, 1, 0, 0, 1, 1,
0.6120058, -0.08686344, 2.765836, 1, 0, 0, 1, 1,
0.6177821, -1.27128, 2.074213, 0, 0, 0, 1, 1,
0.6202276, 0.754934, 2.000542, 0, 0, 0, 1, 1,
0.6246356, 0.1661908, -0.5310345, 0, 0, 0, 1, 1,
0.6258507, 0.205028, 0.7507682, 0, 0, 0, 1, 1,
0.6258548, 0.8914191, -1.383606, 0, 0, 0, 1, 1,
0.640211, -0.9958287, 5.607081, 0, 0, 0, 1, 1,
0.6439086, 0.2000488, 1.52385, 0, 0, 0, 1, 1,
0.6455021, 0.5308364, 0.05317862, 1, 1, 1, 1, 1,
0.648135, -0.8841045, 1.704559, 1, 1, 1, 1, 1,
0.648797, -1.337785, 2.332551, 1, 1, 1, 1, 1,
0.651149, 0.1984428, 3.006454, 1, 1, 1, 1, 1,
0.6522886, 0.5931711, 1.535162, 1, 1, 1, 1, 1,
0.6526986, 0.6646694, 0.4800852, 1, 1, 1, 1, 1,
0.6530006, -0.202418, 1.104789, 1, 1, 1, 1, 1,
0.6578136, 0.3487482, 0.6369852, 1, 1, 1, 1, 1,
0.6587945, -0.5779908, 1.422168, 1, 1, 1, 1, 1,
0.6599843, -0.04190419, 0.7262589, 1, 1, 1, 1, 1,
0.6610138, 0.2569865, 0.7388328, 1, 1, 1, 1, 1,
0.6613532, -1.370531, 2.152972, 1, 1, 1, 1, 1,
0.6619913, -0.9254836, 1.223272, 1, 1, 1, 1, 1,
0.6625864, 1.476009, 0.8048221, 1, 1, 1, 1, 1,
0.678504, -1.217464, 1.825428, 1, 1, 1, 1, 1,
0.6821562, -0.6418034, 0.6624716, 0, 0, 1, 1, 1,
0.6875448, -1.805714, 1.906325, 1, 0, 0, 1, 1,
0.6919353, 1.09371, 0.4687293, 1, 0, 0, 1, 1,
0.6953338, 0.2611795, 1.149898, 1, 0, 0, 1, 1,
0.6974338, -0.1541412, 0.7358889, 1, 0, 0, 1, 1,
0.697908, 2.825132, 1.80433, 1, 0, 0, 1, 1,
0.69875, -0.1975015, 1.905462, 0, 0, 0, 1, 1,
0.6997921, 0.007718981, 0.4065241, 0, 0, 0, 1, 1,
0.7006563, -1.285009, 1.872863, 0, 0, 0, 1, 1,
0.7019228, -0.2255412, 3.591786, 0, 0, 0, 1, 1,
0.7028729, 0.7034363, 1.605186, 0, 0, 0, 1, 1,
0.7031161, 2.928463, -1.048227, 0, 0, 0, 1, 1,
0.7046924, -0.2316349, 3.011378, 0, 0, 0, 1, 1,
0.7109863, 0.316841, 0.7388386, 1, 1, 1, 1, 1,
0.7118948, -0.6549001, 1.601429, 1, 1, 1, 1, 1,
0.712736, -0.04171262, 2.570786, 1, 1, 1, 1, 1,
0.7157798, -2.266236, 3.035248, 1, 1, 1, 1, 1,
0.7242464, -0.1791618, 3.368819, 1, 1, 1, 1, 1,
0.7255265, 0.6024572, 1.458287, 1, 1, 1, 1, 1,
0.7263429, 0.6690077, -0.1379509, 1, 1, 1, 1, 1,
0.7280982, -0.7440622, 2.861793, 1, 1, 1, 1, 1,
0.7292191, -0.6585081, 2.968194, 1, 1, 1, 1, 1,
0.7301328, -1.815174, 2.693752, 1, 1, 1, 1, 1,
0.7306827, 2.20188, 0.7480332, 1, 1, 1, 1, 1,
0.7340599, 0.2747896, 2.121403, 1, 1, 1, 1, 1,
0.7357283, 1.097875, -0.6710088, 1, 1, 1, 1, 1,
0.7368141, -0.7679332, 1.61845, 1, 1, 1, 1, 1,
0.7387663, -0.1323395, 2.486431, 1, 1, 1, 1, 1,
0.7388778, -1.426188, 2.883113, 0, 0, 1, 1, 1,
0.7389283, -0.9261096, 1.133399, 1, 0, 0, 1, 1,
0.7397022, 0.3528531, 1.148896, 1, 0, 0, 1, 1,
0.7400081, -0.2922304, 1.849157, 1, 0, 0, 1, 1,
0.7406629, 0.83005, 0.6953471, 1, 0, 0, 1, 1,
0.7440562, 0.01479199, -0.1711481, 1, 0, 0, 1, 1,
0.7454949, 0.2810003, 1.074986, 0, 0, 0, 1, 1,
0.7504075, 0.1465095, 3.224261, 0, 0, 0, 1, 1,
0.7594752, -0.2516338, 0.8306318, 0, 0, 0, 1, 1,
0.7600181, 1.070838, 0.2874001, 0, 0, 0, 1, 1,
0.7614068, -0.4972856, 1.729313, 0, 0, 0, 1, 1,
0.7639443, -1.779404, 2.011178, 0, 0, 0, 1, 1,
0.7709019, 0.3494553, 0.594903, 0, 0, 0, 1, 1,
0.7785235, -2.026333, 1.059755, 1, 1, 1, 1, 1,
0.7798272, 0.1482122, 0.8153349, 1, 1, 1, 1, 1,
0.7845187, -0.04498938, 1.865656, 1, 1, 1, 1, 1,
0.7975605, 0.7557855, 2.329135, 1, 1, 1, 1, 1,
0.7979278, -1.361345, 2.742757, 1, 1, 1, 1, 1,
0.8064923, -0.7317975, 1.725039, 1, 1, 1, 1, 1,
0.8109295, -1.146001, 2.099213, 1, 1, 1, 1, 1,
0.8115606, -1.179371, 3.247754, 1, 1, 1, 1, 1,
0.8128759, -0.3802039, 2.920308, 1, 1, 1, 1, 1,
0.8152776, -0.07799223, 1.666764, 1, 1, 1, 1, 1,
0.8153176, 1.699117, -1.596661, 1, 1, 1, 1, 1,
0.8173686, 2.618203, 0.8446419, 1, 1, 1, 1, 1,
0.821278, 0.6416165, 0.1920321, 1, 1, 1, 1, 1,
0.8265796, -0.3106506, 1.134374, 1, 1, 1, 1, 1,
0.8327062, 1.012114, 1.285374, 1, 1, 1, 1, 1,
0.8330405, 0.4783882, 0.8223621, 0, 0, 1, 1, 1,
0.8333364, 0.0003795493, 3.357515, 1, 0, 0, 1, 1,
0.8436716, -1.068072, 4.42771, 1, 0, 0, 1, 1,
0.8440596, -0.6683103, 2.646533, 1, 0, 0, 1, 1,
0.8489208, -0.04132025, 2.555341, 1, 0, 0, 1, 1,
0.8523234, -0.4341694, 5.204063, 1, 0, 0, 1, 1,
0.858223, -1.093874, 3.172014, 0, 0, 0, 1, 1,
0.8594636, -0.07239557, 0.5200291, 0, 0, 0, 1, 1,
0.8626297, -0.9314894, 3.48324, 0, 0, 0, 1, 1,
0.872791, 1.118346, 1.773851, 0, 0, 0, 1, 1,
0.8816618, 0.1870437, 2.175795, 0, 0, 0, 1, 1,
0.8846911, -0.6024236, -0.4383913, 0, 0, 0, 1, 1,
0.8912159, -0.3250177, 0.3398698, 0, 0, 0, 1, 1,
0.8915295, -1.146006, 1.517239, 1, 1, 1, 1, 1,
0.9060701, -1.012303, 2.050139, 1, 1, 1, 1, 1,
0.9065218, 0.5044032, 0.6400155, 1, 1, 1, 1, 1,
0.9116673, -0.8293112, 2.269005, 1, 1, 1, 1, 1,
0.9118192, -1.678029, 2.944952, 1, 1, 1, 1, 1,
0.9153853, -2.164773, 2.144837, 1, 1, 1, 1, 1,
0.9211513, 0.4407343, 0.8606163, 1, 1, 1, 1, 1,
0.9299808, -1.166106, 2.992218, 1, 1, 1, 1, 1,
0.9379708, -0.6413336, 2.099275, 1, 1, 1, 1, 1,
0.9503359, 0.1506751, 0.9371402, 1, 1, 1, 1, 1,
0.9701795, 1.010733, -0.1813584, 1, 1, 1, 1, 1,
0.975629, 0.5332072, 1.294974, 1, 1, 1, 1, 1,
0.977077, 0.170118, 1.227541, 1, 1, 1, 1, 1,
0.9778475, 0.7898281, 0.7824342, 1, 1, 1, 1, 1,
0.979315, 0.3764301, 2.742682, 1, 1, 1, 1, 1,
0.9799936, 0.8336335, 0.3960315, 0, 0, 1, 1, 1,
0.9812055, -1.83826, 1.595619, 1, 0, 0, 1, 1,
0.9841866, -0.6058844, 0.6992749, 1, 0, 0, 1, 1,
0.9898095, 0.1458895, 0.7550398, 1, 0, 0, 1, 1,
0.9903297, 1.056276, 0.2625768, 1, 0, 0, 1, 1,
0.9932794, 0.5468919, 1.911501, 1, 0, 0, 1, 1,
0.9937441, 0.3354038, 2.871451, 0, 0, 0, 1, 1,
0.9957781, -0.01224248, 1.751914, 0, 0, 0, 1, 1,
0.9963017, 0.6407275, 1.577201, 0, 0, 0, 1, 1,
0.9992853, -0.5637516, 1.996238, 0, 0, 0, 1, 1,
1.001474, -0.5986155, 1.408675, 0, 0, 0, 1, 1,
1.002788, -1.944237, 1.982201, 0, 0, 0, 1, 1,
1.008078, -0.04983185, 1.717423, 0, 0, 0, 1, 1,
1.027195, 0.08004615, 1.351969, 1, 1, 1, 1, 1,
1.039059, -0.1864013, 2.523093, 1, 1, 1, 1, 1,
1.040483, -0.85709, 2.323965, 1, 1, 1, 1, 1,
1.047786, -1.105745, 1.661294, 1, 1, 1, 1, 1,
1.048488, 1.204351, 0.4485906, 1, 1, 1, 1, 1,
1.053494, -1.062101, 1.781146, 1, 1, 1, 1, 1,
1.054583, 0.5952417, 1.401052, 1, 1, 1, 1, 1,
1.05728, 1.33384, 0.7727402, 1, 1, 1, 1, 1,
1.058738, -0.9691451, 1.518576, 1, 1, 1, 1, 1,
1.06824, -0.5436408, 1.272791, 1, 1, 1, 1, 1,
1.069677, -0.09553272, 1.922091, 1, 1, 1, 1, 1,
1.072151, 0.9161459, -0.3914573, 1, 1, 1, 1, 1,
1.075569, 1.491542, -0.3387899, 1, 1, 1, 1, 1,
1.076139, 2.434059, 1.875201, 1, 1, 1, 1, 1,
1.0795, -0.474951, 2.809706, 1, 1, 1, 1, 1,
1.08436, -1.18832, 2.554538, 0, 0, 1, 1, 1,
1.08761, 1.4006, 1.438147, 1, 0, 0, 1, 1,
1.102563, -0.8639532, 1.924369, 1, 0, 0, 1, 1,
1.103732, -2.899739, 1.821169, 1, 0, 0, 1, 1,
1.107953, 1.019453, 0.7092245, 1, 0, 0, 1, 1,
1.109831, 0.6016307, 0.9537392, 1, 0, 0, 1, 1,
1.1105, 0.06205402, 1.28451, 0, 0, 0, 1, 1,
1.114512, 1.602613, 2.348779, 0, 0, 0, 1, 1,
1.126863, -2.025173, 3.942791, 0, 0, 0, 1, 1,
1.131317, -1.461274, 3.962404, 0, 0, 0, 1, 1,
1.13266, 0.405003, 0.2327239, 0, 0, 0, 1, 1,
1.13664, -0.113492, 0.5758178, 0, 0, 0, 1, 1,
1.137937, 1.550194, 1.786736, 0, 0, 0, 1, 1,
1.144936, 2.469337, 0.4850622, 1, 1, 1, 1, 1,
1.152586, -1.066629, 2.381505, 1, 1, 1, 1, 1,
1.159305, 0.9120756, 2.961916, 1, 1, 1, 1, 1,
1.16132, -0.9693812, 0.7863315, 1, 1, 1, 1, 1,
1.161553, -0.4915745, 3.455487, 1, 1, 1, 1, 1,
1.16652, 1.091458, 1.607827, 1, 1, 1, 1, 1,
1.171366, -0.7045754, 0.7418111, 1, 1, 1, 1, 1,
1.18291, 0.491584, 1.741815, 1, 1, 1, 1, 1,
1.18341, -0.2081296, 0.6431785, 1, 1, 1, 1, 1,
1.186678, 1.131526, -0.5718194, 1, 1, 1, 1, 1,
1.192024, 1.092095, 0.5215659, 1, 1, 1, 1, 1,
1.192656, -1.567548, 2.003093, 1, 1, 1, 1, 1,
1.196688, 0.5863258, 0.5069838, 1, 1, 1, 1, 1,
1.213525, -0.2342164, 0.2992892, 1, 1, 1, 1, 1,
1.215807, 0.2447203, 1.149745, 1, 1, 1, 1, 1,
1.222308, 0.04178079, 1.634788, 0, 0, 1, 1, 1,
1.223636, 1.362094, -0.6260239, 1, 0, 0, 1, 1,
1.234971, -0.6707356, 2.199906, 1, 0, 0, 1, 1,
1.240494, 1.463562, -0.2136185, 1, 0, 0, 1, 1,
1.24254, -1.122761, 0.85571, 1, 0, 0, 1, 1,
1.244045, 0.0338825, 1.740036, 1, 0, 0, 1, 1,
1.250781, -1.199543, 2.155886, 0, 0, 0, 1, 1,
1.253597, 0.5918528, 0.6804061, 0, 0, 0, 1, 1,
1.259123, -1.019083, 2.393351, 0, 0, 0, 1, 1,
1.263762, 0.5614311, 0.6430614, 0, 0, 0, 1, 1,
1.266139, -1.093026, 3.380979, 0, 0, 0, 1, 1,
1.266315, 0.9145097, 0.8458598, 0, 0, 0, 1, 1,
1.282692, 0.8789812, 0.5692685, 0, 0, 0, 1, 1,
1.297391, -0.2326677, 0.9697073, 1, 1, 1, 1, 1,
1.313482, -1.120462, 2.299518, 1, 1, 1, 1, 1,
1.31851, 0.02725283, 0.7114481, 1, 1, 1, 1, 1,
1.341434, -1.188131, 2.863369, 1, 1, 1, 1, 1,
1.34434, 2.373524, 1.658132, 1, 1, 1, 1, 1,
1.348981, 1.634083, 0.1979024, 1, 1, 1, 1, 1,
1.355379, 1.716852, -0.04466976, 1, 1, 1, 1, 1,
1.372222, 0.2584334, 2.040834, 1, 1, 1, 1, 1,
1.380839, 0.8931493, 1.070566, 1, 1, 1, 1, 1,
1.385525, -0.909615, 3.063731, 1, 1, 1, 1, 1,
1.402201, -0.9243588, 3.734913, 1, 1, 1, 1, 1,
1.404035, -0.4181395, 2.671281, 1, 1, 1, 1, 1,
1.410183, 0.9446042, 0.6699587, 1, 1, 1, 1, 1,
1.419101, 1.55463, -0.8055664, 1, 1, 1, 1, 1,
1.420741, -0.7405814, 3.843525, 1, 1, 1, 1, 1,
1.421654, 0.4051751, 0.8111069, 0, 0, 1, 1, 1,
1.432146, 1.99115, 0.7258825, 1, 0, 0, 1, 1,
1.452228, 0.597379, 1.209523, 1, 0, 0, 1, 1,
1.455515, -1.211331, 1.991723, 1, 0, 0, 1, 1,
1.455882, -1.541011, 0.02089524, 1, 0, 0, 1, 1,
1.465746, 2.23208, 0.8013266, 1, 0, 0, 1, 1,
1.466361, -0.5171731, 1.864131, 0, 0, 0, 1, 1,
1.470085, -1.00763, 3.664286, 0, 0, 0, 1, 1,
1.470109, -2.071826, 3.207516, 0, 0, 0, 1, 1,
1.471357, 0.3635036, 0.08667457, 0, 0, 0, 1, 1,
1.474299, -0.8038985, 1.007404, 0, 0, 0, 1, 1,
1.476292, -0.4523138, 1.289899, 0, 0, 0, 1, 1,
1.477851, 0.4186352, 2.773755, 0, 0, 0, 1, 1,
1.514308, 0.7963053, 1.575824, 1, 1, 1, 1, 1,
1.533446, 0.3417134, 2.217928, 1, 1, 1, 1, 1,
1.540726, -1.64091, 2.23624, 1, 1, 1, 1, 1,
1.544762, -0.3287238, 0.9804298, 1, 1, 1, 1, 1,
1.565852, -0.2387355, 3.290759, 1, 1, 1, 1, 1,
1.572392, -1.613776, 3.345286, 1, 1, 1, 1, 1,
1.572722, 0.369212, 0.8306797, 1, 1, 1, 1, 1,
1.573941, -0.4653569, 1.929298, 1, 1, 1, 1, 1,
1.57445, -1.370804, 1.117769, 1, 1, 1, 1, 1,
1.577444, -0.09284531, 1.811207, 1, 1, 1, 1, 1,
1.586811, -0.01158064, 2.211465, 1, 1, 1, 1, 1,
1.605453, -1.231109, 1.600505, 1, 1, 1, 1, 1,
1.626546, 2.461495, -0.5884797, 1, 1, 1, 1, 1,
1.635615, -0.5103031, 0.259763, 1, 1, 1, 1, 1,
1.64088, -0.005258125, 1.650925, 1, 1, 1, 1, 1,
1.641233, 0.3462629, 0.4798144, 0, 0, 1, 1, 1,
1.659802, 0.03080447, 1.788678, 1, 0, 0, 1, 1,
1.663714, -2.63598, 2.645526, 1, 0, 0, 1, 1,
1.66645, -0.7498703, 2.878569, 1, 0, 0, 1, 1,
1.672063, -0.4731203, 1.54613, 1, 0, 0, 1, 1,
1.680361, -1.200704, 1.368795, 1, 0, 0, 1, 1,
1.702252, -0.1877901, 0.2833934, 0, 0, 0, 1, 1,
1.717129, -1.493852, 2.103676, 0, 0, 0, 1, 1,
1.718123, -1.171477, 2.02195, 0, 0, 0, 1, 1,
1.720826, -0.9823731, 0.6728032, 0, 0, 0, 1, 1,
1.753474, -0.1114044, 1.17837, 0, 0, 0, 1, 1,
1.757702, 0.04193933, 1.687902, 0, 0, 0, 1, 1,
1.770109, -0.321117, 2.267903, 0, 0, 0, 1, 1,
1.787513, 1.49286, 1.35036, 1, 1, 1, 1, 1,
1.856336, -0.88851, 2.351515, 1, 1, 1, 1, 1,
1.869417, 0.5947632, 2.637776, 1, 1, 1, 1, 1,
1.877591, -2.44351, 1.630942, 1, 1, 1, 1, 1,
1.901095, 1.781901, 1.238429, 1, 1, 1, 1, 1,
1.919252, 2.356571, 0.5574853, 1, 1, 1, 1, 1,
1.962938, 1.24942, -0.1078672, 1, 1, 1, 1, 1,
1.969591, -0.1302972, 1.225245, 1, 1, 1, 1, 1,
1.977856, 0.4413638, 2.06366, 1, 1, 1, 1, 1,
1.988616, 0.1682568, 1.641831, 1, 1, 1, 1, 1,
2.041936, 0.1238255, 2.759734, 1, 1, 1, 1, 1,
2.076539, -0.6687511, 1.77184, 1, 1, 1, 1, 1,
2.099904, 1.000615, 1.000978, 1, 1, 1, 1, 1,
2.102018, 1.101986, 1.609667, 1, 1, 1, 1, 1,
2.122962, 0.2993267, 0.9888492, 1, 1, 1, 1, 1,
2.143586, -0.5491956, 2.832306, 0, 0, 1, 1, 1,
2.207524, -0.3129897, 1.807472, 1, 0, 0, 1, 1,
2.21082, -1.149391, 1.354075, 1, 0, 0, 1, 1,
2.23092, 0.1806582, 1.64228, 1, 0, 0, 1, 1,
2.264634, -0.1795882, 1.787131, 1, 0, 0, 1, 1,
2.301818, 1.90431, 0.2666985, 1, 0, 0, 1, 1,
2.330539, -0.6216412, -0.699319, 0, 0, 0, 1, 1,
2.376173, 1.096581, -0.6060184, 0, 0, 0, 1, 1,
2.376383, -0.6738629, 2.093651, 0, 0, 0, 1, 1,
2.377331, 0.4786158, 2.043905, 0, 0, 0, 1, 1,
2.409637, 0.2554923, 1.387079, 0, 0, 0, 1, 1,
2.409964, -2.113218, 1.829737, 0, 0, 0, 1, 1,
2.436958, -0.4815279, 1.744586, 0, 0, 0, 1, 1,
2.463007, 1.156749, 1.872176, 1, 1, 1, 1, 1,
2.698339, 0.8268843, -0.3265797, 1, 1, 1, 1, 1,
2.70378, -0.6621397, 2.569129, 1, 1, 1, 1, 1,
2.715232, 0.9855127, 0.2678247, 1, 1, 1, 1, 1,
2.848755, -0.3212453, 1.861522, 1, 1, 1, 1, 1,
2.925092, -1.176049, 1.624136, 1, 1, 1, 1, 1,
3.417888, -0.8600739, 2.140711, 1, 1, 1, 1, 1
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
var radius = 9.459029;
var distance = 33.22444;
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
mvMatrix.translate( 0.003222227, 0.1755687, -0.4788239 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.22444);
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
