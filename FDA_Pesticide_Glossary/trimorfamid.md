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
-3.607101, 0.4004445, -0.5181473, 1, 0, 0, 1,
-3.239104, -1.041853, -2.35232, 1, 0.007843138, 0, 1,
-3.16504, 2.121169, 0.01725537, 1, 0.01176471, 0, 1,
-2.994272, -0.8218434, -2.330148, 1, 0.01960784, 0, 1,
-2.760922, -0.126587, -1.135807, 1, 0.02352941, 0, 1,
-2.759159, -0.2938815, -0.7050425, 1, 0.03137255, 0, 1,
-2.742342, -0.3356858, 0.5581955, 1, 0.03529412, 0, 1,
-2.670139, 0.7361059, -1.201426, 1, 0.04313726, 0, 1,
-2.546501, -0.1967687, -2.276153, 1, 0.04705882, 0, 1,
-2.446608, 0.2065355, -1.431376, 1, 0.05490196, 0, 1,
-2.434184, 0.3357084, -4.103979, 1, 0.05882353, 0, 1,
-2.404119, -0.08803096, -0.3825287, 1, 0.06666667, 0, 1,
-2.39841, 0.1789851, -2.40187, 1, 0.07058824, 0, 1,
-2.372679, 0.09734194, -2.026454, 1, 0.07843138, 0, 1,
-2.356993, -0.539939, -2.127905, 1, 0.08235294, 0, 1,
-2.337079, 1.468719, -1.421988, 1, 0.09019608, 0, 1,
-2.205616, 0.01877959, -2.332321, 1, 0.09411765, 0, 1,
-2.202727, 0.7409924, -0.5992398, 1, 0.1019608, 0, 1,
-2.16021, -0.2536075, -1.231746, 1, 0.1098039, 0, 1,
-2.14412, -0.702933, -1.629861, 1, 0.1137255, 0, 1,
-2.082266, -0.8796983, -1.946316, 1, 0.1215686, 0, 1,
-2.05275, 0.5017088, -0.5106248, 1, 0.1254902, 0, 1,
-2.023508, -0.6709713, -2.069847, 1, 0.1333333, 0, 1,
-2.020735, -0.4585443, 0.8444811, 1, 0.1372549, 0, 1,
-2.007672, -0.01551451, -1.80461, 1, 0.145098, 0, 1,
-1.979951, 1.450943, -0.4836662, 1, 0.1490196, 0, 1,
-1.977872, 1.178373, -0.1243909, 1, 0.1568628, 0, 1,
-1.977726, -0.7039322, -4.725148, 1, 0.1607843, 0, 1,
-1.944611, 1.253145, -0.3491133, 1, 0.1686275, 0, 1,
-1.933079, -0.3957008, -0.8566923, 1, 0.172549, 0, 1,
-1.931882, -1.454049, -1.290918, 1, 0.1803922, 0, 1,
-1.916719, -1.129126, -1.086091, 1, 0.1843137, 0, 1,
-1.873049, -0.6260941, -2.451507, 1, 0.1921569, 0, 1,
-1.869928, -1.099924, -2.828383, 1, 0.1960784, 0, 1,
-1.83513, -0.8545975, -1.5956, 1, 0.2039216, 0, 1,
-1.807677, -2.047565, -3.744116, 1, 0.2117647, 0, 1,
-1.79619, -0.5512755, -2.054447, 1, 0.2156863, 0, 1,
-1.778533, -0.09391766, -1.987473, 1, 0.2235294, 0, 1,
-1.772939, -0.1317986, -1.869111, 1, 0.227451, 0, 1,
-1.772394, -0.9231945, -3.718469, 1, 0.2352941, 0, 1,
-1.7717, 0.7292255, -2.110236, 1, 0.2392157, 0, 1,
-1.760998, 0.8200088, -0.7044576, 1, 0.2470588, 0, 1,
-1.731, -1.68069, -1.228728, 1, 0.2509804, 0, 1,
-1.727102, 0.746265, -1.495019, 1, 0.2588235, 0, 1,
-1.724939, 2.230591, -0.08125436, 1, 0.2627451, 0, 1,
-1.718896, 0.5852094, -0.3951144, 1, 0.2705882, 0, 1,
-1.69509, -0.4809443, -2.290525, 1, 0.2745098, 0, 1,
-1.662785, 0.6060285, -1.668427, 1, 0.282353, 0, 1,
-1.657207, -0.2796827, 0.8587008, 1, 0.2862745, 0, 1,
-1.631661, -0.1635487, -2.095791, 1, 0.2941177, 0, 1,
-1.625484, 0.1099428, -1.235295, 1, 0.3019608, 0, 1,
-1.621569, 0.8903049, 0.3455699, 1, 0.3058824, 0, 1,
-1.614169, 0.7413461, -1.500539, 1, 0.3137255, 0, 1,
-1.611267, 0.4298308, 1.02849, 1, 0.3176471, 0, 1,
-1.604006, -1.219106, -0.787771, 1, 0.3254902, 0, 1,
-1.589521, 0.09120582, 0.8716173, 1, 0.3294118, 0, 1,
-1.572572, -2.04978, -1.624016, 1, 0.3372549, 0, 1,
-1.570601, -0.5758297, -2.004139, 1, 0.3411765, 0, 1,
-1.529073, -0.476055, -0.04740731, 1, 0.3490196, 0, 1,
-1.519074, -0.2737918, -2.946869, 1, 0.3529412, 0, 1,
-1.514264, 0.8451796, -0.5540534, 1, 0.3607843, 0, 1,
-1.513845, 0.4082833, 0.06655368, 1, 0.3647059, 0, 1,
-1.512283, 0.2910036, 0.1292353, 1, 0.372549, 0, 1,
-1.510831, -0.3646228, -1.366821, 1, 0.3764706, 0, 1,
-1.506551, 0.9957275, -0.2933571, 1, 0.3843137, 0, 1,
-1.505949, 0.2119558, -2.698327, 1, 0.3882353, 0, 1,
-1.505622, -0.2508897, -0.5793704, 1, 0.3960784, 0, 1,
-1.491321, -0.2292042, -2.416615, 1, 0.4039216, 0, 1,
-1.487382, 0.7574113, -1.2212, 1, 0.4078431, 0, 1,
-1.484533, -0.8118439, -0.5447063, 1, 0.4156863, 0, 1,
-1.479237, -1.044571, -1.822931, 1, 0.4196078, 0, 1,
-1.47886, 1.232071, 0.8968221, 1, 0.427451, 0, 1,
-1.470007, 2.500668, -1.490259, 1, 0.4313726, 0, 1,
-1.463053, -1.211176, -1.953879, 1, 0.4392157, 0, 1,
-1.452856, -1.281715, -2.35147, 1, 0.4431373, 0, 1,
-1.449932, 0.8888711, -1.407396, 1, 0.4509804, 0, 1,
-1.431996, -1.006525, -0.8417332, 1, 0.454902, 0, 1,
-1.420324, -0.6537107, -2.15484, 1, 0.4627451, 0, 1,
-1.411019, -1.358579, -3.724181, 1, 0.4666667, 0, 1,
-1.403126, 0.8450734, -0.4908173, 1, 0.4745098, 0, 1,
-1.391529, -1.486327, -2.515174, 1, 0.4784314, 0, 1,
-1.378316, -1.396638, -3.264567, 1, 0.4862745, 0, 1,
-1.377821, 0.4174485, -2.006726, 1, 0.4901961, 0, 1,
-1.373685, 1.058381, -3.089361, 1, 0.4980392, 0, 1,
-1.362216, -0.8886142, -1.827089, 1, 0.5058824, 0, 1,
-1.351171, -1.286786, -3.604072, 1, 0.509804, 0, 1,
-1.338782, 0.6807929, -0.6582974, 1, 0.5176471, 0, 1,
-1.336178, 0.9668587, 0.535418, 1, 0.5215687, 0, 1,
-1.319736, 0.01373987, -1.231007, 1, 0.5294118, 0, 1,
-1.315914, -0.1075138, -0.8681952, 1, 0.5333334, 0, 1,
-1.313792, 1.509928, -0.5317653, 1, 0.5411765, 0, 1,
-1.311726, -0.50087, -2.504868, 1, 0.5450981, 0, 1,
-1.311489, -0.5763978, -1.092864, 1, 0.5529412, 0, 1,
-1.310387, -2.744482, -2.691828, 1, 0.5568628, 0, 1,
-1.307348, -1.423583, -2.520374, 1, 0.5647059, 0, 1,
-1.301122, 1.098981, -1.939909, 1, 0.5686275, 0, 1,
-1.300209, -0.7258725, 1.312111, 1, 0.5764706, 0, 1,
-1.297654, -0.9555808, -4.122838, 1, 0.5803922, 0, 1,
-1.292218, -1.342408, -1.171046, 1, 0.5882353, 0, 1,
-1.287546, -0.6614074, -3.679632, 1, 0.5921569, 0, 1,
-1.283804, -1.186651, -4.050882, 1, 0.6, 0, 1,
-1.27924, 0.6252671, -0.8464256, 1, 0.6078432, 0, 1,
-1.278835, -2.741475, -2.531729, 1, 0.6117647, 0, 1,
-1.275436, 1.009901, -0.02101017, 1, 0.6196079, 0, 1,
-1.263864, 2.006077, -1.658571, 1, 0.6235294, 0, 1,
-1.258539, -2.069862, -1.541964, 1, 0.6313726, 0, 1,
-1.256155, -1.777478, -2.494548, 1, 0.6352941, 0, 1,
-1.253262, -0.05441336, -1.552901, 1, 0.6431373, 0, 1,
-1.249346, -1.551568, -2.744325, 1, 0.6470588, 0, 1,
-1.24864, 1.109229, -1.846203, 1, 0.654902, 0, 1,
-1.23205, 0.1967433, -2.726003, 1, 0.6588235, 0, 1,
-1.229848, -0.312833, -1.603919, 1, 0.6666667, 0, 1,
-1.228581, 0.04311918, -3.212723, 1, 0.6705883, 0, 1,
-1.220466, 0.2603877, -1.170939, 1, 0.6784314, 0, 1,
-1.217686, -1.36782, -1.918296, 1, 0.682353, 0, 1,
-1.21701, 0.6083234, -2.024055, 1, 0.6901961, 0, 1,
-1.208839, 0.6106831, -1.327783, 1, 0.6941177, 0, 1,
-1.206833, 1.511561, -0.8326554, 1, 0.7019608, 0, 1,
-1.206185, 1.305467, -0.461804, 1, 0.7098039, 0, 1,
-1.199647, 1.024769, -1.650402, 1, 0.7137255, 0, 1,
-1.196668, 0.7627708, -0.9938244, 1, 0.7215686, 0, 1,
-1.195688, -0.5514548, -2.597376, 1, 0.7254902, 0, 1,
-1.184733, -1.023196, -1.924685, 1, 0.7333333, 0, 1,
-1.183107, -2.761702, -2.058594, 1, 0.7372549, 0, 1,
-1.168525, 0.2130942, -1.166454, 1, 0.7450981, 0, 1,
-1.167247, 1.454176, -1.526866, 1, 0.7490196, 0, 1,
-1.161124, -2.20903, -1.16398, 1, 0.7568628, 0, 1,
-1.160661, -0.7499384, -1.260234, 1, 0.7607843, 0, 1,
-1.1462, 0.00649202, -0.5534098, 1, 0.7686275, 0, 1,
-1.141444, -0.7035436, -0.6416944, 1, 0.772549, 0, 1,
-1.141439, -0.1383201, -0.5097777, 1, 0.7803922, 0, 1,
-1.136262, 0.4201846, -3.074721, 1, 0.7843137, 0, 1,
-1.127721, 0.1505113, -1.033478, 1, 0.7921569, 0, 1,
-1.114551, -0.1700538, -1.710923, 1, 0.7960784, 0, 1,
-1.114114, -0.7177683, -1.165059, 1, 0.8039216, 0, 1,
-1.102937, -2.34217, -2.545392, 1, 0.8117647, 0, 1,
-1.099574, -0.7922834, -4.430546, 1, 0.8156863, 0, 1,
-1.086393, 0.4738448, -2.289562, 1, 0.8235294, 0, 1,
-1.073797, 0.5221455, -0.837078, 1, 0.827451, 0, 1,
-1.070661, 0.03021081, -0.1483237, 1, 0.8352941, 0, 1,
-1.067132, 0.4104489, -1.533913, 1, 0.8392157, 0, 1,
-1.063688, 2.081052, -0.347306, 1, 0.8470588, 0, 1,
-1.057528, 1.048218, -1.877677, 1, 0.8509804, 0, 1,
-1.057276, 0.8137558, -2.331928, 1, 0.8588235, 0, 1,
-1.053328, 1.117679, -2.102565, 1, 0.8627451, 0, 1,
-1.050072, -2.670879, -2.577334, 1, 0.8705882, 0, 1,
-1.041267, -0.5759349, -3.915748, 1, 0.8745098, 0, 1,
-1.036419, -0.463476, -1.664423, 1, 0.8823529, 0, 1,
-1.024302, -0.6553825, -1.955813, 1, 0.8862745, 0, 1,
-1.022709, 0.3663602, -2.499739, 1, 0.8941177, 0, 1,
-1.022081, 0.2849539, -0.8562466, 1, 0.8980392, 0, 1,
-1.020665, -1.694511, -2.667559, 1, 0.9058824, 0, 1,
-1.011189, 0.2710132, -0.7006972, 1, 0.9137255, 0, 1,
-1.008708, 0.9680383, 0.2926424, 1, 0.9176471, 0, 1,
-1.008257, -1.169677, -2.474935, 1, 0.9254902, 0, 1,
-0.993166, 0.1360077, -2.455853, 1, 0.9294118, 0, 1,
-0.9930569, -0.3424705, -1.849899, 1, 0.9372549, 0, 1,
-0.992525, -0.9974522, -2.748114, 1, 0.9411765, 0, 1,
-0.9914536, -0.05010096, -0.7906729, 1, 0.9490196, 0, 1,
-0.9883692, 0.1774538, -1.606185, 1, 0.9529412, 0, 1,
-0.9875026, -0.1489656, -3.195096, 1, 0.9607843, 0, 1,
-0.9872695, 1.017896, -0.4625421, 1, 0.9647059, 0, 1,
-0.9869785, 1.829163, -2.055137, 1, 0.972549, 0, 1,
-0.9800493, -0.8265728, -1.210882, 1, 0.9764706, 0, 1,
-0.9720559, 1.014168, 0.7241098, 1, 0.9843137, 0, 1,
-0.9670692, -3.457981, -2.954435, 1, 0.9882353, 0, 1,
-0.9647781, 0.001059154, -0.5303074, 1, 0.9960784, 0, 1,
-0.9581642, -1.255409, -1.906265, 0.9960784, 1, 0, 1,
-0.9566613, -0.8778105, -1.593449, 0.9921569, 1, 0, 1,
-0.9566577, -0.6665928, -1.645961, 0.9843137, 1, 0, 1,
-0.9528655, 2.149907, -0.1803759, 0.9803922, 1, 0, 1,
-0.9526564, 2.090018, -0.2047717, 0.972549, 1, 0, 1,
-0.9505285, -0.6833283, -1.74787, 0.9686275, 1, 0, 1,
-0.9440298, -0.1770139, -2.651917, 0.9607843, 1, 0, 1,
-0.9410163, -0.9979085, -1.570966, 0.9568627, 1, 0, 1,
-0.9402824, 0.7917059, -0.761747, 0.9490196, 1, 0, 1,
-0.9399212, 0.8368465, -1.464855, 0.945098, 1, 0, 1,
-0.9289539, 0.1993882, -1.505575, 0.9372549, 1, 0, 1,
-0.9265866, 0.7109683, 0.05401639, 0.9333333, 1, 0, 1,
-0.9189324, 0.9773988, -2.470812, 0.9254902, 1, 0, 1,
-0.916792, -0.1388892, -1.279349, 0.9215686, 1, 0, 1,
-0.9158239, 1.186795, -1.232484, 0.9137255, 1, 0, 1,
-0.9120229, -1.323561, -2.660075, 0.9098039, 1, 0, 1,
-0.911018, 0.4794835, 1.600205, 0.9019608, 1, 0, 1,
-0.9100378, 1.407253, 0.2694657, 0.8941177, 1, 0, 1,
-0.9073566, 0.8839803, -0.8066639, 0.8901961, 1, 0, 1,
-0.9015027, -2.825092, -3.468362, 0.8823529, 1, 0, 1,
-0.9014288, -0.7469289, -2.002626, 0.8784314, 1, 0, 1,
-0.9004326, 0.4989691, -1.732255, 0.8705882, 1, 0, 1,
-0.8928101, 0.3405776, -0.8675624, 0.8666667, 1, 0, 1,
-0.8890877, -0.1358896, -2.293385, 0.8588235, 1, 0, 1,
-0.8858575, -1.324728, -1.795317, 0.854902, 1, 0, 1,
-0.8839316, -0.2443522, -0.6681887, 0.8470588, 1, 0, 1,
-0.8802297, -0.243105, -1.940184, 0.8431373, 1, 0, 1,
-0.8772634, -0.5588747, -2.986053, 0.8352941, 1, 0, 1,
-0.8716675, 0.063316, -2.223112, 0.8313726, 1, 0, 1,
-0.8679541, 1.933419, -2.590906, 0.8235294, 1, 0, 1,
-0.8628027, -0.5690241, -2.285349, 0.8196079, 1, 0, 1,
-0.8619216, 0.2483781, -0.7820512, 0.8117647, 1, 0, 1,
-0.8596151, -0.578697, -2.78373, 0.8078431, 1, 0, 1,
-0.8591517, 1.77332, -0.9653968, 0.8, 1, 0, 1,
-0.8583199, 1.261326, -0.3237194, 0.7921569, 1, 0, 1,
-0.8557703, -1.342038, -2.799115, 0.7882353, 1, 0, 1,
-0.8555695, 0.6167487, -0.2052489, 0.7803922, 1, 0, 1,
-0.8527519, 2.100612, 0.6002407, 0.7764706, 1, 0, 1,
-0.8500019, -0.5084155, -0.821725, 0.7686275, 1, 0, 1,
-0.8498866, -0.8473826, -3.616025, 0.7647059, 1, 0, 1,
-0.8492263, -0.4526978, -2.158315, 0.7568628, 1, 0, 1,
-0.843331, 0.1333472, -0.9955632, 0.7529412, 1, 0, 1,
-0.8339601, -1.249, -2.617928, 0.7450981, 1, 0, 1,
-0.8285245, -0.1745207, -0.5521948, 0.7411765, 1, 0, 1,
-0.8280813, 0.4621951, -0.5376432, 0.7333333, 1, 0, 1,
-0.8255318, 0.5623163, -1.827484, 0.7294118, 1, 0, 1,
-0.8205722, -0.5633711, -1.533773, 0.7215686, 1, 0, 1,
-0.8104562, -0.3187935, -2.377001, 0.7176471, 1, 0, 1,
-0.8035038, 0.6473906, -0.8297436, 0.7098039, 1, 0, 1,
-0.803367, -1.153332, -2.455487, 0.7058824, 1, 0, 1,
-0.8001658, -0.1798442, -1.397246, 0.6980392, 1, 0, 1,
-0.7982954, -0.3281299, -1.363208, 0.6901961, 1, 0, 1,
-0.7948695, -1.268359, -1.492581, 0.6862745, 1, 0, 1,
-0.7939273, -0.6096302, -1.496343, 0.6784314, 1, 0, 1,
-0.7865397, 0.4332579, -2.154759, 0.6745098, 1, 0, 1,
-0.7863435, 0.2013228, -1.650932, 0.6666667, 1, 0, 1,
-0.7853962, 1.315108, -0.6801695, 0.6627451, 1, 0, 1,
-0.7639248, -0.2164645, -2.516063, 0.654902, 1, 0, 1,
-0.7598606, 0.6663722, 0.4816815, 0.6509804, 1, 0, 1,
-0.758968, -0.5891228, -1.479987, 0.6431373, 1, 0, 1,
-0.7554594, -0.6830195, -2.58999, 0.6392157, 1, 0, 1,
-0.7502142, 1.098088, -1.229274, 0.6313726, 1, 0, 1,
-0.7449785, 1.041762, -0.09609657, 0.627451, 1, 0, 1,
-0.743156, -0.533879, -1.851514, 0.6196079, 1, 0, 1,
-0.7424327, -1.026798, -1.89035, 0.6156863, 1, 0, 1,
-0.7398895, -0.8696117, -1.349924, 0.6078432, 1, 0, 1,
-0.7394246, 1.068248, -0.3645768, 0.6039216, 1, 0, 1,
-0.7375122, -0.5017434, -3.107842, 0.5960785, 1, 0, 1,
-0.7374355, 0.7889096, -0.295599, 0.5882353, 1, 0, 1,
-0.7305757, 0.601976, -2.248807, 0.5843138, 1, 0, 1,
-0.7245689, -0.161907, -1.62604, 0.5764706, 1, 0, 1,
-0.7227282, -0.9415228, -2.711533, 0.572549, 1, 0, 1,
-0.7209066, -0.6408148, -4.836708, 0.5647059, 1, 0, 1,
-0.7169387, -0.1901856, -2.2828, 0.5607843, 1, 0, 1,
-0.7167624, -2.23579, -2.81498, 0.5529412, 1, 0, 1,
-0.716268, 0.6048481, -1.613436, 0.5490196, 1, 0, 1,
-0.7157249, -0.389298, -0.01541475, 0.5411765, 1, 0, 1,
-0.7155516, 1.348071, 0.3146406, 0.5372549, 1, 0, 1,
-0.7136813, -0.8326378, -3.510942, 0.5294118, 1, 0, 1,
-0.7126162, 0.5730262, -0.7863852, 0.5254902, 1, 0, 1,
-0.711679, -0.2163862, -1.535365, 0.5176471, 1, 0, 1,
-0.7116576, -0.580521, -3.582098, 0.5137255, 1, 0, 1,
-0.7052178, 1.230834, -1.025159, 0.5058824, 1, 0, 1,
-0.6976077, 0.549615, -1.233171, 0.5019608, 1, 0, 1,
-0.6959543, 2.048709, -1.689101, 0.4941176, 1, 0, 1,
-0.6948795, 0.9472412, -0.7820677, 0.4862745, 1, 0, 1,
-0.6885408, 0.1164138, -1.526704, 0.4823529, 1, 0, 1,
-0.6818649, -0.2138542, -0.9140118, 0.4745098, 1, 0, 1,
-0.6816405, 0.6125033, -1.383058, 0.4705882, 1, 0, 1,
-0.6808382, 1.931783, 0.02787812, 0.4627451, 1, 0, 1,
-0.671166, 1.167912, -1.469348, 0.4588235, 1, 0, 1,
-0.6689556, -2.313539, -2.169676, 0.4509804, 1, 0, 1,
-0.6680611, 0.09088872, -1.588292, 0.4470588, 1, 0, 1,
-0.6620381, -0.0009908207, -2.970561, 0.4392157, 1, 0, 1,
-0.6611781, 0.8076891, -0.5240669, 0.4352941, 1, 0, 1,
-0.6610218, -0.4986413, -1.713761, 0.427451, 1, 0, 1,
-0.6589952, 0.8451994, -0.3523928, 0.4235294, 1, 0, 1,
-0.651424, -1.683542, -3.65, 0.4156863, 1, 0, 1,
-0.6411072, -1.267821, -2.773763, 0.4117647, 1, 0, 1,
-0.6354931, -0.4446853, -3.142893, 0.4039216, 1, 0, 1,
-0.6341907, -1.7164, -3.504884, 0.3960784, 1, 0, 1,
-0.6337139, 1.462374, -2.633609, 0.3921569, 1, 0, 1,
-0.6240308, 1.199236, -0.7059053, 0.3843137, 1, 0, 1,
-0.6205755, 1.078456, 0.2342847, 0.3803922, 1, 0, 1,
-0.619056, 0.9599294, -3.509079, 0.372549, 1, 0, 1,
-0.6103964, 2.014123, -0.5704923, 0.3686275, 1, 0, 1,
-0.610208, 0.3130394, -0.8186055, 0.3607843, 1, 0, 1,
-0.6088391, -0.1645987, -2.754353, 0.3568628, 1, 0, 1,
-0.601499, -0.3411784, -2.092884, 0.3490196, 1, 0, 1,
-0.5977683, -1.130879, -4.147726, 0.345098, 1, 0, 1,
-0.5938575, 0.2756283, 1.872385, 0.3372549, 1, 0, 1,
-0.5932875, -0.745025, -3.078357, 0.3333333, 1, 0, 1,
-0.5923491, 0.8664423, -1.534009, 0.3254902, 1, 0, 1,
-0.5917711, -1.500457, -2.810049, 0.3215686, 1, 0, 1,
-0.5874476, -0.9420583, -2.890004, 0.3137255, 1, 0, 1,
-0.5872669, 0.0286564, -1.160437, 0.3098039, 1, 0, 1,
-0.5862589, 1.12817, -1.540587, 0.3019608, 1, 0, 1,
-0.5841165, -2.400593, -2.832019, 0.2941177, 1, 0, 1,
-0.5805714, -0.06837054, -0.05247817, 0.2901961, 1, 0, 1,
-0.5796236, -0.1995919, -2.885982, 0.282353, 1, 0, 1,
-0.576277, 0.4554724, 0.217323, 0.2784314, 1, 0, 1,
-0.5726674, -0.767022, -2.19118, 0.2705882, 1, 0, 1,
-0.572554, -0.8874741, -1.790409, 0.2666667, 1, 0, 1,
-0.5725295, 0.05135145, -0.4897021, 0.2588235, 1, 0, 1,
-0.5686149, -1.472378, -2.889307, 0.254902, 1, 0, 1,
-0.5657068, 0.663687, 0.328431, 0.2470588, 1, 0, 1,
-0.5642266, 0.1117289, 0.1285335, 0.2431373, 1, 0, 1,
-0.5616204, -0.1726138, 0.865315, 0.2352941, 1, 0, 1,
-0.5609635, 0.3121022, -1.065438, 0.2313726, 1, 0, 1,
-0.5602171, -1.516193, -2.330184, 0.2235294, 1, 0, 1,
-0.5520971, -0.6604638, -4.089957, 0.2196078, 1, 0, 1,
-0.5517902, 0.2735974, -1.772143, 0.2117647, 1, 0, 1,
-0.5504636, 1.031894, -0.3377931, 0.2078431, 1, 0, 1,
-0.5490014, -1.370178, -2.806451, 0.2, 1, 0, 1,
-0.5473471, -0.5197923, -1.660663, 0.1921569, 1, 0, 1,
-0.5455292, 1.866847, -1.594185, 0.1882353, 1, 0, 1,
-0.5372975, -2.756753, -2.714152, 0.1803922, 1, 0, 1,
-0.5343202, -1.098471, -1.924108, 0.1764706, 1, 0, 1,
-0.5327107, -0.08958108, -1.45163, 0.1686275, 1, 0, 1,
-0.5325959, -0.07885924, -1.42873, 0.1647059, 1, 0, 1,
-0.5310665, -1.140788, -2.483064, 0.1568628, 1, 0, 1,
-0.5294785, -0.7731749, -2.662654, 0.1529412, 1, 0, 1,
-0.5214108, -1.531612, -3.815091, 0.145098, 1, 0, 1,
-0.5164912, 1.242924, -2.506985, 0.1411765, 1, 0, 1,
-0.5162375, -0.274613, -0.9257488, 0.1333333, 1, 0, 1,
-0.5161173, 2.091303, -0.2558207, 0.1294118, 1, 0, 1,
-0.5127457, 0.6302449, -1.036519, 0.1215686, 1, 0, 1,
-0.5093699, 0.06363524, -2.919841, 0.1176471, 1, 0, 1,
-0.5089332, 0.8259453, 0.2296394, 0.1098039, 1, 0, 1,
-0.5088177, -1.0893, -2.973313, 0.1058824, 1, 0, 1,
-0.5063401, -1.631689, -2.481593, 0.09803922, 1, 0, 1,
-0.5021203, 0.3076439, -1.129701, 0.09019608, 1, 0, 1,
-0.5004636, -0.845888, -1.583761, 0.08627451, 1, 0, 1,
-0.4975125, -0.4805546, -3.519844, 0.07843138, 1, 0, 1,
-0.4952075, -0.1291524, -1.498374, 0.07450981, 1, 0, 1,
-0.4884514, 0.03632063, -2.024356, 0.06666667, 1, 0, 1,
-0.4873173, 1.253746, 0.7960294, 0.0627451, 1, 0, 1,
-0.4834486, -0.9518731, -1.687891, 0.05490196, 1, 0, 1,
-0.4791583, 0.9133209, 1.648095, 0.05098039, 1, 0, 1,
-0.4791301, 1.572357, 0.1843411, 0.04313726, 1, 0, 1,
-0.4782521, -0.08888604, -1.552739, 0.03921569, 1, 0, 1,
-0.4736238, 0.3612466, -0.2273419, 0.03137255, 1, 0, 1,
-0.4723406, -1.524213, -3.608103, 0.02745098, 1, 0, 1,
-0.4715133, -1.110815, -2.073159, 0.01960784, 1, 0, 1,
-0.4661186, 1.769055, -0.5139568, 0.01568628, 1, 0, 1,
-0.4622409, 0.5371584, -0.4721698, 0.007843138, 1, 0, 1,
-0.4592505, -0.6994223, -4.199813, 0.003921569, 1, 0, 1,
-0.4538597, -0.4195496, -2.059325, 0, 1, 0.003921569, 1,
-0.4506185, -0.5608171, -0.3842771, 0, 1, 0.01176471, 1,
-0.4497094, -0.02551345, -0.1747923, 0, 1, 0.01568628, 1,
-0.4471372, -1.116177, -4.422771, 0, 1, 0.02352941, 1,
-0.4419864, -0.500001, -3.004285, 0, 1, 0.02745098, 1,
-0.4382837, -1.059622, -5.046675, 0, 1, 0.03529412, 1,
-0.4381508, 0.2643026, -1.399274, 0, 1, 0.03921569, 1,
-0.4377275, -0.1671806, -2.072437, 0, 1, 0.04705882, 1,
-0.4296857, 0.1338389, -3.030349, 0, 1, 0.05098039, 1,
-0.424085, 1.974705, -1.187952, 0, 1, 0.05882353, 1,
-0.4226457, 0.8268643, 0.0209423, 0, 1, 0.0627451, 1,
-0.4223919, -1.443092, -3.530801, 0, 1, 0.07058824, 1,
-0.4194089, 0.1717807, -0.5820209, 0, 1, 0.07450981, 1,
-0.4110439, -0.5307287, -4.46564, 0, 1, 0.08235294, 1,
-0.4104965, 1.142905, -0.5223572, 0, 1, 0.08627451, 1,
-0.4092396, -0.007170742, -2.487393, 0, 1, 0.09411765, 1,
-0.4052229, -0.1935173, -2.16999, 0, 1, 0.1019608, 1,
-0.4000358, -0.2493233, -2.263508, 0, 1, 0.1058824, 1,
-0.3987494, 0.1125276, -1.412234, 0, 1, 0.1137255, 1,
-0.3942462, -1.234229, -3.096171, 0, 1, 0.1176471, 1,
-0.3903508, 0.082619, 1.295957, 0, 1, 0.1254902, 1,
-0.3891639, -0.1535108, -3.883181, 0, 1, 0.1294118, 1,
-0.3862213, 0.8419894, -0.3746681, 0, 1, 0.1372549, 1,
-0.3856428, -0.3623387, -0.8288658, 0, 1, 0.1411765, 1,
-0.3826732, 0.2212512, 0.7022828, 0, 1, 0.1490196, 1,
-0.3823766, -2.251963, -3.445086, 0, 1, 0.1529412, 1,
-0.3779522, -0.04843898, -1.982697, 0, 1, 0.1607843, 1,
-0.3760947, -0.8746125, -1.815056, 0, 1, 0.1647059, 1,
-0.3735328, -2.23619, -0.6057206, 0, 1, 0.172549, 1,
-0.3724742, -1.27578, -2.961688, 0, 1, 0.1764706, 1,
-0.371413, -1.261886, -4.786808, 0, 1, 0.1843137, 1,
-0.3709352, -0.1360087, -1.746271, 0, 1, 0.1882353, 1,
-0.3675087, 0.3295541, -1.515972, 0, 1, 0.1960784, 1,
-0.3657469, 1.062704, -0.9258795, 0, 1, 0.2039216, 1,
-0.3581543, -0.7297514, -1.637398, 0, 1, 0.2078431, 1,
-0.3579093, -0.007468976, -1.101152, 0, 1, 0.2156863, 1,
-0.3528019, -2.252361, -2.745058, 0, 1, 0.2196078, 1,
-0.3509577, -0.7727363, -2.779719, 0, 1, 0.227451, 1,
-0.3485326, -1.365797, -1.959778, 0, 1, 0.2313726, 1,
-0.3457582, 0.315122, 0.1228685, 0, 1, 0.2392157, 1,
-0.3455974, -0.8761057, -4.341483, 0, 1, 0.2431373, 1,
-0.3417866, 0.7222182, -0.8139979, 0, 1, 0.2509804, 1,
-0.3395283, 0.5877126, 1.427832, 0, 1, 0.254902, 1,
-0.3355339, -1.367986, -3.662596, 0, 1, 0.2627451, 1,
-0.3343477, 0.2011895, -0.9391147, 0, 1, 0.2666667, 1,
-0.3312366, -1.850901, -4.526112, 0, 1, 0.2745098, 1,
-0.329257, -0.2321538, -2.413102, 0, 1, 0.2784314, 1,
-0.3290585, 0.1035162, -2.687478, 0, 1, 0.2862745, 1,
-0.3267239, 0.4537234, -0.4199613, 0, 1, 0.2901961, 1,
-0.3247518, -0.2039487, -2.407695, 0, 1, 0.2980392, 1,
-0.3212883, -0.4519765, -4.60137, 0, 1, 0.3058824, 1,
-0.3201149, 1.696821, -0.2631409, 0, 1, 0.3098039, 1,
-0.3169534, 1.211915, -0.4427761, 0, 1, 0.3176471, 1,
-0.3162017, -1.211134, -1.814777, 0, 1, 0.3215686, 1,
-0.3105293, -0.09216799, -1.40115, 0, 1, 0.3294118, 1,
-0.3048927, -2.014561, -2.138918, 0, 1, 0.3333333, 1,
-0.3005708, -0.424422, -1.673843, 0, 1, 0.3411765, 1,
-0.2974188, 1.05445, -0.9572041, 0, 1, 0.345098, 1,
-0.2941061, 0.363519, -1.332345, 0, 1, 0.3529412, 1,
-0.2926607, -0.71955, -1.937408, 0, 1, 0.3568628, 1,
-0.2912171, -0.009170725, -3.148073, 0, 1, 0.3647059, 1,
-0.2873359, 0.3219793, -1.964666, 0, 1, 0.3686275, 1,
-0.2838922, 0.1550886, -0.4120897, 0, 1, 0.3764706, 1,
-0.2801175, -0.9434032, -0.6242113, 0, 1, 0.3803922, 1,
-0.2786943, 0.4641197, -0.7326697, 0, 1, 0.3882353, 1,
-0.2746564, -1.753195, -4.767177, 0, 1, 0.3921569, 1,
-0.2687666, -1.903514, -4.895948, 0, 1, 0.4, 1,
-0.2686634, 0.5528104, -0.8975596, 0, 1, 0.4078431, 1,
-0.2678178, -2.377752, -2.933462, 0, 1, 0.4117647, 1,
-0.2666584, -0.09164988, -2.046474, 0, 1, 0.4196078, 1,
-0.2653414, 1.748211, 0.5214412, 0, 1, 0.4235294, 1,
-0.2635851, 0.6547135, -0.1787864, 0, 1, 0.4313726, 1,
-0.2630095, -1.020907, -3.599494, 0, 1, 0.4352941, 1,
-0.2628385, 1.239266, -0.6423986, 0, 1, 0.4431373, 1,
-0.2610415, -0.5967815, -2.787908, 0, 1, 0.4470588, 1,
-0.2610212, -0.7676478, -2.793458, 0, 1, 0.454902, 1,
-0.2607575, -0.2796825, -1.931572, 0, 1, 0.4588235, 1,
-0.2554738, 0.3235227, 0.3027204, 0, 1, 0.4666667, 1,
-0.2546782, -1.543994, -3.067688, 0, 1, 0.4705882, 1,
-0.2530363, 0.3548957, -1.989681, 0, 1, 0.4784314, 1,
-0.2527975, 0.7750391, -0.8642277, 0, 1, 0.4823529, 1,
-0.2527807, -1.072463, -3.726742, 0, 1, 0.4901961, 1,
-0.2519947, 1.258897, 0.08523417, 0, 1, 0.4941176, 1,
-0.2495977, 2.106971, -0.3619339, 0, 1, 0.5019608, 1,
-0.243227, -0.3148408, -0.3693548, 0, 1, 0.509804, 1,
-0.2376015, 0.6186712, -0.077605, 0, 1, 0.5137255, 1,
-0.2367199, -1.654418, -1.601271, 0, 1, 0.5215687, 1,
-0.2356136, -0.1497375, -1.724886, 0, 1, 0.5254902, 1,
-0.2351991, 0.2436672, -2.265712, 0, 1, 0.5333334, 1,
-0.2318466, -0.2294651, -0.2222972, 0, 1, 0.5372549, 1,
-0.2312109, -0.09915187, -2.194222, 0, 1, 0.5450981, 1,
-0.2257842, 1.220639, -0.02905856, 0, 1, 0.5490196, 1,
-0.2255024, 1.84544, 0.9598166, 0, 1, 0.5568628, 1,
-0.2245566, -0.2093108, -2.20794, 0, 1, 0.5607843, 1,
-0.2127058, -0.4027055, -2.380108, 0, 1, 0.5686275, 1,
-0.2108074, -0.09546533, -2.135905, 0, 1, 0.572549, 1,
-0.2095782, 0.2803611, -0.4083741, 0, 1, 0.5803922, 1,
-0.2081141, 1.179282, 0.3483325, 0, 1, 0.5843138, 1,
-0.204069, 0.06588014, -1.196758, 0, 1, 0.5921569, 1,
-0.2024109, -1.429549, -2.237769, 0, 1, 0.5960785, 1,
-0.2017477, 0.8468571, 1.594198, 0, 1, 0.6039216, 1,
-0.1955804, 0.08734273, -3.527625, 0, 1, 0.6117647, 1,
-0.1930016, -0.4242061, -2.565734, 0, 1, 0.6156863, 1,
-0.1918922, 0.5243031, 0.163463, 0, 1, 0.6235294, 1,
-0.1816395, -1.294331, -2.585175, 0, 1, 0.627451, 1,
-0.1800776, 0.07939893, -1.823953, 0, 1, 0.6352941, 1,
-0.1790219, 0.8591453, -0.5485089, 0, 1, 0.6392157, 1,
-0.178437, 0.07042585, -1.581686, 0, 1, 0.6470588, 1,
-0.1784249, -0.8972075, -5.856152, 0, 1, 0.6509804, 1,
-0.174929, 1.112312, 0.9049823, 0, 1, 0.6588235, 1,
-0.1662468, 0.8372788, -0.423564, 0, 1, 0.6627451, 1,
-0.1641489, -1.183887, -3.533227, 0, 1, 0.6705883, 1,
-0.1612061, 0.813561, -0.6782694, 0, 1, 0.6745098, 1,
-0.1607022, -0.4888233, -1.15308, 0, 1, 0.682353, 1,
-0.1590421, 0.5638658, 0.1957758, 0, 1, 0.6862745, 1,
-0.1581388, -0.564221, -2.401599, 0, 1, 0.6941177, 1,
-0.153129, -1.597545, -2.832572, 0, 1, 0.7019608, 1,
-0.1504315, -0.7291509, -0.4097362, 0, 1, 0.7058824, 1,
-0.149705, 0.4827603, -1.592751, 0, 1, 0.7137255, 1,
-0.1478399, -1.109194, -1.795693, 0, 1, 0.7176471, 1,
-0.1455874, -1.450431, -4.453493, 0, 1, 0.7254902, 1,
-0.1450821, 2.92043, -1.826088, 0, 1, 0.7294118, 1,
-0.1440179, -1.412634, -2.989543, 0, 1, 0.7372549, 1,
-0.1407023, 0.1373258, -1.007007, 0, 1, 0.7411765, 1,
-0.1405741, 0.9501077, 0.45487, 0, 1, 0.7490196, 1,
-0.1368333, 0.2568505, -0.1595074, 0, 1, 0.7529412, 1,
-0.1311588, -0.2229663, -2.267855, 0, 1, 0.7607843, 1,
-0.1307016, -1.639447, -4.876791, 0, 1, 0.7647059, 1,
-0.1240179, -0.9275576, -3.539117, 0, 1, 0.772549, 1,
-0.1203021, -1.601731, -2.529904, 0, 1, 0.7764706, 1,
-0.1119816, 1.258364, 0.9787453, 0, 1, 0.7843137, 1,
-0.1088359, 0.6309729, 0.2436555, 0, 1, 0.7882353, 1,
-0.1031782, -0.8506462, -2.908594, 0, 1, 0.7960784, 1,
-0.09666038, 1.922784, 1.651446, 0, 1, 0.8039216, 1,
-0.0943728, -0.3200269, -1.433059, 0, 1, 0.8078431, 1,
-0.09026364, -1.884661, -3.796358, 0, 1, 0.8156863, 1,
-0.08879042, 0.6018804, -1.347301, 0, 1, 0.8196079, 1,
-0.08708474, -0.729531, -3.018543, 0, 1, 0.827451, 1,
-0.0865823, -0.6392844, -3.547416, 0, 1, 0.8313726, 1,
-0.08307689, 1.391299, -1.38882, 0, 1, 0.8392157, 1,
-0.08253829, -1.176584, -3.772655, 0, 1, 0.8431373, 1,
-0.08220543, -1.323317, -2.638916, 0, 1, 0.8509804, 1,
-0.08109774, -1.850219, -1.405154, 0, 1, 0.854902, 1,
-0.07806422, -1.071027, -2.814879, 0, 1, 0.8627451, 1,
-0.07762106, 0.551676, -1.015544, 0, 1, 0.8666667, 1,
-0.0738403, 0.1890441, -0.3268604, 0, 1, 0.8745098, 1,
-0.0711375, 0.4768229, -0.2306235, 0, 1, 0.8784314, 1,
-0.06929138, -0.1233908, -1.929244, 0, 1, 0.8862745, 1,
-0.06803901, 0.234874, -0.4395257, 0, 1, 0.8901961, 1,
-0.06515077, 0.5992138, 1.357005, 0, 1, 0.8980392, 1,
-0.06346649, 1.522882, 1.325565, 0, 1, 0.9058824, 1,
-0.05930242, 0.6649023, 2.173043, 0, 1, 0.9098039, 1,
-0.05893655, -1.702783, -4.058551, 0, 1, 0.9176471, 1,
-0.05446871, -0.6231407, -2.304946, 0, 1, 0.9215686, 1,
-0.04267438, -0.3298564, -2.006138, 0, 1, 0.9294118, 1,
-0.04169804, 1.899693, 0.3380058, 0, 1, 0.9333333, 1,
-0.04151309, -0.923833, -3.265394, 0, 1, 0.9411765, 1,
-0.04055801, 1.063876, -0.518338, 0, 1, 0.945098, 1,
-0.03554799, -1.380844, -2.90674, 0, 1, 0.9529412, 1,
-0.03365353, -0.3536747, -3.595893, 0, 1, 0.9568627, 1,
-0.02948286, -0.7681085, -2.911382, 0, 1, 0.9647059, 1,
-0.0268167, -0.0328492, -1.905364, 0, 1, 0.9686275, 1,
-0.02529558, -0.05853523, -2.507951, 0, 1, 0.9764706, 1,
-0.01427497, -0.3152381, -3.775383, 0, 1, 0.9803922, 1,
-0.01186473, -1.355386, -1.207508, 0, 1, 0.9882353, 1,
-0.009131853, -0.2056297, -3.68271, 0, 1, 0.9921569, 1,
-0.004871983, 1.283461, -0.6319721, 0, 1, 1, 1,
-0.004026402, 0.7477822, 0.4726377, 0, 0.9921569, 1, 1,
-0.001559081, 0.8830789, -1.644691, 0, 0.9882353, 1, 1,
0.0004293941, -1.280093, 1.606063, 0, 0.9803922, 1, 1,
0.002378333, -2.093842, 2.972115, 0, 0.9764706, 1, 1,
0.009423405, -1.132046, 0.00913547, 0, 0.9686275, 1, 1,
0.01279046, -1.131708, 4.651219, 0, 0.9647059, 1, 1,
0.01311433, -1.025651, 1.657031, 0, 0.9568627, 1, 1,
0.01378552, -0.03763776, 1.860468, 0, 0.9529412, 1, 1,
0.01448332, -0.01694195, 3.380739, 0, 0.945098, 1, 1,
0.01651299, -0.4255536, 2.845762, 0, 0.9411765, 1, 1,
0.01843661, 1.173069, 1.002282, 0, 0.9333333, 1, 1,
0.02264966, 0.9058282, -0.8928853, 0, 0.9294118, 1, 1,
0.0240746, -0.1971337, 1.885898, 0, 0.9215686, 1, 1,
0.02711235, 0.4432767, 1.633312, 0, 0.9176471, 1, 1,
0.02842723, -0.6438953, 3.805383, 0, 0.9098039, 1, 1,
0.03242724, -1.327782, 3.03769, 0, 0.9058824, 1, 1,
0.03651499, -1.322764, 3.683355, 0, 0.8980392, 1, 1,
0.04329706, -2.269226, 3.033836, 0, 0.8901961, 1, 1,
0.04733941, 1.569217, 0.06079493, 0, 0.8862745, 1, 1,
0.04860414, -0.3230045, 2.966799, 0, 0.8784314, 1, 1,
0.05168897, 0.9600313, -0.3823366, 0, 0.8745098, 1, 1,
0.05669117, -0.837215, 3.481062, 0, 0.8666667, 1, 1,
0.06243234, -0.0860446, 1.506462, 0, 0.8627451, 1, 1,
0.06705341, 0.5044914, 2.349646, 0, 0.854902, 1, 1,
0.06715584, -0.7852389, 4.064922, 0, 0.8509804, 1, 1,
0.06798078, 1.674773, -0.1993019, 0, 0.8431373, 1, 1,
0.06951811, 0.1523345, 0.4061267, 0, 0.8392157, 1, 1,
0.07021628, 0.541702, -0.9936013, 0, 0.8313726, 1, 1,
0.07050665, 0.3300644, 0.3799966, 0, 0.827451, 1, 1,
0.07156779, -0.1748997, 2.841046, 0, 0.8196079, 1, 1,
0.07190327, 0.9634119, 1.761718, 0, 0.8156863, 1, 1,
0.0776666, -0.8836019, 3.803021, 0, 0.8078431, 1, 1,
0.07946611, -0.2873836, 3.938863, 0, 0.8039216, 1, 1,
0.08705118, -0.6787328, 2.573375, 0, 0.7960784, 1, 1,
0.08848205, -0.8675247, 1.751966, 0, 0.7882353, 1, 1,
0.09868167, -0.0775414, 1.238268, 0, 0.7843137, 1, 1,
0.09887248, 1.384454, 0.845391, 0, 0.7764706, 1, 1,
0.1008926, -0.3316538, 4.229219, 0, 0.772549, 1, 1,
0.1031486, 1.78113, -2.320581, 0, 0.7647059, 1, 1,
0.1034924, 0.9497119, -0.5273414, 0, 0.7607843, 1, 1,
0.104937, 2.067086, -0.6221787, 0, 0.7529412, 1, 1,
0.1089811, -0.9717886, 1.954608, 0, 0.7490196, 1, 1,
0.111548, -0.9785201, 3.603133, 0, 0.7411765, 1, 1,
0.1128884, -0.1725347, 3.761492, 0, 0.7372549, 1, 1,
0.1149338, -0.1774746, 3.508003, 0, 0.7294118, 1, 1,
0.1235733, -0.7291712, 2.632752, 0, 0.7254902, 1, 1,
0.12547, 0.7361681, 0.6838807, 0, 0.7176471, 1, 1,
0.1281429, -0.02785555, 2.199513, 0, 0.7137255, 1, 1,
0.1313369, 0.7094206, 0.03018811, 0, 0.7058824, 1, 1,
0.1357554, -0.7529218, 4.149991, 0, 0.6980392, 1, 1,
0.1380057, -1.876149, 1.995088, 0, 0.6941177, 1, 1,
0.1400929, -1.420159, 2.627843, 0, 0.6862745, 1, 1,
0.1410026, 0.8307135, 0.7825649, 0, 0.682353, 1, 1,
0.1433199, 0.5568615, 2.04875, 0, 0.6745098, 1, 1,
0.145667, -0.2373142, 1.308403, 0, 0.6705883, 1, 1,
0.1469481, 0.0336611, 2.243941, 0, 0.6627451, 1, 1,
0.1487136, -0.3367102, 3.346205, 0, 0.6588235, 1, 1,
0.1548854, 0.6310238, 0.4687678, 0, 0.6509804, 1, 1,
0.1569062, 0.2532828, 1.091156, 0, 0.6470588, 1, 1,
0.163091, 0.4449903, -0.1039056, 0, 0.6392157, 1, 1,
0.1647409, 1.772509, 0.281863, 0, 0.6352941, 1, 1,
0.164847, -1.012387, 3.535012, 0, 0.627451, 1, 1,
0.1662223, 1.481445, -1.394237, 0, 0.6235294, 1, 1,
0.1745741, -0.6901752, 2.71811, 0, 0.6156863, 1, 1,
0.1827133, -0.629087, 1.481156, 0, 0.6117647, 1, 1,
0.1834905, 0.4076096, 0.01937651, 0, 0.6039216, 1, 1,
0.1842795, -0.2765923, 2.239217, 0, 0.5960785, 1, 1,
0.1851725, 0.1218365, 2.894694, 0, 0.5921569, 1, 1,
0.1862405, -0.3118031, 1.582074, 0, 0.5843138, 1, 1,
0.1864549, -1.889349, 2.814737, 0, 0.5803922, 1, 1,
0.189079, 1.016236, -0.04357019, 0, 0.572549, 1, 1,
0.18913, 0.3477491, -0.1567552, 0, 0.5686275, 1, 1,
0.1892329, -0.219096, 4.762634, 0, 0.5607843, 1, 1,
0.1901726, -1.169641, 4.463384, 0, 0.5568628, 1, 1,
0.1919563, 0.6002789, -2.030958, 0, 0.5490196, 1, 1,
0.1926689, 0.9560239, -1.617965, 0, 0.5450981, 1, 1,
0.1936832, 0.2723719, -0.1042667, 0, 0.5372549, 1, 1,
0.1938044, -0.09952169, 2.004828, 0, 0.5333334, 1, 1,
0.198479, -1.366886, 2.843473, 0, 0.5254902, 1, 1,
0.2003824, -1.248724, 1.584728, 0, 0.5215687, 1, 1,
0.2044812, -0.6328854, 4.935626, 0, 0.5137255, 1, 1,
0.2061523, -0.4485841, 4.183953, 0, 0.509804, 1, 1,
0.2092252, -0.8632743, 2.682571, 0, 0.5019608, 1, 1,
0.2127248, 0.9368743, 0.209263, 0, 0.4941176, 1, 1,
0.2154772, -1.26185, 4.2825, 0, 0.4901961, 1, 1,
0.2215559, 0.3289708, 1.352484, 0, 0.4823529, 1, 1,
0.2242639, 0.6797802, 1.425913, 0, 0.4784314, 1, 1,
0.2308884, 0.1531856, 2.528838, 0, 0.4705882, 1, 1,
0.2310885, -0.785125, 3.029577, 0, 0.4666667, 1, 1,
0.2362581, -0.09164611, 2.206391, 0, 0.4588235, 1, 1,
0.2416976, -0.7607228, 3.035667, 0, 0.454902, 1, 1,
0.2417288, 0.4720474, -1.014176, 0, 0.4470588, 1, 1,
0.2480111, -1.557528, 2.955992, 0, 0.4431373, 1, 1,
0.2498073, -0.6951928, -0.3051745, 0, 0.4352941, 1, 1,
0.2552748, 0.777768, -0.146768, 0, 0.4313726, 1, 1,
0.2621363, 0.03782275, 0.6669251, 0, 0.4235294, 1, 1,
0.262317, 0.3796957, -0.4826301, 0, 0.4196078, 1, 1,
0.2646364, -0.4467114, 2.767167, 0, 0.4117647, 1, 1,
0.2658834, -1.057581, 1.725008, 0, 0.4078431, 1, 1,
0.2691882, -0.4483236, 3.665551, 0, 0.4, 1, 1,
0.2737516, -0.243486, 4.050916, 0, 0.3921569, 1, 1,
0.2828897, -0.3782602, 2.842274, 0, 0.3882353, 1, 1,
0.2838893, 0.6888832, -0.6157874, 0, 0.3803922, 1, 1,
0.2864681, -1.366176, 3.426309, 0, 0.3764706, 1, 1,
0.2886522, 0.7265257, 0.1171598, 0, 0.3686275, 1, 1,
0.2898059, 0.08129754, 0.6811461, 0, 0.3647059, 1, 1,
0.2899466, 0.5110785, 2.414949, 0, 0.3568628, 1, 1,
0.298999, 0.07052863, 1.558761, 0, 0.3529412, 1, 1,
0.3004864, -0.5706356, 3.166871, 0, 0.345098, 1, 1,
0.3057528, 2.545145, 0.2941278, 0, 0.3411765, 1, 1,
0.313549, 0.05663763, 1.757737, 0, 0.3333333, 1, 1,
0.3174377, 0.1427023, 1.59761, 0, 0.3294118, 1, 1,
0.3177249, -1.001496, 2.561764, 0, 0.3215686, 1, 1,
0.318006, 0.6937468, -0.02689777, 0, 0.3176471, 1, 1,
0.3255253, -0.1009225, 1.897843, 0, 0.3098039, 1, 1,
0.3265045, -1.569171, 2.463769, 0, 0.3058824, 1, 1,
0.3268522, -0.302062, 2.181781, 0, 0.2980392, 1, 1,
0.3273191, -0.5224165, 2.440088, 0, 0.2901961, 1, 1,
0.3275025, 0.09898935, 1.180246, 0, 0.2862745, 1, 1,
0.3281398, -1.017336, 2.978434, 0, 0.2784314, 1, 1,
0.3287478, -0.5764017, 2.999265, 0, 0.2745098, 1, 1,
0.3307099, 2.005308, -1.543621, 0, 0.2666667, 1, 1,
0.3355316, 0.004220387, 1.969553, 0, 0.2627451, 1, 1,
0.3453482, 0.5687856, -0.2134606, 0, 0.254902, 1, 1,
0.3457746, -1.170191, 2.485019, 0, 0.2509804, 1, 1,
0.3480549, -0.7216935, 3.322632, 0, 0.2431373, 1, 1,
0.3497889, -0.630689, 0.9677877, 0, 0.2392157, 1, 1,
0.3510999, 1.023917, 0.03050004, 0, 0.2313726, 1, 1,
0.352768, -0.4197125, 4.242798, 0, 0.227451, 1, 1,
0.354591, 1.874478, 0.7209029, 0, 0.2196078, 1, 1,
0.3570672, 0.835045, -0.1345409, 0, 0.2156863, 1, 1,
0.3579362, 0.06465798, 2.257167, 0, 0.2078431, 1, 1,
0.362036, 2.014377, -0.698986, 0, 0.2039216, 1, 1,
0.3702456, 0.7945967, 0.6472341, 0, 0.1960784, 1, 1,
0.3712368, -0.1476207, 2.85107, 0, 0.1882353, 1, 1,
0.3715071, -0.8728015, 3.250873, 0, 0.1843137, 1, 1,
0.37633, 0.7944034, 0.7480617, 0, 0.1764706, 1, 1,
0.3797222, 1.987325, 1.27587, 0, 0.172549, 1, 1,
0.3822472, 0.5667429, 0.8480115, 0, 0.1647059, 1, 1,
0.3850273, 0.1462548, 2.497815, 0, 0.1607843, 1, 1,
0.3854119, 0.4318688, -0.7262772, 0, 0.1529412, 1, 1,
0.3857902, -0.2715639, 0.2579691, 0, 0.1490196, 1, 1,
0.3879386, -0.07491191, 2.220593, 0, 0.1411765, 1, 1,
0.3918387, -0.5738549, 3.839859, 0, 0.1372549, 1, 1,
0.3954284, -1.96224, 3.11958, 0, 0.1294118, 1, 1,
0.3956117, -0.4986922, 2.07029, 0, 0.1254902, 1, 1,
0.3964396, -0.1257965, 1.712998, 0, 0.1176471, 1, 1,
0.4004996, -0.05472692, 1.017732, 0, 0.1137255, 1, 1,
0.4027939, -0.5875014, 1.91353, 0, 0.1058824, 1, 1,
0.4057244, -0.7261837, 3.235857, 0, 0.09803922, 1, 1,
0.4082439, -0.7017843, 2.203558, 0, 0.09411765, 1, 1,
0.415646, 1.160335, -0.7432302, 0, 0.08627451, 1, 1,
0.4209179, -0.4990324, 3.109124, 0, 0.08235294, 1, 1,
0.4266922, 0.7014087, 1.344855, 0, 0.07450981, 1, 1,
0.4281603, 0.7759246, 0.9390386, 0, 0.07058824, 1, 1,
0.4319852, 0.04030382, 1.465568, 0, 0.0627451, 1, 1,
0.4331585, -1.070901, 2.06804, 0, 0.05882353, 1, 1,
0.4367143, -1.333812, 2.604555, 0, 0.05098039, 1, 1,
0.4411309, 0.2244195, 2.427126, 0, 0.04705882, 1, 1,
0.444004, -1.648994, 1.826053, 0, 0.03921569, 1, 1,
0.4455388, -0.2861341, 2.194813, 0, 0.03529412, 1, 1,
0.4469559, 1.70339, -0.5284996, 0, 0.02745098, 1, 1,
0.4472738, -0.9274219, 2.559803, 0, 0.02352941, 1, 1,
0.4494199, 1.646313, 0.3744393, 0, 0.01568628, 1, 1,
0.4504011, 0.5301181, -0.625927, 0, 0.01176471, 1, 1,
0.4504024, 0.3269141, 1.902573, 0, 0.003921569, 1, 1,
0.4514278, 0.3239688, -0.5134316, 0.003921569, 0, 1, 1,
0.4537878, 0.8362672, 1.849802, 0.007843138, 0, 1, 1,
0.4568578, -0.5557079, 1.801432, 0.01568628, 0, 1, 1,
0.4593723, -1.293804, 3.384588, 0.01960784, 0, 1, 1,
0.4618746, 1.051653, -0.3604114, 0.02745098, 0, 1, 1,
0.4661048, 1.20686, -0.5207105, 0.03137255, 0, 1, 1,
0.4704155, -0.6538693, 3.748949, 0.03921569, 0, 1, 1,
0.4705803, 0.8286427, 0.487932, 0.04313726, 0, 1, 1,
0.4726479, 0.4356138, 2.249009, 0.05098039, 0, 1, 1,
0.4762568, -0.4500736, 2.46332, 0.05490196, 0, 1, 1,
0.4769738, -2.262828, 1.055257, 0.0627451, 0, 1, 1,
0.4774681, -0.4924593, 1.455004, 0.06666667, 0, 1, 1,
0.4800856, 1.094237, -0.1610216, 0.07450981, 0, 1, 1,
0.4836397, -0.2143518, 4.50209, 0.07843138, 0, 1, 1,
0.487439, 0.8065403, 1.84166, 0.08627451, 0, 1, 1,
0.4874395, 2.001185, 1.45791, 0.09019608, 0, 1, 1,
0.4877802, 0.1932112, 3.102546, 0.09803922, 0, 1, 1,
0.4890819, -0.08482744, 1.589139, 0.1058824, 0, 1, 1,
0.4915913, 0.5163868, 0.1992063, 0.1098039, 0, 1, 1,
0.4928863, 1.04215, 2.875524, 0.1176471, 0, 1, 1,
0.4938019, -1.495836, 3.4033, 0.1215686, 0, 1, 1,
0.4950648, -0.01381545, 1.89596, 0.1294118, 0, 1, 1,
0.5076748, -0.9631194, 2.414869, 0.1333333, 0, 1, 1,
0.508947, -0.2690315, 1.483971, 0.1411765, 0, 1, 1,
0.5178929, -1.317425, 2.016454, 0.145098, 0, 1, 1,
0.5207665, 1.254618, 1.280447, 0.1529412, 0, 1, 1,
0.5224143, 0.1721497, 1.954473, 0.1568628, 0, 1, 1,
0.5243977, 0.413864, 1.382022, 0.1647059, 0, 1, 1,
0.5254709, 0.1393614, 1.56207, 0.1686275, 0, 1, 1,
0.5280273, -0.1462504, 1.913647, 0.1764706, 0, 1, 1,
0.5282974, 0.7395138, 1.616247, 0.1803922, 0, 1, 1,
0.5307949, -1.495156, 1.8979, 0.1882353, 0, 1, 1,
0.5342795, 0.9855565, 0.8754626, 0.1921569, 0, 1, 1,
0.5436174, 0.1949787, 2.196237, 0.2, 0, 1, 1,
0.5445378, 0.7318295, 0.05060064, 0.2078431, 0, 1, 1,
0.5501666, 1.677939, -0.417174, 0.2117647, 0, 1, 1,
0.5564979, 0.9434779, 0.8377189, 0.2196078, 0, 1, 1,
0.5577831, 1.608404, -0.3147209, 0.2235294, 0, 1, 1,
0.5597234, 0.1073575, 3.275334, 0.2313726, 0, 1, 1,
0.5598917, 0.4847112, 0.4794691, 0.2352941, 0, 1, 1,
0.5615954, -0.5622452, 3.533993, 0.2431373, 0, 1, 1,
0.5687812, -0.007640424, 2.530909, 0.2470588, 0, 1, 1,
0.5711334, 0.2196429, 1.527402, 0.254902, 0, 1, 1,
0.5747253, 0.3003609, 1.000888, 0.2588235, 0, 1, 1,
0.5790142, -1.107414, 3.022938, 0.2666667, 0, 1, 1,
0.5810197, -0.756628, 1.142054, 0.2705882, 0, 1, 1,
0.5851169, 0.1816971, -0.1472482, 0.2784314, 0, 1, 1,
0.5854483, -0.6608601, 3.259431, 0.282353, 0, 1, 1,
0.5885903, 1.336782, 1.332112, 0.2901961, 0, 1, 1,
0.5922825, -1.523394, 4.040275, 0.2941177, 0, 1, 1,
0.5923473, 0.6516361, 1.140182, 0.3019608, 0, 1, 1,
0.5924905, -0.2637221, 1.978839, 0.3098039, 0, 1, 1,
0.5957196, 0.3271268, 2.211457, 0.3137255, 0, 1, 1,
0.6030597, 0.8395142, 2.320122, 0.3215686, 0, 1, 1,
0.6054239, -2.475764, 3.722923, 0.3254902, 0, 1, 1,
0.6086132, 2.015809, 0.09656955, 0.3333333, 0, 1, 1,
0.6093825, -0.4346904, 1.77485, 0.3372549, 0, 1, 1,
0.6106491, 3.644445, -1.092719, 0.345098, 0, 1, 1,
0.6192089, -1.561033, 2.572723, 0.3490196, 0, 1, 1,
0.6201203, 0.7531703, 0.1033341, 0.3568628, 0, 1, 1,
0.6214613, 1.628449, 0.5780441, 0.3607843, 0, 1, 1,
0.6221498, 1.375446, 0.6126444, 0.3686275, 0, 1, 1,
0.6312417, 1.596667, 1.457766, 0.372549, 0, 1, 1,
0.6322773, -1.475994, 2.881673, 0.3803922, 0, 1, 1,
0.6336666, -0.1827413, 2.032524, 0.3843137, 0, 1, 1,
0.6399727, -0.3327726, 4.537144, 0.3921569, 0, 1, 1,
0.6525784, -1.033299, 2.682201, 0.3960784, 0, 1, 1,
0.6562492, -0.3430693, 0.7681926, 0.4039216, 0, 1, 1,
0.6590497, 0.4835613, 0.7818934, 0.4117647, 0, 1, 1,
0.6627125, 0.8585982, -0.846849, 0.4156863, 0, 1, 1,
0.6657414, 0.6432391, 0.6072041, 0.4235294, 0, 1, 1,
0.6678934, 0.2563448, 0.982459, 0.427451, 0, 1, 1,
0.6682457, -0.2043917, 1.855076, 0.4352941, 0, 1, 1,
0.669112, 0.2908998, -0.1806648, 0.4392157, 0, 1, 1,
0.6701429, 0.7783225, 0.7810693, 0.4470588, 0, 1, 1,
0.6750077, -0.6169393, 3.562744, 0.4509804, 0, 1, 1,
0.6769778, 0.3166188, 1.484581, 0.4588235, 0, 1, 1,
0.6798109, -1.444394, 1.600371, 0.4627451, 0, 1, 1,
0.6835405, -0.5447608, 1.098545, 0.4705882, 0, 1, 1,
0.6902293, 0.7885939, 0.7746255, 0.4745098, 0, 1, 1,
0.6910822, -0.8726528, 1.519702, 0.4823529, 0, 1, 1,
0.6967991, 1.983431, 0.2512195, 0.4862745, 0, 1, 1,
0.6982836, -0.4444758, 0.9436436, 0.4941176, 0, 1, 1,
0.7002196, 1.167387, 0.1663611, 0.5019608, 0, 1, 1,
0.7211757, -1.763952, 2.753323, 0.5058824, 0, 1, 1,
0.7241078, 0.3580234, 1.574815, 0.5137255, 0, 1, 1,
0.7293519, 0.97065, -0.5727103, 0.5176471, 0, 1, 1,
0.7303743, 0.08750307, 1.445828, 0.5254902, 0, 1, 1,
0.7410856, -0.6088888, 2.145751, 0.5294118, 0, 1, 1,
0.7421052, 0.5494843, 0.770101, 0.5372549, 0, 1, 1,
0.7441168, -0.1380993, 2.313663, 0.5411765, 0, 1, 1,
0.7450889, 0.2341168, 0.1824545, 0.5490196, 0, 1, 1,
0.7492916, -0.6094336, 0.7958283, 0.5529412, 0, 1, 1,
0.7518917, 0.7240847, 0.8488858, 0.5607843, 0, 1, 1,
0.7529765, 0.360492, 1.138023, 0.5647059, 0, 1, 1,
0.7540146, -1.532076, 3.34269, 0.572549, 0, 1, 1,
0.7625675, 0.6910785, 2.132435, 0.5764706, 0, 1, 1,
0.7626649, 0.8307928, 0.1263912, 0.5843138, 0, 1, 1,
0.7740371, -0.3093977, 2.529427, 0.5882353, 0, 1, 1,
0.7778227, 0.2975264, 1.909247, 0.5960785, 0, 1, 1,
0.7829098, -0.5179484, 1.688878, 0.6039216, 0, 1, 1,
0.7853018, 1.600995, -0.2329505, 0.6078432, 0, 1, 1,
0.7878268, 0.6701403, 1.917367, 0.6156863, 0, 1, 1,
0.788095, -0.165028, 0.4681591, 0.6196079, 0, 1, 1,
0.7914342, 0.4288703, 0.2144495, 0.627451, 0, 1, 1,
0.7918484, -0.6672026, 1.555412, 0.6313726, 0, 1, 1,
0.7918899, 0.6547919, 0.2521042, 0.6392157, 0, 1, 1,
0.792806, -0.7524415, 1.822723, 0.6431373, 0, 1, 1,
0.7941667, -0.346994, 3.292237, 0.6509804, 0, 1, 1,
0.7962324, -1.568664, 2.486508, 0.654902, 0, 1, 1,
0.798393, 0.1656331, 0.3685462, 0.6627451, 0, 1, 1,
0.8024204, -0.1987212, 0.07479874, 0.6666667, 0, 1, 1,
0.808835, -0.5003616, 2.274265, 0.6745098, 0, 1, 1,
0.8163641, 0.7091847, 0.2872107, 0.6784314, 0, 1, 1,
0.8224846, 0.02372876, 0.9475768, 0.6862745, 0, 1, 1,
0.8280563, -1.198645, 4.010249, 0.6901961, 0, 1, 1,
0.8314474, -1.820487, 2.081617, 0.6980392, 0, 1, 1,
0.8388184, -0.9404198, 3.244106, 0.7058824, 0, 1, 1,
0.8509524, 0.4446311, 2.528999, 0.7098039, 0, 1, 1,
0.8513246, 0.1341127, 1.864583, 0.7176471, 0, 1, 1,
0.8522242, 0.9131393, 0.9235368, 0.7215686, 0, 1, 1,
0.8548919, 0.21075, 0.2456156, 0.7294118, 0, 1, 1,
0.8549064, -1.174206, 2.64301, 0.7333333, 0, 1, 1,
0.855858, 1.133995, 1.279243, 0.7411765, 0, 1, 1,
0.8570185, 1.073202, -0.285626, 0.7450981, 0, 1, 1,
0.8636192, 1.878025, -0.3078856, 0.7529412, 0, 1, 1,
0.8642538, 0.08793779, 1.609935, 0.7568628, 0, 1, 1,
0.8706279, -0.8581121, 1.591425, 0.7647059, 0, 1, 1,
0.8708667, -1.231067, 2.198513, 0.7686275, 0, 1, 1,
0.8815389, 0.1956832, 1.069942, 0.7764706, 0, 1, 1,
0.8828552, -0.7384779, 1.397126, 0.7803922, 0, 1, 1,
0.8873042, -1.898811, 2.734113, 0.7882353, 0, 1, 1,
0.888043, 0.7397131, 1.888624, 0.7921569, 0, 1, 1,
0.8944294, -0.3115509, 1.660936, 0.8, 0, 1, 1,
0.8976868, 0.1810555, 1.643894, 0.8078431, 0, 1, 1,
0.903184, 0.9685474, 0.07731682, 0.8117647, 0, 1, 1,
0.9039093, 0.5814707, 1.189659, 0.8196079, 0, 1, 1,
0.9064353, -0.7132642, 1.877592, 0.8235294, 0, 1, 1,
0.9106573, 0.5827525, 0.3305191, 0.8313726, 0, 1, 1,
0.9132787, 0.9612328, -0.6215081, 0.8352941, 0, 1, 1,
0.9146159, -1.556658, 3.032258, 0.8431373, 0, 1, 1,
0.9239605, 0.4138485, 2.630976, 0.8470588, 0, 1, 1,
0.9279079, 1.593295, 1.350802, 0.854902, 0, 1, 1,
0.9279433, 0.813889, 0.9510168, 0.8588235, 0, 1, 1,
0.9335555, 0.4584237, 0.1578661, 0.8666667, 0, 1, 1,
0.9380062, 0.6774639, -0.3972082, 0.8705882, 0, 1, 1,
0.9387335, 2.11179, 1.582754, 0.8784314, 0, 1, 1,
0.9412211, 0.6405425, 1.239753, 0.8823529, 0, 1, 1,
0.9429812, 1.803134, 0.3112496, 0.8901961, 0, 1, 1,
0.9736196, 0.6632604, 0.8774589, 0.8941177, 0, 1, 1,
0.9809943, 0.2381318, 1.247021, 0.9019608, 0, 1, 1,
0.9823214, 0.9338302, 2.714444, 0.9098039, 0, 1, 1,
0.997814, 1.972576, 0.5993915, 0.9137255, 0, 1, 1,
0.9987637, 0.5745073, 1.489314, 0.9215686, 0, 1, 1,
1.000976, 0.08920778, 2.334733, 0.9254902, 0, 1, 1,
1.006846, -0.5668018, 2.828995, 0.9333333, 0, 1, 1,
1.007119, 0.5269399, -0.3284534, 0.9372549, 0, 1, 1,
1.007675, -1.822989, 3.03049, 0.945098, 0, 1, 1,
1.00961, 0.0239075, -1.602199, 0.9490196, 0, 1, 1,
1.018271, -1.310948, 4.035953, 0.9568627, 0, 1, 1,
1.019891, 1.615407, 2.204115, 0.9607843, 0, 1, 1,
1.020191, 0.5265617, 3.314946, 0.9686275, 0, 1, 1,
1.03291, 0.4893984, 0.9700392, 0.972549, 0, 1, 1,
1.039272, 1.583858, 1.119698, 0.9803922, 0, 1, 1,
1.042135, 0.1111279, 0.9981199, 0.9843137, 0, 1, 1,
1.042668, -0.8044816, 2.899553, 0.9921569, 0, 1, 1,
1.046446, 1.525724, 0.6652654, 0.9960784, 0, 1, 1,
1.057619, 0.6474776, 0.4722016, 1, 0, 0.9960784, 1,
1.067395, 2.744483, -1.176034, 1, 0, 0.9882353, 1,
1.067496, -1.200144, 4.488573, 1, 0, 0.9843137, 1,
1.069259, 1.053732, 0.8546202, 1, 0, 0.9764706, 1,
1.072775, 0.3326427, 1.801259, 1, 0, 0.972549, 1,
1.074617, 0.3138441, 0.1543872, 1, 0, 0.9647059, 1,
1.079139, 1.174616, 1.257065, 1, 0, 0.9607843, 1,
1.086662, -0.4907213, 1.947673, 1, 0, 0.9529412, 1,
1.088171, 0.1277454, -0.8684456, 1, 0, 0.9490196, 1,
1.088227, 0.8836246, 0.996969, 1, 0, 0.9411765, 1,
1.090997, 0.6873433, 0.1372409, 1, 0, 0.9372549, 1,
1.091931, -0.09918532, 2.680018, 1, 0, 0.9294118, 1,
1.095851, -0.4938042, 1.416104, 1, 0, 0.9254902, 1,
1.098054, 0.1206772, 2.284094, 1, 0, 0.9176471, 1,
1.103625, 1.007292, -0.3827138, 1, 0, 0.9137255, 1,
1.120091, 1.004487, 0.2959721, 1, 0, 0.9058824, 1,
1.121932, -0.2355184, 3.296212, 1, 0, 0.9019608, 1,
1.126707, -2.098068, 1.88311, 1, 0, 0.8941177, 1,
1.130996, 1.729643, 0.3891108, 1, 0, 0.8862745, 1,
1.135282, 0.3307814, 1.588178, 1, 0, 0.8823529, 1,
1.141482, 1.110398, 1.499879, 1, 0, 0.8745098, 1,
1.142087, 0.6834359, 2.183576, 1, 0, 0.8705882, 1,
1.144529, -0.7642591, 2.153356, 1, 0, 0.8627451, 1,
1.153085, -0.9202957, 1.489521, 1, 0, 0.8588235, 1,
1.153324, 1.399848, -1.79332, 1, 0, 0.8509804, 1,
1.16613, -1.105895, 3.195188, 1, 0, 0.8470588, 1,
1.17123, -0.4414345, 1.597103, 1, 0, 0.8392157, 1,
1.171465, 0.07706352, 0.5968291, 1, 0, 0.8352941, 1,
1.174374, -1.285922, 2.75668, 1, 0, 0.827451, 1,
1.180072, -0.2799519, 1.487415, 1, 0, 0.8235294, 1,
1.187405, 0.6962233, 0.42255, 1, 0, 0.8156863, 1,
1.187541, -0.9771879, 1.588624, 1, 0, 0.8117647, 1,
1.189903, -0.4585242, 2.381379, 1, 0, 0.8039216, 1,
1.193589, 1.805198, 1.449266, 1, 0, 0.7960784, 1,
1.194171, 0.8612737, 0.9796558, 1, 0, 0.7921569, 1,
1.194883, 0.6409253, 1.549331, 1, 0, 0.7843137, 1,
1.196805, -0.9555687, 1.69495, 1, 0, 0.7803922, 1,
1.197216, -0.2152166, 2.746251, 1, 0, 0.772549, 1,
1.200145, -0.5310029, 3.25879, 1, 0, 0.7686275, 1,
1.20692, -1.052529, 1.056685, 1, 0, 0.7607843, 1,
1.210772, 0.8022508, 1.480353, 1, 0, 0.7568628, 1,
1.215546, 0.1290925, 0.3644211, 1, 0, 0.7490196, 1,
1.22084, -0.8477079, 1.753672, 1, 0, 0.7450981, 1,
1.237711, -0.5286585, 2.044469, 1, 0, 0.7372549, 1,
1.239446, 0.9435589, 1.559523, 1, 0, 0.7333333, 1,
1.241023, -2.887121, 3.435488, 1, 0, 0.7254902, 1,
1.245044, -0.7159329, 2.224319, 1, 0, 0.7215686, 1,
1.246783, 0.7200581, 2.172063, 1, 0, 0.7137255, 1,
1.248422, -0.2271427, 1.299268, 1, 0, 0.7098039, 1,
1.24976, 1.061498, 1.94955, 1, 0, 0.7019608, 1,
1.249777, 0.1690064, 0.6341192, 1, 0, 0.6941177, 1,
1.25061, 1.195934, 1.099002, 1, 0, 0.6901961, 1,
1.255031, -0.9140165, 2.883456, 1, 0, 0.682353, 1,
1.255079, -2.801784, 2.166797, 1, 0, 0.6784314, 1,
1.265182, -1.031831, 0.1776096, 1, 0, 0.6705883, 1,
1.275064, 0.9305756, -0.324255, 1, 0, 0.6666667, 1,
1.277311, 0.2905268, 1.038393, 1, 0, 0.6588235, 1,
1.278273, -1.454513, 2.582546, 1, 0, 0.654902, 1,
1.280763, -0.1557626, 3.070449, 1, 0, 0.6470588, 1,
1.285922, -0.6781979, 1.879253, 1, 0, 0.6431373, 1,
1.288806, 0.3970425, 0.1270694, 1, 0, 0.6352941, 1,
1.294989, 1.643643, 0.7378686, 1, 0, 0.6313726, 1,
1.31442, -0.6365609, 2.063323, 1, 0, 0.6235294, 1,
1.316249, 0.2496061, 0.5023524, 1, 0, 0.6196079, 1,
1.317474, -0.1158326, 2.474923, 1, 0, 0.6117647, 1,
1.341357, -0.7999581, 2.427564, 1, 0, 0.6078432, 1,
1.341878, 0.237017, 3.223118, 1, 0, 0.6, 1,
1.348629, -0.9235711, 1.90894, 1, 0, 0.5921569, 1,
1.354312, -1.427445, 3.831813, 1, 0, 0.5882353, 1,
1.356772, 2.291329, 2.907557, 1, 0, 0.5803922, 1,
1.358539, -1.541417, 4.159599, 1, 0, 0.5764706, 1,
1.362484, -0.880308, 0.8043287, 1, 0, 0.5686275, 1,
1.364719, -0.0652806, 1.98436, 1, 0, 0.5647059, 1,
1.373892, -1.481939, 4.398261, 1, 0, 0.5568628, 1,
1.375802, 1.318106, 3.033087, 1, 0, 0.5529412, 1,
1.398124, 2.158069, -0.2213829, 1, 0, 0.5450981, 1,
1.399073, -0.2161589, 1.420773, 1, 0, 0.5411765, 1,
1.404212, -1.136138, 1.705888, 1, 0, 0.5333334, 1,
1.418385, 0.0827539, 1.921841, 1, 0, 0.5294118, 1,
1.422831, 1.534785, -0.229183, 1, 0, 0.5215687, 1,
1.450315, 0.4021639, 1.863224, 1, 0, 0.5176471, 1,
1.450885, -0.6119905, 1.091117, 1, 0, 0.509804, 1,
1.465392, 1.441388, -1.348221, 1, 0, 0.5058824, 1,
1.465934, 0.37728, 1.172825, 1, 0, 0.4980392, 1,
1.473883, -0.6237302, 2.221287, 1, 0, 0.4901961, 1,
1.474687, 2.696079, 1.902481, 1, 0, 0.4862745, 1,
1.475483, -1.675237, 2.273995, 1, 0, 0.4784314, 1,
1.478862, 0.6919422, 2.541433, 1, 0, 0.4745098, 1,
1.479765, -1.457221, 2.437895, 1, 0, 0.4666667, 1,
1.485232, 1.050286, 0.3210188, 1, 0, 0.4627451, 1,
1.503318, -0.50466, 2.36031, 1, 0, 0.454902, 1,
1.509242, -0.6400968, 2.531117, 1, 0, 0.4509804, 1,
1.519311, 1.408119, 1.267883, 1, 0, 0.4431373, 1,
1.52467, 2.320124, -0.903136, 1, 0, 0.4392157, 1,
1.525206, 0.6527842, 0.8022138, 1, 0, 0.4313726, 1,
1.536815, -0.02441553, 3.068181, 1, 0, 0.427451, 1,
1.537184, 1.20349, 1.696779, 1, 0, 0.4196078, 1,
1.551667, -1.943531, 2.179718, 1, 0, 0.4156863, 1,
1.583908, -0.7076471, 2.507741, 1, 0, 0.4078431, 1,
1.590349, 0.8909525, 2.788268, 1, 0, 0.4039216, 1,
1.590972, 0.3037169, 2.323794, 1, 0, 0.3960784, 1,
1.595635, -1.607724, 2.435106, 1, 0, 0.3882353, 1,
1.599938, 0.1866501, 0.6547201, 1, 0, 0.3843137, 1,
1.637685, 2.309599, 0.9647337, 1, 0, 0.3764706, 1,
1.650763, 0.009264621, 0.8292887, 1, 0, 0.372549, 1,
1.66278, 1.075317, 1.099865, 1, 0, 0.3647059, 1,
1.675379, 1.272681, 1.001242, 1, 0, 0.3607843, 1,
1.679836, 0.5646395, 0.2899945, 1, 0, 0.3529412, 1,
1.680301, -1.081507, 3.492906, 1, 0, 0.3490196, 1,
1.685514, 0.5416894, 1.73771, 1, 0, 0.3411765, 1,
1.691806, -1.057803, 2.144846, 1, 0, 0.3372549, 1,
1.697428, -0.7060387, 3.310587, 1, 0, 0.3294118, 1,
1.706812, 0.6870159, 2.868817, 1, 0, 0.3254902, 1,
1.707857, -0.4933635, 2.666922, 1, 0, 0.3176471, 1,
1.71541, 0.02927491, 1.520732, 1, 0, 0.3137255, 1,
1.71807, 1.610555, 0.5851514, 1, 0, 0.3058824, 1,
1.727507, -0.8890667, 2.671336, 1, 0, 0.2980392, 1,
1.727842, -1.190948, 3.791579, 1, 0, 0.2941177, 1,
1.729256, 2.381115, 1.080083, 1, 0, 0.2862745, 1,
1.730236, -0.01872567, 1.265806, 1, 0, 0.282353, 1,
1.775955, 0.01344458, 2.56094, 1, 0, 0.2745098, 1,
1.78814, -1.981553, 3.068774, 1, 0, 0.2705882, 1,
1.788285, 2.8467, -0.2348989, 1, 0, 0.2627451, 1,
1.796576, -0.7603143, 2.549413, 1, 0, 0.2588235, 1,
1.817791, 0.8076602, 0.8934812, 1, 0, 0.2509804, 1,
1.818115, -0.4572456, 2.969795, 1, 0, 0.2470588, 1,
1.840167, 0.9431919, 2.15271, 1, 0, 0.2392157, 1,
1.84093, 0.3522203, 1.128744, 1, 0, 0.2352941, 1,
1.844047, -0.9261382, 2.377157, 1, 0, 0.227451, 1,
1.847212, -0.05111191, 2.361191, 1, 0, 0.2235294, 1,
1.854841, 0.2121728, 2.421417, 1, 0, 0.2156863, 1,
1.861898, -0.5668893, 1.023406, 1, 0, 0.2117647, 1,
1.869257, -1.015134, 2.467591, 1, 0, 0.2039216, 1,
1.881928, -0.8034176, 0.6798931, 1, 0, 0.1960784, 1,
1.88432, 0.2946227, 1.546766, 1, 0, 0.1921569, 1,
1.892303, 0.7552193, 1.793844, 1, 0, 0.1843137, 1,
1.892919, -0.9346339, 2.305555, 1, 0, 0.1803922, 1,
1.898689, 0.6038059, 2.671512, 1, 0, 0.172549, 1,
1.94061, 0.5599375, 2.399069, 1, 0, 0.1686275, 1,
1.987501, 0.7554404, 1.059666, 1, 0, 0.1607843, 1,
2.015979, -1.200678, 1.32491, 1, 0, 0.1568628, 1,
2.025739, -0.04548379, 2.50567, 1, 0, 0.1490196, 1,
2.033626, -0.3588437, 2.594727, 1, 0, 0.145098, 1,
2.088761, -0.007687175, 1.74589, 1, 0, 0.1372549, 1,
2.10931, -0.7450597, 2.857894, 1, 0, 0.1333333, 1,
2.14298, 1.788264, 0.5024438, 1, 0, 0.1254902, 1,
2.170536, 0.02842906, 0.656676, 1, 0, 0.1215686, 1,
2.182153, -1.654501, 0.1022643, 1, 0, 0.1137255, 1,
2.229155, -0.233132, 0.02685299, 1, 0, 0.1098039, 1,
2.236661, -1.152186, 1.649353, 1, 0, 0.1019608, 1,
2.252018, 0.218409, 3.08108, 1, 0, 0.09411765, 1,
2.25542, -0.6114414, 2.716188, 1, 0, 0.09019608, 1,
2.278227, -0.02699227, 0.3185654, 1, 0, 0.08235294, 1,
2.295285, 0.5910339, 1.184132, 1, 0, 0.07843138, 1,
2.298322, 0.4984207, 2.101237, 1, 0, 0.07058824, 1,
2.311153, 0.21467, 3.305965, 1, 0, 0.06666667, 1,
2.330817, 0.8900669, 1.926313, 1, 0, 0.05882353, 1,
2.374186, -0.83215, 2.333003, 1, 0, 0.05490196, 1,
2.378028, -0.8468323, 3.136471, 1, 0, 0.04705882, 1,
2.455628, -0.0494299, 1.536429, 1, 0, 0.04313726, 1,
2.579119, 1.736019, 0.9804422, 1, 0, 0.03529412, 1,
2.588845, -0.2242083, 1.856852, 1, 0, 0.03137255, 1,
2.630029, -1.834057, 0.727752, 1, 0, 0.02352941, 1,
2.819137, 1.364512, 1.732778, 1, 0, 0.01960784, 1,
3.186443, 1.513154, 0.7470977, 1, 0, 0.01176471, 1,
3.503716, -0.3916571, 2.264731, 1, 0, 0.007843138, 1
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
-0.05169296, -4.661842, -7.685359, 0, -0.5, 0.5, 0.5,
-0.05169296, -4.661842, -7.685359, 1, -0.5, 0.5, 0.5,
-0.05169296, -4.661842, -7.685359, 1, 1.5, 0.5, 0.5,
-0.05169296, -4.661842, -7.685359, 0, 1.5, 0.5, 0.5
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
-4.812385, 0.09323168, -7.685359, 0, -0.5, 0.5, 0.5,
-4.812385, 0.09323168, -7.685359, 1, -0.5, 0.5, 0.5,
-4.812385, 0.09323168, -7.685359, 1, 1.5, 0.5, 0.5,
-4.812385, 0.09323168, -7.685359, 0, 1.5, 0.5, 0.5
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
-4.812385, -4.661842, -0.4602633, 0, -0.5, 0.5, 0.5,
-4.812385, -4.661842, -0.4602633, 1, -0.5, 0.5, 0.5,
-4.812385, -4.661842, -0.4602633, 1, 1.5, 0.5, 0.5,
-4.812385, -4.661842, -0.4602633, 0, 1.5, 0.5, 0.5
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
-2, -3.564518, -6.018029,
2, -3.564518, -6.018029,
-2, -3.564518, -6.018029,
-2, -3.747405, -6.295917,
0, -3.564518, -6.018029,
0, -3.747405, -6.295917,
2, -3.564518, -6.018029,
2, -3.747405, -6.295917
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
"0",
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
-2, -4.11318, -6.851694, 0, -0.5, 0.5, 0.5,
-2, -4.11318, -6.851694, 1, -0.5, 0.5, 0.5,
-2, -4.11318, -6.851694, 1, 1.5, 0.5, 0.5,
-2, -4.11318, -6.851694, 0, 1.5, 0.5, 0.5,
0, -4.11318, -6.851694, 0, -0.5, 0.5, 0.5,
0, -4.11318, -6.851694, 1, -0.5, 0.5, 0.5,
0, -4.11318, -6.851694, 1, 1.5, 0.5, 0.5,
0, -4.11318, -6.851694, 0, 1.5, 0.5, 0.5,
2, -4.11318, -6.851694, 0, -0.5, 0.5, 0.5,
2, -4.11318, -6.851694, 1, -0.5, 0.5, 0.5,
2, -4.11318, -6.851694, 1, 1.5, 0.5, 0.5,
2, -4.11318, -6.851694, 0, 1.5, 0.5, 0.5
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
-3.713764, -2, -6.018029,
-3.713764, 2, -6.018029,
-3.713764, -2, -6.018029,
-3.896867, -2, -6.295917,
-3.713764, 0, -6.018029,
-3.896867, 0, -6.295917,
-3.713764, 2, -6.018029,
-3.896867, 2, -6.295917
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
-4.263074, -2, -6.851694, 0, -0.5, 0.5, 0.5,
-4.263074, -2, -6.851694, 1, -0.5, 0.5, 0.5,
-4.263074, -2, -6.851694, 1, 1.5, 0.5, 0.5,
-4.263074, -2, -6.851694, 0, 1.5, 0.5, 0.5,
-4.263074, 0, -6.851694, 0, -0.5, 0.5, 0.5,
-4.263074, 0, -6.851694, 1, -0.5, 0.5, 0.5,
-4.263074, 0, -6.851694, 1, 1.5, 0.5, 0.5,
-4.263074, 0, -6.851694, 0, 1.5, 0.5, 0.5,
-4.263074, 2, -6.851694, 0, -0.5, 0.5, 0.5,
-4.263074, 2, -6.851694, 1, -0.5, 0.5, 0.5,
-4.263074, 2, -6.851694, 1, 1.5, 0.5, 0.5,
-4.263074, 2, -6.851694, 0, 1.5, 0.5, 0.5
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
-3.713764, -3.564518, -4,
-3.713764, -3.564518, 4,
-3.713764, -3.564518, -4,
-3.896867, -3.747405, -4,
-3.713764, -3.564518, -2,
-3.896867, -3.747405, -2,
-3.713764, -3.564518, 0,
-3.896867, -3.747405, 0,
-3.713764, -3.564518, 2,
-3.896867, -3.747405, 2,
-3.713764, -3.564518, 4,
-3.896867, -3.747405, 4
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
-4.263074, -4.11318, -4, 0, -0.5, 0.5, 0.5,
-4.263074, -4.11318, -4, 1, -0.5, 0.5, 0.5,
-4.263074, -4.11318, -4, 1, 1.5, 0.5, 0.5,
-4.263074, -4.11318, -4, 0, 1.5, 0.5, 0.5,
-4.263074, -4.11318, -2, 0, -0.5, 0.5, 0.5,
-4.263074, -4.11318, -2, 1, -0.5, 0.5, 0.5,
-4.263074, -4.11318, -2, 1, 1.5, 0.5, 0.5,
-4.263074, -4.11318, -2, 0, 1.5, 0.5, 0.5,
-4.263074, -4.11318, 0, 0, -0.5, 0.5, 0.5,
-4.263074, -4.11318, 0, 1, -0.5, 0.5, 0.5,
-4.263074, -4.11318, 0, 1, 1.5, 0.5, 0.5,
-4.263074, -4.11318, 0, 0, 1.5, 0.5, 0.5,
-4.263074, -4.11318, 2, 0, -0.5, 0.5, 0.5,
-4.263074, -4.11318, 2, 1, -0.5, 0.5, 0.5,
-4.263074, -4.11318, 2, 1, 1.5, 0.5, 0.5,
-4.263074, -4.11318, 2, 0, 1.5, 0.5, 0.5,
-4.263074, -4.11318, 4, 0, -0.5, 0.5, 0.5,
-4.263074, -4.11318, 4, 1, -0.5, 0.5, 0.5,
-4.263074, -4.11318, 4, 1, 1.5, 0.5, 0.5,
-4.263074, -4.11318, 4, 0, 1.5, 0.5, 0.5
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
-3.713764, -3.564518, -6.018029,
-3.713764, 3.750981, -6.018029,
-3.713764, -3.564518, 5.097502,
-3.713764, 3.750981, 5.097502,
-3.713764, -3.564518, -6.018029,
-3.713764, -3.564518, 5.097502,
-3.713764, 3.750981, -6.018029,
-3.713764, 3.750981, 5.097502,
-3.713764, -3.564518, -6.018029,
3.610378, -3.564518, -6.018029,
-3.713764, -3.564518, 5.097502,
3.610378, -3.564518, 5.097502,
-3.713764, 3.750981, -6.018029,
3.610378, 3.750981, -6.018029,
-3.713764, 3.750981, 5.097502,
3.610378, 3.750981, 5.097502,
3.610378, -3.564518, -6.018029,
3.610378, 3.750981, -6.018029,
3.610378, -3.564518, 5.097502,
3.610378, 3.750981, 5.097502,
3.610378, -3.564518, -6.018029,
3.610378, -3.564518, 5.097502,
3.610378, 3.750981, -6.018029,
3.610378, 3.750981, 5.097502
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
var radius = 8.110787;
var distance = 36.08581;
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
mvMatrix.translate( 0.05169296, -0.09323168, 0.4602633 );
mvMatrix.scale( 1.197347, 1.198762, 0.788945 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.08581);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
trimorfamid<-read.table("trimorfamid.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-trimorfamid$V2
```

```
## Error in eval(expr, envir, enclos): object 'trimorfamid' not found
```

```r
y<-trimorfamid$V3
```

```
## Error in eval(expr, envir, enclos): object 'trimorfamid' not found
```

```r
z<-trimorfamid$V4
```

```
## Error in eval(expr, envir, enclos): object 'trimorfamid' not found
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
-3.607101, 0.4004445, -0.5181473, 0, 0, 1, 1, 1,
-3.239104, -1.041853, -2.35232, 1, 0, 0, 1, 1,
-3.16504, 2.121169, 0.01725537, 1, 0, 0, 1, 1,
-2.994272, -0.8218434, -2.330148, 1, 0, 0, 1, 1,
-2.760922, -0.126587, -1.135807, 1, 0, 0, 1, 1,
-2.759159, -0.2938815, -0.7050425, 1, 0, 0, 1, 1,
-2.742342, -0.3356858, 0.5581955, 0, 0, 0, 1, 1,
-2.670139, 0.7361059, -1.201426, 0, 0, 0, 1, 1,
-2.546501, -0.1967687, -2.276153, 0, 0, 0, 1, 1,
-2.446608, 0.2065355, -1.431376, 0, 0, 0, 1, 1,
-2.434184, 0.3357084, -4.103979, 0, 0, 0, 1, 1,
-2.404119, -0.08803096, -0.3825287, 0, 0, 0, 1, 1,
-2.39841, 0.1789851, -2.40187, 0, 0, 0, 1, 1,
-2.372679, 0.09734194, -2.026454, 1, 1, 1, 1, 1,
-2.356993, -0.539939, -2.127905, 1, 1, 1, 1, 1,
-2.337079, 1.468719, -1.421988, 1, 1, 1, 1, 1,
-2.205616, 0.01877959, -2.332321, 1, 1, 1, 1, 1,
-2.202727, 0.7409924, -0.5992398, 1, 1, 1, 1, 1,
-2.16021, -0.2536075, -1.231746, 1, 1, 1, 1, 1,
-2.14412, -0.702933, -1.629861, 1, 1, 1, 1, 1,
-2.082266, -0.8796983, -1.946316, 1, 1, 1, 1, 1,
-2.05275, 0.5017088, -0.5106248, 1, 1, 1, 1, 1,
-2.023508, -0.6709713, -2.069847, 1, 1, 1, 1, 1,
-2.020735, -0.4585443, 0.8444811, 1, 1, 1, 1, 1,
-2.007672, -0.01551451, -1.80461, 1, 1, 1, 1, 1,
-1.979951, 1.450943, -0.4836662, 1, 1, 1, 1, 1,
-1.977872, 1.178373, -0.1243909, 1, 1, 1, 1, 1,
-1.977726, -0.7039322, -4.725148, 1, 1, 1, 1, 1,
-1.944611, 1.253145, -0.3491133, 0, 0, 1, 1, 1,
-1.933079, -0.3957008, -0.8566923, 1, 0, 0, 1, 1,
-1.931882, -1.454049, -1.290918, 1, 0, 0, 1, 1,
-1.916719, -1.129126, -1.086091, 1, 0, 0, 1, 1,
-1.873049, -0.6260941, -2.451507, 1, 0, 0, 1, 1,
-1.869928, -1.099924, -2.828383, 1, 0, 0, 1, 1,
-1.83513, -0.8545975, -1.5956, 0, 0, 0, 1, 1,
-1.807677, -2.047565, -3.744116, 0, 0, 0, 1, 1,
-1.79619, -0.5512755, -2.054447, 0, 0, 0, 1, 1,
-1.778533, -0.09391766, -1.987473, 0, 0, 0, 1, 1,
-1.772939, -0.1317986, -1.869111, 0, 0, 0, 1, 1,
-1.772394, -0.9231945, -3.718469, 0, 0, 0, 1, 1,
-1.7717, 0.7292255, -2.110236, 0, 0, 0, 1, 1,
-1.760998, 0.8200088, -0.7044576, 1, 1, 1, 1, 1,
-1.731, -1.68069, -1.228728, 1, 1, 1, 1, 1,
-1.727102, 0.746265, -1.495019, 1, 1, 1, 1, 1,
-1.724939, 2.230591, -0.08125436, 1, 1, 1, 1, 1,
-1.718896, 0.5852094, -0.3951144, 1, 1, 1, 1, 1,
-1.69509, -0.4809443, -2.290525, 1, 1, 1, 1, 1,
-1.662785, 0.6060285, -1.668427, 1, 1, 1, 1, 1,
-1.657207, -0.2796827, 0.8587008, 1, 1, 1, 1, 1,
-1.631661, -0.1635487, -2.095791, 1, 1, 1, 1, 1,
-1.625484, 0.1099428, -1.235295, 1, 1, 1, 1, 1,
-1.621569, 0.8903049, 0.3455699, 1, 1, 1, 1, 1,
-1.614169, 0.7413461, -1.500539, 1, 1, 1, 1, 1,
-1.611267, 0.4298308, 1.02849, 1, 1, 1, 1, 1,
-1.604006, -1.219106, -0.787771, 1, 1, 1, 1, 1,
-1.589521, 0.09120582, 0.8716173, 1, 1, 1, 1, 1,
-1.572572, -2.04978, -1.624016, 0, 0, 1, 1, 1,
-1.570601, -0.5758297, -2.004139, 1, 0, 0, 1, 1,
-1.529073, -0.476055, -0.04740731, 1, 0, 0, 1, 1,
-1.519074, -0.2737918, -2.946869, 1, 0, 0, 1, 1,
-1.514264, 0.8451796, -0.5540534, 1, 0, 0, 1, 1,
-1.513845, 0.4082833, 0.06655368, 1, 0, 0, 1, 1,
-1.512283, 0.2910036, 0.1292353, 0, 0, 0, 1, 1,
-1.510831, -0.3646228, -1.366821, 0, 0, 0, 1, 1,
-1.506551, 0.9957275, -0.2933571, 0, 0, 0, 1, 1,
-1.505949, 0.2119558, -2.698327, 0, 0, 0, 1, 1,
-1.505622, -0.2508897, -0.5793704, 0, 0, 0, 1, 1,
-1.491321, -0.2292042, -2.416615, 0, 0, 0, 1, 1,
-1.487382, 0.7574113, -1.2212, 0, 0, 0, 1, 1,
-1.484533, -0.8118439, -0.5447063, 1, 1, 1, 1, 1,
-1.479237, -1.044571, -1.822931, 1, 1, 1, 1, 1,
-1.47886, 1.232071, 0.8968221, 1, 1, 1, 1, 1,
-1.470007, 2.500668, -1.490259, 1, 1, 1, 1, 1,
-1.463053, -1.211176, -1.953879, 1, 1, 1, 1, 1,
-1.452856, -1.281715, -2.35147, 1, 1, 1, 1, 1,
-1.449932, 0.8888711, -1.407396, 1, 1, 1, 1, 1,
-1.431996, -1.006525, -0.8417332, 1, 1, 1, 1, 1,
-1.420324, -0.6537107, -2.15484, 1, 1, 1, 1, 1,
-1.411019, -1.358579, -3.724181, 1, 1, 1, 1, 1,
-1.403126, 0.8450734, -0.4908173, 1, 1, 1, 1, 1,
-1.391529, -1.486327, -2.515174, 1, 1, 1, 1, 1,
-1.378316, -1.396638, -3.264567, 1, 1, 1, 1, 1,
-1.377821, 0.4174485, -2.006726, 1, 1, 1, 1, 1,
-1.373685, 1.058381, -3.089361, 1, 1, 1, 1, 1,
-1.362216, -0.8886142, -1.827089, 0, 0, 1, 1, 1,
-1.351171, -1.286786, -3.604072, 1, 0, 0, 1, 1,
-1.338782, 0.6807929, -0.6582974, 1, 0, 0, 1, 1,
-1.336178, 0.9668587, 0.535418, 1, 0, 0, 1, 1,
-1.319736, 0.01373987, -1.231007, 1, 0, 0, 1, 1,
-1.315914, -0.1075138, -0.8681952, 1, 0, 0, 1, 1,
-1.313792, 1.509928, -0.5317653, 0, 0, 0, 1, 1,
-1.311726, -0.50087, -2.504868, 0, 0, 0, 1, 1,
-1.311489, -0.5763978, -1.092864, 0, 0, 0, 1, 1,
-1.310387, -2.744482, -2.691828, 0, 0, 0, 1, 1,
-1.307348, -1.423583, -2.520374, 0, 0, 0, 1, 1,
-1.301122, 1.098981, -1.939909, 0, 0, 0, 1, 1,
-1.300209, -0.7258725, 1.312111, 0, 0, 0, 1, 1,
-1.297654, -0.9555808, -4.122838, 1, 1, 1, 1, 1,
-1.292218, -1.342408, -1.171046, 1, 1, 1, 1, 1,
-1.287546, -0.6614074, -3.679632, 1, 1, 1, 1, 1,
-1.283804, -1.186651, -4.050882, 1, 1, 1, 1, 1,
-1.27924, 0.6252671, -0.8464256, 1, 1, 1, 1, 1,
-1.278835, -2.741475, -2.531729, 1, 1, 1, 1, 1,
-1.275436, 1.009901, -0.02101017, 1, 1, 1, 1, 1,
-1.263864, 2.006077, -1.658571, 1, 1, 1, 1, 1,
-1.258539, -2.069862, -1.541964, 1, 1, 1, 1, 1,
-1.256155, -1.777478, -2.494548, 1, 1, 1, 1, 1,
-1.253262, -0.05441336, -1.552901, 1, 1, 1, 1, 1,
-1.249346, -1.551568, -2.744325, 1, 1, 1, 1, 1,
-1.24864, 1.109229, -1.846203, 1, 1, 1, 1, 1,
-1.23205, 0.1967433, -2.726003, 1, 1, 1, 1, 1,
-1.229848, -0.312833, -1.603919, 1, 1, 1, 1, 1,
-1.228581, 0.04311918, -3.212723, 0, 0, 1, 1, 1,
-1.220466, 0.2603877, -1.170939, 1, 0, 0, 1, 1,
-1.217686, -1.36782, -1.918296, 1, 0, 0, 1, 1,
-1.21701, 0.6083234, -2.024055, 1, 0, 0, 1, 1,
-1.208839, 0.6106831, -1.327783, 1, 0, 0, 1, 1,
-1.206833, 1.511561, -0.8326554, 1, 0, 0, 1, 1,
-1.206185, 1.305467, -0.461804, 0, 0, 0, 1, 1,
-1.199647, 1.024769, -1.650402, 0, 0, 0, 1, 1,
-1.196668, 0.7627708, -0.9938244, 0, 0, 0, 1, 1,
-1.195688, -0.5514548, -2.597376, 0, 0, 0, 1, 1,
-1.184733, -1.023196, -1.924685, 0, 0, 0, 1, 1,
-1.183107, -2.761702, -2.058594, 0, 0, 0, 1, 1,
-1.168525, 0.2130942, -1.166454, 0, 0, 0, 1, 1,
-1.167247, 1.454176, -1.526866, 1, 1, 1, 1, 1,
-1.161124, -2.20903, -1.16398, 1, 1, 1, 1, 1,
-1.160661, -0.7499384, -1.260234, 1, 1, 1, 1, 1,
-1.1462, 0.00649202, -0.5534098, 1, 1, 1, 1, 1,
-1.141444, -0.7035436, -0.6416944, 1, 1, 1, 1, 1,
-1.141439, -0.1383201, -0.5097777, 1, 1, 1, 1, 1,
-1.136262, 0.4201846, -3.074721, 1, 1, 1, 1, 1,
-1.127721, 0.1505113, -1.033478, 1, 1, 1, 1, 1,
-1.114551, -0.1700538, -1.710923, 1, 1, 1, 1, 1,
-1.114114, -0.7177683, -1.165059, 1, 1, 1, 1, 1,
-1.102937, -2.34217, -2.545392, 1, 1, 1, 1, 1,
-1.099574, -0.7922834, -4.430546, 1, 1, 1, 1, 1,
-1.086393, 0.4738448, -2.289562, 1, 1, 1, 1, 1,
-1.073797, 0.5221455, -0.837078, 1, 1, 1, 1, 1,
-1.070661, 0.03021081, -0.1483237, 1, 1, 1, 1, 1,
-1.067132, 0.4104489, -1.533913, 0, 0, 1, 1, 1,
-1.063688, 2.081052, -0.347306, 1, 0, 0, 1, 1,
-1.057528, 1.048218, -1.877677, 1, 0, 0, 1, 1,
-1.057276, 0.8137558, -2.331928, 1, 0, 0, 1, 1,
-1.053328, 1.117679, -2.102565, 1, 0, 0, 1, 1,
-1.050072, -2.670879, -2.577334, 1, 0, 0, 1, 1,
-1.041267, -0.5759349, -3.915748, 0, 0, 0, 1, 1,
-1.036419, -0.463476, -1.664423, 0, 0, 0, 1, 1,
-1.024302, -0.6553825, -1.955813, 0, 0, 0, 1, 1,
-1.022709, 0.3663602, -2.499739, 0, 0, 0, 1, 1,
-1.022081, 0.2849539, -0.8562466, 0, 0, 0, 1, 1,
-1.020665, -1.694511, -2.667559, 0, 0, 0, 1, 1,
-1.011189, 0.2710132, -0.7006972, 0, 0, 0, 1, 1,
-1.008708, 0.9680383, 0.2926424, 1, 1, 1, 1, 1,
-1.008257, -1.169677, -2.474935, 1, 1, 1, 1, 1,
-0.993166, 0.1360077, -2.455853, 1, 1, 1, 1, 1,
-0.9930569, -0.3424705, -1.849899, 1, 1, 1, 1, 1,
-0.992525, -0.9974522, -2.748114, 1, 1, 1, 1, 1,
-0.9914536, -0.05010096, -0.7906729, 1, 1, 1, 1, 1,
-0.9883692, 0.1774538, -1.606185, 1, 1, 1, 1, 1,
-0.9875026, -0.1489656, -3.195096, 1, 1, 1, 1, 1,
-0.9872695, 1.017896, -0.4625421, 1, 1, 1, 1, 1,
-0.9869785, 1.829163, -2.055137, 1, 1, 1, 1, 1,
-0.9800493, -0.8265728, -1.210882, 1, 1, 1, 1, 1,
-0.9720559, 1.014168, 0.7241098, 1, 1, 1, 1, 1,
-0.9670692, -3.457981, -2.954435, 1, 1, 1, 1, 1,
-0.9647781, 0.001059154, -0.5303074, 1, 1, 1, 1, 1,
-0.9581642, -1.255409, -1.906265, 1, 1, 1, 1, 1,
-0.9566613, -0.8778105, -1.593449, 0, 0, 1, 1, 1,
-0.9566577, -0.6665928, -1.645961, 1, 0, 0, 1, 1,
-0.9528655, 2.149907, -0.1803759, 1, 0, 0, 1, 1,
-0.9526564, 2.090018, -0.2047717, 1, 0, 0, 1, 1,
-0.9505285, -0.6833283, -1.74787, 1, 0, 0, 1, 1,
-0.9440298, -0.1770139, -2.651917, 1, 0, 0, 1, 1,
-0.9410163, -0.9979085, -1.570966, 0, 0, 0, 1, 1,
-0.9402824, 0.7917059, -0.761747, 0, 0, 0, 1, 1,
-0.9399212, 0.8368465, -1.464855, 0, 0, 0, 1, 1,
-0.9289539, 0.1993882, -1.505575, 0, 0, 0, 1, 1,
-0.9265866, 0.7109683, 0.05401639, 0, 0, 0, 1, 1,
-0.9189324, 0.9773988, -2.470812, 0, 0, 0, 1, 1,
-0.916792, -0.1388892, -1.279349, 0, 0, 0, 1, 1,
-0.9158239, 1.186795, -1.232484, 1, 1, 1, 1, 1,
-0.9120229, -1.323561, -2.660075, 1, 1, 1, 1, 1,
-0.911018, 0.4794835, 1.600205, 1, 1, 1, 1, 1,
-0.9100378, 1.407253, 0.2694657, 1, 1, 1, 1, 1,
-0.9073566, 0.8839803, -0.8066639, 1, 1, 1, 1, 1,
-0.9015027, -2.825092, -3.468362, 1, 1, 1, 1, 1,
-0.9014288, -0.7469289, -2.002626, 1, 1, 1, 1, 1,
-0.9004326, 0.4989691, -1.732255, 1, 1, 1, 1, 1,
-0.8928101, 0.3405776, -0.8675624, 1, 1, 1, 1, 1,
-0.8890877, -0.1358896, -2.293385, 1, 1, 1, 1, 1,
-0.8858575, -1.324728, -1.795317, 1, 1, 1, 1, 1,
-0.8839316, -0.2443522, -0.6681887, 1, 1, 1, 1, 1,
-0.8802297, -0.243105, -1.940184, 1, 1, 1, 1, 1,
-0.8772634, -0.5588747, -2.986053, 1, 1, 1, 1, 1,
-0.8716675, 0.063316, -2.223112, 1, 1, 1, 1, 1,
-0.8679541, 1.933419, -2.590906, 0, 0, 1, 1, 1,
-0.8628027, -0.5690241, -2.285349, 1, 0, 0, 1, 1,
-0.8619216, 0.2483781, -0.7820512, 1, 0, 0, 1, 1,
-0.8596151, -0.578697, -2.78373, 1, 0, 0, 1, 1,
-0.8591517, 1.77332, -0.9653968, 1, 0, 0, 1, 1,
-0.8583199, 1.261326, -0.3237194, 1, 0, 0, 1, 1,
-0.8557703, -1.342038, -2.799115, 0, 0, 0, 1, 1,
-0.8555695, 0.6167487, -0.2052489, 0, 0, 0, 1, 1,
-0.8527519, 2.100612, 0.6002407, 0, 0, 0, 1, 1,
-0.8500019, -0.5084155, -0.821725, 0, 0, 0, 1, 1,
-0.8498866, -0.8473826, -3.616025, 0, 0, 0, 1, 1,
-0.8492263, -0.4526978, -2.158315, 0, 0, 0, 1, 1,
-0.843331, 0.1333472, -0.9955632, 0, 0, 0, 1, 1,
-0.8339601, -1.249, -2.617928, 1, 1, 1, 1, 1,
-0.8285245, -0.1745207, -0.5521948, 1, 1, 1, 1, 1,
-0.8280813, 0.4621951, -0.5376432, 1, 1, 1, 1, 1,
-0.8255318, 0.5623163, -1.827484, 1, 1, 1, 1, 1,
-0.8205722, -0.5633711, -1.533773, 1, 1, 1, 1, 1,
-0.8104562, -0.3187935, -2.377001, 1, 1, 1, 1, 1,
-0.8035038, 0.6473906, -0.8297436, 1, 1, 1, 1, 1,
-0.803367, -1.153332, -2.455487, 1, 1, 1, 1, 1,
-0.8001658, -0.1798442, -1.397246, 1, 1, 1, 1, 1,
-0.7982954, -0.3281299, -1.363208, 1, 1, 1, 1, 1,
-0.7948695, -1.268359, -1.492581, 1, 1, 1, 1, 1,
-0.7939273, -0.6096302, -1.496343, 1, 1, 1, 1, 1,
-0.7865397, 0.4332579, -2.154759, 1, 1, 1, 1, 1,
-0.7863435, 0.2013228, -1.650932, 1, 1, 1, 1, 1,
-0.7853962, 1.315108, -0.6801695, 1, 1, 1, 1, 1,
-0.7639248, -0.2164645, -2.516063, 0, 0, 1, 1, 1,
-0.7598606, 0.6663722, 0.4816815, 1, 0, 0, 1, 1,
-0.758968, -0.5891228, -1.479987, 1, 0, 0, 1, 1,
-0.7554594, -0.6830195, -2.58999, 1, 0, 0, 1, 1,
-0.7502142, 1.098088, -1.229274, 1, 0, 0, 1, 1,
-0.7449785, 1.041762, -0.09609657, 1, 0, 0, 1, 1,
-0.743156, -0.533879, -1.851514, 0, 0, 0, 1, 1,
-0.7424327, -1.026798, -1.89035, 0, 0, 0, 1, 1,
-0.7398895, -0.8696117, -1.349924, 0, 0, 0, 1, 1,
-0.7394246, 1.068248, -0.3645768, 0, 0, 0, 1, 1,
-0.7375122, -0.5017434, -3.107842, 0, 0, 0, 1, 1,
-0.7374355, 0.7889096, -0.295599, 0, 0, 0, 1, 1,
-0.7305757, 0.601976, -2.248807, 0, 0, 0, 1, 1,
-0.7245689, -0.161907, -1.62604, 1, 1, 1, 1, 1,
-0.7227282, -0.9415228, -2.711533, 1, 1, 1, 1, 1,
-0.7209066, -0.6408148, -4.836708, 1, 1, 1, 1, 1,
-0.7169387, -0.1901856, -2.2828, 1, 1, 1, 1, 1,
-0.7167624, -2.23579, -2.81498, 1, 1, 1, 1, 1,
-0.716268, 0.6048481, -1.613436, 1, 1, 1, 1, 1,
-0.7157249, -0.389298, -0.01541475, 1, 1, 1, 1, 1,
-0.7155516, 1.348071, 0.3146406, 1, 1, 1, 1, 1,
-0.7136813, -0.8326378, -3.510942, 1, 1, 1, 1, 1,
-0.7126162, 0.5730262, -0.7863852, 1, 1, 1, 1, 1,
-0.711679, -0.2163862, -1.535365, 1, 1, 1, 1, 1,
-0.7116576, -0.580521, -3.582098, 1, 1, 1, 1, 1,
-0.7052178, 1.230834, -1.025159, 1, 1, 1, 1, 1,
-0.6976077, 0.549615, -1.233171, 1, 1, 1, 1, 1,
-0.6959543, 2.048709, -1.689101, 1, 1, 1, 1, 1,
-0.6948795, 0.9472412, -0.7820677, 0, 0, 1, 1, 1,
-0.6885408, 0.1164138, -1.526704, 1, 0, 0, 1, 1,
-0.6818649, -0.2138542, -0.9140118, 1, 0, 0, 1, 1,
-0.6816405, 0.6125033, -1.383058, 1, 0, 0, 1, 1,
-0.6808382, 1.931783, 0.02787812, 1, 0, 0, 1, 1,
-0.671166, 1.167912, -1.469348, 1, 0, 0, 1, 1,
-0.6689556, -2.313539, -2.169676, 0, 0, 0, 1, 1,
-0.6680611, 0.09088872, -1.588292, 0, 0, 0, 1, 1,
-0.6620381, -0.0009908207, -2.970561, 0, 0, 0, 1, 1,
-0.6611781, 0.8076891, -0.5240669, 0, 0, 0, 1, 1,
-0.6610218, -0.4986413, -1.713761, 0, 0, 0, 1, 1,
-0.6589952, 0.8451994, -0.3523928, 0, 0, 0, 1, 1,
-0.651424, -1.683542, -3.65, 0, 0, 0, 1, 1,
-0.6411072, -1.267821, -2.773763, 1, 1, 1, 1, 1,
-0.6354931, -0.4446853, -3.142893, 1, 1, 1, 1, 1,
-0.6341907, -1.7164, -3.504884, 1, 1, 1, 1, 1,
-0.6337139, 1.462374, -2.633609, 1, 1, 1, 1, 1,
-0.6240308, 1.199236, -0.7059053, 1, 1, 1, 1, 1,
-0.6205755, 1.078456, 0.2342847, 1, 1, 1, 1, 1,
-0.619056, 0.9599294, -3.509079, 1, 1, 1, 1, 1,
-0.6103964, 2.014123, -0.5704923, 1, 1, 1, 1, 1,
-0.610208, 0.3130394, -0.8186055, 1, 1, 1, 1, 1,
-0.6088391, -0.1645987, -2.754353, 1, 1, 1, 1, 1,
-0.601499, -0.3411784, -2.092884, 1, 1, 1, 1, 1,
-0.5977683, -1.130879, -4.147726, 1, 1, 1, 1, 1,
-0.5938575, 0.2756283, 1.872385, 1, 1, 1, 1, 1,
-0.5932875, -0.745025, -3.078357, 1, 1, 1, 1, 1,
-0.5923491, 0.8664423, -1.534009, 1, 1, 1, 1, 1,
-0.5917711, -1.500457, -2.810049, 0, 0, 1, 1, 1,
-0.5874476, -0.9420583, -2.890004, 1, 0, 0, 1, 1,
-0.5872669, 0.0286564, -1.160437, 1, 0, 0, 1, 1,
-0.5862589, 1.12817, -1.540587, 1, 0, 0, 1, 1,
-0.5841165, -2.400593, -2.832019, 1, 0, 0, 1, 1,
-0.5805714, -0.06837054, -0.05247817, 1, 0, 0, 1, 1,
-0.5796236, -0.1995919, -2.885982, 0, 0, 0, 1, 1,
-0.576277, 0.4554724, 0.217323, 0, 0, 0, 1, 1,
-0.5726674, -0.767022, -2.19118, 0, 0, 0, 1, 1,
-0.572554, -0.8874741, -1.790409, 0, 0, 0, 1, 1,
-0.5725295, 0.05135145, -0.4897021, 0, 0, 0, 1, 1,
-0.5686149, -1.472378, -2.889307, 0, 0, 0, 1, 1,
-0.5657068, 0.663687, 0.328431, 0, 0, 0, 1, 1,
-0.5642266, 0.1117289, 0.1285335, 1, 1, 1, 1, 1,
-0.5616204, -0.1726138, 0.865315, 1, 1, 1, 1, 1,
-0.5609635, 0.3121022, -1.065438, 1, 1, 1, 1, 1,
-0.5602171, -1.516193, -2.330184, 1, 1, 1, 1, 1,
-0.5520971, -0.6604638, -4.089957, 1, 1, 1, 1, 1,
-0.5517902, 0.2735974, -1.772143, 1, 1, 1, 1, 1,
-0.5504636, 1.031894, -0.3377931, 1, 1, 1, 1, 1,
-0.5490014, -1.370178, -2.806451, 1, 1, 1, 1, 1,
-0.5473471, -0.5197923, -1.660663, 1, 1, 1, 1, 1,
-0.5455292, 1.866847, -1.594185, 1, 1, 1, 1, 1,
-0.5372975, -2.756753, -2.714152, 1, 1, 1, 1, 1,
-0.5343202, -1.098471, -1.924108, 1, 1, 1, 1, 1,
-0.5327107, -0.08958108, -1.45163, 1, 1, 1, 1, 1,
-0.5325959, -0.07885924, -1.42873, 1, 1, 1, 1, 1,
-0.5310665, -1.140788, -2.483064, 1, 1, 1, 1, 1,
-0.5294785, -0.7731749, -2.662654, 0, 0, 1, 1, 1,
-0.5214108, -1.531612, -3.815091, 1, 0, 0, 1, 1,
-0.5164912, 1.242924, -2.506985, 1, 0, 0, 1, 1,
-0.5162375, -0.274613, -0.9257488, 1, 0, 0, 1, 1,
-0.5161173, 2.091303, -0.2558207, 1, 0, 0, 1, 1,
-0.5127457, 0.6302449, -1.036519, 1, 0, 0, 1, 1,
-0.5093699, 0.06363524, -2.919841, 0, 0, 0, 1, 1,
-0.5089332, 0.8259453, 0.2296394, 0, 0, 0, 1, 1,
-0.5088177, -1.0893, -2.973313, 0, 0, 0, 1, 1,
-0.5063401, -1.631689, -2.481593, 0, 0, 0, 1, 1,
-0.5021203, 0.3076439, -1.129701, 0, 0, 0, 1, 1,
-0.5004636, -0.845888, -1.583761, 0, 0, 0, 1, 1,
-0.4975125, -0.4805546, -3.519844, 0, 0, 0, 1, 1,
-0.4952075, -0.1291524, -1.498374, 1, 1, 1, 1, 1,
-0.4884514, 0.03632063, -2.024356, 1, 1, 1, 1, 1,
-0.4873173, 1.253746, 0.7960294, 1, 1, 1, 1, 1,
-0.4834486, -0.9518731, -1.687891, 1, 1, 1, 1, 1,
-0.4791583, 0.9133209, 1.648095, 1, 1, 1, 1, 1,
-0.4791301, 1.572357, 0.1843411, 1, 1, 1, 1, 1,
-0.4782521, -0.08888604, -1.552739, 1, 1, 1, 1, 1,
-0.4736238, 0.3612466, -0.2273419, 1, 1, 1, 1, 1,
-0.4723406, -1.524213, -3.608103, 1, 1, 1, 1, 1,
-0.4715133, -1.110815, -2.073159, 1, 1, 1, 1, 1,
-0.4661186, 1.769055, -0.5139568, 1, 1, 1, 1, 1,
-0.4622409, 0.5371584, -0.4721698, 1, 1, 1, 1, 1,
-0.4592505, -0.6994223, -4.199813, 1, 1, 1, 1, 1,
-0.4538597, -0.4195496, -2.059325, 1, 1, 1, 1, 1,
-0.4506185, -0.5608171, -0.3842771, 1, 1, 1, 1, 1,
-0.4497094, -0.02551345, -0.1747923, 0, 0, 1, 1, 1,
-0.4471372, -1.116177, -4.422771, 1, 0, 0, 1, 1,
-0.4419864, -0.500001, -3.004285, 1, 0, 0, 1, 1,
-0.4382837, -1.059622, -5.046675, 1, 0, 0, 1, 1,
-0.4381508, 0.2643026, -1.399274, 1, 0, 0, 1, 1,
-0.4377275, -0.1671806, -2.072437, 1, 0, 0, 1, 1,
-0.4296857, 0.1338389, -3.030349, 0, 0, 0, 1, 1,
-0.424085, 1.974705, -1.187952, 0, 0, 0, 1, 1,
-0.4226457, 0.8268643, 0.0209423, 0, 0, 0, 1, 1,
-0.4223919, -1.443092, -3.530801, 0, 0, 0, 1, 1,
-0.4194089, 0.1717807, -0.5820209, 0, 0, 0, 1, 1,
-0.4110439, -0.5307287, -4.46564, 0, 0, 0, 1, 1,
-0.4104965, 1.142905, -0.5223572, 0, 0, 0, 1, 1,
-0.4092396, -0.007170742, -2.487393, 1, 1, 1, 1, 1,
-0.4052229, -0.1935173, -2.16999, 1, 1, 1, 1, 1,
-0.4000358, -0.2493233, -2.263508, 1, 1, 1, 1, 1,
-0.3987494, 0.1125276, -1.412234, 1, 1, 1, 1, 1,
-0.3942462, -1.234229, -3.096171, 1, 1, 1, 1, 1,
-0.3903508, 0.082619, 1.295957, 1, 1, 1, 1, 1,
-0.3891639, -0.1535108, -3.883181, 1, 1, 1, 1, 1,
-0.3862213, 0.8419894, -0.3746681, 1, 1, 1, 1, 1,
-0.3856428, -0.3623387, -0.8288658, 1, 1, 1, 1, 1,
-0.3826732, 0.2212512, 0.7022828, 1, 1, 1, 1, 1,
-0.3823766, -2.251963, -3.445086, 1, 1, 1, 1, 1,
-0.3779522, -0.04843898, -1.982697, 1, 1, 1, 1, 1,
-0.3760947, -0.8746125, -1.815056, 1, 1, 1, 1, 1,
-0.3735328, -2.23619, -0.6057206, 1, 1, 1, 1, 1,
-0.3724742, -1.27578, -2.961688, 1, 1, 1, 1, 1,
-0.371413, -1.261886, -4.786808, 0, 0, 1, 1, 1,
-0.3709352, -0.1360087, -1.746271, 1, 0, 0, 1, 1,
-0.3675087, 0.3295541, -1.515972, 1, 0, 0, 1, 1,
-0.3657469, 1.062704, -0.9258795, 1, 0, 0, 1, 1,
-0.3581543, -0.7297514, -1.637398, 1, 0, 0, 1, 1,
-0.3579093, -0.007468976, -1.101152, 1, 0, 0, 1, 1,
-0.3528019, -2.252361, -2.745058, 0, 0, 0, 1, 1,
-0.3509577, -0.7727363, -2.779719, 0, 0, 0, 1, 1,
-0.3485326, -1.365797, -1.959778, 0, 0, 0, 1, 1,
-0.3457582, 0.315122, 0.1228685, 0, 0, 0, 1, 1,
-0.3455974, -0.8761057, -4.341483, 0, 0, 0, 1, 1,
-0.3417866, 0.7222182, -0.8139979, 0, 0, 0, 1, 1,
-0.3395283, 0.5877126, 1.427832, 0, 0, 0, 1, 1,
-0.3355339, -1.367986, -3.662596, 1, 1, 1, 1, 1,
-0.3343477, 0.2011895, -0.9391147, 1, 1, 1, 1, 1,
-0.3312366, -1.850901, -4.526112, 1, 1, 1, 1, 1,
-0.329257, -0.2321538, -2.413102, 1, 1, 1, 1, 1,
-0.3290585, 0.1035162, -2.687478, 1, 1, 1, 1, 1,
-0.3267239, 0.4537234, -0.4199613, 1, 1, 1, 1, 1,
-0.3247518, -0.2039487, -2.407695, 1, 1, 1, 1, 1,
-0.3212883, -0.4519765, -4.60137, 1, 1, 1, 1, 1,
-0.3201149, 1.696821, -0.2631409, 1, 1, 1, 1, 1,
-0.3169534, 1.211915, -0.4427761, 1, 1, 1, 1, 1,
-0.3162017, -1.211134, -1.814777, 1, 1, 1, 1, 1,
-0.3105293, -0.09216799, -1.40115, 1, 1, 1, 1, 1,
-0.3048927, -2.014561, -2.138918, 1, 1, 1, 1, 1,
-0.3005708, -0.424422, -1.673843, 1, 1, 1, 1, 1,
-0.2974188, 1.05445, -0.9572041, 1, 1, 1, 1, 1,
-0.2941061, 0.363519, -1.332345, 0, 0, 1, 1, 1,
-0.2926607, -0.71955, -1.937408, 1, 0, 0, 1, 1,
-0.2912171, -0.009170725, -3.148073, 1, 0, 0, 1, 1,
-0.2873359, 0.3219793, -1.964666, 1, 0, 0, 1, 1,
-0.2838922, 0.1550886, -0.4120897, 1, 0, 0, 1, 1,
-0.2801175, -0.9434032, -0.6242113, 1, 0, 0, 1, 1,
-0.2786943, 0.4641197, -0.7326697, 0, 0, 0, 1, 1,
-0.2746564, -1.753195, -4.767177, 0, 0, 0, 1, 1,
-0.2687666, -1.903514, -4.895948, 0, 0, 0, 1, 1,
-0.2686634, 0.5528104, -0.8975596, 0, 0, 0, 1, 1,
-0.2678178, -2.377752, -2.933462, 0, 0, 0, 1, 1,
-0.2666584, -0.09164988, -2.046474, 0, 0, 0, 1, 1,
-0.2653414, 1.748211, 0.5214412, 0, 0, 0, 1, 1,
-0.2635851, 0.6547135, -0.1787864, 1, 1, 1, 1, 1,
-0.2630095, -1.020907, -3.599494, 1, 1, 1, 1, 1,
-0.2628385, 1.239266, -0.6423986, 1, 1, 1, 1, 1,
-0.2610415, -0.5967815, -2.787908, 1, 1, 1, 1, 1,
-0.2610212, -0.7676478, -2.793458, 1, 1, 1, 1, 1,
-0.2607575, -0.2796825, -1.931572, 1, 1, 1, 1, 1,
-0.2554738, 0.3235227, 0.3027204, 1, 1, 1, 1, 1,
-0.2546782, -1.543994, -3.067688, 1, 1, 1, 1, 1,
-0.2530363, 0.3548957, -1.989681, 1, 1, 1, 1, 1,
-0.2527975, 0.7750391, -0.8642277, 1, 1, 1, 1, 1,
-0.2527807, -1.072463, -3.726742, 1, 1, 1, 1, 1,
-0.2519947, 1.258897, 0.08523417, 1, 1, 1, 1, 1,
-0.2495977, 2.106971, -0.3619339, 1, 1, 1, 1, 1,
-0.243227, -0.3148408, -0.3693548, 1, 1, 1, 1, 1,
-0.2376015, 0.6186712, -0.077605, 1, 1, 1, 1, 1,
-0.2367199, -1.654418, -1.601271, 0, 0, 1, 1, 1,
-0.2356136, -0.1497375, -1.724886, 1, 0, 0, 1, 1,
-0.2351991, 0.2436672, -2.265712, 1, 0, 0, 1, 1,
-0.2318466, -0.2294651, -0.2222972, 1, 0, 0, 1, 1,
-0.2312109, -0.09915187, -2.194222, 1, 0, 0, 1, 1,
-0.2257842, 1.220639, -0.02905856, 1, 0, 0, 1, 1,
-0.2255024, 1.84544, 0.9598166, 0, 0, 0, 1, 1,
-0.2245566, -0.2093108, -2.20794, 0, 0, 0, 1, 1,
-0.2127058, -0.4027055, -2.380108, 0, 0, 0, 1, 1,
-0.2108074, -0.09546533, -2.135905, 0, 0, 0, 1, 1,
-0.2095782, 0.2803611, -0.4083741, 0, 0, 0, 1, 1,
-0.2081141, 1.179282, 0.3483325, 0, 0, 0, 1, 1,
-0.204069, 0.06588014, -1.196758, 0, 0, 0, 1, 1,
-0.2024109, -1.429549, -2.237769, 1, 1, 1, 1, 1,
-0.2017477, 0.8468571, 1.594198, 1, 1, 1, 1, 1,
-0.1955804, 0.08734273, -3.527625, 1, 1, 1, 1, 1,
-0.1930016, -0.4242061, -2.565734, 1, 1, 1, 1, 1,
-0.1918922, 0.5243031, 0.163463, 1, 1, 1, 1, 1,
-0.1816395, -1.294331, -2.585175, 1, 1, 1, 1, 1,
-0.1800776, 0.07939893, -1.823953, 1, 1, 1, 1, 1,
-0.1790219, 0.8591453, -0.5485089, 1, 1, 1, 1, 1,
-0.178437, 0.07042585, -1.581686, 1, 1, 1, 1, 1,
-0.1784249, -0.8972075, -5.856152, 1, 1, 1, 1, 1,
-0.174929, 1.112312, 0.9049823, 1, 1, 1, 1, 1,
-0.1662468, 0.8372788, -0.423564, 1, 1, 1, 1, 1,
-0.1641489, -1.183887, -3.533227, 1, 1, 1, 1, 1,
-0.1612061, 0.813561, -0.6782694, 1, 1, 1, 1, 1,
-0.1607022, -0.4888233, -1.15308, 1, 1, 1, 1, 1,
-0.1590421, 0.5638658, 0.1957758, 0, 0, 1, 1, 1,
-0.1581388, -0.564221, -2.401599, 1, 0, 0, 1, 1,
-0.153129, -1.597545, -2.832572, 1, 0, 0, 1, 1,
-0.1504315, -0.7291509, -0.4097362, 1, 0, 0, 1, 1,
-0.149705, 0.4827603, -1.592751, 1, 0, 0, 1, 1,
-0.1478399, -1.109194, -1.795693, 1, 0, 0, 1, 1,
-0.1455874, -1.450431, -4.453493, 0, 0, 0, 1, 1,
-0.1450821, 2.92043, -1.826088, 0, 0, 0, 1, 1,
-0.1440179, -1.412634, -2.989543, 0, 0, 0, 1, 1,
-0.1407023, 0.1373258, -1.007007, 0, 0, 0, 1, 1,
-0.1405741, 0.9501077, 0.45487, 0, 0, 0, 1, 1,
-0.1368333, 0.2568505, -0.1595074, 0, 0, 0, 1, 1,
-0.1311588, -0.2229663, -2.267855, 0, 0, 0, 1, 1,
-0.1307016, -1.639447, -4.876791, 1, 1, 1, 1, 1,
-0.1240179, -0.9275576, -3.539117, 1, 1, 1, 1, 1,
-0.1203021, -1.601731, -2.529904, 1, 1, 1, 1, 1,
-0.1119816, 1.258364, 0.9787453, 1, 1, 1, 1, 1,
-0.1088359, 0.6309729, 0.2436555, 1, 1, 1, 1, 1,
-0.1031782, -0.8506462, -2.908594, 1, 1, 1, 1, 1,
-0.09666038, 1.922784, 1.651446, 1, 1, 1, 1, 1,
-0.0943728, -0.3200269, -1.433059, 1, 1, 1, 1, 1,
-0.09026364, -1.884661, -3.796358, 1, 1, 1, 1, 1,
-0.08879042, 0.6018804, -1.347301, 1, 1, 1, 1, 1,
-0.08708474, -0.729531, -3.018543, 1, 1, 1, 1, 1,
-0.0865823, -0.6392844, -3.547416, 1, 1, 1, 1, 1,
-0.08307689, 1.391299, -1.38882, 1, 1, 1, 1, 1,
-0.08253829, -1.176584, -3.772655, 1, 1, 1, 1, 1,
-0.08220543, -1.323317, -2.638916, 1, 1, 1, 1, 1,
-0.08109774, -1.850219, -1.405154, 0, 0, 1, 1, 1,
-0.07806422, -1.071027, -2.814879, 1, 0, 0, 1, 1,
-0.07762106, 0.551676, -1.015544, 1, 0, 0, 1, 1,
-0.0738403, 0.1890441, -0.3268604, 1, 0, 0, 1, 1,
-0.0711375, 0.4768229, -0.2306235, 1, 0, 0, 1, 1,
-0.06929138, -0.1233908, -1.929244, 1, 0, 0, 1, 1,
-0.06803901, 0.234874, -0.4395257, 0, 0, 0, 1, 1,
-0.06515077, 0.5992138, 1.357005, 0, 0, 0, 1, 1,
-0.06346649, 1.522882, 1.325565, 0, 0, 0, 1, 1,
-0.05930242, 0.6649023, 2.173043, 0, 0, 0, 1, 1,
-0.05893655, -1.702783, -4.058551, 0, 0, 0, 1, 1,
-0.05446871, -0.6231407, -2.304946, 0, 0, 0, 1, 1,
-0.04267438, -0.3298564, -2.006138, 0, 0, 0, 1, 1,
-0.04169804, 1.899693, 0.3380058, 1, 1, 1, 1, 1,
-0.04151309, -0.923833, -3.265394, 1, 1, 1, 1, 1,
-0.04055801, 1.063876, -0.518338, 1, 1, 1, 1, 1,
-0.03554799, -1.380844, -2.90674, 1, 1, 1, 1, 1,
-0.03365353, -0.3536747, -3.595893, 1, 1, 1, 1, 1,
-0.02948286, -0.7681085, -2.911382, 1, 1, 1, 1, 1,
-0.0268167, -0.0328492, -1.905364, 1, 1, 1, 1, 1,
-0.02529558, -0.05853523, -2.507951, 1, 1, 1, 1, 1,
-0.01427497, -0.3152381, -3.775383, 1, 1, 1, 1, 1,
-0.01186473, -1.355386, -1.207508, 1, 1, 1, 1, 1,
-0.009131853, -0.2056297, -3.68271, 1, 1, 1, 1, 1,
-0.004871983, 1.283461, -0.6319721, 1, 1, 1, 1, 1,
-0.004026402, 0.7477822, 0.4726377, 1, 1, 1, 1, 1,
-0.001559081, 0.8830789, -1.644691, 1, 1, 1, 1, 1,
0.0004293941, -1.280093, 1.606063, 1, 1, 1, 1, 1,
0.002378333, -2.093842, 2.972115, 0, 0, 1, 1, 1,
0.009423405, -1.132046, 0.00913547, 1, 0, 0, 1, 1,
0.01279046, -1.131708, 4.651219, 1, 0, 0, 1, 1,
0.01311433, -1.025651, 1.657031, 1, 0, 0, 1, 1,
0.01378552, -0.03763776, 1.860468, 1, 0, 0, 1, 1,
0.01448332, -0.01694195, 3.380739, 1, 0, 0, 1, 1,
0.01651299, -0.4255536, 2.845762, 0, 0, 0, 1, 1,
0.01843661, 1.173069, 1.002282, 0, 0, 0, 1, 1,
0.02264966, 0.9058282, -0.8928853, 0, 0, 0, 1, 1,
0.0240746, -0.1971337, 1.885898, 0, 0, 0, 1, 1,
0.02711235, 0.4432767, 1.633312, 0, 0, 0, 1, 1,
0.02842723, -0.6438953, 3.805383, 0, 0, 0, 1, 1,
0.03242724, -1.327782, 3.03769, 0, 0, 0, 1, 1,
0.03651499, -1.322764, 3.683355, 1, 1, 1, 1, 1,
0.04329706, -2.269226, 3.033836, 1, 1, 1, 1, 1,
0.04733941, 1.569217, 0.06079493, 1, 1, 1, 1, 1,
0.04860414, -0.3230045, 2.966799, 1, 1, 1, 1, 1,
0.05168897, 0.9600313, -0.3823366, 1, 1, 1, 1, 1,
0.05669117, -0.837215, 3.481062, 1, 1, 1, 1, 1,
0.06243234, -0.0860446, 1.506462, 1, 1, 1, 1, 1,
0.06705341, 0.5044914, 2.349646, 1, 1, 1, 1, 1,
0.06715584, -0.7852389, 4.064922, 1, 1, 1, 1, 1,
0.06798078, 1.674773, -0.1993019, 1, 1, 1, 1, 1,
0.06951811, 0.1523345, 0.4061267, 1, 1, 1, 1, 1,
0.07021628, 0.541702, -0.9936013, 1, 1, 1, 1, 1,
0.07050665, 0.3300644, 0.3799966, 1, 1, 1, 1, 1,
0.07156779, -0.1748997, 2.841046, 1, 1, 1, 1, 1,
0.07190327, 0.9634119, 1.761718, 1, 1, 1, 1, 1,
0.0776666, -0.8836019, 3.803021, 0, 0, 1, 1, 1,
0.07946611, -0.2873836, 3.938863, 1, 0, 0, 1, 1,
0.08705118, -0.6787328, 2.573375, 1, 0, 0, 1, 1,
0.08848205, -0.8675247, 1.751966, 1, 0, 0, 1, 1,
0.09868167, -0.0775414, 1.238268, 1, 0, 0, 1, 1,
0.09887248, 1.384454, 0.845391, 1, 0, 0, 1, 1,
0.1008926, -0.3316538, 4.229219, 0, 0, 0, 1, 1,
0.1031486, 1.78113, -2.320581, 0, 0, 0, 1, 1,
0.1034924, 0.9497119, -0.5273414, 0, 0, 0, 1, 1,
0.104937, 2.067086, -0.6221787, 0, 0, 0, 1, 1,
0.1089811, -0.9717886, 1.954608, 0, 0, 0, 1, 1,
0.111548, -0.9785201, 3.603133, 0, 0, 0, 1, 1,
0.1128884, -0.1725347, 3.761492, 0, 0, 0, 1, 1,
0.1149338, -0.1774746, 3.508003, 1, 1, 1, 1, 1,
0.1235733, -0.7291712, 2.632752, 1, 1, 1, 1, 1,
0.12547, 0.7361681, 0.6838807, 1, 1, 1, 1, 1,
0.1281429, -0.02785555, 2.199513, 1, 1, 1, 1, 1,
0.1313369, 0.7094206, 0.03018811, 1, 1, 1, 1, 1,
0.1357554, -0.7529218, 4.149991, 1, 1, 1, 1, 1,
0.1380057, -1.876149, 1.995088, 1, 1, 1, 1, 1,
0.1400929, -1.420159, 2.627843, 1, 1, 1, 1, 1,
0.1410026, 0.8307135, 0.7825649, 1, 1, 1, 1, 1,
0.1433199, 0.5568615, 2.04875, 1, 1, 1, 1, 1,
0.145667, -0.2373142, 1.308403, 1, 1, 1, 1, 1,
0.1469481, 0.0336611, 2.243941, 1, 1, 1, 1, 1,
0.1487136, -0.3367102, 3.346205, 1, 1, 1, 1, 1,
0.1548854, 0.6310238, 0.4687678, 1, 1, 1, 1, 1,
0.1569062, 0.2532828, 1.091156, 1, 1, 1, 1, 1,
0.163091, 0.4449903, -0.1039056, 0, 0, 1, 1, 1,
0.1647409, 1.772509, 0.281863, 1, 0, 0, 1, 1,
0.164847, -1.012387, 3.535012, 1, 0, 0, 1, 1,
0.1662223, 1.481445, -1.394237, 1, 0, 0, 1, 1,
0.1745741, -0.6901752, 2.71811, 1, 0, 0, 1, 1,
0.1827133, -0.629087, 1.481156, 1, 0, 0, 1, 1,
0.1834905, 0.4076096, 0.01937651, 0, 0, 0, 1, 1,
0.1842795, -0.2765923, 2.239217, 0, 0, 0, 1, 1,
0.1851725, 0.1218365, 2.894694, 0, 0, 0, 1, 1,
0.1862405, -0.3118031, 1.582074, 0, 0, 0, 1, 1,
0.1864549, -1.889349, 2.814737, 0, 0, 0, 1, 1,
0.189079, 1.016236, -0.04357019, 0, 0, 0, 1, 1,
0.18913, 0.3477491, -0.1567552, 0, 0, 0, 1, 1,
0.1892329, -0.219096, 4.762634, 1, 1, 1, 1, 1,
0.1901726, -1.169641, 4.463384, 1, 1, 1, 1, 1,
0.1919563, 0.6002789, -2.030958, 1, 1, 1, 1, 1,
0.1926689, 0.9560239, -1.617965, 1, 1, 1, 1, 1,
0.1936832, 0.2723719, -0.1042667, 1, 1, 1, 1, 1,
0.1938044, -0.09952169, 2.004828, 1, 1, 1, 1, 1,
0.198479, -1.366886, 2.843473, 1, 1, 1, 1, 1,
0.2003824, -1.248724, 1.584728, 1, 1, 1, 1, 1,
0.2044812, -0.6328854, 4.935626, 1, 1, 1, 1, 1,
0.2061523, -0.4485841, 4.183953, 1, 1, 1, 1, 1,
0.2092252, -0.8632743, 2.682571, 1, 1, 1, 1, 1,
0.2127248, 0.9368743, 0.209263, 1, 1, 1, 1, 1,
0.2154772, -1.26185, 4.2825, 1, 1, 1, 1, 1,
0.2215559, 0.3289708, 1.352484, 1, 1, 1, 1, 1,
0.2242639, 0.6797802, 1.425913, 1, 1, 1, 1, 1,
0.2308884, 0.1531856, 2.528838, 0, 0, 1, 1, 1,
0.2310885, -0.785125, 3.029577, 1, 0, 0, 1, 1,
0.2362581, -0.09164611, 2.206391, 1, 0, 0, 1, 1,
0.2416976, -0.7607228, 3.035667, 1, 0, 0, 1, 1,
0.2417288, 0.4720474, -1.014176, 1, 0, 0, 1, 1,
0.2480111, -1.557528, 2.955992, 1, 0, 0, 1, 1,
0.2498073, -0.6951928, -0.3051745, 0, 0, 0, 1, 1,
0.2552748, 0.777768, -0.146768, 0, 0, 0, 1, 1,
0.2621363, 0.03782275, 0.6669251, 0, 0, 0, 1, 1,
0.262317, 0.3796957, -0.4826301, 0, 0, 0, 1, 1,
0.2646364, -0.4467114, 2.767167, 0, 0, 0, 1, 1,
0.2658834, -1.057581, 1.725008, 0, 0, 0, 1, 1,
0.2691882, -0.4483236, 3.665551, 0, 0, 0, 1, 1,
0.2737516, -0.243486, 4.050916, 1, 1, 1, 1, 1,
0.2828897, -0.3782602, 2.842274, 1, 1, 1, 1, 1,
0.2838893, 0.6888832, -0.6157874, 1, 1, 1, 1, 1,
0.2864681, -1.366176, 3.426309, 1, 1, 1, 1, 1,
0.2886522, 0.7265257, 0.1171598, 1, 1, 1, 1, 1,
0.2898059, 0.08129754, 0.6811461, 1, 1, 1, 1, 1,
0.2899466, 0.5110785, 2.414949, 1, 1, 1, 1, 1,
0.298999, 0.07052863, 1.558761, 1, 1, 1, 1, 1,
0.3004864, -0.5706356, 3.166871, 1, 1, 1, 1, 1,
0.3057528, 2.545145, 0.2941278, 1, 1, 1, 1, 1,
0.313549, 0.05663763, 1.757737, 1, 1, 1, 1, 1,
0.3174377, 0.1427023, 1.59761, 1, 1, 1, 1, 1,
0.3177249, -1.001496, 2.561764, 1, 1, 1, 1, 1,
0.318006, 0.6937468, -0.02689777, 1, 1, 1, 1, 1,
0.3255253, -0.1009225, 1.897843, 1, 1, 1, 1, 1,
0.3265045, -1.569171, 2.463769, 0, 0, 1, 1, 1,
0.3268522, -0.302062, 2.181781, 1, 0, 0, 1, 1,
0.3273191, -0.5224165, 2.440088, 1, 0, 0, 1, 1,
0.3275025, 0.09898935, 1.180246, 1, 0, 0, 1, 1,
0.3281398, -1.017336, 2.978434, 1, 0, 0, 1, 1,
0.3287478, -0.5764017, 2.999265, 1, 0, 0, 1, 1,
0.3307099, 2.005308, -1.543621, 0, 0, 0, 1, 1,
0.3355316, 0.004220387, 1.969553, 0, 0, 0, 1, 1,
0.3453482, 0.5687856, -0.2134606, 0, 0, 0, 1, 1,
0.3457746, -1.170191, 2.485019, 0, 0, 0, 1, 1,
0.3480549, -0.7216935, 3.322632, 0, 0, 0, 1, 1,
0.3497889, -0.630689, 0.9677877, 0, 0, 0, 1, 1,
0.3510999, 1.023917, 0.03050004, 0, 0, 0, 1, 1,
0.352768, -0.4197125, 4.242798, 1, 1, 1, 1, 1,
0.354591, 1.874478, 0.7209029, 1, 1, 1, 1, 1,
0.3570672, 0.835045, -0.1345409, 1, 1, 1, 1, 1,
0.3579362, 0.06465798, 2.257167, 1, 1, 1, 1, 1,
0.362036, 2.014377, -0.698986, 1, 1, 1, 1, 1,
0.3702456, 0.7945967, 0.6472341, 1, 1, 1, 1, 1,
0.3712368, -0.1476207, 2.85107, 1, 1, 1, 1, 1,
0.3715071, -0.8728015, 3.250873, 1, 1, 1, 1, 1,
0.37633, 0.7944034, 0.7480617, 1, 1, 1, 1, 1,
0.3797222, 1.987325, 1.27587, 1, 1, 1, 1, 1,
0.3822472, 0.5667429, 0.8480115, 1, 1, 1, 1, 1,
0.3850273, 0.1462548, 2.497815, 1, 1, 1, 1, 1,
0.3854119, 0.4318688, -0.7262772, 1, 1, 1, 1, 1,
0.3857902, -0.2715639, 0.2579691, 1, 1, 1, 1, 1,
0.3879386, -0.07491191, 2.220593, 1, 1, 1, 1, 1,
0.3918387, -0.5738549, 3.839859, 0, 0, 1, 1, 1,
0.3954284, -1.96224, 3.11958, 1, 0, 0, 1, 1,
0.3956117, -0.4986922, 2.07029, 1, 0, 0, 1, 1,
0.3964396, -0.1257965, 1.712998, 1, 0, 0, 1, 1,
0.4004996, -0.05472692, 1.017732, 1, 0, 0, 1, 1,
0.4027939, -0.5875014, 1.91353, 1, 0, 0, 1, 1,
0.4057244, -0.7261837, 3.235857, 0, 0, 0, 1, 1,
0.4082439, -0.7017843, 2.203558, 0, 0, 0, 1, 1,
0.415646, 1.160335, -0.7432302, 0, 0, 0, 1, 1,
0.4209179, -0.4990324, 3.109124, 0, 0, 0, 1, 1,
0.4266922, 0.7014087, 1.344855, 0, 0, 0, 1, 1,
0.4281603, 0.7759246, 0.9390386, 0, 0, 0, 1, 1,
0.4319852, 0.04030382, 1.465568, 0, 0, 0, 1, 1,
0.4331585, -1.070901, 2.06804, 1, 1, 1, 1, 1,
0.4367143, -1.333812, 2.604555, 1, 1, 1, 1, 1,
0.4411309, 0.2244195, 2.427126, 1, 1, 1, 1, 1,
0.444004, -1.648994, 1.826053, 1, 1, 1, 1, 1,
0.4455388, -0.2861341, 2.194813, 1, 1, 1, 1, 1,
0.4469559, 1.70339, -0.5284996, 1, 1, 1, 1, 1,
0.4472738, -0.9274219, 2.559803, 1, 1, 1, 1, 1,
0.4494199, 1.646313, 0.3744393, 1, 1, 1, 1, 1,
0.4504011, 0.5301181, -0.625927, 1, 1, 1, 1, 1,
0.4504024, 0.3269141, 1.902573, 1, 1, 1, 1, 1,
0.4514278, 0.3239688, -0.5134316, 1, 1, 1, 1, 1,
0.4537878, 0.8362672, 1.849802, 1, 1, 1, 1, 1,
0.4568578, -0.5557079, 1.801432, 1, 1, 1, 1, 1,
0.4593723, -1.293804, 3.384588, 1, 1, 1, 1, 1,
0.4618746, 1.051653, -0.3604114, 1, 1, 1, 1, 1,
0.4661048, 1.20686, -0.5207105, 0, 0, 1, 1, 1,
0.4704155, -0.6538693, 3.748949, 1, 0, 0, 1, 1,
0.4705803, 0.8286427, 0.487932, 1, 0, 0, 1, 1,
0.4726479, 0.4356138, 2.249009, 1, 0, 0, 1, 1,
0.4762568, -0.4500736, 2.46332, 1, 0, 0, 1, 1,
0.4769738, -2.262828, 1.055257, 1, 0, 0, 1, 1,
0.4774681, -0.4924593, 1.455004, 0, 0, 0, 1, 1,
0.4800856, 1.094237, -0.1610216, 0, 0, 0, 1, 1,
0.4836397, -0.2143518, 4.50209, 0, 0, 0, 1, 1,
0.487439, 0.8065403, 1.84166, 0, 0, 0, 1, 1,
0.4874395, 2.001185, 1.45791, 0, 0, 0, 1, 1,
0.4877802, 0.1932112, 3.102546, 0, 0, 0, 1, 1,
0.4890819, -0.08482744, 1.589139, 0, 0, 0, 1, 1,
0.4915913, 0.5163868, 0.1992063, 1, 1, 1, 1, 1,
0.4928863, 1.04215, 2.875524, 1, 1, 1, 1, 1,
0.4938019, -1.495836, 3.4033, 1, 1, 1, 1, 1,
0.4950648, -0.01381545, 1.89596, 1, 1, 1, 1, 1,
0.5076748, -0.9631194, 2.414869, 1, 1, 1, 1, 1,
0.508947, -0.2690315, 1.483971, 1, 1, 1, 1, 1,
0.5178929, -1.317425, 2.016454, 1, 1, 1, 1, 1,
0.5207665, 1.254618, 1.280447, 1, 1, 1, 1, 1,
0.5224143, 0.1721497, 1.954473, 1, 1, 1, 1, 1,
0.5243977, 0.413864, 1.382022, 1, 1, 1, 1, 1,
0.5254709, 0.1393614, 1.56207, 1, 1, 1, 1, 1,
0.5280273, -0.1462504, 1.913647, 1, 1, 1, 1, 1,
0.5282974, 0.7395138, 1.616247, 1, 1, 1, 1, 1,
0.5307949, -1.495156, 1.8979, 1, 1, 1, 1, 1,
0.5342795, 0.9855565, 0.8754626, 1, 1, 1, 1, 1,
0.5436174, 0.1949787, 2.196237, 0, 0, 1, 1, 1,
0.5445378, 0.7318295, 0.05060064, 1, 0, 0, 1, 1,
0.5501666, 1.677939, -0.417174, 1, 0, 0, 1, 1,
0.5564979, 0.9434779, 0.8377189, 1, 0, 0, 1, 1,
0.5577831, 1.608404, -0.3147209, 1, 0, 0, 1, 1,
0.5597234, 0.1073575, 3.275334, 1, 0, 0, 1, 1,
0.5598917, 0.4847112, 0.4794691, 0, 0, 0, 1, 1,
0.5615954, -0.5622452, 3.533993, 0, 0, 0, 1, 1,
0.5687812, -0.007640424, 2.530909, 0, 0, 0, 1, 1,
0.5711334, 0.2196429, 1.527402, 0, 0, 0, 1, 1,
0.5747253, 0.3003609, 1.000888, 0, 0, 0, 1, 1,
0.5790142, -1.107414, 3.022938, 0, 0, 0, 1, 1,
0.5810197, -0.756628, 1.142054, 0, 0, 0, 1, 1,
0.5851169, 0.1816971, -0.1472482, 1, 1, 1, 1, 1,
0.5854483, -0.6608601, 3.259431, 1, 1, 1, 1, 1,
0.5885903, 1.336782, 1.332112, 1, 1, 1, 1, 1,
0.5922825, -1.523394, 4.040275, 1, 1, 1, 1, 1,
0.5923473, 0.6516361, 1.140182, 1, 1, 1, 1, 1,
0.5924905, -0.2637221, 1.978839, 1, 1, 1, 1, 1,
0.5957196, 0.3271268, 2.211457, 1, 1, 1, 1, 1,
0.6030597, 0.8395142, 2.320122, 1, 1, 1, 1, 1,
0.6054239, -2.475764, 3.722923, 1, 1, 1, 1, 1,
0.6086132, 2.015809, 0.09656955, 1, 1, 1, 1, 1,
0.6093825, -0.4346904, 1.77485, 1, 1, 1, 1, 1,
0.6106491, 3.644445, -1.092719, 1, 1, 1, 1, 1,
0.6192089, -1.561033, 2.572723, 1, 1, 1, 1, 1,
0.6201203, 0.7531703, 0.1033341, 1, 1, 1, 1, 1,
0.6214613, 1.628449, 0.5780441, 1, 1, 1, 1, 1,
0.6221498, 1.375446, 0.6126444, 0, 0, 1, 1, 1,
0.6312417, 1.596667, 1.457766, 1, 0, 0, 1, 1,
0.6322773, -1.475994, 2.881673, 1, 0, 0, 1, 1,
0.6336666, -0.1827413, 2.032524, 1, 0, 0, 1, 1,
0.6399727, -0.3327726, 4.537144, 1, 0, 0, 1, 1,
0.6525784, -1.033299, 2.682201, 1, 0, 0, 1, 1,
0.6562492, -0.3430693, 0.7681926, 0, 0, 0, 1, 1,
0.6590497, 0.4835613, 0.7818934, 0, 0, 0, 1, 1,
0.6627125, 0.8585982, -0.846849, 0, 0, 0, 1, 1,
0.6657414, 0.6432391, 0.6072041, 0, 0, 0, 1, 1,
0.6678934, 0.2563448, 0.982459, 0, 0, 0, 1, 1,
0.6682457, -0.2043917, 1.855076, 0, 0, 0, 1, 1,
0.669112, 0.2908998, -0.1806648, 0, 0, 0, 1, 1,
0.6701429, 0.7783225, 0.7810693, 1, 1, 1, 1, 1,
0.6750077, -0.6169393, 3.562744, 1, 1, 1, 1, 1,
0.6769778, 0.3166188, 1.484581, 1, 1, 1, 1, 1,
0.6798109, -1.444394, 1.600371, 1, 1, 1, 1, 1,
0.6835405, -0.5447608, 1.098545, 1, 1, 1, 1, 1,
0.6902293, 0.7885939, 0.7746255, 1, 1, 1, 1, 1,
0.6910822, -0.8726528, 1.519702, 1, 1, 1, 1, 1,
0.6967991, 1.983431, 0.2512195, 1, 1, 1, 1, 1,
0.6982836, -0.4444758, 0.9436436, 1, 1, 1, 1, 1,
0.7002196, 1.167387, 0.1663611, 1, 1, 1, 1, 1,
0.7211757, -1.763952, 2.753323, 1, 1, 1, 1, 1,
0.7241078, 0.3580234, 1.574815, 1, 1, 1, 1, 1,
0.7293519, 0.97065, -0.5727103, 1, 1, 1, 1, 1,
0.7303743, 0.08750307, 1.445828, 1, 1, 1, 1, 1,
0.7410856, -0.6088888, 2.145751, 1, 1, 1, 1, 1,
0.7421052, 0.5494843, 0.770101, 0, 0, 1, 1, 1,
0.7441168, -0.1380993, 2.313663, 1, 0, 0, 1, 1,
0.7450889, 0.2341168, 0.1824545, 1, 0, 0, 1, 1,
0.7492916, -0.6094336, 0.7958283, 1, 0, 0, 1, 1,
0.7518917, 0.7240847, 0.8488858, 1, 0, 0, 1, 1,
0.7529765, 0.360492, 1.138023, 1, 0, 0, 1, 1,
0.7540146, -1.532076, 3.34269, 0, 0, 0, 1, 1,
0.7625675, 0.6910785, 2.132435, 0, 0, 0, 1, 1,
0.7626649, 0.8307928, 0.1263912, 0, 0, 0, 1, 1,
0.7740371, -0.3093977, 2.529427, 0, 0, 0, 1, 1,
0.7778227, 0.2975264, 1.909247, 0, 0, 0, 1, 1,
0.7829098, -0.5179484, 1.688878, 0, 0, 0, 1, 1,
0.7853018, 1.600995, -0.2329505, 0, 0, 0, 1, 1,
0.7878268, 0.6701403, 1.917367, 1, 1, 1, 1, 1,
0.788095, -0.165028, 0.4681591, 1, 1, 1, 1, 1,
0.7914342, 0.4288703, 0.2144495, 1, 1, 1, 1, 1,
0.7918484, -0.6672026, 1.555412, 1, 1, 1, 1, 1,
0.7918899, 0.6547919, 0.2521042, 1, 1, 1, 1, 1,
0.792806, -0.7524415, 1.822723, 1, 1, 1, 1, 1,
0.7941667, -0.346994, 3.292237, 1, 1, 1, 1, 1,
0.7962324, -1.568664, 2.486508, 1, 1, 1, 1, 1,
0.798393, 0.1656331, 0.3685462, 1, 1, 1, 1, 1,
0.8024204, -0.1987212, 0.07479874, 1, 1, 1, 1, 1,
0.808835, -0.5003616, 2.274265, 1, 1, 1, 1, 1,
0.8163641, 0.7091847, 0.2872107, 1, 1, 1, 1, 1,
0.8224846, 0.02372876, 0.9475768, 1, 1, 1, 1, 1,
0.8280563, -1.198645, 4.010249, 1, 1, 1, 1, 1,
0.8314474, -1.820487, 2.081617, 1, 1, 1, 1, 1,
0.8388184, -0.9404198, 3.244106, 0, 0, 1, 1, 1,
0.8509524, 0.4446311, 2.528999, 1, 0, 0, 1, 1,
0.8513246, 0.1341127, 1.864583, 1, 0, 0, 1, 1,
0.8522242, 0.9131393, 0.9235368, 1, 0, 0, 1, 1,
0.8548919, 0.21075, 0.2456156, 1, 0, 0, 1, 1,
0.8549064, -1.174206, 2.64301, 1, 0, 0, 1, 1,
0.855858, 1.133995, 1.279243, 0, 0, 0, 1, 1,
0.8570185, 1.073202, -0.285626, 0, 0, 0, 1, 1,
0.8636192, 1.878025, -0.3078856, 0, 0, 0, 1, 1,
0.8642538, 0.08793779, 1.609935, 0, 0, 0, 1, 1,
0.8706279, -0.8581121, 1.591425, 0, 0, 0, 1, 1,
0.8708667, -1.231067, 2.198513, 0, 0, 0, 1, 1,
0.8815389, 0.1956832, 1.069942, 0, 0, 0, 1, 1,
0.8828552, -0.7384779, 1.397126, 1, 1, 1, 1, 1,
0.8873042, -1.898811, 2.734113, 1, 1, 1, 1, 1,
0.888043, 0.7397131, 1.888624, 1, 1, 1, 1, 1,
0.8944294, -0.3115509, 1.660936, 1, 1, 1, 1, 1,
0.8976868, 0.1810555, 1.643894, 1, 1, 1, 1, 1,
0.903184, 0.9685474, 0.07731682, 1, 1, 1, 1, 1,
0.9039093, 0.5814707, 1.189659, 1, 1, 1, 1, 1,
0.9064353, -0.7132642, 1.877592, 1, 1, 1, 1, 1,
0.9106573, 0.5827525, 0.3305191, 1, 1, 1, 1, 1,
0.9132787, 0.9612328, -0.6215081, 1, 1, 1, 1, 1,
0.9146159, -1.556658, 3.032258, 1, 1, 1, 1, 1,
0.9239605, 0.4138485, 2.630976, 1, 1, 1, 1, 1,
0.9279079, 1.593295, 1.350802, 1, 1, 1, 1, 1,
0.9279433, 0.813889, 0.9510168, 1, 1, 1, 1, 1,
0.9335555, 0.4584237, 0.1578661, 1, 1, 1, 1, 1,
0.9380062, 0.6774639, -0.3972082, 0, 0, 1, 1, 1,
0.9387335, 2.11179, 1.582754, 1, 0, 0, 1, 1,
0.9412211, 0.6405425, 1.239753, 1, 0, 0, 1, 1,
0.9429812, 1.803134, 0.3112496, 1, 0, 0, 1, 1,
0.9736196, 0.6632604, 0.8774589, 1, 0, 0, 1, 1,
0.9809943, 0.2381318, 1.247021, 1, 0, 0, 1, 1,
0.9823214, 0.9338302, 2.714444, 0, 0, 0, 1, 1,
0.997814, 1.972576, 0.5993915, 0, 0, 0, 1, 1,
0.9987637, 0.5745073, 1.489314, 0, 0, 0, 1, 1,
1.000976, 0.08920778, 2.334733, 0, 0, 0, 1, 1,
1.006846, -0.5668018, 2.828995, 0, 0, 0, 1, 1,
1.007119, 0.5269399, -0.3284534, 0, 0, 0, 1, 1,
1.007675, -1.822989, 3.03049, 0, 0, 0, 1, 1,
1.00961, 0.0239075, -1.602199, 1, 1, 1, 1, 1,
1.018271, -1.310948, 4.035953, 1, 1, 1, 1, 1,
1.019891, 1.615407, 2.204115, 1, 1, 1, 1, 1,
1.020191, 0.5265617, 3.314946, 1, 1, 1, 1, 1,
1.03291, 0.4893984, 0.9700392, 1, 1, 1, 1, 1,
1.039272, 1.583858, 1.119698, 1, 1, 1, 1, 1,
1.042135, 0.1111279, 0.9981199, 1, 1, 1, 1, 1,
1.042668, -0.8044816, 2.899553, 1, 1, 1, 1, 1,
1.046446, 1.525724, 0.6652654, 1, 1, 1, 1, 1,
1.057619, 0.6474776, 0.4722016, 1, 1, 1, 1, 1,
1.067395, 2.744483, -1.176034, 1, 1, 1, 1, 1,
1.067496, -1.200144, 4.488573, 1, 1, 1, 1, 1,
1.069259, 1.053732, 0.8546202, 1, 1, 1, 1, 1,
1.072775, 0.3326427, 1.801259, 1, 1, 1, 1, 1,
1.074617, 0.3138441, 0.1543872, 1, 1, 1, 1, 1,
1.079139, 1.174616, 1.257065, 0, 0, 1, 1, 1,
1.086662, -0.4907213, 1.947673, 1, 0, 0, 1, 1,
1.088171, 0.1277454, -0.8684456, 1, 0, 0, 1, 1,
1.088227, 0.8836246, 0.996969, 1, 0, 0, 1, 1,
1.090997, 0.6873433, 0.1372409, 1, 0, 0, 1, 1,
1.091931, -0.09918532, 2.680018, 1, 0, 0, 1, 1,
1.095851, -0.4938042, 1.416104, 0, 0, 0, 1, 1,
1.098054, 0.1206772, 2.284094, 0, 0, 0, 1, 1,
1.103625, 1.007292, -0.3827138, 0, 0, 0, 1, 1,
1.120091, 1.004487, 0.2959721, 0, 0, 0, 1, 1,
1.121932, -0.2355184, 3.296212, 0, 0, 0, 1, 1,
1.126707, -2.098068, 1.88311, 0, 0, 0, 1, 1,
1.130996, 1.729643, 0.3891108, 0, 0, 0, 1, 1,
1.135282, 0.3307814, 1.588178, 1, 1, 1, 1, 1,
1.141482, 1.110398, 1.499879, 1, 1, 1, 1, 1,
1.142087, 0.6834359, 2.183576, 1, 1, 1, 1, 1,
1.144529, -0.7642591, 2.153356, 1, 1, 1, 1, 1,
1.153085, -0.9202957, 1.489521, 1, 1, 1, 1, 1,
1.153324, 1.399848, -1.79332, 1, 1, 1, 1, 1,
1.16613, -1.105895, 3.195188, 1, 1, 1, 1, 1,
1.17123, -0.4414345, 1.597103, 1, 1, 1, 1, 1,
1.171465, 0.07706352, 0.5968291, 1, 1, 1, 1, 1,
1.174374, -1.285922, 2.75668, 1, 1, 1, 1, 1,
1.180072, -0.2799519, 1.487415, 1, 1, 1, 1, 1,
1.187405, 0.6962233, 0.42255, 1, 1, 1, 1, 1,
1.187541, -0.9771879, 1.588624, 1, 1, 1, 1, 1,
1.189903, -0.4585242, 2.381379, 1, 1, 1, 1, 1,
1.193589, 1.805198, 1.449266, 1, 1, 1, 1, 1,
1.194171, 0.8612737, 0.9796558, 0, 0, 1, 1, 1,
1.194883, 0.6409253, 1.549331, 1, 0, 0, 1, 1,
1.196805, -0.9555687, 1.69495, 1, 0, 0, 1, 1,
1.197216, -0.2152166, 2.746251, 1, 0, 0, 1, 1,
1.200145, -0.5310029, 3.25879, 1, 0, 0, 1, 1,
1.20692, -1.052529, 1.056685, 1, 0, 0, 1, 1,
1.210772, 0.8022508, 1.480353, 0, 0, 0, 1, 1,
1.215546, 0.1290925, 0.3644211, 0, 0, 0, 1, 1,
1.22084, -0.8477079, 1.753672, 0, 0, 0, 1, 1,
1.237711, -0.5286585, 2.044469, 0, 0, 0, 1, 1,
1.239446, 0.9435589, 1.559523, 0, 0, 0, 1, 1,
1.241023, -2.887121, 3.435488, 0, 0, 0, 1, 1,
1.245044, -0.7159329, 2.224319, 0, 0, 0, 1, 1,
1.246783, 0.7200581, 2.172063, 1, 1, 1, 1, 1,
1.248422, -0.2271427, 1.299268, 1, 1, 1, 1, 1,
1.24976, 1.061498, 1.94955, 1, 1, 1, 1, 1,
1.249777, 0.1690064, 0.6341192, 1, 1, 1, 1, 1,
1.25061, 1.195934, 1.099002, 1, 1, 1, 1, 1,
1.255031, -0.9140165, 2.883456, 1, 1, 1, 1, 1,
1.255079, -2.801784, 2.166797, 1, 1, 1, 1, 1,
1.265182, -1.031831, 0.1776096, 1, 1, 1, 1, 1,
1.275064, 0.9305756, -0.324255, 1, 1, 1, 1, 1,
1.277311, 0.2905268, 1.038393, 1, 1, 1, 1, 1,
1.278273, -1.454513, 2.582546, 1, 1, 1, 1, 1,
1.280763, -0.1557626, 3.070449, 1, 1, 1, 1, 1,
1.285922, -0.6781979, 1.879253, 1, 1, 1, 1, 1,
1.288806, 0.3970425, 0.1270694, 1, 1, 1, 1, 1,
1.294989, 1.643643, 0.7378686, 1, 1, 1, 1, 1,
1.31442, -0.6365609, 2.063323, 0, 0, 1, 1, 1,
1.316249, 0.2496061, 0.5023524, 1, 0, 0, 1, 1,
1.317474, -0.1158326, 2.474923, 1, 0, 0, 1, 1,
1.341357, -0.7999581, 2.427564, 1, 0, 0, 1, 1,
1.341878, 0.237017, 3.223118, 1, 0, 0, 1, 1,
1.348629, -0.9235711, 1.90894, 1, 0, 0, 1, 1,
1.354312, -1.427445, 3.831813, 0, 0, 0, 1, 1,
1.356772, 2.291329, 2.907557, 0, 0, 0, 1, 1,
1.358539, -1.541417, 4.159599, 0, 0, 0, 1, 1,
1.362484, -0.880308, 0.8043287, 0, 0, 0, 1, 1,
1.364719, -0.0652806, 1.98436, 0, 0, 0, 1, 1,
1.373892, -1.481939, 4.398261, 0, 0, 0, 1, 1,
1.375802, 1.318106, 3.033087, 0, 0, 0, 1, 1,
1.398124, 2.158069, -0.2213829, 1, 1, 1, 1, 1,
1.399073, -0.2161589, 1.420773, 1, 1, 1, 1, 1,
1.404212, -1.136138, 1.705888, 1, 1, 1, 1, 1,
1.418385, 0.0827539, 1.921841, 1, 1, 1, 1, 1,
1.422831, 1.534785, -0.229183, 1, 1, 1, 1, 1,
1.450315, 0.4021639, 1.863224, 1, 1, 1, 1, 1,
1.450885, -0.6119905, 1.091117, 1, 1, 1, 1, 1,
1.465392, 1.441388, -1.348221, 1, 1, 1, 1, 1,
1.465934, 0.37728, 1.172825, 1, 1, 1, 1, 1,
1.473883, -0.6237302, 2.221287, 1, 1, 1, 1, 1,
1.474687, 2.696079, 1.902481, 1, 1, 1, 1, 1,
1.475483, -1.675237, 2.273995, 1, 1, 1, 1, 1,
1.478862, 0.6919422, 2.541433, 1, 1, 1, 1, 1,
1.479765, -1.457221, 2.437895, 1, 1, 1, 1, 1,
1.485232, 1.050286, 0.3210188, 1, 1, 1, 1, 1,
1.503318, -0.50466, 2.36031, 0, 0, 1, 1, 1,
1.509242, -0.6400968, 2.531117, 1, 0, 0, 1, 1,
1.519311, 1.408119, 1.267883, 1, 0, 0, 1, 1,
1.52467, 2.320124, -0.903136, 1, 0, 0, 1, 1,
1.525206, 0.6527842, 0.8022138, 1, 0, 0, 1, 1,
1.536815, -0.02441553, 3.068181, 1, 0, 0, 1, 1,
1.537184, 1.20349, 1.696779, 0, 0, 0, 1, 1,
1.551667, -1.943531, 2.179718, 0, 0, 0, 1, 1,
1.583908, -0.7076471, 2.507741, 0, 0, 0, 1, 1,
1.590349, 0.8909525, 2.788268, 0, 0, 0, 1, 1,
1.590972, 0.3037169, 2.323794, 0, 0, 0, 1, 1,
1.595635, -1.607724, 2.435106, 0, 0, 0, 1, 1,
1.599938, 0.1866501, 0.6547201, 0, 0, 0, 1, 1,
1.637685, 2.309599, 0.9647337, 1, 1, 1, 1, 1,
1.650763, 0.009264621, 0.8292887, 1, 1, 1, 1, 1,
1.66278, 1.075317, 1.099865, 1, 1, 1, 1, 1,
1.675379, 1.272681, 1.001242, 1, 1, 1, 1, 1,
1.679836, 0.5646395, 0.2899945, 1, 1, 1, 1, 1,
1.680301, -1.081507, 3.492906, 1, 1, 1, 1, 1,
1.685514, 0.5416894, 1.73771, 1, 1, 1, 1, 1,
1.691806, -1.057803, 2.144846, 1, 1, 1, 1, 1,
1.697428, -0.7060387, 3.310587, 1, 1, 1, 1, 1,
1.706812, 0.6870159, 2.868817, 1, 1, 1, 1, 1,
1.707857, -0.4933635, 2.666922, 1, 1, 1, 1, 1,
1.71541, 0.02927491, 1.520732, 1, 1, 1, 1, 1,
1.71807, 1.610555, 0.5851514, 1, 1, 1, 1, 1,
1.727507, -0.8890667, 2.671336, 1, 1, 1, 1, 1,
1.727842, -1.190948, 3.791579, 1, 1, 1, 1, 1,
1.729256, 2.381115, 1.080083, 0, 0, 1, 1, 1,
1.730236, -0.01872567, 1.265806, 1, 0, 0, 1, 1,
1.775955, 0.01344458, 2.56094, 1, 0, 0, 1, 1,
1.78814, -1.981553, 3.068774, 1, 0, 0, 1, 1,
1.788285, 2.8467, -0.2348989, 1, 0, 0, 1, 1,
1.796576, -0.7603143, 2.549413, 1, 0, 0, 1, 1,
1.817791, 0.8076602, 0.8934812, 0, 0, 0, 1, 1,
1.818115, -0.4572456, 2.969795, 0, 0, 0, 1, 1,
1.840167, 0.9431919, 2.15271, 0, 0, 0, 1, 1,
1.84093, 0.3522203, 1.128744, 0, 0, 0, 1, 1,
1.844047, -0.9261382, 2.377157, 0, 0, 0, 1, 1,
1.847212, -0.05111191, 2.361191, 0, 0, 0, 1, 1,
1.854841, 0.2121728, 2.421417, 0, 0, 0, 1, 1,
1.861898, -0.5668893, 1.023406, 1, 1, 1, 1, 1,
1.869257, -1.015134, 2.467591, 1, 1, 1, 1, 1,
1.881928, -0.8034176, 0.6798931, 1, 1, 1, 1, 1,
1.88432, 0.2946227, 1.546766, 1, 1, 1, 1, 1,
1.892303, 0.7552193, 1.793844, 1, 1, 1, 1, 1,
1.892919, -0.9346339, 2.305555, 1, 1, 1, 1, 1,
1.898689, 0.6038059, 2.671512, 1, 1, 1, 1, 1,
1.94061, 0.5599375, 2.399069, 1, 1, 1, 1, 1,
1.987501, 0.7554404, 1.059666, 1, 1, 1, 1, 1,
2.015979, -1.200678, 1.32491, 1, 1, 1, 1, 1,
2.025739, -0.04548379, 2.50567, 1, 1, 1, 1, 1,
2.033626, -0.3588437, 2.594727, 1, 1, 1, 1, 1,
2.088761, -0.007687175, 1.74589, 1, 1, 1, 1, 1,
2.10931, -0.7450597, 2.857894, 1, 1, 1, 1, 1,
2.14298, 1.788264, 0.5024438, 1, 1, 1, 1, 1,
2.170536, 0.02842906, 0.656676, 0, 0, 1, 1, 1,
2.182153, -1.654501, 0.1022643, 1, 0, 0, 1, 1,
2.229155, -0.233132, 0.02685299, 1, 0, 0, 1, 1,
2.236661, -1.152186, 1.649353, 1, 0, 0, 1, 1,
2.252018, 0.218409, 3.08108, 1, 0, 0, 1, 1,
2.25542, -0.6114414, 2.716188, 1, 0, 0, 1, 1,
2.278227, -0.02699227, 0.3185654, 0, 0, 0, 1, 1,
2.295285, 0.5910339, 1.184132, 0, 0, 0, 1, 1,
2.298322, 0.4984207, 2.101237, 0, 0, 0, 1, 1,
2.311153, 0.21467, 3.305965, 0, 0, 0, 1, 1,
2.330817, 0.8900669, 1.926313, 0, 0, 0, 1, 1,
2.374186, -0.83215, 2.333003, 0, 0, 0, 1, 1,
2.378028, -0.8468323, 3.136471, 0, 0, 0, 1, 1,
2.455628, -0.0494299, 1.536429, 1, 1, 1, 1, 1,
2.579119, 1.736019, 0.9804422, 1, 1, 1, 1, 1,
2.588845, -0.2242083, 1.856852, 1, 1, 1, 1, 1,
2.630029, -1.834057, 0.727752, 1, 1, 1, 1, 1,
2.819137, 1.364512, 1.732778, 1, 1, 1, 1, 1,
3.186443, 1.513154, 0.7470977, 1, 1, 1, 1, 1,
3.503716, -0.3916571, 2.264731, 1, 1, 1, 1, 1
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
var radius = 9.983533;
var distance = 35.06674;
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
mvMatrix.translate( 0.05169296, -0.09323168, 0.4602633 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.06674);
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